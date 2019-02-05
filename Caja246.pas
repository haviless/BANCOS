unit Caja246;
{  28/12/2001 PJSV, SE MODIFICARON PARA PODER USER EL SLCONTABILIZA
 CAJADM,CAJA001,CAJA201,CAJA228,CAJA204,CAJA209,CAJA218,CAJA235,CAJA240,CAJA233
 // SE AGREGARON PARACONCESIONES
 CAJA245,CAJA246
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Buttons, oaContabiliza,Db;

type
  TFToolDeposito = class(TForm)
    pnlDeposito: TPanel;
    dtpFechaDesde: TDateTimePicker;
    z2bbtnOK: TBitBtn;
    rgDeposito: TRadioGroup;
    Timer1: TTimer;
    z2bbtnCont: TBitBtn;
    dtpFechaHasta: TDateTimePicker;
    chbRango: TCheckBox;
    lblDesde: TLabel;
    lblHasta: TLabel;
    lblAcep: TLabel;
    pbAvance: TProgressBar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure chbRangoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure z2bbtnContClick(Sender: TObject);
  private
    { Private declarations }
   procedure RQ;
   procedure Contabiliza;
   procedure Contab_EgrCaja;
   procedure Contab_RegCxP;
  public
    { Public declarations }
  end;

var
  FToolDeposito: TFToolDeposito;
  wSql : String;

implementation
uses CajaDM,Caja001;
{$R *.DFM}

procedure TFToolDeposito.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFToolDeposito.z2bbtnOKClick(Sender: TObject);
begin
    RQ;
end;

procedure TFToolDeposito.RQ;
var
 sFechad,sFechah : string;
begin
  sFechad := formatdatetime('YYYY-MM-DD',dtpFechaDesde.DateTime);
  sFechah := formatdatetime('YYYY-MM-DD',dtpFechahasta.DateTime);
  If rgDeposito.ItemIndex = 0 then
    wsql := '(DEPCHECK IS NULL OR DEPCHECK='''')'
  else
   If rgDeposito.ItemIndex = 1 then
     wsql := 'DEPCHECK='+quotedstr('S');
  If chbRango.Checked then
   wSql := wSql + ' AND (DEPFECHA>='+quotedstr(sFechad)+' and DEPFECHA <='+quotedstr(sFechad)+')';
  MantConcesion.SetFilter(wSql);
  MantConcesion.RefreshFilter;
  MantConcesion.ClientDataSet.indexFieldNames := 'DEPFECHA;CONCESID;DEPMONTO';
end;

procedure TFToolDeposito.Timer1Timer(Sender: TObject);
begin
   Timer1.Enabled := False;
   dtpFechadesde.date := DateS;
   dtpFechahasta.date := DateS;
   RQ
end;

procedure TFToolDeposito.chbRangoClick(Sender: TObject);
begin
   lblDesde.Visible := chbRango.Checked;
   lblHasta.Visible := chbRango.Checked;
   dtpFechaDesde.Visible := chbRango.Checked;
   dtpFechaHasta.Visible := chbRango.Checked;
end;

procedure TFToolDeposito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   MantConcesion.ClientDataSet.indexFieldNames := '';
end;

procedure TFToolDeposito.z2bbtnContClick(Sender: TObject);
var
 xSql,sFechad,sFechah : string;
begin
  Screen.Cursor := crHourglass;
  pbAvance.Position := 0;
  pbAvance.Max := 2;
  pbAvance.Step := 1;
  pbAvance.VISIBLE := tRUE;
  lblAcep.VISIBLE := tRUE;

  DM1.cdsEgrCaja.close;
  sFechad := formatdatetime('YYYY-MM-DD',dtpFechaDesde.DateTime);
  sFechah := formatdatetime('YYYY-MM-DD',dtpFechahasta.DateTime);
  wsql := 'DEPCHECK='+quotedstr('S');
  If chbRango.Checked then
   wSql := wSql + ' AND (DEPFECHA>='+quotedstr(sFechad)+' and DEPFECHA <='+quotedstr(sFechad)+')';
  MantConcesion.SetFilter(wSql);
  MantConcesion.RefreshFilter;
  MantConcesion.ClientDataSet.indexFieldNames := 'DEPFECHA;CONCESID;DEPMONTO';
  //** paso 1
  if (pbAvance.Position < pbAvance.Max) then pbAvance.Stepit;

  xSql := 'SELECT * FROM CAJA302 WHERE EC_PROCE='+quotedstr('LIQ')+' and (ECCONTA<>'+quotedstr('S')+
          ' OR ECCONTA IS NULL OR ECCONTA='''') and ECESTADO='+quotedstr('C');
  If chbRango.Checked then
   xSql := xsql + ' and (ECFCOMP>='+quotedstr(sFechad)+' and ECFCOMP <='+quotedstr(sFechad)+')';
  dm1.cdsEgrCaja.Close;
  dm1.cdsEgrCaja.DataRequest(xSql);
  dm1.cdsEgrCaja.Open;

  // paso 2
  if (pbAvance.Position < pbAvance.Max) then pbAvance.Stepit;

  if dm1.cdsEgrCaja.Recordcount > 0 then
   begin
    pbAvance.Position := 0;
    pbAvance.Max := 1+ (dm1.cdsEgrCaja.RecordCount * 3);
    pbAvance.Step := 1;

    // paso 1
    DM1.cdsNivel.open;
    if (pbAvance.Position < pbAvance.Max) then pbAvance.Stepit;

    while not dm1.cdsEgrCaja.eof do
     begin
        xSQL:='Select * from CAJA301 '
             +'Where CIAID='+quotedstr(DM1.cdsEgrCaja.FieldByName('CIAID').AsString)+' and '
             +' ECANOMM='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString)+' and '
             +' TDIARID='+quotedstr(DM1.cdsEgrCaja.FieldByName('TDIARID').AsString)+' and '
             +' ECNOCOMP='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
             +' and DOCMOD='+quotedstr('LIQ');
        DM1.cdsRegCxP.Close;
        DM1.cdsRegCxP.DataRequest( xSQL );
        DM1.cdsRegCxP.Open;
        // paso 2 - 1
        if (pbAvance.Position < pbAvance.Max) then pbAvance.Stepit;

        Contabiliza;             // Realiza la generacion del Asiento
        // paso 2 - 2
        if (pbAvance.Position < pbAvance.Max) then pbAvance.Stepit;


        if SOLConta(DM1.cdsEgrCaja.FieldByName('CIAID').AsString,
                    DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
                    DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                    DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                    dm1.SRV_D, 'C', DM1.wModulo, DM1.cdsCNT311, DM1.cdsNivel,
                    DM1.cdsResultSet, DM1.DCOM1, Self ) then
         begin
          // paso 2 - 3
          if (pbAvance.Position < pbAvance.Max) then pbAvance.Stepit;

  {        DM1.cdsEgrCaja.Edit;
          DM1.cdsEgrCaja.FieldByName('ECConta').AsString :='S';   //Establece como Contabilizado el flag
          DM1.cdsEgrCaja.ApplyUpdates(0);
  }
         end;
        dm1.cdsEgrCaja.next;
     end;
   end
  else
   showmessage('No hay registros a Contabilizar');
  pbAvance.VISIBLE := False;
  lblAcep.VISIBLE := False;
  Screen.Cursor := crDefault;
end;

procedure TFToolDeposito.Contabiliza;
var
   xRegAct : TBookMark;
   xSQL    : String;
begin
   // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera
   xSQL:='Select * from CAJA316 Where CIAID='''' and '+
         'CNTANOMM='''' and TDIARID='''' and CNTCOMPROB='''' ';
   DM1.cdsCNT311.Close;
   DM1.cdsCNT311.DataRequest( xSQL );
   DM1.cdsCNT311.Open;
   DM1.cdsCNT311.Insert;
   Contab_EgrCaja;

    DM1.cdsRegCxP.DisableControls;
    xRegAct := DM1.cdsRegCxP.GetBookmark;
    DM1.cdsRegCxP.First;

   // GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde el Detalle
    While not DM1.cdsRegCxP.Eof do
     Begin
       DM1.cdsCNT311.Insert;
       Contab_RegCxP;
       DM1.cdsRegCxP.Next;
     end;

    DM1.cdsRegCxP.GotoBookmark(xRegAct);
    DM1.cdsRegCxP.FreeBookmark(xRegAct);
    DM1.cdsRegCxP.EnableControls;
    //Actualizamos en la tabla de Contabilidad
    DM1.AplicaDatos(dm1.cdsCNT311,'CNT311');
//    DM1.cdsCnt311.ApplyUpdates(0);

end;

procedure TFToolDeposito.Contab_EgrCaja;
begin
   DM1.cdsCnt311.FieldByName('CIAID').AsString    :=  DM1.cdsEgrcaja.FieldByName('CIAID').AsString ;
   DM1.cdsCnt311.FieldByName('TDIARID').AsString  :=  DM1.cdsEgrCaja.FieldByName('TDIARID').AsString ;
   DM1.cdsCnt311.FieldByName('CNTCOMPROB').AsString :=  DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString ;
   DM1.cdsCnt311.FieldByName('CNTANO').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECANO').AsString ;
   DM1.cdsCnt311.FieldByName('CNTANOMM').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString ;
   DM1.cdsCnt311.FieldByName('CNTLOTE').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECLOTE').AsString ;
   DM1.cdsCnt311.FieldByName('CUENTAID').AsString :=  DM1.cdsEgrCaja.FieldByName('CUENTAID').AsString ;
   DM1.cdsCnt311.FieldByName('CLAUXID').AsString :=  DM1.cdsEgrCaja.FieldByName('CLAUXID').AsString ;
   DM1.cdsCnt311.FieldByName('AUXID').AsString :=  DM1.cdsEgrCaja.FieldByName('PROV').AsString ;
   DM1.cdsCnt311.FieldByName('DOCID').AsString    :=  DM1.cdsEgrCaja.FieldByName('DOCID').AsString ;
   DM1.cdsCnt311.FieldByName('CNTNODOC').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECNODOC').AsString ;
   DM1.cdsCnt311.FieldByName('CNTGLOSA').AsString := DM1.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
   DM1.cdsCnt311.FieldByName('CNTDH').AsString   := 'D';
   DM1.cdsCnt311.FieldByName('CNTTCAMBIO').AsString :=  DM1.cdsEgrCaja.FieldByName('ECTCAMB').AsString ;
   DM1.cdsCnt311.FieldByName('CNTMTOORI').AsString :=   DM1.cdsEgrCaja.FieldByName('ECMTOORI').AsString ;
   DM1.cdsCnt311.FieldByName('CNTMTOLOC').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECMTOLOC').AsString ;
   DM1.cdsCnt311.FieldByName('CNTMTOEXT').AsString :=  DM1.cdsEgrCaja.FieldByName('ECMTOEXT').AsString ;
   DM1.cdsCnt311.FieldByName('CNTFEMIS').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsString ;
   DM1.cdsCnt311.FieldByName('CNTFVCMTO').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsString ;
   DM1.cdsCnt311.FieldByName('CNTFCOMP').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsString ;
   DM1.cdsCnt311.FieldByName('CNTESTADO').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECESTADO').AsString ;
   DM1.cdsCnt311.FieldByName('CNTCUADRE').AsString  :=  'S';
   DM1.cdsCnt311.FieldByName('CNTUSER').AsString   :=  DM1.wUsuario;
   DM1.cdsCnt311.FieldByName('CNTFREG').AsString   :=  DateToStr(Date);
   DM1.cdsCnt311.FieldByName('CNTHREG').AsString   :=  TimeTostr(Time);
   DM1.cdsCnt311.FieldByName('CNTMM').AsString     :=  DM1.cdsEgrCaja.FieldByName('ECMM').AsString ;
   DM1.cdsCnt311.FieldByName('CNTDD').AsString     :=  DM1.cdsEgrCaja.FieldByName('ECDD').AsString ;
   DM1.cdsCnt311.FieldByName('CNTSS').AsString     :=  DM1.cdsEgrCaja.FieldByName('ECSS').AsString ;
   DM1.cdsCnt311.FieldByName('CNTSEM').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECSEM').AsString ;
   DM1.cdsCnt311.FieldByName('CNTTRI').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECTRI').AsString ;
   DM1.cdsCnt311.FieldByName('CNTAASS').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECAASS').AsString ;
   DM1.cdsCnt311.FieldByName('CNTAASEM').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECAASEM').AsString ;
   DM1.cdsCnt311.FieldByName('CNTAATRI').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECAATRI').AsString ;
   DM1.cdsCnt311.FieldByName('TMONID').AsString   :=  DM1.cdsEgrCaja.FieldByName('TMONID').AsString ;
   DM1.cdsCnt311.FieldByName('CNTMODDOC').AsString   := DM1.cdsEgrCaja.FieldByName('EC_PROCE').AsString ;
   DM1.cdsCnt311.FieldByName('CNTREG').AsString   := '1'; // POR DEFECTO, PORQUE SOLO HAY 2 REGISTROS, EL DE LA CABECERA Y EL DEL DETALLE
   DM1.cdsCnt311.FieldByName('CNTDEBEME').AsString := DM1.cdsEgrCaja.FieldByName('ECMTOEXT').AsString;
   DM1.cdsCnt311.FieldByName('CNTDEBEMN').AsString := DM1.cdsEgrCaja.FieldByName('ECMTOLOC').AsString;
   DM1.cdsCnt311.FieldByName('TDIARDES').AsString := dm1.DisplayDescrip('prvTGE','TGE104','TDIARABR','TDIARID='+quotedstr(DM1.cdsEgrCaja.FieldByName('TDIARID').AsString),'TDIARABR');
   DM1.cdsCnt311.FieldByName('CTADES').AsString   := dm1.DisplayDescrip('prvTGE','TGE202','CTAABR','CUENTAID='+quotedstr(DM1.cdsEgrCaja.FieldByName('CUENTAID').AsString),'CTAABR');
   DM1.cdsCnt311.FieldByName('DOCDES').AsString   :=  dm1.DisplayDescrip('prvTGE','TGE110','DOCABR','DOCID='+quotedstr(DM1.cdsEgrCaja.FieldByName('DOCID').AsString),'DOCABR');
   DM1.cdsCnt311.FieldByName('MODULO').AsString   := dm1.wModulo;
end;

procedure TFToolDeposito.Contab_RegCxP;
begin
   DM1.cdsCnt311.FieldByName('CIAID').AsString      := DM1.cdsRegCxP.FieldByName('CIAID').AsString ;
   DM1.cdsCnt311.FieldByName('TDIARID').AsString    := DM1.cdsRegCxP.FieldByName('TDIARID').AsString ;
   DM1.cdsCnt311.FieldByName('CNTCOMPROB').AsString := DM1.cdsRegCxP.FieldByName('ECNOCOMP').AsString ;
   DM1.cdsCnt311.FieldByName('CNTANO').AsString     := DM1.cdsEgrCaja.FieldByName('ECANO').AsString ;
   DM1.cdsCnt311.FieldByName('CNTANOMM').AsString   := DM1.cdsRegCxP.FieldByName('ECANOMM').AsString ;
   DM1.cdsCnt311.FieldByName('CNTLOTE').AsString    := DM1.cdsEgrCaja.FieldByName('ECLOTE').AsString ;
   DM1.cdsCnt311.FieldByName('CUENTAID').AsString   := DM1.cdsRegCxP.FieldByName('CUENTAID').AsString ;
   DM1.cdsCnt311.FieldByName('CLAUXID').AsString    := DM1.cdsRegCxP.FieldByName('CLAUXID').AsString ;
   DM1.cdsCnt311.FieldByName('AUXID').AsString      := DM1.cdsRegCxP.FieldByName('PROV').AsString ;
   DM1.cdsCnt311.FieldByName('DOCID').AsString      := DM1.cdsRegCxP.FieldByName('DOCID2').AsString ;
   DM1.cdsCnt311.FieldByName('CNTNODOC').AsString   := DM1.cdsRegCxP.FieldByName('CPNODOC').AsString ;
   DM1.cdsCnt311.FieldByName('CNTDH').AsString      := 'H';
   DM1.cdsCnt311.FieldByName('CNTTCAMBIO').AsString := DM1.cdsRegCxP.FieldByName('DETCDOC').AsString ;
   DM1.cdsCnt311.FieldByName('CNTMTOORI').AsString  := DM1.cdsRegCxP.FieldByName('DEMTOORI').AsString ;
   if DM1.cdsRegCxP.FieldByName('TMONID').AsString  = DM1.wtMonLoc then
     begin
      DM1.cdsCnt311.FieldByName('CNTMTOLOC').AsString  := DM1.cdsRegCxP.FieldByName('DEMTOLOC').AsString;
      DM1.cdsCnt311.FieldByName('CNTMTOEXT').AsString := FloatTostr(DM1.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat  / DM1.cdsRegCxP.FieldByName('DETCDOC').Asfloat) ;
    end
   else
    begin
      DM1.cdsCnt311.FieldByName('CNTMTOEXT').AsString := DM1.cdsRegCxP.FieldByName('DEMTOEXT').AsString ;
      DM1.cdsCnt311.FieldByName('CNTMTOLOC').AsString := FloatTostr(DM1.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat  * DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat);
    end;
   DM1.cdsCnt311.FieldByName('CNTFEMIS').AsString   := DM1.cdsRegCxP.FieldByName('CPFEMIS').AsString ;
   DM1.cdsCnt311.FieldByName('CNTFVCMTO').AsString  := DM1.cdsRegCxP.FieldByName('CPFVCMTO').AsString ;
   DM1.cdsCnt311.FieldByName('CNTFCOMP').AsString   := DM1.cdsRegCxP.FieldByName('DEFCOMP').AsString ;
   DM1.cdsCnt311.FieldByName('CNTSERIE').AsString   := DM1.cdsRegCxP.FieldByName('CPSERIE').AsString ;
   DM1.cdsCnt311.FieldByName('CNTCUADRE').AsString := 'S';
   DM1.cdsCnt311.FieldByName('CNTUSER').AsString    := DM1.wUsuario;
   DM1.cdsCnt311.FieldByName('CNTFREG').AsString    := DateToStr(DateS);
   DM1.cdsCnt311.FieldByName('CNTHREG').AsString    := TimeTostr(Time);
   DM1.cdsCnt311.FieldByName('CNTMM').AsString      := DM1.cdsRegCxP.FieldByName('DEMM').AsString ;
   DM1.cdsCnt311.FieldByName('CNTDD').AsString      := DM1.cdsRegCxP.FieldByName('DEDD').AsString ;
   DM1.cdsCnt311.FieldByName('CNTSS').AsString      := DM1.cdsRegCxP.FieldByName('DESS').AsString ;
   DM1.cdsCnt311.FieldByName('CNTSEM').AsString     := DM1.cdsRegCxP.FieldByName('DESEM').AsString ;
   DM1.cdsCnt311.FieldByName('CNTTRI').AsString     := DM1.cdsRegCxP.FieldByName('DETRI').AsString ;
   DM1.cdsCnt311.FieldByName('CNTAASS').AsString    := DM1.cdsRegCxP.FieldByName('DEAASS').AsString ;
   DM1.cdsCnt311.FieldByName('CNTAASEM').AsString   := DM1.cdsRegCxP.FieldByName('DEAASEM').AsString ;
   DM1.cdsCnt311.FieldByName('CNTAATRI').AsString   := DM1.cdsRegCxP.FieldByName('DEAATRI').AsString ;
   DM1.cdsCnt311.FieldByName('TMONID').AsString     := DM1.cdsRegCxP.FieldByName('TMONID').AsString ;
   DM1.cdsCnt311.FieldByName('CNTMODDOC').AsString  := DM1.cdsRegCxP.FieldByName('DOCMOD').AsString ;
   DM1.cdsCnt311.FieldByName('CNTREG').AsString     := '2'; // POR DEFECTO, PORQUE SOLO HAY 2 REGISTROS, EL DE LA CABECERA Y EL DEL DETALLE
   DM1.cdsCnt311.FieldByName('CNTHABEME').AsString  := DM1.cdsRegCxP.FieldByName('DEMTOEXT').AsString;
   DM1.cdsCnt311.FieldByName('CNTHABEMN').AsString  := DM1.cdsRegCxP.FieldByName('DEMTOLOC').AsString;
   DM1.cdsCnt311.FieldByName('TDIARDES').AsString   := dm1.DisplayDescrip('prvTGE','TGE104','TDIARABR','TDIARID='+quotedstr(DM1.cdsEgrCaja.FieldByName('TDIARID').AsString),'TDIARABR');
   DM1.cdsCnt311.FieldByName('CTADES').AsString     := dm1.DisplayDescrip('prvTGE','TGE202','CTAABR','CUENTAID='+quotedstr(DM1.cdsEgrCaja.FieldByName('CUENTAID').AsString),'CTAABR');
   DM1.cdsCnt311.FieldByName('DOCDES').AsString     := dm1.DisplayDescrip('prvTGE','TGE110','DOCABR','DOCID='+quotedstr(DM1.cdsEgrCaja.FieldByName('DOCID').AsString),'DOCABR');
   DM1.cdsCnt311.FieldByName('MODULO').AsString   := dm1.wModulo;
end;

end.

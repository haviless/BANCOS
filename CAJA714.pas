unit CAJA714;

// Actualizaciones
// HPC_201403_CAJA cambia control de diseño de reporte

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, wwdbedit, StdCtrls, wwdblook, Buttons, ComCtrls, ExtCtrls,
  ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppBands, ppCache, wwdbdatetimepicker, db, DBClient, wwclient, Wwdbdlg;

type
  TFConsultaIngresos = class(TForm)
    pnl: TPanel;
    gbPeriodo: TGroupBox;
    Label3: TLabel;
    lblCIA: TLabel;
    dbeCIA: TEdit;
    Label1: TLabel;
    bbtnCuadre: TBitBtn;
    ppdb1: TppDBPipeline;
    ppr1: TppReport;
    ppd1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    dtpFecha: TwwDBDateTimePicker;
    dblcCia: TwwDBLookupCombo;
    bbtnImprimeConta: TBitBtn;
    ppdb2: TppDBPipeline;
    Label2: TLabel;
    dtpHasta: TwwDBDateTimePicker;
    dblcUsuarios: TwwDBLookupCombo;
    dbeUsuario: TwwDBEdit;
    dblcdCnp22: TwwDBLookupComboDlg;
    edtCnp2: TEdit;
    cbDisenoRep: TCheckBox;
    sbDisenoRep: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure bbtnCuadreClick(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnImprimeContaClick(Sender: TObject);
    procedure dblcUsuariosNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcUsuariosExit(Sender: TObject);
    procedure dblcdCnp22Exit(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }
    cdsCIAID : TwwClientDataset ;
    wCptoGan  ,
    wCptoPer  ,
    wCtaGan   ,
    wCtaPer   : String ;
    xNReg  : Integer;
//    cAnoMM : String;
    procedure AsignaCompaDocs;
    procedure RecCptosDifC;
    procedure Contabiliza;
    procedure Contabiliza2;
    procedure Contab_IngCaja( cDH, cCuenta, cGlosa : String );
    procedure Contab_Doc;
    procedure AnulaComprobante( cCia, cTD, cAM, cNC : String);
  public
    { Public declarations }
  end;

var
  FConsultaIngresos: TFConsultaIngresos;

implementation

{$R *.dfm}

USES CajaDM;

procedure TFConsultaIngresos.FormCreate(Sender: TObject);
var
  xSQL : String;
begin

  xSQL:='Select USUCAJ from CAJ_USU_SUP '
       +'GROUP BY USUCAJ '
       +'ORDER BY USUCAJ';
  DMTE.cdsQry5.Close;
  DMTE.cdsQry5.DataRequest( xSQL );
  DMTE.cdsQry5.Open;
  dblcUsuarios.LookupTable:=DMTE.cdsQry5;

  xSQL:='Select CPTOID, CPTODES, CUENTAID from CAJA201 '
       +'WHERE CPTOIS=''I'' '
       +'ORDER BY CPTOID';
  DMTE.cdsQry3.Close;
  DMTE.cdsQry3.DataRequest( xSQL );
  DMTE.cdsQry3.Open;
  dblcdCnp22.LookupTable:=DMTE.cdsQry3;

  cdsCIAID := TwwClientdataset.Create(Self) ;
  cdsCIAID.CloneCursor( DMTE.cdsCia, True );
  dblcCia.LookUpTable:=cdsCIAID;
  cdsCIAID.SetKey;
  cdsCIAID.FieldByname('CIAID').AsString:='02';
  cdsCIAID.GotoKey;
  dblcCia.Text   :='02';
  dbeCia.Text    :=DMTE.DisplayDescrip('prvTGE','TGE101','CIAID, CIADES','CIAID='+quotedstr(dblcCia.Text),'CIADES');
  dtpFecha.Date  :=Date;
  dtpHasta.Date  :=Date;
end;

procedure TFConsultaIngresos.bbtnCuadreClick(Sender: TObject);
var
  xSQL, cUsers, cSQL, cUsuarios, cCaja : String;
begin

  if dblcUsuarios.Text<>'' then
  begin
    cUsuarios:=''''+dblcUsuarios.Text+''' ';

    xSQL:='Select USUCAJ from CAJ_LOG_ING '
         +'Where CIAID=''' +dblcCia.Text+''' '
         +  'and FECOPE='''+DateToStr(dtpFecha.Date)+''' '
         +  'and USUCAJ in ( '+cUsuarios+' ) '
         +  'and ESTADO=''I'' '
         +'GROUP BY USUCAJ';
    DMTE.cdsReporte.Close;
    DMTE.cdsReporte.DataRequest( xSQL );
    DMTE.cdsReporte.Open;

    if DMTE.cdsReporte.RecordCount>0 then
    begin
       cUsers:='';
       while not DMTE.cdsReporte.Eof do
       begin
          cUsers:=cUsers+DMTE.cdsReporte.FieldByName('USUCAJ').AsString+#13+'';
          DMTE.cdsReporte.Next;
       end;
       ShowMessage('Cajero que no han cerrado Caja'+#13+#13+cUsers);
       Exit;
    end;

    xSQL:='select A.CIAID, B.CIADES, A.BANCOID, C.BANCONOM, DOCID, CCSERIE, CCNODOC, '
         +  'CCFEMIS, A.TMONID, NCOMTOORI, NCOMTOLOC, NCOMTOEXT, CLIEID, A.CLAUXID, '
         +  'CCNOMB, A.CPTOID, A.CCGLOSA, A.NCOUSER, A.NCOUSER||'' - ''||D.USERNOM USUARIO, '
         +  'CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTMN, '
         +  'CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTME, '
         +  'NCOHREG, NCOFREG, D.USERNOM, '
         +  'CASE WHEN NCOESTADO=''A'' THEN ''ANULADO'' ELSE '''' END ESTADO, '
         +  '''Desde '+DateToStr(dtpFecha.date)+' hasta '+DateToStr(dtpHasta.date)+''' RANGO '
         +'From CXC303 A, TGE101 B, TGE105 C, TGE006 D '
         +'WHERE A.CIAID='''+dblcCIA.text+''' '
         +  'AND CCFEMIS>='''+DateToStr(dtpFecha.date)+''' '
         +  'AND CCFEMIS<='''+DateToStr(dtpHasta.date)+''' '
         +  'AND NCOESTADO in (''C'',''A'') '
         +  'AND A.NCOUSER in ( '+cUsuarios+' ) '
         +  'and A.CPTOID like '''+dblcdCnp22.Text+'%'' '
         +  'AND A.CIAID=B.CIAID(+) AND A.BANCOID=C.BANCOID(+) '
         +  'AND A.NCOUSER=D.USERID(+) '
         +'Order by CCNODOC';
    cSQL:='select A.CIAID, B.CIADES, A.BANCOID, C.BANCONOM, DOCID, CCSERIE, CCNODOC, '
         +  'CCFEMIS, A.TMONID, NCOMTOORI, NCOMTOLOC, NCOMTOEXT, CLIEID, A.CLAUXID, '
         +  'CCNOMB, A.CPTOID, A.CCGLOSA, A.NCOUSER, A.NCOUSER||'' - ''||D.USERNOM USUARIO, '
         +  'CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTMN, '
         +  'CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTME, '
         +  'NCOHREG, NCOFREG, D.USERNOM, A.USUANU, FECANU, '
         +  'CASE WHEN NCOESTADO=''A'' THEN ''ANULADO'' ELSE '''' END ESTADO, OBSANU  '
         +'From CXC303 A, TGE101 B, TGE105 C, TGE006 D '
         +'WHERE A.CIAID='''+dblcCIA.text+''' '
         +  'AND CCFEMIS>='''+DateToStr(dtpFecha.date)+''' '
         +  'AND CCFEMIS<='''+DateToStr(dtpHasta.date)+''' '
         +  'AND NCOESTADO in (''A'') '
         +  'and A.NCOUSER in ( '+cUsuarios+' ) '
         +  'and A.CPTOID like '''+dblcdCnp22.Text+'%'' '
         +  'AND A.CIAID=B.CIAID(+) AND A.BANCOID=C.BANCOID(+) '
         +  'AND A.USUANU=D.USERID(+) '
         +'Order by CCNODOC';
  end
  else
  begin
    xSQL:='select A.CIAID, B.CIADES, A.BANCOID, C.BANCONOM, DOCID, CCSERIE, CCNODOC, '
         +  'CCFEMIS, A.TMONID, NCOMTOORI, NCOMTOLOC, NCOMTOEXT, CLIEID, A.CLAUXID, '
         +  'CCNOMB, A.CPTOID, A.CCGLOSA, A.NCOUSER, A.NCOUSER||'' - ''||D.USERNOM USUARIO, '
         +  'CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTMN, '
         +  'CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTME, '
         +  'NCOHREG, NCOFREG, D.USERNOM, ''Cajero(a) : ''||D.USERNOM CAJERO, '
         +  'CASE WHEN NCOESTADO=''A'' THEN ''ANULADO'' ELSE '''' END ESTADO, '
         +  '''Desde '+DateToStr(dtpFecha.date)+' hasta '+DateToStr(dtpHasta.date)+''' RANGO '
         +'From CXC303 A, TGE101 B, TGE105 C, TGE006 D '
         +'WHERE A.CIAID='''+dblcCIA.text+''' '
         +  'AND CCFEMIS>='''+DateToStr(dtpFecha.date)+''' '
         +  'AND CCFEMIS<='''+DateToStr(dtpHasta.date)+''' '
         +  'and A.CPTOID like '''+dblcdCnp22.Text+'%'' '
         +  'AND NCOESTADO in (''C'',''A'') '
         +  'AND A.CIAID=B.CIAID(+) AND A.BANCOID=C.BANCOID(+) '
         +  'AND A.NCOUSER=D.USERID(+) '
         +'Order by CCNODOC';
    cSQL:='select A.CIAID, B.CIADES, A.BANCOID, C.BANCONOM, DOCID, CCSERIE, CCNODOC, '
         +  'CCFEMIS, A.TMONID, NCOMTOORI, NCOMTOLOC, NCOMTOEXT, CLIEID, A.CLAUXID, '
         +  'CCNOMB, A.CPTOID, A.CCGLOSA, A.NCOUSER, A.NCOUSER||'' - ''||D.USERNOM USUARIO, '
         +  'CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTMN, '
         +  'CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTME, '
         +  'NCOHREG, NCOFREG, D.USERNOM,  ''Cajero(a) : ''||D.USERNOM CAJERO, A.USUANU, FECANU, '
         +  'CASE WHEN NCOESTADO=''A'' THEN ''ANULADO'' ELSE '''' END ESTADO, OBSANU '
         +'From CXC303 A, TGE101 B, TGE105 C, TGE006 D '
         +'WHERE A.CIAID='''+dblcCIA.text+''' '
         +  'AND CCFEMIS>='''+DateToStr(dtpFecha.date)+''' '
         +  'AND CCFEMIS<='''+DateToStr(dtpHasta.date)+''' '
         +  'and A.CPTOID like '''+dblcdCnp22.Text+'%'' '
         +  'AND NCOESTADO=''A'' '
         +  'AND A.CIAID=B.CIAID(+) AND A.BANCOID=C.BANCOID(+) '
         +  'AND A.USUANU=D.USERID(+) '
         +'Order by CCNODOC';
  end;

  DMTE.cdsQry4.Close;
  DMTE.cdsQry4.DataRequest( cSQL );
  DMTE.cdsQry4.Open;

  DMTE.cdsReporte.Close;
  DMTE.cdsReporte.DataRequest( xSQL );
  DMTE.cdsReporte.Open;

  ppdb1.DataSource:=DMTE.dsReporte;
  ppdb2.DataSource:=DMTE.dsQry4;

  ppr1.TEMPLATE.FileName := wRutaRpt + '\IngresosCierreCons.Rtm';

  ppr1.template.LoadFromFile ;

  ppd1.Report:=ppr1;

// Inicio HPC_201403_CAJA
// cambia control de diseño de reporte
   if cbDisenoRep.Checked then
      ppd1.ShowModal
   else
   begin
      ppr1.Print;
      ppr1.Stop;
      ppd1.Report:=nil;
      ppdb1.DataSource:=nil;
      ppdb2.DataSource:=nil;
   end;
// Fin HPC_201403_CAJA
end;

procedure TFConsultaIngresos.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFConsultaIngresos.dblcCiaExit(Sender: TObject);
begin
  dbeCia.Text    :=DMTE.DisplayDescrip('prvTGE','TGE101','CIAID,CIADES','CIAID='+quotedstr(dblcCia.Text),'CIADES');
end;

procedure TFConsultaIngresos.AnulaComprobante( cCia, cTD, cAM, cNC : String);
var
   xSQL : String;
begin
  xSQL:='Update CNT300 set CNTESTADO=''A'', CNTCUADRE=''N'' '
       +'Where CIAID='''   +cCia+''' and TDIARID='''   +cTD+''' '
       +  'and CNTANOMM='''+cAM +''' and CNTCOMPROB='''+cNC+'''';
  try
		DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
  except
  end;

  xSQL:='Update CNT311 set CNTESTADO=''A'', CNTCUADRE=''N'' '
       +'Where CIAID='''   +cCia+''' and TDIARID='''   +cTD+''' '
       +  'and CNTANOMM='''+cAM +''' and CNTCOMPROB='''+cNC+'''';
  try
		DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
  except
  end;

  xSQL:='INSERT INTO CNT300';
  xSQL:=xSQL+ '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, ';
  xSQL:=xSQL+ 'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, ';
  xSQL:=xSQL+ 'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, ';
  xSQL:=xSQL+ 'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, ';
  xSQL:=xSQL+ 'FLAGVAR, TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, ';
  xSQL:=xSQL+ 'CNTTS, DOCMOD, MODULO ) ' ;
  xSQL:=xSQL+ 'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE, ';
  xSQL:=xSQL+ 'DECODE( MIN(A.CNTREG), 1, MAX( A.CNTGLOSA ), ''COMPROBANTE DE ''||MAX(MODULO) ), ';
  xSQL:=xSQL+ 'MAX( NVL( A.CNTTCAMBIO, 0 ) ), ';
  xSQL:=xSQL+ 'A.CNTFCOMP, ''A'', ''N'', ';
  xSQL:=xSQL+ 'MAX( CNTUSER ), MAX( CNTFREG ), MAX( CNTHREG ), A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
  xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
  xSQL:=xSQL+ 'CASE WHEN SUM( CASE WHEN TMONID='''+DMTE.wTMonExt+''' THEN 1 ELSE 0 END )>'
            +          ' SUM( CASE WHEN TMONID='''+DMTE.wTMonLoc+''' THEN 1 ELSE 0 END ) '
            +     ' THEN '''+DMTE.wTMonExt+''' ELSE '''+DMTE.wTMonLoc+''' END, ';
  xSQL:=xSQL+ ''' '', A.TDIARDES, ';
  xSQL:=xSQL+ 'SUM(A.CNTDEBEMN), SUM(A.CNTDEBEME), SUM(A.CNTHABEMN), SUM(A.CNTHABEME), ';
  xSQL:=xSQL+ 'MAX( CNTTS ), MAX( CNTMODDOC), MAX( MODULO ) ';
  xSQL:=xSQL+ 'FROM CNT311 A ';
  xSQL:=xSQL+ 'WHERE A.CIAID='     +''''+cCia  +''''+' AND ';
  xSQL:=xSQL+       'A.TDIARID='   +''''+cTD   +''''+' AND ';
  xSQL:=xSQL+       'A.CNTANOMM='  +''''+cAM   +''' ';
  xSQL:=xSQL+'AND A.CNTCOMPROB='   +''''+cNC   +''''+' ';
  xSQL:=xSQL+ 'GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, ';
  xSQL:=xSQL+ 'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI,  ';
  xSQL:=xSQL+ 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
  xSQL:=xSQL+ 'A.TDIARDES';
  try
		DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
  except
  end;

end;


procedure TFConsultaIngresos.AsignaCompaDocs;
begin

  DMTE.cdsDocsContWork.First;
  while Not DMTE.cdsDocsContWork.EOF do
  begin
     DMTE.cdsDocsContWork.Edit;
     DMTE.cdsDocsContWork.FieldByName('CIAID').AsString   :=DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
     DMTE.cdsDocsContWork.FieldByName('ECANOMM').AsString :=DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
     DMTE.cdsDocsContWork.FieldByName('TDIARID').AsString :=DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
     DMTE.cdsDocsContWork.FieldByName('ECNOCOMP').AsString:=DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
     DMTE.cdsDocsContWork.Post;
     DMTE.cdsDocsContWork.Next;
  end;
end;

procedure TFConsultaIngresos.RecCptosDifC;
var
  cWhere : String;
begin
   cWhere:='BANCOID ='+QuotedStr(DMTE.cdsDocsContWork.FieldByName('BANCOID').AsString);

   if not DMTE.RecuperarDatos('TGE105', 'CPTODIFG, CPTODIFP, CTADIFG, CTADIFP', cWhere )  then
       Raise Exception.create('No se puede Contabilizar '+#13+
             'Falta Definir las Cuentas de Dif. de Cambio')  ;
    wCptoGan  := DMTE.cdsRec.FieldByName('CPTODIFG').AsString ;
    wCptoPer  := DMTE.cdsRec.FieldByName('CPTODIFP').AsString ;
    wCtaGan   := DMTE.cdsRec.FieldByName('CTADIFG').AsString ;
    wCtaPer   := DMTE.cdsRec.FieldByName('CTADIFP').AsString ;
end;

procedure TFConsultaIngresos.Contabiliza;
var
   xSQL    : String;
begin
   xSQL := 'DELETE FROM CAJA304 '
          +'WHERE CIAID ='   +QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)   +' AND '
          +      'ECANOMM =' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) +' AND '
          +      'TDIARID =' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) +' AND '
          +      'ECNOCOMP ='+QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   try
			DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;

   // vhn 23/01/2001
   xSQL := 'Select * From CAJA304 '
          +'WHERE CIAID ='   +QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)   +' AND '
          +      'ECANOMM =' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) +' AND '
          +      'TDIARID =' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) +' AND '
          +      'ECNOCOMP ='+QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   DMTE.cdsCNTCaja.Close;
   DMTE.cdsCNTCaja.DataRequest( xSQL );
   DMTE.cdsCNTCaja.Open;

   xNReg := 0;

   Contab_IngCaja( 'D','', 'INGRESO A CAJA' );

   DMTE.cdsDocsContWork.First ;
   While not DMTE.cdsDocsContWork.Eof do
    begin
     Contab_Doc ;
     DMTE.cdsDocsContWork.Next;
    end;
end;

procedure TFConsultaIngresos.Contab_IngCaja( cDH, cCuenta, cGlosa : String );
begin
end;


procedure TFConsultaIngresos.Contab_Doc;
var
   xSQL : String;
begin
   xSQL := 'Select * From CAJA301 '
          +'Where CIAID='''  +dblcCia.Text                                    +''' and '
          +      'DOCID2=''' +DMTE.cdsDocsContWork.FieldByName('DOCID').AsString  +''' and '
          +      'CPSERIE='''+DMTE.cdsDocsContWork.FieldByName('CCSERIE').AsString+''' and '
          +      'CPNODOC='''+DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString+''' ';
   DMTE.cdsSQL.Close;
   DMTE.cdsSQL.DataRequest( xSQL );
   DMTE.cdsSQL.Open;
   DMTE.cdsSQL.First;
   While not DMTE.cdsSQL.Eof do
    begin
     DMTE.cdsCntCaja.Insert;
     DMTE.cdsCntCaja.FieldByName('CIAID').Value      := DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
     DMTE.cdsCntCaja.FieldByName('TDIARID').Value    := DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
     DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value   := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
     DMTE.cdsCntCaja.FieldByName('ECANOMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCDH').Value       := 'H';
     DMTE.cdsCntCaja.FieldByName('DOCMOD').Value     := 'CAJA';

     DMTE.cdsCntCaja.FieldByName('DOCID').Value      := DMTE.cdsDocsContWork.FieldByName('DOCID').AsString;
     DMTE.cdsCntCaja.FieldByName('DCSERIE').Value    := DMTE.cdsDocsContWork.FieldByName('CCSERIE').AsString;
     DMTE.cdsCntCaja.FieldByName('DCNODOC').Value    := DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString;

     DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value    := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value    := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').Value;
     DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value   := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').Value;

     if Copy(DMTE.cdsSQL.FieldByName('CUENTAID').AsString,1,2)='16' then
        DMTE.cdsCntCaja.FieldByName('DCGLOSA').Value := DMTE.cdsReporte.FieldByName('CCNOMB').AsString
     else
        DMTE.cdsCntCaja.FieldByName('DCGLOSA').Value := DMTE.cdsDocsContWork.FieldByName('CCGLOSA').AsString;

     DMTE.cdsCntCaja.FieldByName('CPTOID').Value     := DMTE.cdsSQL.FieldByName('CPTOID').AsString;
     DMTE.cdsCntCaja.FieldByName('CUENTAID').Value   := DMTE.cdsSQL.FieldByName('CUENTAID').AsString;
     DMTE.cdsCntCaja.FieldByName('CLAUXID').Value    := DMTE.cdsDocsContWork.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
     DMTE.cdsCntCaja.FieldByName('DCAUXID').Value    := DMTE.cdsDocsContWork.FieldByName('CLIEID').AsString;    //Aqui se toma de la cabecera
     DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value   := DMTE.cdsDocsContWork.FieldByName('NCOTCAMB').Value ;
     DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value   := DMTE.cdsDocsContWork.FieldByName('NCOTCAMB').Value ;
     DMTE.cdsCntCaja.FieldByName('TMONID').Value     := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
     DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value   := DMTE.cdsSQL.FieldByName('DEMTOORI').Value;
     DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value    := DMTE.cdsSQL.FieldByName('DEMTOLOC').Value;
     DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value   := DMTE.cdsSQL.FieldByName('DEMTOEXT').Value;
     DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value   := 'S';   //Registro ya cuadrado
     DMTE.cdsCntCaja.FieldByName('DCLOTE').Value     := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
     DMTE.cdsCntCaja.FieldByName('DCANO').AsString   := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
     DMTE.cdsCntCaja.FieldByName('DCMM').AsString    := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCDD').AsString    := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
     DMTE.cdsCntCaja.FieldByName('DCSS').AsString    := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
     DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
     xNReg := xNReg+1;
     DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;
     DMTE.cdsCntCaja.Post ;
     DMTE.cdsSQL.Next;
    end;
   DMTE.cdsSQL.Close;
end;


procedure TFConsultaIngresos.Contabiliza2;
var
   xSQL    : String;
begin
   xSQL := 'DELETE FROM CAJA304 '
          +'WHERE CIAID ='   +QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)   +' AND '
          +      'ECANOMM =' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) +' AND '
          +      'TDIARID =' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) +' AND '
          +      'ECNOCOMP ='+QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   try
			DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;

   // vhn 23/01/2001
   xSQL := 'Select * From CAJA304 '
          +'WHERE CIAID ='   +QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)   +' AND '
          +      'ECANOMM =' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) +' AND '
          +      'TDIARID =' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) +' AND '
          +      'ECNOCOMP ='+QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   DMTE.cdsCNTCaja.Close;
   DMTE.cdsCNTCaja.DataRequest( xSQL );
   DMTE.cdsCNTCaja.Open;

   xNReg := 0;

   DMTE.cdsCntCaja.Insert;
   
   if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
      Contab_IngCaja( 'D', '1010104', 'INGRESO A BOVEDA CENTRAL' )
   else
      Contab_IngCaja( 'D', '1010204', 'INGRESO A BOVEDA CENTRAL' );

   Contab_IngCaja( 'H', '', 'TRANSFERENCIA DE CAJA A BOVEDA CENTRAL' );
end;

procedure TFConsultaIngresos.bbtnImprimeContaClick(Sender: TObject);
var
   xSQL, cMes, cUsers : String;
begin

  xSQL:='Select * From CAJ_USU_SUP where USUSUP='''+DMTE.wUsuario+''' or USUCAJ='''+DMTE.wUsuario+'''';

  DMTE.cdsReporte.Close;
  DMTE.cdsReporte.DataRequest( xSQL );
  DMTE.cdsReporte.Open;

  if DMTE.cdsReporte.RecordCount=0 then
  begin
     ShowMessage('Usuario No Registrado para Esta Opcion');
     Exit;
  end;

  if DMTE.wAdmin='U' then
  xSQL:='select NCOUSER From CXC303 '
       +'WHERE CIAID='''+dblcCIA.text+''' '
       +  'AND CCFEMIS='''+DateToStr(dtpFecha.date)+''' '
       +  'AND NCOUSER='''+DMTE.wUsuario+''' AND ECNOCOMP IS NULL'
  else
  xSQL:='select NCOUSER From CXC303 A, CAJ_USU_SUP B '
       +'WHERE A.CIAID='''+dblcCIA.text+''' '
       +  'AND A.CCFEMIS='''+DateToStr(dtpFecha.date)+''' AND ECNOCOMP IS NULL '
       +  'AND B.USUSUP='''+DMTE.wUsuario+''' AND A.NCOUSER=B.USUCAJ '
       +'group by NCOUSER';

  DMTE.cdsReporte.Close;
  DMTE.cdsReporte.DataRequest( xSQL );
  DMTE.cdsReporte.Open;

  if DMTE.cdsReporte.RecordCount>0 then
  begin
     cUsers:='';
     while not DMTE.cdsReporte.Eof do
     begin
        cUsers:=cUsers+DMTE.cdsReporte.FieldByName('NCOUSER').AsString+#13+'';
        DMTE.cdsReporte.Next;
     end;
     ShowMessage('Usuario(s) que NO han Contabilizado sus Ingresos a Caja '+#13+#13+cUsers);
     Exit;
  end;

  cMes:=Copy(DateToStr(dtpFecha.Date),7,4)+Copy(DateToStr(dtpFecha.Date),4,2);

  if DMTE.wAdmin='U' then
  xSQL:='select A.CIAID, C.CIADES, A.TDIARID, A.ECANOMM, A.ECNOCOMP, B.CUENTAID, NVL(B.CNTNODOC, X.CNTNODOC) CNTNODOC, '
       +  'NVL(B.CNTGLOSA,''A N U L A D O'') CNTGLOSA, NVL(B.CNTDEBEMN,0) CNTDEBEMN, NVL(B.CNTHABEMN,0) CNTHABEMN, '
       +  'A.ECFCOMP, D.TDIARDES, B.CNTDH, ECUSER, USERNOM, '
       +  'CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' AND B.CNTDH=''D'' THEN ECMTOORI ELSE 0 END SOLES, '
       +  'CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' AND B.CNTDH=''D'' THEN ECMTOORI ELSE 0 END DOLARES '
       +'from CAJA302 A, CNT301 B, CNT311 X, TGE101 C, TGE104 D, TGE006 E '
       +'WHERE A.CIAID='''+dblcCia.Text+''' AND A.ECANOMM='''+cMes+''' '
       +  'AND A.TDIARID=''05'' AND A.ECFCOMP='''+DateToStr(dtpFecha.Date)+''' '
       +  'AND ECUSER='''+DMTE.wUsuario+''' '
       +  'AND A.CIAID=B.CIAID(+) AND A.TDIARID=B.TDIARID(+) AND A.ECANOMM=B.CNTANOMM(+) AND A.ECNOCOMP=B.CNTCOMPROB(+) '
       +  'AND A.CIAID=X.CIAID(+) AND A.TDIARID=X.TDIARID(+) AND A.ECANOMM=X.CNTANOMM(+) AND A.ECNOCOMP=X.CNTCOMPROB(+) '
       +  'AND A.CIAID=C.CIAID AND A.TDIARID=D.TDIARID AND A.ECUSER=E.USERID(+) '
  else
  xSQL:='select A.CIAID, C.CIADES, A.TDIARID, A.ECANOMM, A.ECNOCOMP, B.CUENTAID, B.CNTNODOC, '
       +  'B.CNTGLOSA, B.CNTDEBEMN, B.CNTHABEMN, A.ECFCOMP, D.TDIARDES, B.CNTDH, ECUSER, USERNOM, '
       +  'CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' AND B.CNTDH=''D'' THEN ECMTOORI ELSE 0 END SOLES, '
       +  'CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' AND B.CNTDH=''D'' THEN ECMTOORI ELSE 0 END DOLARES '
       +'from CAJA302 A, CNT301 B, CNT311 X, TGE101 C, TGE104 D, TGE006 E, CAJ_USU_SUP F   '
       +'WHERE A.CIAID='''+dblcCia.Text+''' AND A.ECANOMM='''+cMes+''' '
       +  'AND A.TDIARID=''05'' AND A.ECFCOMP='''+DateToStr(dtpFecha.Date)+''' '
       +  'AND A.CIAID=B.CIAID(+) AND A.TDIARID=B.TDIARID(+) AND A.ECANOMM=B.CNTANOMM(+) AND A.ECNOCOMP=B.CNTCOMPROB(+) '
       +  'AND A.CIAID=X.CIAID(+) AND A.TDIARID=X.TDIARID(+) AND A.ECANOMM=X.CNTANOMM(+) AND A.ECNOCOMP=X.CNTCOMPROB(+) '
       +  'AND A.CIAID=C.CIAID AND A.TDIARID=D.TDIARID AND A.ECUSER=E.USERID(+) '
       +  'AND F.USUSUP='''+DMTE.wUsuario+''' AND A.ECUSER=F.USUCAJ ';


  if DMTE.WuSUARIO<>'HTUPIA' then
  begin
  xSQL:=xSQL
       +'UNION ALL '
       +'select A.CIAID, C.CIADES, A.TDIARID, A.ECANOMM, A.ECNOCOMP, B.CUENTAID, NVL(B.CNTNODOC, X.CNTNODOC) CNTNODOC, '
       +  'NVL(B.CNTGLOSA,''A N U L A D O'') CNTGLOSA, NVL(B.CNTDEBEMN,0) CNTDEBEMN, NVL(B.CNTHABEMN,0) CNTHABEMN, '
       +  'A.ECFCOMP, D.TDIARDES, B.CNTDH, ECUSER, USERNOM, '
       +  'CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' AND B.CNTDH=''D'' THEN ECMTOORI ELSE 0 END SOLES, '
       +  'CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' AND B.CNTDH=''D'' THEN ECMTOORI ELSE 0 END DOLARES '
       +'from CAJA302 A, CNT301 B, CNT311 X, TGE101 C, TGE104 D, TGE006 E '
       +'WHERE A.CIAID='''+dblcCia.Text+''' AND A.ECANOMM='''+cMes+''' '
       +  'AND A.TDIARID=''04'' AND A.ECFCOMP='''+DateToStr(dtpFecha.Date)+''' ';

  if DMTE.wAdmin='U' then
  xSQL:=xSQL
       +  'AND ECUSER='''+DMTE.wUsuario+''' ';

  xSQL:=xSQL
       +  'AND A.CIAID=B.CIAID(+) AND A.TDIARID=B.TDIARID(+) AND A.ECANOMM=B.CNTANOMM(+) AND A.ECNOCOMP=B.CNTCOMPROB(+) '
       +  'AND A.CIAID=X.CIAID(+) AND A.TDIARID=X.TDIARID(+) AND A.ECANOMM=X.CNTANOMM(+) AND A.ECNOCOMP=X.CNTCOMPROB(+) '
       +  'AND A.CIAID=C.CIAID AND A.TDIARID=D.TDIARID AND A.ECUSER=E.USERID(+) '
       +'ORDER BY CIAID, TDIARID DESC, ECNOCOMP, CNTDH';
  end;

  DMTE.cdsReporte.Close;
  DMTE.cdsReporte.DataRequest( xSQL );
  DMTE.cdsReporte.Open;

  ppdb1.DataSource:=DMTE.dsReporte;

  if DMTE.wAdmin='U' then
     ppr1.TEMPLATE.FileName := wRutaRpt + '\IngresosConta.Rtm'
  else
     ppr1.TEMPLATE.FileName := wRutaRpt + '\IngresosContaADM.Rtm';

  ppr1.template.LoadFromFile ;

  ppd1.Report:=ppr1;

  if (DMTE.wUsuario='HNORIEGA') or (DMTE.wUsuario='HTUPIA') then
     ppd1.ShowModal
  else
     ppr1.Print;

  ppr1.Stop;
  ppd1.Report:=nil;
  ppdb1.DataSource:=nil;
end;

procedure TFConsultaIngresos.dblcUsuariosNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFConsultaIngresos.dblcUsuariosExit(Sender: TObject);
begin
  dbeUsuario.Text:=DMTE.DisplayDescrip('prvTGE','TGE006','USERNOM','USERID='+quotedstr(dblcCia.Text),'USERNOM');
end;

procedure TFConsultaIngresos.dblcdCnp22Exit(Sender: TObject);
var
  sSQL : String;
begin
  sSQL:='CPTOID='+quotedstr(dblcdCnp22.text)+' and CPTOIS=''I''';
  edtCnp2.Text:=DMTE.DisplayDEscrip('prvTGE','CAJA201','*',sSQL,'CPTODES');
end;

procedure TFConsultaIngresos.sbDisenoRepClick(Sender: TObject);
begin
// Inicio HPC_201403_CAJA
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
// Fin HPC_201403_CAJA
end;

end.





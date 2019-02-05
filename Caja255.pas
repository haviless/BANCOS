unit Caja255;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient, //libRLP,
  Wwdotdot,wwidlg,CAJADM, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  ComCtrls, ppPrnabl, ppCtrls, ppCache, ppBands, oaContabiliza, ppDB,
  ppDBPipe, Variants;

type
  TFContaAmedida = class(TForm)
    pnlCabecera1: TPanel;
    lblCia: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    pnlCabecera2: TPanel;
    lblTMon: TLabel;
    lblTCambio: TLabel;
    lblBanco: TLabel;
    lblCCBco: TLabel;
    lblFormPago: TLabel;
    edtTMon: TEdit;
    dbeTCambio: TwwDBEdit;
    dblcTMon: TwwDBLookupCombo;
    dblcBanco: TwwDBLookupCombo;
    dblcCCBco: TwwDBLookupCombo;
    dblcFormPago: TwwDBLookupCombo;
    edtFormPago: TEdit;
    edtBanco: TEdit;
    pnlDetPago: TPanel;
    pnlBotones: TPanel;
    z2bbtnSumat: TBitBtn;
    z2bbtnImprime: TBitBtn;
    z2bbtnCont: TBitBtn;
    dbdtpFComp: TwwDBDateTimePicker;
    lblFComp: TLabel;
    lblTDiario: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    lblPeriodo: TLabel;
    lblNoComp: TLabel;
    edtPeriodo: TEdit;
    dbeImporte: TwwDBEdit;
    lblImporte: TLabel;
    dbeNoComp: TwwDBEdit;
    dbeLote: TwwDBEdit;
    lblLote: TLabel;
    dbeGlosa: TwwDBEdit;
    lblGlosa: TLabel;
    lblConcepto: TLabel;
    dbgDetPago: TwwDBGrid;
    dblcTDoc: TwwDBLookupCombo;
    lblTDoc: TLabel;
    edtTDoc: TEdit;
    dbeNoDoc: TwwDBEdit;
    lblNoDoc: TLabel;
    lblCuenta: TLabel;
    lblEstado: TLabel;
    Label22: TLabel;
    edtAuxRuc: TEdit;
    Label23: TLabel;
    dblcdAux: TwwDBLookupComboDlg;
    dblcClase: TwwDBLookupCombo;
    edtClase: TEdit;
    edtCuenta: TwwDBLookupComboDlg;
    dblcdCnp: TwwDBLookupComboDlg;
    lblPJSV: TLabel;
    Label19: TLabel;
    edtAuxNombre: TEdit;
    ppdbRetencion: TppDBPipeline;
    pprRetencion: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText10: TppDBText;
    ppDetailBand3: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppDBCalc1: TppDBCalc;
    ppTotal: TppDBCalc;
    ppDBText13: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppdbpChqVouch: TppDBPipeline;
    pprChqVouch: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppImporte: TppLabel;
    ppAno: TppLabel;
    ppMes: TppLabel;
    ppDia: TppLabel;
    ppGiradoA: TppLabel;
    ppMontoLetras: TppLabel;
    ppFecha: TppDBText;
    ppTipoCambio: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppCtaBanco: TppLabel;
    ppGiradoA2: TppLabel;
    ppGlosa: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppImporte2: TppLabel;
    ppMoneda: TppLabel;
    ppComprobante: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBText20: TppDBText;
    lblSujetoRetencion: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcdAuxExit(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
    procedure z2bbtnSumatClick(Sender: TObject);
    procedure z2bbtnContClick(Sender: TObject);
  private
   xBusca : String;
    xNReg : Integer;
    xRetLoc,xRetExt:Double;
    xDebeT ,xHabeT,xDebeTD,xHabeTD: Double;
    wCptoPer,wCtaGan,wCtaPer   : String ;
    wCptoGan   : String ;
    procedure AsientoDifTotal;
    procedure Contabiliza;
    procedure Contab_RegCxP;
    procedure Contab_DifCambio;
    procedure Contab_DifCambio2;
    procedure Contab_EgrCaja;    
  public
    { Public declarations }
  end;

var
  FContaAmedida: TFContaAmedida;
implementation

uses CAJAUTIL, Caja001, Caja290;
{$R *.DFM}


procedure TFContaAmedida.FormActivate(Sender: TObject);
var
 xSql : string;
begin
   dblcCia.text := DM1.cdsEgrCaja.FieldByName('CIAID').AsString;
   dblcCia.OnExit(dblcCia);
   dblcTDiario.text := DM1.cdsEgrCaja.FieldByName('TDIARID').AsString;
   dblcBanco.text := DM1.cdsEgrCaja.FieldByName('BANCOID').AsString;
   dblcBanco.onexit(dblcBanco);
   dblcCCBco.text := DM1.cdsEgrCaja.FieldByName('CCBCOID').AsString;
   dbdtpFComp.Date := DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   edtPeriodo.text := DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   dbeNoComp.text := DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   dblcClase.text := DM1.cdsEgrCaja.FieldByName('CLAUXID').AsString;
   edtClase.text := 'ASOCIADO';
   dblcdAux.text := DM1.cdsEgrCaja.FieldByName('PROV').AsString;
   dblcdAux.onexit(dblcdAux);
   dblcTMon.text := DM1.cdsEgrCaja.FieldByName('TMONID').AsString;
   dblcTMon.Onexit(dblcTMon);
   dblcFormPago.text := DM1.cdsEgrCaja.FieldByName('FPAGOID').AsString;
   dblcFormPago.OnExit(dblcFormPago);
   edtCuenta.text := DM1.cdsEgrCaja.FieldByName('CUENTAID').AsString;
   dblcTDoc.text := DM1.cdsEgrCaja.FieldByName('DOCID').AsString;
   dblcTDoc.OnExit(dblcTDoc);
   dbeNoDoc.text := DM1.cdsEgrCaja.FieldByName('ECNODOC').AsString;
   dbeImporte.text := DM1.cdsEgrCaja.FieldByName('ECMTOORI').AsString;
   dbeTCambio.text := DM1.cdsEgrCaja.FieldByName('ECTCAMB').AsString;
   dbeLote.text := DM1.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   dblcdCnp.text := DM1.cdsEgrCaja.FieldByName('CPTOID').AsString;
   dbeGlosa.text := DM1.cdsEgrCaja.FieldByName('ECGLOSA').AsString;
   xSQL:='Select * from CAJA322 '
         +'Where CIAID='''   +dblcCia.Text    +''' and '
         +      'ECANOMM=''' +edtPeriodo.Text +''' and '
         +      'TDIARID=''' +dblcTDiario.Text+''' and '
         +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
  DM1.cdsRegCxP.close;
  DM1.cdsRegCxP.DataRequest( xSQL );
  DM1.cdsRegCxP.open;

  If DM1.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'A' then
   lblEstado.caption := 'ACTIVO'
  else
   If DM1.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'C' then
    lblEstado.caption := 'CONTABILIZADO'
end;


procedure TFContaAmedida.dblcCiaExit(Sender: TObject);
begin
   xBusca := 'SELECT * FROM TGE101 WHERE CIAID='+quotedstr(dblcCia.text);
   dm1.cdsqry.close;
   dm1.cdsqry.datarequest(xbusca);
   dm1.cdsqry.open;
   edtCia.Text := dm1.cdsqry.FieldByName('CIADES').AsString;
end;

procedure TFContaAmedida.dblcBancoExit(Sender: TObject);
begin
   xBusca := 'SELECT * FROM TGE105 WHERE BANCOID='+quotedstr(dblcBanco.text);
   dm1.cdsqry.close;
   dm1.cdsqry.datarequest(xbusca);
   dm1.cdsqry.open;
   edtBanco.Text := dm1.cdsqry.FieldByName('BANCONOM').AsString;
end;

procedure TFContaAmedida.dblcdAuxExit(Sender: TObject);
begin
   xBusca := 'SELECT * FROM APO201 WHERE ASOID='+quotedstr(dblcdAux.text);
   dm1.cdsqry.close;
   dm1.cdsqry.datarequest(xbusca);
   dm1.cdsqry.open;
   edtAuxNombre.Text := dm1.cdsqry.FieldByName('ASOAPENOM').AsString;
end;

procedure TFContaAmedida.dblcTMonExit(Sender: TObject);
begin
   xBusca := 'SELECT * FROM TGE103 WHERE TMONID='+quotedstr(dblcTMon.text);
   dm1.cdsqry.close;
   dm1.cdsqry.datarequest(xbusca);
   dm1.cdsqry.open;
   edtTMon.Text := dm1.cdsqry.FieldByName('TMONABR').AsString;
end;

procedure TFContaAmedida.dblcFormPagoExit(Sender: TObject);
begin
   xBusca := 'SELECT * FROM TGE112 WHERE FPAGOID='+quotedstr(dblcFormPago.text);
   dm1.cdsqry.close;
   dm1.cdsqry.datarequest(xbusca);
   dm1.cdsqry.open;
   edtFormPago.Text := dm1.cdsqry.FieldByName('FPAGODES').AsString;
end;

procedure TFContaAmedida.dblcTDocExit(Sender: TObject);
begin
   xBusca := 'SELECT * FROM TGE110 WHERE DOCID='+quotedstr(dblcTDoc.text);
   dm1.cdsqry.close;
   dm1.cdsqry.datarequest(xbusca);
   dm1.cdsqry.open;
   edtTDoc.Text := dm1.cdsqry.FieldByName('DOCDES').AsString;
end;

procedure TFContaAmedida.z2bbtnImprimeClick(Sender: TObject);
var
 Comprobante : RCabComprobante;
 xsql : string;
begin
 if DM1.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' THEN
  begin
//   RecCptosDifC ;
   Contabiliza;
   ActualizaCNT311( DM1.cdsEgrcaja.FieldByName('CIAID').AsString,
                       DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
                       DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                       DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString );

   if SOLConta(DM1.cdsEgrCaja.FieldByName('CIAID').AsString,
               DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
               DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString,
               DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
               dm1.SRV_D, 'PCNA', DM1.wModulo, DM1.cdsCNT311, DM1.cdsNivel,
               DM1.cdsResultSet, DM1.DCOM1, Self ) then

   ImprimeVoucher( 'CNT311', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
  end;

   if DM1.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' THEN
	 begin
      ImprimeVoucher( 'CNT301', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
   end;
end;

procedure TFContaAmedida.Contabiliza;
var
   xRegAct : TBookMark;
   xSQL    : String;
begin
   xsql:='DELETE FROM CAJA304 '
        +'WHERE CIAID='   +quotedstr(DM1.cdsEgrcaja.FieldByName('CIAID').AsString)   +' AND '
        +      'ECANOMM=' +quotedstr(DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString) +' AND '
        +      'TDIARID=' +quotedstr(DM1.cdsEgrCaja.FieldByName('TDIARID').AsString) +' AND '
        +      'ECNOCOMP='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   try
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;

   // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera
   xSQL:='Select * from CAJA304 Where CIAID='''' and '
        +  'ECANOMM='''' and TDIARID='''' and ECNOCOMP='''' ';
   DM1.cdsCNTCaja.Close;
   DM1.cdsCNTCaja.DataRequest( xSQL );
   DM1.cdsCNTCaja.Open;
   //
   z2bbtnSumatClick(NIL);
   xNReg:=0;
   DM1.cdsRegCxP.DisableControls;
   xRegAct := DM1.cdsRegCxP.GetBookmark;

   // GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde el Detalle
   DM1.cdsRegCxP.First ;
   While not DM1.cdsRegCxP.Eof do
    Begin
     DM1.cdsCntCaja.Insert;
     Contab_RegCxP;
     if DM1.wTipoDif='' then
         Contab_DifCambio
     else
      begin
         if DM1.cdsRegCxP.FieldByname('TMONID').AsString=DM1.wTMonExt then
            Contab_DifCambio2;
      end;
      DM1.cdsRegCxP.Next;
    end;
   DM1.cdsRegCxP.GotoBookmark(xRegAct);
   DM1.cdsRegCxP.FreeBookmark(xRegAct);
   DM1.cdsRegCxP.EnableControls;

   DM1.cdsCntCaja.Insert;
   Contab_EgrCaja;
   //** se quita porque no hay retencion
   {if (xRetLoc>0) OR (xRetExt>0) then
    begin
       DM1.cdsCntCaja.Insert;
      Contab_DocPago_RETENCION_HABER;
    end;
   }
   //GENERA MONTO

   // Cuadra Asiento por Redondeos
   xDebeT :=0;  xHabeT :=0;
   xDebeTD:=0;  xHabeTD:=0;
   DM1.cdsCntCaja.First;
   while not DM1.cdsCntCaja.Eof do
    begin
     if DM1.cdsCntCaja.FieldByname('DCDH').AsString='D' then
      if DM1.cdsCntCaja.FieldByname('DCMTOLO').AsFloat <> null then
       begin
	xDebeT :=xDebeT +DM1.FRound(DM1.cdsCntCaja.FieldByname('DCMTOLO').AsFloat,15,2);
	xDebeTD:=xDebeTD+DM1.FRound(DM1.cdsCntCaja.FieldByname('DCMTOEXT').AsFloat,15,2);
       end
      else
       begin
	xDebeT:=xDebeT
       end
     else
      begin
       if DM1.cdsCntCaja.FieldByname('DCMTOLO').AsFloat <> null then
        begin
	 xHabeT :=xHabeT +DM1.FRound(DM1.cdsCntCaja.FieldByname('DCMTOLO').AsFloat,15,2);
	 xHabeTD:=xHabeTD+DM1.FRound(DM1.cdsCntCaja.FieldByname('DCMTOEXT').AsFloat,15,2);
	end
       else
        begin
	 xHabeT:=xHabeT;
	end;
      end;
      DM1.cdsCntCaja.Next;
    end;

   if ( DM1.FRound(xDebeT,15,2) <>DM1.FRound(xHabeT,15,2 ) ) then
    begin
     AsientoDifTotal;
    end;

   dm1.AplicaDatos(DM1.cdsCntCaja, 'CNTCAJA');
end;

procedure TFContaAmedida.z2bbtnSumatClick(Sender: TObject);
Var
   xRegAct : TBookMark;
   xMtoLoc, xMtoExt: Double ;
   xWhere : String;
begin

   With DM1 do
   begin
      cdsRegCxP.DisableControls;
      xRegAct := cdsRegCxP.GetBookmark;
      xMtoLoc := 0;
      xMtoExt := 0;
      xRetLoc := 0;
      xRetExt := 0;
      cdsRegCxP.First ;
      While not cdsRegCxP.Eof do
      Begin
        if cdsRegCxP.FieldByName('DEDH').AsString='D' then
        begin
          xWhere := 'DOCID='+QuotedStr(cdsRegCxP.FieldByName('DOCID2').AsString)+' AND DOCMOD=''CXP''';
          if (DM1.DisplayDescrip('prvTGE','TGE110','DOCRETIGV',xWhere,'DOCRETIGV')='S') AND
             (cdsRegCxP.FieldByName('CPFEMIS').AsDateTime>=xTasaFec) AND
             (lblSujetoRetencion.Visible) then
          begin
             xRetLoc:=xRetLoc+cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
             xRetExt:=xRetExt+cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
          end;

          xMtoLoc := xMtoLoc + StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) ) ;
          xMtoExt := xMtoExt + StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) ) ;
        end
        else begin
          xMtoLoc := xMtoLoc - StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) ) ;
          xMtoExt := xMtoExt - StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) ) ;
        end;
        cdsRegCxP.Next;
      end;
      dbgDetPago.ColumnByName('DEMTOLOC').FooterValue:=floattostrf(xMtoLoc, ffFixed, 10, 2);
      dbgDetPago.ColumnByName('DEMTOEXT').FooterValue:=floattostrf(xMtoExt, ffFixed, 10, 2);

      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);
      cdsRegCxP.EnableControls;
   end;
   xRetLoc:=DM1.FRound(xRetLoc*DM1.xTasaPorce/100,15,2);
   xRetExt:=DM1.FRound(xRetExt*DM1.xTasaPorce/100,15,2);
end;

procedure TFContaAmedida.Contab_RegCxP;
begin
   DM1.cdsCntCaja.fieldbyname('CIAID').AsString   := DM1.cdsRegCxP.FieldByName('CIAID').AsString;
   DM1.cdsCntCaja.fieldbyname('TDIARID').AsString := DM1.cdsRegCxP.FieldByName('TDIARID').AsString;
   DM1.cdsCntCaja.fieldbyname('ECANOMM').AsString := DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DM1.cdsCntCaja.fieldbyname('ECNOCOMP').AsString:= DM1.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
   DM1.cdsCntCaja.fieldbyname('DCLOTE').AsString  := DM1.cdsEgrCaja.FieldByName('ECLOTE').AsString;
	 DM1.cdsCntCaja.fieldbyname('DOCID').AsString   := DM1.cdsRegCxP.FieldByName('DOCID2').AsString;
	 DM1.cdsCntCaja.fieldbyname('DOCMOD').AsString  := DM1.cdsRegCxP.FieldByName('DOCMOD').AsString;
	 DM1.cdsCntCaja.fieldbyname('DCSERIE').AsString := DM1.cdsRegCxP.FieldByName('CPSERIE').AsString;
   DM1.cdsCntCaja.fieldbyname('DCNODOC').AsString := DM1.cdsRegCxP.FieldByName('CPNODOC').AsString;
   DM1.cdsCntCaja.fieldbyname('ECFCOMP').AsDateTime := DM1.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime;
   DM1.cdsCntCaja.fieldbyname('DCFEMIS').AsDateTime := DM1.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime;
   DM1.cdsCntCaja.fieldbyname('DCFVCMTO').AsDateTime:= DM1.cdsRegCxP.FieldByName('CPFVCMTO').AsDateTime;
   DM1.cdsCntCaja.fieldbyname('CPTOID').AsString  := DM1.cdsRegCxP.FieldByName('CPTOID').AsString;
   DM1.cdsCntCaja.fieldbyname('CUENTAID').AsString:= DM1.cdsRegCxP.FieldByName('CUENTAID').AsString;
	 DM1.cdsCntCaja.fieldbyname('CLAUXID').AsString := DM1.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
	 DM1.cdsCntCaja.fieldbyname('DCAUXID').AsString := DM1.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
   DM1.cdsCntCaja.fieldbyname('CCOSID').AsString  := DM1.cdsRegCxP.FieldByName('CCOSID').AsString;
   DM1.cdsCntCaja.fieldbyname('DCDH').AsString    := DM1.cdsRegCxP.FieldByName('DEDH').AsString;
   DM1.cdsCntCaja.fieldbyname('DCTCAMPA').AsFloat := DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
	 DM1.cdsCntCaja.fieldbyname('DCTCAMPR').AsFloat := DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
	 DM1.cdsCntCaja.fieldbyname('TMONID').AsString  := DM1.cdsRegCxP.FieldByName('TMONID').AsString;
	 DM1.cdsCntCaja.fieldbyname('DCMTOORI').AsFloat:= DM1.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;


   if (DM1.xSRV_RUTA='\\INCORESA') then
 	   DM1.cdsCntCaja.FieldByName('DCGLOSA').AsString:=DM1.cdsRegCxP.FieldByName('DEGLOSA').AsString
   else begin
      if DM1.cdsRegCxP.FieldByName('DEGLOSA').AsString<>'' then
    	   DM1.cdsCntCaja.FieldByName('DCGLOSA').AsString:=DM1.cdsRegCxP.FieldByName('DEGLOSA').AsString
      else
    	   DM1.cdsCntCaja.FieldByName('DCGLOSA').AsString:=DM1.cdsEgrCaja.FieldByName('ECGLOSA').AsString;
   end;

	 if DM1.cdsRegCxP.fieldbyname('TMONID').AsString=DM1.wtMonLoc then
		begin
			DM1.cdsCntCaja.fieldbyname('DCMTOLO').AsFloat := DM1.FRound(DM1.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat,15,2);
			DM1.cdsCntCaja.fieldbyname('DCMTOEXT').AsFloat:= DM1.FRound(DM1.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat,15,2);
		end
	 else
		begin
			DM1.cdsCntCaja.fieldbyname('DCMTOEXT').AsFloat:= DM1.FRound(DM1.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat,15,2);
			DM1.cdsCntCaja.fieldbyname('DCMTOLO').AsFloat := DM1.FRound(DM1.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat,15,2);
		end;

   DM1.cdsCntCaja.fieldbyname('DCFLACDR').AsString:= 'S';   //Registro ya cuadrado
   DM1.cdsCntCaja.fieldbyname('DCUSER').AsString  := DM1.wUsuario;
   DM1.cdsCntCaja.fieldbyname('DCFREG').AsDateTime  := DateS;
   if DM1.SRV_D = 'ORACLE' then
      DM1.cdsCntCaja.fieldbyname('DCHREG').AsDateTime  := dateS+time
   else
      DM1.cdsCntCaja.fieldbyname('DCHREG').AsDateTime  := time;
   DM1.cdsCntCaja.fieldbyname('DCANO').AsString   := DM1.cdsEgrCaja.FieldByName('ECANO').AsString;
   DM1.cdsCntCaja.fieldbyname('DCMM').AsString    := DM1.cdsEgrCaja.FieldByName('ECMM').AsString;
   DM1.cdsCntCaja.fieldbyname('DCDD').AsString    := DM1.cdsEgrCaja.FieldByName('ECDD').AsString;
   DM1.cdsCntCaja.fieldbyname('DCSS').AsString    := DM1.cdsEgrCaja.FieldByName('ECSS').AsString;
   DM1.cdsCntCaja.fieldbyname('DCSEM').AsString   := DM1.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DM1.cdsCntCaja.fieldbyname('DCTRI').AsString   := DM1.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DM1.cdsCntCaja.fieldbyname('DCAASS').AsString  := DM1.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DM1.cdsCntCaja.fieldbyname('DCAASEM').AsString := DM1.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DM1.cdsCntCaja.fieldbyname('DCAATRI').AsString := DM1.cdsEgrCaja.FieldByName('ECAATRI').AsString;
   xNReg:=xNReg+1;
   DM1.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
end;

procedure TFContaAmedida.Contab_DifCambio;
var
   xDif_Camb : real;
   xsql1,xsql : string;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   //08/05/2001 - pjsv
   // se valida por sugerencia de Jorge y Jose, me confirmaron que por el tipo
  // de moneda de la cabecera, para que no genere <> de cambio cuando es local
   xsql := 'TMONID='+quotedstr(dblcTMon.Text);
   xsql1 := 'TMONID='+quotedstr(DM1.cdsRegCxP.FieldByName('TMONID').AsString);
   If (dm1.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') or
      (dm1.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then
    begin
     if DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat <> DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat then
      begin
        DM1.cdsCntCaja.Insert;
        DM1.cdsCntCaja.FieldByName('DCGLOSA').AsString  := 'Diferencia de Cambio';        
        DM1.cdsCntCaja.FieldByName('CIAID').AsString   :=  DM1.cdsRegCxP.FieldByName('CIAID').AsString;
        DM1.cdsCntCaja.FieldByName('TDIARID').AsString :=  DM1.cdsRegCxP.FieldByName('TDIARID').AsString;
        DM1.cdsCntCaja.FieldByName('ECANOMM').AsString :=  DM1.cdsRegCxP.FieldByName('ECANOMM').AsString;
        DM1.cdsCntCaja.FieldByName('ECNOCOMP').AsString:=  DM1.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
        DM1.cdsCntCaja.FieldByName('DCLOTE').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECLOTE').AsString;
        DM1.cdsCntCaja.FieldByName('DOCID').AsString   :=  DM1.cdsRegCxP.FieldByName('DOCID2').AsString;
        DM1.cdsCntCaja.FieldByName('DCSERIE').AsString :=  DM1.cdsRegCxP.FieldByName('CPSERIE').AsString;
        DM1.cdsCntCaja.FieldByName('DCNODOC').AsString :=  DM1.cdsRegCxP.FieldByName('CPNODOC').AsString;
        DM1.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DM1.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DM1.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DM1.cdsCntCaja.FieldByName('CLAUXID').AsString :=  DM1.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
        DM1.cdsCntCaja.FieldByName('DCAUXID').AsString :=  DM1.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
        DM1.cdsCntCaja.FieldByName('CCOSID').AsString  :=  DM1.cdsRegCxP.FieldByName('CCOSID').AsString;
        DM1.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:=  DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
        DM1.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:=  DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
        DM1.cdsCntCaja.FieldByName('DCFLACDR').AsString:=  'S';   //Registro ya cuadrado
        DM1.cdsCntCaja.FieldByName('DCUSER').AsString  :=  DM1.wUsuario;
        DM1.cdsCntCaja.FieldByName('DCFREG').AsDateTime  :=  Date;
        if DM1.SRV_D = 'ORACLE' then
           DM1.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  date+Time
        else
           DM1.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  Time;
        DM1.cdsCntCaja.FieldByName('DCANO').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECANO').AsString;
        DM1.cdsCntCaja.FieldByName('DCMM').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECMM').AsString;
        DM1.cdsCntCaja.FieldByName('DCDD').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECDD').AsString;
        DM1.cdsCntCaja.FieldByName('DCSS').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECSS').AsString;
        DM1.cdsCntCaja.FieldByName('DCSEM').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECSEM').AsString;
        DM1.cdsCntCaja.FieldByName('DCTRI').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECTRI').AsString;
        DM1.cdsCntCaja.FieldByName('DCAASS').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECAASS').AsString;
        DM1.cdsCntCaja.FieldByName('DCAASEM').AsString :=  DM1.cdsEgrCaja.FieldByName('ECAASEM').AsString;
        DM1.cdsCntCaja.FieldByName('DCAATRI').AsString :=  DM1.cdsEgrCaja.FieldByName('ECAATRI').AsString;
        DM1.cdsCntCaja.fieldbyname('DOCMOD').AsString := Fprincipal.xModulo;
        xNReg:=xNReg+1;
        DM1.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

        DM1.cdsCntCaja.FieldByName('TMONID').AsString  :=  DM1.cdsEgrCaja.FieldByName('TMONID').AsString;
        if DM1.cdsRegCxP.FieldByName('TMONID').AsString=DM1.wtMonLoc then
         begin   //Provision en Mon.Local
           xDif_Camb:= abs(DM1.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat -
                           DM1.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat);//En Mon.Ext.
           DM1.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xDif_Camb;

           if DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat > DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat then
              DM1.cdsCntCaja.FieldByName('DCDH').AsString := 'D'
           else
              DM1.cdsCntCaja.FieldByName('DCDH').AsString := 'H';
         end
        else
         begin                                            //Provision en Mon.Ext.
           xDif_Camb:= abs(DM1.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat -
                           DM1.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat);//En Mon.Local
           DM1.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := xDif_Camb;
           if DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat > DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat then
              DM1.cdsCntCaja.FieldByName('DCDH').AsString := 'H'
           else
              DM1.cdsCntCaja.FieldByName('DCDH').AsString := 'D';
         end;

        if DM1.cdsCntCaja.FieldByName('DCDH').AsString = 'D' then
         begin
           DM1.cdsCntCaja.FieldByName('CPTOID').AsString  :=  wCptoPer;
           DM1.cdsCntCaja.FieldByName('CUENTAID').AsString:=  wCtaPer;
         end
        else
         begin
           DM1.cdsCntCaja.FieldByName('CPTOID').AsString  :=  wCptoGan;
           DM1.cdsCntCaja.FieldByName('CUENTAID').AsString:=  wCtaGan;
         end;

      end;
    end;
end;

procedure TFContaAmedida.Contab_DifCambio2;
var
 xSql1,xSql : String;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   //08/05/2001 - pjsv
   // se valida por sugerencia de Jorge y Jose, me confirmaron que por el tipo
  // de moneda de la cabecera, para que no genere <> de cambio cuando es local
   xsql := 'TMONID='+quotedstr(dblcTMon.Text);
   xsql1 := 'TMONID='+quotedstr(DM1.cdsRegCxP.FieldByName('TMONID').AsString);
   If (dm1.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') or
      (dm1.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then
    begin
     if DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat<>DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat then
      begin
        DM1.cdsCntCaja.Insert;
        DM1.cdsCntCaja.FieldByName('CIAID').AsString   :=  DM1.cdsRegCxP.FieldByName('CIAID').AsString;
        DM1.cdsCntCaja.FieldByName('TDIARID').AsString :=  DM1.cdsRegCxP.FieldByName('TDIARID').AsString;
        DM1.cdsCntCaja.FieldByName('ECANOMM').AsString :=  DM1.cdsRegCxP.FieldByName('ECANOMM').AsString;
        DM1.cdsCntCaja.FieldByName('ECNOCOMP').AsString:=  DM1.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
        DM1.cdsCntCaja.FieldByName('DCLOTE').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECLOTE').AsString;
        DM1.cdsCntCaja.FieldByName('DOCID').AsString   :=  DM1.cdsRegCxP.FieldByName('DOCID2').AsString;
        DM1.cdsCntCaja.FieldByName('DCSERIE').AsString :=  DM1.cdsRegCxP.FieldByName('CPSERIE').AsString;
        DM1.cdsCntCaja.FieldByName('DCNODOC').AsString :=  DM1.cdsRegCxP.FieldByName('CPNODOC').AsString;
        DM1.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DM1.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DM1.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DM1.cdsCntCaja.FieldByName('CLAUXID').AsString :=  DM1.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
        DM1.cdsCntCaja.FieldByName('DCAUXID').AsString :=  DM1.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
        DM1.cdsCntCaja.FieldByName('CCOSID').AsString  :=  DM1.cdsRegCxP.FieldByName('CCOSID').AsString;
        DM1.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:=  DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
        DM1.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:=  DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
        DM1.cdsCntCaja.FieldByName('DCFLACDR').AsString:=  'S';   //Registro ya cuadrado
        DM1.cdsCntCaja.FieldByName('DCUSER').AsString  :=  DM1.wUsuario;
        DM1.cdsCntCaja.FieldByName('DCFREG').AsDateTime  :=  Date;
        if DM1.SRV_D = 'ORACLE' then
           DM1.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  Date+Time
        else
           DM1.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  Time;
        DM1.cdsCntCaja.FieldByName('DCANO').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECANO').AsString;
        DM1.cdsCntCaja.FieldByName('DCMM').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECMM').AsString;
        DM1.cdsCntCaja.FieldByName('DCDD').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECDD').AsString;
        DM1.cdsCntCaja.FieldByName('DCSS').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECSS').AsString;
        DM1.cdsCntCaja.FieldByName('DCSEM').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECSEM').AsString;
        DM1.cdsCntCaja.FieldByName('DCTRI').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECTRI').AsString;
        DM1.cdsCntCaja.FieldByName('DCAASS').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECAASS').AsString;
        DM1.cdsCntCaja.FieldByName('DCAASEM').AsString :=  DM1.cdsEgrCaja.FieldByName('ECAASEM').AsString;
        DM1.cdsCntCaja.FieldByName('DCAATRI').AsString :=  DM1.cdsEgrCaja.FieldByName('ECAATRI').AsString;
        DM1.cdsCntCaja.fieldbyname('DOCMOD').AsString := Fprincipal.xModulo;
        DM1.cdsCntCaja.FieldByName('TMONID').AsString  :=  DM1.cdsEgrCaja.FieldByName('TMONID').AsString;
        xNReg:=xNReg+1;
        DM1.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

        if DM1.cdsRegCxP.FieldByName('TMONID').AsString=DM1.wtMonExt then
         begin  //Provision en Ext.
           DM1.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DM1.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat*DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
           DM1.cdsCntCaja.FieldByName('DCDH').AsString    := 'H';
           DM1.cdsCntCaja.FieldByName('CPTOID').AsString  := wCptoGan;
           DM1.cdsCntCaja.FieldByName('CUENTAID').AsString:= wCtaGan;
         end;

        //////////////

        DM1.cdsCntCaja.Insert;
        DM1.cdsCntCaja.FieldByName('CIAID').AsString   :=  DM1.cdsRegCxP.FieldByName('CIAID').AsString;
        DM1.cdsCntCaja.FieldByName('TDIARID').AsString :=  DM1.cdsRegCxP.FieldByName('TDIARID').AsString;
        DM1.cdsCntCaja.FieldByName('ECANOMM').AsString :=  DM1.cdsRegCxP.FieldByName('ECANOMM').AsString;
        DM1.cdsCntCaja.FieldByName('ECNOCOMP').AsString:=  DM1.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
        DM1.cdsCntCaja.FieldByName('DCLOTE').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECLOTE').AsString;
        DM1.cdsCntCaja.FieldByName('DOCID').AsString   :=  DM1.cdsRegCxP.FieldByName('DOCID2').AsString;
        DM1.cdsCntCaja.FieldByName('DCSERIE').AsString :=  DM1.cdsRegCxP.FieldByName('CPSERIE').AsString;
        DM1.cdsCntCaja.FieldByName('DCNODOC').AsString :=  DM1.cdsRegCxP.FieldByName('CPNODOC').AsString;
        DM1.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DM1.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DM1.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DM1.cdsCntCaja.FieldByName('CLAUXID').AsString :=  DM1.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
        DM1.cdsCntCaja.FieldByName('DCAUXID').AsString :=  DM1.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
        DM1.cdsCntCaja.FieldByName('CCOSID').AsString  :=  DM1.cdsRegCxP.FieldByName('CCOSID').AsString;
        DM1.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:=  DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
        DM1.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:=  DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
        DM1.cdsCntCaja.FieldByName('DCFLACDR').AsString:=  'S';   //Registro ya cuadrado
        DM1.cdsCntCaja.FieldByName('DCUSER').AsString  :=  DM1.wUsuario;
        DM1.cdsCntCaja.FieldByName('DCFREG').AsDateTime  :=  Date;
        if DM1.SRV_D = 'ORACLE' then
           DM1.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  date+Time
        else
           DM1.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  Time;
        DM1.cdsCntCaja.FieldByName('DCANO').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECANO').AsString;
        DM1.cdsCntCaja.FieldByName('DCMM').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECMM').AsString;
        DM1.cdsCntCaja.FieldByName('DCDD').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECDD').AsString;
        DM1.cdsCntCaja.FieldByName('DCSS').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECSS').AsString;
        DM1.cdsCntCaja.FieldByName('DCSEM').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECSEM').AsString;
        DM1.cdsCntCaja.FieldByName('DCTRI').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECTRI').AsString;
        DM1.cdsCntCaja.FieldByName('DCAASS').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECAASS').AsString;
        DM1.cdsCntCaja.FieldByName('DCAASEM').AsString :=  DM1.cdsEgrCaja.FieldByName('ECAASEM').AsString;
        DM1.cdsCntCaja.FieldByName('DCAATRI').AsString :=  DM1.cdsEgrCaja.FieldByName('ECAATRI').AsString;
        DM1.cdsCntCaja.FieldByName('DOCMOD').AsString := Fprincipal.xModulo;
        DM1.cdsCntCaja.FieldByName('TMONID').AsString  :=  DM1.cdsEgrCaja.FieldByName('TMONID').AsString;
        xNReg:=xNReg+1;
        DM1.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

        if DM1.cdsRegCxP.FieldByName('TMONID').AsString=DM1.wtMonExt then
         begin  //Provision en Ext.
           DM1.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DM1.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat*DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
           DM1.cdsCntCaja.FieldByName('DCDH').AsString    := 'D';
           DM1.cdsCntCaja.FieldByName('CPTOID').AsString  :=  wCptoPer;
           DM1.cdsCntCaja.FieldByName('CUENTAID').AsString:=  wCtaPer;
         end;

        if DM1.cdsCntCaja.fieldbyName('DCDH').AsString = 'D'  then
         begin
          if DM1.cdsCntCaja.fieldbyname('TMONID').AsString= dm1.wtMonLoc then
           DM1.cdsCntCaja.fieldbyName('DEBE').AsFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOLO').AsFloat
          else
           DM1.cdsCntCaja.fieldbyName('DEBE').AsFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').AsFloat;
         end
        else
         begin
          if DM1.cdsCntCaja.fieldbyname('TMONID').AsString= DM1.wtMonLoc then
           DM1.cdsCntCaja.fieldbyName('HABER').AsFloat := DM1.cdsCntCaja.fieldbyName('DCMTOLO').AsFloat
          else
           DM1.cdsCntCaja.fieldbyName('HABER').AsFloat := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').AsFloat;
         end;
      end;
    end;
end;

procedure TFContaAmedida.Contab_EgrCaja;
begin
   DM1.cdsCntCaja.FieldByName('CIAID').AsString   := DM1.cdsEgrcaja.FieldByName('CIAID').AsString;
   DM1.cdsCntCaja.FieldByName('TDIARID').AsString := DM1.cdsEgrCaja.FieldByName('TDIARID').AsString;
   DM1.cdsCntCaja.FieldByName('ECANOMM').AsString := DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DM1.cdsCntCaja.FieldByName('ECNOCOMP').AsString:= DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   DM1.cdsCntCaja.FieldByName('DCLOTE').AsString  := DM1.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   DM1.cdsCntCaja.FieldByName('DOCID').AsString   := DM1.cdsEgrCaja.FieldByName('DOCID').AsString;
   //a pedido de jlc 20/12/2002
   DM1.DisplayDescrip('prvTGE','TGE112','FCHQ,FCBCO','FPAGOID='+quotedstr(DM1.cdsEgrCaja.FieldByName('FPAGOID').AsString),'FCHQ');
   if ((DM1.cdsQry.fieldbyname('FCHQ').AsString='1') or (DM1.cdsQry.fieldbyname('FCHQ').AsString='S'))
      and (DM1.cdsQry.fieldbyname('FCBCO').AsString='S')
       then
      DM1.cdsCntCaja.FieldByName('DCNODOC').AsString := DM1.cdsEgrCaja.FieldByName('ECNOCHQ').AsString
   else
      DM1.cdsCntCaja.FieldByName('DCNODOC').AsString := DM1.cdsEgrCaja.FieldByName('ECNODOC').AsString;

   DM1.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   DM1.cdsCntCaja.FieldByName('CPTOID').AsString  := DM1.cdsEgrCaja.FieldByName('CPTOID').AsString;
   DM1.cdsCntCaja.FieldByName('CUENTAID').AsString:= DM1.cdsEgrCaja.FieldByName('CUENTAID').AsString;
   DM1.cdsCntCaja.FieldByName('DCDH').AsString    := 'H';
   DM1.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:= DM1.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DM1.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:= DM1.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DM1.cdsCntCaja.FieldByName('TMONID').AsString  := DM1.cdsEgrCaja.FieldByName('TMONID').AsString;
   DM1.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DM1.FRound(DM1.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat-xRetLoc,15,2);
   DM1.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat:= DM1.FRound(DM1.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat-xRetExt,15,2);
   if DM1.cdsCntCaja.FieldByName('TMONID').AsString=DM1.wTMonLoc then
   begin
     DM1.cdsCntCaja.FieldByName('DCMTOORI').AsFloat:= DM1.cdsCntCaja.FieldByName('DCMTOLO').AsFloat;
   end
   else
   begin
     DM1.cdsCntCaja.FieldByName('DCMTOORI').AsFloat:= DM1.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat;
   end;

   DM1.cdsCntCaja.FieldByName('DCFLACDR').AsString:= 'S';   //Registro ya cuadrado
   DM1.cdsCntCaja.FieldByName('DCUSER').AsString  := DM1.wUsuario;
   DM1.cdsCntCaja.FieldByName('DCFREG').AsDateTime  := DateS;
   if DM1.SRV_D = 'ORACLE' then
      DM1.cdsCntCaja.FieldByName('DCHREG').AsDateTime  := DateS+Time
   else
      DM1.cdsCntCaja.FieldByName('DCHREG').AsDateTime  := Time;
   DM1.cdsCntCaja.FieldByName('DCANO').AsString   := DM1.cdsEgrCaja.FieldByName('ECANO').AsString;
   DM1.cdsCntCaja.FieldByName('DCMM').AsString    := DM1.cdsEgrCaja.FieldByName('ECMM').AsString;
   DM1.cdsCntCaja.FieldByName('DCDD').AsString    := DM1.cdsEgrCaja.FieldByName('ECDD').AsString;
   DM1.cdsCntCaja.FieldByName('DCSS').AsString    := DM1.cdsEgrCaja.FieldByName('ECSS').AsString;
   DM1.cdsCntCaja.FieldByName('DCSEM').AsString   := DM1.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DM1.cdsCntCaja.FieldByName('DCTRI').AsString   := DM1.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DM1.cdsCntCaja.FieldByName('DCAASS').AsString  := DM1.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DM1.cdsCntCaja.FieldByName('DCAASEM').AsString := DM1.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DM1.cdsCntCaja.FieldByName('DCAATRI').AsString := DM1.cdsEgrCaja.FieldByName('ECAATRI').AsString;
   DM1.cdsCntCaja.FieldByName('DCGLOSA').AsString := DM1.cdsEgrCaja.FieldByName('ECGIRA').AsString;
   DM1.cdsCntCaja.FieldByName('FCAB').AsString := '1' ;
   DM1.cdsCntCaja.fieldbyname('DOCMOD').AsString  := Fprincipal.xModulo;
   DM1.cdsCntCaja.fieldbyname('DCFEMIS').AsDateTime := DM1.cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime;
   DM1.cdsCntCaja.fieldbyname('DCFVCMTO').AsDateTime:= DM1.cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime;
   xNReg:=xNReg+1;
   DM1.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
end;

procedure TFContaAmedida.AsientoDifTotal;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
     DM1.cdsCntCaja.Insert;
     DM1.cdsCntCaja.FieldByName('CIAID').AsString   :=  DM1.cdsEgrCaja.FieldByName('CIAID').AsString;
     DM1.cdsCntCaja.FieldByName('TDIARID').AsString :=  DM1.cdsEgrCaja.FieldByName('TDIARID').AsString;
     DM1.cdsCntCaja.FieldByName('ECANOMM').AsString :=  DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString;
     DM1.cdsCntCaja.FieldByName('ECNOCOMP').AsString:=  DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
     DM1.cdsCntCaja.FieldByName('DCLOTE').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECLOTE').AsString;
     DM1.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
     DM1.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
     DM1.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
     DM1.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DM1.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat ;
     DM1.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DM1.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat ;
     DM1.cdsCntCaja.FieldByName('DCANO').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECANO').AsString;
     DM1.cdsCntCaja.FieldByName('DCMM').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECMM').AsString;
     DM1.cdsCntCaja.FieldByName('DCDD').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECDD').AsString;
     DM1.cdsCntCaja.FieldByName('DCSS').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECSS').AsString;
     DM1.cdsCntCaja.FieldByName('DCSEM').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECSEM').AsString;
     DM1.cdsCntCaja.FieldByName('DCTRI').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECTRI').AsString;
     DM1.cdsCntCaja.FieldByName('DCAASS').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECAASS').AsString;
     DM1.cdsCntCaja.FieldByName('DCAASEM').AsString :=  DM1.cdsEgrCaja.FieldByName('ECAASEM').AsString;
     DM1.cdsCntCaja.FieldByName('DCAATRI').AsString :=  DM1.cdsEgrCaja.FieldByName('ECAATRI').AsString;

     DM1.cdsCntCaja.FieldByName('DCFLACDR').AsString:=  'S';   //Registro ya cuadrado
     DM1.cdsCntCaja.FieldByName('DCUSER').AsString  :=  DM1.wUsuario;
     DM1.cdsCntCaja.FieldByName('DCFREG').AsDateTime  :=  Date;
     if DM1.SRV_D = 'ORACLE' then
        DM1.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  date+time
     else
        DM1.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  Time;
     DM1.cdsCntCaja.FieldByName('TMONID').AsString  :=  DM1.cdsEgrCaja.FieldByName('TMONID').AsString;
     xNReg:=xNReg+1;
     DM1.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

   if ( DM1.FRound(xDebeT,15,2)<>DM1.FRound(xHabeT,15,2) ) then
    begin
     if xDebeT>xHabeT then
      begin
       DM1.cdsCntCaja.FieldByName('DCMTOLO').AsFloat   := abs(DM1.FRound(xDebeT-xHabeT,15,2));
       DM1.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat  := 0;
       DM1.cdsCntCaja.FieldByName('DCDH').AsString     := 'H';
       DM1.cdsCntCaja.FieldByName('CPTOID').AsString   :=  wCptoGan;
       DM1.cdsCntCaja.FieldByName('CUENTAID').AsString :=  wCtaGan;
       DM1.cdsCntCaja.FieldByName('DCGLOSA').AsString  := 'Diferencia de Cambio';
      end
     else
      begin
       DM1.cdsCntCaja.FieldByName('DCMTOLO').AsFloat   := abs(DM1.FRound(xHabeT-xDebeT,15,2));
       DM1.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat  := 0;
       DM1.cdsCntCaja.FieldByName('DCDH').AsString     := 'D';
       DM1.cdsCntCaja.FieldByName('CPTOID').AsString   :=  wCptoPer;
       DM1.cdsCntCaja.FieldByName('CUENTAID').AsString :=  wCtaPer;
       DM1.cdsCntCaja.FieldByName('DCGLOSA').AsString  := 'Diferencia de Cambio';
      end;
    end;

   if ( DM1.FRound(xDebeTD,15,2)<>DM1.FRound(xHabeTD,15,2) ) then
    begin
     if xDebeTD>xHabeTD then
      begin
       DM1.cdsCntCaja.FieldByName('DCMTOLO').AsFloat   := 0;
       DM1.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat  := abs(DM1.FRound(xDebeTD-xHabeTD,15,2));
       DM1.cdsCntCaja.FieldByName('DCDH').AsString     := 'H';
       DM1.cdsCntCaja.FieldByName('CPTOID').AsString   := wCptoGan;
       DM1.cdsCntCaja.FieldByName('CUENTAID').AsString := wCtaGan;
       DM1.cdsCntCaja.FieldByName('DCGLOSA').AsString  := 'Diferencia de Cambio';
      end
     else
      begin
       DM1.cdsCntCaja.FieldByName('DCMTOLO').AsFloat   := 0;
       DM1.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat  := abs(DM1.FRound(xHabeTD-xDebeTD,15,2));
       DM1.cdsCntCaja.FieldByName('DCDH').AsString     := 'D';
       DM1.cdsCntCaja.FieldByName('CPTOID').AsString   :=  wCptoPer;
       DM1.cdsCntCaja.FieldByName('CUENTAID').AsString :=  wCtaPer;
       DM1.cdsCntCaja.FieldByName('DCGLOSA').AsString  := 'Diferencia de Cambio';
      end;
   end;
end;

procedure TFContaAmedida.z2bbtnContClick(Sender: TObject);
var
 xSql : String;
begin
 if DM1.cdsEgrCaja.FieldByName('ECEstado').AsString = 'C' then
  begin
   if DM1.cdsEgrCaja.fieldbyname('FEXTCHQ').AsString = '1' then
    begin
     ShowMessage('No Puede Contabilizar este Movimiento ' + #13 +
     		'Pues se encuentra extornado') ;
     Exit ;
    end ;


   if dm1.MesCerrado(copy(DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString,5,2),
                   copy(DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString,1,4),
                   DM1.cdsEgrCaja.FieldByName('CIAID').AsString) then
    begin
     ShowMessage(' Mes cerrado, no se puede contabilizar');
     exit;
    end;

   if MessageDlg('¿Contabilizar y Generar Asientos Automaticos?',mtConfirmation,
   						[mbYes, mbNo], 0)=mrYes then
    begin

     Screen.Cursor := crHourglass ;
     //RecCptosDifC ;
     Contabiliza;             // Realiza la generacion del Asiento
   ActualizaCNT311( DM1.cdsEgrcaja.FieldByName('CIAID').AsString,
                       DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
                       DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                       DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString );

     if SOLConta(DM1.cdsEgrCaja.FieldByName('CIAID').AsString,
               DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
               DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString,
               DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
               dm1.SRV_D, 'CCNA', DM1.wModulo, DM1.cdsCNT311, DM1.cdsNivel,
               DM1.cdsResultSet, DM1.DCOM1, Self ) then
      begin
       DM1.cdsEgrCaja.Edit ;
       DM1.cdsEgrCaja.FieldByName('ECConta').AsString:='S';   //Establece como Contabilizado el flag
       DM1.cdsEgrCaja.FieldByName('ECESTADO').AsString    := 'C';
       DM1.cdsEgrCaja.FieldByName('ECUSER').AsString      := DM1.wUsuario;
       DM1.cdsEgrCaja.FieldByName('ECFREG').AsDateTime    := DateS;
       if DM1.SRV_D = 'ORACLE' then
        DM1.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= DateS+Time
       else
        DM1.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;
       if Copy(xRegAdicional,1,2)='1.' then
        DM1.cdsEgrCaja.FieldByName('ECPERREC').AsString:=xRegAdicional;

       xSQL:='Select * from CAJA302 '
           +'Where CIAID='+quotedstr(DM1.cdsEgrCaja.FieldByName('CIAID').AsString)+' and '
           +      'ECANOMM='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString) +' and '
           +      'TDIARID='+quotedstr(DM1.cdsEgrCaja.FieldByName('TDIARID').AsString)+' and '
           +      'ECNOCOMP='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
       DM1.cdsEgrCaja.DataRequest( xSQL );
       DM1.AplicaDatos(DM1.cdsEgrCaja, 'EGRCAJA');
      end;
     z2bbtnCont.Enabled := False;
     lblEstado.Caption  :='Cancelado y Contab.' ;
     Screen.Cursor := crDefault ;


    end;
  end
 else
  ShowMessage('Imposible Contabilizar');



end;

end.


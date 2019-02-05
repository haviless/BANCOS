unit Caja270;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, wwdblook, Mask, wwdbedit, wwdbdatetimepicker,
  ExtCtrls, Buttons, Wwdbigrd, Grids, Wwdbgrid, ppEndUsr, ppProd, ppClass,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands, ppCache, db, Wwdbdlg,
  oaContabiliza, fcLabel, fcpanel;
type
  TFOrdenPago = class(TForm)
    dbgdata: TwwDBGrid;
    Z2bbtnSalir: TBitBtn;
    Z2bbtnPrint: TBitBtn;
    btnNuevo: TwwIButton;
    pnlCab1: TPanel;
    dbeObs: TwwDBEdit;
    pnlCab: TPanel;
    Label1: TLabel;
    dtpFecha: TwwDBDateTimePicker;
    lblTMon: TLabel;
    dblcTMoneda: TwwDBLookupCombo;
    edtTMoneda: TEdit;
    Label2: TLabel;
    dbeNumero: TwwDBEdit;
    ppr1: TppReport;
    ppdb1: TppDBPipeline;
    ppd1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    pnlGraba: TPanel;
    Label4: TLabel;
    bbtnGraba: TBitBtn;
    dbeUsuGraba: TwwDBEdit;
    pnlVisa: TPanel;
    bbtnAcepta: TBitBtn;
    Label5: TLabel;
    dbeUsuAcepta: TwwDBEdit;
    pnlCaja: TPanel;
    bbtnCajaVis: TBitBtn;
    Label6: TLabel;
    dbeCaja: TwwDBEdit;
    pnlPagado: TPanel;
    Label7: TLabel;
    bbtnPagaVis: TBitBtn;
    dbeCajero: TwwDBEdit;
    ppr2: TppReport;
    ppdb2: TppDBPipeline;
    ppd2: TppDesigner;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    bbtnRepVisado: TBitBtn;
    ppdb3: TppDBPipeline;
    ppr3: TppReport;
    ppd3: TppDesigner;
    bbtnCerrarCaja: TBitBtn;
    bbtnAsigna: TBitBtn;
    bbtnCopiar: TBitBtn;
    bbtnPagar: TBitBtn;
    bbtnRepPagado: TBitBtn;
    Label3: TLabel;
    Label8: TLabel;
    dblcdCpto: TwwDBLookupComboDlg;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TEdit;
    dbeCCos: TwwDBEdit;
    Label9: TLabel;
    pnlOficio: TPanel;
    Label10: TLabel;
    dbeOficio: TwwDBEdit;
    Z2bbtnCont: TBitBtn;
    bbtnImprimeConta: TBitBtn;
    ppdb4: TppDBPipeline;
    ppr4: TppReport;
    ppd4: TppDesigner;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    z2bbtnAnula: TBitBtn;
    fcpAnula: TfcPanel;
    procedure btnNuevoClick(Sender: TObject);
    procedure dblcTMonedaExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnGrabaClick(Sender: TObject);
    procedure bbtnAceptaClick(Sender: TObject);
    procedure dbgdataDblClick(Sender: TObject);
    procedure Z2bbtnPrintClick(Sender: TObject);
    procedure dbgdataKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnCajaVisClick(Sender: TObject);
    procedure bbtnPagaVisClick(Sender: TObject);
    procedure bbtnPagarClick(Sender: TObject);
    procedure bbtnRepPagadoClick(Sender: TObject);
    procedure Z2bbtnCambiaCondClick(Sender: TObject);
    procedure bbtnRepVisadoClick(Sender: TObject);
    procedure bbtnAsignaClick(Sender: TObject);
    procedure bbtnCopiarClick(Sender: TObject);
    procedure bbtnCerrarCajaClick(Sender: TObject);
    procedure Z2bbtnSalirClick(Sender: TObject);
    procedure dblcdCptoExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure Z2bbtnContClick(Sender: TObject);
    procedure bbtnImprimeContaClick(Sender: TObject);
    procedure z2bbtnAnulaClick(Sender: TObject);
  private
    { Private declarations }
    cCia : String;
    cPermiso : String;
    cAnoMM  : String;
    cNoComp : String;
    cCuenta : String;
    cCenCos : String;
    dTipCam : Double;
    wCptoGan  ,
    wCptoPer  ,
    wCtaGan   ,
    wCtaPer, cNumMov : String ;
    xNReg  : Integer;
    cCtaAux, cCtaCCo : String;
    procedure Suma;
    procedure Permisos;
    procedure GeneraComp;
    procedure RecCptosDifC;
    procedure Contabiliza;
    procedure Contab_IngCaja( cDH, cCuenta, cGlosa : String );
    procedure Contab_Doc;
    procedure AsignaDataSource;
  public
    { Public declarations }
  end;

var
  FOrdenPago: TFOrdenPago;

implementation

{$R *.dfm}

USES CAJADM, CAJA274, CAJA275, CAJA276, CAJA278, oaTE2000;

procedure TFOrdenPago.btnNuevoClick(Sender: TObject);
var
  cItem, cNum, xSQL : String;
begin

   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      ShowMessage('Orden de Pago Anulada. Verificar...');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('USUACEPTA').AsString<>'' then
   begin
      ShowMessage('Orden de Pago se encuentra Aceptada');
      Exit;
   end;

	Try
      DMTE.cdsProvCta.Last;
      if DMTE.cdsProvCta.FieldByname('ITEM').AsString='' then
         cItem:='001'
      else
      begin
         cItem:= DMTE.StrZero( InttoStr(DMTE.cdsProvCta.FieldByname('ITEM').AsInteger+1),3);
      end;

      DMTE.cdsProvCta.Insert;
      DMTE.cdsProvCta.FieldByname('ITEM').AsString:=cItem;

      xSQL:='Select nvl(MAX(NUMERO),''0'') NUMERO from CAJ_ORD_PAG_DET';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.Datarequest( xSQL );
      DMTE.cdsQry.Open;

      cNum:=DMTE.StrZero( IntToStr(DMTE.cdsQry.FieldByname('NUMERO').AsInteger+1),6);

      FPromotorEdit := TFPromotorEdit.Create(Application);
      FPromotorEdit.pnlDet.Enabled:=True;
      FPromotorEdit.ShowModal;
	Finally
      FPromotorEdit.Free;
      Suma;
  end;
end;

procedure TFOrdenPago.dblcTMonedaExit(Sender: TObject);
begin
   edtTMoneda.text:= DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMoneda.Text,'TMONDES') ;

   if edtTMoneda.Text='' then begin
      edtTmoneda.text   :='';
      dblcTMoneda.Text  :='';
      ShowMessage('Error : Moneda no Valida');
      dblcTMoneda.SetFocus;
   end;
end;

procedure TFOrdenPago.FormActivate(Sender: TObject);
var
  cSQL, xSQL : String;
begin
   AsignaDataSource;

   fcpAnula.Visible:=False;

   xSQL:='Select * from TGE105 where BCOTIPCTA=''C''';
   DMTE.cdsConsulta.Close;
   DMTE.cdsConsulta.DataRequest( xSQL );
   DMTE.cdsConsulta.Open;
   dblcBanco.LookupTable:=DMTE.cdsConsulta;

   cSQL:='select CPTOID, CPTODES, CUENTAID from CAJA201 '
        +'WHERE FCTZ=''M''';
   DMTE.cdsCptos.Close;
   DMTE.cdsCptos.DataRequest( cSQL );
   DMTE.cdsCptos.Open;

   Permisos;

   cCia:='02';

   if DMTE.wModo='A' then
   begin
      pnlCab1.Enabled:=True;
      pnlCab.Enabled :=True;

      DMTE.cdsPagoCxP.FieldByname('FECHA').AsDateTime:=Date;
      DMTE.cdsPagoCxP.FieldByname('BANCOID').AsString:='15';
      xSQL:='BANCOID='+quotedstr(dblcBanco.text);
      edtBanco.text:=DMTE.DisplayDescrip('prvTGE','TGE105','BANCONOM,CUENTAID,CPTOID',xSQL,'BANCONOM');

      DMTE.cdsPagoCxP.FieldByname('TMONID').AsString :='N';
      edtTMoneda.text:= DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMoneda.Text,'TMONDES') ;

      xSQL:='Select * from CAJ_ORD_PAG_DET where CIAID=''ZZ'' AND NUMERO=''ZZZZZZ''';
   end
   else
   begin

      if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
      begin
         fcpAnula.Visible:=True;
         fcpAnula.BringToFront;
         fcpAnula.Transparent := True;
         fcpAnula.invalidate;
      end;

      xSQL:='BANCOID='+quotedstr(dblcBanco.text);
      edtBanco.text:=DMTE.DisplayDescrip('prvTGE','TGE105','BANCONOM,CUENTAID,CPTOID',xSQL,'BANCONOM');

      edtTMoneda.text:= DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMoneda.Text,'TMONDES') ;


      if DMTE.cdsPagoCxP.FieldByname('USUACEPTA').AsString<>'' then
         pnlCab1.Enabled:=False
      else
         pnlCab1.Enabled:=True;

      if DMTE.cdsPagoCxP.FieldByname('USUCAJA').AsString='' then
         pnlOficio.Enabled:=True
      else
         pnlOficio.Enabled:=False;

      pnlCab.Enabled :=False;
      xSQL:='Select * from CAJ_ORD_PAG_DET '
           +'where CIAID=''' +DMTE.cdsPagoCxP.FieldByname('CIAID').AsString+''' '
           +  'AND NUMERO='''+DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString+'''';
   end;

   if DMTE.cdsPagoCxP.FieldByname('USUACEPTA').AsString<>'' then
   begin
      pnlCab1.Enabled:=False;
   end;

   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      pnlCab1.Enabled:=False;
      pnlOficio.Enabled:=False;
   end;

   DMTE.cdsProvCta.Close;
   DMTE.cdsProvCta.DataRequest( xSQL );
   DMTE.cdsProvCta.Open;
   DMTE.cdsProvCta.IndexFieldNames:='ITEM';

   Suma;
end;

procedure TFOrdenPago.bbtnGrabaClick(Sender: TObject);
var
   xSQL : String;
   cNum, cItem : String;
   nCon : Integer;
begin
   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      ShowMessage('Orden de Pago se encuentra Anulada. Verificar...');
      Exit;
   end;

   if dblcdCpto.Text='' then
   begin
      ShowMessage('Debe ingresar Concepto');
      Exit;
   end;

   if dbeObs.Text='' then
   begin
      ShowMessage('Debe ingresar Observación');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('USUACEPTA').AsString<>'' then
   begin
      ShowMessage('Orden de Pago se encuentra Aceptada. No puede Grabar');
      Exit;
   end;
   DMTE.cdsPagoCxP.Edit;
   if dbeNumero.text='' then
   begin
      xSQL:='Select nvl(MAX(NUMERO),''0'') NUMERO from CAJ_ORD_PAG_CAB';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.Datarequest( xSQL );
      DMTE.cdsQry.Open;

      cNum:=DMTE.StrZero( IntToStr(DMTE.cdsQry.FieldByname('NUMERO').AsInteger+1),6);

      xSQL:='Select * from CAJ_ORD_PAG_CAB '
           +'where CIAID='''+cCia+''' AND NUMERO='''+DMTE.cdsQry.FieldByname('NUMERO').AsString+'''';
      DMTE.cdsPagoCxP.Datarequest( xSQL );

      DMTE.cdsPagoCxP.Edit;
      DMTE.cdsPagoCxP.FieldByname('CIAID').AsString  :=cCia;
      DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString :=cNum;
      DMTE.cdsPagoCxP.FieldByname('FREG').AsDateTime :=Date + SysUtils.Time;
      DMTE.cdsPagoCxP.FieldByname('HREG').AsDateTime :=Date + SysUtils.Time;
      DMTE.cdsPagoCxP.FieldByname('USUARIO').AsString:=DMTE.wUsuario;
      DMTE.cdsPagoCxP.FieldByname('MONTOT').AsFloat :=strToCurr(stringreplace(dbgdata.ColumnByName('MONTO').FooterValue,',','',[rfReplaceAll]));
      pnlCab.Enabled:=False;
   end;

   nCon:=0;
   DMTE.cdsProvCta.First;
   while not DMTE.cdsProvCta.eof do
   begin
      nCon:=nCon+1;
      cItem:= DMTE.StrZero( InttoStr(nCon),3);
      DMTE.cdsProvCta.Edit;
      DMTE.cdsProvCta.FieldByname('CIAID').AsString  :=DMTE.cdsPagoCxP.FieldByname('CIAID').AsString;
      DMTE.cdsProvCta.FieldByname('NUMERO').AsString :=DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString;
      DMTE.cdsProvCta.FieldByname('ITEM').AsString   :=cItem;
      DMTE.cdsProvCta.Post;
      DMTE.cdsProvCta.Next;
   end;
   Suma;
   DMTE.cdsPagoCxP.FieldByname('MONTOT').AsFloat  :=strToCurr(stringreplace(dbgdata.ColumnByName('MONTO').FooterValue,',','',[rfReplaceAll]));
   DMTE.cdsPagoCxP.Post;

   if DMTE.cdsProvCta.ApplyUpdates( 0 )>0 then
      ShowMessage('Error en Grabación (CAB)');
   if DMTE.cdsPagoCxP.ApplyUpdates( 0 )>0 then
      ShowMessage('Error en Grabación (DET)');

   xSQL:='Select * from CAJ_ORD_PAG_DET '
        +'where CIAID=''' +DMTE.cdsPagoCxP.FieldByname('CIAID').AsString+''' '
        +  'AND NUMERO='''+DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString+'''';
   DMTE.cdsProvCta.Close;
   DMTE.cdsProvCta.DataRequest( xSQL );
   DMTE.cdsProvCta.Open;
   ShowMessage('Orden de Pago Grabada');
end;

procedure TFOrdenPago.bbtnAceptaClick(Sender: TObject);
var
   cSQL : String;
begin
   if dblcdCpto.Text='' then
   begin
      ShowMessage('Debe ingresar Concepto');
      Exit;
   end;

   if dbeObs.Text='' then
   begin
      ShowMessage('Debe ingresar Observación');
      Exit;
   end;

   if DMTE.cdsProvCta.RecordCount<=0 then
   begin
      ShowMessage('Debe Registrar Detalle');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('USUARIO').AsString='' then
   begin
      ShowMessage('Orden de Pago se debe Grabar');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('USUACEPTA').AsString<>'' then
   begin
      ShowMessage('Orden de Pago se encuentra Aceptada');
      Exit;
   end;

   cSQL:='Select USUARIO, CCOSID from CAJ_USU_ORD_PAG '
        +'Where AUTORIZADO=''VISA'' AND USUARIO='''+DMTE.wUsuario+'''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.Datarequest( cSQL );
   DMTE.cdsQry.Open;
   if DMTE.cdsQry.FieldByName('CCOSID').AsString='' then
   begin
      ShowMessage('Usuario no tiene asignado un Centro de Costo');
      Exit;
   end;

   DMTE.cdsPagoCxP.Edit;
   DMTE.cdsPagoCxP.FieldByname('FECACEPTA').AsDateTime:=Date + SysUtils.Time;
   DMTE.cdsPagoCxP.FieldByname('USUACEPTA').AsString  :=DMTE.wUsuario;
   DMTE.cdsPagoCxP.FieldByname('MONTOT').AsFloat      :=strToCurr(stringreplace(dbgdata.ColumnByName('MONTO').FooterValue,',','',[rfReplaceAll]));
   DMTE.cdsPagoCxP.FieldByname('CCOSID').AsString     :=DMTE.cdsQry.FieldByName('CCOSID').AsString;
   pnlCab.Enabled:=False;

   DMTE.cdsPagoCxP.Post;
   DMTE.cdsPagoCxP.ApplyUpdates( 0 );
   DMTE.cdsProvCta.ApplyUpdates( 0 );

   pnlCab1.Enabled:=False;
   btnNuevo.Enabled:=False;

   ShowMessage('Aceptado');
end;

procedure TFOrdenPago.dbgdataDblClick(Sender: TObject);
begin
   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then Exit;

   if DMTE.cdsPagoCxP.FieldByname('USUACEPTA').AsString<>'' then
   begin
      ShowMessage('Documento ya fue Aceptado');
      Exit;
   end;

	Try
      DMTE.cdsProvCta.Edit;

      FPromotorEdit := TFPromotorEdit.Create(Application);
      FPromotorEdit.pnlDet.Enabled:=False;
      FPromotorEdit.ShowModal;
	Finally
      FPromotorEdit.Free;
      Suma;
  end;
end;


procedure TFOrdenPago.Z2bbtnPrintClick(Sender: TObject);
var
   cSQL : String;
begin
   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      ShowMessage('Orden de Pago Anulada. Verificar...');
      Exit;
   end;

   if dblcdCpto.Text='EG0173' then
   begin
   cSQL:='select A.*, B.*, C.*, '
        +  'CASE WHEN CPTOID=''EG0173'' THEN ''REPRESENTANTES'' ELSE ''MOVILIDADES'' END TITULO '
        +'From CAJ_ORD_PAG_CAB A, CAJ_ORD_PAG_DET B, COB201 C '
        +'where A.CIAID=''' +DMTE.cdsPagoCxP.FieldByname('CIAID').AsString +''' '
        +  'AND A.NUMERO='''+DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString+''' '
        + ' AND A.CIAID=B.CIAID AND A.NUMERO=B.NUMERO '
        + ' AND B.AUXID=C.REPRID(+) '
        +'Order by ITEM';
   end
   else
   begin
   cSQL:='select A.*, B.*, C.AUXDNI, '
        +  'CASE WHEN CPTOID=''EG0173'' THEN ''REPRESENTANTES'' ELSE ''MOVILIDADES'' END TITULO '
        +'From CAJ_ORD_PAG_CAB A, CAJ_ORD_PAG_DET B, CNT201 C '
        +'where A.CIAID=''' +DMTE.cdsPagoCxP.FieldByname('CIAID').AsString +''' '
        +  'AND A.NUMERO='''+DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString+''' '
        + ' AND A.CIAID=B.CIAID AND A.NUMERO=B.NUMERO '
        + ' AND B.CLAUXID=C.CLAUXID(+) AND B.AUXID=C.AUXID(+) '
        +'Order by ITEM';
   end;

   DMTE.cdsQry5.Close;
   DMTE.cdsQry5.DataRequest( cSQL );
   DMTE.cdsQry5.Open;
   DMTE.cdsQry5.Last;

   ppdb1.DataSource:=DMTE.dsQry5;

   if dblcdCpto.Text='EG0173' then
      ppr1.TEMPLATE.FileName := wRutaRpt + '\Representantes.rtm'
   else
      ppr1.TEMPLATE.FileName := wRutaRpt + '\Promotores.rtm';

	 ppr1.template.LoadFromFile ;

   if DMTE.wUsuario='FPAZOS' then
      ppd1.ShowModal
   else
      ppr1.Print;

   ppdb1.DataSource:=nil;
end;

procedure TFOrdenPago.dbgdataKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if (Key=VK_DELETE) and (ssCtrl in Shift)  then  //^Del
	begin
     if DMTE.cdsPagoCxP.FieldByname('USUACEPTA').AsString<>'' then
     begin
        ShowMessage('Documento Aceptado');
        Exit;
     end;

     DMTE.cdsProvCta.Delete;

     Suma;
  end;
end;

procedure TFOrdenPago.Suma;
var
   nMonto : Double;
   nMonPa : Double;
begin
   DMTE.cdsProvCta.First ;
   while not DMTE.cdsProvCta.Eof do
   begin
      nMonto := nMonto + DMTE.FRound(DMTE.cdsProvCta.FieldByName('MONTO').AsFloat,15,2) ;
      nMonPa := nMonPa + DMTE.FRound(DMTE.cdsProvCta.FieldByName('MONPAG').AsFloat,15,2) ;
      DMTE.cdsProvCta.Next ;
   end ;

   dbgdata.ColumnByName('MONTO').FooterValue :=floattostrf(nMonto, ffNumber, 10, 2) ;
   dbgdata.ColumnByName('MONPAG').FooterValue:=floattostrf(nMonPa, ffNumber, 10, 2) ;
end;


procedure TFOrdenPago.Permisos;
var
   xSQL : String;
begin
  xSQL:='select * from CAJ_USU_ORD_PAG where USUARIO='''+DMTE.wUsuario+''' ORDER BY NIVEL DESC';
  DMTE.cdsQry.Close;
  DMTE.cdsQry.Datarequest( xSQL );
  DMTE.cdsQry.Open;

  cPermiso:=DMTE.cdsQry.FieldByname('AUTORIZADO').AsString;

  pnlGraba.Color   :=$007373B9;
  pnlVisa.Color    :=$007373B9;
  pnlCaja.Color    :=$007373B9;
  pnlPagado.Color  :=$007373B9;
  pnlOficio.Color  :=$007373B9;

  pnlGraba.Enabled :=False;
  pnlVisa.Enabled  :=False;
  pnlCaja.Enabled  :=False;
  pnlPagado.Enabled:=False;
  bbtnPagar.Enabled:=False;
  btnNuevo.Enabled :=False;
  pnlOficio.Enabled:=False;

   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      Exit;
   end;

  if cPermiso='GRAB' then
  begin
     pnlGraba.Color:=$00E2E2E2;
     pnlGraba.Enabled :=True;
     btnNuevo.Enabled :=True;
  end;
  if cPermiso='VISA' then
  begin
     pnlGraba.Color:=$00E2E2E2;
     pnlVisa.Color :=$00E2E2E2;
     pnlGraba.Enabled :=True;
     pnlVisa.Enabled  :=True;
     btnNuevo.Enabled :=True;
  end;
  if cPermiso='GERE' then
  begin
     pnlGraba.Color :=$00E2E2E2;
     pnlVisa.Color  :=$00E2E2E2;
     pnlCaja.Color  :=$00E2E2E2;
     pnlPagado.Color:=$00E2E2E2;
     pnlVisa.Enabled  :=True;
     pnlGraba.Enabled :=True;
     btnNuevo.Enabled :=True;
     pnlCaja.Enabled  :=True;
     pnlPagado.Enabled:=True;
     bbtnPagar.Enabled:=True;
  end;
  if cPermiso='CAJA' then
  begin
     pnlCaja.Color    :=$00E2E2E2;
     pnlOficio.Color  :=$00E2E2E2;
     pnlCaja.Enabled  :=True;
     pnlOficio.Enabled:=True;
  end;
  if cPermiso='PAGA' then
  begin
     pnlPagado.Color:=$00E2E2E2;
     pnlPagado.Enabled:=True;
     bbtnPagar.Enabled:=True;
  end;
end;

procedure TFOrdenPago.bbtnCajaVisClick(Sender: TObject);
var
   cNumDoc, xSQL : String;
begin
   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      ShowMessage('Orden de Pago se encuentra Anulada. Verificar...');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('NUMDOC').AsString='' THEN
   begin
      ShowMessage('Debe ingresar el número de Oficio');
      pnlOficio.Color  :=$00E2E2E2;
      pnlOficio.Enabled:=True;
      Exit;
   end;

   cNumDoc:=DMTE.cdsPagoCxP.FieldByname('NUMDOC').AsString;

   xSQL:='Select * from CAJ_ORD_PAG_CAB '
        +'where CIAID=''' +DMTE.cdsPagoCxP.FieldByname('CIAID').AsString +''' '
        +  'AND NUMERO='''+DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString+'''';
   DMTE.cdsPagoCxP.Close;
   DMTE.cdsPagoCxP.DataRequest( xSQL );
   DMTE.cdsPagoCxP.Open;

   DMTE.cdsPagoCxP.Edit;
   DMTE.cdsPagoCxP.FieldByname('NUMDOC').AsString:=cNumDoc;
   DMTE.cdsPagoCxP.Post;

   if DMTE.cdsPagoCxP.FieldByname('USUACEPTA').AsString='' then
   begin
      ShowMessage('Orden de Pago tiene que ser Visado por Solicitante');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('NUMDOC').AsString='' THEN
   begin
      ShowMessage('Debe ingresar el número de Oficio');
      pnlOficio.Color  :=$00E2E2E2;
      pnlOficio.Enabled:=True;
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('USUCAJA').AsString<>'' then
   begin
      ShowMessage('Orden de Pago se encuentra Visada por el Jefe de Caja');
      Exit;
   end;

   DMTE.cdsPagoCxP.Edit;
   DMTE.cdsPagoCxP.FieldByname('FECCAJA').AsDateTime:=Date + SysUtils.Time;
   DMTE.cdsPagoCxP.FieldByname('USUCAJA').AsString  :=DMTE.wUsuario;
   DMTE.cdsPagoCxP.Post;
   DMTE.cdsPagoCxP.ApplyUpdates( 0 );

   pnlCab1.Enabled  :=False;
   btnNuevo.Enabled :=False;
   pnlOficio.Enabled:=False;

   ShowMessage('Visado por el Jefe de Caja');
end;

procedure TFOrdenPago.bbtnPagaVisClick(Sender: TObject);
begin
   DMTE.cdsPagoCxP.Refresh;

   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      ShowMessage('Orden de Pago Anulada. Verificar...');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('USUCAJA').AsString='' then
   begin
      ShowMessage('Orden de Pago Debe ser Visada por el Jefe de Caja');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('USUPAGO').AsString<>'' then
   begin
      ShowMessage('Orden de Pago se encuentra Cerrado. Verificar...');
      Exit;
   end;

   if MessageDlg('¿ Seguro de Cerrar la Orden de Pago ?',mtConfirmation,[mbYes, mbNo], 0)=mrNo then
      Exit;

   DMTE.cdsPagoCxP.Edit;
   DMTE.cdsPagoCxP.FieldByname('FECPAGO').AsDateTime:=Date + SysUtils.Time;
   DMTE.cdsPagoCxP.FieldByname('USUPAGO').AsString  :=DMTE.wUsuario;
   DMTE.cdsPagoCxP.FieldByname('MONPAG').AsFloat    :=strToCurr(stringreplace(dbgdata.ColumnByName('MONPAG').FooterValue,',','',[rfReplaceAll]));
   DMTE.cdsPagoCxP.FieldByname('CERRADO').AsString  :='S';
   pnlCab.Enabled:=False;

   DMTE.cdsPagoCxP.Post;
   DMTE.cdsPagoCxP.ApplyUpdates( 0 );

   pnlCab1.Enabled:=False;
   btnNuevo.Enabled:=False;

   ShowMessage('Orden de Pago Cerrada');


end;

procedure TFOrdenPago.bbtnPagarClick(Sender: TObject);
begin
   if DMTE.cdsProvCta.FieldByname('ESTADO').AsString='S' then
   begin
      ShowMessage('Monto ya fue Pagado. Revisar...');
      Exit;
   end;

   DMTE.cdsProvCta.Edit;
   DMTE.cdsProvCta.FieldByname('MONPAG').AsString   :=DMTE.cdsProvCta.FieldByname('MONTO').AsString;
   DMTE.cdsProvCta.FieldByname('FECPAGO').AsDateTime:=Date + SysUtils.Time;
   DMTE.cdsProvCta.FieldByname('USUPAGO').AsString  :=DMTE.wUsuario;
   DMTE.cdsProvCta.FieldByname('ESTADO').AsString   :='S';
   DMTE.cdsProvCta.Post;
   DMTE.cdsProvCta.ApplyUpdates( 0 );
   Suma;
end;

procedure TFOrdenPago.bbtnRepPagadoClick(Sender: TObject);
var
   cSQL : String;
begin
   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      ShowMessage('Orden de Pago se encuentra Anulada. Verificar...');
      Exit;
   end;
   
   cSQL:='select A.*, B.*, C.AUXDNI '
        +'From CAJ_ORD_PAG_CAB A, CAJ_ORD_PAG_DET B, CNT201 C '
        +'where A.CIAID=''' +DMTE.cdsPagoCxP.FieldByname('CIAID').AsString +''' '
        +  'AND A.NUMERO='''+DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString+''' '
        + ' AND A.CIAID=B.CIAID AND A.NUMERO=B.NUMERO '
        + ' AND B.CLAUXID=C.CLAUXID(+) AND B.AUXID=C.AUXID(+) '
        +'Order by ITEM';

   DMTE.cdsQry5.Close;
   DMTE.cdsQry5.DataRequest( cSQL );
   DMTE.cdsQry5.Open;
   DMTE.cdsQry5.Last;

   ppdb2.DataSource:=DMTE.dsQry5;
	 ppr2.TEMPLATE.FileName := wRutaRpt + '\PromotoresPagado.rtm';
	 ppr2.template.LoadFromFile ;
   ppr2.Print;
   //ppd2.ShowModal;

   ppdb2.DataSource:=nil;
end;

procedure TFOrdenPago.Z2bbtnCambiaCondClick(Sender: TObject);
begin
   DMTE.cdsPagoCxP.Close;
   DMTE.cdsPagoCxP.Open;

   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      ShowMessage('Orden de Pago se encuentra Anulada. Verificar...');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('CERRADO').AsString='S' then
   begin
      ShowMessage('Orden de Pago se encuentra Cerrada');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('USUASIGNA').AsString='' then
   begin
      ShowMessage('Falta Asignar Cajero(a)');
      Exit;
   end;


   if DMTE.cdsPagoCxP.FieldByname('USUASIGNA').AsString<>DMTE.wUsuario then
   begin
      ShowMessage('Cajero(a) asignado para pagar es : '+DMTE.cdsPagoCxP.FieldByname('USUASIGNA').AsString );
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('USUCAJA').AsString='' then
   begin
      ShowMessage('El Jefe de Caja debe Visar la Orden de Pago');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('USUPAGO').AsString<>'' then
   begin
      ShowMessage('Orden de Pago se encuentra Cerrada');
      Exit;
   end;

   if dblcdCpto.Text='EG0173' then
   begin
      try
        FVoucher := TFVoucher.Create( self );
        FVoucher.ShowModal;
      Finally
        FVoucher.Free;
      end;
      Exit;
   end;

   DMTE.cdsProvCta.Edit;
   if DMTE.cdsProvCta.FieldByname('ESTADO').AsString='S' then
   begin
     DMTE.cdsProvCta.FieldByname('MONPAG').AsFloat    :=0;
     DMTE.cdsProvCta.FieldByname('FECPAGO').AsDateTime:=Date + SysUtils.Time;
     DMTE.cdsProvCta.FieldByname('USUPAGO').AsString  :=DMTE.wUsuario;
     DMTE.cdsProvCta.FieldByname('ESTADO').AsString   :='';
   end
   else
   begin
     DMTE.cdsProvCta.FieldByname('MONPAG').AsString   :=DMTE.cdsProvCta.FieldByname('MONTO').AsString;
     DMTE.cdsProvCta.FieldByname('FECPAGO').AsDateTime:=Date + SysUtils.Time;
     DMTE.cdsProvCta.FieldByname('USUPAGO').AsString  :=DMTE.wUsuario;
     DMTE.cdsProvCta.FieldByname('ESTADO').AsString   :='S';
   end;
   DMTE.cdsProvCta.Post;
   if DMTE.cdsProvCta.ApplyUpdates( 0 )>0 then
   begin
      ShowMessage('Error al grabar en el detalle. Intente nuevamente');
      DMTE.cdsProvCta.Close;
      DMTE.cdsProvCta.Open;
   end;

   Suma;
end;

procedure TFOrdenPago.bbtnRepVisadoClick(Sender: TObject);
var
   cSQL : String;
begin
   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      ShowMessage('Orden de Pago Anulada. Verificar...');
      Exit;
   end;
   if dblcdCpto.Text='EG0173' then
   begin
   cSQL:='select A.*, B.*, C.*, '
        +  'CASE WHEN CPTOID=''EG0173'' THEN ''REPRESENTANTES'' ELSE ''MOVILIDADES'' END TITULO '
        +'From CAJ_ORD_PAG_CAB A, CAJ_ORD_PAG_DET B, COB201 C '
        +'where A.CIAID=''' +DMTE.cdsPagoCxP.FieldByname('CIAID').AsString +''' '
        +  'AND A.NUMERO='''+DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString+''' '
        + ' AND A.CIAID=B.CIAID AND A.NUMERO=B.NUMERO '
        + ' AND B.AUXID=C.REPRID(+) '
        +'Order by ITEM';
   end
   else
   begin
   cSQL:='select A.*, B.*, C.AUXDNI, '
        +  'CASE WHEN CPTOID=''EG0173'' THEN ''REPRESENTANTES'' ELSE ''MOVILIDADES'' END TITULO '
        +'From CAJ_ORD_PAG_CAB A, CAJ_ORD_PAG_DET B, CNT201 C '
        +'where A.CIAID=''' +DMTE.cdsPagoCxP.FieldByname('CIAID').AsString +''' '
        +  'AND A.NUMERO='''+DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString+''' '
        + ' AND A.CIAID=B.CIAID AND A.NUMERO=B.NUMERO '
        + ' AND B.CLAUXID=C.CLAUXID(+) AND B.AUXID=C.AUXID(+) '
        +'Order by ITEM';
   end;

   DMTE.cdsQry5.Close;
   DMTE.cdsQry5.DataRequest( cSQL );
   DMTE.cdsQry5.Open;
   DMTE.cdsQry5.Last;

   ppdb3.DataSource:=DMTE.dsQry5;
   if dblcdCpto.Text='EG0173' then
      ppr3.TEMPLATE.FileName := wRutaRpt + '\RepresentantesVisado.rtm'
   else
      ppr3.TEMPLATE.FileName := wRutaRpt + '\PromotoresVisado.rtm';
	 ppr3.template.LoadFromFile ;

   if DMTE.wUsuario='FPAZOS' then
      ppd3.ShowModal
   else
      ppr3.Print;

   ppdb3.DataSource:=nil;
end;

procedure TFOrdenPago.bbtnAsignaClick(Sender: TObject);
begin
   DMTE.cdsPagoCxP.Refresh;

   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      ShowMessage('Orden de Pago se encuentra Anulada. Verificar...');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('USUCAJA').AsString='' then
   begin
      ShowMessage('Orden de Pago debe Ser Visado por el Jefe de Caja');
      Exit;
   end;

   try
       FSelecCajero := TFSelecCajero.Create(Application);
       FSelecCajero.ShowModal;
   Finally
       FSelecCajero.Free;
   end;
end;

procedure TFOrdenPago.bbtnCopiarClick(Sender: TObject);
var
   cSQL, cNum : String;
begin
   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      ShowMessage('Orden de Pago se encuentra Anulada. Verificar...');
      Exit;
   end;
   
   if dblcdCpto.Text='' then
   begin
      ShowMessage('Debe ingresar Concepto');
      Exit;
   end;

   if dbeObs.Text='' then
   begin
      ShowMessage('Debe ingresar Observación');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('USUACEPTA').AsString<>'' then
   begin
      ShowMessage('Orden de Pago se encuentra Aceptada');
      Exit;
   end;

   if DMTE.cdsProvCta.RecordCount>0 then
   begin
      ShowMessage('No se puede copiar porque existe detalle Ingresado');
      Exit;
   end;

   try
      FPromotorBusca := TFPromotorBusca.Create(Application);
      FPromotorBusca.ShowModal;
  	Finally
      cNumMov:=FPromotorBusca.cNumero;
      FPromotorBusca.Free;
   end;
   DMTE.cdsPagoCxP.Edit;

   if cNumMov='' then Exit;

   if dbeNumero.text='' then
   begin
      cSQL:='Select nvl(MAX(NUMERO),''0'') NUMERO from CAJ_ORD_PAG_CAB';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.Datarequest( cSQL );
      DMTE.cdsQry.Open;

      cNum:=DMTE.StrZero( IntToStr(DMTE.cdsQry.FieldByname('NUMERO').AsInteger+1),6);

      cSQL:='Select * from CAJ_ORD_PAG_CAB '
           +'where CIAID='''+cCia+''' AND NUMERO='''+DMTE.cdsQry.FieldByname('NUMERO').AsString+'''';
      DMTE.cdsPagoCxP.Datarequest( cSQL );

      DMTE.cdsPagoCxP.Edit;
      DMTE.cdsPagoCxP.FieldByname('CIAID').AsString  :=cCia;
      DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString :=cNum;
      DMTE.cdsPagoCxP.FieldByname('FREG').AsDateTime :=Date + SysUtils.Time;
      DMTE.cdsPagoCxP.FieldByname('HREG').AsDateTime :=Date + SysUtils.Time;
      DMTE.cdsPagoCxP.FieldByname('USUARIO').AsString:=DMTE.wUsuario;
      DMTE.cdsPagoCxP.FieldByname('MONTOT').AsFloat :=strToCurr(stringreplace(dbgdata.ColumnByName('MONTO').FooterValue,',','',[rfReplaceAll]));

      pnlCab.Enabled:=False;

   end;

   DMTE.cdsPagoCxP.FieldByname('MONTOT').AsFloat  :=strToCurr(stringreplace(dbgdata.ColumnByName('MONTO').FooterValue,',','',[rfReplaceAll]));
   DMTE.cdsPagoCxP.Post;

   DMTE.cdsPagoCxP.ApplyUpdates( 0 );
   {
   cSQL:='Insert into CAJ_ORD_PAG_DET( CIAID, NUMERO, AUXID, MONTO, FREG, HREG, USUARIO, ITEM, AUXOBS ) '
        +'Select CIAID, '''+DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString+''', AUXID, MONTO, sysdate, sysdate, '''+DMTE.wUsuario+''', ITEM, AUXOBS '
        +'From CAJ_ORD_PAG_DET '
        +'WHERE NUMERO IN (Select MAX(NUMERO) NUMERO '
        +'From CAJ_ORD_PAG_CAB where NUMERO<'''+DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString+''' GROUP BY CIAID )';
   DMTE.cdsQry5.Close;
   DMTE.cdsQry5.DataRequest( cSQL );
   DMTE.cdsQry5.Execute;
   }
   cSQL:='Insert into CAJ_ORD_PAG_DET( CIAID, NUMERO, CLAUXID, AUXID, '
        +   'MONTO, FREG, HREG, USUARIO, ITEM, AUXOBS ) '
        +'Select CIAID, '''+DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString+''', CLAUXID, AUXID, '
        +   'MONTO, sysdate, sysdate, '''+DMTE.wUsuario+''', ITEM, AUXOBS '
        +'From CAJ_ORD_PAG_DET '
        +'WHERE NUMERO = '''+cNumMov+'''';
   DMTE.cdsQry5.Close;
   DMTE.cdsQry5.DataRequest( cSQL );
   DMTE.cdsQry5.Execute;

   cSQL:='Select * from CAJ_ORD_PAG_DET '
        +'where CIAID=''' +DMTE.cdsPagoCxP.FieldByname('CIAID').AsString+''' '
        +  'AND NUMERO='''+DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString+'''';
   DMTE.cdsProvCta.Close;
   DMTE.cdsProvCta.DataRequest( cSQL );
   DMTE.cdsProvCta.Open;
   Suma;
   ShowMessage('Transferido');
end;

procedure TFOrdenPago.bbtnCerrarCajaClick(Sender: TObject);
begin
   DMTE.cdsPagoCxP.Refresh;

   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      ShowMessage('Orden de Pago Anulada. Verificar...');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('USUCAJA').AsString='' then
   begin
      ShowMessage('Orden de Pago No fue Visada por el Jefe de Caja');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('CONTAB').AsString='S' then
   begin
      ShowMessage('Orden de Pago se encuentra Contabilizada. Revisar...');
      Exit;
   end;

   if ( DMTE.cdsPagoCxP.FieldByname('CERRADO').AsString='S' ) then
   begin
      if MessageDlg('¿ Seguro de Habilitar la Orden de Pago ?',mtConfirmation,[mbYes, mbNo], 0)=mrNo then
         Exit;
   end
   else
   begin
      if MessageDlg('¿ Seguro de Deshabilitar la Orden de Pago ?',mtConfirmation,[mbYes, mbNo], 0)=mrNo then
         Exit;
   end;



   DMTE.cdsPagoCxP.Edit;
   DMTE.cdsPagoCxP.FieldByname('FECCIE').AsDateTime:=Date + SysUtils.Time;
   DMTE.cdsPagoCxP.FieldByname('MONPAG').AsFloat   :=strToCurr(stringreplace(dbgdata.ColumnByName('MONPAG').FooterValue,',','',[rfReplaceAll]));

   if DMTE.cdsPagoCxP.FieldByname('CERRADO').AsString='S' then
   begin
      DMTE.cdsPagoCxP.FieldByname('CERRADO').AsString  :='N';
      DMTE.cdsPagoCxP.FieldByname('USUPAGO').AsString  :='';
   end
   else
   begin
      DMTE.cdsPagoCxP.FieldByname('CERRADO').AsString  :='S';
      DMTE.cdsPagoCxP.FieldByname('USUPAGO').AsString  :=DMTE.cdsPagoCxP.FieldByname('USUASIGNA').AsString;
   end;

   pnlCab.Enabled:=False;

   DMTE.cdsPagoCxP.Post;
   DMTE.cdsPagoCxP.ApplyUpdates( 0 );

   pnlCab1.Enabled:=False;
   btnNuevo.Enabled:=False;

   if DMTE.cdsPagoCxP.FieldByname('CERRADO').AsString='S' then
      ShowMessage('Orden de Pago Cerrada')
   else
      ShowMessage('Orden de Pago Habilitada');
end;

procedure TFOrdenPago.Z2bbtnSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFOrdenPago.dblcdCptoExit(Sender: TObject);
var
  cSQL : String;
begin
  cSQL := 'CPTOID='+quotedstr(dblcdCpto.Text);
  DMTE.cdsPagoCxP.FieldByName('OBSERVA').AsString:=DMTE.DisplayDescrip('prvTGE','CAJA201','CPTODES', cSQL,'CPTODES');
  if DMTE.cdsPagoCxP.FieldByName('OBSERVA').AsString = '' then
  begin
    showmessage('No se encuentra registrado el concepto');
    dblcdCpto.Text := '';
    dblcdCpto.setfocus;
  end;
end;

procedure TFOrdenPago.dblcBancoExit(Sender: TObject);
var
  xSQL : String;
begin

  xsql := 'BANCOID='+quotedstr(dblcBanco.text);
  edtBanco.text := DMTE.DisplayDescrip('prvTGE','TGE105','BANCONOM,CUENTAID,CPTOID',xsql,'BANCONOM');

  if edtBanco.text = '' then
  begin
     Showmessage('Falta registrar la Caja');
     dblcBanco.SetFocus;
     exit;
  end;

  xSQL:='CIAID='''+cCia+''' AND BANCOID='+quotedstr(dblcBanco.text);
  DMTE.cdsPagoCxP.FieldByname('TMONID').AsString:=DMTE.DisplayDescrip('prvTGE','TGE106','TMONID',xSQL,'TMONID');
  dblcTMonedaExit(Self);
end;


procedure TFOrdenPago.Z2bbtnContClick(Sender: TObject);
var
  xSQL, cWhere : String;
begin
  DMTE.cdsPagoCxP.Close;
  DMTE.cdsPagoCxP.Open;

   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      ShowMessage('Orden de Pago se encuentra Anulada. Verificar...');
      Exit;
   end;

  if DMTE.cdsPagoCxP.FieldByName('CONTAB').AsString='S' then
  begin
     ShowMessage('Orden de Pago ( Oficio '+dbeOficio.Text+' ) se encuentra Contabilizado');
     Exit;
  end;

  if DMTE.cdsPagoCxP.FieldByname('CERRADO').AsString<>'S' then
  begin
     ShowMessage('Para Contabilizar, Orden de Pago debe estar Cerrada');
     Exit;
  end;

  if MessageDlg(' ¿ Esta seguro(a) de Contabilizar Oficio ? ', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  begin

  screen.Cursor := crHourGlass;

  xSQL:='CCOSID='+QuotedStr(dbeCCos.Text)+' and CCOSMOV=''S'' AND CCOSACT=''S''';
  cCenCos:= DMTE.DisplayDescrip('prvTGE','TGE203','CCOSDES',xSQL,'CCOSDES');

  cWhere := 'FECHA ='+DMTE.wRepFuncDate+''''+ FormatDateTime(DMTE.wFormatFecha, dtpFecha.date)+''')';
  cAnoMM := DMTE.DisplayDescrip('prvTGE', 'TGE114', '*', cWhere, 'FECANO');
  cAnoMM := DMTE.cdsQry.FieldByName('FECANO').AsString+DMTE.cdsQry.FieldByName('FECMES').AsString;

  xSQL:='Select * from TGE107 '
       +'WHERE FECHA ='+DMTE.wRepFuncDate+''''+ FormatDateTime(DMTE.wFormatFecha, dtpFecha.date)+''') '
       +  'and TMONID='''+DMTE.wTMonExt+'''';
  DMTE.cdsQry.Close;
  DMTE.cdsQry.DataRequest( xSQL );
  DMTE.cdsQry.Open;
  dTipCam:= DMTE.cdsQry.FieldByName(DMTE.wTipoCambioUsar).AsFloat;

  if dTipCam<=0 then
  begin
     showmessage('Error : No existe Tipo de cambio para el dia '+dtpFecha.Text );
     screen.Cursor := crDefault  ;
     Exit;
  end;

  xSQL   :='CPTOID='+quotedstr(dblcdCpto.Text);
  cCuenta:=DMTE.DisplayDescrip('prvTGE','CAJA201','CUENTAID', xSQL,'CUENTAID');

  xSQL   :='CIAID='''   +DMTE.cdsPagoCxP.FieldByname('CIAID').AsString+''' AND '
          +'CUENTAID='''+cCuenta+'''';
  cCtaAux:=DMTE.DisplayDescrip('prvTGE','TGE202','CUENTAID, CTA_AUX, CTA_CCOS', xSQL,'CTA_AUX');
  cCtaCCo:=DMTE.cdsQry.FieldByname('CTA_CCOS').AsString;

  xSQL:='Select * from CAJ_ORD_PAG_DET '
       +'where CIAID=''' +DMTE.cdsPagoCxP.FieldByname('CIAID').AsString+''' '
       +  'AND NUMERO='''+DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString+''' '
       +'ORDER BY ITEM';
  DMTE.cdsReporte.Close;
  DMTE.cdsReporte.DataRequest( xSQL );
  DMTE.cdsReporte.Open;
  while not DMTE.cdsReporte.Eof do
  begin

     if DMTE.cdsReporte.FieldByName('MONPAG').AsFloat>0 then
     begin
         // INGRESO DE RECIBOS A CAJA
         GeneraComp;

         DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

         RecCptosDifC;

         Contabiliza;

         DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');

         ActualizaCNT311( DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
                          DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                          DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                          DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString );

         SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
                     DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                     DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                     DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                     DMTE.SRV_D, 'CCNA', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                     DMTE.cdsResultSet, DMTE.DCOM1, Self );

     end;

     DMTE.cdsReporte.Next;
  end;

  DMTE.cdsPagoCxP.Edit;
  DMTE.cdsPagoCxP.FieldByname('FECCNT').AsDateTime :=Date + SysUtils.Time;
  DMTE.cdsPagoCxP.FieldByname('CONTAB').AsString   :='S';

  DMTE.cdsPagoCxP.Post;
  DMTE.cdsPagoCxP.ApplyUpdates( 0 );

  pnlCab1.Enabled:=False;
  btnNuevo.Enabled:=False;

  ShowMessage('Contabilizado');

  screen.Cursor := crDefault  ;

  ShowMessage('Contablización OK');

  end;
end;


procedure TFOrdenPago.GeneraComp;
var
   xSQL, cWhere, Aux, cOrigen : String;
begin
   cWhere:='CIAID='''+DMTE.cdsPagoCxP.FieldByName('CIAID').AsString+''' AND BANCOID ='+QuotedStr(DMTE.cdsPagoCxP.FieldByName('BANCOID').AsString);

   cOrigen:=DMTE.DisplayDescrip('prvTGE', 'TGE106', 'CCBCOVOUCH', cWhere, 'CCBCOVOUCH');

   cWhere:='CIAID='+quotedstr(DMTE.cdsPagoCxP.FieldByName('CIAID').AsString)+' AND ECANOMM='+quotedstr(cAnoMM)
          +' AND TDIARID='+ quotedstr(cOrigen);
   cNoComp:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',cWhere);
   cNoComp:=DMTE.StrZero(cNoComp,10);

   xSQL:='Select * from CAJA302 '
        +'Where CIAID='''   +DMTE.cdsPagoCxP.FieldByName('CIAID').AsString+''' '
        +  'AND TDIARID=''' +cOrigen+''' '
        +  'AND ECANOMM=''' +cAnoMM +''' '
        +  'AND ECNOCOMP='''+cNoComp+'''';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest( xSQL );
   DMTE.cdsEgrCaja.Open;

   DMTE.cdsEgrCaja.Insert;
   DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString:= DMTE.cdsReporte.FieldByName('CLAUXID').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat := dTipCam;
   DMTE.cdsEgrCaja.FieldByName('PROV').AsString   := DMTE.cdsReporte.FieldByName('AUXID').AsString;
   DMTE.cdsEgrCaja.FieldByName('DOCID').Value     := '13';
   DMTE.cdsEgrCaja.FieldByName('ECNODOC').Value   := DMTE.cdsPagoCxP.FieldByName('NUMDOC').AsString;

   DMTE.cdsEgrCaja.FieldByName('CIAID').Value       := DMTE.cdsPagoCxP.FieldByName('CIAID').AsString;
   DMTE.cdsEgrCaja.FieldByName('TDIARID').Value     := cOrigen;
   DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value     := cAnoMM;
   DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value    := cNoComp;

   DMTE.cdsEgrCaja.FieldByName('ECFEMICH').Value    := DMTE.cdsPagoCxP.FieldByName('FECHA').AsDateTime;
   DMTE.cdsEgrCaja.FieldByName('ECFCOBCH').Value    := DMTE.cdsPagoCxP.FieldByName('FECHA').AsDateTime;
   DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value     := DMTE.cdsPagoCxP.FieldByName('FECHA').AsDateTime;
   DMTE.cdsEgrCaja.FieldByName('TMONID').AsString   := DMTE.cdsPagoCxP.FieldByName('TMONID').AsString;

   if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
   begin
     DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString := DMTE.cdsReporte.FieldByName('MONPAG').AsString;
     DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString := DMTE.cdsReporte.FieldByName('MONPAG').AsString;
     DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat  := DMTE.FRound(DMTE.cdsReporte.FieldByName('MONPAG').AsFloat/dTipCam,15,2);
   end
   else
   begin
     DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString := DMTE.cdsReporte.FieldByName('MONPAG').AsString;
     DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat  := DMTE.FRound(DMTE.cdsReporte.FieldByName('MONPAG').AsFloat*dTipCam,15,2);
     DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsString := DMTE.cdsReporte.FieldByName('MONPAG').AsString;
   end;

   DMTE.cdsEgrCaja.FieldByName('BANCOID').Value     := DMTE.cdsPagoCxP.FieldByName('BANCOID').AsString;
   DMTE.cdsEgrCaja.FieldByName('CUENTAID').Value    := DMTE.DisplayDescrip('prvTGE', 'TGE105', 'CUENTAID, CPTOID', 'BANCOID ='+QuotedStr(DMTE.cdsPagoCxP.FieldByName('BANCOID').AsString),'CUENTAID');
   DMTE.cdsEgrCaja.FieldByName('ECGLOSA').Value     := Copy(DMTE.cdsReporte.FieldByName('AUXOBS').AsString,1,60);
   DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value      := 'MOVI';
   DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'P';
   DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString  := 'S';

   cWhere := 'FECHA ='+DMTE.wRepFuncDate+''''+ FormatDateTime(DMTE.wFormatFecha, DMTE.cdsPagoCxP.FieldByName('FECHA').AsDateTime)+''')';
   aux    := DMTE.DisplayDescrip('prvTGE', 'TGE114', '*', cWhere, 'FECANO');
   DMTE.cdsEgrCaja.FieldByName('ECANO').AsString   := DMTE.cdsQry.FieldByName('FECANO').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECMM').AsString    := DMTE.cdsQry.FieldByName('FECMES').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECDD').AsString    := DMTE.cdsQry.FieldByName('FECDIA').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECSS').AsString    := DMTE.cdsQry.FieldByName('FECSS').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString   := DMTE.cdsQry.FieldByName('FECSEM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString   := DMTE.cdsQry.FieldByName('FECTRIM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString  := DMTE.cdsQry.FieldByName('FECAASS').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAASem').AsString := DMTE.cdsQry.FieldByName('FECAASEM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString := DMTE.cdsQry.FieldByName('FECAATRI').AsString;
   DMTE.cdsEgrCaja.FieldByName('EC_PROCE').Value   := 'C';
   DMTE.cdsEgrCaja.FieldByName('EC_IE').Value      := 'E';

   DMTE.cdsEgrCaja.FieldByName('ECUSER').Value     := DMTE.wUsuario;
   DMTE.cdsEgrCaja.FieldByName('ECFREG').Value     := DATE;
   DMTE.cdsEgrCaja.FieldByName('ECHREG').Value     := DATE;

   DMTE.cdsEgrCaja.Post ;
end;

procedure TFOrdenPago.RecCptosDifC;
var
  cWhere : String;
begin
   cWhere:='BANCOID ='+QuotedStr(DMTE.cdsPagoCxP.FieldByName('BANCOID').AsString);

   if not DMTE.RecuperarDatos('TGE105', 'CPTODIFG, CPTODIFP, CTADIFG, CTADIFP', cWhere )  then
       Raise Exception.create('No se puede Contabilizar '+#13+
             'Falta Definir las Cuentas de Dif. de Cambio')  ;
    wCptoGan  := DMTE.cdsRec.FieldByName('CPTODIFG').AsString ;
    wCptoPer  := DMTE.cdsRec.FieldByName('CPTODIFP').AsString ;
    wCtaGan   := DMTE.cdsRec.FieldByName('CTADIFG').AsString ;
    wCtaPer   := DMTE.cdsRec.FieldByName('CTADIFP').AsString ;
end;

procedure TFOrdenPago.Contabiliza;
var
   xSQL    : String;
begin
   xSQL:='DELETE FROM CAJA304 '
        +'WHERE CIAID ='   +QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)
        + ' and ECANOMM =' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
        + ' and TDIARID =' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
        + ' and ECNOCOMP ='+QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   try
			DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;
   xSQL:='Select * From CAJA304 '
        +'WHERE CIAID ='   +QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)
        + ' and ECANOMM =' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
        + ' and TDIARID =' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
        + ' and ECNOCOMP ='+QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   DMTE.cdsCNTCaja.Close;
   DMTE.cdsCNTCaja.DataRequest( xSQL );
   DMTE.cdsCNTCaja.Open;

   xNReg := 0;

   Contab_Doc ;

   Contab_IngCaja( 'H','', 'EGRESO DE CAJA' );

end;

procedure TFOrdenPago.Contab_IngCaja( cDH, cCuenta, cGlosa : String );
begin
   DMTE.cdsCntCaja.Insert ;
   DMTE.cdsCntCaja.FieldByName('CIAID').Value       := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
   DMTE.cdsCntCaja.FieldByName('TDIARID').Value     := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value    := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value     := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value     := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value    := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;

   if cCuenta<>'' then
     DMTE.cdsCntCaja.FieldByName('CUENTAID').Value  := cCuenta
   else
     DMTE.cdsCntCaja.FieldByName('CUENTAID').Value  := DMTE.cdsEgrCaja.FieldByName('CUENTAID').Value;

   DMTE.cdsCntCaja.FieldByName('DOCID').Value       := DMTE.cdsEgrCaja.FieldByName('DOCID').Value;
   DMTE.cdsCntCaja.FieldByName('DCSERIE').Value     := DMTE.cdsReporte.FieldByName('ITEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCNODOC').Value     := DMTE.cdsPagoCxP.FieldByName('NUMDOC').AsString;

   DMTE.cdsCntCaja.FieldByName('DCDH').Value        := cDH;
   DMTE.cdsCntCaja.FieldByName('TMONID').Value      := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value    := DMTE.cdsEgrCaja.FieldByName('ECMTOORI').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value     := DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value    := DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').Value;
   DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value    := 'S';   //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value     := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').Value      := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
   DMTE.cdsCntCaja.FieldByName('DCANO').AsString    := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMM').AsString     := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDD').AsString     := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSS').AsString     := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSEM').AsString    := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTRI').AsString    := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASS').AsString   := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').Value      := 'CAJA';
   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString  := DMTE.cdsEgrCaja.FieldByName('ECGLOSA').Value;
   DMTE.cdsCntCaja.FieldByName('FCAB').AsString     := '1' ;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsString := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsString := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsString;
   xNReg := xNReg+1;
   DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;

   DMTE.cdsCntCaja.Post ;
end;


procedure TFOrdenPago.Contab_Doc;
var
   xSQL : String;
begin
     DMTE.cdsCntCaja.Insert;
     DMTE.cdsCntCaja.FieldByName('CIAID').Value      := DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
     DMTE.cdsCntCaja.FieldByName('TDIARID').Value    := DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
     DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value   := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
     DMTE.cdsCntCaja.FieldByName('ECANOMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCDH').Value       := 'D';
     DMTE.cdsCntCaja.FieldByName('DOCMOD').Value     := 'CAJA';
     DMTE.cdsCntCaja.FieldByName('DOCID').Value      := DMTE.cdsEgrCaja.FieldByName('DOCID').Value;
     DMTE.cdsCntCaja.FieldByName('DCSERIE').Value    := DMTE.cdsReporte.FieldByName('ITEM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCNODOC').Value    := DMTE.cdsEgrCaja.FieldByName('ECNODOC').Value;
     DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value    := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value    := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value   := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.FieldByName('ECGLOSA').Value;

     DMTE.cdsCntCaja.FieldByName('CPTOID').Value     := DMTE.cdsPagoCxP.FieldByName('CPTOID').AsString;
     DMTE.cdsCntCaja.FieldByName('CUENTAID').Value   := cCuenta;

     if cCtaAux='S' then
     begin
        DMTE.cdsCntCaja.FieldByName('CLAUXID').Value    := DMTE.cdsReporte.FieldByName('CLAUXID').AsString;
        DMTE.cdsCntCaja.FieldByName('DCAUXID').Value    := DMTE.cdsReporte.FieldByName('AUXID').AsString;
     end;
     
     if cCtaCCo='S' then
     begin
        DMTE.cdsCntCaja.FieldByName('CCOSID').Value     := DMTE.cdsPagoCxP.FieldByName('CCOSID').AsString;
     end;

     DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsString:= DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsString;
     DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsString:= DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsString;
     DMTE.cdsCntCaja.FieldByName('TMONID').Value     := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
     DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value   := DMTE.cdsEgrCaja.FieldByName('ECMTOORI').Value;
     DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value    := DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').Value;
     DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value   := DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').Value;
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
end;


procedure TFOrdenPago.bbtnImprimeContaClick(Sender: TObject);
var
  cSQL, cWhere, cOrigen : String;
begin
   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      ShowMessage('Orden de Pago Anulada. Verificar...');
      Exit;
   end;

  cWhere := 'FECHA ='+DMTE.wRepFuncDate+''''+ FormatDateTime(DMTE.wFormatFecha, dtpFecha.date)+''')';
  cAnoMM := DMTE.DisplayDescrip('prvTGE', 'TGE114', '*', cWhere, 'FECANO');
  cAnoMM := DMTE.cdsQry.FieldByName('FECANO').AsString+DMTE.cdsQry.FieldByName('FECMES').AsString;

  cWhere:='CIAID='''+DMTE.cdsPagoCxP.FieldByName('CIAID').AsString+''' AND BANCOID ='+QuotedStr(DMTE.cdsPagoCxP.FieldByName('BANCOID').AsString);

  cOrigen:=DMTE.DisplayDescrip('prvTGE', 'TGE106', 'CCBCOVOUCH', cWhere, 'CCBCOVOUCH');

  cSQL:='SELECT * FROM CNT301 '
       +'WHERE CIAID='''   +DMTE.cdsPagoCxP.FieldByName('CIAID').AsString+''' '
       + ' and CNTANOMM='''+cAnoMM +''' AND TDIARID=''' +cOrigen+''' '
       + ' and CNTNODOC='''+DMTE.cdsPagoCxP.FieldByName('NUMDOC').AsString+''' '
       +'Order By CNTCOMPROB, CNTREG';
  DMTE.cdsReporte.Close;
  DMTE.cdsReporte.DataRequest( cSQL );
  DMTE.cdsReporte.Open;

  ppdb4.DataSource:=DMTE.dsReporte;
	ppr4.TEMPLATE.FileName := wRutaRpt + '\PromotoresCNT.rtm';
	ppr4.template.LoadFromFile ;
  //ppr4.Print;
  ppd4.ShowModal;

  ppdb4.DataSource:=nil;

end;

procedure TFOrdenPago.z2bbtnAnulaClick(Sender: TObject);
begin

   if DMTE.cdsPagoCxP.FieldByname('USUACEPTA').AsString<>DMTE.wUsuario then
   begin
      ShowMessage('Orden de Pago debe ser anulado por Usuario que Solicita');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('USUCAJA').AsString<>'' then
   begin
      ShowMessage('Orden de Pago se encuentra Visada por el Jefe de Caja. No se puede anular');
      Exit;
   end;

   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      ShowMessage('Orden de Pago se encuentra Anulada. Verificar');
      Exit;
   end;

   if MessageDlg(' ¿ Esta seguro(a) de Anular ? ', mtConfirmation, [mbYes, mbNo], 0)=mrNo then Exit;
   
   DMTE.cdsPagoCxP.Edit;
   DMTE.cdsPagoCxP.FieldByname('FECANU').AsDateTime:=Date + SysUtils.Time;
   DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString :='S';
   DMTE.cdsPagoCxP.Post;
   DMTE.cdsPagoCxP.ApplyUpdates( 0 );

   ShowMessage('Anulado');

   if DMTE.cdsPagoCxP.FieldByname('ANULADO').AsString='S' then
   begin
      fcpAnula.Visible:=True;
      fcpAnula.BringToFront;
      fcpAnula.Transparent := True;
      fcpAnula.invalidate;
   end;
end;


procedure TFOrdenPago.AsignaDataSource;
begin
   dtpFecha.DataSource    :=DMTE.dsPagoCxP;
   dblcBanco.DataSource   :=DMTE.dsPagoCxP;
   dblcBanco.LookupTable  :=DMTE.cdsBancoEgr;
   dblcTMoneda.DataSource :=DMTE.dsPagoCxP;
   dblcTMoneda.LookupTable:=DMTE.cdsTMon;
   dbeNumero.DataSource   :=DMTE.dsPagoCxP;
   dbeOficio.DataSource   :=DMTE.dsPagoCxP;
   dblcdCpto.DataSource   :=DMTE.dsPagoCxP;
   dblcdCpto.LookupTable  :=DMTE.cdsCptos;
   dbeObs.DataSource      :=DMTE.dsPagoCxP;

   dbgdata.DataSource     :=DMTE.dsProvCta;

   dbeUsuGraba.DataSource :=DMTE.dsPagoCxP;
   dbeUsuAcepta.DataSource:=DMTE.dsPagoCxP;
   dbeCCos.DataSource     :=DMTE.dsPagoCxP;
   dbeCaja.DataSource     :=DMTE.dsPagoCxP;
   dbeCajero.DataSource   :=DMTE.dsPagoCxP;
end;

end.

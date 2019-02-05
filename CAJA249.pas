unit CAJA249;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient,
  ComCtrls, Tabnotbk,CAJADM, Menus, Wwlocate, wwDialog, Wwfltdlg, wwidlg,
  ppVar, ppCtrls, ppBands, ppPrnabl, ppClass, ppCache, ppDB, ppDBPipe,
  ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppMemo, oaContabiliza,
  Wwkeycb, ppEndUsr, Variants, oaVariables;

type
  TFPagoFacturasCobrar = class(TForm)
    pnlCabecera1: TPanel;
    lblCia: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    pnlCabecera2: TPanel;
    z2bbtnCancel: TBitBtn;
    z2bbtnOK: TBitBtn;
    pnlDetalle: TPanel;
    pnlBotones: TPanel;
    z2bbtnImprime: TBitBtn;
    z2bbtnGraba: TBitBtn;
    z2bbtnCancelado: TBitBtn;
    z2bbtnCancel2: TBitBtn;
    z2bbtnNuevo: TBitBtn;
		z2bbtnSube: TBitBtn;
    z2bbtnCont: TBitBtn;
    dbdtpFComp: TwwDBDateTimePicker;
    lblFComp: TLabel;
    lblTDiario: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    lblPeriodo: TLabel;
    lblNoComp: TLabel;
    edtPeriodo: TEdit;
    dbeNoComp: TwwDBEdit;
    lblEstado: TLabel;
    z2bbtnAnula: TBitBtn;
    z2bbtnCalc: TBitBtn;
    TabbedNotebook1: TTabbedNotebook;
    Label17: TLabel;
    dbgDocPago: TwwDBGrid;
    dbgOtros: TwwDBGrid;
    dbgOtrosIButton: TwwIButton;
    dbgPendientes: TwwDBGrid;
    z2bbtnOKCab: TBitBtn;
    pnlActualiza: TPanel;
    Label3: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
		Label13: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    dblcdCCosto: TwwDBLookupComboDlg;
    dbeNoReg: TwwDBEdit;
    dbeSerie: TwwDBEdit;
    dbeNoDoc2: TwwDBEdit;
    edtCuenta2: TwwDBEdit;
    dblcTMon2: TwwDBLookupCombo;
    dbeImporte2: TwwDBEdit;
    edtTMon2: TEdit;
    edtMtoLoc: TwwDBEdit;
    edtMtoExt: TwwDBEdit;
    dbdtpFEmis2: TwwDBDateTimePicker;
    dbdtpFVcto2: TwwDBDateTimePicker;
    z2bbtnOK2: TBitBtn;
    z2bbtnCancel3: TBitBtn;
    dbeTCamDoc: TwwDBEdit;
    dbeDH: TwwDBEdit;
    Z2bbtnEmiChq: TBitBtn;
    Label6: TLabel;
    dblcTDoc2: TwwDBLookupCombo;
    edtTDoc2: TEdit;
    lblTMon: TLabel;
    lblTCambio: TLabel;
		lblProvRuc: TLabel;
    lblProvDes: TLabel;
    lblBanco: TLabel;
    lblCCBco: TLabel;
    lblNoChq: TLabel;
    lblFormPago: TLabel;
    lblImporte: TLabel;
    lblLote: TLabel;
    lblCuenta: TLabel;
    Label23: TLabel;
    edtAuxRuc: TEdit;
    edtTMon: TEdit;
    dbeTCambio: TwwDBEdit;
    dblcTMon: TwwDBLookupCombo;
    dbeGiradoA: TwwDBEdit;
    dblcBanco: TwwDBLookupCombo;
    dblcCCBco: TwwDBLookupCombo;
    dbeNoChq: TwwDBEdit;
    dblcFormPago: TwwDBLookupCombo;
    edtFormPago: TEdit;
    edtBanco: TEdit;
    dbeImporte: TwwDBEdit;
    dbeLote: TwwDBEdit;
    dblcdAux: TwwDBLookupComboDlg;
    dblcClase: TwwDBLookupCombo;
    edtClase: TEdit;
    lblConcepto: TLabel;
    dblcdCnp: TwwDBLookupComboDlg;
    lblGlosa: TLabel;
		dbeGlosa: TwwDBEdit;
    Label24: TLabel;
    dbdtpFEmis: TwwDBDateTimePicker;
    Label4: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    dblcdCnp2: TwwDBLookupComboDlg;
    edtCnp2: TEdit;
    dblcClaseDet: TwwDBLookupCombo;
    edtClaseDet: TEdit;
    dblcdAuxDet: TwwDBLookupComboDlg;
    dbeAuxDet: TwwDBEdit;
    Label18: TLabel;
    dblcdFEfec: TwwDBLookupComboDlg;
    dbeFEfec: TwwDBEdit;
    edtCuenta: TwwDBLookupComboDlg;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    Buscar1: TMenuItem;
    N1: TMenuItem;
    lkdCxP: TwwLookupDialog;
    edtAuxpnl: TEdit;
    edtclasepnl: TEdit;
    dblcdCtaCte: TwwDBLookupComboDlg;
    Label22: TLabel;
    Z2bbtnNotaAbono: TBitBtn;
    pprptNotaAbono: TppReport;
    ppdbpNotaAbono: TppDBPipeline;
    ppHeaderBand2: TppHeaderBand;
		ppdbtCiaRuc: TppDBText;
    pplblNNA: TppLabel;
    pplblTitulo: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppsvFecha: TppSystemVariable;
    pplblFecha: TppLabel;
    pplblCliente: TppLabel;
    pplblNombreCli: TppLabel;
    pplblRucCli: TppLabel;
    pplblNRucCli: TppLabel;
    ppRucCia: TppLabel;
    pplblDirecCli: TppLabel;
    pplblNDirCli: TppLabel;
    pplblCta: TppLabel;
    pplblNCtaCte: TppLabel;
    pplblCia: TppLabel;
    pplblNumero: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppdbMonto: TppDBText;
    pplblMoneda: TppLabel;
    pplblConcepto: TppLabel;
    ppmmGlosa: TppMemo;
    ppLine1: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine4: TppLine;
    pplblTotal: TppLabel;
    ppMoneda1: TppLabel;
    ppdbcTotal: TppDBCalc;
		dbeMPL: TwwDBEdit;
    dbeMPE: TwwDBEdit;
    dbeTC: TwwDBEdit;
    pnlBusca: TPanel;
    isBusca: TwwIncrementalSearch;
    Label27: TLabel;
    BitBtn1: TBitBtn;
    Z2bbtnRetencion: TBitBtn;
    ppdbRetencion: TppDBPipeline;
    pprRetencion: TppReport;
    ppDesigner1: TppDesigner;
    lblSujetoRetencion: TLabel;
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
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText13: TppDBText;
    Button1: TButton;
    procedure dblcCiaExit(Sender: TObject);
    procedure z2bbtnCancelClick(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure z2bbtnCalcClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure z2bbtnSumatDocPagoClick(Sender: TObject);
    procedure z2bbtnSubeClick(Sender: TObject);
    procedure z2bbtnCancel2Click(Sender: TObject);
    procedure z2bbtnNuevoClick(Sender: TObject);
    procedure z2bbtnGrabaClick(Sender: TObject);
    procedure z2bbtnCanceladoClick(Sender: TObject);
    procedure z2bbtnContClick(Sender: TObject);
    procedure z2bbtnAnulaClick(Sender: TObject);
    procedure dbgOtrosIButtonClick(Sender: TObject);
    procedure dbgOtrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbdtpFComp2Exit(Sender: TObject);
    procedure z2bbtnSumatClick(Sender: TObject);
    procedure dbgPendientesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgPendientesMouseDown(Sender: TObject; Button: TMouseButton;
			Shift: TShiftState; X, Y: Integer);
    procedure dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDocPagoDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgDocPagoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgDocPagoEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDocPagoColExit(Sender: TObject);
    procedure dbgOtrosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);
    procedure dbgDocPagoCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure dbgOtrosCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);

    procedure dbeNoRegExit(Sender: TObject);
    procedure z2bbtnOK2Click(Sender: TObject);
    procedure dblcTMon2Exit(Sender: TObject);
    procedure dbeDHChange(Sender: TObject);
    procedure dbeImporte2Exit(Sender: TObject);
    procedure z2bbtnCancel3Click(Sender: TObject);
    procedure dbgOtrosDblClick(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
		procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Z2bbtnEmiChqClick(Sender: TObject);
    procedure dblcTDoc2Exit2(Sender: TObject);
    procedure dbeLoteExit(Sender: TObject);
    procedure dbeTCambioEnter(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcCCBcoEnter(Sender: TObject);
    procedure dblcCCBcoExit(Sender: TObject);
    procedure dblcClaseExit(Sender: TObject);
    procedure dblcdAuxExit(Sender: TObject);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure dblcdCnpExit(Sender: TObject);
    procedure dblcClaseDetExit(Sender: TObject);
    procedure dblcdAuxExit2(Sender: TObject);
    procedure dblcdCnp2Exit2(Sender: TObject);
    procedure edtCnp2Change2(Sender: TObject);
    procedure wwDBEdit1Change22(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblcdFEfecEnter(Sender: TObject);
    procedure dblcdFEfecExit(Sender: TObject);
    procedure Buscar1Click2(Sender: TObject);
    procedure lkdCxPCloseDialog(Dialog: TwwLookupDlg);
    procedure lkdCxPInitDialog(Dialog: TwwLookupDlg);
    procedure edtCuentaExit(Sender: TObject);
    procedure dbeNoChqExit(Sender: TObject);
    procedure ppHeaderBand2BeforePrint(Sender: TObject);
		procedure Z2bbtnNotaAbonoClick(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure dbeTCExit(Sender: TObject);
    procedure dbeMPLExit(Sender: TObject);
    procedure dbeMPEExit(Sender: TObject);
    procedure isBuscaExit(Sender: TObject);
    procedure dbgPendientesTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dblcdAuxEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dblcdCCostoExit(Sender: TObject);
    procedure Z2bbtnRetencionClick(Sender: TObject);
    procedure dblcdAuxDropDown(Sender: TObject);
    procedure dbeNoCompEnter(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    xNReg   : Integer;
    xDirAux : String; // direccion del auxiliar
    xRUCCIA : string; // para el ruc de la compañia
    cf1: TControlFoco;
    strTmp: String;
    ctrl: TCustomEdit;
    evt_Exit: TNotifyEvent;
    A1 : Array of Integer ;
    A2 : Array Of TNotifyEvent ;
    A2digitos ,A4digitos : Array of TWinControl ;
    cdsConceptoC1 : TwwClientDataset ;
    cdsTDiarioDet : TwwClientDataset ;
    //
		xTC: Double;
		cdsFiltro : TwwClientDataset ;
		//
		wFechaCierre : TDatetime  ;
		wFrecu       : Integer    ;
		xMTOCNTLOC         : Double   ;
		xMTOCNTEXT         : double   ;
		xMONID_PROV : String ;
		xDebeT      : Double;
		xHabeT      : Double;
		xDebeTD     : Double;
		xHabeTD     : Double;
		//** 04/06/2001-pjsv, para el nuevo dato (CCBCOVOUCH - TGE106 y CAJA302)
		xVoucher : String;
		//**
		{ Private declarations }
		procedure InhabilitarPaneles;
		procedure EdiTarRegistros;
		procedure AdicionarRegistros;
		procedure LiberarFiltrosRegistroEgresos;
		procedure EstablecerFiltrosRegistroEgresos;
		procedure IniciaPanel;
		procedure LimpiaFiltros;
		procedure ActivaFiltro(xName:string);
		procedure CambiaEstado(xName:char);
		procedure Contab_Haber;
		procedure Contab_RegCxP;
		procedure Contab_DocPago;
		procedure Contab_DocPago_Retencion_Debe(xRL,xRE,xRO:double);
		procedure Contab_DocPago_Retencion_Haber;
		procedure Contab_DifCamRegCxP;
		procedure Contab_DifCamDocPago;
		procedure Contab_DifCamDocPago_Retencion;
		procedure Contab_DifCamRegCxP2;
		procedure Contab_DifCamDocPago2;
		function  ValidaCampo:Boolean;
		procedure ActSaldosMovCxP;
		procedure ActMovCxP;
		procedure RetornaSaldosMovCxP;
		procedure RetornaSaldosMovCxPPagados;
		procedure ConsisCancela(var xconsis:Boolean);
		procedure ActPnlBotones;
		Function  ValidacionCabecera:Boolean;
		procedure RecuperaDescrip;
		procedure AdicIniciaDatos;
		procedure IniciaDatos;
		procedure ActualizaSaldosCaja ;
		procedure ConfiguraAccesos;
		procedure Proc_Admin;
		procedure Proc_Consul;
		procedure Libera_Admin;
		procedure Libera_Consul;
		procedure LibConfigAccesos;
		procedure ValidaCabecera2;
		procedure SaldosAux ;
		procedure Opera(xProv ,xClase: string ;cdsClone : TwwClientDataSet) ;
		function  BuscaClase : String ;
		procedure RecCptosDifC ;
		procedure BorraGrid ;
		procedure ActDetCxP ;
		procedure ActDetCaja ;
		procedure ActualizaFiltro ;
		procedure ActualizaDetCanje ;
		procedure Limpiapnlaux;
		procedure DescripPagoFact(const xCIAID, xECANOMM, xTDIARID, xECNOCOMP: String);
                procedure GrabaCabeceraDeComprobante;
	public
		{ Public declarations }
    wCptoGan  ,
		wCptoPer  ,
		wCtaGan   ,
		wCtaPer   : String ;
		wCCosDif  : String ;
		procedure Adiciona ;
		procedure Edita (Comp : structComprobante ; cds : Twwclientdataset);
		procedure AsignaCDSFiltro(cds : TwwClientDataset) ;
		procedure AsientoDifTotal;
		procedure Contabiliza;
	end;
var
	FPagoFacturasCobrar: TFPagoFacturasCobrar;
	wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado , wbChq,
  wbcancel2: Boolean;
  wmodifica, wCiaRetIGV: Boolean;
  wmodo : string;

implementation

uses CAJAUTIL, Caja290, oaTE2000;

{$R *.DFM}


{******************************************************************************}
procedure TFPagoFacturasCobrar.IniciaDatos;
var
	xSQL : string;
begin
	 //
	 pnlCabecera1.Enabled  := True;
	 pnlCabecera2.Enabled  := False;
	 pnlDetalle.Enabled    := False;
   pnlBotones.Enabled    := False;
   TabbedNotebook1.PageIndex:=0;

   // Estado de variables Botones
   wbSumat     := False;
   wbCont      := False;
   wbNuevo     := False;
   wbImprime   := False;
   wbSube      := False;
   wbGraba     := False;
   wbCancelado := False;
   wbCancel2   := False;
   wbAnula     := False;
   wbChq       := False ;

   // Estado de Botones
   z2bbtnOk.Enabled        := False;
   z2bbtnCancel.Enabled    := False;
	 z2bbtnCont.Enabled      := False;
	 z2bbtnNuevo.Enabled     := False;
	 z2bbtnImprime.Enabled   := False;
	 z2bbtnSube.Enabled      := False;
	 z2bbtnGraba.Enabled     := False;
	 z2bbtnCancelado.Enabled := False;
	 z2bbtnCancel2.Enabled   := False;
	 z2bbtnAnula.Enabled     := False;
	 //
	 dbgOtrosIButton.Enabled := True ;

	 BlanqueaEdits ( pnlCabecera1 ) ;
	 BlanqueaEdits ( pnlCabecera2 ) ;

	 edtTMon.Enabled      := False;
	 edtBanco.Enabled     := False;
	 dblcCCBco.Enabled    := False;
	 edtCuenta.Enabled    := False;
	 dblcFormPago.Enabled := False;   // Forma de Pago
   edtFormPago.Enabled  := False;
   dbeNoChq.Enabled     := False;
   dbdtpFEmis.Enabled   := False ;
   dbdtpFEmis.Date      := 0 ;
   dbdtpFEmis.Date      := 0 ;
   wmodifica            := False;

   dbgOtros.ColumnByName('DEMTOLOC').FooterValue:='';
   dbgOtros.ColumnByName('DEMTOEXT').FooterValue:='';

   dbgDocPago.ColumnByName('CPSALLOC').FooterValue:='';
   dbgDocPago.ColumnByName('CPSALEXT').FooterValue:='';
   dbgDocPago.ColumnByName('CCPMOLOC').FooterValue:='';
   dbgDocPago.ColumnByName('CCPMOEXT').FooterValue:='';
   LimpiaFiltros ;
   DMTE.cdsMovCxC.Close;

   // Estableciendo el filtro para que el detalle del grid aparezca vacio

   // vhn 22/01/2001
   xSQL:='Select * from CAJA303 '
        +'Where CIAID='''' and ECANOMM='''' and '
        +      'TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsDocPago.Close;
   DMTE.cdsDocPago.DataRequest( xSQL );
   DMTE.cdsDocPago.Open;

   // vhn 25/01/2001
   xSQL:='Select * from CAJA301 '
        +'Where CIAID='''' and ECANOMM='''' and '
        +      'TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsRegCxP.Close;
   DMTE.cdsRegCxP.DataRequest( xSQL );
   DMTE.cdsRegCxP.Open;

   z2bbtnOkCab.Enabled := True ;
end;

{******************************************************************************}
{******************** PROCEDIMIENTOS DE LOS COMPONENTES ***********************}

procedure TFPagoFacturasCobrar.dblcCiaExit(Sender: TObject);
begin
   edtCia.text:= DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIADES') ;

   wCiaRetIGV := (DMTE.cdsCia.FieldByName('CIARETIGV').AsString='S');

   if edtCia.Text='' then begin
      ShowMessage('Error : Compañía no Valida');
      dblcCia.SetFocus;
      Exit;
   end;

   // SE VA A ABRIR SI SE NECESITA
   //DMTE.abreCuentas(dblcCia.text) ;
end;

{******************************************************************************}
procedure TFPagoFacturasCobrar.dbdtpFCompExit(Sender: TObject);
var
   xWhere : String;
begin
   if dblcCia.Focused   then Exit;
   if dblcBanco.Focused then Exit;
   if dblcCCBco.Focused then Exit;

  if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, dblcCCBco.text, dbdtpFComp.Date ) then
  begin
     Showmessage('Error : Mes de Fecha Fue Cerrado. Verificar...');
     dbdtpFComp.SetFocus;
     Exit;
  end;

   if not DiaAperturado(dblcCia.text,dbdtpFComp.Date,dblcBanco.text) then
   Begin
     dbdtpFComp.setfocus;
     Exit;
   End;

	if dbdtpFComp.Date=0 then
  begin
    ShowMessage('Fecha de Comprobante Errada');
    dbdtpFComp.SetFocus;
    Exit;
  end;

   xWhere:='TMONID='+quotedstr(DMTE.wTMonExt)
          +' and FECHA='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date)+''')';
   if length(DMTE.DisplayDescrip('prvTGE','TGE107','TMONID, '+DMTE.wTipoCambioUsar,xWhere,'TMONID'))=0 then
   begin
      dbdtpFComp.SetFocus;
      ShowMessage('Tipo de Cambio No Registrado');
      exit;
   end;

   dbeTCambio.Text:=DMTE.DisplayDescrip('prvTGE','TGE107','TMONID, '+DMTE.wTipoCambioUsar,xWhere,DMTE.wTipoCambioUsar);

   edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                   +copy(datetostr(dbdtpFComp.date),4,2);
   dbdtpFEmis.date:= dbdtpFComp.date;

   if trim(edtTDiario.Text) <> '' then
   begin
      xWhere:='CIAID='+quotedstr(dblcCia.Text)+' AND ECANOMM='+quotedstr(edtPeriodo.Text)
             +' AND TDIARID='+ quotedstr(dblcTDiario.Text); 
      dbeNoComp.text:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
   end ;
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.dblcTDiarioExit(Sender: TObject);
var xWhere:string;
begin
   edtTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE104','TDIARDES','TDIARID='+quotedstr(dblcTDiario.text),'TDIARDES');
   if trim(edtTDiario.Text) <> '' then
   begin
      xWhere:='CIAID='+quotedstr(dblcCia.Text)+' AND ECANOMM='+quotedstr(edtPeriodo.Text)
             +' AND TDIARID='+ quotedstr(dblcTDiario.Text); // + ' AND EC_PROCE='+quotedstr('B');
      dbeNoComp.text:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
   end ;
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.z2bbtnOKClick(Sender: TObject);
Var
	 sDocumentos,xWhere,aux , xFiltro,xSQL,xWhere2 : string;
	 xFlag : Boolean ;
begin
   if (dblcClase.Enabled) and (z2bbtnSube.Tag <> 1) then
   begin
      DMTE.cdsMovCxC.close;
      DMTE.cdsMovCxC.DataRequest('SELECT * FROM CXC301 WHERE CIAID=''''');
      DMTE.cdsMovCxC.Open;
      DMTE.cdsMovCxC.IndexFieldNames:='CLAUXID;CLIEID;CCFEMIS';

   end;
   z2bbtnSube.Tag := 0;

   // consistencia de Datos
   ValidaCabecera2;

   // VALIDA LA CUENTA
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,'',edtCuenta.text)) and (dblcTMon.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+edtCuenta.text+' Se registra sólo en Moneda Extranjera.');
   end;

   // VALIDA LA CUENTA DEL CONCEPTO
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,dblcdCnp.text,'')) and (dblcTMon.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+DMTE.cdsQry.FieldByName('CUENTAID').AsString+' del Concepto '+dblcdCnp.text+' Se registra sólo en Moneda Extranjera.');
   end;

   // En este punto ya se ha probado todas las consistencias y ya se puede grabar
   // Actualizamos el Client Data Set de Egr.Caja (CAJA302)
   with DMTE do
   begin
     cdsEgrCaja.Edit ;
     cdsEgrCaja.FieldByName('CIAID').Value    :=dblcCia.Text         ;
     cdsEgrCaja.FieldByName('TDIARID').Value  :=dblcTDiario.Text     ;
     cdsEgrCaja.FieldByName('ECANOMM').Value  :=edtPeriodo.Text      ;
     cdsEgrCaja.FieldByName('ECNOCOMP').Value :=dbeNoComp.Text       ;
     cdsEgrCaja.FieldByName('ECFCOMP').Value  :=dbdtpFComp.Date      ;
     cdsEgrCaja.FieldByName('FPAGOID').Value  :=dblcFormPago.Text    ;
     cdsEgrCaja.FieldByName('EQUIID').AsString:=EquivFPago( dblcFormPago.Text ,dblcBanco.Text) ;
     cdsEgrCaja.FieldByName('TMONID').Value   :=dblcTMon.Text;
     cdsEgrCaja.FieldByName('ECTCAMB').Value  :=strtofloat(dbeTCambio.Text);
     cdsEgrCaja.FieldByName('ECMTOORI').Value :=strtofloat(dbeImporte.Text);
     //** 05/06/2001 - pjsv
     cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString := xVoucher;
     //**
     if trim(dblcdFEfec.Text) = '' then
				cdsEgrCaja.fieldbyname('FLUEID').Clear
     else
        cdsEgrCaja.fieldbyname('FLUEID').AsString := trim(dblcdFEfec.Text) ;

     if cdsEgrCaja.FieldByName('TMONID').Value=wTMonLoc then
     begin
        cdsEgrCaja.FieldByName('ECMTOLOC').Value:=strtofloat(dbeImporte.Text);
        cdsEgrCaja.FieldByName('ECMTOEXT').Value:=FRound(strtofloat(dbeImporte.Text)/strtofloat(dbeTCambio.Text),15,2);
     end
     else
     begin
        cdsEgrCaja.FieldByName('ECMTOLOC').Value:=FRound(strtofloat(dbeImporte.Text)*strtofloat(dbeTCambio.Text),15,2);
        cdsEgrCaja.FieldByName('ECMTOEXT').Value:=strtofloat(dbeImporte.Text);
     end;

     cdsEgrCaja.FieldByName('BANCOID').Value :=dblcBanco.Text;
     cdsEgrCaja.FieldByName('CCBCOID').Value :=dblcCCBco.Text;
     cdsEgrCaja.FieldByName('ECNOCHQ').Value :=dbeNoChq.Text;

     // se condiciona porque si esta en blanco la fecha graba 1899
     if edtFormPago.text = 'CHEQUE' then
     begin
        if dbdtpFEmis.Text = '' then dbdtpFEmis.Date :=DateS;
        cdsEgrCaja.fieldBYName('ECFEMICH').AsDateTime:=dbdtpFEmis.Date ;
     end;
     cdsEgrCaja.FieldByName('PROV').Value    := dblcdAux.Text ;
     cdsEgrCaja.FieldByName('PROVRUC').Value := edtAuxRuc.Text ;
     cdsEgrCaja.FieldByName('CLAUXID').AsString := dblcClase.Text ;
     cdsEgrCaja.FieldByName('ECGIRA').AsString := dbeGiradoA.Text ;
     cdsEgrCaja.FieldByName('CPTOID').Value  :=dblcdCnp.Text;
     cdsEgrCaja.FieldByName('CUENTAID').Value:=edtCuenta.Text;
     cdsEgrCaja.FieldByName('ECGLOSA').Value :=dbeGlosa.Text;
		 cdsEgrCaja.FieldByName('ECLOTE').Value  :=dbeLote.Text;
     cdsEgrCaja.FieldByName('ECESTADO').Value:='I';

     xWhere:='FECHA='+DMTE.wRepFuncDate +''''+ formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date)+''')';
     aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
     cdsEgrCaja.FieldByName('ECANO').AsString   := cdsqry.FieldByName('FECANO').AsString;
     cdsEgrCaja.FieldByName('ECMM').AsString    := cdsqry.FieldByName('FECMES').AsString;
     cdsEgrCaja.FieldByName('ECDD').AsString    := cdsqry.FieldByName('FECDIA').AsString;
     cdsEgrCaja.FieldByName('ECSS').AsString    := cdsqry.FieldByName('FECSS').AsString;
     cdsEgrCaja.FieldByName('ECSEM').AsString   := cdsqry.FieldByName('FECSEM').AsString;
     cdsEgrCaja.FieldByName('ECTRI').AsString   := cdsqry.FieldByName('FECTRIM').AsString;
     cdsEgrCaja.FieldByName('ECAASS').AsString  := cdsqry.FieldByName('FECAASS').AsString;
     cdsEgrCaja.FieldByName('ECAASEM').AsString := cdsqry.FieldByName('FECAASEM').AsString;
     cdsEgrCaja.FieldByName('ECAATRI').AsString := cdsqry.FieldByName('FECAATRI').AsString;
     cdsEgrCaja.FieldByName('EC_PROCE').AsString:='L' ;
     cdsEgrCaja.FieldByName('EC_IE').AsString   :='E' ;
     //**07/08/2001 - pjsv
     If DMTE.wModo = 'A' then
     cdsEgrCaja.FieldByName('PRVBANCOID').AsString := DMTE.cdsProvCta.fieldbyname('BANCOID').AsString;
     cdsEgrCaja.FieldByName('PRVCCBCOID').AsString := DMTE.cdsProvCta.fieldbyname('CCBCOID').AsString;
     //**
   end;

   // Actualizamos el Detalle mostrado en el grid ante posibles cambios del
   // Tipo de Cambio

   //actualizamos el detalle de CxP ante posibles
   //cambios del tipo de cambio
   if xTC <> strtocurr(dbeTCambio.Text) then
   begin
      if DMTE.cdsregcxp.RecordCount > 0 then
         ActDetCaja ;
			if DMTE.cdsDocPago.RecordCount > 0 then
         ActDetCxP  ;
   end  ;
   //Actualizamos el Footer
   z2bbtnSumatClick(sender);

   //*****************************

   if dblcClase.Enabled then
   begin
      xFlag := False ;
      //Comprobar si hay mov seleccionados con otro proveedor
      if DMTE.cdsDocPago.RecordCount > 0 then
      begin
         DMTE.cdsDocPago.First ;
         if (trim(dblcClase.Text) <> DMTE.cdsDocPago.FieldByName('CLAUXID').AsString )
                 or
            (trim(dblcdAux.Text) <> DMTE.cdsDocPago.FieldByName('PROV').AsString ) then
         begin
            DMTE.cdsDocPago.CancelUpdates ;
            DMTE.cdsMovCxC.CancelUpdates ;
            xFlag := True ;
         end
      end
      else
          xFlag := True ;

      //xAuxT:=dblcdAux.Text;

		if xFlag then
		begin
          // vhn Se elimina porque todos los documentos deben pasar a caja
          {
			 DMTE.cdsQry.Close;
			 DMTE.cdsQry.DataRequest('SELECT DOCID FROM TGE110 WHERE (DOCMOD=''CAJA'' OR DOCMOD=''CXP'') AND DOCRESTA=''S''');
			 DMTE.cdsQry.Open;
			 DMTE.cdsQry.First;
			 sDocumentos:='';
			 if DMTE.cdsQry.RecordCount>0 then
			 begin
				 sDocumentos:=' AND (';
				 while not DMTE.cdsQry.EOF do
				 begin
					 if DMTE.cdsQry.RecordCount=1 then
						 sDocumentos:=sDocumentos+' DOCID<>'+QuotedStr(DMTE.cdsQry.FieldByName('DOCID').AsString)
					 else
					 if DMTE.cdsQry.RecNo=DMTE.cdsQry.RecordCount then
						 sDocumentos:=sDocumentos+' DOCID<>'+QuotedStr(DMTE.cdsQry.FieldByName('DOCID').AsString)
					 else
						 sDocumentos:=sDocumentos+' DOCID<>'+QuotedStr(DMTE.cdsQry.FieldByName('DOCID').AsString)+' AND ';
					 DMTE.cdsQry.Next;
				 end;
				 sDocumentos:=sDocumentos+' )';
			 end;
          }

			 {xWhere :='CIAID='''   +dblcCia.Text   + ''' and ' +
								'CPESTADO='''+'P'            + ''' and ' +
								'CLAUXID=''' +dblcClase.Text + ''' and ' +
								'PROV='''    +dblcdAux.Text  + '''';

			 xFiltro:=' (((CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR '+
								'   ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) '  ;

			 DMTE.cdsMovCxP.Close;
			 DMTE.cdsMovCxP.Datarequest('SELECT * FROM CXP301 WHERE ' + xWhere ) ;
			 DMTE.cdsMovCxP.Open;
       DMTE.cdsMovCxP.IndexFieldNames:='CLAUXID;PROV;CPFEMIS';

			 DMTE.cdsMovCxP.Filter   := xFiltro ;

       DMTE.cdsMovCxP.Filtered := True ;

         if DMTE.cdsMovCxP.RecordCount=0 then
         begin
            ShowMessage('No hay Documentos Pendientes para Proveedor') ;
         end;}
      /////////////////////////

       xSQL := ' SELECT DOCID FROM TGE110 '+
               ' WHERE DOCMOD=''CXC'' '+
               ' AND DOCRESTA=''S'' ';
       DMTE.cdsSQL.Close;
       DMTE.cdsSQL.DataRequest(xSQL);
       DMTE.cdsSQL.Open;
       DMTE.cdsSQL.First;
       xWhere2 :='';
       while not DMTE.cdsSQL.Eof do begin
          if length(xWhere2)=0 then
             xWhere2 :=' DOCID='+Quotedstr(DMTE.cdsSQL.fieldbyname('DOCID').AsString)
          else
             xWhere2 := xWhere2+' OR DOCID='+Quotedstr(DMTE.cdsSQL.fieldbyname('DOCID').AsString);
          DMTE.cdsSQL.Next;
       end;
       xWhere2 := ' and('+xWhere2+' )';
       ////////////////////

			 xWhere :='CIAID='''   +dblcCia.Text   + ''' and ' +
								'CCESTADO='''+'P'            + ''' and ' +
								'CLAUXID=''' +dblcClase.Text + ''' and ' +
								'CLIEID='''    +dblcdAux.Text  + '''';
       xWhere := xWhere+xWhere2;
			 xFiltro:=' (((CCMTOORI-CCPAGORI-CCSALORI)> -0.01 and (CCMTOORI-CCPAGORI-CCSALORI) < 0.01 ) OR '+
								'   ( CCMTOORI = CCSALORI ) )  AND ( CCSALORI > 0 ) '  ;

			 DMTE.cdsMovCxC.Close;
			 DMTE.cdsMovCxC.Datarequest('SELECT * FROM CXC301 WHERE ' + xWhere ) ;
			 DMTE.cdsMovCxC.Open;
       DMTE.cdsMovCxC.IndexFieldNames:='CLAUXID;CLIEID;CCFEMIS';

			 DMTE.cdsMovCxC.Filter   := xFiltro ;

       DMTE.cdsMovCxC.Filtered := True ;

         if DMTE.cdsMovCxC.RecordCount=0 then
         begin
            ShowMessage('No hay Documentos Pendientes para el Cliente') ;
         end;

      /////////////////////////
      end;
   end;
   // Estado de los componentes
   pnlCabecera1.enabled  := False;
   pnlCabecera2.enabled  := False;
   pnlDetalle.enabled    := True;
   pnlBotones.Enabled    := True;
   ActPnlBotones;

   z2bbtnOk.Enabled      := False;
   z2bbtnCancel.Enabled  := False;
end;

{******************************************************************************}
procedure TFPagoFacturasCobrar.z2bbtnCancelClick(Sender: TObject);
begin
   DMTE.cdsEgrCaja.CancelUpdates;
   if DMTE.cdsRegCxP.Active  then DMTE.cdsRegCxP.CancelUpdates;
   if DMTE.cdsDocPago.Active then DMTE.cdsDocPago.CancelUpdates;
   if DMTE.cdsMovCxC.Active  then DMTE.cdsMovCxC.CancelUpdates;
   Adiciona ;
   AdicIniciadatos ;
   dbeLote.Text := '000';
end;

{******************************************************************************}
procedure TFPagoFacturasCobrar.z2bbtnCalcClick(Sender: TObject);
begin
   WinExec ( 'calc.exe',1 ) ;  //Activa la calculadora del Windows
end;
{******************************************************************************}

procedure TFPagoFacturasCobrar.z2bbtnSumatDocPagoClick(Sender: TObject);
Var
   xTSalLoc, xTSalExt, xTPagLoc, xTPagExt : Real;
   xRegAct : TBookMark;
begin
   with DMTE do
   begin
   // Totales de Documentos pagados
      cdsDocPago.DisableControls ;
      xRegAct   := cdsDocPago.GetBookmark ;
      xTSalLoc  := 0; xTSalExt := 0; xTPagLoc := 0; xTPagExt := 0 ;
      cdsDocPago.First ;
      while not cdsDocPago.Eof do
      begin
         xTSalLoc := xTSalLoc + DMTE.FRound(cdsDocPago.FieldByName('DESALLOC').AsFloat,15,2) ;
         xTSalExt := xTSalExt + DMTE.FRound(cdsDocPago.FieldByName('DESALEXT').AsFloat,15,2) ;
         xTPagLoc := xTPagLoc + DMTE.FRound(cdsDocPago.FieldByName('DEMTOLOC').AsFloat,15,2) ;
         xTPagExt := xTPagExt + DMTE.FRound(cdsDocPago.FieldByName('DEMTOEXT').AsFloat,15,2) ;
         cdsDocPago.Next ;
      end ;
      dbgDocPago.ColumnByName('DESALLOC').FooterValue:=floattostrf(xTSalLoc, ffNumber, 10, 2) ;
      dbgDocPago.ColumnByName('DESALEXT').FooterValue:=floattostrf(xTSalExt, ffNumber, 10, 2) ;
      dbgDocPago.ColumnByName('DEMTOLOC').FooterValue:=floattostrf(xTPagLoc, ffNumber, 10, 2) ;
      dbgDocPago.ColumnByName('DEMTOEXT').FooterValue:=floattostrf(xTPagExt, ffNumber, 10, 2) ;
      cdsDocPago.GotoBookmark(xRegAct) ;
      cdsDocPago.FreeBookmark(xRegAct) ;
      cdsDocPago.EnableControls ;
   end ;
end ;
{******************************************************************************}
procedure TFPagoFacturasCobrar.z2bbtnSubeClick(Sender: TObject) ;
begin
   //** 07/06/2001 - pjsv, para validar en el z2bbtnOK.OnClick
   z2bbtnSube.Tag := 1;
   //**
   DMTE.cdsEgrCaja.Edit ;
//   DMTE.cdsRegCxP.Edit  ;

   pnlCabecera2.Enabled:= True   ;
   pnlDetalle.Enabled  := False  ;
   pnlBotones.Enabled  := False  ;

   z2bbtnOk.Enabled      := True ;
   z2bbtnCancel.Enabled  := True ;

   // Desactivamos los botones
//   z2bbtnSumat.Enabled     := False;
   z2bbtnCont.Enabled      := False  ;
   z2bbtnNuevo.Enabled     := False  ;
   z2bbtnImprime.Enabled   := False  ;
   z2bbtnSube.Enabled      := False  ;
   z2bbtnGraba.Enabled     := False  ;
   z2bbtnCancelado.Enabled := False  ;
   z2bbtnCancel2.Enabled   := False  ;
   z2bbtnAnula.Enabled     := False  ;
end                                  ;
{******************************************************************************}
procedure TFPagoFacturasCobrar.z2bbtnCancel2Click(Sender: TObject) ;
begin
   if MessageDlg('¿Anular los cambios?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin
      DMTE.cdsEgrCaja.CancelUpdates ;
      DMTE.cdsRegCxP.CancelUpdates  ;
      DMTE.cdsMovCxC.CancelUpdates  ;
      DMTE.cdsDocPago.CancelUpdates ;
      IniciaDatos                  ;
      //** 04/12/2000 - pjsv
      Limpiapnlaux;
      //**
      //** 26/03/2001 - pjsv
      RecuperarCiaUnica(dblcCia,edtCia);
      dbeLote.text := '000';
      dbeLote.OnExit(self);
      dblcCia.OnExit(self);
      //**
      //** 05/06/2001 - pjsv, para grabar el nuevo voucher
      xVoucher := '';
      //**
   end                             ;
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.z2bbtnNuevoClick(Sender: TObject);
begin
   if DMTE.cdsEgrCaja.FieldByName('ECEstado').Value ='I' then
   begin
    if wmodifica then
      begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas') ;
         exit ;
      end ;
    if MessageDlg('¿Nuevo Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin
        //0805         IniciaDatos;
         Adiciona         ;
         AdicIniciadatos  ;
        //** 04/12/2000 - pjsv
        Limpiapnlaux;
        //**
        //** 26/03/2001 - pjsv
        RecuperarCiaUnica(dblcCia,edtCia);
        dbeLote.text := '000';
        dbeLote.OnExit(self);
        dblcCia.OnExit(self);
        //**
      end ;
   end
   else
   begin
//0805      IniciaDatos;
      Adiciona        ;
      AdicIniciadatos ;
      //** 04/12/2000 - pjsv
      Limpiapnlaux;
      //**
      //** 26/03/2001 - pjsv
      RecuperarCiaUnica(dblcCia,edtCia);
      dbeLote.text := '000';
      dbeLote.OnExit(self);
      dblcCia.OnExit(self);
      //**
   end ;
  //** 05/06/2001 - pjsv, para grabar el nuevo voucher
  xVoucher := '';
  //**
end ;
{******************************************************************************}
procedure TFPagoFacturasCobrar.z2bbtnGrabaClick(Sender: TObject);
var
  sSql, xSQL : string;
begin
  if (DMTE.cdsRegCxP.RecordCount=0) AND (DMTE.cdsDocPago.RecordCount=0) then
  begin
    Raise Exception.Create('No se ha ingresado documentos');
  end;

  if DMTE.cdsEgrCaja.FieldByName('ECEstado').Value='I' then
  begin
    ActSaldosMovCxP;
    DMTE.cdsEgrCaja.edit;
    DMTE.cdsEgrCaja.FieldByName('ECUSER').Value      := DMTE.wUsuario; // usuario que registra
    DMTE.cdsEgrCaja.FieldByName('ECFREG').Value      := DateS;         // fecha que registra Usuario
    DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time;         // Hora de Registro de Usuario
    //** 04/04/2001 - pjsv, antes se hallaban en caja3021
    ssql:='SELECT * FROM TGE202 WHERE '+
          'CIAID='+quotedstr(dblccia.Text)+ ' AND CUENTAID=' +quotedstr(edtCuenta.text);

    DMTE.cdsQry2.Close;
    DMTE.cdsQry2.DataRequest(ssql);
    DMTE.cdsQry2.open;
    //**
    cdspost(DMTE.cdsEgrCaja);
    xSQL:='Select * from CAJA302 '
    			+'Where CIAID='''   +dblcCia.Text    +''' and '
    			+      'ECANOMM=''' +edtPeriodo.Text +''' and '
    			+      'TDIARID=''' +dblcTDiario.Text+''' and '
    			+      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
    DMTE.cdsEgrCaja.DataRequest( xSQL );
    DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

    DMTE.cdsRegCxP.ApplyUpdates(0);
    DMTE.cdsDocPago.ApplyUpdates(0);
    z2bbtnSumatClick(sender);
    ShowMessage('Grabacion OK');
    if dblcClase.Enabled then
    begin
      dblcClase.Enabled     := False ;
      dblcdAux.Enabled      := False ;
    end ;

    z2bbtnNuevo.Enabled     := True  ;
    z2bbtnCancelado.Enabled := True  ;
    z2bbtnAnula.Enabled     := True  ;
    z2bbtnImprime.Enabled   := True  ;
    wmodifica               := False ;
  end
  else
  begin
    ShowMessage('Imposible Grabar');
  end;
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.z2bbtnCanceladoClick(Sender: TObject);
var
   xSQL : string;
	 xRetencion,xConsis:Boolean;
begin
  if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='I' then
  begin
    if wmodifica or (DMTE.cdsdocpago.ChangeCount > 0 ) or DMTE.cdsdocpago.Modified then
    begin
    	 ShowMessage('Debe grabar primero las actualizaciones realizadas');
    	 exit;
    end;

    DMTE.cdsRegCxP.DisableControls;
    ConsisCancela(xConsis);
    DMTE.cdsRegCxP.EnableControls;
    if not xConsis then
      ShowMessage('No se puede Cancelar el Comprobante')
    else
    begin
      if MessageDlg('¿Efectuar la Cancelacion del Comprobante?',mtConfirmation,
                                                             [mbYes, mbNo], 0)=mrYes then
      begin
        ActMovCxP;

        ActualizaDetCanje;

        // Calcula Retencion del IGV
        xRetencion:=DMTE.CalculaRetencionIGV;

        dbeImporte.Text:=DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString;

        // Fin Calcula Retencion del IGV
        DMTE.cdsEgrCaja.Edit;
        DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'C';
        DMTE.cdsEgrCaja.FieldByName('ECUSER').Value      := DMTE.wUsuario; // usuario que registra
        DMTE.cdsEgrCaja.FieldByName('ECFREG').Value      := DateS;         // fecha que registra Usuario
        DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time;         // Hora de Registro de Usuario
        if xRetencion then
          DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString := 'S'
        else
          DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString := 'N';

        cdspost(DMTE.cdsEgrCaja);

        xSQL:='Select * from CAJA302 '
                      +'Where CIAID='''   +dblcCia.Text    +''' and '
                      +      'ECANOMM=''' +edtPeriodo.Text +''' and '
                      +      'TDIARID=''' +dblcTDiario.Text+''' and '
                      +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
        DMTE.cdsEgrCaja.DataRequest( xSQL );

        DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');
        DMTE.AplicaDatos(DMTE.cdsRegCxP, 'REGCXP');

        z2bbtnSumatClick(sender);
        dbgPendientes.ReadOnly :=True;
        dbgDocPago.ReadOnly    :=True;
        dbgOtros.ReadOnly      :=True;
        z2bbtnCont.Enabled     :=True;
        z2bbtnAnula.Enabled    :=True;
        z2bbtnSube.Enabled     :=False;
        z2bbtnGraba.Enabled    :=False;
        z2bbtnCancelado.Enabled:=False;
        z2bbtnCancel2.Enabled  :=False;
        dbgOtrosIButton.Enabled:=False ;
        lblEstado.Caption      :='Cancelado          ';

        //sitio para actualizaciones de saldo
        SaldosAux ;
        ActualizaSaldosCaja ;

        If dblcdCtaCte.text <> '' then
           Z2bbtnNotaAbono.enabled := True
        else
           Z2bbtnNotaAbono.enabled := False;
      end;
    end;
  end
  else
  begin
      ShowMessage('Imposible Cancelar');
  end;
end;

{******************************************************************************}
function TFPagoFacturasCobrar.ValidaCampo:Boolean;
var xWhere,aux:string;
begin
     Result:=True;
     with DMTE do
     begin

        if length(cdsRegCxP.FieldByName('CPNOREG').Value)=0 then
        begin  //No Registro
           ShowMessage('Falta No Registro');
           Result:=False;
           exit;
        end
        else
        begin
           if length(cdsRegCxP.FieldByName('CPNOREG').Value)<6 then
           begin
              ShowMessage('Codigo de Registro Errado');
              Result:=False;
              exit;
           end;
        end;
        {
        if length(cdsRegCxP.FieldByName('TDIARID2').Value)=0 then
        begin  //Tipo de Diario
           ShowMessage('Falta Tipo de Diario');
           Result:=False;
           exit;
        end
        else
        begin
           xWhere:='TDIARID='+''''+cdsRegCxP.FieldByName('TDIARID2').Value+'''';
           aux   :=DisplayDescrip('prvTGE','TGE104','TDIARDES',xWhere,'TDIARDES');
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Tipo de Diario Errado');
              Result:=False;
              exit;
           end;
        end;
        }
        if length(cdsRegCxP.FieldByName('DOCID2').Value)=0 then
        begin  //Tipo de Documento
           ShowMessage('Falta Tipo de Documento');
           Result:=False;
           exit;
        end
        else
        begin
           xWhere:='DOCID='+''''+cdsRegCxP.FieldByName('DOCID2').Value+'''';
           aux   :=DisplayDescrip('prvTGE','TGE110','DOCDES',xWhere,'DOCDES');
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Tipo de Documento Errado');
              Result:=False;
              exit;
           end;
        end;

        if cdsRegCxP.FieldByName('CPSERIE').Value='' then
        begin      //Serie
           ShowMessage('Falta Serie');
           Result:=False;
           exit;
        end;

        if cdsRegCxP.FieldByName('CPNODOC').Value='' then
        begin      //No Documento
           ShowMessage('Falta Nro. de Documento');
           Result:=False;
           exit;
        end;

        if length(cdsRegCxP.FieldByName('TMONID').Value)=0 then
        begin //Tipo de Moneda
           ShowMessage('Falta Tipo de Moneda');
           Result:=False;
           exit;
        end
        else
        begin
           xWhere:='TMONID='+''''+cdsRegCxP.FieldByName('TMONID').Value+'''';
					 aux   :=DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Tipo de Moneda Errado');
              Result:=False;
              exit;
           end;
        end;

        if cdsRegCxP.FieldByName('DETCDOC').Value<=0 Then
        begin // Tipo de Cambio Detalle
           ShowMessage('Tipo de Cambio debe ser mayor que cero');
           Result:=False;
           exit;
        end;

        if cdsRegCxP.FieldByName('DEMTOORI').Value<=0 Then
        begin   //Importe
           ShowMessage('Importe debe ser mayor que cero');
           Result:=False;
           exit;
        end;

        if cdsRegCxP.FieldByName('CPTOID').Value='' then
        begin      //Concepto
           ShowMessage('Falta Concepto');
           Result:=False;
           exit;
        end
        else
        begin                             // Cuenta
           aux:=cdsRegCxP.FieldByName('CUENTAID').Value;
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Concepto Errado');
              Result:=False;
              exit;
           end;
        end;

//Validación de centro de costo y auxiliares
        if (dblcdCCosto.Enabled) then
        begin  //Centro de Costo
          IF (length(cdsRegCxP.FieldByName('CCOSID').Value)=0) THEN
          BEGIN
              ShowMessage('Falta Centro de Costo') ;
              Result:=False ;
              exit ;
          END
          else
          begin
           xWhere:='CCosID='+''''+cdsRegCxP.FieldByName('CCOSID').Value+'''' ;
           aux   :=DisplayDescrip('prvTGE','TGE203','CCOSDES',xWhere,'CCosDes') ;
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Centro de Costo Errado') ;
              Result:=False ;
              exit ;
           end ;
          end ;
        end ;

        if (dblcClaseDet.Enabled) then
        begin

          IF trim( dblcClaseDet.Text ) = '' THEN
          BEGIN
              ShowMessage('Ingrese Clase') ;
              Result:=False ;
              exit ;
          END ;

          IF trim( dblcdAuxDet.Text ) = '' THEN
          BEGIN
              ShowMessage('Ingrese Auxiliar') ;
              Result:=False ;
              exit ;
          END

        end ;

//fin de validaciones

        if cdsRegCxP.FieldByName('CPFVCMTO').Value<cdsRegCxP.FieldByName('CPFEMIS').Value then
        begin //Fecha de Vencimiento
             ShowMessage('Fecha de Vencimiento debe ser posterior a la Fecha de Emision');
             Result:=False;
             exit;
        end;
    end;
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.ConsisCancela(Var xConsis:boolean);
var
    xRegAct : TBookMark;
    xSumImp , Suma : Double;
begin
   xConsis := True;
   xSumImp := 0;
   With DMTE do
   begin
      xRegAct := cdsRegCxP.GetBookmark;
      cdsRegCxP.First ;
      While not cdsRegCxP.Eof do
      Begin
         if cdsRegCxP.FieldByName('DEDH').Value='D' then
            if cdsEgrCaja.FieldByName('TMONID').Value = wtMonLoc then
               xSumImp := xSumImp + strToCurr(stringreplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]))
            else
               xSumImp := xSumImp + strToCurr(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]))
         else
            if cdsEgrCaja.FieldByName('TMONID').Value = wtMonLoc then
               xSumImp := xSumImp - strToCurr( stringreplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) )
            else
               xSumImp := xSumImp - strToCurr( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) ) ;

         cdsRegCxP.Next;
      end;
      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);

      // Adicionamos el total de los Documentos Pagados
      xRegAct := cdsDocPago.GetBookmark;
      cdsDocPago.First ;
      While not cdsDocPago.Eof do
      Begin
         if cdsEgrCaja.FieldByName('TMONID').Value = wtMonLoc then
            xSumImp := xSumImp + strToCurr(stringreplace(cdsDocPago.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]))
         else
            xSumImp := xSumImp + strToCurr(stringReplace(cdsDocPago.FieldByName('DEMTOEXT').DisPlayText,',','',[rfReplaceAll])) ;

         cdsDocPago.Next;
      end;
      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);
   end;

   if DMTE.cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc then
      Suma :=  strtocurr(floattostrf(DMTE.cdsEgrCaja.fieldbyname('ECMTOLOC').AsFloat,fffixed,10,2))
   else
      Suma :=  strtocurr(floattostrf(DMTE.cdsEgrCaja.fieldbyname('ECMTOEXT').AsFloat,fffixed,10,2)) ;

   if FloatToStrF(xSumImp,ffFixed,15,2) <> FloatToStrF(Suma,ffFixed,15,2) then
   begin
      xConsis := False;
      if Suma > xSumImp then
         ShowMessage('El Monto a Pagar es mayor que el Provisionado')
      else
         ShowMessage('El Monto a Pagar es menor que el Provisionado');
   end;

end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.Contab_Haber;
VAR
    xMtoRetL,xMtoRetE : Double;
    xMtoTotalL,xMtoTotalE,xMtoL,xMtoE : Double;
    bLetra:boolean;
    xSQL:string;
    xMtoTotalHL, xMtoTotalHE : Double;
begin
  //CALCULAR EL MONTO RETENIDO
  xMtoTotalHL:=0;
  xMtoTotalHE:=0;
  bLetra:=False;
  DMTE.cdsDocPago.DisableControls;
  DMTE.cdsDocPago.First;
  while not DMTE.cdsDocPago.EOF do
  begin  //(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat>=DMTE.xTasaMonto)  AND
    if DMTE.cdsDocPago.FieldByName('DOCID2').AsString<>DMTE.sLet then
    begin // SI SON FACTURAS
      if (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec)  AND
         (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV','DOCMOD=''CXC'' AND DOCID='+QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString),'DOCRETIGV')='S') AND
         (lblSujetoRetencion.visible) then
      begin
        xMtoL:=xMtoL+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
        xMtoE:=xMtoE+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
      end;
      if DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat>0 then begin
         xMtoTotalL:=xMtoTotalL+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
         xMtoTotalE:=xMtoTotalE+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
      end
      else begin
         xMtoTotalHL:=xMtoTotalHL+(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat*(-1));
         xMtoTotalHE:=xMtoTotalHE+(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat*(-1));
      end;
    end
    else //SI SON LETRAS
    begin
       bLetra:=True;
       xSQL  :=' CIAID='''   +DMTE.cdsDocPago.fieldbyname('CIAID').AsString   +''' and '
              +' CPANOMES='''+DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString +''' and '
              +' TDIARID=''' +DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString+''' and '
              +' CPNOREG=''' +DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString +''' '  ;

       if DMTE.RecuperarDatos( 'CXC301' , 'TMONID,TCANJEID,CCNOGRAV,CPGRAVAD,PROVDES,CPTCAMPR,CCTCAMAJ' , xSQL ) then
       begin
         if (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec)  AND
            (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV','DOCMOD=''CXC'' AND DOCID='+QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString),'DOCRETIGV')='S') AND
            (lblSujetoRetencion.visible) then
         begin
           if DMTE.cdsRec.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
           begin
             xMtoRetL:=DMTE.FRound(xMtoRetL+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2);
             xMtoRetE:=DMTE.FRound(xMtoRetE+(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat/StrToFloat(dbeTCambio.text)),15,2);
           end
           else
           begin
             xMtoRetE:=DMTE.FRound(xMtoRetE+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2);
             xMtoRetL:=DMTE.FRound(xMtoRetL+(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat*StrToFloat(dbeTCambio.text)),15,2);
           end;
           xMtoL:=xMtoL+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
           xMtoE:=xMtoE+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
         end;
         xMtoTotalL:=xMtoTotalL+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
         xMtoTotalE:=xMtoTotalE+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
       end
       else
    		 Showmessage('Error en la recuperación del documento - WMC');
    end;
    DMTE.cdsDocPago.Next;
  end;
  DMTE.cdsDocPago.EnableControls;

  DMTE.cdsRegCxP.DisableControls;
  DMTE.cdsRegCxP.First;
  while not DMTE.cdsRegCxP.EOF do
  begin //(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat>=DMTE.xTasaMonto)  AND
    if (DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec)  AND
       (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV','DOCMOD=''CXC'' AND DOCID='+QuotedStr(DMTE.cdsRegCxP.FieldByName('DOCID2').AsString),'DOCRETIGV')='S') AND
       (lblSujetoRetencion.visible) then
    begin
      xMtoL:=xMtoL+DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
      xMtoE:=xMtoE+DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
    end;

    //xMtoTotalL:=xMtoTotalL+DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
    //xMtoTotalE:=xMtoTotalE+DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;

    if DMTE.cdsDocPago.FieldByName('DEDH').AsString='D' then begin
       xMtoTotalL:=xMtoTotalL+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
       xMtoTotalE:=xMtoTotalE+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
    end
    else begin
       xMtoTotalHL:=xMtoTotalHL+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
       xMtoTotalHE:=xMtoTotalHE+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
    end;

    DMTE.cdsRegCxP.Next;
  end;
  DMTE.cdsRegCxP.EnableControls;

  if bLetra then
  begin
    {if xMtoRetL>0 then
    begin
      xMtoL:=xMtoTotalL;
      xMtoE:=xMtoTotalE;
    end
    else
    begin
      xMtoL:=xMtoTotalL;
      xMtoE:=xMtoTotalE;
      xMtoRetL:=0;
      xMtoRetE:=0;
    end;}
   if xMtoL<=0 then
   begin
     xMtoL:=xMtoTotalL;
     xMtoE:=xMtoTotalE;
   end;
   xMtoRetL:=0;
   xMtoRetE:=0;

  end
  else
  begin
    if xMtoL>DMTE.xTasaMonto then
    begin
      xMtoRetL:=DMTE.FRound(xMtoL*DMTE.xTasaPorce/100,15,2);
      xMtoRetE:=DMTE.FRound(xMtoE*DMTE.xTasaPorce/100,15,2);
    end
    else
    begin
      xMtoL:=xMtoTotalL;
      xMtoE:=xMtoTotalE;
      xMtoRetL:=0;
      xMtoRetE:=0;
    end;
  end;

  DMTE.cdsCntCaja.FieldByName('CIAID').Value      :=  DMTE.cdsEgrcaja.FieldByName('CIAID').Value;
  DMTE.cdsCntCaja.FieldByName('TDIARID').Value    :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
  DMTE.cdsCntCaja.FieldByName('ECANOMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
  DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
  DMTE.cdsCntCaja.FieldByName('DCLOTE').Value     :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
  DMTE.cdsCntCaja.FieldByName('DOCID').Value      :=  DMTE.cdsEgrCaja.FieldByName('DOCID').AsString;
  DMTE.cdsCntCaja.FieldByName('DCNODOC').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString;
  DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
  DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
	DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString;
	DMTE.cdsCntCaja.FieldByName('CPTOID').Value     :=  DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString;
  DMTE.cdsCntCaja.FieldByName('CUENTAID').Value   :=  DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString;
  DMTE.cdsCntCaja.FieldByName('DCDH').Value       :=  'H';
  DMTE.cdsCntCaja.FieldByName('TMONID').Value     :=  DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;

  //DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat    :=  DMTE.FRound(xMtoL-xMtoRetL,15,2);
  //DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat   :=  DMTE.FRound(xMtoE-xMtoRetE,15,2);

  DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat    :=  DMTE.FRound(xMtoTotalL-xMtoTotalHL-xMtoRetL,15,2);
  DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat   :=  DMTE.FRound(xMtoTotalE-xMtoTotalHE-xMtoRetE,15,2);

  if DMTE.cdsCntCaja.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
    DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat   :=  DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat
  else
    DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat   :=  DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat;


  DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value   :=  'S';
  DMTE.cdsCntCaja.FieldByName('DCUSER').Value     :=  DMTE.wUsuario;
  DMTE.cdsCntCaja.FieldByName('DCFREG').Value     :=  Date;
  DMTE.cdsCntCaja.FieldByName('DCHREG').Value     :=  Time;
  DMTE.cdsCntCaja.FieldByName('DCANO').AsString   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
  DMTE.cdsCntCaja.FieldByName('DCMM').AsString    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
  DMTE.cdsCntCaja.FieldByName('DCDD').AsString    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
  DMTE.cdsCntCaja.FieldByName('DCSS').AsString    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
  DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
  DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
  DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
  DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
	DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;

	DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
  if (DMTE.xSRV_RUTA='\\INCORESA') or (DMTE.xSRV_RUTA='\\SACSA') then
	 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:=DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString;

  DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsString:= dbeTCambio.Text ;
  DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsString:= dbeTCambio.Text ;
  DMTE.cdsCntCaja.FieldByName('FCAB').AsString    := '1' ;
  DMTE.cdsCntCaja.fieldbyname('DOCMOD').AsString  := FRegistro.xModulo;
  DMTE.cdsCntCaja.fieldbyname('DCTCAMPR').AsString:=DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsString;
  DMTE.cdsCntCaja.fieldbyname('DCTCAMPA').AsString:=DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsString;

  xNReg:=xNReg+1;
  DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
end;

{******************************************************************************}
procedure TFPagoFacturasCobrar.Contab_RegCxP;
var
   xSQL : String;
begin
    DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsRegCxP.FieldByName('CIAID').Value;
    DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
    DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
    DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
    DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
    DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString:= 'CXP';
    DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
    DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsRegCxP.FieldByName('CPSERIE').Value;
    DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsRegCxP.FieldByName('CPNODOC').Value;
    DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value;
    DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsRegCxP.FieldByName('CPFEMIS').Value;
    DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsRegCxP.FieldByName('CPFVCMTO').Value;
    DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  DMTE.cdsRegCxP.FieldByName('CPTOID').Value;
    DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  DMTE.cdsRegCxP.FieldByName('CUENTAID').Value;
    DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsRegCxP.FieldByName('CLAUXID').Value;
    DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsRegCxP.FieldByName('PROV').Value;
    DMTE.cdsCntCaja.FieldByName('CCOSID').Value  :=  DMTE.cdsRegCxP.FieldByName('CCOSID').Value;
    DMTE.cdsCntCaja.FieldByName('DCDH').Value    :=  DMTE.cdsRegCxP.FieldByName('DEDH').Value;
    DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
    DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
    DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsRegCxP.FieldByName('TMONID').Value;
    DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value:=  DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;

    if DMTE.cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc then
    begin
       if DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wtMonLoc then
       begin
          DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
          DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value / DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
       end
       else
       begin
          DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
          DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value * DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
       end;
    end
    else begin
       if DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wtMonExt then
       begin
          DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
          DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value :=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value*DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
       end
       else
       begin
          DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
          DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value :=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value*DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
       end;
    end;

    if DMTE.cdsRegCxP.FieldByName('FLAGVAR').AsString='R' then
    	 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:='Retencion del I.G.V.'
    else
    begin
    	 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:=DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
       if (DMTE.xSRV_RUTA='\\INCORESA') or (DMTE.xSRV_RUTA='\\SACSA') then
       begin
		    xSQL:='Select AUXNOMB from CNT201 '
					+'Where CLAUXID='''+DMTE.cdsDocPago.FieldByName('CLAUXID').AsString+''' and '
    				+      'AUXID='''  +DMTE.cdsDocPago.FieldByName('PROV').AsString  +'''';
    		 DMTE.cdsQry.Close;
			 DMTE.cdsQry.DataRequest( xSQL );
			 DMTE.cdsQry.Open;

          if DMTE.cdsQry.FieldByName('AUXNOMB').AsString<>'' then
   			 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:=DMTE.cdsQry.FieldByName('AUXNOMB').AsString;
   	 end;
    end;   

    DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
    DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
    DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
    DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
    DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
    DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
    DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
    DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
    DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
    DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
    DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
    DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
    DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;

    xNReg:=xNReg+1;
    DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
end;


{******************************************************************************}
procedure TFPagoFacturasCobrar.Contab_DocPago;
var
   xwhere, XsqL : string;
   xFactor : Integer;
begin
   xWhere:=' CIAID='''   +DMTE.cdsDocPago.fieldbyname('CIAID').AsString   +''' and '
          +' CCANOMES='''+DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString +''' and '
          +' TDIARID=''' +DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString+''' and '
          +' CCNOREG=''' +DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString +''' '  ;

   if DMTE.RecuperarDatos( 'CXC301' , 'TMONID' , xWhere ) then
      xMONID_PROV := DMTE.cdsRec.fieldbyname('TMONID').AsString
   else
			Showmessage('Error en la recuperación del documento - WMC');

	 DMTE.cdsCntCaja.FieldByName('CIAID').Value   := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
	 DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
	 DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
	 DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:= DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
	 DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
	 DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  := 'CXC';
	 DMTE.cdsCntCaja.FieldByName('DOCID').Value   := DMTE.cdsDocPago.FieldByName('DOCID2').Value;
	 DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
	 DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
	 DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
	 DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsDocPago.FieldByName('CPFEMIS').Value;
	 DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:= DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value;
	 DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.cdsDocPago.FieldByName('CPTOID').Value;
	 DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsDocPago.FieldByName('CUENTAID').Value;
	 DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value;
	 DMTE.cdsCntCaja.FieldByName('CCOSID').Value  := DMTE.cdsDocPago.FieldByName('CCOSID').AsString;
	 DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;
	 DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:= DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
	 DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:= DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
	 //DMTE.cdsCntCaja.FieldByName('TMONID').Value:= DMTE.cdsDocPago.FieldByName('TMONID').Value;
	 DMTE.cdsCntCaja.FieldByName('TMONID').Value  := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

    xFactor:=1;
    if DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat>0 then
   	 DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'D'
    else begin
       xFactor:=-1;
   	 DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'H';
    end;

	 if dblcTMon.Text=DMTE.wTMonLoc then begin
		 if xMONID_PROV = dblcTMon.Text then	begin
		 	 xMTOCNTLOC:=DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat*xFactor,15,2 ) ;
		 	 xMTOCNTEXT:=DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat*xFactor,15,2 ) ;
		 end
		 else begin
		 	 xMTOCNTEXT := DMTE.FRound( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat*xFactor,15,2 ) ;
		 	 xMTOCNTLOC := DMTE.FRound( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat*DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat*xFactor,15,2 ) ;
		 end;
		 DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value   := xMTOCNTLOC;
		 DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value    := xMTOCNTLOC;
		 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
	 end
	 else
	 begin
		 if xMONID_PROV = dblcTMon.Text then	begin
		 	 xMTOCNTEXT := DMTE.FRound( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat*xFactor,15,2 ) ;
		 	 xMTOCNTLOC := DMTE.FRound( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat*DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat*xFactor,15,2 );
		 end
		 else begin
		 	 xMTOCNTLOC:=DMTE.FRound( DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat*xFactor,15,2 ) ;
		 	 xMTOCNTEXT:=DMTE.FRound( DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat/DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat*xFactor,15,2 );
		 end;
		 DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xMTOCNTEXT;
		 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
		 DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat  := xMTOCNTLOC;
	 end ;

	 DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString:= 'S';   //Registro ya cuadrado
	 DMTE.cdsCntCaja.FieldByName('DCANO').AsString   := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
	 DMTE.cdsCntCaja.FieldByName('DCMM').AsString    := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
	 DMTE.cdsCntCaja.FieldByName('DCDD').AsString    := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
	 DMTE.cdsCntCaja.FieldByName('DCSS').AsString    := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
	 DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
	 DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
	 DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
	 DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
	 DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;

	 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;

    if (DMTE.xSRV_RUTA='\\INCORESA') or (DMTE.xSRV_RUTA='\\SACSA') or (DMTE.xSRV_RUTA='\\APLICACIONES\SOLAPLI')  then
    begin
		 xSQL:='Select AUXNOMB from CNT201 '
				+'Where CLAUXID='''+DMTE.cdsDocPago.FieldByName('CLAUXID').AsString+''' and '
				+      'AUXID='''  +DMTE.cdsDocPago.FieldByName('PROV').AsString  +'''';
		 DMTE.cdsQry.Close;
		 DMTE.cdsQry.DataRequest( xSQL );
		 DMTE.cdsQry.Open;
		 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.FieldByName('AUXNOMB').AsString;
	 end;
	 xNReg:=xNReg+1;
	 DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

end;

{******************************************************************************}
procedure TFPagoFacturasCobrar.Contab_DifCamDocPago;
var
   xsql,xsql1 : string;
   xFactor : Integer;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   //08/05/2001 - pjsv
   // se valida por sugerencia de Jorge y Jose, me confirmaron que por el tipo
  // de moneda de la cabecera, para que no genere <> de cambio cuando es local
  //** 06/09/2001 - por sugerencia de Jorge y Jose se vuelve a cambiar, basta que uno sea
  //** Extranjero debe generar <> de Cambio
   xsql := 'TMONID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('TMONID').AsString);
   xsql1 := 'TMONID='+quotedstr(DMTE.cdsDocPago.fieldbyname('TMONID').AsString);
   If (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') or
      (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then
    begin
     if DMTE.cdsDocPago.FieldByName('DETCDOC').Value <> DMTE.cdsDocPago.FieldByName('DETCPAG').Value then
      begin
        DMTE.cdsCntCaja.Insert;
        DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
        DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
        DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
        DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
        DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsDocPago.FieldByName('DOCID2').Value;
        DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  :=  'CXP';
        DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
        DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
        DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  DMTE.cdsDocPago.FieldByName('CUENTAID').Value;
        DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
        DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
        DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
        DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
        DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
        DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;

        xNReg:=xNReg+1;
        DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

        if DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat>0 then
           xFactor:=1
        else begin
           xFactor:=-1;
        end;

        DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
        DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
        DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
        DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
        DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
        if xMONID_PROV = DMTE.wTMonLoc then
         begin
           DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat-(xMTOCNTEXT*xFactor);
           DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat-(xMTOCNTLOC*xFactor);
           DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat  := DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat-(xMTOCNTLOC*xFactor);

           if DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat > DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat then
              DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D'
           else
              DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
         end
        else
         begin
				DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat-(xMTOCNTEXT*xFactor),15,2) ;
				DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat-(xMTOCNTEXT*xFactor),15,2) ;
				DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat -(xMTOCNTLOC*xFactor),15,2);

            if DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat > DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat then begin
               DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.FRound( DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat* (-1)*xFactor, 15, 2 );
               DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.FRound( DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat* (-1)*xFactor, 15, 2 );
               DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat  := DMTE.FRound( DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat * (-1)*xFactor, 15, 2 );
               DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H'
            end
            else begin
               DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.FRound( DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat*xFactor, 15, 2 );
               DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.FRound( DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat*xFactor, 15, 2 );
               DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat  := DMTE.FRound( DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat *xFactor, 15, 2 );
               if DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat>0 then
                  DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D'
               else begin
                  DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
              end;
            end;
         end ;

        if DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'D' then
         begin
           DMTE.cdsCntCaja.FieldByName('CPTOID').Value    := wCptoPer;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').Value  := wCtaPer;
           DMTE.cdsCntCaja.FieldByName('CCOSID').Value    := wCCosDif;
           DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Diferencia de Cambio';
         end
        else
         begin
           DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
           DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Diferencia de Cambio';
         end;
      end
    end;
end;

procedure TFPagoFacturasCobrar.Contab_DifCamDocPago2;
var
 xsql,xsql1 : string;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   //08/05/2001 - pjsv
   // se valida por sugerencia de Jorge y Jose, me confirmaron que por el tipo
  // de moneda de la cabecera, para que no genere <> de cambio cuando es local
   xsql := 'TMONID='+quotedstr(dblcTMon.Text);
   If (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') or
      (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then
    begin
     if DMTE.cdsDocPago.FieldByName('DETCDOC').Value <> DMTE.cdsDocPago.FieldByName('DETCPAG').Value then
     begin
        DMTE.cdsCntCaja.Insert;
        DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
        DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
        DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
        DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
        DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsDocPago.FieldByName('DOCID2').Value;
        DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  :=  'CXP';
        DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
        DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
        DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  DMTE.cdsDocPago.FieldByName('CUENTAID').Value;
        DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera

        DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsDocPago.FieldByName('DETCDOC').Value;

        DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
        DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
        DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
        DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
        DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;

        xNReg:=xNReg+1;
        DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

        DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
        DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
        DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
        DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
        DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
        if xMONID_PROV = DMTE.wTMonExt then
        begin
           DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat*DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
           DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
           DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
           DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Diferencia de Cambio';
        end;

        DMTE.cdsCntCaja.Insert;
        DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
        DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
        DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
        DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
        DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsDocPago.FieldByName('DOCID2').Value;
        DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  :=  'CXP';
        DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
        DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
        DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  DMTE.cdsDocPago.FieldByName('CUENTAID').Value;
        DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera

        DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsDocPago.FieldByName('DETCDOC').Value;

        DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
        DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
        DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
        DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
        DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;

        DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
        DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
        DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
        DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
        DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
        if xMONID_PROV = DMTE.wTMonExt then
        begin
           DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value   := DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat*DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
           DMTE.cdsCntCaja.FieldByName('DCDH').Value      := 'D';
           DMTE.cdsCntCaja.FieldByName('CPTOID').Value    := wCptoPer;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').Value  := wCtaPer;
           DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Diferencia de Cambio';
        end;

     end
    end;
end;


{******************************************************************************}
procedure TFPagoFacturasCobrar.Contab_DifCamRegCxP;
var
 xDif_Camb : real;
 xSql : String;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   //08/05/2001 - pjsv
   // se valida por sugerencia de Jorge y Jose, me confirmaron que por el tipo
  // de moneda de la cabecera, para que no genere <> de cambio cuando es local
   xsql := 'TMONID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('TMONID').AsString);
	 If DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L' then
    begin
     if DMTE.cdsRegCxP.FieldByName('DETCDOC').Value <> DMTE.cdsRegCxP.FieldByName('DETCPAG').Value then
      begin
        DMTE.cdsCntCaja.Insert;
        DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsRegCxP.FieldByName('CIAID').Value;
        DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
        DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
        DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
        DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
        DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  :=  'CXP';
        DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsRegCxP.FieldByName('CPSERIE').Value;
        DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsRegCxP.FieldByName('CPNODOC').Value;
        DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('CCOSID').Value  :=  DMTE.cdsRegCxP.FieldByName('CCOSID').Value;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
        DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
        DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
        DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
        DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
        DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
        DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
        DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
        DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
        DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
        DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

        xNReg:=xNReg+1;
        DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;

        if DMTE.cdsRegCxP.FieldByName('TMONID').Value=DMTE.wtMonLoc then
         begin   //Provision en Mon.Local
           xDif_Camb:= abs(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value / DMTE.cdsRegCxP.FieldByName('DETCDOC').Value -
                           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value / DMTE.cdsRegCxP.FieldByName('DETCPAG').Value);//En Mon.Ext.
           DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := xDif_Camb;

           if DMTE.cdsRegCxP.FieldByName('DETCDOC').Value > DMTE.cdsRegCxP.FieldByName('DETCPAG').Value then
              DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D'
           else
              DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
         end
        else
         begin                                            //Provision en Mon.Ext.
           xDif_Camb:= abs(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value * DMTE.cdsRegCxP.FieldByName('DETCDOC').Value -
                           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value * DMTE.cdsRegCxP.FieldByName('DETCPAG').Value);//En Mon.Local
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := xDif_Camb;
           if DMTE.cdsRegCxP.FieldByName('DETCDOC').Value > DMTE.cdsRegCxP.FieldByName('DETCPAG').Value then
              DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H'
           else
              DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
         end;
        if DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'D' then
         begin
           DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoPer;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaPer;
           DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Diferencia de Cambio';
         end
        else
         begin
           DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
           DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Diferencia de Cambio';
         end;
       //** 28/12/2001 - PJSV
       if DMTE.cdsCntCaja.FieldByName('DCDH').asString = 'D'  then
        begin
         if DMTE.cdsCntCaja.fieldbyname('TMONID').Value= DMTE.wtMonLoc then
          DMTE.cdsCntCaja.fieldbyName('DEBE').asFloat  := DMTE.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
         else
          DMTE.cdsCntCaja.fieldbyName('DEBE').asFloat  := DMTE.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
        end
       else
        begin
         if DMTE.cdsCntCaja.fieldbyname('TMONID').Value= DMTE.wtMonLoc then
          DMTE.cdsCntCaja.fieldbyName('HABER').asFloat := DMTE.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
         else
          DMTE.cdsCntCaja.fieldbyName('HABER').asFloat := DMTE.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
        end;
       //**
      end;
    end;
end;


procedure TFPagoFacturasCobrar.Contab_DifCamRegCxP2;
var
   xsql : string;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   //08/05/2001 - pjsv
   // se valida por sugerencia de Jorge y Jose, me confirmaron que por el tipo
  // de moneda de la cabecera, para que no genere <> de cambio cuando es local
   xsql := 'TMONID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('TMONID').AsString);
   If DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L' then
    begin
     if DMTE.cdsRegCxP.FieldByName('DETCDOC').Value <> DMTE.cdsRegCxP.FieldByName('DETCPAG').Value then begin
        DMTE.cdsCntCaja.Insert;
        DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsRegCxP.FieldByName('CIAID').Value;
        DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
        DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
        DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
        DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
        DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  :=  'CXP';
        DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsRegCxP.FieldByName('CPSERIE').Value;
        DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsRegCxP.FieldByName('CPNODOC').Value;
        DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('CCOSID').Value  :=  DMTE.cdsRegCxP.FieldByName('CCOSID').Value;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
        DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
        DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
        DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
        DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
        DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
        DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
        DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
        DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
        DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
        DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

        xNReg:=xNReg+1;
        DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

        if DMTE.cdsRegCxP.FieldByName('TMONID').Value=DMTE.wtMonExt then begin   //Provision en Mon.Local
           DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value*DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
           DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'H';
           DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
           DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Diferencia de Cambio';
        end;

        
        DMTE.cdsCntCaja.Insert;
        DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsRegCxP.FieldByName('CIAID').Value;
        DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
        DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
        DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
        DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
        DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  :=  'CXP';
        DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsRegCxP.FieldByName('CPSERIE').Value;
        DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsRegCxP.FieldByName('CPNODOC').Value;
        DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('CCOSID').Value  :=  DMTE.cdsRegCxP.FieldByName('CCOSID').Value;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
        DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
        DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
        DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
        DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
        DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
        DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
        DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
        DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
        DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
        DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

        if DMTE.cdsRegCxP.FieldByName('TMONID').Value=DMTE.wtMonExt then begin   //Provision en Mon.Local
           DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value * DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
           DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'D';
           DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoPer;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaPer;
           DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Diferencia de Cambio';
        end;

     end;
    end;
end;

{******************************************************************************}
procedure TFPagoFacturasCobrar.Contabiliza;
var
   xRegAct : TBookMark;
   xSQL    : String;
   bLetra:boolean;
   xMtoRetL,xMtoRetE:double;
   xMtoRetLH,xMtoRetEH:double;
   
begin
   xsql:='DELETE FROM CAJA304 '
        +'WHERE CIAID='   +quotedstr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)   +' AND '
        +      'ECANOMM=' +quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) +' AND '
        +      'TDIARID=' +quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) +' AND '
        +      'ECNOCOMP='+quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   try
			DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;

   xNReg:=0;
   xSQL :='Select * from CAJA304 Where CIAID='''' and '
         +  'ECANOMM='''' and TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsCNTCaja.Close;
   DMTE.cdsCNTCaja.DataRequest( xSQL );
   DMTE.cdsCNTCaja.Open;

   // GENERA LOS REGISTROS DE "DEBE" Y LOS REGISTROS POR DIF. DE CAMBIO desde Docs Pago
   DMTE.cdsDocPago.DisableControls;
   xRegAct := DMTE.cdsDocPago.GetBookmark;
   DMTE.cdsDocPago.First ;
   while not DMTE.cdsDocPago.Eof do
   begin
     if DMTE.sLet=DMTE.cdsDocPago.FieldByName('DOCID2').AsString then
       bLetra:=True;

     DMTE.cdsCntCaja.Insert;
     Contab_DocPago;
     DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
     if DMTE.wTipoDif='' then
     begin
       DMTE.cdsCntCaja.Insert;
       Contab_DifCamDocPago;
       DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
     end
     else
     begin
       if DMTE.cdsDocPago.FieldByname('TMONID').AsString=DMTE.wTMonExt then
       begin
         DMTE.cdsCntCaja.Insert;
         Contab_DifCamDocPago2;
         DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
       end;
     end;
     DMTE.cdsDocPago.Next;
   end;
   DMTE.cdsDocPago.GotoBookmark(xRegAct);
   DMTE.cdsDocPago.FreeBookmark(xRegAct);
   DMTE.cdsDocPago.EnableControls;

   // GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde Docs Registro
   DMTE.cdsRegCxP.DisableControls;
   xRegAct := DMTE.cdsRegCxP.GetBookmark;
   DMTE.cdsRegCxP.First ;
   while not DMTE.cdsRegCxP.Eof do
   begin
     DMTE.cdsCntCaja.Insert;
     Contab_RegCxP;
     DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
     if DMTE.wTipoDif='' then
     begin
        DMTE.cdsCntCaja.Insert;
        Contab_DifCamRegCxP;
        DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
     end
     else
     begin
       if DMTE.cdsRegCxP.FieldByname('TMONID').AsString=DMTE.wTMonExt then
       begin
         DMTE.cdsCntCaja.Insert;
         Contab_DifCamRegCxP2;
         DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
       end;
     end;
     DMTE.cdsRegCxP.Next;
   end;
   DMTE.cdsRegCxP.GotoBookmark(xRegAct);
   DMTE.cdsRegCxP.FreeBookmark(xRegAct);
   DMTE.cdsRegCxP.EnableControls;



   //REGISTROS PARA LAS CUENTAS DE RETENCION PARA EL DEBE Y HABER
   DMTE.cdsDocPago.First;

   Contab_DocPago_RETENCION_HABER;
   DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
   if DMTE.wTipoDif='' then
   begin
      DMTE.cdsCntCaja.Insert;
      Contab_DifCamDocPago_Retencion;
      DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
   end
   else
   begin
      if DMTE.cdsDocPago.FieldByname('TMONID').AsString=DMTE.wTMonExt then
      begin
         DMTE.cdsCntCaja.Insert;
         Contab_DifCamDocPago2;
         DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
      end;
   end;

   if bLetra then
   begin
     xMtoRetL:=0;
     xMtoRetE:=0;
     xMtoRetLH:=0;
     xMtoRetEH:=0;

     DMTE.cdsDocPago.DisableControls;
     DMTE.cdsDocPago.First;
     while not DMTE.cdsDocPago.EOF do
     begin
       xSQL  :=' CIAID='''   +DMTE.cdsDocPago.fieldbyname('CIAID').AsString   +''' and '
              +' CPANOMES='''+DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString +''' and '
              +' TDIARID=''' +DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString+''' and '
              +' CPNOREG=''' +DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString +''' '  ;

       if DMTE.RecuperarDatos( 'CXP301' , 'TMONID,TCANJEID,CPNOGRAV,CPGRAVAD,PROVDES,CPTCAMPR,CPTCAMPR' , xSQL ) then
       begin
         if DMTE.wTMonLoc=DMTE.cdsRec.FieldByName('TMONID').AsString then
         begin
           xMtoRetL:=DMTE.FRound(xMtoRetL+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2);
           xMtoRetE:=DMTE.FRound(xMtoRetE+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat/DMTE.cdsRec.FieldByName('CPTCAMPR').AsFloat,15,2);
           xMtoRetLH:=DMTE.FRound(xMtoRetLH+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2);
           xMtoRetEH:=DMTE.FRound(xMtoRetEH+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat/StrToFloat(dbeTCambio.text),15,2);
         end
         else
         begin
           xMtoRetE:=DMTE.FRound(xMtoRetE+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2);
           xMtoRetL:=DMTE.FRound(xMtoRetL+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat*DMTE.cdsRec.FieldByName('CPTCAMPR').AsFloat,15,2);
           xMtoRetEH:=DMTE.FRound(xMtoRetEH+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2);
           xMtoRetLH:=DMTE.FRound(xMtoRetLH+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat*StrToFloat(dbeTCambio.text),15,2);
         end;
       end
       else
          Showmessage('Error en la recuperación del documento - WMC');
      DMTE.cdsDocPago.Next;
     end;

     DMTE.cdsDocPago.EnableControls;
     if xMtoRetL>0 then
     begin
       DMTE.cdsCntCaja.Insert;
       if dblcTMon.text=DMTE.wTMonLoc then
         Contab_DocPago_RETENCION_DEBE(xMtoRetL,xMtoRetE,xMtoRetL)
       else
         Contab_DocPago_RETENCION_DEBE(xMtoRetL,xMtoRetE,xMtoRetE);

       DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
       if DMTE.wTipoDif='' then
       begin
         DMTE.cdsCntCaja.Insert;
         Contab_DifCamDocPago_Retencion;
         DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
       end
       else
       begin
         if DMTE.cdsDocPago.FieldByname('TMONID').AsString=DMTE.wTMonExt then
         begin
            DMTE.cdsCntCaja.Insert;
            Contab_DifCamDocPago2;
            DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
         end;
       end;
     end;
   end;


   // pago
   DMTE.cdsCntCaja.Insert;
   Contab_Haber;
   DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');

   // Cuadra Movimiento en Dolares
   xDebeT :=0;  xHabeT :=0;
   xDebeTD:=0;  xHabeTD:=0;
   DMTE.cdsCntCaja.First;
   while not DMTE.cdsCntCaja.Eof do
   begin
      if DMTE.cdsCntCaja.FieldByname('DCDH').AsString='D' then
         if DMTE.cdsCntCaja.FieldByname('DCMTOLO').Value <> null then
         begin
            xDebeT :=xDebeT +DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat;
            xDebeTD:=xDebeTD+DMTE.cdsCntCaja.FieldByname('DCMTOEXT').AsFloat;
         end
         else
         begin
            xDebeT:=xDebeT
         end
      else
      begin
         if DMTE.cdsCntCaja.FieldByname('DCMTOLO').Value <> null then begin
            xHabeT :=xHabeT +DMTE.cdsCntCaja.FieldByname('DCMTOLO').Value;
            xHabeTD:=xHabeTD+DMTE.cdsCntCaja.FieldByname('DCMTOEXT').Value;
         end
         else
         begin
            xHabeT:=xHabeT;
         end;
      end;
      DMTE.cdsCntCaja.Next;
   end;


   xDebeT :=0;  xHabeT :=0;
   xDebeTD:=0;  xHabeTD:=0;
   DMTE.cdsCntCaja.First;
   while not DMTE.cdsCntCaja.Eof do begin
      if DMTE.cdsCntCaja.FieldByname('DCDH').AsString='D' then
         if DMTE.cdsCntCaja.FieldByname('DCMTOLO').Value <> null then begin
						xDebeT :=xDebeT +DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat,15,2);
						xDebeTD:=xDebeTD+DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOEXT').AsFloat,15,2);
				 end
				 else begin
						xDebeT:=xDebeT
				 end
			else begin
				 if DMTE.cdsCntCaja.FieldByname('DCMTOLO').Value <> null then begin
						xHabeT :=xHabeT +DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat,15,2);
						xHabeTD:=xHabeTD+DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOEXT').AsFloat,15,2);
				 end
				 else begin
						xHabeT:=xHabeT;
				 end;
			end;
			DMTE.cdsCntCaja.Next;
	 end;

	 if ( DMTE.FRound(xDebeT,15,2) <>DMTE.FRound(xHabeT,15,2 ) ) {or ( DMTE.FRound(xDebeTD,15,2)<>DMTE.FRound(xHabeTD,15,2) ) } then
	 begin
			DMTE.cdsCntCaja.Insert;
			AsientoDifTotal;
			DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
	 end;
end;


procedure TFPagoFacturasCobrar.AsientoDifTotal;
var
 xsql : string;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   DMTE.cdsCntCaja.Insert;
   DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
   DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsString := dbeTCambio.Text ;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsString := dbeTCambio.Text ;
   DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
   DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
   DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
   DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
   DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
   DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;

   DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
   DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
   DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
   DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
   xNReg:=xNReg+1;
   DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;

   if ( DMTE.FRound(xDebeT,15,2)<>DMTE.FRound(xHabeT,15,2) ) then
   begin
      if xDebeT>xHabeT then
      begin
				 DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := abs(DMTE.FRound(xDebeT-xHabeT,15,2));
				 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat:= 0;
				 DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
				 DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
				 DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
				 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Dif.Camb. Total';
			end
			else begin
				 DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := abs(DMTE.FRound(xHabeT-xDebeT,15,2));
				 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat:= 0;
				 DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
				 DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoPer;
				 DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaPer;
				 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Dif.Camb. Total';
			end;
	 end;

	 if ( DMTE.FRound(xDebeTD,15,2)<>DMTE.FRound(xHabeTD,15,2) ) then
   begin
      if xDebeTD>xHabeTD then
      begin
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value   := 0;
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value  := abs(xDebeTD-xHabeTD);
         DMTE.cdsCntCaja.FieldByName('DCDH').Value      := 'H';
         DMTE.cdsCntCaja.FieldByName('CPTOID').Value    := wCptoGan;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').Value  := wCtaGan;
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Dif.Camb. Total';
      end
      else begin
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := 0;
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= abs(xHabeTD-xDebeTD);
         DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
         DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoPer;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaPer;
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Dif.Camb. Total';
      end;
   end;
end;


{******************************************************************************}
procedure TFPagoFacturasCobrar.z2bbtnContClick(Sender: TObject);
var
   xSQL : string;
begin
   if DMTE.cdsEgrCaja.fieldbyname('ECESTADO').AsString = 'C' then
   //**
   begin
     if DMTE.cdsEgrCaja.fieldbyname('FEXTCHQ').AsString = '1' then
     begin
        ShowMessage('No Puede Contabilizar este Movimiento ' + #13 +
                    'Pues se encuentra extornado') ;
        Exit ;
     end ;
     //** 12/09/2001 - pjsv
     If DMTE.MesCerrado(copy(edtPeriodo.text,5,2),copy(edtPeriodo.text,1,4),dblcCia.text) then
     begin
       ShowMessage(' Mes cerrado, no se puede contabilizar');
       exit;
     end;
     //**

     if MessageDlg('¿Contabilizar y Generar Asientos Automaticos?',mtConfirmation,
                  [mbYes, mbNo], 0)=mrYes then
     begin
        screen.Cursor := crHourGlass ;
        RecCptosDifC ;


        Contabiliza;

        ActualizaCNT311(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
                        DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                        DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                        DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString);

        if SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
                    DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                    DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                    DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                    DMTE.SRV_D, 'CCNA', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                    DMTE.cdsResultSet, DMTE.DCOM1, Self ) then
        begin
           DMTE.cdsEgrCaja.Edit;
           DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString := 'S' ;   //Establece como Contabilizado el flag
           DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString:= 'C';
           DMTE.cdsEgrCaja.FieldByName('ECUSER').Value     := DMTE.wUsuario;
           DMTE.cdsEgrCaja.FieldByName('ECFREG').Value     := DateS;
           DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;
           if Copy(xRegAdicional,1,2)='1.' then
              DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString:=xRegAdicional;

           xSQL:='Select * from CAJA302 '
                +'Where CIAID='''   +dblcCia.Text    +''' and '
                +      'ECANOMM=''' +edtPeriodo.Text +''' and '
                +      'TDIARID=''' +dblcTDiario.Text+''' and '
                +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
           DMTE.cdsEgrCaja.DataRequest( xSQL );
           DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');
        end;

        z2bbtnCont.Enabled := False ;
        lblEstado.Caption  :='Cancelado y Contab.' ;
        screen.Cursor := crDefault ;
     end;
   end
   else
   begin
      ShowMessage('Imposible Contabilizar');
   end;
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.z2bbtnAnulaClick(Sender: TObject);
var
   xSQL : String;
begin
	 if MessageDlg('¿Anular Comprobante?',mtConfirmation,
								[mbYes, mbNo], 0)=mrYes then
	 begin


			if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='I' then
				 RetornaSaldosMovCxP;

			if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='C' then
			begin
				 RetornaSaldosMovCxPPagados;
				 if DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString='S' THEN
					  DMTE.AnulaRetencion;
			end;

			DMTE.cdsEgrCaja.CancelUpdates;
			DMTE.cdsRegCxP.CancelUpdates;
			DMTE.cdsDocPago.CancelUpdates;

			DMTE.cdsEgrCaja.edit;
			DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value   :='A';
			DMTE.cdsEgrCaja.FieldByName('ECUSER').Value     := DMTE.wUsuario; // usuario que registra
			DMTE.cdsEgrCaja.FieldByName('ECFREG').Value     := DateS;         // fecha que registra Usuario
			DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;         // Hora de Registro de Usuario

			xSQL:='Select * from CAJA302 '
					 +'Where CIAID='''   +dblcCia.Text    +''' and '
					 +      'ECANOMM=''' +edtPeriodo.Text +''' and '
					 +      'TDIARID=''' +dblcTDiario.Text+''' and '
					 +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
			DMTE.cdsEgrCaja.DataRequest( xSQL );

			DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

			dbgPendientes.ReadOnly :=True;
			dbgDocPago.ReadOnly    :=True;
			dbgOtros.ReadOnly      :=True;

			z2bbtnNuevo.Enabled    := True;
			z2bbtnCont.Enabled     := False;
			z2bbtnSube.Enabled     := False;
			z2bbtnGraba.Enabled    := False;
			z2bbtnCancelado.Enabled:= False;
			z2bbtnCancel2.Enabled  := False;
      z2bbtnAnula.Enabled    := False;
      dbgOtrosIButton.Enabled  := False ;
      lblEstado.Caption    :='Anulado            ';
   end;
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.ActPnlBotones;
begin
//   z2bbtnSumat.Enabled    := wbSumat;
   z2bbtnCont.Enabled     := wbCont;
   z2bbtnNuevo.Enabled    := wbNuevo;
   z2bbtnImprime.Enabled  := wbImprime;
   z2bbtnSube.Enabled     := wbSube;
   z2bbtnGraba.Enabled    := wbGraba;
   z2bbtnCancelado.Enabled:= wbCancelado;
   z2bbtnCancel2.Enabled  := wbCancel2;
   z2bbtnAnula.Enabled    := wbAnula;
//2510   Z2bbtnEmiChq.enabled   := wbChq  ;
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.FormClose(Sender: TObject; var Action: TCloseAction);
var
   xSQL:string;
begin
   if pnlActualiza.Visible then
   begin
      z2bbtnCancel3.SetFocus ;
      z2bbtnCancel3Click(nil) ;
   end ;

   // Limpiamos los filtros
   with DMTE do
   begin
      cdsRegCxP.Filtered   :=False;
      cdsMovCxC.Filtered   :=False;
      cdsCntCaja.Filtered  :=False;
      if cdsEgrCaja.active then
         cdsEgrCaja.CancelUpdates;
      if cdsRegCxP.Active then
         cdsRegCxP.CancelUpdates;
      if cdsMovCxC.active then
      begin
         cdsMovCxC.CancelUpdates;
         cdsMovCxC.close ;

      end ;
      if cdsDocPago.Active then
         cdsDocPago.CancelUpdates;

        cf1.QuitarExits(self) ;
   end ;
   edtCuenta.Enabled := False ;

   Limpiapnlaux;
   //
   if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='X' then
   begin
    DMTE.cdsEgrCaja.Delete;
    xSQL:='Select * from CAJA302 '
    			+'Where CIAID='''   +dblcCia.Text    +''' and '
    			+      'ECANOMM=''' +edtPeriodo.Text +''' and '
    			+      'TDIARID=''' +dblcTDiario.Text+''' and '
    			+      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
    DMTE.cdsEgrCaja.DataRequest( xSQL );
    DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');
   end;

   FVariables.w_Num_Formas:=FVariables.w_Num_Formas-1;
   Action:=caFree;
end;

{******************************************************************************}
procedure TFPagoFacturasCobrar.IniciaPanel;
begin
   dbeSerie.Text     := '000';
   dblcTDoc2.Text    := '';
   dbeNoDoc2.Text    := '';
   dblcdCnp2.Text    := '';
   dbeDH.Text        := '';
   dblcdCCosto.Text  := '';
   dblcdCCosto.Text  := '';
   dblcTMon2.Text    := '';
   dbeImporte2.Text  := '';
   dbeTCamDoc.Text   := '';
   dbdtpFEmis2.Date  := 0;
   dbdtpFVcto2.Date  := 0;

   edtCuenta2.Text   := '';
   edtMtoLoc.Text    := '';
   edtMtoExt.Text    := '';
   edtTDoc2.Text     := '';
   edtCnp2.Text      := '';
   edtTMon2.Text     := '';
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.dbgOtrosIButtonClick(Sender: TObject);
begin
     inhabilitarpaneles;
     AdicionarRegistros;
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.dbgOtrosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (dbgOtrosIButton.Enabled) and (key = VK_DELETE) and (ssCtrl in Shift) then
   begin
      if (DMTE.cdsRegCxP.RecordCount=0) then
          ShowMessage('No hay registros')
       else
       begin
          if MessageDlg('¿Eliminar Registro?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
          begin
             DMTE.cdsRegCxP.Delete;    // Borro en el original..
             z2bbtnSumatClick(sender);    // Al salir hay que totalizar
         end;
      end;
   end;
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.dbdtpFComp2Exit(Sender: TObject);
begin
   DMTE.cdsRegCxP.FieldByName('CPANOMM').Value:=copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value),7,4)
                              +copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value),4,2);
end;

{******************************************************************************}
procedure TFPagoFacturasCobrar.z2bbtnSumatClick(Sender: TObject);
Var
   xRegAct : TBookMark;
   xMtoLoc, xMtoExt: double;
begin
   with DMTE Do
   Begin
      cdsRegCxP.DisableControls;
      xRegAct := cdsRegCxP.GetBookmark;
      xMtoLoc := 0;
      xMtoExt := 0;
      cdsRegCxP.First ;
      While not cdsRegCxP.Eof do
      Begin
         if cdsRegCxP.FieldByName('DEDH').Value='D' then
         begin
           xMtoLoc:=xMtoLoc + strtocurr( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) );
           xMtoExt:=xMtoExt + strToCurr( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) );
         end
         else begin
           xMtoLoc:=xMtoLoc - strToCurr( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) );
           xMtoExt:=xMtoExt - strToCurr( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) );
         end;
         cdsRegCxP.Next;
      end;
      dbgOtros.ColumnByName('DEMTOLOC').FooterValue:=floattostrf(xMtoLoc, ffFixed, 10, 2);
      dbgOtros.ColumnByName('DEMTOEXT').FooterValue:=floattostrf(xMtoExt, ffFixed, 10, 2);

      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);
      cdsRegCxP.EnableControls;
   end;
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.dbgDocPagoDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   If (not dbgDocPago.Readonly) then
      Accept:=True;
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.dbgDocPagoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   If (not dbgDocPago.Readonly) then
      dbgDocPago.BeginDrag(False);
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.dbgDocPagoEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   If (not dbgDocPago.Readonly) and (Target=dbgpendientes) Then
   begin
      DMTE.cdsMovCxC.Filtered:=False;

      {if DMTE.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                       VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID').AsString,
                                   DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
                                   DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
                                   DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),[]) then
      begin
         DMTE.cdsMovCxP.Edit ;
         DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.cdsMovCxP.FieldByName('CPMTOEXT').Value - DMTE.NumeroNoNulo( DMTE.cdsMovCxP.FieldByName('CPPAGEXT') ) ;
         DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.cdsMovCxP.FieldByName('CPMTOLOC').Value - DMTE.NumeroNoNulo( DMTE.cdsMovCxP.FieldByName('CPPAGLOC') ) ;
         if DMTE.cdsMovCxP.FieldByName('TMONID').Value=DMTE.wTMonLoc then
            DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat
         else
            DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat ;
         DMTE.cdsMovCxP.Post ;

         DMTE.cdsDocPago.Delete;

         dbgPendientes.RefreshDisplay;
         dbgDocPago.RefreshDisplay;
      end;}
      //////////////////////////////////
      if DMTE.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
                       VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID').AsString,
                                   DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
                                   DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
                                   DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),[]) then
      begin
         DMTE.cdsMovCxC.Edit ;
         DMTE.cdsMovCxC.FieldByName('CCSALEXT').Value := DMTE.cdsMovCxC.FieldByName('CCMTOEXT').Value - DMTE.NumeroNoNulo( DMTE.cdsMovCxC.FieldByName('CCPAGEXT') ) ;
         DMTE.cdsMovCxC.FieldByName('CCSALLOC').Value := DMTE.cdsMovCxC.FieldByName('CCMTOLOC').Value - DMTE.NumeroNoNulo( DMTE.cdsMovCxC.FieldByName('CCPAGLOC') ) ;
         if DMTE.cdsMovCxC.FieldByName('TMONID').Value=DMTE.wTMonLoc then
            DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat := DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat
         else
            DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat := DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat ;
         DMTE.cdsMovCxC.Post ;

         DMTE.cdsDocPago.Delete;

         dbgPendientes.RefreshDisplay;
         dbgDocPago.RefreshDisplay;
      end;

      /////////////////////////////////
      //DMTE.cdsMovCxP.Filtered:=True;
      DMTE.cdsMovCxC.Filtered:=True;
      wmodifica:=True;
      z2bbtnSumatDocPagoClick(nil) ;
   end;
end;
{******************************************************************************}
Procedure TFPagoFacturasCobrar.LimpiaFiltros;
begin
   // Limpiando filtros si lo tuvieran
   DMTE.cdsMovCxC.Filtered  :=False;
   DMTE.cdsCntCaja.Filtered :=False;
   DMTE.cdsRegCxP.Filtered  :=False;
end;

{******************************************************************************}
{*********************** PROCEDIMIENTOS ADICIONALES   *************************}
procedure TFPagoFacturasCobrar.ActivaFiltro(xName:string);
var
   xFiltro ,
   xWhere : String ;
	 sDocumentos,xSQL   : String ;
begin
    xName := uppercase(xName);

    if xName='REGCXP' then
		begin
				 DMTE.cdsQry.Close;
				 DMTE.cdsQry.DataRequest('SELECT DOCID FROM TGE110 WHERE (DOCMOD=''CAJA'' OR DOCMOD=''CXC'') AND DOCRESTA=''S''');
				 DMTE.cdsQry.Open;
				 DMTE.cdsQry.First;
				// vhn 22/01/2001
				xSQL:='Select * from CAJA301 '
						 +'Where CIAID='''   +dblcCia.Text     +''' and '
						 +      'ECANOMM=''' +edtPeriodo.Text  +''' and '
						 +      'TDIARID=''' +dblcTDiario.Text +''' and '
						 +      'ECNOCOMP='''+dbeNoComp.Text   +''' ';
				DMTE.cdsRegCxP.Close;
				DMTE.cdsRegCxP.DataRequest( xSQL );
				DMTE.cdsRegCxP.Open;
		end;

		if xName='DOCPAGO' then
		begin
			 // vhn 22/01/2001
			 xSQL:='Select * from CAJA303 '
						+'Where CIAID='''   +dblcCia.Text    +''' and '
						+      'ECANOMM=''' +edtPeriodo.Text +''' and '
						+      'TDIARID=''' +dblcTDiario.Text+''' and '
						+      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
			 DMTE.cdsDocPago.Close;
			 DMTE.cdsDocPago.DataRequest( xSQL );
			 DMTE.cdsDocPago.Open;
		end;

		if xName='MOVCXP' then
		begin
				 sDocumentos:='';
				 if DMTE.cdsQry.RecordCount>0 then
				 begin
					 sDocumentos:=' AND (';
					 while not DMTE.cdsQry.EOF do
					 begin
						 if DMTE.cdsQry.RecordCount=1 then
							 sDocumentos:=sDocumentos+' DOCID<>'+QuotedStr(DMTE.cdsQry.FieldByName('DOCID').AsString)
						 else
						 if DMTE.cdsQry.RecNo=DMTE.cdsQry.RecordCount then
							 sDocumentos:=sDocumentos+' DOCID<>'+QuotedStr(DMTE.cdsQry.FieldByName('DOCID').AsString)
						 else
							 sDocumentos:=sDocumentos+' DOCID<>'+QuotedStr(DMTE.cdsQry.FieldByName('DOCID').AsString)+' AND ';
						 DMTE.cdsQry.Next;
					 end;
					 sDocumentos:=sDocumentos+' )';
				 end;


{			 DMTE.cdsMovCxP.Close ;

			 xFiltro :=' CIAID='''   + dblccia.Text   +''' and CPESTADO=''P'' and '
								+' CLAUXID=''' + dblcClase.Text +''' and '
								+' PROV ='''   + dblcdAux.Text  + ''' ' ;

			 xWhere := '('+xFiltro+') OR ( CIAID||CPANOMES||TDIARID||CPNOREG IN ' +
								 '                   ( SELECT CIAID||CPANOMM||TDIARID2||CPNOREG' +
								 '                     FROM CAJA303 ' +
								 '                     WHERE CIAID = '''+ dblcCia.Text    + ''' ' +
								 '                     AND ECANOMM = '''+ edtPeriodo.Text + ''' ' +
								 '                     AND TDIARID = '''+ dblcTDiario.Text+ ''' ' +
								 '                     AND ECNOCOMP= '''+ dbeNoComp.Text  + ''' ) ) ' ;

			 DMTE.cdsMovCxP.Datarequest( 'SELECT * FROM CXP301 WHERE ' + xWhere+sDocumentos ) ;
			 DMTE.cdsMovCxP.Active := True ;
                         DMTE.cdsMovCxP.IndexFieldNames:='CLAUXID;PROV;CPFEMIS';

			 xFiltro:=' (((CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR '+
								'   ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) '  ;

			 DMTE.cdsMovCxP.Filter  := '';
			 DMTE.cdsMovCxP.Filter  := xFiltro ;
			 DMTE.cdsMovCxP.Filtered:= True;}
			 DMTE.cdsMovCxC.Close ;

			 xFiltro :=' CIAID='''   + dblccia.Text   +''' and CCESTADO=''P'' and '
								+' CLAUXID=''' + dblcClase.Text +''' and '
								+' CLIEID ='''   + dblcdAux.Text  + ''' ' ;

			 xWhere := '('+xFiltro+') OR ( CIAID||CCANOMES||TDIARID||CCNOREG IN ' +
								 '                   ( SELECT CIAID||CPANOMM||TDIARID2||CPNOREG' +
								 '                     FROM CAJA303 ' +
								 '                     WHERE CIAID = '''+ dblcCia.Text    + ''' ' +
								 '                     AND ECANOMM = '''+ edtPeriodo.Text + ''' ' +
								 '                     AND TDIARID = '''+ dblcTDiario.Text+ ''' ' +
								 '                     AND ECNOCOMP= '''+ dbeNoComp.Text  + ''' ) ) ' ;

			 DMTE.cdsMovCxC.Datarequest( 'SELECT * FROM CXC301 WHERE ' + xWhere+sDocumentos ) ;
			 DMTE.cdsMovCxC.Active := True ;
                         DMTE.cdsMovCxC.IndexFieldNames:='CLAUXID;PROV;CPFEMIS';

			 xFiltro:=' (((CCMTOORI-CCPAGORI-CCSALORI)> -0.01 and (CCMTOORI-CCPAGORI-CCSALORI) < 0.01 ) OR '+
								'   ( CCMTOORI = CCSALORI ) )  AND ( CCSALORI > 0 ) '  ;

			 DMTE.cdsMovCxC.Filter  := '';
			 DMTE.cdsMovCxC.Filter  := xFiltro ;
			 DMTE.cdsMovCxC.Filtered:= True;



		end;
end;
{******************************************************************************}
Procedure TFPagoFacturasCobrar.CambiaEstado(xName:char);
begin
	 case xName of
		 'I':begin  //Si está INCOMPLETO o PENDIENTE
            lblEstado.Caption    :='Activo             ';
            pnlCabecera1.Enabled := False;
            pnlCabecera2.Enabled := True;
            z2bbtnOk.Enabled       := True;
            z2bbtnCancel.Enabled   := True;

//2804
            dbgPendientes.ReadOnly :=false ;
            dbgDocPago.ReadOnly    :=False ;
            dbgOtros.ReadOnly      :=False ;

//
            wbSumat     := True;
            wbCont      := False;
            wbNuevo     := True;
            wbImprime   := True;
            wbSube      := True;
            wbGraba     := True;
            wbCancelado := True;
            wbCancel2   := True;
            wbAnula     := True;
            wbChq       := True ;
         end;

     'C':begin
            pnlCabecera1.Enabled := False;    // Desactivar Panel1
            pnlCabecera2.Enabled := False;    // Desactivar Panel2
            pnlDetalle.Enabled   := True;     // Activar Panel de Detalle
            pnlBotones.Enabled   := True;     // Activar Panel de Botones

            dbgPendientes.ReadOnly :=True;
            dbgDocPago.ReadOnly    :=True;
            dbgOtros.ReadOnly      :=True;

            z2bbtnOk.Enabled       := False;
            z2bbtnCancel.Enabled   := False;

            if DMTE.cdsEgrCaja.FieldByName('ECConta').Value='S' then
            begin  //Esta contabilizado
               wbCont             := False;
               lblEstado.Caption  :='Cancelado y Contab.';
               wbAnula            := False;
            end
            else
            begin
               wbCont             := True;
               lblEstado.Caption  :='Cancelado          ';
               wbAnula            := True;
            end;
            wbSumat     := False;
            wbNuevo     := True;
            wbImprime   := True;
            wbSube      := False;
            wbGraba     := False;
            wbCancelado := False;
            wbCancel2   := False;
            wbChq       := False ;
         end;

     'A':begin
            lblEstado.Caption     :='Anulado            ';
            pnlCabecera1.Enabled := False;    // Desactivar Panel1
            pnlCabecera2.Enabled := False;    // Desactivar Panel2
            pnlDetalle.Enabled   := True;     // Activar Panel de Detalle
            pnlBotones.Enabled   := True;     // Activar Panel de Botones

            dbgPendientes.ReadOnly :=True;
            dbgDocPago.ReadOnly    :=True;
            dbgOtros.ReadOnly      :=True;
            z2bbtnOk.Enabled        := False;
            z2bbtnCancel.Enabled    := False;

            wbSumat     := False;
            wbCont      := False;
            wbNuevo     := True;
            wbImprime   := True;
            wbSube      := False;
            wbGraba     := False;
            wbCancelado := False;
            wbCancel2   := False;
            wbAnula     := False;
            wbChq       := False ;
         end;

     'N':begin
            lblEstado.Caption:='Nuevo     ';
            pnlCabecera1.Enabled := false;
            pnlCabecera2.Enabled := True;
//2804
            dbgPendientes.ReadOnly := False ;
            dbgDocPago.ReadOnly    := False ;
            dbgOtros.ReadOnly      := False ;

//
            z2bbtnOk.Enabled       := True;
            z2bbtnCancel.Enabled   := True;

            wbSumat     := True;
            wbCont      := False;
            wbImprime   := False;
            wbNuevo     := False;
            wbSube      := True;
            wbGraba     := True;
            wbCancelado := False;
            wbCancel2   := True;
            wbAnula     := False;
            wbChq       := False ;
         end;
   end;
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   if (dbgPendientes.Readonly = False) then
       Accept:=True;
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if (dbgPendientes.Readonly = False) then
      dbgPendientes.BeginDrag(False)  ;
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.dbgPendientesEndDrag(Sender, Target: TObject; X,Y: Integer);
var
   i, xFactor : integer;
   xResta, xWhere : String;
begin
    If (not dbgPendientes.Readonly) and (Target=dbgDocPago) Then
    Begin
       DMTE.cdsMovCxC.DisableControls;
      // Añade los Nuevos Registros
      DMTE.cdsDocPago.DisableControls;
      for i:= 0 to dbgPendientes.SelectedList.Count-1 do
      begin
          dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);

          // VHN  se Añade para saber si documento suma o resta
          xWhere:='DOCID=''' +DMTE.cdsMovCxC.FieldByName('DOCID').AsString+''' and '
                 +'DOCMOD='''+'CXC'+''' ';
		    xResta:=DMTE.DisplayDescrip( 'prvQry2', 'TGE110', 'DOCRESTA', xWhere, 'DOCRESTA' );
          xFactor:=1;
          //if xResta='S' then xFactor:=-1;
          // end vhn

          DMTE.cdsDocPago.Insert;
          DMTE.cdsDocPago.FieldByName('CIAID').Value    := dblcCia.Text;
          DMTE.cdsDocPago.FieldByName('TDIARID').Value  := dblcTDiario.Text;
          DMTE.cdsDocPago.FieldByName('ECANOMM').Value  := edtPeriodo.Text;
          DMTE.cdsDocPago.FieldByName('ECNOCOMP').Value := dbeNoComp.Text;

          ////////////////////////////////////////
          DMTE.cdsDocPago.FieldByName('TDIARID2').Value := DMTE.cdsMovCxC.FieldByName('TDIARID').Value;
          DMTE.cdsDocPago.FieldByName('CPANOMM').Value  := DMTE.cdsMovCxC.FieldByName('CCANOMES').Value;
          DMTE.cdsDocPago.FieldByName('CPNOREG').Value  := DMTE.cdsMovCxC.FieldByName('CCNOREG').Value;
          DMTE.cdsDocPago.FieldByName('DOCID2').Value   := DMTE.cdsMovCxC.FieldByName('DOCID').Value;
          DMTE.cdsDocPago.FieldByName('CPSERIE').Value  := DMTE.cdsMovCxC.FieldByName('CCSERIE').Value;
          DMTE.cdsDocPago.FieldByName('CPNODOC').Value  := DMTE.cdsMovCxC.FieldByName('CCNODOC').Value;
          DMTE.cdsDocPago.FieldByName('TMONID').Value   := DMTE.cdsMovCxC.FieldByName('TMONID').Value;
          DMTE.cdsDocPago.FieldByName('DETCDOC').Value  := DMTE.FRound(DMTE.cdsMovCxC.FieldByName('CCTCAMAJ').Value,8,3);
          DMTE.cdsDocPago.FieldByName('DETCPAG').Value  := DMTE.FRound(strtofloat(dbeTCambio.Text),5,3);
          DMTE.cdsDocPago.FieldByName('CPTOID').Value   := DMTE.cdsMovCxC.FieldByName('CCPTOTOT').Value;
          DMTE.cdsDocPago.FieldByName('CUENTAID').Value := DMTE.cdsMovCxC.FieldByName('CTATOTAL').Value;
          DMTE.cdsDocPago.FieldByName('CPFEMIS').Value  := DMTE.cdsMovCxC.FieldByName('CCFEMIS').Value;
          DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value := DMTE.cdsMovCxC.FieldByName('CCFVCMTO').Value;
          DMTE.cdsDocPago.FieldByName('DEANO').Value    := DMTE.cdsMovCxC.FieldByName('CCAAAA').Value;
          DMTE.cdsDocPago.FieldByName('DEMM').Value     := DMTE.cdsMovCxC.FieldByName('CCMM').Value;
          DMTE.cdsDocPago.FieldByName('DEDD').Value     := DMTE.cdsMovCxC.FieldByName('CCDD').Value;
          DMTE.cdsDocPago.FieldByName('DESS').Value     := DMTE.cdsMovCxC.FieldByName('CCSS').Value;
          DMTE.cdsDocPago.FieldByName('DESEM').Value    := DMTE.cdsMovCxC.FieldByName('CCSem').Value;
          DMTE.cdsDocPago.FieldByName('DETRI').Value    := DMTE.cdsMovCxC.FieldByName('CCTri').Value;
          DMTE.cdsDocPago.FieldByName('DEAASS').Value   := DMTE.cdsMovCxC.FieldByName('CCAASS').Value;
          DMTE.cdsDocPago.FieldByName('DEAASEM').Value  := DMTE.cdsMovCxC.FieldByName('CCAASem').Value;
          DMTE.cdsDocPago.FieldByName('DEAATRI').Value  := DMTE.cdsMovCxC.FieldByName('CCAATri').Value;
          DMTE.cdsDocPago.FieldByName('PROV').Value     := DMTE.cdsMovCxC.FieldByName('CLIEID').Value;
          DMTE.cdsDocPago.FieldByName('PROVDES').AsString  := DMTE.cdsMovCxC.FieldByName('CLIEDES').AsString;
          DMTE.cdsDocPago.FieldByName('PROVRUC').Value  := DMTE.cdsMovCxC.FieldByName('CLIERUC').Value;
          if DMTE.cdsDocPago.FieldByName('TMONID').Value=DMTE.wtMonLoc then
          begin
             DMTE.cdsDocPago.FieldByName('DESALLOC').Value:=DMTE.FRound(DMTE.cdsMovCxC.FieldByName('CCSALLOC').Value*xFactor,15,2);
             DMTE.cdsDocPago.FieldByName('DESALEXT').Value:=DMTE.FRound(DMTE.cdsMovCxC.FieldByName('CCSALLOC').Value
                                          /DMTE.cdsDocPago.FieldByName('DETCPAG').Value*xFactor,15,2);
          end
          else
          begin
             DMTE.cdsDocPago.FieldByName('DESALEXT').Value:=DMTE.FRound(DMTE.cdsMovCxC.FieldByName('CCSALEXT').Value*xFactor,15,2);
             DMTE.cdsDocPago.FieldByName('DESALLOC').Value:=DMTE.FRound(DMTE.cdsMovCxC.FieldByName('CCSALEXT').Value
                                          *DMTE.cdsDocPago.FieldByName('DETCPAG').Value*xFactor,15,2);
          end;

          DMTE.cdsDocPago.FieldByName('DEANTMN').Value  := 0;
          DMTE.cdsDocPago.FieldByName('DEANTME').Value  := 0;
          DMTE.cdsDocPago.FieldByName('DEMTOORI').Value := DMTE.FRound(DMTE.cdsMovCxC.FieldByName('CCMTOORI').Value*xFactor,15,2);
          DMTE.cdsDocPago.FieldByName('DEMTOLOC').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALLOC').Value,15,2);
          DMTE.cdsDocPago.FieldByName('DEMTOEXT').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALEXT').Value,15,2);
          DMTE.cdsDocPago.FieldByName('DEUSER').Value   := DMTE.wUsuario;
          DMTE.cdsDocPago.FieldByName('DEFREG').Value   := dateS;
          DMTE.cdsDocPago.FieldByName('DEHREG').Value   := time;
          DMTE.cdsDocPago.fieldbyname('CLAUXID').AsString := DMTE.cdsMovCxC.FieldByName('CLAUXID').AsString ;
          DMTE.cdsDocPago.Post;

          DMTE.cdsMovCxC.Edit ;
          DMTE.cdsMovCxC.FieldByName('CCSALORI').Value := 0  ;
          DMTE.cdsMovCxC.Post ;

          ///////////////////////////////////////

          dbgPendientes.datasource.dataset.Freebookmark(dbgPendientes.SelectedList.items[i]) ;
      end ; // for

//      DMTE.cdsMovCxP.EnableControls  ;
      DMTE.cdsMovCxC.EnableControls  ;
      dbgPendientes.SelectedList.clear ;  { Clear selected record list since they are all deleted}
      dbgPendientes.RefreshDisplay  ;
      dbgDocPago.RefreshDisplay     ;
      DMTE.cdsDocPago.EnableControls ;
      z2bbtnSumatDocPagoClick(nil) ;
      wmodifica:=True;
   end; // target
end;

procedure TFPagoFacturasCobrar.dbgDocPagoColExit(Sender: TObject);
begin
   z2bbtnSumatDocPagoClick(nil) ;
   dbgDocPago.RefreshDisplay;
end;

{******************************************************************************}

procedure TFPagoFacturasCobrar.ActSaldosMovCxP;
var
   xRegAct : TBookMark;
   xAdicional : Double ;
   xMontoL,xMontoE : String;
   xLoc,xExt,xOri,xcia,xtdia,xperio,ssql,xnreg   : String ;
begin
{   	 with DMTE do
   	 begin
   			cdsMovCxP.DisableControls;
   			cdsMovCxP.Filtered:=False;
   			cdsDocPago.DisableControls;
   			xRegAct := cdsDocPago.GetBookmark;
   			cdsDocPago.First;
   			While not cdsDocPago.Eof do
   			Begin
   				if DMTE.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
   																VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID').AsString,
   																						DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
   																						DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
   																						DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),
   																[]) then
   				 begin
   					DMTE.cdsMovCxP.edit ;
////////
   					if DMTE.cdsMovCxP.FieldByName('TMONID').Value = wTMonLoc then
   					 begin
   						 xMontoL := FloatToStrF(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat,ffFixed,8,2);
   						 DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat -
   																						DMTE.numerononulo(DMTE.cdsMovCxP.FieldByName('CPPAGLOC'))-
   																						StrToFloat(xMontoL);

   						 DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat ;
   						 //Calculo del otro Saldo
   						 xAdicional := DMTE.FRound(StrToFloat(xMontoL) / DMTE.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2 ) ;
   						 DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat -
   																						DMTE.numerononulo(DMTE.cdsMovCxP.FieldByName('CPPAGEXT'))-
   																						xAdicional ;
   					 end
   					else
   					 begin
   						 xMontoE := FloatToStrF(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat,ffFixed,8,2);
   						 DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat -
   																						DMTE.numerononulo(DMTE.cdsMovCxP.FieldByName('CPPAGEXT'))-
   																						StrToFloat(xMontoE);


   						 DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;
   						 //Calculo del otro Saldo
   						 //** 24/08/2001- pjsv, Por sugerencia de Jose
   						 xAdicional := DMTE.FRound(StrToFloat(xMontoE) * StrToFloat(dbeTCambio.Text),15,2); //DMTE.cdsMovCxpCpTCAMPR.AsFloat ) ;
   						 DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat -
   																						DMTE.numerononulo(DMTE.cdsMovCxP.FieldByName('CPPAGLOC'))-
   																						xAdicional ;
   					 end ;
   					xLoc   := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsString ;
   					xExt   := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsString ;
   					xOri   := DMTE.cdsMovCxP.FieldByName('CPSALORI').AsString ;
   					xcia   := trim(dblccia.text) ;
   					xtdia  := DMTE.cdsMovCxp.fieldbyname('TDIARID').AsString ;
   					xperio := DMTE.cdsMovCxp.fieldbyname('CPANOMES').AsString ;
   					xnreg  := DMTE.cdsMovCxp.fieldbyname('CPNOREG').AsString ;
   					///
   						ssql := 'UPDATE CXP301 SET '+
   										'  CPSALLOC ='+xloc+
   										' ,CPSALEXT ='+xext+
   										' ,CPSALORI ='+xori;
   						ssql := ssql + ' WHERE CIAID='+quotedstr(xcia)+
   													 ' AND TDIARID='+quotedstr(xtdia)+
   													 ' AND CPANOMES='+quotedstr(xperio)+
   													 ' AND CPNOREG='+quotedstr(xnreg);
   					try
   					 //DCOM1.AppServer.EjecutaSQL(ssql);
   					except
   					end;
   					///
   					if DMTE.cdsMovCxP.FieldByName('CPPAGLOC').IsNull then
   						DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := 0 ;
   					if DMTE.cdsMovCxP.FieldByName('CPPAGEXT').IsNull then
   						DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := 0 ;
   					if DMTE.cdsMovCxP.FieldByName('CPPAGORI').IsNull then
   						DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := 0 ;
   					DMTE.cdsMovCxP.post;
                                        DMTE.AplicaDatos(DMTE.cdsMovCxP, 'MOVCXP');
   				 end
   				else Showmessage('No se Actualizó CXP ');
        cdsDocPago.Next;
      end;
      cdsDocPago.GotoBookmark(xRegAct) ;
      cdsDocPago.FreeBookmark(xRegAct) ;
      cdsDocPago.EnableControls        ;
      cdsMovCxP.Filtered:=True         ;
      cdsMovCxP.EnableControls         ;
   end;}
   //////////////////////////////////
   	 with DMTE do
   	 begin
   			cdsMovCxC.DisableControls;
   			cdsMovCxC.Filtered:=False;
   			cdsDocPago.DisableControls;
   			xRegAct := cdsDocPago.GetBookmark;
   			cdsDocPago.First;
   			While not cdsDocPago.Eof do
   			Begin
   				if DMTE.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
   																VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID').AsString,
   																						DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
   																						DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
   																						DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),
   																[]) then
   				 begin
   					DMTE.cdsMovCxC.edit ;
////////
   					if DMTE.cdsMovCxC.FieldByName('TMONID').Value = wTMonLoc then
   					 begin
   						 xMontoL := FloatToStrF(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat,ffFixed,8,2);
   						 DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat := DMTE.cdsMovCxC.FieldByName('CCMTOLOC').AsFloat -
   																						DMTE.numerononulo(DMTE.cdsMovCxC.FieldByName('CCPAGLOC'))-
   																						StrToFloat(xMontoL);

   						 DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat := DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat ;
   						 //Calculo del otro Saldo
   						 xAdicional := DMTE.FRound(StrToFloat(xMontoL) / DMTE.cdsMovCxC.FieldByName('CCTCAMAJ').AsFloat,15,2 ) ;
   						 DMTE.cdsMovCxC.FieldByName('CCSALEXT').Value := DMTE.cdsMovCxC.FieldByName('CCMTOEXT').AsFloat -
   																						DMTE.numerononulo(DMTE.cdsMovCxC.FieldByName('CCPAGEXT'))-
   																						xAdicional ;
   					 end
   					else
   					 begin
   						 xMontoE := FloatToStrF(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat,ffFixed,8,2);
   						 DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat := DMTE.cdsMovCxC.FieldByName('CCMTOEXT').AsFloat -
   																						DMTE.numerononulo(DMTE.cdsMovCxC.FieldByName('CCPAGEXT'))-
   																						StrToFloat(xMontoE);


   						 DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat := DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat;
   						 //Calculo del otro Saldo
   						 //** 24/08/2001- pjsv, Por sugerencia de Jose
   						 xAdicional := DMTE.FRound(StrToFloat(xMontoE) * StrToFloat(dbeTCambio.Text),15,2); //DMTE.cdsMovCxpCpTCAMPR.AsFloat ) ;
   						 DMTE.cdsMovCxC.FieldByName('CCSALLOC').Value := DMTE.cdsMovCxC.FieldByName('CCMTOLOC').AsFloat -
   																						DMTE.numerononulo(DMTE.cdsMovCxC.FieldByName('CCPAGLOC'))-
   																						xAdicional ;
   					 end ;
   					xLoc   := DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsString ;
   					xExt   := DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsString ;
   					xOri   := DMTE.cdsMovCxC.FieldByName('CCSALORI').AsString ;
   					xcia   := trim(dblccia.text) ;
   					xtdia  := DMTE.cdsMovCxC.fieldbyname('TDIARID').AsString ;
   					xperio := DMTE.cdsMovCxC.fieldbyname('CCANOMES').AsString ;
   					xnreg  := DMTE.cdsMovCxC.fieldbyname('CCNOREG').AsString ;
   					///
   						ssql := 'UPDATE CXC301 SET '+
   										'  CCSALLOC ='+xloc+
   										' ,CCSALEXT ='+xext+
   										' ,CCSALORI ='+xori;
   						ssql := ssql + ' WHERE CIAID='+quotedstr(xcia)+
   													 ' AND TDIARID='+quotedstr(xtdia)+
   													 ' AND CCANOMES='+quotedstr(xperio)+
   													 ' AND CCNOREG='+quotedstr(xnreg);
   					try
   					 //DCOM1.AppServer.EjecutaSQL(ssql);
   					except
   					end;
   					///
   					if DMTE.cdsMovCxC.FieldByName('CCPAGLOC').IsNull then
   						DMTE.cdsMovCxC.FieldByName('CCPAGLOC').AsFloat := 0 ;
   					if DMTE.cdsMovCxC.FieldByName('CCPAGEXT').IsNull then
   						DMTE.cdsMovCxC.FieldByName('CCPAGEXT').AsFloat := 0 ;
   					if DMTE.cdsMovCxC.FieldByName('CCPAGORI').IsNull then
   						DMTE.cdsMovCxC.FieldByName('CCPAGORI').AsFloat := 0 ;
   					DMTE.cdsMovCxC.post;
                                        DMTE.AplicaDatos(DMTE.cdsMovCxC, 'MOVCXC');
   				 end
   				else Showmessage('No se Actualizó CXC ');
        cdsDocPago.Next;
      end;
      cdsDocPago.GotoBookmark(xRegAct) ;
      cdsDocPago.FreeBookmark(xRegAct) ;
      cdsDocPago.EnableControls        ;
      cdsMovCxC.Filtered:=True         ;
      cdsMovCxC.EnableControls         ;
   end;

   //////////////////////////////////
end;
{******************************************************************************}
procedure TFPagoFacturasCobrar.ActMovCxP;
var
   xRegAct : TBookMark;
   ssql    : string;
   xtcam, xori, xext, xloc    : string;
   xcia, xtdia, xperio, xnreg : string;
begin
   {with DMTE do
   begin
      cdsMovCxP.Filtered:=False;
      cdsDocPago.DisableControls;
      xRegAct := cdsDocPago.GetBookmark;
      cdsDocPago.First;
      While not cdsDocPago.Eof do
      Begin
        if DMTE.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                                VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID').AsString,
                                            DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
                                            DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
                                            DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),
                                []) then
        begin
           xcia  := DMTE.cdsDocPago.FieldByName('CIAID').AsString;
           xtdia := DMTE.cdsDocPago.FieldByName('TDIARID2').AsString;
           xperio:= DMTE.cdsDocPago.FieldByName('CPANOMM').AsString;
           xnreg := DMTE.cdsDocPago.FieldByName('CPNOREG').AsString;

           DMTE.cdsMovCxP.edit;

           DMTE.cdsMovCxP.fieldbyname('CPPAGLOC').AsFloat :=DMTE.FRound(DMTE.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat - DMTE.cdsMovCxP.fieldbyname('CPSALLOC').AsFloat,15,2);
           xloc := DMTE.cdsMovCxP.fieldbyname('CPPAGLOC').AsString;
           DMTE.cdsMovCxP.fieldbyname('CPPAGEXT').AsFloat :=DMTE.FRound(DMTE.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat - DMTE.cdsMovCxP.fieldbyname('CPSALEXT').AsFloat,15,2);
           xext := DMTE.cdsMovCxP.fieldbyname('CPPAGEXT').AsString;
           if DMTE.cdsMovCxP.FieldByName('TMONID').Value=DMTE.wTMonLoc then
            begin
              DMTE.cdsMovCxP.fieldbyname('CPPAGORI').AsFloat:=DMTE.cdsMovCxP.fieldbyname('CPPAGLOC').AsFloat ;
              xori := DMTE.cdsMovCxP.fieldbyname('CPPAGORI').AsString;
              If DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat <= 0.02 then
                 DMTE.cdsMovCxP.FieldByName('CPESTADO').AsString := 'C' ;
            end
           else
            begin
              DMTE.cdsMovCxP.fieldbyname('CPPAGORI').AsFloat :=DMTE.cdsMovCxP.fieldbyname('CPPAGEXT').AsFloat ;
              xori := DMTE.cdsMovCxP.fieldbyname('CPPAGORI').AsString;
              If DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat <= 0.02 then
                 DMTE.cdsMovCxP.FieldByName('CPESTADO').AsString := 'C' ;
           end ;
           DMTE.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,3) ;
           DMTE.cdsMovCxP.Post;
           DMTE.AplicaDatos(DMTE.cdsMovCxP, 'MOVCXP');

         end
        else
         begin
            ShowMessage('Error :Actualización Mov WMC') ;
         end ;
        cdsDocPago.Next;
      end;

      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);
      cdsDocPago.EnableControls;
      cdsMovCxP.Filtered:=True;
      cdsMovCxP.First;
      cdsMovCxP.EnableControls;
   end;}
   //////////////////////////
   with DMTE do
   begin
      cdsMovCxC.Filtered:=False;
      cdsDocPago.DisableControls;
      xRegAct := cdsDocPago.GetBookmark;
      cdsDocPago.First;
      While not cdsDocPago.Eof do
      Begin
        if DMTE.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
                                VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID').AsString,
                                            DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
                                            DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
                                            DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),
                                []) then
        begin
           xcia  := DMTE.cdsDocPago.FieldByName('CIAID').AsString;
           xtdia := DMTE.cdsDocPago.FieldByName('TDIARID2').AsString;
           xperio:= DMTE.cdsDocPago.FieldByName('CPANOMM').AsString;
           xnreg := DMTE.cdsDocPago.FieldByName('CPNOREG').AsString;

           DMTE.cdsMovCxC.edit;

           DMTE.cdsMovCxC.fieldbyname('CCPAGLOC').AsFloat :=DMTE.FRound(DMTE.cdsMovCxC.fieldbyname('CCMTOLOC').AsFloat - DMTE.cdsMovCxC.fieldbyname('CCSALLOC').AsFloat,15,2);
           xloc := DMTE.cdsMovCxC.fieldbyname('CCPAGLOC').AsString;
           DMTE.cdsMovCxC.fieldbyname('CCPAGEXT').AsFloat :=DMTE.FRound(DMTE.cdsMovCxC.fieldbyname('CCMTOEXT').AsFloat - DMTE.cdsMovCxC.fieldbyname('CCSALEXT').AsFloat,15,2);
           xext := DMTE.cdsMovCxC.fieldbyname('CCPAGEXT').AsString;
           if DMTE.cdsMovCxC.FieldByName('TMONID').Value=DMTE.wTMonLoc then
            begin
              DMTE.cdsMovCxC.fieldbyname('CCPAGORI').AsFloat:=DMTE.cdsMovCxC.fieldbyname('CCPAGLOC').AsFloat ;
              xori := DMTE.cdsMovCxC.fieldbyname('CCPAGORI').AsString;
              If DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat <= 0.02 then
              begin
                 DMTE.cdsMovCxC.FieldByName('CCFCANCEL').AsDateTime  := dbdtpFComp.Date ;
                 DMTE.cdsMovCxC.FieldByName('CCESTADO').AsString := 'C' ;
              end
            end
           else
            begin
              DMTE.cdsMovCxC.fieldbyname('CCPAGORI').AsFloat :=DMTE.cdsMovCxC.fieldbyname('CCPAGEXT').AsFloat ;
              xori := DMTE.cdsMovCxC.fieldbyname('CCPAGORI').AsString;
              If DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat <= 0.02 then
              begin
                 DMTE.cdsMovCxC.FieldByName('CCESTADO').AsString := 'C' ;
                 DMTE.cdsMovCxC.FieldByName('CCFCANCEL').AsDateTime  := dbdtpFComp.Date ;                 
              end
           end ;
           DMTE.cdsMovCxC.FieldByName('CCTCAMPA').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,3) ;
           DMTE.cdsMovCxC.Post;
           DMTE.AplicaDatos(DMTE.cdsMovCxC, 'MOVCXC');

         end
        else
         begin
            ShowMessage('Error :Actualización Mov WMC') ;
         end ;
        cdsDocPago.Next;
      end;

      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);
      cdsDocPago.EnableControls;
      cdsMovCxC.Filtered:=True;
      cdsMovCxC.First;
      cdsMovCxC.EnableControls;
   end;

   //////////////////////////
end;

procedure TFPagoFacturasCobrar.RetornaSaldosMovCxP;
begin
{	 DMTE.cdsMovCxP.DisableControls;
	 DMTE.cdsMovCxP.Filtered:=False;
	 DMTE.cdsDocPago.DisableControls;
	 DMTE.cdsDocPago.First;
	 while not DMTE.cdsDocPago.Eof do
	 begin
       if DMTE.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                     VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID').AsString,
                                 DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
                                 DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
                                 DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),[]) then
       begin
          DMTE.cdsMovCxP.edit;
          if DMTE.cdsEgrCaja.FieldByName('ECEstado').Value='I' then
          begin
             DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat - DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat,15,2);
             DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat - DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat,15,2);
             If DMTE.cdsMovCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
                DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat
             else
                DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat ;
          end;

          DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat  - DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat,15,2  );
          DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat  - DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat,15,2  );
          DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat  - DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat,15,2  );

          DMTE.cdsMovCxP.Post;
          DMTE.cdsMovCxP.Datarequest('SELECT * FROM CXP301 WHERE CIAID='+QuotedStr(dblcCia.text)+' AND CLAUXID='+QuotedStr(dblcClase.text)+' AND PROV='+QuotedStr(dblcdAux.text));
          DMTE.AplicaDatos(DMTE.cdsMovCxP, 'MOVCXP');

          if DMTE.cdsEgrCaja.FieldByName('ECEstado').Value='C' then
          begin
             DMTE.SaldosAuxiliar( DMTE.cdsMovCxP.FieldByName('CIAID').AsString,   DMTE.cdsMovCxP.fieldbyname('CPANOMES').AsString,
                                 DMTE.cdsMovCxP.fieldbyname('CLAUXID').AsString, DMTE.cdsMovCxP.fieldbyname('PROV').AsString, '+',
                                 DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat, DMTE.cdsMovCxP.fieldbyname('DEMTOEXT').AsFloat,
                                 DMTE.cdsMovCxP.fieldbyname('TMONID').AsString);
          end;
// JCC 04/09/2002
//          DMTE.cdsDocPago.Next;
       end;
       DMTE.cdsDocPago.Next;
       DMTE.cdsDocPago.EnableControls;
       DMTE.cdsMovCxP.Filtered:=True;
       DMTE.cdsMovCxP.EnableControls;
   end;}
   /////////////////////////
	 DMTE.cdsMovCxC.DisableControls;
	 DMTE.cdsMovCxC.Filtered:=False;
	 DMTE.cdsDocPago.DisableControls;
	 DMTE.cdsDocPago.First;
	 while not DMTE.cdsDocPago.Eof do
	 begin
       if DMTE.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
                     VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID').AsString,
                                 DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
                                 DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
                                 DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),[]) then
       begin
          DMTE.cdsMovCxC.edit;
          if DMTE.cdsEgrCaja.FieldByName('ECEstado').Value='I' then
          begin
             DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat := DMTE.FRound(DMTE.cdsMovCxC.FieldByName('CCMTOEXT').AsFloat - DMTE.cdsMovCxC.FieldByName('CCPAGEXT').AsFloat,15,2);
             DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat := DMTE.FRound(DMTE.cdsMovCxC.FieldByName('CCMTOLOC').AsFloat - DMTE.cdsMovCxC.FieldByName('CCPAGLOC').AsFloat,15,2);
             If DMTE.cdsMovCxC.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
                DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat := DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat
             else
                DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat := DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat ;
          end;

          DMTE.cdsMovCxC.FieldByName('CCPAGEXT').AsFloat := DMTE.FRound(DMTE.cdsMovCxC.FieldByName('CCMTOEXT').AsFloat  - DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat,15,2  );
          DMTE.cdsMovCxC.FieldByName('CCPAGLOC').AsFloat := DMTE.FRound(DMTE.cdsMovCxC.FieldByName('CCMTOLOC').AsFloat  - DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat,15,2  );
          DMTE.cdsMovCxC.FieldByName('CCPAGORI').AsFloat := DMTE.FRound(DMTE.cdsMovCxC.FieldByName('CCMTOORI').AsFloat  - DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat,15,2  );

          DMTE.cdsMovCxC.Post;
          DMTE.cdsMovCxC.Datarequest('SELECT * FROM CXC301 WHERE CIAID='+QuotedStr(dblcCia.text)+' AND CLAUXID='+QuotedStr(dblcClase.text)+' AND CLIEID='+QuotedStr(dblcdAux.text));
          DMTE.AplicaDatos(DMTE.cdsMovCxC, 'MOVCXC');

          if DMTE.cdsEgrCaja.FieldByName('ECEstado').Value='C' then
          begin
             DMTE.SaldosAuxiliar( DMTE.cdsMovCxC.FieldByName('CIAID').AsString,   DMTE.cdsMovCxC.fieldbyname('CCANOMES').AsString,
                                 DMTE.cdsMovCxC.fieldbyname('CLAUXID').AsString, DMTE.cdsMovCxC.fieldbyname('CLIEID').AsString, '+',
                                 DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat, DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat,
                                 DMTE.cdsMovCxC.fieldbyname('TMONID').AsString);
          end;
// JCC 04/09/2002
//          DMTE.cdsDocPago.Next;
       end;
       DMTE.cdsDocPago.Next;
       DMTE.cdsDocPago.EnableControls;
       DMTE.cdsMovCxC.Filtered:=True;
       DMTE.cdsMovCxC.EnableControls;
   end;

   /////////////////////////
end;



procedure TFPagoFacturasCobrar.RetornaSaldosMovCxPPagados;
var
   xSQL : String;
begin

	 DMTE.cdsDocPago.DisableControls;
	 DMTE.cdsDocPago.First;
	 {while not DMTE.cdsDocPago.Eof do
	 begin
			xSQL:='Select * from CXP301 '
					 +'WHERE CIAID='''   +DMTE.cdsDocPago.FieldByName('CIAID').AsString   +''' and '
					 +      'TDIARID=''' +DMTE.cdsDocPago.FieldByName('TDIARID2').AsString+''' and '
					 +      'CPANOMES='''+DMTE.cdsDocPago.FieldByName('CPANOMM').AsString +''' and '
					 +      'CPNOREG=''' +DMTE.cdsDocPago.FieldByName('CPNOREG').AsString +'''';
			DMTE.cdsMovCxP.Close;
			DMTE.cdsMovCxP.DataRequest( xSQL );
			DMTE.cdsMovCxP.Open;

			DMTE.cdsMovCxP.edit;

			DMTE.cdsMovCxP.FieldByName('CPESTADO').Value := 'P';
			DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat + DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat;
			DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat + DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat;
			If DMTE.cdsMovCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
				 DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat
			else
				 DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;

			DMTE.cdsMovCxP.FieldByName('CPPAGEXT').Value:=DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat-DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;
			DMTE.cdsMovCxP.FieldByName('CPPAGLOC').Value:=DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat-DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat;
			DMTE.cdsMovCxP.FieldByName('CPPAGORI').Value:=DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat-DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat;

			DMTE.AplicaDatos(DMTE.cdsMovCxP, 'MOVCXP');

			DMTE.SaldosAuxiliar( DMTE.cdsMovCxP.FieldByName('CIAID').AsString,   DMTE.cdsMovCxP.fieldbyname('CPANOMES').AsString,
													DMTE.cdsMovCxP.fieldbyname('CLAUXID').AsString, DMTE.cdsMovCxP.fieldbyname('PROV').AsString, '+',
													DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat, DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat, DMTE.cdsMovCxP.fieldbyname('TMONID').AsString);

      DMTE.cdsDocPago.Next;
   end;}
   /////////////////////
	 while not DMTE.cdsDocPago.Eof do
	 begin
			xSQL:='Select * from CXC301 '
					 +'WHERE CIAID='''   +DMTE.cdsDocPago.FieldByName('CIAID').AsString   +''' and '
					 +      'TDIARID=''' +DMTE.cdsDocPago.FieldByName('TDIARID2').AsString+''' and '
					 +      'CCANOMES='''+DMTE.cdsDocPago.FieldByName('CPANOMM').AsString +''' and '
					 +      'CCNOREG=''' +DMTE.cdsDocPago.FieldByName('CPNOREG').AsString +'''';
			DMTE.cdsMovCxC.Close;
			DMTE.cdsMovCxC.DataRequest( xSQL );
			DMTE.cdsMovCxC.Open;

			DMTE.cdsMovCxC.edit;

			DMTE.cdsMovCxC.FieldByName('CCESTADO').Value := 'P';
			DMTE.cdsMovCxC.FieldByName('CCSALEXT').Value := DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat + DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat;
			DMTE.cdsMovCxC.FieldByName('CCSALLOC').Value := DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat + DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat;
			If DMTE.cdsMovCxC.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
				 DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat := DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat
			else
				 DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat := DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat;

			DMTE.cdsMovCxC.FieldByName('CCPAGEXT').Value:=DMTE.cdsMovCxC.FieldByName('CCMTOEXT').AsFloat-DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat;
			DMTE.cdsMovCxC.FieldByName('CCPAGLOC').Value:=DMTE.cdsMovCxC.FieldByName('CCMTOLOC').AsFloat-DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat;
			DMTE.cdsMovCxC.FieldByName('CCPAGORI').Value:=DMTE.cdsMovCxC.FieldByName('CCMTOORI').AsFloat-DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat;

			DMTE.AplicaDatos(DMTE.cdsMovCxC, 'MOVCXC');

			DMTE.SaldosAuxiliar( DMTE.cdsMovCxC.FieldByName('CIAID').AsString,   DMTE.cdsMovCxC.fieldbyname('CCANOMES').AsString,
													DMTE.cdsMovCxC.fieldbyname('CLAUXID').AsString, DMTE.cdsMovCxC.fieldbyname('CLIEID').AsString, '+',
													DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat, DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat, DMTE.cdsMovCxC.fieldbyname('TMONID').AsString);

      DMTE.cdsDocPago.Next;
   end;

   ////////////////////

   DMTE.cdsDocPago.EnableControls;

end;





procedure TFPagoFacturasCobrar.dbgOtrosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
{    if (Field.FieldName = 'DEMTOLOC') or (Field.FieldName = 'DEMTOEXT') then begin
	if (DMTE.cdsRegCxPDEDH.Value = 'H') then
           AFont.Color := clRed
        else
           AFont.Color := clBlue;
    end; }
end;

procedure TFPagoFacturasCobrar.FormKeyPress(Sender: TObject; var Key: Char);
var
   xStr : String ;
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
    if not aplicaKeyPress(self ,A2digitos , A4digitos) then
       Exit ;
    if not( Key in [ '0'..'9' , '.' , #8 ]) then
    begin
       Key := #0 ;
    end ;
    xStr := TCustomEdit(self.ActiveControl).text ;
    if key = '.' then
       if pos('.',xSTR) <> 0 then
          Key := #0 ;
end;

{begin

if key=#13 then
  begin
   key:=#0;
   perform(CM_DialogKey,VK_TAB,0);
  end;

end;}

procedure TFPagoFacturasCobrar.z2bbtnOKCabClick(Sender: TObject);
var
    xWhere : String ;
   xSQL : string;
begin

   if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, dblcCCBco.text, dbdtpFComp.Date ) then
   begin
      Showmessage('Error : Mes de Fecha Fue Cerrado. Verificar...');
      dbdtpFComp.SetFocus;
      Exit;
   end;

    if not DiaAperturado(dblcCia.text,dbdtpFComp.Date,dblcBanco.text) then
    Begin
      dbdtpFComp.setfocus;
      Exit;
    End;

   if dbdtpFComp.Date=0 then
   begin
     ShowMessage('Fecha de Comprobante Errada');
     dbdtpFComp.SetFocus;
     Exit;
   end;

   if validacionCabecera = False then
      exit;

   dbeTCambio.Text   := DMTE.RecuperarTipoCambio(dbdtpFComp.date) ;
   with DMTE do
   begin
      xWhere :=  'CIAID ='+quotedstr(dblcCia.Text)
      +' AND TDIARID ='+quotedstr(dblcTDiario.Text)
      +' AND ECANOMM ='+quotedstr(edtPeriodo.Text)
      +' AND ECNOCOMP ='+quotedstr(dbeNoComp.Text);
      if DisplayDescrip('prvTGE','CAJA302','COUNT(*) TOTREG',xWhere,'TOTREG')>'0' then
      begin
         ShowMessage('Comprobante ya esta Registrado');
         dbeNoComp.Text:='';
         dbeNoComp.SetFocus;
         exit;
      end
      else
      begin
         GrabaCabeceraDeComprobante;
         ActivaFiltro('REGCXP')  ;
         ActivaFiltro('DOCPAGO') ;
        //0805
        //liberamos el filtro del detalle
         DMTE.cdsRegCxP.Filtered := False ;

         CambiaEstado('N');
      end;
   end;
   (Sender as tcontrol).enabled:=false;
   perform(CM_DialogKey,VK_TAB,0);
   wmodifica:=False;
end;

procedure TFPagoFacturasCobrar.dbeNoCompExit(Sender: TObject);
begin
   dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
end;

procedure TFPagoFacturasCobrar.dbgDocPagoCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'DEMTOLOC') or (AFieldName = 'DEMTOEXT') then
       ABrush.Color := clRed;
end;

procedure TFPagoFacturasCobrar.dbgOtrosCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'DEMTOLOC') or (AFieldName = 'DEMTOEXT') then
       ABrush.Color := clNone;
end;

procedure TFPagoFacturasCobrar.InhabilitarPaneles;
begin
   pnlDetalle.Enabled  := False;
   pnlBotones.Enabled  := False;
   IniciaPanel;
   pnlActualiza.BringToFront ;
   pnlActualiza.Visible:= True;
   dbeNoReg.Enabled    := True;
   dbeNoReg.Color      := clWindow;

   dbeNoReg.SetFocus;
   //Aqui se establecen los filtros para edicion en el grid
   establecerfiltrosRegistroEgresos;
end;

procedure TFPagoFacturasCobrar.EdiTarRegistros;
begin
   BlanqueaEdits (pnlActualiza) ;
   DMTE.cdsRegCxP.Edit;    //Lo pongo en modo de edicion
   dbeNoReg.Text:=DMTE.cdsRegCxP.FieldByName('CPNOREG').Value  ;
   dbeNoReg.Enabled:=false;
   label1.Caption := 'En Edicion';
   dbeNoReg.Enabled := False;
   dbeNoReg.Color   := clBtnFace;

   if not DMTE.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClase.Text ]),[]) then
      Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''') ;

   //Recuperacion de los detalles del panel
   if trim( dblcTDoc2.Text ) <> '' then
      edtTDoc2.Text     :=
            DMTE.DisplayDescrip('prvTGE','TGE110','DOCABR','DOCID=''' + dblcTDoc2.Text + '''','DOCABR') ;
   if trim( dblcdCnp2.Text ) <> '' then
      edtCnp2.Text      := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOABR','CPTOID=''' + dblcdCnp2.Text + '''','CPTOABR') ;
   if trim( dblcdAuxDet.Text ) <> '' then
   begin
      dbeAuxDet.Text    :=
						DMTE.DisplayDescrip('prvTGE','CNT201','AUXABR',
															 'CLAUXID = ''' +
															 DMTE.cdsRegCxP.fieldbyname('CLAUXID').AsString
																+ ''' AND AUXID=''' + dblcdAuxDet.Text + '''','AUXABR') ;
			edtClaseDet.Text     :=
            DMTE.DisplayDescrip('prvTGE','TGE102','CLAUXABR',
                               'CLAUXID = ''' +
                               DMTE.cdsRegCxP.fieldbyname('CLAUXID').AsString + ''' ','clauxabr') ;

   end ;

   if trim( dblcTMon2.Text ) <> '' then
      edtTMon2.Text     := DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblctmon2.Text,'TMONABR') ;
   //fin de los detalles del panel

   if not DMTE.cdsRegCxP.FieldByName('PROV').Isnull then
   begin
      if trim(DMTE.cdsRegCxP.FieldByName('PROV').AsString) <> '' then
            dblcdAuxDet.Enabled := True
      else
            dblcdAuxDet.Enabled := False ;
   end
   else
      dblcdAuxDet.Enabled := False ;

   if not DMTE.cdsRegCxP.FieldByName('CCOSID').Isnull then
   begin
      if trim(DMTE.cdsRegCxP.FieldByName('CCOSID').AsString) <> '' then
            dblcdCCosto.Enabled := True
      else
            dblcdCCosto.Enabled := False ;
   end
   else
      dblcdCCosto.Enabled := False ;

   dblcClaseDet.Enabled  := dblcdAuxDet.Enabled ;
   if not dblcClaseDet.Enabled then
   begin
      edtClaseDet.Text  := '' ;
      dbeAuxDet.Text := '' ;
   end
   else
      if not DMTE.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClaseDet.Text ]),[]) then
         Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''') ;


end;

procedure TFPagoFacturasCobrar.AdicionarRegistros;
var
xWhere,Aux :String;
begin
   BlanqueaEdits (pnlActualiza);
   dbeSerie.Text     := '000';

   with DMTE do begin
      dbeNoReg.Enabled:=true;
      dbeNoReg.Text:='';
      dbeNoReg.Text := GeneraCorrelativo( DMTE.cdsRegCxP , 'CPNOREG' ) ;

      DMTE.cdsRegCxP.Insert;
      DMTE.cdsRegCxP.FieldByName('CIAID').Value   := dblcCia.Text;
      DMTE.cdsRegCxP.FieldByName('TDIARID').Value := dblcTDiario.Text;
      DMTE.cdsRegCxP.FieldByName('ECANOMM').Value := edtPeriodo.Text;
      DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value:= dbeNoComp.Text;

      cdsRegCxP.FieldByName('DETCPAG').Value  := strtofloat(dbeTCambio.Text);
      cdsRegCxP.FieldByName('DEFCOMP').Value  := cdsEgrCaja.FieldByName('ECFCOMP').Value;
      cdsRegCxP.FieldByName('CPFEMIS').Value  := DateS;
      cdsRegCxP.FieldByName('CPFVCMTO').Value := DateS;
      cdsRegCxP.FieldByName('CPANOMM').Value  := copy(datetostr(cdsRegCxP.FieldByName('DEFCOMP').Value),7,4)
                                +copy(datetostr(cdsRegCxP.FieldByName('DEFCOMP').Value),4,2);
      cdsRegCxP.FieldByName('DETCPAG').Value  := cdsEgrCaja.FieldByName('ECTCAMB').Value;
      cdsRegCxP.FieldByName('DETCDOC').Value  := cdsEgrCaja.FieldByName('ECTCAMB').Value;
      cdsRegCxP.FieldByName('DEDH').Value     := 'D';     //Inicializo en Debe


      xWhere:='FECHA='+wRepFuncDate+ '''' + formatdatetime(DMTE.wFormatFecha,cdsRegCxP.FieldByName('DEFCOMP').AsDateTime)+''')';
      aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
      cdsRegCxP.FieldByName('DEANO').Value  := cdsqry.FieldByName('FECANO').Value;
      cdsRegCxP.FieldByName('DEMM').Value   := cdsqry.FieldByName('FECMES').Value;
      cdsRegCxP.FieldByName('DEDD').Value   := cdsqry.FieldByName('FECDIA').Value;
      cdsRegCxP.FieldByName('DESS').Value   := cdsqry.FieldByName('FECSS').Value;
      cdsRegCxP.FieldByName('DESEM').Value  := cdsqry.FieldByName('FECSEM').Value;
      cdsRegCxP.FieldByName('DETRI').Value  := cdsqry.FieldByName('FECTRIM').Value;
      cdsRegCxP.FieldByName('DEAASS').Value := cdsqry.FieldByName('FECAASS').Value;
      cdsRegCxP.FieldByName('DEAASem').Value:= cdsqry.FieldByName('FECAASEM').Value;
      cdsRegCxP.FieldByName('DEAATri').Value:= cdsqry.FieldByName('FECAATRI').Value;
   end;
   dbeNoReg.SetFocus;

   //blanqueo de descripciones
   edtTDoc2.Text   := '';
   edtCnp2.Text    := '';
   dbeAuxDet.Text  := '';
   edtTMon2.Text   := '';
   dblcClaseDet.Enabled:= False;
   dblcdAuxDet.Enabled := False;
   dblcdCCosto.Enabled := False;
   label1.Caption := 'Nuevo     ';
   cdsTDiarioDet.Filter  :='TDIARID=''''';
   cdsTDiarioDet.Filtered:=True;

   if not DMTE.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClase.Text ]),[]) then
      Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''') ;

end;

procedure TFPagoFacturasCobrar.LiberarFiltrosRegistroEgresos;
begin
      DMTE.cdsTDoc.Filter:='';
      DMTE.cdsTDoc.Filtered:=true;
{
      DMTE.cdsTDiario.Filter:='';
      DMTE.cdsTDiario.Filtered:=true;
}
end;

procedure TFPagoFacturasCobrar.EstablecerFiltrosRegistroEgresos;
begin
   DMTE.cdsTDoc.Filter := 'NOT ( TDIARID IS NULL) OR NOT (TDIARID2 IS NULL) ' ;
   DMTE.cdsTDoc.Filtered := true;
end;


procedure TFPagoFacturasCobrar.dbeNoRegExit(Sender: TObject);
begin
   if not z2bbtnCancel3.Focused then
   begin
      dbeNoReg.Text:=DMTE.strzero(dbeNoReg.Text,10);
      if strtoint(dbeNoReg.Text)=0 then
      begin     // NoRegistro
         dbeNoReg.Text:='';
         ShowMessage('No es valido el No Registro');
         dbeNoReg.SetFocus;
         exit;
      end;
       DMTE.cdsRegCxP.FieldByName('CPNOREG').Value  := dbeNoReg.Text;
   end
   else
   dbeNoReg.Text:='';
end;

procedure TFPagoFacturasCobrar.z2bbtnOK2Click(Sender: TObject);
begin
   // VALIDA LA CUENTA DEL CONCEPTO
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,dblcdCnp2.text,'')) and (dblcTMon2.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+DMTE.cdsQry.FieldByName('CUENTAID').AsString+' del Concepto '+dblcdCnp2.text+' Se registra sólo en Moneda Extranjera.');
   end;

   if DMTE.cdsRegCxP.State=dsInsert then
       if EncuentraDuplicado(DMTE.cdsRegCxP,'CPNOREG',dbeNoReg.Text) then
          begin
            ShowMessage('Numero de Registro duplicado');
            dbeNoReg.SetFocus;
            exit;
          end;

   if not ValidaCampo then
      ShowMessage('No se puede grabar')
   else
   begin
      DMTE.cdsRegCxP.Post;
      ShowMessage('Grabacion Ok');
      wmodifica:=True;
      //
      if not dbeNoReg.Enabled then
      begin
         PnlActualiza.Visible := False;
         pnlDetalle.Enabled   := True;
         pnlBotones.Enabled   := True;
         z2bbtnSumatClick(sender);    // Al salir hay que totalizar
         //quitar los filtros que se hubieran establecido
         liberarfiltrosregistroegresos;
      end
      else
      begin
         adicionarRegistros;
         //dbgDetPagoIButtonClick(Sender);
      end;
      //
   end;

end;


procedure TFPagoFacturasCobrar.dblcTMon2Exit(Sender: TObject);
begin

   if z2bbtnCancel3.Focused then exit;
   if dblcdCnp2.Focused     then exit;
   if dblcClaseDet.Focused then exit;
   if dblcdAuxDet.Focused   then exit;
   if dblcdCCosto.Focused   then exit;

   edtTMon2.text:= DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMon2.Text,'TMONDES') ;

   if edtTMon2.Text='' then begin
      ShowMessage('Error : Moneda no Valida');
      dblcTMon2.SetFocus;
      Exit;
   end;

   if DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value>0 then
   begin
      if DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc then
      begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value/DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
      end
      else
      begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value*DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
      end;
   end
   else
   begin
      DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=0;
      DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=0;
   end;
end;

procedure TFPagoFacturasCobrar.dbeDHChange(Sender: TObject);
begin
     if not ((dbeDH.Text='D') or (dbeDH.Text='H') or (length(dbeDH.Text)=0)) then
     begin
        dbeDH.Text:='';
        dbeDH.SetFocus;
     end;
end;

procedure TFPagoFacturasCobrar.dbeImporte2Exit(Sender: TObject);
var xWhere, aux: string;
begin
///wmc
      if  z2bbtnCancel3.Focused then
          exit;
      xWhere:='TMONID='+''''+DMTE.cdsRegCxP.FieldByName('TMONID').Value+'''';
      aux:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
      if (length(aux)>0) and (DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value>0) then
      begin
        if DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc then
        begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value/DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
        end
        else
        begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value*DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
        end;
      end
      else
      begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=0;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=0;
      end;
end;


procedure TFPagoFacturasCobrar.z2bbtnCancel3Click(Sender: TObject);
begin
{     if DMTE.cdsRegCxP.State = dsInsert then
        DMTE.cdsRegCxP.Delete
     else begin
        DMTE.cdsRegCxP.Cancel;
     end;
     PnlActualiza.Visible := False;
     pnlDetalle.Enabled   := True;
     pnlBotones.Enabled   := True;
     z2bbtnSumatClick(sender);    // Al salir hay que totalizar}
//     bFlagRecuperacion:=false;
     if DMTE.cdsRegCxP.State = dsInsert then
        DMTE.cdsRegCxP.Delete
     else
     begin
        if DMTE.cdsRegCxP.State = dsedit then
          DMTE.cdsRegCxP.Cancel;
     end;
     PnlActualiza.Visible := False;
     pnlDetalle.Enabled   := True;
     pnlBotones.Enabled   := True;
     z2bbtnSumatClick(sender);    // Al salir hay que totalizar
   //quitar los filtros que se hubieran establecido
     liberarfiltrosregistroegresos;

end;

procedure TFPagoFacturasCobrar.dbgOtrosDblClick(Sender: TObject);
begin
   if not dbgOtrosIbutton.Enabled then
      exit ;

   if dbgOtros.DataSource.DataSet.RecordCount<>0 then
   begin
      inHabilitarPaneles;
      editarRegistros;
   end;
end;

function TFPagoFacturasCobrar.ValidacionCabecera: Boolean;
begin
     result:=false;
     if trim(dblccia.text)='' then
     begin

     end;
     if dbdtpFComp.Date=0 then
     begin
          ShowMessage('Ingrese Fecha de Comprobante');
          dbdtpFComp.SetFocus;
          exit;
     end;
     if trim(edtPeriodo.text)='' then
     begin
          ShowMessage('Ingrese Fecha de Comprobante');
          dbdtpFComp.SetFocus;
          exit;
     end;
     if trim(dblcTDiario.text)='' then
     begin
          ShowMessage('Ingrese Tipo de Diario');
          dblcTDiario.SetFocus;
          exit;
     end;
     if trim(edtTDiario.text)='' then
     begin
          ShowMessage('Ingrese Tipo de Diario');
          dblcTDiario.SetFocus;
          exit;
     end;
     if trim(dbeNocomp.text)='' then
     begin
          ShowMessage('Ingrese Número de Comprobante');
          dbeNocomp.SetFocus;
          exit;
     end;

		 //si llega aqui es true
		 result:=true;
end;

procedure TFPagoFacturasCobrar.z2bbtnImprimeClick(Sender: TObject);
var
	 xWhere, xxAA : String;
begin
   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' then
	begin
   	RecCptosDifC ;

		Contabiliza;

      ActualizaCNT311( DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
                       DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                       DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                       DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString );

      if SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                  DMTE.SRV_D, 'PCNA', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                  DMTE.cdsResultSet, DMTE.DCOM1, Self ) then

      ImprimeVoucher( 'CNT311', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
 	end;

   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' then
   begin
      ImprimeVoucher( 'CNT301', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
   end;
end;

procedure TFPagoFacturasCobrar.FormShow(Sender: TObject);
var
   Comp : structComprobante ;
	 ssql: string;
	 swhere : String;
   xsql,xWhere : string;
begin
   if DMTE.wModo='A' then
   begin
      Adiciona ;
   end
   else
   begin
      Edita( Comp , DMTE.cdsEgrCaja ) ;
   end;

	 with DMTE do
	 begin
				 if Trim(dblcBanco.Text) <> '' then
				 begin
						 if cdsEgrCaja.FieldByName('ECESTADO').Value='I' then//Si está INCOMPLETO o PENDIENTE
						 begin
									 //focus
									 pnlCabecera2.setfocus ;
									 perform(CM_DialogKey,VK_TAB,0);
									 //
						 end;
						 if ( cdsEgrCaja.FieldByName('ECESTADO').Value='C' ) or
								( cdsEgrCaja.FieldByName('ECESTADO').Value='A' ) then      //Si está CANCELADO
						 begin
									//focus
									pnlBotones.SetFocus ;
									perform(CM_DialogKey,VK_TAB,0);
									//
						 end;
				 end
				 else
				 begin
					 //codigo nuevo
						RecuperarCiaUnica(dblcCia,edtCia);
						edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
															 +copy(datetostr(dbdtpFComp.date),4,2);
						if dblccia.text <> '' then
						begin
							 perform(CM_DialogKey,VK_TAB,0);
						end ;
					 //fin de codigo nuevo
				 end ;
	 //          ControlFocoEntrada (ctrl,evt_exit) ;
	 end ;
/////////////

	 xsql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
	 DMTE.cdsCCosto.Close;
	 DMTE.cdsCCosto.DataRequest(xsql);
	 DMTE.cdsCCosto.open;
	 xVoucher := '';
	 Limpiapnlaux;
	 //**
	 if DMTE.cdsFormPago.RecordCount = 1 then
	 begin
			dblcFormPago.Value := DMTE.cdsFormPago.FieldByName('FPAGOID').Asstring;
			dbeNoChq.Enabled :=True  ;
			dbdtpFEmis.Enabled  := True ;
			xWhere := 'FPAGOID='+quotedstr(dblcFormPago.text);
			if DMTE.DisplayDescrip('prvQry2','TGE112','FCANJE',xWhere,'FCANJE') = 'S' then
			begin
				 edtCuenta.Enabled := True;
				 edtFormPago.Text:=DMTE.cdsQry.FieldByName('FPAGODES').AsString;
			end
			else begin
				 edtCuenta.Enabled := False ;
				 edtAuxpnl.Visible := false;
				 edtclasepnl.Visible := false;
			end;

         if (DMTE.cdsFormPago.FieldByName('FCHQ').AsString='1') or
            (DMTE.cdsFormPago.FieldByName('FCHQ').AsString='S') then
			begin
				 dbeNoChq.Enabled  :=True  ;
				 dbdtpFEmis.Enabled:= True ;
				 dbeNoChq.SetFocus;
			end
			else
			begin
				 dbeNoChq.Enabled  := False;
				 dbdtpFEmis.Enabled:= False ;
			end;
	 end;
	 dbeLote.text := '000';
	 dbeLote.OnExit(self);

/////////////
	 cf1.PonerExits ;
	 {
			Aqui voy a poner el codigo que sumariza Totales del footer ;
	 }
		 if DMTE.cdsdocpago.RecordCount = 0 then
			begin
				 dbgDocPago.ColumnByName('CPSALLOC').FooterValue:= '0.00';
				 dbgDocPago.ColumnByName('CPSALEXT').FooterValue:= '0.00';
				 dbgDocPago.ColumnByName('CCPMOLOC').FooterValue:= '0.00';
				 dbgDocPago.ColumnByName('CCPMOEXT').FooterValue:= '0.00';
			end ;
			z2bbtnSumatDocPagoClick ( nil )  ;
			z2bbtnSumatClick( nil )          ;
	 //** 01/12/2000 - pjsv - para que muestre el otro auxiliar si tiene
	 edtFormPago.Enabled := edtFormPago.text = 'CANJE';
	 if edtFormPago.Enabled then
		begin
			//** 04/04/2001 - pjsv
		 //if DMTE.cdsAuxiliar.Locate('CIAID;TDIARID;ECANOMM;ECNOCOMP',
		 //                           VarArrayOf([dblcCia.Text,dblcTDiario.Text,edtPeriodo.text,dbeNoComp.text]),[loPartialKey]) then
		 // begin
		 //**
			 ssql :='';
			 ssql := 'CLAUXID='+quotedstr(DMTE.cdsEgrCaja.fieldbyname('CLAUXID1').AsString);
			 edtclasepnl.Text := DMTE.DisplayDescrip('prvClaseAux','TGE102','CLAUXDES',sWhere,'CLAUXDES');
			 ssql :='';
			 ssql := 'AUXID='+quotedstr(DMTE.cdsEgrCaja.fieldbyname('AUXID').AsString);
			 edtAuxpnl.Text := DMTE.DisplayDescrip('prvQry2','CNT201','AUXNOMB',sWhere,'AUXNOMB');
			 edtAuxpnl.Visible := true;
			 edtclasepnl.Visible := true;
		 // end;
		end
	 else
		begin
		 edtAuxpnl.Visible := false;
		 edtclasepnl.Visible := false;
		end;
	 //**
	 //** 10/02/2001 - pjsv
//   dblcCiaExit(sender);
	 edtCia.text:= DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIADES') ;
	 //**
end;

procedure TFPagoFacturasCobrar.RecuperaDescrip;
begin
		DescripPagoFact(dblcCia.text,edtPeriodo.text,dblcTDiario.Text,dbeNoComp.text);
		DMTE.cdsDescrip.Active := False ;
		DMTE.cdsDescrip.Active := True ;
		edtClase.text   := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('CLAUXABR'));
		edtTMon.text    := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('TMONABR'));
		edtBanco.text   := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('BANCOABR'));

		edtFormPago.text:= DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('FPAGOABR'));

		edtCia.Text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('CIADES'));
		edtTDiario.Text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('TDIARABR')); ;
		if not DMTE.cdsDescrip.FieldByName('FLUEFEABR').isnull then
			 dbeFEfec.text := DMTE.cdsDescrip.FieldByName('FLUEFEABR').AsString ;
     wCiaRetIGV:=(DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIARETIGV')='S') ;
    lblSujetoRetencion.visible:=((DMTE.DisplayDescrip('prvTGE','CNT201','PROVRETIGV',
															 'CLAUXID = ''' +
															 dblcClase.text
																+ ''' AND AUXID=''' + dblcdAux.Text + '''','PROVRETIGV')='S') AND (wCiaRetIGV)) ;

//		lblSujetoRetencion.visible:=(DMTE.cdsAux.FieldByName('PROVRETIGV').Asstring='S');
end;

procedure TFPagoFacturasCobrar.Adiciona;
var
   xSQL : String ;
begin
   //Código Nuevo
   IniciaDatos ;

   dblcCCBco.Selected.Clear;
   dblcCCBco.Selected.Add('CCBCOID'#9'25'#9'Cuenta Corriente del Banco'#9'F');
   dblcCCBco.Selected.Add('CCBCODES'#9'30'#9'Descripción'#9'F');
   dblcCCBco.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');


   edtCuenta.Enabled := False ;

   DMTE.cdsRegCxP.Filter := 'CIAID=''''' ;
   DMTE.cdsRegCxP.Filtered := True ;
   z2bbtnNuevo.Visible := True ;
   z2bbtnCancel.Visible := True ;

   // vhn 22/01/2001
   xSQL:='Select * from CAJA303 '
        +'Where CIAID='''' and ECANOMM='''' and '
        +      'TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsDocPago.Close;
   DMTE.cdsDocPago.DataRequest( xSQL );
   DMTE.cdsDocPago.Open;

   dblcClase.Enabled  := True ;
   dblcdAux.Enabled   := True ;
   //** 10/04/2001 - pjsv se quita por recomendación de Jorge
   //DMTE.cdsMovCxP.Filter := 'CIAID=''''' ;
   //DMTE.cdsMovCxP.Filtered := True ;
   //**
   xTC := 0 ;
   DMTE.RecuperaCierre( wFechacierre , wFrecu ) ;
   if wFechaCierre = 0 then
   begin
      dbdtpFComp.date := dateS ;
   end
   else
   begin
      if (tDate(date) > wFechaCierre) and (tdate(date)<=wFechaCierre+wFrecu) then
          dbdtpFComp.date := dateS
      else
          dbdtpFComp.date := wFechaCierre+1 ;
   end ;

   wmodifica := False ;
end;

procedure TFPagoFacturasCobrar.Edita(Comp: structComprobante ; cds : Twwclientdataset);
var
   xsql,xWhere, xFiltro : String ;
begin
   IniciaDatos;
   cdsFiltro := Cds ;

   dblcCia.Text      :=  Comp.CIAID    ;
   dblcTDiario.Text  :=  Comp.TDIARID  ;
   edtPeriodo.Text   :=  Comp.ECANOMM  ;
   dbeNoComp.Text    :=  Comp.ECNOCOMP ;

	 with DMTE do
	 begin
			dbdtpFComp.date  := cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
			dblcClase.Text   := cdsEgrCaja.FieldByName('CLAUXID').AsString;
			dblcdAux.Text    := cdsEgrCaja.FieldbyName('PROV').AsString;
			edtAuxRuc.Text   := cdsEgrCaja.FieldbyName('PROVRUC').AsString;
			dbeGiradoA.Text  := cdsEgrCaja.FieldByName('ECGIRA').AsString;
			dblcTMon.Text    := cdsEgrCaja.FieldByName('TMONID').AsString;
			dbeTCambio.Text  := cdsEgrCaja.FieldByName('ECTCAMB').AsString;
			xTC              := cdsEgrCaja.FieldByName('ECTCAMB').AsFloat ;
			dbeImporte.Text  := cdsEgrCaja.FieldByName('ECMTOORI').AsString;
			dblcBanco.Text   := cdsEgrCaja.FieldByName('BANCOID').AsString;
			dblcCCBco.Text   := cdsEgrCaja.FieldByName('CCBCOID').AsString;
			edtCuenta.Text   := cdsEgrCaja.FieldByName('CUENTAID').AsString;
			dblcFormPago.Text:= cdsEgrCaja.FieldByName('FPAGOID').AsString;
			dbeNoChq.Text    := cdsEgrCaja.FieldByName('ECNOCHQ').AsString;
			dbdtpFEmis.date  := cdsEgrCaja.FieldbyName('ECFEMICH').AsDateTime ;
			dbeLote.Text     := cdsEgrCaja.FieldByName('ECLOTE').AsString;
			dblcdCnp.Text    := cdsEgrCaja.FieldByName('CPTOID').AsString;
			dbeGlosa.Text    := cdsEgrCaja.FieldByName('ECGLOSA').AsString;
			dblcdFEfec.Text  := cdsEgrCaja.FieldByName('FLUEID').AsString ;
			dblcdCtaCte.Text  := cdsEgrCaja.FieldByName('PRVCCBCOID').AsString ;
			//Asigna descripciones wmc
			rECUPERAdESCRIP ;
			//fin de asigna descripciones wmc
			ActivaFiltro('REGCXP');
			ActivaFiltro('DOCPAGO');

			if cdsEgrCaja.FieldByName('ECEstado').Value='I' then//Si está INCOMPLETO o PENDIENTE
			begin
				 cdsEgrCaja.Edit ;
         CambiaEstado ('I');

         xWhere:='CIAID='''   + dblcCia.Text  + ''' AND ' +
                 'CCESTADO='''+ 'P'           + ''' AND ' +
                 'CLAUXID= '''+ dblcClase.Text+ ''' AND ' +
                 'CLIEID='''    + dblcdAux.Text + '''  ' ;
{         xFiltro:=' (( (CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR '+
                  '   ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) '  ;

         DMTE.cdsMovCxP.active := False ;
         DMTE.cdsMovCxP.Datarequest('SELECT * FROM CXP301 WHERE ' + xWhere );
         DMTE.cdsMovCxP.Active := True ;
         DMTE.cdsMovCxP.IndexFieldNames:='CLAUXID;PROV;CPFEMIS';
         DMTE.cdsMovCxP.Filter   := xFiltro ;
         DMTE.cdsMovCxP.Filtered := True ;}
         ////////////////////
         xFiltro:=' (( (CCMTOORI-CCPAGORI-CCSALORI)> -0.01 and (CCMTOORI-CCPAGORI-CCSALORI) < 0.01 ) OR '+
                  '   ( CCMTOORI = CCSALORI ) )  AND ( CCSALORI > 0 ) '  ;

         DMTE.cdsMovCxC.active := False ;
         DMTE.cdsMovCxC.Datarequest('SELECT * FROM CXC301 WHERE ' + xWhere );
         DMTE.cdsMovCxC.Active := True ;
         DMTE.cdsMovCxC.IndexFieldNames:='CLAUXID;CLIEID;CCFEMIS';
         DMTE.cdsMovCxC.Filter   := xFiltro ;
         DMTE.cdsMovCxC.Filtered := True ;

         ////////////////////
         dbgOtrosIButton.Enabled := True ;

      end;

      if cdsEgrCaja.FieldByName('ECESTADO').Value='C' then      //Si está CANCELADO
      begin
         CambiaEstado('C');
         dbgOtrosIButton.Enabled := False ;
         ActPnlBotones;
      end;

      if cdsEgrCaja.FieldByName('ECESTADO').Value='A' then      // Si esta ANULADO
      begin
         CambiaEstado('A') ;
         dbgOtrosIButton.Enabled := False ;
         ActPnlBotones ;
      end ;

      z2bbtnSumatClick(nil) ;
      z2bbtnSumatDocPagoClick(nil) ;
   end;
   (z2bbtnOkCab).enabled:=false;
   z2bbtnNuevo.Visible := False ;
   z2bbtnCancel.Visible := False ;

   dblcClase.Enabled  := False ;
   dblcdAux.Enabled   := False ;
   xSql := 'SELECT * FROM CAJA102 WHERE PROV='+quotedstr(trim(dblcdAux.Text))+
           ' AND BANCOID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('PRVBANCOID').AsString)+
           ' AND CCBCOID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('PRVCCBCOID').AsString);
   DMTE.cdsProvCta.Close;
   DMTE.cdsProvCta.DataRequest(xSql);
   DMTE.cdsProvCta.Open;

   If (dblcdCtaCte.text <> '')  then
    begin
     dblcdCtaCte.Text  := DMTE.cdsEgrCaja.FieldByName('PRVCCBCOID').AsString ;
     xDirAux := DMTE.DisplayDescrip('prvTGE','CNT201','AUXDIR','AUXID='+quotedstr(dblcdAux.text),'AUXDIR');
     If DMTE.cdsEgrCaja.FieldByName('ECEstado').Value='C' then
      Z2bbtnNotaAbono.enabled := true;
    end
   else
    begin
     Z2bbtnNotaAbono.enabled := False;
     xDirAux := '';
    end;
   wmodifica:=False;
end;

procedure TFPagoFacturasCobrar.FormCreate(Sender: TObject);
var
    i : Integer ;
begin
   i := 0 ;
   try
       i := 1 ;
       DMTE.ASignaTipoDiario(dblcTDiario,self) ;
       i := 2 ;
       setLength(A2digitos,1) ;
       i := 3 ;
       setLength(A4digitos,1) ;
       i := 4 ;
       A2digitos[0] := dbeImporte ;
       i := 5 ;
       A4digitos[0] := dbeTcambio ;

       i := 6 ;
       cdsConceptoC1 := TwwClientdataset.Create(Self) ;
       i := 7 ;
       cdsConceptoC1.CloneCursor(DMTE.cdsCnpEgr ,True) ;
       i := 8 ;
       cdsConceptoC1.Name := 'cdsConceptoC1' ;
       i := 9 ;
       cdsConceptoC1.Filtered := False ;
       cdsConceptoC1.Filter   := '';
       cdsConceptoC1.Filter   := 'CPTOIS=''E''';
       cdsConceptoC1.Filtered := True ;
       i := 10 ;
       dblcdCnp2.LookupTable := cdsConceptoC1 ;
       i := 11 ;

       cdsTdiarioDet := TwwClientdataset.Create(Self) ;
       i := 12 ;
       cdsTdiarioDet.CloneCursor(DMTE.cdsTDiario1 ,True) ;
       i := 13 ;
       cf1 := TControlFoco.Create ;
       i := 14 ;
       DMTE.cdsFEfec.Filter := 'FLUEFE_IS = ''S'' ' ;
       i := 15 ;
       DMTE.cdsFEfec.Filtered := True ;
   except
         on E: Exception do showmessage(E.Message+'  ' + 'Linea : ' + inttostr(i)) ;
   end ;

end;

procedure TFPagoFacturasCobrar.AdicIniciaDatos;
begin
   RecuperarCiaUnica(dblcCia,edtCia);
   edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
   if dblccia.Text<>'' then
      perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFPagoFacturasCobrar.ActualizaSaldosCaja;
begin
    if trim(dblcCCBco.TEXT) <> '' then  //SI ES MOVIMIENTOD E BANCOS
    begin
       DMTE.ActSdoTlfn(dblcCia.text,dblcBanco.text,dblcCCBCo.Text,   //CAJA310
                      DMTE.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                      DBDTPfcOMP.DATE) ;
       DMTE.ActSdoMen(dblcBanco.text,dblcCCBCo.Text,     //CAJA401
                      DMTE.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                      DBDTPfcOMP.DATE) ;
    end
    else
      with DMTE.cdsEgrCaja do   //SI ES CAJA
       DMTE.ActSdoCaja(fieldbyname('TMONID').AsString , fieldbyname('BANCOID').AsString ,
                      fieldbyname('ECMTOORI').AsString ,fieldbyname('ECFCOMP').AsString) ;
    
end;

procedure TFPagoFacturasCobrar.ConfiguraAccesos;
begin
    if DMTE.wAdmin = 'G' then
       Proc_Admin
    else
    begin
       if DMTE.wModo = 'C' then
          Proc_Consul
       else
          DMTE.AccesosUsuarios( DMTE.wModulo,DMTE.wUsuario,'2',Screen.ActiveForm.Name ) ;
    end ;

end;

procedure TFPagoFacturasCobrar.Libera_Admin;
begin
    Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFPagoFacturasCobrar.Libera_Consul;
begin

end;

procedure TFPagoFacturasCobrar.Proc_Admin;
var
   Contador : Integer ;
begin
    pnlCabecera1.Enabled := False ;
    pnlCabecera2.Enabled := False ;
    pnlDeTalle.Enabled := False ;
    //Array de controles y eventos
    Contador := BotonesEnPanel( pnlBotones ) ;
    setlength( A1 , Contador) ;
    setlength( A2 , Contador) ;
    Quita(A1,A2,pnlBotones) ;
    //
    pnlBotones.Enabled := True ;
end;

procedure TFPagoFacturasCobrar.Proc_Consul;
begin
    pnlCabecera1.Enabled := False ;
    pnlCabecera2.Enabled := False ;
    pnlDeTalle.Enabled := True ;
    pnlBotones.Enabled := False ;
end;

procedure TFPagoFacturasCobrar.LibConfigAccesos;
begin
    if DMTE.wAdmin = 'G' then
       Libera_Admin
    else
    begin
       if DMTE.wModo = 'C' then
          Libera_Consul ;
    end ;
end;

procedure TFPagoFacturasCobrar.ValidaCabecera2;
begin
   if length(dblcCia.Text)=0 then raise exception.Create('Falta Codigo de Compañia');
   if length(edtCia.Text)=0 then raise exception.Create('Codigo de Compañia Errado');
   if length(dblcTDiario.Text)=0 then raise exception.Create('Falta Tipo de Diario');
   if length(edtTDiario.Text)=0 then raise exception.Create('Tipo de Diario Errado');

   if length(dbeGiradoA.Text)=0 then raise exception.Create('Datos del Proveedor Errados');

   if length(dblcTMon.Text)=0 then raise exception.Create('Falta Tipo de Moneda');
   if length(edtTMon.Text)=0 then raise exception.Create('Codigo de Moneda Errado');
   if length(dbeTCambio.Text)=0 then raise exception.Create('Falta Tipo de Cambio')
   else
      if strtofloat(dbeTCambio.Text)<=0 then raise exception.Create('Tipo de Cambio Errado');

   if length(dbeImporte.Text)=0 then raise exception.Create('Falta Monto a Pagar')
   else
      if strtofloat(dbeImporte.Text)<=0 then raise exception.Create('Importe Errado');


   if length(dblcBanco.Text)=0 then raise exception.Create('Falta definir Banco');
   if length(edtBanco.Text)=0 then raise exception.Create('Codigo de Banco Errado');

   if dblcCCBco.Enabled=True then
   begin
      if length(dblcCCBco.Text)=0 then raise exception.Create('Falta Cuenta Corriente Banco');
      IF dbdtpFEmis.Date = 0 then
      begin
         dbdtpFEmis.SetFocus ;
				 raise exception.create('Ingrese Fecha de Emisión del Cheque') ;
			end ;

   end;

   if dblcFormPago.Enabled=True then
   begin
      if length(dblcFormPago.Text)=0 then raise exception.Create('Falta Forma de Pago');
      if length(edtFormPago.Text)=0 then raise exception.Create('Codigo de Forma de Pago Errado');
   end;

   if (dbeNoChq.Enabled=True) and (length(dbeNoChq.Text)=0) then
      raise exception.Create('Falta No. de Cheque');

   if (dbdtpFeMis.Enabled=True) and (dbdtpFeMis.Date=0) then
      raise exception.Create('Falta Fecha de Emisión del Cheque');

   if length(dbeLote.Text)=0 then raise exception.Create('Falta Lote');
   if length(dblcdCnp.Text)=0 then raise exception.Create('Falta Concepto');
end;

procedure TFPagoFacturasCobrar.Z2bbtnEmiChqClick(Sender: TObject);
var
   strChq : structChq ;
   xsql,ArchivoReporte : string ;
begin
   if trim(dblcCCBco.Text) <> '' then
   begin
      //** 08/03/2001 - pjsv - para validar que no se reimprima el chq
      xSQL:=' CIAID='''   +dblcCia.text+''' and '
          +      'TDIARID=''' +dblcTDiario.text +''' and '
          +      'ECANOMM=''' +edtPeriodo.text+''' and '
          +      'ECNOCOMP='''+dbeNoComp.text+''' ';
      if DMTE.DisplayDescrip('prvSQL','CAJA302','ECCHQEMI',xsql,'ECCHQEMI') <> 'S' then
      //**
       begin
        DMTE.RecuperarDatos('TGE106','*',
                           'BANCOID = ''' + dblcBanco.text+ ''' AND CCBCOID = ''' + dblcCCBco.Text+ '''') ;
        ArchivoReporte  := DMTE.cdsRec.fieldbyname('CCFMTCHQ').ASString ;
        if ArchivoReporte = '' then
         ArchivoReporte := 'ChqDefault.rtm';
        with strChq do
        begin
           ppFileName    := ArchivoReporte                                             ;
           ppGiradoA     := dbeGiradoA.Text                                            ;
					 ppImporte     := floattostrf(strtocurr(trim(dbeImporte.Text)),fffixed,10,2) ;
					 ppMontoLetras := strNum(strtofloat(ppImporte))                              ;
           ppDia         := strDia(dbdtpFEmis.Date)                                    ;
           ppmes         := strMes(dbdtpFEmis.Date)                                    ;
           ppAno         := strAno(dbdtpFEmis.Date)                                    ;
           If dblcCCBco.Text <> '0100001518' then
            ppRuc         := 'RUC :'+xRUCCIA;
        end;
        //** 08/03/2001 - pjsv
        DMTE.xFlagP := False;
        FRegistro.EmiteChq(ArchivoReporte, strChq);
        if DMTE.xFlagP then
         begin
          xSQL:='UPDATE CAJA302 SET ECCHQEMI=''S'' '
            +'WHERE CIAID='''   +dblcCia.text+''' and '
            +      'TDIARID=''' +dblcTDiario.text +''' and '
            +      'ECANOMM=''' +edtPeriodo.text+''' and '
            +      'ECNOCOMP='''+dbeNoComp.text+''' ';
          DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         end;
         //**
       end
      else Showmessage('Cheque ya fue impreso') ;
   end
   else
   begin
      Showmessage('No ha seleccionado Cuenta Corriente') ;
   end ;
end;

procedure TFPagoFacturasCobrar.SaldosAux;
var
   Previo ,
   Actual ,
   xClase   : String ;
   cdsClone : TwwClientDataSet ;
begin
    with DMTE.cdsDocPago do
    begin
       if RecordCount = 0 then
          Exit ;

       cdsClone := TwwClientDataSet.create(self) ;
       DisableControls ;
       Previo := '' ;
       Actual := '' ;
       IndexFieldNames := 'PROV' ;
       First ;
       while not EOF do
       begin
         Actual := FieldBYname('PROV').AsString ;
//         xClase := BuscaClase ;
         xClase := Fieldbyname('CLAUXID').AsString ;
         if Actual <> Previo then
          begin
            Opera(Actual ,xClase,cdsClone) ;
          end ;
         Previo := Actual ;
         Next ;
       end;
       IndexFieldNames := '' ;
       EnableControls ;
       cdsClone.free ;
    end ;
end;

procedure TFPagoFacturasCobrar.Opera(xProv , xClase : string ;cdsClone : TwwClientDataSet) ;
var
   xFiltro : string          ;
   xDEMTOLOC ,
   xDEMTOEXT : Double      ;
   xDatAux : structSaldosAux ;
   xMTOSLOC ,
   xMTOSEXT : Double       ;
begin
   xFiltro  := 'CLAUXID = ''' + xClase + ''' AND PROV = ''' + xProv + '''' ;
   cdsclone.CloneCursor(DMTE.cdsDocPago,true) ;
   //Calculo de Montos Locales
   cdsclone.Filter   := xfiltro +' AND TMONID= '''+DMTE.wTMonLoc+'''' ;
   cdsclone.Filtered := true   ;
   xMTOSLOC := 0 ;
   if cdsClone.RecordCount <> 0 then
   begin
      cdsClone.First ;
      while not cdsClone.Eof do
      begin
          if ( cdsclone.fieldbyname('TMONID').asstring <> dblctmon.Text ) then
          begin
             xMTOSLOC := DMTE.FRound( cdsclone.fieldbyname('DEMTOEXT').asFloat *  cdsclone.fieldbyname('DETCDOC').asfloat,15,2)
          end
          else
             xMTOSLOC := xMTOSLOC + cdsclone.fieldbyname('DEMTOLOC').asFloat ;
          cdsClone.Next ;
      end;
   end
   else
     xMTOSLOC := 0 ;

   xMTOSext := 0;
   //calculo de Montos Extranjeros
   cdsclone.Filter   := xfiltro +' AND TMONID= '''+DMTE.wTMonExt+'''' ;
   cdsclone.Filtered := true   ;
   if cdsClone.RecordCount <> 0 then
   begin
      while cdsClone.Eof do
      begin
          if ( cdsclone.fieldbyname('TMONID').asstring <> dblctmon.Text ) then
          begin
             xMTOSext := DMTE.FRound( cdsclone.fieldbyname('DEMTOLOC').asFloat / cdsclone.fieldbyname('DETCDOC').asFloat,15,2)
          end
          else
             xMTOSEXT := xMTOSEXT + cdsclone.fieldbyname('DEMTOEXT').asFloat ;
          cdsClone.Next ;   
      end;
   end
   else
     xMTOSEXT := 0 ;

   xDEMTOLOC := DMTE.OperClientDataSet( DMTE.cdsDocPago , 'SUM(DEMTOLOC)',xFiltro ) ;
   xDEMTOEXT := DMTE.OperClientDataSet( DMTE.cdsDocPago , 'SUM(DEMTOEXT)',xFiltro ) ;
   with xDatAux , DMTE.cdsEgrcaja do
   begin
      CIAID     :=  dblcCia.Text    ;
      CLAUXID   :=  xClase  ;
      AUXID     :=  xProv    ;
      MONTOMN   :=  CajaDec( floatToStr( xDEMTOLOC ) ) ;
      MONTOME   :=  CajaDec( floatToStr( xDEMTOEXT ) ) ;
      MTOSLOC   :=  currtoStr( xMTOSLOC )  ;
      MTOSEXT   :=  CurrToStr( xMTOSEXT )  ;
      FECHA     :=  dbdtpFComp.date  ;
      DMTE.ActSaldosAux ( xDatAux )  ;
   end ;
end;

function TFPagoFacturasCobrar.BuscaClase: String;
var
  cds : TwwClientDataset ;
begin
  cds := TwwClientDataset.Create( self ) ;
//  cds.CloneCursor(DMTE.cdsMovCxP , True ) ;
  cds.CloneCursor(DMTE.cdsMovCxC , True ) ;
  if cds.Locate('CIAID;CPANOMES;TDIARID;CPNOREG',
                 VarArrayOf([DMTE.cdsDocPago.fieldbyname ('CIAID').AsString ,
                             DMTE.cdsDocPago.fieldbyname ('CPANOMM').AsString ,
                             DMTE.cdsDocPago.fieldbyname ('TDIARID2').AsString ,
                             DMTE.cdsDocPago.fieldbyname ('CPNOREG').AsString]) , []) then
  begin
    Result := cds.FieldBYname('CLAUXID').AsString ;
  end
  else
  begin
    Result := '' ;
  end ;
end;

procedure TFPagoFacturasCobrar.dblcTDoc2Exit2(Sender: TObject);
begin

   if z2bbtnCancel3.Focused then exit;
   if dbeNoReg.Focused  then Exit;

   edtTDoc2.text:= DMTE.DisplayDescripLocal(DMTE.cdsTDoc,'DOCID',dblcTDoc2.Text,'DOCDES') ;

   if edtTDoc2.Text='' then begin
      ShowMessage('Error : Tipo de Documento no Valido');
      dblcTDoc2.SetFocus;
      Exit;
   end;
end;


procedure TFPagoFacturasCobrar.RecCptosDifC;
begin
    if trim(dblcCCBco.Text) = '' then
     begin
       if not DMTE.RecuperarDatos('TGE105','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP,CCOSDIF','BANCOID=''' + dblcBanco.Text + '''' )  then
          Raise exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio') ;
     end
    else
     begin
       if not DMTE.RecuperarDatos('TGE106','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP,CCOSDIF','BANCOID=''' + dblcBanco.Text +
                                 ''' AND CCBCOID=''' + dblcCCBco.Text + '''' )  then
          Raise exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio') ;
     end ;
    wCptoGan  := DMTE.cdsRec.fieldbyname('CPTODIFG').AsString ;
    wCptoPer  := DMTE.cdsRec.fieldbyname('CPTODIFP').AsString ;
    wCtaGan   := DMTE.cdsRec.fieldbyname('CTADIFG').AsString ;
    wCtaPer   := DMTE.cdsRec.fieldbyname('CTADIFP').AsString ;
    wCCosDif  := DMTE.cdsRec.fieldbyname('CCOSDIF').AsString ;
end;

procedure TFPagoFacturasCobrar.dbeLoteExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then exit;

   dbeLote.text:=DMTE.StrZero(dbeLote.text,DMTE.cdsEgrCaja.FieldByName('ECLOTE').Size);
end;

procedure TFPagoFacturasCobrar.dbeTCambioEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFPagoFacturasCobrar.dbeTCambioExit(Sender: TObject);
begin
   if strTmp <> dbeTCambio.text then
   begin
      dbeTcambio.text := CajaDec(dbeTCambio.text,4) ;
   end ;
end;

procedure TFPagoFacturasCobrar.dblcBancoExit(Sender: TObject);
begin
  if dblcCia.Focused then Exit;

  edtBanco.text:=DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr,'BANCOID',dblcBanco.Text,'BANCOABR') ;

  if edtBanco.Text='' then begin
     dblcBanco.Value:= '';
     edtBanco.Text  := '';
     ShowMessage('Error : Banco no Valido');
     dblcBanco.SetFocus;
     Exit;
  end;

  dblcCCBco.Text:= '' ;
  edtCuenta.Text:= '' ;
  dblcdCnp.Text := '' ;
  dbeGlosa.Text := '' ;
  dblcTMon.Text := '' ;
  edtTMon.Text  := '' ;
  if DMTE.cdsbancoegr.FieldByName('BCOTIPCTA').Value='C' then
  begin //Si es CAJA
     dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco.text),'CCBCOVOUCH');
     dblcTDiario.OnExit(dblcTDiario);
     dblcCCBco.Enabled:=False;
     dblcTMon.Enabled := True ;
     edtCuenta.Text := DMTE.DisplayDescrip('prvTGE','TGE105','CUENTAID','BANCOID='+quotedstr(dblcBanco.text),'CUENTAID');
  	 DMTE.cdsFormPago.Filter := 'FEFE=''1'' or FEFE=''S'' ' ;
  	 DMTE.cdsFormPago.Filtered := True ;
  	 dbeNoChq.Enabled  :=False;
  	 dbdtpFEmis.Enabled:=False;
  end
  else begin  //Si es BANCO
     dblcCCBco.Enabled:=True;
     dblcTMon.Enabled := False ;
     dblcFormPago.Enabled := False ;
     DMTE.cdsCCBco.Filtered:=False;
     DMTE.cdsCCBco.Filter:='';   //Filtrar la lista de CtaCte por Banco
     DMTE.cdsCCBco.Filter:='BANCOID='+''''+dblcBanco.Text+''''+' AND CIAID='+quotedstr(dblcCia.text);
     DMTE.cdsCCBco.Filtered:=True;
     //filtrar los tipos de pago
     DMTE.cdsFormPago.Filter := 'FCBCO=''1'' or FCBCO=''S'' ' ;
     DMTE.cdsFormPago.Filtered := true ;
  	 dblcCCBco.setfocus;
  end;

  if DMTE.cdsFormPago.RecordCount > 1 then
  begin
		 dblcFormPago.Enabled := True;
     dblcFormPago.text := '' ;
     edtFormPago.text := '' ;
  end
  else
     dblcFormPago.Enabled := False;

  dblcFormPago.text := DMTE.cdsFormPago.FieldByName('FPAGOID').AsString;
  dbeNoChq.Text := '' ;
  wmodifica:=True;
end;

procedure TFPagoFacturasCobrar.dblcCCBcoEnter(Sender: TObject);
begin
   strTmp := dblcCCBco.Text ;
end;

procedure TFPagoFacturasCobrar.dblcCCBcoExit(Sender: TObject);
var
   Tmp : String ;
begin

   if dblcCia.Focused   then Exit;
   if dblcBanco.Focused then Exit;

   tmp:=DMTE.DisplayDescripLocal(DMTE.cdsCCBco,'CCBCOID',dblcCCBco.Text,'CCBCOID') ;

	 if Tmp='' then
	 begin
      edtCuenta.Text:= '' ;
      dblcdCnp.Text := '' ;
      dbeGlosa.Text := '' ;
      ShowMessage('Error : Cuenta Corriente No Valida');
		  dblcccbco.SetFocus;
		  exit;
	 end;

	 dblcTmon.Text := DMTE.cdsCCBco.fieldbyname('TMONID').AsString ;
	 edtTMon.Text  := DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMon.text,'TMONDES') ;
	 dbeNOChq.Text := '' ;

   edtCuenta.Text:= DMTE.cdsCCBco.fieldbyname('CTAPRINC').AsString ;
   dblcdCnp.Text := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID','CPTOID='+quotedstr(DMTE.cdsCCBco.fieldbyname('CPTOID').AsString),'CPTOID');
   dbeGlosa.Text := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTODES','CPTOID='+quotedstr(dblcCCBco.text),'CPTODES');  //  DMTE.cdsCCBcoLKGLOSA.AsString ;
   xVoucher      := DMTE.cdsCCBco.fieldbyname('CCBCOVOUCH').AsString;
           //**
   If DMTE.wModo = 'A' then
   begin
      //dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco.text)+' AND CCBCOID='+quotedstr(dblcCCBco.text),'CCBCOVOUCH');
      dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','CIAID='''+dblcCia.Text+''' and BANCOID='+quotedstr(dblcBanco.text)+' AND CCBCOID='+quotedstr(dblcCCBco.text),'CCBCOVOUCH');
      dblcTDiario.OnExit(dblcTDiario);
   end;

   if DMTE.cdsFormPago.RecordCount = 1 then
      dblcformpago.Enabled := false
   else
      dblcformpago.Enabled := true;

   wmodifica:=True;
end;

procedure TFPagoFacturasCobrar.dblcClaseExit(Sender: TObject);
var
   xSQLx : string ;
begin

   edtClase.text:= DMTE.DisplayDescripLocal(DMTE.cdsClaseAux,'CLAUXID',dblcClase.Text,'CLAUXDES') ;

   if edtClase.Text='' then begin
      dblcdAux.Text  := '' ;
			edtAuxRUC.Text := '' ;
			lblSujetoRetencion.visible:=False;
      dbeGiradoA.Text:= '' ;
      ShowMessage('Error : Clase de Auxiliar');
      dblcClase.SetFocus;
      Exit;
   end;

   xSQLx:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+'''';
   DMTE.cdsAux.Close;
   DMTE.cdsAux.DataRequest( xSQLx ) ;
   DMTE.cdsAux.Open;
end;

procedure TFPagoFacturasCobrar.dblcdAuxExit(Sender: TObject);
var
   xSql, xAuxt: string ;
begin
	 if z2bbtnCancel.Focused then exit;
	 if dblcClase.Focused    then Exit ;

	 xAuxt:= DMTE.DisplayDescripLocal(DMTE.cdsAux,'AUXID',dblcdAux.Text,'AUXID') ;

	 if xAuxt='' then begin
			dblcdAux.Text  := '' ;
			edtAuxRUC.Text := '' ;
			lblSujetoRetencion.visible:=False;
			dbeGiradoA.Text:= '' ;
			ShowMessage('Error : Auxiliar No Valido');
			dblcdAux.SetFocus;
			Exit;
	 end;

	 if DMTE.cdsAux.FieldByName('AUXGIRA').AsString='' then
			dbeGiradoA.Text := DMTE.cdsAux.FieldByName('AUXNOMB').Asstring
	 else
			dbeGiradoA.Text := DMTE.cdsAux.FieldByName('AUXGIRA').Asstring ;

      lblSujetoRetencion.visible:=((DMTE.DisplayDescrip('prvTGE','CNT201','PROVRETIGV',
															 'CLAUXID = ''' +
															 dblcClase.text
																+ ''' AND AUXID=''' + dblcdAux.Text + '''','PROVRETIGV')='S') AND (wCiaRetIGV)) ;
	 edtAuxRuc.Text:= DMTE.cdsAux.FieldByName('AUXRUC').Asstring;
   xDirAux       := DMTE.cdsAux.FieldByName('AUXDIR').Asstring;

   xSql := 'SELECT * FROM CAJA102 WHERE PROV='+quotedstr(trim(dblcdAux.Text))+' ORDER BY CCBCOID';
   DMTE.cdsProvCta.Close;
   DMTE.cdsProvCta.DataRequest(xSql);
   DMTE.cdsProvCta.Open
end;

procedure TFPagoFacturasCobrar.dblcFormPagoExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then exit;
   if dblcTMon.Focused then exit;

   edtFormPago.text:= DMTE.DisplayDescripLocal(DMTE.cdsFormPago,'FPAGOID',dblcFormPago.Text,'FPAGODES') ;

   if dblcFormPago.Text='' then begin
      dbeNoChq.Text :='';
      ShowMessage('Error : Forma de Pago no Valida');
      dblcFormPago.SetFocus;
      Exit;
   end;

   if DMTE.cdsFormPago.FieldByName('FCANJE').AsString='S' then
   begin
      DMTE.abreCuentas(dblcCia.text) ;
      edtCuenta.Enabled  := True;
      edtCuenta.setfocus;
   end
   else begin
      edtCuenta.Enabled  := False ;
      edtAuxpnl.Visible  := false;
      edtclasepnl.Visible:= false;
   end;

   if DMTE.cdsFormPago.FieldByName('FCANJE').AsString= 'A' then
   begin
      dblcdCtaCte.LookupTable:= DMTE.cdsProvCta;
      dblcdCtaCte.Enabled    := True;
      dblcdCtaCte.setfocus;
   end
   else
      dblcdCtaCte.Enabled := False;

   if (DMTE.cdsFormPago.FieldByName('FCHQ').AsString='1') or
      (DMTE.cdsFormPago.FieldByName('FCHQ').AsString='S') then
   begin
      dbeNoChq.Enabled  :=True  ;
      dbdtpFEmis.Enabled:= True ;
      dbeNoChq.SetFocus;
   end
   else
   begin
      dbeNoChq.Enabled  := False;
      dbdtpFEmis.Enabled:= False ;
   end;

end;

procedure TFPagoFacturasCobrar.dblcTMonExit(Sender: TObject);
var
   xWhere :String;
begin
   if z2bbtnCancel.Focused then exit;

   edtTMon.text:= DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMon.Text,'TMONDES') ;

   if edtTMon.Text='' then begin
      edtTmon.text   :='';
      dbeTCambio.Text:='';
      dblcTMon.Text  :='';
      ShowMessage('Error : Moneda no Valida');
      dblcTMon.SetFocus;
      Exit;
   end;

end;

procedure TFPagoFacturasCobrar.dblcdCnpExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then exit;
   if dbeLote.Focused      then exit;

   dbeGlosa.text := DMTE.DisplayDescripLocal(DMTE.cdsCnpEgr,'CPTOID',dblcdCnp.Text,'CPTODES') ;

   if dbeGlosa.text='' then begin
      ShowMessage('Error : Concepto no Valido');
      dblcdCnp.SetFocus;
   end;
end;

procedure TFPagoFacturasCobrar.BorraGrid;
begin
    with DMTE.cdsDocPago do
    begin
       if RecordCount <> 0 then
       begin
          DisableControls ;
          first ;
          while not eof do
          begin
             delete ;
          end;
          EnableControls ;
       end ;
    end ;
end;

procedure TFPagoFacturasCobrar.dblcClaseDetExit(Sender: TObject);
begin
   if z2bbtnCancel3.Focused then exit;
   if dblcdCnp2.Focused     then exit;

   edtClaseDet.text:= DMTE.DisplayDescripLocal(DMTE.cdsClaseAux,'CLAUXID',dblcClaseDet.Text,'CLAUXDES') ;

   if edtClaseDet.Text='' then begin
      dblcdAuxDet.Text := '' ;
      dbeAuxDet.Text := '' ;
      ShowMessage('Error : Clase de Auxiliar no Valido');
      dblcClaseDet.SetFocus;
      Exit;
   end;
end;

procedure TFPagoFacturasCobrar.dblcdAuxExit2(Sender: TObject);
begin
   if dblcClaseDet.Focused then Exit;
   if z2bbtnCancel3.Focused then exit;
   if dblcdCnp2.Focused     then exit;

   dbeAuxDet.text:= DMTE.DisplayDescripLocal(DMTE.cdsAux,'AUXID',dblcdAuxDet.Text,'AUXNOMB') ;

   if dbeAuxDet.Text='' then begin
      ShowMessage('Error : Auxiliar no Valido');
      dblcdAuxDet.SetFocus;
      Exit;
   end;
end;

procedure TFPagoFacturasCobrar.dblcdCnp2Exit2(Sender: TObject);
var
   ssql,xwhere : string ;
begin
   if z2bbtnCancel3.Focused then exit;

   xWhere:='CPTOID='''+dblcdCnp2.Text+'''AND CPTOIS=''E''';
   edtCnp2.text:=DMTE.DisplayDescripLocal(cdsConceptoC1,'CPTOID',dblcdCnp2.Text,'CPTODES') ;

   if edtCnp2.Text='' then begin
      DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString := '' ;
      dblcdAuxDet.Enabled := False ;
      dblcdCCosto.Enabled := False ;
      ShowMessage('Error : Concepto no Valido');
      dblcTDoc2.SetFocus;
      Exit;
   end;
                                                   //DMTE.cdsCnpEgr
   DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString:=cdsConceptoC1.FieldByname('CUENTAID').AsString;
   DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString  :=edtCnp2.text;

   xWhere:='CIAID='''+dblcCia.Text+''' AND CUENTAID='''+DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString+'''';

   DMTE.DisplayDescrip('prvTGE','TGE202','CUENTAID, CTA_CCOS, CTA_AUX',xWhere,'CuentaId');

   if DMTE.cdsQry.fieldbyname('CTA_AUX').AsString='S' then
   begin
      dblcdAuxDet.Enabled :=True;
      dblcClaseDet.Enabled:=True;
      dblcClaseDet.SetFocus;
   end
   else begin
      DMTE.cdsRegCxP.FieldByName('PROV').AsString    := '' ;
      DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString := '' ;
      edtClaseDet.Text    := '' ;
      dbeAuxDet.Text      := '' ;
      dblcClaseDet.Enabled:= False;
      dblcdAuxDet.Enabled := False;
   end;

   if DMTE.cdsQry.fieldbyname('CTA_CCOS').AsString='S' then
   begin
      ssql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
      DMTE.cdsCCosto.Close;
      DMTE.cdsCCosto.DataRequest(ssql);
      DMTE.cdsCCosto.open;
      dblcdCCosto.Enabled:=true;
      if not dblcClaseDet.Enabled then
         dblcdCCosto.SetFocus;
   end
   else begin
      DMTE.cdsRegCxP.FieldByName('CCOSID').AsString := '' ;
      dblcdCCosto.Enabled := False ;
   end;

end;

procedure TFPagoFacturasCobrar.edtCnp2Change2(Sender: TObject);
begin
//DMTE.cdsRegCxPCUENTAID.Value:=edtCnp2.Text;
end;

procedure TFPagoFacturasCobrar.wwDBEdit1Change22(Sender: TObject);
begin
    wmodifica:=True;
end;
procedure TFPagoFacturasCobrar.FormDestroy(Sender: TObject);
begin
   cf1.Free ;
end;

procedure TFPagoFacturasCobrar.dblcdFEfecEnter(Sender: TObject);
begin
   strTmp := dblcdFEfec.Text ;
end;

procedure TFPagoFacturasCobrar.dblcdFEfecExit(Sender: TObject);
begin
//Validacion
  if trim(TCustomEdit(Sender).Text) <> strTmp then
  begin
     if trim(TCustomEdit(Sender).Text) <> '' then
     begin
        if DMTE.RecuperarDatos('TGE217','FLUEFEABR','FLUEFEID=''' + TCustomEdit(Sender).Text + ''' ') then
        begin
          dbeFEfec.Text := DMTE.cdsRec.fieldbyname('FLUEFEABR').AsString ;
        end
        else
        begin
          TCustomEdit(Sender).Text := '' ;
          dbeFEfec.Text := ''
        end ;
     end
     else
        dbeFEfec.Text := ''
  end ;
  TCustomEdit(Sender).Text := trim(TCustomEdit(Sender).Text) ;
end;

procedure TFPagoFacturasCobrar.ActDetCaja;
begin
   if not DMTE.cdsRegCxP.Eof then
   begin   //Hay documentos en el detalle
      DMTE.cdsRegCxP.DisableControls ;
      DMTE.cdsRegCxP.First ;
      While not DMTE.cdsRegCxP.Eof do
      Begin
        DMTE.cdsRegCxP.Edit ;
        DMTE.cdsRegCxP.FieldByName('DETCPAG').Value  := strtofloat(dbeTCambio.Text) ;
        if DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc then
        begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat ;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat := DMTE.FRound( DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat,15,2 ) ;
        end
        else
        begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat * DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat ;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat ;
        end ;
        DMTE.cdsRegCxP.Next;
      end ;
      DMTE.cdsRegCxP.First ;
      DMTE.cdsRegCxP.EnableControls ;
   end ;
	 xTC := strtocurr( dbeTCambio.Text ) ;
end;

procedure TFPagoFacturasCobrar.ActDetCxP ;
var
   evt1 : TFieldNotifyEvent ;
   evt2 : TFieldNotifyEvent ;
   evt3 : TFieldNotifyEvent ;
begin
   evt1 := DMTE.cdsDocPago.FieldByName('DEMTOLOC').OnChange ;
   evt2 := DMTE.cdsDocPago.FieldByName('DEMTOEXT').OnChange ;
   evt3 := DMTE.cdsDocPago.FieldByName('DETCPAG').OnChange  ;

   if not DMTE.cdsDocPago.Eof then
   begin   //Hay documentos en el detalle
      DMTE.cdsDocPago.DisableControls ;
      DMTE.cdsDocPago.First ;
      While not DMTE.cdsDocPago.Eof do
      Begin
        DMTE.cdsDocPago.Edit ;
        DMTE.cdsDocPago.FieldByName('DEMTOLOC').OnChange := nil ;
        DMTE.cdsDocPago.FieldByName('DEMTOEXT').OnChange := nil ;
        DMTE.cdsDocPago.FieldByName('DETCPAG').OnChange  := nil ;
         DMTE.cdsDocPago.FieldByName('DETCPAG').Value  := StrToCurr(dbeTCambio.Text) ;
         with DMTE do
         begin
            if dblcTMon.Text = DMTE.wtMonLoc then
            begin
               cdsDocPago.FieldByName('DESALEXT').AsFloat := DMTE.FRound( cdsDocPago.FieldByName('DESALLOC').AsFloat / cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 ) ;
							 cdsDocPago.FieldByName('DEMTOEXT').AsFloat := DMTE.FRound( cdsDocPago.FieldByName('DEMTOLOC').AsFloat / cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 ) ;
            end
            else
            begin
               cdsDocPago.FieldByName('DESALLOC').AsFloat :=cdsDocPago.FieldByName('DESALEXT').AsFloat * cdsDocPago.FieldByName('DETCPAG').AsFloat ;
               cdsDocPago.FieldByName('DEMTOLOC').AsFloat :=cdsDocPago.FieldByName('DEMTOEXT').AsFloat * cdsDocPago.FieldByName('DETCPAG').AsFloat ;
            end ;
         end ;

        DMTE.cdsDocPago.Next ;
      end ;
      DMTE.cdsDocPago.FieldByName('DEMTOLOC').OnChange := evt1 ;
      DMTE.cdsDocPago.FieldByName('DEMTOEXT').OnChange := evt2 ;
      DMTE.cdsDocPago.FieldByName('DETCPAG').OnChange  := evt3 ;

      DMTE.cdsDocPago.First ;
      DMTE.cdsDocPago.EnableControls ;
      xTC := strtocurr( dbeTCambio.Text ) ;
   end ;
end;

procedure TFPagoFacturasCobrar.ActualizaFiltro;
begin
end;

procedure TFPagoFacturasCobrar.AsignaCDSFiltro(cds: TwwClientDataset);
begin
    cdsFiltro := cds ;
end;

procedure TFPagoFacturasCobrar.ActualizaDetCanje;
begin
   // ABRIR DETALLE DE CANJE
   DMTE.cdsDetCanjeCxC.close ;
   DMTE.cdsDetCanjeCxC.DataRequest('SELECT * FROM CXC305 WHERE CIAID = ''''') ;
   DMTE.cdsDetCanjeCxC.Open  ;

   DMTE.cdsDocPago.DisableControls;
   DMTE.cdsDocPago.First;

   While not DMTE.cdsDocPago.Eof do
   begin
      DMTE.cdsDetCanjeCxC.Insert;
      DMTE.cdsDetCanjeCxC.FieldByName('CIAID').Value    := DMTE.cdsDocPago.FieldByName('CIAID').Value   ;
      DMTE.cdsDetCanjeCxC.FieldByName('CLIEID').Value   := DMTE.cdsDocPago.FieldByName('PROV').Value    ;
      DMTE.cdsDetCanjeCxC.FieldByName('CLIERUC').Value  := DMTE.cdsDocPago.FieldByName('PROVRUC').Value ;
      //CIM 18/11/2002 A PEDIDO DE JCC
      DMTE.cdsDetCanjeCxC.FieldByName('DOCID2').Value    := DMTE.cdsDocPago.FieldByName('DOCID2').value;
      DMTE.cdsDetCanjeCxC.FieldByName('CCSERIE2').Value  := DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
      DMTE.cdsDetCanjeCxC.FieldByName('CCNODOC2').Value  := DMTE.cdsDocPago.FieldByName('CPNODOC').Value;

			DMTE.cdsDetCanjeCxC.FieldByName('DOCID').Value    := DMTE.DisplayDescrip('prvTGE','TGE110','DOCID','DOC_FREG=''E'' AND DOCMOD=''CXC'' ','DOCID');
			DMTE.cdsDetCanjeCxC.FieldByName('CCSERIE').Value  := '000';
      DMTE.cdsDetCanjeCxC.FieldByName('CCNODOC').Value  := 'VOU-'+dbeNoComp.text;
      //*
      DMTE.cdsDetCanjeCxC.FieldByName('CCNOREG').Value  := DMTE.cdsDocPago.FieldByName('CPNOREG').Value;
      DMTE.cdsDetCanjeCxC.FieldByName('TCANJEID').Value := 'DA' ;
      DMTE.cdsDetCanjeCxC.FieldByName('CCCANJE').Value := '000' ;
      DMTE.cdsDetCanjeCxC.FieldByName('CCFCANJE').AsDateTime  := dbdtpFComp.Date ;
      DMTE.cdsDetCanjeCxC.FieldByName('TMONID').Value   := DMTE.cdsDocPago.FieldByName('TMONID').Value;


      if dblcTMon.Text=DMTE.wTMonLoc then
        DMTE.cdsDetCanjeCxC.FieldByName('DCCMTOORI').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').Value,15,2)
      else
         if dblcTMon.Text=DMTE.wTMonExt then
        DMTE.cdsDetCanjeCxC.FieldByName('DCCMTOORI').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').Value,15,2);

      DMTE.cdsDetCanjeCxC.FieldByName('DCCMTOLOC').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').Value,15,2);
      DMTE.cdsDetCanjeCxC.FieldByName('DCCMTOEXT').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').Value,15,2);

      DMTE.cdsDetCanjeCxC.FieldByName('DCCUSER').AsString  := DMTE.wUsuario;
      DMTE.cdsDetCanjeCxC.FieldByName('DCCFREG').AsDateTime:= DateS;
      DMTE.cdsDetCanjeCxC.FieldByName('DCCHREG').AsDateTime:= Time;
      DMTE.cdsDetCanjeCxC.FieldByName('DCCTCAMB').AsFloat  := StrToFloat(dbeTCambio.text);

      if DMTE.BuscaFecha('TGE114','Fecha','FECHA',dbdtpFComp.Date ) then
      begin
        DMTE.cdsDetCanjeCxC.FieldByName('DCCANOMM').AsString := DMTE.cdsQry.FieldByName('FECANO').AsString+DMTE.cdsQry.FieldByName('FECMES').AsString;
        DMTE.cdsDetCanjeCxC.FieldByName('DCCAAAA').AsString  := DMTE.cdsQry.FieldByName('FECANO').AsString;
        DMTE.cdsDetCanjeCxC.FieldByName('DCCMM').AsString    := DMTE.cdsQry.FieldByName('FECMES').AsString;
        DMTE.cdsDetCanjeCxC.FieldByName('DCCDD').AsString    := DMTE.cdsQry.FieldByName('FECDIA').AsString;
        DMTE.cdsDetCanjeCxC.FieldByName('DCCTRI').AsString   := DMTE.cdsQry.FieldByName('FECTRIM').AsString;
        DMTE.cdsDetCanjeCxC.FieldByName('DCCSEM').AsString   := DMTE.cdsQry.FieldByName('FECSEM').AsString;
        DMTE.cdsDetCanjeCxC.FieldByName('DCCSS').AsString    := DMTE.cdsQry.FieldByName('FECSS').AsString;
        DMTE.cdsDetCanjeCxC.FieldByName('DCCAATRI').AsString := DMTE.cdsQry.FieldByName('FECAATRI').AsString;
        DMTE.cdsDetCanjeCxC.FieldByName('DCCAASEM').AsString := DMTE.cdsQry.FieldByName('FECAASEM').AsString;
        DMTE.cdsDetCanjeCxC.FieldByName('DCCAASS').AsString  := DMTE.cdsQry.FieldByName('FECAASS').AsString;
      end;

      DMTE.cdsDocPago.Next;
   end;
   DMTE.cdsDocPago.First ;
   DMTE.cdsDocPago.EnableControls ;

   DMTE.cdsDetCanjeCxC.Post;
   DMTE.AplicaDatos(DMTE.cdsDetCanjeCxC,'DETCANJECXC');
   DMTE.cdsDetCanjeCxC.Close ;
   //////////////////////////
end;

procedure TFPagoFacturasCobrar.Buscar1Click2(Sender: TObject);
begin
//  lkdCxP.LookupTable := DMTE.cdsMovCxP ;
  lkdCxP.LookupTable := DMTE.cdsMovCxC ;
  lkdCxP.Execute ;
end;

procedure TFPagoFacturasCobrar.lkdCxPCloseDialog(Dialog: TwwLookupDlg);
begin
   lkdCxP.LookupTable := nil ;
end;

procedure TFPagoFacturasCobrar.lkdCxPInitDialog(Dialog: TwwLookupDlg);
begin
    Dialog.wwDBGrid1.TitleLines := 2 ;
    Dialog.wwDBGrid1.Selected.clear ;
    Dialog.wwDBGrid1.Selected.Assign( dbgPendientes.Selected ) ;
    Dialog.Width := 400 ;
end;

//** 01/12/2000 - pjsv
procedure TFPagoFacturasCobrar.edtCuentaExit(Sender: TObject);
var
 ssql : string;
 sWhere : String;
begin
   if z2bbtnCancel.Focused then exit;
   if dblcFormPago.Focused then exit;

  ssql:='';
	ssql:='SELECT * FROM TGE202 '
       +'WHERE CIAID='   +quotedstr(dblccia.Text  ) +' AND '
       +      'CUENTAID='+quotedstr(edtCuenta.text);
  DMTE.cdsQry2.Close;
  DMTE.cdsQry2.DataRequest(ssql);
  DMTE.cdsQry2.open;
  if (DMTE.cdsQry2.fieldbyname('CTA_AUX').AsString = 'S') THEN
  begin
     ssql :='';
     ssql := 'CLAUXID='+quotedstr(DMTE.cdsEgrCaja.fieldbyname('CLAUXID1').AsString);
     edtclasepnl.Text := DMTE.DisplayDescrip('prvClaseAux','TGE102','CLAUXDES',sWhere,'CLAUXDES');
     ssql :='';
     ssql := 'AUXID='+quotedstr(DMTE.cdsEgrCaja.fieldbyname('AUXID').AsString);
     edtAuxpnl.Text := DMTE.DisplayDescrip('prvQry2','CNT201','AUXNOMB',sWhere,'AUXNOMB');
     pnlCabecera2.Enabled := false;
  end
  else begin
     edtAuxpnl.Text := '';
     edtAuxpnl.visible := false;
     edtclasepnl.Text := '';
     edtclasepnl.visible := false;
    end;
   //**
end;

procedure TFPagoFacturasCobrar.Limpiapnlaux;
begin
   edtAuxpnl.visible := false;
   edtAuxpnl.text := '';
	 edtclasepnl.visible := false;
   edtclasepnl.text := '';
end;

procedure TFPagoFacturasCobrar.dbeNoChqExit(Sender: TObject);
var
 xSql : string;
begin
  xSql:='CIAID='+quotedstr(dblcCia.text)+' AND TDIARID='+quotedstr(dblcTDiario.text)+' and '
       +'ECNOCOMP<>'+quotedstr( dbeNoComp.Text )+' and '
			 +'CCBCOID='+quotedstr(dblcCCBco.Text)+' AND ECNOCHQ='+quotedstr(dbeNoChq.text)
			 +' AND ECESTADO<>''A'' ';
  If DMTE.DisplayDescrip('prvTGE','CAJA302','ECNOCHQ',xsql,'ECNOCHQ') <> '' then
   begin
    showmessage('El número de Cheque ya fue Utilizado');
    dbeNoChq.Text := '';
    dbeNoChq.SetFocus;
   end;
end;
//**

procedure TFPagoFacturasCobrar.DescripPagoFact(const xCIAID, xECANOMM, xTDIARID, xECNOCOMP: String);
var xSQL : String ;
begin
  if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
    xSQL := 'SELECT TGE105.BANCOABR, TGE103.TMONABR, TGE106.CCBCODES, TGE112.FPAGOABR, ' +
               'TGE102.CLAUXABR, TGE110.DOCABR, CNT201.AUXABR, TGE101.CIADES, '          +
               'TGE104.TDIARABR, TGE217.FLUEFEABR '                                      +
            'FROM CAJA302 '                                                              +
							 'LEFT JOIN TGE105 ON (CAJA302.BANCOID = TGE105.BANCOID) '                 +
               'LEFT JOIN TGE106 ON (CAJA302.BANCOID = TGE106.BANCOID) '                 +
                               'AND (CAJA302.CCBCOID = TGE106.CCBCOID) '                 +
               'LEFT JOIN TGE103 ON (CAJA302.TMONID = TGE103.TMONID) '                   +
               'LEFT JOIN TGE112 ON (CAJA302.FPAGOID = TGE112.FPAGOID) '                 +
               'LEFT JOIN TGE102 ON (CAJA302.CLAUXID = TGE102.CLAUXID) '                 +
               'LEFT JOIN TGE110 ON (CAJA302.DOCID = TGE110.DOCID) '                     +
               'LEFT JOIN CNT201 ON (CAJA302.PROV = CNT201.AUXID '                       +
                               'AND CAJA302.CLAUXID =CNT201.CLAUXID) '                   +
               'LEFT JOIN TGE101 ON (CAJA302.CIAID = TGE101.CIAID) '                     +
               'LEFT JOIN TGE104 ON (CAJA302.TDIARID = TGE104.TDIARID) '                 +
               'LEFT JOIN TGE217 ON (CAJA302.FLUEID = TGE217.FLUEFEID) '                 +
            'WHERE CAJA302.CIAID='''  + xCIAID    +''' AND '                             +
                'CAJA302.TDIARID='''  + xTDIARID  +''' AND '                             +
                'CAJA302.ECANOMM='''  + xECANOMM  +''' AND '                             +
                'CAJA302.ECNOCOMP=''' + xECNOCOMP +''' '
  else
	  if DMTE.SRV_D = 'ORACLE' then
      xSQL := 'SELECT TGE105.BANCOABR, TGE103.TMONABR, TGE106.CCBCODES, '               +
                     'TGE112.FPAGOABR, TGE102.CLAUXABR, TGE110.DOCABR, CNT201.AUXABR, ' +
                     'TGE101.CIADES, TGE104.TDIARABR, TGE217.FLUEFEABR '                +
                  'FROM CAJA302, TGE105, TGE106, TGE103, TGE112, TGE102, '              +
                        ' TGE110, CNT201, TGE101, TGE104, TGE217 '                      +
                  'WHERE CAJA302.CIAID='''  + xCIAID    +''' AND '                      +
                      'CAJA302.TDIARID='''  + xTDIARID  +''' AND '                      +
                      'CAJA302.ECANOMM='''  + xECANOMM  +''' AND '                      +
                      'CAJA302.ECNOCOMP=''' + xECNOCOMP +''' '                          +
                      ' AND (CAJA302.BANCOID = TGE105.BANCOID (+) ) '                   +
                      ' AND (CAJA302.BANCOID = TGE106.BANCOID (+) ) '                   +
											' AND (CAJA302.CCBCOID = TGE106.CCBCOID (+) ) '                   +
                      ' AND (CAJA302.TMONID = TGE103.TMONID (+) ) '                     +
                      ' AND (CAJA302.FPAGOID = TGE112.FPAGOID (+) ) '                   +
                      ' AND (CAJA302.CLAUXID = TGE102.CLAUXID (+) ) '                   +
                      ' AND (CAJA302.DOCID = TGE110.DOCID (+) ) '                       +
                      ' AND (CAJA302.PROV = CNT201.AUXID (+) )'                         +
                      ' AND (CAJA302.CLAUXID =CNT201.CLAUXID (+) ) '                    +
                      ' AND (CAJA302.CIAID = TGE101.CIAID (+) ) '                       +
                      ' AND (CAJA302.TDIARID = TGE104.TDIARID (+) ) '                   +
                      ' AND (CAJA302.FLUEID = TGE217.FLUEFEID (+) ) '                   ;
  DMTE.cdsDescrip.close;
  DMTE.cdsDescrip.dataRequest(xSQL) ;
end;

procedure TFPagoFacturasCobrar.ppHeaderBand2BeforePrint(Sender: TObject);
begin
    pplblCia.text       := edtCia.text;
    ppdbtCiaRuc.text    := DMTE.DisplayDescrip('prvTGE','TGE101','CIARUC','CIAID='+quotedstr(dblcCia.text),'CIARUC');
    pplblNumero.text    := dbeNoComp.text;
    pplblNombreCli.text := dbeGiradoA.text;
    pplblNRucCli.text   := edtAuxRuc.text;
    pplblNDirCli.text   := xDirAux;
    pplblNCtaCte.text   := dblcdCtaCte.text;
end;

procedure TFPagoFacturasCobrar.Z2bbtnNotaAbonoClick(Sender: TObject);
begin
	 //JCC: 24/06/2002
	 pprptNotaAbono.TEMPLATE.FileName := wRutaRpt + '\NotaAbono.rtm';
	 pprptNotaAbono.template.LoadFromFile ;
   pprptNotaAbono.print;
end;

procedure TFPagoFacturasCobrar.ppDetailBand2BeforePrint(Sender: TObject);
begin
   If DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC','TMONID='+quotedstr(dblcTMon.text),'TMON_LOC') = 'L' then
    begin
     ppdbMonto.DataField := 'DEMTOLOC';
     ppdbcTotal.DataField := 'DEMTOLOC';
    end
   else
    begin
     ppdbMonto.DataField := 'DEMTOEXT';
     ppdbcTotal.DataField := 'DEMTOEXT';
    end;
   pplblConcepto.Text := dblcdCnp.text;
   ppmmGlosa.Text := dbeGlosa.text;
   ppMoneda1.text := edtTMon.text;
   pplblMoneda.text := edtTMon.text;
end;

procedure TFPagoFacturasCobrar.dbeTCExit(Sender: TObject);
begin
   if DMTE.cdsDocPago.fieldbyName('TMONID').asString = DMTE.wtMonLoc then
   begin
      DMTE.cdsDocPago.fieldbyName('DESALEXT').asFloat:=DMTE.FRound( DMTE.cdsDocPago.fieldbyName('DESALLOC').asFloat / DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
      DMTE.cdsDocPago.fieldbyName('DEMTOEXT').asFloat:=DMTE.FRound( DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat / DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
   end
	 else
   begin
      DMTE.cdsDocPago.fieldbyName('DESALLOC').asFloat:=DMTE.FRound( DMTE.cdsDocPago.fieldbyName('DESALEXT').asFloat * DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2) ;
      DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat:=DMTE.FRound( DMTE.cdsDocPago.fieldbyName('DEMTOEXT').asFloat * DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2) ;
   end ;
end;

procedure TFPagoFacturasCobrar.dbeMPLExit(Sender: TObject);
var
   xSaldo,xMonto : double ;
begin
   DMTE.cdsDocPago.Edit ;

   if DMTE.cdsdocpago.FieldByName('TMONID').AsString = DMTE.wTMonExt then
   begin
      xMonto := DMTE.FRound( DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat / DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
      xSaldo := DMTE.cdsDocPago.fieldbyName('DESALEXT').asFloat ;                                ;
   end
   else
   begin
      xMonto := DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat                                ;
      xSaldo := DMTE.cdsDocPago.fieldbyName('DESALLOC').asFloat                                ;
   end ;

   if DMTE.FRound(xMonto,15,2) > DMTE.FRound( xSaldo,15,2 ) then
   begin
      ShowMessage('Monto excede a Saldo Actual');
      DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat :=0;
   end
	 else
   begin
      DMTE.cdsDocPago.fieldbyName('DEMTOEXT').asFloat:=DMTE.FRound( DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat / DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
   end;
end;

procedure TFPagoFacturasCobrar.dbeMPEExit(Sender: TObject);
var
   xMonto, xSaldo : double ;
begin
   DMTE.cdsDocPago.Edit ;

   if DMTE.cdsdocpago.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
   begin
      xMonto := DMTE.FRound( DMTE.cdsDocPago.FieldByName('DEMTOEXT').asFloat * DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2) ;
      xSaldo := DMTE.cdsDocPago.FieldByName('DESALLOC').asFloat ;
   end
   else begin
      xMonto := DMTE.cdsDocPago.FieldByName('DEMTOEXT').asFloat ;
      xSaldo := DMTE.cdsDocPago.FieldByName('DESALEXT').asFloat ;
   end ;

   if DMTE.FRound(xMonto,15,2 ) > DMTE.FRound ( xSaldo,15,2 ) then
   begin
      ShowMessage('Monto excede a Saldo Actual');
      DMTE.cdsDocPago.Edit;
      DMTE.cdsDocPago.FieldByName('DEMTOEXT').asFloat := 0 ;
   end
   else begin
			DMTE.cdsDocPago.FieldByName('DEMTOLOC').asFloat:=DMTE.FRound( DMTE.cdsDocPago.FieldByName('DEMTOEXT').asFloat * DMTE.cdsDocPago.FieldByName('DETCPAG').asFloat, 15, 2);
   end;
end;

procedure TFPagoFacturasCobrar.isBuscaExit(Sender: TObject);
begin
   pnlBusca.Visible:=False;
end;

procedure TFPagoFacturasCobrar.dbgPendientesTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   pnlBusca.Visible := True;
   isBusca.SearchField := AFieldName;
   isBusca.SetFocus;
end;

procedure TFPagoFacturasCobrar.dblcdAuxEnter(Sender: TObject);
begin
   if dblcClase.Text='' then
      dblcdAux.SetFocus;
end;

procedure TFPagoFacturasCobrar.BitBtn1Click(Sender: TObject);
begin
//  lkdCxP.LookupTable := DMTE.cdsMovCxP ;
  lkdCxP.LookupTable := DMTE.cdsMovCxC ;
  lkdCxP.Execute ;
end;

procedure TFPagoFacturasCobrar.dblcdCCostoExit(Sender: TObject);
var
   tmp : String;
begin

   if z2bbtnCancel3.Focused then exit;
   if dblcdCnp2.Focused     then exit;
   if dblcClaseDet.Focused  then exit;
   if dblcdAuxDet.Focused   then exit;

   tmp:=DMTE.DisplayDescripLocal(DMTE.cdsCCosto,'CCOSID',dblcdCCosto.Text,'CCOSDES') ;

   if tmp='' then begin
      ShowMessage('Error : Centro de Costo no Valido');
      dblcdCCosto.SetFocus;
      Exit;
   end;
end;

procedure TFPagoFacturasCobrar.Z2bbtnRetencionClick(Sender: TObject);
var
	 xSQL : String;
	 x10  : Integer;
begin
	 xSQL:='Select A.*, C.DOCABR DOCDESC, B.AUXNOMB, B.AUXDIR,D.CIADES, D.CIARUC '
				+'from CNT320 A, CNT201 B, TGE110 C, TGE101 D '
				+'WHERE A.CIAID='''   +DMTE.cdsEgrCaja.FieldByName('CIAID').AsString   +''' AND '
				+      'A.ANOMM='''   +DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString +''' AND '
				+      'A.TDIARID=''' +DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString +''' AND '
				+      'A.ECNOCOMP='''+DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' '
				+  'AND A.CLAUXID=B.CLAUXID AND A.AUXID=B.AUXID '
				+  'AND C.DOCMOD=''CXP'' AND C.DOCID=A.DOCID '
				+  'AND D.CIAID=A.CIAID '
				+'ORDER BY A.CLAUXID, A.AUXID';

	 DMTE.cdsRetencion.Close;
	 DMTE.cdsRetencion.Datarequest( xSQL );
	 DMTE.cdsRetencion.Open;

	 if DMTE.cdsRetencion.RecordCount<=0 then begin
			ShowMessage('No Existe Retención');
			Exit;
	 end;
   ppdbRetencion.DataSource:=DMTE.dsRetencion;
	 pprRetencion.TEMPLATE.FileName:=DMTE.wRutaCNT + '\Retenciones.rtm';
	 pprRetencion.template.LoadFromFile ;

	 pprRetencion.Print;
	 pprRetencion.Stop;
	 //ppDesigner1.Show;

	 x10:=DMTE.ComponentCount-1;
	 while x10>0 do begin
		 if DMTE.components[x10].classname='TppGroup' then begin
				DMTE.components[x10].free;
		 end;
		 x10:=x10-1;
	 end;
   ppdbRetencion.DataSource:=NIL;
end;

procedure TFPagoFacturasCobrar.dblcdAuxDropDown(Sender: TObject);
begin
  DMTE.cdsAux.IndexFieldNames:='AUXNOMB';
end;

procedure TFPagoFacturasCobrar.Contab_DocPago_Retencion_Debe(xRL,xRE,xRO:double);
var
 xwhere, XsqL : string;
begin
     DMTE.cdsCntCaja.FieldByName('CIAID').Value   := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
     DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
     DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
     DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:= DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
     DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  := 'CXP';
     DMTE.cdsCntCaja.FieldByName('DOCID').Value   := ''; //DMTE.cdsDocPago.FieldByName('DOCID2').Value;
     DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := ''; //DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
     DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := ''; //DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
     DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCFEMIS').Clear;  //DMTE.cdsDocPago.FieldByName('CPFEMIS').Value;
     DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Clear; //DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value;
     DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CPTODES,CUENTAID','CPTOIS=''R''','CPTOID');
     DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
     DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString+' '+DMTE.cdsRec.fieldbyname('PROVDES').AsString;
     DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value;
     DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;
     DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'D';
     DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:= strtofloat(dbeTCambio.Text); //DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
     DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:= strtofloat(dbeTCambio.Text); //DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
     DMTE.cdsCntCaja.FieldByName('TMONID').Value  := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

     DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value   := xRO;
     DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value    := xRL;
     DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xRE;

     DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString:= 'S';   //Registro ya cuadrado
     DMTE.cdsCntCaja.FieldByName('DCANO').AsString   := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCMM').AsString    := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCDD').AsString    := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCSS').AsString    := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
		 xNReg:=xNReg+1;
		 DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
end;

procedure TFPagoFacturasCobrar.Contab_DocPago_Retencion_Haber;
var
 xwhere, xSQL, xDocret : string;
 xMtoRetL,xMtoRetE : Double;
 xCanje:string;
begin
	xWhere:=' CIAID='''   +DMTE.cdsDocPago.fieldbyname('CIAID').AsString   +''' and '
	       +' CCANOMES='''+DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString +''' and '
		    +' TDIARID=''' +DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString+''' and '
		    +' CCNOREG=''' +DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString +''' '  ;

	if DMTE.RecuperarDatos( 'CXC301' , 'TMONID,TCANJEID,CCNOGRAV,CCIGV,CCGRAVAD,CCCANJE' , xWhere ) then
	   xMONID_PROV := DMTE.cdsRec.fieldbyname('TMONID').AsString
	else
	   Showmessage('Error en la recuperación del documento - WMC');

	if (DMTE.cdsRec.fieldbyname('TCANJEID').AsString='LE') AND (DMTE.cdsRec.fieldbyname('CCNOGRAV').AsFloat>0) then
	begin
		xMtoRetL:=0;
		xMtoRetE:=0;
		DMTE.cdsDocPago.First;
		while NOT DMTE.cdsDocPago.eof do
		begin
		   if (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec)  AND
		 	   (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV','DOCMOD=''CXC'' AND DOCID='+QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString),'DOCRETIGV')='S') AND
		 	   (lblSujetoRetencion.visible) then
		 	 begin
		 		 xWhere:=' CIAID='''   +DMTE.cdsDocPago.fieldbyname('CIAID').AsString   +''' and '
		 						+' CCANOMES='''+DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString +''' and '
		 						+' TDIARID=''' +DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString+''' and '
		 						+' CCNOREG=''' +DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString +''' '  ;
		 		 if DMTE.RecuperarDatos( 'CXC301' , 'TMONID,TCANJEID,CCNOGRAV,CCIGV,CCGRAVAD,CCCANJE' , xWhere ) then
		 		 begin
		 			 if DMTE.cdsRec.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
		 			 begin
		 				 xMtoRetL:=DMTE.FRound(xMtoRetL+DMTE.cdsRec.FieldByName('CCNOGRAV').AsFloat,15,2);
		 				 xMtoRetE:=DMTE.FRound(xMtoRetE+(DMTE.cdsRec.FieldByName('CCNOGRAV').AsFloat/StrToFloat(dbeTCambio.text)),15,2);
		 			 end
		 			 else
		 			 begin
		 				 xMtoRetL:=DMTE.FRound(xMtoRetL+(DMTE.cdsRec.FieldByName('CCNOGRAV').AsFloat*StrToFloat(dbeTCambio.text)),15,2);
		 				 xMtoRetE:=DMTE.FRound(xMtoRetE+DMTE.cdsRec.FieldByName('CCNOGRAV').AsFloat,15,2);
		 			 end;
		 		 end;
		 	end;
		 	DMTE.cdsDocPago.Next;
		 end;

       DMTE.cdsCntCaja.Insert;
		 DMTE.cdsCntCaja.FieldByName('CIAID').Value   := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
		 DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
		 DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
		 DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:= DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
		 DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
		 DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  := 'CXP';
		 DMTE.cdsCntCaja.FieldByName('DOCID').Value   := '';
		 DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := '';
		 DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := '';
		 DMTE.cdsCntCaja.FieldByName('ECFCOMP').Clear;
		 DMTE.cdsCntCaja.FieldByName('DCFEMIS').Clear;
		 DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Clear;
		 DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CPTODES,CUENTAID','CPTOIS=''T''','CPTOID');
		 DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString;
		 DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value;
		 DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;
		 DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'H';
		 DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:= StrToFloat(dbeTCambio.text);
		 DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:= StrToFloat(dbeTCambio.text);
		 //DMTE.cdsCntCaja.FieldByName('TMONID').Value:= DMTE.cdsDocPago.FieldByName('TMONID').Value;
		 DMTE.cdsCntCaja.FieldByName('TMONID').Value  := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

		 {if dblcTMon.Text=DMTE.wTMonLoc then
		 begin
			 if xMONID_PROV = dblcTMon.Text then
			 begin
				 xMTOCNTLOC:=DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2 ) ;
				 xMTOCNTEXT:=DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat / DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 ) ;
			 end
			 else
			 begin
				 xMTOCNTEXT := DMTE.FRound( DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2 ) ;
				 xMTOCNTLOC := DMTE.FRound( DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat * DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 ) ;
			 end;
			 DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value   := xMTOCNTLOC;
			 DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value    := xMTOCNTLOC;
			 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
		 end
		 else
		 begin
			 if xMONID_PROV = dblcTMon.Text then
			 begin
				 xMTOCNTEXT := DMTE.FRound( DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2 ) ;
				 xMTOCNTLOC := DMTE.FRound( DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat * DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 );
			 end
			 else
			 begin
				 xMTOCNTLOC:=DMTE.FRound( DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2 ) ;
				 xMTOCNTEXT:=DMTE.FRound( DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat / DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 );
			 end;
			 DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xMTOCNTEXT;
			 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
			 DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat  := xMTOCNTLOC;
		 end ;
		 }

		 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMtoRetE;
		 DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat  := xMtoRetL;
		 if dblcTMon.Text=DMTE.wTMonLoc then
			 DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xMtoRetL
		 else
			 DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xMtoRetE;

		 DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString:= 'S';   //Registro ya cuadrado
		 DMTE.cdsCntCaja.FieldByName('DCANO').AsString   := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCMM').AsString    := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCDD').AsString    := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCSS').AsString    := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
		 DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
		 xNReg:=xNReg+1;
		 DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
	 end
	 else // si son facturas
	 begin
		 if (DMTE.cdsRec.fieldbyname('TCANJEID').AsString<>'LE') then
		 begin
          // vhn
          if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString<>'C' then
          begin
             xMtoRetL:=0;
             xMtoRetE:=0;
             DMTE.cdsDocPago.First;
             while NOT DMTE.cdsDocPago.eof do
             begin
                if (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec)  AND
                   (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV','DOCMOD=''CXC'' AND DOCID='+QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString),'DOCRETIGV')='S') AND
                   (lblSujetoRetencion.visible) then
                begin
                   xMtoRetL:=xMtoRetL+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
                   xMtoRetE:=xMtoRetE+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
                end;
                DMTE.cdsDocPago.Next;
             end;

             if xMtoRetL>=DMTE.xTasaMonto then
             begin
                xMtoRetL:=DMTE.FRound(xMtoRetL*DMTE.xTasaPorce/100,15,2);
                xMtoRetE:=DMTE.FRound(xMtoRetE*DMTE.xTasaPorce/100,15,2);
             end
             else
             begin
                xMtoRetL:=0;
                xMtoRetE:=0;
             end;

             if (xMtoRetL>0) or (xMtoRetE>0) then
             begin
                DMTE.cdsCntCaja.Insert;
                DMTE.cdsCntCaja.FieldByName('CIAID').Value   := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
                DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
                DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
                DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:= DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
                DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
                DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  := 'CXP';
                DMTE.cdsCntCaja.FieldByName('DOCID').Value   := '';//DMTE.cdsDocPago.FieldByName('DOCID2').Value;
                DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := ''; //DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
                DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := ''; //DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
                DMTE.cdsCntCaja.FieldByName('ECFCOMP').Clear; // := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
                DMTE.cdsCntCaja.FieldByName('DCFEMIS').Clear; //  := DMTE.cdsDocPago.FieldByName('CPFEMIS').Value;
                DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Clear; //Value:= DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value;
                DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CPTODES,CUENTAID','CPTOIS=''T''','CPTOID');
                DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
                DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString;
                DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value;
                DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;
                DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'H';
                DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:= StrToFloat(dbeTCambio.text);
                DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:= StrToFloat(dbeTCambio.text);
                //DMTE.cdsCntCaja.FieldByName('TMONID').Value:= DMTE.cdsDocPago.FieldByName('TMONID').Value;
                DMTE.cdsCntCaja.FieldByName('TMONID').Value  := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

                   DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := xMtoRetL;
                   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMtoRetE;
                if dblcTMon.Text=DMTE.wTMonLoc then
                   DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xMtoRetL
                else
                   DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xMtoRetE;

                DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString:= 'S';   //Registro ya cuadrado
                DMTE.cdsCntCaja.FieldByName('DCANO').AsString   := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
                DMTE.cdsCntCaja.FieldByName('DCMM').AsString    := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
                DMTE.cdsCntCaja.FieldByName('DCDD').AsString    := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
                DMTE.cdsCntCaja.FieldByName('DCSS').AsString    := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
                DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
                DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
                DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
                DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
                DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
                xNReg:=xNReg+1;
                DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
             end;
          end
          else begin
             xSQL:='Select RETSERIE, RETNUMERO, FECPAGO, '
                  +   'SUM( MTORETLOC ) RETLOC, SUM( MTORETEXT ) RETEXT '
                  +'From CNT320 '
                  +'WHERE CIAID='''   + DMTE.cdsEgrCaja.FieldByName('CIAID').AsString    +''' AND '
                  +      'ANOMM='''   + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString  +''' AND '
                  +      'TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString  +''' AND '
                  +      'ECNOCOMP='''+ DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString +''' '
                  +'GROUP BY RETSERIE, RETNUMERO, FECPAGO';
             DMTE.cdsQry4.Close;
             DMTE.cdsQry4.Datarequest( xSQL );
             DMTE.cdsQry4.Open;

             xWhere:='DOCMOD=''CXC'' AND DOCTIPREG=''CR'' ';
             xDocRet:=DMTE.DisplayDescrip('prvTGE','TGE110','DOCID',xWhere,'DOCID');

             while not DMTE.cdsQry4.Eof do
             begin
                DMTE.cdsCntCaja.Insert;
                DMTE.cdsCntCaja.FieldByName('CIAID').Value   := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
                DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
                DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
                DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:= DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
                DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
                DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  := 'CXC';
                DMTE.cdsCntCaja.FieldByName('DOCID').Value   := xDocRet;
                DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsQry4.FieldByname('RETSERIE').AsString;
                DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsQry4.FieldByname('RETNUMERO').AsString;
                DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsQry4.FieldByname('FECPAGO').AsDateTime;
                DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsQry4.FieldByname('FECPAGO').AsDateTime;
                DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:= DMTE.cdsQry4.FieldByname('FECPAGO').AsDateTime;
                DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CPTODES,CUENTAID','CPTOIS=''T''','CPTOID');
                DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
                DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString;
                DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value;
                DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;
                DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'H';
                DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:= StrToFloat(dbeTCambio.text);
                DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:= StrToFloat(dbeTCambio.text);
                DMTE.cdsCntCaja.FieldByName('TMONID').Value  := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

                DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat :=DMTE.cdsQry4.FieldByname('RETLOC').AsFloat;
                DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat:=DMTE.cdsQry4.FieldByname('RETEXT').AsFloat;
                if dblcTMon.Text=DMTE.wTMonLoc then
                   DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat:=DMTE.cdsQry4.FieldByname('RETLOC').AsFloat
                else
                   DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat:=DMTE.cdsQry4.FieldByname('RETEXT').AsFloat;

                DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString:= 'S';   //Registro ya cuadrado
                DMTE.cdsCntCaja.FieldByName('DCANO').AsString   := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
                DMTE.cdsCntCaja.FieldByName('DCMM').AsString    := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
                DMTE.cdsCntCaja.FieldByName('DCDD').AsString    := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
                DMTE.cdsCntCaja.FieldByName('DCSS').AsString    := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
                DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
                DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
                DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
                DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
                DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
                xNReg:=xNReg+1;
                DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

                DMTE.cdsQry4.Next;
             end;
          end;
		 end;
	 end;
end;

procedure TFPagoFacturasCobrar.Contab_DifCamDocPago_Retencion;
var
   xMONID_PROV, xWhere, xSQL, xSQL1 : String;
begin
   xWhere := ' CIAID='''   +DMTE.cdsDocPago.fieldbyname('CIAID').AsString   +''' and '
          +' CCANOMES='''+DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString +''' and '
          +' TDIARID=''' +DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString+''' and '
          +' CCNOREG=''' +DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString +''' '  ;

   if DMTE.RecuperarDatos( 'CXC301' , 'TMONID,TCANJEID,CCNOGRAV' , xWhere ) then
      xMONID_PROV := DMTE.cdsRec.fieldbyname('TMONID').AsString
   else
			ShowMessage('Error en la recuperación del documento - WMC');

   xSQL := 'TMONID='+quotedstr(dblcTMon.Text);
   xSQL1 := 'TMONID='+quotedstr(DMTE.cdsDocPago.fieldbyname('TMONID').AsString);
   If (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') or
      (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then
    begin
     if (DMTE.cdsRec.fieldbyname('TCANJEID').AsString='LE') AND (DMTE.cdsRec.fieldbyname('CPNOGRAV').AsFloat>0) then
       if DMTE.cdsDocPago.FieldByName('DETCDOC').Value <> DMTE.cdsDocPago.FieldByName('DETCPAG').Value then
        begin
          DMTE.cdsCntCaja.Insert;
          DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
          DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
          DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
          DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
          DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
          DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsDocPago.FieldByName('DOCID2').Value;
          DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  :=  'CXP';
          DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
          DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
          DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
          DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
          DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
          DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  DMTE.cdsDocPago.FieldByName('CUENTAID').Value;
          DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
          DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
          DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
          DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
          DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
          DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
          DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
          DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
          DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
          DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
          DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
          DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
          DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;

          xNReg:=xNReg+1;
          DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

          DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
          DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
          DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
          DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
          DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

          if dblcTMon.Text=DMTE.wTMonLoc then
          begin
            if xMONID_PROV = dblcTMon.Text then
            begin
              xMTOCNTLOC:=0;
              xMTOCNTEXT:=ABS(DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat / DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2)-DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat / DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 )) ;
            end
            else
            begin
              xMTOCNTEXT := 0;
              xMTOCNTLOC := ABS(DMTE.FRound( DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2)-DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat * DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 ) );
            end;
            DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value   := xMTOCNTLOC;
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value    := xMTOCNTLOC;
            DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
          end
          else
          begin
            if xMONID_PROV = dblcTMon.Text then
            begin
              xMTOCNTEXT := 0;
              xMTOCNTLOC := ABS(DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2)-DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat * DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 ));
            end
            else
            begin
              xMTOCNTLOC:=0;
              xMTOCNTEXT:=ABS(DMTE.FRound( DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat / DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2)-DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat / DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 ));
            end;
            DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xMTOCNTEXT;
            DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat  := xMTOCNTLOC;
          end ;

          if DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat > DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat then
            DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H'
          else
            DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';

          if DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'D' then
          begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value    := wCptoPer;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value  := wCtaPer;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Dif.Camb.Retencion';
          end
          else
          begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Dif.Camb.Retencion';
          end;
        end
    end;
end;

procedure TFPagoFacturasCobrar.GrabaCabeceraDeComprobante;
var xSQL:string;
begin
    DMTE.cdsEgrCaja.Insert;
    DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString:='X';
    DMTE.cdsEgrCaja.FieldByName('CIAID').AsString:=dblcCia.Text;
    DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString:=edtPeriodo.Text;
    DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString:=dblcTDiario.Text;
    DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString:=dbeNoComp.Text;

    xSQL:='Select * from CAJA302 '
    			+'Where CIAID='''   +dblcCia.Text    +''' and '
    			+      'ECANOMM=''' +edtPeriodo.Text +''' and '
    			+      'TDIARID=''' +dblcTDiario.Text+''' and '
    			+      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
    DMTE.cdsEgrCaja.DataRequest( xSQL );
    DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

end;

procedure TFPagoFacturasCobrar.dbeNoCompEnter(Sender: TObject);
var
   xWhere : String;
begin
   if trim(edtTDiario.Text) <> '' then
   begin
      xWhere:='CIAID='+quotedstr(dblcCia.Text)+' AND ECANOMM='+quotedstr(edtPeriodo.Text)
             +' AND TDIARID='+ quotedstr(dblcTDiario.Text); // + ' AND EC_PROCE='+quotedstr('B');
      dbeNoComp.text:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
   end ;
end;

procedure TFPagoFacturasCobrar.Button1Click(Sender: TObject);
begin
  DMTE.CalculaRetencionIGV;
end;

end.

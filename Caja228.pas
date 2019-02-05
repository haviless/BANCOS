unit Caja228;

// Actualizaciones
// HPC_201403_CAJA cambia control de diseño de reporte

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient,
  ComCtrls, Tabnotbk, CAJADM, Menus, Wwlocate, wwDialog, Wwfltdlg, wwidlg,
  ppVar, ppCtrls, ppBands, ppPrnabl, ppClass, ppCache, ppDB, ppDBPipe,
  ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppMemo, oaContabiliza,
  Wwkeycb, ppEndUsr, ppModule, daDatMod, Variants;

type
  TFPagoFacturas = class(TForm)
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
    lblBusca: TLabel;
    BitBtn1: TBitBtn;
    Z2bbtnRetencion: TBitBtn;
    ppdbRetencion: TppDBPipeline;
    pprRetencion: TppReport;
    lblSujetoRetencion: TLabel;
    Button1: TButton;
    Z2bbtChqVouch: TBitBtn;
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
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText10: TppDBText;
    ppDetailBand3: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppDBCalc1: TppDBCalc;
    ppTotal: TppDBCalc;
    ppDBText13: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDesigner1: TppDesigner;
    lblDTR: TLabel;
    bbtnReConta: TBitBtn;
    pnlDetraccion: TPanel;
    Label5: TLabel;
    lblNoChqDTR: TLabel;
    lblCCBcoDTR: TLabel;
    z2bbtnDTROK2: TBitBtn;
    z2bbtnDTRCancel3: TBitBtn;
    dbeNoChqDTR: TwwDBEdit;
    dblcCCBcoDTR: TwwDBLookupCombo;
    pnlSunat: TPanel;
    Label20: TLabel;
    bbtnCH: TBitBtn;
    dbeCH: TwwDBEdit;
    Label21: TLabel;
    bbtnGra: TBitBtn;
    bbtnCanCH: TBitBtn;
    pnlCH: TPanel;
    cbRetNC: TCheckBox;
    cbConDetRet: TCheckBox;
    cbDisenoRep: TCheckBox;
    procedure dblcCiaExit(Sender: TObject);
    procedure z2bbtnCancelClick(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
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
    function CalculaRet:double;
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
    procedure Z2bbtChqVouchClick(Sender: TObject);
    procedure pprChqVouchPrintingComplete(Sender: TObject);
    procedure dbeImporteKeyPress(Sender: TObject; var Key: Char);
    procedure dbeImporteExit(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dbeNoChqDTRExit(Sender: TObject);
    procedure z2bbtnDTROK2Click(Sender: TObject);
    procedure z2bbtnDTRCancel3Click(Sender: TObject);
    procedure dblcCCBcoDTREnter(Sender: TObject);
    procedure dblcCCBcoDTRExit(Sender: TObject);
    procedure bbtnReContaClick(Sender: TObject);
    procedure dblcdCCostoEnter(Sender: TObject);
    procedure bbtnCHClick(Sender: TObject);
    procedure bbtnGraClick(Sender: TObject);
    procedure bbtnCanCHClick(Sender: TObject);
    procedure dbeCHExit(Sender: TObject);

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
      xErrorGraba : boolean;
    bMayorQueTasa:boolean;
    xMtoLoc, xMtoExt: Double ;
    xRetLoc,xRetExt, xDTRPorc :Double;

    bMayorQueMonto:Boolean;

    xMtoRetL,xMtoRetE : Double;
    xMtoTotalL,xMtoTotalE,xMtoL,xMtoE : Double;
    bLetra : Boolean;
    xMtoTotalHL, xMtoTotalHE : Double;

    xMtoRetLH,xMtoRetEH, xPorcPago :double;
    xBANCOID,xCCBCOID,XCTACONT, xDTRGrabada, xMsgContabiliza, xContabiliza : string;
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
		procedure Contab_HaberProc1;
		procedure Contab_RegCxP;
		procedure Contab_DocPago;
		procedure Contab_DocPago_Retencion_Debe(xRL,xRE,xRO:double);
		procedure Contab_DocPago_Retencion_Haber;
		procedure Contab_DifCamRegCxP;
		procedure Contab_DifCamDocPago;
		procedure Contab_DifCamDocPago_Retencion(wPorcPago,xMtoRetL,xMtoRetLH:double);
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
    procedure GeneraRegChqVouch;
    procedure AnulaCaja302;
    procedure ProveedoresNotificados;
	public
		{ Public declarations }
    wCptoGan  ,
		wCptoPer  ,
		wCtaGan   ,
		wCtaPer   : String ;
		wCCosDif  : String ;
		procedure Adiciona ;
		procedure Edita(cds : Twwclientdataset);
		procedure AsignaCDSFiltro(cds : TwwClientDataset) ;
		procedure AsientoDifTotal;
		procedure ContabCierra;
		procedure Contabiliza;
		procedure ContabilizaProc1;
		procedure ContabilizaProc2;
		procedure Detraccion;
	end;
var
	FPagoFacturas: TFPagoFacturas;
	wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado , wbChq,
   wbcancel2: Boolean;
   wModifica, wCiaRetIGV: Boolean;
   wModo : string;
   wBcoTipCta  : string;
   wDocModulo : string;
implementation

uses CAJAUTIL, Caja290, oaTE2000;

{$R *.DFM}


procedure TFPagoFacturas.IniciaDatos;
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
   Z2bbtChqVouch.Visible   := False;
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
   DMTE.cdsMovCxP.Close;

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

procedure TFPagoFacturas.dblcCiaExit(Sender: TObject);
var
   xSQL : String;
begin
   edtCia.text:= DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIADES') ;

   wCiaRetIGV := (DMTE.cdsCia.FieldByName('CIARETIGV').AsString='S');

   if edtCia.Text='' then begin
      ShowMessage('Error : Compañía no Valida');
      dblcCia.SetFocus;
      Exit;
   end;

   if DMTE.wModo = 'A' then
   begin
      xSQL:='select A.CPTOID, A.CPTODES, A.CUENTAID, FCTZ From CAJA201 A '
           +'WHERE A.CPTOIS=''E'' '
           +  'AND EXISTS ( SELECT CUENTAID FROM TGE202 B '
           +               'WHERE A.CUENTAID=B.CUENTAID AND B.CTAACT=''S'' '
           +                 'AND B.CIAID='''+dblcCia.Text+''') '
           +'ORDER BY A.CPTOID';
      DMTE.cdsCptos.Close;
      DMTE.cdsCptos.DataRequest(xSQL);
      DMTE.cdsCptos.Open;
   end;
   cdsConceptoC1.CloneCursor(DMTE.cdsCptos, True) ;
   cdsConceptoC1.Name := 'cdsConceptoC1' ;
   cdsConceptoC1.Filtered := True ;
   dblcdCnp2.LookupTable := cdsConceptoC1 ;
end;

{******************************************************************************}
procedure TFPagoFacturas.dbdtpFCompExit(Sender: TObject);
var
   xYear, xMonth, xDay : Word;
   xWhere : String;
begin
   if dblcCia.Focused   then Exit;
   if dblcBanco.Focused then Exit;
   if dblcCCBco.Focused then Exit;

	if dbdtpFComp.Date=0 then
   begin
      ShowMessage('Fecha de Comprobante Errada');
      dbdtpFComp.SetFocus;
      Exit;
   end;

   if wBcoTipCta='B' Then //Busca en el CAJA402
   begin
      if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, dblcCCBco.Text, dbdtpFComp.Date ) then
      begin
         dbdtpFComp.SetFocus;
         exit;
      end;
   end
   else //Busca en el CAJA310
   begin
      if not DiaAperturado(dblcCia.Text, dbdtpFComp.Date, dblcBanco.Text) then
      begin
         dbdtpFComp.SetFocus;
         exit;
      end;
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
procedure TFPagoFacturas.dblcTDiarioExit(Sender: TObject);
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
procedure TFPagoFacturas.z2bbtnOKClick(Sender: TObject);
Var
	 xSQL, xUnion, xWhere,aux , xFiltro : string;
	 xFlag : Boolean ; wImpDtr : double;
begin
   /////////////////////////////////////////////////////////////////////////////
   // esto se realiza cuando se trata de un comprobante al que se le ha aplicado
   // la DETRACCION y ya fue grabado.
   if lblDTR.Visible then
   begin
      xDTRGrabada:='0';
      z2bbtnSube.Enabled:=False; // por DETRACCION no funciona
   end;
   /////////////////////////////////////////////////////////////////////////////

   if (dblcClase.Enabled) and (z2bbtnSube.Tag <> 1) then
   begin
      DMTE.cdsMovCxP.close;
      DMTE.cdsMovCxP.DataRequest('SELECT * FROM CXP301 WHERE CIAID=''''');
      DMTE.cdsMovCxP.Open;
//      DMTE.cdsMovCxP.IndexFieldNames:='CLAUXID;PROV;CPFEMIS';
      //DMTE.cdsMovCxP.IndexFieldNames:='CPANOMES';
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

{   if DMTE.wModo='N' then
   begin
      DMTE.wModo:='A'
   end;
}
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
     cdsEgrCaja.FieldByName('EC_PROCE').AsString:='B' ;
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
            DMTE.cdsMovCxP.CancelUpdates ;
            xFlag := True ;
         end
      end
      else
          xFlag := True ;

      //xAuxT:=dblcdAux.Text;

		if xFlag then
		begin
          // e elimina porque todos los documentos deben pasar a caja
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
       xSQL:='SELECT * FROM CXP301 WHERE ';
			 xWhere :='CIAID='''   +dblcCia.Text   + ''' and ' +
								'CPESTADO='''+'P'            + ''' and ' +
								'CLAUXID=''' +dblcClase.Text + ''' and ' +
								'PROV='''    +dblcdAux.Text  + '''';
       xUnion:=' UNION ALL SELECT * FROM CXP309 WHERE ';

			 xFiltro:=' (((CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR '+
								'   ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) '  ;

       xSQL:=xSQL+xWhere+' order by CPANOMES DESC, DOCID, CPSERIE, CPNODOC';
			 DMTE.cdsMovCxP.Close;
			 DMTE.cdsMovCxP.Datarequest(xSQL);//'SELECT * FROM CXP301 WHERE ' + xWhere ) ;
			 // vhnDMTE.cdsMovCxP.Datarequest('SELECT * FROM CXP301 WHERE ' + xWhere+sDocumentos) ;
			 DMTE.cdsMovCxP.Open;
//          DMTE.cdsMovCxP.IndexFieldNames:='CLAUXID;PROV;CPFEMIS';
       //DMTE.cdsMovCxP.IndexFieldNames:='CPANOMES';

			 DMTE.cdsMovCxP.Filter   := xFiltro ;

       DMTE.cdsMovCxP.Filtered := True ;

       if DMTE.cdsMovCxP.RecordCount=0 then
       begin
          ShowMessage('No hay Documentos Pendientes para Proveedor') ;
             //dblcdAux.SetFocus ;
             //exit;
       end
       else
       begin
       end;
       DMTE.cdsMovCxP.Filtered := True ;
    end;
   end;
   // Estado de los componentes
   // vhndema
   dbgDocPago.ReadOnly   := False;
   DMTE.cdsDocPago.EnableControls ;
   // end vhndema

   pnlCabecera1.enabled  := False;
   pnlCabecera2.enabled  := False;
   pnlDetalle.enabled    := True;
   pnlBotones.Enabled    := True;
   ActPnlBotones;

   z2bbtnOk.Enabled        := False;
   z2bbtnCancel.Enabled    := False;
   /////////////////////////////////////////////////////////////////////////////
   // esto se realiza cuando se trata de un comprobante al que se le ha aplicado
   // la DETRACCION y ya fue grabado.
//   if lblDTR.Visible then
//      z2bbtnGraba.Enabled:=False;
   /////////////////////////////////////////////////////////////////////////////
end;

{******************************************************************************}
procedure TFPagoFacturas.z2bbtnCancelClick(Sender: TObject);
begin
   DMTE.cdsEgrCaja.CancelUpdates;
   if DMTE.cdsRegCxP.Active  then DMTE.cdsRegCxP.CancelUpdates;
   if DMTE.cdsDocPago.Active then DMTE.cdsDocPago.CancelUpdates;
   if DMTE.cdsMovCxP.Active  then DMTE.cdsMovCxP.CancelUpdates;
   Adiciona ;
   AdicIniciadatos ;
   dbeLote.Text := '000';
end;

procedure TFPagoFacturas.z2bbtnSumatDocPagoClick(Sender: TObject);
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

      dbgDocPago.ColumnByName('CPNODOC').FooterValue:='';
      dbgDocPago.ColumnByName('CPFVCMTO').FooterValue:='';
      if cdsDocPago.RecordCount>0 then
      begin
         dbgDocPago.ColumnByName('CPNODOC').FooterValue:='Total Docs.:';
         dbgDocPago.ColumnByName('CPFVCMTO').FooterValue:=floattostrf(cdsDocPago.RecordCount, ffNumber, 5, 0) ;
      end;
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
procedure TFPagoFacturas.z2bbtnSubeClick(Sender: TObject) ;
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
procedure TFPagoFacturas.z2bbtnCancel2Click(Sender: TObject) ;
begin
   if MessageDlg('¿Anular los cambios?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin
      DMTE.cdsEgrCaja.CancelUpdates ;
      DMTE.cdsRegCxP.CancelUpdates  ;
      DMTE.cdsMovCxP.CancelUpdates  ;
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
procedure TFPagoFacturas.z2bbtnNuevoClick(Sender: TObject);
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
        xDTRGrabada:='0';
        lblDTR.Visible:=False;
        //**
    end ;
   end
   else
   begin
//0805      IniciaDatos;
      Adiciona        ;
      AdicIniciadatos ;
      //
      Limpiapnlaux;
      //**
      RecuperarCiaUnica(dblcCia,edtCia);
      dbeLote.Text := '000';
      dbeLote.OnExit(self);
      dblcCia.OnExit(self);
      xDTRGrabada:='0';
      lblDTR.Visible:=False;
      //**
   end ;
  //** 05/06/2001 Para grabar el nuevo voucher
  xVoucher := '';
  //**
end ;

{******************************************************************************}
procedure TFPagoFacturas.z2bbtnCanceladoClick(Sender: TObject);
var
   xSQL, wMoneda, wMonto : string;
	 xRetencion, xConsis:Boolean;
//   wMonto : Double;
begin
   /////////////////////////////////////////////////////////////////////////////
   // se realiza por tratarse de DETRACCION
   if (xDTRPorc>0) and (DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString<>'') then
   begin
      DMTE.cdsEgrCaja.Filter:='';
      DMTE.cdsEgrCaja.Filtered:=False;
      DMTE.cdsEgrCaja.Filter:=' CIAID='+quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
                             +' and ECANOMM=' +quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
                             +' and TDIARID=' +quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
                             +' and ECNOCOMPR='+quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString);
      DMTE.cdsEgrCaja.Filtered:=True;
   end
   else
      xDTRPorc:=0;

   /////////////////////////////////////////////////////////////////////////////

   if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='I' then
   begin
      if wModifica or (DMTE.cdsDocPago.ChangeCount > 0 ) or DMTE.cdsDocPago.Modified then
      begin
     	   ShowMessage('Debe grabar primero las actualizaciones realizadas');
     	   Exit;
      end;

      DMTE.cdsRegCxP.DisableControls;
      ConsisCancela(xConsis);
      DMTE.cdsRegCxP.EnableControls;
      if not xConsis then
         ShowMessage('No se puede Cancelar el Comprobante')
      else
      begin
         if MessageDlg('¿Desea Efectuar la Cancelación del Comprobante?', mtConfirmation,
                                                                [mbYes, mbNo], 0)=mrYes then
         begin
            ErrorCount := 0;

            // Calcula Retención del IGV
            xRetencion:=False;
            if cbConDetRet.Checked then
            begin
               if xDTRPorc=0 then    // si hay Detraccion se anula la Retencion
               begin
                  if cbRetNC.Checked then
                     xRetencion := DMTE.CalculaRetencionIGV
                  else
                     xRetencion := DMTE.CalculaRetencionIGV_SinNC;
               end;
            end;

            ActMovCxP;
            ActualizaDetCanje;

            dbeImporte.Text := DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString;
            // Fin Calcula Retencion del IGV

            ////////////////////////////////////////////////////////////////////
            // se realiza el loop por tratarse de DETRACCION
            if xDTRPorc>0 then
            begin
               DMTE.cdsEgrCaja.Filter:='';
               DMTE.cdsEgrCaja.Filtered:=False;
               DMTE.cdsEgrCaja.Close;
               xSQL := 'select * From CAJA302 '
                      +'where CIAID    ='+QuotedStr(dblcCia.Text)
                      +'  and ECANOMM  ='+QuotedStr(edtPeriodo.Text)
                      +'  and TDIARID  ='+QuotedStr(dblcTDiario.Text)
                      +'  and ECNOCOMPR ='+quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString);
               DMTE.cdsEgrCaja.DataRequest( xSQL );
               DMTE.cdsEgrCaja.Open;
               DMTE.cdsEgrCaja.First;
               while not DMTE.cdsEgrCaja.Eof do
               begin
                     DMTE.cdsEgrCaja.Edit;
                     DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'C';
                     DMTE.cdsEgrCaja.FieldByName('ECUSER').Value      := DMTE.wUsuario; // usuario que registra
                     DMTE.cdsEgrCaja.FieldByName('ECFREG').Value      := DateS;        // fecha que registra Usuario
                     DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time;         // Hora de Registro de Usuario
                     DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString := 'N';
                     DMTE.ControlTran(0,DMTE.cdsEgrCaja,'EGRCAJA');
                     DMTE.cdsEgrCaja.Next;
               end;
            end
            else
            begin
               DMTE.cdsEgrCaja.Edit;
               DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'C';
               DMTE.cdsEgrCaja.FieldByName('ECUSER').Value      := DMTE.wUsuario; // usuario que registra
               DMTE.cdsEgrCaja.FieldByName('ECFREG').Value      := DateS;        // fecha que registra Usuario
               DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time;         // Hora de Registro de Usuario
               if xRetencion then
                  DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString := 'S'
               else
                  DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString := 'N';
               cdsPost(DMTE.cdsEgrCaja);
               xSQL := 'select * From CAJA302 '
                      +'where CIAID    ='+QuotedStr(dblcCia.Text)
                      +'  and ECANOMM  ='+QuotedStr(edtPeriodo.Text)
                      +'  and TDIARID  ='+QuotedStr(dblcTDiario.Text)
                      +'  and ECNOCOMP ='+QuotedStr(dbeNoComp.Text);
               DMTE.cdsEgrCaja.DataRequest( xSQL );
               DMTE.ControlTran(0,DMTE.cdsEgrCaja,'EGRCAJA');
            end;
            ////////////////////////////////////////////////////////////////////


            DMTE.ControlTran(0,DMTE.cdsRegCxP, 'REGCXP');

            z2bbtnSumatClick(Sender);
            dbgPendientes.ReadOnly  := True;
            dbgDocPago.ReadOnly     := True;
            dbgOtros.ReadOnly       := True;

            z2bbtnCont.Enabled      := True;
            z2bbtnAnula.Enabled     := True;
            z2bbtnSube.Enabled      := False;
            z2bbtnGraba.Enabled     := False;
            z2bbtnCancelado.Enabled := False;
            z2bbtnCancel2.Enabled   := False;
            dbgOtrosIButton.Enabled := False ;
            lblEstado.Caption       := 'Cancelado          ';

            SaldosAux ;
            if wBcoTipCta='C' Then
            begin
               ////////////////////////////////////////////////////////////////////
               // se realiza el loop por tratarse de DETRACCION
               if xDTRPorc>0 then
               begin
                  DMTE.cdsEgrCaja.First;
                  while not DMTE.cdsEgrCaja.Eof do
                  begin
                      DMTE.ActSaldosCaja(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, DMTE.cdsEgrCaja.FieldByName('TMONID').AsString,
                                 DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
                                 DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString, 'E', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
                      DMTE.cdsEgrCaja.Next;
                  end;
               end
               else
               begin
                  DMTE.ActSaldosCaja(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, DMTE.cdsEgrCaja.FieldByName('TMONID').AsString,
                                 DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
                                 DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString, 'E', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
               end;
            end
            else
            begin
               if wBcoTipCta='B' then
               begin
                  ////////////////////////////////////////////////////////////////////
                  // se realiza el loop por tratarse de DETRACCION
                  if xDTRPorc>0 then
                  begin
                     DMTE.cdsEgrCaja.First;
                     while not DMTE.cdsEgrCaja.Eof do
                     begin
                         if DMTE.cdsEgrCaja.FieldByName('TIPDET').AsString='I4' then
                         begin // por ser el registro del monto de la DETRACCION
                            wMonto:=DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString;
                            wMoneda:=DMTE.wTMonLoc;
                         end
                         else
                         begin
                            wMonto:=DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString;
                            wMoneda:=DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
                         end;
                         DMTE.ActSaldosBancos(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, wMoneda,
                                   DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
                                   DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString, wMonto,
                                   'E', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
                         DMTE.cdsEgrCaja.Next;
                     end;
                  end
                  else
                  begin
                     DMTE.ActSaldosBancos(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, DMTE.cdsEgrCaja.FieldByName('TMONID').AsString,
                                   DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
                                   DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString, DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString,
                                   'E', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
                  end;
               end;
            end;

            if dblcdCtaCte.text <> '' then
               Z2bbtnNotaAbono.Enabled := True
            else
               Z2bbtnNotaAbono.Enabled := False;

            if dblcCCBco.Text<>'' then
               Z2bbtChqVouch.Visible := True
            else
               Z2bbtChqVouch.Visible := False;

            beep;
            MessageDlg('Datos Actualizados', mtCustom, [mbOk], 0);

            DMTE.ControlTran(8,NIL,''); //COMMIT
         end;
      end;
   end
   else
   begin
      ShowMessage('No tiene el estado correcto para Cancelar');
   end;
end;

{******************************************************************************}
function TFPagoFacturas.ValidaCampo:Boolean;
var
   xWhere, aux : String;
begin
     Result := True;
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
           xWhere:='CCosID='+''''+cdsRegCxP.FieldByName('CCOSID').Value+''' AND CCOSACT=''S''' ;
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
             ShowMessage('Fecha de Vencimiento debe ser posterior a la Fecha de Emisión');
             Result:=False;
             exit;
        end;
    end;
end;
{******************************************************************************}
procedure TFPagoFacturas.ConsisCancela(Var xConsis:boolean);
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
            if cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc then
               xSumImp := xSumImp + strToCurr(stringreplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]))
            else
               xSumImp := xSumImp + strToCurr(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]))
         else
            if cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc then
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
         if DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString=DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString then
         begin
            if cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc then
               xSumImp := xSumImp + strToCurr(stringreplace(cdsDocPago.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]))
            else
               xSumImp := xSumImp + strToCurr(stringReplace(cdsDocPago.FieldByName('DEMTOEXT').DisPlayText,',','',[rfReplaceAll])) ;
         end;
         cdsDocPago.Next;
      end;
      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);
   end;

// calcula los montos x retención de IGV.
   if cbConDetRet.Checked then
   begin
      if dblcTMon.Text=DMTE.wTMonLoc then
         xSumImp := xSumImp-CalculaRet
      else
         xSumImp := xSumImp-DMTE.FRound((CalculaRet),15,2);
   end;

   /////////////////////////////////////////////////////////////////////////////
   // se realiza la sumatoria por tratarse de DETRACCION
   Suma:=0;
   if xDTRPorc>0 then
   begin
      //DMTE.cdsEgrCaja.First;
      //While not DMTE.cdsEgrCaja.Eof do
      //Begin
      //   if DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString=DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString then
      //   begin
            if DMTE.cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc then
               Suma :=  Suma+StrToCurr(FloatToStrF(DMTE.cdsEgrCaja.fieldbyname('ECMTOLOC').AsFloat,ffFixed,10,2))
            else
               Suma :=  Suma+StrToCurr(FloatToStrF(DMTE.cdsEgrCaja.fieldbyname('ECMTOEXT').AsFloat,ffFixed,10,2)) ;
       //  end;
       //  DMTE.cdsEgrCaja.Next;
      //end;
   end
   else  // por NO tratarse de DETRACCION
   begin
      if DMTE.cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc then
         Suma :=  StrToCurr(FloatToStrF(DMTE.cdsEgrCaja.fieldbyname('ECMTOLOC').AsFloat,ffFixed,10,2))
      else
         Suma :=  StrToCurr(FloatToStrF(DMTE.cdsEgrCaja.fieldbyname('ECMTOEXT').AsFloat,ffFixed,10,2)) ;
   end;
   /////////////////////////////////////////////////////////////////////////////

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
procedure TFPagoFacturas.Contab_Haber;
var
    xSQL:string;
    xWhere:string;
begin
  //CALCULAR EL MONTO RETENIDO
  xMtoTotalHL:=0;
  xMtoTotalHE:=0;
  bMayorQueTasa:=False;
  bLetra:=False;
  DMTE.cdsDocPago.DisableControls;

  ///////////////////////////////////////////////////
  // condicionado para tratar la DETRACCION
  if xDTRPorc=0 then // si no hay DETRACCION
  begin
     DMTE.cdsDocPago.First;
     while not DMTE.cdsDocPago.Eof do
     begin
        Contab_HaberProc1;
        DMTE.cdsDocPago.Next
     end;
  end
  else   // si hay DETRACCION
  begin
     Contab_HaberProc1;
  end;

  DMTE.cdsDocPago.EnableControls;

  if (xDTRPorc>0) and (DMTE.cdsDocPago.FieldByName('TIPDET').AsString='I4') then // si no hay DETRACCION
  else
  begin
      DMTE.cdsRegCxP.DisableControls;
      DMTE.cdsRegCxP.First;
      while not DMTE.cdsRegCxP.EOF do
      begin //(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat>=DMTE.xTasaMonto)  AND
        if (DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec)  AND
           (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV','DOCMOD=''CXP'' AND DOCID='+QuotedStr(DMTE.cdsRegCxP.FieldByName('DOCID2').AsString),'DOCRETIGV')='S') AND
           (lblSujetoRetencion.visible) then
        begin
          //xMtoL:=xMtoL+DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
          //xMtoE:=xMtoE+DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
        end;

        //xMtoTotalL:=xMtoTotalL+DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
        //xMtoTotalE:=xMtoTotalE+DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;

        if DMTE.cdsRegCxP.FieldByName('DEDH').AsString='D' then begin
           xMtoTotalL:=xMtoTotalL+DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
           xMtoTotalE:=xMtoTotalE+DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
        end
        else begin
           xMtoTotalHL:=xMtoTotalHL+DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
           xMtoTotalHE:=xMtoTotalHE+DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
        end;

        DMTE.cdsRegCxP.Next;
      end;
      DMTE.cdsRegCxP.EnableControls;
  end;

  if (bLetra) AND (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV','DOCMOD=''CXP'' AND DOCID='+QuotedStr(DMTE.sLet),'DOCRETIGV')='S') then
  begin
   if xMtoL<=0 then
   begin
     xMtoL:=xMtoTotalL;
     xMtoE:=xMtoTotalE;
   end;
   xMtoRetL:=0;
   xMtoRetE:=0;
  end
  else//SI SON FACTURAS
  begin
//    if (bMayorQueTasa) or (xMtoL>=DMTE.xTasaMonto) then
     if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='C' then
     begin
        xMtoRetL:=0;
        xMtoRetE:=0;
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
        while not DMTE.cdsQry4.Eof do begin
           xMtoRetL:=DMTE.FRound(xMtoRetL+DMTE.cdsQry4.Fieldbyname('RETLOC').AsFloat,15,2);
           xMtoRetE:=DMTE.FRound(xMtoretE+DMTE.cdsQry4.Fieldbyname('RETEXT').AsFloat,15,2);
           DMTE.cdsQry4.Next;
        end;
     end
     else
     begin
        if (bMayorQueTasa) then
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
  end;
  DMTE.cdsCntCaja.FieldByName('CIAID').Value      :=  DMTE.cdsEgrcaja.FieldByName('CIAID').Value;
  DMTE.cdsCntCaja.FieldByName('TDIARID').Value    :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
  DMTE.cdsCntCaja.FieldByName('ECANOMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
  DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
  DMTE.cdsCntCaja.FieldByName('DCLOTE').Value     :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
  DMTE.cdsCntCaja.FieldByName('DOCID').Value      :=  DMTE.cdsEgrCaja.FieldByName('DOCID').AsString;
   //a pedido de jlc 20/12/2002
   DMTE.DisplayDescrip('prvTGE','TGE112','FCHQ,FCBCO','FPAGOID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString),'FCHQ');
   if ((DMTE.cdsQry.fieldbyname('FCHQ').AsString='1') or (DMTE.cdsQry.fieldbyname('FCHQ').AsString='S'))
      and (DMTE.cdsQry.fieldbyname('FCBCO').AsString='S')
       then
      DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString
   else
      DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString;

//  DMTE.cdsCntCaja.FieldByName('DCNODOC').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString;
  DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
  DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
  DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
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

  DMTE.cdsCntCaja.FieldByName('FCAB').AsString    := '1' ;
  DMTE.cdsCntCaja.fieldbyname('DOCMOD').AsString  := FRegistro.xModulo;
  DMTE.cdsCntCaja.fieldbyname('DCTCAMPR').AsString:=DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsString;
  DMTE.cdsCntCaja.fieldbyname('DCTCAMPA').AsString:=DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsString;

  xNReg:=xNReg+1;
  DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
end;

{******************************************************************************}
procedure TFPagoFacturas.Contab_RegCxP;
var
   xSQL : String;
   xMTOCNTLOC,xMTOCNTEXT :double;
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
//    DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsRegCxP.FieldByName('TMONID').Value;
    DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
//    DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value:=  DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
    if DMTE.cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc then
    begin
{       if DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wtMonLoc then
       begin
          DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
          DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value / DMTE.cdsRegCxP.FieldByName('DETCPAG').Value,15,2);
       end
       else
       begin
          DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
          DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value * DMTE.cdsRegCxP.FieldByName('DETCDOC').Value,15,2);
       end;}
       if DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wtMonLoc then
       begin
          DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value;
          DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value / DMTE.cdsRegCxP.FieldByName('DETCPAG').Value,15,2);
       end
       else
       begin
          DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value;
          DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value * DMTE.cdsRegCxP.FieldByName('DETCDOC').Value,15,2);
       end;
       DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value:= DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value

    end

    else begin
{       if DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wtMonExt then
       begin
          DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
          DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value :=DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value*DMTE.cdsRegCxP.FieldByName('DETCDOC').Value,15,2);
       end
       else
       begin
          DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
          DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value :=DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value*DMTE.cdsRegCxP.FieldByName('DETCDOC').Value,15,2);
       end;}
       if DMTE.cdsRegCxP.FieldByName('TMONID').Value = dblcTMon.Text then
       begin
          DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value;
          DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value :=DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value*DMTE.cdsRegCxP.FieldByName('DETCDOC').Value,15,2);
       end
       else
       begin
          DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value;
          DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value :=DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value/DMTE.cdsRegCxP.FieldByName('DETCDOC').Value,15,2);
       end;
       DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value:= DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value
    end;

    if DMTE.cdsRegCxP.FieldByName('FLAGVAR').AsString='R' then
    	 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:='Retencion del I.G.V.'
    else
    begin
         //a pedido de COUS 06/03/2003
         if DMTE.vRN_GLOSADET='S' then
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsRegCxP.fieldBYName('DEGLOSA').AsString
         else
             DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;

    	 //DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:=DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
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
procedure TFPagoFacturas.Contab_DocPago;
var
   xwhere, XsqL : string;
   xFactor : Integer;
begin
   xWhere:=' CIAID='+quotedstr(DMTE.cdsDocPago.fieldbyname('CIAID').AsString)
          +' and CPANOMES='+quotedstr(DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString)
          +' and TDIARID='+quotedstr(DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString)
          +' and CPNOREG='+quotedstr(DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString);
   if DMTE.RecuperarDatos('CXP301','TMONID',xWhere) then
      xMONID_PROV := DMTE.cdsRec.fieldbyname('TMONID').AsString
   else
		ShowMessage('Error en la recuperación del documento');

	DMTE.cdsCntCaja.FieldByName('CIAID').AsString     := DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
	DMTE.cdsCntCaja.FieldByName('TDIARID').AsString   := DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
	DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString   := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
	DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString  := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
	DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString    := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
	DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString    := 'CXP';
	DMTE.cdsCntCaja.FieldByName('DOCID').AsString     := DMTE.cdsDocPago.FieldByName('DOCID2').AsString;
	DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString   := DMTE.cdsDocPago.FieldByName('CPSERIE').AsString;
	DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString   := DMTE.cdsDocPago.FieldByName('CPNODOC').AsString;
	DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
	DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime;
	DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:= DMTE.cdsDocPago.FieldByName('CPFVCMTO').AsDateTime;
	DMTE.cdsCntCaja.FieldByName('CPTOID').AsString    := DMTE.cdsDocPago.FieldByName('CPTOID').AsString;
	DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString  := DMTE.cdsDocPago.FieldByName('CUENTAID').AsString;
	DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString   := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString;
	DMTE.cdsCntCaja.FieldByName('CCOSID').AsString    := DMTE.cdsDocPago.FieldByName('CCOSID').AsString;
	DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString   := DMTE.cdsEgrCaja.FieldByName('PROV').AsString;
	DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat   := DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat;
	DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat   := DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat;
	DMTE.cdsCntCaja.FieldByName('TMONID').AsString    := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;

   xFactor:=1;
   if DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat>0 then
   	DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'D'
   else
   begin
      xFactor:=-1;
   	DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'H';
   end;

	if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
   begin
		 if xMONID_PROV = DMTE.cdsEgrCaja.FieldByName('TMONID').AsString then
       begin
		 	 xMTOCNTLOC:=DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat*xFactor,15,2 ) ;
		 	 //xMTOCNTEXT:=DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat*xFactor,15,2 ) ;
		 	 xMTOCNTEXT:=DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat*xFactor,15,2 ) ;
		 end
		 else
       begin
		 	 xMTOCNTEXT := DMTE.FRound( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat*xFactor,15,2 ) ;
		 	 xMTOCNTLOC := DMTE.FRound( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat*DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat*xFactor,15,2 ) ;
		 end;
		 DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value   := xMTOCNTLOC;
		 DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value    := xMTOCNTLOC;
		 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
	end
	else
	begin
		 if xMONID_PROV = DMTE.cdsEgrCaja.FieldByName('TMONID').AsString then
       begin
		 	 xMTOCNTEXT := DMTE.FRound( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat*xFactor,15,2 ) ;
		 	 xMTOCNTLOC := DMTE.FRound( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat*DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat*xFactor,15,2 );
		 end
		 else
       begin
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
procedure TFPagoFacturas.Contab_DifCamDocPago;
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
   If (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') and //or
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

           DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.wTMonLoc;

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

procedure TFPagoFacturas.Contab_DifCamDocPago2;
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
procedure TFPagoFacturas.Contab_DifCamRegCxP;
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


procedure TFPagoFacturas.Contab_DifCamRegCxP2;
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
procedure TFPagoFacturas.Contabiliza;
var
   xRegAct : TBookMark;
   xSQL, xWhere    : String;
begin
   xSQL:='delete from CAJA304 '
        +'where CIAID='   +quotedstr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)
        +'  and ECANOMM=' +quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
        +'  and TDIARID=' +quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
        +'  and ECNOCOMP='+quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
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
   ///////////////////////////////////////////////////
   // condicionado para tratar la DETRACCION
   if xDTRPorc=0 then // si no hay DETRACCION
   begin
      DMTE.cdsDocPago.First;
      while not DMTE.cdsDocPago.Eof do
      begin
            ContabilizaProc1;
            DMTE.cdsDocPago.Next;
      end;
   end
   else   // si hay DETRACCION
   begin
      ContabilizaProc1;
   end;
   DMTE.cdsDocPago.GotoBookmark(xRegAct);
   DMTE.cdsDocPago.FreeBookmark(xRegAct);
   DMTE.cdsDocPago.EnableControls;


   if (xDTRPorc>0) and (DMTE.cdsDocPago.FieldByName('TIPDET').AsString='I4') then // si no hay DETRACCION
   else
   begin
    // GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde Docs Registro
       DMTE.cdsRegCxP.DisableControls;
       xRegAct := DMTE.cdsRegCxP.GetBookmark;
       DMTE.cdsRegCxP.First ; // OTROS DOCUMENTOS
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
  end;

 //REGISTROS PARA LAS CUENTAS DE RETENCION PARA EL DEBE Y HABER
 	DMTE.cdsDocPago.DisableControls;
// 	DMTE.cdsDocPago.First;

//  if xDTRPorc=0 then
  Contab_DocPago_RETENCION_HABER;

	DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
	DMTE.cdsDocPago.EnableControls;

	if bLetra then
	begin
		xMtoRetL:=0;
		xMtoRetE:=0;
		xMtoRetLH:=0;
		xMtoRetEH:=0;
  end;
		DMTE.cdsDocPago.DisableControls;
   ///////////////////////////////////////////////////
   // condicionado para tratar la DETRACCION
   if xDTRPorc=0 then // si no hay DETRACCION
   begin
      DMTE.cdsDocPago.First;
      while not DMTE.cdsDocPago.Eof do
      begin
            //ContabilizaProc2;
            DMTE.cdsDocPago.Next;
      end;
   end
   else   // si hay DETRACCION
   begin
      ContabilizaProc2;
   end;
//
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
   while not DMTE.cdsCntCaja.Eof do
   begin
      if DMTE.cdsCntCaja.FieldByname('DCDH').AsString='D' then
      begin
         if DMTE.cdsCntCaja.FieldByname('DCMTOLO').Value <> null then
         begin
				xDebeT :=xDebeT +DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat,15,2);
				xDebeTD:=xDebeTD+DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOEXT').AsFloat,15,2);
			end
			else
         begin
				xDebeT:=xDebeT
			end
      end
		else
      begin
         begin
				if DMTE.cdsCntCaja.FieldByname('DCMTOLO').Value <> null then
            begin
					xHabeT :=xHabeT +DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat,15,2);
					xHabeTD:=xHabeTD+DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOEXT').AsFloat,15,2);
				end
				else
            begin
					xHabeT:=xHabeT;
				end;
			end;
      end;
		DMTE.cdsCntCaja.Next;
	end;
	if ( DMTE.FRound(xDebeT,15,2) <>DMTE.FRound(xHabeT,15,2 ) ) or ( DMTE.FRound(xDebeTD,15,2)<>DMTE.FRound(xHabeTD,15,2) ) then
	begin
		DMTE.cdsCntCaja.Insert;
		AsientoDifTotal;
		DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
	end;
	DMTE.cdsDocPago.EnableControls;
end;


procedure TFPagoFacturas.AsientoDifTotal;
var
   xSQL : string;
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
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:=DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:=DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
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
procedure TFPagoFacturas.z2bbtnContClick(Sender: TObject);
var
   wSql, WTDIARID, WECNOCOMPR : string;
begin
   xMsgContabiliza:='0';
   if (xDTRPorc=0) or (DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString='')then   // si no se aplica la DETRACCION
   begin
      xDTRPorc:=0;
      DMTE.cdsEgrCaja.First;
      ContabCierra;
   end
   else // si se aplica la DETRACCION
   begin
      WTDIARID:=DMTE.cdsDocPago.FieldByName('TDIARID').AsString;
      WECNOCOMPR:=DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString;
      DMTE.cdsEgrCaja.Filter:='';
      DMTE.cdsEgrCaja.Filtered:=False;
      DMTE.cdsEgrCaja.Filter:=' CIAID='+quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
                      +' and ECANOMM=' +quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
                      +' and TDIARID=' +quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
                      +' and ECNOCOMPR='+quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString);
      DMTE.cdsEgrCaja.Filtered:=True;
      DMTE.cdsEgrCaja.First;
      xContabiliza:='SI';
      while not DMTE.cdsEgrCaja.Eof do
      begin
            DMTE.cdsDocPago.Filter:='';
            DMTE.cdsDocPago.Filtered:=False;
            DMTE.cdsDocPago.Filter:=' CIAID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
                                   +' and ECANOMM=' +quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
                                   +' and TDIARID=' +quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
                                   +' and ECNOCOMP='+quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
            DMTE.cdsDocPago.Filtered:=True;

            if xContabiliza='SI' then
               ContabCierra;
            xMsgContabiliza:='1';  // controla que no se presente la pregunta para Contabilizar, en el caso que
                                   // se trate del 2do. registro de la DETRACCION
            DMTE.cdsEgrCaja.Next;
      end;
      //////////////////////////////////////////////////////////////////////////////////
      // se carga nuevamente cdsDocPago y cdsEgrCaja, con los registros que quedaron
      DMTE.cdsDocPago.Filter:='';
      DMTE.cdsDocPago.Filtered:=False;
      DMTE.cdsDocPago.Filter:=' CIAID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
                             +' and ECANOMM=' +quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
                             +' and TDIARID=' +quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
                             +' and ECNOCOMPR='+quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString);
      DMTE.cdsDocPago.Filtered:=True;

      dbgDocPago.RefreshDisplay;
   end;
end;

procedure TFPagoFacturas.ContabCierra;
var
   xSql : string;
begin
   // inicia variables que se acumulan
   xMtol:=0; xMtoE:=0; xMtoTotalL:=0; xMtoTotalE:=0; xMtoTotalHL:=0; xMtoTotalHE:=0;
   xNReg:=0;

   if DMTE.cdsEgrCaja.fieldbyname('ECESTADO').AsString = 'C' then
   begin
      if DMTE.cdsEgrCaja.fieldbyname('FEXTCHQ').AsString = '1' then
      begin
         ShowMessage('No Puede Contabilizar este Movimiento ' + #13 +
                     'Pues se encuentra extornado') ;
         Exit ;
      end;
{
      If DMTE.MesCerrado(copy(edtPeriodo.text,5,2),copy(edtPeriodo.text,1,4),dblcCia.text) then
      begin
         ShowMessage(' Mes cerrado, no se puede contabilizar');
         exit;
      end;
  }    
      if xMsgContabiliza='0' then
      begin
         if MessageDlg('¿Contabilizar y Generar Asientos Automaticos?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
            xContabiliza:='SI'
         else
         begin
            xContabiliza:='NO';
            Exit;
         end;
      end;
      screen.Cursor := crHourGlass ;

      z2bbtnGraba.Enabled     := False ;
      z2bbtnCancelado.Enabled := False ;
      z2bbtnCont.Enabled      := False ;
      z2bbtnAnula.Enabled     := False ;

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

         if xDTRPorc=0 then  // si no se aplica DETRACCION
         begin
            xSQL:='Select * from CAJA302 '
                 +'Where CIAID='''   +dblcCia.Text    +''' and '
                 +      'ECANOMM=''' +edtPeriodo.Text +''' and '
                 +      'TDIARID=''' +dblcTDiario.Text+''' and '
                 +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
            DMTE.cdsEgrCaja.DataRequest( xSQL );
         end;

         DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

         // Para Grabar Registros Adicionales en Caja302
         if Copy(xRegAdicional,1,2)='1.' then
            DMTE.AsientosAdicionales( xRegAdicional );

      end;

      lblEstado.Caption   := 'Cancelado y Contab.' ;
      screen.Cursor       := crDefault ;
   end
   else
   begin
      ShowMessage('Documento no ha sido Cancelado');
   end;
end;

{******************************************************************************}
procedure TFPagoFacturas.z2bbtnAnulaClick(Sender: TObject);
var
   xSQL : String;
begin
   if MessageDlg('¿Anular Comprobante?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
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

      //////////////////////////////////////////////////////////////////////////
      if (xDTRPorc>0) and (DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString<>'') then    // si se aplico la DETRACCION
      begin
		     xSQL:='Update CAJA302 SET ECESTADO=''A'', ECUSER='''+DMTE.wUsuario+''', ECFREG=sysdate, ECHREG=sysdate '
              +'WHERE CIAID='    +quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
              + ' and ECANOMM='  +quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
              + ' and TDIARID='  +quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
              + ' and ECNOCOMPR='+quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString);
         try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         except
         end;

         DMTE.cdsEgrCaja.Refresh;
      end
      else  // si NO se aplico la DETRACCION
      begin
         AnulaCaja302;
      end;
      //////////////////////////////////////////////////////////////////////////

      dbgPendientes.ReadOnly :=True;
      dbgDocPago.ReadOnly    :=True;
      dbgOtros.ReadOnly      :=True;

      //z2bbtnNuevo.Enabled    := True;
      z2bbtnCont.Enabled     := False;
      z2bbtnSube.Enabled     := False;
      z2bbtnGraba.Enabled    := False;
      z2bbtnCancelado.Enabled:= False;
      z2bbtnCancel2.Enabled  := False;
      z2bbtnAnula.Enabled    := False;
      dbgOtrosIButton.Enabled:= False ;
      lblEstado.Caption    :='Anulado            ';
   end;
end;

procedure TFPagoFacturas.AnulaCaja302;
var
   xSQL : String;
begin
		DMTE.cdsEgrCaja.edit;
		DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value   :='A';
		DMTE.cdsEgrCaja.FieldByName('ECUSER').Value     := DMTE.wUsuario; // usuario que registra
		DMTE.cdsEgrCaja.FieldByName('ECFREG').Value     := DateS;         // fecha que registra Usuario
		DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;         // Hora de Registro de Usuario

{		xSQL:='Select * from CAJA302 '
				 +'Where CIAID='''   +dblcCia.Text    +''' and '
				 +      'ECANOMM=''' +edtPeriodo.Text +''' and '
				 +      'TDIARID=''' +dblcTDiario.Text+''' and '
				 +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
		DMTE.cdsEgrCaja.DataRequest( xSQL );
}
		DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');
end;

{******************************************************************************}
procedure TFPagoFacturas.ActPnlBotones;
begin
//   z2bbtnSumat.Enabled    := wbSumat;
   z2bbtnCont.Enabled     := wbCont;
   //z2bbtnNuevo.Enabled    := wbNuevo;
   z2bbtnImprime.Enabled  := wbImprime;
   z2bbtnSube.Enabled     := wbSube;
   z2bbtnGraba.Enabled    := wbGraba;
   z2bbtnCancelado.Enabled:= wbCancelado;
   z2bbtnCancel2.Enabled  := wbCancel2;
   z2bbtnAnula.Enabled    := wbAnula;
//2510   Z2bbtnEmiChq.enabled   := wbChq  ;
end;
{******************************************************************************}
procedure TFPagoFacturas.FormClose(Sender: TObject; var Action: TCloseAction);
var xSQL:string;
begin

 try
   if pnlActualiza.Visible then
   begin
      z2bbtnCancel3.SetFocus ;
      z2bbtnCancel3Click(nil) ;
   end ;

   // Limpiamos los filtros
   with DMTE do
   begin
      cdsRegCxP.Filtered   :=False;
      cdsMovCxP.Filtered   :=False;
      cdsCntCaja.Filtered  :=False;
      if cdsEgrCaja.active then
         cdsEgrCaja.CancelUpdates;
      if cdsRegCxP.Active then
         cdsRegCxP.CancelUpdates;
      if cdsMovCxP.active then
      begin
         cdsMovCxP.CancelUpdates;
         cdsMovCxP.close ;
      end ;
			if cdsDocPago.Active then
				 cdsDocPago.CancelUpdates;

        cdsConsulta.IndexFieldNames:='';
        cdsConsulta.Filter:='';
        cdsConsulta.Filtered:= False;
        cdsConsulta.Close;

				cdsRetencion.IndexFieldNames:='';
				cdsRetencion.Filter:='';
				cdsRetencion.Filtered := False;
				cdsRetencion.Close;

        cf1.QuitarExits(self) ;
        cdsTrans.IndexFieldNames :='';
        cdsTrans.Filter   := '';
        cdsTrans.Filtered := False;

   end ;
   edtCuenta.Enabled := False ;
   Limpiapnlaux;
   //**
  if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='X' then
  begin
    DMTE.cdsEgrCaja.Delete;
    xSQL:='Select * from CAJA302 '
    			+'Where CIAID='''   +dblcCia.Text    +''' and '
    			+      'ECANOMM=''' +edtPeriodo.Text +''' and '
    			+      'TDIARID=''' +dblcTDiario.Text+''' and '
    			+      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
    DMTE.cdsEgrCaja.DataRequest( xSQL );
    DMTE.ControlTran(9,DMTE.cdsEgrCaja,'EGRCAJA');
  end;

  if xDTRPorc=0 then
  begin
     FRegistro.xFiltroEgr.FMant.cds2.Data:=DMTE.cdsEgrCaja.Data;
     FRegistro.xFiltroEgr.FMant.cds2.GotoCurrent( DMTE.cdsEgrCaja );
  end
  else
  begin
     // PARA CARGAR EL FILTRO CON LOS DOS REGISTROS GENERADOS POR LA DETRACCION
     DMTE.cdsEgrCaja.Filter:='';
     DMTE.cdsEgrCaja.Filtered:=False;
     DMTE.cdsEgrCaja.Filter:=' CIAID='+quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
         +' and ECANOMM=' +quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
         +' and TDIARID=' +quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
         +' and ECNOCOMPR='+quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString);
     DMTE.cdsEgrCaja.Filtered:=True;
     DMTE.cdsEgrCaja.First;
     while not DMTE.cdsEgrCaja.Eof do
     begin
           FRegistro.xFiltroEgr.FMant.cds2.Data:=DMTE.cdsEgrCaja.Data;
//           FRegistro.xFiltroEgr.FMant.cds2.GotoCurrent( DMTE.cdsEgrCaja );
           DMTE.cdsEgrCaja.Next;
     end;
     DMTE.cdsEgrCaja.Filter:='';
     DMTE.cdsEgrCaja.Filtered:=False;
     FRegistro.xFiltroEgr.RefreshFilter;
  end;
 except
 end;
  FPagoFacturas:=nil;
  Action:=caFree;
end;
{******************************************************************************}
procedure TFPagoFacturas.IniciaPanel;
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
procedure TFPagoFacturas.dbgOtrosIButtonClick(Sender: TObject);
begin
     inhabilitarpaneles;
     AdicionarRegistros;
end;
{******************************************************************************}
procedure TFPagoFacturas.dbgOtrosKeyDown(Sender: TObject; var Key: Word;
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
procedure TFPagoFacturas.dbdtpFComp2Exit(Sender: TObject);
begin
   DMTE.cdsRegCxP.FieldByName('CPANOMM').Value:=copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value),7,4)
                              +copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value),4,2);
end;

{******************************************************************************}
procedure TFPagoFacturas.z2bbtnSumatClick(Sender: TObject);
Var
   xRegAct : TBookMark;
   xWhere:string;
begin
   bMayorQueMonto:=False;
   DMTE.cdsRegCxP.DisableControls;
   xRegAct := DMTE.cdsRegCxP.GetBookmark;
   xMtoLoc := 0;
   xMtoExt := 0;
   xRetLoc := 0;
   xRetExt := 0;
   DMTE.cdsRegCxP.First ;
   while not DMTE.cdsRegCxP.Eof do
   begin
      if DMTE.cdsRegCxP.FieldByName('DEDH').Value='D' then
      begin
        xMtoLoc:=xMtoLoc + DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
        xMtoExt:=xMtoExt + DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;

         xWhere := 'DOCID='+QuotedStr(DMTE.cdsRegCxP.FieldByName('DOCID2').AsString)+' AND DOCMOD=''CXP''';
         if (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV',xWhere,'DOCRETIGV')='S') AND
            (DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec) AND
            (lblSujetoRetencion.Visible) then
         begin
            xRetLoc:=xRetLoc+DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
            xRetExt:=xRetExt+DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
         end;
          if DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat,15,4)>=DMTE.xTasaMonto then
            bMayorQueMonto:=True;

      end
      else
      begin
        xMtoLoc:=xMtoLoc - DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
        xMtoExt:=xMtoExt - DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
      end;
      DMTE.cdsRegCxP.Next;
   end;
   dbgOtros.ColumnByName('DEMTOLOC').FooterValue:=floattostrf(xMtoLoc, ffFixed, 10, 2);
   dbgOtros.ColumnByName('DEMTOEXT').FooterValue:=floattostrf(xMtoExt, ffFixed, 10, 2);

   DMTE.cdsRegCxP.GotoBookmark(xRegAct);
   DMTE.cdsRegCxP.FreeBookmark(xRegAct);
   DMTE.cdsRegCxP.EnableControls;


   DMTE.cdsDocPago.DisableControls;
   xRegAct := DMTE.cdsDocPago.GetBookmark;
   DMTE.cdsDocPago.First;
   while not DMTE.cdsDocPago.EOF do
   begin
      xWhere := 'DOCID='+QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString)+' AND DOCMOD=''CXP''';
      if (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV',xWhere,'DOCRETIGV')='S') AND
         (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec) AND
         (lblSujetoRetencion.Visible) then
      begin
         xWhere := 'CIAID='+quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
                  +' and CLAUXID='+quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString)
                  +' and PROV='+quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString)
                  +' and CPSERIE='+quotedstr(DMTE.cdsDocPago.FieldByName('CPSERIE').AsString)
                  +' and CPNODOC='+quotedstr(DMTE.cdsDocPago.FieldByName('CPNODOC').AsString)
                  +' and CPESTADO=''P'' ';
         if length(DMTE.DisplayDescrip('prvTGE','CXP301','*',xWhere,'PROV'))>0 then
         begin
            if (DMTE.cdsQry.FieldByName('PROVRETIGV').AsString='S') then
//                   and (DMTE.cdsQry.FieldByName('CPIGV').AsFloat>0) then
            begin
               xRetLoc:=xRetLoc+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
               xRetExt:=xRetExt+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
               bMayorQueMonto:=True
            end
            else
            begin
               if ((DMTE.cdsQry.FieldByName('CPGRAVAD').AsFloat
                    +DMTE.cdsQry.FieldByName('CPIGV').AsFloat)>=DMTE.xTasaMonto)
                   and (DMTE.cdsQry.FieldByName('CPIGV').AsFloat>0) then
               begin
                  xRetLoc:=xRetLoc+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
                  xRetExt:=xRetExt+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
                  bMayorQueMonto:=True;
               end;
            end;
         end;
      end;
//      if DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat,15,4)>=DMTE.xTasaMonto then
//         bMayorQueMonto:=True;


      xMtoLoc:=xMtoLoc + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
      xMtoExt:=xMtoExt + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;

      DMTE.cdsDocPago.Next;
   end;
   DMTE.cdsDocPago.GotoBookmark(xRegAct);
   DMTE.cdsDocPago.FreeBookmark(xRegAct);
   DMTE.cdsDocPago.EnableControls;

//   if (xRetLoc>=DMTE.xTasaMonto) and (bMayorQueMonto) then
   if bMayorQueMonto then
   begin
     xRetLoc:=DMTE.FRound(xRetLoc*DMTE.xTasaPorce/100,15,2);
     xRetExt:=DMTE.FRound(xRetExt*DMTE.xTasaPorce/100,15,2);
   end
   else
   begin
     xRetLoc:=0;
     xRetExt:=0;
   end;

end;

{******************************************************************************}
procedure TFPagoFacturas.dbgDocPagoDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   If (not dbgDocPago.Readonly) then
      Accept:=True;
end;
{******************************************************************************}
procedure TFPagoFacturas.dbgDocPagoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   If (not dbgDocPago.Readonly) then
      dbgDocPago.BeginDrag(False);
end;
{******************************************************************************}
procedure TFPagoFacturas.dbgDocPagoEndDrag(Sender, Target: TObject; X,
  Y: Integer);
var
  wSql, WECNOCOMPR, WTDIARID : string;
begin
   If (not dbgDocPago.Readonly) and (Target=dbgpendientes) Then
   begin
      DMTE.cdsMovCxP.Filtered:=False;

      if DMTE.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                       VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID').AsString,
                                   DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
                                   DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
                                   DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),[]) then
      begin
         ////////////////////////////////////////////////////////////////////////////////////
         // variable que decide si se aplica DETRACCION y por lo tanto se anula la RETENCION
         xDTRPorc:=DMTE.cdsMovCxP.FieldByName('DTRPORC').AsFloat;
         if xDTRPorc>0 then
         begin
            lblSujetoRetencion.Visible:=False;
            WECNOCOMPR:=DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString;
            WTDIARID:=DMTE.cdsDocPago.FieldByName('TDIARID').AsString;
            //////////////////////////////////////////////////////////////////////////////////
             // se eliminan los registros, por si se grabaron anterormente
             wSql:='DELETE FROM CAJA303 WHERE '+
                   'CIAID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CIAID').AsString)+' AND '+
                   'TDIARID='+quotedstr(WTDIARID)+' AND '+
                   'ECANOMM='+quotedstr(DMTE.cdsMovCxp.FieldByName('CPANOMES').AsString)+' AND '+
                   'ECNOCOMPR='+quotedstr(WECNOCOMPR)+' AND '+
                   'CLAUXID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CLAUXID').AsString)+' AND '+
                   'PROV='+quotedstr(DMTE.cdsMovCxp.FieldByName('PROV').AsString);
             DMTE.DCOM1.AppServer.EjecutaSQL(wSQL);

             wSql:='DELETE FROM CAJA302 WHERE '+
                   'CIAID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CIAID').AsString)+' AND '+
                   'TDIARID='+quotedstr(WTDIARID)+' AND '+
                   'ECANOMM='+quotedstr(DMTE.cdsMovCxp.FieldByName('CPANOMES').AsString)+' AND '+
                   'ECNOCOMPR='+quotedstr(WECNOCOMPR)+' AND '+
                   'CLAUXID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CLAUXID').AsString)+' AND '+
                   'PROV='+quotedstr(DMTE.cdsMovCxp.FieldByName('PROV').AsString);
                   //'TIPDET='+quotedstr('I4');
             DMTE.DCOM1.AppServer.EjecutaSQL(wSQL);

             //////////////////////////////////////////////////////////////////////////////////
             // se carga nuevamente cdsDocPago y cdsEgrCaja, con los registros que quedaron
             wSql:='SELECT * FROM CAJA303 WHERE '+
                   'CIAID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CIAID').AsString)+' AND '+
                   'TDIARID='+quotedstr(WTDIARID)+' AND '+
                   'ECANOMM='+quotedstr(DMTE.cdsMovCxp.FieldByName('CPANOMES').AsString)+' AND '+
                   'ECNOCOMPR='+quotedstr(WECNOCOMPR)+' AND '+
                   'CLAUXID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CLAUXID').AsString)+' AND '+
                   'PROV='+quotedstr(DMTE.cdsMovCxp.FieldByName('PROV').AsString);
     				 DMTE.cdsDocPago.Close;
    				 DMTE.cdsDocPago.DataRequest(wSql);
		    		 DMTE.cdsDocPago.Open;
sHOWmESSAGE('jcc01'+Wsql);

             wSql:='SELECT * FROM  CAJA302 WHERE '+
                   'CIAID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CIAID').AsString)+' AND '+
                   'TDIARID='+quotedstr(WTDIARID)+' AND '+
                   'ECANOMM='+quotedstr(DMTE.cdsMovCxp.FieldByName('CPANOMES').AsString)+' AND '+
                   'ECNOCOMPR='+quotedstr(WECNOCOMPR)+' AND '+
                   'CLAUXID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CLAUXID').AsString)+' AND '+
                   'PROV='+quotedstr(DMTE.cdsMovCxp.FieldByName('PROV').AsString);
     				 DMTE.cdsEgrCaja.Close;
    				 DMTE.cdsEgrCaja.DataRequest(wSql);
		    		 DMTE.cdsEgrCaja.Open;
sHOWmESSAGE('jcc02'+Wsql);

             // esto se realiza para mantener la logica del programa, cuando se presiona z2bbtnOKCab
             GrabaCabeceraDeComprobante;
             ////////////////////////////////////////////////////////////////////////////////////
         end
         else
            DMTE.cdsDocPago.Delete;
         ////////////////////////////////////////////////////////////////////////////////////
         DMTE.cdsMovCxP.Edit ;
         DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.cdsMovCxP.FieldByName('CPMTOEXT').Value - DMTE.NumeroNoNulo( DMTE.cdsMovCxP.FieldByName('CPPAGEXT') ) ;
         DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.cdsMovCxP.FieldByName('CPMTOLOC').Value - DMTE.NumeroNoNulo( DMTE.cdsMovCxP.FieldByName('CPPAGLOC') ) ;
         DMTE.cdsMovCxP.FieldByName('CPHREG').Value   := time;
         if DMTE.cdsMovCxP.FieldByName('TMONID').Value=DMTE.wTMonLoc then
            DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat
         else
            DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat ;

         ////////////////////////////////////////////////////////////////////////////////////
         // esto se realiza para mantener la logica del programa, cuando se presiona z2bbtnOK
         if xDTRPorc>0 then
         begin
             DMTE.AplicaDatos(DMTE.cdsMovCxp,'');
             z2bbtnOKClick(Self);
         end;
         ////////////////////////////////////////////////////////////////////////////////////
         dbgPendientes.RefreshDisplay;
         dbgDocPago.RefreshDisplay;
      end;
      DMTE.cdsMovCxP.Filtered:=True;
      wmodifica:=True;
      z2bbtnSumatDocPagoClick(nil) ;
   end;
end;
{******************************************************************************}
Procedure TFPagoFacturas.LimpiaFiltros;
begin
   // Limpiando filtros si lo tuvieran
   DMTE.cdsMovCxP.Filtered  :=False;
   DMTE.cdsCntCaja.Filtered :=False;
   DMTE.cdsRegCxP.Filtered  :=False;
end;

{******************************************************************************}
{*********************** PROCEDIMIENTOS ADICIONALES   *************************}
procedure TFPagoFacturas.ActivaFiltro(xName:string);
var
   xFiltro ,
   xWhere : String ;
	 sDocumentos,xSQL   : String ;
begin
    xName := uppercase(xName);

    if xName='REGCXP' then
		begin
				 DMTE.cdsQry.Close;
				 DMTE.cdsQry.DataRequest('SELECT DOCID FROM TGE110 WHERE (DOCMOD=''CAJA'' OR DOCMOD=''CXP'') AND DOCRESTA=''S''');
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
       if length(DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString)>0 then
       begin   // por ser registros al que se les ha aplicado la DETRACCION
    		  xSQL:='Select * from CAJA303 '
					    	+'Where CIAID='''   +dblcCia.Text    +''' and '
    						+      'ECANOMM=''' +edtPeriodo.Text +''' and '
    						+      'TDIARID=''' +dblcTDiario.Text+''' and '
		    				+      'ECNOCOMPR='''+DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString+''' ';
       end
       else
       begin
    		  xSQL:='Select * from CAJA303 '
					     +'Where CIAID='''   +dblcCia.Text    +''' and '
     					 +      'ECANOMM=''' +edtPeriodo.Text +''' and '
           		 +      'TDIARID=''' +dblcTDiario.Text+''' and '
						   +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
       end;
sHOWmESSAGE('jcc03'+xSQL);

       // VHNDEMA
       DMTE.cdsDocPago.Filter:='';
       DMTE.cdsDocPago.Filtered:=False;
       // END VHNDEMA
			 DMTE.cdsDocPago.Close;
			 DMTE.cdsDocPago.DataRequest( xSQL );
			 DMTE.cdsDocPago.Open;
       /////////////////////////////////////////////////////////////////////////
       // para determinar si se aplica DETRACCION y se anula la RETENCION
       if DMTE.cdsDocPago.RecordCount>0 then
       begin
          xSQL:='Select * from CXP301 '
               +'Where CIAID='''   +dblcCia.Text    +''' and '
               // VHNDEMA
               +      'CPANOMES='+quotedstr(DMTE.cdsDocPago.FieldbyName('CPANOMM').AsString)+' and '
               // END VHNDEMA
               +      'TDIARID=' +quotedstr(DMTE.cdsDocPago.FieldbyName('TDIARID2').AsString)+' and '
               +      'CPNOREG=' +quotedstr(DMTE.cdsDocPago.FieldbyName('CPNOREG').AsString);
          DMTE.cdsQry3.Close;
          DMTE.cdsQry3.DataRequest( xSQL );
          DMTE.cdsQry3.Open;
          lblDTR.Visible:=False;
          // variable que decide si se aplica DETRACCION y por lo tanto se anula la RETENCION
          xDTRPorc:=DMTE.cdsQry3.FieldByName('DTRPORC').AsFloat;
          if xDTRPorc>0 then
          begin
             lblSujetoRetencion.Visible:=False;
             lblDTR.Caption:=lblDTR.Caption+'  No. '+DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString;
             if DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString<>'' then
                lblDTR.Visible:=True;
          end;
       end;
       /////////////////////////////////////////////////////////////////////////
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


			 DMTE.cdsMovCxP.Close ;

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

			 DMTE.cdsMovCxP.Datarequest( 'SELECT * FROM CXP301 WHERE ' + xWhere+sDocumentos+' order by CPANOMES DESC, DOCID, CPSERIE, CPNODOC' ) ;
			 DMTE.cdsMovCxP.Active := True ;
//       DMTE.cdsMovCxP.IndexFieldNames:='CLAUXID;PROV;CPFEMIS';
       //DMTE.cdsMovCxP.IndexFieldNames:='CPANOMES';

			 xFiltro:=' (((CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR '+
								'   ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) '  ;

			 DMTE.cdsMovCxP.Filter  := '';
			 DMTE.cdsMovCxP.Filter  := xFiltro ;
			 DMTE.cdsMovCxP.Filtered:= True;

		end;
end;
{******************************************************************************}
Procedure TFPagoFacturas.CambiaEstado(xName:char);
begin
	 case xName of
		 'I':begin  //Si está INCOMPLETO o PENDIENTE
            lblEstado.Caption    :='Activo             ';
            pnlCabecera1.Enabled := False;
            pnlCabecera2.Enabled := True;
            z2bbtnOk.Enabled       := True;
            z2bbtnCancel.Enabled   := True;
            pnlDetalle.Enabled   := True;     // Activar Panel de Detalle
            pnlBotones.Enabled   := True;     // Activar Panel de Botones

            dbgPendientes.ReadOnly :=false ;
            dbgDocPago.ReadOnly    :=False ;
            dbgOtros.ReadOnly      :=False ;

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
            z2bbtnOk.Enabled       := False;
            z2bbtnCancel.Enabled   := False;
            pnlDetalle.Enabled   := True;     // Activar Panel de Detalle
            pnlBotones.Enabled   := True;     // Activar Panel de Botones

            dbgPendientes.ReadOnly :=True;
            dbgDocPago.ReadOnly    :=True;
            dbgOtros.ReadOnly      :=True;


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
            z2bbtnOk.Enabled        := False;
            z2bbtnCancel.Enabled    := False;
            pnlDetalle.Enabled   := True;     // Activar Panel de Detalle
            pnlBotones.Enabled   := True;     // Activar Panel de Botones

            dbgPendientes.ReadOnly :=True;
            dbgDocPago.ReadOnly    :=True;
            dbgOtros.ReadOnly      :=True;

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
            z2bbtnOk.Enabled       := True;
            z2bbtnCancel.Enabled   := True;
            pnlDetalle.Enabled   := False;     // Desactivar Panel de Detalle
            pnlBotones.Enabled   := False;     // Desactivar Panel de Botones

            dbgPendientes.ReadOnly := False ;
            dbgDocPago.ReadOnly    := False ;
            dbgOtros.ReadOnly      := False ;

//
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
procedure TFPagoFacturas.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   if (dbgPendientes.Readonly = False) then
       Accept:=True;
end;
{******************************************************************************}
procedure TFPagoFacturas.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if (dbgPendientes.Readonly = False) then
      dbgPendientes.BeginDrag(False)  ;
end;
{******************************************************************************}
procedure TFPagoFacturas.dbgPendientesEndDrag(Sender, Target: TObject; X,Y: Integer);
var
   i, xFactor : integer;
   xResta, xWhere : String;
begin
   if (not dbgPendientes.Readonly) and (Target=dbgDocPago) Then
   begin
      {
      if DMTE.cdsMovCxP.FieldByName('TMONID').AsString<>DMTE.cdsCCBco.fieldbyname('TMONID').AsString then
      begin
         Showmessage('La Provision está en un TIPO de MONEDA diferente a la Cta.Cte del Banco');
         Exit;
      end;
      }
      DMTE.cdsMovCxP.DisableControls;
      // Añade los Nuevos Registros
      DMTE.cdsDocPago.DisableControls;
      for i:= 0 to dbgPendientes.SelectedList.Count-1 do
      begin
          dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);

         ////////////////////////////////////////////////////////////////////////////////////
         // variable que decide si se aplica DETRACCION y por lo tanto se anula la RETENCION
         xDTRPorc:=DMTE.cdsMovCxP.FieldByName('DTRPORC').AsFloat;
         if xDTRPorc>0 then
         begin
            z2bbtnGraba.Enabled:=True;
            lblSujetoRetencion.Visible:=False;
         end;
         ////////////////////////////////////////////////////////////////////////////////////

          // se Añade para saber si documento suma o resta
          xWhere:='DOCID=''' +DMTE.cdsMovCxP.FieldByName('DOCID').AsString+''' and '
                 +'DOCMOD='''+'CXP'+''' ';
		    xResta:=DMTE.DisplayDescrip( 'prvQry2', 'TGE110', 'DOCRESTA', xWhere, 'DOCRESTA' );
          xFactor:=1;
          if xResta='S' then xFactor:=-1;
          // end vhn

          DMTE.cdsDocPago.Insert;
          DMTE.cdsDocPago.FieldByName('CIAID').Value    := dblcCia.Text;
          DMTE.cdsDocPago.FieldByName('TDIARID').Value  := dblcTDiario.Text;
          DMTE.cdsDocPago.FieldByName('ECANOMM').Value  := edtPeriodo.Text;
          DMTE.cdsDocPago.FieldByName('ECNOCOMP').Value := dbeNoComp.Text;

          DMTE.cdsDocPago.FieldByName('TDIARID2').Value := DMTE.cdsMovCxP.FieldByName('TDIARID').Value;
          DMTE.cdsDocPago.FieldByName('CPANOMM').Value  := DMTE.cdsMovCxP.FieldByName('CPANOMES').Value;
          DMTE.cdsDocPago.FieldByName('CPNOREG').Value  := DMTE.cdsMovCxP.FieldByName('CPNOREG').Value;
          DMTE.cdsDocPago.FieldByName('DOCID2').Value   := DMTE.cdsMovCxP.FieldByName('DOCID').Value;
          DMTE.cdsDocPago.FieldByName('CPSERIE').Value  := DMTE.cdsMovCxP.FieldByName('CPSERIE').Value;
          DMTE.cdsDocPago.FieldByName('CPNODOC').Value  := DMTE.cdsMovCxP.FieldByName('CPNODOC').Value;
          DMTE.cdsDocPago.FieldByName('TMONID').Value   := DMTE.cdsMovCxP.FieldByName('TMONID').Value;
          DMTE.cdsDocPago.FieldByName('DETCDOC').Value  := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPTCAMAJ').Value,8,3);
          DMTE.cdsDocPago.FieldByName('DETCPAG').Value  := DMTE.FRound(strtofloat(dbeTCambio.Text),5,3);
          DMTE.cdsDocPago.FieldByName('CPTOID').Value   := DMTE.cdsMovCxP.FieldByName('CPTOTOT').Value;
          DMTE.cdsDocPago.FieldByName('CUENTAID').Value := DMTE.cdsMovCxP.FieldByName('CTATOTAL').Value;
          DMTE.cdsDocPago.FieldByName('CPFEMIS').Value  := DMTE.cdsMovCxP.FieldByName('CPFEMIS').Value;
          DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value := DMTE.cdsMovCxP.FieldByName('CPFVCMTO').Value;
          DMTE.cdsDocPago.FieldByName('DEANO').Value    := DMTE.cdsMovCxP.FieldByName('CPAAAA').Value;
          DMTE.cdsDocPago.FieldByName('DEMM').Value     := DMTE.cdsMovCxP.FieldByName('CPMM').Value;
          DMTE.cdsDocPago.FieldByName('DEDD').Value     := DMTE.cdsMovCxP.FieldByName('CPDD').Value;
          DMTE.cdsDocPago.FieldByName('DESS').Value     := DMTE.cdsMovCxP.FieldByName('CPSS').Value;
          DMTE.cdsDocPago.FieldByName('DESEM').Value    := DMTE.cdsMovCxP.FieldByName('CPSem').Value;
          DMTE.cdsDocPago.FieldByName('DETRI').Value    := DMTE.cdsMovCxP.FieldByName('CPTri').Value;
          DMTE.cdsDocPago.FieldByName('DEAASS').Value   := DMTE.cdsMovCxP.FieldByName('CPAASS').Value;
          DMTE.cdsDocPago.FieldByName('DEAASEM').Value  := DMTE.cdsMovCxP.FieldByName('CPAASem').Value;
          DMTE.cdsDocPago.FieldByName('DEAATRI').Value  := DMTE.cdsMovCxP.FieldByName('CPAATri').Value;
          DMTE.cdsDocPago.FieldByName('PROV').Value     := DMTE.cdsMovCxP.FieldByName('PROV').Value;
          DMTE.cdsDocPago.FieldByName('PROVDES').AsString  := DMTE.cdsMovCxP.FieldByName('PROVDES').AsString;
          DMTE.cdsDocPago.FieldByName('PROVRUC').Value  := DMTE.cdsMovCxP.FieldByName('PROVRUC').Value;
          if DMTE.cdsDocPago.FieldByName('TMONID').Value=DMTE.wtMonLoc then
          begin
             DMTE.cdsDocPago.FieldByName('DESALLOC').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value*xFactor,15,2);
             DMTE.cdsDocPago.FieldByName('DESALEXT').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value
                                          /DMTE.cdsDocPago.FieldByName('DETCPAG').Value*xFactor,15,2);
          end
          else
          begin
             DMTE.cdsDocPago.FieldByName('DESALEXT').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value*xFactor,15,2);
             DMTE.cdsDocPago.FieldByName('DESALLOC').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value
                                          *DMTE.cdsDocPago.FieldByName('DETCPAG').Value*xFactor,15,2);
          end;

          DMTE.cdsDocPago.FieldByName('DEANTMN').Value  := 0;
          DMTE.cdsDocPago.FieldByName('DEANTME').Value  := 0;
          DMTE.cdsDocPago.FieldByName('DEMTOORI').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').Value*xFactor,15,2);
          DMTE.cdsDocPago.FieldByName('DEMTOLOC').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALLOC').Value,15,2);
          DMTE.cdsDocPago.FieldByName('DEMTOEXT').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALEXT').Value,15,2);
          DMTE.cdsDocPago.FieldByName('DEUSER').Value   := DMTE.wUsuario;
          DMTE.cdsDocPago.FieldByName('DEFREG').Value   := dateS;
          DMTE.cdsDocPago.FieldByName('DEHREG').Value   := time;
          DMTE.cdsDocPago.fieldbyname('CLAUXID').AsString := DMTE.cdsMovCxP.FieldByName('CLAUXID').AsString;
          DMTE.cdsDocPago.Post;

          DMTE.cdsMovCxP.Edit;
          DMTE.cdsMovCxP.FieldByName('CPSALORI').Value := 0;
          DMTE.cdsMovCxP.Post;

          dbgPendientes.datasource.dataset.Freebookmark(dbgPendientes.SelectedList.items[i]) ;
      end;

      DMTE.cdsMovCxP.EnableControls;
      dbgPendientes.SelectedList.clear;  { Clear selected record list since they are all deleted}
      dbgPendientes.RefreshDisplay;
      dbgDocPago.RefreshDisplay;
      DMTE.cdsDocPago.EnableControls;
      z2bbtnSumatDocPagoClick(nil);
      wmodifica:=True;
   end;
end;

procedure TFPagoFacturas.dbgDocPagoColExit(Sender: TObject);
begin
   z2bbtnSumatDocPagoClick(nil) ;
   dbgDocPago.RefreshDisplay;
end;

{******************************************************************************}

procedure TFPagoFacturas.ActSaldosMovCxP;
var
   xRegAct : TBookMark;
   xAdicional, nFactor : Double ;
   xMontoL,xMontoE : String;
   xLoc,xExt,xOri,xcia,xtdia,xperio,ssql,xnreg   : String ;
begin
 TRY
   DMTE.cdsMovCxP.DisableControls;
   DMTE.cdsMovCxP.Filtered:=False;
   DMTE.cdsDocPago.DisableControls;
   xRegAct := DMTE.cdsDocPago.GetBookmark;
   DMTE.cdsDocPago.First;
   while not DMTE.cdsDocPago.Eof do
   begin
   	  if DMTE.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                                 VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID').AsString,
                                             DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
                                             DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
                                             DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),[]) then
      begin
         ssql   := 'select * from CXP301 '
   					+' WHERE CIAID='+quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
                  +' AND TDIARID='+quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID2').AsString)
                  +' AND CPANOMES='+quotedstr(DMTE.cdsDocPago.FieldByName('CPANOMM').AsString)
                  +' AND CPNOREG='+quotedstr(DMTE.cdsDocPago.FieldByName('CPNOREG').AsString);
         DMTE.cdsQry5.Filter:='';
         DMTE.cdsQry5.Filtered:=False;
         DMTE.cdsQry5.IndexFieldNames:='';
         DMTE.cdsQry5.Close;
         DMTE.cdsQry5.Datarequest( sSQL );
         DMTE.cdsQry5.Open;
         if (DMTE.cdsQry5.FieldByName('CPSALLOC').AsFloat<>DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat) then
         begin
            ShowMessage('Error, se ha realizado la actualización de la misma Obligación por otra estación');
            xErrorGraba := True;
            exit;
         end;

         // vhndema
         nFactor:=1;
         IF DMTE.cdsDocPago.FieldByName('DOCID2').AsSTRING='07' then nFactor:=-1;

      	 DMTE.cdsMovCxP.edit ;
   		   if DMTE.cdsMovCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc then
     	   begin
            xMontoL := FloatToStrF(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat*nFactor,ffFixed,8,2);

   	    		DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat -
                                                                    DMTE.numerononulo(DMTE.cdsMovCxP.FieldByName('CPPAGLOC'))-
                                                                    StrToFloat(xMontoL),15,2);
            DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat,15,2) ;
         // Cálculo del otro Saldo
            xAdicional := DMTE.FRound(StrToFloat(xMontoL) / DMTE.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat,15,2 ) ;
            DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat -
                                                                  DMTE.numerononulo(DMTE.cdsMovCxP.FieldByName('CPPAGEXT'))-
                                                                  xAdicional,15,2) ;
         end
         else
         begin
            xMontoE := FloatToStrF(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat*nFactor,ffFixed,8,2);
            DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat -
                                                                    DMTE.numerononulo(DMTE.cdsMovCxP.FieldByName('CPPAGEXT'))-
                                                                    StrToFloat(xMontoE),15,2);
            DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat,15,2);
            xAdicional := DMTE.FRound(StrToFloat(xMontoE) * DMTE.cdsMovCxp.FieldByName('CPTCAMAJ').AsFloat,15,2); // ) ;
            DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat -
                                                                  DMTE.numerononulo(DMTE.cdsMovCxP.FieldByName('CPPAGLOC'))-
                                                                  xAdicional,15,2);
         end;
         // end vhndema

         xLoc   := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsString ;
         xExt   := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsString ;
         xOri   := DMTE.cdsMovCxP.FieldByName('CPSALORI').AsString ;
         xcia   := trim(dblccia.text) ;
         xtdia  := DMTE.cdsMovCxp.fieldbyname('TDIARID').AsString ;
         xperio := DMTE.cdsMovCxp.fieldbyname('CPANOMES').AsString ;
         xnreg  := DMTE.cdsMovCxp.fieldbyname('CPNOREG').AsString ;
         ssql   := 'UPDATE CXP301 '
                  +'SET CPSALLOC ='+xloc
                  +' ,CPSALEXT ='+xext
                  +' ,CPSALORI ='+xori
   					+' WHERE CIAID='+quotedstr(xcia)
                  +' AND TDIARID='+quotedstr(xtdia)
                  +' AND CPANOMES='+quotedstr(xperio)
                  +' AND CPNOREG='+quotedstr(xnreg);
         try
          //DCOM1.AppServer.EjecutaSQL(ssql);
         except
         end;
         if DMTE.cdsMovCxP.FieldByName('CPPAGLOC').IsNull then
            DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := 0 ;
         if DMTE.cdsMovCxP.FieldByName('CPPAGEXT').IsNull then
            DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := 0 ;
         if DMTE.cdsMovCxP.FieldByName('CPPAGORI').IsNull then
            DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := 0 ;
         DMTE.cdsMovCxP.post;
         DMTE.ControlTran(0,DMTE.cdsMovCxP, 'MOVCXP');
      end
		else

         Showmessage('No se Actualizó CXP ');
      DMTE.cdsDocPago.Next;
   end;
 FINALLY
   DMTE.cdsDocPago.GotoBookmark(xRegAct) ;
   DMTE.cdsDocPago.FreeBookmark(xRegAct) ;
   DMTE.cdsDocPago.EnableControls        ;
   DMTE.cdsMovCxP.Filtered:=True         ;
   DMTE.cdsMovCxP.EnableControls         ;
 END
end;
{******************************************************************************}
procedure TFPagoFacturas.ActMovCxP;
var
   xRegAct : TBookMark;
   ssql    : string;
   xtcam, xori, xext, xloc    : string;
   xcia, xtdia, xperio, xnreg : string;
begin
   with DMTE do
   begin
      cdsMovCxP.Filtered:=False;
      cdsMovCxP.First;
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
           //CLG: 20/10/2003
           //DMTE.AplicaDatos(DMTE.cdsMovCxP, 'MOVCXP');
           DMTE.ControlTran(0,DMTE.cdsMovCxP, 'MOVCXP');

         end
        else
        begin
            ShowMessage('Error : No pudo ubicar el Documento Provisionado') ;
        end ;
        cdsDocPago.Next;
      end;

      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);
      cdsDocPago.EnableControls;
      cdsMovCxP.Filtered:=True;
      cdsMovCxP.First;
      cdsMovCxP.EnableControls;
   end;
end;

procedure TFPagoFacturas.RetornaSaldosMovCxP;
begin
	 DMTE.cdsMovCxP.DisableControls;
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
       end;
       DMTE.cdsDocPago.Next;
   end;
   DMTE.cdsDocPago.EnableControls;
   DMTE.cdsMovCxP.Filtered:=True;
   DMTE.cdsMovCxP.EnableControls;
end;


procedure TFPagoFacturas.RetornaSaldosMovCxPPagados;
var
   xSQL : String;
begin
	DMTE.cdsDocPago.DisableControls;
	DMTE.cdsDocPago.First;
	while not DMTE.cdsDocPago.Eof do
	begin
		xSQL:='Select * from CXP301 '
				 +'WHERE CIAID='''   +DMTE.cdsDocPago.FieldByName('CIAID').AsString   +''' and '
				 +      'TDIARID=''' +DMTE.cdsDocPago.FieldByName('TDIARID2').AsString+''' and '
				 +      'CPANOMES='''+DMTE.cdsDocPago.FieldByName('CPANOMM').AsString +''' and '
				 +      'CPNOREG=''' +DMTE.cdsDocPago.FieldByName('CPNOREG').AsString +'''';
    DMTE.cdsMovCxP.IndexFieldnames := '';
    DMTE.cdsMovCxP.Filter := '';
    DMTE.cdsMovCxP.Filtered := False;
		DMTE.cdsMovCxP.Close;
		DMTE.cdsMovCxP.DataRequest( xSQL );
		DMTE.cdsMovCxP.Open;

		DMTE.cdsMovCxP.edit;

		DMTE.cdsMovCxP.FieldByName('CPESTADO').Value := 'P';



		if DMTE.cdsMovCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
      begin
    		DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat + Abs(DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat),15,2);
    		DMTE.cdsMovCxP.FieldByName('CPSALORI').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat,15,2);
   		  DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat / DMTE.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat,15,2);
      end
      else begin
    		DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat + Abs(DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat),15,2);
    		DMTE.cdsMovCxP.FieldByName('CPSALORI').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat,15,2);
    		DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat * DMTE.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat,15,2);
      end;

		DMTE.cdsMovCxP.FieldByName('CPPAGEXT').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat-DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat,15,2);
		DMTE.cdsMovCxP.FieldByName('CPPAGLOC').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat-DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat,15,2);
		DMTE.cdsMovCxP.FieldByName('CPPAGORI').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat-DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat,15,2);

    if DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat<0 then
    begin
       DMTE.cdsMovCxP.FieldByName('CPPAGEXT').Value:=0;
		   DMTE.cdsMovCxP.FieldByName('CPPAGLOC').Value:=0;
		   DMTE.cdsMovCxP.FieldByName('CPPAGORI').Value:=0;
    end;

    if DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALORI').Value,15,2)>DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat,15,2) then
    begin
   		 DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat,15,2);
   		 DMTE.cdsMovCxP.FieldByName('CPSALORI').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat,15,2);
   		 DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat,15,2);
    end;

    try
		DMTE.AplicaDatos(DMTE.cdsMovCxP, 'MOVCXP');
    except
    end;

		DMTE.SaldosAuxiliar( DMTE.cdsMovCxP.FieldByName('CIAID').AsString,   DMTE.cdsMovCxP.fieldbyname('CPANOMES').AsString,
								  DMTE.cdsMovCxP.fieldbyname('CLAUXID').AsString, DMTE.cdsMovCxP.fieldbyname('PROV').AsString, '+',
								  DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat, DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat, DMTE.cdsMovCxP.fieldbyname('TMONID').AsString);
      DMTE.cdsDocPago.Next;
   end;

   DMTE.cdsDocPago.EnableControls;
end;


procedure TFPagoFacturas.dbgOtrosCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
{  if (Field.FieldName = 'DEMTOLOC') or (Field.FieldName = 'DEMTOEXT') then begin
	if (DMTE.cdsRegCxPDEDH.Value = 'H') then
      AFont.Color := clRed
   else
      AFont.Color := clBlue;
   end; }
end;

procedure TFPagoFacturas.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFPagoFacturas.z2bbtnOKCabClick(Sender: TObject);
var
   xWhere : String;
   xSQL   : string;
begin
{   if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, dblcCCBco.text, dbdtpFComp.Date ) then
   begin
      Showmessage('Error : Mes de Fecha Fue Cerrado. Verificar...');
      dbdtpFComp.SetFocus;
      Exit;
   end;

    if not DiaAperturado(dblcCia.text,dbdtpFComp.Date,dblcBanco.text) then
    Begin
      dbdtpFComp.setfocus;
      Exit;
    End;        }

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

         // 9729 ORACLE Y 13059 DB2NT
         if ( DMTE.wCodigoError=9729 ) or
            ( DMTE.wCodigoError=13059 ) then
         begin
            dbeNoComp.SetFocus;
            Exit;
         end;

         ActivaFiltro('REGCXP')  ;
         ActivaFiltro('DOCPAGO') ;
        //0805
        //liberamos el filtro del detalle
         DMTE.cdsRegCxP.Filtered := False ;

         CambiaEstado('N');
         ActPnlBotones;
      end;
   end;
   (Sender as tcontrol).enabled:=false;
   perform(CM_DialogKey,VK_TAB,0);
   wmodifica:=False;
end;

procedure TFPagoFacturas.dbeNoCompExit(Sender: TObject);
begin
   dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
end;

procedure TFPagoFacturas.dbgDocPagoCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'DEMTOLOC') or (AFieldName = 'DEMTOEXT') then
       ABrush.Color := clWhite;
end;

procedure TFPagoFacturas.dbgOtrosCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'DEMTOLOC') or (AFieldName = 'DEMTOEXT') then
       ABrush.Color := clWhite;
end;

procedure TFPagoFacturas.InhabilitarPaneles;
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

procedure TFPagoFacturas.EdiTarRegistros;
begin
   BlanqueaEdits (pnlActualiza) ;
   DMTE.cdsRegCxP.Edit;    //Lo pongo en modo de edicion
   dbeNoReg.Text:=DMTE.cdsRegCxP.FieldByName('CPNOREG').Value  ;
   dbeNoReg.Enabled:=false;
   lblEstado.Caption := 'En Edicion';//CLG
   dbeNoReg.Enabled := False;
   dbeNoReg.Color   := clBtnFace;

   if not DMTE.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClase.Text ]),[]) then
      Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''') ;

   //Recuperacion de los detalles del panel
   edtCnp2.Text:= DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString;
   if (trim( dblcTDoc2.Text ) <> '') and (Trim(edtCnp2.Text)='') then
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

procedure TFPagoFacturas.AdicionarRegistros;
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

      if Length(DMTE.cdsRegCxP.FieldByName('DOCID2').AsString)>0 then
        DMTE.cdsRegCxP.FieldByName('DOCMOD').AsString:=wDocModulo
      else
        DMTE.cdsRegCxP.FieldByName('DOCMOD').Clear;


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
   lblEstado.Caption := 'Nuevo     ';//CLG
   cdsTDiarioDet.Filter  :='TDIARID=''''';
   cdsTDiarioDet.Filtered:=True;

   if not DMTE.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClase.Text ]),[]) then
      Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''') ;

end;

procedure TFPagoFacturas.LiberarFiltrosRegistroEgresos;
begin
      DMTE.cdsTDoc.Filter:='';
      DMTE.cdsTDoc.Filtered:=true;
{
      DMTE.cdsTDiario.Filter:='';
      DMTE.cdsTDiario.Filtered:=true;
}
end;

procedure TFPagoFacturas.EstablecerFiltrosRegistroEgresos;
begin
   DMTE.cdsTDoc.Filter := 'NOT ( TDIARID IS NULL) OR NOT (TDIARID2 IS NULL) ' ;
   DMTE.cdsTDoc.Filtered := true;
end;


procedure TFPagoFacturas.dbeNoRegExit(Sender: TObject);
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

procedure TFPagoFacturas.z2bbtnOK2Click(Sender: TObject);
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
      if Length(DMTE.cdsRegCxP.FieldByName('DOCID2').AsString)>0 then
        DMTE.cdsRegCxP.FieldByName('DOCMOD').AsString:=wDocModulo
      else
        DMTE.cdsRegCxP.FieldByName('DOCMOD').Clear;

      DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString:= edtCnp2.Text;
      DMTE.cdsRegCxP.Post;
      ShowMessage('Grabación Ok');
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


procedure TFPagoFacturas.dblcTMon2Exit(Sender: TObject);
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

procedure TFPagoFacturas.dbeDHChange(Sender: TObject);
begin
     if not ((dbeDH.Text='D') or (dbeDH.Text='H') or (length(dbeDH.Text)=0)) then
     begin
        dbeDH.Text:='';
        dbeDH.SetFocus;
     end;
end;

procedure TFPagoFacturas.dbeImporte2Exit(Sender: TObject);
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


procedure TFPagoFacturas.z2bbtnCancel3Click(Sender: TObject);
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

procedure TFPagoFacturas.dbgOtrosDblClick(Sender: TObject);
begin
   if not dbgOtrosIbutton.Enabled then
      exit ;

   if dbgOtros.DataSource.DataSet.RecordCount<>0 then
   begin
      inHabilitarPaneles;
      editarRegistros;
   end;
end;

function TFPagoFacturas.ValidacionCabecera: Boolean;
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

procedure TFPagoFacturas.z2bbtnImprimeClick(Sender: TObject);
var
	 xWhere, xxAA, xSQL44 : String;
begin
// Si el comprobante de caja no ha sido contabilizado

  if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='A' then
  begin
     ImprimeVoucher( 'CNT311', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text,dbeNoComp.Text, dbeGlosa.Text );
     Exit;
  end;

   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' THEN
   begin
      ShowMessage('Para Imprimir Comprobante, Debe Contabilizar el Voucher ');
      Exit;
   end;

// inicia variables que se acumulan
  xMtol:=0; xMtoE:=0; xMtoTotalL:=0; xMtoTotalE:=0; xMtoTotalHL:=0; xMtoTotalHE:=0;
  xNReg:=0; //xRO:=0; xRL:=0; xRE:=0;
  if xDTRPorc>0 then
  begin
     // PARA UBICAR EL REGISTRO SELECCIONADO EN EL DBGDOCPAGO(CAJA303) COINCIDA CON EL CAJA302
     DMTE.cdsEgrCaja.Filter:='';
     DMTE.cdsEgrCaja.Filtered:=False;
     DMTE.cdsEgrCaja.Filter:=' CIAID='+quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
       +' and ECANOMM=' +quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
       +' and TDIARID=' +quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
       +' and ECNOCOMP='+quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString);
     DMTE.cdsEgrCaja.Filtered:=True;

     if DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString='' then xDTRPorc:=0;

     if DMTE.cdsEgrCaja.Recordcount<=0 then
     begin

        xSQL44:='Select * from CAJA302 '
               +'Where CIAID='  +quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString   )
               +' and ECANOMM=' +quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString )
               +' and TDIARID=' +quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString )
               +' and ECNOCOMP='+quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString);
        DMTE.cdsEgrCaja.Close;
        DMTE.cdsEgrCaja.Filtered:=False;
        DMTE.cdsEgrCaja.Filter:='';
        DMTE.cdsEgrCaja.DataRequest( xSQL44 );
        DMTE.cdsEgrCaja.Open;
     end;
  end;

  if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' then
 	begin
   // recupera Conceptos y Cuentas por diferencia de cambio
     	RecCptosDifC;
   //
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

      if xDTRPorc>0 then
         ImprimeVoucher( 'CNT311', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text,
                       DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString, dbeGlosa.Text )
      else
         ImprimeVoucher( 'CNT311', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text,dbeNoComp.Text, dbeGlosa.Text );
 	end;

// Si el comprobante de caja ya fue contabilizado
   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' then
   begin
      if xDTRPorc>0 then
         ImprimeVoucher( 'CNT301', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text,
                       DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString, dbeGlosa.Text )
      else
         ImprimeVoucher( 'CNT301', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text,dbeNoComp.Text, dbeGlosa.Text );
   end;
   dbgDocPago.ReadOnly:=True;
   DMTE.cdsDocPago.EnableControls ;
end;

procedure TFPagoFacturas.FormShow(Sender: TObject);
var
	 ssql: string;
	 swhere : String;
   xSQL,xWhere : string;
begin
   DMTE.AccesosUsuarios( DMTE.wModulo,DMTE.wUsuario,'2',Screen.ActiveForm.Name );
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
			edtFormPago.Text  := DMTE.cdsQry.FieldByName('FPAGODES').AsString;
		end
		else
      begin
			edtCuenta.Enabled   := False;
			edtAuxpnl.Visible   := False;
			edtclasepnl.Visible := False;
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

  If DMTE.wModo = 'A' then
  begin
     Adiciona;
     cbConDetRet.Checked:=True;
  end
  else
  begin
     xSQL:='select A.CPTOID, A.CPTODES, A.CUENTAID, FCTZ From CAJA201 A '
          +'WHERE CPTOIS=''E'' '
          +  'AND EXISTS ( SELECT CUENTAID FROM TGE202 B '
          +               'WHERE A.CUENTAID=B.CUENTAID AND B.CTAACT=''S'' '
          +                 'AND B.CIAID='''+DMTE.cdsEgrCaja.FieldByName('CIAID').AsString+''') '
          +'ORDER BY A.CPTOID';
     DMTE.cdsCptos.Close;
     DMTE.cdsCptos.DataRequest(xSQL);
     DMTE.cdsCptos.Open;

     cdsConceptoC1.CloneCursor(DMTE.cdsCptos, True) ;
     cdsConceptoC1.Name := 'cdsConceptoC1' ;
     cdsConceptoC1.Filtered := True ;
     dblcdCnp2.LookupTable := cdsConceptoC1 ;

     Edita( DMTE.cdsEgrCaja );
   end;

// hasta aqui Active
// Inicia Show

	if Trim(dblcBanco.Text) <> '' then
	begin
		 if DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value='I' then//Si está INCOMPLETO o PENDIENTE
		 begin
		 	 //focus
		 	 pnlCabecera2.setfocus ;
		 	 perform(CM_DialogKey,VK_TAB,0);
		 	 //
		 end;
		 if ( DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value='C' ) or
		 		( DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value='A' ) then      //Si está CANCELADO
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
	// ControlFocoEntrada (ctrl,evt_exit) ;
	cf1.PonerExits ;

	// Aqui voy a poner el codigo que sumariza Totales del footer ;
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
       // buscar en Proveedores Notificados por SUNAT
   ProveedoresNotificados;

		// end;
	end
	else
	begin
		edtAuxpnl.Visible := false;
		edtclasepnl.Visible := false;
	end;

	edtCia.text:= DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIADES') ;
  xDTRGrabada:='0'; // inicializa variable para controlar si un comprobante al que se le aplico
                    // la DETRACCION ya fue grabado y se pueda volver a GRABAR, sin tener que volver a
                    // ejecutar la rutina DETRACCION
end;

procedure TFPagoFacturas.RecuperaDescrip;
begin
   edtBanco.text:=DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr,'BANCOID',dblcBanco.Text,'BANCOABR') ;
   wBcoTipCta := DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').AsString;

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
end;

procedure TFPagoFacturas.Adiciona;
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
   //z2bbtnNuevo.Visible := True ;
   z2bbtnCancel.Visible := True ;

   // vhn 22/01/2001
   xSQL:='Select * from CAJA303 '
        +'Where CIAID='''' and ECANOMM='''' and '
        +      'TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsDocPago.Close;
   DMTE.cdsDocPago.DataRequest( xSQL );
   DMTE.cdsDocPago.Open;

   // VHNDEMA
   DMTE.cdsDocPago.Filter:='';
   DMTE.cdsDocPago.Filtered:=False;
   // END VHNDEMA
   
   dbgDocPago.RefreshDisplay;

   dblcClase.Enabled  := True ;
   dblcdAux.Enabled   := True ;
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

procedure TFPagoFacturas.Edita(cds : Twwclientdataset);
var
   xsql,xWhere, xFiltro : String ;
begin
  IniciaDatos;
  cdsFiltro := Cds ;

	with DMTE do
	begin
      dblcCia.Text     := cdsEgrCaja.FieldByName('CIAID').AsString;
      dblcTDiario.Text := cdsEgrCaja.FieldByName('TDIARID').AsString;
      edtPeriodo.Text  := cdsEgrCaja.FieldByName('ECANOMM').AsString;
      dbeNoComp.Text   := cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
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
                 'CPESTADO='''+ 'P'           + ''' AND ' +
                 'CLAUXID= '''+ dblcClase.Text+ ''' AND ' +
                 'PROV='''    + dblcdAux.Text + '''  ' ;
         xFiltro:=' (( (CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR '+
                  '   ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) '  ;

         DMTE.cdsMovCxP.active := False ;
         DMTE.cdsMovCxP.Datarequest('SELECT * FROM CXP301 WHERE ' + xWhere+' order by CPANOMES DESC, DOCID, CPSERIE, CPNODOC' );
         DMTE.cdsMovCxP.Active := True ;
         //DMTE.cdsMovCxP.IndexFieldNames:='CPANOMES';
         DMTE.cdsMovCxP.Filter   := xFiltro ;
         DMTE.cdsMovCxP.Filtered := True ;

         dbgOtrosIButton.Enabled := True ;

      end;

      if cdsEgrCaja.FieldByName('ECESTADO').Value='C' then      //Si está CANCELADO
      begin
         CambiaEstado('C');
         dbgOtrosIButton.Enabled := False ;

         xWhere := ' CIAID='+quotedstr(dblcCia.text)+ ' AND BANCOID='+Quotedstr(dblcBanco.Text)+
                    ' AND CCBCOID='+quotedstr(dblcCCBco.text);
         DMTE.DisplayDescrip('prvQry2','TGE106','CHQVOUCH',xWhere,'CHQVOUCH');
         if DMTE.cdsQry.FieldByName('CHQVOUCH').AsString<>'S' then
            Z2bbtChqVouch.Visible := False
         else
            Z2bbtChqVouch.Visible := True;

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
   //z2bbtnNuevo.Visible := False ;
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

procedure TFPagoFacturas.FormCreate(Sender: TObject);
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
       i := 8 ;
       i := 9 ;
       i := 10 ;
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
   DMTE.cdsMovCxP.Close;
   DMTE.cdsMovCxP.IndexFieldNames:='';
   pnlSunat.Visible:=False;
end;

procedure TFPagoFacturas.AdicIniciaDatos;
begin
   RecuperarCiaUnica(dblcCia,edtCia);
   edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
   if dblccia.Text<>'' then
      perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFPagoFacturas.ActualizaSaldosCaja;
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

procedure TFPagoFacturas.ConfiguraAccesos;
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

procedure TFPagoFacturas.Libera_Admin;
begin
    Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFPagoFacturas.Libera_Consul;
begin

end;

procedure TFPagoFacturas.Proc_Admin;
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

procedure TFPagoFacturas.Proc_Consul;
begin
    pnlCabecera1.Enabled := False ;
    pnlCabecera2.Enabled := False ;
    pnlDeTalle.Enabled := True ;
    pnlBotones.Enabled := False ;
end;

procedure TFPagoFacturas.LibConfigAccesos;
begin
    if DMTE.wAdmin = 'G' then
       Libera_Admin
    else
    begin
       if DMTE.wModo = 'C' then
          Libera_Consul ;
    end ;
end;

procedure TFPagoFacturas.ValidaCabecera2;
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

procedure TFPagoFacturas.Z2bbtnEmiChqClick(Sender: TObject);
var
   strChq : structChq ;
   xsql,ArchivoReporte, WECCHQEMI, wGiradoDTR, wCtaCteBCO, xSQL44 : string ;
   xTotal : double;
begin
   if trim(dblcCCBco.Text) <> '' then
   begin
      //** 08/03/2001 - para validar que no se reimprima el chq

      /////////////////////////////////////////
      xTotal :=0; wGiradoDTR:='';
      //////////////////////////////////////////////////////////////////////////
      if xDTRPorc=0 then   // si no se aplica DETRACCION
      begin

         // vhndema
         xSql:=     'CIAID='   +quotedstr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString   )
              +' and TDIARID=' +quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString )
              +' and ECANOMM=' +quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString )
              +' and ECNOCOMP='+quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);

         DMTE.DisplayDescrip('prvTGE','CAJA302','ECCONTA',xsql,'ECCONTA');
         if DMTE.cdsQry.FieldByName('ECCONTA').AsString<>'S' then
         begin
            ShowMessage('Para Imprimir Cheque, Debe Contabilizar el Voucher');
            Exit;
         end;
         // end vhndema

         xSQL:='Select SUM( MTORETLOC ) RETLOC, SUM( MTORETEXT ) RETEXT '
              +'from CNT320 '
              +'WHERE CIAID='''   + DMTE.cdsEgrcaja.FieldByName('CIAID').AsString    +''' AND '
              +      'ANOMM='''   + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString  +''' AND '
              +      'TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString  +''' AND '
              +      'ECNOCOMP='''+ DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString +''' AND '
              +      '( DOCID2 IS NULL OR DOCID2='''' ) ';
         DMTE.cdsQry4.Close;
         DMTE.cdsQry4.Datarequest( xSQL );
         DMTE.cdsQry4.Open;

         if dblcTMon.Text = DMTE.wTMonLoc then
            xTotal:= DMTE.FRound(strtoFloat(dbeImporte.Text)-DMTE.cdsQry4.fieldbyname('RETLOC').AsFloat,15,2)
         else
            if dblcTMon.Text = DMTE.wTMonExt then
               xTotal:= DMTE.FRound(strtoFloat(dbeImporte.Text)-DMTE.cdsQry4.fieldbyname('RETEXT').AsFloat,15,2);

         xTotal:= DMTE.FRound(strtoFloat(dbeImporte.Text),15,2);

         xSQL:=' CIAID='''   +dblcCia.text+''' and '
             + 'TDIARID=''' +dblcTDiario.text +''' and '
             + 'ECANOMM=''' +edtPeriodo.text+''' and '
             + 'ECNOCOMP='''+dbeNoComp.text+''' ';
         wECCHQEMI:=DMTE.DisplayDescrip('prvSQL','CAJA302','ECCHQEMI',xsql,'ECCHQEMI');
         /////////////
         /// se carga variable para realizar el UPDATE despues de emitido el Cheque
         xSQL:='UPDATE CAJA302 SET ECCHQEMI=''S'' '
              +'WHERE CIAID='''   +dblcCia.text+''' and '
              +'TDIARID=''' +dblcTDiario.text +''' and '
              +'ECANOMM=''' +edtPeriodo.text+''' and '
              +'ECNOCOMP='''+dbeNoComp.text+''' ';
         /////////////
         wCtaCteBCO:=dblcCCBco.Text
      end
      else // si se aplica la DETRACCION
      begin
         // PARA UBICAR EL REGISTRO SELECCIONADO EN EL DBGDOCPAGO(CAJA303) COINCIDA CON EL CAJA302
         DMTE.cdsEgrCaja.Filter:='';
         DMTE.cdsEgrCaja.Filtered:=False;
         DMTE.cdsEgrCaja.Filter:=' CIAID='+quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
         +' and ECANOMM=' +quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
         +' and TDIARID=' +quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
         +' and ECNOCOMP='+quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString);
         DMTE.cdsEgrCaja.Filtered:=True;

         // VHNDEMA
         if DMTE.cdsEgrCaja.Recordcount<=0 then
         begin
            xSQL44:='Select * from CAJA302 '
                   +'Where CIAID='  +quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString   )
                   +' and ECANOMM=' +quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString )
                   +' and TDIARID=' +quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString )
                   +' and ECNOCOMP='+quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString);
            DMTE.cdsEgrCaja.Close;
            DMTE.cdsEgrCaja.DataRequest( xSQL44 );
            DMTE.cdsEgrCaja.Open;
         end;
         // END VHNDEMA

         xTotal:= DMTE.cdsEgrCaja.FieldbyName('ECMTOORI').AsFloat;
         if DMTE.cdsEgrCaja.FieldbyName('TIPDET').AsString='I4' then // por ser el importe de DETRACCION
         begin
            /// ACCESA AL TGE105 PARA TOMAR EL NOMBRE DEL BANCO PARA EL CHEQUE DE LA DETRACCION
            xSQL:='SELECT * FROM TGE105 WHERE BANCOPRF='+quotedstr('BN-');
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest(xSQL);
            DMTE.cdsQry.open;
            wGiradoDTR:=trim(DMTE.cdsQry.FieldbyName('BANCONOM').AsString)+'/';
            ///////////////////////////////////////////////////////////////////////
            // SE TOMA EL MONTO LOCAL, YA QUE EL BCO.NACION SOLO RECIBE SOLES
            xTotal:= DMTE.cdsEgrCaja.FieldbyName('ECMTOLOC').AsFloat;
         end
         else
         begin
            wGiradoDTR:='';
         end;
         //
         wECCHQEMI:= DMTE.cdsEgrCaja.FieldbyName('ECCHQEMI').AsString;
         ///////////////////////////////////////////////////////////////////////
         /// se carga variable para realizar el UPDATE despues de emitido el Cheque
         xSQL:='UPDATE CAJA302 SET ECCHQEMI=''S'' '
              +'WHERE CIAID='''   +dblcCia.text+''' and '
              +'TDIARID=''' +dblcTDiario.text +''' and '
              +'ECANOMM=''' +edtPeriodo.text+''' and '
              +'ECNOCOMP='+quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
         /////////////
         wCtaCteBCO:=dblcCCBcoDTR.Text
      end;
      //////////////////////////////////////////////////////////////////////////

      if WECCHQEMI <> 'S' then
      begin
        // vhndema
        //DMTE.RecuperarDatos('TGE106','*',
        //                   'BANCOID = ''' + dblcBanco.text+ ''' AND CCBCOID = ''' + wCtaCteBCO+ '''') ;
        DMTE.RecuperarDatos('TGE106','*','BANCOID='''+DMTE.cdsEgrCaja.FieldbyName('BANCOID').AsString+''' '
                                    +'AND CCBCOID='''+DMTE.cdsEgrCaja.FieldbyName('CCBCOID').AsString+'''');
        // end vhndema
        ArchivoReporte  := DMTE.cdsRec.fieldbyname('CCFMTCHQ').ASString ;
        if ArchivoReporte = '' then
         ArchivoReporte := 'ChqDefault.rtm';
        with strChq do
        begin
           ppFileName    := ArchivoReporte                                             ;
           ppGiradoA     := wGiradoDTR+dbeGiradoA.Text                                            ;
    		   ppImporte     := floattostrf(strtocurr(Floattostr(xTotal)),fffixed,10,2) ;
		       ppMontoLetras := strNum(xTotal)                              ;
           ppDia         := strDia(dbdtpFEmis.Date)                                    ;
           ppmes         := strMes(dbdtpFEmis.Date)                                    ;
           ppAno         := strAno(dbdtpFEmis.Date)                                    ;
           If wCtaCteBCO <> '0100001518' then
              ppRuc:='RUC :'+xRUCCIA;
        end;
        DMTE.xFlagP := False;
        FRegistro.EmiteChq(ArchivoReporte, strChq);
        if DMTE.xFlagP then
        begin
           //////////////////////////////////////////////////////////////////
           // aqui se realiza el UPDATE de la variable cargada anteriomente
           // se marca con 'S' el ECCHQEMI
           DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
           //////////////////////////////////////////////////////////////////
        end;
         //**
      end
      else Showmessage('Cheque ya fue impreso') ;
   end
   else
   begin
      Showmessage('No ha seleccionado Cuenta Corriente') ;
   end ;
   dbgDocPago.ReadOnly:=True;
   DMTE.cdsDocPago.EnableControls ;
end;

procedure TFPagoFacturas.SaldosAux;
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

procedure TFPagoFacturas.Opera(xProv , xClase : string ;cdsClone : TwwClientDataSet) ;
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
      DMTE.ActSaldosClientes ( xDatAux )  ;
   end ;
end;

function TFPagoFacturas.BuscaClase: String;
var
  cds : TwwClientDataset ;
begin
  cds := TwwClientDataset.Create( self ) ;
  cds.CloneCursor(DMTE.cdsMovCxP , True ) ;
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

procedure TFPagoFacturas.dblcTDoc2Exit2(Sender: TObject);
begin

   if z2bbtnCancel3.Focused then exit;
   if dbeNoReg.Focused  then Exit;

   edtTDoc2.text:= DMTE.DisplayDescripLocal(DMTE.cdsTDoc,'DOCID',dblcTDoc2.Text,'DOCDES') ;

   if edtTDoc2.Text='' then
   begin
      ShowMessage('Error : Tipo de Documento no Valido');
      dblcTDoc2.SetFocus;
      Exit;
   end;
   wDocModulo:= DMTE.cdsTDoc.FieldByName('DOCMOD').AsString;
end;


procedure TFPagoFacturas.RecCptosDifC;
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

procedure TFPagoFacturas.dbeLoteExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then exit;

   dbeLote.text:=DMTE.StrZero(dbeLote.text,DMTE.cdsEgrCaja.FieldByName('ECLOTE').Size);
end;

procedure TFPagoFacturas.dbeTCambioEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFPagoFacturas.dbeTCambioExit(Sender: TObject);
begin
   if strTmp <> dbeTCambio.text then
   begin
      dbeTcambio.text := CajaDec(dbeTCambio.text,4) ;
   end ;
end;

procedure TFPagoFacturas.dblcBancoExit(Sender: TObject);
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

  wBcoTipCta := DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').AsString;

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
     DMTE.cdsCCBco.Filter:='BANCOID='+''''+dblcBanco.Text+''''+' AND CIAID='+quotedstr(dblcCia.text)+' AND CUEEMICHE=''S''';
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

procedure TFPagoFacturas.dblcCCBcoEnter(Sender: TObject);
begin
   strTmp := dblcCCBco.Text ;
end;

procedure TFPagoFacturas.dblcCCBcoExit(Sender: TObject);
var
   Tmp : String ;
begin

   if dblcCia.Focused   then Exit;
   if dblcBanco.Focused then Exit;

   tmp:=DMTE.DisplayDescripLocal(DMTE.cdsCCBco,'CCBCOID',dblcCCBco.Text,'CCBCOID') ;
   xCCBCOID:=DMTE.DisplayDescripLocal(DMTE.cdsCCBco,'CCBCOID',dblcCCBco.Text,'CCBCOID') ;

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

procedure TFPagoFacturas.dblcClaseExit(Sender: TObject);
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

   xSQLx:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+''' and ACTIVO=''S''';
   DMTE.cdsAux.Close;
   DMTE.cdsAux.DataRequest( xSQLx ) ;
   DMTE.cdsAux.Open;

   dblcdAux.Selected.Clear;
   dblcdAux.Selected.Add('AUXID'#9'10'#9'Auxiliar'#9'F');
   dblcdAux.Selected.Add('AUXRUC'#9'15'#9'R.U.C'#9'F');
   dblcdAux.Selected.Add('AUXNOMB'#9'40'#9'Nombre Auxiliar'#9'F');

end;

procedure TFPagoFacturas.dblcdAuxExit(Sender: TObject);
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
	                                'CLAUXID = ''' +dblcClase.text
                         	+ ''' AND AUXID=''' + dblcdAux.Text + '''','PROVRETIGV')='S') AND (wCiaRetIGV)) ;
	 edtAuxRuc.Text:= DMTE.cdsAux.FieldByName('AUXRUC').Asstring;
   xDirAux       := DMTE.cdsAux.FieldByName('AUXDIR').Asstring;

   // buscar en Proveedores Notificados por SUNAT
   ProveedoresNotificados;

   xSql := 'SELECT * FROM CAJA102 WHERE PROV='+quotedstr(trim(dblcdAux.Text))+' ORDER BY CCBCOID';
   DMTE.cdsProvCta.Close;
   DMTE.cdsProvCta.DataRequest(xSql);
   DMTE.cdsProvCta.Open
end;

procedure TFPagoFacturas.ProveedoresNotificados;
var
  xWhere, sRes : String;
begin
  pnlSunat.Visible:=False;
  xWhere:='PROVRUC='''+edtAuxRuc.Text+''' AND ESTADO=''A''';
  sRes:=DMTE.DisplayDescrip('prvTGE','CXP_PRO_NOT_SUN','PROVRUC, PROVDES, ESTADO',xWhere,'ESTADO');
  if sRes='A' then
  begin
     pnlSunat.Visible:=True;
  end;
end;


procedure TFPagoFacturas.dblcFormPagoExit(Sender: TObject);
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

procedure TFPagoFacturas.dblcTMonExit(Sender: TObject);
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

procedure TFPagoFacturas.dblcdCnpExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then exit;
   if dbeLote.Focused      then exit;

   dbeGlosa.text := DMTE.DisplayDescripLocal(DMTE.cdsCnpEgr,'CPTOID',dblcdCnp.Text,'CPTODES') ;

   if dbeGlosa.text='' then begin
      ShowMessage('Error : Concepto no Valido');
      dblcdCnp.SetFocus;
   end;
end;

procedure TFPagoFacturas.BorraGrid;
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

procedure TFPagoFacturas.dblcClaseDetExit(Sender: TObject);
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

procedure TFPagoFacturas.dblcdAuxExit2(Sender: TObject);
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

procedure TFPagoFacturas.dblcdCnp2Exit2(Sender: TObject);
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
   else
   begin
//CLG: 28/11/2003
//      DMTE.cdsRegCxP.FieldByName('PROV').AsString    := '' ;
//      DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString := '' ;
      DMTE.cdsRegCxP.FieldByName('PROV').AsString    := dblcdAux.text;
      DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString := dblcClase.text;

      edtClaseDet.Text    := edtClase.text;
      dbeAuxDet.Text      := dbeGiradoA.text;
      dblcClaseDet.Enabled:= False;
      dblcdAuxDet.Enabled := False;
   end;

   if DMTE.cdsQry.fieldbyname('CTA_CCOS').AsString='S' then
   begin
      {ssql:='SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV '
          +'FROM TGE203 WHERE CCOSMOV=''S'' and CCOSACT=''S'' '
          +' and CCOSCIAS LIKE ('+quotedstr('%'+dblcCia.Text+'%')+' ) ';

      DMTE.cdsCCosto.Close;
      DMTE.cdsCCosto.DataRequest(ssql);
      DMTE.cdsCCosto.open;}
      dblcdCCosto.Enabled:=true;
      if not dblcClaseDet.Enabled then
         dblcdCCosto.SetFocus;
   end
   else begin
      DMTE.cdsRegCxP.FieldByName('CCOSID').AsString := '' ;
      dblcdCCosto.Enabled := False ;
   end;

end;

procedure TFPagoFacturas.edtCnp2Change2(Sender: TObject);
begin
//DMTE.cdsRegCxPCUENTAID.Value:=edtCnp2.Text;
end;

procedure TFPagoFacturas.wwDBEdit1Change22(Sender: TObject);
begin
    wmodifica:=True;
end;
procedure TFPagoFacturas.FormDestroy(Sender: TObject);
begin
   cf1.Free ;
end;

procedure TFPagoFacturas.dblcdFEfecEnter(Sender: TObject);
begin
   strTmp := dblcdFEfec.Text ;
end;

procedure TFPagoFacturas.dblcdFEfecExit(Sender: TObject);
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

procedure TFPagoFacturas.ActDetCaja;
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

procedure TFPagoFacturas.ActDetCxP ;
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

procedure TFPagoFacturas.ActualizaFiltro;
begin
end;

procedure TFPagoFacturas.AsignaCDSFiltro(cds: TwwClientDataset);
begin
    cdsFiltro := cds ;
end;

procedure TFPagoFacturas.ActualizaDetCanje;
begin
   // ABRIR DETALLE DE CANJE
   DMTE.cdsDetCanjeCxP.close ;
   DMTE.cdsDetCanjeCxP.DataRequest('SELECT * FROM CXP305 WHERE CIAID = ''''') ;
   DMTE.cdsDetCanjeCxP.Open  ;

   DMTE.cdsDocPago.DisableControls;
   DMTE.cdsDocPago.First;

   While not DMTE.cdsDocPago.Eof do
   begin
      DMTE.cdsDetCanjeCxP.Insert;
      DMTE.cdsDetCanjeCxP.FieldByName('CIAID').Value    := DMTE.cdsDocPago.FieldByName('CIAID').Value   ;
      DMTE.cdsDetCanjeCxP.FieldByName('PROV').Value     := DMTE.cdsDocPago.FieldByName('PROV').Value    ;
      DMTE.cdsDetCanjeCxP.FieldByName('PROVRUC').Value  := DMTE.cdsDocPago.FieldByName('PROVRUC').Value ;
      DMTE.cdsDetCanjeCxP.FieldByName('DOCID').Value    := DMTE.cdsDocPago.FieldByName('DOCID2').value;
      DMTE.cdsDetCanjeCxP.FieldByName('CPSERIE').Value  := DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('CPNODOC').Value  := DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('CPNOREG').Value  := DMTE.cdsDocPago.FieldByName('CPNOREG').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('TCANJEID').Value := '' ;
      DMTE.cdsDetCanjeCxP.FieldByName('CCPCANJE').Value := '' ;
      DMTE.cdsDetCanjeCxP.FieldByName('CCPFCJE').AsDateTime  := dbdtpFComp.Date ;
      DMTE.cdsDetCanjeCxP.FieldByName('TMONID').Value   := DMTE.cdsDocPago.FieldByName('TMONID').Value;

      If DMTE.cdsDocPago.FieldByName('TMONID').Value=DMTE.wTMonLoc then
      begin
         DMTE.cdsDetCanjeCxP.FieldByName('DCDMOLOC').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').Value,15,2);
				 DMTE.cdsDetCanjeCxP.FieldByName('DCDMOEXT').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').Value/DMTE.cdsDocPago.FieldByName('DETCDOC').Value,15,2);
         end
      else
      begin
         DMTE.cdsDetCanjeCxP.FieldByName('DCDMOEXT').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').Value,15,2);
         DMTE.cdsDetCanjeCxP.FieldByName('DCDMOLOC').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').Value*DMTE.cdsDocPago.FieldByName('DETCDOC').Value,15,2);
      end;

      DMTE.cdsDetCanjeCxP.FieldByName('DCDUSER').Value  := DMTE.cdsDocPago.FieldByName('DEUSER').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDFREG').Value  := DMTE.cdsDocPago.FieldByName('DEFREG').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDHREG').Value  := DMTE.cdsDocPago.FieldByName('DEHREG').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDMM').Value    := DMTE.cdsDocPago.FieldByName('DEMM').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDDD').Value    := DMTE.cdsDocPago.FieldByName('DEDD').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDTRI').Value   := DMTE.cdsDocPago.FieldByName('DETRI').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDSEM').Value   := DMTE.cdsDocPago.FieldByName('DESEM').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDSS').Value    := DMTE.cdsDocPago.FieldByName('DESS').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDAATRI').Value := DMTE.cdsDocPago.FieldByName('DEAATRI').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDAASEM').Value := DMTE.cdsDocPago.FieldByName('DEAASEM').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDAASS').Value  := DMTE.cdsDocPago.FieldByName('DEAASS').Value;

      DMTE.cdsDocPago.Next;
   end;
   DMTE.cdsDocPago.First ;
   DMTE.cdsDocPago.EnableControls ;
   //CLG: 20/10/2003
   //if DMTE.cdsDetCanjeCxP.ApplyUpdates(0) >0 then
      //Raise Exception.create ('Falla en la grabación del 305') ;
   DMTE.ControlTran(0,DMTE.cdsDetCanjeCxP,'DETCANJECXP');
   DMTE.cdsDetCanjeCxP.Close ;
end;

procedure TFPagoFacturas.Buscar1Click2(Sender: TObject);
begin
  lkdCxP.LookupTable := DMTE.cdsMovCxP ;
  lkdCxP.Execute ;
end;

procedure TFPagoFacturas.lkdCxPCloseDialog(Dialog: TwwLookupDlg);
begin
   lkdCxP.LookupTable := nil ;
end;

procedure TFPagoFacturas.lkdCxPInitDialog(Dialog: TwwLookupDlg);
begin
    Dialog.wwDBGrid1.TitleLines := 2 ;
    Dialog.wwDBGrid1.Selected.clear ;
    Dialog.wwDBGrid1.Selected.Assign( dbgPendientes.Selected ) ;
    Dialog.Width := 400 ;
end;

//** 01/12/2000 - pjsv
procedure TFPagoFacturas.edtCuentaExit(Sender: TObject);
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

procedure TFPagoFacturas.Limpiapnlaux;
begin
   edtAuxpnl.visible := false;
   edtAuxpnl.text := '';
	 edtclasepnl.visible := false;
   edtclasepnl.text := '';
end;

procedure TFPagoFacturas.dbeNoChqExit(Sender: TObject);
var
 xSql : string;
begin
  xSql:='CIAID='+quotedstr(dblcCia.text)+' AND TDIARID='+quotedstr(dblcTDiario.text)+' and '
       +'ECNOCOMP<>'+quotedstr( dbeNoComp.Text )+' and '
			 +'CCBCOID='+quotedstr(dblcCCBco.Text)+' AND ECNOCHQ='+quotedstr(dbeNoChq.text);

  DMTE.DisplayDescrip('prvTGE','CAJA302','ECNOCHQ,ECESTADO,ECELABO',xsql,'ECNOCHQ');
  if DMTE.cdsQry.FieldByName('ECNOCHQ').AsString<>'' then
  begin
     if DMTE.cdsQry.FieldByName('ECESTADO').AsString<>'A' then
     begin
        showmessage('El número de Cheque ya fue Utilizado');
        dbeNoChq.Text := '';
        dbeNoChq.SetFocus;
     end
     else
     begin
        if DMTE.cdsQry.FieldByName('ECELABO').AsString='NULO' then
        begin
           showmessage('El número de Cheque ya fue Utilizado');
           dbeNoChq.Text := '';
           dbeNoChq.SetFocus;
        end
     end;
  end;

end;
//**

procedure TFPagoFacturas.DescripPagoFact(const xCIAID, xECANOMM, xTDIARID, xECNOCOMP: String);
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

procedure TFPagoFacturas.ppHeaderBand2BeforePrint(Sender: TObject);
begin
    pplblCia.text       := edtCia.text;
    ppdbtCiaRuc.text    := DMTE.DisplayDescrip('prvTGE','TGE101','CIARUC','CIAID='+quotedstr(dblcCia.text),'CIARUC');
    pplblNumero.text    := dbeNoComp.text;
    pplblNombreCli.text := dbeGiradoA.text;
    pplblNRucCli.text   := edtAuxRuc.text;
    pplblNDirCli.text   := xDirAux;
    pplblNCtaCte.text   := dblcdCtaCte.text;
end;

procedure TFPagoFacturas.Z2bbtnNotaAbonoClick(Sender: TObject);
begin
	 //JCC: 24/06/2002
	 pprptNotaAbono.TEMPLATE.FileName := wRutaRpt + '\NotaAbono.rtm';
	 pprptNotaAbono.template.LoadFromFile ;
   pprptNotaAbono.print;
end;

procedure TFPagoFacturas.ppDetailBand2BeforePrint(Sender: TObject);
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

procedure TFPagoFacturas.dbeTCExit(Sender: TObject);
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

procedure TFPagoFacturas.dbeMPLExit(Sender: TObject);
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
      //CIM 19/12/2002
      if dblcTmon.text= DMTE.wTMonLoc then
         DMTE.cdsDocPago.fieldbyName('DEMTOORI').asFloat:= DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat
      else
         if dblcTmon.text= DMTE.wTMonExt then
            DMTE.cdsDocPago.fieldbyName('DEMTOORI').asFloat:= DMTE.cdsDocPago.fieldbyName('DEMTOEXT').asFloat
   end;
end;

procedure TFPagoFacturas.dbeMPEExit(Sender: TObject);
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
      //CIM 19/12/2002
      if dblcTmon.text= DMTE.wTMonLoc then
         DMTE.cdsDocPago.fieldbyName('DEMTOORI').asFloat:= DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat
      else
         if dblcTmon.text= DMTE.wTMonExt then
            DMTE.cdsDocPago.fieldbyName('DEMTOORI').asFloat:= DMTE.cdsDocPago.fieldbyName('DEMTOEXT').asFloat
      
   end;
end;

procedure TFPagoFacturas.isBuscaExit(Sender: TObject);
begin
   Screen.Cursor := crDefault;
   pnlBusca.Visible:=False;
end;

procedure TFPagoFacturas.dbgPendientesTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   pnlBusca.Visible := True;
   lblBusca.Caption := dbgPendientes.ColumnByName(AFieldName).DisplayLabel;
   isBusca.SearchField := AFieldName;
   isBusca.SetFocus;
end;

procedure TFPagoFacturas.dblcdAuxEnter(Sender: TObject);
begin
   if dblcClase.Text='' then
      dblcdAux.SetFocus;
end;

procedure TFPagoFacturas.BitBtn1Click(Sender: TObject);
begin
  lkdCxP.LookupTable := DMTE.cdsMovCxP ;
  lkdCxP.Execute ;
end;

procedure TFPagoFacturas.dblcdCCostoExit(Sender: TObject);
var
   xSQL, tmp : String;
begin

   if z2bbtnCancel3.Focused then exit;
   if dblcdCnp2.Focused     then exit;
   if dblcClaseDet.Focused  then exit;
   if dblcdAuxDet.Focused   then exit;

   xSQL:='CCOSID='+QuotedStr(dblcdCCosto.Text)+' and CCOSMOV=''S'' AND CCOSACT=''S'' '
        +' and CCOSCIAS LIKE ('+quotedstr('%'+dblcCia.Text+'%')+' ) ';

   tmp  := DMTE.DisplayDescrip('prvTGE','TGE203','CCOSDES',xSQL,'CCOSDES');
   if (dblcdCCosto.Text<>'') and (tmp='') then
   begin
      ShowMessage('Centro de Costo no Existe. Verifique...');
      DMTE.cdsRegCxP.FieldByName('CCOSID').AsString:='';
      Exit;
   end;

end;

procedure TFPagoFacturas.Z2bbtnRetencionClick(Sender: TObject);
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
   DMTE.cdsRetencion.IndexFieldNames := 'RETNUMERO;CLAUXID;AUXID';;
   ppdbRetencion.DataSource:=DMTE.dsRetencion;
	pprRetencion.TEMPLATE.FileName:=DMTE.wRutaCNT + '\Retenciones.rtm';
	pprRetencion.template.LoadFromFile ;

// Inicio HPC_201403_CAJA
// cambia control de diseño de reporte
   if cbDisenoRep.Checked then
   begin
      ppDesigner1.Report:=pprRetencion;
      ppDesigner1.Show;
   end
   else
   begin
      pprRetencion.Print;
      pprRetencion.Stop;

      x10:=DMTE.ComponentCount-1;
      while x10>0 do begin
         if DMTE.components[x10].classname='TppGroup' then begin
            DMTE.components[x10].free;
         end;
         x10:=x10-1;
      end;
      ppdbRetencion.DataSource:=NIL;
   end;
// Fin HPC_201403_CAJA
end;

procedure TFPagoFacturas.dblcdAuxDropDown(Sender: TObject);
begin
  DMTE.cdsAux.IndexFieldNames:='AUXNOMB';
end;

procedure TFPagoFacturas.Contab_DocPago_Retencion_Debe(xRL,xRE,xRO:double);
var
 xwhere, XsqL : string;
begin
     if xDTRPorc>0 then Exit; // si hay DETRACCION

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
     DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CPTODES,CUENTAID','CPTOIS=''T''','CPTOID');
     DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
     DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString+' '+DMTE.cdsQry3.fieldbyname('PROVDES').AsString;
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

procedure TFPagoFacturas.Contab_DocPago_Retencion_Haber;
var
   xwhere, xSQL, xDocret : string;
   xMtoRetL1,xMtoRetE1,xMtoTotProv, xMtoTotProvL, xMtoTotProvE : Double;
   xMtoTotPagProvL,xMtoTotPagProvE:double;
   xCanje,sCajaAut:string;
begin
   xSQL:='Select CJAAUTONOM from TGE101 where CIAID='''+dblcCia.text+'''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   sCajaAut:=DMTE.cdsQry.FieldByName('CJAAUTONOM').AsString;
   DMTE.cdsQry.Close;

  if xDTRPorc>0 then Exit; // si hay DETRACCION

  bMayorQueTasa:=False;
	xMtoRetL:=0;
	xMtoRetE:=0;
	xMtoRetL1:=0;
	xMtoRetE1:=0;

	xMtoTotProvL:=0;
	xMtoTotProvE:=0;

	xMtoTotPagProvL:=0;
	xMtoTotPagProvE:=0;

	DMTE.cdsDocPago.First;
  while NOT DMTE.cdsDocPago.eof do
	begin
		if (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec)  AND
			 (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV','DOCMOD=''CXP'' AND DOCID='+QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString),'DOCRETIGV')='S') AND
			 (lblSujetoRetencion.visible) then
		begin
			 xSQL:= 'SELECT DOCID, TMONID,TCANJEID,CPNOGRAV,CPIGV,CPGRAVAD,CPCANJE,CPMTOLOC,CPMTOEXT,PROVRETIGV '
            +' FROM CXP301 '
            +' where CIAID='''+DMTE.cdsDocPago.fieldbyname('CIAID').AsString   +''' and '
		 	      +' CPANOMES='''+DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString +''' and '
		 	 	    +' TDIARID=''' +DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString+''' and '
		 	  	  +' CPNOREG=''' +DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString +''' '  ;
       DMTE.cdsQry3.IndexFieldNames:='';
       DMTE.cdsQry3.Close;
       DMTE.cdsQry3.DataRequest(xSQL);
       DMTE.cdsQry3.Open;

       if DMTE.cdsQry3.fieldbyname('TMONID').AsString=DMTE.wTMonLoc then
          xPorcPago:=DMTE.FRound(DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat
										/DMTE.cdsQry3.fieldbyname('CPMTOLOC').AsFloat,15,5)
			 else
			    xPorcPago:=DMTE.FRound(DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat
                    /DMTE.cdsQry3.fieldbyname('CPMTOEXT').AsFloat,15,5);

       // Si es letra
       if (DMTE.cdsQry3.fieldbyname('TCANJEID').AsString='LE') AND (DMTE.cdsQry3.fieldbyname('CPNOGRAV').AsFloat>0) then
       begin
          xWhere:=' CIAID='''   +DMTE.cdsDocPago.fieldbyname('CIAID').AsString   +''' and '
                 +' CPANOMES='''+DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString +''' and '
					    	 +' PROV='''+DMTE.cdsDocPago.fieldbyname('PROV').AsString +''' and '
						     +' CPNOREGLET=''' +DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString +''' '  ;

				if DMTE.RecuperarDatos( 'CXP313', 'TMONID,TMONID2,TCANJEID,CPRETORI,CPRETLOC,CPRETEXT,PROV,CPTCAMPR' , xWhere ) then
				begin
					DMTE.cdsRec.First;
					while not  DMTE.cdsRec.Eof do
					begin
						if DMTE.wTMonLoc=DMTE.cdsRec.FieldByName('TMONID2').AsString then
						begin
							xMtoRetL:=xMtoRetL+DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat,15,2)*xPorcPago;
							xMtoRetE:=xMtoRetE+(DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat,15,2)*xPorcPago/strtofloat(dbeTCambio.Text));
						end
						else
						begin
                     xMtoRetL:=xMtoRetL+ DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat,15,2)*xPorcPago*strtofloat(dbeTCambio.Text);
							xMtoRetE:=xMtoRetE+DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat,15,2)*xPorcPago;
						end;
						DMTE.cdsRec.Next;
               end;
					xMtoRetL := DMTE.FRound(xMtoRetL,15,2);
					xMtoRetE := DMTE.FRound(xMtoRetE,15,2);
				end;
         end
         else//Si no son letras
         begin
            if (DMTE.cdsQry3.fieldbyname('PROVRETIGV').AsString='S') or
               (DMTE.cdsQry3.fieldbyname('DOCID').AsString='07') then
            begin
               bMayorQueTasa:=True;
               xMtoTotProvL:=DMTE.FRound(xMtoTotProvL+DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat,15,2);
               xMtoTotProvE:=DMTE.FRound(xMtoTotProvE+DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat,15,2);
               xMtoTotPagProvL:=DMTE.FRound(xMtoTotPagProvL+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat,15,2);
               xMtoTotPagProvE:=DMTE.FRound(xMtoTotPagProvE+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat,15,2);
            end;
            if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString<>'C' then
            begin
               if (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec)  AND
                  (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV','DOCMOD=''CXP'' AND DOCID='+QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString),'DOCRETIGV')='S') AND
                  (lblSujetoRetencion.visible) then
               begin
                  if DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat,15,2)>=DMTE.xTasaMonto then
                  begin
                     xWhere:='CIAID='+quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
                            +' and TDIARID='+quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID2').AsString)
                            +' and CPANOMES='+quotedstr(DMTE.cdsDocPago.FieldByName('CPANOMM').AsString)
                            +' and CPNOREG='+quotedstr(DMTE.cdsDocPago.FieldByName('CPNOREG').AsString);
                     if length(DMTE.DisplayDescrip('prvTGE','CXP301','*',xWhere,'PROV'))>0 then
                     begin
                        if ((DMTE.cdsQry.FieldByName('CPGRAVAD').AsFloat
                           +DMTE.cdsQry.FieldByName('CPIGV').AsFloat)>=DMTE.xTasaMonto)
                           and (DMTE.cdsQry.FieldByName('CPIGV').AsFloat>0) then
                        begin
                           bMayorQueTasa:=True;
                           xMtoTotProvL:=DMTE.FRound(xMtoTotProvL+DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat,15,2);
                           xMtoTotProvE:=DMTE.FRound(xMtoTotProvE+DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat,15,2);
                           xMtoTotPagProvL:=DMTE.FRound(xMtoTotPagProvL+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat,15,2);
                           xMtoTotPagProvE:=DMTE.FRound(xMtoTotPagProvE+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat,15,2);
                        end;
                     end;
                  end;
               end;
//               if (bMayorQueTasa) or (xMtoTotPagProvL>=DMTE.xTasaMonto) then
               if (bMayorQueTasa) then
               begin
                  xMtoRetL:=DMTE.FRound(xMtoTotPagProvL*DMTE.xTasaPorce/100,15,2);
                  xMtoRetE:=DMTE.FRound(xMtoTotPagProvE*DMTE.xTasaPorce/100,15,2);
               end;
            end;
         end;
      end;
      DMTE.cdsDocPago.Next;
   end;

   DMTE.cdsRegCxP.DisableControls;
   DMTE.cdsRegCxP.First ;
   While not DMTE.cdsRegCxP.Eof do
   Begin
      if DMTE.cdsRegCxP.FieldByName('DEDH').AsString='D' then
      begin
         xWhere := 'DOCID='+QuotedStr(DMTE.cdsRegCxP.FieldByName('DOCID2').AsString)+' AND DOCMOD=''CXP''';
         if (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV',xWhere,'DOCRETIGV')='S') AND
            (DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec) AND
            (lblSujetoRetencion.Visible) then
         begin
            xMtoRetL1:=xMtoRetL1+DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
            xMtoRetE1:=xMtoRetE1+DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
            if DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat,15,4)>=DMTE.xTasaMonto then
               bMayorQueMonto:=True;
            xMtoTotProvL:=DMTE.FRound(xMtoTotProvL+DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat,15,2);
            xMtoTotProvE:=DMTE.FRound(xMtoTotProvE+DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat,15,2);
            // SE QUITA PARA QUE NO CALCULE SA RETENCION
            //xMtoTotPagProvL:=DMTE.FRound(xMtoTotPagProvL+DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat,15,2);
            //xMtoTotPagProvE:=DMTE.FRound(xMtoTotPagProvE+DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat,15,2);
         end;
      end
      else
      begin
         xMtoTotProvL:=DMTE.FRound(xMtoTotProvL-DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat,15,2);
         xMtoTotProvE:=DMTE.FRound(xMtoTotProvE-DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat,15,2);
            // SE QUITA PARA QUE NO CALCULE SA RETENCION
         //xMtoTotPagProvL:=DMTE.FRound(xMtoTotPagProvL-DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat,15,2);
         //xMtoTotPagProvE:=DMTE.FRound(xMtoTotPagProvE-DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat,15,2);
      end;
      DMTE.cdsRegCxP.Next;
   end;
   //dbgDetPago.ColumnByName('DEMTOLOC').FooterValue:=floattostrf(xMtoLoc, ffFixed, 10, 2);
   //dbgDetPago.ColumnByName('DEMTOEXT').FooterValue:=floattostrf(xMtoExt, ffFixed, 10, 2);

   DMTE.cdsRegCxP.EnableControls;

   if DMTE.cdsRegCxP.RecordCount>0 then
   begin
//     if (bMayorQueTasa) or (xMtoTotPagProvL>=DMTE.xTasaMonto) then
     if (bMayorQueTasa)  then
     begin
        xMtoRetL:=DMTE.FRound(xMtoTotPagProvL*DMTE.xTasaPorce/100,15,2);
        xMtoRetE:=DMTE.FRound(xMtoTotPagProvE*DMTE.xTasaPorce/100,15,2);
     end;
   end;

   if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='C' then
   begin
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

       xWhere:='DOCMOD=''CXP'' AND DOCTIPREG=''CR'' ';
       xDocRet:=DMTE.DisplayDescrip('prvTGE','TGE110','DOCID',xWhere,'DOCID');

       while not DMTE.cdsQry4.Eof do
       begin
          DMTE.cdsCntCaja.Insert;
          DMTE.cdsCntCaja.FieldByName('CIAID').Value   := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
          DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
          DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
          DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:= DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
          DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
          DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  := 'CXP';
          DMTE.cdsCntCaja.FieldByName('DOCID').Value   := xDocRet;
          DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsQry4.FieldByname('RETSERIE').AsString;
          DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsQry4.FieldByname('RETNUMERO').AsString;
          DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsQry4.FieldByname('FECPAGO').AsDateTime;
          DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsQry4.FieldByname('FECPAGO').AsDateTime;
          DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:= DMTE.cdsQry4.FieldByname('FECPAGO').AsDateTime;
          if sCajaAut='N' then
          begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CPTODES,CUENTAID','CPTOIS=''T''','CPTOID');
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString;
          end
          else
          begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CPTODES,CUENTAID','CPTOIS=''R''','CPTOID');
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString;
          end;
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
   end
   else
   begin
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
//          DMTE.cdsCntCaja.FieldByName('ECFCOMP').Clear; // := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
          DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
          DMTE.cdsCntCaja.FieldByName('DCFEMIS').Clear; //  := DMTE.cdsDocPago.FieldByName('CPFEMIS').Value;
          DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Clear; //Value:= DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value;
          if sCajaAut='N' then
          begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CPTODES,CUENTAID','CPTOIS=''T''','CPTOID');
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString;
          end
          else
          begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CPTODES,CUENTAID','CPTOIS=''R''','CPTOID');
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString;
          end;
          DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value;
          DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;
          DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'H';
          DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:= StrToFloat(dbeTCambio.text);
          DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:= StrToFloat(dbeTCambio.text);
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
   end;
end;

procedure TFPagoFacturas.Contab_DifCamDocPago_Retencion(wPorcPago,xMtoRetL,xMtoRetLH:double);
var
 xMONID_PROV,xWhere,xsql,xsql1 : string;
begin
   if xDTRPorc>0 then Exit; // si hay DETRACCION

{   xWhere:=' CIAID='''   +DMTE.cdsDocPago.fieldbyname('CIAID').AsString   +''' and '
          +' CPANOMES='''+DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString +''' and '
          +' TDIARID=''' +DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString+''' and '
          +' CPNOREG=''' +DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString +''' '  ;

   if DMTE.RecuperarDatos( 'CXP301' , 'TMONID,TCANJEID,CPNOGRAV' , xWhere ) then
      xMONID_PROV := DMTE.cdsRec.fieldbyname('TMONID').AsString
   else
			Showmessage('Error en la recuperación del documento - WMC');

   xsql := 'TMONID='+quotedstr(dblcTMon.Text);
   xsql1 := 'TMONID='+quotedstr(DMTE.cdsDocPago.fieldbyname('TMONID').AsString);
   If (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') or
      (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then
    begin
}
   if xDTRPorc>0 then Exit;     // si hay DETRACCION

   if ABS(xMtoRetL-xMtoRetLH)>0 then
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

        if xMtoREtLH>xMtoRetL then
        begin
           DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
           xMTOCNTLOC:=xMtoREtLH-xMtoRetL;

        end
        else
        begin
           DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H' ;
           xMTOCNTLOC:=xMtoREtL-xMtoRetLH;
        end;
        DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value   := xMTOCNTLOC;
        DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value    := xMTOCNTLOC;
        DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := 0;


{        if dblcTMon.Text=DMTE.wTMonLoc then
        begin
          if xMONID_PROV = dblcTMon.Text then
          begin
            xMTOCNTLOC:=0;
            xMTOCNTEXT:=ABS(DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat
                                        / DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2)
                           -DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat
                                        / DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 )) ;

          end
          else
          begin
            xMTOCNTEXT := 0;
            xMTOCNTLOC := ABS(DMTE.FRound( (DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat)
                                    * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2)
                             -DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat
                                    * DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 ) );
          end;
          xMTOCNTLOC:=DMTE.FRound(xMTOCNTLOC*wPorcPago,15,2);
          xMTOCNTEXT:=DMTE.FRound(xMTOCNTEXT*wPorcPago,15,2);
          DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value   := xMTOCNTLOC;
          DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value    := xMTOCNTLOC;
          DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
        end
        else
        begin
          if xMONID_PROV = dblcTMon.Text then
          begin
            xMTOCNTEXT := 0;
            xMTOCNTLOC := ABS(DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat
                                       * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2)
                          -DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat
                                       * DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 ));
          end
          else
          begin
            xMTOCNTLOC:=0;
            xMTOCNTEXT:=ABS(DMTE.FRound( DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat
                                       / DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2)
                           -DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat
                                       / DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 ));
          end;
          xMTOCNTLOC:=DMTE.FRound(xMTOCNTLOC*wPorcPago,15,2);
          xMTOCNTEXT:=DMTE.FRound(xMTOCNTEXT*wPorcPago,15,2);
          DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xMTOCNTEXT;
          DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
          DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat  := xMTOCNTLOC;
        end ;

        if DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat > DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat then
          DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H'
        else
          DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
}
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
    end;
end;

procedure TFPagoFacturas.GrabaCabeceraDeComprobante;
var xSQL:string;
begin

    DMTE.cdsEgrCaja.CancelUpdates;
    xSQL:='Select * from CAJA302 '
    			+'Where CIAID='''   +dblcCia.Text    +''' and '
    			+      'ECANOMM=''' +edtPeriodo.Text +''' and '
    			+      'TDIARID=''' +dblcTDiario.Text+''' and '
    			+      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
    DMTE.cdsEgrCaja.Close;
    DMTE.cdsEgrCaja.DataRequest( xSQL );
    DMTE.cdsEgrCaja.Open;
    if DMTE.cdsEgrCaja.RecordCount=0 then
    begin
       DMTE.cdsEgrCaja.Insert;
       DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString:='X';
       DMTE.cdsEgrCaja.FieldByName('CIAID').AsString:=dblcCia.Text;
       DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString:=edtPeriodo.Text;
       DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString:=dblcTDiario.Text;
       DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString:=dbeNoComp.Text;
    end
    else
    begin
       DMTE.cdsEgrCaja.Edit;
       DMTE.cdsEgrCaja.FieldByName('ECHREG').Value:=time;
    end;
    DMTE.ControlTran(9,DMTE.cdsEgrCaja,'EGRCAJA');
end;

procedure TFPagoFacturas.dbeNoCompEnter(Sender: TObject);
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

procedure TFPagoFacturas.Button1Click(Sender: TObject);
var hola:boolean;
begin
  hola:=DMTE.CalculaRetencionIGV;
  if hola then
  showMessage('Se Genero Retención')
  else
  showMessage('NO se Genero Retención');

end;

procedure TFPagoFacturas.Z2bbtChqVouchClick(Sender: TObject);
var
   strChq : structChq ;
   xsql,xWhere,ArchivoReporte : string ;
   xTotal : double;
begin
    xWhere := ' CIAID='+quotedstr(dblcCia.text)+ ' AND BANCOID='+Quotedstr(dblcBanco.Text)+
              ' AND CCBCOID='+quotedstr(dblcCCBco.text);
    DMTE.DisplayDescrip('prvQry2','TGE106','CHQVOUCH',xWhere,'CHQVOUCH');
    if DMTE.cdsQry.FieldByName('CHQVOUCH').AsString<>'S' then
       raise exception.Create('Esta Cta.Cte no genera Cheque Voucher');

    if DMTE.cdsEgrcaja.FieldByName('ECESTADO').AsString='A' then
       raise exception.Create('El Comprobante se encuentra Anulado');

    if DMTE.cdsEgrcaja.FieldByName('ECESTADO').AsString<>'C' then
       raise exception.Create('Debe Cancelar el Comprobante primero');

    if trim(dblcCCBco.Text) <> '' then
    begin
       xTotal :=0;
       xSQL:='Select SUM( MTORETLOC ) RETLOC, SUM( MTORETEXT ) RETEXT '
            +'from CNT320 '
            +'WHERE CIAID='''   + DMTE.cdsEgrcaja.FieldByName('CIAID').AsString    +''' AND '
            +      'ANOMM='''   + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString  +''' AND '
            +      'TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString  +''' AND '
            +      'ECNOCOMP='''+ DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString +''' AND '
            +      '( DOCID2 IS NULL OR DOCID2='''' ) ';
       DMTE.cdsQry4.Close;
       DMTE.cdsQry4.Datarequest( xSQL );
       DMTE.cdsQry4.Open;

       if dblcTMon.Text = DMTE.wTMonLoc then
          xTotal:= DMTE.FRound(strtoFloat(dbeImporte.Text)-DMTE.cdsQry4.fieldbyname('RETLOC').AsFloat,15,2)
       else
          if dblcTMon.Text = DMTE.wTMonExt then
             xTotal:= DMTE.FRound(strtoFloat(dbeImporte.Text)-DMTE.cdsQry4.fieldbyname('RETEXT').AsFloat,15,2);

       xSQL:='     CIAID='''   +dblcCia.text     +''' and '
           +      'TDIARID=''' +dblcTDiario.text +''' and '
           +      'ECANOMM=''' +edtPeriodo.text  +''' and '
           +      'ECNOCOMP='''+dbeNoComp.text   +''' ';
       if DMTE.DisplayDescrip('prvSQL','CAJA302','ECCHQEMI',xsql,'ECCHQEMI') <> 'S' then
       begin
          GeneraRegChqVouch;
          ppdbpChqVouch.DataSource      := DMTE.dsTrans;
          pprChqVouch.TEMPLATE.FileName := wRutaRpt + '\ChequeVoucher.rtm';
          pprChqVouch.template.LoadFromFile ;
          ppGiradoA.Caption     :=  dbeGiradoA.Text;
          ppImporte.Caption     := floattostrf(strtocurr(Floattostr(xTotal)),fffixed,10,2) ;


          ppImporte.Caption := format('%15.2n',[strtofloat(ppImporte.Caption)])        ;
          ppImporte.Caption := StringReplace(ppImporte.Caption,' ','*',[rfreplaceAll]) ;
          ppMontoLetras.Caption := strNum(xTotal)                              ;
          ppDia.Caption         := strDia(dbdtpFEmis.Date)                                    ;
          ppmes.Caption         := strMes(dbdtpFEmis.Date)                                    ;
          ppAno.Caption         := strAno(dbdtpFEmis.Date)                                    ;
          ppGiradoA2.Caption    := dbeGiradoA.Text;
          ppCtaBanco.Caption    := dblcCCBco.Text;
          ppGlosa.Caption       := dbeGlosa.Text ;
          ppImporte2.Caption    := ppImporte.Caption;
          ppMoneda.Caption      := edtTMon.Text;
          ppComprobante.Caption := dblcTDiario.Text+Floattostr(strtoFloat(dbeNoComp.text));
          ppDesigner1.Show;
//          pprChqVouch.Print;

          DMTE.xFlagP := False;
          if DMTE.xFlagP then
          begin
            xSQL:='UPDATE CAJA302 SET ECCHQEMI=''S'' '
              +'WHERE CIAID='''   +dblcCia.text+''' and '
              +      'TDIARID=''' +dblcTDiario.text +''' and '
              +      'ECANOMM=''' +edtPeriodo.text+''' and '
              +      'ECNOCOMP='''+dbeNoComp.text+''' ';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
          end;
       end
       else Showmessage('Cheque ya fue impreso') ;


    end
    else
    begin
       Showmessage('No ha seleccionado Cuenta Corriente') ;
    end ;

end;

procedure TFPagoFacturas.GeneraRegChqVouch;
var
   xCuentaId,xsql,xWhere : string;
   xMto :double;
   xMTOCHQLOC         : Double   ;
	xMTOCHQEXT         : double   ;
   xbEof : boolean;
   xCtaDG,xCtaDP :string;
begin

   DMTE.cdsCNTCaja.IndexFieldNames:='';

   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' then
 	begin
      Contabiliza;
 	end;

   xsql:='SELECT A.* ,0.00 DEBE,0.00 HABER FROM CAJA304 A  '
       +'WHERE ( A.CIAID='     +quotedstr('XY'     ) +' AND '
       +        'A.ECANOMM='  +quotedstr('190001' ) +' ) ';
   DMTE.cdsTrans.IndexFieldNames:='';
   DMTE.cdsTrans.Filter :='';
   DMTE.cdsTrans.Filtered := False;
   DMTE.cdsTrans.Close;
   DMTE.cdsTrans.DataRequest(xSQL);
   DMTE.cdsTrans.Open;
   DMTE.cdsTrans.EmptyDataSet;

   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' then
   begin
	     xsql:='SELECT A.*, B.CIADES FROM CAJA304 A, TGE101 B  '
	       	+'WHERE ( A.CIAID='     +quotedstr( DMTE.cdsEgrcaja.FieldByName('CIAID').AsString    ) +' AND '
	       	+        'A.ECANOMM='   +quotedstr( DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString  ) +' AND '
	       	+        'A.TDIARID='   +quotedstr( DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString  ) +' AND '
	       	+        'A.ECNOCOMP='  +quotedstr( DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString ) +' AND '
	       	+        'A.CIAID=B.CIAID ) ';
	     DMTE.cdsCntCaja.Close;
	     DMTE.cdsCntCaja.DataRequest(xSQL);
	     DMTE.cdsCntCaja.Open;
   end;

   xNReg:=0;
   xMto:=0;
   xbEof := False;

   DMTE.cdsCntCaja.IndexFieldNames := 'CUENTAID';
   DMTE.cdsCntCaja.First;
   xCuentaId := DMTE.cdsCntCaja.fieldbyname('CUENTAID').AsString;
   while not DMTE.cdsCntCaja.Eof do
   begin
      xMTOCHQLOC:=DMTE.FRound(xMTOCHQLOC+DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat,15,2 ) ;
      xMTOCHQEXT:=DMTE.FRound(xMTOCHQEXT+DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat,15,2 ) ;

      DMTE.cdsCntCaja.Next;
      xbEof := DMTE.cdsCntCaja.Eof;

      if (DMTE.cdsCntCaja.Eof) or (xCuentaId<>DMTE.cdsCntCaja.fieldbyname('CUENTAID').AsString)  then
      begin
         if not DMTE.cdsCntCaja.EOF then
            DMTE.cdsCntCaja.Prior;
         xNReg:=0;

         DMTE.cdsTrans.Insert;
         DMTE.cdsTrans.FieldByName('CIAID').Value   := DMTE.cdsCntCaja.FieldByName('CIAID').Value;
         DMTE.cdsTrans.FieldByName('TDIARID').Value := DMTE.cdsCntCaja.FieldByName('TDIARID').Value;
         DMTE.cdsTrans.FieldByName('ECANOMM').Value := DMTE.cdsCntCaja.FieldByName('ECANOMM').Value;
         DMTE.cdsTrans.FieldByName('ECNOCOMP').Value:= DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value;
         DMTE.cdsTrans.FieldByName('DCLOTE').Value  := DMTE.cdsCntCaja.FieldByName('DCLOTE').Value;
         DMTE.cdsTrans.FieldByName('DOCMOD').Value  := 'CXP';
         DMTE.cdsTrans.FieldByName('DOCID').Value   := DMTE.cdsCntCaja.FieldByName('DOCID').Value;
         DMTE.cdsTrans.FieldByName('DCSERIE').Value := DMTE.cdsCntCaja.FieldByName('DCSERIE').Value;
      	DMTE.cdsTrans.FieldByName('DCNODOC').Value := DMTE.cdsCntCaja.FieldByName('DCNODOC').Value;
         DMTE.cdsTrans.FieldByName('ECFCOMP').Value := DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value;
      	DMTE.cdsTrans.FieldByName('DCFEMIS').Value := DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value;
       	DMTE.cdsTrans.FieldByName('DCFVCMTO').Value:= DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value;
       	DMTE.cdsTrans.FieldByName('CPTOID').Value  := DMTE.cdsCntCaja.FieldByName('CPTOID').Value;
         DMTE.cdsTrans.FieldByName('CUENTAID').Value:= DMTE.cdsCntCaja.FieldByName('CUENTAID').Value;
         DMTE.cdsTrans.FieldByName('CLAUXID').Value := DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString;
     	   DMTE.cdsTrans.FieldByName('CCOSID').Value  := DMTE.cdsCntCaja.FieldByName('CCOSID').AsString;
         if DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString<>'' then
         begin
            DMTE.cdsTrans.FieldByName('DCAUXID').Value := DMTE.cdsCntCaja.FieldByName('DCAUXID').Value;
            DMTE.cdsTrans.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
         end
         else
         begin
            DMTE.cdsTrans.FieldByName('DCAUXID').Value := DMTE.cdsCntCaja.FieldByName('CUENTAID').Value;
//            DMTE.cdsTrans.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
         end;

         DMTE.cdsTrans.FieldByName('DCTCAMPA').Value:= DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value;
         DMTE.cdsTrans.FieldByName('TMONID').Value  := DMTE.cdsCntCaja.FieldByName('TMONID').Value;
         DMTE.cdsTrans.FieldByName('DCDH').Value := DMTE.cdsCntCaja.FieldByName('DCDH').Value;
         if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
         begin
            DMTE.cdsTrans.FieldByName('DCMTOORI').AsFloat := xMTOCHQLOC;
            DMTE.cdsTrans.FieldByName('DCMTOEXT').AsFloat := xMTOCHQEXT;
            DMTE.cdsTrans.FieldByName('DCMTOLO').AsFloat  := xMTOCHQLOC;
            if DMTE.cdsCntCaja.FieldByName('DCDH').Value='D' then
               DMTE.cdsTrans.FieldByName('DEBE').AsFloat := xMTOCHQLOC
            else
               if DMTE.cdsCntCaja.FieldByName('DCDH').Value='H' then
                  DMTE.cdsTrans.FieldByName('HABER').AsFloat := xMTOCHQLOC;

         end
         else
            if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString=DMTE.wTMonExt then
            begin
               DMTE.cdsTrans.FieldByName('DCMTOORI').AsFloat := xMTOCHQEXT;
               DMTE.cdsTrans.FieldByName('DCMTOEXT').AsFloat := xMTOCHQEXT;
               DMTE.cdsTrans.FieldByName('DCMTOLO').AsFloat  := xMTOCHQLOC;
               if DMTE.cdsCntCaja.FieldByName('DCDH').Value='D' then
                  DMTE.cdsTrans.FieldByName('DEBE').AsFloat := xMTOCHQEXT
               else
                  if DMTE.cdsCntCaja.FieldByName('DCDH').Value='H' then
                     DMTE.cdsTrans.FieldByName('HABER').AsFloat := xMTOCHQEXT;
            end;
         DMTE.cdsTrans.FieldByName('DCFLACDR').AsString:= 'S';   //Registro ya cuadrado
         DMTE.cdsTrans.FieldByName('DCANO').AsString   := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
         DMTE.cdsTrans.FieldByName('DCMM').AsString    := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
         DMTE.cdsTrans.FieldByName('DCDD').AsString    := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
         DMTE.cdsTrans.FieldByName('DCSS').AsString    := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
         DMTE.cdsTrans.FieldByName('DCSEM').AsString   := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
         DMTE.cdsTrans.FieldByName('DCTRI').AsString   := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
         DMTE.cdsTrans.FieldByName('DCAASS').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
         DMTE.cdsTrans.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
         DMTE.cdsTrans.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
         DMTE.cdsTrans.FieldByName('DCUSER').AsString  := DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString;         

         if (DMTE.xSRV_RUTA='\\INCORESA') or (DMTE.xSRV_RUTA='\\SACSA') or (DMTE.xSRV_RUTA='\\APLICACIONES\SOLAPLI')  then
         begin
            xSQL:='Select AUXNOMB from CNT201 '
                 +'Where CLAUXID='''+DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString+''' and '
                 +      'AUXID='''  +DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString  +'''';
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest( xSQL );
            DMTE.cdsQry.Open;
            DMTE.cdsTrans.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.FieldByName('AUXNOMB').AsString;
         end;
         xNReg:=xNReg+1;
         DMTE.cdsTrans.fieldbyName('NREG').AsInteger  := xNReg;
         if xbEof then
            DMTE.cdsCntCaja.Last
         else
             DMTE.cdsCntCaja.Next;
         xMTOCHQEXT :=0;
         xMTOCHQLOC :=0;
        xCuentaId := DMTE.cdsCntCaja.fieldbyname('CUENTAID').AsString;


      end;
   end;
   DMTE.cdsTrans.Post;
   DMTE.cdsTrans.Filter := 'DEBE>0 OR HABER>0';
   DMTE.cdsTrans.Filtered := True;
   DMTE.cdsCntCaja.IndexFieldNames := '';

end;


procedure TFPagoFacturas.pprChqVouchPrintingComplete(Sender: TObject);
begin
         DMTE.xFlagP := True;
end;

procedure TFPagoFacturas.dbeImporteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key In [' ', 'A'..'Z', 'a'..'z',
             '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
             '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
             ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
             '-', '_'] Then
    Key := #0;
end;

procedure TFPagoFacturas.dbeImporteExit(Sender: TObject);
begin
   if length(Trim(dbeImporte.Text))=0 then
      raise exception.Create('Ingrese Importe')
   else
    begin
      dbeImporte.Text := Floattostr(strtoFloat(dbeImporte.Text));
    end;
end;

procedure TFPagoFacturas.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

function TFPagoFacturas.CalculaRet: double;
var
   xTotAPagRet,xPorcAplica, xTotRetencion : double;
   xbAplica : boolean;
   xSQL, sRetNC : String;
begin
// Para Saber si la Compañía Retiene IGV.


   Result := 0;

   xSQL:='Select CIAID, CIARETIGV from TGE101 where CIAID='''+DMTE.cdsEgrCaja.FieldByName('CIAID').AsString+''' ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.Datarequest( xSQL );
   DMTE.cdsQry.Open;

	if DMTE.cdsQry.FieldByName('CIARETIGV').AsString<>'S' then Exit;

	// Tasas de La Retención
   xSQL:='SELECT A.*, CASE WHEN MODO=''PROVISIONADO'' THEN B.PROVRETIGV ELSE NULL END PROVRETIGV '
       +'FROM ( '

       +  'SELECT ''PROVISIONADO'' MODO, B.PROVRETIGV PROVDOC, B.TCANJEID, A.DETCPAG DETCDOC, B.TMONID, '
       +    'A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, '
       +    'A.PROVRUC, A.DOCID2, A.TDIARID2, A.CPANOMM, A.CPNOREG, A.CPSERIE, A.CPNODOC, A.CPFEMIS, '
       +    'A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, '
       +    'NVL(B.FLAGVAR2,''N'') DETRACCION, '
       +    'CASE WHEN B.TMONID='+Quotedstr(DMTE.wTmonLoc)
       +        ' THEN case when (nvl(B.CPMTOLOC,0)-nvl(B.CPPAGLOC,0))>0 '
       +                   'then ROUND(A.DEMTOLOC/(nvl(B.CPMTOLOC,0)-nvl(B.CPPAGLOC,0)),5) '
       +                   'else 0 end '
       +        ' ELSE case when (nvl(B.CPMTOEXT,0)-nvl(B.CPPAGEXT,0))>0 '
       +                   'then ROUND(A.DEMTOEXT/(nvl(B.CPMTOEXT,0)-nvl(B.CPPAGEXT,0)),5) '
       +                   'else 0 end '
       +    'END PORCPAGO, ''D'' DEDH, '
       // vhn 20110316
       +    'B.CPFEMIS CPFEMIPROV, (nvl(B.CPGRAVAD,0)+nvl(B.CPGRAVAD2,0)+nvl(B.CPNOGRAV,0)+nvl(B.CP_OTROS,0)) CPGRAVAD, B.CPNOGRAV, '
       +    '(nvl(B.CPIGV,0)+nvl(B.CPIGV2,0)+nvl(B.IGV_GRA_NO_DEST,0)) CPIGV, B.CPPAGORI, '
       +    'B.CPMTOLOC, B.CPMTOEXT, C.DOCRETIGV, C.DOCRESTA, 0.00 MTOBASERET, 0.00 MONTORET '
       +  'FROM CAJA303 A, CXP301 B, TGE110 C '
       +  'WHERE A.CIAID='''   +DMTE.cdsEgrCaja.FieldByName('CIAID').AsString   +''' AND '
       +        'A.TDIARID=''' +DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString +''' AND '
       +        'A.ECANOMM=''' +DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString +''' AND '
       +        'A.ECNOCOMP='''+DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' '
       +    'AND B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID2 AND B.CPANOMES=A.CPANOMM '
       +    'AND B.CPNOREG=A.CPNOREG AND C.DOCMOD=''CXP'' and C.DOCID=A.DOCID2 '

       +  'UNION ALL '

       +  'SELECT ''NO PROVISIONADO'' MODO, '''' PROVDOC, '''' TCANJEID, A.DETCPAG DETCDOC, A.TMONID, '
       +  'A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, '
       +    'B.PROVRUC, A.DOCID2, A.TDIARID2, A.CPANOMM, A.CPNOREG, A.CPSERIE, A.CPNODOC, A.CPFEMIS, '
       +    'A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, '
       // derrama vhn SE AÑADE FLAGVAR2 COMO FLAG DE DETRACCION
       +    '''N'' DETRACCION, '
       // derrama end
       +    '1 PORCPAGO, A.DEDH, '
       +    'A.CPFEMIS CPFEMISPROV, 0.00 CPGRAVAD, 0.00 CPNOGRAV, 0.00 CPIGV, 0.00 CPPAGORI, DEMTOLOC CPMTOLOC, DEMTOEXT CPMTOEXT, '
       +    'C.DOCRETIGV, C.DOCRESTA, 0.00 MTOBASERET, 0.00 MONTORET '
       +  'FROM CAJA301 A, TGE110 C, TGE201 B '
       +  'WHERE A.CIAID='''   +DMTE.cdsEgrCaja.FieldByName('CIAID').AsString   +''' AND '
       +        'A.TDIARID=''' +DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString +''' AND '
       +        'A.ECANOMM=''' +DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString +''' AND '
       +        'A.ECNOCOMP='''+DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString+'''  '
       +    'AND '+DMTE.wReplacCeros+'(FLAGVAR,'' '')<>''R'' AND C.DOCMOD=A.DOCMOD and C.DOCID=A.DOCID2 '
       +    'AND B.CLAUXID=A.CLAUXID AND B.PROV=A.PROV '
       + ' ) A, CNT201 B '
       +'WHERE B.CLAUXID=A.CLAUXID AND B.AUXID=A.PROV '
       +' ORDER BY A.CLAUXID, A.PROV,CPNOREG';

   DMTE.cdsConsulta.IndexFieldNames:='';
   DMTE.cdsConsulta.Filter:='';
   DMTE.cdsConsulta.Filtered:=False;
	DMTE.cdsConsulta.Close;
	DMTE.cdsConsulta.DataRequest( xSQL );

	try
		DMTE.cdsConsulta.Open;
	except
	end;

  // vhndema añadido para que nota de crédito tambien genere retencion
  sRetNC:='';
  DMTE.cdsConsulta.First;
  while not DMTE.cdsConsulta.Eof do
  begin
     if DMTE.cdsConsulta.FieldByName('DOCID2').AsString='01' then
     begin
        if DMTE.cdsConsulta.FieldByName('PROVDOC').AsString='S' then
           sRetNC:='S';
     end;
     DMTE.cdsConsulta.next;
  end;

  DMTE.cdsConsulta.First;
  while not DMTE.cdsConsulta.Eof do
  begin
     if (DMTE.cdsConsulta.FieldByName('DOCID2').AsString='07') and (DMTE.cdsConsulta.FieldByName('PROVDOC').AsString='') then
     begin
        if (sRetNC='S') and (cbRetNC.Checked) then
        begin
           DMTE.cdsConsulta.Edit;
           DMTE.cdsConsulta.FieldByName('PROVDOC').AsString:=sRetNC;
           DMTE.cdsConsulta.Post;
        end;
     end;
     DMTE.cdsConsulta.next;
  end;
  // fin vhndema

	DMTE.cdsConsulta.IndexFieldNames := '';
	DMTE.cdsConsulta.IndexFieldNames:='CLAUXID;PROV;CPNOREG';

   xMtoLoc := 0;  xMtoExt := 0;
   xTotAPagRet:=0; xTotRetencion:=0;
   xbAplica := False;
   DMTE.cdsConsulta.First;
   while not DMTE.cdsConsulta.Eof do
   begin
      if DMTE.cdsConsulta.FieldByName('DEDH').AsString='D' then // si es Debe, o sea si es pago
      begin
         xMtoLoc := xMtoLoc + DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
         xMtoExt := xMtoExt + DMTE.cdsConsulta.FieldByName('DEMTOEXT').AsFloat;
        ////////////////////////
        /// si existe Porcentaje de Detraccion no calcula Retencion
        /// si la provision a cancelar no esta afecta a retencion, por aplicarse detraccion
        if xDTRPorc=0 then
        begin
         ///////////////////////
         // si el proveedor retiene
         //if DMTE.cdsConsulta.FieldByName('PROVRETIGV').AsString='S' then
         if ( DMTE.cdsConsulta.FieldByName('PROVRETIGV').AsString='S' ) and
           // derrama vhndema SE AÑADE FLAGVAR2 COMO FLAG DE DETRACCION
            ( DMTE.cdsConsulta.FieldByName('DETRACCION').AsString<>'S' ) then
           // derrama vhndema
         begin
         // si el documento retiene
            if DMTE.cdsConsulta.FieldByName('DOCRETIGV').AsString='S' then
            begin
            // si la fecha de emisión es >= a la fecha mínima de retención ('01/06/2002')
               if (DMTE.cdsConsulta.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec) then
               begin
               // DOCUMENTOS NO PROVISIONADOS
                  if DMTE.cdsConsulta.FieldByName('MODO').AsString='NO PROVISIONADO' then
                  begin
                     DMTE.cdsConsulta.Edit;
                     DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
                     DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat   := DMTE.FRound( DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat* DMTE.xTasaPorce/100, 15, 2 );
                     xTotAPagRet   := xTotAPagRet+DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                     xTotRetencion := xTotRetencion+DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat;
                  end
                  else // DOCUMENTOS PROVISIONADOS
                  begin
                     if DMTE.cdsConsulta.FieldByName('TCANJEID').AsString<>'LE' then//FACTURAS PROVISIONADAS
                     begin
                     // si tiene marca desde CxP (PROVRETIGV='S')
                        if (DMTE.cdsConsulta.FieldByName('PROVDOC').AsString='S') then
                        begin
                           xbAplica := True;
                           if (DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat)>0 then
                           begin
                             // xPorcAplica := DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat/(DMTE.cdsConsulta.FieldByName('CPMTOLOC').AsFloat-DMTE.cdsConsulta.FieldByName('CPPAGLOC').AsFloat);
                              xPorcAplica := DMTE.cdsConsulta.FieldByName('PORCPAGO').AsFloat;
                              DMTE.cdsConsulta.Edit;
                              // SI LA MONEDA DEL DOCUMENTO ES EN SOLES
                              if DMTE.cdsConsulta.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
                              begin
                                 DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat-DMTE.cdsConsulta.FieldByName('CPPAGORI').AsFloat)*xPorcAplica,15,2);
                                 DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat   := DMTE.FRound(DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                              end
                              else
                              begin
                                 DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat-DMTE.cdsConsulta.FieldByName('CPPAGORI').AsFloat)*xPorcAplica,15,2);
                                 DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat   := DMTE.FRound(DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                              end;
                              xTotAPagRet:=xTotAPagRet+DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                              xTotRetencion := xTotRetencion+DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat;
                           end
                           else
                           begin
                              DMTE.cdsConsulta.Edit;
                              DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
                              DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat   := DMTE.FRound( DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                              xTotAPagRet:=xTotAPagRet+DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                              xTotRetencion := xTotRetencion+DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat;
                           end;
                        end
                        else // si no tiene marca desde CxP
                        begin
                          // xPorcAplica := DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat/(DMTE.cdsConsulta.FieldByName('CPMTOLOC').AsFloat-DMTE.cdsConsulta.FieldByName('CPPAGLOC').AsFloat);
                           xPorcAplica := DMTE.cdsConsulta.FieldByName('PORCPAGO').AsFloat;
                           // VHN CAMBIO PORQUE NO DEBE GENERAR RETENCION
                           if (DMTE.cdsConsulta.FieldByName('PROVDOC').AsString='S') then
                           begin
                              DMTE.cdsConsulta.Edit;
                              // SI LA MONEDA DEL DOCUMENTO ES EN SOLES
                              if DMTE.cdsConsulta.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
                              begin
                                 DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat)*xPorcAplica,15,2);
                                 DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat   := DMTE.FRound(DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                              end
                              else
                              begin
                                 DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat)*xPorcAplica*DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
                                 DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat   := DMTE.FRound(DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat* DMTE.xTasaPorce/ 100, 15, 2 );
                              end;
                              xTotAPagRet:=xTotAPagRet+DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                              xTotRetencion := xTotRetencion+DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat;
                           END;
                        end;
                     end
                     else // si son Letras
                     begin
                     // suma retenciones de las letras grabadas en CXP313
                     end;
                  end;
               end;
            end;
         end;
        end;
      end
      else
      begin
         xMtoLoc := xMtoLoc - DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
         xMtoExt := xMtoExt - DMTE.cdsConsulta.FieldByName('DEMTOEXT').AsFloat;
      end;
      DMTE.cdsConsulta.next;
   end;

   if (xTotAPagRet>=DMTE.xTasaMonto) or (xbAplica) then
   begin
      Result:=xTotRetencion;
      if DMTE.cdsConsulta.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
      begin
         xMtoLoc := xMtoLoc - xTotRetencion;
         xMtoExt := xMtoExt - DMTE.FRound(xTotRetencion/strtofloat(dbeTCambio.Text),15,2);
      end
      else
      begin
         xMtoLoc := xMtoLoc - DMTE.FRound(xTotRetencion*strtofloat(dbeTCambio.Text),15,2);
         xMtoExt := xMtoExt - xTotRetencion;
      end;
   end;
end;

procedure TFPagoFacturas.z2bbtnGrabaClick(Sender: TObject);
var
   sSQL, xSQL : String;
begin
   if (DMTE.cdsRegCxP.RecordCount=0) and (DMTE.cdsDocPago.RecordCount=0) then
   begin
      ShowMessage('¡¡¡NO hay documentos que cancelar!!!');
      exit;
   end;

   if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString<>'I' then
   begin
      ShowMessage('El estado actual de la Cancelación no permite Grabar');
      exit;
   end;

   xSQL:='CIAID='+quotedstr(dblcCia.text)+' AND TDIARID='+quotedstr(dblcTDiario.text)+' and '
       +'ECNOCOMP<>'+quotedstr( dbeNoComp.Text )+' and '
	  	 +'CCBCOID='+quotedstr(dblcCCBco.Text)+' AND ECNOCHQ='+quotedstr(dbeNoChq.text);
//		 +' AND ECESTADO<>''A'' ';
   DMTE.DisplayDescrip('prvTGE','CAJA302','ECNOCHQ,ECESTADO,ECELABO',xsql,'ECNOCHQ');
   if DMTE.cdsQry.FieldByName('ECNOCHQ').AsString<>'' then
   begin
     if DMTE.cdsQry.FieldByName('ECESTADO').AsString<>'A' then
     begin
        showmessage('El número de Cheque ya fue Utilizado');
//        dbeNoChq.Text := '';
        exit;
     end
     else
     begin
        if DMTE.cdsQry.FieldByName('ECELABO').AsString='NULO' then
        begin
           showmessage('El número de Cheque ya fue Utilizado');
//           dbeNoChq.Text := '';
           exit;
        end
     end;
   end;

   z2bbtnSumatClick(Self);

   ErrorCount:=0;
   DMTE.DCOM1.AppServer.IniciaTransaccion;

   if DMTE.cdsDocPago.RecordCount=0 then
   begin
      if (DMTE.cdsMovCxP.Modified) or (DMTE.cdsMovCxP.changeCount>0) then
      begin
         DMTE.ControlTran(0,DMTE.cdsMovCxP, 'MOVCXP');
      end;
   end;
   DMTE.ControlTran(0,DMTE.cdsRegCxP,'REGCXP');
   DMTE.ControlTran(0,DMTE.cdsDocPago,'DOCPAGO');

   xRetLoc:=0;
   if cbConDetRet.Checked then
      xRetLoc := CalculaRet;

   //(xDTRPorc>0) and (DMTE.wModo='M'))//
   /////////////////////////////////////////////////////////////////////////////
   // solo si se aplico DETRACCION y es Modificacion
   if (xDTRPorc>0) and (xDTRGrabada='1') then
   begin
       Exit;
   end;
   /////////////////////////////////////////////////////////////////////////////

   ActSaldosMovCxP;

   if xErrorGraba then
   begin
      xErrorGraba := False;
      exit;
   end;

   DMTE.cdsEgrCaja.edit;
   DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat :=xMtoLoc;
   DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat :=xMtoExt;
   if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
      DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat :=xMtoLoc
   else
      DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat :=xMtoExt;
   dbeImporte.text:=FloatToStr(DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat);

   DMTE.cdsEgrCaja.FieldByName('ECUSER').Value      := DMTE.wUsuario; // usuario que registra
   DMTE.cdsEgrCaja.FieldByName('ECFREG').Value      := DateS;         // fecha que registra Usuario
   DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time;         // Hora de Registro de Usuario
   cdspost(DMTE.cdsEgrCaja);

{   xSQL:='select * from CAJA302 '
        +'where CIAID='''   +dblcCia.Text    +''' and '
        +      'ECANOMM=''' +edtPeriodo.Text +''' and '
        +      'TDIARID=''' +dblcTDiario.Text+''' and '
        +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
   DMTE.cdsEgrCaja.DataRequest(xSQL);}
   DMTE.ControlTran(0,DMTE.cdsEgrCaja,'EGRCAJA');
   DMTE.ControlTran(8,NIL,''); //COMMIT

   sSQL:='select * from TGE202 '
        +'where CIAID='+quotedstr(dblccia.Text)
        +'  and CUENTAID=' +quotedstr(edtCuenta.text);
   DMTE.cdsQry2.Close;
   DMTE.cdsQry2.DataRequest(sSQL);
   DMTE.cdsQry2.open;

   if dblcClase.Enabled then
   begin
      dblcClase.Enabled     := False ;
      dblcdAux.Enabled      := False ;
   end;

   //z2bbtnNuevo.Enabled      := True  ;
   z2bbtnCancelado.Enabled  := True  ;
   z2bbtnAnula.Enabled      := True  ;
   z2bbtnImprime.Enabled    := True  ;
   wModifica                := False ;

//   if (xDTRPorc>0) and (DMTE.wModo='A') then // presenta panel solo si se aplica DETRACCION y es Adicion
   if (xDTRPorc>0) and (DMTE.cdsDocPago.recordcount<=1) then // presenta panel solo si se aplica DETRACCION y es Adicion
   begin
      /////////////////////////////////////////////////////////////////////////////

      // vhndema
      xSQL:='SELECT * FROM TGE106 WHERE '+
            'BANCOID='+quotedstr(DMTE.cdsbancoegr.FieldByName('BANCOID').AsString)+' AND '+
            'TMONID='+quotedstr(DMTE.wTMonLoc)+' AND CIAID='+quotedstr(dblcCia.text)+
            ' AND ACTIVO=''S'' AND CUEEMICHE=''S''';
      DMTE.cdsSQL.Close;
      DMTE.cdsSQL.DataRequest(xSQL);
      DMTE.cdsSQL.open;
      dblcCCBcoDTR.LookupTable:=DMTE.cdsSQL;
      dblcCCBcoDTR.LookupField:='CCBCOID';

      // activa PANEL para ingresar Cheque por ser el registro de la DETRACCION
      if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString=DMTE.wTMonExt then // solo por ser Moneda Extranjera
      begin
         ////////////////////////////////////////////////////////////
         // Activa Cuenta Corriente por exigirse moneda nacional para el deposito de la DETRACCION
         lblCCBcoDTR.Visible:=True; dblcCCBcoDTR.Visible:=True;
      end
      else
      begin
         dblcCCBcoDTR.Text:=dblcCCBco.Text;
         dblcCCBcoDTRExit( self );
      end;
      // end vhndema

      pnlDetraccion.Visible:=True;
      /////////////////////////////////////////////////////////////////////////////
   end
   else
   begin
      ShowMessage('Grabación OK');
      lblCCBcoDTR.Visible:=False; dblcCCBcoDTR.Visible:=False;
      dbgDocPago.ReadOnly:=True;
      DMTE.cdsDocPago.EnableControls;
   end;
end;

procedure TFPagoFacturas.Detraccion;
var
   wSql : string;
   wDETCPAG, wDETCDOC, wECTCAMB, xOtroLoc, xOtroExt : Double;
   wECNOCOMP,wTMONID,wCIAID,wTDIARID,wTDIARID2,wECANOMM,wCPANOMM,wPROV,
   wPROVRUC,wCPNOREG,wDOCID2,wCPSERIE,wCPNODOC,wCPTOID,wCUENTAID,wCPFEMIS,wCPFVCMTO,
   wDEUSER,wDEFREG,wDEHREG,wPROVDES,wCLAUXID,wECFCOMP,wFPAGOID,wECGLOSA,wECLOTE,wECESTADO,
   wECUSER,wECFREG,wECHREG,wEC_PROCE,wEC_IE,WECFEMICH,WECNOCHQ,WECGIRA,
   WCCBCOVOUCH,WECANO,WECMM,WECDD,WECSS,WECSEM,WECTRI,WECAASS,WECAASEM,WECAATRI : string;
   xRegAct : TBookMark;
begin
   ///////////////////////////////////////////////////////////////////////////////////
   /// Aqui se generan los registros por la DETRACCION, de la siguiente forma:
   /// 1- En CAJA303, se cambia los importes, restandole el valor de la Detraccion
   /// 2- En CAJA303, se actualiza el campo ECNOCOMPR con el ECNOCOMP
   /// 3- En CAJA303, se adiciona el registro que contiene el monto de la Detraccion
   /// 4- En CAJA303, a este registro se le suma uno en el ECNOCOMP
   /// 5- En CAJA303, se actualiza el campo ECNOCOMPR con el ECNOCOMP origen
   /// 6- En CAJA302, se adiciona el registro de la Detraccion
   /// 7- En CAJA302, se realiza lo mismo que en CAJA303 pasos 4,5,6
   //////////////////////////////////////////////////////////////////////////////////

   DMTE.cdsRegCxP.DisableControls;
   xRegAct := DMTE.cdsRegCxP.GetBookmark;
   xOtroLoc := 0;
   xOtroExt := 0;
   DMTE.cdsRegCxP.First ;
   while not DMTE.cdsRegCxP.Eof do
   begin
      if DMTE.cdsRegCxP.FieldByName('DEDH').Value='D' then
      begin
        xOtroLoc:=xOtroLoc + DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
        xOtroExt:=xOtroExt + DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
      end
      else
      begin
        xOtroLoc:=xOtroLoc - DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
        xOtroExt:=xOtroExt - DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
      end;
      DMTE.cdsRegCxP.Next;
   end;
   DMTE.cdsRegCxP.GotoBookmark(xRegAct);
   DMTE.cdsRegCxP.FreeBookmark(xRegAct);
   DMTE.cdsRegCxP.EnableControls;

   /// CAJA303
   /// ACCESA AL CXP302 PARA TOMAR LOS DATOS DEL TIPDET='TO' - TOTAL SI DETRACCION
   wSQL:='SELECT * FROM CXP302 WHERE '+
         'CIAID='+quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)+' AND '+
         'TDIARID='+quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID2').AsString)+' AND '+
         'DCPANOMM='+quotedstr(DMTE.cdsDocPago.FieldByName('CPANOMM').AsString)+' AND '+
         'CPNOREG='+quotedstr(DMTE.cdsDocPago.FieldByName('CPNOREG').AsString)+' AND '+
         'CLAUXID='+quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString)+' AND '+
         'DCPAUXID='+quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString)+' AND '+
         'TIPDET='+quotedstr('TO');
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(wSQL);
   DMTE.cdsQry.open;

    DMTE.cdsDocPago.Edit;
    DMTE.cdsDocPago.FieldByName('TIPDET').AsString:='TO';
    DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString:=DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString;
    DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat  :=DMTE.cdsQry.FieldByName('DCPMOORI').AsFloat;
    if DMTE.cdsDocPago.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
    begin
       DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat:=DMTE.cdsDocPago.fieldbyname('DEMTOORI').AsFloat;
       DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat:=DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat;
       DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat:=DMTE.FRound(
                   DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat /
                   DMTE.cdsDocPago.fieldbyname('DETCPAG').AsFloat,15,2);
       DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat:=DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat;
    end
    else
    begin
      if DMTE.cdsDocPago.FieldByName('TMONID').AsString = DMTE.wTMonExt then
      begin
       DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat:=DMTE.cdsDocPago.fieldbyname('DEMTOORI').AsFloat;
       DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat:=DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat;
       DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat:=DMTE.FRound(
                   DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat *
                   DMTE.cdsDocPago.fieldbyname('DETCPAG').AsFloat,15,2);
       DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat:=DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat;
      end;
    end;

   /// ACCESA AL CXP302 PARA TOMAR LOS DATOS DEL TIPDET='I4' - DETRACCION
   wSQL:='SELECT * FROM CXP302 WHERE '+
         'CIAID='+quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)+' AND '+
         'TDIARID='+quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID2').AsString)+' AND '+
         'DCPANOMM='+quotedstr(DMTE.cdsDocPago.FieldByName('CPANOMM').AsString)+' AND '+
         'CPNOREG='+quotedstr(DMTE.cdsDocPago.FieldByName('CPNOREG').AsString)+' AND '+
         'CLAUXID='+quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString)+' AND '+
         'DCPAUXID='+quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString)+' AND '+
         'TIPDET='+quotedstr('I4');
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(wSQL);
   DMTE.cdsQry.open;

    wECNOCOMP:=DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString;
    wTMONID  :=DMTE.cdsDocPago.FieldByName('TMONID').AsString;
    wDETCPAG :=DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat;
    wCIAID   :=DMTE.cdsDocPago.fieldbyname('CIAID').AsString;
    wTDIARID :=DMTE.cdsDocPago.fieldbyname('TDIARID').AsString;
    wECANOMM :=DMTE.cdsDocPago.fieldbyname('ECANOMM').AsString;
    wTDIARID2:=DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString;
    wCPANOMM :=DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString;
    wPROV    :=DMTE.cdsDocPago.fieldbyname('PROV').AsString;
    wPROVRUC :=DMTE.cdsDocPago.fieldbyname('PROVRUC').AsString;
    wCPNOREG :=DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString;
    wDOCID2  :=DMTE.cdsDocPago.fieldbyname('DOCID2').AsString;
    wCPSERIE :=DMTE.cdsDocPago.fieldbyname('CPSERIE').AsString;
    wCPNODOC :=DMTE.cdsDocPago.fieldbyname('CPNODOC').AsString;
    wDETCDOC :=DMTE.cdsDocPago.fieldbyname('DETCDOC').AsFloat;
    wDETCPAG :=DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat;
    wCPTOID  :=DMTE.cdsDocPago.FieldByName('CPTOID').AsString;
    wCUENTAID:=DMTE.cdsDocPago.FieldByName('CUENTAID').AsString;
    wCPFEMIS :=DMTE.cdsDocPago.fieldbyname('CPFEMIS').AsString;
    wCPFVCMTO:=DMTE.cdsDocPago.fieldbyname('CPFVCMTO').AsString;
    wDEUSER  :=DMTE.cdsDocPago.fieldbyname('DEUSER').AsString;
    wDEFREG  :=DMTE.cdsDocPago.fieldbyname('DEFREG').AsString;
    wDEHREG  :=DMTE.cdsDocPago.fieldbyname('DEHREG').AsString;
    wPROVDES :=DMTE.cdsDocPago.fieldbyname('PROVDES').AsString;
    wCLAUXID :=DMTE.cdsDocPago.fieldbyname('CLAUXID').AsString;

    DMTE.cdsDocPago.Append;
    DMTE.cdsDocPago.FieldByName('TIPDET').AsString:='I4';
    DMTE.cdsDocPago.FieldByName('CIAID').AsString:=wCIAID;
    DMTE.cdsDocPago.FieldByName('TDIARID').AsString:=wTDIARID;
    DMTE.cdsDocPago.FieldByName('ECANOMM').AsString:=wECANOMM;
    DMTE.cdsDocPago.FieldByName('TDIARID2').AsString:=wTDIARID2;
    DMTE.cdsDocPago.FieldByName('CPANOMM').AsString:=wCPANOMM;
    DMTE.cdsDocPago.FieldByName('PROV').AsString:=wPROV;
    DMTE.cdsDocPago.FieldByName('PROVRUC').AsString:=wPROVRUC;
    DMTE.cdsDocPago.FieldByName('CPNOREG').AsString:=wCPNOREG;
    DMTE.cdsDocPago.FieldByName('DOCID2').AsString:=wDOCID2;
    DMTE.cdsDocPago.FieldByName('CPSERIE').AsString:=wCPSERIE;
    DMTE.cdsDocPago.FieldByName('CPNODOC').AsString:=wCPNODOC;
    DMTE.cdsDocPago.FieldByName('TMONID').AsString:=wTMONID;
    DMTE.cdsDocPago.fieldbyname('DETCDOC').AsFloat:=wDETCDOC;
    DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat:=wDETCPAG;
    DMTE.cdsDocPago.FieldByName('CPTOID').AsString:=DMTE.cdsQry.FieldByName('CPTOID').AsString;
    DMTE.cdsDocPago.FieldByName('CUENTAID').AsString:=DMTE.cdsQry.FieldByName('CUENTAID').AsString;
    DMTE.cdsDocPago.fieldbyname('CPFEMIS').AsString:=wCPFEMIS;
    DMTE.cdsDocPago.fieldbyname('CPFVCMTO').AsString:=wCPFVCMTO;
    DMTE.cdsDocPago.fieldbyname('DEUSER').AsString:=wDEUSER;
    DMTE.cdsDocPago.fieldbyname('DEFREG').AsString:=wDEFREG;
    DMTE.cdsDocPago.fieldbyname('DEHREG').AsString:=wDEHREG;
    DMTE.cdsDocPago.fieldbyname('PROVDES').AsString:=wPROVDES;
    DMTE.cdsDocPago.fieldbyname('CLAUXID').AsString:=wCLAUXID;

    DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat:=DMTE.cdsQry.FieldByName('DCPMOORI').AsFloat;
    if DMTE.cdsDocPago.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
    begin
       DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat:=DMTE.cdsDocPago.fieldbyname('DEMTOORI').AsFloat;
       DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat:=DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat;
       DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat:=DMTE.FRound(
                   DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat /
                   DMTE.cdsDocPago.fieldbyname('DETCPAG').AsFloat,15,2);
       DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat:=DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat;
    end
    else
    begin
      if DMTE.cdsDocPago.FieldByName('TMONID').AsString = DMTE.wTMonExt then
      begin
       DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat:=DMTE.cdsDocPago.fieldbyname('DEMTOORI').AsFloat;
       DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat:=DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat;
       DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat:=DMTE.FRound(
                   DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat *
                   DMTE.cdsDocPago.fieldbyname('DETCPAG').AsFloat,15,2);
       DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat:=DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat;
      end;
    end;
    DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString:=wECNOCOMP;
    wSql:='CIAID='+quotedstr(dblcCia.Text)+' AND ECANOMM='+quotedstr(edtPeriodo.Text)
             +' AND TDIARID='+ quotedstr(dblcTDiario.Text);
    wECNOCOMP:=DMTE.UltimoNum('prvCaja','CAJA303','ECNOCOMP',wSql);
    wECNOCOMP:=DMTE.StrZero(wECNOCOMP,DMTE.cdsDocPago.FieldByName('ECNOCOMP').Size);
    DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString:=wECNOCOMP;

    DMTE.AplicaDatos(DMTE.cdsDocPago,'DOCPAGO');

   /////////////////////////////////////////////////////////////////////////////
   /// CAJA302
   /// ACCESA AL CXP302 PARA TOMAR LOS DATOS DEL TIPDET='TO' - TOTAL SI DETRACCION
   wSQL:='SELECT * FROM CXP302 WHERE '+
         'CIAID='+quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)+' AND '+
         'TDIARID='+quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID2').AsString)+' AND '+
         'DCPANOMM='+quotedstr(DMTE.cdsDocPago.FieldByName('CPANOMM').AsString)+' AND '+
         'CPNOREG='+quotedstr(DMTE.cdsDocPago.FieldByName('CPNOREG').AsString)+' AND '+
         'CLAUXID='+quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString)+' AND '+
         'DCPAUXID='+quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString)+' AND '+
         'TIPDET='+quotedstr('TO');
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(wSQL);
   DMTE.cdsQry.open;

    DMTE.cdsEgrCaja.Edit;
    DMTE.cdsEgrCaja.FieldByName('TIPDET').AsString:='TO';
    DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString:=DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
    if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
    begin
       DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat:=DMTE.cdsQry.FieldByName('DCPMOORI').AsFloat    +xOtroLoc;
       DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat:=DMTE.cdsEgrCaja.fieldbyname('ECMTOORI').AsFloat;
       DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat:=DMTE.FRound(
                   DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat /
                   DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat,15,2)+xOtroExt;
    end
    else
    begin
      if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonExt then
      begin
       DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat:=DMTE.cdsQry.FieldByName('DCPMOORI').AsFloat    +xOtroExt;
       DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat:=DMTE.cdsEgrCaja.fieldbyname('ECMTOORI').AsFloat;
       DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat:=DMTE.FRound(
                   DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat *
                   DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat,15,2)+xOtroLoc;
      end;
    end;


   // ASIENTO DE LA DETRACCION


   /// ACCESA AL CXP302 PARA TOMAR LOS DATOS DEL TIPDET='I4' - DETRACCION
   wSQL:='SELECT * FROM CXP302 WHERE '+
         'CIAID='+quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)+' AND '+
         'TDIARID='+quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID2').AsString)+' AND '+
         'DCPANOMM='+quotedstr(DMTE.cdsDocPago.FieldByName('CPANOMM').AsString)+' AND '+
         'CPNOREG='+quotedstr(DMTE.cdsDocPago.FieldByName('CPNOREG').AsString)+' AND '+
         'CLAUXID='+quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString)+' AND '+
         'DCPAUXID='+quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString)+' AND '+
         'TIPDET='+quotedstr('I4');
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(wSQL);
   DMTE.cdsQry.open;

    wECNOCOMP   :=DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
    wTMONID     :=DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
    wECTCAMB    :=DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
    wCIAID      :=DMTE.cdsEgrCaja.fieldbyname('CIAID').AsString;
    wTDIARID    :=DMTE.cdsEgrCaja.fieldbyname('TDIARID').AsString;
    wECANOMM    :=DMTE.cdsEgrCaja.fieldbyname('ECANOMM').AsString;
    wCLAUXID    :=DMTE.cdsEgrCaja.fieldbyname('CLAUXID').AsString;
    wPROV       :=DMTE.cdsEgrCaja.fieldbyname('PROV').AsString;
    wPROVRUC    :=DMTE.cdsEgrCaja.fieldbyname('PROVRUC').AsString;
    wECFCOMP    :=DMTE.cdsEgrCaja.fieldbyname('ECFCOMP').AsString;
    wFPAGOID    :=DMTE.cdsEgrCaja.fieldbyname('FPAGOID').AsString;
//    wCPTOID     :=DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString;
//    wCUENTAID   :=DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString;
    wECGLOSA    :=DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString;
    wECLOTE     :=DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
    wECESTADO   :=DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString;
    wECUSER     :=DMTE.cdsEgrCaja.fieldbyname('ECUSER').AsString;
    wECFREG     :=DMTE.cdsEgrCaja.fieldbyname('ECFREG').AsString;
    wECHREG     :=DMTE.cdsEgrCaja.fieldbyname('ECHREG').AsString;
    wEC_PROCE   :=DMTE.cdsEgrCaja.fieldbyname('EC_PROCE').AsString;
    wEC_IE      :=DMTE.cdsEgrCaja.fieldbyname('EC_IE').AsString;
//    WECFEMICH   :=DMTE.cdsEgrCaja.fieldbyname('ECFEMICH').AsString;
//    WBANCOID    :=DMTE.cdsEgrCaja.fieldbyname('BANCOID').AsString;
//  WCCBCOID    :=DMTE.cdsEgrCaja.fieldbyname('CCBCOID').AsString;
    WECGIRA     :=DMTE.cdsEgrCaja.fieldbyname('ECGIRA').AsString;
    WCCBCOVOUCH :=DMTE.cdsEgrCaja.fieldbyname('CCBCOVOUCH').AsString;
    WECANO      :=DMTE.cdsEgrCaja.fieldbyname('ECANO').AsString;
    WECMM       :=DMTE.cdsEgrCaja.fieldbyname('ECMM').AsString;
    WECDD       :=DMTE.cdsEgrCaja.fieldbyname('ECDD').AsString;
    WECSS       :=DMTE.cdsEgrCaja.fieldbyname('ECSS').AsString;
    WECSEM      :=DMTE.cdsEgrCaja.fieldbyname('ECSEM').AsString;
    WECTRI      :=DMTE.cdsEgrCaja.fieldbyname('ECTRI').AsString;
    WECAASS     :=DMTE.cdsEgrCaja.fieldbyname('ECAASS').AsString;
    WECAASEM    :=DMTE.cdsEgrCaja.fieldbyname('ECAASEM').AsString;
    WECAATRI    :=DMTE.cdsEgrCaja.fieldbyname('ECAATRI').AsString;


    DMTE.cdsEgrCaja.Append;
    DMTE.cdsEgrCaja.FieldByName('TIPDET').AsString:='I4';
    DMTE.cdsEgrCaja.FieldByName('CIAID').AsString:=wCIAID;
    DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString:=wTDIARID;
    DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString:=wECANOMM;
    DMTE.cdsEgrCaja.fieldbyname('CLAUXID').AsString:=wCLAUXID;
    DMTE.cdsEgrCaja.FieldByName('PROV').AsString:=wPROV;
    DMTE.cdsEgrCaja.FieldByName('PROVRUC').AsString:=wPROVRUC;
    DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString:=wECFCOMP;
    DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString:=wFPAGOID;
    DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString:=DMTE.cdsCnpEgr.FieldByName('CPTOID').AsString;
    // vhndema   error en la cuenta contable en el caso de dolares
    DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString:=XCTACONT;
    // end vhndema
    DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString:=wECGLOSA;
    DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString:=wECLOTE;
    DMTE.cdsEgrCaja.fieldbyname('ECESTADO').AsString:=wECESTADO;
    DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString:=wECUSER;
    DMTE.cdsEgrCaja.fieldbyname('ECFREG').AsString:=wECFREG;
    DMTE.cdsEgrCaja.fieldbyname('EC_PROCE').AsString:=wEC_PROCE;
    DMTE.cdsEgrCaja.fieldbyname('EC_IE').AsString:=wEC_IE;
    DMTE.cdsEgrCaja.fieldbyname('ECFEMICH').AsString:=dbdtpFEmis.Text;
    DMTE.cdsEgrCaja.fieldbyname('BANCOID').AsString:=DMTE.cdsBancoEgr.FieldByName('BANCOID').AsString;
    DMTE.cdsEgrCaja.fieldbyname('CCBCOID').AsString:=xCCBCOID;
    DMTE.cdsEgrCaja.fieldbyname('ECNOCHQ').AsString:=dbeNoChqDTR.Text;
    DMTE.cdsEgrCaja.fieldbyname('ECGIRA').AsString:=WECGIRA;
    DMTE.cdsEgrCaja.fieldbyname('CCBCOVOUCH').AsString:=WCCBCOVOUCH;
    DMTE.cdsEgrCaja.fieldbyname('ECANO').AsString:=WECANO;
    DMTE.cdsEgrCaja.fieldbyname('ECMM').AsString:=WECMM;
    DMTE.cdsEgrCaja.fieldbyname('ECDD').AsString:=WECDD;
    DMTE.cdsEgrCaja.fieldbyname('ECSS').AsString:=WECSS;
    DMTE.cdsEgrCaja.fieldbyname('ECSEM').AsString:=WECSEM;
    DMTE.cdsEgrCaja.fieldbyname('ECTRI').AsString:=WECTRI;
    DMTE.cdsEgrCaja.fieldbyname('ECAASS').AsString:=WECAASS;
    DMTE.cdsEgrCaja.fieldbyname('ECAASEM').AsString:=WECAASEM;
    DMTE.cdsEgrCaja.fieldbyname('ECAATRI').AsString:=WECAATRI;
    DMTE.cdsEgrCaja.fieldbyname('TMONID').AsString:=wTMONID;
    DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat:=wECTCAMB;

    DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat:=DMTE.cdsQry.FieldByName('DCPMOORI').AsFloat;
    if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
    begin
       DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat:=DMTE.cdsEgrCaja.fieldbyname('ECMTOORI').AsFloat;
       DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat:=DMTE.FRound(
                   DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat /
                   DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat,15,2);

    end
    else
    begin
      if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonExt then
      begin
       DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat:=DMTE.cdsEgrCaja.fieldbyname('ECMTOORI').AsFloat;
       DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat:=DMTE.FRound(
                   DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat *
                   DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat,15,2);
      end;
    end;
    DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString:=wECNOCOMP;
    wSql:='CIAID='+quotedstr(dblcCia.Text)+' AND ECANOMM='+quotedstr(edtPeriodo.Text)
             +' AND TDIARID='+ quotedstr(dblcTDiario.Text);
    wECNOCOMP:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',wSql);
    wECNOCOMP:=DMTE.StrZero(wECNOCOMP,DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
    DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString:=wECNOCOMP;

    DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

    ////////////////////////////////////////////////////////////////////////////
    z2bbtnGraba.Enabled:=False;
    lblDTR.Visible:=True;
    z2bbtnSube.Enabled:=False;
end;

procedure TFPagoFacturas.ContabilizaProc1;
begin
      if DMTE.sLet=DMTE.cdsDocPago.FieldByName('DOCID2').AsString then
         bLetra:=True;

      DMTE.cdsCntCaja.Insert;

   // actualiza sobre CAJA304 (archivo contable de Caja) los documentos provisionados
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
end;

procedure TFPagoFacturas.ContabilizaProc2;
var
   xSQL, xWhere : string;
begin
			if (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec)  AND
				(DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV','DOCMOD=''CXP'' AND DOCID='+QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString),'DOCRETIGV')='S') AND
				 (lblSujetoRetencion.visible) then
			begin
				xSQL:= 'SELECT TMONID,TCANJEID,CPNOGRAV,CPIGV,CPGRAVAD,CPCANJE,CPMTOLOC,CPMTOEXT,PROVDES FROM CXP301 '
							 +' where CIAID='''   +DMTE.cdsDocPago.fieldbyname('CIAID').AsString   +''' and '
							 +' CPANOMES='''+DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString +''' and '
							 +' TDIARID=''' +DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString+''' and '
							 +' CPNOREG=''' +DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString +''' '  ;
				DMTE.cdsQry3.IndexFieldNames:='';
				DMTE.cdsQry3.Close;
				DMTE.cdsQry3.DataRequest(xSQL);
				DMTE.cdsQry3.Open;

				if DMTE.cdsQry3.fieldbyname('TMONID').AsString=DMTE.wTMonLoc then
					 xPorcPago := DMTE.FRound(DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat
											 /DMTE.cdsQry3.fieldbyname('CPMTOLOC').AsFloat,15,5)
				else
					 xPorcPago := DMTE.FRound(DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat
											 /DMTE.cdsQry3.fieldbyname('CPMTOEXT').AsFloat,15,5);

				if (DMTE.cdsQry3.fieldbyname('TCANJEID').AsString='LE') AND (DMTE.cdsQry3.fieldbyname('CPNOGRAV').AsFloat>0) then
				begin
					xWhere:=' CIAID='''   +DMTE.cdsDocPago.fieldbyname('CIAID').AsString   +''' and '
									+' CPANOMES='''+DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString +''' and '
									+' PROV='''+DMTE.cdsDocPago.fieldbyname('PROV').AsString +''' and '
									+' CPNOREGLET=''' +DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString +''' '  ;

					if DMTE.RecuperarDatos( 'CXP313', 'TMONID,TMONID2,TCANJEID,CPRETORI,CPRETLOC,CPRETEXT,PROV,CPTCAMPR,CPTCAMAJ' , xWhere ) then
					begin
						DMTE.cdsRec.First;
						while not  DMTE.cdsRec.Eof do
                  begin
                     if DMTE.wTMonLoc=DMTE.cdsRec.FieldByName('TMONID').AsString then
                     begin
                        xMtoRetL:=DMTE.FRound(xMtoRetL+DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat,15,2)*xPorcPago,15,2);
                        xMtoRetE:=DMTE.FRound((xMtoRetE+DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat,15,2)*xPorcPago)/DMTE.cdsRec.FieldByName('CPTCAMPR').AsFloat,15,2);
                        xMtoRetLH:=DMTE.FRound(xMtoRetLH+DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat,15,2)*xPorcPago,15,2);
                        xMtoRetEH:=DMTE.FRound(xMtoRetEH+(DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat,15,2)*xPorcPago)/DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat,15,2);
                     end
                     else
                     begin
                        xMtoRetE:=DMTE.FRound(xMtoRetE+DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat,15,2)*xPorcPago,15,2);
                        xMtoRetL:=DMTE.FRound(xMtoRetL+DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat,15,2)*xPorcPago*DMTE.cdsRec.FieldByName('CPTCAMPR').AsFloat,15,2);
                        xMtoRetEH:=DMTE.FRound(xMtoRetEH+DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat,15,2)*xPorcPago,15,2);
                        xMtoRetLH:=DMTE.FRound(xMtoRetLH+DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat,15,2)*xPorcPago*DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat,15,2);
                     end;
                     DMTE.cdsRec.Next;
                  end;
               end
               else
                  Showmessage('Error en la recuperación del documento - WMC');
            end;
            DMTE.cdsDocPago.EnableControls;
            if (xMtoRetL>0) and (xDTRPorc=0)then
            begin
               DMTE.cdsCntCaja.Insert;
               if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
                  Contab_DocPago_RETENCION_DEBE(xMtoRetL,xMtoRetE,xMtoRetL)
               else
                  Contab_DocPago_RETENCION_DEBE(xMtoRetL,xMtoRetE,xMtoRetE);

               DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
               if DMTE.wTipoDif='' then
               begin
                  DMTE.cdsCntCaja.Insert;
                  Contab_DifCamDocPago_Retencion(xPorcPago,xMtoRetL,xMtoRetLH);
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
               end;//DMTE.wTipoDif
            end;//xmtoret
         end; // si el documento es de retencion
end;

procedure TFPagoFacturas.Contab_HaberProc1;
var
  xWhere, xSQL : string;
begin
    if DMTE.cdsDocPago.FieldByName('DOCID2').AsString<>DMTE.sLet then
    begin // SI SON FACTURAS
      if (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec)  AND
         (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV','DOCMOD=''CXP'' AND DOCID='+QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString),'DOCRETIGV')='S') AND
         (lblSujetoRetencion.visible) then
      begin
         xWhere := 'CIAID='+quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
                  +' and CLAUXID='+quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString)
                  +' and PROV='+quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString)
                  +' and CPSERIE='+quotedstr(DMTE.cdsDocPago.FieldByName('CPSERIE').AsString)
                  +' and CPNODOC='+quotedstr(DMTE.cdsDocPago.FieldByName('CPNODOC').AsString);
           if length(DMTE.DisplayDescrip('prvTGE','CXP301','*',xWhere,'PROV'))>0 then
           begin
              if (DMTE.cdsQry.FieldByName('PROVRETIGV').AsString='S') then
              begin
                 bMayorQueTasa:=True
              end
              else
              begin
               if ((DMTE.cdsQry.FieldByName('CPGRAVAD').AsFloat
                    +DMTE.cdsQry.FieldByName('CPIGV').AsFloat)>=DMTE.xTasaMonto)
                   and (DMTE.cdsQry.FieldByName('CPIGV').AsFloat>0) then
                 begin
                    bMayorQueTasa:=True;
                 end;
              end;
           end;

         //bMayorQueTasa:=True;
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

       if DMTE.RecuperarDatos( 'CXP301' , 'TMONID,TCANJEID,CPNOGRAV,CPGRAVAD,PROVDES,CPTCAMPR,CPTCAMAJ' , xSQL ) then
       begin
         if (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec)  AND
            (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV','DOCMOD=''CXP'' AND DOCID='+QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString),'DOCRETIGV')='S') AND
            (lblSujetoRetencion.visible) then
         begin
           if DMTE.cdsRec.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
           begin
             xMtoRetL:=DMTE.FRound(xMtoRetL+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2);
             xMtoRetE:=DMTE.FRound(xMtoRetE+(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat/DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat),15,2);
           end
           else
           begin
             xMtoRetE:=DMTE.FRound(xMtoRetE+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2);
             xMtoRetL:=DMTE.FRound(xMtoRetL+(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat*DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat),15,2);
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
end;

procedure TFPagoFacturas.dbeNoChqDTRExit(Sender: TObject);
var
  xSql : string;
begin
  xSql:='BANCOID='+quotedstr(dblcBanco.text)+' and '
			 +'CCBCOID='+quotedstr(dblcCCBcoDTR.Text)+' AND ECNOCHQ='+quotedstr(dbeNoChqDTR.text);
//			 +' AND ECESTADO<>''A'' ';

  DMTE.DisplayDescrip('prvTGE','CAJA302','ECNOCHQ,ECESTADO,ECELABO',xsql,'ECNOCHQ');

  if length(trim(DMTE.cdsQry.FieldByName('ECNOCHQ').AsString))>0 then
  begin
     if DMTE.cdsQry.FieldByName('ECESTADO').AsString<>'A' then
     begin
        showmessage('El número de Cheque ya fue Utilizado');
        dbeNoChqDTR.SetFocus;
        Exit;
     end
     else
     begin
        if DMTE.cdsQry.FieldByName('ECELABO').AsString='NULO' then
        begin
           showmessage('El número de Cheque ya fue Utilizado');
           dbeNoChqDTR.SetFocus;
           Exit;
        end;
     end;
  end;
  z2bbtnDTROK2.SetFocus;
end;

procedure TFPagoFacturas.z2bbtnDTROK2Click(Sender: TObject);
begin
  //////////////////////////////////////////////////////////////////////////////
  // Chequea N. de Cheque
  if length(trim(dbeNoChqDTR.text))=0 then
  begin
     showmessage('El número de Cheque es Obligatorio');
     dbeNoChqDTR.SetFocus;
     Exit;
  end
  else
  begin
     if MessageDlg('¿Está seguro del Numero de Cheque?', mtConfirmation,[mbYes, mbNo], 0)=mrYes then
     else
     begin
        dbeNoChqDTR.SetFocus;
        Exit;
     end;
  end;

  //////////////////////////////////////////////////////////////////////////////
  Detraccion;
  //////////////////////////////////////////////////////////////////////////////
  ShowMessage('Grabación OK');
  dbeNoChqDTR.Text:='';
  lblCCBcoDTR.Visible:=False; dblcCCBcoDTR.Visible:=False;
  pnlDetraccion.Visible:=False;
end;

procedure TFPagoFacturas.z2bbtnDTRCancel3Click(Sender: TObject);
begin
   pnlDetraccion.Visible:=False;
end;

procedure TFPagoFacturas.dblcCCBcoDTREnter(Sender: TObject);
begin
   strTmp := dblcCCBcoDTR.Text ;
end;

procedure TFPagoFacturas.dblcCCBcoDTRExit(Sender: TObject);
var
  wTmp : string;
begin
   wTmp:=DMTE.DisplayDescripLocal(DMTE.cdsSQL,'CCBCOID',dblcCCBcoDTR.Text,'CCBCOID') ;
	 if wTmp='' then
	 begin
      ShowMessage('Error : Cuenta Corriente No Valida');
		  dblcccbcoDTR.SetFocus;
		  exit;
	 end;
//   WTMONID:=DMTE.cdsQry.FieldByName('TMONID').AsString;
   XCCBCOID:=DMTE.cdsSQL.FieldByName('CCBCOID').AsString;
   // VHNDEMA
   XCTACONT:=DMTE.cdsSQL.fieldbyname('CTAPRINC').AsString ;
   // END VHNDEMA

   if pnlDetraccion.Visible then
      dbeNoChqDTR.SetFocus;
end;

procedure TFPagoFacturas.bbtnReContaClick(Sender: TObject);
begin
   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString='S' then
      z2bbtnContClick(Self);
end;

procedure TFPagoFacturas.dblcdCCostoEnter(Sender: TObject);
var
   ssql : String;
begin
   ssql:='SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV '
        +'FROM TGE203 WHERE CCOSMOV=''S'' and CCOSACT=''S'' '
        +' and CCOSCIAS LIKE ('+quotedstr('%'+dblcCia.Text+'%')+' ) ';
   DMTE.cdsCCosto.Close;
   DMTE.cdsCCosto.DataRequest(ssql);
   DMTE.cdsCCosto.open;
end;

procedure TFPagoFacturas.bbtnCHClick(Sender: TObject);
begin
  if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString='S' then
  begin
     dbeCH.Text   := DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString;
     pnlCH.Visible:=True;
  end;
end;

procedure TFPagoFacturas.bbtnGraClick(Sender: TObject);
begin
  DMTE.cdsEgrCaja.Edit;
  DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString:=dbeCH.Text;
  DMTE.cdsEgrCaja.Post;
  DMTE.cdsEgrCaja.ApplyUpdates(-1);
  dbeNoChq.Text:=DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString;
  if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString='S' then
     z2bbtnContClick(Self);
  pnlCH.Visible:=False;
end;

procedure TFPagoFacturas.bbtnCanCHClick(Sender: TObject);
begin
  pnlCH.Visible:=False;
end;

procedure TFPagoFacturas.dbeCHExit(Sender: TObject);
var
 xSql : string;
begin
  xSql:='CIAID='+quotedstr(dblcCia.text)+' AND TDIARID='+quotedstr(dblcTDiario.text)+' and '
       +'ECNOCOMP<>'+quotedstr( dbeNoComp.Text )+' and '
			 +'CCBCOID='+quotedstr(dblcCCBco.Text)+' AND ECNOCHQ='+quotedstr(dbeCh.text);

  DMTE.DisplayDescrip('prvTGE','CAJA302','ECNOCHQ,ECESTADO,ECELABO',xsql,'ECNOCHQ');
  if DMTE.cdsQry.FieldByName('ECNOCHQ').AsString<>'' then
  begin
     if DMTE.cdsQry.FieldByName('ECESTADO').AsString<>'A' then
     begin
        showmessage('El número de Cheque ya fue Utilizado');
        dbeCh.Text := '';
        dbeCh.SetFocus;
     end
     else
     begin
        if DMTE.cdsQry.FieldByName('ECELABO').AsString='NULO' then
        begin
           showmessage('El número de Cheque ya fue Utilizado');
           dbeCh.Text := '';
           dbeCh.SetFocus;
        end
     end;
  end;
end;

end.

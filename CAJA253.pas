unit Caja253;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient,
  ComCtrls, Tabnotbk, CAJADM, Menus, Wwlocate, wwDialog, Wwfltdlg, wwidlg,
  oaContabiliza, Wwkeycb, ppBands, ppClass, ppPrnabl, ppCtrls, ppDB, Variants,
  ppProd, ppReport, ppComm, ppRelatv, ppCache, ppDBPipe, ppEndUsr, ppVar,
  oaVariables;//, ppEndUsr;

type
  TFFondoFijo = class(TForm)
    pnlCabecera1: TPanel;
    lblCia: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    pnlCabecera2: TPanel;
    lblProvDes: TLabel;
    z2bbtnCancel: TBitBtn;
    z2bbtnOK: TBitBtn;
    dbeGiradoA: TwwDBEdit;
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
    dbeImporte: TwwDBEdit;
    lblImporte: TLabel;
    dbeNoComp: TwwDBEdit;
    dbeLote: TwwDBEdit;
    lblLote: TLabel;
    dbeGlosa: TwwDBEdit;
    lblGlosa: TLabel;
    lblConcepto: TLabel;
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
    dblcdCnp: TwwDBLookupComboDlg;
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
    lblTCambio: TLabel;
    lblBanco: TLabel;
    lblCCBco: TLabel;
    lblNoChq: TLabel;
    lblFormPago: TLabel;
    dbeTCambio: TwwDBEdit;
    dblcBanco: TwwDBLookupCombo;
    dblcCCBco: TwwDBLookupCombo;
    dbeNoChq: TwwDBEdit;
    dblcFormPago: TwwDBLookupCombo;
    edtFormPago: TEdit;
    edtBanco: TEdit;
    lblCuenta: TLabel;
    lblTMon: TLabel;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    Z2bbtnEmiChq: TBitBtn;
    dbdtpFEmis: TwwDBDateTimePicker;
		Label24: TLabel;
    Label6: TLabel;
    dblcTDoc2: TwwDBLookupCombo;
    edtTDoc2: TEdit;
    Label4: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    dblcdCnp2: TwwDBLookupComboDlg;
    edtCnp2: TEdit;
    dblcClaseDet: TwwDBLookupCombo;
    edtClaseDet: TEdit;
    dblcdAuxDet: TwwDBLookupComboDlg;
    dbeAuxDet: TwwDBEdit;
    Label20: TLabel;
    dblcdFEfec: TwwDBLookupComboDlg;
    dbeFEfec: TwwDBEdit;
    edtCuenta: TwwDBLookupComboDlg;
    lkdCxP: TwwLookupDialog;
    pnlSumatoria: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    dbeTotalMN: TwwDBEdit;
    dbeTotalME: TwwDBEdit;
    SpeedButton1: TSpeedButton;
    Label23: TLabel;
    dblcClase: TwwDBLookupCombo;
    edtClase: TEdit;
    dblcdAux: TwwDBLookupComboDlg;
    lblProvRuc: TLabel;
    edtAuxRuc: TEdit;
    Label18: TLabel;
    dbeTC: TwwDBEdit;
    dbeMPL: TwwDBEdit;
    dbeMPE: TwwDBEdit;
    pnlBusca: TPanel;
    Label27: TLabel;
    isBusca: TwwIncrementalSearch;
    Z2bbtnRetencion: TBitBtn;
    ppdbRetencion: TppDBPipeline;
    pprRetencion: TppReport;
    Button1: TButton;
    ppDesigner1: TppDesigner;
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
    dbeFFijo: TwwDBEdit;
    Label5: TLabel;
    Buscar1: TBitBtn;
    Z2bbtnCajaChica: TBitBtn;
    ppdbCajaChica: TppDBPipeline;
    pprCajaChica: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    pplblCiaDes: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLine1: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText25: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel13: TppLabel;
    ppDBText24: TppDBText;
    ppLabel17: TppLabel;
    pplblMoneda: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText21: TppDBText;
    ppDBText26: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBCalc4: TppDBCalc;
    ppLabel11: TppLabel;
    dblcCheques: TwwDBLookupComboDlg;
    rgJustif: TRadioGroup;
    dbeDH: TwwDBEdit;
    procedure IniciaPanel;
    procedure LimpiaFiltros;
    procedure dblcCiaExit(Sender: TObject);
    procedure z2bbtnCancelClick(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dblcTMonChange(Sender: TObject);
    procedure dblcFormPagoChange(Sender: TObject);
    procedure dblcBancoChange(Sender: TObject);
    procedure dblcCCBcoChange(Sender: TObject);
    procedure z2bbtnCalcClick(Sender: TObject);
    procedure dblcTDocChange(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
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
    procedure dblcTMonExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcCCBcoExit(Sender: TObject);
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
    procedure dbgOtrosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgDocPagoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbeLoteExit(Sender: TObject);
    procedure dbeGiradoAChange(Sender: TObject);
    procedure dbeTCambioChange(Sender: TObject);
    procedure dbeImporteChange(Sender: TObject);
    procedure dbeNoDocChange(Sender: TObject);
    procedure dbeNoChqChange(Sender: TObject);
    procedure dbeLoteChange(Sender: TObject);
    procedure dbeGlosaChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);
    procedure dbgDocPagoCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure dbgOtrosCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure dblcdCnpExit(Sender: TObject);

    procedure InhabilitarPaneles;
    procedure EdiTarRegistros;
    procedure AdicionarRegistros;
    procedure LiberarFiltrosRegistroEgresos;
    procedure dbgOtrosDblClick(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeNoChqChange2(Sender: TObject);
    procedure dbeTCambioChange2(Sender: TObject);
    procedure dblcBancoExit2(Sender: TObject);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Z2bbtnEmiChqClick(Sender: TObject);
    procedure dbdtpFEmisEnter(Sender: TObject);
    procedure dbdtpFEmisExit(Sender: TObject);
    procedure dbeTCambioEnter(Sender: TObject);
    procedure dbeImporteEnter(Sender: TObject);
    procedure dbeImporteExit(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure dblcTDoc2Exit2(Sender: TObject);
    procedure dblcClaseDetExit(Sender: TObject);
    procedure dblcdAuxExit2(Sender: TObject);
    procedure dblcdCnp2Exit2(Sender: TObject);
    procedure wwDBEdit1Change22(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblcdFEfecEnter(Sender: TObject);
    procedure dblcdFEfecExit(Sender: TObject);
    procedure Buscar1Click(Sender: TObject);
    procedure lkdCxPCloseDialog(Dialog: TwwLookupDlg);
    procedure lkdCxPInitDialog(Dialog: TwwLookupDlg);
    procedure z2bbtnCancel3Click(Sender: TObject);
    procedure dblcCCBcoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure z2bbtnOK2Click(Sender: TObject);
    procedure dbeNoRegExit(Sender: TObject);
    procedure dbeImporte2Exit(Sender: TObject);
    procedure dblcTMon2Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dblcdAuxExit(Sender: TObject);
    procedure dbeTCExit(Sender: TObject);
    procedure dbeMPLExit(Sender: TObject);
    procedure dbeMPEExit(Sender: TObject);
    procedure dbgPendientesTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure isBuscaExit(Sender: TObject);
    procedure dblcdAuxDetEnter(Sender: TObject);
    procedure Z2bbtnRetencionClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dblcClaseExit(Sender: TObject);
    procedure Z2bbtChqVouchClick(Sender: TObject);
    procedure pprChqVouchPrintingComplete(Sender: TObject);
    procedure Z2bbtnCajaChicaClick(Sender: TObject);
    procedure dbeGiradoAExit(Sender: TObject);
    procedure rgJustifClick(Sender: TObject);
    procedure dblcChequesExit(Sender: TObject);
    procedure dblcChequesChange(Sender: TObject);
    procedure dbeImporteKeyPress(Sender: TObject; var Key: Char);
    procedure dbeImporte2KeyPress(Sender: TObject; var Key: Char);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    xNReg : Integer;
    xRUCCIA : string; // para el ruc de la compa�ia
    cf1: TControlFoco;
    strTmp: String;
    A1 : Array of Integer ;
    A2 : Array Of TNotifyEvent ;
    A2digitos ,A4digitos : Array of TWinControl ;
    cdsConceptoC1 : TwwClientDataset ;
    xRETTOTMN, xRETTOTME : Double;
    //
    xTC: Double;
    cdsFiltro   : TwwClientDataset;
    xGraboNuevo : Boolean ;
    wFechaCierre: TDatetime;
    wFrecu      : Integer;
    xMTOCNTLOC  : Currency;
    xMTOCNTEXT  : Currency;
    xMONID_PROV : String;
    xDebeT      : Double;
    xHabeT      : Double;
    xDebeTD     : Double;
    xHabeTD     : Double;
    //** 04/06/2001-pjsv, para el nuevo dato (CCBCOVOUCH - TGE106 y CAJA302)
    xVoucher : String;
    //**
    { Private declarations }
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
    procedure ActivaFiltro(xName:string);
    procedure CambiaEstado(xName:char);
    procedure Contab_Haber;
    procedure Contab_RegCxP;
    procedure Contab_DocPago;
    procedure Contab_DifCamRegCxP;
    procedure Contab_DifCamRegCxP2;
    procedure Contab_DifCamDocPago;
    procedure Contab_DifCamDocPago2;
    procedure Contab_DocPago_Retencion_Debe(xRL,xRE,xRO:double);
    procedure Contab_DocPago_Retencion_Haber(xRL,xRE,xRO:double);
    procedure Contab_DifCamDocPago_Retencion( xRLH, xRLD : Double);
    function  ValidaCampo:Boolean;
    procedure ActSaldosMovCxP;
    procedure ActMovCxP;
    procedure RetornaSaldosMovCxP;
    procedure RetornaSaldosMovCxPPagados;
    procedure ConsisCancela(var xconsis:Boolean);
    procedure ActPnlBotones;
    procedure ActDetCxP ;
    procedure ActDetCaja ;
    procedure ActualizaFiltro ;
    procedure ActualizaDetCanje ;
    procedure AsientoDifTotal;
    function CalculaRetencionIGVBancos:boolean;
    procedure InsertaEnCNT320Bancos;
    procedure GrabaNumeroRetencionBancos;
    procedure InsertaLETRASEnCNT320;
    procedure GeneraRegChqVouch;
    procedure GrabaCabeceraDeComprobante;
    procedure GrabaCompNoProv;
    procedure Grid1;
  public
    { Public declarations }
    wCptoGan  ,
    wCptoPer  ,
    wCtaGan   ,
    wCtaPer   : String ;
    wCCosDif  : String ;
    wExit     : boolean;
    procedure Adiciona ;
    procedure Edita (Comp : structComprobante;cds : Twwclientdataset);
    procedure AsignaCDSFiltro(cds : TwwClientDataset) ;
    procedure Contabiliza;
    procedure GeneraRepCajaChica;
    procedure ActIngNoProv;
  end;

var
   FFondoFijo: TFFondoFijo;
   wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado , wbChq,
   wbcancel2: Boolean;
   wCiaRetIGV, wModifica: Boolean;
   wBcoTipCta  : string;

implementation

uses CAJAUTIL, oaTE2000, Caja290;

{$R *.DFM}


{******************************************************************************}
procedure TFFondoFijo.IniciaDatos;
var
    xSQL : String;
begin

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
	 dblcCia.Text      := '';   // C�digo de Compa��a
   edtCia.Text       := '';   // Descripci�n de la Compa��a
   edtPeriodo.Text   := '';   // Periodo
   dblcTDiario.Text  := '';   // Tipo de Diario
   edtTDiario.Text   := '';   // Descripci�n del T.Diario
   dbeNoComp.Text    := '';   // Voucher
   dbeGiradoA.Text   := '';    // Pago Girado A ....
   dblcTMon.Text     := '';   // Tipo de Moneda
   edtTMon.Enabled   := False;
   edtTMon.Text      := '';   // Descripci�n de la Moneda
   dbeTCambio.Text   := '';   // Tipo de Cambio
	 dbeImporte.Text   := '';   // Monto a pagar
	 dblcBanco.Text    := '';   // C�digo de Banco
   edtBanco.Enabled  := False;
   edtBanco.Text     := '';   // Descripci�n de Banco
   dblcCCBco.Enabled := False;
   dblcCCBco.Text    := '';   // Cuenta Corriente del Banco
	 edtCuenta.Enabled := False;
   edtCuenta.Text    := '';   // Descripci�n de la Cuenta Contable Principal
   dblcFormPago.Enabled := False;   // Forma de Pago
   dblcFormPago.Text := '';   // Forma de Pago
   edtFormPago.Enabled  := False;
   edtFormPago.Text  := '';   // descripci�n de forma de pago
   dbeNoChq.Enabled  := False;
   dbeNoChq.Text     := '';   // Cheque
   dbeLote.Text      := '';   // Lote
   dblcdCnp.Text     := '';   // Concepto
   dbeGlosa.Text     := '';   // Glosa
   dbeGlosa.Text     := '';   // Glosa
   dbdtpFEmis.Date   := 0 ;
   lblEstado.Caption := '';   //Inicializar el Estado
   dbeFEfec.Text     := '' ;
   wModifica         := False;

   dbgOtros.ColumnByName('DEMTOLOC').FooterValue   := '';
   dbgOtros.ColumnByName('DEMTOEXT').FooterValue   := '';

   dbgDocPago.ColumnByName('CPSALLOC').FooterValue := '';
   dbgDocPago.ColumnByName('CPSALEXT').FooterValue := '';
   dbgDocPago.ColumnByName('CCPMOLOC').FooterValue := '';
   dbgDocPago.ColumnByName('CCPMOEXT').FooterValue := '';

   LimpiaFiltros;

   // Documentos Pendientes
   DMTE.cdsMovCxP.Close   ;
   DMTE.cdsMovCxP.DataRequest( 'SELECT * FROM CXP301 WHERE CIAID=''''');
   DMTE.cdsMovCxP.Open;

   // Estableciendo el filtro para que el detalle del grid aparezca vacio

   // vhn 22/01/2001
   xSQL:='Select * from CAJA303 '
        +'Where CIAID='''' and ECANOMM='''' and '
        +      'TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsDocPago.Close;
   DMTE.cdsDocPago.DataRequest( xSQL );
   DMTE.cdsDocPago.Open;

    z2bbtnOkCab.Enabled := True ;
end;

{******************************************************************************}
{******************** PROCEDIMIENTOS DE LOS COMPONENTES ***********************}
{******************************************************************************}

{******************************************************************************}
procedure TFFondoFijo.dblcCiaExit(Sender: TObject);
begin
   edtCia.text:= DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIADES') ;
   wCiaRetIGV := (DMTE.cdsCia.FieldByName('CIARETIGV').AsString='S');

   if edtCia.Text='' then begin
      ShowMessage('Error : Compa��a no V�lida');
      dblcCia.SetFocus;
      Exit;
   end;

   DMTE.abreCuentas(dblcCia.text) ;
end;
{******************************************************************************}
procedure TFFondoFijo.dbdtpFCompExit(Sender: TObject);
begin
   if dblcCia.Focused   then Exit;
   if dblcBanco.Focused then Exit;
   if dblcCCBco.Focused then Exit;

   If wBcoTipCta='B' Then //Busca en el CAJA402
    begin
     if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, dblcCCBco.Text, dbdtpFComp.Date ) then
      begin
       dbdtpFComp.SetFocus;
       Exit;
      end;
    end
   Else //Busca en el CAJA310
    begin
     if not DiaAperturado(dblcCia.Text, dbdtpFComp.Date, dblcBanco.Text) then
      begin
       dbdtpFComp.SetFocus;
       Exit;
      end;
    end;

{   if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, dblcCCBco.text, dbdtpFComp.Date ) then
   begin
     Showmessage('Error : Mes de Fecha Fue Cerrado. Verificar...');
     dbdtpFComp.SetFocus;
     Exit;
   end;

   if not DiaAperturado(dblcCia.text,dbdtpFComp.Date,dblcBanco.text) then
   Begin
     dbdtpFComp.setfocus;
     exit;
   End;}

   if dbdtpFComp.Date = 0 then
   begin
      ShowMessage('Fecha de Comprobante Errada');
      dbdtpFComp.SetFocus;
   end
   else
   begin
      if wFechaCierre <> 0 then
         if (TwwDBDateTimePicker(Sender).date <= wFechaCierre )
             or (TwwDBDateTimePicker(Sender).date > (wFechaCierre + wFrecu) ) then
         begin
             TwwDBDateTimePicker(Sender).SetFocus ;
             Showmessage('Ingrese Fecha dentro del Rango'+#13+
                         'Fecha de Cierre  : ' + datetimetostr(wfechacierre) + #13+
                         'Frecuencia       : ' + inttostr(wFrecu) ) ;
             Exit ;
         end ;

      edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
      dbdtpFEmis.date := dbdtpFComp.date;
   end;
end;
{******************************************************************************}
procedure TFFondoFijo.dblcTDiarioExit(Sender: TObject);
var
   xWhere : String;
begin
   edtTDiario.Text := DMTE.DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', 'TDIARID ='+QuotedStr(dblcTDiario.Text), 'TDIARDES');
   if Trim(edtTDiario.Text) <> '' then
    if Trim(edtTDiario.Text) <> '' then
     begin
      xWhere := 'CIAID='+''''+dblcCia.Text+''''+' AND ECANOMM='+
                ''''+edtPeriodo.Text+''''+' AND TDIARID='+''''+
                dblcTDiario.Text+'''';
      dbeNoComp.Text := DMTE.StrZero(DMTE.UltimoNum('prvCaja', 'CAJA302', 'ECNOCOMP', xWhere), 10);
     end ;
end;
{******************************************************************************}
{******************************************************************************}
procedure TFFondoFijo.dblcTMonChange(Sender: TObject);
var
   xWhere : string;
begin
   xWhere:='TMONID='+''''+dblcTMon.Text+'''';
   edtTMon.Text:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
   if length(edtTMon.Text)>0 then
    begin
     xWhere := 'TMONID='+''''+DMTE.wTMonExt+''''
              +' AND FECHA='+''''+datetostr(dbdtpFComp.Date)+'''';
     if length(DMTE.DisplayDescrip('prvTGE','TGE107','TCAMVOV',xWhere,'TMONID'))>0 then
      dbeTCambio.Text := DMTE.cdsQry.FieldByName('TCAMVOV').Value;
    end;
   wModifica:=True;
end;
{******************************************************************************}
procedure TFFondoFijo.dblcTMonExit(Sender: TObject);
var
   xWhere :String;
begin
   if z2bbtnCancel.Focused then exit;

   edtTMon.text:= DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMon.Text,'TMONDES') ;

   if edtTMon.Text='' then begin
      edtTmon.text   :='';
      dbeTCambio.Text:='';
      dblcTMon.Text  :='';
      ShowMessage('Error : Moneda no V�lida');
      dblcTMon.SetFocus;
      Exit;
   end;

//** 2002/04/29 - pjsv
//   xWhere:='FECHA='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date)+''')';
//   if length(DMTE.DisplayDescrip('prvTGE','TGE107','TMONID, TCAMVOV',xWhere,'TMONID'))>0 then
//      dbeTCambio.Text:=DMTE.cdsqry.FieldByName('TCAMVOV').AsString
//   else
//      showmessage('Error : Tipo de Cambio No Registrado');
end;

{******************************************************************************}
procedure TFFondoFijo.dblcTDocChange(Sender: TObject);
begin
end;

{******************************************************************************}
procedure TFFondoFijo.dblcTDocExit(Sender: TObject);
begin
end;

{******************************************************************************}
procedure TFFondoFijo.dblcBancoChange(Sender: TObject);
var xWhere:string;
begin
   DblcCCBco.Text:='';
   xWhere:='BANCOID='+''''+dblcBanco.Text+'''';
   edtBanco.Text:=DMTE.DisplayDescrip('prvTGE','TGE105','BANCOMON, BCOTIPCTA, CUENTAID',xWhere,'BANCONOM');
   if length(edtBanco.Text)>0 then
   begin
       if DMTE.cdsqry.FieldByName('BCOTIPCTA').Value='C' then
       begin //Si es CAJA
          dblcCCBco.Enabled:=False;
          dbeNoChq.Enabled :=False;
          dblcCCBco.Text:='';
          edtCuenta.Text:=DMTE.cdsqry.FieldByName('CUENTAID').Value; //Se toma de la tabla Bancos
          dbeNoChq.Text :='';
          dblcFormPago.Enabled:=False;
          dblcFormPago.Text:='01';  //'01'= Efectivo
       end
       else
       begin  //Si es BANCO
          dblcCCBco.Enabled:=True;   //Habilitar CtaCte
          edtCuenta.Text   :='';     //La Cuenta se tomara posteriormente por medio de la CtaCte
          DMTE.cdsCCBco.Filtered:=False;
          DMTE.cdsCCBco.Filter:='';   //Filtrar la lista de CtaCte por Banco
          DMTE.cdsCCBco.Filter:='BANCOID='+''''+dblcBanco.Text+'''';
          DMTE.cdsCCBco.Filtered:=True;
          dblcCCBco.Enabled:=true;
          dblcFormPago.Enabled:=True;
       end;
   end;
   wModifica:=True;
end;

{******************************************************************************}
procedure TFFondoFijo.dblcBancoExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then
      exit;

   if length(edtBanco.Text)=0 then
      dblcBanco.Text:='';
end;

{******************************************************************************}
procedure TFFondoFijo.dblcCCBcoChange(Sender: TObject);
begin
end;

{******************************************************************************}
procedure TFFondoFijo.dblcCCBcoExit(Sender: TObject);
var
   Tmp : String ;
begin

	if dblcCia.Focused   then Exit;
	if dblcBanco.Focused then Exit;

   tmp:=DMTE.DisplayDescripLocal(DMTE.cdsCCBco,'CCBCOID',dblcCCBco.Text,'CCBCOID') ;

	if Tmp='' then
	begin
      //edtCCBco.Text := '' ;
      edtCuenta.Text:= '' ;
      dblcdCnp.Text := '' ;
      dbeGlosa.Text := '' ;
      ShowMessage('Error : Cuenta Corriente No V�lida');
		dblcccbco.SetFocus;
		exit;
	end;

	dblcTmon.Text := DMTE.cdsCCBco.FieldByName('TMONID').AsString ;
	edtTMon.Text  := DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMon.text,'TMONDES') ;
	dbeNOChq.Text := '' ;

   //edtCCBco.Text := DMTE.cdsCCBco.FieldByName('CCBCODES').AsString ;
   edtCuenta.Text:= DMTE.cdsCCBco.FieldByName('CTAPRINC').AsString ;
   dblcdCnp.Text := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID','CPTOID='+quotedstr(DMTE.cdsCCBco.FieldByName('CPTOID').AsString),'CPTOID');
   dbeGlosa.Text := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTODES','CPTOID='+quotedstr(dblcCCBco.text),'CPTODES');  //  DMTE.cdsCCBcoLKGLOSA.AsString ;
   xVoucher      := DMTE.cdsCCBco.FieldByName('CCBCOVOUCH').AsString;
           //**
   If DMTE.wModo = 'A' then
   begin
      dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco.text)+' AND CCBCOID='+quotedstr(dblcCCBco.text),'CCBCOVOUCH');
      dblcTDiario.OnExit(dblcTDiario);
   end;

   if DMTE.cdsFormPago.RecordCount = 1 then
      dblcformpago.Enabled := false
   else
      dblcformpago.Enabled := true;

   wModifica:=True;
end;

{******************************************************************************}
procedure TFFondoFijo.dblcFormPagoChange(Sender: TObject);
var xWhere:string;
begin
   Exit;
   xWhere:='FPAGOID='+''''+dblcFormPago.Text+'''';
   edtFormPago.Text:=DMTE.DisplayDescrip('prvTGE','TGE112','FPAGODES, FPAGOBCO',xWhere,'FPAGODES');

   if length(edtFormPago.Text)>0 then
   begin
      if DMTE.cdsqry.FieldByName('FPagoBco').Value='S' then
         dbeNoChq.Enabled :=True
      else
      begin
         dbeNoChq.Enabled :=False;
         dbeNoChq.Text :='';
      end;
   end;
   wModifica:=True;
end;

{******************************************************************************}
{******************************************************************************}
procedure TFFondoFijo.z2bbtnOKClick(Sender: TObject);
var
    xWhere, aux ,xFiltro: String;
    xDocId, xNroFondo : String;
    xFlag : Boolean ;
begin
	 // consistencia de Datos
	 ValidaCabecera2 ;
   // VALIDA LA CUENTA
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,'',edtCuenta.text)) and (dblcTMon.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+edtCuenta.text+' Se registra s�lo en Moneda Extranjera.');
   end;

   // VALIDA LA CUENTA DEL CONCEPTO
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,dblcdCnp.text,'')) and (dblcTMon.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+DMTE.cdsQry.FieldByName('CUENTAID').AsString+' del Concepto '+dblcdCnp.text+' Se registra s�lo en Moneda Extranjera.');
   end;

    //Asignacion de Variables
   if DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value ='X' then
    begin
      xDocId := '';
      xNroFondo := '';
      xWhere := ' DOCTIPREG=''FF'' AND DOCMOD=''CAJA'' ';
      xDocId := DMTE.DisplayDescrip('prvTGE','TGE110','DOCID',xWhere,'DOCID');

      xWhere := 'CIAID='+''''+dblcCia.Text+''''+' AND DOCID='+''''+xDocId+'''';
//      xNroFondo:=DMTE.UltimoNum('prvCaja','CAJA302','ECNODOC',xWhere);
      xNroFondo := DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      xNroFondo := DMTE.StrZero(xNroFondo, DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').DisplayWidth);
      dbeFFijo.Text := xNroFondo;
     end
    else
     begin
      xDocId    := DMTE.cdsEgrCaja.FieldByName('DOCID').AsString;
      xNroFondo := DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString;
     end;
    //*

	 // En este punto ya se ha probado todas las consistencias y ya se puede grabar

	 // Actualizamos el Client Data Set de Egr.Caja (CAJA302)

	 with DMTE do
	 begin
		 cdsEgrCaja.Edit;
		 cdsEgrCaja.FieldByName('CIAID').Value   :=dblcCia.Text;
		 cdsEgrCaja.FieldByName('TDIARID').Value :=dblcTDiario.Text;
		 cdsEgrCaja.FieldByName('ECANOMM').Value :=edtPeriodo.Text;
		 cdsEgrCaja.FieldByName('ECNOCOMP').Value:=dbeNoComp.Text;

		 cdsEgrCaja.FieldByName('DOCID').Value   := xDocId;
		 cdsEgrCaja.FieldByName('ECNODOC').Value:= xNroFondo;

		 cdsEgrCaja.FieldByName('CLAUXID').Value :=dblcClase.Text;
		 cdsEgrCaja.FieldByName('PROV').Value    :=dblcdAux.Text;
		 cdsEgrCaja.FieldByName('PROVRUC').Value :=edtAuxRUC.Text;
		 cdsEgrCaja.FieldByName('ECGIRA').Value  :=dbeGiradoA.Text;
       if rgJustif.ItemIndex=0 then //Reembolso
       begin
   		 cdsEgrCaja.FieldByName('ECNOCHQ').AsString  := dbeNoChq.Text;
   		 cdsEgrCaja.FieldByName('FDOFIJJUST').Value  :='N'
       end
       else
          if rgJustif.ItemIndex=1 then//Justificacion d Reembolso
          begin
       		 cdsEgrCaja.FieldByName('ECNOCHQ').AsString  := dblcCheques.Text;
         	 cdsEgrCaja.FieldByName('FDOFIJJUST').Value  :='S';
          end;

		 cdsEgrCaja.FieldByName('ECFCOMP').Value :=dbdtpFComp.Date;
		 cdsEgrCaja.FieldByName('FPAGOID').Value :=dblcFormPago.Text;
		 cdsEgrCaja.FieldByName('EQUIID').AsString := EquivFPago( dblcFormPago.Text ,dblcBanco.Text) ;
		 cdsEgrCaja.fieldBYName('ECFEMICH').AsDateTime := dbdtpFEmis.Date ;
		 cdsEgrCaja.FieldByName('TMONID').Value  :=dblcTMon.Text;
		 cdsEgrCaja.FieldByName('ECTCAMB').Value :=strtofloat(dbeTCambio.Text);
		 cdsEgrCaja.FieldByName('ECMTOORI').Value:=strtofloat(dbeImporte.Text);
		 //** 05/06/2001 - pjsv
		 cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString := xVoucher;
		 //**
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
//		 cdsEgrCaja.FieldByName('ECNOCHQ').Value :=dbeNoChq.Text;
		 cdsEgrCaja.FieldByName('ECGIRA').Value  :=dbeGiradoA.Text;
		 cdsEgrCaja.FieldByName('CPTOID').Value  :=dblcdCnp.Text;
		 cdsEgrCaja.FieldByName('CUENTAID').Value:=edtCuenta.Text;
		 cdsEgrCaja.FieldByName('ECGLOSA').Value :=dbeGlosa.Text;
		 cdsEgrCaja.FieldByName('ECLOTE').Value  :=dbeLote.Text;
		 cdsEgrCaja.FieldByName('ECESTADO').Value :='I';

		 xWhere:='FECHA=' +DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date)+''')' ;
		 aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');

		 //wmc2808
		 if trim(dblcdFEfec.Text) = '' then
				cdsEgrCaja.FieldByName('FLUEID').Clear
		 else
				cdsEgrCaja.FieldByName('FLUEID').AsString := trim(dblcdFEfec.Text) ;
		 //
		 cdsEgrCaja.FieldByName('ECANO').Value  := cdsqry.FieldByName('FECANO').Value;
		 cdsEgrCaja.FieldByName('ECMM').Value   := cdsqry.FieldByName('FECMES').Value;
		 cdsEgrCaja.FieldByName('ECDD').Value   := cdsqry.FieldByName('FECDIA').Value;
		 cdsEgrCaja.FieldByName('ECSS').Value   := cdsqry.FieldByName('FECSS').Value;
		 cdsEgrCaja.FieldByName('ECSEM').Value  := cdsqry.FieldByName('FECSEM').Value;
		 cdsEgrCaja.FieldByName('ECTRI').Value  := cdsqry.FieldByName('FECTRIM').Value;
		 cdsEgrCaja.FieldByName('ECAASS').Value := cdsqry.FieldByName('FECAASS').Value;
		 cdsEgrCaja.FieldByName('ECAASem').Value:= cdsqry.FieldByName('FECAASEM').Value;
		 cdsEgrCaja.FieldByName('ECAATri').Value:= cdsqry.FieldByName('FECAATRI').Value;
		 cdsEgrCaja.FieldByName('EC_PROCE').Value:='F';
		 cdsEgrCaja.FieldByName('EC_IE').Value   :='E';
	 end;

	 // Actualizamos el Detalle mostrado en el grid ante posibles cambios del
	 // Tipo de Cambio
	 if not DMTE.cdsRegCxP.Eof then
	 begin   //Hay documentos en el detalle
			DMTE.cdsRegCxP.DisableControls;
			DMTE.cdsRegCxP.First;
			While not DMTE.cdsRegCxP.Eof do
			Begin
			   DMTE.cdsRegCxP.Edit;
            DMTE.cdsRegCxP.FieldByName('DETCPAG').Value  := strtofloat(dbeTCambio.Text);
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
        DMTE.cdsRegCxP.Next;
      end;
      DMTE.cdsRegCxP.First ;
      DMTE.cdsRegCxP.EnableControls;
   end;
   //Actualizamos el Footer
   z2bbtnSumatClick(sender);
//*****************************
   if not DMTE.cdsMovCxP.Active then
      xFlag := True
   else
      if DMTE.cdsMovCxP.RecordCount = 0 then
         xFlag := true
      else
         xFlag := false ;

//      if DMTE.cdsmovcxp.RecordCount = 0 then
      if xFlag then
      begin
         //Comprobar si hay mov seleccionados con otro proveedor
         if xFlag then
         begin

             xWhere :='CIAID = ''' +dblcCia.Text  + ''' AND ' +
                      'CLAUXID = '+Quotedstr(dblcClase.Text) +' AND '+
                      'PROV = '+Quotedstr(dblcdAux.Text) +' AND '+
                      'CPESTADO =' + '''' + 'P' + ''' ' ;

             xFiltro:=' (((CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR '+
                      '   ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) '  ;

             DMTE.cdsMovCxP.Close;
             DMTE.cdsMovCxP.Datarequest('SELECT * FROM CXP301 WHERE ' + xWhere ) ;
             DMTE.cdsMovCxP.Open;

             DMTE.cdsMovCxP.Filter   := xFiltro ;

             DMTE.cdsMovCxP.Filtered := True ;

            if DMTE.cdsMovCxP.RecordCount = 0 then
            begin
               ShowMessage('No hay Ctas x Pagar Pendientes '+#13+'para este Responsable de Fondo Fijo') ;
               //exit;
            end;
            DMTE.cdsMovCxP.IndexFieldNames := 'CLAUXID;PROV;CPNODOC';
         end ;
      end ;
//*****************************
   // Estado de los componentes
   pnlCabecera1.enabled  := False;
   pnlCabecera2.enabled  := False;
   pnlDetalle.enabled    := True;
   pnlBotones.Enabled    := True;
   ActPnlBotones;

   z2bbtnOk.Enabled        := False;
   z2bbtnCancel.Enabled    := False;
end;

{******************************************************************************}
procedure TFFondoFijo.z2bbtnCancelClick(Sender: TObject);
begin
   DMTE.cdsEgrCaja.CancelUpdates;
   DMTE.cdsRegCxP.CancelUpdates;
   DMTE.cdsDocPago.CancelUpdates;
   DMTE.cdsMovCxP.CancelUpdates;
{0505
   IniciaDatos;
   z2bbtnokcab.Enabled:=true;
}
   Adiciona ;
   AdicIniciadatos ;
  //** 08/06/2001 - pjsv
   		dbeLote.text := '000';
  //**
end;

{******************************************************************************}
procedure TFFondoFijo.z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('calc.exe',1);  //Activa la calculadora del Windows
end;

{******************************************************************************}
procedure TFFondoFijo.z2bbtnSumatDocPagoClick(Sender: TObject);
Var
   xTSalLoc, xTSalExt, xTPagLoc, xTPagExt : double;
   xRegAct : TBookMark;
begin
   with DMTE do
   begin
   // Totales de Documentos pagados
      cdsDocPago.DisableControls;
      xRegAct := cdsDocPago.GetBookmark;
      xTSalLoc := 0; xTSalExt := 0; xTPagLoc := 0; xTPagExt := 0;
      cdsDocPago.First ;
      while not cdsDocPago.Eof do
      begin
         xTSalLoc := xTSalLoc + cdsDocPago.FieldByName('DESALLOC').Value;
         xTSalExt := xTSalExt + cdsDocPago.FieldByName('DESALEXT').Value;
         xTPagLoc := xTPagLoc + cdsDocPago.FieldByName('DEMTOLOC').Value;
         xTPagExt := xTPagExt + cdsDocPago.FieldByName('DEMTOEXT').Value;
         cdsDocPago.Next;
      end;


      dbgDocPago.ColumnByName('DESALLOC').FooterValue := floattostrf(xTSalLoc, ffNumber, 10, 2);
      dbgDocPago.ColumnByName('DESALEXT').FooterValue := floattostrf(xTSalExt, ffNumber, 10, 2);
      dbgDocPago.ColumnByName('DEMTOLOC').FooterValue := floattostrf(xTPagLoc, ffNumber, 10, 2);
      dbgDocPago.ColumnByName('DEMTOEXT').FooterValue := floattostrf(xTPagExt, ffNumber, 10, 2);
      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);
      cdsDocPago.EnableControls;
   end;
end;
{******************************************************************************}
procedure TFFondoFijo.z2bbtnSubeClick(Sender: TObject);
begin
   DMTE.cdsEgrCaja.Edit;
   DMTE.cdsRegCxP.Edit;

   pnlCabecera2.Enabled:= True;
   pnlDetalle.Enabled  := False;
   pnlBotones.Enabled  := False;

   z2bbtnOk.Enabled      := True;
   z2bbtnCancel.Enabled  := True;

   // Desactivamos los botones
//   z2bbtnSumat.Enabled     := False;
   z2bbtnCont.Enabled      := False;
   z2bbtnNuevo.Enabled     := False;
   z2bbtnImprime.Enabled   := False;
   z2bbtnSube.Enabled      := False;
   z2bbtnGraba.Enabled     := False;
   z2bbtnCancelado.Enabled := False;
   z2bbtnCancel2.Enabled   := False;
   z2bbtnAnula.Enabled     := False;
end;
{******************************************************************************}
procedure TFFondoFijo.z2bbtnCancel2Click(Sender: TObject);
begin
   if MessageDlg('�Anular los cambios?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin
      DMTE.cdsEgrCaja.CancelUpdates;
      DMTE.cdsRegCxP.CancelUpdates;
      DMTE.cdsMovCxP.CancelUpdates;
      DMTE.cdsDocPago.CancelUpdates;
      IniciaDatos;
      //** 05/06/2001 - pjsv, para grabar el nuevo voucher
      xVoucher := '';
      //**
   end;
end;

{******************************************************************************}
procedure TFFondoFijo.z2bbtnNuevoClick(Sender: TObject);
begin
   if DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value ='I' then
   begin
      if wModifica then
      begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      end;
      if MessageDlg('�Nuevo Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin
//0805         IniciaDatos;
         Adiciona ;
         AdicIniciadatos ;
         z2bbtnSumatDocPagoClick(Nil);
         dbeTotalMN.text := '0';
         dbeTotalME.text := '0'
      end;
   end
   else
   begin
//0805      IniciaDatos;
      Adiciona ;
      AdicIniciadatos ;
      z2bbtnSumatDocPagoClick(Nil);
      dbeTotalMN.text := '0';
      dbeTotalME.text := '0'      
   end;
  //** 05/06/2001 - pjsv, para grabar el nuevo voucher
  xVoucher := '';
  //**
end;
{******************************************************************************}
procedure TFFondoFijo.z2bbtnGrabaClick(Sender: TObject);
var
   xSQL : String;
begin
   if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='I' then
    begin
     //if MessageDlg('�Grabar?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
     begin
      ActSaldosMovCxP;
      if rgJustif.ItemIndex=1 then
       GrabaCompNoProv;


      DMTE.cdsEgrCaja.edit ;
      DMTE.cdsEgrCaja.FieldByName('ECUSER').Value      := DMTE.wUsuario; // usuario que registra
      DMTE.cdsEgrCaja.FieldByName('ECFREG').Value      := DateS;         // fecha que registra Usuario
      DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time;         // Hora de Registro de Usuario
      cdspost(DMTE.cdsEgrCaja);
      xSQL := 'Select * From CAJA302 '
             +' Where CIAID ='+QuotedStr(dblcCia.Text)
             +' And ECANOMM ='+QuotedStr(edtPeriodo.Text)
             +' And TDIARID ='+QuotedStr(dblcTDiario.Text)
             +' And ECNOCOMP ='+QuotedStr(dbeNoComp.Text);

      DMTE.cdsEgrCaja.DataRequest( xSQL );

      DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

      //ActualizaFiltro ;

      DMTE.cdsRegCxP.ApplyUpdates(0);

      DMTE.cdsDocPago.ApplyUpdates(0);

      if rgJustif.ItemIndex=1 then
       DMTE.cdsECRepo.ApplyUpdates(0);

      z2bbtnSumatClick(sender);
      ShowMessage('Grabaci�n OK');

      z2bbtnNuevo.Enabled     := True;
      z2bbtnCancelado.Enabled := True;
      z2bbtnAnula.Enabled     := True;
      z2bbtnImprime.Enabled   := True;
			wModifica := False;
     end
    end
   else
    begin
     ShowMessage('Imposible Grabar');
    end;
end;

{******************************************************************************}
procedure TFFondoFijo.z2bbtnCanceladoClick(Sender: TObject);
var
   xConsis:Boolean;
   xSql : String;
	 xRetencion:Boolean;
begin
   if DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString='I' then
   begin
      if wModifica then
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
        if MessageDlg('�Efectuar la Cancelaci�n del Comprobante?',mtConfirmation,
                      [mbYes, mbNo], 0)=mrYes then
         begin

          ActMovCxP         ;
          if rgJustif.ItemIndex =1 then
           ActIngNoProv;

          ActualizaDetCanje ;

          /////////////////////////////////
          //  Calcula Retencion del IGV  //
          /////////////////////////////////
 				  xRetencion:=CalculaRetencionIGVBancos;
          /////////////////////////////////

          dbeImporte.Text := DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString;

          DMTE.cdsEgrCaja.Edit;
          DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'C';
          if xRetencion then
           DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString := 'S'
          else
           DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString := 'N';

          cdsPost(DMTE.cdsEgrCaja);

          xSQL := 'Select * From CAJA302'
                 +' Where CIAID ='+QuotedStr(dblcCia.Text)
                 +' And ECANOMM ='+QuotedStr(edtPeriodo.Text)
                 +' And TDIARID ='+QuotedStr(dblcTDiario.Text)
                 +' And ECFCOMP ='+QuotedStr(dbeNoComp.Text);

          DMTE.cdsEgrCaja.DataRequest( xSQL );

          DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');
          DMTE.AplicaDatos(DMTE.cdsRegCxP, 'REGCXP');

          z2bbtnSumatClick(sender);
          dbgPendientes.ReadOnly  := True;
          dbgDocPago.ReadOnly     := True;
          dbgOtros.ReadOnly       := True;

          z2bbtnCont.Enabled      := True;
          z2bbtnSube.Enabled      := False;
          z2bbtnGraba.Enabled     := False;
          z2bbtnCancelado.Enabled := False;
          z2bbtnCancel2.Enabled   := False;
          z2bbtnAnula.Enabled     := True;
          dbgOtrosIButton.Enabled := False ;
          lblEstado.Caption       := 'Cancelado          ';
          SaldosAux ;
//          ActualizaSaldosCaja;
//********************************A C T U A L I Z A    S A L D O S **************************************************************
          If wBcoTipCta='C' Then
           begin
            DMTE.ActSaldosCaja(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, DMTE.cdsEgrCaja.FieldByName('TMONID').AsString,
                              DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
                              DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString, 'E', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
           end
          Else
           begin
            DMTE.ActSaldosBancos(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, DMTE.cdsEgrCaja.FieldByName('TMONID').AsString,
                                DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
                                DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString, DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString,
                                'E', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
           end;
          Beep;
          MessageDlg('Datos Actualizados', mtCustom, [mbOk], 0);
          //ActualizaFiltro ;
         end;
      end;
   end
   else
   begin
      ShowMessage('Imposible Cancelar');
   end;
end;
{******************************************************************************}
function TFFondoFijo.ValidaCampo:Boolean;
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

//Validaci�n de centro de costo y auxiliares
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
           xWhere:='CCOSID='+''''+cdsRegCxP.FieldByName('CCOSID').Value+'''' ;
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
procedure TFFondoFijo.ConsisCancela(Var xConsis:boolean);
var
    xRegAct : TBookMark;
    xSumImp , Suma : Currency;
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
      Suma :=  strtocurr(floattostrf(DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat,fffixed,10,2))
   else
      Suma :=  strtocurr(floattostrf(DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat,fffixed,10,2)) ;

   if xSumImp <> Suma then
   begin
      xConsis := False;
      if xSumImp>Suma then
         ShowMessage('El Monto a Justificar es mayor que el Cheque')  
      else
         xConsis := True;
         //ShowMessage('El Monto a Justificar es menor que el Cheque');}
   end;
end;
{******************************************************************************}
procedure TFFondoFijo.Contab_Haber;
begin
	DMTE.cdsCntCaja.FieldByName('CIAID').AsString   :=  DMTE.cdsEgrcaja.FieldByName('CIAID').AsString;
	DMTE.cdsCntCaja.FieldByName('TDIARID').AsString :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
	DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
	DMTE.cdsCntCaja.FieldByName('DOCID').AsString    :=  DMTE.cdsEgrCaja.FieldByName('DOCID').AsString;
   //a pedido de jlc 20/12/2002
   DMTE.DisplayDescrip('prvTGE','TGE112','FCHQ,FCBCO','FPAGOID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString),'FCHQ');
   if ((DMTE.cdsQry.FieldByName('FCHQ').AsString='1') or (DMTE.cdsQry.FieldByName('FCHQ').AsString='S'))
      and (DMTE.cdsQry.FieldByName('FCBCO').AsString='S')
       then
      DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString
   else
      DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString;


//		DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString  :=  DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString;
		DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsString  :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString;
		DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value     :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString;
		DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString;
		DMTE.cdsCntCaja.FieldByName('CPTOID').AsString   :=  DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString;
		DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString :=  DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString;
		DMTE.cdsCntCaja.FieldByName('DCDH').AsString   :=  'H';
		DMTE.cdsCntCaja.FieldByName('TMONID').AsString   :=  DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;

      if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
   		DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat :=  DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat-xRETTOTMN
      else
   		DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat :=  DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat-xRETTOTME;

		DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat   :=  DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat-xRETTOTMN;
		DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat  :=  DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat-xRETTOTME;

		DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString:=  'S';   //Registro ya cuadrado
		DMTE.cdsCntCaja.FieldByName('DCUSER').AsString  :=  DMTE.wUsuario;
		DMTE.cdsCntCaja.FieldByName('DCFREG').AsString  :=  DateToStr(Date);
		DMTE.cdsCntCaja.FieldByName('DCHREG').AsString  :=  TimeToStr(Time);
		DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
		DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
		DMTE.cdsCntCaja.FieldByName('DCANO').AsString   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
		DMTE.cdsCntCaja.FieldByName('DCMM').AsString    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
		DMTE.cdsCntCaja.FieldByName('DCDD').AsString    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
		DMTE.cdsCntCaja.FieldByName('DCSS').AsString    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
		DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
		DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
		DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
		DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
		DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
		DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString  :=  FRegistro.xModulo;

		DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
    if (DMTE.xSRV_RUTA='\\INCORESA') or (DMTE.xSRV_RUTA='\\SACSA') then
			 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:=DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString;

		DMTE.cdsCntCaja.FieldByName('FCAB').AsString := '1' ;
		DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat :=DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
		DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat :=DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
		xNReg:=xNReg+1;
		DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

end;
{******************************************************************************}
procedure TFFondoFijo.Contab_RegCxP;
var
	 xSQL : String;
begin
	DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsRegCxP.FieldByName('CIAID').Value;
	DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
	DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
	DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
	DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsRegCxP.FieldByName('CPSERIE').Value;
	DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsRegCxP.FieldByName('CPNODOC').Value;
	DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value;
	DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsRegCxP.FieldByName('CPFEMIS').Value;
	DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsRegCxP.FieldByName('CPFVCMTO').Value;
	DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  DMTE.cdsRegCxP.FieldByName('CPTOID').Value;
	DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  DMTE.cdsRegCxP.FieldByName('CUENTAID').Value;

	DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString ;
   if (DMTE.xSRV_RUTA='\\INCORESA') or (DMTE.xSRV_RUTA='\\SACSA') then
   begin
			xSQL:='Select AUXNOMB from CNT201 '
						+'Where CLAUXID='''+DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString+''' and '
						+      'AUXID='''  +DMTE.cdsRegCxP.FieldByName('PROV').AsString  +'''';
			DMTE.cdsQry.Close;
			DMTE.cdsQry.DataRequest( xSQL );
			DMTE.cdsQry.Open;
         if DMTE.cdsQry.FieldByName('AUXNOMB').AsString<>'' then
   			DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.FieldByName('AUXNOMB').AsString
         else
   			DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString;
   end;

	 DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
	 DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsRegCxP.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
	 DMTE.cdsCntCaja.FieldByName('CCOSID').Value  := DMTE.cdsRegCxP.FieldByName('CCOSID').Value;
	 DMTE.cdsCntCaja.FieldByName('DCDH').AsString    := DMTE.cdsRegCxP.FieldByName('DEDH').AsString;
	 DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:= DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
	 DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:= DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
	 DMTE.cdsCntCaja.FieldByName('TMONID').Value  := DMTE.cdsRegCxP.FieldByName('TMONID').Value;
	 DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value:= DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
	 if DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wtMonLoc then
	 begin
	 	 DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
	 	 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat,15,2);
	 end
	 else
	 begin
	 	 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value;
	 	 DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value * DMTE.cdsRegCxP.FieldByName('DETCDOC').Value,15,2);
	 end;

	 DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
	 DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
	 DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
	 DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
	 DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
	 DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
	 DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
	 DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
	 DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
	 DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
	 DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
	 DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
	 DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
	 DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
	 DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
	 DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
	 xNReg:=xNReg+1;
	 DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
end;
{******************************************************************************}
procedure TFFondoFijo.Contab_DocPago;
var
	 xWhere, Xsql      : String ;
begin
	 { recuperar provisi�n }
	xWhere := ' CIAID = '''        + DMTE.cdsDocPago.FieldByName('CIAID').AsString    + ''''
					+ ' AND CPANOMES = ''' + DMTE.cdsDocPago.FieldByName('CPANOMM').AsString  + ''''
					+ ' AND TDIARID = '''  + DMTE.cdsDocPago.FieldByName('TDIARID2').AsString + ''''
					+ ' AND CPNOREG = '''  + DMTE.cdsDocPago.FieldByName('CPNOREG').AsString  + ''''
					+ ' AND CPNODOC = '''  + DMTE.cdsDocPago.FieldByName('CPNODOC').AsString  + '''';
	if DMTE.RecuperarDatos( 'CXP301' , 'TMONID' , xWhere ) then
	begin
		 xMONID_PROV := DMTE.cdsRec.FieldByName('TMONID').AsString ;
	end
	else
		 Showmessage('Error en la recuperaci�n del documento - WMC') ;

	DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
	DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
	DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
	DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
	DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsDocPago.FieldByName('DOCID2').Value;
	DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
	DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
	DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
	DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
	DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsDocPago.FieldByName('CPFEMIS').Value;
	DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value;
	DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  DMTE.cdsDocPago.FieldByName('CPTOID').Value;
	DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  DMTE.cdsDocPago.FieldByName('CUENTAID').Value;
	DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsDocPago.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
	DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsDocPago.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera

	DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
   if (DMTE.xSRV_RUTA='\\INCORESA') or (DMTE.xSRV_RUTA='\\SACSA') then
   begin
		 xSQL:='Select AUXNOMB from CNT201 '
			  +'Where CLAUXID='''+DMTE.cdsDocPago.FieldByName('CLAUXID').AsString+''' and '
			  +      'AUXID='''  +DMTE.cdsDocPago.FieldByName('PROV').AsString  +'''';
		 DMTE.cdsQry.Close;
		 DMTE.cdsQry.DataRequest( xSQL );
		 DMTE.cdsQry.Open;
		 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.FieldByName('AUXNOMB').AsString;
	end;

	DMTE.cdsCntCaja.FieldByName('DCDH').Value    :=  'D';
	DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsDocPago.FieldByName('DETCPAG').Value  ;
	DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsDocPago.FieldByName('DETCDOC').Value  ;
//	DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsDocPago.FieldByName('TMONID').Value   ;
	DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').Value   ;
	DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value:=  DMTE.cdsDocPago.FieldByName('DEMTOORI').Value ;

	if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString=DMTE.wTMonLoc then begin
		if xMONID_PROV = DMTE.cdsEgrCaja.FieldByName('TMONID').AsString then
      begin
			xMTOCNTLOC:=Redondea( DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat ) ;
			xMTOCNTEXT:=Redondea( DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat );
		end
		else
      begin
			xMTOCNTEXT := Redondea( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat ) ;
			xMTOCNTLOC := Redondea( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat ) ;
		end;
		DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value   := xMTOCNTLOC;
		DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value    := xMTOCNTLOC;
		DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
	end
	else
	begin
		if xMONID_PROV = DMTE.cdsEgrCaja.FieldByName('TMONID').AsString then
      begin
			xMTOCNTEXT := Redondea( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat ) ;
			xMTOCNTLOC := Redondea( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat );
		end
		else
      begin
			xMTOCNTLOC:=Redondea( DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat ) ;
			xMTOCNTEXT:=Redondea( DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat );
		end;
		DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value   := xMTOCNTEXT;
		DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
		DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value    := xMTOCNTLOC;
	end;

	DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
	DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
	DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
	DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
	DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
	DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
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
procedure TFFondoFijo.Contab_DifCamDocPago;
var
   xSQL1, xSQL : String;
begin
	xsql := 'TMONID='+quotedstr(DMTE.cdsDocPago.FieldByName('TMONID').AsString);
	if (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') then
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
			DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
			DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString :=  DMTE.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
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
			xNReg:=xNReg+1;
			DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
			DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:='Diferencia de Cambio';

			if xMONID_PROV = DMTE.wTMonLoc then
			begin
				DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat-xMTOCNTEXT ;
				DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat-xMTOCNTLOC ;
				DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat-xMTOCNTLOC ;
				if DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat > DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat then
					DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D'
            else
               DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
         end
         else
         begin
				DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat-xMTOCNTEXT ;
				if DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat > DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat then
            begin
					DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
					DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat:=DMTE.FRound(xMTOCNTEXT-DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat,15,2);
					DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat :=DMTE.FRound(xMTOCNTLOC-DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat,15,2);
				end
				else
            begin
					DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
					DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat:=DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat-xMTOCNTEXT,15,2) ;
					DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat :=DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat-xMTOCNTLOC,15,2);
				end;
			end ;
			if DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'D' then
			begin
				DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoPer;
				DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaPer;
			end
			else
			begin
				DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
				DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
			end;
		end
   end;
end;


procedure TFFondoFijo.Contab_DifCamDocPago2;
var
 xSql,xSql1 : String;
begin
	 // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
	xsql := 'TMONID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('TMONID').AsString);
	xsql1 := 'TMONID='+quotedstr(DMTE.cdsDocPago.FieldByName('TMONID').AsString);
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
        DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsDocPago.FieldByName('DOCID2').Value;
        DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
        DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
        DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
        DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsDocPago.FieldByName('CPFEMIS').Value;
        DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value;
        DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  DMTE.cdsDocPago.FieldByName('CPTOID').Value;
        DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  DMTE.cdsDocPago.FieldByName('CUENTAID').Value;
        DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
        DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
        DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
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
        DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
    		DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:='Diferencia de Cambio';

        if xMONID_PROV = DMTE.wTMonExt then
        begin
           DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value :=DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat*DMTE.cdsDocPago.FieldByName('DETCDOC').Value; ;
           DMTE.cdsCntCaja.FieldByName('DCDH').Value    :='H';
           DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=wCptoGan;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=wCtaGan;
        end;

        //////////////

        DMTE.cdsCntCaja.Insert;
        DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
				DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
        DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
        DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsDocPago.FieldByName('DOCID2').Value;
        DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
        DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
        DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
        DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsDocPago.FieldByName('CPFEMIS').Value;
        DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value;
        DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  DMTE.cdsDocPago.FieldByName('CPTOID').Value;
        DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  DMTE.cdsDocPago.FieldByName('CUENTAID').Value;
        DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
        DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
				DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
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
				DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
    		DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:='Diferencia de Cambio';

				if xMONID_PROV = DMTE.wTMonExt then
				begin
					 DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value :=DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat*DMTE.cdsDocPago.FieldByName('DETCPag').Value; ;
					 DMTE.cdsCntCaja.FieldByName('DCDH').Value    :='D';
					 DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=wCptoPer;
					 DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=wCtaPer;
				end;
		 end;
    end;
end;


{******************************************************************************}
procedure TFFondoFijo.Contab_DifCamRegCxP;
var
		xDif_Camb : double;
begin
	 // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
	 if DMTE.cdsRegCxP.FieldByName('DETCDOC').Value <> DMTE.cdsRegCxP.FieldByName('DETCPAG').Value then
		begin
			DMTE.cdsCntCaja.Insert;
			DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsRegCxP.FieldByName('CIAID').Value;
			DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
			DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
			DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
			DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
			DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsRegCxP.FieldByName('CPSERIE').Value;
			DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsRegCxP.FieldByName('CPNODOC').Value;
			DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value;
			DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsRegCxP.FieldByName('CPFEMIS').Value;
			DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsRegCxP.FieldByName('CPFVCMTO').Value;
			DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
			DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
			DMTE.cdsCntCaja.FieldByName('CCOSID').Value  :=  DMTE.cdsRegCxP.FieldByName('CCOSID').Value;
			DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
			DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
			DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
			DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
			DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
			DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
			DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
			DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
			DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
			DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
			DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
			DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
			DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
			DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
			DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
			DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
			DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
			DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString:= FRegistro.xModulo;
			xNReg:=xNReg+1;
			DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
			DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:='Diferencia de Cambio Doc.';

			DMTE.cdsCntCaja.FieldByName('TMONID').Value   :=  DMTE.cdsEgrCaja.FieldByName('TMONID').vALUE;
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
			 end
      else
       begin
         DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
				 DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
       end;
    end;
end;


procedure TFFondoFijo.Contab_DifCamRegCxP2;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   if DMTE.cdsRegCxP.FieldByName('DETCDOC').Value <> DMTE.cdsRegCxP.FieldByName('DETCPAG').Value then begin
			DMTE.cdsCntCaja.Insert;
      DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsRegCxP.FieldByName('CIAID').Value;
      DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
      DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
      DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
      DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsRegCxP.FieldByName('CPSERIE').Value;
      DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsRegCxP.FieldByName('CPNODOC').Value;
      DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsRegCxP.FieldByName('CPFEMIS').Value;
      DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsRegCxP.FieldByName('CPFVCMTO').Value;
      DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
      DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
      DMTE.cdsCntCaja.FieldByName('CCOSID').Value  :=  DMTE.cdsRegCxP.FieldByName('CCOSID').Value;
      DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
      DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
			DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
      DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
      DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
      DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
			DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
      DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
      DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
			DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
			DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
			DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
			DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
			DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
			DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
			DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
			DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
			DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString:= FRegistro.xModulo;
			DMTE.cdsCntCaja.FieldByName('TMONID').Value   :=  DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
			if DMTE.cdsRegCxP.FieldByName('TMONID').Value=DMTE.wtMonExt then begin
				 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value * DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
				 DMTE.cdsCntCaja.FieldByName('DCDH').Value    :='H';
				 DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
				 DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
			end;
			DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:='Diferencia de Cambio Doc.';

			DMTE.cdsCntCaja.Insert;
			DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsRegCxP.FieldByName('CIAID').Value;
			DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
			DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
			DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
			DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
			DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsRegCxP.FieldByName('CPSERIE').Value;
      DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsRegCxP.FieldByName('CPNODOC').Value;
      DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value;
			DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsRegCxP.FieldByName('CPFEMIS').Value;
      DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsRegCxP.FieldByName('CPFVCMTO').Value;
      DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
			DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
      DMTE.cdsCntCaja.FieldByName('CCOSID').Value  :=  DMTE.cdsRegCxP.FieldByName('CCOSID').Value;
      DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
      DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
      DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
      DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
      DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
      DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
      DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
      DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
      DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
      DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
      DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
      DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
      DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
      DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
			DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
			DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
			DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
			DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString:= FRegistro.xModulo;
			DMTE.cdsCntCaja.FieldByName('TMONID').Value   :=  DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
			if DMTE.cdsRegCxP.FieldByName('TMONID').Value=DMTE.wtMonExt then begin
				 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value * DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
				 DMTE.cdsCntCaja.FieldByName('DCDH').Value    :='D';
				 DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := wCptoPer;
				 DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= wCtaPer;
			end;
			DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:='Diferencia de Cambio Doc.';
	 end;
end;



{******************************************************************************}
procedure TFFondoFijo.Contabiliza;
var
   xRegAct : TBookMark;
   sAux,sProv,xSQL    : String;
   xMtoRetL,xMtoRetE:double;
   xMtoRetLH,xMtoRetEH:double;
   bbreak,bLetra:boolean;
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

    // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera
    xSQL:='Select * from CAJA304 Where CIAID='''' and '
         +  'ECANOMM='''' and TDIARID='''' and ECNOCOMP='''' ';
    DMTE.cdsCNTCaja.Close;
    DMTE.cdsCNTCaja.DataRequest( xSQL );
    DMTE.cdsCNTCaja.Open;
		//
    xNReg:=0;

	 // GENERA LOS REGISTROS DE "DEBE" Y LOS REGISTROS POR DIF. DE CAMBIO desde Docs Pago
	 DMTE.cdsDocPago.DisableControls;
	 xRegAct := DMTE.cdsDocPago.GetBookmark;
	 DMTE.cdsDocPago.First ;
	 while not DMTE.cdsDocPago.Eof do
	 Begin
	 	 DMTE.cdsCntCaja.Insert;
	 	 Contab_DocPago ;
	 	 if DMTE.wTipoDif='' then
	 			Contab_DifCamDocPago
	 	 else begin
	 			if DMTE.cdsDocPago.FieldByname('TMONID').AsString=DMTE.wTMonExt then
	 				 Contab_DifCamDocPago2;
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
		While not DMTE.cdsRegCxP.Eof do
		Begin
			 DMTE.cdsCntCaja.Insert;
			 Contab_RegCxP;
			 if DMTE.wTipoDif='' then
					Contab_DifCamRegCxP
			 else begin
					if DMTE.cdsRegCxP.FieldByname('TMONID').AsString=DMTE.wTMonExt then
						 Contab_DifCamRegCxP2;
			 end;
			 DMTE.cdsRegCxP.Next;
		end;
		DMTE.cdsRegCxP.GotoBookmark(xRegAct);
		DMTE.cdsRegCxP.FreeBookmark(xRegAct);
		DMTE.cdsRegCxP.EnableControls;

   //REGISTROS PARA LAS CUENTAS DE RETENCION PARA EL DEBE Y HABER PARA REGISTROS PROVISIONADOS
   sAux:='';
   sProv:='';
	 DMTE.cdsDocPago.DisableControls;
	 xRegAct := DMTE.cdsDocPago.GetBookmark;

   if wCiaRetIGV then
   begin
     DMTE.cdsDocPago.DisableControls;
     xRegAct := DMTE.cdsDocPago.GetBookmark;
     DMTE.cdsDocPago.First ;
     sAux :=DMTE.cdsDocPago.FieldByName('CLAUXID').AsString;
     sProv:=DMTE.cdsDocPago.FieldByName('PROV').AsString;
     xMtoRetL:=0;
     xMtoRetE:=0;
     xMtoRetLH:=0;
     xMtoRetEH:=0;
     bLetra:=False;
     bbreak:=False;
     xRETTOTMN:=0; xRETTOTME :=0;

     while not DMTE.cdsDocPago.Eof do
     begin
       if (sProv=DMTE.cdsDocPago.FieldByName('PROV').AsString) AND (sAux=DMTE.cdsDocPago.FieldByName('CLAUXID').AsString) then
       begin
         if (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec) AND
            (DMTE.DisplayDescrip('prvTGE','CNT201','PROVRETIGV', 'CLAUXID = '''+sAux+ ''' AND AUXID=''' + sProv+ '''','PROVRETIGV')='S') AND
            (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV','DOCMOD=''CXP'' AND DOCID='+QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString),'DOCRETIGV')='S') then
         begin
           if DMTE.sLet<>DMTE.cdsDocPago.FieldByName('DOCID2').AsString then
           begin
             xMtoRetL :=xMtoRetL+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
             xMtoRetE :=xMtoRetE+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
             xMtoRetLH:=xMtoRetLH+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
             xMtoRetEH:=xMtoRetEH+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
           end
           else
           begin
             xSQL  :=' CIAID='''   +DMTE.cdsDocPago.FieldByName('CIAID').AsString   +''' and '
                    +' CPANOMES='''+DMTE.cdsDocPago.FieldByName('CPANOMM').AsString +''' and '
                    +' PROV='''+DMTE.cdsDocPago.FieldByName('PROV').AsString +''' and '
                    +' CPNOREGLET=''' +DMTE.cdsDocPago.FieldByName('CPNOREG').AsString +''' '  ;

             if DMTE.RecuperarDatos( 'CXP313', 'TMONID,TMONID2,TCANJEID,CPRETORI,CPRETLOC,CPRETEXT,PROV,CPTCAMPR' , xSQL ) then
             begin
               DMTE.cdsRec.First;
               while not  DMTE.cdsRec.Eof do
               begin
                  if DMTE.wTMonLoc=DMTE.cdsRec.FieldByName('TMONID2').AsString then
                  begin
                    bLetra:=True;
                    xMtoRetL :=DMTE.FRound(xMtoRetL +DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat,15,2);
                    //xMtoRetE :=DMTE.FRound(xMtoRetE +DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat,15,2)/DMTE.cdsRec.FieldByName('CPTCAMPR').AsFloat,15,2);
                    xMtoRetE :=DMTE.FRound(xMtoRetE +DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat,15,2),15,2);
                    xMtoRetLH:=DMTE.FRound(xMtoRetLH+DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat,15,2);
                    xMtoRetEH:=DMTE.FRound(xMtoRetEH+DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat,15,2)/DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat,15,2);
                  end
                  else
                  begin
                    bLetra:=True;
                    xMtoRetE :=DMTE.FRound(xMtoRetE +DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat,15,2);
                    //xMtoRetL :=DMTE.FRound(xMtoRetL +DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat,15,2)*DMTE.cdsRec.FieldByName('CPTCAMPR').AsFloat,15,2);
                    xMtoRetL :=DMTE.FRound(xMtoRetL +DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat,15,2),15,2);
                    xMtoRetEH:=DMTE.FRound(xMtoRetEH+DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat,15,2);
                    xMtoRetLH:=DMTE.FRound(xMtoRetLH+DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat,15,2)*DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat,15,2);
                  end;
                  DMTE.cdsRec.Next
               end;
             end
             else
                Showmessage('Error en la recuperaci�n del documento - WMC');


           end;
         end;
         DMTE.cdsDocPago.Next;
         bbreak:=DMTE.cdsDocPago.Eof;

         if (DMTE.cdsDocPago.Eof) OR (DMTE.cdsDocPago.FieldByName('PROV').AsString<>sProv) then
         begin

           sAux :=DMTE.cdsDocPago.FieldByName('CLAUXID').AsString;
           sProv:=DMTE.cdsDocPago.FieldByName('PROV').AsString;
           if not DMTE.cdsDocPago.Eof then
              DMTE.cdsDocPago.Prior;
           if ((xMtoRetL>=DMTE.xTasaMonto) AND (not bLetra)) OR (bletra) then
           begin
             if not bLetra then
             begin
               xMtoRetL:=DMTE.FRound(xMtoRetL*DMTE.xTasaPorce/100,15,2);
               xMtoRetE:=DMTE.FRound(xMtoRetE*DMTE.xTasaPorce/100,15,2);
               xMtoRetLH:=DMTE.FRound(xMtoRetLH*DMTE.xTasaPorce/100,15,2);
               xMtoRetEH:=DMTE.FRound(xMtoRetEH*DMTE.xTasaPorce/100,15,2);
             end;

             DMTE.cdsCntCaja.Insert;
             if dblcTMon.text=DMTE.wTMonLoc then
               Contab_DocPago_RETENCION_HABER(xMtoRetLH, xMtoRetEH, xMtoRetLH)
             else
               Contab_DocPago_RETENCION_HABER(xMtoRetLH, xMtoRetEH, xMtoRetEH);

             if not bLetra then
             begin
               xRETTOTMN:=xRETTOTMN+xMtoRetL;
               xRETTOTME:=xRETTOTME+xMtoRetE;
             END;
             {if dblcTMon.text=DMTE.wTMonLoc then
                Contab_DocPago_RETENCION_DEBE(xMtoRetL,xMtoRetE,xMtoRetL)
             else
                Contab_DocPago_RETENCION_DEBE(xMtoRetL,xMtoRetE,xMtoRetE);}

             DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');

             if bLetra then
             begin
               DMTE.cdsCntCaja.Insert;
               if dblcTMon.text=DMTE.wTMonLoc then
                 Contab_DocPago_RETENCION_DEBE(xMtoRetL, xMtoRetE, xMtoRetL)
               else
                 Contab_DocPago_RETENCION_DEBE(xMtoRetL, xMtoRetE, xMtoRetL);
               {
               xRETTOTMN:=xRETTOTMN+xMtoRetL;
               xRETTOTME:=xRETTOTME+xMtoRetE;
               }
               DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
               if DMTE.wTipoDif='' then
               begin
                 DMTE.cdsCntCaja.Insert;
                 Contab_DifCamDocPago_Retencion( xMtoRetLH, xMtoRetL );
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
               bletra:=False;
               xMtoRetL:=0;
               xMtoRetE:=0;
               xMtoRetLH:=0;
               xMtoRetEH:=0;
             end;
           end;
           if bbreak then
             DMTE.cdsDocPago.Last
           else begin
             xMtoRetL :=0;
             xMtoRetE :=0;
             xMtoRetLH:=0;
             xMtoRetEH:=0;
             DMTE.cdsDocPago.Next;
           end;
         end;
       end;
       {else
       begin
         sAux :=DMTE.cdsDocPago.FieldByName('CLAUXID').AsString;
         sProv:=DMTE.cdsDocPago.FieldByName('PROV').AsString;
         DMTE.cdsDocPago.Prior;
         if ((xMtoRetL>=DMTE.xTasaMonto) AND (not bLetra)) OR (bletra) then
         begin
           if not bLetra then
           begin
             xMtoRetL:=DMTE.FRound(xMtoRetL*DMTE.xTasaPorce/100,15,2);
             xMtoRetE:=DMTE.FRound(xMtoRetE*DMTE.xTasaPorce/100,15,2);
             xMtoRetLH:=DMTE.FRound(xMtoRetLH*DMTE.xTasaPorce/100,15,2);
             xMtoRetEH:=DMTE.FRound(xMtoRetEH*DMTE.xTasaPorce/100,15,2);
           end;

           DMTE.cdsCntCaja.Insert;
           if dblcTMon.text=DMTE.wTMonLoc then
             Contab_DocPago_RETENCION_DEBE(xMtoRetL,xMtoRetE,xMtoRetL)
           else
             Contab_DocPago_RETENCION_DEBE(xMtoRetL,xMtoRetE,xMtoRetE);

           DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');

           if bLetra then
           begin
             DMTE.cdsCntCaja.Insert;
             if dblcTMon.text=DMTE.wTMonLoc then
               Contab_DocPago_RETENCION_HABER(xMtoRetLH,xMtoRetEH,xMtoRetLH)
             else
               Contab_DocPago_RETENCION_HABER(xMtoRetLH,xMtoRetEH,xMtoRetLH);
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
             bletra:=False;
             xMtoRetL:=0;
             xMtoRetE:=0;
             xMtoRetLH:=0;
             xMtoRetEH:=0;
           end;
         end;
         DMTE.cdsDocPago.Next;
         if (DMTE.cdsDocPago.Eof) OR (DMTE.cdsDocPago.FieldByName('PROV').AsString) then
         begin

           break;
         end;
       end;}
     end;
   end;

   // Pago de Caja y Bancos
   DMTE.cdsCntCaja.Insert;
	Contab_Haber;

   // Cuadra Movimiento en Dolares
   xDebeT :=0;  xHabeT :=0;
   xDebeTD:=0;  xHabeTD:=0;
   DMTE.cdsCntCaja.First;
   while not DMTE.cdsCntCaja.Eof do
   begin
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

   if DMTE.FRound(xDebeTD,15,2)<>DMTE.FRound(xHabeTD,15,2)  then
   begin
      DMTE.cdsCntCaja.Edit;
      if DMTE.FRound(xDebeTD,15,2)>DMTE.FRound(xHabeTD,15,2) then
         DMTE.cdsCntCaja.FieldByname('DCMTOEXT').Value:=DMTE.cdsCntCaja.FieldByname('DCMTOEXT').Value+(DMTE.FRound(xDebeTD,15,2)-DMTE.FRound(xHabeTD,15,2))
      else
         DMTE.cdsCntCaja.FieldByname('DCMTOEXT').Value:=DMTE.cdsCntCaja.FieldByname('DCMTOEXT').Value-(DMTE.FRound(xHabeTD,15,2)-DMTE.FRound(xDebeTD,15,2));
   end;
   DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');



   {if DMTE.cdsDocPago.RecordCount=1 then
   begin
     if ((xMtoRetL>=DMTE.xTasaMonto) AND (not bLetra)) OR (bletra) then
     begin
       if not bLetra then
       begin
         xMtoRetL:=DMTE.FRound(xMtoRetL*DMTE.xTasaPorce/100,15,2);
         xMtoRetE:=DMTE.FRound(xMtoRetE*DMTE.xTasaPorce/100,15,2);
         xMtoRetLH:=DMTE.FRound(xMtoRetLH*DMTE.xTasaPorce/100,15,2);
         xMtoRetEH:=DMTE.FRound(xMtoRetEH*DMTE.xTasaPorce/100,15,2);
       end;

       DMTE.cdsCntCaja.Insert;
       if dblcTMon.text=DMTE.wTMonLoc then
         Contab_DocPago_RETENCION_DEBE(xMtoRetL,xMtoRetE,xMtoRetL)
       else
         Contab_DocPago_RETENCION_DEBE(xMtoRetL,xMtoRetE,xMtoRetE);

       DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');

       if bLetra then
       begin
         DMTE.cdsCntCaja.Insert;
         if dblcTMon.text=DMTE.wTMonLoc then
           Contab_DocPago_RETENCION_HABER(xMtoRetLH,xMtoRetEH,xMtoRetLH)
         else
           Contab_DocPago_RETENCION_HABER(xMtoRetLH,xMtoRetEH,xMtoRetLH);
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
         bletra:=False;
         xMtoRetL:=0;
         xMtoRetE:=0;

       end;
     end;
   end;}
	 DMTE.cdsDocPago.GotoBookmark(xRegAct);
	 DMTE.cdsDocPago.FreeBookmark(xRegAct);
	 DMTE.cdsDocPago.EnableControls;

   //REGISTROS PARA LAS CUENTAS DE RETENCION PARA EL DEBE Y HABER PARA REGISTROS NO PROVISIONADOS
{   sAux:='';
   sProv:='';
	 DMTE.cdsDocPago.DisableControls;
	 xRegAct := DMTE.cdsDocPago.GetBookmark;

   if wCiaRetIGV then
   begin
     DMTE.cdsDocPago.DisableControls;
     xRegAct := DMTE.cdsDocPago.GetBookmark;
     DMTE.cdsDocPago.First ;
     sAux :=DMTE.cdsDocPago.FieldByName('CLAUXID').AsString;
     sProv:=DMTE.cdsDocPago.FieldByName('PROV').AsString;
     xMtoRetL:=0;
     xMtoRetE:=0;
     xMtoRetLH:=0;
     xMtoRetEH:=0;
     bLetra:=False;
     while not DMTE.cdsDocPago.Eof do
     begin
       if (sProv=DMTE.cdsDocPago.FieldByName('PROV').AsString) AND (sAux=DMTE.cdsDocPago.FieldByName('CLAUXID').AsString) then
       begin
         if (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime>=DMTE.xTasaFec) AND
            (DMTE.DisplayDescrip('prvTGE','CNT201','PROVRETIGV', 'CLAUXID = '''+sAux+ ''' AND AUXID=''' + sProv+ '''','PROVRETIGV')='S') AND
            (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV','DOCMOD=''CXP'' AND DOCID='+QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString),'DOCRETIGV')='S') then
         begin
           if DMTE.sLet<>DMTE.cdsDocPago.FieldByName('DOCID2').AsString then
           begin
             xMtoRetL:=xMtoRetL+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
             xMtoRetE:=xMtoRetE+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
             xMtoRetLH :=xMtoRetLH+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
             xMtoRetEH:=xMtoRetEH+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
           end
           else
           begin                //AQUI VA EL CODIGO DEL CXP301
             xSQL  :=' CIAID='''   +DMTE.cdsDocPago.FieldByName('CIAID').AsString   +''' and '
                    +' CPANOMES='''+DMTE.cdsDocPago.FieldByName('CPANOMM').AsString +''' and '
                    +' TDIARID=''' +DMTE.cdsDocPago.FieldByName('TDIARID2').AsString+''' and '
                    +' CPNOREG=''' +DMTE.cdsDocPago.FieldByName('CPNOREG').AsString +''' '  ;

             if DMTE.RecuperarDatos( 'CXP301' , 'TMONID,TCANJEID,CPNOGRAV,CPGRAVAD,PROVDES,CPTCAMPR' , xSQL ) then
             begin
               if DMTE.wTMonLoc=DMTE.cdsRec.FieldByName('TMONID').AsString then
               begin
                 bLetra:=True;
                 xMtoRetL:=DMTE.FRound(xMtoRetL+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2);
                 xMtoRetE:=DMTE.FRound(xMtoRetE+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat/DMTE.cdsRec.FieldByName('CPTCAMPR').AsFloat,15,2);
                 xMtoRetLH:=DMTE.FRound(xMtoRetLH+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2);
                 xMtoRetEH:=DMTE.FRound(xMtoRetEH+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat/StrToFloat(dbeTCambio.text),15,2);
               end
               else
               begin
                 bLetra:=True;
                 xMtoRetE:=DMTE.FRound(xMtoRetE+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2);
                 xMtoRetL:=DMTE.FRound(xMtoRetL+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat*DMTE.cdsRec.FieldByName('CPTCAMPR').AsFloat,15,2);
                 xMtoRetEH:=DMTE.FRound(xMtoRetEH+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2);
                 xMtoRetLH:=DMTE.FRound(xMtoRetLH+DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat*StrToFloat(dbeTCambio.text),15,2);
               end;
             end
             else
                Showmessage('Error en la recuperaci�n del documento - WMC');
           end;
         end;
         DMTE.cdsDocPago.Next;
         //sAux :=DMTE.cdsDocPago.FieldByName('CLAUXID').AsString;
         //sProv:=DMTE.cdsDocPago.FieldByName('PROV').AsString;
       end
       else
       begin
         sAux :=DMTE.cdsDocPago.FieldByName('CLAUXID').AsString;
         sProv:=DMTE.cdsDocPago.FieldByName('PROV').AsString;
         DMTE.cdsDocPago.Prior;
         if ((xMtoRetL>=DMTE.xTasaMonto) AND (not bLetra)) OR (bletra) then
         begin
           if not bLetra then
           begin
             xMtoRetL:=DMTE.FRound(xMtoRetL*DMTE.xTasaPorce/100,15,2);
             xMtoRetE:=DMTE.FRound(xMtoRetE*DMTE.xTasaPorce/100,15,2);
             xMtoRetLH:=DMTE.FRound(xMtoRetLH*DMTE.xTasaPorce/100,15,2);
             xMtoRetEH:=DMTE.FRound(xMtoRetEH*DMTE.xTasaPorce/100,15,2);
           end;

           DMTE.cdsCntCaja.Insert;
           if dblcTMon.text=DMTE.wTMonLoc then
             Contab_DocPago_RETENCION_DEBE(xMtoRetL,xMtoRetE,xMtoRetL)
           else
             Contab_DocPago_RETENCION_DEBE(xMtoRetL,xMtoRetE,xMtoRetE);

           DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');

           if bLetra then
           begin
             DMTE.cdsCntCaja.Insert;
             if dblcTMon.text=DMTE.wTMonLoc then
               Contab_DocPago_RETENCION_HABER(xMtoRetLH,xMtoRetEH,xMtoRetLH)
             else
               Contab_DocPago_RETENCION_HABER(xMtoRetLH,xMtoRetEH,xMtoRetLH);
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
             bletra:=False;
             xMtoRetL:=0;
             xMtoRetE:=0;
             xMtoRetLH:=0;
             xMtoRetEH:=0;
           end;
         end;
         DMTE.cdsDocPago.Next;
       end;
     end;
   end;
   if DMTE.cdsDocPago.RecordCount=1 then
   begin
     if ((xMtoRetL>=DMTE.xTasaMonto) AND (not bLetra)) OR (bletra) then
     begin
       if not bLetra then
       begin
         xMtoRetL:=DMTE.FRound(xMtoRetL*DMTE.xTasaPorce/100,15,2);
         xMtoRetE:=DMTE.FRound(xMtoRetE*DMTE.xTasaPorce/100,15,2);
         xMtoRetLH:=DMTE.FRound(xMtoRetLH*DMTE.xTasaPorce/100,15,2);
         xMtoRetEH:=DMTE.FRound(xMtoRetEH*DMTE.xTasaPorce/100,15,2);
       end;

       DMTE.cdsCntCaja.Insert;
       if dblcTMon.text=DMTE.wTMonLoc then
         Contab_DocPago_RETENCION_DEBE(xMtoRetL,xMtoRetE,xMtoRetL)
       else
         Contab_DocPago_RETENCION_DEBE(xMtoRetL,xMtoRetE,xMtoRetE);

       DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');

       if bLetra then
       begin
         DMTE.cdsCntCaja.Insert;
         if dblcTMon.text=DMTE.wTMonLoc then
           Contab_DocPago_RETENCION_HABER(xMtoRetLH,xMtoRetEH,xMtoRetLH)
         else
           Contab_DocPago_RETENCION_HABER(xMtoRetLH,xMtoRetEH,xMtoRetLH);
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
         bletra:=False;
         xMtoRetL:=0;
         xMtoRetE:=0;

       end;
     end;
   end;
	 DMTE.cdsDocPago.GotoBookmark(xRegAct);
	 DMTE.cdsDocPago.FreeBookmark(xRegAct);
	 DMTE.cdsDocPago.EnableControls;
 }
		xDebeT:=0;
		xHabeT:=0;
		DMTE.cdsCntCaja.First;
		while not DMTE.cdsCntCaja.Eof do begin

			 if DMTE.cdsCntCaja.FieldByname('DCDH').AsString='D' then
					xDebeT:=xDebeT+DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat,15,2)
			 else
					xHabeT:=xHabeT+DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat,15,2);

			 DMTE.cdsCntCaja.Next;
		end;

		if DMTE.FRound(xDebeT,15,2)<>DMTE.FRound(xHabeT,15,2) then
			 AsientoDifTotal;

		//Actualizamos en la tabla de Contabilidad
		DMTE.cdsCntCaja.ApplyUpdates(0);
end;

procedure TFFondoFijo.AsientoDifTotal;
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
	 DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat ;
	 DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat ;
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
	 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:='Diferencia de Cambio Final';
	 xNReg:=xNReg+1;
	 DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

	 if xDebeT>xHabeT then
	 begin
			DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := abs(DMTE.FRound(xDebeT-xHabeT,15,2));
			DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat:= 0;
			DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
			DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
			DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
	 end
	 else begin
			DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := abs(DMTE.FRound(xHabeT-xDebeT,15,2));
			DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat:= 0;
			DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
			DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoPer;
			DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaPer;
	 end ;
end;


{******************************************************************************}
procedure TFFondoFijo.z2bbtnContClick(Sender: TObject);
var
 xSql : String;
begin
	 if DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString = 'C' then
	 begin
		 if DMTE.cdsEgrCaja.FieldByName('FEXTCHQ').AsString = '1' then
		 begin
				ShowMessage('No Puede Contabilizar este Movimiento ' + #13 +
										'Pues se encuentra extornado') ;
				Exit ;
     end ;
     if DMTE.MesCerrado(copy(edtPeriodo.text,5,2),copy(edtPeriodo.text,1,4),dblcCia.text) then
     begin
        ShowMessage(' Mes cerrado, no se puede contabilizar');
        exit;
     end;

     if MessageDlg('�Contabilizar y Generar Asientos Automaticos?',mtConfirmation,
                  [mbYes, mbNo], 0)=mrYes then
     begin
        screen.Cursor := crHourGlass ;
        RecCptosDifC ;
        Contabiliza ;

        ActualizaCNT311(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
                         DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                         DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                         DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString);
{
        if SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
                    DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                    DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                    DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                    DMTE.SRV_D, 'C', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                    DMTE.cdsResultSet, DMTE.DCOM1, Self ) then
}
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

           xSQL := 'Select * From CAJA302'
                  +' Where CIAID ='+QuotedStr(dblcCia.Text)
                  +' And ECANOMM ='+QuotedStr(edtPeriodo.Text)
                  +' And TDIARID ='+QuotedStr(dblcTDiario.Text)
                  +' And ECNOCOMP ='+QuotedStr(dbeNoComp.Text);
           DMTE.cdsEgrCaja.DataRequest( xSQL );
           DMTE.AplicaDatos(DMTE.cdsEgrCaja, 'EGRCAJA');
        end;
        z2bbtnCont.Enabled := False ;
        lblEstado.Caption  := 'Cancelado y Contab.' ;
        Screen.Cursor := crDefault ;
     end;
   end
   else
   begin
       ShowMessage('Imposible Contabilizar');
   end;
end;

{******************************************************************************}
procedure TFFondoFijo.z2bbtnAnulaClick(Sender: TObject);
begin
   if MessageDlg('�Anular Comprobante?',mtConfirmation,
                 [mbYes, mbNo], 0)=mrYes then
    begin
     if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='I' then
      begin
       DMTE.cdsECRepo.First;
       while not DMTE.cdsECRepo.Eof do begin
        DMTE.cdsECRepo.Edit;
        DMTE.cdsECRepo.FieldByname('TDIARIO2' ).AsString:= '';
        DMTE.cdsECRepo.FieldByname('ECANOMM2' ).AsString:= '';
        DMTE.cdsECRepo.FieldByname('ECNOCOMP2').AsString:= '';
        DMTE.cdsECRepo.FieldByname('FLAGVAR').AsString     := 'N';
        DMTE.cdsECRepo.Next;
       end;
       DMTE.cdsECRepo.ApplyUpdates(0);
       RetornaSaldosMovCxP;
      end;

     if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='C' then
      begin
       RetornaSaldosMovCxPPagados;
       if DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString='S' Then
        DMTE.AnulaRetencion;
      end;

      DMTE.cdsEgrCaja.CancelUpdates;
      DMTE.cdsRegCxP.CancelUpdates;
      DMTE.cdsMovCxP.CancelUpdates;
      DMTE.cdsDocPago.CancelUpdates;

      DMTE.cdsEgrCaja.Edit;
      DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value:='A';
      DMTE.cdsEgrCaja.ApplyUpdates(0);
      if DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString='S' THEN
       DMTE.AnulaRetencion;

      dbgPendientes.ReadOnly := True;
      dbgDocPago.ReadOnly    := True;
      dbgOtros.ReadOnly      := True;

//        z2bbtnSumat.Enabled    := False;
      z2bbtnNuevo.Enabled     := True;
      z2bbtnCont.Enabled      := False;
      z2bbtnSube.Enabled      := False;
      z2bbtnGraba.Enabled     := False;
      z2bbtnCancelado.Enabled := False;
      z2bbtnCancel2.Enabled   := False;
      z2bbtnAnula.Enabled     := False;
      dbgOtrosIButton.Enabled := False ;
      lblEstado.Caption       := 'Anulado            ';
    end;
end;
{******************************************************************************}
procedure TFFondoFijo.ActPnlBotones;
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
procedure TFFondoFijo.FormClose(Sender: TObject; var Action: TCloseAction);
var xSQL:string;
begin
  if pnlActualiza.Visible then
  begin
     z2bbtnCancel3.SetFocus ;
     z2bbtnCancel3Click(nil) ;
  end ;

   // Limpiamos los filtros
   with DMTE do
   begin
      cdsRegCxP.Filtered   := False;
      cdsMovCxP.Filtered   := False;
      cdsCntCaja.Filtered  := False;
      if cdsEgrCaja.active then
         cdsEgrCaja.CancelUpdates;
      if cdsRegCxP.Active then
         cdsRegCxP.CancelUpdates;
      if cdsMovCxP.active then
      begin
         cdsMovCxP.CancelUpdates;
         cdsMovCxP.Close ;
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
   end ;
   DMTE.cdsRetencion.Filter:='';
   DMTE.cdsRetencion.Filtered := false;
   DMTE.cdsRetencion.IndexFieldNames := '';

   edtCuenta.Enabled := False ;
   if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='X' then
   begin
     DMTE.cdsEgrCaja.Delete;
     xSQL := 'Select * From CAJA302 '
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
procedure TFFondoFijo.IniciaPanel;
begin
     dbeSerie.Text       := '';
     dblcTDoc2.Text      := '';
     dbeNoDoc2.Text      := '';
     dblcdCnp2.Text       := '';
     dbeDH.Text          := '';
     dblcdCCosto.Text     := '';
     dblcdCCosto.Text     := '';
     dblcTMon2.Text      := '';
     dbeImporte2.Text    := '';
     dbeTCamDoc.Text     := '';
     dbdtpFEmis2.Date    := 0;
     dbdtpFVcto2.Date    := 0;

     edtCuenta2.Text     := '';
     edtMtoLoc.Text      := '';
     edtMtoExt.Text      := '';
     edtTDoc2.Text       := '';
     edtCnp2.Text       := '';
     edtTMon2.Text       := '';
end;

{******************************************************************************}
procedure TFFondoFijo.dbgOtrosIButtonClick(Sender: TObject);
begin
     inhabilitarpaneles;
     AdicionarREgistros;
end;
{******************************************************************************}
procedure TFFondoFijo.dbgOtrosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (dbgOtrosIButton.Enabled) and (key = VK_DELETE) and (ssCtrl in Shift) then
   begin
      if (DMTE.cdsRegCxP.RecordCount=0) then
          ShowMessage('No hay registros')
       else
       begin
          if MessageDlg('�Eliminar Registro?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
          begin
             DMTE.cdsRegCxP.Delete;    // Borro en el original..
             z2bbtnSumatClick(sender);    // Al salir hay que totalizar
         end;
      end;
   end;
end;

{******************************************************************************}
procedure TFFondoFijo.dbdtpFComp2Exit(Sender: TObject);
begin
   DMTE.cdsRegCxP.FieldByName('CPANOMM').Value := copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value),7,4)
                              +copy(DateToStr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value),4,2);
end;

{******************************************************************************}
procedure TFFondoFijo.z2bbtnSumatClick(Sender: TObject);
Var
   xTSalLoc, xTSalExt, xTPagLoc, xTPagExt : double;
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
         xTSalLoc := xTSalLoc + cdsDocPago.FieldByName('DESALLOC').Value ;
         xTSalExt := xTSalExt + cdsDocPago.FieldByName('DESALEXT').Value ;
         xTPagLoc := xTPagLoc + cdsDocPago.FieldByName('DEMTOLOC').Value ;
         xTPagExt := xTPagExt + cdsDocPago.FieldByName('DEMTOEXT').Value ;
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

   SpeedButton1Click( Sender );

end;

{******************************************************************************}
procedure TFFondoFijo.dbgDocPagoDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   If (not dbgDocPago.Readonly) then
      Accept:=True;
end;

{******************************************************************************}
procedure TFFondoFijo.dbgDocPagoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   If (not dbgDocPago.Readonly) then
      dbgDocPago.BeginDrag(False);
end;

{******************************************************************************}
procedure TFFondoFijo.dbgDocPagoEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   If (not dbgDocPago.Readonly) and (Target=dbgpendientes) Then
    begin
        DMTE.cdsmovcxp.DisableControls ;
        DMTE.cdsMovCxP.Filtered:=False;
        if DMTE.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                                VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID').AsString,
                                            DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
                                            DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
                                            DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),
                                []) then
         begin
           DMTE.cdsMovCxP.Edit ;
           DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.cdsMovCxP.FieldByName('CPMTOEXT').Value - DMTE.NumeroNoNulo( DMTE.cdsMovCxP.FieldByName('CPPAGEXT') ) ;
           DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.cdsMovCxP.FieldByName('CPMTOLOC').Value - DMTE.NumeroNoNulo( DMTE.cdsMovCxP.FieldByName('CPPAGLOC') ) ;
           If DMTE.cdsMovCxP.FieldByName('TMONID').Value=DMTE.wTMonLoc then
              DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat
           else
              DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat ;

           DMTE.cdsMovCxP.Post ;

           DMTE.cdsDocPago.Delete;


           dbgPendientes.RefreshDisplay;
           dbgDocPago.RefreshDisplay;
           z2bbtnSumatclick(nil);
         end;
         DMTE.cdsMovCxP.Filtered := True;
         DMTE.cdsmovcxp.EnableControls ;
         wModifica := True;
    end;
end;
{******************************************************************************}
Procedure TFFondoFijo.LimpiaFiltros;
begin
   // Limpiando filtros si lo tuvieran
   DMTE.cdsMovCxP.Filtered  :=False;
   DMTE.cdsCntCaja.Filtered :=False;
   DMTE.cdsRegCxP.Filtered  :=False;
end;

{******************************************************************************}
{*********************** PROCEDIMIENTOS ADICIONALES   *************************}
procedure TFFondoFijo.ActivaFiltro(xName:string);
var
   xSQL : String ;
begin
    xName := uppercase(xName);

    // CAJA301
    if xName='REGCXP' then
    begin
        // vhn 22/01/2001
        xSQL:='Select * from CAJA301 '
             +'Where CIAID='''   +dblcCia.Text    +''' and '
             +      'ECANOMM=''' +edtPeriodo.Text +''' and '
             +      'TDIARID=''' +dblcTDiario.Text+''' and '
             +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
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
            +      'ECNOCOMP='''+dbeNoComp.Text  +''' ORDER BY CIAID,CLAUXID,PROV';
       DMTE.cdsDocPago.Close;
       DMTE.cdsDocPago.DataRequest( xSQL );
       DMTE.cdsDocPago.Open;
    end ;
end ;
{******************************************************************************}
Procedure TFFondoFijo.CambiaEstado(xName:char);
begin
   case xName of
     'I':begin  //Si est� INCOMPLETO o PENDIENTE
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

            if DMTE.cdsEgrCaja.FieldByName('ECCONTA').Value='S' then
            begin  //Esta contabilizado
               wbCont             := False;
               lblEstado.Caption  :='Cancelado y Contab.'
            end
            else
            begin
               wbCont             := True;
               lblEstado.Caption  :='Cancelado          ';
            end;
            wbSumat     := False;
            wbNuevo     := True;
            wbImprime   := True;
            wbSube      := False;
            wbGraba     := False;
            wbCancelado := False;
            wbCancel2   := False;
            wbAnula     := wbCont;
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
procedure TFFondoFijo.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   if (dbgPendientes.Readonly = False) then
       Accept:=True;
end;
{******************************************************************************}
procedure TFFondoFijo.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if (dbgPendientes.Readonly = False) then
      dbgPendientes.BeginDrag(False);
end;
{******************************************************************************}
procedure TFFondoFijo.dbgPendientesEndDrag(Sender, Target: TObject; X,Y: Integer);
var i: integer;
begin
    If (not dbgPendientes.Readonly) and (Target=dbgDocPago) Then
    Begin
      DMTE.cdsMovCxP.DisableControls;
      DMTE.cdsDocPago.DisableControls;
      for i:= 0 to dbgPendientes.SelectedList.Count-1 do
      begin
          dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);

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
          DMTE.cdsDocPago.FieldByName('DETCPAG').Value  := DMTE.FRound(strtofloat(dbeTCambio.Text),8,3);
          DMTE.cdsDocPago.FieldByName('CPTOID').Value   := DMTE.cdsMovCxP.FieldByName('CPTOTOT').Value;
          DMTE.cdsDocPago.FieldByName('CUENTAID').Value := DMTE.cdsMovCxP.FieldByName('CTATOTAL').Value;
          DMTE.cdsDocPago.FieldByName('CPFEMIS').Value  := DMTE.cdsMovCxP.FieldByName('CPFEMIS').Value;
          DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value := DMTE.cdsMovCxP.FieldByName('CPFVCMTO').Value;
          DMTE.cdsDocPago.FieldByName('DEANO').Value    := DMTE.cdsMovCxP.FieldByName('CPAAAA').Value;
          DMTE.cdsDocPago.FieldByName('DEMM').Value     := DMTE.cdsMovCxP.FieldByName('CPMM').Value;
          DMTE.cdsDocPago.FieldByName('DEDD').Value     := DMTE.cdsMovCxP.FieldByName('CPDD').Value;
          DMTE.cdsDocPago.FieldByName('DESS').Value     := DMTE.cdsMovCxP.FieldByName('CPSS').Value;
          DMTE.cdsDocPago.FieldByName('DESEM').Value    := DMTE.cdsMovCxP.FieldByName('CPSEM').Value;
          DMTE.cdsDocPago.FieldByName('DETRI').Value    := DMTE.cdsMovCxP.FieldByName('CPTRI').Value;
          DMTE.cdsDocPago.FieldByName('DEAASS').Value   := DMTE.cdsMovCxP.FieldByName('CPAASS').Value;
          DMTE.cdsDocPago.FieldByName('DEAASEM').Value  := DMTE.cdsMovCxP.FieldByName('CPAASEM').Value;
          DMTE.cdsDocPago.FieldByName('DEAATRI').Value  := DMTE.cdsMovCxP.FieldByName('CPAATRI').Value;
          DMTE.cdsDocPago.FieldByName('PROV').Value     := DMTE.cdsMovCxP.FieldByName('PROV').Value;
          DMTE.cdsDocPago.FieldByName('PROVDES').AsString := DMTE.cdsMovCxP.FieldByName('PROVDES').AsString;
          DMTE.cdsDocPago.FieldByName('PROVRUC').Value  := DMTE.cdsMovCxP.FieldByName('PROVRUC').Value;

          if DMTE.cdsDocPago.FieldByName('TMONID').Value=DMTE.wtMonLoc then
          begin
             DMTE.cdsDocPago.FieldByName('DESALLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value,15,2);
             DMTE.cdsDocPago.FieldByName('DESALEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value
                                            /DMTE.cdsDocPago.FieldByName('DETCPAG').Value,15,2);
          end
          else
          begin
             DMTE.cdsDocPago.FieldByName('DESALEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value,15,2);
             DMTE.cdsDocPago.FieldByName('DESALLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value
                                            *DMTE.cdsDocPago.FieldByName('DetCPag').Value,15,2);
          end;
          DMTE.cdsDocPago.FieldByName('DEANTMN').Value  := 0;
          DMTE.cdsDocPago.FieldByName('DEANTME').Value  := 0;
          DMTE.cdsDocPago.FieldByName('DEMTOORI').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').Value,15,2);
          DMTE.cdsDocPago.FieldByName('DEMTOLOC').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALLOC').Value,15,2);
          DMTE.cdsDocPago.FieldByName('DEMTOEXT').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALEXT').Value,15,2);
          DMTE.cdsDocPago.FieldByName('DEUSER').Value   := DMTE.wUsuario;
          DMTE.cdsDocPago.FieldByName('DEFREG').Value   := dateS;
          DMTE.cdsDocPago.FieldByName('DEHREG').Value   := time;
          DMTE.cdsDocPago.FieldByName('CLAUXID').AsString := DMTE.cdsMovCxP.FieldByName('CLAUXID').AsString ;
          DMTE.cdsDocPago.Post;

          // Marcamos como seleccionado el MovCxP
          DMTE.cdsMovCxP.Edit;
          DMTE.cdsMovCxP.FieldByName('CPSALORI').Value := 0 ;
          DMTE.cdsMovCxP.Post;

          dbgPendientes.datasource.dataset.Freebookmark(dbgPendientes.SelectedList.items[i]);
      end; // for

      dbgPendientes.SelectedList.clear;  { Clear selected record list since they are all deleted}
      dbgPendientes.RefreshDisplay;
      dbgDocPago.RefreshDisplay;
      DMTE.cdsDocPago.EnableControls;
      DMTE.cdsMovCxP.EnableControls;
      z2bbtnSumatclick(nil);
      wModifica:=True;
   end; // target
end;

procedure TFFondoFijo.ActSaldosMovCxP;
var
  xRegAct : TBookMark;
  xAdicional : Currency    ;
  xLoc,xExt,xOri,xcia,xtdia,xperio,sql,nreg,xSql   : String ;
begin
    DMTE.cdsMovCxP.DisableControls;
    DMTE.cdsMovCxP.Filtered:=False;

    DMTE.cdsDocPago.DisableControls;
    xRegAct := DMTE.cdsDocPago.GetBookmark;
    DMTE.cdsDocPago.First;
    While not DMTE.cdsDocPago.Eof do
    Begin
      //SE UBICA EL REGISTRO DEL CDSMOVCXP
      if DMTE.cdsMovCxP.Locate('TDIARID;CPANOMES;CPNOREG',VarArrayOf([DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
                            DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),[]) then
      begin
        DMTE.cdsMovCxP.Edit;
        if DMTE.cdsMovCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
        begin
          DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat-
                                                           DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat-
                                                           DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat,15,2);
          DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat,15,2);

          xAdicional := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat,15,2 ) ;
          DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat -
                                                           DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat - xAdicional,15,2) ;
        end
        else
        begin
          DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat -
                                                           DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat -
                                                           DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat,15,2);
          DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat      ;
          //A PEDIDO DE OBC 28/02/2003
{          xAdicional := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsMovCxP.FieldByName('CPTCAMPR').AsFloat,15,2) ;
          DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat -
                                                           DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat -
                                                           xAdicional,15,2) ;}

          xAdicional := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat,15,2) ;
          DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat -
                                                           DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat -
                                                           xAdicional,15,2) ;


        end;
        DMTE.cdsMovCxP.Post;
        DMTE.AplicaDatos(DMTE.cdsMovCxP, 'MOVCXP');
      end
      else
      begin
        Showmessage('No se Grabaron los Saldos') ;
      end;
      DMTE.cdsDocPago.Next;
    end;
    DMTE.cdsDocPago.GotoBookmark(xRegAct);
    DMTE.cdsDocPago.FreeBookmark(xRegAct);
    DMTE.cdsDocPago.EnableControls;
    DMTE.cdsMovCxP.Filtered:=True;
    DMTE.cdsMovCxP.EnableControls;

      {xSql:='select * from CXP301 where CIAID='+quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)+
      	' and TDIARID='+quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID2').AsString)+
      	' and CPANOMES='+quotedstr(DMTE.cdsDocPago.FieldByName('CPANOMM').AsString)+
      	' and CPNOREG='+quotedstr(DMTE.cdsDocPago.FieldByName('CPNOREG').AsString);
      DMTE.cdsQry3.close;
      DMTE.cdsQry3.DataRequest(xSql);
      DMTE.cdsQry3.Open;
      if DMTE.cdsQry3.REcordCount > 0 then
      begin
        DMTE.cdsQry3.edit ;
        if DMTE.cdsQry3.FieldByName('TMONID').Value = wTMonLoc then
        begin
          DMTE.cdsQry3.FieldByName('CPSALLOC').AsFloat := DMTE.cdsQry3.FieldByName('CPMTOLOC').AsFloat -
                                                         DMTE.numerononulo( DMTE.cdsQry3.FieldByName('CPPAGLOC') )-
                                                         DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat ;

          DMTE.cdsQry3.FieldByName('CPSALORI').AsFloat := DMTE.cdsQry3.FieldByName('CPSALLOC').AsFloat ;
          //Calculo del otro Saldo
          xAdicional := DMTE.FRound DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsQry3.FieldByName('CPTCAMPR').AsFloat,15,2 ) ;
          DMTE.cdsQry3.FieldByName('CPSALEXT').AsFloat := DMTE.FRound(DMTE.cdsQry3.FieldByName('CPMTOEXT').AsFloat -
                                                       DMTE.cdsQry3.FieldByName('CPPAGEXT').AsFloat - xAdicional,15,2) ;
        end
        else
        begin
          DMTE.cdsQry3.FieldByName('CPSALEXT').AsFloat := DMTE.cdsQry3.FieldByName('CPMTOEXT').AsFloat -
                                                         DMTE.numerononulo(DMTE.cdsQry3.FieldByName('CPPAGEXT') )-
                                                         DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat ;

          DMTE.cdsQry3.FieldByName('CPSALORI').AsFloat := DMTE.cdsQry3.FieldByName('CPSALEXT').AsFloat      ;
          //Calculo del otro Saldo
          xAdicional := Redondea( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsQry3.FieldByName('CPTCAMPR').AsFloat ) ;
          DMTE.cdsQry3.FieldByName('CPSALLOC').Value := DMTE.CDSQry3.FieldByName('CPMTOLOC').AsFloat -
                                                       DMTE.numerononulo(DMTE.cdsQry3.FieldByName('CPPAGLOC') )-
                                                       xAdicional ;
        end ;
        xLoc   := DMTE.cdsQry3.FieldByName('CPSALLOC').AsString ;
        xExt   := DMTE.cdsQry3.FieldByName('CPSALEXT').AsString ;
        xOri   := DMTE.cdsQry3.FieldByName('CPSALORI').AsString ;
        xcia   := trim(dblccia.text) ;
        xtdia  := DMTE.cdsQry3.FieldByName('TDIARID').AsString ;
        xperio := DMTE.cdsQry3.FieldByName('CPANOMES').AsString ;
        xnreg  := DMTE.cdsQry3.FieldByName('CPNOREG').AsString ;
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
          DCOM1.AppServer.EjecutaSQL(ssql);
        except
          Showmessage('No se Grabaron los Saldos') ;
        end;
      End
      else
        Showmessage('No se Actualiz� CXP ');
        cdsDocPago.Next;
    DMTE.cdsDocPago.GotoBookmark(xRegAct);
    DMTE.cdsDocPago.FreeBookmark(xRegAct);
    DMTE.cdsDocPago.EnableControls;
    DMTE.cdsMovCxP.Filtered:=True;
    DMTE.cdsMovCxP.EnableControls;
  end;                  }
end;
{******************************************************************************}
procedure TFFondoFijo.ActMovCxP;
var   xRegAct : TBookMark;
   ssql : string;
   xtcam,xori,xext,xloc : string;
   xcia,xtdia,xperio,xnreg : string;
begin
    with DMTE do
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
//////////
            xcia   := DMTE.cdsDocPago.FieldByName('CIAID').AsString;
            xtdia  := DMTE.cdsDocPago.FieldByName('TDIARID2').AsString;
            xperio := DMTE.cdsDocPago.FieldByName('CPANOMM').AsString;
            xnreg  := DMTE.cdsDocPago.FieldByName('CPNOREG').AsString;
//////////
            DMTE.cdsMovCxP.edit;

            DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat :=
                          DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat -
                          DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat  ;
            DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat :=
                          DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat -
                          DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat  ;

            If DMTE.cdsMovCxP.FieldByName('TMONID').Value=DMTE.wTMonLoc then
            begin
               DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat :=
                                         DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat ;
               If DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat <= 0.02 then
                  DMTE.cdsMovCxP.FieldByName('CPEstado').AsString := 'C';
            end
            else
            begin
               DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat :=
                                         DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat ;
               If DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat <= 0.02 then
                  DMTE.cdsMovCxP.FieldByName('CPESTADO').AsString := 'C';
            end;
            DMTE.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat := DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat ;
            DMTE.cdsMovCxP.post ;
//////////////////////
//
            xLoc   := DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsString ;
            xExt   := DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsString ;
            xOri   := DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsString ;
//
            ssql:='';
            ssql := 'UPDATE CXP301 SET '+
                    ' CPPAGLOC='+xloc+
                    ' ,CPPAGEXT='+xext+
                    ' ,CPPAGORI='+xori;
            If (DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat <= 0.02) or (DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat <= 0.02) then
             ssql := ssql +  ' ,CPESTADO='+quotedstr('C');
            //** 17/08/2001- pjsv
            If xtcam = '' then xtcam := '0';
            //**
            ssql := ssql + ' ,CPTCAMPA='+xtcam+
                           ' WHERE CIAID='+quotedstr(xcia)+
                           ' AND TDIARID='+quotedstr(xtdia)+
                           ' AND CPANOMES='+quotedstr(xperio)+
                           ' AND CPNOREG='+quotedstr(xnreg);
            try
             DCOM1.AppServer.EjecutaSQL(ssql);
            except
            end;
//////////////////////
        end
        else
        begin
            ShowMessage('Error :Actualizaci�n Mov WMC') ;
        end ;
        cdsDocPago.Next;
      end ;
      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);
      cdsDocPago.EnableControls;
      cdsMovCxP.Filtered:=True;
      cdsMovCxP.First;
      cdsMovCxP.EnableControls;
    end;
end;

procedure TFFondoFijo.RetornaSaldosMovCxP;
begin
   DMTE.cdsMovCxP.DisableControls;
   DMTE.cdsMovCxP.Filtered:=False;
   DMTE.cdsDocPago.DisableControls;
   DMTE.cdsDocPago.First;
   While not DMTE.cdsDocPago.Eof do
   Begin
     if DMTE.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                             VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID').AsString,
                                         DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
                                         DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
                                         DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),
                             []) then
      begin
        DMTE.cdsMovCxP.edit;
        DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat - DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat,15,2) ;
        DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat - DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat,15,2) ;
        If DMTE.cdsMovCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
           DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat
        else
           DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat ;
        DMTE.cdsMovCxP.Post;
        DMTE.AplicaDatos(DMTE.cdsMovCxP,'MOVCXP');
      end;
      DMTE.cdsDocPago.Next;
  end;
  DMTE.cdsDocPago.EnableControls;
  DMTE.cdsMovCxP.Filtered:=True;
  DMTE.cdsMovCxP.EnableControls;
end;

procedure TFFondoFijo.dbgOtrosCalcCellColors(Sender: TObject;
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

procedure TFFondoFijo.dbgDocPagoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
{    if (Field.FieldName = 'DEMTOLOC') or (Field.FieldName = 'DEMTOEXT') then begin
       AFont.Color := clBlue;
    end;}
end;

procedure TFFondoFijo.dbeLoteExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then
    Exit;

   dbeLote.Text := DMTE.StrZero(dbeLote.Text, DMTE.cdsEgrCaja.FieldByName('ECLOTE').DisplayWidth);
end;

procedure TFFondoFijo.dbeGiradoAChange(Sender: TObject);
begin
   wModifica:=True;
end;

procedure TFFondoFijo.dbeTCambioChange(Sender: TObject);
begin
   wModifica:=True;
end;

procedure TFFondoFijo.dbeImporteChange(Sender: TObject);
begin
   wModifica:=True;
end;

procedure TFFondoFijo.dbeNoDocChange(Sender: TObject);
begin
   wModifica:=True;
end;

procedure TFFondoFijo.dbeNoChqChange(Sender: TObject);
begin
   wModifica:=True;
end;

procedure TFFondoFijo.dbeLoteChange(Sender: TObject);
begin
   wModifica:=True;
end;


procedure TFFondoFijo.dbeGlosaChange(Sender: TObject);
begin
   wModifica:=True;
end;

procedure TFFondoFijo.FormKeyPress(Sender: TObject; var Key: Char);
var
   xStr : String ;
begin
{    if not aplicaKeyPress(self ,A2digitos , A4digitos) then
       Exit ;
    if not( Key in [ '0'..'9' , '.' , #8 ]) then
    begin
       Key := #0 ;
    end ;
    xStr := TCustomEdit(self.ActiveControl).text ;
    if key = '.' then
       if pos('.',xSTR) <> 0 then
          Key := #0 ;}
  if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;

end;

{begin

if key=#13 then
  begin
   key:=#0;
   perform(CM_DialogKey,VK_TAB,0);
  end;

end;}

procedure TFFondoFijo.z2bbtnOKCabClick(Sender: TObject);
var
   xWhere : String ;
	 xSQL : String;
begin
	 if validacionCabecera = False then
			Exit;

	 dbeTCambio.Text   := DMTE.RecuperarTipoCambio(dbdtpFComp.Date) ;
	 //dbeGiradoA.text   := DMTE.cdsBancoEgr.FieldByName('BANCONOM').AsString;

//	 dblcClase.text := DMTE.DisplayDescrip('prvTGE','TGE102','*','CLAUXCP='+quotedstr('B'),'CLAUXID');
//	 edtClase.text  := DMTE.cdsQry.fieldByname('CLAUXDES').AsString;
{	 if edtClase.text= '' then begin
			ShowMessage( 'Error : No Existe Clase de Auxiliar de bancos');
			exit;
	 end; }

		xSQL := 'Select * From CNT201 Where CLAUXID='''+dblcClase.Text+'''';
		DMTE.cdsAux.Close;
		DMTE.cdsAux.DataRequest( xSQL ) ;
		DMTE.cdsAux.Open;

   with DMTE do
	  begin
	 	 xWhere :=  'CIAID ='+''''+dblcCia.Text+''''
	 						+' AND TDIARID ='+''''+dblcTDiario.Text+''''
	 						+' AND ECANOMM ='+''''+edtPeriodo.Text+''''
	 						+' AND ECNOCOMP ='+''''+dbeNoComp.Text +'''';
	 	 if DMTE.DisplayDescrip('prvTGE','CAJA302','COUNT(*) TOTREG',xWhere,'TOTREG') > '0' then
 	 	  begin
		   ShowMessage('Comprobante ya esta Registrado');
		   dbeNoComp.Text:='';
       dblcTDiario.OnExit(Self);
       dbeNoComp.SetFocus;
       Exit;
		  end
	   else
	    begin
       GrabaCabeceraDeComprobante;
		   ActivaFiltro('REGCXP');
		   ActivaFiltro('DOCPAGO');
			 //liberamos el filtro del detalle
			 DMTE.cdsRegCxP.Filtered := False ;
			 //insertamos el Nuevo Registro
//				cdsEgrCaja.Insert;
			 CambiaEstado('N');
		  end;
	 end;
	 (Sender as tcontrol).enabled:=false;
	 perform(CM_DialogKey,VK_TAB,0);
	 wModifica:=False;

end;

procedure TFFondoFijo.dbeNoCompExit(Sender: TObject);
begin
   dbeNoComp.Text := DMTE.StrZero(dbeNoComp.Text, DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').DisplayWidth);
end;

procedure TFFondoFijo.dbgDocPagoCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'DEMTOLOC') or (AFieldName = 'DEMTOEXT') then
    begin
       ABrush.Color := clNone;
    end;
end;

procedure TFFondoFijo.dbgOtrosCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'DEMTOLOC') or (AFieldName = 'DEMTOEXT') then
    begin
       ABrush.Color := clNone;
    end;
end;

procedure TFFondoFijo.dblcdCnpExit(Sender: TObject);
var
   xSql : string;
begin
   if z2bbtnCancel.Focused then exit;
   if dbeLote.Focused      then exit;

   xSql := 'CPTOID='+quotedstr(dblcdCnp.Text);
   dbeGlosa.text := DMTE.DisplayDescrip('prvCnpEgr','CAJA201','CPTODES',xSql,'CPTODES');

   if dbeGlosa.text='' then begin
      ShowMessage('Error : Concepto no Valido');
      dblcdCnp.SetFocus;
   end;
end;

procedure TFFondoFijo.InhabilitarPaneles;
begin
   pnlDetalle.Enabled  := False;
   pnlBotones.Enabled  := False;
   IniciaPanel;
   pnlActualiza.BringToFront ;
   pnlActualiza.Visible:= True;
   dbeNoReg.Enabled    := True;
   dbeNoReg.Color      := clWindow;
   dbeNoReg.SetFocus;
   DMTE.cdsClaseAux.Filtered := False;
   DMTE.cdsClaseAux.Filter   := '';
   DMTE.cdsClaseAux.Filtered := True;
   DMTE.cdsClaseAux.Filter   := ' ( CLAUXCP=''A'' OR  CLAUXCP=''P'') ';
   DMTE.cdsClaseAux.Filtered := True;

   //Aqui se establecen los filtros para edicion en el grid
//   establecerfiltrosRegistroEgresos;
end;

procedure TFFondoFijo.EdiTarRegistros;
var
   xSQL : String;
begin
   BlanqueaEdits( pnlActualiza ) ;
   DMTE.cdsRegCxP.Edit;    //Lo pongo en modo de edicion
   dbeNoReg.Text:=DMTE.cdsRegCxP.FieldByName('CPNOREG').Value  ;
   dbeNoReg.Enabled:=false;
   label1.Caption := 'En Edicion';
   dbeNoReg.Enabled := False;
   dbeNoReg.Color   := clBtnFace;

{   if not DMTE.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ DMTE.wClaseAuxProv ]),[]) then
      Showmessage('Mensaje para WMC:''Error en la B�squeda del Auxiliar''') ;}

   //Recuperacion de los detalles del panel
   if trim(dblcTDoc2.Text)<>'' then edtTDoc2.Text:=DMTE.DisplayDescrip('prvTGE','TGE110','DOCABR','DOCID=''' + dblcTDoc2.Text +'''','DOCABR');
   if trim(dblcdCnp2.Text)<>'' then edtCnp2.Text :=DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOABR','CPTOID='''+dblcdCnp2.Text+'''','CPTOABR');

   if trim( dblcdAuxDet.Text ) <> '' then
   begin
      dbeAuxDet.Text    :=
            DMTE.DisplayDescrip('prvTGE','CNT201','AUXABR',
                               'CLAUXID = ''' +
                               DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString
                                + ''' AND AUXID=''' + dblcdAuxDet.Text + '''','AUXABR') ;
      edtClaseDet.Text     :=
            DMTE.DisplayDescrip('prvTGE','TGE102','CLAUXABR',
                               'CLAUXID = ''' +
                               DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString + ''' ','clauxabr') ;

   end ;

   if trim( dblcTMon2.Text ) <> '' then
      edtTMon2.Text     := DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblctmon2.Text,'TMONABR') ;
   //fin de los detalles del panel

   if trim(DMTE.cdsRegCxP.FieldByName('PROV').AsString)='' then
      dblcdAuxDet.Enabled := False
   else begin
      dblcdAuxDet.Enabled := False ;
      xSQL:='Select * from CNT201 Where CLAUXID='''+dblcClaseDet.Text+'''';
      DMTE.cdsProv.Close;
      DMTE.cdsProv.DataRequest( xSQL );
      DMTE.cdsProv.Open;
   end;

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
      if not DMTE.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClasedet.Text ]),[]) then
         Showmessage('Error en la B�squeda del Auxiliar') ;
end;

procedure TFFondoFijo.AdicionarRegistros;
var
xWhere,Aux :String;
begin
  with DMTE do
  begin
     dbeNoReg.Enabled:=true;
     dbeNoReg.Text:='';
     dbeNoReg.Text := DMTE.StrZero(GeneraCorrelativo( DMTE.cdsRegCxP , 'CPNOREG' ),10) ;
     DMTE.cdsRegCxP.Insert;
     DMTE.cdsRegCxP.FieldByName('CIAID').Value   := dblcCia.Text;
     DMTE.cdsRegCxP.FieldByName('TDIARID').Value := dblcTDiario.Text;
     DMTE.cdsRegCxP.FieldByName('ECANOMM').Value := edtPeriodo.Text;
     DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value:= dbeNoComp.Text;
     // Iniciar Datos, el reg. y su llave ya estan creados
     cdsRegCxP.FieldByName('DETCPAG').Value  := strtofloat(dbeTCambio.Text);
     cdsRegCxP.FieldByName('DEFCOMP').Value  := cdsEgrCaja.FieldByName('ECFCOMP').Value;
     cdsRegCxP.FieldByName('CPFEMIS').Value  := DateS;
     cdsRegCxP.FieldByName('CPFVCMTO').Value := DateS;
     cdsRegCxP.FieldByName('CPANOMM').Value  := copy(datetostr(cdsRegCxP.FieldByName('DEFCOMP').Value),7,4)
                                              + copy(datetostr(cdsRegCxP.FieldByName('DEFCOMP').Value),4,2);
     cdsRegCxP.FieldByName('DETCPAG').Value  := cdsEgrCaja.FieldByName('ECTCAMB').Value;
     cdsRegCxP.FieldByName('DETCDOC').Value  := cdsEgrCaja.FieldByName('ECTCAMB').Value;
     if cdsRegCxP.FieldByName('DEDH').AsString='' then
        cdsRegCxP.FieldByName('DEDH').AsString     := 'D';     //Inicializo en Debe

     xWhere:='FECHA=' +DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha,cdsRegCxP.FieldByName('DEFComp').AsDateTime)+''')' ;
     aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
     cdsRegCxP.FieldByName('DEANO').Value  := cdsqry.FieldByName('FECANO').Value;
     cdsRegCxP.FieldByName('DEMM').Value   := cdsqry.FieldByName('FECMES').Value;
     cdsRegCxP.FieldByName('DEDD').Value   := cdsqry.FieldByName('FECDIA').Value;
     cdsRegCxP.FieldByName('DESS').Value   := cdsqry.FieldByName('FECSS').Value;
     cdsRegCxP.FieldByName('DESEM').Value  := cdsqry.FieldByName('FECSEM').Value;
     cdsRegCxP.FieldByName('DETRI').Value  := cdsqry.FieldByName('FECTRIM').Value;
     cdsRegCxP.FieldByName('DEAASS').Value := cdsqry.FieldByName('FECAASS').Value;
     cdsRegCxP.FieldByName('DEAASEM').Value:= cdsqry.FieldByName('FECAASEM').Value;
     cdsRegCxP.FieldByName('DEAATRI').Value:= cdsqry.FieldByName('FECAATRI').Value;
   end;
   dbeNoReg.SetFocus;
   //
   edtTDoc2.Text := '' ;
   edtCnp2.Text := '' ;
   dbeAuxDet.Text := '' ;
   edtTMon2.Text := ''  ;

{	 dblcClaseDet.text := DMTE.DisplayDescrip('prvTGE','TGE102','*','CLAUXCP='+quotedstr('P'),'CLAUXID');
	 edtClaseDet.text  := DMTE.cdsQry.fieldByname('CLAUXDES').AsString;
	 if edtClaseDet.text= '' then begin
			ShowMessage( 'Error : No Existe Clase de Auxiliar de Proveedores');
			exit;
	 end;}
	 dblcClaseDet.text := dblcClase.Text;
	 edtClaseDet.text  := edtClase.Text;


//   DMTE.cdsClaseAux.Filter:='CLAUXID='+Quotedstr(dblcClaseDet.text);
//   DMTE.cdsClaseAux.Filtered:=True;

   DMTE.cdsProv.Close;

end;

procedure TFFondoFijo.LiberarFiltrosRegistroEgresos;
begin
      DMTE.cdsTDiario.Filter:='';
      DMTE.cdsTDiario.Filtered:=true;
      DMTE.cdsClaseAux.Filtered:=False;
      DMTE.cdsClaseAux.Filter  :=' ( RESPFF=''S'' ) ';
      DMTE.cdsClaseAux.Filtered:=True;
end;

procedure TFFondoFijo.dbgOtrosDblClick(Sender: TObject);
begin
   if not dbgOtrosIbutton.Enabled then
      exit ;

   if dbgOtros.DataSource.DataSet.RecordCount<>0 then
   begin
      inHabilitarPaneles;
      editarRegistros;
   end;
end;

function TFFondoFijo.ValidacionCabecera: Boolean;
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
					ShowMessage('Ingrese N�mero de Comprobante');
					dbeNocomp.SetFocus;
					exit;
		 end;


		 //si llega aqui es true
		 result:=true;

end;

procedure TFFondoFijo.z2bbtnImprimeClick(Sender: TObject);
var
	 Comprobante : RCabComprobante;
begin

   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' THEN
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

   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' THEN
	 begin
      ImprimeVoucher( 'CNT301', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text  );
   end;
   DMTE.cdsDocPago.EnableControls;
end;

procedure TFFondoFijo.FormShow(Sender: TObject);
var
   xWhere, xSQL : String;
   Comp : structComprobante ;
begin
   with DMTE do
   begin
      if Trim(dblcBanco.Text) <> '' then
      begin
          if cdsEgrCaja.FieldByName('ECESTADO').Value='I' then//Si est� INCOMPLETO o PENDIENTE
          begin
                //focus
                pnlCabecera2.setfocus ;
                perform(CM_DialogKey,VK_TAB,0);
                //
          end;

          if ( cdsEgrCaja.FieldByName('ECESTADO').Value='C' ) or
             ( cdsEgrCaja.FieldByName('ECESTADO').Value='A' ) then      //Si est� CANCELADO
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
            perform(CM_DialogKey,VK_TAB,0);
        //fin de codigo nuevo
      end ;
   end ;
   if DMTE.wModo='A' then
   begin
      Adiciona ;
   end
   else
   begin
      Edita( Comp, DMTE.cdsEgrCaja ) ;
   end;;

   z2bbtnSumatDocPagoClick( nil ) ;
   z2bbtnSumatClick( nil ) ;

   dbeLote.Text := '000';
   dbeLote.OnExit(Self);

   xSQL := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
   DMTE.cdsCCosto.Close;
   DMTE.cdsCCosto.DataRequest(xsql);
   DMTE.cdsCCosto.open;
   xVoucher := '';
   If DMTE.cdsFormPago.RecordCount = 1 then
    begin
     dbdtpFEmis.Enabled  := True ;
     xWhere := 'FPAGOID='+QuotedStr(dblcFormPago.Text);
     if DMTE.DisplayDescrip('prvQry2', 'TGE112', 'FCANJE', xWhere, 'FCANJE') = 'S' then
      edtCuenta.Enabled := True
     else
      edtCuenta.Enabled := False ;
    end;

   cf1.PonerExits ;

end;

procedure TFFondoFijo.dbeNoChqChange2(Sender: TObject);
begin
    wModifica:=True;
end;

procedure TFFondoFijo.dbeTCambioChange2(Sender: TObject);
begin
    wModifica:=True;
end;

procedure TFFondoFijo.dblcBancoExit2(Sender: TObject);
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
     dblcdCnp.text  := DMTE.DisplayDescrip('prvTGE','TGE105','CPTOID','BANCOID='+quotedstr(dblcBanco.text),'CPTOID');
     dbeGlosa.Text  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTODES','CPTOID='+quotedstr(dblcdCnp.text),'CPTODES');
     DMTE.cdsFormPago.Filter := 'FCEGR=''1'' or FCEGR=''S'' ' ;
     DMTE.cdsFormPago.Filtered := True ;
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
  wModifica:=True;
end;

procedure TFFondoFijo.dblcFormPagoExit(Sender: TObject);
var
   Tmp,sSQL : String ;
begin

   if z2bbtnCancel.Focused then exit;
   if dblcTMon.Focused then exit;

   edtFormPago.text:= DMTE.DisplayDescripLocal(DMTE.cdsFormPago,'FPAGOID',dblcFormPago.Text,'FPAGODES') ;

   if edtFormPago.Text='' then begin
      ShowMessage('Error : Forma de Pago no V�lida');
      dblcFormPago.SetFocus;
      Exit;
   end;
   lblNoChq.caption := 'Nro. '+edtFormPago.text;
   dbeNoChq.Text :='';
   dbdtpFEmis.date := 0 ;

   if DMTE.cdsFormPago.FieldByName('FCANJE').Value='S' then begin
      edtCuenta.Enabled:=True;
      edtCuenta.SetFocus;
   end
   else begin
      edtCuenta.Enabled := False ;
   end;

   if (DMTE.cdsFormPago.FieldByName('FCHQ').AsString='1') or
      (DMTE.cdsFormPago.FieldByName('FCHQ').AsString='S') then
   begin
      dbeNoChq.Enabled  :=True ;
      dbdtpFEmis.Enabled:= True ;
      if not edtCuenta.Focused then
      begin
         if rgJustif.ItemIndex=0 then
            dbeNoChq.SetFocus;
      end;
   end
   else
   begin
      dbeNoChq.Enabled  :=False;
      dbdtpFEmis.Enabled:= False ;
   end;

   if rgJustif.ItemIndex =1  then//Just. Reembolso
   begin
{      sSQL := ' SELECT * FROM CAJA302 '
           +'WHERE CIAID='''    + dblcCia.Text   +''' and '
           +      'CLAUXID='''  + dblcClase.Text +''' and '
           +      'PROV='''     + dblcdAux.Text  +''' and '
           +      'FPAGOID='''  + dblcFormPago.Text  +''' and '
           +      DMTE.wReplacCeros+'( ECNOREPO,''NULO'')<>''NULO'' AND '
           +  '( ( '+DMTE.wReplacCeros+'( ECNOCOMP2,''NULO'')=''NULO'' ) or '
           +    '( TDIARIO2=''' +dblcTDiario.Text+''' and '
           +      'ECANOMM2=''' +edtPeriodo.Text +''' and '
           +      'ECNOCOMP2='''+dbeNoComp.Text  +''' ) ) ';}
      sSQL := ' SELECT * FROM CAJA302 '
           +  ' WHERE CIAID='''    + dblcCia.Text       +''' and '
           +      'CLAUXID='''  + dblcClase.Text     +''' and '
           +      'PROV='''     + dblcdAux.Text      +''' and '
           +      'FPAGOID='''  + dblcFormPago.Text  +''' and '
           +      'BANCOID='''  + dblcBanco.Text     +''' and '
           +      'EC_PROCE=''' +'1'+''' and ';           
      if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
         sSQL:= sSQL +' ((COALESCE(ECMTOLOC,0)-COALESCE(ECCOBLOC,0))>0 OR (COALESCE(ECMTOEXT,0)-COALESCE(ECCOBEXT,0))>0)'
      else
         if (DMTE.SRV_D = 'ORACLE')  then
             sSQL:= sSQL +' ((NVL(ECMTOLOC,0)-NVL(ECCOBLOC,0))>0 OR (NVL(ECMTOEXT,0)-NVL(ECCOBEXT,0))>0)';
      DMTE.cdsECRepo.IndexFieldNames :='';
      DMTE.cdsECRepo.Filter   :='';
      DMTE.cdsECRepo.Filtered := False;
      DMTE.cdsECRepo.Close ;
      DMTE.cdsECRepo.DataRequest(sSQL);
      DMTE.cdsECRepo.Open ;
      if DMTE.cdsECRepo.RecordCount = 0 then
      begin
         rgJustif.ItemIndex := 0;
         rgJustif.SetFocus ;
         raise exception.Create('No existen Cheques No Provisionados'+#13+'para justificar el reembolso')
      end;
      dblcCheques.Selected.Clear ;
      dblcCheques.Selected.Add('ECNOCHQ'#9'10'#9'Nro.Cheque'#9'F');
      dblcCheques.Selected.Add('ECFEMICH'#9'10'#9'Fecha'#9'F');
      dblcCheques.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');
      if dblcTMon.Text = DMTE.wTMonLoc then
         dblcCheques.Selected.Add('ECSALMN'#9'10'#9'Monto'#9'F')
      else
         if dblcTMon.Text = DMTE.wTMonExt then
            dblcCheques.Selected.Add('ECSALME'#9'10'#9'Monto'#9'F');



      DMTE.cdsECRepo.DisableControls;
      DMTE.cdsECRepo.First;
      while not DMTE.cdsECRepo.Eof do begin
         DMTE.cdsECRepo.Edit;
         if (DMTE.cdsECRepo.FieldByname('TDIARIO2' ).AsString=dblcTDiario.Text) and
            (DMTE.cdsECRepo.FieldByname('ECANOMM2' ).AsString=edtPeriodo.Text ) and
            (DMTE.cdsECRepo.FieldByname('ECNOCOMP2').AsString=dbeNoComp.Text  ) then
            DMTE.cdsECRepo.FieldByname('FLAGVAR').Value:='S'
         else
            DMTE.cdsECRepo.FieldByname('FLAGVAR').Value:='N';
         DMTE.cdsECRepo.Next;
      end;
      Grid1;
      DMTE.cdsECRepo.EnableControls ;

      dblcCheques.LookupTable := DMTE.cdsECRepo ;
      dblcCheques.LookupField := 'ECNOCHQ';
      dbeNoChq.Enabled := False;
      dblcCheques.Visible := True;

      if DMTE.cdsECRepo.RecordCount =1 then
      begin
         dblcCheques.Text    := DMTE.cdsECRepo.FieldByName('ECNOCHQ').AsString ;
         dblcCheques.Enabled := False;
         dbdtpFEmis.Date     := DMTE.cdsECRepo.FieldByName('ECFEMICH').AsDateTime ;
         dbdtpFEmis.Enabled  := False;
         if dblcTMon.Text = DMTE.wTMonLoc then
            dbeImporte.Text  := Floattostr(DMTE.cdsECRepo.FieldByName('ECMTOLOC').AsFloat)
         else
            if dblcTMon.Text = DMTE.wTMonExt then
               dbeImporte.Text := Floattostr(DMTE.cdsECRepo.FieldByName('ECMTOEXT').AsFloat);
         dbeImporte.Enabled  := False;
      end
      else
         if DMTE.cdsECRepo.RecordCount >1 then
         begin
            dbeImporte.Enabled  := False;
            dbdtpFEmis.Enabled  := False;
            dblcCheques.Enabled := True;
            if (not edtCuenta.Focused) and (DMTE.cdsECRepo.RecordCount>1) then
               dblcCheques.SetFocus;

         end;

   end;

end;

procedure TFFondoFijo.RecuperaDescrip;
var
	 CLAUXID ,
	 AUXID   : sTRING ;
begin
		DMTE.DescripPagoVaProv(dblcCia.text,edtPeriodo.text,dblcTDiario.Text,dbeNoComp.text);
		DMTE.cdsDescrip.Active := False ;
		DMTE.cdsDescrip.Active := True ;
		edtTMon.text     := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('TMONABR'));
		edtBanco.text    := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('BANCOABR'));
		edtFormPago.text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('FPAGOABR'));
		if DMTE.cdsEmpleado.Locate('USERID',VARARRAYOF([DMTE.cdsEgrCaja.FIELDBYNAme('USERRESP').AsString ]),[]) then
		begin
			 CLAUXID  := DMTE.cdsEmpleado.FIELDBYNAME('CLAUXID').AsString   ;
			 AUXID    := DMTE.cdsEmpleado.FIELDBYNAME('AUXID').AsString   ;

		end ;
		edtCia.Text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('CIADES'));
      wCiaRetIGV:=(DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIARETIGV')='S') ;
		edtTDiario.Text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('TDIARABR')); ;
		if not DMTE.cdsDescrip.FieldByName('FLUEFEABR').isnull then
			 dbeFEfec.text := DMTE.cdsDescrip.FieldByName('FLUEFEABR').AsString ;

	 edtClase.text := DMTE.DisplayDescrip('prvTGE','TGE102','*','CLAUXCP='+quotedstr('B'),'CLAUXDES');
//	 edtClase.text  := DMTE.cdsQry.fieldByname('CLAUXDES').AsString;
end;

procedure TFFondoFijo.Adiciona;
var
   xSQL : String ;
begin
 //C�digo Nuevo
   IniciaDatos ;

   dblcCCBco.Selected.Clear;
   dblcCCBco.Selected.Add('CCBCOID'#9'25'#9'Cuenta Corriente del Banco'#9'F');
   dblcCCBco.Selected.Add('CCBCODES'#9'30'#9'Descripci�n'#9'F');
   dblcCCBco.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');

   edtCuenta.Enabled := False ;
   xGraboNuevo := False ;
   //Validacion Adicional

   //
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

   DMTE.cdsMovCxP.Filter := 'CIAID=''''' ;
   DMTE.cdsMovCxP.Filtered := True ;

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

   wModifica := False ;
//fin de nuevo c�digo
end;

procedure TFFondoFijo.Edita(Comp: structComprobante;cds : Twwclientdataset);
var
   xWhere ,
   xFiltro : String ;
   xSQL,sSQL : string;
begin
	IniciaDatos;
   cdsfiltro :=  cds ;
   with DMTE do
   begin
   dblcCia.Text      :=  cdsEgrCaja.FieldByName('CIAID').AsString;
   dblcTDiario.Text  :=  cdsEgrCaja.FieldByName('TDIARID').AsString;
   edtPeriodo.Text   :=  cdsEgrCaja.FieldByName('ECANOMM').AsString;
   dbeNoComp.Text    :=  cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
      // Asignar desde valores del registro activo
      dbdtpFComp.date  :=cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
      dblcClase.Text   :=cdsEgrCaja.FieldByName('CLAUXID').AsString;
      dblcdAux.Text    :=cdsEgrCaja.FieldByName('PROV').AsString;
      edtAuxRuc.Text   :=cdsEgrCaja.FieldByName('PROVRUC').AsString;
      dbeGiradoA.Text  :=cdsEgrCaja.FieldByName('ECGIRA').AsString;
      dblcTMon.Text    :=cdsEgrCaja.FieldByName('TMONID').AsString;
      dbeTCambio.Text  :=cdsEgrCaja.FieldByName('ECTCAMB').AsString;
      xTC              := cdsEgrCaja.FieldByName('ECTCAMB').AsFloat ;
      dbeImporte.Text  :=cdsEgrCaja.FieldByName('ECMTOORI').AsString;
      dblcBanco.Text   :=cdsEgrCaja.FieldByName('BANCOID').AsString;
      dblcCCBco.Text   :=cdsEgrCaja.FieldByName('CCBCOID').AsString;
      edtCuenta.Text   :=cdsEgrCaja.FieldByName('CUENTAID').AsString;
      dblcFormPago.Text:=cdsEgrCaja.FieldByName('FPAGOID').AsString;

      dbeLote.Text     :=cdsEgrCaja.FieldByName('ECLOTE').AsString;
      dblcdCnp.Text    :=cdsEgrCaja.FieldByName('CPTOID').AsString;
      dbeGlosa.Text    :=cdsEgrCaja.FieldByName('ECGLOSA').AsString;
      dblcdFEfec.Text  :=cdsEgrCaja.FieldByName('FLUEID').AsString ;
      dbdtpFEmis.date  :=cdsEgrCaja.FieldbyName('ECFEMICH').AsDateTime ;

      dbeFFijo.Text    :=cdsEgrCaja.FieldByName('ECNODOC').AsString ;
      wExit :=False;

  		if cdsEgrCaja.FieldByName('FDOFIJJUST').Value  ='S' then//Justif
      begin
         sSQL := ' SELECT * FROM CAJA302 '
              +'WHERE CIAID='''    + dblcCia.Text   +''' and '
              +      'CLAUXID='''  + dblcClase.Text +''' and '
              +      'PROV='''     + dblcdAux.Text  +''' and '
              +      'FPAGOID='''  + dblcFormPago.Text  +''' and '
              +      'EC_PROCE=''' +'1'+''' and ';
         if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
            sSQL:= sSQL +' ((COALESCE(ECMTOLOC,0)-COALESCE(ECCOBLOC,0))>0 OR (COALESCE(ECMTOEXT,0)-COALESCE(ECCOBEXT,0))>0)'
         else
            if (DMTE.SRV_D = 'ORACLE')  then
                sSQL:= sSQL +' ((NVL(ECMTOLOC,0)-NVL(ECCOBLOC,0))>0 OR (NVL(ECMTOEXT,0)-NVL(ECCOBEXT,0))>0)';
         DMTE.cdsECRepo.IndexFieldNames :='';
         DMTE.cdsECRepo.Filter   :='';
         DMTE.cdsECRepo.Filtered := False;
         DMTE.cdsECRepo.Close ;
         DMTE.cdsECRepo.DataRequest(sSQL);
         DMTE.cdsECRepo.Open ;
         wExit :=True;         

         dbeNoChq.Visible := False;
         dblcCheques.Visible := True;
         dblcCheques.Enabled := False;
         dblcCheques.Text    := cdsEgrCaja.FieldByName('ECNOCHQ').AsString;
         dbdtpFEmis.Enabled  := False;
         dbeImporte.Enabled  := False;

         rgJustif.ItemIndex:=1
      end
      else
    		 if cdsEgrCaja.FieldByName('FDOFIJJUST').Value  ='N' then//Reembolso
          begin
             dbeNoChq.Visible := True;
             dblcCheques.Visible := False;
             dblcCheques.Enabled := True;
             dbdtpFEmis.Enabled  := True;
             dbeImporte.Enabled  := True;
             rgJustif.ItemIndex:=0 ;
          end;

      wExit :=False;
      RecuperaDescrip ;
      ActivaFiltro('REGCXP');
      ActivaFiltro('DOCPAGO');

      if DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value='I' then//Si est� INCOMPLETO o PENDIENTE
      begin
         cdsEgrCaja.Edit;
         CambiaEstado ('I');
         dbgOtrosIButton.Enabled := True ;
         xWhere :=  'CIAID = ''' +dblcCia.Text  + ''' AND ' +
                    'CLAUXID = '+Quotedstr(dblcClase.Text) +' AND '+
                    'PROV = '+Quotedstr(dblcdAux.Text)     +' AND '+
                    'CPESTADO =' + '''' + 'P' + ''' ' ;

         xFiltro := ' (( (CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR '+
                    '   ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) '  ;

         DMTE.cdsMovCxP.Close;
         DMTE.cdsMovCxP.Datarequest('SELECT * FROM CXP301 WHERE ' + xWhere ) ;
         DMTE.cdsMovCxP.Open;
         DMTE.cdsMovCxP.Filter   := xFiltro ;
         DMTE.cdsMovCxP.Filtered := True ;
      end;

      if cdsEgrCaja.FieldByName('ECESTADO').Value='C' then      //Si est� CANCELADO
      begin
         CambiaEstado('C');

         xWhere := ' CIAID='+quotedstr(dblcCia.text)+ ' AND BANCOID='+Quotedstr(dblcBanco.Text)+
                    ' AND CCBCOID='+quotedstr(dblcCCBco.text);
         DMTE.DisplayDescrip('prvQry2','TGE106','CHQVOUCH',xWhere,'CHQVOUCH');
         if DMTE.cdsQry.FieldByName('CHQVOUCH').AsString<>'S' then
            Z2bbtChqVouch.Visible := False
         else
            Z2bbtChqVouch.Visible := True;


         dbgOtrosIButton.Enabled := False ;
         ActPnlBotones;
      end;

      if cdsEgrCaja.FieldByName('ECESTADO').Value='A' then      // Si esta ANULADO
      begin
         CambiaEstado('A');
         dbgOtrosIButton.Enabled := False ;
         ActPnlBotones;
      end;

      z2bbtnSumatClick(nil);
      z2bbtnSumatDocPagoClick(nil);
   end;
   z2bbtnOkCab.enabled:=false;
   z2bbtnNuevo.Visible := False ;
   z2bbtnCancel.Visible := False ;
   wModifica:=False;
end;

procedure TFFondoFijo.FormCreate(Sender: TObject);
begin
   DMTE.ASignaTipoDiario(dblcTDiario,self) ;
   setLength(A2digitos,1) ;
   setLength(A4digitos,1) ;
   A2digitos[0] := dbeImporte ;
   A4digitos[0] := dbeTcambio ;

   cdsConceptoC1 := TwwClientdataset.Create(Self) ;
   cdsConceptoC1.CloneCursor(DMTE.cdsCnpEgr ,True) ;
   cdsConceptoC1.Name := 'cdsConceptoC1' ;
   cdsConceptoC1.Filtered := True ;
   dblcdCnp2.LookupTable := cdsConceptoC1 ;

   cf1 := TControlFoco.Create ;
   DMTE.cdsFEfec.Filter := 'FLUEFE_IS = ''S'' ' ;
   DMTE.cdsFEfec.Filtered := True ;
end;

procedure TFFondoFijo.AdicIniciaDatos;
begin

   RecuperarCiaUnica(dblcCia,edtCia);
   edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
   if dblccia.Text<>'' then
      perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFFondoFijo.ActualizaSaldosCaja;
begin
    if trim(dblcCCBco.TEXT) <> '' then
    begin
       DMTE.ActSdoTlfn(dblcCia.Text,dblcBanco.text,dblcCCBCo.Text,
                      DMTE.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                      DBDTPfcOMP.DATE) ;
       DMTE.ActSdoMen(dblcBanco.text,dblcCCBCo.Text,
                      DMTE.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                      DBDTPfcOMP.DATE) ;
    end
    else
      with DMTE.cdsEgrCaja do
       DMTE.ActSdoCaja(FieldByName('TMONID').AsString , FieldByName('BANCOID').AsString ,
                      FieldByName('ECMTOORI').AsString ,FieldByName('ECFCOMP').AsString) ;

end;

procedure TFFondoFijo.ConfiguraAccesos;
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

procedure TFFondoFijo.Libera_Admin;
begin
    Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFFondoFijo.Libera_Consul;
begin

end;

procedure TFFondoFijo.Proc_Admin;
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

procedure TFFondoFijo.Proc_Consul;
begin
    pnlCabecera1.Enabled := False ;
    pnlCabecera2.Enabled := False ;
    pnlDeTalle.Enabled := True ;
    pnlBotones.Enabled := False ;
end;

procedure TFFondoFijo.LibConfigAccesos;
begin
		if DMTE.wAdmin = 'G' then
			 Libera_Admin
		else
		begin
			 if DMTE.wModo = 'C' then
					Libera_Consul ;
		end ;
end;

procedure TFFondoFijo.ValidaCabecera2;
begin
	 if length(dblcCia.Text)=0 then raise exception.Create('Falta Codigo de Compa�ia');
	 if length(edtCia.Text)=0 then raise exception.Create('Codigo de Compa�ia Errado');
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

//   if length(dblcTDoc.Text)=0 then raise exception.Create('Falta Tipo de Documento');
//   if length(edtTDoc.Text)=0 then raise exception.Create('Tipo de Documento Errado');
//   if length(dbeNoDoc.Text)=0 then raise exception.Create('Falta Nro.de Documento');

	 if length(dblcBanco.Text)=0 then raise exception.Create('Falta definir Banco');
	 if length(edtBanco.Text)=0 then raise exception.Create('Codigo de Banco Errado');

	 if dblcCCBco.Enabled=True then
	 begin
			if length(dblcCCBco.Text)=0 then raise exception.Create('Falta Cuenta Corriente Banco');
	 end;

	 if dblcFormPago.Enabled=True then
	 begin
			if length(dblcFormPago.Text)=0 then raise exception.Create('Falta Forma de Pago');
			if length(edtFormPago.Text)=0 then raise exception.Create('Codigo de Forma de Pago Errado');
	 end;

	 if (dbeNoChq.Enabled=True) and (length(dbeNoChq.Text)=0) then
			raise exception.Create('Falta No. de Cheque');

	 IF (dbeNoChq.Enabled=True) and (dbdtpFEmis.Date=0) then
	 begin
			dbdtpFEmis.SetFocus ;
			raise exception.create('Ingrese Fecha de Emisi�n del Cheque') ;
	 end ;

//YA NO ES OBLIGATORIO EL INGRESO DEL LOTE
//   if length(dbeLote.Text)=0 then raise exception.Create('Falta Lote');
   if length(dblcdCnp.Text)=0 then raise exception.Create('Falta Concepto');
   if rgJustif.ItemIndex =-1 then raise exception.Create('Ingrese Tipo de Justificaci�n de Fondo'); 

end;

procedure TFFondoFijo.Z2bbtnEmiChqClick(Sender: TObject);
var
   strChq : structChq ;
   ArchivoReporte,xSQL : string ;
   xTotal : double;
begin
   if trim(dblcCCBco.Text) <> '' then
   begin
      /////////////////////////////////////////
      xTotal :=0;
      xSQL:='Select SUM( MTORETLOC ) RETLOC, SUM( MTORETEXT ) RETEXT '
           +'from CNT320 '
           +'WHERE CIAID='''   + DMTE.cdsEgrcaja.FieldByName('CIAID').AsString    +''' AND '
           +      'ANOMM='''   + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString  +''' AND '
           +      'TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString  +''' AND '
           +      'ECNOCOMP='''+ DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString +''' AND '
           +      '( DOCID2 IS NULL OR DOCID2='''' ) ';
      DMTE.cdsQry4.IndexFieldNames:='';
      DMTE.cdsQry4.Filter   :='';
      DMTE.cdsQry4.Filtered := False;
           
      DMTE.cdsQry4.Close;
      DMTE.cdsQry4.Datarequest( xSQL );
      DMTE.cdsQry4.Open;

      if dblcTMon.Text = DMTE.wTMonLoc then
         xTotal:= DMTE.FRound(strtoFloat(dbeImporte.Text)-DMTE.cdsQry4.FieldByName('RETLOC').AsFloat,15,2)
      else
         if dblcTMon.Text = DMTE.wTMonExt then
            xTotal:= DMTE.FRound(strtoFloat(dbeImporte.Text)-DMTE.cdsQry4.FieldByName('RETEXT').AsFloat,15,2);
      /////////////////////////////////////////

        DMTE.RecuperarDatos('TGE106','*',
                           'BANCOID = ''' + dblcBanco.text+ ''' AND CCBCOID = ''' + dblcCCBco.Text+ '''') ;
        ArchivoReporte  := DMTE.cdsRec.FieldByName('CCFMTCHQ').ASString ;
        with strChq do
        begin
          ppFileName    := ArchivoReporte                                             ;
          ppGiradoA     := dbeGiradoA.Text                                            ;
//          ppImporte     := floattostrf(strtocurr(trim(dbeImporte.Text)),fffixed,10,2) ;
			  ppImporte     := floattostrf(strtocurr(Floattostr(xTotal)),fffixed,10,2) ;
          ppMontoLetras := strNum(strtofloat(ppImporte))                              ;
          ppDia         := strDia(dbdtpFEmis.Date)                                    ;
          ppmes         := strMes(dbdtpFEmis.Date)                                    ;
          ppAno         := strAno(dbdtpFEmis.Date)                                    ;
          If dblcCCBco.Text <> '0100001518' then
           ppRuc         := xRUCCIA;
        end ;
        FRegistro.EmiteChq(ArchivoReporte, strChq);
   end
   else
   begin
      Showmessage('No ha seleccionado Cuenta Corriente') ;
   end ;

end;

procedure TFFondoFijo.dbdtpFEmisEnter(Sender: TObject);
begin
   strTmp := dbdtpFEmis.Text ;
end;

procedure TFFondoFijo.dbdtpFEmisExit(Sender: TObject);
begin
   if (dbdtpFEmis.Text <> strTmp) and (dbdtpFEmis.Date <> 0) then
   begin
      dbeTcambio.Text := floattostrf(strtofloat(DMTE.RecuperarTipoCambio(dbdtpFEmis.Date)),fffixed,10,4) ;
   end ;
end;

procedure TFFondoFijo.dbeTCambioEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFFondoFijo.dbeImporteEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFFondoFijo.dbeImporteExit(Sender: TObject);
begin
    if strTmp <> TCustomEdit(Sender).text then
    begin
       TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text) ;
    end ;
end;

procedure TFFondoFijo.dbeTCambioExit(Sender: TObject);
begin
   if strTmp <> TCustomEdit(Sender).text then
   begin
      TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text,4) ;
   end ;
end;

procedure TFFondoFijo.SaldosAux;
var
   Previo ,
   Actual ,
   xClase : String ;
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
         xClase := FieldBYname('CLAUXID').AsString ;
//         xClase := BuscaClase ;
         if Actual <> Previo then
         begin
            Opera( Actual ,xClase ,cdsclone) ;
         end ;
         Previo := Actual ;
         Next ;
       end;
       IndexFieldNames := '' ;
       EnableControls ;
       cdsClone.free ;
    end ;
end;

procedure TFFondoFijo.Opera(xProv , xClase : string;cdsClone : TwwClientDataSet) ;
var
   xFiltro : string          ;
   xDEMTOLOC ,
   xDEMTOEXT : Currency      ;
   xDatAux : structSaldosAux ;
   xMTOSLOC ,
   xMTOSEXT : Currency       ;
begin
   xMTOSLOC := 0;
   xMTOSEXT := 0;

   xFiltro  := 'CLAUXID = ''' + xClase + ''' AND PROV = ''' + xProv + '''' ;
   cdsclone.CloneCursor(DMTE.cdsDocPago,true) ;
   //Calculo de Montos Locales
   cdsclone.Filter   := xfiltro +' AND TMONID= '''+DMTE.wTMonLoc+'''' ;
   cdsclone.Filtered := true   ;
   if cdsClone.RecordCount <> 0 then
   begin
      cdsClone.First ;
      while not cdsClone.Eof do
      begin
          if ( cdsclone.FieldByName('TMONID').asstring <> dblctmon.Text ) then
          begin
             xMTOSLOC := Redondea( cdsclone.FieldByName('DEMTOEXT').AsFloat) *
                         ( cdsclone.FieldByName('DETCDOC').AsFloat )
          end
          else
             xMTOSLOC := xMTOSLOC + cdsclone.FieldByName('DEMTOLOC').AsFloat ;
          cdsClone.Next ;
      end;
   end
   else
     xMTOSLOC := 0 ;
   //calculo de Montos Extranjeros
   cdsclone.Filter   := xfiltro +' AND TMONID= '''+DMTE.wTMonExt+'''' ;
   cdsclone.Filtered := true   ;
   if cdsClone.RecordCount <> 0 then
   begin
      while cdsClone.Eof do
      begin
          if ( cdsclone.FieldByName('TMONID').asstring <> dblctmon.Text ) then
          begin
             xMTOSext := Redondea( cdsclone.FieldByName('DEMTOLOC').AsFloat) /
                         ( cdsclone.FieldByName('DETCDOC').AsFloat )
          end
          else
             xMTOSEXT := xMTOSEXT + cdsclone.FieldByName('DEMTOEXT').AsFloat ;
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

function TFFondoFijo.BuscaClase: String;
var
  cds : TwwClientDataset ;
begin
  cds := TwwClientDataset.Create( self ) ;
  cds.CloneCursor(DMTE.cdsMovCxP , True ) ;
  if cds.Locate('CIAID;CPANOMES;TDIARID;CPNOREG',
                 VarArrayOf([DMTE.cdsDocPago.FieldByName ('CIAID').AsString ,
                             DMTE.cdsDocPago.FieldByName ('CPANOMM').AsString ,
                             DMTE.cdsDocPago.FieldByName ('TDIARID2').AsString ,
                             DMTE.cdsDocPago.FieldByName ('CPNOREG').AsString]) , []) then
  begin
    Result := cds.FieldBYname('CLAUXID').AsString ;
  end
  else
  begin
    Result := '' ;
  end ;
end;

procedure TFFondoFijo.dblcTDoc2Exit2(Sender: TObject);
var
   Filtro : String ;
begin
   if z2bbtnCancel3.Focused then exit;

   edtTDoc2.text:= DMTE.DisplayDescripLocal(DMTE.cdsTDoc,'DOCID',dblcTDoc2.Text,'DOCDES') ;

   if edtTDoc2.Text='' then begin
      ShowMessage('Error : Tipo de Documento no Valido');
      dblcTDoc2.SetFocus;
      Exit;
   end;
end;


procedure TFFondoFijo.RecCptosDifC;
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
    wCptoGan  := DMTE.cdsRec.FieldByName('CPTODIFG').AsString ;
    wCptoPer  := DMTE.cdsRec.FieldByName('CPTODIFP').AsString ;
    wCtaGan   := DMTE.cdsRec.FieldByName('CTADIFG').AsString ;
    wCtaPer   := DMTE.cdsRec.FieldByName('CTADIFP').AsString ;
    wCCosDif  := DMTE.cdsRec.FieldByName('CCOSDIF').AsString ;
end;

procedure TFFondoFijo.dblcClaseDetExit(Sender: TObject);
var
   sSQL: String;
begin
	 if z2bbtnCancel3.focused then exit;
   if dblcdCnp2.Focused then exit;

   edtClaseDet.text:= DMTE.DisplayDescripLocal(DMTE.cdsClaseAux,'CLAUXID',dblcClaseDet.Text,'CLAUXDES') ;

   if edtClaseDet.Text='' then begin
      dblcdAuxDet.Text := '' ;
      dbeAuxDet.Text := '' ;
      ShowMessage('Error : Clase de Auxiliar no Valido');
      dblcClaseDet.SetFocus;
      Exit;
   end;

	 sSQL:='Select AUXID,AUXRUC,AUXNOMB from CNT201 Where CLAUXID='''+dblcClaseDet.Text+'''';
	 DMTE.cdsProv.Close;
	 DMTE.cdsProv.DataRequest( sSQL );
	 DMTE.cdsProv.Open;
end;

procedure TFFondoFijo.dblcdAuxExit2(Sender: TObject);
begin
	 if z2bbtnCancel3.Focused then exit;
	 if dblcClaseDet.Focused then Exit;

   dbeAuxDet.text:= DMTE.DisplayDescripLocal(DMTE.cdsProv,'AUXID',dblcdAuxDet.Text,'AUXNOMB') ;

	 if dbeAuxDet.Text='' then begin
			ShowMessage('Error : Auxiliar no Valido');
      dblcdAuxDet.SetFocus;
      Exit;
   end;
end;

procedure TFFondoFijo.dblcdCnp2Exit2(Sender: TObject);
var
	 ssql,xWhere : String;
begin
	 if z2bbtnCancel3.Focused then exit;
	 if dblcTDoc2.Focused then exit;

	 edtCnp2.text:= DMTE.DisplayDescripLocal(cdsConceptoC1,'CPTOID',dblcdCnp2.Text,'CPTODES') ;

	 if edtCnp2.Text='' then begin
			DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString := '' ;
			dblcdAuxDet.Enabled := False ;
			dblcdCCosto.Enabled := False ;
			ShowMessage('Error : Concepto no Valido');
			dblcdCnp2.SetFocus;
			Exit;
	 end;

	 DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString:=cdsConceptoC1.FieldByname('CUENTAID').AsString;
	 DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString :=edtCnp2.text;

	 xWhere:='CIAID='''+dblcCia.Text+''' AND CUENTAID='''+DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString+'''';

	 DMTE.DisplayDescrip('prvTGE','TGE202','CUENTAID, CTA_CCOS, CTA_AUX',xWhere,'CuentaId');

	 if DMTE.cdsQry.FieldByName('CTA_AUX').AsString='S' then
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

	 if DMTE.cdsQry.FieldByName('CTA_CCOS').AsString='S' then
	 begin
			ssql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
			DMTE.cdsCCosto.Close;
			DMTE.cdsCCosto.DataRequest(ssql);
			DMTE.cdsCCosto.open;
			dblcdCCosto.Enabled:=true;
	 end
	 else begin
			DMTE.cdsRegCxP.FieldByName('CCOSID').AsString := '' ;
			dblcdCCosto.Enabled := False ;
	 end;

	 if DMTE.cdsQry.FieldByName('CTA_AUX').AsString='S' then
	 begin
			dblcClaseDet.SetFocus;
	 end
	 else begin
			if DMTE.cdsQry.FieldByName('CTA_CCOS').AsString='S' then
			begin
				 dblcdCCosto.SetFocus;
			end;
	 end;

end;

procedure TFFondoFijo.wwDBEdit1Change22(Sender: TObject);
begin
		wModifica := True;
end;
procedure TFFondoFijo.FormDestroy(Sender: TObject);
begin
   cf1.Free ;
end;

procedure TFFondoFijo.dblcdFEfecEnter(Sender: TObject);
begin
   strTmp := dblcdFEfec.Text ;
end;

procedure TFFondoFijo.dblcdFEfecExit(Sender: TObject);
begin
//Validacion
  if trim(TCustomEdit(Sender).Text) <> strTmp then
  begin
     if trim(TCustomEdit(Sender).Text) <> '' then
     begin
        if DMTE.RecuperarDatos('TGE217','FLUEFEABR','FLUEFEID=''' + TCustomEdit(Sender).Text + ''' ') then
        begin
          dbeFEfec.Text := DMTE.cdsRec.FieldByName('FLUEFEABR').AsString ;
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

procedure TFFondoFijo.ActDetCaja;
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
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value ;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value ;
        end
        else
        begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value * DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value ;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value ;
        end ;
        DMTE.cdsRegCxP.Next;
      end ;
      DMTE.cdsRegCxP.First ;
      DMTE.cdsRegCxP.EnableControls ;
   end ;
   xTC := strtocurr( dbeTCambio.Text ) ;
end;

procedure TFFondoFijo.ActDetCxP ;
var
   evt1 : TFieldNotifyEvent ;
   evt2 : TFieldNotifyEvent ;
   evt3 : TFieldNotifyEvent ;
begin
   evt1 := DMTE.cdsDocPago.FieldByName('DEMTOLOC').OnChange ;
   evt2 := DMTE.cdsDocPago.FieldByName('DEMTOEXT').OnChange ;
   evt3 := DMTE.cdsDocPago.FieldByName('DETCPAG').OnChange ;

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
               cdsDocPago.FieldByName('DESALEXT').Value:=cdsDocPago.FieldByName('DESALLOC').AsFloat / cdsDocPago.FieldByName('DETCPAG').AsFloat ;
               cdsDocPago.FieldByName('DEMTOEXT').Value:=cdsDocPago.FieldByName('DEMTOLOC').AsFloat / cdsDocPago.FieldByName('DETCPAG').AsFloat ;
            end
            else
            begin
               cdsDocPago.FieldByName('DESALLOC').Value:=cdsDocPago.FieldByName('DESALEXT').AsFloat * cdsDocPago.FieldByName('DETCPAG').AsFloat ;
               cdsDocPago.FieldByName('DEMTOLOC').Value:=cdsDocPago.FieldByName('DEMTOEXT').AsFloat * cdsDocPago.FieldByName('DETCPAG').AsFloat ;
            end ;
         end ;
        DMTE.cdsDocPago.Next;
      end ;
      DMTE.cdsDocPago.FieldByName('DEMTOLOC').OnChange := evt1 ;
      DMTE.cdsDocPago.FieldByName('DEMTOEXT').OnChange := evt2 ;
      DMTE.cdsDocPago.FieldByName('DETCPAG').OnChange  := evt3 ;

      DMTE.cdsDocPago.First ;
      DMTE.cdsDocPago.EnableControls ;
      xTC := strtocurr( dbeTCambio.Text ) ;
   end ;
end;

procedure TFFondoFijo.ActualizaFiltro;
begin
    if z2bbtnNuevo.Visible then
    begin
       if not xGraboNuevo then
          cdsFiltro.Append ;
       DMTE.ActualizaCDS(DMTE.cdsEgrCaja,cdsFiltro) ;
    end
    else
    begin
       DMTE.ActualizaCDS(DMTE.cdsEgrCaja,cdsFiltro) ;
    end ;
    xGraboNuevo := True ;
end;

procedure TFFondoFijo.AsignaCDSFiltro(cds: TwwClientDataset);
begin
    cdsFiltro := cds ;
end;

procedure TFFondoFijo.ActualizaDetCanje;
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
   if DMTE.cdsDetCanjeCxP.ApplyUpdates(0) >0 then
      Raise Exception.create ('Falla en la grabaci�n del 305') ;
	 DMTE.cdsDetCanjeCxP.Close ;

end;

procedure TFFondoFijo.Buscar1Click(Sender: TObject);
begin
  lkdCxP.LookupTable := DMTE.cdsMovCxP ;
  lkdCxP.Execute ;
end;

procedure TFFondoFijo.lkdCxPCloseDialog(Dialog: TwwLookupDlg);
begin
	 lkdCxP.LookupTable := nil ;
end;

procedure TFFondoFijo.lkdCxPInitDialog(Dialog: TwwLookupDlg);
begin
    Dialog.wwDBGrid1.TitleLines := 2 ;
    Dialog.wwDBGrid1.Selected.clear ;
    Dialog.wwDBGrid1.Selected.Assign( dbgPendientes.Selected ) ;
end;

procedure TFFondoFijo.z2bbtnCancel3Click(Sender: TObject);
begin
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


procedure TFFondoFijo.dblcCCBcoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFFondoFijo.z2bbtnOK2Click(Sender: TObject);
begin
   // VALIDA LA CUENTA DEL CONCEPTO
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,dblcdCnp2.text,'')) and (dblcTMon2.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+DMTE.cdsQry.FieldByName('CUENTAID').AsString+' del Concepto '+dblcdCnp2.text+' Se registra s�lo en Moneda Extranjera.');
   end;

	DMTE.cdsRegCxP.Post;

   SpeedButton1Click( Sender );

   AdicionarREgistros;
end;

procedure TFFondoFijo.dbeNoRegExit(Sender: TObject);
begin
   if z2bbtnCancel3.Focused then Exit;

   dbeNoReg.Text:=DMTE.strzero(dbeNoReg.Text,10);
   if strtoint(dbeNoReg.Text)=0 then
   begin     // NoRegistro
      dbeNoReg.Text:='';
      ShowMessage('No es valido el No Registro');
      dbeNoReg.SetFocus;
      exit;
   end;
   DMTE.cdsRegCxP.FieldByName('CPNOREG').Value  := dbeNoReg.Text;
end;

procedure TFFondoFijo.dbeImporte2Exit(Sender: TObject);
var aux,xWhere:string;
begin
   if  z2bbtnCancel3.Focused then exit;
   if Length(trim(dbeImporte2.Text))=0 then
      dbeImporte2.Text := '0';

   if strtoFloat(dbeImporte2.Text)<=0 then
   begin
      dbeImporte2.Text := '';
      dbeImporte2.SetFocus;
      raise exception.create('Ingrese un monto mayor/igual a 0 ');
   end;
   xWhere:='TMONID='+''''+DMTE.cdsRegCxP.FieldByName('TMONID').Value+'''';
   aux:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
   if (length(aux)>0) and (DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value>0) then begin
      if DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc then begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value/DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
      end
      else begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value*DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
      end;
   end
   else begin
      DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=0;
      DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=0;
   end;
end;

procedure TFFondoFijo.dblcTMon2Exit(Sender: TObject);
var
   aux,xWhere: string;
begin
   if z2bbtnCancel3.Focused then exit;

   edtTMon2.text:= DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMon2.Text,'TMONDES') ;

   if edtTMon2.Text='' then begin
      ShowMessage('Error : Moneda no V�lida');
      dblcTMon2.SetFocus;
      Exit;
   end;

   xWhere:='TMONID='+''''+DMTE.cdsRegCxP.FieldByName('TMONID').Value+'''';
   aux:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
   if (length(aux)>0) and (DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value>0) then begin
      if DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc then begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value/DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
      end
      else begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value*DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
      end;
   end
   else begin
      DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=0;
      DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=0;
   end;

end;

procedure TFFondoFijo.SpeedButton1Click(Sender: TObject);
Var
   xRegAct : TBookMark;
   xMtoLoc, xMtoExt: Currency ;
begin
      DMTE.cdsDocPago.DisableControls;
      xRegAct := DMTE.cdsDocPago.GetBookmark;
      xMtoLoc := 0;
      xMtoExt := 0;
      DMTE.cdsDocPago.First ;
      While not DMTE.cdsDocPago.Eof do
      Begin
         xMtoLoc := xMtoLoc + strToCurr( stringReplace(DMTE.cdsDocPago.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) ) ;
         xMtoExt := xMtoExt + strToCurr( stringReplace(DMTE.cdsDocPago.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) ) ;
         DMTE.cdsDocPago.Next;
      end;
      DMTE.cdsDocPago.GotoBookmark(xRegAct);
      DMTE.cdsDocPago.FreeBookmark(xRegAct);
      DMTE.cdsDocPago.EnableControls;

      DMTE.cdsRegCxP.DisableControls;
      xRegAct := DMTE.cdsRegCxP.GetBookmark;
      DMTE.cdsRegCxP.First ;
      While not DMTE.cdsRegCxP.Eof do
      Begin
         xMtoLoc := xMtoLoc + strToCurr( stringReplace(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) ) ;
         xMtoExt := xMtoExt + strToCurr( stringReplace(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) ) ;
         DMTE.cdsRegCxP.Next;
      end;
			DMTE.cdsRegCxP.GotoBookmark(xRegAct);
			DMTE.cdsRegCxP.FreeBookmark(xRegAct);
			DMTE.cdsRegCxP.EnableControls;

			dbeTotalMN.Text:=floattostrf(xMtoLoc, ffFixed, 10, 2);
			dbeTotalME.Text:=floattostrf(xMtoExt, ffFixed, 10, 2);

end;

procedure TFFondoFijo.dblcdAuxExit(Sender: TObject);
var
	 xWhere : String;
begin
	 xWhere := 'CLAUXID='''+dblcClase.text+''' and AUXID='+quotedstr(dblcdAux.text);
	 edtAuxRUC.text := DMTE.DisplayDescrip('prvTGE','CNT201','AUXRUC,AUXGIRA,AUXNOMB,AUXDIR',xWhere,'AUXRUC');
	 dbeGiradoA.Text := DMTE.cdsQry.FieldByName('AUXNOMB').Asstring;

	 if trim( dbeGiradoA.Text )='' then begin
			ShowMessage( 'Responsable de fondo Fijo no definido' );
			dblcdAux.SetFocus;
	 end;

end;

procedure TFFondoFijo.dbeTCExit(Sender: TObject);
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
   z2bbtnSumatclick(nil);
end;

procedure TFFondoFijo.dbeMPLExit(Sender: TObject);
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
      xMonto := DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat;
      xSaldo := DMTE.cdsDocPago.fieldbyName('DESALLOC').asFloat;
   end ;

   if DMTE.FRoundwmc(xMonto ) > DMTE.FRoundwmc ( xSaldo ) then
   begin
      ShowMessage('Monto excede a Saldo Actual');
      DMTE.cdsDocPago.Edit;
      DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat:=DMTE.cdsDocPago.fieldbyName('DESALLOC').asFloat;
      DMTE.cdsDocPago.fieldbyName('DEMTOEXT').asFloat:=DMTE.cdsDocPago.fieldbyName('DESALEXT').asFloat;
   end
   else
   begin
      DMTE.cdsDocPago.fieldbyName('DEMTOEXT').asFloat:=DMTE.FRound( DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat / DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
   end;
   z2bbtnSumatclick(nil);
end;

procedure TFFondoFijo.dbeMPEExit(Sender: TObject);
var
   xMonto : double ;
   xSaldo  : double ;
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

   if DMTE.FRoundwmc(xMonto ) > DMTE.FRoundwmc ( xSaldo ) then
   begin
      ShowMessage('Monto excede a Saldo Actual');
      DMTE.cdsDocPago.Edit;
      DMTE.cdsDocPago.FieldByName('DEMTOEXT').asFloat:=DMTE.cdsDocPago.FieldByName('DESALEXT').asFloat;
      DMTE.cdsDocPago.FieldByName('DEMTOLOC').asFloat:=DMTE.cdsDocPago.FieldByName('DESALLOC').asFloat;
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
   z2bbtnSumatclick(nil);
end;

procedure TFFondoFijo.dbgPendientesTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   pnlBusca.Visible := True;
   isBusca.SearchField := AFieldName;
   isBusca.SetFocus;
end;

procedure TFFondoFijo.isBuscaExit(Sender: TObject);
begin
   pnlBusca.Visible:=False;
end;

procedure TFFondoFijo.dblcdAuxDetEnter(Sender: TObject);
begin
	 if dblcClaseDet.Text='' then
			dblcdAuxDet.SetFocus;
end;

procedure TFFondoFijo.Z2bbtnRetencionClick(Sender: TObject);
var
   xSQL : String;
   x10  : Integer;
begin
   xSQL:='Select A.*, C.DOCABR DOCDESC, B.AUXNOMB, D.CIADES, D.CIARUC '
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
      ShowMessage('No Existe Retenci�n');
      Exit;
   end;
   DMTE.cdsRetencion.IndexFieldNames := 'RETNUMERO;CLAUXID;AUXID';;
	 pprRetencion.TEMPLATE.FileName:=DMTE.wRutaCNT + '\Retenciones.rtm';
	 pprRetencion.template.LoadFromFile ;
   //ppDesigner1.Show;

   pprRetencion.Print;
   pprRetencion.Stop;

	 x10:=DMTE.ComponentCount-1;
	 while x10>0 do begin
	 	 if DMTE.components[x10].classname='TppGroup' then begin
	 			DMTE.components[x10].free;
	 	 end;
	 	 x10:=x10-1;
	 end;
end;

procedure TFFondoFijo.Contab_DifCamDocPago_Retencion( xRLH, xRLD : Double);
var
 xMONID_PROV,xWhere,xsql,xsql1 : string;
begin
   xWhere:=' CIAID='''   +DMTE.cdsDocPago.FieldByName('CIAID').AsString   +''' and '
          +' CPANOMES='''+DMTE.cdsDocPago.FieldByName('CPANOMM').AsString +''' and '
          +' TDIARID=''' +DMTE.cdsDocPago.FieldByName('TDIARID2').AsString+''' and '
          +' CPNOREG=''' +DMTE.cdsDocPago.FieldByName('CPNOREG').AsString +''' '  ;

   if DMTE.RecuperarDatos( 'CXP301' , 'TMONID,TCANJEID,CPNOGRAV' , xWhere ) then
      xMONID_PROV := DMTE.cdsRec.FieldByName('TMONID').AsString
   else
			Showmessage('Error en la recuperaci�n del documento - WMC');

   xsql := 'TMONID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('TMONID').AsString);
   xsql1 := 'TMONID='+quotedstr(DMTE.cdsDocPago.FieldByName('TMONID').AsString);
   If (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') or
      (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then
    begin
//   if (DMTE.cdsRec.FieldByName('TCANJEID').AsString='LE') AND (DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat>0) then
   if (DMTE.cdsRec.FieldByName('TCANJEID').AsString='LE') AND (xRLH>0) then
//     if DMTE.cdsDocPago.FieldByName('DETCDOC').Value <> DMTE.cdsDocPago.FieldByName('DETCPAG').Value then
     if xRLH<>xRLD then
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
        {
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
            xMTOCNTLOC := DMTE.FRound( xRLH-xRLD,15,2 )
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
         }
        xMTOCNTLOC:=DMTE.FRound( xRLH-xRLD,15,2 );
        xMTOCNTEXT:=0;

        if xRLH>=xRLD then begin
           DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
           xMTOCNTLOC:=DMTE.FRound( xRLH-xRLD,15,2 );
        end
        else begin
           DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
           xMTOCNTLOC:=DMTE.FRound( xRLD-xRLH,15,2 );
        end;

        xMTOCNTEXT:=0;
        DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xMTOCNTLOC;
        DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
        DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat  := xMTOCNTLOC;

        if DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'D' then
        begin
           DMTE.cdsCntCaja.FieldByName('CPTOID').Value    := wCptoPer;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').Value  := wCtaPer;
           DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Dif. Cambio Retencion';
        end
        else
        begin
           DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
           DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Dif. Cambio Retencion';
        end;
      end
    end;
end;

procedure TFFondoFijo.Contab_DocPago_Retencion_Debe(xRL,xRE,xRO:double);
var
 xwhere, XsqL : string;
begin
{   xWhere:=' CIAID='''   +DMTE.cdsDocPago.FieldByName('CIAID').AsString   +''' and '
          +' CPANOMES='''+DMTE.cdsDocPago.FieldByName('CPANOMM').AsString +''' and '
          +' TDIARID=''' +DMTE.cdsDocPago.FieldByName('TDIARID2').AsString+''' and '
          +' CPNOREG=''' +DMTE.cdsDocPago.FieldByName('CPNOREG').AsString +''' '  ;

   if DMTE.RecuperarDatos( 'CXP301' , 'TMONID,TCANJEID,CPNOGRAV,PROVDES,CPGRAVAD,CPIGV' , xWhere ) then
      xMONID_PROV := DMTE.cdsRec.FieldByName('TMONID').AsString
   else
			Showmessage('Error en la recuperaci�n del documento - WMC');
   if (DMTE.cdsRec.FieldByName('TCANJEID').AsString='LE') AND (DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat>0) then
   begin
     DMTE.cdsCntCaja.FieldByName('CIAID').Value   := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
     DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
     DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
     DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:= DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
     DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  := 'CXP';
     DMTE.cdsCntCaja.FieldByName('DOCID').Value   := DMTE.cdsDocPago.FieldByName('DOCID2').Value;
     DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
     DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
     DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsDocPago.FieldByName('CPFEMIS').Value;
     DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:= DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value;
     DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CPTODES,CUENTAID','CPTOIS=''T''','CPTOID');
     DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
     DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString+' '+DMTE.cdsRec.FieldByName('PROVDES').AsString;
     DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value;
     DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;
     DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'D';
     DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:= DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
     DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:= DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
     DMTE.cdsCntCaja.FieldByName('TMONID').Value  := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

     if dblcTMon.Text=DMTE.wTMonLoc then
     begin
       if xMONID_PROV = dblcTMon.Text then
       begin
         xMTOCNTLOC:=DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2 ) ;
         xMTOCNTEXT:=DMTE.FRound(DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat / DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2 ) ;
       end
       else
       begin
         xMTOCNTEXT := DMTE.FRound( DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2 ) ;
         xMTOCNTLOC := DMTE.FRound( DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2 ) ;
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
         xMTOCNTLOC := DMTE.FRound( DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2 );
       end
       else
       begin
         xMTOCNTLOC:=DMTE.FRound( DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat,15,2 ) ;
         xMTOCNTEXT:=DMTE.FRound( DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat / DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2 );
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
     xNReg:=xNReg+1;
     DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
   end
   else
   begin // NO SON LETRAS
     DMTE.cdsCntCaja.FieldByName('CIAID').Value   := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
     DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
     DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
     DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:= DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
     DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  := 'CXP';
     DMTE.cdsCntCaja.FieldByName('DOCID').Value   := DMTE.cdsDocPago.FieldByName('DOCID2').Value;
     DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
     DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
     DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsDocPago.FieldByName('CPFEMIS').Value;
     DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:= DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value;
     DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CPTODES,CUENTAID','CPTOIS=''R''','CPTOID');
     DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
     DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString+' '+DMTE.cdsRec.FieldByName('PROVDES').AsString;
     DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value;
     DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;
     DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'D';
     DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:= DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
     DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:= DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
     //DMTE.cdsCntCaja.FieldByName('TMONID').Value:= DMTE.cdsDocPago.FieldByName('TMONID').Value;
     DMTE.cdsCntCaja.FieldByName('TMONID').Value  := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

     if dblcTMon.Text=DMTE.wTMonLoc then
     begin
       if xMONID_PROV = dblcTMon.Text then
       begin
         xMTOCNTLOC:=DMTE.FRound(DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat,15,2 ) ;
         xMTOCNTEXT:=DMTE.FRound((DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat)/ DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2 ) ;
       end
       else
       begin
         xMTOCNTEXT := DMTE.FRound(DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat,15,2 ) ;
         xMTOCNTLOC := DMTE.FRound((DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat)* DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2 ) ;
       end;
       DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value   := xMTOCNTLOC;
       DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value    := xMTOCNTLOC;
       DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
     end
     else
     begin
       if xMONID_PROV = dblcTMon.Text then
       begin
         xMTOCNTEXT := DMTE.FRound( DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat,15,2 ) ;
         xMTOCNTLOC := DMTE.FRound( (DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat) * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2 );
       end
       else
       begin
         xMTOCNTLOC:=DMTE.FRound(DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat,15,2 ) ;
         xMTOCNTEXT:=DMTE.FRound((DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat)/ DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2 );
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
     xNReg:=xNReg+1;
     DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
   end;}

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
     DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString+' '+DMTE.cdsDocPago.FieldByName('PROVDES').AsString;
     DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value;
     DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;
     DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'D';
     DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:= DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat; //DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
     DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:= DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat; //DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
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

procedure TFFondoFijo.Contab_DocPago_Retencion_Haber(xRL,xRE,xRO:double);
var
 xwhere, XsqL : string;
begin
{   xWhere:=' CIAID='''   +DMTE.cdsDocPago.FieldByName('CIAID').AsString   +''' and '
          +' CPANOMES='''+DMTE.cdsDocPago.FieldByName('CPANOMM').AsString +''' and '
          +' TDIARID=''' +DMTE.cdsDocPago.FieldByName('TDIARID2').AsString+''' and '
          +' CPNOREG=''' +DMTE.cdsDocPago.FieldByName('CPNOREG').AsString +''' '  ;

   if DMTE.RecuperarDatos( 'CXP301' , 'TMONID,TCANJEID,CPNOGRAV,PROVDES,CPGRAVAD,CPIGV' , xWhere ) then
      xMONID_PROV := DMTE.cdsRec.FieldByName('TMONID').AsString
   else
			Showmessage('Error en la recuperaci�n del documento - WMC');
   if (DMTE.cdsRec.FieldByName('TCANJEID').AsString='LE') AND (DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat>0) then
   begin
     DMTE.cdsCntCaja.FieldByName('CIAID').Value   := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
     DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
     DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
     DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:= DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
     DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  := 'CXP';
     DMTE.cdsCntCaja.FieldByName('DOCID').Value   := DMTE.cdsDocPago.FieldByName('DOCID2').Value;
     DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
     DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
     DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsDocPago.FieldByName('CPFEMIS').Value;
     DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:= DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value;
     DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CPTODES,CUENTAID','CPTOIS=''T''','CPTOID');
     DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
     DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString+DMTE.cdsRec.FieldByName('PROVDES').AsString;
     DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value;
     DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;
     DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'H';
     DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:= DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
     DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:= DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
     //DMTE.cdsCntCaja.FieldByName('TMONID').Value:= DMTE.cdsDocPago.FieldByName('TMONID').Value;
     DMTE.cdsCntCaja.FieldByName('TMONID').Value  := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

     if dblcTMon.Text=DMTE.wTMonLoc then
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
   else
   begin  // no son letras
     DMTE.cdsCntCaja.FieldByName('CIAID').Value   := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
     DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
     DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
     DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:= DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
     DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  := 'CXP';
     DMTE.cdsCntCaja.FieldByName('DOCID').Value   := DMTE.cdsDocPago.FieldByName('DOCID2').Value;
     DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
     DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
     DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsDocPago.FieldByName('CPFEMIS').Value;
     DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:= DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value;
     DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CPTODES,CUENTAID','CPTOIS=''T''','CPTOID');
     DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
     DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString+DMTE.cdsRec.FieldByName('PROVDES').AsString;
     DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value;
     DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;
     DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'H';
     DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:= DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
     DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:= DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
     //DMTE.cdsCntCaja.FieldByName('TMONID').Value:= DMTE.cdsDocPago.FieldByName('TMONID').Value;
     DMTE.cdsCntCaja.FieldByName('TMONID').Value  := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

     if dblcTMon.Text=DMTE.wTMonLoc then
     begin
       if xMONID_PROV = dblcTMon.Text then
       begin
         xMTOCNTLOC:=DMTE.FRound(DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat,15,2 ) ;
         xMTOCNTEXT:=DMTE.FRound((DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat)/ DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 ) ;
       end
       else
       begin
         xMTOCNTEXT := DMTE.FRound( DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat,15,2 ) ;
         xMTOCNTLOC := DMTE.FRound( (DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat) * DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 ) ;
       end;
       DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value   := xMTOCNTLOC;
       DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value    := xMTOCNTLOC;
       DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
     end
     else
     begin
       if xMONID_PROV = dblcTMon.Text then
       begin
         xMTOCNTEXT := DMTE.FRound( DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat,15,2 ) ;
         xMTOCNTLOC := DMTE.FRound( (DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat) * DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 );
       end
       else
       begin
         xMTOCNTLOC:=DMTE.FRound(DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat,15,2 ) ;
         xMTOCNTEXT:=DMTE.FRound((DMTE.cdsRec.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsRec.FieldByName('CPIGV').AsFloat) / DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2 );
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
     xNReg:=xNReg+1;
     DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
   end;}

//////////////
   xSQL:='Select RETSERIE, RETNUMERO, FECPAGO '
         +'From CNT320 '
         +'WHERE CIAID='''   + DMTE.cdsEgrCaja.FieldByName('CIAID').AsString    +''' AND '
         +      'ANOMM='''   + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString  +''' AND '
         +      'TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString  +''' AND '
         +      'ECNOCOMP='''+ DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString +''' AND '
         +      'AUXID='''+ DMTE.cdsDocPago.FieldByName('PROV').AsString +''' '
         +'GROUP BY RETSERIE, RETNUMERO, FECPAGO';
   DMTE.cdsQry4.Close;
   DMTE.cdsQry4.Datarequest( xSQL );
   DMTE.cdsQry4.Open;

/////////////

     DMTE.cdsCntCaja.FieldByName('CIAID').Value   := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
     DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
     DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
     DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:= DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
     DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  := 'CXP';
     DMTE.cdsCntCaja.FieldByName('DOCID').Value   := ''; // DMTE.cdsDocPago.FieldByName('DOCID2').Value;
     DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsQry4.FieldByName('RETSERIE').AsString;
     DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsQry4.FieldByName('RETNUMERO').AsString;
     DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
     DMTE.cdsCntCaja.FieldByName('DCFEMIS').Clear; // DMTE.cdsDocPago.FieldByName('CPFEMIS').Value;
     DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Clear; // DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value;
     DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CPTODES,CUENTAID','CPTOIS=''T''','CPTOID');
     DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
     DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:=DMTE.cdsQry.fieldBYName('CPTODES').AsString+' '+DMTE.cdsDocPago.FieldByName('PROVDES').AsString;
     DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value;
     DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;
     DMTE.cdsCntCaja.FieldByName('DCDH').Value    := 'H';
     DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:= DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat; // DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
     DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:= DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat; // DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
     //DMTE.cdsCntCaja.FieldByName('TMONID').Value:= DMTE.cdsDocPago.FieldByName('TMONID').Value;
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

procedure TFFondoFijo.RetornaSaldosMovCxPPagados;
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
			DMTE.cdsMovCxP.Close;
			DMTE.cdsMovCxP.DataRequest( xSQL );
			DMTE.cdsMovCxP.Open;

			DMTE.cdsMovCxP.edit;

			DMTE.cdsMovCxP.FieldByName('CPESTADO').Value := 'P';

			If DMTE.cdsMovCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
         begin
            DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat + DMTE.FRound((DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat/DMTE.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat),15,2);
            DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
         end
         else
         begin
            DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
            DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat + DMTE.FRound((DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat*DMTE.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat),15,2);
         end;

			If DMTE.cdsMovCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
				 DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat
			else
				 DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;

			DMTE.cdsMovCxP.FieldByName('CPPAGEXT').Value:=DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat-DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;
			DMTE.cdsMovCxP.FieldByName('CPPAGLOC').Value:=DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat-DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat;
			DMTE.cdsMovCxP.FieldByName('CPPAGORI').Value:=DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat-DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat;

			DMTE.AplicaDatos(DMTE.cdsMovCxP, 'MOVCXP');

			DMTE.SaldosAuxiliar( DMTE.cdsMovCxP.FieldByName('CIAID').AsString,   DMTE.cdsMovCxP.FieldByName('CPANOMES').AsString,
													DMTE.cdsMovCxP.FieldByName('CLAUXID').AsString, DMTE.cdsMovCxP.FieldByName('PROV').AsString, '+',
													DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat, DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat, DMTE.cdsMovCxP.FieldByName('TMONID').AsString);

      DMTE.cdsDocPago.Next;
   end;

   DMTE.cdsDocPago.EnableControls;
end;

procedure TFFondoFijo.Button1Click(Sender: TObject);
begin
  CalculaRetencionIGVBancos;
end;

function TFFondoFijo.CalculaRetencionIGVBancos: boolean;
var
  xRegAct     : TBookMark;
  xSQL, xClaux,xProv : String;
  xBreak      : Boolean;
begin
  // Para Saber si la Compa��a Retiene IGV
  xSQL:='Select CIAID, CIARETIGV from TGE101 where CIAID='''+DMTE.cdsEgrCaja.FieldByName('CIAID').AsString+''' ';
  DMTE.cdsQry.Close;
  DMTE.cdsQry.Datarequest( xSQL );
  DMTE.cdsQry.Open;

  if DMTE.cdsQry.FieldByName('CIARETIGV').AsString<>'S' then Exit;

  // Concepto y Cuenta de Retenci�n
  xSQL:='Select CPTOID, CUENTAID from CAJA201 Where CPTOIS=''R''';
  DMTE.cdsQry.Close;
  DMTE.cdsQry.Datarequest( xSQL );
  DMTE.cdsQry.Open;

  DMTE.xCptoRet:=DMTE.cdsQry.FieldByName('CPTOID').AsString;
  DMTE.xCtaRet :=DMTE.cdsQry.FieldByName('CUENTAID').AsString;

  // Tasas de La Retenci�n

  xSQL:='SELECT A.*, B.PROVRETIGV FROM ( '
     +  'SELECT ''PROVISIONADO'' MODO, B.PROVRETIGV PROVDOC, B.TCANJEID, A.DETCPAG DETCDOC, B.TMONID, A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, '
     +    'A.PROVRUC, A.DOCID2, A.TDIARID2, A.CPANOMM, A.CPNOREG, A.CPSERIE, A.CPNODOC, A.CPFEMIS, '
     +    'A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, B.CPFEMIS CPFEMIPROV, B.CPGRAVAD, B.CPNOGRAV, B.CPIGV, B.CPMTOLOC, B.CPMTOEXT, DOCRETIGV '
     +    ',CASE WHEN B.TMONID='+Quotedstr(DMTE.wTmonLoc)+' THEN dec(A.DEMTOLOC/B.CPMTOLOC,15,4)  '
		 +    ' ELSE dec(A.DEMTOEXT/B.CPMTOEXT,15,4) END PORCPAGO,C.DOCRESTA  '
		 +  ' FROM CAJA303 A, CXP301 B, TGE110 C '
		 +  'WHERE A.CIAID='''   +DMTE.cdsEgrCaja.FieldByName('CIAID').AsString   +''' AND '
		 +        'A.TDIARID=''' +DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString +''' AND '
		 +        'A.ECANOMM=''' +DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString +''' AND '
		 +        'A.ECNOCOMP='''+DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' '
		 +    'AND B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID2 AND B.CPANOMES=A.CPANOMM '
		 +    'AND B.CPNOREG=A.CPNOREG AND C.DOCMOD=''CXP'' and C.DOCID=A.DOCID2 '
		 +  'UNION '
		 +  'SELECT ''NO PROVISIONADO'' MODO, '''' PROVDOC, '''' TCANJEID, A.DETCPAG DETCDOC, A.TMONID,A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, '
		 +    'B.PROVRUC, A.DOCID2, A.TDIARID2, A.CPANOMM, A.CPNOREG, A.CPSERIE, A.CPNODOC, A.CPFEMIS, '
		 +    'A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, A.CPFEMIS CPFEMISPROV,0.00 CPGRAVAD,0.00 CPNOGRAV, 0.00 CPIGV, DEMTOLOC CPMTOLOC, DEMTOEXT CPMTOEXT, C.DOCRETIGV, 1 PORCPAGO ,C.DOCRESTA '
		 +  ' FROM CAJA301 A, TGE110 C, TGE201 B '
     +  'WHERE A.CIAID='''   +DMTE.cdsEgrCaja.FieldByName('CIAID').AsString   +''' AND '
     +        'A.TDIARID=''' +DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString +''' AND '
     +        'A.ECANOMM=''' +DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString +''' AND '
     +        'A.ECNOCOMP='''+DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' '
     +    'AND '+DMTE.wReplacCeros+'(FLAGVAR,'' '')<>''R'' AND C.DOCMOD=''CXP'' and C.DOCID=A.DOCID2 '
     +    'AND B.CLAUXID=A.CLAUXID AND B.PROV=A.PROV '
     + ' ) A, CNT201 B '
     +'WHERE B.CLAUXID=A.CLAUXID AND B.AUXID=A.PROV AND A.CPFEMIS>='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,DMTE.xTasaFec)+''') AND A.DOCRETIGV=''S'' AND B.PROVRETIGV=''S'' '
     +' ORDER BY A.CLAUXID, A.PROV';

  DMTE.cdsConsulta.Close;
  DMTE.cdsConsulta.DataRequest( xSQL );

  try
    DMTE.cdsConsulta.Open;
  except
  end;

  DMTE.cdsConsulta.IndexFieldNames := '';
  DMTE.cdsConsulta.IndexFieldNames:='CLAUXID;PROV;CPNOREG';

  xSQL:='Select * from CNT320 '
    +'WHERE CIAID='''   +DMTE.cdsEgrCaja.FieldByName('CIAID').AsString   +''' AND '
    +      'ANOMM='''   +DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString +''' AND '
    +      'TDIARID=''' +DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString +''' AND '
    +      'ECNOCOMP='''+DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' AND '
    +      'CLAUXID=''' +DMTE.cdsConsulta.FieldByName('CLAUXID').AsString +''' AND '
    +      'AUXID='''   +DMTE.cdsConsulta.FieldByName('PROV').AsString    +'''';

  DMTE.cdsRetencion.Close;
  DMTE.cdsRetencion.IndexFieldNames:='';
  DMTE.cdsRetencion.Datarequest( xSQL );
  DMTE.cdsRetencion.Open;
  //12/11/2002
  DMTE.cdsConsulta.First;
  //

  xClaux:=DMTE.cdsConsulta.FieldByName('CLAUXID').AsString;
  xProv:=DMTE.cdsConsulta.FieldByName('PROV').AsString;
  DMTE.xTotRetMN:=0;   DMTE.xTotRetME:=0;
  DMTE.xTotPagMN:=0;   DMTE.xTotPagME:=0;
  DMTE.xTRetLoc :=0;   DMTE.xTRetExt :=0;

  Result:=False;
  while not DMTE.cdsConsulta.Eof do
  begin
    //if (sProv=DMTE.cdsDocPago.FieldByName('PROV').AsString) AND (sAux=DMTE.cdsDocPago.FieldByName('CLAUXID').AsString) then
    begin
      if DMTE.cdsConsulta.FieldByName('MODO').AsString='NO PROVISIONADO' then
      begin
        DMTE.xTotRetMN:=DMTE.xTotRetMN + DMTE.cdsConsulta.FieldByName('CPMTOLOC').AsFloat;
        DMTE.xTotRetME:=DMTE.xTotRetME + DMTE.cdsConsulta.FieldByName('CPMTOEXT').AsFloat;

        DMTE.xTotPagMN:=DMTE.xTotPagMN + DMTE.cdsConsulta.FieldByName('CPMTOLOC').AsFloat;
        DMTE.xTotPagME:=DMTE.xTotPagME + DMTE.cdsConsulta.FieldByName('CPMTOEXT').AsFloat;

        DMTE.xRetencionL:=DMTE.FRound( DMTE.cdsConsulta.FieldByName('CPMTOLOC').AsFloat * DMTE.xTasaPorce / 100, 15, 2 );
        DMTE.xRetencionE:=DMTE.FRound( DMTE.cdsConsulta.FieldByName('CPMTOEXT').AsFloat * DMTE.xTasaPorce / 100, 15, 2 );

        DMTE.xTRetLoc   := DMTE.xTRetLoc + DMTE.xRetencionL;
        DMTE.xTRetExt   := DMTE.xTRetExt + DMTE.xRetencionE;

        InsertaEnCNT320Bancos;
        Result:=True;
      end
      else
      begin
        if DMTE.cdsConsulta.FieldByName('TCANJEID').AsString<>'LE' then
        begin
          if DMTE.cdsConsulta.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
          begin
            DMTE.xTotRetMN:=DMTE.xTotRetMN + DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat;
            DMTE.xTotRetME:=DMTE.xTotRetME + DMTE.FRound((DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat)/DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);

            DMTE.xTotPagMN:=DMTE.xTotPagMN + DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat+DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat;
            DMTE.xTotPagME:=DMTE.xTotPagME + DMTE.cdsConsulta.FieldByName('DEMTOEXT').AsFloat+DMTE.FRound(((DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat)/DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat),15,2);
          end
          else
          if DMTE.cdsConsulta.FieldByName('TMONID').AsString=DMTE.wTMonExt then
          begin
            DMTE.xTotRetME:=DMTE.xTotRetME + DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat;
            DMTE.xTotRetMN:=DMTE.xTotRetMN + (DMTE.FRound(DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat*DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2)
                                                                                                 +DMTE.FRound(DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat*DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2));

            DMTE.xTotPagME:=DMTE.xTotPagME + DMTE.cdsConsulta.FieldByName('DEMTOEXT').AsFloat+DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat;
            DMTE.xTotPagMN:=DMTE.xTotPagMN + DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat+DMTE.FRound(((DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat)*DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat),15,2);
          end;

          DMTE.xRetencionL:=DMTE.FRound( DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
          DMTE.xRetencionE:=DMTE.FRound( DMTE.cdsConsulta.FieldByName('DEMTOEXT').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );

          DMTE.xTRetLoc   := DMTE.xTRetLoc + DMTE.xRetencionL;
          DMTE.xTRetExt   := DMTE.xTRetExt + DMTE.xRetencionE;

          InsertaEnCNT320Bancos;
          Result:=True;
        end
        else
        begin
          // si son Letras

          if DMTE.cdsConsulta.FieldByname('TMONID').AsString=DMTE.wTMonLoc then
          begin
            DMTE.xRetencionL  := DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat;
            DMTE.xRetencionE  := DMTE.FRound(DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat/DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
          end
          else
          begin
            DMTE.xRetencionE  :=DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat;
            DMTE.xRetencionL  :=DMTE.FRound(DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat*DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
          end;


          DMTE.xTRetLoc   := DMTE.xTRetLoc + DMTE.xRetencionL;
          DMTE.xTRetExt   := DMTE.xTRetExt + DMTE.xRetencionE;

          //InsertaEnCNT320Bancos;
          //12/09/2002
          InsertaLETRASEnCNT320;
          Result:=True;

{          if DMTE.cdsConsulta.FieldByname('TMONID').AsString=DMTE.wTMonEXT then
          begin
           DMTE.xTotRetME:=DMTE.xTotRetME+DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat;
           DMTE.xTotRetMN:=DMTE.xTotRetMN+DMTE.FRound(DMTE.xTotRetME*DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
          end
          else
          begin
           DMTE.xTotRetMN:=DMTE.xTotRetMN+DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat+DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat;
           DMTE.xTotRetME:=DMTE.xTotRetME+DMTE.FRound(DMTE.xTotRetMN/DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
          end;}
        end;
      end;
    end;
    DMTE.cdsConsulta.Next;

    if (DMTE.cdsConsulta.Eof ) or (xProv<>DMTE.cdsConsulta.FieldByName('PROV').AsString) then
    begin
      xBreak:=False;
      if DMTE.cdsConsulta.Eof then
      	 xBreak:=True;

      DMTE.cdsConsulta.Prior;

      if DMTE.xTotRetMN > DMTE.xTasaMonto then
      begin
         if DMTE.cdsConsulta.FieldByName('TCANJEID').AsString<>'LE' then
         begin
           DMTE.xRetencionL:=DMTE.xTRetLoc;
           DMTE.xRetencionE:=DMTE.xTRetExt;
         end
         else
         begin
           DMTE.xRetencionL:=DMTE.xTRetLoc;//DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat;
           DMTE.xRetencionE:=DMTE.xTRetExt;//DMTE.FRound(DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat/DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
         end;
         //JCC
         //InsertaRetencionIGV;

         GrabaNumeroretencionBancos;
      end;

      xProv    :='';
      DMTE.xTotRetMN:=0;  DMTE.xTotRetME:=0;
      DMTE.xTotPagMN:=0;  DMTE.xTotPagME:=0;
      DMTE.xTRetLoc :=0;  DMTE.xTRetExt :=0;

      if xBreak then Break;

      DMTE.cdsConsulta.Next;

      xProv:=DMTE.cdsConsulta.FieldByName('PROV').AsString;

      xSQL:='Select * from CNT320 '
           +'WHERE CIAID='''   +DMTE.cdsEgrCaja.FieldByName('CIAID').AsString   +''' AND '
           +      'ANOMM='''   +DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString +''' AND '
           +      'TDIARID=''' +DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString +''' AND '
           +      'ECNOCOMP='''+DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' AND '
           +      'CLAUXID=''' +DMTE.cdsConsulta.FieldByName('CLAUXID').AsString+''' AND '
           +      'AUXID='''   +DMTE.cdsConsulta.FieldByName('PROV').AsString   +'''';
      DMTE.cdsRetencion.Close;
      DMTE.cdsRetencion.Datarequest( xSQL );
      DMTE.cdsRetencion.Open;
    end;
  end;
  DMTE.cdsConsulta.IndexFieldNames := '';
end;

procedure TFFondoFijo.InsertaEnCNT320Bancos;
begin
   DMTE.cdsRetencion.Insert;
   DMTE.cdsRetencion.FieldByname('CIAID').AsString     :=  DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
   DMTE.cdsRetencion.FieldByname('CIARUC').AsString    :=  DMTE.DisplayDescrip('prvTGE','TGE101','CIARUC','CIAID='+Quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString),'CIARUC');
   DMTE.cdsRetencion.FieldByname('ANOMM').AsString     :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DMTE.cdsRetencion.FieldByname('TDIARID').AsString   :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
   DMTE.cdsRetencion.FieldByname('ECNOCOMP').AsString  :=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   DMTE.cdsRetencion.FieldByname('FECPAGO').AsDateTime :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   DMTE.cdsRetencion.FieldByname('CLAUXID').AsString   :=  DMTE.cdsConsulta.FieldByName('CLAUXID').AsString;
   DMTE.cdsRetencion.FieldByname('AUXID').AsString     :=  DMTE.cdsConsulta.FieldByName('PROV').AsString;
   DMTE.cdsRetencion.FieldByname('AUXRUC').AsString    :=  DMTE.cdsConsulta.FieldByName('PROVRUC').AsString;
   DMTE.cdsRetencion.FieldByname('DOCID').AsString     :=  DMTE.cdsConsulta.FieldByName('DOCID2').AsString;
   DMTE.cdsRetencion.FieldByname('DOCDES').AsString    :=  DMTE.cdsConsulta.FieldByName('CPANOMM').AsString;
   DMTE.cdsRetencion.FieldByname('SERIE').AsString     :=  DMTE.cdsConsulta.FieldByName('CPSERIE').AsString;
   DMTE.cdsRetencion.FieldByname('NODOC').AsString     :=  DMTE.cdsConsulta.FieldByName('CPNODOC').AsString;
   DMTE.cdsRetencion.FieldByname('FECEMI').AsDateTime  :=  DMTE.cdsConsulta.FieldByName('CPFEMIS').AsDateTime;
   DMTE.cdsRetencion.FieldByname('TRANID').AsString    :=  '';
   DMTE.cdsRetencion.FieldByname('TRANDES').AsString   :=  '';
   DMTE.cdsRetencion.FieldByname('DH').AsString        :=  'H';
   DMTE.cdsRetencion.FieldByname('MTOORI').AsFloat     :=  DMTE.cdsConsulta.FieldByName('DEMTOORI').AsFloat;
   DMTE.cdsRetencion.FieldByname('MTOLOC').AsFloat     :=  DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
   DMTE.cdsRetencion.FieldByname('MTOEXT').AsFloat     :=  DMTE.cdsConsulta.FieldByName('DEMTOEXT').AsFloat;
   DMTE.cdsRetencion.FieldByname('TCAMB').AsFloat     :=  DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat;
   if DMTE.cdsConsulta.FieldByName('TCANJEID').AsString<>'LE' then
   begin
     DMTE.cdsRetencion.FieldByname('MTORETORI').AsFloat:=DMTE.xRetencionL;
     DMTE.cdsRetencion.FieldByname('MTORETLOC').AsFloat:=DMTE.xRetencionL;
     DMTE.cdsRetencion.FieldByname('MTORETEXT').AsFloat:=DMTE.xRetencionE;
   end
   else
   begin
     if DMTE.cdsConsulta.FieldByname('TMONID').AsString=DMTE.wTMonLoc then
     begin
       DMTE.cdsRetencion.FieldByname('MTOORI').AsFloat     :=  DMTE.FRound(DMTE.cdsConsulta.FieldByName('DEMTOORI').AsFloat+DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat,15,2);
       DMTE.cdsRetencion.FieldByname('MTOLOC').AsFloat     :=  DMTE.FRound(DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat+DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat,15,2);
       DMTE.cdsRetencion.FieldByname('MTOEXT').AsFloat     :=  DMTE.FRound(DMTE.cdsConsulta.FieldByName('DEMTOEXT').AsFloat+(DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat/DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat),15,2);

       DMTE.cdsRetencion.FieldByname('MTORETORI').AsFloat  :=DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat;
       DMTE.cdsRetencion.FieldByname('MTORETLOC').AsFloat  :=DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat;
       DMTE.cdsRetencion.FieldByname('MTORETEXT').AsFloat  :=DMTE.FRound(DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat/DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
     end
     else
     begin
       DMTE.cdsRetencion.FieldByname('MTOORI').AsFloat     :=  DMTE.FRound(DMTE.cdsConsulta.FieldByName('DEMTOORI').AsFloat+DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat,15,2);
       DMTE.cdsRetencion.FieldByname('MTOLOC').AsFloat     :=  DMTE.FRound(DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat+(DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat*DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat),15,2);
       DMTE.cdsRetencion.FieldByname('MTOEXT').AsFloat     :=  DMTE.FRound(DMTE.cdsConsulta.FieldByName('DEMTOEXT').AsFloat+DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat,15,2);

       DMTE.cdsRetencion.FieldByname('MTORETORI').AsFloat  :=DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat;
       DMTE.cdsRetencion.FieldByname('MTORETEXT').AsFloat  :=DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat;
       DMTE.cdsRetencion.FieldByname('MTORETLOC').AsFloat  :=DMTE.FRound(DMTE.cdsConsulta.FieldByName('CPNOGRAV').AsFloat*DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
     end;
   end;

   DMTE.cdsRetencion.FieldByname('USUARIO').AsString :=DMTE.wUsuario;
   DMTE.cdsRetencion.FieldByname('FREG').Value       :=DateS;
   DMTE.cdsRetencion.FieldByname('HREG').Value       :=Time;
   cdsPost( DMTE.cdsRetencion );
end;

procedure TFFondoFijo.GrabaNumeroRetencionBancos;
var
  xNumero, xSQL, xwhere,xtmondes : String;
  xcontador  : Integer;
  xsuma : Double;
begin
   //Descripcion de la moneda
   xWhere:='TMONID='''+DMTE.Wtmonloc+'''';
   xtmondes:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');

   // Concepto y Cuenta de Retenci�n
   xSQL:='Select Max( RETNUMERO ) NUMERO From CNT320 '
//        +'Where CIAID='''+DMTE.cdsEgrCaja.FieldByName('CIAID').AsString+'''';
   //CLG:11/06/2003
   +' WHERE CIARUC='+QuotedStr(DMTE.DisplayDescrip('prvTGE','TGE101','CIARUC','CIAID='+Quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString),'CIARUC'));

   DMTE.cdsQry.Close;
   DMTE.cdsQry.Datarequest( xSQL );
   DMTE.cdsQry.Open;

   if DMTE.cdsQry.FieldByName('NUMERO').AsString='' then
      xNumero:='0000001'
   else
      xNumero:=DMTE.StrZero( IntToStr( StrToInt(DMTE.cdsQry.FieldByName('NUMERO').AsString) +1 ), 7 );

   xcontador:=0;
   xsuma:=0;
   DMTE.cdsRetencion.First;
   while not DMTE.cdsRetencion.Eof do
   begin
      DMTE.cdsRetencion.Edit;
      DMTE.cdsRetencion.FieldByname('RETSERIE').AsString   :='001';
      DMTE.cdsRetencion.FieldByname('RETNUMERO').AsString  :=xNumero;
      xsuma:=xsuma+DMTE.cdsRetencion.FieldByname('MTORETLOC').AsFLOAT;

      DMTE.cdsRetencion.Next;
      //agregado
      xcontador:=xcontador+1;
      if xcontador>=xNumLinRet then
      Begin
         DMTE.AplicaDatos(DMTE.cdsRetencion, 'RETENCION');
         xsql:='UPDATE CNT320 SET RETTOTDES='''+strnum(xsuma)+' '+XTMONDES+''' WHERE RETNUMERO='''+XNUMERO+'''';
         DMTE.cdsQry.Close;
         DMTE.cdsQry.Datarequest( xSQL );
         DMTE.cdsQry.Execute;
         XSUMA:=0;
         xSQL:='Select Max( RETNUMERO ) NUMERO From CNT320 '
            //  +'Where CIAID='''+DMTE.cdsEgrCaja.FieldByName('CIAID').AsString+'''';
   //CLG:11/06/2003
   +' WHERE CIARUC='+QuotedStr(DMTE.DisplayDescrip('prvTGE','TGE101','CIARUC','CIAID='+Quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString),'CIARUC'));
            
         DMTE.cdsQry.Close;
         DMTE.cdsQry.Datarequest( xSQL );
         DMTE.cdsQry.Open;

         if DMTE.cdsQry.FieldByName('NUMERO').AsString='' then
            xNumero:='0000000001'
         else
            xNumero:=DMTE.StrZero( IntToStr( StrToInt(DMTE.cdsQry.FieldByName('NUMERO').AsString) +1 ), 7 );
         xcontador:=0;
      End;
   end;
   DMTE.AplicaDatos(DMTE.cdsRetencion, 'RETENCION');
   xSQL:='UPDATE CNT320 SET RETTOTDES='''+strnum(xsuma)+' '+XTMONDES+''' WHERE RETNUMERO='''+XNUMERO+'''';
   try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;
end;


procedure TFFondoFijo.InsertaLETRASEnCNT320;
var
  xSQL : string;
begin
   xSQL := ' SELECT * FROM CXP313'
          +' WHERE CIAID='+Quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
          +' AND CLAUXID='+Quotedstr(DMTE.cdsConsulta.FieldByName('CLAUXID').AsString)
          +' AND PROV='+Quotedstr(DMTE.cdsConsulta.FieldByName('PROV').AsString)
          +' AND DOCID='+Quotedstr(DMTE.cdsConsulta.FieldByName('DOCID2').AsString)
          +' AND CPSERIE='+Quotedstr(DMTE.cdsConsulta.FieldByName('CPSERIE').AsString)
          +' AND CPNODOC='+Quotedstr(DMTE.cdsConsulta.FieldByName('CPNODOC').AsString)
					+' AND CPNOREGLET='+Quotedstr(DMTE.cdsConsulta.FieldByName('CPNOREG').AsString)
          +' AND (CPNETOLOC<>0 OR CPNETOEXT<>0) ';					
   DMTE.cdsSQL.Close;
   DMTE.cdsSQL.DataRequest(xSQL);
   DMTE.cdsSQL.Open;
   DMTE.cdsSQL.First;
   while not DMTE.cdsSQL.Eof do
   begin
      DMTE.cdsRetencion.Insert;
      DMTE.cdsRetencion.FieldByname('CIAID').AsString     :=  DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
      DMTE.cdsRetencion.FieldByname('CIARUC').AsString    :=  DMTE.DisplayDescrip('prvTGE','TGE101','CIARUC','CIAID='+Quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString),'CIARUC');
      DMTE.cdsRetencion.FieldByname('ANOMM').AsString     :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
      DMTE.cdsRetencion.FieldByname('TDIARID').AsString   :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
      DMTE.cdsRetencion.FieldByname('ECNOCOMP').AsString  :=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
      DMTE.cdsRetencion.FieldByname('FECPAGO').AsDateTime :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
      DMTE.cdsRetencion.FieldByname('CLAUXID').AsString   :=  DMTE.cdsConsulta.FieldByName('CLAUXID').AsString;
      DMTE.cdsRetencion.FieldByname('AUXID').AsString     :=  DMTE.cdsConsulta.FieldByName('PROV').AsString;
      DMTE.cdsRetencion.FieldByname('AUXRUC').AsString    :=  DMTE.cdsConsulta.FieldByName('PROVRUC').AsString;
      DMTE.cdsRetencion.FieldByname('DOCID2').AsString    :=  DMTE.cdsConsulta.FieldByName('DOCID2').AsString;
      DMTE.cdsRetencion.FieldByname('DOCDES').AsString    :=  DMTE.cdsSQL.FieldByName('CPANOMES2').AsString;
      DMTE.cdsRetencion.FieldByname('CPSERIE').AsString   :=  DMTE.cdsConsulta.FieldByName('CPSERIE').AsString;
      DMTE.cdsRetencion.FieldByname('CPNODOC').AsString   :=  DMTE.cdsConsulta.FieldByName('CPNODOC').AsString;
      DMTE.cdsRetencion.FieldByname('FECEMI').AsDateTime  :=  DMTE.cdsSQL.FieldByName('CPFEMIS2').AsDateTime;

      DMTE.cdsRetencion.FieldByname('DOCID').AsString     :=  DMTE.cdsSQL.FieldByName('DOCID2').AsString;
      DMTE.cdsRetencion.FieldByname('SERIE').AsString     :=  DMTE.cdsSQL.FieldByName('CPSERIE2').AsString;
      DMTE.cdsRetencion.FieldByname('NODOC').AsString     :=  DMTE.cdsSQL.FieldByName('CPNODOC2').AsString;
      DMTE.cdsRetencion.FieldByname('FECEMI').AsDateTime  :=  DMTE.cdsSQL.FieldByName('CPFEMIS2').AsDateTime;

      DMTE.cdsRetencion.FieldByname('TRANID').AsString    :=  '';
      DMTE.cdsRetencion.FieldByname('TRANDES').AsString   :=  '';
      DMTE.cdsRetencion.FieldByname('DH').AsString        :=  'H';

      DMTE.cdsRetencion.FieldByname('TCAMB').AsFloat      :=  DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;

      DMTE.cdsRetencion.FieldByname('MTOORI').AsFloat     := DMTE.FRound(DMTE.cdsSQL.FieldByName('CPNETOORI').AsFloat,15,2);
      if DMTE.cdsSQL.FieldByName('TMONID2').AsString= DMTE.wTMonLoc then
         DMTE.cdsRetencion.FieldByname('MTORETORI').AsFloat  := DMTE.FRound(DMTE.cdsSQL.FieldByName('CPRETLOC').AsFloat,15,2)
      else
         if DMTE.cdsSQL.FieldByName('TMONID2').AsString= DMTE.wTMonExt then
            DMTE.cdsRetencion.FieldByname('MTORETORI').AsFloat  := DMTE.FRound(DMTE.cdsSQL.FieldByName('CPRETEXT').AsFloat,15,2);

      if DMTE.cdsSQL.FieldByName('TMONID2').AsString= DMTE.wTMonLoc then
      begin
         DMTE.cdsRetencion.FieldByname('MTOLOC').AsFloat     := DMTE.cdsSQL.FieldByName('CPNETOORI').AsFloat;
         DMTE.cdsRetencion.FieldByname('MTOEXT').AsFloat     := DMTE.FRound(DMTE.cdsSQL.FieldByName('CPNETOORI').AsFloat/DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat,15,2);
         DMTE.cdsRetencion.FieldByname('MTORETLOC').AsFloat  := DMTE.FRound(DMTE.cdsRetencion.FieldByname('MTORETORI').AsFloat,15,2);
         DMTE.cdsRetencion.FieldByname('MTORETEXT').AsFloat  := DMTE.FRound(DMTE.cdsRetencion.FieldByname('MTORETORI').AsFloat/DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat,15,3);
      end
      else
         if DMTE.cdsSQL.FieldByName('TMONID2').AsString= DMTE.wTMonExt then
         begin
            DMTE.cdsRetencion.FieldByname('MTOLOC').AsFloat     := DMTE.FRound(DMTE.cdsSQL.FieldByName('CPNETOORI').AsFloat*DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat,15,2);
            DMTE.cdsRetencion.FieldByname('MTOEXT').AsFloat     := DMTE.cdsSQL.FieldByName('CPNETOORI').AsFloat;
            DMTE.cdsRetencion.FieldByname('MTORETLOC').AsFloat  := DMTE.FRound(DMTE.cdsRetencion.FieldByname('MTORETORI').AsFloat*DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat,15,2);
            DMTE.cdsRetencion.FieldByname('MTORETEXT').AsFloat  := DMTE.cdsRetencion.FieldByname('MTORETORI').AsFloat;
         end;
      /////////////////////
      DMTE.xTotRetME:=DMTE.xTotRetME+DMTE.cdsRetencion.FieldByName('MTOEXT').AsFloat;
      DMTE.xTotRetMN:=DMTE.xTotRetMN+DMTE.cdsRetencion.FieldByName('MTOLOC').AsFloat;
      //
      DMTE.cdsRetencion.FieldByname('USUARIO').AsString :=DMTE.wUsuario;
      DMTE.cdsRetencion.FieldByname('FREG').Value       :=DateS;
      DMTE.cdsRetencion.FieldByname('HREG').Value       :=Time;

      DMTE.cdsRetencion.FieldByname('DOCID2').AsString    :=  DMTE.cdsSQL.FieldByName('DOCID').AsString;
      DMTE.cdsRetencion.FieldByname('CPSERIE').AsString   :=  DMTE.cdsSQL.FieldByName('CPSERIE').AsString;
      DMTE.cdsRetencion.FieldByname('CPNODOC').AsString   :=  DMTE.cdsSQL.FieldByName('CPNODOC').AsString;
      DMTE.cdsRetencion.FieldByname('CPNOREG').AsString   :=  DMTE.cdsSQL.FieldByName('CPNOREGLET').AsString;
      DMTE.cdsRetencion.FieldByname('TMONIDFAC').AsString :=  DMTE.cdsSQL.FieldByName('TMONID2').AsString;

      cdsPost( DMTE.cdsRetencion );

      DMTE.cdsSQL.Next;
   end;
end;

procedure TFFondoFijo.dblcClaseExit(Sender: TObject);
var
   xSQLx : string ;
   xAuxId : string;
begin

   edtClase.text:= DMTE.DisplayDescripLocal(DMTE.cdsClaseAux,'CLAUXID',dblcClase.Text,'CLAUXDES') ;

   if edtClase.Text='' then
   begin
      dblcdAux.Text  := '' ;
		edtAuxRUC.Text := '' ;
      dbeGiradoA.Text:= '' ;
      ShowMessage('Error : Clase de Auxiliar');
      dblcClase.SetFocus;
      Exit;
   end
   else
      xAuxId := dblcdAux.Text;

   xSQLx:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+'''';
   DMTE.cdsAux.Close;
   DMTE.cdsAux.DataRequest( xSQLx ) ;
   DMTE.cdsAux.Open;

   if Length(Trim(xAuxId))>0 then
      dblcdAux.Text:=xAuxId;   


   dblcdAux.Selected.Clear;
   dblcdAux.Selected.Add('AUXID'#9'13'#9'Auxiliar'#9'F');
   dblcdAux.Selected.Add('AUXRUC'#9'13'#9'R.U.C'#9'F');
   dblcdAux.Selected.Add('AUXABR'#9'15'#9'Abreviatura'#9'F');
   dblcdAux.Selected.Add('AUXNOMB'#9'20'#9'Nombre Auxiliar'#9'F');

end;

procedure TFFondoFijo.Z2bbtChqVouchClick(Sender: TObject);
var
   strChq : structChq ;
   xSQL, xWhere, ArchivoReporte : string ;
   xTotal : Double;
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
          xTotal:= DMTE.FRound(strtoFloat(dbeImporte.Text)-DMTE.cdsQry4.FieldByName('RETLOC').AsFloat,15,2)
       else
          if dblcTMon.Text = DMTE.wTMonExt then
             xTotal:= DMTE.FRound(StrToFloat(dbeImporte.Text)-DMTE.cdsQry4.FieldByName('RETEXT').AsFloat, 15, 2);

       xSQL := '     CIAID='''   +dblcCia.Text     +''' and '
              +      'TDIARID=''' +dblcTDiario.Text +''' and '
              +      'ECANOMM=''' +edtPeriodo.Text  +''' and '
              +      'ECNOCOMP='''+dbeNoComp.Text   +''' ';
       if DMTE.DisplayDescrip('prvSQL', 'CAJA302', 'ECCHQEMI', xsql, 'ECCHQEMI') <> 'S' then
       begin
          GeneraRegChqVouch;
          ppdbpChqVouch.DataSource      := DMTE.dsTrans;
          pprChqVouch.Template.FileName := wRutaRpt + '\ChequeVoucher.rtm';
          pprChqVouch.Template.LoadFromFile ;
          ppGiradoA.Caption     := dbeGiradoA.Text;
          ppImporte.Caption     := FloatToStrF(StrToCurr(FloatToStr(xTotal)), ffFixed, 10, 2) ;

          ppImporte.Caption := Format('%15.2n',[strtofloat(ppImporte.Caption)])        ;
          ppImporte.Caption := StringReplace(ppImporte.Caption,' ','*',[rfreplaceAll]) ;
          ppMontoLetras.Caption := strNum(xTotal)                              ;
          ppDia.Caption         := strDia(dbdtpFEmis.Date)                             ;
          ppmes.Caption         := strMes(dbdtpFEmis.Date)                             ;
          ppAno.Caption         := strAno(dbdtpFEmis.Date)                             ;
          ppGiradoA2.Caption    := dbeGiradoA.Text;
          ppCtaBanco.Caption    := dblcCCBco.Text;
          ppGlosa.Caption       := dbeGlosa.Text ;
          ppImporte2.Caption    := ppImporte.Caption;
          ppMoneda.Caption      := edtTMon.Text;
          ppComprobante.Caption := dblcTDiario.Text+FloatToStr(StrToFloat(dbeNoComp.Text));
//          ppDesigner1.Show;
          pprChqVouch.Print;

          DMTE.xFlagP := False;
          if DMTE.xFlagP then
           begin
            xSQL := 'UPDATE CAJA302 SET ECCHQEMI=''S'' '
                   +'WHERE CIAID='''   +dblcCia.text+''' and '
                   +      'TDIARID=''' +dblcTDiario.text +''' and '
                   +      'ECANOMM=''' +edtPeriodo.text+''' and '
                   +      'ECNOCOMP='''+dbeNoComp.text+''' ';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
          end;
       end
       else ShowMessage('Cheque ya fu� Impreso') ;

    end
    else
    begin
       Showmessage('No ha seleccionado Cuenta Corriente') ;
    end ;
end;

procedure TFFondoFijo.GeneraRegChqVouch;
var
   xCuentaId, xSQL, xWhere : String;
   xMto : Double;
   xMTOCHQLOC         : Double   ;
   xMTOCHQEXT         : Double   ;
   xbEof : Boolean;
   xCtaDG, xCtaDP : String;
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
   xCuentaId := DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString;
   while not DMTE.cdsCntCaja.Eof do
   begin
      xMTOCHQLOC:=DMTE.FRound(xMTOCHQLOC+DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat,15,2 ) ;
      xMTOCHQEXT:=DMTE.FRound(xMTOCHQEXT+DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat,15,2 ) ;

      DMTE.cdsCntCaja.Next;
      xbEof := DMTE.cdsCntCaja.Eof;

      if (DMTE.cdsCntCaja.Eof) or (xCuentaId<>DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString)  then
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
        xCuentaId := DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString;


      end;
   end;
   DMTE.cdsTrans.Post;
   DMTE.cdsTrans.Filter := 'DEBE>0 OR HABER>0';
   DMTE.cdsTrans.Filtered := True;
   DMTE.cdsCntCaja.IndexFieldNames := '';

end;

procedure TFFondoFijo.GrabaCabeceraDeComprobante;
var xSQL:string;
begin

    DMTE.cdsEgrCaja.CancelUpdates;
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



procedure TFFondoFijo.pprChqVouchPrintingComplete(Sender: TObject);
begin
         DMTE.xFlagP := True;
end;

procedure TFFondoFijo.Z2bbtnCajaChicaClick(Sender: TObject);
var
   strChq : structChq ;
   xsql,xWhere,ArchivoReporte : string ;
   xTotal : double;
   xConsis:Boolean;   
begin

    if DMTE.cdsEgrcaja.FieldByName('ECESTADO').AsString='A' then
       raise exception.Create('El Comprobante se encuentra Anulado');

    DMTE.cdsRegCxP.DisableControls;
    ConsisCancela(xConsis);
    DMTE.cdsRegCxP.EnableControls;
    if not xConsis then
    begin
        ShowMessage('No se puede Generar el Reporte');
        Exit;
    end;    

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
          xTotal:= DMTE.FRound(strtoFloat(dbeImporte.Text)-DMTE.cdsQry4.FieldByName('RETLOC').AsFloat,15,2)
       else
          if dblcTMon.Text = DMTE.wTMonExt then
             xTotal:= DMTE.FRound(strtoFloat(dbeImporte.Text)-DMTE.cdsQry4.FieldByName('RETEXT').AsFloat,15,2);

       xSQL:='     CIAID='''   +dblcCia.text     +''' and '
           +      'TDIARID=''' +dblcTDiario.text +''' and '
           +      'ECANOMM=''' +edtPeriodo.text  +''' and '
           +      'ECNOCOMP='''+dbeNoComp.text   +''' ';
          GeneraRepCajaChica;
          ppdbCajaChica.DataSource  := DMTE.dsTrans;
          pprCajaChica.TEMPLATE.FileName := wRutaRpt + '\CAJACHICA.rtm';
          pprCajaChica.template.LoadFromFile ;
          pplblCiaDes.Caption := edtCia.Text;
          pplblMoneda.Caption := edtTMon.Text;
//          dbg1.DataSource := DMTE.dsTrans;
//          ppDesigner1.Show;
          pprCajaChica.Print;


    end
    else
    begin
       Showmessage('No ha seleccionado Cuenta Corriente') ;
    end ;


end;

procedure TFFondoFijo.GeneraRepCajaChica;
var
   xCuentaId, xSQL, xWhere : string;
   xMto : Double;
   xMTOCHQLOC         : Double   ;
   xMTOCHQEXT         : double   ;
begin

   DMTE.cdsCNTCaja.IndexFieldNames:='';

   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' then
  	begin
     Contabiliza;
  	end;

   xSQL := 'SELECT A.* ,0.00 DEBE,0.00 HABER,''123456789012345678901234567890'' CTADES FROM CAJA304 A  '
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
     xSQL := 'SELECT A.*, B.CIADES FROM CAJA304 A, TGE101 B  '
            +'WHERE ( A.CIAID='     +QuotedStr( DMTE.cdsEgrcaja.FieldByName('CIAID').AsString    ) +' AND '
            +        'A.ECANOMM='   +QuotedStr( DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString  ) +' AND '
            +        'A.TDIARID='   +QuotedStr( DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString  ) +' AND '
            +        'A.ECNOCOMP='  +QuotedStr( DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString ) +' AND '
            +        'A.CIAID=B.CIAID ) ';
     DMTE.cdsCntCaja.Close;
     DMTE.cdsCntCaja.DataRequest(xSQL);
     DMTE.cdsCntCaja.Open;
    end;

   xNReg := 0;
   xMto  := 0;

   DMTE.cdsCntCaja.IndexFieldNames := 'CUENTAID';
   DMTE.cdsCntCaja.First;
   xCuentaId := DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString;
   while not DMTE.cdsCntCaja.Eof do
    begin
         xMTOCHQLOC:=DMTE.FRound(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat,15,2 ) ;
         xMTOCHQEXT:=DMTE.FRound(DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat,15,2 ) ;


         if DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString  <> DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString then
         begin
             DMTE.cdsTrans.Insert;
             DMTE.cdsTrans.FieldByName('CIAID').Value    := DMTE.cdsCntCaja.FieldByName('CIAID').Value;
             DMTE.cdsTrans.FieldByName('TDIARID').Value  := DMTE.cdsCntCaja.FieldByName('TDIARID').Value;
             DMTE.cdsTrans.FieldByName('ECANOMM').Value  := DMTE.cdsCntCaja.FieldByName('ECANOMM').Value;
             DMTE.cdsTrans.FieldByName('ECNOCOMP').Value := DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value;
             DMTE.cdsTrans.FieldByName('DCLOTE').Value   := DMTE.cdsCntCaja.FieldByName('DCLOTE').Value;
             DMTE.cdsTrans.FieldByName('DOCMOD').Value   := 'CXP';
             DMTE.cdsTrans.FieldByName('DOCID').Value    := DMTE.cdsCntCaja.FieldByName('DOCID').Value;
             DMTE.cdsTrans.FieldByName('DCSERIE').Value  := DMTE.cdsCntCaja.FieldByName('DCSERIE').Value;
             DMTE.cdsTrans.FieldByName('DCNODOC').Value  := DMTE.cdsCntCaja.FieldByName('DCNODOC').Value;
             DMTE.cdsTrans.FieldByName('ECFCOMP').Value  := DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value;
             DMTE.cdsTrans.FieldByName('DCFEMIS').Value  := DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value;
             DMTE.cdsTrans.FieldByName('DCFVCMTO').Value := DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value;
             DMTE.cdsTrans.FieldByName('CPTOID').Value   := DMTE.cdsCntCaja.FieldByName('CPTOID').Value;
             DMTE.cdsTrans.FieldByName('CUENTAID').Value := DMTE.cdsCntCaja.FieldByName('CUENTAID').Value;
             DMTE.cdsTrans.FieldByName('CLAUXID').Value  := DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString;
               DMTE.cdsTrans.FieldByName('CCOSID').Value := DMTE.cdsCntCaja.FieldByName('CCOSID').AsString;
             if DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString<>'' then
             begin
              DMTE.cdsTrans.FieldByName('DCAUXID').Value := DMTE.cdsCntCaja.FieldByName('DCAUXID').Value;
              DMTE.cdsTrans.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
             end
             else
             begin
              DMTE.cdsTrans.FieldByName('DCAUXID').Value := DMTE.cdsCntCaja.FieldByName('CUENTAID').Value;
             end;

             DMTE.cdsTrans.FieldByName('DCTCAMPA').Value:= DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value;
             DMTE.cdsTrans.FieldByName('TMONID').Value  := DMTE.cdsCntCaja.FieldByName('TMONID').Value;
             DMTE.cdsTrans.FieldByName('DCDH').Value    := DMTE.cdsCntCaja.FieldByName('DCDH').Value;
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
             DMTE.cdsTrans.FieldByName('DCFLACDR').AsString := 'S';   //Registro ya cuadrado
             DMTE.cdsTrans.FieldByName('DCANO').AsString    := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
             DMTE.cdsTrans.FieldByName('DCMM').AsString     := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
             DMTE.cdsTrans.FieldByName('DCDD').AsString     := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
             DMTE.cdsTrans.FieldByName('DCSS').AsString     := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
             DMTE.cdsTrans.FieldByName('DCSEM').AsString    := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
             DMTE.cdsTrans.FieldByName('DCTRI').AsString    := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
             DMTE.cdsTrans.FieldByName('DCAASS').AsString   := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
             DMTE.cdsTrans.FieldByName('DCAASEM').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
             DMTE.cdsTrans.FieldByName('DCAATRI').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
             DMTE.cdsTrans.FieldByName('DCUSER').AsString   := DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString;

             DMTE.DisplayDescrip('prvTGE','TGE202','CTADES','CIAID='+QuotedStr(dblcCia.Text)
                               +' AND CUENTAID='+Quotedstr(DMTE.cdsTrans.FieldByName('CUENTAID').AsString),'CTADES');
             DMTE.cdsTrans.FieldByName('CTADES').AsString  := DMTE.cdsQry.FieldByName('CTADES').AsString;


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
         end;
         DMTE.cdsCntCaja.Next;

   end;
   DMTE.cdsTrans.Post;
   DMTE.cdsTrans.Filter := 'DEBE>0 OR HABER>0';
   DMTE.cdsTrans.Filtered := True;
   DMTE.cdsCntCaja.IndexFieldNames := '';
end;

procedure TFFondoFijo.dbeGiradoAExit(Sender: TObject);
begin
   rgJustif.OnClick(Self);
end;

procedure TFFondoFijo.rgJustifClick(Sender: TObject);
begin
   if (DMTE.wModo='M') then
   begin
      if (DMTE.cdsEgrCaja.Fieldbyname('ECESTADO').AsString='C') or (wExit) then Exit;
   end;
   if rgJustif.ItemIndex =0 then//Reembolso
   begin
      dbeNoChq.Visible     := True;
      dbeNoChq.Enabled     := True;

      if DMTE.wModo = 'A' then
         dblcCheques.Text    := ''
      else
         if (DMTE.wModo = 'M') and (Length(Trim(dblcCheques.Text))=0) then
            dblcCheques.Text    := '';

      if DMTE.wModo = 'A' then
         dbeNoChq.Text    := ''
      else
         if (DMTE.wModo = 'M') and (Length(Trim(dbeNoChq.Text))=0) then
            dbeNoChq.Text    := '';

      if DMTE.wModo = 'A' then
         dbdtpFEmis.Date     := 0
      else
         if (DMTE.wModo = 'M') and (dbdtpFEmis.Date=0) then
            dbdtpFEmis.Date     := 0;

      if DMTE.wModo = 'A' then
         dbeImporte.Text     := ''
      else
         if (DMTE.wModo = 'M') and (Length(Trim(dbeImporte.Text))=0) then
            dbeImporte.Text     := '';

      dblcCheques.Visible  := False;
      dbdtpFEmis.Enabled   := True;
      //dbdtpFEmis.Date      := 0;
      dbeImporte.Enabled   := True;
      Z2bbtnEmiChq.Enabled := True;
      //dbeImporte.Text      := '';
   end
   else
      if rgJustif.ItemIndex =1 then//Justificacion
      begin
         dbeNoChq.Visible    := False;
         if DMTE.wModo = 'A' then
            dblcCheques.Text    := ''
         else
            if (DMTE.wModo = 'M') and (Length(Trim(dblcCheques.Text))=0) then
               dblcCheques.Text    := '';


         dblcCheques.Visible := True;
         dblcCheques.Enabled := False;
         dbdtpFEmis.Enabled  := False;
         if DMTE.wModo = 'A' then
            dbdtpFEmis.Date     := 0
         else
            if (DMTE.wModo = 'M') and (dbdtpFEmis.Date=0) then
               dbdtpFEmis.Date     := 0;

         dbeImporte.Enabled  := False;
         Z2bbtnEmiChq.Enabled := False;
         if DMTE.wModo = 'A' then
            dbeImporte.Text     := ''
         else
            if (DMTE.wModo = 'M') and (Length(Trim(dbeImporte.Text))=0) then
               dbeImporte.Text     := ''

      end;

end;
procedure TFFondoFijo.GrabaCompNoProv;
var
   xMontoL,xMontoE :string;
   xAdicional : double;
begin
   DMTE.cdsECRepo.DisableControls ;
   DMTE.cdsECRepo.First ;
   while not DMTE.cdsECRepo.Eof do begin
      if DMTE.cdsECRepo.FieldByName('ECNOCHQ').AsString =dblcCheques.Text  then
      begin

         DMTE.cdsECRepo.Edit;
         if DMTE.cdsECRepo.FieldByName('TMONID').Value = DMTE.wTMonLoc then
         begin
             xMontoL := FloatToStrF(OperClientDataSet(DMTE.cdsRegCxP,'SUM(DEMTOLOC)','')+OperClientDataSet(DMTE.cdsDocPago,'SUM(DEMTOLOC)',''),ffFixed,8,2);
             DMTE.cdsECRepo.FieldByName('ECSALMN').AsFloat := DMTE.cdsECRepo.FieldByName('ECMTOLOC').AsFloat -
                                                            DMTE.numerononulo(DMTE.cdsECRepo.FieldByName('ECCOBLOC'))-
                                                            StrToFloat(xMontoL);
             xAdicional := DMTE.FRound(StrToFloat(xMontoL) / DMTE.cdsECRepo.FieldByName('ECTCAMB').AsFloat,15,2 ) ;
             DMTE.cdsECRepo.FieldByName('ECSALME').Value := DMTE.cdsECRepo.FieldByName('ECMTOEXT').AsFloat -
                                                            DMTE.numerononulo(DMTE.cdsECRepo.FieldByName('ECCOBEXT'))-
                                                            xAdicional ;
         end
         else
         begin
             xMontoE := FloatToStrF(OperClientDataSet(DMTE.cdsRegCxP,'SUM(DEMTOEXT)','')+OperClientDataSet(DMTE.cdsDocPago,'SUM(DEMTOEXT)',''),ffFixed,8,2);
             DMTE.cdsECRepo.FieldByName('ECSALME').AsFloat := DMTE.cdsECRepo.FieldByName('ECMTOEXT').AsFloat -
                                                            DMTE.numerononulo(DMTE.cdsECRepo.FieldByName('ECCOBEXT'))-
                                                            StrToFloat(xMontoE);
             xAdicional := DMTE.FRound(StrToFloat(xMontoE) * DMTE.cdsECRepo.FieldByName('ECTCAMB').AsFloat,15,2); // ) ;
             DMTE.cdsECRepo.FieldByName('ECSALMN').Value := DMTE.cdsECRepo.FieldByName('ECMTOLOC').AsFloat -
                                                            DMTE.numerononulo(DMTE.cdsECRepo.FieldByName('ECCOBLOC'))-
                                                            xAdicional ;
         end ;

         if (DMTE.cdsECRepo.FieldByname('TDIARIO2' ).AsString=dblcTDiario.Text) and
            (DMTE.cdsECRepo.FieldByname('ECANOMM2' ).AsString=edtPeriodo.Text ) and
            (DMTE.cdsECRepo.FieldByname('ECNOCOMP2').AsString=dbeNoComp.Text  ) then
            DMTE.cdsECRepo.FieldByname('FLAGVAR').Value:='S'
         else begin
            DMTE.cdsECRepo.FieldByname('FLAGVAR').Value:='N';
         end;
      end;
      DMTE.cdsECRepo.Next;
   end;
   DMTE.cdsECRepo.EnableControls ;
end;

procedure TFFondoFijo.Grid1;
begin
   DMTE.cdsECRepo.Edit;
   if DMTE.cdsECRepo.FieldByname('FLAGVAR' ).AsString = 'N' then
    begin
     DMTE.cdsECRepo.FieldByname('FLAGVAR' ).AsString  :='S';
     DMTE.cdsECRepo.FieldByname('TDIARIO2' ).AsString := dblcTDiario.Text;
     DMTE.cdsECRepo.FieldByname('ECANOMM2' ).AsString := edtPeriodo.Text;
     DMTE.cdsECRepo.FieldByname('ECNOCOMP2').AsString := dbeNoComp.Text;
    end
   else
    begin
     DMTE.cdsECRepo.FieldByname('FLAGVAR' ).AsString  := 'N';
     DMTE.cdsECRepo.FieldByname('TDIARIO2' ).AsString := '';
     DMTE.cdsECRepo.FieldByname('ECANOMM2' ).AsString := '';
     DMTE.cdsECRepo.FieldByname('ECNOCOMP2').AsString := '';
    end;
   DMTE.cdsECRepo.Post ;
end;

procedure TFFondoFijo.dblcChequesExit(Sender: TObject);
begin
   if rgJustif.ItemIndex =1 then
   begin
      if Length(Trim(dblcCheques.Text))=0 then
      begin
         dblcCheques.SetFocus ;
         raise Exception.Create('Seleccione Cheque')
      end;
   end;
end;

procedure TFFondoFijo.dblcChequesChange(Sender: TObject);
begin
   if wExit then Exit;
   if DMTE.cdsECRepo.RecordCount>1 then
    begin
     dblcCheques.Text    := DMTE.cdsECRepo.FieldByName('ECNOCHQ').AsString ;
     dbdtpFEmis.Date     := DMTE.cdsECRepo.FieldByName('ECFEMICH').AsDateTime ;
     dbdtpFEmis.Enabled  := False;
     if dblcTMon.Text = DMTE.wTMonLoc then
      dbeImporte.Text  := Floattostr(DMTE.cdsECRepo.FieldByName('ECSALMN').AsFloat)
     else
      if dblcTMon.Text = DMTE.wTMonExt then
       dbeImporte.Text := FloatToStr(DMTE.cdsECRepo.FieldByName('ECSALME').AsFloat);
     dbeImporte.Enabled  := False;
    end;
end;

procedure TFFondoFijo.ActIngNoProv;
begin
   DMTE.cdsECRepo.First;
   While not DMTE.cdsECRepo.Eof do
    begin
     if DMTE.cdsECRepo.FieldByName('ECNOCHQ').AsString = dblcCheques.Text  then
      begin
       DMTE.cdsECRepo.Edit;
       DMTE.cdsECRepo.FieldByName('ECCOBLOC').AsFloat := DMTE.FRound(DMTE.cdsECRepo.FieldByName('ECMTOLOC').AsFloat - DMTE.cdsECRepo.FieldByName('ECSALMN').AsFloat,15,2);
       DMTE.cdsECRepo.FieldByName('ECCOBEXT').AsFloat := DMTE.FRound(DMTE.cdsECRepo.FieldByName('ECMTOEXT').AsFloat - DMTE.cdsECRepo.FieldByName('ECSALME').AsFloat,15,2);
       DMTE.cdsECRepo.Post;
       DMTE.cdsECRepo.ApplyUpdates(0);
      end;
     DMTE.cdsECRepo.Next;
    end;
end;

procedure TFFondoFijo.dbeImporteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key In [' ', 'A'..'Z', 'a'..'z',
             '�', '|', '�', '!', '"', '#', '$', '%', '&', '/', '(', ')',
             '=', '?', '\', '�', '�', '@', '�', '�', '*', '+', '~', '[',
             ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
             '-', '_'] Then
    Key := #0;
end;

procedure TFFondoFijo.dbeImporte2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key In [' ', 'A'..'Z', 'a'..'z',
             '�', '|', '�', '!', '"', '#', '$', '%', '&', '/', '(', ')',
             '=', '?', '\', '�', '�', '@', '�', '�', '*', '+', '~', '[',
             ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
             '-', '_'] Then
    Key := #0;
end;

procedure TFFondoFijo.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.

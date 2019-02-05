unit Caja240;

// HPC_201601_CAJA 11/01/2016: Se define la variable wTMonLocDes para descripción de la Moneda Local
//                             Se define la variable wTMonExtDes para descripción de la Moneda Extranjera
//                             Se cambia valor fijo para descripción de moneda por uso de variable que se carga de tabla de Tipos de Monedas

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls, Db, Wwdatsrc, DBClient, wwclient,
  ComCtrls, Tabnotbk,CAJADM, Menus, Wwlocate, wwDialog, Wwfltdlg, oaContabiliza,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppTypes,
  ppCtrls, ppVar, ppPrnabl, ppBands, ppStrtch, ppSubRpt, ppViewr, Wwkeycb, Variants,
  oaVariables;

type
  TFPagoProvRep = class(TForm)
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
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    lblPeriodo: TLabel;
    lblNoComp: TLabel;
    edtPeriodo: TEdit;
    dbeNoComp: TwwDBEdit;
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
    dbeDH: TwwDBEdit;
    lblTCambio: TLabel;
    dbeTCambio: TwwDBEdit;
    edtCCBco: TEdit;
    lblTMon: TLabel;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    Z2bbtnEmiChq: TBitBtn;
    PopupMenu1: TPopupMenu;
    Buscar1: TMenuItem;
    Filtrar1: TMenuItem;
    N1: TMenuItem;
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
    Label23: TLabel;
    dblcClase: TwwDBLookupCombo;
    edtClase: TEdit;
    dblcdAux: TwwDBLookupComboDlg;
    lblProvRuc: TLabel;
    edtAuxRuc: TEdit;
    lblProvDes: TLabel;
    dbeGiradoA: TwwDBEdit;
    dbeImporte: TwwDBEdit;
    Label18: TLabel;
    lblBanco: TLabel;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TEdit;
    dbeSelMN: TwwDBEdit;
    dbeSelME: TwwDBEdit;
    MaskEdit1: TMaskEdit;
    dbeTC: TwwDBEdit;
    dbeMPL: TwwDBEdit;
    dbeMPE: TwwDBEdit;
    Z2bbtnLiquida: TBitBtn;
    ppdbLiq: TppDBPipeline;
    ppdbLiqD: TppDBPipeline;
    pprLiqP: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppDBText14: TppDBText;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel18: TppLabel;
    ppLine6: TppLine;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    ppDBText25: TppDBText;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel27: TppLabel;
    ppLine9: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    pnlActualizaIng: TPanel;
    Z2bbtnOKDet: TBitBtn;
    Z2bbtnCancelDet: TBitBtn;
    dbeNoRegIng: TwwDBEdit;
    edtCuenta2Ing: TwwDBEdit;
    dblcTMonIng: TwwDBLookupCombo;
    dbeImporteIng: TwwDBEdit;
    edtTMonIng: TEdit;
    edtMtoLocIng: TwwDBEdit;
    edtMtoExtIng: TwwDBEdit;
    dbeDHIng: TwwDBEdit;
    dbeTCamPrIng: TwwDBEdit;
    dblcdCCostoIng: TwwDBLookupComboDlg;
    edtCnp2Ing: TEdit;
    dblcClaseDetIng: TwwDBLookupCombo;
    edtClaseDetIng: TEdit;
    dblcdAuxDetIng: TwwDBLookupComboDlg;
    dbeAuxDetIng: TwwDBEdit;
    StaticText2: TStaticText;
    dblcdCnp22: TwwDBLookupComboDlg;
    PnlFPago: TPanel;
    Z2OkDetalle: TBitBtn;
    bbtnCancFPago: TBitBtn;
    StaticText1: TStaticText;
    dblcFormPago: TwwDBLookupCombo;
    dbeNoChq: TwwDBEdit;
    dbeRecibido: TwwDBEdit;
    dblcBancoFPago: TwwDBLookupCombo;
    edtBcoFPago: TEdit;
    edtFormPago: TEdit;
    dblcTMonC: TwwDBLookupCombo;
    edtTMonC: TEdit;
    Edit6: TEdit;
    dbeACobrar: TwwDBEdit;
    dbeResta: TwwDBEdit;
    chkAsignaResto: TCheckBox;
    BitBtn2: TBitBtn;
    dblcTarjeta: TwwDBLookupCombo;
    edtTarjeta: TEdit;
    dbdtpFecEmi: TwwDBDateTimePicker;
    dbdtpFecVenc: TwwDBDateTimePicker;
    pnlDetPago: TPanel;
    Label22: TLabel;
    dbgDetFPago: TwwDBGrid;
    Z2bbtnAdicFPago: TwwIButton;
    dbgDetPago: TwwDBGrid;
    Z2dbgDetPagoIButton: TwwIButton;
    edtCuenta: TEdit;
    Z2bbtnEmite: TBitBtn;
    pprRecibo: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppnNombre: TppLabel;
    ppLbDescrip: TppLabel;
    pplbFecha: TppLabel;
    ppLabel5: TppLabel;
    ppLabel1: TppLabel;
    ppLbDescrip1: TppLabel;
    ppShape1: TppShape;
    pplbValor: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDBText6: TppDBText;
    ppdbRecibo: TppDBPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    ppField7: TppField;
    ppField8: TppField;
    ppField9: TppField;
    ppField10: TppField;
    ppField11: TppField;
    dbgSelec: TwwDBGrid;
    pnlBuscaNoProv: TPanel;
    isBuscaPagoNoProv: TwwIncrementalSearch;
    lblBuscaNoProv: TLabel;
    Label5: TLabel;
    PopupMenu2: TPopupMenu;
    Button1: TButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure IniciaPanel;
    procedure LimpiaFiltros;
    procedure dblcCiaExit(Sender: TObject);
    procedure z2bbtnCancelClick(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
//    procedure dblcFormPagoChange(Sender: TObject);
//    procedure dblcBancoChange(Sender: TObject);
//    procedure dblcCCBcoChange(Sender: TObject);
    procedure z2bbtnCalcClick(Sender: TObject);
//    procedure dblcTDocChange(Sender: TObject);
//    procedure dblcTDocExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure z2bbtnSumatClick(Sender: TObject);
    procedure z2bbtnSumatDocPagoClick(Sender: TObject);
    procedure z2bbtnSumatSelecClick(Sender: TObject);
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
    procedure dblcTMonExit(Sender: TObject);
//    procedure dblcBancoExit(Sender: TObject);
//    procedure dblcCCBcoExit(Sender: TObject);
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
    procedure dbgDocPagoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
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
    procedure EstablecerFiltrosRegistroEgresos;
    procedure dbeNoRegExit(Sender: TObject);
    procedure z2bbtnOK2Click(Sender: TObject);
    procedure dblcTMon2Exit(Sender: TObject);
    procedure dbeDHChange(Sender: TObject);
    procedure dbeImporte2Exit(Sender: TObject);
    procedure z2bbtnCancel3Click(Sender: TObject);
    procedure dbgOtrosDblClick(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeNoChqChange2(Sender: TObject);
    procedure dbeTCambioChange2(Sender: TObject);
    procedure dblcFormPagoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeTCambioEnter(Sender: TObject);
    procedure dbeImporteEnter(Sender: TObject);
    procedure dbeImporteExit(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure dblcTDoc2Exit2(Sender: TObject);
    procedure dblcClaseDetExit(Sender: TObject);
    procedure dblcdAuxEnter2(Sender: TObject);
    procedure dblcdAuxExit2(Sender: TObject);
    procedure dblcdCnp2Exit2(Sender: TObject);
    procedure wwDBEdit1Change22(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblcClaseExit(Sender: TObject);
    procedure dblcdAuxExit(Sender: TObject);
    procedure dbgSelecDblClick(Sender: TObject);
    procedure dbgSelecCheckValue(Sender: TObject;
      PassesPictureTest: Boolean);
    procedure dbgSelecKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dblcBancoExit(Sender: TObject);
    procedure dbgSelecColExit(Sender: TObject);
    procedure dbeTCExit(Sender: TObject);
    procedure dbeMPLExit(Sender: TObject);
    procedure dbeMPEExit(Sender: TObject);
    procedure Z2bbtnLiquidaClick(Sender: TObject);
    procedure dblcTDoc2Enter(Sender: TObject);
    procedure Z2dbgDetPagoIButtonClick(Sender: TObject);
    procedure dbeNoRegIngExit(Sender: TObject);
    procedure dblcdCnp22Exit(Sender: TObject);
    procedure dblcClaseDetIngExit(Sender: TObject);
    procedure dblcdAuxDetIngExit(Sender: TObject);
    procedure dblcTMonIngExit(Sender: TObject);
    procedure dbeDHIngChange(Sender: TObject);
    procedure dbeImporteIngExit(Sender: TObject);
    procedure Z2bbtnOKDetClick(Sender: TObject);
    procedure Z2bbtnAdicFPagoClick(Sender: TObject);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure dblcFormPagoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcBancoFPagoExit(Sender: TObject);
    procedure dblcBancoFPagoNotInList(Sender: TObject;
      LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure dblcTarjetaExit(Sender: TObject);
    procedure dblcTarjetaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcTMonCExit(Sender: TObject);
    procedure dblcTMonCNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dbdtpFecVencExit(Sender: TObject);
    procedure dbeRecibidoChange(Sender: TObject);
    procedure dbeRecibidoEnter(Sender: TObject);
    procedure dbeRecibidoExit(Sender: TObject);
    procedure dbeACobrarEnter(Sender: TObject);
    procedure dbeACobrarExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Z2OkDetalleExit(Sender: TObject);
    procedure bbtnCancFPagoClick(Sender: TObject);
    procedure Z2OkDetalleClick(Sender: TObject);
    procedure Z2bbtnCancelDetClick(Sender: TObject);
    procedure dbgDetPagoCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure dbgDetPagoDblClick(Sender: TObject);
    procedure dbgDetPagoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgDetFPagoDblClick(Sender: TObject);
    procedure dbgDetFPagoEnter(Sender: TObject);
    procedure dbgDetFPagoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Z2bbtnEmiteClick(Sender: TObject);
    procedure pprReciboBeforePrint(Sender: TObject);
    procedure pprReciboPreviewFormCreate(Sender: TObject);
    procedure dbgSelecTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure isBuscaPagoNoProvKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);

  private
    xNReg : Integer;
    cf1: TControlFoco;
    strTmp: String;
//    ctrl: TCustomEdit;
//    evt_Exit: TNotifyEvent;
    A1 : Array of Integer ;
    A2 : Array Of TNotifyEvent ;
    A2digitos ,A4digitos : Array of TWinControl ;
    cdsConceptoC1 : TwwClientDataset ;
    cdsTDiarioDet : TwwClientDataset ;
    //
    wCptoGan  ,
    wCptoPer  ,
    wCtaGan   ,
    wCtaPer   : String ;
    xTC: Currency;
    cdsFiltro: TwwClientDataset;
    xGraboNuevo: Boolean ;
    //
    wFechaCierre: TDatetime;
    wFrecu: Integer;

    xMTOCNTLOC         : Currency   ;
    xMTOCNTEXT         : Currency   ;
    xMONID_PROV        : String ;

    xTotDocS : Double;
    xTotDocD : Double;
    xTotOtrS : Double;
    xTotOtrD : Double;
    xTotSelS : Double;
    xTotSelD : Double;

    xDebeT : Double;
    xHabeT : Double;
    xDebeTD: Double;
    xHabeTD: Double;


    { Private declarations }
    Function  ValidacionCabecera:Boolean;
    procedure RecuperaDescrip;
    procedure AdicIniciaDatos;
    procedure IniciaDatos;
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
    procedure Contabiliza;
    function  ValidaCampo:Boolean;
    procedure ActSaldosMovCxP;
    procedure ActMovCxP;
    procedure RetornaSaldosMovCxP;
    procedure ConsisCancela(var xconsis:Boolean);
    procedure ActPnlBotones;
    procedure ActDetCxP ;
    procedure ActDetCaja ;
    procedure ActualizaFiltro ;
    procedure ActualizaDetCanje ;
    procedure Grid1;
    procedure SaldoPorRendir;
    function  NumeroReposicion : String;
    procedure CalcularSaldo;

    procedure IniciaPanelIng;
    Procedure AdicionaRegistro;
    function ValidaCampoIng:Boolean;
    procedure Inserta;
    procedure CalculaResto;
    procedure ValidacionDatos;
    procedure ValidacionTjaChq;
    procedure ValidacionCobradoTotal;
    procedure GrabaDetalle;
    procedure AcumulaDetFPago;
    procedure GrabaIng;
    procedure Redondear;
    procedure GrabaMontoTotal;
    procedure InsertaIngresoCaja;
    procedure SumaDetIng;
    procedure GrabaClave;
    procedure ActualizaDetalle;
    Procedure EditaRegistro;
    procedure RecalculaReg;
    procedure LLenaEdits;
    procedure GrabaEstadoFPago(xEstado: string);
    procedure Contab_RegCxC;
    procedure AsientoDifTotal;
    function NumtoStr(wNumero:double):string;
    procedure AsignaSaldo;    
//    procedure Contab_DifCamRegCxC;
  public
    { Public declarations }
    procedure Adiciona ;
    procedure Edita (Comp : structComprobante;cds : Twwclientdataset);
    procedure AsignaCDSFiltro(cds : TwwClientDataset) ;

  end;
var
  FPagoProvRep: TFPagoProvRep;
  wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado , wbChq,
  wbcancel2: Boolean;
  wModifica: Boolean;
  wTSalMN, wTSalME : Double;
   wBcoTipCta  : string;

implementation

uses CAJAUTIL, Caja290, oaTE2000;
{$R *.DFM}


{******************************************************************************}

procedure TFPagoProvRep.IniciaDatos;
var
    xSQL : string;
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
   // z2bbtnSumat.Enabled     := False;
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

   dblcCia.Text      := '';   // Código de Compañía
   edtCia.Text       := '';   // Descripción de la Compañía
   edtPeriodo.Text   := '';   // Periodo
   dblcTDiario.Text  := '';   // Tipo de Diario
   edtTDiario.Text   := '';   // Descripción del T.Diario
   dbeNoComp.Text    := '';   // Voucher
   dblcdAux.Text     := '';   // Auxiliar
   edtAuxRuc.Text    := '';   // Auxiliar
   dblcClase.Text    := '';   // Clase
   edtClase.Text     := '';   // Clase
   dbeGiradoA.Text   := '';    // Pago Girado A ....
   dblcTMon.Text     := '';   // Tipo de Moneda
   edtTMon.Enabled   := False;
   edtTMon.Text      := '';   // Descripción de la Moneda
   dbeTCambio.Text   := '';   // Tipo de Cambio
   dblcdCnp.Text     := '';   // Concepto
   dbeGlosa.Text     := '';   // Glosa
   dbeGlosa.Text     := '';   // Glosa
   lblEstado.Caption := '';   //Inicializar el Estado
   wModifica         := False;

   dbgSelec.ColumnByName('ECMTOLOC').FooterValue:='';
   dbgSelec.ColumnByName('ECMTOEXT').FooterValue:='';
   dbgSelec.ColumnByName('ECSALMN').FooterValue :='';
   dbgSelec.ColumnByName('ECSALME').FooterValue :='';

   dbgOtros.ColumnByName('DEMTOLOC').FooterValue:='';
   dbgOtros.ColumnByName('DEMTOEXT').FooterValue:='';

   dbgDocPago.ColumnByName('DESALLOC').FooterValue:='';
   dbgDocPago.ColumnByName('DESALEXT').FooterValue:='';
   dbgDocPago.ColumnByName('DEMTOLOC').FooterValue:='';
   dbgDocPago.ColumnByName('DEMTOEXT').FooterValue:='';

   LimpiaFiltros;

   // Documentos Pendientes
   DMTE.cdsMovCxP.Filter:='';
   DMTE.cdsMovCxP.Filter:='CIAID='+''''+''+'''';
   DMTE.cdsMovCxP.Filtered:=True;

   // Estableciendo el filtro para que el detalle del grid aparezca vacio

   // vhn 22/01/2001
   xSQL:='Select * from CAJA303 '
        +'Where CIAID='''' and ECANOMM='''' and '
        +      'TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsDocPago.Close;
   DMTE.cdsDocPago.DataRequest( xSQL );
   DMTE.cdsDocPago.Open;
   TNumericField(DMTE.cdsDocPago.FieldbyName('DESALLOC')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsDocPago.FieldbyName('DESALEXT')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsDocPago.FieldbyName('DEMTOLOC')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsDocPago.FieldbyName('DEMTOEXT')).displayFormat:= '###,###,##0.00';
   z2bbtnOkCab.Enabled := True ;
end;

{******************************************************************************}
{******************** PROCEDIMIENTOS DE LOS COMPONENTES ***********************}
{******************************************************************************}

{******************************************************************************}
procedure TFPagoProvRep.dblcCiaExit(Sender: TObject);
begin
   edtCia.text:= DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIADES') ;
   if edtCia.Text='' then begin
      ShowMessage('Error : Compañía no Valida');
      dblcCia.SetFocus;
      Exit;
   end;
   DMTE.abreCuentas(dblcCia.text) ;
end;
{******************************************************************************}
procedure TFPagoProvRep.dbdtpFCompExit(Sender: TObject);
begin

   if dblcCia.Focused then Exit;
   if dblcBanco.Focused then Exit;

{   if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, '', dbdtpFComp.Date ) then
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

   If wBcoTipCta='B' Then //Busca en el CAJA402
    begin
     if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, '', dbdtpFComp.Date ) then
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
      //dblcBanco.SetFocus;
   end;
   dblcTDiario.OnExit(dblcTDiario);
end;
{******************************************************************************}
procedure TFPagoProvRep.dblcTDiarioExit(Sender: TObject);
var
   xBanco, xWhere : String;
begin
   if Trim(dblcTDiario.Text) <> '' then
    begin
     edtTDiario.Text := DMTE.DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', 'TDIARID ='+QuotedStr(dblcTDiario.Text), 'TDIARDES');
     xWhere := 'CIAID ='+QuotedStr(dblcCia.Text)+' AND ECANOMM ='+
             QuotedStr(edtPeriodo.Text)+' AND TDIARID ='+QuotedStr(dblcTDiario.Text);
     dbeNoComp.Text := DMTE.StrZero(DMTE.UltimoNum('prvCaja', 'CAJA302', 'ECNOCOMP', xWhere), 10);
     xBanco := DMTE.DisplayDescrip('prvTGE','TGE106', 'BANCOID', 'CCBCOVOUCH ='+QuotedStr(dblcTDiario.Text), 'BANCOID');
    end
   else
    begin
     ShowMessage('Error : Falta Asignar T.Diario a Caja en Referencias');
     dblcBanco.SetFocus;
    end;
end;

{******************************************************************************}
procedure TFPagoProvRep.dblcTMonExit(Sender: TObject);
var
   sFecha,xWhere : String;

begin
   if z2bbtnCancel.Focused then exit;
   if dblcdAux.Focused     then exit;

   edtTMon.text:= DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMon.Text,'TMONDES') ;

   if edtTMon.Text='' then begin
      edtTmon.text   :='';
      dbeTCambio.Text:='';
      dblcTMon.Text  :='';
      ShowMessage('Error : Moneda no Valida');
      dblcTMon.SetFocus;
      Exit;
   end;

   xWhere:='TMONID='+''''+dblcTMon.Text+'''';
   edtTMon.Text:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
   if length(edtTMon.Text)>0 then
   begin
	   sFecha:=' AND FECHA=' +DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date)+''')' ;
//      sFecha :=  formatdatetime('YYYY-MM-DD',dbdtpFComp.Date);
//      xWhere := 'TMONID='+quotedstr(DMTE.wTMonExt)+' AND FECHA='+quotedstr( sFecha );
      xWhere := 'TMONID='+quotedstr(DMTE.wTMonExt)+ sFecha;
      //**
      if length(DMTE.DisplayDescrip('prvTGE','TGE107','TMONID, TCAMVOV',xWhere,'TMONID'))>0 then
          dbeTCambio.Text:=DMTE.cdsqry.fieldbyname('TCAMVOV').Value;
   end;
end;

{******************************************************************************}
procedure TFPagoProvRep.z2bbtnOKClick(Sender: TObject);
Var xWhere,aux ,xFiltro,xDocId: string;
    xFlag : boolean ;

begin
   z2bbtnSumatSelecClick(Sender);
   // consistencia de Datos
   ValidaCabecera2;

   // VALIDA LA CUENTA DEL CONCEPTO
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,dblcdCnp.text,'')) and (dblcTMon.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+DMTE.cdsQry.FieldByName('CUENTAID').AsString+' del Concepto '+dblcdCnp.text+' Se registra sólo en Moneda Extranjera.');
   end;

   // En este punto ya se ha probado todas las consistencias y ya se puede grabar
   // Actualizamos el Client Data Set de Egr.Caja (CAJA302)

   with DMTE do
   begin
     cdsEgrCaja.Edit;
     cdsEgrCaja.FieldByName('CIAID').Value   :=dblcCia.Text;
     cdsEgrCaja.FieldByName('TDIARID').Value :=dblcTDiario.Text;
     cdsEgrCaja.FieldByName('ECANOMM').Value :=edtPeriodo.Text;
     cdsEgrCaja.FieldByName('ECNOCOMP').Value:=dbeNoComp.Text;
     cdsEgrCaja.FieldByName('CLAUXID').Value :=dblcClase.Text;
     cdsEgrCaja.FieldByName('PROV').Value    :=dblcdAux.Text;
     cdsEgrCaja.FieldByName('PROVRUC').Value :=edtAuxRuc.Text;
     cdsEgrCaja.FieldByName('ECFCOMP').Value :=dbdtpFComp.Date;
     cdsEgrCaja.fieldBYName('ECFEMICH').AsDateTime := dbdtpFComp.Date ;
     cdsEgrCaja.FieldByName('BANCOID').Value :=dblcBANCO.Text;

     xWhere :=' DOCTIPREG=''RR'' AND DOCMOD=''CAJA'' ';
     xDocId := DMTE.DisplayDescrip('prvTGE','TGE110','DOCID',xWhere,'DOCID');
     cdsEgrCaja.FieldByName('DOCID').Value   := DMTE.cdsQry.fieldbyname('DOCID').AsString;
     cdsEgrCaja.FieldByName('ECNODOC').Value := dbeNoComp.Text;
     //
     cdsEgrCaja.FieldByName('TMONID').Value  :=dblcTMon.Text;
     cdsEgrCaja.FieldByName('ECTCAMB').Value :=strtofloat(dbeTCambio.Text);

     if cdsEgrCaja.FieldByName('TMONID').Value=wTMonLoc then
     begin
        cdsEgrCaja.FieldByName('ECMTOORI').Value:= xTotSelS;
        cdsEgrCaja.FieldByName('ECMTOLOC').Value:= xTotSelS;
        cdsEgrCaja.FieldByName('ECMTOEXT').Value:= DMTE.FRound( xTotSelS/strtofloat(dbeTCambio.Text), 15, 2 );
     end
     else
     begin
        cdsEgrCaja.FieldByName('ECMTOORI').Value:= xTotSelD;
        cdsEgrCaja.FieldByName('ECMTOLOC').Value:= DMTE.FRound( xTotSelD*strtofloat(dbeTCambio.Text), 15, 2 );
        cdsEgrCaja.FieldByName('ECMTOEXT').Value:= xTotSelD;
     end;
     //fin de codigo adicionado
     cdsEgrCaja.FieldByName('ECGIRA').Value  := dbeGiradoA.Text;
     cdsEgrCaja.FieldByName('CPTOID').Value  := dblcdCnp.Text;
     cdsEgrCaja.FieldByName('ECGLOSA').Value := dbeGlosa.Text;
     cdsEgrCaja.FieldByName('CUENTAID').Value := edtCuenta.text;
     cdsEgrCaja.FieldByName('ECESTADO').Value :='I';

     xWhere:='FECHA=' +DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date)+''')';
     aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
     cdsEgrCaja.FieldByName('ECANO').Value  := cdsqry.FieldByName('FECANO').Value;
     cdsEgrCaja.FieldByName('ECMM').Value   := cdsqry.FieldByName('FECMES').Value;
     cdsEgrCaja.FieldByName('ECDD').Value   := cdsqry.FieldByName('FECDIA').Value;
     cdsEgrCaja.FieldByName('ECSS').Value   := cdsqry.FieldByName('FECSS').Value;
     cdsEgrCaja.FieldByName('ECSEM').Value  := cdsqry.FieldByName('FECSEM').Value;
     cdsEgrCaja.FieldByName('ECTRI').Value  := cdsqry.FieldByName('FECTRIM').Value;
     cdsEgrCaja.FieldByName('ECAASS').Value := cdsqry.FieldByName('FECAASS').Value;
     cdsEgrCaja.FieldByName('ECAASEM').Value:= cdsqry.FieldByName('FECAASEM').Value;
     cdsEgrCaja.FieldByName('ECAATRI').Value:= cdsqry.FieldByName('FECAATRI').Value;
     cdsEgrCaja.FieldByName('EC_PROCE').Value:='R';
     cdsEgrCaja.FieldByName('EC_IE').Value   :='E';
   end;

   // Actualizamos el Detalle mostrado en el grid ante posibles cambios del
   // Tipo de Cambio
//   if DMTE.cdsIngDocs.RecordCount>0 then
//   begin
   SumaDetIng;
   AcumulaDetFPago;
//   end;
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
         xFlag := True
      else
         xFlag := False ;

//      if DMTE.cdsmovcxp.RecordCount = 0 then
      if xFlag then
      begin
         //Comprobar si hay mov seleccionados con otro proveedor
         if xFlag then
         begin
            xWhere:='CIAID = '''  + dblcCia.Text  + ''' and '
                   +'CPESTADO ='''+    'P'        + ''' and '
                   +'CLAUXREND='''+ dblcClase.Text+ ''' and '
                   +'AUXIDREND='''+ dblcdAux.Text + ''' ';

            xFiltro:= ' (( (CPMTOORI-CPPAGORI-CPSALORI)>-0.01 and (CPMTOORI-CPPAGORI-CPSALORI)<0.01 ) OR '
                    + ' ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) ';
//wmci0910
            DMTE.cdsMovCxP.Filter   := '' ;
            DMTE.cdsMovCxP.Filtered := False ;
//wmcf0910
            DMTE.cdsMovCxP.active := False ;
            DMTE.cdsMovCxP.DataRequest( 'SELECT * FROM CXP301 WHERE ' + xWhere );
            DMTE.cdsMovCxP.Active := True ;

            DMTE.cdsMovCxP.Filter   := xFiltro ;
            DMTE.cdsMovCxP.Filtered := True ;
            TNumericField(DMTE.cdsMovCxP.FieldbyName('CPTCAMPR')).displayFormat:= '###,###,##0.00';
            TNumericField(DMTE.cdsMovCxP.FieldbyName('CPMTOORI')).displayFormat:= '###,###,##0.00';
            TNumericField(DMTE.cdsMovCxP.FieldbyName('CPSALLOC')).displayFormat:= '###,###,##0.00';
            TNumericField(DMTE.cdsMovCxP.FieldbyName('CPSALEXT')).displayFormat:= '###,###,##0.00';



         end ;
      end ;
//*****************************
   // Estado de los componentes
   pnlCabecera1.enabled  := False;
   pnlCabecera2.enabled  := False;
   pnlDetalle.enabled    := True;
   pnlBotones.Enabled    := True;
   ActPnlBotones;

   TabbedNotebook1.PageIndex:=1;
   z2bbtnSumatClick( Self );
   TabbedNotebook1.PageIndex:=0;
   z2bbtnSumatDocPagoClick( Self );
   SaldoPorRendir;

   z2bbtnOk.Enabled        := False;
   z2bbtnCancel.Enabled    := False;
end;
{******************************************************************************}
procedure TFPagoProvRep.z2bbtnCancelClick(Sender: TObject);
begin
   if DMTE.cdsEgrCaja.Active=True then DMTE.cdsEgrCaja.CancelUpdates;
   if DMTE.cdsRegCxP.Active=True then DMTE.cdsRegCxP.CancelUpdates;
   if DMTE.cdsDocPago.Active=True then DMTE.cdsDocPago.CancelUpdates;
   if DMTE.cdsMovCxP.Active=True then DMTE.cdsMovCxP.CancelUpdates;
{0505
   IniciaDatos;
   z2bbtnokcab.Enabled:=True;
}
   Adiciona ;
   AdicIniciadatos ;

end;

{******************************************************************************}
procedure TFPagoProvRep.z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('calc.exe',1);  //Activa la calculadora del Windows
end;
{******************************************************************************}

procedure TFPagoProvRep.z2bbtnSumatSelecClick(Sender: TObject);
var
   xTSalLoc, xTSalExt, xTPagoMN, xTPagoME : DOUBLE;
   xRegAct : TBookMark;
begin
// Totales de Documentos pagados
   DMTE.cdsECRepo.DisableControls;
   xRegAct := DMTE.cdsECRepo.GetBookmark;
   xTSalLoc:=0;  xTSalExt:=0;  wTSalME:=0;  wTSalMN:=0;
   DMTE.cdsECRepo.First ;
   while not DMTE.cdsECRepo.Eof do
   begin
      if (DMTE.cdsECRepo.FieldByname('ECNOCOMP2').AsString=dbeNoComp.Text)  then
      begin
         xTSalLoc:=xTSalLoc + DMTE.cdsECRepo.FieldByName('ECMTOLOC').AsFloat;
         xTSalExt:=xTSalExt + DMTE.cdsECRepo.FieldByName('ECMTOEXT').AsFloat;
         wTSalMN :=wTSalMN  + DMTE.cdsECRepo.FieldByname('ECSALMN').AsFloat;
         wTSalME :=wTSalME  + DMTE.cdsECRepo.FieldByname('ECSALME').AsFloat;
      end;
      DMTE.cdsECRepo.Next;
   end;

   dbgSelec.ColumnByName('ECMTOLOC').FooterValue := FloatToStrF(xTSalLoc, ffNumber, 12, 2);
   dbgSelec.ColumnByName('ECMTOEXT').FooterValue := FloatToStrF(xTSalExt, ffNumber, 12, 2);
{   dbgSelec.ColumnByName('ECSALMN').FooterValue :=floattostrf(xTSalLoc, ffNumber, 12, 2);
   dbgSelec.ColumnByName('ECSALME').FooterValue :=floattostrf(xTSalExt, ffNumber, 12, 2);}
   if (wTSalMN<0) and (wTSalME=0) then wTSalMN := 0;
   if (wTSalMN=0) and (wTSalME<0) then wTSalME := 0;
   dbgSelec.ColumnByName('ECSALMN').FooterValue := FloatToStrF(wTSalMN, ffNumber, 12, 2);
   dbgSelec.ColumnByName('ECSALME').FooterValue := FloatToStrF(wTSalME, ffNumber, 12, 2);

   DMTE.cdsECRepo.GotoBookmark(xRegAct);
   DMTE.cdsECRepo.FreeBookmark(xRegAct);

   DMTE.cdsECRepo.EnableControls;

// Total Seleccionado a Rendir Cuenta
   xTPagoMN:=0; xTPagoME:=0;
// Documentos Provisionados Seleccionados
   DMTE.cdsDocPago.DisableControls;
   DMTE.cdsDocPago.First;
   while not DMTE.cdsDocPago.EOF do
   begin
      xTPagoMN:=xTPagoMN+DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
      xTPagoME:=xTPagoME+DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
      DMTE.cdsDocPago.Next;
   end;
   DMTE.cdsDocPago.EnableControls;
// Otros Documentos
   DMTE.cdsRegCxP.DisableControls;
   DMTE.cdsRegCxP.First;
   while not DMTE.cdsRegCxP.EOF do
   begin
      xTPagoMN:=xTPagoMN+DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
      xTPagoME:=xTPagoME+DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
      DMTE.cdsRegCxP.Next;
   end;
   DMTE.cdsRegCxP.EnableControls;
// Devoluciones
   DMTE.cdsRegCxC.DisableControls;
   DMTE.cdsRegCxC.First;
   while not DMTE.cdsRegCxC.EOF do
   begin
      xTPagoMN:=xTPagoMN+DMTE.cdsRegCxC.FieldByName('DEMTOLOC').AsFloat;
      xTPagoME:=xTPagoME+DMTE.cdsRegCxC.FieldByName('DEMTOEXT').AsFloat;
      DMTE.cdsRegCxC.Next;
   end;
   DMTE.cdsRegCxC.EnableControls;
//

   dbeSelMN.Text:=floattostrf(xTPagoMN, ffNumber, 12, 2);
   dbeSelME.Text:=floattostrf(xTPagoME, ffNumber, 12, 2);


   if dblcTMon.Text=DMTE.wTMonLoc then
      dbeImporte.Text:=floattostr( wTSalMN )
   else
      dbeImporte.Text:=floattostr( wTSalME );

   xTotSelS:=wTSalMN;
   xTotSelD:=wTSalME;
end;

{******************************************************************************}
procedure TFPagoProvRep.z2bbtnSubeClick(Sender: TObject);
begin
   DMTE.cdsEgrCaja.Edit;
   DMTE.cdsRegCxP.Edit;

   pnlCabecera2.Enabled:= True;
   dbgSelec.Enabled    := True;
   dbgSelec.ReadOnly   := False;
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
procedure TFPagoProvRep.z2bbtnCancel2Click(Sender: TObject);
begin
   if MessageDlg('¿Anular los cambios?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin
      DMTE.cdsEgrCaja.CancelUpdates;
      DMTE.cdsRegCxP.CancelUpdates;
      DMTE.cdsMovCxP.CancelUpdates;
      DMTE.cdsDocPago.CancelUpdates;
      IniciaDatos;
   end;
end;
{******************************************************************************}
procedure TFPagoProvRep.z2bbtnNuevoClick(Sender: TObject);
begin
   if DMTE.cdsEgrCaja.FieldByName('ECEstado').Value ='I' then
   begin
      if wmodifica then
      begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      end;
      if MessageDlg('¿Nuevo Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin
         Adiciona ;
         AdicIniciadatos ;
      end;
   end
   else
   begin
      Adiciona ;
      AdicIniciadatos ;
   end;
end;
{******************************************************************************}
procedure TFPagoProvRep.z2bbtnGrabaClick(Sender: TObject);
var
  xSQL : string;
  fRendMN,fRendME :double;
begin
   if DMTE.cdsEgrCaja.FieldByName('ECEstado').Value='I' then
   begin
      if MessageDlg('¿Desea Grabar?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
      begin
         z2bbtnSumatDocPagoclick(nil);
         dbgDocPago.RefreshDisplay;

         ActSaldosMovCxP;

         DMTE.cdsEgrCaja.edit;

         if Length(Trim(dbeSelMN.text))=0 then
         begin
            fRendMN := 0;
            fRendME := 0;
         end
         else
         begin
            fRendMN := strtoFloat(dbeSelMN.text);
            fRendME := strtoFloat(dbeSelME.text);
         end;

        if dblcTMon.Text = DMTE.wTMonLoc then
           DMTE.cdsEgrCaja.FieldByName('ECMTOORI').Value:= fRendMN
        else
           if dblcTMon.Text = DMTE.wTMonExt then
              DMTE.cdsEgrCaja.FieldByName('ECMTOORI').Value:= fRendME;

        DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').Value:= fRendMN;
        DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').Value:= fRendME;


         DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString  := DMTE.wUsuario; // usuario que registra
         DMTE.cdsEgrCaja.FieldByName('ECFREG').AsDateTime:= DateS;         // fecha que registra Usuario
         DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;         // Hora de Registro de Usuario

         cdspost(DMTE.cdsEgrCaja);
         xSQL:='Select * from CAJA302 '
              +'Where CIAID='''   +dblcCia.Text    +''' and '
              +      'ECANOMM=''' +edtPeriodo.Text +''' and '
              +      'TDIARID=''' +dblcTDiario.Text+''' and '
              +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
         DMTE.cdsEgrCaja.DataRequest( xSQL );

         DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

         DMTE.AplicaDatos(DMTE.cdsRegCxP,'REGCXP');

         if DMTE.cdsDocPago.RecordCount>0 then
            DMTE.AplicaDatos(DMTE.cdsDocPago,'REGCXP');

         DMTE.cdsECRepo.ApplyUpdates(0);
//         DMTE.AplicaDatos(DMTE.cdsECRepo,'REGCXP');

         SumaDetIng;
         AcumulaDetFPago;

         if DMTE.cdsRegCxC.RecordCount>0 then
            GrabaIng;

         z2bbtnSumatClick(sender);

         z2bbtnSumatSelecClick(Sender);

         ShowMessage('Grabacion OK');

         z2bbtnNuevo.Enabled    := True;
         z2bbtnCancelado.Enabled:= True;
         z2bbtnAnula.Enabled    := True;
         z2bbtnImprime.Enabled  := True;
         wmodifica:=False;
      end
   end
   else
   begin
      ShowMessage('Imposible Grabar');
   end;
end;
{******************************************************************************}
procedure TFPagoProvRep.z2bbtnCanceladoClick(Sender: TObject);
var
   xConsis:Boolean;
   xSQL : string;
   xCobLoc,xCobExt : Double;
   fRendMN,fRendME : Double;

begin
   if DMTE.cdsEgrCaja.FieldByName('ECEstado').Value='I' then
    begin
     if wModifica then
      begin
       ShowMessage('Debe grabar primero las actualizaciones realizadas');
       Exit;
      end;

     DMTE.cdsRegCxP.DisableControls;
     ConsisCancela(xConsis);
     DMTE.cdsRegCxP.EnableControls;
     if not xConsis then
      ShowMessage('No se puede dar conformidad la Rendición de Cuenta')
     else
      begin
       if MessageDlg('¿Efectuar la Confirmación de la Rendición?',mtConfirmation,
                      [mbYes, mbNo], 0)=mrYes then
        begin
         /////////////////////////////////////
         // Documentos Provisionados en CXP //
         /////////////////////////////////////
         // actualiza Saldo de Documentos Provisionados
         ActMovCxP;
         // actualiza Pagos de Documentos Provisionados
         ActualizaDetCanje ;  // Revisar

         /////////////////////////////////////////
         // Otros Pagos No Provisionados en CXP //
         /////////////////////////////////////////
         // No se registra nada ya que en el botón de Grabación se registra ya el documento

         /////////////////////////////////////////
         // Devoluciones                        //
         /////////////////////////////////////////
         // actualiza Documentos de Ingreso (devoluciones)
         xCobLoc   := OperClientDataSet(
                              DMTE.cdsDetFPago ,'SUM(FC_RECIBIDO)' , 'TMONID = ''' + DMTE.wTMonLoc + ''''  );
         xCobExt   := OperClientDataSet(
                              DMTE.cdsDetFPago ,'SUM(FC_RECIBIDO)' , 'TMONID = ''' + DMTE.wTMonExt + ''''  );

         DMTE.cdsIngDocs.edit;
         DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString := 'C';
       // Cálculo de Cobrados soles dólares
         DMTE.cdsIngDocs.FieldByName('ECCOBLOC').AsFloat   := xCobLoc;
         DMTE.cdsIngDocs.FieldByName('ECCOBEXT').AsFloat   := xCobExt;
         DMTE.cdsIngDocs.FieldByName('NCOUSER').AsString   := DMTE.wUsuario;
         DMTE.cdsIngDocs.FieldByName('NCOFREG').AsString   := DateToStr(Date);
         DMTE.cdsIngDocs.FieldByName('NCOHREG').AsDateTime := SysUtils.Time;//SystemTimeToDateTime(SystemTime);
         DMTE.cdsIngDocs.Post;

         xSQL := 'Select * From CXC303 '
                  +'Where CIAID='''   +DMTE.cdsIngDocs.FieldByName('CIAID').AsString   +''' and '
                  +      'DOCID='''   +DMTE.cdsIngDocs.FieldByName('DOCID').AsString   +''' and '
                  +      'CCSERIE=''' +DMTE.cdsIngDocs.FieldByName('CCSERIE').AsString +''' and '
                  +      'CCNODOC=''' +DMTE.cdsIngDocs.FieldByName('CCNODOC').AsString +''' ';
         DMTE.cdsIngDocs.DataRequest( xSQL );
         DMTE.AplicaDatos( DMTE.cdsIngDocs, 'INGDOCS' );

////////////////////////////////////////////////////////////////////////////////
{            DMTE.cdsECRepo.DisableControls;
            DMTE.cdsECRepo.First ;
            while not DMTE.cdsECRepo.Eof do
            begin
               if (DMTE.cdsECRepo.FieldByname('ECNOCOMP2').AsString=dbeNoComp.Text)  then
               begin
                  DMTE.cdsECRepo.edit;
                  DMTE.cdsECRepo.fieldbyname('ECCOBLOC').AsFloat :=
                                DMTE.cdsECRepo.fieldbyname('ECCOBLOC').AsFloat +
                                DMTE.cdsECRepo.fieldbyname('ECSALMN').AsFloat  ;
                  DMTE.cdsECRepo.fieldbyname('ECSALMN').AsFloat :=
                                DMTE.cdsECRepo.fieldbyname('ECMTOLOC').AsFloat -
                                DMTE.cdsECRepo.fieldbyname('ECCOBLOC').AsFloat  ;

                  DMTE.cdsECRepo.fieldbyname('ECCOBEXT').AsFloat :=
                                DMTE.cdsECRepo.fieldbyname('ECCOBEXT').AsFloat +
                                DMTE.cdsECRepo.fieldbyname('ECSALME').AsFloat  ;
                  DMTE.cdsECRepo.fieldbyname('ECSALME').AsFloat :=
                                DMTE.cdsECRepo.fieldbyname('ECMTOEXT').AsFloat -
                                DMTE.cdsECRepo.fieldbyname('ECCOBEXT').AsFloat  ;

                  if DMTE.cdsECRepo.FieldByName('TMONID').Value=DMTE.wTMonLoc then
                  begin
                     if DMTE.cdsECRepo.fieldbyname('ECMTOLOC').AsFloat = DMTE.cdsECRepo.fieldbyname('ECCOBLOC').AsFloat then
                     begin
                        DMTE.cdsECRepo.fieldbyname('ECSALMN').AsFloat   := 0;
                        DMTE.cdsECRepo.fieldbyname('ECCOBEXT').AsFloat  := DMTE.cdsECRepo.fieldbyname('ECMTOEXT').AsFloat;
                        DMTE.cdsECRepo.fieldbyname('ECSALME').AsFloat   := 0;
                        DMTE.cdsECRepo.FieldByName('ECESTADO').AsString := 'C';
                     end;
                  end
                  else
                  begin
                     if DMTE.cdsECRepo.fieldbyname('ECMTOEXT').AsFloat = DMTE.cdsECRepo.fieldbyname('ECCOBEXT').AsFloat then
                     begin
                        DMTE.cdsECRepo.fieldbyname('ECSALME').AsFloat   := 0;
                        DMTE.cdsECRepo.fieldbyname('ECCOBLOC').AsFloat  := DMTE.cdsECRepo.fieldbyname('ECMTOLOC').AsFloat;
                        DMTE.cdsECRepo.fieldbyname('ECSALMN').AsFloat   := 0;
                        DMTE.cdsECRepo.FieldByName('ECESTADO').AsString := 'C';
                     end;
                  end;
               end;
               DMTE.cdsECRepo.Next;
            end;
////////////////////////////////////////////////////////////////////////////////
            DMTE.cdsECRepo.EnableControls;
            DMTE.cdsECRepo.ApplyUpdates(0);}
         AsignaSaldo;
         DMTE.cdsECRepo.ApplyUpdates(0);

//************************************ACTUALIZA SALDOS**************************
         If wBcoTipCta='C' Then
          begin
           DMTE.ActSaldosCaja(DMTE.cdsIngDocs.FieldByName('CIAID').AsString, DMTE.cdsIngDocs.FieldByName('TMONID').AsString,
                             DMTE.cdsIngDocs.FieldByName('BANCOID').AsString,
                             DMTE.cdsIngDocs.FieldByName('NCOMTOORI').AsString, 'I', DMTE.cdsIngDocs.FieldByName('CCFEMIS').AsString);
          end
         Else
          begin
           DMTE.ActSaldosBancos(DMTE.cdsIngDocs.FieldByName('CIAID').AsString, DMTE.cdsIngDocs.FieldByName('TMONID').AsString,
                               DMTE.cdsIngDocs.FieldByName('BANCOID').AsString,
                               DMTE.cdsIngDocs.FieldByName('CCBCOID').AsString, DMTE.cdsIngDocs.FieldByName('NCOMTOORI').AsString,
                               'I', DMTE.cdsIngDocs.FieldByName('CCFEMIS').AsString);
          end;

{            if ( xCobLoc > 0 ) then
                 with DMTE.cdsIngDocs do
                 DMTE.ActSdoCaja(DMTE.wTMonLoc , fieldbyname('BANCOID').AsString ,
                                       fieldbyname('ECCOBLOC').AsString ,fieldbyname('CCFEMIS').AsString,'I') ;
            if ( xCobExt > 0 ) then
                 with DMTE.cdsIngDocs do
                 DMTE.ActSdoCaja(DMTE.wTMonExt , fieldbyname('BANCOID').AsString ,
                                       fieldbyname('ECCOBEXT').AsString ,fieldbyname('CCFEMIS').AsString,'I') ;}
         GrabaEstadoFPago('C');
   			 if DMTE.cdsDetFPago.ApplyUpdates(0) > 0 then
			    Raise Exception.create ('Error en la grabación de los detalles de cancelación');

         ////////////////////////////////////////////////////////
         // actualiza Cabecera de Rendición
         DMTE.cdsEgrCaja.Edit;

         if Length(Trim(dbeSelMN.Text))=0 then
          begin
           fRendMN := 0;
           fRendME := 0;
          end
         else
          begin
           fRendMN := StrToFloat(dbeSelMN.Text);
           fRendME := StrToFloat(dbeSelME.Text);
          end;

         if dblcTMon.Text = DMTE.wTMonLoc then
          DMTE.cdsEgrCaja.FieldByName('ECMTOORI').Value := fRendMN
         else
          if dblcTMon.Text = DMTE.wTMonExt then
           DMTE.cdsEgrCaja.FieldByName('ECMTOORI').Value := fRendME;

         DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').Value := fRendMN;
         DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').Value := fRendME;


         DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'C';
         DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString   := DMTE.wUsuario; // usuario que registra
         DMTE.cdsEgrCaja.FieldByName('ECFREG').AsDateTime := DateS;         // fecha que registra Usuario
         DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time;         // Hora de Registro de Usuario
         xSQL := 'Select * From CAJA302'
                +' Where CIAID ='+QuotedStr(dblcCia.Text)
                +' And ECANOMM ='+QuotedStr(edtPeriodo.Text)
                +' And TDIARID ='+QuotedStr(dblcTDiario.Text)
                +' And ECNOCOMP ='+QuotedStr(dbeNoComp.Text);

         DMTE.cdsEgrCaja.DataRequest( xSQL );
         DMTE.AplicaDatos(DMTE.cdsEgrCaja, 'EGRCAJA');

         z2bbtnSumatClick(sender);
         dbgPendientes.ReadOnly  := True;
         dbgDocPago.ReadOnly     := True;
         dbgOtros.ReadOnly       := True;
         dbgSelec.ReadOnly       := True;
         z2bbtnCont.Enabled      := True;
         z2bbtnSube.Enabled      := False;
         z2bbtnGraba.Enabled     := False;
         z2bbtnCancelado.Enabled := False;
         z2bbtnCancel2.Enabled   := False;
         z2bbtnAnula.Enabled     := False;
         dbgOtrosIButton.Enabled := False ;

         z2bbtnSumatSelecClick(Sender);
         lblEstado.Caption       := 'Cancelado          ';
         SaldosAux ;
         Beep;
         MessageDlg('Datos Actualizados', mtCustom, [mbOk], 0);
        end;
      end;
    end
   else
    begin
     ShowMessage('El Estado de la Rendición no permite Aceptarla');
    end;
end;
{******************************************************************************}
function TFPagoProvRep.ValidaCampo:Boolean;
var
   xWhere, aux : String;
begin
     Result := True;
     with DMTE do
      begin

        if length(cdsRegCxP.FieldByName('CPNOREG').AsString)=0 then
        begin  //No Registro
           ShowMessage('Falta No Registro');
           Result:=False;
           exit;
        end
        else
        begin
           if length(cdsRegCxP.FieldByName('CPNOREG').AsString)<6 then
           begin
              ShowMessage('Código de Registro Errado');
              Result:=False;
              exit;
           end;
        end;

        //Tipo de Documento
        if length(cdsRegCxP.FieldByName('DOCID2').AsString)>0 then
        begin
           if length(edtTDoc2.Text)=0 then
           begin
              ShowMessage('Código de Tipo de Documento Errado');
              Result:=False;
              exit;
           end;
           if cdsRegCxP.FieldByName('CPSERIE').AsString='' then
           begin      //Serie
              ShowMessage('Falta Serie');
              Result:=False;
              exit;
           end;

           if cdsRegCxP.FieldByName('CPNODOC').AsString='' then
           begin      //No Documento
              ShowMessage('Falta Nro. de Documento');
              Result:=False;
              exit;
           end;

        end;


        if length(cdsRegCxP.FieldByName('TMONID').AsString)=0 then
        begin //Tipo de Moneda
           ShowMessage('Falta Tipo de Moneda');
           Result:=False;
           exit;
        end
        else
        begin
           xWhere:='TMONID='+''''+cdsRegCxP.FieldByName('TMONID').AsString+'''';
           aux   :=DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Tipo de Moneda Errado');
              Result:=False;
              exit;
           end;
        end;

        if cdsRegCxP.FieldByName('DETCDOC').AsFloat<=0 Then
        begin // Tipo de Cambio Detalle
           ShowMessage('Tipo de Cambio debe ser mayor que cero');
           Result:=False;
           exit;
        end;

        if cdsRegCxP.FieldByName('DEMTOORI').AsFloat<=0 Then
        begin   //Importe
           ShowMessage('Importe debe ser mayor que cero');
           Result:=False;
           exit;
        end;

        if cdsRegCxP.FieldByName('CPTOID').AsString='' then
        begin      //Concepto
           ShowMessage('Falta Concepto');
           Result:=False;
           exit;
        end
        else
        begin                             // Cuenta
           aux:=cdsRegCxP.FieldByName('CUENTAID').AsString;
           if length(aux)=0 then
           begin
              ShowMessage('Código de Concepto Errado');
              Result:=False;
              exit;
           end;
        end;

//Validación de centro de costo y auxiliares
        if (dblcdCCosto.Enabled) then
         begin  //Centro de Costo
          If (length(cdsRegCxP.FieldByName('CCOSID').AsString)=0) THEN
           begin
              ShowMessage('Falta Centro de Costo') ;
              Result:=False ;
              Exit ;
           end
          else
          begin
           xWhere:='CCosID='+''''+cdsRegCxP.FieldByName('CCOSID').Value+'''' ;
           aux   :=DisplayDescrip('prvTGE','TGE203','CCOSDES',xWhere,'CCOSDES') ;
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

          {IF trim( dblcClaseDet.Text ) = '' THEN
          BEGIN
              ShowMessage('Ingrese Clase') ;
              Result:=False ;
              exit ;
          END ;}

          IF (trim( dblcdAuxDet.Text ) = '') and (length(Trim(dblcClaseDet.text))>0) THEN
          BEGIN
              ShowMessage('Ingrese Auxiliar') ;
              Result:=False ;
              exit ;
          END

        end ;

        if cdsRegCxP.FieldByName('CPFVCMTO').Value<cdsRegCxP.FieldByName('CPFEMIS').Value then
        begin //Fecha de Vencimiento
             ShowMessage('Fecha de Vencimiento debe ser posterior a la Fecha de Emision');
             Result:=False;
             exit;
        end;
    end;
end;
{******************************************************************************}
procedure TFPagoProvRep.ConsisCancela(Var xConsis:boolean);
var
    xRegAct : TBookMark;
    xSumaRend , xSumaNoProv : double;
begin
   xConsis := True;
   xSumaRend := 0;
   With DMTE do
   begin
   // Pago de Documentos Provisionados
      xRegAct := cdsDocPago.GetBookmark;
      cdsDocPago.First ;
      While not cdsDocPago.Eof do
      Begin
         if cdsEgrCaja.FieldByName('TMONID').Value = wtMonLoc then
            xSumaRend := xSumaRend + strToCurr(stringreplace(cdsDocPago.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]))
         else
            xSumaRend := xSumaRend + strToCurr(stringReplace(cdsDocPago.FieldByName('DEMTOEXT').DisPlayText,',','',[rfReplaceAll])) ;

         cdsDocPago.Next;
      end;
      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);

   // Pago de Documentos No Provisionados
      xRegAct := cdsRegCxP.GetBookmark;
      cdsRegCxP.First ;
      While not cdsRegCxP.Eof do
      Begin
         if cdsRegCxP.FieldByName('DEDH').Value='D' then
            if cdsEgrCaja.FieldByName('TMONID').Value = wtMonLoc then
               xSumaRend := xSumaRend + strToCurr(stringreplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]))
            else
               xSumaRend := xSumaRend + strToCurr(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]))
         else
            if cdsEgrCaja.FieldByName('TMONID').Value = wtMonLoc then
               xSumaRend := xSumaRend - strToCurr( stringreplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) )
            else
               xSumaRend := xSumaRend - strToCurr( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) ) ;

         cdsRegCxP.Next;
      end;
      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);

   // Devoluciones (INGRESOS)
      xRegAct := cdsRegCxC.GetBookmark;
      cdsRegCxC.First ;
      While not cdsRegCxC.Eof do
      Begin

         if cdsEgrCaja.FieldByName('TMONID').Value = wtMonLoc then
            xSumaRend := xSumaRend + strToCurr(stringreplace(cdsRegCxC.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]))
         else
            xSumaRend := xSumaRend + strToCurr(stringReplace(cdsRegCxC.FieldByName('DEMTOEXT').DisPlayText,',','',[rfReplaceAll])) ;

         cdsRegCxC.Next;
      end;
      cdsRegCxC.GotoBookmark(xRegAct);
      cdsRegCxC.FreeBookmark(xRegAct);

   end;

   if DMTE.cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc then
      xSumaNoProv :=  strtocurr(floattostrf(wTSalMN,fffixed,10,2))
   else
      xSumaNoProv :=  strtocurr(floattostrf(wTSalME,fffixed,10,2));

// Suma = Total de los Pagos no provisionados a rendir
// xSumImp = Total de documentos a rendir
   if xSumaRend > xSumaNoProv then
   begin
      xConsis := False;
      ShowMessage('El Monto a rendir es mayor que el Monto No Provisionado');
   end;

end;

{******************************************************************************}
procedure TFPagoProvRep.Contab_Haber;
var
   xSQL : String;
begin
   xSQL:='Select * from CAJA302 '
     +'Where CIAID='''+DMTE.cdsECRepo.FieldByName('CIAID').AsString   +''' and '
     +   'TDIARID=''' +DMTE.cdsECRepo.FieldByName('TDIARID').AsString +''' and '
     +   'ECANOMM=''' +DMTE.cdsECRepo.FieldByName('ECANOMM').AsString +''' and '
     +   'ECNOCOMP='''+DMTE.cdsECRepo.FieldByName('ECNOCOMP').AsString+'''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;

   DMTE.cdsCntCaja.First;
   while not DMTE.cdsQry.Eof do begin
      DMTE.cdsCntCaja.Insert;
      DMTE.cdsCntCaja.FieldByName('CIAID').Value   := DMTE.cdsEgrcaja.FieldByName('CIAID').Value;
      DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
      DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:= DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('DOCID').Value   := DMTE.cdsECRepo.FieldByName('DOCID').Value;
      DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsECRepo.FieldByName('ECNODOC').Value;
      DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.cdsQry.FieldByName('CPTOID').Value;
      DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsQry.FieldByName('CUENTAID').Value;
      DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString;
      DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').AsString;
      DMTE.cdsCntCaja.FieldByName('DCDH').Value    :=  'H';
      DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:= DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
      DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:= DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
      DMTE.cdsCntCaja.FieldByName('TMONID').Value  := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value:= DMTE.cdsEgrCaja.FieldByName('ECMTOORI').Value;
      if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString=DMTE.wTMonLoc then begin
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value :=DMTE.cdsQry.FieldByName('ECMTOLOC').Value;
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:=DMTE.cdsQry.FieldByName('ECMTOLOC').Value/DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
         end
      else begin
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:=DMTE.cdsQry.FieldByName('ECMTOEXT').Value;
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value :=DMTE.cdsQry.FieldByName('ECMTOEXT').Value*DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
      end;
      DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:= 'S';   //Registro ya cuadrado
      DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
      DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
      DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
      DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
      DMTE.cdsCntCaja.FieldByName('DCANO').Value   := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
      DMTE.cdsCntCaja.FieldByName('DCMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
      DMTE.cdsCntCaja.FieldByName('DCDD').Value    := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
      DMTE.cdsCntCaja.FieldByName('DCSS').Value    := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
      DMTE.cdsCntCaja.FieldByName('DCSEM').Value   := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
      DMTE.cdsCntCaja.FieldByName('DCTRI').Value   := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
      DMTE.cdsCntCaja.FieldByName('DCAASS').Value  := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
      DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
      DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
      DMTE.cdsCntCaja.fieldbyname('DOCMOD').AsString := FRegistro.xModulo;
      DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString ;
      DMTE.cdsCntCaja.FieldByName('FCAB').AsString   := '1' ;
      xNReg:=xNReg+1;
      DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
      DMTE.cdsQry.Next;
   end;
end;
{******************************************************************************}
procedure TFPagoProvRep.Contab_RegCxP;
begin
   DMTE.cdsCntCaja.FieldByname('CIAID').Value   :=  DMTE.cdsRegCxP.FieldByName('CIAID').Value;
   DMTE.cdsCntCaja.FieldByname('TDIARID').Value :=  DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
   DMTE.cdsCntCaja.FieldByname('ECNOCOMP').Value:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
   DMTE.cdsCntCaja.FieldByname('DOCMOD').Value  :=  'CXP';
   DMTE.cdsCntCaja.FieldByname('DOCID').Value   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
   DMTE.cdsCntCaja.FieldByname('DCSERIE').Value :=  DMTE.cdsRegCxP.FieldByName('CPSERIE').Value;
   DMTE.cdsCntCaja.FieldByname('DCNODOC').Value :=  DMTE.cdsRegCxP.FieldByName('CPNODOC').Value;
   DMTE.cdsCntCaja.FieldByname('ECFCOMP').Value :=  DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value;
   DMTE.cdsCntCaja.FieldByname('DCFEMIS').Value :=  DMTE.cdsRegCxP.FieldByName('CPFEMIS').Value;
   DMTE.cdsCntCaja.FieldByname('DCFVCMTO').Value:=  DMTE.cdsRegCxP.FieldByName('CPFVCMTO').Value;
   DMTE.cdsCntCaja.FieldByname('CPTOID').Value  :=  DMTE.cdsRegCxP.FieldByName('CPTOID').Value;
   DMTE.cdsCntCaja.FieldByname('CUENTAID').Value:=  DMTE.cdsRegCxP.FieldByName('CUENTAID').Value;
   DMTE.cdsCntCaja.FieldByname('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString;
   DMTE.cdsCntCaja.FieldByname('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').AsString;
   DMTE.cdsCntCaja.FieldByname('CCOSID').Value  :=  DMTE.cdsRegCxP.FieldByName('CCOSID').Value;
   DMTE.cdsCntCaja.FieldByname('DCDH').Value    :=  DMTE.cdsRegCxP.FieldByName('DEDH').Value;
   DMTE.cdsCntCaja.FieldByname('DCTCAMPA').Value:=  DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
   DMTE.cdsCntCaja.FieldByname('DCTCAMPR').Value:=  DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
   DMTE.cdsCntCaja.FieldByname('TMONID').Value  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
   DMTE.cdsCntCaja.FieldByname('DCMTOORI').Value:=  DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
   DMTE.cdsCntCaja.FieldByname('DCGLOSA').Value:=  DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString;

   if DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wtMonLoc then
   begin
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value;
//      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value / DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   end
   else
   begin
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value;
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value * DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
   end;
   DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:= 'S';   //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCUSER').Value  := DMTE.wUsuario;
   DMTE.cdsCntCaja.FieldByName('DCFREG').Value  := DateS;
   DMTE.cdsCntCaja.FieldByName('DCHREG').Value  := Time;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCANO').Value   := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
   DMTE.cdsCntCaja.FieldByName('DCMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCDD').Value    := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
   DMTE.cdsCntCaja.FieldByName('DCSS').Value    := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
   DMTE.cdsCntCaja.FieldByName('DCSEM').Value   := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
   DMTE.cdsCntCaja.FieldByName('DCTRI').Value   := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
   DMTE.cdsCntCaja.FieldByName('DCAASS').Value  := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
   xNReg:=xNReg+1;
   DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
end;
{******************************************************************************}
procedure TFPagoProvRep.Contab_DocPago;
var
   xWhere      : String ;
begin
   xWhere:='CIAID   ='''+DMTE.cdsDocPago.fieldbyname('CIAID').AsString   +''' and '
          +'CPANOMES='''+DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString +''' and '
          +'TDIARID ='''+DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString+''' and '
          +'CPNOREG ='''+DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString +''''  ;

   if DMTE.RecuperarDatos( 'CXP301' , 'TMONID' , xWhere ) then
   begin
      xMONID_PROV:=DMTE.cdsRec.fieldbyname('TMONID').AsString;
   end
   else
      Showmessage('Error en la recuperación del documento - WMC');

   DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
   DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsDocPago.FieldByName('DOCID2').Value;
   DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
   DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsDocPago.FieldByName('CPFEMIS').Value;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value;
   DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  DMTE.cdsDocPago.FieldByName('CPTOID').Value;
   DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  DMTE.cdsDocPago.FieldByName('CUENTAID').Value;
//   DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
//   DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera

   DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsDocPago.FieldByName('CLAUXID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsDocPago.FieldByName('PROV').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDH').Value    :=  'D';
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsDocPago.FieldByName('DETCPAG').Value  ;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsDocPago.FieldByName('DETCDOC').Value  ;
   DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').Value   ;
   DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value:=  DMTE.cdsDocPago.FieldByName('DEMTOORI').Value ;
   DMTE.cdsCntCaja.FieldByName('DCGLOSA').Value :=  DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
   if xMONID_PROV = DMTE.wTMonLoc then
    begin
      xMTOCNTLOC := Redondea( DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat ) ;
//      xMTOCNTEXT := Redondea( DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat ) ;
      xMTOCNTEXT := Redondea( DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat ) ;

      DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value        := xMTOCNTLOC ;
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat  := xMTOCNTEXT ;
    end
   else
    begin
      xMTOCNTEXT := Redondea( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat ) ;
//      xMTOCNTLOC := Redondea( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat ) ;
      xMTOCNTLOC := Redondea( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat ) ;

      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat  := xMTOCNTLOC ;
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value        := xMTOCNTEXT ;
    end ;
   DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
   DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
   DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCANO').Value   := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
   DMTE.cdsCntCaja.FieldByName('DCMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCDD').Value    := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
   DMTE.cdsCntCaja.FieldByName('DCSS').Value    := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
   DMTE.cdsCntCaja.FieldByName('DCSEM').Value   := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
   DMTE.cdsCntCaja.FieldByName('DCTRI').Value   := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
   DMTE.cdsCntCaja.FieldByName('DCAASS').Value  := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
   xNReg:=xNReg+1;
   DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
end;
{******************************************************************************}
procedure TFPagoProvRep.Contab_DifCamDocPago;
var
 xSql,xSql1 : String;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   //08/05/2001 - pjsv
   // se valida por sugerencia de Jorge y Jose, me confirmaron que por el tipo
  // de moneda de la cabecera, para que no genere <> de cambio cuando es local
   xsql := 'TMONID='+quotedstr(dblcTMon.Text);
   xsql1 := 'TMONID='+quotedstr(DMTE.cdsDocPago.FieldByName('TMONID').Value);
   If (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') or
      (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then
    begin
     if DMTE.cdsDocPago.FieldByName('DETCDOC').Value <> DMTE.cdsDocPago.FieldByName('DETCPAG').Value then
     begin
        DMTE.cdsCntCaja.Insert;
        DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
        DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
        DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsDocPago.FieldByName('DOCID2').Value;
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
        DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
        DMTE.cdsCntCaja.FieldByName('DCANO').Value   := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
        DMTE.cdsCntCaja.FieldByName('DCMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
        DMTE.cdsCntCaja.FieldByName('DCDD').Value    := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
        DMTE.cdsCntCaja.FieldByName('DCSS').Value    := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
        DMTE.cdsCntCaja.FieldByName('DCSEM').Value   := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCTRI').Value   := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASS').Value  := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
        DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
        DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
        DMTE.cdsCntCaja.FieldByName('TMONID').Value  := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
        xNReg:=xNReg+1;
        DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

        if xMONID_PROV = DMTE.wTMonLoc then
        begin
           DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := abs(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat-xMTOCNTEXT) ;

           if DMTE.cdsDocPago.FieldByName('DETCDOC').Value > DMTE.cdsDocPago.FieldByName('DETCPAG').Value then
              DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D'
           else
              DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
        end
        else
        begin
           DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := abs(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat-xMTOCNTLOC) ;

           if DMTE.cdsRegCxP.FieldByName('DETCDOC').Value > DMTE.cdsDocPago.FieldByName('DETCPAG').Value then
              DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H'
           else
              DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
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
     end;
    end;
end;

procedure TFPagoProvRep.Contab_DifCamDocPago2;
var
 xSql,xSql1 : String;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   xsql := 'TMONID='+quotedstr(dblcTMon.Text);
   xsql1 := 'TMONID='+quotedstr(DMTE.cdsDocPago.FieldByName('TMONID').Value);
   If (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') or
      (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then
    begin
     if DMTE.cdsDocPago.FieldByName('DETCDOC').Value <> DMTE.cdsDocPago.FieldByName('DETCPAG').Value then
     begin
        DMTE.cdsCntCaja.Insert;
        DMTE.cdsCntCaja.FieldByName('CIAID').Value   := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
        DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
        DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:= DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DOCID').Value   := DMTE.cdsDocPago.FieldByName('DOCID2').Value;
        DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
        DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
        DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:= DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('CPTOID').Value  := DMTE.cdsDocPago.FieldByName('CPTOID').Value;
        DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:= DMTE.cdsDocPago.FieldByName('CUENTAID').Value;
        DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:= DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:= DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
        DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
        DMTE.cdsCntCaja.FieldByName('DCANO').Value   := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
        DMTE.cdsCntCaja.FieldByName('DCMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
        DMTE.cdsCntCaja.FieldByName('DCDD').Value    := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
        DMTE.cdsCntCaja.FieldByName('DCSS').Value    := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
        DMTE.cdsCntCaja.FieldByName('DCSEM').Value   := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCTRI').Value   := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASS').Value  := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
        DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
        DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
        DMTE.cdsCntCaja.FieldByName('TMONID').Value  := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;

        if xMONID_PROV = DMTE.wTMonExt then
        begin
           DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value :=DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat*DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
           DMTE.cdsCntCaja.FieldByName('DCDH').Value    :='H';
           DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=wCptoGan;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=wCtaGan;
        end;

        /////////

        DMTE.cdsCntCaja.Insert;
        DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
        DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
        DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsDocPago.FieldByName('DOCID2').Value;
        DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
        DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
        DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  DMTE.cdsDocPago.FieldByName('CPTOID').Value;
        DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  DMTE.cdsDocPago.FieldByName('CUENTAID').Value;
        DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
        DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
        DMTE.cdsCntCaja.FieldByName('DCANO').Value   := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
        DMTE.cdsCntCaja.FieldByName('DCMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
        DMTE.cdsCntCaja.FieldByName('DCDD').Value    := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
        DMTE.cdsCntCaja.FieldByName('DCSS').Value    := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
        DMTE.cdsCntCaja.FieldByName('DCSEM').Value   := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCTRI').Value   := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASS').Value  := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
        DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
        DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
        DMTE.cdsCntCaja.FieldByName('TMONID').Value  := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
        xNReg:=xNReg+1;
        DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

        if xMONID_PROV = DMTE.wTMonExt then
        begin
           DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value :=DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat*DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
           DMTE.cdsCntCaja.FieldByName('DCDH').Value    :='D';
           DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=wCptoPer;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=wCtaPer;
        end;
     end;
    end;
end;

{******************************************************************************}
procedure TFPagoProvRep.Contab_DifCamRegCxP;
var
    xDif_Camb : real;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO

   if DMTE.cdsRegCxP.FieldByName('DETCDOC').Value <> DMTE.cdsRegCxP.FieldByName('DETCPAG').Value then
    begin
      DMTE.cdsCntCaja.Insert;
      DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsRegCxP.FieldByName('CIAID').Value;
      DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
      DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  :=  'CXP';
      DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
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
      DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
      DMTE.cdsCntCaja.FieldByName('DCANO').Value   := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
      DMTE.cdsCntCaja.FieldByName('DCMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
      DMTE.cdsCntCaja.FieldByName('DCDD').Value    := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
      DMTE.cdsCntCaja.FieldByName('DCSS').Value    := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
      DMTE.cdsCntCaja.FieldByName('DCSEM').Value   := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
      DMTE.cdsCntCaja.FieldByName('DCTRI').Value   := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
      DMTE.cdsCntCaja.FieldByName('DCAASS').Value  := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
      DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
      DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
      DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
      xNReg:=xNReg+1;
      DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

      DMTE.cdsCntCaja.FieldByName('TMONID').Value   :=  DMTE.cdsEgrCaja.FieldByName('TMONID').vALUE;
      if DMTE.cdsRegCxP.FieldByName('TMONID').Value=DMTE.wtMonLoc then
       begin   //Provision en Mon.Local
         xDif_Camb:=abs(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value / DMTE.cdsRegCxP.FieldByName('DETCDOC').Value -
                        DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value / DMTE.cdsRegCxP.FieldByName('DETCPAG').Value);//En Mon.Ext.
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := xDif_Camb;

         if DMTE.cdsRegCxP.FieldByName('DETCDOC').Value > DMTE.cdsRegCxP.FieldByName('DETCPAG').Value then
            DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D'
         else
            DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';

       end
      else
       begin                                            //Provision en Mon.Ext.
         xDif_Camb:=abs(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value*DMTE.cdsRegCxP.FieldByName('DETCDOC').Value -
                        DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value*DMTE.cdsRegCxP.FieldByName('DETCPAG').Value);//En Mon.Local
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

procedure TFPagoProvRep.Contab_DifCamRegCxP2;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   if DMTE.cdsRegCxP.FieldByName('DETCDOC').Value <> DMTE.cdsRegCxP.FieldByName('DETCPAG').Value then
    begin
      DMTE.cdsCntCaja.Insert;
      DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsRegCxP.FieldByName('CIAID').Value;
      DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
      DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  :=  'CXP';
      DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
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
      DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
      DMTE.cdsCntCaja.FieldByName('DCANO').Value   := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
      DMTE.cdsCntCaja.FieldByName('DCMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
      DMTE.cdsCntCaja.FieldByName('DCDD').Value    := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
      DMTE.cdsCntCaja.FieldByName('DCSS').Value    := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
      DMTE.cdsCntCaja.FieldByName('DCSEM').Value   := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
      DMTE.cdsCntCaja.FieldByName('DCTRI').Value   := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
      DMTE.cdsCntCaja.FieldByName('DCAASS').Value  := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
      DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
      DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
      DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
      DMTE.cdsCntCaja.FieldByName('TMONID').Value   :=  DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
      xNReg:=xNReg+1;
      DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

      if DMTE.cdsRegCxP.FieldByName('TMONID').Value=DMTE.wtMonExt then
       begin
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value :=DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value*DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
         DMTE.cdsCntCaja.FieldByName('DCDH').Value    :='H';
         DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=wCptoGan;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=wCtaGan;
       end;

      /////////////

      DMTE.cdsCntCaja.Insert;
      DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsRegCxP.FieldByName('CIAID').Value;
      DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
      DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  :=  'CXP';
      DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
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
      DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
      DMTE.cdsCntCaja.FieldByName('DCANO').Value   := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
      DMTE.cdsCntCaja.FieldByName('DCMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
      DMTE.cdsCntCaja.FieldByName('DCDD').Value    := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
      DMTE.cdsCntCaja.FieldByName('DCSS').Value    := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
      DMTE.cdsCntCaja.FieldByName('DCSEM').Value   := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
      DMTE.cdsCntCaja.FieldByName('DCTRI').Value   := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
      DMTE.cdsCntCaja.FieldByName('DCAASS').Value  := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
      DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
      DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
      DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
      DMTE.cdsCntCaja.FieldByName('TMONID').Value   :=  DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
      xNReg:=xNReg+1;
      DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

      if DMTE.cdsRegCxP.FieldByName('TMONID').Value=DMTE.wtMonExt then begin
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value :=DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value*DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
         DMTE.cdsCntCaja.FieldByName('DCDH').Value    :='D';
         DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=wCptoPer;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=wCtaPer;
      end;
   end;
end;


{******************************************************************************}
procedure TFPagoProvRep.Contabiliza;
var
   xRegAct : TBookMark;
   xSQl    : String;
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

    // vhn 23/01/2001
    xSQL:='Select * from CAJA304 Where CIAID='''' and '
         +  'ECANOMM='''' and TDIARID='''' and ECNOCOMP='''' ';
    DMTE.cdsCNTCaja.Close;
    DMTE.cdsCNTCaja.DataRequest( xSQL );
    DMTE.cdsCNTCaja.Open;
    
    xNReg:=0;
    //
   // GENERA LOS REGISTROS DE "DEBE" Y LOS REGISTROS POR DIF. DE CAMBIO desde Docs Pago
    DMTE.cdsDocPago.DisableControls;
    xRegAct := DMTE.cdsDocPago.GetBookmark;
    DMTE.cdsDocPago.First ;
    While not DMTE.cdsDocPago.Eof do
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
    while not DMTE.cdsRegCxP.Eof do begin
       DMTE.cdsCntCaja.Insert;
       Contab_RegCxP;
       if DMTE.wTipoDif='' then
          Contab_DifCamRegCxP
       else begin
          if DMTE.cdsRegCxP.FieldByname('TMONID').AsString=DMTE.wTMonExt then
             Contab_DifCamRegCxP;
       end;
       DMTE.cdsRegCxP.Next;
    end;
    DMTE.cdsRegCxP.GotoBookmark(xRegAct);
    DMTE.cdsRegCxP.FreeBookmark(xRegAct);
    DMTE.cdsRegCxP.EnableControls;

   // GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde Devolucion a Caja
    DMTE.cdsRegCxC.DisableControls;
    xRegAct := DMTE.cdsRegCxC.GetBookmark;
    DMTE.cdsRegCxC.First ;
    while not DMTE.cdsRegCxC.Eof do begin
       DMTE.cdsCntCaja.Insert;
       Contab_RegCxC;
       DMTE.cdsRegCxC.Next;
    end;
    DMTE.cdsRegCxC.GotoBookmark(xRegAct);
    DMTE.cdsRegCxC.FreeBookmark(xRegAct);
    DMTE.cdsRegCxC.EnableControls;


    // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera
    //
    DMTE.cdsECRepo.DisableControls;
    xRegAct := DMTE.cdsECRepo.GetBookmark;
    DMTE.cdsECRepo.First ;
    While not DMTE.cdsECRepo.Eof do
    Begin
       if DMTE.cdsECRepo.FieldByName('FLAGVAR').AsString='S' then
          Contab_Haber;
       DMTE.cdsECRepo.Next;
    end;
    DMTE.cdsECRepo.GotoBookmark(xRegAct);
    DMTE.cdsECRepo.FreeBookmark(xRegAct);
    DMTE.cdsECRepo.EnableControls;


    //Actualizamos en la tabla de Contabilidad
    DMTE.cdsCntCaja.ApplyUpdates(0);

   // Cuadra Asiento por Redondeos

   xDebeT :=0;  xHabeT :=0;
   xDebeTD:=0;  xHabeTD:=0;
   DMTE.cdsCntCaja.First;
   while not DMTE.cdsCntCaja.Eof do begin
      if DMTE.cdsCntCaja.FieldByname('DCDH').AsString='D' then
         if DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat <> null then begin
						xDebeT :=xDebeT +DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat,15,2);
						xDebeTD:=xDebeTD+DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOEXT').AsFloat,15,2);
				 end
				 else begin
						xDebeT:=xDebeT
				 end
			else begin
				 if DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat <> null then begin
						xHabeT :=xHabeT +DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat,15,2);
						xHabeTD:=xHabeTD+DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOEXT').AsFloat,15,2);
				 end
				 else begin
						xHabeT:=xHabeT;
				 end;
			end;
			DMTE.cdsCntCaja.Next;
	end;

	if ( DMTE.FRound(xDebeT,15,2) <>DMTE.FRound(xHabeT,15,2 ) ) {or
			( DMTE.FRound(xDebeTD,15,2)<>DMTE.FRound(xHabeTD,15,2) ) } then
	begin
			AsientoDifTotal;
   end;

   DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');

end;
{******************************************************************************}
procedure TFPagoProvRep.z2bbtnContClick(Sender: TObject);
var
   xSQL : string;
begin
   if DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString='C' then
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
         screen.Cursor:=crHourGlass;
         RecCptosDifC ;
         Contabiliza;

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
            DMTE.cdsEgrCaja.FieldByName('ECConta').AsString := 'S' ;   //Establece como Contabilizado el flag
            DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString:= 'C';
            DMTE.cdsEgrCaja.FieldByName('ECUSER').Value     := DMTE.wUsuario;
            DMTE.cdsEgrCaja.FieldByName('ECFREG').Value     := DateS;
            DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;
//            if Copy(xRegAdicional,1,2)='1.' then
//               DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString:=xRegAdicional;

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
procedure TFPagoProvRep.z2bbtnAnulaClick(Sender: TObject);
var
  xSQL : string;
begin
    if DMTE.cdsEgrCaja.FieldByName('ECEstado').Value='I' then
    begin

      if MessageDlg('¿Anular Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
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

         RetornaSaldosMovCxP;

         DMTE.cdsEgrCaja.CancelUpdates;
         DMTE.cdsRegCxP.CancelUpdates;
         DMTE.cdsMovCxP.CancelUpdates;
         DMTE.cdsDocPago.CancelUpdates;

         DMTE.cdsEgrCaja.Edit;
         DMTE.cdsEgrCaja.FieldByName('ECEstado').Value:='A';
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

         DMTE.cdsECRepo.ApplyUpdates(0);

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
    end
    else
    begin
       ShowMessage('Imposible Anular Comprobante');
    end;
end;
{******************************************************************************}
procedure TFPagoProvRep.ActPnlBotones;
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
procedure TFPagoProvRep.FormClose(Sender: TObject; var Action: TCloseAction);
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
      cdsMovCxP.Filtered   :=False;
      cdsCntCaja.Filtered  :=False;
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

       cf1.QuitarExits(self) ;
   end ;

   FVariables.w_Num_Formas:=FVariables.w_Num_Formas-1;
   Action:=caFree;
end;
{******************************************************************************}
procedure TFPagoProvRep.IniciaPanel;
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
procedure TFPagoProvRep.dbgOtrosIButtonClick(Sender: TObject);
begin
   inhabilitarpaneles;
   AdicionarREgistros;
end;
{******************************************************************************}
procedure TFPagoProvRep.dbgOtrosKeyDown(Sender: TObject; var Key: Word;
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
procedure TFPagoProvRep.dbdtpFComp2Exit(Sender: TObject);
begin
   DMTE.cdsRegCxP.FieldByName('CPANOMM').Value:=copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value),7,4)
                              +copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value),4,2);
end;
{******************************************************************************}
procedure TFPagoProvRep.z2bbtnSumatClick(Sender: TObject);
Var
   xRegAct : TBookMark;
   xMtoLoc, xMtoExt: Currency;
begin
   with DMTE Do
   begin
      cdsRegCxP.DisableControls;
      xRegAct := cdsRegCxP.GetBookmark;
      xMtoLoc := 0;
      xMtoExt := 0;
      cdsRegCxP.First ;
      while not cdsRegCxP.Eof do
      Begin
         if cdsRegCxP.FieldByName('DEDH').Value='D' then
         begin
           xMtoLoc := xMtoLoc + strtocurr( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) ) ;
           xMtoExt := xMtoExt + strToCurr( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) ) ;
         end
         else begin
           xMtoLoc := xMtoLoc - strToCurr( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) ) ;
           xMtoExt := xMtoExt - strToCurr( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) ) ;
         end;
         cdsRegCxP.Next;
      end;
      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);
      cdsRegCxP.EnableControls;

      dbgOtros.ColumnByName('DEMTOLOC').FooterValue:=floattostrf(xMtoLoc, ffFixed, 10, 2);
      dbgOtros.ColumnByName('DEMTOEXT').FooterValue:=floattostrf(xMtoExt, ffFixed, 10, 2);

      xTotOtrS := xMtoLoc;
      xTotOtrD := xMtoExt;

   end;
end;
{******************************************************************************}
procedure TFPagoProvRep.dbgDocPagoDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   If (not dbgDocPago.Readonly) then
      Accept:=True;
end;
{******************************************************************************}
procedure TFPagoProvRep.dbgDocPagoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   If (not dbgDocPago.Readonly) then
      dbgDocPago.BeginDrag(False);
end;
{******************************************************************************}
procedure TFPagoProvRep.dbgDocPagoEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   if (not dbgDocPago.Readonly) and (Target=dbgpendientes) Then
   begin
      DMTE.cdsMovCxP.Filtered:=False;
      if DMTE.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                       VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID').AsString,
                                   DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
                                   DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
                                   DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),[] ) then
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
      end;

//      CalcularSaldo;

      DMTE.cdsMovCxP.Filtered:=True;
      wmodifica:=True;
   end;
end;
{******************************************************************************}
Procedure TFPagoProvRep.LimpiaFiltros;
begin
   // Limpiando filtros si lo tuvieran
   DMTE.cdsMovCxP.Filtered  :=False;
   DMTE.cdsCntCaja.Filtered :=False;
   DMTE.cdsRegCxP.Filtered  :=False;
end;
{******************************************************************************}
{*********************** PROCEDIMIENTOS ADICIONALES   *************************}
procedure TFPagoProvRep.ActivaFiltro(xName:string);
var
   xSQL : String ;
begin
    xName := uppercase(xName);

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
            +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
       DMTE.cdsDocPago.Close;
       DMTE.cdsDocPago.DataRequest( xSQL );
       DMTE.cdsDocPago.Open;
       TNumericField(DMTE.cdsDocPago.FieldbyName('DESALLOC')).displayFormat:= '###,###,##0.00';
       TNumericField(DMTE.cdsDocPago.FieldbyName('DESALEXT')).displayFormat:= '###,###,##0.00';
       TNumericField(DMTE.cdsDocPago.FieldbyName('DEMTOLOC')).displayFormat:= '###,###,##0.00';
       TNumericField(DMTE.cdsDocPago.FieldbyName('DEMTOEXT')).displayFormat:= '###,###,##0.00';
    end;
end;
{******************************************************************************}
Procedure TFPagoProvRep.CambiaEstado(xName:char);
begin
   case xName of
     'I':begin  //Si está INCOMPLETO o PENDIENTE
            lblEstado.Caption    :='Activo             ';
            pnlCabecera1.Enabled := False;
            pnlCabecera2.Enabled := True;
            z2bbtnOk.Enabled       := True;
            z2bbtnCancel.Enabled   := True;

//2804
            dbgPendientes.ReadOnly :=False ;
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
            wbAnula     := False;
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
            pnlCabecera1.Enabled := False;
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
procedure TFPagoProvRep.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   if (dbgPendientes.Readonly = False) then
       Accept:=True;
end;
{******************************************************************************}
procedure TFPagoProvRep.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if (dbgPendientes.Readonly = False) then
      dbgPendientes.BeginDrag(False);
end;
{******************************************************************************}
procedure TFPagoProvRep.dbgPendientesEndDrag(Sender, Target: TObject; X,Y: Integer);
var
   i       : integer;
   xNoRepo : String;
begin
    If (not dbgPendientes.Readonly) and (Target=dbgDocPago) Then
    Begin
       DMTE.cdsMovCxP.DisableControls;
      // Añade los Nuevos Registros
      DMTE.cdsDocPago.DisableControls;
      for i:= 0 to dbgPendientes.SelectedList.Count-1 do
      begin
          dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);

          xNoRepo:=NumeroReposicion;

          if Length(xNoRepo)=0 then Exit;

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
          DMTE.cdsDocPago.FieldByName('PROVRUC').Value  := DMTE.cdsMovCxP.FieldByName('PROVRUC').Value;
          DMTE.cdsDocPago.FieldByName('ECNOREPO').Value:=xNoRepo;

          if dblcTMon.Text=DMTE.wtMonLoc then
           begin
            if DMTE.cdsDocPago.FieldByName('TMONID').Value=DMTE.wtMonLoc then
              begin
                DMTE.cdsDocPago.FieldByName('DESALLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value,15,2);
                DMTE.cdsDocPago.FieldByName('DESALEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value
                                              / DMTE.cdsDocPago.FieldByName('DETCPAG').Value,15,2);
              end
             else
              begin
                DMTE.cdsDocPago.FieldByName('DESALEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value,15,2);
                DMTE.cdsDocPago.FieldByName('DESALLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value
                                              * DMTE.cdsDocPago.FieldByName('DETCPAG').Value,15,2);
              end;
           end
          else
           begin
            if DMTE.cdsDocPago.FieldByName('TMONID').Value=DMTE.wtMonExt then
             begin
                DMTE.cdsDocPago.FieldByName('DESALEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value,15,2);
                DMTE.cdsDocPago.FieldByName('DESALLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value
                                              * DMTE.cdsDocPago.FieldByName('DETCPAG').Value,15,2);
             end
            else
             begin
                DMTE.cdsDocPago.FieldByName('DESALLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value,15,2);
                DMTE.cdsDocPago.FieldByName('DESALEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value
                                              / DMTE.cdsDocPago.FieldByName('DETCPAG').Value,15,2);
             end;
           end;
//**
          DMTE.cdsDocPago.FieldByName('DEANTMN').Value  := 0;
          DMTE.cdsDocPago.FieldByName('DEANTME').Value  := 0;
          DMTE.cdsDocPago.FieldByName('DEMTOORI').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').Value,15,2);
          DMTE.cdsDocPago.FieldByName('DEMTOLOC').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALLOC').Value,15,2);
          DMTE.cdsDocPago.FieldByName('DEMTOEXT').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALEXT').Value,15,2);
          DMTE.cdsDocPago.FieldByName('DEUSER').Value   := DMTE.wUsuario;
          DMTE.cdsDocPago.FieldByName('DEFREG').Value   := dateS;
          DMTE.cdsDocPago.FieldByName('DEHREG').Value   := time;
          DMTE.cdsDocPago.fieldbyname('CLAUXID').AsString := DMTE.cdsMovCxP.fieldbyname('CLAUXID').AsString ;
          cdsPost(DMTE.cdsDocPago);
          DMTE.cdsDocPago.Post;

          DMTE.cdsMovCxP.Edit;
          DMTE.cdsMovCxP.FieldByName('CPSALORI').Value := 0 ;
          DMTE.cdsMovCxP.Post;

          dbgPendientes.datasource.dataset.Freebookmark(dbgPendientes.SelectedList.items[i]);
      end;

      dbgPendientes.SelectedList.clear;  { Clear selected record list since they are all deleted}
      dbgPendientes.RefreshDisplay;
      dbgDocPago.RefreshDisplay;
      DMTE.cdsDocPago.EnableControls;
      DMTE.cdsMovCxP.EnableControls;
      z2bbtnSumatclick(nil);
      z2bbtnSumatSelecClick(Nil);
      z2bbtnSumatDocPagoclick(nil);
//      CalcularSaldo;
      SaldoPorRendir;
      wmodifica:=True;

   end; // target
end;

procedure TFPagoProvRep.dbgDocPagoColExit(Sender: TObject);
begin
   if dbgDocPago.SelectedField.FieldName = ('DETCPAG') then
    z2bbtnSumatDocPagoclick(nil);
   dbgDocPago.RefreshDisplay;
end;

{******************************************************************************}

procedure TFPagoProvRep.ActSaldosMovCxP;
var   xRegAct : TBookMark;
      xAdicional : Currency    ;
      ssql : string;
      xori,xext,xloc    : string;
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
            DMTE.cdsMovCxP.edit ;
            if DMTE.cdsMovCxP.FieldByName('TMONID').Value = wTMonLoc then
            begin
               if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
                   DMTE.cdsMovCxP.FieldByName('CPHREG').value     := DateS
               else
                  if (DMTE.SRV_D = 'ORACLE')  then
                      DMTE.cdsMovCxP.FieldByName('CPHREG').value     := DateS+Time;
                      
               DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat -
                                              DMTE.numerononulo(DMTE.cdsMovCxP.FieldByName('CPPAGLOC'))-
                                              DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat ;

               DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat ;
               //Calculo del otro Saldo
               xAdicional := Redondea( DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat ) ;
               DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat -
                                              DMTE.numerononulo(DMTE.cdsMovCxP.FieldByName('CPPAGEXT'))-
                                              xAdicional ;
            end
            else
            begin
               if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
                   DMTE.cdsMovCxP.FieldByName('CPHREG').value     := DateS
               else
                  if (DMTE.SRV_D = 'ORACLE')  then
                      DMTE.cdsMovCxP.FieldByName('CPHREG').value     := DateS+Time;

               DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat -
                                              DMTE.numerononulo(DMTE.cdsMovCxP.FieldByName('CPPAGEXT'))-
                                              DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat ;

               DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat      ;
               //Calculo del otro Saldo
               xAdicional := Redondea( DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat ) ;
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

            ssql := 'SELECT * FROM CXP301 WHERE CIAID='+quotedstr(xcia)+
                      ' AND TDIARID='+quotedstr(xtdia)+
                      ' AND CPANOMES='+quotedstr(xperio)+
                      ' AND CPNOREG='+quotedstr(xnreg);
            DMTE.cdsMovCxP.DataRequest(sSQL);
            DMTE.AplicaDatos(DMTE.cdsMovCxP,'EGRCAJA');

            ///
{              ssql := 'UPDATE CXP301 SET '+
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
              end;}

{            if DMTE.cdsMovCxP.FieldByName('CPPAGLOC').IsNull then
            begin
              DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := 0 ;
            end ;
            if DMTE.cdsMovCxP.FieldByName('CPPAGEXT').IsNull then
            begin
              DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := 0 ;
            end ;

            DMTE.cdsMovCxP.post;}
         end
         else
         begin
            Showmessage('No se Actualizó CXP ');
         end ;
         cdsDocPago.Next;
      end;
      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);
      cdsDocPago.EnableControls;
      cdsMovCxP.Filtered:=True;
      cdsMovCxP.EnableControls;
   end;
end;
{******************************************************************************}
procedure TFPagoProvRep.ActMovCxP;
var   xRegAct : TBookMark;
      ssql,xcia, xtdia, xperio,xnreg  : string;

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
            DMTE.cdsMovCxP.edit;

            DMTE.cdsMovCxP.fieldbyname('CPPAGLOC').AsFloat :=
                          DMTE.cdsMovCxP.fieldbyname('CPPAGLOC').AsFloat +
                          DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat  ;
            DMTE.cdsMovCxP.fieldbyname('CPSALLOC').AsFloat :=
                          DMTE.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat -
                          DMTE.cdsMovCxP.fieldbyname('CPPAGLOC').AsFloat  ;

            DMTE.cdsMovCxP.fieldbyname('CPPAGEXT').AsFloat :=
                          DMTE.cdsMovCxP.fieldbyname('CPPAGEXT').AsFloat +
                          DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat  ;
            DMTE.cdsMovCxP.fieldbyname('CPSALEXT').AsFloat :=
                          DMTE.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat -
                          DMTE.cdsMovCxP.fieldbyname('CPPAGEXT').AsFloat  ;

            if DMTE.cdsMovCxP.FieldByName('TMONID').Value=DMTE.wTMonLoc then
            begin
               DMTE.cdsMovCxP.fieldbyname('CPPAGORI').AsFloat := DMTE.cdsMovCxP.fieldbyname('CPPAGLOC').AsFloat ;
               if DMTE.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat = DMTE.cdsMovCxP.fieldbyname('CPPAGLOC').AsFloat then
               begin
                  DMTE.cdsMovCxP.fieldbyname('CPSALLOC').AsFloat := 0;
                  DMTE.cdsMovCxP.fieldbyname('CPPAGEXT').AsFloat := DMTE.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat;
                  DMTE.cdsMovCxP.fieldbyname('CPSALEXT').AsFloat := 0;
                  DMTE.cdsMovCxP.FieldByName('CPESTADO').AsString := 'C';
               end;
            end
            else
            begin
               DMTE.cdsMovCxP.fieldbyname('CPPAGORI').AsFloat := DMTE.cdsMovCxP.fieldbyname('CPPAGEXT').AsFloat ;
               if DMTE.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat = DMTE.cdsMovCxP.fieldbyname('CPPAGEXT').AsFloat then
               begin
                  DMTE.cdsMovCxP.fieldbyname('CPSALEXT').AsFloat := 0;
                  DMTE.cdsMovCxP.fieldbyname('CPPAGLOC').AsFloat := DMTE.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat;
                  DMTE.cdsMovCxP.fieldbyname('CPSALLOC').AsFloat := 0;
                  DMTE.cdsMovCxP.FieldByName('CPESTADO').AsString := 'C';
               end;
            end;

            DMTE.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat := DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat ;

            DMTE.cdsMovCxP.post ;

//            DMTE.cdsMovCxP.ApplyUpdates(0);
            xcia   := trim(dblccia.text) ;
            xtdia  := DMTE.cdsMovCxp.fieldbyname('TDIARID').AsString ;
            xperio := DMTE.cdsMovCxp.fieldbyname('CPANOMES').AsString ;
            xnreg  := DMTE.cdsMovCxp.fieldbyname('CPNOREG').AsString ;

            ssql := 'SELECT * FROM CXP301 WHERE CIAID='+quotedstr(xcia)+
                      ' AND TDIARID='+quotedstr(xtdia)+
                      ' AND CPANOMES='+quotedstr(xperio)+
                      ' AND CPNOREG='+quotedstr(xnreg);

            DMTE.cdsMovCxP.DataRequest(sSQL);
            DMTE.AplicaDatos(DMTE.cdsMovCxP,'EGRCAJA');

{ esta parte es por si no graba a través del cds con applyupdates
            xcia   := DMTE.cdsDocPago.FieldByName('CIAID').AsString;
            xtdia  := DMTE.cdsDocPago.FieldByName('TDIARID2').AsString;
            xperio := DMTE.cdsDocPago.FieldByName('CPANOMM').AsString;
            xnreg  := DMTE.cdsDocPago.FieldByName('CPNOREG').AsString;
            xLoc   := DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsString ;
            xExt   := DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsString ;
            xOri   := DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsString ;
            //** 25/07/2001 - pjsv
            xtcam  := DMTE.cdsDocPago.FieldByName('DETCPAG').AsString;
            //**
            ssql:='';
            ssql := 'UPDATE CXP301 SET '+
                    ' CPPAGLOC='+xloc+
                    ' ,CPPAGEXT='+xext+
                    ' ,CPPAGORI='+xori;
            If (DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat <= 0.02) or (DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat <= 0.02) then
             ssql := ssql +  ' ,CPESTADO  ='+quotedstr('C');
            ssql := ssql + ' ,CPTCAMPA    ='+xtcam+
                           ' WHERE CIAID  ='+quotedstr(xcia)+
                           ' AND TDIARID  ='+quotedstr(xtdia)+
                           ' AND CPANOMES ='+quotedstr(xperio)+
                           ' AND CPNOREG  ='+quotedstr(xnreg);
            try
             DCOM1.AppServer.EjecutaSQL(ssql);
            except
            end;
}

        end
        else
        begin
            ShowMessage('Documento por pagar no fue encontrado para su actualización') ;
        end ;
        cdsDocPago.Next;
      end ;
      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);
      cdsDocPago.EnableControls;
//      cdsMovCxP.Filtered:=True;
      cdsMovCxP.First;
      cdsMovCxP.EnableControls;
    end;
end;

procedure TFPagoProvRep.RetornaSaldosMovCxP;
begin
    with DMTE do
    begin
      cdsMovCxP.DisableControls;
      cdsMovCxP.Filtered:=False;
      cdsDocPago.DisableControls;
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
            cdsMovCxP.edit;
            DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.cdsMovCxP.FieldByName('CPMTOEXT').Value - DMTE.numerononulo( DMTE.cdsMovCxP.FieldByName('CPPAGEXT') ) ;
            DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.cdsMovCxP.FieldByName('CPMTOLOC').Value - DMTE.numerononulo( DMTE.cdsMovCxP.FieldByName('CPPAGLOC') ) ;
            If DMTE.cdsMovCxP.FieldByName('TMONID').AsString = wTMonLoc then
               DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value
            else
               DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value ;
         end;
         cdsDocPago.Next;
     end;
     cdsDocPago.EnableControls;
     cdsMovCxP.Filtered:=True;
     cdsMovCxP.EnableControls;
   end;
end;

procedure TFPagoProvRep.dbgOtrosCalcCellColors(Sender: TObject;
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

procedure TFPagoProvRep.dbgDocPagoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
{    if (Field.FieldName = 'DEMTOLOC') or (Field.FieldName = 'DEMTOEXT') then begin
       AFont.Color := clBlue;
    end;}
end;


procedure TFPagoProvRep.dbeGiradoAChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagoProvRep.dbeTCambioChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagoProvRep.dbeImporteChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagoProvRep.dbeNoDocChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagoProvRep.dbeNoChqChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagoProvRep.dbeLoteChange(Sender: TObject);
begin
   wmodifica:=True;
end;


procedure TFPagoProvRep.dbeGlosaChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagoProvRep.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFPagoProvRep.z2bbtnOKCabClick(Sender: TObject);
var
    xWhere : String ;
   xSQL : string;
begin

   if validacionCabecera = False then
      exit;

   dblcClase.Enabled := True;
   dbeTCambio.text   := DMTE.RecuperarTipoCambio(dbdtpFComp.date) ;

   with DMTE do
   begin
      xWhere :=  'CIAID ='+''''+dblcCia.Text+''''
                +' AND TDIARID ='+''''+dblcTDiario.Text+''''
                +' AND ECANOMM ='+''''+edtPeriodo.Text+''''
                +' AND ECNOCOMP ='+''''+dbeNoComp.Text +'''';
      if DisplayDescrip('prvTGE','CAJA302','COUNT(*) TOTREG',xWhere,'TOTREG')>'0' then
      begin
             ShowMessage('Comprobante ya esta Registrado');
             dbeNoComp.Text:='';
             dbeNoComp.SetFocus;
             exit;
      end
      else
      begin
        ActivaFiltro('REGCXP');
        ActivaFiltro('DOCPAGO');
////////////////////////////////////////////
        //0805
        //liberamos el filtro del detalle
         DMTE.cdsRegCxP.Filtered := False ;

        //// Insertar un nuevo registro

         // vhn 22/01/2001
         xSQL:='Select * from CAJA302 '
              +'Where CIAID='''   +dblcCia.Text    +''' and '
              +      'ECANOMM=''' +edtPeriodo.Text +''' and '
              +      'TDIARID=''' +dblcTDiario.Text+''' and '
              +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
         DMTE.cdsQry.Close;
         DMTE.cdsQry.DataRequest( xSQL );
         DMTE.cdsQry.Open;

        //hacemos una nueva comprobacion
         if cdsQry.RecordCount <> 0 then
         begin
             ShowMessage('Comprobante ya esta registrado : Tipo 2');
             dbeNoComp.Text:='';
             dbeNoComp.SetFocus;
             exit;
         end  ;
        //insertamos el Nuevo Registro
        cdsEgrCaja.Insert;
        cdsEgrCaja.FieldByName('ECESTADO').AsString:='N';        
//
        CambiaEstado('N');
      end;
   end;
   (Sender as tcontrol).enabled:=False;
   perform(CM_DialogKey,VK_TAB,0);
   wmodifica:=False;

end;

procedure TFPagoProvRep.dbeNoCompExit(Sender: TObject);
begin
  dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsEgrCaja.fieldbyname('ECNOCOMP').DisplayWidth);
end;

procedure TFPagoProvRep.dbgDocPagoCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'DEMTOLOC') or (AFieldName = 'DEMTOEXT') then
    begin
//       ABrush.Color := clNone;
       ABrush.Color := clWhite;
    end;

end;

procedure TFPagoProvRep.dbgOtrosCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'DEMTOLOC') or (AFieldName = 'DEMTOEXT') then
    begin
//       ABrush.Color := clNone;
       ABrush.Color := clWhite;
    end;
end;

procedure TFPagoProvRep.dblcdCnpExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then exit;
   if dblcTMon.Focused     then exit;

   dbeGlosa.text := DMTE.DisplayDescripLocal(DMTE.cdsCnpEgr,'CPTOID',dblcdCnp.Text,'CPTODES') ;
   edtCuenta.text := DMTE.DisplayDescripLocal(DMTE.cdsCnpEgr,'CPTOID',dblcdCnp.Text,'CUENTAID') ;

   if dbeGlosa.text='' then begin
      ShowMessage('Error : Concepto no Valido');
      dblcdCnp.SetFocus;
   end;
end;

procedure TFPagoProvRep.InhabilitarPaneles;
begin
   pnlDetalle.Enabled  := False;
   pnlBotones.Enabled  := False;
   IniciaPanel;
   pnlActualiza.BringToFront ;
   pnlActualiza.left := 106;
   pnlActualiza.Top  := 179;
   pnlActualiza.Visible:= True;
   dbeNoReg.Enabled    := True;
   dbeNoReg.Color      := clWindow;
   dbeNoReg.SetFocus;
   //Aqui se establecen los filtros para edicion en el grid
   establecerfiltrosRegistroEgresos;
end;

procedure TFPagoProvRep.EdiTarRegistros;
begin
   BlanqueaEdits( pnlActualiza ) ;
   DMTE.cdsRegCxP.Edit;    //Lo pongo en modo de edicion
   dbeNoReg.Text:=DMTE.cdsRegCxP.FieldByName('CPNOREG').Value;
   dbeNoReg.Enabled:=False;
   lblEstado.Caption := 'En Edicion';
   dbeNoReg.Enabled := False;
   dbeNoReg.Color   := clBtnFace;


{   if not DMTE.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ DMTE.wClaseAuxProv ]),[]) then
      Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''') ;  }

   //Recuperacion de los detalles del panel
   if trim( dblcTDoc2.Text ) <> '' then
      edtTDoc2.Text     :=
            DMTE.DisplayDescrip('prvTGE','TGE110','DOCABR','DOCID=''' + dblcTDoc2.Text + '''','DOCABR') ;
   if trim( dblcdCnp2.Text ) <> '' then
      edtCnp2.Text      :=
            DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOABR','CPTOID=''' + dblcdCnp2.Text + '''','CPTOABR') ;

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
      if not DMTE.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClasedet.Text ]),[]) then
         Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''') ;



end;

procedure TFPagoProvRep.AdicionarRegistros;
var
   xWhere, Aux, xNoRepo :String;
begin
   xNoRepo:=NumeroReposicion;

   if Length(xNoRepo)=0 then begin
      z2bbtnCancel3.SetFocus;
      z2bbtnCancel3Click( nil );
      Exit;
   end;

   BlanqueaEdits(pnlActualiza);
   
   dbeNoReg.Enabled:=True;
   dbeNoReg.Text:='';
   dbeNoReg.Text := GeneraCorrelativo( DMTE.cdsRegCxP, 'CPNOREG' ) ;

   DMTE.cdsRegCxP.Insert;
   DMTE.cdsRegCxP.FieldByName('CIAID').Value   := dblcCia.Text;
   DMTE.cdsRegCxP.FieldByName('TDIARID').Value := dblcTDiario.Text;
   DMTE.cdsRegCxP.FieldByName('ECANOMM').Value := edtPeriodo.Text;
   DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value:= dbeNoComp.Text;
   DMTE.cdsRegCxP.FieldByName('DETCPAG').Value := strtofloat(dbeTCambio.Text);
   DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value := DMTE.cdsEgrCaja.Fieldbyname('ECFCOMP').Value;
   DMTE.cdsRegCxP.FieldByName('CPFEMIS').Value := DateS;
   DMTE.cdsRegCxP.FieldByName('CPFVCMTO').Value:= DateS;
   DMTE.cdsRegCxP.FieldByName('CPANOMM').Value := copy(datetostr( DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value),7,4)
                               + copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value),4,2);
   DMTE.cdsRegCxP.FieldByName('DETCPAG').Value := DMTE.cdsEgrCaja.Fieldbyname('ECTCAMB').Value;
   DMTE.cdsRegCxP.FieldByName('DETCDOC').Value := DMTE.cdsEgrCaja.Fieldbyname('ECTCAMB').Value;
   DMTE.cdsRegCxP.FieldByName('DEDH').Value    := 'D';     //Inicializo en Debe

   xWhere:='FECHA=' +DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha,DMTE.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime)+''')';
   aux :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
   DMTE.cdsRegCxP.FieldByName('DEANO').Value  := DMTE.cdsqry.FieldByName('FECANO').AsString;
   DMTE.cdsRegCxP.FieldByName('DEMM').Value   := DMTE.cdsqry.FieldByName('FECMES').AsString;
   DMTE.cdsRegCxP.FieldByName('DEDD').Value   := DMTE.cdsqry.FieldByName('FECDIA').AsString;
   DMTE.cdsRegCxP.FieldByName('DESS').Value   := DMTE.cdsqry.FieldByName('FECSS').AsString;
   DMTE.cdsRegCxP.FieldByName('DESEM').Value  := DMTE.cdsqry.FieldByName('FECSEM').AsString;
   DMTE.cdsRegCxP.FieldByName('DETRI').Value  := DMTE.cdsqry.FieldByName('FECTRIM').AsString;
   DMTE.cdsRegCxP.FieldByName('DEAASS').Value := DMTE.cdsqry.FieldByName('FECAASS').AsString;
   DMTE.cdsRegCxP.FieldByName('DEAASEM').Value:= DMTE.cdsqry.FieldByName('FECAASEM').AsString;
   DMTE.cdsRegCxP.FieldByName('DEAATRI').Value:= DMTE.cdsqry.FieldByName('FECAATRI').AsString;
   DMTE.cdsRegCxP.FieldByName('ECNOREPO').Value:=xNoRepo;

   dbeNoReg.SetFocus;
   //blanqueo de descripciones
   edtTDoc2.Text   := '' ;
   edtCnp2.Text    := '' ;
   dbeAuxDet.Text  := '' ;
   edtTMon2.Text   := '' ;

//   dblcClaseDet.Enabled:= False ;
//   dblcdAuxDet.Enabled := False ;
   dblcdCCosto.Enabled := False ;
   //
   lblEstado.Caption := 'Nuevo     '   ;
   cdsTDiarioDet.Filter := 'TDIARID=''''' ;
   cdsTDiarioDet.Filtered := True ;
end;

procedure TFPagoProvRep.LiberarFiltrosRegistroEgresos;
begin
   DMTE.cdsTDoc.Filter:='';
   DMTE.cdsTDoc.Filtered:=True;
end;

procedure TFPagoProvRep.EstablecerFiltrosRegistroEgresos;
begin
   DMTE.cdsTDoc.Filter := 'NOT ( TDIARID IS NULL) OR NOT (TDIARID2 IS NULL) ' ;
   DMTE.cdsTDoc.Filtered := True;
end;


procedure TFPagoProvRep.dbeNoRegExit(Sender: TObject);
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

procedure TFPagoProvRep.z2bbtnOK2Click(Sender: TObject);
begin

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
      cdsPost(DMTE.cdsRegCxP);
      DMTE.cdsRegCxP.Post;
      ShowMessage('Grabacion Ok');
      wmodifica:=True;

      if not dbeNoReg.Enabled then
      begin
         PnlActualiza.Visible := False;
         pnlDetalle.Enabled   := True;
         pnlBotones.Enabled   := True;
         z2bbtnSumatClick(sender);    // Al salir hay que totalizar
         //quitar los filtros que se hubieran establecido
         liberarfiltrosregistroegresos;
         z2bbtnSumatSelecClick(Nil);
         SaldoPorRendir;
//         CalcularSaldo;
      end
      else
      begin
         z2bbtnSumatClick(sender);    // Al salir hay que totalizar
         SaldoPorRendir;
//         CalcularSaldo;
         adicionarRegistros;
      end;
   end;

end;


procedure TFPagoProvRep.dblcTMon2Exit(Sender: TObject);
var xWhere, aux: string;
begin
   if  z2bbtnCancel3.Focused then  exit;

   xWhere:='TMONID='+''''+dblcTMon2.Text+'''';
   edtTMon2.Text:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');

   if (length(edtTMon2.Text)>0) and (DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat>0) then
   begin
     if DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc then
     begin
        DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
        DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value/DMTE.cdsEgrCaja.Fieldbyname('ECTCAMB').Value;
     end
     else
     begin
        DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value*DMTE.cdsEgrCaja.Fieldbyname('ECTCAMB').Value;
        DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
     end;
   end
   else
   begin
        DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=0;
        DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=0;
   end;
end;

procedure TFPagoProvRep.dbeDHChange(Sender: TObject);
begin
     if not ((dbeDH.Text='D') or (dbeDH.Text='H') or (length(dbeDH.Text)=0)) then
     begin
        dbeDH.Text:='';
        dbeDH.SetFocus;
     end;
end;

procedure TFPagoProvRep.dbeImporte2Exit(Sender: TObject);
var xWhere, aux: string;
begin
      if  z2bbtnCancel3.Focused then
          exit;
      xWhere:='TMONID='+''''+DMTE.cdsRegCxP.FieldByName('TMONID').Value+'''';
      aux:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
      if (length(aux)>0) and (DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value>0) then
      begin
        if DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc then
        begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat/DMTE.cdsEgrCaja.Fieldbyname('ECTCAMB').AsFloat,15,2);
        end
        else
        begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat*DMTE.cdsEgrCaja.Fieldbyname('ECTCAMB').AsFloat,15,2);
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
        end;
      end
      else
      begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=0;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=0;
      end;
end;


procedure TFPagoProvRep.z2bbtnCancel3Click(Sender: TObject);
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
     z2bbtnSumatSelecClick(Nil);     
   //quitar los filtros que se hubieran establecido
     liberarfiltrosregistroegresos;
end;

procedure TFPagoProvRep.dbgOtrosDblClick(Sender: TObject);
begin
   if not dbgOtrosIbutton.Enabled then
      exit ;

   if dbgOtros.DataSource.DataSet.RecordCount<>0 then
   begin
      inHabilitarPaneles;
      editarRegistros;
   end;
end;

function TFPagoProvRep.ValidacionCabecera: Boolean;
begin
     result:=False;
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


     //si llega aqui es True
     result:=True;

end;

procedure TFPagoProvRep.z2bbtnImprimeClick(Sender: TObject);
var
   Comprobante : RCabComprobante;
   xSQL        : String;
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
      ImprimeVoucher( 'CNT301', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
   end;
end;

procedure TFPagoProvRep.FormShow(Sender: TObject);
VAR
   Comp : structComprobante ;
   xSQL : String;
begin
   with DMTE do
   begin
      if DMTE.wModo='A' then
       begin
         Adiciona;
         RecuperarCiaUnica(dblcCia,edtCia);
         edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                         +copy(datetostr(dbdtpFComp.date),4,2);
         if dblccia.text <> '' then
            perform(CM_DialogKey,VK_TAB,0);
         pnlCabecera1.Enabled:=True;
       end
      else
       begin

        Edita( Comp, DMTE.cdsEgrCaja );

        if cdsEgrCaja.Fieldbyname('ECESTADO').Value='I' then//Si está INCOMPLETO o PENDIENTE
        begin
           pnlCabecera1.Enabled:=False;
           pnlCabecera2.setfocus ;
           perform(CM_DialogKey,VK_TAB,0);
        end;

        if ( cdsEgrCaja.Fieldbyname('ECESTADO').Value='C' ) or
           ( cdsEgrCaja.Fieldbyname('ECESTADO').Value='A' ) then      //Si está CANCELADO
        begin
           pnlBotones.SetFocus ;
           perform(CM_DialogKey,VK_TAB,0);
        end;
        pnlCabecera1.Enabled:=False;
       end;
   end ;
   cf1.PonerExits ;

   if DMTE.wModo<>'A' then begin
      if (DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString<>'C') and
              (DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString<>'A') then
         xSQL:='SELECT * FROM CAJA302 '
              +'WHERE CIAID='''    + dblcCia.Text   +''' and '
              +      'CLAUXID='''  + dblcClase.Text +''' and '
              +      'PROV='''     + dblcdAux.Text  +''' and '
              +      'ECNOREPO Is Not Null and '
              +      'ECESTADO=''C'' and '
              +      '(ECSALMN>0 or ECSALME>0)'
      else
         xSQL:='SELECT * FROM CAJA302 '
              +'WHERE CIAID='''    + dblcCia.Text   +''' and '
              +      'CLAUXID='''  + dblcClase.Text +''' and '
              +      'PROV='''     + dblcdAux.Text  +''' and '
              +    '( TDIARIO2=''' +dblcTDiario.Text+''' and '
              +      'ECANOMM2=''' +edtPeriodo.Text +''' and '
              +      'ECNOCOMP2='''+dbeNoComp.Text  +''' )  ';

      DMTE.cdsECRepo.Close;
      DMTE.cdsECRepo.DataRequest( xSQL );
      DMTE.cdsECRepo.Open;

      dbgSelec.ApplySelected;
      dbgSelec.ReFreshDisplay;
      z2bbtnSumatSelecClick(Sender);

      TabbedNotebook1.Enabled:=False;
      TabbedNotebook1.PageIndex:=1;
      z2bbtnSumatClick( Self );
      TabbedNotebook1.PageIndex:=0;
      z2bbtnSumatDocPagoClick( Self );
      TabbedNotebook1.Enabled:=True;
      SaldoPorRendir;
//      CalcularSaldo;
   end
   else begin
      dbgSelec.ReadOnly:=False;
      xSQL:='SELECT * FROM CAJA302 WHERE CIAID=''ZZ'' ';
      DMTE.cdsECRepo.Close;
      DMTE.cdsECRepo.DataRequest( xSQL );
      DMTE.cdsECRepo.Open;
   end;
   TNumericField(DMTE.cdsECRepo.FieldbyName('ECMTOLOC')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsECRepo.FieldbyName('ECMTOEXT')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsECRepo.FieldbyName('ECSALMN')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsECRepo.FieldbyName('ECSALME')).displayFormat:= '###,###,##0.00';
end;

procedure TFPagoProvRep.dbeNoChqChange2(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFPagoProvRep.dbeTCambioChange2(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFPagoProvRep.dblcFormPagoEnter(Sender: TObject);
begin
    strTmp := (Sender as tcustomedit).text ;
end;

procedure TFPagoProvRep.RecuperaDescrip;
var
   CLAUXID, xWhere : String;
   AUXID   : String;
begin
   DMTE.DescripPagoVaProv(dblcCia.text,edtPeriodo.text,dblcTDiario.Text,dbeNoComp.text);
   DMTE.cdsDescrip.Active := False ;
   DMTE.cdsDescrip.Active := True ;
//   edtTMon.text     := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('TMONABR'));

   if DMTE.cdsAux.Locate('AUXID',VARARRAYOF([DMTE.cdsEgrCaja.FIELDBYNAme('PROV').AsString ]),[]) then
   begin
      CLAUXID:= DMTE.cdsAux.FIELDBYNAME('CLAUXID').AsString;
      AUXID  := DMTE.cdsAux.FIELDBYNAME('AUXID').AsString;
      if DMTE.RecuperarDatos('CNT201','AUXNOMB','CLAUXID='''+CLAUXID+''' AND AUXID = '''+ AUXID + ''' ') then
         dbeGiradoA.Text:=DMTE.cdsrec.fieldBYname('AUXNOMB').AsString;
   end ;
   edtCia.Text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('CIADES'));
   edtTDiario.Text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('TDIARABR'));
   xWhere:='TMONID='+''''+dblcTMon.Text+'''';
   edtTMon.Text:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
   edtBanco.text:= DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr,'BANCOID',dblcBanco.Text,'BANCOABR') ;
   
end;

procedure TFPagoProvRep.Adiciona;
var
   xSQL : String ;
begin
   //Código Nuevo
   IniciaDatos ;
   xGraboNuevo := False ;
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
   TNumericField(DMTE.cdsDocPago.FieldbyName('DESALLOC')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsDocPago.FieldbyName('DESALEXT')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsDocPago.FieldbyName('DEMTOLOC')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsDocPago.FieldbyName('DEMTOEXT')).displayFormat:= '###,###,##0.00';


   xSQL:=' Select * from CXC303 '
          +' Where 1<>1';
   DMTE.cdsIngDocs.Close;
   DMTE.cdsIngDocs.DataRequest(xSQL);
   DMTE.cdsIngDocs.Open;
   DMTE.cdsIngDocs.EmptyDataSet;


	 // vhn 23/01/2001
	 xSQL:='Select * from CAJA301 '
				+'Where CIAID='''' and CCTREC='''' and DOCID2='''' and '
				+      'CPSERIE='''' and CPNODOC='''' ';
	 DMTE.cdsRegCxC.Close;
	 DMTE.cdsRegCxC.DataRequest( xSQL );
	 DMTE.cdsRegCxC.Open;
   
   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOORI')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOLOC')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOEXT')).displayFormat:= '###,###,##0.00';

	 // vhn 22/01/2001
	 xSQL:='Select * from CAJA314 '
				+'Where CIAID='''' and CCTREC='''' and '
				+      'DOCID='''' and CCSERIE='''' and '
				+      'CCNODOC='''' ';
	 DMTE.cdsDetFPago.Close;
	 DMTE.cdsDetFPago.DataRequest( xSQL );
	 DMTE.cdsDetFPago.Open;
   DMTE.cdsDetFPago.IndexFieldNames:='CIAID;CCTREC;DOCID;CCSERIE;CCNODOC;CPNOREG';
   DMTE.cdsDetFPago.MasterSource:=DMTE.dsRegCxC;
   DMTE.cdsDetFPago.MasterFields:='CIAID;CCTREC;DOCID2;CPSERIE;CPNODOC;CPNOREG';

   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_RECIBIDO')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_MTOLOC')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_MTOEXT')).displayFormat:= '###,###,##0.00';

   DMTE.cdsMovCxP.Filter := 'CIAID=''''' ;
   DMTE.cdsMovCxP.Filtered := True ;

   dblcdAux.Enabled := True ;
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
//fin de nuevo código
end;

procedure TFPagoProvRep.Edita(Comp: structComprobante;cds : Twwclientdataset);
var
   xWhere ,
   xFiltro : String ;
   xSQL  : string;
begin
   IniciaDatos;

   dblcCia.Text     := DMTE.cdsEgrCaja.Fieldbyname('CIAID').Value;
   dblcTDiario.Text := DMTE.cdsEgrCaja.Fieldbyname('TDIARID').Value;
   edtPeriodo.Text  := DMTE.cdsEgrCaja.Fieldbyname('ECANOMM').Value;
   dbeNoComp.Text   := DMTE.cdsEgrCaja.Fieldbyname('ECNOCOMP').Value;

   dbdtpFComp.date  :=DMTE.cdsEgrCaja.Fieldbyname('ECFCOMP').Value;
   dblcClase.Text   :=DMTE.cdsEgrCaja.Fieldbyname('CLAUXID').AsString;

   xSQL:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+'''';
   DMTE.cdsAux.Close;
   DMTE.cdsAux.DataRequest( xSQL ) ;
   DMTE.cdsAux.Open;

   edtClase.text:= DMTE.DisplayDescripLocal(DMTE.cdsClaseAux,'CLAUXID',dblcClase.Text,'CLAUXDES') ;

   dblcdAux.Text    :=DMTE.cdsEgrCaja.Fieldbyname('PROV').AsString;
   edtAuxRuc.Text   :=DMTE.cdsEgrCaja.Fieldbyname('PROVRUC').AsString;
   dbeGiradoA.Text  :=DMTE.cdsEgrCaja.Fieldbyname('ECGIRA').Value;
   dblcTMon.Text    :=DMTE.cdsEgrCaja.Fieldbyname('TMONID').Value;
   dbeTCambio.Text  :=floattostr(DMTE.cdsEgrCaja.Fieldbyname('ECTCAMB').Value);
   xTC              :=DMTE.cdsEgrCaja.Fieldbyname('ECTCAMB').AsFloat ;
   dbeImporte.Text  :=floattostr(DMTE.cdsEgrCaja.Fieldbyname('ECMTOORI').Value);
   dblcdCnp.Text    :=DMTE.cdsEgrCaja.Fieldbyname('CPTOID').AsString;
   dbeGlosa.Text    :=DMTE.cdsEgrCaja.Fieldbyname('ECGLOSA').AsString;
   dblcBanco.Text   :=DMTE.cdsEgrCaja.Fieldbyname('BANCOID').AsString;
   RecuperaDescrip;
   ActivaFiltro('REGCXP');
   ActivaFiltro('DOCPAGO');

   xSQL:='Select * from CXC303 '
        +'Where CIAID='''   +dblcCia.Text    +''' and '
        +      'ECANOMM=''' +edtPeriodo.Text +''' and '
        +      'TDIARID=''' +dblcTDiario.Text+''' and '
        +      'ECNOCOMP2='''+dbeNoComp.Text  +''' ';
   DMTE.cdsIngDocs.Close;
   DMTE.cdsIngDocs.DataRequest(xSQL);
   DMTE.cdsIngDocs.Open;

//    if DMTE.cdsIngDocs.RecordCount>0 then
//    begin

   xSQL:='Select * from CAJA301 '
        +'Where CIAID='''  +DMTE.cdsIngDocs.FieldbyName('CIAID').AsString  +''' and '
        +      'CCTREC=''' +DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString +''' and '
        +      'DOCID2=''' +DMTE.cdsIngDocs.FieldbyName('DOCID').AsString  +''' and '
        +      'CPSERIE='''+DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString+''' and '
        +      'CPNODOC='''+DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString+''' ';
   DMTE.cdsRegCxC.Close;
   DMTE.cdsRegCxC.DataRequest( xSQL );
   DMTE.cdsRegCxC.Open;
   
   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOORI')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOLOC')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOEXT')).displayFormat:= '###,###,##0.00';



   SumaDetIng;
   dbgDetPago.RefreshDisplay;
   SumaDetIng;

   xSQL:='Select * from CAJA314 '
        +'Where CIAID='''   +DMTE.cdsIngDocs.FieldbyName('CIAID').AsString  +''' and '
        +      'CCTREC='''  +DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString +''' and '
        +      'DOCID='''   +DMTE.cdsIngDocs.FieldbyName('DOCID').AsString  +''' and '
        +      'CCSERIE=''' +DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString+''' and '
        +      'CCNODOC=''' +DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString+''' ';
   DMTE.cdsDetFPago.Close;
   DMTE.cdsDetFPago.DataRequest( xSQL );
   DMTE.cdsDetFPago.Open;
   DMTE.cdsDetFPago.IndexFieldNames:='CIAID;CCTREC;DOCID;CCSERIE;CCNODOC;CPNOREG';
   DMTE.cdsDetFPago.MasterSource:=DMTE.dsRegCxC;
   DMTE.cdsDetFPago.MasterFields:='CIAID;CCTREC;DOCID2;CPSERIE;CPNODOC;CPNOREG';

   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_RECIBIDO')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_MTOLOC')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_MTOEXT')).displayFormat:= '###,###,##0.00';
   

   SumaDetIng;
   AcumulaDetFPago;

   if DMTE.cdsEgrCaja.Fieldbyname('ECESTADO').Value='I' then
   begin
      DMTE.cdsEgrCaja.Edit;
      CambiaEstado ('I');
      dbgOtrosIButton.Enabled := True ;

      xWhere:='CIAID = '+quotedstr(dblcCia.Text)+
              ' AND CPESTADO ='+quotedstr('P')+
              ' AND CLAUXREND='+quotedstr(dblcClase.Text)+
              ' AND AUXIDREND='+quotedstr(dblcdAux.Text);

      xFiltro:=' (( (CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR '+
               '  ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) '  ;

      DMTE.cdsMovCxP.active  := False ;
      DMTE.cdsMovCxP.Datarequest('SELECT * FROM CXP301 WHERE ' + xWhere ) ;
      DMTE.cdsMovCxP.Active  := True ;
      DMTE.cdsMovCxP.Filter  := xFiltro ;
      DMTE.cdsMovCxP.Filtered:= True ;
      TNumericField(DMTE.cdsMovCxP.FieldbyName('CPTCAMPR')).displayFormat:= '###,###,##0.00';
      TNumericField(DMTE.cdsMovCxP.FieldbyName('CPMTOORI')).displayFormat:= '###,###,##0.00';
      TNumericField(DMTE.cdsMovCxP.FieldbyName('CPSALLOC')).displayFormat:= '###,###,##0.00';
      TNumericField(DMTE.cdsMovCxP.FieldbyName('CPSALEXT')).displayFormat:= '###,###,##0.00';

   end;

   if DMTE.cdsEgrCaja.Fieldbyname('ECESTADO').Value='C' then      //Si está CANCELADO
   begin
      CambiaEstado('C');
      dbgOtrosIButton.Enabled := False ;
      ActPnlBotones;
   end;

   if DMTE.cdsEgrCaja.Fieldbyname('ECESTADO').Value='A' then      // Si esta ANULADO
   begin
      CambiaEstado('A');
      dbgOtrosIButton.Enabled := False ;
      ActPnlBotones;
   end;

   dblcClase.Enabled := False ;
   dblcdAux.Enabled := False ;

   (z2bbtnOkCab).enabled:= False;
   z2bbtnNuevo.Visible  := False;
   z2bbtnCancel.Visible := False;
   wmodifica:=False;
end;

procedure TFPagoProvRep.FormCreate(Sender: TObject);
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

    cdsTdiarioDet := TwwClientdataset.Create(Self) ;
    cdsTdiarioDet.CloneCursor(DMTE.cdsTDiario ,True) ;
    cdsTdiarioDet.Name := 'cdsTdiarioDet' ;
    cf1 := TControlFoco.Create ;
    DMTE.cdsFEfec.Filter := 'FLUEFE_IS = ''S'' ' ;
    DMTE.cdsFEfec.Filtered := True ;
end;

procedure TFPagoProvRep.AdicIniciaDatos;
begin

   RecuperarCiaUnica(dblcCia,edtCia);
   edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
   if dblccia.Text<>'' then
      perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFPagoProvRep.ConfiguraAccesos;
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


procedure TFPagoProvRep.Libera_Admin;
begin
    Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFPagoProvRep.Libera_Consul;
begin

end;

procedure TFPagoProvRep.Proc_Admin;
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

procedure TFPagoProvRep.Proc_Consul;
begin
    pnlCabecera1.Enabled := False ;
    pnlCabecera2.Enabled := False ;
    pnlDeTalle.Enabled := True ;
    pnlBotones.Enabled := False ;
end;

procedure TFPagoProvRep.LibConfigAccesos;
begin
    if DMTE.wAdmin = 'G' then
       Libera_Admin
    else
    begin
       if DMTE.wModo = 'C' then
          Libera_Consul ;
    end ;
end;

procedure TFPagoProvRep.ValidaCabecera2;
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

   if length(dbeImporte.Text)=0 then raise exception.Create('Falta Elegir Monto a rendir Cuenta')
   else
      if strtofloat(dbeImporte.Text)<=0 then raise exception.Create('Falta Elegir Monto a rendir Cuenta');

   if length(dblcdCnp.Text)=0 then raise exception.Create('Falta Concepto');

end;

procedure TFPagoProvRep.dbeTCambioEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFPagoProvRep.dbeImporteEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFPagoProvRep.dbeImporteExit(Sender: TObject);
begin
    if strTmp <> TCustomEdit(Sender).text then
    begin
       TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text) ;
    end ;
end;

procedure TFPagoProvRep.dbeTCambioExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then exit;
   if strTmp <> TCustomEdit(Sender).text then
   begin
      TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text,4) ;
   end ;
end;

procedure TFPagoProvRep.SaldosAux;
var
//   xDatAux  : structSaldosAux ;
   Previo, Actual, xClase : String;
   cdsClone : TwwClientDataSet ;
begin
    with DMTE.cdsDocPago do
    begin
       if RecordCount=0 then
          Exit;
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
       IndexFieldNames:='';
       EnableControls;
       cdsClone.free;
    end ;
end;

procedure TFPagoProvRep.Opera(xProv , xClase : string;cdsClone : TwwClientDataSet) ;
var
   xFiltro : string          ;
   xDEMTOLOC ,
   xDEMTOEXT : Currency      ;
   xDatAux : structSaldosAux ;
   xMTOSLOC ,
   xMTOSEXT : Currency       ;
begin
   xFiltro  := 'CLAUXID = ''' + xClase + ''' AND PROV = ''' + xProv + '''' ;
   cdsclone.CloneCursor(DMTE.cdsDocPago,True) ;
   //Calculo de Montos Locales
   cdsclone.Filter   := xfiltro +' AND TMONID= '''+DMTE.wTMonLoc+'''' ;
   cdsclone.Filtered := True   ;

   xMTOSLOC := 0 ;
   xMTOSEXT := 0 ;

   if cdsClone.RecordCount <> 0 then
   begin
      cdsClone.First ;
      while not cdsClone.Eof do
      begin
          if ( cdsclone.fieldbyname('TMONID').asstring <> dblctmon.Text ) then
          begin
             xMTOSLOC := Redondea( cdsclone.fieldbyname('DEMTOEXT').AsFloat) *
                         ( cdsclone.fieldbyname('DETCDOC').AsFloat )
          end
          else
             xMTOSLOC := xMTOSLOC + cdsclone.fieldbyname('DEMTOLOC').AsFloat ;
          cdsClone.Next ;
      end;
   end;

   //calculo de Montos Extranjeros
   cdsclone.Filter   := xfiltro +' AND TMONID= '''+DMTE.wTMonExt+'''' ;
   cdsclone.Filtered := True   ;
   if cdsClone.RecordCount <> 0 then
   begin
      while cdsClone.Eof do
      begin
          if ( cdsclone.fieldbyname('TMONID').asstring <> dblctmon.Text ) then
          begin
             xMTOSext := Redondea( cdsclone.fieldbyname('DEMTOLOC').AsFloat) /
                         ( cdsclone.fieldbyname('DETCDOC').AsFloat )
          end
          else
             xMTOSEXT := xMTOSEXT + cdsclone.fieldbyname('DEMTOEXT').AsFloat ;
          cdsClone.Next ;
      end;
   end;

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

function TFPagoProvRep.BuscaClase: String;
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

procedure TFPagoProvRep.dblcTDoc2Exit2(Sender: TObject);
var
   Filtro : String ;
   Tmp : String ;
begin
   if z2bbtnCancel3.Focused then exit;
   if dblcTDoc2.Text='' then Exit;

   edtTDoc2.text:= DMTE.DisplayDescripLocal(DMTE.cdsTDoc,'DOCID',dblcTDoc2.Text,'DOCDES') ;

   if edtTDoc2.Text='' then begin
      ShowMessage('Error : Tipo de Documento no Valido');
      dblcTDoc2.SetFocus;
      Exit;
   end;
   dbeSerie.Enabled :=True;
   dbeNoDoc2.Enabled:=True;
   DMTE.cdsRegCxP.FieldByName('DOCMOD').Value:=DMTE.cdsTDoc.FieldByname('DOCMOD').AsString;
end;


procedure TFPagoProvRep.RecCptosDifC;
begin
   if trim(DMTE.cdsECRepo.FieldByName('CCBCOID').AsString)='' then
   begin
      if not DMTE.RecuperarDatos('TGE105','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP','BANCOID='''+DMTE.cdsECRepo.FieldByName('BANCOID').AsString+'''' )  then
         Raise exception.create('No se puede Contabilizar '+#13+
               'Falta Definir las Cuentas de Dif. de Cambio') ;
   end
   else
   begin
      if not DMTE.RecuperarDatos('TGE106','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP','BANCOID='''+DMTE.cdsECRepo.FieldByName('BANCOID').AsString+
                                ''' AND CCBCOID=''' + DMTE.cdsECRepo.FieldByName('CCBCOID').AsString+ '''' )  then
         Raise exception.create('No se puede Contabilizar '+#13+
               'Falta Definir las Cuentas de Dif. de Cambio') ;
   end ;
   wCptoGan  := DMTE.cdsRec.fieldbyname('CPTODIFG').AsString ;
   wCptoPer  := DMTE.cdsRec.fieldbyname('CPTODIFP').AsString ;
   wCtaGan   := DMTE.cdsRec.fieldbyname('CTADIFG').AsString ;
   wCtaPer   := DMTE.cdsRec.fieldbyname('CTADIFP').AsString ;
end;

procedure TFPagoProvRep.dblcClaseDetExit(Sender: TObject);
var
   xSQL : String;
begin
   edtClaseDet.text := DMTE.DisplayDescripLocal(DMTE.cdsQry4,'CLAUXID',dblcdAuxDet.Text,'CLAUXDES') ;
//   edtClaseDet.text := DMTE.displaydescrip('prvTGE','TGE102','CLAUXDES','CLAUXID='+quotedstr(dblcClaseDet.text),'CLAUXDES');
{   xSQL:='Select AUXID,AUXNOMB,PROVRETIGV from CNT201 where CLAUXID='''+dblcClase.Text+'''';
   DMTE.cdsAux.Close;
   DMTE.cdsAux.DataRequest(xSQL) ;
   DMTE.cdsAux.Open;}
end;

procedure TFPagoProvRep.dblcdAuxEnter2(Sender: TObject);
begin
//  A PEDIDO DE OUS 28/01/2003
 {  if trim(dblcClaseDet.Text) = '' then
   begin
      dblcClaseDet.SetFocus ;
      exit ;
   end ;  }
end;

procedure TFPagoProvRep.dblcdAuxExit2(Sender: TObject);
begin
   if z2bbtnCancel3.Focused then exit;
   if dblcClaseDet.Focused then Exit;
   if Length(Trim(dblcdAuxDet.Text))>0 then
      dbeAuxDet.text := DMTE.displaydescrip('prvTGE','CNT201','AUXNOMB','AUXID='+quotedstr(dblcdAuxDet.text),'AUXNOMB');

//   dbeAuxDet.text:= DMTE.DisplayDescripLocal(DMTE.cdsQry4,'AUXID',dblcdAuxDet.Text,'AUXNOMB') ;

   if (dbeAuxDet.Text='') and (length(dblcClaseDet.text)>0) then
   begin
      ShowMessage('Error : Auxiliar no Valido');
      dblcdAuxDet.SetFocus;
      Exit;
   end;
end;

procedure TFPagoProvRep.dblcdCnp2Exit2(Sender: TObject);
var
   ssql,xwhere : string ;
   scuenta:string;
begin
  //** 22/03/2001 - pjsv
  ssql := 'CPTOID='+quotedstr(dblcdCnp2.text);
  edtCnp2.Text := DMTE.DisplayDEscrip('prvTGE','CAJA201','CPTODES,CUENTAID',ssql,'CPTODES');
  sCuenta:=DMTE.cdsQry.FieldByName('CUENTAID').AsString;
  if Trim(edtCnp2.Text) = '' then
  begin
    DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString := '' ;
//    dblcdAuxDet.Enabled := False ;
    dblcdCCosto.Enabled := False ;
  end
  else
   begin
//     DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString := dblcdCnp2.text;
      DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString := sCuenta;
     //Busca y Habilita
      xWhere:='CIAID=''' + dblccia.Text + ''' AND CUENTAID=''' +
               DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString + '''' ;
      if Length(DMTE.DisplayDescrip('prvTGE','TGE202','CUENTAID, CTA_CCOS, CTA_AUX',xWhere,'CuentaId'))>0 then
      begin
         //** 20/12/2000 - pjsv
         if (DMTE.cdsQry.fieldbyname('CTA_CCOS').Value='S') then
         begin
            ssql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
            DMTE.cdsCCosto.Close;
            DMTE.cdsCCosto.DataRequest(ssql);
            DMTE.cdsCCosto.open;
            dblcdCCosto.Enabled:=True;
            dblcdCCosto.SetFocus;
         end
         else  dblcdCCosto.Enabled := False ;
         //a PEDIDO DE OUS 28/01/2003
{         if DMTE.cdsQry.fieldbyName('CTA_AUX').asString = 'S' then
            dblcdAuxDet.Enabled:=True
         else
            dblcdAuxDet.Enabled := False;}
      end
   end ;

   dblcClaseDet.Enabled :=  dblcdAuxDet.Enabled   ;
   if dblcClaseDet.Enabled then
      dblcClaseDet.SetFocus;

   if (trim(edtCnp2.Text) <> '') and (StrTmp <> dblcdCnp2.Text) then
    begin
     if not dblcdAuxDet.Enabled then
       begin
         DMTE.cdsRegCxP.FieldByName('PROV').AsString    := '' ;
         DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString := '' ;
         edtClaseDet.Text  := '' ;
         dbeAuxDet.Text := '' ;
        end ;
      if not dblcdCCosto.Enabled then
        DMTE.cdsRegCxP.FieldByName('CCOSID').AsString := '' ;
   end ;
end;

procedure TFPagoProvRep.wwDBEdit1Change22(Sender: TObject);
begin
    wmodifica:=True;
end;
procedure TFPagoProvRep.FormDestroy(Sender: TObject);
begin
   cf1.Free ;
end;

procedure TFPagoProvRep.ActDetCaja;
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
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value / DMTE.cdsEgrCaja.Fieldbyname('ECTCAMB').Value ;
        end
        else
        begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value * DMTE.cdsEgrCaja.Fieldbyname('ECTCAMB').Value ;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value ;
        end ;
        DMTE.cdsRegCxP.Next;
      end ;
      DMTE.cdsRegCxP.First ;
      DMTE.cdsRegCxP.EnableControls ;
   end ;
   xTC := strtocurr( dbeTCambio.Text ) ;   
end;

procedure TFPagoProvRep.ActDetCxP ;
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

procedure TFPagoProvRep.ActualizaFiltro;
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

procedure TFPagoProvRep.AsignaCDSFiltro(cds: TwwClientDataset);
begin
   cdsFiltro := cds ;
end;

procedure TFPagoProvRep.ActualizaDetCanje;
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
      DMTE.cdsDetCanjeCxP.FieldByName('CIAID').Value    := DMTE.cdsDocPago.FieldByName('CIAID').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('PROV').Value     := DMTE.cdsDocPago.FieldByName('PROV').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('PROVRUC').Value  := DMTE.cdsDocPago.FieldByName('PROVRUC').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DOCID').Value    := DMTE.cdsDocPago.FieldByName('DOCID2').value;
      DMTE.cdsDetCanjeCxP.FieldByName('CPSERIE').Value  := DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('CPNODOC').Value  := DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('CPNOREG').Value  := DMTE.cdsDocPago.FieldByName('CPNOREG').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('TCANJEID').Value := '' ;
      DMTE.cdsDetCanjeCxP.FieldByName('CCPCANJE').Value := '' ;
      
      DMTE.cdsDetCanjeCxP.FieldByName('DOCID2').Value   := DMTE.cdsEgrCaja.FieldByName('DOCID').AsString;
      DMTE.cdsDetCanjeCxP.FieldByName('CPSERIE2').Value := 'REND';      
      DMTE.cdsDetCanjeCxP.FieldByName('CPNODOC2').Value := DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString;

      DMTE.cdsDetCanjeCxP.FieldByName('CCPFCJE').AsDateTime:= dbdtpFComp.Date ;
      DMTE.cdsDetCanjeCxP.FieldByName('TMONID').Value   := DMTE.cdsDocPago.FieldByName('TMONID').Value;

      If DMTE.cdsDocPago.FieldByName('TMONID').Value=DMTE.wTMonLoc then
      begin
         DMTE.cdsDetCanjeCxP.FieldByName('DCDMOLOC').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat,15,2);
         DMTE.cdsDetCanjeCxP.FieldByName('DCDMOEXT').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat/DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15,2);
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
      Raise Exception.create ('Falla en la grabación del 305') ;
   DMTE.cdsDetCanjeCxP.Close ;
end;

procedure TFPagoProvRep.dblcClaseExit(Sender: TObject);
var
  xSQL : string;
begin
   if z2bbtnCancel.Focused then exit;

   edtClase.text:= DMTE.DisplayDescripLocal(DMTE.cdsClaseAux,'CLAUXID',dblcClase.Text,'CLAUXDES') ;

   if edtClase.Text='' then begin
      dblcdAux.Text  := '' ;
      edtAuxRUC.Text := '' ;
      dbeGiradoA.Text:= '' ;
      ShowMessage('Error : Clase de Auxiliar');
      dblcClase.SetFocus;
      Exit;
   end;

   xSQL:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+'''';
   DMTE.cdsAux.Close;
   DMTE.cdsAux.DataRequest( xSQL ) ;
   DMTE.cdsAux.Open;
end;

procedure TFPagoProvRep.dblcdAuxExit(Sender: TObject);
var
   xSQL : String;
begin
   if dblcClase.Focused then  Exit ;
   if z2bbtnCancel.Focused then exit;
//   edtAuxRuc.text := DMTE.displaydescrip('prvTGE','CNT201','AUXRUC','AUXID='+quotedstr(dblcdAux.Text)+ ' AND CLAUXID='+quotedstr(dblcClase.Text),'AUXRUC');
   edtAuxRuc.text := DMTE.displaydescrip('prvTGE','CNT201','AUXRUC',' CLAUXID='+quotedstr(dblcClase.Text)+' AND AUXID='+quotedstr(dblcdAux.Text),'AUXRUC');

   if DMTE.RecuperarDatos('CNT201','AUXGIRA,AUXNOMB','CLAUXID='''+dblcClase.Text+''' AND AUXID='''+dblcdAux.Text+'''')  then
   begin
      try
         if (DMTE.cdsRec.FieldByName('AUXGIRA').Isnull) or (trim(DMTE.cdsRec.FieldByName('AUXGIRA').Asstring)='') then
            dbeGiradoA.Text := DMTE.cdsRec.FieldByName('AUXNOMB').Asstring
         else
            dbeGiradoA.Text := DMTE.cdsRec.FieldByName('AUXGIRA').Asstring;
      except
         dbeGiradoA.Text := ''  ;
      end ;
   end;

   xSQL:='select * from CAJA302 '
        +'where CIAID='''    + dblcCia.Text   +''' and '
        +      'CLAUXID='''  + dblcClase.Text +''' and '
        +      'PROV='''     + dblcdAux.Text  +''' and '
        +      'ECNOREPO Is Not Null and  '
        +      'ECESTADO=''C'' and '
        +      'FLAGVAR<>''S'' and '
        +      '(ECSALMN>0 or ECSALME>0)';

   DMTE.cdsECRepo.Close;
   DMTE.cdsECRepo.DataRequest( xSQL );
   DMTE.cdsECRepo.Open;
   TNumericField(DMTE.cdsECRepo.FieldbyName('ECMTOLOC')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsECRepo.FieldbyName('ECMTOEXT')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsECRepo.FieldbyName('ECSALMN')).displayFormat:= '###,###,##0.00';
   TNumericField(DMTE.cdsECRepo.FieldbyName('ECSALME')).displayFormat:= '###,###,##0.00';
   DMTE.cdsECRepo.EnableControls;
   dbgSelec.Enabled := True;
   dbgSelec.ReadOnly := False;
   dbgSelec.ApplySelected;
   dbgSelec.ReFreshDisplay;


{   DMTE.cdsECRepo.DisableControls;
   DMTE.cdsECRepo.First;
   while not DMTE.cdsECRepo.Eof do begin
      DMTE.cdsECRepo.Edit;
      DMTE.cdsECRepo.FieldByname('ECSALMN').AsFloat   :=DMTE.cdsECRepo.FieldByname('ECMTOLOC').AsFloat;
      DMTE.cdsECRepo.FieldByname('ECSALME').AsFloat   :=DMTE.cdsECRepo.FieldByname('ECMTOEXT').AsFloat;
      if (DMTE.cdsECRepo.FieldByname('TDIARIO2').AsString=dblcTDiario.Text) and
         (DMTE.cdsECRepo.FieldByname('ECANOMM2').AsString=edtPeriodo.Text ) and
         (DMTE.cdsECRepo.FieldByname('ECNOCOMP2').AsString=dbeNoComp.Text  ) then
         DMTE.cdsECRepo.FieldByname('FLAGVAR').Value:='S'
      else
         DMTE.cdsECRepo.FieldByname('FLAGVAR').Value:='N';
      DMTE.cdsECRepo.Next;
   end;
   DMTE.cdsECRepo.EnableControls ;}
end;

procedure TFPagoProvRep.dbgSelecDblClick(Sender: TObject);
begin
   if z2bbtnOK.Enabled = False then Exit;
   if (DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='I') or
              (DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='N') then
      Grid1;
end;

procedure TFPagoProvRep.dbgSelecCheckValue(Sender: TObject;
  PassesPictureTest: Boolean);
begin
//   Grid1;
end;

procedure TFPagoProvRep.dbgSelecKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//
end;

procedure TFPagoProvRep.dblcBancoExit(Sender: TObject);
begin
   if dblcCia.Focused   then Exit;

   edtBanco.text:= DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr,'BANCOID',dblcBanco.Text,'BANCOABR') ;

   if edtBanco.Text = '' then
   begin
      dblcBanco.Value := '';
      edtBanco.Text := '';
      dblcBanco.SetFocus;
      exit;
   end
   else
   begin
      dblcdCnp.Text  := '' ;
      dbeGlosa.Text := '' ;
      dblcTMon.Text := '' ;
      edtTMon.Text := '' ;
      dbeTCambio.Text := '' ;
      wBcoTipCta := DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').AsString;
      if DMTE.cdsbancoegr.FieldByName('BCOTIPCTA').Value='C' then
      begin //Si es CAJA
         dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco.text),'CCBCOVOUCH');
         dblcTMon.Enabled := True ;
         dblcTDiario.OnExit(dblcTDiario);
      end;
      wmodifica:=True;
   end;
end;

procedure TFPagoProvRep.dbgSelecColExit(Sender: TObject);
begin
//   Grid1;
end;

procedure TFPagoProvRep.Grid1;
begin
   DMTE.cdsECRepo.Edit;
   if DMTE.cdsECRepo.FieldByname('FLAGVAR' ).AsString='N' then
   begin
      DMTE.cdsECRepo.FieldByname('FLAGVAR' ).AsString :='S';
      DMTE.cdsECRepo.FieldByname('TDIARIO2' ).AsString:=dblcTDiario.Text;
      DMTE.cdsECRepo.FieldByname('ECANOMM2' ).AsString:=edtPeriodo.Text;
      DMTE.cdsECRepo.FieldByname('ECNOCOMP2').AsString:=dbeNoComp.Text;
   end
   else
   begin
      DMTE.cdsECRepo.FieldByname('FLAGVAR' ).AsString :='N';
      DMTE.cdsECRepo.FieldByname('TDIARIO2' ).AsString:='';
      DMTE.cdsECRepo.FieldByname('ECANOMM2' ).AsString:='';
      DMTE.cdsECRepo.FieldByname('ECNOCOMP2').AsString:='';
   end;
   z2bbtnSumatSelecClick(nil);
   SaldoPorRendir;
end;

procedure TFPagoProvRep.SaldoPorRendir;
var
   xTotalFF : Double;
begin
   if dblcTMon.Text=DMTE.wTMonLoc then begin
      xTotalFF:=xTotSelS-xTotDocS-xTotOtrS;
   end
   else begin
      xTotalFF:=xTotSelD-xTotDocD-xTotOtrD;
   end;

   xTotalFF:=xTotSelS-xTotDocS-xTotOtrS;
   xTotalFF:=xTotSelD-xTotDocD-xTotOtrD;
end;


function TFPagoProvRep.NumeroReposicion : String;
Var
   xTSalLoc, xTSalExt : DOUBLE;
   xRegAct : TBookMark;
begin
   Result:='';
   DMTE.cdsECRepo.DisableControls ;
  	DMTE.cdsECRepo.First ;
   while not DMTE.cdsECRepo.Eof do
   begin
      if DMTE.cdsECRepo.FieldByname('ECNOCOMP2').AsString<>'' then begin
         if (DMTE.cdsECRepo.FieldByname('ECSALMN').AsFloat>0) and (DMTE.cdsECRepo.FieldByname('FLAGVAR').AsString='S') then
         begin
            Result:=DMTE.cdsECRepo.FieldByname('ECNOREPO').AsString;
            Exit;
         end;
      end;
      DMTE.cdsECRepo.Next;
   end;
   DMTE.cdsECRepo.EnableControls ;

   if Length( Result )=0 then
      ShowMessage('Error : Documentos Cubren Monto a Pagar');
end;


procedure TFPagoProvRep.z2bbtnSumatDocPagoClick(Sender: TObject);
Var
   xTSalLoc, xTSalExt, xTPagLoc, xTPagExt : Real;
   xRegAct : TBookMark;
begin
   // Totales de Documentos pagados
   DMTE.cdsDocPago.DisableControls;
   xRegAct := DMTE.cdsDocPago.GetBookmark;
   xTSalLoc := 0; xTSalExt := 0; xTPagLoc := 0; xTPagExt := 0;
   DMTE.cdsDocPago.First ;
   while not DMTE.cdsDocPago.Eof do
   begin
      xTSalLoc := xTSalLoc + DMTE.cdsDocPago.FieldByName('DESALLOC').Value;
      xTSalExt := xTSalExt + DMTE.cdsDocPago.FieldByName('DESALEXT').Value;
      xTPagLoc := xTPagLoc + DMTE.cdsDocPago.FieldByName('DEMTOLOC').Value;
      xTPagExt := xTPagExt + DMTE.cdsDocPago.FieldByName('DEMTOEXT').Value;
      DMTE.cdsDocPago.Next;
   end;
   DMTE.cdsDocPago.GotoBookmark(xRegAct);
   DMTE.cdsDocPago.FreeBookmark(xRegAct);
   DMTE.cdsDocPago.EnableControls;

   dbgDocPago.ColumnByName('DESALLOC').FooterValue:=floattostrf(xTSalLoc, ffNumber, 10, 2);
   dbgDocPago.ColumnByName('DESALEXT').FooterValue:=floattostrf(xTSalExt, ffNumber, 10, 2);
   dbgDocPago.ColumnByName('DEMTOLOC').FooterValue:=floattostrf(xTPagLoc, ffNumber, 10, 2);
   dbgDocPago.ColumnByName('DEMTOEXT').FooterValue:=floattostrf(xTPagExt, ffNumber, 10, 2);
   xTotDocS := xTPagLoc;
   xTotDocD := xTPagExt;

end;


procedure TFPagoProvRep.CalcularSaldo;
Var
   xRegAct : TBookMark;
   bFlagDocPag,bFlagRegCxP,bFlagRegCxC : boolean;
begin
   DMTE.cdsECRepo.DisableControls ;
   DMTE.cdsECRepo.First;
   while not DMTE.cdsECRepo.Eof do
   begin
      DMTE.cdsECRepo.Edit;
      DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECMTOLOC').AsFloat, 15, 2 );
      DMTE.cdsECRepo.FieldByname('ECSALME').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECMTOEXT').AsFloat, 15, 2 );

      DMTE.cdsDocPago.DisableControls ;
      DMTE.cdsDocPago.First ;
      while not DMTE.cdsDocPago.Eof do
      begin
         if DMTE.cdsECRepo.FieldByname('ECNOREPO').AsString=DMTE.cdsDocPago.FieldByname('ECNOREPO').AsString then begin
//            DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALMN').Value-DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat, 15, 2 );
//            DMTE.cdsECRepo.FieldByname('ECSALME').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALME').Value-DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat, 15, 2 );
//            if dblcTMon.text= DMTE.wTmonLoc then
            DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALMN').Value-DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat, 15, 2 );
//            DMTE.cdsECRepo.FieldByname('ECSALME').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALME').Value-DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat*strtoFloat(dbeTCambio.text),15,2), 15, 2 );
            DMTE.cdsECRepo.FieldByname('ECSALME').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALME').Value-DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat, 15, 2 );
            if DMTE.cdsECRepo.FieldByname('ECSALMN').Value<0 then
               DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=0;

            if DMTE.cdsECRepo.FieldByname('ECSALME').Value<0 then
               DMTE.cdsECRepo.FieldByname('ECSALME').Value:=0;
         end;
         DMTE.cdsDocPago.Next;
      end;
      DMTE.cdsDocPago.EnableControls ;

      DMTE.cdsRegCxP.DisableControls ;
      DMTE.cdsRegCxP.First ;
      while not DMTE.cdsRegCxP.Eof do
      begin
         if DMTE.cdsECRepo.FieldByname('ECNOREPO').AsString=DMTE.cdsRegCxP.FieldByname('ECNOREPO').AsString then begin
//            DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALMN').Value-DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat, 15, 2 );
//            DMTE.cdsECRepo.FieldByname('ECSALME').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALME').Value-DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat, 15, 2 );
            DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALMN').Value-DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat, 15, 2 );
            DMTE.cdsECRepo.FieldByname('ECSALME').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALME').Value-DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat, 15, 2 );
            if DMTE.cdsECRepo.FieldByname('ECSALMN').Value<0 then
               DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=0;

            if DMTE.cdsECRepo.FieldByname('ECSALME').Value<0 then
               DMTE.cdsECRepo.FieldByname('ECSALME').Value:=0;

         end;
         DMTE.cdsRegCxP.Next;
      end;
      DMTE.cdsRegCxP.EnableControls ;

      DMTE.cdsRegCxC.DisableControls ;
      DMTE.cdsRegCxC.First ;
      while not DMTE.cdsRegCxC.Eof do
      begin
         if DMTE.cdsECRepo.FieldByname('ECNOREPO').AsString=DMTE.cdsRegCxC.FieldByname('ECNOREPO').AsString then begin
//            DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALMN').Value-DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat, 15, 2 );
//            DMTE.cdsECRepo.FieldByname('ECSALME').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALME').Value-DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat, 15, 2 );
            DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALMN').Value-DMTE.cdsRegCxC.FieldByName('DEMTOLOC').AsFloat, 15, 2 );
            DMTE.cdsECRepo.FieldByname('ECSALME').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALME').Value-DMTE.cdsRegCxC.FieldByName('DEMTOEXT').AsFloat, 15, 2 );
            if DMTE.cdsECRepo.FieldByname('ECSALMN').Value<0 then
               DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=0;

            if DMTE.cdsECRepo.FieldByname('ECSALME').Value<0 then
               DMTE.cdsECRepo.FieldByname('ECSALME').Value:=0;

         end;
         DMTE.cdsRegCxC.Next;
      end;
      DMTE.cdsRegCxC.EnableControls ;


      DMTE.cdsECRepo.Next;
   end;
   DMTE.cdsECRepo.EnableControls ;
end;

procedure TFPagoProvRep.dbeTCExit(Sender: TObject);
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

procedure TFPagoProvRep.dbeMPLExit(Sender: TObject);
var
   xSaldo,xMonto : double ;
begin
   DMTE.cdsDocPago.Edit ;

   if DMTE.cdsdocpago.FieldByName('TMONID').AsString = DMTE.wTMonExt then
   begin
      xMonto:=DMTE.FRound( DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat/DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
      xSaldo:=DMTE.cdsDocPago.fieldbyName('DESALEXT').asFloat;
   end
   else
   begin
      xMonto:=DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat;
      xSaldo:=DMTE.cdsDocPago.fieldbyName('DESALLOC').asFloat;
   end;

   if DMTE.FRoundwmc(xMonto ) > DMTE.FRoundwmc ( xSaldo ) then
   begin
      ShowMessage('Monto excede a Saldo Actual');
      DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat:=0;
   end
   else
   begin
      DMTE.cdsDocPago.fieldbyName('DEMTOEXT').asFloat:=DMTE.FRound( DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat/DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat,15,2);
      DMTE.cdsDocPago.fieldbyName('DEMTOORI').asFloat:=xMonto;
   end;

   z2bbtnSumatDocPagoclick(nil);
   z2bbtnSumatSelecClick(Nil);   
//   CalcularSaldo;
end;

procedure TFPagoProvRep.dbeMPEExit(Sender: TObject);
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

   if DMTE.FRoundwmc(xMonto ) > DMTE.FRoundwmc ( xSaldo ) then
   begin
      ShowMessage('Monto excede a Saldo Actual');
      DMTE.cdsDocPago.Edit;
      DMTE.cdsDocPago.FieldByName('DEMTOEXT').asFloat := 0 ;
   end
   else begin
      DMTE.cdsDocPago.FieldByName('DEMTOLOC').asFloat:=DMTE.FRound( DMTE.cdsDocPago.FieldByName('DEMTOEXT').asFloat * DMTE.cdsDocPago.FieldByName('DETCPAG').asFloat, 15, 2);
      DMTE.cdsDocPago.fieldbyName('DEMTOORI').asFloat:=xMonto;
   end;
   z2bbtnSumatDocPagoclick(nil);
   z2bbtnSumatSelecClick(Nil);
//   CalcularSaldo;
end;

procedure TFPagoProvRep.Z2bbtnLiquidaClick(Sender: TObject);
var
   xSQL, dFecha : String;
   x10 : Integer;
begin

   dFecha:=FormatDateTime( DMTE.wFormatFecha, dbdtpFComp.Date );

   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
   begin
   xSQL:='Select A.CIAID, A.CPTOID, B.CPTODES, A.TMONID, A.DEMTOORI, A.PROV, A.DOCID2, '
        +       'A.CPSERIE, A.CPNODOC, A.DETCPAG, C.CIADES, '
        +       DMTE.wRepFuncDate+''''+ dFecha +''') ECFCOMP '
        +'From CAJA303 A '
        +  'Left Join CXP201 B ON ( A.CIAID=B.CIAID AND A.CPTOID=B.CPTOID ) '
        +  'Left Join TGE101 C ON ( A.CIAID=C.CIAID ) '
        +'Where A.CIAID='''   +dblcCia.Text    +''' and '
        +      'A.ECANOMM=''' +edtPeriodo.Text +''' and '
        +      'A.TDIARID=''' +dblcTDiario.Text+''' and '
        +      'A.ECNOCOMP='''+dbeNoComp.Text  +''' '
        +'Union '
        +'Select A.CIAID, A.CPTOID, B.CPTODES, A.TMONID, A.DEMTOORI, A.PROV, A.DOCID2, '
        +       'A.CPSERIE, A.CPNODOC, A.DETCPAG, C.CIADES, '
        +       DMTE.wRepFuncDate+''''+ dFecha +''') ECFCOMP '
        +'From CAJA301 A '
        +  'Left Join CAJA201 B ON ( A.CPTOID=B.CPTOID ) '
        +  'Left Join TGE101 C ON ( A.CIAID=C.CIAID ) '
        +'Where A.CIAID='''   +dblcCia.Text    +''' and '
        +      'A.ECANOMM=''' +edtPeriodo.Text +''' and '
        +      'A.TDIARID=''' +dblcTDiario.Text+''' and '
        +      'A.ECNOCOMP='''+dbeNoComp.Text  +''' ';
   end;
   if DMTE.SRV_D = 'ORACLE' then
   begin
   xSQL:='Select A.*, C.CIADES, '
        +  DMTE.wRepFuncDate+''''+ dFecha +''') ECFCOMP '
        +'FROM '
        +  '('
        +    'Select A.CIAID, A.CPTOID, B.CPTODES, A.TMONID, A.DEMTOORI, A.PROV, A.DOCID2, '
        +       'A.CPSERIE, A.CPNODOC, A.DETCPAG '
        +    'From CAJA303 A, CXP201 B '
        +    'Where A.CIAID='''   +dblcCia.Text    +''' and '
        +          'A.ECANOMM=''' +edtPeriodo.Text +''' and '
        +          'A.TDIARID=''' +dblcTDiario.Text+''' and '
        +          'A.ECNOCOMP='''+dbeNoComp.Text  +''' and '
//        +          'A.CPTOID=B.CPTOID AND '
        +          'A.CPTOID=B.CPTOID(+) '
        +    'Union '
        +    'Select A.CIAID, A.CPTOID, B.CPTODES, A.TMONID, A.DEMTOORI, A.PROV, A.DOCID2, '
        +       'A.CPSERIE, A.CPNODOC, A.DETCPAG '
        +    'From CAJA301 A, CAJA201 B '
        +    'Where A.CIAID='''   +dblcCia.Text    +''' and '
        +          'A.ECANOMM=''' +edtPeriodo.Text +''' and '
        +          'A.TDIARID=''' +dblcTDiario.Text+''' and '
        +          'A.ECNOCOMP='''+dbeNoComp.Text  +''' and '
        +          'A.CPTOID=B.CPTOID(+)  '
        +  ') A, TGE101 C '
        +'Where A.CIAID=C.CIAID ';
   end;
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;


   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
   begin
   xSQL:='Select A.CIAID, A.CPTOID, B.CPTODES, A.CUENTAID, C.CIADES, '
        +       'SUM( A.DEMTOORI ) DEMTOORI, '+DMTE.wRepFuncDate+''''+ dFecha +''') ECFCOMP '
        +    'From CAJA303 A '
        +    'Left Join CXP201 B ON ( A.CIAID=B.CIAID AND A.CPTOID=B.CPTOID ) '
        +    'Left Join TGE101 C ON ( A.CIAID=C.CIAID ) '
        +    'Where A.CIAID='''   +dblcCia.Text    +''' and '
        +          'A.ECANOMM=''' +edtPeriodo.Text +''' and '
        +          'A.TDIARID=''' +dblcTDiario.Text+''' and '
        +          'A.ECNOCOMP='''+dbeNoComp.Text  +''' '
        +'GROUP BY A.CIAID, C.CIADES, A.CPTOID, B.CPTODES, A.CUENTAID '

        +'Union '

        +'Select A.CIAID, A.CPTOID, B.CPTODES, A.CUENTAID, C.CIADES, '
        +       'SUM( A.DEMTOORI ) DEMTOORI, '+DMTE.wRepFuncDate+''''+ dFecha +''') ECFCOMP '
        +'From CAJA301 A '
        +  'Left Join CAJA201 B ON ( A.CPTOID=B.CPTOID ) '
        +  'Left Join TGE101 C ON ( A.CIAID=C.CIAID ) '
        +'Where A.CIAID='''   +dblcCia.Text    +''' and '
        +      'A.ECANOMM=''' +edtPeriodo.Text +''' and '
        +      'A.TDIARID=''' +dblcTDiario.Text+''' and '
        +      'A.ECNOCOMP='''+dbeNoComp.Text  +''' '
        +'GROUP BY A.CIAID, C.CIADES, A.CPTOID, B.CPTODES, A.CUENTAID '
   end;
   if DMTE.SRV_D = 'ORACLE' then
   begin
   xSQL:='Select A.CIAID, A.CPTOID, A.CPTODES, A.CUENTAID, MAX(C.CIADES) CIADES, '
        +   'SUM( A.DEMTOORI ) DEMTOORI, '+  DMTE.wRepFuncDate+''''+ dFecha +''') ECFCOMP '
        +'FROM '
        +  '('
        +    'Select A.CIAID, A.CPTOID, B.CPTODES, A.TMONID, A.DEMTOORI, A.PROV, A.DOCID2, '
        +       'A.CPSERIE, A.CPNODOC, A.DETCPAG, A.CUENTAID '
        +    'From CAJA303 A, CXP201 B '
        +    'Where A.CIAID='''   +dblcCia.Text    +''' and '
        +          'A.ECANOMM=''' +edtPeriodo.Text +''' and '
        +          'A.TDIARID=''' +dblcTDiario.Text+''' and '
        +          'A.ECNOCOMP='''+dbeNoComp.Text  +''' and '
//        +          'A.CIAID=B.CIAID(+) AND A.CPTOID=B.CPTOID(+) '
        +          ' A.CPTOID=B.CPTOID(+) '
        +    'Union '
        +    'Select A.CIAID, A.CPTOID, B.CPTODES, A.TMONID, A.DEMTOORI, A.PROV, A.DOCID2, '
        +       'A.CPSERIE, A.CPNODOC, A.DETCPAG, A.CUENTAID '
        +    'From CAJA301 A, CAJA201 B '
        +    'Where A.CIAID='''   +dblcCia.Text    +''' and '
        +          'A.ECANOMM=''' +edtPeriodo.Text +''' and '
        +          'A.TDIARID=''' +dblcTDiario.Text+''' and '
        +          'A.ECNOCOMP='''+dbeNoComp.Text  +''' and '
        +          'A.CPTOID=B.CPTOID(+)  '
        +  ') A, TGE101 C '
        +'Where A.CIAID=C.CIAID '
        +'GROUP BY A.CIAID, A.CPTOID, A.CPTODES, A.CUENTAID';
   end;
   
   DMTE.cdsQry3.Close;
   DMTE.cdsQry3.DataRequest( xSQL );
   DMTE.cdsQry3.Open;

   pprLiqP.TEMPLATE.FileName:= wRutaRpt + '\ReposicionCaja.rtm';
   pprLiqP.template.LoadFromFile ;

   ppdbLiq.dataSource :=DMTE.dsQry;
   ppdbLiqD.dataSource:=DMTE.dsQry3;

   pprLiqp.Print;
   pprLiqp.Stop;

   x10:=DMTE.ComponentCount-1;
   while x10>0 do begin
     if DMTE.components[x10].classname='TppGroup' then begin
        DMTE.components[x10].free;
     end;
     x10:=x10-1;
   end;

   ppGroupHeaderBand1.Free;
   ppGroupFooterBand1.Free;
   ppGroupHeaderBand2.Free;
   ppGroupFooterBand2.Free;


   ppdbLiq.dataSource :=nil;
   ppdbLiqD.dataSource:=nil;

end;

procedure TFPagoProvRep.dblcTDoc2Enter(Sender: TObject);
begin
   dbeSerie.Enabled :=False;
   dbeNoDoc2.Enabled:=False;
end;

procedure TFPagoProvRep.Z2dbgDetPagoIButtonClick(Sender: TObject);
begin
  pnlActualizaIng.BringToFront;
  pnlActualizaIng.Top:= 190;
  pnlActualizaIng.Left:=221;
  pnlActualizaIng.Visible:= True;
  IniciaPanelIng;
  adicionaRegistro;

end;

procedure TFPagoProvRep.IniciaPanelIng;
begin
     dblcdCnp22.Text     := '';
     edtCuenta2Ing.Text     := '';
     dblcdCCostoIng.Text    := '';
     dbeDHIng.Text          := '';
     dblcTMonIng.Text      := '';
     edtTMonIng.Text       := '';
     dbeImporteIng.Text    := '';
     dbeTCamPrIng.Text      := '';
     edtMtoLocIng.Text      := '';
     edtMtoExtIng.Text      := '';

     edtCnp2Ing.Text        := '';
     edtCnp2Ing.Text        := '';
     dbeAuxDetIng.Text      := '';
end;

Procedure TFPagoProvRep.AdicionaRegistro;
var
	 aux,xWhere,xTDoc,xNDoc,xSQL,xSerie,xBanco,xNoRepo : string;
   xLength : integer;
begin
	 BlanqueaEdits ( pnlActualizaIng );
   xNoRepo:=NumeroReposicion;

   dbeNoRegIng.Text:='';

   if DMTE.cdsRegCxC.RecordCount=0 then
   begin
      xTDoc:= DMTE.displaydescrip('prvTGE','TGE110','DOCID,DOCLENGTH','DOCMOD=''CAJA'' AND (FCING=''1'' OR FCING=''S'') AND DOCRECCAJ=''S'' ' ,'DOCID');

      xSQL := '';
      xLength := 8;
      if DMTE.cdsQry.fieldbyname('DOCLENGTH').AsInteger>0 then
         xLength := DMTE.cdsQry.fieldbyname('DOCLENGTH').AsInteger;
      if (DMTE.SRV_D = 'DB2400') then
         xSQL:=' select INT( MAX(CCNODOC) )+1 NUMERO FROM CXC303 ';
      if (DMTE.SRV_D = 'DB2NT') then
         xSQL:=' select INT( MAX(CCNODOC) )+1 NUMERO FROM CXC303 ';
      if (DMTE.SRV_D = 'ORACLE') then
         xSQL:=' select MAX(TO_NUMBER(CCNODOC))+1 NUMERO FROM CXC303 ';

      xSQL := xSQL+' where CIAID='+QuotedStr(dblcCia.text)+' AND DOCID='+QuotedStr(xTDoc);
      DMTE.cdsQry2.Close;
      DMTE.cdsQry2.DataRequest(xsql);
      DMTE.cdsQry2.open;
      if DMTE.cdsQry.fieldbyname('DOCLENGTH').AsInteger>0 then
         if DMTE.cdsQry2.fieldbyname('NUMERO').IsNull then
            xNDoc :=  DMTE.StrZero('1',xLength)
         else
            xNDoc :=  DMTE.StrZero(DMTE.cdsQry2.fieldbyname('NUMERO').AsString,xLength)
      else
            xNDoc :=  DMTE.StrZero('1',xLength);
   end
   else
   begin
      xTDoc  := DMTE.cdsIngDocs.FieldbyName('DOCID').AsString    ;
      xSerie := DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString  ;
      xNDoc  := DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString  ;
   end;

   DMTE.cdsRegCxC.Insert;

   if DMTE.cdsIngDocs.RecordCount=0 then
   begin
      xSerie:='CAJA';
      DMTE.cdsIngDocs.Insert;
      DMTE.cdsIngDocs.FieldbyName('CIAID').AsString     := dblcCia.Text;

 //     xBanco := DMTE.displaydescrip('prvTGE','TGE105','BANCOID','BCOTIPCTA='+quotedstr('S'),'BANCOID');

//    	DMTE.cdsIngDocs.FieldbyName('BANCOID').AsString   := xBanco;
    	DMTE.cdsIngDocs.FieldbyName('BANCOID').AsString   := dblcBanco.Text ;       
      DMTE.cdsIngDocs.FieldbyName('CCFEMIS').AsDateTime := dbdtpFComp.Date;
      DMTE.cdsIngDocs.FieldbyName('DOCID').AsString     := xTDoc;
      DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString   := trim( xSerie);
      DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString   := trim( xNDoc);
      DMTE.cdsIngDocs.fieldbyName('NCOESTADO').AsString := 'X';

      DMTE.cdsIngDocs.fieldbyName('ECANOMM').AsString   := DMTE.cdsEgrCaja.fieldbyName('ECANOMM').AsString;
      DMTE.cdsIngDocs.fieldbyName('TDIARID').AsString   := DMTE.cdsEgrCaja.fieldbyName('TDIARID').AsString;
      DMTE.cdsIngDocs.fieldbyName('ECNOCOMP2').AsString  := DMTE.cdsEgrCaja.fieldbyName('ECNOCOMP').AsString;

      cdspost(DMTE.cdsIngDocs);
      xSQL:='Select * from CXC303 '
           +'Where CIAID='''
             +dblcCia.Text  +''' and '
           +      'DOCID='''   +xTDOC +''' and '
           +      'CCSERIE=''' +xSerie +''' and '
           +      'CCNODOC=''' +xNDoc+''' ';
      DMTE.cdsIngDocs.DataRequest( xSQL );
      DMTE.AplicaDatos( DMTE.cdsIngDocs, 'INGDOCS' );
   end;

   DMTE.cdsRegCxC.fieldbyname('CPNOREG').AsString := DMTE.strzero(GeneraCorrelativo( DMTE.cdsRegCxC , 'CPNOREG' ), 10);
   DMTE.cdsRegCxC.fieldbyname('CIAID').AsString     := dblcCia.Text;
   DMTE.cdsRegCxC.fieldBYName('CCTREC').AsString   := 'NP';
   DMTE.cdsRegCxC.fieldbyname('DOCID2').AsString    := xTDoc;
   DMTE.cdsRegCxC.fieldbyname('CPSERIE').AsString   := 'CAJA';
   DMTE.cdsRegCxC.fieldbyname('CPNODOC').AsString   := xNDoc;
   DMTE.cdsRegCxC.fieldbyName('TMONID').AsString    := dblcTMon.Text;
   DMTE.cdsRegCxC.FieldbyName('CPTOID').AsString    := dblcdCnp.Text;
   DMTE.cdsRegCxC.FieldbyName('ECNOREPO').AsString  := xNoRepo;

   edtTMon2.Text  := edtTMon.Text;
   DMTE.cdsRegCxC.fieldbyName('DETCDOC').AsFloat    := strtoFloat(dbeTCambio.Text);
   DMTE.cdsRegCxC.fieldbyName('DETCPAG').AsFloat    := strtoFloat(dbeTCambio.Text);
   DMTE.cdsRegCxC.fieldbyname('DEDH').AsString      := 'H';     //Inicializo en haber
   xWhere:='FECHA='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date) +''')';
   aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
   DMTE.cdsRegCxC.fieldbyname('DEANO').AsString  := DMTE.cdsqry.FieldByName('FecAno').AsString;
   DMTE.cdsRegCxC.fieldbyname('DEMM').AsString   := DMTE.cdsqry.FieldByName('FecMes').AsString;
   DMTE.cdsRegCxC.fieldbyname('DEDD').AsString   := DMTE.cdsqry.FieldByName('FecDia').AsString;
   DMTE.cdsRegCxC.fieldbyname('DESS').AsString   := DMTE.cdsqry.FieldByName('FecSS').AsString;
   DMTE.cdsRegCxC.fieldbyname('DESEM').AsString  := DMTE.cdsqry.FieldByName('FecSem').AsString;
   DMTE.cdsRegCxC.fieldbyname('DETRI').AsString  := DMTE.cdsqry.FieldByName('FecTrim').AsString;
   DMTE.cdsRegCxC.fieldbyname('DEAASS').AsString := DMTE.cdsqry.FieldByName('FecAASS').AsString;
   DMTE.cdsRegCxC.fieldbyname('DEAASEM').AsString:= DMTE.cdsqry.FieldByName('FecAASem').AsString;
   DMTE.cdsRegCxC.fieldbyname('DEAATRI').AsString:= DMTE.cdsqry.FieldByName('FecAATri').AsString;


   dbeNoRegIng.Enabled     := True;
   dblcClaseDetIng.Enabled := False;
   dblcdAuxDetIng.Enabled  := False;
   dblcdCCostoIng.Enabled  := False;

   pnlActualizaIng.SetFocus;
   perform(CM_DialogKey,VK_TAB,0);
end;



procedure TFPagoProvRep.dbeNoRegIngExit(Sender: TObject);
begin
   if not Z2bbtnCancelDet.Focused then
   begin
      dbeNoRegIng.Text:=DMTE.strzero(dbeNoRegIng.Text,10);
      if strtoint(dbeNoRegIng.Text) = 0 then
      begin     // NoRegistro
         dbeNoRegIng.Text:='';
         ShowMessage('No es valido el No Registro');
         dbeNoRegIng.SetFocus;
         exit;
      end;
      DMTE.cdsRegCxC.FieldByName('CPNOREG').AsString  := dbeNoRegIng.Text;
   end

end;

procedure TFPagoProvRep.dblcdCnp22Exit(Sender: TObject);
var
    xDescrip : String;
    xwhere, sTmp : string ;    
begin
  //** 2002/04/25 - pjsv
  If Z2bbtnCancelDet.Focused then exit;
  //**
  xDescrip:= 'CPTOID='+quotedstr(dblcdCnp22.text);
  sTmp := DMTE.DisplayDEscrip('prvTGE','CAJA201','CPTODES, CUENTAID',xDescrip,'CPTODES');
  If (sTmp = '') then
  begin
    showmessage('No se encuentra registrado el concepto');
    dblcdCnp22.Text := ''; dblcdCnp22.setfocus;
  end
  else
  begin
    edtCnp2Ing.Text := sTmp;
    if Trim(edtCnp2Ing.Text) = '' then
    begin
      DMTE.cdsRegCxC.FieldByName('CUENTAID').AsString := '' ;
      dblcdAuxDetIng.Enabled := False ;
      dblcdCCostoIng.Enabled := False ;
      dbeAuxDetIng.text :='';
    end
    else
    begin
       DMTE.cdsRegCxC.FieldByName('CUENTAID').AsString := DMTE.cdsQry.fieldbyName('CUENTAID').asString;
       //Busca y Habilita
       xWhere:='CIAID='''+dblccia.Text+''' AND CUENTAID='''+DMTE.cdsRegCxC.FieldByName('CUENTAID').AsString+'''';
       if Length(DMTE.DisplayDescrip('prvTGE','TGE202','CUENTAID, CTA_CCOS, CTA_AUX',xWhere,'CuentaId'))>0 then
       begin
          if (DMTE.cdsQry.fieldbyname('CTA_CCOS').AsString='S') then
          begin
             xDescrip := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
             DMTE.cdsCCosto.Close;
             DMTE.cdsCCosto.DataRequest(xDescrip);
             DMTE.cdsCCosto.open;
             dblcdCCostoIng.Enabled:=True;
             dblcdCCostoIng.SetFocus;
          end
          else
             dblcdCCostoIng.Enabled := False ;

          if DMTE.cdsQry.fieldbyName('CTA_AUX').asString = 'S'
          then dblcdAuxDetIng.Enabled := True
          else dblcdAuxDetIng.Enabled := False ;
        end
     end;
     dblcClaseDetIng.Enabled :=  dblcdAuxDetIng.Enabled   ;

     if dblcClaseDetIng.Enabled then dblcClaseDetIng.SetFocus;

     if trim(edtCnp2Ing.Text) <> '' then
     begin
        if not dblcdAuxDetIng.Enabled then
        begin
           DMTE.cdsRegCxC.FieldByName('PROV').AsString    := '' ;
           DMTE.cdsRegCxC.FieldByName('CLAUXID').AsString := '' ;
           edtClaseDetIng.Text  := '' ;
           dbeAuxDetIng.Text := '' ;
        end
        else begin
           DMTE.cdsRegCxC.FieldByName('PROV').AsString    := DMTE.cdsAux.fieldbyname('AUXID').AsString;
           DMTE.cdsRegCxC.FieldByName('CLAUXID').AsString := DMTE.cdsClaseAux.fieldbyname('CLAUXID').AsString;
           edtClaseDetIng.Text:= edtClase.text;
           xdescrip := 'CLAUXID='''+DMTE.cdsRegCxC.FieldByName('CLAUXID').AsString+''' AND  AUXID='+quotedstr(dblcdAuxDet.text);
           dbeAuxDetIng.text := DMTE.displaydescrip('prvTGE','CNT201','AUXNOMB',xDescrip,'AUXNOMB');
        end;

        if not dblcdCCostoIng.Enabled then
          DMTE.cdsRegCxC.FieldByName('CCOSID').AsString := '' ;
     end;
   end;

end;

procedure TFPagoProvRep.dblcClaseDetIngExit(Sender: TObject);
var
   xDescrip : string;
begin
   xDescrip := 'CLAUXID='+quotedstr(dblcClaseDetIng.text);
   edtClaseDetIng.text := DMTE.displaydescrip('prvTGE','TGE102','CLAUXDES',xDescrip,'CLAUXDES');
   dblcdAuxDetIng.Enabled := True;
   wModifica := TRUE;

end;

procedure TFPagoProvRep.dblcdAuxDetIngExit(Sender: TObject);
var
   xDescrip : string;
begin
 xdescrip := 'AUXID='+quotedstr(dblcdAuxDetIng.text);
 dbeAuxDetIng.text := DMTE.displaydescrip('prvTGE','CNT201','AUXNOMB',xDescrip,'AUXNOMB');
 wModifica := True;

end;

procedure TFPagoProvRep.dblcTMonIngExit(Sender: TObject);
var
  xDescrip : string;
begin
   xDescrip :='TMONID='+''''+dblcTMonIng.Text+'''';
   edtTMonIng.Text :=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xDescrip,'TMONDES');

end;

procedure TFPagoProvRep.dbeDHIngChange(Sender: TObject);
begin
   if not ((dbeDHIng.Text='D') or (dbeDHIng.Text='H') or (length(dbeDHIng.Text)=0)) then
      dbeDHIng.Text:='';

end;

procedure TFPagoProvRep.dbeImporteIngExit(Sender: TObject);
begin
   if  Z2bbtnCanceldet.Focused then  exit;
   DMTE.cdsRegCxC.fieldbyname('DEMTOORI').AsString := dbeImporteIng.Text;
   if dblcTMon.Text = DMTE.wTMonLoc then
   begin
      DMTE.cdsRegCxC.fieldbyname('DEMTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.fieldbyname('DEMTOORI').AsFloat));
      DMTE.cdsRegCxC.fieldbyname('DEMTOEXT').AsString := Cajadec(Currtostr(DMTE.cdsRegCxC.fieldbyname('DEMTOORI').AsFloat / strtocurr( dbeTCambio.text )));
   end
   else
   begin
      DMTE.cdsRegCxC.fieldbyname('DEMTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.fieldbyname('DEMTOORI').AsFloat * strtocurr( dbeTCambio.text )));
      DMTE.cdsRegCxC.fieldbyname('DEMTOEXT').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.fieldbyname('DEMTOORI').AsFloat ));
   end;

end;

procedure TFPagoProvRep.Z2bbtnOKDetClick(Sender: TObject);
begin
   // VALIDA LA CUENTA DEL CONCEPTO
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,dblcdCnp22.text,'')) and (dblcTMonIng.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+DMTE.cdsQry.FieldByName('CUENTAID').AsString+' del Concepto '+dblcdCnp22.text+' Se registra sólo en Moneda Extranjera.');
   end;

   if DMTE.cdsRegCxC.State=dsInsert then
      if EncuentraDuplicado(DMTE.cdsRegCxC,'CPNoReg',dbeNoRegIng.Text) then
      begin
         ShowMessage('Numero de Registro duplicado');
         dbeNoRegIng.SetFocus;
         exit;
      end;

      DMTE.cdsRegCxC.fieldbyname('DENUMREG').AsString := DMTE.cdsRegCxC.fieldbyname('CPNODOC').AsString;
      DMTE.cdsRegCxC.fieldbyname('DEDH').AsString := dbeDHIng.text;

      DMTE.cdsRegCxC.fieldbyname('CPTOID').AsString := dblcdCnp22.text;
      DMTE.cdsRegCxC.fieldbyname('CCOSID').AsString := dblcdCCostoIng.text;
      DMTE.cdsRegCxC.fieldbyname('TMONID').AsString := dblcTMonIng.text;
      DMTE.cdsRegCxC.fieldbyname('CPFEMIS').AsDateTime := dbdtpFComp.Date;


      if not dblcdAuxDetIng.Enabled then
      begin
         DMTE.cdsRegCxC.FieldByName('PROV').AsString    := '';
         DMTE.cdsRegCxC.FieldByName('CLAUXID').AsString := '';
         edtClaseDetIng.Text  := '';
         dbeAuxDetIng.Text := '';
      end
      else
      begin
        DMTE.CdsRegCxC.FieldByName('CLAUXID').AsString := dblcClaseDetIng.Text;
        DMTE.CdsRegCxC.FieldByName('PROV').AsString := dblcdAuxDetIng.Text;
      end;

   if not ValidaCampoIng then
      ShowMessage('No se puede grabar')
   else
   begin
      cdsPost( DMTE.cdsRegCxC );
      DMTE.cdsRegCxC.Post;
      wModifica:=True;

      if not dbeNoRegIng.Enabled then
      begin
         pnlActualizaIng.SetFocus;
         PnlActualizaIng.Visible := False;
         pnlBotones.Enabled   := True;
         SumaDetIng;    // Al salir hay que totalizar
         z2bbtnSumatSelecClick(Nil);
      end
      else
      begin
         adicionaRegistro;

      end;
      //
   end;

end;

function TFPagoProvRep.ValidaCampoIng:Boolean;
var
   xWhere,
   aux :string;
begin
     Result:=True;
     with DMTE do begin
        if length(cdsRegCxC.FieldByname('CPNOREG').AsString)=0 then begin  //No Registro
           ShowMessage('Falta No Registro');
           dbeNoRegIng.SetFocus;
           Result:=False;
           exit;
        end
        else begin
           if length(cdsRegCxC.FieldByname('CPNOREG').AsString)<6 then
            begin
              ShowMessage('Codigo de Registro Errado');
              dbeNoRegIng.SetFocus;
              Result:=False;
              exit;
            end;
        end;

        if cdsRegCxC.FieldByname('DEMTOORI').AsFloat<=0 Then begin   //Importe
           ShowMessage('Importe debe ser mayor que cero');
           dbeImporteIng.SetFocus;
           Result:=False;
           exit;
        end;

        if cdsRegCxC.FieldByname('CPTOID').AsString='' then begin      //Concepto
           ShowMessage('Falta Concepto');
           dblcdCnp22.SetFocus;
           Result:=False;
           exit;
        end
        else begin                             // Cuenta
           aux:= DMTE.cdsRegCxC.FieldByname('CUENTAID').AsString;
           if length(aux)=0 then begin
              ShowMessage('Codigo de Concepto Errado');
              dblcdCnp22.SetFocus;
              Result:=False;
              exit;
           end;
        end;

        //Validación de centro de costo y auxiliares
        if (dblcdCCostoIng.Enabled) then
        begin  //Centro de Costo
          IF (length(cdsRegCxC.fieldbyname('CCOSID').AsString)=0) THEN
          BEGIN
              ShowMessage('Falta Centro de Costo');
              dblcdCCostoIng.SetFocus;
              Result:=False;
              exit;
          END
          else
          begin
           xWhere:='CCosID='+''''+cdsRegCxC.fieldbyname('CCOSID').AsString+'''';
           aux   :=DisplayDescrip('prvTGE','TGE203','CCOSDES',xWhere,'CCosDes');
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Centro de Costo Errado');
              dblcdCCostoIng.SetFocus;
              Result:=False;
              exit;
           end;
          end;
        end;

        if (dblcClaseDetIng.Enabled) then
        begin

          IF trim( dblcClaseDetIng.Text ) = '' THEN
          BEGIN
              ShowMessage('Ingrese Clase de Auxiliar');
              dblcClaseDetIng.SetFocus;
              Result:=False;
              exit;
          END;

          IF trim( dblcdAuxDetIng.Text ) = '' THEN
          begin
              ShowMessage('Ingrese Auxiliar');
              dblcdAuxDetIng.SetFocus;
              Result:=False;
              exit;
          END

        end;

//fin de validaciones

        if length(cdsRegCxC.fieldbyname('DEDH').AsString)=0 then
         begin
           ShowMessage('Falta especificar Debe / Haber');
           dbeDHIng.SetFocus;
           Result:=False;
           exit;
         end;
    end; {DMTE}
end;


procedure TFPagoProvRep.Z2bbtnAdicFPagoClick(Sender: TObject);
begin
   if DMTE.cdsRegCxC.RecordCount=0 then
      raise exception.Create('Ingrese Detalle de Ingresos');

   pnlDetPago.Enabled  := False;
   pnlBotones.Enabled  := False;
   PnlFPago.BringToFront;
   BlanqueaEdits(pnlFPago);
   PnlFPago.Left:=175;
   PnlFPago.Top :=212;
   PnlFPago.Visible:= True;
   PnlFpago.setfocus;
   perform(CM_DialogKey,VK_TAB,0);
   Inserta;
end;

procedure TFPagoProvRep.Inserta;
begin
   DMTE.cdsDetFPago.Insert;
   DMTE.cdsDetFPago.FieldByName('CORRE').AsInteger := DMTE.cdsDetFPago.recno;
   DMTE.cdsDetFPago.FieldByName('CPNOREG').AsString := DMTE.cdsRegCxC.fieldbyname('CPNOREG').AsString;   
   if DMTE.cdsDetFPago.recordcount = 0 then
     if DMTE.wTMonLoc = trim(dblcTMon.Text) then
        dbeRecibido.Text := dbgDetPago.columnbyname('DEMTOLOC').FooterValue
     else
        dbeRecibido.Text := dbgDetPago.columnbyname('DEMTOORI').FooterValue;

   dblcTMonC.text       := dblcTMon.Text;
   edtTMonC.Text        := edtTMon.Text;
   dbeRecibido.Enabled  := True;
   dbeACobrar.Enabled   := False;
   CalculaResto;

   If StrToFloat(dbeResta.text) <= 0 then
      bbtnCancFPagoClick(self)
   else
      dblcFormPago.SetFocus ;
end;

procedure TFPagoProvRep.CalculaResto;
var
    xCampo1, xtc1  ,
    xCampo2, xtc2  : string;

begin
    if DMTE.cdsDetFPago.State = dsedit then
    begin
        if dblcTMonC.Text = DMTE.wTMonLoc then
        begin
           xCampo1 := 'DEMTOLOC';
           xCampo2 := 'FC_MTOLOC';
        end
        else
        begin
           xCampo1 := 'DEMTOEXT';
           xCampo2 := 'FC_MTOEXT';
        end;
        dbeResta.Text        := currtostr ( strtocurr( trim(dbgDetPago.ColumnByName(xCampo1).FooterValue)) -
                                   strtocurr( trim(dbgDetFPago.ColumnByName(xCampo2).FooterValue)) +
                                   DMTE.cdsdetfpago.fieldbyname('FC_RECIBIDO').AsFloat );
    end
    else
       if DMTE.cdsDetFPago.State = dsInsert then
       begin
           if dblcTMonC.Text = DMTE.wTMonLoc then
           begin
              xCampo1 := 'DEMTOLOC';
              xCampo2 := 'FC_MTOLOC';
           end
           else
           begin
              xCampo1 := 'DEMTOEXT';
              xCampo2 := 'FC_MTOEXT';
           end;
           try
              xtc1:=dbgDetPago.ColumnByName(xCampo1).FooterValue;
              if trim(xtc1)='' then
                 xtc1:='0';
              xtc2:=dbgDetFPago.ColumnByName(xCampo2).FooterValue;
              if trim(xtc2)='' then
                 xtc2:='0';

             dbeResta.Text:=currtostr( strtocurr( trim( xtc1 ) ) -
                            strtocurr( trim( xtc2 ) ) );
           except
             dbeResta.Text := currtostr ( strtocurr( trim( xtc1 ) ));
           end;
       end;

end;



procedure TFPagoProvRep.dblcFormPagoExit(Sender: TObject);
var
  xDescrip : string;
begin
   if bbtnCancFPago.Focused then exit;
   
   xDescrip := 'FPAGOID='+quotedstr(dblcFormPago.text);
   edtFormPago.text := DMTE.DisplayDescrip('prvTGE','TGE112','FPAGODES',xDescrip,'FPAGODES');
    if (trim(edtFormPago.text) <> '' ) then
     begin
      if dblcFormPago.text = DMTE.wEFECTIVO then
        begin
           DesHabilitaControles([dblcBancofPago,dblcTarjeta,dbeNOChq]);
           dblcBancofPago.Text   := '';
           edtBcoFPago.text    := '';
           dblcTarjeta.text := '';
           edtTarjeta.text  := '';
           dbeNOChq.Text    := '';
        end
      else
       if dblcFormPago.text = DMTE.wCHEQUE then
        begin
         cajautil.HabilitaControles ([dbeNOChq,dblcBancofPago]);
         dblcTarjeta.text := '';
         edtTarjeta.text  := '';
         dblcBancofPago.SetFocus;
        end
       else
        if dblcFormPago.text = DMTE.wTARJETA then
         begin
          cajautil.HabilitaControles ([dbeNOChq,dblcBancofPago,dblcTarjeta]);
          dblcBancofPago.SetFocus;
         end;
     end;

end;

procedure TFPagoProvRep.dblcFormPagoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;

end;

procedure TFPagoProvRep.dblcBancoFPagoExit(Sender: TObject);
var
  xdescrip : string;
begin
   if bbtnCancFPago.Focused then exit;

   xdescrip := 'BANCOID='+quotedstr(dblcBancoFPago.text);
   edtBcoFPago.text := DMTE.displaydescrip('prvTGE','TGE105','BANCONOM',xDescrip,'BANCONOM');
   If dblcBancofPago.text = '' then
    begin
     showmessage('Falta Banco');
     dblcBancofPago.SetFocus;
    end;

end;

procedure TFPagoProvRep.dblcBancoFPagoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;

end;

procedure TFPagoProvRep.dblcTarjetaExit(Sender: TObject);
var
  xDescrip : string;
begin
   if bbtnCancFPago.Focused then exit;

   xDescrip := 'TJAID='+quotedstr(dblcTarjeta.text);
   edtTarjeta.text := DMTE.displaydescrip('prvTGE','TGE167','TJADES',xDescrip,'TJADES');
   If dblcTarjeta.text = '' then
    begin
     showmessage('Falta Tarjeta');
     dblcTarjeta.SetFocus;
    end;

end;

procedure TFPagoProvRep.dblcTarjetaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;

end;

procedure TFPagoProvRep.dblcTMonCExit(Sender: TObject);
var
   xDescrip : string;
begin
   if bbtnCancFPago.Focused then exit;

   xDescrip := 'TMONID='+quotedstr(dblcTMonC.text);
   edtTMonC.text := DMTE.displaydescrip('prvTGE','TGE103','TMONABR',xDescrip,'TMONABR');
   If edtTMonC.text = '' then
    begin
     showmessage('Falta Moneda');
     dblcTMonC.SetFocus;
    end
   else
    if self.ActiveControl <> TWinControl(Sender) then
     CalculaResto;

end;

procedure TFPagoProvRep.dblcTMonCNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;

end;

procedure TFPagoProvRep.dbdtpFecVencExit(Sender: TObject);
begin
  if dbdtpFecVenc.date < dbdtpFecEmi.date then
  begin
    showmessage('La Fecha de Vencimiento no puede ser menor a la Fecha de Emisión');
    dbdtpFecVenc.setfocus;
    Exit;
  end;

end;

procedure TFPagoProvRep.dbeRecibidoChange(Sender: TObject);
begin
   dbeACobrar.Enabled := True;
end;

procedure TFPagoProvRep.dbeRecibidoEnter(Sender: TObject);
begin
   strTmp := dbeRecibido.Text;
end;

procedure TFPagoProvRep.dbeRecibidoExit(Sender: TObject);
var
   Tmp : String;
begin
   if bbtnCancFPago.Focused then exit;

   Tmp := StrTmp;
   if CajaDec( dbeRecibido.text ) = BLANCO then
   begin
      ShowMessage('Debe ingresar Monto Recibido');
      StrTmp := Tmp;
      dbeRecibido.Text := BLANCO;
      dbeRecibido.setfocus;
      Exit;
   end;
   if strTmp <> dbeRecibido.text then
   begin
      dbeRecibido.text  := CajaDec(dbeRecibido.text);
      dbeACobrar.text   := dbeRecibido.text;

   end;

end;

procedure TFPagoProvRep.dbeACobrarEnter(Sender: TObject);
begin
   strTmp := dbeACobrar.Text;
end;

procedure TFPagoProvRep.dbeACobrarExit(Sender: TObject);
begin
   if bbtnCancFPago.Focused then exit;

   if CajaDec( dbeACobrar.text ) = BLANCO then
   begin
      dbeACobrar.Text := dbeRecibido.Text;
      Exit;
   end;

   if strTmp <> dbeACobrar.text then
   begin
      dbeACobrar.text   := CajaDec( dbeACobrar.Text );
      if CmpDec( dbeRecibido.Text , dbeACobrar.Text ) = -1 then
         dbeACobrar.Text := dbeRecibido.Text;
   end;

end;

procedure TFPagoProvRep.BitBtn2Click(Sender: TObject);
begin
   if DMTE.cdsDetFPago.State in [dsedit,dsinsert] then
   begin
      if MessageDlg(' Añadir Cancelará los Cambios Actuales'+ #13 +
                    '     ¿ Desea Continuar ?     ',mtConfirmation,[mbYes, mbNo],0) = mrNo then
         exit;
   end;
   DMTE.cdsDetFPago.Cancel;
   BlanqueaEdits(pnlFPago);
   Inserta;

end;

procedure TFPagoProvRep.Z2OkDetalleExit(Sender: TObject);
var
   xNuevo : Boolean;
begin

   ValidacionDatos;
   ValidacionTjaChq;
   ValidacionCobradoTotal;
   if DMTE.cdsDetFPago.state = dsinsert then
      xNuevo := True
   else
      xNuevo := False;
   GrabaDetalle;
   AcumulaDetFPago;
   wModifica := TRUE;
   if xNuevo then
   begin
     BlanqueaEdits(pnlFPago);
     Inserta;
   end
   else
   begin
     pnlFPago.SetFocus;
     pnlFPago.Visible := False;
     pnlDetPago.Enabled   := True;
     pnlBotones.Enabled   := True;
   end

end;

procedure TFPagoProvRep.ValidacionDatos;
begin
   if trim(dblcFormPago.text) = '' then
   begin
      dblcFormPago.SetFocus;
      Raise Exception.Create ('Ingrese Forma de Pago');
   end;

   if trim(dblcTMonC.text) = '' then
   begin
      dblcTMonC.setfocus;
      Raise Exception.Create ('Ingrese Moneda');
   end;

   if (cajadec(dbeRecibido.text) = BLANCO)  then
   begin
        dbeRecibido.SetFocus;
        Raise Exception.Create ('Ingrese Monto Recibido');
   end
end;

procedure TFPagoProvRep.ValidacionTjaChq;
begin
    if dblcFormPago.Text = DMTE.wEFECTIVO then
       Exit;

    if trim(dblcBanco.text) = '' then
    begin
       dblcBanco.setfocus;
       Raise Exception.Create ('Ingrese Banco');
    end;
    if trim(dbeNoChq.text) = '' then
    begin
       dbeNoChq.setfocus;
       Raise Exception.Create ('Ingrese Chq/Tarjeta');
    end;

    if dblcFormPago.Text = DMTE.wTARJETA then
    begin
       if trim(dblcTarjeta.text) = '' then
       begin
          dblcTarjeta.SetFocus;
          Raise Exception.Create ('Ingrese Tipo de Tarjeta');
       end;
    end;
end;

procedure TFPagoProvRep.ValidacionCobradoTotal;
begin
   if chkAsignaResto.Checked then
      exit;
end;

procedure TFPagoProvRep.GrabaDetalle;
var
    xMonLoc ,
    xMtoExt : double;
    Anio,Mes,Dia : Word;
begin
   DMTE.cdsDetFPago.Edit;
   DMTE.cdsDetFPago.FieldByName('FPAGOID'    ).AsString:= dblcFormPago.text;
   DMTE.cdsDetFPago.FieldByName('FPAGODES'   ).AsString:= DMTE.DisplayDescrip('prvTGE','TGE112','FPAGOABR','FPAGOID='+quotedstr(dblcFormPago.text),'FPAGOABR');
   DMTE.cdsDetFPago.FieldByName('BANCOID'    ).AsString:= dblcBancoFPago.text;
   DMTE.cdsDetFPago.FieldByName('TJAID'      ).AsString:= dblcTarjeta.text;
   DMTE.cdsDetFPago.FieldByName('TMONID'     ).AsString:= dblcTMOnC.Text;
   DMTE.cdsDetFPago.FieldByName('TMONABR'    ).AsString:= edtTMonC.text;
   DMTE.cdsDetFPago.FieldByName('ECNOCHQ'    ).AsString:= TRIM(dbeNOChq.Text);
   DMTE.cdsDetFPago.FieldByName('FC_RECIBIDO').AsString:= dbeRecibido.text;
   DMTE.cdsDetFPago.FieldByName('TC_USADO'   ).AsString:= dbeTCambio.Text;
   DMTE.cdsDetFPago.FieldByName('FC_COBRADO' ).AsString:= DMTE.cdsDetFPago.FieldByName('FC_RECIBIDO').AsString;
   DMTE.cdsDetFPago.FieldByName('FC_DEVOLVER').AsString:= '0.00';
   DMTE.cdsDetFPago.FieldByName('CPTOID'     ).AsString:= trim(dblcdCnp.Text);
   DMTE.cdsDetFPago.FieldByName('CLAUXID'    ).AsString:= trim(dblcClase.Text);
   DMTE.cdsDetFPago.FieldByName('CLIEID'     ).AsString:= trim(dblcdAux.Text);
   //anax
   DMTE.cdsDetFPago.FieldByName('FC_FVCMTO'    ).Asdatetime:=dbdtpFecVenc.date ;
   DMTE.cdsDetFPago.FieldByName('FC_FEMIS'     ).Asdatetime:=dbdtpFecEmi.date ;
   DecodeDate(dbdtpFComp.date,anio,mes,dia);
   DMTE.cdsDetFPago.FieldByName('ECANOMM'     ).Asstring:=FloatToStr(anio)+DMTE.StrZero(FloatToStr(mes),2);
   //fin de anax


   //Calcular y grabar equivalentes
   if dblctmonc.Text = DMTE.wTMonLoc then
   begin
      xMonLoc := DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat;
      xMtoExt := Redondea( DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat / DMTE.cdsDetFPago.FieldByName('TC_USADO').AsFloat );
   end
   else
   begin
      xMonLoc := DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat * DMTE.cdsDetFPago.FieldByName('TC_USADO').AsFloat;
      xMtoExt := DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat;
   end;
   DMTE.cdsDetFPago.FieldByName('FC_MTOLOC').AsFloat  := Redondea( xMonLoc );
   DMTE.cdsDetFPago.FieldByName('FC_MTOEXT').AsFloat  := Redondea( xMtoExt );
   cdsPost( DMTE.cdsDetFPago );
   //fin de calcular
   DMTE.cdsDetFPago.Post;
end;

procedure TFPagoProvRep.AcumulaDetFPago;
var
   xMtoLoc ,
   xMtoExt : Currency;
//   Xcds : TwwClientDataSet;
   xCountLoc ,
   xCountExt   : Double;
   xMonedaBase : String;
begin
   xMtoLoc   :=  OperClientDataSet(DMTE.cdsDetFPago , 'SUM(FC_MTOLOC)','');
   xMtoExt   :=  OperClientDataSet(DMTE.cdsDetFPago , 'SUM(FC_MTOEXT)','');

   dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue  := cajadec(currtostr(xMtoLoc));
   dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue  := cajadec(currtostr(xMtoExt));

   dbgDetFPago.RefreshDisplay;

   xCountLoc :=  OperClientDataSet(DMTE.cdsDetFPago , 'COUNT(*)','TMONID=''' + DMTE.wTMonLoc + '''');
   xCountExt :=  OperClientDataSet(DMTE.cdsDetFPago , 'COUNT(*)','TMONID=''' + DMTE.wTMonExt + '''');
   if ((xCountLoc > 0) and (xCountExt=0)) or ((xCountLoc = 0) and (xCountExt > 0)) then
   begin
      xMonedaBase := DMTE.cdsDetFPago.fieldbyname('TMONID').AsString;
   end
   else
   begin
      xMonedaBase := trim( dblcTMon.Text );
   end;
   if xMonedaBase = DMTE.wTMonLoc then
      if (trim(dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue) =
         trim(dbgDetPago.ColumnByName('DEMTOLOC').FooterValue)) then
      begin
//         CuadraDetalle;
      end
   else
      if (trim(dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue) =
         trim(dbgDetPago.ColumnByName('DEMTOLOC').FooterValue)) then
      begin
//         CuadraDetalle;
      end;
end;





procedure TFPagoProvRep.bbtnCancFPagoClick(Sender: TObject);
begin
     if DMTE.cdsDetFPago.State = dsInsert then begin
        DMTE.cdsDetFPago.Delete;
     end
     else
     begin
        DMTE.cdsDetFPago.Cancel;
     end;

//   DMTE.cdsDetFPago.Cancel;
//     pnlFPago.SetFocus;
     pnlFPago.Visible := False;
     pnlDetPago.Enabled   := True;
     pnlBotones.Enabled   := True;

end;

procedure TFPagoProvRep.Z2OkDetalleClick(Sender: TObject);
var
   xNuevo : Boolean;
begin

   ValidacionDatos;
   ValidacionTjaChq;
   ValidacionCobradoTotal;
   if DMTE.cdsDetFPago.state = dsinsert then
      xNuevo := True
   else
      xNuevo := False;
   GrabaDetalle;
   AcumulaDetFPago;
   wModifica := TRUE;
   if xNuevo then
   begin
     BlanqueaEdits(pnlFPago);
     Inserta;
   end
   else
   begin
     pnlFPago.SetFocus;
     pnlFPago.Visible := False;
     pnlDetPago.Enabled   := True;
     pnlBotones.Enabled   := True;
   end

end;

procedure TFPagoProvRep.GrabaIng;
var sSQL, xSQL,sPMtoLoc, sPMtoExt, sFMtoLoc, sFMtoExt : string;
    nPMtoLoc, nPMtoExt, nFMtoLoc, nFMtoExt : double;
    Anio,Mes,Dia : Word;
begin
   if DMTE.cdsDetFPago.recordcount>0 then
   begin
      sFMtoLoc:= dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue;
      sFMtoExt:= dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue;
      sPMtoLoc:= dbgDetPago.ColumnByName('DEMTOLOC').FooterValue;
      sPMtoExt:= dbgDetPago.ColumnByName('DEMTOEXT').FooterValue;

      nFMtoLoc:= strtofloat(sFMtoLoc);
      nFMtoExt:= strtofloat(sFMtoExt);
      nPMtoLoc:= strtofloat(sPMtoLoc);
      nPMtoExt:= strtofloat(sPMtoExt);

      if (abs(nFMtoLoc-nPMtoLoc)>0) and (abs(nFMtoLoc-nPMtoLoc)<0.5) and (abs(nFMtoExt-nPMtoExt)>0) and (abs(nFMtoExt-nPMtoExt)<0.5) then
      begin
          Redondear;
          AcumulaDetFPago ;
      end;
   end;

   GrabaMontoTotal;

   DMTE.cdsIngDocs.Edit;

   DMTE.cdsIngDocs.fieldbyName('ECANOMM').AsString   := DMTE.cdsEgrCaja.fieldbyName('ECANOMM').AsString;
   DMTE.cdsIngDocs.fieldbyName('TDIARID').AsString   := DMTE.cdsEgrCaja.fieldbyName('TDIARID').AsString;
   DMTE.cdsIngDocs.fieldbyName('ECNOCOMP2').AsString := DMTE.cdsEgrCaja.fieldbyName('ECNOCOMP').AsString;

   DMTE.cdsIngDocs.FieldbyName('TMONID').AsString    := dblcTMon.Text;
   DMTE.cdsIngDocs.FieldbyName('NCOTCAMB').AsString  := dbeTCambio.Text;
   DMTE.cdsIngDocs.FieldbyName('CLAUXID').AsString   := dblcClase.Text;
   DMTE.cdsIngDocs.FieldbyName('CLIEID').AsString    := dblcdAux.Text;
   DMTE.cdsIngDocs.FieldbyName('CLIERUC').AsString   := edtAuxRUC.Text;
   DMTE.cdsIngDocs.FieldbyName('CCNOMB').AsString    := dbeGiradoA.Text;
   DMTE.cdsIngDocs.FieldbyName('CPTOID').AsString    := dblcdCnp.Text;
   DMTE.cdsIngDocs.FieldbyName('CCGLOSA').AsString   := dbeGlosa.Text;
   DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString    := 'NP';

   DecodeDate(dbdtpFComp.date,anio,mes,dia);
   DMTE.cdsIngDocs.FieldByName('ECANOMM').AsString   := FloatToStr(anio)+DMTE.StrZero(FloatToStr(mes),2);
   DMTE.cdsIngDocs.FieldByName('NCOUSER').AsString   := DMTE.wUsuario;
   DMTE.cdsIngDocs.FieldByName('NCOFREG').AsString   := DateToStr(date);
//   DMTE.cdsIngDocs.FieldByName('NCOHREG').AsDateTime := SysUtils.Time;
   cdsPost(DMTE.cdsIngDocs);
   DMTE.cdsIngDocs.Post;

   //cdspost(DMTE.cdsIngDocs);
   xSQL:='Select * from CXC303 '
          +'Where CIAID='''   +DMTE.cdsIngDocs.FieldByName('CIAID').AsString   +''' and '
          +      'DOCID='''   +DMTE.cdsIngDocs.FieldByName('DOCID').AsString   +''' and '
          +      'CCSERIE=''' +DMTE.cdsIngDocs.FieldByName('CCSERIE').AsString +''' and '
          +      'CCNODOC=''' +DMTE.cdsIngDocs.FieldByName('CCNODOC').AsString +''' ';
   DMTE.cdsIngDocs.DataRequest( xSQL );
   DMTE.AplicaDatos( DMTE.cdsIngDocs, 'INGDOCS' );


   DMTE.AplicaDatos( DMTE.cdsRegCxC, 'INGDOCS' );
{   if DMTE.cdsRegCxC.ApplyUpdates(0) > 0 then
       Raise Exception.Create ('Error en La Grabación del Detalle de Ingresos');}

   SumaDetIng;


   if DMTE.cdsDetFPago.recordcount>0 then
   begin
      DMTE.cdsRegCxC.First;
      GrabaClave;
      DMTE.AplicaDatos( DMTE.cdsDetFPago, 'INGDOCS' );

{      if DMTE.cdsDetFPago.ApplyUpdates(0) > 0 then
          Raise Exception.Create ('Error en La Grabación de Detalle de Cancelación Ingresos');}
   end;

   dbgDetPago.RefreshDisplay;
   wModifica:=False;
end;

procedure TFPagoProvRep.Redondear;
var nTMtoLoc, nTMtoExt: double;  //'T' Total
  nSMtoLoc, nSMtoExt: double;    //'S' S
  bkmReg: TBookmark;
begin
   bkmReg := DMTE.cdsDetFPago.GetBookmark;
   DMTE.cdsDetFPago.DisableControls;

   nTMtoLoc := strtofloat(dbgDetPago.ColumnByName('DEMTOLOC').FooterValue);
   nTMtoExt := strtofloat(dbgDetPago.ColumnByName('DEMTOEXT').FooterValue);
   nSMtoLoc := 0;  nSMtoExt := 0;
   try
      DMTE.cdsDetFPago.First;
      while not DMTE.cdsDetFPago.EOF do
      begin
         nSMtoLoc := nSMtoLoc + DMTE.cdsDetFPago.fieldbyName('FC_MTOLOC').asfloat;
         nSMtoExt := nSMtoExt + DMTE.cdsDetFPago.fieldbyName('FC_MTOEXT').asFloat;
         DMTE.cdsDetFPago.Next;
      end;
      if not (DMTE.cdsDetFPago.state in [dsEdit, dsInsert]) then
         DMTE.cdsDetFPago.edit;
      DMTE.cdsDetFPago.fieldbyName('FC_MTOLOC').asfloat:=nTMtoLoc-nSMtoLoc+DMTE.cdsDetFPago.fieldbyName('FC_MTOLOC').asfloat;
      DMTE.cdsDetFPago.fieldbyName('FC_MTOEXT').asFloat:=nTMtoExt-nSMtoExt+DMTE.cdsDetFPago.fieldbyName('FC_MTOEXT').asFloat;
      cdsPost( DMTE.cdsDetFPago );
   finally
      DMTE.cdsDetFPago.GotoBookmark(bkmReg);
      DMTE.cdsDetFPago.EnableControls;
      DMTE.cdsDetFPago.FreeBookmark(bkmReg);
   end;
end;


procedure TFPagoProvRep.GrabaMontoTotal;
begin
  DMTE.cdsIngDocs.Edit;
  DMTE.cdsIngDocs.fieldbyName('NCOMTOLOC').AsFloat := OperClientDataSet(DMTE.cdsRegCxC,'SUM(DEMTOLOC)','');
  DMTE.cdsIngDocs.fieldbyName('NCOMTOEXT').AsFloat := OperClientDataSet(DMTE.cdsRegCxC,'SUM(DEMTOEXT)','');
  if dblcTMon.Text = DMTE.wTMonLoc then
     DMTE.cdsIngDocs.fieldbyName('NCOMTOORI').AsFloat := DMTE.cdsIngDocs.fieldbyName('NCOMTOLOC').AsFloat
  else
     DMTE.cdsIngDocs.fieldbyName('NCOMTOORI').AsFloat := DMTE.cdsIngDocs.fieldbyName('NCOMTOEXT').AsFloat;
end;

procedure TFPagoProvRep.InsertaIngresoCaja;
begin

	 DMTE.cdsIngDocs.Edit;

    DMTE.cdsIngDocs.fieldbyname('FLUEID').Clear;

//	 DMTE.cdsIngDocs.FieldbyName('CUENTAID').AsString        := edtCuenta.Text;
	 DMTE.cdsIngDocs.FieldbyName('TMONID').AsString          := dblcTMon.Text;
	 DMTE.cdsIngDocs.FieldbyName('NCOTCAMB').AsString        := dbeTCambio.Text;
	 DMTE.cdsIngDocs.FieldbyName('CLAUXID').AsString         := dblcClase.Text;
	 DMTE.cdsIngDocs.FieldbyName('CLIEID').AsString          := dblcdAux.Text;
	 DMTE.cdsIngDocs.FieldbyName('CLIERUC').AsString         := edtAuxRUC.Text;
	 DMTE.cdsIngDocs.FieldbyName('CCNOMB').AsString          := dbeGiradoA.Text;
	 DMTE.cdsIngDocs.FieldbyName('CPTOID').AsString          := dblcdCnp.Text;
	 DMTE.cdsIngDocs.FieldbyName('CCGLOSA').AsString         := dbeGlosa.Text;
	 DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString          := 'NP';
	 DMTE.cdsIngDocs.Post;

	 pnlDetPago.enabled := True;
	 pnlCabecera1.enabled := False;
	 //
	 ActivaBotones( pnlCabecera1,False);
	 pnlDetPago.Enabled := True;
	 pnlBotones.Enabled := True;
	 if wmodifica then
    begin
      Z2bbtnGraba.Enabled := True;
      Z2bbtnNuevo.Enabled := False;
    end
    else
    begin
      Z2bbtnNuevo.Enabled     := True;
			if DMTE.cdsDetFPago.RecordCount > 0 then
      begin
         Z2bbtnGraba.Enabled     := False;
         Z2bbtnCancelado.Enabled := True;
      end
      else
      begin
         Z2bbtnGraba.Enabled     := True;
         Z2bbtnCancelado.Enabled := False;
      end;
      Z2bbtnAnula.Enabled     := True;
    end;
    Z2bbtnSube.Enabled  := True;
    Z2bbtnCancel2.Enabled := True;

    if not DMTE.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClase.Text ]),[]) then
       Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''');

    if DMTE.cdsRegCxC.RecordCount=0 then
    begin
      Z2dbgDetPagoIButtonClick(nil);
    end
    else
    begin
        //Comprobar si no ha habido un  cambio en el tipo de cambio
        if ( dblcTMon.Text <> DMTE.cdsRegCxC.fieldbyname('TMONID').AsString ) or
           ( strtocurr(dbeTCambio.Text) <> (DMTE.cdsRegCxC.fieldbyname('DETCDOC').AsFloat) ) then
        begin
           ActualizaDetalle;
           SumaDetIng;
        end;
    end;
    dblcdCnp22.Enabled := True;
end;


procedure TFPagoProvRep.SumaDetIng;
Var
   xRegAct : TBookMark;
   xMtoLoc,xMtoExt,xMtoCta :double;
begin
   DMTE.cdsRegCxC.DisableControls;
   xRegAct := DMTE.cdsRegCxC.GetBookmark;
   xMtoLoc := 0;
   xMtoExt := 0;
   xMtoCta := 0;
   DMTE.cdsRegCxC.First;
   while not DMTE.cdsRegCxC.Eof do
   begin
      xMtoLoc := xMtoLoc + DMTE.cdsRegCxC.fieldbyname('DEMTOLOC').AsFloat;
      xMtoExt := xMtoExt + DMTE.cdsRegCxC.fieldbyname('DEMTOEXT').AsFloat;
      DMTE.cdsRegCxC.Next;
   end;
   dbgDetPago.ColumnByName('DEMTOLOC').FooterValue:=floattostrf(xMtoLoc, ffFixed, 10, 2);
   dbgDetPago.ColumnByName('DEMTOEXT').FooterValue:=floattostrf(xMtoExt, ffFixed, 10, 2);
   dbgDetPago.RefreshDisplay;

   DMTE.cdsRegCxC.GotoBookmark(xRegAct);
   DMTE.cdsRegCxC.FreeBookmark(xRegAct);
   DMTE.cdsRegCxC.EnableControls;
end;

procedure TFPagoProvRep.GrabaClave;
begin
   with DMTE.cdsDetFPago do
   begin
      DisableControls;
      First;
      while not Eof do
      begin
         Edit;
         FieldByName('CIAID').AsString    := trim(DMTE.cdsIngDocs.FieldbyName('CIAID').AsString);
         FieldByName('CCTREC').AsString   := 'NP';
         FieldByName('DOCID').AsString    := trim(DMTE.cdsIngDocs.FieldbyName('DOCID').AsString);
         FieldByName('CCSERIE').AsString  := trim(DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString);
         FieldByName('CCNODOC').AsString  := trim(DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString);
         FieldByName('FC_ESTADO').AsString:= 'I';
         Post;
         Next;
      end;
      First;
      EnableControls;
   end;
end;

procedure TFPagoProvRep.ActualizaDetalle;
var
   BMK            : TBookmark;
begin
   Showmessage('Actualizando detalle');
   BMK := DMTE.cdsRegCxC.GetBookmark;
   DMTE.cdsRegCxC.DisableControls;
   DMTE.cdsRegCxC.First;
   while not DMTE.cdsRegCxC.eof do
   begin
      DMTE.cdsRegCxC.Edit;

      DMTE.cdsRegCxC.fieldBYName('TMONID').AsString    := dblcTMon.Text;
      DMTE.cdsRegCxC.fieldBYName('DETCDOC').AsString   := dbeTCambio.Text;
      if dblcTMon.Text = DMTE.wTMonLoc then
      begin
         DMTE.cdsRegCxC.fieldbyname('DEMTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.fieldbyname('DEMTOORI').AsFloat));
         DMTE.cdsRegCxC.fieldbyname('DEMTOEXT').AsString := Cajadec(Currtostr(DMTE.cdsRegCxC.fieldbyname('DEMTOORI').AsFloat / strtocurr( dbeTCambio.text )));
      end
      else
      begin
         DMTE.cdsRegCxC.fieldbyname('DEMTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.fieldbyname('DEMTOORI').AsFloat * strtocurr( dbeTCambio.text )));
         DMTE.cdsRegCxC.fieldbyname('DEMTOEXT').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.fieldbyname('DEMTOORI').AsFloat ));
      end;
      DMTE.cdsRegCxC.Next;
   end;
   DMTE.cdsRegCxC.GotoBookmark(BMK);
   DMTE.cdsRegCxC.FreeBookmark(BMK);
   DMTE.cdsRegCxC.EnableControls;

   BMK := DMTE.cdsDetFPago.GetBookmark;
   DMTE.cdsDetFPago.DisableControls;
   DMTE.cdsDetFPago.First;
   while not DMTE.cdsDetFPago.eof do
   begin
      DMTE.cdsDetFPago.Edit;

      DMTE.cdsDetFPago.fieldBYName('TC_USADO').AsString   := dbeTCambio.Text;
      if dblcTMon.Text = DMTE.wTMonLoc then
      begin
         DMTE.cdsDetFPago.fieldbyname('FC_MTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsDetFPago.fieldbyname('FC_COBRADO').AsFloat));
         DMTE.cdsDetFPago.fieldbyname('FC_MTOEXT').AsString := Cajadec(Currtostr(DMTE.cdsDetFPago.fieldbyname('FC_COBRADO').AsFloat / strtocurr( dbeTCambio.text )));
      end
      else
      begin
         DMTE.cdsDetFPago.fieldbyname('FC_MTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsDetFPago.fieldbyname('FC_COBRADO').AsFloat * strtocurr( dbeTCambio.text )));
         DMTE.cdsDetFPago.fieldbyname('FC_MTOEXT').AsString := Cajadec(CurrtoStr(DMTE.cdsDetFPago.fieldbyname('FC_COBRADO').AsFloat ));
      end;
      DMTE.cdsDetFPago.Next;
   end;
   DMTE.cdsDetFPago.GotoBookmark(BMK);
   DMTE.cdsDetFPago.FreeBookmark(BMK);
   DMTE.cdsDetFPago.EnableControls;
end;

procedure TFPagoProvRep.Z2bbtnCancelDetClick(Sender: TObject);
begin
     if DMTE.cdsRegCxC.State = dsInsert then begin
        DMTE.cdsRegCxC.Delete;
     end
     else
     begin
        DMTE.cdsRegCxC.Cancel;
     end;
     PnlActualizaIng.SetFocus;
     PnlActualizaIng.Visible := False;
     pnlDetPago.Enabled   := True;
     pnlBotones.Enabled   := True;
     SumaDetIng;    // Al salir hay que totalizar
     z2bbtnSumatSelecClick(Nil);

end;

procedure TFPagoProvRep.dbgDetPagoCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'DEMTOLOC') or (AFieldName = 'DEMTOEXT') then
           ABrush.Color := clWhite;

end;

procedure TFPagoProvRep.dbgDetPagoDblClick(Sender: TObject);
begin
   if dbgdetpago.DataSource.DataSet.RecordCount = 0 then
   begin
      MessageDlg('NO hay Registros por Editar', mtInformation,[mbOk], 0);
      exit;
   end;

   if DMTE.cdsIngDocs.fieldbyname('NCOESTADO').AsString = 'C' then
   begin
      ShowMessage('Este Documento Está Cancelado');
      exit;
   end;

   if DMTE.cdsIngDocs.fieldbyname('NCOESTADO').AsString = 'A' then
   begin
      ShowMessage('Este Documento Está Anulado');
      exit;
   end;

   pnlDetPago.Enabled  := False;
   pnlBotones.Enabled  := False;
   pnlActualizaIng.Top:= 190;
   pnlActualizaIng.Left:=221;
   pnlActualizaIng.BringToFront;
   pnlActualizaIng.Visible:= True;
   IniciaPanelIng;
   dbeNoRegIng.enabled := False;
   EditaRegistro;
   pnlActualizaIng.SetFocus;
   perform(CM_DialogKey,VK_TAB,0);

end;

Procedure TFPagoProvRep.EditaRegistro;
begin
   BlanqueaEdits ( pnlActualiza );
   dblcdCnp22.Text:=DMTE.cdsRegCxC.fieldbyname('CPTOID').AsString;
   dbeNoRegIng.Text:=DMTE.cdsRegCxC.fieldbyname('CPNOREG').AsString;
   DMTE.cdsRegCxC.Edit;
   if trim( dblcdCnp22.Text ) <> '' then
      edtCnp2Ing.Text := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOABR','CPTOID=''' + dblcdCnp22.Text + '''','CPTOABR');

   edtTMonIng.Text  := edtTMon.Text;
   if not DMTE.cdsRegCxC.FieldByName('CCOSID').Isnull then
   begin
      if trim(DMTE.cdsRegCxC.FieldByName('CCOSID').AsString) <> ''
      then dblcdCCostoIng.Enabled := True
      else dblcdCCostoIng.Enabled := False;
   end
   else
      dblcdCCostoIng.Enabled := False;

   if trim( dblcdAuxDetIng.Text ) <> '' then
   begin
      dbeAuxDetIng.Text:=
           DMTE.DisplayDescrip('prvTGE','CNT201','AUXABR',
                              'CLAUXID = ''' +
                              DMTE.cdsRegCxC.fieldbyname('CLAUXID').AsString
                               + ''' AND AUXID=''' + dblcdAuxDetIng.Text + '''','AUXABR');
      edtClaseDetIng.Text:=
           DMTE.DisplayDescrip('prvTGE','TGE102','CLAUXABR',
                              'CLAUXID = ''' +
                              DMTE.cdsRegCxC.fieldbyname('CLAUXID').AsString + ''' ','clauxabr');

   end;

   if not DMTE.cdsRegCxC.FieldByName('PROV').Isnull then
   begin
      if trim(DMTE.cdsRegCxC.FieldByName('PROV').AsString) <> ''
      then dblcdAuxDetIng.Enabled := True
      else dblcdAuxDetIng.Enabled := False;
   end
   else
      dblcdAuxDetIng.Enabled := False;

   pnlActualizaIng.SetFocus;
   perform(CM_DialogKey,VK_TAB,0);

   dblcClaseDetIng.Enabled  := dblcdAuxDetIng.Enabled;

   if not dblcClaseDetIng.Enabled then
   begin
      edtClaseDetIng.Text  := '';
      dbeAuxDetIng.Text := '';
   end
   else
      if not DMTE.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClaseDetIng.Text ]),[]) then
         Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''');
end;


procedure TFPagoProvRep.dbgDetPagoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Z2dbgDetPagoIButton.Enabled=True) and (key = VK_DELETE) and (ssCtrl in Shift) then begin
      if (DMTE.cdsRegCxC.RecordCount=0) then
          ShowMessage('No hay registros')
       else begin
          if MessageDlg('¿Eliminar Registro?',mtconfirmation,[mbYes,mbNo],0)=mrYes then begin
             DMTE.cdsRegCxC.Delete;    // Borro en el original..
             RecalculaReg;
             SumaDetIng;  // Al salir hay que totalizar
         end;
      end;
   end;

end;

procedure TFPagoProvRep.RecalculaReg;
var
    xcont   : integer;
begin
    xcont:=0;
    DMTE.cdsRegCxC.DisableControls;
    DMTE.cdsRegCxC.First;
    While not DMTE.cdsRegCxC.Eof do begin
       xcont:=xcont+1;
       DMTE.cdsRegCxC.Edit;
       DMTE.cdsRegCxC.fieldbyname('CPNOREG').AsString:=DMTE.strzero(inttostr(xcont),10);
       DMTE.cdsRegCxC.Post;
       DMTE.cdsRegCxC.Next;
    end;
    DMTE.cdsRegCxC.First;
    DMTE.cdsRegCxC.EnableControls;
end;


procedure TFPagoProvRep.dbgDetFPagoDblClick(Sender: TObject);
begin
   if dbgDetFPago.DataSource.DataSet.RecordCount = 0 then
   begin
      MessageDlg('NO hay Registros por Editar', mtInformation,
      [mbOk], 0);
      exit;
   end;
   if DMTE.cdsIngDocs.fieldbyname('NCOESTADO').AsString = 'C' then
   begin
      ShowMessage('Este Documento Está Cancelado');
      exit;
   end;
   if DMTE.cdsIngDocs.fieldbyname('NCOESTADO').AsString = 'A' then
   begin
      ShowMessage('Este Documento Está Anulado');
      exit;
   end;

   pnlDetPago.Enabled  := False;
   pnlBotones.Enabled  := False;
   PnlFPago.BringToFront;
   BlanqueaEdits(pnlFPago);
   PnlFPago.Left:=175;
   PnlFPago.Top :=212;
   PnlFPago.Visible:= True;
   PnlFpago.setfocus;
   perform(CM_DialogKey,VK_TAB,0);
   DMTE.cdsDetFPago.Edit;
   llenaedits;

end;

procedure TFPagoProvRep.LLenaEdits;
var
   xDescrip : string;
begin
    with DMTE.cdsDetFPago do
    begin
       dblcFormPago.text      := DMTE.FieldNoNUlo(FieldByName('FPAGOID'));
       dblcBancoFPago.text    := DMTE.FieldNoNUlo(FieldByName('BANCOID'));
       dblcTarjeta.text       := DMTE.FieldNoNUlo(FieldByName('TJAID'));
       dblcTMOnC.Text         := DMTE.FieldNoNUlo(FieldByName('TMONID'));
       dbeNOChq.Text          := DMTE.FieldNoNUlo(FieldByName('ECNOCHQ'));
       dbeRecibido.text       := DMTE.FieldNoNUlo(FieldByName('FC_RECIBIDO'));
       dbeaCobrar.text        := DMTE.FieldNoNUlo(FieldByName('FC_COBRADO'));

       xDescrip := 'FPAGOID='+quotedstr(dblcFormPago.text);
       edtFormPago.text := DMTE.DisplayDescrip('prvTGE','TGE112','FPAGODES',xDescrip,'FPAGODES');
       xdescrip := 'BANCOID='+quotedstr(dblcBancoFPago.text);
       edtBcoFPago.text := DMTE.displaydescrip('prvTGE','TGE105','BANCONOM',xDescrip,'BANCONOM');
       xDescrip := 'TJAID='+quotedstr(dblcTarjeta.text);
       edtTarjeta.text := DMTE.displaydescrip('prvTGE','TGE167','TJADES',xDescrip,'TJADES');
       xDescrip := 'TMONID='+quotedstr(dblcTMonC.text);
       edtTMonC.text := DMTE.displaydescrip('prvTGE','TGE103','TMONABR',xDescrip,'TMONABR');

       CalculaResto;
    end;
    dbeRecibido.Enabled  := True;
    dbeACobrar.Enabled   := True;
    bitbtn2.Visible := False;
end;


procedure TFPagoProvRep.dbgDetFPagoEnter(Sender: TObject);
begin
    if dbgDetFPago.DataSource.DataSet.RecordCount = 0 then
    begin
       Z2bbtnAdicFPago.OnClick(nil);
    end;

end;

procedure TFPagoProvRep.dbgDetFPagoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   xPosi : Integer;
begin
   if (Z2dbgDetPagoIButton.Enabled=True) and (key = VK_DELETE) and (ssCtrl in Shift) then
   begin
      if (DMTE.cdsDetFPago.RecordCount=0) then
          ShowMessage('No hay registros')
       else
       begin
          if MessageDlg('¿Eliminar Registro?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
          begin
             xPosi := DMTE.cdsDetFPago.RecNo;
             DMTE.cdsDetFPago.Delete;    // Borro en el original..
             AcumulaDetFPago;
             if DMTE.cdsDetFPago.RecordCount <> 0 then
             begin
                DMTE.cdsDetFPago.DisableControls;
                DMTE.cdsDetFPago.First;
                while not DMTE.cdsDetFPago.Eof do
                begin
                    DMTE.cdsDetFPago.Edit;
                    DMTE.cdsDetFPago.FieldByName('CORRE').AsInteger := DMTE.cdsDetFPago.RecNo;
                    DMTE.cdsDetFPago.Post;
                    DMTE.cdsDetFPago.Next;
                end;
                if xposi <= DMTE.cdsDetFPago.RecordCount then
                   DMTE.cdsDetFPago.recno := xPosi;
                DMTE.cdsDetFPago.EnableControls;
             end;

         end;
      end;
   end;

end;

procedure TFPagoProvRep.GrabaEstadoFPago(xEstado: string);
var
   sSQL,sFCanc : string;
begin
//  sFCanc:=  formatdatetime( DMTE.wFormatFecha , dbdtpFComp.date );
    with DMTE.cdsDetFPago do
    begin
      DisableControls;
      First;
      while not Eof do
      begin
          Edit;
          FieldBYname('CAJAID').AsString  := dblcBanco.text;
          FieldBYname('FC_ESTADO').AsString  := xEstado;
          fieldbyname('FC_FCANC').AsDateTime := dbdtpFComp.date;
          Post;
          Next;
      end;
      First;
      EnableControls;
    end;
end;

{******************************************************************************}
procedure TFPagoProvRep.Contab_RegCxC;
begin

   DMTE.cdsCntCaja.FieldByname('CIAID').Value   :=  dblcCia.Text;
   DMTE.cdsCntCaja.FieldByname('TDIARID').Value :=  dblcTDiario.Text;
   DMTE.cdsCntCaja.FieldByname('ECNOCOMP').Value:=  dbeNoComp.Text;
   DMTE.cdsCntCaja.FieldByname('DOCMOD').Value  :=  'CAJA';
   DMTE.cdsCntCaja.FieldByname('DOCID').Value   :=  DMTE.cdsRegCxC.FieldByName('DOCID2').Value;
   DMTE.cdsCntCaja.FieldByname('DCSERIE').Value :=  DMTE.cdsRegCxC.FieldByName('CPSERIE').Value;
   DMTE.cdsCntCaja.FieldByname('DCNODOC').Value :=  DMTE.cdsRegCxC.FieldByName('CPNODOC').Value;
   DMTE.cdsCntCaja.FieldByname('ECFCOMP').Value :=  DMTE.cdsRegCxC.FieldByName('DEFCOMP').Value;
   DMTE.cdsCntCaja.FieldByname('DCFEMIS').Value :=  DMTE.cdsRegCxC.FieldByName('CPFEMIS').Value;
   DMTE.cdsCntCaja.FieldByname('DCFVCMTO').Value:=  DMTE.cdsRegCxC.FieldByName('CPFVCMTO').Value;
   DMTE.cdsCntCaja.FieldByname('CPTOID').Value  :=  DMTE.cdsRegCxC.FieldByName('CPTOID').Value;
   DMTE.cdsCntCaja.FieldByname('CUENTAID').Value:=  DMTE.cdsRegCxC.FieldByName('CUENTAID').Value;
   DMTE.cdsCntCaja.FieldByname('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString;
   DMTE.cdsCntCaja.FieldByname('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').AsString;
   DMTE.cdsCntCaja.FieldByname('CCOSID').Value  :=  DMTE.cdsRegCxC.FieldByName('CCOSID').Value;
   DMTE.cdsCntCaja.FieldByname('DCDH').Value    :=  DMTE.cdsRegCxC.FieldByName('DEDH').Value;
   DMTE.cdsCntCaja.FieldByname('DCTCAMPA').Value:=  DMTE.cdsRegCxC.FieldByName('DETCPAG').Value;
   DMTE.cdsCntCaja.FieldByname('DCTCAMPR').Value:=  DMTE.cdsRegCxC.FieldByName('DETCDOC').Value;
   DMTE.cdsCntCaja.FieldByname('TMONID').Value  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
   DMTE.cdsCntCaja.FieldByname('DCMTOORI').Value:=  DMTE.cdsRegCxC.FieldByName('DEMTOORI').Value;
   DMTE.cdsCntCaja.FieldByname('DCGLOSA').Value:=  DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString;

   if DMTE.cdsRegCxC.FieldByName('TMONID').Value = DMTE.wtMonLoc then
   begin
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxC.FieldByName('DEMTOLOC').Value;
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= DMTE.cdsRegCxC.FieldByName('DEMTOLOC').Value / DMTE.cdsRegCxC.FieldByName('DETCDOC').Value;
   end
   else
   begin
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= DMTE.cdsRegCxC.FieldByName('DEMTOEXT').Value;
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxC.FieldByName('DEMTOEXT').Value * DMTE.cdsRegCxC.FieldByName('DETCDOC').Value;
   end;
   DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:= 'S';   //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCUSER').Value  := DMTE.wUsuario;
   DMTE.cdsCntCaja.FieldByName('DCFREG').Value  := DateS;
   DMTE.cdsCntCaja.FieldByName('DCHREG').Value  := Time;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCANO').Value   := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
   DMTE.cdsCntCaja.FieldByName('DCMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCDD').Value    := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
   DMTE.cdsCntCaja.FieldByName('DCSS').Value    := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
   DMTE.cdsCntCaja.FieldByName('DCSEM').Value   := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
   DMTE.cdsCntCaja.FieldByName('DCTRI').Value   := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
   DMTE.cdsCntCaja.FieldByName('DCAASS').Value  := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
   xNReg:=xNReg+1;
   DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
end;

procedure TFPagoProvRep.AsientoDifTotal;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
     DMTE.cdsCntCaja.Insert;
     DMTE.cdsCntCaja.FieldByName('CIAID').AsString   :=  DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
     DMTE.cdsCntCaja.FieldByName('TDIARID').AsString :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
     DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
     DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString:=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
     DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
     DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
     DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
     DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
     DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat ;
     DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat ;
     DMTE.cdsCntCaja.FieldByName('DCANO').AsString   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
     DMTE.cdsCntCaja.FieldByName('DCMM').AsString    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCDD').AsString    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
     DMTE.cdsCntCaja.FieldByName('DCSS').AsString    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
     DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;

     DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString:=  'S';   //Registro ya cuadrado
     DMTE.cdsCntCaja.FieldByName('DCUSER').AsString  :=  DMTE.wUsuario;
     DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime  :=  Date;
     if DMTE.SRV_D = 'ORACLE' then
        DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  date+time
     else
        DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  Time;
     DMTE.cdsCntCaja.FieldByName('TMONID').AsString  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
     xNReg:=xNReg+1;
     DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

   if ( DMTE.FRound(xDebeT,15,2)<>DMTE.FRound(xHabeT,15,2) ) then
   begin
      if xDebeT>xHabeT then
      begin
				 DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat   := abs(DMTE.FRound(xDebeT-xHabeT,15,2));
				 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat  := 0;
				 DMTE.cdsCntCaja.FieldByName('DCDH').AsString     := 'H';
				 DMTE.cdsCntCaja.FieldByName('CPTOID').AsString   :=  wCptoGan;
				 DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString :=  wCtaGan;
				 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString  := 'Diferencia de Cambio';
			end
			else begin
				 DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat   := abs(DMTE.FRound(xHabeT-xDebeT,15,2));
				 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat  := 0;
				 DMTE.cdsCntCaja.FieldByName('DCDH').AsString     := 'D';
				 DMTE.cdsCntCaja.FieldByName('CPTOID').AsString   :=  wCptoPer;
				 DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString :=  wCtaPer;
				 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString  := 'Diferencia de Cambio';
			end;
	 end;

	 if ( DMTE.FRound(xDebeTD,15,2)<>DMTE.FRound(xHabeTD,15,2) ) then
	 begin
			if xDebeTD>xHabeTD then
			begin
				 DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat   := 0;
				 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat  := abs(DMTE.FRound(xDebeTD-xHabeTD,15,2));
				 DMTE.cdsCntCaja.FieldByName('DCDH').AsString     := 'H';
				 DMTE.cdsCntCaja.FieldByName('CPTOID').AsString   := wCptoGan;
				 DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := wCtaGan;
				 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString  := 'Diferencia de Cambio';
			end
			else begin
				 DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat   := 0;
				 DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat  := abs(DMTE.FRound(xHabeTD-xDebeTD,15,2));
				 DMTE.cdsCntCaja.FieldByName('DCDH').AsString     := 'D';
				 DMTE.cdsCntCaja.FieldByName('CPTOID').AsString   :=  wCptoPer;
				 DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString :=  wCtaPer;
				 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString  := 'Diferencia de Cambio';
      end;
   end;
end;


{procedure TFPagoProvRep.Contab_DifCamRegCxC;
var
    xDif_Camb : real;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO

   if DMTE.cdsRegCxP.FieldByName('DETCDOC').Value <> DMTE.cdsRegCxC.FieldByName('DETCPAG').Value then
    begin
      DMTE.cdsCntCaja.Insert;
      DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsRegCxC.FieldByName('CIAID').Value;
      DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsRegCxC.FieldByName('TDIARID').Value;
      DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsRegCxC.FieldByName('ECNOCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  :=  'CXP';
      DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsRegCxC.FieldByName('DOCID2').Value;
      DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsRegCxC.FieldByName('CPSERIE').Value;
      DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsRegCxC.FieldByName('CPNODOC').Value;
      DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
      DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
      DMTE.cdsCntCaja.FieldByName('CCOSID').Value  :=  DMTE.cdsRegCxC.FieldByName('CCOSID').Value;
      DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsRegCxC.FieldByName('DETCPAG').Value;
      DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsRegCxC.FieldByName('DETCDOC').Value;
      DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
      DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
      DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
      DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
      DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
      DMTE.cdsCntCaja.FieldByName('DCANO').Value   := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
      DMTE.cdsCntCaja.FieldByName('DCMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
      DMTE.cdsCntCaja.FieldByName('DCDD').Value    := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
      DMTE.cdsCntCaja.FieldByName('DCSS').Value    := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
      DMTE.cdsCntCaja.FieldByName('DCSEM').Value   := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
      DMTE.cdsCntCaja.FieldByName('DCTRI').Value   := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
      DMTE.cdsCntCaja.FieldByName('DCAASS').Value  := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
      DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
      DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
      DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := Fprincipal.xModulo;
      xNReg:=xNReg+1;
      DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

      DMTE.cdsCntCaja.FieldByName('TMONID').Value   :=  DMTE.cdsEgrCaja.FieldByName('TMONID').vALUE;
      if DMTE.cdsRegCxP.FieldByName('TMONID').Value=DMTE.wtMonLoc then
       begin   //Provision en Mon.Local
         xDif_Camb:=abs(DMTE.cdsRegCxC.FieldByName('DEMTOLOC').Value / DMTE.cdsRegCxC.FieldByName('DETCDOC').Value -
                        DMTE.cdsRegCxC.FieldByName('DEMTOLOC').Value / DMTE.cdsRegCxC.FieldByName('DETCPAG').Value);//En Mon.Ext.
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := xDif_Camb;

         if DMTE.cdsRegCxC.FieldByName('DETCDOC').Value > DMTE.cdsRegCxC.FieldByName('DETCPAG').Value then
            DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D'
         else
            DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';

       end
      else
       begin                                            //Provision en Mon.Ext.
         xDif_Camb:=abs(DMTE.cdsRegCxC.FieldByName('DEMTOEXT').Value*DMTE.cdsRegCxC.FieldByName('DETCDOC').Value -
                        DMTE.cdsRegCxC.FieldByName('DEMTOEXT').Value*DMTE.cdsRegCxC.FieldByName('DETCPAG').Value);//En Mon.Local
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := xDif_Camb;

         if DMTE.cdsRegCxP.FieldByName('DETCDOC').Value > DMTE.cdsRegCxC.FieldByName('DETCPAG').Value then
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
end;}






procedure TFPagoProvRep.Z2bbtnEmiteClick(Sender: TObject);
var
  CadSql : String;
begin
  if DMTE.cdsIngDocs.RecordCount=0 then
     raise exception.Create('No existe Devolución a Caja');

  if DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString <> 'C' then
  begin
     rAISE Exception.Create('El Documento debe estar aceptado' +#13+' para poder ser emitido') ;
  end ;
//
  CadSql:='SELECT R.CIAID , T.CIADES, B.BANCONOM, P.FPAGODES, ' +
          ' J.FC_COBRADO, M.TMONABR, R.TMONID, ' +
          ' R.CCFEMIS, R.CCNODOC, R.NCOMTOORI, R.CCGLOSA, ' +
          ' R.NCOTCAMB, CAJA301.DENUMREG, R.CCNOMB ' +
          ' FROM CXC303 R, TGE101 T, TGE105 B, CAJA314 J, ' +
          ' TGE112 P, TGE103 M,  CAJA301 '+

          ' WHERE R.CIAID = ''' + trim( DMTE.cdsIngDocs.FieldByName('CIAID').AsString   ) + ''' '  +
          ' AND R.CCNODOC ='''  + trim( DMTE.cdsIngDocs.FieldByName('CCNODOC').AsString ) + ''' '  +
          ' AND R.CCSERIE = ''' + trim( DMTE.cdsIngDocs.FieldByName('CCSERIE').AsString ) + ''' '  +
          ' AND R.DOCID = '''   + trim( DMTE.cdsIngDocs.FieldByName('DOCID').AsString   ) + ''' '  +

          ' AND R.CIAID = T.CIAID '      +
          ' AND R.BANCOID = B.BANCOID '  +
          ' AND R.CIAID   = J.CIAID '    +
          ' AND R.CCSERIE = J.CCSERIE '  +
          ' AND R.CCNODOC = J.CCNODOC '  +
          ' AND R.DOCID   = J.DOCID '    +

          ' AND J.FPAGOID = P.FPAGOID '  +

          ' AND J.TMONID = M.TMONID '    +
          ' AND CAJA301.DENUMREG='+quotedstr(DMTE.cdsIngDocs.FieldByName('CCNODOC').AsString)+
          ' GROUP BY '+
          ' R.CIAID , T.CIADES, B.BANCONOM, P.FPAGODES, ' +
          ' J.FC_COBRADO, M.TMONABR, R.TMONID, ' +
          ' R.CCFEMIS, R.CCNODOC, R.NCOMTOORI, R.CCGLOSA, ' +
          ' R.NCOTCAMB, CAJA301.DENUMREG, R.CCNOMB ';
  DMTE.cdsqry.close;
  DMTE.cdsqry.datarequest(CadSql);
  DMTE.cdsqry.open;
  ppdbRecibo.DataSource   := DMTE.dsQry ;
  pprRecibo.TEMPLATE.FileName := wRutaRpt + '\Ingreso.Rtm';
  pprRecibo.template.LoadFromFile ;

  ppLbDescrip.Caption := dbeGiradoA.text;
  pprRecibo.Print                      ;
  ppdbRecibo.DataSource   := nil       ;

end;

procedure TFPagoProvRep.pprReciboBeforePrint(Sender: TObject);
var
   Year, Month, Day: Word ;
   xSQL : String ;
   xMoneda,xMes : String ;
   xConver : Double;
begin
   if DMTE.wRptCia='Dema' then
    begin
     DMTE.cdsTMon.Locate('TMONID', DMTE.cdsqry.fieldbyname('TMONID').AsString,[]);
     if DMTE.cdsQry.FieldByName('TMONID').AsString = DMTE.wTMonExt then
// Inicio HPC_201601_CAJA
//    Se cambia valor fijo para descripción de moneda por uso de variable que se carga de tabla de Tipos de Monedas
         xMoneda := DMTE.wTMonExtDes
//         xMoneda := 'Dolares'
     else
         xMoneda := DMTE.wTMonLocDes;
//         xMoneda := 'Nuevos Soles';
// Fin HPC_201601_CAJA
     xconver := DMTE.cdsQry.fieldbyname('NCOMTOORI').AsFloat;
     pplbValor.Caption   := DMTE.cdsTMon.fieldbyname('TMONABR').AsString + ' '
                          + FloatToStrF(xConver, ffNumber, 12, 2);
     ppLbDescrip.Caption := 'La cantidad de '+Trim(NumtoStr(xConver)) +' '+xMoneda;
    end
   else
    begin
// Inicio HPC_201601_CAJA
//    Se cambia valor fijo para descripción de moneda por uso de variable que se carga de tabla de Tipos de Monedas
      xMoneda := DMTE.wTMonLocDes;
//      xMoneda := 'Nuevos Soles';
// Fin HPC_201601_CAJA
      DMTE.cdsTMon.Locate('TMONID',DMTE.wTMonLoc,[]);
      xConver := DMTE.cdsqry.fieldbyname('NCOMTOORI').AsFloat * StrToFloat(dbeTCambio.Text);
      if DMTE.cdsqry.FieldByName('TMONID').AsString = DMTE.wTMonExt then
      begin
         if DMTE.wRptCia='JCP' then
         begin
            DMTE.cdsTMon.Locate('TMONID',DMTE.wTMonLoc,[]);
            xConver := DMTE.FRound(DMTE.cdsQry.fieldbyname('NCOMTOORI').asFloat * StrToFloat(dbeTCambio.Text),15,2);
         end
         else
         begin
            DMTE.cdsTMon.Locate('TMONID',DMTE.cdsQry.fieldbyname('TMONID').AsString,[]);
            xConver := DMTE.cdsQry.fieldbyname('NCOMTOORI').AsFloat;
         end;

         pplbValor.Caption:= DMTE.cdsTMon.FieldByName('TMONABR').AsString + ' '
                           + FloatToStrF(xConver, ffNumber, 12, 2);
         ppLbDescrip.AutoSize := False;
         ppLbDescrip.Width    := 165;
         ppLbDescrip.Caption  := 'La cantidad de '+Trim(NumtoStr(xConver)) +' '+xMoneda;
         ppLbDescrip.WordWrap := True;
         ppLbDescrip.AutoSize := True;
      end
      else begin
            if DMTE.wRptCia='JCP' then
            begin
               DMTE.cdsTMon.Locate('TMONID',DMTE.wTMonLoc,[]);
               xConver := DMTE.cdsQry.fieldbyname('NCOMTOORI').asFloat ;
            end
            else
            begin
               DMTE.cdsTMon.Locate('TMONID',DMTE.cdsQry.fieldbyname('TMONID').AsString,[]);
               xConver := DMTE.FRound(DMTE.cdsQry.fieldbyname('NCOMTOORI').AsFloat, 15, 2);
            end;
//         xconver := DMTE.cdsqry.fieldbyname('NCOMTOORI').asFloat;
         pplbValor.Caption:= DMTE.cdsTMon.fieldbyname('TMONABR').AsString + ' '
                           + FloatToStrF(xconver,ffNumber,12,2);
         ppLbDescrip.Caption:='La cantidad de '+trim(NumtoStr(xconver)) +' '+xmoneda;
      end;
   end;
   //**
   ppLbDescrip1.AutoSize := False;
   ppLbDescrip1.Width   := 165;
   ppLbDescrip1.Caption := 'Por Concepto de '+DMTE.cdsqry.fieldbyname('CCGLOSA').AsString;
                         DecodeDate(DMTE.cdsqry.fieldbyName('CCFEMIS').AsDateTime, Year, Month, Day);
                         xsql := 'CIAID=' + QuotedStr(DMTE.cdsqry.fieldbyname('CIAID').AsString);
   ppLbDescrip1.WordWrap := True;
   ppLbDescrip1.AutoSize := True;

  case Month of
   1  : xMes := 'Enero' ;
   2  : xMes := 'Febrero' ;
   3  : xMes := 'Marzo' ;
   4  : xMes := 'Abril' ;
   5  : xMes := 'Mayo' ;
   6  : xMes := 'Junio' ;
   7  : xMes := 'Julio' ;
   8  : xMes := 'Agosto' ;
   9  : xMes := 'Setiembre' ;
   10 : xMes := 'Octubre' ;
   11 : xMes := 'Noviembre' ;
   12 : xMes := 'Diciembre' ;
  end;

  if DMTE.RecuperarDatos('TGE101','*',xsql) then
  begin
     pplbFecha.Caption:= 'Lima, '+inttostr(Day)+' de '+xmes +' del '+inttostr(Year);
  end ;
//  ppnNombre.Caption:='Hemos recibido de Sr./Sra: '+DMTE.cdsqry.fieldbyname('AUXNOMB').AsString;
  ppnNombre.Caption:='Hemos recibido de Sr./Sra: '+DMTE.cdsqry.fieldbyname('CCNOMB').AsString;
  xsql := 'TMONID=' + QuotedStr(DMTE.cdsqry.fieldbyname('TMONID').AsString);

end;

function TFPagoProvRep.NumtoStr(wNumero:double):string;
var
	xNumStr,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12 : string;
  xGrupo, xTotal, xDecimal : string;
  xLargo, xVeces : integer;
  xcontador : integer;
begin
	// w1 para Unidades
  xNumStr := floattostr(int(wNumero));
  for xcontador := 1 to Length(FloatToStr(wNumero)) do
   begin
    if copy(FloatToStr(wNumero),xcontador,1) = '.' then
     begin
      xDecimal := copy(FloatToStr(wNumero),xcontador+1,Length(FloatToStr(wNumero)));
      break;
     end;
   end;
//  xDecimal:= floattostr(wNumero-int(wNumero));

  if wNumero-int(wNumero)>0 then
  begin
//  	if strtoint(copy(xDecimal,Length(xDecimal),1)) >= 5 then
    //** 02/01/2001 - pjsv
{    if copy(xDecimal,Length(xDecimal),1) <> '' then
    //**
    	if strtoint(copy(xDecimal,Length(xDecimal),1)) >= 5 then
      	xDecimal := inttostr(strtoint(copy(xDecimal,3,2))+1)
      else	xDecimal := copy(xDecimal,3,2)
    //** 02/01/2001 - pjsv
		else 	xDecimal := copy(xDecimal,3,2);
    //**
}
  end
  else
  begin
  	xDecimal:='00';
  end;
  //** 02/01/2001 - pjsv
  if length(xdecimal) = 1 then xdecimal := xdecimal + '0';
  //**
  xDecimal:= ' y '+xDecimal+'/100';
  xLargo := length(xNumStr);
  x1:='';x2:='';x3:='';x4:='';x5:='';x6:='';x7:='';x8:='';x9:='';x10:='';
  if xLargo>=1  then x1:=copy(xNumStr,xLargo,1);
  if xLargo>=2  then x2:=copy(xNumStr,xLargo-1,1);
  if xLargo>=3  then x3:=copy(xNumStr,xLargo-2,1);
  if xLargo>=4  then x4:=copy(xNumStr,xLargo-3,1);
  if xLargo>=5  then x5:=copy(xNumStr,xLargo-4,1);
  if xLargo>=6  then x6:=copy(xNumStr,xLargo-5,1);
  if xLargo>=7  then x7:=copy(xNumStr,xLargo-6,1);
  if xLargo>=8  then x8:=copy(xNumStr,xLargo-7,1);
  if xLargo>=9  then x9:=copy(xNumStr,xLargo-8,1);
  if xLargo>=10 then x10:=copy(xNumStr,xLargo-9,1);
  if xLargo>=11 then x11:=copy(xNumStr,xLargo-10,1);
  if xLargo>=12 then x12:=copy(xNumStr,xLargo-11,1);
  xVeces:=1; xTotal:='';
  while xVeces<=4 do // hasta 999,999'999,999
  begin
    if xVeces=2 then
		begin
       x1:=x4;
       x2:=x5;
       x3:=x6;
    end;
    if xVeces=3 then
    begin
       x1:=x7;
       x2:=x8;
       x3:=x9;
    end;
    if xVeces=4 then
    begin
       x1:=x10;
       x2:=x11;
       x3:=x12;
    end;
    if x2='1' then // del 11 a 19
    begin
       if x1='0' then x2:='DIEZ';
       if x1='1' then x2:='ONCE';
       if x1='2' then x2:='DOCE';
       if x1='3' then x2:='TRECE';
       if x1='4' then x2:='CATORCE';
       if x1='5' then x2:='QUINCE';
       if x1='6' then x2:='DIECISEIS';
       if x1='7' then x2:='DIECISIETE';
       if x1='8' then x2:='DIECIOCHO';
       if x1='9' then x2:='DIECINUEVE';
       x1:='0';
		end
    else
    begin // del 0 al 9
    	if x1='1' then x1:='UNO';
      if (xVeces>1) and (x1='UNO') then x1:='UN';
      if x1='2' then x1:='DOS';
      if x1='3' then x1:='TRES';
      if x1='4' then x1:='CUATRO';
      if x1='5' then x1:='CINCO';
      if x1='6' then x1:='SEIS';
      if x1='7' then x1:='SIETE';
      if x1='8' then x1:='OCHO';
      if x1='9' then x1:='NUEVE';
      if x2='2' then
      begin // veinte
      	x2:='VEINTI';
      	if x1='0' then x2:='VEINTE';
      end;
      if x2='3' then begin
      	x2:='TREINTI';
        if x1='0' then x2:='TREINTA';
      end;
      if x2='4' then begin
        x2:='CUARENTI';
        if x1='0' then x2:='CUARENTA';
      end;
      if x2='5' then begin
        x2:='CINCUENTI';
        if x1='0' then x2:='CINCUENTA';
      end;
			if x2='6' then begin
        x2:='SESENTI';
        if x1='0' then x2:='SESENTA';
      end;
      if x2='7' then begin
        x2:='SETENTI';
        if x1='0' then x2:='SETENTA';
      end;
      if x2='8' then begin
        x2:='OCHENTI';
        if x1='0' then x2:='OCHENTA';
      end;
      if x2='9' then begin
      	x2:='NOVENTI';
        if x1='0' then x2:='NOVENTA';
      end;
      end;
      if x3='1' then x3:='CIENTO';
      if (x2='0') and (x1='0') and (x3='CIENTO') then
      	x3:='CIEN';
      if x3='2' then x3:='DOSCIENTOS';
      if x3='3' then x3:='TRESCIENTOS';
      if x3='4' then x3:='CUATROCIENTOS';
      if x3='5' then x3:='QUINIENTOS';
      if x3='6' then x3:='SEISCIENTOS';
      if x3='7' then x3:='SETECIENTOS';
      if x3='8' then x3:='OCHOCIENTOS';
      if x3='9' then x3:='NOVECIENTOS';
      xGrupo := '';
			//xGrupo := x3;
			if x3<>'0' then xGrupo:=x3;
      if x2<>'0' then xGrupo:=xGrupo+' '+x2;
      if x1<>'0' then xGrupo:=xGrupo+x1;
      if ((xVeces=2)or(xVeces=4)) and (length(xGrupo)>1) then
      begin
      	xGrupo:=xGrupo+' MIL';
      end;
      if (xVeces=3) and (length(xGrupo)>1) then
      begin
      	if x1<>'UN' then
        	xGrupo:=xGrupo+' MILLONES'
        else
        begin
        	xGrupo:=xGrupo+' MILLÓN';
        end;
    end;
    if length(xTotal)>0 then xGrupo:=xGrupo+' ';
    xTotal := xGrupo+xTotal;
    xVeces := xVeces+1;
  end;
  Result := xTotal+xDecimal;
end;

procedure TFPagoProvRep.pprReciboPreviewFormCreate(Sender: TObject);
begin
   pprRecibo.PreviewForm.ClientHeight := 500;
   pprRecibo.PreviewForm.ClientWidth := 650;
   TppViewer(pprRecibo.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFPagoProvRep.dbgSelecTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   if (DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='I') or
              (DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='N') then
    begin
     pnlBuscaNoProv.Visible := True;
     lblBuscaNoProv.Caption := dbgSelec.DataSource.DataSet.FieldByName(AFieldName).DisplayName;
     isBuscaPagoNoProv.SearchField := AFieldName;
     isBuscaPagoNoProv.Text := '';
     isBuscaPagoNoProv.SetFocus;
    end;
end;

procedure TFPagoProvRep.isBuscaPagoNoProvKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (Key =27) or (Key =13) then
    begin
      pnlBuscaNoProv.Visible:=False;
      dbgSelec.SetFocus;
    end;
end;

procedure TFPagoProvRep.Button1Click(Sender: TObject);
begin
   pnlBuscaNoProv.visible := False;
end;

procedure TFPagoProvRep.AsignaSaldo;
var
    xRegAct : TBookMark;
    fRendMN,fRendME,fECSALMN,fECSALME : double;
begin
   DMTE.cdsECRepo.DisableControls;
   xRegAct := DMTE.cdsECRepo.GetBookmark;
   if Length(Trim(dbeSelMN.text))=0 then
   begin
      fRendMN := 0;
      fRendME := 0;
   end
   else
   begin
      fRendMN := strtoFloat(dbeSelMN.text);
      fRendME := strtoFloat(dbeSelME.text);
   end;
   fECSALMN := 0;
   fECSALME := 0;

   DMTE.cdsECRepo.First ;
   while not DMTE.cdsECRepo.Eof do
   begin
      if DMTE.cdsECRepo.FieldByname('FLAGVAR').AsString='S' then
      begin
        if dblcTMon.Text = DMTE.wTMonLoc then
        begin
           if DMTE.FRound(fRendMN,15,2)> DMTE.FRound(DMTE.cdsECRepo.FieldByname('ECSALMN').AsFloat,15,2) then
           begin
              fECSALMN := DMTE.cdsECRepo.FieldByname('ECSALMN').AsFloat;
              fECSALME := DMTE.cdsECRepo.FieldByname('ECSALME').AsFloat;
              DMTE.cdsECRepo.Edit;

              DMTE.cdsECRepo.FieldByname('ECCOBLOC').Value:=DMTE.cdsECRepo.FieldByname('ECCOBLOC').AsFloat+fECSALMN;
              DMTE.cdsECRepo.FieldByname('ECCOBEXT').Value:=DMTE.cdsECRepo.FieldByname('ECCOBLOC').AsFloat+fECSALME;

              DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=0;
              DMTE.cdsECRepo.FieldByname('ECSALME').Value:=0;
              DMTE.cdsECRepo.Post;
              fRendMN := DMTE.FRound(fRendMN-fECSALMN,15,2);
              fRendME := DMTE.FRound(fRendME-fECSALME,15,2);
           end
           else
           begin
              DMTE.cdsECRepo.Edit;
              DMTE.cdsECRepo.FieldByname('ECCOBLOC').Value:=fRendMN;
              DMTE.cdsECRepo.FieldByname('ECCOBEXT').Value:=fRendME;
              DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALMN').AsFloat-fRendMN, 15, 2 );
              DMTE.cdsECRepo.FieldByname('ECSALME').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALME').AsFloat-fRendME, 15, 2 );
              DMTE.cdsECRepo.Post;
           end;
        end
        else
           if dblcTMon.Text = DMTE.wTMonExt then
           begin

              if DMTE.FRound(fRendME,15,2)> DMTE.FRound(DMTE.cdsECRepo.FieldByname('ECSALME').AsFloat,15,2) then
              begin
                 fECSALMN := DMTE.cdsECRepo.FieldByname('ECSALMN').AsFloat;
                 fECSALME := DMTE.cdsECRepo.FieldByname('ECSALME').AsFloat;
                 DMTE.cdsECRepo.Edit;

                 DMTE.cdsECRepo.FieldByname('ECCOBLOC').Value:=DMTE.cdsECRepo.FieldByname('ECCOBLOC').AsFloat+fECSALMN;
                 DMTE.cdsECRepo.FieldByname('ECCOBEXT').Value:=DMTE.cdsECRepo.FieldByname('ECCOBLOC').AsFloat+fECSALME;

                 DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=0;
                 DMTE.cdsECRepo.FieldByname('ECSALME').Value:=0;

                 fRendMN := DMTE.FRound(fRendMN-fECSALMN,15,2);
                 fRendME := DMTE.FRound(fRendME-fECSALME,15,2);
                 DMTE.cdsECRepo.Post;
              end
              else
              begin
                 DMTE.cdsECRepo.Edit;
                 
                 DMTE.cdsECRepo.FieldByname('ECCOBLOC').Value:=fRendMN;
                 DMTE.cdsECRepo.FieldByname('ECCOBEXT').Value:=fRendME;

                 DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALMN').AsFloat-fRendMN, 15, 2 );
                 DMTE.cdsECRepo.FieldByname('ECSALME').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALME').AsFloat-fRendME, 15, 2 );
                 DMTE.cdsECRepo.Post;
              end;
           end;
//        DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALMN').Value-DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat, 15, 2 );
//        DMTE.cdsECRepo.FieldByname('ECSALME').Value:=DMTE.FRound( DMTE.cdsECRepo.FieldByname('ECSALME').Value-DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat, 15, 2 );
        if DMTE.cdsECRepo.FieldByname('ECSALMN').Value<0 then
        begin
           DMTE.cdsECRepo.Edit;
           DMTE.cdsECRepo.FieldByname('ECSALMN').Value:=0;
           DMTE.cdsECRepo.Post;
        end;

        if DMTE.cdsECRepo.FieldByname('ECSALME').Value<0 then
        begin
           DMTE.cdsECRepo.Edit;
           DMTE.cdsECRepo.FieldByname('ECSALME').Value:=0;
           DMTE.cdsECRepo.Post;
        end;   
      end;
      DMTE.cdsECRepo.Next;
   end;
   DMTE.cdsECRepo.EnableControls;
   DMTE.cdsECRepo.GotoBookmark(xRegAct);
   DMTE.cdsECRepo.FreeBookmark(xRegAct);
   
end;

{
      'FLAGVAR'#9'2'#9'Ok'#9'F'
      'ECNOREPO'#9'8'#9'Reposición'#9'F'
      'ECFCOMP'#9'10'#9'Fecha'#9'F'
      'CPTOID'#9'7'#9'Concepto'#9'F'
      'ECGLOSA'#9'20'#9'Glosa'#9'F'
      'ECMTOLOC'#9'10'#9'Total M.N.'#9'F'
      'ECMTOEXT'#9'10'#9'Total M.E.'#9'F'
      'ECSALMN'#9'10'#9'Saldo M.N.'#9'F'
      'ECSALME'#9'10'#9'Saldo M.E.'#9'F')

}

procedure TFPagoProvRep.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.

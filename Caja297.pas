Unit CAJA297;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   Caja296
// Formulario           :   FPagoGlobal2
// Fecha de Creación    :   01/04/2016
// Autor                :   Equipo de Sistemas
// Objetivo             :   Pago de documentos provisionados
// Actualizaciones
// HPC_201603_CAJA  01/04/2016  Creación de Nuevo Formulario para Registro Global
// HPC_201701_CAJA  Modificar el cálculo de la diferencia de cambio
// HPC_201703_CAJA  Validación SEMT para proveedores con cobranza coactiva
// HPC_201704_CAJA  DAF-2017-0783-02 Se modifico la rutina de Validación al SEMT
// HPC_201705_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
// HPC_201706_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
// HPC_201801_CAJA  Ajustes en la Anulación de los cheques de Filiales
// HPC_201803_CAJA  Ajustes en la Generación de Pagos con Facturas con Detracción
// CAJA-201804      Se ajusta para realizar Pago de Detracción

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
   StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
   wwdbdatetimepicker, wwdblook, ExtCtrls, Db, Wwdatsrc, DBClient, wwclient,
   ComCtrls, Tabnotbk, CAJADM, Menus, Wwlocate, wwDialog, Wwfltdlg, wwidlg,
   ppVar, ppCtrls, ppBands, ppPrnabl, ppClass, ppCache, ppDB, ppDBPipe,
   ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppMemo, oaContabiliza,
// Inicio HPC_201703_CAJA
// Validación SEMT para proveedores con cobranza coactiva
   Wwkeycb, ppEndUsr, ppModule, daDatMod, Variants, ShellAPI, Dialogs;
// Final HPC_201703_CAJA

Type
   TFPagoGlobal2 = Class(TForm)
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
      lblBusca: TLabel;
      BitBtn1: TBitBtn;
      Z2bbtnRetencion: TBitBtn;
      ppdbRetencion: TppDBPipeline;
      pprRetencion: TppReport;
      lblSujetoRetencion: TLabel;
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
      bbtnImpDet: TBitBtn;
      bbtnChqDet: TBitBtn;
      bbtnCH: TBitBtn;
      pnlCH: TPanel;
      Label21: TLabel;
      dbeCH: TwwDBEdit;
      bbtnGrabaCheque: TBitBtn;
      bbtnCanCH: TBitBtn;
      Label27: TLabel;
      dbeOrigen: TwwDBEdit;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
    pnlImprDest: TPanel;
    bbtnImpDest: TBitBtn;
    StaticText3: TStaticText;
    dblcdImpDest: TwwDBLookupComboDlg;
    bbtnImpDestCanc: TBitBtn;
    Z2bbtnReImprime: TBitBtn;
// Inicio HPC_201703_CAJA
// Validación SEMT para proveedores con cobranza coactiva
    cbTodos: TCheckBox;
    Memo1: TMemo;
    sdGraba: TSaveDialog;
// Final HPC_201703_CAJA
      Procedure dblcCiaExit(Sender: TObject);
      Procedure z2bbtnCancelClick(Sender: TObject);
      Procedure z2bbtnOKClick(Sender: TObject);
      Procedure dbdtpFCompExit(Sender: TObject);
      Procedure dblcTDiarioExit(Sender: TObject);
      Procedure z2bbtnCalcClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure z2bbtnSumatDocPagoClick(Sender: TObject);
      Procedure z2bbtnSubeClick(Sender: TObject);
      Procedure z2bbtnCancel2Click(Sender: TObject);
      Procedure z2bbtnNuevoClick(Sender: TObject);
      Procedure z2bbtnGrabaClick(Sender: TObject);
      Procedure z2bbtnCanceladoClick(Sender: TObject);
      Procedure z2bbtnContClick(Sender: TObject);
      Procedure z2bbtnAnulaClick(Sender: TObject);
      Procedure dbgOtrosIButtonClick(Sender: TObject);
      Procedure dbgOtrosKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbdtpFComp2Exit(Sender: TObject);
      Procedure z2bbtnSumatClick(Sender: TObject);
      Function CalculaRet: double;
      Procedure dbgPendientesDragOver(Sender, Source: TObject; X, Y: Integer;
         State: TDragState; Var Accept: Boolean);
      Procedure dbgPendientesMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      Procedure dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
      Procedure dbgDocPagoDragOver(Sender, Source: TObject; X, Y: Integer;
         State: TDragState; Var Accept: Boolean);
      Procedure dbgDocPagoMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      Procedure dbgDocPagoEndDrag(Sender, Target: TObject; X, Y: Integer);
      Procedure dbgDocPagoColExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure z2bbtnOKCabClick(Sender: TObject);
      Procedure dbeNoCompExit(Sender: TObject);
      Procedure dbgDocPagoCalcTitleAttributes(Sender: TObject;
         AFieldName: String; AFont: TFont; ABrush: TBrush;
         Var ATitleAlignment: TAlignment);
      Procedure dbgOtrosCalcTitleAttributes(Sender: TObject;
         AFieldName: String; AFont: TFont; ABrush: TBrush;
         Var ATitleAlignment: TAlignment);

      Procedure dbeNoRegExit(Sender: TObject);
      Procedure z2bbtnOK2Click(Sender: TObject);
      Procedure dblcTMon2Exit(Sender: TObject);
      Procedure dbeDHChange(Sender: TObject);
      Procedure dbeImporte2Exit(Sender: TObject);
      Procedure z2bbtnCancel3Click(Sender: TObject);
      Procedure dbgOtrosDblClick(Sender: TObject);
      Procedure z2bbtnImprimeClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure Z2bbtnEmiChqClick(Sender: TObject);
      Procedure dblcTDoc2Exit2(Sender: TObject);
      Procedure dbeLoteExit(Sender: TObject);
      Procedure dbeTCambioEnter(Sender: TObject);
      Procedure dbeTCambioExit(Sender: TObject);
      Procedure dblcBancoExit(Sender: TObject);
      Procedure dblcCCBcoEnter(Sender: TObject);
      Procedure dblcCCBcoExit(Sender: TObject);
      Procedure dblcClaseExit(Sender: TObject);
      Procedure dblcdAuxExit(Sender: TObject);
      Procedure dblcFormPagoExit(Sender: TObject);
      Procedure dblcTMonExit(Sender: TObject);
      Procedure dblcdCnpExit(Sender: TObject);
      Procedure dblcClaseDetExit(Sender: TObject);
      Procedure dblcdAuxExit2(Sender: TObject);
      Procedure dblcdCnp2Exit2(Sender: TObject);
      Procedure wwDBEdit1Change22(Sender: TObject);
      Procedure FormDestroy(Sender: TObject);
      Procedure dblcdFEfecEnter(Sender: TObject);
      Procedure dblcdFEfecExit(Sender: TObject);
      Procedure Buscar1Click2(Sender: TObject);
      Procedure lkdCxPCloseDialog(Dialog: TwwLookupDlg);
      Procedure lkdCxPInitDialog(Dialog: TwwLookupDlg);
      Procedure edtCuentaExit(Sender: TObject);
      Procedure dbeNoChqExit(Sender: TObject);
      Procedure ppHeaderBand2BeforePrint(Sender: TObject);
      Procedure Z2bbtnNotaAbonoClick(Sender: TObject);
      Procedure ppDetailBand2BeforePrint(Sender: TObject);
      Procedure dbeTCExit(Sender: TObject);
      Procedure dbeMPLExit(Sender: TObject);
      Procedure dbeMPEExit(Sender: TObject);
      Procedure isBuscaExit(Sender: TObject);
      Procedure dbgPendientesTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure dblcdAuxEnter(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure dblcdCCostoExit(Sender: TObject);
      Procedure Z2bbtnRetencionClick(Sender: TObject);
      Procedure dblcdAuxDropDown(Sender: TObject);
      Procedure dbeNoCompEnter(Sender: TObject);
      Procedure Z2bbtChqVouchClick(Sender: TObject);
      Procedure pprChqVouchPrintingComplete(Sender: TObject);
      Procedure dbeImporteKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbeImporteExit(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dbeNoChqDTRExit(Sender: TObject);
      Procedure z2bbtnDTROK2Click(Sender: TObject);
      Procedure z2bbtnDTRCancel3Click(Sender: TObject);
      Procedure dblcCCBcoDTREnter(Sender: TObject);
      Procedure dblcCCBcoDTRExit(Sender: TObject);
      Procedure bbtnReContaClick(Sender: TObject);
      Procedure dblcdCCostoEnter(Sender: TObject);
      Procedure bbtnImpDetClick(Sender: TObject);
      Procedure bbtnChqDetClick(Sender: TObject);
      Procedure bbtnCHClick(Sender: TObject);
      Procedure bbtnGrabaChequeClick(Sender: TObject);
      Procedure bbtnCanCHClick(Sender: TObject);
      Procedure dbeCHExit(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
    procedure bbtnImpDestClick(Sender: TObject);
    procedure bbtnImpDestCancClick(Sender: TObject);
    // Inicio HPC_201703_CAJA
    // Validación SEMT para proveedores con cobranza coactiva
    procedure cbTodosClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    // Final HPC_201703_CAJA

   Private
      xNReg: Integer;
      xDirAux: String; // direccion del auxiliar
      xRUCCIA: String; // para el ruc de la compañia
      cf1: TControlFoco;
      strTmp: String;
      ctrl: TCustomEdit;
      evt_Exit: TNotifyEvent;
      A1: Array Of Integer;
      A2: Array Of TNotifyEvent;
      A2digitos, A4digitos: Array Of TWinControl;
      cdsConceptoC1: TwwClientDataset;
      cdsTDiarioDet: TwwClientDataset;
      nImpDetraccion: Double;
      cReConta: String;
      xTC: Double;
      cdsFiltro: TwwClientDataset;
      wFechaCierre: TDatetime;
      wFrecu: Integer;
      xMTOCNTLOC: Double;
      xMTOCNTEXT: double;
      xMTODETLOC: double;
      xMTODETEXT: double;
      xMONID_PROV: String;
      xDebeT: Double;
      xHabeT: Double;
      xDebeTD: Double;
      xHabeTD: Double;
      xVoucher: String;
      bMayorQueTasa: boolean;
      xMtoLoc, xMtoExt: Double;
      xRetLoc, xRetExt, xDTRPorc: Double;
      bMayorQueMonto: Boolean;
      xMtoRetL, xMtoRetE: Double;
      xMtoTotalL, xMtoTotalE, xMtoL, xMtoE: Double;
      bLetra: Boolean;
      xMtoTotalHL, xMtoTotalHE: Double;
      xMtoRetLH, xMtoRetEH, xPorcPago: double;
      xBANCOID, xCCBCOID, XCTACONT, xDTRGrabada, xMsgContabiliza, xContabiliza: String;
  { Private declarations }
      Procedure InhabilitarPaneles;
      Procedure EdiTarRegistros;
      Procedure AdicionarRegistros;
      Procedure LiberarFiltrosRegistroEgresos;
      Procedure EstablecerFiltrosRegistroEgresos;
      Procedure IniciaPanel;
      Procedure LimpiaFiltros;
      Procedure ActivaFiltro(xName: String);
      Procedure CambiaEstado(xName: char);
      Procedure Contab_Haber;
      Procedure Contab_HaberProc1;
      Procedure Contab_RegCxP;
      Procedure Contab_DocPago;
      Procedure Contab_DocPago_Retencion_Debe(xRL, xRE, xRO: double);
      Procedure Contab_DocPago_Retencion_Haber;
      Procedure Contab_DifCamRegCxP;
      Procedure Contab_DifCamDocPago;
      Procedure Contab_DifCamDocPago_Retencion(wPorcPago, xMtoRetL, xMtoRetLH: double);
      Procedure Contab_DifCamRegCxP2;
      Procedure Contab_DifCamDocPago2;
      Function ValidaCampo: Boolean;
      Procedure ActSaldosMovCxP;
      Procedure ActMovCxP;
      Procedure RetornaSaldosMovCxP;
      Procedure RetornaSaldosMovCxPPagados;
      Procedure ConsisCancela(Var xconsis: Boolean);
      Procedure ActPnlBotones;
      Function ValidacionCabecera: Boolean;
      Procedure RecuperaDescrip;
      Procedure AdicIniciaDatos;
      Procedure IniciaDatos;
      Procedure ActualizaSaldosCaja;
      Procedure ConfiguraAccesos;
      Procedure Proc_Admin;
      Procedure Proc_Consul;
      Procedure Libera_Admin;
      Procedure Libera_Consul;
      Procedure LibConfigAccesos;
      Procedure ValidaCabecera2;
      Procedure SaldosAux;
      Procedure Opera(xProv, xClase: String; cdsClone: TwwClientDataSet);
      Function BuscaClase: String;
      Procedure RecCptosDifC;
      Procedure BorraGrid;
      Procedure ActDetCxP;
      Procedure ActDetCaja;
      Procedure ActualizaFiltro;
      Procedure ActualizaDetCanje;
      Procedure Limpiapnlaux;
      Procedure DescripPagoFact(Const xCIAID, xECANOMM, xTDIARID, xECNOCOMP: String);
      Procedure GrabaCabeceraDeComprobante;
      Procedure GeneraRegChqVouch;
      Procedure AnulaCaja302;
      Procedure ProveedoresNotificados;
// Inicio HPC_201703_CAJA
// Validación SEMT para proveedores con cobranza coactiva
      Procedure ValidacionSEMT(Datos: TDatasource; Fichero: String; Delimitador: char);
// Final HPC_201703_CAJA
    // Inicio HPC_201704_CAJA
    // Nuevo rutina para obtener la data para la validacion SEMT
      Procedure ValidacionSEMT_CargaData;
    // fin HPC_201704_CAJA
   Public
  { Public declarations }
      sFlagAbono: String;
      wCptoGan, wCptoPer, wCtaGan, wCtaPer: String;
      wCCosDif: String;
      vYanoRetencion: String;
      Procedure Adiciona;
      Procedure Edita(cds: Twwclientdataset);
      Procedure AsignaCDSFiltro(cds: TwwClientDataset);
      Procedure AsientoDifTotal;
      Procedure ContabCierra;
      Procedure Contabiliza;
      Procedure ContabilizaProc1;
      Procedure Detraccion;
      Procedure fg_AtualizaNComprob(wgCompania, wgTdiario, wgPeriodo, wgNumero: String);
      Function fg_VerificaDatosDetraccion(wgClauxid, wgProv, wgDocId, wgSerie, wgNoDoc: String): Boolean;
      Function VConceptoDetrac(vCiaid, vTdiarid, vDcpAnomm, vCpNoreg: String): String;
      Function ProveedorRetiene(vProv: String): String;
      Procedure SelecImpresDest;
      Procedure GeneraTxtRetElec(wSerie, wNumero: String);
   End;
Var
   FPagoGlobal2: TFPagoGlobal2;
   wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado, wbChq, wbcancel2: Boolean;
   wModifica, wCiaRetIGV: Boolean;
   wModo: String;
   wBcoTipCta: String;
   wDocModulo: String;
   xTienda  : String;
   xPVenta  : String;
Implementation

Uses CAJAUTIL, Caja290, oaTE2000;

{$R *.DFM}

{******************************************************************************}

Procedure TFPagoGlobal2.IniciaDatos;
Var
   xSQL: String;
Begin
  //
   pnlCabecera1.Enabled := True;
   pnlCabecera2.Enabled := False;
   pnlDetalle.Enabled := False;
   pnlBotones.Enabled := False;
   TabbedNotebook1.PageIndex := 0;

// Estado de variables Botones
   wbSumat := False;
   wbCont := False;
   wbNuevo := False;
   wbImprime := False;
   wbSube := False;
   wbGraba := False;
   wbCancelado := False;
   wbCancel2 := False;
   wbAnula := False;
   wbChq := False;

// Estado de Botones
   z2bbtnOk.Enabled := False;
   z2bbtnCancel.Enabled := False;
   z2bbtnCont.Enabled := False;
   z2bbtnImprime.Enabled := False;
   z2bbtnSube.Enabled := False;
   z2bbtnGraba.Enabled := False;
   z2bbtnCancelado.Enabled := False;
   z2bbtnCancel2.Enabled := False;
   z2bbtnAnula.Enabled := False;
   Z2bbtChqVouch.Visible := False;
   dbgOtrosIButton.Enabled := True;

   BlanqueaEdits(pnlCabecera1);
   BlanqueaEdits(pnlCabecera2);

   edtTMon.Enabled := False;
   edtBanco.Enabled := False;
   dblcCCBco.Enabled := False;
   edtCuenta.Enabled := False;
   dblcFormPago.Enabled := False;
   edtFormPago.Enabled := False;
   dbeNoChq.Enabled := False;
   dbdtpFEmis.Enabled := False;
   dbdtpFEmis.Date := 0;
   dbdtpFEmis.Date := 0;
   wmodifica := False;

   dbgOtros.ColumnByName('DEMTOLOC').FooterValue := '';
   dbgOtros.ColumnByName('DEMTOEXT').FooterValue := '';

   dbgDocPago.ColumnByName('CPSALLOC').FooterValue := '';
   dbgDocPago.ColumnByName('CPSALEXT').FooterValue := '';
   dbgDocPago.ColumnByName('CCPMOLOC').FooterValue := '';
   dbgDocPago.ColumnByName('CCPMOEXT').FooterValue := '';
   LimpiaFiltros;
   DMTE.cdsMovCxP.Close;

// Estableciendo el filtro para que el detalle del grid aparezca vacio
   xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, TDIARID2, CPANOMM, PROV, '
      + '          PROVRUC, CPNOREG, DOCID2, CPSERIE, CPNODOC, TMONID, DETCDOC, '
      + '          DETCPAG, DEDH, DEMTOORI, DEMTOLOC, DEMTOEXT, DESALLOC, DESALEXT, '
      + '          CPTOID, CUENTAID, CCOSID, CPFEMIS, CPFVCMTO, DEUSER, DEFREG, '
      + '          DEHREG, DEANO, DEMM, DEDD, DESS, DESEM, DETRI, DEAASS, DEAASEM, '
      + '          DEAATRI, FLAGVAR, DEANTMN, DEANTME, CLAUXID, ECNOREPO, PROVDES, '
      // Inicio HPC_201703_CAJA
      // Validación SEMT para proveedores con cobranza coactiva
      //      + '          TIPDET, ECNOCOMPR, CIAID2, CNTCOMPROB 'VALPAGPRO
      + '          TIPDET, ECNOCOMPR, CIAID2, CNTCOMPROB, NVL(VALPAGPRO,''N'') VALPAGPRO '
      // Final HPC_201703_CAJA
      + '     from CAJA303 '
      + '    Where CIAID='''' and ECANOMM='''' '
      + '      and TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsDocPago.Close;
   DMTE.cdsDocPago.DataRequest(xSQL);
   DMTE.cdsDocPago.Open;

   xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, TDIARID2, CPANOMM, CPNOREG, '
      + '          DOCID2, CPSERIE, CPNODOC, TMONID, DEFCOMP, DETCDOC, DETCPAG, DEDH, '
      + '          DEMTOORI, DEMTOLOC, DEMTOEXT, DESALLOC, DESALEXT, CPTOID, CUENTAID, '
      + '          CCOSID, CPFEMIS, CPFVCMTO, DEUSER, DEFREG, DEHREG, DEANO, DEMM, DEDD, '
      + '          DESS, DESEM, DETRI, DEAASS, DEAASEM, DEAATRI, FLAGVAR, ECOPAGO, '
      + '          DEESTADO, PROV, PROVRUC, DEGIRA, CLAUXID, CCTREC, ECNOREPO, '
      + '          DENUMREG, DOCMOD, DEGLOSA, ECGLOSA, CANTIDAD, KEYVALE '
      + '     from CAJA301 '
      + '    Where CIAID='''' and ECANOMM='''' '
      + '      and TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsRegCxP.Close;
   DMTE.cdsRegCxP.DataRequest(xSQL);
   DMTE.cdsRegCxP.Open;

   z2bbtnOkCab.Enabled := True;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcCiaExit(Sender: TObject);
Var
   xSQL: String;
Begin
   edtCia.text := DMTE.DisplayDescripLocal(DMTE.cdsCia, 'CIAID', dblcCia.Text, 'CIADES');

   wCiaRetIGV := (DMTE.cdsCia.FieldByName('CIARETIGV').AsString = 'S');

   If edtCia.Text = '' Then
   Begin
      ShowMessage('Error : Compañía no Valida');
      dblcCia.SetFocus;
      Exit;
   End;

   If DMTE.wModo = 'A' Then
   Begin
      xSQL := 'Select A.CPTOID, A.CPTODES, A.CUENTAID, FCTZ '
         + '     From CAJA201 A '
         + '    Where A.CPTOIS=''E'' '
         + '      and Exists (Select CUENTAID '
         + '                    from TGE202 B '
         + '                   where A.CUENTAID=B.CUENTAID AND B.CTAACT=''S'' '
         + '                     and B.CIAID=''' + dblcCia.Text + ''') '
         + '      and nvl(A.ACTIVO,''N'')=''S'' '
         + '    order by A.CPTOID';
      DMTE.cdsCptos.Close;
      DMTE.cdsCptos.DataRequest(xSQL);
      DMTE.cdsCptos.Open;
   End;
   cdsConceptoC1.CloneCursor(DMTE.cdsCptos, True);
   cdsConceptoC1.Name := 'cdsConceptoC1';
   cdsConceptoC1.Filtered := True;
   dblcdCnp2.LookupTable := cdsConceptoC1;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbdtpFCompExit(Sender: TObject);
Var
   xYear, xMonth, xDay: Word;
   xWhere: String;
Begin
   If dblcCia.Focused Then Exit;
   If dblcBanco.Focused Then Exit;
   If dblcCCBco.Focused Then Exit;

   If dbdtpFComp.Date = 0 Then
   Begin
      ShowMessage('Fecha de Comprobante Errada');
      dbdtpFComp.SetFocus;
      Exit;
   End;

   If wBcoTipCta = 'B' Then //Busca en el CAJA402
   Begin
      If DMTE.BuscaFechaCierre(dblcCia.Text, dblcBanco.Text, dblcCCBco.Text, dbdtpFComp.Date) Then
      Begin
         dbdtpFComp.SetFocus;
         exit;
      End;
   End
   Else //Busca en el CAJA310
   Begin
      If Not DiaAperturado(dblcCia.Text, dbdtpFComp.Date, dblcBanco.Text) Then
      Begin
         dbdtpFComp.SetFocus;
         exit;
      End;
   End;

   xWhere := 'TMONID=' + quotedstr(DMTE.wTMonExt)
      + ' and FECHA=' + DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha, dbdtpFComp.Date) + ''')';
   If length(DMTE.DisplayDescrip('prvTGE', 'TGE107', 'TMONID, ' + DMTE.wTipoCambioUsar, xWhere, 'TMONID')) = 0 Then
   Begin
      dbdtpFComp.SetFocus;
      ShowMessage('Tipo de Cambio No Registrado');
      exit;
   End;

   dbeTCambio.Text := DMTE.DisplayDescrip('prvTGE', 'TGE107', 'TMONID, ' + DMTE.wTipoCambioUsar, xWhere, DMTE.wTipoCambioUsar);

   edtPeriodo.text := copy(datetostr(dbdtpFComp.date), 7, 4)
      + copy(datetostr(dbdtpFComp.date), 4, 2);
   dbdtpFEmis.date := dbdtpFComp.date;

   If trim(edtTDiario.Text) <> '' Then
   Begin
      xWhere := 'CIAID=' + quotedstr(dblcCia.Text) + ' AND ECANOMM=' + quotedstr(edtPeriodo.Text)
         + ' AND TDIARID=' + quotedstr(dblcTDiario.Text);
      dbeNoComp.text := DMTE.UltimoNum('prvCaja', 'CAJA302', 'ECNOCOMP', xWhere);
      dbeNoComp.text := DMTE.StrZero(dbeNoComp.text, DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcTDiarioExit(Sender: TObject);
Var
   xWhere: String;
Begin
   edtTDiario.Text := DMTE.DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', 'TDIARID=' + quotedstr(dblcTDiario.text), 'TDIARDES');
   If trim(edtTDiario.Text) <> '' Then
   Begin
      xWhere := 'CIAID=' + quotedstr(dblcCia.Text)
         + ' and ECANOMM=' + quotedstr(edtPeriodo.Text)
         + ' and TDIARID=' + quotedstr(dblcTDiario.Text); // + ' AND EC_PROCE='+quotedstr('B');
      dbeNoComp.text := DMTE.UltimoNum('prvCaja', 'CAJA302', 'ECNOCOMP', xWhere);
      dbeNoComp.text := DMTE.StrZero(dbeNoComp.text, DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnOKClick(Sender: TObject);
Var
   xSQL, xUnion, xWhere, aux, xFiltro: String;
   xFlag: Boolean;
   wImpDtr: double;
Begin
   /////////////////////////////////////////////////////////////////////////////
   // esto se realiza cuando se trata de un comprobante al que se le ha aplicado
   // la DETRACCION y ya fue grabado.
   If lblDTR.Visible Then
   Begin
      xDTRGrabada := '0';
      z2bbtnSube.Enabled := False; // por DETRACCION no funciona
   End;
   /////////////////////////////////////////////////////////////////////////////

   If (dblcClase.Enabled) And (z2bbtnSube.Tag <> 1) Then
   Begin
      DMTE.cdsMovCxP.IndexFieldNames := '';
      DMTE.cdsMovCxP.close;
      DMTE.cdsMovCxP.DataRequest('Select CIAID, CPANOMES, TDIARID, CPNOREG, CLAUXID, PROV, '
         + '                             PROVRUC, DOCID, CPSERIE, CPNODOC, CPFRECEP, CPFEMIS, '
         + '                             CPFVCMTO, TMONID, CPTCAMPR, CPTCAMPA, CPESTADO, '
         + '                             CPOCOMP, CP_CONTA, CPGRAVAD, CPNOGRAV, CPIGV, CPISC, '
         + '                             CPDCTO, CPSERVIC, CPMTOORI, CPMTOLOC, CPMTOEXT, '
         + '                             CPPAGORI, CPPAGLOC, CPPAGEXT, CPSALORI, CPSALLOC, '
         + '                             CPSALEXT, TCANJEID, CPCANJE, CPFCANJE, CPUSER, CPFREG, '
         + '                             CPHREG, CPAAAA, CPMM, CPDD, CPTRI, CPSEM, CPSS, '
         + '                             CPAATRI, CPAASEM, CPAASS, CPFCMPRB, DCPLOTE, DCPCOMP, '
         + '                             CTATOTAL, FLAGVAR, CPTOTOT, CPIGV2, CPGRAVAD2, CPHMOD, '
         + '                             FLAGVAR2, PROVDES, CLAUXREND, AUXIDREND, CCBCOID, '
         + '                             BANCOID, SITUAID, CPFLAGTDOC, CXPRRHH, AUXIDINTER, '
         + '                             CLAUXINTER, CPTCAMDOL, PROVRETIGV, CPTCAMAJ, DTRPORC, '
         + '                             CPMTOORIB, DTRFLAG, FECDEPDET, NUMDEPDET, ADQ_NO_GRAV, '
         + '                             IGV_GRA_NO_DEST, CP_OTROS, CPTODETRSUNATID, '
         + '                             TIPOOPERSUNATID, PORCDESC, CP4TAPENSION, SNPAFPID, '
         + '                             TIPCOMAFPID '
         + '                        from CXP301 '
         + '                       where CIAID=''''');
      DMTE.cdsMovCxP.Open;
   End;
   z2bbtnSube.Tag := 0;

// consistencia de Datos
   ValidaCabecera2;

// Valida la Cuenta
   If (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text, '', edtCuenta.text)) And (dblcTMon.text = DMTE.wTMonLoc) Then
   Begin
      Raise Exception.Create('La cuenta ' + edtCuenta.text + ' Se registra sólo en Moneda Extranjera.');
   End;

// Valida la Cuenta del Concepto
   If (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text, dblcdCnp.text, '')) And (dblcTMon.text = DMTE.wTMonLoc) Then
   Begin
      Raise Exception.Create('La cuenta ' + DMTE.cdsQry.FieldByName('CUENTAID').AsString + ' del Concepto ' + dblcdCnp.text + ' Se registra sólo en Moneda Extranjera.');
   End;

// En este punto ya se ha probado todas las consistencias y ya se puede grabar
// Actualizamos el Client Data Set de Egr.Caja (CAJA302)
   DMTE.cdsEgrCaja.Edit;
   DMTE.cdsEgrCaja.FieldByName('CIAID').Value := dblcCia.Text;
   DMTE.cdsEgrCaja.FieldByName('TDIARID').Value := dblcTDiario.Text;
   DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value := edtPeriodo.Text;
   DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value := dbeNoComp.Text;
   DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value := dbdtpFComp.Date;
   DMTE.cdsEgrCaja.FieldByName('FPAGOID').Value := dblcFormPago.Text;
   DMTE.cdsEgrCaja.FieldByName('EQUIID').AsString := DMTE.EquivFPago(dblcFormPago.Text, dblcBanco.Text);
   DMTE.cdsEgrCaja.FieldByName('TMONID').Value := dblcTMon.Text;
   DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value := strtofloat(dbeTCambio.Text);
   DMTE.cdsEgrCaja.FieldByName('ECMTOORI').Value := strtofloat(dbeImporte.Text);
   DMTE.cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString := xVoucher;
   If trim(dblcdFEfec.Text) = '' Then
      DMTE.cdsEgrCaja.fieldbyname('FLUEID').Clear
   Else
      DMTE.cdsEgrCaja.fieldbyname('FLUEID').AsString := trim(dblcdFEfec.Text);

   If DMTE.cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wTMonLoc Then
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').Value := strtofloat(dbeImporte.Text);
      DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').Value := DMTE.FRound(strtofloat(dbeImporte.Text) / strtofloat(dbeTCambio.Text), 15, 2);
   End
   Else
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').Value := DMTE.FRound(strtofloat(dbeImporte.Text) * strtofloat(dbeTCambio.Text), 15, 2);
      DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').Value := strtofloat(dbeImporte.Text);
   End;

   DMTE.cdsEgrCaja.FieldByName('BANCOID').Value := dblcBanco.Text;
   DMTE.cdsEgrCaja.FieldByName('CCBCOID').Value := dblcCCBco.Text;
   DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').Value := dbeNoChq.Text;

  // se condiciona porque si esta en blanco la fecha graba 1899
   If edtFormPago.text = 'CHEQUE' Then
   Begin
      If dbdtpFEmis.Text = '' Then dbdtpFEmis.Date := DateS;
      DMTE.cdsEgrCaja.fieldBYName('ECFEMICH').AsDateTime := dbdtpFEmis.Date;
   End;
   DMTE.cdsEgrCaja.FieldByName('PROV').Value := dblcdAux.Text;
   DMTE.cdsEgrCaja.FieldByName('PROVRUC').Value := edtAuxRuc.Text;
   DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString := dblcClase.Text;
   DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString := dbeGiradoA.Text;
   DMTE.cdsEgrCaja.FieldByName('CPTOID').Value := dblcdCnp.Text;
   DMTE.cdsEgrCaja.FieldByName('CUENTAID').Value := edtCuenta.Text;
   DMTE.cdsEgrCaja.FieldByName('ECGLOSA').Value := dbeGlosa.Text;
   DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value := dbeLote.Text;
   DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value := 'I';

   xWhere := 'FECHA=' + DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha, dbdtpFComp.Date) + ''')';
   aux := DMTE.DisplayDescrip('prvTGE', 'TGE114', '*', xWhere, 'FECANO');
   DMTE.cdsEgrCaja.FieldByName('ECANO').AsString := DMTE.cdsqry.FieldByName('FECANO').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECMM').AsString := DMTE.cdsqry.FieldByName('FECMES').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECDD').AsString := DMTE.cdsqry.FieldByName('FECDIA').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECSS').AsString := DMTE.cdsqry.FieldByName('FECSS').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString := DMTE.cdsqry.FieldByName('FECSEM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString := DMTE.cdsqry.FieldByName('FECTRIM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString := DMTE.cdsqry.FieldByName('FECAASS').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString := DMTE.cdsqry.FieldByName('FECAASEM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString := DMTE.cdsqry.FieldByName('FECAATRI').AsString;
   DMTE.cdsEgrCaja.FieldByName('EC_PROCE').AsString := 'G';
   DMTE.cdsEgrCaja.FieldByName('EC_IE').AsString := 'E';
   If DMTE.wModo = 'A' Then
      DMTE.cdsEgrCaja.FieldByName('PRVBANCOID').AsString := DMTE.cdsProvCta.fieldbyname('BANCOID').AsString;
   DMTE.cdsEgrCaja.FieldByName('PRVCCBCOID').AsString := DMTE.cdsProvCta.fieldbyname('CCBCOID').AsString;

   DMTE.DCOM1.AppServer.IniciaTransaccion;
   xSQL := 'update CAJA302 '
      + '      set ECFCOMP=' + quotedstr(datetostr(DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime)) + ','
      + '          FPAGOID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString) + ','
      + '          EQUIID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('EQUIID').AsString) + ','
      + '          TMONID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TMONID').AsString) + ','
      + '          ECTCAMB=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat) + ','
      + '          ECMTOORI=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat) + ','
      + '          CCBCOVOUCH=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString) + ','
      + '          FLUEID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('FLUEID').AsString) + ','
      + '          ECMTOLOC=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat) + ','
      + '          ECMTOEXT=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat) + ','
      + '          ECSALMN=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECSALMN').AsFloat) + ','
      + '          ECSALME=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECSALME').AsFloat) + ','
      + '          BANCOID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString) + ','
      + '          CCBCOID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString) + ','
      + '          ECNOCHQ=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString) + ','
      + '          ECFEMICH=' + quotedstr(datetostr(DMTE.cdsEgrCaja.fieldBYName('ECFEMICH').AsDateTime)) + ','
      + '          PROV=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('PROV').AsString) + ','
      + '          PROVRUC=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('PROVRUC').AsString) + ','
      + '          CLAUXID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString) + ','
      + '          ECGIRA=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString) + ','
      + '          CPTOID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString) + ','
      + '          CUENTAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString) + ','
      + '          ECGLOSA=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString) + ','
      + '          ECLOTE=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString) + ','
      + '          ECESTADO=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString) + ','
      + '          ECANO=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANO').AsString) + ','
      + '          ECMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECMM').AsString) + ','
      + '          ECDD=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECDD').AsString) + ','
      + '          ECSS=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECSS').AsString) + ','
      + '          ECSEM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString) + ','
      + '          ECTRI=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString) + ','
      + '          ECAASS=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString) + ','
      + '          ECAASEM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString) + ','
      + '          ECAATRI=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString) + ','
      + '          EC_PROCE=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('EC_PROCE').AsString) + ','
      + '          EC_IE=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('EC_IE').AsString) + ','
      + '          PRVBANCOID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('PRVBANCOID').AsString) + ','
      + '          PRVCCBCOID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('PRVCCBCOID').AsString) + ','
      + '          ECUSER=' + quotedstr(DMTE.wUsuario) + ','
      + '          ECFREG = trunc(sysdate), '
      + '          ECHREG = sysdate '
      + '    Where CIAID=' + quotedstr(dblcCia.Text)
      + '      and ECANOMM=' + quotedstr(edtPeriodo.Text)
      + '      and TDIARID=' + quotedstr(dblcTDiario.Text)
      + '      and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al intentar grabar la cabecera del Egreso');
      DMTE.DCOM1.AppServer.RetornaTransaccion;
      Exit;
   End;
   DMTE.DCOM1.AppServer.GrabaTransaccion;

// Actualizamos el Detalle mostrado en el grid ante posibles cambios del
// Tipo de Cambio

// actualizamos el detalle de CxP ante posibles
// cambios del tipo de cambio
   If xTC <> strtocurr(dbeTCambio.Text) Then
   Begin
      If DMTE.cdsregcxp.RecordCount > 0 Then
         ActDetCaja;
      If DMTE.cdsDocPago.RecordCount > 0 Then
         ActDetCxP;
   End;
// Actualizamos el Footer
   z2bbtnSumatClick(sender);

//   If dblcClase.Enabled Then
   Begin
      xFlag := False;
   // Comprobar si hay mov seleccionados con otro proveedor
      If DMTE.cdsDocPago.RecordCount > 0 Then
      Begin
         DMTE.cdsDocPago.First;
         If (trim(dblcClase.Text) <> DMTE.cdsDocPago.FieldByName('CLAUXID').AsString)
            Or
            (trim(dblcdAux.Text) <> DMTE.cdsDocPago.FieldByName('PROV').AsString) Then
         Begin
            DMTE.cdsDocPago.CancelUpdates;
            DMTE.cdsMovCxP.CancelUpdates;
            xFlag := True;
         End
      End
      Else
         xFlag := True;

      If xFlag Then
      Begin
      // elimina porque todos los documentos deben pasar a caja
         xSQL := 'Select CIAID, CPANOMES, TDIARID, CPNOREG, CLAUXID, PROV, PROVRUC, '
            + '          DOCID, CPSERIE, CPNODOC, CPFRECEP, CPFEMIS, CPFVCMTO, TMONID, '
            + '          CPTCAMPR, CPTCAMPA, CPESTADO, CPOCOMP, CP_CONTA, CPGRAVAD, CPNOGRAV, '
            + '          CPIGV, CPISC, CPDCTO, CPSERVIC, CPMTOORI, CPMTOLOC, CPMTOEXT, '
            + '          CPPAGORI, CPPAGLOC, CPPAGEXT, CPSALORI, CPSALLOC, CPSALEXT, '
            + '          TCANJEID, CPCANJE, CPFCANJE, CPUSER, CPFREG, CPHREG, CPAAAA, '
            + '          CPMM, CPDD, CPTRI, CPSEM, CPSS, CPAATRI, CPAASEM, CPAASS, '
            + '          CPFCMPRB, DCPLOTE, DCPCOMP, CTATOTAL, FLAGVAR, CPTOTOT, CPIGV2, '
            + '          CPGRAVAD2, CPHMOD, FLAGVAR2, PROVDES, CLAUXREND, AUXIDREND, CCBCOID, '
            + '          BANCOID, SITUAID, CPFLAGTDOC, CXPRRHH, AUXIDINTER, CLAUXINTER, '
            + '          CPTCAMDOL, PROVRETIGV, CPTCAMAJ, DTRPORC, CPMTOORIB, DTRFLAG '
            + '     from CXP301 '
            + '    where ';
         xWhere := 'CPESTADO=''' + 'P' + ''' and '
            + 'CLAUXID=''' + dblcClase.Text + ''' '
// Inicio HPC_201803_CAJA
// Se excluye los documentos de Nota de Crédito
            + 'and DOCID not in (''07'',''97'') '
// Fin HPC_201803_CAJA
            + 'and PROV=''' + dblcdAux.Text + ''''
            + ' and TMONID='+quotedstr(dblcTMon.Text);
         xUnion := ' UNION ALL '
            + 'Select CIAID, CPANOMES, TDIARID, CPNOREG, CLAUXID, PROV, '
            + '       PROVRUC, DOCID, CPSERIE, CPNODOC, CPFRECEP, CPFEMIS, '
            + '       CPFVCMTO, TMONID, CPTCAMPR, CPTCAMPA, CPESTADO, CPOCOMP, '
            + '       CP_CONTA, CPGRAVAD, CPNOGRAV, CPIGV, CPISC, CPDCTO, '
            + '       CPSERVIC, CPMTOORI, CPMTOLOC, CPMTOEXT, CPPAGORI, '
            + '       CPPAGLOC, CPPAGEXT, CPSALORI, CPSALLOC, CPSALEXT, '
            + '       TCANJEID, CPCANJE, CPFCANJE, CPUSER, CPFREG, CPHREG, '
            + '       CPAAAA, CPMM, CPDD, CPTRI, CPSEM, CPSS, CPAATRI, '
            + '       CPAASEM, CPAASS, CPFCMPRB, DCPLOTE, DCPCOMP, CTATOTAL, '
            + '       FLAGVAR, CPTOTOT, CPIGV2, CPGRAVAD2, CPHMOD, FLAGVAR2, '
            + '       PROVDES, CLAUXREND, AUXIDREND, CCBCOID, BANCOID, '
            + '       SITUAID, CPFLAGTDOC, CXPRRHH, AUXIDINTER, CLAUXINTER, '
            + '       CPTCAMDOL, PROVRETIGV, CPTCAMAJ, DTRPORC, CPMTOORIB, '
            + '       DTRFLAG '
            + '  from CXP309 '
            + ' where ';

         //Inicio HPC_201705_CAJA: Ajustes en la generación de asientos contables por pago de detracciones
         {xFiltro := ' (((CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR ' +
            '   ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) ';
         xFiltro := 'CPPAGORI=0 and CPSALORI>0';}
         xFiltro := 'CPSALORI > 0';
         //Fin HPC_201705_CAJA

         xSQL := xSQL + xWhere + ' order by CPANOMES DESC, DOCID, CPSERIE, CPNODOC';
         DMTE.cdsMovCxP.IndexFieldNames := '';
         DMTE.cdsMovCxP.Close;
         DMTE.cdsMovCxP.Datarequest(xSQL);
         DMTE.cdsMovCxP.Open;
         DMTE.cdsMovCxP.Filter := xFiltro;
         DMTE.cdsMovCxP.Filtered := True;

         If DMTE.cdsMovCxP.RecordCount = 0 Then
         Begin
            DMTE.cdsMovCxP.Filter := '';
            DMTE.cdsMovCxP.Filtered := False;
            ShowMessage('No hay Documentos Pendientes para Proveedor');
            exit;
         End
         Else
         Begin
         End;
         DMTE.cdsMovCxP.Filtered := True;
      End;
   End;
// Estado de los componentes
   dbgDocPago.ReadOnly := False;
   DMTE.cdsDocPago.EnableControls;
   pnlCabecera1.enabled := False;
   pnlCabecera2.enabled := False;
   pnlDetalle.enabled := True;
   pnlBotones.Enabled := True;
   ActPnlBotones;
   z2bbtnOk.Enabled := False;
   z2bbtnCancel.Enabled := False;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnCancelClick(Sender: TObject);
Begin
   DMTE.cdsEgrCaja.CancelUpdates;
   If DMTE.cdsRegCxP.Active Then DMTE.cdsRegCxP.CancelUpdates;
   If DMTE.cdsDocPago.Active Then DMTE.cdsDocPago.CancelUpdates;
   If DMTE.cdsMovCxP.Active Then DMTE.cdsMovCxP.CancelUpdates;
   Adiciona;
   AdicIniciadatos;
   dbeLote.Text := '000';
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnCalcClick(Sender: TObject);
Begin
   WinExec('calc.exe', 1); //Activa la calculadora del Windows
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnSumatDocPagoClick(Sender: TObject);
Var
   xTSalLoc, xTSalExt, xTPagLoc, xTPagExt: Real;
   xRegAct: TBookMark;
Begin
// Totales de Documentos pagados
   DMTE.cdsDocPago.DisableControls;
   xRegAct := DMTE.cdsDocPago.GetBookmark;
   xTSalLoc := 0;
   xTSalExt := 0;
   xTPagLoc := 0;
   xTPagExt := 0;
   DMTE.cdsDocPago.First;
   While Not DMTE.cdsDocPago.Eof Do
   Begin
      xTSalLoc := xTSalLoc + DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat, 15, 2);
      xTSalExt := xTSalExt + DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat, 15, 2);
      xTPagLoc := xTPagLoc + DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat, 15, 2);
      xTPagExt := xTPagExt + DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat, 15, 2);
      DMTE.cdsDocPago.Next;
   End;

   dbgDocPago.ColumnByName('CPNODOC').FooterValue := '';
   dbgDocPago.ColumnByName('CPFVCMTO').FooterValue := '';
   If DMTE.cdsDocPago.RecordCount > 0 Then
   Begin
      dbgDocPago.ColumnByName('CPNODOC').FooterValue := 'Total Docs.:';
      dbgDocPago.ColumnByName('CPFVCMTO').FooterValue :=
         floattostrf(DMTE.cdsDocPago.RecordCount, ffNumber, 5, 0);
   End;
   dbgDocPago.ColumnByName('DESALLOC').FooterValue := floattostrf(xTSalLoc, ffNumber, 10, 2);
   dbgDocPago.ColumnByName('DESALEXT').FooterValue := floattostrf(xTSalExt, ffNumber, 10, 2);
   dbgDocPago.ColumnByName('DEMTOLOC').FooterValue := floattostrf(xTPagLoc, ffNumber, 10, 2);
   dbgDocPago.ColumnByName('DEMTOEXT').FooterValue := floattostrf(xTPagExt, ffNumber, 10, 2);
   DMTE.cdsDocPago.GotoBookmark(xRegAct);
   DMTE.cdsDocPago.FreeBookmark(xRegAct);

   DMTE.cdsDocPago.EnableControls;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnSubeClick(Sender: TObject);
Begin
   z2bbtnSube.Tag := 1;
   DMTE.cdsEgrCaja.Edit;

   pnlCabecera2.Enabled := True;
   pnlDetalle.Enabled := False;
   pnlBotones.Enabled := False;

   z2bbtnOk.Enabled := True;
   z2bbtnCancel.Enabled := True;

   z2bbtnCont.Enabled := False;
   z2bbtnImprime.Enabled := False;
   z2bbtnSube.Enabled := False;
   z2bbtnGraba.Enabled := False;
   z2bbtnCancelado.Enabled := False;
   z2bbtnCancel2.Enabled := False;
   z2bbtnAnula.Enabled := False;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnCancel2Click(Sender: TObject);
Begin
   If MessageDlg('¿Anular los cambios?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      DMTE.cdsEgrCaja.CancelUpdates;
      DMTE.cdsRegCxP.CancelUpdates;
      DMTE.cdsMovCxP.CancelUpdates;
      DMTE.cdsDocPago.CancelUpdates;
      IniciaDatos;
      Limpiapnlaux;
      RecuperarCiaUnica(dblcCia, edtCia);
      dbeLote.text := '000';
      dbeLote.OnExit(self);
      dblcCia.OnExit(self);
      xVoucher := '';
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnNuevoClick(Sender: TObject);
Begin
   If DMTE.cdsEgrCaja.FieldByName('ECEstado').Value = 'I' Then
   Begin
      If wmodifica Then
      Begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      End;
      If MessageDlg('¿Nuevo Comprobante?', mtConfirmation,
         [mbYes, mbNo], 0) = mrYes Then
      Begin
         Adiciona;
         AdicIniciadatos;
         Limpiapnlaux;
         RecuperarCiaUnica(dblcCia, edtCia);

         dbeLote.text := '000';
         dbeLote.OnExit(self);
         dblcCia.OnExit(self);
         xDTRGrabada := '0';
         lblDTR.Visible := False;
      End;
   End
   Else
   Begin
      Adiciona;
      AdicIniciadatos;
      Limpiapnlaux;
      RecuperarCiaUnica(dblcCia, edtCia);
      dbeLote.Text := '000';
      dbeLote.OnExit(self);
      dblcCia.OnExit(self);
      xDTRGrabada := '0';
      lblDTR.Visible := False;
   End;
   xVoucher := '';
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnCanceladoClick(Sender: TObject);
Var
   xSQL, wMoneda, wMonto: String;
   xRetencion, xConsis: Boolean;
Begin
   // Inicio HPC_201703_CAJA
   // Validación SEMT para proveedores con cobranza coactiva
   DMTE.cdsDocPago.Filter := '';
   DMTE.cdsDocPago.Filter := 'VALPAGPRO <> ''S''';
   DMTE.cdsDocPago.Filtered := true;
   If DMTE.cdsDocPago.Recordcount > 0 Then
   begin
     DMTE.cdsDocPago.Filtered := false;
     ShowMessage('Todos los pagos deben tener validación SEMT');
     Exit;
   end;
   DMTE.cdsDocPago.Filtered := False;
   // Final HPC_201703_CAJA
   cReConta := 'N';

// Se realiza por tratarse de DETRACCION
   If (xDTRPorc > 0) And (DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString <> '') Then
   Begin
      DMTE.cdsEgrCaja.Filter := '';
      DMTE.cdsEgrCaja.Filtered := False;
      DMTE.cdsEgrCaja.Filter := ' CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
         + ' and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
         + ' and TIPDET IN (''TO'',''I4'') '
         + ' and ECNOCOMPR=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString);
      DMTE.cdsEgrCaja.Filtered := True;
   End
   Else
      xDTRPorc := 0;

   If (wModifica) Then //Or (DMTE.cdsDocPago.ChangeCount > 0) Or (DMTE.cdsDocPago.Modified) Then
   Begin
      ShowMessage('Debe grabar primero las actualizaciones realizadas');
      z2bbtnGraba.Enabled := True;
      z2bbtnGraba.SetFocus;
      Exit;
   End;

   If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString <> 'I' Then
   Begin
      ShowMessage('No tiene el estado correcto para Cancelar');
      z2bbtnCancelado.Enabled := False;
      Exit;
   End;

   DMTE.cdsRegCxP.DisableControls;
   ConsisCancela(xConsis);
   DMTE.cdsRegCxP.EnableControls;
   If Not xConsis Then
   Begin
      ShowMessage('No se puede Cancelar el Comprobante');
      Exit;
   End;

   If MessageDlg('¿Desea Efectuar la Cancelación del Comprobante?', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes Then
   Begin
      DMTE.DCOM1.AppServer.IniciaTransaccion;

   // Inicio calculo de Retencion del IGV
      xSigueGrab := True;

      If xRetLoc > 0 Then
      begin
         SelecImpresDest;
         xSigueGrab := True;
         DMTE.CalculaRetencionIGVGlobal;
         If Not xSigueGrab Then
         Begin
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            Exit;
         End;
      end
      Else
      Begin
         xRetencion := False;
      end;
      If Not xSigueGrab Then
      Begin
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;

      ActMovCxP;
      If Not xSigueGrab Then
      Begin
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;

      ActualizaDetCanje;
      If Not xSigueGrab Then
      Begin
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   // Fin Calcula Retencion del IGV

      ////////////////////////////////////////////////////////////////////
      // se realiza el loop por tratarse de DETRACCION
      If xDTRPorc > 0 Then
      Begin
         DMTE.cdsEgrCaja.Filter := '';
         DMTE.cdsEgrCaja.Filtered := False;
         DMTE.cdsEgrCaja.Close;
         xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, CLAUXID, PROV, PROVRUC, '
            + '          ECFCOMP, ECFEMICH, ECFPAGOP, ECFCOBCH, FPAGOID, DOCID, '
            + '          ECNODOC, TMONID, ECTCAMB, ECMTOORI, ECMTOLOC, ECMTOEXT, '
            + '          BANCOID, CCBCOID, ECNOCHQ, ECGIRA, CPTOID, CUENTAID, ECGLOSA, '
            + '          ECLOTE, ECELABO, ECAPROB, ECESTADO, ECCONTA, ECUSER, ECFREG, '
            + '          ECHREG, ECANO, ECMM, ECDD, ECSS, ECSEM, ECTRI, ECAASS, ECAASEM, '
            + '          ECAATRI, FLAGVAR, EC_PROCE, ECOPAGO, TDIARIO2, ECNOCOMP2, '
            + '          ECANOMM2, EC_IE, ECCHQEMI, USERRESP, EQUIID, ECCHKEST, '
            + '          ECPERNDOC, ECPERREC, TIPDOCCOD, PERID, ECFENTR, ECCONSOLID, '
            + '          ECMTCON, ECFCV, ECCOBLOC, ECMTDIF, ECCOBEXT, ECDEVLOC, '
            + '          ECDEVEXT, FEXTCHQ, FLUEID, ECCONING, ECNOREPO, CLAUXID1, '
            + '          AUXID, PROV1, CCBCOVOUCH, PRVBANCOID, PRVCCBCOID, ECSALMN, '
            + '          ECSALME, CAJARETIGV, FDOFIJJUST, GCONCID, TIPDET, ECNOCOMPR, '
            + '          CNTCOMPROB, KEYVALE, FLGREN '
            + '     From CAJA302 '
            + '    where CIAID    =' + QuotedStr(dblcCia.Text)
            + '      and ECANOMM  =' + QuotedStr(edtPeriodo.Text)
            + '      and TIPDET IN (''TO'',''I4'') '
            + '      and ECNOCOMPR =' + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString);
         DMTE.cdsEgrCaja.DataRequest(xSQL);
         DMTE.cdsEgrCaja.Open;
         If DMTE.cdsEgrCaja.RecordCount > 0 Then
         Begin
// Inicio HPC_201803_CAJA
// Se debe refrescar el CDS
            DMTE.cdsEgrCaja.first;
            While Not DMTE.cdsEgrCaja.Eof Do
            Begin
              DMTE.cdsEgrCaja.Edit;
              DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'C';
              DMTE.cdsEgrCaja.FieldByName('ECUSER').Value := DMTE.wUsuario; // usuario que registra
              DMTE.cdsEgrCaja.FieldByName('ECFREG').Value := DateS; // fecha que registra Usuario
              DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time; // Hora de Registro de Usuario
              DMTE.cdsEgrCaja.post;
              DMTE.cdsEgrCaja.next;
            end;
            DMTE.cdsEgrCaja.first;
// Fin HPC_201803_CAJA
            xSQL := 'Update CAJA302 '
               + '      Set ECESTADO=''C'', '
               + '          ECUSER=' + quotedstr(DMTE.wUsuario) + ', '
               + '          ECFREG=trunc(sysdate), '
               + '          ECHREG=sysdate, '
               + '          CAJARETIGV=''N'' '
               + '    where CIAID    =' + QuotedStr(dblcCia.Text)
               + '      and ECANOMM  =' + QuotedStr(edtPeriodo.Text)
               + '      and TIPDET IN (''TO'',''I4'') '
               + '      and ECNOCOMPR =' + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString);
            Try
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('Error al intentar grabar la cabecera del Egreso (TO/I4');
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               Exit;
            End;
         End;
      End
      Else
      Begin
         DMTE.cdsEgrCaja.Edit;
         DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'C';
         DMTE.cdsEgrCaja.FieldByName('ECUSER').Value := DMTE.wUsuario; // usuario que registra
         DMTE.cdsEgrCaja.FieldByName('ECFREG').Value := DateS; // fecha que registra Usuario
         DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time; // Hora de Registro de Usuario
         If xRetencion Then
            DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString := 'S'
         Else
            DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString := 'N';
         DMTE.cdsEgrCaja.post;
         xSQL := 'Update CAJA302 '
            + '      Set ECESTADO=''C'', '
            + '          ECUSER=' + quotedstr(DMTE.wUsuario) + ', '
            + '          ECFREG=trunc(sysdate), '
            + '          ECHREG=sysdate, '
            + '          CAJARETIGV=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString)
            + '    where CIAID    =' + QuotedStr(dblcCia.Text)
            + '      and ECANOMM  =' + QuotedStr(edtPeriodo.Text)
            + '      and TDIARID  =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
            + '      and ECNOCOMP =' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error al intentar grabar la cabecera del Egreso (TO/I4');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            Exit;
         End;
      End;

      // ¿Actualizar en este punto DMTE.cdsRegCxP (CAJA301)?

      //SaldosAux;
      If wBcoTipCta = 'C' Then
      Begin
         ////////////////////////////////////////////////////////////////////
         // se realiza el loop por tratarse de DETRACCION
         If xDTRPorc > 0 Then
         Begin
            DMTE.cdsEgrCaja.First;
            While Not DMTE.cdsEgrCaja.Eof Do
            Begin
               DMTE.ActSaldosCaja(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, DMTE.cdsEgrCaja.FieldByName('TMONID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString, 'E', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
               If Not xSigueGrab Then
               Begin
                  DMTE.DCOM1.AppServer.RetornaTransaccion;
                  Exit;
               End;
               DMTE.cdsEgrCaja.Next;
            End;
         End
         Else
         Begin
            DMTE.ActSaldosCaja(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, DMTE.cdsEgrCaja.FieldByName('TMONID').AsString,
               DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
               DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString, 'E', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
            If Not xSigueGrab Then
            Begin
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               Exit;
            End;
         End;
      End
      Else
      Begin
         If wBcoTipCta = 'B' Then
         Begin
            ////////////////////////////////////////////////////////////////////
            // se realiza el loop por tratarse de DETRACCION
            If xDTRPorc > 0 Then
            Begin
               DMTE.cdsEgrCaja.First;
               While Not DMTE.cdsEgrCaja.Eof Do
               Begin
                  If DMTE.cdsEgrCaja.FieldByName('TIPDET').AsString = 'I4' Then
                  Begin // por ser el registro del monto de la DETRACCION
                     wMonto := DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString;
                     wMoneda := DMTE.wTMonLoc;
                  End
                  Else
                  Begin
                     wMonto := DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString;
                     wMoneda := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
                  End;
                  DMTE.ActSaldosBancos(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, wMoneda,
                     DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
                     DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString, wMonto,
                     'E', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
                  If Not xSigueGrab Then
                  Begin
                     DMTE.DCOM1.AppServer.RetornaTransaccion;
                     Exit;
                  End;
                  DMTE.cdsEgrCaja.Next;
               End;
            End
            Else
            Begin
               DMTE.ActSaldosBancos(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, DMTE.cdsEgrCaja.FieldByName('TMONID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString, DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString,
                  'E', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
               If Not xSigueGrab Then
               Begin
                  DMTE.DCOM1.AppServer.RetornaTransaccion;
                  Exit;
               End;
            End;
         End;
      End;

      DMTE.DCOM1.AppServer.GrabaTransaccion;

      z2bbtnSumatClick(sender); // Al salir hay que totalizar

      dbgPendientes.ReadOnly := True;
      dbgDocPago.ReadOnly := True;
      dbgOtros.ReadOnly := True;

      z2bbtnCont.Enabled := True;
      z2bbtnAnula.Enabled := True;
      z2bbtnSube.Enabled := False;
      z2bbtnGraba.Enabled := False;
      z2bbtnCancelado.Enabled := False;
      z2bbtnCancel2.Enabled := False;
      dbgOtrosIButton.Enabled := False;
      lblEstado.Caption := 'Cancelado          ';

      If dblcdCtaCte.text <> '' Then
         Z2bbtnNotaAbono.Enabled := True
      Else
         Z2bbtnNotaAbono.Enabled := False;

      If dblcCCBco.Text <> '' Then
         Z2bbtChqVouch.Visible := True
      Else
         Z2bbtChqVouch.Visible := False;

      beep;
      MessageDlg('Datos Actualizados', mtCustom, [mbOk], 0);
   End;
End;

{******************************************************************************}

Function TFPagoGlobal2.ValidaCampo: Boolean;
Var
   xWhere, aux: String;
Begin
   Result := True;

   If length(DMTE.cdsRegCxP.FieldByName('CPNOREG').Value) = 0 Then
   Begin //No Registro
      ShowMessage('Falta No Registro');
      Result := False;
      exit;
   End
   Else
   Begin
      If length(DMTE.cdsRegCxP.FieldByName('CPNOREG').Value) < 6 Then
      Begin
         ShowMessage('Codigo de Registro Errado');
         Result := False;
         exit;
      End;
   End;
   If length(DMTE.cdsRegCxP.FieldByName('DOCID2').Value) = 0 Then
   Begin //Tipo de Documento
      ShowMessage('Falta Tipo de Documento');
      Result := False;
      exit;
   End
   Else
   Begin
      xWhere := 'DOCID=' + '''' + DMTE.cdsRegCxP.FieldByName('DOCID2').Value + '''';
      aux := DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCDES', xWhere, 'DOCDES');
      If length(aux) = 0 Then
      Begin
         ShowMessage('Codigo de Tipo de Documento Errado');
         Result := False;
         exit;
      End;
   End;

   If DMTE.cdsRegCxP.FieldByName('CPSERIE').Value = '' Then
   Begin //Serie
      ShowMessage('Falta Serie');
      Result := False;
      exit;
   End;

   If DMTE.cdsRegCxP.FieldByName('CPNODOC').Value = '' Then
   Begin //No Documento
      ShowMessage('Falta Nro. de Documento');
      Result := False;
      exit;
   End;

   If length(DMTE.cdsRegCxP.FieldByName('TMONID').Value) = 0 Then
   Begin //Tipo de Moneda
      ShowMessage('Falta Tipo de Moneda');
      Result := False;
      exit;
   End
   Else
   Begin
      xWhere := 'TMONID=' + '''' + DMTE.cdsRegCxP.FieldByName('TMONID').Value + '''';
      aux := DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
      If length(aux) = 0 Then
      Begin
         ShowMessage('Codigo de Tipo de Moneda Errado');
         Result := False;
         exit;
      End;
   End;

   If DMTE.cdsRegCxP.FieldByName('DETCDOC').Value <= 0 Then
   Begin // Tipo de Cambio Detalle
      ShowMessage('Tipo de Cambio debe ser mayor que cero');
      Result := False;
      exit;
   End;

   If DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value <= 0 Then
   Begin //Importe
      ShowMessage('Importe debe ser mayor que cero');
      Result := False;
      exit;
   End;

   If DMTE.cdsRegCxP.FieldByName('CPTOID').Value = '' Then
   Begin //Concepto
      ShowMessage('Falta Concepto');
      Result := False;
      exit;
   End
   Else
   Begin // Cuenta
      aux := DMTE.cdsRegCxP.FieldByName('CUENTAID').Value;
      If length(aux) = 0 Then
      Begin
         ShowMessage('Codigo de Concepto Errado');
         Result := False;
         exit;
      End;
   End;

//Validación de centro de costo y auxiliares
   If (dblcdCCosto.Enabled) Then
   Begin //Centro de Costo
      If (length(DMTE.cdsRegCxP.FieldByName('CCOSID').Value) = 0) Then
      Begin
         ShowMessage('Falta Centro de Costo');
         Result := False;
         exit;
      End
      Else
      Begin
         xWhere := 'CCosID=' + '''' + DMTE.cdsRegCxP.FieldByName('CCOSID').Value + ''' AND CCOSACT=''S''';
         aux := DMTE.DisplayDescrip('prvTGE', 'TGE203', 'CCOSDES', xWhere, 'CCosDes');
         If length(aux) = 0 Then
         Begin
            ShowMessage('Codigo de Centro de Costo Errado');
            Result := False;
            exit;
         End;
      End;
   End;

   If (dblcClaseDet.Enabled) Then
   Begin

      If trim(dblcClaseDet.Text) = '' Then
      Begin
         ShowMessage('Ingrese Clase');
         Result := False;
         exit;
      End;

      If trim(dblcdAuxDet.Text) = '' Then
      Begin
         ShowMessage('Ingrese Auxiliar');
         Result := False;
         exit;
      End

   End;

   If DMTE.cdsRegCxP.FieldByName('CPFVCMTO').Value < DMTE.cdsRegCxP.FieldByName('CPFEMIS').Value Then
   Begin //Fecha de Vencimiento
      ShowMessage('Fecha de Vencimiento debe ser posterior a la Fecha de Emisión');
      Result := False;
      exit;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ConsisCancela(Var xConsis: boolean);
Var
   xRegAct: TBookMark;
   xSumImp, Suma: Double;
Begin
   xConsis := True;
   xSumImp := 0;

   xRegAct := DMTE.cdsRegCxP.GetBookmark;
   DMTE.cdsRegCxP.First;
   While Not DMTE.cdsRegCxP.Eof Do
   Begin
      If DMTE.cdsRegCxP.FieldByName('DEDH').Value = 'D' Then
         If DMTE.cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc Then
            xSumImp := xSumImp + strToCurr(stringreplace(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').DisplayText, ',', '', [rfReplaceAll]))
         Else
            xSumImp := xSumImp + strToCurr(stringReplace(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').DisplayText, ',', '', [rfReplaceAll]))
      Else
         If DMTE.cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc Then
            xSumImp := xSumImp - strToCurr(stringreplace(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').DisplayText, ',', '', [rfReplaceAll]))
         Else
            xSumImp := xSumImp - strToCurr(stringReplace(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').DisplayText, ',', '', [rfReplaceAll]));

      DMTE.cdsRegCxP.Next;
   End;
   DMTE.cdsRegCxP.GotoBookmark(xRegAct);
   DMTE.cdsRegCxP.FreeBookmark(xRegAct);

// Adicionamos el total de los Documentos Pagados
   xRegAct := DMTE.cdsDocPago.GetBookmark;
   DMTE.cdsDocPago.First;
   While Not DMTE.cdsDocPago.Eof Do
   Begin
      If DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString = DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString Then
      Begin
         If DMTE.cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc Then
            xSumImp := xSumImp + strToCurr(stringreplace(DMTE.cdsDocPago.FieldByName('DEMTOLOC').DisplayText, ',', '', [rfReplaceAll]))
         Else
            xSumImp := xSumImp + strToCurr(stringReplace(DMTE.cdsDocPago.FieldByName('DEMTOEXT').DisPlayText, ',', '', [rfReplaceAll]));
      End;
      DMTE.cdsDocPago.Next;
   End;
   DMTE.cdsDocPago.GotoBookmark(xRegAct);
   DMTE.cdsDocPago.FreeBookmark(xRegAct);

// calcula los montos x retención de IGV.
   If dblcTMon.Text = DMTE.wTMonLoc Then
      xSumImp := xSumImp - xRetLoc
   Else
      xSumImp := xSumImp - xRetExt;

   xSumImp := DMTE.FRound(xSumImp, 15, 2);

// se realiza la sumatoria por tratarse de DETRACCION
   Suma := 0;
   If xDTRPorc > 0 Then
   Begin
      If DMTE.cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc Then
         Suma := Suma + StrToCurr(FloatToStrF(DMTE.cdsEgrCaja.fieldbyname('ECMTOLOC').AsFloat, ffFixed, 10, 2))
      Else
         Suma := Suma + StrToCurr(FloatToStrF(DMTE.cdsEgrCaja.fieldbyname('ECMTOEXT').AsFloat, ffFixed, 10, 2));
   End
   Else // por NO tratarse de DETRACCION
   Begin
      If DMTE.cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc Then
         Suma := StrToCurr(FloatToStrF(DMTE.cdsEgrCaja.fieldbyname('ECMTOLOC').AsFloat, ffFixed, 10, 2))
      Else
         Suma := StrToCurr(FloatToStrF(DMTE.cdsEgrCaja.fieldbyname('ECMTOEXT').AsFloat, ffFixed, 10, 2));
   End;

   Suma := DMTE.FRound(Suma, 15, 2);

   If xSumImp <> Suma Then
   Begin
      xConsis := False;
      If Suma > xSumImp Then
         ShowMessage('Suma = ' + FloatToStrF(Suma, ffFixed, 15, 2) + chr(13)
            + 'SumaImp = ' + FloatToStrF(xSumImp, ffFixed, 15, 2) + chr(13)
            + 'El Monto a Pagar es mayor que el Provisionado')
      Else
         ShowMessage('Suma = ' + FloatToStrF(Suma, ffFixed, 15, 2) + chr(13)
            + 'SumaImp = ' + FloatToStrF(xSumImp, ffFixed, 15, 2) + chr(13)
            + 'El Monto a Pagar es menor que el Provisionado');
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Contab_Haber;
Var
   xSQL: String;
   xWhere: String;
Begin
  //CALCULAR EL MONTO RETENIDO
   xMtoTotalHL := 0;
   xMtoTotalHE := 0;
   bMayorQueTasa := False;
   bLetra := False;
   DMTE.cdsDocPago.DisableControls;

// condicionado para tratar la DETRACCION
   If (xDTRPorc = 0) And (vYanoRetencion = 'N') Then // si no hay DETRACCION
   Begin
      DMTE.cdsDocPago.First;
      While Not DMTE.cdsDocPago.Eof Do
      Begin
         Contab_HaberProc1;
         DMTE.cdsDocPago.Next
      End;
   End
   Else // si hay DETRACCION
   Begin
      DMTE.cdsDocPago.First;
      While Not DMTE.cdsDocPago.Eof Do
      Begin
         Contab_HaberProc1;
         DMTE.cdsDocPago.Next
      End;
   End;

   DMTE.cdsDocPago.EnableControls;

   If (xDTRPorc > 0) And (DMTE.cdsDocPago.FieldByName('TIPDET').AsString = 'I4') Then // si no hay DETRACCION
   Else
   Begin
      DMTE.cdsRegCxP.DisableControls;
      DMTE.cdsRegCxP.First;
      While Not DMTE.cdsRegCxP.EOF Do
      Begin
         If (DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime >= DMTE.xTasaFec) And
            (DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCRETIGV', 'DOCMOD=''CXP'' AND DOCID=' + QuotedStr(DMTE.cdsRegCxP.FieldByName('DOCID2').AsString), 'DOCRETIGV') = 'S') And
            (lblSujetoRetencion.visible) Then
         Begin
         End;

         If DMTE.cdsRegCxP.FieldByName('DEDH').AsString = 'D' Then
         Begin
            xMtoTotalL := xMtoTotalL + DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
            xMtoTotalE := xMtoTotalE + DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
         End
         Else
         Begin
            xMtoTotalHL := xMtoTotalHL + DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
            xMtoTotalHE := xMtoTotalHE + DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
         End;

         DMTE.cdsRegCxP.Next;
      End;
      DMTE.cdsRegCxP.EnableControls;
   End;

   If (bLetra) And (DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCRETIGV', 'DOCMOD=''CXP'' AND DOCID=' + QuotedStr(DMTE.sLet), 'DOCRETIGV') = 'S') Then
   Begin
      If xMtoL <= 0 Then
      Begin
         xMtoL := xMtoTotalL;
         xMtoE := xMtoTotalE;
      End;
      xMtoRetL := 0;
      xMtoRetE := 0;
   End
   Else //SI SON FACTURAS
   Begin
      If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'C' Then
      Begin
         xMtoRetL := 0;
         xMtoRetE := 0;
         xSQL := 'Select RETSERIE, RETNUMERO, FECPAGO, '
            + '          sum(MTORETLOC) RETLOC, sum(MTORETEXT) RETEXT '
            + '     From CNT320 '
            + '    where CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
            + '      and ANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
            + '      and TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
            + '      and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
            + '    group by RETSERIE, RETNUMERO, FECPAGO';
         DMTE.cdsQry4.Close;
         DMTE.cdsQry4.Datarequest(xSQL);
         DMTE.cdsQry4.Open;
         While Not DMTE.cdsQry4.Eof Do
         Begin
            xMtoRetL := DMTE.FRound(xMtoRetL + DMTE.cdsQry4.Fieldbyname('RETLOC').AsFloat, 15, 2);
            xMtoRetE := DMTE.FRound(xMtoretE + DMTE.cdsQry4.Fieldbyname('RETEXT').AsFloat, 15, 2);
            DMTE.cdsQry4.Next;
         End;
      End
      Else
      Begin
         If (bMayorQueTasa) Then
         Begin
            xMtoRetL := DMTE.FRound(xMtoL * DMTE.xTasaPorce / 100, 15, 2);
            xMtoRetE := DMTE.FRound(xMtoE * DMTE.xTasaPorce / 100, 15, 2);
         End
         Else
         Begin
            xMtoL := xMtoTotalL;
            xMtoE := xMtoTotalE;
            xMtoRetL := 0;
            xMtoRetE := 0;
         End;
      End;
   End;
   DMTE.cdsCntCaja.Insert;
   DMTE.cdsCntCaja.FieldByName('CIAID').Value := DMTE.cdsEgrcaja.FieldByName('CIAID').Value;
   DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').Value := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCID').Value := DMTE.cdsEgrCaja.FieldByName('DOCID').AsString;
   DMTE.DisplayDescrip('prvTGE', 'TGE112', 'FCHQ,FCBCO', 'FPAGOID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString), 'FCHQ');
   If ((DMTE.cdsQry.fieldbyname('FCHQ').AsString = '1') Or (DMTE.cdsQry.fieldbyname('FCHQ').AsString = 'S'))
      And (DMTE.cdsQry.fieldbyname('FCBCO').AsString = 'S') Then
      DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString
   Else
      DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString;

   DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('CPTOID').Value := DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString;
   DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
   DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;

   If xMsgContabiliza = '0' Then
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.FRound(xMtoTotalL - xMtoTotalHL - xMtoRetL, 15, 2)
   Else
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := xMTODETLOC;

   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.FRound(xMtoTotalE - xMtoTotalHE - xMtoRetE, 15, 2);

   If DMTE.cdsCntCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat
   Else
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat;

   nImpDetraccion := DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat;

   DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value := 'S';
   DMTE.cdsCntCaja.FieldByName('DCUSER').Value := DMTE.wUsuario;
   DMTE.cdsCntCaja.FieldByName('DCFREG').Value := Date;
   DMTE.cdsCntCaja.FieldByName('DCHREG').Value := Time;
   DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
   DMTE.cdsCntCaja.FieldByName('FCAB').AsString := '1';
   DMTE.cdsCntCaja.fieldbyname('DOCMOD').AsString := FRegistro.xModulo;
   DMTE.cdsCntCaja.fieldbyname('DCTCAMPR').AsString := DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsString;
   DMTE.cdsCntCaja.fieldbyname('DCTCAMPA').AsString := DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsString;

   xNReg := xNReg + 1;
   DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger := xNReg;
   DMTE.cdsCntCaja.Post;

   xSQL := 'Insert into CAJA304(CIAID, TDIARID, ECANOMM, ECNOCOMP, DCLOTE, DOCID, DCNODOC, ECFCOMP, '
      + '                       DCFEMIS, DCFVCMTO, CPTOID, CUENTAID, DCDH, TMONID, DCMTOLO, DCMTOEXT, '
      + '                       DCMTOORI, DCFLACDR, DCUSER, DCFREG, DCHREG, DCANO, DCMM, DCDD, DCSS, '
      + '                       DCSEM,DCTRI, DCAASS, DCAASEM, DCAATRI, DCGLOSA, FCAB, DOCMOD, DCTCAMPR, '
      + '                       DCTCAMPA, NREG)'
      + '   Values('
      + quotedstr(DMTE.cdsCntCaja.FieldByName('CIAID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('TDIARID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString) + ', '
      + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime)) + ', '
      + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime)) + ', '
      + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime)) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('CPTOID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDH').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('TMONID').AsString) + ', '
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat) + ', '
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat) + ', '
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCUSER').AsString) + ', '
      + ' trunc(Sysdate), '
      + ' Sysdate, '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCANO').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCMM').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDD').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSS').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSEM').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCTRI').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASS').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('FCAB').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.fieldbyname('DOCMOD').AsString) + ', '
      + floattostr(DMTE.cdsCntCaja.fieldbyname('DCTCAMPR').AsFloat) + ', '
      + floattostr(DMTE.cdsCntCaja.fieldbyname('DCTCAMPA').AsFloat) + ', '
      + inttostr(DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger) + ') ';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);                               // 2
   Except
      ShowMessage('Error en la Contabilización (Contab_Haber)');
      xSigueGrab := False;
      Exit;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Contab_RegCxP;
Var
   xSQL: String;
   xMTOCNTLOC, xMTOCNTEXT: double;
Begin
   DMTE.cdsCntCaja.Insert;
   DMTE.cdsCntCaja.FieldByName('CIAID').AsString := DMTE.cdsRegCxP.FieldByName('CIAID').AsString;
   DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsRegCxP.FieldByName('TDIARID').AsString;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
   DMTE.cdsCntCaja.FieldByName('DOCID').AsString := DMTE.cdsRegCxP.FieldByName('DOCID2').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString := DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString;
   DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsRegCxP.FieldByName('CPFVCMTO').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := DMTE.cdsRegCxP.FieldByName('CPTOID').AsString;
   DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString;
   DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := DMTE.cdsRegCxP.FieldByName('PROV').AsString;
   DMTE.cdsCntCaja.FieldByName('CCOSID').AsString := DMTE.cdsRegCxP.FieldByName('CCOSID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDH').AsString := DMTE.cdsRegCxP.FieldByName('DEDH').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
   DMTE.cdsCntCaja.FieldByName('TMONID').AsString := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
   If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wtMonLoc Then
   Begin
      If DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wtMonLoc Then
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
      //   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat, 15, 2);
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat, 15, 2);
      //   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat, 15, 2);
      End
      Else
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat, 15, 2);
      //   DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat, 15, 2);
      End;
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat
   End
   Else
   Begin
      If DMTE.cdsRegCxP.FieldByName('TMONID').AsString = dblcTMon.Text Then
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat, 15, 2);
      //   DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat, 15, 2);
      End
      Else
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat, 15, 2);
      //   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat, 15, 2);
      End;
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat
   End;

   If DMTE.cdsRegCxP.FieldByName('FLAGVAR').AsString = 'R' Then
      DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Retencion del I.G.V.'
   Else
   Begin
      If DMTE.vRN_GLOSADET = 'S' Then
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsRegCxP.fieldBYName('DEGLOSA').AsString
      Else
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
   End;

   DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCUSER').AsString := DMTE.wUsuario;
   DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime := Date;
   DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime := Time;
   DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;

   xNReg := xNReg + 1;
   DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger := xNReg;
   DMTE.cdsCntCaja.Post;

   xSQL := 'Insert into CAJA304(CIAID, TDIARID, ECANOMM, ECNOCOMP, DCLOTE, DOCMOD, DOCID, '
      + '                       DCSERIE, DCNODOC, ECFCOMP, DCFEMIS, DCFVCMTO, CPTOID, CUENTAID, '
      + '                       CLAUXID, DCAUXID, CCOSID, DCDH, DCTCAMPA, DCTCAMPR, TMONID, '
      + '                       DCMTOLO, DCMTOEXT, DCMTOORI, DCGLOSA, DCFLACDR, DCUSER, DCFREG, '
      + '                       DCHREG, DCANO, DCMM, DCDD, DCSS, DCSEM, DCTRI, DCAASS, DCAASEM, '
      + '                       DCAATRI, NREG)'
      + '   Values('
      + quotedstr(DMTE.cdsCntCaja.FieldByName('CIAID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('TDIARID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString) + ', '
      + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime)) + ', '
      + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime)) + ', '
      + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime)) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('CPTOID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('CCOSID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDH').AsString) + ', '
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat) + ', '
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('TMONID').AsString) + ', '
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat) + ', '
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat) + ', '
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCUSER').AsString) + ', '
      + ' trunc(Sysdate), '
      + ' Sysdate, '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCANO').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCMM').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDD').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSS').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSEM').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCTRI').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASS').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString) + ', '
      + inttostr(DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger) + ') ';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error en Contabilización (Contab_RegCxP)');
      xSigueGrab := False;
      Exit;
   End;
End;

Procedure TFPagoGlobal2.Contab_DocPago;
Var
   xWhere, xSQL: String;
   xFactor: Integer;
// Inicio HPC_201701_CAJA  Modificar el cálculo de la diferencia de cambio
   xMTOCNTLOC_OTRO: Double;
// Fin    HPC_201701_CAJA  Modificar el cálculo de la diferencia de cambio
Begin
// Inicio HPC_201701_CAJA  Modificar el cálculo de la diferencia de cambio
   xWhere := ' CIAID=' + quotedstr(DMTE.cdsDocPago.fieldbyname('CIAID2').AsString)
      + ' and CPANOMES=' + quotedstr(DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString)
      + ' and TDIARID=' + quotedstr(DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString)
      + ' and CPNOREG=' + quotedstr(DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString);
   If DMTE.RecuperarDatos('CXP301', 'TMONID', xWhere) Then
      xMONID_PROV := DMTE.cdsRec.fieldbyname('TMONID').AsString
   Else
   Begin
      ShowMessage('Error en la recuperación del documento Provisionado');
      xSigueGrab := False;
   End;

   DMTE.cdsCntCaja.Insert;
   DMTE.cdsCntCaja.FieldByName('CIAID').AsString := DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
   DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
   DMTE.cdsCntCaja.FieldByName('DOCID').AsString := DMTE.cdsDocPago.FieldByName('DOCID2').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString := DMTE.cdsDocPago.FieldByName('CPSERIE').AsString;
   DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsDocPago.FieldByName('CPNODOC').AsString;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
// DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime;
// DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsDocPago.FieldByName('CPFVCMTO').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := DMTE.cdsDocPago.FieldByName('CPTOID').AsString;
   xWhere := 'CIAID=''' + DMTE.cdsDocPago.FieldByName('CIAID2').AsString + '''';
   If DMTE.cdsDocPago.FieldByName('CIAID2').AsString = '02' Then
      DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := DMTE.cdsDocPago.FieldByName('CUENTAID').AsString
   Else
      DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := DMTE.DisplayDescrip('prvTGE', 'CAJA103', 'CTADEBE', xWhere, 'CTADEBE');

   DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString;
   DMTE.cdsCntCaja.FieldByName('CCOSID').AsString := DMTE.cdsDocPago.FieldByName('CCOSID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('PROV').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat;
   DMTE.cdsCntCaja.FieldByName('TMONID').AsString := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;

   xFactor := 1;
   If DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat > 0 Then
      DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'D'
   Else
   Begin
      xFactor := -1;
      DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'H';
   End;

   If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
   Begin
      If xMONID_PROV = DMTE.cdsEgrCaja.FieldByName('TMONID').AsString Then
      Begin
         xMTOCNTLOC := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat * xFactor, 15, 2);
         xMTOCNTEXT := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat * xFactor, 15, 2);
         xMTOCNTLOC_OTRO:= xMTOCNTLOC;
      //   xMTOCNTEXT := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat * xFactor, 15, 2);
      End
      Else
      Begin
         xMTOCNTEXT := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * xFactor, 15, 2);
         xMTOCNTLOC_OTRO := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat * xFactor, 15, 2);
         xMTOCNTLOC := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat * xFactor, 15, 2);
      End;
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xMTOCNTLOC_OTRO;
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := xMTOCNTLOC_OTRO;
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
   End
   Else
   Begin
      If xMONID_PROV = DMTE.cdsEgrCaja.FieldByName('TMONID').AsString Then
      Begin
         xMTOCNTEXT := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * xFactor, 15, 2);
         xMTOCNTLOC_OTRO := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat * xFactor, 15, 2);
         xMTOCNTLOC := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat * xFactor, 15, 2);
      End
      Else
      Begin
         xMTOCNTLOC := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat * xFactor, 15, 2);
         xMTOCNTLOC_OTRO:= xMTOCNTLOC;
      //   xMTOCNTEXT := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat * xFactor, 15, 2);
         xMTOCNTEXT := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat * xFactor, 15, 2);
      End;
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xMTOCNTEXT;
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := xMTOCNTLOC_OTRO;
   End;

   xMTODETLOC := xMTODETLOC + DMTE.FRound(xMTOCNTLOC_OTRO, 15, 0);
// Fin HPC_201701_CAJA  Modificar el cálculo de la diferencia de cambio
   DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;

   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;

   xSQL := 'Select AUXNOMB '
      + '     from CNT201 '
      + '    Where CLAUXID=''' + DMTE.cdsDocPago.FieldByName('CLAUXID').AsString + ''' '
      + '      and AUXID=''' + DMTE.cdsDocPago.FieldByName('PROV').AsString + '''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;
   If length(DMTE.cdsQry.FieldByName('AUXNOMB').AsString) > 0 Then
      DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.FieldByName('AUXNOMB').AsString;

   xNReg := xNReg + 1;
   DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger := xNReg;
   DMTE.cdsCntCaja.Post;

   xSQL := 'Insert into CAJA304(CIAID, TDIARID, ECANOMM, ECNOCOMP, DCLOTE, '
      + '                       DOCMOD, DOCID, DCSERIE, DCNODOC, ECFCOMP, DCFEMIS, '
      + '                       DCFVCMTO, CPTOID, CUENTAID, CLAUXID, CCOSID, DCAUXID, '
      + '                       DCTCAMPA, DCTCAMPR, TMONID, DCDH, DCMTOORI, DCMTOLO, '
      + '                       DCMTOEXT, DCFLACDR, DCUSER, DCFREG, DCHREG, DCANO, '
      + '                       DCMM, DCDD, DCSS, DCSEM, DCTRI, '
      + '                       DCAASS, DCAASEM, DCAATRI, DCGLOSA, NREG) '
      + '   Values(' + quotedstr(DMTE.cdsCntCaja.FieldByName('CIAID').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('TDIARID').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCID').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString) + ','
      + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime)) + ','
      + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime)) + ','
      + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime)) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('CPTOID').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('CCOSID').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString) + ','
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat) + ','
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('TMONID').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDH').AsString) + ','
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat) + ','
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat) + ','
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCUSER').AsString) + ','
      + ' trunc(Sysdate), '
      + ' Sysdate, '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCANO').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCMM').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDD').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSS').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSEM').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCTRI').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASS').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString) + ','
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString) + ','
      + inttostr(DMTE.cdsCntCaja.FieldByName('NREG').AsInteger) + ')';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);                               // 1
   Except
      ShowMessage('Error al intentar grabar asiento contable (Contab_DocPago)');
      xSigueGrab := False;
      Exit;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Contab_DifCamDocPago;
Var
   xWhere, xSQL, xsql1: String;
   xFactor: Integer;
   xMtoLoc: Currency;
Begin
// Genera el registro por diferencia de cambio
   xSQL := 'TMONID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TMONID').AsString);
   xSQL1 := 'TMONID=' + quotedstr(DMTE.cdsDocPago.fieldbyname('TMONID').AsString);
   If (DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xSQL, 'TMON_LOC') <> 'L') And
      (DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xsql1, 'TMON_LOC') <> 'L') Then
   Begin
      If DMTE.cdsDocPago.FieldByName('DETCDOC').Value <> DMTE.cdsDocPago.FieldByName('DETCPAG').Value Then
      Begin
         If DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat > 0 Then
            xFactor := 1
         Else
         Begin
            xFactor := -1;
         End;

// Inicio HPC_201701_CAJA  Modificar el cálculo de la diferencia de cambio
         xMtoLoc := 0;
         If xMONID_PROV = DMTE.wTMonLoc Then
         Begin
            xMtoLoc := DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat - (xMTOCNTLOC * xFactor);
         End
         Else
         Begin
            xMtoLoc := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat,15 ,2)- DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat * DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat *xFactor, 15, 2);
            If DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat > DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat Then
            Begin
               xMtoLoc := DMTE.FRound(xMtoLoc * (-1) * xFactor, 15, 2);
            End
            Else
            Begin
               xMtoLoc := DMTE.FRound(xMtoLoc * xFactor, 15, 2);
            End;
         End;

         If xMtoLoc <> 0 Then
         Begin
            DMTE.cdsCntCaja.Insert;
            DMTE.cdsCntCaja.FieldByName('CIAID').Value := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
            DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
            DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
            DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
            DMTE.cdsCntCaja.FieldByName('DCLOTE').Value := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
            DMTE.cdsCntCaja.FieldByName('DOCID').Value := DMTE.cdsDocPago.FieldByName('DOCID2').Value;
            DMTE.cdsCntCaja.FieldByName('DOCMOD').Value := 'CXP';
            DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
            DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
            DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
            DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
            DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := DMTE.cdsDocPago.FieldByName('CUENTAID').Value;
            DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
            DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value; //Aqui se toma de la cabecera
            DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value := DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
            DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value := DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
            DMTE.cdsCntCaja.FieldByName('DCANO').Value := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
            DMTE.cdsCntCaja.FieldByName('DCMM').Value := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
            DMTE.cdsCntCaja.FieldByName('DCDD').Value := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
            DMTE.cdsCntCaja.FieldByName('DCSS').Value := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
            DMTE.cdsCntCaja.FieldByName('DCSEM').Value := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
            DMTE.cdsCntCaja.FieldByName('DCTRI').Value := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
            DMTE.cdsCntCaja.FieldByName('DCAASS').Value := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
            DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
            DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;

            xNReg := xNReg + 1;
            DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger := xNReg;
            DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value := 'S'; //Registro ya cuadrado
            DMTE.cdsCntCaja.FieldByName('DCUSER').Value := DMTE.wUsuario;
            DMTE.cdsCntCaja.FieldByName('DCFREG').Value := Date;
            DMTE.cdsCntCaja.FieldByName('DCHREG').Value := Time;
            DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
            If xMONID_PROV = DMTE.wTMonLoc Then
            Begin
               DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat - (xMTOCNTEXT * xFactor);
               DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat - (xMTOCNTLOC * xFactor);
               DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat - (xMTOCNTLOC * xFactor);

               If DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat > DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat Then
                  DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D'
               Else
                  DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
            End
            Else
            Begin
               DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := Abs(DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat - (xMTOCNTEXT * xFactor), 15, 2));
               DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := Abs(DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat - (xMTOCNTEXT * xFactor), 15, 2));
               DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := Abs(xMtoLoc);

               DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.wTMonLoc;

               If DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat > DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat Then
               Begin
                  If xFactor = 1 Then
                     DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H'
                  Else
                     DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
               End
               Else
               Begin
                  If DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat > 0 Then
                     DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D'
                  Else
                  Begin
                     DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
                  End;
               End;
            End;
            xWhere := 'CIAID=''' + DMTE.cdsDocPago.FieldByName('CIAID2').AsString + '''';
            If DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'D' Then
            Begin
               DMTE.cdsCntCaja.FieldByName('CPTOID').Value := wCptoPer;
               If DMTE.cdsDocPago.FieldByName('CIAID2').AsString = '02' Then
                  DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaPer
               Else
                  DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := DMTE.DisplayDescrip('prvTGE', 'CAJA103', 'CTADEBE', xWhere, 'CTADEBE');
               DMTE.cdsCntCaja.FieldByName('CCOSID').Value := wCCosDif;
               DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
            End
            Else
            Begin
               DMTE.cdsCntCaja.FieldByName('CPTOID').Value := wCptoGan;
               If DMTE.cdsDocPago.FieldByName('CIAID2').AsString = '02' Then
                  DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaGan
               Else
                  DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := DMTE.DisplayDescrip('prvTGE', 'CAJA103', 'CTADEBE', xWhere, 'CTADEBE');
               DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
            End;

            DMTE.cdsCntCaja.Post;

            xSQL := 'Insert into CAJA304(CIAID, TDIARID, ECANOMM, ECNOCOMP, DCLOTE, DOCID, '
               + '                       DOCMOD, DCSERIE, DCNODOC, ECFCOMP, DCFEMIS, DCFVCMTO, '
               + '                       CUENTAID, CLAUXID, DCAUXID, DCTCAMPA, DCTCAMPR, DCANO, '
               + '                       DCMM, DCDD, DCSS, DCSEM, DCTRI, DCAASS, DCAASEM, '
               + '                       DCAATRI, NREG, DCFLACDR, DCUSER, DCFREG, DCHREG, '
               + '                       TMONID, DCMTOEXT, DCMTOORI, DCMTOLO, DCDH, CPTOID, '
               + '                       CCOSID, DCGLOSA) '
               + '   Values(' + quotedstr(DMTE.cdsCntCaja.FieldByName('CIAID').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('TDIARID').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCID').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString) + ','
               + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime)) + ','
               + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime)) + ','
               + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime)) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString) + ','
               + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat) + ','
               + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCANO').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCMM').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDD').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSS').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSEM').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCTRI').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASS').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString) + ','
               + Inttostr(DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCUSER').AsString) + ','
               + ' trunc(Sysdate), '
               + ' Sysdate, '
               + quotedstr(DMTE.cdsCntCaja.FieldByName('TMONID').AsString) + ','
               + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat) + ','
               + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat) + ','
               + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDH').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('CPTOID').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('CCOSID').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString) + ')';
            Try
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('Error en la Contabilización de diferencia por tipo de Cambio');
               xSigueGrab := False;
               Exit;
            End;
         End; // xMtoLoc<>0
// Fin HPC_201701_CAJA  Modificar el cálculo de la diferencia de cambio
      End; // DMTE.cdsDocPago.FieldByName('DETCDOC').Value <> DMTE.cdsDocPago.FieldByName('DETCPAG').Value
   End; // (DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xSQL, 'TMON_LOC') <> 'L')
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Contab_DifCamDocPago2;
Var
   xSQL, xsql1: String;
Begin
// GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   xSQL := 'TMONID=' + quotedstr(dblcTMon.Text);
   If (DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xsql, 'TMON_LOC') <> 'L') Or
      (DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xsql1, 'TMON_LOC') <> 'L') Then
   Begin
      If DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat <> DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat Then
      Begin
         DMTE.cdsCntCaja.Insert;
         DMTE.cdsCntCaja.FieldByName('CIAID').AsString := DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
         DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
         DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
         DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
         DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
         DMTE.cdsCntCaja.FieldByName('DOCID').AsString := DMTE.cdsDocPago.FieldByName('DOCID2').AsString;
         DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
         DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString := DMTE.cdsDocPago.FieldByName('CPSERIE').AsString;
         DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsDocPago.FieldByName('CPNODOC').AsString;
         DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := DMTE.cdsDocPago.FieldByName('CUENTAID').AsString;
         DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('PROV').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
         DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;

         xNReg := xNReg + 1;
         DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger := xNReg;
         DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
         DMTE.cdsCntCaja.FieldByName('DCUSER').AsString := DMTE.wUsuario;
         DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime := Date;
         DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime := Time;
         DMTE.cdsCntCaja.FieldByName('TMONID').AsString := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
         If xMONID_PROV = DMTE.wTMonExt Then
         Begin
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat;
            DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'H';
            DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := wCptoGan;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := wCtaGan;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
         End;
         DMTE.cdsCntCaja.Post;

         xSQL := 'Insert into CAJA304(CIAID, TDIARID, ECANOMM, ECNOCOMP, DCLOTE, DOCID,'
            + '                       DOCMOD, DCSERIE, DCNODOC, ECFCOMP, DCFEMIS, DCFVCMTO,'
            + '                       CUENTAID, CLAUXID, DCAUXID, DCTCAMPA, DCTCAMPR, DCANO, '
            + '                       DCMM, DCDD, DCSS, DCSEM, DCTRI, DCAASS, DCAASEM, DCAATRI, '
            + '                       NREG, DCFLACDR, DCUSER, DCFREG, DCHREG, TMONID ';
         If xMONID_PROV = DMTE.wTMonExt Then
         Begin
            xSQL := xSQL + ', DCMTOLO, DCDH, CPTOID, CUENTAID, DCGLOSA'
         End;
         xSQL := xSQL + ') '
            + '   Values('
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CIAID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TDIARID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime)) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime)) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime)) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCANO').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCMM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDD').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSS').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSEM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCTRI').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASS').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString) + ', '
            + inttostr(DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCUSER').AsString) + ', '
            + ' trunc(sysdate), '
            + ' Sysdate, '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TMONID').AsString);
         If xMONID_PROV = DMTE.wTMonExt Then
         Begin
            xSQL := xSQL + ', '
               + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDH').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('CPTOID').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString)
         End;
         xSQL := xSQL + ') ';
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error en la Contabilización 1 (Contab_DifCamDocPago2)');
            xSigueGrab := False;
            Exit;
         End;
      //
         DMTE.cdsCntCaja.Insert;
         DMTE.cdsCntCaja.FieldByName('CIAID').AsString := DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
         DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
         DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
         DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
         DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
         DMTE.cdsCntCaja.FieldByName('DOCID').AsString := DMTE.cdsDocPago.FieldByName('DOCID2').AsString;
         DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
         DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString := DMTE.cdsDocPago.FieldByName('CPSERIE').AsString;
         DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsDocPago.FieldByName('CPNODOC').AsString;
         DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := DMTE.cdsDocPago.FieldByName('CUENTAID').AsString;
         DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('PROV').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
         DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;

         xNReg := xNReg + 1;
         DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger := xNReg;
         DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
         DMTE.cdsCntCaja.FieldByName('DCUSER').AsString := DMTE.wUsuario;
         DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime := Date;
         DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime := Time;
         DMTE.cdsCntCaja.FieldByName('TMONID').AsString := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
         If xMONID_PROV = DMTE.wTMonExt Then
         Begin
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat;
            DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'D';
            DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := wCptoPer;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := wCtaPer;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
         End;
         DMTE.cdsCntCaja.Post;
         xSQL := 'Insert into CAJA304(CIAID, TDIARID, ECANOMM, ECNOCOMP, DCLOTE, DOCID,'
            + '                       DOCMOD, DCSERIE, DCNODOC, ECFCOMP, DCFEMIS, DCFVCMTO,'
            + '                       CUENTAID, CLAUXID, DCAUXID, DCTCAMPA, DCTCAMPR, DCANO, '
            + '                       DCMM, DCDD, DCSS, DCSEM, DCTRI, DCAASS, DCAASEM, DCAATRI, '
            + '                       DCFLACDR, DCUSER, DCFREG, DCHREG, TMONID ';
         If xMONID_PROV = DMTE.wTMonExt Then
         Begin
            xSQL := xSQL + ', DCMTOLO, DCDH, CPTOID, CUENTAID, DCGLOSA'
         End;
         xSQL := xSQL + ') '
            + '   Values('
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CIAID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TDIARID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime)) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime)) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime)) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCANO').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCMM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDD').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSS').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSEM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCTRI').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASS').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString) + ', '
            + inttostr(DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCUSER').AsString) + ', '
            + ' trunc(Sysdate), '
            + ' Sysdate, '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TMONID').AsString);
         If xMONID_PROV = DMTE.wTMonExt Then
         Begin
            xSQL := xSQL + ', '
               + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDH').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('CPTOID').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) + ','
               + quotedstr(DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString)
         End;
         xSQL := xSQL + ') ';
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error en la Contabilización 2 (Contab_DifCamDocPago2)');
            xSigueGrab := False;
            Exit;
         End;
      End
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Contab_DifCamRegCxP;
Var
   xDif_Camb: real;
   xSQL: String;
Begin
// GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   xSQL := 'TMONID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TMONID').AsString);
   If DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xsql, 'TMON_LOC') <> 'L' Then
   Begin
      If DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat <> DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat Then
      Begin
         DMTE.cdsCntCaja.Insert;
         DMTE.cdsCntCaja.FieldByName('CIAID').AsString := DMTE.cdsRegCxP.FieldByName('CIAID').AsString;
         DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsRegCxP.FieldByName('TDIARID').AsString;
         DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
         DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
         DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
         DMTE.cdsCntCaja.FieldByName('DOCID').AsString := DMTE.cdsRegCxP.FieldByName('DOCID2').AsString;
         DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
         DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString := DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString;
         DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString;
         DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('PROV').AsString;
         DMTE.cdsCntCaja.FieldByName('CCOSID').AsString := DMTE.cdsRegCxP.FieldByName('CCOSID').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
         DMTE.cdsCntCaja.FieldByName('DCUSER').AsString := DMTE.wUsuario;
         DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime := Date;
         DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime := Time;
         DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
         DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
         DMTE.cdsCntCaja.FieldByName('TMONID').AsString := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;

         xNReg := xNReg + 1;
         DMTE.cdsCntCaja.FieldByName('NREG').AsInteger := xNReg;

         If DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wtMonLoc Then
         Begin //Provision en Mon.Local
            xDif_Camb := abs(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat -
               DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat); //En Mon.Ext.
            DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xDif_Camb;

            If DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat > DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat Then
               DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'D'
            Else
               DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'H';
         End
         Else
         Begin //Provision en Mon.Ext.
            xDif_Camb := abs(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat -
               DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat); //En Mon.Local
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := xDif_Camb;
            If DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat > DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat Then
               DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'H'
            Else
               DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'D';
         End;
         If DMTE.cdsCntCaja.FieldByName('DCDH').AsString = 'D' Then
         Begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := wCptoPer;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := wCtaPer;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
         End
         Else
         Begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := wCptoGan;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := wCtaGan;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
         End;
         If DMTE.cdsCntCaja.FieldByName('DCDH').AsString = 'D' Then
         Begin
            If DMTE.cdsCntCaja.fieldbyname('TMONID').AsString = DMTE.wtMonLoc Then
               DMTE.cdsCntCaja.fieldbyName('DEBE').AsFloat := DMTE.cdsCntCaja.fieldbyName('DCMTOLO').AsFloat
            Else
               DMTE.cdsCntCaja.fieldbyName('DEBE').AsFloat := DMTE.cdsCntCaja.fieldbyName('DCMTOEXT').AsFloat;
         End
         Else
         Begin
            If DMTE.cdsCntCaja.fieldbyname('TMONID').AsString = DMTE.wtMonLoc Then
               DMTE.cdsCntCaja.fieldbyName('HABER').AsFloat := DMTE.cdsCntCaja.fieldbyName('DCMTOLO').AsFloat
            Else
               DMTE.cdsCntCaja.fieldbyName('HABER').AsFloat := DMTE.cdsCntCaja.fieldbyName('DCMTOEXT').AsFloat;
         End;
         DMTE.cdsCntCaja.Post;

         xSQL := 'Insert into CAJA304(CIAID, TDIARID, ECANOMM, ECNOCOMP, DCLOTE, DOCID, DOCMOD, '
            + '                       DCSERIE, DCNODOC, ECFCOMP, DCFEMIS, DCFVCMTO, CLAUXID, DCAUXID, '
            + '                       CCOSID, DCTCAMPA, DCTCAMPR, DCFLACDR, DCUSER, DCFREG, DCHREG, '
            + '                       DCANO, DCMM, DCDD, DCSS, DCSEM, DCTRI, DCAASS, DCAASEM, DCAATRI, '
            + '                       TMONID, NREG, DCMTOEXT, DCDH, DCMTOLO, CPTOID, CUENTAID, DCGLOSA, '
            + '                       DEBE, HABER) '
            + '   Values('
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CIAID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TDIARID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime)) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime)) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime)) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CCOSID').AsString) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCUSER').AsString) + ', '
            + ' trunc(Sysdate), '
            + ' Sysdate, '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCANO').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCMM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDD').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSS').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSEM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCTRI').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASS').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TMONID').AsString) + ', '
            + inttostr(DMTE.cdsCntCaja.FieldByName('NREG').AsInteger) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDH').AsString) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CPTOID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString) + ', '
            + floattostr(DMTE.cdsCntCaja.fieldbyName('DEBE').AsFloat) + ', '
            + floattostr(DMTE.cdsCntCaja.fieldbyName('HABER').AsFloat) + ') ';
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error en la Contabilización (Contab_DifCamRegCxP)');
            xSigueGrab := False;
            Exit;
         End;
      End;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Contab_DifCamRegCxP2;
Var
   xSQL: String;
Begin
// GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   xSQL := 'TMONID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TMONID').AsString);
   If DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xsql, 'TMON_LOC') <> 'L' Then
   Begin
      If DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat <> DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat Then
      Begin
         DMTE.cdsCntCaja.Insert;
         DMTE.cdsCntCaja.FieldByName('CIAID').AsString := DMTE.cdsRegCxP.FieldByName('CIAID').AsString;
         DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsRegCxP.FieldByName('TDIARID').AsString;
         DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
         DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
         DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
         DMTE.cdsCntCaja.FieldByName('DOCID').AsString := DMTE.cdsRegCxP.FieldByName('DOCID2').AsString;
         DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
         DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString := DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString;
         DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString;
         DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('PROV').AsString;
         DMTE.cdsCntCaja.FieldByName('CCOSID').AsString := DMTE.cdsRegCxP.FieldByName('CCOSID').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
         DMTE.cdsCntCaja.FieldByName('DCUSER').AsString := DMTE.wUsuario;
         DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime := Date;
         DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime := Time;
         DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
         DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
         DMTE.cdsCntCaja.FieldByName('TMONID').AsString := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;

         xNReg := xNReg + 1;
         DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger := xNReg;

         If DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wtMonExt Then
         Begin //Provision en Mon.Local
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
            DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'H';
            DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := wCptoGan;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := wCtaGan;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
         End;
         DMTE.cdsCntCaja.Post;

         xSQL := 'Insert into CAJA304(CIAID, TDIARID, ECANOMM, ECNOCOMP, DCLOTE, DOCID, DOCMOD, '
            + '                       DCSERIE, DCNODOC, ECFCOMP, DCFEMIS, DCFVCMTO, CLAUXID, '
            + '                       DCAUXID, CCOSID, DCTCAMPA, DCTCAMPR, DCFLACDR, DCUSER, '
            + '                       DCFREG, DCHREG, DCANO, DCMM, DCDD, DCSS, DCSEM, DCTRI, '
            + '                       DCAASS, DCAASEM, DCAATRI, TMONID, NREG, DCMTOLO, DCDH, '
            + '                       CPTOID, CUENTAID, DCGLOSA) '
            + '   Values('
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CIAID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TDIARID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime)) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime)) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime)) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CCOSID').AsString) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCUSER').AsString) + ', '
            + ' trunc(Sysdate), '
            + ' Sysdate, '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCANO').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCMM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDD').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSS').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSEM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCTRI').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASS').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TMONID').AsString) + ', '
            + inttostr(DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDH').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CPTOID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString) + ') ';
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error en la Contabilización 1(Contab_DifCamRegCxP2)');
            xSigueGrab := False;
            Exit;
         End;

         DMTE.cdsCntCaja.Insert;
         DMTE.cdsCntCaja.FieldByName('CIAID').AsString := DMTE.cdsRegCxP.FieldByName('CIAID').AsString;
         DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsRegCxP.FieldByName('TDIARID').AsString;
         DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
         DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
         DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
         DMTE.cdsCntCaja.FieldByName('DOCID').AsString := DMTE.cdsRegCxP.FieldByName('DOCID2').AsString;
         DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
         DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString := DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString;
         DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString;
         DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('PROV').AsString;
         DMTE.cdsCntCaja.FieldByName('CCOSID').AsString := DMTE.cdsRegCxP.FieldByName('CCOSID').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
         DMTE.cdsCntCaja.FieldByName('DCUSER').AsString := DMTE.wUsuario;
         DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime := Date;
         DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime := Time;
         DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
         DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;

         xNReg := xNReg + 1;
         DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger := xNReg;

         DMTE.cdsCntCaja.FieldByName('TMONID').AsString := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;

         If DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wtMonExt Then
         Begin //Provision en Mon.Local
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
            DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'D';
            DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := wCptoPer;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := wCtaPer;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
         End;
         DMTE.cdsCntCaja.Post;

         xSQL := 'Insert into CAJA304(CIAID, TDIARID, ECANOMM, ECNOCOMP, DCLOTE, DOCID, DOCMOD, '
            + '                       DCSERIE, DCNODOC, ECFCOMP, DCFEMIS, DCFVCMTO, CLAUXID, '
            + '                       DCAUXID, CCOSID, DCTCAMPA, DCTCAMPR, DCFLACDR, DCUSER, DCFREG, '
            + '                       DCHREG, DCANO, DCMM, DCDD, DCSS, DCSEM, DCTRI, DCAASS, DCAASEM, '
            + '                       DCAATRI, TMONID, NREG, DCMTOLO, DCDH, CPTOID, CUENTAID, DCGLOSA) '
            + '   Values('
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CIAID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TDIARID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime)) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime)) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime)) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CCOSID').AsString) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCUSER').AsString) + ', '
            + ' trunc(Sysdate), '
            + ' Sysdate, '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCANO').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCMM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDD').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSS').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSEM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCTRI').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASS').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TMONID').AsString) + ', '
            + inttostr(DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDH').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CPTOID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString) + ') ';
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error en la Contabilización 2(Contab_DifCamRegCxP2)');
            xSigueGrab := False;
            Exit;
         End;
      End;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Contabiliza;
Var
   xRegAct: TBookMark;
   xSQL, xWhere: String;
Begin
   xSQL := 'Select CIAID '
      + '     from CAJA304 '
      + '    where CIAID=' + quotedstr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)
      + '      and ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
      + '      and TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
      + '      and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;
   If DMTE.cdsQry.RecordCount > 0 Then
   Begin
      xSQL := 'delete from CAJA304 '
         + '    where CIAID=' + quotedstr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)
         + '      and ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
         + '      and TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
         + '      and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en la eliminación de datos anteriores del Archivo operativo-Contable (CAJA304)');
         xSigueGrab := False;
         Exit;
      End;
   End;

   xMtoDetLoc := 0;
   xNReg := 0;
   xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, DCLOTE, DOCID, DCSERIE, '
      + '          DCNODOC, DCFEMIS, DCFVCMTO, CPTOID, CUENTAID, CLAUXID, DCAUXID, '
      + '          CCOSID, DCDH, DCTCAMPR, DCTCAMPA, TMONID, DCMTOORI, DCMTOLO, '
      + '          DCMTOEXT, DCESTADO, DCFLACDR, DCFLAAUT, DCUSER, DCFREG, DCHREG, '
      + '          DCANO, DCMM, DCDD, DCSS, DCSEM, DCTRI, DCAASS, DCAASEM, DCAATRI, '
      + '          FLAGVAR, ECFCOMP, DCGLOSA, ECMTCON, ECMTDIF, FCAB, DOCMOD, DOCMOD1, '
      + '          DOCMOD2, CAJAREG, NREG, CNTCOMPROB '
      + '     from CAJA304 '
      + '    Where CIAID='''' '
      + '      and ECANOMM='''' '
      + '      and TDIARID='''' '
      + '      and ECNOCOMP='''' ';
   DMTE.cdsCNTCaja.Close;
   DMTE.cdsCNTCaja.DataRequest(xSQL);
   DMTE.cdsCNTCaja.Open;

// GENERA LOS REGISTROS DE "DEBE" Y LOS REGISTROS POR DIF. DE CAMBIO desde Docs Pago
   DMTE.cdsDocPago.DisableControls;
   xRegAct := DMTE.cdsDocPago.GetBookmark;

// condicionado para tratar la DETRACCION
   If (xDTRPorc = 0) And (vYanoRetencion = 'N') Then
   Begin
      DMTE.cdsDocPago.First;
      While Not DMTE.cdsDocPago.Eof Do
      Begin
         ContabilizaProc1;
         If Not xSigueGrab Then
            Exit;

         DMTE.cdsDocPago.Next;
      End;
   End
   Else // si hay DETRACCION
   Begin
   // Cuando es el el voucher del pago de la detracción no se genera diferencia por tipo de cambio
      DMTE.cdsDocPago.First;
      While Not DMTE.cdsDocPago.Eof Do
      Begin
         ContabilizaProc1;
         If Not xSigueGrab Then
            Exit;

         DMTE.cdsDocPago.Next;
      End;

   End;
   DMTE.cdsDocPago.GotoBookmark(xRegAct);
   DMTE.cdsDocPago.FreeBookmark(xRegAct);
   DMTE.cdsDocPago.EnableControls;

   If (xDTRPorc > 0) And (DMTE.cdsDocPago.FieldByName('TIPDET').AsString = 'I4') Then // si no hay DETRACCION
   Else
   Begin
   // Genera los registros de "DEBE/HABER" y los registros por Dif. de Cambio desde Docs Registro
      DMTE.cdsRegCxP.DisableControls;
      xRegAct := DMTE.cdsRegCxP.GetBookmark;
      DMTE.cdsRegCxP.First; // OTROS DOCUMENTOS
      While Not DMTE.cdsRegCxP.Eof Do
      Begin
         Contab_RegCxP;
         If Not xSigueGrab Then
            Exit;

         If DMTE.wTipoDif = '' Then
         Begin
            Contab_DifCamRegCxP;
            If Not xSigueGrab Then
               Exit;
         End
         Else
         Begin
            If DMTE.cdsRegCxP.FieldByname('TMONID').AsString = DMTE.wTMonExt Then
            Begin
               Contab_DifCamRegCxP2;
               If Not xSigueGrab Then
                  Exit;
            End;
         End;
         DMTE.cdsRegCxP.Next;
      End;
      DMTE.cdsRegCxP.GotoBookmark(xRegAct);
      DMTE.cdsRegCxP.FreeBookmark(xRegAct);
      DMTE.cdsRegCxP.EnableControls;
   End;

 //REGISTROS PARA LAS CUENTAS DE RETENCION PARA EL DEBE Y HABER
   DMTE.cdsDocPago.DisableControls;
   Contab_DocPago_Retencion_Haber;
   If Not xSigueGrab Then
      Exit;
   DMTE.cdsDocPago.EnableControls;

   If bLetra Then
   Begin
      xMtoRetL := 0;
      xMtoRetE := 0;
      xMtoRetLH := 0;
      xMtoRetEH := 0;
   End;
   DMTE.cdsDocPago.DisableControls;

// condicionado para tratar la DETRACCION
   If (xDTRPorc = 0) And (vYanoRetencion = 'N') Then
   Begin
      DMTE.cdsDocPago.First;
      While Not DMTE.cdsDocPago.Eof Do
      Begin
         DMTE.cdsDocPago.Next;
      End;
   End
   Else // si hay DETRACCION
   Begin
   End;

   Contab_Haber;
   If Not xSigueGrab Then
      Exit;

// Cuadra Movimiento en Dolares
   xDebeT := 0;
   xHabeT := 0;
   xDebeTD := 0;
   xHabeTD := 0;
   DMTE.cdsCntCaja.First;
   While Not DMTE.cdsCntCaja.Eof Do
   Begin
      If DMTE.cdsCntCaja.FieldByname('DCDH').AsString = 'D' Then
         If DMTE.cdsCntCaja.FieldByname('DCMTOLO').Value <> null Then
         Begin
            xDebeT := xDebeT + DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat;
            xDebeTD := xDebeTD + DMTE.cdsCntCaja.FieldByname('DCMTOEXT').AsFloat;
         End
         Else
         Begin
            xDebeT := xDebeT
         End
      Else
      Begin
         If DMTE.cdsCntCaja.FieldByname('DCMTOLO').Value <> null Then
         Begin
            xHabeT := xHabeT + DMTE.cdsCntCaja.FieldByname('DCMTOLO').Value;
            xHabeTD := xHabeTD + DMTE.cdsCntCaja.FieldByname('DCMTOEXT').Value;
         End
         Else
         Begin
            xHabeT := xHabeT;
         End;
      End;
      DMTE.cdsCntCaja.Next;
   End;

   xDebeT := 0;
   xHabeT := 0;
   xDebeTD := 0;
   xHabeTD := 0;
   DMTE.cdsCntCaja.First;
   While Not DMTE.cdsCntCaja.Eof Do
   Begin
      If DMTE.cdsCntCaja.FieldByname('DCDH').AsString = 'D' Then
      Begin
         If DMTE.cdsCntCaja.FieldByname('DCMTOLO').Value <> null Then
         Begin
            xDebeT := xDebeT + DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat, 15, 2);
            xDebeTD := xDebeTD + DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOEXT').AsFloat, 15, 2);
         End
         Else
         Begin
            xDebeT := xDebeT
         End
      End
      Else
      Begin
         Begin
            If DMTE.cdsCntCaja.FieldByname('DCMTOLO').Value <> null Then
            Begin
               xHabeT := xHabeT + DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat, 15, 2);
               xHabeTD := xHabeTD + DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOEXT').AsFloat, 15, 2);
            End
            Else
            Begin
               xHabeT := xHabeT;
            End;
         End;
      End;
      DMTE.cdsCntCaja.Next;
   End;
   If (DMTE.FRound(xDebeT, 15, 2) <> DMTE.FRound(xHabeT, 15, 2)) Or (DMTE.FRound(xDebeTD, 15, 2) <> DMTE.FRound(xHabeTD, 15, 2)) Then
   Begin
      AsientoDifTotal;
      If Not xSigueGrab Then
         Exit;
   End;
   DMTE.cdsDocPago.EnableControls;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.AsientoDifTotal;
Var
   xSQL: String;
Begin
// GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   DMTE.cdsCntCaja.Insert;
   DMTE.cdsCntCaja.FieldByName('CIAID').Value := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
   DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').Value := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DMTE.cdsCntCaja.FieldByName('DCANO').Value := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
   DMTE.cdsCntCaja.FieldByName('DCMM').Value := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCDD').Value := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
   DMTE.cdsCntCaja.FieldByName('DCSS').Value := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
   DMTE.cdsCntCaja.FieldByName('DCSEM').Value := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
   DMTE.cdsCntCaja.FieldByName('DCTRI').Value := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
   DMTE.cdsCntCaja.FieldByName('DCAASS').Value := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;

   DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value := 'S'; //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCUSER').Value := DMTE.wUsuario;
   DMTE.cdsCntCaja.FieldByName('DCFREG').Value := Date;
   DMTE.cdsCntCaja.FieldByName('DCHREG').Value := Time;
   DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
   xNReg := xNReg + 1;
   DMTE.cdsCntCaja.FieldByName('NREG').AsInteger := xNReg;

   If (DMTE.FRound(xDebeT, 15, 2) <> DMTE.FRound(xHabeT, 15, 2)) Then
   Begin
      If xDebeT > xHabeT Then
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := abs(DMTE.FRound(xDebeT - xHabeT, 15, 2));
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := abs(DMTE.FRound(xDebeT - xHabeT, 15, 2));
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := 0;
         DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
         DMTE.cdsCntCaja.FieldByName('CPTOID').Value := wCptoGan;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaGan;
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'AJUSTE POR REDONDEO';
      End
      Else
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := abs(DMTE.FRound(xHabeT - xDebeT, 15, 2));
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := abs(DMTE.FRound(xHabeT - xDebeT, 15, 2));
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := 0;
         DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
         DMTE.cdsCntCaja.FieldByName('CPTOID').Value := wCptoPer;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaPer;
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'AJUSTE POR REDONDEO';
      End;
   End;

   If (DMTE.FRound(xDebeTD, 15, 2) <> DMTE.FRound(xHabeTD, 15, 2)) Then
   Begin
      If xDebeTD > xHabeTD Then
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := 0;
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := abs(xDebeTD - xHabeTD);
         DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
         DMTE.cdsCntCaja.FieldByName('CPTOID').Value := wCptoGan;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaGan;
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'AJUSTE POR REDONDEO';
      End
      Else
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := 0;
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := abs(xHabeTD - xDebeTD);
         DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
         DMTE.cdsCntCaja.FieldByName('CPTOID').Value := wCptoPer;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaPer;
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'AJUSTE POR REDONDEO';
      End;
   End;

   xSQL := 'Insert into CAJA304(CIAID, TDIARID, ECANOMM, ECNOCOMP, DCLOTE, ECFCOMP, DCFEMIS, '
      + '                       DCFVCMTO, DCTCAMPA, DCTCAMPR, DCANO, DCMM, DCDD, DCSS, DCSEM, '
      + '                       DCTRI, DCAASS, DCAASEM, DCAATRI, DCFLACDR, DCUSER, DCFREG, '
      + '                       DCHREG, TMONID, NREG, DCMTOORI, DCMTOLO, DCMTOEXT, DCDH, '
      + '                       CPTOID, CUENTAID, DCGLOSA) '
      + '   Values('
      + quotedstr(DMTE.cdsCntCaja.FieldByName('CIAID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('TDIARID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString) + ', '
      + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime)) + ', '
      + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime)) + ', '
      + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime)) + ', '
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat) + ', '
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCANO').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCMM').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDD').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSS').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSEM').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCTRI').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASS').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCUSER').AsString) + ', '
      + ' trunc(Sysdate), '
      + ' Sysdate, '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('TMONID').AsString) + ', '
      + inttostr(DMTE.cdsCntCaja.FieldByName('NREG').AsInteger) + ', '
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat) + ', '
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat) + ', '
      + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDH').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('CPTOID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) + ', '
      + quotedstr(DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString) + ') ';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error en la Contabilización (AsientoDifTotal)');
      xSigueGrab := False;
      Exit;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnContClick(Sender: TObject);
Var
   xSQL, WTDIARID, WECNOCOMPR: String;
Begin
   xMsgContabiliza := '0';

   xSigueGrab := True;
   RecCptosDifC;
   If Not xSigueGrab Then
   Begin
      Exit;
   End;

   DMTE.DCOM1.AppServer.IniciaTransaccion;
// si no se aplica la DETRACCION
   If ((xDTRPorc = 0) And (vYanoRetencion = 'N'))
      Or (DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString = '') Then
   Begin
      xDTRPorc := 0;
      DMTE.cdsEgrCaja.First;
      ContabCierra;
      If Not xSigueGrab Then
      Begin
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
      DMTE.DCOM1.AppServer.GrabaTransaccion;
   End
   Else // si se aplica la DETRACCION
   Begin
      WTDIARID := DMTE.cdsDocPago.FieldByName('TDIARID').AsString;
    //  WECNOCOMPR := DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString;
      WECNOCOMPR := DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString;

      DMTE.cdsEgrCaja.Close;
      xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, CLAUXID, PROV, PROVRUC, '
         + '          ECFCOMP, ECFEMICH, ECFPAGOP, ECFCOBCH, FPAGOID, DOCID, ECNODOC, '
         + '          TMONID, ECTCAMB, ECMTOORI, ECMTOLOC, ECMTOEXT, BANCOID, CCBCOID, '
         + '          ECNOCHQ, ECGIRA, CPTOID, CUENTAID, ECGLOSA, ECLOTE, ECELABO, '
         + '          ECAPROB, ECESTADO, ECCONTA, ECUSER, ECFREG, ECHREG, ECANO, '
         + '          ECMM, ECDD, ECSS, ECSEM, ECTRI, ECAASS, ECAASEM, ECAATRI, '
         + '          FLAGVAR, EC_PROCE, ECOPAGO, TDIARIO2, ECNOCOMP2, ECANOMM2, '
         + '          EC_IE, ECCHQEMI, USERRESP, EQUIID, ECCHKEST, ECPERNDOC, ECPERREC, '
         + '          TIPDOCCOD, PERID, ECFENTR, ECCONSOLID, ECMTCON, ECFCV, ECCOBLOC, '
         + '          ECMTDIF, ECCOBEXT, ECDEVLOC, ECDEVEXT, FEXTCHQ, FLUEID, ECCONING, '
         + '          ECNOREPO, CLAUXID1, AUXID, PROV1, CCBCOVOUCH, PRVBANCOID, PRVCCBCOID, '
         + '          ECSALMN, ECSALME, CAJARETIGV, FDOFIJJUST, GCONCID, TIPDET, ECNOCOMPR, '
         + '          CNTCOMPROB, KEYVALE, FLGREN '
         + '     From CAJA302 '
         + '    where CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
         + '      and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
         + '      and TIPDET IN (''TO'',''I4'') '
         + '      and ECNOCOMPR=' + quotedstr(WECNOCOMPR);
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.Open;

      DMTE.cdsEgrCaja.IndexFieldNames := 'TDIARID';

      DMTE.cdsEgrCaja.Last;
      If DMTE.cdsEgrCaja.FieldByname('TDIARID').AsString = '62' Then
      Begin
         If DMTE.cdsEgrCaja.FieldByname('TMONID').AsString = 'D' Then
         Begin
            DMTE.cdsEgrCaja.Edit;
            DMTE.cdsEgrCaja.FieldByname('TMONID').AsString := 'N';
            DMTE.cdsEgrCaja.Post;

            xSQL := 'Update CAJA302 '
               + '      Set TMONID=' + quotedstr(DMTE.cdsEgrCaja.FieldByname('TMONID').AsString)
               + '    where CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
               + '      and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
               + '      and TIPDET IN (''TO'',''I4'') '
               + '      and ECNOCOMPR=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString)
               + '      and TDIARID=''62'' '
               + '      and TMONID=''D'' ';
            Try
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('Error en la actualización Contable, Tipo Moneda Diario 62');
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               Exit;
            End;
         End;
      End;

      DMTE.cdsEgrCaja.First;
      xContabiliza := 'SI';
      While Not DMTE.cdsEgrCaja.Eof Do
      Begin
         DMTE.cdsDocPago.Filter := '';
         DMTE.cdsDocPago.Filtered := False;
         DMTE.cdsDocPago.Filter := ' CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
            + ' and ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
            + ' and TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
            + ' and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
         DMTE.cdsDocPago.Filtered := True;

         If xContabiliza = 'SI' Then
         Begin
            ContabCierra;
            If Not xSigueGrab Then
            Begin
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               Exit;
            End;
         End;
         xMsgContabiliza := '1'; // controla que no se presente la pregunta para Contabilizar, en el caso que
                                   // se trate del 2do. registro de la DETRACCION
         DMTE.cdsEgrCaja.Next;
      End;
      DMTE.DCOM1.AppServer.GrabaTransaccion;
      ShowMessage('Contabilización realizada en forma correcta');

   // se carga nuevamente cdsDocPago y cdsEgrCaja, con los registros que quedaron
      DMTE.cdsEgrCaja.Filtered := False;
      DMTE.cdsEgrCaja.Filter := '';
      DMTE.cdsEgrCaja.Filter := ' CIAID=' + quotedstr(dblcCia.Text)
         + ' and ECANOMM=' + quotedstr(edtPeriodo.Text)
         + ' and TDIARID=' + quotedstr(dblcTDiario.Text)
         + ' and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
      DMTE.cdsEgrCaja.Filtered := True;

      DMTE.cdsDocPago.Filter := '';
      DMTE.cdsDocPago.Filtered := False;
      DMTE.cdsDocPago.Filter := ' CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
         + ' and ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
         + ' and TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
         + ' and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
      DMTE.cdsDocPago.Filtered := True;

      DMTE.cdsEgrCaja.IndexFieldNames := '';

      dbgDocPago.RefreshDisplay;
   End;
   xSQLAdicional := '';
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ContabCierra;
Var
   xSql: String;
Begin
// inicia variables que se acumulan
   xMtol := 0;
   xMtoE := 0;
   xMtoTotalL := 0;
   xMtoTotalE := 0;
   xMtoTotalHL := 0;
   xMtoTotalHE := 0;
   xNReg := 0;

   If DMTE.cdsEgrCaja.fieldbyname('ECESTADO').AsString = 'C' Then
   Begin
      If DMTE.cdsEgrCaja.fieldbyname('FEXTCHQ').AsString = '1' Then
      Begin
         ShowMessage('No Puede Contabilizar este Movimiento ' + #13 +
            'Pues se encuentra extornado');
         xSigueGrab := False;
         Exit;
      End;

      If xMsgContabiliza = '0' Then
      Begin
         If MessageDlg('¿Contabilizar y Generar Asientos Automaticos?', mtConfirmation,
            [mbYes, mbNo], 0) = mrYes Then
            xContabiliza := 'SI'
         Else
         Begin
            xContabiliza := 'NO';
            xSigueGrab := False;
            Exit;
         End;
      End;
      screen.Cursor := crHourGlass;

      z2bbtnGraba.Enabled := False;
      z2bbtnCancelado.Enabled := False;
      z2bbtnCont.Enabled := False;
      z2bbtnAnula.Enabled := False;

      Contabiliza;
      If Not xSigueGrab Then
      Begin
         Exit;
      End;

    // para no contabilizar la detracciòn
      If DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString = '62' Then
      Begin
         screen.Cursor := crDefault;
         Exit;
      End;

      ActualizaCNT311(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
         DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
         DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
         DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString);
      If Not xSigueGrab Then
      Begin
         Exit;
      End;

      If SOLContaG(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
         DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
         DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
         DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
         DMTE.SRV_D, 'CPG', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
         DMTE.cdsResultSet, DMTE.DCOM1, Self) Then
      Begin
         DMTE.cdsEgrCaja.Edit;
         DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString := 'S'; //Establece como Contabilizado el flag
         DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'C';
       //actualizando el numero del comprobante contable
         DMTE.cdsEgrCaja.FieldByName('CNTCOMPROB').AsString := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
         If cReConta = 'N' Then
         Begin
            DMTE.cdsEgrCaja.FieldByName('ECUSER').Value := DMTE.wUsuario;
            DMTE.cdsEgrCaja.FieldByName('ECFREG').Value := DateS;
         End;
         DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time;

         If DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString = '62' Then
         Begin
            DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat := nImpDetraccion;
            DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat := nImpDetraccion;
         End;
         DMTE.cdsEgrCaja.Post;

         xSQL := 'Update CAJA302 '
            + '      Set ECCONTA=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString) + ','
            + '          ECESTADO=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString) + ','
            + '          ECUSER=' + quotedstr(DMTE.wUsuario) + ','
            + '          ECFREG=trunc(sysdate),'
            + '          ECHREG=sysdate,'
            + '          ECMTOORI=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat) + ','
            + '          ECMTOLOC=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat)
            + '    Where CIAID=' + quotedstr(dblcCia.Text)
            + '      and ECANOMM=' + quotedstr(edtPeriodo.Text)
            + '      and TDIARID=' + quotedstr(dblcTDiario.Text)
            + '      and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error en la actualización Contable (ContabCierra)');
            xSigueGrab := False;
            Exit;
         End;

      // Para Grabar Registros Adicionales
         fg_AtualizaNComprob(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
            DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
         If Not xSigueGrab Then
         Begin
            Exit;
         End;
      End
      Else
      Begin
         If Not xSigueGrab Then
         Begin
            Exit;
         End;
      End;

      lblEstado.Caption := 'Cancelado y Contab.';
      screen.Cursor := crDefault;
   End
   Else
   Begin
      screen.Cursor := crDefault;
      ShowMessage('Documento no ha sido Cancelado');
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnAnulaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If MessageDlg('¿Anular Comprobante?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin

      DMTE.DCOM1.AppServer.IniciaTransaccion;

      xSigueGrab := True;

      If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'I' Then
         RetornaSaldosMovCxP;

      If Not xSigueGrab Then
      Begin
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;

      If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'C' Then
      Begin
         RetornaSaldosMovCxPPagados;
         If Not xSigueGrab Then
         Begin
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            Exit;
         End;
         If DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString = 'S' Then
            DMTE.AnulaRetencion;
         If Not xSigueGrab Then
         Begin
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            Exit;
         End;
      End;	

// Inicio HPC_201801_CAJA
// Se Comenta debido a que se pierde los valores
   // DMTE.cdsEgrCaja.CancelUpdates;
// Fin HPC_201801_CAJA
      DMTE.cdsRegCxP.CancelUpdates;
      DMTE.cdsDocPago.CancelUpdates;

      If (xDTRPorc > 0) And (DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString <> '') Then // si se aplico la DETRACCION
      Begin
         xSQL := 'Update CAJA302 '
            + '      set ECESTADO=''A'', '
            + '          ECUSER=''' + DMTE.wUsuario + ''', '
            + '          ECFREG=trunc(sysdate), '
            + '          ECHREG=sysdate '
            + '    where CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
            + '      and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
            + '      and ECNOCOMPR=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString);
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se pudo Anular las Cabeceras de Detracción del Asiento');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            Exit;
         End;
// Inicio HPC_201803_CAJA
// Se comenta el cds refresh
//       DMTE.cdsEgrCaja.Refresh;
// Fin HPC_201803_CAJA
      End
      Else // si NO se aplico la DETRACCION
      Begin
         AnulaCaja302;
         If Not xSigueGrab Then
         Begin
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            Exit;
         End;
      End;

      DMTE.DCOM1.AppServer.GrabaTransaccion;

      dbgPendientes.ReadOnly := True;
      dbgDocPago.ReadOnly := True;
      dbgOtros.ReadOnly := True;

      z2bbtnCont.Enabled := False;
      z2bbtnSube.Enabled := False;
      z2bbtnGraba.Enabled := False;
      z2bbtnCancelado.Enabled := False;
      z2bbtnCancel2.Enabled := False;
      z2bbtnAnula.Enabled := False;
      dbgOtrosIButton.Enabled := False;
      lblEstado.Caption := 'Anulado            ';
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.AnulaCaja302;
Var
   xSQL: String;
Begin
   DMTE.cdsEgrCaja.edit;
   DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value := 'A';
   DMTE.cdsEgrCaja.FieldByName('ECUSER').Value := DMTE.wUsuario; // usuario que registra
   DMTE.cdsEgrCaja.FieldByName('ECFREG').Value := DateS; // fecha que registra Usuario
   DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time; // Hora de Registro de Usuario
   DMTE.cdsEgrCaja.Post;

   xSQL := 'Update CAJA302 '
      + '      Set ECESTADO=''A'', '
      + '          ECUSER=' + quotedstr(DMTE.wUsuario) + ','
      + '          ECFREG=trunc(Sysdate), '
      + '          ECHREG=sysdate '
      + '    where CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
      + '      and ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
      + '      and TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
      + '      and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al intentar ANULAR la cabecera del Egreso');
      xSigueGrab := False;
      Exit;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ActPnlBotones;
Begin
   z2bbtnCont.Enabled := wbCont;
   z2bbtnImprime.Enabled := wbImprime;
   z2bbtnSube.Enabled := wbSube;
   z2bbtnGraba.Enabled := wbGraba;
   z2bbtnCancelado.Enabled := wbCancelado;
   z2bbtnCancel2.Enabled := wbCancel2;
   z2bbtnAnula.Enabled := wbAnula;
End;

Procedure TFPagoGlobal2.FormClose(Sender: TObject; Var Action: TCloseAction);
Var
   xSQL: String;
Begin

   Try
      If pnlActualiza.Visible Then
      Begin
         z2bbtnCancel3.SetFocus;
         z2bbtnCancel3Click(Nil);
      End;

   // Limpiamos los filtros
      DMTE.cdsRegCxP.Filtered := False;
      DMTE.cdsMovCxP.Filtered := False;
      DMTE.cdsCntCaja.Filtered := False;
// Inicio HPC_201706_CAJA
   //   If DMTE.cdsEgrCaja.active Then
   //      DMTE.cdsEgrCaja.CancelUpdates;
// Fin HPC_201706_CAJA
      If DMTE.cdsRegCxP.Active Then
         DMTE.cdsRegCxP.CancelUpdates;
      If DMTE.cdsMovCxP.active Then
      Begin
         DMTE.cdsMovCxP.CancelUpdates;
         DMTE.cdsMovCxP.close;
      End;
      If DMTE.cdsDocPago.Active Then
         DMTE.cdsDocPago.CancelUpdates;

      DMTE.cdsConsulta.IndexFieldNames := '';
      DMTE.cdsConsulta.Filter := '';
      DMTE.cdsConsulta.Filtered := False;
      DMTE.cdsConsulta.Close;

      DMTE.cdsRetencion.IndexFieldNames := '';
      DMTE.cdsRetencion.Filter := '';
      DMTE.cdsRetencion.Filtered := False;
      DMTE.cdsRetencion.Close;

      cf1.QuitarExits(self);
      DMTE.cdsTrans.IndexFieldNames := '';
      DMTE.cdsTrans.Filter := '';
      DMTE.cdsTrans.Filtered := False;

      edtCuenta.Enabled := False;
      Limpiapnlaux;
// Inicio HPC_201706_CAJA
      If (DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'X') or (DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = '') Then
      Begin
// Fin HPC_201706_CAJA
         DMTE.cdsEgrCaja.delete;
         xSQL := 'delete CAJA302 '
            + '    Where CIAID=''' + dblcCia.Text + ''' '
            + '      and ECANOMM=''' + edtPeriodo.Text + ''' '
            + '      and TDIARID=''' + dblcTDiario.Text + ''' '
            + '      and ECNOCOMP=''' + dbeNoComp.Text + ''' ';
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

      End;
      If (xDTRPorc = 0) And (vYanoRetencion = 'N') Then
      Begin
         FRegistro.xFiltroEgr.FMant.cds2.Data := DMTE.cdsEgrCaja.Data;
         FRegistro.xFiltroEgr.FMant.cds2.GotoCurrent(DMTE.cdsEgrCaja);
      End
      Else
      Begin
         DMTE.cdsEgrCaja.Filter := '';
         DMTE.cdsEgrCaja.Filtered := False;
         DMTE.cdsEgrCaja.Filter := ' CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
            + ' and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
            + ' and TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
            + ' and ECNOCOMPR=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString);
         DMTE.cdsEgrCaja.Filtered := True;
         DMTE.cdsEgrCaja.First;
         While Not DMTE.cdsEgrCaja.Eof Do
         Begin
            FRegistro.xFiltroEgr.FMant.cds2.Data := DMTE.cdsEgrCaja.Data;
            DMTE.cdsEgrCaja.Next;
         End;
         DMTE.cdsEgrCaja.Filter := '';
         DMTE.cdsEgrCaja.Filtered := False;
      End;
   Except
   End;
// Inicio HPC_201704_CAJA
// Nueva rutina para obtener la data para la validacion SEMT
   If DMTE.cdsQry7.active Then
   Begin
        DMTE.cdsQry7.close;
   end;
// Fin HPC_201704_CAJA
   FPagoGlobal2 := Nil;
   Action := caFree;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.IniciaPanel;
Begin
   dbeSerie.Text := '000';
   dblcTDoc2.Text := '';
   dbeNoDoc2.Text := '';
   dblcdCnp2.Text := '';
   dbeDH.Text := '';
   dblcdCCosto.Text := '';
   dblcdCCosto.Text := '';
   dblcTMon2.Text := '';
   dbeImporte2.Text := '';
   dbeTCamDoc.Text := '';
   dbdtpFEmis2.Date := 0;
   dbdtpFVcto2.Date := 0;

   edtCuenta2.Text := '';
   edtMtoLoc.Text := '';
   edtMtoExt.Text := '';
   edtTDoc2.Text := '';
   edtCnp2.Text := '';
   edtTMon2.Text := '';
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbgOtrosIButtonClick(Sender: TObject);
Begin
   inhabilitarpaneles;
   AdicionarRegistros;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbgOtrosKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (dbgOtrosIButton.Enabled) And (key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If (DMTE.cdsRegCxP.RecordCount = 0) Then
         ShowMessage('No hay registros')
      Else
      Begin
         If MessageDlg('¿Eliminar Registro?', mtconfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            DMTE.cdsRegCxP.Delete; // Borro en el original..
            z2bbtnSumatClick(sender); // Al salir hay que totalizar
         End;
      End;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbdtpFComp2Exit(Sender: TObject);
Begin
   DMTE.cdsRegCxP.FieldByName('CPANOMM').Value := copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value), 7, 4)
      + copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value), 4, 2);
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnSumatClick(Sender: TObject);
Var
   xRegAct: TBookMark;
   xWhere: String;
   xTotGrav, xTotIGV: double;
   xResta: String;
   vRetencion: Real;
   vDetraccion: String;
   vProvRetiene: String;
   xDocRetIGV: String;
   xRestaDoc: String;
Begin
   bMayorQueMonto := False;
   DMTE.cdsRegCxP.DisableControls;
   xRegAct := DMTE.cdsRegCxP.GetBookmark;
   xMtoLoc := 0;
   xMtoExt := 0;
   xRetLoc := 0;
   xRetExt := 0;
   xResta := 'N';
   DMTE.cdsRegCxP.First;
   While Not DMTE.cdsRegCxP.Eof Do
   Begin
      If DMTE.cdsRegCxP.FieldByName('DEDH').Value = 'D' Then
      Begin
         xMtoLoc := xMtoLoc + DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
         xMtoExt := xMtoExt + DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;

         xWhere := 'DOCID=' + QuotedStr(DMTE.cdsRegCxP.FieldByName('DOCID2').AsString)
            + ' AND DOCMOD=''CXP''';

      // Si el tipo de documento esta sujeto a RETENCION
         If (DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCRETIGV', xWhere, 'DOCRETIGV') = 'S') And
            (DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime >= DMTE.xTasaFec) And
            (lblSujetoRetencion.Visible) Then
         Begin
            xRetLoc := xRetLoc + DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
            xRetExt := xRetExt + DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
            If DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat, 15, 4) >= DMTE.xTasaMonto Then
               bMayorQueMonto := True;
         End;
      End
      Else
      Begin
         xMtoLoc := xMtoLoc - DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
         xMtoExt := xMtoExt - DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
      End;
      DMTE.cdsRegCxP.Next;
   End;

   dbgOtros.ColumnByName('DEMTOLOC').FooterValue := floattostrf(xMtoLoc, ffFixed, 10, 2);
   dbgOtros.ColumnByName('DEMTOEXT').FooterValue := floattostrf(xMtoExt, ffFixed, 10, 2);

   DMTE.cdsRegCxP.GotoBookmark(xRegAct);
   DMTE.cdsRegCxP.FreeBookmark(xRegAct);
   DMTE.cdsRegCxP.EnableControls;

   DMTE.cdsDocPago.DisableControls;
   xRegAct := DMTE.cdsDocPago.GetBookmark;
   DMTE.cdsDocPago.First;
   xTotGrav := 0;
   xTotIGV := 0;
   While Not DMTE.cdsDocPago.EOF Do
   Begin
   // si el concepto es para detraccion asi no este sujeto a detraccion por el importe ya no descuenta retencion
   // se supone que seria un servicio
      xWhere := 'CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID2').AsString)
         + ' and CLAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString)
         + ' and PROV=' + quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString)
         + ' and CPSERIE=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPSERIE').AsString)
         + ' and CPNODOC=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPNODOC').AsString)
         + ' and CPESTADO=''P'' ';
      If length(DMTE.DisplayDescrip('prvTGE', 'CXP301', '*', xWhere, 'PROV')) > 0 Then
      Begin
         If (DMTE.cdsQry.FieldByName('PROVRETIGV').AsString = 'S') And
            ((DMTE.cdsQry.FieldByName('CPIGV').AsFloat
            + DMTE.cdsQry.FieldByName('CPIGV2').AsFloat
            + DMTE.cdsQry.FieldByName('IGV_GRA_NO_DEST').AsFloat) > 0) Then
            vDetraccion := 'N'
         Else
            If DMTE.cdsQry.FieldByName('DTRPORC').AsFloat > 0 Then
               vDetraccion := 'S'
            Else
               vDetraccion := VConceptoDetrac(DMTE.cdsDocPago.FieldByName('CIAID2').AsString,
                  DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
                  DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
                  DMTE.cdsDocPago.FieldByName('CPNOREG').AsString);
      End;
   // Solo es necesario que sea un comcepto de "detraccion" dentro del cheqe  para que no cobre retencion y los valores queden en cero
      If vDetraccion = 'S' Then
      Begin
         xTotGrav := 0;
         xTotIGV := 0;
         vYanoRetencion := 'S';
      End;

      If Not lblSujetoRetencion.Visible Then
      Begin
         xTotGrav := 0;
         xTotIGV := 0;
      End;

      xWhere := 'DOCID=' + QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString) + ' AND DOCMOD=''CXP'' ';
      xDocRetIGV := DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCRETIGV, DOCRESTA', xWhere, 'DOCRETIGV');
      xRestaDoc := DMTE.cdsQry.FieldByName('DOCRESTA').AsString;

      If (xDocRetIGV = 'S')
         And (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime >= DMTE.xTasaFec)
         And (vDetraccion <> 'S')
         And (lblSujetoRetencion.Visible) Then
      Begin
         xResta := DMTE.cdsQry.FieldByName('DOCRESTA').AsString;
         xWhere := 'CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID2').AsString)
            + ' and CLAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString)
            + ' and PROV=' + quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString)
            + ' and CPSERIE=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPSERIE').AsString)
            + ' and CPNODOC=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPNODOC').AsString)
            + ' and CPESTADO=''P'' ';
         If length(DMTE.DisplayDescrip('prvTGE', 'CXP301', '*', xWhere, 'PROV')) > 0 Then
         Begin
            If (DMTE.cdsQry.FieldByName('PROVRETIGV').AsString = 'S') Or
               (DMTE.cdsQry.FieldByName('CPIGV').AsFloat > 0) Or
               (DMTE.cdsQry.FieldByName('CPIGV2').AsFloat > 0) Or
               (DMTE.cdsQry.FieldByName('IGV_GRA_NO_DEST').AsFloat > 0) Then
            Begin
               If xResta <> 'S' Then
               Begin
                  xTotGrav := xTotGrav + DMTE.cdsQry.FieldByName('CPGRAVAD').AsFloat;
                  xTotIGV := xTotIGV
                     + DMTE.cdsQry.FieldByName('CPIGV').AsFloat
                     + DMTE.cdsQry.FieldByName('CPIGV2').AsFloat
                     + DMTE.cdsQry.FieldByName('IGV_GRA_NO_DEST').AsFloat;
               End
               Else
               Begin
                  xTotGrav := xTotGrav - DMTE.cdsQry.FieldByName('CPGRAVAD').AsFloat;
                  xTotIGV := xTotIGV
                     - DMTE.cdsQry.FieldByName('CPIGV').AsFloat
                     - DMTE.cdsQry.FieldByName('CPIGV2').AsFloat
                     - DMTE.cdsQry.FieldByName('IGV_GRA_NO_DEST').AsFloat;
               End;

               If DMTE.cdsQry.FieldByName('PROVRETIGV').AsString = 'S' Then
                  bMayorQueMonto := True;
            End;
         End;
      End;

      If xRestaDoc = 'S' Then
      Begin
        //Si esta en negativo ya no es restar sino sumar por el signo negativo se resta.
         If DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat < 0 Then
         Begin
            xMtoLoc := xMtoLoc + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
            xMtoExt := xMtoExt + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
         End
         Else
         Begin
            xMtoLoc := xMtoLoc - DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
            xMtoExt := xMtoExt - DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
         End
      End
      Else
      Begin
         xMtoLoc := xMtoLoc + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
         xMtoExt := xMtoExt + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
      End;
      DMTE.cdsDocPago.Next;
   End;

   DMTE.cdsDocPago.GotoBookmark(xRegAct);
   DMTE.cdsDocPago.FreeBookmark(xRegAct);
   DMTE.cdsDocPago.EnableControls;

   If (xTotGrav + xTotIGV) >= DMTE.xTasaMonto Then
      bMayorQueMonto := True;

   If bMayorQueMonto Then
   Begin
      If DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') Then
      Begin
         xRetLoc := xMtoLoc * 0.03;
         xRetExt := xMtoExt * 0.03;
         xMtoLoc := DMTE.FRound(xMtoLoc - xRetLoc, 15, 2);
         xMtoExt := DMTE.FRound(xMtoExt - xRetExt, 15, 2);
      End
      Else
      Begin
         xRetLoc := xMtoLoc * 0.06;
         xRetExt := xMtoExt * 0.06;
         xMtoLoc := DMTE.FRound(xMtoLoc - xRetLoc, 15, 2);
         xMtoExt := DMTE.FRound(xMtoExt - xRetExt, 15, 2);
      End;
   End
   Else
   Begin
      xRetLoc := 0;
      xRetExt := 0;
      xMtoLoc := DMTE.FRound(xMtoLoc, 15, 2);
      xMtoExt := DMTE.FRound(xMtoExt, 15, 2);
   End;
   if dblcTMon.Text='N' then
      dbeImporte.Text := floattostr(xMtoLoc)
   else
      dbeImporte.Text := floattostr(xMtoExt);
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbgDocPagoDragOver(Sender, Source: TObject; X,
   Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
   If (Not dbgDocPago.Readonly) Then
      Accept := True;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbgDocPagoMouseDown(Sender: TObject;
   Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
   If (Not dbgDocPago.Readonly) Then
      dbgDocPago.BeginDrag(False);
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbgDocPagoEndDrag(Sender, Target: TObject; X,
   Y: Integer);
Var
   xSQL, WECNOCOMPR, WTDIARID: String;
Begin
   If (Not dbgDocPago.Readonly) And (Target = dbgpendientes) Then
   Begin
      DMTE.cdsMovCxP.Filtered := False;

      If DMTE.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
         VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID2').AsString,
         DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
            DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
            DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]), []) Then
      Begin
      // variable que decide si se aplica DETRACCION y por lo tanto se anula la RETENCION
         xDTRPorc := DMTE.cdsMovCxP.FieldByName('DTRPORC').AsFloat;
         If xDTRPorc > 0 Then
         Begin
            lblSujetoRetencion.Visible := False;
         End;
         DMTE.cdsDocPago.Delete;
         DMTE.cdsMovCxP.Edit;
         DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.cdsMovCxP.FieldByName('CPMTOEXT').Value - DMTE.NumeroNoNulo(DMTE.cdsMovCxP.FieldByName('CPPAGEXT'));
         DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.cdsMovCxP.FieldByName('CPMTOLOC').Value - DMTE.NumeroNoNulo(DMTE.cdsMovCxP.FieldByName('CPPAGLOC'));
         DMTE.cdsMovCxP.FieldByName('CPHREG').Value := time;
         If DMTE.cdsMovCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc Then
            DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat
         Else
            DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;

         DMTE.cdsMovCxP.Post;
         dbgPendientes.RefreshDisplay;
         dbgDocPago.RefreshDisplay;
      End;
      DMTE.cdsMovCxP.Filtered := True;
      wmodifica := True;
      z2bbtnSumatDocPagoClick(Nil);
   End;
   // Inicio HPC_201703_CAJA
   // Validación SEMT para proveedores con cobranza coactiva
   If DMTE.cdsDocPago.Recordcount =0 then
   begin
       dbgDocPago.ClearControls;
       cbtodos.Checked := false;
   end;
   dbgDocPago.Refresh;
   // Final HPC_201703_CAJA
End;

{******************************************************************************}

Procedure TFPagoGlobal2.LimpiaFiltros;
Begin
   // Limpiando filtros si lo tuvieran
   DMTE.cdsMovCxP.Filtered := False;
   DMTE.cdsCntCaja.Filtered := False;
   DMTE.cdsRegCxP.Filtered := False;
End;

{******************************************************************************}
{*********************** PROCEDIMIENTOS ADICIONALES   *************************}

Procedure TFPagoGlobal2.ActivaFiltro(xName: String);
Var
   xFiltro,
      xWhere: String;
   sDocumentos, xSQL: String;
Begin
   xName := uppercase(xName);

   If xName = 'REGCXP' Then
   Begin
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest('SELECT DOCID FROM TGE110 WHERE (DOCMOD=''CAJA'' OR DOCMOD=''CXP'') AND DOCRESTA=''S''');
      DMTE.cdsQry.Open;
      DMTE.cdsQry.First;
      xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, TDIARID2, CPANOMM, CPNOREG, '
         + '          DOCID2, CPSERIE, CPNODOC, TMONID, DEFCOMP, DETCDOC, DETCPAG, '
         + '          DEDH, DEMTOORI, DEMTOLOC, DEMTOEXT, DESALLOC, DESALEXT, CPTOID, '
         + '          CUENTAID, CCOSID, CPFEMIS, CPFVCMTO, DEUSER, DEFREG, DEHREG, DEANO, '
         + '          DEMM, DEDD, DESS, DESEM, DETRI, DEAASS, DEAASEM, DEAATRI, FLAGVAR, '
         + '          ECOPAGO, DEESTADO, PROV, PROVRUC, DEGIRA, CLAUXID, CCTREC, ECNOREPO, '
         + '          DENUMREG, DOCMOD, DEGLOSA, ECGLOSA, CANTIDAD, KEYVALE '
         + '     from CAJA301 '
         + '    Where CIAID=' + quotedstr(dblcCia.Text)
         + '      and ECANOMM=' + quotedstr(edtPeriodo.Text)
         + '      and TDIARID=' + quotedstr(dblcTDiario.Text)
         + '      and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
      DMTE.cdsRegCxP.Close;
      DMTE.cdsRegCxP.DataRequest(xSQL);
      DMTE.cdsRegCxP.Open;
   End;

   If xName = 'DOCPAGO' Then
   Begin
      If length(DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString) > 0 Then
      Begin // por ser registros al que se les ha aplicado la DETRACCION
         xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, TDIARID2, CPANOMM, PROV, '
            + '          PROVRUC, CPNOREG, DOCID2, CPSERIE, CPNODOC, TMONID, DETCDOC, '
            + '          DETCPAG, DEDH, DEMTOORI, DEMTOLOC, DEMTOEXT, DESALLOC, DESALEXT, '
            + '          CPTOID, CUENTAID, CCOSID, CPFEMIS, CPFVCMTO, DEUSER, DEFREG, '
            + '          DEHREG, DEANO, DEMM, DEDD, DESS, DESEM, DETRI, DEAASS, DEAASEM, '
            + '          DEAATRI, FLAGVAR, DEANTMN, DEANTME, CLAUXID, ECNOREPO, PROVDES, '
            // Inicio HPC_201703_CAJA
            // Validación SEMT para proveedores con cobranza coactiva
            //+ '          TIPDET, ECNOCOMPR, CIAID2, CNTCOMPROB '
            + '          TIPDET, ECNOCOMPR, CIAID2, CNTCOMPROB,NVL(VALPAGPRO,''N'') VALPAGPRO '
            // Final HPC_201703_CAJA
            + '     from CAJA303 '
            + '    Where CIAID='+quotedstr(dblcCia.Text)
            + '      and ECANOMM='+quotedstr(edtPeriodo.Text) 
// Inicio HPC_201803_CAJA
            + '      and ((TDIARID='+quotedstr(dblcTDiario.Text)+' and ECNOCOMP='+quotedstr(dbeNoComp.Text)+') )';
//          + '        or (TDIARID='+quotedstr('62')+' '
//            + '      and ECNOCOMPR='+quotedstr(dbeNoComp.Text)+')';
// Fin HCP_201803_CAJA
      End
      Else
      Begin
         xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, TDIARID2, CPANOMM, PROV, '
            + '          PROVRUC, CPNOREG, DOCID2, CPSERIE, CPNODOC, TMONID, DETCDOC, '
            + '          DETCPAG, DEDH, DEMTOORI, DEMTOLOC, DEMTOEXT, DESALLOC, DESALEXT, '
            + '          CPTOID, CUENTAID, CCOSID, CPFEMIS, CPFVCMTO, DEUSER, DEFREG, DEHREG, '
            + '          DEANO, DEMM, DEDD, DESS, DESEM, DETRI, DEAASS, DEAASEM, DEAATRI, '
            + '          FLAGVAR, DEANTMN, DEANTME, CLAUXID, ECNOREPO, PROVDES, TIPDET, '
            // Inicio HPC_201703_CAJA
            // Validación SEMT para proveedores con cobranza coactiva
            //            + '          ECNOCOMPR, CIAID2, CNTCOMPROB '
            + '          ECNOCOMPR, CIAID2, CNTCOMPROB, NVL(VALPAGPRO,''N'') VALPAGPRO '
            // Final HPC_201703_CAJA
            + '     from CAJA303 '
            + '    Where CIAID=''' + dblcCia.Text + ''' '
            + '      and ECANOMM=''' + edtPeriodo.Text + ''' '
            + '      and TDIARID=''' + dblcTDiario.Text + ''' '
            + '      and ECNOCOMP=''' + dbeNoComp.Text + ''' ';
      End;

      DMTE.cdsDocPago.Filter := '';
      DMTE.cdsDocPago.Filtered := False;
      DMTE.cdsDocPago.Close;
      DMTE.cdsDocPago.DataRequest(xSQL);
      DMTE.cdsDocPago.Open;

   // para determinar si se aplica DETRACCION y se anula la RETENCION
      If DMTE.cdsDocPago.RecordCount > 0 Then
      Begin
         xSQL := 'Select B.DTRPORC '
            + '     from CAJA303 A, CXP301 B '
            + '    Where A.CIAID=''' + dblcCia.Text + ''' '
            + '      and A.ECANOMM=''' + edtPeriodo.Text + ''' '
            + '      and A.TDIARID=''' + dblcTDiario.Text + ''' '
            + '      and A.ECNOCOMP=''' + dbeNoComp.Text + ''' '
            + '      and A.CIAID2=B.CIAID(+) '
            + '      and A.CPANOMM=B.CPANOMES '
            + '      and TDIARID2=B.TDIARID '
            + '      and A.CPNOREG=B.CPNOREG(+) AND NVL(B.DTRPORC,0)>0';
         DMTE.cdsQry3.Close;
         DMTE.cdsQry3.DataRequest(xSQL);
         DMTE.cdsQry3.Open;
         lblDTR.Visible := False;

      // variable que decide si se aplica DETRACCION y por lo tanto se anula la RETENCION
         xDTRPorc := DMTE.cdsQry3.FieldByName('DTRPORC').AsFloat;
         If xDTRPorc > 0 Then
         Begin
            lblSujetoRetencion.Visible := False;
            lblDTR.Caption := lblDTR.Caption + '  No. ' + DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString;
            If DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString <> '' Then
               lblDTR.Visible := True;
         End;
      End;
   End;

   If xName = 'MOVCXP' Then
   Begin
      sDocumentos := '';
      If DMTE.cdsQry.RecordCount > 0 Then
      Begin
         sDocumentos := ' AND (';
         While Not DMTE.cdsQry.EOF Do
         Begin
            If DMTE.cdsQry.RecordCount = 1 Then
               sDocumentos := sDocumentos + ' DOCID<>' + QuotedStr(DMTE.cdsQry.FieldByName('DOCID').AsString)
            Else
               If DMTE.cdsQry.RecNo = DMTE.cdsQry.RecordCount Then
                  sDocumentos := sDocumentos + ' DOCID<>' + QuotedStr(DMTE.cdsQry.FieldByName('DOCID').AsString)
               Else
                  sDocumentos := sDocumentos + ' DOCID<>' + QuotedStr(DMTE.cdsQry.FieldByName('DOCID').AsString) + ' AND ';
            DMTE.cdsQry.Next;
         End;
         sDocumentos := sDocumentos + ' )';
      End;

      DMTE.cdsMovCxP.Close;

      xFiltro := ' CPESTADO=''P'' and '
         + ' CLAUXID=''' + dblcClase.Text + ''' and '
         + ' PROV =''' + dblcdAux.Text + ''' ';

      xWhere := '(' + xFiltro + ') OR ( CIAID||CPANOMES||TDIARID||CPNOREG IN ' +
         '                   ( Select CIAID||CPANOMM||TDIARID2||CPNOREG' +
         '                       from CAJA303 ' +
         '                      where CIAID = ''' + dblcCia.Text + ''' ' +
         '                        and ECANOMM = ''' + edtPeriodo.Text + ''' ' +
         '                        and TDIARID = ''' + dblcTDiario.Text + ''' ' +
         '                        and ECNOCOMP= ''' + dbeNoComp.Text + ''' ) ) ';

      xSQL := 'SELECT CIAID, CPANOMES, TDIARID, CPNOREG, CLAUXID, PROV, PROVRUC, '
         + '       DOCID, CPSERIE, CPNODOC, CPFRECEP, CPFEMIS, CPFVCMTO, TMONID, '
         + '       CPTCAMPR, CPTCAMPA, CPESTADO, CPOCOMP, CP_CONTA, CPGRAVAD, '
         + '       CPNOGRAV, CPIGV, CPISC, CPDCTO, CPSERVIC, CPMTOORI, CPMTOLOC, '
         + '       CPMTOEXT, CPPAGORI, CPPAGLOC, CPPAGEXT, CPSALORI, CPSALLOC, '
         + '       CPSALEXT, TCANJEID, CPCANJE, CPFCANJE, CPUSER, CPFREG, CPHREG, '
         + '       CPAAAA, CPMM, CPDD, CPTRI, CPSEM, CPSS, CPAATRI, CPAASEM, CPAASS, '
         + '       CPFCMPRB, DCPLOTE, DCPCOMP, CTATOTAL, FLAGVAR, CPTOTOT, CPIGV2, '
         + '       CPGRAVAD2, CPHMOD, FLAGVAR2, PROVDES, CLAUXREND, AUXIDREND, '
         + '       CCBCOID, BANCOID, SITUAID, CPFLAGTDOC, CXPRRHH, AUXIDINTER, '
         + '       CLAUXINTER, CPTCAMDOL, PROVRETIGV, CPTCAMAJ, DTRPORC, CPMTOORIB, '
         + '       DTRFLAG, FECDEPDET, NUMDEPDET, ADQ_NO_GRAV, IGV_GRA_NO_DEST, '
         + '       CP_OTROS, CPTODETRSUNATID, TIPOOPERSUNATID, PORCDESC, CP4TAPENSION, '
         + '       SNPAFPID, TIPCOMAFPID '
         + '  FROM CXP301 '
         + ' WHERE ' + xWhere + sDocumentos
         + ' order by CPANOMES DESC, DOCID, CPSERIE, CPNODOC';
      DMTE.cdsMovCxP.Datarequest(xSQL);
      DMTE.cdsMovCxP.Active := True;
       //DMTE.cdsMovCxP.IndexFieldNames:='CLAUXID;PROV;CPNODOC';

      xFiltro := ' (((CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR ' +
         '   ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) ';

      DMTE.cdsMovCxP.Filter := '';
      DMTE.cdsMovCxP.Filter := xFiltro;
      DMTE.cdsMovCxP.Filtered := True;

   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.CambiaEstado(xName: char);
Begin
   Case xName Of
      'I':
         Begin //Si está INCOMPLETO o PENDIENTE
            lblEstado.Caption := 'Activo             ';
            pnlCabecera1.Enabled := False;
            pnlCabecera2.Enabled := True;
            z2bbtnOk.Enabled := True;
            z2bbtnCancel.Enabled := True;
            pnlDetalle.Enabled := True; // Activar Panel de Detalle
            pnlBotones.Enabled := True; // Activar Panel de Botones

            dbgPendientes.ReadOnly := false;
            dbgDocPago.ReadOnly := False;
            dbgOtros.ReadOnly := False;

            wbSumat := True;
            wbCont := False;
            wbNuevo := True;
            wbImprime := True;
            wbSube := True;
            wbGraba := True;
            wbCancelado := True;
            wbCancel2 := True;
            wbAnula := True;
            wbChq := True;
         End;

      'C':
         Begin
            pnlCabecera1.Enabled := False; // Desactivar Panel1
            pnlCabecera2.Enabled := False; // Desactivar Panel2
            z2bbtnOk.Enabled := False;
            z2bbtnCancel.Enabled := False;
            pnlDetalle.Enabled := True; // Activar Panel de Detalle
            pnlBotones.Enabled := True; // Activar Panel de Botones

            dbgPendientes.ReadOnly := True;
            dbgDocPago.ReadOnly := True;
            dbgOtros.ReadOnly := True;

            If DMTE.cdsEgrCaja.FieldByName('ECConta').Value = 'S' Then
            Begin //Esta contabilizado
               wbCont := False;
               lblEstado.Caption := 'Cancelado y Contab.';
               wbAnula := False;
            End
            Else
            Begin
               wbCont := True;
               lblEstado.Caption := 'Cancelado          ';
               wbAnula := True;
            End;
            wbSumat := False;
            wbNuevo := True;
            wbImprime := True;
            wbSube := False;
            wbGraba := False;
            wbCancelado := False;
            wbCancel2 := False;
            wbChq := False;
         End;

      'A':
         Begin
            lblEstado.Caption := 'Anulado            ';
            pnlCabecera1.Enabled := False; // Desactivar Panel1
            pnlCabecera2.Enabled := False; // Desactivar Panel2
            z2bbtnOk.Enabled := False;
            z2bbtnCancel.Enabled := False;
            pnlDetalle.Enabled := True; // Activar Panel de Detalle
            pnlBotones.Enabled := True; // Activar Panel de Botones

            dbgPendientes.ReadOnly := True;
            dbgDocPago.ReadOnly := True;
            dbgOtros.ReadOnly := True;

            wbSumat := False;
            wbCont := False;
            wbNuevo := True;
            wbImprime := True;
            wbSube := False;
            wbGraba := False;
            wbCancelado := False;
            wbCancel2 := False;
            wbAnula := False;
            wbChq := False;
         End;

      'N':
         Begin
            lblEstado.Caption := 'Nuevo     ';
            pnlCabecera1.Enabled := false;
            pnlCabecera2.Enabled := True;
            z2bbtnOk.Enabled := True;
            z2bbtnCancel.Enabled := True;
            pnlDetalle.Enabled := False; // Desactivar Panel de Detalle
            pnlBotones.Enabled := False; // Desactivar Panel de Botones

            dbgPendientes.ReadOnly := False;
            dbgDocPago.ReadOnly := False;
            dbgOtros.ReadOnly := False;

//
            wbSumat := True;
            wbCont := False;
            wbImprime := False;
            wbNuevo := False;
            wbSube := True;
            wbGraba := True;
            wbCancelado := False;
            wbCancel2 := True;
            wbAnula := False;
            wbChq := False;
         End;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbgPendientesDragOver(Sender, Source: TObject; X,
   Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
   If (dbgPendientes.Readonly = False) Then
      Accept := True;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbgPendientesMouseDown(Sender: TObject;
   Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
   If (dbgPendientes.Readonly = False) Then
      dbgPendientes.BeginDrag(False);
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
Var
   i, xFactor: integer;
   xResta, xWhere: String;
Begin
   If (Not dbgPendientes.Readonly) And (Target = dbgDocPago) Then
   Begin
//      If DMTE.cdsMovCxP.FieldByName('TMONID').AsString <> DMTE.cdsCCBco.fieldbyname('TMONID').AsString Then
      If DMTE.cdsMovCxP.FieldByName('TMONID').AsString <> dblcTMon.Text Then
      Begin
         Showmessage('La Provision está en un TIPO de MONEDA diferente a la Cta.Cte del Banco');
         Exit;
      End;

    //verifica si tiene detraccion y la provisión esta completa
      If fg_VerificaDatosDetraccion(DMTE.cdsMovCxP.FieldByName('CLAUXID').AsString,
         DMTE.cdsMovCxP.FieldByName('PROV').AsString,
         DMTE.cdsMovCxP.FieldByName('DOCID').AsString,
         DMTE.cdsMovCxP.FieldByName('CPSERIE').AsString,
         DMTE.cdsMovCxP.FieldByName('CPNODOC').AsString) = False Then
      Begin
         Exit;
      End;

      DMTE.cdsMovCxP.DisableControls;

   // Añade los Nuevos Registros
      DMTE.cdsDocPago.DisableControls;
      For i := 0 To dbgPendientes.SelectedList.Count - 1 Do
      Begin
         dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);

      // variable que decide si se aplica DETRACCION y por lo tanto se anula la RETENCION
         xDTRPorc := DMTE.cdsMovCxP.FieldByName('DTRPORC').AsFloat;
         If xDTRPorc > 0 Then
         Begin
            z2bbtnGraba.Enabled := True;
            lblSujetoRetencion.Visible := False;
         End;

      // se Añade para saber si documento suma o resta
         xWhere := 'DOCID=''' + DMTE.cdsMovCxP.FieldByName('DOCID').AsString + ''' and DOCMOD=''CXP'' ';
         xResta := DMTE.DisplayDescrip('prvQry2', 'TGE110', 'DOCRESTA', xWhere, 'DOCRESTA');
         xFactor := 1;
         If xResta = 'S' Then xFactor := -1;

         DMTE.cdsDocPago.Insert;
         DMTE.cdsDocPago.FieldByName('CIAID').Value := dblcCia.Text;
         DMTE.cdsDocPago.FieldByName('TDIARID').Value := dblcTDiario.Text;
         DMTE.cdsDocPago.FieldByName('ECANOMM').Value := edtPeriodo.Text;
         DMTE.cdsDocPago.FieldByName('ECNOCOMP').Value := dbeNoComp.Text;

         DMTE.cdsDocPago.FieldByName('CIAID2').Value := DMTE.cdsMovCxP.FieldByName('CIAID').Value;
         DMTE.cdsDocPago.FieldByName('TDIARID2').Value := DMTE.cdsMovCxP.FieldByName('TDIARID').Value;
         DMTE.cdsDocPago.FieldByName('CPANOMM').Value := DMTE.cdsMovCxP.FieldByName('CPANOMES').Value;
         DMTE.cdsDocPago.FieldByName('CPNOREG').Value := DMTE.cdsMovCxP.FieldByName('CPNOREG').Value;
         DMTE.cdsDocPago.FieldByName('DOCID2').Value := DMTE.cdsMovCxP.FieldByName('DOCID').Value;
         DMTE.cdsDocPago.FieldByName('CPSERIE').Value := DMTE.cdsMovCxP.FieldByName('CPSERIE').Value;
         DMTE.cdsDocPago.FieldByName('CPNODOC').Value := DMTE.cdsMovCxP.FieldByName('CPNODOC').Value;
         DMTE.cdsDocPago.FieldByName('TMONID').Value := DMTE.cdsMovCxP.FieldByName('TMONID').Value;
         DMTE.cdsDocPago.FieldByName('DETCDOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPTCAMAJ').Value, 8, 3);
         DMTE.cdsDocPago.FieldByName('DETCPAG').Value := DMTE.FRound(strtofloat(dbeTCambio.Text), 5, 3);
         DMTE.cdsDocPago.FieldByName('CPTOID').Value := DMTE.cdsMovCxP.FieldByName('CPTOTOT').Value;
         DMTE.cdsDocPago.FieldByName('CUENTAID').Value := DMTE.cdsMovCxP.FieldByName('CTATOTAL').Value;
         DMTE.cdsDocPago.FieldByName('CPFEMIS').Value := DMTE.cdsMovCxP.FieldByName('CPFEMIS').Value;
         DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value := DMTE.cdsMovCxP.FieldByName('CPFVCMTO').Value;
         DMTE.cdsDocPago.FieldByName('DEANO').Value := DMTE.cdsMovCxP.FieldByName('CPAAAA').Value;
         DMTE.cdsDocPago.FieldByName('DEMM').Value := DMTE.cdsMovCxP.FieldByName('CPMM').Value;
         DMTE.cdsDocPago.FieldByName('DEDD').Value := DMTE.cdsMovCxP.FieldByName('CPDD').Value;
         DMTE.cdsDocPago.FieldByName('DESS').Value := DMTE.cdsMovCxP.FieldByName('CPSS').Value;
         DMTE.cdsDocPago.FieldByName('DESEM').Value := DMTE.cdsMovCxP.FieldByName('CPSem').Value;
         DMTE.cdsDocPago.FieldByName('DETRI').Value := DMTE.cdsMovCxP.FieldByName('CPTri').Value;
         DMTE.cdsDocPago.FieldByName('DEAASS').Value := DMTE.cdsMovCxP.FieldByName('CPAASS').Value;
         DMTE.cdsDocPago.FieldByName('DEAASEM').Value := DMTE.cdsMovCxP.FieldByName('CPAASem').Value;
         DMTE.cdsDocPago.FieldByName('DEAATRI').Value := DMTE.cdsMovCxP.FieldByName('CPAATri').Value;
         DMTE.cdsDocPago.FieldByName('PROV').Value := DMTE.cdsMovCxP.FieldByName('PROV').Value;
         DMTE.cdsDocPago.FieldByName('PROVDES').AsString := DMTE.cdsMovCxP.FieldByName('PROVDES').AsString;
         DMTE.cdsDocPago.FieldByName('PROVRUC').Value := DMTE.cdsMovCxP.FieldByName('PROVRUC').Value;
// Inicio HPC_201803_CAJA
// Se cambia los valores debido a que genera mal los montos originales de pagos
         If DMTE.cdsDocPago.FieldByName('TMONID').Value = DMTE.wtMonLoc Then
         Begin
            DMTE.cdsDocPago.FieldByName('DESALLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value * xFactor, 15, 2);
            DMTE.cdsDocPago.FieldByName('DESALEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value
               / DMTE.cdsDocPago.FieldByName('DETCPAG').Value * xFactor, 15, 2);
            DMTE.cdsDocPago.FieldByName('DEMTOORI').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALLOC').Value, 15, 2);
         End
         Else
         Begin
            DMTE.cdsDocPago.FieldByName('DESALEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value * xFactor, 15, 2);
            DMTE.cdsDocPago.FieldByName('DESALLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value
               * DMTE.cdsDocPago.FieldByName('DETCPAG').Value * xFactor, 15, 2);
            DMTE.cdsDocPago.FieldByName('DEMTOORI').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALEXT').Value, 15, 2);
         End;

         DMTE.cdsDocPago.FieldByName('DEANTMN').Value := 0;
         DMTE.cdsDocPago.FieldByName('DEANTME').Value := 0;
//       DMTE.cdsDocPago.FieldByName('DEMTOORI').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').Value * xFactor, 15, 2);
// Fin HPC_201803_CAJA
         DMTE.cdsDocPago.FieldByName('DEMTOLOC').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALLOC').Value, 15, 2);
         DMTE.cdsDocPago.FieldByName('DEMTOEXT').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALEXT').Value, 15, 2);
         DMTE.cdsDocPago.FieldByName('DEUSER').Value := DMTE.wUsuario;
         DMTE.cdsDocPago.FieldByName('DEFREG').Value := dateS;
         DMTE.cdsDocPago.FieldByName('DEHREG').Value := time;
         DMTE.cdsDocPago.fieldbyname('CLAUXID').AsString := DMTE.cdsMovCxP.FieldByName('CLAUXID').AsString;
         // Inicio HPC_201703_CAJA
         // Validación SEMT para proveedores con cobranza coactiva
         DMTE.cdsDocPago.FieldByName('VALPAGPRO').Value := 'N';
         // Final HPC_201703_CAJA
         DMTE.cdsDocPago.Post;

         DMTE.cdsMovCxP.Edit;
         DMTE.cdsMovCxP.FieldByName('CPSALORI').Value := 0;
         DMTE.cdsMovCxP.Post;

         dbgPendientes.datasource.dataset.Freebookmark(dbgPendientes.SelectedList.items[i]);
      End;

      DMTE.cdsMovCxP.EnableControls;
      dbgPendientes.SelectedList.clear; { Clear selected record list since they are all deleted}
      dbgPendientes.RefreshDisplay;
      dbgDocPago.RefreshDisplay;
      DMTE.cdsDocPago.EnableControls;
      z2bbtnSumatDocPagoClick(Nil);
      If dblcTMon.Text = 'D' Then
         dbeImporte.text := dbgDocPago.ColumnByName('DEMTOEXT').FooterValue
      Else
         dbeImporte.text := dbgDocPago.ColumnByName('DEMTOLOC').FooterValue;

      wmodifica := True;
      // Inicio HPC_201703_CAJA
      // Validación SEMT para proveedores con cobranza coactiva
      dbgDocPago.SetControlType('VALPAGPRO', fctCheckBox,'S;N');      
      dbgDocPago.RefreshDisplay;
      DMTE.cdsDocPago.First;
      DMTE.cdsDocPago.EnableControls;							
      // Final HPC_201703_CAJA
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbgDocPagoColExit(Sender: TObject);
Begin
   z2bbtnSumatDocPagoClick(Nil);
   dbgDocPago.RefreshDisplay;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ActSaldosMovCxP;
Var
   xRegAct: TBookMark;
   xAdicional, nFactor: Double;
   xMontoL, xMontoE: String;
   xLoc, xExt, xOri, xcia, xtdia, xperio, xSQL, xnreg: String;
Begin
   DMTE.cdsMovCxP.DisableControls;
   DMTE.cdsMovCxP.Filtered := False;
   DMTE.cdsDocPago.DisableControls;
   xRegAct := DMTE.cdsDocPago.GetBookmark;
   DMTE.cdsDocPago.First;
   While Not DMTE.cdsDocPago.Eof Do
   Begin
      If DMTE.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
         VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID2').AsString,
         DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
            DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
            DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]), []) Then
      Begin
         xSQL := 'Select CIAID, CPANOMES, TDIARID, CPNOREG, CLAUXID, PROV, PROVRUC, '
            + '          DOCID, CPSERIE, CPNODOC, CPFRECEP, CPFEMIS, CPFVCMTO, TMONID, '
            + '          CPTCAMPR, CPTCAMPA, CPESTADO, CPOCOMP, CP_CONTA, CPGRAVAD, '
            + '          CPNOGRAV, CPIGV, CPISC, CPDCTO, CPSERVIC, CPMTOORI, CPMTOLOC, '
            + '          CPMTOEXT, CPPAGORI, CPPAGLOC, CPPAGEXT, CPSALORI, CPSALLOC, '
            + '          CPSALEXT, TCANJEID, CPCANJE, CPFCANJE, CPUSER, CPFREG, CPHREG, '
            + '          CPAAAA, CPMM, CPDD, CPTRI, CPSEM, CPSS, CPAATRI, CPAASEM, CPAASS, '
            + '          CPFCMPRB, DCPLOTE, DCPCOMP, CTATOTAL, FLAGVAR, CPTOTOT, CPIGV2, '
            + '          CPGRAVAD2, CPHMOD, FLAGVAR2, PROVDES, CLAUXREND, AUXIDREND, '
            + '          CCBCOID, BANCOID, SITUAID, CPFLAGTDOC, CXPRRHH, AUXIDINTER, '
            + '          CLAUXINTER, CPTCAMDOL, PROVRETIGV, CPTCAMAJ, DTRPORC, CPMTOORIB, '
            + '          DTRFLAG, FECDEPDET, NUMDEPDET, ADQ_NO_GRAV, IGV_GRA_NO_DEST, '
            + '          CP_OTROS, CPTODETRSUNATID, TIPOOPERSUNATID, PORCDESC, CP4TAPENSION, '
            + '          SNPAFPID, TIPCOMAFPID '
            + '     from CXP301 '
            + '    where CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID2').AsString)
            + '      and TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID2').AsString)
            + '      and CPANOMES=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPANOMM').AsString)
            + '      and CPNOREG=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPNOREG').AsString);
         DMTE.cdsQry5.Filter := '';
         DMTE.cdsQry5.Filtered := False;
         DMTE.cdsQry5.IndexFieldNames := '';
         DMTE.cdsQry5.Close;
         DMTE.cdsQry5.Datarequest(xSQL);
         DMTE.cdsQry5.Open;
         If (DMTE.cdsQry5.FieldByName('CPSALLOC').AsFloat <> DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat) Then
         Begin
            ShowMessage('Error, se ha realizado la actualización de la misma Obligación por otra estación');
            xSigueGrab := False;
            exit;
         End;

         nFactor := 1;
         If DMTE.cdsDocPago.FieldByName('DOCID2').AsString = '07' Then nFactor := -1;

         DMTE.cdsMovCxP.edit;
         If DMTE.cdsMovCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc Then
         Begin
            xMontoL := FloatToStrF(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat * nFactor, ffFixed, 8, 2);

            DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat -
               DMTE.numerononulo(DMTE.cdsMovCxP.FieldByName('CPPAGLOC')) -
               StrToFloat(xMontoL), 15, 2);
            DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat, 15, 2);
         // Cálculo del otro Saldo
            xAdicional := DMTE.FRound(StrToFloat(xMontoL) / DMTE.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat, 15, 2);
            DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat -
               DMTE.numerononulo(DMTE.cdsMovCxP.FieldByName('CPPAGEXT')) -
               xAdicional, 15, 2);
         End
         Else
         Begin
            xMontoE := FloatToStrF(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * nFactor, ffFixed, 8, 2);
            DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat -
               DMTE.numerononulo(DMTE.cdsMovCxP.FieldByName('CPPAGEXT')) -
               StrToFloat(xMontoE), 15, 2);
            DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat, 15, 2);
            xAdicional := DMTE.FRound(StrToFloat(xMontoE) * DMTE.cdsMovCxp.FieldByName('CPTCAMAJ').AsFloat, 15, 2); // ) ;
            DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat -
               DMTE.numerononulo(DMTE.cdsMovCxP.FieldByName('CPPAGLOC')) -
               xAdicional, 15, 2);
         End;

         xLoc := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsString;
         xExt := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsString;
         xOri := DMTE.cdsMovCxP.FieldByName('CPSALORI').AsString;
         xcia := DMTE.cdsMovCxp.fieldbyname('CIAID').AsString;
         xtdia := DMTE.cdsMovCxp.fieldbyname('TDIARID').AsString;
         xperio := DMTE.cdsMovCxp.fieldbyname('CPANOMES').AsString;
         xnreg := DMTE.cdsMovCxp.fieldbyname('CPNOREG').AsString;

         If DMTE.cdsMovCxP.FieldByName('CPPAGLOC').IsNull Then
            DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := 0;
         If DMTE.cdsMovCxP.FieldByName('CPPAGEXT').IsNull Then
            DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := 0;
         If DMTE.cdsMovCxP.FieldByName('CPPAGORI').IsNull Then
            DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := 0;
         DMTE.cdsMovCxP.post;

         xSQL := 'Update CXP301 '
            + '      set CPPAGLOC=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat) + ','
            + '          CPPAGEXT=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat) + ','
            + '          CPPAGORI=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat) + ','
            + '          CPSALLOC=' + xloc + ', '
            + '          CPSALEXT =' + xext + ', '
            + '          CPSALORI =' + xori
            + '    where CIAID=' + quotedstr(xcia)
            + '      and TDIARID=' + quotedstr(xtdia)
            + '      and CPANOMES=' + quotedstr(xperio)
            + '      and CPNOREG=' + quotedstr(xnreg);
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('No se actualizó la Provision por Pagar: ' + chr(13)
               + ' Compañía = ' + quotedstr(xCia) + chr(13)
               + ' Tipo de Diario =' + quotedstr(xtDia) + chr(13)
               + ' Año + Mes =' + quotedstr(xperio) + chr(13)
               + ' Nro.Registro' + quotedstr(xnreg));
            xSigueGrab := False;
            exit;
         End;
      End
      Else
      Begin
         Showmessage('No se encontró la Provisión por Pagar: ' + chr(13)
            + ' Compañía = ' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID2').AsString) + chr(13)
            + ' Tipo de Diario =' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID2').AsString) + chr(13)
            + ' Año + Mes =' + quotedstr(DMTE.cdsDocPago.FieldByName('CPANOMM').AsString) + chr(13)
            + ' Nro.Registro' + quotedstr(DMTE.cdsDocPago.FieldByName('CPNOREG').AsString));
         xSigueGrab := False;
         exit;
      End;
      DMTE.cdsDocPago.Next;
   End;
   DMTE.cdsDocPago.GotoBookmark(xRegAct);
   DMTE.cdsDocPago.FreeBookmark(xRegAct);
   DMTE.cdsDocPago.EnableControls;
   DMTE.cdsMovCxP.Filtered := True;
   DMTE.cdsMovCxP.EnableControls;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ActMovCxP;
Var
   xRegAct: TBookMark;
   xtcam, xori, xSQL: String;
   xcia, xtdia, xperio, xnreg: String;
Begin
   DMTE.cdsMovCxP.Filtered := False;
   DMTE.cdsMovCxP.First;
   DMTE.cdsDocPago.DisableControls;
   xRegAct := DMTE.cdsDocPago.GetBookmark;
   DMTE.cdsDocPago.First;
   While Not DMTE.cdsDocPago.Eof Do
   Begin
      If DMTE.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
         VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID2').AsString,
         DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
            DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
            DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),
            []) Then
      Begin
         xcia := DMTE.cdsDocPago.FieldByName('CIAID2').AsString;
         xtdia := DMTE.cdsDocPago.FieldByName('TDIARID2').AsString;
         xperio := DMTE.cdsDocPago.FieldByName('CPANOMM').AsString;
         xnreg := DMTE.cdsDocPago.FieldByName('CPNOREG').AsString;

         DMTE.cdsMovCxP.edit;

         DMTE.cdsMovCxP.fieldbyname('CPPAGLOC').AsFloat :=
            DMTE.FRound(DMTE.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat
            - DMTE.cdsMovCxP.fieldbyname('CPSALLOC').AsFloat, 15, 2);
         DMTE.cdsMovCxP.fieldbyname('CPPAGEXT').AsFloat :=
            DMTE.FRound(DMTE.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat
            - DMTE.cdsMovCxP.fieldbyname('CPSALEXT').AsFloat, 15, 2);

         If DMTE.cdsMovCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc Then
         Begin
            DMTE.cdsMovCxP.fieldbyname('CPPAGORI').AsFloat :=
               DMTE.cdsMovCxP.fieldbyname('CPPAGLOC').AsFloat;
            If DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat <= 0.02 Then
               DMTE.cdsMovCxP.FieldByName('CPESTADO').AsString := 'C';
         End
         Else
         Begin
            DMTE.cdsMovCxP.fieldbyname('CPPAGORI').AsFloat :=
               DMTE.cdsMovCxP.fieldbyname('CPPAGEXT').AsFloat;
            If DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat <= 0.02 Then
               DMTE.cdsMovCxP.FieldByName('CPESTADO').AsString := 'C';
         End;
         DMTE.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat, 15, 3);
         DMTE.cdsMovCxP.Post;

         xSQL := 'Update CXP301 '
            + '      set CPPAGLOC=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat) + ','
            + '          CPPAGEXT=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat) + ','
            + '          CPPAGORI=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat) + ','
            + '          CPSALLOC=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat) + ','
            + '          CPSALEXT=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat) + ','
            + '          CPSALORI=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat) + ','
            + '          CPESTADO=' + quotedstr(DMTE.cdsMovCxP.FieldByName('CPESTADO').AsString)
            + '    where CIAID=' + quotedstr(xcia)
            + '      and TDIARID=' + quotedstr(xtdia)
            + '      and CPANOMES=' + quotedstr(xperio)
            + '      and CPNOREG=' + quotedstr(xnreg);
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            xSigueGrab := False;
            exit;
         End;
      End
      Else
      Begin
         ShowMessage('Error : No pudo ubicar el Documento Provisionado');
      End;
      DMTE.cdsDocPago.Next;
   End;

   DMTE.cdsDocPago.GotoBookmark(xRegAct);
   DMTE.cdsDocPago.FreeBookmark(xRegAct);
   DMTE.cdsDocPago.EnableControls;
   DMTE.cdsMovCxP.Filtered := True;
   DMTE.cdsMovCxP.First;
   DMTE.cdsMovCxP.EnableControls;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.RetornaSaldosMovCxP;
Var
   xSQL: String;
Begin
   DMTE.cdsMovCxP.DisableControls;
   DMTE.cdsMovCxP.Filtered := False;
   DMTE.cdsDocPago.DisableControls;
   DMTE.cdsDocPago.First;
   While Not DMTE.cdsDocPago.Eof Do
   Begin
      If DMTE.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
         VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID2').AsString,
         DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
            DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
            DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]), []) Then
      Begin
         DMTE.cdsMovCxP.edit;
         If DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value = 'I' Then
         Begin
            DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat :=
               DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat
               - DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat, 15, 2);
            DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat :=
               DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat
               - DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat, 15, 2);
            If DMTE.cdsMovCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
               DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat :=
                  DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat
            Else
               DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat :=
                  DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;
         End;

         DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat - DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat, 15, 2);
         DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat - DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat, 15, 2);
         DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat - DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat, 15, 2);
         DMTE.cdsMovCxP.Post;
// Inicio HPC_201801_CAJA
// Se cambia la compañia del control por el cds
         xSQL := 'Update CXP301 '
            + '      Set CPSALEXT=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat) + ', '
            + '          CPSALLOC=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat) + ', '
            + '          CPSALORI=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat) + ', '
            + '          CPPAGEXT=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat) + ', '
            + '          CPPAGLOC=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat) + ', '
            + '          CPPAGORI=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat)
            + '    where CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID2').AsString)
            + '      and CPANOMES=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPANOMM').AsString)
            + '      and TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID2').AsString)
            + '      and CPNOREG=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPNOREG').AsString);
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error al intentar grabar la cabecera del Egreso');
            xSigueGrab := False;
            Exit;
         End;
// Fin HPC_201801_CAJA

         If DMTE.cdsEgrCaja.FieldByName('ECEstado').Value = 'C' Then
         Begin
            DMTE.SaldosAuxiliar(DMTE.cdsMovCxP.FieldByName('CIAID').AsString,
               DMTE.cdsMovCxP.fieldbyname('CPANOMES').AsString,
               DMTE.cdsMovCxP.fieldbyname('CLAUXID').AsString,
               DMTE.cdsMovCxP.fieldbyname('PROV').AsString, '+',
               DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat,
               DMTE.cdsMovCxP.fieldbyname('DEMTOEXT').AsFloat,
               DMTE.cdsMovCxP.fieldbyname('TMONID').AsString);
         End;
      End;
      DMTE.cdsDocPago.Next;
   End;
   DMTE.cdsDocPago.EnableControls;
   DMTE.cdsMovCxP.Filtered := True;
   DMTE.cdsMovCxP.EnableControls;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.RetornaSaldosMovCxPPagados;
Var
   xSQL: String;
Begin
   DMTE.cdsDocPago.DisableControls;
   DMTE.cdsDocPago.First;
   While Not DMTE.cdsDocPago.Eof Do
   Begin
      xSQL := 'Select CIAID, CPANOMES, TDIARID, CPNOREG, CLAUXID, PROV, PROVRUC, '
         + '          DOCID, CPSERIE, CPNODOC, CPFRECEP, CPFEMIS, CPFVCMTO, TMONID, '
         + '          CPTCAMPR, CPTCAMPA, CPESTADO, CPOCOMP, CP_CONTA, CPGRAVAD, '
         + '          CPNOGRAV, CPIGV, CPISC, CPDCTO, CPSERVIC, CPMTOORI, CPMTOLOC, '
         + '          CPMTOEXT, CPPAGORI, CPPAGLOC, CPPAGEXT, CPSALORI, CPSALLOC, '
         + '          CPSALEXT, TCANJEID, CPCANJE, CPFCANJE, CPUSER, CPFREG, CPHREG, '
         + '          CPAAAA, CPMM, CPDD, CPTRI, CPSEM, CPSS, CPAATRI, CPAASEM, CPAASS, '
         + '          CPFCMPRB, DCPLOTE, DCPCOMP, CTATOTAL, FLAGVAR, CPTOTOT, CPIGV2, '
         + '          CPGRAVAD2, CPHMOD, FLAGVAR2, PROVDES, CLAUXREND, AUXIDREND, '
         + '          CCBCOID, BANCOID, SITUAID, CPFLAGTDOC, CXPRRHH, AUXIDINTER, '
         + '          CLAUXINTER, CPTCAMDOL, PROVRETIGV, CPTCAMAJ, DTRPORC, CPMTOORIB, '
         + '          DTRFLAG, FECDEPDET, NUMDEPDET, ADQ_NO_GRAV, IGV_GRA_NO_DEST, '
         + '          CP_OTROS, CPTODETRSUNATID, TIPOOPERSUNATID, PORCDESC, CP4TAPENSION, '
         + '          SNPAFPID, TIPCOMAFPID '
         + '     from CXP301 '
         + '    where CIAID=''' + DMTE.cdsDocPago.FieldByName('CIAID2').AsString + ''' '
         + '      and TDIARID=''' + DMTE.cdsDocPago.FieldByName('TDIARID2').AsString + ''' '
         + '      and CPANOMES=''' + DMTE.cdsDocPago.FieldByName('CPANOMM').AsString + ''' '
         + '      and CPNOREG=''' + DMTE.cdsDocPago.FieldByName('CPNOREG').AsString + '''';
      DMTE.cdsMovCxP.IndexFieldnames := '';
      DMTE.cdsMovCxP.Filter := '';
      DMTE.cdsMovCxP.Filtered := False;
      DMTE.cdsMovCxP.Close;
      DMTE.cdsMovCxP.DataRequest(xSQL);
      DMTE.cdsMovCxP.Open;

      DMTE.cdsMovCxP.edit;

      DMTE.cdsMovCxP.FieldByName('CPESTADO').Value := 'P';

      If DMTE.cdsMovCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
      Begin
         DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat + Abs(DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat), 15, 2);
         DMTE.cdsMovCxP.FieldByName('CPSALORI').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat, 15, 2);
         DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat / DMTE.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat, 15, 2);
      End
      Else
      Begin
         DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat + Abs(DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat), 15, 2);
         DMTE.cdsMovCxP.FieldByName('CPSALORI').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat, 15, 2);
         DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat * DMTE.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat, 15, 2);
      End;

      DMTE.cdsMovCxP.FieldByName('CPPAGEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat - DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat, 15, 2);
      DMTE.cdsMovCxP.FieldByName('CPPAGLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat - DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat, 15, 2);
      DMTE.cdsMovCxP.FieldByName('CPPAGORI').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat - DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat, 15, 2);

      If DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat < 0 Then
      Begin
         DMTE.cdsMovCxP.FieldByName('CPPAGEXT').Value := 0;
         DMTE.cdsMovCxP.FieldByName('CPPAGLOC').Value := 0;
         DMTE.cdsMovCxP.FieldByName('CPPAGORI').Value := 0;
      End;

      If DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALORI').Value, 15, 2) > DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat, 15, 2) Then
      Begin
         DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat, 15, 2);
         DMTE.cdsMovCxP.FieldByName('CPSALORI').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat, 15, 2);
         DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat, 15, 2);
      End;
      DMTE.cdsMovCxP.Post;
// Inicio HPC_201801_CAJA
// Se cambia el valor de la compañia para la actualización de la provisión
      xSQL := 'Update CXP301 '
         + '      Set CPESTADO=' + QuotedStr(DMTE.cdsMovCxP.FieldByName('CPESTADO').AsString) + ','
         + '          CPSALLOC=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat) + ','
         + '          CPSALORI=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat) + ','
         + '          CPSALEXT=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat) + ','
         + '          CPPAGEXT=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat) + ','
         + '          CPPAGLOC=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat) + ','
         + '          CPPAGORI=' + floattostr(DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat)
         + '    where CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID2').AsString)
         + '      and CPANOMES=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPANOMM').AsString)
         + '      and TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID2').AsString)
         + '      and CPNOREG=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPNOREG').AsString);
// Fin HPC_201801_CAJA
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al intentar grabar la cabecera del Egreso');
         xSigueGrab := False;
         Exit;
      End;
//      DMTE.SaldosAuxiliar(DMTE.cdsMovCxP.FieldByName('CIAID').AsString, DMTE.cdsMovCxP.fieldbyname('CPANOMES').AsString,
//         DMTE.cdsMovCxP.fieldbyname('CLAUXID').AsString, DMTE.cdsMovCxP.fieldbyname('PROV').AsString, '+',
//         DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat, DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat, DMTE.cdsMovCxP.fieldbyname('TMONID').AsString);
      DMTE.cdsDocPago.Next;
   End;

   DMTE.cdsDocPago.EnableControls;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.FormKeyPress(Sender: TObject; Var Key: Char);
Var
   xStr: String;
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;

   If Not aplicaKeyPress(self, A2digitos, A4digitos) Then
      Exit;
   If Not (Key In ['0'..'9', '.', #8]) Then
   Begin
      Key := #0;
   End;
   xStr := TCustomEdit(self.ActiveControl).text;
   If key = '.' Then
      If pos('.', xSTR) <> 0 Then
         Key := #0;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnOKCabClick(Sender: TObject);
Var
   xWhere: String;
   xSQL: String;
Begin
   If dbdtpFComp.Date = 0 Then
   Begin
      ShowMessage('Fecha de Comprobante Errada');
      dbdtpFComp.SetFocus;
      Exit;
   End;

   If validacionCabecera = False Then
      exit;

   dbeTCambio.Text := DMTE.RecuperarTipoCambio(dbdtpFComp.date);

   xWhere := 'CIAID =' + quotedstr(dblcCia.Text)
      + ' AND TDIARID =' + quotedstr(dblcTDiario.Text)
      + ' AND ECANOMM =' + quotedstr(edtPeriodo.Text)
      + ' AND ECNOCOMP =' + quotedstr(dbeNoComp.Text);
   If DMTE.DisplayDescrip('prvTGE', 'CAJA302', 'COUNT(*) TOTREG', xWhere, 'TOTREG') > '0' Then
   Begin
      ShowMessage('Comprobante ya está Registrado');
      dbeNoComp.Text := '';
      dbeNoComp.SetFocus;
      exit;
   End;

   GrabaCabeceraDeComprobante;

   // 9729 ORACLE Y 13059 DB2NT
   If (DMTE.wCodigoError = 9729) Or
      (DMTE.wCodigoError = 13059) Then
   Begin
      dbeNoComp.SetFocus;
      Exit;
   End;

   ActivaFiltro('REGCXP');
   ActivaFiltro('DOCPAGO');

  //liberamos el filtro del detalle
   DMTE.cdsRegCxP.Filtered := False;

   CambiaEstado('N');
   ActPnlBotones;

   (Sender As tcontrol).enabled := false;
   perform(CM_DialogKey, VK_TAB, 0);
   wmodifica := False;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbeNoCompExit(Sender: TObject);
Begin
   dbeNoComp.text := DMTE.StrZero(dbeNoComp.text, DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbgDocPagoCalcTitleAttributes(Sender: TObject;
   AFieldName: String; AFont: TFont; ABrush: TBrush;
   Var ATitleAlignment: TAlignment);
Begin
   If (AFieldName = 'DEMTOLOC') Or (AFieldName = 'DEMTOEXT') Then
      ABrush.Color := clWhite;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbgOtrosCalcTitleAttributes(Sender: TObject;
   AFieldName: String; AFont: TFont; ABrush: TBrush;
   Var ATitleAlignment: TAlignment);
Begin
   If (AFieldName = 'DEMTOLOC') Or (AFieldName = 'DEMTOEXT') Then
      ABrush.Color := clWhite;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.InhabilitarPaneles;
Begin
   pnlDetalle.Enabled := False;
   pnlBotones.Enabled := False;
   IniciaPanel;
   pnlActualiza.BringToFront;
   pnlActualiza.Visible := True;
   dbeNoReg.Enabled := True;
   dbeNoReg.Color := clWindow;

   dbeNoReg.SetFocus;
   //Aqui se establecen los filtros para edicion en el grid
   establecerfiltrosRegistroEgresos;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.EdiTarRegistros;
Begin
   BlanqueaEdits(pnlActualiza);
   DMTE.cdsRegCxP.Edit; //Lo pongo en modo de edicion
   dbeNoReg.Text := DMTE.cdsRegCxP.FieldByName('CPNOREG').Value;
   dbeNoReg.Enabled := false;
   lblEstado.Caption := 'En Edicion';
   dbeNoReg.Enabled := False;
   dbeNoReg.Color := clBtnFace;

   If Not DMTE.cdsClaseAux.Locate('CLAUXID', VarArrayOf([dblcClase.Text]), []) Then
      Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''');

// Recuperacion de los detalles del panel
   edtCnp2.Text := DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString;
   If (trim(dblcTDoc2.Text) <> '') And (Trim(edtCnp2.Text) = '') Then
      edtTDoc2.Text :=
         DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCABR', 'DOCID=''' + dblcTDoc2.Text + '''', 'DOCABR');
   If trim(dblcdCnp2.Text) <> '' Then
      edtCnp2.Text := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTOABR', 'CPTOID=''' + dblcdCnp2.Text + '''', 'CPTOABR');
   If trim(dblcdAuxDet.Text) <> '' Then
   Begin
      dbeAuxDet.Text :=
         DMTE.DisplayDescrip('prvTGE', 'CNT201', 'AUXABR',
         'CLAUXID = ''' +
         DMTE.cdsRegCxP.fieldbyname('CLAUXID').AsString
         + ''' AND AUXID=''' + dblcdAuxDet.Text + '''', 'AUXABR');
      edtClaseDet.Text :=
         DMTE.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXABR',
         'CLAUXID = ''' +
         DMTE.cdsRegCxP.fieldbyname('CLAUXID').AsString + ''' ', 'clauxabr');

   End;

   If trim(dblcTMon2.Text) <> '' Then
      edtTMon2.Text := DMTE.DisplayDescripLocal(DMTE.cdsTMon, 'TMONID', dblctmon2.Text, 'TMONABR');
   //fin de los detalles del panel

   If Not DMTE.cdsRegCxP.FieldByName('PROV').Isnull Then
   Begin
      If trim(DMTE.cdsRegCxP.FieldByName('PROV').AsString) <> '' Then
         dblcdAuxDet.Enabled := True
      Else
         dblcdAuxDet.Enabled := False;
   End
   Else
      dblcdAuxDet.Enabled := False;

   If Not DMTE.cdsRegCxP.FieldByName('CCOSID').Isnull Then
   Begin
      If trim(DMTE.cdsRegCxP.FieldByName('CCOSID').AsString) <> '' Then
         dblcdCCosto.Enabled := True
      Else
         dblcdCCosto.Enabled := False;
   End
   Else
      dblcdCCosto.Enabled := False;

   dblcClaseDet.Enabled := dblcdAuxDet.Enabled;
   If Not dblcClaseDet.Enabled Then
   Begin
      edtClaseDet.Text := '';
      dbeAuxDet.Text := '';
   End
   Else
      If Not DMTE.cdsClaseAux.Locate('CLAUXID', VarArrayOf([dblcClaseDet.Text]), []) Then
         Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''');

End;

{******************************************************************************}

Procedure TFPagoGlobal2.AdicionarRegistros;
Var
   xWhere, Aux: String;
Begin
   BlanqueaEdits(pnlActualiza);
   dbeSerie.Text := '000';

   dbeNoReg.Enabled := true;
   dbeNoReg.Text := '';
   dbeNoReg.Text := GeneraCorrelativo(DMTE.cdsRegCxP, 'CPNOREG');

   DMTE.cdsRegCxP.Insert;
   DMTE.cdsRegCxP.FieldByName('CIAID').Value := dblcCia.Text;
   DMTE.cdsRegCxP.FieldByName('TDIARID').Value := dblcTDiario.Text;
   DMTE.cdsRegCxP.FieldByName('ECANOMM').Value := edtPeriodo.Text;
   DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value := dbeNoComp.Text;

   If Length(DMTE.cdsRegCxP.FieldByName('DOCID2').AsString) > 0 Then
      DMTE.cdsRegCxP.FieldByName('DOCMOD').AsString := wDocModulo
   Else
      DMTE.cdsRegCxP.FieldByName('DOCMOD').Clear;

   DMTE.cdsRegCxP.FieldByName('DETCPAG').Value := strtofloat(dbeTCambio.Text);
   DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DMTE.cdsRegCxP.FieldByName('CPFEMIS').Value := DateS;
   DMTE.cdsRegCxP.FieldByName('CPFVCMTO').Value := DateS;
   DMTE.cdsRegCxP.FieldByName('CPANOMM').Value := copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value), 7, 4)
      + copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value), 4, 2);
   DMTE.cdsRegCxP.FieldByName('DETCPAG').Value := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
   DMTE.cdsRegCxP.FieldByName('DETCDOC').Value := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
   DMTE.cdsRegCxP.FieldByName('DEDH').Value := 'D'; //Inicializo en Debe

   xWhere := 'FECHA=' + DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha, DMTE.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime) + ''')';
   aux := DMTE.DisplayDescrip('prvTGE', 'TGE114', '*', xWhere, 'FECANO');
   DMTE.cdsRegCxP.FieldByName('DEANO').Value := DMTE.cdsqry.FieldByName('FECANO').Value;
   DMTE.cdsRegCxP.FieldByName('DEMM').Value := DMTE.cdsqry.FieldByName('FECMES').Value;
   DMTE.cdsRegCxP.FieldByName('DEDD').Value := DMTE.cdsqry.FieldByName('FECDIA').Value;
   DMTE.cdsRegCxP.FieldByName('DESS').Value := DMTE.cdsqry.FieldByName('FECSS').Value;
   DMTE.cdsRegCxP.FieldByName('DESEM').Value := DMTE.cdsqry.FieldByName('FECSEM').Value;
   DMTE.cdsRegCxP.FieldByName('DETRI').Value := DMTE.cdsqry.FieldByName('FECTRIM').Value;
   DMTE.cdsRegCxP.FieldByName('DEAASS').Value := DMTE.cdsqry.FieldByName('FECAASS').Value;
   DMTE.cdsRegCxP.FieldByName('DEAASEM').Value := DMTE.cdsqry.FieldByName('FECAASEM').Value;
   DMTE.cdsRegCxP.FieldByName('DEAATRI').Value := DMTE.cdsqry.FieldByName('FECAATRI').Value;
   dbeNoReg.SetFocus;

   //blanqueo de descripciones
   edtTDoc2.Text := '';
   edtCnp2.Text := '';
   dbeAuxDet.Text := '';
   edtTMon2.Text := '';
   dblcClaseDet.Enabled := False;
   dblcdAuxDet.Enabled := False;
   dblcdCCosto.Enabled := False;
   lblEstado.Caption := 'Nuevo     ';
   cdsTDiarioDet.Filter := 'TDIARID=''''';
   cdsTDiarioDet.Filtered := True;

   If Not DMTE.cdsClaseAux.Locate('CLAUXID', VarArrayOf([dblcClase.Text]), []) Then
      Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''');

End;

{******************************************************************************}

Procedure TFPagoGlobal2.LiberarFiltrosRegistroEgresos;
Begin
   DMTE.cdsTDoc.Filter := '';
   DMTE.cdsTDoc.Filtered := true;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.EstablecerFiltrosRegistroEgresos;
Begin
   DMTE.cdsTDoc.Filter := 'NOT ( TDIARID IS NULL) OR NOT (TDIARID2 IS NULL) ';
   DMTE.cdsTDoc.Filtered := true;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbeNoRegExit(Sender: TObject);
Begin
   If Not z2bbtnCancel3.Focused Then
   Begin
      dbeNoReg.Text := DMTE.strzero(dbeNoReg.Text, 10);
      If strtoint(dbeNoReg.Text) = 0 Then
      Begin // NoRegistro
         dbeNoReg.Text := '';
         ShowMessage('No es valido el No Registro');
         dbeNoReg.SetFocus;
         exit;
      End;
      DMTE.cdsRegCxP.FieldByName('CPNOREG').Value := dbeNoReg.Text;
   End
   Else
      dbeNoReg.Text := '';
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnOK2Click(Sender: TObject);
Begin
// Valida la Cuenta del Concepto
   If (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text, dblcdCnp2.text, '')) And (dblcTMon2.text = DMTE.wTMonLoc) Then
   Begin
      Raise Exception.Create('La cuenta ' + DMTE.cdsQry.FieldByName('CUENTAID').AsString + ' del Concepto ' + dblcdCnp2.text + ' Se registra sólo en Moneda Extranjera.');
   End;

   If DMTE.cdsRegCxP.State = dsInsert Then
      If EncuentraDuplicado(DMTE.cdsRegCxP, 'CPNOREG', dbeNoReg.Text) Then
      Begin
         ShowMessage('Numero de Registro duplicado');
         dbeNoReg.SetFocus;
         exit;
      End;

   If Not ValidaCampo Then
      ShowMessage('No se puede grabar')
   Else
   Begin
      If Length(DMTE.cdsRegCxP.FieldByName('DOCID2').AsString) > 0 Then
         DMTE.cdsRegCxP.FieldByName('DOCMOD').AsString := wDocModulo
      Else
         DMTE.cdsRegCxP.FieldByName('DOCMOD').Clear;

      DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString := edtCnp2.Text;
      DMTE.cdsRegCxP.Post;
      ShowMessage('Grabación Ok');
      wmodifica := True;
      If Not dbeNoReg.Enabled Then
      Begin
         PnlActualiza.Visible := False;
         pnlDetalle.Enabled := True;
         pnlBotones.Enabled := True;
         z2bbtnSumatClick(sender);
         liberarfiltrosregistroegresos;
      End
      Else
      Begin
         adicionarRegistros;
      End;
   End;

End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcTMon2Exit(Sender: TObject);
Begin

   If z2bbtnCancel3.Focused Then exit;
   If dblcdCnp2.Focused Then exit;
   If dblcClaseDet.Focused Then exit;
   If dblcdAuxDet.Focused Then exit;
   If dblcdCCosto.Focused Then exit;

   edtTMon2.text := DMTE.DisplayDescripLocal(DMTE.cdsTMon, 'TMONID', dblcTMon2.Text, 'TMONDES');

   If edtTMon2.Text = '' Then
   Begin
      ShowMessage('Error : Moneda no Valida');
      dblcTMon2.SetFocus;
      Exit;
   End;

   If DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value > 0 Then
   Begin
      If DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc Then
      Begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value := DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value := DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
      End
      Else
      Begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value := DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value * DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value := DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
      End;
   End
   Else
   Begin
      DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value := 0;
      DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value := 0;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbeDHChange(Sender: TObject);
Begin
   If Not ((dbeDH.Text = 'D') Or (dbeDH.Text = 'H') Or (length(dbeDH.Text) = 0)) Then
   Begin
      dbeDH.Text := '';
      dbeDH.SetFocus;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbeImporte2Exit(Sender: TObject);
Var
   xWhere, aux: String;
Begin
   If z2bbtnCancel3.Focused Then
      exit;
   xWhere := 'TMONID=' + '''' + DMTE.cdsRegCxP.FieldByName('TMONID').Value + '''';
   aux := DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
   If (length(aux) > 0) And (DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value > 0) Then
   Begin
      If DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc Then
      Begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value := DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value := DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
      End
      Else
      Begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value := DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value * DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value := DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
      End;
   End
   Else
   Begin
      DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value := 0;
      DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value := 0;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnCancel3Click(Sender: TObject);
Begin
   If DMTE.cdsRegCxP.State = dsInsert Then
      DMTE.cdsRegCxP.Delete
   Else
   Begin
      If DMTE.cdsRegCxP.State = dsedit Then
         DMTE.cdsRegCxP.Cancel;
   End;
   PnlActualiza.Visible := False;
   pnlDetalle.Enabled := True;
   pnlBotones.Enabled := True;
   z2bbtnSumatClick(sender);
   liberarfiltrosregistroegresos;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbgOtrosDblClick(Sender: TObject);
Begin
   If Not dbgOtrosIbutton.Enabled Then
      exit;

   If dbgOtros.DataSource.DataSet.RecordCount <> 0 Then
   Begin
      inHabilitarPaneles;
      editarRegistros;
   End;
End;

{******************************************************************************}

Function TFPagoGlobal2.ValidacionCabecera: Boolean;
Begin
   result := false;

   If trim(edtCia.text) = '' Then
   Begin
      ShowMessage('Ingrese Compañía');
      dblccia.SetFocus;
      exit;
   End;

   If dbdtpFComp.Date = 0 Then
   Begin
      ShowMessage('Ingrese Fecha de Comprobante');
      dbdtpFComp.SetFocus;
      exit;
   End;

   If trim(edtPeriodo.text) = '' Then
   Begin
      ShowMessage('Ingrese Fecha de Comprobante');
      dbdtpFComp.SetFocus;
      exit;
   End;

   If (trim(dblcTDiario.text) = '') Or (trim(edtTDiario.text) = '') Then
   Begin
      ShowMessage('Ingrese Tipo de Diario');
      dblcTDiario.SetFocus;
      exit;
   End;

   If trim(dbeNocomp.text) = '' Then
   Begin
      ShowMessage('Ingrese Número de Comprobante');
      dbeNocomp.SetFocus;
      exit;
   End;

   result := true;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnImprimeClick(Sender: TObject);
Var
   xWhere, xxAA, xSQL44: String;
Begin
// Si el comprobante de caja no ha sido contabilizado
// inicia variables que se acumulan
   If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'A' Then
   Begin
      ImprimeVoucher('CNT311G', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text);
      Exit;
   End;

   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' Then
   Begin
      ShowMessage('Para Imprimir Comprobante, Debe Contabilizar el Voucher ');
      Exit;
   End;

   xMtol := 0;
   xMtoE := 0;
   xMtoTotalL := 0;
   xMtoTotalE := 0;
   xMtoTotalHL := 0;
   xMtoTotalHE := 0;
   xNReg := 0;
   If xDTRPorc > 0 Then
   Begin
{
   // PARA UBICAR EL REGISTRO SELECCIONADO EN EL DBGDOCPAGO(CAJA303) COINCIDA CON EL CAJA302
      DMTE.cdsEgrCaja.Filter := '';
      DMTE.cdsEgrCaja.Filtered := False;
      DMTE.cdsEgrCaja.Filter := ' CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
         + ' and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
         + ' and TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
         + ' and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
      DMTE.cdsEgrCaja.Filtered := True;

      If DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString = '' Then xDTRPorc := 0;

      If DMTE.cdsEgrCaja.Recordcount <= 0 Then
      Begin

         xSQL44 := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, CLAUXID, PROV, PROVRUC, '
            + '          ECFCOMP, ECFEMICH, ECFPAGOP, ECFCOBCH, FPAGOID, DOCID, '
            + '          ECNODOC, TMONID, ECTCAMB, ECMTOORI, ECMTOLOC, ECMTOEXT, '
            + '          BANCOID, CCBCOID, ECNOCHQ, ECGIRA, CPTOID, CUENTAID, ECGLOSA, '
            + '          ECLOTE, ECELABO, ECAPROB, ECESTADO, ECCONTA, ECUSER, ECFREG, '
            + '          ECHREG, ECANO, ECMM, ECDD, ECSS, ECSEM, ECTRI, ECAASS, ECAASEM, '
            + '          ECAATRI, FLAGVAR, EC_PROCE, ECOPAGO, TDIARIO2, ECNOCOMP2, '
            + '          ECANOMM2, EC_IE, ECCHQEMI, USERRESP, EQUIID, ECCHKEST, ECPERNDOC, '
            + '          ECPERREC, TIPDOCCOD, PERID, ECFENTR, ECCONSOLID, ECMTCON, ECFCV, '
            + '          ECCOBLOC, ECMTDIF, ECCOBEXT, ECDEVLOC, ECDEVEXT, FEXTCHQ, FLUEID, '
            + '          ECCONING, ECNOREPO, CLAUXID1, AUXID, PROV1, CCBCOVOUCH, PRVBANCOID, '
            + '          PRVCCBCOID, ECSALMN, ECSALME, CAJARETIGV, FDOFIJJUST, GCONCID, '
            + '          TIPDET, ECNOCOMPR, CNTCOMPROB, KEYVALE, FLGREN '
            + '     from CAJA302 '
            + '    Where CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
            + '      and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
            + '      and TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
            + '      and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
         DMTE.cdsEgrCaja.Close;
         DMTE.cdsEgrCaja.Filtered := False;
         DMTE.cdsEgrCaja.Filter := '';
         DMTE.cdsEgrCaja.DataRequest(xSQL44);
         DMTE.cdsEgrCaja.Open;
      End;
}
   End;

   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' Then
   Begin
   // recupera Conceptos y Cuentas por diferencia de cambio
      RecCptosDifC;
      Contabiliza;

      ActualizaCNT311(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
         DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
         DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
         DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString);

      If SOLContaG(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
         DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
         DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
         DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
         DMTE.SRV_D, 'PPG', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
         DMTE.cdsResultSet, DMTE.DCOM1, Self) Then

         If xDTRPorc > 0 Then
            ImprimeVoucher('CNT311G', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text,
               DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString, dbeGlosa.Text)
         Else
            ImprimeVoucher('CNT311G', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text);
   End;

// Si el comprobante de caja ya fue contabilizado
   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' Then
   Begin
      If xDTRPorc > 0 Then
         ImprimeVoucher('CNT301G', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text,
            dbeNoComp.Text, dbeGlosa.Text)
      Else
         ImprimeVoucher('CNT301G', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text);
   End;
   dbgDocPago.ReadOnly := True;
   DMTE.cdsDocPago.EnableControls;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.FormShow(Sender: TObject);
Var
   xSQL, xWhere: String;
Begin
   DMTE.AccesosUsuarios(DMTE.wModulo, DMTE.wUsuario, '2', Screen.ActiveForm.Name);
   xVoucher := '';
   vYanoRetencion := 'N';
   Limpiapnlaux;

   sFlagAbono := 'N'; // Si emite Cheque
   sFlagAbono := 'S'; // Si no emite cheque

   If DMTE.cdsFormPago.RecordCount = 1 Then
   Begin
      dblcFormPago.Value := DMTE.cdsFormPago.FieldByName('FPAGOID').Asstring;
      dbeNoChq.Enabled := True;
      dbdtpFEmis.Enabled := True;
      xWhere := 'FPAGOID=' + quotedstr(dblcFormPago.text);
      If DMTE.DisplayDescrip('prvQry2', 'TGE112', 'FCANJE', xWhere, 'FCANJE') = 'S' Then
      Begin
         edtCuenta.Enabled := True;
         edtFormPago.Text := DMTE.cdsQry.FieldByName('FPAGODES').AsString;
      End
      Else
      Begin
         edtCuenta.Enabled := False;
         edtAuxpnl.Visible := False;
         edtclasepnl.Visible := False;
      End;

      If (DMTE.cdsFormPago.FieldByName('FCHQ').AsString = '1') Or
         (DMTE.cdsFormPago.FieldByName('FCHQ').AsString = 'S') Then
      Begin
         dbeNoChq.Enabled := True;
         dbdtpFEmis.Enabled := True;
         dbeNoChq.SetFocus;
      End
      Else
      Begin
         dbeNoChq.Enabled := False;
         dbdtpFEmis.Enabled := False;
      End;
   End;
   dbeLote.text := '000';
   dbeLote.OnExit(self);

   If DMTE.wModo = 'A' Then
      Adiciona
   Else
   Begin
      xSQL := 'Select A.CPTOID, A.CPTODES, A.CUENTAID, FCTZ '
         + '     From CAJA201 A '
         + '    where CPTOIS=''E'' '
         + '      and EXISTS (SELECT CUENTAID FROM TGE202 B '
         + '                   WHERE A.CUENTAID=B.CUENTAID AND B.CTAACT=''S'' '
         + '                     AND B.CIAID=''' + DMTE.cdsEgrCaja.FieldByName('CIAID').AsString + ''') '
         + '      and nvl(ACTIVO,''N'')=''S'' '
         + '    order BY A.CPTOID';
      DMTE.cdsCptos.Close;
      DMTE.cdsCptos.DataRequest(xSQL);
      DMTE.cdsCptos.Open;

      cdsConceptoC1.CloneCursor(DMTE.cdsCptos, True);
      cdsConceptoC1.Name := 'cdsConceptoC1';
      cdsConceptoC1.Filtered := True;
      dblcdCnp2.LookupTable := cdsConceptoC1;

      Edita(DMTE.cdsEgrCaja);
   End;

   If Trim(dblcBanco.Text) <> '' Then
   Begin
      If DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value = 'I' Then //Si está INCOMPLETO o PENDIENTE
      Begin
         pnlCabecera2.setfocus;
         perform(CM_DialogKey, VK_TAB, 0);
      End;
      If (DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value = 'C') Or
         (DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value = 'A') Then //Si está CANCELADO
      Begin
         pnlBotones.SetFocus;
         perform(CM_DialogKey, VK_TAB, 0);
      End;
   End
   Else
   Begin
      DMTE.cdsCia.Filtered := False;
      DMTE.cdsCia.Filter := 'CIAID=''02''';
      DMTE.cdsCia.Filtered := True;
      RecuperarCiaUnica(dblcCia, edtCia);
      DMTE.cdsCia.Filtered := False;
      DMTE.cdsCia.Filter := '';

      dblcCiaExit(Self);

      edtPeriodo.text := copy(datetostr(dbdtpFComp.date), 7, 4)
         + copy(datetostr(dbdtpFComp.date), 4, 2);
      If dblccia.text <> '' Then
      Begin
         perform(CM_DialogKey, VK_TAB, 0);
      End;
   End;
   cf1.PonerExits;

// Aqui voy a poner el codigo que sumariza Totales del footer ;
   If DMTE.cdsdocpago.RecordCount = 0 Then
   Begin
      dbgDocPago.ColumnByName('CPSALLOC').FooterValue := '0.00';
      dbgDocPago.ColumnByName('CPSALEXT').FooterValue := '0.00';
      dbgDocPago.ColumnByName('CCPMOLOC').FooterValue := '0.00';
      dbgDocPago.ColumnByName('CCPMOEXT').FooterValue := '0.00';
   End;

   z2bbtnSumatDocPagoClick(Nil);
   z2bbtnSumatClick(Nil);
   edtFormPago.Enabled := edtFormPago.text = 'CANJE';
   If edtFormPago.Enabled Then
   Begin
      xWhere := 'CLAUXID=' + quotedstr(DMTE.cdsEgrCaja.fieldbyname('CLAUXID1').AsString);
      edtclasepnl.Text := DMTE.DisplayDescrip('prvClaseAux', 'TGE102', 'CLAUXDES', xWhere, 'CLAUXDES');
      xWhere := 'AUXID=' + quotedstr(DMTE.cdsEgrCaja.fieldbyname('AUXID').AsString);
      edtAuxpnl.Text := DMTE.DisplayDescrip('prvQry2', 'CNT201', 'AUXNOMB', xWhere, 'AUXNOMB');
      edtAuxpnl.Visible := true;
      edtclasepnl.Visible := true;
   // buscar en Proveedores Notificados por SUNAT
      ProveedoresNotificados;
   End
   Else
   Begin
      edtAuxpnl.Visible := false;
      edtclasepnl.Visible := false;
   End;

   edtCia.text := DMTE.DisplayDescripLocal(DMTE.cdsCia, 'CIAID', dblcCia.Text, 'CIADES');
   xDTRGrabada := '0'; // inicializa variable para controlar si un comprobante al que se le aplico
                    // la DETRACCION ya fue grabado y se pueda volver a GRABAR, sin tener que volver a
                    // ejecutar la rutina DETRACCION
End;

{******************************************************************************}

Procedure TFPagoGlobal2.RecuperaDescrip;
Begin
   edtBanco.text := DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr, 'BANCOID', dblcBanco.Text, 'BANCOABR');
   wBcoTipCta := DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').AsString;

   DescripPagoFact(dblcCia.text, edtPeriodo.text, dblcTDiario.Text, dbeNoComp.text);
   DMTE.cdsDescrip.Active := False;
   DMTE.cdsDescrip.Active := True;
   edtClase.text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('CLAUXABR'));
   edtTMon.text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('TMONABR'));
   edtBanco.text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('BANCOABR'));

   edtFormPago.text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('FPAGOABR'));

   edtCia.Text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('CIADES'));
   edtTDiario.Text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('TDIARABR'));
   ;
   If Not DMTE.cdsDescrip.FieldByName('FLUEFEABR').isnull Then
      dbeFEfec.text := DMTE.cdsDescrip.FieldByName('FLUEFEABR').AsString;
   wCiaRetIGV := (DMTE.DisplayDescripLocal(DMTE.cdsCia, 'CIAID', dblcCia.Text, 'CIARETIGV') = 'S');
   lblSujetoRetencion.visible := ((DMTE.DisplayDescrip('prvTGE', 'CNT201', 'PROVRETIGV',
      'CLAUXID = ''' +
      dblcClase.text
      + ''' AND AUXID=''' + dblcdAux.Text + '''', 'PROVRETIGV') = 'S') And (wCiaRetIGV));
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Adiciona;
Var
   xSQL: String;
Begin
// Código Nuevo
   IniciaDatos;

   dblcCCBco.Selected.Clear;
   dblcCCBco.Selected.Add('CCBCOID'#9'25'#9'Cuenta Corriente del Banco'#9'F');
   dblcCCBco.Selected.Add('CCBCODES'#9'30'#9'Descripción'#9'F');
   dblcCCBco.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');

   edtCuenta.Enabled := False;

   DMTE.cdsRegCxP.Filter := 'CIAID=''''';
   DMTE.cdsRegCxP.Filtered := True;
   z2bbtnCancel.Visible := True;

   xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, TDIARID2, CPANOMM, PROV, PROVRUC, '
      + '          CPNOREG, DOCID2, CPSERIE, CPNODOC, TMONID, DETCDOC, DETCPAG, DEDH, '
      + '          DEMTOORI, DEMTOLOC, DEMTOEXT, DESALLOC, DESALEXT, CPTOID, CUENTAID, '
      + '          CCOSID, CPFEMIS, CPFVCMTO, DEUSER, DEFREG, DEHREG, DEANO, DEMM, DEDD, '
      + '          DESS, DESEM, DETRI, DEAASS, DEAASEM, DEAATRI, FLAGVAR, DEANTMN, DEANTME, '
// Inicio HPC_201703_CAJA
// Validación SEMT para proveedores con cobranza coactiva
//      + '          CLAUXID, ECNOREPO, PROVDES, TIPDET, ECNOCOMPR, CIAID2, CNTCOMPROB '
      + '          CLAUXID, ECNOREPO, PROVDES, TIPDET, ECNOCOMPR, CIAID2, CNTCOMPROB, NVL(VALPAGPRO,''N'') VALPAGPRO '
// Final HPC_201703_CAJA
      + '     from CAJA303 '
      + '    Where CIAID='''' '
      + '      and ECANOMM='''' '
      + '      and TDIARID='''' '
      + '      and ECNOCOMP='''' ';
   DMTE.cdsDocPago.Close;
   DMTE.cdsDocPago.DataRequest(xSQL);
   DMTE.cdsDocPago.Open;

   DMTE.cdsDocPago.Filter := '';
   DMTE.cdsDocPago.Filtered := False;

   dbgDocPago.RefreshDisplay;

   dblcClase.Enabled := True;
   dblcdAux.Enabled := True;
   xTC := 0;
   DMTE.RecuperaCierre(wFechacierre, wFrecu);
   If wFechaCierre = 0 Then
   Begin
      dbdtpFComp.date := dateS;
   End
   Else
   Begin
      If (tDate(date) > wFechaCierre) And (tdate(date) <= wFechaCierre + wFrecu) Then
         dbdtpFComp.date := dateS
      Else
         dbdtpFComp.date := wFechaCierre + 1;
   End;

   wmodifica := False;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Edita(cds: Twwclientdataset);
Var
   xSQL, xWhere, xFiltro: String;
Begin
   IniciaDatos;
   cdsFiltro := Cds;

   dblcCia.Text := DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
   dblcTDiario.Text := DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
   edtPeriodo.Text := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   dbeNoComp.Text := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   dbdtpFComp.date := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   dblcClase.Text := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString;
   dblcdAux.Text := DMTE.cdsEgrCaja.FieldbyName('PROV').AsString;
   edtAuxRuc.Text := DMTE.cdsEgrCaja.FieldbyName('PROVRUC').AsString;
   dbeGiradoA.Text := DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString;
   dblcTMon.Text := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
   dbeTCambio.Text := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsString;
   xTC := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   dbeImporte.Text := DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString;
   dblcBanco.Text := DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString;
   dblcCCBco.Text := DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString;
   edtCuenta.Text := DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString;
   dblcFormPago.Text := DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString;
   dbeNoChq.Text := DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString;
   dbdtpFEmis.date := DMTE.cdsEgrCaja.FieldbyName('ECFEMICH').AsDateTime;
   dbeLote.Text := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   dblcdCnp.Text := DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString;
   dbeGlosa.Text := DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString;
   dblcdFEfec.Text := DMTE.cdsEgrCaja.FieldByName('FLUEID').AsString;
   dblcdCtaCte.Text := DMTE.cdsEgrCaja.FieldByName('PRVCCBCOID').AsString;
   rECUPERAdESCRIP;
   ActivaFiltro('REGCXP');
   ActivaFiltro('DOCPAGO');

   If DMTE.cdsEgrCaja.FieldByName('ECEstado').Value = 'I' Then //Si está INCOMPLETO o PENDIENTE
   Begin
      DMTE.cdsEgrCaja.Edit;
      CambiaEstado('I');
// Inicio HPC_201801_CAJA
// Se adiciona para filtrar la provisión por pagar según Moneda
// Inicio HPC_201803_CAJA
// Se adiciona para filtrar la provisión por pagar según Moneda

      if length(dblcTMon.text)>0 then
      begin
         xWhere := 'CPESTADO=''' + 'P' + ''' AND DOCID NOT IN (''07'',''97'') AND ' +
             'CLAUXID= ''' + dblcClase.Text + ''' AND ' +
             'PROV=''' + dblcdAux.Text + ''' AND TMONID =''' + dblcTMon.text + '''  ';
      end
      else
      begin
         xWhere := 'CPESTADO=''' + 'P' + ''' AND DOCID NOT IN (''07'',''97'') AND ' +
             'CLAUXID= ''' + dblcClase.Text + ''' AND ' +
             'PROV=''' + dblcdAux.Text + '''  ';
      end;
// Fin HPC_201803_CAJA
// Fin HPC_201801_CAJA
      xFiltro := ' (( (CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR ' +
         '   ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) ';

      xSQL := 'SELECT CIAID, CPANOMES, TDIARID, CPNOREG, CLAUXID, PROV, PROVRUC, '
         + '           DOCID, CPSERIE, CPNODOC, CPFRECEP, CPFEMIS, CPFVCMTO, TMONID, '
         + '           CPTCAMPR, CPTCAMPA, CPESTADO, CPOCOMP, CP_CONTA, CPGRAVAD, '
         + '           CPNOGRAV, CPIGV, CPISC, CPDCTO, CPSERVIC, CPMTOORI, CPMTOLOC, '
         + '           CPMTOEXT, CPPAGORI, CPPAGLOC, CPPAGEXT, CPSALORI, CPSALLOC, '
         + '           CPSALEXT, TCANJEID, CPCANJE, CPFCANJE, CPUSER, CPFREG, CPHREG, '
         + '           CPAAAA, CPMM, CPDD, CPTRI, CPSEM, CPSS, CPAATRI, CPAASEM, CPAASS, '
         + '           CPFCMPRB, DCPLOTE, DCPCOMP, CTATOTAL, FLAGVAR, CPTOTOT, CPIGV2, '
         + '           CPGRAVAD2, CPHMOD, FLAGVAR2, PROVDES, CLAUXREND, AUXIDREND, CCBCOID, '
         + '           BANCOID, SITUAID, CPFLAGTDOC, CXPRRHH, AUXIDINTER, CLAUXINTER, '
         + '           CPTCAMDOL, PROVRETIGV, CPTCAMAJ, DTRPORC, CPMTOORIB, DTRFLAG, '
         + '           FECDEPDET, NUMDEPDET, ADQ_NO_GRAV, IGV_GRA_NO_DEST, CP_OTROS, '
         + '           CPTODETRSUNATID, TIPOOPERSUNATID, PORCDESC, CP4TAPENSION, SNPAFPID, '
         + '           TIPCOMAFPID '
         + '      FROM CXP301 '
         + '     WHERE ' + xWhere
         + '     order by CPANOMES DESC, DOCID, CPSERIE, CPNODOC';
      DMTE.cdsMovCxP.active := False;
      DMTE.cdsMovCxP.Datarequest(xSQL);
      DMTE.cdsMovCxP.Active := True;
      DMTE.cdsMovCxP.Filter := xFiltro;
      DMTE.cdsMovCxP.Filtered := True;
      dbgOtrosIButton.Enabled := True;
   End;

   If DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value = 'C' Then //Si está CANCELADO
   Begin
      CambiaEstado('C');
      dbgOtrosIButton.Enabled := False;

      xWhere := ' CIAID=' + quotedstr(dblcCia.text) + ' AND BANCOID=' + Quotedstr(dblcBanco.Text) +
         ' AND CCBCOID=' + quotedstr(dblcCCBco.text);
      DMTE.DisplayDescrip('prvQry2', 'TGE106', 'CHQVOUCH', xWhere, 'CHQVOUCH');
      If DMTE.cdsQry.FieldByName('CHQVOUCH').AsString <> 'S' Then
         Z2bbtChqVouch.Visible := False
      Else
         Z2bbtChqVouch.Visible := True;

      ActPnlBotones;
   End;

   If DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value = 'A' Then // Si esta ANULADO
   Begin
      CambiaEstado('A');
      dbgOtrosIButton.Enabled := False;
      ActPnlBotones;
   End;

   z2bbtnSumatClick(Nil);
   z2bbtnSumatDocPagoClick(Nil);
   (z2bbtnOkCab).enabled := false;
   z2bbtnCancel.Visible := False;

   dblcClase.Enabled := False;
   dblcdAux.Enabled := False;
   xSQL := 'Select PROV, CCBCOID, BANCOID, CLAUXID, CIAID, FPAGOID, TMONID, USUARIO, '
      + '          FECREG, DETRACCION, CODBCOCCI, CCBCODC '
      + '     from CAJA102 '
      + '    where PROV=' + quotedstr(trim(dblcdAux.Text))
      + '      and BANCOID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('PRVBANCOID').AsString)
      + '      and CCBCOID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('PRVCCBCOID').AsString);
   DMTE.cdsProvCta.Close;
   DMTE.cdsProvCta.IndexFieldNames := '';
   DMTE.cdsProvCta.DataRequest(xSql);
   DMTE.cdsProvCta.Open;

   If (dblcdCtaCte.text <> '') Then
   Begin
      dblcdCtaCte.Text := DMTE.cdsEgrCaja.FieldByName('PRVCCBCOID').AsString;
      xDirAux := DMTE.DisplayDescrip('prvTGE', 'CNT201', 'AUXDIR', 'AUXID=' + quotedstr(dblcdAux.text), 'AUXDIR');
      If DMTE.cdsEgrCaja.FieldByName('ECEstado').Value = 'C' Then
         Z2bbtnNotaAbono.enabled := true;
   End
   Else
   Begin
      Z2bbtnNotaAbono.enabled := False;
      xDirAux := '';
   End;
   wmodifica := False;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.FormCreate(Sender: TObject);
Var
   i: Integer;
Begin
   i := 0;
   Try
      i := 1;
      DMTE.ASignaTipoDiario(dblcTDiario, self);
      i := 2;
      setLength(A2digitos, 1);
      i := 3;
      setLength(A4digitos, 1);
      i := 4;
      A2digitos[0] := dbeImporte;
      i := 5;
      A4digitos[0] := dbeTcambio;
      i := 6;
      cdsConceptoC1 := TwwClientdataset.Create(Self);
      i := 7;
      i := 8;
      i := 9;
      i := 10;
      i := 11;
      cdsTdiarioDet := TwwClientdataset.Create(Self);
      i := 12;
      cdsTdiarioDet.CloneCursor(DMTE.cdsTDiario1, True);
      i := 13;
      cf1 := TControlFoco.Create;
      i := 14;
      DMTE.cdsFEfec.Filter := 'FLUEFE_IS = ''S'' ';
      i := 15;
      DMTE.cdsFEfec.Filtered := True;
   Except
      On E: Exception Do showmessage(E.Message + '  ' + 'Linea : ' + inttostr(i));
   End;
   DMTE.cdsMovCxP.Close;
   DMTE.cdsMovCxP.IndexFieldNames := '';
   pnlSunat.Visible := False;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.AdicIniciaDatos;
Begin
   RecuperarCiaUnica(dblcCia, edtCia);
   edtPeriodo.text := copy(datetostr(dbdtpFComp.date), 7, 4)
      + copy(datetostr(dbdtpFComp.date), 4, 2);
   If dblccia.Text <> '' Then
      perform(CM_DialogKey, VK_TAB, 0);
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ActualizaSaldosCaja;
Begin
   If trim(dblcCCBco.TEXT) <> '' Then //SI ES MOVIMIENTOD E BANCOS
   Begin
      DMTE.ActSdoTlfn(dblcCia.text, dblcBanco.text, dblcCCBCo.Text,
         DMTE.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
         DBDTPfcOMP.DATE);
      DMTE.ActSdoMen(dblcBanco.text, dblcCCBCo.Text,
         DMTE.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
         DBDTPfcOMP.DATE);
   End
   Else
      //SI ES CAJA
      DMTE.ActSdoCaja(DMTE.cdsEgrCaja.fieldbyname('TMONID').AsString,
         DMTE.cdsEgrCaja.fieldbyname('BANCOID').AsString,
         DMTE.cdsEgrCaja.fieldbyname('ECMTOORI').AsString,
         DMTE.cdsEgrCaja.fieldbyname('ECFCOMP').AsString);
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ConfiguraAccesos;
Begin
   If DMTE.wAdmin = 'G' Then
      Proc_Admin
   Else
   Begin
      If DMTE.wModo = 'C' Then
         Proc_Consul
      Else
         DMTE.AccesosUsuarios(DMTE.wModulo, DMTE.wUsuario, '2', Screen.ActiveForm.Name);
   End;

End;

{******************************************************************************}

Procedure TFPagoGlobal2.Libera_Admin;
Begin
   Pon(A1, A2, pnlBotones);
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Libera_Consul;
Begin

End;

{******************************************************************************}

Procedure TFPagoGlobal2.Proc_Admin;
Var
   Contador: Integer;
Begin
   pnlCabecera1.Enabled := False;
   pnlCabecera2.Enabled := False;
   pnlDeTalle.Enabled := False;
    //Array de controles y eventos
   Contador := BotonesEnPanel(pnlBotones);
   setlength(A1, Contador);
   setlength(A2, Contador);
   Quita(A1, A2, pnlBotones);
    //
   pnlBotones.Enabled := True;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Proc_Consul;
Begin
   pnlCabecera1.Enabled := False;
   pnlCabecera2.Enabled := False;
   pnlDeTalle.Enabled := True;
   pnlBotones.Enabled := False;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.LibConfigAccesos;
Begin
   If DMTE.wAdmin = 'G' Then
      Libera_Admin
   Else
   Begin
      If DMTE.wModo = 'C' Then
         Libera_Consul;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ValidaCabecera2;
Begin
   If length(dblcCia.Text) = 0 Then
      Raise exception.Create('Falta Código de Compañía');

   If length(edtCia.Text) = 0 Then
      Raise exception.Create('Código de Compañía Errado');

   If length(dblcTDiario.Text) = 0 Then
      Raise exception.Create('Falta Tipo de Diario');

   If length(edtTDiario.Text) = 0 Then
      Raise exception.Create('Tipo de Diario Errado');

   If length(dbeGiradoA.Text) = 0 Then
      Raise exception.Create('Datos del Proveedor Errados');

   If length(dblcTMon.Text) = 0 Then
      Raise exception.Create('Falta Tipo de Moneda');

   If length(edtTMon.Text) = 0 Then
      Raise exception.Create('Codigo de Moneda Errado');

   If length(dbeTCambio.Text) = 0 Then
      Raise exception.Create('Falta Tipo de Cambio')
   Else
      If strtofloat(dbeTCambio.Text) <= 0 Then
         Raise exception.Create('Tipo de Cambio Errado');

   If length(dbeImporte.Text) = 0 Then
      Raise exception.Create('Falta Monto a Pagar')
   Else
      If strtofloat(dbeImporte.Text) <= 0 Then
         Raise exception.Create('Importe Errado');

   If length(dblcBanco.Text) = 0 Then
      Raise exception.Create('Falta definir Banco');

   If length(edtBanco.Text) = 0 Then
      Raise exception.Create('Codigo de Banco Errado');

   If dblcCCBco.Enabled = True Then
   Begin
      If length(dblcCCBco.Text) = 0 Then
         Raise exception.Create('Falta Cuenta Corriente Banco');
      If dbdtpFEmis.Date = 0 Then
      Begin
         dbdtpFEmis.SetFocus;
         Raise exception.create('Ingrese Fecha de Emisión del Cheque');
      End;
   End;

   If dblcFormPago.Enabled = True Then
   Begin
      If length(dblcFormPago.Text) = 0 Then
         Raise exception.Create('Falta Forma de Pago');
      If length(edtFormPago.Text) = 0 Then
         Raise exception.Create('Codigo de Forma de Pago Errado');
   End;

   If (dbeNoChq.Enabled = True) And (length(dbeNoChq.Text) = 0) Then
      Raise exception.Create('Falta No. de Cheque');

   If (dbdtpFeMis.Enabled = True) And (dbdtpFeMis.Date = 0) Then
      Raise exception.Create('Falta Fecha de Emisión del Cheque');

   If length(dbeLote.Text) = 0 Then
      Raise exception.Create('Falta Lote');

   If length(dblcdCnp.Text) = 0 Then
      Raise exception.Create('Falta Concepto');
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Z2bbtnEmiChqClick(Sender: TObject);
Var
   strChq: structChq;
   xsql, ArchivoReporte, WECCHQEMI, wGiradoDTR, wCtaCteBCO, xSQL44: String;
   xTotal: double;
Begin
   If trim(dblcCCBco.Text) <> '' Then
   Begin
      xTotal := 0;
      wGiradoDTR := '';
      If (xDTRPorc = 0) And (vYanoRetencion = 'N') Then
      Begin

         xSql := 'CIAID=' + quotedstr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)
            + ' and TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
            + ' and ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
            + ' and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);

         DMTE.DisplayDescrip('prvTGE', 'CAJA302', 'ECCONTA', xsql, 'ECCONTA');
         If DMTE.cdsQry.FieldByName('ECCONTA').AsString <> 'S' Then
         Begin
            ShowMessage('Para Imprimir Cheque, Debe Contabilizar el Voucher');
            Exit;
         End;

         xSQL := 'Select SUM( MTORETLOC ) RETLOC, SUM( MTORETEXT ) RETEXT '
            + '     from CNT320 '
            + '    where CIAID=''' + DMTE.cdsEgrcaja.FieldByName('CIAID').AsString + ''' '
            + '      and ANOMM=''' + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' '
            + '      and TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' '
            + '      and ECNOCOMP=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' '
            + '      and ( DOCID2 IS NULL OR DOCID2='''' ) ';
         DMTE.cdsQry4.Close;
         DMTE.cdsQry4.Datarequest(xSQL);
         DMTE.cdsQry4.Open;

         If dblcTMon.Text = DMTE.wTMonLoc Then
            xTotal := DMTE.FRound(strtoFloat(dbeImporte.Text) - DMTE.cdsQry4.fieldbyname('RETLOC').AsFloat, 15, 2)
         Else
            If dblcTMon.Text = DMTE.wTMonExt Then
               xTotal := DMTE.FRound(strtoFloat(dbeImporte.Text) - DMTE.cdsQry4.fieldbyname('RETEXT').AsFloat, 15, 2);

         xTotal := DMTE.FRound(xTotal, 15, 2);

         xSQL := ' CIAID=''' + dblcCia.text + ''' and '
            + 'TDIARID=''' + dblcTDiario.text + ''' and '
            + 'ECANOMM=''' + edtPeriodo.text + ''' and '
            + 'ECNOCOMP=''' + dbeNoComp.text + ''' ';
         wECCHQEMI := DMTE.DisplayDescrip('prvSQL', 'CAJA302', 'ECCHQEMI', xsql, 'ECCHQEMI');

     /// se carga variable para realizar el UPDATE despues de emitido el Cheque
         xSQL := 'Update CAJA302 '
            + '      set ECCHQEMI=''S'' '
            + '    where CIAID=''' + dblcCia.text + ''' '
            + '      and TDIARID=''' + dblcTDiario.text + ''' '
            + '      and ECANOMM=''' + edtPeriodo.text + ''' '
            + '      and ECNOCOMP=''' + dbeNoComp.text + ''' ';
         wCtaCteBCO := dblcCCBco.Text
      End
      Else // si se aplica la DETRACCION
      Begin
      // PARA UBICAR EL REGISTRO SELECCIONADO EN EL DBGDOCPAGO(CAJA303) COINCIDA CON EL CAJA302
         DMTE.cdsEgrCaja.Filter := '';
         DMTE.cdsEgrCaja.Filtered := False;
         DMTE.cdsEgrCaja.Filter := ' CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
            + ' and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
            + ' and TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
            + ' and ECNOCOMP=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString);
         DMTE.cdsEgrCaja.Filtered := True;

         If DMTE.cdsEgrCaja.Recordcount <= 0 Then
         Begin
            xSQL44 := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, CLAUXID, PROV, PROVRUC, '
               + '          ECFCOMP, ECFEMICH, ECFPAGOP, ECFCOBCH, FPAGOID, DOCID, ECNODOC, '
               + '          TMONID, ECTCAMB, ECMTOORI, ECMTOLOC, ECMTOEXT, BANCOID, CCBCOID, '
               + '          ECNOCHQ, ECGIRA, CPTOID, CUENTAID, ECGLOSA, ECLOTE, ECELABO, '
               + '          ECAPROB, ECESTADO, ECCONTA, ECUSER, ECFREG, ECHREG, ECANO, '
               + '          ECMM, ECDD, ECSS, ECSEM, ECTRI, ECAASS, ECAASEM, ECAATRI, '
               + '          FLAGVAR, EC_PROCE, ECOPAGO, TDIARIO2, ECNOCOMP2, ECANOMM2, '
               + '          EC_IE, ECCHQEMI, USERRESP, EQUIID, ECCHKEST, ECPERNDOC, '
               + '          ECPERREC, TIPDOCCOD, PERID, ECFENTR, ECCONSOLID, ECMTCON, '
               + '          ECFCV, ECCOBLOC, ECMTDIF, ECCOBEXT, ECDEVLOC, ECDEVEXT, '
               + '          FEXTCHQ, FLUEID, ECCONING, ECNOREPO, CLAUXID1, AUXID, PROV1, '
               + '          CCBCOVOUCH, PRVBANCOID, PRVCCBCOID, ECSALMN, ECSALME, '
               + '          CAJARETIGV, FDOFIJJUST, GCONCID, TIPDET, ECNOCOMPR, '
               + '          CNTCOMPROB, KEYVALE, FLGREN '
               + '     from CAJA302 '
               + '    Where CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
               + '      and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
               + '      and TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
               + '      and ECNOCOMP=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString);
            DMTE.cdsEgrCaja.Close;
            DMTE.cdsEgrCaja.DataRequest(xSQL44);
            DMTE.cdsEgrCaja.Open;
         End;

         xTotal := DMTE.cdsEgrCaja.FieldbyName('ECMTOORI').AsFloat;
         If DMTE.cdsEgrCaja.FieldbyName('TIPDET').AsString = 'I4' Then // por ser el importe de DETRACCION
         Begin
         // ACCESA AL TGE105 PARA TOMAR EL NOMBRE DEL BANCO PARA EL CHEQUE DE LA DETRACCION
            xSQL := 'Select BANCOABR, BANCOID, BANCONOM, BANCOPCCADO, BANCOPCCASO, BANCOPCFEDO, '
               + '          BANCOPCFESO, BANCOPCLEDO, BANCOPCLESO, BANCOPCPRDO, BANCOPCPRSO, '
               + '          BANCOPFCADO, BANCOPFCASO, BANCOPFFEDO, BANCOPFFESO, BANCOPFLEDO, '
               + '          BANCOPFLESO, BANCOPFPRDO, BANCOPFPRSO, BANCOPLLEDO, BANCOPLLESO, '
               + '          BCOTIPCTA, CUENTAID, REMESAID, CTADIFP, CTADIFG, CPTODIFP, '
               + '          CPTODIFG, TMONID, CPTOID, BANCOPRF, CCOSDIF, CLAUXID, AUXID, '
               + '          EQUBANOFI, FLAVIGPRE, FLAHISPRE, FLAVIGCOB, CCBCOIDPRE, BCODIR, '
               + '          BCOSEC, MONMAXCIE, FLACAJCHI '
               + '     from TGE105 '
               + '    where BANCOPRF=' + quotedstr('BN-');
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest(xSQL);
            DMTE.cdsQry.open;
            wGiradoDTR := trim(DMTE.cdsQry.FieldbyName('BANCONOM').AsString) + '/';
         // SE TOMA EL MONTO LOCAL, YA QUE EL BCO.NACION SOLO RECIBE SOLES
            xTotal := DMTE.cdsEgrCaja.FieldbyName('ECMTOLOC').AsFloat;
         End
         Else
         Begin
            wGiradoDTR := '';
         End;
         wECCHQEMI := DMTE.cdsEgrCaja.FieldbyName('ECCHQEMI').AsString;

      // se carga variable para realizar el UPDATE despues de emitido el Cheque
         xSQL := 'Update CAJA302 '
            + '      set ECCHQEMI=''S'' '
            + '    where CIAID=''' + dblcCia.text + ''' '
            + '      and TDIARID=''' + dblcTDiario.text + ''' '
            + '      and ECANOMM=''' + edtPeriodo.text + ''' '
            + '      and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
         wCtaCteBCO := dblcCCBcoDTR.Text
      End;

      If WECCHQEMI <> 'S' Then
      Begin
         DMTE.RecuperarDatos('TGE106', '*', 'BANCOID=''' + DMTE.cdsEgrCaja.FieldbyName('BANCOID').AsString + ''' '
            + 'AND CCBCOID=''' + DMTE.cdsEgrCaja.FieldbyName('CCBCOID').AsString + '''');
         ArchivoReporte := DMTE.cdsRec.fieldbyname('CCFMTCHQ').ASString;
         If ArchivoReporte = '' Then
            ArchivoReporte := 'ChqDefault.rtm';
         With strChq Do
         Begin
            ppFileName := ArchivoReporte;
            ppGiradoA := wGiradoDTR + dbeGiradoA.Text;
            ppImporte := floattostrf(strtocurr(Floattostr(xTotal)), fffixed, 10, 2);
            ppMontoLetras := strNum(xTotal);
            ppDia := strDia(dbdtpFEmis.Date);
            ppmes := strMes(dbdtpFEmis.Date);
            ppAno := strAno(dbdtpFEmis.Date);
            If wCtaCteBCO <> '0100001518' Then
               ppRuc := 'RUC :' + xRUCCIA;
         End;
         DMTE.xFlagP := False;
         FRegistro.EmiteChq(ArchivoReporte, strChq);
         If DMTE.xFlagP Then
         Begin
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         End;
      End
      Else
         Showmessage('Cheque ya fue impreso');
   End
   Else
   Begin
      Showmessage('No ha seleccionado Cuenta Corriente');
   End;
   dbgDocPago.ReadOnly := True;
   DMTE.cdsDocPago.EnableControls;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.SaldosAux;
Var
   Previo,
      Actual,
      xClase: String;
   cdsClone: TwwClientDataSet;
Begin
   If DMTE.cdsDocPago.RecordCount = 0 Then
      Exit;

   cdsClone := TwwClientDataSet.create(self);
   DMTE.cdsDocPago.DisableControls;
   Previo := '';
   Actual := '';
   DMTE.cdsDocPago.IndexFieldNames := 'PROV';
   DMTE.cdsDocPago.First;
   While Not EOF Do
   Begin
      Actual := DMTE.cdsDocPago.FieldBYname('PROV').AsString;
      xClase := DMTE.cdsDocPago.Fieldbyname('CLAUXID').AsString;
      If Actual <> Previo Then
      Begin
         Opera(Actual, xClase, cdsClone);
      End;
      Previo := Actual;
      Next;
   End;
   DMTE.cdsDocPago.IndexFieldNames := '';
   DMTE.cdsDocPago.EnableControls;
   cdsClone.free;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Opera(xProv, xClase: String; cdsClone: TwwClientDataSet);
Var
   xFiltro: String;
   xDEMTOLOC,
      xDEMTOEXT: Double;
   xDatAux: structSaldosAux;
   xMTOSLOC,
      xMTOSEXT: Double;
Begin
   xFiltro := 'CLAUXID = ''' + xClase + ''' AND PROV = ''' + xProv + '''';
   cdsclone.CloneCursor(DMTE.cdsDocPago, true);
   //Calculo de Montos Locales
   cdsclone.Filter := xfiltro + ' AND TMONID= ''' + DMTE.wTMonLoc + '''';
   cdsclone.Filtered := true;
   xMTOSLOC := 0;
   If cdsClone.RecordCount <> 0 Then
   Begin
      cdsClone.First;
      While Not cdsClone.Eof Do
      Begin
         If (cdsclone.fieldbyname('TMONID').asstring <> dblctmon.Text) Then
         Begin
            xMTOSLOC := DMTE.FRound(cdsclone.fieldbyname('DEMTOEXT').asFloat * cdsclone.fieldbyname('DETCDOC').asfloat, 15, 2)
         End
         Else
            xMTOSLOC := xMTOSLOC + cdsclone.fieldbyname('DEMTOLOC').asFloat;
         cdsClone.Next;
      End;
   End
   Else
      xMTOSLOC := 0;

   xMTOSext := 0;
   //calculo de Montos Extranjeros
   cdsclone.Filter := xfiltro + ' AND TMONID= ''' + DMTE.wTMonExt + '''';
   cdsclone.Filtered := true;
   If cdsClone.RecordCount <> 0 Then
   Begin
      While cdsClone.Eof Do
      Begin
         If (cdsclone.fieldbyname('TMONID').asstring <> dblctmon.Text) Then
         Begin
            xMTOSext := DMTE.FRound(cdsclone.fieldbyname('DEMTOLOC').asFloat / cdsclone.fieldbyname('DETCDOC').asFloat, 15, 2)
         End
         Else
            xMTOSEXT := xMTOSEXT + cdsclone.fieldbyname('DEMTOEXT').asFloat;
         cdsClone.Next;
      End;
   End
   Else
      xMTOSEXT := 0;

   xDEMTOLOC := DMTE.OperClientDataSet(DMTE.cdsDocPago, 'SUM(DEMTOLOC)', xFiltro);
   xDEMTOEXT := DMTE.OperClientDataSet(DMTE.cdsDocPago, 'SUM(DEMTOEXT)', xFiltro);
   With xDatAux, DMTE.cdsEgrcaja Do
   Begin
      CIAID := dblcCia.Text;
      CLAUXID := xClase;
      AUXID := xProv;
      MONTOMN := CajaDec(floatToStr(xDEMTOLOC));
      MONTOME := CajaDec(floatToStr(xDEMTOEXT));
      MTOSLOC := currtoStr(xMTOSLOC);
      MTOSEXT := CurrToStr(xMTOSEXT);
      FECHA := dbdtpFComp.date;
      DMTE.ActSaldosClientes(xDatAux);
   End;
End;

{******************************************************************************}

Function TFPagoGlobal2.BuscaClase: String;
Var
   cds: TwwClientDataset;
Begin
   cds := TwwClientDataset.Create(self);
   cds.CloneCursor(DMTE.cdsMovCxP, True);
   If cds.Locate('CIAID;CPANOMES;TDIARID;CPNOREG',
      VarArrayOf([DMTE.cdsDocPago.fieldbyname('CIAID').AsString,
      DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString,
         DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString,
         DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString]), []) Then
   Begin
      Result := cds.FieldBYname('CLAUXID').AsString;
   End
   Else
   Begin
      Result := '';
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcTDoc2Exit2(Sender: TObject);
Begin

   If z2bbtnCancel3.Focused Then exit;
   If dbeNoReg.Focused Then Exit;

   edtTDoc2.text := DMTE.DisplayDescripLocal(DMTE.cdsTDoc, 'DOCID', dblcTDoc2.Text, 'DOCDES');

   If edtTDoc2.Text = '' Then
   Begin
      ShowMessage('Error : Tipo de Documento no Valido');
      dblcTDoc2.SetFocus;
      Exit;
   End;
   wDocModulo := DMTE.cdsTDoc.FieldByName('DOCMOD').AsString;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.RecCptosDifC;
Begin
   If trim(dblcCCBco.Text) = '' Then
   Begin
      If Not DMTE.RecuperarDatos('TGE105', 'CPTODIFG,CPTODIFP,CTADIFG,CTADIFP,CCOSDIF', 'BANCOID=''' + dblcBanco.Text + '''') Then
      Begin
         ShowMessage('No se puede Contabilizar ' + #13 +
            'Falta Definir las Cuentas de Dif. de Cambio');
         xSigueGrab := False;
      End;
   End
   Else
   Begin
      If Not DMTE.RecuperarDatos('TGE106', 'CPTODIFG,CPTODIFP,CTADIFG,CTADIFP,CCOSDIF', 'BANCOID=''' + dblcBanco.Text +
         ''' AND CCBCOID=''' + DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString + '''') Then
      Begin
         ShowMessage('No se puede Contabilizar ' + #13 +
            'Falta Definir las Cuentas de Dif. de Cambio');
         xSigueGrab := False;
      End;
   End;
   wCptoGan := DMTE.cdsRec.fieldbyname('CPTODIFG').AsString;
   wCptoPer := DMTE.cdsRec.fieldbyname('CPTODIFP').AsString;
   wCtaGan := DMTE.cdsRec.fieldbyname('CTADIFG').AsString;
   wCtaPer := DMTE.cdsRec.fieldbyname('CTADIFP').AsString;
   wCCosDif := DMTE.cdsRec.fieldbyname('CCOSDIF').AsString;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbeLoteExit(Sender: TObject);
Begin
   If z2bbtnCancel.Focused Then exit;

   dbeLote.text := DMTE.StrZero(dbeLote.text, DMTE.cdsEgrCaja.FieldByName('ECLOTE').Size);
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbeTCambioEnter(Sender: TObject);
Begin
   strTmp := TCustomEdit(Sender).Text;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbeTCambioExit(Sender: TObject);
Begin
   If strTmp <> dbeTCambio.text Then
   Begin
      dbeTcambio.text := CajaDec(dbeTCambio.text, 4);
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcBancoExit(Sender: TObject);
Begin
   If dblcCia.Focused Then Exit;

   edtBanco.text := DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr, 'BANCOID', dblcBanco.Text, 'BANCOABR');

   If edtBanco.Text = '' Then
   Begin
      dblcBanco.Value := '';
      edtBanco.Text := '';
      ShowMessage('Error : Banco no Valido');
      dblcBanco.SetFocus;
      Exit;
   End;

   wBcoTipCta := DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').AsString;

   dblcCCBco.Text := '';
   edtCuenta.Text := '';
   dblcdCnp.Text := '';
   dbeGlosa.Text := '';
   dblcTMon.Text := '';
   edtTMon.Text := '';
   If DMTE.cdsbancoegr.FieldByName('BCOTIPCTA').Value = 'C' Then
   Begin //Si es CAJA
      dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE', 'TGE106', 'CCBCOVOUCH', 'BANCOID=' + quotedstr(dblcBanco.text), 'CCBCOVOUCH');
      dblcTDiario.OnExit(dblcTDiario);
      dblcCCBco.Enabled := False;
      dblcTMon.Enabled := True;
      edtCuenta.Text := DMTE.DisplayDescrip('prvTGE', 'TGE105', 'CUENTAID', 'BANCOID=' + quotedstr(dblcBanco.text), 'CUENTAID');
      DMTE.cdsFormPago.Filter := 'FEFE=''1'' or FEFE=''S'' ';
      DMTE.cdsFormPago.Filtered := True;
      dbeNoChq.Enabled := False;
      dbdtpFEmis.Enabled := False;
   End
   Else
   Begin //Si es BANCO
      dblcCCBco.Enabled := True;
      dblcTMon.Enabled := False;
      dblcFormPago.Enabled := False;
      DMTE.cdsCCBco.Filtered := False;
      DMTE.cdsCCBco.Filter := ''; //Filtrar la lista de CtaCte por Banco
      DMTE.cdsCCBco.Filter := 'BANCOID=' + '''' + dblcBanco.Text + '''' + ' AND CIAID=' + quotedstr(dblcCia.text) + ' AND CUEEMICHE=''S''';
      DMTE.cdsCCBco.Filtered := True;
     //filtrar los tipos de pago
      DMTE.cdsFormPago.Filter := 'FCBCO=''1'' or FCBCO=''S'' ';
      DMTE.cdsFormPago.Filtered := true;
      dblcCCBco.setfocus;
   End;

   If DMTE.cdsFormPago.RecordCount > 1 Then
   Begin
      dblcFormPago.Enabled := True;
      dblcFormPago.text := '';
      edtFormPago.text := '';
   End
   Else
      dblcFormPago.Enabled := False;

   dblcFormPago.text := DMTE.cdsFormPago.FieldByName('FPAGOID').AsString;
   dbeNoChq.Text := '';
   wmodifica := True;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcCCBcoEnter(Sender: TObject);
Begin
   strTmp := dblcCCBco.Text;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcCCBcoExit(Sender: TObject);
Var
   Tmp: String;
Begin

   If dblcCia.Focused Then Exit;
   If dblcBanco.Focused Then Exit;

   tmp := DMTE.DisplayDescripLocal(DMTE.cdsCCBco, 'CCBCOID', dblcCCBco.Text, 'CCBCOID');
   xCCBCOID := DMTE.DisplayDescripLocal(DMTE.cdsCCBco, 'CCBCOID', dblcCCBco.Text, 'CCBCOID');

   If Tmp = '' Then
   Begin
      edtCuenta.Text := '';
      dblcdCnp.Text := '';
      dbeGlosa.Text := '';
      ShowMessage('Error : Cuenta Corriente No Valida');
      dblcccbco.SetFocus;
      exit;
   End;

   dblcTmon.Text := DMTE.cdsCCBco.fieldbyname('TMONID').AsString;
   edtTMon.Text := DMTE.DisplayDescripLocal(DMTE.cdsTMon, 'TMONID', dblcTMon.text, 'TMONDES');
   dbeNOChq.Text := '';

   edtCuenta.Text := DMTE.cdsCCBco.fieldbyname('CTAPRINC').AsString;
   dblcdCnp.Text := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTOID', 'CPTOID=' + quotedstr(DMTE.cdsCCBco.fieldbyname('CPTOID').AsString), 'CPTOID');
   dbeGlosa.Text := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTODES', 'CPTOID=' + quotedstr(dblcCCBco.text), 'CPTODES'); //  DMTE.cdsCCBcoLKGLOSA.AsString ;
   xVoucher := DMTE.cdsCCBco.fieldbyname('CCBCOVOUCH').AsString;
           //**
   If DMTE.wModo = 'A' Then
   Begin
      //dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco.text)+' AND CCBCOID='+quotedstr(dblcCCBco.text),'CCBCOVOUCH');
      dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE', 'TGE106', 'CCBCOVOUCH', 'CIAID=''' + dblcCia.Text + ''' and BANCOID=' + quotedstr(dblcBanco.text) + ' AND CCBCOID=' + quotedstr(dblcCCBco.text), 'CCBCOVOUCH');
      dblcTDiario.OnExit(dblcTDiario);
   End;

   If DMTE.cdsFormPago.RecordCount = 1 Then
      dblcformpago.Enabled := false
   Else
      dblcformpago.Enabled := true;

   wmodifica := True;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcClaseExit(Sender: TObject);
Var
   xSQLx: String;
Begin

   edtClase.text := DMTE.DisplayDescripLocal(DMTE.cdsClaseAux, 'CLAUXID', dblcClase.Text, 'CLAUXDES');

   If edtClase.Text = '' Then
   Begin
      dblcdAux.Text := '';
      edtAuxRUC.Text := '';
      lblSujetoRetencion.visible := False;
      dbeGiradoA.Text := '';
      ShowMessage('Error : Clase de Auxiliar');
      dblcClase.SetFocus;
      Exit;
   End;

   xSQLx := 'Select AUXID, AUXNOMB, AUXABR, AUXRUC, PAISID, AUXDIR, AUXCZIP, AUXTELF, '
      + '           AUXFAX, AUXEMAIL, CLAUXID, AUXGIRA, PROVRETIGV, AUXDNI, PROVRUC, '
      + '           ACTIVO '
      + '      from CNT201 '
      + '     Where CLAUXID=''' + dblcClase.Text + ''' and ACTIVO=''S''';
   DMTE.cdsAux.Close;
   DMTE.cdsAux.DataRequest(xSQLx);
   DMTE.cdsAux.Open;

   dblcdAux.Selected.Clear;
   dblcdAux.Selected.Add('AUXID'#9'10'#9'Auxiliar'#9'F');
   dblcdAux.Selected.Add('AUXRUC'#9'15'#9'R.U.C'#9'F');
   dblcdAux.Selected.Add('AUXNOMB'#9'40'#9'Nombre Auxiliar'#9'F');

End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcdAuxExit(Sender: TObject);
Var
   xSql, xAuxt: String;
Begin
   If z2bbtnCancel.Focused Then exit;
   If dblcClase.Focused Then Exit;

   xAuxt := DMTE.DisplayDescripLocal(DMTE.cdsAux, 'AUXID', dblcdAux.Text, 'AUXID');

   If xAuxt = '' Then
   Begin
      dblcdAux.Text := '';
      edtAuxRUC.Text := '';
      lblSujetoRetencion.visible := False;
      dbeGiradoA.Text := '';
      ShowMessage('Error : Auxiliar No Valido');
      dblcdAux.SetFocus;
      Exit;
   End;

   If DMTE.cdsAux.FieldByName('AUXGIRA').AsString = '' Then
      dbeGiradoA.Text := DMTE.cdsAux.FieldByName('AUXNOMB').Asstring
   Else
      dbeGiradoA.Text := DMTE.cdsAux.FieldByName('AUXGIRA').Asstring;

   lblSujetoRetencion.visible := ((DMTE.DisplayDescrip('prvTGE', 'CNT201', 'PROVRETIGV',
      'CLAUXID = ''' + dblcClase.text
      + ''' AND AUXID=''' + dblcdAux.Text + '''', 'PROVRETIGV') = 'S') And (wCiaRetIGV));
   edtAuxRuc.Text := DMTE.cdsAux.FieldByName('AUXRUC').Asstring;
   xDirAux := DMTE.cdsAux.FieldByName('AUXDIR').Asstring;

// buscar en Proveedores Notificados por SUNAT
   ProveedoresNotificados;

   xSql := 'Select PROV, CCBCOID, BANCOID, CLAUXID, CIAID, FPAGOID, TMONID, USUARIO, '
      + '          FECREG, DETRACCION, CODBCOCCI, CCBCODC '
      + '     from CAJA102 '
      + '    where PROV=' + quotedstr(trim(dblcdAux.Text)) + ' ORDER BY CCBCOID';
   DMTE.cdsProvCta.Close;
   DMTE.cdsProvCta.INDEXFIELDNAMES := '';
   DMTE.cdsProvCta.DataRequest(xSql);
   DMTE.cdsProvCta.Open
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ProveedoresNotificados;
Var
   xWhere, sRes: String;
Begin
   pnlSunat.Visible := False;
   xWhere := 'PROVRUC=''' + edtAuxRuc.Text + ''' AND ESTADO=''A''';
   sRes := DMTE.DisplayDescrip('prvTGE', 'CXP_PRO_NOT_SUN', 'PROVRUC, PROVDES, ESTADO', xWhere, 'ESTADO');
   If sRes = 'A' Then
   Begin
      pnlSunat.Visible := True;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcFormPagoExit(Sender: TObject);
Begin
   If z2bbtnCancel.Focused Then exit;
   If dblcTMon.Focused Then exit;

   edtFormPago.text := DMTE.DisplayDescripLocal(DMTE.cdsFormPago, 'FPAGOID', dblcFormPago.Text, 'FPAGODES');

   If dblcFormPago.Text = '' Then
   Begin
      dbeNoChq.Text := '';
      ShowMessage('Error : Forma de Pago no Valida');
      dblcFormPago.SetFocus;
      Exit;
   End;

   If DMTE.cdsFormPago.FieldByName('FCANJE').AsString = 'S' Then
   Begin
      DMTE.abreCuentas(dblcCia.text);
      edtCuenta.Enabled := True;
      edtCuenta.setfocus;
   End
   Else
   Begin
      edtCuenta.Enabled := False;
      edtAuxpnl.Visible := false;
      edtclasepnl.Visible := false;
   End;

   If DMTE.cdsFormPago.FieldByName('FCANJE').AsString = 'A' Then
   Begin
      dblcdCtaCte.LookupTable := DMTE.cdsProvCta;
      dblcdCtaCte.Enabled := True;
      dblcdCtaCte.setfocus;
   End
   Else
      dblcdCtaCte.Enabled := False;

   If (DMTE.cdsFormPago.FieldByName('FCHQ').AsString = '1') Or
      (DMTE.cdsFormPago.FieldByName('FCHQ').AsString = 'S') Then
   Begin
      dbeNoChq.Enabled := True;
      dbdtpFEmis.Enabled := True;
      dbeNoChq.SetFocus;
   End
   Else
   Begin
      dbeNoChq.Enabled := False;
      dbdtpFEmis.Enabled := False;
   End;

End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcTMonExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If z2bbtnCancel.Focused Then exit;

   edtTMon.text := DMTE.DisplayDescripLocal(DMTE.cdsTMon, 'TMONID', dblcTMon.Text, 'TMONDES');

   If edtTMon.Text = '' Then
   Begin
      edtTmon.text := '';
      dbeTCambio.Text := '';
      dblcTMon.Text := '';
      ShowMessage('Error : Moneda no Valida');
      dblcTMon.SetFocus;
      Exit;
   End;

End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcdCnpExit(Sender: TObject);
Begin
   If z2bbtnCancel.Focused Then exit;
   If dbeLote.Focused Then exit;

   dbeGlosa.text := DMTE.DisplayDescripLocal(DMTE.cdsCnpEgr, 'CPTOID', dblcdCnp.Text, 'CPTODES');

   If dbeGlosa.text = '' Then
   Begin
      ShowMessage('Error : Concepto no Valido');
      dblcdCnp.SetFocus;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.BorraGrid;
Begin
   If DMTE.cdsDocPago.RecordCount <> 0 Then
   Begin
      DMTE.cdsDocPago.DisableControls;
      DMTE.cdsDocPago.first;
      While Not DMTE.cdsDocPago.eof Do
      Begin
         DMTE.cdsDocPago.delete;
      End;
      DMTE.cdsDocPago.EnableControls;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcClaseDetExit(Sender: TObject);
Begin
   If z2bbtnCancel3.Focused Then exit;
   If dblcdCnp2.Focused Then exit;

   edtClaseDet.text := DMTE.DisplayDescripLocal(DMTE.cdsClaseAux, 'CLAUXID', dblcClaseDet.Text, 'CLAUXDES');

   If edtClaseDet.Text = '' Then
   Begin
      dblcdAuxDet.Text := '';
      dbeAuxDet.Text := '';
      ShowMessage('Error : Clase de Auxiliar no Valido');
      dblcClaseDet.SetFocus;
      Exit;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcdAuxExit2(Sender: TObject);
Var
   xSQL: String;
Begin
   If dblcClaseDet.Focused Then Exit;
   If z2bbtnCancel3.Focused Then exit;
   If dblcdCnp2.Focused Then exit;

   If DMTE.cdsAux.Active = False then
   Begin
      xSQL := 'Select AUXID, AUXNOMB, AUXABR, AUXRUC, PAISID, AUXDIR, AUXCZIP, AUXTELF, '
      + '           AUXFAX, AUXEMAIL, CLAUXID, AUXGIRA, PROVRETIGV, AUXDNI, PROVRUC, '
      + '           ACTIVO '
      + '      from CNT201 '
      + '     Where CLAUXID=''' + dblcClase.Text + ''' and ACTIVO=''S''';
      DMTE.cdsAux.Close;
      DMTE.cdsAux.DataRequest(xSQL);
      DMTE.cdsAux.Open;
   End;

   dbeAuxDet.text := DMTE.DisplayDescripLocal(DMTE.cdsAux, 'AUXID', dblcdAuxDet.Text, 'AUXNOMB');

   If dbeAuxDet.Text = '' Then
   Begin
      ShowMessage('Error : Auxiliar no Valido');
      dblcdAuxDet.SetFocus;
      Exit;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcdCnp2Exit2(Sender: TObject);
Var
   xwhere: String;
Begin
   If z2bbtnCancel3.Focused Then exit;

   xWhere := 'CPTOID=''' + dblcdCnp2.Text + '''AND CPTOIS=''E''';
   edtCnp2.text := DMTE.DisplayDescripLocal(cdsConceptoC1, 'CPTOID', dblcdCnp2.Text, 'CPTODES');

   If edtCnp2.Text = '' Then
   Begin
      DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString := '';
      dblcdAuxDet.Enabled := False;
      dblcdCCosto.Enabled := False;
      ShowMessage('Error : Concepto no Valido');
      dblcTDoc2.SetFocus;
      Exit;
   End;
                                              //DMTE.cdsCnpEgr
   DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString := cdsConceptoC1.FieldByname('CUENTAID').AsString;
   DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString := edtCnp2.text;

   xWhere := 'CIAID=''' + dblcCia.Text + ''' AND CUENTAID=''' + DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString + '''';

   DMTE.DisplayDescrip('prvTGE', 'TGE202', 'CUENTAID, CTA_CCOS, CTA_AUX', xWhere, 'CuentaId');

   If DMTE.cdsQry.fieldbyname('CTA_AUX').AsString = 'S' Then
   Begin
      dblcdAuxDet.Enabled := True;
      dblcClaseDet.Enabled := True;
      dblcClaseDet.SetFocus;
   End
   Else
   Begin
      DMTE.cdsRegCxP.FieldByName('PROV').AsString := dblcdAux.text;
      DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString := dblcClase.text;

      edtClaseDet.Text := edtClase.text;
      dbeAuxDet.Text := dbeGiradoA.text;
      dblcClaseDet.Enabled := False;
      dblcdAuxDet.Enabled := False;
   End;

   If DMTE.cdsQry.fieldbyname('CTA_CCOS').AsString = 'S' Then
   Begin
      dblcdCCosto.Enabled := true;
      If Not dblcClaseDet.Enabled Then
         dblcdCCosto.SetFocus;
   End
   Else
   Begin
      DMTE.cdsRegCxP.FieldByName('CCOSID').AsString := '';
      dblcdCCosto.Enabled := False;
   End;

End;

{******************************************************************************}

Procedure TFPagoGlobal2.wwDBEdit1Change22(Sender: TObject);
Begin
   wmodifica := True;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.FormDestroy(Sender: TObject);
Begin
   cf1.Free;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcdFEfecEnter(Sender: TObject);
Begin
   strTmp := dblcdFEfec.Text;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcdFEfecExit(Sender: TObject);
Begin
//Validacion
   If trim(TCustomEdit(Sender).Text) <> strTmp Then
   Begin
      If trim(TCustomEdit(Sender).Text) <> '' Then
      Begin
         If DMTE.RecuperarDatos('TGE217', 'FLUEFEABR', 'FLUEFEID=''' + TCustomEdit(Sender).Text + ''' ') Then
         Begin
            dbeFEfec.Text := DMTE.cdsRec.fieldbyname('FLUEFEABR').AsString;
         End
         Else
         Begin
            TCustomEdit(Sender).Text := '';
            dbeFEfec.Text := ''
         End;
      End
      Else
         dbeFEfec.Text := ''
   End;
   TCustomEdit(Sender).Text := trim(TCustomEdit(Sender).Text);
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ActDetCaja;
Begin
   If Not DMTE.cdsRegCxP.Eof Then
   Begin //Hay documentos en el detalle
      DMTE.cdsRegCxP.DisableControls;
      DMTE.cdsRegCxP.First;
      While Not DMTE.cdsRegCxP.Eof Do
      Begin
         DMTE.cdsRegCxP.Edit;
         DMTE.cdsRegCxP.FieldByName('DETCPAG').Value := strtofloat(dbeTCambio.Text);
         If DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc Then
         Begin
            DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
            DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat, 15, 2);
         End
         Else
         Begin
            DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat * DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
            DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
         End;
         DMTE.cdsRegCxP.Next;
      End;
      DMTE.cdsRegCxP.First;
      DMTE.cdsRegCxP.EnableControls;
   End;
   xTC := strtocurr(dbeTCambio.Text);
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ActDetCxP;
Var
   evt1: TFieldNotifyEvent;
   evt2: TFieldNotifyEvent;
   evt3: TFieldNotifyEvent;
Begin
   evt1 := DMTE.cdsDocPago.FieldByName('DEMTOLOC').OnChange;
   evt2 := DMTE.cdsDocPago.FieldByName('DEMTOEXT').OnChange;
   evt3 := DMTE.cdsDocPago.FieldByName('DETCPAG').OnChange;

   If Not DMTE.cdsDocPago.Eof Then
   Begin //Hay documentos en el detalle
      DMTE.cdsDocPago.DisableControls;
      DMTE.cdsDocPago.First;
      While Not DMTE.cdsDocPago.Eof Do
      Begin
         DMTE.cdsDocPago.Edit;
         DMTE.cdsDocPago.FieldByName('DEMTOLOC').OnChange := Nil;
         DMTE.cdsDocPago.FieldByName('DEMTOEXT').OnChange := Nil;
         DMTE.cdsDocPago.FieldByName('DETCPAG').OnChange := Nil;
         DMTE.cdsDocPago.FieldByName('DETCPAG').Value := StrToCurr(dbeTCambio.Text);
         If dblcTMon.Text = DMTE.wtMonLoc Then
         Begin
            DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat / DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat, 15, 2);
            DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat, 15, 2);
         End
         Else
         Begin
            DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat := DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat * DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat;
            DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat := DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat;
         End;

         DMTE.cdsDocPago.Next;
      End;
      DMTE.cdsDocPago.FieldByName('DEMTOLOC').OnChange := evt1;
      DMTE.cdsDocPago.FieldByName('DEMTOEXT').OnChange := evt2;
      DMTE.cdsDocPago.FieldByName('DETCPAG').OnChange := evt3;

      DMTE.cdsDocPago.First;
      DMTE.cdsDocPago.EnableControls;
      xTC := strtocurr(dbeTCambio.Text);
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ActualizaFiltro;
Begin
End;

{******************************************************************************}

Procedure TFPagoGlobal2.AsignaCDSFiltro(cds: TwwClientDataset);
Begin
   cdsFiltro := cds;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ActualizaDetCanje;
Var
   xSQL: String;
Begin
// Abrir detalle de Canje
   DMTE.cdsDetCanjeCxP.close;
   DMTE.cdsDetCanjeCxP.DataRequest('Select CIAID, PROV, PROVRUC, DOCID, CPSERIE, CPNODOC, '
      + '                                  CPNOREG, TCANJEID, CCPCANJE, CCPFCJE, DOCID2, '
      + '                                  CPSERIE2, CPNODOC2, TMONID, DCDMOORI, DCDMOLOC, '
      + '                                  DCDMOEXT, DCDUSER, DCDFREG, DCDHREG, DCDAAAA, '
      + '                                  DCDMM, DCDDD, DCDTRI, DCDSEM, DCDSS, DCDANOMM, '
      + '                                  DCDAATRI, DCDAASEM, DCDAASS, FLAGVAR, DCDTCAMB, '
      + '                                  CJEANTMN, CJEANTME, SALLOC, SALEXT, CLAUXID, '
      + '                                  CAJAAAMM, CAJACOMP, CAJATDIAR, CPTCAMAJ '
      + '                             from CXP305 '
      + '                            where CIAID = ''''');
   DMTE.cdsDetCanjeCxP.Open;

   DMTE.cdsDocPago.DisableControls;
   DMTE.cdsDocPago.First;

   While Not DMTE.cdsDocPago.Eof Do
   Begin
      DMTE.cdsDetCanjeCxP.Insert;
      DMTE.cdsDetCanjeCxP.FieldByName('CIAID').Value := DMTE.cdsDocPago.FieldByName('CIAID').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('PROV').Value := DMTE.cdsDocPago.FieldByName('PROV').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('PROVRUC').Value := DMTE.cdsDocPago.FieldByName('PROVRUC').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DOCID').Value := DMTE.cdsDocPago.FieldByName('DOCID2').value;
      DMTE.cdsDetCanjeCxP.FieldByName('CPSERIE').Value := DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('CPNODOC').Value := DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('CPNOREG').Value := DMTE.cdsDocPago.FieldByName('CPNOREG').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('TCANJEID').Value := '';
      DMTE.cdsDetCanjeCxP.FieldByName('CCPCANJE').Value := '';
      DMTE.cdsDetCanjeCxP.FieldByName('CCPFCJE').AsDateTime := dbdtpFComp.Date;
      DMTE.cdsDetCanjeCxP.FieldByName('TMONID').Value := DMTE.cdsDocPago.FieldByName('TMONID').Value;

      If DMTE.cdsDocPago.FieldByName('TMONID').Value = DMTE.wTMonLoc Then
      Begin
         DMTE.cdsDetCanjeCxP.FieldByName('DCDMOLOC').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').Value, 15, 2);
         DMTE.cdsDetCanjeCxP.FieldByName('DCDMOEXT').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').Value / DMTE.cdsDocPago.FieldByName('DETCDOC').Value, 15, 2);
      End
      Else
      Begin
         DMTE.cdsDetCanjeCxP.FieldByName('DCDMOEXT').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').Value, 15, 2);
         DMTE.cdsDetCanjeCxP.FieldByName('DCDMOLOC').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').Value * DMTE.cdsDocPago.FieldByName('DETCDOC').Value, 15, 2);
      End;

      DMTE.cdsDetCanjeCxP.FieldByName('DCDUSER').Value := DMTE.cdsDocPago.FieldByName('DEUSER').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDFREG').Value := DMTE.cdsDocPago.FieldByName('DEFREG').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDHREG').Value := DMTE.cdsDocPago.FieldByName('DEHREG').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDMM').Value := DMTE.cdsDocPago.FieldByName('DEMM').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDDD').Value := DMTE.cdsDocPago.FieldByName('DEDD').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDTRI').Value := DMTE.cdsDocPago.FieldByName('DETRI').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDSEM').Value := DMTE.cdsDocPago.FieldByName('DESEM').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDSS').Value := DMTE.cdsDocPago.FieldByName('DESS').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDAATRI').Value := DMTE.cdsDocPago.FieldByName('DEAATRI').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDAASEM').Value := DMTE.cdsDocPago.FieldByName('DEAASEM').Value;
      DMTE.cdsDetCanjeCxP.FieldByName('DCDAASS').Value := DMTE.cdsDocPago.FieldByName('DEAASS').Value;
      DMTE.cdsDetCanjeCxP.Post;

      xSQL := 'Insert into CXP305(CIAID, PROV, PROVRUC, DOCID, CPSERIE, CPNODOC, CPNOREG, '
         + '                      TCANJEID, CCPCANJE, CCPFCJE, TMONID, DCDMOLOC, DCDMOEXT, '
         + '                      DCDUSER, DCDFREG, DCDHREG, DCDMM, DCDDD, DCDTRI, DCDSEM, '
         + '                      DCDSS, DCDAATRI, DCDAASEM, DCDAASS) '
         + '   Values(' + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('CIAID').AsString) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('PROV').AsString) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('PROVRUC').AsString) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('DOCID').AsString) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('CPSERIE').AsString) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('CPNODOC').AsString) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('CPNOREG').AsString) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('TCANJEID').AsString) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('CCPCANJE').AsString) + ', '
         + quotedstr(datetostr(DMTE.cdsDetCanjeCxP.FieldByName('CCPFCJE').AsDateTime)) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('TMONID').AsString) + ', '
         + floattostr(DMTE.cdsDetCanjeCxP.FieldByName('DCDMOLOC').AsFloat) + ', '
         + floattostr(DMTE.cdsDetCanjeCxP.FieldByName('DCDMOEXT').AsFloat) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('DCDUSER').AsString) + ', '
         + ' trunc(Sysdate), '
         + ' Sysdate, '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('DCDMM').AsString) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('DCDDD').AsString) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('DCDTRI').AsString) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('DCDSEM').AsString) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('DCDSS').AsString) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('DCDAATRI').AsString) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('DCDAASEM').AsString) + ', '
         + quotedstr(DMTE.cdsDetCanjeCxP.FieldByName('DCDAASS').AsString) + ') ';
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al intentar grabar la cabecera del Egreso');
         xSigueGrab := False;
         DMTE.cdsDetCanjeCxP.Close;
         Exit;
      End;

      DMTE.cdsDocPago.Next;
   End;
   DMTE.cdsDocPago.First;
   DMTE.cdsDocPago.EnableControls;
   DMTE.cdsDetCanjeCxP.Close;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Buscar1Click2(Sender: TObject);
Begin
   lkdCxP.LookupTable := DMTE.cdsMovCxP;
   lkdCxP.Execute;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.lkdCxPCloseDialog(Dialog: TwwLookupDlg);
Begin
   lkdCxP.LookupTable := Nil;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.lkdCxPInitDialog(Dialog: TwwLookupDlg);
Begin
   Dialog.wwDBGrid1.TitleLines := 2;
   Dialog.wwDBGrid1.Selected.clear;
   Dialog.wwDBGrid1.Selected.Assign(dbgPendientes.Selected);
   Dialog.Width := 400;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.edtCuentaExit(Sender: TObject);
Var
   xSQL: String;
   xWhere: String;
Begin
   If z2bbtnCancel.Focused Then exit;
   If dblcFormPago.Focused Then exit;

   xSQL := 'Select CIAID, CUENTAID, CTADES, CTAABR, CTANIV, CTA_DET, CTA_AUT1, CTAAUT1, '
      + '          CTA_AUT2, CTAAUT2, CTA_CIER, CTA_PLAZ, CTA_MOV, CTA_AUX, CTA_DOC, '
      + '          CTA_CCOS, CTA_ME, CTA_DEST, FLGVAR, CTA_DIFC, CTACONTRA, CTA_SECU, '
      + '          CTA_AJUSTEREI, CTAMODDIFC, CTA_DIFGP, CTA_TIPO, TIPCTAID, USUARIO, '
      + '          HREG, FREG, CTA_APERT, CTA_TIPOREI, CTA_NOMONET, CTA_SALAJREI, '
      + '          CTA_CONSOL, CTA_PRES, CTA_SUMGA, REGSOLOME, CTA_TRANSAPE, CTAACT, '
      + '          CUENTA_SUNAT '
      + '     from TGE202 '
      + '    where CIAID=' + quotedstr(dblccia.Text)
      + '      and CUENTAID=' + quotedstr(edtCuenta.text);
   DMTE.cdsQry2.Close;
   DMTE.cdsQry2.DataRequest(xSQL);
   DMTE.cdsQry2.open;
   If (DMTE.cdsQry2.fieldbyname('CTA_AUX').AsString = 'S') Then
   Begin
      xWhere := 'CLAUXID=' + quotedstr(DMTE.cdsEgrCaja.fieldbyname('CLAUXID1').AsString);
      edtclasepnl.Text := DMTE.DisplayDescrip('prvClaseAux', 'TGE102', 'CLAUXDES', xWhere, 'CLAUXDES');
      xWhere := 'AUXID=' + quotedstr(DMTE.cdsEgrCaja.fieldbyname('AUXID').AsString);
      edtAuxpnl.Text := DMTE.DisplayDescrip('prvQry2', 'CNT201', 'AUXNOMB', xWhere, 'AUXNOMB');
      pnlCabecera2.Enabled := false;
   End
   Else
   Begin
      edtAuxpnl.Text := '';
      edtAuxpnl.visible := false;
      edtclasepnl.Text := '';
      edtclasepnl.visible := false;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Limpiapnlaux;
Begin
   edtAuxpnl.visible := false;
   edtAuxpnl.text := '';
   edtclasepnl.visible := false;
   edtclasepnl.text := '';
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbeNoChqExit(Sender: TObject);
Var
   xSql: String;
Begin
   xSql := 'CIAID=' + quotedstr(dblcCia.text) + ' AND TDIARID=' + quotedstr(dblcTDiario.text) + ' and '
      + 'ECNOCOMP<>' + quotedstr(dbeNoComp.Text) + ' and '
      + 'CCBCOID=' + quotedstr(dblcCCBco.Text) + ' AND ECNOCHQ=' + quotedstr(dbeNoChq.text);

   DMTE.DisplayDescrip('prvTGE', 'CAJA302', 'ECNOCHQ,ECESTADO,ECELABO', xsql, 'ECNOCHQ');
   If DMTE.cdsQry.FieldByName('ECNOCHQ').AsString <> '' Then
   Begin
      If DMTE.cdsQry.FieldByName('ECESTADO').AsString <> 'A' Then
      Begin
         showmessage('El número de Cheque ya fue Utilizado');
         dbeNoChq.Text := '';
         dbeNoChq.SetFocus;
      End
      Else
      Begin
         If DMTE.cdsQry.FieldByName('ECELABO').AsString = 'NULO' Then
         Begin
            showmessage('El número de Cheque ya fue Utilizado');
            dbeNoChq.Text := '';
            dbeNoChq.SetFocus;
         End
      End;
   End;

End;

{******************************************************************************}

Procedure TFPagoGlobal2.DescripPagoFact(Const xCIAID, xECANOMM, xTDIARID, xECNOCOMP: String);
Var
   xSQL: String;
Begin
   xSQL := 'Select TGE105.BANCOABR, TGE103.TMONABR, TGE106.CCBCODES, '
      + '          TGE112.FPAGOABR, TGE102.CLAUXABR, TGE110.DOCABR, CNT201.AUXABR, '
      + '          TGE101.CIADES, TGE104.TDIARABR, TGE217.FLUEFEABR '
      + '     from CAJA302, TGE105, TGE106, TGE103, TGE112, TGE102, '
      + '          TGE110, CNT201, TGE101, TGE104, TGE217 '
      + '    where CAJA302.CIAID=''' + xCIAID + ''' '
      + '      and CAJA302.TDIARID=''' + xTDIARID + ''' '
      + '      and CAJA302.ECANOMM=''' + xECANOMM + ''' '
      + '      and CAJA302.ECNOCOMP=''' + xECNOCOMP + ''' '
      + '      and (CAJA302.BANCOID = TGE105.BANCOID (+) ) '
      + '      and (CAJA302.BANCOID = TGE106.BANCOID (+) ) '
      + '      and (CAJA302.CCBCOID = TGE106.CCBCOID (+) ) '
      + '      and (CAJA302.TMONID = TGE103.TMONID (+) ) '
      + '      and (CAJA302.FPAGOID = TGE112.FPAGOID (+) ) '
      + '      and (CAJA302.CLAUXID = TGE102.CLAUXID (+) ) '
      + '      and (CAJA302.DOCID = TGE110.DOCID (+) ) '
      + '      and (CAJA302.PROV = CNT201.AUXID (+) )'
      + '      and (CAJA302.CLAUXID =CNT201.CLAUXID (+) ) '
      + '      and (CAJA302.CIAID = TGE101.CIAID (+) ) '
      + '      and (CAJA302.TDIARID = TGE104.TDIARID (+) ) '
      + '      and (CAJA302.FLUEID = TGE217.FLUEFEID (+) ) ';
   DMTE.cdsDescrip.close;
   DMTE.cdsDescrip.dataRequest(xSQL);
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ppHeaderBand2BeforePrint(Sender: TObject);
Begin
   pplblCia.text := edtCia.text;
   ppdbtCiaRuc.text := DMTE.DisplayDescrip('prvTGE', 'TGE101', 'CIARUC', 'CIAID=' + quotedstr(dblcCia.text), 'CIARUC');
   pplblNumero.text := dbeNoComp.text;
   pplblNombreCli.text := dbeGiradoA.text;
   pplblNRucCli.text := edtAuxRuc.text;
   pplblNDirCli.text := xDirAux;
   pplblNCtaCte.text := dblcdCtaCte.text;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Z2bbtnNotaAbonoClick(Sender: TObject);
Begin
   pprptNotaAbono.TEMPLATE.FileName := wRutaRpt + '\NotaAbono.rtm';
   pprptNotaAbono.template.LoadFromFile;
   pprptNotaAbono.print;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ppDetailBand2BeforePrint(Sender: TObject);
Begin
   If DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', 'TMONID=' + quotedstr(dblcTMon.text), 'TMON_LOC') = 'L' Then
   Begin
      ppdbMonto.DataField := 'DEMTOLOC';
      ppdbcTotal.DataField := 'DEMTOLOC';
   End
   Else
   Begin
      ppdbMonto.DataField := 'DEMTOEXT';
      ppdbcTotal.DataField := 'DEMTOEXT';
   End;
   pplblConcepto.Text := dblcdCnp.text;
   ppmmGlosa.Text := dbeGlosa.text;
   ppMoneda1.text := edtTMon.text;
   pplblMoneda.text := edtTMon.text;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbeTCExit(Sender: TObject);
Begin
   If DMTE.cdsDocPago.fieldbyName('TMONID').asString = DMTE.wtMonLoc Then
   Begin
      DMTE.cdsDocPago.fieldbyName('DESALEXT').asFloat := DMTE.FRound(DMTE.cdsDocPago.fieldbyName('DESALLOC').asFloat / DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
      DMTE.cdsDocPago.fieldbyName('DEMTOEXT').asFloat := DMTE.FRound(DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat / DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
   End
   Else
   Begin
      DMTE.cdsDocPago.fieldbyName('DESALLOC').asFloat := DMTE.FRound(DMTE.cdsDocPago.fieldbyName('DESALEXT').asFloat * DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
      DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat := DMTE.FRound(DMTE.cdsDocPago.fieldbyName('DEMTOEXT').asFloat * DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbeMPLExit(Sender: TObject);
Var
   xSaldo, xMonto: double;
Begin
   DMTE.cdsDocPago.Edit;

   If DMTE.cdsdocpago.FieldByName('TMONID').AsString = DMTE.wTMonExt Then
   Begin
      xMonto := DMTE.FRound(DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat / DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
      xSaldo := DMTE.cdsDocPago.fieldbyName('DESALEXT').asFloat;
      ;
   End
   Else
   Begin
      xMonto := DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat;
      xSaldo := DMTE.cdsDocPago.fieldbyName('DESALLOC').asFloat;
   End;

   If DMTE.FRound(xMonto, 15, 2) > DMTE.FRound(xSaldo, 15, 2) Then
   Begin
      ShowMessage('Monto excede a Saldo Actual');
      DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat := 0;
   End
   Else
   Begin
      DMTE.cdsDocPago.fieldbyName('DEMTOEXT').asFloat := DMTE.FRound(DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat / DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
      If dblcTmon.text = DMTE.wTMonLoc Then
         DMTE.cdsDocPago.fieldbyName('DEMTOORI').asFloat := DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat
      Else
         If dblcTmon.text = DMTE.wTMonExt Then
            DMTE.cdsDocPago.fieldbyName('DEMTOORI').asFloat := DMTE.cdsDocPago.fieldbyName('DEMTOEXT').asFloat
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbeMPEExit(Sender: TObject);
Var
   xMonto, xSaldo: double;
Begin
   DMTE.cdsDocPago.Edit;

   If DMTE.cdsdocpago.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
   Begin
      xMonto := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').asFloat * DMTE.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
      xSaldo := DMTE.cdsDocPago.FieldByName('DESALLOC').asFloat;
   End
   Else
   Begin
      xMonto := DMTE.cdsDocPago.FieldByName('DEMTOEXT').asFloat;
      xSaldo := DMTE.cdsDocPago.FieldByName('DESALEXT').asFloat;
   End;

   If DMTE.FRound(xMonto, 15, 2) > DMTE.FRound(xSaldo, 15, 2) Then
   Begin
      ShowMessage('Monto excede a Saldo Actual');
      DMTE.cdsDocPago.Edit;
      DMTE.cdsDocPago.FieldByName('DEMTOEXT').asFloat := 0;
   End
   Else
   Begin
      DMTE.cdsDocPago.FieldByName('DEMTOLOC').asFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').asFloat * DMTE.cdsDocPago.FieldByName('DETCPAG').asFloat, 15, 2);
      If dblcTmon.text = DMTE.wTMonLoc Then
         DMTE.cdsDocPago.fieldbyName('DEMTOORI').asFloat := DMTE.cdsDocPago.fieldbyName('DEMTOLOC').asFloat
      Else
         If dblcTmon.text = DMTE.wTMonExt Then
            DMTE.cdsDocPago.fieldbyName('DEMTOORI').asFloat := DMTE.cdsDocPago.fieldbyName('DEMTOEXT').asFloat
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.isBuscaExit(Sender: TObject);
Begin
   Screen.Cursor := crDefault;
   pnlBusca.Visible := False;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbgPendientesTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
   pnlBusca.Visible := True;
   lblBusca.Caption := dbgPendientes.ColumnByName(AFieldName).DisplayLabel;
   isBusca.SearchField := AFieldName;
   isBusca.SetFocus;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcdAuxEnter(Sender: TObject);
Begin
   If dblcClase.Text = '' Then
      dblcdAux.SetFocus;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.BitBtn1Click(Sender: TObject);
Begin
   lkdCxP.LookupTable := DMTE.cdsMovCxP;
   lkdCxP.Execute;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcdCCostoExit(Sender: TObject);
Var
   xSQL, tmp: String;
Begin

   If z2bbtnCancel3.Focused Then exit;
   If dblcdCnp2.Focused Then exit;
   If dblcClaseDet.Focused Then exit;
   If dblcdAuxDet.Focused Then exit;

   xSQL := 'CCOSID=' + QuotedStr(dblcdCCosto.Text) + ' and CCOSMOV=''S'' AND CCOSACT=''S'' '
      + ' and CCOSCIAS LIKE (' + quotedstr('%' + dblcCia.Text + '%') + ' ) ';

   tmp := DMTE.DisplayDescrip('prvTGE', 'TGE203', 'CCOSDES', xSQL, 'CCOSDES');
   If (dblcdCCosto.Text <> '') And (tmp = '') Then
   Begin
      ShowMessage('Centro de Costo no Existe. Verifique...');
      DMTE.cdsRegCxP.FieldByName('CCOSID').AsString := '';
      Exit;
   End;

End;

{******************************************************************************}

Procedure TFPagoGlobal2.Z2bbtnRetencionClick(Sender: TObject);
Var
   xSQL, xSerie, xNumRet, xFileName, xRutaPDF : String;
   x10: Integer;
Begin
   xSQL := 'Select A.CIAID, A.TDIARID, A.ANOMM, A.ECNOCOMP, A.FECPAGO, A.CLAUXID, A.AUXID, '
      + '          A.AUXRUC, A.DOCID, A.DOCDES, A.SERIE, A.NODOC, A.TRANID, A.TRANDES, A.DH, '
      + '          A.MTOORI, A.MTOLOC, A.MTOEXT, A.USUARIO, A.FREG, A.HREG, A.MTORETORI, '
      + '          A.MTORETLOC, A.MTORETEXT, A.FECEMI, A.RETSERIE, A.RETNUMERO, A.DOCID2, '
      + '          A.CPNODOC, A.CPNOREG, A.CPSERIE, A.ECESTADO, A.RETTOTDES, A.TCAMB, '
      + '          A.TMONIDFAC, A.FOTROREG, A.CIARUC, A.TASARET, A.NUMREGRET, '
      + '          C.DOCABR DOCDESC, B.AUXNOMB, B.AUXDIR, D.CIADES, D.CIARUC '
      + '     from CNT320 A, CNT201 B, TGE110 C, TGE101 D '
      + '    where A.CIAID=''' + DMTE.cdsEgrCaja.FieldByName('CIAID').AsString + ''' '
      + '      and A.ANOMM=''' + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' '
      + '      and A.TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' '
      + '      and A.ECNOCOMP=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' '
      + '      and A.CLAUXID=B.CLAUXID AND A.AUXID=B.AUXID '
      + '      and C.DOCMOD=''CXP'' AND C.DOCID=A.DOCID '
      + '      and D.CIAID=A.CIAID '
      + '    order BY A.CLAUXID, A.AUXID';
   DMTE.cdsRetencion.Close;
   DMTE.cdsRetencion.Datarequest(xSQL);
   DMTE.cdsRetencion.Open;

   If DMTE.cdsRetencion.RecordCount <= 0 Then
   Begin
      ShowMessage('No Existe Retención');
      Exit;
   End;

   xSerie := DMTE.cdsRetencion.FieldByName('RETSERIE').AsString;
   xNumRet := copy(DMTE.cdsRetencion.FieldByName('RETNUMERO').AsString,3,8);

   if xSerie='R001' then
   Begin
      xFileName := DMTE.cdsRetencion.FieldByName('CIARUC').AsString + '-20-' + xSerie + '-' + xNumRet;
      xRutaPDF :=  '\\10.11.10.156\pdf\';
      xFileName := xRutaPDF+xFileName+'.pdf';
      if not FileExists(xFileName) then
      Begin
         ShowMessage('El archivo PDF:'+chr(13)+xFileName+chr(13)+' del Certificado de Retención de IGV Electrónica, NO EXISTE');
         Exit;
      End;
      ShellExecute(Self.Handle, nil, PChar(xFileName),  '', '', SW_SHOWNORMAL);
   End
   Else
   Begin
      xSQL := 'Select A.CIAID, A.TDIARID, A.ANOMM, A.ECNOCOMP, A.FECPAGO, A.CLAUXID, A.AUXID, '
         + '          A.AUXRUC, A.DOCID, A.DOCDES, A.SERIE, A.NODOC, A.TRANID, A.TRANDES, A.DH, '
         + '          A.MTOORI, A.MTOLOC, A.MTOEXT, A.USUARIO, A.FREG, A.HREG, A.MTORETORI, '
         + '          A.MTORETLOC, A.MTORETEXT, A.FECEMI, A.RETSERIE, A.RETNUMERO, A.DOCID2, '
         + '          A.CPNODOC, A.CPNOREG, A.CPSERIE, A.ECESTADO, A.RETTOTDES, A.TCAMB, '
         + '          A.TMONIDFAC, A.FOTROREG, A.CIARUC, A.TASARET, A.NUMREGRET, '
         + '          C.DOCABR DOCDESC, B.AUXNOMB, B.AUXDIR, D.CIADES, D.CIARUC '
         + '     from CNT320 A, CNT201 B, TGE110 C, TGE101 D '
         + '    where A.CIAID=''' + DMTE.cdsEgrCaja.FieldByName('CIAID').AsString + ''' '
         + '      and A.ANOMM=''' + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' '
         + '      and A.TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' '
         + '      and A.ECNOCOMP=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' '
         + '      and A.CLAUXID=B.CLAUXID AND A.AUXID=B.AUXID '
         + '      and C.DOCMOD=''CXP'' AND C.DOCID=A.DOCID '
         + '      and D.CIAID=A.CIAID '
         + '    order BY A.CLAUXID, A.AUXID';
      DMTE.cdsRetencion.Close;
      DMTE.cdsRetencion.Datarequest(xSQL);
      DMTE.cdsRetencion.Open;

      If DMTE.cdsRetencion.RecordCount <= 0 Then
      Begin
         ShowMessage('No Existe Retención');
         Exit;
      End;
      DMTE.cdsRetencion.IndexFieldNames := 'RETNUMERO;CLAUXID;AUXID';
      ppdbRetencion.DataSource := DMTE.dsRetencion;
      pprRetencion.TEMPLATE.FileName := DMTE.wRutaCNT + '\Retenciones.rtm';
      pprRetencion.template.LoadFromFile;

   // cambia control de diseño de reporte
      If cbDisenoRep.Checked Then
      Begin
         ppDesigner1.Report := pprRetencion;
         ppDesigner1.Show;
      End
      Else
      Begin
         pprRetencion.Print;
         pprRetencion.Stop;

         x10 := DMTE.ComponentCount - 1;
         While x10 > 0 Do
         Begin
            If DMTE.components[x10].classname = 'TppGroup' Then
            Begin
               DMTE.components[x10].free;
            End;
            x10 := x10 - 1;
         End;
         ppdbRetencion.DataSource := Nil;
      End;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcdAuxDropDown(Sender: TObject);
Begin
   DMTE.cdsAux.IndexFieldNames := 'AUXNOMB';
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Contab_DocPago_Retencion_Debe(xRL, xRE, xRO: double);
Var
   xwhere, XsqL: String;
Begin
   If xDTRPorc > 0 Then Exit; // si hay DETRACCION

   DMTE.cdsCntCaja.FieldByName('CIAID').Value := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
   DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').Value := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').Value := 'CXP';
   DMTE.cdsCntCaja.FieldByName('DOCID').Value := '';
   DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := '';
   DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := '';
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').Clear;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Clear;
   DMTE.cdsCntCaja.FieldByName('CPTOID').Value := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTOID,CPTODES,CUENTAID', 'CPTOIS=''T''', 'CPTOID');
   DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := DMTE.cdsQry.FieldByName('CUENTAID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString + ' ' + DMTE.cdsQry3.fieldbyname('PROVDES').AsString;
   DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value;
   DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;
   DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value := strtofloat(dbeTCambio.Text);
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value := strtofloat(dbeTCambio.Text);
   DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

   DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value := xRO;
   DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := xRL;
   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xRE;

   DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
   xNReg := xNReg + 1;
   DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger := xNReg;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Contab_DocPago_Retencion_Haber;
Var
   xwhere, xSQL, xDocret: String;
   xMtoRetL1, xMtoRetE1, xMtoTotProv, xMtoTotProvL, xMtoTotProvE: Double;
   xMtoTotPagProvL, xMtoTotPagProvE: double;
   xCanje, sCajaAut: String;
Begin
   xSQL := 'Select CJAAUTONOM from TGE101 where CIAID=''' + dblcCia.text + '''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;
   sCajaAut := DMTE.cdsQry.FieldByName('CJAAUTONOM').AsString;
   DMTE.cdsQry.Close;

   If xDTRPorc > 0 Then Exit; // si hay DETRACCION

   bMayorQueTasa := False;
   xMtoRetL := 0;
   xMtoRetE := 0;
   xMtoRetL1 := 0;
   xMtoRetE1 := 0;

   xMtoTotProvL := 0;
   xMtoTotProvE := 0;

   xMtoTotPagProvL := 0;
   xMtoTotPagProvE := 0;

   DMTE.cdsDocPago.First;
   While Not DMTE.cdsDocPago.eof Do
   Begin
      If (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime >= DMTE.xTasaFec) And
         (DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCRETIGV', 'DOCMOD=''CXP'' AND DOCID=' + QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString), 'DOCRETIGV') = 'S') And
         (lblSujetoRetencion.visible) Then
      Begin
         xSQL := 'Select DOCID, TMONID, TCANJEID, CPNOGRAV, CPIGV, CPGRAVAD, CPCANJE, '
            + '          CPMTOLOC,CPMTOEXT,PROVRETIGV '
            + '     from CXP301 '
            + '    where CIAID=''' + DMTE.cdsDocPago.fieldbyname('CIAID2').AsString + ''' '
            + '      and CPANOMES=''' + DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString + ''' '
            + '      and TDIARID=''' + DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString + ''' '
            + '      and CPNOREG=''' + DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString + ''' ';
         DMTE.cdsQry3.IndexFieldNames := '';
         DMTE.cdsQry3.Close;
         DMTE.cdsQry3.DataRequest(xSQL);
         DMTE.cdsQry3.Open;

         If DMTE.cdsQry3.fieldbyname('TMONID').AsString = DMTE.wTMonLoc Then
            xPorcPago := DMTE.FRound(DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat
               / DMTE.cdsQry3.fieldbyname('CPMTOLOC').AsFloat, 15, 5)
         Else
            xPorcPago := DMTE.FRound(DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat
               / DMTE.cdsQry3.fieldbyname('CPMTOEXT').AsFloat, 15, 5);

       // Si es letra
         If (DMTE.cdsQry3.fieldbyname('TCANJEID').AsString = 'LE') And (DMTE.cdsQry3.fieldbyname('CPNOGRAV').AsFloat > 0) Then
         Begin
            xWhere := ' CIAID=''' + DMTE.cdsDocPago.fieldbyname('CIAID2').AsString + ''' and '
               + ' CPANOMES=''' + DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString + ''' and '
               + ' PROV=''' + DMTE.cdsDocPago.fieldbyname('PROV').AsString + ''' and '
               + ' CPNOREGLET=''' + DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString + ''' ';

            If DMTE.RecuperarDatos('CXP313', 'TMONID,TMONID2,TCANJEID,CPRETORI,CPRETLOC,CPRETEXT,PROV,CPTCAMPR', xWhere) Then
            Begin
               DMTE.cdsRec.First;
               While Not DMTE.cdsRec.Eof Do
               Begin
                  If DMTE.wTMonLoc = DMTE.cdsRec.FieldByName('TMONID2').AsString Then
                  Begin
                     xMtoRetL := xMtoRetL + DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat, 15, 2) * xPorcPago;
                     xMtoRetE := xMtoRetE + (DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat, 15, 2) * xPorcPago / strtofloat(dbeTCambio.Text));
                  End
                  Else
                  Begin
                     xMtoRetL := xMtoRetL + DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat, 15, 2) * xPorcPago * strtofloat(dbeTCambio.Text);
                     xMtoRetE := xMtoRetE + DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat, 15, 2) * xPorcPago;
                  End;
                  DMTE.cdsRec.Next;
               End;
               xMtoRetL := DMTE.FRound(xMtoRetL, 15, 2);
               xMtoRetE := DMTE.FRound(xMtoRetE, 15, 2);
            End;
         End
         Else //Si no son letras
         Begin
            If (DMTE.cdsQry3.fieldbyname('PROVRETIGV').AsString = 'S') Or
               (DMTE.cdsQry3.fieldbyname('DOCID').AsString = '07') Then
            Begin
               bMayorQueTasa := True;
               xMtoTotProvL := DMTE.FRound(xMtoTotProvL + DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat, 15, 2);
               xMtoTotProvE := DMTE.FRound(xMtoTotProvE + DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat, 15, 2);
               xMtoTotPagProvL := DMTE.FRound(xMtoTotPagProvL + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat, 15, 2);
               xMtoTotPagProvE := DMTE.FRound(xMtoTotPagProvE + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat, 15, 2);
            End;

            If (DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString <> 'C') Or (DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'C') Then
            Begin
               If (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime >= DMTE.xTasaFec) And
                  (DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCRETIGV', 'DOCMOD=''CXP'' AND DOCID=' + QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString), 'DOCRETIGV') = 'S') And
                  (lblSujetoRetencion.visible) Then
               Begin
                  If DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat, 15, 2) >= DMTE.xTasaMonto Then
                  Begin
                     xWhere := 'CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID2').AsString)
                        + ' and TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID2').AsString)
                        + ' and CPANOMES=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPANOMM').AsString)
                        + ' and CPNOREG=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPNOREG').AsString);
                     If length(DMTE.DisplayDescrip('prvTGE', 'CXP301', '*', xWhere, 'PROV')) > 0 Then
                     Begin
                        If ((DMTE.cdsQry.FieldByName('CPGRAVAD').AsFloat
                           + DMTE.cdsQry.FieldByName('CPIGV').AsFloat) >= DMTE.xTasaMonto)
                           And (DMTE.cdsQry.FieldByName('CPIGV').AsFloat > 0) Then
                        Begin
                           bMayorQueTasa := True;
                           xMtoTotProvL := DMTE.FRound(xMtoTotProvL + DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat, 15, 2);
                           xMtoTotProvE := DMTE.FRound(xMtoTotProvE + DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat, 15, 2);
                           xMtoTotPagProvL := DMTE.FRound(xMtoTotPagProvL + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat, 15, 2);
                           xMtoTotPagProvE := DMTE.FRound(xMtoTotPagProvE + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat, 15, 2);
                        End;
                     End;
                  End;
               End;
               If (bMayorQueTasa) Then
               Begin
                  xMtoRetL := DMTE.FRound(xMtoTotPagProvL * DMTE.xTasaPorce / 100, 15, 2);
                  xMtoRetE := DMTE.FRound(xMtoTotPagProvE * DMTE.xTasaPorce / 100, 15, 2);
               End;
            End;
         End;
      End;
      DMTE.cdsDocPago.Next;
   End;

   DMTE.cdsRegCxP.DisableControls;
   DMTE.cdsRegCxP.First;
   While Not DMTE.cdsRegCxP.Eof Do
   Begin
      If DMTE.cdsRegCxP.FieldByName('DEDH').AsString = 'D' Then
      Begin
         xWhere := 'DOCID=' + QuotedStr(DMTE.cdsRegCxP.FieldByName('DOCID2').AsString) + ' AND DOCMOD=''CXP''';
         If (DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCRETIGV', xWhere, 'DOCRETIGV') = 'S') And
            (DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime >= DMTE.xTasaFec) And
            (lblSujetoRetencion.Visible) Then
         Begin
            xMtoRetL1 := xMtoRetL1 + DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
            xMtoRetE1 := xMtoRetE1 + DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
            If DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat, 15, 4) >= DMTE.xTasaMonto Then
               bMayorQueMonto := True;
            xMtoTotProvL := DMTE.FRound(xMtoTotProvL + DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat, 15, 2);
            xMtoTotProvE := DMTE.FRound(xMtoTotProvE + DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat, 15, 2);
         End;
      End
      Else
      Begin
         xMtoTotProvL := DMTE.FRound(xMtoTotProvL - DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat, 15, 2);
         xMtoTotProvE := DMTE.FRound(xMtoTotProvE - DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat, 15, 2);
      End;
      DMTE.cdsRegCxP.Next;
   End;

   DMTE.cdsRegCxP.EnableControls;

   If DMTE.cdsRegCxP.RecordCount > 0 Then
   Begin
      If (bMayorQueTasa) Then
      Begin
         xMtoRetL := DMTE.FRound(xMtoTotPagProvL * DMTE.xTasaPorce / 100, 15, 2);
         xMtoRetE := DMTE.FRound(xMtoTotPagProvE * DMTE.xTasaPorce / 100, 15, 2);
      End;
   End;

   If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'C' Then
   Begin
      xSQL := 'Select RETSERIE, RETNUMERO, FECPAGO, '
         + '          SUM( MTORETLOC ) RETLOC, SUM( MTORETEXT ) RETEXT '
         + '     From CNT320 '
         + '    where CIAID=''' + DMTE.cdsEgrCaja.FieldByName('CIAID').AsString + ''' '
         + '      and ANOMM=''' + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' '
         + '      and TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' '
         + '      and ECNOCOMP=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' '
         + '    group by RETSERIE, RETNUMERO, FECPAGO';
      DMTE.cdsQry4.Close;
      DMTE.cdsQry4.Datarequest(xSQL);
      DMTE.cdsQry4.Open;

      xWhere := 'DOCMOD=''CXP'' AND DOCTIPREG=''CR'' ';
      xDocRet := DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCID', xWhere, 'DOCID');

      While Not DMTE.cdsQry4.Eof Do
      Begin
         DMTE.cdsCntCaja.Insert;
         DMTE.cdsCntCaja.FieldByName('CIAID').Value := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
         DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
         DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
         DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
         DMTE.cdsCntCaja.FieldByName('DCLOTE').Value := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
         DMTE.cdsCntCaja.FieldByName('DOCMOD').Value := 'CXP';
         DMTE.cdsCntCaja.FieldByName('DOCID').Value := xDocRet;
         DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsQry4.FieldByname('RETSERIE').AsString;
         DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsQry4.FieldByname('RETNUMERO').AsString;
         DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsQry4.FieldByname('FECPAGO').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsQry4.FieldByname('FECPAGO').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value := DMTE.cdsQry4.FieldByname('FECPAGO').AsDateTime;
         If sCajaAut = 'N' Then
         Begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTOID,CPTODES,CUENTAID', 'CPTOIS=''T''', 'CPTOID');
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := DMTE.cdsQry.FieldByName('CUENTAID').AsString;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString;
         End
         Else
         Begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTOID,CPTODES,CUENTAID', 'CPTOIS=''R''', 'CPTOID');
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := DMTE.cdsQry.FieldByName('CUENTAID').AsString;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString;
         End;
         DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value;
         DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;
         DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
         DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value := StrToFloat(dbeTCambio.text);
         DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value := StrToFloat(dbeTCambio.text);
         DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

         DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.cdsQry4.FieldByname('RETLOC').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.cdsQry4.FieldByname('RETEXT').AsFloat;
         If dblcTMon.Text = DMTE.wTMonLoc Then
            DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.cdsQry4.FieldByname('RETLOC').AsFloat
         Else
            DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.cdsQry4.FieldByname('RETEXT').AsFloat;

         DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
         DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
         DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
         xNReg := xNReg + 1;
         DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger := xNReg;
         DMTE.cdsCntCaja.Post;

         xSQL := 'Insert into CAJA304(CIAID,TDIARID, ECANOMM, ECNOCOMP, DCLOTE, DOCMOD, DOCID, DCSERIE,'
            + '                       DCNODOC, ECFCOMP, DCFEMIS, DCFVCMTO, CPTOID, CUENTAID, DCGLOSA, '
            + '                       CLAUXID, DCAUXID, DCDH, DCTCAMPA, DCTCAMPR, TMONID, DCMTOLO, '
            + '                       DCMTOEXT, DCMTOORI, DCFLACDR, DCANO, DCMM, DCDD, DCSS, DCSEM, '
            + '                       DCTRI, DCAASS, DCAASEM, DCAATRI, NREG) '
            + '   Values('
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CIAID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TDIARID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime)) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime)) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime)) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CPTOID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDH').AsString) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TMONID').AsString) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCANO').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCMM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDD').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSS').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSEM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCTRI').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASS').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString) + ', '
            + inttostr(DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger) + ') ';
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error en la Contabilización 1(Contab_DocPago_Retencion_Haber)');
            xSigueGrab := False;
            Exit;
         End;
         DMTE.cdsQry4.Next;
      End;
   End
   Else
   Begin
      If (xMtoRetL > 0) Or (xMtoRetE > 0) Then
      Begin
         DMTE.cdsCntCaja.Insert;
         DMTE.cdsCntCaja.FieldByName('CIAID').Value := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
         DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
         DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
         DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
         DMTE.cdsCntCaja.FieldByName('DCLOTE').Value := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
         DMTE.cdsCntCaja.FieldByName('DOCMOD').Value := 'CXP';
         DMTE.cdsCntCaja.FieldByName('DOCID').Value := '';
         DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := '';
         DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := '';
         DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
         DMTE.cdsCntCaja.FieldByName('DCFEMIS').Clear;
         DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Clear;
         If sCajaAut = 'N' Then
         Begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTOID,CPTODES,CUENTAID', 'CPTOIS=''T''', 'CPTOID');
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := DMTE.cdsQry.FieldByName('CUENTAID').AsString;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString;
         End
         Else
         Begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTOID,CPTODES,CUENTAID', 'CPTOIS=''R''', 'CPTOID');
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := DMTE.cdsQry.FieldByName('CUENTAID').AsString;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString;
         End;
         DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value;
         DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value;
         DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
         DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value := StrToFloat(dbeTCambio.text);
         DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value := StrToFloat(dbeTCambio.text);
         DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

         DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := xMtoRetL;
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMtoRetE;
         If dblcTMon.Text = DMTE.wTMonLoc Then
            DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xMtoRetL
         Else
            DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xMtoRetE;

         DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
         DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
         DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
         xNReg := xNReg + 1;
         DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger := xNReg;
         DMTE.cdsCntCaja.Post;

         xSQL := 'Insert into CAJA304(CIAID, TDIARID, ECANOMM, ECNOCOMP, DCLOTE, DOCMOD, DOCID, '
            + '                       DCSERIE, DCNODOC, ECFCOMP, DCFEMIS, DCFVCMTO, CPTOID, CUENTAID, '
            + '                       DCGLOSA, CLAUXID, DCAUXID, DCDH, DCTCAMPA, DCTCAMPR, TMONID, '
            + '                       DCMTOLO, DCMTOEXT, DCMTOORI, DCFLACDR, DCANO, DCMM, DCDD, DCSS, '
            + '                       DCSEM, DCTRI, DCAASS, DCAASEM, DCAATRI, NREG) '
            + '   Values('
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CIAID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TDIARID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime)) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime)) + ', '
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime)) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CPTOID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDH').AsString) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TMONID').AsString) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat) + ', '
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCANO').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCMM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDD').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSS').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSEM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCTRI').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASS').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString) + ', '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString) + ', '
            + inttostr(DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger) + ') ';
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error en la Contabilización 2(Contab_DocPago_Retencion_Haber)');
            xSigueGrab := False;
            Exit;
         End;
      End;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Contab_DifCamDocPago_Retencion(wPorcPago, xMtoRetL, xMtoRetLH: double);
Var
   xMONID_PROV, xWhere, xsql, xsql1: String;
Begin
   If xDTRPorc > 0 Then Exit; // si hay DETRACCION

   If xDTRPorc > 0 Then Exit; // si hay DETRACCION

   If ABS(xMtoRetL - xMtoRetLH) > 0 Then
   Begin
      DMTE.cdsCntCaja.Insert;
      DMTE.cdsCntCaja.FieldByName('CIAID').Value := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
      DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
      DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
      DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('DCLOTE').Value := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
      DMTE.cdsCntCaja.FieldByName('DOCID').Value := DMTE.cdsDocPago.FieldByName('DOCID2').Value;
      DMTE.cdsCntCaja.FieldByName('DOCMOD').Value := 'CXP';
      DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsDocPago.FieldByName('CPSERIE').Value;
      DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsDocPago.FieldByName('CPNODOC').Value;
      DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := DMTE.cdsDocPago.FieldByName('CUENTAID').Value;
      DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
      DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value; //Aqui se toma de la cabecera
      DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value := DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
      DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value := DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
      DMTE.cdsCntCaja.FieldByName('DCANO').Value := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
      DMTE.cdsCntCaja.FieldByName('DCMM').Value := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
      DMTE.cdsCntCaja.FieldByName('DCDD').Value := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
      DMTE.cdsCntCaja.FieldByName('DCSS').Value := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
      DMTE.cdsCntCaja.FieldByName('DCSEM').Value := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
      DMTE.cdsCntCaja.FieldByName('DCTRI').Value := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
      DMTE.cdsCntCaja.FieldByName('DCAASS').Value := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
      DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
      DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;

      xNReg := xNReg + 1;
      DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger := xNReg;

      DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value := 'S'; //Registro ya cuadrado
      DMTE.cdsCntCaja.FieldByName('DCUSER').Value := DMTE.wUsuario;
      DMTE.cdsCntCaja.FieldByName('DCFREG').Value := Date;
      DMTE.cdsCntCaja.FieldByName('DCHREG').Value := Time;
      DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

      If xMtoREtLH > xMtoRetL Then
      Begin
         DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
         xMTOCNTLOC := xMtoREtLH - xMtoRetL;

      End
      Else
      Begin
         DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
         xMTOCNTLOC := xMtoREtL - xMtoRetLH;
      End;
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value := xMTOCNTLOC;
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := xMTOCNTLOC;
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := 0;

      If DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'D' Then
      Begin
         DMTE.cdsCntCaja.FieldByName('CPTOID').Value := wCptoPer;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaPer;
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Dif.Camb.Retencion';
      End
      Else
      Begin
         DMTE.cdsCntCaja.FieldByName('CPTOID').Value := wCptoGan;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaGan;
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Dif.Camb.Retencion';
      End;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.GrabaCabeceraDeComprobante;
Var
   xSQL: String;
Begin
   DMTE.cdsEgrCaja.CancelUpdates;
   xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, CLAUXID, PROV, PROVRUC, '
      + '          ECFCOMP, ECFEMICH, ECFPAGOP, ECFCOBCH, FPAGOID, DOCID, ECNODOC, '
      + '          TMONID, ECTCAMB, ECMTOORI, ECMTOLOC, ECMTOEXT, BANCOID, CCBCOID, '
      + '          ECNOCHQ, ECGIRA, CPTOID, CUENTAID, ECGLOSA, ECLOTE, ECELABO, '
      + '          ECAPROB, ECESTADO, ECCONTA, ECUSER, ECFREG, ECHREG, ECANO, ECMM, '
      + '          ECDD, ECSS, ECSEM, ECTRI, ECAASS, ECAASEM, ECAATRI, FLAGVAR, '
      + '          EC_PROCE, ECOPAGO, TDIARIO2, ECNOCOMP2, ECANOMM2, EC_IE, ECCHQEMI, '
      + '          USERRESP, EQUIID, ECCHKEST, ECPERNDOC, ECPERREC, TIPDOCCOD, PERID, '
      + '          ECFENTR, ECCONSOLID, ECMTCON, ECFCV, ECCOBLOC, ECMTDIF, ECCOBEXT, '
      + '          ECDEVLOC, ECDEVEXT, FEXTCHQ, FLUEID, ECCONING, ECNOREPO, CLAUXID1, '
      + '          AUXID, PROV1, CCBCOVOUCH, PRVBANCOID, PRVCCBCOID, ECSALMN, ECSALME, '
      + '          CAJARETIGV, FDOFIJJUST, GCONCID, TIPDET, ECNOCOMPR, CNTCOMPROB, '
      + '          KEYVALE, FLGREN '
      + '     from CAJA302 '
      + '    Where CIAID=' + quotedstr(dblcCia.Text)
      + '      and ECANOMM=' + quotedstr(edtPeriodo.Text)
      + '      and TDIARID=' + quotedstr(dblcTDiario.Text)
      + '      and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest(xSQL);
   DMTE.cdsEgrCaja.Open;
   If DMTE.cdsEgrCaja.RecordCount = 0 Then
   Begin
      DMTE.cdsEgrCaja.Insert;
      DMTE.cdsEgrCaja.FieldByName('CIAID').AsString := dblcCia.Text;
      DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString := edtPeriodo.Text;
      DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString := dblcTDiario.Text;
      DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString := dbeNoComp.Text;
      DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'X';
      DMTE.cdsEgrCaja.Post;
      xSQL := ' Insert into CAJA302( CIAID, ECANOMM, TDIARID, ECNOCOMP, ECESTADO ) '
         + '    Values( ' + quotedstr(DMTE.cdsEgrCaja.fieldbyname('CIAID').AsString) + ', '
         + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECANOMM').AsString) + ', '
         + quotedstr(DMTE.cdsEgrCaja.fieldbyname('TDIARID').AsString) + ', '
         + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECNOCOMP').AsString) + ', '
         + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECESTADO').AsString) + ') ';
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo insertar la cabecera del pago global, intente con otro número de Registro - 1');
         dbdtpFComp.SetFocus;
         exit;
      End;
   End
   Else
   Begin
      xSQL := ' Update CAJA302 '
         + '       set ECHREG = sysdate '
         + '     Where CIAID = ' + quotedstr(DMTE.cdsEgrCaja.fieldbyname('CIAID').AsString)
         + '       and TDIARID = ' + quotedstr(DMTE.cdsEgrCaja.fieldbyname('TDIARID').AsString)
         + '       and ECANOMM = ' + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECANOMM').AsString)
         + '       and ECNOCOMP = ' + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECNOCOMP').AsString);
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('No se pudo actualizar la cabecera del pago global, intente con otro número de Registro - 2');
      End;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbeNoCompEnter(Sender: TObject);
Var
   xWhere: String;
Begin
   If trim(edtTDiario.Text) <> '' Then
   Begin
      xWhere := 'CIAID=' + quotedstr(dblcCia.Text) + ' AND ECANOMM=' + quotedstr(edtPeriodo.Text)
         + ' AND TDIARID=' + quotedstr(dblcTDiario.Text); // + ' AND EC_PROCE='+quotedstr('B');
      dbeNoComp.text := DMTE.UltimoNum('prvCaja', 'CAJA302', 'ECNOCOMP', xWhere);
      dbeNoComp.text := DMTE.StrZero(dbeNoComp.text, DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Z2bbtChqVouchClick(Sender: TObject);
Var
   strChq: structChq;
   xsql, xWhere, ArchivoReporte: String;
   xTotal: double;
Begin
   xWhere := ' CIAID=' + quotedstr(dblcCia.text) + ' AND BANCOID=' + Quotedstr(dblcBanco.Text) +
      ' AND CCBCOID=' + quotedstr(dblcCCBco.text);
   DMTE.DisplayDescrip('prvQry2', 'TGE106', 'CHQVOUCH', xWhere, 'CHQVOUCH');
   If DMTE.cdsQry.FieldByName('CHQVOUCH').AsString <> 'S' Then
      Raise exception.Create('Esta Cta.Cte no genera Cheque Voucher');

   If DMTE.cdsEgrcaja.FieldByName('ECESTADO').AsString = 'A' Then
      Raise exception.Create('El Comprobante se encuentra Anulado');

   If DMTE.cdsEgrcaja.FieldByName('ECESTADO').AsString <> 'C' Then
      Raise exception.Create('Debe Cancelar el Comprobante primero');

   If trim(dblcCCBco.Text) <> '' Then
   Begin
      xTotal := 0;
      xSQL := 'Select SUM( MTORETLOC ) RETLOC, SUM( MTORETEXT ) RETEXT '
         + '     from CNT320 '
         + '    where CIAID=''' + DMTE.cdsEgrcaja.FieldByName('CIAID').AsString + ''' '
         + '      and ANOMM=''' + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' '
         + '      and TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' '
         + '      and ECNOCOMP=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' '
         + '      and (DOCID2 IS NULL OR DOCID2='''' ) ';
      DMTE.cdsQry4.Close;
      DMTE.cdsQry4.Datarequest(xSQL);
      DMTE.cdsQry4.Open;

      If dblcTMon.Text = DMTE.wTMonLoc Then
         xTotal := DMTE.FRound(strtoFloat(dbeImporte.Text) - DMTE.cdsQry4.fieldbyname('RETLOC').AsFloat, 15, 2)
      Else
         If dblcTMon.Text = DMTE.wTMonExt Then
            xTotal := DMTE.FRound(strtoFloat(dbeImporte.Text) - DMTE.cdsQry4.fieldbyname('RETEXT').AsFloat, 15, 2);

      xSQL := '     CIAID=''' + dblcCia.text + ''' and '
         + 'TDIARID=''' + dblcTDiario.text + ''' and '
         + 'ECANOMM=''' + edtPeriodo.text + ''' and '
         + 'ECNOCOMP=''' + dbeNoComp.text + ''' ';
      If DMTE.DisplayDescrip('prvSQL', 'CAJA302', 'ECCHQEMI', xsql, 'ECCHQEMI') <> 'S' Then
      Begin
         GeneraRegChqVouch;
         ppdbpChqVouch.DataSource := DMTE.dsTrans;
         pprChqVouch.TEMPLATE.FileName := wRutaRpt + '\ChequeVoucher.rtm';
         pprChqVouch.template.LoadFromFile;
         ppGiradoA.Caption := dbeGiradoA.Text;
         ppImporte.Caption := floattostrf(strtocurr(Floattostr(xTotal)), fffixed, 10, 2);

         ppImporte.Caption := format('%15.2n', [strtofloat(ppImporte.Caption)]);
         ppImporte.Caption := StringReplace(ppImporte.Caption, ' ', '*', [rfreplaceAll]);
         ppMontoLetras.Caption := strNum(xTotal);
         ppDia.Caption := strDia(dbdtpFEmis.Date);
         ppmes.Caption := strMes(dbdtpFEmis.Date);
         ppAno.Caption := strAno(dbdtpFEmis.Date);
         ppGiradoA2.Caption := dbeGiradoA.Text;
         ppCtaBanco.Caption := dblcCCBco.Text;
         ppGlosa.Caption := dbeGlosa.Text;
         ppImporte2.Caption := ppImporte.Caption;
         ppMoneda.Caption := edtTMon.Text;
         ppComprobante.Caption := dblcTDiario.Text + Floattostr(strtoFloat(dbeNoComp.text));
         ppDesigner1.Show;
//          pprChqVouch.Print;

         DMTE.xFlagP := False;
         If DMTE.xFlagP Then
         Begin
            xSQL := 'Update CAJA302 '
               + '      set ECCHQEMI=''S'' '
               + '    where CIAID=''' + dblcCia.text + ''' '
               + '      and TDIARID=''' + dblcTDiario.text + ''' '
               + '      and ECANOMM=''' + edtPeriodo.text + ''' '
               + '      and ECNOCOMP=''' + dbeNoComp.text + ''' ';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         End;
      End
      Else
         Showmessage('Cheque ya fue impreso');
   End
   Else
   Begin
      Showmessage('No ha seleccionado Cuenta Corriente');
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.GeneraRegChqVouch;
Var
   xCuentaId, xsql, xWhere: String;
   xMto: double;
   xMTOCHQLOC: Double;
   xMTOCHQEXT: double;
   xbEof: boolean;
   xCtaDG, xCtaDP: String;
Begin

   DMTE.cdsCNTCaja.IndexFieldNames := '';

   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' Then
   Begin
      Contabiliza;
   End;

   xsql := 'Select A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.DCLOTE, A.DOCID, A.DCSERIE, '
      + '          A.DCNODOC, A.DCFEMIS, A.DCFVCMTO, A.CPTOID, A.CUENTAID, A.CLAUXID, A.DCAUXID,'
      + '          A.CCOSID, A.DCDH, A.DCTCAMPR, A.DCTCAMPA, A.TMONID, A.DCMTOORI, A.DCMTOLO,'
      + '          A.DCMTOEXT, A.DCESTADO, A.DCFLACDR, A.DCFLAAUT, A.DCUSER, A.DCFREG, DCHREG,'
      + '          A.DCANO, A.DCMM, A.DCDD, A.DCSS, A.DCSEM, A.DCTRI, A.DCAASS, A.DCAASEM, '
      + '          A.DCAATRI, A.FLAGVAR, A.ECFCOMP, A.DCGLOSA, A.ECMTCON, A.ECMTDIF, A.FCAB, '
      + '          A.DOCMOD, A.DOCMOD1, A.DOCMOD2, A.CAJAREG, A.NREG, A.CNTCOMPROB, '
      + '          0.00 DEBE,0.00 HABER '
      + '     from CAJA304 A  '
      + '    where (A.CIAID=' + quotedstr('XY')
      + '      and A.ECANOMM=' + quotedstr('190001') + ' ) ';
   DMTE.cdsTrans.IndexFieldNames := '';
   DMTE.cdsTrans.Filter := '';
   DMTE.cdsTrans.Filtered := False;
   DMTE.cdsTrans.Close;
   DMTE.cdsTrans.DataRequest(xSQL);
   DMTE.cdsTrans.Open;
   DMTE.cdsTrans.EmptyDataSet;

   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' Then
   Begin
      xsql := 'Select A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.DCLOTE, A.DOCID, A.DCSERIE, '
         + '          A.DCNODOC, A.DCFEMIS, A.DCFVCMTO, A.CPTOID, A.CUENTAID, A.CLAUXID, A.DCAUXID,'
         + '          A.CCOSID, A.DCDH, A.DCTCAMPR, A.DCTCAMPA, A.TMONID, A.DCMTOORI, A.DCMTOLO,'
         + '          A.DCMTOEXT, A.DCESTADO, A.DCFLACDR, A.DCFLAAUT, A.DCUSER, A.DCFREG, DCHREG,'
         + '          A.DCANO, A.DCMM, A.DCDD, A.DCSS, A.DCSEM, A.DCTRI, A.DCAASS, A.DCAASEM, '
         + '          A.DCAATRI, A.FLAGVAR, A.ECFCOMP, A.DCGLOSA, A.ECMTCON, A.ECMTDIF, A.FCAB, '
         + '          A.DOCMOD, A.DOCMOD1, A.DOCMOD2, A.CAJAREG, A.NREG, A.CNTCOMPROB, B.CIADES '
         + '     from CAJA304 A, TGE101 B  '
         + '    where (A.CIAID=' + quotedstr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)
         + '      and A.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
         + '      and A.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
         + '      and A.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
         + '      and A.CIAID=B.CIAID ) ';
      DMTE.cdsCntCaja.Close;
      DMTE.cdsCntCaja.DataRequest(xSQL);
      DMTE.cdsCntCaja.Open;
   End;

   xNReg := 0;
   xMto := 0;
   xbEof := False;

   DMTE.cdsCntCaja.IndexFieldNames := 'CUENTAID';
   DMTE.cdsCntCaja.First;
   xCuentaId := DMTE.cdsCntCaja.fieldbyname('CUENTAID').AsString;
   While Not DMTE.cdsCntCaja.Eof Do
   Begin
      xMTOCHQLOC := DMTE.FRound(xMTOCHQLOC + DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat, 15, 2);
      xMTOCHQEXT := DMTE.FRound(xMTOCHQEXT + DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat, 15, 2);

      DMTE.cdsCntCaja.Next;
      xbEof := DMTE.cdsCntCaja.Eof;

      If (DMTE.cdsCntCaja.Eof) Or (xCuentaId <> DMTE.cdsCntCaja.fieldbyname('CUENTAID').AsString) Then
      Begin
         If Not DMTE.cdsCntCaja.EOF Then
            DMTE.cdsCntCaja.Prior;
         xNReg := 0;

         DMTE.cdsTrans.Insert;
         DMTE.cdsTrans.FieldByName('CIAID').Value := DMTE.cdsCntCaja.FieldByName('CIAID').Value;
         DMTE.cdsTrans.FieldByName('TDIARID').Value := DMTE.cdsCntCaja.FieldByName('TDIARID').Value;
         DMTE.cdsTrans.FieldByName('ECANOMM').Value := DMTE.cdsCntCaja.FieldByName('ECANOMM').Value;
         DMTE.cdsTrans.FieldByName('ECNOCOMP').Value := DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value;
         DMTE.cdsTrans.FieldByName('DCLOTE').Value := DMTE.cdsCntCaja.FieldByName('DCLOTE').Value;
         DMTE.cdsTrans.FieldByName('DOCMOD').Value := 'CXP';
         DMTE.cdsTrans.FieldByName('DOCID').Value := DMTE.cdsCntCaja.FieldByName('DOCID').Value;
         DMTE.cdsTrans.FieldByName('DCSERIE').Value := DMTE.cdsCntCaja.FieldByName('DCSERIE').Value;
         DMTE.cdsTrans.FieldByName('DCNODOC').Value := DMTE.cdsCntCaja.FieldByName('DCNODOC').Value;
         DMTE.cdsTrans.FieldByName('ECFCOMP').Value := DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value;
         DMTE.cdsTrans.FieldByName('DCFEMIS').Value := DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value;
         DMTE.cdsTrans.FieldByName('DCFVCMTO').Value := DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value;
         DMTE.cdsTrans.FieldByName('CPTOID').Value := DMTE.cdsCntCaja.FieldByName('CPTOID').Value;
         DMTE.cdsTrans.FieldByName('CUENTAID').Value := DMTE.cdsCntCaja.FieldByName('CUENTAID').Value;
         DMTE.cdsTrans.FieldByName('CLAUXID').Value := DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString;
         DMTE.cdsTrans.FieldByName('CCOSID').Value := DMTE.cdsCntCaja.FieldByName('CCOSID').AsString;
         If DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString <> '' Then
         Begin
            DMTE.cdsTrans.FieldByName('DCAUXID').Value := DMTE.cdsCntCaja.FieldByName('DCAUXID').Value;
            DMTE.cdsTrans.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
         End
         Else
         Begin
            DMTE.cdsTrans.FieldByName('DCAUXID').Value := DMTE.cdsCntCaja.FieldByName('CUENTAID').Value;
//            DMTE.cdsTrans.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
         End;

         DMTE.cdsTrans.FieldByName('DCTCAMPA').Value := DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value;
         DMTE.cdsTrans.FieldByName('TMONID').Value := DMTE.cdsCntCaja.FieldByName('TMONID').Value;
         DMTE.cdsTrans.FieldByName('DCDH').Value := DMTE.cdsCntCaja.FieldByName('DCDH').Value;
         If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
         Begin
            DMTE.cdsTrans.FieldByName('DCMTOORI').AsFloat := xMTOCHQLOC;
            DMTE.cdsTrans.FieldByName('DCMTOEXT').AsFloat := xMTOCHQEXT;
            DMTE.cdsTrans.FieldByName('DCMTOLO').AsFloat := xMTOCHQLOC;
            If DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'D' Then
               DMTE.cdsTrans.FieldByName('DEBE').AsFloat := xMTOCHQLOC
            Else
               If DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'H' Then
                  DMTE.cdsTrans.FieldByName('HABER').AsFloat := xMTOCHQLOC;

         End
         Else
            If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonExt Then
            Begin
               DMTE.cdsTrans.FieldByName('DCMTOORI').AsFloat := xMTOCHQEXT;
               DMTE.cdsTrans.FieldByName('DCMTOEXT').AsFloat := xMTOCHQEXT;
               DMTE.cdsTrans.FieldByName('DCMTOLO').AsFloat := xMTOCHQLOC;
               If DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'D' Then
                  DMTE.cdsTrans.FieldByName('DEBE').AsFloat := xMTOCHQEXT
               Else
                  If DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'H' Then
                     DMTE.cdsTrans.FieldByName('HABER').AsFloat := xMTOCHQEXT;
            End;
         DMTE.cdsTrans.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
         DMTE.cdsTrans.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
         DMTE.cdsTrans.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
         DMTE.cdsTrans.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
         DMTE.cdsTrans.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
         DMTE.cdsTrans.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
         DMTE.cdsTrans.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
         DMTE.cdsTrans.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
         DMTE.cdsTrans.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
         DMTE.cdsTrans.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
         DMTE.cdsTrans.FieldByName('DCUSER').AsString := DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString;

         xNReg := xNReg + 1;
         DMTE.cdsTrans.fieldbyName('NREG').AsInteger := xNReg;
         If xbEof Then
            DMTE.cdsCntCaja.Last
         Else
            DMTE.cdsCntCaja.Next;
         xMTOCHQEXT := 0;
         xMTOCHQLOC := 0;
         xCuentaId := DMTE.cdsCntCaja.fieldbyname('CUENTAID').AsString;

      End;
   End;
   DMTE.cdsTrans.Post;
   DMTE.cdsTrans.Filter := 'DEBE>0 OR HABER>0';
   DMTE.cdsTrans.Filtered := True;
   DMTE.cdsCntCaja.IndexFieldNames := '';

End;

{******************************************************************************}

Procedure TFPagoGlobal2.pprChqVouchPrintingComplete(Sender: TObject);
Begin
   DMTE.xFlagP := True;
End;

Procedure TFPagoGlobal2.dbeImporteKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If Key In [' ', 'A'..'Z', 'a'..'z',
      '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
      '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
      ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
      '-', '_'] Then
      Key := #0;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbeImporteExit(Sender: TObject);
Begin
   If length(Trim(dbeImporte.Text)) = 0 Then
      Raise exception.Create('Ingrese Importe')
   Else
   Begin
      dbeImporte.Text := Floattostr(strtoFloat(dbeImporte.Text));
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

{******************************************************************************}

Function TFPagoGlobal2.CalculaRet: double;
Var
   xTotAPagRet, xPorcAplica, xTotRetencion: double;
   xbAplica: boolean;
   xSQL, sRetNC: String;
   vRetencion: Real;
   vDetraccion: String;
   vProvRetiene: String;
Begin
   z2bbtnSumatClick(Self);
   Result := xRetLoc;
   exit;

End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnGrabaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   cReConta := 'N';
   If (DMTE.cdsRegCxP.RecordCount = 0) And (DMTE.cdsDocPago.RecordCount = 0) Then
   Begin
      ShowMessage('¡¡¡NO hay documentos que cancelar!!!');
      exit;
   End;

   If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString <> 'I' Then
   Begin
      ShowMessage('El estado actual de la Cancelación no permite Grabar');
      exit;
   End;

   xSQL := 'CIAID=' + quotedstr(dblcCia.text)
      + ' and TDIARID=' + quotedstr(dblcTDiario.text)
      + ' and ECNOCOMP<>' + quotedstr(dbeNoComp.Text)
      + ' and CCBCOID=' + quotedstr(dblcCCBco.Text)
      + ' and ECNOCHQ=' + quotedstr(dbeNoChq.text);
   DMTE.DisplayDescrip('prvTGE', 'CAJA302', 'ECNOCHQ,ECESTADO,ECELABO', xSQL, 'ECNOCHQ');
   If DMTE.cdsQry.FieldByName('ECNOCHQ').AsString <> '' Then
   Begin
      If DMTE.cdsQry.FieldByName('ECESTADO').AsString <> 'A' Then
      Begin
         showmessage('El número de Cheque ya fue Utilizado');
         exit;
      End
      Else
      Begin
         If DMTE.cdsQry.FieldByName('ECELABO').AsString = 'NULO' Then
         Begin
            showmessage('El número de Cheque ya fue Utilizado');
            exit;
         End
      End;
   End;

   DMTE.DCOM1.AppServer.IniciaTransaccion;

   xSQL := 'Select nvl(sum(1),0) REGISTROS '
      + '     from CAJA303 '
      + '    where CIAID=' + quotedstr(dblcCia.Text)
      + '      and ECANOMM=' + quotedstr(edtPeriodo.Text)
      + '      and TDIARID=' + quotedstr(dblcTDiario.Text)
      + '      and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;
   If DMTE.cdsQry.FieldByName('REGISTROS').AsInteger > 0 Then
   Begin
      xSQL := 'Delete from CAJA303 '
         + '    where CIAID=' + quotedstr(dblcCia.Text)
         + '      and ECANOMM=' + quotedstr(edtPeriodo.Text)
         + '      and TDIARID=' + quotedstr(dblcTDiario.Text)
         + '      and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al intentar eliminar el Detalle de Pagos por Docs.Provisionados');
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End;

   DMTE.cdsDocPago.First;
   While Not DMTE.cdsDocPago.Eof Do
   Begin
   // Actualiza Provisiones por Pagar
      xSQL := 'Update CXP301'
         + '      Set CPSALORI=0.00 '
         + '    where CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID2').AsString)
         + '      and CPANOMES=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPANOMM').AsString)
         + '      and TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID2').AsString)
         + '      and CPNOREG=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPNOREG').AsString);
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al intentar grabar el Saldo de la Provisión por Pagar');
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;

   // Detalle de Pago de Documentos Provisionados
      xSQL := 'Insert into CAJA303(CIAID, TDIARID, ECANOMM, ECNOCOMP, CIAID2, CPANOMM, '
         + '          TDIARID2, CPNOREG, DOCID2, CPSERIE, CPNODOC, TMONID, DETCDOC, '
         + '          DETCPAG, CPTOID, CUENTAID, CPFEMIS, CPFVCMTO, DEANO, DEMM, DEDD, '
         + '          DESS, DESEM, DETRI, DEAASS, DEAASEM, DEAATRI, PROV, PROVDES, PROVRUC, '
         + '          DESALLOC, DESALEXT, DEANTMN, DEANTME, DEMTOORI, DEMTOLOC, DEMTOEXT, '
// Inicio HPC_201703_CAJA
// Validación SEMT para proveedores con cobranza coactiva
         + '          DEUSER, DEFREG, DEHREG, VALPAGPRO, CLAUXID) '
// Final HPC_201703_CAJA
         + '   Values('
         + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID2').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('CPANOMM').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID2').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('CPNOREG').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('CPSERIE').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('CPNODOC').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('TMONID').AsString) + ','
         + floattostr(DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat) + ','
         + floattostr(DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('CPTOID').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('CUENTAID').AsString) + ','
         + quotedstr(datetostr(DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime)) + ','
         + quotedstr(datetostr(DMTE.cdsDocPago.FieldByName('CPFVCMTO').AsDateTime)) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('DEANO').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('DEMM').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('DEDD').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('DESS').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('DESEM').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('DETRI').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('DEAASS').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('DEAASEM').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('DEAATRI').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('PROVDES').AsString) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('PROVRUC').AsString) + ','
         + floattostr(DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat) + ','
         + floattostr(DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat) + ','
         + floattostr(DMTE.cdsDocPago.FieldByName('DEANTMN').AsFloat) + ','
         + floattostr(DMTE.cdsDocPago.FieldByName('DEANTME').AsFloat) + ','
         + floattostr(DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat) + ','
         + floattostr(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat) + ','
         + floattostr(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat) + ','
         + quotedstr(DMTE.cdsDocPago.FieldByName('DEUSER').AsString) + ','
         + '           trunc(sysdate), '
         + '           sysdate, '
// Inicio HPC_201703_CAJA
// Validación SEMT para proveedores con cobranza coactiva
         + quotedstr(DMTE.cdsDocPago.fieldbyname('VALPAGPRO').AsString) + ','
// Final HPC_201703_CAJA
         + quotedstr(DMTE.cdsDocPago.fieldbyname('CLAUXID').AsString) + ')';
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al intentar grabar el Detalle de pago de provisiones');
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
      DMTE.cdsDocPago.Next;
   End;

// Inicio HPC_201703_CAJA
// Validación SEMT para proveedores con cobranza coactiva
   DMTE.cdsMovCxP.First;
   While Not DMTE.cdsMovCxP.Eof Do
   Begin
      // Actualiza Provisiones por Pagar
      xSQL := 'Update CXP301'
         + '      Set CPSALORI='+ quotedstr(DMTE.cdsMovCxP.FieldByName('CPMTOORI').Value)+','
         + '      CPSALLOC='+ quotedstr(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').Value)+','
         + '      CPSALEXT='+ quotedstr(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').Value)
         + '    where CIAID=' + quotedstr(DMTE.cdsMovCxP.FieldByName('CIAID').Value)
         + '      and CPANOMES=' + quotedstr(DMTE.cdsMovCxP.FieldByName('CPANOMES').Value)
         + '      and TDIARID=' + quotedstr(DMTE.cdsMovCxP.FieldByName('TDIARID').Value)
         + '      and CPNOREG=' + quotedstr(DMTE.cdsMovCxP.FieldByName('CPNOREG').Value);
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al intentar actualizar el Saldo de la Provisión por Pagar');
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
      DMTE.cdsMovCxP.Next;
   End;
// Final HPC_201703_CAJA
   xSQL := 'Select nvl(sum(1),0) REGISTROS '
      + '     from CAJA301 '
      + '    where CIAID=' + quotedstr(dblcCia.Text)
      + '      and ECANOMM=' + quotedstr(edtPeriodo.Text)
      + '      and TDIARID=' + quotedstr(dblcTDiario.Text)
      + '      and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;
   If DMTE.cdsQry.FieldByName('REGISTROS').AsInteger > 0 Then
   Begin
      xSQL := 'Delete from CAJA301 '
         + '    where CIAID=' + quotedstr(dblcCia.Text)
         + '      and ECANOMM=' + quotedstr(edtPeriodo.Text)
         + '      and TDIARID=' + quotedstr(dblcTDiario.Text)
         + '      and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al intentar eliminar el Detalle de Pagos por Docs.Provisionados');
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End;

   DMTE.cdsRegCxP.First;
   While Not DMTE.cdsRegCxP.EOF Do
   Begin
      xSQL := 'Insert into CAJA301(CIAID, TDIARID, ECANOMM, ECNOCOMP, TDIARID2, CPANOMM, CPNOREG, DOCID2, CPSERIE, CPNODOC, TMONID, '
         + '                       DEFCOMP, DETCDOC, DETCPAG, DEDH, DEMTOORI, DEMTOLOC, DEMTOEXT, CPTOID, CUENTAID, CCOSID, '
         + '                       CPFEMIS, CPFVCMTO, DEHREG, PROV, CLAUXID, DOCMOD, DEGLOSA, '
         + '                       DEANO, DEMM, DEDD, DESS, DESEM, DETRI, DEAASS, DEAASEM, DEAATRI) '
         + '   Values('
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('CIAID').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('TDIARID').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('ECANOMM').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('TDIARID').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('CPANOMM').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('CPNOREG').AsString) + ', '
//         +             quotedstr(dbeNoReg.Text)+ ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('DOCID2').AsString)+', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString)+', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString)+', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('TMONID').AsString)+', '
         +             quotedstr(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime)) + ', '
         +             floattostr(DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat) + ', '
         +             floattostr(DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('DEDH').AsString) + ', '
         +             floattostr(DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat) + ', ';
      if DMTE.cdsRegCxP.FieldByName('TMONID').AsString='N' then
         xSQL := xSQL
         +             floattostr(DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat) + ', '
         +             floattostr(DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat/DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat) + ', '
      else
         xSQL := xSQL
         +             floattostr(DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat*DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat) + ', '
         +             floattostr(DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat) + ', ';
      xSQL := xSQL
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('CPTOID').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('CCOSID').AsString) + ', '
         +             quotedstr(datetostr(DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime)) + ', '
         +             quotedstr(datetostr(DMTE.cdsRegCxP.FieldByName('CPFVCMTO').AsDateTime)) + ', '
         + '           sysdate, '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('PROV').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('DOCMOD').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString) + ', '
//         +             quotedstr(edtCnp2.Text)+', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('DEANO').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('DEMM').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('DEDD').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('DESS').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('DESEM').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('DETRI').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('DEAASS').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('DEAASEM').AsString) + ', '
         +             quotedstr(DMTE.cdsRegCxP.FieldByName('DEAATRI').AsString) + ') ';
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al intentar grabar el Detalle de pagos No provisionados');
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
      DMTE.cdsRegCxP.Next;
   End;

   xRetLoc := CalculaRet;
   xSigueGrab := True;
   ActSaldosMovCxP;

   If Not xSigueGrab Then
   Begin
      DMTE.DCOM1.AppServer.RetornaTransaccion;
      Exit;
   End;

   DMTE.cdsEgrCaja.edit;
   DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat := xMtoLoc;
   DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat := xMtoExt;
   If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
      DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat := xMtoLoc
   Else
      DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat := xMtoExt;
   dbeImporte.text := FloatToStr(DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat);

   DMTE.cdsEgrCaja.FieldByName('ECUSER').Value := DMTE.wUsuario; // usuario que registra
   DMTE.cdsEgrCaja.FieldByName('ECFREG').Value := DateS; // fecha que registra Usuario
   DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time; // Hora de Registro de Usuario
   DMTE.cdsEgrCaja.Post;

   xSQL := 'update CAJA302 '
      + '      set ECMTOLOC=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat) + ','
      + '          ECMTOEXT=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat) + ','
      + '          ECSALMN=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECSALMN').AsFloat) + ','
      + '          ECSALME=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECSALME').AsFloat) + ','
      + '          TMONID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TMONID').AsString) + ','
      + '          ECMTOORI=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat) + ','
      + '          ECUSER=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString) + ','
      + '          ECFREG=trunc(sysdate), '
      + '          ECHREG=SYSDATE '
      + '    Where CIAID=' + quotedstr(dblcCia.Text)
      + '      and ECANOMM=' + quotedstr(edtPeriodo.Text)
      + '      and TDIARID=' + quotedstr(dblcTDiario.Text)
      + '      and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al intentar grabar la cabecera del Egreso');
      DMTE.DCOM1.AppServer.RetornaTransaccion;
      Exit;
   End;

   DMTE.DCOM1.AppServer.GrabaTransaccion;

   xSQL := 'Select CIAID, CUENTAID, CTADES, CTAABR, CTANIV, CTA_DET, CTA_AUT1, CTAAUT1, '
      + '          CTA_AUT2, CTAAUT2, CTA_CIER, CTA_PLAZ, CTA_MOV, CTA_AUX, CTA_DOC, '
      + '          CTA_CCOS, CTA_ME, CTA_DEST, FLGVAR, CTA_DIFC, CTACONTRA, CTA_SECU, '
      + '          CTA_AJUSTEREI, CTAMODDIFC, CTA_DIFGP, CTA_TIPO, TIPCTAID, USUARIO, '
      + '          HREG, FREG, CTA_APERT, CTA_TIPOREI, CTA_NOMONET, CTA_SALAJREI, '
      + '          CTA_CONSOL, CTA_PRES, CTA_SUMGA, REGSOLOME, CTA_TRANSAPE, CTAACT '
      + '     from TGE202 '
      + '    where CIAID=' + quotedstr(dblccia.Text)
      + '      and CUENTAID=' + quotedstr(edtCuenta.text);
   DMTE.cdsQry2.Close;
   DMTE.cdsQry2.DataRequest(xSQL);
   DMTE.cdsQry2.open;

   If dblcClase.Enabled Then
   Begin
      dblcClase.Enabled := False;
      dblcdAux.Enabled := False;
   End;

   z2bbtnCancelado.Enabled := True;
   z2bbtnAnula.Enabled := True;
   z2bbtnImprime.Enabled := True;
   wModifica := False;

   If DMTE.cdsDocPago.RecordCount > 0 Then
   Begin
      xSQL := 'Select B.DTRPORC '
         + '     from CAJA303 A, CXP301 B '
         + '    Where A.CIAID=''' + dblcCia.Text + ''' '
         + '      and A.ECANOMM=''' + edtPeriodo.Text + ''' '
         + '      and A.TDIARID=''' + dblcTDiario.Text + ''' '
         + '      and A.ECNOCOMP=''' + dbeNoComp.Text + ''' '
         + '      and a.CIAID2=B.CIAID(+) AND A.CPANOMM=B.CPANOMES AND TDIARID2=B.TDIARID '
         + '      AND A.CPNOREG=B.CPNOREG(+) AND NVL(B.DTRPORC,0)>0';
      DMTE.cdsQry3.Close;
      DMTE.cdsQry3.DataRequest(xSQL);
      DMTE.cdsQry3.Open;
      lblDTR.Visible := False;
   // variable que decide si se aplica DETRACCION y por lo tanto se anula la RETENCION
      xDTRPorc := DMTE.cdsQry3.FieldByName('DTRPORC').AsFloat;
      If xDTRPorc > 0 Then
      Begin
         lblSujetoRetencion.Visible := False;
         lblDTR.Caption := lblDTR.Caption
            + '  No. ' + DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString;
         If DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString <> '' Then
            lblDTR.Visible := True;
      End;
   End;

   If xDTRPorc > 0 Then // presenta panel solo si se aplica DETRACCION y es Adicion
   Begin
      If sFlagAbono = 'N' Then
         xSQL := 'Select BANCOID, CCBCOID, CCBCODES, CTAPRINC, CTAREMES, TMONID, CCFMTCHQ, '
            + '          CORRELATIVO, LONGITUD, CTADIFG, CTADIFP, CPTODIFG, CPTODIFP, '
            + '          CCBCOABR, CPTOID, CCBCOVOUCH, CIAID, CCOSDIF, COBCONS, CHQVOUCH, '
            + '          CCBVOUING, RELBAN, GENOFI, ACTIVO, CTAOPEXLIQ, DESCUEBAN, CUEEMICHE, '
            + '          CUEEXT, TDIARID_BAN, CTACOBR, MONBASE '
            + '     from TGE106 '
            + '    where BANCOID=' + quotedstr(DMTE.cdsbancoegr.FieldByName('BANCOID').AsString)
            + '      and TMONID=' + quotedstr(DMTE.wTMonLoc)
            + '      and CIAID=' + quotedstr(dblcCia.text)
            + '      and ACTIVO=''S'' '
            + '      and CUEEMICHE=''S'''
      Else
         xSQL := 'Select BANCOID, CCBCOID, CCBCODES, CTAPRINC, CTAREMES, TMONID, CCFMTCHQ, '
            + '          CORRELATIVO, LONGITUD, CTADIFG, CTADIFP, CPTODIFG, CPTODIFP, '
            + '          CCBCOABR, CPTOID, CCBCOVOUCH, CIAID, CCOSDIF, COBCONS, CHQVOUCH, '
            + '          CCBVOUING, RELBAN, GENOFI, ACTIVO, CTAOPEXLIQ, DESCUEBAN, CUEEMICHE, '
            + '          CUEEXT, TDIARID_BAN, CTACOBR, MONBASE '
            + '     from TGE106 '
            + '    where CIAID=' + quotedstr(dblcCia.text)
            + '      and TMONID=' + quotedstr(DMTE.wTMonLoc)
            + '      and ACTIVO=''S'' '
            + '      and CUEEMICHE=''C''';
      DMTE.cdsSQL.Close;
      DMTE.cdsSQL.DataRequest(xSQL);
      DMTE.cdsSQL.open;
      dblcCCBcoDTR.LookupTable := DMTE.cdsSQL;
      dblcCCBcoDTR.LookupField := 'CCBCOID';

   // activa PANEL para ingresar Cheque por ser el registro de la DETRACCION
      If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonExt Then // solo por ser Moneda Extranjera
      Begin
      // Activa Cuenta Corriente por exigirse moneda nacional para el deposito de la DETRACCION
         lblCCBcoDTR.Visible := True;
         dblcCCBcoDTR.Visible := True;
      End;

      If sFlagAbono = 'S' Then
      Begin
         lblCCBcoDTR.Visible := True;
         dblcCCBcoDTR.Visible := True;
         dblcCCBcoDTR.Text := DMTE.cdsSQL.FieldbyName('CCBCOID').AsString;
         dbeOrigen.Text := DMTE.cdsSQL.FieldbyName('CCBCOVOUCH').AsString;
         dblcCCBcoDTRExit(self);
         dbeNoChqDTR.ReadOnly := True;
      End;

      pnlDetraccion.Visible := True;
   End
   Else
   Begin
      ShowMessage('Grabación OK');
      lblCCBcoDTR.Visible := False;
      dblcCCBcoDTR.Visible := False;
      dbgDocPago.ReadOnly := True;
      DMTE.cdsDocPago.EnableControls;
   End;

   // Inicio HPC_201704_CAJA
   // Se comento lo anterior

   // Inicio HPC_201703_CAJA
   // Validación SEMT para proveedores con cobranza coactiva
   //DMTE.cdsDocPago.Filter := '';
   //DMTE.cdsDocPago.Filter := 'DEMTOLOC > 3500';
   //DMTE.cdsDocPago.Filtered := true;
   //If DMTE.cdsDocPago.Recordcount > 0 Then
   //begin
   //   If Not sdGraba.Execute Then
   //   begin
   //     DMTE.cdsDocPago.Filtered := false;
   //     Exit;
   //   end;
   //   ValidacionSEMT(DMTE.dsDocPago, sdGraba.FileName, ',');
   //end;
   //DMTE.cdsDocPago.Filtered := false;
   // Final HPC_201703_CAJA
// Inicio HPC_201803_CAJA
// Se adiciona el refresco de ActivaFiltro('DOCPAGO')
      ActivaFiltro('DOCPAGO');
// Fin HPC_201803_CAJA

   // Ahora se usa nueva rutina para obtener la data para la validacion
   ValidacionSEMT_CargaData;
// Inicio HPC_201801_CAJA
// Se cambia los Cds debido a que genera conflicto
   If DMTE.cdsQry8.Recordcount > 0 Then
   begin
      If Not sdGraba.Execute Then
      begin
        Exit;
      end;
      ValidacionSEMT(DMTE.dsQry8, sdGraba.FileName, ',');
   end;
// Fin HPC_201801_CAJA   
   // Fin HPC_201704_CAJA
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Detraccion;
Var
   xSQL: String;
   wDETCPAG, wDETCDOC, wECTCAMB, xOtroLoc, xOtroExt, xFactorD: Double;
   wECNOCOMP, wTMONID, wCIAID, wTDIARID, wTDIARID2, wECANOMM, wCPANOMM, wPROV,
      wPROVRUC, wCPNOREG, wDOCID2, wCPSERIE, wCPNODOC, wCPTOID, wCUENTAID, wCPFEMIS, wCPFVCMTO,
      wDEUSER, wDEFREG, wDEHREG, wPROVDES, wCLAUXID, wECFCOMP, wFPAGOID, wECGLOSA, wECLOTE, wECESTADO,
      wECUSER, wECFREG, wECHREG, wEC_PROCE, wEC_IE, WECFEMICH, WECNOCHQ, WECGIRA, WCIAID2,
      WCCBCOVOUCH, WECANO, WECMM, WECDD, WECSS, WECSEM, WECTRI, WECAASS, WECAASEM, WECAATRI: String;
   xRegAct: TBookMark;
   wNewVoucher, xResta, xWhere: String;

   wDEMTOEXT, wDESALEXT, wDEMTOLOC, wDESALLOC: Currency;
Begin
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
   DMTE.cdsRegCxP.First;
   While Not DMTE.cdsRegCxP.Eof Do
   Begin
      If DMTE.cdsRegCxP.FieldByName('DEDH').Value = 'D' Then
      Begin
         xOtroLoc := xOtroLoc + DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
         xOtroExt := xOtroExt + DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
      End
      Else
      Begin
         xOtroLoc := xOtroLoc - DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
         xOtroExt := xOtroExt - DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
      End;
      DMTE.cdsRegCxP.Next;
   End;
   DMTE.cdsRegCxP.GotoBookmark(xRegAct);
   DMTE.cdsRegCxP.FreeBookmark(xRegAct);
   DMTE.cdsRegCxP.EnableControls;
// Inicio CAJA-201804
// Se ajusta para realizar Pago de Detracción
   /// CAJA303
   /// ACCESA AL CXP302 PARA TOMAR LOS DATOS DEL TIPDET='TO' - TOTAL SI DETRACCION
   xSQL := 'Select A.CIAID2, A.TDIARID2, A.CPANOMM, B.CIAID, B.TDIARID, B.CPNOREG, B.DCPANOC, '
      + '          B.DCPANOMM, B.DCPLOTE, B.DCPCOMP, B.TRANSID, B.CPTOID, B.CUENTAID, '
      + '          B.CLAUXID, B.DCPAUXID, B.DOCID, B.CPSERIE, B.CPNODOC, B.DCPGLOSA, '
      + '          B.DCPDH, B.CCOSID, CPTCAMPR, CPTCAMPA, '
      + '          CASE WHEN G.CPNOREG IS NULL THEN B.DCPMOORI ELSE (B.DCPMOORI - G.DCPMOORI) END DCPMOORI, '
      + '          CASE WHEN G.CPNOREG IS NULL THEN B.DCPMOLOC ELSE (B.DCPMOLOC - G.DCPMOLOC) END DCPMOLOC, '
      + '          CASE WHEN G.CPNOREG IS NULL THEN B.DCPMOEXT ELSE (B.DCPMOEXT - G.DCPMOEXT) END DCPMOEXT, '
      + '          B.CPFEMIS, B.CPFVCMTO, B.DCPFCOM, B.DCPESTDO, B.DCPFLCDR, B.DCPFLAUT, '
      + '          B.DCPUSER, B.DCPFREG, B.DCPHREG, B.DCPMM, B.DCPDD, B.DCPTRI, B.DCPSEM, '
      + '          B.DCPSS, B.DCPAATRI, B.DCPAASEM, B.DCPAASS, B.TREGID, B.TMONID, B.FLAGVAR, '
      + '          B.TIPDET, B.TCANJEID, B.CANJE, B.PARPRESID, B.CPPRORORI, B.CPPRORMOLOC, '
      + '          B.CPPRORMOEXT, TIPPRESID, DCPREG, CXPRRHH, B.PROVRUC '
// Inicio HPC_201803_CAJA
// Se adiciona nuevas columnas
      + '          , A.DETCPAG, A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, A.DESALLOC, A.DESALEXT '
      + '          , G.CPNOREG, G.DOCID, G.CPSERIE, G.CPNODOC, G.TDIARID, G.CPANOMES, G.CIAID, G.DCPDH, G.CPTCAMPR, G.CPTCAMPA, G.DCPMOORI, G.DCPMOLOC, G.DCPMOEXT '
// Fin HPC_201803_CAJA
      + '     from CAJA303 A, CXP302 B, CXP301 C, CXP305 F, '
      + ' (SELECT X.CIAID, X.CPANOMES, X.TDIARID, X.CPNOREG, X.CLAUXID, X.PROV, X.TCANJEID, X.CPCANJE, Z.CUENTAID, Z.DCPDH, Z.DOCID, Z.CPSERIE, Z.CPNODOC, Z.CPTCAMPR, Z.CPTCAMPA, Z.DCPMOORI, Z.DCPMOLOC, Z.DCPMOEXT '
      + ' FROM CXP301 X,CXP302 Z WHERE X.CIAID=Z.CIAID and X.TDIARID=Z.TDIARID and X.CPANOMES=Z.DCPANOMM and X.CPNOREG=Z.CPNOREG AND Z.TIPDET=''TO'') G '
      + '    where A.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
      + '      and A.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
      + '      and A.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
      + '      and A.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
      + '      and A.CIAID2=B.CIAID(+) '
      + '      and A.CPANOMM=B.DCPANOMM '
      + '      and TDIARID2=B.TDIARID '
      + '      and A.CPNOREG=B.CPNOREG(+) '
      + '      and B.CLAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString)
      + '      and B.DCPAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString)
      + '      and B.TIPDET=' + quotedstr('TO')
      + '      and B.CIAID=C.CIAID AND B.TDIARID=C.TDIARID AND B.DCPANOMM=C.CPANOMES AND B.CPNOREG=C.CPNOREG '
      + '      AND C.CIAID = F.CIAID(+) AND C.CLAUXID = F.CLAUXID(+) AND C.PROV= F.PROV(+) AND C.DOCID = F.DOCID(+) AND C.CPSERIE = F.CPSERIE(+) AND C.CPNODOC = F.CPNODOC(+) '
      + '      AND F.CIAID = G.CIAID(+) AND F.CLAUXID = G.CLAUXID(+) AND F.PROV = G.PROV(+) AND F.TCANJEID = G.TCANJEID(+) AND F.CCPCANJE = G.CPCANJE(+) ';
   DMTE.cdsQry6.Close;
   DMTE.cdsQry6.DataRequest(xSQL);
   DMTE.cdsQry6.open;
// Fin CAJA-201804
   While Not DMTE.cdsQry6.Eof Do
   Begin
      If DMTE.cdsDocPago.Locate('CIAID2;TDIARID2;CPANOMM;CPNOREG',
         VarArrayOf([DMTE.cdsQry6.FieldByName('CIAID2').AsString,
         DMTE.cdsQry6.FieldByName('TDIARID2').AsString,
            DMTE.cdsQry6.FieldByName('CPANOMM').AsString,
            DMTE.cdsQry6.FieldByName('CPNOREG').AsString]), []) Then
      Begin
         xWhere := 'Select DOCRESTA '
            + '       from TGE110 '
            + '      where DOCID=' + quotedstr(DMTE.cdsQry6.FieldByName('DOCID').AsString)
            + '        and DOCMOD=''CXP'' ';
         DMTE.cdsQry2.Close;
         DMTE.cdsQry2.DataRequest(xWhere);
         DMTE.cdsQry2.open;
         xResta := DMTE.cdsQry2.fIELDbYNAME('DOCRESTA').Asstring;
         xFactorD := 1;
         If xResta = 'S' Then xFactorD := -1;

         DMTE.cdsDocPago.Edit;
         DMTE.cdsDocPago.FieldByName('TIPDET').AsString := 'TO';
         DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString := DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString;
// Inicio HPC_201803_CAJA
// se cambia el campo DCPMOORI por
//       DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat := DMTE.cdsQry6.FieldByName('DCPMOORI').AsFloat * xFactorD;
         DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat := DMTE.cdsQry6.FieldByName('DEMTOORI').AsFloat * xFactorD;
// Fin HPC_201803_CAJA
         If DMTE.cdsDocPago.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
         Begin
            DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat := DMTE.cdsDocPago.fieldbyname('DEMTOORI').AsFloat;
            DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat := DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat;
            DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat := DMTE.FRound(
               DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat /
               DMTE.cdsDocPago.fieldbyname('DETCPAG').AsFloat, 15, 2);
            DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat := DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat;
         End
         Else
         Begin
            If DMTE.cdsDocPago.FieldByName('TMONID').AsString = DMTE.wTMonExt Then
            Begin
               DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat := DMTE.cdsDocPago.fieldbyname('DEMTOORI').AsFloat;
               DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat := DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat;
               DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat := DMTE.FRound(
                  DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat *
                  DMTE.cdsDocPago.fieldbyname('DETCPAG').AsFloat, 15, 2);
               DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat := DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat;
            End;
         End;
         DMTE.cdsDocPago.Post;
         xSQL := 'Update CAJA303 '
            +    '   Set TIPDET='+quotedstr(DMTE.cdsDocPago.FieldByName('TIPDET').AsString)+','
            +    '       ECNOCOMPR='+quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString)+','
            +    '       DEMTOORI='+floattostr(DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat)+','
            +    '       DEMTOLOC='+floattostr(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat)+','
            +    '       DEMTOEXT='+floattostr(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat)+','
            +    '       DESALLOC='+floattostr(DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat)+','
            +    '       DESALEXT='+floattostr(DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat)+' '
            +    ' Where CIAID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
            +    '   and TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
            +    '   and ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
            +    '   and ECNOCOMP='+ quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
            +    '   and CIAID2='  + quotedstr(DMTE.cdsQry6.FieldByName('CIAID2').AsString)
            +    '   and TDIARID2='+ quotedstr(DMTE.cdsQry6.FieldByName('TDIARID2').AsString)
            +    '   and CPANOMM=' + quotedstr(DMTE.cdsQry6.FieldByName('CPANOMM').AsString)
            +    '   and CPNOREG=' + quotedstr(DMTE.cdsQry6.FieldByName('CPNOREG').AsString);
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error al intentar disminuir monto de las Detracciones a las Cuentas por Pagar');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            Exit;
         End;
      End;
      DMTE.cdsQry6.Next;
   End;

   xSQL := 'CIAID=' + quotedstr(dblcCia.Text)
      + ' and ECANOMM=' + quotedstr(edtPeriodo.Text)
      + ' and TDIARID=' + quotedstr(dbeOrigen.Text);

   wNewVoucher := DMTE.UltimoNum('prvCaja', 'CAJA302', 'ECNOCOMP', xSQL);
   wNewVoucher := DMTE.StrZero(wNewVoucher, DMTE.cdsDocPago.FieldByName('ECNOCOMP').Size);
// Inicio CAJA-201804
// Se ajusta para realizar Pago de Detracción
// ACCESA AL CXP302 PARA TOMAR LOS DATOS DEL TIPDET='I4' - DETRACCION
   xSQL := 'Select A.CIAID2, A.TDIARID2, A.CPANOMM, '
      + '          B.CIAID, B.TDIARID, B.CPNOREG, B.DCPANOC, B.DCPANOMM, B.DCPLOTE, '
      + '          B.DCPCOMP, B.TRANSID, B.CPTOID, B.CUENTAID, B.CLAUXID, B.DCPAUXID, '
      + '          B.DOCID, B.CPSERIE, B.CPNODOC, B.DCPGLOSA, B.DCPDH, B.CCOSID, '
      + '          B.CPTCAMPR, B.CPTCAMPA, '
      + '          CASE WHEN G.CPNOREG IS NULL THEN B.DCPMOORI ELSE (B.DCPMOORI - G.DCPMOORI) END DCPMOORI, '
      + '          CASE WHEN G.CPNOREG IS NULL THEN B.DCPMOLOC ELSE (B.DCPMOLOC - G.DCPMOLOC) END DCPMOLOC, '
      + '          CASE WHEN G.CPNOREG IS NULL THEN B.DCPMOEXT ELSE (B.DCPMOEXT - G.DCPMOEXT) END DCPMOEXT, '
      + '          B.CPFEMIS, B.CPFVCMTO, B.DCPFCOM, B.DCPESTDO, B.DCPFLCDR, '
      + '          B.DCPFLAUT, B.DCPUSER, B.DCPFREG, B.DCPHREG, B.DCPMM, B.DCPDD, '
      + '          B.DCPTRI, B.DCPSEM, B.DCPSS, B.DCPAATRI, B.DCPAASEM, B.DCPAASS, '
      + '          B.TREGID, B.TMONID, B.FLAGVAR, B.TIPDET, B.TCANJEID, B.CANJE, '
      + '          B.PARPRESID, B.CPPRORORI, B.CPPRORMOLOC, B.CPPRORMOEXT, B.TIPPRESID, '
      + '          B.DCPREG, B.CXPRRHH, B.PROVRUC '
// Inicio HPC_201803_CAJA
// Se adiciona nuevas columnas
      + '          , A.DETCPAG, A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, A.DESALLOC, A.DESALEXT '
// Fin HPC_201803_CAJA
      + '     from CAJA303 A, CXP302 B, CXP301 C, CXP305 F, '
      + '          (SELECT X.CIAID, X.CPANOMES, X.TDIARID, X.CPNOREG, X.CLAUXID, X.PROV, X.TCANJEID, X.CPCANJE, Z.CUENTAID, Z.DCPDH, Z.DOCID, Z.CPSERIE, Z.CPNODOC, Z.CPTCAMPR, Z.CPTCAMPA, Z.DCPMOORI, Z.DCPMOLOC, Z.DCPMOEXT '
      + '           FROM CXP301 X,CXP302 Z WHERE X.CIAID=Z.CIAID and X.TDIARID=Z.TDIARID and X.CPANOMES=Z.DCPANOMM and X.CPNOREG=Z.CPNOREG AND Z.TIPDET=''I4'') G '
      + '    where A.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
      + '      and A.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
      + '      and A.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
      + '      and A.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
      + '      and A.CIAID2=B.CIAID(+) '
      + '      and A.CPANOMM=B.DCPANOMM '
      + '      and TDIARID2=B.TDIARID '
      + '      and A.CPNOREG=B.CPNOREG(+) '
      + '      and B.CLAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString)
      + '      and B.DCPAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString)
      + '      and B.TIPDET=' + quotedstr('I4')
      + '      and B.CIAID=C.CIAID AND B.TDIARID=C.TDIARID AND B.DCPANOMM=C.CPANOMES AND B.CPNOREG=C.CPNOREG '
      + '      AND C.CIAID = F.CIAID(+) AND C.CLAUXID = F.CLAUXID(+) AND C.PROV= F.PROV(+) AND C.DOCID = F.DOCID(+) AND C.CPSERIE = F.CPSERIE(+) AND C.CPNODOC = F.CPNODOC(+) '
      + '      AND F.CIAID = G.CIAID(+) AND F.CLAUXID = G.CLAUXID(+) AND F.PROV = G.PROV(+) AND F.TCANJEID = G.TCANJEID(+) AND F.CCPCANJE = G.CPCANJE(+) ';
   DMTE.cdsQry6.Close;
   DMTE.cdsQry6.DataRequest(xSQL);
   DMTE.cdsQry6.open;
// Fin CAJA-201804
   xSQL := 'Select nvl(sum(1),0) REGISTROS '
      + '     from CAJA303 '
      + '    where CIAID=' + quotedstr(wCIAID)
      + '      and ECANOMM=' + quotedstr(wECANOMM)
      + '      and TDIARID=' + quotedstr(dbeOrigen.Text)
      + '      and ECNOCOMP=' + quotedstr(wNewVoucher);
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;
   If DMTE.cdsQry.FieldByName('REGISTROS').AsInteger > 0 Then
   Begin
      xSQL := 'Delete from CAJA303 '
         + '    where CIAID=' + quotedstr(wCIAID)
         + '      and ECANOMM=' + quotedstr(wECANOMM)
         + '      and TDIARID=' + quotedstr(dbeOrigen.Text)
         + '      and ECNOCOMP=' + quotedstr(wNewVoucher);
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al intentar eliminar el Detalle de Detracciones');
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End;

   While Not DMTE.cdsQry6.Eof Do
   Begin
      If DMTE.cdsDocPago.Locate('CIAID2;TDIARID2;CPANOMM;CPNOREG',
         VarArrayOf([DMTE.cdsQry6.FieldByName('CIAID2').AsString,
         DMTE.cdsQry6.FieldByName('TDIARID2').AsString,
            DMTE.cdsQry6.FieldByName('CPANOMM').AsString,
            DMTE.cdsQry6.FieldByName('CPNOREG').AsString]), []) Then
      Begin
         wECNOCOMP := DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString;
         wTMONID := 'N';
 //        wDETCPAG := DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat;
         wCIAID := DMTE.cdsDocPago.fieldbyname('CIAID').AsString;
         wTDIARID := DMTE.cdsDocPago.fieldbyname('TDIARID').AsString;
         wECANOMM := DMTE.cdsDocPago.fieldbyname('ECANOMM').AsString;
         wTDIARID2 := DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString;
         wCPANOMM := DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString;
         wPROV := DMTE.cdsDocPago.fieldbyname('PROV').AsString;
         wPROVRUC := DMTE.cdsDocPago.fieldbyname('PROVRUC').AsString;
         wCPNOREG := DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString;
         wDOCID2 := DMTE.cdsDocPago.fieldbyname('DOCID2').AsString;
         wCPSERIE := DMTE.cdsDocPago.fieldbyname('CPSERIE').AsString;
         wCPNODOC := DMTE.cdsDocPago.fieldbyname('CPNODOC').AsString;
         wDETCDOC := DMTE.cdsDocPago.fieldbyname('DETCDOC').AsFloat;
         wDETCPAG := DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat;
         wCPTOID := DMTE.cdsDocPago.FieldByName('CPTOID').AsString;
         wCUENTAID := DMTE.cdsDocPago.FieldByName('CUENTAID').AsString;
         wCPFEMIS := DMTE.cdsDocPago.fieldbyname('CPFEMIS').AsString;
         wCPFVCMTO := DMTE.cdsDocPago.fieldbyname('CPFVCMTO').AsString;
         wDEUSER := DMTE.cdsDocPago.fieldbyname('DEUSER').AsString;
         wDEFREG := DMTE.cdsDocPago.fieldbyname('DEFREG').AsString;
         wDEHREG := DMTE.cdsDocPago.fieldbyname('DEHREG').AsString;
         wPROVDES := DMTE.cdsDocPago.fieldbyname('PROVDES').AsString;
         wCLAUXID := DMTE.cdsDocPago.fieldbyname('CLAUXID').AsString;
         wCIAID2 := DMTE.cdsDocPago.fieldbyname('CIAID2').AsString;

         xWhere := 'Select DOCRESTA '
            + '       from TGE110 '
            + '      where DOCID=' + quotedstr(DMTE.cdsQry6.FieldByName('DOCID').AsString)
            + '        and DOCMOD=''CXP'' ';
         DMTE.cdsQry2.Close;
         DMTE.cdsQry2.DataRequest(xWhere);
         DMTE.cdsQry2.open;
         xResta := DMTE.cdsQry2.FieldByName('DOCRESTA').Asstring;
         xFactorD := 1;
         If xResta = 'S' Then xFactorD := -1;

         If DMTE.cdsQry6.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
         Begin
            wDEMTOLOC := DMTE.cdsQry6.fieldbyname('DCPMOORI').AsFloat;
            wDESALLOC := DMTE.cdsQry6.fieldbyname('DCPMOLOC').AsFloat;
            wDEMTOEXT := DMTE.FRound(
               DMTE.cdsQry6.FieldByName('DCPMOORI').AsFloat /
               DMTE.cdsDocPago.fieldbyname('DETCPAG').AsFloat, 15, 2);
            wDESALEXT := DMTE.cdsQry6.fieldbyname('DCPMOEXT').AsFloat;
         End
         Else
         Begin
            If DMTE.cdsQry6.FieldByName('TMONID').AsString = DMTE.wTMonExt Then
            Begin
               wDEMTOEXT := DMTE.cdsQry6.fieldbyname('DCPMOORI').AsFloat;
               wDESALEXT := DMTE.cdsQry6.fieldbyname('DCPMOEXT').AsFloat;
               wDEMTOLOC := DMTE.FRound(
                  DMTE.cdsQry6.FieldByName('DCPMOORI').AsFloat *
                  DMTE.cdsDocPago.fieldbyname('DETCPAG').AsFloat, 15, 2);
               wDESALLOC := DMTE.cdsQry6.fieldbyname('DCPMOLOC').AsFloat;
            End;
         End;

         wDEMTOLOC := wDEMTOLOC * xFactorD;
         wDESALLOC := wDESALLOC * xFactorD;
         wDEMTOEXT := wDEMTOEXT * xFactorD;
         wDESALEXT := wDESALEXT * xFactorD;

         DMTE.cdsDocPago.Append;
         DMTE.cdsDocPago.FieldByName('TIPDET').AsString := 'I4';
         DMTE.cdsDocPago.FieldByName('CIAID').AsString := wCIAID;
         DMTE.cdsDocPago.FieldByName('TDIARID').AsString := dbeOrigen.Text;
         DMTE.cdsDocPago.FieldByName('ECANOMM').AsString := wECANOMM;
         DMTE.cdsDocPago.FieldByName('TDIARID2').AsString := wTDIARID2;
         DMTE.cdsDocPago.FieldByName('CPANOMM').AsString := wCPANOMM;
         DMTE.cdsDocPago.FieldByName('PROV').AsString := wPROV;
         DMTE.cdsDocPago.FieldByName('PROVRUC').AsString := wPROVRUC;
         DMTE.cdsDocPago.FieldByName('CPNOREG').AsString := wCPNOREG;
         DMTE.cdsDocPago.FieldByName('DOCID2').AsString := wDOCID2;
         DMTE.cdsDocPago.FieldByName('CPSERIE').AsString := wCPSERIE;
         DMTE.cdsDocPago.FieldByName('CPNODOC').AsString := wCPNODOC;
         DMTE.cdsDocPago.FieldByName('TMONID').AsString := wTMONID;
         DMTE.cdsDocPago.fieldbyname('DETCDOC').AsFloat := wDETCDOC;
         DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat := wDETCPAG;      // se ha cambiado
         DMTE.cdsDocPago.FieldByName('CPTOID').AsString := DMTE.cdsQry6.FieldByName('CPTOID').AsString;
         DMTE.cdsDocPago.FieldByName('CUENTAID').AsString := DMTE.cdsQry6.FieldByName('CUENTAID').AsString;
         DMTE.cdsDocPago.fieldbyname('CPFEMIS').AsString := wCPFEMIS;
         DMTE.cdsDocPago.fieldbyname('CPFVCMTO').AsString := wCPFVCMTO;
         DMTE.cdsDocPago.fieldbyname('DEUSER').AsString := wDEUSER;
         DMTE.cdsDocPago.fieldbyname('DEFREG').AsString := wDEFREG;
         DMTE.cdsDocPago.fieldbyname('DEHREG').AsString := wDEHREG;
         DMTE.cdsDocPago.fieldbyname('PROVDES').AsString := wPROVDES;
         DMTE.cdsDocPago.fieldbyname('CLAUXID').AsString := wCLAUXID;
         DMTE.cdsDocPago.fieldbyname('CIAID2').AsString := wCIAID2;

         DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat := DMTE.cdsQry6.FieldByName('DCPMOORI').AsFloat * xFactorD;

         If DMTE.cdsQry6.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
         Begin
            DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat := DMTE.cdsDocPago.fieldbyname('DEMTOORI').AsFloat;
            DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat := DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat;
            DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat := DMTE.FRound(
               DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat /
               DMTE.cdsDocPago.fieldbyname('DETCPAG').AsFloat, 15, 2);
            DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat := DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat;
         End
         Else
         Begin
            If DMTE.cdsQry6.FieldByName('TMONID').AsString = DMTE.wTMonExt Then
            Begin
               DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat := DMTE.cdsDocPago.fieldbyname('DEMTOORI').AsFloat;
               DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat := DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat;
               DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat := DMTE.FRound(
               DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat *
                            DMTE.cdsDocPago.fieldbyname('DETCPAG').AsFloat,15,2);
              //DMTE.cdsQry6.FieldByName('CPTCAMPR').AsFloat, 15, 2);
               DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat := DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat;
            End;
         End;
         DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString := wECNOCOMP;
         DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString := wNewVoucher;
         DMTE.cdsDocPago.Post;

         xSQL := 'Insert into CAJA303(TIPDET, CIAID, TDIARID, ECANOMM, TDIARID2, CPANOMM, '
            + '                       PROV, PROVRUC, CPNOREG, DOCID2, CPSERIE, CPNODOC, '
            + '                       TMONID, DETCDOC, DETCPAG, CPTOID, CUENTAID, CPFEMIS, '
            + '                       CPFVCMTO, DEUSER, DEFREG, DEHREG, PROVDES, CLAUXID, '
            + '                       CIAID2, DEMTOORI, DEMTOLOC, DESALLOC, DEMTOEXT, '
            + '                       DESALEXT, ECNOCOMPR, ECNOCOMP) '
            + '   Values('
            + quotedstr('I4') + ', '
            + quotedstr(wCIAID) + ', '
            + quotedstr(dbeOrigen.Text) + ', '
            + quotedstr(wECANOMM) + ', '
            + quotedstr(wTDIARID2) + ', '
            + quotedstr(wCPANOMM) + ', '
            + quotedstr(wPROV) + ', '
            + quotedstr(wPROVRUC) + ', '
            + quotedstr(wCPNOREG) + ', '
            + quotedstr(wDOCID2) + ', '
            + quotedstr(wCPSERIE) + ', '
            + quotedstr(wCPNODOC) + ', '
            + quotedstr(wTMONID) + ', '
            + floattostr(wDETCDOC) + ', '
            + floattostr(wDETCPAG) + ', '
            + quotedstr(DMTE.cdsQry6.FieldByName('CPTOID').AsString) + ', '
            + quotedstr(DMTE.cdsQry6.FieldByName('CUENTAID').AsString) + ', '
            + quotedstr(wCPFEMIS) + ', '
            + quotedstr(wCPFVCMTO) + ', '
            + quotedstr(wDEUSER) + ', '
            + ' trunc(sysdate), '
            + ' sysdate, '
            + quotedstr(wPROVDES) + ', '
            + quotedstr(wCLAUXID) + ', '
            + quotedstr(wCIAID2) + ', '
            + floattostr(DMTE.cdsQry6.FieldByName('DCPMOORI').AsFloat * xFactorD) + ', '
            + floattostr(wDEMTOLOC) + ', '
            + floattostr(wDESALLOC) + ', '
            + floattostr(wDEMTOEXT) + ', '
            + floattostr(wDESALEXT) + ', '
            + quotedstr(wECNOCOMP) + ', '
            + quotedstr(wNewVoucher) + ') ';
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error al intentar grabar el Detalle de Detracciones');
            xSigueGrab := False;
            Exit;
         End;
      End;
      DMTE.cdsQry6.next;
   End;
// Inicio HPC_201803_CAJA
// Se adiciona la sumatoria del pago de la Obligación
// Inicio CAJA-201804
// Se ajusta para realizar Pago de Detracción
   xSQL := 'Select sum(case when B.DCPDH=''D'' then (-1) else 1 end * (B.DCPMOORI-(CASE WHEN G.DCPMOORI IS NULL THEN 0 ELSE G.DCPMOORI END) ) ) DCPMOORI, '
      + '      sum(case when DCPDH=''D'' then (-1) else 1 end * (A.DEMTOORI - (CASE WHEN G.DCPMOORI IS NULL THEN 0 ELSE G.DCPMOORI END) ) ) DEMTOORI  '
      + '     from CAJA303 A, CXP302 B, CXP301 C, CXP305 F, '
      + '          (SELECT X.CIAID, X.CPANOMES, X.TDIARID, X.CPNOREG, X.CLAUXID, X.PROV, X.TCANJEID, X.CPCANJE, Z.CUENTAID, Z.DCPDH, Z.DOCID, Z.CPSERIE, Z.CPNODOC, Z.CPTCAMPR, Z.CPTCAMPA, Z.DCPMOORI, Z.DCPMOLOC, Z.DCPMOEXT '
      + '           FROM CXP301 X,CXP302 Z WHERE X.CIAID=Z.CIAID and X.TDIARID=Z.TDIARID and X.CPANOMES=Z.DCPANOMM and X.CPNOREG=Z.CPNOREG AND Z.TIPDET=''TO'') G '
      + '    where A.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
      + '      and A.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
      + '      and A.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
      + '      and A.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
      + '      and A.CIAID2=B.CIAID(+) '
      + '      and A.CPANOMM=B.DCPANOMM '
      + '      and A.TDIARID2=B.TDIARID '
      + '      and A.CPNOREG=B.CPNOREG(+) '
      + '      and B.CLAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString)
      + '      and B.DCPAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString)
      + '      and B.TIPDET=' + quotedstr('TO')
      + '      and B.CIAID=C.CIAID AND B.TDIARID=C.TDIARID AND B.DCPANOMM=C.CPANOMES AND B.CPNOREG=C.CPNOREG '
      + '      AND C.CIAID = F.CIAID(+) AND C.CLAUXID = F.CLAUXID(+) AND C.PROV= F.PROV(+) AND C.DOCID = F.DOCID(+) AND C.CPSERIE = F.CPSERIE(+) AND C.CPNODOC = F.CPNODOC(+) '
      + '      AND F.CIAID = G.CIAID(+) AND F.CLAUXID = G.CLAUXID(+) AND F.PROV = G.PROV(+) AND F.TCANJEID = G.TCANJEID(+) AND F.CCPCANJE = G.CPCANJE(+) ';

   DMTE.cdsQry6.Close;
   DMTE.cdsQry6.DataRequest(xSQL);
   DMTE.cdsQry6.open;
// Fin CAJA-201804
   DMTE.cdsEgrCaja.Edit;
   DMTE.cdsEgrCaja.FieldByName('TIPDET').AsString := 'TO';
   DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat := DMTE.cdsQry6.FieldByName('DEMTOORI').AsFloat + xOtroLoc;
      DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat := DMTE.cdsEgrCaja.fieldbyname('ECMTOORI').AsFloat;
      DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat := DMTE.FRound(
         DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat /
         DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat, 15, 2) + xOtroExt;
   End
   Else
   Begin
      If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonExt Then
      Begin
         DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat := DMTE.cdsQry6.FieldByName('DEMTOORI').AsFloat + xOtroExt;
         DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat := DMTE.cdsEgrCaja.fieldbyname('ECMTOORI').AsFloat;
         DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat := DMTE.FRound(
            DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat *
            DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat, 15, 2) + xOtroLoc;
      End;
   End;
   DMTE.cdsEgrCaja.Post;
// Fin HPC_201803_CAJA
   xSQL := 'update CAJA302 '
      + '      set TIPDET=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TIPDET').AsString) + ','
      + '          ECNOCOMPR= ' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString) + ','
      + '          ECMTOORI = ' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat) + ','
      + '          ECMTOLOC = ' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat) + ','
      + '          ECMTOEXT = ' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat) + ','
      + '          ECUSER = ' + quotedstr(DMTE.wUsuario) + ','
      + '          ECFREG=trunc(sysdate), '
      + '          ECHREG=sysdate '
      + '    Where CIAID=' + quotedstr(dblcCia.Text)
      + '      and ECANOMM=' + quotedstr(edtPeriodo.Text)
      + '      and TDIARID=' + quotedstr(dblcTDiario.Text)
      + '      and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error en actualización de Detracción en Cabecera Caja');
      xSigueGrab := False;
      Exit;
   End;

   dbeImporte.Text := floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat);
// Inicio CAJA-201804
// Se ajusta para realizar Pago de Detracción
// ASIENTOS DE LA DETRACCION
   xSQL := 'Select sum(case when B.DCPDH=''D'' then (-1) else 1 end * (B.DCPMOLOC -(CASE WHEN G.DCPMOLOC IS NULL THEN 0 ELSE G.DCPMOLOC END) ) ) END DCPMOORI '
      + '     from CAJA303 A, CXP302 B, CXP301 C, CXP305 F, '
      + '          (SELECT X.CIAID, X.CPANOMES, X.TDIARID, X.CPNOREG, X.CLAUXID, X.PROV, X.TCANJEID, X.CPCANJE, Z.CUENTAID, Z.DCPDH, Z.DOCID, Z.CPSERIE, Z.CPNODOC, Z.CPTCAMPR, Z.CPTCAMPA, Z.DCPMOORI, Z.DCPMOLOC, Z.DCPMOEXT '
      + '           FROM CXP301 X,CXP302 Z WHERE X.CIAID=Z.CIAID and X.TDIARID=Z.TDIARID and X.CPANOMES=Z.DCPANOMM and X.CPNOREG=Z.CPNOREG AND Z.TIPDET=''I4'') G '
      + '    where A.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
      + '      and A.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
      + '      and A.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
      + '      and A.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
      + '      and A.CIAID2=B.CIAID(+) '
      + '      and A.CPANOMM=B.DCPANOMM '
      + '      and TDIARID2=B.TDIARID '
      + '      and A.CPNOREG=B.CPNOREG(+) '
      + '      and B.CLAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString)
      + '      and B.DCPAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString)
      + '      and B.TIPDET=' + quotedstr('I4')
      + '      and B.CIAID=C.CIAID AND B.TDIARID=C.TDIARID AND B.DCPANOMM=C.CPANOMES AND B.CPNOREG=C.CPNOREG '
      + '      AND C.CIAID = F.CIAID(+) AND C.CLAUXID = F.CLAUXID(+) AND C.PROV= F.PROV(+) AND C.DOCID = F.DOCID(+) AND C.CPSERIE = F.CPSERIE(+) AND C.CPNODOC = F.CPNODOC(+) '
      + '      AND F.CIAID = G.CIAID(+) AND F.CLAUXID = G.CLAUXID(+) AND F.PROV = G.PROV(+) AND F.TCANJEID = G.TCANJEID(+) AND F.CCPCANJE = G.CPCANJE(+) ';
   DMTE.cdsQry6.Close;
   DMTE.cdsQry6.DataRequest(xSQL);
   DMTE.cdsQry6.open;
// Fin CAJA-201804
   wECNOCOMP := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   wTMONID := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
   wTMONID := 'N';
   wECTCAMB := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   wCIAID := DMTE.cdsEgrCaja.fieldbyname('CIAID').AsString;
   wTDIARID := DMTE.cdsEgrCaja.fieldbyname('TDIARID').AsString;
   wECANOMM := DMTE.cdsEgrCaja.fieldbyname('ECANOMM').AsString;
   wCLAUXID := DMTE.cdsEgrCaja.fieldbyname('CLAUXID').AsString;
   wPROV := DMTE.cdsEgrCaja.fieldbyname('PROV').AsString;
   wPROVRUC := DMTE.cdsEgrCaja.fieldbyname('PROVRUC').AsString;
   wECFCOMP := DMTE.cdsEgrCaja.fieldbyname('ECFCOMP').AsString;
   wFPAGOID := DMTE.cdsEgrCaja.fieldbyname('FPAGOID').AsString;
   wECGLOSA := DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString;
   wECLOTE := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   wECESTADO := DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString;
   wECUSER := DMTE.cdsEgrCaja.fieldbyname('ECUSER').AsString;
   wECFREG := DMTE.cdsEgrCaja.fieldbyname('ECFREG').AsString;
   wECHREG := DMTE.cdsEgrCaja.fieldbyname('ECHREG').AsString;
   wEC_PROCE := DMTE.cdsEgrCaja.fieldbyname('EC_PROCE').AsString;
   wEC_IE := DMTE.cdsEgrCaja.fieldbyname('EC_IE').AsString;
   WECGIRA := DMTE.cdsEgrCaja.fieldbyname('ECGIRA').AsString;
   WCCBCOVOUCH := DMTE.cdsEgrCaja.fieldbyname('CCBCOVOUCH').AsString;
   WECANO := DMTE.cdsEgrCaja.fieldbyname('ECANO').AsString;
   WECMM := DMTE.cdsEgrCaja.fieldbyname('ECMM').AsString;
   WECDD := DMTE.cdsEgrCaja.fieldbyname('ECDD').AsString;
   WECSS := DMTE.cdsEgrCaja.fieldbyname('ECSS').AsString;
   WECSEM := DMTE.cdsEgrCaja.fieldbyname('ECSEM').AsString;
   WECTRI := DMTE.cdsEgrCaja.fieldbyname('ECTRI').AsString;
   WECAASS := DMTE.cdsEgrCaja.fieldbyname('ECAASS').AsString;
   WECAASEM := DMTE.cdsEgrCaja.fieldbyname('ECAASEM').AsString;
   WECAATRI := DMTE.cdsEgrCaja.fieldbyname('ECAATRI').AsString;

// Nuevo Origen para la Detraccion
   wTDIARID := dbeOrigen.Text;

   xSQL := 'Select nvl(sum(1),0) REGISTROS '
      + '     from CAJA302 '
      + '    where CIAID=' + quotedstr(wCIAID)
      + '      and ECANOMM=' + quotedstr(wECANOMM)
      + '      and TDIARID=' + quotedstr(dbeOrigen.Text)
      + '      and ECNOCOMPR=' + quotedstr(wECNOCOMP);
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;
   If DMTE.cdsQry.FieldByName('REGISTROS').AsInteger > 0 Then
   Begin
      xSQL := 'Delete from CAJA302 '
         + '    where CIAID=' + quotedstr(wCIAID)
         + '      and ECANOMM=' + quotedstr(wECANOMM)
         + '      and TDIARID=' + quotedstr(dbeOrigen.Text)
         + '      and ECNOCOMPR=' + quotedstr(wECNOCOMP);
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al intentar eliminar la Cabecera de la Detracción');
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
   End;

   DMTE.cdsEgrCaja.Append;
   DMTE.cdsEgrCaja.FieldByName('TIPDET').AsString := 'I4';
   DMTE.cdsEgrCaja.FieldByName('CIAID').AsString := wCIAID;
   DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString := wTDIARID;
   DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString := wECANOMM;
   DMTE.cdsEgrCaja.fieldbyname('CLAUXID').AsString := wCLAUXID;
   DMTE.cdsEgrCaja.FieldByName('PROV').AsString := wPROV;
   DMTE.cdsEgrCaja.FieldByName('PROVRUC').AsString := wPROVRUC;
   DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString := wECFCOMP;
   DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString := wFPAGOID;
   DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString := DMTE.cdsCnpEgr.FieldByName('CPTOID').AsString;
   DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString := XCTACONT;
   DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString := wECGLOSA;
   DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString := wECLOTE;
   DMTE.cdsEgrCaja.fieldbyname('ECESTADO').AsString := wECESTADO;
   DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString := wECUSER;
   DMTE.cdsEgrCaja.fieldbyname('ECFREG').AsString := wECFREG;
   DMTE.cdsEgrCaja.fieldbyname('EC_PROCE').AsString := wEC_PROCE;
   DMTE.cdsEgrCaja.fieldbyname('EC_IE').AsString := wEC_IE;
   DMTE.cdsEgrCaja.fieldbyname('ECFEMICH').AsString := dbdtpFEmis.Text;
   DMTE.cdsEgrCaja.fieldbyname('BANCOID').AsString := DMTE.cdsBancoEgr.FieldByName('BANCOID').AsString;
   DMTE.cdsEgrCaja.fieldbyname('CCBCOID').AsString := xCCBCOID;
   DMTE.cdsEgrCaja.fieldbyname('ECNOCHQ').AsString := dbeNoChqDTR.Text;
   DMTE.cdsEgrCaja.fieldbyname('ECGIRA').AsString := WECGIRA;
   DMTE.cdsEgrCaja.fieldbyname('CCBCOVOUCH').AsString := WCCBCOVOUCH;
   DMTE.cdsEgrCaja.fieldbyname('ECANO').AsString := WECANO;
   DMTE.cdsEgrCaja.fieldbyname('ECMM').AsString := WECMM;
   DMTE.cdsEgrCaja.fieldbyname('ECDD').AsString := WECDD;
   DMTE.cdsEgrCaja.fieldbyname('ECSS').AsString := WECSS;
   DMTE.cdsEgrCaja.fieldbyname('ECSEM').AsString := WECSEM;
   DMTE.cdsEgrCaja.fieldbyname('ECTRI').AsString := WECTRI;
   DMTE.cdsEgrCaja.fieldbyname('ECAASS').AsString := WECAASS;
   DMTE.cdsEgrCaja.fieldbyname('ECAASEM').AsString := WECAASEM;
   DMTE.cdsEgrCaja.fieldbyname('ECAATRI').AsString := WECAATRI;
   DMTE.cdsEgrCaja.fieldbyname('TMONID').AsString := wTMONID;
   DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat := wECTCAMB;

   DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat := DMTE.cdsQry6.FieldByName('DCPMOORI').AsFloat;
   If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat := DMTE.cdsEgrCaja.fieldbyname('ECMTOORI').AsFloat;
      DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat := DMTE.FRound(
         DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat /
         DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat, 15, 2);
   End
   Else
   Begin
      If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonExt Then
      Begin
         DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat := DMTE.cdsEgrCaja.fieldbyname('ECMTOORI').AsFloat;
         DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat := DMTE.FRound(
            DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat *
            DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat, 15, 2);
      End;
   End;
   DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString := wECNOCOMP;
   DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString := wNewVoucher;
   DMTE.cdsEgrCaja.Post;

   xSQL := ' Insert into CAJA302(TIPDET, CIAID, TDIARID, ECANOMM, CLAUXID, PROV, '
      + '                        PROVRUC, ECFCOMP, FPAGOID, CPTOID, CUENTAID, ECGLOSA, '
      + '                        ECLOTE, ECESTADO, ECUSER, ECFREG, EC_PROCE, EC_IE, '
      + '                        ECFEMICH, BANCOID, CCBCOID, ECNOCHQ, ECGIRA, CCBCOVOUCH, '
      + '                        ECANO, ECMM, ECDD, ECSS, ECSEM, ECTRI, ECAASS, ECAASEM, '
      + '                        ECAATRI, TMONID, ECTCAMB, ECMTOORI, ECMTOLOC, ECMTOEXT, '
      + '                        ECNOCOMPR, ECNOCOMP) '
      + '    Values( '
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('TIPDET').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('CLAUXID').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('PROV').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('PROVRUC').AsString) + ', '
      + quotedstr(datetostr(DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime)) + ', '
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECESTADO').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString) + ', '
      + 'trunc(sysdate), '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('EC_PROCE').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('EC_IE').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECFEMICH').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('BANCOID').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('CCBCOID').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECNOCHQ').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECGIRA').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('CCBCOVOUCH').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECANO').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECMM').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECDD').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECSS').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECSEM').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECTRI').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECAASS').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECAASEM').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('ECAATRI').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.fieldbyname('TMONID').AsString) + ', '
      + floattostr(DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat) + ', '
      + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat) + ', '
      + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat) + ', '
      + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat) + ', '
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString) + ', '
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString) + ') ';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al intentar grabar la cabecera del Egreso - Detracción');
      xSigueGrab := False;
      Exit;
   End;

   z2bbtnGraba.Enabled := False;
   lblDTR.Caption := 'Comprobante DETRAÍDO';
   lblDTR.Visible := True;
   z2bbtnSube.Enabled := False;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.ContabilizaProc1;
Begin
   If DMTE.sLet = DMTE.cdsDocPago.FieldByName('DOCID2').AsString Then
      bLetra := True;

// Actualiza sobre CAJA304 (archivo contable de Caja) los documentos provisionados
   Contab_DocPago;
   If Not xSigueGrab Then
      Exit;

   If xMsgContabiliza = '0' Then
   Begin
      If DMTE.wTipoDif = '' Then
      Begin
         Contab_DifCamDocPago;
         If Not xSigueGrab Then
            Exit;
      End
      Else
      Begin
         If DMTE.cdsDocPago.FieldByname('TMONID').AsString = DMTE.wTMonExt Then
         Begin
            DMTE.cdsCntCaja.Insert;
            Contab_DifCamDocPago2;
            If Not xSigueGrab Then
               Exit;
         End;
      End;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.Contab_HaberProc1;
Var
   xWhere, xSQL: String;
Begin
   If DMTE.cdsDocPago.FieldByName('DOCID2').AsString <> DMTE.sLet Then
   Begin
      If (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime >= DMTE.xTasaFec) And
         (DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCRETIGV', 'DOCMOD=''CXP'' AND DOCID=' + QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString), 'DOCRETIGV') = 'S') And
         (lblSujetoRetencion.visible) Then
      Begin
         xWhere := 'CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID2').AsString)
            + ' and CLAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString)
            + ' and PROV=' + quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString)
            + ' and CPSERIE=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPSERIE').AsString)
            + ' and CPNODOC=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPNODOC').AsString);
         If length(DMTE.DisplayDescrip('prvTGE', 'CXP301', '*', xWhere, 'PROV')) > 0 Then
         Begin
            If (DMTE.cdsQry.FieldByName('PROVRETIGV').AsString = 'S') Then
            Begin
               bMayorQueTasa := True
            End
            Else
            Begin
               If ((DMTE.cdsQry.FieldByName('CPGRAVAD').AsFloat + DMTE.cdsQry.FieldByName('CPIGV').AsFloat) >= DMTE.xTasaMonto)
                  And (DMTE.cdsQry.FieldByName('CPIGV').AsFloat > 0) Then
               Begin
                  bMayorQueTasa := True;
               End;
            End;
         End;

         xMtoL := xMtoL + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
         xMtoE := xMtoE + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
      End;
      If DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat > 0 Then
      Begin
// Inicio HPC_201701_CAJA  Modificar el cálculo de la diferencia de cambio
         If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
         Begin
            xMtoTotalL := xMtoTotalL + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
            xMtoTotalE := xMtoTotalE + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
         End
         Else
         Begin
            xMtoTotalL := xMtoTotalL + DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat*DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat,15,2);
            xMtoTotalE := xMtoTotalE + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
         End;
// Fin HPC_201701_CAJA  Modificar el cálculo de la diferencia de cambio
      End
      Else
      Begin
         xMtoTotalHL := xMtoTotalHL + (DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat * (-1));
         xMtoTotalHE := xMtoTotalHE + (DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * (-1));
      End;
   End
   Else //SI SON LETRAS
   Begin
      bLetra := True;
      xSQL := ' CIAID=''' + DMTE.cdsDocPago.fieldbyname('CIAID2').AsString + ''' and '
         + ' CPANOMES=''' + DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString + ''' and '
         + ' TDIARID=''' + DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString + ''' and '
         + ' CPNOREG=''' + DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString + ''' ';

      If DMTE.RecuperarDatos('CXP301', 'TMONID,TCANJEID,CPNOGRAV,CPGRAVAD,PROVDES,CPTCAMPR,CPTCAMAJ', xSQL) Then
      Begin
         If (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime >= DMTE.xTasaFec) And
            (DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCRETIGV', 'DOCMOD=''CXP'' AND DOCID=' + QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString), 'DOCRETIGV') = 'S') And
            (lblSujetoRetencion.visible) Then
         Begin
            If DMTE.cdsRec.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
            Begin
               xMtoRetL := DMTE.FRound(xMtoRetL + DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat, 15, 2);
               xMtoRetE := DMTE.FRound(xMtoRetE + (DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat / DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat), 15, 2);
            End
            Else
            Begin
               xMtoRetE := DMTE.FRound(xMtoRetE + DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat, 15, 2);
               xMtoRetL := DMTE.FRound(xMtoRetL + (DMTE.cdsRec.FieldByName('CPNOGRAV').AsFloat * DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat), 15, 2);
            End;
            xMtoL := xMtoL + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
            xMtoE := xMtoE + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
         End;
         xMtoTotalL := xMtoTotalL + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
         xMtoTotalE := xMtoTotalE + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
      End
      Else
         Showmessage('Error en la recuperación del documento - WMC');
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbeNoChqDTRExit(Sender: TObject);
Var
   xSql: String;
Begin
   xSql := 'BANCOID=' + quotedstr(dblcBanco.text) + ' and '
      + 'CCBCOID=' + quotedstr(dblcCCBcoDTR.Text) + ' AND ECNOCHQ=' + quotedstr(dbeNoChqDTR.text);

   DMTE.DisplayDescrip('prvTGE', 'CAJA302', 'ECNOCHQ,ECESTADO,ECELABO', xsql, 'ECNOCHQ');

   If length(trim(DMTE.cdsQry.FieldByName('ECNOCHQ').AsString)) > 0 Then
   Begin
      If DMTE.cdsQry.FieldByName('ECESTADO').AsString <> 'A' Then
      Begin
         showmessage('El número de Cheque ya fue Utilizado');
         dbeNoChqDTR.SetFocus;
         Exit;
      End
      Else
      Begin
         If DMTE.cdsQry.FieldByName('ECELABO').AsString = 'NULO' Then
         Begin
            showmessage('El número de Cheque ya fue Utilizado');
            dbeNoChqDTR.SetFocus;
            Exit;
         End;
      End;
   End;
   z2bbtnDTROK2.SetFocus;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnDTROK2Click(Sender: TObject);
Begin
// Chequea N. de Cheque
   If length(trim(dbeNoChqDTR.text)) = 0 Then
   Begin
      showmessage('El número de Cheque es Obligatorio');
      dbeNoChqDTR.SetFocus;
      Exit;
   End
   Else
   Begin
      If MessageDlg('¿Está seguro del Número de Cheque?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Else
      Begin
         dbeNoChqDTR.SetFocus;
         Exit;
      End;
   End;

   DMTE.DCOM1.AppServer.IniciaTransaccion;
   xSigueGrab := True;
   Detraccion;
   If Not xSigueGrab Then
   Begin
      DMTE.DCOM1.AppServer.RetornaTransaccion;
      Exit;
   End;
   DMTE.DCOM1.AppServer.GrabaTransaccion;
// Inicio HPC_201803_CAJA
// Se adiciona el refresco de ActivaFiltro('DOCPAGO')
   ActivaFiltro('DOCPAGO');
// Fin HPC_201803_CAJA
   ShowMessage('Grabación OK');
   dbeNoChqDTR.Text := '';
   lblCCBcoDTR.Visible := False;
   dblcCCBcoDTR.Visible := False;
   pnlDetraccion.Visible := False;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.z2bbtnDTRCancel3Click(Sender: TObject);
Begin
   pnlDetraccion.Visible := False;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcCCBcoDTREnter(Sender: TObject);
Begin
   strTmp := dblcCCBcoDTR.Text;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcCCBcoDTRExit(Sender: TObject);
Var
   wTmp, Xsql, sNumAbo, sNumT: String;
Begin
   wTmp := DMTE.DisplayDescripLocal(DMTE.cdsSQL, 'CCBCOID', dblcCCBcoDTR.Text, 'CCBCOID');
   If wTmp = '' Then
   Begin
      ShowMessage('Error : Cuenta Corriente No Valida');
      dblcccbcoDTR.SetFocus;
      exit;
   End;
   XCCBCOID := DMTE.cdsSQL.FieldByName('CCBCOID').AsString;
   XCTACONT := DMTE.cdsSQL.fieldbyname('CTAPRINC').AsString;

   If sFlagAbono = 'S' Then
   Begin
      xSql := 'Select max(ABONO) ABONO '
         + '     from (Select max(ECNOCHQ) ABONO '
         + '             from CAJA302 '
         + '            where CIAID=''02'' '
         + '              and ECANOMM=''' + edtPeriodo.Text + ''' '
         + '              and CCBCOID=' + quotedstr(dblcCCBcoDTR.Text)
         + '           union all '
         + '           Select max(NUMDETRAC) ABONO '
         + '             from CXP_ORD_PAG_DET '
         + '            where NUMDETRAC like ''' + edtPeriodo.Text + '%'''
         + '        ) ';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest(xSQL);
      DMTE.cdsQry.open;
      If length(trim(DMTE.cdsQry.FieldByname('ABONO').AsString)) > 6 Then
         sNumT := DMTE.StrZero(DMTE.cdsQry.FieldByname('ABONO').AsString, 10)
      Else
         sNumT := '0000000000';
      sNumAbo := edtPeriodo.Text + DMTE.StrZero(inttostr(StrtoInt(Copy(sNumT, 7, 4)) + 1), 4);
   End;

   dbeNoChqDTR.Text := sNumAbo;

   If pnlDetraccion.Visible Then
      dbeNoChqDTR.SetFocus;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.bbtnReContaClick(Sender: TObject);
Begin
   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' Then
   Begin
      cReConta := 'S';
      z2bbtnContClick(Self);
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dblcdCCostoEnter(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select CCOSID, CCOSDES, CCOSABR, CCOSNIV, CCOSMOV '
      + '     from TGE203 '
      + '    where CCOSMOV=''S'' '
      + '      and CCOSACT=''S'' '
      + '      and CCOSCIAS LIKE (' + quotedstr('%' + dblcCia.Text + '%') + ' ) ';
   DMTE.cdsCCosto.Close;
   DMTE.cdsCCosto.DataRequest(xSQL);
   DMTE.cdsCCosto.open;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.bbtnImpDetClick(Sender: TObject);
Var
   xSQL, xWhere, xxAA, xSQL44: String;
Begin
// Si el comprobante de caja no ha sido contabilizado
// inicia variables que se acumulan
   If DMTE.cdsEgrCaja.FieldByName('TIPDET').AsString = 'I4' Then
   Begin
      Exit;
   End;

   If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'A' Then
   Begin
      ImprimeVoucher('CNT311G', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text);
      Exit;
   End;

   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' Then
   Begin
      ShowMessage('Para Imprimir Comprobante, Debe Contabilizar el Voucher ');
      Exit;
   End;

   xMtol := 0;
   xMtoE := 0;
   xMtoTotalL := 0;
   xMtoTotalE := 0;
   xMtoTotalHL := 0;
   xMtoTotalHE := 0;
   xNReg := 0;
   If xDTRPorc > 0 Then
   Begin
     // PARA UBICAR EL REGISTRO SELECCIONADO EN EL DBGDOCPAGO(CAJA303) COINCIDA CON EL CAJA302

      xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, TDIARID2, CPANOMM, PROV, '
         + '          PROVRUC, CPNOREG, DOCID2, CPSERIE, CPNODOC, TMONID, DETCDOC, '
         + '          DETCPAG, DEDH, DEMTOORI, DEMTOLOC, DEMTOEXT, DESALLOC, DESALEXT, '
         + '          CPTOID, CUENTAID, CCOSID, CPFEMIS, CPFVCMTO, DEUSER, DEFREG, '
         + '          DEHREG, DEANO, DEMM, DEDD, DESS, DESEM, DETRI, DEAASS, DEAASEM, '
         + '          DEAATRI, FLAGVAR, DEANTMN, DEANTME, CLAUXID, ECNOREPO, PROVDES, '
         // Inicio HPC_201703_CAJA
         // Validación SEMT para proveedores con cobranza coactiva
         //         + '          TIPDET, ECNOCOMPR, CIAID2, CNTCOMPROB '
         + '          TIPDET, ECNOCOMPR, CIAID2, CNTCOMPROB, NVL(VALPAGPRO,''N'') VALPAGPRO '
         // Final HPC_201703_CAJA
         + '     from CAJA303 A '
         + '    where A.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
         + '      and A.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
         + '      and A.ECNOCOMPR=' + quotedstr(dbeNoComp.Text)
         + '      and A.ECNOCOMP<>' + quotedstr(dbeNoComp.Text);
      DMTE.cdsDocPago.Close;
      DMTE.cdsDocPago.Filter := '';
      DMTE.cdsDocPago.Filtered := False;
      DMTE.cdsDocPago.DataRequest(xSQL);
      DMTE.cdsDocPago.Open;

      DMTE.cdsEgrCaja.Filter := '';
      DMTE.cdsEgrCaja.Filtered := False;
      xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, CLAUXID, PROV, PROVRUC, '
         + '          ECFCOMP, ECFEMICH, ECFPAGOP, ECFCOBCH, FPAGOID, DOCID, ECNODOC, '
         + '          TMONID, ECTCAMB, ECMTOORI, ECMTOLOC, ECMTOEXT, BANCOID, CCBCOID, '
         + '          ECNOCHQ, ECGIRA, CPTOID, CUENTAID, ECGLOSA, ECLOTE, ECELABO, '
         + '          ECAPROB, ECESTADO, ECCONTA, ECUSER, ECFREG, ECHREG, ECANO, ECMM, '
         + '          ECDD, ECSS, ECSEM, ECTRI, ECAASS, ECAASEM, ECAATRI, FLAGVAR, '
         + '          EC_PROCE, ECOPAGO, TDIARIO2, ECNOCOMP2, ECANOMM2, EC_IE, '
         + '          ECCHQEMI, USERRESP, EQUIID, ECCHKEST, ECPERNDOC, ECPERREC, '
         + '          TIPDOCCOD, PERID, ECFENTR, ECCONSOLID, ECMTCON, ECFCV, ECCOBLOC, '
         + '          ECMTDIF, ECCOBEXT, ECDEVLOC, ECDEVEXT, FEXTCHQ, FLUEID, ECCONING, '
         + '          ECNOREPO, CLAUXID1, AUXID, PROV1, CCBCOVOUCH, PRVBANCOID, PRVCCBCOID, '
         + '          ECSALMN, ECSALME, CAJARETIGV, FDOFIJJUST, GCONCID, TIPDET, ECNOCOMPR, '
         + '          CNTCOMPROB, KEYVALE, FLGREN '
         + '     from CAJA302 A '
         + '    where A.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
         + '      and A.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
         + '      and A.ECNOCOMPR=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
         + '      and A.ECNOCOMP<>' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.Open;

      If DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString = '' Then xDTRPorc := 0;
   End;

   If xDTRPorc > 0 Then
      ImprimeVoucher('CNT301G', dblcCia.Text, edtPeriodo.Text, DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
         DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString, dbeGlosa.Text)
   Else
      ImprimeVoucher('CNT301G', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text);

   dbgDocPago.ReadOnly := True;
   DMTE.cdsDocPago.EnableControls;

   If trim(DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString) <> '' Then
   Begin
      xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, CLAUXID, PROV, PROVRUC, ECFCOMP, '
         + '          ECFEMICH, ECFPAGOP, ECFCOBCH, FPAGOID, DOCID, ECNODOC, TMONID, '
         + '          ECTCAMB, ECMTOORI, ECMTOLOC, ECMTOEXT, BANCOID, CCBCOID, ECNOCHQ, '
         + '          ECGIRA, CPTOID, CUENTAID, ECGLOSA, ECLOTE, ECELABO, ECAPROB, ECESTADO, '
         + '          ECCONTA, ECUSER, ECFREG, ECHREG, ECANO, ECMM, ECDD, ECSS, ECSEM, ECTRI, '
         + '          ECAASS, ECAASEM, ECAATRI, FLAGVAR, EC_PROCE, ECOPAGO, TDIARIO2, ECNOCOMP2, '
         + '          ECANOMM2, EC_IE, ECCHQEMI, USERRESP, EQUIID, ECCHKEST, ECPERNDOC, ECPERREC,'
         + '          TIPDOCCOD, PERID, ECFENTR, ECCONSOLID, ECMTCON, ECFCV, ECCOBLOC, ECMTDIF, '
         + '          ECCOBEXT, ECDEVLOC, ECDEVEXT, FEXTCHQ, FLUEID, ECCONING, ECNOREPO, CLAUXID1,'
         + '          AUXID, PROV1, CCBCOVOUCH, PRVBANCOID, PRVCCBCOID, ECSALMN, ECSALME, '
         + '          CAJARETIGV, FDOFIJJUST, GCONCID, TIPDET, ECNOCOMPR, CNTCOMPROB, KEYVALE, '
         + '          FLGREN '
         + '     from CAJA302 A '
         + '    where A.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
         + '      and A.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
         + '      and A.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString);
      DMTE.cdsEgrCaja.Filter := '';
      DMTE.cdsEgrCaja.Filtered := False;
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.Open;

      xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, TDIARID2, CPANOMM, PROV, PROVRUC, '
         + '          CPNOREG, DOCID2, CPSERIE, CPNODOC, TMONID, DETCDOC, DETCPAG, DEDH, '
         + '          DEMTOORI, DEMTOLOC, DEMTOEXT, DESALLOC, DESALEXT, CPTOID, CUENTAID, '
         + '          CCOSID, CPFEMIS, CPFVCMTO, DEUSER, DEFREG, DEHREG, DEANO, DEMM, DEDD, '
         + '          DESS, DESEM, DETRI, DEAASS, DEAASEM, DEAATRI, FLAGVAR, DEANTMN, DEANTME, '
         // Inicio HPC_201703_CAJA
         // Validación SEMT para proveedores con cobranza coactiva
         //         + '          CLAUXID, ECNOREPO, PROVDES, TIPDET, ECNOCOMPR, CIAID2, CNTCOMPROB '
         + '          CLAUXID, ECNOREPO, PROVDES, TIPDET, ECNOCOMPR, CIAID2, CNTCOMPROB, NVL(VALPAGPRO,''N'') VALPAGPRO '
         // Final HPC_201703_CAJA
         + '     from CAJA303 A '
         + '    where A.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
         + '      and A.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
         + '      and A.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
         + '      and A.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
      DMTE.cdsDocPago.Close;
      DMTE.cdsDocPago.DataRequest(xSQL);
      DMTE.cdsDocPago.Open;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.bbtnChqDetClick(Sender: TObject);
Var
   strChq: structChq;
   xSQL, ArchivoReporte, WECCHQEMI, wGiradoDTR, wCtaCteBCO, xSQL44: String;
   xTotal: double;
Begin

// Si el comprobante de caja no ha sido contabilizado
// inicia variables que se acumulan
   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' Then
   Begin
      ShowMessage('Para imprimir Voucher se Contabilizar Registro');
      Exit;
   End;

   xMtol := 0;
   xMtoE := 0;
   xMtoTotalL := 0;
   xMtoTotalE := 0;
   xMtoTotalHL := 0;
   xMtoTotalHE := 0;
   xNReg := 0;
   If xDTRPorc > 0 Then
   Begin
     // PARA UBICAR EL REGISTRO SELECCIONADO EN EL DBGDOCPAGO(CAJA303) COINCIDA CON EL CAJA302

      xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, TDIARID2, CPANOMM, PROV, PROVRUC, '
         + '          CPNOREG, DOCID2, CPSERIE, CPNODOC, TMONID, DETCDOC, DETCPAG, DEDH, '
         + '          DEMTOORI, DEMTOLOC, DEMTOEXT, DESALLOC, DESALEXT, CPTOID, CUENTAID, '
         + '          CCOSID, CPFEMIS, CPFVCMTO, DEUSER, DEFREG, DEHREG, DEANO, DEMM, DEDD, '
         + '          DESS, DESEM, DETRI, DEAASS, DEAASEM, DEAATRI, FLAGVAR, DEANTMN, DEANTME,'
         // Inicio HPC_201703_CAJA
         // Validación SEMT para proveedores con cobranza coactiva
         //         + '          CLAUXID, ECNOREPO, PROVDES, TIPDET, ECNOCOMPR, CIAID2, CNTCOMPROB '
         + '          CLAUXID, ECNOREPO, PROVDES, TIPDET, ECNOCOMPR, CIAID2, CNTCOMPROB, NVL(VALPAGPRO,''N'') VALPAGPRO '
         // Final HPC_201703_CAJA
         + '     from CAJA303 a '
         + '    where A.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
         + '      and A.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
         + '      and A.ECNOCOMPR=' + quotedstr(dbeNoComp.Text)
         + '      and A.ECNOCOMP<>' + quotedstr(dbeNoComp.Text);
      DMTE.cdsDocPago.Close;
      DMTE.cdsDocPago.DataRequest(xSQL);
      DMTE.cdsDocPago.Open;

      DMTE.cdsEgrCaja.Filter := '';
      DMTE.cdsEgrCaja.Filtered := False;
      xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, CLAUXID, PROV, PROVRUC, ECFCOMP, '
         + '          ECFEMICH, ECFPAGOP, ECFCOBCH, FPAGOID, DOCID, ECNODOC, TMONID, ECTCAMB, '
         + '          ECMTOORI, ECMTOLOC, ECMTOEXT, BANCOID, CCBCOID, ECNOCHQ, ECGIRA, CPTOID, '
         + '          CUENTAID, ECGLOSA, ECLOTE, ECELABO, ECAPROB, ECESTADO, ECCONTA, ECUSER, '
         + '          ECFREG, ECHREG, ECANO, ECMM, ECDD, ECSS, ECSEM, ECTRI, ECAASS, ECAASEM, '
         + '          ECAATRI, FLAGVAR, EC_PROCE, ECOPAGO, TDIARIO2, ECNOCOMP2, ECANOMM2, '
         + '          EC_IE, ECCHQEMI, USERRESP, EQUIID, ECCHKEST, ECPERNDOC, ECPERREC, '
         + '          TIPDOCCOD, PERID, ECFENTR, ECCONSOLID, ECMTCON, ECFCV, ECCOBLOC, '
         + '          ECMTDIF, ECCOBEXT, ECDEVLOC, ECDEVEXT, FEXTCHQ, FLUEID, ECCONING, '
         + '          ECNOREPO, CLAUXID1, AUXID, PROV1, CCBCOVOUCH, PRVBANCOID, PRVCCBCOID, '
         + '          ECSALMN, ECSALME, CAJARETIGV, FDOFIJJUST, GCONCID, TIPDET, ECNOCOMPR, '
         + '          CNTCOMPROB, KEYVALE, FLGREN '
         + '     from CAJA302 A '
         + '    where A.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
         + '      and A.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
         + '      and A.ECNOCOMPR=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
         + '      and A.ECNOCOMP<>' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.Open;

      If DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString = '' Then xDTRPorc := 0;
   End
   Else
      Exit;

   If trim(DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString) = '020001' Then
   Begin
      ShowMessage('Pago de detracciones debe ser por Internet. Verificar...');
      Exit;
   End;

   If trim(dblcCCBco.Text) <> '' Then
   Begin
      xTotal := 0;
      wGiradoDTR := '';
      If (xDTRPorc = 0) And (vYanoRetencion = 'N') Then
      Begin
         xSQL := 'CIAID=' + quotedstr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)
            + ' and TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
            + ' and ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
            + ' and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);

         DMTE.DisplayDescrip('prvTGE', 'CAJA302', 'ECCONTA', xSQL, 'ECCONTA');
         If DMTE.cdsQry.FieldByName('ECCONTA').AsString <> 'S' Then
         Begin
            ShowMessage('Para Imprimir Cheque, Debe Contabilizar el Voucher');
            Exit;
         End;

         xSQL := 'Select sum( MTORETLOC ) RETLOC, sum( MTORETEXT ) RETEXT '
            + '     from CNT320 '
            + '    where CIAID=' + quotedstr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)
            + '      and ANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
            + '      and TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
            + '      and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
            + '      and (DOCID2 is null or DOCID2='''' ) ';
         DMTE.cdsQry4.Close;
         DMTE.cdsQry4.Datarequest(xSQL);
         DMTE.cdsQry4.Open;

         If dblcTMon.Text = DMTE.wTMonLoc Then
            xTotal := DMTE.FRound(strtoFloat(dbeImporte.Text) - DMTE.cdsQry4.fieldbyname('RETLOC').AsFloat, 15, 2)
         Else
            If dblcTMon.Text = DMTE.wTMonExt Then
               xTotal := DMTE.FRound(strtoFloat(dbeImporte.Text) - DMTE.cdsQry4.fieldbyname('RETEXT').AsFloat, 15, 2);

         xTotal := DMTE.FRound(strtoFloat(dbeImporte.Text), 15, 2);

         xSQL := ' CIAID=''' + dblcCia.text + ''' and '
            + 'TDIARID=''' + dblcTDiario.text + ''' and '
            + 'ECANOMM=''' + edtPeriodo.text + ''' and '
            + 'ECNOCOMP=''' + dbeNoComp.text + ''' ';
         wECCHQEMI := DMTE.DisplayDescrip('prvSQL', 'CAJA302', 'ECCHQEMI', xsql, 'ECCHQEMI');

      // se carga variable para realizar el UPDATE despues de emitido el Cheque
         xSQL := 'Update CAJA302 '
            + '      set ECCHQEMI=''S'' '
            + '    where CIAID=''' + dblcCia.text + ''' '
            + '      and TDIARID=''' + dblcTDiario.text + ''' '
            + '      and ECANOMM=''' + edtPeriodo.text + ''' '
            + '      and ECNOCOMP=''' + dbeNoComp.text + ''' ';
         wCtaCteBCO := dblcCCBco.Text
      End
      Else // si se aplica la DETRACCION
      Begin
      // PARA UBICAR EL REGISTRO SELECCIONADO EN EL DBGDOCPAGO(CAJA303) COINCIDA CON EL CAJA302
         DMTE.cdsEgrCaja.Filter := '';
         DMTE.cdsEgrCaja.Filtered := False;
         DMTE.cdsEgrCaja.Filter := ' CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
            + ' and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
            + ' and TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
            + ' and ECNOCOMP=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString);
         DMTE.cdsEgrCaja.Filtered := True;

         If DMTE.cdsEgrCaja.Recordcount <= 0 Then
         Begin
            xSQL44 := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, CLAUXID, PROV, PROVRUC, '
               + '          ECFCOMP, ECFEMICH, ECFPAGOP, ECFCOBCH, FPAGOID, DOCID, ECNODOC, '
               + '          TMONID, ECTCAMB, ECMTOORI, ECMTOLOC, ECMTOEXT, BANCOID, CCBCOID, '
               + '          ECNOCHQ, ECGIRA, CPTOID, CUENTAID, ECGLOSA, ECLOTE, ECELABO, '
               + '          ECAPROB, ECESTADO, ECCONTA, ECUSER, ECFREG, ECHREG, ECANO, '
               + '          ECMM, ECDD, ECSS, ECSEM, ECTRI, ECAASS, ECAASEM, ECAATRI, '
               + '          FLAGVAR, EC_PROCE, ECOPAGO, TDIARIO2, ECNOCOMP2, ECANOMM2, '
               + '          EC_IE, ECCHQEMI, USERRESP, EQUIID, ECCHKEST, ECPERNDOC, '
               + '          ECPERREC, TIPDOCCOD, PERID, ECFENTR, ECCONSOLID, ECMTCON, '
               + '          ECFCV, ECCOBLOC, ECMTDIF, ECCOBEXT, ECDEVLOC, ECDEVEXT, '
               + '          FEXTCHQ, FLUEID, ECCONING, ECNOREPO, CLAUXID1, AUXID, PROV1, '
               + '          CCBCOVOUCH, PRVBANCOID, PRVCCBCOID, ECSALMN, ECSALME, '
               + '          CAJARETIGV, FDOFIJJUST, GCONCID, TIPDET, ECNOCOMPR, CNTCOMPROB, '
               + '          KEYVALE, FLGREN '
               + '     from CAJA302 '
               + '    Where CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
               + '      and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
               + '      and TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
               + '      and ECNOCOMP=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString);
            DMTE.cdsEgrCaja.Close;
            DMTE.cdsEgrCaja.DataRequest(xSQL44);
            DMTE.cdsEgrCaja.Open;
         End;

         xTotal := DMTE.cdsEgrCaja.FieldbyName('ECMTOORI').AsFloat;
         If DMTE.cdsEgrCaja.FieldbyName('TIPDET').AsString = 'I4' Then // por ser el importe de DETRACCION
         Begin
         // ACCESA AL TGE105 PARA TOMAR EL NOMBRE DEL BANCO PARA EL CHEQUE DE LA DETRACCION
            xSQL := 'Select BANCOABR, BANCOID, BANCONOM, BANCOPCCADO, BANCOPCCASO, '
               + '          BANCOPCFEDO, BANCOPCFESO, BANCOPCLEDO, BANCOPCLESO, '
               + '          BANCOPCPRDO, BANCOPCPRSO, BANCOPFCADO, BANCOPFCASO, '
               + '          BANCOPFFEDO, BANCOPFFESO, BANCOPFLEDO, BANCOPFLESO, '
               + '          BANCOPFPRDO, BANCOPFPRSO, BANCOPLLEDO, BANCOPLLESO, '
               + '          BCOTIPCTA, CUENTAID, REMESAID, CTADIFP, CTADIFG, CPTODIFP, '
               + '          CPTODIFG, TMONID, CPTOID, BANCOPRF, CCOSDIF, CLAUXID, AUXID, '
               + '          EQUBANOFI, FLAVIGPRE, FLAHISPRE, FLAVIGCOB, CCBCOIDPRE, BCODIR, '
               + '          BCOSEC, MONMAXCIE, FLACAJCHI '
               + '     from TGE105 '
               + '    where BANCOPRF=' + quotedstr('BN-');
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest(xSQL);
            DMTE.cdsQry.open;
            wGiradoDTR := trim(DMTE.cdsQry.FieldbyName('BANCONOM').AsString) + '/';
            xTotal := DMTE.cdsEgrCaja.FieldbyName('ECMTOLOC').AsFloat;
         End
         Else
         Begin
            wGiradoDTR := '';
         End;
         wECCHQEMI := DMTE.cdsEgrCaja.FieldbyName('ECCHQEMI').AsString;
      // se carga variable para realizar el UPDATE despues de emitido el Cheque
         xSQL := 'Update CAJA302 '
            + '      set ECCHQEMI=''S'' '
            + '    where CIAID=''' + dblcCia.text + ''' '
            + '      and TDIARID=''' + dblcTDiario.text + ''' '
            + '      and ECANOMM=''' + edtPeriodo.text + ''' '
            + '      and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
         wCtaCteBCO := dblcCCBcoDTR.Text
      End;

      If WECCHQEMI <> 'S' Then
      Begin
         DMTE.RecuperarDatos('TGE106', '*', 'BANCOID=''' + DMTE.cdsEgrCaja.FieldbyName('BANCOID').AsString + ''' '
            + 'AND CCBCOID=''' + DMTE.cdsEgrCaja.FieldbyName('CCBCOID').AsString + '''');
         ArchivoReporte := DMTE.cdsRec.fieldbyname('CCFMTCHQ').ASString;
         If ArchivoReporte = '' Then
            ArchivoReporte := 'ChqDefault.rtm';
         With strChq Do
         Begin
            ppFileName := ArchivoReporte;
            ppGiradoA := wGiradoDTR + dbeGiradoA.Text;
            ppImporte := floattostrf(strtocurr(Floattostr(xTotal)), fffixed, 10, 2);
            ppMontoLetras := strNum(xTotal);
            ppDia := strDia(dbdtpFEmis.Date);
            ppmes := strMes(dbdtpFEmis.Date);
            ppAno := strAno(dbdtpFEmis.Date);
            If wCtaCteBCO <> '0100001518' Then
               ppRuc := 'RUC :' + xRUCCIA;
         End;
         DMTE.xFlagP := False;
         FRegistro.EmiteChq(ArchivoReporte, strChq);
         If DMTE.xFlagP Then
         Begin
           //////////////////////////////////////////////////////////////////
           // aqui se realiza el UPDATE de la variable cargada anteriomente
           // se marca con 'S' el ECCHQEMI
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
           //////////////////////////////////////////////////////////////////
         End;
         //**
      End
      Else
         Showmessage('Cheque ya fue impreso');
   End
   Else
   Begin
      Showmessage('No ha seleccionado Cuenta Corriente');
   End;
   xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, CLAUXID, PROV, PROVRUC, ECFCOMP, '
      + '          ECFEMICH, ECFPAGOP, ECFCOBCH, FPAGOID, DOCID, ECNODOC, TMONID, ECTCAMB, '
      + '          ECMTOORI, ECMTOLOC, ECMTOEXT, BANCOID, CCBCOID, ECNOCHQ, ECGIRA, CPTOID, '
      + '          CUENTAID, ECGLOSA, ECLOTE, ECELABO, ECAPROB, ECESTADO, ECCONTA, ECUSER, '
      + '          ECFREG, ECHREG, ECANO, ECMM, ECDD, ECSS, ECSEM, ECTRI, ECAASS, ECAASEM, '
      + '          ECAATRI, FLAGVAR, EC_PROCE, ECOPAGO, TDIARIO2, ECNOCOMP2, ECANOMM2, EC_IE, '
      + '          ECCHQEMI, USERRESP, EQUIID, ECCHKEST, ECPERNDOC, ECPERREC, TIPDOCCOD, '
      + '          PERID, ECFENTR, ECCONSOLID, ECMTCON, ECFCV, ECCOBLOC, ECMTDIF, ECCOBEXT, '
      + '          ECDEVLOC, ECDEVEXT, FEXTCHQ, FLUEID, ECCONING, ECNOREPO, CLAUXID1, AUXID, '
      + '          PROV1, CCBCOVOUCH, PRVBANCOID, PRVCCBCOID, ECSALMN, ECSALME, CAJARETIGV, '
      + '          FDOFIJJUST, GCONCID, TIPDET, ECNOCOMPR, CNTCOMPROB, KEYVALE, FLGREN '
      + '     from CAJA302 A '
      + '    where A.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
      + '      and A.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
      + '      and A.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
      + '      and A.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString);
   DMTE.cdsEgrCaja.Close;

   DMTE.cdsEgrCaja.Filter := '';
   DMTE.cdsEgrCaja.Filtered := False;
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest(xSQL);
   DMTE.cdsEgrCaja.Open;

   xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, TDIARID2, CPANOMM, PROV, PROVRUC, '
      + '          CPNOREG, DOCID2, CPSERIE, CPNODOC, TMONID, DETCDOC, DETCPAG, DEDH, '
      + '          DEMTOORI, DEMTOLOC, DEMTOEXT, DESALLOC, DESALEXT, CPTOID, CUENTAID, '
      + '          CCOSID, CPFEMIS, CPFVCMTO, DEUSER, DEFREG, DEHREG, DEANO, DEMM, DEDD, '
      + '          DESS, DESEM, DETRI, DEAASS, DEAASEM, DEAATRI, FLAGVAR, DEANTMN, DEANTME, '
      // Inicio HPC_201703_CAJA
      // Validación SEMT para proveedores con cobranza coactiva
      //      + '          CLAUXID, ECNOREPO, PROVDES, TIPDET, ECNOCOMPR, CIAID2, CNTCOMPROB '
      + '          CLAUXID, ECNOREPO, PROVDES, TIPDET, ECNOCOMPR, CIAID2, CNTCOMPROB, NVL(VALPAGPRO,''N'') VALPAGPRO '
      // Final HPC_201703_CAJA
      + '     from CAJA303 A '
      + '    where A.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
      + '      and A.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
      + '      and A.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
      + '      and A.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   DMTE.cdsDocPago.Close;
   DMTE.cdsDocPago.DataRequest(xSQL);
   DMTE.cdsDocPago.Open;
   DMTE.cdsDocPago.EnableControls;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.bbtnCHClick(Sender: TObject);
Begin
   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' Then
   Begin
      dbeCH.Text := DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString;
      pnlCH.Visible := True;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.bbtnGrabaChequeClick(Sender: TObject);
Var
   xSQL: String;
Begin
   DMTE.cdsEgrCaja.Edit;
   DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString := dbeCH.Text;
   DMTE.cdsEgrCaja.Post;

   xSigueGrab := True;
   DMTE.DCOM1.AppServer.IniciaTransaccion;
   xSQL := 'Update CAJA302 '
      + '      Set ECNOCHQ=' + quotedstr(dbeCH.Text)
      + '    where CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
      + '      and ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
      + '      and TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
      + '      and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al intentar actualizar el Número de Cheque');
      DMTE.DCOM1.AppServer.RetornaTransaccion;
      Exit;
   End;
   DMTE.DCOM1.AppServer.GrabaTransaccion;

   dbeNoChq.Text := DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString;
   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' Then
      z2bbtnContClick(Self);
   pnlCH.Visible := False;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.bbtnCanCHClick(Sender: TObject);
Begin
   pnlCH.Visible := False;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.dbeCHExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSql := 'CIAID=' + quotedstr(dblcCia.text) + ' AND TDIARID=' + quotedstr(dblcTDiario.text) + ' and '
      + 'ECNOCOMP<>' + quotedstr(dbeNoComp.Text) + ' and '
      + 'CCBCOID=' + quotedstr(dblcCCBco.Text) + ' AND ECNOCHQ=' + quotedstr(dbeCh.text);

   DMTE.DisplayDescrip('prvTGE', 'CAJA302', 'ECNOCHQ,ECESTADO,ECELABO', xsql, 'ECNOCHQ');
   If DMTE.cdsQry.FieldByName('ECNOCHQ').AsString <> '' Then
   Begin
      If DMTE.cdsQry.FieldByName('ECESTADO').AsString <> 'A' Then
      Begin
         showmessage('El número de Cheque ya fue Utilizado');
         dbeCh.Text := '';
         dbeCh.SetFocus;
      End
      Else
      Begin
         If DMTE.cdsQry.FieldByName('ECELABO').AsString = 'NULO' Then
         Begin
            showmessage('El número de Cheque ya fue Utilizado');
            dbeCh.Text := '';
            dbeCh.SetFocus;
         End
      End;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal2.fg_AtualizaNComprob(wgCompania, wgTdiario, wgPeriodo, wgNumero: String);
Var
   xSQL: String;
Begin
   xSQL := ' Update CAJA303 '
      + '       set CNTCOMPROB = ECNOCOMP '
      + '     where CIAID = ' + QuotedStr(wgCompania)
      + '       and TDIARID = ' + QuotedStr(wgTdiario)
      + '       and ECANOMM = ' + QuotedStr(wgPeriodo)
      + '       and ECNOCOMP = ' + QuotedStr(wgNumero);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error en la actualización Contable (fg_AtualizaNComprob - CAJA303)');
      xSigueGrab := False;
      Exit;
   End;

   xSQL := ' Update CAJA304 '
      + '       set CNTCOMPROB = ECNOCOMP '
      + '     where CIAID = ' + QuotedStr(wgCompania)
      + '       and TDIARID = ' + QuotedStr(wgTdiario)
      + '       and ECANOMM = ' + QuotedStr(wgPeriodo)
      + '       and ECNOCOMP = ' + QuotedStr(wgNumero);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error en la actualización Contable (fg_AtualizaNComprob - CAJA304)');
      xSigueGrab := False;
      Exit;
   End;
End;

{******************************************************************************}

Function TFPagoGlobal2.fg_VerificaDatosDetraccion(wgClauxid, wgProv, wgDocId, wgSerie, wgNoDoc: String): Boolean;
Var
   xSQL: String;
Begin
   xSQL := ' Select CPTODETRSUNATID, TIPOOPERSUNATID '
      + '      from CXP301 '
      + '     where DTRPORC > 0 '
      + '       and CLAUXID =  ' + QuotedStr(wgClauxid)
      + '       and PROV = ' + QuotedStr(wgProv)
      + '       and DOCID =  ' + QuotedStr(wgDocId)
      + '       and CPSERIE = ' + QuotedStr(wgSerie)
      + '       and CPNODOC = ' + QuotedStr(wgNoDoc)
      + '       and CPESTADO IN (' + QuotedStr('P') + ',' + QuotedStr('C') + ') ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;

// Si no hay registros con esta condición se entiende que no hay detracción
   If DMTE.cdsQry.RecordCount = 0 Then
   Begin
      Result := True;
      Exit;
   End;

// Si hay registros, entonces es una Provisión con Detracción
// Valida que tenga el Concepto de Detracción
   If (Length(DMTE.cdsQry.FieldByName('CPTODETRSUNATID').AsString) = 0) Then
   Begin
      ShowMessage('Error en la Provisión del Documento:' + wgSerie + '-' + wgNoDoc + #13 +
         'Debe ingresar un valor en el campo Tipo de Detracción');
      Result := False;
      Exit;
   End;

// Valida que tenga el Tipo de Operación de la Detracción
   If (Length(DMTE.cdsQry.FieldByName('TIPOOPERSUNATID').AsString) = 0) Then
   Begin
      ShowMessage('Error en la Provisión del Documento:' + wgSerie + '-' + wgNoDoc + #13 +
         'Debe ingresar un valor en el campo Tipo de Operación');
      Result := False;
      Exit;
   End;
// Si llega a este punto los datos de la Detracción de la Provisiíon están correctos   
   Result := True;
End;

{******************************************************************************}

Function TFPagoGlobal2.VConceptoDetrac(vCiaid, vTdiarid, vDcpAnomm, vCpNoreg: String): String;
Var
   xSql: String;
Begin
   xSql := ' Select A.CIAID, A.CPANOMES, A.TDIARID, A.CPNOREG, '
      + '           A.CLAUXID, A.PROV, A.PROVRUC, A.DOCID, A.CPSERIE,'
      + '           A.CPNODOC, A.CPFRECEP, A.CPFEMIS, A.CPFVCMTO, '
      + '           A.TMONID, A.CPTCAMPR, A.CPTCAMPA, A.CPESTADO, '
      + '           A.CPOCOMP, A.CP_CONTA, A.CPGRAVAD, '
      + '           A.CPNOGRAV, A.CPIGV, A.CPISC, A.CPDCTO, A.CPSERVIC, '
      + '           A.CPMTOORI, A.CPMTOLOC, A.CPMTOEXT, A.CPPAGORI, '
      + '           A.CPPAGLOC, A.CPPAGEXT, A.CPSALORI, A.CPSALLOC, '
      + '           A.CPSALEXT, A.TCANJEID, A.CPCANJE, A.CPFCANJE, '
      + '           A.CPUSER, A.CPFREG, A.CPHREG, A.CPAAAA, A.CPMM, '
      + '           A.CPDD, A.CPTRI, A.CPSEM, A.CPSS, A.CPAATRI, '
      + '           A.CPAASEM, A.CPAASS, A.CPFCMPRB, A.DCPLOTE, '
      + '           A.DCPCOMP, A.CTATOTAL, A.FLAGVAR, A.CPTOTOT, '
      + '           A.CPIGV2, A.CPGRAVAD2, A.CPHMOD, A.FLAGVAR2, '
      + '           A.PROVDES, A.CLAUXREND, A.AUXIDREND, A.CCBCOID, '
      + '           A.BANCOID, A.SITUAID, A.CPFLAGTDOC, A.CXPRRHH, '
      + '           A.AUXIDINTER, A.CLAUXINTER, A.CPTCAMDOL, '
      + '           A.PROVRETIGV, A.CPTCAMAJ, A.DTRPORC, A.CPMTOORIB, A.DTRFLAG, A.FECDEPDET, '
      + '           A.NUMDEPDET, A.ADQ_NO_GRAV, A.IGV_GRA_NO_DEST, A.CP_OTROS, A.CPTODETRSUNATID, '
      + '           A.TIPOOPERSUNATID, A.PORCDESC, A.CP4TAPENSION, A.SNPAFPID, A.TIPCOMAFPID, '
      + '           nvl(B.TIENE_DETRAC,''N'') TIENE_DETRAC '
      + '      from CXP301 A, '
      + '          (Select case when CXP201.DTRPORC>0 then ''S'' else ''N'' end TIENE_DETRAC '
      + '             from CXP302,CXP201 '
      + '            where CXP302.CIAID=''' + vCiaid + ''' '
      + '              and CXP302.TDIARID=''' + vTdiarid + ''' '
      + '              and CXP302.DCPANOMM=''' + vDcpAnomm + ''' '
      + '              and CXP302.CPNOREG=''' + vCpNoreg + ''' '
      + '              and CXP302.TIPDET IN (''MG'',''MN'',''NG'') '
      + '              and CXP201.CPTOID=CXP302.CPTOID '
      + '          ) B '
      + '     where A.CIAID=''' + vCiaid + ''' '
      + '       and A.CPANOMES=''' + vDcpAnomm + ''' '
      + '       and A.TDIARID=''' + vTdiarid + ''' '
      + '       and A.CPNOREG=''' + vCpNoreg + ''' ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSql);
   DMTE.cdsQry.Open;
   Result := DMTE.cdsQry.FieldByName('TIENE_DETRAC').Asstring
End;

{******************************************************************************}

// Determina si el Proveedor esta habilitado para Retención
Function TFPagoGlobal2.ProveedorRetiene(vProv: String): String;
Var
   xsql: String;
Begin
   xsql := ' Select PROVRETIGV '
      + '      from TGE201 '
      + '     where PROV=''' + vProv + ''' '
      + '       and nvl(PROVRETIGV,''N'')=''S'' '
      + '       and nvl(ACTIVO,''N'')=''S'' '
      + '    Union all '
      + '    Select PROVRETIGV '
      + '      from CNT201 '
      + '     where AUXID=''' + vProv + ''' '
      + '       and nvl(PROVRETIGV,''N'')=''S'' '
      + '       and nvl(ACTIVO,''N'')=''S'' ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSql);
   DMTE.cdsQry.Open;
   If DMTE.cdsQry.RecordCount > 0 Then
      Result := 'S'
   Else
      Result := 'N';
End;

{******************************************************************************}

Procedure TFPagoGlobal2.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Checked := Not cbDisenoRep.Checked;
   xDisenoImp := cbDisenoRep.Checked;
End;

{******************************************************************************}

procedure TFPagoGlobal2.GeneraTxtRetElec(wSerie, wNumero: String);
var
   xSQL: String;
   xfArchivoTexto: TextFile;
   xsNombreTxt, xCarpeta, xsClave, xTDocSunat : String;
begin
// Resolviendo ID de Envio
   xsClave :=  dblcCia.text + DMTE.wUsuario + DMTE.wUsuario;

// Resolviendo último número de Envio
   xSQL := 'Select max(NUMENVRET) NUMENVRET '
         + '  from db2admin.CAJA_CERT_RETIGV '
         + ' where CODRETIGV = '+QuotedStr(xsClave);
   DMTE.cdsQry4.Close;
   DMTE.cdsQry4.DataRequest(xSQL);
   DMTE.cdsQry4.Open;
{
// Resolviendo Tipo de Documento Sunat
   xSQL := 'Select TDOC_SUNAT '
      + '  From db2admin.TGE110 '
      + '  Where DOCID = ' +QuotedStr(dblcTdoc.text);
   DMTE.cdsQry6.Close;
   DMTE.cdsQry6.DataRequest(xSQL);
   DMTE.cdsQry6.Open;

   xTDocSunat := DMFAC.cdsQry6.FieldByName('TDOC_SUNAT').AsString;
}
// Resolviendo Carpeta para Archivo
   xSQL := 'Select RUTADES '
      + '     From db2admin.TGE837 '
      + '    Where APLIC = ' +QuotedStr('RET')
      + '      and RUTAID = ' +QuotedStr(wId_Rutadest);
   DMTE.cdsQry6.Close;
   DMTE.cdsQry6.DataRequest(xSQL);
   DMTE.cdsQry6.Open;

   xCarpeta := DMTE.cdsQry6.FieldByName('RUTADES').AsString;
// Inicio HPC_201801_CAJA
// Se cambia el número de cdsQry7 debido a que se cruza
// Seleccionando Registros para escribir en Txt
   xSQL := 'Select NUMDETLIN, DESDETLIN '
      +    '  from db2admin.CAJA_CERT_RETIGV '
      +    ' where CODRETIGV   = ' +QuotedStr(xsClave)
      +    '   and NUMENVRET  = ' +inttostr(DMTE.cdsQry4.FieldByName('NUMENVRET').AsInteger);
   DMTE.cdsQry7.Close;
   DMTE.cdsQry7.DataRequest(xSQL);
   DMTE.cdsQry7.Open;
   DMTE.cdsQry7.IndexFieldNames := 'NUMDETLIN';

   xsNombreTxt := xCarpeta+'RE_'+DMTE.wUsuario+'_'+DMTE.wUsuario+'.txt';
   AssignFile(xfArchivoTexto, xsNombreTxt);
   Rewrite(xfArchivoTexto);

   DMTE.cdsQry7.First;
   while not DMTE.cdsQry7.EOF do
   Begin
      WriteLn(xfArchivoTexto, DMTE.cdsQry7.FieldByName('DESDETLIN').AsString);
      DMTE.cdsQry7.Next;
   End;
// Fin HPC_201801_CAJA
   CloseFile(xfArchivoTexto);

end;

// Inicio HPC_201605_CAJA
procedure TFPagoGlobal2.bbtnImpDestClick(Sender: TObject);
begin
   pnlImprDest.visible := False;
   DMTE.wsSerieRetIGV := '';
   DMTE.wsNumRetIGV := '';
   xSigueGrab := True;
//   DMTE.xRetencion := DMTE.CalculaRetencionIGVGlobal;
   DMTE.CalculaRetencionIGVGlobal;
   If xSigueGrab then
   Begin
      GeneraTxtRetElec(DMTE.wsSerieRetIGV, DMTE.wsNumRetIGV);
      ShowMessage('Archivo fue Enviado a Sunat');
   End;
end;
// Fin HPC_201605_CAJA

procedure TFPagoGlobal2.bbtnImpDestCancClick(Sender: TObject);
begin
   pnlImprDest.visible := False;
   ShowMessage('No se continuará con la ACEPTACIÓN del Voucher');
   xSigueGrab := False;
   Exit;
end;

procedure TFPagoGlobal2.SelecImpresDest;
Var
   xSQL, xImpdefault, xCiaId  : String;
begin
   wIP_Impresora := '';
   xCiaId := '';
   xSQL := 'Select TIE_ID, PVTA_ID '
         + '  From db2admin.fac206 t '
         + '  Where CIAID  = ' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
         + '   And  USERID = ' + QuotedStr(DMTE.wUsuario) ;

   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;

   xCiaId := '02';
   xTienda := '01';
   xPVenta := '02';
//   xTienda := DMTE.cdsQry.FieldByName('TIE_ID').AsString;
//   xPVenta := DMTE.cdsQry.FieldByName('PVTA_ID').AsString;
// Resolviendo Impresora de Destino(Default)
   xSQL := 'Select T.IMP_ID, T.IMP_DES, T.IMP_IP, T.IMP_RUTAID '
         + '  From db2admin.FAC_FE_IMPR t, DB2ADMIN.FAC_FE_PVTA r '
         + '  Where r.CIAID   = ' + QuotedStr(xCiaid)
         + '   And  r.TIE_ID  = ' + QuotedStr(xTienda)
         + '   And  r.PVTA_ID = ' + QuotedStr(xPVenta)
         + '   And  t.IMP_ID  = r.IMP_ID '
         + '   And  nvl(t.IMP_ACTIVO,''N'')=''S'' ' ;
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;
   xImpdefault   := DMTE.cdsQry.FieldByName('IMP_DES').AsString;
   wIP_Impresora := DMTE.cdsQry.FieldByName('IMP_IP').AsString;
   wId_Rutadest  := DMTE.cdsQry.FieldByName('IMP_RUTAID').AsString;

// Carga Todas las Impresoras de Tienda
   xSQL := 'Select R.IMP_ID, R.IMP_DES, R.IMP_IP, R.IMP_RUTAID '
         + '  From DB2ADMIN.FAC_FE_PVTA T, DB2ADMIN.FAC_FE_IMPR R  '
         + '  Where T.CIAID   = ' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
         + '   And  T.TIE_ID  = ' + QuotedStr(xTienda)
         + '   And  R.IMP_ID  = T.IMP_ID '
         + '   And  nvl(R.IMP_ACTIVO,''N'')=''S'' ' ;
   DMTE.cdsQry5.Close;
   DMTE.cdsQry5.DataRequest(xSQL);
   DMTE.cdsQry5.Open;
   DMTE.cdsQry5.IndexFieldNames :=  'IMP_DES';
   dblcdImpDest.text := xImpdefault;

 //  pnlImprDest.visible := True;
end;
// Inicio HPC_201703_CAJA
// Validación SEMT para proveedores con cobranza coactiva
Procedure TFPagoGlobal2.ValidacionSEMT(Datos: TDatasource; Fichero: String; Delimitador: char);
Var
   f: textfile;
   n, i: integer;
   Linea, Entero, Decimal, Cuenta, Importe, Punto, xSQL, Ruc, xCtaCte, xTmpC, xTM, xfec, xNom, xTipD: String;
   xTDoc, xNoDoc, xRuc, xRef, xDir, xDis, xPro, xDep, xContacto, xCtl, xReg: String;
   nTotal: Double;
Begin

   AssignFile(f, Fichero);
   Rewrite(f);

   With Datos.DataSet Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         xSQL := 'Select * '
               + '  from TGE201 '
               + ' where CLAUXID=''' + Datos.DataSet.FieldByName('CLAUXID').AsString + ''' '
               + '   and PROV=''' + Datos.DataSet.FieldByName('PROV').AsString + '''';
         DMTE.cdsQry.Close;
         DMTE.cdsQry.indexfieldnames := '';
         DMTE.cdsQry.DataRequest(xSQL);
         DMTE.cdsQry.Open;

// Detalle
// RUC|MONTO
         Linea := ' 1';

         If DMTE.cdsQry.FieldByname('TIPPERID').AsString = '02' Then
         Begin
            xTipD := 'RUC';
            xRuc := Copy(trim(DMTE.cdsQry.FieldByName('PROVRUC').AsString) + '            ', 1, 11);
         End
         Else
         Begin
            If Copy(DMTE.cdsQry.FieldByName('PROVRUC').AsString, 1, 2) = '10' Then
            Begin
               xTipD := 'RUC';
               xRuc := Copy(trim(DMTE.cdsQry.FieldByName('PROVRUC').AsString) + '            ', 1, 11);
            End
            Else
            Begin
               xTipD := '   ';
               If DMTE.cdsQry.FieldByname('TIPDOCID').AsString = '01' Then xTipD := 'DNI';
               If DMTE.cdsQry.FieldByname('TIPDOCID').AsString = '04' Then xTipD := 'CE ';
               If DMTE.cdsQry.FieldByname('TIPDOCID').AsString = '07' Then xTipD := 'PAS';
               xRuc := Copy(trim(DMTE.cdsQry.FieldByName('PROVDNI').AsString) + '            ', 1, 11);
            End;
         End;

         xNom := Copy(DMTE.cdsQry.FieldByName('PROVDES').AsString + '                                        ', 1, 40);
         Importe := FormatFloat('######.#0', Datos.DataSet.FieldByName('DEMTOLOC').AsCurrency);

         Linea := xRuc + '|' + Importe;

         Memo1.Lines.Add(Linea);
         writeln(f, Linea);
         Next;
      End;
      EnableControls;
   End;

   CloseFile(f);
   MessageDlg(' Archivo Validación SEMT se generó con éxito ', mtInformation, [mbOk], 0);

End;
// Final HPC_201703_CAJA
// Inicio HPC_201703_CAJA
// Validación SEMT para proveedores con cobranza coactiva
procedure TFPagoGlobal2.cbTodosClick(Sender: TObject);
begin
    DMTE.cdsDocPago.First;
    if DMTE.cdsDocPago.RecordCount >0 then
    begin                 
       if cbtodos.Checked = true then
       begin
          While Not DMTE.cdsDocPago.Eof Do
          Begin
            Try
               DMTE.cdsDocPago.Edit;
               DMTE.cdsDocPago.FieldByName('VALPAGPRO').AsString:='S';
               DMTE.cdsDocPago.ApplyUpdates(0);
            Except
               ShowMessage('Error en la actualización del registro en la cabecera..');
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               Exit;
            End;
            DMTE.cdsDocPago.Next;
          end;
       end
       else
       begin
          While Not DMTE.cdsDocPago.Eof Do
          Begin
            Try
               DMTE.cdsDocPago.Edit;
               DMTE.cdsDocPago.FieldByName('VALPAGPRO').AsString:='N';
               DMTE.cdsDocPago.ApplyUpdates(0);
            Except
               ShowMessage('Error en la actualización del registro en la cabecera..');
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               Exit;
            End;
            DMTE.cdsDocPago.Next;
          End;
       end;
    end
    else
    begin
        cbtodos.Checked := false;
        ShowMessage('No existe detalle para validar al SEMT de la Orden de Pago');
    end;

end;
// Final HPC_201703_CAJA
// Inicio HPC_201703_CAJA
// Validación SEMT para proveedores con cobranza coactiva
procedure TFPagoGlobal2.FormActivate(Sender: TObject);
begin
   If DMTE.cdsDocPago.Recordcount >0 then
   Begin
       dbgDocPago.Selected.Clear;
       dbgDocPago.Selected.Add('CIAID2'#9'2'#9'Cía~Orig'#9'F');
       dbgDocPago.Selected.Add('CPANOMM'#9'6'#9'Periodo'#9'F');
       dbgDocPago.Selected.Add('DOCID2'#9'2'#9'Doc'#9'F');
       dbgDocPago.Selected.Add('CPSERIE'#9'4'#9'Serie'#9'T');
       dbgDocPago.Selected.Add('CPNODOC'#9'10'#9'No.~Documento'#9'T');
       dbgDocPago.Selected.Add('CPFVCMTO'#9'10'#9'Fecha~Vencimiento'#9'F');
       dbgDocPago.Selected.Add('TMONID'#9'2'#9'T.M'#9'F');
       dbgDocPago.Selected.Add('DEMTOORI'#9'8'#9'Total'#9'T');
       dbgDocPago.Selected.Add('DETCPAG'#9'6'#9'Tipo~Cambio'#9'T');
       dbgDocPago.Selected.Add('DESALLOC'#9'8'#9'Saldo Mon.~Local'#9'T');
       dbgDocPago.Selected.Add('DESALEXT'#9'8'#9'Saldo Mon.~Extranjera'#9'T');
       dbgDocPago.Selected.Add('DEMTOLOC'#9'8'#9'A Pagar ~Mon. Local'#9'F');
       dbgDocPago.Selected.Add('DEMTOEXT'#9'8'#9'A Pagar ~Mon. Extranj.'#9'F');
       dbgDocPago.Selected.Add('VALPAGPRO'#9'3'#9'SEMT.~    '#9'F');
       dbgDocPago.SetControlType('VALPAGPRO', fctCheckBox,'S;N');
   End;
end;
// Final HPC_201703_CAJA

// Inicio HPC_201704_CAJA
// Nueva rutina para obtener la data para la validacion SEMT
Procedure TFPagoGlobal2.ValidacionSEMT_CargaData;
Var
   xSQL: String;

Begin

   xSQL := 'Select CLAUXID, PROV, SUM(DEMTOLOC) AS DEMTOLOC'
      + '     from CAJA303 '
      + '    where CIAID=' + quotedstr(dblcCia.Text)
      + '      and ECANOMM=' + quotedstr(edtPeriodo.Text)
      + '      and TDIARID=' + quotedstr(dblcTDiario.Text)
      + '      and ECNOCOMP=' + quotedstr(dbeNoComp.Text)
      + ' group by CLAUXID, PROV '
      + ' having   SUM(DEMTOLOC) > 3500 '
		  + ' order by PROV';
// Inicio HPC_201801_CAJA
// Se cambia los Cds debido a que genera conflicto
   DMTE.cdsQry8.Close;
   DMTE.cdsQry8.DataRequest(xSQL);
   DMTE.cdsQry8.Open;
// Fin HPC_201801_CAJA

End;
// Fin HPC_201704_CAJA

End.


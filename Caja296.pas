Unit Caja296;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   Caja296
// Formulario           :   FPagoGlobal
// Fecha de Creación    :
// Autor                :   Equipo de Sistemas
// Objetivo             :   Pago de documentos provisionados

// Actualizaciones      :
// HPP_201108_CAJA  28/12/2011  No contabiliza la detracción.
// HPC_201401_CAJA  11/05/2014  Se adiciona una condicion para que no cobre RETENCION SI EL CONCEMPTO DEL DOCUMENTO ES PARA DETRACCION
//                              asi el monto no sea >=700 no debe cobrar RETENCION
// HPC_201403_CAJA  29/08/2014  cambia control de diseño de reporte y
//                              generacion de retencion IGV con abono de Notas de Crédito.
// HPC_201405_CAJA   26/11/2014 Se redondeo a dos digitos la sumatoria y se mueve la validacion por  importe 

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
   StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
   wwdbdatetimepicker, wwdblook, ExtCtrls, Db, Wwdatsrc, DBClient, wwclient,
   ComCtrls, Tabnotbk, CAJADM, Menus, Wwlocate, wwDialog, Wwfltdlg, wwidlg,
   ppVar, ppCtrls, ppBands, ppPrnabl, ppClass, ppCache, ppDB, ppDBPipe,
   ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppMemo, oaContabiliza,
   Wwkeycb, ppEndUsr, ppModule, daDatMod, Variants;

Type
   TFPagoGlobal = Class(TForm)
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
      bbtnImpDet: TBitBtn;
      bbtnChqDet: TBitBtn;
      bbtnCH: TBitBtn;
      pnlCH: TPanel;
      Label21: TLabel;
      dbeCH: TwwDBEdit;
      bbtnGra: TBitBtn;
      bbtnCanCH: TBitBtn;
      Label27: TLabel;
      dbeOrigen: TwwDBEdit;
    cbDisenoRep: TCheckBox;
    sbDisenoRep: TSpeedButton;
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
      Procedure Button1Click(Sender: TObject);
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
      Procedure bbtnGraClick(Sender: TObject);
      Procedure bbtnCanCHClick(Sender: TObject);
      Procedure dbeCHExit(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);

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
      xErrorGraba: boolean;
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
   Public
  { Public declarations }
      sFlagAbono: String;
      wCptoGan,
         wCptoPer,
         wCtaGan,
         wCtaPer: String;
      wCCosDif: String;
      //Inicio HPC_201401_CAJA
      vYanoRetencion : String;
      //Final HPC_201401_CAJA
      Procedure Adiciona;
      Procedure Edita(cds: Twwclientdataset);
      Procedure AsignaCDSFiltro(cds: TwwClientDataset);
      Procedure AsientoDifTotal;
      Procedure ContabCierra;
      Procedure Contabiliza;
      Procedure ContabilizaProc1;
      Procedure ContabilizaProc2;
      Procedure Detraccion;
      Procedure fg_AtualizaNComprob(wgCompania, wgTdiario, wgPeriodo, wgNumero: String);
      Function  fg_VerificaDatosDetraccion(wgClauxid, wgProv, wgDocId, wgSerie, wgNoDoc: String): Boolean;
      //INICIO HPC_201401_CAJA
      //Verifica si el concepto esta sujetoa detraccion ya no debe descontar retencion porqie debe ser un servicio
      Function VConceptoDetrac(vCiaid,vTdiarid,vDcpAnomm,vCpNoreg:String):String;
      Function ProveedorRetiene(vProv:String): String;
      //FINAL  HPC_201401AJA
   End;
Var
   FPagoGlobal: TFPagoGlobal;
   wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado, wbChq,
      wbcancel2: Boolean;
   wModifica, wCiaRetIGV: Boolean;
   wModo: String;
   wBcoTipCta: String;
   wDocModulo: String;
Implementation

Uses CAJAUTIL, Caja290, oaTE2000;

{$R *.DFM}

Procedure TFPagoGlobal.IniciaDatos;
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
   xSQL := 'Select * '
         + '  from CAJA303 '
         + ' Where CIAID='''' and ECANOMM='''' '
         + '   and TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsDocPago.Close;
   DMTE.cdsDocPago.DataRequest(xSQL);
   DMTE.cdsDocPago.Open;

   xSQL := 'Select * '
          +'  from CAJA301 '
          +' Where CIAID='''' and ECANOMM='''' '
          +'   and TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsRegCxP.Close;
   DMTE.cdsRegCxP.DataRequest(xSQL);
   DMTE.cdsRegCxP.Open;

   z2bbtnOkCab.Enabled := True;
End;

Procedure TFPagoGlobal.dblcCiaExit(Sender: TObject);
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
      xSQL := 'select A.CPTOID, A.CPTODES, A.CUENTAID, FCTZ '
             +'  From CAJA201 A '
             +' Where A.CPTOIS=''E'' '
             +'   and Exists (Select CUENTAID '
             +'                 from TGE202 B '
             +'                where A.CUENTAID=B.CUENTAID AND B.CTAACT=''S'' '
             +'                  and B.CIAID=''' + dblcCia.Text + ''') '
             +' order by A.CPTOID';
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

Procedure TFPagoGlobal.dbdtpFCompExit(Sender: TObject);
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

Procedure TFPagoGlobal.dblcTDiarioExit(Sender: TObject);
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

Procedure TFPagoGlobal.z2bbtnOKClick(Sender: TObject);
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
      DMTE.cdsMovCxP.IndexFieldNames:='';
      DMTE.cdsMovCxP.close;
      DMTE.cdsMovCxP.DataRequest('SELECT * FROM CXP301 WHERE CIAID=''''');
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

   If dblcClase.Enabled Then
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
         xSQL := 'SELECT * FROM CXP301 WHERE ';
         xWhere := 'CPESTADO=''' + 'P' + ''' and ' +
            'CLAUXID=''' + dblcClase.Text + ''' and ' +
            'PROV=''' + dblcdAux.Text + '''';
         xUnion := ' UNION ALL SELECT * FROM CXP309 WHERE ';

         xFiltro := ' (((CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR ' +
            '   ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) ';

         xSQL := xSQL + xWhere + ' order by CPANOMES DESC, DOCID, CPSERIE, CPNODOC';
         DMTE.cdsMovCxP.IndexFieldNames:='';
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

Procedure TFPagoGlobal.z2bbtnCancelClick(Sender: TObject);
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

Procedure TFPagoGlobal.z2bbtnCalcClick(Sender: TObject);
Begin
   WinExec('calc.exe', 1); //Activa la calculadora del Windows
End;
{******************************************************************************}

Procedure TFPagoGlobal.z2bbtnSumatDocPagoClick(Sender: TObject);
Var
   xTSalLoc, xTSalExt, xTPagLoc, xTPagExt: Real;
   xRegAct: TBookMark;
Begin
   With DMTE Do
   Begin
   // Totales de Documentos pagados
      cdsDocPago.DisableControls;
      xRegAct := cdsDocPago.GetBookmark;
      xTSalLoc := 0;
      xTSalExt := 0;
      xTPagLoc := 0;
      xTPagExt := 0;
      cdsDocPago.First;
      While Not cdsDocPago.Eof Do
      Begin
         xTSalLoc := xTSalLoc + DMTE.FRound(cdsDocPago.FieldByName('DESALLOC').AsFloat, 15, 2);
         xTSalExt := xTSalExt + DMTE.FRound(cdsDocPago.FieldByName('DESALEXT').AsFloat, 15, 2);
         xTPagLoc := xTPagLoc + DMTE.FRound(cdsDocPago.FieldByName('DEMTOLOC').AsFloat, 15, 2);
         xTPagExt := xTPagExt + DMTE.FRound(cdsDocPago.FieldByName('DEMTOEXT').AsFloat, 15, 2);
         cdsDocPago.Next;
      End;

      dbgDocPago.ColumnByName('CPNODOC').FooterValue := '';
      dbgDocPago.ColumnByName('CPFVCMTO').FooterValue := '';
      If cdsDocPago.RecordCount > 0 Then
      Begin
         dbgDocPago.ColumnByName('CPNODOC').FooterValue := 'Total Docs.:';
         dbgDocPago.ColumnByName('CPFVCMTO').FooterValue := floattostrf(cdsDocPago.RecordCount, ffNumber, 5, 0);
      End;
      dbgDocPago.ColumnByName('DESALLOC').FooterValue := floattostrf(xTSalLoc, ffNumber, 10, 2);
      dbgDocPago.ColumnByName('DESALEXT').FooterValue := floattostrf(xTSalExt, ffNumber, 10, 2);
      dbgDocPago.ColumnByName('DEMTOLOC').FooterValue := floattostrf(xTPagLoc, ffNumber, 10, 2);
      dbgDocPago.ColumnByName('DEMTOEXT').FooterValue := floattostrf(xTPagExt, ffNumber, 10, 2);
      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);


      cdsDocPago.EnableControls;
   End;
End;
{******************************************************************************}

Procedure TFPagoGlobal.z2bbtnSubeClick(Sender: TObject);
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

Procedure TFPagoGlobal.z2bbtnCancel2Click(Sender: TObject);
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

Procedure TFPagoGlobal.z2bbtnNuevoClick(Sender: TObject);
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

Procedure TFPagoGlobal.z2bbtnCanceladoClick(Sender: TObject);
Var
   xSQL, wMoneda, wMonto: String;
   xRetencion, xConsis: Boolean;
Begin
   cReConta := 'N';
   /////////////////////////////////////////////////////////////////////////////
   // se realiza por tratarse de DETRACCION
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
   /////////////////////////////////////////////////////////////////////////////
   If (DMTE.cdsDocPago.ChangeCount>0) Or (DMTE.cdsDocPago.Modified) Then
      If DMTE.cdsDocPago.ApplyUpdates(0)>0 then
      begin
         ShowMessage('No se pudo actualizar cdsDocPago');
         exit;
      end;


   If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'I' Then
   Begin
      If wModifica Or (DMTE.cdsDocPago.ChangeCount > 0) Or DMTE.cdsDocPago.Modified Then
      Begin
         xSQL := 'Debe grabar primero las actualizaciones realizadas';
         if wModifica then xSQL := xSQL+', wModifica está activo';
         if DMTE.cdsDocPago.ChangeCount>0 then xSQL := xSQL+', cdsDocPago.ChangeCount>0 ';
         if DMTE.cdsDocPago.Modified then xSQL := xSQL+', DMTE.cdsDocPago.Modified ';
         z2bbtnGraba.Enabled := True;
         z2bbtnGraba.SetFocus;
         Exit;
      End;

      DMTE.cdsRegCxP.DisableControls;
      ConsisCancela(xConsis);
      DMTE.cdsRegCxP.EnableControls;
      If Not xConsis Then
         ShowMessage('No se puede Cancelar el Comprobante')
      Else
      Begin
         If MessageDlg('¿Desea Efectuar la Cancelación del Comprobante?', mtConfirmation,
            [mbYes, mbNo], 0) = mrYes Then
         Begin
            ErrorCount := 0;

         // Calcula Retención del IGV
         //INICIO HPC_201401AJA
         // If xDTRPorc = 0 Then // si hay Detraccion se anula la Retencion
           //If (xDTRPorc = 0) AND (vYanoRetencion='N')  Then // si el concepto es de  Detraccion se anula la Retencion
            If xRetLoc>0 then
         //FINAL HPC_201401AJA
               xRetencion := DMTE.CalculaRetencionIGVGlobal
            Else
               xRetencion := False;
            ActMovCxP;
            ActualizaDetCanje;

          //Inicio HPC_201401_CAJA
          //dbeImporte.Text := DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString;
          //Fianl HPC_201401_CAJA

          // Fin Calcula Retencion del IGV

          ////////////////////////////////////////////////////////////////////
            // se realiza el loop por tratarse de DETRACCION
            If xDTRPorc > 0 Then
            Begin
               DMTE.cdsEgrCaja.Filter := '';
               DMTE.cdsEgrCaja.Filtered := False;
               DMTE.cdsEgrCaja.Close;
               xSQL := 'select * From CAJA302 '
                  + 'where CIAID    =' + QuotedStr(dblcCia.Text)
                  + '  and ECANOMM  =' + QuotedStr(edtPeriodo.Text)
                  + '  and TIPDET IN (''TO'',''I4'') '
                  + '  and ECNOCOMPR =' + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString);
               DMTE.cdsEgrCaja.DataRequest(xSQL);
               DMTE.cdsEgrCaja.Open;
               DMTE.cdsEgrCaja.First;
               While Not DMTE.cdsEgrCaja.Eof Do
               Begin
                  DMTE.cdsEgrCaja.Edit;
                  DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'C';
                  DMTE.cdsEgrCaja.FieldByName('ECUSER').Value := DMTE.wUsuario; // usuario que registra
                  DMTE.cdsEgrCaja.FieldByName('ECFREG').Value := DateS; // fecha que registra Usuario
                  DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time; // Hora de Registro de Usuario
                  DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString := 'N';
                  DMTE.ControlTran(0, DMTE.cdsEgrCaja, 'EGRCAJA');
                  DMTE.cdsEgrCaja.Next;
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
               cdsPost(DMTE.cdsEgrCaja);
               xSQL := 'select * From CAJA302 '
                  + 'where CIAID    =' + QuotedStr(dblcCia.Text)
                  + '  and ECANOMM  =' + QuotedStr(edtPeriodo.Text)
                  + '  and TDIARID  =' + QuotedStr(dblcTDiario.Text)
                  + '  and ECNOCOMP =' + QuotedStr(dbeNoComp.Text);
               DMTE.cdsEgrCaja.DataRequest(xSQL);
               DMTE.ControlTran(0, DMTE.cdsEgrCaja, 'EGRCAJA');
            End;
            ////////////////////////////////////////////////////////////////////

            DMTE.ControlTran(0, DMTE.cdsRegCxP, 'REGCXP');

            //Inicio HPC_201401_CAJA
            //z2bbtnSumatClick(Sender);
            //Final HPC_201401_CAJA
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

            SaldosAux;
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
                     DMTE.cdsEgrCaja.Next;
                  End;
               End
               Else
               Begin
                  DMTE.ActSaldosCaja(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, DMTE.cdsEgrCaja.FieldByName('TMONID').AsString,
                     DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
                     DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString, 'E', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
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
                        DMTE.cdsEgrCaja.Next;
                     End;
                  End
                  Else
                  Begin
                     DMTE.ActSaldosBancos(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, DMTE.cdsEgrCaja.FieldByName('TMONID').AsString,
                        DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
                        DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString, DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString,
                        'E', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
                  End;
               End;
            End;

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

            DMTE.ControlTran(8, Nil, ''); //COMMIT
         End;
      End;
   End
   Else
   Begin
      ShowMessage('No tiene el estado correcto para Cancelar');
   End;
End;

{******************************************************************************}

Function TFPagoGlobal.ValidaCampo: Boolean;
Var
   xWhere, aux: String;
Begin
   Result := True;
   With DMTE Do
   Begin

      If length(cdsRegCxP.FieldByName('CPNOREG').Value) = 0 Then
      Begin //No Registro
         ShowMessage('Falta No Registro');
         Result := False;
         exit;
      End
      Else
      Begin
         If length(cdsRegCxP.FieldByName('CPNOREG').Value) < 6 Then
         Begin
            ShowMessage('Codigo de Registro Errado');
            Result := False;
            exit;
         End;
      End;
      If length(cdsRegCxP.FieldByName('DOCID2').Value) = 0 Then
      Begin //Tipo de Documento
         ShowMessage('Falta Tipo de Documento');
         Result := False;
         exit;
      End
      Else
      Begin
         xWhere := 'DOCID=' + '''' + cdsRegCxP.FieldByName('DOCID2').Value + '''';
         aux := DisplayDescrip('prvTGE', 'TGE110', 'DOCDES', xWhere, 'DOCDES');
         If length(aux) = 0 Then
         Begin
            ShowMessage('Codigo de Tipo de Documento Errado');
            Result := False;
            exit;
         End;
      End;

      If cdsRegCxP.FieldByName('CPSERIE').Value = '' Then
      Begin //Serie
         ShowMessage('Falta Serie');
         Result := False;
         exit;
      End;

      If cdsRegCxP.FieldByName('CPNODOC').Value = '' Then
      Begin //No Documento
         ShowMessage('Falta Nro. de Documento');
         Result := False;
         exit;
      End;

      If length(cdsRegCxP.FieldByName('TMONID').Value) = 0 Then
      Begin //Tipo de Moneda
         ShowMessage('Falta Tipo de Moneda');
         Result := False;
         exit;
      End
      Else
      Begin
         xWhere := 'TMONID=' + '''' + cdsRegCxP.FieldByName('TMONID').Value + '''';
         aux := DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
         If length(aux) = 0 Then
         Begin
            ShowMessage('Codigo de Tipo de Moneda Errado');
            Result := False;
            exit;
         End;
      End;

      If cdsRegCxP.FieldByName('DETCDOC').Value <= 0 Then
      Begin // Tipo de Cambio Detalle
         ShowMessage('Tipo de Cambio debe ser mayor que cero');
         Result := False;
         exit;
      End;

      If cdsRegCxP.FieldByName('DEMTOORI').Value <= 0 Then
      Begin //Importe
         ShowMessage('Importe debe ser mayor que cero');
         Result := False;
         exit;
      End;

      If cdsRegCxP.FieldByName('CPTOID').Value = '' Then
      Begin //Concepto
         ShowMessage('Falta Concepto');
         Result := False;
         exit;
      End
      Else
      Begin // Cuenta
         aux := cdsRegCxP.FieldByName('CUENTAID').Value;
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
         If (length(cdsRegCxP.FieldByName('CCOSID').Value) = 0) Then
         Begin
            ShowMessage('Falta Centro de Costo');
            Result := False;
            exit;
         End
         Else
         Begin
            xWhere := 'CCosID=' + '''' + cdsRegCxP.FieldByName('CCOSID').Value + ''' AND CCOSACT=''S''';
            aux := DisplayDescrip('prvTGE', 'TGE203', 'CCOSDES', xWhere, 'CCosDes');
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

      If cdsRegCxP.FieldByName('CPFVCMTO').Value < cdsRegCxP.FieldByName('CPFEMIS').Value Then
      Begin //Fecha de Vencimiento
         ShowMessage('Fecha de Vencimiento debe ser posterior a la Fecha de Emisión');
         Result := False;
         exit;
      End;
   End;
End;
{******************************************************************************}

Procedure TFPagoGlobal.ConsisCancela(Var xConsis: boolean);
Var
   xRegAct: TBookMark;
   xSumImp, Suma: Double;
Begin
   xConsis := True;
   xSumImp := 0;
   With DMTE Do
   Begin
      xRegAct := cdsRegCxP.GetBookmark;
      cdsRegCxP.First;
      While Not cdsRegCxP.Eof Do
      Begin
         If cdsRegCxP.FieldByName('DEDH').Value = 'D' Then
            If cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc Then
               xSumImp := xSumImp + strToCurr(stringreplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText, ',', '', [rfReplaceAll]))
            Else
               xSumImp := xSumImp + strToCurr(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText, ',', '', [rfReplaceAll]))
         Else
            If cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc Then
               xSumImp := xSumImp - strToCurr(stringreplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText, ',', '', [rfReplaceAll]))
            Else
               xSumImp := xSumImp - strToCurr(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText, ',', '', [rfReplaceAll]));

         cdsRegCxP.Next;
      End;
      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);

   // Adicionamos el total de los Documentos Pagados
      xRegAct := cdsDocPago.GetBookmark;
      cdsDocPago.First;
      While Not cdsDocPago.Eof Do
      Begin
         If DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString = DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString Then
         Begin
            If cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc Then
               xSumImp := xSumImp + strToCurr(stringreplace(cdsDocPago.FieldByName('DEMTOLOC').DisplayText, ',', '', [rfReplaceAll]))
            Else
               xSumImp := xSumImp + strToCurr(stringReplace(cdsDocPago.FieldByName('DEMTOEXT').DisPlayText, ',', '', [rfReplaceAll]));
         End;
         cdsDocPago.Next;
      End;
      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);
   End;

// calcula los montos x retención de IGV.
// Inicio HPC_201401_CAJA
   {
   If dblcTMon.Text = DMTE.wTMonLoc Then
      xSumImp := xSumImp - CalculaRet
   Else
      xSumImp := xSumImp - DMTE.FRound((CalculaRet / DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat), 15, 2);
   }

   If dblcTMon.Text = DMTE.wTMonLoc Then
      xSumImp := xSumImp - xRetLoc
   Else
      xSumImp := xSumImp - xRetExt;

// Inicio HPC_201405_CAJA
   xSumImp := DMTE.FRound(xSumImp, 15, 2);
// Fin HPC_201405_CAJA

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
// Inicio HPC_201405_CAJA
   Suma := DMTE.FRound(Suma, 15, 2);

//   If FloatToStrF(xSumImp, ffFixed, 15, 2) <> FloatToStrF(Suma, ffFixed, 15, 2) Then
   If xSumImp<> Suma then
   Begin
      xConsis := False;
      If Suma > xSumImp Then
         ShowMessage('Suma = '+FloatToStrF(Suma, ffFixed, 15, 2)+chr(13)
                    +'SumaImp = '+FloatToStrF(xSumImp, ffFixed, 15, 2)+chr(13)
                    +'El Monto a Pagar es mayor que el Provisionado')
      Else
         ShowMessage('Suma = '+FloatToStrF(Suma, ffFixed, 15, 2)+chr(13)
                    +'SumaImp = '+FloatToStrF(xSumImp, ffFixed, 15, 2)+chr(13)
                    +'El Monto a Pagar es menor que el Provisionado');
   End;
// Fin HPC_201405_CAJA

End;
{******************************************************************************}

Procedure TFPagoGlobal.Contab_Haber;
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
//Inicio HPC_201401AJA
// If xDTRPorc = 0  Then // si no hay DETRACCION
   If (xDTRPorc = 0) AND (vYanoRetencion='N')  Then // si no hay DETRACCION
//Final HPC_201401AJA

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
               + '       sum(MTORETLOC) RETLOC, sum(MTORETEXT) RETEXT '
               + '  From CNT320 '
               + ' where CIAID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
               + '   and ANOMM='+quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
               + '   and TDIARID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
               + '   and ECNOCOMP='+quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
               + ' group by RETSERIE, RETNUMERO, FECPAGO';
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

   If (DMTE.xSRV_RUTA = '\\INCORESA') Or (DMTE.xSRV_RUTA = '\\SACSA') Then
      DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString;

   DMTE.cdsCntCaja.FieldByName('FCAB').AsString := '1';
   DMTE.cdsCntCaja.fieldbyname('DOCMOD').AsString := FRegistro.xModulo;
   DMTE.cdsCntCaja.fieldbyname('DCTCAMPR').AsString := DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsString;
   DMTE.cdsCntCaja.fieldbyname('DCTCAMPA').AsString := DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsString;

   xNReg := xNReg + 1;
   DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger := xNReg;
End;

{******************************************************************************}

Procedure TFPagoGlobal.Contab_RegCxP;
Var
   xSQL: String;
   xMTOCNTLOC, xMTOCNTEXT: double;
Begin
   DMTE.cdsCntCaja.FieldByName('CIAID').Value := DMTE.cdsRegCxP.FieldByName('CIAID').Value;
   DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value := DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').Value := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
   DMTE.cdsCntCaja.FieldByName('DOCID').Value := DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
   DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsRegCxP.FieldByName('CPSERIE').Value;
   DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsRegCxP.FieldByName('CPNODOC').Value;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsRegCxP.FieldByName('CPFEMIS').Value;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value := DMTE.cdsRegCxP.FieldByName('CPFVCMTO').Value;
   DMTE.cdsCntCaja.FieldByName('CPTOID').Value := DMTE.cdsRegCxP.FieldByName('CPTOID').Value;
   DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := DMTE.cdsRegCxP.FieldByName('CUENTAID').Value;
   DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsRegCxP.FieldByName('CLAUXID').Value;
   DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsRegCxP.FieldByName('PROV').Value;
   DMTE.cdsCntCaja.FieldByName('CCOSID').Value := DMTE.cdsRegCxP.FieldByName('CCOSID').Value;
   DMTE.cdsCntCaja.FieldByName('DCDH').Value := DMTE.cdsRegCxP.FieldByName('DEDH').Value;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value := DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value := DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
   DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
   If DMTE.cdsEgrCaja.FieldByName('TMONID').Value = DMTE.wtMonLoc Then
   Begin
      If DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wtMonLoc Then
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value;
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value / DMTE.cdsRegCxP.FieldByName('DETCPAG').Value, 15, 2);
      End
      Else
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value;
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value * DMTE.cdsRegCxP.FieldByName('DETCDOC').Value, 15, 2);
      End;
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value := DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value
   End
   Else
   Begin
      If DMTE.cdsRegCxP.FieldByName('TMONID').Value = dblcTMon.Text Then
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value;
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value * DMTE.cdsRegCxP.FieldByName('DETCDOC').Value, 15, 2);
      End
      Else
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value;
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value / DMTE.cdsRegCxP.FieldByName('DETCDOC').Value, 15, 2);
      End;
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value := DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value
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

   DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value := 'S'; //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCUSER').Value := DMTE.wUsuario;
   DMTE.cdsCntCaja.FieldByName('DCFREG').Value := Date;
   DMTE.cdsCntCaja.FieldByName('DCHREG').Value := Time;
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
End;

{******************************************************************************}

Procedure TFPagoGlobal.Contab_DocPago;
Var
   xwhere, XsqL: String;
   xFactor: Integer;
Begin
   xWhere := ' CIAID=' + quotedstr(DMTE.cdsDocPago.fieldbyname('CIAID2').AsString)
           + ' and CPANOMES=' + quotedstr(DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString)
           + ' and TDIARID=' + quotedstr(DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString)
           + ' and CPNOREG=' + quotedstr(DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString);
   If DMTE.RecuperarDatos('CXP301', 'TMONID', xWhere) Then
      xMONID_PROV := DMTE.cdsRec.fieldbyname('TMONID').AsString
   Else
      ShowMessage('Error en la recuperación del documento');

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
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsDocPago.FieldByName('CPFVCMTO').AsDateTime;
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
      DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D'
   Else
   Begin
      xFactor := -1;
      DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
   End;

   If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
   Begin
      If xMONID_PROV = DMTE.cdsEgrCaja.FieldByName('TMONID').AsString Then
      Begin
         xMTOCNTLOC := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat * xFactor, 15, 2);
         xMTOCNTEXT := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat * xFactor, 15, 2);
      End
      Else
      Begin
         xMTOCNTEXT := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * xFactor, 15, 2);
         xMTOCNTLOC := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat * xFactor, 15, 2);
      End;
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value := xMTOCNTLOC;
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := xMTOCNTLOC;
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
   End
   Else
   Begin
      If xMONID_PROV = DMTE.cdsEgrCaja.FieldByName('TMONID').AsString Then
      Begin
         xMTOCNTEXT := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * xFactor, 15, 2);
         xMTOCNTLOC := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat * xFactor, 15, 2);
      End
      Else
      Begin
         xMTOCNTLOC := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat * xFactor, 15, 2);
         xMTOCNTEXT := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat * xFactor, 15, 2);
      End;
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xMTOCNTEXT;
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xMTOCNTEXT;
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := xMTOCNTLOC;
   End;

   xMTODETLOC := xMTODETLOC + DMTE.FRound(xMTOCNTLOC, 15, 0);

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

   If (DMTE.xSRV_RUTA = '\\APLICACIONES\SOLAPLI') Then
   Begin
      xSQL := 'Select AUXNOMB from CNT201 '
         + 'Where CLAUXID=''' + DMTE.cdsDocPago.FieldByName('CLAUXID').AsString + ''' and '
         + 'AUXID=''' + DMTE.cdsDocPago.FieldByName('PROV').AsString + '''';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest(xSQL);
      DMTE.cdsQry.Open;
      DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.FieldByName('AUXNOMB').AsString;
   End;
   xNReg := xNReg + 1;
   DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger := xNReg;

End;

{******************************************************************************}

Procedure TFPagoGlobal.Contab_DifCamDocPago;
Var
   xWhere, xsql, xsql1: String;
   xFactor: Integer;
Begin
// GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   xsql := 'TMONID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TMONID').AsString);
   xsql1 := 'TMONID=' + quotedstr(DMTE.cdsDocPago.fieldbyname('TMONID').AsString);
   If (DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xsql, 'TMON_LOC') <> 'L') And
      (DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xsql1, 'TMON_LOC') <> 'L') Then
   Begin
      If DMTE.cdsDocPago.FieldByName('DETCDOC').Value <> DMTE.cdsDocPago.FieldByName('DETCPAG').Value Then
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

         If DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat > 0 Then
            xFactor := 1
         Else
         Begin
            xFactor := -1;
         End;

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
            DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat - (xMTOCNTEXT * xFactor), 15, 2);
            DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat - (xMTOCNTEXT * xFactor), 15, 2);
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat - (xMTOCNTLOC * xFactor), 15, 2);

            DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.wTMonLoc;

            If DMTE.cdsDocPago.FieldByName('DETCDOC').AsFloat > DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat Then
            Begin
               DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.FRound(DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat * (-1) * xFactor, 15, 2);
               DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.FRound(DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat * (-1) * xFactor, 15, 2);
               DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.FRound(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat * (-1) * xFactor, 15, 2);
               If xFactor = 1 Then
                  DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H'
               Else
                  DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
            End
            Else
            Begin
               DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.FRound(DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat * xFactor, 15, 2);
               DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.FRound(DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat * xFactor, 15, 2);
               DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.FRound(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat * xFactor, 15, 2);
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

         If DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat = 0 Then
            DMTE.cdsCntCaja.Delete;
      End
   End;
End;

Procedure TFPagoGlobal.Contab_DifCamDocPago2;
Var
   xsql, xsql1: String;
Begin
// GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   xsql := 'TMONID=' + quotedstr(dblcTMon.Text);
   If (DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xsql, 'TMON_LOC') <> 'L') Or
      (DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xsql1, 'TMON_LOC') <> 'L') Then
   Begin
      If DMTE.cdsDocPago.FieldByName('DETCDOC').Value <> DMTE.cdsDocPago.FieldByName('DETCPAG').Value Then
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
         If xMONID_PROV = DMTE.wTMonExt Then
         Begin
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsDocPago.FieldByName('DETCDOC').Value;
            DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value := wCptoGan;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaGan;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
         End;

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

         DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value := 'S'; //Registro ya cuadrado
         DMTE.cdsCntCaja.FieldByName('DCUSER').Value := DMTE.wUsuario;
         DMTE.cdsCntCaja.FieldByName('DCFREG').Value := Date;
         DMTE.cdsCntCaja.FieldByName('DCHREG').Value := Time;
         DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
         If xMONID_PROV = DMTE.wTMonExt Then
         Begin
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsDocPago.FieldByName('DETCPAG').Value;
            DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value := wCptoPer;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaPer;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
         End;

      End
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal.Contab_DifCamRegCxP;
Var
   xDif_Camb: real;
   xSql: String;
Begin
// GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   xsql := 'TMONID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TMONID').AsString);
   If DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xsql, 'TMON_LOC') <> 'L' Then
   Begin
      If DMTE.cdsRegCxP.FieldByName('DETCDOC').Value <> DMTE.cdsRegCxP.FieldByName('DETCPAG').Value Then
      Begin
         DMTE.cdsCntCaja.Insert;
         DMTE.cdsCntCaja.FieldByName('CIAID').Value := DMTE.cdsRegCxP.FieldByName('CIAID').Value;
         DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
         DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
         DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value := DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
         DMTE.cdsCntCaja.FieldByName('DCLOTE').Value := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
         DMTE.cdsCntCaja.FieldByName('DOCID').Value := DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
         DMTE.cdsCntCaja.FieldByName('DOCMOD').Value := 'CXP';
         DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsRegCxP.FieldByName('CPSERIE').Value;
         DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsRegCxP.FieldByName('CPNODOC').Value;
         DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value;
         DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
         DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
         DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
         DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value; //Aqui se toma de la cabecera
         DMTE.cdsCntCaja.FieldByName('CCOSID').Value := DMTE.cdsRegCxP.FieldByName('CCOSID').Value;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value := DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value := DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
         DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value := 'S'; //Registro ya cuadrado
         DMTE.cdsCntCaja.FieldByName('DCUSER').Value := DMTE.wUsuario;
         DMTE.cdsCntCaja.FieldByName('DCFREG').Value := Date;
         DMTE.cdsCntCaja.FieldByName('DCHREG').Value := Time;
         DMTE.cdsCntCaja.FieldByName('DCANO').Value := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
         DMTE.cdsCntCaja.FieldByName('DCMM').Value := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
         DMTE.cdsCntCaja.FieldByName('DCDD').Value := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
         DMTE.cdsCntCaja.FieldByName('DCSS').Value := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
         DMTE.cdsCntCaja.FieldByName('DCSEM').Value := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
         DMTE.cdsCntCaja.FieldByName('DCTRI').Value := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
         DMTE.cdsCntCaja.FieldByName('DCAASS').Value := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
         DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
         DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
         DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

         xNReg := xNReg + 1;
         DMTE.cdsCntCaja.FieldByName('NREG').AsInteger := xNReg;

         If DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wtMonLoc Then
         Begin //Provision en Mon.Local
            xDif_Camb := abs(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value / DMTE.cdsRegCxP.FieldByName('DETCDOC').Value -
               DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value / DMTE.cdsRegCxP.FieldByName('DETCPAG').Value); //En Mon.Ext.
            DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := xDif_Camb;

            If DMTE.cdsRegCxP.FieldByName('DETCDOC').Value > DMTE.cdsRegCxP.FieldByName('DETCPAG').Value Then
               DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D'
            Else
               DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
         End
         Else
         Begin //Provision en Mon.Ext.
            xDif_Camb := abs(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value * DMTE.cdsRegCxP.FieldByName('DETCDOC').Value -
               DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value * DMTE.cdsRegCxP.FieldByName('DETCPAG').Value); //En Mon.Local
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := xDif_Camb;
            If DMTE.cdsRegCxP.FieldByName('DETCDOC').Value > DMTE.cdsRegCxP.FieldByName('DETCPAG').Value Then
               DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H'
            Else
               DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
         End;
         If DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'D' Then
         Begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value := wCptoPer;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaPer;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
         End
         Else
         Begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value := wCptoGan;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaGan;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
         End;
         If DMTE.cdsCntCaja.FieldByName('DCDH').asString = 'D' Then
         Begin
            If DMTE.cdsCntCaja.fieldbyname('TMONID').Value = DMTE.wtMonLoc Then
               DMTE.cdsCntCaja.fieldbyName('DEBE').asFloat := DMTE.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
            Else
               DMTE.cdsCntCaja.fieldbyName('DEBE').asFloat := DMTE.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
         End
         Else
         Begin
            If DMTE.cdsCntCaja.fieldbyname('TMONID').Value = DMTE.wtMonLoc Then
               DMTE.cdsCntCaja.fieldbyName('HABER').asFloat := DMTE.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
            Else
               DMTE.cdsCntCaja.fieldbyName('HABER').asFloat := DMTE.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
         End;
       //**
      End;
   End;
End;

Procedure TFPagoGlobal.Contab_DifCamRegCxP2;
Var
   xsql: String;
Begin
// GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   xsql := 'TMONID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TMONID').AsString);
   If DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xsql, 'TMON_LOC') <> 'L' Then
   Begin
      If DMTE.cdsRegCxP.FieldByName('DETCDOC').Value <> DMTE.cdsRegCxP.FieldByName('DETCPAG').Value Then
      Begin
         DMTE.cdsCntCaja.Insert;
         DMTE.cdsCntCaja.FieldByName('CIAID').Value := DMTE.cdsRegCxP.FieldByName('CIAID').Value;
         DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
         DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
         DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value := DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
         DMTE.cdsCntCaja.FieldByName('DCLOTE').Value := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
         DMTE.cdsCntCaja.FieldByName('DOCID').Value := DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
         DMTE.cdsCntCaja.FieldByName('DOCMOD').Value := 'CXP';
         DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsRegCxP.FieldByName('CPSERIE').Value;
         DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsRegCxP.FieldByName('CPNODOC').Value;
         DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
         DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
         DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
         DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
         DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value; //Aqui se toma de la cabecera
         DMTE.cdsCntCaja.FieldByName('CCOSID').Value := DMTE.cdsRegCxP.FieldByName('CCOSID').Value;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value := DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value := DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
         DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value := 'S'; //Registro ya cuadrado
         DMTE.cdsCntCaja.FieldByName('DCUSER').Value := DMTE.wUsuario;
         DMTE.cdsCntCaja.FieldByName('DCFREG').Value := Date;
         DMTE.cdsCntCaja.FieldByName('DCHREG').Value := Time;
         DMTE.cdsCntCaja.FieldByName('DCANO').Value := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
         DMTE.cdsCntCaja.FieldByName('DCMM').Value := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
         DMTE.cdsCntCaja.FieldByName('DCDD').Value := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
         DMTE.cdsCntCaja.FieldByName('DCSS').Value := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
         DMTE.cdsCntCaja.FieldByName('DCSEM').Value := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
         DMTE.cdsCntCaja.FieldByName('DCTRI').Value := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
         DMTE.cdsCntCaja.FieldByName('DCAASS').Value := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
         DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
         DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
         DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

         xNReg := xNReg + 1;
         DMTE.cdsCntCaja.fieldbyName('NREG').AsInteger := xNReg;

         If DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wtMonExt Then
         Begin //Provision en Mon.Local
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value * DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
            DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value := wCptoGan;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaGan;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
         End;

         DMTE.cdsCntCaja.Insert;
         DMTE.cdsCntCaja.FieldByName('CIAID').Value := DMTE.cdsRegCxP.FieldByName('CIAID').Value;
         DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
         DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
         DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value := DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
         DMTE.cdsCntCaja.FieldByName('DCLOTE').Value := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
         DMTE.cdsCntCaja.FieldByName('DOCID').Value := DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
         DMTE.cdsCntCaja.FieldByName('DOCMOD').Value := 'CXP';
         DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsRegCxP.FieldByName('CPSERIE').Value;
         DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsRegCxP.FieldByName('CPNODOC').Value;
         DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
         DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
         DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
         DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
         DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsEgrCaja.FieldByName('PROV').Value; //Aqui se toma de la cabecera
         DMTE.cdsCntCaja.FieldByName('CCOSID').Value := DMTE.cdsRegCxP.FieldByName('CCOSID').Value;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value := DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value := DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;
         DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value := 'S'; //Registro ya cuadrado
         DMTE.cdsCntCaja.FieldByName('DCUSER').Value := DMTE.wUsuario;
         DMTE.cdsCntCaja.FieldByName('DCFREG').Value := Date;
         DMTE.cdsCntCaja.FieldByName('DCHREG').Value := Time;
         DMTE.cdsCntCaja.FieldByName('DCANO').Value := DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
         DMTE.cdsCntCaja.FieldByName('DCMM').Value := DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
         DMTE.cdsCntCaja.FieldByName('DCDD').Value := DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
         DMTE.cdsCntCaja.FieldByName('DCSS').Value := DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
         DMTE.cdsCntCaja.FieldByName('DCSEM').Value := DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
         DMTE.cdsCntCaja.FieldByName('DCTRI').Value := DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
         DMTE.cdsCntCaja.FieldByName('DCAASS').Value := DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
         DMTE.cdsCntCaja.FieldByName('DCAASEM').Value := DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
         DMTE.cdsCntCaja.FieldByName('DCAATRI').Value := DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
         DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;

         If DMTE.cdsRegCxP.FieldByName('TMONID').Value = DMTE.wtMonExt Then
         Begin //Provision en Mon.Local
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value * DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
            DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
            DMTE.cdsCntCaja.FieldByName('CPTOID').Value := wCptoPer;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaPer;
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
         End;

      End;
   End;
End;

{******************************************************************************}

Procedure TFPagoGlobal.Contabiliza;
Var
   xRegAct: TBookMark;
   xSQL, xWhere: String;
Begin
   xSQL := 'delete from CAJA304 '
      + 'where CIAID=' + quotedstr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)
      + '  and ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
      + '  and TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
      + '  and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xMTODETLOC := 0;
   xNReg := 0;
   xSQL := 'Select * from CAJA304 Where CIAID='''' and '
      + 'ECANOMM='''' and TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsCNTCaja.Close;
   DMTE.cdsCNTCaja.DataRequest(xSQL);
   DMTE.cdsCNTCaja.Open;

// GENERA LOS REGISTROS DE "DEBE" Y LOS REGISTROS POR DIF. DE CAMBIO desde Docs Pago
   DMTE.cdsDocPago.DisableControls;
   xRegAct := DMTE.cdsDocPago.GetBookmark;

// condicionado para tratar la DETRACCION
//Inicio HPC_201401_CAJA
 //If xDTRPorc = 0 Then // si no hay DETRACCION
   If (xDTRPorc = 0) AND (vYanoRetencion='N')  Then
//Final HPC_201401_CAJA
   Begin
      DMTE.cdsDocPago.First;
      While Not DMTE.cdsDocPago.Eof Do
      Begin
         ContabilizaProc1;
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
         DMTE.cdsDocPago.Next;
      End;

   End;
   DMTE.cdsDocPago.GotoBookmark(xRegAct);
   DMTE.cdsDocPago.FreeBookmark(xRegAct);
   DMTE.cdsDocPago.EnableControls;

   If (xDTRPorc > 0) And (DMTE.cdsDocPago.FieldByName('TIPDET').AsString = 'I4') Then // si no hay DETRACCION
   Else
   Begin
    // GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde Docs Registro
      DMTE.cdsRegCxP.DisableControls;
      xRegAct := DMTE.cdsRegCxP.GetBookmark;
      DMTE.cdsRegCxP.First; // OTROS DOCUMENTOS
      While Not DMTE.cdsRegCxP.Eof Do
      Begin
         DMTE.cdsCntCaja.Insert;
         Contab_RegCxP;
         DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
         If DMTE.wTipoDif = '' Then
         Begin
            DMTE.cdsCntCaja.Insert;
            Contab_DifCamRegCxP;
            DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
         End
         Else
         Begin
            If DMTE.cdsRegCxP.FieldByname('TMONID').AsString = DMTE.wTMonExt Then
            Begin
               DMTE.cdsCntCaja.Insert;
               Contab_DifCamRegCxP2;
               DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
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

   Contab_DocPago_RETENCION_HABER;

   DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
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
//Inicio HPC_201401_CAJA
 //If xDTRPorc = 0 Then // si no hay DETRACCION
   If (xDTRPorc = 0) AND (vYanoRetencion='N')  Then
//Final HPC_201401_CAJA
   Begin
      DMTE.cdsDocPago.First;
      While Not DMTE.cdsDocPago.Eof Do
      Begin
            //ContabilizaProc2;
         DMTE.cdsDocPago.Next;
      End;
   End
   Else // si hay DETRACCION
   Begin
// Inicio HPC_201403_CAJA
//       ContabilizaProc2;
// Fin HPC_201403_CAJA
   End;

   DMTE.cdsCntCaja.Insert;
   Contab_Haber;
   DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');

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
      DMTE.cdsCntCaja.Insert;
      AsientoDifTotal;
      DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
   End;
   DMTE.cdsDocPago.EnableControls;
End;

Procedure TFPagoGlobal.AsientoDifTotal;
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
End;

{******************************************************************************}

Procedure TFPagoGlobal.z2bbtnContClick(Sender: TObject);
Var
   wSql, WTDIARID, WECNOCOMPR, xSQL: String;
Begin
   xMsgContabiliza := '0';
   //Inicio HPC_201401_CAJA
   //If (xDTRPorc = 0) Or (DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString = '') Then // si no se aplica la DETRACCION
   If ((xDTRPorc = 0) And (vYanoRetencion='N'))   Or (DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString = '') Then // si no se aplica la DETRACCION
   //Final HPC_201401_CAJA
   Begin
      xDTRPorc := 0;
      DMTE.cdsEgrCaja.First;
      ContabCierra;
   End
   Else // si se aplica la DETRACCION
   Begin
      WTDIARID := DMTE.cdsDocPago.FieldByName('TDIARID').AsString;
      WECNOCOMPR := DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString;

      DMTE.cdsEgrCaja.Close;
      wSQL := 'select * From CAJA302 '
         + 'where CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
         + ' and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
         + ' and TIPDET IN (''TO'',''I4'') '
         + ' and ECNOCOMPR=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString);
      DMTE.cdsEgrCaja.DataRequest(wSQL);
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
            DMTE.AplicaDatos(DMTE.cdsEgrCaja, 'EGRCAJA');
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
            ContabCierra;
         xMsgContabiliza := '1'; // controla que no se presente la pregunta para Contabilizar, en el caso que
                                   // se trate del 2do. registro de la DETRACCION
         DMTE.cdsEgrCaja.Next;
      End;

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

Procedure TFPagoGlobal.ContabCierra;
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
            Exit;
         End;
      End;
      screen.Cursor := crHourGlass;

      z2bbtnGraba.Enabled := False;
      z2bbtnCancelado.Enabled := False;
      z2bbtnCont.Enabled := False;
      z2bbtnAnula.Enabled := False;

      RecCptosDifC;

      Contabiliza;

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

         //Inicio HPC_201401_CAJA
         //If xDTRPorc = 0 Then // si no se aplica DETRACCION
         If (xDTRPorc = 0) AND (vYanoRetencion='N') Then
         //Final HPC_201401_CAJA
         Begin
            xSQL := 'Select * from CAJA302 '
               + 'Where CIAID=''' + dblcCia.Text + ''' and '
               + 'ECANOMM=''' + edtPeriodo.Text + ''' and '
               + 'TDIARID=''' + dblcTDiario.Text + ''' and '
               + 'ECNOCOMP=''' + dbeNoComp.Text + ''' ';
            DMTE.cdsEgrCaja.DataRequest(xSQL);
         End;

         DMTE.AplicaDatos(DMTE.cdsEgrCaja, 'EGRCAJA');

      // Para Grabar Registros Adicionales
         fg_AtualizaNComprob(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
            DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
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

Procedure TFPagoGlobal.z2bbtnAnulaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If MessageDlg('¿Anular Comprobante?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'I' Then
         RetornaSaldosMovCxP;

      If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'C' Then
      Begin
         RetornaSaldosMovCxPPagados;
         If DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString = 'S' Then
            DMTE.AnulaRetencion;
      End;

      DMTE.cdsEgrCaja.CancelUpdates;
      DMTE.cdsRegCxP.CancelUpdates;
      DMTE.cdsDocPago.CancelUpdates;

      If (xDTRPorc > 0) And (DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString <> '') Then // si se aplico la DETRACCION
      Begin
         xSQL := 'Update CAJA302 SET ECESTADO=''A'', ECUSER=''' + DMTE.wUsuario + ''', ECFREG=sysdate, ECHREG=sysdate '
            + 'WHERE CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
            + ' and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
              //+ ' and TDIARID='  +quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
         + ' and ECNOCOMPR=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString);
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
         End;

         DMTE.cdsEgrCaja.Refresh;
      End
      Else // si NO se aplico la DETRACCION
      Begin
         AnulaCaja302;
      End;

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

Procedure TFPagoGlobal.AnulaCaja302;
Var
   xSQL: String;
Begin
   DMTE.cdsEgrCaja.edit;
   DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value := 'A';
   DMTE.cdsEgrCaja.FieldByName('ECUSER').Value := DMTE.wUsuario; // usuario que registra
   DMTE.cdsEgrCaja.FieldByName('ECFREG').Value := DateS; // fecha que registra Usuario
   DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time; // Hora de Registro de Usuario
   DMTE.AplicaDatos(DMTE.cdsEgrCaja, 'EGRCAJA');
End;

{******************************************************************************}

Procedure TFPagoGlobal.ActPnlBotones;
Begin
   z2bbtnCont.Enabled := wbCont;
   z2bbtnImprime.Enabled := wbImprime;
   z2bbtnSube.Enabled := wbSube;
   z2bbtnGraba.Enabled := wbGraba;
   z2bbtnCancelado.Enabled := wbCancelado;
   z2bbtnCancel2.Enabled := wbCancel2;
   z2bbtnAnula.Enabled := wbAnula;
End;

Procedure TFPagoGlobal.FormClose(Sender: TObject; Var Action: TCloseAction);
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
      With DMTE Do
      Begin
         cdsRegCxP.Filtered := False;
         cdsMovCxP.Filtered := False;
         cdsCntCaja.Filtered := False;
         If cdsEgrCaja.active Then
            cdsEgrCaja.CancelUpdates;
         If cdsRegCxP.Active Then
            cdsRegCxP.CancelUpdates;
         If cdsMovCxP.active Then
         Begin
            cdsMovCxP.CancelUpdates;
            cdsMovCxP.close;
         End;
         If cdsDocPago.Active Then
            cdsDocPago.CancelUpdates;

         cdsConsulta.IndexFieldNames := '';
         cdsConsulta.Filter := '';
         cdsConsulta.Filtered := False;
         cdsConsulta.Close;

         cdsRetencion.IndexFieldNames := '';
         cdsRetencion.Filter := '';
         cdsRetencion.Filtered := False;
         cdsRetencion.Close;

         cf1.QuitarExits(self);
         cdsTrans.IndexFieldNames := '';
         cdsTrans.Filter := '';
         cdsTrans.Filtered := False;

      End;
      edtCuenta.Enabled := False;
      Limpiapnlaux;

      If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'X' Then
      Begin
         DMTE.cdsEgrCaja.Delete;
         xSQL := 'Select * from CAJA302 '
            + 'Where CIAID=''' + dblcCia.Text + ''' and '
            + 'ECANOMM=''' + edtPeriodo.Text + ''' and '
            + 'TDIARID=''' + dblcTDiario.Text + ''' and '
            + 'ECNOCOMP=''' + dbeNoComp.Text + ''' ';
         DMTE.cdsEgrCaja.DataRequest(xSQL);
         DMTE.ControlTran(9, DMTE.cdsEgrCaja, 'EGRCAJA');
      End;
      //Inicio HPC_201401_CAJA
      //If xDTRPorc = 0 Then
      If (xDTRPorc = 0) AND (vYanoRetencion='N') Then
      //Final HPC_201401_CAJA
      Begin
         FRegistro.xFiltroEgr.FMant.cds2.Data := DMTE.cdsEgrCaja.Data;
         FRegistro.xFiltroEgr.FMant.cds2.GotoCurrent(DMTE.cdsEgrCaja);
      End
      Else
      Begin
     // PARA CARGAR EL FILTRO CON LOS DOS REGISTROS GENERADOS POR LA DETRACCION
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
         FRegistro.xFiltroEgr.RefreshFilter;
      End;
   Except
   End;
   FPagoGlobal := Nil;
   Action := caFree;
End;
{******************************************************************************}

Procedure TFPagoGlobal.IniciaPanel;
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

Procedure TFPagoGlobal.dbgOtrosIButtonClick(Sender: TObject);
Begin
   inhabilitarpaneles;
   AdicionarRegistros;
End;
{******************************************************************************}

Procedure TFPagoGlobal.dbgOtrosKeyDown(Sender: TObject; Var Key: Word;
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

Procedure TFPagoGlobal.dbdtpFComp2Exit(Sender: TObject);
Begin
   DMTE.cdsRegCxP.FieldByName('CPANOMM').Value := copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value), 7, 4)
      + copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value), 4, 2);
End;

{******************************************************************************}

Procedure TFPagoGlobal.z2bbtnSumatClick(Sender: TObject);
Var
   xRegAct: TBookMark;
   xWhere: String;
// Inicio HPC_201401_CAJA
   xTotGrav, xTotIGV : double;
   xResta : String;
   vRetencion: Real;
   vDetraccion:String;
   vProvRetiene:String;
   xDocRetIGV : String;
   xRestaDoc : String;
// Final HPC_201401_CAJA
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

         xWhere := 'DOCID=' + QuotedStr(DMTE.cdsRegCxP.FieldByName('DOCID2').AsString) + ' AND DOCMOD=''CXP''';
         //Si el tipo de documento esta sujeto a RETENCION
         //S la
         //Inicio HPC_201405_CAJA
         If (DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCRETIGV', xWhere, 'DOCRETIGV') = 'S') And
            (DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime >= DMTE.xTasaFec) And
            (lblSujetoRetencion.Visible) Then
         Begin
            xRetLoc := xRetLoc + DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
            xRetExt := xRetExt + DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
            If DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat, 15, 4) >= DMTE.xTasaMonto Then
               bMayorQueMonto := True;
         End;
         //If DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat, 15, 4) >= DMTE.xTasaMonto Then
         //bMayorQueMonto := True;
         //Final HPC_201405_CAJA
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

// Inicio HPC_201401_CAJA
   {
   While Not DMTE.cdsDocPago.EOF Do
   Begin
      xWhere := 'DOCID=' + QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString) + ' AND DOCMOD=''CXP''';
      If (DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCRETIGV', xWhere, 'DOCRETIGV') = 'S') And
         (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime >= DMTE.xTasaFec) And
         (lblSujetoRetencion.Visible) Then
      Begin
         xWhere := 'CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID2').AsString)
            + ' and CLAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString)
            + ' and PROV=' + quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString)
            + ' and CPSERIE=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPSERIE').AsString)
            + ' and CPNODOC=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPNODOC').AsString)
            + ' and CPESTADO=''P'' ';
         If length(DMTE.DisplayDescrip('prvTGE', 'CXP301', '*', xWhere, 'PROV')) > 0 Then
         Begin
            If (DMTE.cdsQry.FieldByName('PROVRETIGV').AsString = 'S') Then
            Begin
               xRetLoc := xRetLoc + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
               xRetExt := xRetExt + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
               bMayorQueMonto := True
            End
            Else
            Begin
               If ((DMTE.cdsQry.FieldByName('CPGRAVAD').AsFloat
                  + DMTE.cdsQry.FieldByName('CPIGV').AsFloat) >= DMTE.xTasaMonto)
                  And (DMTE.cdsQry.FieldByName('CPIGV').AsFloat > 0) Then
               Begin
                  xRetLoc := xRetLoc + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
                  xRetExt := xRetExt + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
                  bMayorQueMonto := True;
               End;
            End;
         End;
      End;
      xMtoLoc := xMtoLoc + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
      xMtoExt := xMtoExt + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;

      DMTE.cdsDocPago.Next;
   End;
   DMTE.cdsDocPago.GotoBookmark(xRegAct);
   DMTE.cdsDocPago.FreeBookmark(xRegAct);
   DMTE.cdsDocPago.EnableControls;

   If bMayorQueMonto Then
   Begin
      xRetLoc := DMTE.FRound(xRetLoc * DMTE.xTasaPorce / 100, 15, 2);
      xRetExt := DMTE.FRound(xRetExt * DMTE.xTasaPorce / 100, 15, 2);
   End
   Else
   Begin
      xRetLoc := 0;
      xRetExt := 0;
   End;
   }
////////////////////////////////////////////////////////////////////////////////////////////
   xTotGrav := 0;
   xTotIGV  := 0;
   While Not DMTE.cdsDocPago.EOF Do
   Begin
   // Inicio HPC_201401_CAJA

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
         If (DMTE.cdsQry.FieldByName('PROVRETIGV').AsString = 'S') and
               ((DMTE.cdsQry.FieldByName('CPIGV').AsFloat
                +DMTE.cdsQry.FieldByName('CPIGV2').AsFloat
                +DMTE.cdsQry.FieldByName('IGV_GRA_NO_DEST').AsFloat) > 0) then
            vDetraccion := 'N'
         else
            if DMTE.cdsQry.FieldByName('DTRPORC').AsFloat>0 then
               vDetraccion := 'S'
            else
               vDetraccion := VConceptoDetrac(DMTE.cdsDocPago.FieldByName('CIAID2').AsString,
                                    DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
                                    DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
                                    DMTE.cdsDocPago.FieldByName('CPNOREG').AsString);
      End;
   // Solo es necesario que sea un comcepto de "detraccion" dentro del cheqe  para que no cobre retencion y los valores queden en cero
      If vDetraccion='S' Then
      begin
         xTotGrav := 0;
         xTotIGV  := 0;
         vYanoRetencion := 'S';
      end;

      If not lblSujetoRetencion.Visible Then
      begin
         xTotGrav := 0;
         xTotIGV  := 0;

         If dblcTMon.Text ='D' Then
            dbeImporte.text  := dbgOtros.ColumnByName('DEMTOEXT').FooterValue
         Else
            dbeImporte.text :=  dbgOtros.ColumnByName('DEMTOLOC').FooterValue;
      end;

      xWhere := 'DOCID=' + QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString) + ' AND DOCMOD=''CXP'' ';
      xDocRetIGV := DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCRETIGV, DOCRESTA', xWhere, 'DOCRETIGV');
      xRestaDoc := DMTE.cdsQry.FieldByName('DOCRESTA').AsString;

      If (xDocRetIGV = 'S')
         and (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime >= DMTE.xTasaFec)
         and (vDetraccion<>'S')
         and (lblSujetoRetencion.Visible) Then
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
            If (DMTE.cdsQry.FieldByName('PROVRETIGV').AsString = 'S') or
               (DMTE.cdsQry.FieldByName('CPIGV').AsFloat > 0) or
               (DMTE.cdsQry.FieldByName('CPIGV2').AsFloat > 0) or
               (DMTE.cdsQry.FieldByName('IGV_GRA_NO_DEST').AsFloat > 0) Then
            Begin
               if xResta <> 'S' then
               begin
                  xTotGrav := xTotGrav + DMTE.cdsQry.FieldByName('CPGRAVAD').AsFloat;
                  xTotIGV  := xTotIGV
                         + DMTE.cdsQry.FieldByName('CPIGV').AsFloat
                         + DMTE.cdsQry.FieldByName('CPIGV2').AsFloat
                         + DMTE.cdsQry.FieldByName('IGV_GRA_NO_DEST').AsFloat;
               end
               else
               begin
                  xTotGrav := xTotGrav - DMTE.cdsQry.FieldByName('CPGRAVAD').AsFloat;
                  xTotIGV  := xTotIGV
                         - DMTE.cdsQry.FieldByName('CPIGV').AsFloat
                         - DMTE.cdsQry.FieldByName('CPIGV2').AsFloat
                         - DMTE.cdsQry.FieldByName('IGV_GRA_NO_DEST').AsFloat;
               end;

               if DMTE.cdsQry.FieldByName('PROVRETIGV').AsString = 'S' then
                  bMayorQueMonto := True;
 // Inicio HPC_201403_CAJA
             {  if DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
               begin
                  xRetLoc := xRetLoc + (DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat*0.03);
                  xRetExt := xRetExt + (DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat*0.03);
               end
               else
               begin
                  xRetLoc := xRetLoc + (DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat*0.06);
                  xRetExt := xRetExt + (DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat*0.06);
               end;    }
// Fin HPC_201403_CAJA
            End;
         End;
      End;

      if xRestaDoc='S' then
      begin
        //HPC_201401_CAJ
        // xMtoLoc := xMtoLoc - DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
        // xMtoExt := xMtoExt - DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
        //Si esta en negativo ya no es restar sino sumar por el signo negativo se resta.
         If DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat<0 Then
         Begin
           xMtoLoc := xMtoLoc + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
           xMtoExt := xMtoExt + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
         end
         Else
         Begin
           xMtoLoc := xMtoLoc - DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
           xMtoExt := xMtoExt - DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
         end
        //HPC_201401_CAJ

      end
      else
      begin
         xMtoLoc := xMtoLoc + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
         xMtoExt := xMtoExt + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
      end;
      DMTE.cdsDocPago.Next;
   End;

   DMTE.cdsDocPago.GotoBookmark(xRegAct);
   DMTE.cdsDocPago.FreeBookmark(xRegAct);
   DMTE.cdsDocPago.EnableControls;

   If (xTotGrav+xTotIGV) >= DMTE.xTasaMonto then
      bMayorQueMonto := True;

   If bMayorQueMonto Then
   Begin
// Inicio HPC_201403_CAJA
      if DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
      begin
        xRetLoc := xMtoLoc*0.03;
        xRetExt := xMtoExt*0.03;
        xMtoLoc := DMTE.FRound(xMtoLoc - xRetLoc,15,2);
        xMtoExt := DMTE.FRound(xMtoExt - xRetExt,15,2);
      End
      Else
      Begin
        xRetLoc := xMtoLoc*0.06;
        xRetExt := xMtoExt*0.06;
        xMtoLoc := DMTE.FRound(xMtoLoc - xRetLoc,15,2);
        xMtoExt := DMTE.FRound(xMtoExt - xRetExt,15,2);
      End;
// Fin HPC_201403_CAJA
   End
   Else
   Begin
      xRetLoc := 0;
      xRetExt := 0;
      xMtoLoc := DMTE.FRound(xMtoLoc, 15, 2);
      xMtoExt := DMTE.FRound(xMtoExt, 15, 2);
   End;

{
   If dblcTMon.Text ='D' Then
      dbeImporte.text := FloatToStr(xMtoExt)
   Else
     dbeImporte.text := FloatToStr(xMtoLoc);
}

////////////////////////////////////////////////////////////////////////////////////////////
// Fin HPC_201401_CAJA

End;

{******************************************************************************}

Procedure TFPagoGlobal.dbgDocPagoDragOver(Sender, Source: TObject; X,
   Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
   If (Not dbgDocPago.Readonly) Then
      Accept := True;
End;
{******************************************************************************}

Procedure TFPagoGlobal.dbgDocPagoMouseDown(Sender: TObject;
   Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
   If (Not dbgDocPago.Readonly) Then
      dbgDocPago.BeginDrag(False);
End;
{******************************************************************************}

Procedure TFPagoGlobal.dbgDocPagoEndDrag(Sender, Target: TObject; X,
   Y: Integer);
Var
   wSql, WECNOCOMPR, WTDIARID: String;
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
            WECNOCOMPR := DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString;
            WTDIARID := DMTE.cdsDocPago.FieldByName('TDIARID').AsString;

          // se eliminan los registros, por si se grabaron anterormente
            wSQL := 'Delete FROM CAJA303 '
                   +' where CIAID=' + quotedstr(DMTE.cdsMovCxp.FieldByName('CIAID').AsString)
                   +'   and TDIARID=' + quotedstr(WTDIARID)
                   +'   and ECANOMM=' + quotedstr(DMTE.cdsMovCxp.FieldByName('CPANOMES').AsString)
                   +'   and ECNOCOMPR=' + quotedstr(WECNOCOMPR)
                   +'   and CLAUXID=' + quotedstr(DMTE.cdsMovCxp.FieldByName('CLAUXID').AsString)
                   +'   and PROV=' + quotedstr(DMTE.cdsMovCxp.FieldByName('PROV').AsString);
            DMTE.DCOM1.AppServer.EjecutaSQL(wSQL);

            wSQL := 'Delete FROM CAJA302 '
                   +' where CIAID=' + quotedstr(DMTE.cdsMovCxp.FieldByName('CIAID').AsString)
                   +'   and TDIARID=' + quotedstr(WTDIARID)
                   +'   and ECANOMM=' + quotedstr(DMTE.cdsMovCxp.FieldByName('CPANOMES').AsString)
                   +'   and ECNOCOMPR=' + quotedstr(WECNOCOMPR)
                   +'   and CLAUXID=' + quotedstr(DMTE.cdsMovCxp.FieldByName('CLAUXID').AsString)
                   +'   and PROV=' + quotedstr(DMTE.cdsMovCxp.FieldByName('PROV').AsString);
            DMTE.DCOM1.AppServer.EjecutaSQL(wSQL);

         // se carga nuevamente cdsDocPago y cdsEgrCaja, con los registros que quedaron
            wSQL := 'Select * '
                   +'  From CAJA303 '
                   +' where CIAID=' + quotedstr(DMTE.cdsMovCxp.FieldByName('CIAID').AsString)
                   +'   and TDIARID=' + quotedstr(WTDIARID)
                   +'   and ECANOMM=' + quotedstr(DMTE.cdsMovCxp.FieldByName('CPANOMES').AsString)
                   +'   and ECNOCOMPR=' + quotedstr(WECNOCOMPR)
                   +'   and CLAUXID=' + quotedstr(DMTE.cdsMovCxp.FieldByName('CLAUXID').AsString)
                   +'   and PROV=' + quotedstr(DMTE.cdsMovCxp.FieldByName('PROV').AsString);
            DMTE.cdsDocPago.Close;
            DMTE.cdsDocPago.DataRequest(wSql);
            DMTE.cdsDocPago.Open;

            wSql := 'Select * '
                   +'  from CAJA302 '
                   +' where CIAID=' + quotedstr(DMTE.cdsMovCxp.FieldByName('CIAID').AsString)
                   +'   and TDIARID=' + quotedstr(WTDIARID)
                   +'   and ECANOMM=' + quotedstr(DMTE.cdsMovCxp.FieldByName('CPANOMES').AsString)
                   +'   and ECNOCOMPR=' + quotedstr(WECNOCOMPR)
                   +'   and CLAUXID=' + quotedstr(DMTE.cdsMovCxp.FieldByName('CLAUXID').AsString)
                   +'   and PROV=' + quotedstr(DMTE.cdsMovCxp.FieldByName('PROV').AsString);
            DMTE.cdsEgrCaja.Close;
            DMTE.cdsEgrCaja.DataRequest(wSql);
            DMTE.cdsEgrCaja.Open;

         // esto se realiza para mantener la logica del programa, cuando se presiona z2bbtnOKCab
            GrabaCabeceraDeComprobante;
         End
         Else
            DMTE.cdsDocPago.Delete;
         DMTE.cdsMovCxP.Edit;
         DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.cdsMovCxP.FieldByName('CPMTOEXT').Value - DMTE.NumeroNoNulo(DMTE.cdsMovCxP.FieldByName('CPPAGEXT'));
         DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.cdsMovCxP.FieldByName('CPMTOLOC').Value - DMTE.NumeroNoNulo(DMTE.cdsMovCxP.FieldByName('CPPAGLOC'));
         DMTE.cdsMovCxP.FieldByName('CPHREG').Value := time;
         If DMTE.cdsMovCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc Then
            DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat
         Else
            DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;

      // esto se realiza para mantener la logica del programa, cuando se presiona z2bbtnOK
         If xDTRPorc > 0 Then
         Begin
            DMTE.AplicaDatos(DMTE.cdsMovCxp, '');
            z2bbtnOKClick(Self);
         End;
         dbgPendientes.RefreshDisplay;
         dbgDocPago.RefreshDisplay;
      End;
      DMTE.cdsMovCxP.Filtered := True;
      wmodifica := True;
      z2bbtnSumatDocPagoClick(Nil);
   End;
End;
{******************************************************************************}

Procedure TFPagoGlobal.LimpiaFiltros;
Begin
   // Limpiando filtros si lo tuvieran
   DMTE.cdsMovCxP.Filtered := False;
   DMTE.cdsCntCaja.Filtered := False;
   DMTE.cdsRegCxP.Filtered := False;
End;

{******************************************************************************}
{*********************** PROCEDIMIENTOS ADICIONALES   *************************}

Procedure TFPagoGlobal.ActivaFiltro(xName: String);
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
      xSQL := 'Select * '
             +'  from CAJA301 '
             +' Where CIAID='+quotedstr(dblcCia.Text)
             +'   and ECANOMM='+quotedstr(edtPeriodo.Text)
             +'   and TDIARID='+quotedstr(dblcTDiario.Text)
             +'   and ECNOCOMP='+quotedstr(dbeNoComp.Text);
      DMTE.cdsRegCxP.Close;
      DMTE.cdsRegCxP.DataRequest(xSQL);
      DMTE.cdsRegCxP.Open;
   End;

   If xName = 'DOCPAGO' Then
   Begin
      If length(DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString) > 0 Then
      Begin // por ser registros al que se les ha aplicado la DETRACCION
         xSQL := 'Select * from CAJA303 '
            + 'Where CIAID=''' + dblcCia.Text + ''' and '
            + 'ECANOMM=''' + edtPeriodo.Text + ''' and '
            + 'TDIARID=''' + dblcTDiario.Text + ''' and '
            + 'ECNOCOMPR=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString + ''' ';
      End
      Else
      Begin
         xSQL := 'Select * from CAJA303 '
            + 'Where CIAID=''' + dblcCia.Text + ''' and '
            + 'ECANOMM=''' + edtPeriodo.Text + ''' and '
            + 'TDIARID=''' + dblcTDiario.Text + ''' and '
            + 'ECNOCOMP=''' + dbeNoComp.Text + ''' ';
      End;

      DMTE.cdsDocPago.Filter := '';
      DMTE.cdsDocPago.Filtered := False;
      DMTE.cdsDocPago.Close;
      DMTE.cdsDocPago.DataRequest(xSQL);
      DMTE.cdsDocPago.Open;

   // para determinar si se aplica DETRACCION y se anula la RETENCION
      If DMTE.cdsDocPago.RecordCount > 0 Then
      Begin
         xSQL := 'Select B.DTRPORC from CAJA303 a, CXP301 b '
            + 'Where A.CIAID=''' + dblcCia.Text + ''' and '
            + 'A.ECANOMM=''' + edtPeriodo.Text + ''' and '
            + 'A.TDIARID=''' + dblcTDiario.Text + ''' and '
            + 'A.ECNOCOMP=''' + dbeNoComp.Text + ''' '
            + 'and a.CIAID2=B.CIAID(+) AND A.CPANOMM=B.CPANOMES AND TDIARID2=B.TDIARID '
            + 'AND A.CPNOREG=B.CPNOREG(+) AND NVL(B.DTRPORC,0)>0';
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
         '                   ( SELECT CIAID||CPANOMM||TDIARID2||CPNOREG' +
         '                     FROM CAJA303 ' +
         '                     WHERE CIAID = ''' + dblcCia.Text + ''' ' +
         '                     AND ECANOMM = ''' + edtPeriodo.Text + ''' ' +
         '                     AND TDIARID = ''' + dblcTDiario.Text + ''' ' +
         '                     AND ECNOCOMP= ''' + dbeNoComp.Text + ''' ) ) ';

      DMTE.cdsMovCxP.Datarequest('SELECT * FROM CXP301 WHERE ' + xWhere + sDocumentos + ' order by CPANOMES DESC, DOCID, CPSERIE, CPNODOC');
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

Procedure TFPagoGlobal.CambiaEstado(xName: char);
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

Procedure TFPagoGlobal.dbgPendientesDragOver(Sender, Source: TObject; X,
   Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
   If (dbgPendientes.Readonly = False) Then
      Accept := True;
End;
{******************************************************************************}

Procedure TFPagoGlobal.dbgPendientesMouseDown(Sender: TObject;
   Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
   If (dbgPendientes.Readonly = False) Then
      dbgPendientes.BeginDrag(False);
End;
{******************************************************************************}

Procedure TFPagoGlobal.dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
Var
   i, xFactor: integer;
   xResta, xWhere: String;
Begin
   If (Not dbgPendientes.Readonly) And (Target = dbgDocPago) Then
   Begin
      If DMTE.cdsMovCxP.FieldByName('TMONID').AsString <> DMTE.cdsCCBco.fieldbyname('TMONID').AsString Then
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
         If DMTE.cdsDocPago.FieldByName('TMONID').Value = DMTE.wtMonLoc Then
         Begin
            DMTE.cdsDocPago.FieldByName('DESALLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value * xFactor, 15, 2);
            DMTE.cdsDocPago.FieldByName('DESALEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value
               / DMTE.cdsDocPago.FieldByName('DETCPAG').Value * xFactor, 15, 2);
         End
         Else
         Begin
            DMTE.cdsDocPago.FieldByName('DESALEXT').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value * xFactor, 15, 2);
            DMTE.cdsDocPago.FieldByName('DESALLOC').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value
               * DMTE.cdsDocPago.FieldByName('DETCPAG').Value * xFactor, 15, 2);
         End;

         DMTE.cdsDocPago.FieldByName('DEANTMN').Value := 0;
         DMTE.cdsDocPago.FieldByName('DEANTME').Value := 0;
         DMTE.cdsDocPago.FieldByName('DEMTOORI').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').Value * xFactor, 15, 2);
         DMTE.cdsDocPago.FieldByName('DEMTOLOC').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALLOC').Value, 15, 2);
         DMTE.cdsDocPago.FieldByName('DEMTOEXT').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALEXT').Value, 15, 2);
         DMTE.cdsDocPago.FieldByName('DEUSER').Value := DMTE.wUsuario;
         DMTE.cdsDocPago.FieldByName('DEFREG').Value := dateS;
         DMTE.cdsDocPago.FieldByName('DEHREG').Value := time;
         DMTE.cdsDocPago.fieldbyname('CLAUXID').AsString := DMTE.cdsMovCxP.FieldByName('CLAUXID').AsString;
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
      //Inicio HPC_200401_CAJa
      If dblcTMon.Text ='D' Then
         dbeImporte.text := dbgDocPago.ColumnByName('DEMTOEXT').FooterValue
      Else
         dbeImporte.text := dbgDocPago.ColumnByName('DEMTOLOC').FooterValue ;
     //Final HPC_200401_CAJa


      wmodifica := True;


   End;
End;

Procedure TFPagoGlobal.dbgDocPagoColExit(Sender: TObject);
Begin
   z2bbtnSumatDocPagoClick(Nil);
   dbgDocPago.RefreshDisplay;
End;

{******************************************************************************}

Procedure TFPagoGlobal.ActSaldosMovCxP;
Var
   xRegAct: TBookMark;
   xAdicional, nFactor: Double;
   xMontoL, xMontoE: String;
   xLoc, xExt, xOri, xcia, xtdia, xperio, ssql, xnreg: String;
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
         sSql := 'Select * from CXP301 '
            + 'WHERE CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID2').AsString)
            + ' AND TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID2').AsString)
            + ' AND CPANOMES=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPANOMM').AsString)
            + ' AND CPNOREG=' + quotedstr(DMTE.cdsDocPago.FieldByName('CPNOREG').AsString);
         DMTE.cdsQry5.Filter := '';
         DMTE.cdsQry5.Filtered := False;
         DMTE.cdsQry5.IndexFieldNames := '';
         DMTE.cdsQry5.Close;
         DMTE.cdsQry5.Datarequest(sSQL);
         DMTE.cdsQry5.Open;
         If (DMTE.cdsQry5.FieldByName('CPSALLOC').AsFloat <> DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat) Then
         Begin
            ShowMessage('Error, se ha realizado la actualización de la misma Obligación por otra estación');
            xErrorGraba := True;
            exit;
         End;

         nFactor := 1;
         If DMTE.cdsDocPago.FieldByName('DOCID2').AsSTRING = '07' Then nFactor := -1;

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
         ssql := 'UPDATE CXP301 '
            + 'SET CPSALLOC=' + xloc + ', CPSALEXT =' + xext + ', CPSALORI =' + xori
            + ' WHERE CIAID=' + quotedstr(xcia)
            + ' AND TDIARID=' + quotedstr(xtdia)
            + ' AND CPANOMES=' + quotedstr(xperio)
            + ' AND CPNOREG=' + quotedstr(xnreg);
         Try
          //DCOM1.AppServer.EjecutaSQL(ssql);
         Except
         End;
         If DMTE.cdsMovCxP.FieldByName('CPPAGLOC').IsNull Then
            DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := 0;
         If DMTE.cdsMovCxP.FieldByName('CPPAGEXT').IsNull Then
            DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := 0;
         If DMTE.cdsMovCxP.FieldByName('CPPAGORI').IsNull Then
            DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := 0;
         DMTE.cdsMovCxP.post;
         DMTE.ControlTran(0, DMTE.cdsMovCxP, 'MOVCXP');
      End
      Else

         Showmessage('No se Actualizó CXP ');
      DMTE.cdsDocPago.Next;
   End;
   DMTE.cdsDocPago.GotoBookmark(xRegAct);
   DMTE.cdsDocPago.FreeBookmark(xRegAct);
   DMTE.cdsDocPago.EnableControls;
   DMTE.cdsMovCxP.Filtered := True;
   DMTE.cdsMovCxP.EnableControls;
End;
{******************************************************************************}

Procedure TFPagoGlobal.ActMovCxP;
Var
   xRegAct: TBookMark;
   ssql: String;
   xtcam, xori, xext, xloc: String;
   xcia, xtdia, xperio, xnreg: String;
Begin
   With DMTE Do
   Begin
      cdsMovCxP.Filtered := False;
      cdsMovCxP.First;
      cdsDocPago.DisableControls;
      xRegAct := cdsDocPago.GetBookmark;
      cdsDocPago.First;
      While Not cdsDocPago.Eof Do
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

            DMTE.cdsMovCxP.fieldbyname('CPPAGLOC').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat - DMTE.cdsMovCxP.fieldbyname('CPSALLOC').AsFloat, 15, 2);
            xloc := DMTE.cdsMovCxP.fieldbyname('CPPAGLOC').AsString;
            DMTE.cdsMovCxP.fieldbyname('CPPAGEXT').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat - DMTE.cdsMovCxP.fieldbyname('CPSALEXT').AsFloat, 15, 2);
            xext := DMTE.cdsMovCxP.fieldbyname('CPPAGEXT').AsString;
            If DMTE.cdsMovCxP.FieldByName('TMONID').Value = DMTE.wTMonLoc Then
            Begin
               DMTE.cdsMovCxP.fieldbyname('CPPAGORI').AsFloat := DMTE.cdsMovCxP.fieldbyname('CPPAGLOC').AsFloat;
               xori := DMTE.cdsMovCxP.fieldbyname('CPPAGORI').AsString;
               If DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat <= 0.02 Then
                  DMTE.cdsMovCxP.FieldByName('CPESTADO').AsString := 'C';
            End
            Else
            Begin
               DMTE.cdsMovCxP.fieldbyname('CPPAGORI').AsFloat := DMTE.cdsMovCxP.fieldbyname('CPPAGEXT').AsFloat;
               xori := DMTE.cdsMovCxP.fieldbyname('CPPAGORI').AsString;
               If DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat <= 0.02 Then
                  DMTE.cdsMovCxP.FieldByName('CPESTADO').AsString := 'C';
            End;
            DMTE.cdsMovCxP.FieldByName('CPTCAMPA').AsFloat := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat, 15, 3);
            DMTE.cdsMovCxP.Post;
            DMTE.ControlTran(0, DMTE.cdsMovCxP, 'MOVCXP');

         End
         Else
         Begin
            ShowMessage('Error : No pudo ubicar el Documento Provisionado');
         End;
         cdsDocPago.Next;
      End;

      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);
      cdsDocPago.EnableControls;
      cdsMovCxP.Filtered := True;
      cdsMovCxP.First;
      cdsMovCxP.EnableControls;
   End;
End;

Procedure TFPagoGlobal.RetornaSaldosMovCxP;
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
         If DMTE.cdsEgrCaja.FieldByName('ECEstado').Value = 'I' Then
         Begin
            DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat - DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat, 15, 2);
            DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat - DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat, 15, 2);
            If DMTE.cdsMovCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
               DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat
            Else
               DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat;
         End;

         DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat - DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat, 15, 2);
         DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat - DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat, 15, 2);
         DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat - DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat, 15, 2);

         DMTE.cdsMovCxP.Post;
         DMTE.cdsMovCxP.Datarequest('SELECT * FROM CXP301 WHERE CIAID=' + QuotedStr(dblcCia.text) + ' AND CLAUXID=' + QuotedStr(dblcClase.text) + ' AND PROV=' + QuotedStr(dblcdAux.text));
         DMTE.AplicaDatos(DMTE.cdsMovCxP, 'MOVCXP');

         If DMTE.cdsEgrCaja.FieldByName('ECEstado').Value = 'C' Then
         Begin
            DMTE.SaldosAuxiliar(DMTE.cdsMovCxP.FieldByName('CIAID').AsString, DMTE.cdsMovCxP.fieldbyname('CPANOMES').AsString,
               DMTE.cdsMovCxP.fieldbyname('CLAUXID').AsString, DMTE.cdsMovCxP.fieldbyname('PROV').AsString, '+',
               DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat, DMTE.cdsMovCxP.fieldbyname('DEMTOEXT').AsFloat,
               DMTE.cdsMovCxP.fieldbyname('TMONID').AsString);
         End;
      End;
      DMTE.cdsDocPago.Next;
   End;
   DMTE.cdsDocPago.EnableControls;
   DMTE.cdsMovCxP.Filtered := True;
   DMTE.cdsMovCxP.EnableControls;
End;

Procedure TFPagoGlobal.RetornaSaldosMovCxPPagados;
Var
   xSQL: String;
Begin
   DMTE.cdsDocPago.DisableControls;
   DMTE.cdsDocPago.First;
   While Not DMTE.cdsDocPago.Eof Do
   Begin
      xSQL := 'Select * from CXP301 '
         + 'WHERE CIAID=''' + DMTE.cdsDocPago.FieldByName('CIAID2').AsString + ''' and '
         + 'TDIARID=''' + DMTE.cdsDocPago.FieldByName('TDIARID2').AsString + ''' and '
         + 'CPANOMES=''' + DMTE.cdsDocPago.FieldByName('CPANOMM').AsString + ''' and '
         + 'CPNOREG=''' + DMTE.cdsDocPago.FieldByName('CPNOREG').AsString + '''';
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

      Try
         DMTE.AplicaDatos(DMTE.cdsMovCxP, 'MOVCXP');
      Except
      End;

      DMTE.SaldosAuxiliar(DMTE.cdsMovCxP.FieldByName('CIAID').AsString, DMTE.cdsMovCxP.fieldbyname('CPANOMES').AsString,
         DMTE.cdsMovCxP.fieldbyname('CLAUXID').AsString, DMTE.cdsMovCxP.fieldbyname('PROV').AsString, '+',
         DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat, DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat, DMTE.cdsMovCxP.fieldbyname('TMONID').AsString);
      DMTE.cdsDocPago.Next;
   End;

   DMTE.cdsDocPago.EnableControls;
End;

Procedure TFPagoGlobal.FormKeyPress(Sender: TObject; Var Key: Char);
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

Procedure TFPagoGlobal.z2bbtnOKCabClick(Sender: TObject);
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
   With DMTE Do
   Begin
      xWhere := 'CIAID =' + quotedstr(dblcCia.Text)
         + ' AND TDIARID =' + quotedstr(dblcTDiario.Text)
         + ' AND ECANOMM =' + quotedstr(edtPeriodo.Text)
         + ' AND ECNOCOMP =' + quotedstr(dbeNoComp.Text);
      If DisplayDescrip('prvTGE', 'CAJA302', 'COUNT(*) TOTREG', xWhere, 'TOTREG') > '0' Then
      Begin
         ShowMessage('Comprobante ya esta Registrado');
         dbeNoComp.Text := '';
         dbeNoComp.SetFocus;
         exit;
      End
      Else
      Begin
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
      End;
   End;
   (Sender As tcontrol).enabled := false;
   perform(CM_DialogKey, VK_TAB, 0);
   wmodifica := False;
End;

Procedure TFPagoGlobal.dbeNoCompExit(Sender: TObject);
Begin
   dbeNoComp.text := DMTE.StrZero(dbeNoComp.text, DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
End;

Procedure TFPagoGlobal.dbgDocPagoCalcTitleAttributes(Sender: TObject;
   AFieldName: String; AFont: TFont; ABrush: TBrush;
   Var ATitleAlignment: TAlignment);
Begin
   If (AFieldName = 'DEMTOLOC') Or (AFieldName = 'DEMTOEXT') Then
      ABrush.Color := clWhite;
End;

Procedure TFPagoGlobal.dbgOtrosCalcTitleAttributes(Sender: TObject;
   AFieldName: String; AFont: TFont; ABrush: TBrush;
   Var ATitleAlignment: TAlignment);
Begin
   If (AFieldName = 'DEMTOLOC') Or (AFieldName = 'DEMTOEXT') Then
      ABrush.Color := clWhite;
End;

Procedure TFPagoGlobal.InhabilitarPaneles;
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

Procedure TFPagoGlobal.EdiTarRegistros;
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

Procedure TFPagoGlobal.AdicionarRegistros;
Var
   xWhere, Aux: String;
Begin
   BlanqueaEdits(pnlActualiza);
   dbeSerie.Text := '000';

   With DMTE Do
   Begin
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

      cdsRegCxP.FieldByName('DETCPAG').Value := strtofloat(dbeTCambio.Text);
      cdsRegCxP.FieldByName('DEFCOMP').Value := cdsEgrCaja.FieldByName('ECFCOMP').Value;
      cdsRegCxP.FieldByName('CPFEMIS').Value := DateS;
      cdsRegCxP.FieldByName('CPFVCMTO').Value := DateS;
      cdsRegCxP.FieldByName('CPANOMM').Value := copy(datetostr(cdsRegCxP.FieldByName('DEFCOMP').Value), 7, 4)
         + copy(datetostr(cdsRegCxP.FieldByName('DEFCOMP').Value), 4, 2);
      cdsRegCxP.FieldByName('DETCPAG').Value := cdsEgrCaja.FieldByName('ECTCAMB').Value;
      cdsRegCxP.FieldByName('DETCDOC').Value := cdsEgrCaja.FieldByName('ECTCAMB').Value;
      cdsRegCxP.FieldByName('DEDH').Value := 'D'; //Inicializo en Debe

      xWhere := 'FECHA=' + wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha, cdsRegCxP.FieldByName('DEFCOMP').AsDateTime) + ''')';
      aux := DMTE.DisplayDescrip('prvTGE', 'TGE114', '*', xWhere, 'FECANO');
      cdsRegCxP.FieldByName('DEANO').Value := cdsqry.FieldByName('FECANO').Value;
      cdsRegCxP.FieldByName('DEMM').Value := cdsqry.FieldByName('FECMES').Value;
      cdsRegCxP.FieldByName('DEDD').Value := cdsqry.FieldByName('FECDIA').Value;
      cdsRegCxP.FieldByName('DESS').Value := cdsqry.FieldByName('FECSS').Value;
      cdsRegCxP.FieldByName('DESEM').Value := cdsqry.FieldByName('FECSEM').Value;
      cdsRegCxP.FieldByName('DETRI').Value := cdsqry.FieldByName('FECTRIM').Value;
      cdsRegCxP.FieldByName('DEAASS').Value := cdsqry.FieldByName('FECAASS').Value;
      cdsRegCxP.FieldByName('DEAASem').Value := cdsqry.FieldByName('FECAASEM').Value;
      cdsRegCxP.FieldByName('DEAATri').Value := cdsqry.FieldByName('FECAATRI').Value;
   End;
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

Procedure TFPagoGlobal.LiberarFiltrosRegistroEgresos;
Begin
   DMTE.cdsTDoc.Filter := '';
   DMTE.cdsTDoc.Filtered := true;
End;

Procedure TFPagoGlobal.EstablecerFiltrosRegistroEgresos;
Begin
   DMTE.cdsTDoc.Filter := 'NOT ( TDIARID IS NULL) OR NOT (TDIARID2 IS NULL) ';
   DMTE.cdsTDoc.Filtered := true;
End;

Procedure TFPagoGlobal.dbeNoRegExit(Sender: TObject);
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

Procedure TFPagoGlobal.z2bbtnOK2Click(Sender: TObject);
Begin
   // VALIDA LA CUENTA DEL CONCEPTO
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
      //
      If Not dbeNoReg.Enabled Then
      Begin
         PnlActualiza.Visible := False;
         pnlDetalle.Enabled := True;
         pnlBotones.Enabled := True;
         z2bbtnSumatClick(sender); // Al salir hay que totalizar
         //quitar los filtros que se hubieran establecido
         liberarfiltrosregistroegresos;
      End
      Else
      Begin
         adicionarRegistros;
      End;
   End;

End;

Procedure TFPagoGlobal.dblcTMon2Exit(Sender: TObject);
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

Procedure TFPagoGlobal.dbeDHChange(Sender: TObject);
Begin
   If Not ((dbeDH.Text = 'D') Or (dbeDH.Text = 'H') Or (length(dbeDH.Text) = 0)) Then
   Begin
      dbeDH.Text := '';
      dbeDH.SetFocus;
   End;
End;

Procedure TFPagoGlobal.dbeImporte2Exit(Sender: TObject);
Var
   xWhere, aux: String;
Begin
///wmc
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

Procedure TFPagoGlobal.z2bbtnCancel3Click(Sender: TObject);
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

Procedure TFPagoGlobal.dbgOtrosDblClick(Sender: TObject);
Begin
   If Not dbgOtrosIbutton.Enabled Then
      exit;

   If dbgOtros.DataSource.DataSet.RecordCount <> 0 Then
   Begin
      inHabilitarPaneles;
      editarRegistros;
   End;
End;

Function TFPagoGlobal.ValidacionCabecera: Boolean;
Begin
   result := false;
   If trim(dblccia.text) = '' Then
   Begin

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
   If trim(dblcTDiario.text) = '' Then
   Begin
      ShowMessage('Ingrese Tipo de Diario');
      dblcTDiario.SetFocus;
      exit;
   End;
   If trim(edtTDiario.text) = '' Then
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

Procedure TFPagoGlobal.z2bbtnImprimeClick(Sender: TObject);
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

         xSQL44 := 'Select * from CAJA302 '
            + 'Where CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
            + ' and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
            + ' and TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
            + ' and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
         DMTE.cdsEgrCaja.Close;
         DMTE.cdsEgrCaja.Filtered := False;
         DMTE.cdsEgrCaja.Filter := '';
         DMTE.cdsEgrCaja.DataRequest(xSQL44);
         DMTE.cdsEgrCaja.Open;
      End;
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

Procedure TFPagoGlobal.FormShow(Sender: TObject);
Var
   ssql: String;
   swhere: String;
   xSQL, xWhere: String;
Begin
   DMTE.AccesosUsuarios(DMTE.wModulo, DMTE.wUsuario, '2', Screen.ActiveForm.Name);
   xVoucher := '';
   //Inicio HPC_201401_CAJA
   vYanoRetencion := 'N';
   //Final HPC_201401_CAJA
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
      xSQL := 'select A.CPTOID, A.CPTODES, A.CUENTAID, FCTZ From CAJA201 A '
         + 'WHERE CPTOIS=''E'' '
         + 'AND EXISTS ( SELECT CUENTAID FROM TGE202 B '
         + 'WHERE A.CUENTAID=B.CUENTAID AND B.CTAACT=''S'' '
         + 'AND B.CIAID=''' + DMTE.cdsEgrCaja.FieldByName('CIAID').AsString + ''') '
         + 'ORDER BY A.CPTOID';
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
      ssql := '';
      ssql := 'CLAUXID=' + quotedstr(DMTE.cdsEgrCaja.fieldbyname('CLAUXID1').AsString);
      edtclasepnl.Text := DMTE.DisplayDescrip('prvClaseAux', 'TGE102', 'CLAUXDES', sWhere, 'CLAUXDES');
      ssql := '';
      ssql := 'AUXID=' + quotedstr(DMTE.cdsEgrCaja.fieldbyname('AUXID').AsString);
      edtAuxpnl.Text := DMTE.DisplayDescrip('prvQry2', 'CNT201', 'AUXNOMB', sWhere, 'AUXNOMB');
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

Procedure TFPagoGlobal.RecuperaDescrip;
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

Procedure TFPagoGlobal.Adiciona;
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

   xSQL := 'Select * from CAJA303 '
      + 'Where CIAID='''' and ECANOMM='''' and '
      + 'TDIARID='''' and ECNOCOMP='''' ';
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

Procedure TFPagoGlobal.Edita(cds: Twwclientdataset);
Var
   xsql, xWhere, xFiltro: String;
Begin
   IniciaDatos;
   cdsFiltro := Cds;

   With DMTE Do
   Begin
      dblcCia.Text := cdsEgrCaja.FieldByName('CIAID').AsString;
      dblcTDiario.Text := cdsEgrCaja.FieldByName('TDIARID').AsString;
      edtPeriodo.Text := cdsEgrCaja.FieldByName('ECANOMM').AsString;
      dbeNoComp.Text := cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
      dbdtpFComp.date := cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
      dblcClase.Text := cdsEgrCaja.FieldByName('CLAUXID').AsString;
      dblcdAux.Text := cdsEgrCaja.FieldbyName('PROV').AsString;
      edtAuxRuc.Text := cdsEgrCaja.FieldbyName('PROVRUC').AsString;
      dbeGiradoA.Text := cdsEgrCaja.FieldByName('ECGIRA').AsString;
      dblcTMon.Text := cdsEgrCaja.FieldByName('TMONID').AsString;
      dbeTCambio.Text := cdsEgrCaja.FieldByName('ECTCAMB').AsString;
      xTC := cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
      dbeImporte.Text := cdsEgrCaja.FieldByName('ECMTOORI').AsString;
      dblcBanco.Text := cdsEgrCaja.FieldByName('BANCOID').AsString;
      dblcCCBco.Text := cdsEgrCaja.FieldByName('CCBCOID').AsString;
      edtCuenta.Text := cdsEgrCaja.FieldByName('CUENTAID').AsString;
      dblcFormPago.Text := cdsEgrCaja.FieldByName('FPAGOID').AsString;
      dbeNoChq.Text := cdsEgrCaja.FieldByName('ECNOCHQ').AsString;
      dbdtpFEmis.date := cdsEgrCaja.FieldbyName('ECFEMICH').AsDateTime;
      dbeLote.Text := cdsEgrCaja.FieldByName('ECLOTE').AsString;
      dblcdCnp.Text := cdsEgrCaja.FieldByName('CPTOID').AsString;
      dbeGlosa.Text := cdsEgrCaja.FieldByName('ECGLOSA').AsString;
      dblcdFEfec.Text := cdsEgrCaja.FieldByName('FLUEID').AsString;
      dblcdCtaCte.Text := cdsEgrCaja.FieldByName('PRVCCBCOID').AsString;
      rECUPERAdESCRIP;
      ActivaFiltro('REGCXP');
      ActivaFiltro('DOCPAGO');

      If cdsEgrCaja.FieldByName('ECEstado').Value = 'I' Then //Si está INCOMPLETO o PENDIENTE
      Begin
         cdsEgrCaja.Edit;
         CambiaEstado('I');

         xWhere := 'CPESTADO=''' + 'P' + ''' AND ' +
            'CLAUXID= ''' + dblcClase.Text + ''' AND ' +
            'PROV=''' + dblcdAux.Text + '''  ';
         xFiltro := ' (( (CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR ' +
            '   ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) ';

         DMTE.cdsMovCxP.active := False;
         DMTE.cdsMovCxP.Datarequest('SELECT * FROM CXP301 WHERE ' + xWhere + ' order by CPANOMES DESC, DOCID, CPSERIE, CPNODOC');
         DMTE.cdsMovCxP.Active := True;
         DMTE.cdsMovCxP.Filter := xFiltro;
         DMTE.cdsMovCxP.Filtered := True;
         dbgOtrosIButton.Enabled := True;
      End;

      If cdsEgrCaja.FieldByName('ECESTADO').Value = 'C' Then //Si está CANCELADO
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

      If cdsEgrCaja.FieldByName('ECESTADO').Value = 'A' Then // Si esta ANULADO
      Begin
         CambiaEstado('A');
         dbgOtrosIButton.Enabled := False;
         ActPnlBotones;
      End;

      z2bbtnSumatClick(Nil);
      z2bbtnSumatDocPagoClick(Nil);
   End;
   (z2bbtnOkCab).enabled := false;
   //z2bbtnNuevo.Visible := False ;
   z2bbtnCancel.Visible := False;

   dblcClase.Enabled := False;
   dblcdAux.Enabled := False;
   xSQL := 'Select * '
          +'  from CAJA102 '
          +' where PROV=' + quotedstr(trim(dblcdAux.Text))
          +'   and BANCOID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('PRVBANCOID').AsString)
          +'   and CCBCOID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('PRVCCBCOID').AsString);
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

Procedure TFPagoGlobal.FormCreate(Sender: TObject);
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

Procedure TFPagoGlobal.AdicIniciaDatos;
Begin
   RecuperarCiaUnica(dblcCia, edtCia);
   edtPeriodo.text := copy(datetostr(dbdtpFComp.date), 7, 4)
      + copy(datetostr(dbdtpFComp.date), 4, 2);
   If dblccia.Text <> '' Then
      perform(CM_DialogKey, VK_TAB, 0);
End;

Procedure TFPagoGlobal.ActualizaSaldosCaja;
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
      With DMTE.cdsEgrCaja Do //SI ES CAJA
         DMTE.ActSdoCaja(fieldbyname('TMONID').AsString, fieldbyname('BANCOID').AsString,
            fieldbyname('ECMTOORI').AsString, fieldbyname('ECFCOMP').AsString);
End;

Procedure TFPagoGlobal.ConfiguraAccesos;
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

Procedure TFPagoGlobal.Libera_Admin;
Begin
   Pon(A1, A2, pnlBotones);
End;

Procedure TFPagoGlobal.Libera_Consul;
Begin

End;

Procedure TFPagoGlobal.Proc_Admin;
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

Procedure TFPagoGlobal.Proc_Consul;
Begin
   pnlCabecera1.Enabled := False;
   pnlCabecera2.Enabled := False;
   pnlDeTalle.Enabled := True;
   pnlBotones.Enabled := False;
End;

Procedure TFPagoGlobal.LibConfigAccesos;
Begin
   If DMTE.wAdmin = 'G' Then
      Libera_Admin
   Else
   Begin
      If DMTE.wModo = 'C' Then
         Libera_Consul;
   End;
End;

Procedure TFPagoGlobal.ValidaCabecera2;
Begin
   If length(dblcCia.Text) = 0 Then Raise exception.Create('Falta Codigo de Compañia');
   If length(edtCia.Text) = 0 Then Raise exception.Create('Codigo de Compañia Errado');
   If length(dblcTDiario.Text) = 0 Then Raise exception.Create('Falta Tipo de Diario');
   If length(edtTDiario.Text) = 0 Then Raise exception.Create('Tipo de Diario Errado');

   If length(dbeGiradoA.Text) = 0 Then Raise exception.Create('Datos del Proveedor Errados');

   If length(dblcTMon.Text) = 0 Then Raise exception.Create('Falta Tipo de Moneda');
   If length(edtTMon.Text) = 0 Then Raise exception.Create('Codigo de Moneda Errado');
   If length(dbeTCambio.Text) = 0 Then
      Raise exception.Create('Falta Tipo de Cambio')
   Else
      If strtofloat(dbeTCambio.Text) <= 0 Then Raise exception.Create('Tipo de Cambio Errado');

   If length(dbeImporte.Text) = 0 Then
      Raise exception.Create('Falta Monto a Pagar')
   Else
      If strtofloat(dbeImporte.Text) <= 0 Then Raise exception.Create('Importe Errado');

   If length(dblcBanco.Text) = 0 Then Raise exception.Create('Falta definir Banco');
   If length(edtBanco.Text) = 0 Then Raise exception.Create('Codigo de Banco Errado');

   If dblcCCBco.Enabled = True Then
   Begin
      If length(dblcCCBco.Text) = 0 Then Raise exception.Create('Falta Cuenta Corriente Banco');
      If dbdtpFEmis.Date = 0 Then
      Begin
         dbdtpFEmis.SetFocus;
         Raise exception.create('Ingrese Fecha de Emisión del Cheque');
      End;

   End;

   If dblcFormPago.Enabled = True Then
   Begin
      If length(dblcFormPago.Text) = 0 Then Raise exception.Create('Falta Forma de Pago');
      If length(edtFormPago.Text) = 0 Then Raise exception.Create('Codigo de Forma de Pago Errado');
   End;

   If (dbeNoChq.Enabled = True) And (length(dbeNoChq.Text) = 0) Then
      Raise exception.Create('Falta No. de Cheque');

   If (dbdtpFeMis.Enabled = True) And (dbdtpFeMis.Date = 0) Then
      Raise exception.Create('Falta Fecha de Emisión del Cheque');

   If length(dbeLote.Text) = 0 Then Raise exception.Create('Falta Lote');
   If length(dblcdCnp.Text) = 0 Then Raise exception.Create('Falta Concepto');
End;

Procedure TFPagoGlobal.Z2bbtnEmiChqClick(Sender: TObject);
Var
   strChq: structChq;
   xsql, ArchivoReporte, WECCHQEMI, wGiradoDTR, wCtaCteBCO, xSQL44: String;
   xTotal: double;
Begin
   If trim(dblcCCBco.Text) <> '' Then
   Begin
      xTotal := 0;
      wGiradoDTR := '';
      //Inicio HPC_201401_CAJA
      //If xDTRPorc = 0 Then // si no se aplica DETRACCION
      If (xDTRPorc = 0) AND (vYanoRetencion='N') Then
      //Final HPC_201401_CAJA
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
            + 'from CNT320 '
            + 'WHERE CIAID=''' + DMTE.cdsEgrcaja.FieldByName('CIAID').AsString + ''' AND '
            + 'ANOMM=''' + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' AND '
            + 'TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' AND '
            + 'ECNOCOMP=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' AND '
            + '( DOCID2 IS NULL OR DOCID2='''' ) ';
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

     /// se carga variable para realizar el UPDATE despues de emitido el Cheque
         xSQL := 'UPDATE CAJA302 SET ECCHQEMI=''S'' '
            + 'WHERE CIAID=''' + dblcCia.text + ''' and '
            + 'TDIARID=''' + dblcTDiario.text + ''' and '
            + 'ECANOMM=''' + edtPeriodo.text + ''' and '
            + 'ECNOCOMP=''' + dbeNoComp.text + ''' ';
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
            xSQL44 := 'Select * from CAJA302 '
               + 'Where CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
               + ' and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
               + ' and TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
               + ' and ECNOCOMP=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString);
            DMTE.cdsEgrCaja.Close;
            DMTE.cdsEgrCaja.DataRequest(xSQL44);
            DMTE.cdsEgrCaja.Open;
         End;

         xTotal := DMTE.cdsEgrCaja.FieldbyName('ECMTOORI').AsFloat;
         If DMTE.cdsEgrCaja.FieldbyName('TIPDET').AsString = 'I4' Then // por ser el importe de DETRACCION
         Begin
         // ACCESA AL TGE105 PARA TOMAR EL NOMBRE DEL BANCO PARA EL CHEQUE DE LA DETRACCION
            xSQL := 'SELECT * FROM TGE105 WHERE BANCOPRF=' + quotedstr('BN-');
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
         xSQL := 'UPDATE CAJA302 SET ECCHQEMI=''S'' '
            + 'WHERE CIAID=''' + dblcCia.text + ''' and '
            + 'TDIARID=''' + dblcTDiario.text + ''' and '
            + 'ECANOMM=''' + edtPeriodo.text + ''' and '
            + 'ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
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

Procedure TFPagoGlobal.SaldosAux;
Var
   Previo,
      Actual,
      xClase: String;
   cdsClone: TwwClientDataSet;
Begin
   With DMTE.cdsDocPago Do
   Begin
      If RecordCount = 0 Then
         Exit;

      cdsClone := TwwClientDataSet.create(self);
      DisableControls;
      Previo := '';
      Actual := '';
      IndexFieldNames := 'PROV';
      First;
      While Not EOF Do
      Begin
         Actual := FieldBYname('PROV').AsString;
         xClase := Fieldbyname('CLAUXID').AsString;
         If Actual <> Previo Then
         Begin
            Opera(Actual, xClase, cdsClone);
         End;
         Previo := Actual;
         Next;
      End;
      IndexFieldNames := '';
      EnableControls;
      cdsClone.free;
   End;
End;

Procedure TFPagoGlobal.Opera(xProv, xClase: String; cdsClone: TwwClientDataSet);
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

Function TFPagoGlobal.BuscaClase: String;
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

Procedure TFPagoGlobal.dblcTDoc2Exit2(Sender: TObject);
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

Procedure TFPagoGlobal.RecCptosDifC;
Begin
   If trim(dblcCCBco.Text) = '' Then
   Begin
      If Not DMTE.RecuperarDatos('TGE105', 'CPTODIFG,CPTODIFP,CTADIFG,CTADIFP,CCOSDIF', 'BANCOID=''' + dblcBanco.Text + '''') Then
         Raise exception.create('No se puede Contabilizar ' + #13 +
            'Falta Definir las Cuentas de Dif. de Cambio');
   End
   Else
   Begin
      If Not DMTE.RecuperarDatos('TGE106', 'CPTODIFG,CPTODIFP,CTADIFG,CTADIFP,CCOSDIF', 'BANCOID=''' + dblcBanco.Text +
         ''' AND CCBCOID=''' + DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString + '''') Then
         Raise exception.create('No se puede Contabilizar ' + #13 +
            'Falta Definir las Cuentas de Dif. de Cambio');
   End;
   wCptoGan := DMTE.cdsRec.fieldbyname('CPTODIFG').AsString;
   wCptoPer := DMTE.cdsRec.fieldbyname('CPTODIFP').AsString;
   wCtaGan := DMTE.cdsRec.fieldbyname('CTADIFG').AsString;
   wCtaPer := DMTE.cdsRec.fieldbyname('CTADIFP').AsString;
   wCCosDif := DMTE.cdsRec.fieldbyname('CCOSDIF').AsString;
End;

Procedure TFPagoGlobal.dbeLoteExit(Sender: TObject);
Begin
   If z2bbtnCancel.Focused Then exit;

   dbeLote.text := DMTE.StrZero(dbeLote.text, DMTE.cdsEgrCaja.FieldByName('ECLOTE').Size);
End;

Procedure TFPagoGlobal.dbeTCambioEnter(Sender: TObject);
Begin
   strTmp := TCustomEdit(Sender).Text;
End;

Procedure TFPagoGlobal.dbeTCambioExit(Sender: TObject);
Begin
   If strTmp <> dbeTCambio.text Then
   Begin
      dbeTcambio.text := CajaDec(dbeTCambio.text, 4);
   End;
End;

Procedure TFPagoGlobal.dblcBancoExit(Sender: TObject);
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

Procedure TFPagoGlobal.dblcCCBcoEnter(Sender: TObject);
Begin
   strTmp := dblcCCBco.Text;
End;

Procedure TFPagoGlobal.dblcCCBcoExit(Sender: TObject);
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

Procedure TFPagoGlobal.dblcClaseExit(Sender: TObject);
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

   xSQLx := 'Select * from CNT201 Where CLAUXID=''' + dblcClase.Text + ''' and ACTIVO=''S''';
   DMTE.cdsAux.Close;
   DMTE.cdsAux.DataRequest(xSQLx);
   DMTE.cdsAux.Open;

   dblcdAux.Selected.Clear;
   dblcdAux.Selected.Add('AUXID'#9'10'#9'Auxiliar'#9'F');
   dblcdAux.Selected.Add('AUXRUC'#9'15'#9'R.U.C'#9'F');
   dblcdAux.Selected.Add('AUXNOMB'#9'40'#9'Nombre Auxiliar'#9'F');

End;

Procedure TFPagoGlobal.dblcdAuxExit(Sender: TObject);
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

   xSql := 'SELECT * FROM CAJA102 WHERE PROV=' + quotedstr(trim(dblcdAux.Text)) + ' ORDER BY CCBCOID';
   DMTE.cdsProvCta.Close;
   DMTE.cdsProvCta.INDEXFIELDNAMES := '';
   DMTE.cdsProvCta.DataRequest(xSql);
   DMTE.cdsProvCta.Open
End;

Procedure TFPagoGlobal.ProveedoresNotificados;
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

Procedure TFPagoGlobal.dblcFormPagoExit(Sender: TObject);
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

Procedure TFPagoGlobal.dblcTMonExit(Sender: TObject);
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

Procedure TFPagoGlobal.dblcdCnpExit(Sender: TObject);
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

Procedure TFPagoGlobal.BorraGrid;
Begin
   With DMTE.cdsDocPago Do
   Begin
      If RecordCount <> 0 Then
      Begin
         DisableControls;
         first;
         While Not eof Do
         Begin
            delete;
         End;
         EnableControls;
      End;
   End;
End;

Procedure TFPagoGlobal.dblcClaseDetExit(Sender: TObject);
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

Procedure TFPagoGlobal.dblcdAuxExit2(Sender: TObject);
Begin
   If dblcClaseDet.Focused Then Exit;
   If z2bbtnCancel3.Focused Then exit;
   If dblcdCnp2.Focused Then exit;

   dbeAuxDet.text := DMTE.DisplayDescripLocal(DMTE.cdsAux, 'AUXID', dblcdAuxDet.Text, 'AUXNOMB');

   If dbeAuxDet.Text = '' Then
   Begin
      ShowMessage('Error : Auxiliar no Valido');
      dblcdAuxDet.SetFocus;
      Exit;
   End;
End;

Procedure TFPagoGlobal.dblcdCnp2Exit2(Sender: TObject);
Var
   ssql, xwhere: String;
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

Procedure TFPagoGlobal.wwDBEdit1Change22(Sender: TObject);
Begin
   wmodifica := True;
End;

Procedure TFPagoGlobal.FormDestroy(Sender: TObject);
Begin
   cf1.Free;
End;

Procedure TFPagoGlobal.dblcdFEfecEnter(Sender: TObject);
Begin
   strTmp := dblcdFEfec.Text;
End;

Procedure TFPagoGlobal.dblcdFEfecExit(Sender: TObject);
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

Procedure TFPagoGlobal.ActDetCaja;
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

Procedure TFPagoGlobal.ActDetCxP;
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
         With DMTE Do
         Begin
            If dblcTMon.Text = DMTE.wtMonLoc Then
            Begin
               cdsDocPago.FieldByName('DESALEXT').AsFloat := DMTE.FRound(cdsDocPago.FieldByName('DESALLOC').AsFloat / cdsDocPago.FieldByName('DETCPAG').AsFloat, 15, 2);
               cdsDocPago.FieldByName('DEMTOEXT').AsFloat := DMTE.FRound(cdsDocPago.FieldByName('DEMTOLOC').AsFloat / cdsDocPago.FieldByName('DETCPAG').AsFloat, 15, 2);
            End
            Else
            Begin
               cdsDocPago.FieldByName('DESALLOC').AsFloat := cdsDocPago.FieldByName('DESALEXT').AsFloat * cdsDocPago.FieldByName('DETCPAG').AsFloat;
               cdsDocPago.FieldByName('DEMTOLOC').AsFloat := cdsDocPago.FieldByName('DEMTOEXT').AsFloat * cdsDocPago.FieldByName('DETCPAG').AsFloat;
            End;
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

Procedure TFPagoGlobal.ActualizaFiltro;
Begin
End;

Procedure TFPagoGlobal.AsignaCDSFiltro(cds: TwwClientDataset);
Begin
   cdsFiltro := cds;
End;

Procedure TFPagoGlobal.ActualizaDetCanje;
Begin
   // ABRIR DETALLE DE CANJE
   DMTE.cdsDetCanjeCxP.close;
   DMTE.cdsDetCanjeCxP.DataRequest('SELECT * FROM CXP305 WHERE CIAID = ''''');
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

      DMTE.cdsDocPago.Next;
   End;
   DMTE.cdsDocPago.First;
   DMTE.cdsDocPago.EnableControls;
   DMTE.ControlTran(0, DMTE.cdsDetCanjeCxP, 'DETCANJECXP');
   DMTE.cdsDetCanjeCxP.Close;
End;

Procedure TFPagoGlobal.Buscar1Click2(Sender: TObject);
Begin
   lkdCxP.LookupTable := DMTE.cdsMovCxP;
   lkdCxP.Execute;
End;

Procedure TFPagoGlobal.lkdCxPCloseDialog(Dialog: TwwLookupDlg);
Begin
   lkdCxP.LookupTable := Nil;
End;

Procedure TFPagoGlobal.lkdCxPInitDialog(Dialog: TwwLookupDlg);
Begin
   Dialog.wwDBGrid1.TitleLines := 2;
   Dialog.wwDBGrid1.Selected.clear;
   Dialog.wwDBGrid1.Selected.Assign(dbgPendientes.Selected);
   Dialog.Width := 400;
End;

Procedure TFPagoGlobal.edtCuentaExit(Sender: TObject);
Var
   ssql: String;
   sWhere: String;
Begin
   If z2bbtnCancel.Focused Then exit;
   If dblcFormPago.Focused Then exit;

   ssql := 'SELECT * FROM TGE202 '
      + 'WHERE CIAID=' + quotedstr(dblccia.Text) + ' AND '
      + 'CUENTAID=' + quotedstr(edtCuenta.text);
   DMTE.cdsQry2.Close;
   DMTE.cdsQry2.DataRequest(ssql);
   DMTE.cdsQry2.open;
   If (DMTE.cdsQry2.fieldbyname('CTA_AUX').AsString = 'S') Then
   Begin
      ssql := 'CLAUXID=' + quotedstr(DMTE.cdsEgrCaja.fieldbyname('CLAUXID1').AsString);
      edtclasepnl.Text := DMTE.DisplayDescrip('prvClaseAux', 'TGE102', 'CLAUXDES', sWhere, 'CLAUXDES');
      ssql := 'AUXID=' + quotedstr(DMTE.cdsEgrCaja.fieldbyname('AUXID').AsString);
      edtAuxpnl.Text := DMTE.DisplayDescrip('prvQry2', 'CNT201', 'AUXNOMB', sWhere, 'AUXNOMB');
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

Procedure TFPagoGlobal.Limpiapnlaux;
Begin
   edtAuxpnl.visible := false;
   edtAuxpnl.text := '';
   edtclasepnl.visible := false;
   edtclasepnl.text := '';
End;

Procedure TFPagoGlobal.dbeNoChqExit(Sender: TObject);
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

Procedure TFPagoGlobal.DescripPagoFact(Const xCIAID, xECANOMM, xTDIARID, xECNOCOMP: String);
Var
   xSQL: String;
Begin
   If (DMTE.SRV_D = 'DB2NT') Or (DMTE.SRV_D = 'DB2400') Then
      xSQL := 'SELECT TGE105.BANCOABR, TGE103.TMONABR, TGE106.CCBCODES, TGE112.FPAGOABR, ' +
         'TGE102.CLAUXABR, TGE110.DOCABR, CNT201.AUXABR, TGE101.CIADES, ' +
         'TGE104.TDIARABR, TGE217.FLUEFEABR ' +
         'FROM CAJA302 ' +
         'LEFT JOIN TGE105 ON (CAJA302.BANCOID = TGE105.BANCOID) ' +
         'LEFT JOIN TGE106 ON (CAJA302.BANCOID = TGE106.BANCOID) ' +
         'AND (CAJA302.CCBCOID = TGE106.CCBCOID) ' +
         'LEFT JOIN TGE103 ON (CAJA302.TMONID = TGE103.TMONID) ' +
         'LEFT JOIN TGE112 ON (CAJA302.FPAGOID = TGE112.FPAGOID) ' +
         'LEFT JOIN TGE102 ON (CAJA302.CLAUXID = TGE102.CLAUXID) ' +
         'LEFT JOIN TGE110 ON (CAJA302.DOCID = TGE110.DOCID) ' +
         'LEFT JOIN CNT201 ON (CAJA302.PROV = CNT201.AUXID ' +
         'AND CAJA302.CLAUXID =CNT201.CLAUXID) ' +
         'LEFT JOIN TGE101 ON (CAJA302.CIAID = TGE101.CIAID) ' +
         'LEFT JOIN TGE104 ON (CAJA302.TDIARID = TGE104.TDIARID) ' +
         'LEFT JOIN TGE217 ON (CAJA302.FLUEID = TGE217.FLUEFEID) ' +
         'WHERE CAJA302.CIAID=''' + xCIAID + ''' AND ' +
         'CAJA302.TDIARID=''' + xTDIARID + ''' AND ' +
         'CAJA302.ECANOMM=''' + xECANOMM + ''' AND ' +
         'CAJA302.ECNOCOMP=''' + xECNOCOMP + ''' '
   Else
      If DMTE.SRV_D = 'ORACLE' Then
         xSQL := 'SELECT TGE105.BANCOABR, TGE103.TMONABR, TGE106.CCBCODES, ' +
            'TGE112.FPAGOABR, TGE102.CLAUXABR, TGE110.DOCABR, CNT201.AUXABR, ' +
            'TGE101.CIADES, TGE104.TDIARABR, TGE217.FLUEFEABR ' +
            'FROM CAJA302, TGE105, TGE106, TGE103, TGE112, TGE102, ' +
            ' TGE110, CNT201, TGE101, TGE104, TGE217 ' +
            'WHERE CAJA302.CIAID=''' + xCIAID + ''' AND ' +
            'CAJA302.TDIARID=''' + xTDIARID + ''' AND ' +
            'CAJA302.ECANOMM=''' + xECANOMM + ''' AND ' +
            'CAJA302.ECNOCOMP=''' + xECNOCOMP + ''' ' +
            ' AND (CAJA302.BANCOID = TGE105.BANCOID (+) ) ' +
            ' AND (CAJA302.BANCOID = TGE106.BANCOID (+) ) ' +
            ' AND (CAJA302.CCBCOID = TGE106.CCBCOID (+) ) ' +
            ' AND (CAJA302.TMONID = TGE103.TMONID (+) ) ' +
            ' AND (CAJA302.FPAGOID = TGE112.FPAGOID (+) ) ' +
            ' AND (CAJA302.CLAUXID = TGE102.CLAUXID (+) ) ' +
            ' AND (CAJA302.DOCID = TGE110.DOCID (+) ) ' +
            ' AND (CAJA302.PROV = CNT201.AUXID (+) )' +
            ' AND (CAJA302.CLAUXID =CNT201.CLAUXID (+) ) ' +
            ' AND (CAJA302.CIAID = TGE101.CIAID (+) ) ' +
            ' AND (CAJA302.TDIARID = TGE104.TDIARID (+) ) ' +
            ' AND (CAJA302.FLUEID = TGE217.FLUEFEID (+) ) ';
   DMTE.cdsDescrip.close;
   DMTE.cdsDescrip.dataRequest(xSQL);
End;

Procedure TFPagoGlobal.ppHeaderBand2BeforePrint(Sender: TObject);
Begin
   pplblCia.text := edtCia.text;
   ppdbtCiaRuc.text := DMTE.DisplayDescrip('prvTGE', 'TGE101', 'CIARUC', 'CIAID=' + quotedstr(dblcCia.text), 'CIARUC');
   pplblNumero.text := dbeNoComp.text;
   pplblNombreCli.text := dbeGiradoA.text;
   pplblNRucCli.text := edtAuxRuc.text;
   pplblNDirCli.text := xDirAux;
   pplblNCtaCte.text := dblcdCtaCte.text;
End;

Procedure TFPagoGlobal.Z2bbtnNotaAbonoClick(Sender: TObject);
Begin
   pprptNotaAbono.TEMPLATE.FileName := wRutaRpt + '\NotaAbono.rtm';
   pprptNotaAbono.template.LoadFromFile;
   pprptNotaAbono.print;
End;

Procedure TFPagoGlobal.ppDetailBand2BeforePrint(Sender: TObject);
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

Procedure TFPagoGlobal.dbeTCExit(Sender: TObject);
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

Procedure TFPagoGlobal.dbeMPLExit(Sender: TObject);
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

Procedure TFPagoGlobal.dbeMPEExit(Sender: TObject);
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

Procedure TFPagoGlobal.isBuscaExit(Sender: TObject);
Begin
   Screen.Cursor := crDefault;
   pnlBusca.Visible := False;
End;

Procedure TFPagoGlobal.dbgPendientesTitleButtonClick(Sender: TObject;
   AFieldName: String);
Begin
   pnlBusca.Visible := True;
   lblBusca.Caption := dbgPendientes.ColumnByName(AFieldName).DisplayLabel;
   isBusca.SearchField := AFieldName;
   isBusca.SetFocus;
End;

Procedure TFPagoGlobal.dblcdAuxEnter(Sender: TObject);
Begin
   If dblcClase.Text = '' Then
      dblcdAux.SetFocus;
End;

Procedure TFPagoGlobal.BitBtn1Click(Sender: TObject);
Begin
   lkdCxP.LookupTable := DMTE.cdsMovCxP;
   lkdCxP.Execute;
End;

Procedure TFPagoGlobal.dblcdCCostoExit(Sender: TObject);
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

Procedure TFPagoGlobal.Z2bbtnRetencionClick(Sender: TObject);
Var
   xSQL: String;
   x10: Integer;
Begin
   xSQL := 'Select A.*, C.DOCABR DOCDESC, B.AUXNOMB, B.AUXDIR,D.CIADES, D.CIARUC '
      + 'from CNT320 A, CNT201 B, TGE110 C, TGE101 D '
      + 'WHERE A.CIAID=''' + DMTE.cdsEgrCaja.FieldByName('CIAID').AsString + ''' AND '
      + 'A.ANOMM=''' + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' AND '
      + 'A.TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' AND '
      + 'A.ECNOCOMP=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' '
      + 'AND A.CLAUXID=B.CLAUXID AND A.AUXID=B.AUXID '
      + 'AND C.DOCMOD=''CXP'' AND C.DOCID=A.DOCID '
      + 'AND D.CIAID=A.CIAID '
      + 'ORDER BY A.CLAUXID, A.AUXID';

   DMTE.cdsRetencion.Close;
   DMTE.cdsRetencion.Datarequest(xSQL);
   DMTE.cdsRetencion.Open;

   If DMTE.cdsRetencion.RecordCount <= 0 Then
   Begin
      ShowMessage('No Existe Retención');
      Exit;
   End;
   DMTE.cdsRetencion.IndexFieldNames := 'RETNUMERO;CLAUXID;AUXID';
   ;
   ppdbRetencion.DataSource := DMTE.dsRetencion;
   pprRetencion.TEMPLATE.FileName := DMTE.wRutaCNT + '\Retenciones.rtm';
   pprRetencion.template.LoadFromFile;

// Inicio HPC_201403_CAJA
// cambia control de diseño de reporte
   if cbDisenoRep.Checked then
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
// Fin HPC_201403_CAJA   
End;

Procedure TFPagoGlobal.dblcdAuxDropDown(Sender: TObject);
Begin
   DMTE.cdsAux.IndexFieldNames := 'AUXNOMB';
End;

Procedure TFPagoGlobal.Contab_DocPago_Retencion_Debe(xRL, xRE, xRO: double);
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

Procedure TFPagoGlobal.Contab_DocPago_Retencion_Haber;
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
         xSQL := 'SELECT DOCID, TMONID,TCANJEID,CPNOGRAV,CPIGV,CPGRAVAD,CPCANJE,CPMTOLOC,CPMTOEXT,PROVRETIGV '
            + ' FROM CXP301 '
            + ' where CIAID=''' + DMTE.cdsDocPago.fieldbyname('CIAID2').AsString + ''' and '
            + ' CPANOMES=''' + DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString + ''' and '
            + ' TDIARID=''' + DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString + ''' and '
            + ' CPNOREG=''' + DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString + ''' ';
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
         + 'SUM( MTORETLOC ) RETLOC, SUM( MTORETEXT ) RETEXT '
         + 'From CNT320 '
         + 'WHERE CIAID=''' + DMTE.cdsEgrCaja.FieldByName('CIAID').AsString + ''' AND '
         + 'ANOMM=''' + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' AND '
         + 'TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' AND '
         + 'ECNOCOMP=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' '
         + 'GROUP BY RETSERIE, RETNUMERO, FECPAGO';
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
      End;
   End;
End;

Procedure TFPagoGlobal.Contab_DifCamDocPago_Retencion(wPorcPago, xMtoRetL, xMtoRetLH: double);
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

Procedure TFPagoGlobal.GrabaCabeceraDeComprobante;
Var
   xSQL: String;
Begin

   DMTE.cdsEgrCaja.CancelUpdates;
   xSQL := 'Select * from CAJA302 '
      + 'Where CIAID=''' + dblcCia.Text + ''' and '
      + 'ECANOMM=''' + edtPeriodo.Text + ''' and '
      + 'TDIARID=''' + dblcTDiario.Text + ''' and '
      + 'ECNOCOMP=''' + dbeNoComp.Text + ''' ';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest(xSQL);
   DMTE.cdsEgrCaja.Open;
   If DMTE.cdsEgrCaja.RecordCount = 0 Then
   Begin
      DMTE.cdsEgrCaja.Insert;
      DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'X';
      DMTE.cdsEgrCaja.FieldByName('CIAID').AsString := dblcCia.Text;
      DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString := edtPeriodo.Text;
      DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString := dblcTDiario.Text;
      DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString := dbeNoComp.Text;
   End
   Else
   Begin
      DMTE.cdsEgrCaja.Edit;
      DMTE.cdsEgrCaja.FieldByName('ECHREG').Value := time;
   End;
   DMTE.ControlTran(9, DMTE.cdsEgrCaja, 'EGRCAJA');
End;

Procedure TFPagoGlobal.dbeNoCompEnter(Sender: TObject);
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

Procedure TFPagoGlobal.Button1Click(Sender: TObject);
Var
   hola: boolean;
Begin
   hola := DMTE.CalculaRetencionIGV;
   If hola Then
      showMessage('Se Genero Retención')
   Else
      showMessage('NO se Genero Retención');

End;

Procedure TFPagoGlobal.Z2bbtChqVouchClick(Sender: TObject);
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
         + 'from CNT320 '
         + 'WHERE CIAID=''' + DMTE.cdsEgrcaja.FieldByName('CIAID').AsString + ''' AND '
         + 'ANOMM=''' + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' AND '
         + 'TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' AND '
         + 'ECNOCOMP=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' AND '
         + '( DOCID2 IS NULL OR DOCID2='''' ) ';
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
            xSQL := 'UPDATE CAJA302 SET ECCHQEMI=''S'' '
               + 'WHERE CIAID=''' + dblcCia.text + ''' and '
               + 'TDIARID=''' + dblcTDiario.text + ''' and '
               + 'ECANOMM=''' + edtPeriodo.text + ''' and '
               + 'ECNOCOMP=''' + dbeNoComp.text + ''' ';
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

Procedure TFPagoGlobal.GeneraRegChqVouch;
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

   xsql := 'SELECT A.* ,0.00 DEBE,0.00 HABER FROM CAJA304 A  '
      + 'WHERE ( A.CIAID=' + quotedstr('XY') + ' AND '
      + 'A.ECANOMM=' + quotedstr('190001') + ' ) ';
   DMTE.cdsTrans.IndexFieldNames := '';
   DMTE.cdsTrans.Filter := '';
   DMTE.cdsTrans.Filtered := False;
   DMTE.cdsTrans.Close;
   DMTE.cdsTrans.DataRequest(xSQL);
   DMTE.cdsTrans.Open;
   DMTE.cdsTrans.EmptyDataSet;

   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' Then
   Begin
      xsql := 'SELECT A.*, B.CIADES FROM CAJA304 A, TGE101 B  '
         + 'WHERE ( A.CIAID=' + quotedstr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString) + ' AND '
         + 'A.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND '
         + 'A.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND '
         + 'A.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString) + ' AND '
         + 'A.CIAID=B.CIAID ) ';
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

         If (DMTE.xSRV_RUTA = '\\INCORESA') Or (DMTE.xSRV_RUTA = '\\SACSA') Or (DMTE.xSRV_RUTA = '\\APLICACIONES\SOLAPLI') Then
         Begin
            xSQL := 'Select AUXNOMB from CNT201 '
               + 'Where CLAUXID=''' + DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString + ''' and '
               + 'AUXID=''' + DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString + '''';
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest(xSQL);
            DMTE.cdsQry.Open;
            DMTE.cdsTrans.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.FieldByName('AUXNOMB').AsString;
         End;
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

Procedure TFPagoGlobal.pprChqVouchPrintingComplete(Sender: TObject);
Begin
   DMTE.xFlagP := True;
End;

Procedure TFPagoGlobal.dbeImporteKeyPress(Sender: TObject;
   Var Key: Char);
Begin
   If Key In [' ', 'A'..'Z', 'a'..'z',
      '°', '|', '¬', '!', '"', '#', '$', '%', '&', '/', '(', ')',
      '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '[',
      ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''',
      '-', '_'] Then
      Key := #0;
End;

Procedure TFPagoGlobal.dbeImporteExit(Sender: TObject);
Begin
   If length(Trim(dbeImporte.Text)) = 0 Then
      Raise exception.Create('Ingrese Importe')
   Else
   Begin
      dbeImporte.Text := Floattostr(strtoFloat(dbeImporte.Text));
   End;
End;

Procedure TFPagoGlobal.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Function TFPagoGlobal.CalculaRet: double;
Var
   xTotAPagRet, xPorcAplica, xTotRetencion: double;
   xbAplica: boolean;
   xSQL, sRetNC: String;
   //Inicio HPC_201401_CAJA
   vRetencion: Real;
   vDetraccion:String;
   vProvRetiene:String;
   //Final HPC_201401_CAJA
Begin
// Inicio HPC_201401_CAJA
   z2bbtnSumatClick(Self);
   Result := xRetLoc;
   exit;
   {
// Para Saber si la Compañía Retiene IGV.

   Result := 0;

   xSQL := 'Select CIAID, CIARETIGV from TGE101 where CIAID=''' + DMTE.cdsEgrCaja.FieldByName('CIAID').AsString + ''' ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.Datarequest(xSQL);
   DMTE.cdsQry.Open;

   If DMTE.cdsQry.FieldByName('CIARETIGV').AsString <> 'S' Then Exit;

 // Tasas de La Retención
   xSQL := 'SELECT A.*, CASE WHEN MODO=''PROVISIONADO'' THEN B.PROVRETIGV ELSE NULL END PROVRETIGV '
      + 'FROM ( '

   + 'SELECT ''PROVISIONADO'' MODO, B.PROVRETIGV PROVDOC, B.TCANJEID, A.DETCPAG DETCDOC, B.TMONID, '
      + 'A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, '
      + 'A.PROVRUC, A.DOCID2, A.TDIARID2, A.CPANOMM, A.CPNOREG, A.CPSERIE, A.CPNODOC, A.CPFEMIS, '
      + 'A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, '
      + 'NVL(B.FLAGVAR2,''N'') DETRACCION, '
      + 'CASE WHEN B.TMONID=' + Quotedstr(DMTE.wTmonLoc)
      + ' THEN case when (nvl(B.CPMTOLOC,0)-nvl(B.CPPAGLOC,0))>0 '
      + 'then ROUND(A.DEMTOLOC/(nvl(B.CPMTOLOC,0)-nvl(B.CPPAGLOC,0)),5) '
      + 'else 0 end '
      + ' ELSE case when (nvl(B.CPMTOEXT,0)-nvl(B.CPPAGEXT,0))>0 '
      + 'then ROUND(A.DEMTOEXT/(nvl(B.CPMTOEXT,0)-nvl(B.CPPAGEXT,0)),5) '
      + 'else 0 end '
      + 'END PORCPAGO, ''D'' DEDH, '
      + 'B.CPFEMIS CPFEMIPROV, (nvl(B.CPGRAVAD,0)+nvl(B.CPGRAVAD2,0)+nvl(B.CPNOGRAV,0)+nvl(B.CP_OTROS,0)) CPGRAVAD, B.CPNOGRAV, '
      + '(nvl(B.CPIGV,0)+nvl(B.CPIGV2,0)+nvl(B.IGV_GRA_NO_DEST,0)) CPIGV, B.CPPAGORI, '
      + 'B.CPMTOLOC, B.CPMTOEXT, C.DOCRETIGV, C.DOCRESTA, 0.00 MTOBASERET, 0.00 MONTORET '
      + 'FROM CAJA303 A, CXP301 B, TGE110 C '
      + 'WHERE A.CIAID=''' + DMTE.cdsEgrCaja.FieldByName('CIAID').AsString + ''' AND '
      + 'A.TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' AND '
      + 'A.ECANOMM=''' + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' AND '
      + 'A.ECNOCOMP=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' '
      + 'AND B.CIAID=A.CIAID2 AND B.TDIARID=A.TDIARID2 AND B.CPANOMES=A.CPANOMM '
      + 'AND B.CPNOREG=A.CPNOREG AND C.DOCMOD=''CXP'' and C.DOCID=A.DOCID2 '

   + 'UNION ALL '

   + 'SELECT ''NO PROVISIONADO'' MODO, '''' PROVDOC, '''' TCANJEID, A.DETCPAG DETCDOC, A.TMONID, '
      + 'A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, '
      + 'B.PROVRUC, A.DOCID2, A.TDIARID2, A.CPANOMM, A.CPNOREG, A.CPSERIE, A.CPNODOC, A.CPFEMIS, '
      + 'A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, '
   + '''N'' DETRACCION, '
   + '1 PORCPAGO, A.DEDH, '
      + 'A.CPFEMIS CPFEMISPROV, 0.00 CPGRAVAD, 0.00 CPNOGRAV, 0.00 CPIGV, 0.00 CPPAGORI, DEMTOLOC CPMTOLOC, DEMTOEXT CPMTOEXT, '
      + 'C.DOCRETIGV, C.DOCRESTA, 0.00 MTOBASERET, 0.00 MONTORET '
      + 'FROM CAJA301 A, TGE110 C, TGE201 B '
      + 'WHERE A.CIAID=''' + DMTE.cdsEgrCaja.FieldByName('CIAID').AsString + ''' AND '
      + 'A.TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' AND '
      + 'A.ECANOMM=''' + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' AND '
      + 'A.ECNOCOMP=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + '''  '
      + 'AND ' + DMTE.wReplacCeros + '(FLAGVAR,'' '')<>''R'' AND C.DOCMOD=A.DOCMOD and C.DOCID=A.DOCID2 '
      + 'AND B.CLAUXID=A.CLAUXID AND B.PROV=A.PROV '
      + ' ) A, CNT201 B '
      + 'WHERE B.CLAUXID=A.CLAUXID AND B.AUXID=A.PROV '
      + ' ORDER BY A.CLAUXID, A.PROV,CPNOREG';

   DMTE.cdsConsulta.IndexFieldNames := '';
   DMTE.cdsConsulta.Filter := '';
   DMTE.cdsConsulta.Filtered := False;
   DMTE.cdsConsulta.Close;
   DMTE.cdsConsulta.DataRequest(xSQL);

   Try
      DMTE.cdsConsulta.Open;
   Except
   End;

   sRetNC := '';
   vRetencion := 0.00;
   DMTE.cdsConsulta.First;
   While Not DMTE.cdsConsulta.Eof Do
   Begin
      //Inicio HPC_201401_CAJA

      //Si el tipo de documento esta habilitado como documento de retención suma  DEMTOLOC para ver si es >=700
      If DMTE.cdsConsulta.FieldByName('DOCRETIGV').AsString = 'S' Then
         vRetencion := vRetencion + DMTE.cdsConsulta.fieldbyname('DEMTOLOC').AsFloat;

      //Final HPC_201401_CAJA
      If DMTE.cdsConsulta.FieldByName('DOCID2').AsString = '01' Then
      Begin
         If DMTE.cdsConsulta.FieldByName('PROVDOC').AsString = 'S' Then
            sRetNC := 'S';
      End;
      DMTE.cdsConsulta.next;
   End;

   DMTE.cdsConsulta.First;
   While Not DMTE.cdsConsulta.Eof Do
   Begin
      If (DMTE.cdsConsulta.FieldByName('DOCID2').AsString = '07') And (DMTE.cdsConsulta.FieldByName('PROVDOC').AsString = '') Then
      Begin
         If sRetNC = 'S' Then
         Begin
            DMTE.cdsConsulta.Edit;
            DMTE.cdsConsulta.FieldByName('PROVDOC').AsString := sRetNC;
            DMTE.cdsConsulta.Post;
         End;
      End;
      DMTE.cdsConsulta.next;
   End;

   DMTE.cdsConsulta.IndexFieldNames := '';
   DMTE.cdsConsulta.IndexFieldNames := 'CLAUXID;PROV;CPNOREG';

   xMtoLoc := 0;
   xMtoExt := 0;
   xTotAPagRet := 0;
   xTotRetencion := 0;
   xbAplica := False;
   DMTE.cdsConsulta.First;
   //Inicio HPC_201401_CAJA
   vYanoRetencion :='N';
   //Final HPC_201401_CAJA
   While Not DMTE.cdsConsulta.Eof Do
   Begin
      If DMTE.cdsConsulta.FieldByName('DEDH').AsString = 'D' Then // si es Debe, o sea si es pago
      Begin
         xMtoLoc := xMtoLoc + DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
         xMtoExt := xMtoExt + DMTE.cdsConsulta.FieldByName('DEMTOEXT').AsFloat;

        //Inicio HPC_201401_CAJA
        //SI EL CONCEPTO ES PARA DETRACCION ASI NO ESTE SUJETO A DETRACCION POR EL IMPORTE YA NO DESCUENTA RETENCION
        //SE SUPONE QUE SERIA UN SERVICIO
          vDetraccion :=VConceptoDetrac(DMTE.cdsConsulta.FieldByName('CIAID').AsString,
                                        DMTE.cdsConsulta.FieldByName('TDIARID2').AsString,
                                        DMTE.cdsConsulta.FieldByName('CPANOMM').AsString,
                                        DMTE.cdsConsulta.FieldByName('CPNOREG').AsString);
          //SOLO ES NECESARIO QUE SEA UN COMCEPTO DE "DETRACCION" DENTRO DEL CHEQE  PARA QUE NO COBRE RETENCION
          If vDetraccion='S' Then vYanoRetencion :='S';

          //vProvRetiene Es "S" cuando el proveedor esta sujeto a RETENCION verifica en las tablas CNT201 Y TGE201
          vProvRetiene := ProveedorRetiene(DMTE.cdsConsulta.FieldByName('PROV').AsString);

         //Final HPC_201401_CAJA

        ////////////////////////
        /// si existe Porcentaje de Detraccion no calcula Retencion
        /// si la provision a cancelar no esta afecta a retencion, por aplicarse detraccion
        //% detraccion es 0 y el concepto NO ESTA marcado para detraccion es valido para RETENCION
         If (xDTRPorc = 0) and (vDetraccion='N')  Then
         Begin
         ///////////////////////
         // si el proveedor retiene
         //Inicio HPC_201401_CAJA
         // If (DMTE.cdsConsulta.FieldByName('PROVRETIGV').AsString = 'S') And
            If ((DMTE.cdsConsulta.FieldByName('PROVRETIGV').AsString = 'S') or (vRetencion>=700.00)) And  //Retiene IGV o la suma es mayor a 700
               (vProvRetiene='S') And                                                                     //y el provvedor esta sujetoa retencion
               (DMTE.cdsConsulta.FieldByName('DETRACCION').AsString <> 'S') Then                          //y no es detraccion
         //Final HPC_201401_CAJA
            Begin
               //si el tipo de documento esta habilitado para retener
               If DMTE.cdsConsulta.FieldByName('DOCRETIGV').AsString = 'S' Then
               Begin
                  //si la fecha de emisión es >= a la fecha mínima de retención ('01/06/2002')
                  If (DMTE.cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= DMTE.xTasaFec) Then
                  Begin
                  // DOCUMENTOS NO PROVISIONADOS
                     If DMTE.cdsConsulta.FieldByName('MODO').AsString = 'NO PROVISIONADO' Then
                     Begin
                        DMTE.cdsConsulta.Edit;
                        DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
                        DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat := DMTE.FRound(DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat * DMTE.xTasaPorce / 100, 15, 2);
                        xTotAPagRet := xTotAPagRet + DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                        xTotRetencion := xTotRetencion + DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat;
                     End
                     Else // DOCUMENTOS PROVISIONADOS
                     Begin
                        If DMTE.cdsConsulta.FieldByName('TCANJEID').AsString <> 'LE' Then //FACTURAS PROVISIONADAS
                        Begin
                       // si tiene marca desde CxP (PROVRETIGV='S')
                         //Inicio HPC_201401_FAC
                         //If (DMTE.cdsConsulta.FieldByName('PROVDOC').AsString = 'S') Then
                           If (DMTE.cdsConsulta.FieldByName('PROVDOC').AsString = 'S') OR (vRetencion>=700.00) Then
                          //Final HPC_201401_FAC
                           Begin
                              xbAplica := True;
                              If (DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat + DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat) > 0 Then
                              Begin
                                 xPorcAplica := DMTE.cdsConsulta.FieldByName('PORCPAGO').AsFloat;
                                 DMTE.cdsConsulta.Edit;
                              // SI LA MONEDA DEL DOCUMENTO ES EN SOLES
                                 If DMTE.cdsConsulta.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
                                 Begin
                                    DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat + DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat - DMTE.cdsConsulta.FieldByName('CPPAGORI').AsFloat) * xPorcAplica, 15, 2);
                                    DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat := DMTE.FRound(DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat * DMTE.xTasaPorce / 100, 15, 2);
                                 End
                                 Else
                                 Begin
                                    DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat + DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat - DMTE.cdsConsulta.FieldByName('CPPAGORI').AsFloat) * xPorcAplica * DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat, 15, 2);
                                    DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat := DMTE.FRound(DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat * DMTE.xTasaPorce / 100, 15, 2);
                                 End;
                                 xTotAPagRet := xTotAPagRet + DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                                 xTotRetencion := xTotRetencion + DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat;
                              End
                              Else
                              Begin
                                 DMTE.cdsConsulta.Edit;
                                 DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
                                 DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat := DMTE.FRound(DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat * DMTE.xTasaPorce / 100, 15, 2);
                                 xTotAPagRet := xTotAPagRet + DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                                 xTotRetencion := xTotRetencion + DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat;
                              End;
                           End
                           Else // si no tiene marca desde CxP
                           Begin
                              xPorcAplica := DMTE.cdsConsulta.FieldByName('PORCPAGO').AsFloat;
                              //Inicio HPC_201401_CAJA
                              //If (DMTE.cdsConsulta.FieldByName('PROVDOC').AsString = 'S') Then
                              If (DMTE.cdsConsulta.FieldByName('PROVDOC').AsString = 'S') OR (vRetencion>=700.00) Then
                              //Final HPC_201401_CAJA
                              Begin
                                 DMTE.cdsConsulta.Edit;
                              // SI LA MONEDA DEL DOCUMENTO ES EN SOLES
                                 If DMTE.cdsConsulta.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
                                 Begin
                                    DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat + DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat) * xPorcAplica, 15, 2);
                                    DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat := DMTE.FRound(DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat * DMTE.xTasaPorce / 100, 15, 2);
                                 End
                                 Else
                                 Begin
                                    DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((DMTE.cdsConsulta.FieldByName('CPGRAVAD').AsFloat + DMTE.cdsConsulta.FieldByName('CPIGV').AsFloat) * xPorcAplica * DMTE.cdsConsulta.FieldByName('DETCDOC').AsFloat, 15, 2);
                                    DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat := DMTE.FRound(DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat * DMTE.xTasaPorce / 100, 15, 2);
                                 End;
                                 xTotAPagRet := xTotAPagRet + DMTE.cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                                 xTotRetencion := xTotRetencion + DMTE.cdsConsulta.FieldByName('MONTORET').AsFloat;
                              End;
                           End;
                        End
                        Else // si son Letras
                        Begin
                     // suma retenciones de las letras grabadas en CXP313
                        End;
                     End;
                  End;
               End;
            End;
         End;
      End
      Else
      Begin
         xMtoLoc := xMtoLoc - DMTE.cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
         xMtoExt := xMtoExt - DMTE.cdsConsulta.FieldByName('DEMTOEXT').AsFloat;
      End;
      DMTE.cdsConsulta.next;
   End;

   If (xTotAPagRet >= DMTE.xTasaMonto) Or (xbAplica) Then
   Begin
      Result := xTotRetencion;
      xMtoLoc := xMtoLoc - xTotRetencion;
      xMtoExt := xMtoExt - DMTE.FRound(xTotRetencion / strtofloat(dbeTCambio.Text), 15, 2);
   End;
   }
End;

Procedure TFPagoGlobal.z2bbtnGrabaClick(Sender: TObject);
Var
   sSQL, xSQL: String;
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

   xSQL := 'CIAID=' + quotedstr(dblcCia.text) + ' AND TDIARID=' + quotedstr(dblcTDiario.text) + ' and '
      + 'ECNOCOMP<>' + quotedstr(dbeNoComp.Text) + ' and '
      + 'CCBCOID=' + quotedstr(dblcCCBco.Text) + ' AND ECNOCHQ=' + quotedstr(dbeNoChq.text);
   DMTE.DisplayDescrip('prvTGE', 'CAJA302', 'ECNOCHQ,ECESTADO,ECELABO', xsql, 'ECNOCHQ');
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

   ErrorCount := 0;
   DMTE.DCOM1.AppServer.IniciaTransaccion;

   If DMTE.cdsDocPago.RecordCount = 0 Then
   Begin
      If (DMTE.cdsMovCxP.Modified) Or (DMTE.cdsMovCxP.changeCount > 0) Then
      Begin
         DMTE.ControlTran(0, DMTE.cdsMovCxP, 'MOVCXP');
      End;
   End;
   DMTE.ControlTran(0, DMTE.cdsRegCxP, 'REGCXP');
   DMTE.ControlTran(0, DMTE.cdsDocPago, 'DOCPAGO');

   xRetLoc := CalculaRet;
   /////////////////////////////////////////////////////////////////////////////
   // solo si se aplico DETRACCION y es Modificacion
   If (xDTRPorc > 0) And (xDTRGrabada = '1') Then
   Begin
      Exit;
   End;
   /////////////////////////////////////////////////////////////////////////////

   ActSaldosMovCxP;

   If xErrorGraba Then
   Begin
      xErrorGraba := False;
      exit;
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
   cdspost(DMTE.cdsEgrCaja);

   DMTE.ControlTran(0, DMTE.cdsEgrCaja, 'EGRCAJA');
   DMTE.ControlTran(8, Nil, ''); //COMMIT

   sSQL := 'select * from TGE202 '
      + 'where CIAID=' + quotedstr(dblccia.Text)
      + '  and CUENTAID=' + quotedstr(edtCuenta.text);
   DMTE.cdsQry2.Close;
   DMTE.cdsQry2.DataRequest(sSQL);
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

   ///////////////
   If DMTE.cdsDocPago.RecordCount > 0 Then
   Begin
      xSQL := 'Select B.DTRPORC from CAJA303 a, CXP301 b '
         + 'Where A.CIAID=''' + dblcCia.Text + ''' and '
         + 'A.ECANOMM=''' + edtPeriodo.Text + ''' and '
         + 'A.TDIARID=''' + dblcTDiario.Text + ''' and '
         + 'A.ECNOCOMP=''' + dbeNoComp.Text + ''' '
         + 'and a.CIAID2=B.CIAID(+) AND A.CPANOMM=B.CPANOMES AND TDIARID2=B.TDIARID '
         + 'AND A.CPNOREG=B.CPNOREG(+) AND NVL(B.DTRPORC,0)>0';
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

   If xDTRPorc > 0 Then // presenta panel solo si se aplica DETRACCION y es Adicion
   Begin
      If sFlagAbono = 'N' Then
         xSQL := 'SELECT * FROM TGE106 WHERE ' +
            'BANCOID=' + quotedstr(DMTE.cdsbancoegr.FieldByName('BANCOID').AsString) + ' AND ' +
            'TMONID=' + quotedstr(DMTE.wTMonLoc) + ' AND CIAID=' + quotedstr(dblcCia.text) +
            ' AND ACTIVO=''S'' AND CUEEMICHE=''S'''
      Else
         xSQL := 'SELECT * FROM TGE106 '
            + 'WHERE CIAID=' + quotedstr(dblcCia.text) + ' AND TMONID=' + quotedstr(DMTE.wTMonLoc)
            + ' AND ACTIVO=''S'' AND CUEEMICHE=''C''';

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
      End
      Else
      Begin
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
End;

Procedure TFPagoGlobal.Detraccion;
Var
   wSql: String;
   wDETCPAG, wDETCDOC, wECTCAMB, xOtroLoc, xOtroExt, xFactorD: Double;
   wECNOCOMP, wTMONID, wCIAID, wTDIARID, wTDIARID2, wECANOMM, wCPANOMM, wPROV,
      wPROVRUC, wCPNOREG, wDOCID2, wCPSERIE, wCPNODOC, wCPTOID, wCUENTAID, wCPFEMIS, wCPFVCMTO,
      wDEUSER, wDEFREG, wDEHREG, wPROVDES, wCLAUXID, wECFCOMP, wFPAGOID, wECGLOSA, wECLOTE, wECESTADO,
      wECUSER, wECFREG, wECHREG, wEC_PROCE, wEC_IE, WECFEMICH, WECNOCHQ, WECGIRA, WCIAID2,
      WCCBCOVOUCH, WECANO, WECMM, WECDD, WECSS, WECSEM, WECTRI, WECAASS, WECAASEM, WECAATRI: String;
   xRegAct: TBookMark;
   wNewVoucher, xResta, xWhere: String;
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

   /// CAJA303
   /// ACCESA AL CXP302 PARA TOMAR LOS DATOS DEL TIPDET='TO' - TOTAL SI DETRACCION
   wSQL := 'SELECT a.CIAID2, a.TDIARID2, a.CPANOMM, b.* from CAJA303 a, CXP302 b WHERE ' +
      'a.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) + ' AND ' +
      'a.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND ' +
      'a.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND ' +
      'a.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString) + ' AND ' +
      'a.CIAID2=B.CIAID(+) AND A.CPANOMM=B.dCPANOMm AND TDIARID2=B.TDIARID AND A.CPNOREG=B.CPNOREG(+) and ' +
      'b.CLAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString) + ' AND ' +
      'b.DCPAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString) + ' AND ' +
      'b.TIPDET=' + quotedstr('TO');
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(wSQL);
   DMTE.cdsQry.open;

   While Not DMTE.cdsQry.Eof Do
   Begin
      If DMTE.cdsDocPago.Locate('CIAID2;TDIARID2;CPANOMM;CPNOREG',
         VarArrayOf([DMTE.cdsQry.FieldByName('CIAID2').AsString,
         DMTE.cdsQry.FieldByName('TDIARID2').AsString,
            DMTE.cdsQry.FieldByName('CPANOMM').AsString,
            DMTE.cdsQry.FieldByName('CPNOREG').AsString]), []) Then
      Begin
         xWhere := 'SELECT DOCRESTA FROM TGE110 where DOCID=''' + DMTE.cdsQry.FieldByName('DOCID').AsString + ''' and DOCMOD=''CXP'' ';
         DMTE.cdsQry2.Close;
         DMTE.cdsQry2.DataRequest(xWhere);
         DMTE.cdsQry2.open;
         xResta := DMTE.cdsQry2.fIELDbYNAME('DOCRESTA').Asstring;
         xFactorD := 1;
         If xResta = 'S' Then xFactorD := -1;

         DMTE.cdsDocPago.Edit;
         DMTE.cdsDocPago.FieldByName('TIPDET').AsString := 'TO';
         DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString := DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString;
         DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat := DMTE.cdsQry.FieldByName('DCPMOORI').AsFloat * xFactorD;
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
      End;
      DMTE.cdsQry.Next;
   End;

   wSql := 'CIAID=' + quotedstr(dblcCia.Text) + ' AND ECANOMM=' + quotedstr(edtPeriodo.Text)
      + ' AND TDIARID=' + quotedstr(dbeOrigen.Text);

   wNewVoucher := DMTE.UltimoNum('prvCaja', 'CAJA302', 'ECNOCOMP', wSql);
   wNewVoucher := DMTE.StrZero(wNewVoucher, DMTE.cdsDocPago.FieldByName('ECNOCOMP').Size);

// ACCESA AL CXP302 PARA TOMAR LOS DATOS DEL TIPDET='I4' - DETRACCION
   wSQL := 'SELECT a.CIAID2, a.TDIARID2, a.CPANOMM, b.* from CAJA303 a, CXP302 b WHERE ' +
      'a.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) + ' AND ' +
      'a.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND ' +
      'a.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND ' +
      'a.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString) + ' AND ' +
      'a.CIAID2=B.CIAID(+) AND A.CPANOMM=B.dCPANOMm AND TDIARID2=B.TDIARID AND A.CPNOREG=B.CPNOREG(+) and ' +
      'b.CLAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString) + ' AND ' +
      'b.DCPAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString) + ' AND ' +
      'b.TIPDET=' + quotedstr('I4');
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(wSQL);
   DMTE.cdsQry.open;

   While Not DMTE.cdsQry.Eof Do
   Begin
      If DMTE.cdsDocPago.Locate('CIAID2;TDIARID2;CPANOMM;CPNOREG',
         VarArrayOf([DMTE.cdsQry.FieldByName('CIAID2').AsString,
         DMTE.cdsQry.FieldByName('TDIARID2').AsString,
            DMTE.cdsQry.FieldByName('CPANOMM').AsString,
            DMTE.cdsQry.FieldByName('CPNOREG').AsString]), []) Then
      Begin
         wECNOCOMP := DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString;
         wTMONID := 'N';
         wDETCPAG := DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat;
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

         xWhere := 'SELECT DOCRESTA FROM TGE110 where DOCID=''' + DMTE.cdsQry.FieldByName('DOCID').AsString + ''' and DOCMOD=''CXP'' ';
         DMTE.cdsQry2.Close;
         DMTE.cdsQry2.DataRequest(xWhere);
         DMTE.cdsQry2.open;
         xResta := DMTE.cdsQry2.fIELDbYNAME('DOCRESTA').Asstring;
         xFactorD := 1;
         If xResta = 'S' Then xFactorD := -1;

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
         DMTE.cdsDocPago.FieldByName('DETCPAG').AsFloat := wDETCPAG;
         DMTE.cdsDocPago.FieldByName('CPTOID').AsString := DMTE.cdsQry.FieldByName('CPTOID').AsString;
         DMTE.cdsDocPago.FieldByName('CUENTAID').AsString := DMTE.cdsQry.FieldByName('CUENTAID').AsString;
         DMTE.cdsDocPago.fieldbyname('CPFEMIS').AsString := wCPFEMIS;
         DMTE.cdsDocPago.fieldbyname('CPFVCMTO').AsString := wCPFVCMTO;
         DMTE.cdsDocPago.fieldbyname('DEUSER').AsString := wDEUSER;
         DMTE.cdsDocPago.fieldbyname('DEFREG').AsString := wDEFREG;
         DMTE.cdsDocPago.fieldbyname('DEHREG').AsString := wDEHREG;
         DMTE.cdsDocPago.fieldbyname('PROVDES').AsString := wPROVDES;
         DMTE.cdsDocPago.fieldbyname('CLAUXID').AsString := wCLAUXID;
         DMTE.cdsDocPago.fieldbyname('CIAID2').AsString := wCIAID2;

         DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat := DMTE.cdsQry.FieldByName('DCPMOORI').AsFloat * xFactorD;

         If DMTE.cdsQry.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
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
            If DMTE.cdsQry.FieldByName('TMONID').AsString = DMTE.wTMonExt Then
            Begin
               DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat := DMTE.cdsDocPago.fieldbyname('DEMTOORI').AsFloat;
               DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat := DMTE.cdsDocPago.fieldbyname('DEMTOEXT').AsFloat;
               DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat := DMTE.FRound(
                  DMTE.cdsDocPago.FieldByName('DEMTOORI').AsFloat *
                  DMTE.cdsQry.FieldByName('CPTCAMPR').AsFloat, 15, 2);
                            //DMTE.cdsDocPago.fieldbyname('DETCPAG').AsFloat,15,2);
               DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat := DMTE.cdsDocPago.fieldbyname('DEMTOLOC').AsFloat;
            End;
         End;
         DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString := wECNOCOMP;
         DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString := wNewVoucher;

         DMTE.AplicaDatos(DMTE.cdsDocPago, 'DOCPAGO');
      End;
      DMTE.cdsQry.next;
   End;

   wSQL := 'SELECT SUM(CASE WHEN DCPDH=''D'' THEN (-1) ELSE 1 END * DCPMOORI ) DCPMOORI from CAJA303 a, CXP302 b WHERE ' +
      'a.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) + ' AND ' +
      'a.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND ' +
      'a.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND ' +
      'a.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString) + ' AND ' +
      'a.CIAID2=B.CIAID(+) AND A.CPANOMM=B.dCPANOMm AND TDIARID2=B.TDIARID AND A.CPNOREG=B.CPNOREG(+) and ' +
      'b.CLAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString) + ' AND ' +
      'b.DCPAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString) + ' AND ' +
      'b.TIPDET=' + quotedstr('TO');
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(wSQL);
   DMTE.cdsQry.open;

   DMTE.cdsEgrCaja.Edit;
   DMTE.cdsEgrCaja.FieldByName('TIPDET').AsString := 'TO';
   DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat := DMTE.cdsQry.FieldByName('DCPMOORI').AsFloat + xOtroLoc;
      DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat := DMTE.cdsEgrCaja.fieldbyname('ECMTOORI').AsFloat;
      DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat := DMTE.FRound(
         DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat /
         DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat, 15, 2) + xOtroExt;
   End
   Else
   Begin
      If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonExt Then
      Begin
         DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat := DMTE.cdsQry.FieldByName('DCPMOORI').AsFloat + xOtroExt;
         DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat := DMTE.cdsEgrCaja.fieldbyname('ECMTOORI').AsFloat;
         DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat := DMTE.FRound(
            DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat *
            DMTE.cdsEgrCaja.fieldbyname('ECTCAMB').AsFloat, 15, 2) + xOtroLoc;
      End;
   End;

// Inicio HPC_201401_CAJA
   dbeImporte.Text := floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat);
// Fin HPC_201401_CAJA

   // ASIENTOS DE LA DETRACCION

   wSQL := 'SELECT SUM(CASE WHEN DCPDH=''D'' THEN (-1) ELSE 1 END * DCPMOORI) DCPMOORI from CAJA303 a, CXP302 b WHERE ' +
      'a.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) + ' AND ' +
      'a.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND ' +
      'a.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND ' +
      'a.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString) + ' AND ' +
      'a.CIAID2=B.CIAID(+) AND A.CPANOMM=B.dCPANOMm AND TDIARID2=B.TDIARID AND A.CPNOREG=B.CPNOREG(+) and ' +
      'b.CLAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CLAUXID').AsString) + ' AND ' +
      'b.DCPAUXID=' + quotedstr(DMTE.cdsDocPago.FieldByName('PROV').AsString) + ' AND ' +
      'b.TIPDET=' + quotedstr('I4');
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(wSQL);
   DMTE.cdsQry.open;

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

   DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat := DMTE.cdsQry.FieldByName('DCPMOORI').AsFloat;
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

   DMTE.AplicaDatos(DMTE.cdsEgrCaja, 'EGRCAJA');

   z2bbtnGraba.Enabled := False;
   lblDTR.Visible := True;
   z2bbtnSube.Enabled := False;
End;

Procedure TFPagoGlobal.ContabilizaProc1;
Begin
   If DMTE.sLet = DMTE.cdsDocPago.FieldByName('DOCID2').AsString Then
      bLetra := True;

   DMTE.cdsCntCaja.Insert;
   // actualiza sobre CAJA304 (archivo contable de Caja) los documentos provisionados
   Contab_DocPago;

   DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');

   If xMsgContabiliza = '0' Then
   Begin
      If DMTE.wTipoDif = '' Then
      Begin
         DMTE.cdsCntCaja.Insert;

         Contab_DifCamDocPago;

         DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
      End
      Else
      Begin
         If DMTE.cdsDocPago.FieldByname('TMONID').AsString = DMTE.wTMonExt Then
         Begin
            DMTE.cdsCntCaja.Insert;
            Contab_DifCamDocPago2;
            DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
         End;
      End;
   End;
End;

Procedure TFPagoGlobal.ContabilizaProc2;
Var
   xSQL, xWhere: String;
Begin
   If (DMTE.cdsDocPago.FieldByName('CPFEMIS').AsDateTime >= DMTE.xTasaFec) And
      (DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCRETIGV', 'DOCMOD=''CXP'' AND DOCID=' + QuotedStr(DMTE.cdsDocPago.FieldByName('DOCID2').AsString), 'DOCRETIGV') = 'S') And
      (lblSujetoRetencion.visible) Then
   Begin
      xSQL := 'SELECT TMONID,TCANJEID,CPNOGRAV,CPIGV,CPGRAVAD,CPCANJE,CPMTOLOC,CPMTOEXT,PROVDES FROM CXP301 '
         + ' where CIAID=''' + DMTE.cdsDocPago.fieldbyname('CIAID2').AsString + ''' and '
         + ' CPANOMES=''' + DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString + ''' and '
         + ' TDIARID=''' + DMTE.cdsDocPago.fieldbyname('TDIARID2').AsString + ''' and '
         + ' CPNOREG=''' + DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString + ''' ';
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

      If (DMTE.cdsQry3.fieldbyname('TCANJEID').AsString = 'LE') And (DMTE.cdsQry3.fieldbyname('CPNOGRAV').AsFloat > 0) Then
      Begin
         xWhere := ' CIAID=''' + DMTE.cdsDocPago.fieldbyname('CIAID2').AsString + ''' and '
            + ' CPANOMES=''' + DMTE.cdsDocPago.fieldbyname('CPANOMM').AsString + ''' and '
            + ' PROV=''' + DMTE.cdsDocPago.fieldbyname('PROV').AsString + ''' and '
            + ' CPNOREGLET=''' + DMTE.cdsDocPago.fieldbyname('CPNOREG').AsString + ''' ';

         If DMTE.RecuperarDatos('CXP313', 'TMONID,TMONID2,TCANJEID,CPRETORI,CPRETLOC,CPRETEXT,PROV,CPTCAMPR,CPTCAMAJ', xWhere) Then
         Begin
            DMTE.cdsRec.First;
            While Not DMTE.cdsRec.Eof Do
            Begin
               If DMTE.wTMonLoc = DMTE.cdsRec.FieldByName('TMONID').AsString Then
               Begin
                  xMtoRetL := DMTE.FRound(xMtoRetL + DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat, 15, 2) * xPorcPago, 15, 2);
                  xMtoRetE := DMTE.FRound((xMtoRetE + DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat, 15, 2) * xPorcPago) / DMTE.cdsRec.FieldByName('CPTCAMPR').AsFloat, 15, 2);
                  xMtoRetLH := DMTE.FRound(xMtoRetLH + DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat, 15, 2) * xPorcPago, 15, 2);
                  xMtoRetEH := DMTE.FRound(xMtoRetEH + (DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETLOC').AsFloat, 15, 2) * xPorcPago) / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat, 15, 2);
               End
               Else
               Begin
                  xMtoRetE := DMTE.FRound(xMtoRetE + DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat, 15, 2) * xPorcPago, 15, 2);
                  xMtoRetL := DMTE.FRound(xMtoRetL + DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat, 15, 2) * xPorcPago * DMTE.cdsRec.FieldByName('CPTCAMPR').AsFloat, 15, 2);
                  xMtoRetEH := DMTE.FRound(xMtoRetEH + DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat, 15, 2) * xPorcPago, 15, 2);
                  xMtoRetLH := DMTE.FRound(xMtoRetLH + DMTE.FRound(DMTE.cdsRec.FieldByName('CPRETEXT').AsFloat, 15, 2) * xPorcPago * DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat, 15, 2);
               End;
               DMTE.cdsRec.Next;
            End;
         End
         Else
            Showmessage('Error en la recuperación del documento - WMC');
      End;
      DMTE.cdsDocPago.EnableControls;
      If (xMtoRetL > 0) And (xDTRPorc = 0) Then
      Begin
         DMTE.cdsCntCaja.Insert;
         If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
            Contab_DocPago_RETENCION_DEBE(xMtoRetL, xMtoRetE, xMtoRetL)
         Else
            Contab_DocPago_RETENCION_DEBE(xMtoRetL, xMtoRetE, xMtoRetE);

         DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
         If DMTE.wTipoDif = '' Then
         Begin
            DMTE.cdsCntCaja.Insert;
            Contab_DifCamDocPago_Retencion(xPorcPago, xMtoRetL, xMtoRetLH);
            DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
         End
         Else
         Begin
            If DMTE.cdsDocPago.FieldByname('TMONID').AsString = DMTE.wTMonExt Then
            Begin
               DMTE.cdsCntCaja.Insert;
               Contab_DifCamDocPago2;
               DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
            End;
         End;
      End;
   End;
End;

Procedure TFPagoGlobal.Contab_HaberProc1;
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
         xMtoTotalL := xMtoTotalL + DMTE.cdsDocPago.FieldByName('DEMTOLOC').AsFloat;
         xMtoTotalE := xMtoTotalE + DMTE.cdsDocPago.FieldByName('DEMTOEXT').AsFloat;
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

Procedure TFPagoGlobal.dbeNoChqDTRExit(Sender: TObject);
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

Procedure TFPagoGlobal.z2bbtnDTROK2Click(Sender: TObject);
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
      If MessageDlg('¿Está seguro del Numero de Cheque?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Else
      Begin
         dbeNoChqDTR.SetFocus;
         Exit;
      End;
   End;

   Detraccion;

   ShowMessage('Grabación OK');
   dbeNoChqDTR.Text := '';
   lblCCBcoDTR.Visible := False;
   dblcCCBcoDTR.Visible := False;
   pnlDetraccion.Visible := False;
End;

Procedure TFPagoGlobal.z2bbtnDTRCancel3Click(Sender: TObject);
Begin
   pnlDetraccion.Visible := False;
End;

Procedure TFPagoGlobal.dblcCCBcoDTREnter(Sender: TObject);
Begin
   strTmp := dblcCCBcoDTR.Text;
End;

Procedure TFPagoGlobal.dblcCCBcoDTRExit(Sender: TObject);
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
      xSql := 'select max(abono) abono from ( '
         + 'SELECT MAX(ECNOCHQ) ABONO FROM CAJA302 '
         + 'WHERE CIAID=''02'' AND ECANOMM=''' + edtPeriodo.Text + ''' AND CCBCOID=' + quotedstr(dblcCCBcoDTR.Text)
         + ' union all '
         + 'select max(numdetrac) abono from cxp_ord_pag_det '
         + 'where numdetrac like ''' + edtPeriodo.Text + '%'''
         + ' ) ';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest(xSQL);
      DMTE.cdsQry.open;
      If length(trim(DMTE.cdsQry.FieldByname('ABONO').AsString)) > 6 Then
         //sNumT := DMTE.cdsQry.FieldByname('ABONO').AsString
         sNumT:=DMTE.StrZero(DMTE.cdsQry.FieldByname('ABONO').AsString,10)
      Else
         sNumT := '0000000000';
      sNumAbo := edtPeriodo.Text + DMTE.StrZero(inttostr(StrtoInt(Copy(sNumT, 7, 4)) + 1), 4);
   End;

   dbeNoChqDTR.Text := sNumAbo;

   If pnlDetraccion.Visible Then
      dbeNoChqDTR.SetFocus;
End;

Procedure TFPagoGlobal.bbtnReContaClick(Sender: TObject);
Begin
   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' Then
   Begin
      cReConta := 'S';
      z2bbtnContClick(Self);
   End;
End;

Procedure TFPagoGlobal.dblcdCCostoEnter(Sender: TObject);
Var
   ssql: String;
Begin
   ssql := 'SELECT CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV '
      + 'FROM TGE203 WHERE CCOSMOV=''S'' and CCOSACT=''S'' '
      + ' and CCOSCIAS LIKE (' + quotedstr('%' + dblcCia.Text + '%') + ' ) ';
   DMTE.cdsCCosto.Close;
   DMTE.cdsCCosto.DataRequest(ssql);
   DMTE.cdsCCosto.open;
End;

Procedure TFPagoGlobal.bbtnImpDetClick(Sender: TObject);
Var
   wSQL, xWhere, xxAA, xSQL44: String;
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

      wSQL := 'SELECT * from CAJA303 a WHERE ' +
         'a.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) + ' AND ' +
      'a.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND ' +
         'a.ECNOCOMPR=' + quotedstr(dbeNoComp.Text) + ' AND ' +
         'a.ECNOCOMP<>' + quotedstr(dbeNoComp.Text) + ' ';
      DMTE.cdsDocPago.Close;
      DMTE.cdsDocPago.Filter := '';
      DMTE.cdsDocPago.Filtered := False;
      DMTE.cdsDocPago.DataRequest(wSQL);
      DMTE.cdsDocPago.Open;

      DMTE.cdsEgrCaja.Filter := '';
      DMTE.cdsEgrCaja.Filtered := False;
      wSQL := 'SELECT * from CAJA302 a WHERE ' +
         'a.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) + ' AND ' +
         'a.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND ' +
         'a.ECNOCOMPR=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString) + ' AND ' +
         'a.ECNOCOMP<>' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString) + ' ';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(wSQL);
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
      wSQL := 'SELECT * from CAJA302 a WHERE ' +
         'a.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) + ' AND ' +
         'a.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND ' +
         'a.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString) + ' ';
      DMTE.cdsEgrCaja.Filter := '';
      DMTE.cdsEgrCaja.Filtered := False;
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(wSQL);
      DMTE.cdsEgrCaja.Open;

      wSQL := 'SELECT * from CAJA303 a WHERE ' +
         'a.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) + ' AND ' +
         'a.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND ' +
         'a.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND ' +
         'a.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString) + ' ';
      DMTE.cdsDocPago.Close;
      DMTE.cdsDocPago.DataRequest(wSQL);
      DMTE.cdsDocPago.Open;
   End;
End;

Procedure TFPagoGlobal.bbtnChqDetClick(Sender: TObject);
Var
   strChq: structChq;
   xsql, ArchivoReporte, WECCHQEMI, wGiradoDTR, wCtaCteBCO, xSQL44, wSQL: String;
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

      wSQL := 'SELECT * from CAJA303 a WHERE ' +
         'a.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) + ' AND ' +
         'a.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND ' +
         'a.ECNOCOMPR=' + quotedstr(dbeNoComp.Text) + ' AND ' +
         'a.ECNOCOMP<>' + quotedstr(dbeNoComp.Text) + ' ';
      DMTE.cdsDocPago.Close;
      DMTE.cdsDocPago.DataRequest(wSQL);
      DMTE.cdsDocPago.Open;

      DMTE.cdsEgrCaja.Filter := '';
      DMTE.cdsEgrCaja.Filtered := False;
      wSQL := 'SELECT * from CAJA302 a WHERE ' +
         'a.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) + ' AND ' +
         'a.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND ' +
         'a.ECNOCOMPR=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString) + ' AND ' +
         'a.ECNOCOMP<>' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString) + ' ';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(wSQL);
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
      //Inicio HPC_201401_CAJA
      //If xDTRPorc = 0 Then // si no se aplica DETRACCION
      If (xDTRPorc = 0) AND (vYanoRetencion='N') Then
      //Final HPC_201401_CAJA
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
            + 'from CNT320 '
            + 'WHERE CIAID=''' + DMTE.cdsEgrcaja.FieldByName('CIAID').AsString + ''' AND '
            + 'ANOMM=''' + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' AND '
            + 'TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' AND '
            + 'ECNOCOMP=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' AND '
            + '( DOCID2 IS NULL OR DOCID2='''' ) ';
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
         xSQL := 'UPDATE CAJA302 SET ECCHQEMI=''S'' '
            + 'WHERE CIAID=''' + dblcCia.text + ''' and '
            + 'TDIARID=''' + dblcTDiario.text + ''' and '
            + 'ECANOMM=''' + edtPeriodo.text + ''' and '
            + 'ECNOCOMP=''' + dbeNoComp.text + ''' ';
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
            xSQL44 := 'Select * from CAJA302 '
               + 'Where CIAID=' + quotedstr(DMTE.cdsDocPago.FieldByName('CIAID').AsString)
               + ' and ECANOMM=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECANOMM').AsString)
               + ' and TDIARID=' + quotedstr(DMTE.cdsDocPago.FieldByName('TDIARID').AsString)
               + ' and ECNOCOMP=' + quotedstr(DMTE.cdsDocPago.FieldByName('ECNOCOMP').AsString);
            DMTE.cdsEgrCaja.Close;
            DMTE.cdsEgrCaja.DataRequest(xSQL44);
            DMTE.cdsEgrCaja.Open;
         End;

         xTotal := DMTE.cdsEgrCaja.FieldbyName('ECMTOORI').AsFloat;
         If DMTE.cdsEgrCaja.FieldbyName('TIPDET').AsString = 'I4' Then // por ser el importe de DETRACCION
         Begin
         // ACCESA AL TGE105 PARA TOMAR EL NOMBRE DEL BANCO PARA EL CHEQUE DE LA DETRACCION
            xSQL := 'SELECT * FROM TGE105 WHERE BANCOPRF=' + quotedstr('BN-');
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
         xSQL := 'UPDATE CAJA302 SET ECCHQEMI=''S'' '
            + 'WHERE CIAID=''' + dblcCia.text + ''' and '
            + 'TDIARID=''' + dblcTDiario.text + ''' and '
            + 'ECANOMM=''' + edtPeriodo.text + ''' and '
            + 'ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
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
   wSQL := 'SELECT * from CAJA302 a WHERE ' +
      'a.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) + ' AND ' +
      'a.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND ' +
      'a.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND ' +
      'a.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMPR').AsString) + ' ';
   DMTE.cdsEgrCaja.Close;

   DMTE.cdsEgrCaja.Filter := '';
   DMTE.cdsEgrCaja.Filtered := False;
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest(wSQL);
   DMTE.cdsEgrCaja.Open;

   wSQL := 'SELECT * from CAJA303 a WHERE ' +
      'a.CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) + ' AND ' +
      'a.TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND ' +
      'a.ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND ' +
      'a.ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString) + ' ';
   DMTE.cdsDocPago.Close;
   DMTE.cdsDocPago.DataRequest(wSQL);
   DMTE.cdsDocPago.Open;
   DMTE.cdsDocPago.EnableControls;
End;

Procedure TFPagoGlobal.bbtnCHClick(Sender: TObject);
Begin
   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' Then
   Begin
      dbeCH.Text := DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString;
      pnlCH.Visible := True;
   End;
End;

Procedure TFPagoGlobal.bbtnGraClick(Sender: TObject);
Begin
   DMTE.cdsEgrCaja.Edit;
   DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString := dbeCH.Text;
   DMTE.cdsEgrCaja.Post;
   DMTE.cdsEgrCaja.ApplyUpdates(-1);
   dbeNoChq.Text := DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString;
   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' Then
      z2bbtnContClick(Self);
   pnlCH.Visible := False;
End;

Procedure TFPagoGlobal.bbtnCanCHClick(Sender: TObject);
Begin
   pnlCH.Visible := False;
End;

Procedure TFPagoGlobal.dbeCHExit(Sender: TObject);
Var
   xSql: String;
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

Procedure TFPagoGlobal.fg_AtualizaNComprob(wgCompania, wgTdiario, wgPeriodo, wgNumero: String);
Var
   xsSql: String;
Begin
   xsSql := ' UPDATE CAJA303 SET CNTCOMPROB = ECNOCOMP ' +
      ' WHERE CIAID = ' + QuotedStr(wgCompania) +
      ' AND TDIARID = ' + QuotedStr(wgTdiario) +
      ' AND ECANOMM = ' + QuotedStr(wgPeriodo) +
      ' AND ECNOCOMP = ' + QuotedStr(wgNumero);
   DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);

   xsSql := ' UPDATE  CAJA304 SET  CNTCOMPROB = ECNOCOMP ' +
      ' WHERE CIAID = ' + QuotedStr(wgCompania) +
      ' AND TDIARID = ' + QuotedStr(wgTdiario) +
      ' AND ECANOMM = ' + QuotedStr(wgPeriodo) +
      ' AND ECNOCOMP = ' + QuotedStr(wgNumero);
   DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);

End;

Function TFPagoGlobal.fg_VerificaDatosDetraccion(wgClauxid, wgProv, wgDocId, wgSerie, wgNoDoc: String): Boolean;
Var
   xsSql: String;
Begin
   xsSql := ' SELECT CPTODETRSUNATID, TIPOOPERSUNATID FROM CXP301 ' +
      ' WHERE DTRPORC > 0 ' +
      ' AND CLAUXID =  ' + QuotedStr(wgClauxid) +
      ' AND PROV = ' + QuotedStr(wgProv) +
      ' AND DOCID =  ' + QuotedStr(wgDocId) +
      ' AND CPSERIE = ' + QuotedStr(wgSerie) +
      ' AND CPNODOC = ' + QuotedStr(wgNoDoc) +
      ' AND CPESTADO IN (' + QuotedStr('P') + ',' + QuotedStr('C') + ') ';

   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;
   If DMTE.cdsQry.RecordCount = 0 Then
   Begin
      Result := True;
      Exit;
   End;
   If (Length(DMTE.cdsQry.FieldByName('CPTODETRSUNATID').AsString) = 0) Then
   Begin
      ShowMessage('Error en la Provisión del Documento:' + wgSerie + '-' + wgNoDoc + #13 +
         'Debe ingresar un valor en el campo Tipo de Detracción');
      Result := False;
      Exit;
   End;
   If (Length(DMTE.cdsQry.FieldByName('TIPOOPERSUNATID').AsString) = 0) Then
   Begin
      ShowMessage('Error en la Provisión del Documento:' + wgSerie + '-' + wgNoDoc + #13 +
         'Debe ingresar un valor en el campo Tipo de Operación');
      Result := False;
      Exit;
   End;
   Result := True;
End;

//Inicio HPC_201401_CAJA
function TFPagoGlobal.VConceptoDetrac(vCiaid, vTdiarid, vDcpAnomm,vCpNoreg: String): String;
VAR xSql:String;
begin
  xSql:=' SELECT CXP301.*, nvl(B.TIENE_DETRAC,''N'') TIENE_DETRAC '
      +'  FROM CXP301, '
      +' (SELECT case when CXP201.DTRPORC>0 then ''S'' else ''N'' end TIENE_DETRAC '
      +'  FROM CXP302,CXP201 '
      +'  WHERE CXP302.CIAID='''+vCiaid+''' '
      +'    and CXP302.TDIARID='''+vTdiarid+''' '
      +'    and CXP302.DCPANOMM='''+vDcpAnomm+''' '
      +'    and CXP302.CPNOREG='''+vCpNoreg+''' '
      +'    and CXP302.TIPDET IN (''MG'',''MN'',''NG'') '
      +'    and CXP201.CPTOID=CXP302.CPTOID '
      +'  ) B '
      +' WHERE CXP301.CIAID='''+vCiaid+''' and CXP301.CPANOMES='''+vDcpAnomm+''' and CXP301.TDIARID='''+vTdiarid+''' and CXP301.CPNOREG='''+vCpNoreg+''' ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSql);
   DMTE.cdsQry.Open;
   Result := DMTE.cdsQry.FieldByName('TIENE_DETRAC').Asstring
end;
//Final HPC_201401_CAJA

//Inicio HPC_201401_CAJA
//DETERMINA SI EL PROVEEDOR ESTA HABILITADO PARA RE5TENCION
Function TFPagoGlobal.ProveedorRetiene(vProv: String): String;
var xsql:string;
begin
xsql:=' SELECT PROVRETIGV FROM TGE201 WHERE PROV='''+vProv+'''  AND NVL(PROVRETIGV,''N'')=''S'' AND  NVL(ACTIVO,''N'')=''S'' '+
      ' UNION ALL '+
      ' SELECT PROVRETIGV FROM CNT201 WHERE AUXID='''+vProv+''' AND NVL(PROVRETIGV,''N'')=''S'' AND  NVL(ACTIVO,''N'')=''S'' ';
DMTE.cdsQry.Close;
DMTE.cdsQry.DataRequest(xSql);
DMTE.cdsQry.Open;
   If DMTE.cdsQry.RecordCount > 0 Then
     Result := 'S'
   Else
     Result := 'N';
//Final HPC_201401_CAJA

end;

procedure TFPagoGlobal.sbDisenoRepClick(Sender: TObject);
begin
// Inicio HPC_201403_CAJA
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
// Fin HPC_201403_CAJA
end;

End.


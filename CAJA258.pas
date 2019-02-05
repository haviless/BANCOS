Unit CAJA258;

// Inicio Uso Estándares:   01/08/2011
// Unidad               :   Caja201
// Formulario           :   FEgresoCaja
// Fecha de Creación    :   27/02/2014
// Autor                :   Hugo Noriega
// Objetivo             :   Pago de Documentos NO Provisionados

// Actualizaciones      :
// HPC_201401_CAJA  27/02/2014  -  Rendición de Caja
// HPC_201701_CAJA  26/04/2017  -  Modificación en registro de DCSERIE, actualizar con valor '000'
//                                 Nueva validación para la fecha de emisión

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos,
   StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
   wwdbdatetimepicker, wwdblook, ExtCtrls, Db, Wwdatsrc, DBClient, wwclient,
   Wwdotdot, wwidlg, CAJADM, ppComm, ppRelatv, ppProd, ppClass, ppReport,
   ComCtrls, ppPrnabl, ppCtrls, ppCache, ppBands, oaContabiliza, ppDB,
   ppDBPipe, ppTypes, Variants, ppEndUsr, ppParameter;

Type
   TFRendicionCaja = Class(TForm)
      pnlCabecera1: TPanel;
      lblCia: TLabel;
      edtCia: TEdit;
      dblcCia: TwwDBLookupCombo;
      pnlCabecera2: TPanel;
      lblTMon: TLabel;
      lblTCambio: TLabel;
      lblProvDes: TLabel;
      lblBanco: TLabel;
      lblCCBco: TLabel;
      lblNoChq: TLabel;
      lblFormPago: TLabel;
      edtTMon: TEdit;
      dbeTCambio: TwwDBEdit;
      z2bbtnCancel: TBitBtn;
      z2bbtnOK: TBitBtn;
      dblcTMon: TwwDBLookupCombo;
      dbeGiradoA: TwwDBEdit;
      dblcBanco: TwwDBLookupCombo;
      dblcCCBco: TwwDBLookupCombo;
      dbeNoChq: TwwDBEdit;
      dblcFormPago: TwwDBLookupCombo;
      edtFormPago: TEdit;
      edtBanco: TEdit;
      pnlDetPago: TPanel;
      pnlBotones: TPanel;
      z2bbtnSumat: TBitBtn;
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
      z2bbtnAnula: TBitBtn;
      z2bbtnCalc: TBitBtn;
      dbgDetPagoIButton: TwwIButton;
      pnlActualiza: TPanel;
      dbeNoReg: TwwDBEdit;
      Label3: TLabel;
      Label5: TLabel;
      dblcTDoc2: TwwDBLookupCombo;
      edtTDoc2: TEdit;
      Label9: TLabel;
      dbeSerie: TwwDBEdit;
      Label10: TLabel;
      dbeNoDoc2: TwwDBEdit;
      Label11: TLabel;
      edtCuenta2: TwwDBEdit;
      Label7: TLabel;
      Label8: TLabel;
      dblcTMon2: TwwDBLookupCombo;
      Label12: TLabel;
    dbeImporte2_: TwwDBEdit;
      edtTMon2: TEdit;
      dbeTCamDoc: TwwDBEdit;
      Label13: TLabel;
      edtMtoLoc: TwwDBEdit;
      Label14: TLabel;
      edtMtoExt: TwwDBEdit;
      Label18: TLabel;
      Label20: TLabel;
      dbdtpFEmis2: TwwDBDateTimePicker;
      dbdtpFVcto2: TwwDBDateTimePicker;
      z2bbtnOK2: TBitBtn;
      z2bbtnCancel3: TBitBtn;
      Label2: TLabel;
      Label1: TLabel;
      GroupBox1: TGroupBox;
      Label16: TLabel;
      Label15: TLabel;
      dbeTCamPr: TwwDBEdit;
      Label21: TLabel;
      dbeDH: TwwDBEdit;
      Label22: TLabel;
      z2bbtnOKCab: TBitBtn;
      edtAuxRuc: TEdit;
      dblcdCCosto: TwwDBLookupComboDlg;
      Label23: TLabel;
      dblcdAux: TwwDBLookupComboDlg;
      dblcClase: TwwDBLookupCombo;
      edtClase: TEdit;
      dbdtpFEmis: TwwDBDateTimePicker;
      Label24: TLabel;
      Z2bbtnEmiChq: TBitBtn;
      Label6: TLabel;
      dblcdCnp2: TwwDBLookupComboDlg;
      Label25: TLabel;
      dblcClaseDet: TwwDBLookupCombo;
      edtClaseDet: TEdit;
      Label26: TLabel;
      dblcdAuxDet: TwwDBLookupComboDlg;
      dbeAuxDet: TwwDBEdit;
      dblcdFEfec: TwwDBLookupComboDlg;
      dbeFEfec: TwwDBEdit;
      Label17: TLabel;
      edtCuenta: TwwDBLookupComboDlg;
      wwDBEdit1: TwwDBEdit;
      dbeRepo: TwwDBEdit;
      lblRepo: TLabel;
      dblcdCnp: TwwDBLookupComboDlg;
      dbeCCos: TwwDBEdit;
      lblPJSV: TLabel;
      Label19: TLabel;
      edtAuxNombre: TEdit;
      Z2bbtnRetencion: TBitBtn;
      ppdbRetencion: TppDBPipeline;
      pprRetencion: TppReport;
      edtCnp2: TwwDBEdit;
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
      ppReport1: TppReport;
      ppHeaderBand2: TppHeaderBand;
      ppDetailBand2: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppParameterList1: TppParameterList;
      ppd1: TppDesigner;
      pnlSunat: TPanel;
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
      ppDBText13: TppDBText;
      ppDBCalc4: TppDBCalc;
      ppDBCalc1: TppDBCalc;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      bbtnCH: TBitBtn;
      pnlCH: TPanel;
      Label4: TLabel;
      dbeCH: TwwDBEdit;
      bbtnGra: TBitBtn;
      bbtnCanCH: TBitBtn;
      sbDisenoRep: TSpeedButton;
      cbDisenoRep: TCheckBox;
    dbeImporte2: TEdit;
      Procedure dblcCiaExit(Sender: TObject);
      Procedure edtProvRUCExit(Sender: TObject);
      Procedure z2bbtnCancelClick(Sender: TObject);
      Procedure z2bbtnOKClick(Sender: TObject);
      Procedure dbdtpFCompExit(Sender: TObject);
      Procedure dblcTDiarioExit(Sender: TObject);
      Procedure z2bbtnCalcClick(Sender: TObject);
      Procedure dbeNoCompExit(Sender: TObject);
      Procedure dblcTMonExit(Sender: TObject);
      Procedure dblcTDocExit(Sender: TObject);
      Procedure dblcBancoExit(Sender: TObject);
      Procedure dblcCCBcoExit(Sender: TObject);
      Procedure dblcCnp2Exit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure z2bbtnSumatClick(Sender: TObject);
      Procedure z2bbtnSubeClick(Sender: TObject);
      Procedure z2bbtnCancel2Click(Sender: TObject);
      Procedure z2bbtnNuevoClick(Sender: TObject);
      Procedure z2bbtnGrabaClick(Sender: TObject);
      Procedure z2bbtnCanceladoClick(Sender: TObject);
      Procedure z2bbtnContClick(Sender: TObject);
      Procedure z2bbtnAnulaClick(Sender: TObject);
      Procedure dbgDetPagoIButtonClick(Sender: TObject);
      Procedure z2bbtnCancel3Click(Sender: TObject);
      Procedure dbeNoRegExit(Sender: TObject);
      Procedure z2bbtnOK2Click(Sender: TObject);
      Procedure dblcTMon2Exit(Sender: TObject);
      Procedure dblcTMon2Change(Sender: TObject);
      Procedure dblcCnp2Change(Sender: TObject);
      Procedure dbeImporte2_Exit(Sender: TObject);
      Procedure dbgDetPagoKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure dbeDHChange(Sender: TObject);
      Procedure dbeLoteExit(Sender: TObject);
      Procedure dblcdProvChange(Sender: TObject);
      Procedure edtProvRUCChange(Sender: TObject);
      Procedure dbeGiradoAChange(Sender: TObject);
      Procedure dbeTCambioChange(Sender: TObject);
      Procedure dbeImporteChange(Sender: TObject);
      Procedure dbeNoDocChange(Sender: TObject);
      Procedure dbeNoChqChange(Sender: TObject);
      Procedure dbeLoteChange(Sender: TObject);
      Procedure dbeGlosaChange(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure z2bbtnOKCabClick(Sender: TObject);
      Procedure LookUpMostrado(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure NoEstaenLookUp(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure MensajeComboNoExit(DBLook: TwwDBCustomLookupCombo);
      Procedure Validacion(Sender: TObject);
      Procedure dblcTDocNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcTDocCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure dblcCnpNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcCnpCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure InhabilitarPaneles;
      Procedure dbgDetPagoDblClick(Sender: TObject);
      Procedure dblcTDoc2Exit(Sender: TObject);
      Procedure LiberarFiltrosRegistroEgresos;
      Procedure EstablecerFiltrosRegistroEgresos;
      Procedure FormCreate(Sender: TObject);
      Procedure Button1Click(Sender: TObject);
      Procedure z2bbtnImprimeClick(Sender: TObject);
      Procedure dblcBancoEnter(Sender: TObject);
      Procedure dblcFormPagoExit(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dblcClaseExit(Sender: TObject);
      Procedure dblcdAuxExit(Sender: TObject);
      Procedure Z2bbtnEmiChqClick(Sender: TObject);
      Procedure dbeTCambioEnter(Sender: TObject);
      Procedure dbeImporteEnter(Sender: TObject);
      Procedure dbeTCambioExit(Sender: TObject);
      Procedure dbeImporteExit(Sender: TObject);
      Procedure dblcdAuxExit2(Sender: TObject);
      Procedure dblcdCnp2Exit2(Sender: TObject);
      Procedure wwDBEdit1Change22(Sender: TObject);
      Procedure dblcClaseDetExit(Sender: TObject);
      Procedure FormDestroy(Sender: TObject);
      Procedure dblcdFEfecExit(Sender: TObject);
      Procedure dblcdFEfecEnter(Sender: TObject);
      Procedure dblcdCnpExit(Sender: TObject);
      Procedure dbeNoChqExit(Sender: TObject);
      Procedure dblcdCCostoExit(Sender: TObject);
      Procedure dblcdAuxDetEnter(Sender: TObject);
      Procedure Z2bbtnRetencionClick(Sender: TObject);
      Procedure dblcdCnpKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure Z2bbtChqVouchClick(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcBancoNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcCCBcoNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure bbtnCHClick(Sender: TObject);
      Procedure bbtnGraClick(Sender: TObject);
      Procedure bbtnCanCHClick(Sender: TObject);
      Procedure dbeNoDoc2Exit(Sender: TObject);
      Procedure sbDisenoRepClick(Sender: TObject);
    procedure dbeImporte2Exit(Sender: TObject);
    procedure dbeImporte2KeyPress(Sender: TObject; var Key: Char);

   Private
      xNReg: Integer;
      xRUCCIA: String; // para el ruc de la compañia
      xchek: double;
      strTmp: String;
      cdsConceptoC1: TwwClientDataset;
    { Private declarations }
      A1: Array Of Integer;
      A2: Array Of TNotifyEvent;
      A2digitos, A4digitos: Array Of TWinControl;
    //
      cf1: TControlFoco;
      cdsFiltro: TwwClientDataset;
      xGraboNuevo: Boolean;
      wFechaCierre: TDatetime;
      wFrecu: Integer;
      xDebeT: Double;
      xHabeT: Double;
      xDebeTD: Double;
      xHabeTD: Double;
      xRetLoc, xRetExt: Double;
      xMtoLoc, xMtoExt: Double;

      xVoucher: String;

      xDetraccion: String;
      Function ValidacionCabecera: Boolean;
      Procedure ValidacionCabecera1;
      Procedure ActPnlBotones;
      Procedure AdicionarRegistros;
      Procedure ConsisCancela(Var xconsis: Boolean);
      Procedure Contab_DifCambio;
      Procedure Contab_DifCambio2;
      Procedure Contab_EgrCaja;
      Procedure IniciaDatos;
      Procedure IniciaPanel;
      Procedure Contab_RegCxP;
      Function ValidaCampo: Boolean;
      Procedure AdicIniciaDatos;
      Procedure ActualizaSaldosCaja;
      Procedure ConfiguraAccesos;
      Procedure Proc_Admin;
      Procedure Proc_Consul;
      Procedure Libera_Admin;
      Procedure Libera_Consul;
      Procedure LibConfigAccesos;
      Procedure EdiTarRegistros;
      Procedure ActualizaFiltro;
      Procedure GrabaCabeceraDeComprobante;
      Function ExisteRxH: boolean; //Si existe Recibos por Honorarios para el Clauxid
      Procedure ActualizaSaldosTGE401(ccPgoOri, ccPgoLoc, ccPgoExt: double; sSigno: String);
      Procedure BuscaNReposicion;
      Procedure AsientoDifTotal;
      Function GeneraRetencion: boolean;
      Procedure Contab_DocPago_Retencion_Haber;
      Procedure GeneraRegChqVouch;
      Procedure ProveedoresNotificados;
   Public
    { Public declarations }
      //Inicio HPC_201401_CAJA
      vRendicion:Currency;
      sKeyVale:String;
      //Final HPC_201401_CAJA
      sCuentaCajaChica: String;

      wCptoGan,
         wCptoPer,
         wCtaGan,
         wCtaPer: String;
      wCCosDif: String;
      Procedure Contabiliza;
      Procedure RecCptosDifC;
      Procedure Adiciona;
      Procedure Edita(cds: Twwclientdataset);
      Procedure fg_ObtieneCtaporCentroCosto(wgCentroCosto: String);
      Procedure fg_ContabFilial(wgCia, wgPeriodo, wgDiario, wgNumComprob: String);
      Procedure fg_ContabInsPago(wgCia, wgPeriodo, wgDiario, wgNumComprob: String; wgRegistro: Integer);
      Procedure fg_InsertaFilialCaja302(wgCiaPrincipal, wgDiario, wgPeriodo,
         wgComprobante, wgCiaFilial, wgNumComprobFilial: String);
      Function fg_ObtieneNumComprob(wgCompania, wgPeriodo,
         wgDiario: String): String;
      Procedure fg_EliminarContaFilial(wgCiaPrinc, wgDiarioPrinc, wgPeriodoPrinc, wgNumPrinc: String);
      Function fg_ExisteContabFilial(wgCiaPrincipal, wgPeriodo, wgTiario, wgNumero: String): Boolean;
      Function fg_BuscaDocProvisionado(wgTipoAuxiliar, wgProveedor, wgTipoDocumento, wgSerie, wgNumDocumento: String): Boolean;
      //Inicio HPC_201401_CAJA
      Function Valores(Texto: String): Currency;
      //Final HPC_201401_CAJA
   End;

Var
   FRendicionCaja: TFRendicionCaja;
   wbsumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,
      wbcancel2, wbChq: Boolean;
   wModifica: Boolean;
   bFlagRecuperacion: Boolean;
   wTDocRxH: String; //Flag p' almacenar el id del Tdocumento
   xEncuentra, wCiaRetIGV: boolean; //Flag para RxHonorarios
   wSerie, wBcoTipCta: String;
Implementation

Uses CAJAUTIL, oaTE2000, Caja290;
{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}

Procedure TFRendicionCaja.IniciaDatos;
Begin
   pnlCabecera1.Enabled := True;
   pnlCabecera2.Enabled := False;
   pnlDetPago.Enabled := False;
   pnlBotones.Enabled := False;

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
   z2bbtnSumat.Enabled := False;
   z2bbtnCont.Enabled := False;
   z2bbtnImprime.Enabled := False;
   z2bbtnSube.Enabled := False;
   z2bbtnGraba.Enabled := False;
   z2bbtnCancelado.Enabled := False;
   z2bbtnCancel2.Enabled := False;
   z2bbtnAnula.Enabled := False;

   dblcCia.Text := ''; // Código de Compañía
   edtCia.Enabled := False;
   edtCia.Text := ''; // Descripción de la Compañía
   edtPeriodo.Enabled := False;
   edtPeriodo.Text := ''; // Periodo
   dblcTDiario.Text := ''; // Tipo de Diario
   dbeNoComp.Text := ''; // Comprobante

   edtClase.Enabled := False;
   dblcdAux.Text := ''; // Código de Proveedor
   edtAuxRUC.Text := ''; // RUC del Proveedor
   dbeGiradoA.Text := ''; // Pago Girado A ....
   edtAuxNombre.text := '';
   dblcTMon.Text := ''; // Tipo de Moneda
   edtTMon.Enabled := False;
   edtTMon.Text := ''; // Descripción de la Moneda
   dbeTCambio.Text := ''; // Tipo de Cambio
   dbeImporte.Text := ''; // Monto a pagar
   dblcTDoc.Text := ''; // Tipo de Documento
   edtTDoc.Enabled := False;
   edtTDoc.Text := ''; // Descripción del T.Doc
   dbeNoDoc.Text := ''; // Nro.Documento
   dblcBanco.Text := ''; // Código de Banco
   edtBanco.Enabled := False;
   edtBanco.Text := ''; // Descripción de Banco
   dblcCCBco.Enabled := False;
   dblcCCBco.Text := ''; // Cuenta Corriente del Banco
   edtCuenta.Enabled := False;
   edtCuenta.Text := ''; // Descripción de la Cuenta Contable Principal
   dblcFormPago.Text := ''; // Forma de Pago
   edtFormPago.Enabled := False;
   edtFormPago.Text := ''; // descripción de forma de pago
   dbeNoChq.Enabled := False;
   dbeNoChq.Text := ''; // Cheque
   dbeLote.Text := '000'; // Lote
   dblcdCnp.Text := ''; // Concepto
   dbeGlosa.Text := ''; // Glosa
   dbeFEfec.Text := '';
   lblEstado.Caption := ''; //Inicializar el Estado
   dbdtpFEmis.Date := 0;
   dbeRepo.Text := '';
   wModifica := False;

   dbgDetPagoIButton.Enabled := True;
   dbgDetPago.KeyOptions := [dgEnterToTab];
   dbgDetPago.ColumnByName('DEMTOLOC').FooterValue := '';
   dbgDetPago.ColumnByName('DEMTOEXT').FooterValue := '';

// Limpiando filtros si lo tuvieran
   DMTE.cdsRegCxP.Filtered := False;

   z2bbtnOKCab.Enabled := true;
End;

{*******************************************************
PRIMER PANEL - DATOS INICIALES DE LA CABECERA
*******************************************************}

Procedure TFRendicionCaja.dblcCiaExit(Sender: TObject);
Var
   xSQL: String;
Begin
   edtCia.text := DMTE.DisplayDescripLocal(DMTE.cdsCia, 'CIAID', dblcCia.Text, 'CIADES');
   wCiaRetIGV := (DMTE.cdsCia.FieldByName('CIARETIGV').AsString = 'S');
   If edtCia.Text = '' Then
   Begin
      ShowMessage('Error : Compañía no Válida');
      dblcCia.SetFocus;
      Exit;
   End;

   If DMTE.wModo = 'A' Then
   Begin
      xSQL := 'select A.CPTOID, A.CPTODES, A.CUENTAID, FCTZ From CAJA201 A '
            + ' where A.CPTOIS=''E'' '
            + '   and exists (SELECT CUENTAID '
            + '                 FROM TGE202 B '
            + '                WHERE A.CUENTAID=B.CUENTAID AND B.CTAACT=''S'' '
            + '                  AND B.CIAID=''' + dblcCia.Text + ''') '
            + ' order by A.CPTOID';
      DMTE.cdsCptos.Close;
      DMTE.cdsCptos.DataRequest(xSQL);
      DMTE.cdsCptos.Open;
   End;
   cdsConceptoC1.CloneCursor(DMTE.cdsCptos, True);
   cdsConceptoC1.Name := 'cdsConceptoC1';
   cdsConceptoC1.Filtered := True;
   dblcdCnp2.LookupTable := cdsConceptoC1;

   xRUCCIA := DMTE.cdsCia.Fieldbyname('CIARUC').AsString;
End;

Procedure TFRendicionCaja.dbdtpFCompExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If dblcCia.Focused Then Exit;
   If dblcBanco.Focused Then Exit;
   If dblcCCBco.Focused Then Exit;

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
         Close;
         dbdtpFComp.SetFocus;
         exit;
      End;
   End;

   xWhere := 'TMONID =' + QuotedStr(DMTE.wTMonExt)
      + ' And FECHA =' + DMTE.wRepFuncDate + '''' + FormatDateTime(DMTE.wFormatFecha, dbdtpFComp.Date) + ''')';
   If Length(DMTE.DisplayDescrip('prvTGE', 'TGE107', 'TMONID, ' + DMTE.wTipoCambioUsar, xWhere, 'TMONID')) = 0 Then
   Begin
      ShowMessage('Tipo de Cambio No Registrado');
      dbdtpFComp.SetFocus;
      exit;
   End;

   If dbdtpFComp.Date = 0 Then
   Begin
      ShowMessage('Fecha de Comprobante Errada');
      dbdtpFComp.SetFocus;
   End
   Else
   Begin
      If wFechaCierre <> 0 Then
         If (TwwDBDateTimePicker(Sender).Date <= wFechaCierre)
            Or (TwwDBDateTimePicker(Sender).Date > (wFechaCierre + wFrecu)) Then
         Begin
            TwwDBDateTimePicker(Sender).SetFocus;
            ShowMessage('Ingrese Fecha dentro del Rango' + #13 +
                        'Fecha de Cierre  : ' + DateTimeToStr(wfechacierre) + #13 +
                        'Frecuencia       : ' + IntToStr(wFrecu));
            Exit;
         End;

      edtPeriodo.Text := Copy(DateToStr(dbdtpFComp.Date), 7, 4)
         + Copy(DateToStr(dbdtpFComp.Date), 4, 2);
      dbdtpFEmis.Date := dbdtpFComp.Date;

      If Trim(dblcTDiario.Text) <> '' Then
      Begin
         xWhere := 'CIAID=' + QuotedStr(dblcCia.Text)
            + ' AND ECANOMM=' + QuotedStr(edtPeriodo.Text)
            + ' AND TDIARID=' + QuotedStr(dblcTDiario.Text);
         dbeNoComp.Text := DMTE.UltimoNum('prvCaja', 'CAJA302', 'ECNOCOMP', xWhere);
         dbeNoComp.Text := DMTE.StrZero(dbeNoComp.Text, DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
      End;
   End;
End;

Procedure TFRendicionCaja.dblcTDiarioExit(Sender: TObject);
Var
   xWhere, xTmp: String;
Begin
   xTmp := DMTE.DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', 'TDIARID=' + QuotedStr(dblcTDiario.text), 'TDIARDES');
   If xTmp <> '' Then
   Begin
      xWhere := 'CIAID=' + QuotedStr(dblcCia.Text)
         + ' AND ECANOMM=' + QuotedStr(edtPeriodo.Text)
         + ' AND TDIARID=' + QuotedStr(dblcTDiario.Text);
      dbeNoComp.text := DMTE.UltimoNum('prvCaja', 'CAJA302', 'ECNOCOMP', xWhere);
      dbeNoComp.text := DMTE.StrZero(dbeNoComp.text, DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
   End;
End;

Procedure TFRendicionCaja.dbeNoCompExit(Sender: TObject);
Begin
   dbeNoComp.text := DMTE.StrZero(dbeNoComp.text, DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
End;

{*******************************************************
SEGUNDO PANEL - DATOS ADICIONALES DE LA CABECERA
*******************************************************}

Procedure TFRendicionCaja.edtProvRUCExit(Sender: TObject);
Var
   xWhere, xTiene: String;
Begin
   If Length(edtAuxRUC.Text) > 0 Then
   Begin
      xWhere := 'PROVRUC=' + '''' + edtAuxRUC.Text + '''';
      xTiene := DMTE.DisplayDescrip('prvTGE', 'TGE201', 'PROVDES, PROV, PROVGIRA', xWhere, 'PROVDES');
      If Length(xTiene) = 0 Then
      Begin
         ShowMessage('Registro Único de Proveedor Errado');
         edtAuxRUC.SetFocus;
      End
      Else
      Begin
         dblcdAux.Text := DMTE.cdsqry.FieldByName('PROV').AsString;
         If Length(dbeGiradoA.Text) = 0 Then
         Begin
            If Length(DMTE.cdsqry.FieldByName('PROVGIRA').AsString) = 0 Then
               dbeGiradoA.Text := DMTE.cdsqry.FieldByName('PROVDES').AsString
            Else
            Begin
               dbeGiradoA.Text := DMTE.cdsqry.FieldByName('PROVGIRA').AsString;
            End;
         End
      End;
   End;
End;

Procedure TFRendicionCaja.dblcTMonExit(Sender: TObject);
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
      ShowMessage('Error : Moneda no Válida');
      dblcTMon.SetFocus;
      Exit;
   End;
End;

Procedure TFRendicionCaja.dblcTDocExit(Sender: TObject);
Begin
   If z2bbtnCancel.Focused Then exit;
   If dbeNoChq.Focused Then exit;
   If dbdtpFEmis.Focused Then exit;
   If edtCuenta.Focused Then exit;
   If dblcFormPago.Focused Then exit;

   edtTDoc.text := DMTE.DisplayDescripLocal(DMTE.cdsTDoc, 'DOCID', dblcTDoc.Text, 'DOCDES');

   If edtTDoc.Text = '' Then
   Begin
      ShowMessage('Error : Tipo de Documento no Válido');
      dblcTDoc.SetFocus;
      Exit;
   End;

   xEncuentra := false;
   dbeNodoc.enabled := true;
   dbeImporte.enabled := true;
End;

Procedure TFRendicionCaja.dblcBancoExit(Sender: TObject);
Begin
   If dblcCia.Focused Then Exit;

   edtBanco.Text := DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr, 'BANCOID', dblcBanco.Text, 'BANCOABR');

   If edtBanco.Text = '' Then
   Begin
      dblcBanco.Clear;
      edtBanco.Text := '';
      ShowMessage('Error : Banco no Válido');
      dblcBanco.SetFocus;
      Exit;
   End;

   wBcoTipCta := DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').AsString;

   If DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').AsString = 'C' Then
   Begin //Si es CAJA
      dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE', 'TGE106', 'CCBCOVOUCH', 'BANCOID=' + QuotedStr(dblcBanco.text), 'CCBCOVOUCH');
      dblcTDiario.OnExit(dblcTDiario);
      dblcCCBco.Enabled := False;
      dblcTMon.Enabled := True;
      edtCuenta.Text := DMTE.DisplayDescrip('prvTGE', 'TGE105', 'CUENTAID', 'BANCOID=' + QuotedStr(dblcBanco.text), 'CUENTAID');
      DMTE.cdsFormPago.Filter := 'FCANJE=''S''';
      DMTE.cdsFormPago.Filtered := True;
      If DMTE.cdsFormPago.RecordCount = 1 Then
      Begin
         dblcFormPago.text := DMTE.cdsFormPago.FieldByName('FPAGOID').AsString;
         dblcFormPago.OnExit(Self);
      End;
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
      DMTE.cdsCCBco.Filter := 'BANCOID=' + '''' + dblcBanco.Text + '''' + ' AND CIAID=' + QuotedStr(dblcCia.text) + ' AND CUEEMICHE=''S''';
      DMTE.cdsCCBco.Filtered := True;
     //filtrar los tipos de pago
      DMTE.cdsFormPago.Filter := 'FCBCO=''1'' or FCBCO=''S'' ';
      DMTE.cdsFormPago.Filtered := True;
      dblcCCBco.SetFocus;
   End;

   If DMTE.cdsFormPago.RecordCount > 1 Then
   Begin
      dblcFormPago.Enabled := True;
      dblcFormPago.Text := '';
      edtFormPago.Text := '';
   End
   Else
      dblcFormPago.Enabled := False;

   dblcFormPago.Text := DMTE.cdsFormPago.FieldByName('FPAGOID').AsString;
   dbeNoChq.Text := '';
   wModifica := True;
End;

Procedure TFRendicionCaja.dblcCCBcoExit(Sender: TObject);
Var
   Tmp: String;
Begin
   If dblcCia.Focused Then Exit;
   If dblcBanco.Focused Then Exit;

   tmp := DMTE.DisplayDescripLocal(DMTE.cdsCCBco, 'CCBCOID', dblcCCBco.Text, 'CCBCOID');

   If Tmp = '' Then
   Begin
      edtCuenta.Text := '';
      dblcdCnp.Text := '';
      dbeGlosa.Text := '';
      ShowMessage('Error : Cuenta Corriente No Válida');
      dblcccbco.SetFocus;
      exit;
   End;

   dblcTmon.Text := DMTE.cdsCCBco.FieldByName('TMONID').AsString;
   edtTMon.Text := DMTE.DisplayDescripLocal(DMTE.cdsTMon, 'TMONID', dblcTMon.text, 'TMONDES');
   dbeNOChq.Text := '';

   edtCuenta.Text := DMTE.cdsCCBco.FieldByName('CTAPRINC').AsString;
   dblcdCnp.Text := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTOID', 'CPTOID=' + QuotedStr(DMTE.cdsCCBco.FieldByName('CPTOID').AsString), 'CPTOID');
   dbeGlosa.Text := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTODES', 'CPTOID=' + QuotedStr(dblcCCBco.text), 'CPTODES'); //  DMTE.cdsCCBcoLKGLOSA.AsString ;
   xVoucher := DMTE.cdsCCBco.FieldByName('CCBCOVOUCH').AsString;

   If DMTE.wModo = 'A' Then
   Begin
      dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE', 'TGE106', 'CCBCOVOUCH', 'BANCOID=' + QuotedStr(dblcBanco.text) + ' AND CCBCOID=' + QuotedStr(dblcCCBco.text), 'CCBCOVOUCH');
      dblcTDiarioExit(Sender);
   End;

   DMTE.cdsFormPago.First;
   If DMTE.cdsFormPago.RecordCount = 1 Then
      dblcformpago.Enabled := false
   Else
      dblcformpago.Enabled := true;
End;

Procedure TFRendicionCaja.z2bbtnOKClick(Sender: TObject);
Var
   xWhere, aux, sSql: String;
Begin
   ValidacionCabecera1;
    //Inicio HPC_201401_CAJA
    dbeImporte2.text := '0.00';
    //Final HPC_201401_CAJA

// Actualizamos el Client Data Set de Egr.Caja (CAJA302)

   sSql := 'Select CCOSID,CCOSDES,CCOSABR,CCOSNIV,CCOSMOV '
         + '  from TGE203 '
         + ' where CCOSMOV=''S'' '
         + '   and CCOSACT=''S'' '
         + '   and CCOSCIAS LIKE (' + quotedstr('%' + dblcCia.Text + '%') + ' ) ';
   DMTE.cdsCCosto.Close;
   DMTE.cdsCCosto.DataRequest(ssql);
   DMTE.cdsCCosto.open;

// VALIDA LA CUENTA
   If (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text, '', edtCuenta.text)) And (dblcTMon.text = DMTE.wTMonLoc) Then
   Begin
      Raise Exception.Create('La cuenta ' + edtCuenta.text + ' Se registra sólo en Moneda Extranjera.');
   End;

// VALIDA LA CUENTA DEL CONCEPTO
   If (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text, dblcdCnp.text, '')) And (dblcTMon.text = DMTE.wTMonLoc) Then
   Begin
      Raise Exception.Create('La cuenta ' + DMTE.cdsQry.FieldByName('CUENTAID').AsString + ' del Concepto ' + dblcdCnp.text + ' Se registra sólo en Moneda Extranjera.');
   End;

   DMTE.cdsEgrCaja.Edit;

   BuscaNReposicion;
   DMTE.cdsEgrCaja.FieldByName('ECNOREPO').AsString := dbeRepo.Text;
   DMTE.cdsEgrCaja.FieldByName('CIAID').AsString := dblcCia.Text;
   DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString := dblcTDiario.Text;
   DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString := edtPeriodo.Text;
   DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString := dbeNoComp.Text;
   //Inicio HPC_201401_CAJA
   DMTE.cdsEgrCaja.FieldByName('KEYVALE').AsString := sKeyVale;
   //Final HPC_201401_CAJA

   DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString := dblcClase.Text;
   DMTE.cdsEgrCaja.FieldByName('PROV').AsString := dblcdAux.Text;
   DMTE.cdsEgrCaja.FieldByName('PROVRUC').AsString := edtAuxRUC.Text;
   DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime := dbdtpFComp.Date;
   DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString := dblcFormPago.Text;
   DMTE.cdsEgrCaja.FieldByName('EQUIID').AsString := DMTE.EquivFPago(dblcFormPago.Text, dblcBanco.Text);
   DMTE.cdsEgrCaja.FieldByName('DOCID').AsString := dblcTDoc.Text;
   DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString := dbeNoDoc.Text;
   DMTE.cdsEgrCaja.FieldByName('TMONID').AsString := dblcTMon.Text;
   DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat := StrToFloat(dbeTCambio.Text);
   DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat := StrToFloat(dbeImporte.Text);

   DMTE.cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString := xVoucher;
     //**
   If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat := strtofloat(dbeImporte.Text);
      DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat := DMTE.FRound(strtofloat(dbeImporte.Text) / strtofloat(dbeTCambio.Text), 15, 2);
   End
   Else
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat := DMTE.FRound(strtofloat(dbeImporte.Text) * strtofloat(dbeTCambio.Text), 15, 2);
      DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat := strtofloat(dbeImporte.Text);
   End;

// Para Reposición o Para Pagos Adelantados
   DMTE.cdsEgrCaja.FieldByName('ECSALMN').AsFloat := DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat;
   DMTE.cdsEgrCaja.FieldByName('ECSALME').AsFloat := DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat;

   DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString := dblcBanco.Text;
   DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString := dblcCCBco.Text;
   DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString := dbeNoChq.Text;
   DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString := dbeGiradoA.Text;
   DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString := dblcdCnp.Text;
   DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString := edtCuenta.Text;
   DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString := dbeGlosa.Text;
   DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString := dbeLote.Text;
   DMTE.cdsEgrCaja.fieldBYName('ECFEMICH').AsDateTime := dbdtpFEmis.Date;
   DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'I';
   xWhere := 'FECHA=' + DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha, dbdtpFComp.Date) + ''')';
   aux := DMTE.DisplayDescrip('prvTGE', 'TGE114', '*', xWhere, 'FecAno');
   DMTE.cdsEgrCaja.FieldByName('ECANO').AsString := DMTE.cdsqry.FieldByName('FECANO').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECMM').AsString := DMTE.cdsqry.FieldByName('FECMES').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECDD').AsString := DMTE.cdsqry.FieldByName('FECDIA').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECSS').AsString := DMTE.cdsqry.FieldByName('FECSS').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString := DMTE.cdsqry.FieldByName('FECSEM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString := DMTE.cdsqry.FieldByName('FECTRIM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString := DMTE.cdsqry.FieldByName('FECAASS').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString := DMTE.cdsqry.FieldByName('FECAASEM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString := DMTE.cdsqry.FieldByName('FECAATRI').AsString;
   DMTE.cdsEgrCaja.FieldByName('EC_PROCE').AsString := 'I';
   DMTE.cdsEgrCaja.FieldByName('EC_IE').AsString := 'E';

   If trim(dblcdFEfec.Text) = '' Then
      DMTE.cdsEgrCaja.FieldByName('FLUEID').Clear
   Else
      DMTE.cdsEgrCaja.FieldByName('FLUEID').AsString := trim(dblcdFEfec.Text);

   // Actualizamos el Detalle mostrado en el grid ante posibles cambios del
   // Tipo de Cambio
   If Not DMTE.cdsRegCxP.Eof Then
   Begin //Hay documentos en el detalle
      DMTE.cdsRegCxP.DisableControls;
      DMTE.cdsRegCxP.First;
      While Not DMTE.cdsRegCxP.Eof Do
      Begin
         DMTE.cdsRegCxP.Edit;
         DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat := strtofloat(dbeTCambio.Text);

         If DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
         Begin
            DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
            DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
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
   //Actualizamos el Footer
   z2bbtnSumatClick(sender);

   // Estado de los componentes
   pnlCabecera1.enabled := False;
   pnlCabecera2.enabled := False;
   pnlDetPago.enabled := True;
   pnlBotones.Enabled := True;
   ActPnlBotones;
   // Estado de los botones
   z2bbtnOk.Enabled := False;
   z2bbtnCancel.Enabled := False;

   If DMTE.cdsRegCxP.RecordCount = 0 Then
   Begin
      dbgDetPagoIButtonClick(Nil);
   End;

End;

Procedure TFRendicionCaja.z2bbtnCancelClick(Sender: TObject);
Begin
   DMTE.cdsEgrCaja.CancelUpdates;
   DMTE.cdsRegCxP.CancelUpdates;
   Adiciona;
   ADICiNICIAdATOS;

   dbeLote.text := '000';

End;

Procedure TFRendicionCaja.z2bbtnCalcClick(Sender: TObject);
Begin
   WinExec('calc.exe', 1); //Activa la calculadora del Windows
End;

{*******************************************************
CUARTO PANEL - BOTONES
*******************************************************}

Procedure TFRendicionCaja.z2bbtnSumatClick(Sender: TObject);
Var
   xRegAct: TBookMark;
   xWhere: String;
   bMayorQueMonto: boolean;
Begin

// flag de detraccion
   If xDetraccion = 'S' Then
   Begin
      With DMTE Do
      Begin
         cdsRegCxP.DisableControls;
         xRegAct := cdsRegCxP.GetBookmark;
         xMtoLoc := 0;
         xMtoExt := 0;
         xRetLoc := 0;
         xRetExt := 0;
         cdsRegCxP.First;
         While Not cdsRegCxP.Eof Do
         Begin
            If cdsRegCxP.FieldByName('DEDH').AsString = 'D' Then
            Begin
               xMtoLoc := xMtoLoc + StrToFloat(stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText, ',', '', [rfReplaceAll]));
               xMtoExt := xMtoExt + StrToFloat(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText, ',', '', [rfReplaceAll]));
            End
            Else
            Begin
               xMtoLoc := xMtoLoc - StrToFloat(stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText, ',', '', [rfReplaceAll]));
               xMtoExt := xMtoExt - StrToFloat(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText, ',', '', [rfReplaceAll]));
            End;
            cdsRegCxP.Next;
         End;
         dbgDetPago.ColumnByName('DEMTOLOC').FooterValue := floattostrf(xMtoLoc, ffFixed, 10, 2);
         dbgDetPago.ColumnByName('DEMTOEXT').FooterValue := floattostrf(xMtoExt, ffFixed, 10, 2);

         cdsRegCxP.GotoBookmark(xRegAct);
         cdsRegCxP.FreeBookmark(xRegAct);
         cdsRegCxP.EnableControls;
      End;
      Exit;
   End;

   bMayorQueMonto := False;
   With DMTE Do
   Begin
      cdsRegCxP.DisableControls;
      xRegAct := cdsRegCxP.GetBookmark;
      xMtoLoc := 0;
      xMtoExt := 0;
      xRetLoc := 0;
      xRetExt := 0;
      cdsRegCxP.First;
      While Not cdsRegCxP.Eof Do
      Begin
         If cdsRegCxP.FieldByName('DEDH').AsString = 'D' Then
         Begin
            xWhere := 'DOCID=' + QuotedStr(cdsRegCxP.FieldByName('DOCID2').AsString) + ' AND DOCMOD=''CXP''';
            If (DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCRETIGV', xWhere, 'DOCRETIGV') = 'S') And
               (cdsRegCxP.FieldByName('CPFEMIS').AsDateTime >= xTasaFec) And
               (lblSujetoRetencion.Visible) Then
            Begin
               If DMTE.FRound(cdsRegCxP.FieldByName('DEMTOLOC').AsFloat, 15, 4) >= DMTE.xTasaMonto Then
                  bMayorQueMonto := True;
            End;

            xMtoLoc := xMtoLoc + StrToFloat(stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText, ',', '', [rfReplaceAll]));
            xMtoExt := xMtoExt + StrToFloat(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText, ',', '', [rfReplaceAll]));
         End
         Else
         Begin
            xMtoLoc := xMtoLoc - StrToFloat(stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText, ',', '', [rfReplaceAll]));
            xMtoExt := xMtoExt - StrToFloat(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText, ',', '', [rfReplaceAll]));
         End;
         cdsRegCxP.Next;
      End;
      dbgDetPago.ColumnByName('DEMTOLOC').FooterValue := floattostrf(xMtoLoc, ffFixed, 10, 2);
      dbgDetPago.ColumnByName('DEMTOEXT').FooterValue := floattostrf(xMtoExt, ffFixed, 10, 2);

      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);
      cdsRegCxP.EnableControls;
   End;

   If (xRetLoc >= DMTE.xTasaMonto) Or (bMayorQueMonto) Then
   Begin
      xRetLoc := DMTE.FRound(xRetLoc * DMTE.xTasaPorce / 100, 15, 2);
      xRetExt := DMTE.FRound(xRetExt * DMTE.xTasaPorce / 100, 15, 2);
   End
   Else
   Begin
      xRetLoc := 0;
      xRetExt := 0;
   End;
End;

Procedure TFRendicionCaja.z2bbtnSubeClick(Sender: TObject);
Begin
   DMTE.cdsEgrCaja.Edit;
   DMTE.cdsRegCxP.Edit;

   pnlCabecera2.Enabled := True;
   pnlDetPago.Enabled := False;
   pnlBotones.Enabled := False;

   z2bbtnOk.Enabled := True;
   z2bbtnCancel.Enabled := True;

   // Desactivamos los botones
   z2bbtnSumat.Enabled := False;
   z2bbtnCont.Enabled := False;

   z2bbtnImprime.Enabled := False;
   z2bbtnSube.Enabled := False;
   z2bbtnGraba.Enabled := False;
   z2bbtnCancelado.Enabled := False;
   z2bbtnCancel2.Enabled := False;
   z2bbtnAnula.Enabled := False;
End;

Procedure TFRendicionCaja.z2bbtnCancel2Click(Sender: TObject);
Var
   xComprobante: structComprobante;
Begin
   If MessageDlg('¿Anular los cambios?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
       // para grabar el nuevo voucher
      xVoucher := '';

      DMTE.cdsEgrCaja.CancelUpdates;
      DMTE.cdsRegCxP.CancelUpdates;
      If z2bbtnNuevo.Visible Then
      Begin
         Adiciona;
         ADICiNICIAdATOS;
         RecuperarCiaUnica(dblcCia, edtCia);
         dbeLote.Text := '000';
         dbeLote.OnExit(self);
         dblcCia.OnExit(self);
      End
      Else
      Begin
         With xComprobante Do
         Begin
            CIAID := dblcCia.Text;
            ECANOMM := edtPeriodo.Text;
            TDIARID := dblcTDiario.Text;
            ECNOCOMP := dbeNoComp.Text;
         End;
         EdiTa(cdsFiltro);
      End;
   End;
End;

Procedure TFRendicionCaja.z2bbtnNuevoClick(Sender: TObject);
Begin

   dbeRepo.text := '';

   If DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString = 'I' Then
   Begin
      If wModifica Then
      Begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      End;
      If MessageDlg('¿Nuevo Comprobante?', mtConfirmation,
         [mbYes, mbNo], 0) = mrYes Then
      Begin
         Adiciona;
         ADICiNICIAdATOS;
      End
   End
   Else
   Begin
      Adiciona;
      ADICINICIADATOS;

      RecuperarCiaUnica(dblcCia, edtCia);
      dbeLote.text := '000';
      dbeLote.OnExit(self);
      dblcCia.OnExit(self);
   End;
  //para grabar el nuevo voucher
   xVoucher := '';

End;

Procedure TFRendicionCaja.z2bbtnGrabaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If (DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'I') Then
   Begin
      If MessageDlg('¿Desea Grabar?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         screen.Cursor := crHourGlass;
         z2bbtnSumatClick(sender);

         ErrorCount := 0;
         DMTE.DCOM1.AppServer.IniciaTransaccion;

         DMTE.cdsEgrCaja.Edit;
         DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat := xMtoLoc;
         DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat := xMtoExt;
         If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
            DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat := xMtoLoc - xRetLoc
         Else
            DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat := xMtoExt - xRetExt;
         dbeImporte.text := FloatToStr(DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat);

         DMTE.cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString := xVoucher;

         DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString := DMTE.wUsuario; // usuario que registra
         DMTE.cdsEgrCaja.FieldByName('ECFREG').AsDateTime := DateS; // fecha que registra Usuario
         If DMTE.SRV_D = 'ORACLE' Then
            DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := DateS + Time // Hora de Registro de Usuario
         Else
            DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time; // Hora de Registro de Usuario

         DMTE.cdsEgrCaja.Post;
         If DMTE.cdsEgrCaja.ApplyUpdates(0) > 0 Then
         Begin
            xSQL := 'update CAJA302 '
               + '   set ECNOREPO=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOREPO').AsString) + ','
               + '       CLAUXID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString) + ','
               + '       PROV=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('PROV').AsString) + ','
               + '       PROVRUC=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('PROVRUC').AsString) + ','
               + '       ECFCOMP=' + quotedstr(datetostr(DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime)) + ','
               + '       FPAGOID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString) + ','
               + '       EQUIID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('EQUIID').AsString) + ','
               + '       DOCID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('DOCID').AsString) + ','
               + '       ECNODOC=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString) + ','
               + '       TMONID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TMONID').AsString) + ','
               + '       ECTCAMB=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat) + ','
               + '       ECMTOORI=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat) + ','
               + '       CCBCOVOUCH=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString) + ','
               + '       ECMTOLOC=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat) + ','
               + '       ECMTOEXT=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat) + ','
               + '       ECSALMN=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECSALMN').AsFloat) + ','
               + '       ECSALME=' + floattostr(DMTE.cdsEgrCaja.FieldByName('ECSALME').AsFloat) + ','
               + '       BANCOID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString) + ','
               + '       CCBCOID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString) + ','
               + '       ECNOCHQ=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString) + ','
               + '       ECGIRA=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString) + ','
               + '       CPTOID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString) + ','
               + '       CUENTAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString) + ','
               + '       ECGLOSA=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString) + ','
               + '       ECLOTE=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString) + ','
               + '       ECFEMICH=' + quotedstr(datetostr(DMTE.cdsEgrCaja.fieldBYName('ECFEMICH').AsDateTime)) + ','
               + '       ECESTADO=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString) + ','
               + '       ECANO=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANO').AsString) + ','
               + '       ECMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECMM').AsString) + ','
               + '       ECDD=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECDD').AsString) + ','
               + '       ECSS=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECSS').AsString) + ','
               + '       ECSEM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString) + ','
               + '       ECTRI=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString) + ','
               + '       ECAASS=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString) + ','
               + '       ECAASEM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString) + ','
               + '       ECAATRI=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString) + ','
               + '       EC_PROCE=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('EC_PROCE').AsString) + ','
               + '       EC_IE=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('EC_IE').AsString) + ','
               + '       ECUSER=' + quotedstr(DMTE.wUsuario)+','
               + '       ECFREG='+quotedStr(DateToStr(DateS))+','
               + '       FLUEID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('FLUEID').AsString) + ' '
               + ' Where CIAID=' + quotedstr(dblcCia.Text)
               + '   and ECANOMM=' + quotedstr(edtPeriodo.Text)
               + '   and TDIARID=' + quotedstr(dblcTDiario.Text)
               + '   and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
            Try
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('Error al intentar grabar la cabecera del Egreso');
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               Exit;
            End;
         End;


         //Inicio HPC_201401_CAJA
         //Actualiza el flag de rendido y la llave de referencia
         xSQL :=  'Update CAJA302 '
                + '   set KEYVALE=' + quotedstr(TRIM(dblcCia.Text)+TRIM(dblcTDiario.Text)+TRIM(edtPeriodo.Text)+TRIM(dbeNoComp.Text))+','
                + '       FLGREN =''S'' '
                + ' Where CIAID    =' + QuotedStr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString)
                + '   And ECANOMM  =' + QuotedStr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString)
                + '   And TDIARID  =' + QuotedStr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('TDIARID').AsString)
                + '   And ECNOCOMP =' + QuotedStr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECNOCOMP').AsString);
         Try
             DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
           screen.Cursor := crDefault;
           ShowMessage('Error al intentar actualizar KEYREN  en el VALE');
           DMTE.DCOM1.AppServer.RetornaTransaccion;
           Exit;
         End;
         //Final HPC_201401_CAJA

         DMTE.wModo := 'M';

         DMTE.cdsRegCxP.DisableControls;
         DMTE.cdsRegCxP.First;
         While Not DMTE.cdsRegCxP.Eof Do
         Begin
            DMTE.cdsRegCxP.Edit;
            DMTE.cdsRegCxP.FieldByName('DEHREG').AsDateTime := DateS + Time;
            DMTE.cdsRegCxP.Post;
            DMTE.cdsRegCxP.Next;
         End;
         DMTE.cdsRegCxP.EnableControls;

         If DMTE.cdsRegCxP.ApplyUpdates(0) > 0 Then
         Begin
         // borra registros físicos del detalle
            xSQL := 'delete from CAJA301 '
               + ' Where CIAID=' + quotedstr(dblcCia.Text)
               + '   and ECANOMM=' + quotedstr(edtPeriodo.Text)
               + '   and TDIARID=' + quotedstr(dblcTDiario.Text)
               + '   and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
            Try
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('Error al intentar inicializar la grabación del detalle del Egreso');
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               Exit;
            End;
         // inserta en base a detalle del clientdataset
            DMTE.cdsRegCxP.DisableControls;
            DMTE.cdsRegCxP.First;
            While Not DMTE.cdsRegCxP.Eof Do
            Begin
               xSQL := 'Insert into CAJA301(CIAID, KEYVALE, TDIARID, ECANOMM, ECNOCOMP, DOCID2, DOCMOD, CPTOID, TDIARID2, '
                  + '                    CUENTAID, CLAUXID, PROV, TMONID, DEMTOORI, CPNODOC, DETCPAG, DEFCOMP, '
                  + '                    CPFEMIS, CPFVCMTO, CPANOMM, DEDH, DETCDOC, CPSERIE, CPNOREG, DEGLOSA, '
                  + '                    DEMTOLOC, DEMTOEXT, CCOSID, DEHREG, DEANO, DEMM, DEDD, DESS, DESEM, '
                  + '                    DETRI, DEAASS, DEAASEM, DEAATRI) '
                  + 'Values ('
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('CIAID').AsString) + ','
                  //Inicio HPC_201401_CAJA
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('KEYVALE').AsString) + ','   
                  //Inicio HPC_201401_CAJA
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('TDIARID').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('ECANOMM').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('DOCID2').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('DOCMOD').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('CPTOID').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('TDIARID2').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('PROV').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('TMONID').AsString) + ','
                  + floattostr(DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString) + ','
                  + floattostr(DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat) + ','
                  + quotedstr(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime)) + ','
                  + quotedstr(datetostr(DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime)) + ','
                  + quotedstr(datetostr(DMTE.cdsRegCxP.FieldByName('CPFVCMTO').AsDateTime)) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('CPANOMM').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('DEDH').AsString) + ','
                  + floattostr(DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('CPNOREG').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString) + ','
                  + floattostr(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat) + ','
                  + floattostr(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('CCOSID').AsString) + ','
                  + 'sysdate, '
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('DEANO').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('DEMM').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('DEDD').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('DESS').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('DESEM').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('DETRI').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('DEAASS').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('DEAASEM').AsString) + ','
                  + quotedstr(DMTE.cdsRegCxP.FieldByName('DEAATRI').AsString)
                  + '        )';
               Try
                  DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
               Except
                  ShowMessage('Error al intentar adicionar el detalle del Egreso');
                  DMTE.DCOM1.AppServer.RetornaTransaccion;
                  Exit;
               End;
               DMTE.cdsRegCxP.Next;
            End;
            DMTE.cdsRegCxP.EnableControls;
         End;
         DMTE.DCOM1.AppServer.GrabaTransaccion;

         screen.Cursor := crDefault;
         ShowMessage('Grabacion OK');

         z2bbtnCancelado.Enabled := True;
         z2bbtnAnula.Enabled := True;
         z2bbtnImprime.Enabled := True;
         lblEstado.Caption := 'Activo             ';
         wModifica := False;
      End
   End
   Else
   Begin
      ShowMessage('El ESTADO del Egreso No es INICIAL, no se puede grabar');
   End;
End;

Procedure TFRendicionCaja.z2bbtnCanceladoClick(Sender: TObject);
Var
   xConsis: Boolean;
   cPgoLoc, cPgoExt, cPgoOri: Double;
   xSuma, cSalLoc, cSalExt, cSalOri, cVuelto: Double;
   cNodoc: String;
   sFecha, sSQL, xSQL: String;
   xRetencion: Boolean;
Begin
   xSuma := 0;
   If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'I' Then
   Begin
      If wModifica Then
      Begin
         ShowMessage('Debe Grabar primero las actualizaciones realizadas');
         Exit;
      End;

      If (DMTE.cdsRegCxP.RecordCount < 1) Then
      Begin
         ShowMessage('No se puede Realizar la Cancelación si no tiene Detalles');
         exit;
      End;

      If DMTE.cdsLiq305.FieldByName('ECMTOORI').AsFloat <> DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat Then
      Begin
         ShowMessage('El monto a rendir debe ser : ' + DMTE.cdsLiq305.FieldByName('ECMTOORI').AsString);
         Exit;
      End;

      DMTE.cdsRegCxP.DisableControls;
      ConsisCancela(xConsis);
      DMTE.cdsRegCxP.EnableControls;
      If Not xConsis Then
         ShowMessage('No se puede Cancelar el Comprobante')
      Else
      Begin
         If MessageDlg('¿Efectuar la Cancelación del Comprobante?', mtConfirmation,
            [mbYes, mbNo], 0) = mrYes Then
         Begin
            screen.Cursor := crHourGlass;

            xSigueGrab := True;

            ErrorCount := 0;
            DMTE.DCOM1.AppServer.IniciaTransaccion;
           /////////////////////////////////
           //  Calcula Retencion del IGV  //
           /////////////////////////////////
           /////////////////////////////////

            dbeImporte.Text := DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString;

            DMTE.cdsEgrCaja.Edit;
            DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString := DMTE.wUsuario; // usuario que registra
            DMTE.cdsEgrCaja.FieldByName('ECFREG').AsDateTime := DateS; // fecha que registra Usuario

            If DMTE.SRV_D = 'ORACLE' Then
               DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := DateS + Time // Hora de Registro de Usuario
            Else
               DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time; // Hora de Registro de Usuario

            DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'C';

            If xRetencion Then
               DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString := 'S'
            Else
               DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString := 'N';

            cVuelto := 0;
            cSalLoc := 0;
            cSalExt := 0;
            cSalOri := 0;
            DMTE.cdsRegCxP.DisableControls;
            DMTE.cdsRegCxP.First;

            While Not DMTE.cdsRegCxP.Eof Do
            Begin
               If DMTE.cdsRegCxP.FieldByName('DEDH').AsString = 'D' Then
               Begin
                  xSuma := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
                  If DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString = sCuentaCajaChica Then
                     cVuelto := cVuelto + DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
               End;
               DMTE.cdsRegCxP.next;
            End;

            cNoDoc := dbeNoDoc.TEXT;

            If DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
            Begin
               cPgoLoc := StrToFloat(dbeImporte.Text);
               cPgoExt := (DMTE.FRound(cPgoLoc / DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat, 15, 2));
            End
            Else
            Begin
               cPgoExt := StrToFloat(dbeImporte.Text);
               cPgoLoc := (DMTE.FRound(cPgoExt * DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat, 15, 2));
            End;

            ActualizaSaldosTGE401(cPgoOri, cPgoLoc, cPgoExt, '-');

            If Not xSigueGrab Then
            Begin
               screen.Cursor := crDefault;
               ShowMessage('Error al intentar grabar la cabecera del Egreso');
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               Exit;
            End;

            DMTE.cdsRegCxP.EnableControls;

            If DMTE.cdsEgrCaja.modified Then
               DMTE.cdsEgrCaja.Post;

            xSQL := 'Update CAJA302 '
                  + '   set ECUSER=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString) + ','
                  + '       ECFREG=trunc(sysdate),'
                  + '       ECHREG=sysdate, '
                  + '       ECESTADO=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString) + ','
                  + '       CAJARETIGV=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString)
                  + ' Where CIAID =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
                  + '   And ECANOMM =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
                  + '   And TDIARID =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
                  + '   And ECNOCOMP =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
            Try
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               screen.Cursor := crDefault;
               ShowMessage('Error al intentar grabar la cabecera del Egreso');
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               Exit;
            End;

  
            z2bbtnSumatClick(Sender);

            If wBcoTipCta = 'C' Then
            Begin
               DMTE.ActSaldosCaja(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, DMTE.cdsEgrCaja.FieldByName('TMONID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
                  FLOATTOSTR(cVuelto), 'I', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
            End
            Else
            Begin
               DMTE.ActSaldosBancos(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, DMTE.cdsEgrCaja.FieldByName('TMONID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString, DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString,
                  'E', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
            End;


            If Not xSigueGrab Then
            Begin
               screen.Cursor := crDefault;
               ShowMessage('Error al intentar grabar la cabecera del Egreso - Arch.Saldos');
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               Exit;
            End;

            DMTE.DCOM1.AppServer.GrabaTransaccion;

            dbgDetPagoIButton.Enabled := False;
            z2bbtnSumat.Enabled := False;
            z2bbtnCont.Enabled := True;
            z2bbtnAnula.Enabled := True;
            z2bbtnSube.Enabled := False;
            z2bbtnGraba.Enabled := False;
            z2bbtnCancelado.Enabled := False;
            z2bbtnCancel2.Enabled := False;
            lblEstado.Caption := 'Cancelado          ';
            Screen.Cursor := crDefault;
            Beep;
            MessageDlg('Datos Actualizados', mtCustom, [mbOk], 0);
         End;
      End;
   End //quitar
   Else
   Begin
      ShowMessage('Imposible Cancelar');
   End;
End;

Function TFRendicionCaja.ValidaCampo: Boolean;
// aqui adicionar el codigo para validar que no se ingrese un codigo repetido
Var
   xWhere, aux: String;
Begin
   Result := True;
   With DMTE Do
   Begin

      If Length(cdsRegCxP.FieldByName('CPNOREG').AsString) = 0 Then
      Begin //No Registro
         ShowMessage('Falta No Registro');
         Result := False;
         exit;
      End
      Else
      Begin
         If Length(cdsRegCxP.FieldByName('CPNOREG').AsString) < 6 Then
         Begin
            ShowMessage('Codigo de Registro Errado');
            Result := False;
            exit;
         End;
      End;

      If Length(cdsRegCxP.FieldByName('TDIARID2').AsString) = 0 Then
      Begin //Tipo de Diario
         ShowMessage('Falta Tipo de Diario');
         Result := False;
         exit;
      End
      Else
      Begin
         xWhere := 'TDIARID=' + '''' + cdsRegCxP.FieldByName('TDIARID2').AsString + '''';
         aux := DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', xWhere, 'TDIARDES');
         If Length(aux) = 0 Then
         Begin
            ShowMessage('Codigo de Tipo de Diario Errado');
            Result := False;
            exit;
         End;
      End;

      If Length(cdsRegCxP.FieldByName('DOCID2').AsString) = 0 Then
      Begin //Tipo de Documento
         ShowMessage('Falta Tipo de Documento');
         Result := False;
         exit;
      End
      Else
      Begin
         xWhere := 'DOCID=' + '''' + cdsRegCxP.FieldByName('DOCID2').AsString + '''';
         aux := DisplayDescrip('prvTGE', 'TGE110', 'DOCDES', xWhere, 'DOCDES');
         If Length(aux) = 0 Then
         Begin
            ShowMessage('Codigo de Tipo de Documento Errado');
            Result := False;
            exit;
         End;
      End;

      If cdsRegCxP.FieldByName('CPSERIE').AsString = '' Then
      Begin //Serie
         ShowMessage('Falta Serie');
         Result := False;
         exit;
      End;

      If cdsRegCxP.FieldByName('CPNODOC').AsString = '' Then
      Begin //No Documento
         ShowMessage('Falta Nro. de Documento');
         Result := False;
         exit;
      End;

      If Length(cdsRegCxP.FieldByName('TMONID').AsString) = 0 Then
      Begin //Tipo de Moneda
         ShowMessage('Falta Tipo de Moneda');
         Result := False;
         exit;
      End
      Else
      Begin
         xWhere := 'TMONID=' + '''' + cdsRegCxP.FieldByName('TMONID').AsString + '''';
         aux := DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
         If Length(aux) = 0 Then
         Begin
            ShowMessage('Codigo de Tipo de Moneda Errado');
            Result := False;
            exit;
         End;
      End;

      If cdsRegCxP.FieldByName('DETCDOC').AsFloat <= 0 Then
      Begin // Tipo de Cambio Detalle
         ShowMessage('Tipo de Cambio debe ser mayor que cero');
         Result := False;
         exit;
      End;

      If cdsRegCxP.FieldByName('DEMTOORI').AsFloat <= 0 Then
      Begin //Importe
         ShowMessage('Importe debe ser mayor que cero');
         Result := False;
         exit;
      End;

      If cdsRegCxP.FieldByName('CPTOID').AsString = '' Then
      Begin //Concepto
         ShowMessage('Falta Concepto');
         Result := False;
         exit;
      End
      Else
      Begin // Cuenta
         aux := cdsRegCxP.FieldByName('CUENTAID').AsString;
         If Length(aux) = 0 Then
         Begin
            ShowMessage('Codigo de Concepto Errado');
            Result := False;
            exit;
         End;
      End;

      If Length(cdsRegCxP.FieldByName('DEDH').AsString) = 0 Then
      Begin
         ShowMessage('Falta especificar Debe / Haber');
         Result := False;
         exit;
      End;

      If cdsRegCxP.FieldByName('CPFVCMTO').AsDateTime < cdsRegCxP.FieldByName('CPFEMIS').AsDateTime Then
      Begin //Fecha de Vencimiento
         ShowMessage('Fecha de Vencimiento debe ser posterior a la Fecha de Emision');
         Result := False;
         exit;
      End;
//Inicio HPC_201701_CAJA Nueva validación para la fecha de emisión
//Nueva Validación de Fecha de Emisión
      If cdsRegCxP.FieldByName('CPFEMIS').AsDateTime > dbdtpFComp.Date Then
      Begin //Fecha de Emisión
         ShowMessage('Fecha de Emisión debe ser menor o igual a la Fecha de Comprobante: ' + FormatDateTime(DMTE.wFormatFecha, dbdtpFComp.Date));
         Result := False;
         exit;
      End;
//Fin HPC_201701_CAJA
   // Validación de centro de costo y auxiliares
      If (dblcdCCosto.Enabled) Then
      Begin //Centro de Costo
         If (Length(cdsRegCxP.FieldByName('CCOSID').AsString) = 0) Then
         Begin
            ShowMessage('Falta Centro de Costo');
            Result := False;
            exit;
         End
         Else
         Begin
            xWhere := 'CCOSID=' + '''' + cdsRegCxP.FieldByName('CCOSID').AsString + ''' and NVL(CCOSACT,''N'')=''S''';
            aux := DisplayDescrip('prvTGE', 'TGE203', 'CCOSDES', xWhere, 'CCosDes');
            If Length(aux) = 0 Then
            Begin
               ShowMessage('Centro de Costo NO ESTA ACTIVO. Revisar');
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

//fin de validaciones
      xWhere := 'FECHA= ' + DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha, cdsRegCxP.FieldByName('DEFCOMP').ASDateTime) + ''')';
      aux := DMTE.DisplayDescrip('prvTGE', 'TGE114', '*', xWhere, 'FECANO');
      cdsRegCxP.FieldByName('DEANO').AsString := cdsqry.FieldByName('FECANO').AsString;
      cdsRegCxP.FieldByName('DEMM').AsString := cdsqry.FieldByName('FECMES').AsString;
      cdsRegCxP.FieldByName('DEDD').AsString := cdsqry.FieldByName('FECDIA').AsString;
      cdsRegCxP.FieldByName('DESS').AsString := cdsqry.FieldByName('FECSS').AsString;
      cdsRegCxP.FieldByName('DESEM').AsString := cdsqry.FieldByName('FECSEM').AsString;
      cdsRegCxP.FieldByName('DETRI').AsString := cdsqry.FieldByName('FECTRIM').AsString;
      cdsRegCxP.FieldByName('DEAASS').AsString := cdsqry.FieldByName('FECAASS').AsString;
      cdsRegCxP.FieldByName('DEAASEM').AsString := cdsqry.FieldByName('FECAASEM').AsString;
      cdsRegCxP.FieldByName('DEAATRI').AsString := cdsqry.FieldByName('FECAATRI').AsString;
   End;
End;

Procedure TFRendicionCaja.ConsisCancela(Var xConsis: boolean);
Var
   xRegAct: TBookMark;
   xSumImp, Suma: Currency;
Begin
   xConsis := True;
   xSumImp := 0;
   With DMTE Do
   Begin
      xRegAct := cdsRegCxP.GetBookmark;
      cdsRegCxP.First;
      While Not cdsRegCxP.Eof Do
      Begin
         If cdsRegCxP.FieldByName('DEDH').AsString = 'D' Then
            If cdsEgrCaja.FieldByName('TMONID').AsString = wtMonLoc Then
               xSumImp := xSumImp + strtocurr(stringreplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText, ',', '', [rfReplaceAll]))
            Else
               xSumImp := xSumImp + strtocurr(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText, ',', '', [rfReplaceAll]))
         Else
            If cdsEgrCaja.FieldByName('TMONID').AsString = wtMonLoc Then
               xSumImp := xSumImp - strtocurr(stringreplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText, ',', '', [rfReplaceAll]))
            Else
               xSumImp := xSumImp - strtocurr(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText, ',', '', [rfReplaceAll]));

         cdsRegCxP.Next;
      End;
      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);

      If cdsEgrCaja.FieldByName('TMONID').AsString = wtMonLoc Then
         Suma := strtocurr(floattostrf(cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat, fffixed, 10, 2))
      Else
         Suma := strtocurr(floattostrf(cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat, fffixed, 10, 2));
   End;

   If xSumImp <> Suma Then
   Begin
      xConsis := False;
      If Suma > xSumImp Then
         ShowMessage('El Monto a Pagar es mayor que el Provisionado')
      Else
         ShowMessage('El Monto a Pagar es menor que el Provisionado');
   End;
End;

Procedure TFRendicionCaja.Contab_EgrCaja;
//Inicio HPC_201401_CAJA
var  xWhere:string;
//Final HPC_201401_CAJA
Begin
   DMTE.cdsCntCaja.FieldByName('CIAID').AsString := DMTE.cdsEgrcaja.FieldByName('CIAID').AsString;
   DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCID').AsString := DMTE.cdsEgrCaja.FieldByName('DOCID').AsString;

   DMTE.DisplayDescrip('prvTGE', 'TGE112', 'FCHQ,FCBCO', 'FPAGOID=' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString), 'FCHQ');
   //Inicio HPC_201701_CAJA Modificación en registro de DCSERIE, actualizar con valor '000'
   If ((DMTE.cdsQry.FieldByName('FCHQ').AsString = '1') Or (DMTE.cdsQry.FieldByName('FCHQ').AsString = 'S'))
      And (DMTE.cdsQry.FieldByName('FCBCO').AsString = 'S') Then
      DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString
   Else
   Begin
      DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString;
      DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString :='000';
   End;
   //Fin HPC_201701_CAJA
  //Inicio HPC_201401_CAJA
   xWhere := 'CIAID=''' + dblcCia.Text + ''' AND CUENTAID=''' + DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString + '''';
   DMTE.DisplayDescrip('prvTGE', 'TGE202', 'CUENTAID, CTA_CCOS, CTA_AUX', xWhere, 'CuentaId');
   If DMTE.cdsQry.FieldByName('CTA_AUX').asString = 'S' Then
   Begin
    DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := dblcClase.Text;
    DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := dblcdAux.Text;
   End;
   //Final HPC_201401_CAJA

   DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString;
   DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'H';
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DMTE.cdsCntCaja.FieldByName('TMONID').AsString := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.FRound(DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat - xRetLoc, 15, 2);
   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.FRound(DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat - xRetExt, 15, 2);
   If DMTE.cdsCntCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
   Begin
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat;
   End
   Else
   Begin
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat;
   End;

   DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCUSER').AsString := DMTE.wUsuario;
   DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime := DateS;
   If DMTE.SRV_D = 'ORACLE' Then
      DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime := DateS + Time
   Else
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

   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString;
   DMTE.cdsCntCaja.FieldByName('FCAB').AsString := '1';
   DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime;
   xNReg := xNReg + 1;
   DMTE.cdsCntCaja.FieldByName('NREG').AsInteger := xNReg;

End;

Procedure TFRendicionCaja.Contab_RegCxP;
Begin
   DMTE.cdsCntCaja.FieldByName('CIAID').AsString := DMTE.cdsRegCxP.FieldByName('CIAID').AsString;
   DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsRegCxP.FieldByName('TDIARID').AsString;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCID').AsString := DMTE.cdsRegCxP.FieldByName('DOCID2').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := DMTE.cdsRegCxP.FieldByName('DOCMOD').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString := DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString;
   DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsRegCxP.FieldByName('CPFVCMTO').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := DMTE.cdsRegCxP.FieldByName('CPTOID').AsString;
   DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString;

   DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
   DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := DMTE.cdsRegCxP.FieldByName('PROV').AsString; //Aqui se toma de la cabecera
   DMTE.cdsCntCaja.FieldByName('CCOSID').AsString := DMTE.cdsRegCxP.FieldByName('CCOSID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDH').AsString := DMTE.cdsRegCxP.FieldByName('DEDH').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
   DMTE.cdsCntCaja.FieldByName('TMONID').AsString := DMTE.cdsRegCxP.FieldByName('TMONID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;

   If DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString <> '' Then
      DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString
   Else
      DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString;

   If DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wtMonLoc Then
   Begin
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat, 15, 2);
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat, 15, 2);
   End
   Else
   Begin
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat, 15, 2);
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat, 15, 2);
   End;

   DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCUSER').AsString := DMTE.wUsuario;
   DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime := DateS;
   If DMTE.SRV_D = 'ORACLE' Then
      DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime := dateS + time
   Else
      DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime := time;
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
   DMTE.cdsCntCaja.FieldByName('NREG').AsInteger := xNReg;
End;

Procedure TFRendicionCaja.Contab_DifCambio;
Var
   xDif_Camb: real;
   xsql1, xSQL: String;
Begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO

   xSQL := 'TMONID=' + QuotedStr(dblcTMon.Text);
   xsql1 := 'TMONID=' + QuotedStr(DMTE.cdsRegCxP.FieldByName('TMONID').AsString);
   If (DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xSQL, 'TMON_LOC') <> 'L') Or
      (DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xsql1, 'TMON_LOC') <> 'L') Then
   Begin
      If DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat <> DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat Then
      Begin
         DMTE.cdsCntCaja.Insert;
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
         DMTE.cdsCntCaja.FieldByName('CIAID').AsString := DMTE.cdsRegCxP.FieldByName('CIAID').AsString;
         DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsRegCxP.FieldByName('TDIARID').AsString;
         DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsRegCxP.FieldByName('ECANOMM').AsString;
         DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
         DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
         DMTE.cdsCntCaja.FieldByName('DOCID').AsString := DMTE.cdsRegCxP.FieldByName('DOCID2').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString := DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString;
         DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString;
         DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
         DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('PROV').AsString; //Aqui se toma de la cabecera
         DMTE.cdsCntCaja.FieldByName('CCOSID').AsString := DMTE.cdsRegCxP.FieldByName('CCOSID').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
         DMTE.cdsCntCaja.FieldByName('DCUSER').AsString := DMTE.wUsuario;
         DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime := Date;
         If DMTE.SRV_D = 'ORACLE' Then
            DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime := date + Time
         Else
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
         DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
         xNReg := xNReg + 1;
         DMTE.cdsCntCaja.FieldByName('NREG').AsInteger := xNReg;

         DMTE.cdsCntCaja.FieldByName('TMONID').AsString := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
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
         End
         Else
         Begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := wCptoGan;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := wCtaGan;
         End;

      End;
   End;
End;

Procedure TFRendicionCaja.Contab_DifCambio2;
Var
   xSql1, xSql: String;
Begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   xSQL := 'TMONID=' + QuotedStr(dblcTMon.Text);
   xsql1 := 'TMONID=' + QuotedStr(DMTE.cdsRegCxP.FieldByName('TMONID').AsString);
   If (DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xSQL, 'TMON_LOC') <> 'L') Or
      (DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMON_LOC', xsql1, 'TMON_LOC') <> 'L') Then
   Begin
      If DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat <> DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat Then
      Begin
         DMTE.cdsCntCaja.Insert;
         DMTE.cdsCntCaja.FieldByName('CIAID').AsString := DMTE.cdsRegCxP.FieldByName('CIAID').AsString;
         DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsRegCxP.FieldByName('TDIARID').AsString;
         DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsRegCxP.FieldByName('ECANOMM').AsString;
         DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
         DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
         DMTE.cdsCntCaja.FieldByName('DOCID').AsString := DMTE.cdsRegCxP.FieldByName('DOCID2').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString := DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString;
         DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString;
         DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
         DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('PROV').AsString; //Aqui se toma de la cabecera
         DMTE.cdsCntCaja.FieldByName('CCOSID').AsString := DMTE.cdsRegCxP.FieldByName('CCOSID').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
         DMTE.cdsCntCaja.FieldByName('DCUSER').AsString := DMTE.wUsuario;
         DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime := Date;
         If DMTE.SRV_D = 'ORACLE' Then
            DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime := Date + Time
         Else
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
         DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
         DMTE.cdsCntCaja.FieldByName('TMONID').AsString := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
         xNReg := xNReg + 1;
         DMTE.cdsCntCaja.FieldByName('NREG').AsInteger := xNReg;

         If DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wtMonExt Then
         Begin //Provision en Ext.
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
            DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'H';
            DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := wCptoGan;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := wCtaGan;
         End;

         DMTE.cdsCntCaja.Insert;
         DMTE.cdsCntCaja.FieldByName('CIAID').AsString := DMTE.cdsRegCxP.FieldByName('CIAID').AsString;
         DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsRegCxP.FieldByName('TDIARID').AsString;
         DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsRegCxP.FieldByName('ECANOMM').AsString;
         DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
         DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
         DMTE.cdsCntCaja.FieldByName('DOCID').AsString := DMTE.cdsRegCxP.FieldByName('DOCID2').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString := DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString;
         DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString;
         DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
         DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('PROV').AsString; //Aqui se toma de la cabecera
         DMTE.cdsCntCaja.FieldByName('CCOSID').AsString := DMTE.cdsRegCxP.FieldByName('CCOSID').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
         DMTE.cdsCntCaja.FieldByName('DCUSER').AsString := DMTE.wUsuario;
         DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime := Date;
         If DMTE.SRV_D = 'ORACLE' Then
            DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime := date + Time
         Else
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
         DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
         DMTE.cdsCntCaja.FieldByName('TMONID').AsString := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
         xNReg := xNReg + 1;
         DMTE.cdsCntCaja.FieldByName('NREG').AsInteger := xNReg;

         If DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wtMonExt Then
         Begin //Provision en Ext.
            DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
            DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'D';
            DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := wCptoPer;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := wCtaPer;
         End;

         If DMTE.cdsCntCaja.FieldByName('DCDH').AsString = 'D' Then
         Begin
            If DMTE.cdsCntCaja.FieldByName('TMONID').AsString = DMTE.wtMonLoc Then
               DMTE.cdsCntCaja.FieldByName('DEBE').AsFloat := DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat
            Else
               DMTE.cdsCntCaja.FieldByName('DEBE').AsFloat := DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat;
         End
         Else
         Begin
            If DMTE.cdsCntCaja.FieldByName('TMONID').AsString = DMTE.wtMonLoc Then
               DMTE.cdsCntCaja.FieldByName('HABER').AsFloat := DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat
            Else
               DMTE.cdsCntCaja.FieldByName('HABER').AsFloat := DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat;
         End;
      End;
   End;
End;

Procedure TFRendicionCaja.Contabiliza;
Var
   xRegAct: TBookMark;
   xSQL: String;
Begin
   xSQL := 'DELETE FROM CAJA304 '
      + ' WHERE CIAID=' + QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString) + ' AND '
      + '       ECANOMM=' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND '
      + '       TDIARID=' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND '
      + '       ECNOCOMP=' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   // Se pone try-except para que ignore el delete si no hay data en la borrada
   End;

// GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera
   xSQL := 'Select * '
      + '  from CAJA304 '
      + ' Where CIAID='''' and ECANOMM='''' and TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsCNTCaja.Close;
   DMTE.cdsCNTCaja.DataRequest(xSQL);
   DMTE.cdsCNTCaja.Open;
   //
   z2bbtnSumatClick(Nil);
   xNReg := 0;
   DMTE.cdsRegCxP.DisableControls;
   xRegAct := DMTE.cdsRegCxP.GetBookmark;

// GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde el Detalle
   DMTE.cdsRegCxP.First;
   While Not DMTE.cdsRegCxP.Eof Do
   Begin
      DMTE.cdsCntCaja.Insert;
      Contab_RegCxP;
      If DMTE.wTipoDif = '' Then
         Contab_DifCambio
      Else
      Begin
         If DMTE.cdsRegCxP.FieldByname('TMONID').AsString = DMTE.wTMonExt Then
            Contab_DifCambio2;
      End;
      DMTE.cdsRegCxP.Next;
   End;
   DMTE.cdsRegCxP.GotoBookmark(xRegAct);
   DMTE.cdsRegCxP.FreeBookmark(xRegAct);
   DMTE.cdsRegCxP.EnableControls;

   DMTE.cdsCntCaja.Insert;
   Contab_EgrCaja;
   If (xRetLoc > 0) Or (xRetExt > 0) Then
   Begin
      DMTE.cdsCntCaja.Insert;
      Contab_DocPago_RETENCION_HABER;
   End;

   //GENERA MONTO

   // Cuadra Asiento por Redondeos

   xDebeT := 0;
   xHabeT := 0;
   xDebeTD := 0;
   xHabeTD := 0;
   DMTE.cdsCntCaja.First;
   While Not DMTE.cdsCntCaja.Eof Do
   Begin
      If DMTE.cdsCntCaja.FieldByname('DCDH').AsString = 'D' Then
         If DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat <> null Then
         Begin
            xDebeT := xDebeT + DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat, 15, 2);
            xDebeTD := xDebeTD + DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOEXT').AsFloat, 15, 2);
         End
         Else
         Begin
            xDebeT := xDebeT
         End
      Else
      Begin
         If DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat <> null Then
         Begin
            xHabeT := xHabeT + DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOLO').AsFloat, 15, 2);
            xHabeTD := xHabeTD + DMTE.FRound(DMTE.cdsCntCaja.FieldByname('DCMTOEXT').AsFloat, 15, 2);
         End
         Else
         Begin
            xHabeT := xHabeT;
         End;
      End;
      DMTE.cdsCntCaja.Next;
   End;

   If (DMTE.FRound(xDebeT, 15, 2) <> DMTE.FRound(xHabeT, 15, 2)) Then
   Begin
      AsientoDifTotal;
   End;

   If DMTE.cdsCntCaja.ApplyUpdates(0) > 0 Then
   Begin
      DMTE.cdsCntCaja.DisableControls;
      DMTE.cdsCntCaja.First;
      While Not DMTE.cdsCntCaja.EOF Do
      Begin
         xSQL := 'Insert into CAJA304(CIAID, TDIARID, ECANOMM, ECNOCOMP, DCLOTE, DOCID, DCSERIE, DCNODOC, DCFEMIS, DCFVCMTO, '
            + '                    CPTOID, CUENTAID, CLAUXID, DCAUXID, CCOSID, DCDH, DCTCAMPR, DCTCAMPA, TMONID, DCMTOORI, '
            + '                    DCMTOLO, DCMTOEXT, DCFLACDR, DCUSER, DCFREG, DCHREG, '
            + '                    DCANO, DCMM, DCDD, DCSS, DCSEM, DCTRI, DCAASS, DCAASEM, DCAATRI, '
            + '                    ECFCOMP, DCGLOSA, FCAB, DOCMOD, NREG, CNTCOMPROB) '
            + 'values ('
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CIAID').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TDIARID').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCID').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString) + ','
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime)) + ','
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime)) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CPTOID').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CCOSID').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDH').AsString) + ','
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat) + ','
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('TMONID').AsString) + ','
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat) + ','
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat) + ','
            + floattostr(DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCUSER').AsString) + ','
            + 'trunc(sysdate), '
            + 'sysdate, '
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCANO').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCMM').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCDD').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSS').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCSEM').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCTRI').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASS').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString) + ','
            + quotedstr(datetostr(DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime)) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('FCAB').AsString) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString) + ','
            + inttostr(DMTE.cdsCntCaja.FieldByName('NREG').AsInteger) + ','
            + quotedstr(DMTE.cdsCntCaja.FieldByName('CNTCOMPROB').AsString)
            + ')';
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            Screen.Cursor := crDefault;
            ShowMessage('Error al intentar grabar el archivo pre-contable');
            xSigueGrab := False;
            Exit;
         End;
         DMTE.cdsCntCaja.Next;
      End;
      DMTE.cdsCntCaja.EnableControls;
   End;
End;

Procedure TFRendicionCaja.AsientoDifTotal;
Begin
// GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   DMTE.cdsCntCaja.Insert;
   DMTE.cdsCntCaja.FieldByName('CIAID').AsString := DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
   DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;

   DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S'; //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCUSER').AsString := DMTE.wUsuario;
   DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime := Date;
   If DMTE.SRV_D = 'ORACLE' Then
      DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime := date + time
   Else
      DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime := Time;
   DMTE.cdsCntCaja.FieldByName('TMONID').AsString := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
   xNReg := xNReg + 1;
   DMTE.cdsCntCaja.FieldByName('NREG').AsInteger := xNReg;

   If (DMTE.FRound(xDebeT, 15, 2) <> DMTE.FRound(xHabeT, 15, 2)) Then
   Begin
      If xDebeT > xHabeT Then
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := abs(DMTE.FRound(xDebeT - xHabeT, 15, 2));
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := 0;
         DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'H';
         DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := wCptoGan;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := wCtaGan;
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
      End
      Else
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := abs(DMTE.FRound(xHabeT - xDebeT, 15, 2));
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := 0;
         DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'D';
         DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := wCptoPer;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := wCtaPer;
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
      End;
   End;

   If (DMTE.FRound(xDebeTD, 15, 2) <> DMTE.FRound(xHabeTD, 15, 2)) Then
   Begin
      If xDebeTD > xHabeTD Then
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := 0;
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := abs(DMTE.FRound(xDebeTD - xHabeTD, 15, 2));
         DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'H';
         DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := wCptoGan;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := wCtaGan;
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
      End
      Else
      Begin
         DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := 0;
         DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := abs(DMTE.FRound(xHabeTD - xDebeTD, 15, 2));
         DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'D';
         DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := wCptoPer;
         DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := wCtaPer;
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := 'Diferencia de Cambio';
      End;
   End;
End;

Procedure TFRendicionCaja.z2bbtnContClick(Sender: TObject);
Var
   xSql: String;
Begin

   If DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString = 'C' Then
   Begin
      If DMTE.cdsEgrCaja.FieldByName('FEXTCHQ').AsString = '1' Then
      Begin
         ShowMessage('No Puede Contabilizar este Movimiento ' + #13
            + 'Pues se encuentra extornado');
         Exit;
      End;

      If DMTE.MesCerrado(copy(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString, 5, 2),
         copy(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString, 1, 4),
         DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) Then
      Begin
         ShowMessage(' Mes cerrado, no se puede contabilizar');
         exit;
      End;

      If MessageDlg('¿Contabilizar y Generar Asientos Automaticos?', mtConfirmation,
         [mbYes, mbNo], 0) = mrYes Then
      Begin
         Screen.Cursor := crHourglass;

         z2bbtnGraba.Enabled := False;
         z2bbtnCancelado.Enabled := False;
         z2bbtnCont.Enabled := False;
         z2bbtnAnula.Enabled := False;

         RecCptosDifC;

         xSigueGrab := True;
         DMTE.DCOM1.AppServer.IniciaTransaccion;
         Contabiliza; // Realiza la generacion del Asiento
         If Not xSigueGrab Then
         Begin
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         ActualizaCNT311(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
            DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString);
         If Not xSigueGrab Then
         Begin
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         If SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
            DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
            DMTE.SRV_D, 'CCNA', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
            DMTE.cdsResultSet, DMTE.DCOM1, Self) Then
         Begin
            DMTE.cdsEgrCaja.Edit;
            DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString := 'S'; //Establece como Contabilizado el flag
            DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'C';
            DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString := DMTE.wUsuario;
            DMTE.cdsEgrCaja.FieldByName('ECFREG').AsDateTime := DateS;
            If DMTE.SRV_D = 'ORACLE' Then
               DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := DateS + Time
            Else
               DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time;
            If Copy(xRegAdicional, 1, 2) = '1.' Then
               DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString := xRegAdicional;

            xSQL := 'update CAJA302 '
                  + '   set ECCONTA=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString) + ','
                  + '       ECESTADO=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString) + ','
                  + '       ECUSER=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString) + ','
                  + '       ECFREG=trunc(sysdate),'
                  + '       ECHREG=sysdate, '
                  + '       ECPERREC=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString)
                  + ' Where CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
                  + '   and ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
                  + '   and TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
                  + '   and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
            Try
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('Error al intentar actualizar el flag contable en la cabecera del Egreso');
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               Exit;
            End;

         // Para Grabar Registros Adicionales
            If Copy(xRegAdicional, 1, 2) = '1.' Then
               DMTE.AsientosAdicionales(xRegAdicional);
            If Not xSigueGrab Then
            Begin
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               exit;
            End;
         End
         Else
         Begin
            Showmessage('Error al Mayorizar la contabilización');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            Exit;
         End;
         lblEstado.Caption := 'Cancelado y Contab.';
         Screen.Cursor := crDefault;

         fg_ContabFilial(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
            DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
         If Not xSigueGrab Then
         Begin
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
         DMTE.DCOM1.AppServer.GrabaTransaccion;
      End;
   End
   Else
   Begin
      ShowMessage('Imposible Contabilizar');
   End;
End;

Procedure TFRendicionCaja.z2bbtnAnulaClick(Sender: TObject);
Var
   xSQL, Xsu: String;
   cVuelto: Double;
Begin
   dbeRepo.text := '';

   If wBcoTipCta = 'C' Then
   Begin
      If DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString <> Datetostr(date) Then
      Begin
        ShowMessage('Solo se pueden Anular Movimientos de Caja del mismo dia de creación');
        Exit;
      End;
   End;

   If MessageDlg('¿Anular Comprobante?', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes Then
   Begin

      DMTE.cdsEgrCaja.CancelUpdates;
      DMTE.cdsRegCxP.CancelUpdates;

      xSigueGrab := True;
      ErrorCount := 0;
      DMTE.DCOM1.AppServer.IniciaTransaccion;

      If DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString = 'C' Then
      Begin
         ActualizaSaldosTGE401(0, DMTE.cdsEgrCaja.FieldByname('ECMTOLOC').AsFloat, DMTE.cdsEgrCaja.FieldByname('ECMTOEXT').AsFloat, '+');

         DMTE.cdsRegCxP.First;

         While Not DMTE.cdsRegCxP.Eof Do
         Begin
            If DMTE.cdsRegCxP.FieldByName('DEDH').AsString = 'D' Then
            Begin
               If DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString = sCuentaCajaChica Then
                  cVuelto := cVuelto + DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
            End;
            DMTE.cdsRegCxP.next;
         End;

         If wBcoTipCta = 'C' Then
         Begin
            DMTE.ActSaldosCaja(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, DMTE.cdsEgrCaja.FieldByName('TMONID').AsString,
               DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
               FLOATTOSTR(cVuelto), 'AI', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
         End
         Else
         Begin
            DMTE.ActSaldosBancos(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString, DMTE.cdsEgrCaja.FieldByName('TMONID').AsString,
               DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString,
               DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString, DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString,
               'I', DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
         End;
      End;

      If Not xSigueGrab Then
      Begin
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;

      DMTE.cdsEgrCaja.Edit;
      DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString := DMTE.wUsuario; // usuario que registra
      DMTE.cdsEgrCaja.FieldByName('ECFREG').AsDateTime := DateS; // fecha que registra Usuario
      If DMTE.SRV_D = 'ORACLE' Then
         DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := dateS + time // Hora de Registro de Usuario
      Else
         DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time; // Hora de Registro de Usuario
      DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'A';

      DMTE.cdsEgrCaja.Post;
      xSQL := 'update CAJA302 '
         + '   set ECUSER=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString) + ','
         + '       ECFREG=trunc(sysdate),'
         + '       ECHREG=sysdate, '
         + '       ECESTADO=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString)
         + ' Where CIAID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
         + '   and ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
         + '   and TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
         + '   and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al intentar actualizar el flag de ANULADO en la cabecera del Egreso (CAJA302)');
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;


      xSQL:= 'Update CAJA301 '
            +' SET DEESTADO=''A'' '
            +'Where CIAID='+ quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
            +' and  ECANOMM='+ quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
            +' and  TDIARID='+ quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
            +' and  ECNOCOMP='+quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
            +' and  DEFCOMP='+quotedstr(DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString);
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al intentar actualizar el flag de ANULADO en el detalle del Egreso (CAJA301)');
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;


      If DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString = 'S' Then
      Begin
         DMTE.AnulaRetencion;
         If Not xSigueGrab Then
         Begin
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      End;

      DMTE.DCOM1.AppServer.GrabaTransaccion;

      dbgDetPagoIButton.Enabled := False;
      z2bbtnSumat.Enabled := False;

      z2bbtnCont.Enabled := False;
      z2bbtnSube.Enabled := False;
      z2bbtnGraba.Enabled := False;
      z2bbtnCancelado.Enabled := False;
      z2bbtnCancel2.Enabled := False;
      z2bbtnAnula.Enabled := False;
      lblEstado.Caption := 'Anulado            ';
      xVoucher := '';
   End;
End;

Procedure TFRendicionCaja.ActPnlBotones;
Begin
   z2bbtnSumat.Enabled := wbSumat;
   z2bbtnCont.Enabled := wbCont;

   z2bbtnImprime.Enabled := wbImprime;
   z2bbtnSube.Enabled := wbSube;
   z2bbtnGraba.Enabled := wbGraba;
   z2bbtnCancelado.Enabled := wbCancelado;
   z2bbtnCancel2.Enabled := wbCancel2;
   z2bbtnAnula.Enabled := wbAnula;
End;

Procedure TFRendicionCaja.FormClose(Sender: TObject; Var Action: TCloseAction);
Var
   xSQL: String;
Begin

   If pnlActualiza.Visible Then
   Begin
      pnlActualiza.Enabled := True;
      z2bbtnCancel3.SetFocus;
      z2bbtnCancel3Click(Nil);
   End;

   // Limpiamos los filtros
   DMTE.cdsRegCxP.Filtered := False;
   DMTE.cdsCCBco.Filtered := False;
   cf1.QuitarExits(FRendicionCaja);
   DMTE.cdsTrans.IndexFieldNames := '';
   DMTE.cdsTrans.Filter := '';
   DMTE.cdsTrans.Filtered := False;

   If DMTE.cdsEgrCaja.active Then
      DMTE.cdsEgrCaja.CancelUpdates;
   If DMTE.cdsRegCxP.active Then
      DMTE.cdsRegCxP.CancelUpdates;
   edtCuenta.Enabled := False;

   If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'X' Then
   Begin
      DMTE.cdsEgrCaja.Delete;
      xSQL := 'delete from CAJA302 '
         + ' where CIAID=' + quotedstr(dblcCia.Text)
         + '   and ECANOMM=' + quotedstr(edtPeriodo.Text)
         + '   and TDIARID=' + quotedstr(dblcTDiario.Text)
         + '   and ECNOCOMP=' + quotedstr(dbeNoComp.Text);
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
      End;
   End;

   Try
      FRegistro.xFiltroEgr.FMant.cds2.Data := DMTE.cdsEgrCaja.Data;
      FRegistro.xFiltroEgr.FMant.cds2.GotoCurrent(DMTE.cdsEgrCaja);
   Except
   End;

   FRendicionCaja := Nil;
   Action := caFree;
End;

Procedure TFRendicionCaja.IniciaPanel;
Begin
   dbeSerie.Text := '000';
   dblcTDoc2.Text := '';
   dbeNoDoc2.Text := '';
   dblcdCnp2.Text := '';
   dblcDCnp2.Text := '';

     //nueva linea para reemplazar a la que  le sigue
   dblcdCCosto.Text := '';
   dblcdCCosto.Text := '';
   dbeDH.Text := '';
   dblcTMon2.Text := '';
   dbeImporte2.Text := '0.00';
   dbeTCamPr.Text := '';
   dbeTCamDoc.Text := '';

   dbdtpFEmis2.Date := 0;
   dbdtpFVcto2.Date := 0;

   edtCuenta2.Text := '';
   edtMtoLoc.Text := '';
   edtMtoExt.Text := '';

   edtTDoc2.Text := '';
End;

Procedure TFRendicionCaja.dbgDetPagoIButtonClick(Sender: TObject);
Begin
   inhabilitarpaneles;
   AdicionarRegistros;
End;

Procedure TFRendicionCaja.z2bbtnCancel3Click(Sender: TObject);
Begin

   bFlagRecuperacion := false;
   If DMTE.cdsRegCxP.State = dsInsert Then
      DMTE.cdsRegCxP.Delete
   Else
   Begin
      If DMTE.cdsRegCxP.State = dsedit Then
         DMTE.cdsRegCxP.Cancel;
   End;
   PnlActualiza.Visible := False;
   pnlDetPago.Enabled := True;
   pnlBotones.Enabled := True;
   z2bbtnSumatClick(sender); // Al salir hay que totalizar
   //quitar los filtros que se hubieran establecido
   liberarfiltrosregistroegresos;
End;

Procedure TFRendicionCaja.dbeNoRegExit(Sender: TObject);
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
      DMTE.cdsRegCxP.FieldByName('CPNOREG').AsString := dbeNoReg.Text;
   End
   Else
      dbeNoReg.Text := '';
End;

Procedure TFRendicionCaja.z2bbtnOK2Click(Sender: TObject);
Begin
   // VALIDA LA CUENTA DEL CONCEPTO
   If (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text, dblcdCnp2.text, '')) And (dblcTMon2.text = DMTE.wTMonLoc) Then
   Begin
      Raise Exception.Create('La cuenta ' + DMTE.cdsQry.FieldByName('CUENTAID').AsString + ' del Concepto ' + dblcdCnp2.text + ' Se registra sólo en Moneda Extranjera.');
   End;

   //Inicio HPC_201401_CAJA
   DMTE.cdsRegCxP.Edit;
   DMTE.cdsRegCxP.FieldByName('DEMTOORI').Ascurrency :=StrToCurr(dbeImporte2.Text);
   //Fianl HPC_201401_CAJA

   If DMTE.cdsRegCxP.State = dsInsert Then
      If EncuentraDuplicado(DMTE.cdsRegCxP, 'CPNoReg', dbeNoReg.Text) Then
      Begin
         ShowMessage('Numero de Registro duplicado');
         dbeNoReg.SetFocus;
         exit;
      End;
   If EncuentraDuplicado1(DMTE.cdsRegCxP, 'DOCID2;CPSERIE;CPNODOC', dblcTDoc2.text, dbeSerie.text, dbeNoDoc2.Text) Then
   Begin
      ShowMessage('Documento duplicado');
      dbeNoDoc2.SetFocus;
      exit;
   End;

   If Not ValidaCampo Then
   Begin
      ShowMessage('Debe regularizar primero lo observado');
      exit;
   End
   Else
   Begin
      DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString := edtCnp2.text;

      DMTE.cdsRegCxP.Post;
      wModifica := True;
      If Not dbeNoReg.Enabled Then
      Begin
         PnlActualiza.Visible := False;
         pnlDetPago.Enabled := True;
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

    //Inicio HPC_201401_CAJA
    dbeImporte2.text := '0.00';
    //Final HPC_201401_CAJA
End;

Procedure TFRendicionCaja.dblcTMon2Exit(Sender: TObject);
Var
   xWhere, aux: String;
Begin
   If z2bbtnCancel3.Focused Then exit;

   xWhere := 'TMONID=' + '''' + DMTE.cdsRegCxP.FieldByName('TMONID').AsString + '''';
   aux := DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
   If (Length(aux) > 0) And (DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat > 0) Then
   Begin
      If DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
      Begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
      End
      Else
      Begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat * DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
      End;
   End
   Else
   Begin
      DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat := 0;
      DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat := 0;
   End;
End;

Procedure TFRendicionCaja.dblcTMon2Change(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'TMONID=' + '''' + dblcTMon2.Text + '''';
   edtTMon2.Text := DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
End;

Procedure TFRendicionCaja.dblcCnp2Change(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CPTOID=' + '''' + dblcdCnp2.text + '''';
   edtCnp2.Text := DMTE.DisplayDescrip('prvCxP', 'CAJA201', 'CPTODES', xWhere, 'CPTODES');
End;

Procedure TFRendicionCaja.dblcCnp2Exit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CPTOID=' + '''' + dblcdCnp2.text + '''';
   DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString := DMTE.DisplayDescrip('prvCxP', 'CAJA201', 'CUENTAID', xWhere, 'CUENTAID');
End;

Procedure TFRendicionCaja.dbeImporte2_Exit(Sender: TObject);
Var
   xWhere, aux: String;
Begin
   If z2bbtnCancel3.Focused Then exit;

   xWhere := 'TMONID=' + '''' + DMTE.cdsRegCxP.FieldByName('TMONID').AsString + '''';
   aux := DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
   If (Length(aux) > 0) And (DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat > 0) Then
   Begin
      If DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
      Begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
      End
      Else
      Begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat * DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
      End;
   End
   Else
   Begin
      DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat := 0;
      DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat := 0;
   End;
End;

Procedure TFRendicionCaja.dbgDetPagoKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (dbgDetPagoIButton.Enabled = True) And (key = VK_DELETE) And (ssCtrl In Shift) Then
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

Procedure TFRendicionCaja.dbeDHChange(Sender: TObject);
Begin
   If Not ((dbeDH.Text = 'D') Or (dbeDH.Text = 'H') Or (Length(dbeDH.Text) = 0)) Then
   Begin
      dbeDH.Text := '';
      dbeDH.SetFocus;
   End;
End;

Procedure TFRendicionCaja.dbeLoteExit(Sender: TObject);
Begin
   If z2bbtnCancel.Focused Then
      exit;

   dbeLote.text := DMTE.StrZero(dbeLote.text, DMTE.cdsEgrCaja.FieldByName('ECLOTE').Size);
End;

Procedure TFRendicionCaja.dblcdProvChange(Sender: TObject);
Begin
   wModifica := True;
End;

Procedure TFRendicionCaja.edtProvRUCChange(Sender: TObject);
Begin
   wModifica := True;
End;

Procedure TFRendicionCaja.dbeGiradoAChange(Sender: TObject);
Begin
   wModifica := True;
End;

Procedure TFRendicionCaja.dbeTCambioChange(Sender: TObject);
Begin
   wModifica := True;
End;

Procedure TFRendicionCaja.dbeImporteChange(Sender: TObject);
Begin
   wModifica := True;
End;

Procedure TFRendicionCaja.dbeNoDocChange(Sender: TObject);
Begin
   wModifica := True;
End;

Procedure TFRendicionCaja.dbeNoChqChange(Sender: TObject);
Begin
   wModifica := True;
End;

Procedure TFRendicionCaja.dbeLoteChange(Sender: TObject);
Begin
   wModifica := True;
End;

Procedure TFRendicionCaja.dbeGlosaChange(Sender: TObject);
Begin
   wModifica := True;
End;

Procedure TFRendicionCaja.FormKeyPress(Sender: TObject; Var Key: Char);
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

Procedure TFRendicionCaja.z2bbtnOKCabClick(Sender: TObject);
Var
   xStr, xWhere: String;
   xSQL: String;
Begin
   xstr := '';

   If validacionCabecera = false Then exit;

   With DMTE Do
   Begin
      xWhere := 'CIAID =' + QuotedStr(dblcCia.Text)
         + ' AND TDIARID =' + QuotedStr(dblcTDiario.Text)
         + ' AND ECANOMM =' + QuotedStr(edtPeriodo.Text)
         + ' AND ECNOCOMP =' + QuotedStr(dbeNoComp.Text);
      If DisplayDescrip('prvTGE', 'CAJA302', 'COUNT(*) TOTREG', xWhere, 'TOTREG') > '0' Then
      Begin
         ShowMessage('Comprobante ya esta registrado');
         dbeNoComp.Text := '';
         dbeNoComp.SetFocus;
         exit;
      End
      Else
      Begin
         xSigueGrab := True;
         GrabaCabeceraDeComprobante;
         If Not xSigueGrab Then
         Begin
            dbeNoComp.SetFocus;
            Exit;
         End;

         xSQL := 'Select * '
               + '  from CAJA301 '
               + ' Where CIAID='+quotedstr(dblcCia.Text)
               + '   and ECANOMM='+quotedstr(edtPeriodo.Text)
               + '   and TDIARID='+quotedstr(dblcTDiario.Text)
               + '   and ECNOCOMP='+quotedstr(dbeNoComp.Text);
         DMTE.cdsRegCxP.Close;
         DMTE.cdsRegCxP.DataRequest(xSQL);
         DMTE.cdsRegCxP.Open;
        // Actualizar Label Estado
         lblEstado.Caption := 'Nuevo     ';

        //liberamos el filtro del detalle
         DMTE.cdsRegCxP.Filtered := False;

        //aqui se recupera el tipo de cambio
         xWhere := 'TMONID=' + QuotedStr(DMTE.wTMonExt)
            + ' and FECHA=' + DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha, dbdtpFComp.Date) + ''')';
         dbeTCambio.Text := DMTE.DisplayDescrip('prvTGE', 'TGE107', 'TMONID, ' + wTipoCambioUsar, xWhere, wTipoCambioUsar);

        // Estado de componentes
         pnlCabecera1.Enabled := false;
         pnlCabecera2.Enabled := True;
         dblcdAux.Enabled := True;

        //comentario de william manrique cautin

         z2bbtnOk.Enabled := True;
         z2bbtnCancel.Enabled := True;

         wbSumat := True;
         wbCont := False;
         wbImprime := False;
         wbNuevo := False;
         wbSube := True;
         wbGraba := True;
         wbCancelado := False;
         wbCancel2 := True;
         wbAnula := False;
      End;
   End;
   (sender As tcontrol).enabled := false;
   wModifica := False;
   perform(CM_DialogKey, VK_TAB, 0);

End;

Procedure TFRendicionCaja.LookUpMostrado(Sender: TObject; LookupTable,
   FillTable: TDataSet; modified: Boolean);
Var
   edicion: ^Tedit;
Begin
   If modified = true Then
   Begin
      edicion := (ptr((Sender As TwwDBCustomLookupCombo).tag));
      If (LookupTable.Eof) Or (LookupTable.Eof)
         Or ((Sender As TwwDBCustomLookupCombo).Text <> LookUpTable.Fields[0].AsString) Then
      Begin
         edicion.Text := '';
         (Sender As twwDBCustomLookupCombo).text := '';
      End
      Else
         edicion.Text := LookupTable.Fields[1].AsString;
   End;
End;

Procedure TFRendicionCaja.NoEstaenLookUp(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Var
   edicion: ^Tedit;
Begin
   edicion := (ptr((Sender As TwwDBLookupCombo).tag));
   edicion.text := '';
   (sender As TwwDBLookUpCombo).text := '';
End;

Procedure TFRendicionCaja.MensajeComboNoExit(DBLook: TwwDBCustomLookupCombo);
Begin

   If DBLook.Name = 'dblcTDiario' Then
      ShowMessage('Tipo de Diario Errado')
   Else
      If DBLook.Name = 'dblcCia' Then
         ShowMessage('Código de Compañía Errado')
      Else
         If DBLook.Name = 'dblcCCBco' Then
            ShowMessage('Falta Cuenta Corriente Banco')
         Else
            If DBLook.Name = 'dblcTDoc' Then
               ShowMessage('Tipo de Documento Errado')
            Else
               If DBLook.Name = 'dblcTMon' Then
                  ShowMessage('Moneda no Registrada')
               Else
                  If DBLook.Name = 'dblcCnp' Then
                     ShowMessage('Concepto no Registrado')
End;

Procedure TFRendicionCaja.Validacion(Sender: TObject);
Var
   edicion: ^Tedit;
Begin
   If (Sender As twwDBCustomLookupCombo).Text = '' Then
   Begin
      (Sender As twincontrol).SetFocus;
      MensajeComboNoExit((Sender As TwwDBCustomLookupCombo));
   End
   Else
   Begin
      edicion := (ptr((Sender As TwwDBCustomLookupCombo).tag));
      edicion.text := (Sender As TwwDBCustomLookupCombo).LookUpTable.Fields[1].AsString;
   End;
End;

Procedure TFRendicionCaja.dblcTDocNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   NoEstaEnLookUp(Sender, LookupTable, NewValue, Accept);
End;

Procedure TFRendicionCaja.dblcTDocCloseUp(Sender: TObject; LookupTable,
   FillTable: TDataSet; modified: Boolean);
Begin
   LookUpMOstrado(Sender, LookupTable, FillTable, modified);
End;

Procedure TFRendicionCaja.dblcCnpNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   NoestaenLookUp(Sender, LookupTable, NewValue, Accept);
End;

Procedure TFRendicionCaja.dblcCnpCloseUp(Sender: TObject; LookupTable,
   FillTable: TDataSet; modified: Boolean);
Begin
   LookUpMostrado(Sender, LookupTable, FillTable, modified);
End;

Procedure TFRendicionCaja.InhabilitarPaneles;
Begin
   pnlDetPago.Enabled := False;
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

Procedure TFRendicionCaja.EdiTarRegistros;
Begin
   BlanqueaEdits(pnlActualiza);
   DMTE.cdsRegCxP.Edit; //Lo pongo en modo de edicion
   dbeNoReg.Text := DMTE.strzero(DMTE.cdsRegCxP.FieldByName('CPNOREG').AsString, 10);
   dbeNoReg.Enabled := false;
   edtCnp2.text := DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString;
   //Inicio HPC_201401_CAJA
   dbeImporte2.Text:= DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsString;
   //Final HPC_201401_CAJA
   label1.Caption := 'En Edicion';
   dbeNoReg.Enabled := False;
   dbeNoReg.Color := clBtnFace;

   //Recuperacion de los detalles del panel
   If trim(dblcTDoc2.Text) <> '' Then
      edtTDoc2.Text := DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCABR', 'DOCID=''' + dblcTDoc2.Text + '''', 'DOCABR');

   If trim(dblcdAuxDet.Text) <> '' Then
   Begin
      dbeAuxDet.Text :=
         DMTE.DisplayDescrip('prvTGE', 'CNT201', 'AUXABR',
         'CLAUXID = ''' +
         DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString
         + ''' AND AUXID=''' + dblcdAuxDet.Text + '''', 'AUXABR');
      edtClaseDet.Text :=
         DMTE.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXDES',
         'CLAUXID = ''' +
         DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString + ''' ', 'CLAUXDES');

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

Procedure TFRendicionCaja.AdicionarRegistros;
Var
   xWhere: String;
Begin
   dbeNoReg.Enabled := true;
   dbeNoReg.Text := '';
   dbeNoReg.Text := DMTE.StrZero(GeneraCorrelativo(DMTE.cdsRegCxP, 'CPNOREG'), 10);
   DMTE.cdsRegCxP.Insert;
   DMTE.cdsRegCxP.FieldByName('CIAID').AsString := dblcCia.Text;
   DMTE.cdsRegCxP.FieldByName('TDIARID').AsString := dblcTDiario.Text;
   DMTE.cdsRegCxP.FieldByName('ECANOMM').AsString := edtPeriodo.Text;
   DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString := dbeNoComp.Text;
   DMTE.cdsRegCxP.FieldByName('DOCID2').AsString  := dblcTDoc.text;
   DMTE.cdsRegCxP.FieldByName('DOCMOD').AsString  := DMTE.cdsTDoc.FieldByname('DOCMOD').AsString;
   //Inicio HPC_201401_CAJA
   DMTE.cdsRegCxP.FieldByName('KEYVALE').AsString := sKeyVale;
   //Final HPC_201401_CAJA

   xWhere := 'DOCID=''' + dblcTDoc.text + '''';
   edtTDoc2.text := DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCDES', xWhere, 'DOCDES');

   DMTE.cdsRegCxP.FieldByName('CPTOID').AsString := dblcdCnp.text;

   xWhere := 'CPTOID=' + QuotedStr(dblcdCnp2.Text);
   edtCnp2.text := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTOID,CUENTAID,CPTODES', xWhere, 'CPTODES');

   DMTE.cdsRegCxP.FieldByName('TDIARID2').AsString := dblcTDiario.text;

   DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString := DMTE.cdsQry.FieldByname('CUENTAID').AsString;
   xWhere := 'CIAID=''' + dblcCia.Text + ''' AND CUENTAID=''' + DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString + '''';
   DMTE.DisplayDescrip('prvTGE', 'TGE202', 'CUENTAID, CTA_CCOS, CTA_AUX, CTAACT', xWhere, 'CuentaId');

   // Activa Centro de Costo
   If DMTE.cdsQry.FieldByName('CTA_CCOS').AsString = 'S' Then
      dblcdCCosto.Enabled := True;

   If DMTE.cdsQry.FieldByName('CTA_AUX').asString = 'S' Then
   Begin
      DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString := dblcClase.text;
      xWhere := 'CLAUXID=' + '''' + dblcClase.text + '''';
      edtClaseDet.text := DMTE.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXDES', xWhere, 'CLAUXDES');

      xWhere := '';
      DMTE.cdsRegCxP.FieldByName('PROV').AsString := dblcdAux.text;
      xWhere := 'AUXID=' + '''' + dblcdAux.text + '''';
      dbeAuxDet.text := DMTE.DisplayDescrip('prvTGE', 'CNT201', 'AUXNOMB', xWhere, 'AUXNOMB');
   End;

   xWhere := '';
   DMTE.cdsRegCxP.FieldByName('TMonid').AsString := dblcTMon.text;
   xWhere := 'TMONID=' + '''' + dblcTMon2.text + '''';
   edtTMon2.text := DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');
   DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat := strtofloat(dbeImporte.text);
   DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString := dbeNodoc.text;

   DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat := strtofloat(dbeTCambio.Text);
   DMTE.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime := dbdtpFComp.Date;
   DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime := DateS;
   DMTE.cdsRegCxP.FieldByName('CPFVCMTO').AsDateTime := DateS;
   DMTE.cdsRegCxP.FieldByName('CPANOMM').AsString := copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime), 7, 4)
      + copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime), 4, 2);
   DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DMTE.cdsRegCxP.FieldByName('DEDH').AsString := 'D'; //Inicializo en Debe
   DMTE.cdsRegCxP.FieldByName('DETCDOC').AsString := dbeTCambio.Text;
   DMTE.cdsRegCxP.FieldByName('DETCPAG').AsString := dbeTCambio.Text;

   DMTE.cdsRegCxP.FieldByName('CPSerie').AsString := wSerie;
   dbeImporte2Exit(Self);

   dbeNoReg.SetFocus;
End;

Procedure TFRendicionCaja.dbgDetPagoDblClick(Sender: TObject);
Begin
   If Not dbgdetpagoibutton.Enabled Then
      exit;

   If dbgDetPago.DataSource.DataSet.RecordCount <> 0 Then
   Begin
      inHabilitarPaneles;
      editarRegistros;
   End;
End;

Procedure TFRendicionCaja.dblcTDoc2Exit(Sender: TObject);
Var
   Filtro: String;
Begin
   If z2bbtnCancel3.Focused Then Exit;

   edtTDoc2.text := DMTE.DisplayDescripLocal(DMTE.cdsTDoc, 'DOCID', dblcTDoc2.Text, 'DOCDES');

   If edtTDoc2.Text = '' Then
   Begin
      ShowMessage('Error : Tipo de Documento no Valido');
      dblcTDoc2.SetFocus;
      Exit;
   End;
   edtCnp2.text := DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString;
   DMTE.cdsRegCxP.FieldByName('DOCMOD').AsString := DMTE.cdsTDoc.FieldByname('DOCMOD').AsString;
End;

Procedure TFRendicionCaja.LiberarFiltrosRegistroEgresos;
Begin
   bFlagRecuperacion := false;
End;

Procedure TFRendicionCaja.EstablecerFiltrosRegistroEgresos;
Begin
   bFlagRecuperacion := True;
End;

Procedure TFRendicionCaja.FormCreate(Sender: TObject);
Var
   sSQL, xWhere: String;
Begin
   xWhere := 'select bancoid, banconom, cuentaid from tge105 where flacajchi=''S''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xWhere);
   DMTE.cdsQry.Open;
   sCuentaCajaChica := DMTE.cdsQry.FieldByName('CUENTAID').AsString;
   sKeyVale :=Trim(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString)+
              Trim(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('TDIARID').AsString)+
              Trim(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString)+
              Trim(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECNOCOMP').AsString) ;
   DMTE.cdsRegCxP.DisableControls;
   DMTE.ASignaTipoDiario(dblcTDiario, self);

   cdsConceptoC1 := TwwClientdataset.Create(Self);

   DMTE.cdsFEfec.Filter := 'FLUEFE_IS = ''S'' ';
   DMTE.cdsFEfec.Filtered := True;
   DMTE.cdsRegCxP.EnableControls;
   setlength(A2digitos, 1);
   setlength(A4digitos, 1);
   A2digitos[0] := dbeImporte;
   A4digitos[0] := dbeTCambio;
   cf1 := TControlFoco.Create;
//Se captura el id del TDOC
   xWhere := ' DOCPROV = ' + '''' + 'S' + '''';
   wTDocRxH := DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCID', xWhere, 'DOCID');
   wSerie := '000';
End;

Procedure TFRendicionCaja.Button1Click(Sender: TObject);
Begin
   dblcdCCosto.Text := '';
End;

Function TFRendicionCaja.ValidacionCabecera: Boolean;
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
      ShowMessage('Caja/Banco no esta Relacionado a Tipo de Diario');
      dblcBanco.SetFocus;
      exit;
   End;

   If trim(dbeNocomp.text) = '' Then
   Begin
      ShowMessage('Ingrese Número de Comprobante');
      dbeNocomp.SetFocus;
      exit;
   End;

     //si llega aqui es true
   result := true;
End;

Procedure TFRendicionCaja.z2bbtnImprimeClick(Sender: TObject);
Var
   Comprobante: RCabComprobante;
   xSQL: String;
Begin

   If dblcBanco.text = '20' Then
   Begin

      xSql := 'CIAID=' + quotedstr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)
         + ' and TDIARID=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
         + ' and ECANOMM=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
         + ' and ECNOCOMP=' + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);

      DMTE.DisplayDescrip('prvTGE', 'CAJA302', 'ECCONTA', xsql, 'ECCONTA');
      If DMTE.cdsQry.FieldByName('ECCONTA').AsString <> 'S' Then
      Begin
         ShowMessage('Para Imprimir Comprobante de Fondo Fijo, Debe Contabilizar el Voucher');
         Exit;
      End;
   End;

   If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'A' Then
   Begin
      ImprimeVoucher('CNT311', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text);
      Exit;
   End;

   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' Then
   Begin
      ShowMessage('Para Imprimir Comprobante, Debe Contabilizar el Voucher ');
      Exit;
   End;

   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' Then
   Begin
      RecCptosDifC;
      Contabiliza;

      ActualizaCNT311(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
         DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
         DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
         DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString);

      If SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
         DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
         DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
         DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
         DMTE.SRV_D, 'PCNA', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
         DMTE.cdsResultSet, DMTE.DCOM1, Self) Then
         ImprimeVoucher('CNT311', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text);
   End;

   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' Then
   Begin

      If fg_ExisteContabFilial(dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text) = False Then
      Begin
         ImprimeVoucher('CNT301', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text);
      End
      Else
      Begin
         ImprimeVoucher('CNT301G', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text);
      End;

   End;
End;

Procedure TFRendicionCaja.ValidacionCabecera1;
Begin
  // Nota: El "raise" termina el procedure o function si es que se da la consistencia
  // En este punto ya se ha probado todas las consistencias y ya se puede grabar

   Try
    // consistencia de Datos
      ValidaEDit(dblcCia, 'Falta Codigo de Compañia');
      ValidaEDit(dblcTDiario, 'Falta Tipo de Diario');
      ValidaEDit(dblcdAux, 'Faltan Datos del Auxiliar');
      ValidaEDit(dbeGiradoA, 'Datos del Proveedor Errados');
      ValidaEDit(dblcTMon, 'Falta Tipo de Moneda');
      ValidaEDit(dbeTCambio, 'Falta Tipo de Cambio');
      //validar tipo de cambio cero <=0
      ValidaEDit(dbeImporte, 'Falta Monto a Pagar');
      //Validar Importe errado <=0
      ValidaEDit(dblcTDoc, 'Falta Tipo de Documento');
      ValidaEDit(dbeNoDoc, 'Falta Nro.de Documento');
      ValidaEDit(dblcBanco, 'Falta definir Caja / Banco');
      ValidaEDit(dbeLote, 'Falta Lote');
      ValidaEDit(dblcdCnp, 'Falta Concepto');
      If dblcCCBco.Enabled = True Then
      Begin
         ValidaEDit(dblcCCBco, 'Falta Cuenta Corriente Banco');
         If dbdtpFEmis.Date = 0 Then
         Begin
            dbdtpFEmis.SetFocus;
            Raise Exception.create('Ingrese Fecha de Emisión del Cheque');
         End;
      End;
      If dblcFormPago.Enabled = True Then
         ValidaEDit(dblcFormPago, 'Falta Forma de Pago');

      If strtofloat(dbeTCambio.Text) <= 0 Then
      Begin
         dbeTCambio.SetFocus;
         Raise Exception.Create('Tipo de Cambio Errado');
      End;

      If strtofloat(dbeImporte.Text) <= 0 Then
      Begin
         dbeImporte.SetFocus;
         Raise Exception.Create('Importe Errado');
      End;

      If (dbeNoChq.Enabled = True) And (Length(dbeNoChq.Text) = 0) Then
      Begin
         dbeNoChq.SetFocus;
         Raise Exception.Create('Falta No. de Cheque');
      End;

   Except
      Raise;
   End;

End;

Procedure TFRendicionCaja.dblcBancoEnter(Sender: TObject);
Begin
   strTmp := dblcBanco.text;
End;

Procedure TFRendicionCaja.dblcFormPagoExit(Sender: TObject);
Var
   xwhere, Tmp: String;
Begin
   If z2bbtnCancel.Focused Then exit;
   If dblcTMon.Focused Then exit;

   edtFormPago.text := DMTE.DisplayDescripLocal(DMTE.cdsFormPago, 'FPAGOID', dblcFormPago.Text, 'FPAGODES');

   If dblcFormPago.Text = '' Then
   Begin
      dbeNoChq.Text := '';
      ShowMessage('Error : Forma de Pago no Válida');
      dblcFormPago.SetFocus;
      Exit;
   End;

   If DMTE.cdsFormPago.FieldByName('FCANJE').AsString = 'A' Then
   Begin
      ShowMessage('Error : Forma de Pago no Válida para esta Opción');
      dblcFormPago.SetFocus;
      Exit;
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

   If DMTE.cdsFormPago.FieldByName('FCANJE').AsString = 'S' Then
   Begin
      DMTE.abreCuentas(dblcCia.text);
      edtCuenta.Enabled := True;
   End
   Else
   Begin
      edtCuenta.Enabled := False;
   End;

   If (Not dbeNoChq.Enabled) And (Not dbdtpFEmis.Enabled) And (Not edtCuenta.Enabled) Then
   Begin
      If (pnlCabecera2.Enabled = True) And (dblcTDoc.Enabled = True) Then
         dblcTDoc.setFocus;
   End;
End;

Procedure TFRendicionCaja.Adiciona;
Var
   xSQL, xSQLx, xERROR: String;
Begin
   IniciaDatos;

   dblcCCBco.Selected.Clear;
   dblcCCBco.Selected.Add('CCBCOID'#9'25'#9'Cuenta Corriente del Banco'#9'F');
   dblcCCBco.Selected.Add('CCBCODES'#9'30'#9'Descripción'#9'F');
   dblcCCBco.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');

   edtCuenta.Enabled := False;
   xGraboNuevo := false;

   Z2bbtnCancel.Visible := True;
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

////
   With DMTE Do
   Begin
      dblcCia.Text := cdsLiq305.FieldByName('CIAID').AsString;
      dblcCiaExit(self);
      dblcBanco.Text := cdsLiq305.FieldByName('BANCOID').AsString;
      dblcCCBco.Text := cdsLiq305.FieldByName('CCBCOID').AsString;
      dblcBancoExit(self);
      dblcTDiario.Text := cdsLiq305.FieldByName('TDIARID').AsString;
      dbdtpFComp.date := DateS;
      dbdtpFCompExit(Self);

      GrabaCabeceraDeComprobante;

      pnlCabecera1.Enabled := false;
      pnlCabecera2.Enabled := True;

      xSQL := 'Select * from CAJA301 '
         + ' Where CIAID=''' + cdsEgrCaja.FieldByName('CIAID').AsString + ''' and '
         + '       ECANOMM=''' + cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' and '
         + '       TDIARID=''' + cdsEgrCaja.FieldByName('TDIARID').AsString + ''' and '
         + '       ECNOCOMP=''' + cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' ';
      DMTE.cdsRegCxP.Close;
      DMTE.cdsRegCxP.DataRequest(xSQL);
      DMTE.cdsRegCxP.Open;

      // Asignar desde valores del registro activo
      dblcClase.Text := cdsLiq305.FieldByName('CLAUXID').AsString;
      dblcClaseExit(self);

      xSQLx := 'Select * from CNT201 Where CLAUXID=''' + dblcClase.Text + ''' and ACTIVO=''S''';
      DMTE.cdsAux.Close;
      DMTE.cdsAux.DataRequest(xSQLx);
      DMTE.cdsAux.Open;

      dblcdAux.Selected.Clear;
      dblcdAux.Selected.Add('AUXID'#9'10'#9'Auxiliar'#9'F');
      dblcdAux.Selected.Add('AUXRUC'#9'15'#9'R.U.C'#9'F');
      dblcdAux.Selected.Add('AUXNOMB'#9'40'#9'Nombre Auxiliar'#9'F');

      dblcdAux.Text := cdsLiq305.FieldByName('PROV').AsString;
      edtAuxRUC.Text := cdsLiq305.FieldByName('PROVRUC').AsString;
      dbeGiradoA.Text := cdsLiq305.FieldByName('ECGIRA').AsString;
      dblcTMon.Text := cdsLiq305.FieldByName('TMONID').AsString;
      dblcTMonExit(self);
      dbeTCambio.Text := cdsLiq305.FieldByName('ECTCAMB').AsString;
      dbeImporte.Text := cdsLiq305.FieldByName('ECMTOORI').AsString;

      dblcTDoc.Text := cdsLiq305.FieldByName('DOCID').AsString;
      dbeNoDoc.Text := cdsLiq305.FieldByName('ECNODOC').AsString;
      dblcTDocExit(self);

      edtCuenta.Text := '386'; //Rendición de Cuentas
      //dblcFormPago.Text := cdsEgrCaja.FieldByName('FPAGOID').AsString;
      dbeNoChq.Text := cdsLiq305.FieldByName('ECNOCHQ').AsString;
      dbeLote.Text := cdsLiq305.FieldByName('ECLOTE').AsString;
      dblcdCnp.Text := cdsLiq305.FieldByName('CPTOID').AsString;
      dbeGlosa.Text := cdsLiq305.FieldByName('ECGLOSA').AsString;
      dbdtpFEmis.date := cdsLiq305.FieldbyName('ECFEMICH').AsDateTime;
      dblcdFEfec.Text := cdsLiq305.FieldByName('FLUEID').AsString;
      edtAuxNombre.text := DMTE.DisplayDescrip('prvTGE', 'CNT201', 'AUXNOMB', 'CLAUXID = ' + QuotedStr(dblcClase.Text) + ' AND AUXID=' + QuotedStr(dblcdAux.Text), 'AUXNOMB');
      dbeRepo.Text := cdsLiq305.FieldByName('ECNOREPO').AsString;

      lblSujetoRetencion.visible := ((DMTE.DisplayDescrip('prvTGE', 'CNT201', 'PROVRETIGV',
         'CLAUXID = ''' + dblcClase.text + ''' AND AUXID=''' + dblcdAux.Text + '''', 'PROVRETIGV') = 'S') And (wCiaRetIGV));

      xDetraccion := 'N'; //DMTE.DisplayDescripLocal(DMTE.cdsCptos, 'CPTOID', dblcdCnp.Text, 'FCTZ');

      If cdsEgrCaja.FieldByName('ECEstado').AsString = 'I' Then //Si está INCOMPLETO
      Begin
         // Activar modo de Editado
         cdsEgrCaja.Edit;

         // Estado de componentes
         pnlCabecera1.Enabled := False; // Desactivar Panel1
         pnlCabecera2.Enabled := True; // Activar Panel2
         dblcClase.Enabled := False; // El proveedor ya no se puede modificar
         dblcdAux.Enabled := False; // El proveedor ya no se puede modificar
         edtAuxRUC.Enabled := False;
         z2bbtnOk.Enabled := True;
         z2bbtnCancel.Enabled := True;

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
         lblEstado.Caption := 'Activo             ';
      End;

      z2bbtnSumatClick(Nil);

      z2bbtnOkCab.enabled := false;
      wModifica := False;

      Z2bbtnCancel.Visible := False;
   End;

   ////
   wbSumat := True;
   wbCont := False;
   wbImprime := False;
   wbNuevo := False;
   wbSube := True;
   wbGraba := True;
   wbCancelado := False;
   wbCancel2 := True;
   wbAnula := False;
   wModifica := False;
End;

Procedure TFRendicionCaja.Edita(cds: Twwclientdataset);
Var
   xERROR: String;
   xSQL, xSQLx: String;
Begin
   IniciaDatos;

   With DMTE Do
   Begin
      dblcCia.Text := cdsEgrCaja.FieldByName('CIAID').AsString;
      dblcTDiario.Text := cdsEgrCaja.FieldByName('TDIARID').AsString;
      edtPeriodo.Text := cdsEgrCaja.FieldByName('ECANOMM').AsString;
      dbeNoComp.Text := cdsEgrCaja.FieldByName('ECNOCOMP').AsString;

      xSQL := 'Select * from CAJA301 '
            + ' Where CIAID=''' + cdsEgrCaja.FieldByName('CIAID').AsString + ''' and '
            + '       ECANOMM=''' + cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' and '
            + '       TDIARID=''' + cdsEgrCaja.FieldByName('TDIARID').AsString + ''' and '
            + '       ECNOCOMP=''' + cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' ';
      DMTE.cdsRegCxP.Close;
      DMTE.cdsRegCxP.DataRequest(xSQL);
      DMTE.cdsRegCxP.Open;

      // Asignar desde valores del registro activo
      dbdtpFComp.date := cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
      dblcClase.Text := cdsEgrCaja.FieldByName('CLAUXID').AsString;

      xSQLx := 'Select * from CNT201 Where CLAUXID=''' + dblcClase.Text + ''' and ACTIVO=''S''';
      DMTE.cdsAux.Close;
      DMTE.cdsAux.DataRequest(xSQLx);
      DMTE.cdsAux.Open;

      dblcdAux.Selected.Clear;
      dblcdAux.Selected.Add('AUXID'#9'10'#9'Auxiliar'#9'F');
      dblcdAux.Selected.Add('AUXRUC'#9'15'#9'R.U.C'#9'F');
      dblcdAux.Selected.Add('AUXNOMB'#9'40'#9'Nombre Auxiliar'#9'F');

      dblcdAux.Text := cdsEgrCaja.FieldByName('PROV').AsString;
      edtAuxRUC.Text := cdsEgrCaja.FieldByName('PROVRUC').AsString;
      dbeGiradoA.Text := cdsEgrCaja.FieldByName('ECGIRA').AsString;
      dblcTMon.Text := cdsEgrCaja.FieldByName('TMONID').AsString;
      dbeTCambio.Text := cdsEgrCaja.FieldByName('ECTCAMB').AsString;
      dbeImporte.Text := cdsEgrCaja.FieldByName('ECMTOORI').AsString;
      dblcTDoc.Text := cdsEgrCaja.FieldByName('DOCID').AsString;
      dbeNoDoc.Text := cdsEgrCaja.FieldByName('ECNODOC').AsString;
      dblcBanco.Text := cdsEgrCaja.FieldByName('BANCOID').AsString;
      dblcCCBco.Text := cdsEgrCaja.FieldByName('CCBCOID').AsString;
      edtCuenta.Text := cdsEgrCaja.FieldByName('CUENTAID').AsString;
      dblcFormPago.Text := cdsEgrCaja.FieldByName('FPAGOID').AsString;
      dbeNoChq.Text := cdsEgrCaja.FieldByName('ECNOCHQ').AsString;
      dbeLote.Text := cdsEgrCaja.FieldByName('ECLOTE').AsString;
      dblcdCnp.Text := DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString;
      dbeGlosa.Text := cdsEgrCaja.FieldByName('ECGLOSA').AsString;
      dbdtpFEmis.date := cdsEgrCaja.FieldbyName('ECFEMICH').AsDateTime;
      dblcdFEfec.Text := cdsEgrCaja.FieldByName('FLUEID').AsString;
      edtAuxNombre.text := DMTE.DisplayDescrip('prvTGE', 'CNT201', 'AUXNOMB', 'CLAUXID = ' + QuotedStr(dblcClase.Text) + ' AND AUXID=' + QuotedStr(dblcdAux.Text), 'AUXNOMB');
      dbeRepo.Text := cdsEgrCaja.FieldByName('ECNOREPO').AsString;

      lblSujetoRetencion.visible := ((DMTE.DisplayDescrip('prvTGE', 'CNT201', 'PROVRETIGV',
         'CLAUXID = ''' + dblcClase.text + ''' AND AUXID=''' + dblcdAux.Text + '''', 'PROVRETIGV') = 'S') And (wCiaRetIGV));
      //
      // RECUPERACION DE DATOS ADICIONALES

      DMTE.SQLAdicEgresos(dblcCia.Text, edtPeriodo.Text,
         dblcTDiario.Text, dbeNoComp.Text, xERROR);
      DMTE.cdsRec.active := False;
      DMTE.cdsRec.active := True;

      If Not DMTE.cdsRec.FieldByName('DOCDES').isnull Then
         edtTDoc.Text := DMTE.cdsRec.FieldByName('DOCDES').AsString;
      If Not DMTE.cdsRec.FieldByName('FPAGOABR').isnull Then
         edtFormPago.Text := DMTE.cdsRec.FieldByName('FPAGOABR').AsString;
      If Not DMTE.cdsRec.FieldByName('BANCOABR').isnull Then
         edtBanco.text := DMTE.cdsRec.FieldByName('BANCOABR').AsString;

      wBcoTipCta := DMTE.cdsRec.FieldByName('BCOTIPCTA').AsString;

      dbeFEfec.text := DMTE.fieldnonulo(DMTE.cdsRec.FieldByName('FLUEFEABR'));

      edtClase.text := DMTE.cdsRec.FieldByName('CLAUXABR').AsString;
      edtCia.Text := DMTE.FieldNoNulo(DMTE.cdsRec.fieldBYname('CIADES'));
      xDetraccion := DMTE.DisplayDescripLocal(DMTE.cdsCptos, 'CPTOID', dblcdCnp.Text, 'FCTZ');

      If cdsEgrCaja.FieldByName('ECEstado').AsString = 'I' Then //Si está INCOMPLETO
      Begin
         // Activar modo de Editado
         cdsEgrCaja.Edit;

         // Estado de componentes
         pnlCabecera1.Enabled := False; // Desactivar Panel1
         pnlCabecera2.Enabled := True; // Activar Panel2
         dblcClase.Enabled := False; // El proveedor ya no se puede modificar
         dblcdAux.Enabled := False; // El proveedor ya no se puede modificar
         edtAuxRUC.Enabled := False;
         z2bbtnOk.Enabled := True;
         z2bbtnCancel.Enabled := True;

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
         lblEstado.Caption := 'Activo             ';
      End;

      If cdsEgrCaja.FieldByName('ECESTADO').AsString = 'C' Then //Si está CANCELADO
      Begin
         pnlCabecera1.Enabled := False; // Desactivar Panel1
         pnlCabecera2.Enabled := False; // Desactivar Panel2
         pnlDetPago.Enabled := True; // Activar Panel de Detalle
         pnlBotones.Enabled := True; // Activar Panel de Botones

         dbgDetPagoIButton.Enabled := False;
         z2bbtnOk.Enabled := False;
         z2bbtnCancel.Enabled := False;

         wbSumat := False;
         If cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' Then
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

         wbNuevo := True;
         wbImprime := True;
         wbSube := False;
         wbGraba := False;
         wbCancelado := False;
         wbCancel2 := False;
         wbChq := False;

         ActPnlBotones;
      End;

      If cdsEgrCaja.FieldByName('ECESTADO').AsString = 'A' Then // Si esta ANULADO
      Begin
         pnlCabecera1.Enabled := False; // Desactivar Panel1
         pnlCabecera2.Enabled := False; // Desactivar Panel2
         pnlDetPago.Enabled := True; // Activar Panel de Detalle
         pnlBotones.Enabled := True; // Activar Panel de Botones

         dbgDetPagoIButton.Enabled := False;
         z2bbtnOk.Enabled := False;
         z2bbtnCancel.Enabled := False;

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
         ActPnlBotones;
         lblEstado.Caption := 'Anulado            ';
      End;

      z2bbtnSumatClick(Nil);

      z2bbtnOkCab.enabled := false;
      wModifica := False;

      Z2bbtnCancel.Visible := False;

      xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, CLAUXID, PROV, PROVRUC, ECFCOMP, ECFEMICH, ECFPAGOP, '
            + '       ECFCOBCH, FPAGOID, DOCID, ECNODOC, TMONID, ECTCAMB, ECMTOORI, ECMTOLOC, ECMTOEXT, BANCOID, CCBCOID, '
            + '       ECNOCHQ, ECGIRA, CPTOID, CUENTAID, ECGLOSA, ECLOTE, ECELABO, ECAPROB, ECESTADO, ECCONTA, ECUSER, '
            + '       ECFREG, ECHREG, ECANO, ECMM, ECDD, ECSS, ECSEM, ECTRI, ECAASS, ECAASEM, ECAATRI, FLAGVAR, EC_PROCE, '
            + '       ECOPAGO, TDIARIO2, ECNOCOMP2, ECANOMM2, EC_IE, ECCHQEMI, USERRESP, EQUIID, ECCHKEST, ECPERNDOC, '
            + '       ECPERREC, TIPDOCCOD, PERID, ECFENTR, ECCONSOLID, ECMTCON, ECFCV, ECCOBLOC, ECMTDIF, ECCOBEXT, ECDEVLOC, '
            + '       ECDEVEXT, FEXTCHQ, FLUEID, ECCONING, ECNOREPO, CLAUXID1, AUXID, PROV1, CCBCOVOUCH, PRVBANCOID, PRVCCBCOID, '
            + '       ECSALMN, ECSALME, CAJARETIGV, FDOFIJJUST, GCONCID, TIPDET, ECNOCOMPR, CNTCOMPROB '
            + '  from CAJA302 '
            + ' Where CIAID=''' + DMTE.cdsEgrCaja.FieldByName('CIAID').AsString + ''' '
            + '   and TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' '
            + '   and DOCID=''' + DMTE.cdsEgrCaja.FieldByName('DOCID').AsString + ''' '
            + '   and ECNODOC=''' + DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString + ''' '
            + '   and PROV=''' + DMTE.cdsEgrCaja.FieldByName('PROV').AsString + ''' '
            + '   and ECNOCOMP<>''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' '
            + '   and ECESTADO=''C'' and EC_PROCE=''1''';
      DMTE.cdsLiq305.Close;
      DMTE.cdsLiq305.Filter := '';
      DMTE.cdsLiq305.DataRequest(xSQL);
      DMTE.cdsLiq305.open;
   End;
End;

Procedure TFRendicionCaja.FormShow(Sender: TObject);
Var
   xSQL, xWhere: String;
Begin

   If DMTE.wModo = 'A' Then
   Begin
      Adiciona;
      xSQL := 'Select * from CAJA301 '
            + ' Where CIAID=''' + dblcCia.Text + ''' and '
            + '       ECANOMM=''' + edtPeriodo.Text + ''' and '
            + '       TDIARID=''' + dblcTDiario.Text + ''' and '
            + '       ECNOCOMP=''' + dbeNoComp.Text + ''' ';
      DMTE.cdsRegCxP.Close;
      DMTE.cdsRegCxP.DataRequest(xSQL);
      DMTE.cdsRegCxP.Open;
      DMTE.cdsRegCxP.Filtered := False;
      z2bbtnOKClick(Self);
      Exit;
   End
   Else
   Begin
      xSQL := 'select A.CPTOID, A.CPTODES, A.CUENTAID, FCTZ From CAJA201 A '
            + ' WHERE CPTOIS=''E'' '
            + '   AND EXISTS ( SELECT CUENTAID '
            + '                  FROM TGE202 B '
            + '                 WHERE A.CUENTAID=B.CUENTAID AND B.CTAACT=''S'' '
            + '                   AND B.CIAID=''' + DMTE.cdsEgrCaja.FieldByName('CIAID').AsString + ''') '
            + ' ORDER BY A.CPTOID';
      DMTE.cdsCptos.Close;
      DMTE.cdsCptos.DataRequest(xSQL);
      DMTE.cdsCptos.Open;

      cdsConceptoC1.CloneCursor(DMTE.cdsCptos, True);
      cdsConceptoC1.Name := 'cdsConceptoC1';
      cdsConceptoC1.Filtered := True;
      dblcdCnp2.LookupTable := cdsConceptoC1;

      Edita(DMTE.cdsEgrCaja);
   End;

   xVoucher := '';
   If (DMTE.cdsFormPago.RecordCount = 1) And (DMTE.wModo <> 'A') Then
   Begin
      edtFormPago.text := DMTE.DisplayDescripLocal(DMTE.cdsFormPago, 'FPAGOID', dblcFormPago.Text, 'FPAGODES');

      xWhere := 'FPAGOID=' + QuotedStr(dblcFormPago.text);
      If DMTE.DisplayDescrip('prvQry2', 'TGE112', 'FCANJE,FPAGODES', xWhere, 'FCANJE') = 'S' Then
         edtCuenta.Enabled := True;
      dblcCia.OnExit(self);
   End;
   If strtoint(dbeLote.Text) = 0 Then dbeLote.Text := '000';

   If DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'C' Then
      z2bbtnSumatClick(sender);

   With DMTE Do
   Begin
      If Trim(dblcBanco.Text) <> '' Then
      Begin
         If cdsEgrCaja.FieldByName('ECESTADO').AsString = 'I' Then //Si está INCOMPLETO
         Begin
               //focus
            pnlCabecera2.SetFocus;
            perform(CM_DialogKey, VK_TAB, 0);
               //
         End;

         If (cdsEgrCaja.FieldByName('ECESTADO').AsString = 'C') Or (cdsEgrCaja.FieldByName('ECESTADO').AsString = 'A') Then //Si está CANCELADO
         Begin
            //focus
            pnlBotones.SetFocus;
            perform(CM_DialogKey, VK_TAB, 0);
            //
         End;
      End
      Else
      Begin
        //codigo nuevo
         RecuperarCiaUnica(dblcCia, edtCia);
         edtPeriodo.text := copy(datetostr(dbdtpFComp.date), 7, 4)
            + copy(datetostr(dbdtpFComp.date), 4, 2);
         If dblccia.text <> '' Then
            perform(CM_DialogKey, VK_TAB, 0);
        //fin de codigo nuevo
      End;
   End;

   dblcCiaExit(sender);
   //**
   // buscar en Proveedores Notificados por SUNAT
   ProveedoresNotificados;

   lblSujetoRetencion.visible := ((DMTE.DisplayDescrip('prvTGE', 'CNT201', 'PROVRETIGV',
      'CLAUXID = ''' +
      dblcClase.text
      + ''' AND AUXID=''' + dblcdAux.Text + '''', 'PROVRETIGV') = 'S') And (wCiaRetIGV));

   cf1.PonerExits;
End;

Procedure TFRendicionCaja.dblcClaseExit(Sender: TObject);
Var
   xSQLx: String;
Begin

   edtClase.text := DMTE.DisplayDescripLocal(DMTE.cdsClaseAux, 'CLAUXID', dblcClase.Text, 'CLAUXDES');

   If edtClase.Text = '' Then
   Begin
      dblcdAux.Text := '';
      edtAuxRUC.Text := '';
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
   dblcdAux.Selected.Add('AUXID'#9'13'#9'Auxiliar'#9'F');
   dblcdAux.Selected.Add('AUXRUC'#9'13'#9'R.U.C'#9'F');
   dblcdAux.Selected.Add('AUXABR'#9'15'#9'Abreviatura'#9'F');
   dblcdAux.Selected.Add('AUXNOMB'#9'20'#9'Nombre Auxiliar'#9'F');

   BuscaNReposicion;
End;

Procedure TFRendicionCaja.dblcdAuxExit(Sender: TObject);
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
      dbeGiradoA.Text := '';
      ShowMessage('Error : Auxiliar No Valido');
      dblcdAux.SetFocus;
      Exit;
   End;

   If DMTE.cdsAux.FieldByName('AUXGIRA').AsString = '' Then
   Begin
      dbeGiradoA.Text := DMTE.cdsAux.FieldByName('AUXNOMB').Asstring;
      edtAuxNombre.text := DMTE.cdsAux.FieldByName('AUXNOMB').Asstring;
   End
   Else
   Begin
      dbeGiradoA.Text := DMTE.cdsAux.FieldByName('AUXGIRA').Asstring;
      edtAuxNombre.text := DMTE.cdsAux.FieldByName('AUXNOMB').Asstring;
   End;

   lblSujetoRetencion.visible := ((DMTE.DisplayDescrip('prvTGE', 'CNT201', 'PROVRETIGV',
      'CLAUXID = ''' + dblcClase.text + ''' AND AUXID=''' + dblcdAux.Text + '''', 'PROVRETIGV') = 'S') And (wCiaRetIGV));
   edtAuxRuc.Text := DMTE.cdsAux.FieldByName('AUXRUC').Asstring;
   // buscar en Proveedores Notificados por SUNAT
   ProveedoresNotificados;
End;

Procedure TFRendicionCaja.ProveedoresNotificados;
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

Procedure TFRendicionCaja.AdicIniciaDatos;
Begin
   RecuperarCiaUnica(dblcCia, edtCia);
   edtPeriodo.text := copy(datetostr(dbdtpFComp.date), 7, 4)
      + copy(datetostr(dbdtpFComp.date), 4, 2);
   If dblccia.text <> '' Then
      perform(CM_DialogKey, VK_TAB, 0);

End;

Procedure TFRendicionCaja.ActualizaSaldosCaja;
Begin
   If trim(dblcCCBco.TEXT) <> '' Then
   Begin
      DMTE.ActSdoTlfn(dblcCia.Text, dblcBanco.text, dblcCCBCo.Text,
         DMTE.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
         DBDTPfcOMP.DATE);
      DMTE.ActSdoMen(dblcBanco.text, dblcCCBCo.Text,
         DMTE.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
         DBDTPfcOMP.DATE);
   End;
End;

Procedure TFRendicionCaja.ConfiguraAccesos;
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

Procedure TFRendicionCaja.Libera_Admin;
Begin
   Pon(A1, A2, pnlBotones);
End;

Procedure TFRendicionCaja.Libera_Consul;
Begin

End;

Procedure TFRendicionCaja.Proc_Admin;
Var
   Contador: Integer;
Begin
   pnlCabecera1.Enabled := False;
   pnlCabecera2.Enabled := False;
   pnlDeTPago.Enabled := False;
   Contador := BotonesEnPanel(pnlBotones);
   setlength(A1, Contador);
   setlength(A2, Contador);
   Quita(A1, A2, pnlBotones);

   pnlBotones.Enabled := True;
End;

Procedure TFRendicionCaja.Proc_Consul;
Begin
   pnlCabecera1.Enabled := False;
   pnlCabecera2.Enabled := False;
   pnlDeTPago.Enabled := True;
   pnlBotones.Enabled := False;
End;

Procedure TFRendicionCaja.LibConfigAccesos;
Begin
   If DMTE.wAdmin = 'G' Then
      Libera_Admin
   Else
   Begin
      If DMTE.wModo = 'C' Then
         Libera_Consul;
   End;

End;

Procedure TFRendicionCaja.Z2bbtnEmiChqClick(Sender: TObject);
Var
   strChq: structChq;
   xSQL, ArchivoReporte: String;
   xTotal: double;
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

   If trim(dblcCCBco.Text) <> '' Then
   Begin
      //para validar que no se reimprima el chq

      /////////////////////////////////////////
      xTotal := 0;
      xSQL := 'Select SUM( MTORETLOC ) RETLOC, SUM( MTORETEXT ) RETEXT '
            + '  from CNT320 '
            + ' WHERE CIAID=''' + DMTE.cdsEgrcaja.FieldByName('CIAID').AsString + ''' AND '
            + '       ANOMM=''' + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' AND '
            + '       TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' AND '
            + '       ECNOCOMP=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' AND '
            + '     ( DOCID2 IS NULL OR DOCID2='''' ) ';
      DMTE.cdsQry4.IndexFieldNames := '';
      DMTE.cdsQry4.Filter := '';
      DMTE.cdsQry4.Filtered := False;
      DMTE.cdsQry4.Close;
      DMTE.cdsQry4.Datarequest(xSQL);
      DMTE.cdsQry4.Open;

      If dblcTMon.Text = DMTE.wTMonLoc Then
         xTotal := DMTE.FRound(strtoFloat(dbeImporte.Text) - DMTE.cdsQry4.FieldByName('RETLOC').AsFloat, 15, 2)
      Else
         If dblcTMon.Text = DMTE.wTMonExt Then
            xTotal := DMTE.FRound(strtoFloat(dbeImporte.Text) - DMTE.cdsQry4.FieldByName('RETEXT').AsFloat, 15, 2);

      xSQL := ' CIAID=''' + dblcCia.text + ''' and '
         + ' TDIARID=''' + dblcTDiario.text + ''' and '
         + ' ECANOMM=''' + edtPeriodo.text + ''' and '
         + ' ECNOCOMP=''' + dbeNoComp.text + ''' ';
      If DMTE.DisplayDescrip('prvSQL', 'CAJA302', 'ECCHQEMI', xSQL, 'ECCHQEMI') <> 'S' Then
      //**
      Begin
         DMTE.RecuperarDatos('TGE106', '*', 'BANCOID = ''' + dblcBanco.text + ''' AND CCBCOID = ''' + dblcCCBco.Text + '''');
         ArchivoReporte := DMTE.cdsRec.FieldByName('CCFMTCHQ').ASString;
         If ArchivoReporte = '' Then
            ArchivoReporte := 'ChqDefault.rtm';
         With strChq Do
         Begin
            ppFileName := ArchivoReporte;
            ppGiradoA := dbeGiradoA.Text;

            ppImporte := floattostrf(strtocurr(trim(Floattostr(xTotal))), fffixed, 10, 2);
            ppMontoLetras := strNum(strtofloat(ppImporte));
            ppDia := strDia(dbdtpFEmis.Date);
            ppmes := strMes(dbdtpFEmis.Date);
            ppAno := strAno(dbdtpFEmis.Date);
            If dblcCCBco.Text <> '0100001518' Then
               ppRuc := 'RUC :' + xRUCCIA;
         End;

         DMTE.xFlagP := False;
         FRegistro.EmiteChq(ArchivoReporte, strChq);
         If DMTE.xFlagP Then
         Begin
            xSQL := 'UPDATE CAJA302 SET ECCHQEMI=''S'' '
                  + ' WHERE CIAID=''' + dblcCia.text + ''' and '
                  + '       TDIARID=''' + dblcTDiario.text + ''' and '
                  + '       ECANOMM=''' + edtPeriodo.text + ''' and '
                  + '       ECNOCOMP=''' + dbeNoComp.text + ''' ';
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

Procedure TFRendicionCaja.dbeTCambioEnter(Sender: TObject);
Begin
   strTmp := TCustomEdit(Sender).Text;
End;

Procedure TFRendicionCaja.dbeImporteEnter(Sender: TObject);
Begin
   strTmp := TCustomEdit(Sender).Text;
End;

Procedure TFRendicionCaja.dbeTCambioExit(Sender: TObject);
Begin
   If strTmp <> dbeTCambio.text Then
   Begin
      dbeTcambio.text := CajaDec(dbeTCambio.text, 4);
   End;
End;

Procedure TFRendicionCaja.dbeImporteExit(Sender: TObject);
Begin
   If strTmp <> TCustomEdit(Sender).text Then
   Begin
      TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text);
   End;
End;

Procedure TFRendicionCaja.RecCptosDifC;
Begin
   If trim(dblcCCBco.Text) = '' Then
   Begin
      If Not DMTE.RecuperarDatos('TGE105', 'CPTODIFG,CPTODIFP,CTADIFG,CTADIFP,CCOSDIF', 'BANCOID=''' + dblcBanco.Text + '''') Then
         Raise Exception.create('No se puede Contabilizar ' + #13 +
            'Falta Definir las Cuentas de Dif. de Cambio');
   End
   Else
   Begin
      If Not DMTE.RecuperarDatos('TGE106', 'CPTODIFG,CPTODIFP,CTADIFG,CTADIFP,CCOSDIF', 'BANCOID=''' + dblcBanco.Text +
         ''' AND CCBCOID=''' + dblcCCBco.Text + '''') Then
         Raise Exception.create('No se puede Contabilizar ' + #13 +
            'Falta Definir las Cuentas de Dif. de Cambio');
   End;
   wCptoGan := DMTE.cdsRec.FieldByName('CPTODIFG').AsString;
   wCptoPer := DMTE.cdsRec.FieldByName('CPTODIFP').AsString;
   wCtaGan := DMTE.cdsRec.FieldByName('CTADIFG').AsString;
   wCtaPer := DMTE.cdsRec.FieldByName('CTADIFP').AsString;
   wCCosDif := DMTE.cdsRec.FieldByName('CCOSDIF').AsString;
End;

Procedure TFRendicionCaja.dblcdAuxExit2(Sender: TObject);
Var
   xAuxd: String;
Begin
   If z2bbtnCancel3.Focused Then Exit;
   If dblcClaseDet.Focused Then Exit;

   dbeAuxDet.Text := DMTE.DisplayDescripLocal(DMTE.cdsProv, 'AUXID', dblcdAuxDet.Text, 'AUXNOMB');

   If dbeAuxDet.Text = '' Then
   Begin
      ShowMessage('Error : Auxiliar no Existe');
      dblcdAuxDet.SetFocus;
   End;
End;

Procedure TFRendicionCaja.dblcdCnp2Exit2(Sender: TObject);
Var
   ssql, xwhere: String;
Begin
   If z2bbtnCancel3.Focused Then Exit;

   If edtCnp2.text = '' Then
      edtCnp2.text := DMTE.DisplayDescripLocal(DMTE.cdsCptos, 'CPTOID', dblcdCnp2.Text, 'CPTODES')
   Else
      DMTE.DisplayDescripLocal(DMTE.cdsCptos, 'CPTOID', dblcdCnp2.Text, 'CPTODES');

   If edtCnp2.Text = '' Then
   Begin
      DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString := '';
      dblcdAuxDet.Enabled := False;
      dblcdCCosto.Enabled := False;
      ShowMessage('Error : Concepto no Valido');
      dblcdCnp2.SetFocus;
      Exit;
   End;

   DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString := DMTE.cdsCptos.FieldByname('CUENTAID').AsString;

   xWhere := 'CIAID=''' + dblcCia.Text + ''' AND CUENTAID=''' + DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString + '''';

   DMTE.DisplayDescrip('prvTGE', 'TGE202', 'CUENTAID, CTA_CCOS, CTA_AUX', xWhere, 'CuentaId');

   If DMTE.cdsQry.FieldByName('CTA_AUX').asString = 'S' Then
   Begin
      dblcdAuxDet.Enabled := True;
      dblcClaseDet.Enabled := True;

   End
   Else
   Begin
      dblcdAuxDet.Enabled := False;
      dblcClaseDet.Enabled := False;
      DMTE.cdsRegCxP.FieldByName('PROV').AsString := '';
      DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString := '';

      edtClaseDet.TEXT := '';
      dbeAuxDet.TEXT := '';

   End;

   If DMTE.cdsQry.FieldByName('CTA_CCOS').AsString = 'S' Then
   Begin
      dblcdCCosto.Enabled := true;
   End
   Else
   Begin
      dblcdCCosto.Enabled := False;
      DMTE.cdsRegCxP.FieldByName('CCOSID').AsString := '';
   End;

   edtCnp2.SetFocus;
End;

Procedure TFRendicionCaja.wwDBEdit1Change22(Sender: TObject);
Begin
   wModifica := True;
End;

Procedure TFRendicionCaja.dblcClaseDetExit(Sender: TObject);
Var
   Tmp, sSQL: String;
Begin
   If z2bbtnCancel3.Focused Then Exit;
   If dblcdCnp2.Focused Then Exit;

   edtClaseDet.text := DMTE.DisplayDescripLocal(DMTE.cdsClaseAux, 'CLAUXID', dblcClaseDet.Text, 'CLAUXDES');

   If (dblcClaseDet.Text = '') And (edtClaseDet.text <> '') Then
   Begin
      ShowMessage('Clase de Auxiliar no Existe');
      dblcdAuxDet.Text := '';
      dbeAuxDet.Text := '';
      dblcClaseDet.SetFocus;
   End;

   sSQL := 'Select * from CNT201 Where CLAUXID=''' + dblcClaseDet.Text + ''' and ACTIVO=''S''';
   DMTE.cdsProv.Close;
   DMTE.cdsProv.DataRequest(sSQL);
   DMTE.cdsProv.Open;
End;

Procedure TFRendicionCaja.FormDestroy(Sender: TObject);
Begin
   cf1.Free;
End;

Procedure TFRendicionCaja.dblcdFEfecExit(Sender: TObject);
Begin
//Validacion
   If trim(TCustomEdit(Sender).Text) <> strTmp Then
   Begin
      If trim(TCustomEdit(Sender).Text) <> '' Then
      Begin
         If DMTE.RecuperarDatos('TGE217', 'FLUEFEABR', 'FLUEFEID=''' + TCustomEdit(Sender).Text + ''' ') Then
         Begin
            dbeFEfec.Text := DMTE.cdsRec.FieldByName('FLUEFEABR').AsString;
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

Procedure TFRendicionCaja.dblcdFEfecEnter(Sender: TObject);
Begin
   strTmp := dblcdFEfec.Text;
End;

Procedure TFRendicionCaja.ActualizaFiltro;
Begin

   If z2bbtnNuevo.Visible Then
   Begin
      If Not xGraboNuevo Then
         cdsFiltro.append;
      DMTE.ActualizaCDS(DMTE.cdsEgrCaja, cdsFiltro);
   End
   Else
   Begin
      DMTE.ActualizaCDS(DMTE.cdsEgrCaja, cdsFiltro);
   End;
   xGraboNuevo := True;

End;

Function TFRendicionCaja.ExisteRxH: boolean;
Begin
   result := false;
   If dblcTDoc.text = wTDocRxH Then
      result := true;
End;

Procedure TFRendicionCaja.ActualizaSaldosTGE401(ccPgoOri, ccPgoLoc, ccPgoExt: double; sSigno: String);
Var
   xAno,
      xMes: String;
   xDatAux: StructSaldosAux;

Begin
   With xDatAux Do
   Begin
      CIAID := dblcCia.Text;
      CLAUXID := dblcClase.Text;
      AUXID := dblcdAux.Text;
      MONTOMN := floattostr(ccPgoLoc);
      If trim(MONTOMN) = '' Then
         MONTOMN := '0';

      MONTOME := floattostr(ccPgoExt);
      If trim(MONTOME) = '' Then
         MONTOME := '0';

      FECHA := dbdtpFComp.date;
      If trim(MTOSLOC) = '' Then
         MTOSLOC := '0';

      If trim(MTOSEXT) = '' Then
         MTOSEXT := '0';

      xMes := strMes(xDatAux.FECHA);
      xAno := strAno(xDatAux.FECHA);
      DMTE.ActSdoAuxiliar(xDatAux.CIAID, xANO, xMES, xDatAux.CLAUXID, xDatAux.AUXID,
         xDatAux.MONTOMN, xDatAux.MONTOME, xDatAux.MTOSLOC, xDatAux.MTOSEXT, sSigno);
   End;
End;

Procedure TFRendicionCaja.BuscaNReposicion;
Var
   ssql: String;
Begin

   If dbeRepo.Text <> '' Then Exit;

   // RESPFF   : Rendicion de Cuenta
   // CLAUXFF  : Fondo Fijo
   sSQL := 'Select CLAUXID, CLAUXDES, RESPFF,CLAUXFF from TGE102 where CLAUXID=' + QuotedStr(dblcClase.text);
   DMTE.cdsQry2.Close;
   DMTE.cdsQry2.DataRequest(ssql);
   DMTE.cdsQry2.open;

   If DMTE.cdsQry2.FieldByName('RESPFF').AsString = 'S' Then
   Begin
      sSQL := 'SELECT substr(' + DMTE.wReplacCeros + '(SUBSTR(''000000'',1,6-LENGTH(RTRIM(TO_CHAR(MAX(TO_NUMBER(ECNOREPO))+1))))'
             +      ' ||(TO_CHAR(MAX(TO_NUMBER(ECNOREPO))+1)),''000001''  ),1,6) AS REPO '
             +'  FROM CAJA302'
             +' WHERE ( NVL(ECNOREPO,''NULO'')<>''NULO'') '
             +'   AND CIAID=' + QuotedStr(dblcCia.text);

      DMTE.cdsQry2.Close;
      DMTE.cdsQry2.DataRequest(ssql);
      DMTE.cdsQry2.open;
      dbeRepo.Text := DMTE.cdsQry2.FieldByName('REPO').AsString; //xNumReg;
   End
   Else
      dbeRepo.Text := '';
End;

Procedure TFRendicionCaja.dblcdCnpExit(Sender: TObject);
Var
   xSql: String;
Begin
   If z2bbtnCancel.Focused Then Exit;
   If dbeLote.Focused Then Exit;

   dbeGlosa.Text := DMTE.DisplayDescripLocal(DMTE.cdsCptos, 'CPTOID', dblcdCnp.Text, 'CPTODES');
   //flag de detraccion
   xDetraccion := DMTE.DisplayDescripLocal(DMTE.cdsCptos, 'CPTOID', dblcdCnp.Text, 'FCTZ');

   If dbeGlosa.Text = '' Then
   Begin
      ShowMessage('Error : Concepto no Válido');
      dblcdCnp.SetFocus;
   End;
End;

// para validar que no se duplique el # chq

Procedure TFRendicionCaja.dbeNoChqExit(Sender: TObject);
Var
   xSql: String;
Begin
   xSql := 'CIAID=' + QuotedStr(dblcCia.text) + ' AND TDIARID=' + QuotedStr(dblcTDiario.text)
         + ' AND ECNOCOMP<>' + QuotedStr(dbeNoComp.Text) + ' and '
         + 'CCBCOID=' + QuotedStr(dblcCCBco.Text) + ' AND ECNOCHQ=' + QuotedStr(dbeNoChq.text);
   DMTE.DisplayDescrip('prvTGE', 'CAJA302', 'ECNOCHQ,ECESTADO,ECELABO', xSQL, 'ECNOCHQ');
   If DMTE.cdsQry.FieldByName('ECNOCHQ').AsString <> '' Then
   Begin
      If DMTE.cdsQry.FieldByName('ECESTADO').AsString <> 'A' Then
      Begin
         showmessage('El número de Cheque ya fué Utilizado');
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
//**

Procedure TFRendicionCaja.dblcdCCostoExit(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'CCOSID=' + QuotedStr(dblcdCCosto.Text) + ' and CCOSMOV=''S'' AND CCOSACT=''S'' '
         + ' and CCOSCIAS LIKE (' + quotedstr('%' + dblcCia.Text + '%') + ' ) ';
   dbeCCos.text := DMTE.DisplayDescrip('prvTGE', 'TGE203', 'CCOSDES', xSQL, 'CCOSDES');
   If (dblcdCCosto.Text <> '') And (dbeCCos.text = '') Then
   Begin
      ShowMessage('Centro de Costo no Existe. Verifique...');
      DMTE.cdsRegCxP.FieldByName('CCOSID').AsString := '';
      Exit;
   End;
   fg_ObtieneCtaporCentroCosto(dblcdCCosto.Text);
End;

Procedure TFRendicionCaja.dblcdAuxDetEnter(Sender: TObject);
Begin
   If dblcClaseDet.Text = '' Then
      dblcClaseDet.SetFocus;
End;

Procedure TFRendicionCaja.Z2bbtnRetencionClick(Sender: TObject);
Var
   xSQL: String;
   x10: Integer;
Begin
   xSQL := 'Select A.*, C.DOCABR DOCDESC, B.AUXNOMB, D.CIADES, D.CIARUC '
         + '  from CNT320 A, CNT201 B, TGE110 C, TGE101 D '
         + ' WHERE A.CIAID=''' + DMTE.cdsEgrCaja.FieldByName('CIAID').AsString + ''' AND '
         + '       A.ANOMM=''' + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' AND '
         + '       A.TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' AND '
         + '       A.ECNOCOMP=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' '
         + '   AND A.CLAUXID=B.CLAUXID AND A.AUXID=B.AUXID '
         + '   AND C.DOCMOD=''CXP'' AND C.DOCID=A.DOCID '
         + '   AND D.CIAID=A.CIAID '
         + ' ORDER BY A.CLAUXID, A.AUXID';
   DMTE.cdsRetencion.Close;
   DMTE.cdsRetencion.Datarequest(xSQL);
   DMTE.cdsRetencion.Open;

   If DMTE.cdsRetencion.RecordCount <= 0 Then
   Begin
      ShowMessage('No Existe Retención');
      Exit;
   End;

   pprRetencion.TEMPLATE.FileName := DMTE.wRutaCNT + '\Retenciones.rtm';

   pprRetencion.template.LoadFromFile;

   If cbDisenoRep.Enabled Then
      ppd1.ShowModal
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
   End;
End;

Procedure TFRendicionCaja.dblcdCnpKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   DMTE.cdsCptos.indexFieldNames := 'CPTODES';
End;

Procedure TFRendicionCaja.GrabaCabeceraDeComprobante;
Var
   xSQL: String;
Begin
   DMTE.cdsEgrCaja.Insert;
   DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'X';
   DMTE.cdsEgrCaja.FieldByName('CIAID').AsString := dblcCia.Text;
   DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString := edtPeriodo.Text;
   DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString := dblcTDiario.Text;
   DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString := dbeNoComp.Text;

   DMTE.cdsEgrCaja.Post;
   xSQL := 'Insert into CAJA302(CIAID, ECANOMM, TDIARID, ECNOCOMP, ECESTADO,KEYVALE) '
      + ' Values ( ' + quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) + ','
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ','
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ','
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString) + ','
      + quotedstr(DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString) + ','
      + quotedstr(sKeyVale)+')';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error al intentar grabar la cabecera del Egreso en forma Temporal');
      xSigueGrab := False;
      Exit;
   End;
End;

Function TFRendicionCaja.GeneraRetencion: boolean;
Var
   sSQL: String;
Begin
   If lblSujetoRetencion.visible Then
   Begin

   End;
End;

Procedure TFRendicionCaja.Contab_DocPago_Retencion_Haber;
Begin
   DMTE.cdsCntCaja.FieldByName('CIAID').AsString := DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
   DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
   DMTE.cdsCntCaja.FieldByName('DOCID').AsString := DMTE.cdsRegCxP.FieldByName('DOCID2').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString := DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString;
   DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime := DMTE.cdsRegCxP.FieldByName('CPFVCMTO').AsDateTime;

   DMTE.cdsCntCaja.FieldByName('CPTOID').AsString := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTOID,CPTODES,CUENTAID', 'CPTOIS=''T''', 'CPTOID');
   DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString := DMTE.cdsQry.FieldByName('CUENTAID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString;

   DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('PROV').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'H';
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
   DMTE.cdsCntCaja.FieldByName('TMONID').AsString := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;

   DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := xRetLoc;
   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xRetExt;
   If dblcTMon.Text = DMTE.wTMonLoc Then
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xRetLoc
   Else
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xRetExt;

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
   DMTE.cdsCntCaja.FieldByName('NREG').AsInteger := xNReg;
End;

Procedure TFRendicionCaja.Z2bbtChqVouchClick(Sender: TObject);
Var
   strChq: structChq;
   xSQL, xWhere, ArchivoReporte: String;
   xTotal: double;
Begin
   xWhere := ' CIAID=' + QuotedStr(dblcCia.text)
           + ' AND BANCOID=' + Quotedstr(dblcBanco.Text)
           + ' AND CCBCOID=' + QuotedStr(dblcCCBco.text);
   DMTE.DisplayDescrip('prvQry2', 'TGE106', 'CHQVOUCH', xWhere, 'CHQVOUCH');
   If DMTE.cdsQry.FieldByName('CHQVOUCH').AsString <> 'S' Then
      Raise Exception.Create('Esta Cta.Cte no genera Cheque Voucher');

   If DMTE.cdsEgrcaja.FieldByName('ECESTADO').AsString = 'A' Then
      Raise Exception.Create('El Comprobante se encuentra Anulado');

   If DMTE.cdsEgrcaja.FieldByName('ECESTADO').AsString <> 'C' Then
      Raise Exception.Create('Debe Cancelar el Comprobante primero');

   If trim(dblcCCBco.Text) <> '' Then
   Begin
      xTotal := 0;
      xSQL := 'Select SUM( MTORETLOC ) RETLOC, SUM( MTORETEXT ) RETEXT '
            + '  from CNT320 '
            + ' WHERE CIAID=''' + DMTE.cdsEgrcaja.FieldByName('CIAID').AsString + ''' AND '
            + '       ANOMM=''' + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString + ''' AND '
            + '       TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString + ''' AND '
            + '       ECNOCOMP=''' + DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString + ''' AND '
            + '     ( DOCID2 IS NULL OR DOCID2='''' ) ';
      DMTE.cdsQry4.Close;
      DMTE.cdsQry4.Datarequest(xSQL);
      DMTE.cdsQry4.Open;

      If dblcTMon.Text = DMTE.wTMonLoc Then
         xTotal := DMTE.FRound(strtoFloat(dbeImporte.Text) - DMTE.cdsQry4.FieldByName('RETLOC').AsFloat, 15, 2)
      Else
         If dblcTMon.Text = DMTE.wTMonExt Then
            xTotal := DMTE.FRound(strtoFloat(dbeImporte.Text) - DMTE.cdsQry4.FieldByName('RETEXT').AsFloat, 15, 2);

      xSQL := 'CIAID=''' + dblcCia.text + ''' and '
            + 'TDIARID=''' + dblcTDiario.text + ''' and '
            + 'ECANOMM=''' + edtPeriodo.text + ''' and '
            + 'ECNOCOMP=''' + dbeNoComp.text + ''' ';
      If DMTE.DisplayDescrip('prvSQL', 'CAJA302', 'ECCHQEMI', xSQL, 'ECCHQEMI') <> 'S' Then
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
         pprChqVouch.Print;

         DMTE.xFlagP := False;
         If DMTE.xFlagP Then
         Begin
            xSQL := 'Update CAJA302 '
               + '   set ECCHQEMI=''S'' '
               + ' where CIAID=' + quotedstr(dblcCia.text)
               + '   and TDIARID=' + quotedstr(dblcTDiario.text)
               + '   and ECANOMM=' + quotedstr(edtPeriodo.text)
               + '   and ECNOCOMP=' + quotedstr(dbeNoComp.text);
            Try
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            Except
               ShowMessage('No se pudo actualizar marca de Emisión del Cheque');
               Exit;
            End;
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

Procedure TFRendicionCaja.GeneraRegChqVouch;
Var
   xCuentaId, xSQL, xWhere: String;
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

   xSQL := 'SELECT A.* ,0.00 DEBE,0.00 HABER FROM CAJA304 A  '
         + ' WHERE ( A.CIAID=' + QuotedStr('XY') + ' AND '
         + '       A.ECANOMM=' + QuotedStr('190001') + ' ) ';
   DMTE.cdsTrans.IndexFieldNames := '';
   DMTE.cdsTrans.Filter := '';
   DMTE.cdsTrans.Filtered := False;
   DMTE.cdsTrans.Close;
   DMTE.cdsTrans.DataRequest(xSQL);
   DMTE.cdsTrans.Open;
   DMTE.cdsTrans.EmptyDataSet;

   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' Then
   Begin
      xSQL := 'SELECT A.*, B.CIADES FROM CAJA304 A, TGE101 B  '
         + ' WHERE ( A.CIAID=' + QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString) + ' AND '
         + '       A.ECANOMM=' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND '
         + '       A.TDIARID=' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND '
         + '       A.ECNOCOMP=' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString) + ' AND '
         + '       A.CIAID=B.CIAID ) ';
      DMTE.cdsCntCaja.Close;
      DMTE.cdsCntCaja.DataRequest(xSQL);
      DMTE.cdsCntCaja.Open;
   End;

   xNReg := 0;
   xMto := 0;
   xbEof := False;

   DMTE.cdsCntCaja.IndexFieldNames := 'CUENTAID';
   DMTE.cdsCntCaja.First;
   xCuentaId := DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString;
   While Not DMTE.cdsCntCaja.Eof Do
   Begin
      xMTOCHQLOC := DMTE.FRound(xMTOCHQLOC + DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat, 15, 2);
      xMTOCHQEXT := DMTE.FRound(xMTOCHQEXT + DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat, 15, 2);

      DMTE.cdsCntCaja.Next;
      xbEof := DMTE.cdsCntCaja.Eof;

      If (DMTE.cdsCntCaja.Eof) Or (xCuentaId <> DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString) Then
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

         If DMTE.xSRV_RUTA = '\\APLICACIONES\SOLAPLI' Then
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
         DMTE.cdsTrans.FieldByName('NREG').AsInteger := xNReg;
         If xbEof Then
            DMTE.cdsCntCaja.Last
         Else
            DMTE.cdsCntCaja.Next;
         xMTOCHQEXT := 0;
         xMTOCHQLOC := 0;
         xCuentaId := DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString;

      End;
   End;
   DMTE.cdsTrans.Post;
   DMTE.cdsTrans.Filter := 'DEBE>0 OR HABER>0';
   DMTE.cdsTrans.Filtered := True;
   DMTE.cdsCntCaja.IndexFieldNames := '';

End;

Procedure TFRendicionCaja.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRendicionCaja.dblcBancoNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRendicionCaja.dblcCCBcoNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFRendicionCaja.bbtnCHClick(Sender: TObject);
Begin

   If DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' Then
   Begin
      dbeCH.Text := DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString;
      pnlCH.Visible := True;
   End;

End;

Procedure TFRendicionCaja.bbtnGraClick(Sender: TObject);
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

Procedure TFRendicionCaja.bbtnCanCHClick(Sender: TObject);
Begin
   pnlCH.Visible := False;
End;

Procedure TFRendicionCaja.fg_ObtieneCtaporCentroCosto(wgCentroCosto: String);
Var
   xsSql: String;
Begin
   xsSql := ' SELECT CUENTAID '
          + '   FROM TGE203 '
          + '  WHERE NOT CIADEST IS NULL '
          + '    AND NOT CUENTAID IS NULL AND CCOSID = ' + QuotedStr(wgCentroCosto);
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;
   If DMTE.cdsQry.RecordCount > 0 Then
   Begin
      DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString := DMTE.cdsQry.FieldByName('CUENTAID').AsString;
   End
   Else
   Begin
      xsSql := ' SELECT CUENTAID '
             + '   FROM CAJA201 '
             + '  WHERE CPTOIS = ' + QuotedStr('E')
             + '    AND CPTOID = ' + QuotedStr(dblcdCnp2.Text);
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest(xsSql);
      DMTE.cdsQry.Open;
      DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString := DMTE.cdsQry.FieldByName('CUENTAID').AsString;
   End;

End;

Procedure TFRendicionCaja.fg_ContabFilial(wgCia, wgPeriodo, wgDiario, wgNumComprob: String);
Var
   xsSql: String;
   xsDiarioDes, xsDocDes: String;
   xsCuenta, xsCuentaDes: String;
   xsCCostoDes: String;
   xnRegistro: Integer;
   xsNumComprobFilial: String;
   xsCCosto, xsCuentaReqCCosto: String;
Begin
// eliminamos lo registrado anteriormente
   fg_EliminarContaFilial(wgCia, wgDiario, wgPeriodo, wgNumComprob);
   If Not xSigueGrab Then exit;

// listamos las cias donde se generarán los asientos contables
   xsSql := ' SELECT distinct TGE203.CIADEST '
      + '   FROM CAJA304, TGE203 '
      + '  WHERE CAJA304.CCOSID = TGE203.CCOSID '
      + '    AND NVL(TGE203.CIADEST,' + QuotedStr('XX') + ') NOT IN (' + QuotedStr('02') + ',' + QuotedStr('XX') + ') '
      + '    AND CAJA304.CIAID = ' + QuotedStr(wgCia)
      + '    AND CAJA304.TDIARID = ' + QuotedStr(wgDiario)
      + '    AND CAJA304.ECANOMM = ' + QuotedStr(wgPeriodo)
      + '    AND CAJA304.ECNOCOMP = ' + QuotedStr(wgNumComprob);
   DMTE.cdsCiaFilial.Close;
   DMTE.cdsCiaFilial.DataRequest(xsSql);
   DMTE.cdsCiaFilial.Open;
   While Not DMTE.cdsCiaFilial.Eof Do
   Begin
      xsNumComprobFilial := fg_ObtieneNumComprob(DMTE.cdsCiaFilial.FieldByName('CIADEST').AsString,
         wgPeriodo, wgDiario);
      xsDiarioDes := DMTE.DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', 'TDIARID = ' + QuotedStr(wgDiario), 'TDIARDES');
      xsDocDes := '';
      xnRegistro := 0;
      //Insertamos al cnt311
      xsSql := ' SELECT CAJA304.* '
             + '   FROM CAJA304, TGE203 '
             + '  WHERE CAJA304.CCOSID = TGE203.CCOSID '
             + '    AND NVL(TGE203.CIADEST,' + QuotedStr('XX') + ') NOT IN (' + QuotedStr('02') + ',' + QuotedStr('XX') + ') '
             + '    AND TGE203.CIADEST = ' + QuotedStr(DMTE.cdsCiaFilial.FieldByName('CIADEST').AsString)
             + '    AND CAJA304.CIAID = ' + QuotedStr(wgCia)
             + '    AND CAJA304.TDIARID = ' + QuotedStr(wgDiario)
             + '    AND CAJA304.ECANOMM = ' + QuotedStr(wgPeriodo)
             + '    AND CAJA304.ECNOCOMP = ' + QuotedStr(wgNumComprob);
      DMTE.cdsCaja304.Close;
      DMTE.cdsCaja304.DataRequest(xsSql);
      DMTE.cdsCaja304.Open;
      While Not DMTE.cdsCaja304.Eof Do
      Begin
         xnRegistro := xnRegistro + 1;
         xsCuenta := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CUENTAID', 'CPTOID = ' + QuotedStr(DMTE.cdsCaja304.FieldByName('CPTOID').AsString), 'CUENTAID');
         xsCuentaDes := DMTE.DisplayDescrip('prvTGE', 'TGE202', 'CTADES,CTA_CCOS',
            'CIAID = ' + QuotedStr(DMTE.cdsCiaFilial.FieldByName('CIADEST').AsString) + ' AND CUENTAID = ' + QuotedStr(xsCuenta), 'CTADES');
         xsCuentaReqCCosto := DMTE.cdsQry.FieldByName('CTA_CCOS').AsString;
         If xsCuentaReqCCosto = 'S' Then
         Begin
            xsCCosto := DMTE.cdsCaja304.FieldByName('CCOSID').AsString;
            xsSql := ' CCOSID=' + QuotedStr(DMTE.cdsCaja304.FieldByName('CCOSID').AsString)
               + ' AND CCOSMOV=' + QuotedStr('S')
               + ' AND CCOSACT=' + QuotedStr('S')
               + ' AND CCOSCIAS LIKE (' + quotedstr('%' + DMTE.cdsCiaFilial.FieldByName('CIADEST').AsString + '%') + ' ) ';
            xsCCostoDes := DMTE.DisplayDescrip('prvTGE', 'TGE203', 'SUBSTR(CCOSDES,1,15) CCOSDES', xsSql, 'CCOSDES');
         End
         Else
         Begin
            xsCCosto := '';
            xsCCostoDes := '';
         End;

         xsSql := ' INSERT INTO CNT311 (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,CLAUXID,AUXID, '
                + '                     DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC, '
                + '                     CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,CNTCUADRE,CNTFAUTOM,CNTUSER, '
                + '                     CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS, '
                + '                     TMONID,FLAGVAR,FCONS,CNTFMEC,TDIARDES,CTADES,AUXDES,DOCDES,CCOSDES,CNTDEBEMN, '
                + '                     CNTDEBEME,CNTHABEMN,CNTHABEME,CNTSALDMN,CNTSALDME,CAMPOVAR,CNTTS,CNTPAGADO, '
                + '                     CNTMODDOC,CNTREG,MODULO,CTA_SECU) '
                + ' VALUES (' + QuotedStr(DMTE.cdsCiaFilial.FieldByName('CIADEST').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('TDIARID').AsString) + ', '
                              + QuotedStr(xsNumComprobFilial) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCANO').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('ECANOMM').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCLOTE').AsString) + ', '
                              + QuotedStr(xsCuenta) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('CLAUXID').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCAUXID').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DOCID').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCSERIE').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCNODOC').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCGLOSA').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCDH').AsString) + ', '
                              + QuotedStr(xsCCosto) + ', '
                              + DMTE.cdsCaja304.FieldByName('DCTCAMPR').AsString + ', '
                              + DMTE.cdsCaja304.FieldByName('DCMTOORI').AsString + ', '
                              + DMTE.cdsCaja304.FieldByName('DCMTOLO').AsString + ', '
                              + DMTE.cdsCaja304.FieldByName('DCMTOEXT').AsString + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCFEMIS').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCFVCMTO').AsString) + ', '
                            //Inicio HPC_201401_CAJA
                            //+ QuotedStr(DMTE.cdsCaja304.FieldByName('DCFEMIS').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('ECFCOMP').AsString)+','
                            //Final HPC_201401_CAJA
                              + QuotedStr('I') + ', ' + QuotedStr('N') + ',' + QuotedStr('N') + ',USER, '
                              + ' SYSDATE,SYSDATE,'
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCMM').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCDD').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCTRI').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCSEM').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCSS').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCAATRI').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCAASEM').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DCAASS').AsString) + ', '
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('TMONID').AsString) + ', '
                              + ' NULL, NULL, NULL, '
                              + QuotedStr(xsDiarioDes) + ', '
                              + QuotedStr(xsCuentaDes) + ', '
                              + ' NULL ,'
                              + QuotedStr(xsDocDes) + ', '
                              + QuotedStr(xsCCostoDes) + ', '
                              + DMTE.cdsCaja304.FieldByName('DCMTOLO').AsString + ', '
                              + DMTE.cdsCaja304.FieldByName('DCMTOEXT').AsString + ', '
                              + ' 0,0,NULL,NULL, NULL, NULL, NULL,'
                              + QuotedStr(DMTE.cdsCaja304.FieldByName('DOCMOD').AsString) + ', '
                              + IntToStr(xnRegistro) + ' , '
                              + QuotedStr('CAJA') + ' , NULL )';
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
         Except
            showMessage('Error en contab filial');
            xSigueGrab := False;
            Exit;
         End;
         DMTE.cdsCaja304.Next;
      End;

      //luego el todal al cnt311
      fg_ContabInsPago(DMTE.cdsCiaFilial.FieldByName('CIADEST').AsString, wgPeriodo, wgDiario, xsNumComprobFilial, xnRegistro);
      If Not xSigueGrab Then exit;

      //graba el adicional en la tabla CAJA302 de la filial
      fg_InsertaFilialCaja302(wgCia, wgDiario, wgPeriodo, wgNumComprob,
         DMTE.cdsCiaFilial.FieldByName('CIADEST').AsString, xsNumComprobFilial);
      If Not xSigueGrab Then exit;

      //mayorizamos el asiento
      xsSql := ' SELECT * FROM CNT311 '
             + '  WHERE CIAID = ' + QuotedStr(DMTE.cdsCiaFilial.FieldByName('CIADEST').AsString)
             + '    AND CNTANOMM = ' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
             + '    AND TDIARID = ' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
             + '    AND CNTCOMPROB = ' + QuotedStr(xsNumComprobFilial);
      DMTE.cdsCNT311.Close;
      DMTE.cdsCNT311.DataRequest(xsSql);
      DMTE.cdsCNT311.Open;

      If SOLConta(DMTE.cdsCiaFilial.FieldByName('CIADEST').AsString,
         DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
         DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
         xsNumComprobFilial,
         DMTE.SRV_D, 'C', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
         DMTE.cdsResultSet, DMTE.DCOM1, Self) Then
         
      Else
      Begin
         ShowMessage('Error al Mayorizar Asiento de Filial');
         xSigueGrab := False;
         exit;
      End;

      DMTE.cdsCiaFilial.Next;
   End;
End;

Procedure TFRendicionCaja.fg_ContabInsPago(wgCia, wgPeriodo, wgDiario, wgNumComprob: String; wgRegistro: Integer);
Var
   xsSql: String;
   xnMontoOri, xnMontoLoc, xnMontoExt: Double;
   xnMontoDebeMN, xnMontoDebeMe, xnMontoHaberMN, xnMontoHaberME: Double;
   xnRegistro: Integer;
   xsCtapago, xsCtapagoDes: String;
Begin
   xsCtapago := '46602';
   xsCtapagoDes := DMTE.DisplayDescrip('prvTGE', 'TGE202', 'CTADES', 'CIAID = ' + QuotedStr(wgCia) + ' AND CUENTAID = ' + QuotedStr(xsCtapago), 'CTADES');

   xnRegistro := wgRegistro + 1;
   xsSql := ' SELECT SUM(CNTMTOORI) CNTMTOORI, SUM(CNTMTOLOC) CNTMTOLOC, SUM(CNTMTOEXT) CNTMTOEXT,'
          + '        SUM(CNTDEBEMN) CNTDEBEMN, SUM(CNTDEBEME) CNTDEBEME,'
          + '        SUM(CNTHABEMN) CNTHABEMN, SUM(CNTHABEME) CNTHABEME '
          + '   FROM CNT311 '
          + '  WHERE CIAID = ' + QuotedStr(wgCia)
          + '    AND TDIARID = ' + QuotedStr(wgDiario)
          + '    AND CNTANOMM = ' + QuotedStr(wgPeriodo)
          + '    AND CNTCOMPROB = ' + QuotedStr(wgNumComprob)
          + '    AND CNTDH = ' + QuotedStr('D');
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;
   xnMontoOri := DMTE.cdsQry.FieldByName('CNTMTOORI').AsFloat;
   xnMontoLoc := DMTE.cdsQry.FieldByName('CNTMTOLOC').AsFloat;
   xnMontoExt := DMTE.cdsQry.FieldByName('CNTMTOEXT').AsFloat;

   //se cambia el debe por el haber
   xnMontoDebeMN := DMTE.cdsQry.FieldByName('CNTHABEMN').AsFloat;
   xnMontoDebeMe := DMTE.cdsQry.FieldByName('CNTHABEME').AsFloat;
   xnMontoHaberMN := DMTE.cdsQry.FieldByName('CNTDEBEMN').AsFloat;
   xnMontoHaberME := DMTE.cdsQry.FieldByName('CNTDEBEME').AsFloat;

   xsSql := ' INSERT INTO CNT311 (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,CLAUXID, '
          + '                     AUXID,DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI, '
          + '                     CNTMTOLOC,CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,CNTCUADRE,CNTFAUTOM, '
          + '                     CNTUSER,CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM, '
          + '                     CNTAASS,TMONID,FLAGVAR,FCONS,CNTFMEC,TDIARDES,CTADES,AUXDES,DOCDES,CCOSDES, '
          + '                     CNTDEBEMN,CNTDEBEME,CNTHABEMN,CNTHABEME,CNTSALDMN,CNTSALDME,CAMPOVAR, '
          + '                     CNTTS,CNTPAGADO,CNTMODDOC,CNTREG,MODULO,CTA_SECU ) '
          + ' SELECT ' + QuotedStr(wgCia) + ',TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,' + QuotedStr(xsCtapago) + ',CLAUXID, '
          + '        AUXID,NULL,NULL,NULL,CNTGLOSA,' + QuotedStr('H') + ',NULL,CNTTCAMBIO,' + FloatToStr(xnMontoOri) + ', '
          + FloatToStr(xnMontoLoc) + ',' + FloatToStr(xnMontoExt) + ' ,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,CNTCUADRE, '
          + '        CNTFAUTOM, CNTUSER,CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM, '
          + '        CNTAASS,TMONID,FLAGVAR,FCONS,CNTFMEC,TDIARDES,' + QuotedStr(xsCtapagoDes) + ',AUXDES, '
          + '        DOCDES, CCOSDES, ' + FloatToStr(xnMontoDebeMN) + ', ' + FloatToStr(xnMontoDebeMe) + ','
          + FloatToStr(xnMontoHaberMN) + ',' + FloatToStr(xnMontoHaberME) + ',0,0,CAMPOVAR, '
          + '        CNTTS,CNTPAGADO,CNTMODDOC,' + FloatToStr(xnRegistro) + ',MODULO,CTA_SECU '
          + '   FROM CNT311 '
          + '  WHERE CIAID = ' + QuotedStr(wgCia)
          + '    AND CNTANOMM = ' + QuotedStr(wgPeriodo)
          + '    AND TDIARID = ' + QuotedStr(wgDiario)
          + '    AND CNTCOMPROB = ' + QuotedStr(wgNumComprob)
          + '    AND ROWNUM = 1 ';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      showMessage('Error insertar Pago de Detracciones en filial');
      xSigueGrab := False;
      Exit;
   End;
End;

Procedure TFRendicionCaja.fg_InsertaFilialCaja302(wgCiaPrincipal, wgDiario,
   wgPeriodo, wgComprobante, wgCiaFilial, wgNumComprobFilial: String);
Var
   xsSql: String;
   xsReferecia: String;
Begin
// en los campos  TDIARIO2,ECNOCOMP2,ECANOMM2 grabamos el asiento de la principal
// estos campos lo usaremos para listar los asientos generados al momento de imprimir
   xsReferecia := '1. ' + wgCiaFilial + '/' + wgDiario + '/' + wgNumComprobFilial;
   xsSql := ' INSERT INTO CAJA302(CIAID,TDIARID,ECANOMM,ECNOCOMP,CLAUXID,PROV,PROVRUC,ECFCOMP,ECFEMICH, '
          + '                     ECFPAGOP,ECFCOBCH,FPAGOID,DOCID,ECNODOC,TMONID,ECTCAMB,ECMTOORI,ECMTOLOC, '
          + '                     ECMTOEXT,BANCOID,CCBCOID,ECNOCHQ,ECGIRA,CPTOID,CUENTAID,ECGLOSA,ECLOTE, '
          + '                     ECELABO,ECAPROB,ECESTADO,ECCONTA,ECUSER,ECFREG,ECHREG,ECANO,ECMM,ECDD, '
          + '                     ECSS,ECSEM,ECTRI,ECAASS,ECAASEM,ECAATRI,FLAGVAR,EC_PROCE,ECOPAGO,TDIARIO2, '
          + '                     ECNOCOMP2,ECANOMM2,EC_IE,ECCHQEMI,USERRESP,EQUIID,ECCHKEST,ECPERNDOC,ECPERREC, '
          + '                     TIPDOCCOD,PERID,ECFENTR,ECCONSOLID,ECMTCON,ECFCV,ECCOBLOC,ECMTDIF,ECCOBEXT, '
          + '                     ECDEVLOC,ECDEVEXT,FEXTCHQ,FLUEID,ECCONING,ECNOREPO,CLAUXID1,AUXID,PROV1, '
          + '                     CCBCOVOUCH,PRVBANCOID,PRVCCBCOID,ECSALMN,ECSALME,CAJARETIGV,FDOFIJJUST, '
          + '                     GCONCID,TIPDET,ECNOCOMPR,CNTCOMPROB) '
          + ' SELECT ' + QuotedStr(wgCiaFilial) + ',TDIARID,ECANOMM,' + QuotedStr(wgNumComprobFilial) + ','
          + '         CLAUXID, PROV, PROVRUC, ECFCOMP, ECFEMICH, ECFPAGOP, ECFCOBCH, FPAGOID, DOCID, ECNODOC, '
          + '         TMONID, ECTCAMB, ECMTOORI, ECMTOLOC, ECMTOEXT, BANCOID, CCBCOID, ECNOCHQ, ECGIRA, CPTOID, '
          + '         CUENTAID, ECGLOSA, ECLOTE, ECELABO, ECAPROB, ECESTADO, ECCONTA, ECUSER, ECFREG, ECHREG, ECANO, '
          + '         ECMM, ECDD, ECSS, ECSEM, ECTRI, ECAASS, ECAASEM, ECAATRI, FLAGVAR, EC_PROCE, ECOPAGO, '
          + QuotedStr(wgDiario) + ', ' + QuotedStr(wgComprobante) + ' ,' + QuotedStr(wgPeriodo) + ', '
          + '         EC_IE, ECCHQEMI, USERRESP, EQUIID, ECCHKEST, ECPERNDOC,' + QuotedStr(xsReferecia) + ', '
          + '         TIPDOCCOD, PERID, ECFENTR, ECCONSOLID,ECMTCON, ECFCV, ECCOBLOC, ECMTDIF, ECCOBEXT, '
          + '         ECDEVLOC, ECDEVEXT, FEXTCHQ, FLUEID, ECCONING, ECNOREPO, CLAUXID1, AUXID, PROV1, '
          + '         CCBCOVOUCH, PRVBANCOID, PRVCCBCOID, ECSALMN, ECSALME, CAJARETIGV, FDOFIJJUST, '
          + '         GCONCID, TIPDET, ECNOCOMPR, CNTCOMPROB '
          + '    FROM CAJA302 '
          + '   WHERE CIAID = ' + QuotedStr(wgCiaPrincipal)
          + '     AND ECANOMM = ' + QuotedStr(wgPeriodo)
          + '     AND TDIARID = ' + QuotedStr(wgDiario)
          + '     AND ECNOCOMP = ' + QuotedStr(wgComprobante);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      showMessage('Error al insertar Transacción en la filial');
      xSigueGrab := False;
      Exit;
   End;
End;

Function TFRendicionCaja.fg_ObtieneNumComprob(wgCompania, wgPeriodo,
   wgDiario: String): String;
Var
   xsSql: String;
Begin
// obteniendo el número de comprobante
   xsSql := 'SELECT LPAD( NVL(MAX(TO_NUMBER(CNTCOMPROB)),0) + 1,10,' + QuotedStr('0') + ') NUMCOMPROB'
          + '  FROM CNT300 '
          + '  WHERE CIAID = ' + QuotedStr(wgCompania)
          + '    AND CNTANOMM = ' + QuotedStr(wgPeriodo)
          + '    AND TDIARID = ' + QuotedStr(wgDiario);
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;
   Result := DMTE.cdsQry.FieldByname('NUMCOMPROB').AsString;
End;

Procedure TFRendicionCaja.fg_EliminarContaFilial(wgCiaPrinc, wgDiarioPrinc, wgPeriodoPrinc, wgNumPrinc: String);
Var
   xsSql: String;
Begin
   xsSql := ' DELETE CNT301 '
          + '  WHERE EXISTS(SELECT 1 FROM CAJA302 '
          + '                WHERE CNT301.CIAID = CAJA302.CIAID '
          + '                  AND CNT301.TDIARID = CAJA302.TDIARID '
          + '                  AND CNT301.CNTANOMM = CAJA302.ECANOMM '
          + '                  AND CNT301.CNTCOMPROB = CAJA302.ECNOCOMP '
          + '                  AND CAJA302.ECANOMM2 = ' + QuotedStr(wgPeriodoPrinc)
          + '                  AND CAJA302.TDIARIO2 = ' + QuotedStr(wgDiarioPrinc)
          + '                  AND CAJA302.ECNOCOMP2 = ' + QuotedStr(wgNumPrinc) + ' )  ';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      showMessage('Error al eliminar CNT301 en la filial');
      xSigueGrab := False;
      Exit;
   End;

   xsSql := ' DELETE CNT300 '
          + '  WHERE EXISTS(SELECT 1 FROM CAJA302 '
          + '                WHERE CNT300.CIAID = CAJA302.CIAID '
          + '                  AND CNT300.TDIARID = CAJA302.TDIARID '
          + '                  AND CNT300.CNTANOMM = CAJA302.ECANOMM '
          + '                  AND CNT300.CNTCOMPROB = CAJA302.ECNOCOMP '
          + '                  AND CAJA302.ECANOMM2 = ' + QuotedStr(wgPeriodoPrinc)
          + '                  AND CAJA302.TDIARIO2 = ' + QuotedStr(wgDiarioPrinc)
          + '                  AND CAJA302.ECNOCOMP2 = ' + QuotedStr(wgNumPrinc) + ' )  ';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      showMessage('Error al eliminar CNT300 en la filial');
      xSigueGrab := False;
      Exit;
   End;

   xsSql := ' DELETE CNT311 '
          + '  WHERE EXISTS(SELECT 1 FROM CAJA302 '
          + '                WHERE CNT311.CIAID = CAJA302.CIAID '
          + '                  AND CNT311.TDIARID = CAJA302.TDIARID '
          + '                  AND CNT311.CNTANOMM = CAJA302.ECANOMM '
          + '                  AND CNT311.CNTCOMPROB = CAJA302.ECNOCOMP '
          + '                  AND CAJA302.ECANOMM2 = ' + QuotedStr(wgPeriodoPrinc)
          + '                  AND CAJA302.TDIARIO2 = ' + QuotedStr(wgDiarioPrinc)
          + '                  AND CAJA302.ECNOCOMP2 = ' + QuotedStr(wgNumPrinc) + ' )  ';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      showMessage('Error al eliminar CNT311 en la filial');
      xSigueGrab := False;
      Exit;
   End;

   xsSql := ' DELETE CAJA302 '
          + '  WHERE ECANOMM2 =  ' + QuotedStr(wgPeriodoPrinc)
          + '    AND TDIARIO2 = ' + QuotedStr(wgDiarioPrinc)
          + '    AND ECNOCOMP2 = ' + QuotedStr(wgNumPrinc);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      showMessage('Error al eliminar CAJA302 en la filial');
      xSigueGrab := False;
      Exit;
   End;

End;

Function TFRendicionCaja.fg_ExisteContabFilial(wgCiaPrincipal, wgPeriodo, wgTiario, wgNumero: String): Boolean;
Var
   xsSql: String;
Begin
   xsSql := 'SELECT * '
          + '  FROM CAJA302 '
          + ' WHERE ECANOMM2 = ' + Quotedstr(wgPeriodo)
          + '   AND TDIARIO2 = ' + QuotedStr(wgTiario)
          + '   AND ECNOCOMP2 = ' + QuotedStr(wgNumero);
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;
   If DMTE.cdsQry.RecordCount > 0 Then
   Begin
      Result := True;
      Exit;
   End;
   Result := False;
End;

Function TFRendicionCaja.fg_BuscaDocProvisionado(wgTipoAuxiliar, wgProveedor, wgTipoDocumento, wgSerie, wgNumDocumento: String): Boolean;
Var
   xsSql: String;
   xsCiaDestino: String;
Begin
// incluye trim a Serie y NroDoc antes de que le quite los ceros a la izquierda (leading)
   xsSql := ' SELECT CIAID, CPSERIE, CPNODOC '
          + '   FROM CXP301 '
          + '  WHERE CLAUXID = ' + QuotedStr(wgTipoAuxiliar)
          + '    AND PROV = ' + QuotedStr(wgProveedor)
          + '    AND DOCID = ' + QuotedStr(wgTipoDocumento)
          + '    AND CIAID <>' + QuotedStr('02')
          + '    AND Trim(Leading ' + QuotedStr('0') + ' from trim(CPSERIE)) = Trim(Leading ' + QuotedStr('0') + ' from trim(' + QuotedStr(wgSerie) + ')) '
          + '    AND Trim(Leading ' + QuotedStr('0') + ' from trim(CPNODOC)) = Trim(Leading ' + QuotedStr('0') + ' from trim(' + QuotedStr(wgNumDocumento) + ')) '
          + '    AND CPESTADO IN (' + QuotedStr('P') + ',' + QuotedStr('C') + ') ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;
   If DMTE.cdsQry.RecordCount > 0 Then
   Begin
      xsCiaDestino := DMTE.cdsQry.FieldByname('CIAID').AsString;

      xsSql := ' SELECT CCOSID,CUENTAID '
             + '   FROM TGE203 '
             + '  WHERE CIADEST = ' + QuotedStr(xsCiaDestino)
             + '    AND CCOSACT = ' + QuotedStr('S')
             + '    AND CCOSMOV = ' + QuotedStr('S')
             + '    AND NOT CUENTAID IS NULL ORDER BY CCOSID ';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest(xsSql);
      DMTE.cdsQry.Open;

      DMTE.cdsRegCxP.FieldByName('CCOSID').AsString := DMTE.cdsQry.FieldByName('CCOSID').AsString;
      dblcdCCostoExit(dblcdCCosto);
      Result := True;
      Exit;
   End;
   Result := False;
End;

Procedure TFRendicionCaja.dbeNoDoc2Exit(Sender: TObject);
Begin
   If fg_BuscaDocProvisionado(dblcClaseDet.Text, dblcdAuxDet.Text, dblcTDoc2.Text, dbeSerie.Text, dbeNoDoc2.Text) Then
   Begin
      dblcdCCosto.Enabled := True;
   End;
End;

Procedure TFRendicionCaja.sbDisenoRepClick(Sender: TObject);
Begin
   cbDisenoRep.Enabled := Not cbDisenoRep.Enabled;
End;


procedure TFRendicionCaja.dbeImporte2Exit(Sender: TObject);
   Var
   xWhere, aux: String;
begin

   If Length(Trim(dbeImporte2.Text)) = 0 Then
   Begin
      dbeImporte2.Text := '0.00';
   End;
   dbeImporte2.Text := FormatFloat('###,###.00', Valores(dbeImporte2.Text));


   If z2bbtnCancel3.Focused Then exit;

   xWhere := 'TMONID=' + '''' + DMTE.cdsRegCxP.FieldByName('TMONID').AsString + '''';
   aux := DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', xWhere, 'TMONDES');

   DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat := Valores(dbeImporte2.Text);
   If (Length(aux) > 0) And (DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat > 0) Then
   Begin
      If DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
      Begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat / DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
      End
      Else
      Begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat * DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
      End;
   End
   Else
   Begin
      DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat := 0;
      DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat := 0;
   End;


end;

//Inicio HPC_201401_CAJA
//El importe lo pasa de String a Valor
function TFRendicionCaja.Valores(Texto: String): Currency;
Var
   xMont, xValor: String;
   I: Integer;
Begin
   For I := 1 To Length(Trim(Texto)) Do
   Begin
      xMont := Copy(Texto, I, 1);
      If xMont <> ',' Then
         xValor := Trim(xValor) + Trim(xMont);
   End;
   Result := StrToFloat(xValor);
end;
//Final HPC_201401_CAJA

//Inicio HPC_201401_CAJA
procedure TFRendicionCaja.dbeImporte2KeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key In [' ', 'A'..'Z', 'a'..'z', '°', '|', '!', '"', '#', '$', '%', '&', '/', '(', ')', '=', '?', '\', '¡', '¿', '@', '¨', '´', '*', '+', '~', '~', '[', ']', '{', '}', '^', '`', '<', '>', ';', ',', ':', '''', '-', '_'] Then
      Key := #0;
end;
//Final HPC_201401_CAJA

End.


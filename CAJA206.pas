Unit Caja206;

// Actualizaciones
// HPC_201306_CAJA   07/06/2013    Se limita los Auxiliares para que sólo trabaje con los Activos CNT201->ACTIVO='S'
//                                 Se adiciona una nueva búsqueda de cliente y creación de nuevo cliente
// HPC_201308_CAJA   14/08/2013    Se realizan ajustes al pase HPC_201306
// HPC_201405_CAJA   03/12/2014    Se realizan ajustes de redondeo a la Impresión del Precio Unitario
//                                 para que no genere un desborde (overflow)
//                                 Se ajusta cambios a las grabaciones del módulo
// HPC_201601_CAJA 11/01/2016: Se define la variable wTMonLocDes para descripción de la Moneda Local
//                             Se define la variable wTMonExtDes para descripción de la Moneda Extranjera
//                             Se cambia valor fijo para descripción de moneda por uso de variable que se carga de tabla de Tipos de Monedas
//                             Se limita caracteres del concepto a 32 caracteres para impresión de recibo
// HPC_201603_CAJA 21/03/2016  Se modifica Filtro para que incluya sólo Conceptos de Ingresos Activos
// HPC_201802_CAJA  26/03/2018  Cambia búsqueda de Maestro de Clientes
//

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
   StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
   wwdbdatetimepicker, wwdblook, ExtCtrls, Db, Wwdatsrc, DBClient, wwclient, CAJADM,
   ppDB, ppDBPipe, ppCtrls, ppBands, ppPrnabl, ppClass, ppCache, ppComm,
   ppRelatv, ppProd, ppReport, variants, ppTypes, oaVariables, fcLabel,
   ppEndUsr, Mant, ppVar, ppParameter, Wwdbspin;

Type
   TFIngresoCaja = Class(TForm)
      pnlCabecera1: TPanel;
      pnlDetPago: TPanel;
      pnlBotones: TPanel;
      Z2bbtnSumat: TBitBtn;
      Z2bbtnImprime: TBitBtn;
      Z2bbtnGraba: TBitBtn;
      Z2bbtnCancelado: TBitBtn;
      Z2bbtnCancel2: TBitBtn;
      Z2bbtnNuevo: TBitBtn;
      Z2bbtnSube: TBitBtn;
      Z2bbtnAnula: TBitBtn;
      pnlActualiza: TPanel;
      Z2bbtnOKDet: TBitBtn;
      Z2bbtnCancelDet: TBitBtn;
      Z2bbtnOKCab: TBitBtn;
      Z2bbtnCancelCab: TBitBtn;
      Label22: TLabel;
      Z2bbtnCont: TBitBtn;
      dblcdCnp: TwwDBLookupComboDlg;
      edtCia: TEdit;
      dblcCia: TwwDBLookupCombo;
      dbeGlosa: TwwDBEdit;
      dblcTDoc: TwwDBLookupCombo;
      edtTDoc: TEdit;
      dbeNoDoc: TwwDBEdit;
      dbeSerie: TwwDBEdit;
      dbeGiradoA: TwwDBEdit;
      dblcdAux: TwwDBLookupComboDlg;
      dblcClase: TwwDBLookupCombo;
      edtClase: TEdit;
      dblcTMonCab: TwwDBLookupCombo;
      dblcBanco: TwwDBLookupCombo;
      edtBanco: TEdit;
      edtCuenta: TEdit;
      edtTMonCab: TEdit;
      dbdtpFEmision: TwwDBDateTimePicker;
      dbeTCambio: TwwDBEdit;
      dbeNoReg: TwwDBEdit;
      edtCuenta2: TwwDBEdit;
      dblcTMon2: TwwDBLookupCombo;
      dbeImporte2: TwwDBEdit;
      edtTMon2: TEdit;
      edtMtoLoc: TwwDBEdit;
      edtMtoExt: TwwDBEdit;
      dbeDH: TwwDBEdit;
      dbeTCamPr: TwwDBEdit;
      dblcdCCosto: TwwDBLookupComboDlg;
      Z2bbtnCalc: TBitBtn;
      edtCnp2: TEdit;
      dblcClaseDet: TwwDBLookupCombo;
      edtClaseDet: TEdit;
      dblcdAuxDet: TwwDBLookupComboDlg;
      dbeAuxDet: TwwDBEdit;
      dblcdFEfec: TwwDBLookupComboDlg;
      dbeFEfec: TwwDBEdit;
      Label4: TLabel;
      dbgDetFPago: TwwDBGrid;
      Z2bbtnAdicFPago: TwwIButton;
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
      StaticText2: TStaticText;
      Z2bbtnEmite: TBitBtn;
      pprRecibo: TppReport;
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
      edNumReg: TEdit;
      dblcdCnp22: TwwDBLookupComboDlg;
      dbgDetPago: TwwDBGrid;
      Z2dbgDetPagoIButton: TwwIButton;
      dbdtpFecEmi: TwwDBDateTimePicker;
      dbdtpFecVenc: TwwDBDateTimePicker;
      Bevel2: TBevel;
      Bevel3: TBevel;
      Label1: TLabel;
      ppd1: TppDesigner;
      dblcdAso: TwwDBEdit;
      btnExec: TButton;
      lblEstadoMov: TfcLabel;
      bbtnActivaR: TBitBtn;
      ppParameterList1: TppParameterList;
      mAnula: TMemo;
      edtAuxRuc: TwwDBEdit;
      seCantidad: TwwDBSpinEdit;
      dbePreUni: TwwDBEdit;
      Bevel1: TBevel;
      Bevel4: TBevel;
      ppHeaderBand2: TppHeaderBand;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppnNombre: TppLabel;
      ppLbDescrip: TppLabel;
      ppLabel5: TppLabel;
      ppLabel1: TppLabel;
      ppShape1: TppShape;
      ppDBText4: TppDBText;
      ppLabel6: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel12: TppLabel;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppDBText19: TppDBText;
      ppnNombre1: TppLabel;
      ppLbDescripC: TppLabel;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppShape2: TppShape;
      ppDBText20: TppDBText;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel20: TppLabel;
      ppLabel21: TppLabel;
      ppDBText21: TppDBText;
      ppDetailBand2: TppDetailBand;
      ppDBText11: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      ppDBText22: TppDBText;
      ppDBText23: TppDBText;
      ppDBText24: TppDBText;
      ppDBText25: TppDBText;
      ppDBText26: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel7: TppLabel;
      ppDBText9: TppDBText;
      ppLabel4: TppLabel;
      ppLabel11: TppLabel;
      pplbFecha: TppLabel;
      ppDBText10: TppDBText;
      ppLabel2: TppLabel;
      ppDBText6: TppDBText;
      ppLbDescrip1: TppLabel;
      ppDBText5: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppLabel22: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLabel23: TppLabel;
      ppDBText27: TppDBText;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      pplbFecha1: TppLabel;
      ppDBText28: TppDBText;
      ppLabel27: TppLabel;
      ppDBText29: TppDBText;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      pnlAux: TPanel;
      edtAux: TEdit;
      btnbusAux: TBitBtn;
      cbDiseno: TCheckBox;
      Procedure Z2bbtnCalcClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure Z2bbtnSumatClick(Sender: TObject);
      Procedure Z2bbtnSubeClick(Sender: TObject);
      Procedure Z2bbtnNuevoClick(Sender: TObject);
      Procedure Z2bbtnGrabaClick(Sender: TObject);
      Procedure Z2bbtnCanceladoClick(Sender: TObject);
      Procedure Z2bbtnAnulaClick(Sender: TObject);
      Procedure Z2dbgDetPagoIButtonClick(Sender: TObject);
      Procedure Z2bbtnCancelDetClick(Sender: TObject);
      Procedure Z2bbtnOKDetClick(Sender: TObject);
      Procedure dbgDetPagoKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure Z2bbtnCancelCabClick(Sender: TObject);
      Procedure Z2bbtnOKCabClick(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure FormShow(Sender: TObject);
      Procedure dbgDetPagoDblClick(Sender: TObject);
      Procedure dbgDetPagoCalcTitleAttributes(Sender: TObject;
         AFieldName: String; AFont: TFont; ABrush: TBrush;
         Var ATitleAlignment: TAlignment);
      Procedure Z2bbtnImprimeClick(Sender: TObject);
      Procedure Z2bbtnContClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dbeTCambioChange2(Sender: TObject);
      Procedure dbeTCambioEnter2(Sender: TObject);
      Procedure dbeTCambioExit2(Sender: TObject);
      Procedure dblcBancoExit22(Sender: TObject);
      Procedure dblcClaseExit22(Sender: TObject);
      Procedure dblcdAuxExit2(Sender: TObject);
      Procedure dblcdCnpExit2(Sender: TObject);
      Procedure dblcTDocExit2(Sender: TObject);
      Procedure dblcTMonCabExit2(Sender: TObject);
      Procedure dbeDHChange(Sender: TObject);
      Procedure dbeImporte2Exit(Sender: TObject);
      Procedure dbeNoRegExit(Sender: TObject);
      Procedure dbeGiradoAChange(Sender: TObject);
      Procedure dbeSerieChange(Sender: TObject);
      Procedure dbeNoDocChange(Sender: TObject);
      Procedure dbdtpFEmisionChange(Sender: TObject);
      Procedure dbeGlosaChange(Sender: TObject);
      Procedure Z2bbtnCancel2Click(Sender: TObject);
      Procedure dbdtpFEmisionExit(Sender: TObject);
      Procedure dblcClaseDetExit(Sender: TObject);
      Procedure dblcdAuxExit22(Sender: TObject);
      Procedure dblcdCnp2Exit2(Sender: TObject);
      Procedure wwDBEdit1Change22(Sender: TObject);
      Procedure dblcdFEfecExit(Sender: TObject);
      Procedure dbgDetFPagoDblClick(Sender: TObject);
      Procedure dbgDetFPagoEnter(Sender: TObject);
      Procedure Z2bbtnAdicFPagoClick(Sender: TObject);
      Procedure bbtnCancFPagoClick(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure chkAsignaRestoClick(Sender: TObject);
      Procedure dbeACobrarEnter(Sender: TObject);
      Procedure dbeACobrarExit(Sender: TObject);
      Procedure dbeRecibidoChange(Sender: TObject);
      Procedure dbeRecibidoEnter(Sender: TObject);
      Procedure dbeRecibidoExit(Sender: TObject);
      Procedure dblcFormPagoExit(Sender: TObject);
      Procedure dblcTarjetaExit(Sender: TObject);
      Procedure dblcTMonCExit(Sender: TObject);
      Procedure dblcBancoFPagoExit(Sender: TObject);
      Procedure Z2OkDetalleClick(Sender: TObject);
      Procedure dbgDetFPagoKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure Z2bbtnEmiteClick(Sender: TObject);
      Procedure pprReciboBeforePrint(Sender: TObject);
      Procedure pprReciboPreviewFormCreate(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcTMon2Exit(Sender: TObject);
      Procedure dbeNoDocExit(Sender: TObject);
      Procedure NotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dbdtpFecVencExit(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure btnExecClick(Sender: TObject);
      Procedure dblcdAsoExit(Sender: TObject);
      Procedure bbtnActivaRClick(Sender: TObject);
      Procedure dblcClaseEnter(Sender: TObject);
      Procedure seCantidadExit(Sender: TObject);
      Procedure dbePreUniExit(Sender: TObject);
      Procedure btnbusAuxClick(Sender: TObject);
      Procedure edtAuxExit(Sender: TObject);
   Private
    { Private declarations }
      xDescrip: String;
      xLength: integer;
      cf1: TControlFoco;
      strTmp: String;
      xMtoCta: double;
      xMtoLoc, xMtoExt: double;
      A2digitos, A4digitos: Array Of TWinControl;
      cdsFiltro: TwwClientDataset;
      xGraboNuevo: Boolean;
      cdsTarjeta: TwwClientDataSet;
      cdsBanco: TwwClientDataSet;
      wFechaCierre: TDatetime;
      wFrecu: Integer;
      xInsercion: String;
      xREG: Integer;
      TransDoc: structDocIng;

      Procedure RecalculaReg;
      Procedure IniciaPanel;
      Procedure Contabiliza;
      Procedure Contab_IngCaja;
      Procedure Contab_RegCxP;
      Function ValidaCampo: Boolean;
      Procedure IniciaDatos;
      Procedure ActivaBotones(pnl: TPanel; xFlag: Boolean);
      Procedure FocoInicial;
      Procedure GrabaMontoTotal;
      Procedure AdicionaRegistro;
      Procedure EditaRegistro;
      Procedure ValidaCab;
      Procedure RecuperaDescrip;
      Procedure InHabilitaControles;
      Procedure HabilitaControles;
      Procedure AsignaClaveDetalle;
      Procedure AsignaParametros;
      Procedure cdsRegCxCBeforePost(DataSet: TDataSet);
      Procedure ActualizaDetalle;
      Procedure ActualizaFiltro;
      Procedure LLenaEdits;
      Procedure Inserta;
      Procedure GrabaDetalle;
      Procedure ValidacionTjaChq;
      Procedure ValidacionCobradoTotal;
      Procedure ValidacionDatos;
      Procedure ValidaCancelacion;
      Procedure GrabaClave;
      Procedure GrabaEstadoFPago(xEstado: String);
      Procedure AcumulaDetFPago;
      Procedure CalculaResto;
      Procedure Redondear;
      Procedure BuscaNRecibo;
      Procedure CargaDataSource;
      Procedure ReciboCompleto(Sender: TObject);
      Procedure InsertaDetallePago;
      Procedure TransferirTablaServicios;
      Procedure EliminaAnulados;
   // Inicio HPC_201309_CAJA
      Procedure GrabaDetallePago;
   // Fin HPC_201309_CAJA
   Public
    { Public declarations }
   // Inicio HPC_201802_CAJA
   // Cambia búsqueda de Maestro de Clientes
      MtxAsocia: TMant;
      MtxBuscaCli: TMant;
   // Fin HPC_201802_CAJA
      Procedure Adiciona;
      Procedure Edita(Doc: structDocIng; cds: Twwclientdataset);
      Procedure AsignaCDSFiltro(cds: TwwClientDataset);
   // Inicio HPC_201802_CAJA
   // Tool de Busqueda de Cliente
      Procedure ToolBuscaCliCreate(Sender: TObject); //Asociados
   // Evento de Selección de Cliente en búsqueda (doble click)
      Procedure OnEditBuscaCli(Sender: TObject; MantFields: TFields);
   // Fin HPC_201802_CAJA
   End;

Var
   FIngresoCaja: TFIngresoCaja;
   wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,
   wbcancel2: Boolean;
   wModifica: Boolean;
   xdnumreg: String;
   fAnula: Boolean;

Implementation

// Inicio HPC_201802_CAJA
// 26/03/2018 Se cambia Búsqueda del Maestro de Clientes
Uses CAJAUTIL, Caja224, ppviewr, Caja290, oaTE2000, CAJA712, CAJA292, CAJA710, // CLIE003, ClieDM,
     CLIE771CAJA;
// Fin HPC_201802_CAJA

{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}

Function NumtoStr(wNumero: double): String;
Var
   xNumStr, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12: String;
   xGrupo, xTotal, xDecimal: String;
   xLargo, xVeces: integer;
   xcontador: integer;
Begin
 // w1 para Unidades
   xNumStr := floattostr(int(wNumero));
   For xcontador := 1 To Length(FloatToStr(wNumero)) Do
   Begin
      If copy(FloatToStr(wNumero), xcontador, 1) = '.' Then
      Begin
         xDecimal := copy(FloatToStr(wNumero), xcontador + 1, Length(FloatToStr(wNumero)));
         break;
      End;
   End;

   If wNumero - int(wNumero) > 0 Then
   Begin
   End
   Else
   Begin
      xDecimal := '00';
   End;
   If length(xdecimal) = 1 Then xdecimal := xdecimal + '0';
   xDecimal := ' y ' + xDecimal + '/100';
   xLargo := length(xNumStr);
   x1 := '';
   x2 := '';
   x3 := '';
   x4 := '';
   x5 := '';
   x6 := '';
   x7 := '';
   x8 := '';
   x9 := '';
   x10 := '';
   If xLargo >= 1 Then x1 := copy(xNumStr, xLargo, 1);
   If xLargo >= 2 Then x2 := copy(xNumStr, xLargo - 1, 1);
   If xLargo >= 3 Then x3 := copy(xNumStr, xLargo - 2, 1);
   If xLargo >= 4 Then x4 := copy(xNumStr, xLargo - 3, 1);
   If xLargo >= 5 Then x5 := copy(xNumStr, xLargo - 4, 1);
   If xLargo >= 6 Then x6 := copy(xNumStr, xLargo - 5, 1);
   If xLargo >= 7 Then x7 := copy(xNumStr, xLargo - 6, 1);
   If xLargo >= 8 Then x8 := copy(xNumStr, xLargo - 7, 1);
   If xLargo >= 9 Then x9 := copy(xNumStr, xLargo - 8, 1);
   If xLargo >= 10 Then x10 := copy(xNumStr, xLargo - 9, 1);
   If xLargo >= 11 Then x11 := copy(xNumStr, xLargo - 10, 1);
   If xLargo >= 12 Then x12 := copy(xNumStr, xLargo - 11, 1);
   xVeces := 1;
   xTotal := '';
   While xVeces <= 4 Do // hasta 999,999'999,999
   Begin
      If xVeces = 2 Then
      Begin
         x1 := x4;
         x2 := x5;
         x3 := x6;
      End;
      If xVeces = 3 Then
      Begin
         x1 := x7;
         x2 := x8;
         x3 := x9;
      End;
      If xVeces = 4 Then
      Begin
         x1 := x10;
         x2 := x11;
         x3 := x12;
      End;
      If x2 = '1' Then // del 11 a 19
      Begin
         If x1 = '0' Then x2 := 'DIEZ';
         If x1 = '1' Then x2 := 'ONCE';
         If x1 = '2' Then x2 := 'DOCE';
         If x1 = '3' Then x2 := 'TRECE';
         If x1 = '4' Then x2 := 'CATORCE';
         If x1 = '5' Then x2 := 'QUINCE';
         If x1 = '6' Then x2 := 'DIECISEIS';
         If x1 = '7' Then x2 := 'DIECISIETE';
         If x1 = '8' Then x2 := 'DIECIOCHO';
         If x1 = '9' Then x2 := 'DIECINUEVE';
         x1 := '0';
      End
      Else
      Begin // del 0 al 9
         If x1 = '1' Then x1 := 'UNO';
         If (xVeces > 1) And (x1 = 'UNO') Then x1 := 'UN';
         If x1 = '2' Then x1 := 'DOS';
         If x1 = '3' Then x1 := 'TRES';
         If x1 = '4' Then x1 := 'CUATRO';
         If x1 = '5' Then x1 := 'CINCO';
         If x1 = '6' Then x1 := 'SEIS';
         If x1 = '7' Then x1 := 'SIETE';
         If x1 = '8' Then x1 := 'OCHO';
         If x1 = '9' Then x1 := 'NUEVE';
         If x2 = '2' Then
         Begin // veinte
            x2 := 'VEINTI';
            If x1 = '0' Then x2 := 'VEINTE';
         End;
         If x2 = '3' Then
         Begin
            x2 := 'TREINTI';
            If x1 = '0' Then x2 := 'TREINTA';
         End;
         If x2 = '4' Then
         Begin
            x2 := 'CUARENTI';
            If x1 = '0' Then x2 := 'CUARENTA';
         End;
         If x2 = '5' Then
         Begin
            x2 := 'CINCUENTI';
            If x1 = '0' Then x2 := 'CINCUENTA';
         End;
         If x2 = '6' Then
         Begin
            x2 := 'SESENTI';
            If x1 = '0' Then x2 := 'SESENTA';
         End;
         If x2 = '7' Then
         Begin
            x2 := 'SETENTI';
            If x1 = '0' Then x2 := 'SETENTA';
         End;
         If x2 = '8' Then
         Begin
            x2 := 'OCHENTI';
            If x1 = '0' Then x2 := 'OCHENTA';
         End;
         If x2 = '9' Then
         Begin
            x2 := 'NOVENTI';
            If x1 = '0' Then x2 := 'NOVENTA';
         End;
      End;
      If x3 = '1' Then x3 := 'CIENTO';
      If (x2 = '0') And (x1 = '0') And (x3 = 'CIENTO') Then
         x3 := 'CIEN';
      If x3 = '2' Then x3 := 'DOSCIENTOS';
      If x3 = '3' Then x3 := 'TRESCIENTOS';
      If x3 = '4' Then x3 := 'CUATROCIENTOS';
      If x3 = '5' Then x3 := 'QUINIENTOS';
      If x3 = '6' Then x3 := 'SEISCIENTOS';
      If x3 = '7' Then x3 := 'SETECIENTOS';
      If x3 = '8' Then x3 := 'OCHOCIENTOS';
      If x3 = '9' Then x3 := 'NOVECIENTOS';
      xGrupo := '';
      If x3 <> '0' Then xGrupo := x3;
      If x2 <> '0' Then xGrupo := xGrupo + ' ' + x2;
      If x1 <> '0' Then xGrupo := xGrupo + x1;
      If ((xVeces = 2) Or (xVeces = 4)) And (length(xGrupo) > 1) Then
      Begin
         xGrupo := xGrupo + ' MIL';
      End;
      If (xVeces = 3) And (length(xGrupo) > 1) Then
      Begin
         If x1 <> 'UN' Then
            xGrupo := xGrupo + ' MILLONES'
         Else
         Begin
            xGrupo := xGrupo + ' MILLÓN';
         End;
      End;
      If length(xTotal) > 0 Then xGrupo := xGrupo + ' ';
      xTotal := xGrupo + xTotal;
      xVeces := xVeces + 1;
   End;
   result := xTotal + xDecimal;
End;

Procedure TFIngresoCaja.IniciaDatos;
Begin
   BlanqueaEdits(pnlCabecera1);
   dbgDetPago.ColumnByName('DEMTOLOC').FooterValue := '';
   dbgDetPago.ColumnByName('DEMTOEXT').FooterValue := '';
   RecuperarCiaUnica(dblcCia, edtCia);
End;

Procedure TFIngresoCaja.Z2bbtnCalcClick(Sender: TObject);
Begin
   WinExec('calc.exe', 1); //Activa la calculadora del Windows
End;

{*******************************************************
CUARTO PANEL - BOTONES
*******************************************************}

Procedure TFIngresoCaja.Z2bbtnSumatClick(Sender: TObject);
Var
   xRegAct: TBookMark;
Begin
   DMTE.cdsRegCxC.DisableControls;
   xRegAct := DMTE.cdsRegCxC.GetBookmark;
   xMtoLoc := 0;
   xMtoExt := 0;
   xMtoCta := 0;
   DMTE.cdsRegCxC.First;
   While Not DMTE.cdsRegCxC.Eof Do
   Begin
      If DMTE.cdsRegCxC.FieldByName('DEDH').AsString = 'H' Then
      Begin
         xMtoLoc := xMtoLoc + DMTE.cdsRegCxC.FieldByName('DEMTOLOC').AsFloat;
         xMtoExt := xMtoExt + DMTE.cdsRegCxC.FieldByName('DEMTOEXT').AsFloat;
      End
      Else
      Begin
         xMtoLoc := xMtoLoc - DMTE.cdsRegCxC.FieldByName('DEMTOLOC').AsFloat;
         xMtoExt := xMtoExt - DMTE.cdsRegCxC.FieldByName('DEMTOEXT').AsFloat;
      End;
      DMTE.cdsRegCxC.Next;
   End;
   dbgDetPago.ColumnByName('DEMTOLOC').FooterValue := floattostrf(xMtoLoc, ffFixed, 10, 2);
   dbgDetPago.ColumnByName('DEMTOEXT').FooterValue := floattostrf(xMtoExt, ffFixed, 10, 2);

   DMTE.cdsRegCxC.GotoBookmark(xRegAct);
   DMTE.cdsRegCxC.FreeBookmark(xRegAct);
   DMTE.cdsRegCxC.EnableControls;
End;

Procedure TFIngresoCaja.Z2bbtnSubeClick(Sender: TObject);
Begin
   pnlDetPago.Enabled := False;
   pnlBotones.Enabled := False;
   ActivaBotones(pnlBotones, False);
   pnlCabecera1.Enabled := True;
   ActivaBotones(pnlCabecera1, True);
End;

Procedure TFIngresoCaja.Z2bbtnNuevoClick(Sender: TObject);
Begin
   xInsercion := '';
   If DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'I' Then
   Begin
      If wModifica Then
      Begin
         ShowMessage('Debe grabar o  Cancelar las actualizaciones realizadas');
         exit;
      End;
      If MessageDlg('¿Nuevo Documento?', mtConfirmation,
         [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMTE.wModo := 'A';
         edNumReg.Text := '';
         Adiciona;
         FormShow(Sender);
         pnlCabecera1.SetFocus;
         perform(CM_DialogKey, VK_TAB, 0);
      End;
   End
   Else
   Begin
      DMTE.wModo := 'A';
      edNumReg.Text := '';
      Adiciona;
      FormShow(Sender);
   End;
End;

Procedure TFIngresoCaja.Z2bbtnGrabaClick(Sender: TObject);
Var
   sSQL, xSQL, sPMtoLoc, sPMtoExt, sFMtoLoc, sFMtoExt: String;
   nPMtoLoc, nPMtoExt, nFMtoLoc, nFMtoExt: double;
   Anio, Mes, Dia: Word;
   fGrab: Boolean;
Begin
   If DMTE.cdsRegCxC.RecordCount = 0 Then
   Begin
      Z2dbgDetPagoIButtonClick(Nil);
      Raise Exception.Create('Ingrese Detalle del Documento');
   End;

   If DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'I' Then
   Begin

      If MessageDlg('¿Desea Grabar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

      If DMTE.cdsDetFPago.RecordCount > 0 Then
      Begin
         sFMtoLoc := dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue;
         sFMtoExt := dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue;
         sPMtoLoc := dbgDetPago.ColumnByName('DEMTOLOC').FooterValue;
         sPMtoExt := dbgDetPago.ColumnByName('DEMTOEXT').FooterValue;

         nFMtoLoc := StrToFloat(sFMtoLoc);
         nFMtoExt := StrToFloat(sFMtoExt);
         nPMtoLoc := StrToFloat(sPMtoLoc);
         nPMtoExt := StrToFloat(sPMtoExt);

         If (abs(nFMtoLoc - nPMtoLoc) < 0.5) And (abs(nFMtoExt - nPMtoExt) < 0.5) Then
         Begin
            Redondear;
            AcumulaDetFPago;
         End;
      End;

   // Inicio HPC_201309_CAJA
      DMTE.cdsIngDocs.Edit;
      DecodeDate(dbdtpFEmision.Date, Anio, Mes, Dia);
      DMTE.cdsIngDocs.FieldByName('ECANOMM').AsString := FloatToStr(Anio) + DMTE.StrZero(FloatToStr(Mes), 2);
      DMTE.cdsIngDocs.FieldByName('NCOUSER').AsString := DMTE.wUsuario;
      DMTE.cdsIngDocs.FieldByName('NCOFREG').AsString := DateToStr(date);
      DMTE.cdsIngDocs.FieldByName('NCOHREG').AsDateTime := SysUtils.Time;
      GrabaMontoTotal;

      If dbeNoDoc.Text = '' Then
      Begin
         BuscaNRecibo;
         DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString := Trim(dbeNoDoc.Text);
      End;

      xSigueGrab := True;
      DMTE.DCOM1.AppServer.IniciaTransaccion;
      If DMTE.wModo = 'A' Then
      Begin
      // Ingreso de Cabecera
         xSQL := 'insert into CXC303(CIAID, CLAUXID, CLIEID, CLIERUC, TMONID, NCOTCAMB, '
               + '                   NCOMTOORI, NCOMTOLOC, NCOMTOEXT, BANCOID, '
               + '                   NCOESTADO, NCOUSER, NCOFREG, NCOHREG, '
               + '                   DOCID, CCSERIE, CCNODOC, CCFEMIS, '
               + '                   CCNOMB, CPTOID, CCGLOSA, CCTREC, '
               + '                   ECCOBLOC, ECCOBEXT, ECANOMM, TDIARID, ECNOCOMP, '
               + '                   CUENTAID) '
               + ' values (' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CIAID').AsString) + ', '
                             + quotedstr(DMTE.cdsIngDocs.FieldbyName('CLAUXID').AsString) + ','
                             + quotedstr(DMTE.cdsIngDocs.FieldbyName('CLIEID').AsString) + ', '
                             + quotedstr(DMTE.cdsIngDocs.FieldbyName('CLIERUC').AsString) + ', '
                             + quotedstr(DMTE.cdsIngDocs.FieldbyName('TMONID').AsString) + ', '
                             + floattostr(DMTE.cdsIngDocs.FieldbyName('NCOTCAMB').Asfloat) + ', '
                             + floattostr(DMTE.cdsIngDocs.FieldByName('NCOMTOORI').AsFloat) + ', '
                             + floattostr(DMTE.cdsIngDocs.FieldByName('NCOMTOLOC').AsFloat) + ', '
                             + floattostr(DMTE.cdsIngDocs.FieldByName('NCOMTOEXT').AsFloat) + ', '
                             + quotedstr(DMTE.cdsIngDocs.FieldbyName('BANCOID').AsString) + ', '
                             + quotedstr(DMTE.cdsIngDocs.fieldbyName('NCOESTADO').AsString) + ', '
                             + quotedstr(DMTE.cdsIngDocs.FieldByName('NCOUSER').AsString) + ', '
                             + quotedstr(datetostr(DMTE.cdsIngDocs.FieldByName('NCOFREG').AsDateTime)) + ', '
                             + quotedstr(datetostr(DMTE.cdsIngDocs.FieldByName('NCOHREG').AsDateTime)) + ', '
                             + quotedstr(DMTE.cdsIngDocs.FieldbyName('DOCID').AsString) + ', '
                             + quotedstr(DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString) + ', '
                             + quotedstr(DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString) + ', '
                             + quotedstr(datetostr(DMTE.cdsIngDocs.FieldbyName('CCFEMIS').AsDateTime)) + ', '
                             + quotedstr(DMTE.cdsIngDocs.FieldbyName('CCNOMB').AsString) + ','
                             + quotedstr(DMTE.cdsIngDocs.FieldbyName('CPTOID').AsString) + ','
                             + quotedstr(DMTE.cdsIngDocs.FieldbyName('CCGLOSA').AsString) + ','
                             + quotedstr(DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString) + ', '
                             + floattostr(DMTE.cdsIngDocs.FieldByName('ECCOBLOC').AsFloat) + ', '
                             + floattostr(DMTE.cdsIngDocs.FieldByName('ECCOBEXT').AsFloat) + ', '
                             + quotedstr(DMTE.cdsIngDocs.FieldByName('ECANOMM').AsString) + ', '
                             + quotedstr(DMTE.cdsIngDocs.FieldbyName('TDIARID').AsString) + ','
                             + quotedstr(DMTE.cdsIngDocs.FieldbyName('ECNOCOMP').AsString) + ', '
                             + quotedstr(DMTE.cdsIngDocs.FieldbyName('CUENTAID').AsString) + ') ';
      End
      Else
      Begin
      // Actualización de Cabecera
         xSQL := 'update CXC303 '
            + '   set CUENTAID=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CUENTAID').AsString) + ', '
            + '       TMONID=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('TMONID').AsString) + ', '
            + '       NCOTCAMB=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('NCOTCAMB').AsString) + ', '
            + '       CLAUXID=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CLAUXID').AsString) + ', '
            + '       CLIEID=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CLIEID').AsString) + ', '
            + '       CLIERUC=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CLIERUC').AsString) + ', '
            + '       CCNOMB=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CCNOMB').AsString) + ', '
            + '       CPTOID=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CPTOID').AsString) + ', '
            + '       CCGLOSA=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CCGLOSA').AsString) + ', '
         // Inicio HPC_201405_CAJA
            + '       CCTREC=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString) + ', '
            + '       NCOMTOORI=' + floattostr(DMTE.cdsIngDocs.FieldbyName('NCOMTOORI').AsFloat) + ', '
            + '       NCOMTOLOC=' + floattostr(DMTE.cdsIngDocs.FieldbyName('NCOMTOLOC').AsFloat) + ', '
            + '       NCOMTOEXT=' + floattostr(DMTE.cdsIngDocs.FieldbyName('NCOMTOEXT').AsFloat) + '  '
         // Fin HPC_201405_CAJA
            + ' Where CIAID =' + QuotedStr(dblcCia.Text)
            + '   And DOCID =' + QuotedStr(dblcTDoc.Text)
            + '   And CCSERIE =' + QuotedStr(dbeSerie.Text)
            + '   And CCNODOC =' + QuotedStr(dbeNoDoc.Text);
      End;
      Try
         DMTE.DCOM1.AppServer.EjecutaSql(xsql);
      Except
         ShowMessage('No se pudo actualizar la Cabecera del Movimiento de Ingreso');
         xSigueGrab := False;
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;
   // ---------------------------------------------------------------------------------------------------
      AsignaClaveDetalle;
      If Not xSigueGrab Then
      Begin
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;

      Z2bbtnSumatClick(Sender);
      If DMTE.wModo = 'A' Then
         AsignaParametros;

      dblccia.Enabled := False;
      dblctdoc.Enabled := False;
      dbeSerie.Enabled := False;
      dbeNoDoc.Enabled := False;

      InsertaDetallePago;

      If DMTE.cdsDetFPago.recordcount > 0 Then
      Begin
         GrabaClave;
         If DMTE.cdsDetFPago.ApplyUpdates(0) > 0 Then
         Begin
            GrabaDetallePago;
            If Not xSigueGrab Then
            Begin
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               exit;
            End;
         End;
      End;
      DMTE.DCOM1.AppServer.GrabaTransaccion;
      ShowMessage('Grabación OK');

      DMTE.wModo := 'M';

      xInsercion := 'S';

      dbgDetPago.RefreshDisplay;

      Z2bbtnNuevo.Enabled := True;
      If DMTE.cdsDetFPago.RecordCount > 0 Then
      Begin
         Z2bbtnCancelado.Enabled := True;
         Z2bbtnGraba.Enabled := False
      End;

      Z2bbtnAnula.Enabled := True;
      lblEstadoMov.Caption := 'Activo';
      wModifica := False;
   End
   Else
   Begin
      ShowMessage('Imposible Grabar');
   End;

   If DMTE.cdsDetFPago.recordcount = 0 Then
      Z2bbtnCancelado.Enabled := False;
   If DMTE.cdsDetFPago.recordcount > 0 Then
      Z2bbtnCancelado.Enabled := True;

End;

Procedure TFIngresoCaja.Z2bbtnCanceladoClick(Sender: TObject);
Var
   xCobLoc, xCobExt: Currency;
   xSQL: String;
   sDoc, sFClie, xWhere, sAnt, sNoreg: String;
   xMes, xAno: String;
   xDatAux: StructSaldosAux;
   SystemTime: TSystemTime;
Begin
   If DMTE.cdsIngDocs.fieldByName('NCOESTADO').AsString = 'I' Then
   Begin
      If wModifica Then
      Begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      End;

      If MessageDlg('¿Efectuar la Cancelación del Documento?', mtConfirmation,
         [mbYes, mbNo], 0) = mrYes Then
      Begin
         DMTE.cdsIngDocs.edit;
         DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString := 'C';

       //Calculo de Cobrados soles dolares
         xCobLoc := OperClientDataSet(DMTE.cdsDetFPago, 'SUM(FC_RECIBIDO)', 'TMONID = ''' + DMTE.wTMonLoc + '''');
         xCobExt := OperClientDataSet(DMTE.cdsDetFPago, 'SUM(FC_RECIBIDO)', 'TMONID = ''' + DMTE.wTMonExt + '''');
         DMTE.cdsIngDocs.FieldByName('ECCOBLOC').AsFloat := xCobLoc;
         DMTE.cdsIngDocs.FieldByName('ECCOBEXT').AsFloat := xCobExt;
         DMTE.cdsIngDocs.FieldByName('NCOUSER').AsString := DMTE.wUsuario;
         DMTE.cdsIngDocs.FieldByName('NCOFREG').AsDateTime := Date + Time;
         DMTE.cdsIngDocs.FieldByName('NCOHREG').AsDateTime := Date + Time;
         DMTE.cdsIngDocs.Post;

         xSigueGrab := True;
         DMTE.DCOM1.AppServer.IniciaTransaccion;

         If DMTE.cdsIngDocs.Recordcount > 0 Then
         Begin
         // Actualización de Cabecera
            xSQL := 'update CXC303 '
               + '   set NCOESTADO=' + quotedstr(DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString) + ', '
               + '       ECCOBLOC=' + floattostr(DMTE.cdsIngDocs.FieldByName('ECCOBLOC').AsFloat) + ', '
               + '       ECCOBEXT=' + floattostr(DMTE.cdsIngDocs.FieldByName('ECCOBEXT').AsFloat) + ', '
               + '       NCOUSER=' + quotedstr(DMTE.cdsIngDocs.FieldByName('NCOUSER').AsString) + ', '
            // Inicio HPC_201405_CAJA
               + '       NCOFREG=trunc(sysdate), '
               + '       NCOHREG=sysdate, '
            // Fin HPC_201405_CAJA
               + '       CUENTAID=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CUENTAID').AsString) + ', '
               + '       TMONID=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('TMONID').AsString) + ', '
               + '       NCOTCAMB=' + floattostr(DMTE.cdsIngDocs.FieldbyName('NCOTCAMB').Asfloat) + ', '
               + '       CLAUXID=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CLAUXID').AsString) + ', '
               + '       CLIEID=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CLIEID').AsString) + ', '
               + '       CLIERUC=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CLIERUC').AsString) + ', '
               + '       CCNOMB=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CCNOMB').AsString) + ', '
               + '       CPTOID=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CPTOID').AsString) + ', '
               + '       CCGLOSA=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CCGLOSA').AsString) + ', '
               + '       CCTREC=' + quotedstr(DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString) + '  '
               + ' Where CIAID =' + QuotedStr(dblcCia.Text)
               + '   And DOCID =' + QuotedStr(dblcTDoc.Text)
               + '   And CCSERIE =' + QuotedStr(dbeSerie.Text)
               + '   And CCNODOC =' + QuotedStr(dbeNoDoc.Text);
            Try
               DMTE.DCOM1.AppServer.EjecutaSql(xsql);
            Except
            // Inicio HPC_201405_CAJA
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               ShowMessage('No se pudo actualizar la Cabecera del Movimiento de Ingreso');
               xSigueGrab := False;
            // Fin HPC_201405_CAJA
               exit;
            End;
         End;

         DMTE.ActSaldosCaja(DMTE.cdsIngDocs.FieldByName('CIAID').AsString, DMTE.cdsIngDocs.FieldByName('TMONID').AsString,
            DMTE.cdsIngDocs.FieldByName('BANCOID').AsString,
            DMTE.cdsIngDocs.FieldByName('NCOMTOORI').AsString, 'I', DMTE.cdsIngDocs.FieldByName('CCFEMIS').AsString);
         If Not xSigueGrab Then
         Begin
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

      // transferir Pagos a Servicios
         TransferirTablaServicios;
         If Not xSigueGrab Then
         Begin
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         GrabaEstadoFPago('C');
         If Not xSigueGrab Then
         Begin
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         xWhere := ' CIAID=' + QuotedStr(dblcCia.Text);
         sNoReg := DMTE.StrZero(DMTE.UltimoNum('prvCaja', 'CXC321', 'ANTINOREG', xWhere), 10);
         xWhere := 'DOC_FREG=' + quotedstr('R');
         sDoc := DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCID', xWhere, 'DOCID');
         xWhere := 'CLAUXCP=' + quotedstr('C');
         sFClie := DMTE.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXID', xWhere, 'CLAUXID');
         xWhere := ' CIAID=' + QuotedStr(dblcCia.Text);
         sAnt := DMTE.StrZero(DMTE.UltimoNum('prvCaja', 'CXC321', 'ANTIID', xWhere), 10);
         DMTE.BuscaFecha('TGE114', 'FECHA', 'FECHA', Date);

         If ((sDoc = DMTE.cdsIngDocs.FieldByName('DOCID').AsString) And (sFClie = DMTE.cdsIngDocs.FieldByName('CLAUXID').AsString)) Then
         Begin
            xSQL := 'INSERT INTO CXC321(CIAID, ANTIID, ANTINOREG, CLAUXID, CLIEID, CLIERUC, ANTIAPLICA, ANTIFECHA, ANTIESTADO, '
               + '                   ANTITCAM, TMONID, ANTISALORI, ANTISALLOC, ANTISALEXT, ANTIMTOORI, ANTIMTOLOC, ANTIMTOEXT, '
               + '                   BANCOID, FPAGOID, ANTINOCHEQ, ANTIANOMM, ANTIAAAA, ANTIMM, ANTIDD, ANTITRI, ANTISEM, ANTISS, '
               + '                   ANTIAATRI, ANTIAASEM, ANTIAASS, ANTIFREG, ANTIHREG, ANTIUSER)'
               + ' VALUES(' + quotedstr(DMTE.cdsIngDocs.FieldByName('CIAID').AsString) + ','
               + quotedstr(sAnt) + ','
               + quotedstr(sNoReg) + ','
               + quotedstr(DMTE.cdsIngDocs.FieldByName('CLAUXID').AsString) + ','
               + quotedstr(DMTE.cdsIngDocs.FieldByName('CLIEID').AsString) + ','
               + quotedstr(DMTE.cdsIngDocs.FieldByName('CLIERUC').AsString) + ','
               + quotedstr('00') + ','
               + DMTE.wRepFecServi + ','
               + quotedstr('I') + ','
               + DMTE.cdsIngDocs.FieldByName('NCOTCAMB').AsString + ','
               + quotedstr(DMTE.cdsIngDocs.FieldByName('TMONID').AsString) + ','
               + DMTE.cdsIngDocs.FieldByName('NCOMTOORI').AsString + ','
               + DMTE.cdsIngDocs.FieldByName('NCOMTOLOC').AsString + ','
               + DMTE.cdsIngDocs.FieldByName('NCOMTOEXT').AsString + ','
               + DMTE.cdsIngDocs.FieldByName('NCOMTOORI').AsString + ','
               + DMTE.cdsIngDocs.FieldByName('NCOMTOLOC').AsString + ','
               + DMTE.cdsIngDocs.FieldByName('NCOMTOEXT').AsString + ','
               + quotedstr(DMTE.cdsDetFPago.FieldByName('BANCOID').AsString) + ','
               + quotedstr(DMTE.cdsDetFPago.FieldByName('FPAGOID').AsString) + ','
               + quotedstr(DMTE.cdsDetFPago.FieldByName('ECNOCHQ').AsString) + ','
               + quotedstr(DMTE.cdsQry.FieldByName('FecAno').AsString
               + DMTE.cdsQry.FieldByName('FecMes').AsString) + ','
               + quotedstr(DMTE.cdsQry.FieldByName('FecAno').AsString) + ','
               + quotedstr(DMTE.cdsQry.FieldByName('FecMes').AsString) + ','
               + quotedstr(DMTE.cdsQry.FieldByName('FecDia').AsString) + ','
               + quotedstr(DMTE.cdsQry.FieldByName('FecTrim').AsString) + ','
               + quotedstr(DMTE.cdsQry.FieldByName('FecSem').AsString) + ','
               + quotedstr(DMTE.cdsQry.FieldByName('FecSS').AsString) + ','
               + quotedstr(DMTE.cdsQry.FieldByName('FecAATri').AsString) + ','
               + quotedstr(DMTE.cdsQry.FieldByName('FecAASem').AsString) + ','
               + quotedstr(DMTE.cdsQry.FieldByName('FecAASS').AsString) + ','
               + DMTE.wRepFecServi + ','
               + DMTE.wRepHorServi + ','
               + quotedstr(DMTE.wUsuario) + ')';
         // Inicio HPC_201309_CAJA
            Try
               DMTE.DCOM1.AppServer.EjecutaSql(xsql);
            Except
               ShowMessage('Error al actualizar CXC321');
               xSigueGrab := False;
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               exit;
            End;
         // Fin HPC_201309_CAJA

            xSQL := ' INSERT INTO CXC322(CIAID, ANTIID, ANTINOREG, CLAUXID, CLIEID, CLIERUC, ANTIFECORI, ANTITIPO, DOCID, '
               + '                    CCSERIE, NODOCORI, ANTIFREG,ANTIHREG,ANTIUSER) '
               + ' VALUES(' + quotedstr(DMTE.cdsIngDocs.FieldByName('CIAID').AsString) + ','
               + quotedstr(sAnt) + ','
               + quotedstr(sNoReg) + ','
               + quotedstr(DMTE.cdsIngDocs.FieldByName('CLAUXID').AsString) + ','
               + quotedstr(DMTE.cdsIngDocs.FieldByName('CLIEID').AsString) + ','
               + quotedstr(DMTE.cdsIngDocs.FieldByName('CLIERUC').AsString) + ','
               + DMTE.wRepFecServi + ','
               + quotedstr('02') + ','
               + quotedstr(DMTE.cdsIngDocs.FieldByName('DOCID').AsString) + ','
               + quotedstr(DMTE.cdsIngDocs.FieldByName('CCSERIE').AsString) + ','
               + quotedstr(DMTE.cdsIngDocs.FieldByName('CCNODOC').AsString) + ','
               + DMTE.wRepFecServi + ','
               + DMTE.wRepHorServi + ','
               + quotedstr(DMTE.wUsuario) + ')';
         // Inicio HPC_201309_CAJA
            Try
               DMTE.DCOM1.AppServer.EjecutaSql(xsql);
            Except
               ShowMessage('Error al actualizar CXC322');
               xSigueGrab := False;
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               exit;
            End;
         // Fin HPC_201309_CAJA

            With xDatAux Do
            Begin
               CIAID := DMTE.cdsIngDocs.FieldByName('CIAID').AsString;
               CLAUXID := DMTE.cdsIngDocs.FieldByName('CLAUXID').AsString;
               AUXID := DMTE.cdsIngDocs.FieldByName('CLIEID').AsString;
               MONTOMN := floattostr(DMTE.cdsIngDocs.FieldByName('NCOMTOLOC').AsFloat);
               If trim(MONTOMN) = '' Then
                  MONTOMN := '0';

               MONTOME := floattostr(DMTE.cdsIngDocs.FieldByName('NCOMTOEXT').AsFloat);
               If trim(MONTOME) = '' Then
                  MONTOME := '0';

               FECHA := dbdtpFEmision.date;
               If trim(MTOSLOC) = '' Then
                  MTOSLOC := '0';

               If trim(MTOSEXT) = '' Then
                  MTOSEXT := '0';

               xMes := strMes(xDatAux.FECHA);
               xAno := strAno(xDatAux.FECHA);
               DMTE.ActSdoAuxiliar(xDatAux.CIAID, xANO, xMES, xDatAux.CLAUXID, xDatAux.AUXID,
                  xDatAux.MONTOMN, xDatAux.MONTOME, xDatAux.MTOSLOC, xDatAux.MTOSEXT, '-');
            // Inicio HPC_201309_CAJA
               If Not xSigueGrab Then
               Begin
                  DMTE.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               End;
            // Fin HPC_201309_CAJA
            End;
         End;

         If (DMTE.SRV_D = 'DB2400') Then
            If DMTE.cdsDetFPago.ApplyUpdates(0) > 0 Then
               Raise Exception.create('Error en la grabación de los detalles de cancelación');

         Z2dbgDetPagoIButton.Enabled := False;
         Z2bbtnAdicFPago.Enabled := False;
         Z2bbtnSumat.Enabled := False;
         Z2bbtnCont.Enabled := True;
         Z2bbtnEmite.Enabled := True;
         Z2bbtnSube.Enabled := False;
         Z2bbtnGraba.Enabled := False;
         Z2bbtnCancelado.Enabled := False;
         Z2bbtnCancel2.Enabled := False;
         Z2bbtnAnula.Enabled := True;
         lblEstadoMov.Caption := 'Cancelado';
         Beep;
         DMTE.DCOM1.AppServer.GrabaTransaccion;
         MessageDlg('Datos Actualizados', mtCustom, [mbOk], 0);
      End;
   End;
End;

Procedure TFIngresoCaja.TransferirTablaServicios;
Var
   xSQL: String;
Begin
   xSQL := 'Insert Into CXC_ING_VAR_SER(CIAID, CLAUXID, CLIEID, RUCDNI, NOMBRE, CPTOID, '
      + '                            TMONID, IMPORTE, FORPAG, FECPAG, TIPCAM, USUREG, FECREG, DOCPAG, NUMDOCPAG ) '
      + 'Select CIAID, CLAUXID, CLIEID, CLIERUC, CCNOMB, CPTOID, '
      + '       TMONID, NCOMTOORI, ''CAJA'', CCFEMIS, NCOTCAMB, NCOUSER, sysdate, DOCID, CCNODOC '
      + '  From CXC303 A '
      + ' Where A.CIAID=' + quotedstr(dblcCia.text)
      + '   and CCNODOC=' + quotedstr(dbeNoDoc.Text);
   Try
      DMTE.DCOM1.AppServer.EjecutaSql(xsql);
   Except
// Inicio HPC_201309_CAJA
      ShowMessage('Error al actualizar Tabla de Servicios');
      xSigueGrab := False;
      exit;
// Final HPC_201309_CAJA
   End;
End;

Procedure TFIngresoCaja.EliminaAnulados;
Var
   xSQL: String;
Begin
   xSQL := 'Delete from CXC_ING_VAR_SER '
         + ' Where CIAID=''' + dblcCia.text + ''' AND NUMDOCPAG=''' + dbeNoDoc.Text + '''';
   Try
      DMTE.DCOM1.AppServer.EjecutaSql(xsql);
   Except
      xSigueGrab := False;
   End;
End;

Function TFIngresoCaja.ValidaCampo: Boolean;
Var
   xWhere,
      aux: String;
Begin
   Result := True;
   With DMTE Do
   Begin
      If cdsRegCxC.FieldByname('DEMTOORI').AsFloat <= 0 Then
      Begin
         ShowMessage('Importe debe ser mayor que cero');
         Result := False;
         exit;
      End;

      If Length(trim(dbePreUni.Text)) <= 0 Then
      Begin
         ShowMessage('Debe Ingresar Precio Unitario');
         Result := False;
         Exit;
      End;
      If StrToFloat(dbePreUni.Text) <= 0 Then
      Begin
         ShowMessage('Precio Unitario debe se Mayor a Cero');
         Result := False;
         Exit;
      End;

      If seCantidad.Value <= 0 Then
      Begin
         ShowMessage('Cantidad debe ser mayor que cero');
         Result := False;
         exit;
      End;

      If cdsRegCxC.FieldByname('CPTOID').AsString = '' Then
      Begin //Concepto
         ShowMessage('Falta Concepto');
         dblcdCnp22.SetFocus;
         Result := False;
         exit;
      End
      Else
      Begin // Cuenta
         aux := DMTE.cdsRegCxC.FieldByname('CUENTAID').AsString;
         If length(aux) = 0 Then
         Begin
            ShowMessage('Codigo de Concepto Errado');
            dblcdCnp22.SetFocus;
            Result := False;
            exit;
         End;
      End;

   // Validación de centro de costo y auxiliares
      If (dblcdCCosto.Enabled) Then
      Begin //Centro de Costo
         If (length(cdsRegCxC.FieldByName('CCOSID').AsString) = 0) Then
         Begin
            ShowMessage('Falta Centro de Costo');
            dblcdCCosto.SetFocus;
            Result := False;
            exit;
         End
         Else
         Begin
            xWhere := 'CCosID=' + '''' + cdsRegCxC.FieldByName('CCOSID').AsString + ''' AND CCOSACT=''S''';
            aux := DisplayDescrip('prvTGE', 'TGE203', 'CCOSDES', xWhere, 'CCosDes');
            If length(aux) = 0 Then
            Begin
               ShowMessage('Codigo de Centro de Costo Errado');
               dblcdCCosto.SetFocus;
               Result := False;
               exit;
            End;
         End;
      End;

      If (dblcClaseDet.Enabled) Then
      Begin
         If trim(dblcClaseDet.Text) = '' Then
         Begin
            ShowMessage('Ingrese Clase de Auxiliar');
            dblcClaseDet.SetFocus;
            Result := False;
            exit;
         End;

         If trim(dblcdAuxDet.Text) = '' Then
         Begin
            ShowMessage('Ingrese Auxiliar');
            dblcdAuxDet.SetFocus;
            Result := False;
            exit;
         End
      End;
//fin de validaciones

      If length(cdsRegCxC.FieldByName('DEDH').AsString) = 0 Then
      Begin
         ShowMessage('Falta especificar Debe / Haber');
         dbeDH.SetFocus;
         Result := False;
         exit;
      End;
   End;
End;

Procedure TFIngresoCaja.Z2bbtnAnulaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select * from CAJ_LOG_ING '
      + ' Where CIAID=''' + dblcCia.Text + ''' '
      + '   and FECOPE=''' + DateToStr(dbdtpFEmision.Date) + ''' '
      + '   and USUCAJ=''' + DMTE.cdsIngDocs.FieldByName('NCOUSER').AsString + '''';
   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.FieldByName('ESTADO').AsString = 'C' Then
   Begin
      Showmessage('Caja ya Fue Cerrada, No se puede realizar el Proceso');
      Exit;
   End;

   xSQL := 'Select * from CAJ_USU_SUP '
      + ' Where USUCAJ=''' + DMTE.cdsIngDocs.FieldByName('NCOUSER').AsString + ''' '
      + '   and USUSUP=''' + DMTE.wUsuario + '''';
   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.RecordCount <= 0 Then
   Begin
      Showmessage('Supervisor no esta Autorizado a Anular este Recibo.' + #13 + 'Cajero esta asignado a otro Supervisor');
      Exit;
   End;

   Try
      fAnula := False;
      FAnulaRecibo := TFAnulaRecibo.Create(Self);
      FAnulaRecibo.ShowModal;

      If fAnula Then
      Begin
         DMTE.cdsIngDocs.CancelUpdates;
         DMTE.cdsRegCxC.CancelUpdates;
         DMTE.cdsIngDocs.edit;
         DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString := 'A';
         DMTE.cdsIngDocs.FieldByName('FECANU').AsDateTime := Date + Time;
         DMTE.cdsIngDocs.FieldByName('OBSANU').AsString := Copy(FAnulaRecibo.mObs.Text, 1, 100);
         DMTE.cdsIngDocs.FieldByName('USUANU').AsString := DMTE.wUsuario;
         DMTE.cdsIngDocs.Post;

      // Inicio HPC_201309_CAJA
      // cambia forma de grabación para que sea en forma directa con sentencia SQL
         {
         xSQL := 'Select * From CXC303'
            + ' Where CIAID =' + QuotedStr(dblcCia.Text)
            + '   And DOCID =' + QuotedStr(dblcTDoc.Text)
            + '   And CCSERIE =' + QuotedStr(dbeSerie.Text)
            + '   And CCNODOC =' + QuotedStr(dbeNoDoc.Text);
         DMTE.cdsIngDocs.DataRequest(xSQL);
         DMTE.AplicaDatos(DMTE.cdsIngDocs, 'INGDOCS');
         }
         xSigueGrab := True;
         DMTE.DCOM1.AppServer.IniciaTransaccion;
         xSQL := 'update CXC303 '
                +'   set NCOESTADO=''A'', '
                +'       FECANU = sysdate, '
                +'       OBSANU = '+quotedstr(DMTE.cdsIngDocs.FieldByName('OBSANU').AsString)+','
                +'       USUANU = '+quotedstr(DMTE.cdsIngDocs.FieldByName('USUANU').AsString)
                + ' Where CIAID =' + QuotedStr(dblcCia.Text)
                + '   And DOCID =' + QuotedStr(dblcTDoc.Text)
                + '   And CCSERIE =' + QuotedStr(dbeSerie.Text)
                + '   And CCNODOC =' + QuotedStr(dbeNoDoc.Text);
         Try
            DMTE.DCOM1.AppServer.EjecutaSql(xSQL);
         Except
            xSigueGrab := False;
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            ShowMessage('No se pudo ANULAR la Cabecera del Movimiento de Ingreso');
            exit;
         End;

         EliminaAnulados; // retira de Ingreso por cobro de Servicios (para los que son jalados para facturación)
         if not xSigueGRab then
         Begin
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

         GrabaEstadoFPago('A');
         if not xSigueGRab then
         Begin
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
         DMTE.DCOM1.AppServer.GrabaTransaccion;
         ShowMessage('Grabación OK');
      // Fin HPC_201309_CAJA

         FAnulaRecibo.Free;

         mAnula.Visible := True;
         mAnula.Text := DMTE.cdsIngDocs.FieldByName('OBSANU').AsString;

         Z2dbgDetPagoIButton.Enabled := False;
         Z2bbtnAdicFPago.Enabled := False;
         Z2bbtnNuevo.Enabled := True;
         Z2bbtnSube.Enabled := False;
         Z2bbtnGraba.Enabled := False;
         Z2bbtnCancelado.Enabled := False;
         Z2bbtnCancel2.Enabled := False;
         Z2bbtnAnula.Enabled := False;
         lblEstadoMov.Caption := 'Anulado';
      End;

   Except
   End;
End;

Procedure TFIngresoCaja.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin

   If DMTE.cdsIngDocs.Active Then
      DMTE.cdsIngDocs.CancelUpdates;

   If DMTE.cdsRegCxC.Active Then
      DMTE.cdsRegCxC.CancelUpdates;

   If (DMTE.cdsIngDocs.FieldByname('CCTREC').AsString = '') And (DMTE.cdsIngDocs.recordcount = 1) Then
   Begin
      DMTE.cdsIngDocs.Delete;
   // Inicio HPC_201309_CAJA
   // cambia forma de grabación para que sea en forma directa con sentencia SQL
      {
      DMTE.AplicaDatos(DMTE.cdsIngDocs, 'INGDOCS');
      }
      If DMTE.cdsIngDocs.ApplyUpdates(0)>0 Then
      Begin
         ShowMessage('Error al intentar borrar los registros temporales de Ingreso');
      End;
   End;

   If pnlActualiza.Visible Then
   Begin
      Z2bbtnCancelDet.SetFocus;
      Z2bbtnCancelDetClick(Sender);
   End;

   DMTE.cdsAux.IndexFieldNames := '';

   DMTE.cdsBanco.Filtered := False;
   DMTE.cdsCCBco.Filtered := False;
   DMTE.cdsTDoc.Filtered := False;
   cf1.QuitarExits(self);

   DMTE.cdsRegCxC.BeforePost := Nil;
   DMTE.cdsDetFPago.BeforePost := Nil;
   cf1.Free;

   cdsTarjeta.Free;
   cdsBanco.Free;

   FRegistro.xFiltroIng.RefreshFilter;

   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;
   Action := caFree;
End;

Procedure TFIngresoCaja.IniciaPanel;
Begin
   dblcdCnp22.Text := '';
   edtCuenta2.Text := '';
   dblcdCCosto.Text := '';
   dbeDH.Text := '';
   dblcTMon2.Text := '';
   edtTMon2.Text := '';
   dbeImporte2.Text := '';
   dbePreUni.Text := '';
   dbeTCamPr.Text := '';
   edtMtoLoc.Text := '';
   edtMtoExt.Text := '';

   edtCnp2.Text := '';
   edtTMon2.Text := '';
   edtCnp2.Text := '';
   dbeAuxDet.Text := '';
End;

Procedure TFIngresoCaja.Z2dbgDetPagoIButtonClick(Sender: TObject);
Begin
   If DMTE.cdsRegCxC.RecordCount >= 8 Then
   Begin
      ShowMessage('Solo puede registrar Maximo cinco (8) detalles');
      Exit;
   End;

   pnlDetPago.Enabled := False;
   pnlBotones.Enabled := False;
   pnlActualiza.BringToFront;
   pnlActualiza.Visible := True;
   IniciaPanel;
   adicionaRegistro;
End;

Procedure TFIngresoCaja.Z2bbtnCancelDetClick(Sender: TObject);
Begin
   If DMTE.cdsRegCxC.State = dsInsert Then
   Begin
      DMTE.cdsRegCxC.Delete;
   End
   Else
   Begin
      DMTE.cdsRegCxC.Cancel;
   End;
   pNLaCTUALIZA.SetFocus;
   PnlActualiza.Visible := False;
   pnlDetPago.Enabled := True;
   pnlBotones.Enabled := True;
   Z2bbtnSumatClick(sender); // Al salir hay que totalizar
End;

Procedure TFIngresoCaja.Z2bbtnOKDetClick(Sender: TObject);
Begin
   // VALIDA LA CUENTA DEL CONCEPTO
   If (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text, dblcdCnp22.text, '')) And (dblcTMon2.text = DMTE.wTMonLoc) Then
   Begin
      Raise Exception.Create('La cuenta ' + DMTE.cdsQry.FieldByName('CUENTAID').AsString + ' del Concepto ' + dblcdCnp22.text + ' Se registra sólo en Moneda Extranjera.');
   End;

   If DMTE.cdsRegCxC.State = dsInsert Then
      If EncuentraDuplicado(DMTE.cdsRegCxC, 'CPNoReg', dbeNoReg.Text) Then
      Begin
         ShowMessage('Número de Registro duplicado');
         exit;
      End;

   If dblcdCnp.text = 'IN0050' Then
   Begin
      If EncuentraDuplicado(DMTE.cdsRegCxC, 'CPTOID', dblcdCnp22.Text) Then
      Begin
         ShowMessage('Encinas se debe Registrar un Recibo por Persona');
         exit;
      End;

      If DMTE.cdsRegCxC.RecordCount > 0 Then
      Begin
         ShowMessage('Encinas se debe Registrar Solo, NO debe registrar dos Conceptos');
         exit;
      End;
   End;

   // BuscaNRecibo;
   DMTE.cdsRegCxC.FieldByName('DENUMREG').AsString := dbeNoDoc.text;
   DMTE.cdsRegCxC.FieldByName('DEDH').AsString := dbeDH.text;
   edNumReg.text := DMTE.cdsRegCxC.FieldByName('DENUMREG').AsString;

   DMTE.cdsRegCxC.FieldByName('CPTOID').AsString := dblcdCnp22.text;
   DMTE.cdsRegCxC.FieldByName('CCOSID').AsString := dblcdCCosto.text;
   DMTE.cdsRegCxC.FieldByName('TMONID').AsString := dblcTMon2.text;

   If Not dblcdAuxDet.Enabled Then
   Begin
      DMTE.cdsRegCxC.FieldByName('PROV').AsString := '';
      DMTE.cdsRegCxC.FieldByName('CLAUXID').AsString := '';
      edtClaseDet.Text := '';
      dbeAuxDet.Text := '';
   End
   Else
   Begin
      DMTE.CdsRegCxC.FieldByName('CLAUXID').AsString := dblcClaseDet.Text;
      DMTE.CdsRegCxC.FieldByName('PROV').AsString := dblcdAuxDet.Text;
   End;

   If Not ValidaCampo Then
      ShowMessage('No se puede grabar')
   Else
   Begin
      cdsPost(DMTE.cdsRegCxC);

      DMTE.cdsRegCxC.Post;
      wModifica := True;

      If Not dbeNoReg.Enabled Then
      Begin
         pnlActualiza.SetFocus;
         PnlActualiza.Visible := False;
         pnlDetPago.Enabled := True;
         pnlBotones.Enabled := True;
         z2bbtnSumatClick(sender); // Al salir hay que totalizar
      End
      Else
      Begin
         adicionaRegistro;
      End;
   End;
End;

Procedure TFIngresoCaja.dbgDetPagoKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (Z2dbgDetPagoIButton.Enabled = True) And (key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If (DMTE.cdsRegCxC.RecordCount = 0) Then
         ShowMessage('No hay registros')
      Else
      Begin
         If MessageDlg('¿Eliminar Registro?', mtconfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            DMTE.cdsRegCxC.Delete; // Borro en el original..
            RecalculaReg;
            Z2bbtnSumatClick(sender); // Al salir hay que totalizar
         End;
      End;
   End;
End;

Procedure TFIngresoCaja.Z2bbtnCancelCabClick(Sender: TObject);
Var
   Doc: structDocIng;
Begin
   //Cancela las Actualizaciones Realizadas
   edNumReg.Text := '';
   DMTE.cdsIngDocs.CancelUpdates;
   DMTE.cdsRegCxC.CancelUpdates;
   If DMTE.wModo <> 'A' Then
   Begin
      With Doc Do
      Begin
         CIAID := dblcCia.Text;
         CCTREC := 'NP';
         DOCID := dblcTDoc.Text;
         CCSERIE := trim(dbeSerie.Text);
         CCNODOC := trim(dbeNoDoc.Text);
      End;
      Edita(doc, cdsFiltro);
   End
   Else
      Adiciona;
   pnlCabecera1.SetFocus;
   perform(CM_DialogKey, VK_TAB, 0);
End;

Procedure TFIngresoCaja.Z2bbtnOKCabClick(Sender: TObject);
Var
   xSQL, xWhere: String;
   xMonLoc, xMonExt: Double;
Begin
   ValidaCab;

   If dbeGiradoA.Text = 'CLIENTES VARIOS' Then
   Begin
      ShowMessage('Ingresar Nombre del Cliente / Asociado. NO puede llamarse CLIENTES VARIOS');
      dbeGiradoA.SetFocus;
      Exit;
   End;

   xDescrip := 'CPTOID=' + quotedstr(dblcdCnp.text) + ' AND TMONID=''' + dblcTMonCab.Text + '''';
   If DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTODES', xDescrip, 'CPTODES') = '' Then
   Begin
      showmessage('Concepto No se encuentra registrado para esta Transacción');
      dblcdCnp.SetFocus;
      Exit;
   End;

   If (Length(edtAuxRuc.Text)<8) Then
   Begin
      ShowMessage('Debe Ingresar Documento de Identidad');
      edtAuxRuc.SetFocus;
      Exit;
   End;

   If StrToFloat(edtAuxRuc.Text) <= 0 Then
   Begin
      ShowMessage('Debe Ingresar Correctamente el D.N.I. o R.U.C.');
      edtAuxRuc.SetFocus;
      Exit;
   End;

   // VALIDA LA CUENTA DEL CONCEPTO
   If (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text, dblcdCnp.text, '')) And (dblcTMonCab.text = DMTE.wTMonLoc) Then
   Begin
      Raise Exception.Create('La cuenta ' + edtCuenta.text + ' del Concepto ' + dblcdCnp.text + ' Se registra sólo en Moneda Extranjera.');
   End;

   If DMTE.wModo = 'A' Then
   Begin

      If (DMTE.cdsIngDocs.fieldbyName('NCOESTADO').AsString = '') Then
      Begin
         dbeSerie.Text := 'CAJA';
         xWhere := 'CIAID=''' + dblcCia.Text + ''' and '
            + 'DOCID=''' + dblcTDoc.Text + ''' and '
            + ' ' + DMTE.wReplacCeros + '(CCSERIE,'''')=''' + dbeSerie.Text + ''' and '
            + 'CCNODOC=''' + dbeNoDoc.Text + ''' ';
         If DMTE.DisplayDescrip('prvTGE', 'CXC303', 'COUNT(*) TOTREG', xWhere, 'TOTREG') > '0' Then
         Begin
            ShowMessage('El Número de Documento ya Ha sido Ingresado. Se Cambiara por el Siguiente...');
            BuscaNRecibo;
         End;

         DMTE.cdsIngDocs.Edit;
         DMTE.cdsIngDocs.FieldbyName('CIAID').AsString := dblcCia.Text;
         DMTE.cdsIngDocs.FieldbyName('BANCOID').AsString := dblcBanco.Text;
         DMTE.cdsIngDocs.FieldbyName('CCFEMIS').AsDateTime := dbdtpFEmision.Date;
         DMTE.cdsIngDocs.FieldbyName('DOCID').AsString := dblcTDoc.Text;
         DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString := trim(dbeSerie.Text);
         DMTE.cdsIngDocs.fieldbyName('NCOESTADO').AsString := 'I';
         cdspost(DMTE.cdsIngDocs);
         dblcCia.Enabled := False;
         dblcTDoc.Enabled := False;
         dbeSerie.Enabled := False;
         dbeNoDoc.Enabled := False;
         dbdtpFEmision.Enabled := False;
         dblcBanco.Enabled := False;
         edNumReg.Enabled := False;

      End;
   End;

   DMTE.cdsIngDocs.Edit;
   DMTE.cdsIngDocs.FieldbyName('CUENTAID').AsString := edtCuenta.Text;
   DMTE.cdsIngDocs.FieldbyName('TMONID').AsString := dblcTMonCab.Text;
   DMTE.cdsIngDocs.FieldbyName('NCOTCAMB').AsString := dbeTCambio.Text;

// Inicio HPC_201801_CXC
// cambios por búsqueda del Maestro de Clientes
   {
   DMTE.cdsIngDocs.FieldbyName('CLAUXID').AsString := dblcClase.Text;

   If (dblcClase.Text <> 'C') And (dblcClase.Text <> 'AS') Then
      DMTE.cdsIngDocs.FieldbyName('CLIEID').AsString := dblcdAux.Text
   Else
      If (dblcClase.Text = 'C') And (edtAux.Text <> '') Then
         DMTE.cdsIngDocs.FieldbyName('CLIEID').AsString := edtAux.Text
      Else
         DMTE.cdsIngDocs.FieldbyName('CLIEID').AsString := dblcdAso.Text;

   DMTE.cdsIngDocs.FieldbyName('CLIERUC').AsString := edtAuxRUC.Text;
   }
   DMTE.cdsIngDocs.FieldByName('CLAUXID').AsString := dblcClase.Text;
   DMTE.cdsIngDocs.FieldByName('CLIEID').AsString  := edtAux.Text;
   DMTE.cdsIngDocs.FieldByName('CLIERUC').AsString := edtAuxRUC.Text;
// Fin HPC_201801_CXC

   DMTE.cdsIngDocs.FieldbyName('CCNOMB').AsString := dbeGiradoA.Text;
   DMTE.cdsIngDocs.FieldbyName('CPTOID').AsString := dblcdCnp.Text;
   DMTE.cdsIngDocs.FieldbyName('CCGLOSA').AsString := dbeGlosa.Text;
   DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString := 'NP';

   pnlDetPago.enabled := True;
   pnlCabecera1.enabled := False;

   ActivaBotones(pnlCabecera1, False);
   pnlDetPago.Enabled := True;
   pnlBotones.Enabled := True;
   If wmodifica Then
   Begin
      Z2bbtnGraba.Enabled := True;
      Z2bbtnNuevo.Enabled := False;
   End
   Else
   Begin
      Z2bbtnNuevo.Enabled := True;
      If DMTE.cdsDetFPago.RecordCount > 0 Then
      Begin
         Z2bbtnGraba.Enabled := False;
         Z2bbtnCancelado.Enabled := True;
      End
      Else
      Begin
         Z2bbtnGraba.Enabled := True;
         Z2bbtnCancelado.Enabled := False;
      End;
      Z2bbtnAnula.Enabled := True;
   End;
   Z2bbtnSube.Enabled := True;
   Z2bbtnCancel2.Enabled := True;

   If Not DMTE.cdsClaseAux.Locate('CLAUXID', VarArrayOf([dblcClase.Text]), []) Then
      Showmessage('Error en la Búsqueda del Auxiliar');

   If DMTE.cdsRegCxC.RecordCount = 0 Then
   Begin
      Z2dbgDetPagoIButtonClick(Nil);
   End
   Else
   Begin
        //Comprobar si no ha habido un  cambio en el tipo de cambio
      If (dblcTMonCab.Text <> DMTE.cdsRegCxC.FieldByName('TMONID').AsString) Or
         (strtocurr(dbeTCambio.Text) <> (DMTE.cdsRegCxC.FieldByName('DETCDOC').AsFloat)) Then
      Begin
         ActualizaDetalle;
         z2bbtnSumatClick(sender)
      End;
   End;
   dblcdCnp22.Enabled := True;
End;

Procedure TFIngresoCaja.RecalculaReg;
Var
   xcont: integer;
Begin
   xcont := 0;
   DMTE.cdsRegCxC.DisableControls;
   DMTE.cdsRegCxC.First;
   While Not DMTE.cdsRegCxC.Eof Do
   Begin
      xcont := xcont + 1;
      DMTE.cdsRegCxC.Edit;
      DMTE.cdsRegCxC.FieldByName('CPNOREG').AsString := DMTE.strzero(inttostr(xcont), 10);
      DMTE.cdsRegCxC.Post;
      DMTE.cdsRegCxC.Next;
   End;
   DMTE.cdsRegCxC.First;
   DMTE.cdsRegCxC.EnableControls;
End;

Procedure TFIngresoCaja.FormKeyPress(Sender: TObject; Var Key: Char);
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

Procedure TFIngresoCaja.FormShow(Sender: TObject);
Var
   xsql: String;
Begin
   xsql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S'' AND CCOSACT=''S''';
   DMTE.cdsCCosto.Close;
   DMTE.cdsCCosto.DataRequest(xsql);
   DMTE.cdsCCosto.open;
   xInsercion := '';
   dbeSerie.Text := 'CAJA';

   FocoInicial;
   If DMTE.wModo = 'A' Then
   Begin
      dbgDetPago.ColumnByName('DEMTOLOC').FooterValue := '0.00';
      dbgDetPago.ColumnByName('DEMTOEXT').FooterValue := '0.00';
      dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue := '0.00';
      dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue := '0.00';
   End
   Else
   Begin
      dbgDetPago.ColumnByName('DEMTOLOC').FooterValue := DMTE.cdsingdocs.FieldbyName('NCOMTOLOC').AsString;
      dbgDetPago.ColumnByName('DEMTOEXT').FooterValue := DMTE.cdsingdocs.FieldbyName('NCOMTOEXT').AsString;
      dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue := DMTE.cdsingdocs.FieldbyName('NCOMTOLOC').AsString;
      dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue := DMTE.cdsingdocs.FieldbyName('NCOMTOEXT').AsString;

      If DMTE.cdsDetFPago.recordcount = 0 Then
      Begin
         dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue := '0.00';
         dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue := '0.00';
      End;
   End;
   cf1.PonerExits;
   xdnumreg := edNumReg.Text;

   DMTE.cdsTDoc.Filtered := False;
   DMTE.cdsTDoc.Filter := '';
   DMTE.cdsTDoc.Filter := ' ( FCING = ''S'' OR  FCING = ''1'') and DOCMOD=''CAJA'' ';
   DMTE.cdsTDoc.Filtered := True;

   If DMTE.Wmodo = 'A' Then
   Begin
      If DMTE.cdsTDoc.recordcount = 1 Then
      Begin
         dblcTDoc.Text := DMTE.cdsTDoc.FieldByName('DOCID').AsString;
         edtTDoc.Text := DMTE.cdsTDoc.FieldByName('DOCDES').AsString;
         dblcTDoc.Enabled := False;
      End;

      DMTE.cdsTMon.First;
      dblcTMonCab.Text := DMTE.cdsTMon.FieldByName('TMONID').AsString;
      edtTMonCab.Text := DMTE.cdsTMon.FieldByName('TMONABR').AsString;

      DMTE.cdsBanco.Filtered := False;
      DMTE.cdsBanco.Filter := '';
      DMTE.cdsBanco.Filter := 'BCOTIPCTA=''C''';
      DMTE.cdsBanco.Filtered := True;

      If DMTE.cdsBanco.RecordCount = 1 Then
      Begin
         dblcBanco.enabled := False;
         dblcBanco.text := DMTE.cdsBanco.FieldByName('BANCOID').AsString;
         edtBanco.text := DMTE.cdsBanco.FieldByName('BANCONOM').AsString;
         xDescrip := 'CIAID=''' + dblcCia.Text + ''' AND BANCOID=' + quotedstr(dblcBanco.text);
         dblcTMonCab.text := DMTE.DisplayDescrip('prvTGE', 'TGE106', 'TMONID', xDescrip, 'TMONID');
      End;

      If dblcCia.Enabled Then
         dblcCia.SetFocus
      Else
      Begin
         If dblcBanco.Enabled Then
            dblcBanco.SetFocus
         Else
            dblcClase.SetFocus;
      End;
   End
   Else
   Begin
      dblcCia.Enabled := False;
      dblcTDoc.Enabled := False;
      dbeSerie.Enabled := False;
      dbeNoDoc.Enabled := False;
      dbdtpFEmision.Enabled := False;
      dblcBanco.Enabled := False;
      edNumReg.Enabled := False;
      if DMTE.cdsIngDocs.FieldByName('CLAUXID').AsString='AS' then
         dblcdAso.Text := DMTE.cdsIngDocs.FieldByName('CLIEID').AsString
      else
         if DMTE.cdsIngDocs.FieldByName('CLAUXID').AsString='C' then
            edtAux.Text := DMTE.cdsIngDocs.FieldByName('CLIEID').AsString
         else
            dblcdAux.Text := DMTE.cdsIngDocs.FieldByName('CLIEID').AsString;
      If DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'I' Then
         dbeGlosa.SetFocus;
   End;
End;

Procedure TFIngresoCaja.AdicionaRegistro;
Var
   aux, xWhere: String;
Begin
   BlanqueaEdits(pnlActualiza);

   dbeNoReg.Text := '';
   DMTE.cdsRegCxC.Insert;
   DMTE.cdsRegCxC.FieldByName('CPNOREG').AsString := DMTE.strzero(GeneraCorrelativo(DMTE.cdsRegCxC, 'CPNOREG'), 10);
   DMTE.cdsRegCxC.FieldByName('CIAID').AsString := dblcCia.Text;
   DMTE.cdsRegCxC.FieldByName('DOCID2').AsString := dblcTDoc.Text;
   DMTE.cdsRegCxC.FieldByName('CPSERIE').AsString := dbeSerie.Text;
   DMTE.cdsRegCxC.FieldByName('CPFEMIS').Value := dbdtpFEmision.Date;
   DMTE.cdsRegCxC.fieldbyName('TMONID').AsString := dblcTMonCab.Text;
   DMTE.cdsRegCxC.FieldbyName('CPTOID').AsString := dblcdCnp.Text;
   DMTE.cdsRegCxC.FieldbyName('CANTIDAD').AsString := '1';
   DMTE.cdsRegCxC.fieldbyName('DETCDOC').AsString := dbeTCambio.Text;
   DMTE.cdsRegCxC.FieldByName('DEDH').AsString := 'H'; //Inicializo en haber

   xWhere := 'FECHA=' + DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha, dbdtpFEmision.Date) + ''')';
   aux := DMTE.DisplayDescrip('prvTGE', 'TGE114', '*', xWhere, 'FECANO');
   DMTE.cdsRegCxC.FieldByName('DEANO').AsString := DMTE.cdsqry.FieldByName('FecAno').AsString;
   DMTE.cdsRegCxC.FieldByName('DEMM').AsString := DMTE.cdsqry.FieldByName('FecMes').AsString;
   DMTE.cdsRegCxC.FieldByName('DEDD').AsString := DMTE.cdsqry.FieldByName('FecDia').AsString;
   DMTE.cdsRegCxC.FieldByName('DESS').AsString := DMTE.cdsqry.FieldByName('FecSS').AsString;
   DMTE.cdsRegCxC.FieldByName('DESEM').AsString := DMTE.cdsqry.FieldByName('FecSem').AsString;
   DMTE.cdsRegCxC.FieldByName('DETRI').AsString := DMTE.cdsqry.FieldByName('FecTrim').AsString;
   DMTE.cdsRegCxC.FieldByName('DEAASS').AsString := DMTE.cdsqry.FieldByName('FecAASS').AsString;
   DMTE.cdsRegCxC.FieldByName('DEAASem').AsString := DMTE.cdsqry.FieldByName('FecAASem').AsString;
   DMTE.cdsRegCxC.FieldByName('DEAATri').AsString := DMTE.cdsqry.FieldByName('FecAATri').AsString;

   dblcdCnp22.Enabled := True;
   dbeNoReg.Enabled := False;
   dblcClaseDet.Enabled := False;
   dblcdAuxDet.Enabled := False;
   dblcdCCosto.Enabled := False;

   pnlActualiza.SetFocus;
   perform(CM_DialogKey, VK_TAB, 0);
End;

Procedure TFIngresoCaja.EditaRegistro;
Var
   sTmp: String;
Begin
   BlanqueaEdits(pnlActualiza);
   dblcdCnp22.Enabled := False;
   dblcdCnp22.Text := DMTE.cdsRegCxC.FieldByName('CPTOID').AsString;
   dbeNoReg.Text := DMTE.cdsRegCxC.FieldByName('CPNOREG').AsString;

   xDescrip := 'CPTOID=' + quotedstr(dblcdCnp22.text);
   sTmp := DMTE.DisplayDEscrip('prvTGE', 'CAJA201', '*', xDescrip, 'CPTODES');

   seCantidad.Enabled := True;
   If DMTE.cdsQry.fieldbyName('CANFIJO').asString = 'S' Then
      seCantidad.Enabled := False;

   dbePreUni.Enabled := True;
   If DMTE.cdsQry.fieldbyName('IMPFIJO').asString = 'S' Then
      dbePreUni.Enabled := False;

   dbePreUni.Text := FloatToStr(DMTE.FRound(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat / DMTE.cdsRegCxC.FieldByName('CANTIDAD').AsFloat, 15, 2));

   DMTE.cdsRegCxC.Edit;
   If trim(dblcdCnp22.Text) <> '' Then
      edtCnp2.Text := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTOABR', 'CPTOID=''' + dblcdCnp22.Text + '''', 'CPTOABR');

   edtTMon2.Text := edtTMonCab.Text;
   If Not DMTE.cdsRegCxC.FieldByName('CCOSID').Isnull Then
   Begin
      If trim(DMTE.cdsRegCxC.FieldByName('CCOSID').AsString) <> '' Then
         dblcdCCosto.Enabled := True
      Else
         dblcdCCosto.Enabled := False;
   End
   Else
      dblcdCCosto.Enabled := False;

   If trim(dblcdAuxDet.Text) <> '' Then
   Begin
      dbeAuxDet.Text := DMTE.DisplayDescrip('prvTGE', 'CNT201', 'AUXABR',
         'CLAUXID = ''' + DMTE.cdsRegCxC.FieldByName('CLAUXID').AsString
         + ''' AND AUXID=''' + dblcdAuxDet.Text + '''', 'AUXABR');
      edtClaseDet.Text := DMTE.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXDES',
         'CLAUXID = ''' + DMTE.cdsRegCxC.FieldByName('CLAUXID').AsString + ''' ', 'CLAUXDES');
   End;

   If Not DMTE.cdsRegCxC.FieldByName('PROV').Isnull Then
   Begin
      If trim(DMTE.cdsRegCxC.FieldByName('PROV').AsString) <> '' Then
         dblcdAuxDet.Enabled := True
      Else
         dblcdAuxDet.Enabled := False;
   End
   Else
      dblcdAuxDet.Enabled := False;

   pnlActualiza.SetFocus;
   perform(CM_DialogKey, VK_TAB, 0);

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

Procedure TFIngresoCaja.dbgDetPagoDblClick(Sender: TObject);
Begin
   If dbgdetpago.DataSource.DataSet.RecordCount = 0 Then
   Begin
      MessageDlg('NO hay Registros por Editar', mtInformation,
         [mbOk], 0);
      exit;
   End;
   If DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'C' Then
   Begin
      ShowMessage('Este Documento Está Cancelado');
      exit;
   End;
   If DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Este Documento Está Anulado');
      exit;
   End;

   pnlDetPago.Enabled := False;
   pnlBotones.Enabled := False;
   pnlActualiza.BringToFront;
   pnlActualiza.Visible := True;
   IniciaPanel;
   dbeNoReg.enabled := False;
   EditaRegistro;
   pnlactualiza.SetFocus;
   Perform(CM_DialogKey, VK_TAB, 0);
End;

Procedure TFIngresoCaja.dbgDetPagoCalcTitleAttributes(Sender: TObject;
   AFieldName: String; AFont: TFont; ABrush: TBrush;
   Var ATitleAlignment: TAlignment);
Begin
   If (AFieldName = 'DEMTOLOC') Or (AFieldName = 'DEMTOEXT') Then
   Begin
      ABrush.Color := clWhite;
      AFont.Color := clBlack;
   End;
End;

Procedure TFIngresoCaja.Z2bbtnImprimeClick(Sender: TObject);
Var
   Comprobante: RCabComprobante;
Begin
   If DMTE.cdsIngDocs.FieldByName('ECCONTA').AsString <> 'S' Then
   Begin
      ShowMessage('Este Movimiento no Está Contabilizado');
      exit;
   End;

   With Comprobante Do
   Begin
      CIAID := dblcCia.Text;
      CiaDes := edtCia.Text;
      Proveedor := '';
      Glosa := dbeGlosa.Text;
      TipoDoc := edtTDoc.Text;
      TipoCamb := dbeTCambio.Text;
      NoDoc := dbeNoDoc.Text;
      Cuenta := '';
      Banco := edtBanco.text;
      NumChq := '';
      Importe := DMTE.cdsIngDocs.Fieldbyname('NCOMTOLOC').AsString;
   End;

   FVoucherImp := TFVoucherImp.Create(Self);
   FVoucherImp.wComprobanteI := Comprobante;
   With FVoucherImp Do
   Try
      ShowModal;
   Finally
      Free;
   End;
End;

Procedure TFIngresoCaja.Z2bbtnContClick(Sender: TObject);
Begin
   If MessageDlg('¿Contabilizar y Generar Asientos Automaticos?', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes Then
   Begin
      screen.Cursor := crHourGlass;
      DMTE.cdsRegCxC.DisableControls;
      DMTE.cdsRegCxC.Filtered := False;

      Contabiliza; // Realiza la generacion del Asiento

      DMTE.cdsRegCxC.Filtered := True;
      DMTE.cdsRegCxC.EnableControls;

      DMTE.cdsIngDocs.Edit;
      DMTE.cdsIngDocs.fieldBYName('ECConta').AsString := 'S'; //Establece como Contabilizado el flag
      DMTE.cdsIngDocs.FieldByName('NCOUSER').AsString := DMTE.wUsuario;
      DMTE.cdsIngDocs.FieldByName('NCOFREG').AsDateTime := DateS;
      If (DMTE.SRV_D = 'ORACLE') Then
         DMTE.cdsIngDocs.FieldByName('NCOHREG').AsDateTime := DateS + Time
      Else
         DMTE.cdsIngDocs.FieldByName('NCOHREG').AsDateTime := Time;

      If DMTE.cdsIngDocs.ApplyUpdates(0) <> 0 Then
         Showmessage('Error en la Grabación');
      DMTE.cdsIngDocs.refresh;
      Z2bbtnCont.Enabled := False;
      screen.Cursor := crDefault;
   End;
End;

Procedure TFIngresoCaja.Contabiliza;
Var
   xRegAct: TBookMark;
   xSQL: String;
Begin
// GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera

   xSQL := 'Select * '
      + '  from CAJA304 '
      + ' Where CIAID='''' and ECANOMM='''' and TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsCNTCaja.Close;
   DMTE.cdsCNTCaja.DataRequest(xSQL);
   DMTE.cdsCNTCaja.Open;

   DMTE.cdsCntCaja.Insert;
   xReg := xReg + 1;
   Contab_IngCaja;

   DMTE.cdsRegCxC.DisableControls;
   xRegAct := DMTE.cdsRegCxC.GetBookmark;
   DMTE.cdsRegCxC.First;

// GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde el Detalle
   While Not DMTE.cdsRegCxC.Eof Do
   Begin
      DMTE.cdsCntCaja.Insert;
      xReg := xReg + 1;
      Contab_RegCxP;
      DMTE.cdsRegCxC.Next;
   End;
   DMTE.cdsRegCxC.GotoBookmark(xRegAct);
   DMTE.cdsRegCxC.FreeBookmark(xRegAct);
   DMTE.cdsRegCxC.EnableControls;

    //Actualizamos en la tabla de Contabilidad
   DMTE.cdsCntCaja.ApplyUpdates(0);
End;

Procedure TFIngresoCaja.Contab_IngCaja;
Var
   ssql: String;
   xdatos: Array[1..30] Of String;
Begin
   xdatos[1] := DMTE.cdsIngDocs.fieldbyName('CIAID').AsString;
   xdatos[2] := DMTE.cdsIngDocs.fieldbyName('TDIARID').AsString;
   xdatos[3] := DMTE.cdsIngDocs.fieldbyName('ECANOMM').AsString;
   xdatos[4] := DMTE.cdsIngDocs.fieldbyName('ECNOCOMP').AsString;
   xdatos[5] := DMTE.cdsIngDocs.FieldByName('CCLOTE').AsString;
   xdatos[6] := DMTE.cdsIngDocs.fieldbyName('CCNODOC').AsString;
   xdatos[7] := formatdatetime(DMTE.wFormatFecha, StrToDate(DMTE.cdsIngDocs.fieldbyName('CCFEMIS').AsString));
   xdatos[8] := DMTE.cdsIngDocs.FieldByName('CPTOID').AsString;
   xdatos[9] := edtCuenta.Text;
   xdatos[10] := 'D';
   xdatos[11] := DMTE.cdsIngDocs.fieldbyName('TMONID').AsString;
   xdatos[12] := DMTE.cdsIngDocs.fieldbyName('NCOMTOORI').AsString;
   xdatos[13] := DMTE.cdsIngDocs.fieldbyName('NCOMTOLOC').AsString;
   xdatos[14] := DMTE.cdsIngDocs.FieldByName('NCOMTOEXT').AsString;
   xdatos[15] := 'S'; //Registro ya cuadrado
   xdatos[16] := DMTE.cdsIngDocs.fieldbyName('NCOANO').AsString;
   xdatos[17] := DMTE.cdsIngDocs.fieldbyName('NCOMM').AsString;
   xdatos[18] := DMTE.cdsIngDocs.fieldbyName('NCODD').AsString;
   xdatos[19] := DMTE.cdsIngDocs.fieldbyName('NCOSS').AsString;
   xdatos[20] := DMTE.cdsIngDocs.fieldbyName('NCOSEM').AsString;
   xdatos[21] := DMTE.cdsIngDocs.fieldbyName('NCOTRI').AsString;
   xdatos[22] := DMTE.cdsIngDocs.fieldbyName('NCOAASS').AsString;
   xdatos[23] := DMTE.cdsIngDocs.fieldbyName('NCOAASEM').AsString;
   xdatos[24] := DMTE.cdsIngDocs.FieldByName('NCOAATRI').AsString;
   xdatos[25] := DMTE.cdsIngDocs.fieldBYName('CCGLOSA').AsString;
   xdatos[26] := dbeTCambio.Text;
   xdatos[27] := '1';
   xdatos[28] := DMTE.wUsuario;
   xdatos[29] := FORMATDATETIME(DMTE.wFormatFecha, Date);
   xdatos[30] := IntToStr(xReg); // para aca es uno el numero de registro
   ssql := '';
   ssql := 'INSERT INTO CAJA304(CIAID, TDIARID, ECANOMM, ECNOCOMP, DCLOTE,dCNODOC,ECFCOMP,CPTOID, '
      + '                    CUENTAID, DCDH, TMONID, DCMTOORI, DCMTOLO,DCMTOEXT,DCFLACDR,DCANO,'
      + '                    DCMM, DCDD, DCSS, DCSEM, DCTRI, DCAASS, DCAASEM, DCAATRI, DCGLOSA, '
      + '                    DCTCAMPA, FCAB, DCUSER, DCFREG, DCHREG, CAJAREG) '
      + 'VALUES (' + quotedstr(xdatos[1]) + ','
      + quotedstr(xdatos[2]) + ','
      + quotedstr(xdatos[3]) + ','
      + quotedstr(xdatos[4]) + ','
      + quotedstr(xdatos[5]) + ','
      + quotedstr(xdatos[6]) + ','
      + quotedstr(xdatos[7]) + ','
      + quotedstr(xdatos[8]) + ','
      + quotedstr(xdatos[9]) + ','
      + quotedstr(xdatos[10]) + ','
      + quotedstr(xdatos[11]) + ','
      + xdatos[12] + ','
      + xdatos[13] + ','
      + xdatos[14] + ','
      + quotedstr(xdatos[15]) + ','
      + quotedstr(xdatos[16]) + ','
      + quotedstr(xdatos[17]) + ','
      + quotedstr(xdatos[18]) + ','
      + quotedstr(xdatos[19]) + ','
      + quotedstr(xdatos[20]) + ','
      + quotedstr(xdatos[21]) + ','
      + quotedstr(xdatos[22]) + ','
      + quotedstr(xdatos[23]) + ','
      + quotedstr(xdatos[24]) + ','
      + quotedstr(xdatos[25]) + ','
      + xdatos[26] + ','
      + quotedstr(xdatos[27]) + ','
      + quotedstr(xdatos[28]) + ','
      + quotedstr(xdatos[29]) + ', '
      + DMTE.wRepHorServi + ','
      + quotedstr(xdatos[30]) + ' )';
   Try
      DMTE.DCOM1.AppServer.EjecutaSql(ssql);
   Except
   End;
End;

Procedure TFIngresoCaja.Contab_RegCxP;
Var
   ssql: String;
   xdatos: Array[1..36] Of String;
Begin
   xdatos[1] := DMTE.cdsRegCxC.FieldByName('CIAID').AsString;
   xdatos[2] := DMTE.cdsRegCxC.FieldByName('TDIARID').AsString;
   xdatos[3] := DMTE.cdsIngDocs.fieldbyName('ECANOMM').AsString;
   xdatos[4] := DMTE.cdsRegCxC.FieldByName('ECNOCOMP').AsString;
   xdatos[5] := DMTE.cdsIngDocs.FieldByName('CCLOTE').AsString;
   xdatos[6] := DMTE.cdsRegCxC.FieldByName('DOCID2').AsString;
   xdatos[7] := DMTE.cdsRegCxC.FieldByName('CPSERIE').AsString;
   xdatos[8] := DMTE.cdsRegCxC.FieldByName('CPNODOC').AsString;
   xdatos[9] := formatdatetime(DMTE.wFormatFecha, DMTE.cdsRegCxC.FieldByName('DEFCOMP').AsDateTime);
   xdatos[10] := formatdatetime(DMTE.wFormatFecha, DMTE.cdsRegCxC.FieldByName('CPFEMIS').AsDateTime);
   xdatos[11] := formatdatetime(DMTE.wFormatFecha, DMTE.cdsRegCxC.FieldByName('CPFVCMTO').AsDateTime);
   xdatos[12] := DMTE.cdsRegCxC.FieldByName('CPTOID').AsString;
   xdatos[13] := DMTE.cdsRegCxC.FieldByName('CUENTAID').AsString;
   xdatos[14] := DMTE.cdsIngDocs.fieldbyName('CLAUXID').AsString;
   xdatos[15] := DMTE.cdsIngDocs.fieldbyName('CLIEID').AsString;
   xdatos[16] := DMTE.cdsRegCxC.FieldByName('CCOSID').AsString;
   xdatos[17] := DMTE.cdsRegCxC.FieldByName('DEDH').AsString;
   xdatos[18] := DMTE.cdsRegCxC.FieldByName('DETCPAG').AsString;
   xdatos[19] := DMTE.cdsRegCxC.FieldByName('DETCDOC').AsString;
   xdatos[20] := DMTE.cdsRegCxC.FieldByName('TMONID').AsString;
   xdatos[21] := DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsString;
   If DMTE.cdsRegCxC.FieldByName('TMONID').AsString = DMTE.wtMonLoc Then
   Begin
      xdatos[22] := DMTE.cdsRegCxC.FieldByName('DEMTOLOC').AsString;
      xdatos[23] := FloatToStr(DMTE.cdsRegCxC.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsRegCxC.FieldByName('DETCDOC').AsFloat);
   End
   Else
   Begin
      xdatos[23] := DMTE.cdsRegCxC.FieldByName('DEMTOEXT').AsString;
      xdatos[22] := FloatToStr(DMTE.cdsRegCxC.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsRegCxC.FieldByName('DETCDOC').AsFloat);
   End;
   xdatos[24] := 'S'; //Registro ya cuadrado
   xdatos[25] := DMTE.cdsIngDocs.fieldbyName('ECANO').AsString;
   xdatos[26] := DMTE.cdsIngDocs.fieldbyName('ECMM').AsString;
   xdatos[27] := DMTE.cdsIngDocs.fieldbyName('ECDD').AsString;
   xdatos[28] := DMTE.cdsIngDocs.fieldbyName('ECSS').AsString;
   xdatos[29] := DMTE.cdsIngDocs.fieldbyName('ECSEM').AsString;
   xdatos[30] := DMTE.cdsIngDocs.fieldbyName('ECTRI').AsString;
   xdatos[31] := DMTE.cdsIngDocs.fieldbyName('ECAASS').AsString;
   xdatos[32] := DMTE.cdsIngDocs.fieldbyName('ECAASEM').AsString;
   xdatos[33] := DMTE.cdsIngDocs.FieldByName('ECAATRI').AsString;
   xdatos[34] := DMTE.wUsuario;
   xdatos[35] := FORMATDATETIME(DMTE.wFormatFecha, Date);
   xdatos[36] := IntToStr(xReg);
   ssql := '';
   ssql := 'INSERT INTO CAJA304(CIAID, TDIARID, ECANOMM, ECNOCOMP, DCLOTE, DOCID, DCSERIE, DCNODOC, '
      + '                    ECFCOMP, DCFEMIS, DCFVCMTO, CPTOID, CUENTAID, CLAUXID, DCAUXID, CCOSID, '
      + '                    DCDH, DCTCAMPA, DCTCAMPR, TMONID, DCMTOORI, DCMTOLO, DCMTOEXT, DCFLACDR, '
      + '                    DCANO, DCMM, DCDD, DCSS, DCSEM, DCTRI, DCAASS, DCAASEM, DCAATRI, DCUSER, '
      + '                    DCFREG, DCHREG) '
      + 'VALUES(' + quotedstr(xdatos[1]) + ','
      + quotedstr(xdatos[2]) + ','
      + quotedstr(xdatos[3]) + ','
      + quotedstr(xdatos[4]) + ','
      + quotedstr(xdatos[5]) + ','
      + quotedstr(xdatos[6]) + ','
      + quotedstr(xdatos[7]) + ','
      + quotedstr(xdatos[8]) + ','
      + quotedstr(xdatos[9]) + ','
      + quotedstr(xdatos[10]) + ','
      + quotedstr(xdatos[11]) + ','
      + quotedstr(xdatos[12]) + ','
      + quotedstr(xdatos[13]) + ','
      + quotedstr(xdatos[14]) + ','
      + quotedstr(xdatos[15]) + ','
      + quotedstr(xdatos[16]) + ','
      + quotedstr(xdatos[17]) + ','
      + xdatos[18] + ','
      + xdatos[19] + ','
      + quotedstr(xdatos[20]) + ','
      + xdatos[21];
   If DMTE.cdsRegCxC.FieldByName('TMONID').AsString = DMTE.wtMonLoc Then
      ssql := ssql + ',' + xdatos[22] + ',' + xdatos[23]
   Else
      ssql := ssql + ',' + xdatos[23] + ',' + xdatos[22];
   ssql := ssql + ',' + quotedstr(xdatos[24]) + ','
      + quotedstr(xdatos[25]) + ','
      + quotedstr(xdatos[26]) + ','
      + quotedstr(xdatos[27]) + ','
      + quotedstr(xdatos[28]) + ','
      + quotedstr(xdatos[29]) + ','
      + quotedstr(xdatos[30]) + ','
      + quotedstr(xdatos[31]) + ','
      + quotedstr(xdatos[32]) + ','
      + quotedstr(xdatos[33]) + ','
      + quotedstr(xdatos[34]) + ','
      + quotedstr(xdatos[35]) + ', '
      + DMTE.wRepHorServi + ','
      + quotedstr(xdatos[36]) + ')';
   Try
      DMTE.DCOM1.AppServer.EjecutaSql(ssql);
   Except
   End;
End;

Procedure TFIngresoCaja.Adiciona;
Var
   xSQL: String;
Begin
   IniciaDatos;
   xGraboNuevo := False;
  //
   If dblcCia.LookupTable.RecordCount > 1 Then
      dblcCia.Enabled := True;

   dblcTDoc.Enabled := True;
   dbeSerie.Enabled := True;
   dbeNoDoc.Enabled := False;
   dblcBanco.enabled := True;

   dbdtpFEmision.Enabled := False;
   edNumReg.Enabled := True;
  //
   pnlCabecera1.Enabled := True;
   pnlDetPago.Enabled := False;
   pnlBotones.Enabled := False;

   Z2dbgDetPagoIButton.Enabled := True;
   Z2bbtnAdicFPago.Enabled := True;
   ActivaBotones(pnlCabecera1, True);
   ActivaBotones(pnlBotones, False);
   HabilitaControles;
   z2bbtnNuevo.Visible := True;

   DMTE.cdsIngDocs.Insert;

   xSQL := 'Select * from CAJA301 '
      + ' Where CIAID='''' and CCTREC='''' and DOCID2='''' and CPSERIE='''' and CPNODOC='''' ';
   DMTE.cdsRegCxC.Close;
   DMTE.cdsRegCxC.DataRequest(xSQL);
   DMTE.cdsRegCxC.Open;

   xSQL := 'Select * from CAJA314 '
      + 'Where CIAID='''' and CCTREC='''' and DOCID='''' and CCSERIE='''' and CCNODOC='''' ';
   DMTE.cdsDetFPago.Close;
   DMTE.cdsDetFPago.DataRequest(xSQL);
   DMTE.cdsDetFPago.Open;

   lblEstadoMov.Caption := 'Nuevo';

   xDescrip := 'FECHA=' + DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha, dbdtpFEmision.date) + ''') '
      + ' AND TMONID=''' + DMTE.wTMonExt + '''';
   If DMTE.RecuperarDatos('TGE107', DMTE.wTipoCambioUsar, xDescrip) Then
      dbeTCambio.Text := DMTE.cdsRec.FieldByName(DMTE.wTipoCambioUsar).AsString;

   If DMTE.cdsTDoc.recordcount = 1 Then
   Begin
      dblcTDoc.Text := DMTE.cdsTDoc.FieldByName('DOCID').AsString;
      edtTDoc.Text := DMTE.cdsTDoc.FieldByName('DOCDES').AsString;
      dblcTDoc.Enabled := False;
   End;

   If DMTE.cdsBanco.RecordCount = 1 Then
   Begin
      dblcBanco.enabled := False;
      dblcBanco.text := DMTE.cdsBanco.FieldByName('BANCOID').AsString;
      edtBanco.text := DMTE.cdsBanco.FieldByName('BANCONOM').AsString;
      xDescrip := 'CIAID=''' + dblcCia.Text + ''' AND BANCOID=' + quotedstr(dblcBanco.text);
      dblcTMonCab.text := DMTE.DisplayDescrip('prvTGE', 'TGE106', 'TMONID', xDescrip, 'TMONID');
      xDescrip := 'TMONID=' + quotedstr(dblcTMonCab.text);
      edtTMonCab.text := DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMONABR', xDescrip, 'TMONABR');
   End;

   wModifica := False;
End;

Procedure TFIngresoCaja.Edita(Doc: structDocIng; cds: Twwclientdataset);
Var
   xSQL: String;
Begin
   IniciaDatos;
   cdsfiltro := cds;
   Z2bbtnNuevo.Visible := False;

   DMTE.cdsIngDocs.Edit;

   xSQL := 'Select * from CAJA301 '
      + ' Where CIAID=''' + DMTE.cdsIngDocs.FieldbyName('CIAID').AsString + ''' and '
      + 'CCTREC=''' + DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString + ''' and '
      + 'DOCID2=''' + DMTE.cdsIngDocs.FieldbyName('DOCID').AsString + ''' and '
      + 'CPSERIE=''' + DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString + ''' and '
      + 'CPNODOC=''' + DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString + ''' ';
   DMTE.cdsRegCxC.Close;
   DMTE.cdsRegCxC.DataRequest(xSQL);
   DMTE.cdsRegCxC.Open;

   xSQL := 'Select * from CAJA314 '
      + 'Where CIAID=''' + DMTE.cdsIngDocs.FieldbyName('CIAID').AsString + ''' and '
      + 'CCTREC=''' + DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString + ''' and '
      + 'DOCID=''' + DMTE.cdsIngDocs.FieldbyName('DOCID').AsString + ''' and '
      + 'CCSERIE=''' + DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString + ''' and '
      + 'CCNODOC=''' + DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString + ''' ';
   DMTE.cdsDetFPago.Close;
   DMTE.cdsDetFPago.DataRequest(xSQL);
   DMTE.cdsDetFPago.Open;

   dblcCia.Text := DMTE.cdsIngDocs.FieldbyName('CIAID').AsString;
   dblcTDoc.Text := DMTE.cdsIngDocs.FieldbyName('DOCID').AsString;
   dbeSerie.Text := DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString;
   dbeNoDoc.Text := DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString;
   dbdtpFEmision.Date := DMTE.cdsIngDocs.FieldbyName('CCFEMIS').AsDateTime;
   dblcBanco.Text := DMTE.cdsIngDocs.FieldbyName('BANCOID').AsString;
   edtCuenta.Text := DMTE.cdsIngDocs.FieldbyName('CUENTAID').AsString;
   dblcTMonCab.Text := DMTE.cdsIngDocs.FieldbyName('TMONID').AsString;
   dbeTCambio.Text := Cajadec(DMTE.cdsIngDocs.FieldbyName('NCOTCAMB').AsString);
   dblcClase.Text := DMTE.cdsIngDocs.FieldbyName('CLAUXID').AsString;

   If dblcClase.Text = 'AS' Then
   Begin
      dblcdAso.Text := DMTE.cdsIngDocs.FieldbyName('CLIEID').AsString;
      dblcdAux.Visible := False;
      pnlAux.Visible := False;
      dblcdAso.Visible := True;
      btnExec.Visible := True;
   End
   Else
   Begin
      If dblcClase.Text = 'C' Then
      Begin
         dblcdAux.Visible := False;
         pnlAux.Visible := True;
         dblcdAso.Visible := False;
         btnExec.Visible := False;
      End
      Else
      Begin
         dblcdAux.Text := DMTE.cdsIngDocs.FieldbyName('CLIEID').AsString;
         dblcdAux.Visible := True;
         pnlAux.Visible := False;
         dblcdAso.Visible := False;
         btnExec.Visible := False;
      End;
   End;

   edtAuxRUC.Text := DMTE.cdsIngDocs.FieldbyName('CLIERUC').AsString;
   dbeGiradoA.Text := DMTE.cdsIngDocs.FieldbyName('CCNOMB').AsString;
   dblcdCnp.Text := DMTE.cdsIngDocs.FieldbyName('CPTOID').AsString;
   dbeGlosa.Text := DMTE.cdsIngDocs.FieldbyName('CCGLOSA').AsString;
   dblcdFEfec.Text := DMTE.cdsIngDocs.FieldByName('FLUEID').AsString;

   dbgDetPago.ColumnByName('DEMTOLOC').FooterValue := DMTE.cdsIngDocs.FieldbyName('NCOMTOLOC').AsString;
   dbgDetPago.ColumnByName('DEMTOEXT').FooterValue := DMTE.cdsIngDocs.FieldbyName('NCOMTOEXT').AsString;
   RecuperaDescrip;

   If (DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'I') Or
      (DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString = '') Then
   Begin
      pnlCabecera1.Enabled := True;
      pnlDetPago.Enabled := False;
      pnlBotones.Enabled := False;
      Z2dbgDetPagoIButton.Enabled := True;
      Z2bbtnAdicFPago.Enabled := True;
      ActivaBotones(pnlBotones, False);
      ActivaBotones(pnlCabecera1, True);
      lblEstadoMov.Caption := 'Activo';
   End;

   If (DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'A') Or
      (DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'C') Then
   Begin
      pnlCabecera1.Enabled := False;
      pnlDetPago.Enabled := True;
      pnlBotones.Enabled := True;
      ActivaBotones(pnlCabecera1, False);
      ActivaBotones(pnlBotones, False);
      Z2dbgDetPagoIButton.Enabled := False;
      Z2bbtnAdicFPago.Enabled := False;
      If DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'C' Then
      Begin
         lblEstadoMov.Caption := 'Cancelado';
         Z2bbtnCont.Enabled := True;
         Z2bbtnEmite.Enabled := True;
         Z2bbtnImprime.Enabled := True;
         Z2bbtnCancel2.Enabled := True;
         Z2bbtnAnula.Enabled := True;
         bbtnActivaR.Enabled := True;
      End
      Else
      Begin
         Z2bbtnEmite.Enabled := True;
         bbtnActivaR.Enabled := True;
         Z2bbtnAnula.Enabled := False;
         lblEstadoMov.Caption := 'Anulado';
         mAnula.Visible := True;
         mAnula.Text := DMTE.cdsIngDocs.FieldByName('OBSANU').AsString;
      End;
   End;

   xDescrip := 'CIAID=' + quotedstr(dblcCia.Text);
   edtCia.text := DMTE.DisplayDescrip('prvTGE', 'TGE101', 'CIAABR', xDescrip, 'CIAABR');

   edNumReg.text := DMTE.cdsRegCxC.FieldByName('DENUMREG').AsString;
End;

Procedure TFIngresoCaja.FormCreate(Sender: TObject);
Begin

   CargaDataSource;

   RecuperarCiaUnica(dblcCia, edtCia);
   SetLength(A4digitos, 1);
   A4digitos[0] := dbeTCambio;
   DMTE.cdsRegCxC.BeforePost := cdsRegCxCBeforePost;
   DMTE.cdsDetFPago.BeforePost := cdsRegCxCBeforePost;

   cf1 := TControlFoco.Create;
   DMTE.cdsFEfec.Filter := 'FLUEFE_IS = ''I'' ';
   DMTE.cdsFEfec.Filtered := True;
   cdsTarjeta := TwwClientDataset.Create(Application);
   cdsTarjeta.Name := 'cdsTarjeta';
   cdsTarjeta.RemoteServer := DMTE.DCOM1;
   cdsTarjeta.providerName := DMTE.cdsQry2.ProviderName;
   cdsTarjeta.DataRequest('SELECT * FROM TGE167 ORDER BY TJAID');
   cdsTarjeta.Active := True;
   dblcTarjeta.LookupTable := cdsTarjeta;

   cdsBanco := TwwClientDataset.Create(Application);
   cdsBanco.Name := 'cdsBanco';
   cdsBanco.RemoteServer := DMTE.DCOM1;
   cdsBanco.providerName := DMTE.cdsQry2.ProviderName;
   cdsBanco.DataRequest('SELECT * FROM TGE105 WHERE BCOTIPCTA<>''C'' ORDER BY BANCOID ');
   cdsBanco.Active := True;

   dblcBancoFPago.LookupTable := cdsBanco;

   mAnula.Visible := False;

   If DMTE.wAdmin = 'U' Then
   Begin
      Z2bbtnAnula.Visible := False;
      bbtnActivaR.Visible := False;
   End
   Else
   Begin
      Z2bbtnAnula.Visible := True;
      bbtnActivaR.Visible := True;
   End;
   bbtnActivaR.Visible := True;

   If DMTE.wModo = 'A' Then
   Begin
   End
   Else
   Begin
      Edita(TransDoc, FRegistro.xFiltroIng.FMant.cds2);
   End;
End;

Procedure TFIngresoCaja.CargaDataSource;
Begin
   dblcCia.LookupTable := DMTE.cdsCia;
   dblcbanco.LookupTable := DMTE.cdsBanco;
   dblcTDoc.LookupTable := DMTE.cdsTDoc;
   dblcTMonCab.LookupTable := DMTE.cdsTMon;
   dblcClase.LookupTable := DMTE.cdsClaseAux;
   dblcdAux.LookupTable := DMTE.cdsAux;
   dblcdCnp.LookupTable := DMTE.cdsCnpEgr;
   dblcdFEfec.LookupTable := DMTE.cdsFEfec;

   dblcFormPago.LookupTable := DMTE.cdsFormPago;
   dblcBancoFPago.LookupTable := DMTE.cdsBancoEgr;
   dblcTarjeta.LookupTable := DMTE.cdsTarjeta;
   dblcTMonC.LookupTable := DMTE.cdsTMon;

   dbeNoreg.DataSource := DMTE.dsRegCxC;
   dblcdCnp22.DataSource := DMTE.dsRegCxC;
   dblcdCnp22.LookupTable := DMTE.cdsCnpEgr;
   edtCuenta2.DataSource := DMTE.dsRegCxC;
   dblcClaseDet.DataSource := DMTE.dsRegCxC;
   dblcClaseDet.LookupTable := DMTE.cdsClaseAux;
   dbeDH.DataSource := DMTE.dsRegCxC;
   dblcdAuxDet.DataSource := DMTE.dsRegCxC;
   dblcdAuxDet.LookupTable := DMTE.cdsAux;
   dbeImporte2.DataSource := DMTE.dsRegCxC;
   seCantidad.DataSource := DMTE.dsRegCxC;
   dblcdCCosto.DataSource := DMTE.dsRegCxC;
   dblcdCCosto.LookupTable := DMTE.cdsCCosto;
   edtMtoLoc.DataSource := DMTE.dsRegCxC;
   edtMtoExt.DataSource := DMTE.dsRegCxC;
   dblcTMon2.DataSource := DMTE.dsRegCxC;
   dblcTMon2.LookupTable := DMTE.cdsTMon;
   dbeTCamPr.DataSource := DMTE.dsRegCxC;

   dbgdetPago.DataSource := DMTE.dsRegCxC;
   dbgDetFPago.DataSource := DMTE.dsDetFPago;
End;

Procedure TFIngresoCaja.ActivaBotones(pnl: TPanel; xFlag: Boolean);
Var
   i: Integer;
Begin
   For i := 0 To pnl.ControlCount - 1 Do
   Begin
      If pnl.controls[i] Is tbitbtn Then
         TBitBtn(pnl.controls[i]).enabled := xFlag;
   End;
End;

Procedure TFIngresoCaja.FocoInicial;
Begin
   If pnlCabecera1.Enabled Then
      pnlCabecera1.SetFocus
   Else
      If pnlDetPago.Enabled Then
         pnlDeTpago.setfocus
      Else
         If pnlBotones.enabled Then
            pnlBotones.SetFocus
         Else
            self.SetFocus;
   perform(CM_DialogKey, VK_TAB, 0);

End;

Procedure TFIngresoCaja.GrabaMontoTotal;
Begin
   DMTE.cdsIngDocs.Edit;
   DMTE.cdsIngDocs.fieldbyName('NCOMTOLOC').AsFloat := OperClientDataSet(DMTE.cdsRegCxC, 'SUM(DEMTOLOC)', '');
   DMTE.cdsIngDocs.fieldbyName('NCOMTOEXT').AsFloat := OperClientDataSet(DMTE.cdsRegCxC, 'SUM(DEMTOEXT)', '');
   If dblcTMonCab.Text = DMTE.wTMonLoc Then
      DMTE.cdsIngDocs.fieldbyName('NCOMTOORI').AsFloat := DMTE.cdsIngDocs.fieldbyName('NCOMTOLOC').AsFloat
   Else
      DMTE.cdsIngDocs.fieldbyName('NCOMTOORI').AsFloat := DMTE.cdsIngDocs.fieldbyName('NCOMTOEXT').AsFloat;
End;

Procedure TFIngresoCaja.dbeTCambioChange2(Sender: TObject);
Begin
   If Not TCustomEdit(Sender).Focused Then
      Exit;
   wModifica := True;
End;

Procedure TFIngresoCaja.dbeTCambioEnter2(Sender: TObject);
Begin
   strTmp := TCustomEdit(Sender).Text;
End;

Procedure TFIngresoCaja.dbeTCambioExit2(Sender: TObject);

Procedure Mensaje;
   Var
      Tmp: String;
   Begin
      TCustomEdit(Sender).SetFocus;
      Tmp := Strtmp;
      ShowMessage('Ingrese Tipo de Cambio');
      strTmp := Tmp;
      Exit;
   End;
Begin
   If Z2bbtnCancelCab.Focused Then exit;
   If dblcCia.Focused Then exit;
   If dblcBanco.Focused Then exit;

   If trim(dbeTCambio.Text) = '' Then
      Mensaje
   Else
      If strtocurr(dbeTCambio.Text) = 0 Then
         Mensaje
      Else
         If strTmp <> dbetcambio.Text Then
         Begin
            dbeTCambio.Text := CajaDec(dbeTCambio.Text, 4);
         End;
End;

Procedure TFIngresoCaja.dblcBancoExit22(Sender: TObject);
Var
   xSQL: String;
Begin
   If dblcCia.Focused Then Exit;
   If Z2bbtnCancelCab.Focused Then Exit;
   wModifica := True;
   xDescrip := 'BANCOID=' + quotedstr(dblcBanco.text);
   edtBanco.text := DMTE.DisplayDescrip('prvTGE', 'TGE105', 'BANCONOM,CUENTAID,CPTOID', xDescrip, 'BANCONOM');
   If edtBanco.text = '' Then
   Begin
      Showmessage('Falta registrar la Caja');
      dblcBanco.SetFocus;
      exit;
   End;

   xDescrip := 'CIAID=''' + dblcCia.Text + ''' AND BANCOID=' + quotedstr(dblcBanco.text);
   dblcTMonCab.text := DMTE.DisplayDescrip('prvTGE', 'TGE106', 'TMONID', xDescrip, 'TMONID');
   dblcTMonCabExit2(SeLF);

  // PARA INGRESAR CON OTRA FECHA
   dbdtpFEmision.Date := DateS;

   xSQL := 'select * '
      + '  from CAJ_CON_APE_CIE '
      + ' where usuario=''' + DMTE.wUsuario + ''' and fectrans=''' + DateToStr(dbdtpFEmision.Date) + '''';
   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.RecordCount = 0 Then
   Begin
      ShowMessage('Cajero(a) NO Aperturo el día en Caja Front ( Para que al finalizar el día genere el Balancin ) ');
      If dblcBanco.Enabled Then
         dblcBanco.SetFocus
      Else
         Close;
      Exit;
   End;

   If DMTE.cdsReporte.FieldByName('FCIERRE').AsDateTime <> 0 Then
   Begin
      ShowMessage('Usuario ya genero el Balancin, No puede ingresar nuevas transacciones');
      If dblcBanco.Enabled Then
         dblcBanco.SetFocus
      Else
         Close;
      Exit;
   End;

   xSQL := 'Select * from CAJ_LOG_ING '
      + ' Where CIAID=''' + dblcCia.Text + ''' '
      + '   and FECOPE=''' + DateToStr(dbdtpFEmision.Date) + ''' '
      + '   and USUCAJ=''' + DMTE.wUsuario + '''';
   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.RecordCount = 0 Then
   Begin
      ShowMessage('Cajero(a) NO Aperturo el día');
      dbdtpFEmision.Date := 0;
      If dblcBanco.Enabled Then
         dblcBanco.SetFocus
      Else
         Close;

      Exit;
   End;

   If DMTE.cdsReporte.FieldByName('ESTADO').AsString = 'C' Then
   Begin
      ShowMessage('Cajero(a) ya Cerrado el Día. No puede realizar mas Transacciones');
      dbdtpFEmision.Date := 0;
      If dblcBanco.Enabled Then
         dblcBanco.SetFocus
      Else
         Close;
      Exit;
   End;

   DMTE.cdsCnpEgr.Filtered := False;
// Inicio HPC_201603_CAJA
// 21/03/2016  Se modifica Filtro para que incluya sólo Conceptos de Ingresos Activos
//   DMTE.cdsCnpEgr.Filter := '';
   DMTE.cdsCnpEgr.Filter := 'CPTOIS=''I'' and ACTIVO=''S'' and TMONID='+quotedstr(dblcTMonCab.text);
   DMTE.cdsCnpEgr.Filtered := True;
// Fin HPC_201603_CAJA

   dbdtpFEmisionExit(Self);
End;

Procedure TFIngresoCaja.dblcClaseExit22(Sender: TObject);
Var
   xSQLx: String;
Begin
   If Z2bbtnCancelCab.Focused Then exit;

   xDescrip := 'CLAUXID=' + quotedstr(dblcClase.text);
   edtClase.text := DMTE.DisplayDescrip('prvTGE', 'TGE102', 'CLAUXDES,TAUXID', xDescrip, 'CLAUXDES');

   wModifica := TRUE;
   DMTE.xxExit(dblcClase, edtClase, [], 'Clase del Auxiliar', 'A');
   If trim(edtclase.Text) = '' Then
      Exit;

   If (dblcClase.Text <> strTmp) Then
   Begin
      dblcdAux.Text := '';
      edtAux.Text := '';
      edtAuxRUC.Text := '';
      dbeGiradoA.Text := '';
   End;

// Inicio HPC_201801_CAJA
// deshabilita Tipo de Cliente ASociado para que todo vaya por Cliente
   If dblcClase.Text = 'ASxxx' Then
   Begin
      dblcdAux.Visible := False;
      pnlAux.Visible := False;
      dblcdAso.Visible := True;
      btnExec.Visible := True;
   End
   Else
   Begin
      If (dblcClase.Text = 'C') or (dblcClase.Text = 'AS') Then
// Fin HPC_201801_CAJA
      Begin
         pnlAux.Visible := True;
         dblcdAux.Visible := False;
         dblcdAso.Visible := False;
         btnExec.Visible := False;
         btnbusAuxClick(Self);
         pnlAux.SetFocus;

   // Inicio HPC_201308_CAJA
   // se apertura este ccds para cuando el Concepto de Detalle requiera AUXILIAR
         xSQLx := 'Select * '
            + '  from CNT201 '
            + ' Where CLAUXID=' + quotedstr(dblcClase.Text)
            + '   and ACTIVO=''S'' ';
         DMTE.cdsAux.Close;
         DMTE.cdsAux.DataRequest(xSQLx);
         DMTE.cdsAux.Open;
         DMTE.cdsAux.IndexFieldNames := 'AUXID';
         DMTE.cdsAux.SetKey;
         DMTE.cdsAux.FieldByName('AUXID').AsString := edtAux.text;
         DMTE.cdsAux.Gotokey;
   // Fin HPC_201308_CAJA
      End
      Else
      Begin
         dblcdAux.Visible := True;
         dblcdAso.Visible := False;
         pnlAux.Visible := False;
         btnExec.Visible := False;
         xSQLx := 'Select * '
            + '  from CNT201 '
            + ' Where CLAUXID=' + quotedstr(dblcClase.Text)
            + '   and ACTIVO=''S'' ';
         DMTE.cdsAux.Close;
         DMTE.cdsAux.DataRequest(xSQLx);
         DMTE.cdsAux.Open;
         DMTE.cdsAux.IndexFieldNames := 'AUXID';
      End;
   End;
End;

Procedure TFIngresoCaja.dblcdAuxExit2(Sender: TObject);
Var
   cSQLaux: String;
Begin
   If dblcClase.Focused Then exit;
   If Z2bbtnCancelCab.Focused Then exit;

   cSQLaux := 'Select AUXID, NVL(AUXRUC, NVL(A.AUXDNI, NVL(B.CLIERUC, B.CLIEDNI) ) ) AUXRUC, '
      + '       AUXGIRA, AUXNOMB '
      + '  from CNT201 A, TGE204 B '
      + ' where A.CLAUXID=' + quotedstr(dblcClase.Text)
      + '   and A.AUXID=' + quotedstr(dblcdAux.text)
      + '   and A.CLAUXID=B.CLAUXID(+) '
      + '   and A.AUXID=B.CLIEID(+) '
      + '   and A.ACTIVO=''S'' '
      + ' order BY A.AUXID';
   DMTE.Filtracds(DMTE.cdsQry, cSQLaux);

   If Trim(DMTE.cdsQry.fieldbyName('AUXID').asString) = '' Then
   Begin
      showmessage('No se encuentra registrado el Auxiliar');
      dblcdAux.Text := '';
      dblcdAux.setfocus;
      exit;
   End
   Else
   Begin
      edtAuxRuc.text := DMTE.cdsQry.fieldbyName('AUXRUC').asString;
      If Trim(DMTE.cdsQry.fieldbyName('AUXGIRA').asString) = '' Then
         dbeGiradoA.text := DMTE.cdsQry.fieldbyName('AUXNOMB').asString
      Else
         dbeGiradoA.text := DMTE.cdsQry.fieldbyName('AUXGIRA').asString;
      wModifica := True;

      edtAuxRuc.Enabled := (dblcdAux.Text = '33333333');
      dbeGiradoA.Enabled := (dblcdAux.Text = '33333333');
   End;
End;

Procedure TFIngresoCaja.dblcdCnpExit2(Sender: TObject);
Var
   sTemp: String;
Begin
   If Z2bbtnCancelCab.Focused Then exit;

   xDescrip := 'CPTOID=' + quotedstr(dblcdCnp.text) + ' AND TMONID=''' + dblcTMonCab.Text + '''';
   sTemp := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTODES', xDescrip, 'CPTODES');
   If sTemp = '' Then
   Begin
      showmessage('No se encuentra registrado el concepto');
      dblcdCnp.Text := '';
      dblcdCnp.setfocus;
   End
   Else
   Begin
      dbeGlosa.text := sTemp;
      wModifica := True;
   End;
End;

Procedure TFIngresoCaja.dblcTDocExit2(Sender: TObject);
Begin
   If Z2bbtnCancelCab.Focused Then exit;
   xDescrip := 'DOCID=' + quotedstr(dblcTDoc.text);
   edtTDoc.text := DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCDES', xDescrip, 'DOCDES');
   wModifica := True;
End;

Procedure TFIngresoCaja.dblcTMonCabExit2(Sender: TObject);
Begin
   If Z2bbtnCancelCab.Focused Then exit;
   wModifica := True;
   xDescrip := 'TMONID=' + quotedstr(dblcTMonCab.text);
   edtTMonCab.text := DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMONABR', xDescrip, 'TMONABR');
   DMTE.xxExit(dblcTMonCab, edtTMonCab, [Z2bbtnCancelCab], 'Moneda')
End;

Procedure TFIngresoCaja.dbeDHChange(Sender: TObject);
Begin
   If Not ((dbeDH.Text = 'D') Or (dbeDH.Text = 'H') Or (length(dbeDH.Text) = 0)) Then
      dbeDH.Text := '';
End;

Procedure TFIngresoCaja.dbeImporte2Exit(Sender: TObject);
Begin
   If Z2bbtnCanceldet.Focused Then exit;
   DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsString := dbeImporte2.Text;
   If dblcTMonCab.Text = DMTE.wTMonLoc Then
   Begin
      DMTE.cdsRegCxC.FieldByName('DEMTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat));
      DMTE.cdsRegCxC.FieldByName('DEMTOEXT').AsString := Cajadec(Currtostr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat / strtocurr(dbeTCambio.text)));
   End
   Else
   Begin
      DMTE.cdsRegCxC.FieldByName('DEMTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat * strtocurr(dbeTCambio.text)));
      DMTE.cdsRegCxC.FieldByName('DEMTOEXT').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat));
   End;
End;

Procedure TFIngresoCaja.dbeNoRegExit(Sender: TObject);
Begin
   If Not Z2bbtnCancelDet.Focused Then
   Begin
      dbeNoReg.Text := DMTE.strzero(dbeNoReg.Text, 10);
      If strtoint(dbeNoReg.Text) = 0 Then
      Begin // NoRegistro
         dbeNoReg.Text := '';
         ShowMessage('No es valido el No Registro');
         dbeNoReg.SetFocus;
         exit;
      End;
      DMTE.cdsRegCxC.FieldByName('CPNOREG').AsString := dbeNoReg.Text;
   End
End;

Procedure TFIngresoCaja.dbeGiradoAChange(Sender: TObject);
Begin
   If Not TCustomEdit(Sender).Focused Then
      Exit;
   wModifica := tRUE;
End;

Procedure TFIngresoCaja.ValidaCab;
Var
   xWhere: String;
Begin
   ValidaEdit(dblcCia, 'Ingrese Compañía');
   ValidaEdit(dblcBanco, 'Ingrese Caja ó Banco');
   ValidaEdit(dbdtpFEmision, 'Ingrese Fecha de Emisión');
   ValidaEdit(edtAuxRuc, 'Ingrese el D.N.I./ R.U.C.');

   ValidaEdit(dblcTDoc, 'Ingrese Tipo de Documento');
   ValidaEdit(dblcTMonCab, 'Ingrese Moneda');
   ValidaEdit(dbeTCambio, 'Ingrese Tipo de Cambio');
   If StrToCurr(dbeTCambio.Text) = 0 Then
   Begin
      Raise exception.create('Ingrese Tipo de Cambio');
   End;
   ValidaEdit(dblcClase, 'Ingrese Clase');

// Inicio HPC_201802_CAJA
// Cambia búsqueda de Maestro de Clientes
   {
   If dblcClase.Text = 'AS' Then
      ValidaEdit(dblcdAso, 'Ingrese Cliente / Asociado')
   Else
   Begin
      If dblcClase.Text = 'C' Then
         ValidaEdit(edtAux, 'Ingrese Cliente / Asociado')
      Else
         ValidaEdit(dblcdAux, 'Ingrese Cliente / Asociado');
      ;
   End;
   }
   ValidaEdit(edtAux, 'Ingrese Cliente / Asociado');
// Fin HPC_201802_CAJA

   ValidaEdit(dbeGiradoA, 'Ingrese Nombre del Cliente');
   ValidaEdit(dbeGlosa, 'Ingrese Glosa');
End;

Procedure TFIngresoCaja.RecuperaDescrip;
Begin
   DMTE.DescripIngDocs(dblcCia.text,
      DMTE.cdsIngDocs.FieldByName('CCTREC').AsString,
      DMTE.cdsIngDocs.FieldByName('DOCID').AsString,
      DMTE.cdsIngDocs.FieldByName('CCSERIE').AsString,
      DMTE.cdsIngDocs.FieldByName('CCNODOC').AsString
      );

   DMTE.cdsDescrip.Active := False;
   DMTE.cdsDescrip.Active := True;
   With DMTE.cdsDescrip Do
   Begin
      edtCia.Text := FieldbyName('CIAABR').AsString;
      edtTDoc.Text := FieldbyName('DOCABR').AsString;
      edtBanco.Text := FieldbyName('BANCOABR').AsString;
      edtTMonCab.Text := FieldbyName('TMONABR').AsString;
      edtClase.Text := FieldbyName('CLAUXDES').AsString;
      If Not DMTE.cdsDescrip.FieldByName('FLUEFEABR').isnull Then
         dbeFEfec.text := DMTE.cdsDescrip.FieldByName('FLUEFEABR').AsString;
   End;

End;

Procedure TFIngresoCaja.InHabilitaControles;
Begin
   dblcCia.Enabled := False;
   dblcTDoc.Enabled := False;
   dbeSerie.Enabled := False;
   dbeNoDoc.Enabled := False;
End;

Procedure TFIngresoCaja.HabilitaControles;
Begin
   dblcTDoc.Enabled := True;
   dbeSerie.Enabled := True;
   dbeNoDoc.Enabled := False;
End;

Procedure TFIngresoCaja.AsignaClaveDetalle;
Var
   BMK: TBookmark;
   xSQL: String;
Begin
// Inicio HPC_201309_CAJA
   xSQL := 'delete from CAJA301 '
      + ' where CIAID=' + quotedstr(dblcCia.Text)
      + '   and CCTREC=''NP'' '
      + '   and DOCID2=' + quotedstr(Trim(dblcTDoc.Text))
      + '   and CPSERIE=' + quotedstr(Trim(dbeSerie.Text))
      + '   and CPNODOC=' + quotedstr(Trim(dbeNoDoc.Text));
   Try
      DMTE.DCOM1.AppServer.EjecutaSql(xsql);
   Except
      // no se pone aqui nada, se deja para q no salte error en caso no existan registros físicos
   End;
// Fin HPC_201309_CAJA
   BMK := DMTE.cdsRegCxC.GetBookmark;
   DMTE.cdsRegCxC.DisableControls;
   DMTE.cdsRegCxC.First;
   While Not DMTE.cdsRegCxC.eof Do
   Begin
      DMTE.cdsRegCxC.Edit;
      DMTE.cdsRegCxC.fieldBYName('CIAID').AsString := dblccia.Text;
      DMTE.cdsRegCxC.fieldBYName('CCTREC').AsString := 'NP';
      DMTE.cdsRegCxC.fieldBYName('DOCID2').AsString := dblcTDoc.Text;
      DMTE.cdsRegCxC.fieldBYName('CPSERIE').AsString := trim(dbeSerie.Text);
      DMTE.cdsRegCxC.fieldBYName('CPNODOC').AsString := trim(dbeNoDoc.Text);
      DMTE.cdsRegCxC.fieldBYName('DENUMREG').AsString := trim(dbeNoDoc.Text);

   // Inicio HPC_201309_CAJA
      xSQL := 'Insert into CAJA301(CIAID, CPNOREG, DOCID2, CPSERIE, CPNODOC, TMONID, DETCDOC, DEDH, DEMTOORI, DEMTOLOC, '
            +'                     DEMTOEXT, CPTOID, CUENTAID, CPFEMIS, '
            + '                    DEANO, DEMM, DEDD, DESS, DESEM, DETRI, DEAASS, DEAASEM, DEAATRI, CCTREC, DENUMREG, '
            + '                    CANTIDAD) '
            + ' values(' + quotedstr(DMTE.cdsRegCxC.FieldByName('CIAID').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldByName('CPNOREG').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldByName('DOCID2').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldByName('CPSERIE').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.fieldBYName('CPNODOC').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.fieldbyName('TMONID').AsString) + ', '
                         + floattostr(DMTE.cdsRegCxC.fieldbyName('DETCDOC').AsFloat) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldByName('DEDH').AsString) + ', '
                         + floattostr(DMTE.cdsRegCxC.fieldBYName('DEMTOORI').AsFloat) + ', '
                         + floattostr(DMTE.cdsRegCxC.fieldBYName('DEMTOLOC').AsFloat) + ', '
                         + floattostr(DMTE.cdsRegCxC.fieldBYName('DEMTOEXT').AsFloat) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldbyName('CPTOID').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldbyName('CUENTAID').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldByName('CPFEMIS').Value) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldByName('DEANO').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldByName('DEMM').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldByName('DEDD').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldByName('DESS').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldByName('DESEM').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldByName('DETRI').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldByName('DEAASS').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldByName('DEAASEM').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldByName('DEAATRI').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.fieldBYName('CCTREC').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.fieldBYName('DENUMREG').AsString) + ', '
                         + quotedstr(DMTE.cdsRegCxC.FieldbyName('CANTIDAD').AsString) + ') ';
      Try
         DMTE.DCOM1.AppServer.EjecutaSql(xSQL);
      Except
         ShowMessage('No se pudo grabar correctamente el detalle del Ingreso');
         xSigueGrab := False;
         exit;
      End;
   // Fin HPC_201309_CAJA
      DMTE.cdsRegCxC.Next;
   End;
   DMTE.cdsRegCxC.GotoBookmark(BMK);
   DMTE.cdsRegCxC.FreeBookmark(BMK);
   DMTE.cdsRegCxC.EnableControls;
End;

Procedure TFIngresoCaja.dbeSerieChange(Sender: TObject);
Begin
   If Not TCustomEdit(Sender).Focused Then
      Exit;
   wModifica := True;
End;

Procedure TFIngresoCaja.dbeNoDocChange(Sender: TObject);
Begin
   If Not TCustomEdit(Sender).Focused Then
      Exit;
   wModifica := True;
End;

Procedure TFIngresoCaja.dbdtpFEmisionChange(Sender: TObject);
Begin
   If Not TCustomEdit(Sender).Focused Then
      Exit;
   wModifica := True;
End;

Procedure TFIngresoCaja.dbeGlosaChange(Sender: TObject);
Begin
   If Not TCustomEdit(Sender).Focused Then
      Exit;
   wModifica := True;
End;

Procedure TFIngresoCaja.AsignaParametros;
Var
   xSQL: String;
Begin
   xSQL := 'Select * from CAJA301 '
      + 'Where CIAID=''' + dblcCia.Text + ''' and CCTREC=''NP'' and '
      + 'DOCID2=''' + Trim(dblcTDoc.Text) + ''' and '
      + 'CPSERIE=''' + Trim(dbeSerie.Text) + ''' and '
      + 'CPNODOC=''' + Trim(dbeNoDoc.Text) + ''' ';
   DMTE.cdsRegCxC.DisableControls;
   DMTE.cdsRegCxC.Close;
   DMTE.cdsRegCxC.DataRequest(xSQL);
   DMTE.cdsRegCxC.Open;
   DMTE.cdsRegCxC.EnableControls;
End;

Procedure TFIngresoCaja.cdsRegCxCBeforePost(DataSet: TDataSet);
Begin
   wModifica := True;
   If Not Z2bbtnGraba.Enabled Then
   Begin
      Z2bbtnGraba.Enabled := True;
      Z2bbtnCancelado.Enabled := False;
      Z2bbtnAnula.Enabled := False;
   End;
End;

Procedure TFIngresoCaja.Z2bbtnCancel2Click(Sender: TObject);
Var
   Doc: structDocIng;
Begin
   //Cancela las Actualizaciones Realizadas
   If DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'C' Then Exit;
   DMTE.cdsIngDocs.CancelUpdates;
   DMTE.cdsRegCxC.CancelUpdates;
   If DMTE.wModo <> 'A' Then
   Begin
      With Doc Do
      Begin
         CIAID := dblcCia.Text;
         CCTREC := 'NP';
         DOCID := dblcTDoc.Text;
         CCSERIE := Trim(dbeSerie.Text);
         CCNODOC := Trim(dbeNoDoc.Text);
      End;
      Edita(Doc, cdsFiltro);
   End
   Else
      Adiciona;
   If DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString <> 'C' Then
      pnlCabecera1.SetFocus;
   Perform(CM_DialogKey, VK_TAB, 0);
End;

Procedure TFIngresoCaja.dbdtpFEmisionExit(Sender: TObject);
Var
   xStr: String;
Begin
   If dblcCia.Focused Then exit;
   If dblcBanco.Focused Then exit;
   If Z2bbtnCancelCab.Focused Then exit;

   If edtBanco.Text = '' Then
   Begin
      dblcBanco.SetFocus;
      exit;
   End;

   If dbdtpFEmision.Date = 0 Then
   Begin
      ShowMessage('Caja no fue Aperturada. Verifique');
      Exit;
   End;

   If (trim(dbeTCambio.Text) = '') Or (dbeTCambio.Text = '0.00') Then
   Begin
      xSTR := 'FECHA=' + DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha, dbdtpFEmision.date) + ''') '
         + ' AND TMONID=''' + DMTE.wTMonExt + '''';
      If DMTE.RecuperarDatos('TGE107', DMTE.wTipoCambioUsar, xSTR) Then
         dbeTCambio.Text := DMTE.cdsRec.FieldByName(DMTE.wTipoCambioUsar).AsString
      Else
      Begin
         dbeTCambio.Text := '0.00';
         TCustomEdit(Sender).SetFocus;
         Raise Exception.Create('Fecha no tiene tipo de Cambio');
      End;
      If dblcTDoc.Enabled = False Then
         dblcTDoc.OnExit(Self);
   End;
End;

Procedure TFIngresoCaja.ActualizaDetalle;
Var
   BMK: TBookmark;
Begin
   Showmessage('Actualizando detalle');
   BMK := DMTE.cdsRegCxC.GetBookmark;
   DMTE.cdsRegCxC.DisableControls;
   DMTE.cdsRegCxC.First;
   While Not DMTE.cdsRegCxC.eof Do
   Begin
      DMTE.cdsRegCxC.Edit;

      DMTE.cdsRegCxC.fieldBYName('TMONID').AsString := dblcTMonCab.Text;
      DMTE.cdsRegCxC.fieldBYName('DETCDOC').AsString := dbeTCambio.Text;
      If dblcTMonCab.Text = DMTE.wTMonLoc Then
      Begin
         DMTE.cdsRegCxC.FieldByName('DEMTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat));
         DMTE.cdsRegCxC.FieldByName('DEMTOEXT').AsString := Cajadec(Currtostr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat / strtocurr(dbeTCambio.text)));
      End
      Else
      Begin
         DMTE.cdsRegCxC.FieldByName('DEMTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat * strtocurr(dbeTCambio.text)));
         DMTE.cdsRegCxC.FieldByName('DEMTOEXT').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat));
      End;
      DMTE.cdsRegCxC.Next;
   End;
   DMTE.cdsRegCxC.GotoBookmark(BMK);
   DMTE.cdsRegCxC.FreeBookmark(BMK);
   DMTE.cdsRegCxC.EnableControls;

   BMK := DMTE.cdsDetFPago.GetBookmark;
   DMTE.cdsDetFPago.DisableControls;
   DMTE.cdsDetFPago.First;
   While Not DMTE.cdsDetFPago.eof Do
   Begin
      DMTE.cdsDetFPago.Edit;
      DMTE.cdsDetFPago.fieldBYName('TC_USADO').AsString := dbeTCambio.Text;
      If dblcTMonCab.Text = DMTE.wTMonLoc Then
      Begin
         DMTE.cdsDetFPago.FieldByName('FC_MTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat));
         DMTE.cdsDetFPago.FieldByName('FC_MTOEXT').AsString := Cajadec(Currtostr(DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat / strtocurr(dbeTCambio.text)));
      End
      Else
      Begin
         DMTE.cdsDetFPago.FieldByName('FC_MTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat * strtocurr(dbeTCambio.text)));
         DMTE.cdsDetFPago.FieldByName('FC_MTOEXT').AsString := Cajadec(CurrtoStr(DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat));
      End;
      DMTE.cdsDetFPago.Next;
   End;
   DMTE.cdsDetFPago.GotoBookmark(BMK);
   DMTE.cdsDetFPago.FreeBookmark(BMK);
   DMTE.cdsDetFPago.EnableControls;
End;

Procedure TFIngresoCaja.dblcClaseDetExit(Sender: TObject);
Begin
   xDescrip := 'CLAUXID=' + quotedstr(dblcClaseDet.text);
   edtClaseDet.text := DMTE.displaydescrip('prvTGE', 'TGE102', 'CLAUXDES', xDescrip, 'CLAUXDES');
   dblcdAuxDet.Enabled := True;
   wModifica := TRUE;
End;

Procedure TFIngresoCaja.dblcdAuxExit22(Sender: TObject);
Begin
   xdescrip := 'AUXID=' + quotedstr(dblcdAuxDet.text);
   dbeAuxDet.text := DMTE.displaydescrip('prvTGE', 'CNT201', 'AUXNOMB', xDescrip, 'AUXNOMB');
   wModifica := True;
End;

Procedure TFIngresoCaja.dblcdCnp2Exit2(Sender: TObject);
Var
   xwhere, sTmp, sSql, sPreEsp: String;
Begin
   If Z2bbtnCancelDet.Focused Then exit;
   xDescrip := 'CPTOID=' + quotedstr(dblcdCnp22.text);
   sTmp := DMTE.DisplayDEscrip('prvTGE', 'CAJA201', '*', xDescrip, 'CPTODES');
   If (sTmp = '') Then
   Begin
      showmessage('No se encuentra registrado el concepto');
      dblcdCnp22.Text := '';
      dblcdCnp22.setfocus;
   End
   Else
   Begin
      edtCnp2.Text := sTmp;
      If Trim(edtCnp2.Text) = '' Then
      Begin
         DMTE.cdsRegCxC.FieldByName('CUENTAID').AsString := '';
         dblcdAuxDet.Enabled := False;
         dblcdCCosto.Enabled := False;
         dbeAuxDet.text := '';
      End
      Else
      Begin
         DMTE.cdsRegCxC.FieldByName('CUENTAID').AsString := DMTE.cdsQry.fieldbyName('CUENTAID').asString;

         seCantidad.Enabled := True;
         If DMTE.cdsQry.fieldbyName('CANFIJO').asString = 'S' Then
         Begin
            DMTE.cdsRegCxC.FieldByName('CANTIDAD').AsString := '1';
            seCantidad.Enabled := False;
         End;

         If trim(dbePreUni.Text) = '' Then
            dbePreUni.Text := DMTE.cdsQry.fieldbyName('IMPORTE').asString;

         If trim(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsString) = '' Then
            DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsString := DMTE.cdsQry.fieldbyName('IMPORTE').asString;

         If DMTE.cdsQry.fieldbyName('IMPFIJO').asString = 'S' Then
         Begin
            If sPreEsp = 'N' Then
            Begin
               If dbdtpFEmision.Date <= DMTE.cdsQry.fieldbyName('FEC_01').AsDateTime Then
                  dbePreUni.Text := DMTE.cdsQry.fieldbyName('IMP_01').asString
               Else
               Begin
                  If dbdtpFEmision.Date <= DMTE.cdsQry.fieldbyName('FEC_02').asDateTime Then
                     dbePreUni.Text := DMTE.cdsQry.fieldbyName('IMP_02').asString
                  Else
                     dbePreUni.Text := DMTE.cdsQry.fieldbyName('IMPORTE').asString;
               End;
            End;
            DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsString := dbePreUni.Text;

            dbePreUni.Enabled := False;
            If dblcTMonCab.Text = DMTE.wTMonLoc Then
            Begin
               DMTE.cdsRegCxC.FieldByName('DEMTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat));
               DMTE.cdsRegCxC.FieldByName('DEMTOEXT').AsString := Cajadec(Currtostr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat / strtocurr(dbeTCambio.text)));
            End
            Else
            Begin
               DMTE.cdsRegCxC.FieldByName('DEMTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat * strtocurr(dbeTCambio.text)));
               DMTE.cdsRegCxC.FieldByName('DEMTOEXT').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat));
            End;
         End
         Else
         Begin
            If DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat > 0 Then
            Begin
               If dblcTMonCab.Text = DMTE.wTMonLoc Then
               Begin
                  DMTE.cdsRegCxC.FieldByName('DEMTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat));
                  DMTE.cdsRegCxC.FieldByName('DEMTOEXT').AsString := Cajadec(Currtostr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat / strtocurr(dbeTCambio.text)));
               End
               Else
               Begin
                  DMTE.cdsRegCxC.FieldByName('DEMTOLOC').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat * strtocurr(dbeTCambio.text)));
                  DMTE.cdsRegCxC.FieldByName('DEMTOEXT').AsString := Cajadec(CurrtoStr(DMTE.cdsRegCxC.FieldByName('DEMTOORI').AsFloat));
               End;
            End;
            dbePreUni.Enabled := True;
         End;

       //Busca y Habilita
         xWhere := 'CIAID=''' + dblccia.Text + ''' AND CUENTAID=''' + DMTE.cdsRegCxC.FieldByName('CUENTAID').AsString + '''';
         If Length(DMTE.DisplayDescrip('prvTGE', 'TGE202', 'CUENTAID, CTA_CCOS, CTA_AUX', xWhere, 'CuentaId')) > 0 Then
         Begin
            If (DMTE.cdsQry.FieldByName('CTA_CCOS').AsString = 'S') Then
            Begin
               xDescrip := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S'' AND CCOSACT=''S''';
               DMTE.cdsCCosto.Close;
               DMTE.cdsCCosto.DataRequest(xDescrip);
               DMTE.cdsCCosto.open;
               dblcdCCosto.Enabled := True;
               dblcdCCosto.SetFocus;
            End
            Else
               dblcdCCosto.Enabled := False;

            If DMTE.cdsQry.fieldbyName('CTA_AUX').asString = 'S' Then
               dblcdAuxDet.Enabled := True
            Else
               dblcdAuxDet.Enabled := False;
         End
      End;
      dblcClaseDet.Enabled := dblcdAuxDet.Enabled;

      If dblcClaseDet.Enabled Then dblcClaseDet.SetFocus;

      If trim(edtCnp2.Text) <> '' Then
      Begin
         If Not dblcdAuxDet.Enabled Then
         Begin
            DMTE.cdsRegCxC.FieldByName('PROV').AsString := '';
            DMTE.cdsRegCxC.FieldByName('CLAUXID').AsString := '';
            edtClaseDet.Text := '';
            dbeAuxDet.Text := '';
         End
         Else
         Begin
            DMTE.cdsRegCxC.FieldByName('PROV').AsString := DMTE.cdsAux.FieldByName('AUXID').AsString;
            DMTE.cdsRegCxC.FieldByName('CLAUXID').AsString := DMTE.cdsClaseAux.FieldByName('CLAUXID').AsString;
            edtClaseDet.Text := edtClase.text;
            xdescrip := 'CLAUXID=''' + DMTE.cdsRegCxC.FieldByName('CLAUXID').AsString + ''' AND  AUXID=' + quotedstr(dblcdAuxDet.text);
            dbeAuxDet.text := DMTE.displaydescrip('prvTGE', 'CNT201', 'AUXNOMB', xDescrip, 'AUXNOMB');
         End;

         If Not dblcdCCosto.Enabled Then
            DMTE.cdsRegCxC.FieldByName('CCOSID').AsString := '';
      End;
   End;
End;

Procedure TFIngresoCaja.wwDBEdit1Change22(Sender: TObject);
Begin
   wmodifica := True;
End;

Procedure TFIngresoCaja.dblcdFEfecExit(Sender: TObject);
Begin
   If Z2bbtnCancelCab.Focused Then exit;

   xDescrip := 'FLUEFEID=' + quotedstr(dblcdFEfec.text);
   dbeFEfec.text := DMTE.DisplayDescrip('prvTGE', 'TGE217', 'FLUEFEDES', xDescrip, 'FLUEFEDES');
End;

Procedure TFIngresoCaja.ActualizaFiltro;
Begin
   If z2bbtnNuevo.Visible Then
   Begin
      If Not xGraboNuevo Then
         cdsFiltro.append;
      DMTE.ActualizaCDS(DMTE.cdsIngDocs, cdsFiltro);
   End
   Else
   Begin
      DMTE.ActualizaCDS(DMTE.cdsIngDocs, cdsFiltro);
   End;
   xGraboNuevo := True;
End;

Procedure TFIngresoCaja.AsignaCDSFiltro(cds: TwwClientDataset);
Begin
   cdsFiltro := cds;
End;

Procedure TFIngresoCaja.dbgDetFPagoDblClick(Sender: TObject);
Begin
   If dbgDetFPago.DataSource.DataSet.RecordCount = 0 Then
   Begin
      MessageDlg('NO hay Registros por Editar', mtInformation,
         [mbOk], 0);
      exit;
   End;
   If DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'C' Then
   Begin
      ShowMessage('Este Documento Está Cancelado');
      exit;
   End;
   If DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Este Documento Está Anulado');
      exit;
   End;

   pnlDetPago.Enabled := False;
   pnlBotones.Enabled := False;
   PnlFPago.BringToFront;
   BlanqueaEdits(pnlFPago);
   PnlFPago.Visible := True;
   PnlFpago.setfocus;
   perform(CM_DialogKey, VK_TAB, 0);
   DMTE.cdsDetFPago.Edit;
   llenaedits;
End;

Procedure TFIngresoCaja.dbgDetFPagoEnter(Sender: TObject);
Begin
   If dbgDetFPago.DataSource.DataSet.RecordCount = 0 Then
   Begin
      Z2bbtnAdicFPago.OnClick(Nil);
   End;
End;

Procedure TFIngresoCaja.Z2bbtnAdicFPagoClick(Sender: TObject);
Begin
  //Deshabilitar resto de paneles
   pnlDetPago.Enabled := False;
   pnlBotones.Enabled := False;
   PnlFPago.BringToFront;
   BlanqueaEdits(pnlFPago);
   PnlFPago.Visible := True;
   PnlFpago.setfocus;
   perform(CM_DialogKey, VK_TAB, 0);
   Inserta;
   PnlFPago.Visible := True;
   If dblcFormPago.enabled Then
      dblcFormPago.SetFocus;

End;

Procedure TFIngresoCaja.bbtnCancFPagoClick(Sender: TObject);
Begin
   DMTE.cdsDetFPago.Cancel;
   pnlFPago.SetFocus;
   pnlFPago.Visible := False;
   pnlDetPago.Enabled := True;
   pnlBotones.Enabled := True;
End;

Procedure TFIngresoCaja.BitBtn2Click(Sender: TObject);
Begin
   If DMTE.cdsDetFPago.State In [dsedit, dsinsert] Then
   Begin
      If MessageDlg(' Añadir Cancelará los Cambios Actuales' + #13 +
         '     ¿ Desea Continuar ?     ', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         exit;
   End;
   DMTE.cdsDetFPago.Cancel;
   BlanqueaEdits(pnlFPago);
   Inserta;
End;

Procedure TFIngresoCaja.chkAsignaRestoClick(Sender: TObject);
Begin
   If chkAsignaResto.Checked Then
   Begin
      dbeRecibido.Enabled := False;
      dbeACobrar.Enabled := False;
      If dblcTMonC.Text = DMTE.wTMonLoc Then
      Else
         dbeRecibidoExit(Nil);
   End
   Else
   Begin
      dbeRecibido.Enabled := True;
      dbeACobrar.Enabled := True;

   End;
End;

Procedure TFIngresoCaja.dbeACobrarEnter(Sender: TObject);
Begin
   strTmp := dbeACobrar.Text;
End;

Procedure TFIngresoCaja.dbeACobrarExit(Sender: TObject);
Begin
   If bbtnCancFPago.Focused Then exit;

   If CajaDec(dbeACobrar.text) = BLANCO Then
   Begin
      dbeACobrar.Text := dbeRecibido.Text;
      Exit;
   End;

   If strTmp <> dbeACobrar.text Then
   Begin
      dbeACobrar.text := CajaDec(dbeACobrar.Text);
      If CmpDec(dbeRecibido.Text, dbeACobrar.Text) = -1 Then
         dbeACobrar.Text := dbeRecibido.Text;
   End;
End;

Procedure TFIngresoCaja.dbeRecibidoChange(Sender: TObject);
Begin
   dbeACobrar.Enabled := True;
End;

Procedure TFIngresoCaja.dbeRecibidoEnter(Sender: TObject);
Begin
   strTmp := dbeRecibido.Text;
End;

Procedure TFIngresoCaja.dbeRecibidoExit(Sender: TObject);
Var
   Tmp: String;
Begin
   If bbtnCancFPago.Focused Then exit;

   Tmp := StrTmp;
   If CajaDec(dbeRecibido.text) = BLANCO Then
   Begin
      ShowMessage('Debe ingresar Monto Recibido');
      StrTmp := Tmp;
      dbeRecibido.Text := BLANCO;
      dbeRecibido.setfocus;
      Exit;
   End;
   If strTmp <> dbeRecibido.text Then
   Begin
      dbeRecibido.text := CajaDec(dbeRecibido.text);
      dbeACobrar.text := dbeRecibido.text;

   End;
End;

Procedure TFIngresoCaja.dblcFormPagoExit(Sender: TObject);
Var
   xFlag: String;
Begin
   If bbtnCancFPago.Focused Then exit;

   xDescrip := 'FPAGOID=' + quotedstr(dblcFormPago.text);
   edtFormPago.text := DMTE.DisplayDescrip('prvTGE', 'TGE112', 'FPAGODES', xDescrip, 'FPAGODES');
   If (trim(edtFormPago.text) <> '') Then
   Begin
      If dblcFormPago.text = DMTE.wEFECTIVO Then
      Begin
         dbdtpFecEmi.Date := dbdtpFEmision.Date;
         dbdtpFecVenc.Date := dbdtpFEmision.Date;
         DesHabilitaControles([dblcBancofPago, dblcTarjeta, dbeNOChq, dbdtpFecEmi, dbdtpFecVenc]);

         dblcBancofPago.Text := '';
         edtBcoFPago.text := '';
         dblcTarjeta.text := '';
         edtTarjeta.text := '';
         dbeNOChq.Text := '';
      End
      Else
      Begin
         xFlag := DMTE.DisplayDescrip('prvTGE', 'TGE112', 'FCHQ', 'FPAGOID=' + QuotedStr(dblcFormPago.text), 'FCHQ');
         If (xFlag = '1') Or (xFlag = 'S') Then
         Begin
            cajautil.HabilitaControles([dbeNOChq, dblcBancofPago, dbdtpFecEmi, dbdtpFecVenc]);
            dblcTarjeta.text := '';
            edtTarjeta.text := '';
            dblcBancofPago.SetFocus;
         End
         Else
            If dblcFormPago.text = DMTE.wTARJETA Then
            Begin
               cajautil.HabilitaControles([dbeNOChq, dblcBancofPago, dblcTarjeta, dbdtpFecEmi, dbdtpFecVenc]);
               dblcBancofPago.SetFocus;
            End;
      End;
   End;
End;

Procedure TFIngresoCaja.dblcTarjetaExit(Sender: TObject);
Begin
   If bbtnCancFPago.Focused Then exit;

   xDescrip := 'TJAID=' + quotedstr(dblcTarjeta.text);
   edtTarjeta.text := DMTE.displaydescrip('prvTGE', 'TGE167', 'TJADES', xDescrip, 'TJADES');
   If dblcTarjeta.text = '' Then
   Begin
      showmessage('Falta Tarjeta');
      dblcTarjeta.SetFocus;
   End;
End;

Procedure TFIngresoCaja.dblcTMonCExit(Sender: TObject);
Begin
   If bbtnCancFPago.Focused Then exit;

   xDescrip := 'TMONID=' + quotedstr(dblcTMonC.text);
   edtTMonC.text := DMTE.displaydescrip('prvTGE', 'TGE103', 'TMONABR', xDescrip, 'TMONABR');
   If edtTMonC.text = '' Then
   Begin
      showmessage('Falta Moneda');
      dblcTMonC.SetFocus;
   End
   Else
      If self.ActiveControl <> TWinControl(Sender) Then
         CalculaResto;
End;

Procedure TFIngresoCaja.dblcBancoFPagoExit(Sender: TObject);
Begin
   If bbtnCancFPago.Focused Then exit;

   xdescrip := 'BANCOID=' + quotedstr(dblcBancoFPago.text);
   edtBcoFPago.text := DMTE.displaydescrip('prvTGE', 'TGE105', 'BANCONOM', xDescrip, 'BANCONOM');
   If dblcBancofPago.text = '' Then
   Begin
      showmessage('Falta Banco');
      dblcBancofPago.SetFocus;
   End;
End;

Procedure TFIngresoCaja.Z2OkDetalleClick(Sender: TObject);
Var
   xNuevo: Boolean;
Begin

   ValidacionDatos;
   ValidacionTjaChq;
   ValidacionCobradoTotal;
   If DMTE.cdsDetFPago.state = dsinsert Then
      xNuevo := True
   Else
      xNuevo := False;
   GrabaDetalle;
   AcumulaDetFPago;
   wModifica := TRUE;
   If xNuevo Then
   Begin
      BlanqueaEdits(pnlFPago);
      Inserta;
   End
   Else
   Begin
      pnlFPago.SetFocus;
      pnlFPago.Visible := False;
      pnlDetPago.Enabled := True;
      pnlBotones.Enabled := True;
   End
End;

Procedure TFIngresoCaja.LLenaEdits;
Begin
   With DMTE.cdsDetFPago Do
   Begin
      dblcFormPago.text := DMTE.FieldNoNUlo(FieldByName('FPAGOID'));
      dblcBancoFPago.text := DMTE.FieldNoNUlo(FieldByName('BANCOID'));
      dblcTarjeta.text := DMTE.FieldNoNUlo(FieldByName('TJAID'));
      dblcTMOnC.Text := DMTE.FieldNoNUlo(FieldByName('TMONID'));
      dbeNOChq.Text := DMTE.FieldNoNUlo(FieldByName('ECNOCHQ'));
      dbeRecibido.text := DMTE.FieldNoNUlo(FieldByName('FC_RECIBIDO'));
      dbeaCobrar.text := DMTE.FieldNoNUlo(FieldByName('FC_COBRADO'));

      xDescrip := 'FPAGOID=' + quotedstr(dblcFormPago.text);
      edtFormPago.text := DMTE.DisplayDescrip('prvTGE', 'TGE112', 'FPAGODES', xDescrip, 'FPAGODES');
      xdescrip := 'BANCOID=' + quotedstr(dblcBancoFPago.text);
      edtBcoFPago.text := DMTE.displaydescrip('prvTGE', 'TGE105', 'BANCONOM', xDescrip, 'BANCONOM');
      xDescrip := 'TJAID=' + quotedstr(dblcTarjeta.text);
      edtTarjeta.text := DMTE.displaydescrip('prvTGE', 'TGE167', 'TJADES', xDescrip, 'TJADES');
      xDescrip := 'TMONID=' + quotedstr(dblcTMonC.text);
      edtTMonC.text := DMTE.displaydescrip('prvTGE', 'TGE103', 'TMONABR', xDescrip, 'TMONABR');

      CalculaResto;
   End;
   dbeRecibido.Enabled := True;
   dbeACobrar.Enabled := True;
   bitbtn2.Visible := False;
End;

Procedure TFIngresoCaja.Inserta;
Begin
   DMTE.cdsDetFPago.Insert;
   DMTE.cdsDetFPago.FieldByName('CORRE').AsInteger := DMTE.cdsDetFPago.recno;
   If DMTE.cdsDetFPago.recordcount = 0 Then
      If DMTE.wTMonLoc = trim(dblcTMonCab.Text) Then
         dbeRecibido.Text := dbgDetPago.columnbyname('DEMTOLOC').FooterValue
      Else
         dbeRecibido.Text := dbgDetPago.columnbyname('DEMTOORI').FooterValue;

   dblcTMonC.text := dblcTMonCab.Text;
   edtTMonC.Text := edtTMonCab.Text;
   dbeRecibido.Enabled := True;
   dbeACobrar.Enabled := False;
   CalculaResto;

   If StrToFloat(dbeResta.text) <= 0 Then
      bbtnCancFPago.onclick(bbtnCancFPago)
   Else
      dblcFormPago.SetFocus;
End;

Procedure TFIngresoCaja.InsertaDetallePago;
Var
   xSQL: String;
   xMonLoc,
      xMtoExt: double;
   Anio, Mes, Dia: Word;
Begin
   xSQL := 'Select * from CAJA314 '
      + ' Where CIAID=''' + DMTE.cdsIngDocs.FieldbyName('CIAID').AsString + ''' and '
      + 'CCTREC=''' + DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString + ''' and '
      + 'DOCID=''' + DMTE.cdsIngDocs.FieldbyName('DOCID').AsString + ''' and '
      + 'CCSERIE=''' + DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString + ''' and '
      + 'CCNODOC=''' + DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString + ''' ';
   DMTE.cdsDetFPago.Close;
   DMTE.cdsDetFPago.DataRequest(xSQL);
   DMTE.cdsDetFPago.Open;

   If DMTE.cdsDetFPago.RecordCount > 0 Then
      DMTE.cdsDetFPago.Delete;

   DMTE.cdsDetFPago.Insert;
   DMTE.cdsDetFPago.FieldByName('CORRE').AsInteger := 1;

   If DMTE.wTMonLoc = trim(dblcTMonCab.Text) Then
      dbeRecibido.Text := dbgDetPago.columnbyname('DEMTOLOC').FooterValue
   Else
      dbeRecibido.Text := dbgDetPago.columnbyname('DEMTOEXT').FooterValue;

   dblcTMonC.text := dblcTMonCab.Text;
   edtTMonC.Text := edtTMonCab.Text;

   DMTE.cdsDetFPago.FieldByName('FPAGOID').AsString := DMTE.wEfectivo;
   DMTE.cdsDetFPago.FieldByName('FPAGODES').AsString := DMTE.DisplayDescrip('prvTGE', 'TGE112', 'FPAGOABR', 'FPAGOID=' + quotedstr(DMTE.wEfectivo), 'FPAGOABR');
   DMTE.cdsDetFPago.FieldByName('BANCOID').AsString := dblcBancoFPago.text;
   DMTE.cdsDetFPago.FieldByName('TJAID').AsString := dblcTarjeta.text;
   DMTE.cdsDetFPago.FieldByName('TMONID').AsString := dblcTMOnC.Text;
   DMTE.cdsDetFPago.FieldByName('TMONABR').AsString := edtTMonC.text;
   DMTE.cdsDetFPago.FieldByName('ECNOCHQ').AsString := Trim(dbeNOChq.Text);
   DMTE.cdsDetFPago.FieldByName('FC_RECIBIDO').AsString := dbeRecibido.text;
   DMTE.cdsDetFPago.FieldByName('TC_USADO').AsString := dbeTCambio.Text;
   DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsString := DMTE.cdsDetFPago.FieldByName('FC_RECIBIDO').AsString;
   DMTE.cdsDetFPago.FieldByName('FC_DEVOLVER').AsString := '0.00';
   DMTE.cdsDetFPago.FieldByName('CPTOID').AsString := Trim(dblcdCnp.Text);
   DMTE.cdsDetFPago.FieldByName('CLAUXID').AsString := Trim(dblcClase.Text);
   If dblcClase.Text = 'C' Then
      DMTE.cdsDetFPago.FieldByName('CLIEID').AsString := Trim(edtAux.Text)
   Else
      DMTE.cdsDetFPago.FieldByName('CLIEID').AsString := Trim(dblcdAux.Text);
   DMTE.cdsDetFPago.FieldByName('FC_FVCMTO').Asdatetime := dbdtpFecVenc.Date;
   DMTE.cdsDetFPago.FieldByName('FC_FEMIS').Asdatetime := dbdtpFecEmi.Date;
   DecodeDate(dbdtpFEmision.Date, Anio, Mes, Dia);
   DMTE.cdsDetFPago.FieldByName('ECANOMM').AsString := FloatToStr(Anio) + DMTE.StrZero(FloatToStr(Mes), 2);

   //Calcular y grabar equivalentes
   If dblctmonc.Text = DMTE.wTMonLoc Then
   Begin
      xMonLoc := DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat;
      xMtoExt := Redondea(DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat / DMTE.cdsDetFPago.FieldByName('TC_USADO').AsFloat);
   End
   Else
   Begin
      xMonLoc := DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat * DMTE.cdsDetFPago.FieldByName('TC_USADO').AsFloat;
      xMtoExt := DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat;
   End;
   DMTE.cdsDetFPago.FieldByName('FC_MTOLOC').AsFloat := Redondea(xMonLoc);
   DMTE.cdsDetFPago.FieldByName('FC_MTOEXT').AsFloat := Redondea(xMtoExt);
   cdsPost(DMTE.cdsDetFPago);
   //fin de calcular
   DMTE.cdsDetFPago.Post;

   xMtoLoc := OperClientDataSet(DMTE.cdsDetFPago, 'SUM(FC_MTOLOC)', '');
   xMtoExt := OperClientDataSet(DMTE.cdsDetFPago, 'SUM(FC_MTOEXT)', '');

   dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue := cajadec(currtostr(xMtoLoc));
   dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue := cajadec(currtostr(xMtoExt));
End;

Procedure TFIngresoCaja.GrabaDetalle;
Var
   xMonLoc,
      xMtoExt: double;
   Anio, Mes, Dia: Word;
Begin
   DMTE.cdsDetFPago.Edit;
   DMTE.cdsDetFPago.FieldByName('FPAGOID').AsString := dblcFormPago.text;
   DMTE.cdsDetFPago.FieldByName('FPAGODES').AsString := DMTE.DisplayDescrip('prvTGE', 'TGE112', 'FPAGOABR', 'FPAGOID=' + quotedstr(dblcFormPago.text), 'FPAGOABR');
   DMTE.cdsDetFPago.FieldByName('BANCOID').AsString := dblcBancoFPago.text;
   DMTE.cdsDetFPago.FieldByName('TJAID').AsString := dblcTarjeta.text;
   DMTE.cdsDetFPago.FieldByName('TMONID').AsString := dblcTMOnC.Text;
   DMTE.cdsDetFPago.FieldByName('TMONABR').AsString := edtTMonC.text;
   DMTE.cdsDetFPago.FieldByName('ECNOCHQ').AsString := Trim(dbeNOChq.Text);
   DMTE.cdsDetFPago.FieldByName('FC_RECIBIDO').AsString := dbeRecibido.text;
   DMTE.cdsDetFPago.FieldByName('TC_USADO').AsString := dbeTCambio.Text;
   DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsString := DMTE.cdsDetFPago.FieldByName('FC_RECIBIDO').AsString;
   DMTE.cdsDetFPago.FieldByName('FC_DEVOLVER').AsString := '0.00';
   DMTE.cdsDetFPago.FieldByName('CPTOID').AsString := Trim(dblcdCnp.Text);
   DMTE.cdsDetFPago.FieldByName('CLAUXID').AsString := Trim(dblcClase.Text);
   If dblcClase.Text = 'C' Then
      DMTE.cdsDetFPago.FieldByName('CLIEID').AsString := Trim(edtAux.Text)
   Else
      DMTE.cdsDetFPago.FieldByName('CLIEID').AsString := Trim(dblcdAux.Text);
   DMTE.cdsDetFPago.FieldByName('FC_FVCMTO').Asdatetime := dbdtpFecVenc.Date;
   DMTE.cdsDetFPago.FieldByName('FC_FEMIS').Asdatetime := dbdtpFecEmi.Date;
   DecodeDate(dbdtpFEmision.Date, Anio, Mes, Dia);
   DMTE.cdsDetFPago.FieldByName('ECANOMM').AsString := FloatToStr(Anio) + DMTE.StrZero(FloatToStr(Mes), 2);

   //Calcular y grabar equivalentes
   If dblctmonc.Text = DMTE.wTMonLoc Then
   Begin
      xMonLoc := DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat;
      xMtoExt := Redondea(DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat / DMTE.cdsDetFPago.FieldByName('TC_USADO').AsFloat);
   End
   Else
   Begin
      xMonLoc := DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat * DMTE.cdsDetFPago.FieldByName('TC_USADO').AsFloat;
      xMtoExt := DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat;
   End;
   DMTE.cdsDetFPago.FieldByName('FC_MTOLOC').AsFloat := Redondea(xMonLoc);
   DMTE.cdsDetFPago.FieldByName('FC_MTOEXT').AsFloat := Redondea(xMtoExt);
   cdsPost(DMTE.cdsDetFPago);
   //fin de calcular
   DMTE.cdsDetFPago.Post;
End;

Procedure TFIngresoCaja.ValidacionCobradoTotal;
Begin
   If chkAsignaResto.Checked Then
      exit;
End;

Procedure TFIngresoCaja.ValidacionDatos;
Begin

   If trim(dblcFormPago.text) = '' Then
   Begin
      dblcFormPago.SetFocus;
      Raise Exception.Create('Ingrese Forma de Pago');
   End;

   If trim(dblcTMonC.text) = '' Then
   Begin
      dblcTMonC.setfocus;
      Raise Exception.Create('Ingrese Moneda');
   End;

   If (cajadec(dbeRecibido.text) = BLANCO) Then
   Begin
      dbeRecibido.SetFocus;
      Raise Exception.Create('Ingrese Monto Recibido');
   End
End;

Procedure TFIngresoCaja.ValidacionTjaChq;
Begin
   If dblcFormPago.Text = DMTE.wEFECTIVO Then
      Exit;

   If trim(dblcBanco.text) = '' Then
   Begin
      dblcBanco.setfocus;
      Raise Exception.Create('Ingrese Banco');
   End;
   If trim(dbeNoChq.text) = '' Then
   Begin
      If Not dbeNoChq.enabled Then
         dbeNoChq.enabled := True;
      dbeNoChq.setfocus;
      Raise Exception.Create('Ingrese Chq/Tarjeta');
   End;

   If dblcFormPago.Text = DMTE.wTARJETA Then
   Begin
      If trim(dblcTarjeta.text) = '' Then
      Begin
         dblcTarjeta.SetFocus;
         Raise Exception.Create('Ingrese Tipo de Tarjeta');
      End;
   End;
End;

Procedure TFIngresoCaja.ValidaCancelacion;
Begin
   If (DMTE.wTMonLoc = trim(dblcTMonCab.Text)) Then
   Begin
      If trim(dbgDetPago.ColumnByName('DEMTOLOC').FooterValue) <>
         trim(dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue) Then
      Begin
         Raise Exception.create('El Monto Provisionado y ' + #13 + 'La Cancelación no concuerdan');
      End;
   End
   Else
      If trim(dbgDetPago.ColumnByName('DEMTOEXT').FooterValue) <>
         trim(dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue) Then
      Begin
         Raise Exception.create('El Monto Provisionado y ' + #13 + 'La Cancelación no concuerdan');
      End;
End;

Procedure TFIngresoCaja.GrabaClave;
Begin
   With DMTE.cdsDetFPago Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         Edit;
         FieldBYname('CIAID').AsString := trim(dblcCia.Text);
         FieldBYname('CCTREC').AsString := 'NP';
         FieldBYname('DOCID').AsString := trim(dblcTDoc.Text);
         FieldBYname('CCSERIE').AsString := trim(dbeSerie.Text);
         FieldBYname('CCNODOC').AsString := trim(dbeNoDoc.Text);
         FieldBYname('FC_ESTADO').AsString := 'I';
         Post;
         Next;
      End;
      First;
      EnableControls;
   End;
End;

Procedure TFIngresoCaja.GrabaEstadoFPago(xEstado: String);
Var
   xsSQL, sFCanc: String;
Begin
   sFCanc := formatdatetime(DMTE.wFormatFecha, dbdtpFEmision.date);

// Inicio HPC_201309_CAJA
// cambia forma de grabación para que sea en forma directa con sentencia SQL
{
   If (DMTE.SRV_D = 'DB2400') Or (DMTE.SRV_D = 'ORACLE') Then
   Begin
      With DMTE.cdsDetFPago Do
      Begin
         DisableControls;
         First;
         While Not Eof Do
         Begin
            Edit;
            FieldByName('CAJAID').AsString := dblcBanco.Text;
            FieldByName('FC_ESTADO').AsString := xEstado;
            FieldByName('FC_FCANC').AsDateTime := dbdtpFEmision.Date;
            Post;
            Next;
         End;
      // Inicio HPC_201309_CAJA
         If DMTE.cdsDetFPago.ApplyUpdates(0) > 0 Then
         Begin
            ShowMessage('Error al intentar grabar el detalle de pago');
            xSigueGrab := False;
            exit;
         End;
      // Final HPC_201309_CAJA
         First;
         EnableControls;
      End;
   End;
}
   DMTE.cdsDetFPago.DisableControls;
   DMTE.cdsDetFPago.First;
   While Not DMTE.cdsDetFPago.Eof Do
   Begin
      DMTE.cdsDetFPago.Edit;
      DMTE.cdsDetFPago.FieldByName('CAJAID').AsString := dblcBanco.Text;
      DMTE.cdsDetFPago.FieldByName('FC_ESTADO').AsString := xEstado;
      DMTE.cdsDetFPago.FieldByName('FC_FCANC').AsDateTime := dbdtpFEmision.Date;
      DMTE.cdsDetFPago.Post;
      If DMTE.cdsDetFPago.ApplyUpdates(0)>0 Then
      Begin
         try
            xsSQL := 'update CAJA314 '
                    +'   set CAJAID='+quotedstr(DMTE.cdsDetFPago.FieldByName('CAJAID').AsString)+','
                    +'       FC_ESTADO='+quotedstr(DMTE.cdsDetFPago.FieldByName('FC_ESTADO').AsString)+','
                    +'       FC_FCANC='+quotedstr(datetostr(DMTE.cdsDetFPago.FieldByName('FC_FCANC').AsDateTime))+' '
                    +' where CIAID='+quotedstr(DMTE.cdsIngDocs.FieldbyName('CIAID').AsString)
                    +'   and CCTREC='+quotedstr(DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString)
                    +'   and DOCID='+quotedstr(DMTE.cdsIngDocs.FieldbyName('DOCID').AsString)
                    +'   and CCSERIE='+quotedstr(DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString)
                    +'   and CCNODOC='+quotedstr(DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString)
                    +'   and CORRE='+inttostr(DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsInteger);
            DMTE.DCOM1.AppServer.EjecutaSql(xsSQL);
         except
            ShowMessage('Error al intentar grabar el detalle de pago');
            xSigueGrab := False;
            exit;
         End;
      End;
      DMTE.cdsDetFPago.Next;
   End;
   DMTE.cdsDetFPago.First;
   DMTE.cdsDetFPago.EnableControls;
// Fin HPC_201309_CAJA
End;

Procedure TFIngresoCaja.AcumulaDetFPago;
Var
   xMtoLoc, xMtoExt: Currency;
   xCountLoc, xCountExt: Double;
   xMonedaBase: String;
Begin
   xMtoLoc := OperClientDataSet(DMTE.cdsDetFPago, 'SUM(FC_MTOLOC)', '');
   xMtoExt := OperClientDataSet(DMTE.cdsDetFPago, 'SUM(FC_MTOEXT)', '');

   dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue := cajadec(currtostr(xMtoLoc));
   dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue := cajadec(currtostr(xMtoExt));

   xCountLoc := OperClientDataSet(DMTE.cdsDetFPago, 'COUNT(*)', 'TMONID=''' + DMTE.wTMonLoc + '''');
   xCountExt := OperClientDataSet(DMTE.cdsDetFPago, 'COUNT(*)', 'TMONID=''' + DMTE.wTMonExt + '''');
   If ((xCountLoc > 0) And (xCountExt = 0)) Or ((xCountLoc = 0) And (xCountExt > 0)) Then
   Begin
      xMonedaBase := DMTE.cdsDetFPago.FieldByName('TMONID').AsString;
   End
   Else
   Begin
      xMonedaBase := Trim(dblcTMonCab.Text);
   End;
   If xMonedaBase = DMTE.wTMonLoc Then
      If (trim(dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue) =
         trim(dbgDetPago.ColumnByName('DEMTOLOC').FooterValue)) Then
      Begin
      End
      Else
         If (trim(dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue) =
            trim(dbgDetPago.ColumnByName('DEMTOLOC').FooterValue)) Then
         Begin
         End;
End;

Procedure TFIngresoCaja.dbgDetFPagoKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Var
   xPosi: Integer;
Begin
   If (Z2dbgDetPagoIButton.Enabled = True) And (key = VK_DELETE) And (ssCtrl In Shift) Then
   Begin
      If (DMTE.cdsDetFPago.RecordCount = 0) Then
         ShowMessage('No hay registros')
      Else
      Begin
         If MessageDlg('¿Eliminar Registro?', mtconfirmation, [mbYes, mbNo], 0) = mrYes Then
         Begin
            xPosi := DMTE.cdsDetFPago.RecNo;
            DMTE.cdsDetFPago.Delete; // Borro en el original..
            AcumulaDetFPago;
            If DMTE.cdsDetFPago.RecordCount <> 0 Then
            Begin
               DMTE.cdsDetFPago.DisableControls;
               DMTE.cdsDetFPago.First;
               While Not DMTE.cdsDetFPago.Eof Do
               Begin
                  DMTE.cdsDetFPago.Edit;
                  DMTE.cdsDetFPago.FieldByName('CORRE').AsInteger := DMTE.cdsDetFPago.RecNo;
                  DMTE.cdsDetFPago.Post;
                  DMTE.cdsDetFPago.Next;
               End;
               If xposi <= DMTE.cdsDetFPago.RecordCount Then
                  DMTE.cdsDetFPago.recno := xPosi;
               DMTE.cdsDetFPago.EnableControls;
            End;

         End;
      End;
   End;
End;

Procedure TFIngresoCaja.CalculaResto;
Var
   xCampo1, xtc1,
      xCampo2, xtc2: String;

Begin
   If DMTE.cdsDetFPago.State = dsedit Then
   Begin
      If dblcTMonC.Text = DMTE.wTMonLoc Then
      Begin
         xCampo1 := 'DEMTOLOC';
         xCampo2 := 'FC_MTOLOC';
      End
      Else
      Begin
         xCampo1 := 'DEMTOEXT';
         xCampo2 := 'FC_MTOEXT';
      End;
      dbeResta.Text := currtostr(strtocurr(trim(dbgDetPago.ColumnByName(xCampo1).FooterValue)) -
         strtocurr(trim(dbgDetFPago.ColumnByName(xCampo2).FooterValue)) +
         DMTE.cdsdetfpago.FieldByName('FC_RECIBIDO').AsFloat);
   End
   Else
      If DMTE.cdsDetFPago.State = dsInsert Then
      Begin
         If dblcTMonC.Text = DMTE.wTMonLoc Then
         Begin
            xCampo1 := 'DEMTOLOC';
            xCampo2 := 'FC_MTOLOC';
         End
         Else
         Begin
            xCampo1 := 'DEMTOEXT';
            xCampo2 := 'FC_MTOEXT';
         End;
         Try
            xtc1 := dbgDetPago.ColumnByName(xCampo1).FooterValue;
            If trim(xtc1) = '' Then
               xtc1 := '0';
            xtc2 := dbgDetFPago.ColumnByName(xCampo2).FooterValue;
            If trim(xtc2) = '' Then
               xtc2 := '0';

            dbeResta.Text := currtostr(strtocurr(trim(xtc1)) -
               strtocurr(trim(xtc2)));
         Except
            dbeResta.Text := currtostr(strtocurr(trim(xtc1)));
         End;
      End;

End;

Procedure TFIngresoCaja.Redondear;
Var
   nTMtoLoc, nTMtoExt: double;
   nSMtoLoc, nSMtoExt: double;
   bkmReg: TBookmark;
Begin
   bkmReg := DMTE.cdsDetFPago.GetBookmark;
   DMTE.cdsDetFPago.DisableControls;

   nTMtoLoc := strtofloat(dbgDetPago.ColumnByName('DEMTOLOC').FooterValue);
   nTMtoExt := strtofloat(dbgDetPago.ColumnByName('DEMTOEXT').FooterValue);
   nSMtoLoc := 0;
   nSMtoExt := 0;
   Try
      DMTE.cdsDetFPago.First;
      While Not DMTE.cdsDetFPago.EOF Do
      Begin
         nSMtoLoc := nSMtoLoc + DMTE.cdsDetFPago.fieldbyName('FC_MTOLOC').asfloat;
         nSMtoExt := nSMtoExt + DMTE.cdsDetFPago.fieldbyName('FC_MTOEXT').asFloat;
         DMTE.cdsDetFPago.Next;
      End;
      If Not (DMTE.cdsDetFPago.state In [dsEdit, dsInsert]) Then
         DMTE.cdsDetFPago.edit;
      DMTE.cdsDetFPago.fieldbyName('FC_MTOLOC').asfloat := nTMtoLoc - nSMtoLoc + DMTE.cdsDetFPago.fieldbyName('FC_MTOLOC').asfloat;
      DMTE.cdsDetFPago.fieldbyName('FC_MTOEXT').asFloat := nTMtoExt - nSMtoExt + DMTE.cdsDetFPago.fieldbyName('FC_MTOEXT').asFloat;
      cdsPost(DMTE.cdsDetFPago);
   Finally
      DMTE.cdsDetFPago.GotoBookmark(bkmReg);
      DMTE.cdsDetFPago.EnableControls;
      DMTE.cdsDetFPago.FreeBookmark(bkmReg);
   End;
End;

Procedure TFIngresoCaja.Z2bbtnEmiteClick(Sender: TObject);
Var
   cSql: String;
Begin
   If (DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString <> 'C') And
      (DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString <> 'A') Then
   Begin
      Showmessage('El Documento se encuentra en estado INICIAL' + #13 + ' No se puede imprimir');
      Exit;
   End;

  //
   cSql := 'SELECT ''1'' ORDEN, R.CIAID, T.CIADES, B.BANCONOM, P.FPAGODES, J.FC_COBRADO, M.TMONABR, '
      + 'R.TMONID, R.CLIERUC, R.CCFEMIS, R.CCNODOC, R.NCOMTOORI, R.CCGLOSA, '
      + 'R.NCOTCAMB, CAJA301.DENUMREG, R.CCNOMB, R.NCOUSER, R.FLAGVAR, U.USERNOM, '
      + '''V°B° ''||U.USERNOM VISTO, '
      + 'CASE WHEN NCOESTADO=''A'' THEN ''A N U L A D O'' ELSE '''' END ESTADO, '
      + '''<CLIENTE>'' COPIA, ''----------------------------------------------------------------------------------------------------------------------------------------------------------------'' LIMITE '
      + 'FROM CXC303 R, TGE101 T, TGE105 B, CAJA314 J, TGE112 P, TGE103 M, CAJA301, TGE006 U '
      + 'WHERE R.CIAID=''' + trim(dblcCia.Text) + ''' '
      + ' AND R.CCNODOC=''' + trim(dbenodoc.Text) + ''' '
      + ' AND R.CCSERIE=''' + trim(dbeSerie.Text) + ''' '
      + ' AND R.DOCID=''' + trim(dblcTDoc.Text) + ''' '
      + ' AND R.CIAID= T.CIAID '
      + ' AND R.BANCOID = B.BANCOID '
      + ' AND R.CIAID=J.CIAID AND R.CCSERIE=J.CCSERIE AND R.CCNODOC=J.CCNODOC AND R.DOCID=J.DOCID '
      + ' AND J.FPAGOID = P.FPAGOID '
      + ' AND J.TMONID = M.TMONID '
      + ' AND CAJA301.DENUMREG=' + quotedstr(DMTE.cdsRegCxC.fieldBYName('DENUMREG').AsString) + ' '
      + ' AND R.NCOUSER=U.USERID(+) '
      + 'GROUP BY R.CIAID, T.CIADES, B.BANCONOM, P.FPAGODES, J.FC_COBRADO, M.TMONABR, R.TMONID, '
      + 'R.CLIERUC, R.CCFEMIS, R.CCNODOC, R.NCOMTOORI, R.CCGLOSA, R.NCOTCAMB, CAJA301.DENUMREG, '
      + 'R.CCNOMB, R.NCOUSER, R.FLAGVAR, NCOESTADO, U.USERNOM '
      + 'union all '
      + 'SELECT ''2'' ORDEN, R.CIAID, T.CIADES, B.BANCONOM, P.FPAGODES, J.FC_COBRADO, M.TMONABR, '
      + 'R.TMONID, R.CLIERUC, R.CCFEMIS, R.CCNODOC, R.NCOMTOORI, R.CCGLOSA, '
      + 'R.NCOTCAMB, CAJA301.DENUMREG, R.CCNOMB, R.NCOUSER, R.FLAGVAR, U.USERNOM, ''V°B° ''||U.USERNOM VISTO, '
      + 'CASE WHEN NCOESTADO=''A'' THEN ''A N U L A D O'' ELSE '''' END ESTADO, '
      + '''<CAJA>'' COPIA, ''----------------------------------------------------------------------------------------------------------------------------------------------------------------'' LIMITE '
      + 'FROM CXC303 R, TGE101 T, TGE105 B, CAJA314 J, TGE112 P, TGE103 M, CAJA301, TGE006 U '
      + 'WHERE R.CIAID=''' + trim(dblcCia.Text) + ''' '
      + ' AND R.CCNODOC=''' + trim(dbenodoc.Text) + ''' '
      + ' AND R.CCSERIE=''' + trim(dbeSerie.Text) + ''' '
      + ' AND R.DOCID=''' + trim(dblcTDoc.Text) + ''' '
      + ' AND R.CIAID= T.CIAID '
      + ' AND R.BANCOID = B.BANCOID '
      + ' AND R.CIAID=J.CIAID AND R.CCSERIE=J.CCSERIE AND R.CCNODOC=J.CCNODOC AND R.DOCID=J.DOCID '
      + ' AND J.FPAGOID = P.FPAGOID '
      + ' AND J.TMONID = M.TMONID '
      + ' AND CAJA301.DENUMREG=' + quotedstr(DMTE.cdsRegCxC.fieldBYName('DENUMREG').AsString) + ' '
      + ' AND R.NCOUSER=U.USERID(+) '
      + 'GROUP BY R.CIAID, T.CIADES, B.BANCONOM, P.FPAGODES, J.FC_COBRADO, M.TMONABR, R.TMONID, '
      + 'R.CLIERUC, R.CCFEMIS, R.CCNODOC, R.NCOMTOORI, R.CCGLOSA, R.NCOTCAMB, CAJA301.DENUMREG, '
      + 'R.CCNOMB, R.NCOUSER, R.FLAGVAR, NCOESTADO, U.USERNOM '
      + 'union all '
      + 'SELECT ''3'' ORDEN, R.CIAID, T.CIADES, B.BANCONOM, P.FPAGODES, J.FC_COBRADO, M.TMONABR, '
      + 'R.TMONID, R.CLIERUC, R.CCFEMIS, R.CCNODOC, R.NCOMTOORI, R.CCGLOSA, '
      + 'R.NCOTCAMB, CAJA301.DENUMREG, R.CCNOMB, R.NCOUSER, R.FLAGVAR, U.USERNOM, ''V°B° ''||U.USERNOM VISTO, '
      + 'CASE WHEN NCOESTADO=''A'' THEN ''A N U L A D O'' ELSE '''' END ESTADO, '
      + '''<CONTABILIDAD>'' COPIA, ''  '' LIMITE '
      + 'FROM CXC303 R, TGE101 T, TGE105 B, CAJA314 J, TGE112 P, TGE103 M, CAJA301, TGE006 U '
      + 'WHERE R.CIAID=''' + trim(dblcCia.Text) + ''' '
      + ' AND R.CCNODOC=''' + trim(dbenodoc.Text) + ''' '
      + ' AND R.CCSERIE=''' + trim(dbeSerie.Text) + ''' '
      + ' AND R.DOCID=''' + trim(dblcTDoc.Text) + ''' '
      + ' AND R.CIAID= T.CIAID '
      + ' AND R.BANCOID = B.BANCOID '
      + ' AND R.CIAID=J.CIAID AND R.CCSERIE=J.CCSERIE AND R.CCNODOC=J.CCNODOC AND R.DOCID=J.DOCID '
      + ' AND J.FPAGOID = P.FPAGOID '
      + ' AND J.TMONID = M.TMONID '
      + ' AND CAJA301.DENUMREG=' + quotedstr(DMTE.cdsRegCxC.fieldBYName('DENUMREG').AsString) + ' '
      + ' AND R.NCOUSER=U.USERID(+) '
      + 'GROUP BY R.CIAID, T.CIADES, B.BANCONOM, P.FPAGODES, J.FC_COBRADO, M.TMONABR, R.TMONID, '
      + 'R.CLIERUC, R.CCFEMIS, R.CCNODOC, R.NCOMTOORI, R.CCGLOSA, R.NCOTCAMB, CAJA301.DENUMREG, '
      + 'R.CCNOMB, R.NCOUSER, R.FLAGVAR, NCOESTADO, U.USERNOM '
      + 'Order by ORDEN';

   cSql := 'SELECT ''1'' ORDEN, R.CIAID, T.CIADES, B.BANCONOM, P.FPAGODES, J.FC_COBRADO, M.TMONABR, '
      + 'R.TMONID, R.CLIERUC, R.CCFEMIS, R.CCNODOC, R.NCOMTOORI, R.CCGLOSA, M.TMONABR||TRIM(TO_CHAR(R.NCOMTOORI,''999,999.99'')) IMPORTE, '
      + 'R.NCOTCAMB, CAJA301.DENUMREG, R.CCNOMB, R.NCOUSER, R.FLAGVAR, U.USERNOM, ''V°B° ''||U.USERNOM VISTO, '
      + 'CASE WHEN NCOESTADO=''A'' THEN ''A N U L A D O'' ELSE '''' END ESTADO, '
      + '''<CLIENTE>'' COPIA, ''----------------------------------------------------------------------------------------------------------------------------------------------------------------'' LIMITE, '
   // Inicio HPC_201601_CAJA
   // Se limita caracteres del concepto a 32 caracteres
      + 'caja301.cptoid, substr(C.CPTODES,1,32) CPTODES, SUM(CAJA301.CANTIDAD) CANTIDAD, SUM(CAJA301.DEMTOORI) TOTAL, '
   // Fin HPC_201601_CAJA
      + 'round(SUM(CAJA301.DEMTOORI)/SUM(CAJA301.CANTIDAD),2) PREUNI, '
      + 'CASE WHEN R.TMONID=''N'' THEN ''Al T/C M.E. $. ''||trim(to_char(round((R.NCOMTOORI)/R.NCOTCAMB,2),''999,999.99'')) ELSE '''' END IMPDOL '
      + 'FROM CXC303 R, TGE101 T, TGE105 B, CAJA314 J, TGE112 P, TGE103 M, CAJA301, TGE006 U, CAJA201 C '
      + 'WHERE R.CIAID=''' + trim(dblcCia.Text) + ''' '
      + ' AND R.CCNODOC=''' + trim(dbenodoc.Text) + ''' '
      + ' AND R.CCSERIE=''' + trim(dbeSerie.Text) + ''' '
      + ' AND R.DOCID=''' + trim(dblcTDoc.Text) + ''' '
      + ' AND R.CIAID= T.CIAID '
      + ' AND R.BANCOID = B.BANCOID '
      + ' AND R.CIAID=J.CIAID AND R.CCSERIE=J.CCSERIE AND R.CCNODOC=J.CCNODOC AND R.DOCID=J.DOCID '
      + ' AND J.FPAGOID = P.FPAGOID '
      + ' AND J.TMONID = M.TMONID '
      + ' AND CAJA301.DENUMREG=' + quotedstr(DMTE.cdsRegCxC.fieldBYName('DENUMREG').AsString) + ' '
      + ' AND R.NCOUSER=U.USERID(+) '
      + ' AND CAJA301.CPTOID=C.CPTOID(+) '
      + 'GROUP BY R.CIAID, T.CIADES, B.BANCONOM, P.FPAGODES, J.FC_COBRADO, M.TMONABR, R.TMONID, '
      + 'R.CLIERUC, R.CCFEMIS, R.CCNODOC, R.NCOMTOORI, R.CCGLOSA, R.NCOTCAMB, CAJA301.DENUMREG, '
      + 'R.CCNOMB, R.NCOUSER, R.FLAGVAR, NCOESTADO, U.USERNOM, caja301.cptoid, C.CPTODES ';

   DMTE.cdsqry.close;
   DMTE.cdsqry.datarequest(cSql);
   DMTE.cdsqry.open;

   If DMTE.cdsqry.FieldByName('FLAGVAR').AsString = 'S' Then
   Begin
      Showmessage('Recibo ya fue impreso');
      Exit;
   End;

   ppdbRecibo.DataSource := DMTE.dsQry;

   pprRecibo.TEMPLATE.FileName := wRutaRpt + '\Ingreso_2_Copias.Rtm';

   pprRecibo.template.LoadFromFile;

   ppLbDescrip.Caption := dbeGiradoA.text;

   pprRecibo.OnPrintingComplete := ReciboCompleto;

   If cbDiseno.Checked Then
      ppd1.ShowModal
   Else
      pprRecibo.Print;

   pprRecibo.Stop;

   ppdbRecibo.DataSource := Nil;
End;

Procedure TFIngresoCaja.ReciboCompleto;
var
   xSQL : String;
Begin
   If DMTE.cdsIngDocs.FieldByName('FLAGVAR').AsString <> 'S' Then
   Begin
      DMTE.cdsIngDocs.Edit;
      DMTE.cdsIngDocs.FieldByName('FLAGVAR').AsString := 'S';
      DMTE.cdsIngDocs.Post;
   // Inicio HPC_201309_CAJA
   // cambia forma de grabación para que sea en forma directa con sentencia SQL
      {
      cdsPost(DMTE.cdsIngDocs);
      DMTE.AplicaDatos(DMTE.cdsIngDocs, 'INGDOCS');
      }
      If DMTE.cdsIngDocs.ApplyUpdates(0)>0 Then
      Begin
         try
            xSQL := 'update CXC303 '
                   +'   set FLAGVAR='+quotedstr('S')+' '
                   +' Where CIAID =' + QuotedStr(dblcCia.Text)
                   +'   and DOCID =' + QuotedStr(dblcTDoc.Text)
                   +'   and CCSERIE =' + QuotedStr(dbeSerie.Text)
                   +'   and CCNODOC =' + QuotedStr(dbeNoDoc.Text);
            DMTE.DCOM1.AppServer.EjecutaSql(xSQL);
         except
            ShowMessage('Error al intentar Marcar como Impreso');
            xSigueGrab := False;
            exit;
         End;
      End;
   // Fin HPC_201309_CAJA
   End;

   If cbDiseno.Checked Then
   Else
      pprRecibo.PreviewForm.Close;
End;

Procedure TFIngresoCaja.pprReciboBeforePrint(Sender: TObject);
Var
   Year, Month, Day: Word;
   xSQL: String;
   xMoneda, xMes: String;
   xConver: Double;
Begin
   If DMTE.wRptCia = 'Dema' Then
   Begin
      DMTE.cdsTMon.Locate('TMONID', DMTE.cdsqry.FieldByName('TMONID').AsString, []);
      If DMTE.cdsqry.FieldByName('TMONID').AsString = DMTE.wTMonExt Then
// Inicio HPC_201601_CAJA
//    Se cambia valor fijo para descripción de moneda por uso de variable que se carga de tabla de Tipos de Monedas
         xMoneda := DMTE.wTMonExtDes
//         xMoneda := 'Dolares'
      Else
         xMoneda := DMTE.wTMonLocDes;
//         xMoneda := 'Nuevos Soles';

// Fin HPC_201601_CAJA
      xConver := DMTE.cdsQry.FieldByName('NCOMTOORI').AsFloat;
      ppLbDescrip.Caption := 'La cantidad de ' + Trim(NumtoStr(xConver)) + ' ' + xMoneda;
      ppLbDescripC.Caption := 'La cantidad de ' + Trim(NumtoStr(xConver)) + ' ' + xMoneda;
   End
   Else
   Begin
// Inicio HPC_201601_CAJA
//    Se cambia valor fijo para descripción de moneda por uso de variable que se carga de tabla de Tipos de Monedas
      xMoneda := DMTE.wTMonLocDes;
//      xMoneda := 'Nuevos Soles';
// Fin HPC_201601_CAJA
      DMTE.cdsTMon.Locate('TMONID', DMTE.wTMonLoc, []);
      xConver := DMTE.cdsQry.FieldByName('NCOMTOORI').AsFloat * StrToFloat(dbeTCambio.Text);
      If DMTE.cdsqry.FieldByName('TMONID').AsString = DMTE.wTMonExt Then
      Begin
         If DMTE.wRptCia = 'JCP' Then
         Begin
            DMTE.cdsTMon.Locate('TMONID', DMTE.wTMonLoc, []);
            xConver := DMTE.FRound(DMTE.cdsQry.FieldByName('NCOMTOORI').AsFloat * StrToFloat(dbeTCambio.Text), 15, 2);
         End
         Else
         Begin
            DMTE.cdsTMon.Locate('TMONID', DMTE.cdsQry.FieldByName('TMONID').AsString, []);
            xConver := DMTE.cdsQry.FieldByName('NCOMTOORI').AsFloat;
         End;

         ppLbDescrip.AutoSize := False;
         ppLbDescrip.Width := 165;
         ppLbDescrip.Caption := 'La cantidad de ' + Trim(NumtoStr(xConver)) + ' ' + xMoneda;
         ppLbDescrip.WordWrap := True;
         ppLbDescrip.AutoSize := True;
      End
      Else
      Begin
         If DMTE.wRptCia = 'JCP' Then
         Begin
            DMTE.cdsTMon.Locate('TMONID', DMTE.wTMonLoc, []);
            xConver := DMTE.cdsQry.FieldByName('NCOMTOORI').AsFloat;
         End
         Else
         Begin
            DMTE.cdsTMon.Locate('TMONID', DMTE.cdsQry.FieldByName('TMONID').AsString, []);
            xConver := DMTE.FRound(DMTE.cdsQry.FieldByName('NCOMTOORI').AsFloat, 15, 2);
         End;
         ppLbDescrip.Caption := 'La cantidad de ' + Trim(NumtoStr(xConver)) + ' ' + xMoneda;
      End;
   End;
   DecodeDate(DMTE.cdsqry.fieldbyName('CCFEMIS').AsDateTime, Year, Month, Day);

   Case Month Of
      1: xMes := 'Enero';
      2: xMes := 'Febrero';
      3: xMes := 'Marzo';
      4: xMes := 'Abril';
      5: xMes := 'Mayo';
      6: xMes := 'Junio';
      7: xMes := 'Julio';
      8: xMes := 'Agosto';
      9: xMes := 'Setiembre';
      10: xMes := 'Octubre';
      11: xMes := 'Noviembre';
      12: xMes := 'Diciembre';
   End;

   pplbFecha.Caption := 'Lima, ' + inttostr(Day) + ' de ' + xmes + ' del ' + inttostr(Year);
   pplbFecha1.Caption := 'Lima, ' + inttostr(Day) + ' de ' + xmes + ' del ' + inttostr(Year);

   ppnNombre.Caption := 'Hemos recibido de : ' + DMTE.cdsqry.FieldByName('CCNOMB').AsString;
   ppnNombre1.Caption := 'Hemos recibido de : ' + DMTE.cdsqry.FieldByName('CCNOMB').AsString;
End;

Procedure TFIngresoCaja.pprReciboPreviewFormCreate(Sender: TObject);
Begin
   pprRecibo.PreviewForm.ClientHeight := 500;
   pprRecibo.PreviewForm.ClientWidth := 650;
   tppviewer(pprRecibo.PreviewForm.Viewer).zoomSetting := zspageWidth;
End;

Procedure TFIngresoCaja.BuscaNRecibo;
Var
   sSQL: String;
Begin
   If DMTE.cdsTDoc.FieldByName('DOCRECCAJ').AsString = 'S' Then
   Begin
      sSQL := '';
      xLength := 10;
      If DMTE.cdsTDoc.FieldByName('DOCLENGTH').AsInteger > 0 Then
         xLength := DMTE.cdsTDoc.FieldByName('DOCLENGTH').AsInteger;
      If (DMTE.SRV_D = 'DB2400') Then
         sSQL := ' select INT( MAX(CCNODOC) )+1 NUMERO FROM CXC303 ';
      If (DMTE.SRV_D = 'DB2NT') Then
         sSQL := ' select INT( MAX(CCNODOC) )+1 NUMERO FROM CXC303 ';
      If (DMTE.SRV_D = 'ORACLE') Then
         sSQL := ' select MAX(TO_NUMBER(CCNODOC))+1 NUMERO FROM CXC303 ';

      sSQL := sSQL + ' Where CIAID=' + QuotedStr(dblcCia.Text)
         + ' and ECANOMM=''' + DMTE.cdsIngDocs.FieldByName('ECANOMM').AsString + ''''
         + ' AND DOCID=' + QuotedStr(dblcTDoc.Text);
      DMTE.cdsQry2.Close;
      DMTE.cdsQry2.DataRequest(sSQL);
      DMTE.cdsQry2.Open;

      If DMTE.cdsTDoc.FieldByName('DOCLENGTH').AsInteger > 0 Then
         If (DMTE.cdsQry2.FieldByName('NUMERO').IsNull) Or
            (Copy(DMTE.cdsQry2.FieldByName('NUMERO').AsString, 1, 1) <> '2') Then
            dbeNoDoc.Text := DMTE.StrZero('1', 4)
         Else
            dbeNoDoc.Text := DMTE.StrZero(DMTE.cdsQry2.FieldByName('NUMERO').AsString, 4)

      Else
         dbeNoDoc.Text := DMTE.StrZero('1', 4);

      dbeNoDoc.Text := DMTE.cdsIngDocs.FieldByName('ECANOMM').AsString + dbeNoDoc.Text;
   End
   Else
      edNumReg.Text := '';
End;

Procedure TFIngresoCaja.dblcCiaExit(Sender: TObject);
Begin
   xDescrip := 'CIAID=' + quotedstr(dblcCia.Text);
   edtCia.Text := DMTE.DisplayDescrip('prvTGE', 'TGE101', 'CIAABR', xDescrip, 'CIAABR');
   If Length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Compañía No existe!');
      dblcCia.SetFocus;
      Exit;
   End;

   wModifica := True;
End;

Procedure TFIngresoCaja.dblcTMon2Exit(Sender: TObject);
Begin
   xDescrip := 'TMONID=' + '''' + dblcTMon2.Text + '''';
   edtTMon2.Text := DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMONDES', xDescrip, 'TMONDES');
End;

Procedure TFIngresoCaja.dbeNoDocExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If Z2bbtnCancelCab.Focused Then exit;

   If (DMTE.wModo = 'A') And (xInsercion = '') Then
   Begin
      dbeNoDoc.Text := DMTE.StrZero(dbeNoDoc.Text, xLength);
      dbeSerie.Text := 'CAJA';
      xWhere := 'CIAID=''' + dblcCia.Text + ''' ' +
         ' AND DOCID = ''' + dblcTDoc.Text + ''' ' +
         ' AND ' + DMTE.wReplacCeros + '(CCSERIE,'''') = ''' + dbeSerie.Text + ''' ' +
         ' AND CCNODOC = ''' + dbeNoDoc.Text + ''' ';
      If DMTE.DisplayDescrip('prvTGE', 'CXC303', 'COUNT(*) TOTREG', xWhere, 'TOTREG') > '0' Then
      Begin
         ShowMessage('El Número de Documento ya Ha sido Ingresado. Se Cambiara por el Siguiente...');
         BuscaNRecibo;
      End;
   End;
End;

Procedure TFIngresoCaja.NotInList(Sender: TObject; LookupTable: TDataSet;
   NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFIngresoCaja.dbdtpFecVencExit(Sender: TObject);
Begin
   If dbdtpFecVenc.date < dbdtpFecEmi.date Then
   Begin
      showmessage('La Fecha de Vencimiento no puede ser menor a la Fecha de Emisión');
      dbdtpFecVenc.setfocus;
      Exit;
   End;
End;

Procedure TFIngresoCaja.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFIngresoCaja.btnExecClick(Sender: TObject);
Begin
   MtxAsocia := TMant.Create(Self);
   FToolAportes := TFToolAportes.Create(Self);
   Try
      MtxAsocia.User := DMTE.wUsuario;
      MtxAsocia.Admin := DMTE.wAdmin;
      MtxAsocia.Module := DMTE.wModulo;
      MtxAsocia.DComC := DMTE.DCOM1;
      MtxAsocia.OnCreateMant := FRegistro.ToolAsociaCreate;
      MtxAsocia.TableName := 'APO201';
      MtxAsocia.ClientDataSet := DMTE.cdsAsocia;
      MtxAsocia.Filter := '';
      MtxAsocia.Titulo := 'Asociados';
      MtxAsocia.OnInsert := Nil;
      MtxAsocia.OnEdit := FRegistro.OnEditAsoCta;
      MtxAsocia.OnDelete := Nil;
      MtxAsocia.OnShow := Nil;
      MtxAsocia.SectionName := 'Buscaapo';
      MtxAsocia.FileNameIni := '\oaFac.ini';
      MtxAsocia.Execute;
   Finally
   End;
End;

Procedure TFIngresoCaja.dblcdAsoExit(Sender: TObject);
Var
   xZona, xSQL: String;
   xDireccion, xFono, sZona, sZona1: String;
Begin
   If length(Trim(dblcdAso.Text)) > 0 Then
   Begin
      xDescrip := 'ASOID=' + QuotedStr(dblcdAso.Text);
      DMTE.DisplayDescrip('prvTGE', 'APO201', '*', xDescrip, 'ASOID');
      dblcdAso.Text := DMTE.cdsQry.FieldByName('ASOID').AsString;
      dbeGiradoA.Text := Trim(DMTE.cdsQry.FieldByName('ASOAPENOMDNI').AsString);
      edtAuxRuc.text := Trim(DMTE.cdsQry.FieldByName('ASODNI').AsString)
   End
   Else
   Begin
      dbeGiradoA.Text := '';
      edtAuxRuc.text := '';
   End;
End;

Procedure TFIngresoCaja.bbtnActivaRClick(Sender: TObject);
Var
   xSQL: String;
Begin
   xSQL := 'Select * from CAJ_LOG_ING '
      + ' Where CIAID=''' + dblcCia.Text + ''' '
      + '   and FECOPE=''' + DateToStr(dbdtpFEmision.Date) + ''' '
      + '   and USUCAJ=''' + DMTE.cdsIngDocs.FieldByName('NCOUSER').AsString + '''';
   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.FieldByName('ESTADO').AsString = 'C' Then
   Begin
      If MessageDlg('Caja ya Fue Cerrada ¿ Desea Continuar ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then
         Exit;
   End;

   xSQL := 'Select * from CAJ_USU_SUP '
      + ' Where USUCAJ=''' + DMTE.cdsIngDocs.FieldByName('NCOUSER').AsString + ''' '
      + '   and USUSUP=''' + DMTE.wUsuario + '''';
   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.RecordCount <= 0 Then
   Begin
      Showmessage('Supervisor no esta Autorizado a Marcar Recibo para impresión.' + #13 + 'Cajero esta asignado a otro Supervisor');
      Exit;
   End;

   If DMTE.cdsIngDocs.FieldByName('FLAGVAR').AsString <> 'S' Then
   Begin
      Showmessage('Recibo listo para Imprimir');
      Exit;
   End;

   If MessageDlg('¿ Seguro de Eliminar la Marca para volver a imprimir el Recibo ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      DMTE.cdsIngDocs.Edit;
      DMTE.cdsIngDocs.FieldByName('FLAGVAR').AsString := ' ';
      DMTE.cdsIngDocs.Post;
   // Inicio HPC_201309_CAJA
   // cambia forma de grabación para que sea en forma directa con sentencia SQL
      {
      cdsPost(DMTE.cdsIngDocs);
      DMTE.AplicaDatos(DMTE.cdsIngDocs, 'INGDOCS');
      }
      If DMTE.cdsIngDocs.ApplyUpdates(0)>0 Then
      Begin
         try
            xSQL := 'update CXC303 '
                   +'   set FLAGVAR='+quotedstr(' ')
                   +' Where CIAID =' + QuotedStr(dblcCia.Text)
                   +'   and DOCID =' + QuotedStr(dblcTDoc.Text)
                   +'   and CCSERIE =' + QuotedStr(dbeSerie.Text)
                   +'   and CCNODOC =' + QuotedStr(dbeNoDoc.Text);
            DMTE.DCOM1.AppServer.EjecutaSql(xSQL);
         except
            ShowMessage('Error al intentar de liberar Marca de Impresión');
            xSigueGrab := False;
            exit;
         End;
      End;
   // Fin HPC_201309_CAJA

      Z2bbtnEmite.Enabled := True;
      ShowMessage('Ok. Puede Vover a Imprimir Recibo');
   End;
End;

Procedure TFIngresoCaja.dblcClaseEnter(Sender: TObject);
Begin
   strTmp := dblcClase.Text;
End;

Procedure TFIngresoCaja.seCantidadExit(Sender: TObject);
Begin
   If Length(trim(dbePreUni.Text)) <= 0 Then Exit;

   dbeImporte2.Text := FloatToStr(DMTE.FRound(seCantidad.Value * StrToFloat(dbePreUni.Text), 15, 2));
   dbeImporte2Exit(Self);
End;

Procedure TFIngresoCaja.dbePreUniExit(Sender: TObject);
Begin
   If Length(trim(dbePreUni.Text)) <= 0 Then
   Begin
      ShowMessage('Debe Ingresar Precio Unitario');
      Exit;
   End;

   If StrToFloat(dbePreUni.Text) <= 0 Then
   Begin
      ShowMessage('Precio Unitario debe se Mayor a Cero');
      Exit;
   End;

   dbeImporte2.Text := FloatToStr(DMTE.FRound(seCantidad.Value * StrToFloat(dbePreUni.Text), 15, 2));
   dbeImporte2Exit(Self);
End;

//Ejecuta la nueva busqueda de cliente

// Inicio HPC_201802_CAJA
// 26/03/2018 Se cambia Búsqueda del Maestro de Clientes
Procedure TFIngresoCaja.btnbusAuxClick(Sender: TObject);
var
//  i : integer;
   xSQL : String;
Begin
{
   DMMClientes := TDMMClientes.Create(Self);
   FBusCli := TFBusCli.Create(Self);
   DMMClientes.wMod_q_Invoca := 'BAN';
   DMMClientes.DataModuleCreate1;

   FBusCli.AbreTablaAuxiliares;
   Try
      FBusCli.ShowModal;
   Finally
      If Length(Trim(DMMClientes.xwCodCliente)) > 0 Then edtAux.Text := DMMClientes.xwCodCliente;
      If Length((Trim(edtAux.Text))) > 0 Then
         edtAuxExit(Self)
      Else
         btnbusAux.SetFocus;
   End;
}

   dbeGiradoA.Enabled := False;
   edtAux.ReadOnly := True;
   MtxBuscaCli := TMant.Create(Application);
   FToolBuscaCli := TFToolBuscaCli.Create(Application);

   xSQL := 'Select TGE204.* '
      + '     from TGE204 '
      + '    where 1<>1';
//   FIngresoCaja.MtxBuscaCli.FMant.wTabla := 'TGE204';

   Try
      MtxBuscaCli.User := DMTE.wUsuario;
      MtxBuscaCli.Admin := DMTE.wAdmin;
      MtxBuscaCli.Module := DMTE.wModulo;
      MtxBuscaCli.DComC := DMTE.DCOM1;
      MtxBuscaCli.OnCreateMant := FIngresoCaja.ToolBuscaCliCreate;
      MtxBuscaCli.TableName := 'TGE204';
      MtxBuscaCli.ClientDataSet := DMTE.cdsAux;
      MtxBuscaCli.Filter := '';
      MtxBuscaCli.Titulo := 'Maestro de Clientes';
      MtxBuscaCli.OnInsert := Nil;
      MtxBuscaCli.OnEdit := FIngresoCaja.OnEditBuscaCli;
      MtxBuscaCli.OnDelete := Nil;
      MtxBuscaCli.OnShow := Nil;
      MtxBuscaCli.SectionName := 'BuscaCli';
      MtxBuscaCli.FileNameIni := '\oaCaja.ini';
      MtxBuscaCli.UsuarioSQL.Add(xSQL);
      MtxBuscaCli.Execute;
   Finally
   End;
End;
// Fin HPC_201802_CAJA

Procedure TFIngresoCaja.edtAuxExit(Sender: TObject);
Var
   cSQLaux: String;
Begin
   If dblcClase.Focused Then exit;
   If Z2bbtnCancelCab.Focused Then exit;

   cSQLaux := 'Select AUXID, NVL(AUXRUC, NVL(A.AUXDNI, NVL(B.CLIERUC, B.CLIEDNI) ) ) AUXRUC, '
      + '       AUXGIRA, AUXNOMB '
      + '  from CNT201 A, TGE204 B '
      + ' where A.CLAUXID=' + quotedstr(dblcClase.Text)
      + '   and A.AUXID=' + quotedstr(edtAux.text)
      + '   and A.CLAUXID=B.CLAUXID(+) '
      + '   and A.AUXID=B.CLIEID(+) '
      + '   and A.ACTIVO=''S'' '
      + ' order BY A.AUXID';
   DMTE.Filtracds(DMTE.cdsQry, cSQLaux);

   If Trim(DMTE.cdsQry.fieldbyName('AUXID').asString) = '' Then
   Begin
      showmessage('No se encuentra registrado el Auxiliar');
      edtAux.Text := '';
      edtAux.setfocus;
      exit;
   End
   Else
   Begin
      edtAuxRuc.text := DMTE.cdsQry.fieldbyName('AUXRUC').asString;
      If Trim(DMTE.cdsQry.fieldbyName('AUXGIRA').asString) = '' Then
         dbeGiradoA.text := DMTE.cdsQry.fieldbyName('AUXNOMB').asString
      Else
         dbeGiradoA.text := DMTE.cdsQry.fieldbyName('AUXGIRA').asString;
      wModifica := True;

      edtAuxRuc.Enabled := (edtAux.Text = '33333333');
      dbeGiradoA.Enabled := (edtAux.Text = '33333333');
   End;
End;

// Inicio HPC_201309_CAJA

Procedure TFIngresoCaja.GrabaDetallePago;
Var
   xSQL: String;
Begin
   DMTE.cdsDetFPago.First;
   While Not DMTE.cdsDetFPago.EOF Do
   Begin
      xSQL := 'Insert into CAJA314(CORRE, FPAGOID, FPAGODES, BANCOID, TJAID, TMONID, TMONABR, ECNOCHQ, FC_RECIBIDO, '
         + '                    TC_USADO, FC_COBRADO, FC_DEVOLVER, CPTOID, CLAUXID, CLIEID, FC_FVCMTO, FC_FEMIS, '
         + '                    ECANOMM, FC_MTOLOC, FC_MTOEXT) '
         + ' values ('
         + inttostr(DMTE.cdsDetFPago.FieldByName('CORRE').AsInteger) + ', '
         + quotedstr(DMTE.cdsDetFPago.FieldByName('FPAGOID').AsString) + ', '
         + quotedstr(DMTE.cdsDetFPago.FieldByName('FPAGODES').AsString) + ', '
         + quotedstr(DMTE.cdsDetFPago.FieldByName('BANCOID').AsString) + ', '
         + quotedstr(DMTE.cdsDetFPago.FieldByName('TJAID').AsString) + ', '
         + quotedstr(DMTE.cdsDetFPago.FieldByName('TMONID').AsString) + ', '
         + quotedstr(DMTE.cdsDetFPago.FieldByName('TMONABR').AsString) + ', '
         + quotedstr(DMTE.cdsDetFPago.FieldByName('ECNOCHQ').AsString) + ', '
         + quotedstr(DMTE.cdsDetFPago.FieldByName('FC_RECIBIDO').AsString) + ', '
         + quotedstr(DMTE.cdsDetFPago.FieldByName('TC_USADO').AsString) + ', '
         + quotedstr(DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsString) + ', '
         + quotedstr(DMTE.cdsDetFPago.FieldByName('FC_DEVOLVER').AsString) + ', '
         + quotedstr(DMTE.cdsDetFPago.FieldByName('CPTOID').AsString) + ', '
         + quotedstr(DMTE.cdsDetFPago.FieldByName('CLAUXID').AsString) + ', '
         + quotedstr(DMTE.cdsDetFPago.FieldByName('CLIEID').AsString) + ', '
         + quotedstr(datetostr(DMTE.cdsDetFPago.FieldByName('FC_FVCMTO').Asdatetime)) + ', '
         + quotedstr(datetostr(DMTE.cdsDetFPago.FieldByName('FC_FEMIS').Asdatetime)) + ', '
         + quotedstr(DMTE.cdsDetFPago.FieldByName('ECANOMM').AsString) + ', '
         + floattostr(DMTE.cdsDetFPago.FieldByName('FC_MTOLOC').AsFloat) + ', '
         + floattostr(DMTE.cdsDetFPago.FieldByName('FC_MTOEXT').AsFloat) + ') ';
      Try
         DMTE.DCOM1.AppServer.EjecutaSql(xsql);
      Except
         ShowMessage('Error en La Grabación de Detalle de Cancelación');
         xSigueGrab := False;
         exit;
      End;
      DMTE.cdsDetFPago.Next;
   End;
End;
// Fin HPC_201309_CAJA

// Inicio HPC_201802_CAJA
// 26/03/2018 Se cambia Búsqueda del Maestro de Clientes
procedure TFIngresoCaja.ToolBuscaCliCreate(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolBuscaCli.pnlBot;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   TMant(Sender).FMant.pnlBtns.Visible := True;
end;
// Fin HPC_201802_CAJA

// Inicio HPC_201802_CAJA
// 26/03/2018 Se cambia Búsqueda del Maestro de Clientes
procedure TFIngresoCaja.OnEditBuscaCli(Sender: TObject;
  MantFields: TFields);
begin
   If Not DMTE.DCOM1.Connected Then Exit;
   Screen.Cursor := crHourGlass;
   dblcClase.Text := MantFields.FieldByName('CLAUXID').AsString;
   edtAux.Text := MantFields.FieldByName('CLIEID').AsString;
   edtAuxRuc.Text := MantFields.FieldByName('NUMDOCID').AsString;
   dbeGiradoA.Text := MantFields.FieldByName('CLIEDES').AsString;

   TMant(Sender).FMant.Close;
   If length(edtAux.Text)>0 then
      dblcdCnp.SetFocus
   Else
      btnbusAux.SetFocus;

   Screen.Cursor := crDefault;
end;
// Fin HPC_201802_CAJA

End.


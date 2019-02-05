unit Caja232;

// HPC_201601_CAJA 11/01/2016: Se define la variable wTMonLocDes para descripción de la Moneda Local
//                             Se define la variable wTMonExtDes para descripción de la Moneda Extranjera
//                             Se cambia valor fijo para descripción de moneda por uso de variable que se carga de tabla de Tipos de Monedas

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient,CAJADM,
  ComCtrls, ppDB, ppDBPipe, ppCtrls, ppBands, ppPrnabl, ppClass, ppCache,
  ppComm, ppRelatv, ppProd, ppReport, ppEndUsr,ppViewr, Variants, ppTypes,
  oaVariables;

type
  TFReciboCaja = class(TForm)
    pnlCabecera1: TPanel;
    pnlBotones: TPanel;
    Z2bbtnSumat: TBitBtn;
    Z2bbtnImprime: TBitBtn;
    Z2bbtnGraba: TBitBtn;
    Z2bbtnCancel2: TBitBtn;
    Z2bbtnNuevo: TBitBtn;
    Z2bbtnSube: TBitBtn;
    Z2bbtnAnula: TBitBtn;
    Z2bbtnOKCab: TBitBtn;
    Z2bbtnCancelCab: TBitBtn;
    Z2bbtnCont: TBitBtn;
    lblEstadoMov: TLabel;
    lblConcepto: TLabel;
    lblGlosa: TLabel;
    dblcdCnp: TwwDBLookupComboDlg;
    dbeGlosa: TwwDBEdit;
    lblTDoc: TLabel;
    lblNoDoc: TLabel;
    Label9: TLabel;
    lblProvRuc: TLabel;
    lblProvDes: TLabel;
    Label23: TLabel;
    dblcTDoc: TwwDBLookupCombo;
    edtTDoc: TEdit;
    dbeNoDoc: TwwDBEdit;
    dbeSerie: TwwDBEdit;
    edtAuxRuc: TEdit;
    dbeGiradoA: TwwDBEdit;
    dblcdAux: TwwDBLookupComboDlg;
    dblcClase: TwwDBLookupCombo;
    edtClase: TEdit;
    Label1: TLabel;
    lblCuenta: TLabel;
    dblcTMonCab: TwwDBLookupCombo;
    edtCuenta: TEdit;
    edtTMonCab: TEdit;
    dbeTCambio: TwwDBEdit;
    lblTCambio: TLabel;
    Z2bbtnCalc: TBitBtn;
    Z2bbtnCancelado: TBitBtn;
    Label2: TLabel;
    dblcdFEfec: TwwDBLookupComboDlg;
    dbeFEfec: TwwDBEdit;
    pnlDetalle: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pnlPendientes: TPanel;
    Label16: TLabel;
    dbgPendientes: TwwDBGrid;
    pnlDocCanje: TPanel;
    Label17: TLabel;
    dbgDocCanje: TwwDBGrid;
    dbgDetFPago: TwwDBGrid;
    Z2bbtnAdicFPago: TwwIButton;
    Label4: TLabel;
    PnlFPago: TPanel;
    lblFormPago: TLabel;
    lblNoChq: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label18: TLabel;
    Label10: TLabel;
    Label20: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    Z2OkDetalle: TBitBtn;
    BitBtn1: TBitBtn;
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
    dbeTC: TwwDBEdit;
    dbeMPL: TwwDBEdit;
    dbeMPE: TwwDBEdit;
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
    TabSheet3: TTabSheet;
    dbgDetPago: TwwDBGrid;
    Z2dbgDetPagoIButton: TwwIButton;
    pnlActualiza: TPanel;
    Z2bbtnOKDet: TBitBtn;
    Z2bbtnCancelDet: TBitBtn;
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
    edtCnp2: TEdit;
    dblcClaseDet: TwwDBLookupCombo;
    edtClaseDet: TEdit;
    dblcdAuxDet: TwwDBLookupComboDlg;
    dbeAuxDet: TwwDBEdit;
    StaticText2: TStaticText;
    dblcdCnp22: TwwDBLookupComboDlg;
    edNumReg: TEdit;
    ppDesigner1: TppDesigner;
    pnlCabecera: TPanel;
    lblCia: TLabel;
    lblBanco: TLabel;
    lblFComp: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TEdit;
    dbdtpFEmision: TwwDBDateTimePicker;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    dblcCCBco: TwwDBLookupCombo;
    lblCCBco: TLabel;
    lblPeriodo: TLabel;
    edtPeriodo: TEdit;
    lblNoComp: TLabel;
    dbeNoComp: TwwDBEdit;
    z2bbtnOKCab1: TBitBtn;
    Label6: TLabel;
    dblcFormPagoCab: TwwDBLookupCombo;
    edtFormPagoCab: TEdit;
    Label8: TLabel;
    dbeNoChqCab: TwwDBEdit;
    Label11: TLabel;
    dbdtpFEmis: TwwDBDateTimePicker;
    lblNro: TLabel;
    ppHeaderBand2: TppHeaderBand;
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
    pplblCia: TppLabel;
    pplblBanco: TppLabel;
    pplblRecibo: TppLabel;
    procedure Z2bbtnCalcClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure Z2bbtnSumatClick(Sender: TObject);
    procedure Z2bbtnSubeClick(Sender: TObject);
    procedure Z2bbtnNuevoClick(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure Z2bbtnAnulaClick(Sender: TObject);
    procedure Z2bbtnCancelCabClick(Sender: TObject);
    procedure Z2bbtnOKCabClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Z2bbtnImprimeClick(Sender: TObject);
    procedure Z2bbtnContClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeSerieExit2(Sender: TObject);
    procedure dbeTCambioExit2(Sender: TObject);
    procedure dblcBancoExit22(Sender: TObject);
    procedure dblcClaseExit22(Sender: TObject);
    procedure dblcdCnpExit2(Sender: TObject);
    procedure dblcTDocExit2(Sender: TObject);
    procedure dblcTMonCabExit2(Sender: TObject);
    procedure dbdtpFEmisionChange(Sender: TObject);
    procedure Z2bbtnCancel2Click(Sender: TObject);
    procedure dbdtpFEmisionExit(Sender: TObject);
    procedure dbgDocCanjeCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
    procedure dbgDocCanjeCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
    procedure dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
    procedure dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgDocCanjeExit(Sender: TObject);
    procedure Z2bbtnCanceladoClick2(Sender: TObject);
    procedure dblcdFEfecExit(Sender: TObject);
    procedure dbgDetFPagoDblClick(Sender: TObject);
    procedure dbgDetFPagoEnter(Sender: TObject);
    procedure dbgDetFPagoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
    procedure Z2bbtnAdicFPagoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure chkAsignaRestoClick(Sender: TObject);
    procedure dbeACobrarEnter(Sender: TObject);
    procedure dbeACobrarExit(Sender: TObject);
    procedure dbeRecibidoChange(Sender: TObject);
    procedure dbeRecibidoEnter(Sender: TObject);
    procedure dbeRecibidoExit(Sender: TObject);
    procedure dblcBancoFPagoExit(Sender: TObject);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure dblcTarjetaExit(Sender: TObject);
    procedure dblcTMonCExit(Sender: TObject);
    procedure Z2OkDetalleClick(Sender: TObject);
    procedure pnlDetalleChange(Sender: TObject);
    procedure Z2bbtnSumatClick(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dbeNoDocExit(Sender: TObject);
    procedure dbeGiradoAExit(Sender: TObject);
    procedure dbeGlosaExit(Sender: TObject);
    procedure dblcdAuxExit(Sender: TObject);
    procedure dbeTCExit(Sender: TObject);
    procedure dbeMPLExit(Sender: TObject);
    procedure dbeMPEExit(Sender: TObject);
    procedure Z2bbtnEmiteClick(Sender: TObject);
    procedure NotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dbgDetPagoCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure dbgDetPagoDblClick(Sender: TObject);
    procedure dbgDetPagoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Z2dbgDetPagoIButtonClick(Sender: TObject);
    procedure Z2bbtnOKDetClick(Sender: TObject);
    procedure Z2bbtnCancelDetClick(Sender: TObject);
    procedure dblcdCnp22Exit(Sender: TObject);
    procedure dblcClaseDetExit(Sender: TObject);
    procedure dbeDHChange(Sender: TObject);
    procedure dblcdAuxDetExit(Sender: TObject);
    procedure dbeAuxDetChange(Sender: TObject);
    procedure dbeImporte2Exit(Sender: TObject);
    procedure dblcTMon2Exit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dblcCCBcoExit(Sender: TObject);
    procedure dbeNoCompEnter(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);
    procedure z2bbtnOKCab1Click(Sender: TObject);
    procedure dblcFormPagoCabExit(Sender: TObject);
    procedure pprReciboBeforePrint(Sender: TObject);
    procedure pprReciboPreviewFormCreate(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcCCBcoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    { Private declarations }
    xEditaDet : String;
    //** 29/03/2001 - pjsv, para usarse con el DisplayDesrip
    xDescrip : string;
    //**
    cf1: TControlFoco;
    strTmp  : String;
    xMtoLoc: double;
    evt_Exit: TNotifyEvent;
    A1 : Array of Integer ;
    A2 : Array Of TNotifyEvent ;
    A2digitos ,A4digitos : Array of TWinControl ;
    //
    wCptoGan  ,
    wCptoPer  ,
    wCtaGan   ,
    wCtaPer   : String ;
    xTC: Double;
    cdsFiltro: TwwClientDataset;
    xGraboNuevo: Boolean ;
    wFechaCierre: TDatetime;
    wFrecu: Integer;
    cdsTarjeta : TwwClientDataSet ;
    cdsBanco : TwwClientDataSet ;
	 //** 04/06/2001-pjsv, para el nuevo dato (CCBCOVOUCH - TGE106 y CAJA302)
    xVoucher : String;

	 TransDoc: structDocIng ;
    //

    function  ValidaCampo:Boolean;
    Procedure AdicionaRegistro;
    Procedure EditaRegistro;
    procedure IniciaPanel;
    procedure RecalculaReg;
    procedure Contabiliza;
    procedure Contab_IngCaja;
    procedure Contab_RegCxP;
    procedure Contab_DifCambio;
    procedure ActPnlBotones;
    procedure SetMtosCab ;
    procedure IniciaDatos;
    procedure ConfiguraAccesos;
    procedure Proc_Admin;
    procedure Proc_Consul;
    procedure Libera_Admin;
    procedure Libera_Consul;
    procedure LibConfigAccesos;
    procedure ActivaBotones(pnl: TPanel;xFlag : Boolean);
    procedure FocoInicial ;
    procedure GrabaMontoTotal  ;
    procedure ActualizaSaldosCaja;
    procedure RecCptosDifC ;
    procedure ValidaCab ;
    procedure RecuperaDescrip ;
    procedure InHabilitaControles ;
    procedure HabilitaControles ;
    procedure AsignaClaveDetalle ;
    procedure AsignaParametros ;
    procedure cdsCanjeCxCDocBeforePost(DataSet: TDataSet);
    procedure ActualizaDetalle ;
    procedure ActualizaSaldos ;
    procedure ActualizaPagados ;
    procedure RetornaSaldos ;
    procedure ActualizaFiltro ;
    procedure ValidaCancelacion                          ;
    PROCEDURE AcumulaDetFPago                            ;
    procedure CalculaResto ;
    procedure LLenaEdits                                 ;
    procedure Inserta                                    ;
    procedure ValidacionDatos                            ;
    procedure ValidacionTjaChq                           ;
    procedure ValidacionCobradoTotal                     ;
    procedure GrabaDetalle                               ;
    procedure GrabaEstadoFPago(xEstado: string)          ;
    Procedure GrabaClave                                 ;
    procedure BuscaNRecibo;
    procedure InsertaRegistroCxC;
    function ValidacionCabecera: Boolean;
    procedure GrabaCabeceraDeComprobante;
    Procedure CambiaEstado(xName:char);
    procedure ValidaCabecera2;
    procedure CargaDataSource;
  public
    { Public declarations }
    procedure Adiciona ;
    procedure Edita (Doc : structDocIng;cds : Twwclientdataset);
    procedure AsignaCDSFiltro(cds : TwwClientDataset) ;
  end;

var
  FReciboCaja: TFReciboCaja;
  wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,
  wbcancel2: Boolean;
  wModifica: Boolean;
   wBcoTipCta  : string;

implementation
uses CAJAUTIL, oaTE2000, Caja224, Caja290;
function NumtoStr(wNumero:double):string;
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
  result := xTotal+xDecimal;
end;

{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}

procedure TFReciboCaja.IniciaDatos;
begin
   BlanqueaEdits ( pnlCabecera1 ) ;

//   dbgDetPago.KeyOptions:=[dgEnterToTab];
   pnlPendientes.Enabled := False;
   pnlDocCanje.Enabled   := False;
   RecuperarCiaUnica(dblcCia,edtCia);

end;


procedure TFReciboCaja.Z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('calc.exe',1);  //Activa la calculadora del Windows
end;

{*******************************************************
CUARTO PANEL - BOTONES
*******************************************************}

procedure TFReciboCaja.Z2bbtnSubeClick(Sender: TObject);
begin

   pnlDetalle.Enabled    := False ;
   pnlBotones.Enabled    := False ;
   ActivaBotones(pnlBotones , False ) ;
   pnlCabecera1.Enabled  := True ;
   ActivaBotones(pnlCabecera1,True) ;

end;

procedure TFReciboCaja.Z2bbtnNuevoClick(Sender: TObject);
begin
   if DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString ='I' then
   begin
      if wModifica then
      begin
         ShowMessage('Debe grabar o  Cancelar las actualizaciones realizadas');
         exit;
      end;
      if MessageDlg('¿Nuevo Documento?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin
         edNumReg.Text := ''; 
         Adiciona ;
         FormShow(Sender);
         pnlCabecera.SetFocus          ;
         perform(CM_DialogKey,VK_TAB,0) ;
      end;
   end
   else
   begin
      edNumReg.text:='';
      Adiciona ;
      FormShow(Sender);
      pnlCabecera.SetFocus          ;
      perform(CM_DialogKey,VK_TAB,0) ;
   end;
end;

procedure TFReciboCaja.Z2bbtnGrabaClick(Sender: TObject) ;
var
   xSql : String;
begin

   if DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'I' then
   begin
      if MessageDlg('¿Grabar?',mtConfirmation,[mbYes, mbNo], 0) = mrYes then
      begin
         if DMTE.wModo='A' then
           AsignaClaveDetalle;
         {  if DMTE.cdsCanjeCxCDoc.RecordCount = 0 then
            Raise Exception.Create ('Ingrese Mov. a Cobrar') ;
         }
         GrabaMontoTotal;
         ActualizaSaldos;
         DMTE.cdsIngDocs.Edit;
         DMTE.cdsIngDocs.FieldByName('NCOUSER').AsString := DMTE.wUsuario;
         DMTE.cdsIngDocs.FieldByName('NCOFREG').AsString := DateToStr(date);
         DMTE.cdsIngDocs.FieldByName('NCOHREG').AsDateTime := SysUtils.Time;
         DMTE.cdsIngDocs.fieldByName('NCOESTADO').AsString := 'I';
         cdspost(DMTE.cdsIngDocs);
         DMTE.AplicaDatos( DMTE.cdsIngDocs, 'INGDOCS' );

         DMTE.AplicaDatos( DMTE.cdsCanjeCxCDoc, 'CANJECXCDOC' );

         if DMTE.cdsRegCxC.ApplyUpdates(0) > 0 then
   	      ShowMessage('Error en La Grabación de los Documentos no Provisionados');

{         if DMTE.cdsCanjeCxCDoc.ApplyUpdates(0) > 0 then
            Raise Exception.Create ('Error en La Grabación del Detalle')    ;
}
         if DMTE.wModo='A' then
         begin
           InHabilitaControles ;
           AsignaParametros ;
         end ;

         GrabaClave ;
         If xEditaDet = '1' then
         begin
           DMTE.cdsDetFPago.Edit;
           cdsPost(DMTE.cdsDetFPago);
           DMTE.AplicaDatos(DMTE.cdsDetFPago,'DETFPAGO');
         end;


         ShowMessage('Grabacion OK')        ;
         Z2bbtnNuevo.Enabled    := True     ;
         Z2bbtnCancelado.Enabled:= True     ;
         Z2bbtnAnula.Enabled    := True     ;
         Z2bbtnGraba.Enabled    := False    ;
         lblEstadoMov.Caption   := 'Activo' ;
         wModifica:=False                   ;
      end ;
   end
   else begin
      ShowMessage('Imposible Grabar') ;
   end;
end;

procedure TFReciboCaja.Z2bbtnAnulaClick(Sender: TObject);
begin
   if MessageDlg('¿Anular Documento?',mtConfirmation,
                [mbYes, mbNo], 0)=mrYes then
   begin
      DMTE.cdsIngDocs.CancelUpdates ;
      DMTE.cdsCanjeCxCDoc.CancelUpdates  ;
      DMTE.cdsIngDocs.edit ;
      DMTE.cdsIngDocs.fieldbyname('NCOESTADO').AsString := 'A' ;
      if DMTE.cdsIngDocs.ApplyUpdates(0) > 0 then
      begin
         ShowMessage('Error en Ingreso de Documentos') ;
      end ;
      GrabaEstadoFPago('A') ;
      if DMTE.cdsDetFPago.ApplyUpdates(0) > 0 then
      begin
         raise exception.create('Error en detalle de forma de Pago') ;
      end ;
      RetornaSaldos ;

      Z2bbtnNuevo.Enabled     := True      ;
      Z2bbtnSube.Enabled      := False     ;
      Z2bbtnGraba.Enabled     := False     ;
      Z2bbtnCancelado.Enabled := False     ;
      Z2bbtnCancel2.Enabled   := False     ;
      Z2bbtnAnula.Enabled     := False     ;
      Z2bbtnAdicFPago.Enabled := False     ;
      lblEstadoMov.Caption    := 'Anulado' ;
   end
   else
   begin
      ShowMessage('Imposible Anular Documento');
   end;
end;

procedure TFReciboCaja.ActPnlBotones;
begin
   Z2bbtnSumat.Enabled    := wbSumat;
   Z2bbtnNuevo.Enabled    := wbNuevo;
   Z2bbtnImprime.Enabled  := wbImprime;
   Z2bbtnEmite.Enabled    := wbImprime;
   Z2bbtnSube.Enabled     := wbSube;
   Z2bbtnGraba.Enabled    := wbGraba;
   Z2bbtnCancelado.Enabled:= wbCancelado;
   Z2bbtnCancel2.Enabled  := wbCancel2;
   Z2bbtnAnula.Enabled    := wbAnula;
end;

procedure TFReciboCaja.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   PnlFPago.SendToBack;

   if DMTE.cdsIngDocs.Active then
      DMTE.cdsIngDocs.CancelUpdates;

   if DMTE.cdsregcxc.Active then
      DMTE.cdsregcxc.CancelUpdates;


   if (DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString ='X') then
   begin
      DMTE.cdsIngDocs.Delete;
      DMTE.AplicaDatos( DMTE.cdsIngDocs, 'INGDOCS' );
   end;

   DMTE.cdsCCBco.Filtered  := False ;
   DMTE.cdsTDoc.Filtered := False ;
   cf1.QuitarExits(self) ;

   cdsTarjeta.Free;
   cdsBanco.Free;
   
   DMTE.cdsCanjecxcDoc.BeforePost:=nil;
   DMTE.cdsDetFPago.BeforePost   :=nil;
   cf1.Free ;

   FVariables.w_Num_Formas:=FVariables.w_Num_Formas-1;
   Action:=caFree;
end;


procedure TFReciboCaja.Z2bbtnCancelCabClick(Sender: TObject);
VAR
   Doc : structDocIng ;
begin
   //Cancela las Actualizaciones Realizadas
   edNumReg.Text := '';
   DMTE.cdsIngDocs.CancelUpdates ;
   DMTE.cdsCanjeCxcDoc.CancelUpdates  ;
//** 16/12/2000 - pjsv
   if DMTE.wModo<>'A' then
   begin
      with Doc do
      begin
         CIAID    := dblcCia.Text ;
         CCTREC   := 'RC' ;
         DOCID    := dblcTDoc.Text ;
         CCSERIE  := trim( dbeSerie.Text ) ;
         CCNODOC  := trim( dbeNoDoc.Text ) ;
      end ;
      Edita(doc ,cdsfiltro) ;
   end
   else
      Adiciona   ;

   pnlCabecera1.SetFocus ;
   perform(CM_DialogKey,VK_TAB,0) ;
end;

procedure TFReciboCaja.Z2bbtnOKCabClick(Sender: TObject);
var
	xSQL, xWhere, xFiltro : string;
  xFlag : Boolean ;
begin
   ValidaCab ;
   ValidaCabecera2;

   // VALIDA LA CUENTA
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,'',edtCuenta.text)) and (dblcTMonCab.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+edtCuenta.text+' Se registra sólo en Moneda Extranjera.');
   end;

   // VALIDA LA CUENTA DEL CONCEPTO
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,dblcdCnp.text,'')) and (dblcTMonCab.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+DMTE.cdsQry.FieldByName('CUENTAID').AsString+' del Concepto '+dblcdCnp.text+' Se registra sólo en Moneda Extranjera.');
   end;

   if DMTE.wModo='A' then
   begin
   	  if DMTE.cdsIngDocs.fieldbyName('NCOESTADO').AsString='X' then begin

         dbeSerie.Text:='CAJA';
         xWhere:='CIAID='''  + dblcCia.Text  + ''' and '
                +'DOCID='''  + dblcTDoc.Text + ''' and '
                +' '+DMTE.wReplacCeros+'(CCSERIE,'''')='''+ dbeSerie.Text + ''' and '
                +'CCNODOC='''+ dbeNoDoc.Text + ''' ';

         if DMTE.DisplayDescrip('prvTGE','CXC303','COUNT(*) TOTREG',xWhere,'TOTREG') > '0' then begin
            ShowMessage('El Número de Documento ya Ha sido Ingresado. Se Cambiara por el Siguiente...');
            BuscaNRecibo;
         end;

       	 DMTE.cdsIngDocs.Edit;
    		 DMTE.cdsIngDocs.FieldbyName('CIAID').AsString     := dblcCia.Text;
      	 DMTE.cdsIngDocs.FieldbyName('BANCOID').AsString   := dblcBanco.Text;
      	 DMTE.cdsIngDocs.FieldbyName('CCFEMIS').AsDateTime := dbdtpFEmision.Date;
    		 DMTE.cdsIngDocs.FieldbyName('DOCID').AsString     := dblcTDoc.Text;
    		 DMTE.cdsIngDocs.FieldbyName('FPAGOID').AsString   := dblcFormPagoCab.Text;
    		 DMTE.cdsIngDocs.FieldbyName('NCONOCHQ').AsString  := dbeNoChqCab.Text;

    		 DMTE.cdsIngDocs.FieldbyName('ECFEMICH').AsDatetime := dbdtpFEmis.Date;

    		 DMTE.cdsIngDocs.FieldbyName('CCBCOID').AsString   := dblcCCBco.Text;

			 DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString := trim( dbeSerie.Text );

          DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString    := trim( dbeNoDoc.Text );
          DMTE.cdsIngDocs.fieldbyName('NCOESTADO').AsString  := 'I';
          cdspost(DMTE.cdsIngDocs);
          xSQL:='Select * from CXC303 '
              +'Where CIAID='''   +dblcCia.Text  +''' and '
              +      'DOCID='''   +dblcTDOC.Text +''' and '
              +      'CCSERIE='' ' +dbeSerie.Text +''' and '
              +      'CCNODOC=''' +dbeNoDoc.Text +''' ';
         DMTE.cdsIngDocs.DataRequest( xSQL );
         DMTE.AplicaDatos( DMTE.cdsIngDocs, 'INGDOCS' );

         // vhn 22/01/2001
         xSQL:='Select * from CXC304 '
              +'Where CIAID='''    +dblcCia.Text        +''' and '
              +      'CJEDOCID=''' +dblcTDoc.Text       +''' and '
              +      'CJESERIE=''' +trim(dbeSerie.Text) +''' and '
              +      'CJENODOC=''' +trim(dbeNoDoc.text) +''' ';
         DMTE.cdsCanjeCxCDOC.Close;
         DMTE.cdsCanjeCxCDOC.DataRequest( xSQL );
         DMTE.cdsCanjeCxCDOC.Open;

         dblcCia.Enabled   :=False;
         dblcTDoc.Enabled  :=False;
         dbeSerie.Enabled  :=False;
         dbeNoDoc.Enabled  :=False;
         dbdtpFEmision.Enabled:=False;
//         dblcBanco.Enabled :=False;
         edNumReg.Enabled  :=False;
      end;
	 end;

 	 DMTE.cdsIngDocs.Edit;
   if trim(dblcdFEfec.Text) = '' then
      DMTE.cdsIngDocs.fieldbyname('FLUEID').Clear
   else
      DMTE.cdsIngDocs.fieldbyname('FLUEID').AsString := trim(dblcdFEfec.Text)   ;

   DMTE.cdsIngDocs.FieldbyName('CUENTAID').AsString        := edtCuenta.Text       ;
   DMTE.cdsIngDocs.FieldbyName('TMONID').AsString          := dblcTMonCab.Text     ;
   DMTE.cdsIngDocs.FieldbyName('NCOTCAMB').AsString        := dbeTCambio.Text      ;
   DMTE.cdsIngDocs.FieldbyName('CLAUXID').AsString         := dblcClase.Text       ;
   DMTE.cdsIngDocs.FieldbyName('CLIEID').AsString          := dblcdAux.Text        ;
   DMTE.cdsIngDocs.FieldbyName('CLIERUC').AsString         := edtAuxRUC.Text       ;
   DMTE.cdsIngDocs.FieldbyName('CCNOMB').AsString          := dbeGiradoA.Text      ;
   DMTE.cdsIngDocs.FieldbyName('CPTOID').AsString          := dblcdCnp.Text        ;
   DMTE.cdsIngDocs.FieldbyName('CCGLOSA').AsString         := dbeGlosa.Text        ;
   DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString          := 'RC'                 ;
   DMTE.cdsIngDocs.Post                                                         ;

////////////////////************************************************
//   if dbeNoDoc.Enabled then
   if DMTE.cdsIngDocs.fieldbyName('NCOESTADO').AsString='I' then
   begin
     xFlag := False ;
     //Comprobar si hay mov seleccionados con otro proveedor
     if DMTE.cdsCanjeCxCDoc.RecordCount > 0 then
     begin
       DMTE.cdsCanjeCxCDoc.First ;
       if (trim(dblcClase.Text) <> DMTE.cdsCanjeCxCDoc.FieldByName('CLAUXID').AsString )
               or
          (trim(dblcdAux.Text) <> DMTE.cdsCanjeCxCDoc.FieldByName('CLIEID').AsString ) then
       begin
         DMTE.cdsCanjeCxCDoc.CancelUpdates ;
         if DMTE.cdsMovCxC.Active then DMTE.cdsMovCxC.CancelUpdates;
         xFlag := True ;
       end
     end
     else
         xFlag := True ;

     if xFlag then
     begin
       wmodifica:=True;
       xWhere := 'CIAID = ''' +dblcCia.Text  + ''' AND ' +
                  ' CCESTADO =' + '''' + 'P' + ''' AND ' +
                  ' CLAUXID = ''' + dblcClase.Text + '''  AND ' +
                  ' CLIEID = ''' + dblcdAux.Text + '''  ' ;
       xFiltro := ' (( (CCMTOLOC-CCPAGLOC-CCSALLOC)> -0.01 and (CCMTOLOC-CCPAGLOC-CCSALLOC) < 0.01 ) OR '+
                  '   ( CCMTOLOC = CCSALLOC ) )  AND ( CCSALORI > 0 ) '  ;

       DMTE.cdsMovCxC.Close;
       DMTE.cdsMovCxC.Datarequest('SELECT * FROM CXC301 WHERE ' + xWhere ) ;
       DMTE.cdsMovCxC.Open;

       DMTE.cdsMovCxC.Filtered := False;
       DMTE.cdsMovCxC.Filter   := '';
       DMTE.cdsMovCxC.Filter   := xFiltro;
       DMTE.cdsMovCxC.Filtered := True;

       if DMTE.cdsMovCxC.RecordCount=0 then
       begin
         ShowMessage('No hay Documentos Pendientes para Cliente');
         dblcdAux.SetFocus ;
         exit;
       end;
     end ;
   end ;
////////////////////************************************************

   if not DMTE.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClase.Text ]),[]) then
      Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''') ;

   if DMTE.cdsCanjeCxCDOC.RecordCount = 0 then
    begin
        //0707Z2dbgDetPagoIButtonClick(nil) ;
    end
   else
    begin
     //Comprobar si no ha habido un  cambio en el tipo de cambio
     if ( strtocurr(dbeTCambio.Text) <> (DMTE.cdscANJECxCDoc.fieldbyname('CCTCAMCJE').AsFloat) ) then
      ActualizaDetalle ;
   end ;
   z2bbtnSumat.click ;
   pnlCabecera.enabled := False ;   
   pnlCabecera1.enabled := False ;
   //configuracion de botones
   ActivaBotones( pnlCabecera1,false) ;
   pnlDetalle.Enabled := True ;
   pnlBotones.Enabled := True ;
   if wmodifica then
   begin
      Z2bbtnGraba.Enabled := true ;
      Z2bbtnNuevo.Enabled := False ;
   end
   else
   begin
      Z2bbtnNuevo.Enabled     := True ;
      Z2bbtnCancelado.Enabled := True ;
      Z2bbtnAnula.Enabled     := True ;
   end ;
   Z2bbtnSube.Enabled  := True ;
   Z2bbtnCancel2.Enabled := true ;
   pnlPendientes.enabled := True;
   pnlDocCanje.enabled   := True;
end;


procedure TFReciboCaja.RecalculaReg;
var
    xcont   : integer;
begin
    xcont:=0;
    DMTE.cdsregcxc.DisableControls;
    DMTE.cdsregcxc.First ;
    While not DMTE.cdsregcxc.Eof do Begin
       xcont:=xcont+1;
       DMTE.cdsregcxc.Edit;
       DMTE.cdsregcxc.fieldbyname('CPNOREG').AsString:=DMTE.strzero(inttostr(xcont),10);
       DMTE.cdsregcxc.Post;
       DMTE.cdsregcxc.Next;
    end;
    DMTE.cdsregcxc.First ;
    DMTE.cdsregcxc.EnableControls;
end;

procedure TFReciboCaja.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFReciboCaja.FormShow(Sender: TObject);
VAR
   Doc : structDocIng ;
begin
   FocoInicial ;
   if DMTE.wModo='A' then
   begin
      Adiciona;
      dbgDocCanje.ColumnByName('CCMTOLOC').FooterValue:= FloatToStrF(0.00,ffFixed,10,2)  ;
      dbgDocCanje.ColumnByName('CCMTOEXT').FooterValue:= FloatToStrF(0.00,ffFixed,10,2) ;
      dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue:= FloatToStrF(0.00,ffFixed,10,2)  ;
      dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue:= FloatToStrF(0.00,ffFixed,10,2) ;
   end
   else
   begin
      Edita(doc ,cdsfiltro) ;
      dbgDocCanje.ColumnByName('CCMTOLOC').FooterValue:= FloatToStrF(DMTE.cdsingdocs.FieldbyName('NCOMTOLOC').AsFloat,ffFixed,10,2);
      dbgDocCanje.ColumnByName('CCMTOEXT').FooterValue:= FloatToStrF(DMTE.cdsingdocs.FieldbyName('NCOMTOEXT').AsFloat,ffFixed,10,2)   ;
      dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue:= FloatToStrF(DMTE.cdsingdocs.FieldbyName('NCOMTOLOC').AsFloat,ffFixed,10,2)   ;
      dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue:= FloatToStrF(DMTE.cdsingdocs.FieldbyName('NCOMTOEXT').AsFloat,ffFixed,10,2);
   end ;
   cf1.PonerExits ;
   //quitar xdnumreg := edNumReg.Text;

   DMTE.cdsTDoc.Filtered:= False;
   DMTE.cdsTDoc.Filter  := '';
   DMTE.cdsTDoc.Filter  := ' DOCMOD=''CAJA'' AND FCING=''S'' ';
   DMTE.cdsTDoc.Filtered:= True;

   if DMTE.Wmodo = 'A' then
   begin
      if DMTE.cdsTDoc.recordcount = 1 then
      begin
         dblcTDoc.Text   := DMTE.cdsTDoc.fieldbyname('DOCID').AsString;
         edtTDoc.Text    := DMTE.cdsTDoc.fieldbyname('DOCDES').AsString;
         dblcTDoc.Enabled:= false;
      end
      else
      begin
         dblcTDoc.Enabled:=True;
      end;

      DMTE.cdsTMon.First;
      dblcTMonCab.Text := DMTE.cdsTMon.fieldbyname('TMONID').AsString;
      dblcTMonCab.onexit(self);

      if (dblcTDoc.Enabled = false) and (DMTE.wModo = 'A') then
         BuscaNRecibo;

      edNumReg.Refresh;
      if dblcCia.Enabled then
         dblcCia.SetFocus
      else
      begin
         if dblcBanco.Enabled then
            dblcBanco.SetFocus
         else
            dbdtpFEmision.SetFocus;
      end;
   end
   else
   begin

     edtPeriodo.text:=copy(datetostr(dbdtpFEmision.date),7,4)
                +copy(datetostr(dbdtpFEmision.date),4,2);
   end;

   pnlDetalle.ActivePageIndex := 0;
end ;


procedure TFReciboCaja.BuscaNRecibo;
var
  ssql: string;
begin
  if DMTE.cdsTDoc.fieldbyname('DOCRECCAJ').AsString = 'S' then
  begin
    ssql := '';
//    sSQL:=' SELECT INT( MAX(CCNODOC) )+1 NUMERO FROM CXC303 '+
//
    if (DMTE.SRV_D = 'DB2400') then
       sSQL:=' select INT( MAX(CCNODOC) )+1 NUMERO FROM CXC303 ';
    if (DMTE.SRV_D = 'DB2NT') then
       sSQL:=' select INT( MAX(CCNODOC) )+1 NUMERO FROM CXC303 ';
    if (DMTE.SRV_D = 'ORACLE') then
       sSQL:=' select MAX(TO_NUMBER(CCNODOC))+1 NUMERO FROM CXC303 ';

    sSQL:=sSQL+'Where CIAID='+QuotedStr(dblcCia.text)+' AND DOCID='+QuotedStr(dblcTDoc.text);
//
//  'WHERE CIAID='+QuotedStr(dblcCia.text)+' AND DOCID='+QuotedStr(dblcTDoc.text);
    DMTE.cdsQry2.Close;
    DMTE.cdsQry2.DataRequest( sSql );
    DMTE.cdsQry2.open;
    if DMTE.cdsQry2.fieldbyname('NUMERO').IsNull then
      dbeNoDoc.Text :=  DMTE.StrZero('1',DMTE.cdsTDoc.fieldbyname('DOCLENGTH').AsInteger)
    else
      dbeNoDoc.Text :=  DMTE.StrZero(DMTE.cdsQry2.fieldbyname('NUMERO').AsString,DMTE.cdsTDoc.fieldbyname('DOCLENGTH').AsInteger);
  end
  else
    edNumReg.Text :='';
end;


procedure TFReciboCaja.Z2bbtnImprimeClick(Sender: TObject);
var
   Comprobante : RCabComprobante;
begin
  if DMTE.cdsIngDocs.FieldByName('CCCONTA').AsString <> 'S' THEN
  begin
      ShowMessage('Este Movimiento no Está Contabilizado');
      exit;
  end ;

   with Comprobante do
   begin
      CIAID    := dblcCia.Text ;
      CiaDes   := edtCia.Text ;
      Proveedor:= '' ; //edtClie.Text ;
      Glosa    := dbeGlosa.Text ;
      TipoDoc  := edtTDoc.Text ;
      TipoCamb := dbeTCambio.Text ;
      NoDoc    := dbeNoDoc.Text ;
      Cuenta   := '';
      Banco    := edtBanco.text ;
      NumChq   := '' ;
      Importe  := DMTE.cdsIngDocs.Fieldbyname('NCOMTOLOC').AsString;
   end;

   FVoucherImp:=TFVoucherImp.Create(Self);
   FVoucherImp.wComprobanteI:=Comprobante;
   with FVoucherImp do
   Try
      ShowModal;
   Finally
      Free;
   End;
end;

procedure TFReciboCaja.Z2bbtnContClick(Sender: TObject);
begin
  ShowMessage('por Revisar Código de Contabilización') ;
end;

procedure TFReciboCaja.Contabiliza;
var
  xRegAct : TBookMark;
  xSQL : String;
begin
    // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera

    // vhn 23/01/2001
    xSQL:='Select * from CAJA304 Where CIAID='''' and '
         +  'ECANOMM='''' and TDIARID='''' and ECNOCOMP='''' ';
    DMTE.cdsCNTCaja.Close;
    DMTE.cdsCNTCaja.DataRequest( xSQL );
    DMTE.cdsCNTCaja.Open;

//0405
    DMTE.cdsCntCaja.Insert;
    Contab_IngCaja;

    DMTE.cdsregcxc.DisableControls;
    xRegAct := DMTE.cdsregcxc.GetBookmark;
    DMTE.cdsregcxc.First ;

   // GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde el Detalle
    While not DMTE.cdsregcxc.Eof do
    Begin
       DMTE.cdsCntCaja.Insert;
       Contab_RegCxP;
       Contab_DifCambio;
       DMTE.cdsregcxc.Next;
    end;
    DMTE.cdsregcxc.GotoBookmark(xRegAct);
    DMTE.cdsregcxc.FreeBookmark(xRegAct);
    DMTE.cdsregcxc.EnableControls;

    //Actualizamos en la tabla de Contabilidad
    DMTE.cdsCntCaja.ApplyUpdates(0);
//    DMTE.ActualizaData(DMTE.cdsCntCaja);
end;

procedure TFReciboCaja.Contab_IngCaja;
begin
    DMTE.cdsCntCaja.fieldbyname('CIAID').AsString   :=  DMTE.cdsIngDocs.fieldbyName('CIAID').AsString;
    DMTE.cdsCntCaja.fieldbyname('TDIARID').AsString :=  DMTE.cdsIngDocs.fieldbyName('TDIARID').AsString;
    DMTE.cdsCntCaja.fieldbyname('ECANOMM').AsString :=  DMTE.cdsIngDocs.fieldbyName('ECANOMM').AsString;
    DMTE.cdsCntCaja.fieldbyname('ECNOCOMP').AsString:=  DMTE.cdsIngDocs.fieldbyName('ECNOCOMP').AsString;
    DMTE.cdsCntCaja.fieldbyname('DCLOTE').AsString  :=  DMTE.cdsIngDocs.fieldbyname('ECLOTE').AsString;
    DMTE.cdsCntCaja.fieldbyname('DCNODOC').AsString :=  DMTE.cdsIngDocs.fieldbyName('ECNODOC').AsString;
    DMTE.cdsCntCaja.fieldbyname('ECFCOMP').AsDateTime :=  DMTE.cdsIngDocs.fieldbyName('ECFCOMP').AsDateTime;
    DMTE.cdsCntCaja.fieldbyname('CPTOID').AsString  :=  DMTE.cdsIngDocs.fieldbyname('CPTOID').AsString;
    DMTE.cdsCntCaja.fieldbyname('CUENTAID').AsString:= edtCuenta.Text;
    DMTE.cdsCntCaja.fieldbyname('DCDH').AsString    :=  'D';
    DMTE.cdsCntCaja.fieldbyname('DCTCAMPA').AsFloat :=  DMTE.cdsIngDocs.fieldbyName('ECTCAMB').AsFloat;
    DMTE.cdsCntCaja.fieldbyname('TMONID').AsString  :=  DMTE.cdsIngDocs.fieldbyName('TMONID').AsString;
    DMTE.cdsCntCaja.fieldbyname('DCMTOORI').AsFloat:=  DMTE.cdsIngDocs.fieldbyName('ECMTOORI').AsFloat;
    DMTE.cdsCntCaja.fieldbyname('DCMTOLO').AsFloat :=  DMTE.cdsIngDocs.fieldbyName('ECMTOLOC').AsFloat;
    DMTE.cdsCntCaja.fieldbyname('DCMTOEXT').AsFloat:=  DMTE.cdsIngDocs.fieldbyname('ECMTOEXT').AsFloat;
    DMTE.cdsCntCaja.fieldbyname('DCFLACDR').AsString:= 'S';   //Registro ya cuadrado
    DMTE.cdsCntCaja.fieldbyname('DCANO').AsString   := DMTE.cdsIngDocs.fieldbyName('ECANO').AsString;
    DMTE.cdsCntCaja.fieldbyname('DCMM').AsString    := DMTE.cdsIngDocs.fieldbyName('ECMM').AsString;
    DMTE.cdsCntCaja.fieldbyname('DCDD').AsString    := DMTE.cdsIngDocs.fieldbyName('ECDD').AsString;
    DMTE.cdsCntCaja.fieldbyname('DCSS').AsString    := DMTE.cdsIngDocs.fieldbyName('ECSS').AsString;
    DMTE.cdsCntCaja.fieldbyname('DCSEM').AsString   := DMTE.cdsIngDocs.fieldbyName('ECSEM').AsString;
    DMTE.cdsCntCaja.fieldbyname('DCTRI').AsString   := DMTE.cdsIngDocs.fieldbyName('ECTRI').AsString;
    DMTE.cdsCntCaja.fieldbyname('DCAASS').AsString  := DMTE.cdsIngDocs.fieldbyName('ECAASS').AsString;
    DMTE.cdsCntCaja.fieldbyname('DCAASEM').AsString := DMTE.cdsIngDocs.fieldbyName('ECAASEM').AsString;
    DMTE.cdsCntCaja.fieldbyname('DCAATRI').AsString := DMTE.cdsIngDocs.fieldbyname('ECAATRI').AsString;
    DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsIngDocs.fieldBYName('ECGLOSA').AsString ;
    DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsString := dbeTCambio.Text ;
    DMTE.cdsCntCaja.FieldByName('FCAB').AsString := '1' ;
    //**14/12/2000 - pjsv
    DMTE.cdsCntCaja.fieldbyname('DOCMOD').AsString := FRegistro.xModulo;
    //**
end;

procedure TFReciboCaja.Contab_RegCxP;
begin
    DMTE.cdsCntCaja.FieldByName('CIAID').AsString   :=  DMTE.cdsregcxc.FieldByName('CIAID').AsString;
    DMTE.cdsCntCaja.FieldByName('TDIARID').AsString :=  DMTE.cdsregcxc.FieldByName('TDIARID').AsString;
    DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString :=  DMTE.cdsregcxc.FieldByName('ECANOMM').AsString;
    DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString:=  DMTE.cdsregcxc.FieldByName('ECNOCOMP').AsString;
    DMTE.cdsCntCaja.FieldByName('DOCID').AsString   :=  DMTE.cdsregcxc.FieldByName('DOCID2').AsString;
    DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString :=  DMTE.cdsregcxc.FieldByName('CPSERIE').AsString;
    DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString :=  DMTE.cdsregcxc.FieldByName('CPNODOC').AsString;
    DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime :=  DMTE.cdsregcxc.FieldByName('DEFCOMP').AsDateTime;
    DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime :=  DMTE.cdsregcxc.FieldByName('CPFEMIS').AsDateTime;
    DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:=  DMTE.cdsregcxc.FieldByName('CPFVCMTO').AsDateTime;
    DMTE.cdsCntCaja.FieldByName('CPTOID').AsString  :=  DMTE.cdsregcxc.FieldByName('CPTOID').AsString;
    DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString:=  DMTE.cdsregcxc.FieldByName('CUENTAID').AsString;
    DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString :=  DMTE.cdsIngDocs.fieldbyName('CLAUXID').AsString; //Aqui se toma de la cabecera
    DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString :=  DMTE.cdsIngDocs.fieldbyName('PROV').AsString;    //Aqui se toma de la cabecera
    DMTE.cdsCntCaja.FieldByName('CCOSID').AsString  :=  DMTE.cdsregcxc.FieldByName('CCOSID').AsString;
    DMTE.cdsCntCaja.FieldByName('DCDH').AsString    :=  DMTE.cdsregcxc.FieldByName('DEDH').AsString;
    DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:=  DMTE.cdsregcxc.FieldByName('DETCPAG').AsFloat;
    DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:=  DMTE.cdsregcxc.FieldByName('DETCDOC').AsFloat;
    DMTE.cdsCntCaja.FieldByName('TMONID').AsString  :=  DMTE.cdsregcxc.FieldByName('TMONID').AsString;
    DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat:=  DMTE.cdsregcxc.FieldByName('DEMTOORI').AsFloat;
    if DMTE.cdsregcxc.FieldByName('TMONID').AsString = DMTE.wtMonLoc then begin
       DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.cdsregcxc.FieldByName('DEMTOLOC').AsFloat;
       DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat:= DMTE.cdsregcxc.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsregcxc.FieldByName('DETCDOC').AsFloat;
    end
    else begin
       DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat:= DMTE.cdsregcxc.FieldByName('DEMTOEXT').AsFloat;
       DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.cdsregcxc.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsregcxc.FieldByName('DETCDOC').AsFloat;
    end;
    DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString:=  'S';   //Registro ya cuadrado
    DMTE.cdsCntCaja.FieldByName('DCANO').AsString   :=  DMTE.cdsregcxc.FieldByName('DEANO').AsString;
    DMTE.cdsCntCaja.FieldByName('DCMM').AsString    :=  DMTE.cdsregcxc.FieldByName('DEMM').AsString;
    DMTE.cdsCntCaja.FieldByName('DCDD').AsString    :=  DMTE.cdsregcxc.FieldByName('DEDD').AsString;
    DMTE.cdsCntCaja.FieldByName('DCSS').AsString    :=  DMTE.cdsregcxc.FieldByName('DESS').AsString;
    DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   :=  DMTE.cdsregcxc.FieldByName('DESEM').AsString;
    DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   :=  DMTE.cdsregcxc.FieldByName('DETRI').AsString;
    DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  :=  DMTE.cdsregcxc.FieldByName('DEAASS').AsString;
    DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString :=  DMTE.cdsregcxc.FieldByName('DEAASEM').AsString;
    DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString :=  DMTE.cdsregcxc.FieldByName('DEAATRI').AsString;
end;

procedure TFReciboCaja.Contab_DifCambio;
var
    xDif_Camb : double;
    xSql,xSql1 : String;
begin
    // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   //08/05/2001 - pjsv
   // se valida por sugerencia de Jorge y Jose, me confirmaron que por el tipo
  // de moneda de la cabecera, para que no genere <> de cambio cuando es local
   xsql := 'TMONID='+quotedstr(dblcTMonCab.Text);
   xsql1 := 'TMONID='+quotedstr(DMTE.cdsRegCxC.FieldByName('TMONID').AsString);
   If (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') or
      (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then
    begin
      if DMTE.cdsregcxc.FieldByName('DETCDOC').AsFloat <> DMTE.cdsregcxc.FieldByName('DETCPAG').AsFloat then begin

         DMTE.cdsCntCaja.Insert;

         DMTE.cdsCntCaja.FieldByName('CIAID').AsString   :=  DMTE.cdsregcxc.FieldByName('CIAID').AsString;
         DMTE.cdsCntCaja.FieldByName('TDIARID').AsString :=  DMTE.cdsregcxc.FieldByName('TDIARID').AsString;
         DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString :=  DMTE.cdsregcxc.FieldByName('ECANOMM').AsString;
         DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString:=  DMTE.cdsregcxc.FieldByName('ECNOCOMP').AsString;
         DMTE.cdsCntCaja.FieldByName('DOCID').AsString   :=  DMTE.cdsregcxc.FieldByName('DOCID2').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString :=  DMTE.cdsregcxc.FieldByName('CPSERIE').AsString;
         DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString :=  DMTE.cdsregcxc.FieldByName('CPNODOC').AsString;
         DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime :=  DMTE.cdsregcxc.FieldByName('DEFCOMP').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime :=  DMTE.cdsregcxc.FieldByName('CPFEMIS').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:=  DMTE.cdsregcxc.FieldByName('CPFVCMTO').AsDateTime;
         DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString :=  DMTE.cdsIngDocs.fieldbyName('CLAUXID').AsString; //Aqui se toma de la cabecera
         DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString :=  DMTE.cdsIngDocs.fieldbyName('PROV').AsString;    //Aqui se toma de la cabecera
         DMTE.cdsCntCaja.FieldByName('CCOSID').AsString  :=  DMTE.cdsregcxc.FieldByName('CCOSID').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:=  DMTE.cdsregcxc.FieldByName('DETCPAG').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:=  DMTE.cdsregcxc.FieldByName('DETCDOC').AsFloat;
         DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString:=  'S';   //Registro ya cuadrado
         DMTE.cdsCntCaja.FieldByName('DCANO').AsString   :=  DMTE.cdsregcxc.FieldByName('DEANO').AsString;
         DMTE.cdsCntCaja.FieldByName('DCMM').AsString    :=  DMTE.cdsregcxc.FieldByName('DEMM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCDD').AsString    :=  DMTE.cdsregcxc.FieldByName('DEDD').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSS').AsString    :=  DMTE.cdsregcxc.FieldByName('DESS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   :=  DMTE.cdsregcxc.FieldByName('DESEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   :=  DMTE.cdsregcxc.FieldByName('DETRI').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  :=  DMTE.cdsregcxc.FieldByName('DEAASS').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString :=  DMTE.cdsregcxc.FieldByName('DEAASEM').AsString;
         DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString :=  DMTE.cdsregcxc.FieldByName('DEAATRI').AsString;

         if DMTE.cdsregcxc.FieldByName('TMONID').AsString=DMTE.wtMonLoc then begin   //Provision en Mon.Local
               xDif_Camb:= abs(DMTE.cdsregcxc.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsregcxc.FieldByName('DETCDOC').AsFloat -
                               DMTE.cdsregcxc.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsregcxc.FieldByName('DETCPAG').AsFloat);//En Mon.Ext.
               DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xDif_Camb;
               DMTE.cdsCntCaja.FieldByName('TMONID').AsString   :=  DMTE.wtMonExt;

               if DMTE.cdsregcxc.FieldByName('DETCDOC').AsFloat > DMTE.cdsregcxc.FieldByName('DETCPAG').AsFloat then
                  DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'D'
               else
                  DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'H';

         end
         else begin                                            //Provision en Mon.Ext.
               xDif_Camb:= abs(DMTE.cdsregcxc.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsregcxc.FieldByName('DETCDOC').AsFloat -
                               DMTE.cdsregcxc.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsregcxc.FieldByName('DETCPAG').AsFloat);//En Mon.Local
               DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := xDif_Camb;
               DMTE.cdsCntCaja.FieldByName('TMONID').AsString  := DMTE.wtMonLoc;

               if DMTE.cdsregcxc.FieldByName('DETCDOC').AsFloat > DMTE.cdsregcxc.FieldByName('DETCPAG').AsFloat then
                  DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'H'
               else
                  DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'D';
         end;
         if DMTE.cdsCntCaja.FieldByName('DCDH').AsString = 'D' then begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').AsString  :=  wCptoPer;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString:=  wCtaPer;
         end
         else begin
            DMTE.cdsCntCaja.FieldByName('CPTOID').AsString  :=  wCptoGan;
            DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString:=  wCtaGan;
         end;
      end
    end;
end;

procedure TFReciboCaja.Adiciona;
var
   xSQL : String ;
begin
   IniciaDatos ;
   xGraboNuevo := False ;

   pnlCabecera.Enabled  :=True;
   dblcCia.Enabled      :=True;
   dblcTDoc.Enabled     :=True;
   dbeSerie.Enabled     :=True;
   dbeNoDoc.Enabled     :=True;
   dbdtpFEmision.Enabled:=True;
   dblcBanco.Enabled    :=True;
   z2bbtnOKCab1.Enabled :=True;

   pnlDetalle.Enabled   :=False;
   pnlBotones.Enabled   :=False;
   dbgDocCanje.ReadOnly :=False;     // Grid en Solo Lectura

   ActivaBotones ( pnlCabecera1 , True ) ;
   ActivaBotones ( pnlBotones , False )  ;
   HabilitaControles ;
   z2bbtnNuevo.Visible         := True ;
   Z2bbtnAdicFPago.Enabled     := true ;
   dblcTMonCab.Enabled := True ;
   edNumReg.Enabled:=True;

   DMTE.cdsIngDocs.Insert ;
   
   dbeSerie.Text:='CAJA';

   // vhn 23/01/2001
   xSQL:='Select * from CXC304 '
        +'Where CIAID='''' and CJEDOCID='''' and '
        +      'CJESERIE='''' and CJENODOC='''' ';
   DMTE.cdsCanjeCxCDOC.Close;
   DMTE.cdsCanjeCxCDOC.DataRequest( xSQL );
   DMTE.cdsCanjeCxCDOC.Open;

   // vhn 22/01/2001
   xSQL:='Select * from CAJA314 '
        +'Where CIAID='''' and CCTREC='''' and '
        +      'DOCID='''' and CCSERIE='''' and '
        +      'CCNODOC='''' ';
   DMTE.cdsDetFPago.Close;
   DMTE.cdsDetFPago.DataRequest( xSQL );
   DMTE.cdsDetFPago.Open;
   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_RECIBIDO')).displayFormat:= '###,###,###0.00';
   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_RECIBIDO')).EditFormat:= '#########0.00';

   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_MTOEXT')).displayFormat:= '###,###,###0.00';
   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_MTOEXT')).EditFormat:= '#########0.00';

   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_MTOLOC')).displayFormat:= '###,###,###0.00';
   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_MTOLOC')).EditFormat:= '#########0.00';
   // vhn 23/01/2001
   xSQL:='Select * from CAJA301 '
   			+'Where CIAID='''' and CCTREC='''' and DOCID2='''' and '
   			+      'CPSERIE='''' and CPNODOC='''' ';
   DMTE.cdsRegCxC.Close;
   DMTE.cdsRegCxC.DataRequest( xSQL );
   DMTE.cdsRegCxC.Open;

   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOORI')).displayFormat:= '###,###,###0.00';
   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOORI')).EditFormat:= '#########0.00';

   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOEXT')).displayFormat:= '###,###,###0.00';
   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOEXT')).EditFormat:= '#########0.00';

   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOLOC')).displayFormat:= '###,###,###0.00';
   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOLOC')).EditFormat:= '#########0.00';

   DMTE.cdsMovCxC.Close;
   DMTE.cdsMovCxC.DataRequest('Select * from CXC301 Where CIAID='''' ');
   DMTE.cdsMovCxC.Open;

   lblEstadoMov.Caption := 'Nuevo' ;
   dblcClase.Enabled := True ;
   dblcdAux.Enabled  := True ;
   xTC       := 0 ;
   DMTE.RecuperaCierre( wFechacierre , wFrecu ) ;
   if wFechaCierre=0 then
      dbdtpFEmision.date:=dateS
   else begin
      if (tDate(date) > wFechaCierre) and (tdate(date)<=wFechaCierre+wFrecu) then
         dbdtpFEmision.date:=dateS
      else
         dbdtpFEmision.date:=wFechaCierre+1;
   end;

   wModifica :=false ;
end;

procedure TFReciboCaja.Edita(Doc : structDocIng;cds : Twwclientdataset);
var
   xWhere , xFiltro :String ;
   xSQL : String ;
begin
   IniciaDatos ;
   cdsFiltro := cds ;
   InHabilitaControles ;
   Z2bbtnNuevo.Visible  := False ;
   // vhn 22/01/2001
   xSQL:='Select * from CAJA314 '
        +'Where CIAID='''  + DMTE.cdsIngDocs.FieldbyName('CIAID').AsString   +''' and '
        +      'CCTREC=''' + DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString  +''' and '
        +      'DOCID='''  + DMTE.cdsIngDocs.FieldbyName('DOCID').AsString   +''' and '
        +      'CCSERIE='''+ DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString +''' and '
        +      'CCNODOC='''+ DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString +''' ';
   DMTE.cdsDetFPago.Close;
   DMTE.cdsDetFPago.DataRequest( xSQL );
   DMTE.cdsDetFPago.Open;
   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_RECIBIDO')).displayFormat:= '###,###,###0.00';
   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_RECIBIDO')).EditFormat:= '#########0.00';

   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_MTOEXT')).displayFormat:= '###,###,###0.00';
   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_MTOEXT')).EditFormat:= '#########0.00';

   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_MTOLOC')).displayFormat:= '###,###,###0.00';
   TNumericField(DMTE.cdsDetFPago.FieldbyName('FC_MTOLOC')).EditFormat:= '#########0.00';

//**
   DMTE.cdsMovCxC.Close;
   DMTE.cdsMovCxC.DataRequest('Select * from CXC301 Where CIAID='''' ');
   DMTE.cdsMovCxC.Open;

   // vhn 23/01/2001
   xSQL:='Select * from CAJA301 '
        +'Where CIAID='''  + DMTE.cdsIngDocs.FieldbyName('CIAID').AsString   +''' and '
        +      'CCTREC=''' + DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString  +''' and '
        +      'DOCID2=''' + DMTE.cdsIngDocs.FieldbyName('DOCID').AsString   +''' and '
        +      'CPSERIE='''+ DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString +''' and '
        +      'CPNODOC='''+ DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString +''' ';
   DMTE.cdsRegCxC.Close;
   DMTE.cdsRegCxC.DataRequest( xSQL );
   DMTE.cdsRegCxC.Open;
   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOORI')).displayFormat:= '###,###,###0.00';
   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOORI')).EditFormat:= '#########0.00';

   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOEXT')).displayFormat:= '###,###,###0.00';
   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOEXT')).EditFormat:= '#########0.00';

   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOLOC')).displayFormat:= '###,###,###0.00';
   TNumericField(DMTE.cdsRegCxC.FieldbyName('DEMTOLOC')).EditFormat:= '#########0.00';

   dblcCia.Text        :=DMTE.cdsIngDocs.FieldbyName('CIAID').AsString ;
   dblcTDoc.Text       :=DMTE.cdsIngDocs.FieldbyName('DOCID').AsString ;
   dbeSerie.Text       :=DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString ;
   dbeNoDoc.Text       :=DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString ;
   dbdtpFEmision.Date  :=DMTE.cdsIngDocs.FieldbyName('CCFEMIS').AsDateTime ;
   dblcBanco.Text      :=DMTE.cdsIngDocs.FieldbyName('BANCOID').AsString ;

   dblcCCBco.text      :=DMTE.cdsIngDocs.FieldbyName('CCBCOID').AsString ;
   dbeNoComp.Text      :=DMTE.cdsIngDocs.FieldbyName('ECNOCOMP').AsString ;
   dblcTDiario.text    :=DMTE.cdsIngDocs.FieldbyName('TDIARID').AsString ;
   dbdtpFEmis.Date     :=DMTE.cdsIngDocs.FieldbyName('ECFEMICH').AsDateTime;
   dbeNoChqCab.Text    :=DMTE.cdsIngDocs.FieldbyName('NCONOCHQ').AsString ;
   dblcFormPagoCab.Text:=DMTE.cdsIngDocs.FieldbyName('FPAGOID').AsString ;

   edtCuenta.Text      :=DMTE.cdsIngDocs.FieldbyName('CUENTAID').AsString;
   dblcTMonCab.Text    :=DMTE.cdsIngDocs.FieldbyName('TMONID').AsString;
   dbeTCambio.Text     :=CajaDEc( DMTE.cdsIngDocs.FieldbyName('NCOTCAMB').AsString , 4 ) ;
   xTC                 :=DMTE.cdsIngDocs.FieldbyName('NCOTCAMB').AsFloat ;
   dblcClase.Text      :=DMTE.cdsIngDocs.FieldbyName('CLAUXID').AsString;
   dblcdAux.Text       :=DMTE.cdsIngDocs.FieldbyName('CLIEID').AsString;
   edtAuxRUC.Text      :=DMTE.cdsIngDocs.FieldbyName('CLIERUC').AsString;
   dbeGiradoA.Text     :=DMTE.cdsIngDocs.FieldbyName('CCNOMB').AsString;
   dblcdCnp.Text       :=DMTE.cdsIngDocs.FieldbyName('CPTOID').AsString;
   dbeGlosa.Text       :=DMTE.cdsIngDocs.FieldbyName('CCGLOSA').AsString;
   dblcdFEfec.Text     :=DMTE.cdsIngDocs.FieldbyName('FLUEID').Asstring ;

   RecuperaDescrip ;

   edtFormPagoCab.text:= DMTE.DisplayDescripLocal(DMTE.cdsFormPago,'FPAGOID',dblcFormPagoCab.Text,'FPAGODES') ;

   edNumReg.text :=  DMTE.cdsRegCxC.fieldbyname('DENUMREG').AsString;
   // vhn 22/01/2001
   xSQL:='Select * from CXC304 '
        +'Where CIAID='''    +dblcCia.Text        +''' and '
        +      'CJEDOCID=''' +dblcTDoc.Text       +''' and '
        +      'CJESERIE=''' +trim(dbeSerie.Text) +''' and '
        +      'CJENODOC=''' +trim(dbeNoDoc.text) +''' ';
   DMTE.cdsCanjeCxCDOC.Close;
   DMTE.cdsCanjeCxCDOC.DataRequest( xSQL );
   DMTE.cdsCanjeCxCDOC.Open;

   DMTE.cdsCanjeCxCDoc.Edit;

   dblcCia.Enabled   :=False;
   dblcTDoc.Enabled  :=False;
   dbeSerie.Enabled  :=False;
   dbeNoDoc.Enabled  :=False;
   dbdtpFEmision.Enabled:=False;
//   dblcBanco.Enabled :=False;
   edNumReg.Enabled  :=False;

   case DMTE.cdsIngDocs.fieldbyname('NCOESTADO').AsString[1] of
     'I':
         begin
            Z2bbtnAdicFPago.Enabled     := true ;
            pnlCabecera1.Enabled        := True  ;

            pnlDetalle.Enabled          := False ;
            pnlBotones.Enabled          := False ;
            dbgDocCanje.ReadOnly        := False ;     // Grid en Solo Lectura
            ActivaBotones( pnlBotones , False )  ;
            ActivaBotones(pnlCabecera1 , True )  ;
            lblEstadoMov.Caption := 'Activo'     ;
/////
//RECUPERA MOV DE CUENTAS POR COBRAR

            xWhere :=  ' CIAID = ''' +dblcCia.Text  + ''' AND ' +
                       ' CCESTADO = ' + '''' + 'P' + ''' AND ' +
                       ' CLAUXID = ''' + dblcClase.Text + '''  AND ' +
                       ' CLIEID = ''' + dblcdAux.Text + '''  ' ;

            xFiltro := ' (( (CCMTOORI-CCPAGORI-CCSALORI)> -0.01 and (CCMTOORI-CCPAGORI-CCSALORI) < 0.01 ) OR '+
                       '   ( CCMTOORI = CCSALORI ) )  AND ( CCSALORI > 0 ) '  ;

            DMTE.cdsMovCxC.active := False ;
            DMTE.cdsMovCxC.DataRequest( 'SELECT * FROM CXC301 WHERE ' + xWhere ) ;
            DMTE.cdsMovCxC.Active := True ;

            DMTE.cdsMovCxC.Filter:= xFiltro ;
            DMTE.cdsMovCxC.Filtered:=True;
/////
         end ;
     'A','C':
         begin
            Z2bbtnAdicFPago.Enabled     := False ;
            pnlCabecera1.Enabled := False ;
            pnlDetalle.Enabled := True ;
            pnlPendientes.Enabled:= False;
            pnlDocCanje.Enabled  := True;
            dbgDocCanje.ReadOnly := True;     // Grid en Solo Lectura

            ActivaBotones( pnlCabecera1 , False ) ;
            ActivaBotones( pnlBotones , False ) ;
            if DMTE.cdsIngDocs.fieldbyname('NCOESTADO').AsString[1] = 'C' then
            begin
               lblEstadoMov.Caption  := 'Cancelado' ;
               Z2bbtnCont.Enabled    := True;
               Z2bbtnImprime.Enabled := True;
               Z2bbtnEmite.Enabled   := True;

               Z2bbtnCancel2.Enabled := True;
            end
            else
            begin
               lblEstadoMov.Caption := 'Anulado' ;
            end ;
         end ;
   end;
   //deshabilitación
   dblcClase.Enabled := false ;
   dblcdAux.Enabled  := False ;
   wModifica := False ;
end;

procedure TFReciboCaja.FormCreate(Sender: TObject);
begin


//   RecuperarCiaUnica(dblcCia,edtCia);
   SetLength(A4digitos,1) ;
   A4digitos[0] := dbeTCambio ;
   cf1 := TControlFoco.Create ;
   DMTE.cdsFEfec.Filter     := 'FLUEFE_IS = ''I'' ' ;
   DMTE.cdsFEfec.Filtered := True ;
//
   cdsTarjeta := TwwClientDataset.Create( Application );
   cdsTarjeta.Name := 'cdsTarjeta' ;
   cdsTarjeta.RemoteServer := DMTE.DCOM1 ;
   cdsTarjeta.providerName := DMTE.cdsQry2.ProviderName ;
   cdsTarjeta.DataRequest('SELECT * FROM TGE167 ORDER BY TJAID') ;
   cdsTarjeta.Active := True ;
   dblcTarjeta.LookupTable := cdsTarjeta ;

   cdsBanco := TwwClientDataset.Create( Application );
   cdsBanco.Name := 'cdsBanco' ;
   cdsBanco.RemoteServer := DMTE.DCOM1 ;
   cdsBanco.providerName := DMTE.cdsQry2.ProviderName ;
   cdsBanco.DataRequest('SELECT * FROM TGE105 WHERE BCOTIPCTA <> ''C'' ORDER BY BANCOID ') ;
   cdsBanco.Active := True ;
   dblcBancoFPago.LookupTable := cdsBanco ;
//
   CargaDataSource;

   if DMTE.wModo='A' then
   begin
    	Adiciona;
   end
   else
   begin
      // vhnxx 22/12/2003
   	  Edita( TransDoc , FRegistro.xFiltroRecCaja.FMant.cds2 ) ;
   end;

end;

procedure TFReciboCaja.CargaDataSource;
begin
   dblcCia.LookupTable       :=DMTE.cdsCia;
   dblcbanco.LookupTable     :=DMTE.cdsBancoEgr;
   dblcCCBco.LookupTable     :=DMTE.cdsCCBco;
   dblcFormPagoCab.LookupTable:=DMTE.cdsFormPago;
   dblcTDoc.LookupTable      :=DMTE.cdsTDoc;
   dblcClase.LookupTable     :=DMTE.cdsClaseAux;
   dblcdAux.LookupTable      :=DMTE.cdsAux;
   dblcTMonCab.LookupTable   :=DMTE.cdsTMon;
   dblcdCnp.LookupTable      :=DMTE.cdsCnpEgr;
   dblcdFEfec.LookupTable    :=DMTE.cdsFEfec;


   dblcFormPago.LookupTable  :=DMTE.cdsFormPago;
   dblcBancoFPago.LookupTable:=DMTE.cdsBancoEgr;
   dblcTMonC.LookupTable     :=DMTE.cdsTMon;

   dbeNoreg.DataSource       :=DMTE.dsRegCxC;
   dblcdCnp22.DataSource     :=DMTE.dsRegCxC;
   dblcdCnp22.LookupTable    :=DMTE.cdsCnpEgr;
   edtCuenta2.DataSource     :=DMTE.dsRegCxC;
   dblcClaseDet.DataSource   :=DMTE.dsRegCxC;
   dblcClaseDet.LookupTable  :=DMTE.cdsClaseAux;
   dbeDH.DataSource          :=DMTE.dsRegCxC;
   dblcdAuxDet.DataSource    :=DMTE.dsRegCxC;
   dblcdAuxDet.LookupTable   :=DMTE.cdsAux;
   dbeImporte2.DataSource    :=DMTE.dsRegCxC;
   dblcdCCosto.DataSource    :=DMTE.dsRegCxC;
   dblcdCCosto.LookupTable   :=DMTE.cdsCCosto;
   edtMtoLoc.DataSource      :=DMTE.dsRegCxC;
   edtMtoExt.DataSource      :=DMTE.dsRegCxC;
   dblcTMon2.DataSource      :=DMTE.dsRegCxC;
   dblcTMon2.LookupTable     :=DMTE.cdsTMon;
   dbeTCamPr.DataSource      :=DMTE.dsRegCxC;

   dbgPendientes.DataSource  :=DMTE.dsMovCxC;
   dbgDocCanje.DataSource    :=DMTE.dsCanjeCxCDoc;
   dbgdetPago.DataSource     :=DMTE.dsRegCxC;
   dbgDetFPago.DataSource    :=DMTE.dsDetFPago;

end;

procedure TFReciboCaja.ConfiguraAccesos;
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

procedure TFReciboCaja.Libera_Admin;
begin
    Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFReciboCaja.Libera_Consul;
begin

end;

procedure TFReciboCaja.Proc_Admin;
var
   Contador : Integer ;
begin
    pnlCabecera1.Enabled := False ;
    pnlDeTalle.Enabled := False ;
    //Array de controles y eventos
    Contador := BotonesEnPanel( pnlBotones ) ;
    setlength( A1 , Contador) ;
    setlength( A2 , Contador) ;
    Quita(A1,A2,pnlBotones) ;
    //
    pnlBotones.Enabled := True ;
end;

procedure TFReciboCaja.Proc_Consul;
begin
    pnlCabecera1.Enabled := False ;
    pnlDeTalle.Enabled := True ;
    pnlBotones.Enabled := False ;
end;

procedure TFReciboCaja.LibConfigAccesos;
begin
    if DMTE.wAdmin = 'G' then
       Libera_Admin
    else
    begin
       if DMTE.wModo = 'C' then
          Libera_Consul ;
    end ;
end;

procedure TFReciboCaja.ActivaBotones(pnl: TPanel;xFlag : Boolean);
var
 i : Integer ;
begin
   for i := 0 to pnl.ControlCount-1 do
   begin
     if pnl.controls[i] is tbitbtn then
        TBitBtn(pnl.controls[i]).enabled := xFlag ;
   end;
end;

procedure TFReciboCaja.SetMtosCab;
begin
//DEEstado
   with DMTE do
   begin
      cdsregcxc.First ;
      while not cdsregcxc.Eof do
      begin
           if cdsregcxc.FieldBYname('DEESTADO').AsString <> 'A' then
           begin
               if cdsregcxc.FieldBYname('DEESTADO').AsString <> 'C' then
               begin
                  //////
                  ActualizaSaldosCaja ;
                  //////
               end ;
               cdsregcxc.Edit;
               cdsRegCxC.FieldByName('DEEstado').AsString := 'C';
               cdsregcxc.Post;
           end ;
           DMTE.cdsregcxc.Next ;
      end;
      cdsregcxc.ApplyUpdates(0) ;
      cdsregcxc.Refresh ;
      cdsregcxc.First ;
   end ;
end;

procedure TFReciboCaja.FocoInicial;
begin
     if pnlCabecera.Enabled then
        pnlCabecera.SetFocus
     else if pnlCabecera1.Enabled then
             pnlCabecera1.SetFocus
                else if pnlDetalle.Enabled then
                        pnlDeTalle.setfocus
                     else if pnlBotones.enabled then
                             pnlBotones.SetFocus
                          else
                             self.SetFocus ;

     perform(CM_DialogKey,VK_TAB,0);

end;

procedure TFReciboCaja.GrabaMontoTotal;
begin
  DMTE.cdsIngDocs.Edit;
  DMTE.cdsIngDocs.fieldbyName('NCOMTOLOC').AsFloat := OperClientDataSet(DMTE.cdsCanjeCxCDoc,'SUM(CCMTOLOC)','') ;
  DMTE.cdsIngDocs.fieldbyName('NCOMTOEXT').AsFloat := OperClientDataSet(DMTE.cdsCanjeCxCDoc,'SUM(CCMTOEXT)','') ;
  if DMTE.cdsRegCxC.RecordCount>0 then
  begin
    DMTE.cdsIngDocs.fieldbyName('NCOMTOLOC').AsFloat := DMTE.cdsIngDocs.fieldbyName('NCOMTOLOC').AsFloat+OperClientDataSet(DMTE.cdsRegCxC,'SUM(DEMTOLOC)','') ;
    DMTE.cdsIngDocs.fieldbyName('NCOMTOEXT').AsFloat := DMTE.cdsIngDocs.fieldbyName('NCOMTOEXT').AsFloat+OperClientDataSet(DMTE.cdsRegCxC,'SUM(DEMTOEXT)','') ;
  end;

  if dblcTMonCab.Text = DMTE.wTMonLoc then
     DMTE.cdsIngDocs.fieldbyName('NCOMTOORI').AsFloat := DMTE.cdsIngDocs.fieldbyName('NCOMTOLOC').AsFloat
  else
     DMTE.cdsIngDocs.fieldbyName('NCOMTOORI').AsFloat := DMTE.cdsIngDocs.fieldbyName('NCOMTOEXT').AsFloat ;
end;

procedure TFReciboCaja.ActualizaSaldosCaja;
//var   Campo : String ;
begin
{1307
    if trim(dblcCCBco.TEXT) <> '' then
    begin
      if DMTE.wTMonLoc = DMTE.cdsIngDocs.FieldByName('TMONID').AsString then
         Campo := 'ECMTOLOC'
      else
         Campo := 'ECMTOEXT'  ;
    end ;
}
end;


procedure TFReciboCaja.RecCptosDifC;
begin
    begin
       if not DMTE.RecuperarDatos('TGE105','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP','BANCOID=''' + dblcBanco.Text + '''' )  then
          Raise exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio') ;
    end ;
    wCptoGan  := DMTE.cdsRec.fieldbyname('CPTODIFG').AsString ;
    wCptoPer  := DMTE.cdsRec.fieldbyname('CPTODIFP').AsString ;
    wCtaGan   := DMTE.cdsRec.fieldbyname('CTADIFG').AsString ;
    wCtaPer   := DMTE.cdsRec.fieldbyname('CTADIFP').AsString ;
end;

procedure TFReciboCaja.dbeSerieExit2(Sender: TObject);
begin
   wModifica := True ;
end;

procedure TFReciboCaja.dbeTCambioExit2(Sender: TObject);
   procedure Mensaje;
   begin
       TCustomEdit(Sender).SetFocus;
       ShowMessage('Ingrese Tipo de Cambio');
       Exit;
   end;
begin
    if trim(dbeTCambio.Text) = '' then
     Mensaje
    else
     if strtocurr(dbeTCambio.Text) = 0 then
      Mensaje
     else
      if strTmp <> dbetcambio.Text then
       begin
        dbeTCambio.Text := CajaDec( dbeTCambio.Text ,4 );
        wModifica := True;
       end;
end;
//**

procedure TFReciboCaja.dblcBancoExit22(Sender: TObject);
begin
	if dblcCia.Focused         then Exit;
	if Z2bbtnCancelCab.Focused then Exit;
   xDescrip := 'BANCOID='+quotedstr(dblcBanco.text);
   edtBanco.text := DMTE.DisplayDescrip('prvTGE','TGE105','BANCONOM,CUENTAID,CPTOID',xDescrip,'BANCONOM');
   if edtBanco.text = '' then
   begin
      Showmessage('Falta registrar la Caja');
      dblcBanco.SetFocus;
      exit;
   end;
   edtCuenta.Text:=DMTE.cdsQry.FieldByName('CUENTAID').AsString;
   dblcdCnp.Text :=DMTE.cdsQry.FieldByName('CPTOID').AsString;
   xDescrip     := 'CPTOID='+quotedstr(dblcdCnp.text);
   dbeGlosa.text:= DMTE.DisplayDescrip('prvTGE','CAJA201','CPTODES',xDescrip,'CPTODES');
end;

procedure TFReciboCaja.dblcClaseExit22(Sender: TObject);
var   xSQLx: String;
begin
    xDescrip := 'CLAUXID='+quotedstr(dblcClase.text);
    edtClase.text := DMTE.DisplayDescrip('prvTGE','TGE102','CLAUXDES',xDescrip,'CLAUXDES');
    DMTE.xxExit(dblcClase,edtClase,[],'Clase del Auxiliar','A');
    if trim(edtclase.Text) = '' then Exit;
    if (dblcClase.Text <> '') then
    begin
       dblcdAux.Text := '';
       edtAuxRUC.Text := '';
       dbeGiradoA.Text := '';
    end;
    dblcdAux.Enabled := True;
    wModifica := TRUE;
    xSQLx:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+'''';
    DMTE.cdsAux.Close;
    DMTE.cdsAux.DataRequest( xSQLx ) ;
    DMTE.cdsAux.Open;
end;

procedure TFReciboCaja.dblcdCnpExit2(Sender: TObject);
begin
  xDescrip := 'CPTOID='+quotedstr(dblcdCnp.text);
  If (DMTE.DisplayDescrip('prvTGE','CAJA201','CPTODES',xDescrip,'CPTODES') = '') then
   begin
    showmessage('No se encuentra registrado el concepto');
    dblcdCnp.Text := ''; dblcdCnp.setfocus;
   end
  else
   begin
    dbeGlosa.text := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTODES',xDescrip,'CPTODES');
    wModifica:=True;
   end;
end;

procedure TFReciboCaja.dblcTDocExit2(Sender: TObject);
var sTemp: string;
begin
	 if dbdtpFEmision.Focused   then Exit;
	 if Z2bbtnCancelCab.Focused then Exit;
   
   xDescrip := 'DOCID='+quotedstr(dblcTDoc.text);
   sTemp := DMTE.DisplayDescrip('prvTGE','TGE110','DOCDES',xDescrip,'DOCDES');
   If sTemp = ''  then
   begin
      showmessage('Falta Tipo de Documento');
      dblcTDoc.SetFocus;
   end
   else
    BuscaNRecibo;
   edtTDoc.text := sTemp;
   wModifica := True;
end;

procedure TFReciboCaja.dblcTMonCabExit2(Sender: TObject);
begin
  wModifica:=True;
  xDescrip := 'TMONID='+quotedstr(dblcTMonCab.text);
  edtTMonCab.text := DMTE.DisplayDescrip('prvTGE','TGE103','TMONABR',xDescrip,'TMONABR');

  DMTE.xxExit(dblcTMonCab , edtTMonCab , [ Z2bbtnCancelCab ] ,'Moneda')
end;

procedure TFReciboCaja.ValidaCab;
var
   xWhere : String ;
begin

    ValidaEdit(dblcCia ,'Ingrese Compañía') ;
    ValidaEdit(dblcBanco ,'Ingrese Caja') ;
    ValidaEdit(dbdtpFEmision ,'Ingrese Fecha de Emisión') ;
    {
    if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, '', dbdtpFEmision.Date ) then begin
       dbdtpFEmision.SetFocus;
       Raise exception.Create( 'Mes de Fecha Fue Cerrado. Verificar...' );
    end;
    }
    If wBcoTipCta='B' Then //Busca en el CAJA402
    begin
      if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, dblcCCBco.Text, dbdtpFEmision.Date ) then
      begin
         ShowMessage( 'Mes de Fecha Fue Cerrado. Verificar...' );
         Exit;
      end;
    end
    else //Busca en el CAJA310
    begin
      if not DiaAperturado(dblcCia.Text, dbdtpFEmision.Date, dblcBanco.Text) then
      begin
         ShowMessage( 'Mes de Fecha Fue Cerrado. Verificar...' );
         Exit;
      end;
    end;


    ValidaEdit(dblcTDoc ,'Ingrese Tipo de Documento') ;
    ValidaEdit(dbeNoDoc ,'Ingrese Número de Documento') ;
    ValidaEdit(dblcTMonCab ,'Ingrese Moneda') ;
    ValidaEdit(dbeTCambio ,'Ingrese Tipo de Cambio') ;
    if strtocurr(dbeTCambio.Text) = 0 then
    begin
       dbeTCambio.SetFocus ;
       Raise exception.create('Ingrese Tipo de Cambio') ;
    end ;
    ValidaEdit(dblcClase ,'Ingrese Clase') ;
    ValidaEdit(dblcdAux ,'Ingrese Auxiliar') ;
    ValidaEdit(dbeGiradoA ,'Ingrese Nombre del Cliente') ;
    ValidaEdit(dblcdCnp ,'Ingrese Concepto') ;
    ValidaEdit(dbeGlosa ,'Ingrese Glosa') ;
    
end;

procedure TFReciboCaja.RecuperaDescrip;
begin
    DMTE.DescripIngDocs(dblcCia.text,
                      DMTE.cdsIngDocs.FieldByName('CCTREC').AsString ,
                      DMTE.cdsIngDocs.FieldByName('DOCID').AsString ,
                      DMTE.cdsIngDocs.FieldByName('CCSERIE').AsString ,
                      DMTE.cdsIngDocs.FieldByName('CCNODOC').AsString
                     ) ;
    DMTE.cdsDescrip.Active := False ;
    DMTE.cdsDescrip.Active := True ;
    with DMTE.cdsDescrip do
    begin
       edtCia.Text     := FieldbyName('CIAABR').AsString ;
       edtTDoc.Text    := FieldbyName('DOCABR').AsString ;
       edtBanco.Text   := FieldbyName('BANCOABR').AsString ;
       edtTMonCab.Text := FieldbyName('TMONABR').AsString ;
       edtClase.Text   := FieldbyName('CLAUXABR').AsString ;
       
       if not DMTE.cdsDescrip.FieldByName('FLUEFEABR').isnull then
          dbeFEfec.text := DMTE.cdsDescrip.FieldByName('FLUEFEABR').AsString ;

    end ;

end;

procedure TFReciboCaja.InHabilitaControles;
begin
   dblcCia.Enabled    := False ;
   dblcBanco.Enabled  := False;
   dblcCCBco.Enabled  := False;
   dbdtpFEmision.Enabled := False;
   dbeNoComp.Enabled  := False;
   dblcTDoc.Enabled   := False ;
   dbeSerie.Enabled   := False ;
   dbeNoDoc.Enabled   := False ;
   pnlCabecera.Enabled := False
end;

procedure TFReciboCaja.HabilitaControles;
begin
   pnlCabecera.Enabled := True;
   dblcTDoc.Enabled   := true ;
   dbeSerie.Enabled   := true ;
   dbeNoDoc.Enabled   := true ;
   dblcBanco.Enabled  := true ;
   dblcCCBco.Enabled  := true ;
   dbdtpFEmision.Enabled := true ;
   dbeNoComp.Enabled  := true ;

end;

procedure TFReciboCaja.AsignaClaveDetalle;
var
   BMK : TBookmark ;
begin
   BMK:=DMTE.cdsCanjeCxCDoc.GetBookmark;
   DMTE.cdsCanjeCxCDoc.DisableControls;
   DMTE.cdsCanjeCxCDoc.First;
   while not DMTE.cdsCanjeCxCDoc.eof do
   begin
      DMTE.cdsCanjeCxCDoc.Edit ;
      DMTE.cdsCanjeCxCDoc.fieldBYName('CIAID').AsString   :=dblccia.Text ;
      DMTE.cdsCanjeCxCDoc.fieldBYName('TCANJEID').AsString:='RC' ;
      DMTE.cdsCanjeCxCDoc.fieldBYName('CJEDOCID').AsString:=dblcTDoc.Text ;
      DMTE.cdsCanjeCxCDoc.fieldBYName('CJESERIE').AsString:=trim(dbeSerie.Text);
      DMTE.cdsCanjeCxCDoc.fieldBYName('CJENODOC').AsString:=trim(dbeNoDoc.Text);
      cdspost(DMTE.cdsCanjeCxCDoc);
      DMTE.cdsCanjeCxCDoc.Next ;
   end;
   DMTE.cdsCanjeCxCDoc.GotoBookmark(BMK) ;
   DMTE.cdsCanjeCxCDoc.FreeBookmark(BMK) ;
   DMTE.cdsCanjeCxCDoc.EnableControls ;
end;

procedure TFReciboCaja.dbdtpFEmisionChange(Sender: TObject);
begin
   if not TCustomEdit(Sender).Focused then Exit;
   wModifica := True ;
end;

procedure TFReciboCaja.AsignaParametros;
var   xSQL : String ;
begin

   // vhn 22/01/2001
   xSQL:='Select * from CXC304 '
        +'Where CIAID='''    +dblcCia.Text        +''' and '
        +      'CJEDOCID=''' +dblcTDoc.Text       +''' and '
        +      'CJESERIE=''' +trim(dbeSerie.Text) +''' and '
        +      'CJENODOC=''' +trim(dbeNoDoc.text) +''' ';
   DMTE.cdsCanjeCxCDOC.DisableControls;
   DMTE.cdsCanjeCxCDOC.Close;
   DMTE.cdsCanjeCxCDOC.DataRequest( xSQL );
   DMTE.cdsCanjeCxCDOC.Open;
   DMTE.cdsCanjeCxCDOC.EnableControls;
end ;

procedure TFReciboCaja.cdsCanjeCxCDocBeforePost(DataSet: TDataSet);
begin
    wModifica := true ; 
    if not Z2bbtnGraba.Enabled then
    begin
      Z2bbtnGraba.Enabled     := True ;
      Z2bbtnCancelado.Enabled := False ;
      Z2bbtnAnula.Enabled     := False ;
    end ;
end;

procedure TFReciboCaja.Z2bbtnCancel2Click(Sender: TObject);
VAR
   Doc : structDocIng ;
begin
   //Cancela las Actualizaciones Realizadas

   DMTE.cdsIngDocs.CancelUpdates ;
   DMTE.cdsCanjeCxCDOC.CancelUpdates  ;
//** 16/12/2000 - pjsv
   if DMTE.wModo<>'A' then
   begin
      with Doc do
      begin
         CIAID    := dblcCia.Text ;
         CCTREC   := 'RC' ;
         DOCID    := dblcTDoc.Text ;
         CCSERIE  := trim( dbeSerie.Text ) ;
         CCNODOC  := trim( dbeNoDoc.Text ) ;
      end ;
      Edita(doc,cdsFiltro) ;
   end
   else
      Adiciona   ;
   if DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString ='I' then
     pnlCabecera1.SetFocus ;
   perform(CM_DialogKey,VK_TAB,0) ;
end;

procedure TFReciboCaja.dbdtpFEmisionExit(Sender: TObject);
var
   xStr,xWhere : String;
begin
   if dblcCia.Focused         then exit;
   if dblcBanco.Focused       then exit;
   if Z2bbtnCancelCab.Focused then exit;

   if edtBanco.Text = '' then
   begin
      dblcBanco.Enabled := True;
      dblcBanco.SetFocus;
      exit;
   end;

   if dbdtpFEmision.Date = 0 then
   begin
      TCustomEdit(Sender).SetFocus;
      raise Exception.create('Ingrese Fecha');
   end;

{   if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, '', dbdtpFEmision.Date ) then begin
      Showmessage('No se permite la Operación en esta Fecha porque mes de Fecha ya fue Cerrado!');
      dbdtpFEmision.SetFocus;
      exit;
   end;

   if not DiaAperturado(dblcCia.text,dbdtpFEmision.Date,dblcBanco.text) then
   Begin
     dbdtpFEmision.setfocus;
     exit;
   End;}

   If wBcoTipCta='B' Then //Busca en el CAJA402
   begin
      if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, dblcCCBco.Text, dbdtpFEmision.Date ) then
      begin
         dbdtpFEmision.SetFocus;
         Exit;
      end;
   end
   else //Busca en el CAJA310
   begin
      if not DiaAperturado(dblcCia.Text, dbdtpFEmision.Date, dblcBanco.Text) then
      begin
         dbdtpFEmision.SetFocus;
         Exit;
      end;
   end;

   if wFechaCierre <> 0 then
      if (TwwDBDateTimePicker(Sender).date <= wFechaCierre )
          or (TwwDBDateTimePicker(Sender).date > (wFechaCierre + wFrecu) ) then
      begin
          TwwDBDateTimePicker(Sender).SetFocus;
          Showmessage('Ingrese Fecha dentro del Rango'+#13+
                      'Fecha de Cierre  : ' + datetimetostr(wfechacierre) + #13+
                      'Frecuencia       : ' + inttostr(wFrecu));
          Exit;
      end;

   if (trim(dbeTCambio.Text) = '') or (dbeTCambio.Text='0.00') then
   begin
     xSTR:='FECHA=' +DMTE.wRepFuncDate+''''+ formatdatetime(DMTE.wFormatFecha,dbdtpFEmision.date)+''') ' +
           ' AND TMONID='''+DMTE.wTMonExt+'''';
     if DMTE.RecuperarDatos('TGE107',DMTE.wTipoCambioUsar,xSTR) then
       dbeTCambio.Text :=  DMTE.cdsRec.fieldbyname(DMTE.wTipoCambioUsar).AsString
     else
     begin
       dbeTCambio.Text := '0.00';
       TCustomEdit(Sender).SetFocus;
       Raise Exception.Create('Fecha no tiene tipo de Cambio');
     end;
   end;

   edtPeriodo.text:=copy(datetostr(dbdtpFEmision.date),7,4)
                   +copy(datetostr(dbdtpFEmision.date),4,2);
   dbdtpFEmis.date:= dbdtpFEmision.date;

   if trim(edtTDiario.Text) <> '' then
   begin
      xWhere:='CIAID='+quotedstr(dblcCia.Text)+' AND ECANOMM='+quotedstr(edtPeriodo.Text)
             +' AND TDIARID='+ quotedstr(dblcTDiario.Text);
      dbeNoComp.text:=DMTE.UltimoNum('prvCaja','CXC303','ECNOCOMP',xWhere);
      dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsIngDocs.FieldByName('ECNOCOMP').Size);
   end ;



end;

procedure TFReciboCaja.ActualizaDetalle;
var
   BMK            : TBookmark ;
   evt1 : TFieldNotifyEvent ;
   evt2 : TFieldNotifyEvent ;
   evt3 : TFieldNotifyEvent ;
begin

   BMK := DMTE.cdscanjecxcdoc.GetBookmark ;

   evt1 := DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').OnChange ;
   evt2 := DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').OnChange ;
   evt3 := DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').OnChange ;

   DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').OnChange  := nil ;
   DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').OnChange  := nil ;
   DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').OnChange := nil ;

   DMTE.cdsCanjeCxCDoc.DisableControls ;
   DMTE.cdsCanjeCxCDoc.First ;
   while not DMTE.cdsCanjeCxCDoc.eof do
   begin
      DMTE.cdsCanjeCxCDoc.Edit ;
      DMTE.cdsCanjeCxCDoc.fieldBYName('CCTCAMCJE').AsString   := dbeTCambio.Text ;
      with DMTE do
      begin
         if dblcTMonCab.Text = DMTE.wtMonLoc then
         begin
            cdsCanjeCxCDoc.FieldByName('CCSALORI').AsFloat := Redondea(cdsCanjeCxCDoc.FieldByName('CCSALLOC').AsFloat) ;
            cdsCanjeCxCDoc.FieldByName('CCSALEXT').AsFloat := Redondea( cdsCanjeCxCDoc.FieldByName('CCSALLOC').AsFloat / cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').AsFloat ) ;
            cdsCanjeCxCDoc.FieldByName('CCMTOEXT').AsFloat := Redondea( cdsCanjeCxCDoc.FieldByName('CCMTOLOC').AsFloat / cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').AsFloat ) ;
         end
         else
         begin
           cdsCanjeCxCDoc.FieldByName('CCSALORI').AsFloat := Redondea(cdsCanjeCxCDoc.FieldByName('CCSALEXT').AsFloat) ;
           cdsCanjeCxCDoc.FieldByName('CCSALLOC').AsFloat := Redondea(cdsCanjeCxCDoc.FieldByName('CCSALEXT').AsFloat * cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').AsFloat) ;
           cdsCanjeCxCDoc.FieldByName('CCMTOLOC').AsFloat := Redondea(cdsCanjeCxCDoc.FieldByName('CCMTOEXT').AsFloat * cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').AsFloat) ;
         end ;
      end ;
      DMTE.cdsCanjeCxCDoc.Next ;
   end;

   DMTE.cdsCanjeCxCDoc.GotoBookmark(BMK) ;
   DMTE.cdsCanjeCxCDoc.FreeBookmark(BMK) ;
   DMTE.cdsCanjeCxCDoc.EnableControls ;

   DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').OnChange  := evt1 ;
   DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').OnChange  := evt2 ;
   DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').OnChange := evt3 ;

end;

procedure TFReciboCaja.dbgDocCanjeCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
{    if (Field.FieldName = 'CCMTOLOC') or (Field.FieldName = 'CCMTOEXT') then begin
       AFont.Color := clBlue;
    end;}
end;
procedure TFReciboCaja.dbgDocCanjeCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'CCMTOLOC') or (AFieldName = 'CCMTOEXT') then
    begin
       ABrush.Color := clWhite;
    end;

end;

procedure TFReciboCaja.dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFReciboCaja.dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   If Target=dbgpendientes Then
   Begin
      With DMTE do
      Begin
         cdsMovCxC.DisableControls ;
         cdsMovCxC.Filtered:=False ;
         if cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG' ,
                                    VarArrayOf([
                                                DMTE.cdsCanjeCxCDoc.fieldbyname('CIAID').AsString ,
                                                DMTE.cdsCanjeCxCDoc.fieldbyname('TDIARID').AsString ,
                                                DMTE.cdsCanjeCxCDoc.fieldbyname('CCANOMM').AsString ,
                                                DMTE.cdsCanjeCxCDoc.fieldbyname('CCNoReg').AsString
                                                ]),[]) then
         begin
            cdsMovCxC.Edit ;
            DMTE.cdsMovCxC.fieldbyname('CCSALEXT').AsFloat := DMTE.cdsMovCxC.fieldbyname('CCMTOEXT').AsFloat - DMTE.numerononulo( DMTE.cdsMovCxC.FieldByName('CCPAGEXT') );
            DMTE.cdsMovCxC.fieldbyname('CCSALLOC').AsFloat := DMTE.cdsMovCxC.fieldbyname('CCMTOLOC').AsFloat - DMTE.numerononulo( DMTE.cdsMovCxC.FieldByName('CCPAGLOC') );
            If DMTE.cdsMovCxc.fieldbyname('TMONID').AsString=DMTE.wTMonLoc then
               DMTE.cdsMovCxc.fieldbyname('CCSALORI').AsFloat := DMTE.cdsMovCxC.fieldbyname('CCSALLOC').AsFloat
            else
               DMTE.cdsMovCxC.fieldbyname('CCSALORI').AsFloat := DMTE.cdsMovCxC.fieldbyname('CCSALEXT').AsFloat ;
            DMTE.cdsMovCxC.Post ;
            cdsCanjeCxCDoc.Delete ;
         end;
         cdsMovCxC.EnableControls ;
         cdsMovCxC.Filtered:=True ;
         z2bbtnSumat.click ;
      end;
      wmodifica:=True ;
   end ;

end ;

procedure TFReciboCaja.dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocCanje.BeginDrag(False);
end;

procedure TFReciboCaja.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFReciboCaja.dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
var
  I: integer;
begin
   with DMTE do
   begin
      if Target = dbgDocCanje then
      begin
         DMTE.cdsMovCxC.DisableControls;

         cdsCanjeCxCDoc.DisableControls;
         for i:= 0 to dbgPendientes.SelectedList.Count-1 do
         begin
             dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);
             if not cdsCanjeCxCDoc.Locate('CIAID;CJEDOCID;CJESERIE;CJENODOC;TDIARID;CCANOMM;CCNOREG' ,
                    VarArrayOf([DMTE.cdsMovCxC.fieldbyname('CIAID').AsString,
                              dblcTDoc.text ,
                              trim(dbeSerie.text) ,
                              trim(dbeNoDoc.Text) ,
                              DMTE.cdsMovCxC.fieldbyname('TDIARID').AsString,
                              DMTE.cdsMovCxC.fieldbyname('CCANOMES').AsString,
                              DMTE.cdsMovCxC.fieldbyname('CCNOREG').AsString
                              ]),[]) then
             begin
                cdsCanjeCxCDoc.Insert ;
                cdsCanjeCxCDoc.fieldbyname('CIAID').AsString    := cdsMovCxC.fieldbyname('CIAID').AsString    ;
                cdsCanjeCxCDoc.fieldbyname('TDIARID').AsString  := cdsMovCxC.fieldbyname('TDIARID').AsString  ;
                cdsCanjeCxCDoc.fieldbyname('CCNOREG').AsString  := cdsMovCxC.fieldbyname('CCNOREG').AsString ;
                cdsCanjeCxCDoc.fieldbyname('CCAAAA').AsString   := cdsMovCxC.fieldbyname('CCAAAA').AsString   ;
                cdsCanjeCxCDoc.fieldbyname('CCANOMM').AsString  := cdsMovCxC.fieldbyname('CCANOMES').AsString ;
                cdsCanjeCxCDoc.fieldbyname('CLAUXID').AsString  := cdsMovCxC.fieldbyname('CLAUXID').AsString  ;
                cdsCanjeCxCDoc.fieldbyname('CLIEID').AsString   := cdsMovCxC.fieldbyname('CLIEID').AsString  ;
                cdsCanjeCxCDoc.fieldbyname('CLIERUC').AsString  := cdsMovCxC.fieldbyname('CLIERUC').AsString;
                cdsCanjeCxCDoc.fieldbyname('DOCID').AsString    := cdsMovCxC.fieldbyname('DOCID').AsString;
                // LOOKUP
                cdsCanjeCxCDoc.fieldbyname('CCSERIE').AsString  := cdsMovCxC.fieldbyname('CCSERIE').AsString;
                cdsCanjeCxCDoc.fieldbyname('CCNODOC').AsString  := cdsMovCxC.fieldbyname('CCNODOC').AsString;

                cdsCanjeCxCDoc.fieldbyname('TCANJEID').AsString := 'RC';  // Recibo de Caja
                cdsCanjeCxCDoc.fieldbyname('CJEDOCID').AsString :=  dblcTDoc.text          ;
                cdsCanjeCxCDoc.fieldbyname('CJESERIE').AsString :=  dbeSerie.Text          ;
                cdsCanjeCxCDoc.fieldbyname('CJENODOC').AsString :=  dbeNoDoc.Text          ;
                cdsCanjeCxCDoc.FieldByName('CCCANJE').AsString  :=  dbeNoDoc.Text          ;

                cdsCanjeCxCDoc.fieldbyname('CCFCANJE').AsDateTime:= dbdtpFEmision.Date;
                cdsCanjeCxCDoc.fieldbyname('CCFEMIS').AsDateTime:= cdsMovCxC.fieldbyname('CCFEMIS').AsDateTime;


                cdsCanjeCxCDoc.fieldbyname('TMONID').AsString      := DMTE.cdsMovCxC.fieldbyname('TMONID').AsString;

                cdsCanjeCxCDoc.fieldbyname('CCTCAMCJE').AsFloat:= FRound(strtofloat(dbeTCambio.Text),8,3) ;
                cdsCanjeCxCDoc.fieldbyname('CCMTOORI').AsFloat := FRound(cdsMovCxC.fieldbyname('CCMTOORI').AsFloat,15,2)  ;
                cdsCanjeCxCDoc.fieldbyname('CCSALORI').AsFloat := FRound(cdsMovCxC.fieldbyname('CCMTOORI').AsFloat,15,2)  ;

                cdsCanjeCxCDoc.fieldbyname('CCMTOLOC').AsFloat := FRound(cdsMovCxC.fieldbyname('CCSALLOC').AsFloat,15,2);
                cdsCanjeCxCDoc.fieldbyname('CCSALLOC').AsFloat := FRound(cdsMovCxC.fieldbyname('CCSALLOC').AsFloat,15,2);
                cdsCanjeCxCDoc.fieldbyname('CCMTOEXT').AsFloat := FRound(cdsMovCxC.fieldbyname('CCSALEXT').AsFloat,15,2);
                cdsCanjeCxCDoc.fieldbyname('CCSALEXT').AsFloat := FRound(cdsMovCxC.fieldbyname('CCSALEXT').AsFloat,15,2);

                cdsCanjeCxCDoc.fieldbyname('CJEANTMN').AsFloat := 0 ;
                cdsCanjeCxCDoc.fieldbyname('CJEANTME').AsFloat := 0 ;
                cdsCanjeCxCDoc.fieldbyname('CCTCAMDOC').AsFloat:= FRound(cdsMovCxC.fieldbyname('CCTCAMAJ').AsFloat,8,3)     ;
                cdsCanjeCxCDoc.fieldbyname('CTATOTAL').AsString := cdsMovCxC.fieldbyname('CTATOTAL').AsString;
                cdsCanjeCxCDoc.fieldbyname('CPTOTOT').AsString  := cdsMovCxC.fieldbyname('CCPTOTOT').AsString                ;
                cdsCanjeCxCDoc.fieldbyname('CCFVCMTO').AsDateTime := cdsMovCxC.fieldbyname('CCFVCMTO').AsDateTime;
                cdsCanjeCxCDoc.fieldbyname('CCUSER').AsString  := DMTE.wUsuario;
                cdsCanjeCxCDoc.fieldbyname('CCFREG').AsDateTime  := dateS;
                if (DMTE.SRV_D = 'ORACLE') then
                   cdsCanjeCxCDoc.fieldbyname('CCHREG').AsDateTime  := dateS+time
                else
                   cdsCanjeCxCDoc.fieldbyname('CCHREG').AsDateTime  := time;

                cdsMovCxC.Edit ;
                cdsMovCxC.fieldbyname('CCSALORI').AsFloat := 0 ;
                cdsMovCxC.Post ;
             end ;
             dbgPendientes.datasource.dataset.Freebookmark(dbgPendientes.SelectedList.items[i]) ;
         end; // for
         dbgPendientes.SelectedList.clear ;  { Clear selected record list since they are all deleted}
         cdsCanjeCxCDoc.EnableControls ;
         cdsMovCxC.EnableControls ;
         z2bbtnSumat.click ;
         wmodifica:=True ;
      end; // target
   end; // DMTE
end;

procedure TFReciboCaja.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgPendientes.BeginDrag(False);
end;

procedure TFReciboCaja.ActualizaSaldos;
var   xRegAct : TBookMark;
      xAdicional : double;
      xLoc, xExt,xOri,xcia,xtdia,xperio,ssql,xnreg   : String ;
begin
  with DMTE do
  begin
    cdsMovCxC.DisableControls;
    cdsMovCxC.Filtered:=False;
    cdsCanjeCxCDoc.DisableControls;
    xRegAct := cdsCanjeCxCDoc.GetBookmark;
    cdsCanjeCxCDoc.First;
    While not cdsCanjeCxCDoc.Eof do
    Begin
      if DMTE.cdsMovCxC.Locate('CIAID;DOCID;CCSERIE;CCNODOC',
                              VarArrayOf([DMTE.cdsCanjeCxCDoc.fieldbyname('CIAID').AsString,
                                          DMTE.cdsCanjeCxCDoc.fieldbyname('DOCID').AsString,
                                          DMTE.cdsCanjeCxCDoc.fieldbyname('CCSERIE').AsString,
                                          DMTE.cdsCanjeCxCDoc.fieldbyname('CCNODOC').AsString]),
                              []) then
      begin
        DMTE.cdsMovCxC.edit;
        if DMTE.cdsMovCxC.fieldbyname('TMONID').AsString = DMTE.wTMonLoc then
        begin
          DMTE.cdsMovCxC.fieldbyname('CCSALLOC').AsFloat := FRound(DMTE.cdsMovCxC.FieldByName('CCMTOLOC').AsFloat -
                                       DMTE.cdsMovCxC.FieldByName('CCPAGLOC').AsFloat - DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').AsFloat,15,2);
          DMTE.cdsMovCxC.fieldbyname('CCSALORI').AsFloat := FRound(DMTE.cdsMovCxC.fieldbyname('CCSALLOC').AsFloat,15,2);

          //Calculo del otro Saldo
          xAdicional := FRound(DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').AsFloat / DMTE.cdsMovCxC.fieldbyname('CCTCAMAJ').AsFloat,15,2) ;
          DMTE.cdsMovCxC.fieldbyname('CCSALEXT').AsFloat := FRound(DMTE.cdsMovCxC.fieldbyname('CCMTOEXT').AsFloat -
                                       DMTE.cdsMovCxC.FieldByName('CCPAGEXT').AsFloat-
                                       xAdicional,15,2) ;
        end
        else
        begin
          DMTE.cdsMovCxC.fieldbyname('CCSALEXT').AsFloat := FRound(DMTE.cdsMovCxC.fieldbyname('CCMTOEXT').AsFloat -
                                       DMTE.cdsMovCxC.FieldByName('CCPAGEXT').AsFloat - DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').AsFloat,15,2);

          DMTE.cdsMovCxC.fieldbyname('CCSALORI').AsFloat := FRound(DMTE.cdsMovCxC.fieldbyname('CCSALEXT').AsFloat,15,2);
          //Calculo del otro Saldo
          xAdicional := FRound(DMTE.cdsCanjeCxCDOC.FieldByName('CCMTOEXT').AsFloat * DMTE.cdsMovCxC.fieldbyname('CCTCAMAJ').AsFloat,15,2) ;
          DMTE.cdsMovCxC.fieldbyname('CCSALLOC').AsFloat := FRound(DMTE.cdsMovCxC.fieldbyname('CCMTOLOC').AsFloat -
                                       DMTE.cdsMovCxC.FieldByName('CCPAGLOC').AsFloat- xAdicional,15,2);
        end ;

        xLoc   := DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsString ;
        xExt   := DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsString ;
        xOri   := DMTE.cdsMovCxC.FieldByName('CcSalOri').AsString ;
        xcia   := trim(dblccia.text) ;
        xtdia  := DMTE.cdsMovCxC.fieldbyname('TDIARID').AsString ;
        xperio := DMTE.cdsMovCxC.fieldbyname('CCANOMES').AsString ;
        xnreg  := DMTE.cdsMovCxC.fieldbyname('CCNOREG').AsString ;


        if DMTE.cdsMovCxC.FieldByName('CCPAGLOC').IsNull then
          DMTE.cdsMovCxC.FieldByName('CCPAGLOC').AsFloat := 0 ;
        if DMTE.cdsMovCxC.FieldByName('CCPAGEXT').IsNull then
          DMTE.cdsMovCxC.FieldByName('CCPAGEXT').AsFloat := 0 ;
        if DMTE.cdsMovCxC.FieldByName('CCPAGORI').IsNull then
          DMTE.cdsMovCxC.FieldByName('CCPAGORI').AsFloat := 0 ;
        DMTE.cdsMovCxC.post;
        DMTE.AplicaDatos(DMTE.cdsMovCxC,'MOVCXC');
      end
      else
      begin
        Showmessage('No se Actualizó CXC ');
      end ;
      cdsCanjeCxCDoc.Next;
    end;
    DMTE.cdsCanjeCxCDoc.GotoBookmark(xRegAct) ;
    DMTE.cdsCanjeCxCDoc.FreeBookmark(xRegAct) ;
    DMTE.cdsCanjeCxCDoc.EnableControls ;
    DMTE.cdsMovCxC.Filtered:=True ;
    DMTE.cdsMovCxC.EnableControls ;
  end;
end;

procedure TFReciboCaja.dbgDocCanjeExit(Sender: TObject);
begin
   if DMTE.cdscanjecxcdoc.state in [dsinsert,dsedit] then
      DMTE.cdscanjecxcdoc.Post ;
end;

procedure TFReciboCaja.ActualizaPagados;
var
 xRegAct : TBookMark;
 ssql : string;
 xtcam,xori,xext,xloc    : string;
 xcia,xtdia,xperio,xnreg : string;
 sPeriodo:string;
 a,m,d:word;
begin
 DecodeDate(dbdtpFEmision.Date,a,m,d);
 sPeriodo:=DMTE.StrZero(IntToStr(a),4)+DMTE.StrZero(IntToStr(m),2);
  with DMTE do
  begin
    cdsMovCxC.Filtered:=False;
    cdsCanjeCxCDoc.DisableControls;
    xRegAct := cdsCanjeCxCDoc.GetBookmark;
    cdsCanjeCxCDoc.First;
    While not cdsCanjeCxCDoc.Eof do
    Begin
      if DMTE.cdsMovCxC.Locate('CIAID;DOCID;CCSERIE;CCNODOC',VarArrayOf([
                    DMTE.cdsCanjeCxCDoc.fieldbyname('CIAID').AsString,
                    DMTE.cdsCanjeCxCDoc.fieldbyname('DOCID').AsString,
                    DMTE.cdsCanjeCxCDoc.fieldbyname('CCSERIE').AsString,
                    DMTE.cdsCanjeCxCDoc.fieldbyname('CCNODOC').AsString]),[]) then
      begin
        xcia :=  DMTE.cdsCanjeCxCDoc.fieldbyname('CIAID').AsString;
        xtdia := DMTE.cdsCanjeCxCDoc.fieldbyname('TDIARID').AsString;
        xperio := DMTE.cdsCanjeCxCDoc.fieldbyname('CCANOMM').AsString;
        xnreg := DMTE.cdsCanjeCxCDoc.fieldbyname('CCNOREG').AsString;

        DMTE.cdsMovCxC.edit;

        DMTE.cdsMovCxC.fieldbyname('CCPAGLOC').AsFloat := FRound(DMTE.cdsMovCxC.fieldbyname('CCMTOLOC').AsFloat - DMTE.cdsMovCxC.fieldbyname('CCSALLOC').AsFloat,15,2);
        xloc := DMTE.cdsMovCxC.fieldbyname('CCPAGLOC').AsString;

        DMTE.cdsMovCxC.fieldbyname('CCPAGEXT').AsFloat := FRound(DMTE.cdsMovCxC.fieldbyname('CCMTOEXT').AsFloat - DMTE.cdsMovCxC.fieldbyname('CCSALEXT').AsFloat,15,2);
        xext := DMTE.cdsMovCxC.fieldbyname('CCPAGEXT').AsString;

        If DMTE.cdsMovCxC.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
        begin
          DMTE.cdsMovCxC.fieldbyname('CCPAGORI').AsFloat := DMTE.cdsMovCxC.fieldbyname('CCPAGLOC').AsFloat ;
          xori := DMTE.cdsMovCxC.fieldbyname('CCPAGORI').AsString;
          If DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat <= 0.01 then
          begin
             DMTE.cdsMovCxC.FieldByName('CCFCANCEL').AsDateTime := DateS;
             DMTE.cdsMovCxC.FieldByName('CCESTADO').AsString := 'C';
             DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat :=0;
             DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat :=0;
             DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat :=0;
          end;
        end
        else
        begin
           DMTE.cdsMovCxC.fieldbyname('CCPAGORI').AsFloat := DMTE.cdsMovCxC.fieldbyname('CCPAGEXT').AsFloat ;
           xori := DMTE.cdsMovCxC.fieldbyname('CCPAGORI').AsString;
           If DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat <= 0.01 then
           begin
             DMTE.cdsMovCxC.FieldByName('CCFCANCEL').AsDateTime := DateS;
             DMTE.cdsMovCxC.FieldByName('CCESTADO').AsString := 'C' ;
             DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat :=0;
             DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat :=0;
             DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat :=0;
           end;
        end ;
        DMTE.cdsMovCxC.FieldByName('CCTCAMPA').AsFloat := DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').AsFloat;
        DMTE.cdsMovCxC.FieldByName('CCUSER').AsString:=DMTE.wUsuario;

        xtcam := DMTE.cdsMovCxC.Fieldbyname('CCTCAMPA').AsString;
        DMTE.AplicaDatos(DMTE.cdsMovCxC,'MOVCXC');
        DMTE.SaldosAuxiliar(DMTE.cdsMovCxC.Fieldbyname('CIAID').AsString,sPeriodo,
                           DMTE.cdsMovCxC.Fieldbyname('CLAUXID').AsString,DMTE.cdsMovCxC.Fieldbyname('CLIEID').AsString,
                           '-',DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').AsFloat,DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').AsFloat,
                           DMTE.cdsMovCxC.Fieldbyname('TMONID').AsString);

        InsertaRegistroCxC;

        { //LA ACTUALIZACION SE HACE POR CLIENTDATASET
        ssql:='';
        ssql := 'UPDATE CXC301 SET '+
                ' CCPAGLOC='+xloc+
                ' ,CCPAGEXT='+xext+
                ' ,CCPAGORI='+xori;
        If (DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat <= 0.02) or (DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat <= 0.02) then
         ssql := ssql +  ' ,CCESTADO='+quotedstr('C');
        ssql := ssql + ' ,CCTCAMPA='+xtcam+
                       ' WHERE CIAID='+quotedstr(xcia)+
                       ' AND TDIARID='+quotedstr(xtdia)+
                       ' AND CCANOMES='+quotedstr(xperio)+
                       ' AND CCNOREG='+quotedstr(xnreg);
        try
         DCOM1.AppServer.EjecutaSQL(ssql);
        except
        end;
        //**}
      end
      else
       begin
          ShowMessage('Error :Actualización Mov WMC') ;
       end ;
      cdsCanjeCxCDoc.Next;
    end;
    cdsCanjeCxCDoc.GotoBookmark(xRegAct);
    cdsCanjeCxCDoc.FreeBookmark(xRegAct);
    cdsCanjeCxCDoc.EnableControls;
    cdsMovCxC.Filtered:=True;
    cdsMovCxC.First;
    cdsMovCxC.EnableControls;
  end;
end;

procedure TFReciboCaja.Z2bbtnCanceladoClick2(Sender: TObject);
var
   xCobLoc ,
   xCobExt : Double         ;
   xSql : String;
begin
  ValidaCancelacion;
  if DMTE.cdsIngDocs.fieldByName('NCOESTADO').AsString = 'I' then
  begin
    if wModifica then
    begin
      ShowMessage('Debe Grabar Primero las Actualizaciones Realizadas') ;
      Z2bbtnCancelado.Enabled := False;
      Z2bbtnGraba.Enabled := True;
      exit;
    end;

    if MessageDlg('¿Desea Efectuar la Cancelación del Documento?', mtConfirmation,
                 [mbYes, mbNo], 0) = mrYes then
    begin
      DMTE.cdsIngDocs.edit ;
      DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString := 'C' ;
      xCobLoc   := OperClientDataSet(
                      DMTE.cdsDetFPago ,'SUM(FC_RECIBIDO)' , 'TMONID = ''' + DMTE.wTMonLoc + ''''  ) ;
      xCobExt   := OperClientDataSet(
                      DMTE.cdsDetFPago ,'SUM(FC_RECIBIDO)' , 'TMONID = ''' + DMTE.wTMonExt + ''''  ) ;

      DMTE.cdsIngDocs.FieldByName('ECCOBLOC').AsFloat := xCobLoc ;
      DMTE.cdsIngDocs.FieldByName('ECCOBEXT').AsFloat := xCobExt ;
      cdsPost(DMTE.cdsIngDocs);
      DMTE.AplicaDatos( DMTE.cdsIngDocs, 'INGDOCS' );

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

      /////ACTUALIZACIÓN DE SALDOS//////
      if (xCobLoc > 0 ) then
         with DMTE.cdsIngDocs do
          DMTE.ActSdoCaja(DMTE.wTMonLoc ,DMTE.cdsIngDocs.FieldByName('BANCOID').AsString ,
                         FloatToStrF(xCobLoc,ffFixed,15,2) ,DMTE.cdsIngDocs.FieldByName('CCFEMIS').AsString,'I') ;

      if (xCobExt > 0 ) then
         with DMTE.cdsIngDocs do
          DMTE.ActSdoCaja(DMTE.wTMonExt , fieldbyname('BANCOID').AsString ,
                         fieldbyname('ECCOBEXT').AsString ,fieldbyname('CCFEMIS').AsString,'I') ;
      /////FIN DE ACTUALIZACIÓN DE SALDOS/////
      xSQL:='SELECT * FROM CXC305 WHERE CIAID=''XX'' AND DOCID=''XX'' AND CCSERIE=''XX'' AND CCNODOC=''XX'' ';
      DMTE.cdsDetCanjeCxC.Close;
      DMTE.cdsDetCanjeCxC.DataRequest(xSQL);
      DMTE.cdsDetCanjeCxC.Open;

      ActualizaPagados    ;
      ///////////

      GrabaEstadoFPago('C') ;

      DMTE.AplicaDatos(DMTE.cdsDetFPago,'DETFPAGO');
      Z2bbtnEmite.Enabled   := True;

      Z2bbtnSumat.Enabled        := False;
      Z2bbtnCont.Enabled         := True;
      Z2bbtnSube.Enabled         := False;
      Z2bbtnGraba.Enabled        := False;
      Z2bbtnCancelado.Enabled    := False;
      Z2bbtnCancel2.Enabled      := False;
      Z2bbtnAnula.Enabled        := False;
      Z2bbtnAdicFPago.Enabled    := False;
      Z2dbgDetPagoIButton.Enabled:= False;
      Z2bbtnImprime.Enabled      := True;
      ActualizaFiltro ;
      lblEstadoMov.Caption    := 'Cancelado'   ;
{      DMTE.cdsBancoEgr.Filter := ' BCOTIPCTA = ''C'' ' ;
      DMTE.cdsBancoEgr.Filtered := True  ;}
    end
    else
    begin
      ShowMessage('Imposible Cancelar');
    end;
  end ;
end;

procedure TFReciboCaja.RetornaSaldos;
begin
      With DMTE do
      Begin
         cdsMovCxC.DisableControls ;
         cdsMovCxC.Filtered:=False ;
         cdsCanjeCxCDoc.First ;
         while not cdscanjeCxCDoc.Eof do
         begin
            if cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG' ,
               VarArrayOf([
                     DMTE.cdsCanjeCxCDoc.fieldbyname('CIAID').AsString,
                     DMTE.cdsCanjeCxCDoc.fieldbyname('TDIARID').AsString,
                     DMTE.cdsCanjeCxCDoc.fieldbyname('CCANOMM').AsString,
                     DMTE.cdsCanjeCxCDoc.fieldbyname('CCNOREG').AsString]),[]) then
            begin
               cdsMovCxC.Edit ;
               DMTE.cdsMovCxC.fieldbyname('CCSALEXT').AsFloat := DMTE.cdsMovCxC.fieldbyname('CCMTOEXT').AsFloat - DMTE.numerononulo( DMTE.cdsMovCxC.FieldByName('CCPAGEXT') ) ;
               DMTE.cdsMovCxC.fieldbyname('CCSALLOC').AsFloat := DMTE.cdsMovCxC.fieldbyname('CCMTOLOC').AsFloat - DMTE.numerononulo( DMTE.cdsMovCxC.FieldByName('CCPAGLOC') ) ;
               If DMTE.cdsMovCxP.fieldbyname('TMONID').AsString = wTMonLoc then
                  DMTE.cdsMovCxC.fieldbyname('CCSALORI').AsFloat := DMTE.cdsMovCxC.fieldbyname('CCSALLOC').AsFloat
               else
                  DMTE.cdsMovCxC.fieldbyname('CCSALORI').AsFloat := DMTE.cdsMovCxC.fieldbyname('CCSALEXT').AsFloat ;

               DMTE.cdsMovCxC.Post ;
            end
            else begin
               ShowMessage('Error en el retorno de saldos');
            end;
            cdsCanjeCxCDoc.Next ;
         end ;
         cdsMovCxC.EnableControls ;
         cdsMovCxC.Filtered:=True ;
         if cdsmovCxC.ApplyUpdates(0) > 0 then
            Raise exception.create ('Error en la grabación de los mov') ;
      end;
end;

procedure TFReciboCaja.dblcdFEfecExit(Sender: TObject);
begin
  xDescrip := 'FLUEFEID='+quotedstr(dblcdFEfec.text);
  dbeFEfec.text := DMTE.DisplayDescrip('prvTGE','TGE217','FLUEFEDES',xDescrip,'FLUEFEDES');
end;

procedure TFReciboCaja.ActualizaFiltro;
begin
    if z2bbtnNuevo.Visible then
    begin
       if not xGraboNuevo then
          cdsFiltro.Append ;
       //DMTE.ActualizaCDS(DMTE.cdsIngDocs,cdsFiltro) ;
    end
    else
    begin
       //DMTE.ActualizaCDS(DMTE.cdsIngDocs,cdsFiltro) ;
    end ;
    xGraboNuevo := True ;

end;

procedure TFReciboCaja.AsignaCDSFiltro(cds: TwwClientDataset);
begin
    cdsFiltro := cds ;
end;

procedure TFReciboCaja.dbgDetFPagoDblClick(Sender: TObject);
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
      exit ;
   end ;
   if DMTE.cdsIngDocs.fieldbyname('NCOESTADO').AsString = 'A' then
   begin
      ShowMessage('Este Documento Está Anulado');
      exit ;
   end ;

   pnlDetalle.Enabled  := False ;
   pnlBotones.Enabled  := False ;
   PnlFPago.BringToFront ;
   BlanqueaEdits(pnlFPago) ;
   PnlFPago.Visible:= True ;
   PnlFpago.setfocus ;
   perform(CM_DialogKey,VK_TAB,0) ;
   DMTE.cdsDetFPago.Edit ;
   llenaedits ;
//
end;

procedure TFReciboCaja.dbgDetFPagoEnter(Sender: TObject);
begin

    if dbgDetFPago.DataSource.DataSet.RecordCount = 0 then
    begin
//       Z2bbtnAdicFPago.OnClick(nil) ;
    end ;

end;

procedure TFReciboCaja.dbgDetFPagoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   xPosi : Integer ;
begin

   if (Z2bbtnAdicFPago.Enabled=True) and (key = VK_DELETE) and (ssCtrl in Shift) then
   begin
      if (DMTE.cdsDetFPago.RecordCount=0) then
          ShowMessage('No hay registros')
       else
       begin
          if MessageDlg('¿Eliminar Registro?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
          begin
             xPosi := DMTE.cdsDetFPago.RecNo      ;
             DMTE.cdsDetFPago.Delete              ;    // Borro en el original..
             AcumulaDetFPago                     ;
             if DMTE.cdsDetFPago.RecordCount <> 0 then
             begin
                DMTE.cdsDetFPago.DisableControls  ;
                DMTE.cdsDetFPago.First            ;
                while not DMTE.cdsDetFPago.Eof do
                begin
                    DMTE.cdsDetFPago.Edit         ;
                    DMTE.cdsDetFPago.FieldByName('CORRE').AsInteger := DMTE.cdsDetFPago.RecNo ;
                    DMTE.cdsDetFPago.Post         ;
                    DMTE.cdsDetFPago.Next         ;
                end;
                if xposi <= DMTE.cdsDetFPago.RecordCount then
                   DMTE.cdsDetFPago.recno := xPosi ;
                DMTE.cdsDetFPago.EnableControls   ;
             end ;

         end;
      end;
   end;
end;

procedure TFReciboCaja.Z2bbtnAdicFPagoClick(Sender: TObject);
begin
  //Deshabilitar resto de paneles
    pnlDetalle.Enabled  := False ;
    pnlBotones.Enabled  := False ;
    PnlFPago.BringToFront ;
    BlanqueaEdits(pnlFPago) ;
    PnlFPago.Visible:= True ;
    PnlFpago.setfocus ;
    perform(CM_DialogKey,VK_TAB,0) ;
    Inserta;
end;

procedure TFReciboCaja.BitBtn1Click(Sender: TObject);
begin
   DMTE.cdsDetFPago.Cancel ;
   pnlFPago.SetFocus ;
   pnlFPago.Visible := False ;
   pnlDetalle.Enabled   := True;
   pnlBotones.Enabled   := True;
//
end;

procedure TFReciboCaja.BitBtn2Click(Sender: TObject);
begin
     if DMTE.cdsDetFPago.State in [dsedit,dsinsert] then
     begin
         if MessageDlg(' Añadir Cancelará los Cambios Actuales'+ #13 +
                       '     ¿ Desea Continuar ?     ',mtConfirmation,[mbYes, mbNo],0) = mrNo then
            exit ;
     end ;
     DMTE.cdsDetFPago.Cancel ;
     BlanqueaEdits(pnlFPago) ;
     Inserta ;
end;

procedure TFReciboCaja.chkAsignaRestoClick(Sender: TObject);
begin
  if chkAsignaResto.Checked then
  begin
      dbeRecibido.Enabled  := False ;
      dbeACobrar.Enabled   := False ;
      if dblcTMonC.Text = DMTE.wTMonLoc then
//wmc1010         dbeRecibido.Text := dbeDifLoc.text
      else
//wmc1010         dbeRecibido.Text := dbeDifExt.text ;
      dbeRecibidoExit(nil) ;
  end
  else
  begin
      dbeRecibido.Enabled  := True ;
      dbeACobrar.Enabled   := True ;

  end;
end;

procedure TFReciboCaja.dbeACobrarEnter(Sender: TObject);
begin
   strTmp := dbeACobrar.Text ;
end;

procedure TFReciboCaja.dbeACobrarExit(Sender: TObject);
begin

   if CajaDec( dbeACobrar.text ) = BLANCO then
   begin
      dbeACobrar.Text := dbeRecibido.Text ;
      Exit ;
   end ;

   if strTmp <> dbeACobrar.text then
   begin
      dbeACobrar.text   := CajaDec( dbeACobrar.Text ) ;
      if CmpDec( dbeRecibido.Text , dbeACobrar.Text ) = -1 then
         dbeACobrar.Text := dbeRecibido.Text ;
   end ;

end;

procedure TFReciboCaja.dbeRecibidoChange(Sender: TObject);
begin
    dbeACobrar.Enabled := True ;

end;

procedure TFReciboCaja.dbeRecibidoEnter(Sender: TObject);
begin
   strTmp := dbeRecibido.Text ;
end;

procedure TFReciboCaja.dbeRecibidoExit(Sender: TObject);
var
   Tmp : String ;
begin
   Tmp := StrTmp ;
   if CajaDec( StringReplace(dbeRecibido.text,',','',[rfReplaceAll]) ) = BLANCO then
   begin
      ShowMessage('Debe ingresar Monto Recibido') ;
      StrTmp := Tmp ;
      dbeRecibido.Text := BLANCO ;
      dbeRecibido.setfocus ;
      Exit ;
   end ;
   if strTmp <> dbeRecibido.text then
   begin
      dbeRecibido.text  := CajaDec(dbeRecibido.text) ;
      dbeACobrar.text   := dbeRecibido.text ;

   end ;

end;

procedure TFReciboCaja.dblcBancoFPagoExit(Sender: TObject);
begin
   xDescrip := 'BANCOID='+quotedstr(dblcBancoFPago.text);
   edtBcoFPago.text := DMTE.displaydescrip('prvTGE','TGE105','BANCONOM',xDescrip,'BANCONOM');
   If dblcBancofPago.text = '' then
   begin
     showmessage('Falta Banco');
     dblcBancofPago.SetFocus;
   end;
end;

procedure TFReciboCaja.dblcFormPagoExit(Sender: TObject);
begin
   xDescrip := 'FPAGOID='+quotedstr(dblcFormPago.text);
   edtFormPagoCab.text := DMTE.DisplayDescrip('prvTGE','TGE112','FPAGODES',xDescrip,'FPAGODES');
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
          dbeNOChq.Text    := '';
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

procedure TFReciboCaja.dblcTarjetaExit(Sender: TObject);
begin
   xDescrip := 'TJAID='+quotedstr(dblcTarjeta.text);
   edtTarjeta.text := DMTE.displaydescrip('prvTGE','TGE167','TJADES',xDescrip,'TJADES');
   If dblcTarjeta.text = '' then
    begin
     showmessage('Falta Tarjeta');
     dblcTarjeta.SetFocus;
    end;
end;

procedure TFReciboCaja.dblcTMonCExit(Sender: TObject);
begin
   xDescrip := 'TMONID='+quotedstr(dblcTMonC.text);
   edtTMonC.text := DMTE.displaydescrip('prvTGE','TGE103','TMONABR',xDescrip,'TMONABR');
   If dblcTMonC.text = '' then
    begin
     showmessage('Falta Moneda');
     dblcTMonC.SetFocus;
    end;

   if self.ActiveControl <> TWinControl(Sender) then
   begin
      CalculaResto;
   end;
end;

procedure TFReciboCaja.Z2OkDetalleClick(Sender: TObject);
var
   xNuevo : Boolean ;
begin
   ValidacionDatos ;
   ValidacionTjaChq ;
   ValidacionCobradoTotal ;
   if DMTE.cdsDetFPago.state = dsinsert then
      xNuevo := true
   else
      xNuevo := false ;
   GrabaDetalle ;
   AcumulaDetFPago ;
   wModifica := TRUE ;
   if xNuevo then
   begin
     BlanqueaEdits(pnlFPago) ;
     Inserta ;
   end
   else
   begin
     pnlFPago.SetFocus            ;
     pnlFPago.Visible := False    ;
     pnlDetalle.Enabled   := True ;
     pnlBotones.Enabled   := True ;
   end;
//  If StrToFloat(dbeResta.Text) <= 0 then
//   BitBtn1.onclick(BitBtn1);
end;

procedure TFReciboCaja.ValidaCancelacion;
begin
   if DMTE.wTMonLoc=trim( dblcTMonCab.Text ) then
   begin
//      if DMTE.frOUND(OperClientDataSet(DMTE.cdsCanjeCxCDoc,'SUM(CCMTOLOC)', ''),15,2) <>
//         DMTE.FROUND(OperClientDataSet(DMTE.cdsDetFPago,   'SUM(FC_MTOLOC)',''),15,2) then
      if FloatToStrF(OperClientDataSet(DMTE.cdsCanjeCxCDoc,'SUM(CCMTOLOC)', '')+OperClientDataSet(DMTE.cdsRegCxC,'SUM(DEMTOLOC)', ''),ffFixed,15,2) <>
         FloatToStrF(OperClientDataSet(DMTE.cdsDetFPago,   'SUM(FC_MTOLOC)',''),ffFixed,15,2) then
         Raise Exception.create('El Monto Provisionado y ' + #13 + 'La Cancelación no concuerdan') ;
   end
   else
//      if DMTE.frOUND(OperClientDataSet(DMTE.cdsCanjeCxCDoc,'SUM(CCMTOEXT)', ''),15,2) <>
//         DMTE.frOUND(OperClientDataSet(DMTE.cdsDetFPago,   'SUM(FC_MTOEXT)',''),15,2) then
      if FloatToStrF(OperClientDataSet(DMTE.cdsCanjeCxCDoc,'SUM(CCMTOEXT)', '')+OperClientDataSet(DMTE.cdsRegCxC,'SUM(DEMTOEXT)', ''),ffFixed,15,2) <>
         FloatToStrF(OperClientDataSet(DMTE.cdsDetFPago,   'SUM(FC_MTOEXT)',''),ffFixed,15,2) then
         Raise Exception.create('El Monto Provisionado y ' + #13 + 'La Cancelación no concuerdan') ;
end;

procedure TFReciboCaja.AcumulaDetFPago;
var
   xMtoLoc, xMtoExt : Double;
   xCountLoc, xCountExt      : Double;
   xMonedaBase               : String      ;
   xUnaSolaMoneda            : Boolean ;
begin
   xMtoLoc   :=  OperClientDataSet(DMTE.cdsDetFPago , 'SUM(FC_MTOLOC)','') ;
   xMtoExt   :=  OperClientDataSet(DMTE.cdsDetFPago , 'SUM(FC_MTOEXT)','') ;

   dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue  := cajadec(FloatToStrF(xMtoLoc,ffFixed,10,2) ) ;
   dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue  := cajadec(FloatToStrF(xMtoExt,ffFixed,10,2)) ;

   xCountLoc :=  OperClientDataSet(DMTE.cdsDetFPago , 'COUNT(*)','TMONID=''' + DMTE.wTMonLoc + '''') ;
   xCountExt :=  OperClientDataSet(DMTE.cdsDetFPago , 'COUNT(*)','TMONID=''' + DMTE.wTMonExt + '''') ;
   if ((xCountLoc > 0) and (xCountExt=0)) or ((xCountLoc = 0) and (xCountExt > 0)) then
   begin
      xMonedaBase   := DMTE.cdsDetFPago.fieldbyname('TMONID').AsString ;
      xUnaSolaMoneda:= true ;
   end
   else
   begin
      xMonedaBase   := trim( dblcTMonCab.Text ) ;
      xUnaSolaMoneda:= False ;
   end;
end;

procedure TFReciboCaja.CalculaResto;
var
    xCampo1  ,
    xCampo2,xMonto0  : string              ;
    xMonto1,xMonto2 : Double;
begin
    if DMTE.cdsDetFPago.State = dsedit then
    begin
//        if DMTE.cdsdetfpago.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
        if dblcTMonC.Text = DMTE.wTMonLoc then
        begin
           xCampo1 := 'CCMTOLOC'  ;
           xCampo2 := 'FC_MTOLOC' ;
        end
        else
        begin
           xCampo1 := 'CCMTOEXT'  ;
           xCampo2 := 'FC_MTOEXT' ;
        end ;
        //** 06/03/2001 - pjsv, para que cuendo sea blanco no salga el error
        // que no es un dato numerico
        If dbgDetFPago.ColumnByName(xCampo2).FooterValue = '' then
         dbgDetFPago.ColumnByName(xCampo2).FooterValue := FloatToStrF(0.00,ffFixed,10,2);
        //**
        dbeResta.Text  := currtostr ( strtocurr( trim(dbgDocCanje.ColumnByName(xCampo1).FooterValue)) -
                          strtocurr( trim(dbgDetFPago.ColumnByName(xCampo2).FooterValue)) +
                          DMTE.cdsdetfpago.fieldbyname('FC_RECIBIDO').asFloat )                   ;

    end
    else
       if DMTE.cdsDetFPago.State = dsInsert then
       begin
//           if dblcTMonCab.Text = DMTE.wTMonLoc then
           if dblcTMonC.Text = DMTE.wTMonLoc then
           begin
            If dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue = '' then
             dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue := FloatToStrF(0.00,ffFixed,10,2);
            try
             xmonto1 := StrToFloat( stringReplace( dbgDocCanje.ColumnByName('CCMTOLOC').FooterValue,',','',[rfReplaceAll]) );
             xMonto2 := StrToFloat( stringReplace( dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue,',','',[rfReplaceAll]) );
             xMonto0 := FloatToStrF((xMonto1 - xMonto2),ffFixed,15,2);
             dbeResta.Text := xMonto0;
            except
             dbeResta.Text := FloatToStrF(StrToFloat( stringReplace(dbgDocCanje.ColumnByName('CCMTOLOC').FooterValue,',','',[rfReplaceAll])),ffFixed,15,2) ;
            end ;
           end
           else
           begin
            If dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue = '' then
             dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue := FloatToStrF(0.00,ffFixed,10,2);
            try
             xmonto1 := StrToFloat( stringReplace(dbgDocCanje.ColumnByName('CCMTOEXT').FooterValue,',','',[rfReplaceAll]));
             xMonto2 := StrToFloat( stringReplace(dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue,',','',[rfReplaceAll]));
             xMonto0 := FloatToStrF((xMonto1 - xMonto2),ffFixed,15,2);
             dbeResta.Text := xMonto0;
            except
             dbeResta.Text := FloatToStrF(StrToFloat(stringReplace(dbgDocCanje.ColumnByName('CCMTOEXT').FooterValue,',','',[rfReplaceAll])),ffFixed,15,2) ;
            end ;
           end ;
           //** 06/03/2001 - pjsv, para que cuendo sea blanco no salga el error
           // que no es un dato numerico
{           If dbgDetFPago.ColumnByName(xCampo2).FooterValue = '' then
            dbgDetFPago.ColumnByName(xCampo2).FooterValue := FloatToStrF(0.00,ffFixed,10,2);
           //**
           try
             xmonto1 := StrToFloat(dbgDocCanje.ColumnByName(xCampo1).FooterValue);
             xMonto2 := StrToFloat(dbgDetFPago.ColumnByName(xCampo2).FooterValue);
             xMonto0 := FloatToStrF((xMonto1 - xMonto2),ffFixed,15,2);
             dbeResta.Text := xMonto0;
           except
             dbeResta.Text := FloatToStrF(StrToFloat(dbgDocCanje.ColumnByName(xCampo1).FooterValue),ffFixed,15,2) ;
           end ;
}
       end ;
end ;

procedure TFReciboCaja.LLenaEdits;
begin
    with DMTE.cdsDetFPago do
    begin
        dblcFormPago.text      := DMTE.FieldNoNUlo(FieldByName('FPAGOID'))      ;
        dblcBancoFPago.text    := DMTE.FieldNoNUlo(FieldByName('BANCOID'))      ;
        dblcTarjeta.text       := DMTE.FieldNoNUlo(FieldByName('TJAID'))        ;
        dblcTMOnC.Text         := DMTE.FieldNoNUlo(FieldByName('TMONID'))       ;
        dbeNOChq.Text          := DMTE.FieldNoNUlo(FieldByName('ECNOCHQ'))      ;
        dbeRecibido.text       := DMTE.FieldNoNUlo(FieldByName('FC_RECIBIDO'))  ;
        dbeaCobrar.text        := DMTE.FieldNoNUlo(FieldByName('FC_COBRADO'))   ;

        xDescrip := 'FPAGOID='+quotedstr(dblcFormPago.text);
        edtFormPago.text := DMTE.DisplayDescrip('prvTGE','TGE112','FPAGODES',xDescrip,'FPAGODES');
        xdescrip := 'BANCOID='+quotedstr(dblcBancoFPago.text);
        edtBcoFPago.text := DMTE.displaydescrip('prvTGE','TGE105','BANCONOM',xDescrip,'BANCONOM');
        xDescrip := 'TJAID='+quotedstr(dblcTarjeta.text);
        edtTarjeta.text := DMTE.displaydescrip('prvTGE','TGE167','TJADES',xDescrip,'TJADES');
        xDescrip := 'TMONID='+quotedstr(dblcTMonC.text);
        edtTMonC.text := DMTE.displaydescrip('prvTGE','TGE103','TMONABR',xDescrip,'TMONABR');
        CalculaResto ;
    end ;
    dbeRecibido.Enabled  := True  ;
    dbeACobrar.Enabled   := True  ;
    bitbtn2.Visible := False      ;
end ;

procedure TFReciboCaja.Inserta;
begin
  with DMTE.cdsDetFPago do
  begin
    Insert ;
    FieldByName('CORRE').AsInteger := recno ;
    if recordcount = 0 then

      if DMTE.wTMonLoc = trim(dblcTMonCab.Text) then
         dbeRecibido.Text := dbgDocCanje.columnbyname('CCMTOLOC').FooterValue
      else
         dbeRecibido.Text := dbgDocCanje.columnbyname('CCMTOORI').FooterValue ;

    dblcTMonC.text       := dblcTMonCab.Text ;
    edtTMonC.Text        := edtTMonCab.Text ;
    dblcFormPago.text    := dblcFormPagoCab.text;
    edtFormPago.text     := edtFormPagoCab.text;
    dblcBancoFPago.text  := dblcBanco.text;
    edtBcoFPago.text     := edtBanco.text;
    dbeNoChq.text        := dbeNoChqCab.Text;

    dbeRecibido.Enabled  := True ;
    dbeACobrar.Enabled   := False ;
    CalculaResto ;
    If StrToFloat(dbeResta.text) <= 0 then
     BitBtn1.onclick(BitBtn1)
    else
     dblcFormPago.SetFocus ;
  end ;

end ;

procedure TFReciboCaja.ValidacionDatos;
begin

   if trim(dblcFormPago.text) = '' then
   begin
      dblcFormPago.SetFocus ;
      Raise Exception.Create ('Ingrese Forma de Pago') ;
   end ;

   if trim(dblcTMonC.text) = '' then
   begin
      dblcTMonC.setfocus ;
      Raise Exception.Create ('Ingrese Moneda') ;
   end ;

   if (cajadec(StringReplace(dbeRecibido.text,',','',[rfReplaceAll])) = BLANCO)  then
   begin
        dbeRecibido.SetFocus ;
        Raise Exception.Create ('Ingrese Monto Recibido') ;
   end
{
   else if (cajadec(dbeACobrar.text) = BLANCO) then
        begin
            dbeACobrar.SetFocus ;
            Raise Exception.Create ('Ingrese Monto a Cobrar') ;
        end ;
}

end;

procedure TFReciboCaja.ValidacionTjaChq;
begin
    if dblcFormPago.Text = DMTE.wEFECTIVO then
       Exit ;

    if trim(dblcBanco.text) = '' then
    begin
       dblcBanco.setfocus ;
       Raise Exception.Create ('Ingrese Banco') ;
    end ;
    if trim(dbeNoChq.text) = '' then
    begin
       dbeNoChq.setfocus ;
       Raise Exception.Create ('Ingrese Chq/Tarjeta') ;
    end ;

    if dblcFormPago.Text = DMTE.wTARJETA then
    begin
       if trim(dblcTarjeta.text) = '' then
       begin
          dblcTarjeta.SetFocus ;
          Raise Exception.Create ('Ingrese Tipo de Tarjeta') ;
       end ;
    end ;

end;

procedure TFReciboCaja.ValidacionCobradoTotal;
begin
   if chkAsignaResto.Checked then
      Exit ;
{
   if dblcTMonC.Text = DMTE.wTMonLoc then
   begin
      xMonto := floattostrf(Acum.COBRADOSOLES + strToCurr (dbeACobrar.text ),fffixed,10,2) ;
      if Acum.COBRADOSOLES + strToCurr (dbeACobrar.text ) > strtocurr(dbeImpLOC.Text) then
         Raise Exception.Create ('El Monto Cobrado Actual es ' + xMonto + #13 +
                                 'y no puede exceder a :'+ dbeImpLOC.Text) ;
   end
   else
   begin
      xMonto := floattostrf(Acum.COBRADODOLARES + strToCurr (dbeACobrar.text ),fffixed,10,2) ;
      if Acum.COBRADODOLARES + strToCurr (dbeACobrar.text ) > strtocurr(dbeImpEXT.Text) then
         Raise Exception.Create ('El Monto Cobrado Actual es ' + xMonto + #13 +
                                 'y no puede exceder a :'+ dbeImpEXT.Text) ;
   end
}
end;

procedure TFReciboCaja.GrabaDetalle;
var
    xMonLoc , xMtoExt : Double ;
begin
    with DMTE.cdsDetFPago do
    begin
        DMTE.cdsDetFPago.FieldByName('FPAGOID').AsString        := dblcFormPago.text ;
        DMTE.cdsDetFPago.FieldByName('FPAGODES').AsString       := DMTE.DisplayDescrip('prvTGE','TGE112','FPAGOABR','FPAGOID='+quotedstr(dblcFormPago.text),'FPAGOABR');
        DMTE.cdsDetFPago.FieldByName('BANCOID').AsString        := dblcBancoFPago.text ;
        DMTE.cdsDetFPago.FieldByName('TJAID').AsString          := dblcTarjeta.text ;
        DMTE.cdsDetFPago.FieldByName('TMONID').AsString         := dblcTMOnC.Text ;
        DMTE.cdsDetFPago.FieldByName('TMONABR').AsString        := edtTMonC.text;
        DMTE.cdsDetFPago.FieldByName('ECNOCHQ').AsString        := TRIM(dbeNOChq.Text) ;
        DMTE.cdsDetFPago.FieldByName('FC_RECIBIDO').AsString    := StringReplace(dbeRecibido.text,',','',[rfReplaceAll]) ;
        DMTE.cdsDetFPago.FieldByName('TC_USADO').AsString       := StringReplace(dbeTCambio.Text,',','',[rfReplaceAll]) ;
        DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsString     := StringReplace(FieldByName('FC_RECIBIDO').AsString,',','',[rfReplaceAll]) ;
        DMTE.cdsDetFPago.FieldByName('FC_DEVOLVER').AsString    := '0.00' ;
        DMTE.cdsDetFPago.FieldByName('CPTOID').AsString         := trim(dblcdCnp.Text) ;
        DMTE.cdsDetFPago.FieldByName('CLAUXID').AsString        := trim(dblcClase.Text) ;
        DMTE.cdsDetFPago.FieldByName('CLIEID').AsString         := trim(dblcdAux.Text) ;

        //Calcular y grabar equivalentes
        if dblctmonc.Text = DMTE.wTMonLoc then
        begin
           xMonLoc := DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat ;
           xMtoExt := Redondea(DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat /DMTE.cdsDetFPago.FieldByName('TC_USADO').AsFloat );
        end
        else
        begin
           xMonLoc := DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat * DMTE.cdsDetFPago.FieldByName('TC_USADO').AsFloat ;
           xMtoExt := DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat ;
        end ;
        DMTE.cdsDetFPago.FieldByName('FC_MTOLOC').AsFloat  := DMTE.FRound(xMonLoc,15,3);// Redondea( xMonLoc ) ;
        DMTE.cdsDetFPago.FieldByName('FC_MTOEXT').AsFloat  := DMTE.FRound(xMtoExt,15,3); //Redondea( xMtoExt ) ;
        //fin de calcular
        Post ;
    end ;

end;

procedure TFReciboCaja.GrabaEstadoFPago(xEstado: string);
begin
  with DMTE.cdsDetFPago do
  begin
    DisableControls ;
    First ;
    while not Eof do
    begin
        Edit ;
        FieldBYname('FC_ESTADO').AsString  := xEstado ;
        fieldbyname('FC_FCANC').AsDateTime := dbdtpFEmision.date ;
        cdsPost(DMTE.cdsDetFPago);
        Post ;
        Next ;
    end;
    First ;
    EnableControls ;
  end ;

end;

procedure TFReciboCaja.GrabaClave;
var
  xContador : Integer ;
begin
  with DMTE.cdsDetFPago do
  begin
    DisableControls ;
    First ;
    while not Eof do
    begin
     If DMTE.cdsDetFPago.FieldBYname('CIAID').AsString = '' then
      begin
        Edit ;
        xEditaDet := '1';
        FieldBYname('CIAID').AsString    := trim(dblcCia.Text)  ;
        FieldBYname('CCTREC').AsString   := 'RC'  ;
        FieldBYname('DOCID').AsString    := trim(dblcTDoc.Text)    ;
        FieldBYname('CCSERIE').AsString  := trim(dbeSerie.Text) ;
        FieldBYname('CCNODOC').AsString  := trim(dbeNoDoc.Text) ;
        FieldBYname('FC_ESTADO').AsString  := 'I' ;
        Post ;
        Next ;
      end
     else
      begin
        Next ;
        xEditaDet := '0';
      end;
    end;
    First ;
    EnableControls ;
  end ;

end;

procedure TFReciboCaja.pnlDetalleChange(Sender: TObject);
begin
//
  { dbgDocCanje.ColumnByName('CCMTOLOC').FooterValue:=floattostrf(xMtoLoc, ffFixed, 10, 2);
   dbgDocCanje.ColumnByName('CCMTOLOC').FooterValue :=floattostrf( OperClientDataSet(DMTE.cdsCanjeCxCDoc,'SUM(CCMTOLOC)', ''), ffFixed, 10, 2 );
   dbgDocCanje.ColumnByName('CCMTOEXT').FooterValue :=floattostrf( OperClientDataSet(DMTE.cdsCanjeCxCDoc,'SUM(CCMTOEXT)', ''), ffFixed, 10, 2 );
   dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue:=floattostrf( OperClientDataSet(DMTE.cdsDetFPago,   'SUM(FC_MTOLOC)',''), ffFixed, 10, 2 );
   dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue:=floattostrf( OperClientDataSet(DMTE.cdsDetFPago,   'SUM(FC_MTOEXT)',''), ffFixed, 10, 2 );
}//
end;

procedure TFReciboCaja.Z2bbtnSumatClick(Sender: TObject);
Var
   xRegAct : TBookMark;
   xMtoLoc : Double;
   xMtoExt : Double;
begin
  DMTE.cdsRegCxC.DisableControls;
  xRegAct := DMTE.cdsCanjeCxCDoc.GetBookmark;

  xMtoLoc := 0;
  xMtoExt := 0;

  DMTE.cdsRegCxC.First;
  While not DMTE.cdsRegCxC.Eof do
  begin
     xMtoLoc:=xMtoLoc+DMTE.cdsRegCxC.fieldbyname('DEMTOLOC').AsFloat;
     xMtoExt:=xMtoExt+DMTE.cdsRegCxC.fieldbyname('DEMTOEXT').AsFloat;
     DMTE.cdsRegCxC.Next;
  end;
  dbgDetPago.ColumnByName('DEMTOLOC').FooterValue:= floattostrf(xMtoLoc, ffNumber, 10, 2) ;//FormatFloat('0.00',xMtoLoc); // floattostrf(xMtoLoc, ffFixed, 10, 2);
  dbgDetPago.ColumnByName('DEMTOEXT').FooterValue:= floattostrf(xMtoExt, ffNumber, 10, 2) ;//FormatFloat('0.00',xMtoExt);//floattostrf(xMtoExt, ffFixed, 10, 2);

  DMTE.cdsCanjeCxCDoc.First;
  While not DMTE.cdsCanjeCxCDoc.Eof do
  begin
     xMtoLoc:=xMtoLoc+DMTE.cdsCanjeCxCDoc.fieldbyname('CCMTOLOC').AsFloat;
     xMtoExt:=xMtoExt+DMTE.cdsCanjeCxCDoc.fieldbyname('CCMTOEXT').AsFloat;
     DMTE.cdsCanjeCxCDoc.Next;
  end;

  dbgDocCanje.ColumnByName('CCMTOLOC').FooterValue:= floattostrf(xMtoLoc, ffNumber, 10, 2) ;//FormatFloat('0.00',xMtoLoc); // floattostrf(xMtoLoc, ffFixed, 10, 2);
  dbgDocCanje.ColumnByName('CCMTOEXT').FooterValue:= floattostrf(xMtoExt, ffNumber, 10, 2) ;//FormatFloat('0.00',xMtoExt);//floattostrf(xMtoExt, ffFixed, 10, 2);
  DMTE.cdsCanjeCxCDoc.GotoBookmark(xRegAct);
  DMTE.cdsCanjeCxCDoc.FreeBookmark(xRegAct);
  DMTE.cdsCanjeCxCDoc.EnableControls;
  DMTE.cdsRegCxC.EnableControls;
end;

//** 29/03/2001 - pjsv
procedure TFReciboCaja.dblcCiaExit(Sender: TObject);
begin
   xDescrip := 'CIAID='+quotedstr(dblcCia.Text);
   edtCia.text := DMTE.DisplayDescrip('prvTGE','TGE101','CIAABR',xDescrip,'CIAABR');
   // viene del Change
   wModifica := True;

   if (dblcTDoc.Enabled = false) and (DMTE.wModo = 'A') then
      BuscaNRecibo;
end;


procedure TFReciboCaja.dbeNoDocExit(Sender: TObject);
var
   xWhere : String;
begin
   wModifica := True ;
   
   if DMTE.wModo='A' then begin
      dbeSerie.Text:='CAJA';
      //Búsqueda en CXC303
      xWhere := 'CIAID=''' + dblcCia.Text + ''' ' +
                ' AND DOCID = '''+ dblcTDoc.Text + ''' ' +
                ' AND '+DMTE.wReplacCeros+'(CCSERIE,'''') = '''+ dbeSerie.Text + ''' ' +
                ' AND CCNODOC = '''+ dbeNoDoc.Text + ''' ';
      if DMTE.DisplayDescrip('prvTGE','CXC303','COUNT(*) TOTREG',xWhere,'TOTREG') > '0' then begin

         ShowMessage('El Número de Documento ya Ha sido Ingresado. Se Cambiara por el Siguiente...');
         BuscaNRecibo;
      end;
   end;
end;

procedure TFReciboCaja.dbeGiradoAExit(Sender: TObject);
begin
  wModifica := tRUE;
end;

procedure TFReciboCaja.dbeGlosaExit(Sender: TObject);
begin
  wModifica := True;
end;


procedure TFReciboCaja.dblcdAuxExit(Sender: TObject);
begin
  if dblcClase.Focused then Exit;

  xDescrip := 'AUXID='+quotedstr(dblcdAux.text);
  DMTE.Filtracds(DMTE.cdsQry,'SELECT AUXID, AUXRUC, AUXGIRA, AUXNOMB FROM CNT201 WHERE '+xDescrip);

  If DMTE.cdsQry.fieldbyName('AUXID').asString = '' then
   begin
    showmessage('No se encuentra registrado el Auxiliar');
    dblcdAux.Text := '';
    dblcdAux.setfocus;
   end
  else
   begin
    edtAuxRuc.text := DMTE.cdsQry.fieldbyName('AUXRUC').asString;
    If (Trim(DMTE.cdsQry.fieldbyName('AUXGIRA').asString) = '')
    then dbeGiradoA.text := DMTE.cdsQry.fieldbyName('AUXNOMB').asString
    else dbeGiradoA.text := DMTE.cdsQry.fieldbyName('AUXGIRA').asString;
    wModifica := True;
   end;
end;

procedure TFReciboCaja.dbeTCExit(Sender: TObject);
begin

   if DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').AsFloat<=0 then begin
      DMTE.cdsCanjeCxCDoc.fieldBYName('CCTCAMCJE').AsString   := dbeTCambio.Text ;
      ShowMessage('Error : Tipo de Cambio debe ser Mayor a Cero');
      dbeTC.SetFocus;
      Exit;
   end;

   If DMTE.wTMonLoc = DMTE.cdsCanjeCxCDoc.FieldByName('TMonID').AsString then
   begin
      DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').AsFloat := DMTE.FRound( DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').AsFloat,15,2);
      If DMTE.cdsCanjeCxCDoc.FieldByName('CCSALLOC').AsFloat=0 then
      begin
         DMTE.cdsCanjeCxCDoc.FieldByName('CCSALLOC').AsFloat := DMTE.FRound( DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').AsFloat,15,2);
         DMTE.cdsCanjeCxCDoc.FieldByName('CCSALEXT').AsFloat := DMTE.FRound( DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').AsFloat/DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').AsFloat,15,2 );
      end
      else
      begin
         DMTE.cdsCanjeCxCDoc.FieldByName('CCSALLOC').AsFloat := DMTE.FRound( DMTE.cdsCanjeCxCDoc.FieldByName('CCSALLOC').AsFloat,15,2);
         DMTE.cdsCanjeCxCDoc.FieldByName('CCSALEXT').AsFloat := DMTE.FRound( DMTE.cdsCanjeCxCDoc.FieldByName('CCSALLOC').AsFloat/DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').AsFloat,15,2 );
      end;
   end
   else
   begin
      DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').AsFloat := DMTE.FRound( DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').AsFloat,15,2);
      If DMTE.cdsCanjeCxCDoc.FieldByName('CCSALEXT').AsFloat=0 then
      begin
         DMTE.cdsCanjeCxCDoc.FieldByName('CCSALLOC').AsFloat := DMTE.FRound( DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').AsFloat*DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').AsFloat,15,2 );
         DMTE.cdsCanjeCxCDoc.FieldByName('CCSALEXT').AsFloat := DMTE.FRound( DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').AsFloat,15,2);
      end
      else
      begin
         DMTE.cdsCanjeCxCDoc.FieldByName('CCSALLOC').AsFloat := DMTE.FRound( DMTE.cdsCanjeCxCDoc.FieldByName('CCSALEXT').AsFloat*DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').AsFloat,15,2 );
         DMTE.cdsCanjeCxCDoc.FieldByName('CCSALEXT').AsFloat := DMTE.FRound( DMTE.cdsCanjeCxCDoc.FieldByName('CCSALEXT').AsFloat,15,2);
      end;
   end;
   z2bbtnSumat.click ;
end;

procedure TFReciboCaja.dbeMPLExit(Sender: TObject);
begin
   if DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').AsFloat<=0 then begin
      DMTE.cdsCanjeCxCDoc.fieldbyname('CCMTOLOC').AsFloat:=DMTE.cdsCanjeCxCDoc.fieldbyname('CCSALLOC').AsFloat;
      ShowMessage('Error : Monto Local debe ser Mayor a Cero');
      dbeMPL.SetFocus;
      Exit;
   end;

   DMTE.cdsCanjeCxCDoc.Edit;
   if DMTE.FRound(DMTE.cdsCanjeCxCDoc.fieldbyname('CCMTOLOC').AsFloat,15,2)>DMTE.FRound(DMTE.cdsCanjeCxCDoc.fieldbyname('CCSALLOC').Asfloat,15,2) then
   begin
      ShowMessage('Monto excede a Saldo Actual');
      DMTE.cdsCanjeCxCDoc.Edit;
      DMTE.cdsCanjeCxCDoc.fieldbyname('CCMTOLOC').AsFloat:=DMTE.cdsCanjeCxCDoc.fieldbyname('CCSALLOC').AsFloat;
      dbgDocCanje.SelectedIndex:=8; // debería ser 9 pero no hace caso
      dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
      Exit;
   end
   else begin
      DMTE.cdsCanjeCxCDoc.Edit;
      DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').AsFloat := DMTE.FRound( DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').AsFloat/ DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').AsFloat,15,3) ;
      z2bbtnSumat.click ;
   end;
end;

procedure TFReciboCaja.dbeMPEExit(Sender: TObject);
begin
   if DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').AsFloat<=0 then begin
      DMTE.cdsCanjeCxCDoc.fieldbyname('CCMTOEXT').AsFloat:=DMTE.cdsCanjeCxCDoc.fieldbyname('CCSALEXT').AsFloat;
      ShowMessage('Error : Monto Extranjero debe ser Mayor a Cero');
      dbeMPE.SetFocus;
      Exit;
   end;

   DMTE.cdsCanjeCxCDoc.Edit;
   if DMTE.FRound(DMTE.cdsCanjeCxCDoc.fieldbyname('CCMTOEXT').AsFloat,15,2)>DMTE.Fround(DMTE.cdsCanjeCxCDoc.fieldbyname('CCSALEXT').AsFloat,15,2) then
   begin
      ShowMessage('Monto excede a Saldo Actual');
      DMTE.cdsCanjeCxCDoc.Edit;
      DMTE.cdsCanjeCxCDoc.fieldbyname('CCMTOEXT').AsFloat:=DMTE.cdsCanjeCxCDoc.fieldbyname('CCSALEXT').AsFloat;
      dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
      dbgDocCanje.SelectedIndex:=10; // debería ser 9 pero no hace caso
      Exit;
   end
   else begin
      DMTE.cdsCanjeCxCDoc.Edit;
      DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').AsFloat := DMTE.FRound( DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').AsFloat*DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').AsFloat,15,3) ;
      z2bbtnSumat.click ;
   end;
end;

procedure TFReciboCaja.Z2bbtnEmiteClick(Sender: TObject);
var
  sMoneda,sMes,CadSql : String;
  a,m,d : word;
  xTotal : double;
begin
  if DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString <> 'C' then
  begin
     rAISE Exception.Create('El Documento debe estar aceptado' +#13+' para poder ser emitido') ;
  end ;
//
  sMoneda:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES','TMONID='+QuotedStr(dblcTMonCab.text),'TMONDES');

  DecodeDate(dbdtpFEmision.Date,a,m,d);
  {if m=1 then smes  :='ENERO';
  if m=2 then smes  :='FEBRERO';
  if m=3 then smes  :='MARZO';
  if m=4 then smes  :='ABRIL';
  if m=5 then smes  :='MAYO';
  if m=6 then smes  :='JUNIO';
  if m=7 then smes  :='JULIO';
  if m=8 then smes  :='AGOSTO';
  if m=9 then smes  :='SETIEMBRE';
  if m=10 then smes :='OCTUBRE';
  if m=11 then smes :='NOVIEMBRE';
  if m=12 then smes :='DICIEMBRE';}
  sMes:=DMTE.DisplayDescrip('prvTGE','TGE181','MESDESL','MESIDI='+IntToStr(m),'MESDESL');

{  if dblcTMonCab.Text = DMTE.wTMonLoc then
     xTotal := OperClientDataSet(DMTE.cdsRegCxC,'SUM(DEMTOLOC)','')+OperClientDataSet(DMTE.cdsCanjeCxCDOC,'SUM(CCMTOLOC)','')
  else
     xTotal := OperClientDataSet(DMTE.cdsRegCxC,'SUM(DEMTOEXT)','')+OperClientDataSet(DMTE.cdsCanjeCxCDOC,'SUM(CCMTOEXT)','')}


  if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
     cadSQL:=' SELECT CAJA301.CIAID,''NP'' DOCID, ''000'' CCSERIE, CPNOREG CCNODOC,''No Provisonado'' DOCABR,M.TMONABR, '+
             ' CASE WHEN CAJA301.TMONID='+QuotedStr(DMTE.wTMonLoc)+' THEN DEMTOLOC ELSE DEMTOEXT END NCOMTOORI, '+
             Quotedstr(dbeGlosa.Text)+' CCGLOSA ,DEFCOMP CCFEMIS, '+Quotedstr(dbeGiradoA.Text)+' CCNOMB,DETCDOC NCOTCAMB, '+
             Quotedstr(edtBanco.Text)+' BANCONOM '+
             ' FROM CAJA301 '+
             ' LEFT JOIN TGE103 M ON M.TMONID=CAJA301.TMONID '+
             ' WHERE CAJA301.CIAID='+QuotedStr(dblcCia.text)+' AND DOCID2='+QuotedStr(dblcTDoc.text)+
             ' AND CPSERIE=''CAJA'' AND CPNODOC='+QuotedStr(dbeNoDoc.text)+
             ' UNION ALL '+
             ' SELECT CIAID,CXC304.DOCID,CCSERIE,CCNODOC,T.DOCABR,M.TMONABR, '+
             ' CASE WHEN CXC304.TMONID='+QuotedStr(DMTE.wTMonLoc)+' THEN CCMTOLOC ELSE CCMTOEXT END NCOMTOORI, '+
             dbeGlosa.Text+' CCGLOSA ,CCFEMIS, '+Quotedstr(dbeGiradoA.Text)+' CCNOMB,CCTCAMCJE NCOTCAMB ,'+
            Quotedstr(edtBanco.Text)+' BANCONOM '+
             ' FROM CXC304 '+
             ' LEFT JOIN TGE110 T ON T.DOCID=CXC304.DOCID AND DOCMOD=''CXC'' '+
             ' LEFT JOIN TGE103 M ON M.TMONID=CXC304.TMONID '+
             ' WHERE CIAID='+QuotedStr(dblcCia.text)+' AND CJEDOCID='+QuotedStr(dblcTDoc.text)+
             ' AND CJESERIE=''CAJA'' AND CJENODOC='+QuotedStr(dbeNoDoc.text)
  else
      if (DMTE.SRV_D = 'ORACLE') then
           cadSQL:=' SELECT CAJA301.CIAID,''NP'' DOCID, ''000'' CCSERIE, CPNOREG CCNODOC,''No Provisonado'' DOCABR, '+
                   ' CAJA301.TMONID,M.TMONABR, '+
                   ' CASE WHEN CAJA301.TMONID='+QuotedStr(DMTE.wTMonLoc)+' THEN DEMTOLOC ELSE DEMTOEXT END FC_COBRADO, '+
                   Quotedstr(dbeGlosa.Text)+' CCGLOSA,DEFCOMP CCFEMIS, '+Quotedstr(dbeGiradoA.Text)+' CCNOMB,'+
                   ' CAJA301.DETCDOC NCOTCAMB, '+
                   Quotedstr(edtBanco.Text)+' BANCONOM, '+Quotedstr(edtFormPagoCab.Text)+' FPAGODES'+
                   ' FROM CAJA301 ,TGE103 M'+
                   ' WHERE (CAJA301.CIAID='+QuotedStr(dblcCia.text)+' AND DOCID2='+QuotedStr(dblcTDoc.text)+
                   ' AND CPSERIE=''CAJA'' AND CPNODOC='+QuotedStr(dbeNoDoc.text)+')'+
                   ' AND CAJA301.TMONID=M.TMONID(+)  '+
                   ' UNION ALL '+
                   ' SELECT CIAID,CXC304.DOCID,CCSERIE,CCNODOC,T.DOCABR,CXC304.TMONID,M.TMONABR, '+
                   ' CASE WHEN CXC304.TMONID='+QuotedStr(DMTE.wTMonLoc)+' THEN CCMTOLOC ELSE CCMTOEXT END FC_COBRADO ,'+
                   Quotedstr(dbeGlosa.Text)+' CCGLOSA,CCFEMIS, '+Quotedstr(dbeGiradoA.Text)+' CCNOMB,CCTCAMCJE NCOTCAMB, '+
                   Quotedstr(edtBanco.Text)+' BANCONOM, '+Quotedstr(edtFormPagoCab.Text)+' FPAGODES'+
                   ' FROM CXC304,TGE110 T,TGE103 M '+
                   ' WHERE (CIAID='+QuotedStr(dblcCia.text)+' AND CJEDOCID='+QuotedStr(dblcTDoc.text)+
                   ' AND CJESERIE=''CAJA'' AND CJENODOC='+QuotedStr(dbeNoDoc.text)+') '+
                   ' AND (CXC304.DOCID=T.DOCID(+) AND DOCMOD=''CXC'' )'+
                   ' AND (CXC304.TMONID=M.TMONID(+)) ';

  DMTE.cdsqry.close;
  DMTE.cdsqry.datarequest(CadSql);
  DMTE.cdsqry.open;

  ppdbRecibo.DataSource   := DMTE.dsQry ;
  pprRecibo.TEMPLATE.FileName := wRutaRpt + '\IngresoxCob.Rtm';
  pprRecibo.template.LoadFromFile ;
  pplblRecibo.Caption := dbeNoDoc.text;
  ppLbDescrip.Caption := dbeGiradoA.text;
  pplblCia.caption:=edtCia.text;
  pplblBanco.Caption:=edtBanco.text;
//  ppLbDescrip1.caption:='La cantidad de '+FloatToStrF(DMTE.cdsIngDocs.FieldbyName('NCOMTOORI').AsFloat,ffFixed,15,2)+ ' '+sMoneda;
  ppLbDescrip1.caption:='La cantidad de '+Trim(StrNum(DMTE.cdsIngDocs.FieldbyName('NCOMTOORI').AsFloat))+ ' '+sMoneda;
  pplbFecha.Caption:=DMTE.StrZero(IntToStr(d),2)+' de '+sMes+' del '+DMTE.StrZero(IntToStr(a),4);
  pplbValor.caption:=edtTMonCab.text+FloatToStrF(DMTE.cdsIngDocs.FieldbyName('NCOMTOORI').AsFloat,ffFixed,15,2);

  pprRecibo.Print                      ;
  ppdbRecibo.DataSource   := nil       ;
//  ppDesigner1.Show;

end;

procedure TFReciboCaja.NotInList(Sender: TObject; LookupTable: TDataSet;
  NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFReciboCaja.dbgDetPagoCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'DEMTOLOC') or (AFieldName = 'DEMTOEXT') then
           ABrush.Color := clWhite;
end;

procedure TFReciboCaja.dbgDetPagoDblClick(Sender: TObject);
begin
   if dbgdetpago.DataSource.DataSet.RecordCount = 0 then
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

   //pnlDetPago.Enabled  := False;
   pnlBotones.Enabled  := False;
   pnlActualiza.BringToFront;
   pnlActualiza.Visible:= True;
   IniciaPanel;
   dbeNoReg.enabled := False;
   EditaRegistro;
   pnlactualiza.SetFocus;
   perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFReciboCaja.dbgDetPagoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Z2dbgDetPagoIButton.Enabled=True) and (key = VK_DELETE) and (ssCtrl in Shift) then begin
      if (DMTE.cdsRegCxC.RecordCount=0) then
          ShowMessage('No hay registros')
       else begin
          if MessageDlg('¿Eliminar Registro?',mtconfirmation,[mbYes,mbNo],0)=mrYes then begin
             DMTE.cdsRegCxC.Delete;    // Borro en el original..
             RecalculaReg;
             Z2bbtnSumatClick(sender);  // Al salir hay que totalizar
         end;
      end;
   end;
end;

procedure TFReciboCaja.IniciaPanel;
begin
     dblcdCnp22.Text     := '';
     edtCuenta2.Text     := '';
     dblcdCCosto.Text    := '';
     dbeDH.Text          := '';
     dblcTMon2.Text      := '';
     edtTMon2.Text       := '';
     dbeImporte2.Text    := '';
     dbeTCamPr.Text      := '';
     edtMtoLoc.Text      := '';
     edtMtoExt.Text      := '';

     edtCnp2.Text        := '';
     edtTMon2.Text       := '';
     edtCnp2.Text        := '';
     dbeAuxDet.Text      := '';
end;

procedure TFReciboCaja.EditaRegistro;
begin
   BlanqueaEdits ( pnlActualiza );
   dblcdCnp22.Text:=DMTE.cdsRegCxC.fieldbyname('CPTOID').AsString;
   dbeNoReg.Text:=DMTE.cdsRegCxC.fieldbyname('CPNOREG').AsString;
   DMTE.cdsRegCxC.Edit;
   if trim( dblcdCnp22.Text ) <> '' then
      edtCnp2.Text := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOABR','CPTOID=''' + dblcdCnp22.Text + '''','CPTOABR');

   edtTMon2.Text  := edtTMonCab.Text;
   if not DMTE.cdsRegCxC.FieldByName('CCOSID').Isnull then
   begin
      if trim(DMTE.cdsRegCxC.FieldByName('CCOSID').AsString) <> ''
      then dblcdCCosto.Enabled := True
      else dblcdCCosto.Enabled := False;
   end
   else
      dblcdCCosto.Enabled := False;

   if trim( dblcdAuxDet.Text ) <> '' then
   begin
      dbeAuxDet.Text:=
           DMTE.DisplayDescrip('prvTGE','CNT201','AUXABR',
                              'CLAUXID = ''' +
                              DMTE.cdsRegCxC.fieldbyname('CLAUXID').AsString
                               + ''' AND AUXID=''' + dblcdAuxDet.Text + '''','AUXABR');
      edtClaseDet.Text:=
           DMTE.DisplayDescrip('prvTGE','TGE102','CLAUXABR',
                              'CLAUXID = ''' +
                              DMTE.cdsRegCxC.fieldbyname('CLAUXID').AsString + ''' ','clauxabr');

   end;

   dblcdAuxDet.Enabled := False;
   {if not DMTE.cdsRegCxC.FieldByName('PROV').Isnull then
   begin
      if trim(DMTE.cdsRegCxC.FieldByName('PROV').AsString) <> ''
      then dblcdAuxDet.Enabled := True
      else dblcdAuxDet.Enabled := False;
   end
   else
      dblcdAuxDet.Enabled := False;}

   pnlActualiza.SetFocus;
   perform(CM_DialogKey,VK_TAB,0);

   dblcClaseDet.Enabled:=False;
   //dblcClaseDet.Enabled  := dblcdAuxDet.Enabled;

   if not dblcClaseDet.Enabled then
   begin
      edtClaseDet.Text  := '';
      dbeAuxDet.Text := '';
   end
   else
      if not DMTE.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClaseDet.Text ]),[]) then
         Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''');
end;

procedure TFReciboCaja.Z2dbgDetPagoIButtonClick(Sender: TObject);
begin
  //pnlDetPago.Enabled  := False;
  pnlBotones.Enabled  := False;
  pnlActualiza.BringToFront;
  pnlActualiza.Visible:= True;
  IniciaPanel;
  adicionaRegistro;
end;

procedure TFReciboCaja.AdicionaRegistro;
var
	 aux,xWhere : string;
begin
  BlanqueaEdits ( pnlActualiza );

  With DMTE do
  begin
    dbeNoReg.Text:='';
    cdsRegCxC.Insert;
    cdsRegCxC.fieldbyname('CPNOREG').AsString := DMTE.strzero(GeneraCorrelativo( DMTE.cdsRegCxC , 'CPNOREG' ), 10);
    cdsRegCxC.fieldbyname('CIAID').AsString     := dblcCia.Text;
    cdsRegCxC.fieldbyname('DOCID2').AsString    := dblcTDoc.Text;
    cdsRegCxC.fieldbyname('CPSERIE').AsString   := dbeSerie.Text;
    cdsRegCxC.fieldbyname('CPNODOC').AsString   := dbeNoDoc.Text;
    cdsRegCxC.fieldbyName('TMONID').AsString := dblcTMonCab.Text;
    cdsRegCxC.FieldbyName('CPTOID').AsString := dblcdCnp.Text;
    cdsRegCxC.FieldbyName('CCTREC').AsString := 'RC';
    edtTMon2.Text         := edtTMonCab.Text;
    cdsRegCxC.fieldbyName('DETCDOC').AsString:= dbeTCambio.Text;
    cdsRegCxC.fieldbyname('DEDH').AsString   := 'H';     //Inicializo en haber
    xWhere:='FECHA='+wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFEmision.Date) +''')';
    aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
    cdsRegCxC.fieldbyname('DEANO').AsString  := cdsqry.FieldByName('FecAno').AsString;
    cdsRegCxC.fieldbyname('DEMM').AsString   := cdsqry.FieldByName('FecMes').AsString;
    cdsRegCxC.fieldbyname('DEDD').AsString   := cdsqry.FieldByName('FecDia').AsString;
    cdsRegCxC.fieldbyname('DESS').AsString   := cdsqry.FieldByName('FecSS').AsString;
    cdsRegCxC.fieldbyname('DESEM').AsString  := cdsqry.FieldByName('FecSem').AsString;
    cdsRegCxC.fieldbyname('DETRI').AsString  := cdsqry.FieldByName('FecTrim').AsString;
    cdsRegCxC.fieldbyname('DEAASS').AsString := cdsqry.FieldByName('FecAASS').AsString;
    cdsRegCxC.fieldbyname('DEAASem').AsString:= cdsqry.FieldByName('FecAASem').AsString;
    cdsRegCxC.fieldbyname('DEAATri').AsString:= cdsqry.FieldByName('FecAATri').AsString;
  end;

  dbeNoReg.Enabled     := True;
  dblcClaseDet.Enabled := False;
  dblcdAuxDet.Enabled  := False;
  dblcdCCosto.Enabled  := False;

  pnlActualiza.SetFocus;
  perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFReciboCaja.Z2bbtnOKDetClick(Sender: TObject);
begin
   // VALIDA LA CUENTA DEL CONCEPTO
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,dblcdCnp22.text,'')) and (dblcTMon2.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+DMTE.cdsQry.FieldByName('CUENTAID').AsString+' del Concepto '+dblcdCnp22.text+' Se registra sólo en Moneda Extranjera.');
   end;

   if DMTE.cdsRegCxC.State=dsInsert then
       if EncuentraDuplicado(DMTE.cdsRegCxC,'CPNoReg',dbeNoReg.Text) then
          begin
            ShowMessage('Numero de Registro duplicado');
            dbeNoReg.SetFocus;
            exit;
          end;
//     BuscaNRecibo;
       DMTE.cdsRegCxC.fieldbyname('DENUMREG').AsString := dbeNoDoc.text;
       DMTE.cdsRegCxC.fieldbyname('DEDH').AsString := dbeDH.text;
       edNumReg.text :=  DMTE.cdsRegCxC.fieldbyname('DENUMREG').AsString;
       //**
       DMTE.cdsRegCxC.fieldbyname('CPTOID').AsString := dblcdCnp22.text;
       DMTE.cdsRegCxC.fieldbyname('CPFEMIS').AsDateTime := dbdtpFEmision.Date ;
       DMTE.cdsRegCxC.fieldbyname('DEFCOMP').AsDateTime := dbdtpFEmision.Date ;              
       DMTE.cdsRegCxC.fieldbyname('CCOSID').AsString := dblcdCCosto.text;
       DMTE.cdsRegCxC.fieldbyname('TMONID').AsString := dblcTMon2.text;
       //**
      if not dblcdAuxDet.Enabled then
       begin
         DMTE.cdsRegCxC.FieldByName('PROV').AsString    := '';
         DMTE.cdsRegCxC.FieldByName('CLAUXID').AsString := '';
         edtClaseDet.Text  := '';
         dbeAuxDet.Text := '';
       end
      else
       begin
        DMTE.CdsRegCxC.FieldByName('CLAUXID').AsString := dblcClaseDet.Text;
        DMTE.CdsRegCxC.FieldByName('PROV').AsString := dblcdAuxDet.Text;
        //**
       end;
      //**
   if not ValidaCampo then
      ShowMessage('No se puede grabar')
   else
   begin
      cdsPost( DMTE.cdsRegCxC );

      DMTE.cdsRegCxC.Post;
      wModifica:=True;
      //
      if not dbeNoReg.Enabled then
      begin
           pnlActualiza.SetFocus;
           PnlActualiza.Visible := False;
           //pnlDetPago.Enabled   := True;
           pnlBotones.Enabled   := True;
           z2bbtnSumatClick(sender);    // Al salir hay que totalizar
      end
      else
      begin
           adicionaRegistro;
      end;
      //
   end;
end;

function TFReciboCaja.ValidaCampo: Boolean;
var
   xWhere,
   aux :string;
begin
     Result:=True;
     with DMTE do begin

        if length(cdsRegCxC.FieldByname('CPNOREG').AsString)=0 then begin  //No Registro
           ShowMessage('Falta No Registro');
           Result:=False;
           exit;
        end
        else begin
           if length(cdsRegCxC.FieldByname('CPNOREG').AsString)<6 then
            begin
              ShowMessage('Codigo de Registro Errado');
              Result:=False;
              exit;
            end;
        end;

        if cdsRegCxC.FieldByname('DEMTOORI').AsFloat<=0 Then begin   //Importe
           ShowMessage('Importe debe ser mayor que cero');
           Result:=False;
           exit;
        end;

        if cdsRegCxC.FieldByname('CPTOID').AsString='' then begin      //Concepto
           ShowMessage('Falta Concepto');
           Result:=False;
           exit;
        end
        else begin                             // Cuenta
           aux:= DMTE.cdsRegCxC.FieldByname('CUENTAID').AsString;
           if length(aux)=0 then begin
              ShowMessage('Codigo de Concepto Errado');
              Result:=False;
              exit;
           end;
        end;

        //Validación de centro de costo y auxiliares
        if (dblcdCCosto.Enabled) then
        begin  //Centro de Costo
          IF (length(cdsRegCxC.fieldbyname('CCOSID').AsString)=0) THEN
          BEGIN
              ShowMessage('Falta Centro de Costo');
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
              Result:=False;
              exit;
           end;
          end;
        end;

        if (dblcClaseDet.Enabled) then
        begin

          IF trim( dblcClaseDet.Text ) = '' THEN
          BEGIN
              ShowMessage('Ingrese Clase');
              Result:=False;
              exit;
          END;

          IF trim( dblcdAuxDet.Text ) = '' THEN
          begin
              ShowMessage('Ingrese Auxiliar');
              Result:=False;
              exit;
          END

        end;

//fin de validaciones

        if length(cdsRegCxC.fieldbyname('DEDH').AsString)=0 then
         begin
           ShowMessage('Falta especificar Debe / Haber');
           Result:=False;
           exit;
         end;
    end; {DMTE}
end;

procedure TFReciboCaja.Z2bbtnCancelDetClick(Sender: TObject);
begin
     if DMTE.cdsRegCxC.State = dsInsert then begin
        DMTE.cdsRegCxC.Delete;
//        dbeContador.Text:=inttostr(strtoint(dbeContador.Text)-1); //Decrementamos en uno
     end
     else
     begin
        DMTE.cdsRegCxC.Cancel;
     end;
     pNLaCTUALIZA.SetFocus;
     PnlActualiza.Visible := False;
     //pnlDetPago.Enabled   := True;
     pnlBotones.Enabled   := True;
     Z2bbtnSumatClick(sender);    // Al salir hay que totalizar
end;

procedure TFReciboCaja.dblcdCnp22Exit(Sender: TObject);
var  xwhere, sTmp : string ;
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
    edtCnp2.Text := sTmp;
    if Trim(edtCnp2.Text) = '' then
    begin
      DMTE.cdsRegCxC.FieldByName('CUENTAID').AsString := '' ;
      dblcdAuxDet.Enabled := False ;
      dblcdCCosto.Enabled := False ;
      dbeAuxDet.text :='';
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
             dblcdCCosto.Enabled:=true;
             dblcdCCosto.SetFocus;
          end
          else
             dblcdCCosto.Enabled := False ;

          if DMTE.cdsQry.fieldbyName('CTA_AUX').asString = 'S' then
            dblcdAuxDet.Enabled := False //dblcdAuxDet.Enabled := True
          else
            dblcdAuxDet.Enabled := False ;
        end
     end;
     //dblcClaseDet.Enabled :=  dblcdAuxDet.Enabled   ;
     dblcClaseDet.Enabled :=  False   ;

     if dblcClaseDet.Enabled then dblcClaseDet.SetFocus;

     if trim(edtCnp2.Text) <> '' then
     begin
        if not (DMTE.cdsQry.fieldbyName('CTA_AUX').asString = 'S') then
        begin
           DMTE.cdsRegCxC.FieldByName('PROV').AsString    := '' ;
           DMTE.cdsRegCxC.FieldByName('CLAUXID').AsString := '' ;
           edtClaseDet.Text  := '' ;
           dbeAuxDet.Text := '' ;
        end
        else begin
           DMTE.cdsRegCxC.FieldByName('PROV').AsString    := DMTE.cdsAux.fieldbyname('AUXID').AsString;
           DMTE.cdsRegCxC.FieldByName('CLAUXID').AsString := DMTE.cdsClaseAux.fieldbyname('CLAUXID').AsString;
           edtClaseDet.Text:= edtClase.text;
           xdescrip := 'CLAUXID='''+DMTE.cdsRegCxC.FieldByName('CLAUXID').AsString+''' AND  AUXID='+quotedstr(dblcdAuxDet.text);
           dbeAuxDet.text := DMTE.displaydescrip('prvTGE','CNT201','AUXNOMB',xDescrip,'AUXNOMB');
        end;

        if not dblcdCCosto.Enabled then
          DMTE.cdsRegCxC.FieldByName('CCOSID').AsString := '' ;
     end;
   end;
end;

procedure TFReciboCaja.dblcClaseDetExit(Sender: TObject);
begin
   xDescrip := 'CLAUXID='+quotedstr(dblcClaseDet.text);
   edtClaseDet.text := DMTE.displaydescrip('prvTGE','TGE102','CLAUXDES',xDescrip,'CLAUXDES');
   dblcdAuxDet.Enabled := True;
   wModifica := TRUE;
end;

procedure TFReciboCaja.dbeDHChange(Sender: TObject);
begin
     if not ((dbeDH.Text='D') or (dbeDH.Text='H') or (length(dbeDH.Text)=0)) then
      dbeDH.Text:='';
end;

procedure TFReciboCaja.dblcdAuxDetExit(Sender: TObject);
begin
 xdescrip := 'AUXID='+quotedstr(dblcdAuxDet.text);
 dbeAuxDet.text := DMTE.displaydescrip('prvTGE','CNT201','AUXNOMB',xDescrip,'AUXNOMB');
 wModifica := True;
end;

procedure TFReciboCaja.dbeAuxDetChange(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFReciboCaja.dbeImporte2Exit(Sender: TObject);
begin
      if  Z2bbtnCanceldet.Focused then  exit;
      DMTE.cdsRegCxC.fieldbyname('DEMTOORI').AsString := dbeImporte2.Text;
      if dblcTMonCab.Text = DMTE.wTMonLoc then
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

procedure TFReciboCaja.dblcTMon2Exit(Sender: TObject);
begin
   xDescrip :='TMONID='+''''+dblcTMon2.Text+'''';
   edtTMon2.Text :=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xDescrip,'TMONDES');
end;

procedure TFReciboCaja.InsertaRegistroCxC;
begin
  DMTE.cdsDetCanjeCxC.Insert;
  DMTE.cdsDetCanjeCxC.FieldByName('CIAID').AsString    := dblcCia.text;
  DMTE.cdsDetCanjeCxC.FieldByName('CLIEID').AsString   := dblcdAux.text;
  DMTE.cdsDetCanjeCxC.FieldByName('CLIERUC').AsString  := edtAuxRuc.text;
  DMTE.cdsDetCanjeCxC.FieldByName('DOCID').AsString    := DMTE.cdsCanjeCxCDoc.FieldByName('DOCID').AsString;
  DMTE.cdsDetCanjeCxC.FieldByName('CCSERIE').AsString  := DMTE.cdsCanjeCxCDoc.FieldByName('CCSERIE').AsString;
  DMTE.cdsDetCanjeCxC.FieldByName('CCNODOC').AsString  := DMTE.cdsCanjeCxCDoc.FieldByName('CCNODOC').AsString;
  DMTE.cdsDetCanjeCxC.FieldByName('CCNOREG').AsString  := DMTE.cdsCanjeCxCDoc.FieldByName('CCNOREG').AsString;
  DMTE.cdsDetCanjeCxC.FieldByName('TCANJEID').AsString := 'RC'; //RECIBO DE CAJA
  DMTE.cdsDetCanjeCxC.FieldByName('CCCANJE').AsString  := '000';
  DMTE.cdsDetCanjeCxC.FieldByName('CCFCANJE').AsDateTime:= dbdtpFEmision.Date;
  DMTE.cdsDetCanjeCxC.FieldByName('DOCID2').AsString   := DMTE.cdsIngDocs.FieldbyName('DOCID').AsString;
  DMTE.cdsDetCanjeCxC.FieldByName('CCSERIE2').AsString := DMTE.cdsIngDocs.FieldbyName('CCSERIE').AsString;
  DMTE.cdsDetCanjeCxC.FieldByName('CCNODOC2').AsString := DMTE.cdsIngDocs.FieldbyName('CCNODOC').AsString;
  DMTE.cdsDetCanjeCxC.FieldByName('TMONID').AsString   := dblcTMonCab.Text;

  if dblcTMonCab.Text=DMTE.wTMonLoc then
    DMTE.cdsDetCanjeCxC.FieldByName('DCCMTOORI').AsFloat := DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').AsFloat
  else
    DMTE.cdsDetCanjeCxC.FieldByName('DCCMTOORI').AsFloat := DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').AsFloat;

  DMTE.cdsDetCanjeCxC.FieldByName('DCCMTOLOC').AsFloat := DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').AsFloat;
  DMTE.cdsDetCanjeCxC.FieldByName('DCCMTOEXT').AsFloat := DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').AsFloat;
  DMTE.cdsDetCanjeCxC.FieldByName('DCCUSER').AsString  := DMTE.wUsuario;
  DMTE.cdsDetCanjeCxC.FieldByName('DCCFREG').AsDateTime:= DateS;
  DMTE.cdsDetCanjeCxC.FieldByName('DCCHREG').AsDateTime:= Time;
  DMTE.cdsDetCanjeCxC.FieldByName('DCCTCAMB').AsFloat  := StrToFloat(dbeTCambio.text);

  if DMTE.BuscaFecha('TGE114','Fecha','FECHA',dbdtpFEmision.Date) then
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
  DMTE.cdsDetCanjeCxC.Post;
  DMTE.AplicaDatos(DMTE.cdsDetCanjeCxC,'DETCANJECXC');
end;

procedure TFReciboCaja.dblcBancoExit(Sender: TObject);
begin
   if dblcCia.Focused then Exit;

   edtBanco.text := DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr,'BANCOID',dblcBanco.Text,'BANCOABR');

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
  dblcTMonCab.Text := '' ;
  edtTMonCab.Text  := '' ;
  if DMTE.cdsbancoegr.FieldByName('BCOTIPCTA').Value='C' then
  begin //Si es CAJA
     edtPeriodo.text:=copy(datetostr(dbdtpFEmision.date),7,4)
                     +copy(datetostr(dbdtpFEmision.date),4,2);
     dbdtpFEmis.date:= dbdtpFEmision.date;

     // SE CAMBIA A DIARIO DE INGRESOS
     //dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco.text),'CCBCOVOUCH');
     dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBVOUING','CIAID='+QuotedStr(dblcCia.text)+' AND BANCOID='+quotedstr(dblcBanco.text),'CCBVOUING');
     dblcTDiario.OnExit(dblcTDiario);
     dblcCCBco.Enabled:=False;
     dblcTMonCab.Enabled := True ;
     edtCuenta.Text := DMTE.DisplayDescrip('prvTGE','TGE105','CUENTAID','BANCOID='+quotedstr(dblcBanco.text),'CUENTAID');
     DMTE.cdsFormPago.Filter := 'FEFE=''1'' or FEFE=''S'' ' ;
  	  DMTE.cdsFormPago.Filtered := True ;
     if DMTE.cdsFormPago.recordcount=1 then
     begin
        dblcFormPago.Text := DMTE.cdsFormPago.fieldbyname('FPAGOID').AsString;
        dblcFormPago.OnExit(Self);
     end;
  	  dbeNoChq.Enabled  :=False;
  	  dbdtpFEmis.Enabled:=False;
     dbdtpFEmision.SetFocus;
  end
  else begin  //Si es BANCO
     dblcCCBco.Enabled:=True;
     dblcTMonCab.Enabled := False ;
     dblcFormPagoCab.Enabled := False ;
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
		 dblcFormPagoCab.Enabled := True;
     dblcFormPagoCab.text := '' ;
     edtFormPagoCab.text := '' ;
  end
  else
     dblcFormPagoCab.Enabled := False;

  dblcFormPagoCab.text := DMTE.cdsFormPago.FieldByName('FPAGOID').AsString;
  dbeNoChq.Text := '' ;
  wmodifica:=True;

end;

procedure TFReciboCaja.dblcTDiarioExit(Sender: TObject);
var xWhere:string;
begin
   edtTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE104','TDIARDES','TDIARID='+quotedstr(dblcTDiario.text),'TDIARDES');
   if trim(edtTDiario.Text) <> '' then
   begin
      xWhere:='CIAID='+quotedstr(dblcCia.Text)+' AND ECANOMM='+quotedstr(edtPeriodo.Text)
             +' AND TDIARID='+ quotedstr(dblcTDiario.Text); // + ' AND EC_PROCE='+quotedstr('B');
      dbeNoComp.text:=DMTE.UltimoNum('prvCaja','CXC303','ECNOCOMP',xWhere);
      dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsIngDocs.FieldByName('ECNOCOMP').Size);
   end ;

end;

procedure TFReciboCaja.dblcCCBcoExit(Sender: TObject);
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

	 dblcTmonCab.Text := DMTE.cdsCCBco.fieldbyname('TMONID').AsString ;
	 edtTMonCab.Text  := DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMonCab.text,'TMONDES') ;
	 dbeNOChq.Text := '' ;

   edtCuenta.Text:= DMTE.cdsCCBco.fieldbyname('CTAPRINC').AsString ;
   dblcdCnp.Text := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID','CPTOID='+quotedstr(DMTE.cdsCCBco.fieldbyname('CPTOID').AsString),'CPTOID');
   dbeGlosa.Text := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTODES','CPTOID='+quotedstr(dblcCCBco.text),'CPTODES');  //  DMTE.cdsCCBcoLKGLOSA.AsString ;
   //xVoucher      := DMTE.cdsCCBco.fieldbyname('CCBCOVOUCH').AsString;
   xVoucher      := DMTE.cdsCCBco.fieldbyname('CCBVOUING').AsString;
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

procedure TFReciboCaja.dbeNoCompEnter(Sender: TObject);
var
   xWhere : String;
begin
   if trim(edtTDiario.Text) <> '' then
   begin
      xWhere:='CIAID='+quotedstr(dblcCia.Text)+' AND ECANOMM='+quotedstr(edtPeriodo.Text)
             +' AND TDIARID='+ quotedstr(dblcTDiario.Text); // + ' AND EC_PROCE='+quotedstr('B');
      dbeNoComp.text:=DMTE.UltimoNum('prvCaja','CXC303','ECNOCOMP',xWhere);
      dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsIngDocs.FieldByName('ECNOCOMP').Size);
   end ;

end;

procedure TFReciboCaja.dbeNoCompExit(Sender: TObject);
begin
   dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsIngDocs.FieldByName('ECNOCOMP').Size);
end;

procedure TFReciboCaja.z2bbtnOKCab1Click(Sender: TObject);
var
   xWhere : String;
   xSQL   : string;
begin
{   if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, dblcCCBco.text, dbdtpFEmision.Date ) then
   begin
      Showmessage('Error : Mes de Fecha Fue Cerrado. Verificar...');
      dbdtpFEmision.SetFocus;
      Exit;
   end;

    if not DiaAperturado(dblcCia.text,dbdtpFEmision.Date,dblcBanco.text) then
    Begin
      dbdtpFEmision.setfocus;
      Exit;
    End;}

   if dbdtpFEmision.Date=0 then
   begin
     ShowMessage('Fecha de Comprobante Errada');
     dbdtpFEmision.SetFocus;
     Exit;
   end;

   if validacionCabecera = False then
      exit;

   dbeTCambio.Text   := DMTE.RecuperarTipoCambio(dbdtpFEmision.date) ;
   with DMTE do
   begin
      xWhere :=  'CIAID ='+quotedstr(dblcCia.Text)
      +' AND TDIARID ='+quotedstr(dblcTDiario.Text)
      +' AND ECANOMM ='+quotedstr(edtPeriodo.Text)
      +' AND ECNOCOMP ='+quotedstr(dbeNoComp.Text);
      if DisplayDescrip('prvTGE','CXC303','COUNT(*) TOTREG',xWhere,'TOTREG')>'0' then
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

{         ActivaFiltro('REGCXP')  ;
         ActivaFiltro('DOCPAGO') ;
        //0805
        //liberamos el filtro del detalle
         DMTE.cdsRegCxP.Filtered := False ;}

         CambiaEstado('N');
      end;
   end;
   (Sender as tcontrol).enabled:=false;
   perform(CM_DialogKey,VK_TAB,0);
   wmodifica:=False;

end;

function TFReciboCaja.ValidacionCabecera: Boolean;
begin
     result:=false;
     if trim(dblccia.text)='' then
     begin

     end;
     if dbdtpFEmision.Date=0 then
     begin
          ShowMessage('Ingrese Fecha de Comprobante');
          dbdtpFEmision.SetFocus;
          exit;
     end;
     if trim(edtPeriodo.text)='' then
     begin
          ShowMessage('Ingrese Fecha de Comprobante');
          dbdtpFEmision.SetFocus;
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

procedure TFReciboCaja.GrabaCabeceraDeComprobante;
var xSQL:string;
begin

    DMTE.cdsIngDocs.CancelUpdates;
    DMTE.cdsIngDocs.Insert;
    DMTE.cdsIngDocs.FieldByName('NCOESTADO').AsString := 'X';
    DMTE.cdsIngDocs.FieldByName('CIAID').AsString     := dblcCia.Text;
    DMTE.cdsIngDocs.FieldByName('ECANOMM').AsString   := edtPeriodo.Text;
    DMTE.cdsIngDocs.FieldByName('TDIARID').AsString   := dblcTDiario.Text;
    DMTE.cdsIngDocs.FieldByName('ECNOCOMP').AsString  := dbeNoComp.Text;
    DMTE.cdsIngDocs.FieldbyName('CCTREC').AsString     := 'RC'                 ;
    cdspost(DMTE.cdsIngDocs);
    DMTE.AplicaDatos( DMTE.cdsIngDocs, 'INGDOCS' );

{    xSQL:='Select * from CXC303 '
    			+'Where CIAID='''   +dblcCia.Text    +''' and '
    			+      'ECANOMM=''' +edtPeriodo.Text +''' and '
    			+      'TDIARID=''' +dblcTDiario.Text+''' and '
    			+      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
    DMTE.cdsIngDocs.DataRequest( xSQL );}
//    DMTE.AplicaDatos( DMTE.cdsIngDocs, 'INGDOCS' );

end;

Procedure TFReciboCaja.CambiaEstado(xName:char);
begin
	 case xName of
		 'I':begin  //Si está INCOMPLETO o PENDIENTE
            lblEstadoMov.Caption    :='Activo             ';
            pnlCabecera1.Enabled := False;
            pnlCabecera.Enabled := True;
            z2bbtnOkCab.Enabled       := True;
            z2bbtnCancelCab.Enabled   := True;

//2804
            dbgPendientes.ReadOnly :=false ;
            dbgDocCanje.ReadOnly    :=False ;
            dbgDetPago.ReadOnly      :=False ;
            dbgDetFPago.ReadOnly      :=False ;
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
         end;

     'C':begin
            pnlCabecera1.Enabled := False;    // Desactivar Panel1
            pnlCabecera.Enabled := False;    // Desactivar Panel2
            pnlDetalle.Enabled   := True;     // Activar Panel de Detalle
            pnlBotones.Enabled   := True;     // Activar Panel de Botones

            dbgPendientes.ReadOnly :=True ;
            dbgDocCanje.ReadOnly   :=True ;
            dbgDetPago.ReadOnly    :=True ;
            dbgDetFPago.ReadOnly   :=True ;

            z2bbtnOkCab.Enabled       := False;
            z2bbtnCancelCab.Enabled   := False;

            if DMTE.cdsEgrCaja.FieldByName('ECConta').Value='S' then
            begin  //Esta contabilizado
               wbCont             := False;
               lblEstadoMov.Caption  :='Cancelado y Contab.';
               wbAnula            := False;
            end
            else
            begin
               wbCont             := True;
               lblEstadoMov.Caption  :='Cancelado          ';
               wbAnula            := True;
            end;
            wbSumat     := False;
            wbNuevo     := True;
            wbImprime   := True;
            wbSube      := False;
            wbGraba     := False;
            wbCancelado := False;
            wbCancel2   := False;
         end;

     'A':begin
            lblEstadoMov.Caption     :='Anulado            ';
            pnlCabecera1.Enabled := False;    // Desactivar Panel1
            pnlCabecera.Enabled := False;    // Desactivar Panel2
            pnlDetalle.Enabled   := True;     // Activar Panel de Detalle
            pnlBotones.Enabled   := True;     // Activar Panel de Botones

            dbgPendientes.ReadOnly :=True ;
            dbgDocCanje.ReadOnly   :=True ;
            dbgDetPago.ReadOnly    :=True ;
            dbgDetFPago.ReadOnly   :=True ;

            z2bbtnOkCab.Enabled        := False;
            z2bbtnCancelCab.Enabled    := False;

            wbSumat     := False;
            wbCont      := False;
            wbNuevo     := True;
            wbImprime   := True;
            wbSube      := False;
            wbGraba     := False;
            wbCancelado := False;
            wbCancel2   := False;
            wbAnula     := False;
         end;

     'N':begin
            lblEstadoMov.Caption:='Nuevo     ';
            pnlCabecera1.Enabled := True;
            pnlCabecera.Enabled := False;
//2804
            dbgPendientes.ReadOnly :=False ;
            dbgDocCanje.ReadOnly   :=False ;
            dbgDetPago.ReadOnly    :=False ;
            dbgDetFPago.ReadOnly   :=False ;

//
            z2bbtnOkCab.Enabled       := True;
            z2bbtnCancelCab.Enabled   := True;

            wbSumat     := True;
            wbCont      := False;
            wbImprime   := False;
            wbNuevo     := False;
            wbSube      := True;
            wbGraba     := True;
            wbCancelado := False;
            wbCancel2   := True;
            wbAnula     := False;

         end;
   end;
end;


procedure TFReciboCaja.dblcFormPagoCabExit(Sender: TObject);
begin
   if z2bbtnCancelCab.Focused then exit;
   if dblcTMonCab.Focused then exit;

   edtFormPagoCab.text:= DMTE.DisplayDescripLocal(DMTE.cdsFormPago,'FPAGOID',dblcFormPagoCab.Text,'FPAGODES') ;

   if dblcFormPagoCab.Text='' then begin
      dbeNoChqCab.Text :='';
      ShowMessage('Error : Forma de Pago no Valida');
      dblcFormPagoCab.SetFocus;
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
   end;

   if (DMTE.cdsFormPago.FieldByName('FCHQ').AsString='1') or
      (DMTE.cdsFormPago.FieldByName('FCHQ').AsString='S') then
   begin
      dbeNoChqCab.Enabled  :=True  ;
      dbdtpFEmis.Enabled:= True ;
      dbeNoChqCab.SetFocus;
   end
   else
   begin
      dbeNoChqCab.Enabled  := False;
      dbdtpFEmis.Enabled:= False ;
   end;

end;

procedure TFReciboCaja.ValidaCabecera2;
begin
   if length(dblcCia.Text)=0 then raise exception.Create('Falta Codigo de Compañia');
   if length(edtCia.Text)=0 then raise exception.Create('Codigo de Compañia Errado');
   if length(dblcTDiario.Text)=0 then raise exception.Create('Falta Tipo de Diario');
   if length(edtTDiario.Text)=0 then raise exception.Create('Tipo de Diario Errado');

   if length(dbeGiradoA.Text)=0 then raise exception.Create('Datos del Auxiliar Errados');

   if length(dblcTMonCab.Text)=0 then raise exception.Create('Falta Tipo de Moneda');
   if length(edtTMonCab.Text)=0 then raise exception.Create('Codigo de Moneda Errado');
   if length(dbeTCambio.Text)=0 then raise exception.Create('Falta Tipo de Cambio')
   else
      if strtofloat(dbeTCambio.Text)<=0 then raise exception.Create('Tipo de Cambio Errado');


   if length(dblcBanco.Text)=0 then raise exception.Create('Falta definir Caja/Banco');
   if length(edtBanco.Text)=0 then raise exception.Create('Codigo de Caja/Banco Errado');

   if dblcCCBco.Enabled=True then
   begin
      if length(dblcCCBco.Text)=0 then raise exception.Create('Falta Cuenta Corriente Banco');
      IF dbdtpFEmis.Date = 0 then
      begin
         dbdtpFEmis.SetFocus ;
				 raise exception.create('Ingrese Fecha de Emisión del Cheque') ;
			end ;

   end;

   if dblcFormPagoCab.Enabled=True then
   begin
      if length(dblcFormPagoCab.Text)=0 then raise exception.Create('Falta Forma de Pago');
      if length(edtFormPagoCab.Text)=0 then raise exception.Create('Codigo de Forma de Pago Errado');
   end;

   if (dbeNoChqCab.Enabled=True) and (length(dbeNoChqCab.Text)=0) then
      raise exception.Create('Falta No. de Cheque');

   if (dbdtpFeMis.Enabled=True) and (dbdtpFeMis.Date=0) then
      raise exception.Create('Falta Fecha de Emisión del Cheque');

//   if length(dbeLote.Text)=0 then raise exception.Create('Falta Lote');
   if length(dblcdCnp.Text)=0 then raise exception.Create('Falta Concepto');
end;


procedure TFReciboCaja.pprReciboBeforePrint(Sender: TObject);
var
  Year, Month, Day: Word ;
  xsql : String ;
  xmoneda,xMes : String ;
  xconver : double;
begin
   if DMTE.wRptCia='Dema' then begin
//      DMTE.cdsTMon.Locate('TMONID', DMTE.cdsqry.fieldbyname('TMONID').AsString,[]);
      DMTE.cdsTMon.Locate('TMONID', dblcTMonCab.Text,[]);
      if dblcTMonCab.Text = DMTE.wTMonExt then
// Inicio HPC_201601_CAJA
// Se cambia valor fijo para descripción de moneda por uso de variable que se carga de tabla de Tipos de Monedas
         xMoneda := DMTE.wTMonExtDes
//         xmoneda := 'Dolares'
      else
         xMoneda := DMTE.wTMonLocDes;
//         xmoneda := 'Nuevos Soles';
// Fin HPC_201601_CAJA
      xconver := DMTE.cdsqry.fieldbyname('NCOMTOORI').asFloat;
      pplbValor.Caption:= DMTE.cdsTMon.fieldbyname('TMONABR').AsString + ' '
                        + FloatToStrF(xconver,ffNumber,12,2);
      ppLbDescrip.Caption:='La cantidad de '+trim(NumtoStr(xconver)) +' '+xmoneda;
   end
   else begin
      //** 11/01/2001 - pjsv
// Inicio HPC_201601_CAJA
//    Se cambia valor fijo para descripción de moneda por uso de variable que se carga de tabla de Tipos de Monedas
      xMoneda := DMTE.wTMonLocDes;
//      xmoneda := 'Nuevos Soles';
// Fin HPC_201601_CAJA      
      DMTE.cdsTMon.Locate('TMONID',DMTE.wTMonLoc,[]);
      xconver := DMTE.cdsqry.fieldbyname('NCOMTOORI').asFloat * StrToFloat(dbeTCambio.text);
      if DMTE.cdsqry.fieldbyname('TMONID').AsString = DMTE.wTMonExt then
      begin
         if DMTE.wRptCia='JCP' then
         begin
            DMTE.cdsTMon.Locate('TMONID',DMTE.wTMonLoc,[]);
            xconver := DMTE.FRound(DMTE.cdsqry.fieldbyname('NCOMTOORI').asFloat * StrToFloat(dbeTCambio.text),15,2);
         end
         else
         begin
            DMTE.cdsTMon.Locate('TMONID',DMTE.cdsqry.fieldbyname('TMONID').AsString,[]);
            xconver := DMTE.cdsqry.fieldbyname('NCOMTOORI').asFloat;
         end;

         pplbValor.Caption:= DMTE.cdsTMon.fieldbyname('TMONABR').AsString + ' '
                           + FloatToStrF(xconver,ffNumber,12,2);
         ppLbDescrip.AutoSize := false;
         ppLbDescrip.Width := 165;
         ppLbDescrip.Caption:='La cantidad de '+trim(NumtoStr(xconver)) +' '+xmoneda;
         ppLbDescrip.WordWrap := true;
         ppLbDescrip.AutoSize := true;
      end
      else begin
            if DMTE.wRptCia='JCP' theN
            begin
               DMTE.cdsTMon.Locate('TMONID',DMTE.wTMonLoc,[]);
               xconver := DMTE.cdsqry.fieldbyname('NCOMTOORI').asFloat ;
            end
            else
            begin
               DMTE.cdsTMon.Locate('TMONID',DMTE.cdsqry.fieldbyname('TMONID').AsString,[]);
               xconver := DMTE.FRound(DMTE.cdsqry.fieldbyname('NCOMTOORI').asFloat,15,2);
            end;
//         xconver := DMTE.cdsqry.fieldbyname('NCOMTOORI').asFloat;
         pplbValor.Caption:= DMTE.cdsTMon.fieldbyname('TMONABR').AsString + ' '
                           + FloatToStrF(xconver,ffNumber,12,2);
         ppLbDescrip.Caption:='La cantidad de '+trim(NumtoStr(xconver)) +' '+xmoneda;
      end;
   end;
   //**
   ppLbDescrip1.AutoSize := false;
   ppLbDescrip1.Width := 165;
	ppLbDescrip1.Caption:='Por Concepto de '+DMTE.cdsqry.fieldbyname('CCGLOSA').AsString;
                         DecodeDate(DMTE.cdsqry.fieldbyName('CCFEMIS').AsDateTime, Year, Month, Day);
                         xsql := 'CIAID=' + QuotedStr(DMTE.cdsqry.fieldbyname('CIAID').AsString);
  ppLbDescrip1.WordWrap := true;
  ppLbDescrip1.AutoSize := true;

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

procedure TFReciboCaja.pprReciboPreviewFormCreate(Sender: TObject);
begin
  pprRecibo.PreviewForm.ClientHeight := 500;
  pprRecibo.PreviewForm.ClientWidth := 650;
  tppviewer(pprRecibo.PreviewForm.Viewer).zoomSetting := zspageWidth;

end;

procedure TFReciboCaja.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFReciboCaja.dblcCCBcoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.


unit Caja201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient, //libRLP,
  Wwdotdot,wwidlg, CAJADM, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  ComCtrls, ppPrnabl, ppCtrls, ppCache, ppBands, oaContabiliza, ppDB,
  ppDBPipe, ppTypes, Variants;

type
  TFEgresoCaja = class(TForm)
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
    dbeImporte2: TwwDBEdit;
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
    procedure dblcCiaExit(Sender: TObject);
    procedure edtProvRUCExit(Sender: TObject);
    procedure z2bbtnCancelClick(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure z2bbtnCalcClick(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcCCBcoExit(Sender: TObject);
    procedure dblcCnp2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure z2bbtnSumatClick(Sender: TObject);
    procedure z2bbtnSubeClick(Sender: TObject);
    procedure z2bbtnCancel2Click(Sender: TObject);
    procedure z2bbtnNuevoClick(Sender: TObject);
    procedure z2bbtnGrabaClick(Sender: TObject);
    procedure z2bbtnCanceladoClick(Sender: TObject);
    procedure z2bbtnContClick(Sender: TObject);
    procedure z2bbtnAnulaClick(Sender: TObject);
    procedure dbgDetPagoIButtonClick(Sender: TObject);
    procedure z2bbtnCancel3Click(Sender: TObject);
    procedure dbeNoRegExit(Sender: TObject);
    procedure z2bbtnOK2Click(Sender: TObject);
    procedure dblcTMon2Exit(Sender: TObject);
    procedure dblcTMon2Change(Sender: TObject);
    procedure dblcCnp2Change(Sender: TObject);
    procedure dbeImporte2Exit(Sender: TObject);
    procedure dbgDetPagoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeDHChange(Sender: TObject);
    procedure dbeLoteExit(Sender: TObject);
    procedure dblcdProvChange(Sender: TObject);
    procedure edtProvRUCChange(Sender: TObject);
    procedure dbeGiradoAChange(Sender: TObject);
    procedure dbeTCambioChange(Sender: TObject);
    procedure dbeImporteChange(Sender: TObject);
    procedure dbeNoDocChange(Sender: TObject);
    procedure dbeNoChqChange(Sender: TObject);
    procedure dbeLoteChange(Sender: TObject);
    procedure dbeGlosaChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure LookUpMostrado(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure NoEstaenLookUp(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure MensajeComboNoExit(DBLook:TwwDBCustomLookupCombo);
    procedure Validacion(Sender: TObject);
    procedure dblcTDocNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcTDocCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcCnpNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcCnpCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure InhabilitarPaneles;
    procedure dbgDetPagoDblClick(Sender: TObject);
    procedure dblcTDoc2Exit(Sender: TObject);
    procedure LiberarFiltrosRegistroEgresos;
    procedure EstablecerFiltrosRegistroEgresos;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
    procedure dblcBancoEnter(Sender: TObject);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblcClaseExit(Sender: TObject);
    procedure dblcdAuxExit(Sender: TObject);
    procedure Z2bbtnEmiChqClick(Sender: TObject);
    procedure dbeTCambioEnter(Sender: TObject);
    procedure dbeImporteEnter(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure dbeImporteExit(Sender: TObject);
    procedure dblcdAuxExit2(Sender: TObject);
    procedure dblcdCnp2Exit2(Sender: TObject);
    procedure wwDBEdit1Change22(Sender: TObject);
    procedure dblcClaseDetExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblcdFEfecExit(Sender: TObject);
    procedure dblcdFEfecEnter(Sender: TObject);
    procedure dblcdCnpExit(Sender: TObject);
    procedure dbeNoChqExit(Sender: TObject);
    procedure dblcdCCostoExit(Sender: TObject);
    procedure dblcdAuxDetEnter(Sender: TObject);
    procedure Z2bbtnRetencionClick(Sender: TObject);
    procedure dblcdCnpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Z2bbtChqVouchClick(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcBancoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcCCBcoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);

  private
    xNReg : Integer;
    xRUCCIA : string; // para el ruc de la compañia
    xchek : double;
    cdsConceptoC1 : TwwClientDataset ;
    strTmp: String;
    { Private declarations }
    A1 : Array of Integer ;
    A2 : Array Of TNotifyEvent ;
    A2digitos ,A4digitos : Array of TWinControl ;
    //
    cf1: TControlFoco;
    cdsFiltro   : TwwClientDataset;
    xGraboNuevo : Boolean ;
    wFechaCierre: TDatetime;
    wFrecu : Integer;
    xDebeT : Double;
    xHabeT : Double;
    xDebeTD: Double;
    xHabeTD: Double;
    xRetLoc,xRetExt:Double;
    xMtoLoc, xMtoExt: Double ;

    //** 04/06/2001-pjsv, para el nuevo dato (CCBCOVOUCH - TGE106 y CAJA302)
    xVoucher : String;
    //**
    // derrama vhn flag de detraccion
    xDetraccion : String;
    // derrama vhn
    Function ValidacionCabecera:Boolean;
    procedure ValidacionCabecera1 ;
    procedure ActPnlBotones;
    procedure AdicionarRegistros;
    procedure ConsisCancela(var xconsis:Boolean);
    procedure Contab_DifCambio;
    procedure Contab_DifCambio2;
    procedure Contab_EgrCaja;
    procedure IniciaDatos;
    procedure IniciaPanel;
    procedure Contab_RegCxP;
    function  ValidaCampo:Boolean;
    procedure AdicIniciaDatos;
    procedure ActualizaSaldosCaja ;
    procedure ConfiguraAccesos;
    procedure Proc_Admin;
    procedure Proc_Consul;
    procedure Libera_Admin;
    procedure Libera_Consul;
    procedure LibConfigAccesos;
    procedure EdiTarRegistros;
    procedure ActualizaFiltro ;
    procedure GrabaCabeceraDeComprobante;
//** 04/07/2001 pjsv
//    procedure ActSdoAuxiliar(const xCIAID, xANO, xMES, xCLAUXID, xAUXID,
//              MONTOMN, MONTOME, MTOSLOC, MTOSEXT, xOper: String);
//**
    function  ExisteRxH: boolean ; //Si existe Recibos por Honorarios para el Clauxid
    procedure ActualizaSaldosCxP301(ccPgoOri,ccPgoLoc,ccPgoExt,ccSalOri,ccSalLoc,ccSalExt : double; ccNodoc : string);
    procedure ActualizaSaldosTGE401(ccPgoOri,ccPgoLoc,ccPgoExt: double; sSigno : String);
    procedure BuscaNReposicion;
    procedure AsientoDifTotal;
    function GeneraRetencion:boolean;
		procedure Contab_DocPago_Retencion_Haber;
    procedure GeneraRegChqVouch;
  public
    { Public declarations }
    wCptoGan  ,
    wCptoPer  ,
    wCtaGan   ,
    wCtaPer   : String ;
    wCCosDif  : String ;
    procedure Contabiliza;
    procedure RecCptosDifC ;
    procedure Adiciona ;
    procedure Edita( cds : Twwclientdataset);

  end;

var
  FEgresoCaja: TFEgresoCaja;
  wbsumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,
  wbcancel2 , wbChq : Boolean;
  wModifica: Boolean;
  bFlagRecuperacion: Boolean;
  wTDocRxH : string;   //Flag p' almacenar el id del Tdocumento
  xEncuentra,wCiaRetIGV : boolean ; //Flag para RxHonorarios
  wSerie, wBcoTipCta  : string;
implementation

uses CAJAUTIL, oaTE2000, Caja290;
{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}

procedure TFEgresoCaja.IniciaDatos;
begin
   pnlCabecera1.Enabled  := True;
   pnlCabecera2.Enabled  := False;
   pnlDetPago.Enabled    := False;
   pnlBotones.Enabled    := False;

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
   z2bbtnSumat.Enabled     := False;
   z2bbtnCont.Enabled      := False;
   z2bbtnNuevo.Enabled     := False;
   z2bbtnImprime.Enabled   := False;
   z2bbtnSube.Enabled      := False;
   z2bbtnGraba.Enabled     := False;
   z2bbtnCancelado.Enabled := False;
   z2bbtnCancel2.Enabled   := False;
   z2bbtnAnula.Enabled     := False;

   dblcCia.Text      := '';   // Código de Compañía
   edtCia.Enabled    := False;
   edtCia.Text       := '';   // Descripción de la Compañía
   edtPeriodo.Enabled:= False;
   edtPeriodo.Text   := '';   // Periodo
   dblcTDiario.Text  := '';   // Tipo de Diario
   dbeNoComp.Text    := '';   // Comprobante

   edtClase.Enabled  := False;
   dblcdAux.Text     := '' ;    // Código de Proveedor
   edtAuxRUC.Text    := '' ;    // RUC del Proveedor
   dbeGiradoA.Text   := '' ;    // Pago Girado A ....
   edtAuxNombre.text := '';
   dblcTMon.Text     := '' ;   // Tipo de Moneda
   edtTMon.Enabled   := False ;
   edtTMon.Text      := '' ;   // Descripción de la Moneda
   dbeTCambio.Text   := '' ;   // Tipo de Cambio
   dbeImporte.Text   := '' ;   // Monto a pagar
   dblcTDoc.Text     := '' ;   // Tipo de Documento
   edtTDoc.Enabled   := False ;
   edtTDoc.Text      := '' ;   // Descripción del T.Doc
   dbeNoDoc.Text     := '' ;   // Nro.Documento
   dblcBanco.Text    := '' ;   // Código de Banco
   edtBanco.Enabled  := False ;
   edtBanco.Text     := '' ;   // Descripción de Banco
   dblcCCBco.Enabled := False ;
   dblcCCBco.Text    := '' ;   // Cuenta Corriente del Banco
   edtCuenta.Enabled := False ;
   edtCuenta.Text    := '' ;   // Descripción de la Cuenta Contable Principal
   dblcFormPago.Text := '' ;   // Forma de Pago
   edtFormPago.Enabled:= False ;
   edtFormPago.Text   := '' ;   // descripción de forma de pago
   dbeNoChq.Enabled   := False ;
   dbeNoChq.Text      := '' ;   // Cheque
   dbeLote.Text       := '000' ;   // Lote
   dblcdCnp.Text      := '' ;   // Concepto
   dbeGlosa.Text      := '' ;   // Glosa
   dbeFEfec.Text      := '' ;
   lblEstado.Caption  := '';   //Inicializar el Estado
   dbdtpFEmis.Date    := 0 ;
   dbeRepo.Text       := '';
   wModifica          := False;

   dbgDetPagoIButton.Enabled:=True;
   dbgDetPago.KeyOptions:=[dgEnterToTab];
   dbgDetPago.ColumnByName('DEMTOLOC').FooterValue:='';
   dbgDetPago.ColumnByName('DEMTOEXT').FooterValue:='';

   // Limpiando filtros si lo tuvieran
   DMTE.cdsRegCxP.Filtered :=False;

   z2bbtnOKCab.Enabled:=true;
end;

{*******************************************************
PRIMER PANEL - DATOS INICIALES DE LA CABECERA
*******************************************************}

procedure TFEgresoCaja.dblcCiaExit(Sender: TObject);
var
 xSQL : string;
begin
   edtCia.text:= DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIADES') ;
   wCiaRetIGV := (DMTE.cdsCia.FieldByName('CIARETIGV').AsString='S');
   if edtCia.Text='' then begin
      ShowMessage('Error : Compañía no Válida');
      dblcCia.SetFocus;
      Exit;
   end;

   xRUCCIA := DMTE.cdsCia.Fieldbyname('CIARUC').AsString;

end;

procedure TFEgresoCaja.dbdtpFCompExit(Sender: TObject);
var
   xWhere : String;
begin
   if dblcCia.Focused   then Exit;
   if dblcBanco.Focused then Exit;
   if dblcCCBco.Focused then Exit;

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

   xWhere := 'TMONID ='+QuotedStr(DMTE.wTMonExt)
            +' And FECHA ='+DMTE.wRepFuncDate+''''+FormatDateTime(DMTE.wFormatFecha, dbdtpFComp.Date)+''')';
   if Length(DMTE.DisplayDescrip('prvTGE', 'TGE107', 'TMONID, '+DMTE.wTipoCambioUsar, xWhere, 'TMONID'))=0 then
   begin
      ShowMessage('Tipo de Cambio No Registrado');
      dbdtpFComp.SetFocus;
      exit;
   end;

   if dbdtpFComp.Date=0 then
   begin
      ShowMessage('Fecha de Comprobante Errada');
      dbdtpFComp.SetFocus;
   end
   else
   begin
      if wFechaCierre <> 0 then
         if (TwwDBDateTimePicker(Sender).Date <= wFechaCierre )
            or (TwwDBDateTimePicker(Sender).Date > (wFechaCierre + wFrecu) ) then
         begin
            TwwDBDateTimePicker(Sender).SetFocus ;
            ShowMessage('Ingrese Fecha dentro del Rango'+#13+
                        'Fecha de Cierre  : ' + DateTimeToStr(wfechacierre) + #13+
                        'Frecuencia       : ' + IntToStr(wFrecu) ) ;
            Exit;
         end ;

      edtPeriodo.Text := Copy(DateToStr(dbdtpFComp.Date), 7, 4)
                        +Copy(DateToStr(dbdtpFComp.Date), 4, 2);
      dbdtpFEmis.Date := dbdtpFComp.Date;

      if Trim( dblcTDiario.Text) <> '' then
      begin
         xWhere := 'CIAID='+QuotedStr(dblcCia.Text)+' AND ECANOMM='+QuotedStr(edtPeriodo.Text)
                  +' AND TDIARID='+ QuotedStr(dblcTDiario.Text);
         dbeNoComp.Text := DMTE.UltimoNum('prvCaja', 'CAJA302', 'ECNOCOMP', xWhere);
         dbeNoComp.Text := DMTE.StrZero(dbeNoComp.Text, DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
      end;
   end;
end;

procedure TFEgresoCaja.dblcTDiarioExit(Sender: TObject);
var
   xWhere, xTmp :string;
begin
   xTmp := DMTE.DisplayDescrip('prvTGE','TGE104','TDIARDES','TDIARID='+QuotedStr(dblcTDiario.text),'TDIARDES');
   if xTmp<>'' then
   begin
      xWhere:='CIAID='+QuotedStr(dblcCia.Text)+' AND ECANOMM='+QuotedStr(edtPeriodo.Text)
             +' AND TDIARID='+ QuotedStr(dblcTDiario.Text); // + ' AND EC_PROCE='+QuotedStr('1');
      dbeNoComp.text:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text, DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size );
   end;
end;

procedure TFEgresoCaja.dbeNoCompExit(Sender: TObject);
begin
   dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
end;

{*******************************************************
SEGUNDO PANEL - DATOS ADICIONALES DE LA CABECERA
*******************************************************}




procedure TFEgresoCaja.edtProvRUCExit(Sender: TObject);
var
   xWhere,xTiene : string;
begin
   if Length(edtAuxRUC.Text)>0 then
   begin
      xWhere:='PROVRUC='+''''+edtAuxRUC.Text+'''';
      xTiene :=DMTE.DisplayDescrip('prvTGE','TGE201','PROVDES, PROV, PROVGIRA',xWhere,'PROVDES');
      if Length(xTiene)=0 then
         begin
            ShowMessage('Registro Unico de Proveedor Errado');
            edtAuxRUC.SetFocus;
         end
      else
      begin
         dblcdAux.Text:=DMTE.cdsqry.FieldByName('PROV').AsString;
         if Length(dbeGiradoA.Text)=0 then begin
            if Length(DMTE.cdsqry.FieldByName('PROVGIRA').AsString)=0 then
               dbeGiradoA.Text:=DMTE.cdsqry.FieldByName('PROVDES').AsString
            else begin
               dbeGiradoA.Text:=DMTE.cdsqry.FieldByName('PROVGIRA').AsString;
            end;
         end
      end;
   end;
end;

procedure TFEgresoCaja.dblcTMonExit(Sender: TObject);
var
   xWhere :String;
begin
   if z2bbtnCancel.Focused then exit;

   edtTMon.text:= DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMon.Text,'TMONDES') ;

   if edtTMon.Text='' then begin
      edtTmon.text   :='';
      dbeTCambio.Text:='';
      dblcTMon.Text  :='';
      ShowMessage('Error : Moneda no Válida');
      dblcTMon.SetFocus;
      Exit;
   end;
end;

procedure TFEgresoCaja.dblcTDocExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then exit;
   if dbeNoChq.Focused then exit;
   if dbdtpFEmis.Focused then exit;
   if edtCuenta.Focused then exit;
   if dblcFormPago.Focused then exit;

   edtTDoc.text:= DMTE.DisplayDescripLocal(DMTE.cdsTDoc,'DOCID',dblcTDoc.Text,'DOCDES') ;

   if edtTDoc.Text='' then begin
      ShowMessage('Error : Tipo de Documento no Valido');
      dblcTDoc.SetFocus;
      Exit;
   end;

   xEncuentra        := false;
   dbeNodoc.enabled  := true;
   dbeImporte.enabled:= true;
end;

procedure TFEgresoCaja.dblcBancoExit(Sender: TObject);
begin
   if dblcCia.Focused then Exit;

   edtBanco.Text := DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr, 'BANCOID', dblcBanco.Text, 'BANCOABR') ;

   if edtBanco.Text = '' then
   begin
      dblcBanco.Clear;
      edtBanco.Text  := '';
      ShowMessage('Error : Banco no Válido');
      dblcBanco.SetFocus;
      Exit;
   end;

   wBcoTipCta := DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').AsString;

   if DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').AsString='C' then
   begin //Si es CAJA
      dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+QuotedStr(dblcBanco.text),'CCBCOVOUCH');
      dblcTDiario.OnExit(dblcTDiario);
      dblcCCBco.Enabled:=False;
      dblcTMon.Enabled := True ;
      edtCuenta.Text := DMTE.DisplayDescrip('prvTGE','TGE105','CUENTAID','BANCOID='+QuotedStr(dblcBanco.text),'CUENTAID');
     //** 2002/04/29 -pjsv
     //dblcdCnp.text  := DMTE.DisplayDescrip('prvTGE','TGE105','CPTOID','BANCOID='+QuotedStr(dblcBanco.text),'CPTOID');
     //dbeGlosa.Text  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTODES','CPTOID='+QuotedStr(dblcdCnp.text),'CPTODES');
      DMTE.cdsFormPago.Filter := 'FEFE=''1'' or FEFE=''S'' ' ;
      DMTE.cdsFormPago.Filtered := True ;
      if DMTE.cdsFormPago.RecordCount = 1 then
      begin
         dblcFormPago.Text := DMTE.cdsFormPago.FieldByName('FPAGOID').AsString;
         dblcFormPago.OnExit(Self);
      end;
      dbeNoChq.Enabled   := False;
      dbdtpFEmis.Enabled := False;
   end
   else
   begin  //Si es BANCO
      dblcCCBco.Enabled := True;
      dblcTMon.Enabled  := False ;
      dblcFormPago.Enabled  := False ;
      DMTE.cdsCCBco.Filtered := False;
      DMTE.cdsCCBco.Filter   := '';   //Filtrar la lista de CtaCte por Banco
      DMTE.cdsCCBco.Filter   := 'BANCOID='+''''+dblcBanco.Text+''''+' AND CIAID='+QuotedStr(dblcCia.text);
      DMTE.cdsCCBco.Filtered := True;
     //filtrar los tipos de pago
      DMTE.cdsFormPago.Filter := 'FCBCO=''1'' or FCBCO=''S'' ' ;
      DMTE.cdsFormPago.Filtered := True;
      dblcCCBco.SetFocus;
   end;

   if DMTE.cdsFormPago.RecordCount > 1 then
   begin
      dblcFormPago.Enabled := True;
      dblcFormPago.Text    := '' ;
      edtFormPago.Text     := '' ;
   end
   else
      dblcFormPago.Enabled := False;

   dblcFormPago.Text := DMTE.cdsFormPago.FieldByName('FPAGOID').AsString;
   dbeNoChq.Text := '';
   wModifica     := True;
end;

procedure TFEgresoCaja.dblcCCBcoExit(Sender: TObject);
var
   Tmp : String ;
begin
	 if dblcCia.Focused then Exit;
	 if dblcBanco.Focused then Exit;

   tmp:=DMTE.DisplayDescripLocal(DMTE.cdsCCBco,'CCBCOID',dblcCCBco.Text,'CCBCOID') ;

	 if Tmp='' then
	 begin
      edtCuenta.Text:= '' ;
      dblcdCnp.Text := '' ;
      dbeGlosa.Text := '' ;
      ShowMessage('Error : Cuenta Corriente No Válida');
		  dblcccbco.SetFocus;
		  exit;
	 end;

	 dblcTmon.Text := DMTE.cdsCCBco.FieldByName('TMONID').AsString ;
	 edtTMon.Text  := DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMon.text,'TMONDES') ;
	 dbeNOChq.Text := '' ;

   edtCuenta.Text := DMTE.cdsCCBco.FieldByName('CTAPRINC').AsString ;
   dblcdCnp.Text  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID','CPTOID='+QuotedStr(DMTE.cdsCCBco.FieldByName('CPTOID').AsString),'CPTOID');
   dbeGlosa.Text := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTODES','CPTOID='+QuotedStr(dblcCCBco.text),'CPTODES');  //  DMTE.cdsCCBcoLKGLOSA.AsString ;
   xVoucher := DMTE.cdsCCBco.FieldByName('CCBCOVOUCH').AsString;

   if DMTE.wModo = 'A' then
   begin
      dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+QuotedStr(dblcBanco.text)+' AND CCBCOID='+QuotedStr(dblcCCBco.text),'CCBCOVOUCH');
      dblcTDiarioExit(Sender);
   end;

   DMTE.cdsFormPago.First;
   If DMTE.cdsFormPago.RecordCount = 1 then
      dblcformpago.Enabled := false
   else
      dblcformpago.Enabled := true;
end;

procedure TFEgresoCaja.z2bbtnOKClick(Sender: TObject);
var
   xWhere, aux : String;
begin
   ValidacionCabecera1 ;
   // Actualizamos el Client Data Set de Egr.Caja (CAJA302)

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

     DMTE.cdsEgrCaja.Edit;

     BuscaNReposicion;
     DMTE.cdsEgrCaja.FieldByName('ECNOREPO').AsString  := dbeRepo.Text;
     DMTE.cdsEgrCaja.FieldByName('CIAID').AsString     := dblcCia.Text;
     DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString   := dblcTDiario.Text;
     DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString   := edtPeriodo.Text;
     DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString  := dbeNoComp.Text;

     DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString   := dblcClase.Text;
     DMTE.cdsEgrCaja.FieldByName('PROV').AsString      := dblcdAux.Text;
     DMTE.cdsEgrCaja.FieldByName('PROVRUC').AsString   := edtAuxRUC.Text;
     DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime := dbdtpFComp.Date;
     DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString   := dblcFormPago.Text ;
     DMTE.cdsEgrCaja.FieldByName('EQUIID').AsString    := DMTE.EquivFPago( dblcFormPago.Text ,dblcBanco.Text) ;
     DMTE.cdsEgrCaja.FieldByName('DOCID').AsString     := dblcTDoc.Text;
     DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString   := dbeNoDoc.Text;
     DMTE.cdsEgrCaja.FieldByName('TMONID').AsString    := dblcTMon.Text;
     DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat    := StrToFloat(dbeTCambio.Text);
     DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat   := StrToFloat(dbeImporte.Text);

     //** 05/06/2001 - pjsv
     DMTE.cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString := xVoucher;
     //**
     if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
     begin
        DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat:=strtofloat(dbeImporte.Text);
        DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat:=DMTE.FRound(strtofloat(dbeImporte.Text)/strtofloat(dbeTCambio.Text),15,2);
     end
     else begin
        DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat:=DMTE.FRound(strtofloat(dbeImporte.Text)*strtofloat(dbeTCambio.Text),15,2);
        DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat:=strtofloat(dbeImporte.Text);
     end;

     // Para Reposición o Para Pagos Adelantados
     DMTE.cdsEgrCaja.FieldByName('ECSALMN').AsFloat:=DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat;
     DMTE.cdsEgrCaja.FieldByName('ECSALME').AsFloat:=DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat;

     DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString :=dblcBanco.Text;
     DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString :=dblcCCBco.Text;
     DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString :=dbeNoChq.Text;
     DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString  :=dbeGiradoA.Text;
     DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString  :=dblcdCnp.Text;
     DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString:=edtCuenta.Text;
     DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString :=dbeGlosa.Text;
     DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString  :=dbeLote.Text;
     DMTE.cdsEgrCaja.fieldBYName('ECFEMICH').AsDateTime := dbdtpFEmis.Date ;
     DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString :='I';
     xWhere:='FECHA=' +DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date)+''')' ;
     aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FecAno');
     DMTE.cdsEgrCaja.FieldByName('ECANO').AsString  := DMTE.cdsqry.FieldByName('FECANO').AsString;
     DMTE.cdsEgrCaja.FieldByName('ECMM').AsString   := DMTE.cdsqry.FieldByName('FECMES').AsString;
     DMTE.cdsEgrCaja.FieldByName('ECDD').AsString   := DMTE.cdsqry.FieldByName('FECDIA').AsString;
     DMTE.cdsEgrCaja.FieldByName('ECSS').AsString   := DMTE.cdsqry.FieldByName('FECSS').AsString;
     DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString  := DMTE.cdsqry.FieldByName('FECSEM').AsString;
     DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString  := DMTE.cdsqry.FieldByName('FECTRIM').AsString;
     DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString := DMTE.cdsqry.FieldByName('FECAASS').AsString;
     DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString:= DMTE.cdsqry.FieldByName('FECAASEM').AsString;
     DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString:= DMTE.cdsqry.FieldByName('FECAATRI').AsString;
     DMTE.cdsEgrCaja.FieldByName('EC_PROCE').AsString:='1';
     DMTE.cdsEgrCaja.FieldByName('EC_IE').AsString   :='E';

     if trim(dblcdFEfec.Text) = '' then
        DMTE.cdsEgrCaja.FieldByName('FLUEID').Clear
     else
        DMTE.cdsEgrCaja.FieldByName('FLUEID').AsString := trim(dblcdFEfec.Text) ;

   // Actualizamos el Detalle mostrado en el grid ante posibles cambios del
   // Tipo de Cambio
   if not DMTE.cdsRegCxP.Eof then begin   //Hay documentos en el detalle
      DMTE.cdsRegCxP.DisableControls;
      DMTE.cdsRegCxP.First;
      While not DMTE.cdsRegCxP.Eof do Begin
        DMTE.cdsRegCxP.Edit;
        DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat  := strtofloat(dbeTCambio.Text);
        if DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
        begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat/DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
        end
        else
        begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat*DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
        end;
        DMTE.cdsRegCxP.Next;
      end;
      DMTE.cdsRegCxP.First ;
      DMTE.cdsRegCxP.EnableControls;
   end;
   //Actualizamos el Footer
   z2bbtnSumatClick(sender);

   // Estado de los componentes
   pnlCabecera1.enabled  := False;
   pnlCabecera2.enabled  := False;
   pnlDetPago.enabled    := True;
   pnlBotones.Enabled    := True;
   ActPnlBotones;
   // Estado de los botones
   z2bbtnOk.Enabled        := False;
   z2bbtnCancel.Enabled    := False;

   /////2704
   if DMTE.cdsRegCxP.RecordCount = 0 then
   begin
      dbgDetPagoIButtonClick(nil);
   end ;
   //2704
end;

procedure TFEgresoCaja.z2bbtnCancelClick(Sender: TObject);
begin
   DMTE.cdsEgrCaja.CancelUpdates;
   DMTE.cdsRegCxP.CancelUpdates;
   Adiciona ;
   ADICiNICIAdATOS ;
  //** 08/06/2001 - pjsv
  dbeLote.text := '000';
  //**
end;

procedure TFEgresoCaja.z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('calc.exe',1);  //Activa la calculadora del Windows
end;

{*******************************************************
CUARTO PANEL - BOTONES
*******************************************************}
procedure TFEgresoCaja.z2bbtnSumatClick(Sender: TObject);
Var
   xRegAct : TBookMark;
   xWhere : String;
   bMayorQueMonto:boolean;
begin

   // derrama vhn flag de detraccion
   if xDetraccion='S' then
   begin
      With DMTE do
      begin
       cdsRegCxP.DisableControls;
       xRegAct := cdsRegCxP.GetBookmark;
       xMtoLoc := 0;
       xMtoExt := 0;
       xRetLoc := 0;
       xRetExt := 0;
       cdsRegCxP.First ;
       While not cdsRegCxP.Eof do
       Begin
         if cdsRegCxP.FieldByName('DEDH').AsString='D' then
         begin
           xMtoLoc := xMtoLoc + StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) ) ;
           xMtoExt := xMtoExt + StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) ) ;
         end
         else
         begin
           xMtoLoc := xMtoLoc - StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) ) ;
           xMtoExt := xMtoExt - StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) ) ;
         end;
         cdsRegCxP.Next;
       end;
       dbgDetPago.ColumnByName('DEMTOLOC').FooterValue:=floattostrf(xMtoLoc, ffFixed, 10, 2);
       dbgDetPago.ColumnByName('DEMTOEXT').FooterValue:=floattostrf(xMtoExt, ffFixed, 10, 2);

       cdsRegCxP.GotoBookmark(xRegAct);
       cdsRegCxP.FreeBookmark(xRegAct);
       cdsRegCxP.EnableControls;
     end;
     Exit;
   end;
   // derrama vhn

   bMayorQueMonto:=False;
   With DMTE do
   begin
      cdsRegCxP.DisableControls;
      xRegAct := cdsRegCxP.GetBookmark;
      xMtoLoc := 0;
      xMtoExt := 0;
      xRetLoc := 0;
      xRetExt := 0;
      cdsRegCxP.First ;
      While not cdsRegCxP.Eof do
      Begin
        if cdsRegCxP.FieldByName('DEDH').AsString='D' then
        begin
          xWhere := 'DOCID='+QuotedStr(cdsRegCxP.FieldByName('DOCID2').AsString)+' AND DOCMOD=''CXP''';
          if (DMTE.DisplayDescrip('prvTGE','TGE110','DOCRETIGV',xWhere,'DOCRETIGV')='S') AND
             (cdsRegCxP.FieldByName('CPFEMIS').AsDateTime>=xTasaFec) AND
             (lblSujetoRetencion.Visible) then
          begin
             xRetLoc:=xRetLoc+cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
             xRetExt:=xRetExt+cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
             if DMTE.FRound(cdsRegCxP.FieldByName('DEMTOLOC').AsFloat,15,4)>=DMTE.xTasaMonto then
               bMayorQueMonto:=True;
          end;

          xMtoLoc := xMtoLoc + StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) ) ;
          xMtoExt := xMtoExt + StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) ) ;
        end
        else
        begin
          xMtoLoc := xMtoLoc - StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) ) ;
          xMtoExt := xMtoExt - StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) ) ;
        end;
        cdsRegCxP.Next;
      end;
      dbgDetPago.ColumnByName('DEMTOLOC').FooterValue:=floattostrf(xMtoLoc, ffFixed, 10, 2);
      dbgDetPago.ColumnByName('DEMTOEXT').FooterValue:=floattostrf(xMtoExt, ffFixed, 10, 2);

      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);
      cdsRegCxP.EnableControls;
   end;

   if (xRetLoc>=DMTE.xTasaMonto) OR (bMayorQueMonto) then
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

procedure TFEgresoCaja.z2bbtnSubeClick(Sender: TObject);
begin
   DMTE.cdsEgrCaja.Edit;
   DMTE.cdsRegCxP.Edit;

   pnlCabecera2.Enabled:= True;
   pnlDetPago.Enabled  := False;
   pnlBotones.Enabled  := False;

   z2bbtnOk.Enabled      := True;
   z2bbtnCancel.Enabled  := True;

   // Desactivamos los botones
   z2bbtnSumat.Enabled     := False;
   z2bbtnCont.Enabled      := False;
   z2bbtnNuevo.Enabled     := False;
   z2bbtnImprime.Enabled   := False;
   z2bbtnSube.Enabled      := False;
   z2bbtnGraba.Enabled     := False;
   z2bbtnCancelado.Enabled := False;
   z2bbtnCancel2.Enabled   := False;
   z2bbtnAnula.Enabled     := False;
end;

procedure TFEgresoCaja.z2bbtnCancel2Click(Sender: TObject);
var
   xComprobante : structComprobante ;
begin
   if MessageDlg('¿Anular los cambios?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
    begin
       //** 05/06/2001 - pjsv, para grabar el nuevo voucher
      xVoucher := '';
      //**
      DMTE.cdsEgrCaja.CancelUpdates ;
      DMTE.cdsRegCxP.CancelUpdates  ;
      if z2bbtnNuevo.Visible then
      begin
         Adiciona ;
         ADICiNICIAdATOS ;
         RecuperarCiaUnica(dblcCia,edtCia);
         dbeLote.Text := '000';
         dbeLote.OnExit(self);
         dblcCia.OnExit(self);
      end
      else
      begin
         with xComprobante do
         begin
            CIAID     := dblcCia.Text     ;
            ECANOMM   := edtPeriodo.Text  ;
            TDIARID   := dblcTDiario.Text ;
            ECNOCOMP  := dbeNoComp.Text   ;
         end ;
         EdiTa( cdsFiltro ) ;
      end ;
   end;
end;

procedure TFEgresoCaja.z2bbtnNuevoClick(Sender: TObject);
begin
   //** 28/12/2000 - pjsv
   dbeRepo.text := '';
   //**
   if DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString ='I' then
   begin
      if wModifica then
      begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      end;
      if MessageDlg('¿Nuevo Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin
         Adiciona ;
         ADICiNICIAdATOS ;
         //0805 IniciaDatos;
      end
   end
   else
   begin
      Adiciona ;
      ADICINICIADATOS ;
      //** 26/03/2001 - pjsv
      RecuperarCiaUnica(dblcCia,edtCia);
      dbeLote.text := '000';
      dbeLote.OnExit(self);
      dblcCia.OnExit(self);
      //**
      //0805 IniciaDatos;
   end;
  //** 05/06/2001 - pjsv, para grabar el nuevo voucher
  xVoucher := '';
  //**
end;

procedure TFEgresoCaja.z2bbtnGrabaClick(Sender: TObject);
var
   xSQL : String;
begin
   if (DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='I') then
    begin
     if MessageDlg('¿Desea Grabar?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
      begin
         screen.Cursor := crHourGlass ;
         z2bbtnSumatClick(sender);

         ErrorCount:=0;
         DMTE.DCOM1.AppServer.IniciaTransaccion;
         
         DMTE.cdsEgrCaja.Edit;
         DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat :=xMtoLoc;
         DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat :=xMtoExt;
         if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
           DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat :=xMtoLoc-xRetLoc
         else
           DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat :=xMtoExt-xRetExt;
         dbeImporte.text:=FloatToStr(DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat);
         //** 05/06/2001 - pjsv
         DMTE.cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString := xVoucher;
         //**

         DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString   := DMTE.wUsuario; // usuario que registra
         DMTE.cdsEgrCaja.FieldByName('ECFREG').AsDateTime := DateS;         // fecha que registra Usuario
         if DMTE.SRV_D = 'ORACLE' then
            DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := DateS+Time         // Hora de Registro de Usuario
         else
            DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time;         // Hora de Registro de Usuario
         cdspost(DMTE.cdsEgrCaja);
         xSQL:='Select * from CAJA302 '
              +'Where CIAID='''   +dblcCia.Text    +''' and '
              +      'ECANOMM=''' +edtPeriodo.Text +''' and '
              +      'TDIARID=''' +dblcTDiario.Text+''' and '
              +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
         DMTE.cdsEgrCaja.DataRequest( xSQL );

         DMTE.ControlTran(0,DMTE.cdsEgrCaja,'EGRCAJA');

         DMTE.cdsRegCxP.DisableControls;
         DMTE.cdsRegCxP.First;
         while not DMTE.cdsRegCxP.Eof do
         begin
               DMTE.cdsRegCxP.Edit;
               if DMTE.SRV_D = 'ORACLE' then
                 DMTE.cdsRegCxP.FieldByName('DEHREG').AsDateTime := DateS+Time
               else
                 DMTE.cdsRegCxP.FieldByName('DEHREG').AsDateTime := Time;
               cdspost(DMTE.cdsRegCxP);
               DMTE.cdsRegCxP.Post;
               DMTE.cdsRegCxP.Next
         end;
         DMTE.cdsRegCxP.EnableControls;

         xSQL:='Select * from CAJA301 '
              +'Where CIAID='''   +dblcCia.Text    +''' and '
              +      'ECANOMM=''' +edtPeriodo.Text +''' and '
              +      'TDIARID=''' +dblcTDiario.Text+''' and '
              +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
         DMTE.cdsRegCxP.DataRequest( xSQL );

         //CLG: 21/10/2003
         //DMTE.AplicaDatos(DMTE.cdsRegCxP, 'REGCXP');
         DMTE.ControlTran(0,DMTE.cdsRegCxP, 'REGCXP');
         DMTE.ControlTran(8,nil,'');

         screen.Cursor := crDefault ;
         ShowMessage('Grabacion OK');
         z2bbtnNuevo.Enabled    := True;
         z2bbtnCancelado.Enabled:= True;
         z2bbtnAnula.Enabled    := True;
         z2bbtnImprime.Enabled  := True;
         lblEstado.Caption    :='Activo             ';
         wModifica:=False;
      end
    end
   else
    begin
       ShowMessage('Imposible Grabar');
   end;
end;


procedure TFEgresoCaja.z2bbtnCanceladoClick(Sender: TObject);
var
   xConsis:Boolean;
   cPgoLoc, cPgoExt, cPgoOri : Double;  //CIM
   xSuma, cSalLoc, cSalExt, cSalOri : Double ; //CIM
   cNodoc : String;
   sFecha, sSQL, xSQL : String;
	 xRetencion : Boolean;
begin
   xSuma:=0;
   if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'I' then
    begin
     if wModifica then
      begin
         ShowMessage('Debe Grabar primero las actualizaciones realizadas');
         Exit;
      end;

      if (DMTE.cdsRegCxP.RecordCount < 1) then
      begin
         ShowMessage('No se puede Realizar la Cancelación si no tiene Detalles');
         exit;
      end;

      DMTE.cdsRegCxP.DisableControls;
      ConsisCancela(xConsis);
      DMTE.cdsRegCxP.EnableControls;
      if not xConsis then
         ShowMessage('No se puede Cancelar el Comprobante')
      else
      begin
         if MessageDlg('¿Efectuar la Cancelación del Comprobante?',mtConfirmation,
                      [mbYes, mbNo], 0)=mrYes then
         begin
            screen.Cursor := crHourGlass ;

            ErrorCount:=0;
            DMTE.DCOM1.AppServer.IniciaTransaccion;
           /////////////////////////////////
           //  Calcula Retencion del IGV  //
           /////////////////////////////////
           // derrama vhn
           if not ( xDetraccion='S' ) then
					    xRetencion:=DMTE.CalculaRetencionIGV;
           // derrama vhn
           /////////////////////////////////

            dbeImporte.Text:=DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString;

            DMTE.cdsEgrCaja.Edit;
            DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString   := DMTE.wUsuario; // usuario que registra
            DMTE.cdsEgrCaja.FieldByName('ECFREG').AsDateTime := DateS;         // fecha que registra Usuario

            if DMTE.SRV_D = 'ORACLE' then
               DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := DateS+Time         // Hora de Registro de Usuario
            else
               DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time;         // Hora de Registro de Usuario

            DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString:='C';

            if xRetencion then
					     DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString := 'S'
				    else
					     DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString := 'N';


            cSalLoc:= 0; cSalExt:= 0; cSalOri:=0;
            DMTE.cdsRegCxP.DisableControls;
            DMTE.cdsRegCxP.First;
           //** 11/01/2001 - pjsv
            while not DMTE.cdsRegCxP.Eof do
            begin
               if DMTE.cdsRegCxP.FieldByName('DEDH').AsString = 'D' then
               begin
                  xSuma := DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
                  break;
               end;
               DMTE.cdsRegCxP.next;
            end;
           //**
            cNoDoc := dbeNoDoc.TEXT;// DMTE.cdsRegCxPCPNODOC.AsString;

           //CIM 17/12/2001
            if DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
            begin
               cPgoLoc := StrToFloat(dbeImporte.Text);// DMTE.cdsRegCxPDemToori.AsFloat;
               cPgoExt := (DMTE.FRound(cPgoLoc/DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat,15,2));
            end
            else
            begin
               cPgoExt:= StrToFloat(dbeImporte.Text); //DMTE.cdsRegCxPDemToori.AsFloat;
               cPgoLoc:= (DMTE.FRound(cPgoExt*DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat,15,2));
            end;

            ActualizaSaldosTGE401(cPgoOri,cPgoLoc,cPgoExt, '-' );

            DMTE.cdsRegCxP.EnableControls;

            DMTE.cdsEgrCaja.Edit ;

            cdsPost(DMTE.cdsEgrCaja);

            xSQL := 'Select * From CAJA302'
                   +' Where CIAID ='+QuotedStr(dblcCia.Text)
                   +' And ECANOMM ='+QuotedStr(edtPeriodo.Text)
                   +' And TDIARID ='+QuotedStr(dblcTDiario.Text)
                   +' And ECNOCOMP ='+QuotedStr(dbeNoComp.Text);
            DMTE.cdsEgrCaja.DataRequest( xSQL );

            DMTE.ControlTran(0,DMTE.cdsEgrCaja,'EGRCAJA');
            DMTE.ControlTran(0,DMTE.cdsRegCxP, 'REGCXP');

           //**
            z2bbtnSumatClick(Sender);

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

            DMTE.ControlTran(8,nil,'');
            
            dbgDetPagoIButton.Enabled := False;
            z2bbtnSumat.Enabled       := False;
            z2bbtnCont.Enabled        := True;
            z2bbtnAnula.Enabled       := True;
            z2bbtnSube.Enabled        := False;
            z2bbtnGraba.Enabled       := False;
            z2bbtnCancelado.Enabled   := False;
            z2bbtnCancel2.Enabled     := False;
            lblEstado.Caption    := 'Cancelado          ';
            Screen.Cursor := crDefault ;
            Beep;
            MessageDlg('Datos Actualizados', mtCustom, [mbOk], 0);
         end;
      end;
   end  //quitar
   else begin
      ShowMessage('Imposible Cancelar');
   end;
end;

function TFEgresoCaja.ValidaCampo:Boolean;
//aqui adiciionar el codigo para validar que no se ingrese un codigo repetido
var
   xWhere, aux : String;
begin
   Result:= True;
   with DMTE do
    begin

        if Length(cdsRegCxP.FieldByName('CPNOREG').AsString)=0 then begin  //No Registro
           ShowMessage('Falta No Registro');
           Result:=False;
           exit;
        end
        else begin
           if Length(cdsRegCxP.FieldByName('CPNOREG').AsString)<6 then begin
              ShowMessage('Codigo de Registro Errado');
              Result:=False;
              exit;
           end;
        end;

        if Length(cdsRegCxP.FieldByName('TDIARID2').AsString)=0 then begin  //Tipo de Diario
           ShowMessage('Falta Tipo de Diario');
           Result:=False;
           exit;
        end
        else
        begin
           xWhere:='TDIARID='+''''+cdsRegCxP.FieldByName('TDIARID2').AsString+'''';
           aux   :=DisplayDescrip('prvTGE','TGE104','TDIARDES',xWhere,'TDIARDES');
           if Length(aux)=0 then begin
              ShowMessage('Codigo de Tipo de Diario Errado');
              Result:=False;
              exit;
           end;
        end;

        if Length(cdsRegCxP.FieldByName('DOCID2').AsString)=0 then begin  //Tipo de Documento
           ShowMessage('Falta Tipo de Documento');
           Result:=False;
           exit;
        end
        else
        begin
           xWhere:='DOCID='+''''+cdsRegCxP.FieldByName('DOCID2').AsString+'''';
           aux   :=DisplayDescrip('prvTGE','TGE110','DOCDES',xWhere,'DOCDES');
           if Length(aux)=0 then begin
              ShowMessage('Codigo de Tipo de Documento Errado');
              Result:=False;
              exit;
           end;
        end;

        if cdsRegCxP.FieldByName('CPSERIE').AsString='' then begin      //Serie
           ShowMessage('Falta Serie');
           Result:=False;
           exit;
        end;

        if cdsRegCxP.FieldByName('CPNODOC').AsString='' then begin      //No Documento
           ShowMessage('Falta Nro. de Documento');
           Result:=False;
           exit;
        end;

        if Length(cdsRegCxP.FieldByName('TMONID').AsString)=0 then begin //Tipo de Moneda
           ShowMessage('Falta Tipo de Moneda');
           Result:=False;
           exit;
        end
        else
        begin
           xWhere:='TMONID='+''''+cdsRegCxP.FieldByName('TMONID').AsString+'''';
           aux   :=DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
           if Length(aux)=0 then begin
              ShowMessage('Codigo de Tipo de Moneda Errado');
              Result:=False;
              exit;
           end;
        end;

        if cdsRegCxP.FieldByName('DETCDOC').AsFloat<=0 Then begin // Tipo de Cambio Detalle
           ShowMessage('Tipo de Cambio debe ser mayor que cero');
           Result:=False;
           exit;
        end;

        if cdsRegCxP.FieldByName('DEMTOORI').AsFloat<=0 Then begin   //Importe
           ShowMessage('Importe debe ser mayor que cero');
           Result:=False;
           exit;
        end;

        if cdsRegCxP.FieldByName('CPTOID').AsString='' then begin      //Concepto
           ShowMessage('Falta Concepto');
           Result:=False;
           exit;
        end
        else begin                             // Cuenta
           aux:=cdsRegCxP.FieldByName('CUENTAID').AsString;
           if Length(aux)=0 then begin
              ShowMessage('Codigo de Concepto Errado');
              Result:=False;
              exit;
           end;
        end;


        if Length(cdsRegCxP.FieldByName('DEDH').AsString)=0 then begin
           ShowMessage('Falta especificar Debe / Haber');
           Result:=False;
           exit;
        end;

        if cdsRegCxP.FieldByName('CPFVCMTO').AsDateTime<cdsRegCxP.FieldByName('CPFEMIS').AsDateTime then begin //Fecha de Vencimiento
             ShowMessage('Fecha de Vencimiento debe ser posterior a la Fecha de Emision');
             Result:=False;
             exit;
        end;
//Validación de centro de costo y auxiliares
        if (dblcdCCosto.Enabled) then
        begin  //Centro de Costo
          IF (Length(cdsRegCxP.FieldByName('CCOSID').AsString)=0) THEN
          BEGIN
              ShowMessage('Falta Centro de Costo') ;
              Result:=False ;
              exit ;
          END
          else
          begin
           xWhere:='CCOSID='+''''+cdsRegCxP.FieldByName('CCOSID').AsString+'''' ;
           aux   :=DisplayDescrip('prvTGE','TGE203','CCOSDES',xWhere,'CCosDes') ;
           if Length(aux)=0 then
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
        xWhere:='FECHA= ' +DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha,cdsRegCxP.FieldByName('DEFCOMP').ASDateTime)+''')' ;
        aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
        cdsRegCxP.FieldByName('DEANO').AsString  := cdsqry.FieldByName('FECANO').AsString;
        cdsRegCxP.FieldByName('DEMM').AsString   := cdsqry.FieldByName('FECMES').AsString;
        cdsRegCxP.FieldByName('DEDD').AsString   := cdsqry.FieldByName('FECDIA').AsString;
        cdsRegCxP.FieldByName('DESS').AsString   := cdsqry.FieldByName('FECSS').AsString;
        cdsRegCxP.FieldByName('DESEM').AsString  := cdsqry.FieldByName('FECSEM').AsString;
        cdsRegCxP.FieldByName('DETRI').AsString  := cdsqry.FieldByName('FECTRIM').AsString;
        cdsRegCxP.FieldByName('DEAASS').AsString := cdsqry.FieldByName('FECAASS').AsString;
        cdsRegCxP.FieldByName('DEAASEM').AsString:= cdsqry.FieldByName('FECAASEM').AsString;
        cdsRegCxP.FieldByName('DEAATRI').AsString:= cdsqry.FieldByName('FECAATRI').AsString;

    end; {DMTE}
end;

procedure TFEgresoCaja.ConsisCancela(Var xConsis:boolean);
var xRegAct : TBookMark;
    xSumImp , Suma : Currency;
begin
    xConsis := True;
    xSumImp := 0;
    With DMTE do
    begin
      xRegAct := cdsRegCxP.GetBookmark;
      cdsRegCxP.First ;
      While not cdsRegCxP.Eof do
      begin
         if cdsRegCxP.FieldByName('DEDH').AsString='D' then
            if cdsEgrCaja.FieldByName('TMONID').AsString = wtMonLoc then
               xSumImp := xSumImp + strtocurr(stringreplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]))
            else
               xSumImp := xSumImp + strtocurr(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]))
         else
            if cdsEgrCaja.FieldByName('TMONID').AsString = wtMonLoc then
               xSumImp := xSumImp - strtocurr(stringreplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]))
            else
               xSumImp := xSumImp - strtocurr(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll])) ;

         cdsRegCxP.Next;
      end;
      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);

      if cdsEgrCaja.FieldByName('TMONID').AsString = wtMonLoc then
         Suma :=  strtocurr(floattostrf(cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat,fffixed,10,2))
      else
         Suma :=  strtocurr(floattostrf(cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat,fffixed,10,2)) ;
    end;

    if xSumImp <> Suma then
    begin
      xConsis := False;
      if Suma > xSumImp then
         ShowMessage('El Monto a Pagar es mayor que el Provisionado')
      else
         ShowMessage('El Monto a Pagar es menor que el Provisionado');
    end;
end;

procedure TFEgresoCaja.Contab_EgrCaja;
begin
   DMTE.cdsCntCaja.FieldByName('CIAID').AsString   := DMTE.cdsEgrcaja.FieldByName('CIAID').AsString;
   DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString:= DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString  := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCID').AsString   := DMTE.cdsEgrCaja.FieldByName('DOCID').AsString;
   //a pedido de jlc 20/12/2002
   DMTE.DisplayDescrip('prvTGE','TGE112','FCHQ,FCBCO','FPAGOID='+QuotedStr(DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString),'FCHQ');
   if ((DMTE.cdsQry.FieldByName('FCHQ').AsString='1') or (DMTE.cdsQry.FieldByName('FCHQ').AsString='S'))
      and (DMTE.cdsQry.FieldByName('FCBCO').AsString='S')
       then
      DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString
   else
      DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString;

   DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('CPTOID').AsString  := DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString;
   DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString:= DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDH').AsString    := 'H';
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:= DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:= DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DMTE.cdsCntCaja.FieldByName('TMONID').AsString  := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.FRound(DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat-xRetLoc,15,2);
   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat:= DMTE.FRound(DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat-xRetExt,15,2);
   if DMTE.cdsCntCaja.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
   begin
     DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat:= DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat;
   end
   else
   begin
     DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat:= DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat;
   end;

   DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString:= 'S';   //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCUSER').AsString  := DMTE.wUsuario;
   DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime  := DateS;
   if DMTE.SRV_D = 'ORACLE' then
      DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime  := DateS+Time
   else
      DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime  := Time;
   DMTE.cdsCntCaja.FieldByName('DCANO').AsString   := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMM').AsString    := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDD').AsString    := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSS').AsString    := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
   //DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := dbeGiradoA.text;
   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString;
   DMTE.cdsCntCaja.FieldByName('FCAB').AsString := '1' ;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString  := FRegistro.xModulo;
//   DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
//   DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:= DMTE.cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime;
   xNReg:=xNReg+1;
   DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;
end;

procedure TFEgresoCaja.Contab_RegCxP;
begin
   DMTE.cdsCntCaja.FieldByName('CIAID').AsString   := DMTE.cdsRegCxP.FieldByName('CIAID').AsString;
   DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsRegCxP.FieldByName('TDIARID').AsString;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString:= DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString  := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
	 DMTE.cdsCntCaja.FieldByName('DOCID').AsString   := DMTE.cdsRegCxP.FieldByName('DOCID2').AsString;
	 DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString  := DMTE.cdsRegCxP.FieldByName('DOCMOD').AsString;
	 DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString := DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString;
   DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:= DMTE.cdsRegCxP.FieldByName('CPFVCMTO').AsDateTime;
   DMTE.cdsCntCaja.FieldByName('CPTOID').AsString  := DMTE.cdsRegCxP.FieldByName('CPTOID').AsString;
   DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString:= DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString;
	 DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
	 DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
   DMTE.cdsCntCaja.FieldByName('CCOSID').AsString  := DMTE.cdsRegCxP.FieldByName('CCOSID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDH').AsString    := DMTE.cdsRegCxP.FieldByName('DEDH').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
	 DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat := DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
	 DMTE.cdsCntCaja.FieldByName('TMONID').AsString  := DMTE.cdsRegCxP.FieldByName('TMONID').AsString;
	 DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat:= DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;


   if (DMTE.xSRV_RUTA='\\INCORESA') then
 	   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:=DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString
   else begin
      if DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString<>'' then
    	   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:=DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString
      else
    	   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:=DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString;
   end;

	 if DMTE.cdsRegCxP.FieldByName('TMONID').AsString=DMTE.wtMonLoc then
		begin
			DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat,15,2);
			DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat:= DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat,15,2);
		end
	 else
		begin
			DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat:= DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat,15,2);
			DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat,15,2);
		end;

   DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString:= 'S';   //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCUSER').AsString  := DMTE.wUsuario;
   DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime  := DateS;
   if DMTE.SRV_D = 'ORACLE' then
      DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime  := dateS+time
   else
      DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime  := time;
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
   DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;
end;

procedure TFEgresoCaja.Contab_DifCambio;
var
   xDif_Camb : real;
   xsql1,xSQL : string;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   //08/05/2001 - pjsv
   // se valida por sugerencia de Jorge y Jose, me confirmaron que por el tipo
  // de moneda de la cabecera, para que no genere <> de cambio cuando es local
   xSQL := 'TMONID='+QuotedStr(dblcTMon.Text);
   xsql1 := 'TMONID='+QuotedStr(DMTE.cdsRegCxP.FieldByName('TMONID').AsString);
   If (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xSQL,'TMON_LOC') <> 'L') or
      (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then
    begin
     if DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat <> DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat then
      begin
        DMTE.cdsCntCaja.Insert;
        DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString  := 'Diferencia de Cambio';        
        DMTE.cdsCntCaja.FieldByName('CIAID').AsString   :=  DMTE.cdsRegCxP.FieldByName('CIAID').AsString;
        DMTE.cdsCntCaja.FieldByName('TDIARID').AsString :=  DMTE.cdsRegCxP.FieldByName('TDIARID').AsString;
        DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString :=  DMTE.cdsRegCxP.FieldByName('ECANOMM').AsString;
        DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
        DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
        DMTE.cdsCntCaja.FieldByName('DOCID').AsString   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').AsString;
        DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString :=  DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString;
        DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString :=  DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString;
        DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString :=  DMTE.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('CCOSID').AsString  :=  DMTE.cdsRegCxP.FieldByName('CCOSID').AsString;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:=  DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:=  DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
        DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString:=  'S';   //Registro ya cuadrado
        DMTE.cdsCntCaja.FieldByName('DCUSER').AsString  :=  DMTE.wUsuario;
        DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime  :=  Date;
        if DMTE.SRV_D = 'ORACLE' then
           DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  date+Time
        else
           DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  Time;
        DMTE.cdsCntCaja.FieldByName('DCANO').AsString   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
        DMTE.cdsCntCaja.FieldByName('DCMM').AsString    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
        DMTE.cdsCntCaja.FieldByName('DCDD').AsString    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
        DMTE.cdsCntCaja.FieldByName('DCSS').AsString    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
        DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
        DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
        DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
        DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
        DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
        DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
        xNReg:=xNReg+1;
        DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;

        DMTE.cdsCntCaja.FieldByName('TMONID').AsString  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
        if DMTE.cdsRegCxP.FieldByName('TMONID').AsString=DMTE.wtMonLoc then
         begin   //Provision en Mon.Local
           xDif_Camb:= abs(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat -
                           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat);//En Mon.Ext.
           DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := xDif_Camb;

           if DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat > DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat then
              DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'D'
           else
              DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'H';
         end
        else
         begin                                            //Provision en Mon.Ext.
           xDif_Camb:= abs(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat -
                           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat);//En Mon.Local
           DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := xDif_Camb;
           if DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat > DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat then
              DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'H'
           else
              DMTE.cdsCntCaja.FieldByName('DCDH').AsString := 'D';
         end;

        if DMTE.cdsCntCaja.FieldByName('DCDH').AsString = 'D' then
         begin
           DMTE.cdsCntCaja.FieldByName('CPTOID').AsString  :=  wCptoPer;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString:=  wCtaPer;
         end
        else
         begin
           DMTE.cdsCntCaja.FieldByName('CPTOID').AsString  :=  wCptoGan;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString:=  wCtaGan;
         end;

      end;
    end;
end;


procedure TFEgresoCaja.Contab_DifCambio2;
var
 xSql1,xSql : String;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   //08/05/2001 - pjsv
   // se valida por sugerencia de Jorge y Jose, me confirmaron que por el tipo
  // de moneda de la cabecera, para que no genere <> de cambio cuando es local
   xSQL := 'TMONID='+QuotedStr(dblcTMon.Text);
   xsql1 := 'TMONID='+QuotedStr(DMTE.cdsRegCxP.FieldByName('TMONID').AsString);
   If (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xSQL,'TMON_LOC') <> 'L') or
      (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then
    begin
     if DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat<>DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat then
      begin
        DMTE.cdsCntCaja.Insert;
        DMTE.cdsCntCaja.FieldByName('CIAID').AsString   :=  DMTE.cdsRegCxP.FieldByName('CIAID').AsString;
        DMTE.cdsCntCaja.FieldByName('TDIARID').AsString :=  DMTE.cdsRegCxP.FieldByName('TDIARID').AsString;
        DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString :=  DMTE.cdsRegCxP.FieldByName('ECANOMM').AsString;
        DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
        DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
        DMTE.cdsCntCaja.FieldByName('DOCID').AsString   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').AsString;
        DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString :=  DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString;
        DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString :=  DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString;
        DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString :=  DMTE.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('CCOSID').AsString  :=  DMTE.cdsRegCxP.FieldByName('CCOSID').AsString;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:=  DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:=  DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
        DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString:=  'S';   //Registro ya cuadrado
        DMTE.cdsCntCaja.FieldByName('DCUSER').AsString  :=  DMTE.wUsuario;
        DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime  :=  Date;
        if DMTE.SRV_D = 'ORACLE' then
           DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  Date+Time
        else
           DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  Time;
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
        DMTE.cdsCntCaja.FieldByName('TMONID').AsString  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
        xNReg:=xNReg+1;
        DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;

        if DMTE.cdsRegCxP.FieldByName('TMONID').AsString=DMTE.wtMonExt then
         begin  //Provision en Ext.
           DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat*DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
           DMTE.cdsCntCaja.FieldByName('DCDH').AsString    := 'H';
           DMTE.cdsCntCaja.FieldByName('CPTOID').AsString  := wCptoGan;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString:= wCtaGan;
         end;

        //////////////

        DMTE.cdsCntCaja.Insert;
        DMTE.cdsCntCaja.FieldByName('CIAID').AsString   :=  DMTE.cdsRegCxP.FieldByName('CIAID').AsString;
        DMTE.cdsCntCaja.FieldByName('TDIARID').AsString :=  DMTE.cdsRegCxP.FieldByName('TDIARID').AsString;
        DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString :=  DMTE.cdsRegCxP.FieldByName('ECANOMM').AsString;
        DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
        DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
        DMTE.cdsCntCaja.FieldByName('DOCID').AsString   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').AsString;
        DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString :=  DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString;
        DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString :=  DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString;
        DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
        DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString :=  DMTE.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
        DMTE.cdsCntCaja.FieldByName('CCOSID').AsString  :=  DMTE.cdsRegCxP.FieldByName('CCOSID').AsString;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:=  DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:=  DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
        DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString:=  'S';   //Registro ya cuadrado
        DMTE.cdsCntCaja.FieldByName('DCUSER').AsString  :=  DMTE.wUsuario;
        DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime  :=  Date;
        if DMTE.SRV_D = 'ORACLE' then
           DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  date+Time
        else
           DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  Time;
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
        DMTE.cdsCntCaja.FieldByName('TMONID').AsString  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
        xNReg:=xNReg+1;
        DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;

        if DMTE.cdsRegCxP.FieldByName('TMONID').AsString=DMTE.wtMonExt then
         begin  //Provision en Ext.
           DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat*DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
           DMTE.cdsCntCaja.FieldByName('DCDH').AsString    := 'D';
           DMTE.cdsCntCaja.FieldByName('CPTOID').AsString  :=  wCptoPer;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString:=  wCtaPer;
         end;

        if DMTE.cdsCntCaja.FieldByName('DCDH').AsString = 'D'  then
         begin
          if DMTE.cdsCntCaja.FieldByName('TMONID').AsString= DMTE.wtMonLoc then
           DMTE.cdsCntCaja.FieldByName('DEBE').AsFloat  := DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat
          else
           DMTE.cdsCntCaja.FieldByName('DEBE').AsFloat  := DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat;
         end
        else
         begin
          if DMTE.cdsCntCaja.FieldByName('TMONID').AsString= DMTE.wtMonLoc then
           DMTE.cdsCntCaja.FieldByName('HABER').AsFloat := DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat
          else
           DMTE.cdsCntCaja.FieldByName('HABER').AsFloat := DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat;
         end;
      end;
    end;
end;


procedure TFEgresoCaja.Contabiliza;
var
   xRegAct : TBookMark;
   xSQL    : String;
begin

   xSQL:='DELETE FROM CAJA304 '
        +'WHERE CIAID='   +QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)   +' AND '
        +      'ECANOMM=' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) +' AND '
        +      'TDIARID=' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) +' AND '
        +      'ECNOCOMP='+QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
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
   z2bbtnSumatClick(NIL);
   xNReg:=0;
   DMTE.cdsRegCxP.DisableControls;
   xRegAct := DMTE.cdsRegCxP.GetBookmark;

   // GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde el Detalle
   DMTE.cdsRegCxP.First ;
   While not DMTE.cdsRegCxP.Eof do Begin
      DMTE.cdsCntCaja.Insert;
      Contab_RegCxP;
      if DMTE.wTipoDif='' then
         Contab_DifCambio
      else
      begin
         if DMTE.cdsRegCxP.FieldByname('TMONID').AsString=DMTE.wTMonExt then
            Contab_DifCambio2;
      end;
      DMTE.cdsRegCxP.Next;
   end;
   DMTE.cdsRegCxP.GotoBookmark(xRegAct);
   DMTE.cdsRegCxP.FreeBookmark(xRegAct);
   DMTE.cdsRegCxP.EnableControls;

   DMTE.cdsCntCaja.Insert;
   Contab_EgrCaja;
   if (xRetLoc>0) OR (xRetExt>0) then
   begin
      DMTE.cdsCntCaja.Insert;
      Contab_DocPago_RETENCION_HABER;
   end;

   //GENERA MONTO

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

procedure TFEgresoCaja.AsientoDifTotal;
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
     DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;

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


procedure TFEgresoCaja.z2bbtnContClick(Sender: TObject);
var
   xSql : String;
begin
	if DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString = 'C' then
	begin
		if DMTE.cdsEgrCaja.FieldByName('FEXTCHQ').AsString = '1' then
		begin
			ShowMessage('No Puede Contabilizar este Movimiento ' + #13 +
										'Pues se encuentra extornado') ;
			Exit;
		end;

		if DMTE.MesCerrado(copy(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,5,2),
                        copy(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,1,4),
                        DMTE.cdsEgrCaja.FieldByName('CIAID').AsString) then
		begin
			ShowMessage(' Mes cerrado, no se puede contabilizar');
			exit;
		end;

		if MessageDlg('¿Contabilizar y Generar Asientos Automaticos?',mtConfirmation,
									[mbYes, mbNo], 0)=mrYes then
		begin
			Screen.Cursor := crHourglass ;

         z2bbtnGraba.Enabled     := False ;
         z2bbtnCancelado.Enabled := False ;
         z2bbtnCont.Enabled      := False ;
         z2bbtnAnula.Enabled     := False ;

			RecCptosDifC ;
			Contabiliza;             // Realiza la generacion del Asiento

  		   ActualizaCNT311 (DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
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
			 	 DMTE.cdsEgrCaja.Edit ;
				 DMTE.cdsEgrCaja.FieldByName('ECConta').AsString:='S';   //Establece como Contabilizado el flag
         DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString    := 'C';
         DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString      := DMTE.wUsuario;
         DMTE.cdsEgrCaja.FieldByName('ECFREG').AsDateTime    := DateS;
         if DMTE.SRV_D = 'ORACLE' then
            DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= DateS+Time
         else
            DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;
         if Copy(xRegAdicional,1,2)='1.' then
            DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString:=xRegAdicional;

         xSQL:='Select * from CAJA302 '
              +'Where CIAID='''   +DMTE.cdsEgrCaja.FieldByName('CIAID').AsString+''' and '
              +      'ECANOMM=''' +DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString +''' and '
              +      'TDIARID=''' +DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString+''' and '
              +      'ECNOCOMP='''+DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' ';
			   DMTE.cdsEgrCaja.DataRequest( xSQL );
         DMTE.AplicaDatos(DMTE.cdsEgrCaja, 'EGRCAJA');

         // Para Grabar Registros Adicionales
         if Copy(xRegAdicional,1,2)='1.' then
            DMTE.AsientosAdicionales( xRegAdicional );

			end;
			lblEstado.Caption  :='Cancelado y Contab.' ;
			Screen.Cursor := crDefault ;
		end;
	end
	else
   begin
		ShowMessage('Imposible Contabilizar');
	end;
end;

procedure TFEgresoCaja.z2bbtnAnulaClick(Sender: TObject);
begin
   dbeRepo.text := '';

   if MessageDlg('¿Anular Comprobante?',mtConfirmation,
                [mbYes, mbNo], 0)=mrYes then begin

      DMTE.cdsEgrCaja.CancelUpdates;
      DMTE.cdsRegCxP.CancelUpdates;

      ErrorCount:=0;
      DMTE.DCOM1.AppServer.IniciaTransaccion;

      if DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString='C' then begin
         ActualizaSaldosTGE401( 0, DMTE.cdsEgrCaja.FieldByname('ECMTOLOC').AsFloat, DMTE.cdsEgrCaja.FieldByname('ECMTOEXT').AsFloat, '+' );
      end;

      DMTE.cdsEgrCaja.Edit;
      DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString      := DMTE.wUsuario; // usuario que registra
      DMTE.cdsEgrCaja.FieldByName('ECFREG').AsDateTime    := DateS;         // fecha que registra Usuario
      if DMTE.SRV_D = 'ORACLE' then
         DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := dateS+time         // Hora de Registro de Usuario
      else
         DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime := Time;         // Hora de Registro de Usuario
      DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString:='A';
      //CLG: 21/10/2003
      //DMTE.cdsEgrCaja.ApplyUpdates(0);
      DMTE.ControlTran(0,DMTE.cdsEgrCaja,'EGRCAJA'); 

		if DMTE.cdsEgrCaja.FieldByName('CAJARETIGV').AsString='S' THEN
			DMTE.AnulaRetencion;

      DMTE.ControlTran(8,nil,'');

      dbgDetPagoIButton.Enabled:=False;
      z2bbtnSumat.Enabled    := False;
      z2bbtnNuevo.Enabled    := True;
      z2bbtnCont.Enabled     := False;
      z2bbtnSube.Enabled     := False;
      z2bbtnGraba.Enabled    := False;
      z2bbtnCancelado.Enabled:= False;
      z2bbtnCancel2.Enabled  := False;
      z2bbtnAnula.Enabled    := False;
      lblEstado.Caption    :='Anulado            ';
      xVoucher := '';
   end;
end;

procedure TFEgresoCaja.ActPnlBotones;
begin
   z2bbtnSumat.Enabled    := wbSumat;
   z2bbtnCont.Enabled     := wbCont;
   z2bbtnNuevo.Enabled    := wbNuevo;
   z2bbtnImprime.Enabled  := wbImprime;
   z2bbtnSube.Enabled     := wbSube;
   z2bbtnGraba.Enabled    := wbGraba;
   z2bbtnCancelado.Enabled:= wbCancelado;
   z2bbtnCancel2.Enabled  := wbCancel2;
   z2bbtnAnula.Enabled    := wbAnula;
end;

procedure TFEgresoCaja.FormClose(Sender: TObject; var Action: TCloseAction);
var xSQL:string;
begin

   if pnlActualiza.Visible then
   begin
      pnlActualiza.Enabled := True  ;
      z2bbtnCancel3.SetFocus  ;
      z2bbtnCancel3Click(nil) ;
   end ;

   // Limpiamos los filtros
   DMTE.cdsRegCxP.Filtered :=False ;
   DMTE.cdsCCBco.Filtered  :=False ;
   cf1.QuitarExits( FEgresoCaja ) ;
   DMTE.cdsTrans.IndexFieldNames :='';
   DMTE.cdsTrans.Filter   := '';
   DMTE.cdsTrans.Filtered := False;


   if DMTE.cdsEgrCaja.active then
      DMTE.cdsEgrCaja.CancelUpdates;
   if DMTE.cdsRegCxP.active then
      DMTE.cdsRegCxP.CancelUpdates;
   edtCuenta.Enabled := False ;

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

   // VHNDEMA
   TRY
   FRegistro.xFiltroEgr.FMant.cds2.Data:=DMTE.cdsEgrCaja.Data;
   FRegistro.xFiltroEgr.FMant.cds2.GotoCurrent( DMTE.cdsEgrCaja );
   EXCEPT
   END;
   // END VHNDEMA

   Action:=caFree;
end;

procedure TFEgresoCaja.IniciaPanel;
begin
     dbeSerie.Text       := '000';
     dblcTDoc2.Text      := '';
     dbeNoDoc2.Text      := '';
     dblcdCnp2.Text      := '';
     dblcDCnp2.Text       := '';

     //nueva linea para reemplazar a la que  le sigue
     dblcdCCosto.Text     := '';
     dblcdCCosto.Text     := '';
     dbeDH.Text          := '';
     dblcTMon2.Text      := '';
     dbeImporte2.Text    := '';
     dbeTCamPr.Text      := '';
     dbeTCamDoc.Text     := '';

     dbdtpFEmis2.Date    := 0;
     dbdtpFVcto2.Date    := 0;

     edtCuenta2.Text     := '';
     edtMtoLoc.Text      := '';
     edtMtoExt.Text      := '';

     edtTDoc2.Text    := '';
end;
                                  
procedure TFEgresoCaja.dbgDetPagoIButtonClick(Sender: TObject);
begin
   inhabilitarpaneles;
   AdicionarREgistros;
end;

procedure TFEgresoCaja.z2bbtnCancel3Click(Sender: TObject);
begin
     bFlagRecuperacion:=false;
     if DMTE.cdsRegCxP.State = dsInsert then
        DMTE.cdsRegCxP.Delete
     else
     begin
        if DMTE.cdsRegCxP.State = dsedit then
          DMTE.cdsRegCxP.Cancel;
     end;
     PnlActualiza.Visible := False;
     pnlDetPago.Enabled   := True;
     pnlBotones.Enabled   := True;
     z2bbtnSumatClick(sender);    // Al salir hay que totalizar
   //quitar los filtros que se hubieran establecido
     liberarfiltrosregistroegresos;
end;

procedure TFEgresoCaja.dbeNoRegExit(Sender: TObject);
begin
   if not z2bbtnCancel3.Focused then
   begin
//0106      dbeNoReg.Text:=DMTE.strzero(dbeNoReg.Text,6);
      dbeNoReg.Text:=DMTE.strzero(dbeNoReg.Text,10);
      if strtoint(dbeNoReg.Text)=0 then
      begin     // NoRegistro
         dbeNoReg.Text:='';
         ShowMessage('No es valido el No Registro');
         dbeNoReg.SetFocus;
         exit;
      end;
       DMTE.cdsRegCxP.FieldByName('CPNOREG').AsString  := dbeNoReg.Text;
   end
   else
   dbeNoReg.Text:='';
end;

procedure TFEgresoCaja.z2bbtnOK2Click(Sender: TObject);
begin
   // VALIDA LA CUENTA DEL CONCEPTO
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,dblcdCnp2.text,'')) and (dblcTMon2.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+DMTE.cdsQry.FieldByName('CUENTAID').AsString+' del Concepto '+dblcdCnp2.text+' Se registra sólo en Moneda Extranjera.');
   end;

   if DMTE.cdsRegCxP.State=dsInsert then
      if EncuentraDuplicado(DMTE.cdsRegCxP,'CPNoReg',dbeNoReg.Text) then
      begin
         ShowMessage('Numero de Registro duplicado');
         dbeNoReg.SetFocus;
         exit;
      end;
      if EncuentraDuplicado1(DMTE.cdsRegCxP,'DOCID2;CPSERIE;CPNODOC',dblcTDoc2.text,dbeSerie.text,dbeNoDoc2.Text) then
      begin
         ShowMessage('Documento duplicado');
         dbeNoDoc2.SetFocus;
         exit;
      end;

   if not ValidaCampo then
      ShowMessage('No se puede grabar')
   else
   begin
      DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString:=edtCnp2.text;
      {if DMTE.SRV_D = 'ORACLE' then
        DMTE.cdsRegCxP.FieldByName('DEHREG').AsDateTime := Date+Time
      else
        DMTE.cdsRegCxP.FieldByName('DEHREG').AsDateTime := Time;}

      DMTE.cdsRegCxP.Post ;
      wModifica:=True;
      if not dbeNoReg.Enabled then
      begin
         PnlActualiza.Visible := False;
         pnlDetPago.Enabled   := True;
         pnlBotones.Enabled   := True;
         z2bbtnSumatClick(sender);    // Al salir hay que totalizar
         //quitar los filtros que se hubieran establecido
         liberarfiltrosregistroegresos;
      end
      else
      begin
         adicionarRegistros;
      end;
   end;
end;

procedure TFEgresoCaja.dblcTMon2Exit(Sender: TObject);
var xWhere, aux: string;
begin
   if  z2bbtnCancel3.Focused then exit;

   xWhere:='TMONID='+''''+DMTE.cdsRegCxP.FieldByName('TMONID').AsString+'''';
   aux:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
   if (Length(aux)>0) and (DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat>0) then begin
     if DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc then begin
        DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
        DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat/DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
     end
     else begin
        DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat*DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
        DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
     end;
   end
   else begin
        DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat:=0;
        DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat:=0;
   end;
end;

procedure TFEgresoCaja.dblcTMon2Change(Sender: TObject);
var xWhere:string;
begin
   xWhere:='TMONID='+''''+dblcTMon2.Text+'''';
   edtTMon2.Text:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
end;

procedure TFEgresoCaja.dblcCnp2Change(Sender: TObject);
var xWhere:string;
begin
   xWhere:='CPTOID='+''''+dblcdCnp2.text+'''';
	 edtCnp2.Text:=DMTE.DisplayDescrip('prvCxP','CAJA201','CPTODES',xWhere,'CPTODES');
end;

procedure TFEgresoCaja.dblcCnp2Exit(Sender: TObject);
var xWhere:string;
begin
   xWhere:='CPTOID='+''''+dblcdCnp2.text+'''';
   DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString:=DMTE.DisplayDescrip('prvCxP','CAJA201','CUENTAID',xWhere,'CUENTAID');
end;

procedure TFEgresoCaja.dbeImporte2Exit(Sender: TObject);
var xWhere, aux: string;
begin
    if  z2bbtnCancel3.Focused then exit;

    xWhere:='TMONID='+''''+DMTE.cdsRegCxP.FieldByName('TMONID').AsString+'''';
    aux:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
    if (Length(aux)>0) and (DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat>0) then begin
      if DMTE.cdsRegCxP.FieldByName('TMONID').AsString = DMTE.wTMonLoc then begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat/DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
      end
      else begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat*DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
      end;
    end
    else begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat:=0;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat:=0;
    end;
end;

procedure TFEgresoCaja.dbgDetPagoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (dbgDetPagoIButton.Enabled=True) and (key = VK_DELETE) and (ssCtrl in Shift) then begin
      if (DMTE.cdsRegCxP.RecordCount=0) then
          ShowMessage('No hay registros')
       else begin
          if MessageDlg('¿Eliminar Registro?',mtconfirmation,[mbYes,mbNo],0)=mrYes then begin
             DMTE.cdsRegCxP.Delete;    // Borro en el original..
             z2bbtnSumatClick(sender);    // Al salir hay que totalizar
         end;
      end;
   end;
end;

procedure TFEgresoCaja.dbeDHChange(Sender: TObject);
begin
     if not ((dbeDH.Text='D') or (dbeDH.Text='H') or (Length(dbeDH.Text)=0)) then begin
        dbeDH.Text:='';
        dbeDH.SetFocus;
     end;
end;

procedure TFEgresoCaja.dbeLoteExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then
      exit;

   dbeLote.text:=DMTE.StrZero(dbeLote.text,DMTE.cdsEgrCaja.FieldByName('ECLOTE').Size);
end;

procedure TFEgresoCaja.dblcdProvChange(Sender: TObject);
begin
    wModifica:=True;
end;

procedure TFEgresoCaja.edtProvRUCChange(Sender: TObject);
begin
    wModifica:=True;
end;

procedure TFEgresoCaja.dbeGiradoAChange(Sender: TObject);
begin
    wModifica:=True;
end;

procedure TFEgresoCaja.dbeTCambioChange(Sender: TObject);
begin
    wModifica:=True;
end;

procedure TFEgresoCaja.dbeImporteChange(Sender: TObject);
begin
    wModifica:=True;
end;

procedure TFEgresoCaja.dbeNoDocChange(Sender: TObject);
begin
    wModifica:=True;
end;

procedure TFEgresoCaja.dbeNoChqChange(Sender: TObject);
begin
    wModifica:=True;
end;

procedure TFEgresoCaja.dbeLoteChange(Sender: TObject);
begin
    wModifica:=True;
end;


procedure TFEgresoCaja.dbeGlosaChange(Sender: TObject);
begin
    wModifica:=True;
end;

procedure TFEgresoCaja.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFEgresoCaja.z2bbtnOKCabClick(Sender: TObject);
var  //xERROR ,
 xStr , xWhere :String ;
 xSQL : string;
begin
   xstr := '';

   if validacionCabecera=false then exit;

   with DMTE do begin
      xWhere :=  'CIAID ='+QuotedStr(dblcCia.Text)
                +' AND TDIARID ='+QuotedStr(dblcTDiario.Text)
                +' AND ECANOMM ='+QuotedStr(edtPeriodo.Text)
                +' AND ECNOCOMP ='+QuotedStr(dbeNoComp.Text);
      if DisplayDescrip('prvTGE','CAJA302','COUNT(*) TOTREG',xWhere,'TOTREG') > '0' then
      begin
          ShowMessage('Comprobante ya esta registrado');
          dbeNoComp.Text:='';
          dbeNoComp.SetFocus;
          exit;
      end
      else
      begin
        GrabaCabeceraDeComprobante;

        if DMTE.wCodigoError=9729 then begin
           dbeNoComp.SetFocus;
           Exit;
        end;

        // vhn 22/01/2001
        xSQL:='Select * from CAJA301 '
             +'Where CIAID='''   +dblcCia.Text    +''' and '
             +      'ECANOMM=''' +edtPeriodo.Text +''' and '
             +      'TDIARID=''' +dblcTDiario.Text+''' and '
             +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
        DMTE.cdsRegCxP.Close;
        DMTE.cdsRegCxP.DataRequest( xSQL );
        DMTE.cdsRegCxP.Open;
        // Actualizar Label Estado
        lblEstado.Caption:='Nuevo     ';

        //0805
        //liberamos el filtro del detalle
         DMTE.cdsRegCxP.Filtered := False ;

        //aqui se recupera el tipo de cambio
        xWhere:='TMONID='+QuotedStr(DMTE.wTMonExt)
               +' and FECHA='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date)+''')';
        dbeTCambio.Text:=DMTE.DisplayDescrip('prvTGE','TGE107','TMONID, '+wTipoCambioUsar,xWhere,wTipoCambioUsar);

        // Estado de componentes
        pnlCabecera1.Enabled := false;
        pnlCabecera2.Enabled := True;
        dblcdAux.Enabled    := True;
        //edtProvRUC.Enabled := True;
        //comentario de william manrique cautin

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
      end;
   end;
   (sender as tcontrol).enabled:=false;
   wModifica := False;
   perform(CM_DialogKey,VK_TAB,0);

end;

procedure TFEgresoCaja.LookUpMostrado(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
Var
edicion :^Tedit;
begin
  if modified=true then
  begin
     edicion:=(ptr((Sender as TwwDBCustomLookupCombo).tag));
     if (LookupTable.Eof) or (LookupTable.Eof)
        or ((Sender as TwwDBCustomLookupCombo).Text <> LookUpTable.Fields[0].AsString) then
     begin
         edicion.Text:='';
         (Sender as twwDBCustomLookupCombo).text:='';
     end
     else
         edicion.Text:=LookupTable.Fields[1].AsString;
  end;
end;

procedure TFEgresoCaja.NoEstaenLookUp(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
Var
edicion :^Tedit;
begin
   edicion:=(ptr((Sender as TwwDBLookupCombo).tag));
   edicion.text:='';
   (sender as TwwDBLookUpCombo).text:='';
end;

procedure TFEgresoCaja.MensajeComboNoExit(DBLook:TwwDBCustomLookupCombo);
begin
//LigarEditCombos;
if DBLook.Name='dblcTDiario' then
   ShowMessage('Tipo de Diario Errado')
else if DBLook.Name='dblcCia' then
   ShowMessage('Código de Compañía Errado')
else if DBLook.Name='dblcCCBco' then
   ShowMessage('Falta Cuenta Corriente Banco')
else if DBLook.Name='dblcTDoc' then
   ShowMessage('Tipo de Documento Errado')
else if DBLook.Name='dblcTMon' then
   ShowMessage('Moneda no Registrada')
else if DBLook.Name='dblcCnp' then
   ShowMessage('Concepto no Registrado')
end;

procedure TFEgresoCaja.Validacion(Sender: TObject);
var
edicion :^Tedit;
begin
if (Sender as twwDBCustomLookupCombo).Text='' then
begin
   (Sender as twincontrol).SetFocus;
   MensajeComboNoExit((Sender as TwwDBCustomLookupCombo));
end
else
begin
    edicion:=(ptr((Sender as TwwDBCustomLookupCombo).tag));
    edicion.text:=(Sender as TwwDBCustomLookupCombo).LookUpTable.Fields[1].AsString;
end;
end;
procedure TFEgresoCaja.dblcTDocNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
     NoEstaEnLookUp(Sender,LookupTable,NewValue,Accept);
end;

procedure TFEgresoCaja.dblcTDocCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
LookUpMOstrado(Sender, LookupTable,FillTable, modified);
end;

procedure TFEgresoCaja.dblcCnpNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
     NoestaenLookUp(Sender,LookupTable, NewValue, Accept);
end;

procedure TFEgresoCaja.dblcCnpCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
LookUpMostrado(Sender,LookupTable, FillTable,modified);
end;

procedure TFEgresoCaja.InhabilitarPaneles;
begin

   pnlDetPago.Enabled  := False;
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
procedure TFEgresoCaja.EdiTarRegistros;
begin
   BlanqueaEdits(pnlActualiza) ;
   DMTE.cdsRegCxP.Edit ;                                 //Lo pongo en modo de edicion
   dbeNoReg.Text:=DMTE.strzero(DMTE.cdsRegCxP.FieldByName('CPNOREG').AsString,10) ;
   dbeNoReg.Enabled:=false;
   edtCnp2.text:=DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString;
   label1.Caption := 'En Edicion';
   dbeNoReg.Enabled := False;
   dbeNoReg.Color   := clBtnFace;

   //Recuperacion de los detalles del panel
   if trim( dblcTDoc2.Text ) <> '' then
      edtTDoc2.Text:=DMTE.DisplayDescrip('prvTGE','TGE110','DOCABR','DOCID=''' + dblcTDoc2.Text + '''','DOCABR') ;

   if trim( dblcdAuxDet.Text ) <> '' then
   begin
      dbeAuxDet.Text    :=
            DMTE.DisplayDescrip('prvTGE','CNT201','AUXABR',
                               'CLAUXID = ''' +
                               DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString
                                + ''' AND AUXID=''' + dblcdAuxDet.Text + '''','AUXABR') ;
      edtClaseDet.Text     :=
            DMTE.DisplayDescrip('prvTGE','TGE102','CLAUXDES',
                               'CLAUXID = ''' +
                               DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString + ''' ','CLAUXDES') ;

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

procedure TFEgresoCaja.AdicionarRegistros;
var
   xWhere : string;
begin
   dbeNoReg.Enabled:=true;
   dbeNoReg.Text := '';
   dbeNoReg.Text := DMTE.StrZero(GeneraCorrelativo( DMTE.cdsRegCxP, 'CPNOREG' ), 10);
   DMTE.cdsRegCxP.Insert;
   DMTE.cdsRegCxP.FieldByName('CIAID').AsString   :=dblcCia.Text;
   DMTE.cdsRegCxP.FieldByName('TDIARID').AsString :=dblcTDiario.Text;
   DMTE.cdsRegCxP.FieldByName('ECANOMM').AsString :=edtPeriodo.Text;
   DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString:=dbeNoComp.Text;
   DMTE.cdsRegCxP.FieldByName('DOCID2').AsString  :=dblcTDoc.text;
   DMTE.cdsRegCxP.FieldByName('DOCMOD').AsString  :=DMTE.cdsTDoc.FieldByname('DOCMOD').AsString;

   xWhere:='DOCID='''+dblcTDoc.text+'''';
   edtTDoc2.text:= DMTE.DisplayDescrip('prvTGE','TGE110','DOCDES',xWhere,'DOCDES');

   DMTE.cdsRegCxP.FieldByName('CPTOID').AsString:=dblcdCnp.text;

   xWhere := 'CPTOID='+QuotedStr(dblcdCnp2.Text);
   edtCnp2.text:= DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CUENTAID,CPTODES',xWhere,'CPTODES');

   DMTE.cdsRegCxP.FieldByName('TDIARID2').AsString:=dblcTDiario.text;

   DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString:=DMTE.cdsQry.FieldByname('CUENTAID').AsString;
   xWhere:='CIAID='''+dblcCia.Text+''' AND CUENTAID='''+DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString+'''';
   DMTE.DisplayDescrip('prvTGE','TGE202','CUENTAID, CTA_CCOS, CTA_AUX',xWhere,'CuentaId');

   if DMTE.cdsQry.FieldByName('CTA_AUX').asString = 'S' then
   begin
      DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString :=dblcClase.text;
      xWhere:='CLAUXID='+''''+dblcClase.text+'''';
      edtClaseDet.text:= DMTE.DisplayDescrip('prvTGE','TGE102','CLAUXDES',xWhere,'CLAUXDES');

      xWhere :='';
      DMTE.cdsRegCxP.FieldByName('PROV').AsString := dblcdAux.text;
      xWhere:='AUXID='+''''+dblcdAux.text+'''';
      dbeAuxDet.text:= DMTE.DisplayDescrip('prvTGE','CNT201','AUXNOMB',xWhere,'AUXNOMB');
   end;

   xWhere := '';
   DMTE.cdsRegCxP.FieldByName('TMonid').AsString  :=dblcTMon.text;
   xWhere:='TMONID='+''''+dblcTMon2.text+'''';
   edtTMon2.text:= DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
   DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat   := strtofloat(dbeImporte.text);
   DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString   := dbeNodoc.text;

   DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat  := strtofloat(dbeTCambio.Text);
   DMTE.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime  := dbdtpFComp.Date;
   DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime  := DateS;
   DMTE.cdsRegCxP.FieldByName('CPFVCMTO').AsDateTime := DateS;
   DMTE.cdsRegCxP.FieldByName('CPANOMM').AsString  := copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime),7,4)
                            + copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime),4,2);
   DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat  := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DMTE.cdsRegCxP.FieldByName('DEDH').AsString     := 'D';     //Inicializo en Debe
   DMTE.cdsRegCxP.FieldByName('DETCDOC').AsString := dbeTCambio.Text ;
   DMTE.cdsRegCxP.FieldByName('DETCPAG').AsString := dbeTCambio.Text ;

   DMTE.cdsRegCxP.FieldByName('CPSerie').AsString := wSerie;
   dbeImporte2Exit(Self);

   dbeNoReg.SetFocus;
end;


procedure TFEgresoCaja.dbgDetPagoDblClick(Sender: TObject);
begin
   if not dbgdetpagoibutton.Enabled then
      exit ;

   if dbgDetPago.DataSource.DataSet.RecordCount<>0 then
   begin
      inHabilitarPaneles;
      editarRegistros;
   end;
end;


procedure TFEgresoCaja.dblcTDoc2Exit(Sender: TObject);
var
   Filtro : String ;
begin
   if z2bbtnCancel3.Focused then Exit;

   edtTDoc2.text:= DMTE.DisplayDescripLocal(DMTE.cdsTDoc,'DOCID',dblcTDoc2.Text,'DOCDES') ;

   if edtTDoc2.Text='' then begin
      ShowMessage('Error : Tipo de Documento no Valido');
      dblcTDoc2.SetFocus;
      Exit;
   end;
   edtCnp2.text:=DMTE.cdsRegCxP.FieldByName('DEGLOSA').AsString;
   DMTE.cdsRegCxP.FieldByName('DOCMOD').AsString:=DMTE.cdsTDoc.FieldByname('DOCMOD').AsString;
end;

procedure TFEgresoCaja.LiberarFiltrosRegistroEgresos;
begin
   //VHN
   //   DMTE.cdsTDoc.Filter:='';
   //   DMTE.cdsTDoc.Filtered:=true;
   //
   
      bFlagRecuperacion:=false;
end;

procedure TFEgresoCaja.EstablecerFiltrosRegistroEgresos;
begin
   //VHN
   //   DMTE.cdsTDoc.Filter   := ' NOT ( TDIARID IS NULL ) OR NOT ( TDIARID2 IS NULL ) AND DOCMOD= '+QuotedStr('CAJA') ;
   //   DMTE.cdsTDoc.Filtered := True;
   //
      bFlagRecuperacion    := True;
end;

procedure TFEgresoCaja.FormCreate(Sender: TObject);
var
xWhere: string;
begin

   DMTE.cdsRegCxP.DisableControls;

   DMTE.ASignaTipoDiario(dblcTDiario,self) ;

   cdsConceptoC1 := TwwClientdataset.Create(Self) ;
   cdsConceptoC1.CloneCursor(DMTE.cdsCnpEgr ,True) ;
   cdsConceptoC1.Name := 'cdsConceptoC1' ;
   cdsConceptoC1.Filtered := True ;
   dblcdCnp2.LookupTable := cdsConceptoC1 ;

   DMTE.cdsFEfec.Filter := 'FLUEFE_IS = ''S'' ' ;
   DMTE.cdsFEfec.Filtered := True ;
   DMTE.cdsRegCxP.EnableControls;
   setlength(A2digitos,1) ;
   setlength(A4digitos,1) ;
   A2digitos[0] := dbeImporte ;
   A4digitos[0] := dbeTCambio ;
   cf1 := TControlFoco.Create ;
//Se captura el id del TDOC
   xWhere := ' DOCPROV = '+''''+'S'+'''';
   wTDocRxH:= DMTE.DisplayDescrip('prvTGE','TGE110','DOCID',xWhere,'DOCID');
   wSerie := '000';
//


end;

procedure TFEgresoCaja.Button1Click(Sender: TObject);
begin
dblcdCCosto.Text:='';
end;

function TFEgresoCaja.ValidacionCabecera: Boolean;
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
          ShowMessage('Caja/Banco no esta Relacionado a Tipo de Diario');
          dblcBanco.SetFocus;
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

procedure TFEgresoCaja.z2bbtnImprimeClick(Sender: TObject);
var
	 Comprobante : RCabComprobante;
	 xSQL : string;
begin
   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' THEN
	 begin
   		RecCptosDifC ;
		  Contabiliza;

      ActualizaCNT311( DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
                       DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                       DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                       DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString );

{      if SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                  DMTE.SRV_D, 'P', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                  DMTE.cdsResultSet, DMTE.DCOM1, Self ) then}

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

procedure TFEgresoCaja.ValidacionCabecera1;
begin
	 // Nota: El "raise" termina el procedure o function si es que se da la consistencia
	 // En este punto ya se ha probado todas las consistencias y ya se puede grabar

	 try
    // consistencia de Datos
      ValidaEDit( dblcCia ,     'Falta Codigo de Compañia' ) ;
      ValidaEDit( dblcTDiario , 'Falta Tipo de Diario' ) ;
      ValidaEDit( dblcdAux ,    'Faltan Datos del Auxiliar' ) ;
      ValidaEDit( dbeGiradoA ,  'Datos del Proveedor Errados' ) ;
      ValidaEDit( dblcTMon ,    'Falta Tipo de Moneda' ) ;
      ValidaEDit( dbeTCambio ,  'Falta Tipo de Cambio' ) ;
      //validar tipo de cambio cero <=0
      ValidaEDit( dbeImporte ,  'Falta Monto a Pagar' ) ;
      //Validar Importe errado <=0
      ValidaEDit( dblcTDoc ,    'Falta Tipo de Documento' ) ;
      ValidaEDit( dbeNoDoc ,    'Falta Nro.de Documento' );
      ValidaEDit( dblcBanco ,   'Falta definir Caja / Banco' ) ;
      ValidaEDit( dbeLote ,     'Falta Lote');
      ValidaEDit( dblcdCnp ,     'Falta Concepto');
      if dblcCCBco.Enabled=True then
      begin
         ValidaEDit( dblcCCBco , 'Falta Cuenta Corriente Banco' ) ;
         IF dbdtpFEmis.Date = 0 then
         begin
            dbdtpFEmis.SetFocus ;
            raise Exception.create('Ingrese Fecha de Emisión del Cheque') ;
         end ;
      end;
      if dblcFormPago.Enabled=True then
         ValidaEDit( dblcFormPago , 'Falta Forma de Pago' ) ;

      if strtofloat(dbeTCambio.Text)<=0 then
      begin
         dbeTCambio.SetFocus ;
         raise Exception.Create('Tipo de Cambio Errado') ;
      end ;

      if strtofloat(dbeImporte.Text)<=0 then
      begin
         dbeImporte.SetFocus ;
         raise Exception.Create('Importe Errado');
      end;

      if (dbeNoChq.Enabled=True) and (Length(dbeNoChq.Text)=0) then
      begin
         dbeNoChq.SetFocus ;
         raise Exception.Create('Falta No. de Cheque');
      end;

   except
      raise;
   end ;

end;


procedure TFEgresoCaja.dblcBancoEnter(Sender: TObject);
begin
   strTmp := dblcBanco.text ;
end;

procedure TFEgresoCaja.dblcFormPagoExit(Sender: TObject);
var
   xwhere,Tmp : String ;
begin
   if z2bbtnCancel.Focused then exit;
   if dblcTMon.Focused then exit;

   edtFormPago.text:= DMTE.DisplayDescripLocal(DMTE.cdsFormPago,'FPAGOID',dblcFormPago.Text,'FPAGODES') ;

   if dblcFormPago.Text='' then begin
      dbeNoChq.Text :='';
      ShowMessage('Error : Forma de Pago no Válida');
      dblcFormPago.SetFocus;
      Exit;
   end;

   if DMTE.cdsFormPago.FieldByName('FCANJE').AsString= 'A' then
   begin
      ShowMessage('Error : Forma de Pago no Válida para esta Opción');
      dblcFormPago.SetFocus;
      Exit;
   end;

   if (DMTE.cdsFormPago.FieldByName('FCHQ').AsString='1') or
      (DMTE.cdsFormPago.FieldByName('FCHQ').AsString='S') then
   begin
      dbeNoChq.Enabled   := True ;
      dbdtpFEmis.Enabled := True ;
      dbeNoChq.SetFocus;
   end
   else
   begin
      dbeNoChq.Enabled   := False ;
      dbdtpFEmis.Enabled := False ;
   end;

   if DMTE.cdsFormPago.FieldByName('FCANJE').AsString='S' then begin
      DMTE.abreCuentas(dblcCia.text) ;
      edtCuenta.Enabled := True;
   end
   else
   begin
      edtCuenta.Enabled := False ;
   end;

   if ( not dbeNoChq.Enabled ) and ( not dbdtpFEmis.Enabled ) and ( not edtCuenta.Enabled ) then
   begin
      if (pnlCabecera2.Enabled= True) and (dblcTDoc.Enabled = True) then
          dblcTDoc.setFocus;
   end;       
end;

procedure TFEgresoCaja.Adiciona ;
var
   xSQL : String ;
begin
   IniciaDatos ;

   dblcCCBco.Selected.Clear;
   dblcCCBco.Selected.Add('CCBCOID'#9'25'#9'Cuenta Corriente del Banco'#9'F');
   dblcCCBco.Selected.Add('CCBCODES'#9'30'#9'Descripción'#9'F');
   dblcCCBco.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');

   edtCuenta.Enabled := False ;
   xGraboNuevo := false ;
   //0806

   // vhn 23/01/2001
   xSQL:='Select * from CAJA301 '
        +'Where CIAID='''' and ECANOMM='''' and '
        +      'TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsRegCxP.Close;
   DMTE.cdsRegCxP.DataRequest( xSQL );
   DMTE.cdsRegCxP.Open;

   //
   DMTE.cdsRegCxP.Filter := 'CIAID=''''' ;
   DMTE.cdsRegCxP.Filtered := True ;

   z2bbtnNuevo.Visible := True ;
   Z2bbtnCancel.Visible := True ;
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
end;

procedure TFEgresoCaja.Edita( cds : Twwclientdataset);
var
   xERROR :String ;
   xSQL, xSQLx : string;
begin
   IniciaDatos;

   with DMTE do
   begin
      dblcCia.Text      :=  cdsEgrCaja.FieldByName('CIAID').AsString ;
      dblcTDiario.Text  :=  cdsEgrCaja.FieldByName('TDIARID').AsString ;
      edtPeriodo.Text   :=  cdsEgrCaja.FieldByName('ECANOMM').AsString ;
      dbeNoComp.Text    :=  cdsEgrCaja.FieldByName('ECNOCOMP').AsString ;

      // vhn 22/01/2001
      xSQL:='Select * from CAJA301 '
           +'Where CIAID='''   +cdsEgrCaja.FieldByName('CIAID').AsString   +''' and '
           +      'ECANOMM=''' +cdsEgrCaja.FieldByName('ECANOMM').AsString +''' and '
           +      'TDIARID=''' +cdsEgrCaja.FieldByName('TDIARID').AsString +''' and '
           +      'ECNOCOMP='''+cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' ';
      DMTE.cdsRegCxP.Close;
      DMTE.cdsRegCxP.DataRequest( xSQL );
      DMTE.cdsRegCxP.Open;

      // Asignar desde valores del registro activo
      dbdtpFComp.date:= cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime ;
      dblcClase.Text := cdsEgrCaja.FieldByName('CLAUXID').AsString ;

      xSQLx:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+'''';
      DMTE.cdsAux.Close;
      DMTE.cdsAux.DataRequest( xSQLx ) ;
      DMTE.cdsAux.Open;

      dblcdAux.Selected.Clear;
      dblcdAux.Selected.Add('AUXID'#9'15'#9'Auxiliar'#9'F');
      dblcdAux.Selected.Add('AUXRUC'#9'15'#9'R.U.C'#9'F');
      dblcdAux.Selected.Add('AUXABR'#9'15'#9'Abreviatura'#9'F');
      dblcdAux.Selected.Add('AUXNOMB'#9'20'#9'Nombre Auxiliar'#9'F');

      dblcdAux.Text    := cdsEgrCaja.FieldByName('PROV').AsString ;
      edtAuxRUC.Text   := cdsEgrCaja.FieldByName('PROVRUC').AsString ;
      dbeGiradoA.Text  := cdsEgrCaja.FieldByName('ECGIRA').AsString ;
      dblcTMon.Text    := cdsEgrCaja.FieldByName('TMONID').AsString ;
      dbeTCambio.Text  := cdsEgrCaja.FieldByName('ECTCAMB').AsString;
      dbeImporte.Text  := cdsEgrCaja.FieldByName('ECMTOORI').AsString;
      dblcTDoc.Text    := cdsEgrCaja.FieldByName('DOCID').AsString;
      dbeNoDoc.Text    := cdsEgrCaja.FieldByName('ECNODOC').AsString;
      dblcBanco.Text   := cdsEgrCaja.FieldByName('BANCOID').AsString;
      dblcCCBco.Text   := cdsEgrCaja.FieldByName('CCBCOID').AsString;
      edtCuenta.Text   := cdsEgrCaja.FieldByName('CUENTAID').AsString;
      dblcFormPago.Text:= cdsEgrCaja.FieldByName('FPAGOID').AsString ;
      dbeNoChq.Text    := cdsEgrCaja.FieldByName('ECNOCHQ').AsString;
      dbeLote.Text     := cdsEgrCaja.FieldByName('ECLOTE').AsString;
      dblcdCnp.Text    := cdsEgrCaja.FieldByName('CPTOID').AsString;
      dbeGlosa.Text    := cdsEgrCaja.FieldByName('ECGLOSA').AsString;
      dbdtpFEmis.date  := cdsEgrCaja.FieldbyName('ECFEMICH').AsDateTime ;
      dblcdFEfec.Text  := cdsEgrCaja.FieldByName('FLUEID').AsString ;
      edtAuxNombre.text:=DMTE.DisplayDescrip('prvTGE','CNT201','AUXNOMB','CLAUXID = '+QuotedStr(dblcClase.Text)+' AND AUXID='+QuotedStr(dblcdAux.Text),'AUXNOMB');
      dbeRepo.Text     :=cdsEgrCaja.FieldByName('ECNOREPO').AsString;

      lblSujetoRetencion.visible:=((DMTE.DisplayDescrip('prvTGE','CNT201','PROVRETIGV',
															 'CLAUXID = ''' +
															 dblcClase.text
																+ ''' AND AUXID=''' + dblcdAux.Text + '''','PROVRETIGV')='S') AND (wCiaRetIGV)) ;
      //
      // RECUPERACION DE DATOS ADICIONALES
      // SQLAdicEgresos(var xCIAID, xECANOMM, xTDIARID,
      // xECNOCOMP: WideString; out xError: WideString);

      DMTE.SQLAdicEgresos(dblcCia.Text,edtPeriodo.Text,
                          dblcTDiario.Text,dbeNoComp.Text , xERROR) ;
      DMTE.cdsRec.active := False ;
      DMTE.cdsRec.active := True ;

      if not DMTE.cdsRec.FieldByName('DOCDES').isnull then
         edtTDoc.Text := DMTE.cdsRec.FieldByName('DOCDES').AsString ;
      if not DMTE.cdsRec.FieldByName('FPAGOABR').isnull then
         edtFormPago.Text := DMTE.cdsRec.FieldByName('FPAGOABR').AsString ;
      if not DMTE.cdsRec.FieldByName('BANCOABR').isnull then
         edtBanco.text := DMTE.cdsRec.FieldByName('BANCOABR').AsString ;

      // VHNDEMA
      wBcoTipCta := DMTE.cdsRec.FieldByName('BCOTIPCTA').AsString;
      // END VHNDEMA

      dbeFEfec.text := DMTE.fieldnonulo(DMTE.cdsRec.FieldByName('FLUEFEABR')) ;

      edtClase.text := DMTE.cdsRec.FieldByName('CLAUXABR').AsString ;
      edtCia.Text := DMTE.FieldNoNulo(DMTE.cdsRec.fieldBYname('CIADES'));
      xDetraccion   := DMTE.DisplayDescripLocal(DMTE.cdsCnpEgr, 'CPTOID', dblcdCnp.Text, 'FCTZ') ;


      if cdsEgrCaja.FieldByName('ECEstado').AsString='I' then      //Si está INCOMPLETO
      begin
         // Activar modo de Editado
         cdsEgrCaja.Edit;

         // Estado de componentes
         pnlCabecera1.Enabled := False;    // Desactivar Panel1
         pnlCabecera2.Enabled := True;     // Activar Panel2
         dblcClase.Enabled    := False;     // El proveedor ya no se puede modificar
         dblcdAux.Enabled     := False;     // El proveedor ya no se puede modificar
         edtAuxRUC.Enabled    := False;
         z2bbtnOk.Enabled     := True;
         z2bbtnCancel.Enabled := True;

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
         lblEstado.Caption    :='Activo             ';
      end;

      if cdsEgrCaja.FieldByName('ECESTADO').AsString='C' then      //Si está CANCELADO
      begin
         pnlCabecera1.Enabled := False;    // Desactivar Panel1
         pnlCabecera2.Enabled := False;    // Desactivar Panel2
         pnlDetPago.Enabled   := True;     // Activar Panel de Detalle
         pnlBotones.Enabled   := True;     // Activar Panel de Botones

         dbgDetPagoIButton.Enabled:=False;
         z2bbtnOk.Enabled       := False;
         z2bbtnCancel.Enabled   := False;

         wbSumat              := False;
         if cdsEgrCaja.FieldByName('ECCONTA').AsString='S' then
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

         wbNuevo     := True;
         wbImprime   := True;
         wbSube      := False;
         wbGraba     := False;
         wbCancelado := False;
         wbCancel2   := False;
         wbChq       := False ;

         ActPnlBotones;
      end;

      if cdsEgrCaja.FieldByName('ECESTADO').AsString='A' then      // Si esta ANULADO
      begin
         pnlCabecera1.Enabled := False;    // Desactivar Panel1
         pnlCabecera2.Enabled := False;    // Desactivar Panel2
         pnlDetPago.Enabled   := True;     // Activar Panel de Detalle
         pnlBotones.Enabled   := True;     // Activar Panel de Botones

         dbgDetPagoIButton.Enabled:=False;
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
         ActPnlBotones;
         lblEstado.Caption     :='Anulado            ';
      end;

      z2bbtnSumatClick(nil);

      z2bbtnOkCab.enabled:=false;
      wModifica := False;

      z2bbtnNuevo.Visible := False ;
      Z2bbtnCancel.Visible := False ;

   end;{fin del with}
end;


procedure TFEgresoCaja.FormShow(Sender: TObject);
var
   xSQL, xWhere : string;
begin
  if DMTE.wModo='A' then
     Adiciona
  else
     Edita( DMTE.cdsEgrCaja );

  xSQL := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
  DMTE.cdsCCosto.Close;
  DMTE.cdsCCosto.DataRequest(xSQL);
  DMTE.cdsCCosto.open;
  xVoucher := '';
  if (DMTE.cdsFormPago.RecordCount = 1) and (DMTE.wModo <> 'A' ) then
  begin
     edtFormPago.text:= DMTE.DisplayDescripLocal(DMTE.cdsFormPago,'FPAGOID',dblcFormPago.Text,'FPAGODES') ;
     //dblcFormPago.OnExit(self);
     xWhere := 'FPAGOID='+QuotedStr(dblcFormPago.text);
     if DMTE.DisplayDescrip('prvQry2','TGE112','FCANJE,FPAGODES',xWhere,'FCANJE') = 'S' then
        edtCuenta.Enabled := True;
     dblcCia.OnExit(self);
  end;
  if strtoint(dbeLote.Text)=0 then dbeLote.Text := '000';

  if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='C' then
     z2bbtnSumatClick(sender);

   with DMTE do
   begin
      if Trim(dblcBanco.Text) <> '' then
      begin
          if cdsEgrCaja.FieldByName('ECESTADO').AsString='I' then      //Si está INCOMPLETO
          begin
               //focus
               pnlCabecera2.SetFocus ;
               perform(CM_DialogKey,VK_TAB,0) ;
               //
          end ;

          if (cdsEgrCaja.FieldByName('ECESTADO').AsString='C') or (cdsEgrCaja.FieldByName('ECESTADO').AsString='A') then      //Si está CANCELADO
          begin
            //focus
            pnlBotones.SetFocus ;
            perform(CM_DialogKey,VK_TAB,0) ;
            //
          end ;
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
   //** 10/02/2001 - pjsv
   dblcCiaExit(sender);
   //**
      lblSujetoRetencion.visible:=((DMTE.DisplayDescrip('prvTGE','CNT201','PROVRETIGV',
															 'CLAUXID = ''' +
															 dblcClase.text
																+ ''' AND AUXID=''' + dblcdAux.Text + '''','PROVRETIGV')='S') AND (wCiaRetIGV)) ;


   cf1.PonerExits ;
end;

procedure TFEgresoCaja.dblcClaseExit(Sender: TObject);
var
   xSQLx : string ;
begin

   edtClase.text:= DMTE.DisplayDescripLocal(DMTE.cdsClaseAux,'CLAUXID',dblcClase.Text,'CLAUXDES') ;

   if edtClase.Text='' then begin
      dblcdAux.Text  := '' ;
      edtAuxRUC.Text := '' ;
      dbeGiradoA.Text:= '' ;
      ShowMessage('Error : Clase de Auxiliar');
      dblcClase.SetFocus;
      Exit;
   end;

   xSQLx:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+'''';
   DMTE.cdsAux.Close;
   DMTE.cdsAux.DataRequest( xSQLx ) ;
   DMTE.cdsAux.Open;

   dblcdAux.Selected.Clear;
   dblcdAux.Selected.Add('AUXID'#9'13'#9'Auxiliar'#9'F');
   dblcdAux.Selected.Add('AUXRUC'#9'13'#9'R.U.C'#9'F');
   dblcdAux.Selected.Add('AUXABR'#9'15'#9'Abreviatura'#9'F');
   dblcdAux.Selected.Add('AUXNOMB'#9'20'#9'Nombre Auxiliar'#9'F');

   BuscaNReposicion;
end;

procedure TFEgresoCaja.dblcdAuxExit(Sender: TObject);
var
   xSql, xAuxt: string ;
begin

   if z2bbtnCancel.Focused then exit;
   if dblcClase.Focused    then Exit ;

   xAuxt:= DMTE.DisplayDescripLocal(DMTE.cdsAux,'AUXID',dblcdAux.Text,'AUXID') ;

   if xAuxt='' then begin
      dblcdAux.Text  := '' ;
      edtAuxRUC.Text := '' ;
      dbeGiradoA.Text:= '' ;
      ShowMessage('Error : Auxiliar No Valido');
      dblcdAux.SetFocus;
      Exit;
   end;

   if DMTE.cdsAux.FieldByName('AUXGIRA').AsString='' then begin
      dbeGiradoA.Text  := DMTE.cdsAux.FieldByName('AUXNOMB').Asstring;
      edtAuxNombre.text:= DMTE.cdsAux.FieldByName('AUXNOMB').Asstring;
   end
   else begin
      dbeGiradoA.Text  := DMTE.cdsAux.FieldByName('AUXGIRA').Asstring;
      edtAuxNombre.text:= DMTE.cdsAux.FieldByName('AUXNOMB').Asstring;
   end;
   lblSujetoRetencion.visible:=((DMTE.DisplayDescrip('prvTGE','CNT201','PROVRETIGV',
															 'CLAUXID = ''' +
															 dblcClase.text
																+ ''' AND AUXID=''' + dblcdAux.Text + '''','PROVRETIGV')='S') AND (wCiaRetIGV)) ;
   edtAuxRuc.Text:= DMTE.cdsAux.FieldByName('AUXRUC').Asstring;
end;

procedure TFEgresoCaja.AdicIniciaDatos;
begin
   RecuperarCiaUnica(dblcCia,edtCia);
   edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
   if dblccia.text <> '' then
      perform(CM_DialogKey,VK_TAB,0);

end;

procedure TFEgresoCaja.ActualizaSaldosCaja;
begin
   if trim(dblcCCBco.TEXT) <> '' then
   begin
      DMTE.ActSdoTlfn(dblcCia.Text,dblcBanco.text,dblcCCBCo.Text,
                     DMTE.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                     DBDTPfcOMP.DATE) ;
      DMTE.ActSdoMen(dblcBanco.text,dblcCCBCo.Text,
                     DMTE.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                     DBDTPfcOMP.DATE) ;
   end ;
end;

procedure TFEgresoCaja.ConfiguraAccesos;
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

procedure TFEgresoCaja.Libera_Admin;
begin
   Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFEgresoCaja.Libera_Consul;
begin

end;

procedure TFEgresoCaja.Proc_Admin;
var
   Contador : Integer ;
begin
   pnlCabecera1.Enabled := False ;
   pnlCabecera2.Enabled := False ;
   pnlDeTPago.Enabled := False ;
   Contador := BotonesEnPanel( pnlBotones ) ;
   setlength( A1 , Contador) ;
   setlength( A2 , Contador) ;
   Quita(A1,A2,pnlBotones) ;

   pnlBotones.Enabled := True ;
end;

procedure TFEgresoCaja.Proc_Consul;
begin
   pnlCabecera1.Enabled := False ;
   pnlCabecera2.Enabled := False ;
   pnlDeTPago.Enabled := True ;
   pnlBotones.Enabled := False ;
end;

procedure TFEgresoCaja.LibConfigAccesos;
begin
    if DMTE.wAdmin = 'G' then
       Libera_Admin
    else
    begin
       if DMTE.wModo = 'C' then
          Libera_Consul ;
    end ;

end;

procedure TFEgresoCaja.Z2bbtnEmiChqClick(Sender: TObject);
var
   strChq : structChq ;
   xSQL,ArchivoReporte : string ;
   xTotal : double;
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

   if trim(dblcCCBco.Text) <> '' then
   begin
      //** 08/03/2001 - pjsv - para validar que no se reimprima el chq

      /////////////////////////////////////////
      xTotal :=0;
      xSQL:='Select SUM( MTORETLOC ) RETLOC, SUM( MTORETEXT ) RETEXT '
           +'from CNT320 '
           +'WHERE CIAID='''   + DMTE.cdsEgrcaja.FieldByName('CIAID').AsString    +''' AND '
           +      'ANOMM='''   + DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString  +''' AND '
           +      'TDIARID=''' + DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString  +''' AND '
           +      'ECNOCOMP='''+ DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString +''' AND '
           +      '( DOCID2 IS NULL OR DOCID2='''' ) ';
           
      DMTE.cdsQry4.IndexFieldNames :='';
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


      xSQL:=' CIAID='''   +dblcCia.text+''' and '
          +      'TDIARID=''' +dblcTDiario.text +''' and '
          +      'ECANOMM=''' +edtPeriodo.text+''' and '
          +      'ECNOCOMP='''+dbeNoComp.text+''' ';
      if DMTE.DisplayDescrip('prvSQL','CAJA302','ECCHQEMI',xSQL,'ECCHQEMI') <> 'S' then
      //**
       begin
        DMTE.RecuperarDatos('TGE106','*',
                           'BANCOID = ''' + dblcBanco.text+ ''' AND CCBCOID = ''' + dblcCCBco.Text+ '''') ;
        ArchivoReporte  := DMTE.cdsRec.FieldByName('CCFMTCHQ').ASString ;
        if ArchivoReporte = '' then
         ArchivoReporte := 'ChqDefault.rtm';
        with strChq do
        begin
           ppFileName    := ArchivoReporte                                             ;
           ppGiradoA     := dbeGiradoA.Text                                            ;
//           ppImporte     := floattostrf(strtocurr(trim(dbeImporte.Text)),fffixed,10,2) ;
           ppImporte     := floattostrf(strtocurr(trim(Floattostr(xTotal))),fffixed,10,2) ;
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

procedure TFEgresoCaja.dbeTCambioEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFEgresoCaja.dbeImporteEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFEgresoCaja.dbeTCambioExit(Sender: TObject);
begin
    if strTmp <> dbeTCambio.text then
    begin
       dbeTcambio.text := CajaDec(dbeTCambio.text,4) ;
    end ;
end;

procedure TFEgresoCaja.dbeImporteExit(Sender: TObject);
begin
    if strTmp <> TCustomEdit(Sender).text then
    begin
       TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text) ;
    end ;
end;


procedure TFEgresoCaja.RecCptosDifC;
begin
    if trim(dblcCCBco.Text) = '' then
    begin
       if not DMTE.RecuperarDatos('TGE105','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP,CCOSDIF','BANCOID=''' + dblcBanco.Text + '''' )  then
          Raise Exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio') ;
    end
    else
    begin
       if not DMTE.RecuperarDatos('TGE106','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP,CCOSDIF','BANCOID=''' + dblcBanco.Text +
                                 ''' AND CCBCOID=''' + dblcCCBco.Text + '''' )  then
          Raise Exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio') ;
    end ;
    wCptoGan  := DMTE.cdsRec.FieldByName('CPTODIFG').AsString ;
    wCptoPer  := DMTE.cdsRec.FieldByName('CPTODIFP').AsString ;
    wCtaGan   := DMTE.cdsRec.FieldByName('CTADIFG').AsString ;
    wCtaPer   := DMTE.cdsRec.FieldByName('CTADIFP').AsString ;
    wCCosDif  := DMTE.cdsRec.FieldByName('CCOSDIF').AsString ;
end;

procedure TFEgresoCaja.dblcdAuxExit2(Sender: TObject);
var
  xAuxd : String;
begin
   if z2bbtnCancel3.Focused then Exit;
   if dblcClaseDet.Focused then Exit;

	 dbeAuxDet.Text:= DMTE.DisplayDescripLocal(DMTE.cdsProv,'AUXID',dblcdAuxDet.Text,'AUXNOMB') ;

   if dbeAuxDet.Text='' then
   begin
      ShowMessage('Error : Auxiliar no Existe');
      dblcdAuxDet.SetFocus;
   end;
end;

procedure TFEgresoCaja.dblcdCnp2Exit2(Sender: TObject);
var
   ssql,xwhere : string ;
begin
   if z2bbtnCancel3.Focused then Exit;

	if edtCnp2.text='' then
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

   xWhere:='CIAID='''+dblcCia.Text+''' AND CUENTAID='''+DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString+'''';

   DMTE.DisplayDescrip('prvTGE','TGE202','CUENTAID, CTA_CCOS, CTA_AUX',xWhere,'CuentaId');

   if DMTE.cdsQry.FieldByName('CTA_AUX').asString = 'S' then
   begin
      dblcdAuxDet.Enabled :=True;
      dblcClaseDet.Enabled:=True;
//      dblcClaseDet.SetFocus;
   end
   else begin
      dblcdAuxDet.Enabled :=False;
      dblcClaseDet.Enabled:=False;
      DMTE.cdsRegCxP.FieldByName('PROV').AsString   := '' ;
      DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString:= '' ;
      //** 2002/04/29 - PJSV
      edtClaseDet.TEXT := '';
      dbeAuxDet.TEXT := '';
      //**

   end;

   if DMTE.cdsQry.FieldByName('CTA_CCOS').AsString='S' then
   begin
      ssql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
      DMTE.cdsCCosto.Close;
      DMTE.cdsCCosto.DataRequest(ssql);
      DMTE.cdsCCosto.open;
      dblcdCCosto.Enabled:=true;
//      if not dblcdAuxDet.Enabled then
//         dblcdCCosto.SetFocus;
   end
   else begin
      dblcdCCosto.Enabled := False ;
      DMTE.cdsRegCxP.FieldByName('CCOSID').AsString := '' ;
   end;

   edtCnp2.SetFocus;
end;

procedure TFEgresoCaja.wwDBEdit1Change22(Sender: TObject);
begin
    wModifica:=True;
end;
procedure TFEgresoCaja.dblcClaseDetExit(Sender: TObject);
var
   Tmp, sSQL : String ;
begin
    if z2bbtnCancel3.Focused then Exit;
    if dblcdCnp2.Focused then Exit;

    edtClaseDet.text:= DMTE.DisplayDescripLocal(DMTE.cdsClaseAux,'CLAUXID',dblcClaseDet.Text,'CLAUXDES') ;

    if (dblcClaseDet.Text='') and (edtClaseDet.text<>'') then
    begin
       ShowMessage('Clase de Auxiliar no Existe');
       dblcdAuxDet.Text := '' ;
       dbeAuxDet.Text := '' ;
       dblcClaseDet.SetFocus;
		end ;

	 sSQL:='Select * from CNT201 Where CLAUXID='''+dblcClaseDet.Text+'''';
	 DMTE.cdsProv.Close;
	 DMTE.cdsProv.DataRequest( sSQL );
	 DMTE.cdsProv.Open;
end;

procedure TFEgresoCaja.FormDestroy(Sender: TObject);
begin
   cf1.Free ;
end;

procedure TFEgresoCaja.dblcdFEfecExit(Sender: TObject);
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

procedure TFEgresoCaja.dblcdFEfecEnter(Sender: TObject);
begin
   strTmp := dblcdFEfec.Text ;
end;

procedure TFEgresoCaja.ActualizaFiltro;
begin

    if z2bbtnNuevo.Visible then
    begin
       if not xGraboNuevo then
          cdsFiltro.append ;
       DMTE.ActualizaCDS(DMTE.cdsEgrCaja,cdsFiltro) ;
    end
    else
    begin
       DMTE.ActualizaCDS(DMTE.cdsEgrCaja,cdsFiltro) ;
    end ;
    xGraboNuevo := True ;

end;


procedure TFEgresoCaja.ActualizaSaldosCxP301(ccPgoOri,ccPgoLoc,ccPgoExt,ccSalOri,ccSalLoc,ccSalExt : double; ccNodoc : string);
var
  xsaldo,cSQL : string;
begin
     cSQL := 'UPDATE CXP301  SET  CPPAGORI ='+''+floattostr(ccPgoOri)+''+', '
                                +'CPPAGLOC ='+''+floattostr(ccPgoLoc)+''+', '
                                +'CPPAGEXT ='+''+floattostr(ccPgoExt)+''+', '
                                +'CPSALORI ='+''+floattostr(ccSalOri)+''+', '
                                +'CPSALLOC ='+''+floattostr(ccSalLoc)+''+', '
                                +'CPSALEXT ='+''+floattostr(ccSalExt);
     //** 13/12/2000   pjsv
     xsaldo := copy(FloatToStr(ccSalExt),1,4);
     if dblcTMon.text = DMTE.wTMonExt then
      if (StrToFloat(xsaldo) <= 0.02) then cSQL := cSQL +' ,CPESTADO = ''C'''
     else
      If (StrToFloat(xsaldo) <= 0.02)  then cSQL := cSQL +' ,CPESTADO = ''C''';
     //**
     cSQL:= cSQL + '   WHERE                                             '
                 +      '  CIAID   =    '+''''+ trim(dblcCia.Text)    +''''+' AND  '
                 +      '  DOCID   =    '+''''+ wTDocRxH    +''''+' AND  '
                 +      '  CPNODOC = '+''''+ ccNoDoc +''''+' AND  '
                 +      '  CPESTADO <> '+''''+ 'E'  +''''+' AND  '
                 +      '  CLAUXID = '+''''+ dblcClase.text  +''''+' AND  '
                 +      '  PROV    ='+''''+ dblcdAux.text +'''';

     DMTE.DCOM1.AppServer.EjecutaSQL( cSQL );
end;

function TFEgresoCaja.ExisteRxH: boolean ;
begin
   result := false;
   if dblcTDoc.text = wTDocRxH then
      result := true;
end;

procedure TFEgresoCaja.ActualizaSaldosTGE401(ccPgoOri,ccPgoLoc,ccPgoExt: double; sSigno : String);
var
  xAno,
  xMes : string ;
  xDatAux : StructSaldosAux;

begin
     with  xDatAux do
     begin
       CIAID     :=  dblcCia.Text ;
       CLAUXID   :=  dblcClase.Text ;
       AUXID     :=  dblcdAux.Text ;
       MONTOMN   :=  floattostr(ccPgoLoc) ;
       if trim(MONTOMN) = '' then
            MONTOMN := '0';

       MONTOME   :=  floattostr(ccPgoExt);
       if trim(MONTOME) = '' then
          MONTOME := '0';

       FECHA     :=  dbdtpFComp.date ;
       if trim(MTOSLOC) = '' then
          MTOSLOC := '0';

       if trim(MTOSEXT) = '' then
          MTOSEXT := '0';

       xMes := strMes ( xDatAux.FECHA ) ;
       xAno := strAno ( xDatAux.FECHA ) ;
       DMTE.ActSdoAuxiliar(xDatAux.CIAID , xANO , xMES , xDatAux.CLAUXID , xDatAux.AUXID ,
                          xDatAux.MONTOMN , xDatAux.MONTOME,xDatAux.MTOSLOC,xDatAux.MTOSEXT, sSigno ) ;
     end ;
end;



procedure TFEgresoCaja.BuscaNReposicion;
var
   ssql: string;
begin

   if dbeRepo.Text<>'' then Exit;

   // RESPFF   : Rendicion de Cuenta
   // CLAUXFF  : Fondo Fijo
   sSQL:='Select CLAUXID, CLAUXDES, RESPFF,CLAUXFF from TGE102 where CLAUXID='+QuotedStr(dblcClase.text);
   DMTE.cdsQry2.Close;
   DMTE.cdsQry2.DataRequest(ssql);
   DMTE.cdsQry2.open;

  if DMTE.cdsQry2.FieldByName('RESPFF').AsString = 'S' then
  begin
    if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
    begin
   		sSQL := 'SELECT substr('+DMTE.wReplacCeros+'(SUBSTR(''000000'',1,6-LENGTH(RTRIM(CHAR(MAX(INTEGER(ECNOREPO))+1))))'+
              ' ||(CHAR(MAX(INTEGER(ECNOREPO))+1)),''000001''  ),1,6) AS REPO FROM CAJA302'+
             ' WHERE (ECNOREPO <> '''' and ECNOREPO IS NOT NULL)'+
             ' AND CIAID='+QuotedStr(dblcCia.text);
    end
    else
    if DMTE.SRV_D = 'ORACLE' then
    begin
   		sSQL:='SELECT substr('+DMTE.wReplacCeros+'(SUBSTR(''000000'',1,6-LENGTH(RTRIM(TO_CHAR(MAX(TO_NUMBER(ECNOREPO))+1))))'+
            ' ||(TO_CHAR(MAX(TO_NUMBER(ECNOREPO))+1)),''000001''  ),1,6) AS REPO FROM CAJA302'+
            ' WHERE ( NVL(ECNOREPO,''NULO'')<>''NULO'') '+
            ' AND CIAID='+QuotedStr(dblcCia.text);
    end;

   DMTE.cdsQry2.Close;
   DMTE.cdsQry2.DataRequest(ssql);
   DMTE.cdsQry2.open;
   dbeRepo.Text :=  DMTE.cdsQry2.FieldByName('REPO').AsString; //xNumReg;
  end
 else dbeRepo.Text := '';
end;
//**

//** 08/03/2001 - pjsv - para nelly
procedure TFEgresoCaja.dblcdCnpExit(Sender: TObject);
var
 xSql : string;
begin
   if z2bbtnCancel.Focused then Exit;
   if dbeLote.Focused then Exit;

   dbeGlosa.Text := DMTE.DisplayDescripLocal(DMTE.cdsCnpEgr, 'CPTOID', dblcdCnp.Text, 'CPTODES') ;
   // derrama vhn flag de detraccion
   xDetraccion   := DMTE.DisplayDescripLocal(DMTE.cdsCnpEgr, 'CPTOID', dblcdCnp.Text, 'FCTZ') ;
   // derrama vhn

   if dbeGlosa.Text = '' then
    begin
      ShowMessage('Error : Concepto no Válido');
      dblcdCnp.SetFocus;
    end;
end;
//**


//** 26/03/2001 - pjsv - para validar que no se duplique el # chq
procedure TFEgresoCaja.dbeNoChqExit(Sender: TObject);
var
 xSql : string;
begin
  xSql := 'CIAID='+QuotedStr(dblcCia.text)+' AND TDIARID='+QuotedStr(dblcTDiario.text)
          +' AND ECNOCOMP<>'+QuotedStr( dbeNoComp.Text )+' and '
   		       +'CCBCOID='+QuotedStr(dblcCCBco.Text)+' AND ECNOCHQ='+QuotedStr(dbeNoChq.text);
//        	' AND ECESTADO<>''A'' ';
//  If DMTE.DisplayDescrip('prvTGE','CAJA302','ECNOCHQ',xSQL,'ECNOCHQ') <> '' then
  DMTE.DisplayDescrip('prvTGE','CAJA302','ECNOCHQ,ECESTADO,ECELABO',xSQL,'ECNOCHQ');
  if DMTE.cdsQry.FieldByName('ECNOCHQ').AsString<>'' then
  begin
     if DMTE.cdsQry.FieldByName('ECESTADO').AsString<>'A' then
     begin
        showmessage('El número de Cheque ya fué Utilizado');
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

procedure TFEgresoCaja.dblcdCCostoExit(Sender: TObject);
var
 xSQL : String;
begin
   xSQL := 'CCOSID='+QuotedStr(dblcdCCosto.Text);
   dbeCCos.text := DMTE.DisplayDescrip('prvTGE','TGE203','CCOSDES',xSQL,'CCOSDES');
end;

procedure TFEgresoCaja.dblcdAuxDetEnter(Sender: TObject);
begin
   if dblcClaseDet.Text='' then
      dblcClaseDet.SetFocus;
end;

procedure TFEgresoCaja.Z2bbtnRetencionClick(Sender: TObject);
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
      ShowMessage('No Existe Retención');
      Exit;
   end;

	 pprRetencion.TEMPLATE.FileName:=DMTE.wRutaCNT + '\Retenciones.rtm';
	 pprRetencion.template.LoadFromFile ;

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

procedure TFEgresoCaja.dblcdCnpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   DMTE.cdsCnpEgr.indexFieldNames:='CPTODES';
end;

procedure TFEgresoCaja.GrabaCabeceraDeComprobante;
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
    //CLG: 21/10/2003
    //DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');
    DMTE.ControlTran(9,DMTE.cdsEgrCaja,'EGRCAJA');
end;

function TFEgresoCaja.GeneraRetencion: boolean;
var sSQL:string;
begin
 if lblSujetoRetencion.visible then
 begin

 end;
end;

procedure TFEgresoCaja.Contab_DocPago_Retencion_Haber;
begin
     DMTE.cdsCntCaja.FieldByName('CIAID').AsString   := DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
     DMTE.cdsCntCaja.FieldByName('TDIARID').AsString := DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
     DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
     DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString:= DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
     DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString  := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
     DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString  := 'CXP';
     DMTE.cdsCntCaja.FieldByName('DOCID').AsString   := DMTE.cdsRegCxP.FieldByName('DOCID2').AsString;
     DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString := DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString;
     DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString;
     DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
     DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime := DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime;
     DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:= DMTE.cdsRegCxP.FieldByName('CPFVCMTO').AsDateTime;

     DMTE.cdsCntCaja.FieldByName('CPTOID').AsString  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID,CPTODES,CUENTAID','CPTOIS=''T''','CPTOID');
     DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
     DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.fieldBYName('CPTODES').AsString;

     DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString := DMTE.cdsEgrCaja.FieldByName('PROV').AsString;
     DMTE.cdsCntCaja.FieldByName('DCDH').AsString    := 'H';
     DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:= DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
     DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:= DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
     DMTE.cdsCntCaja.FieldByName('TMONID').AsString  := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;

     DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat   := xRetLoc;
     DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat  := xRetExt;
     if dblcTMon.Text = DMTE.wTMonLoc then
       DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xRetLoc
     else
       DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := xRetExt;

     DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString := 'S';   //Registro ya cuadrado
     DMTE.cdsCntCaja.FieldByName('DCANO').AsString    := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
     DMTE.cdsCntCaja.FieldByName('DCMM').AsString     := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCDD').AsString     := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
     DMTE.cdsCntCaja.FieldByName('DCSS').AsString     := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
     DMTE.cdsCntCaja.FieldByName('DCSEM').AsString    := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCTRI').AsString    := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAASS').AsString   := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
     xNReg:=xNReg+1;
     DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;
end;

procedure TFEgresoCaja.Z2bbtChqVouchClick(Sender: TObject);
var
   strChq : structChq ;
   xSQL,xWhere,ArchivoReporte : string ;
   xTotal : double;
begin
    xWhere := ' CIAID='+QuotedStr(dblcCia.text)+ ' AND BANCOID='+Quotedstr(dblcBanco.Text)+
              ' AND CCBCOID='+QuotedStr(dblcCCBco.text);
    DMTE.DisplayDescrip('prvQry2','TGE106','CHQVOUCH',xWhere,'CHQVOUCH');
    if DMTE.cdsQry.FieldByName('CHQVOUCH').AsString<>'S' then
       raise Exception.Create('Esta Cta.Cte no genera Cheque Voucher');

    if DMTE.cdsEgrcaja.FieldByName('ECESTADO').AsString='A' then
       raise Exception.Create('El Comprobante se encuentra Anulado');

    if DMTE.cdsEgrcaja.FieldByName('ECESTADO').AsString<>'C' then
       raise Exception.Create('Debe Cancelar el Comprobante primero');

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
       if DMTE.DisplayDescrip('prvSQL','CAJA302','ECCHQEMI',xSQL,'ECCHQEMI') <> 'S' then
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
//          ppDesigner1.Show;
          pprChqVouch.Print;

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

procedure TFEgresoCaja.GeneraRegChqVouch;
var
   xCuentaId, xSQL, xWhere : string;
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

   xSQL := 'SELECT A.* ,0.00 DEBE,0.00 HABER FROM CAJA304 A  '
          +'WHERE ( A.CIAID='     +QuotedStr('XY'     ) +' AND '
          +        'A.ECANOMM='  +QuotedStr('190001' ) +' ) ';
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
         DMTE.cdsTrans.FieldByName('NREG').AsInteger  := xNReg;
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



procedure TFEgresoCaja.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFEgresoCaja.dblcBancoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFEgresoCaja.dblcCCBcoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.





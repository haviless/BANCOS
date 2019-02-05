unit Caja202;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Buttons, wwdbdatetimepicker, Mask, wwdbedit, wwdblook, Wwdbdlg,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBGrids, DB, wwSpeedButton,
  wwDBNavigator, ComCtrls, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe, ppPrnabl, ppCtrls, ppModule, daDatMod, ppBands,
  ppVar,CajaDM, DBClient, wwclient, oaContabiliza, Variants;

type
  TFPagosCaja = class(TForm)
    pnlCabecera: TPanel;
    lblCia: TLabel;
    lblOPago: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    pnlCabecera2: TPanel;
    lblProv: TLabel;
    lblProvRuc: TLabel;
    lblProvDes: TLabel;
    z2bbtnCancel: TBitBtn;
    z2bbtnOK: TBitBtn;
    dblcdAux: TwwDBLookupComboDlg;
    dbeGiradoA: TwwDBEdit;
    dbeElabo: TwwDBEdit;
    dbeAprob: TwwDBEdit;
    lblElabo: TLabel;
    lblAprob: TLabel;
    pnlBotones: TPanel;
    z2bbtnSumat: TBitBtn;
    z2bbtnImprime: TBitBtn;
    z2bbtnGraba: TBitBtn;
    pnlDetalle: TPanel;
    pnlPendientes: TPanel;
    Label16: TLabel;
    dbgPendientes: TwwDBGrid;
    pnlDocCanje: TPanel;
    Label17: TLabel;
    dbgDocCanje: TwwDBGrid;
    ppdbCanje: TppDBPipeline;
    pprOPago: TppReport;
    z2bbtnNuevo: TBitBtn;
    z2bbtnSube: TBitBtn;
    lblEstado: TLabel;
    z2bbtnAnula: TBitBtn;
    z2bbtnCancel2: TBitBtn;
    z2bbtnCalc: TBitBtn;
    dbeOPago: TwwDBEdit;
    edtAuxRuc: TEdit;
    z2bbtnOKCab: TBitBtn;
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
    edtCuenta: TEdit;
    lblCuenta: TLabel;
    lblTMon: TLabel;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    Z2bbtnAceptar: TBitBtn;
    dbeTC: TwwDBEdit;
    dbeMPL: TwwDBEdit;
    dbeMPE: TwwDBEdit;
    Label23: TLabel;
    dblcClase: TwwDBLookupCombo;
    edtClase: TEdit;
    BitBtn1: TBitBtn;
    z2bbtnCont: TBitBtn;
    lblFEmis: TLabel;
    dbdtpFPago: TwwDBDateTimePicker;
    pnlCabecera3: TPanel;
    dblcTDiario: TwwDBLookupCombo;
    lblTDiario: TLabel;
    lblNoComp: TLabel;
    dbeNoComp: TwwDBEdit;
    edtTDiario: TEdit;
    lblTDoc: TLabel;
    dblcTDoc: TwwDBLookupCombo;
    edtTDoc: TEdit;
    dbeNoDoc: TwwDBEdit;
    lblNoDoc: TLabel;
    lblConcepto: TLabel;
    dblcdCnp: TwwDBLookupComboDlg;
    dbeGlosa: TwwDBEdit;
    lblGlosa: TLabel;
    lblPeriodo: TLabel;
    edtPeriodo: TwwDBEdit;
    lblImporte: TLabel;
    dbeImporte: TwwDBEdit;
    ppHeaderBand1: TppHeaderBand;
    pplblCia: TppLabel;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppdbtOrdenP: TppLabel;
    ppLabel3: TppLabel;
    ppdbtFOrdenP: TppLabel;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppdbtProv: TppLabel;
    ppdbtProvDes: TppLabel;
    ppLabel5: TppLabel;
    ppdbtGirado: TppLabel;
    ppLabel6: TppLabel;
    ppdbtFormaP: TppLabel;
    ppLabel10: TppLabel;
    ppdbtMoneda: TppLabel;
    ppLabel11: TppLabel;
    ppdbtCambio: TppLabel;
    ppdbtCheque: TppLabel;
    ppLabel9: TppLabel;
    ppdbtCtaCte: TppLabel;
    ppLabel8: TppLabel;
    ppdbtBanco: TppLabel;
    ppLabel7: TppLabel;
    ppLine3: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel18: TppLabel;
    ppLabel16: TppLabel;
    ppLabel14: TppLabel;
    ppLine4: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLine5: TppLine;
    ppLabel15: TppLabel;
    ppdbtMoneda1: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel19: TppLabel;
    pplblElaborado: TppLabel;
    ppLabel17: TppLabel;
    pplblAprobadopor: TppLabel;

    procedure FormActivate(Sender: TObject);
    function  ConsisMonto:Boolean;
    procedure RecalculaSaldos(xNuevo:Boolean);

// Procedimientos de Panel Cabecera
    procedure dblcCiaChange(Sender: TObject);
    procedure z2bbtnCancelClick(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
// Procedimientos


    procedure dbgPendientesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDocCanjeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgDocCanjeEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDocCanjeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgPendientesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure z2bbtnSumatClick(Sender: TObject);
    procedure z2bbtnGrabaClick(Sender: TObject);
    procedure z2bbtnCalcClick(Sender: TObject);
// Final
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcdAuxExit(Sender: TObject);
    procedure z2bbtnCancel2Click(Sender: TObject);
    procedure dblcFormPagoChange(Sender: TObject);
    procedure dblcBancoChange(Sender: TObject);
    procedure dblcCCBcoChange(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
    procedure ppDBText5Print(Sender: TObject);
    procedure ppDBCalc1Print(Sender: TObject);
    procedure dbgDocCanjeColExit(Sender: TObject);
    procedure z2bbtnNuevoClick(Sender: TObject);
    procedure z2bbtnSubeClick(Sender: TObject);
    procedure z2bbtnAnulaClick(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure dbdtpFPagoExit(Sender: TObject);
    procedure ActPnlBotones;
    procedure dblcdAuxChange(Sender: TObject);
    procedure edtProvRUCChange(Sender: TObject);
    procedure dbeGiradoAChange(Sender: TObject);
    procedure dbdtpFPagoChange(Sender: TObject);
    procedure dbeNoChqChange(Sender: TObject);
    procedure dbeElaboChange(Sender: TObject);
    procedure dbeAprobChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure dbeOPagoExit(Sender: TObject);
    procedure dbgDocCanjeCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure dbeElaboKeyPress(Sender: TObject; var Key: Char);
    procedure dbeAprobKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDocCanjeExit(Sender: TObject);
    procedure dbeNoChqChange2(Sender: TObject);
    procedure dbeTCambioChange(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcCCBcoChange2(Sender: TObject);
    procedure dblcCCBcoEnter(Sender: TObject);
    procedure dblcCCBcoExit(Sender: TObject);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure dbeTCambioEnter(Sender: TObject);
    procedure dbdtpFPagoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Z2bbtnAceptarClick(Sender: TObject);
    procedure dblcdAuxEnter(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbeTCExit(Sender: TObject);
    procedure dbeMPLExit(Sender: TObject);
    procedure dbeMPEExit(Sender: TObject);
    procedure dblcClaseExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
  private
    cf1: TControlFoco;
    strTmp: String;
    A1 : Array of Integer ;
    A2 : Array Of TNotifyEvent ;
    A2digitos ,A4digitos : Array of TWinControl ;
    cdsFiltro: TwwClientDataset;
    xGraboNuevo: Boolean ;
    xDescrip : String;
    wFechaCierre: TDatetime;
    wFrecu   : Integer;
    xVoucher : String;
    xNReg    : Integer;
    wCptoGan  ,
    wCptoPer  ,
    wCtaGan   ,
    wCtaPer   : String ;

    { Private declarations }
    Procedure ValidaCabecera;
    procedure RecuperaDescrip ;
    procedure AdicIniciaDatos;
    procedure IniciaDatos;
    procedure ConfiguraAccesos;
    procedure Proc_Admin;
    procedure Proc_Consul;
    procedure Libera_Admin;
    procedure Libera_Consul;
    procedure LibConfigAccesos;
    procedure BorraGrid ;
    procedure ActualizaFiltro ;
    procedure ActualizaSaldos;
    procedure ActualizaSaldosCaja;
    procedure Contabiliza;
    procedure Contab_CanjeCxP;
    procedure RecCptosDifC;
    procedure Contab_EgrCaja;
    procedure Contab_DifCamCanje;
  public
    { Public declarations }
    Function  ExisteMovCxP(xxCia,xxTDiario,xxAAMM,xxNoReg:String):Boolean;
    procedure Adiciona ;
    procedure Edita (Comp : structOPago;cds : Twwclientdataset);
    procedure AsignaCDSFiltro(cds : TwwClientDataset) ;
  end;

var
  FPagosCaja : TFPagosCaja;
  xSQL    : String;
  xFlagOk : Boolean;
  wbSumat, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,wbConsultar,
  wbcancel2: Boolean;
  wmodifica: Boolean;

implementation

Uses CAJAUTIL, Caja225;
{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}

procedure TFPagosCaja.FormActivate(Sender: TObject); //ok rlp
begin
   xVoucher := '';
   DM1.RecuperaCierre( wFechacierre , wFrecu ) ;
   //PREGUNTAR
{   if  DM1.cdsEgrCaja.FieldByName('ECESTADO').AsString='C' then
      BitBtn1.Enabled:=True
   else
      BitBtn1.Enabled:=False;}
   //
end;


procedure TFPagosCaja.IniciaDatos;    //ok rlp
begin
   pnlCabecera.Enabled   := True;
   pnlCabecera2.Enabled  := False;
   pnlDetalle.Enabled    := True;
   pnlPendientes.Enabled := False;
   pnlDocCanje.Enabled   := False;
   pnlBotones.Enabled    := False;

   // Estado de variables Botones
   wbSumat     := False;
   wbNuevo     := False;
   wbImprime   := False;
   wbSube      := False;
   wbGraba     := False;
   wbConsultar := False ;
   wbCancelado := False;
   wbCancel2   := False;
   wbAnula     := False;

   // Estado de Botones
   z2bbtnOk.Enabled        := False;
   z2bbtnCancel.Enabled    := False;
   z2bbtnSumat.Enabled     := False;
   z2bbtnNuevo.Enabled     := False;
   z2bbtnImprime.Enabled   := False;
   z2bbtnSube.Enabled      := False;
   z2bbtnGraba.Enabled     := False;
   z2bbtnCancel2.Enabled   := False;
   z2bbtnAnula.Enabled     := False;
   //
   dblcCia.Text      := '';   // Código de Compañía
   edtCia.Enabled    := False;
   edtCia.Text       := '';   // Descripción de la Compañía
   dbeOPago.Text      := '';   // Orden de Pago
   dblcdAux.Text    := '';    // Código de Proveedor
   edtAuxRUC.Text := '';    // RUC del Proveedor
   dbeGiradoA.Text   := '';    // Pago Girado A ....
   dbdtpFPago.Date   := dateS; // Fecha de Pago
   dblcTMon.Text     := '';   // Tipo de Moneda
   edtTMon.Enabled   := False;
   edtTMon.Text      := '';   // Descripción de la Moneda
   dbeTCambio.Text   := '';   // Tipo de Cambio
   dblcFormPago.Text := '';   // Forma de Pago
   edtFormPago.Enabled  := False;
   edtFormPago.Text  := '';   // descripción de forma de pago
////   dblcBanco.Enabled := False;
   dblcBanco.Text    := '';   // Código de Banco
   edtBanco.Enabled  := False;
   edtBanco.Text     := '';   // Descripción de Banco
   dblcCCBco.Enabled := False;
   dblcCCBco.Text    := '';   // Cuenta Corriente del Banco
   dbeNoChq.Text     := '';   // Cheque
   dbeNoChq.Enabled  := False;
   dbeElabo.Text     := '';   // Elaborado por
   dbeAprob.Text     := '';   // Aprobado por
   lblEstado.Caption := '';   //Inicializar el Estado
   edtCuenta.Text    := '';
   edtClase.Text     := '';   
   wmodifica         := False;


   dbgPendientes.ReadOnly := True;     // Para el Grid
   dbgPendientes.Enabled  := True;
   dbgDocCanje.ReadOnly   := False;     // Para el Grid

   dbgDocCanje.ColumnByName('CPSALLOC').FooterValue:='';
   dbgDocCanje.ColumnByName('CPSALEXT').FooterValue:='';
   dbgDocCanje.ColumnByName('CCPMOLOC').FooterValue:='';
   dbgDocCanje.ColumnByName('CCPMOEXT').FooterValue:='';

   DM1.cdsMovCxP.Filtered :=False;
   DM1.cdsCCBco.Filtered:=False;

// Documentos Pendientes
   DM1.cdsMovCxP.Filter:='';
   DM1.cdsMovCxP.Filter:='CiaId='+''''+''+'''';
   DM1.cdsMovCxP.Filtered:=True;
// Documentos Seleccionados para Canje
   z2bbtnOkCab.Enabled := True ;
end;

{*******************************************************
PRIMER PANEL - DATOS INICIALES DE LA CABECERA
*******************************************************}

procedure TFPagosCaja.dblcCiaChange(Sender: TObject);    //rlp ok
var
   xWhere : string;
begin
{      xWhere:='CIAID='+''''+dblcCia.Text+'''';
   edtCia.Text:=DM1.DisplayDescrip('prvTGE','TGE101','CIADES',xWhere,'CIADES');
   if length(edtCia.Text)=0 then
   begin
      dblcCia.setfocus;
      Showmessage('Compañía Errada');
   End;
   if length(edtCia.Text)>0 then
   begin
    // determina último número de Orden de Pago incrementado en 1
       xWhere := 'CIAID='+''''+dblcCia.Text+'''';
       dbeOPago.Text:=DM1.UltimoNum('prvCxP','CXP303','OPAGO',xWhere);
       dbeOPago.Text:=DM1.strzero(dbeOPago.Text,DM1.cdsPagoCxP.FieldByName('OPAGO').DisplayWidth);
   end;}
end;

{*******************************************************
SEGUNDO PANEL - DATOS ADICIONALES DE LA CABECERA
*******************************************************}
procedure TFPagosCaja.dblcdAuxExit(Sender: TObject);
var
   xSql, xAuxt: string ;
begin
   if z2bbtnCancel.Focused then exit;
   if dblcClase.Focused    then Exit ;

   xAuxt:= DM1.DisplayDescripLocal(DM1.cdsAux,'AUXID',dblcdAux.Text,'AUXID') ;

   if xAuxt='' then begin
      dblcdAux.Text  := '' ;
      edtAuxRUC.Text := '' ;
      dbeGiradoA.Text:= '' ;
      ShowMessage('Error : Auxiliar No Valido');
      dblcdAux.SetFocus;
      Exit;
   end;

   if DM1.cdsAux.FieldByName('AUXGIRA').AsString='' then
      dbeGiradoA.Text := DM1.cdsAux.FieldByName('AUXNOMB').Asstring
   else
      dbeGiradoA.Text := DM1.cdsAux.FieldByName('AUXGIRA').Asstring ;

   edtAuxRuc.Text:= DM1.cdsAux.FieldByName('AUXRUC').Asstring;
//   xDirAux       := DM1.cdsAux.FieldByName('AUXDIR').Asstring;

   xSql := 'SELECT * FROM CAJA102 WHERE PROV='+quotedstr(trim(dblcdAux.Text))+' ORDER BY CCBCOID';
   DM1.cdsProvCta.Close;
   DM1.cdsProvCta.DataRequest(xSql);
   DM1.cdsProvCta.Open
end;

procedure TFPagosCaja.dbdtpFPagoExit(Sender: TObject);
var
   xWhere   : String;
   xFCierre : TDate;
begin
   if z2bbtnCancel.Focused then exit;

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

   dbeTcambio.text := DM1.RecuperarTipoCambio(dbdtpFPago.date) ;
end;

procedure TFPagosCaja.dbeTCambioExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then
      exit;
   if   strTmp <> dbeTCambio.text then
   begin
      if cajadec(dbetcambio.Text)=BLANCO then
      begin
        ShowMessage('Ingrese Tipo de Cambio') ;
        dbeTCambio.setfocus ;
        Exit ;
      end
      else
      begin
        dbeTCambio.Text := CajaDec(dbeTCambio.Text,4 ) ;
      end ;
      wmodifica:=True;
      if DM1.cdsCanjeCxP.REcordcount <> 0 then
      begin
            DM1.cdsCanjeCxP.DisableControls ;
            DM1.cdsCanjeCxP.First;
            If DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPTCCje').Asfloat,8,3)<>DM1.FRound(strtofloat(dbeTCambio.Text),8,3) then begin
               While not DM1.cdsCanjeCxP.eof do
               begin
                  DM1.cdsCanjeCxP.Edit;
                  DM1.cdsCanjeCxP.FieldByName('CCPTCCje').Asfloat := DM1.FRound(strtofloat(dbeTCambio.Text),8,3);
                  DM1.cdsCanjeCxP.Next;
               end;
               DM1.cdsCanjeCxP.First;
               DM1.cdsCanjeCxP.EnableControls ;
            end;
      End ;
   end ;
end;

procedure TFPagosCaja.dblcFormPagoChange(Sender: TObject);
var xWhere:string;
begin
   xWhere:='FPAGOID='+''''+dblcFormPago.Text+'''';
   edtFormPago.Text:=DM1.DisplayDescrip('prvTGE','TGE112','FPAGODES, FPAGODES, FPAGOBCO',xWhere,'FPAGODES');
   if length(edtFormPago.Text)>0 then
   begin
      if DM1.cdsqry.FieldByName('FPagoBco').Asstring='S' then
      begin
         dblcBanco.Enabled:=True;
         dblcCCBco.Enabled:=True;
         dbeNoChq.Enabled :=True;
      end
      else
      begin
         dblcBanco.Enabled:=False;
         dblcCCBco.Enabled:=False;
         dbeNoChq.Enabled :=False;
         dblcBanco.Text:='';
         dblcCCBco.Text:='';
         dbeNoChq.Text :='';
      end;
   end;
   wmodifica:=True;
end;

procedure TFPagosCaja.dblcBancoChange(Sender: TObject);
var xWhere:string;
begin
   xWhere:='BANCOID='+''''+dblcBanco.Text+'''';
   edtBanco.Text:=DM1.DisplayDescrip('prvTGE','TGE105','BANCONOM',xWhere,'BANCONOM');
   if length(edtBanco.Text)>0 then
   begin
      DM1.cdsCCBco.Filter:='';
      DM1.cdsCCBco.Filter:='BANCOID='+''''+dblcBanco.Text+'''';
      DM1.cdsCCBco.Filtered:=True;
      dblcCCBco.Enabled:=true;
   end;
   wmodifica:=True;
end;

procedure TFPagosCaja.dblcCCBcoChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagosCaja.z2bbtnOKClick(Sender: TObject);    //rlp ok
var
   xWhere ,
   xFiltro : string  ;
   xFlag   : Boolean ;
begin
   // consistencia de Datos

   ValidaCabecera ;

   DM1.cdsPagoCxP.Edit;
   DM1.cdsPagoCxP.FieldByName('Prov').Asstring         := dblcdAux.Text;
   DM1.cdsPagoCxP.FieldByName('ProvRuc').Asstring      := edtAuxRUC.Text;
   DM1.cdsPagoCxP.FieldByName('PROVGIRA').Asstring     := dbeGiradoA.Text;
   DM1.cdsPagoCxP.FieldByName('OPFPago').AsDatetime      := dbdtpFPago.date;
   DM1.cdsPagoCxP.FieldByName('TMONID').Asstring       := dblcTMon.Text;
   DM1.cdsPagoCxP.fieldByName('CCBCOID').AsString   := dblcCCBco.Text ;
   DM1.cdsPagoCxP.fieldByName('BANCOID').AsString   := dblcBanco.text ;
   DM1.cdsPagoCxP.fieldByName('CUENTAID').AsString  := edtCuenta.text ;
   DM1.cdsPagoCxP.fieldByName('FPAGOID').AsString   := dblcFormPago.Text ;
   DM1.cdsPagoCxP.fieldByName('OPNOCHQ').AsString   := dbeNoChq.text ;
   DM1.cdsPagoCxP.fieldByName('OPTCAMB').AsString   := dbeTcambio.Text ;
   DM1.cdsPagoCxP.FieldByName('CCBCOVOUCH').AsString:= xVoucher;

   DM1.cdsPagoCxP.FieldByName('OPEstado').Asstring := 'I';  // Incompleto
   xWhere:='FECHA = ' +DM1.wRepFuncDate + '''' + formatdatetime(DM1.wFormatFecha,dbdtpFPago.date)+''')' ;
   DM1.cdsPagoCxP.FieldByName('OPANO').Asstring    := DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');

   if length(DM1.cdsPagoCxP.FieldByName('OPANO').Asstring)>0 then
   begin
      DM1.cdsPagoCxP.FieldByName('OPMM').Asstring   := DM1.cdsqry.FieldByName('FecMes').Asstring;        // mes
      DM1.cdsPagoCxP.FieldByName('OPDD').Asstring   := DM1.cdsqry.FieldByName('FecDia').Asstring;        // día
      DM1.cdsPagoCxP.FieldByName('OPTri').Asstring  := DM1.cdsqry.FieldByName('FecTrim').Asstring;      // trimestre
      DM1.cdsPagoCxP.FieldByName('OPSem').Asstring  := DM1.cdsqry.FieldByName('FecSem').Asstring;       // semestre
      DM1.cdsPagoCxP.FieldByName('OPSS').Asstring   := DM1.cdsqry.FieldByName('FecSS').Asstring;         // semana
      DM1.cdsPagoCxP.FieldByName('OPANOMM').Asstring:= DM1.cdsPagoCxP.FieldByName('OPANO').Asstring+DM1.cdsqry.FieldByName('FecMes').Asstring; // año+mes
      DM1.cdsPagoCxP.FieldByName('OPAATri').Asstring:= DM1.cdsqry.FieldByName('FecAATri').Asstring;   // año+trimestre
      DM1.cdsPagoCxP.FieldByName('OPAASem').Asstring:= DM1.cdsqry.FieldByName('FecAASem').Asstring;   // año+semestre
      DM1.cdsPagoCxP.FieldByName('OPAASS').Asstring := DM1.cdsqry.FieldByName('FecAASS').Asstring;     // año+semana
   end;

   DM1.cdsPagoCxP.Post;

   if dblcdAux.Enabled then
   begin
      xFlag := False ;
      //Comprobar si hay mov seleccionados con otro proveedor
      if DM1.cdscanjeCxP.RecordCount > 0 then
      begin
         DM1.cdsCanjeCxP.First ;
         if (trim(dblcdAux.Text) <> DM1.cdsCanjeCxP.FieldByName('CLAUXID').AsString ) then
         begin
            DM1.cdsCanjeCxP.CancelUpdates ;
            DM1.cdsMovCxP.CancelUpdates ;
            xFlag := True ;
         end
      end
      else
          xFlag := True ;

      if xFlag then
      begin
         xWhere:='CIAID='''+dblcCia.Text+''' AND CPESTADO=''P'' AND '+
                 'CLAUXID='+quotedstr(dblcdAux.LookupTable.FieldByName('CLAUXID').AsString)+' AND '+
                 'PROV= '''+dblcdAux.Text+''' ';

         xFiltro:='( ((CPMTOLOC-CPPAGLOC-CPSALLOC)>-0.01 and (CPMTOLOC-CPPAGLOC-CPSALLOC)<0.01) '
                 +' or (CPMTOLOC=CPSALLOC) ) AND ( CPSALLOC > 0 ) ';

         DM1.cdsMovCxP.Close;
         DM1.cdsMovCxP.Datarequest( 'SELECT * FROM CXP301 WHERE ' + xWhere ) ;
         DM1.cdsMovCxP.Open;

         DM1.cdsMovCxP.Filtered := False;
         DM1.cdsMovCxP.Filter   := '';
         DM1.cdsMovCxP.Filter   := xFiltro ;
         DM1.cdsMovCxP.Filtered := True ;
         if DM1.cdsMovCxP.RecordCount=0 then
         begin
            ShowMessage('No hay Documentos Pendientes para Proveedor') ;
            dblcdAux.SetFocus ;
            exit;
         end;

         xSQL:='Select * from CXP304 '
              +'Where CIAID='+quotedstr(dblcCia.Text)+' and '
              +'CCPCANJE='+quotedstr(dbeOPago.Text)+' AND TCANJEID='+quotedstr('OP');
         DM1.cdsCanjeCxP.Close;
         DM1.cdsCanjeCxP.DataRequest( xSQL );
         DM1.cdsCanjeCxP.Open;

      end ;
   end ;
{
   xFlagCal := True;
   RecalculaSaldos(xFlagCal);
}
   //Actualizamos el Footer
   z2bbtnSumatClick(sender);

   // Estado de los componentes
   pnlCabecera.enabled   := False;
   pnlCabecera2.enabled  := False;
   pnlPendientes.enabled := True;
   pnlCabecera3.enabled  := True;
   pnlDocCanje.enabled   := True;

   pnlBotones.Enabled    := True;
   ActPnlBotones;
   // Estado de los botones
   z2bbtnOk.Enabled        := False;
   z2bbtnCancel.Enabled    := False;

   dblcTDiario.Text:=DM1.cdsPagoCxP.FieldByName('CCBCOVOUCH').AsString;
//   dblcTDiarioExit( Sender );

   //Foco en el Grid de dbgPendientes
   if xflag then
     dbgPendientes.SetFocus ;

   BitBtn1.Enabled:=False;
end;

procedure TFPagosCaja.RecalculaSaldos(xNuevo:boolean);
begin
     DM1.cdsMovCxP.DisableControls;
     DM1.cdsMovCxP.Filtered:=False;
     DM1.cdsCanjeCxP.DisableControls;
     DM1.cdsCanjeCxP.First;
     While not DM1.cdsCanjeCxP.Eof do
     Begin
        DM1.cdsCanjeCxP.Edit;
        if DM1.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                                VarArrayOf([DM1.cdsCanjeCxP.FieldByName('CIAID').AsString,
                                            DM1.cdsCanjeCxP.FieldByName('TDIARID').AsString,
                                            DM1.cdsCanjeCxP.FieldByName('CCPANOMM').AsString,
                                            DM1.cdsCanjeCxP.FieldByName('CPNOREG').AsString]),
                                []) then
        begin
           DM1.cdsCanjeCxP.FieldByName('CPSALLOC').Asfloat :=DM1.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat-DM1.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat;
           DM1.cdsCanjeCxP.FieldByName('CPSALEXT').Asfloat :=DM1.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat-DM1.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat;
        end;
        if not xNuevo then
        begin
           DM1.cdsCanjeCxP.FieldByName('CJEANTMN').AsFloat:= DM1.cdsCanjeCxP.FieldByName('CCPMOLOC').AsFloat;
           DM1.cdsCanjeCxP.FieldByName('CJEANTME').AsFloat:= DM1.cdsCanjeCxP.FieldByName('CCPMOEXT').AsFloat;
        end;
        DM1.cdsCanjeCxP.Post;
        DM1.cdsCanjeCxP.Next;
     end;
     DM1.cdsCanjeCxP.First;
     DM1.cdsCanjeCxP.EnableControls;
     DM1.cdsMovCxP.Filtered:=True;
     DM1.cdsMovCxP.EnableControls;
end;

procedure TFPagosCaja.z2bbtnCancelClick(Sender: TObject);  //rlp ok
begin
   DM1.cdsPagoCxP.CancelUpdates;
   DM1.cdsMovCxP.CancelUpdates;
   DM1.cdsCanjeCxP.CancelUpdates;
   Adiciona ;
   AdicIniciadatos ;
end;

// Para Enviar a Documentos de Canje
procedure TFPagosCaja.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgPendientes.BeginDrag(False);
end;

procedure TFPagosCaja.dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
var
  i: integer;
begin
   If Target=dbgDocCanje Then
   begin
      for i:= 0 to dbgPendientes.SelectedList.Count-1 do
      begin
          dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);
          DM1.cdsCanjeCxP.SetKey;
          DM1.cdsCanjeCxP.FieldByName('CIAID').Asstring    := DM1.cdsMovCxP.FieldByName('CIAID').Asstring;
          DM1.cdsCanjeCxP.FieldByName('TCANJEID').Asstring := 'OP';
          DM1.cdsCanjeCxP.FieldByName('CCPCANJE').Asstring := dbeOPago.Text;
          DM1.cdsCanjeCxP.FieldByName('TDIARID').Asstring  := DM1.cdsMovCxP.FieldByName('TDIARID').Asstring;
          DM1.cdsCanjeCxP.FieldByName('CCPANOMM').Asstring := DM1.cdsMovCxP.FieldByName('CPANOMES').Asstring;
          DM1.cdsCanjeCxP.FieldByName('CPNOREG').Asstring  := DM1.cdsMovCxP.FieldByName('CPNOREG').Asstring;
          if not DM1.cdsCanjeCxP.GotoKey then
          begin
             DM1.cdsCanjeCxP.Insert                                                                     ;
             DM1.cdsCanjeCxP.FieldByName('CIAID').Asstring    := DM1.cdsMovCxP.FieldByName('CIAID').Asstring                    ;
             DM1.cdsCanjeCxP.FieldByName('TDIARID').Asstring  := DM1.cdsMovCxP.FieldByName('TDIARID').Asstring                  ;
             DM1.cdsCanjeCxP.FieldByName('CPNOREG').Asstring  := DM1.cdsMovCxP.FieldByName('CPNOREG').Asstring                  ;
             DM1.cdsCanjeCxP.FieldByName('CCPANOC').Asstring  := DM1.cdsMovCxP.FieldByName('CPAAAA').Asstring                   ;
             DM1.cdsCanjeCxP.FieldByName('CCPANOMM').Asstring := DM1.cdsMovCxP.FieldByName('CPANOMES').Asstring                 ;
             DM1.cdsCanjeCxP.FieldByName('PROV').Asstring     := DM1.cdsMovCxP.FieldByName('PROV').Asstring                     ;
             DM1.cdsCanjeCxP.FieldByName('PROVRUC').Asstring  := DM1.cdsMovCxP.FieldByName('PROVRUC').Asstring                  ;
             DM1.cdsCanjeCxP.FieldByName('DOCID').Asstring    := DM1.cdsMovCxP.FieldByName('DOCID').Asstring                    ;
             DM1.cdsCanjeCxP.FieldByName('CPSERIE').Asstring  := DM1.cdsMovCxP.FieldByName('CPSERIE').Asstring                  ;
             DM1.cdsCanjeCxP.FieldByName('CPNODOC').Asstring  := DM1.cdsMovCxP.FieldByName('CPNODOC').Asstring                  ;
             DM1.cdsCanjeCxP.FieldByName('TCANJEID').Asstring := 'OP'                                    ;  // Orden de Pago
             DM1.cdsCanjeCxP.FieldByName('CCPCANJE').Asstring := dbeOPago.Text                           ;
             DM1.cdsCanjeCxP.FieldByName('CCPFCJE').AsDateTime  := DM1.cdsMovCxP.FieldByName('CPFCANJE').AsDateTime                 ;
             DM1.cdsCanjeCxP.FieldByName('TMONID').Asstring   := DM1.cdsMovCxP.FieldByName('TMONID').Asstring                   ;
             DM1.cdsCanjeCxP.FieldByName('CCPMoOri').Asfloat := DM1.FRound(DM1.cdsMovCxP.FieldByName('CPMtoOri').Asfloat,15,2)    ;
             DM1.cdsCanjeCxP.FieldByName('CCPMOLOC').Asfloat := DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALLOC').Asfloat,15,2)    ;
             DM1.cdsCanjeCxP.FieldByName('CCPMOEXT').Asfloat := DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALEXT').Asfloat,15,2)    ;
             DM1.cdsCanjeCxP.FieldByName('CPSALLOC').Asfloat := DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALLOC').Asfloat,15,2)    ;
             DM1.cdsCanjeCxP.FieldByName('CPSALEXT').Asfloat := DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALEXT').Asfloat,15,2)    ;
             DM1.cdsCanjeCxP.FieldByName('CjeAntMN').Asfloat := 0                                       ;
             DM1.cdsCanjeCxP.FieldByName('CjeAntME').Asfloat := 0                                       ;
             DM1.cdsCanjeCxP.FieldByName('CCPTCDoc').Asfloat := DM1.FRound(DM1.cdsMovCxP.FieldByName('CPTCAMAJ').Asfloat,8,3)     ;
             DM1.cdsCanjeCxP.FieldByName('CCPTCCje').Asfloat := DM1.FRound(strtofloat(dbeTCambio.Text),8,3) ;
             DM1.cdsCanjeCxP.FieldByName('CtaTotal').Asstring := DM1.cdsMovCxP.FieldByName('CtaTotal').Asstring                 ;
             DM1.cdsCanjeCxP.FieldByName('CptoTot').Asstring  := DM1.cdsMovCxP.FieldByName('CptoTot').Asstring                  ;
             DM1.cdsCanjeCxP.FieldByName('CPFVcmto').AsDateTime := DM1.cdsMovCxP.FieldByName('CPFVcmto').AsDateTime                 ;
             DM1.cdsCanjeCxP.FieldByName('CCPUser').Asstring  := DM1.wUsuario                            ;
             DM1.cdsCanjeCxP.FieldByName('CCPFReg').AsDateTime  := DateS                                    ;
             if DM1.SRV_D = 'ORACLE' then
                DM1.cdsCanjeCxP.FieldByName('CCPHReg').AsDateTime  := DateS+Time
             else
                DM1.cdsCanjeCxP.FieldByName('CCPHReg').AsDateTime  := Time;

             DM1.cdsCanjeCxP.FieldByName('CLAUXID').Asstring  := DM1.cdsMovCxP.fieldbyName('CLAUXID').AsString ;
             DM1.cdsMovCxP.Edit ;
             DM1.cdsMovCxP.FieldByName('CPSALLOC').Asfloat := 0 ;
             DM1.cdsMovCxP.Post ;
          end;
          dbgPendientes.datasource.dataset.Freebookmark(dbgPendientes.SelectedList.items[i]);
      end;
      dbgPendientes.SelectedList.clear;  { Clear selected record list since they are all deleted}
      z2bbtnSumat.click;
      wmodifica:=True;
   end;
end;

// Para Recibir los Documentos de Canje

procedure TFPagosCaja.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

{*******************************************************
TERCER PANEL - 2DO GRID DOCUMENTOS DE CANJE
*******************************************************}
// Para Enviar los Doc. de Canje a Pendientes

procedure TFPagosCaja.dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocCanje.BeginDrag(False);
end;

procedure TFPagosCaja.dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   If Target=dbgpendientes Then
   Begin
      With DM1 do
      Begin
         cdsMovCxP.Filtered:=False;
        if DM1.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                                VarArrayOf([DM1.cdsCanjeCxP.FieldByName('CIAID').AsString,
                                            DM1.cdsCanjeCxP.FieldByName('TDIARID').AsString,
                                            DM1.cdsCanjeCxP.FieldByName('CCPAnoMM').AsString,
                                            DM1.cdsCanjeCxP.FieldByName('CPNOREG').AsString]),
                                []) then
         begin
            DM1.cdsMovCxP.Edit  ;
            DM1.cdsMovCxP.FieldByName('CPSALEXT').Asfloat := DM1.cdsMovCxP.FieldByName('CPMTOEXT').Asfloat - DM1.NumeroNoNulo( DM1.cdsMovCxP.FieldByName('CPPAGEXT') )  ;
            DM1.cdsMovCxP.FieldByName('CPSALLOC').Asfloat := DM1.cdsMovCxP.FieldByName('CPMTOLOC').Asfloat - DM1.NumeroNoNulo( DM1.cdsMovCxP.FieldByName('CPPAGLOC') )  ;
            DM1.cdsMovCxP.Post  ;
            cdsCanjeCxP.Delete  ;
            dbgPendientes.RefreshDisplay ;
            dbgDocCanje.RefreshDisplay   ;
         end
         else
         begin
            ShowMessage('No se encontro mov') ;
         end ;
         cdsMovCxP.Filtered:=True;
      end;
      wmodifica := True;
   end;
end;

// Para Recibir los Documentos Pendientes

procedure TFPagosCaja.dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := True;
end;

{*******************************************************
CUARTO PANEL - BOTONES
*******************************************************}

procedure TFPagosCaja.z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('calc.exe',1 );  // Executa Aplicación
end;

procedure TFPagosCaja.z2bbtnSumatClick(Sender: TObject);
Var
   xTSalLoc, xTSalExt, xTPagLoc, xTPagExt : Double;
   xRegAct : TBookMark;
begin
   with DM1 do
   begin
   // Totales de Documentos de canje
      cdsCanjeCxP.DisableControls;
      xRegAct := cdsCanjeCxP.GetBookmark;
      xTSalLoc := 0; xTSalExt := 0; xTPagLoc := 0; xTPagExt := 0;
      cdsCanjeCxP.First ;
      while not cdsCanjeCxP.Eof do
      begin
         xTSalLoc := xTSalLoc + cdsCanjeCxP.FieldByName('CPSALLOC').AsFloat;
         xTSalExt := xTSalExt + cdsCanjeCxP.FieldByName('CPSALEXT').AsFloat;
         xTPagLoc := xTPagLoc + cdsCanjeCxP.FieldByName('CCPMOLOC').AsFloat;
         xTPagExt := xTPagExt + cdsCanjeCxP.FieldByName('CCPMOEXT').AsFloat;
         cdsCanjeCxP.Next;
      end;
      dbgDocCanje.ColumnByName('CPSALLOC').FooterValue:=floattostrf(xTSalLoc, ffNumber, 10, 2);
      dbgDocCanje.ColumnByName('CPSALEXT').FooterValue:=floattostrf(xTSalExt, ffNumber, 10, 2);
      dbgDocCanje.ColumnByName('CCPMOLOC').FooterValue:=floattostrf(xTPagLoc, ffNumber, 10, 2);
      dbgDocCanje.ColumnByName('CCPMOEXT').FooterValue:=floattostrf(xTPagExt, ffNumber, 10, 2);
      cdsCanjeCxP.GotoBookmark(xRegAct);
      cdsCanjeCxP.FreeBookmark(xRegAct);
      cdsCanjeCxP.EnableControls;
      if dblcTMon.Text=DM1.wTMonLoc then
         dbeImporte.Text:=FloattoStrF( xTPagLoc, ffnumber, 15, 2)
      else
         dbeImporte.Text:=FloattoStrF( xTPagExt, ffnumber, 15, 2);

   end;
end;

procedure TFPagosCaja.z2bbtnSubeClick(Sender: TObject);
begin
   {DM1.cdsEgrCaja.Edit;
   DM1.cdsRegCxP.Edit;}

   pnlCabecera3.enabled  := False;
   pnlCabecera2.Enabled  := True;
   pnlPendientes.Enabled := False;
   pnlDocCanje.Enabled   := False;
   pnlBotones.Enabled    := False;

   z2bbtnOk.Enabled      := True;
   z2bbtnCancel.Enabled  := True;

   // Desactivamos los botones
   z2bbtnSumat.Enabled     := False;
   z2bbtnNuevo.Enabled     := False;
   z2bbtnImprime.Enabled   := False;
   z2bbtnSube.Enabled      := False;
   z2bbtnGraba.Enabled     := False;
   z2bbtnCancel2.Enabled   := False;
   z2bbtnAnula.Enabled     := False;
end;


{*******************************************
Grabación Final de la Orden de Pago
********************************************}

function TFPagosCaja.ConsisMonto:Boolean;
var  xRegAct : TBookMark;
begin
     Result:=True;
     // Verifica que existan Documentos
     if DM1.cdsCanjeCxP.RecordCount=0 then
     begin
        ShowMessage(' No hay Documentos a Pagar ');
        Result:=False;
        exit;
     end;

     DM1.cdsMovCxP.DisableControls;
     DM1.cdsMovCxP.Filtered:=False;
     DM1.cdsCanjeCxP.DisableControls;
     xRegAct := DM1.cdsCanjeCxP.GetBookmark;
     DM1.cdsCanjeCxP.First;
     While not DM1.cdsCanjeCxP.Eof do
     Begin
        if DM1.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                                VarArrayOf([DM1.cdsCanjeCxP.FieldByName('CIAID').AsString,
                                            DM1.cdsCanjeCxP.FieldByName('TDIARID').AsString,
                                            DM1.cdsCanjeCxP.FieldByName('CCPANOMM').AsString,
                                            DM1.cdsCanjeCxP.FieldByName('CPNOREG').AsString]),
                                []) then
         begin
            If DM1.cdsMovCxP.FieldByName('TMONID').Asstring=DM1.wTMonLoc then begin
               If DM1.FRound(DM1.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat+DM1.cdsCanjeCxP.FieldByName('CCPMOLOC').AsFloat
                  -DM1.cdsCanjeCxP.FieldByName('CJEANTMN').AsFloat,15,2)>DM1.FRound(DM1.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat,15,2) Then begin
                   ShowMessage('Error : Monto pagado excede a Monto Total de Documento');
                   Result := False;
                   break;
               end;
            end
            else
            begin
               If DM1.FRound(DM1.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat+DM1.cdsCanjeCxP.FieldByName('CCPMOEXT').AsFloat
                 -DM1.cdsCanjeCxP.FieldByName('CJEANTME').AsFloat,15,2)>DM1.FRound(DM1.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat,15,2) Then
               begin
                  ShowMessage('Error : Monto pagado excede a Monto Total de Documento');
                  Result := False;
                  break;
               End;
            end;
         end;
         DM1.cdsCanjeCxP.Next;
     end;
     DM1.cdsCanjeCxP.GotoBookmark(xRegAct);
     DM1.cdsCanjeCxP.FreeBookmark(xRegAct);
     DM1.cdsCanjeCxP.EnableControls;
     DM1.cdsMovCxP.Filtered:=True;
     DM1.cdsMovCxP.EnableControls;
end;

procedure TFPagosCaja.z2bbtnGrabaClick(Sender: TObject);
var
  xRegAct : TBookMark;
  xPagLoc, xPagExt : Real;
  xTPagLoc, xTPagExt : Real;
begin
   if DM1.cdsPagoCxP.FieldByName('OPEstado').AsString='I' then
   begin
       with DM1 do begin
          if not ConsisMonto then
          begin
             ShowMessage('No se puede Grabar') ;
             exit   ;
          end ;
          // Calcula los Montos de la Orden de Pago
          Screen.Cursor := crHourGlass ;

          cdsCanjeCxP.DisableControls;
          xRegAct := cdsCanjeCxP.GetBookmark;
          xTPagLoc := 0; xTPagExt := 0;
          cdsCanjeCxP.First ;
          while not cdsCanjeCxP.Eof do
          begin
             xTPagLoc := xTPagLoc + cdsCanjeCxP.FieldByName('CCPMOLOC').Asfloat;
             xTPagExt := xTPagExt + cdsCanjeCxP.FieldByName('CCPMOEXT').Asfloat;
             cdsCanjeCxP.Next;
          end;

          cdsPagoCxP.Edit;
          DM1.cdsPagoCxP.FieldByName('OPMTOLOC').Asfloat:= xTPagLoc;
          DM1.cdsPagoCxP.FieldByName('OPMTOEXT').Asfloat:= xTPagExt;
          if DM1.cdsPagoCxP.FieldByName('TMONID').Asstring=wtMonLoc then
             DM1.cdsPagoCxP.FieldByName('OPMTOORI').Asfloat:= xTPagLoc
          else
             DM1.cdsPagoCxP.FieldByName('OPMTOORI').Asfloat:= xTPagExt;


          cdsCanjeCxP.GotoBookmark(xRegAct);
          cdsCanjeCxP.FreeBookmark(xRegAct);
          cdsCanjeCxP.EnableControls;


       // Actualiza Saldo de MovCxP
          DM1.cdsMovCxP.DisableControls;
          DM1.cdsMovCxP.Filtered:=False;
          DM1.cdsCanjeCxP.DisableControls;
          xRegAct := DM1.cdsCanjeCxP.GetBookmark;
          DM1.cdsCanjeCxP.First;
          while not DM1.cdsCanjeCxP.Eof do
          begin
             if DM1.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                                      VarArrayOf([DM1.cdsCanjeCxP.FieldByName('CIAID').AsString,
                                                  DM1.cdsCanjeCxP.FieldByName('TDIARID').AsString,
                                                  DM1.cdsCanjeCxP.FieldByName('CCPANOMM').AsString,
                                                  DM1.cdsCanjeCxP.FieldByName('CPNOREG').AsString]),
                                      []) then
             begin
                DM1.cdsMovCxP.edit ;
                If DM1.cdsMovCxP.FieldByName('TMONID').Asstring=DM1.wTMonLoc then
                begin
                   xPagLoc := DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPMOLOC').Asfloat-DM1.cdsCanjeCxP.FieldByName('CJEANTMN').Asfloat,15,2) ;
                   DM1.cdsMovCxP.FieldByName('CPSALLOC').Asfloat:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALLOC').Asfloat-xPagLoc,15,2) ;
                   DM1.cdsMovCxP.FieldByName('CPSALEXT').Asfloat:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALLOC').Asfloat/DM1.cdsCanjeCxP.FieldByName('CCPTCCJE').Asfloat,15,2) ;
                end
                else
                begin
                   xPagExt := DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPMOEXT').Asfloat-DM1.cdsCanjeCxP.FieldByName('CJEANTME').Asfloat,15,2) ;
                   DM1.cdsMovCxP.FieldByName('CPSALEXT').Asfloat:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALEXT').Asfloat-xPagExt,15,2) ;
                   DM1.cdsMovCxP.FieldByName('CPSALLOC').Asfloat:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALEXT').Asfloat*DM1.cdsCanjeCxP.FieldByName('CCPTCCJE').Asfloat,15,2) ;
                end ;
                DM1.cdsMovCxP.post ;
             end ;
             DM1.cdsCanjeCxP.Next;
          end;
          DM1.cdsCanjeCxP.GotoBookmark(xRegAct);
          DM1.cdsCanjeCxP.FreeBookmark(xRegAct);
          DM1.cdsCanjeCxP.EnableControls;
          DM1.cdsMovCxP.Filtered:=True;
          DM1.cdsMovCxP.EnableControls;

          RecalculaSaldos(False);

          // Actualiza Tablas
          DM1.cdsPagoCxP.ApplyUpdates(0);
          DM1.cdsCanjeCxP.ApplyUpdates(0);
          DM1.cdsMovCxP.ApplyUpdates(0);

          z2bbtnSumatClick(sender);

          screen.Cursor := crDeFault ;
          ShowMessage('Grabacion OK');
          lblEstado.Caption    :='Activo             ';
          dblcdAux.Enabled := False ;
          z2bbtnNuevo.Enabled    := True;
          z2bbtnAnula.Enabled    := True;
          z2bbtnImprime.Enabled  := True;
          Z2bbtnAceptar.enabled := true ;
          wmodifica:=False;
       end;
    end
    else
    begin
         ShowMessage('Imposible Grabar');
    end;
end;

procedure TFPagosCaja.z2bbtnCancel2Click(Sender: TObject);
begin
   if MessageDlg('¿Anular los cambios?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin
      DM1.cdsPagoCxP.CancelUpdates;
      DM1.cdsMovCxP.CancelUpdates;
      DM1.cdsCanjeCxP.CancelUpdates;
      IniciaDatos;
      //** 05/06/2001 - pjsv, para grabar el nuevo voucher
      xVoucher := '';
      //**
   end;
end;

procedure TFPagosCaja.z2bbtnImprimeClick(Sender: TObject);
begin
	 //JCC: 24/06/2002
  if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
  begin
        xSQL:='Select CXP304.DOCID , CXP304.CPSERIE,CXP304.CPNODOC,CXP304.CIAID, '
              +' CXP304.CPNOREG,CXP304.CPFVCMTO,CXP304.CCPMOLOC, '
              +' CASE WHEN CXP304.TMONID='''+DM1.wTMonLoc+''' THEN CXP304.CCPMOLOC ELSE CXP304.CCPMOEXT END  MONTOPAG '
        +' from CXP304 '
        +' Where CXP304.CIAID='+quotedstr(dblcCia.Text)+' and '
        +' CXP304.CCPCANJE='+quotedstr(dbeOPago.Text)+' AND CXP304.TCANJEID='+quotedstr('OP');
  End;
  if DM1.SRV_D = 'ORACLE' then
  begin
        xSQL:='Select CXP304.DOCID , CXP304.CPSERIE,CXP304.CPNODOC,CXP304.CIAID, '
              +' CXP304.CPNOREG,CXP304.CPFVCMTO,CXP304.CCPMOLOC, '
              +' DECODE(CXP304.TMONID,'''+DM1.wTMonLoc+''', CXP304.CCPMOLOC,CXP304.CCPMOEXT)  MONTOPAG '
        +' from CXP304 '
        +' Where CXP304.CIAID='+quotedstr(dblcCia.Text)+' and '
        +' CXP304.CCPCANJE='+quotedstr(dbeOPago.Text)+' AND CXP304.TCANJEID='+quotedstr('OP');
  End;
  DM1.cdsQry2.IndexFieldNames :='';
  DM1.cdsQry2.Filter   :='';
  DM1.cdsQry2.Filtered := False;
  DM1.cdsQry2.Close;
  DM1.cdsQry2.DataRequest( xSQL );
  DM1.cdsQry2.Open;

  ppdbCanje.DataSource := DM1.dsQry2;


  pprOPago.TEMPLATE.FileName := wRutaRpt + '\OrdenPago.Rtm';
  pprOPago.template.LoadFromFile ;

  ppdbtFOrdenP.Text := dbdtpFPago.text;
  ppdbtOrdenP.Text := dbeOPago.text;
  pplblCia.Caption := edtCia.text;
  ppdbtProv.text := dblcdAux.text;
  ppdbtCambio.text := dbeTCambio.text;
  ppdbtFormaP.text := edtFormPago.text;
  ppdbtMoneda.text := edtTMon.text;
  ppdbtMoneda1.text := edtTMon.text;
  ppdbtBanco.text := edtBanco.text;
//  ppdbtCtaCte.text := edtCCBco.text;
  ppdbtCheque.text := dbeNoChq.text;
  pplblAprobadopor.text := dbeAprob.text;
  pplblElaborado.text := dbeElabo.text;
  xDescrip := 'PROV='+quotedstr(dblcdAux.text);
  ppdbtProvDes.text := DM1.DisplayDescrip('prvTGE','TGE201','PROVDES, PROVGIRA',xDescrip,'PROVDES');
  ppdbtGirado.text := DM1.cdsQry.fieldbyName('PROVGIRA').asString;
  pprOPago.Print;
end;

procedure TFPagosCaja.ppDBText5Print(Sender: TObject);
begin
{   if DM1.cdsPagoCxP.FieldByName('TMONID').Asstring=DM1.wTMonLoc then
      ppDBText5.DataField := 'CCPMOLOC'
   else
      ppDBText5.DataField := 'CCPMOEXT'}
end;

procedure TFPagosCaja.ppDBCalc1Print(Sender: TObject);
begin
{   if DM1.cdsPagoCxP.FieldByName('TMONID').Asstring=DM1.wTMonLoc then
      ppDBCalc1.DataField := 'CCPMOLOC'
   else
      ppDBCalc1.DataField := 'CCPMOEXT'}
end;

procedure TFPagosCaja.dbgDocCanjeColExit(Sender: TObject);
begin

   if dbgDocCanje.SelectedField.FieldName='CCPTCCJE' then
   begin
      dbgDocCanje.RefreshDisplay;
   end;

   if dbgDocCanje.SelectedField.FieldName='CCPMOLOC' then
   begin
      if DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPMOLOC').Asfloat,15,2)>DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CPSALLOC').Asfloat,15,2) then
      begin
         ShowMessage('Monto excede a Saldo Actual');
         DM1.cdsCanjeCxP.Edit;
         DM1.cdsCanjeCxP.FieldByName('CCPMOLOC').Asfloat:=DM1.cdsCanjeCxP.FieldByName('CjeAntMN').Asfloat;
         dbgDocCanje.SelectedIndex:=8; // debería ser 9 pero no hace caso
         dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
      end
      //wmc1234
      else
      begin
          z2bbtnSumatClick(Self) ;
      end ;
      //wmc1234
   end;

   if dbgDocCanje.SelectedField.FieldName='CCPMOEXT' then
   begin
      if DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPMOEXT').Asfloat,15,2)>DM1.Fround(DM1.cdsCanjeCxP.FieldByName('CPSALEXT').Asfloat,15,2) then
      begin
         ShowMessage('Monto excede a Saldo Actual');
         DM1.cdsCanjeCxP.Edit;
         DM1.cdsCanjeCxP.FieldByName('CCPMOEXT').Asfloat:=DM1.cdsCanjeCxP.FieldByName('CjeAntME').Asfloat;
         dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
         dbgDocCanje.SelectedIndex:=10; // debería ser 9 pero no hace caso
      end
      //wmc1234
      else
      begin
          z2bbtnSumatClick(Self) ;
      end
      //wmc1234
   end;

end;

procedure TFPagosCaja.z2bbtnNuevoClick(Sender: TObject);
begin
   BitBtn1.Enabled:=False;
   if DM1.cdsPagoCxP.FieldByName('OPEstado').Asstring ='I' then
   begin
      if wmodifica then
      begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      end;
      if MessageDlg('¿Nueva Orden de Pago?',
         mtConfirmation, [mbYes, mbNo], 0)=mrYes then
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
   xVoucher := '';
end;

procedure TFPagosCaja.z2bbtnAnulaClick(Sender: TObject);
begin
    if DM1.cdsPagoCxP.FieldByName('OPEstado').Asstring = 'I' then
    begin

      if MessageDlg('¿Anular Orden de Pago?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin

         DM1.cdsPagoCxP.CancelUpdates;
         DM1.cdsMovCxP.CancelUpdates;
         DM1.cdsCanjeCxP.CancelUpdates;

         // Actualiza los Saldos de los Documentos Canjeados
         DM1.cdsMovCxP.DisableControls;
         DM1.cdsMovCxP.Filtered:=False;
         DM1.cdsCanjeCxP.DisableControls;
         DM1.cdsCanjeCxP.First;
         While not DM1.cdsCanjeCxP.Eof do
         begin
            if ExisteMovCxP( DM1.cdsCanjeCxP.FieldByName('CIAID').Asstring,DM1.cdsCanjeCxP.FieldByName('TDIARID').Asstring,
                             DM1.cdsCanjeCxP.FieldByName('CCPANOMM').Asstring,DM1.cdsCanjeCxP.FieldByName('CPNOREG').Asstring) then
            begin
               DM1.cdsMovCxP.Edit;
               If DM1.cdsMovCxP.FieldByName('TMONID').Asstring=DM1.wTMonLoc then
               begin
                  DM1.cdsMovCxP.FieldByName('CPSALLOC').Asfloat:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPMTOLOC').Asfloat-DM1.cdsMovCxP.FieldByName('CPPAGLOC').Asfloat,15,2);
                  If DM1.cdsMovCxP.FieldByName('CPTCAMPA').Asfloat>0 then
                     DM1.cdsMovCxP.FieldByName('CPSALEXT').Asfloat:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALLOC').Asfloat/DM1.cdsMovCxP.FieldByName('CPTCAMPA').Asfloat,15,2)
                  else
                  begin
                     DM1.cdsMovCxP.FieldByName('CPSALEXT').Asfloat:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALLOC').Asfloat/DM1.cdsMovCxP.FieldByName('CPTCAMAJ').Asfloat,15,2);
                  end;
                  end
               else
               begin
                  DM1.cdsMovCxP.FieldByName('CPSALEXT').Asfloat:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPMTOEXT').Asfloat-DM1.cdsMovCxP.FieldByName('CPPAGEXT').Asfloat,15,2);
                  If DM1.cdsMovCxP.FieldByName('CPTCAMPA').Asfloat>0 then
                     DM1.cdsMovCxP.FieldByName('CPSALLOC').Asfloat:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALEXT').Asfloat*DM1.cdsMovCxP.FieldByName('CPTCAMPA').Asfloat,15,2)
                  else
                  begin
                     DM1.cdsMovCxP.FieldByName('CPSALLOC').Asfloat:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALEXT').Asfloat*DM1.cdsMovCxP.FieldByName('CPTCAMAJ').Asfloat,15,2);
                  end;
               end;
            end;
            DM1.cdsCanjeCxP.Next;
         end;
         DM1.cdsCanjeCxP.EnableControls;
         DM1.cdsMovCxP.Filtered:=True;
         DM1.cdsMovCxP.EnableControls;

         DM1.cdsMovCxP.ApplyUpdates(0);

         // Anula Orden de Pago
         DM1.cdsPagoCxP.Edit;
         DM1.cdsPagoCxP.FieldByName('OPEstado').Asstring:='A';  // Anulada
         DM1.cdsPagoCxP.ApplyUpdates(0);

         pnlPendientes.Enabled    := False;
         pnlDocCanje.Enabled      := True;
         dbgDocCanje.ReadOnly     := True;     // Para el Grid

         z2bbtnSumat.Enabled    := False;
         z2bbtnNuevo.Enabled    := True;
         z2bbtnSube.Enabled     := False;
         z2bbtnGraba.Enabled    := False;
         z2bbtnCancel2.Enabled  := False;
         z2bbtnAnula.Enabled    := False;
         lblEstado.Caption    :='Anulado            ';
       end;
    end
    else
    begin
         ShowMessage('Imposible Anular Orden de Pago');
    end;
end;

procedure TFPagosCaja.ActPnlBotones;
begin
   z2bbtnSumat.Enabled    := wbSumat;
   z2bbtnNuevo.Enabled    := wbNuevo;
   z2bbtnImprime.Enabled  := wbImprime;
   z2bbtnSube.Enabled     := wbSube;
   z2bbtnGraba.Enabled    := wbGraba;
   z2bbtnCancel2.Enabled  := wbCancel2    ;
   z2bbtnAnula.Enabled    := wbAnula      ;
   Z2bbtnAceptar.enabled := wbCancelado   ;
end;

{*******************************************************
FIN DE LA FORMA
*******************************************************}

procedure TFPagosCaja.FormClose(Sender: TObject; var Action: TCloseAction);
begin

 // Cancela Cualquier Modificación
   BitBtn1.Enabled:=False;

   if DM1.cdsPagoCxP.Active then
      DM1.cdsPagoCxP.CancelUpdates;
   if DM1.cdsMovCxP.Active then
      DM1.cdsMovCxP.CancelUpdates;
   if DM1.cdsCanjeCxP.Active then
      DM1.cdsCanjeCxP.CancelUpdates;

   // Limpiando filtros si lo tuvieran
//0905   DM1.cdsPagoCxP.Filtered:=False;

   DM1.cdsMovCxP.Filtered :=False;

//** 03/04/2001 - pjsv
//   DM1.cdsCanjeCxP.Filter := '';
//   DM1.cdsCanjeCxP.Filtered := True;
//**
//3004   cdsCanjeCxP.Filtered :=False;

   DM1.cdsCCBco.Filtered:=False;
   cf1.QuitarExits(self) ;
//   DM1.ControlFocoSalida(self,ctrl,evt_exit) ;
//
//   LibConfigAccesos;
//

end;

Function TFPagosCaja.ExisteMovCxP(xxCia,xxTDiario,xxAAMM,xxNoReg:String):Boolean;
begin
  if DM1.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                          VarArrayOf([DM1.cdsCanjeCxP.FieldByName('CIAID').AsString,
                                      DM1.cdsCanjeCxP.FieldByName('TDIARID').AsString,
                                      DM1.cdsCanjeCxP.FieldByName('CCPANOMM').AsString,
                                      DM1.cdsCanjeCxP.FieldByName('CPNOREG').AsString]),
                          []) then
      Result := True
  else
      Result := False;
end;

procedure TFPagosCaja.dblcdAuxChange(Sender: TObject);
begin
{   wmodifica:=True;
//   if Length(dblcdProv.Text)=dblcdProv.LookupTable.FieldByName('PROV').size then
   if Length(dblcdProv.Text) >= 6 then
   begin
        if dblcdProv.Text=dblcdProv.LookupTable.FieldByName('PROV').AsString then
        begin
           edtProvRUC.Text:=dblcdProv.LookupTable.FieldByName('PROV').AsString;
           if dblcdProv.LookupTable.FieldByName('PROVGIRA').AsString='' then
              dbeGiradoA.text:=dblcdProv.LookupTable.FieldByName('PROVDES').AsString
           else
              dbeGiradoA.text:=dblcdProv.LookupTable.FieldByName('PROVGIRA').AsString;
        end
        else
        begin
          if not dblcdProv.LookupTable.Locate('PROV', dblcdProv.Text,[]) then
          begin
            edtProvRUC.Text:='';
            dbeGiradoA.text:='';
          end
          else
          begin
            edtProvRUC.Text:=dblcdProv.LookupTable.FieldByName('PROV').AsString;
            if dblcdProv.LookupTable.FieldByName('PROVGIRA').AsString='' then
               dbeGiradoA.text:=dblcdProv.LookupTable.FieldByName('PROVDES').AsString
            else
               dbeGiradoA.text:=dblcdProv.LookupTable.FieldByName('PROVGIRA').AsString;
          end;
        end;
   end
   else
   begin
      edtProvRUC.Text:='';
      dbeGiradoA.text:='';
   end;}
end;

procedure TFPagosCaja.edtProvRUCChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagosCaja.dbeGiradoAChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagosCaja.dbdtpFPagoChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagosCaja.dbeNoChqChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagosCaja.dbeElaboChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagosCaja.dbeAprobChange(Sender: TObject);
begin
   wmodifica:=True;
end;


procedure TFPagosCaja.FormKeyPress(Sender: TObject; var Key: Char);
var
   xStr : String ;
begin
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


procedure TFPagosCaja.z2bbtnOKCabClick(Sender: TObject);
var
   xWhere : string ;
begin
   if edtcia.Text = '' then
   begin
      ShowMessage('Ingrese Compañía');
      edtCia.SetFocus;
      exit;
   end;
   if dbeOPago.Text = '' then
   begin
      ShowMessage('Ingrese Número de Orden');
      dbeOPago.SetFocus;
      exit;
   end;

   xFlagCal := False;
   xWhere:='CIAID='''+dblcCia.Text+''' AND OPAGO='''+dbeopago.Text+'''' ;
   if DM1.DisplayDescrip('prvTGE','CXP303','COUNT(*) TOTREG',xWhere,'TOTREG')>'0' then
   begin
      ShowMessage('Orden de pago ya esta Registrado');
      dbeOPago.Text:='';
      dbeOPago.SetFocus;
      exit;
   end;

   DM1.cdsPagoCxP.Insert;
   DM1.cdsPagoCxP.FieldByName('CIAID').Asstring    := dblcCia.Text;  // Compañía
   DM1.cdsPagoCxP.FieldByName('OPAGO').Asstring    := dbeopago.Text;  // Orden de Pago
   DM1.cdsPagoCxP.FieldByName('OPUser').Asstring   := DM1.wUsuario;  // usuario que registra
   DM1.cdsPagoCxP.FieldByName('OPFReg').Asdatetime   := dateS;          // fecha que registra usuario
   if DM1.SRV_D = 'ORACLE' then
     DM1.cdsPagoCxP.FieldByName('OPHReg').AsDateTime   := DateS+Time          // hora que registra usuario
   else
        DM1.cdsPagoCxP.FieldByName('OPHReg').AsDateTime   := Time;
   DM1.cdsPagoCxP.FieldByName('OPESTADO').Asstring := 'I';
   DM1.cdsPagoCxP.fieldbyName('OPFPAGO').Asdatetime  := dbdtpFPago.Date;
   dbeTCambio.text := DM1.RecuperarTipoCambio(Now) ;
   DM1.cdsPagoCxP.Post;

   // Actualizar Label Estado
   lblEstado.Caption := 'Nuevo     ';
   dblcdAux.Enabled := True ;
   pnlCabecera.Enabled  := false;
   pnlCabecera2.Enabled := true;
   z2bbtnOk.Enabled       := True;
   z2bbtnCancel.Enabled   := True;
   wbSumat     := True;
   wbImprime   := False;
   wbNuevo     := False;
   wbSube      := True;
   wbGraba     := True;
   wbCancelado := False;
   wbCancel2   := True;
   wbAnula     := False;
   (Sender as tcontrol).Enabled:=false;
   wmodifica:=False;
   perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFPagosCaja.dbeOPagoExit(Sender: TObject);
begin
     dbeopago.Text:=DM1.strzero(dbeopago.Text,DM1.cdsPagoCxP.FieldByName('OPAGO').DisplayWidth);
end;

procedure TFPagosCaja.dbgDocCanjeCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
if (AFieldName = 'CCPMOLOC') or (AFieldName = 'CCPMOEXT') then
begin
  ABrush.Color := clNone;
end;
end;

{function TFPagosCaja.ValidacionCabecera: Boolean;
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

end;              }

procedure TFPagosCaja.dbeElaboKeyPress(Sender: TObject; var Key: Char);
begin
   if key in ['0'..'9'] then
      key := #0;
end;

procedure TFPagosCaja.dbeAprobKeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0'..'9'] then
   key := #0;

end;

procedure TFPagosCaja.ValidaCabecera;
begin
   if length(dblcCia.Text)=0 then
   Begin
       dblcCia.setfocus;
       raise exception.Create('Falta Codigo de Compañía');
   End;
   if length(edtCia.Text)=0 then
   Begin
       dblcCia.setfocus;
       raise exception.Create('Codigo de Compañia Errado');
   end;
   if length(dbeOPago.Text)=0 then
   Begin
       dbeOPago.setfocus;
       raise exception.Create('Falta No.Orden de Pago');
   End;
   if (length(dblcdAux.Text)=0) or (length(edtAuxRUC.Text)=0) then
   begin
      dblcdAux.Enabled;
      dblcdAux.setfocus;
      raise exception.Create('Faltan Datos del Proveedor');
   end;
   if length(dbeGiradoA.Text)=0 then
   Begin
      dbeGiradoA.setfocus;
      raise exception.Create('Datos del Proveedor Errados');
   end;
   if dbdtpFPago.Date=0 then
   Begin
      dbdtpFPago.setfocus;
      raise exception.Create('Falta Fecha de Orden de Pago');
   End;
   If dblcTMon.Enabled=True then
   Begin
      if length(dblcTMon.Text)=0 then
      Begin
         dblcTMon.setfocus;
         raise exception.Create('Falta Tipo de Moneda');
      end;
      if length(edtTMon.Text)=0 then
      Begin
         dblcTMon.setfocus;
         raise exception.Create('Código de Moneda Errado');
      End;

   End;
   if length(dbeTCambio.Text)=0 then
      raise exception.Create('Falta Tipo de Cambio')
   else
      if strtofloat(dbeTCambio.Text)<=0 then
          raise exception.Create('Tipo de Cambio Errado');

   if dblcFormPago.Enabled=True then
   Begin
      if length(edtFormPago.Text)=0 then
      Begin
          dblcFormPago.setfocus;
          raise exception.Create('Falta Forma de Pago');
      End;
   End;   
   if (dblcBanco.Enabled=True) and (length(dblcBanco.Text)=0) then
   begin
      dblcBanco.setfocus;
      raise exception.Create('Falta definir Banco');
   end;
   if (dblcCCBco.Enabled=True) and (length(dblcCCBco.Text)=0) then
   begin
      dblcCCBco.setfocus;
      raise exception.Create('Falta Cuenta Corriente Banco');
   end;
   if (dbeNoChq.Enabled=True) and (length(dbeNoChq.Text)=0) then
   begin
      dbeNoChq.setfocus;
      raise exception.Create('Falta No. de Cheque');
   end;
   if length(dbeElabo.Text)=0 then
   Begin
       dbeElabo.setfocus;

       raise exception.Create('Falta "Elaborado por:"');
   End;
   if length(dbeAprob.Text)=0 then
   Begin
       dbeAprob.setfocus;
       raise exception.Create('Falta "Aprobado por:"');
   End;
end;

procedure TFPagosCaja.dbgDocCanjeExit(Sender: TObject);
begin
//Todod este codigo ha sido añadido por william manriuqe cautín
   if dbgDocCanje.SelectedField.FieldName='CCPMOLOC' then
   begin
      if DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPMOLOC').Asfloat,15,2)>DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CPSALLOC').Asfloat,15,2) then
      begin
         ShowMessage('Monto excede a Saldo Actual');
         DM1.cdsCanjeCxP.Edit;
         DM1.cdsCanjeCxP.FieldByName('CCPMOLOC').Asfloat:=DM1.cdsCanjeCxP.FieldByName('CjeAntMN').Asfloat;
         dbgDocCanje.SelectedIndex:=8; // debería ser 9 pero no hace caso
         dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
      end
      //wmc1234
      else
      begin
          z2bbtnSumatClick(Self) ;
      end ;
      //wmc1234
   end;

   if dbgDocCanje.SelectedField.FieldName='CCPMOEXT' then
   begin
      if DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPMOEXT').Asfloat,15,2)>DM1.Fround(DM1.cdsCanjeCxP.FieldByName('CPSALEXT').Asfloat,15,2) then
      begin
         ShowMessage('Monto excede a Saldo Actual');
         DM1.cdsCanjeCxP.Edit;
         DM1.cdsCanjeCxP.FieldByName('CCPMOEXT').Asfloat:=DM1.cdsCanjeCxP.FieldByName('CjeAntME').Asfloat;
         dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
         dbgDocCanje.SelectedIndex:=10; // debería ser 9 pero no hace caso
      end
      //wmc1234
      else
      begin
          z2bbtnSumatClick(Self) ;
      end
      //wmc1234
   end;
//fin de codigo añadido por william manrique cautín
end;

procedure TFPagosCaja.dbeNoChqChange2(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFPagosCaja.dbeTCambioChange(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFPagosCaja.dblcBancoExit(Sender: TObject);
begin
    dblcCCBco.Text := '' ;
    edtCuenta.Text := '' ;
    dblcTMon.Text := '' ;
    edtTMon.Text := '' ;
    dblcFormPago.text := '' ;
    edtFormPago.text := '' ;
    dbeNoChq.Text := '' ;

    edtBanco.Text := DM1.DisplayDescrip('prvTGE','TGE105','BANCONOM','BANCOID='+quotedstr(dblcBanco.text),'BANCONOM');
    if length(edtBanco.Text)=0 then
    Begin
     dblcBanco.setfocus;
     Showmessage('Banco Errado');
     Exit;
    End;
    if edtBanco.Text <> '' then
     begin
       if DM1.cdsbancoegr.FieldByName('BCOTIPCTA').Asstring='C' then
       begin //Si es CAJA
          dblcCCBco.Enabled:=False;
          dblcTMon.Enabled := True ;
          dblcFormPago.Enabled := True ;
          edtCuenta.Text:=DM1.cdsbancoegr.FieldByName('CUENTAID').AsString; //Se toma de la tabla Bancos
          //Filtrar los tipos de Pago
          DM1.cdsFormPago.Filter := 'FCEGR=''1'' or FCEGR=''S'' ' ;
          DM1.cdsFormPago.Filtered := True ;
       end
       else
       begin  //Si es BANCO
          dblcCCBco.Enabled:=True;   //Habilitar CtaCte
          dblcTMon.Enabled := False ;
          dblcFormPago.Enabled := False ;
          DM1.cdsCCBco.Filtered:=False;
          DM1.cdsCCBco.Filter:='';   //Filtrar la lista de CtaCte por Banco
          DM1.cdsCCBco.Filter:='BANCOID='+''''+dblcBanco.Text+'''';
          DM1.cdsCCBco.Filtered:=True;
          //filtrar los tipos de pago
          DM1.cdsFormPago.Filter := 'FCBCO=''1'' or FCBCO=''S'' ' ;
          DM1.cdsFormPago.Filtered := true ;
       end;
       dblcFormPago.Enabled := True ;
       if dblcCCBco.Enabled then
          dblcCCBco.SetFocus
       else
          if dblcFormPago.Enabled then
             dblcFormPago.SetFocus;

     end
    else exit ;

   wmodifica:=True;

end;

procedure TFPagosCaja.dblcCCBcoChange2(Sender: TObject);
begin
    IF not (Sender as TCustomEdit).focused then
       Exit ;

     if trim(dblcccbco.Text)<>'' then
   begin
      if DM1.cdsCCBco.Locate('BANCOID;CCBCOID',VararrayOf([dblcbanco.text,dblcccbco.text]),[]) then
      begin
        edtCuenta.Text:=DM1.cdsCCBco.FieldByName('CTAPRINC').AsString ;
        xVoucher := DM1.cdsCCBco.FieldByName('CCBCOVOUCH').AsString;
      end
      else
      begin
           edtCuenta.Text:= '' ;
      end;
   end
   else
   begin
        edtCuenta.Text := '' ;
   end ;

   if dblcccbco.Text <> '' then
   begin
      dblcformpago.Enabled := True ;
   end   ;

   wmodifica:=True;
end;

procedure TFPagosCaja.dblcCCBcoEnter(Sender: TObject);
begin
   strTmp := dblcCCBco.Text ;
end;

procedure TFPagosCaja.dblcCCBcoExit(Sender: TObject);
var
   Tmp, xx : String ;
begin
   Tmp := StrTmp ;
   StrTmp := Tmp ;

   if dblcCCBco.Text <> strTmp then
   begin
      dblcTmon.Text := DM1.cdsCCBco.FieldByName('TMONID').AsString ;
      edtTMon.Text := DM1.DisplayDescripLocal(DM1.cdsTMon,'TMONID',dblcTMon.text,'TMONDES') ;
      dbeNOChq.Text := '' ;
   end ;
   if dblcFormPago.Enabled then
      dblcFormPago.SetFocus;


end;

procedure TFPagosCaja.dblcFormPagoExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then exit;
   if dblcCCBco.Focused then Exit;
//   if dblcTMon.Focused then exit;

   edtFormPago.text:= DM1.DisplayDescripLocal(DM1.cdsFormPago,'FPAGOID',dblcFormPago.Text,'FPAGODES') ;
   if length(edtFormPago.Text)=0 then
   Begin
     dblcFormPago.setfocus;
     Showmessage('Forma de Pago Errado');
     Exit;
   End;


   if dblcFormPago.Text='' then begin
      dbeNoChq.Text :='';
      ShowMessage('Error : Forma de Pago no Valida');
      dblcFormPago.SetFocus;
      Exit;
   end;
   if (DM1.cdsFormPago.FieldByName('FCHQ').AsString='1') or
      (DM1.cdsFormPago.FieldByName('FCHQ').AsString='S') then
      begin
         dbeNoChq.Enabled :=True;
         dbeNoChq.SetFocus;
      end
      else
      begin
         dbeNoChq.Enabled :=False;
      end;
   
end;

procedure TFPagosCaja.dblcTMonExit(Sender: TObject);
begin
  edtTMon.Text := DM1.DisplayDescrip('prvTGE','TGE103','TMONABR','TMONID='+quotedstr(dblcTMon.text),'TMONABR');
//  If edtTMon.Text = '' then showmessage('Falta Moneda');
  if length(edtTMon.Text)=0 then
  Begin
   dblcTMon.setfocus;
   Showmessage('Tipo de Moneda Errado');
   Exit;
  End;
end;

procedure TFPagosCaja.dbeTCambioEnter(Sender: TObject);
begin
  strTmp := dbeTCambio.text ;
end;

procedure TFPagosCaja.RecuperaDescrip;
begin
//procedure TSOLsrvCAJA.DescripOPago(const xCIAID, xOPAGO: WideString);
//SELECT TGE105.BANCONOM, TGE103.TMONDES, TGE106.CCBCODES, TGE112.FPAGODES
    DM1.DescripOpago(dblcCia.text,dbeOPago.text) ;
    DM1.cdsDescrip.Active := False ;
    DM1.cdsDescrip.Active := True ;
    edtBanco.Text := DM1.FieldNoNulo(DM1.cdsDescrip.FieldByName('BANCOABR'));
    edtTMon.text := DM1.FieldNoNulo(DM1.cdsDescrip.FieldByName('TMONABR'));
    edtFormPago.text := DM1.FieldNoNulo(DM1.cdsDescrip.FieldByName('FPAGOABR'));
end;

procedure TFPagosCaja.dbdtpFPagoEnter(Sender: TObject);
begin
   strTmp := dbdtpFPago.Text ;
end;

procedure TFPagosCaja.Adiciona;
begin
   IniciaDatos;

   dblcCCBco.Selected.Clear;
   dblcCCBco.Selected.Add('CCBCOID'#9'25'#9'Cuenta Corriente del Banco'#9'F');
   dblcCCBco.Selected.Add('CCBCODES'#9'30'#9'Descripción'#9'F');
   dblcCCBco.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');

   xGraboNuevo:=False;
   if not DM1.cdsCanjeCxP.Active then
   begin
      xSQL:='Select * from CXP304 Where CIAID='''' and CCPCANJE='''' ';
      DM1.cdsCanjeCxP.Close;
      DM1.cdsCanjeCxP.DataRequest( xSQL );
      DM1.cdsCanjeCxP.Open;
   end ;

   z2bbtnNuevo.Visible   := True ;
   z2bbtnCancel.Visible  := True ;
   dblcClase.Enabled     := True ;
   dblcdAux.Enabled      := True ;
   DM1.cdsMovCxP.Filter  := 'CIAID=''''' ;
   DM1.cdsMovCxP.Filtered:= True ;
end;

procedure TFPagosCaja.Edita(Comp: structOPago;cds : Twwclientdataset);
VAR
   xWhere : String;
begin
   // Inicia Datos para que los DBEdit no se vean con datos llenos
   IniciaDatos;
   cdsfiltro :=  cds ;
   dblcCia.Text   := Comp.CIAID  ;
   if length(dblcCia.Text)<>0 then
   Begin
    xWhere:='CIAID='+''''+dblcCia.Text+'''';
    edtCia.Text:=DM1.DisplayDescrip('prvTGE','TGE101','CIADES',xWhere,'CIADES');
   End;
   dbeOPago.Text  := Comp.OPAGO ;
   dbdtpFPago.Date:= DM1.cdsPagoCxP.FieldByName('OPFPAGO').AsDateTime;
   xFlagCal := False;

   // vhn 23/01/2001
   xSQL:='Select * from CXP304 '
        +'Where CIAID='+quotedstr(dblcCia.Text)+' and '
        +'CCPCANJE='+quotedstr(dbeOPago.Text)+' AND TCANJEID='+quotedstr('OP');
   DM1.cdsCanjeCxP.Close;
   DM1.cdsCanjeCxP.DataRequest( xSQL );
   DM1.cdsCanjeCxP.Open;

   dblcTDiario.Text:=DM1.cdsPagoCxP.FieldByName('CCBCOVOUCH').AsString;
   xWhere:='TDIARID='''+dblcTDiario.text+'''';
   edtTDiario.Text:=DM1.DisplayDescrip('prvTGE','TGE104','TDIARDES', xWhere, 'TDIARDES' );
   dbeNoComp.Text  :=DM1.cdsPagoCxP.FieldByName('ECNOCOMP').AsString;

   xSQL:='Select * from CAJA302 '
          +'Where CIAID='''   +dblcCia.Text    +''' and '
          +      'ECANOMM=''' +edtPeriodo.Text +''' and '
          +      'TDIARID=''' +dblcTDiario.Text+''' and '
          +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
   DM1.cdsEgrCaja.Close;
   DM1.cdsEgrCaja.DataRequest( xSQL );
   DM1.cdsEgrCaja.Open;

   dblcTDoc.text:=DM1.cdsEgrCaja.FieldByname('DOCID').AsString;
   edtTDoc.text:=DM1.DisplayDescrip('prvTGE','TGE110','DOCDES','DOCID='+quotedstr(dblcTDoc.text),'DOCDES');
   dbeNoDoc.text:=DM1.cdsEgrCaja.FieldByname('ECNODOC').AsString;
   dblcdCnp.text:=DM1.cdsEgrCaja.FieldByname('CPTOID').AsString;
   dbeGlosa.Text:=DM1.cdsEgrCaja.FieldByname('ECGLOSA').AsString;



   dblcClase.Text   := DM1.cdsPagoCxP.FieldByName('CLAUXID').AsString;
   if length(dblcClase.Text)<>0 then
   Begin
    xWhere:='CLAUXID='+''''+dblcClase.Text+'''';
    edtClase.Text:=DM1.DisplayDescrip('prvTGE','TGE102','CLAUXDES',xWhere,'CLAUXDES');
   End;

   dblcdAux.Text    := DM1.cdsPagoCxP.FieldByName('Prov').AsString;
   edtAuxRUC.Text   := DM1.cdsPagoCxP.FieldByName('ProvRuc').AsString;
   dbeGiradoA.Text  := DM1.cdsPagoCxP.FieldByName('ProvGirA').AsString;
   dblcCCBco.Text   := DM1.FieldNoNulo(DM1.cdsPagoCxP.fieldByName('CCBCOID')) ;
   dblcBanco.text   := DM1.FieldNoNulo(DM1.cdsPagoCxP.fieldByName('BANCOID')) ;
   edtCuenta.text   := DM1.FieldNoNulo(DM1.cdsPagoCxP.fieldByName('CUENTAID')) ;
   dblcFormPago.Text:= DM1.FieldNoNulo(DM1.cdsPagoCxP.fieldByName('FPAGOID')) ;
   dbeNoChq.text    := DM1.FieldNoNulo(DM1.cdsPagoCxP.fieldByName('OPNOCHQ')) ;
   dblcTMon.Text    := DM1.FieldNoNulo(DM1.cdsPagoCxP.fieldByName('TMONID')) ;
   dbeTCambio.text  := DM1.FieldNoNulo(DM1.cdsPagoCxP.fieldByName('OPTCAMB')) ;
   RecuperaDescrip ;
   pnlCabecera.Enabled:= False;

   dblcClase.Enabled   :=False;
   dblcdAux.Enabled := False ;
   if DM1.cdsPagoCxP.FieldByName('OPESTADO').Asstring='I' then
   begin
      // Activar modo de Editado
      DM1.cdsPagoCxP.Edit;

      // Estado de componentes
      pnlCabecera.Enabled :=False;   // Desactivar Panel1
      pnlCabecera2.Enabled:=True;    // Activar Panel2
      dblcClase.Enabled   :=False;
      dblcdAux.Enabled    :=False;
      edtAuxRUC.Enabled   :=False;
      z2bbtnOk.Enabled    :=True;
      z2bbtnCancel.Enabled:=True;

      wbSumat     := True;
      wbNuevo     := True;
      wbImprime   := True;
      wbSube      := True;
      wbGraba     := True;
      wbConsultar := False ;
      wbCancelado := True ;
      wbCancel2   := True;
      wbAnula     := True;
      lblEstado.Caption    :='Activo             ';
   end;

   // Estado Pendiente / Cancelado  / Anulado
   if DM1.cdsPagoCxP.FieldByName('OPESTADO').AsString[1] in ['P','A'] then
   begin
      pnlCabecera.Enabled  := False;    // Desactivar Panel1
      pnlCabecera2.Enabled := False;    // Desactivar Panel2
      pnlPendientes.Enabled:= False;
      pnlDocCanje.Enabled  := True;
      dbgDocCanje.ReadOnly := True;     // Grid en Solo Lectura
      pnlBotones.Enabled   := True;     // Activar Panel de Botones
      z2bbtnOk.Enabled     := False;
      z2bbtnCancel.Enabled := False;

      wbSumat     := False;
      wbNuevo     := True;
      wbImprime   := True;
      wbSube      := False;
      wbGraba     := False;
      wbConsultar := False;
      wbCancelado := False;
      wbCancel2   := False;
      wbAnula     := False;

      ActPnlBotones;
      if DM1.cdsPagoCxP.FieldByName('OPESTADO').AsString='P' then
         lblEstado.Caption     :='Pendiente          ';
      if DM1.cdsPagoCxP.FieldByName('OPESTADO').AsString='C' then
         lblEstado.Caption     :='Cancelado          ';
      if DM1.cdsPagoCxP.FieldByName('OPESTADO').AsString='A' then
         lblEstado.Caption     :='Anulado            ';
   end;

   if DM1.cdsPagoCxP.FieldByName('OPESTADO').AsString[1] in ['C'] then
   begin
      pnlCabecera.Enabled  := False;    // Desactivar Panel1
      pnlCabecera2.Enabled := False;    // Desactivar Panel2
      pnlPendientes.Enabled:= False;
      pnlDocCanje.Enabled  := True;
      dbgDocCanje.ReadOnly := True;     // Grid en Solo Lectura
      pnlBotones.Enabled   := True;     // Activar Panel de Botones
      z2bbtnOk.Enabled     := False;
      z2bbtnCancel.Enabled := False;

      wbSumat     := False;
      wbNuevo     := True;
      wbImprime   := True;
      wbSube      := False;
      wbGraba     := False;
      wbConsultar := True ;
      wbCancelado := False;
      wbCancel2   := False;
      wbAnula     := False;

      ActPnlBotones;
      if DM1.cdsPagoCxP.FieldByName('OPESTADO').Asstring='P' then
         lblEstado.Caption     :='Pendiente          ' ;
      if DM1.cdsPagoCxP.FieldByName('OPESTADO').Asstring='C' then
         lblEstado.Caption     :='Cancelado          ' ;
      if DM1.cdsPagoCxP.FieldByName('OPESTADO').Asstring='A' then
         lblEstado.Caption     :='Anulado            ' ;
   end;
   z2bbtnSumatClick(nil);

   (z2bbtnOKCab).Enabled:=false;
   wmodifica:=False;
   z2bbtnNuevo.Visible := False ;
   z2bbtnCancel.Visible := False ;
   dblcdAux.Enabled   := False  ;
end;

procedure TFPagosCaja.FormCreate(Sender: TObject);
begin
 // LLave para búsqueda en archivo de Pagos
   DM1.cdsPagoCxP.IndexFieldNames     := 'CiaId;OPago';
//   DM1.cdsMovCxP.IndexFieldNames      := 'CiaId;TdiarId;CPAnoMes;CPNoReg';
   DM1.cdsCanjeCxP.IndexFieldNames    := 'CiaId;TCanjeID;CCPCanje;TDiarID;CCPAnoMM;CPNoReg';

   setLength(A4digitos,1) ;
   A4digitos[0] := dbeTcambio ;
   cf1 := TControlFoco.Create ;
end;

procedure TFPagosCaja.FormShow(Sender: TObject);
begin
   if Trim(dblcBanco.Text) <> '' then
   begin
      if DM1.cdsPagoCxP.FieldByName('OPESTADO').Asstring='I' then
      begin     //Incompleto
         pnlCabecera2.SetFocus ;
         perform(CM_DialogKey,VK_TAB,0);
         //
      end;

      // Estado Pendiente / Cancelado  / Anulado
      if DM1.cdsPagoCxP.FieldByName('OPESTADO').AsString[1] in ['P','C','A'] then
      begin
         pnlBotones.SetFocus ;
         perform(CM_DialogKey,VK_TAB,0);
      end;

   end
   else begin
      RecuperarCiaUnica(dblcCia,edtCia);
      if dblccia.text <> '' then
         perform(CM_DialogKey,VK_TAB,0);

   end ;
   cf1.PonerExits ;

end;

procedure TFPagosCaja.AdicIniciaDatos;
begin
   RecuperarCiaUnica(dblcCia,edtCia);
   if dblcCia.Text <> '' then
      perform(CM_DialogKey,VK_TAB,0);
   //0105
   // vhn 23/01/2001
   xSQL:='Select * from CXP304 '
        +'Where CIAID='''' and CCPCANJE='''' ';
   DM1.cdsCanjeCxP.Close;
   DM1.cdsCanjeCxP.DataRequest( xSQL );
   DM1.cdsCanjeCxP.Open;
end;

procedure TFPagosCaja.ConfiguraAccesos;
begin
    if DM1.wAdmin = 'G' then
       Proc_Admin
    else
    begin
       if DM1.wModo = 'C' then
          Proc_Consul
       else
          DM1.AccesosUsuarios( DM1.wModulo,DM1.wUsuario,'2',Screen.ActiveForm.Name ) ;
    end ;

end;

procedure TFPagosCaja.Libera_Admin;
begin
   Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFPagosCaja.Libera_Consul;
begin

end;

procedure TFPagosCaja.Proc_Admin;
var
   Contador : Integer ;
begin
    pnlCabecera.Enabled := False ;
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

procedure TFPagosCaja.Proc_Consul;
begin
    pnlCabecera.Enabled := False ;
    pnlCabecera2.Enabled := False ;
    pnlDeTalle.Enabled := True ;
    pnlBotones.Enabled := False ;
end;

procedure TFPagosCaja.LibConfigAccesos;
begin
   if DM1.wAdmin = 'G' then
      Libera_Admin
   else begin
      if DM1.wModo = 'C' then
         Libera_Consul ;
   end;
end;

procedure TFPagosCaja.Z2bbtnAceptarClick(Sender: TObject);
var
   xDatAux : StructSaldosAux ;
   xWhere  : String ;
   Aux     : string ;
   xSQL : string;
   xLoc,xExt : double;
   xLoc1,xExt1 : String;
begin
   if MessageDlg('¿ Aceptar ?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin

      xSQL:='Select * from CAJA302 '
           +'Where CIAID='''   +dblcCia.Text    +''' and '
           +      'ECANOMM=''' +edtPeriodo.Text +''' and '
           +      'TDIARID=''' +dblcTDiario.Text+''' and '
           +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
      DM1.cdsEgrCaja.Close;
      DM1.cdsEgrCaja.DataRequest( xSQL );
      DM1.cdsEgrCaja.Open;

      DM1.cdsEgrCaja.Insert ;

      DM1.cdsEgrCaja.FieldByName('CIAID').Asstring      :=dblcCia.text;
      DM1.cdsEgrCaja.FieldByName('TDIARID').Asstring    :=dblcTDiario.Text;
      DM1.cdsEgrCaja.FieldByName('ECANOMM').Asstring    :=edtPeriodo.Text;
      DM1.cdsEgrCaja.FieldByName('ECNOCOMP').Asstring   :=dbeNoComp.Text;
      DM1.cdsEgrCaja.FieldByName('ECOPAGO').Asstring    :=dbeOPago.Text;
      DM1.cdsEgrCaja.FieldByName('CLAUXID').Asstring    :=dblcClase.Text;
      DM1.cdsEgrCaja.FieldByName('PROV').Asstring       :=dblcdAux.Text;
      DM1.cdsEgrCaja.FieldByName('PROVRUC').Asstring    :=edtAuxRuc.Text;
      DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime    :=dbdtpFPago.Date;
      DM1.cdsEgrCaja.FieldByName('ECFPAGOP').AsDateTime   :=dbdtpFPago.Date;
      DM1.cdsEgrCaja.FieldByName('FPAGOID').Asstring    :=dblcFormPago.text;
      DM1.cdsEgrCaja.FieldByName('EQUIID').AsString  :=DM1.EquivFPago( dblcFormPago.text, dblcBanco.text) ;
      DM1.cdsEgrCaja.FieldByName('DOCID').Asstring      :=dblcTDoc.Text;
      DM1.cdsEgrCaja.FieldByName('ECNODOC').Asstring    :=dbeNoDoc.Text;
      DM1.cdsEgrCaja.FieldByName('TMONID').Asstring     :=dblcTMon.Text;
      DM1.cdsEgrCaja.FieldByName('ECTCAMB').Asfloat    :=strtofloat(dbeTCambio.Text);
      DM1.cdsEgrCaja.FieldByName('ECMTOORI').asfloat   :=  strtofloat(stringReplace(dbeImporte.Text,',','',[rfReplaceAll]));
      if DM1.cdsEgrCaja.FieldByName('TMONID').Asstring=DM1.wTMonLoc then
      begin
         DM1.cdsEgrCaja.FieldByName('ECMTOLOC').Asfloat:=strtofloat(stringReplace(dbeImporte.Text,',','',[rfReplaceAll]));
         DM1.cdsEgrCaja.FieldByName('ECMTOEXT').Asfloat:=strtofloat(stringReplace(dbeImporte.Text,',','',[rfReplaceAll]))/strtofloat(dbeTCambio.Text);
      end
      else
      begin
         DM1.cdsEgrCaja.FieldByName('ECMTOLOC').Asfloat:=strtofloat(stringReplace(dbeImporte.Text,',','',[rfReplaceAll]))*strtofloat(dbeTCambio.Text);
         DM1.cdsEgrCaja.FieldByName('ECMTOEXT').Asfloat:=strtofloat(stringReplace(dbeImporte.Text,',','',[rfReplaceAll]));
      end;
      DM1.cdsEgrCaja.FieldByName('BANCOID').Asstring :=  dblcBanco.text;
      DM1.cdsEgrCaja.FieldByName('CCBCOID').Asstring :=  dblcCCBco.Text;
      DM1.cdsEgrCaja.FieldByName('ECNOCHQ').Asstring :=  dbeNoChq.Text;
      DM1.cdsEgrCaja.FieldByName('ECGIRA').Asstring  :=  dbeGiradoA.Text;
      DM1.cdsEgrCaja.FieldByName('CPTOID').Asstring  :=  dblcdCnp.Text;
      DM1.cdsEgrCaja.FieldByName('CUENTAID').Asstring:=  edtCuenta.text;
      DM1.cdsEgrCaja.FieldByName('ECGLOSA').Asstring :=  dbeGlosa.Text;
      //DM1.cdsEgrCaja.FieldByName('ECLOTE').Value  :=  dbeLote.Text;
      DM1.cdsEgrCaja.FieldByName('ECESTADO').Asstring:= 'I';
      xWhere:='FECHA=' +DM1.wRepFuncDate + '''' + formatdatetime(DM1.wFormatFecha, dbdtpFPago.Date )+''')' ;
      aux   :=DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
      DM1.cdsEgrCaja.FieldByName('ECANO').Asstring  := DM1.cdsqry.FieldByName('FecAno').Asstring;
      DM1.cdsEgrCaja.FieldByName('ECMM').Asstring   := DM1.cdsqry.FieldByName('FecMes').Asstring;
      DM1.cdsEgrCaja.FieldByName('ECDD').Asstring   := DM1.cdsqry.FieldByName('FecDia').Asstring;
      DM1.cdsEgrCaja.FieldByName('ECSS').Asstring   := DM1.cdsqry.FieldByName('FecSS').Asstring;
      DM1.cdsEgrCaja.FieldByName('ECSEM').Asstring  := DM1.cdsqry.FieldByName('FecSem').Asstring;
      DM1.cdsEgrCaja.FieldByName('ECTRI').Asstring  := DM1.cdsqry.FieldByName('FecTrim').Asstring;
      DM1.cdsEgrCaja.FieldByName('ECAASS').Asstring := DM1.cdsqry.FieldByName('FecAASS').Asstring;
      DM1.cdsEgrCaja.FieldByName('ECAASem').Asstring:= DM1.cdsqry.FieldByName('FecAASem').Asstring;
      DM1.cdsEgrCaja.FieldByName('ECAATri').Asstring:= DM1.cdsqry.FieldByName('FecAATri').Asstring;
      DM1.cdsEgrCaja.FieldByName('EC_PROCE').Asstring:='2';
      DM1.cdsEgrCaja.FieldByName('EC_IE').Asstring   :='E';

      ActualizaSaldos;

      DM1.cdsEgrCaja.FieldByName('ECEstado').AsString :='C';
      DM1.cdsEgrCaja.Post ;
      DM1.cdsEgrCaja.ApplyUpdates(0);

      DM1.cdsPagoCxP.Edit;
      DM1.cdsPagoCxP.FieldByName('ECNOCOMP').AsString :=dbeNoComp.Text;
      DM1.cdsPagoCxP.FieldByName('OPESTADO').AsString :='C';
      DM1.cdsPagoCxP.Post ;
      DM1.cdsPagoCxP.ApplyUpdates(0);

      xLoc1 := DM1.cdsCanjeCxP.FieldByName('CPSalLoc').AsString;
      xExt1 := DM1.cdsCanjeCxP.FieldByName('CPSalExt').AsString;
      with xDatAux , DM1.cdsEgrcaja do
      begin
        CIAID     :=  dblcCia.text;
        CLAUXID   :=  dblcClase.text;
        AUXID     :=  dblcdAux.Text;
        MONTOMN   :=  fieldbyName('ECMTOLOC').AsString ;
        MONTOME   :=  fieldbyName('ECMTOEXT').AsString ;
        xLoc :=  StrToFloat(xLoc1) -  StrToFloat(MONTOMN);
        xExt := StrToFloat(xExt1) - StrToFloat(MONTOME);
        MTOSLOC   :=  FloatToStrF(xLoc,ffFixed,15,2) ;
        MTOSEXT   :=  FloatToStrF(xExt,ffFixed,15,2) ;
        FECHA     :=  dbdtpFPago.Date;
        DM1.ActSaldosAux ( xDatAux ) ;
      end ;
      z2bbtnCont.Enabled    := True;
      z2bbtnGraba.Enabled := False;      
      z2bbtnAceptar.Enabled := False;
      z2bbtnSube.Enabled    := False;
      z2bbtnCancel2.Enabled := False;

      pnlCabecera3.Enabled:=False;
      pnlDetalle.Enabled  :=False;

      lblEstado.Caption    :='Cancelado          ';
      ActualizaSaldosCaja ;
      BitBtn1.Enabled:=True;

      ShowMessage('¡Grabación OK!') ;
   end ;
{
var
   Datos: TspdDatPago ;
   Monto : String ;
begin

     if dblcTMon.text = DM1.wTMonLoc then
     begin
        Monto := stringreplace(dbgDocCanje.columnbyName('CCPMOLOC').FooterValue,',','',[ rfReplaceAll ]) ;
     end
     else
     begin
        Monto := stringreplace(dbgDocCanje.columnbyName('CCPMOEXT').FooterValue ,',','',[ rfReplaceAll ]) ;
     end ;

     FPagoProvX := TFPagoProvX.Create (self) ;
     with Datos do
     begin
       TMONID       := dblcTMon.Text;
       TMONDES      := edtTMOn.text;
       FECHATC      := DateToStr( dbdtpFpago.Date );
       ECTCAMB      := dbeTCambio.Text;
       ECMTOORI     := Monto;
       ECLOTE       := '';
       CPTOID       := '';
       ECGLOSA      := '';
       CIAID        := dblcCia.Text;
       CIADES       := edtCia.text;
       ECANOMM      := strAno( dbdtpFpago.date ) + strMes( dbdtpFPago.date );
       ECNOCOMP     := '';
       TDIARID      := DM1.cdsPagoCxP.FieldByName('CCBCOVOUCH').AsString;
       TDIARDES     := '';
       PROV         := dblcdAux.Text;
       PROVRUC      := edtAuxRUC.Text;
       CLAUXID      := DM1.wClaseAuxClie;
       ECOPAGO      := dbeOPago.Text;
       CUENTAID     := edtCuenta.Text;
     end ;
     try
       FPagoProvX.RecibirDatos( Datos ) ;
       FPagoProvX.ShowModal ;
       if FPagoProvX.FinalizadoOK then
        begin
          ActualizaFiltro ;
          lblEstado.Caption     :='Cancelado          ' ;
          Z2bbtnAceptar.Enabled  := False ;
          Z2bbtnGraba.Enabled := False ;
          Z2bbtnAnula.Enabled := False ;
          Z2bbtnSube.Enabled  := False ;
        end
       else
          ShowMessage('No se puede Cancelar') ;
     finally
       FPagoProvX.free ;
     end ;
}
end;

procedure TFPagosCaja.dblcdAuxEnter(Sender: TObject);
begin
   if dblcClase.Text='' then
      dblcdAux.SetFocus;
end;

procedure TFPagosCaja.BorraGrid;
begin
    with DM1.cdsCanjeCxP do
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

procedure TFPagosCaja.FormDestroy(Sender: TObject);
begin
   cf1.Free ;
end;

procedure TFPagosCaja.ActualizaFiltro;
begin

    if z2bbtnNuevo.Visible then
    begin
       if not xGraboNuevo then
          cdsFiltro.Append ;
       DM1.ActualizaCDS(DM1.cdsPagoCxP,cdsFiltro) ;
    end
    else
    begin
       DM1.ActualizaCDS(DM1.cdsPagoCxP,cdsFiltro) ;
    end ;
    xGraboNuevo := True ;

end;

procedure TFPagosCaja.AsignaCDSFiltro(cds: TwwClientDataset);
begin
    cdsFiltro := cds ;
end;

procedure TFPagosCaja.dbeTCExit(Sender: TObject);
begin
   if DM1.cdsCanjeCxP.fieldbyName('TMONID').asString = DM1.wtMonLoc then
   begin
      DM1.cdsCanjeCxP.fieldbyName('CCPMOEXT').asFloat:=DM1.FRound( DM1.cdsCanjeCxP.fieldbyName('CCPMOLOC').asFloat / DM1.cdsCanjeCxP.fieldbyName('CCPTCCJE').asFloat, 15, 2);
      DM1.cdsCanjeCxP.fieldbyName('CCPMOEXT').asFloat:=DM1.FRound( DM1.cdsCanjeCxP.fieldbyName('CCPMOLOC').asFloat / DM1.cdsCanjeCxP.fieldbyName('CCPTCCJE').asFloat, 15, 2);
   end
   else
   begin
      DM1.cdsCanjeCxP.fieldbyName('CCPMOLOC').asFloat:=DM1.FRound( DM1.cdsCanjeCxP.fieldbyName('CCPMOEXT').asFloat * DM1.cdsCanjeCxP.fieldbyName('CCPTCCJE').asFloat, 15, 2) ;
      DM1.cdsCanjeCxP.fieldbyName('CCPMOLOC').asFloat:=DM1.FRound( DM1.cdsCanjeCxP.fieldbyName('CCPMOEXT').asFloat * DM1.cdsCanjeCxP.fieldbyName('CCPTCCJE').asFloat, 15, 2) ;
   end ;
end;

procedure TFPagosCaja.dbeMPLExit(Sender: TObject);
begin
   DM1.cdsCanjeCxP.fieldByName('CCPMOEXT').asFloat := DM1.FRound( DM1.cdsCanjeCxP.fieldbyName('CCPMOLOC').asFloat/DM1.cdsCanjeCxP.fieldbyName('CCPTCCJE').asFloat,15,2);
end;

procedure TFPagosCaja.dbeMPEExit(Sender: TObject);
begin
   DM1.cdsCanjeCxP.fieldByName('CCPMOLOC').asFloat := DM1.FRound( DM1.cdsCanjeCxP.fieldByName('CCPMOEXT').asFloat * DM1.cdsCanjeCxP.fieldByName('CCPTCCje').asFloat,15,2);
end;

procedure TFPagosCaja.dblcClaseExit(Sender: TObject);
var
   xSQLx : string ;
begin

   edtClase.text:= DM1.DisplayDescripLocal(DM1.cdsClaseAux,'CLAUXID',dblcClase.Text,'CLAUXDES') ;

   if edtClase.Text='' then begin
      dblcdAux.Text  := '' ;
      edtAuxRUC.Text := '' ;
      dbeGiradoA.Text:= '' ;
      ShowMessage('Error : Clase de Auxiliar');
      dblcClase.SetFocus;
      Exit;
   end;

   xSQLx:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+'''';
   DM1.cdsAux.Close;
   DM1.cdsAux.DataRequest( xSQLx ) ;
   DM1.cdsAux.Open;
end;

procedure TFPagosCaja.BitBtn1Click(Sender: TObject);
begin
   if DM1.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' THEN
	 begin
   		RecCptosDifC ;
		  Contabiliza;

      ActualizaCNT311( DM1.cdsEgrcaja.FieldByName('CIAID').AsString,
                       DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
                       DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                       DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString );

      if SOLConta(DM1.cdsEgrCaja.FieldByName('CIAID').AsString,
                  DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
                  DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                  DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                  DM1.SRV_D, 'PCNA', DM1.wModulo, DM1.cdsCNT311, DM1.cdsNivel,
                  DM1.cdsResultSet, DM1.DCOM1, Self ) then
         ImprimeVoucher( 'CNT311', DM1.cdsEgrCaja.FieldByName('CIAID').AsString, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
 	 end;

   if DM1.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' THEN
	 begin
      ImprimeVoucher( 'CNT301', DM1.cdsEgrCaja.FieldByName('CIAID').AsString, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
   end;

end;



procedure TFPagosCaja.ActualizaSaldos;
{ mucho ojo :
  wmc fijate como recuperar los datos del cdsMovCxP
}
var
   xSQL : String ;
   xWhere : String ;
begin
   DM1.cdsMovCxP.Filtered:=False;

   DM1.cdsMovCxP.active := False ;
   xWhere:=' CIAID||CPANOMES||TDIARID||CPNOREG IN '
          +'       ( SELECT CIAID||CCPANOMM||TDIARID||CPNOREG '
          +'         FROM CXP304                              '
          +'         WHERE CIAID = '''+ dblcCia.text+ '''      '
          +'           AND TCANJEID = ''OP''                  '
          +'           AND CCPCANJE = '''+ dbeOPAGO.Text + ''' ) ';

   DM1.cdsMovCxP.Datarequest( 'SELECT * FROM CXP301 WHERE ' + xWhere ) ;
   DM1.cdsMovCxP.Active := True ;

   DM1.cdsCanjeCxP.DisableControls;
   DM1.cdsCanjeCxP.First;
   while not DM1.cdsCanjeCxP.Eof do
   begin
      if DM1.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                             VarArrayOf([DM1.cdsCanjeCxP.FieldByName('CiaId').AsString,
                                         DM1.cdsCanjeCxP.FieldByName('TDiarID').AsString,
                                         DM1.cdsCanjeCxP.FieldByName('CCPAnoMM').AsString,
                                         DM1.cdsCanjeCxP.FieldByName('CPNoReg').AsString]),
                             []) then
      begin
         DM1.cdsMovCxP.edit;
         If DM1.cdsMovCxP.FieldByName('TMonID').Asstring=DM1.wTMonLoc then
         begin
            DM1.cdsMovCxP.FieldByName('CPPagLoc').Asfloat:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat+DM1.cdsCanjeCxP.FieldByName('CCPMoLoc').AsFloat,15,2);
            DM1.cdsMovCxP.FieldByName('CPPagExt').Asfloat:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPPagLoc').AsFloat/DM1.cdsCanjeCxP.FieldByName('CCPTCCje').AsFloat,15,2);
            If DM1.cdsMovCxP.FieldByName('CPSalLoc').Asfloat<=0 then
               DM1.cdsMovCxP.FieldByName('CPEstado').Asstring:='C';
         end
         else
         begin
            DM1.cdsMovCxP.FieldByName('CPPagExt').Asfloat:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPPagExt').AsFloat+DM1.cdsCanjeCxP.FieldByName('CCPMoExt').AsFloat,15,2);
            DM1.cdsMovCxP.FieldByName('CPPagLoc').Asfloat:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPPagExt').AsFloat*DM1.cdsCanjeCxP.FieldByName('CCPTCCje').AsFloat,15,2);
            If DM1.cdsMovCxP.FieldByName('CPSalExt').Asfloat<=0 then
               DM1.cdsMovCxP.FieldByName('CPEstado').Asstring:='C';
         end;
         DM1.cdsMovCxP.FieldByName('CPTCamPa').AsFloat:=DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPTCCje').AsFloat,15,2);
         DM1.cdsMovCxP.post;
      end
      else
      begin
         ShowMessage('Error en la Actualización de Saldos WMC') ;
      end ;
      DM1.cdsCanjeCxP.Next;
   end;
   DM1.cdsMovCxP.Filtered:=True;
   DM1.cdsMovCxP.First;
   DM1.cdsCanjeCxP.EnableControls;

   // Actualizacion..

   xSQL:='Select * from CXP305 '
        +'Where CIAID='''   +dblcCia.Text  +''' and '
        +      'CCPCANJE='''+dbeOPAGO.Text +''' ';
   DM1.cdsDetCanjeCxP.Close;
   DM1.cdsDetCanjeCxP.DataRequest( xSQL );
   DM1.cdsDetCanjeCxP.Open;

   DM1.cdsDetCanjeCxP.First;
   While (not DM1.cdsDetCanjeCxP.Eof) and (DM1.cdsDetCanjeCxP.RecordCount>0) do
      DM1.cdsDetCanjeCxP.Delete;

   DM1.cdsCanjeCxP.DisableControls;
   DM1.cdsCanjeCxP.First;

   While not DM1.cdsCanjeCxP.Eof do
   begin
      DM1.cdsDetCanjeCxP.Insert;
      DM1.cdsDetCanjeCxP.FieldByName('CiaID').Asstring   := DM1.cdsCanjeCxP.FieldByName('CiaID').Asstring;
      DM1.cdsDetCanjeCxP.FieldByName('Prov').Asstring     := DM1.cdsCanjeCxP.FieldByName('Prov').Asstring;
      DM1.cdsDetCanjeCxP.FieldByName('ProvRuc').Asstring  := DM1.cdsCanjeCxP.FieldByName('ProvRuc').Asstring;
      DM1.cdsDetCanjeCxP.FieldByName('DocID').Asstring    := DM1.cdsCanjeCxP.FieldByName('DocID').Asstring;
      DM1.cdsDetCanjeCxP.FieldByName('CPserie').Asstring  := DM1.cdsCanjeCxP.FieldByName('CPSerie').Asstring;
      DM1.cdsDetCanjeCxP.FieldByName('CPNoDoc').Asstring  := DM1.cdsCanjeCxP.FieldByName('CPNoDoc').Asstring;
      DM1.cdsDetCanjeCxP.FieldByName('CPNoReg').Asstring  := DM1.cdsCanjeCxP.FieldByName('CPNoReg').Asstring;
      DM1.cdsDetCanjeCxP.FieldByName('TCanjeID').Asstring := DM1.cdsCanjeCxP.FieldByName('TCanjeID').Asstring;
      DM1.cdsDetCanjeCxP.FieldByName('CCPCanje').Asstring := DM1.cdsCanjeCxP.FieldByName('CCPCanje').Asstring;
      DM1.cdsDetCanjeCxP.FieldByName('CCPFCje').AsDateTime := DM1.cdsCanjeCxP.FieldByName('CCPFCje').AsDateTime;
      DM1.cdsDetCanjeCxP.FieldByName('DocID2').Asstring   := '05';  // Orden de Pago
      DM1.cdsDetCanjeCxP.FieldByName('CPSerie2').Asstring := '000';
      DM1.cdsDetCanjeCxP.FieldByName('CPNoDoc2').Asstring := dbeOPAGO.text ;
      DM1.cdsDetCanjeCxP.FieldByName('TMonID').Asstring   := DM1.cdsCanjeCxP.FieldByName('TMonID').Asstring;

      If DM1.cdsCanjeCxP.FieldByName('TMonID').Asstring=DM1.wTMonLoc then
      begin
         DM1.cdsDetCanjeCxP.FieldByName('DCDMoLoc').Asfloat := DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPMoLoc').AsFloat,15,2);
         DM1.cdsDetCanjeCxP.FieldByName('DCDMoExt').Asfloat := DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPMoLoc').AsFloat/DM1.cdsCanjeCxP.FieldByName('CCPTCDoc').AsFloat,15,2);
         end
      else
      begin
         DM1.cdsDetCanjeCxP.FieldByName('DCDMoExt').Asfloat := DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPMoExt').AsFloat,15,2);
         DM1.cdsDetCanjeCxP.FieldByName('DCDMoLoc').Asfloat := DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPMoExt').AsFloat*DM1.cdsCanjeCxP.FieldByName('CCPTCDoc').AsFloat,15,2);
      end;

      DM1.cdsDetCanjeCxP.FieldByName('DCDUser').Asstring  := DM1.cdsCanjeCxP.FieldByName('CCPUser').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDFReg').AsDateTime  := DM1.cdsCanjeCxP.FieldByName('CCPFReg').AsDateTime;
      DM1.cdsDetCanjeCxP.FieldByName('DCDHReg').AsDateTime  := DM1.cdsCanjeCxP.FieldByName('CCPHReg').AsDateTime;
      DM1.cdsDetCanjeCxP.FieldByName('DCDAAAA').Asstring  := DM1.cdsCanjeCxP.FieldByName('CCPAnoC').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDMM').Asstring    := DM1.cdsCanjeCxP.FieldByName('CCPMM').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDDD').Asstring    := DM1.cdsCanjeCxP.FieldByName('CCPDD').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDTri').Asstring   := DM1.cdsCanjeCxP.FieldByName('CCPTri').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDSem').Asstring   := DM1.cdsCanjeCxP.FieldByName('CCPSem').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDSS').Asstring    := DM1.cdsCanjeCxP.FieldByName('CCPSS').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDAnoMM').Asstring := DM1.cdsCanjeCxP.FieldByName('CCPAnoMM').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDAATri').Asstring := DM1.cdsCanjeCxP.FieldByName('CCPAATri').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDAASem').Asstring := DM1.cdsCanjeCxP.FieldByName('CCPAASem').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDAASS').Asstring  := DM1.cdsCanjeCxP.FieldByName('CCPAASS').AsString;
      DM1.cdsCanjeCxP.Next;
   end;

   DM1.cdsDetCanjeCxP.First;
   DM1.cdsCanjeCxP.First;
   DM1.cdsCanjeCxP.EnableControls;

   DM1.cdsDetCanjeCxP.ApplyUpdates(0);
   DM1.cdsMovCxP.ApplyUpdates(0);
end;

procedure TFPagosCaja.ActualizaSaldosCaja;
begin
    if trim( dblcCCBco.text ) <> '' then
    begin
       DM1.ActSdoTlfn( dblcCia.Text,dblcBanco.Text, dblcCCBco.Text,
                      DM1.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                      dbdtpFPago.date ) ;
       DM1.ActSdoMen( dblcBanco.Text, dblcCCBco.Text,
                      DM1.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                      dbdtpFPago.date ) ;
    end ;
end;


procedure TFPagosCaja.dblcTDiarioExit(Sender: TObject);
var
   xWhere ,
   Tmp : String ;
begin
   xWhere:='TDIARID='''+dblcTDiario.text+'''';
   edtTDiario.Text:=DM1.DisplayDescrip('prvTGE','TGE104','TDIARDES', xWhere, 'TDIARDES' );
   if length(edtTDiario.Text)=0 then
   begin
      dblcTDiario.setfocus;
      Showmessage('Tipo de Diario Errado');
      Exit;
   End;

   if edtTDiario.Text<>'' then
   begin
      xWhere:='CIAID='''  +dblcCia.Text+''' AND ECANOMM='''+edtPeriodo.text+''' AND '
             +'TDIARID='''+dblcTDiario.Text+'''';
      dbeNoComp.text:=DM1.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      dbeNoComp.text:=DM1.StrZero( dbeNoComp.text,10 );
   end;

end;

procedure TFPagosCaja.dblcTDocExit(Sender: TObject);
begin
   edtTDoc.text:=DM1.DisplayDescrip('prvTGE','TGE110','DOCDES','DOCID='+quotedstr(dblcTDoc.text),'DOCDES');
   if length(edtTDoc.Text)=0 then
   begin
      dblcTDoc.setfocus;
      Showmessage('Tipo de Documento Errado');
      Exit;
   End;

end;

procedure TFPagosCaja.Contabiliza;
var
   xRegAct : TBookMark;
   xSQL    : String;
begin
    // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera
    // vhn 23/01/2001
    xsql:='DELETE FROM CAJA304 '
         +'WHERE CIAID='   +quotedstr(DM1.cdsEgrcaja.FieldByName('CIAID').AsString)   +' AND '
         +      'ECANOMM=' +quotedstr(DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString) +' AND '
         +      'TDIARID=' +quotedstr(DM1.cdsEgrCaja.FieldByName('TDIARID').AsString) +' AND '
         +      'ECNOCOMP='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
    try
       DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
    except
    end;

    xSQL:='Select * from CAJA304 Where CIAID='''' and '
         +  'ECANOMM='''' and TDIARID='''' and ECNOCOMP='''' ';
    DM1.cdsCNTCaja.Close;
    DM1.cdsCNTCaja.DataRequest( xSQL );
    DM1.cdsCNTCaja.Open;

    xNReg:=0;

    DM1.cdsCntCaja.Insert;
    Contab_EgrCaja;

   // GENERA LOS REGISTROS DE "DEBE" Y LOS REGISTROS POR DIF. DE CAMBIO desde Docs Canje
    DM1.cdsCanjeCxP.DisableControls;
    xRegAct := DM1.cdsCanjeCxP.GetBookmark;
    DM1.cdsCanjeCxP.First ;
    While not DM1.cdsCanjeCxP.Eof do
    Begin
       DM1.cdsCntCaja.Insert;
       Contab_CanjeCxP;         // Aqui hay solo DEBE
       Contab_DifCamCanje;
       DM1.cdsCanjeCxP.Next;
    end;
    DM1.cdsCanjeCxP.GotoBookmark(xRegAct);
    DM1.cdsCanjeCxP.FreeBookmark(xRegAct);
    DM1.cdsCanjeCxP.EnableControls;

    //Actualizamos en la tabla de Contabilidad
    DM1.cdsCntCaja.ApplyUpdates(0);
end;


procedure TFPagosCaja.Contab_DifCamCanje;
var
    xDif_Camb : real;
begin
    // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO

    if DM1.cdsCanjeCxP.FieldByName('CCPTCDOC').Asfloat<> DM1.cdsCanjeCxP.FieldByName('CCPTCCJE').Asfloat then begin

       DM1.cdsCntCaja.Insert;

       DM1.cdsCntCaja.FieldByName('CIAID').Asstring   :=  DM1.cdsEgrCaja.FieldByName('CIAID').Asstring;
       DM1.cdsCntCaja.FieldByName('TDIARID').Asstring :=  DM1.cdsEgrCaja.FieldByName('TDIARID').Asstring;
       DM1.cdsCntCaja.FieldByName('ECANOMM').Asstring :=  DM1.cdsEgrCaja.FieldByName('ECANOMM').Asstring;
       DM1.cdsCntCaja.FieldByName('ECNOCOMP').Asstring:=  DM1.cdsEgrCaja.FieldByName('ECNOCOMP').Asstring;
       DM1.cdsCntCaja.FieldByName('DOCID').Asstring   :=  DM1.cdsCanjeCxP.FieldByName('DOCID').Asstring;
       DM1.cdsCntCaja.FieldByName('DCSERIE').Asstring :=  DM1.cdsCanjeCxP.FieldByName('CPSERIE').Asstring;
       DM1.cdsCntCaja.FieldByName('DCNODOC').Asstring :=  DM1.cdsCanjeCxP.FieldByName('CPNODOC').Asstring;
       DM1.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
       DM1.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime :=  DM1.cdsCanjeCxP.FieldByName('CPFEMIS').AsDateTime;
       DM1.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime:=  DM1.cdsCanjeCxP.FieldByName('CPFVCMTO').AsDateTime;
       DM1.cdsCntCaja.FieldByName('CPTOID').Asstring  :=  DM1.cdsCanjeCxP.FieldByName('CPTOTOT').Asstring;
       DM1.cdsCntCaja.FieldByName('CUENTAID').Asstring:=  DM1.cdsCanjeCxP.FieldByName('CTATOTAL').Asstring;
       DM1.cdsCntCaja.FieldByName('CLAUXID').Asstring :=  DM1.cdsEgrCaja.FieldByName('CLAUXID').Asstring; //Aqui se toma de la cabecera
       DM1.cdsCntCaja.FieldByName('DCAUXID').Asstring :=  DM1.cdsEgrCaja.FieldByName('PROV').Asstring;    //Aqui se toma de la cabecera
       DM1.cdsCntCaja.FieldByName('DCTCAMPA').Asfloat:=  DM1.cdsCanjeCxP.FieldByName('CCPTCCJE').Asfloat;
       DM1.cdsCntCaja.FieldByName('DCTCAMPR').Asfloat:=  DM1.cdsCanjeCxP.FieldByName('CCPTCDOC').Asfloat;
       DM1.cdsCntCaja.FieldByName('DCMM').Asstring    :=  DM1.cdsCanjeCxP.FieldByName('CCPMM').Asstring;
       DM1.cdsCntCaja.FieldByName('DCDD').Asstring    :=  DM1.cdsCanjeCxP.FieldByName('CCPDD').Asstring;
       DM1.cdsCntCaja.FieldByName('DCSS').Asstring    :=  DM1.cdsCanjeCxP.FieldByName('CCPSS').Asstring;
       DM1.cdsCntCaja.FieldByName('DCSEM').Asstring   :=  DM1.cdsCanjeCxP.FieldByName('CCPSEM').Asstring;
       DM1.cdsCntCaja.FieldByName('DCTRI').Asstring   :=  DM1.cdsCanjeCxP.FieldByName('CCPTRI').Asstring;
       DM1.cdsCntCaja.FieldByName('DCAASS').Asstring  :=  DM1.cdsCanjeCxP.FieldByName('CCPAASS').Asstring;
       DM1.cdsCntCaja.FieldByName('DCAASEM').Asstring :=  DM1.cdsCanjeCxP.FieldByName('CCPAASEM').Asstring;
       DM1.cdsCntCaja.FieldByName('DCAATRI').Asstring :=  DM1.cdsCanjeCxP.FieldByName('CCPAATRI').Asstring;

       DM1.cdsCntCaja.FieldByName('DCFLACDR').Asstring:=  'S';   //Registro ya cuadrado
       DM1.cdsCntCaja.FieldByName('DCANO').Asstring   :=  DM1.cdsCanjeCxP.FieldByName('CCPANOC').Asstring;
       xNReg:=xNReg+1;
       DM1.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

       if DM1.cdsCanjeCxP.FieldByName('TMONID').Asstring=DM1.wtMonLoc then
       begin   //Provision en Mon.Local
             xDif_Camb:= abs(DM1.cdsCanjeCxP.FieldByName('CCPMOLOC').Asfloat / DM1.cdsCanjeCxP.FieldByName('CCPTCDOC').Asfloat -
                             DM1.cdsCanjeCxP.FieldByName('CCPMOLOC').Asfloat / DM1.cdsCanjeCxP.FieldByName('CCPTCCJE').Asfloat);//En Mon.Ext.
             DM1.cdsCntCaja.FieldByName('DCMTOEXT').Asfloat := xDif_Camb;
             DM1.cdsCntCaja.FieldByName('TMONID').Asstring   :=  DM1.wtMonExt;

             if DM1.cdsCanjeCxP.FieldByName('CCPTCDOC').Asfloat > DM1.cdsCanjeCxP.FieldByName('CCPTCCJE').Asfloat then
                DM1.cdsCntCaja.FieldByName('DCDH').Asstring := 'D'
             else
                DM1.cdsCntCaja.FieldByName('DCDH').Asstring := 'H';
       end
       else
       begin                                            //Provision en Mon.Ext.
             xDif_Camb:= abs(DM1.cdsCanjeCxP.FieldByName('CCPMOEXT').Asfloat * DM1.cdsCanjeCxP.FieldByName('CCPTCDOC').Asfloat -
                             DM1.cdsCanjeCxP.FieldByName('CCPMOEXT').Asfloat * DM1.cdsCanjeCxP.FieldByName('CCPTCCJE').Asfloat);//En Mon.Local
             DM1.cdsCntCaja.FieldByName('DCMTOLO').Asfloat := xDif_Camb;
             DM1.cdsCntCaja.FieldByName('TMONID').Asstring  := DM1.wtMonLoc;

             if DM1.cdsCanjeCxP.FieldByName('CCPTCDOC').Asfloat > DM1.cdsCanjeCxP.FieldByName('CCPTCCJE').Asfloat then
//             if DM1.cdsRegCxP.FieldByName('DETCDOC').Asfloat > DM1.cdsCanjeCxP.FieldByName('CCPTCCJE').Asfloat then
                DM1.cdsCntCaja.FieldByName('DCDH').Asstring := 'H'
             else
                DM1.cdsCntCaja.FieldByName('DCDH').Asstring := 'D';
       end;
       //0706
       if DM1.cdsCntCaja.FieldByName('DCDH').Asstring = 'D' then
       begin
          DM1.cdsCntCaja.FieldByName('CPTOID').Asstring  :=  wCptoPer;
          DM1.cdsCntCaja.FieldByName('CUENTAID').Asstring:=  wCtaPer;
       end
       else
       begin
          DM1.cdsCntCaja.FieldByName('CPTOID').Asstring  :=  wCptoGan;
          DM1.cdsCntCaja.FieldByName('CUENTAID').Asstring:=  wCtaGan;
       end;
    end
end;

procedure TFPagosCaja.Contab_EgrCaja;
begin
    DM1.cdsCntCaja.FieldByName('CIAID').Asstring   :=  DM1.cdsEgrcaja.FieldByName('CIAID').Asstring;
    DM1.cdsCntCaja.FieldByName('TDIARID').Asstring :=  DM1.cdsEgrCaja.FieldByName('TDIARID').Asstring;
    DM1.cdsCntCaja.FieldByName('ECANOMM').Asstring :=  DM1.cdsEgrCaja.FieldByName('ECANOMM').Asstring;
    DM1.cdsCntCaja.FieldByName('ECNOCOMP').Asstring:=  DM1.cdsEgrCaja.FieldByName('ECNOCOMP').Asstring;
    DM1.cdsCntCaja.FieldByName('DCLOTE').Asstring  :=  DM1.cdsEgrCaja.FieldByName('ECLOTE').Asstring;
    DM1.cdsCntCaja.FieldByName('DOCID').Asstring   :=  DM1.cdsEgrCaja.FieldByName('DOCID').Asstring;
    DM1.cdsCntCaja.FieldByName('DCNODOC').Asstring :=  DM1.cdsEgrCaja.FieldByName('ECNODOC').Asstring;
    DM1.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
    DM1.cdsCntCaja.FieldByName('CPTOID').Asstring  :=  DM1.cdsEgrCaja.FieldByName('CPTOID').Asstring;
    DM1.cdsCntCaja.FieldByName('CUENTAID').Asstring:=  DM1.cdsEgrCaja.FieldByName('CUENTAID').Asstring;
    DM1.cdsCntCaja.FieldByName('DCDH').Asstring    :=  'H';
    DM1.cdsCntCaja.FieldByName('DCTCAMPA').Asfloat:=  DM1.cdsEgrCaja.FieldByName('ECTCAMB').Asfloat;
    DM1.cdsCntCaja.FieldByName('TMONID').Asstring  :=  DM1.cdsEgrCaja.FieldByName('TMONID').Asstring;
    DM1.cdsCntCaja.FieldByName('DCMTOORI').Asfloat:=  DM1.cdsEgrCaja.FieldByName('ECMTOORI').Asfloat;
    DM1.cdsCntCaja.FieldByName('DCMTOLO').Asfloat :=  DM1.cdsEgrCaja.FieldByName('ECMTOLOC').Asfloat;
    DM1.cdsCntCaja.FieldByName('DCMTOEXT').Asfloat:=  DM1.cdsEgrCaja.FieldByName('ECMTOEXT').Asfloat;
    DM1.cdsCntCaja.FieldByName('DCFLACDR').Asstring:=  'S';   //Registro ya cuadrado
    DM1.cdsCntCaja.FieldByName('DCUSER').asstring  :=  DM1.wUsuario;
    DM1.cdsCntCaja.FieldByName('DCFREG').AsDateTime  :=  Date;
    if DM1.SRV_D = 'ORACLE' then
       DM1.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  Date+Time
    else
       DM1.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  Time;
    DM1.cdsCntCaja.FieldByName('DCANO').Asstring   :=  DM1.cdsEgrCaja.FieldByName('ECANO').Asstring;
    DM1.cdsCntCaja.FieldByName('DCMM').Asstring    :=  DM1.cdsEgrCaja.FieldByName('ECMM').Asstring;
    DM1.cdsCntCaja.FieldByName('DCDD').Asstring    :=  DM1.cdsEgrCaja.FieldByName('ECDD').Asstring;
    DM1.cdsCntCaja.FieldByName('DCSS').Asstring    :=  DM1.cdsEgrCaja.FieldByName('ECSS').Asstring;
    DM1.cdsCntCaja.FieldByName('DCSEM').Asstring   :=  DM1.cdsEgrCaja.FieldByName('ECSEM').Asstring;
    DM1.cdsCntCaja.FieldByName('DCTRI').Asstring   :=  DM1.cdsEgrCaja.FieldByName('ECTRI').Asstring;
    DM1.cdsCntCaja.FieldByName('DCAASS').Asstring  :=  DM1.cdsEgrCaja.FieldByName('ECAASS').Asstring;
    DM1.cdsCntCaja.FieldByName('DCAASEM').Asstring :=  DM1.cdsEgrCaja.FieldByName('ECAASEM').Asstring;
    DM1.cdsCntCaja.FieldByName('DCAATRI').Asstring :=  DM1.cdsEgrCaja.FieldByName('ECAATRI').Asstring;
    DM1.cdsCntCaja.FieldByName('DCGLOSA').AsString := DM1.cdsEgrCaja.fieldBYName('ECGLOSA').AsString ;
    DM1.cdsCntCaja.FieldByName('DCTCAMPA').AsString := dbeTCambio.Text ;
    DM1.cdsCntCaja.FieldByName('FCAB').AsString := '1' ;
    xNReg:=xNReg+1;
    DM1.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

end;

procedure TFPagosCaja.Contab_CanjeCxP;
begin
   DM1.cdsCntCaja.FieldByName('CIAID').AsString      :=  DM1.cdsEgrCaja.FieldByName('CIAID').AsString;
   DM1.cdsCntCaja.FieldByName('TDIARID').AsString    :=  DM1.cdsEgrCaja.FieldByName('TDIARID').AsString;
   DM1.cdsCntCaja.FieldByName('ECANOMM').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DM1.cdsCntCaja.FieldByName('ECNOCOMP').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   DM1.cdsCntCaja.FieldByName('DOCID').AsString      :=  DM1.cdsCanjeCxP.FieldByName('DOCID').AsString;
   DM1.cdsCntCaja.FieldByName('DCSERIE').AsString    :=  DM1.cdsCanjeCxP.FieldByName('CPSERIE').AsString;
   DM1.cdsCntCaja.FieldByName('DCNODOC').AsString    :=  DM1.cdsCanjeCxP.FieldByName('CPNODOC').AsString;
   DM1.cdsCntCaja.FieldByName('ECFCOMP').AsDateTime  :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   DM1.cdsCntCaja.FieldByName('DCFEMIS').AsDateTime  :=  DM1.cdsCanjeCxP.FieldByName('CPFEMIS').AsDateTime;
   DM1.cdsCntCaja.FieldByName('DCFVCMTO').AsDateTime :=  DM1.cdsCanjeCxP.FieldByName('CPFVCMTO').AsDateTime;
   DM1.cdsCntCaja.FieldByName('CPTOID').AsString     :=  DM1.cdsCanjeCxP.FieldByName('CPTOTOT').AsString;
   DM1.cdsCntCaja.FieldByName('CUENTAID').AsString   :=  DM1.cdsCanjeCxP.FieldByName('CTATOTAL').AsString;
   DM1.cdsCntCaja.FieldByName('CLAUXID').AsString    :=  DM1.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
   DM1.cdsCntCaja.FieldByName('DCAUXID').AsString    :=  DM1.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
   //DM1.cdsCntCajaCCOSID.Value  :=  DM1.cdsCanjeCxP.FieldByName('CCOSID.Value;
   DM1.cdsCntCaja.FieldByName('DCDH').AsString    :=  'D';
   DM1.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat :=  DM1.cdsCanjeCxP.FieldByName('CCPTCCJE').AsFloat;
   DM1.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat :=  DM1.cdsCanjeCxP.FieldByName('CCPTCDOC').AsFloat;
   DM1.cdsCntCaja.FieldByName('TMONID').AsString  :=  DM1.cdsCanjeCxP.FieldByName('TMONID').AsString;
   DM1.cdsCntCaja.FieldByName('DCMTOORI').AsFloat :=  DM1.cdsCanjeCxP.FieldByName('CCPMOORI').AsFloat;
   if DM1.cdsCanjeCxP.FieldByName('TMONID').Asstring = DM1.wtMonLoc then
    begin
     DM1.cdsCntCaja.FieldByName('DCMTOLO').Asfloat  := DM1.cdsCanjeCxP.FieldByName('CCPMOLOC').AsFloat;
     DM1.cdsCntCaja.FieldByName('DCMTOEXT').Asfloat := DM1.cdsCanjeCxP.FieldByName('CCPMOLOC').AsFloat / DM1.cdsCanjeCxP.FieldByName('CCPTCCJE').AsFloat;
    end
   else
    begin
     DM1.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DM1.cdsCanjeCxP.FieldByName('CCPMOEXT').AsFloat;
     DM1.cdsCntCaja.FieldByName('DCMTOLO').AsFloat  := DM1.cdsCanjeCxP.FieldByName('CCPMOEXT').AsFloat * DM1.cdsCanjeCxP.FieldByName('CCPTCCJE').AsFloat;
    end;

    DM1.cdsCntCaja.FieldByName('DCFLACDR').AsString :=  'S';   //Registro ya cuadrado
    DM1.cdsCntCaja.FieldByName('DCANO').AsString    :=  DM1.cdsCanjeCxP.FieldByName('CCPANOC').AsString;
    DM1.cdsCntCaja.FieldByName('DCMM').AsString     :=  DM1.cdsCanjeCxP.FieldByName('CCPMM').AsString;
    DM1.cdsCntCaja.FieldByName('DCDD').AsString     :=  DM1.cdsCanjeCxP.FieldByName('CCPDD').AsString;
    DM1.cdsCntCaja.FieldByName('DCSS').AsString     :=  DM1.cdsCanjeCxP.FieldByName('CCPSS').AsString;
    DM1.cdsCntCaja.FieldByName('DCSEM').AsString    :=  DM1.cdsCanjeCxP.FieldByName('CCPSEM').AsString;
    DM1.cdsCntCaja.FieldByName('DCTRI').AsString    :=  DM1.cdsCanjeCxP.FieldByName('CCPTRI').AsString;
    DM1.cdsCntCaja.FieldByName('DCAASS').AsString   :=  DM1.cdsCanjeCxP.FieldByName('CCPAASS').AsString;
    DM1.cdsCntCaja.FieldByName('DCAASEM').AsString  :=  DM1.cdsCanjeCxP.FieldByName('CCPAASEM').AsString;
    DM1.cdsCntCaja.FieldByName('DCAATRI').AsString  :=  DM1.cdsCanjeCxP.FieldByName('CCPAATRI').AsString;
    xNReg:=xNReg+1;
    DM1.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;
end;

procedure TFPagosCaja.RecCptosDifC;
begin

    if trim( dblcCCBco.Text ) = '' then
    begin
       if not DM1.RecuperarDatos('TGE105','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP','BANCOID=''' + dblcBANCO.Text + '''' )  then
          Raise exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio') ;
    end
    else
    begin
       if not DM1.RecuperarDatos('TGE106','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP','BANCOID=''' + dblcBANCO.Text +
                                 ''' AND CCBCOID=''' + dblcCCBCO.Text + '''' )  then
          Raise exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio') ;
    end ;
    wCptoGan  := DM1.cdsRec.FieldByName('CPTODIFG').AsString ;
    wCptoPer  := DM1.cdsRec.FieldByName('CPTODIFP').AsString ;
    wCtaGan   := DM1.cdsRec.FieldByName('CTADIFG').AsString ;
    wCtaPer   := DM1.cdsRec.FieldByName('CTADIFP').AsString ;
end;

procedure TFPagosCaja.dblcCiaExit(Sender: TObject);
var
   xWhere : string;
begin
   xWhere:='CIAID='+''''+dblcCia.Text+'''';
   edtCia.Text:=DM1.DisplayDescrip('prvTGE','TGE101','CIADES',xWhere,'CIADES');
   if Length(edtCia.Text)=0 then
   begin
      dblcCia.SetFocus;
      ShowMessage('Compañía Errada');
      Exit;
   End;
   if length(edtCia.Text)>0 then
   begin
    // determina último número de Orden de Pago incrementado en 1
       xWhere := 'CIAID='+''''+dblcCia.Text+'''';
       dbeOPago.Text := DM1.UltimoNum('prvCxP','CXP303','OPAGO',xWhere);
       dbeOPago.Text := DM1.StrZero(dbeOPago.Text,DM1.cdsPagoCxP.FieldByName('OPAGO').DisplayWidth);
   end;
end;


end.

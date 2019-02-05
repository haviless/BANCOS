unit Caja250;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Buttons, wwdbdatetimepicker, Mask, wwdbedit, wwdblook, Wwdbdlg,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBGrids, DB, wwSpeedButton,
  wwDBNavigator, ComCtrls, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe, ppPrnabl, ppCtrls, ppModule, daDatMod, ppBands,
  ppVar,CAJADM, Caja224, Variants;

type
  TFDetalleLiq = class(TForm)
    pnlCabecera: TPanel;
    lblCia: TLabel;
    lblOCobra: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    pnlCabecera2: TPanel;
    dbdtpFCobra: TwwDBDateTimePicker;
    edtTMon: TEdit;
    dbeTCambio: TwwDBEdit;
    z2bbtnCancel: TBitBtn;
    z2bbtnOK: TBitBtn;
    dblcTMon: TwwDBLookupCombo;
    dblcdClie: TwwDBLookupComboDlg;
    pnlBotones: TPanel;
    z2bbtnSumat: TBitBtn;
    z2bbtnImprime: TBitBtn;
    z2bbtnGraba: TBitBtn;
    pnlDetalle: TPanel;
    ppdbCanje: TppDBPipeline;
    pprOPago: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLine5: TppLine;
    ppLabel15: TppLabel;
    ppDBText17: TppDBText;
    z2bbtnNuevo: TBitBtn;
    z2bbtnSube: TBitBtn;
    lblEstado: TLabel;
    z2bbtnAnula: TBitBtn;
    z2bbtnCancel2: TBitBtn;
    z2bbtnCalc: TBitBtn;
    dbeDesClie: TwwDBEdit;
    edtClieRUC: TEdit;
    z2bbtnOKCab: TBitBtn;
    pplblElaboradopor: TppLabel;
    pplblAprobadoPor: TppLabel;
    Z2bbtnCancelar: TBitBtn;
    edtCuenta: TEdit;
    dblcdFEfec: TwwDBLookupComboDlg;
    dbeFEfec: TwwDBEdit;
    Label4: TLabel;
    dbgDetFPago: TwwDBGrid;
    Label17: TLabel;
    PnlFPago: TPanel;
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
    dblcNota: TwwDBLookupCombo;
    ppLblCia: TppLabel;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    pplblNumero: TppLabel;
    ppLabel3: TppLabel;
    pplblFecNC: TppLabel;
    ppLabel4: TppLabel;
    pplblClienteID: TppLabel;
    pplblCliente: TppLabel;
    ppLabel10: TppLabel;
    pplblMoneda: TppLabel;
    ppLabel11: TppLabel;
    pplblTipCamb: TppLabel;
    ppLine3: TppLine;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel18: TppLabel;
    ppLabel16: TppLabel;
    ppLabel14: TppLabel;
    ppLine2: TppLine;
    ppLine4: TppLine;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblcdCobrador: TwwDBLookupComboDlg;
    dbeCobrador: TwwDBEdit;
    dbeZona: TwwDBEdit;
    dbdtpFecha: TwwDBDateTimePicker;
    edtZona: TEdit;
    dbgDocCanje: TwwDBGrid;
    dblcBanco: TwwDBLookupCombo;
    Label5: TLabel;
    edtBanco: TEdit;

    procedure FormActivate(Sender: TObject);
    function  ConsisMonto:Boolean;
    procedure RecalculaSaldos(xNuevo:Boolean);

// Procedimientos de Panel Cabecera
    procedure z2bbtnCancelClick(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgDocCanjeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgDocCanjeEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgPendientesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure z2bbtnSumatClick(Sender: TObject);
    procedure z2bbtnGrabaClick(Sender: TObject);
    procedure z2bbtnCalcClick(Sender: TObject);
// Final
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtClieRUCExit(Sender: TObject);
    procedure z2bbtnCancel2Click(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
    procedure ppDBText5Print(Sender: TObject);
    procedure ppDBCalc1Print(Sender: TObject);
    procedure z2bbtnNuevoClick(Sender: TObject);
    procedure z2bbtnSubeClick(Sender: TObject);
    procedure z2bbtnAnulaClick(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure ActPnlBotones;
    procedure edtClieRUCChange(Sender: TObject);
    procedure dbeGiradoAChange(Sender: TObject);
    procedure dbdtpFCobraChange(Sender: TObject);
    procedure dbeNoChqChange(Sender: TObject);
    procedure dbeElaboChange(Sender: TObject);
    procedure dbeAprobChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure Z2bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeTCambioEnter(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dbdtpFCobraEnter(Sender: TObject);
    procedure dbeElaboKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcNotaEnter(Sender: TObject);
    procedure Z2bbtnAdicFPagoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Z2OkDetalleClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure dblcTMonCExit(Sender: TObject);
    procedure dbeRecibidoChange(Sender: TObject);
    procedure dbeRecibidoEnter(Sender: TObject);
    procedure dbeRecibidoExit(Sender: TObject);
    procedure dbeACobrarEnter(Sender: TObject);
    procedure dbeACobrarExit(Sender: TObject);
    procedure dblcBancoFPagoExit(Sender: TObject);
    procedure dblcTarjetaExit(Sender: TObject);
    procedure chkAsignaRestoClick(Sender: TObject);
    procedure dblcdFEfecExit(Sender: TObject);
    procedure NotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dbgDocCanjeRowChanged(Sender: TObject);
  private
    { Private declarations }
    xDescrip : String;
    cf1: TControlFoco;
    A1 : Array of Integer ;
    A2 : Array Of TNotifyEvent ;
    A2digitos ,A4digitos : Array of TWinControl ;
    strTmp: string;
    evt_Exit: TNotifyEvent;
    procedure ConfiguraAccesos;
    procedure Proc_Admin;
    procedure Proc_Consul;
    procedure Libera_Admin;
    procedure Libera_Consul;
    procedure LibConfigAccesos;
    procedure IniciaDatos;
    procedure MuestraDatos;
    procedure Validacab;
    procedure BorraGrid ;
    procedure Inserta;
    procedure CalculaResto;
    procedure ValidacionDatos;
    procedure ValidacionTjaChq;
    procedure ValidacionCobradoTotal;
    procedure GrabaDetalle;
    procedure AcumulaDetFPago;
    procedure ActualizaPagados;
    procedure ValidaCancelacion;
    procedure GrabaEstadoFPago(xEstado: string);
    procedure DesabilitaClient();
  public
    { Public declarations }
    Function  ExisteMovCxC(xxCia,xxTDiario,xxAAMM,xxNoReg:String):Boolean;
  end;

var
  FDetalleLiq : TFDetalleLiq;
  xSQL    : String;
  xFlagOk : Boolean;
  wbSumat, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,wbConsultar,
  wbcancel2: Boolean;
  wmodifica: Boolean;

implementation

Uses CAJAUTIL, Caja006;
{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}

procedure TFDetalleLiq.FormActivate(Sender: TObject); //ok rlp
begin
// Inicia Datos para que los DBEdit no se vean con datos llenos
   If DM1.wModo='A' then
      IniciaDatos
   else
   begin
     dblcCia.Text  := DM1.cdsCobraCxC.FieldByName('CIAID').AsString;
     dblcNota.Text := DM1.cdsCobraCxC.FieldByName('LICOID').AsString;
     z2bbtnOKCabClick(Sender);
   end;

end;


procedure TFDetalleLiq.MuestraDatos;
begin
   Z2bbtnOkCab.Enabled := False ;
   Z2bbtnNuevo.Visible := False ;

   dblcdClie.Text  := DM1.cdsCobraCxC.FieldByName('CLIEID').AsString;
   edtClieRUC.Text := DM1.cdsCobraCxC.FieldByName('CLIERUC').AsString;
   //** 03/04/2001 - pjsv
   xDescrip := 'CLIEID='+quotedstr(dblcdClie.Text);
   dbeDesClie.Text := dm1.DisplayDescrip('prvTGE','TGE204','CLIEDES',xDescrip,'CLIEDES');
   //**
   //Datos Adicionales de Caja
   if DM1.RecuperarDatos('TGE105','BANCOABR','BANCOID=''' + dm1.cdsCobraCxC.fieldbyname('bancoid').AsString +'''') then
   begin
      edtBanco.Text  := dm1.cdsRec.fieldbyname('BANCOABR').AsString ;
      dblcBanco.Text := dm1.cdsCobraCxC.fieldbyname('BANCOID').AsString ;
      edtCuenta.Text := dm1.cdsCobraCxC.fieldbyname('CUENTAID').AsString ;
   end ;
//   dbdtpFCobra.date := dm1.cdsCobraCxC.fieldbyname('NCOFCOB').AsDateTime;
   dbdtpFCobra.date := dm1.cdsCobraCxC.fieldbyname('CCFEMIS').AsDateTime;
   dblcTMon.Text    := dm1.cdsCobraCxC.fieldbyname('TMONID').AsString;
   dbeTCambio.Text  := dm1.cdsCobraCxC.fieldbyname('NCOTCAMB').AsString;
   pnlCabecera.Enabled:= False;

   if DM1.cdsCobraCxC.FieldByName('NCOESTADO').Value='I' then
   begin     //Incompleto

      DM1.cdsCobraCxC.Edit;
      pnlCabecera.Enabled  :=  False;    // Desactivar Panel1
      pnlCabecera2.Enabled :=  True;     // Activar Panel2
      pnlBotones.Enabled   :=  False ;
      z2bbtnOk.Enabled     := True;
      z2bbtnCancel.Enabled := True;

      wbSumat     := True ;
      wbNuevo     := True ;
      wbImprime   := True ;
      wbSube      := True ;
      wbGraba     := True ;
      wbCancelado := True ;
      wbConsultar := False ;
      wbCancel2   := True ;
      wbAnula     := True ;

      lblEstado.Caption    :='Activo             ';
   end;

   // Estado Pendiente / Cancelado  / Anulado
   if DM1.cdsCobraCxC.FieldByName('NCOESTADO').AsString[1] in ['P','A'] then
   begin     //Pendiente a pagar
      pnlCabecera.Enabled  := False;    // Desactivar Panel1
      pnlCabecera2.Enabled := False;    // Desactivar Panel2
      dbgDocCanje.ReadOnly := True;     // Grid en Solo Lectura
      pnlBotones.Enabled   := True;     // Activar Panel de Botones
      z2bbtnOk.Enabled     := False;
      z2bbtnCancel.Enabled := False;

      wbSumat     := False ;
      wbNuevo     := True ;
      wbImprime   := True ;
      wbSube      := False ;
      wbGraba     := False ;
      wbCancelado := False ;
      wbConsultar := False ;
      wbCancel2   := False ;
      wbAnula     := False ;

      ActPnlBotones;
      if DM1.cdsCobraCxC.FieldByName('NCOESTADO').Value='P' then
         lblEstado.Caption     :='Pendiente          ';
      if DM1.cdsCobraCxC.FieldByName('NCOESTADO').Value='C' then
         lblEstado.Caption     :='Cancelado          ';
      if DM1.cdsCobraCxC.FieldByName('NCOESTADO').Value='A' then
         lblEstado.Caption     :='Anulado            ';
   end;

   ////////// 1805i
   if DM1.cdsCobraCxC.FieldByName('NCOESTADO').AsString[1] in ['C'] then
   begin     //Pendiente a pagar
      pnlCabecera.Enabled  := False;    // Desactivar Panel1
      pnlCabecera2.Enabled := False;    // Desactivar Panel2
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
      wbCancelado := False ;
      wbConsultar := True ;
      wbCancel2   := False;
      wbAnula     := False;

      ActPnlBotones;
      if DM1.cdsCobraCxC.FieldByName('NCOESTADO').Value='P' then
         lblEstado.Caption     :='Pendiente          ';
      if DM1.cdsCobraCxC.FieldByName('NCOESTADO').Value='C' then
         lblEstado.Caption     :='Cancelado          ';
      if DM1.cdsCobraCxC.FieldByName('NCOESTADO').Value='A' then
         lblEstado.Caption     :='Anulado            ';
   end;

   z2bbtnSumatClick( Self );
end;

procedure TFDetalleLiq.IniciaDatos;
begin

   pnlCabecera.Enabled   := True;
   Z2bbtnOkCab.Enabled := True ;
   pnlCabecera2.Enabled  := False;
   pnlBotones.Enabled    := False;

   // Estado de variables Botones
   wbSumat     := False;
   wbNuevo     := False;
   wbImprime   := False;
   wbSube      := False;
   wbGraba     := False;
   wbConsultar := False;
   wbCancelado := False;
   wbCancel2   := False;
   wbAnula     := False;

   // Estado de Botones
   z2bbtnOk.Enabled        := False ;
   z2bbtnCancel.Enabled    := False ;
   z2bbtnSumat.Enabled     := False ;
   z2bbtnNuevo.Enabled     := False ;
   z2bbtnImprime.Enabled   := False ;
   z2bbtnSube.Enabled      := False ;
   z2bbtnGraba.Enabled     := False ;
   z2bbtnCancel2.Enabled   := False ;
   z2bbtnAnula.Enabled     := False ;
   //
   Z2bbtnNuevo.Visible     := True ;
   //
   dblcCia.Text      := '' ;   // Código de Compañía
   edtCia.Enabled    := False ;
   edtCia.Text       := '' ;   // Descripción de la Compañía
   dblcNota.Text    := '' ;   // Orden de Cobranza
   dblcdClie.Text    := '' ;    // Código de Cliente
   edtClieRUC.Text   := '' ;    // RUC del Cliente
   dbeDesClie.Text   := '' ;   // Descripcion del Cliente
   dbdtpFCobra.Date  := dateS ; // Fecha de Cobranza
   dblcTMon.Text     := '' ;   // Tipo de Moneda
   edtTMon.Enabled   := False ;
   edtTMon.Text      := '' ;   // Descripción de la Moneda
   dbeTCambio.Text   := '' ;   // Tipo de Cambio
   dblcBanco.Text    := '' ;
   edtBanco.Text     := '' ;
   edtCuenta.Text    := '' ;
   lblEstado.Caption := '';   //Inicializar el Estado

   wmodifica         := False;

   dbgDocCanje.ReadOnly  := False;     // Para el Grid

   dbgDocCanje.ColumnByName('LICOMTOABOLOC').FooterValue:='0.00';
   dbgDocCanje.ColumnByName('LICOMTOABOEXT').FooterValue:='0.00';

   dbgDetFPago.ColumnByName('LICOMTOABOLOC').FooterValue:='0.00';
   dbgDetFPago.ColumnByName('LICOMTOABOEXT').FooterValue:='0.00';

   // Limpiando filtros si lo tuvieran
   DM1.cdsCCBco.Filtered:=False;

// Documentos Seleccionados para Canje

   // vhn 23/01/2001
{   xSQL:='Select * from CXC303 '
        +'Where CIAID='''+dblcCia.Text+''' and NOTACOB<>'''' ';
   DM1.cdsCobraCxC.Close;
   DM1.cdsCobraCxC.DataRequest( xSQL );
   DM1.cdsCobraCxC.Open;
   DM1.cdsCobraCxC.EmptyDataSet;}


{   xSQL:='Select * from CXC304 '
        +'Where CIAID='''' and CCCANJE='''' ';
   DM1.cdsCanjeCxC.Close;
   DM1.cdsCanjeCxC.DataRequest( xSQL );
   DM1.cdsCanjeCxC.Open;
   DM1.cdsCanjeCxC.EmptyDataSet;}

   //** 25/07/2001 - pjsv
   xSQL:='Select * from CAJA314 '
        +'Where CIAID='''' and '
        +      'CCTREC='''' and '
        +      'CCNODOC='''' ';
   DM1.cdsDetFPago   .Close;
   DM1.cdsDetFPago.DataRequest( xSQL );
   DM1.cdsDetFPago.Open;
   DM1.cdsDetFPago.EmptyDataSet;

   xSQL:=' SELECT CXC320.*,TGE103.TMONABR,TGE105.BANCOABR '+
         ' FROM CXC320 '+
         ' LEFT JOIN TGE103 ON TGE103.TMONID=CXC320.TMONIDPAGO '+
         ' LEFT JOIN TGE105 ON TGE105.BANCOID=CXC320.BANCOID '+
         ' WHERE CIAID='''' ' ;

   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest( xSQL );
   DM1.cdsQry2.Open;
   DM1.cdsQry2.EmptyDataset;


   DM1.cdsQry3.Close;
   DM1.cdsQry3.DataRequest( xSQL );
   DM1.cdsQry3.Open;
   DM1.cdsQry3.EmptyDataset;


   dbgDetFPago.ColumnByName('DEMTOLOC').FooterValue:='0.00';
   dbgDetFPago.ColumnByName('DEMTOEXT').FooterValue:='0.00';
   RecuperarCiaUnica(dblcCia,edtCia);

   if dblccia.text <> '' then
    begin
      perform(CM_DialogKey,VK_TAB,0);
      //dblccia.OnExit(dblccia);
      dblccia.OnExit(NIL);
    end;
end;

{*******************************************************
PRIMER PANEL - DATOS INICIALES DE LA CABECERA
*******************************************************}

{*******************************************************
SEGUNDO PANEL - DATOS ADICIONALES DE LA CABECERA
*******************************************************}
procedure TFDetalleLiq.edtClieRUCExit(Sender: TObject);
var
   xTiene, xWhere : string;
begin
   if length(edtClieRUC.Text)>0 then
   begin
      xWhere:='CLIERUC='+''''+edtClieRUC.Text+'''';
      xTiene :=DM1.DisplayDescrip('prvTGE','TGE204','CLIEDES, CLIEID',xWhere,'CLIEDES');
      if length(xTiene)=0 then
         begin
            ShowMessage('Registro Unico de Cliente Errado');
            edtClieRUC.SetFocus;
         end
      else
      begin
         dblcdClie.Text :=DM1.cdsqry.fieldbyname('CLIEID').Value;
         dbeDesClie.Text:=xTiene;
      end;
   end; // length
end;

procedure TFDetalleLiq.dbeTCambioExit(Sender: TObject);
begin
{   if   strTmp <> dbeTCambio.text then
   begin
      if cajadec(dbetcambio.text)=BLANCO then
      begin
        ShowMessage('Ingrese Tipo de Cambio') ;
        dbeTCambio.setfocus                   ;
        Exit                                  ;
      end
      else
      begin
        TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text) ;
      end ;

      DM1.cdsCanjeCxC.First;
      If DM1.FRound(DM1.cdsCanjeCxCCCTCAMCje.Value,8,3) <> DM1.FRound(strtofloat(dbeTCambio.Text),8,3) then
      begin
         While not DM1.cdsCanjeCxC.eof do
         begin
            DM1.cdsCanjeCxC.Edit;
            DM1.cdsCanjeCxCCCTCAMCje.Value := DM1.FRound(strtofloat(dbeTCambio.Text),8,3);
            DM1.cdsCanjeCxC.Next;
         end;
         DM1.cdsCanjeCxC.First;
      end;
      wmodifica:=True;
    end ;}
end;

procedure TFDetalleLiq.z2bbtnOKClick(Sender: TObject);    //rlp ok
var
   xWhere, xSQL :string;
begin
    ValidaCab ;
    with DM1 do
    begin
      cdsCobraCxC.Edit;
      cdsCobraCxC.FieldByName('CLIEID').Value   := dblcdClie.Text;
      cdsCobraCxC.FieldByName('CLIERUC').Value  := edtClieRUC.Text;
      cdsCobraCxC.FieldByName('NCOFCOB').Value  := dbdtpFCobra.date;
      cdsCobraCxC.FieldByName('TMONID').Value   := dblcTMon.Text;
      cdsCobraCxC.FieldByName('NCOEstado').Value:= 'I';

      xWhere:='FECHA='+ wRepFuncDate + quotedStr( formatdatetime(DM1.wFormatFecha,dbdtpFCobra.Date) ) +')';
      cdsCobraCxC.FieldByName('NCOANO').Value    := DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
      cdsCobraCxC.FieldByName('BANCOID').AsString := dblcBanco.Text ;
      cdsCobraCxC.FieldByName('CUENTAID').AsString := edtCuenta.Text  ;

      cdsCobraCxC.fieldbyname('NCOFCOB').AsDateTime := dbdtpFCobra.date ;
      cdsCobraCxC.fieldbyname('TMONID').AsString    := dblcTMon.Text    ;
      cdsCobraCxC.fieldbyname('NCOTCAMB').AsString  := dbeTCambio.Text  ;

      //fin de datos adicionales
      if length(cdsCobraCxC.FieldByName('NCOANO').Value)>0 then
      begin
         cdsCobraCxC.FieldByName('NCOMM').Value   := cdsqry.fieldbyname('FecMes').Value;        // mes
         cdsCobraCxC.FieldByName('NCODD').Value   := cdsqry.fieldbyname('FecDia').Value;        // día
         cdsCobraCxC.FieldByName('NCOTRI').Value  := cdsqry.fieldbyname('FecTrim').Value;      // trimestre
         cdsCobraCxC.FieldByName('NCOSEM').Value  := cdsqry.fieldbyname('FecSem').Value;       // semestre
         cdsCobraCxC.FieldByName('NCOSS').Value   := cdsqry.fieldbyname('FecSS').Value;         // semana
         cdsCobraCxC.FieldByName('NCOANOMM').Value:= cdsCobraCxC.FieldByName('NCOANO').Value+cdsqry.fieldbyname('FecMes').Value; // año+mes
         cdsCobraCxC.FieldByName('NCOAATRI').Value:= cdsqry.fieldbyname('FecAATri').Value;   // año+trimestre
         cdsCobraCxC.FieldByName('NCOAASEM').Value:= cdsqry.fieldbyname('FecAASem').Value;   // año+semestre
         cdsCobraCxC.FieldByName('NCOAASS').Value := cdsqry.fieldbyname('FecAASS').Value;     // año+semana
      end;
      cdsCobraCxC.Post;

      // Grid de Documentos a Canjear
      // vhn 23/01/2001
      xSQL:='Select * from CXC304 '
           +'Where CIAID='''  +dblcCia.Text +''' and '
           +      'CCCANJE='''+dblcNota.Text+''' ';
      DM1.cdsCanjeCxC.Close;
      DM1.cdsCanjeCxC.DataRequest( xSQL );
      DM1.cdsCanjeCxC.Open;

      xFlagCal := True;
      RecalculaSaldos(xFlagCal);
    end;

    //Actualizamos el Footer
    z2bbtnSumatClick(sender);

    // Estado de los componentes
    pnlCabecera.enabled   := False;
    pnlCabecera2.enabled  := False;

    pnlBotones.Enabled    := True;
    ActPnlBotones;
    z2bbtnOk.Enabled      := False;
    z2bbtnCancel.Enabled  := False;
    //** 05/04/2001 - pjsv
    pnlDetalle.Enabled    := True;
    //**
end;

procedure TFDetalleLiq.RecalculaSaldos(xNuevo:boolean);
begin
     DM1.cdsCanjeCxC.DisableControls;
     DM1.cdsCanjeCxC.First;
     While not DM1.cdsCanjeCxC.Eof do
     begin
        DM1.cdsCanjeCxC.Edit;
        if DM1.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
                                 VarArrayOf([
                                              DM1.cdsCanjeCxC.FieldByName('CIAID').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('TDIARID').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('CCANOMM').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('CCNOREG').AsString
                                            ]),[]) then
        begin
           DM1.cdsCanjeCxC.FieldByName('CCSALLOC').Value :=DM1.cdsMovCxC.FieldByName('CCMTOLOC').Value-DM1.cdsMovCxC.FieldByName('CCPAGLOC').Value;
           DM1.cdsCanjeCxC.FieldByName('CCSALEXT').Value :=DM1.cdsMovCxC.FieldByName('CCMTOEXT').Value-DM1.cdsMovCxC.FieldByName('CCPAGEXT').Value;
        end;
        if not xNuevo then
        begin
           DM1.cdsCanjeCxC.FieldByName('CJEANTMN').Value := DM1.cdsCanjeCxC.FieldByName('CCMTOLOC').Value;
           DM1.cdsCanjeCxC.FieldByName('CJEANTME').Value := DM1.cdsCanjeCxC.FieldByName('CCMTOEXT').Value;
        end;
        DM1.cdsCanjeCxC.Post;
        DM1.cdsCanjeCxC.Next;
     end;
     DM1.cdsCanjeCxC.First;
     DM1.cdsCanjeCxC.EnableControls;
end;

procedure TFDetalleLiq.z2bbtnCancelClick(Sender: TObject);  //rlp ok
begin
   DM1.cdsCobraCxC.CancelUpdates;
   DM1.cdsMovCxC.CancelUpdates;
   DM1.cdsCanjeCxC.CancelUpdates;
   DM1.cdsDetFPago.CancelUpdates;
   IniciaDatos;
   z2bbtnOKCab.Enabled:=true;
end;

{*******************************************************
TERCER PANEL - 1ER GRID DOCUMENTOS PENDIENTES DE CANCELACION
*******************************************************}

// Para Enviar a Documentos de Canje
procedure TFDetalleLiq.dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
end;

// Para Recibir los Documentos de Canje

procedure TFDetalleLiq.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
end;

{*******************************************************
TERCER PANEL - 2DO GRID DOCUMENTOS DE CANJE
*******************************************************}
// Para Enviar los Doc. de Canje a Pendientes

procedure TFDetalleLiq.dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
end;

// Para Recibir los Documentos Pendientes

procedure TFDetalleLiq.dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
end;

{*******************************************************
CUARTO PANEL - BOTONES
*******************************************************}

procedure TFDetalleLiq.z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('C:\windows\calc.exe',1 );  // Executa Aplicación
end;

procedure TFDetalleLiq.z2bbtnSumatClick(Sender: TObject);
var
   sCond:string;
begin
   // Totales de Documentos de canje
   dbgDocCanje.ColumnByName('LICOMTOABOLOC').FooterValue:=floattostrf(OperClientDataSet(DM1.cdsQry2,'SUM(LICOMTOABOLOC)',''), ffNumber, 12, 2);
   dbgDocCanje.ColumnByName('LICOMTOABOEXT').FooterValue:=floattostrf(OperClientDataSet(DM1.cdsQry2,'SUM(LICOMTOABOEXT)',''), ffNumber, 12, 2);

   sCond:='FPAGOID='+QuotedStr(DM1.cdsQry2.FieldByName('FPAGOID').AsString)+
          ' AND TMONIDPAGO='+QuotedStr(DM1.cdsQry2.FieldByName('TMONIDPAGO').AsString);

   dbgDetFPago.ColumnByName('LICOMTOABOLOC').FooterValue:=floattostrf(OperClientDataSet(DM1.cdsQry3,'SUM(LICOMTOABOLOC)',sCond), ffNumber, 12, 2);
   dbgDetFPago.ColumnByName('LICOMTOABOEXT').FooterValue:=floattostrf(OperClientDataSet(DM1.cdsQry3,'SUM(LICOMTOABOEXT)',sCond), ffNumber, 12, 2);
end;

procedure TFDetalleLiq.z2bbtnSubeClick(Sender: TObject);
begin
   DM1.cdsQry2.EmptyDataSet;
   DesabilitaClient();
   pnlCabecera.Enabled:= True;
   pnlBotones.Enabled    := False;
   pnlDetalle.Enabled   := False;

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
Grabación Final de la Orden de Cobranza
********************************************}

function TFDetalleLiq.ConsisMonto:Boolean;
var  xRegAct : TBookMark;
begin
     Result:=True;
     // Verifica que existan Documentos
     if DM1.cdsCanjeCxC.RecordCount=0 then
     begin
        ShowMessage(' No hay Documentos a Pagar ');
        Result:=False;
        exit;
     end;

     DM1.cdsCanjeCxC.DisableControls;
     xRegAct := DM1.cdsCanjeCxC.GetBookmark;
     DM1.cdsCanjeCxC.First;
     While not DM1.cdsCanjeCxC.Eof do
     Begin
        if DM1.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
                                 VarArrayOf([
                                              DM1.cdsCanjeCxC.FieldByName('CIAID').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('TDIARID').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('CCANOMM').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('CCNOREG').AsString
                                            ]),[]) then
         begin
            If DM1.cdsMovCxC.FieldByName('TMONID').Value=DM1.wTMonLoc then
            begin
               If DM1.FRound(DM1.cdsMovCxC.FieldByName('CCPAGLOC').Value+DM1.cdsCanjeCxC.FieldByName('CCMTOLOC').Value
                  -DM1.cdsCanjeCxC.FieldByName('CJEANTMN').Value,15,2)>DM1.FRound(DM1.cdsMovCxC.FieldByName('CCMTOLOC').Value,15,2) Then
               begin
                   ShowMessage('Error : Monto pagado excede a Monto Total de Documento');
                   Result := False;
                   break;
               end;
            end
            else
            begin
               If DM1.FRound(DM1.cdsMovCxC.FieldByName('CCPAGEXT').Value+DM1.cdsCanjeCxC.FieldByName('CCMTOEXT').Value
                 -DM1.cdsCanjeCxC.FieldByName('CJEANTME').Value,15,2)>DM1.FRound(DM1.cdsMovCxC.FieldByName('CCMTOEXT').Value,15,2) Then
               begin
                  ShowMessage('Error : Monto pagado excede a Monto Total de Documento');
                  Result := False;
                  break;
               End;
            end;
         end;
         DM1.cdsCanjeCxC.Next;
     end;
     DM1.cdsCanjeCxC.GotoBookmark(xRegAct);
     DM1.cdsCanjeCxC.FreeBookmark(xRegAct);
     DM1.cdsCanjeCxC.EnableControls;
end;

procedure TFDetalleLiq.z2bbtnGrabaClick(Sender: TObject);
var
  xRegAct : TBookMark;
  xPagLoc, xPagExt   : Real;
  xTPagLoc, xTPagExt : Real;
begin
   if DM1.cdsCobraCxC.FieldByName('NCOESTADO').Value='I' then
   begin
       with DM1 do
       begin
          if not ConsisMonto then
          begin
             ShowMessage('No se puede Grabar');
             exit
          end;

          // Calcula los Montos de la Orden de Cobranza
          cdsCanjeCxC.DisableControls;
          xRegAct := cdsCanjeCxC.GetBookmark;
          xTPagLoc := 0; xTPagExt := 0;
          cdsCanjeCxC.First ;
          while not cdsCanjeCxC.Eof do
          begin
             xTPagLoc := xTPagLoc + cdsCanjeCxC.FieldByName('CCMTOLOC').Value;
             xTPagExt := xTPagExt + cdsCanjeCxC.FieldByName('CCMTOEXT').Value;
             cdsCanjeCxC.Next;
          end;

          cdsCobraCxC.Edit;
          DM1.cdsCobraCxC.FieldByName('NCOMTOLOC').Value:= xTPagLoc;
          DM1.cdsCobraCxC.FieldByName('NCOMTOEXT').Value:= xTPagExt;
          if DM1.cdsCobraCxC.FieldByName('TMONID').Value=wtMonLoc then
             DM1.cdsCobraCxC.FieldByName('NCOMTOORI').Value:= xTPagLoc
          else
             DM1.cdsCobraCxC.FieldByName('NCOMTOORI').Value:= xTPagExt;

          cdsCanjeCxC.GotoBookmark(xRegAct);
          cdsCanjeCxC.FreeBookmark(xRegAct);
          cdsCanjeCxC.EnableControls;

       // Actualiza Saldo de MovCxC
          DM1.cdsCanjeCxC.DisableControls;
          xRegAct := DM1.cdsCanjeCxC.GetBookmark;
          DM1.cdsCanjeCxC.First;
          While not DM1.cdsCanjeCxC.Eof do
          Begin
          DM1.cdsCanjeCxC.Edit;
          if DM1.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
                                 VarArrayOf([
                                              DM1.cdsCanjeCxC.FieldByName('CIAID').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('TDiarID').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('CCANOMM').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('CCNOREG').AsString
                                            ]),[]) then
             begin
                DM1.cdsMovCxC.edit;
                If DM1.cdsMovCxC.FieldByName('TMONID').Value=DM1.wTMonLoc then
                begin
                   xPagLoc := DM1.FRound(DM1.cdsCanjeCxC.FieldByName('CCMTOLOC').Value-DM1.cdsCanjeCxC.FieldByName('CJEANTMN').Value,15,2);
                   DM1.cdsMovCxC.FieldByName('CCSALLOC').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSALLOC').Value-xPagLoc,15,2);
                   DM1.cdsMovCxC.FieldByName('CCSALEXT').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSALLOC').Value/DM1.cdsCanjeCxC.FieldByName('CCTCamCje').Value,15,2);
                   end
                else
                begin
                   xPagExt := DM1.FRound(DM1.cdsCanjeCxC.FieldByName('CCMTOEXT').Value-DM1.cdsCanjeCxC.FieldByName('CJEANTME').Value,15,2);
                   DM1.cdsMovCxC.FieldByName('CCSALEXT').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSALEXT').Value-xPagExt,15,2);
                   DM1.cdsMovCxC.FieldByName('CCSALLOC').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSALEXT').Value*DM1.cdsCanjeCxC.FieldByName('CCTCamCje').Value,15,2);
                end;
                DM1.cdsMovCxC.post;
             end;
             DM1.cdsCanjeCxC.Next;
          end;
          DM1.cdsCanjeCxC.GotoBookmark(xRegAct);
          DM1.cdsCanjeCxC.FreeBookmark(xRegAct);
          DM1.cdsCanjeCxC.EnableControls;

          RecalculaSaldos(False);

          DM1.cdsCobraCxC.ApplyUpdates(0);

          DM1.cdsCanjeCxC.ApplyUpdates(0);

          DM1.cdsMovCxC.ApplyUpdates(0);

          DM1.cdsDetFPago.ApplyUpdates(0);

          z2bbtnSumatClick(sender);
          ShowMessage('Grabacion OK');

          z2bbtnNuevo.Enabled    := True;
          z2bbtnAnula.Enabled    := True;
          z2bbtnImprime.Enabled  := True;
          Z2bbtnCancelar.Enabled := True ;
          wmodifica:=False;
       end;
    end
    else
    begin
         ShowMessage('Imposible Grabar');
    end;
end;

procedure TFDetalleLiq.z2bbtnCancel2Click(Sender: TObject);
begin
   if MessageDlg('¿Anular los cambios?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin
      DM1.cdsCobraCxC.CancelUpdates;
      DM1.cdsMovCxC.CancelUpdates;
      DM1.cdsCanjeCxC.CancelUpdates;
      IniciaDatos;
   end;
end;

procedure TFDetalleLiq.z2bbtnImprimeClick(Sender: TObject);
begin
	 //JCC: 24/06/2002
	 pprOPago.TEMPLATE.FileName := wRutaRpt + '\NotaC.Rtm';
   pprOPago.template.LoadFromFile ;
   pplblCia.Caption := edtCia.Text ;
   pplblNumero.Caption := dblcNota.text;
   pplblFecNC.Caption := dbdtpFCobra.Text ;
   pplblClienteID.Caption := dblcdClie.Text ;
   pplblCliente.Caption := dbeDesClie.Text ;
   pplblMoneda.Caption := edtTMon.Text ;
   pplblTipCamb.Caption := dbeTCambio.Text ;
   pprOPago.Print;
end;

procedure TFDetalleLiq.ppDBText5Print(Sender: TObject);
begin
   if DM1.cdsCobraCxC.FieldByName('TMONID').Value=DM1.wTMonLoc then
      ppDBText5.DataField := 'CCMTOLOC'
   else
      ppDBText5.DataField := 'CCMTOEXT'
end;

procedure TFDetalleLiq.ppDBCalc1Print(Sender: TObject);
begin
   if DM1.cdsCobraCxC.FieldByName('TMONID').Value=DM1.wTMonLoc then
      ppDBCalc1.DataField := 'CCMTOLOC'
   else
      ppDBCalc1.DataField := 'CCMTOEXT'
end;

procedure TFDetalleLiq.z2bbtnNuevoClick(Sender: TObject);
begin
   if DM1.cdsCobraCxC.FieldByName('NCOESTADO').Value ='I' then
   begin
      if wmodifica then
      begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      end;
      if MessageDlg('¿Nueva Nota de Cobranza?',
         mtConfirmation, [mbYes, mbNo], 0)=mrYes then begin
         IniciaDatos;
      end;
   end
   else begin
      Iniciadatos;
   end;
end;

procedure TFDetalleLiq.z2bbtnAnulaClick(Sender: TObject);
begin
    if DM1.cdsCobraCxC.FieldByName('NCOESTADO').Value='I' then
    begin

      if MessageDlg('¿Anular Nota de Cobranza?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin

         DM1.cdsCobraCxC.CancelUpdates;
         DM1.cdsMovCxC.CancelUpdates;
         DM1.cdsCanjeCxC.CancelUpdates;

         // Actualiza los Saldos de los Documentos Canjeados
         DM1.cdsCanjeCxC.DisableControls;
         DM1.cdsCanjeCxC.First;
         While not DM1.cdsCanjeCxC.Eof do
         Begin
            if ExisteMovCxC( DM1.cdsCanjeCxC.FieldByName('CIAID').Value,DM1.cdsCanjeCxC.FieldByName('TDIARID').Value,
                             DM1.cdsCanjeCxC.FieldByName('CCANOMM').Value,DM1.cdsCanjeCxC.FieldByName('CCNOREG').Value) then
            begin
               DM1.cdsMovCxC.Edit;
               If DM1.cdsMovCxC.FieldByName('TMONID').Value=DM1.wTMonLoc then
               begin
                  DM1.cdsMovCxC.FieldByName('CCSALLOC').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCMTOLOC').Value-DM1.cdsMovCxC.FieldByName('CCPAGLOC').Value,15,2);
                  If DM1.cdsMovCxC.FieldByName('CCTCAMPA').Value>0 then
                     DM1.cdsMovCxC.FieldByName('CCSALEXT').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSALLOC').Value/DM1.cdsMovCxC.FieldByName('CCTCAMPA').Value,15,2)
                  else
                  begin
                     DM1.cdsMovCxC.FieldByName('CCSALEXT').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSALLOC').Value/DM1.cdsMovCxC.FieldByName('CCTCAMAJ').Value,15,2);
                  end;
                  end
               else
               begin
                  DM1.cdsMovCxC.FieldByName('CCSALEXT').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCMTOEXT').Value-DM1.cdsMovCxC.FieldByName('CCPAGEXT').Value,15,2);
                  If DM1.cdsMovCxC.FieldByName('CCTCAMPA').Value>0 then
                     DM1.cdsMovCxC.FieldByName('CCSALLOC').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSALEXT').Value*DM1.cdsMovCxC.FieldByName('CCTCAMPA').Value,15,2)
                  else
                  begin
                     DM1.cdsMovCxC.FieldByName('CCSALLOC').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSALEXT').Value*DM1.cdsMovCxC.FieldByName('CCTCAMAJ').Value,15,2);
                  end;
               end;
            end;
            DM1.cdsCanjeCxC.Next;
         end;
         DM1.cdsCanjeCxC.EnableControls;

         DM1.cdsMovCxC.ApplyUpdates(0);

         // Anula Orden de Cobranza
         DM1.cdsCobraCxC.Edit;
         DM1.cdsCobraCxC.FieldByName('NCOESTADO').Value:='A';  // Anulada
         DM1.cdsCobraCxC.ApplyUpdates(0);

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
         ShowMessage('Imposible Anular Nota de Cobranza');
    end;
end;

procedure TFDetalleLiq.ActPnlBotones;
begin
   z2bbtnSumat.Enabled    := wbSumat;
   z2bbtnNuevo.Enabled    := wbNuevo;
   z2bbtnImprime.Enabled  := wbImprime;
   z2bbtnSube.Enabled     := wbSube;
   Z2bbtnCancelar.enabled := wbCancelado ;
   z2bbtnGraba.Enabled    := wbGraba;
   z2bbtnCancel2.Enabled  := wbCancel2;
   z2bbtnAnula.Enabled    := wbAnula;
end;


{*******************************************************
FIN DE LA FORMA
*******************************************************}
procedure TFDetalleLiq.FormClose(Sender: TObject; var Action: TCloseAction);
var sSQLAnt: string;
begin
   // Cancela Cualquier Modificación
   if DM1.cdsCobraCxC.Active then DM1.cdsCobraCxC.CancelUpdates;
   if DM1.cdsMovCxC.Active   then DM1.cdsMovCxC.CancelUpdates;
   if DM1.cdsCanjeCxC.Active then DM1.cdsCanjeCxC.CancelUpdates;

   // Limpiando filtros si lo tuvieran
   DM1.cdsCCBco.Filtered:=False;

   {Este codigo mantenerse obligariamente}
   sSQLAnt := 'SELECT * FROM TGE105 WHERE BCOTIPCTA=''C'''
              +' UNION '
              +' SELECT DISTINCT TGE105.* FROM TGE105, TGE106  WHERE (TGE105.BANCOID=TGE106.BANCOID)';
   DM1.cdsBancoEgr.close;
   DM1.cdsBancoEgr.datarequest(sSQLAnt);
   DM1.cdsBancoEgr.close;
   FAccesos.FiltraTabla( DM1.cdsBancoEgr,   'TGE105', 'BANCOID' );

   DM1.cdsDetFPago.close;
   DM1.cdsCanjeCxC.close;

   DM1.cdsQry3.MasterSource:=NIL;
   DM1.cdsQry3.IndexFieldNames:='';
   DM1.cdsQry3.MasterFields:='';
   DM1.cdsQry2.IndexFieldNames:='';
end;

Function TFDetalleLiq.ExisteMovCxC(xxCia,xxTDiario,xxAAMM,xxNoReg:String):Boolean;
begin
  Result:=DM1.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
                                VarArrayOf([xxCia,xxTDiario,xxAAMM,xxNoReg]),[]);
end;

procedure TFDetalleLiq.edtClieRUCChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFDetalleLiq.dbeGiradoAChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFDetalleLiq.dbdtpFCobraChange(Sender: TObject);
begin
{   wmodifica:=True;}
end;

procedure TFDetalleLiq.dbeNoChqChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFDetalleLiq.dbeElaboChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFDetalleLiq.dbeAprobChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFDetalleLiq.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFDetalleLiq.z2bbtnOKCabClick(Sender: TObject);
var sSQL,sEFE,sCHE,sNDE :string;
begin
   xFlagCal := False;
   ///CIM 22/11/2001
   sEFE := dm1.DisplayDescrip('prvTGE','TGE112','FPAGOID','FEFE=''1'' or FEFE=''S'' ','FPAGOID');
   sCHE := dm1.DisplayDescrip('prvTGE','TGE112','FPAGOID','FCHQ=''1'' or FCHQ=''S'' ','FPAGOID');
   sNDE := dm1.DisplayDescrip('prvTGE','TGE112','FPAGOID','FNDE=''1'' or FNDE=''S'' ','FPAGOID');

   if DM1.wModo<>'A' then
   begin
    sSQL:='SELECT * FROM CXC318 WHERE CIAID='+QuotedStr(dblcCia.Text)+' AND LICOID='+QuotedStr(dblcNota.Text);
    DM1.cdsCLiqCob1.Close;
    DM1.cdsCLiqCob1.DataRequest(sSQL);
    DM1.cdsCLiqCob1.Open;
    DM1.cdsCLiqCob1.First;
    dblcNota.Text:=DM1.cdsCLiqCob1.FieldByName('LICOID').AsString;
   end;

   dblcdCobrador.DataSource:=DM1.dsCLiqCob1;
   dblcdCobrador.DataField:='COID';

   dbeCobrador.DataSource:=DM1.dsCLiqCob1;
   dbeCobrador.DataField:='CCONOMBRES';

   dbeZona.DataSource:=DM1.dsCLiqCob1;
   dbeZona.DataField:='TVTAID';
   edtZona.Clear;

   dbdtpFecha.DataSource:=DM1.dsCLiqCob1;
   dbdtpFecha.DataField:='CCFEMIS';
   edtZona.text:=DM1.DisplayDescrip('prvTGE','FAC105','TVTADES','TVTAID='+QuotedStr(dbeZona.text),'TVTADES');

   if DM1.wModo='A' then
   begin
     lblEstado.Caption    := 'Nuevo     ';
     pnlCabecera.Enabled  := false;
     pnlCabecera2.Enabled := False;
     pnlDetalle.Enabled := True;
     pnlBotones.Enabled:=True;
     z2bbtnOk.Enabled     := True;
     z2bbtnCancel.Enabled := True;
     z2bbtnSube.Enabled   := True;
     z2bbtnSumat.Enabled  := True;
   end
   else
   begin
     lblEstado.Caption    := 'Aceptado  ';
     pnlCabecera.Enabled  := False;
     pnlCabecera2.Enabled := False;
     pnlDetalle.Enabled := True;
     pnlBotones.Enabled:=True;
     z2bbtnCancelar.Enabled:=False;
     z2bbtnOk.Enabled     := False;
     z2bbtnCancel.Enabled := False;
     z2bbtnSube.Enabled   := False;
     z2bbtnSumat.Enabled  := True;
     dblcCia.Text  := DM1.cdsCobraCxC.FieldByName('CIAID').AsString;
     dblcNota.Text := DM1.cdsCobraCxC.FieldByName('LICOID').AsString;
   end;

   wbSumat     := True;
   wbImprime   := False;
   wbNuevo     := False;
   wbSube      := True;
   wbGraba     := True;
   wbCancelado := False;
   wbCancel2   := True;
   wbAnula     := False;

// A pedido de RAN  22/11/2001
{      sSQL:=' SELECT CIAID,LICOID,FPAGOID,FPAGODES,TMONIDPAGO,TGE103.TMONABR TMONABR, SUM(LICOMTOABOLOC) LICOMTOABOLOC, SUM(LICOMTOABOEXT) LICOMTOABOEXT FROM CXC320 '+
            ' LEFT JOIN TGE103 ON TGE103.TMONID=CXC320.TMONIDPAGO '+
            ' WHERE LICOID='+QuotedStr(dblcNota.text)+' AND CIAID='+QuotedStr(dblcCia.Text)+
            ' GROUP BY CIAID,LICOID,FPAGOID,FPAGODES,TMONIDPAGO,TGE103.TMONABR ';}
{      sSQL:=' SELECT CIAID,LICOID,FPAGOID,FPAGODES,TMONIDPAGO,TGE103.TMONABR TMONABR, SUM(LICOMTOABOLOC) LICOMTOABOLOC, SUM(LICOMTOABOEXT) LICOMTOABOEXT FROM CXC320 '+
            ' LEFT JOIN TGE103 ON TGE103.TMONID=CXC320.TMONIDPAGO '+
            ' WHERE LICOID='+QuotedStr(dblcNota.text)+' AND CIAID='+QuotedStr(dblcCia.Text)+
            ' GROUP BY CIAID,LICOID,FPAGOID,FPAGODES,TMONIDPAGO,TGE103.TMONABR ';}

	if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
   begin
     sSQL:= ' SELECT CIAID,LICOID,FPAGOID,'+
            ' CASE WHEN FPAGOID='+quotedstr(sCHE)+' AND FECPAGO='+DM1.wRepFuncDate+''''+ FORMATDATETIME(DM1.wFormatFecha,dbdtpFecha.date)+''''+')'+' THEN ''CHEQUE DIFERIDO'' ELSE FPAGODES END FPAGODES,'+
            ' TMONIDPAGO,TGE103.TMONABR TMONABR,FECPAGO,'+
            ' CASE WHEN TMONIDPAGO='+quotedstr(DM1.wTMonLoc)+' THEN '+
            ' (CASE WHEN FPAGOID='+quotedstr(sCHE)+' AND FECPAGO='+DM1.wRepFuncDate+''''+ FORMATDATETIME(DM1.wFormatFecha,dbdtpFecha.date)+''''+')'+' THEN'+
            ' (SUM(COALESCE(LICOMTOABOLOC,0))) ELSE '+
            ' (CASE WHEN FPAGOID='+quotedstr(sCHE)+' AND FECPAGO<>'+DM1.wRepFuncDate+''''+ FORMATDATETIME(DM1.wFormatFecha,dbdtpFecha.date)+''''+')'+
            '  THEN SUM(COALESCE(LICOMTOABOLOC,0))'+
            '  ELSE (CASE WHEN FPAGOID='+quotedstr(sEFE)+' THEN '+
            '(SUM(COALESCE(LICOMTOABOLOC,0)))'+
            ' WHEN FPAGOID='+quotedstr(sNDE)+' THEN  (SUM(COALESCE(LICOMTOABOLOC,0))) END )'+
            ' END)'+
            ' END)'+
            ' ELSE (0) END     LICOMTOABOLOC, '+
            ' CASE WHEN TMONIDPAGO='+quotedstr(DM1.wTMonExt)+
            '  THEN'+
            ' (CASE WHEN FPAGOID='+quotedstr(sCHE)+' AND FECPAGO='+DM1.wRepFuncDate+''''+ FORMATDATETIME(DM1.wFormatFecha,dbdtpFecha.date)+''''+')'+
            ' THEN'+
            ' (SUM(COALESCE(LICOMTOABOEXT,0)))'+
            ' ELSE'+
            ' (CASE WHEN FPAGOID='+quotedstr(sCHE)+' AND FECPAGO<>'+DM1.wRepFuncDate+''''+ FORMATDATETIME(DM1.wFormatFecha,dbdtpFecha.date)+''''+')'+
            ' THEN'+
            ' SUM(COALESCE(LICOMTOABOEXT,0))'+
            ' ELSE (CASE WHEN FPAGOID='+quotedstr(sEFE)+
            ' THEN'+
            ' (SUM(COALESCE(LICOMTOABOEXT,0)))'+
            ' WHEN FPAGOID='+quotedstr(sNDE)+' THEN  (SUM(COALESCE(LICOMTOABOEXT,0))) END )'+
            ' END)'+
            ' END)'+
            ' ELSE (0) END     LICOMTOABOEXT'+
            ' FROM CXC320  LEFT JOIN TGE103 ON TGE103.TMONID=CXC320.TMONIDPAGO'+
            ' WHERE LICOID='+QuotedStr(dblcNota.text)+' AND CIAID='+QuotedStr(dblcCia.Text)+
            ' GROUP BY CIAID,LICOID,FPAGOID,FPAGODES,TMONIDPAGO,TGE103.TMONABR,FECPAGO';
   end
   else
   begin
     if (DM1.SRV_D = 'ORACLE') then
     begin

     end;
   end;

   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest( sSQL );
   DM1.cdsQry2.Open;

   DM1.cdsQry2.IndexFieldNames:='CIAID;LICOID;FPAGOID;TMONIDPAGO;FECPAGO';

   TNumericField(DM1.cdsQry2.FieldbyName('LICOMTOABOLOC')).displayFormat:= '###,###,###0.00';
   TNumericField(DM1.cdsQry2.FieldbyName('LICOMTOABOEXT')).displayFormat:= '###,###,###0.00';


	if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
   begin
      sSQL:= ' SELECT LICOMTOABOORI,CLAUXID,FECEMICHQ,LICOTCAMBL,CCNODOC,DOCID,CIAID,LICOID,FPAGOID,CXC320.BANCOID,TGE105.BANCOABR,FECPAGO,LICONOCHQ,CLIEID,TMONIDPAGO,TGE103.TMONABR TMONABR,LICOMTOABOLOC,LICOMTOABOEXT FROM CXC320 '+
             ' LEFT JOIN TGE103 ON TGE103.TMONID=CXC320.TMONIDPAGO '+
             ' LEFT JOIN TGE105 ON TGE105.BANCOID=CXC320.BANCOID '+
             ' WHERE LICOID='+QuotedStr(dblcNota.text)+' AND CIAID='+QuotedStr(dblcCia.Text);
   end
   else
   begin
       if (DM1.SRV_D = 'ORACLE') then
       begin

       end;
   end;

   DM1.cdsQry3.Close;
   DM1.cdsQry3.DataRequest( sSQL );
   DM1.cdsQry3.Open;
   DM1.cdsQry3.IndexFieldNames:='CIAID;LICOID;FPAGOID;TMONIDPAGO;FECPAGO';

   DM1.cdsQry3.MasterSource:=DM1.dsQry2;
   DM1.cdsQry3.MasterFields:='CIAID;LICOID;FPAGOID;TMONIDPAGO;FECPAGO';

   TNumericField(DM1.cdsQry3.FieldbyName('LICOMTOABOLOC')).displayFormat:= '###,###,###0.00';
   TNumericField(DM1.cdsQry3.FieldbyName('LICOMTOABOEXT')).displayFormat:= '###,###,###0.00';

{   (sender as tcontrol).enabled:=false;
   wmodifica:=False;
   perform(CM_DialogKey,VK_TAB,0);}
end;

procedure TFDetalleLiq.dblcTMonExit(Sender: TObject);
begin
{ if dblcTMon.text = '' then
  begin
   edtTmon.text:='';
   dbeTCambio.Text:='';
   showMessage('Ingrese un tipo de Moneda Válido');
   dblcTMon.setfocus;
  end
 else
  begin
   xDescrip := 'TMONID='+quotedstr(dblcTMon.text);
   edtTMon.text := DM1.DisplayDescrip('prvTGE','TGE103','TMONABR',xDescrip,'TMONABR');
   IF edtTMon.text <> '' then
    begin
     xDescrip := 'TMONID='+quotedstr(DM1.wTMonExt) + ' AND FECHA='+
               quotedstr(formatdatetime(DM1.wFormatFecha,dbdtpFCobra.Date));
     If dbeTCambio.text = '' then
      dbeTCambio.text := dm1.DisplayDescrip('prvTGE','TGE107','TCAMVOV',xDescrip,'TCAMVOV');
     wmodifica:=True;
    end
   else
    begin
     edtTmon.text:='';
     dbeTCambio.Text:='';
     showMessage('Ingrese un tipo de Moneda Válido');
     dblcTMon.setfocus;
    end
  end;}
end;

procedure TFDetalleLiq.ConfiguraAccesos;
begin
    if DM1.wAdmin = 'G' then
       Proc_Admin
    else
    begin
       if DM1.wModo = 'C' then
          Proc_Consul
       else
          dm1.AccesosUsuarios( DM1.wModulo,DM1.wUsuario,'2',Screen.ActiveForm.Name ) ;
    end ;
end;

procedure TFDetalleLiq.Libera_Admin;
begin
    Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFDetalleLiq.Libera_Consul;
begin

end;

procedure TFDetalleLiq.Proc_Admin;
var
    Contador : Integer ;
begin
    pnlCabecera.Enabled := False ;
    pnlCabecera2.Enabled := False ;
    pnlDetalle.Enabled := False ;
    //Array de controles y eventos
    Contador := BotonesEnPanel( pnlBotones ) ;
    setlength( A1 , Contador) ;
    setlength( A2 , Contador) ;
    Quita(A1,A2,pnlBotones) ;
    //
    pnlBotones.Enabled := True ;
end;

procedure TFDetalleLiq.Proc_Consul;
begin
    pnlCabecera.Enabled := False ;
    pnlCabecera2.Enabled := False ;
    pnlDetalle.Enabled := True ;
    pnlBotones.Enabled := False ;
end;

procedure TFDetalleLiq.LibConfigAccesos;
begin
    if DM1.wAdmin = 'G' then
       Libera_Admin
    else
    begin
       if DM1.wModo = 'C' then
          Libera_Consul ;
    end ;

end;

procedure TFDetalleLiq.Z2bbtnCancelarClick(Sender: TObject);
var
   sSQL,sClieRuc,sClieDes,sTDiario,sCheque,sTDocCh,sNoComp:string;

begin
   if MessageDlg('¿Efectuar el Ingreso a Caja del Documento?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin
        // INSERTA FORMA DE LOS PAGOS EN CAJA314
        DM1.cdsQry2.DisableControls;
        DM1.cdsQry3.DisableControls;
        DM1.cdsQry3.MasterSource:=Nil;

        sCheque:=dm1.DisplayDescrip('prvTGE','TGE112','FPAGOID','FCHQ= ''1'' or FCHQ= ''S'' ','FPAGOID');
        sTDocCh:=DM1.DisplayDescrip('prvTGE','TGE110','DOCID,TDIARID','DOCMOD=''CXC'' AND DOCTIPREG=''CH''','DOCID');
        sTDiario:=DM1.cdsQry.FieldByName('TDIARID').AsString;
        sNoComp:=DM1.StrZero(dm1.UltimoNum('prvTGE','CAJA302','ECNOCOMP',''),10);

        DM1.cdsQry3.First;
        while not DM1.cdsQry3.EOF do
        begin

          ////INSERTA EN CAJA302 CUANDO ES CHEQUE
          if (DM1.cdsQry3.FieldByName('FPAGOID').AsString=sCheque) then
          begin
            sClieRuc:=DM1.DisplayDescrip('prvTGE','TGE204','CLIERUC,CLIEDES','CLIEID='+QuotedStr(DM1.cdsQry3.FieldByName('CLIEID').AsString),'CLIERUC');
            sClieDes:=DM1.cdsQry.FieldByName('CLIEDES').AsString;

            DM1.BuscaFecha('TGE114','FECHA','Fecha',DM1.cdsQry3.FieldByName('FECEMICHQ').AsDateTime);

            sSQL:=' INSERT INTO CAJA302 (CIAID,TDIARID,ECANOMM,ECNOCOMP,CLAUXID,PROV,PROVRUC,ECFCOMP,ECFEMICH, '+
                  ' FPAGOID,DOCID,ECNODOC,TMONID,ECTCAMB,ECMTOORI,ECMTOLOC,ECMTOEXT,BANCOID,ECNOCHQ, '+
                  ' ECGIRA,ECLOTE,ECESTADO,ECCONTA,ECUSER,ECFREG,ECHREG,ECANO,ECMM,ECDD,ECSS,ECSEM,ECTRI,ECAASS,ECAASEM,ECAATRI, '+
                  ' EC_PROCE,EC_IE) '+
                  ' VALUES( '+
                  QuotedStr(DM1.cdsQry3.FieldByName('CIAID').AsString)+','+
                  QuotedStr(sTDiario)+','+
                  QuotedStr(DM1.cdsQry.FieldByName('FecAno').AsString+DM1.cdsQry.FieldByName('FecMes').AsString)+','+      // AÑOMES
                  QuotedStr(sNoComp)+','+
                  QuotedStr(DM1.cdsQry3.FieldByName('CLAUXID').AsString)+','+
                  QuotedStr(DM1.cdsQry3.FieldByName('CLIEID').AsString)+','+
                  QuotedStr(sClieRuc)+','+
                  QuotedStr(DM1.cdsQry3.FieldByName('FECEMICHQ').AsString)+','+
                  QuotedStr(DM1.cdsQry3.FieldByName('FECEMICHQ').AsString)+','+
                  QuotedStr(DM1.cdsQry3.FieldByName('FPAGOID').AsString)+','+
                  QuotedStr(DM1.cdsQry3.FieldByName('DOCID').AsString)+','+
                  QuotedStr(DM1.cdsQry3.FieldByName('CCNODOC').AsString)+','+
                  QuotedStr(DM1.cdsQry3.FieldByName('TMONIDPAGO').AsString)+','+
                  DM1.cdsQry3.FieldByName('LICOTCAMBL').AsString+','+
                  DM1.cdsQry3.FieldByName('LICOMTOABOORI').AsString+','+
                  DM1.cdsQry3.FieldByName('LICOMTOABOLOC').AsString+','+
                  DM1.cdsQry3.FieldByName('LICOMTOABOEXT').AsString+','+
                  QuotedStr(DM1.cdsQry3.FieldByName('BANCOID').AsString)+','+
                  QuotedStr(DM1.cdsQry3.FieldByName('LICONOCHQ').AsString)+','+
                  QuotedStr(sClieDes)+','+QuotedStr('0000')+','+QuotedStr('I')+','+QuotedStr('S')+','+
                  QuotedStr(DM1.wUsuario)+','+DM1.wRepFecServi+','+DM1.wRepHorServi+','+
                  QuotedStr(DM1.cdsQry.FieldByName('FecAno').AsString)+','+
                  QuotedStr(DM1.cdsQry.FieldByName('FecMes').AsString)+','+
                  QuotedStr(DM1.cdsQry.FieldByName('FecDia').AsString)+','+
                  QuotedStr(DM1.cdsQry.FieldByName('FecSS').AsString)+','+
                  QuotedStr(DM1.cdsQry.FieldByName('FecSem').AsString)+','+
                  QuotedStr(DM1.cdsQry.FieldByName('FecTrim').AsString)+','+
                  QuotedStr(DM1.cdsQry.FieldByName('FecAASS').AsString)+','+
                  QuotedStr(DM1.cdsQry.FieldByName('FecAATri').AsString)+','+
                  QuotedStr(DM1.cdsQry.FieldByName('FecAASem').AsString)+','+
                  QuotedStr('0')+','+QuotedStr('I')+')';
            try
              DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
            except
            end;


          end;

          DM1.cdsDetFPago.Insert;
          DM1.cdsDetFPago.FieldByName('CIAID').AsString:=DM1.cdsQry3.FieldByName('CIAID').AsString;
          DM1.cdsDetFPago.FieldByName('FPAGOID').AsString:=DM1.cdsQry3.FieldByName('FPAGOID').AsString;
          DM1.cdsDetFPago.FieldByName('BANCOID').AsString:=DM1.cdsQry3.FieldByName('BANCOID').AsString;
          DM1.cdsDetFPago.FieldByName('TMONID').AsString:=DM1.cdsQry3.FieldByName('TMONIDPAGO').AsString;
          if (DM1.cdsQry3.FieldByName('TMONIDPAGO').AsString=DM1.wTMonLoc) then
          begin
            DM1.cdsDetFPago.FieldByName('FC_RECIBIDO').AsFloat:=DM1.cdsQry3.FieldByName('LICOMTOABOLOC').AsFloat;
            DM1.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat:= DM1.cdsQry3.FieldByName('LICOMTOABOLOC').AsFloat;
          end
          else
          begin
            DM1.cdsDetFPago.FieldByName('FC_RECIBIDO').AsFloat:=DM1.cdsQry3.FieldByName('LICOMTOABOEXT').AsFloat;
            DM1.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat:=DM1.cdsQry3.FieldByName('LICOMTOABOEXT').AsFloat;
          end;

          DM1.cdsDetFPago.FieldByName('FC_DEVOLVER').AsFloat:=0;
          DM1.cdsDetFPago.FieldByName('FC_ESTADO').AsString:='C';
          DM1.cdsDetFPago.FieldByName('FC_FCANC').AsDateTime:=Now;
          DM1.cdsDetFPago.FieldByName('TC_USADO').AsFloat:=DM1.cdsQry3.FieldByName('LICOTCAMBL').AsFloat;
          DM1.cdsDetFPago.FieldByName('ECNOCHQ').AsString:=DM1.cdsQry3.FieldByName('LICONOCHQ').AsString;
          DM1.cdsDetFPago.FieldByName('CORRE').AsInteger:=-1;
          DM1.cdsDetFPago.FieldByName('CCTREC').AsString:='LI';
          DM1.cdsDetFPago.FieldByName('DOCID').AsString:=DM1.cdsQry3.FieldByName('DOCID').AsString;
          DM1.cdsDetFPago.FieldByName('CCNODOC').AsString:=dblcNota.text;
          DM1.cdsDetFPago.FieldByName('FC_MTOLOC').AsFloat:=DM1.cdsQry3.FieldByName('LICOMTOABOLOC').AsFloat;
          DM1.cdsDetFPago.FieldByName('FC_MTOEXT').AsFloat:=DM1.cdsQry3.FieldByName('LICOMTOABOEXT').AsFloat;
          DM1.cdsDetFPago.Post;

          //DIVIDIR EL LA FORMA DE PAGO PARA INSERTARLA EN LA CABECERA.
        //INSERTA INGRESO A CAJA EN LA CXC303 DESDE LA FORMA DE PAGO
        z2bbtnSumatClick(Sender);

        DM1.cdsCobraCXC.Insert;
        DM1.cdsCobraCXC.FieldByName('CIAID').AsString:=dblcCia.text;
        DM1.cdsCobraCXC.FieldByName('NOTACOB').AsString:=dblcNota.text;
        DM1.cdsCobraCXC.FieldByName('NCOESTADO').AsString:='C';
        DM1.cdsCobraCXC.FieldByName('CCFEMIS').AsDateTime:=dateS;
        DM1.cdsCobraCXC.FieldByName('DOCID').AsString:=DM1.DisplayDescrip('prvTGE','TGE110','DOCID','DOCMOD=''CXC'' AND DOC_FREG=''C''','DOCID');
        DM1.cdsCobraCXC.FieldByName('CCNODOC').AsString:=dblcNota.text;
        DM1.cdsCobraCXC.FieldByName('NCOTCAMB').AsFloat:=DM1.cdsCLiqCob1.FieldByName('LICOTCAMB').AsFloat;

        DM1.cdsCobraCXC.FieldByName('TMONID').AsString:=DM1.cdsQry3.FieldByName('TMONIDPAGO').AsString;

        if (DM1.cdsQry3.FieldByName('TMONIDPAGO').AsString=DM1.wTMonLoc) then
        begin
          DM1.cdsCobraCXC.FieldByName('NCOMTOORI').AsFloat:=DM1.cdsQry3.FieldByName('LICOMTOABOLOC').AsFloat;
        end
        else
        begin
          DM1.cdsCobraCXC.FieldByName('NCOMTOORI').AsFloat:=DM1.cdsQry3.FieldByName('LICOMTOABOEXT').AsFloat;
        end;

        DM1.cdsCobraCXC.FieldByName('ECCOBLOC').AsFloat:=DM1.cdsQry3.FieldByName('LICOMTOABOLOC').AsFloat;
        DM1.cdsCobraCXC.FieldByName('ECCOBEXT').AsFloat:=DM1.cdsQry3.FieldByName('LICOMTOABOEXT').AsFloat;
        DM1.cdsCobraCXC.FieldByName('NCOMTOLOC').AsFloat:=DM1.cdsQry3.FieldByName('LICOMTOABOLOC').AsFloat;
        DM1.cdsCobraCXC.FieldByName('NCOMTOEXT').AsFloat:=DM1.cdsQry3.FieldByName('LICOMTOABOEXT').AsFloat;
        DM1.cdsCobraCXC.FieldByName('NCOUSER').AsString:=DM1.wUsuario;
        DM1.cdsCobraCXC.FieldByName('NCOFREG').AsDateTime:=DateS;
        DM1.cdsCobraCXC.FieldByName('NCOHREG').AsDateTime:=Time;
        DM1.cdsCobraCXC.FieldByName('CCTREC').AsString:='LI';
        cdsPost(DM1.cdsCobraCxC);

        DM1.cdsQry3.Next;
        end;
        DM1.cdsQry3.MasterSource:=DM1.dsQry2;
        DM1.cdsQry3.EnableControls;
        DM1.cdsQry2.EnableControls;


        // ACTUALIZAR EL FLAG DE LA CABECERA
        DM1.cdsCLiqCob1.Edit;
        DM1.cdsCLiqCob1.FieldByName('LICOAPROB').AsString:=DM1.wModulo;
        DM1.cdsCLiqCob1.Post;

        lblEstado.Caption    := 'Aceptado  ';
        pnlCabecera.Enabled  := False;
        pnlCabecera2.Enabled := False;
        pnlDetalle.Enabled := True;
        pnlBotones.Enabled:=True;
        z2bbtnOk.Enabled     := False;
        Z2bbtnCancelar.Enabled:=False;
        z2bbtnCancel.Enabled := False;
        z2bbtnSube.Enabled   := False;
        z2bbtnSumat.Enabled  := False;
        ShowMessage('Registro Aceptado');
      end;
end;

procedure TFDetalleLiq.GrabaEstadoFPago(xEstado: string);
begin
  with dm1.cdsDetFPago do
  begin
    DisableControls ;
    First ;
    while not Eof do
    begin
        Edit ;
        FieldBYname('FC_ESTADO').AsString  := xEstado ;
        fieldbyname('FC_FCANC').AsDateTime := dbdtpFCobra.date ;
        Post ;
        Next ;
    end;
    First ;
    EnableControls ;
  end ;
end;


procedure TFDetalleLiq.ValidaCancelacion;
begin
   if dm1.wTMonLoc=trim( dblcTMon.Text ) then
   begin
      if OperClientDataSet(DM1.cdsCanjeCxC, 'SUM(CCMTOLOC)', '') <>
         OperClientDataSet(DM1.cdsDetFPago, 'SUM(FC_MTOLOC)','') then
         Raise Exception.create('El Monto Provisionado y ' + #13 + 'La Cancelación no concuerdan') ;
   end
   else
      if OperClientDataSet(DM1.cdsCanjeCxC, 'SUM(CCMTOEXT)', '') <>
         OperClientDataSet(DM1.cdsDetFPago, 'SUM(FC_MTOEXT)','') then
         Raise Exception.create('El Monto Provisionado y ' + #13 + 'La Cancelación no concuerdan') ;
end;


procedure TFDetalleLiq.ActualizaPagados;
begin
   DM1.cdsCanjeCxC.DisableControls;
   DM1.cdsCanjeCxC.First;
   While not DM1.cdsCanjeCxC.Eof do
   Begin
      if DM1.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
         VarArrayOf([
                      DM1.cdsCanjeCxC.fieldbyname('CIAID').AsString,
                      DM1.cdsCanjeCxC.fieldbyname('TDIARID').AsString,
                      DM1.cdsCanjeCxC.fieldbyname('CCANOMM').AsString,
                      DM1.cdsCanjeCxC.fieldbyname('CCNOREG').AsString
                    ]),[]) then
      begin
         DM1.cdsMovCxC.edit;
         DM1.cdsMovCxC.fieldbyname('CCPAGLOC').AsFloat :=
                       DM1.cdsMovCxC.fieldbyname('CCMTOLOC').AsFloat -
                       DM1.cdsMovCxC.fieldbyname('CCSALLOC').AsFloat  ;
         DM1.cdsMovCxC.fieldbyname('CCPAGEXT').AsFloat :=
                       DM1.cdsMovCxC.fieldbyname('CCMTOEXT').AsFloat -
                       DM1.cdsMovCxC.fieldbyname('CCSALEXT').AsFloat  ;

         If DM1.cdsMovCxC.fieldbyname('TMONID').Value=DM1.wTMonLoc then
         begin
            DM1.cdsMovCxC.fieldbyname('CCPAGORI').AsFloat :=
                                      DM1.cdsMovCxC.fieldbyname('CCPAGLOC').AsFloat ;
            If DM1.cdsMovCxC.fieldbyname('CCSALLOC').AsFloat <= 0.01 then
               DM1.cdsMovCxC.fieldbyname('CCESTADO').AsString := 'C';
         end
         else
         begin
            DM1.cdsMovCxC.fieldbyname('CCPAGORI').AsFloat :=
                                      DM1.cdsMovCxC.fieldbyname('CCPAGEXT').AsFloat ;
            If DM1.cdsMovCxC.fieldbyname('CCSALEXT').AsFloat <= 0.01 then
               DM1.cdsMovCxC.fieldbyname('CCESTADO').AsString := 'C';
         end;
         DM1.cdsMovCxC.fieldbyname('CCTCAMPA').AsFloat := DM1.cdsCanjeCxCDoc.fieldbyname('CCTCAMCJE').AsFloat ;
         DM1.cdsMovCxC.post ;
      end
      else
      begin
            Showmessage('Error en la busqueda del movimiento') ;
      end ;

      DM1.cdsCanjeCxC.Next ;
   end;
   DM1.cdsMovCxC.First;
   DM1.cdsCanjeCxC.First;

   DM1.cdsCanjeCxC.EnableControls;
end;


procedure TFDetalleLiq.FormCreate(Sender: TObject);
var
 xsql : string;
begin
    setlength(A4digitos,1) ;
    A4digitos[0] := dbeTcambio ;

    xsql := 'SELECT * FROM TGE105 WHERE BCOTIPCTA='+quotedstr('C');
    DM1.cdsBancoEgr.close;
    DM1.cdsBancoEgr.datarequest(xsql);
    //**2002/04/26 - pjsv
    Faccesos.FiltraTabla( DM1.cdsBancoEgr,'TGE105', 'BANCOID' );
    //**
   cf1 := TControlFoco.Create ;
end;

procedure TFDetalleLiq.dbeTCambioEnter(Sender: TObject);
begin
{    strTmp := TCustomEdit(Sender).Text ;}
end;

procedure TFDetalleLiq.dblcBancoExit(Sender: TObject);
var sWhere: string;
begin
    IF z2bbtnCancel.focused then exit;

    sWhere := 'BANCOID='+quotedstr(dblcBanco.text);
    DM1.Filtracds(DM1.cdsQry,'SELECT BANCOID, BANCONOM, CUENTAID, BCOTIPCTA FROM TGE105 WHERE '+sWhere);
    if DM1.cdsQry.FieldByName('BANCOID').asString = '' Then
    begin
      Showmessage('Banco no existe');
      dblcBanco.Text := '';
      dblcBanco.setfocus;
    end
    else
    begin
      edtBanco.Text := DM1.cdsQry.FieldByName('BANCONOM').asString;
//      edtCuenta.Text:= DM1.cdsQry.FieldByName('CUENTAID').asString;
{      If DM1.cdsQry.FieldByName('BCOTIPCTA').asString = 'C'
      then dblcTMon.Enabled := True
      else dblcTMon.Enabled := False ;
      wmodifica:=True;}
     end;
end;

procedure TFDetalleLiq.Validacab;
begin
 // consistencia de Datos
   if length(dblcCia.Text)=0 then
   begin
      dblcCia.SetFocus ;
      raise exception.Create('Falta Codigo de Compañía');
   end ;
   if length(dblcNota.Text)=0 then
   begin
      dblcNota.SetFocus ;
      raise exception.Create('Falta Nota de Cobranza');
   end ;
   if (length(dblcdClie.Text)=0)  then
   begin
      dblcdClie.SetFocus ;
      raise exception.Create('Faltan Datos del Cliente');
   end;
   if dbdtpFCobra.Date=0 then
   begin
     dbdtpFCobra.SetFocus ;
     raise exception.Create('Falta Fecha de Orden de Cobranza');
   end;

   if length(dblcTMon.Text)=0 then
   begin
      dblcTMon.SetFocus ;
      raise exception.Create('Falta Tipo de Moneda');
   end ;

   if length(dbeTCambio.Text)=0 then
   begin
      dbeTCambio.SetFocus ;
      raise exception.Create('Falta Tipo de Cambio')
   end
   else
      if strtofloat(dbeTCambio.Text)<=0 then
      begin
         dbeTCambio.SetFocus ;
         raise exception.Create('Tipo de Cambio Errado');
      end ;

   if trim(dblcBanco.Text) = '' then
   begin
      dblcBanco.SetFocus ;
      raise exception.Create('Ingrese Caja');
   end ;
end;

procedure TFDetalleLiq.dbdtpFCobraEnter(Sender: TObject);
begin
{      strTmp := dbdtpFCobra.Text ;}
end;

procedure TFDetalleLiq.dbeElaboKeyPress(Sender: TObject; var Key: Char);
begin
   if key in ['0'..'9'] then
      key := #0;
end;

procedure TFDetalleLiq.BorraGrid;
begin
    with dm1.cdsCanjeCxC do
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

procedure TFDetalleLiq.FormDestroy(Sender: TObject);
begin
   cf1.Free ;
end;

procedure TFDetalleLiq.dblcCiaExit(Sender: TObject);
var sWhere,sCob:string;
begin
   sWhere:='CIAID='+QuotedStr(dblcCia.Text)+' AND COCONS='+QuotedStr('S');
   sCob:=dm1.DisplayDescrip('prvTGE','CXC206','COID',sWhere,'COID');
   xDescrip:='CIAID='+''''+dblcCia.Text+'''';
   edtCia.Text:=DM1.DisplayDescrip('prvTGE','TGE101','CIAABR',xDescrip,'CIAABR');

   xSQL:='Select * from CXC318 '
//        +'Where CIAID='''+dblcCia.Text+''' and LICOID<>'''' AND LICOAPROB IS NULL';
        +'Where CIAID='''+dblcCia.Text+''' and LICOID<>'''' AND LICOAPROB IS NULL AND COID='+QuotedStr(sCob);
   DM1.cdsCLiqCob1.Close;
   DM1.cdsCLiqCob1.DataRequest( xSQL );
   DM1.cdsCLiqCob1.Open;
//   if DM1.wModo='A' then
//     dblcNota.SetFocus;
end;

procedure TFDetalleLiq.dblcNotaEnter(Sender: TObject);
begin
{   if not DM1.cdsCLiqCob1.Active then
      dblcCia.SetFocus;}
 DesabilitaClient();

end;

procedure TFDetalleLiq.Z2bbtnAdicFPagoClick(Sender: TObject);
begin
   pnlBotones.Enabled  := False;
   PnlFPago.BringToFront;
   BlanqueaEdits(pnlFPago);
   PnlFPago.Visible:= True;
   PnlFpago.setfocus;
   perform(CM_DialogKey,VK_TAB,0);
   Inserta;
end;

procedure TFDetalleLiq.Inserta;
begin
  with dm1.cdsDetFPago do
  begin
    Insert;
    FieldByName('CORRE').AsInteger := recno;
    if recordcount = 0 then
      if dm1.wTMonLoc = trim(dblcTMon.Text) then
         dbeRecibido.Text := dbgDetFPago.columnbyname('DEMTOLOC').FooterValue
      else
         dbeRecibido.Text := dbgDetFPago.columnbyname('DEMTOORI').FooterValue;

    dblcTMonC.text       := dblcTMon.Text;
    edtTMonC.Text        := edtTMon.Text;
    dbeRecibido.Enabled  := True;
    dbeACobrar.Enabled   := False;
    CalculaResto;
    dblcFormPago.SetFocus;
  end;

end;

procedure TFDetalleLiq.CalculaResto;
var
    xCampo1, xCampo2  : String;
    xMtoLoc, xMtoLoP  : Double;
begin
   if dm1.cdsDetFPago.State = dsedit then
   begin
      if dblcTMonC.Text = dm1.wTMonLoc then
      begin
         xCampo1:= 'CCMTOLOC';
         xCampo2:= 'FC_MTOLOC';
      end
      else
      begin
         xCampo1:= 'CCMTOEXT';
         xCampo2:= 'FC_MTOEXT';
      end;

      xMtoLoc:= OperClientDataSet( Dm1.cdsCanjeCxC , 'SUM( '+xCampo1+' )', '' );
      xMtoLoP:= OperClientDataSet( Dm1.cdsDetFPago , 'SUM( '+xCampo2+' )', '' );

      dbeResta.Text:=CurrToStr( xMtoLoc - xMtoLoP +
                                dm1.cdsdetfpago.fieldbyname('FC_RECIBIDO').AsFloat );
   end
   else
      if dm1.cdsDetFPago.State = dsInsert then
      begin
         if dblcTMonC.Text = dm1.wTMonLoc then
         begin
            xCampo1 := 'CCMTOLOC';
            xCampo2 := 'FC_MTOLOC';
         end
         else
         begin
            xCampo1 := 'CCMTOEXT';
            xCampo2 := 'FC_MTOEXT';
         end;
         try
            xMtoLoc:= OperClientDataSet( Dm1.cdsCanjeCxC , 'SUM( '+xCampo1+' )', '' );
            xMtoLoP:= OperClientDataSet( Dm1.cdsDetFPago , 'SUM( '+xCampo2+' )', '' );

            dbeResta.Text:=currtostr( xMtoLoc - xMtoLoP );
         except
            dbeResta.Text := currtostr ( strtocurr( trim(dbgDetFPago.ColumnByName(xCampo1).FooterValue) ));
         end;
      end;
end;


procedure TFDetalleLiq.BitBtn2Click(Sender: TObject);
begin
   if dm1.cdsDetFPago.State in [dsedit,dsinsert] then
   begin
      if MessageDlg(' Añadir Cancelará los Cambios Actuales'+ #13 +
                    '     ¿ Desea Continuar ?     ',mtConfirmation,[mbYes, mbNo],0) = mrNo then
         exit;
   end;
   dm1.cdsDetFPago.Cancel;
   BlanqueaEdits(pnlFPago);
   Inserta;
end;

procedure TFDetalleLiq.Z2OkDetalleClick(Sender: TObject);
var
   xNuevo : Boolean;
begin
   ValidacionDatos;
   ValidacionTjaChq;
   ValidacionCobradoTotal;
   if dm1.cdsDetFPago.state = dsinsert then
      xNuevo := true
   else
      xNuevo := false;
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
     pnlBotones.Enabled   := True;
   end
end;

procedure TFDetalleLiq.ValidacionDatos;
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

procedure TFDetalleLiq.ValidacionTjaChq;
begin
    if dblcFormPago.Text = dm1.wEFECTIVO then
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

    if dblcFormPago.Text = dm1.wTARJETA then
    begin
       if trim(dblcTarjeta.text) = '' then
       begin
          dblcTarjeta.SetFocus;
          Raise Exception.Create ('Ingrese Tipo de Tarjeta');
       end;
    end;
end;

procedure TFDetalleLiq.ValidacionCobradoTotal;
begin
   if chkAsignaResto.Checked then
      Exit;
end;

procedure TFDetalleLiq.GrabaDetalle;
var
    xMonLoc ,
    xMtoExt : Currency;
begin
    with dm1.cdsDetFPago do
    begin
        FieldByName('CIAID').AsString          := dblcCia.text;
        FieldByName('CCNODOC').AsString        := dblcNota.text;
        FieldByName('CCTREC').AsString         := 'CO';
        FieldByName('FPAGOID').AsString        := dblcFormPago.text;
        FieldByName('BANCOID').AsString        := dblcBancoFPago.text;
        FieldByName('TJAID').AsString          := dblcTarjeta.text;
        FieldByName('TMONID').AsString         := dblcTMOnC.Text;
        FieldByName('ECNOCHQ').AsString        := TRIM(dbeNOChq.Text);
        FieldByName('FC_RECIBIDO').AsString    := dbeRecibido.text;
        FieldByName('TC_USADO').AsString       := dbeTCambio.Text;
        FieldByName('FC_COBRADO').AsString     := FieldByName('FC_RECIBIDO').AsString;
        FieldByName('FC_DEVOLVER').AsString    := '0.00';
//        FieldByName('CPTOID').AsString         := trim(dblcdCnp.Text);

        //Calcular y grabar equivalentes
        if dblctmonc.Text = dm1.wTMonLoc then
        begin
           xMonLoc := FieldByName('FC_COBRADO').AsFloat;
           xMtoExt := Redondea( FieldByName('FC_COBRADO').AsFloat / FieldByName('TC_USADO').AsFloat );
        end
        else
        begin
           xMonLoc := FieldByName('FC_COBRADO').AsFloat * FieldByName('TC_USADO').AsFloat;
           xMtoExt := FieldByName('FC_COBRADO').AsFloat;
        end;
        FieldByName('FC_MTOLOC').AsFloat  := Redondea( xMonLoc );
        FieldByName('FC_MTOEXT').AsFloat  := Redondea( xMtoExt );
        //fin de calcular
        Post;
    end;
end;

procedure TFDetalleLiq.AcumulaDetFPago;
var
   xMtoLoc,   xMtoExt   : Currency;
   xCountLoc, xCountExt : Double;
   xMonedaBase : String;
begin
   xMtoLoc   :=  OperClientDataSet(dm1.cdsDetFPago , 'SUM(FC_MTOLOC)','');
   xMtoExt   :=  OperClientDataSet(dm1.cdsDetFPago , 'SUM(FC_MTOEXT)','');

   dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue  := cajadec(currtostr(xMtoLoc));
   dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue  := cajadec(currtostr(xMtoExt));

   xCountLoc :=  OperClientDataSet(dm1.cdsDetFPago , 'COUNT(*)','TMONID=''' + dm1.wTMonLoc + '''');
   xCountExt :=  OperClientDataSet(dm1.cdsDetFPago , 'COUNT(*)','TMONID=''' + dm1.wTMonExt + '''');
   if ((xCountLoc > 0) and (xCountExt=0)) or ((xCountLoc = 0) and (xCountExt > 0)) then
   begin
      xMonedaBase := dm1.cdsDetFPago.fieldbyname('TMONID').AsString;
   end
   else
   begin
      xMonedaBase := trim( dblcTMon.Text );
   end;
end;

procedure TFDetalleLiq.BitBtn1Click(Sender: TObject);
begin
   dm1.cdsDetFPago.Cancel;
   pnlFPago.SetFocus;
   pnlFPago.Visible := False;
   pnlBotones.Enabled   := True;
end;

procedure TFDetalleLiq.dblcFormPagoExit(Sender: TObject);
begin
   xDescrip := 'FPAGOID='+quotedstr(dblcFormPago.text);
   edtFormPago.text := dm1.DisplayDescrip('prvTGE','TGE112','FPAGODES',xDescrip,'FPAGODES');
   if (trim(edtFormPago.text) <> '' ) then
   begin
      if dblcFormPago.text = dm1.wEFECTIVO then
      begin
           DesHabilitaControles([dblcBancofPago,dblcTarjeta,dbeNOChq]);
           dblcBancofPago.Text   := '';
           edtBcoFPago.text    := '';
           dblcTarjeta.text := '';
           edtTarjeta.text  := '';
           dbeNOChq.Text    := '';
      end
      else
        if dblcFormPago.text = dm1.wCHEQUE then
        begin
         cajautil.HabilitaControles ([dbeNOChq,dblcBancofPago]);
         dblcTarjeta.text := '';
         edtTarjeta.text  := '';
         dbeNOChq.Text    := '';
         dblcBancofPago.SetFocus;
        end
        else
          if dblcFormPago.text = dm1.wTARJETA then
          begin
            cajautil.HabilitaControles ([dbeNOChq,dblcBancofPago,dblcTarjeta]);
            dblcTarjeta.text := '';
            edtTarjeta.text  := '';
            dbeNOChq.Text    := '';
            dblcBancofPago.SetFocus;
          end;
   end;
end;

procedure TFDetalleLiq.dblcTMonCExit(Sender: TObject);
begin
   xDescrip := 'TMONID='+quotedstr(dblcTMonC.text);
   edtTMonC.text := dm1.displaydescrip('prvTGE','TGE103','TMONABR',xDescrip,'TMONABR');
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

procedure TFDetalleLiq.dbeRecibidoChange(Sender: TObject);
begin
    dbeACobrar.Enabled := True;
end;

procedure TFDetalleLiq.dbeRecibidoEnter(Sender: TObject);
begin
   strTmp := dbeRecibido.Text;
end;

procedure TFDetalleLiq.dbeRecibidoExit(Sender: TObject);
var
   Tmp : String;
begin
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

procedure TFDetalleLiq.dbeACobrarEnter(Sender: TObject);
begin
   strTmp := dbeACobrar.Text;
end;

procedure TFDetalleLiq.dbeACobrarExit(Sender: TObject);
begin
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

procedure TFDetalleLiq.dblcBancoFPagoExit(Sender: TObject);
begin
   xDescrip := 'BANCOID='+quotedstr(dblcBancoFPago.text);
   edtBcoFPago.text := dm1.displaydescrip('prvTGE','TGE105','BANCONOM',xDescrip,'BANCONOM');
   If dblcBancofPago.text = '' then
    begin
     showmessage('Falta Banco');
     dblcBancofPago.SetFocus;
    end;
end;

procedure TFDetalleLiq.dblcTarjetaExit(Sender: TObject);
begin
   xDescrip := 'TJAID='+quotedstr(dblcTarjeta.text);
   edtTarjeta.text := dm1.displaydescrip('prvTGE','TGE167','TJADES',xDescrip,'TJADES');
   If dblcTarjeta.text = '' then
    begin
     showmessage('Falta Tarjeta');
     dblcTarjeta.SetFocus;
    end;
end;

procedure TFDetalleLiq.chkAsignaRestoClick(Sender: TObject);
begin
  if chkAsignaResto.Checked then
  begin
      dbeRecibido.Enabled  := False;
      dbeACobrar.Enabled   := False;
      if dblcTMonC.Text = dm1.wTMonLoc then
//wmc1010         dbeRecibido.Text := dbeDifLoc.text
      else
//wmc1010         dbeRecibido.Text := dbeDifExt.text;
      dbeRecibidoExit(nil);
  end
  else
  begin
      dbeRecibido.Enabled  := True;
      dbeACobrar.Enabled   := True;

  end;
end;

procedure TFDetalleLiq.dblcdFEfecExit(Sender: TObject);
begin
{  xDescrip := 'FLUEFEID='+quotedstr(dblcdFEfec.text);
  dbeFEfec.text := DM1.DisplayDescrip('prvTGE','TGE217','FLUEDES',xDescrip,'FLUEFEDES');}
end;

procedure TFDetalleLiq.NotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFDetalleLiq.DesabilitaClient;
begin

   dblcdCobrador.DataSource:=NIL;
   dblcdCobrador.DataField:='';

   dbeCobrador.DataSource:=NIL;
   dbeCobrador.DataField:='';

   dbeZona.DataSource:=NIL;
   dbeZona.DataField:='';
   edtZona.Clear;

   dbdtpFecha.DataSource:=NIL;
   dbdtpFecha.DataField:='';
end;

procedure TFDetalleLiq.dbgDocCanjeRowChanged(Sender: TObject);
begin
//    z2bbtnSumatClick(Sender);
end;

end.


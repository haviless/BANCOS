unit Caja207;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Buttons, wwdbdatetimepicker, Mask, wwdbedit, wwdblook, Wwdbdlg,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, DBGrids, DB, wwSpeedButton,
  wwDBNavigator, ComCtrls, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe, ppPrnabl, ppCtrls, ppModule, daDatMod, ppBands,
  ppVar,CAJADM, Caja224, Variants;

type
  TFCobranza = class(TForm)
    pnlCabecera: TPanel;
    lblCia: TLabel;
    lblOCobra: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    pnlCabecera2: TPanel;
    lblFEmis: TLabel;
    lblTMon: TLabel;
    lblTCambio: TLabel;
    lblClie: TLabel;
    lblClieRuc: TLabel;
    dbdtpFCobra: TwwDBDateTimePicker;
    edtTMon: TEdit;
    dbeTCambio: TwwDBEdit;
    z2bbtnCancel: TBitBtn;
    z2bbtnOK: TBitBtn;
    dblcTMon: TwwDBLookupCombo;
    dblcdClie: TwwDBLookupComboDlg;
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
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine4: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppFooterBand1: TppFooterBand;
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
    dbeOCobra: TwwDBEdit;
    dbeDesClie: TwwDBEdit;
    edtClieRUC: TEdit;
    z2bbtnOKCab: TBitBtn;
    ppLblCia: TppLabel;
    pplblNumero: TppLabel;
    pplblFecNC: TppLabel;
    pplblClienteID: TppLabel;
    pplblCliente: TppLabel;
    pplblTipCamb: TppLabel;
    pplblMoneda: TppLabel;
    pplblElaboradopor: TppLabel;
    pplblAprobadoPor: TppLabel;
    Z2bbtnCancelar: TBitBtn;
    Z2bbtnConsultar: TBitBtn;
    lblBanco: TLabel;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TEdit;
    edtCuenta: TEdit;
    lblCuenta: TLabel;

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
    procedure dblcdClieExit(Sender: TObject);
    procedure edtClieRUCExit(Sender: TObject);
    procedure z2bbtnCancel2Click(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
    procedure ppDBText5Print(Sender: TObject);
    procedure ppDBCalc1Print(Sender: TObject);
    procedure dbgDocCanjeColExit(Sender: TObject);
    procedure z2bbtnNuevoClick(Sender: TObject);
    procedure z2bbtnSubeClick(Sender: TObject);
    procedure z2bbtnAnulaClick(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure dbdtpFCobraExit(Sender: TObject);
    procedure ActPnlBotones;
    procedure dbgDocCanjeCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbeOCobraExit(Sender: TObject);
    procedure edtClieRUCChange(Sender: TObject);
    procedure dbeGiradoAChange(Sender: TObject);
    procedure dbdtpFCobraChange(Sender: TObject);
    procedure dbeNoChqChange(Sender: TObject);
    procedure dbeElaboChange(Sender: TObject);
    procedure dbeAprobChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure dbgDocCanjeCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure dblcTMonExit(Sender: TObject);
    procedure Z2bbtnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeTCambioEnter(Sender: TObject);
    procedure Z2bbtnConsultarClick(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbdtpFCobraEnter(Sender: TObject);
    procedure dbeElaboKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    cf1: TControlFoco;
    A1 : Array of Integer ;
    A2 : Array Of TNotifyEvent ;
    A2digitos ,A4digitos : Array of TWinControl ;
    strTmp: string;

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
  public
    { Public declarations }
    Function  ExisteMovCxC(xxCia,xxTDiario,xxAAMM,xxNoReg:String):Boolean;
  end;

var
  FCobranza : TFCobranza;
  xSQL    : String;
  xFlagOk : Boolean;
  wbSumat, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,wbConsultar,
  wbcancel2: Boolean;
  wmodifica: Boolean;

implementation

Uses CAJAUTIL;
{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}

procedure TFCobranza.FormActivate(Sender: TObject); //ok rlp
begin

// Inicia Datos para que los DBEdit no se vean con datos llenos
   If DM1.wModo='A' then
      IniciaDatos
   else
   begin
      dblcCia.Text  := DM1.cdsCobraCxC.FieldByName( 'CIAID' ).AsString;
      dbeOCobra.Text:= DM1.cdsCobraCxC.FieldByName( 'NOTACOB' ).AsString;
      MuestraDatos;
   end;

//
//   ConfiguraAccesos ;
//
end;


procedure TFCobranza.MuestraDatos;
begin
   Z2bbtnOkCab.Enabled := False ;
   Z2bbtnNuevo.Visible     := False ;

   dblcdClie.Text  := DM1.cdsCobraCxC.FieldByName('CLIEID').Value;
   edtClieRUC.Text := DM1.cdsCobraCxC.FieldByName('CLIERUC').Value;
//Datos Adicionales de Caja
   if DM1.RecuperarDatos('TGE105','*','BANCOID=''' + dm1.cdsCobraCxC.fieldbyname('bancoid').AsString +'''') then
   begin
      dblcBanco.Text := dm1.cdsCobraCxC.fieldbyname('BANCOID').AsString ;
      edtBanco.Text  := dm1.cdsRec.fieldbyname('BANCOABR').AsString ;
      edtCuenta.Text := dm1.cdsCobraCxC.fieldbyname('CUENTAID').AsString ;
   end ;
   dbdtpFCobra.date := dm1.cdsCobraCxC.fieldbyname('NCOFCOB').AsDateTime ;
   dblcTMon.Text    := dm1.cdsCobraCxC.fieldbyname('TMONID').AsString ;
   dbeTCambio.Text  := dm1.cdsCobraCxC.fieldbyname('NCOTCAMB').AsString ;
   dbeElabo.Text    := dm1.cdsCobraCxC.fieldbyname('NCOELABO').AsString ;
   dbeAprob.Text    := dm1.cdsCobraCxC.fieldbyname('NCOAPROB').AsString ;
//fin de datos Adicionales
   pnlCabecera.Enabled:= False;

   if DM1.cdsCobraCxC.FieldByName('NCOESTADO').Value='I' then
   begin     //Incompleto

      // Activar modo de Editado
      DM1.cdsCobraCxC.Edit;

      // Estado de componentes
      pnlCabecera.Enabled  :=  False;    // Desactivar Panel1
      pnlCabecera2.Enabled :=  True;     // Activar Panel2
      //1805i
      pnlBotones.Enabled   :=  False ;
      //1805f
      dblcdClie.Enabled    :=False;     // El Cliente ya no se puede modificar
      edtClieRUC.Enabled :=False;

      z2bbtnOk.Enabled       := True;
      z2bbtnCancel.Enabled   := True;

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
      pnlPendientes.Enabled:= False;
      pnlDocCanje.Enabled  := True;
      dbgDocCanje.ReadOnly := True;     // Grid en Solo Lectura

      pnlBotones.Enabled   := True;     // Activar Panel de Botones

      z2bbtnOk.Enabled        := False;
      z2bbtnCancel.Enabled    := False;

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
      pnlPendientes.Enabled:= False;
      pnlDocCanje.Enabled  := True;
      dbgDocCanje.ReadOnly := True;     // Grid en Solo Lectura

      pnlBotones.Enabled   := True;     // Activar Panel de Botones

      z2bbtnOk.Enabled        := False;
      z2bbtnCancel.Enabled    := False;

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

   ////////// 1805f
   z2bbtnSumatClick( Self );

   // Filtramos todos los Documentos que sean ordenes de cobranza TCanjeId='OC'

   // vhn 23/01/2001
   xSQL:='Select * from CXC304 '
        +'Where CIAID='''  +dblcCia.Text +''' and '
        +      'CCCANJE='''+dbeOCobra.Text+''' ';
   DM1.cdsCanjeCxC.Close;
   DM1.cdsCanjeCxC.DataRequest( xSQL );
   DM1.cdsCanjeCxC.Open;

{i1105
   DM1.cdsMovCxC.Filter:='';
   DM1.cdsMovCxC.Filter:='CiaId='   +''''+dblcCia.Text  +''''+' and '+
                         'ClieID='  +''''+dblcdClie.Text+''''+' and CCSaLLoc>0 and '+
                         'CCCanje<>'+''''+dbeOCobra.Text+''''+' and CCEstado='+''''+'P'+'''';
   DM1.cdsMovCxC.Filtered:=True;
f1105}
   //Para No Ver los Detalles de los Movimientos
   DM1.cdsMovCxC.Filter:='';
   DM1.cdsMovCxC.Filter:='CiaId = ''''' ;
   DM1.cdsMovCxC.Filtered:=True;

end;

procedure TFCobranza.IniciaDatos;    
begin

   pnlCabecera.Enabled   := True;
   Z2bbtnOkCab.Enabled := True ;
   pnlCabecera2.Enabled  := False;
   pnlPendientes.Enabled := False;
   pnlDocCanje.Enabled   := False;
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
   dbeOCobra.Text    := '' ;   // Orden de Cobranza
   dblcdClie.Text    := '' ;    // Código de Cliente
   edtClieRUC.Text   := '' ;    // RUC del Cliente
   dbeDesClie.Text   := '' ;   // Descripcion del Cliente
   dbdtpFCobra.Date  := date ; // Fecha de Cobranza
   dblcTMon.Text     := '' ;   // Tipo de Moneda
   edtTMon.Enabled   := False ;
   edtTMon.Text      := '' ;   // Descripción de la Moneda
   dbeTCambio.Text   := '' ;   // Tipo de Cambio
   dbeElabo.Text     := '' ;   // Elaborado por
   dbeAprob.Text     := '' ;   // Aprobado por
   dblcBanco.Text    := '' ;
   edtBanco.Text     := '' ;
   edtCuenta.Text    := '' ;
   lblEstado.Caption := '';   //Inicializar el Estado
   
   wmodifica         := False;

   dbgPendientes.ReadOnly:= True;     // Para el Grid
   dbgDocCanje.ReadOnly  := False;     // Para el Grid

   dbgDocCanje.ColumnByName('CCSalLoc').FooterValue:='';
   dbgDocCanje.ColumnByName('CCSalExt').FooterValue:='';
   dbgDocCanje.ColumnByName('CCMtoLoc').FooterValue:='';
   dbgDocCanje.ColumnByName('CCMtoExt').FooterValue:='';

   // Limpiando filtros si lo tuvieran
   DM1.cdsMovCxC.Filtered :=False;
   DM1.cdsCCBco.Filtered:=False;


// Documentos Pendientes
   DM1.cdsMovCxC.Filter:='';
   DM1.cdsMovCxC.Filter:='CiaId='+''''+''+'''';
   DM1.cdsMovCxC.Filtered:=True;
// Documentos Seleccionados para Canje

   // vhn 23/01/2001
   xSQL:='Select * from CXC304 '
        +'Where CIAID='''' and CCCANJE='''' ';
   DM1.cdsCanjeCxC.Close;
   DM1.cdsCanjeCxC.DataRequest( xSQL );
   DM1.cdsCanjeCxC.Open;

   // ubica en primer dato a pedir
   //dblcCia.SetFocus;
   RecuperarCiaUnica(dblcCia,edtCia);
   if dblccia.text <> '' then
      perform(CM_DialogKey,VK_TAB,0);


end;

{*******************************************************
PRIMER PANEL - DATOS INICIALES DE LA CABECERA
*******************************************************}

procedure TFCobranza.dblcCiaChange(Sender: TObject);    //rlp ok
var
   xWhere : string;
begin
   if not (Sender as tWinControl).Enabled then
      Exit ;
   xWhere:='CIAID='+''''+dblcCia.Text+'''';
   edtCia.Text:=DM1.DisplayDescrip('prvTGE','TGE101','*',xWhere,'CIAABR');
   if length(edtCia.Text)>0 then
   begin
    // determina último número de orden de Cobranza incrementado en 1
       xWhere := 'CIAID='+''''+dblcCia.Text+'''';
       dbeOCobra.Text:=DM1.UltimoNum('prvTGE','CXC303','NOTACOB',xWhere);
       dbeOCobra.Text:=DM1.strzero(dbeOCobra.Text,DM1.cdsCobraCxC.FieldByName('NOTACOB').DisplayWidth);
   end;
end;

{*******************************************************
SEGUNDO PANEL - DATOS ADICIONALES DE LA CABECERA
*******************************************************}
procedure TFCobranza.dblcdClieExit(Sender: TObject);
begin
  if z2bbtnCancel.Focused then exit;

  DM1.Filtracds(DM1.cdsQry,'SELECT AUXID, AUXRUC, AUXGIRA, AUXNOMB FROM CNT201 WHERE AUXID='+quotedstr(dblcdClie.text) );

  edtClieRUC.Text:=dm1.cdsQry.FieldByName('AUXRUC').AsString;
  dbeDesClie.Text:=dm1.cdsQry.FieldByName('AUXNOMB').AsString;

   if trim(edtClieRUC.Text) = '' then
   begin
      ShowMessage('Ingrese Código de Cliente')
   end
   else
   begin
      BorraGrid ;
   end;
end;

procedure TFCobranza.edtClieRUCExit(Sender: TObject);
var
   xTiene, xWhere : string;
begin
   if length(edtClieRUC.Text)>0 then
   begin
      xWhere:='CLIERUC='+''''+edtClieRUC.Text+'''';
      xTiene :=DM1.DisplayDescrip('prvTGE','TGE204','*',xWhere,'CLIEDES');
      if length(xTiene)=0 then
         begin
            ShowMessage('Registro Unico de Cliente Errado');
            edtClieRUC.SetFocus;
         end
      else
      begin
         dblcdClie.Text :=DM1.cdsqry.fieldbyname('ClieId').Value;
         dbeDesClie.Text:=xTiene;
      end;
   end; // length
end;

procedure TFCobranza.dbdtpFCobraExit(Sender: TObject);
var
   xWhere   ,
   Tmp   : String;
   xFCierre : TDate;
begin
   if z2bbtnCancel.Focused then
      exit;
   if dbdtpFCobra.date = 0 then
   begin
     Tmp := strTmp ;
     ShowMessage('Ingrese Fecha de Cobranza') ;
     dbdtpFCobra.SetFocus ;
     strTmp  := Tmp ;
     Exit ;
   end ;
   if StrTmp <> dbdtpFCobra.Text then
   begin
      xWhere   := 'CIAID= ''' + dblcCia.Text + '''' ;
      xFCierre := DM1.BuscaUltFecha('prvTGE','CXC202','FCIERRE',xWhere);
      if dbdtpFCobra.Date <= xFCierre then
      begin
         tmp := strTmp ;
         ShowMessage(' Error :  Ultima Fecha de Cierre ' + DateToStr(xFCierre) );
         dbdtpFCobra.SetFocus;
         strTmp := Tmp ;
         exit;
      end;
      //Hallar el tipo de cambio para la fecha cambiada
      dbeTCambio.Text := dm1.RecuperarTipoCambio(dbdtpFCobra.date) ;
/////
      DM1.cdsCanjeCxC.First;
      If DM1.FRound(DM1.cdsCanjeCxC.FieldByName('CCTCAMCje').Value,8,3) <> DM1.FRound(strtofloat(dbeTCambio.Text),8,3) then
      begin
         While not DM1.cdsCanjeCxC.eof do
         begin
            DM1.cdsCanjeCxC.Edit;
            DM1.cdsCanjeCxC.FieldByName('CCTCAMCje').Value := DM1.FRound(strtofloat(dbeTCambio.Text),8,3);
            DM1.cdsCanjeCxC.Next;
         end;
         DM1.cdsCanjeCxC.First;
      end;
/////
   end ;
end;

procedure TFCobranza.dbeTCambioExit(Sender: TObject);
begin
   if   strTmp <> dbeTCambio.text then
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
      If DM1.FRound(DM1.cdsCanjeCxC.FieldByName('CCTCAMCje').Value,8,3) <> DM1.FRound(strtofloat(dbeTCambio.Text),8,3) then
      begin
         While not DM1.cdsCanjeCxC.eof do
         begin
            DM1.cdsCanjeCxC.Edit;
            DM1.cdsCanjeCxC.FieldByName('CCTCAMCje').Value := DM1.FRound(strtofloat(dbeTCambio.Text),8,3);
            DM1.cdsCanjeCxC.Next;
         end;
         DM1.cdsCanjeCxC.First;
      end;
      wmodifica:=True;
    end ;
end;

procedure TFCobranza.z2bbtnOKClick(Sender: TObject);    //rlp ok
var xWhere ,
    xFiltro ,
    xSQL :string;
begin
    ValidaCab ;
    with DM1 do
    begin
      cdsCobraCxC.Edit;
      cdsCobraCxC.FieldByName('CLIEID').Value   := dblcdClie.Text;
      cdsCobraCxC.FieldByName('CLIERUC').Value  := edtClieRUC.Text;
      cdsCobraCxC.FieldByName('NCOFCOB').Value  := dbdtpFCobra.date;
      cdsCobraCxC.FieldByName('TMonId').Value   := dblcTMon.Text;
      cdsCobraCxC.FieldByName('NCOEstado').Value:= 'I';

      xWhere:='FECHA=DATE(''' + formatdatetime('yyyy-mm-dd',dbdtpFCobra.Date)+''')' ;
      cdsCobraCxC.FieldByName('NCOANO').Value    := DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
      cdsCobraCxC.FieldByName('BANCOID').AsString := dblcBanco.Text ;
      cdsCobraCxC.FieldByName('CUENTAID').AsString := edtCuenta.Text  ;

      cdsCobraCxC.fieldbyname('NCOFCOB').AsDateTime := dbdtpFCobra.date ;
      cdsCobraCxC.fieldbyname('TMONID').AsString    := dblcTMon.Text    ;
      cdsCobraCxC.fieldbyname('NCOTCAMB').AsString  := dbeTCambio.Text  ;
      cdsCobraCxC.fieldbyname('NCOELABO').AsString  := dbeElabo.Text    ;
      cdsCobraCxC.fieldbyname('NCOAPROB').AsString  := dbeAprob.Text    ;

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

   // Filtros

/////////////////////
      xFiltro := 'CIAID ='   + '''' + dblcCia.Text  + '''' + ' AND ' +
                 'CLIEID ='  + '''' + dblcdClie.Text + '''' + ' AND CCSALLOC>0 AND ' +
                 '(CCCANJE <> ' + '''' + dbeOCobra.Text  +'''' + ' OR CCCANJE IS NULL) '+
                 ' AND CCESTADO=' + '''' + 'P' + '''' ; //+
//1105                 ' AND CPMTOLOC -  CPPAGLOC  = CPSALLOC ' ;

   //0805Recuperación de datos del servidor
      xWhere := '(' + xFiltro + ')' + ' OR ( CCCANJE = ''' + dbeOCobra.Text + ''' ) ' +
                ' ORDER BY CLIEID , DOCID , CCFEMIS ' ;

//      xSQL := 'SELECT * FROM CXC301 WHERE ' + xFiltro ;

      cdsMovCxC.active := False ;
//wmc1809      cdsMovCxC.CommandText := 'SELECT * FROM CXC301 WHERE ' + xWhere ;
      cdsMovCxC.Datarequest('SELECT * FROM CXC301 WHERE ' + xWhere ) ;
      cdsMovCxC.Active := True ;

      cdsMovCxC.Filter:= xFiltro ;
      cdsMovCxC.Filtered:=True;
/////////////////////
   // Grid de Documentos a Canjear
      // vhn 23/01/2001
      xSQL:='Select * from CXC304 '
           +'Where CIAID='''  +dblcCia.Text +''' and '
           +      'CCCANJE='''+dbeOCobra.Text+''' ';
      DM1.cdsCanjeCxC.Close;
      DM1.cdsCanjeCxC.DataRequest( xSQL );
      DM1.cdsCanjeCxC.Open;

  // Filtra

      if dm1.cdsMovCxC.RecordCount=0 then
      begin
         ShowMessage('No hay Documentos Pendientes para Cliente');
         exit;
      end;


    // Actualiza Saldos de Doc. En Canje
    //      If not xFlagCal then begin
            xFlagCal := True;
            RecalculaSaldos(xFlagCal);
    //      end;
    end;

    //Actualizamos el Footer
    z2bbtnSumatClick(sender);

    // Estado de los componentes
    pnlCabecera.enabled   := False;
    pnlCabecera2.enabled  := False;
    pnlPendientes.enabled := True;
    pnlDocCanje.enabled   := True;

    pnlBotones.Enabled    := True;
    ActPnlBotones;
    // Estado de los botones
    z2bbtnOk.Enabled        := False;
    z2bbtnCancel.Enabled    := False;
end;

procedure TFCobranza.RecalculaSaldos(xNuevo:boolean);
begin
     DM1.cdsMovCxC.DisableControls;
     DM1.cdsMovCxC.Filtered:=False;
     DM1.cdsCanjeCxC.DisableControls;
     DM1.cdsCanjeCxC.First;
     While not DM1.cdsCanjeCxC.Eof do
     begin
        DM1.cdsCanjeCxC.Edit;

        if DM1.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
                                 VarArrayOf([
                                              DM1.cdsCanjeCxC.FieldByName('CiaId').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('TDiarID').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('CCAnoMM').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('CCNoReg').AsString
                                            ]),[]) then
        begin
           DM1.cdsCanjeCxC.FieldByName('CCSalLoc').Value :=DM1.cdsMovCxC.FieldByName('CCMtoLoc').Value-DM1.cdsMovCxC.FieldByName('CCPagLoc').Value;
           DM1.cdsCanjeCxC.FieldByName('CCSalExt').Value :=DM1.cdsMovCxC.FieldByName('CCMtoExt').Value-DM1.cdsMovCxC.FieldByName('CCPagExt').Value;
        end;
        if not xNuevo then
        begin
           DM1.cdsCanjeCxC.FieldByName('CjeAntMN').Value := DM1.cdsCanjeCxC.FieldByName('CCMToLoc').Value;
           DM1.cdsCanjeCxC.FieldByName('CjeAntME').Value := DM1.cdsCanjeCxC.FieldByName('CCMToExt').Value;
        end;
        DM1.cdsCanjeCxC.Post;
        DM1.cdsCanjeCxC.Next;
     end;
     DM1.cdsCanjeCxC.First;
     DM1.cdsCanjeCxC.EnableControls;
     DM1.cdsMovCxC.Filtered:=True;
     DM1.cdsMovCxC.EnableControls;
end;

procedure TFCobranza.z2bbtnCancelClick(Sender: TObject);  //rlp ok
begin
   DM1.cdsCobraCxC.CancelUpdates;
   DM1.cdsMovCxC.CancelUpdates;
   DM1.cdsCanjeCxC.CancelUpdates;
   IniciaDatos;
   z2bbtnOKCab.Enabled:=true;
end;

{*******************************************************
TERCER PANEL - 1ER GRID DOCUMENTOS PENDIENTES DE CANCELACION
*******************************************************}

// Para Enviar a Documentos de Canje
procedure TFCobranza.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgPendientes.BeginDrag(False);
end;

procedure TFCobranza.dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
var
  I: integer;
begin
   With DM1 do
   Begin
      If Target=dbgDocCanje Then
      Begin
         DM1.cdsMovCxC.DisableControls;
         // Verifica que Documentos No Esten Pendientes de Actualización
         for i:= 0 to dbgPendientes.SelectedList.Count-1 do
         begin
             dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);
             If cdsMovCxC.FieldByName('TMonID').Value=wTMonLoc then
             begin
                 If FRound(DM1.cdsMovCxC.FieldByName('CCMtoLoc').Value-DM1.cdsMovCxC.FieldByName('CCPagLoc').Value,15,2)<>
                    FRound(DM1.cdsMovCxC.FieldByName('CCSalLoc').Value,15,2) then
                 begin
                    ShowMessage('Error : Documento esta en Proceso de cancelación');
                    dbgPendientes.SelectedList.clear;
                    DM1.cdsMovCxC.First;
                    DM1.cdsMovCxC.EnableControls;
                    Exit;
                 end;
               end
             else
             begin
                If FRound(DM1.cdsMovCxC.FieldByName('CCMtoExt').Value-DM1.cdsMovCxC.FieldByName('CCPagExt').Value,15,2)<>
                   FRound(DM1.cdsMovCxC.FieldByName('CCSalExt').Value,15,2) then
                begin
                   ShowMessage('Error : Documento esta en Proceso de cancelación');
                   dbgPendientes.SelectedList.clear;
                   DM1.cdsMovCxC.First;
                   DM1.cdsMovCxC.EnableControls;
                   Exit;
                end;
             end;
         end;//FOR

         ////////////////////////////////

         cdsCanjeCxC.DisableControls;
         for i:= 0 to dbgPendientes.SelectedList.Count-1 do
         begin
             dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);

             if not cdsCanjeCxC.Locate('CIAID;TCANJEID;CCCANJE;TDIARID;CCANOMM;CCNOREG' ,
                                       VarArrayOf([DM1.cdsMovCxC.FieldByName('CiaID').AsString,
                                                   'OC',
                                                   dbeOCobra.Text,
                                                   DM1.cdsMovCxC.FieldByName('TDiarID').AsString,
                                                   DM1.cdsMovCxC.FieldByName('CCAnoMes').AsString,
                                                   DM1.cdsMovCxC.FieldByName('CCNoReg').AsString
                                                   ]),[]) then
             begin
                cdsCanjeCxC.Insert;
                cdsCanjeCxC.FieldByName('CiaID').Value    := cdsMovCxC.FieldByName('CiaID').Value;
                cdsCanjeCxC.FieldByName('TDiarID').Value  := cdsMovCxC.FieldByName('TDiarID').Value;
                cdsCanjeCxC.FieldByName('CCNoReg').Value  := cdsMovCxC.FieldByName('CCNoReg').Value;
                cdsCanjeCxC.FieldByName('CCAAAA').Value   := cdsMovCxC.FieldByName('CCAAAA').Value;
                cdsCanjeCxC.FieldByName('CCAnoMM').Value  := cdsMovCxC.FieldByName('CCAnoMes').Value;
                cdsCanjeCxC.FieldByName('ClieID').Value   := cdsMovCxC.FieldByName('ClieID').Value;
                cdsCanjeCxC.FieldByName('ClieRuc').Value  := cdsMovCxC.FieldByName('ClieRuc').Value;
                cdsCanjeCxC.FieldByName('DocID').Value    := cdsMovCxC.FieldByName('DocID').Value;
                cdsCanjeCxC.FieldByName('CCSerie').Value  := cdsMovCxC.FieldByName('CCSerie').Value;
                cdsCanjeCxC.FieldByName('CCNoDoc').Value  := cdsMovCxC.FieldByName('CCNoDoc').Value;
                cdsCanjeCxC.FieldByName('TCanjeId').Value := 'OC';  // Orden de Cobranza
                cdsCanjeCxC.FieldByName('CCCanje').Value  := dbeOCobra.Text;
                cdsCanjeCxC.FieldByName('CCFCanje').Value := cdsMovCxC.FieldByName('CCFCanje').Value;
                cdsCanjeCxC.FieldByName('TMonID').Value   := cdsMovCxC.FieldByName('TMonID').Value;

                cdsCanjeCxC.FieldByName('CCMtoOri').Value := FRound(cdsMovCxC.FieldByName('CCMtoOri').Value,15,2);
                cdsCanjeCxC.FieldByName('CCMtoLoc').Value := FRound(cdsMovCxC.FieldByName('CCSalLoc').Value,15,2);
                cdsCanjeCxC.FieldByName('CCMtoExt').Value := FRound(cdsMovCxC.FieldByName('CCSalExt').Value,15,2);

                cdsCanjeCxC.FieldByName('CjeAntMN').Value := 0;
                cdsCanjeCxC.FieldByName('CjeAntME').Value := 0;
                cdsCanjeCxC.FieldByName('CCTCamDoc').Value:= FRound(cdsMovCxC.FieldByName('CCTCamPr').Value,8,3);
                cdsCanjeCxC.FieldByName('CCTCamcje').Value:= FRound(strtofloat(dbeTCambio.Text),8,3);
                cdsCanjeCxC.FieldByName('CtaTotal').Value := cdsMovCxC.FieldByName('CtaTotal').Value;
                cdsCanjeCxC.FieldByName('CptoTot').Value  := cdsMovCxC.FieldByName('CCptoTot').Value;
                cdsCanjeCxC.FieldByName('CCFVcmto').Value := cdsMovCxC.FieldByName('CCFVcmto').Value;
                cdsCanjeCxC.FieldByName('CCUser').Value  := DM1.wUsuario;
                cdsCanjeCxC.FieldByName('CCFReg').Value  := date;
                cdsCanjeCxC.FieldByName('CCHReg').Value  := time;

                cdsMovCxC.Edit;
                cdsMovCxC.FieldByName('CCCanje').Value := dbeOCobra.Text;
                cdsMovCxC.Post;
             end;
             dbgPendientes.datasource.dataset.Freebookmark(dbgPendientes.SelectedList.items[i]);
         end; // for
         dbgPendientes.SelectedList.clear;  { Clear selected record list since they are all deleted}
         cdsCanjeCxC.EnableControls;
         cdsMovCxC.EnableControls;
         z2bbtnSumat.click;
         wmodifica:=True;
      end; // target
   end; // DM1
end;

// Para Recibir los Documentos de Canje

procedure TFCobranza.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

{*******************************************************
TERCER PANEL - 2DO GRID DOCUMENTOS DE CANJE
*******************************************************}
// Para Enviar los Doc. de Canje a Pendientes

procedure TFCobranza.dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocCanje.BeginDrag(False);
end;

procedure TFCobranza.dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   If Target=dbgpendientes Then
   Begin
      With DM1 do
      Begin
         cdsMovCxC.Filtered:=False;

          if cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG' ,
                                    VarArrayOf([
                                                dm1.cdsCanjeCxC.FieldByName('CiaID').AsString ,
                                                dm1.cdsCanjeCxC.FieldByName('TDiarID').AsString ,
                                                dm1.cdsCanjeCxC.FieldByName('CCAnoMM').AsString ,
                                                dm1.cdsCanjeCxC.FieldByName('CCNoReg').AsString
                                                ]),[]) then
         begin
            cdsMovCxC.Edit;
            DM1.cdsMovCxC.FieldByName('TCanjeID').Value:='';
            DM1.cdsMovCxC.FieldByName('CCCanje').Value :='';
            If DM1.cdsMovCxC.FieldByName('TMonID').Value=wTMonLoc then
            begin
               DM1.cdsMovCxC.FieldByName('CCSalLoc').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSalLoc').Value+DM1.cdsCanjeCxC.FieldByName('CjeAntMN').Value,15,2);
               If DM1.cdsMovCxC.FieldByName('CCTCamPa').Value>0 then
                  DM1.cdsMovCxC.FieldByName('CCSalExt').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSalLoc').Value/DM1.cdsMovCxC.FieldByName('CCTCamPa').Value,15,2)
               else
               begin
                  DM1.cdsMovCxC.FieldByName('CCSalExt').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSalLoc').Value/DM1.cdsMovCxC.FieldByName('CCTCamPr').Value,15,2);
               end;
            end
            else
            begin
               DM1.cdsMovCxC.FieldByName('CCSalExt').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSalExt').Value+DM1.cdsCanjeCxC.FieldByName('CjeAntME').Value,15,2);
               If DM1.cdsMovCxC.FieldByName('CCTCamPa').Value>0 then
                  DM1.cdsMovCxC.FieldByName('CCSalLoc').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSalExt').Value*DM1.cdsMovCxC.FieldByName('CCTCamPa').Value,15,2)
               else
               begin
                  DM1.cdsMovCxC.FieldByName('CCSalLoc').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSalExt').Value*DM1.cdsMovCxC.FieldByName('CCTCamPr').Value,15,2);
               end;
            end;

            DM1.cdsMovCxC.Post;

            cdsCanjeCxC.Delete;
         end;
         cdsMovCxC.Filtered:=True;
      end;
      wmodifica:=True;
   end;
end;

// Para Recibir los Documentos Pendientes

procedure TFCobranza.dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

{*******************************************************
CUARTO PANEL - BOTONES
*******************************************************}

procedure TFCobranza.z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('C:\windows\calc.exe',1 );  // Executa Aplicación
end;

procedure TFCobranza.z2bbtnSumatClick(Sender: TObject);
Var
   xTSalLoc, xTSalExt, xTPagLoc, xTPagExt : Real;
   xRegAct : TBookMark;
begin
   with DM1 do
   begin
   // Totales de Documentos de canje
      cdsCanjeCxC.DisableControls;
      xRegAct := cdsCanjeCxC.GetBookmark;
      xTSalLoc := 0; xTSalExt := 0; xTPagLoc := 0; xTPagExt := 0;
      cdsCanjeCxC.First ;
      while not cdsCanjeCxC.Eof do
      begin
         xTSalLoc := xTSalLoc + cdsCanjeCxC.FieldByName('CCSalLoc').Value;
         xTSalExt := xTSalExt + cdsCanjeCxC.FieldByName('CCSalExt').Value;
         xTPagLoc := xTPagLoc + cdsCanjeCxC.FieldByName('CCMtoLoc').Value;
         xTPagExt := xTPagExt + cdsCanjeCxC.FieldByName('CCMtoExt').Value;
         cdsCanjeCxC.Next;
      end;
      dbgDocCanje.ColumnByName('CCSalLoc').FooterValue:=floattostrf(xTSalLoc, ffNumber, 10, 2);
      dbgDocCanje.ColumnByName('CCSalExt').FooterValue:=floattostrf(xTSalExt, ffNumber, 10, 2);
      dbgDocCanje.ColumnByName('CCMtoLoc').FooterValue:=floattostrf(xTPagLoc, ffNumber, 10, 2);
      dbgDocCanje.ColumnByName('CCMtoExt').FooterValue:=floattostrf(xTPagExt, ffNumber, 10, 2);
      cdsCanjeCxC.GotoBookmark(xRegAct);
      cdsCanjeCxC.FreeBookmark(xRegAct);
      cdsCanjeCxC.EnableControls;
   end;
end;

procedure TFCobranza.z2bbtnSubeClick(Sender: TObject);
begin
   {DM1.cdsEgrCaja.Edit;
   DM1.cdsRegCxP.Edit;}

   pnlCabecera2.Enabled:= True;
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
Grabación Final de la Orden de Cobranza
********************************************}

function TFCobranza.ConsisMonto:Boolean;
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

     DM1.cdsMovCxC.DisableControls;
     DM1.cdsMovCxC.Filtered:=False;
     DM1.cdsCanjeCxC.DisableControls;
     xRegAct := DM1.cdsCanjeCxC.GetBookmark;
     DM1.cdsCanjeCxC.First;
     While not DM1.cdsCanjeCxC.Eof do
     Begin

        if DM1.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
                                 VarArrayOf([
                                              DM1.cdsCanjeCxC.FieldByName('CiaId').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('TDiarID').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('CCAnoMM').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('CCNoReg').AsString
                                            ]),[]) then
         begin
            If DM1.cdsMovCxC.FieldByName('TMonID').Value=DM1.wTMonLoc then
            begin
               If DM1.FRound(DM1.cdsMovCxC.FieldByName('CCPagLoc').Value+DM1.cdsCanjeCxC.FieldByName('CCMtoLoc').Value
                  -DM1.cdsCanjeCxC.FieldByName('CjeAntMN').Value,15,2)>DM1.FRound(DM1.cdsMovCxC.FieldByName('CCMtoLoc').Value,15,2) Then
               begin
                   ShowMessage('Error : Monto pagado excede a Monto Total de Documento');
                   Result := False;
                   break;
               end;
            end
            else
            begin
               If DM1.FRound(DM1.cdsMovCxC.FieldByName('CCPagExt').Value+DM1.cdsCanjeCxC.FieldByName('CCMtoExt').Value
                 -DM1.cdsCanjeCxC.FieldByName('CjeAntME').Value,15,2)>DM1.FRound(DM1.cdsMovCxC.FieldByName('CCMtoExt').Value,15,2) Then
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
     DM1.cdsMovCxC.Filtered:=True;
     DM1.cdsMovCxC.EnableControls;
end;

procedure TFCobranza.z2bbtnGrabaClick(Sender: TObject);
var
  xRegAct : TBookMark;
  xPagLoc, xPagExt : Real;
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
             xTPagLoc := xTPagLoc + cdsCanjeCxC.FieldByName('CCMtoLoc').Value;
             xTPagExt := xTPagExt + cdsCanjeCxC.FieldByName('CCMtoExt').Value;
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
          DM1.cdsMovCxC.DisableControls;
          DM1.cdsMovCxC.Filtered:=False;
          DM1.cdsCanjeCxC.DisableControls;
          xRegAct := DM1.cdsCanjeCxC.GetBookmark;
          DM1.cdsCanjeCxC.First;
          While not DM1.cdsCanjeCxC.Eof do
          Begin
             DM1.cdsCanjeCxC.Edit;

          if DM1.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
                                 VarArrayOf([
                                              DM1.cdsCanjeCxC.FieldByName('CiaId').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('TDiarID').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('CCAnoMM').AsString,
                                              DM1.cdsCanjeCxC.FieldByName('CCNoReg').AsString
                                            ]),[]) then
             begin
                DM1.cdsMovCxC.edit;
                If DM1.cdsMovCxC.FieldByName('TMonID').Value=DM1.wTMonLoc then
                begin
                   xPagLoc := DM1.FRound(DM1.cdsCanjeCxC.FieldByName('CCMtoLoc').Value-DM1.cdsCanjeCxC.FieldByName('CjeAntMN').Value,15,2);
                   DM1.cdsMovCxC.FieldByName('CCSalLoc').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSalLoc').Value-xPagLoc,15,2);
                   DM1.cdsMovCxC.FieldByName('CCSalExt').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSalLoc').Value/DM1.cdsCanjeCxC.FieldByName('CCTCamCje').Value,15,2);
                   end
                else
                begin
                   xPagExt := DM1.FRound(DM1.cdsCanjeCxC.FieldByName('CCMtoExt').Value-DM1.cdsCanjeCxC.FieldByName('CjeAntME').Value,15,2);
                   DM1.cdsMovCxC.FieldByName('CCSalExt').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSalExt').Value-xPagExt,15,2);
                   DM1.cdsMovCxC.FieldByName('CCSalLoc').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSalExt').Value*DM1.cdsCanjeCxC.FieldByName('CCTCamCje').Value,15,2);
                end;
                DM1.cdsMovCxC.post;
             end;
             DM1.cdsCanjeCxC.Next;
          end;
          DM1.cdsCanjeCxC.GotoBookmark(xRegAct);
          DM1.cdsCanjeCxC.FreeBookmark(xRegAct);
          DM1.cdsCanjeCxC.EnableControls;
          DM1.cdsMovCxC.Filtered:=True;
          DM1.cdsMovCxC.EnableControls;

       // Adicionado por RLP para poder grabar n veces

          RecalculaSaldos(False);

          // Actualiza Tablas
          DM1.cdsCobraCxC.ApplyUpdates(0);
          //2305
          DM1.cdsCobraCxC.Refresh ;

          DM1.cdsCanjeCxC.ApplyUpdates(0);

          //2305
          DM1.cdsCanjeCxC.Refresh ;

          DM1.cdsMovCxC.ApplyUpdates(0);

          z2bbtnSumatClick(sender);
          ShowMessage('Grabacion OK');


          z2bbtnNuevo.Enabled    := True;
          z2bbtnAnula.Enabled    := True;
          z2bbtnImprime.Enabled  := True;
          //1805i
          Z2bbtnCancelar.Enabled := True ;
          wmodifica:=False;
       end;
    end
    else
    begin
         ShowMessage('Imposible Grabar');
    end;
end;

procedure TFCobranza.z2bbtnCancel2Click(Sender: TObject);
begin
   if MessageDlg('¿Anular los cambios?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin
      DM1.cdsCobraCxC.CancelUpdates;
      DM1.cdsMovCxC.CancelUpdates;
      DM1.cdsCanjeCxC.CancelUpdates;
      IniciaDatos;
   end;
end;

procedure TFCobranza.z2bbtnImprimeClick(Sender: TObject);
begin
   pplblCia.Caption := edtCia.Text ;
   pplblFecNC.Caption := dbdtpFCobra.Text ;
   pplblClienteID.Caption := dblcdClie.Text ;
   pplblCliente.Caption := 'Martin Miranda' ;
   pplblMoneda.Caption := edtTMon.Text ;
   pplblTipCamb.Caption := dbeTCambio.Text ;
   pplblElaboradopor.Caption := dbeElabo.Text ;
   pplblAprobadopor.Caption := dbeAprob.Text ;

   pprOPago.Print;
end;

procedure TFCobranza.ppDBText5Print(Sender: TObject);
begin
   if DM1.cdsCobraCxC.FieldByName('TMONID').Value=DM1.wTMonLoc then
      ppDBText5.DataField := 'CCMTOLOC'
   else
      ppDBText5.DataField := 'CCMTOEXT'
end;

procedure TFCobranza.ppDBCalc1Print(Sender: TObject);
begin
   if DM1.cdsCobraCxC.FieldByName('TMONID').Value=DM1.wTMonLoc then
      ppDBCalc1.DataField := 'CCMTOLOC'
   else
      ppDBCalc1.DataField := 'CCMTOEXT'
end;

procedure TFCobranza.dbgDocCanjeColExit(Sender: TObject);
begin
   if dbgDocCanje.SelectedField.FieldName='CCTCAMCJE' then
   begin
      dbgDocCanje.RefreshDisplay;
   end;

   if dbgDocCanje.SelectedField.FieldName='CCMTOLOC' then
   begin
      if DM1.FRound(DM1.cdsCanjeCxC.FieldByName('CCMtoLoc').Value,15,2)>DM1.FRound(DM1.cdsCanjeCxC.FieldByName('CCSalLoc').Value,15,2) then
      begin
         ShowMessage('Monto excede a Saldo Actual');
         DM1.cdsCanjeCxC.Edit;
         DM1.cdsCanjeCxC.FieldByName('CCMTOLOC').Value:=DM1.cdsCanjeCxC.FieldByName('CjeAntMN').Value;
         dbgDocCanje.SelectedIndex:=8; // debería ser 9 pero no hace caso
         dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
      end;
   end;

   if dbgDocCanje.SelectedField.FieldName='CCMOEXT' then
   begin
      if DM1.FRound(DM1.cdsCanjeCxC.FieldByName('CCMtoExt').Value,15,2)>DM1.Fround(DM1.cdsCanjeCxC.FieldByName('CCSalExt').Value,15,2) then
      begin
         ShowMessage('Monto excede a Saldo Actual');
         DM1.cdsCanjeCxC.Edit;
         DM1.cdsCanjeCxC.FieldByName('CCMTOExt').Value:=DM1.cdsCanjeCxC.FieldByName('CjeAntME').Value;
         dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
         dbgDocCanje.SelectedIndex:=10; // debería ser 9 pero no hace caso
      end;
   end;
end;

procedure TFCobranza.z2bbtnNuevoClick(Sender: TObject);
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

procedure TFCobranza.z2bbtnAnulaClick(Sender: TObject);
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
         DM1.cdsMovCxC.DisableControls;
         DM1.cdsMovCxC.Filtered:=False;
         DM1.cdsCanjeCxC.DisableControls;
         DM1.cdsCanjeCxC.First;
         While not DM1.cdsCanjeCxC.Eof do
         Begin
            if ExisteMovCxC( DM1.cdsCanjeCxC.FieldByName('CiaId').Value,DM1.cdsCanjeCxC.FieldByName('TDiarID').Value,
                             DM1.cdsCanjeCxC.FieldByName('CCAnoMM').Value,DM1.cdsCanjeCxC.FieldByName('CCNoReg').Value) then
            begin
               DM1.cdsMovCxC.Edit;
               If DM1.cdsMovCxC.FieldByName('TMonID').Value=DM1.wTMonLoc then
               begin
                  DM1.cdsMovCxC.FieldByName('CCSalLoc').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCMtoLoc').Value-DM1.cdsMovCxC.FieldByName('CCPagLoc').Value,15,2);
                  If DM1.cdsMovCxC.FieldByName('CCTCamPa').Value>0 then
                     DM1.cdsMovCxC.FieldByName('CCSalExt').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSalLoc').Value/DM1.cdsMovCxC.FieldByName('CCTCamPa').Value,15,2)
                  else
                  begin
                     DM1.cdsMovCxC.FieldByName('CCSalExt').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSalLoc').Value/DM1.cdsMovCxC.FieldByName('CCTCamPr').Value,15,2);
                  end;
                  end
               else
               begin
                  DM1.cdsMovCxC.FieldByName('CCSalExt').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCMtoExt').Value-DM1.cdsMovCxC.FieldByName('CCPagExt').Value,15,2);
                  If DM1.cdsMovCxC.FieldByName('CCTCamPa').Value>0 then
                     DM1.cdsMovCxC.FieldByName('CCSalLoc').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSalExt').Value*DM1.cdsMovCxC.FieldByName('CCTCamPa').Value,15,2)
                  else
                  begin
                     DM1.cdsMovCxC.FieldByName('CCSalLoc').Value:=DM1.FRound(DM1.cdsMovCxC.FieldByName('CCSalExt').Value*DM1.cdsMovCxC.FieldByName('CCTCamPr').Value,15,2);
                  end;
               end;
            end;
            DM1.cdsCanjeCxC.Next;
         end;
         DM1.cdsCanjeCxC.EnableControls;
         DM1.cdsMovCxC.Filtered:=True;
         DM1.cdsMovCxC.EnableControls;

         DM1.cdsMovCxC.ApplyUpdates(0);

         // Anula Orden de Cobranza
         DM1.cdsCobraCxC.Edit;
         DM1.cdsCobraCxC.FieldByName('NCOESTADO').Value:='A';  // Anulada
         DM1.cdsCobraCxC.ApplyUpdates(0);

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
         ShowMessage('Imposible Anular Nota de Cobranza');
    end;
end;

procedure TFCobranza.ActPnlBotones;
begin
   z2bbtnSumat.Enabled    := wbSumat;
   z2bbtnNuevo.Enabled    := wbNuevo;
   z2bbtnImprime.Enabled  := wbImprime;
   z2bbtnSube.Enabled     := wbSube;
   Z2bbtnCancelar.enabled := wbCancelado ;
   z2bbtnConsultar.Enabled   := wbConsultar ;
   z2bbtnGraba.Enabled    := wbGraba;
   z2bbtnCancel2.Enabled  := wbCancel2;
   z2bbtnAnula.Enabled    := wbAnula;
end;

{*******************************************************
FIN DE LA FORMA
*******************************************************}

procedure TFCobranza.FormClose(Sender: TObject; var Action: TCloseAction);
begin

 // Cancela Cualquier Modificación
   DM1.cdsCobraCxC.CancelUpdates;
   DM1.cdsMovCxC.CancelUpdates;
   DM1.cdsCanjeCxC.CancelUpdates;

   // Limpiando filtros si lo tuvieran
   DM1.cdsMovCxC.Filtered :=False;
   DM1.cdsCCBco.Filtered:=False;

   DM1.cdsBancoEgr.Filter := '' ;
   DM1.cdsBancoEgr.Filtered := True ;

//   dm1.ControlFocoSalida(self,ctrl,evt_exit) ;
//
//   LibConfigAccesos;
//
end;

Function TFCobranza.ExisteMovCxC(xxCia,xxTDiario,xxAAMM,xxNoReg:String):Boolean;
begin

     Result := DM1.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
                                 VarArrayOf([
                                              xxCia ,
                                              xxTDiario ,
                                              xxAAMM ,
                                              xxNoReg
                                            ]),[]);
end;

procedure TFCobranza.dbgDocCanjeCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
{    if (Field.FieldName = 'CCMTOLOC') or (Field.FieldName = 'CCMTOEXT') then begin
       AFont.Color := clBlue;
    end;}
end;
procedure TFCobranza.dbeOCobraExit(Sender: TObject);
begin
   dbeOCobra.Text:=DM1.strzero(dbeOCobra.Text,DM1.cdsCobraCxC.FieldByName('NOTACOB').DisplayWidth);
end;

procedure TFCobranza.edtClieRUCChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFCobranza.dbeGiradoAChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFCobranza.dbdtpFCobraChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFCobranza.dbeNoChqChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFCobranza.dbeElaboChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFCobranza.dbeAprobChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFCobranza.FormKeyPress(Sender: TObject; var Key: Char);
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

{begin

if key=#13 then
  begin
   key:=#0;
   perform(CM_DialogKey,VK_TAB,0);
  end;

end;
}

procedure TFCobranza.z2bbtnOKCabClick(Sender: TObject);
var
   xWhere : string ;
begin
      xFlagCal := False;

      xWhere :=  'CIAID ='+''''+        dblcCia.Text +  ''''
                +' AND NOTACOB ='+''''+ dbeoCobra.Text + ''''  ;

      if dm1.RecuperarDatos('CXC303','*',xWhere) then
      begin
          ShowMessage('Nota de Cobranza Existe');
          dbeOCobra.Text:= '' ;
          dbeOCobra.SetFocus  ;
          exit;
      end
      else
      begin

         // vhn 22/01/2001
         xSQL:='Select * from CXC303 '
              +'Where CIAID='''  +dblcCia.Text  +''' and '
              +      'NOTACOB='''+dbeOCobra.Text+''' ';
         DM1.cdsCobraCxC.Close;
         DM1.cdsCobraCxC.DataRequest( xSQL );
         DM1.cdsCobraCxC.Open;

         DM1.cdsCobraCxC.Insert;
         DM1.cdsCobraCxC.FieldByName('CIAID').Value  := dblcCia.Text;  // Compañía
         DM1.cdsCobraCxC.FieldByName('NOTACOB').Value:= dbeoCobra.Text;  // Orden de Cobranza
         DM1.cdsCobraCxC.FieldByName('NCOUSER').Value := DM1.wUsuario;  // usuario que registra
         DM1.cdsCobraCxC.FieldByName('NCOFREG').Value := date;          // fecha que registra usuario
         DM1.cdsCobraCxC.FieldByName('NCOHREG').Value := time;          // hora que registra usuario
         DM1.cdsCobraCxC.FieldByName('NCOESTADO').Value:='I';
         DM1.cdsCobraCxC.Post;

         // Actualizar Label Estado
         lblEstado.Caption:='Nuevo     ';

         pnlCabecera.Enabled  := false;
         pnlCabecera2.Enabled := true;
         dblcdClie.Enabled    := True;
         //comentada por william manrique cautin
         //edtClieRUC.Enabled := True;

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
         (sender as tcontrol).enabled:=false;
         wmodifica:=False;
         perform(CM_DialogKey,VK_TAB,0);

      end;
end;

procedure TFCobranza.dbgDocCanjeCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'CCMTOLOC') or (AFieldName = 'CCMTOEXT') then
    begin
       ABrush.Color := clNone;
    end;

end;

procedure TFCobranza.dblcTMonExit(Sender: TObject);
begin
if z2bbtnCancel.Focused then
   exit;
if edtTMon.Text='' then
begin
    if dblcTMOn.Text='' then
      ShowMessage('Ingrese Tipo de Moneda')
    else
      ShowMessage('El Tipo de Moneda que ha Ingresado'+#13 +
                  'No está registrado');
    (Sender as twincontrol).SetFocus;
end
end;

procedure TFCobranza.ConfiguraAccesos;
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

procedure TFCobranza.Libera_Admin;
begin
    Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFCobranza.Libera_Consul;
begin

end;

procedure TFCobranza.Proc_Admin;
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

procedure TFCobranza.Proc_Consul;
begin
    pnlCabecera.Enabled := False ;
    pnlCabecera2.Enabled := False ;
    pnlDetalle.Enabled := True ;
    pnlBotones.Enabled := False ;
end;

procedure TFCobranza.LibConfigAccesos;
begin
    if DM1.wAdmin = 'G' then
       Libera_Admin
    else
    begin
       if DM1.wModo = 'C' then
          Libera_Consul ;
    end ;

end;

procedure TFCobranza.Z2bbtnCancelarClick(Sender: TObject);
var
     xDatos : TDatosCancelacion ;
begin
     FDetCancela := TFDetCancela.Create (self) ;
     with xDatos do
     begin
       TMONID       := dblcTMon.Text                                              ;
       TMONDES      := edtTMOn.text                                               ;
       FECHATC      := DateToStr( dbdtpFCobra.Date )                              ;
       ECTCAMB      := dbeTCambio.Text                                            ;
       ECMTOORI     := CajaDEC(dm1.cdsCobraCxC.FieldByName('NCOMTOORI').AsString)                 ;
       ECLOTE       := ''                                                         ;
       CPTOID       := ''                                                         ;
       ECGLOSA      := ''                                                         ;
       CIAID        := dblcCia.Text                                               ;
       CIADES       := edtCia.text                                                ;
       ECANOMM      := strAno( dbdtpFCobra.date ) + strMes( dbdtpFCobra.date )    ;
       ECNOCOMP     := ''                                                         ;
       TDIARID      := ''                                                         ;
       TDIARDES     := ''                                                         ;
       PROV         := dblcdClie.Text                                             ;
       PROVRUC      := edtClieRUC.Text                                            ;
       CLAUXID      := dm1.wClaseAuxClie                                          ;
       ECOPAGO      := dbeOCobra.Text                                             ;
       BANCOID      := dblcBanco.Text                                             ;
     end ;
     try
       FDetCancela.RecibirDatos ( xDatos ) ;
       FDetcancela.ShowModal ;
       if FDetCancela.FinalizadoOK then
       begin
//          dm1.cdsDetFPago.ApplyUpdates(0) ;
          lblEstado.Caption     :='Cancelado          ' ;
          Z2bbtnCancelar.Enabled  := False ;
          Z2bbtnConsultar.Enabled := True ;
          
          Z2bbtnGraba.Enabled := False ;
          Z2bbtnAnula.Enabled := False ;
          Z2bbtnSube.Enabled  := False ;
       end
       else
       begin
          ShowMessage('No se puede Cancelar') ;
       end ;
     finally
       FDetCancela.free ;
     end ;

end;

procedure TFCobranza.FormCreate(Sender: TObject);
begin
    setlength(A4digitos,1) ;
    A4digitos[0] := dbeTcambio ;
    DM1.cdsBancoEgr.Filter := 'BCOTIPCTA=''C''' ;
    DM1.cdsBancoEgr.Filtered := True ;
   cf1 := TControlFoco.Create ;     
end;

procedure TFCobranza.dbeTCambioEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFCobranza.Z2bbtnConsultarClick(Sender: TObject);
begin
     FDetCancela := TFDetCancela.Create (self) ;
     try
        if FDetCancela.MuestraCancelacion(dblcCia.text , dbeOCobra.text) then
           FDetCancela.ShowModal
        else
           ShowMessage('Error : No se puede Recuperar Mov.') ;
     finally
        FDetCancela.Free ;
     end ;
end;

procedure TFCobranza.dblcBancoExit(Sender: TObject);
var
    Tmp : String ;
begin

   edtBanco.text:=DM1.DisplayDescripLocal(DM1.cdsBancoEgr,'BANCOID',dblcBanco.Text,'BANCOABR') ;

   edtCuenta.Text := '' ;
   dblcTMon.Text := '' ;
   edtTMon.Text := '' ;
   edtCuenta.Text:=DM1.cdsbancoegr.FieldByName('CUENTAID').Value; //Se toma de la tabla Bancos

    if edtBanco.Text <> '' then
    begin
       if DM1.cdsbancoegr.FieldByName('BCOTIPCTA').Value='C' then
       begin //Si es CAJA
          dblcTMon.Enabled := True ;
       end
       else
       begin  //Si es BANCO
          dblcTMon.Enabled := False ;
       end;
    end;
end;

procedure TFCobranza.Validacab;
begin
 // consistencia de Datos
   if length(dblcCia.Text)=0 then
   begin
      dblcCia.SetFocus ;
      raise exception.Create('Falta Codigo de Compañía');
   end ;
   if length(dbeOCobra.Text)=0 then
   begin
      dbeOCobra.SetFocus ;
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
   end ;
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
   if length(dbeElabo.Text)=0 then
   begin
     dbeElabo.SetFocus ;
     raise exception.Create('Falta "Elaborado por:"');
   end ;
   if length(dbeAprob.Text)=0 then
   begin
      dbeAprob.SetFocus ;
      raise exception.Create('Falta "Aprobado por:"');
   end ;
   if trim(dblcBanco.Text) = '' then
   begin
      dblcBanco.SetFocus ;
      raise exception.Create('Ingrese Caja');
   end ;
end;

procedure TFCobranza.FormShow(Sender: TObject);
begin
//   dm1.ControlFocoEntrada (ctrl,evt_exit) ;
end;

procedure TFCobranza.dbdtpFCobraEnter(Sender: TObject);
begin
      strTmp := dbdtpFCobra.Text ;
end;

procedure TFCobranza.dbeElaboKeyPress(Sender: TObject; var Key: Char);
begin
   if key in ['0'..'9'] then
      key := #0;
end;

procedure TFCobranza.BorraGrid;
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

procedure TFCobranza.FormDestroy(Sender: TObject);
begin
   cf1.Free ;
end;

end.

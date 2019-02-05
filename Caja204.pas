unit Caja204;
{  28/12/2001 PJSV, SE MODIFICARON PARA PODER USER EL SLCONTABILIZA
 CAJADM,CAJA001,CAJA201,CAJA228,CAJA204,CAJA209,CAJA218,CAJA235,CAJA240,CAJA233
 // SE AGREGARON PARACONCESIONES
 CAJA245,CAJA246
}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient, Variants,
  ComCtrls, Tabnotbk,CAJADM, Menus, Wwlocate, wwDialog, Wwfltdlg, wwidlg, oaContabiliza;

type
  TFPagoProvVa = class(TForm)
    pnlCabecera1: TPanel;
    lblCia: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    pnlCabecera2: TPanel;
    lblProvDes: TLabel;
    z2bbtnCancel: TBitBtn;
    z2bbtnOK: TBitBtn;
    dbeGiradoA: TwwDBEdit;
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
    dbeImporte: TwwDBEdit;
    lblImporte: TLabel;
    dbeNoComp: TwwDBEdit;
    dbeLote: TwwDBEdit;
    lblLote: TLabel;
    dbeGlosa: TwwDBEdit;
    lblGlosa: TLabel;
    lblConcepto: TLabel;
    dblcTDoc: TwwDBLookupCombo;
    lblTDoc: TLabel;
    edtTDoc: TEdit;
    dbeNoDoc: TwwDBEdit;
    lblNoDoc: TLabel;
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
    Label18: TLabel;
    dblcEmpleado: TwwDBLookupCombo;
    edtEmpleado: TEdit;
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
    edtCCBco: TEdit;
    lblCuenta: TLabel;
    lblTMon: TLabel;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    Z2bbtnEmiChq: TBitBtn;
    dbdtpFEmis: TwwDBDateTimePicker;
    Label24: TLabel;
    PopupMenu1: TPopupMenu;
    Buscar1: TMenuItem;
    N1: TMenuItem;
    Label5: TLabel;
    Label6: TLabel;
    dblcTDiario2: TwwDBLookupCombo;
    dblcTDoc2: TwwDBLookupCombo;
    edtTDoc2: TEdit;
    edtTDiario2: TEdit;
    Label4: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    dblcdCnp2: TwwDBLookupComboDlg;
    edtCnp2: TEdit;
    dblcClaseDet: TwwDBLookupCombo;
    edtClaseDet: TEdit;
    dblcdAuxDet: TwwDBLookupComboDlg;
    dbeAuxDet: TwwDBEdit;
    Label20: TLabel;
    dblcdFEfec: TwwDBLookupComboDlg;
    dbeFEfec: TwwDBEdit;
    edtCuenta: TwwDBLookupComboDlg;
    N2: TMenuItem;
    lkdCxP: TwwLookupDialog;
    dbeTC: TwwDBEdit;
    dbeMPL: TwwDBEdit;
    dbeMPE: TwwDBEdit;

    procedure FormActivate(Sender: TObject);
    procedure IniciaPanel;
    procedure LimpiaFiltros;
    procedure dblcCiaExit(Sender: TObject);
    procedure z2bbtnCancelClick(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dblcTMonChange(Sender: TObject);
    procedure dblcFormPagoChange(Sender: TObject);
    procedure dblcBancoChange(Sender: TObject);
    procedure dblcCCBcoChange(Sender: TObject);
    procedure z2bbtnCalcClick(Sender: TObject);
    procedure dblcTDocChange(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure z2bbtnSumatDocPagoClick(Sender: TObject);
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
    procedure z2bbtnSumatClick(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcCCBcoExit(Sender: TObject);
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
    procedure dbeLoteExit(Sender: TObject);
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
    procedure dblcEmpleadoChange(Sender: TObject);
    procedure dblcEmpleadoExit(Sender: TObject);

    procedure InhabilitarPaneles;
    procedure EdiTarRegistros;
    procedure AdicionarRegistros;
    procedure LiberarFiltrosRegistroEgresos;
    procedure EstablecerFiltrosRegistroEgresos;    
    procedure dbgOtrosDblClick(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeNoChqChange2(Sender: TObject);
    procedure dbeTCambioChange2(Sender: TObject);
    procedure dblcBancoExit2(Sender: TObject);
    procedure dblcCCBcoChange2(Sender: TObject);
    procedure dblcCCBcoExit2(Sender: TObject);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Z2bbtnEmiChqClick(Sender: TObject);
    procedure dbdtpFEmisEnter(Sender: TObject);
    procedure dbdtpFEmisExit(Sender: TObject);
    procedure dbeTCambioEnter(Sender: TObject);
    procedure dbeImporteEnter(Sender: TObject);
    procedure dbeImporteExit(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure dblcTDoc2Enter(Sender: TObject);
    procedure dblcTDoc2Exit2(Sender: TObject);
    procedure dblcClaseDetExit(Sender: TObject);
    procedure dblcdAuxEnter2(Sender: TObject);
    procedure dblcdAuxExit2(Sender: TObject);
    procedure dblcdCnp2Exit2(Sender: TObject);
    procedure wwDBEdit1Change22(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblcdFEfecEnter(Sender: TObject);
    procedure dblcdFEfecExit(Sender: TObject);
    procedure Buscar1Click(Sender: TObject);
    procedure lkdCxPCloseDialog(Dialog: TwwLookupDlg);
    procedure lkdCxPInitDialog(Dialog: TwwLookupDlg);
    procedure z2bbtnCancel3Click(Sender: TObject);
    procedure z2bbtnOK2Click(Sender: TObject);
    procedure dbeTCExit(Sender: TObject);
    procedure dbeMPLExit(Sender: TObject);
    procedure dbeMPEExit(Sender: TObject);
  private
    xRUCCIA : string; // para el ruc de la compañia
    cf1: TControlFoco;
    strTmp: String;
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
    wCCosDif  : String ;
    xTC: Double;
    cdsFiltro   : TwwClientDataset;
    xGraboNuevo : Boolean ;
    wFechaCierre: TDatetime;
    wFrecu      : Integer;
    xMTOCNTLOC  : Currency;
    xMTOCNTEXT  : Currency;
    xMONID_PROV : String;
    xDebeT      : Double;
    xHabeT      : Double;
    //** 04/06/2001-pjsv, para el nuevo dato (CCBCOVOUCH - TGE106 y CAJA302)
    xVoucher : String;
    //**
    { Private declarations }
    Function  ValidacionCabecera:Boolean;
    procedure RecuperaDescrip;
    procedure AdicIniciaDatos;
    procedure IniciaDatos;
    procedure ActualizaSaldosCaja ;
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
    procedure AsientoDifTotal;
  public
    { Public declarations }
    procedure Adiciona ;
    procedure Edita (Comp : structComprobante;cds : Twwclientdataset);
    procedure AsignaCDSFiltro(cds : TwwClientDataset) ;    

  end;

var
  FPagoProvVa: TFPagoProvVa;
  wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado , wbChq,
  wbcancel2: Boolean;
  wmodifica: Boolean;

implementation
uses CAJAUTIL, Caja001, Caja290;
{$R *.DFM}


{******************************************************************************}
procedure TFPagoProvVa.FormActivate(Sender: TObject);
var
 xwhere,xsql : string;
begin
  //** 05/04/2001 - pjsv
  xsql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
  DM1.cdsCCosto.Close;
  DM1.cdsCCosto.DataRequest(xsql);
  DM1.cdsCCosto.open;
  //** 05/06/2001 - pjsv, para grabar el nuevo voucher
  xVoucher := '';
  //**
   //** 06/03/2001 - pjsv - para nelly
   If dm1.cdsFormPago.RecordCount = 1 then
//    If dm1.cdsFormPago.FieldByName('FPAGOID').Asstring = '02' then
     begin
      dblcFormPago.Value := dm1.cdsFormPago.FieldByName('FPAGOID').Asstring;
      dbeNoChq.Enabled :=True  ;
      dbdtpFEmis.Enabled  := True ;
      xWhere := 'FPAGOID='+quotedstr(dblcFormPago.text);
      if DM1.DisplayDescrip('prvQry2','TGE112','FCANJE',xWhere,'FCANJE') = 'S' then
        edtCuenta.Enabled := True
      else
        edtCuenta.Enabled := False ;

      edtFormPago.Text:=DM1.cdsQry.FieldByName('FPAGODES').AsString;
     end;
   dbeLote.text := '000';
   dbeLote.OnExit(self);
   //**
  //**
end;

{******************************************************************************}
procedure TFPagoProvVa.IniciaDatos;
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
//   z2bbtnSumat.Enabled     := False;
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
//2310   dbdtpFComp.Date   := dateS; // Fecha de Comprob.
   edtPeriodo.Text   := '';   // Periodo
   dblcTDiario.Text  := '';   // Tipo de Diario
   edtTDiario.Text   := '';   // Descripción del T.Diario
   dbeNoComp.Text    := '';   // Voucher
   DBLCeMPLEADO.Text := '' ;
//2606   dbeClase1.Text    := '';
   dbeGiradoA.Text   := '';    // Pago Girado A ....
   dblcTMon.Text     := '';   // Tipo de Moneda
   edtTMon.Enabled   := False;
   edtTMon.Text      := '';   // Descripción de la Moneda
   dbeTCambio.Text   := '';   // Tipo de Cambio
   dbeImporte.Text   := '';   // Monto a pagar
   dblcTDoc.Text     := '';   // Tipo de Documento
   edtTDoc.Enabled   := False;
   edtTDoc.Text      := '';   // Descripción del T.Doc
   dbeNoDoc.Text     := '';   // Nro.Documento
   dblcBanco.Text    := '';   // Código de Banco
   edtBanco.Enabled  := False;
   edtBanco.Text     := '';   // Descripción de Banco
   dblcCCBco.Enabled := False;
   dblcCCBco.Text    := '';   // Cuenta Corriente del Banco
   edtCCBco.Enabled  := False;
   edtCCBco.Text     := '';   // Descripción de la Cuenta Corriente
   edtCuenta.Enabled := False;
   edtCuenta.Text    := '';   // Descripción de la Cuenta Contable Principal
   dblcFormPago.Enabled := False;   // Forma de Pago
   dblcFormPago.Text := '';   // Forma de Pago
   edtFormPago.Enabled  := False;
   edtFormPago.Text  := '';   // descripción de forma de pago
   dbeNoChq.Enabled  := False;
   dbeNoChq.Text     := '';   // Cheque
   dbeLote.Text      := '';   // Lote
//   dblcCnp.Text      := '';   // Concepto
   dblcdCnp.Text      := '';   // Concepto
   dbeGlosa.Text     := '';   // Glosa
   dbeGlosa.Text     := '';   // Glosa
   dbdtpFEmis.Date := 0 ;
   lblEstado.Caption := '';   //Inicializar el Estado
   dbeFEfec.Text     := '' ;
   wmodifica         := False;

   dbgOtros.ColumnByName('DEMTOLOC').FooterValue   := '';
   dbgOtros.ColumnByName('DEMTOEXT').FooterValue   := '';

   dbgDocPago.ColumnByName('CPSALLOC').FooterValue := '';
   dbgDocPago.ColumnByName('CPSALEXT').FooterValue := '';
   dbgDocPago.ColumnByName('CCPMOLOC').FooterValue := '';
   dbgDocPago.ColumnByName('CCPMOEXT').FooterValue := '';

   LimpiaFiltros;

   // Documentos Pendientes
//** 21/05/2001 - pjsv ,
   dm1.cdsMovCxP.Close   ;
   dm1.cdsMovCxP.DataRequest( 'SELECT * FROM CXP301 WHERE CIAID=''''');
   dm1.cdsMovCxP.Open;
{   DM1.cdsMovCxP.Filter:='';
   DM1.cdsMovCxP.Filter:='CiaId='+''''+''+'''';
   DM1.cdsMovCxP.Filtered:=True;
}
//**

   // Estableciendo el filtro para que el detalle del grid aparezca vacio

   // vhn 22/01/2001
   xSQL:='Select * from CAJA303 '
        +'Where CIAID='''' and ECANOMM='''' and '
        +      'TDIARID='''' and ECNOCOMP='''' ';
   DM1.cdsDocPago.Close;
   DM1.cdsDocPago.DataRequest( xSQL );
   DM1.cdsDocPago.Open;



//   dblcCia.SetFocus;
    z2bbtnOkCab.Enabled := True ;
{
   RecuperarCiaUnica(dblcCia,edtCia);
   edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
   if dblccia.Text<>'' then
      perform(CM_DialogKey,VK_TAB,0);
}
end;

{******************************************************************************}
{******************** PROCEDIMIENTOS DE LOS COMPONENTES ***********************}
{******************************************************************************}

{******************************************************************************}
procedure TFPagoProvVa.dblcCiaExit(Sender: TObject);
var xsql   : String;
begin
   edtCia.text:= DM1.DisplayDescripLocal(DM1.cdsCia,'CIAID',dblcCia.Text,'CIADES') ;

   if edtCia.Text='' then begin
      ShowMessage('Error : Compañía no Valida');
      dblcCia.SetFocus;
      Exit;
   end;

   dm1.abreCuentas(dblcCia.text) ;

   xsql := 'SELECT CIARUC FROM TGE101 WHERE CIAID='+quotedstr(dblcCia.text);
   dm1.cdsSql.Close;
   dm1.cdsSql.DataRequest(xsql);
   dm1.cdsSQL.Open;
   xRUCCIA := dm1.cdsSql.Fieldbyname('CIARUC').AsString;
end;
{******************************************************************************}
procedure TFPagoProvVa.dbdtpFCompExit(Sender: TObject);
begin
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
      dbdtpFEmis.date := dbdtpFComp.date;
//** 08/06/2001 - pjsv
     dblcBanco.SetFocus;
//**
   end;
end;
{******************************************************************************}
procedure TFPagoProvVa.dblcTDiarioExit(Sender: TObject);
var xWhere:string;
begin
    edtTDiario.Text := DM1.DisplayDescrip('prvTGE','TGE104','TDIARDES','TDIARID='+quotedstr(dblcTDiario.text),'TDIARDES');
    if trim(edtTDiario.Text) <> '' then

      if trim(edtTDiario.Text) <> '' then
      begin
         xWhere:='CIAID='+''''+dblcCia.Text+''''+' AND ECANOMM='+
                ''''+edtPeriodo.Text+''''+' AND TDIARID='+''''+
                dblcTDiario.Text+'''';
         dbeNoComp.text:=DM1.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
         dbeNoComp.SetFocus;
      end ;
end;
{******************************************************************************}
{******************************************************************************}
procedure TFPagoProvVa.dblcTMonChange(Sender: TObject);
var xWhere:string;
begin
   xWhere:='TMONID='+''''+dblcTMon.Text+'''';
   edtTMon.Text:=DM1.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
   if length(edtTMon.Text)>0 then
   begin
      xWhere := 'TMONID='+''''+DM1.wTMonExt+''''
               +' AND FECHA='+''''+datetostr(dbdtpFComp.Date)+'''';
      if length(DM1.DisplayDescrip('prvTGE','TGE107','TCAMVOV',xWhere,'TMONID'))>0 then
          dbeTCambio.Text:=DM1.cdsqry.fieldbyname('TCAMVOV').Value;
   end;
   wmodifica:=True;
end;
{******************************************************************************}
procedure TFPagoProvVa.dblcTMonExit(Sender: TObject);
begin
  edtTMon.text := dm1.DisplayDescrip('prvTGE','TGE103','TMONABR','TMONID='+quotedstr(dblcTMon.text),'TMONABR');
  If edtTMon.text = '' then exit;
  wmodifica:=True;

end;

{******************************************************************************}
procedure TFPagoProvVa.dblcTDocChange(Sender: TObject);
begin
end;

{******************************************************************************}
procedure TFPagoProvVa.dblcTDocExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then exit;
   if dbeNoChq.Focused then exit;
   if dbdtpFEmis.Focused then exit;
   if edtCuenta.Focused then exit;

   edtTDoc.text:= DM1.DisplayDescripLocal(DM1.cdsTDoc,'DOCID',dblcTDoc.Text,'DOCDES') ;

   if edtTDoc.Text='' then begin
      ShowMessage('Error : Tipo de Documento no Valido');
      dblcTDoc.SetFocus;
      Exit;
   end;
end;

{******************************************************************************}
procedure TFPagoProvVa.dblcBancoChange(Sender: TObject);
begin
end;

{******************************************************************************}
procedure TFPagoProvVa.dblcBancoExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then
      exit;

   if length(edtBanco.Text)=0 then
      dblcBanco.Text:='';
end;

{******************************************************************************}
procedure TFPagoProvVa.dblcCCBcoChange(Sender: TObject);
var xWhere:string;
begin
   xWhere:='BANCOID='+''''+dblcBanco.text+''''+' AND CCBCOID='+''''+dblcCCBco.Text+'''';
   edtCCBco.Text :=DM1.DisplayDescrip('prvTGE','TGE106','CCBCODES',xWhere,'CCBCODES');
   if length(edtCCBco.Text)>0 then
   begin
      edtCuenta.Text:=DM1.DisplayDescrip('prvTGE','TGE106','CTAPRINC',xWhere,'CTAPRINC');
   end;
   wmodifica:=True;
end;

{******************************************************************************}
procedure TFPagoProvVa.dblcCCBcoExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then
      exit;

   if length(edtCCBco.Text)=0 then
      dblcCCBco.Text:='';
end;

{******************************************************************************}
procedure TFPagoProvVa.dblcFormPagoChange(Sender: TObject);
var xWhere:string;
begin
   xWhere:='FPAGOID='+''''+dblcFormPago.Text+'''';
   edtFormPago.Text:=DM1.DisplayDescrip('prvTGE','TGE112','FPAGODES, FPAGOBCO',xWhere,'FPAGODES');
   if length(edtFormPago.Text)>0 then
   begin
      if DM1.cdsqry.FieldByName('FPagoBco').Value='S' then
         dbeNoChq.Enabled :=True
      else
      begin
         dbeNoChq.Enabled :=False;
         dbeNoChq.Text :='';
      end;
   end;
   wmodifica:=True;
end;

{******************************************************************************}
{******************************************************************************}
procedure TFPagoProvVa.z2bbtnOKClick(Sender: TObject);
Var xWhere,aux ,xFiltro: string;
    xFlag : boolean ;

begin
   // consistencia de Datos
   ValidaCabecera2 ;
   // En este punto ya se ha probado todas las consistencias y ya se puede grabar

   // Actualizamos el Client Data Set de Egr.Caja (CAJA302)

   with DM1 do
   begin
     cdsEgrCaja.Edit;
     cdsEgrCaja.FieldByName('CIAID').Value   :=dblcCia.Text;
     cdsEgrCaja.FieldByName('TDIARID').Value :=dblcTDiario.Text;
     cdsEgrCaja.FieldByName('ECANOMM').Value :=edtPeriodo.Text;
     cdsEgrCaja.FieldByName('ECNOCOMP').Value:=dbeNoComp.Text;
     cdsEgrCaja.FieldByName('ECFCOMP').Value :=dbdtpFComp.Date;
     cdsEgrCaja.FieldByName('FPAGOID').Value :=dblcFormPago.Text;
     cdsEgrCaja.FieldByName('EQUIID').AsString := EquivFPago( dblcFormPago.Text ,dblcBanco.Text) ;
     cdsEgrCaja.fieldBYName('ECFEMICH').AsDateTime := dbdtpFEmis.Date ;
     cdsEgrCaja.FieldByName('DOCID').Value   :=dblcTDoc.Text;
     cdsEgrCaja.FieldByName('ECNODOC').Value :=dbeNoDoc.Text;
     cdsEgrCaja.FieldByName('TMONID').Value  :=dblcTMon.Text;
     cdsEgrCaja.FieldByName('ECTCAMB').Value :=strtofloat(dbeTCambio.Text);
     cdsEgrCaja.FieldByName('ECMTOORI').Value:=strtofloat(dbeImporte.Text);
     //** 05/06/2001 - pjsv
     cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString := xVoucher;
     //**
     if cdsEgrCaja.FieldByName('TMONID').Value=wTMonLoc then
     begin
        cdsEgrCaja.FieldByName('ECMTOLOC').Value:=strtofloat(dbeImporte.Text);
        cdsEgrCaja.FieldByName('ECMTOEXT').Value:=strtofloat(dbeImporte.Text)/strtofloat(dbeTCambio.Text);
     end
     else
     begin
        cdsEgrCaja.FieldByName('ECMTOLOC').Value:=strtofloat(dbeImporte.Text)*strtofloat(dbeTCambio.Text);
        cdsEgrCaja.FieldByName('ECMTOEXT').Value:=strtofloat(dbeImporte.Text);
     end;
     cdsEgrCaja.FieldByName('BANCOID').Value :=dblcBanco.Text;
     cdsEgrCaja.FieldByName('CCBCOID').Value :=dblcCCBco.Text;
     cdsEgrCaja.FieldByName('ECNOCHQ').Value :=dbeNoChq.Text;
     cdsEgrCaja.FieldByName('USERRESP').AsString := DBLCeMPLEADO.Text ;
     cdsEgrCaja.FieldByName('ECGIRA').Value  :=dbeGiradoA.Text;
     cdsEgrCaja.FieldByName('CPTOID').Value  :=dblcdCnp.Text;
     cdsEgrCaja.FieldByName('CUENTAID').Value:=edtCuenta.Text;
     cdsEgrCaja.FieldByName('ECGLOSA').Value :=dbeGlosa.Text;
     cdsEgrCaja.FieldByName('ECLOTE').Value  :=dbeLote.Text;
     cdsEgrCaja.FieldByName('ECESTADO').Value :='I';

     xWhere:='FECHA=' +DM1.wRepFuncDate + '''' + formatdatetime(DM1.wFormatFecha,dbdtpFComp.Date)+''')' ;
     aux   :=DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');

     //wmc2808
     if trim(dblcdFEfec.Text) = '' then
        cdsEgrCaja.fieldbyname('FLUEID').Clear
     else
        cdsEgrCaja.fieldbyname('FLUEID').AsString := trim(dblcdFEfec.Text) ;
     //
     cdsEgrCaja.FieldByName('ECANO').Value  := cdsqry.FieldByName('FecAno').Value;
     cdsEgrCaja.FieldByName('ECMM').Value   := cdsqry.FieldByName('FecMes').Value;
     cdsEgrCaja.FieldByName('ECDD').Value   := cdsqry.FieldByName('FecDia').Value;
     cdsEgrCaja.FieldByName('ECSS').Value   := cdsqry.FieldByName('FecSS').Value;
     cdsEgrCaja.FieldByName('ECSEM').Value  := cdsqry.FieldByName('FecSem').Value;
     cdsEgrCaja.FieldByName('ECTRI').Value  := cdsqry.FieldByName('FecTrim').Value;
     cdsEgrCaja.FieldByName('ECAASS').Value := cdsqry.FieldByName('FecAASS').Value;
     cdsEgrCaja.FieldByName('ECAASem').Value:= cdsqry.FieldByName('FecAASem').Value;
     cdsEgrCaja.FieldByName('ECAATri').Value:= cdsqry.FieldByName('FecAATri').Value;
     cdsEgrCaja.FieldByName('EC_PROCE').Value:='3';
     cdsEgrCaja.FieldByName('EC_IE').Value   :='E';
   end;

   // Actualizamos el Detalle mostrado en el grid ante posibles cambios del
   // Tipo de Cambio
   if not dm1.cdsRegCxP.Eof then
   begin   //Hay documentos en el detalle
      dm1.cdsRegCxP.DisableControls;
      dm1.cdsRegCxP.First;
      While not dm1.cdsRegCxP.Eof do
      Begin
        dm1.cdsRegCxP.Edit;
        dm1.cdsRegCxP.FieldByName('DETCPAG').Value  := strtofloat(dbeTCambio.Text);
        if DM1.cdsRegCxP.FieldByName('TMONID').Value = dm1.wTMonLoc then
        begin
           DM1.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DM1.cdsRegCxP.FieldByName('DEMTOORI').Value;
           DM1.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DM1.cdsRegCxP.FieldByName('DEMTOORI').Value/DM1.cdsEgrCaja.FieldByName('ECTCAMB').Value;
        end
        else
        begin
           DM1.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DM1.cdsRegCxP.FieldByName('DEMTOORI').Value*DM1.cdsEgrCaja.FieldByName('ECTCAMB').Value;
           DM1.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DM1.cdsRegCxP.FieldByName('DEMTOORI').Value;
        end;
        dm1.cdsRegCxP.Next;
      end;
      dm1.cdsRegCxP.First ;
      dm1.cdsRegCxP.EnableControls;
   end;
   //Actualizamos el Footer
   z2bbtnSumatClick(sender);
//*****************************
   if not dm1.cdsMovCxP.Active then
      xFlag := True
   else
      if dm1.cdsMovCxP.RecordCount = 0 then
         xFlag := true
      else
         xFlag := false ;

//      if dm1.cdsmovcxp.RecordCount = 0 then
      if xFlag then
      begin
         //Comprobar si hay mov seleccionados con otro proveedor
         if xFlag then
         begin
            xWhere := 'CIAID = ''' +dblcCia.Text  + ''' AND ' +
                       ' CPESTADO =' + '''' + 'P' + ''' ' ;

            xFiltro := ' (( (CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR '+
                       '   ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) '  ;
{   //wmci0910
            dm1.cdsMovCxP.Filter   := ''    ;
            dm1.cdsMovCxP.Filtered := False ;
   //wmcf0910
            dm1.cdsMovCxP.active := False   ;
   //wmc1809         dm1.cdsMovCxP.CommandText := 'SELECT * FROM CXP301 WHERE ' + xWhere ;
            dm1.cdsMovCxP.DataRequest( 'SELECT * FROM CXP301 WHERE ' + xWhere+ ' ORDER BY PROV,CPNODOC' );
            dm1.cdsMovCxP.Active := True ;

            dm1.cdsMovCxP.Filter   := xFiltro ;
            dm1.cdsMovCxP.Filtered := True ;
}
            dm1.cdsMovCxP.Filter   := ''    ;
            dm1.cdsMovCxP.Filtered := False ;
            dm1.cdsMovCxP.Close   ;
            dm1.cdsMovCxP.DataRequest( 'SELECT * FROM CXP301 WHERE ' + xWhere+' AND '+xFiltro+' ORDER BY PROV,CPNODOC' );
            dm1.cdsMovCxP.Open;

            if dm1.cdsMovCxP.RecordCount = 0 then
            begin
               ShowMessage('No hay Documentos Pendientes para Proveedor') ;
               exit;
            end;
         end ;
      end ;
//*****************************
   // Estado de los componentes
   pnlCabecera1.enabled  := False;
   pnlCabecera2.enabled  := False;
   pnlDetalle.enabled    := True;
   pnlBotones.Enabled    := True;
   ActPnlBotones;

   z2bbtnOk.Enabled        := False;
   z2bbtnCancel.Enabled    := False;
end;

{******************************************************************************}
procedure TFPagoProvVa.z2bbtnCancelClick(Sender: TObject);
begin
   DM1.cdsEgrCaja.CancelUpdates;
   DM1.cdsRegCxP.CancelUpdates;
   DM1.cdsDocPago.CancelUpdates;
   DM1.cdsMovCxP.CancelUpdates;
{0505
   IniciaDatos;
   z2bbtnokcab.Enabled:=true;
}
   Adiciona ;
   AdicIniciadatos ;
  //** 08/06/2001 - pjsv
  edtEmpleado.text := '';
  dbeLote.text := '000';
  //**
end;

{******************************************************************************}
procedure TFPagoProvVa.z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('C:\windows\calc.exe',1);  //Activa la calculadora del Windows
end;

{******************************************************************************}
procedure TFPagoProvVa.z2bbtnSumatDocPagoClick(Sender: TObject);
Var
   xTSalLoc, xTSalExt, xTPagLoc, xTPagExt : double;
   xRegAct : TBookMark;
begin
   with DM1 do
   begin
   // Totales de Documentos pagados
      cdsDocPago.DisableControls;
      xRegAct := cdsDocPago.GetBookmark;
      xTSalLoc := 0; xTSalExt := 0; xTPagLoc := 0; xTPagExt := 0;
      cdsDocPago.First ;
      while not cdsDocPago.Eof do
      begin
         xTSalLoc := xTSalLoc + cdsDocPago.FieldByName('DESALLOC').Value;
         xTSalExt := xTSalExt + cdsDocPago.FieldByName('DESALEXT').Value;
         xTPagLoc := xTPagLoc + cdsDocPago.FieldByName('DEMtoLoc').Value;
         xTPagExt := xTPagExt + cdsDocPago.FieldByName('DEMTOEXT').Value;
         cdsDocPago.Next;
      end;
      dbgDocPago.ColumnByName('DESALLOC').FooterValue := floattostrf(xTSalLoc, ffNumber, 10, 2);
      dbgDocPago.ColumnByName('DESALEXT').FooterValue := floattostrf(xTSalExt, ffNumber, 10, 2);
      dbgDocPago.ColumnByName('DEMTOLOC').FooterValue := floattostrf(xTPagLoc, ffNumber, 10, 2);
      dbgDocPago.ColumnByName('DEMTOEXT').FooterValue := floattostrf(xTPagExt, ffNumber, 10, 2);
      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);
      cdsDocPago.EnableControls;
   end;
end;
{******************************************************************************}
procedure TFPagoProvVa.z2bbtnSubeClick(Sender: TObject);
begin
   DM1.cdsEgrCaja.Edit;
   DM1.cdsRegCxP.Edit;

   pnlCabecera2.Enabled:= True;
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
procedure TFPagoProvVa.z2bbtnCancel2Click(Sender: TObject);
begin
   if MessageDlg('¿Anular los cambios?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin
      DM1.cdsEgrCaja.CancelUpdates;
      DM1.cdsRegCxP.CancelUpdates;
      DM1.cdsMovCxP.CancelUpdates;
      DM1.cdsDocPago.CancelUpdates;
      IniciaDatos;
      //** 05/06/2001 - pjsv, para grabar el nuevo voucher
      xVoucher := '';
      //**
   end;
end;

{******************************************************************************}
procedure TFPagoProvVa.z2bbtnNuevoClick(Sender: TObject);
begin
   if DM1.cdsEgrCaja.FieldByName('ECEstado').Value ='I' then
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
   xVoucher := '';

end;
{******************************************************************************}
procedure TFPagoProvVa.z2bbtnGrabaClick(Sender: TObject);
begin
   if DM1.cdsEgrCaja.FieldByName('ECEstado').AsString='I' then
   begin
      if MessageDlg('¿Grabar?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
      begin
         ActSaldosMovCxP;

         if not (dm1.cdsEgrCaja.state in [dsinsert,dsedit]) then
            dm1.cdsEgrCaja.edit ;

         DM1.cdsEgrCaja.FieldByName('ECUSER').Value     := DM1.wUsuario; // usuario que registra
         DM1.cdsEgrCaja.FieldByName('ECFREG').Value     := DateS;         // fecha que registra Usuario
         DM1.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;         // Hora de Registro de Usuario
         DM1.cdsEgrCaja.ApplyUpdates(0);

         // ActualizaFiltro ;

         DM1.cdsRegCxP.ApplyUpdates(0);

         DM1.cdsDocPago.ApplyUpdates(0);

         z2bbtnSumatClick(sender);
         
         ShowMessage('Grabacion OK');

         z2bbtnNuevo.Enabled    := True;
         z2bbtnCancelado.Enabled:= True;
         z2bbtnAnula.Enabled    := True;
         z2bbtnImprime.Enabled  := True;
         dblcEmpleado.Enabled   := False ;
         wmodifica:=False;
      end
   end
   else
   begin
      ShowMessage('Imposible Grabar');
   end;
end;

{******************************************************************************}
procedure TFPagoProvVa.z2bbtnCanceladoClick(Sender: TObject);
var
   xConsis:Boolean;
   xSql : String;
begin
   if DM1.cdsEgrCaja.FieldByName('ECEstado').Value='I' then
   begin
      if wmodifica then
      begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      end;

      DM1.cdsRegCxP.DisableControls;
      ConsisCancela(xConsis);
      DM1.cdsRegCxP.EnableControls;
      if not xConsis then
          ShowMessage('No se puede Cancelar el Comprobante')
      else
      begin
          if MessageDlg('¿Efectuar la Cancelacion del Comprobante?',mtConfirmation,
                       [mbYes, mbNo], 0)=mrYes then
          begin

             ActMovCxP         ;
             ActualizaDetCanje ;

             DM1.cdsEgrCaja.Edit;
             DM1.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'C';
             cdsPost(DM1.cdsEgrCaja);

             xSQL:='Select * from CAJA302 '
                  +'Where CIAID='''   +dblcCia.Text    +''' and '
                  +      'ECANOMM=''' +edtPeriodo.Text +''' and '
                  +      'TDIARID=''' +dblcTDiario.Text+''' and '
                  +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
             DM1.cdsEgrCaja.DataRequest( xSQL );

             dm1.AplicaDatos(DM1.cdsEgrCaja,'EGRCAJA');

             z2bbtnSumatClick(sender);
             dbgPendientes.ReadOnly :=True;
             dbgDocPago.ReadOnly    :=True;
             dbgOtros.ReadOnly      :=True;

             z2bbtnCont.Enabled     := True;
             z2bbtnSube.Enabled     := False;
             z2bbtnGraba.Enabled    := False;
             z2bbtnCancelado.Enabled:= False;
             z2bbtnCancel2.Enabled  := False;
             z2bbtnAnula.Enabled    := False;
             dbgOtrosIButton.Enabled := False ;
             lblEstado.Caption    :='Cancelado          ';
             SaldosAux ;
             ActualizaSaldosCaja ;
             // ActualizaFiltro ;
             //
          end;
      end;
   end
   else
   begin
      ShowMessage('Imposible Cancelar');
   end;
end;
{******************************************************************************}
function TFPagoProvVa.ValidaCampo:Boolean;
var xWhere,aux:string;
begin
     Result:=True;
     with DM1 do
     begin

        if length(cdsRegCxP.FieldByName('CPNOREG').Value)=0 then
        begin  //No Registro
           ShowMessage('Falta No Registro');
           Result:=False;
           exit;
        end
        else
        begin
           if length(cdsRegCxP.FieldByName('CPNOREG').Value)<6 then
           begin
              ShowMessage('Codigo de Registro Errado');
              Result:=False;
              exit;
           end;
        end;

        if length(cdsRegCxP.FieldByName('TDIARID2').Value)=0 then
        begin  //Tipo de Diario
           ShowMessage('Falta Tipo de Diario');
           Result:=False;
           exit;
        end
        else
        begin
           xWhere:='TDIARID='+''''+cdsRegCxP.FieldByName('TDIARID2').Value+'''';
           aux   :=DisplayDescrip('prvTGE','TGE104','TDIARDES',xWhere,'TDIARDES');
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Tipo de Diario Errado');
              Result:=False;
              exit;
           end;
        end;

        if length(cdsRegCxP.FieldByName('DOCID2').Value)=0 then
        begin  //Tipo de Documento
           ShowMessage('Falta Tipo de Documento');
           Result:=False;
           exit;
        end
        else
        begin
           xWhere:='DOCID='+''''+cdsRegCxP.FieldByName('DOCID2').Value+'''';
           aux   :=DisplayDescrip('prvTGE','TGE110','DOCDES',xWhere,'DOCDES');
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Tipo de Documento Errado');
              Result:=False;
              exit;
           end;
        end;

        if cdsRegCxP.FieldByName('CPSERIE').Value='' then
        begin      //Serie
           ShowMessage('Falta Serie');
           Result:=False;
           exit;
        end;

        if cdsRegCxP.FieldByName('CPNODOC').Value='' then
        begin      //No Documento
           ShowMessage('Falta Nro. de Documento');
           Result:=False;
           exit;
        end;

        if length(cdsRegCxP.FieldByName('TMONID').Value)=0 then
        begin //Tipo de Moneda
           ShowMessage('Falta Tipo de Moneda');
           Result:=False;
           exit;
        end
        else
        begin
           xWhere:='TMONID='+''''+cdsRegCxP.FieldByName('TMONID').Value+'''';
           aux   :=DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Tipo de Moneda Errado');
              Result:=False;
              exit;
           end;
        end;

        if cdsRegCxP.FieldByName('DETCDOC').Value<=0 Then
        begin // Tipo de Cambio Detalle
           ShowMessage('Tipo de Cambio debe ser mayor que cero');
           Result:=False;
           exit;
        end;

        if cdsRegCxP.FieldByName('DEMTOORI').Value<=0 Then
        begin   //Importe
           ShowMessage('Importe debe ser mayor que cero');
           Result:=False;
           exit;
        end;

        if cdsRegCxP.FieldByName('CPTOID').Value='' then
        begin      //Concepto
           ShowMessage('Falta Concepto');
           Result:=False;
           exit;
        end
        else
        begin                             // Cuenta
           aux:=cdsRegCxP.FieldByName('CUENTAID').Value;
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Concepto Errado');
              Result:=False;
              exit;
           end;
        end;

//Validación de centro de costo y auxiliares
        if (dblcdCCosto.Enabled) then
        begin  //Centro de Costo
          IF (length(cdsRegCxP.FieldByName('CCOSID').Value)=0) THEN
          BEGIN
              ShowMessage('Falta Centro de Costo') ;
              Result:=False ;
              exit ;
          END
          else
          begin
           xWhere:='CCosID='+''''+cdsRegCxP.FieldByName('CCOSID').Value+'''' ;
           aux   :=DisplayDescrip('prvTGE','TGE203','CCOSDES',xWhere,'CCosDes') ;
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

        if cdsRegCxP.FieldByName('CPFVCMTO').Value<cdsRegCxP.FieldByName('CPFEMIS').Value then
        begin //Fecha de Vencimiento
             ShowMessage('Fecha de Vencimiento debe ser posterior a la Fecha de Emision');
             Result:=False;
             exit;
        end;
    end;
end;
{******************************************************************************}
procedure TFPagoProvVa.ConsisCancela(Var xConsis:boolean);
var
    xRegAct : TBookMark;
    xSumImp , Suma : Currency;
begin
   xConsis := True;
   xSumImp := 0;
   With DM1 do
   begin
      xRegAct := cdsRegCxP.GetBookmark;
      cdsRegCxP.First ;
      While not cdsRegCxP.Eof do
      Begin
         if cdsRegCxP.FieldByName('DEDH').Value='D' then
            if cdsEgrCaja.FieldByName('TMONID').Value = wtMonLoc then
               xSumImp := xSumImp + strToCurr(stringreplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]))
            else
               xSumImp := xSumImp + strToCurr(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]))
         else
            if cdsEgrCaja.FieldByName('TMONID').Value = wtMonLoc then
               xSumImp := xSumImp - strToCurr( stringreplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) )
            else
               xSumImp := xSumImp - strToCurr( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) ) ;

         cdsRegCxP.Next;
      end;
      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);

      // Adicionamos el total de los Documentos Pagados
      xRegAct := cdsDocPago.GetBookmark;
      cdsDocPago.First ;
      While not cdsDocPago.Eof do
      Begin
         if cdsEgrCaja.FieldByName('TMONID').Value = wtMonLoc then
            xSumImp := xSumImp + strToCurr(stringreplace(cdsDocPago.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]))
         else
            xSumImp := xSumImp + strToCurr(stringReplace(cdsDocPago.FieldByName('DEMTOEXT').DisPlayText,',','',[rfReplaceAll])) ;

         cdsDocPago.Next;
      end;
      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);
   end;
/////
      if dm1.cdsEgrCaja.FieldByName('TMONID').Value = dm1.wtMonLoc then
         Suma :=  strtocurr(floattostrf(dm1.cdsEgrCaja.fieldbyname('ECMTOLOC').AsFloat,fffixed,10,2))
      else
         Suma :=  strtocurr(floattostrf(dm1.cdsEgrCaja.fieldbyname('ECMTOEXT').AsFloat,fffixed,10,2)) ;
/////
   // Comparamos
//   if Cajadec(currtostr(xSumImp)) <> cajaDEc(DM1.cdsEgrCajaECMTOORI.AsString) then
   if xSumImp <> Suma then
   begin
        xConsis := False;
        if Suma > xSumImp then
           ShowMessage('El Monto a Pagar es mayor que el Provisionado')
        else
           ShowMessage('El Monto a Pagar es menor que el Provisionado');
   end;
{
   xConsis := True;
   xSumImp := 0;
   With DM1 do
   begin
      xRegAct := cdsRegCxP.GetBookmark;
      cdsRegCxP.First ;
      While not cdsRegCxP.Eof do
      Begin
         if cdsRegCxPDEDH.Value='D' then
            if cdsEgrCajaTMONID.Value = wtMonLoc then
               xSumImp := xSumImp + cdsRegCxPDEMTOLOC.Value
            else
               xSumImp := xSumImp + cdsRegCxPDEMTOEXT.Value
         else
            if cdsEgrCajaTMONID.Value = wtMonLoc then
               xSumImp := xSumImp - cdsRegCxPDEMTOLOC.Value
            else
               xSumImp := xSumImp - cdsRegCxPDEMTOEXT.Value;

         cdsRegCxP.Next;
      end;
      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);

      // Adicionamos el total de los Documentos Pagados
      xRegAct := cdsDocPago.GetBookmark;
      cdsDocPago.First ;
      While not cdsDocPago.Eof do
      Begin
         if cdsEgrCajaTMONID.Value = wtMonLoc then
            xSumImp := xSumImp + cdsDocPagoDEMTOLOC.Value
         else
            xSumImp := xSumImp + cdsDocPagoDEMTOEXT.Value;

         cdsDocPago.Next;
      end;
      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);
   end;

   // Comparamos
   if xSumImp <> DM1.cdsEgrCajaECMTOORI.Value then
   begin
        xConsis := False;
        if DM1.cdsEgrCajaECMTOORI.Value > xSumImp then
           ShowMessage('El Monto a Pagar es mayor que el Provisionado')
        else
           ShowMessage('El Monto a Pagar es menor que el Provisionado');
   end;
}

end;
{******************************************************************************}
procedure TFPagoProvVa.Contab_Haber;
begin
    dm1.cdsCntCaja.FieldByName('CIAID').AsString   :=  dm1.cdsEgrcaja.FieldByName('CIAID').AsString;
    dm1.cdsCntCaja.FieldByName('TDIARID').AsString :=  dm1.cdsEgrCaja.FieldByName('TDIARID').AsString;
    dm1.cdsCntCaja.FieldByName('ECNOCOMP').AsString :=  dm1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
    dm1.cdsCntCaja.FieldByName('DOCID').AsString    :=  dm1.cdsEgrCaja.FieldByName('DOCID').AsString;
    dm1.cdsCntCaja.FieldByName('DCNODOC').AsString  :=  dm1.cdsEgrCaja.FieldByName('ECNODOC').AsString;
    dm1.cdsCntCaja.FieldByName('ECFCOMP').AsString  :=  dm1.cdsEgrCaja.FieldByName('ECFCOMP').AsString;
    dm1.cdsCntCaja.FieldByName('CPTOID').AsString   :=  dm1.cdsEgrCaja.FieldByName('CPTOID').AsString;
    dm1.cdsCntCaja.FieldByName('CUENTAID').AsString :=  dm1.cdsEgrCaja.FieldByName('CUENTAID').AsString;
    dm1.cdsCntCaja.FieldByName('DCDH').AsString   :=  'H';
    dm1.cdsCntCaja.FieldByName('TMONID').AsString   :=  dm1.cdsEgrCaja.FieldByName('TMONID').AsString;
    dm1.cdsCntCaja.FieldByName('DCMTOORI').AsString :=  dm1.cdsEgrCaja.FieldByName('ECMTOORI').AsString;
    dm1.cdsCntCaja.FieldByName('DCMTOLO').AsString :=  dm1.cdsEgrCaja.FieldByName('ECMTOLOC').AsString;
    dm1.cdsCntCaja.FieldByName('DCMTOEXT').AsString :=  dm1.cdsEgrCaja.FieldByName('ECMTOEXT').AsString;
    dm1.cdsCntCaja.FieldByName('DCFLACDR').AsString :=  'S';   //Registro ya cuadrado
    dm1.cdsCntCaja.FieldByName('DCUSER').AsString  :=  DM1.wUsuario;
    dm1.cdsCntCaja.FieldByName('DCFREG').AsString  :=  DateToStr(Date);
    dm1.cdsCntCaja.FieldByName('DCHREG').AsString  :=  TimeToStr(Time);
    dm1.cdsCntCaja.FieldByName('ECANOMM').AsString :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').AsString;
    dm1.cdsCntCaja.FieldByName('DCLOTE').AsString  :=  dm1.cdsEgrCaja.FieldByName('ECLOTE').AsString;
    dm1.cdsCntCaja.FieldByName('DCANO').AsString   :=  dm1.cdsEgrCaja.FieldByName('ECANO').AsString;
    dm1.cdsCntCaja.FieldByName('DCMM').AsString    :=  dm1.cdsEgrCaja.FieldByName('ECMM').AsString;
    dm1.cdsCntCaja.FieldByName('DCDD').AsString    :=  dm1.cdsEgrCaja.FieldByName('ECDD').AsString;
    dm1.cdsCntCaja.FieldByName('DCSS').AsString    :=  dm1.cdsEgrCaja.FieldByName('ECSS').AsString;
    dm1.cdsCntCaja.FieldByName('DCSEM').AsString   :=  dm1.cdsEgrCaja.FieldByName('ECSEM').AsString;
    dm1.cdsCntCaja.FieldByName('DCTRI').AsString   :=  dm1.cdsEgrCaja.FieldByName('ECTRI').AsString;
    dm1.cdsCntCaja.FieldByName('DCAASS').AsString  :=  dm1.cdsEgrCaja.FieldByName('ECAASS').AsString;
    dm1.cdsCntCaja.FieldByName('DCAASEM').AsString :=  dm1.cdsEgrCaja.FieldByName('ECAASEM').AsString;
    dm1.cdsCntCaja.FieldByName('DCAATRI').AsString :=  dm1.cdsEgrCaja.FieldByName('ECAATRI').AsString;
    DM1.cdsCntCaja.fieldbyname('DOCMOD').AsString := Fprincipal.xModulo;
    dm1.cdsCntCaja.FieldByName('DCGLOSA').AsString := dm1.cdsEgrCaja.fieldBYName('ECGLOSA').AsString ;
    dm1.cdsCntCaja.FieldByName('DCTCAMPA').AsString := dbeTCambio.Text ;
    dm1.cdsCntCaja.FieldByName('DCTCAMPR').AsString := dbeTCambio.Text ;
    dm1.cdsCntCaja.FieldByName('FCAB').AsString := '1' ;
   //** 28/12/2001 - PJSV
   dm1.cdsCntCaja.fieldbyname('DCTCAMPR').AsString :=dm1.cdsEgrCaja.fieldbyname('ECTCAMB').AsString;
   dm1.cdsCntCaja.fieldbyname('DCTCAMPA').AsString :=dm1.cdsEgrCaja.fieldbyname('ECTCAMB').AsString;
   if DM1.cdsCntCaja.fieldbyName('DCDH').asString = 'D'  then
    begin
     if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
      DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
     else
      DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
    end
   else
    begin
     if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
      DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
     else
      DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
    end;
   //**


end;
{******************************************************************************}
procedure TFPagoProvVa.Contab_RegCxP;
begin
    dm1.cdsCntCaja.FieldByName('CIAID').Value   :=  dm1.cdsRegCxP.FieldByName('CIAID').Value;
    dm1.cdsCntCaja.FieldByName('TDIARID').Value :=  dm1.cdsRegCxP.FieldByName('TDIARID').Value;
    dm1.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  dm1.cdsRegCxP.FieldByName('ECNOCOMP').Value;
    dm1.cdsCntCaja.FieldByName('DOCID').Value   :=  dm1.cdsRegCxP.FieldByName('DOCID2').Value;
    dm1.cdsCntCaja.FieldByName('DCSERIE').Value :=  dm1.cdsRegCxP.FieldByName('CPSERIE').Value;
    dm1.cdsCntCaja.FieldByName('DCNODOC').Value :=  dm1.cdsRegCxP.FieldByName('CPNODOC').Value;
    dm1.cdsCntCaja.FieldByName('ECFCOMP').Value :=  dm1.cdsRegCxP.FieldByName('DEFCOMP').Value;
    dm1.cdsCntCaja.FieldByName('DCFEMIS').Value :=  dm1.cdsRegCxP.FieldByName('CPFEMIS').Value;
    dm1.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  dm1.cdsRegCxP.FieldByName('CPFVCMTO').Value;
    dm1.cdsCntCaja.FieldByName('CPTOID').Value  :=  dm1.cdsRegCxP.FieldByName('CPTOID').Value;
    dm1.cdsCntCaja.FieldByName('CUENTAID').Value:=  dm1.cdsRegCxP.FieldByName('CUENTAID').Value;
    dm1.cdsCntCaja.FieldByName('CLAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
    dm1.cdsCntCaja.FieldByName('DCAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
    dm1.cdsCntCaja.FieldByName('CCOSID').Value  :=  dm1.cdsRegCxP.FieldByName('CCOSID').Value;
    dm1.cdsCntCaja.FieldByName('DCDH').Value    :=  dm1.cdsRegCxP.FieldByName('DEDH').Value;
    dm1.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  dm1.cdsRegCxP.FieldByName('DETCPAG').Value;
    dm1.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  dm1.cdsRegCxP.FieldByName('DETCDOC').Value;
    dm1.cdsCntCaja.FieldByName('TMONID').Value  :=  dm1.cdsRegCxP.FieldByName('TMONID').Value;
    dm1.cdsCntCaja.FieldByName('DCMTOORI').Value:=  dm1.cdsRegCxP.FieldByName('DEMTOORI').Value;
    if dm1.cdsRegCxP.FieldByName('TMONID').Value = dm1.wtMonLoc then
    begin
       dm1.cdsCntCaja.FieldByName('DCMTOLO').Value := dm1.cdsRegCxP.FieldByName('DEMTOLOC').Value;
       dm1.cdsCntCaja.FieldByName('DCMTOEXT').Value:= dm1.cdsRegCxP.FieldByName('DEMTOLOC').Value / dm1.cdsRegCxP.FieldByName('DETCDOC').Value;
    end
    else
    begin
       dm1.cdsCntCaja.FieldByName('DCMTOEXT').Value:= dm1.cdsRegCxP.FieldByName('DEMTOEXT').Value;
       dm1.cdsCntCaja.FieldByName('DCMTOLO').Value := dm1.cdsRegCxP.FieldByName('DEMTOEXT').Value * dm1.cdsRegCxP.FieldByName('DETCDOC').Value;
    end;

    dm1.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
    dm1.cdsCntCaja.FieldByName('DCUSER').Value  :=  DM1.wUsuario;
    dm1.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
    dm1.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
    dm1.cdsCntCaja.FieldByName('ECANOMM').Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
    dm1.cdsCntCaja.FieldByName('DCLOTE').Value  :=  dm1.cdsEgrCaja.FieldByName('ECLOTE').Value;
    dm1.cdsCntCaja.FieldByName('DCANO').Value   :=  dm1.cdsEgrCaja.FieldByName('ECANO').Value;
    dm1.cdsCntCaja.FieldByName('DCMM').Value    :=  dm1.cdsEgrCaja.FieldByName('ECMM').Value;
    dm1.cdsCntCaja.FieldByName('DCDD').Value    :=  dm1.cdsEgrCaja.FieldByName('ECDD').Value;
    dm1.cdsCntCaja.FieldByName('DCSS').Value    :=  dm1.cdsEgrCaja.FieldByName('ECSS').Value;
    dm1.cdsCntCaja.FieldByName('DCSEM').Value   :=  dm1.cdsEgrCaja.FieldByName('ECSEM').Value;
    dm1.cdsCntCaja.FieldByName('DCTRI').Value   :=  dm1.cdsEgrCaja.FieldByName('ECTRI').Value;
    dm1.cdsCntCaja.FieldByName('DCAASS').Value  :=  dm1.cdsEgrCaja.FieldByName('ECAASS').Value;
    dm1.cdsCntCaja.FieldByName('DCAASEM').Value :=  dm1.cdsEgrCaja.FieldByName('ECAASEM').Value;
    dm1.cdsCntCaja.FieldByName('DCAATRI').Value :=  dm1.cdsEgrCaja.FieldByName('ECAATRI').Value;
    DM1.cdsCntCaja.fieldbyname('DOCMOD').AsString := 'CXP';
    //** 28/12/2001 - PJSV
   if DM1.cdsCntCaja.fieldbyName('DCDH').asString = 'D'  then
    begin
     if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
      DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
     else
      DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
    end
   else
    begin
     if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
      DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
     else
      DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
    end;
   //**

end;
{******************************************************************************}
procedure TFPagoProvVa.Contab_DocPago;
var
   xWhere      : String ;
begin
   { recuperar provisión }
    xWhere := ' CIAID = '''          + dm1.cdsDocPago.fieldbyname('CIAID').AsString    + ''''
              + ' AND CPANOMES = ''' + dm1.cdsDocPago.fieldbyname('CPANOMM').AsString  + ''''
              + ' AND TDIARID = '''  + dm1.cdsDocPago.fieldbyname('TDIARID2').AsString + ''''
              + ' AND CPNOREG = '''  + dm1.cdsDocPago.fieldbyname('CPNOREG').AsString  + ''''  ;
    if dm1.RecuperarDatos( 'CXP301' , 'TMONID' , xWhere ) then
    begin
       xMONID_PROV := dm1.cdsRec.fieldbyname('TMONID').AsString ;
    end
    else
       Showmessage('Error en la recuperación del documento - WMC') ;

    dm1.cdsCntCaja.FieldByName('CIAID').Value   :=  dm1.cdsEgrCaja.FieldByName('CIAID').Value;
    dm1.cdsCntCaja.FieldByName('TDIARID').Value :=  dm1.cdsEgrCaja.FieldByName('TDIARID').Value;
    dm1.cdsCntCaja.FieldByName('ECANOMM').Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
    dm1.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  dm1.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
    dm1.cdsCntCaja.FieldByName('DOCID').Value   :=  dm1.cdsDocPago.FieldByName('DOCID2').Value;
    DM1.cdsCntCaja.fieldbyname('DOCMOD').AsString := 'CXP';
    dm1.cdsCntCaja.FieldByName('DCSERIE').Value :=  dm1.cdsDocPago.FieldByName('CPSERIE').Value;
    dm1.cdsCntCaja.FieldByName('DCNODOC').Value :=  dm1.cdsDocPago.FieldByName('CPNODOC').Value;
    dm1.cdsCntCaja.FieldByName('ECFCOMP').Value :=  dm1.cdsEgrCaja.FieldByName('ECFCOMP').Value;
    dm1.cdsCntCaja.FieldByName('DCFEMIS').Value :=  dm1.cdsDocPago.FieldByName('CPFEMIS').Value;
    dm1.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  dm1.cdsDocPago.FieldByName('CPFVCMTO').Value;
    dm1.cdsCntCaja.FieldByName('CPTOID').Value  :=  dm1.cdsDocPago.FieldByName('CPTOID').Value;
    dm1.cdsCntCaja.FieldByName('CUENTAID').Value:=  dm1.cdsDocPago.FieldByName('CUENTAID').Value;
    dm1.cdsCntCaja.FieldByName('CLAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
    dm1.cdsCntCaja.FieldByName('DCAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
    dm1.cdsCntCaja.FieldByName('DCDH').Value    :=  'D';
    dm1.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  dm1.cdsDocPago.FieldByName('DETCPAG').Value  ;
    dm1.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  dm1.cdsDocPago.FieldByName('DETCDOC').Value  ;
    dm1.cdsCntCaja.FieldByName('TMONID').Value  :=  dm1.cdsDocPago.FieldByName('TMONID').Value   ;
    dm1.cdsCntCaja.FieldByName('DCMTOORI').Value:=  dm1.cdsDocPago.FieldByName('DEMTOORI').Value ;
    if xMONID_PROV = dm1.wTMonLoc then
     begin
       xMTOCNTLOC := Redondea( dm1.cdsDocPago.FieldByName('DEMTOLOC').AsFloat ) ;
       xMTOCNTEXT := Redondea( dm1.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / dm1.cdsDocPago.FieldByName('DETCDOC').AsFloat ) ;
       dm1.cdsCntCaja.FieldByName('DCMTOLO').Value        := xMTOCNTLOC ;
       dm1.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat  := xMTOCNTEXT ;
     end
    else
     begin
       xMTOCNTEXT := Redondea( dm1.cdsDocPago.FieldByName('DEMTOEXT').AsFloat ) ;
       xMTOCNTLOC := Redondea( dm1.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * dm1.cdsDocPago.FieldByName('DETCDOC').AsFloat ) ;
       dm1.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat  := xMTOCNTLOC ;
       dm1.cdsCntCaja.FieldByName('DCMTOLO').Value        := xMTOCNTEXT ;
     end ;
    dm1.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
    dm1.cdsCntCaja.FieldByName('DCUSER').Value  :=  DM1.wUsuario;
    dm1.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
    dm1.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
    dm1.cdsCntCaja.FieldByName('ECANOMM').Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
    dm1.cdsCntCaja.FieldByName('DCLOTE').Value  :=  dm1.cdsEgrCaja.FieldByName('ECLOTE').Value;
    dm1.cdsCntCaja.FieldByName('DCANO').Value   :=  dm1.cdsEgrCaja.FieldByName('ECANO').Value;
    dm1.cdsCntCaja.FieldByName('DCMM').Value    :=  dm1.cdsEgrCaja.FieldByName('ECMM').Value;
    dm1.cdsCntCaja.FieldByName('DCDD').Value    :=  dm1.cdsEgrCaja.FieldByName('ECDD').Value;
    dm1.cdsCntCaja.FieldByName('DCSS').Value    :=  dm1.cdsEgrCaja.FieldByName('ECSS').Value;
    dm1.cdsCntCaja.FieldByName('DCSEM').Value   :=  dm1.cdsEgrCaja.FieldByName('ECSEM').Value;
    dm1.cdsCntCaja.FieldByName('DCTRI').Value   :=  dm1.cdsEgrCaja.FieldByName('ECTRI').Value;
    dm1.cdsCntCaja.FieldByName('DCAASS').Value  :=  dm1.cdsEgrCaja.FieldByName('ECAASS').Value;
    dm1.cdsCntCaja.FieldByName('DCAASEM').Value :=  dm1.cdsEgrCaja.FieldByName('ECAASEM').Value;
    dm1.cdsCntCaja.FieldByName('DCAATRI').Value :=  dm1.cdsEgrCaja.FieldByName('ECAATRI').Value;
     //** 28/12/2001 - PJSV
     if DM1.cdsCntCaja.fieldbyName('DCDH').asString = 'D'  then
      begin
       if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
        DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
       else
        DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
      end
     else
      begin
       if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
        DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
       else
        DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
      end;
     //**

end;

{******************************************************************************}
procedure TFPagoProvVa.Contab_DifCamDocPago;
var
 xSql1,xSql : String;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   //08/05/2001 - pjsv
   // se valida por sugerencia de Jorge y Jose, me confirmaron que por el tipo
  // de moneda de la cabecera, para que no genere <> de cambio cuando es local
  //** 06/09/2001 - por sugerencia de Jorge y Jose se vuelve a cambiar, basta que uno sea
  //** Extranjero debe generar <> de Cambio
   xsql := 'TMONID='+quotedstr(dblcTMon.Text);
   xsql1 := 'TMONID='+quotedstr(dm1.cdsDocPago.fieldbyname('TMONID').AsString);
   If (dm1.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') or
      (dm1.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then
    begin
     if DM1.cdsDocPago.FieldByName('DETCDOC').Value <> DM1.cdsDocPago.FieldByName('DETCPAG').Value then
     begin
        DM1.cdsCntCaja.Insert;
        DM1.cdsCntCaja.FieldByName('CIAID').Value   :=  DM1.cdsEgrCaja.FieldByName('CIAID').Value;
        DM1.cdsCntCaja.FieldByName('TDIARID').Value :=  DM1.cdsEgrCaja.FieldByName('TDIARID').Value;
        DM1.cdsCntCaja.FieldByName('ECANOMM').Value :=  DM1.cdsEgrCaja.FieldByName('ECANOMM').Value;
        DM1.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DM1.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
        DM1.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DM1.cdsEgrCaja.FieldByName('ECLOTE').Value;
        DM1.cdsCntCaja.FieldByName('DOCID').Value   :=  DM1.cdsDocPago.FieldByName('DOCID2').Value;
        DM1.cdsCntCaja.FieldByName('DOCMOD').Value  :=  'CXP';
        DM1.cdsCntCaja.FieldByName('DCSERIE').Value :=  DM1.cdsDocPago.FieldByName('CPSERIE').Value;
        DM1.cdsCntCaja.FieldByName('DCNODOC').Value :=  DM1.cdsDocPago.FieldByName('CPNODOC').Value;
        DM1.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DM1.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DM1.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        DM1.cdsCntCaja.FieldByName('CUENTAID').Value:=  DM1.cdsDocPago.FieldByName('CUENTAID').Value;
        DM1.cdsCntCaja.FieldByName('CLAUXID').AsString :=  DM1.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
        DM1.cdsCntCaja.FieldByName('DCAUXID').AsString :=  DM1.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
        DM1.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DM1.cdsDocPago.FieldByName('DETCPAG').Value;
        DM1.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DM1.cdsDocPago.FieldByName('DETCDOC').Value;
        DM1.cdsCntCaja.FieldByName('DCANO').Value   :=  DM1.cdsEgrCaja.FieldByName('ECANO').Value;
        DM1.cdsCntCaja.FieldByName('DCMM').Value    :=  DM1.cdsEgrCaja.FieldByName('ECMM').Value;
        DM1.cdsCntCaja.FieldByName('DCDD').Value    :=  DM1.cdsEgrCaja.FieldByName('ECDD').Value;
        DM1.cdsCntCaja.FieldByName('DCSS').Value    :=  DM1.cdsEgrCaja.FieldByName('ECSS').Value;
        DM1.cdsCntCaja.FieldByName('DCSEM').Value   :=  DM1.cdsEgrCaja.FieldByName('ECSEM').Value;
        DM1.cdsCntCaja.FieldByName('DCTRI').Value   :=  DM1.cdsEgrCaja.FieldByName('ECTRI').Value;
        DM1.cdsCntCaja.FieldByName('DCAASS').Value  :=  DM1.cdsEgrCaja.FieldByName('ECAASS').Value;
        DM1.cdsCntCaja.FieldByName('DCAASEM').Value :=  DM1.cdsEgrCaja.FieldByName('ECAASEM').Value;
        DM1.cdsCntCaja.FieldByName('DCAATRI').Value :=  DM1.cdsEgrCaja.FieldByName('ECAATRI').Value;
        DM1.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
        DM1.cdsCntCaja.FieldByName('DCUSER').Value  :=  DM1.wUsuario;
        DM1.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
        DM1.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
        DM1.cdsCntCaja.FieldByName('TMONID').Value  :=  DM1.cdsEgrCaja.FieldByName('TMONID').Value;
        if xMONID_PROV = DM1.wTMonLoc then
         begin
           DM1.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DM1.cdsDocPago.FieldByName('DEMTOEXT').AsFloat-xMTOCNTEXT ;
           DM1.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DM1.cdsDocPago.FieldByName('DEMTOLOC').AsFloat-xMTOCNTLOC ;
           DM1.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DM1.cdsDocPago.FieldByName('DEMTOLOC').AsFloat-xMTOCNTLOC ;
           if DM1.cdsDocPago.FieldByName('DETCDOC').AsFloat > DM1.cdsDocPago.FieldByName('DETCPAG').AsFloat then
              DM1.cdsCntCaja.FieldByName('DCDH').Value := 'D'
           else
              DM1.cdsCntCaja.FieldByName('DCDH').Value := 'H';
         end
        else
         begin
          DM1.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := DM1.cdsDocPago.FieldByName('DEMTOEXT').AsFloat-xMTOCNTEXT ;
          DM1.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := DM1.cdsDocPago.FieldByName('DEMTOEXT').AsFloat-xMTOCNTEXT ;
          DM1.cdsCntCaja.FieldByName('DCMTOLO').AsFloat := DM1.cdsDocPago.FieldByName('DEMTOLOC').AsFloat-xMTOCNTLOC;
           if DM1.cdsDocPago.FieldByName('DETCDOC').AsFloat > DM1.cdsDocPago.FieldByName('DETCPAG').AsFloat then
              DM1.cdsCntCaja.FieldByName('DCDH').Value := 'H'
           else
              DM1.cdsCntCaja.FieldByName('DCDH').Value := 'D';
         end ;
        if DM1.cdsCntCaja.FieldByName('DCDH').Value = 'D' then
         begin
           DM1.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoPer;
           DM1.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaPer;
         end
        else
         begin
           DM1.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
           DM1.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
         end;
       //** 28/12/2001 - PJSV
       if DM1.cdsCntCaja.fieldbyName('DCDH').asString = 'D'  then
        begin
         if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
          DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
         else
          DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
        end
       else
        begin
         if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
          DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
         else
          DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
        end;
       //**
     end
    end;
end;


procedure TFPagoProvVa.Contab_DifCamDocPago2;
var
 xSql,xSql1 : String;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   xsql := 'TMONID='+quotedstr(dblcTMon.Text);
   xsql1 := 'TMONID='+quotedstr(dm1.cdsDocPago.fieldbyname('TMONID').AsString);
   If (dm1.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') or
      (dm1.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then
    begin

     if dm1.cdsDocPago.FieldByName('DETCDOC').Value <> dm1.cdsDocPago.FieldByName('DETCPAG').Value then
     begin
        DM1.cdsCntCaja.Insert;
        dm1.cdsCntCaja.FieldByName('CIAID').Value   :=  dm1.cdsEgrCaja.FieldByName('CIAID').Value;
        dm1.cdsCntCaja.FieldByName('TDIARID').Value :=  dm1.cdsEgrCaja.FieldByName('TDIARID').Value;
        dm1.cdsCntCaja.FieldByName('ECANOMM').Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
        dm1.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  dm1.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
        dm1.cdsCntCaja.FieldByName('DOCID').Value   :=  dm1.cdsDocPago.FieldByName('DOCID2').Value;
        DM1.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
        dm1.cdsCntCaja.FieldByName('DCSERIE').Value :=  dm1.cdsDocPago.FieldByName('CPSERIE').Value;
        dm1.cdsCntCaja.FieldByName('DCNODOC').Value :=  dm1.cdsDocPago.FieldByName('CPNODOC').Value;
        dm1.cdsCntCaja.FieldByName('ECFCOMP').Value :=  dm1.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        dm1.cdsCntCaja.FieldByName('DCFEMIS').Value :=  dm1.cdsDocPago.FieldByName('CPFEMIS').Value;
        dm1.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  dm1.cdsDocPago.FieldByName('CPFVCMTO').Value;
        dm1.cdsCntCaja.FieldByName('CPTOID').Value  :=  dm1.cdsDocPago.FieldByName('CPTOID').Value;
        dm1.cdsCntCaja.FieldByName('CUENTAID').Value:=  dm1.cdsDocPago.FieldByName('CUENTAID').Value;
        dm1.cdsCntCaja.FieldByName('CLAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
        dm1.cdsCntCaja.FieldByName('DCAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
        dm1.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  dm1.cdsDocPago.FieldByName('DETCPAG').Value;
        dm1.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  dm1.cdsDocPago.FieldByName('DETCDOC').Value;
        dm1.cdsCntCaja.FieldByName('ECANOMM').Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
        dm1.cdsCntCaja.FieldByName('DCLOTE').Value  :=  dm1.cdsEgrCaja.FieldByName('ECLOTE').Value;
        dm1.cdsCntCaja.FieldByName('DCANO').Value   :=  dm1.cdsEgrCaja.FieldByName('ECANO').Value;
        dm1.cdsCntCaja.FieldByName('DCMM').Value    :=  dm1.cdsEgrCaja.FieldByName('ECMM').Value;
        dm1.cdsCntCaja.FieldByName('DCDD').Value    :=  dm1.cdsEgrCaja.FieldByName('ECDD').Value;
        dm1.cdsCntCaja.FieldByName('DCSS').Value    :=  dm1.cdsEgrCaja.FieldByName('ECSS').Value;
        dm1.cdsCntCaja.FieldByName('DCSEM').Value   :=  dm1.cdsEgrCaja.FieldByName('ECSEM').Value;
        dm1.cdsCntCaja.FieldByName('DCTRI').Value   :=  dm1.cdsEgrCaja.FieldByName('ECTRI').Value;
        dm1.cdsCntCaja.FieldByName('DCAASS').Value  :=  dm1.cdsEgrCaja.FieldByName('ECAASS').Value;
        dm1.cdsCntCaja.FieldByName('DCAASEM').Value :=  dm1.cdsEgrCaja.FieldByName('ECAASEM').Value;
        dm1.cdsCntCaja.FieldByName('DCAATRI').Value :=  dm1.cdsEgrCaja.FieldByName('ECAATRI').Value;
        dm1.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
        dm1.cdsCntCaja.FieldByName('DCUSER').Value  :=  DM1.wUsuario;
        dm1.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
        dm1.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
        dm1.cdsCntCaja.FieldByName('TMONID').Value  :=  dm1.cdsEgrCaja.FieldByName('TMONID').Value;

        if xMONID_PROV = dm1.wTMonExt then
        begin
           dm1.cdsCntCaja.FieldByName('DCMTOLO').Value :=dm1.cdsDocPago.FieldByName('DEMTOLOC').AsFloat*dm1.cdsDocPago.FieldByName('DETCDOC').Value; ;
           dm1.cdsCntCaja.FieldByName('DCDH').Value    :='H';
           dm1.cdsCntCaja.FieldByName('CPTOID').Value  :=wCptoGan;
           dm1.cdsCntCaja.FieldByName('CUENTAID').Value:=wCtaGan;
        end;
       //** 28/12/2001 - PJSV
       if DM1.cdsCntCaja.fieldbyName('DCDH').asString = 'D'  then
        begin
         if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
          DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
         else
          DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
        end
       else
        begin
         if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
          DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
         else
          DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
        end;
       //**

        //////////////

        DM1.cdsCntCaja.Insert;
        dm1.cdsCntCaja.FieldByName('CIAID').Value   :=  dm1.cdsEgrCaja.FieldByName('CIAID').Value;
        dm1.cdsCntCaja.FieldByName('TDIARID').Value :=  dm1.cdsEgrCaja.FieldByName('TDIARID').Value;
        dm1.cdsCntCaja.FieldByName('ECANOMM').Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
        dm1.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  dm1.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
        dm1.cdsCntCaja.FieldByName('DOCID').Value   :=  dm1.cdsDocPago.FieldByName('DOCID2').Value;
        DM1.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
        dm1.cdsCntCaja.FieldByName('DCSERIE').Value :=  dm1.cdsDocPago.FieldByName('CPSERIE').Value;
        dm1.cdsCntCaja.FieldByName('DCNODOC').Value :=  dm1.cdsDocPago.FieldByName('CPNODOC').Value;
        dm1.cdsCntCaja.FieldByName('ECFCOMP').Value :=  dm1.cdsEgrCaja.FieldByName('ECFCOMP').Value;
        dm1.cdsCntCaja.FieldByName('DCFEMIS').Value :=  dm1.cdsDocPago.FieldByName('CPFEMIS').Value;
        dm1.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  dm1.cdsDocPago.FieldByName('CPFVCMTO').Value;
        dm1.cdsCntCaja.FieldByName('CPTOID').Value  :=  dm1.cdsDocPago.FieldByName('CPTOID').Value;
        dm1.cdsCntCaja.FieldByName('CUENTAID').Value:=  dm1.cdsDocPago.FieldByName('CUENTAID').Value;
        dm1.cdsCntCaja.FieldByName('CLAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
        dm1.cdsCntCaja.FieldByName('DCAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
        dm1.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  dm1.cdsDocPago.FieldByName('DETCPAG').Value;
        dm1.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  dm1.cdsDocPago.FieldByName('DETCDOC').Value;
        dm1.cdsCntCaja.FieldByName('ECANOMM').Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
        dm1.cdsCntCaja.FieldByName('DCLOTE').Value  :=  dm1.cdsEgrCaja.FieldByName('ECLOTE').Value;
        dm1.cdsCntCaja.FieldByName('DCANO').Value   :=  dm1.cdsEgrCaja.FieldByName('ECANO').Value;
        dm1.cdsCntCaja.FieldByName('DCMM').Value    :=  dm1.cdsEgrCaja.FieldByName('ECMM').Value;
        dm1.cdsCntCaja.FieldByName('DCDD').Value    :=  dm1.cdsEgrCaja.FieldByName('ECDD').Value;
        dm1.cdsCntCaja.FieldByName('DCSS').Value    :=  dm1.cdsEgrCaja.FieldByName('ECSS').Value;
        dm1.cdsCntCaja.FieldByName('DCSEM').Value   :=  dm1.cdsEgrCaja.FieldByName('ECSEM').Value;
        dm1.cdsCntCaja.FieldByName('DCTRI').Value   :=  dm1.cdsEgrCaja.FieldByName('ECTRI').Value;
        dm1.cdsCntCaja.FieldByName('DCAASS').Value  :=  dm1.cdsEgrCaja.FieldByName('ECAASS').Value;
        dm1.cdsCntCaja.FieldByName('DCAASEM').Value :=  dm1.cdsEgrCaja.FieldByName('ECAASEM').Value;
        dm1.cdsCntCaja.FieldByName('DCAATRI').Value :=  dm1.cdsEgrCaja.FieldByName('ECAATRI').Value;
        dm1.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
        dm1.cdsCntCaja.FieldByName('DCUSER').Value  :=  DM1.wUsuario;
        dm1.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
        dm1.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
        dm1.cdsCntCaja.FieldByName('TMONID').Value  :=  dm1.cdsEgrCaja.FieldByName('TMONID').Value;
        if xMONID_PROV = dm1.wTMonExt then
        begin
           dm1.cdsCntCaja.FieldByName('DCMTOLO').Value :=dm1.cdsDocPago.FieldByName('DEMTOLOC').AsFloat*dm1.cdsDocPago.FieldByName('DETCPag').Value; ;
           dm1.cdsCntCaja.FieldByName('DCDH').Value    :='D';
           dm1.cdsCntCaja.FieldByName('CPTOID').Value  :=wCptoPer;
           dm1.cdsCntCaja.FieldByName('CUENTAID').Value:=wCtaPer;
        end;
         //** 28/12/2001 - PJSV
         if DM1.cdsCntCaja.fieldbyName('DCDH').asString = 'D'  then
          begin
           if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
            DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
           else
            DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
          end
         else
          begin
           if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
            DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
           else
            DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
          end;
         //**

     end;
    end;
end;


{******************************************************************************}
procedure TFPagoProvVa.Contab_DifCamRegCxP;
var
    xDif_Camb : double;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   if dm1.cdsRegCxP.FieldByName('DETCDOC').Value <> dm1.cdsRegCxP.FieldByName('DETCPAG').Value then
    begin
      DM1.cdsCntCaja.Insert;
      dm1.cdsCntCaja.FieldByName('CIAID').Value    :=  dm1.cdsRegCxP.FieldByName('CIAID').Value;
      dm1.cdsCntCaja.FieldByName('TDIARID').Value  :=  dm1.cdsRegCxP.FieldByName('TDIARID').Value;
      dm1.cdsCntCaja.FieldByName('ECNOCOMP').Value :=  dm1.cdsRegCxP.FieldByName('ECNOCOMP').Value;
      dm1.cdsCntCaja.FieldByName('DOCID').Value    :=  dm1.cdsRegCxP.FieldByName('DOCID2').Value;
      DM1.cdsCntCaja.FieldByName('DOCMOD').AsString:= 'CXP';
      dm1.cdsCntCaja.FieldByName('DCSERIE').Value  :=  dm1.cdsRegCxP.FieldByName('CPSERIE').Value;
      dm1.cdsCntCaja.FieldByName('DCNODOC').Value  :=  dm1.cdsRegCxP.FieldByName('CPNODOC').Value;
      dm1.cdsCntCaja.FieldByName('ECFCOMP').Value  :=  dm1.cdsRegCxP.FieldByName('DEFCOMP').Value;
      dm1.cdsCntCaja.FieldByName('DCFEMIS').Value  :=  dm1.cdsRegCxP.FieldByName('CPFEMIS').Value;
      dm1.cdsCntCaja.FieldByName('DCFVCMTO').Value :=  dm1.cdsRegCxP.FieldByName('CPFVCMTO').Value;
      dm1.cdsCntCaja.FieldByName('CLAUXID').Value  :=  dm1.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
      dm1.cdsCntCaja.FieldByName('DCAUXID').Value  :=  dm1.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
      dm1.cdsCntCaja.FieldByName('CCOSID').Value   :=  dm1.cdsRegCxP.FieldByName('CCOSID').Value;
      dm1.cdsCntCaja.FieldByName('DCTCAMPA').Value :=  dm1.cdsRegCxP.FieldByName('DETCPAG').Value;
      dm1.cdsCntCaja.FieldByName('DCTCAMPR').Value :=  dm1.cdsRegCxP.FieldByName('DETCDOC').Value;
      dm1.cdsCntCaja.FieldByName('DCFLACDR').Value :=  'S';   //Registro ya cuadrado
      dm1.cdsCntCaja.FieldByName('DCUSER'  ).Value :=  DM1.wUsuario;
      dm1.cdsCntCaja.FieldByName('DCFREG'  ).Value :=  Date;
      dm1.cdsCntCaja.FieldByName('DCHREG'  ).Value :=  Time;
      dm1.cdsCntCaja.FieldByName('ECANOMM' ).Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
      dm1.cdsCntCaja.FieldByName('DCLOTE'  ).Value :=  dm1.cdsEgrCaja.FieldByName('ECLOTE').Value;
      dm1.cdsCntCaja.FieldByName('DCANO'   ).Value :=  dm1.cdsEgrCaja.FieldByName('ECANO').Value;
      dm1.cdsCntCaja.FieldByName('DCMM'    ).Value :=  dm1.cdsEgrCaja.FieldByName('ECMM').Value;
      dm1.cdsCntCaja.FieldByName('DCDD'    ).Value :=  dm1.cdsEgrCaja.FieldByName('ECDD').Value;
      dm1.cdsCntCaja.FieldByName('DCSS'    ).Value :=  dm1.cdsEgrCaja.FieldByName('ECSS').Value;
      dm1.cdsCntCaja.FieldByName('DCSEM'   ).Value :=  dm1.cdsEgrCaja.FieldByName('ECSEM').Value;
      dm1.cdsCntCaja.FieldByName('DCTRI'   ).Value :=  dm1.cdsEgrCaja.FieldByName('ECTRI').Value;
      dm1.cdsCntCaja.FieldByName('DCAASS'  ).Value :=  dm1.cdsEgrCaja.FieldByName('ECAASS').Value;
      dm1.cdsCntCaja.FieldByName('DCAASEM' ).Value :=  dm1.cdsEgrCaja.FieldByName('ECAASEM').Value;
      dm1.cdsCntCaja.FieldByName('DCAATRI' ).Value :=  dm1.cdsEgrCaja.FieldByName('ECAATRI').Value;
      DM1.cdsCntCaja.fieldbyname('DOCMOD'  ).AsString := Fprincipal.xModulo;

      dm1.cdsCntCaja.FieldByName('TMONID').Value   :=  dm1.cdsEgrCaja.FieldByName('tmonid').vALUE;
      if dm1.cdsRegCxP.FieldByName('TMONID').Value=dm1.wtMonLoc then
       begin   //Provision en Mon.Local
         xDif_Camb:= abs(dm1.cdsRegCxP.FieldByName('DEMTOLOC').Value / dm1.cdsRegCxP.FieldByName('DETCDOC').Value -
                         dm1.cdsRegCxP.FieldByName('DEMTOLOC').Value / dm1.cdsRegCxP.FieldByName('DETCPAG').Value);//En Mon.Ext.
         dm1.cdsCntCaja.FieldByName('DCMTOEXT').Value := xDif_Camb;

         if dm1.cdsRegCxP.FieldByName('DETCDOC').Value > dm1.cdsRegCxP.FieldByName('DETCPAG').Value then
            dm1.cdsCntCaja.FieldByName('DCDH').Value := 'D'
         else
            dm1.cdsCntCaja.FieldByName('DCDH').Value := 'H';
       end
      else
       begin                                            //Provision en Mon.Ext.
         xDif_Camb:= abs(dm1.cdsRegCxP.FieldByName('DEMTOEXT').Value * dm1.cdsRegCxP.FieldByName('DETCDOC').Value -
                         dm1.cdsRegCxP.FieldByName('DEMTOEXT').Value * dm1.cdsRegCxP.FieldByName('DETCPAG').Value);//En Mon.Local
         dm1.cdsCntCaja.FieldByName('DCMTOLO').Value := xDif_Camb;

         if dm1.cdsRegCxP.FieldByName('DETCDOC').Value > dm1.cdsRegCxP.FieldByName('DETCPAG').Value then
            dm1.cdsCntCaja.FieldByName('DCDH').Value := 'H'
         else
            dm1.cdsCntCaja.FieldByName('DCDH').Value := 'D';
       end;

      if dm1.cdsCntCaja.FieldByName('DCDH').Value = 'D' then
       begin
         dm1.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoPer;
         dm1.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaPer;
       end
      else
       begin
         dm1.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
         dm1.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
       end;
       //** 28/12/2001 - PJSV
       if DM1.cdsCntCaja.FieldByName('DCDH').asString = 'D'  then
        begin
         if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
          DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
         else
          DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
        end
       else
        begin
         if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
          DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
         else
          DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
        end;
       //**
    end;
end;


procedure TFPagoProvVa.Contab_DifCamRegCxP2;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   if dm1.cdsRegCxP.FieldByName('DETCDOC').Value <> dm1.cdsRegCxP.FieldByName('DETCPAG').Value then begin
      DM1.cdsCntCaja.Insert;
      dm1.cdsCntCaja.FieldByName('CIAID').Value   :=  dm1.cdsRegCxP.FieldByName('CIAID').Value;
      dm1.cdsCntCaja.FieldByName('TDIARID').Value :=  dm1.cdsRegCxP.FieldByName('TDIARID').Value;
      dm1.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  dm1.cdsRegCxP.FieldByName('ECNOCOMP').Value;
      dm1.cdsCntCaja.FieldByName('DOCID').Value   :=  dm1.cdsRegCxP.FieldByName('DOCID2').Value;
      DM1.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
      dm1.cdsCntCaja.FieldByName('DCSERIE').Value :=  dm1.cdsRegCxP.FieldByName('CPSERIE').Value;
      dm1.cdsCntCaja.FieldByName('DCNODOC').Value :=  dm1.cdsRegCxP.FieldByName('CPNODOC').Value;
      dm1.cdsCntCaja.FieldByName('ECFCOMP').Value :=  dm1.cdsRegCxP.FieldByName('DEFCOMP').Value;
      dm1.cdsCntCaja.FieldByName('DCFEMIS').Value :=  dm1.cdsRegCxP.FieldByName('CPFEMIS').Value;
      dm1.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  dm1.cdsRegCxP.FieldByName('CPFVCMTO').Value;
      dm1.cdsCntCaja.FieldByName('CLAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
      dm1.cdsCntCaja.FieldByName('DCAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
      dm1.cdsCntCaja.FieldByName('CCOSID').Value  :=  dm1.cdsRegCxP.FieldByName('CCOSID').Value;
      dm1.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  dm1.cdsRegCxP.FieldByName('DETCPAG').Value;
      dm1.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  dm1.cdsRegCxP.FieldByName('DETCDOC').Value;
      dm1.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
      dm1.cdsCntCaja.FieldByName('DCUSER').Value  :=  DM1.wUsuario;
      dm1.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
      dm1.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
      dm1.cdsCntCaja.FieldByName('ECANOMM').Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
      dm1.cdsCntCaja.FieldByName('DCLOTE').Value  :=  dm1.cdsEgrCaja.FieldByName('ECLOTE').Value;
      dm1.cdsCntCaja.FieldByName('DCANO').Value   :=  dm1.cdsEgrCaja.FieldByName('ECANO').Value;
      dm1.cdsCntCaja.FieldByName('DCMM').Value    :=  dm1.cdsEgrCaja.FieldByName('ECMM').Value;
      dm1.cdsCntCaja.FieldByName('DCDD').Value    :=  dm1.cdsEgrCaja.FieldByName('ECDD').Value;
      dm1.cdsCntCaja.FieldByName('DCSS').Value    :=  dm1.cdsEgrCaja.FieldByName('ECSS').Value;
      dm1.cdsCntCaja.FieldByName('DCSEM').Value   :=  dm1.cdsEgrCaja.FieldByName('ECSEM').Value;
      dm1.cdsCntCaja.FieldByName('DCTRI').Value   :=  dm1.cdsEgrCaja.FieldByName('ECTRI').Value;
      dm1.cdsCntCaja.FieldByName('DCAASS').Value  :=  dm1.cdsEgrCaja.FieldByName('ECAASS').Value;
      dm1.cdsCntCaja.FieldByName('DCAASEM').Value :=  dm1.cdsEgrCaja.FieldByName('ECAASEM').Value;
      dm1.cdsCntCaja.FieldByName('DCAATRI').Value :=  dm1.cdsEgrCaja.FieldByName('ECAATRI').Value;
      DM1.cdsCntCaja.FieldByName('DOCMOD').AsString := Fprincipal.xModulo;
      dm1.cdsCntCaja.FieldByName('TMONID').Value   :=  dm1.cdsEgrCaja.FieldByName('TMONID').AsString;
      if dm1.cdsRegCxP.FieldByName('TMONID').Value=dm1.wtMonExt then begin
         dm1.cdsCntCaja.FieldByName('DCMTOEXT').Value:=dm1.cdsRegCxP.FieldByName('DEMTOEXT').Value * dm1.cdsRegCxP.FieldByName('DETCDOC').Value;
         dm1.cdsCntCaja.FieldByName('DCDH').Value    :='H';
         dm1.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
         dm1.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
      end;
       //** 28/12/2001 - PJSV
       if DM1.cdsCntCaja.fieldbyName('DCDH').asString = 'D'  then
        begin
         if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
          DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
         else
          DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
        end
       else
        begin
         if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
          DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
         else
          DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
        end;
       //**

      DM1.cdsCntCaja.Insert;
      dm1.cdsCntCaja.FieldByName('CIAID').Value   :=  dm1.cdsRegCxP.FieldByName('CIAID').Value;
      dm1.cdsCntCaja.FieldByName('TDIARID').Value :=  dm1.cdsRegCxP.FieldByName('TDIARID').Value;
      dm1.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  dm1.cdsRegCxP.FieldByName('ECNOCOMP').Value;
      dm1.cdsCntCaja.FieldByName('DOCID').Value   :=  dm1.cdsRegCxP.FieldByName('DOCID2').Value;
      DM1.cdsCntCaja.FieldByName('DOCMOD').AsString := 'CXP';
      dm1.cdsCntCaja.FieldByName('DCSERIE').Value :=  dm1.cdsRegCxP.FieldByName('CPSERIE').Value;
      dm1.cdsCntCaja.FieldByName('DCNODOC').Value :=  dm1.cdsRegCxP.FieldByName('CPNODOC').Value;
      dm1.cdsCntCaja.FieldByName('ECFCOMP').Value :=  dm1.cdsRegCxP.FieldByName('DEFCOMP').Value;
      dm1.cdsCntCaja.FieldByName('DCFEMIS').Value :=  dm1.cdsRegCxP.FieldByName('CPFEMIS').Value;
      dm1.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  dm1.cdsRegCxP.FieldByName('CPFVCMTO').Value;
      dm1.cdsCntCaja.FieldByName('CLAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
      dm1.cdsCntCaja.FieldByName('DCAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
      dm1.cdsCntCaja.FieldByName('CCOSID').Value  :=  dm1.cdsRegCxP.FieldByName('CCOSID').Value;
      dm1.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  dm1.cdsRegCxP.FieldByName('DETCPAG').Value;
      dm1.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  dm1.cdsRegCxP.FieldByName('DETCDOC').Value;
      dm1.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
      dm1.cdsCntCaja.FieldByName('DCUSER').Value  :=  DM1.wUsuario;
      dm1.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
      dm1.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
      dm1.cdsCntCaja.FieldByName('ECANOMM').Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
      dm1.cdsCntCaja.FieldByName('DCLOTE').Value  :=  dm1.cdsEgrCaja.FieldByName('ECLOTE').Value;
      dm1.cdsCntCaja.FieldByName('DCANO').Value   :=  dm1.cdsEgrCaja.FieldByName('ECANO').Value;
      dm1.cdsCntCaja.FieldByName('DCMM').Value    :=  dm1.cdsEgrCaja.FieldByName('ECMM').Value;
      dm1.cdsCntCaja.FieldByName('DCDD').Value    :=  dm1.cdsEgrCaja.FieldByName('ECDD').Value;
      dm1.cdsCntCaja.FieldByName('DCSS').Value    :=  dm1.cdsEgrCaja.FieldByName('ECSS').Value;
      dm1.cdsCntCaja.FieldByName('DCSEM').Value   :=  dm1.cdsEgrCaja.FieldByName('ECSEM').Value;
      dm1.cdsCntCaja.FieldByName('DCTRI').Value   :=  dm1.cdsEgrCaja.FieldByName('ECTRI').Value;
      dm1.cdsCntCaja.FieldByName('DCAASS').Value  :=  dm1.cdsEgrCaja.FieldByName('ECAASS').Value;
      dm1.cdsCntCaja.FieldByName('DCAASEM').Value :=  dm1.cdsEgrCaja.FieldByName('ECAASEM').Value;
      dm1.cdsCntCaja.FieldByName('DCAATRI').Value :=  dm1.cdsEgrCaja.FieldByName('ECAATRI').Value;
      DM1.cdsCntCaja.FieldByName('DOCMOD').AsString := Fprincipal.xModulo;
      dm1.cdsCntCaja.FieldByName('TMONID').Value   :=  dm1.cdsEgrCaja.FieldByName('TMONID').AsString;
      if dm1.cdsRegCxP.FieldByName('TMONID').Value=dm1.wtMonExt then begin
         dm1.cdsCntCaja.FieldByName('DCMTOEXT').Value:=dm1.cdsRegCxP.FieldByName('DEMTOEXT').Value * dm1.cdsRegCxP.FieldByName('DETCPAG').Value;
         dm1.cdsCntCaja.FieldByName('DCDH').Value    :='D';
         dm1.cdsCntCaja.FieldByName('CPTOID').Value  := wCptoPer;
         dm1.cdsCntCaja.FieldByName('CUENTAID').Value:= wCtaPer;
      end;
       //** 28/12/2001 - PJSV
       if DM1.cdsCntCaja.fieldbyName('DCDH').asString = 'D'  then
        begin
         if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
          DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
         else
          DM1.cdsCntCaja.fieldbyName('DEBE').asFloat  := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
        end
       else
        begin
         if DM1.cdsCntCaja.fieldbyname('TMONID').Value= dm1.wtMonLoc then
          DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOLO').asFloat
         else
          DM1.cdsCntCaja.fieldbyName('HABER').asFloat := DM1.cdsCntCaja.fieldbyName('DCMTOEXT').asFloat;
        end;
       //**
   end;
end;



{******************************************************************************}
procedure TFPagoProvVa.Contabiliza;
var
   xRegAct : TBookMark;
   xSQL    : String;
begin

    // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera

    // vhn 23/01/2001
    xSQL:='Select * from CAJA304 Where CIAID='''' and '
         +  'ECANOMM='''' and TDIARID='''' and ECNOCOMP='''' ';
    dm1.cdsCNTCaja.Close;
    dm1.cdsCNTCaja.DataRequest( xSQL );
    dm1.cdsCNTCaja.Open;
    //
    DM1.cdsCntCaja.Insert;
    Contab_Haber;

   // GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde Docs Registro
    dm1.cdsRegCxP.DisableControls;
    xRegAct := dm1.cdsRegCxP.GetBookmark;
    dm1.cdsRegCxP.First ;
    While not dm1.cdsRegCxP.Eof do
    Begin
       DM1.cdsCntCaja.Insert;
       Contab_RegCxP;
       if DM1.wTipoDif='' then
          Contab_DifCamRegCxP
       else begin
          if DM1.cdsRegCxP.FieldByname('TMONID').AsString=DM1.wTMonExt then
             Contab_DifCamRegCxP2;
       end;
       dm1.cdsRegCxP.Next;
    end;
    dm1.cdsRegCxP.GotoBookmark(xRegAct);
    dm1.cdsRegCxP.FreeBookmark(xRegAct);
    dm1.cdsRegCxP.EnableControls;

   // GENERA LOS REGISTROS DE "DEBE" Y LOS REGISTROS POR DIF. DE CAMBIO desde Docs Pago
    dm1.cdsDocPago.DisableControls;
    xRegAct := dm1.cdsDocPago.GetBookmark;
    dm1.cdsDocPago.First ;
    while not dm1.cdsDocPago.Eof do
    Begin
       DM1.cdsCntCaja.Insert;
       Contab_DocPago ;
       if DM1.wTipoDif='' then
          Contab_DifCamDocPago
       else begin
          if DM1.cdsDocPago.FieldByname('TMONID').AsString=DM1.wTMonExt then
             Contab_DifCamDocPago2;
       end;
       dm1.cdsDocPago.Next;
    end;
    dm1.cdsDocPago.GotoBookmark(xRegAct);
    dm1.cdsDocPago.FreeBookmark(xRegAct);
    dm1.cdsDocPago.EnableControls;

    xDebeT:=0;
    xHabeT:=0;
    DM1.cdsCntCaja.First;
    while not DM1.cdsCntCaja.Eof do begin

       if DM1.cdsCntCaja.FieldByname('DCDH').AsString='D' then
          xDebeT:=xDebeT+DM1.cdsCntCaja.FieldByname('DCMTOLO').Value
       else
          xHabeT:=xHabeT+DM1.cdsCntCaja.FieldByname('DCMTOLO').Value;

       DM1.cdsCntCaja.Next;
    end;

    if DM1.FRound(xDebeT,15,2)<>DM1.FRound(xHabeT,15,2) then
       AsientoDifTotal;

    //Actualizamos en la tabla de Contabilidad
    DM1.cdsCntCaja.ApplyUpdates(0);
end;

procedure TFPagoProvVa.AsientoDifTotal;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   DM1.cdsCntCaja.Insert;
   DM1.cdsCntCaja.FieldByName('CIAID').Value   :=  DM1.cdsEgrCaja.FieldByName('CIAID').Value;
   DM1.cdsCntCaja.FieldByName('TDIARID').Value :=  DM1.cdsEgrCaja.FieldByName('TDIARID').Value;
   DM1.cdsCntCaja.FieldByName('ECANOMM').Value :=  DM1.cdsEgrCaja.FieldByName('ECANOMM').Value;
   DM1.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DM1.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
   DM1.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DM1.cdsEgrCaja.FieldByName('ECLOTE').Value;
   DM1.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DM1.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DM1.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DM1.cdsCntCaja.FieldByName('DCTCAMPA').AsString := dbeTCambio.Text ;
   DM1.cdsCntCaja.FieldByName('DCTCAMPR').AsString := dbeTCambio.Text ;
   DM1.cdsCntCaja.FieldByName('DCANO').Value   :=  DM1.cdsEgrCaja.FieldByName('ECANO').Value;
   DM1.cdsCntCaja.FieldByName('DCMM').Value    :=  DM1.cdsEgrCaja.FieldByName('ECMM').Value;
   DM1.cdsCntCaja.FieldByName('DCDD').Value    :=  DM1.cdsEgrCaja.FieldByName('ECDD').Value;
   DM1.cdsCntCaja.FieldByName('DCSS').Value    :=  DM1.cdsEgrCaja.FieldByName('ECSS').Value;
   DM1.cdsCntCaja.FieldByName('DCSEM').Value   :=  DM1.cdsEgrCaja.FieldByName('ECSEM').Value;
   DM1.cdsCntCaja.FieldByName('DCTRI').Value   :=  DM1.cdsEgrCaja.FieldByName('ECTRI').Value;
   DM1.cdsCntCaja.FieldByName('DCAASS').Value  :=  DM1.cdsEgrCaja.FieldByName('ECAASS').Value;
   DM1.cdsCntCaja.FieldByName('DCAASEM').Value :=  DM1.cdsEgrCaja.FieldByName('ECAASEM').Value;
   DM1.cdsCntCaja.FieldByName('DCAATRI').Value :=  DM1.cdsEgrCaja.FieldByName('ECAATRI').Value;

   DM1.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
   DM1.cdsCntCaja.FieldByName('DCUSER').Value  :=  DM1.wUsuario;
   DM1.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
   DM1.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
   DM1.cdsCntCaja.FieldByName('TMONID').Value  :=  DM1.cdsEgrCaja.FieldByName('TMONID').Value;

   if xDebeT>xHabeT then
   begin
      DM1.cdsCntCaja.FieldByName('DCMTOLO').Value := abs(xDebeT-xHabeT);
      DM1.cdsCntCaja.FieldByName('DCMTOEXT').Value:= 0;
      DM1.cdsCntCaja.FieldByName('DCDH').Value := 'H';
      DM1.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
      DM1.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
   end
   else begin
      DM1.cdsCntCaja.FieldByName('DCMTOLO').Value := abs(xHabeT-xDebeT);
      DM1.cdsCntCaja.FieldByName('DCMTOEXT').Value:= 0;
      DM1.cdsCntCaja.FieldByName('DCDH').Value := 'D';
      DM1.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoPer;
      DM1.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaPer;
   end ;
end;


{******************************************************************************}
procedure TFPagoProvVa.z2bbtnContClick(Sender: TObject);
var
 xSql : String;
begin
   if DM1.cdsEgrCaja.FieldByName('ECEstado').AsString = 'C' then
   begin
      if DM1.cdsEgrCaja.fieldbyname('FEXTCHQ').AsString = '1' then
      begin
         ShowMessage('No Puede Contabilizar este Movimiento ' + #13 +
                     'Pues se encuentra extornado') ;
         Exit ;
      end ;
      If dm1.MesCerrado(copy(edtPeriodo.text,5,2),copy(edtPeriodo.text,1,4),dblcCia.text) then
      begin
         ShowMessage(' Mes cerrado, no se puede contabilizar');
         exit;
      end;

      if MessageDlg('¿Contabilizar y Generar Asientos Automaticos?',mtConfirmation,
                  [mbYes, mbNo], 0)=mrYes then
      begin
         screen.Cursor := crHourGlass ;
         RecCptosDifC ;
         Contabiliza ;             // Realiza la generacion del Asiento

         ActualizaCNT311(DM1.cdsEgrcaja.FieldByName('CIAID').AsString,
                         DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
                         DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                         DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString);

         if SOLConta(DM1.cdsEgrCaja.FieldByName('CIAID').AsString,
                     DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
                     DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                     DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                     dm1.SRV_D, 'C', DM1.wModulo, DM1.cdsCNT311, DM1.cdsNivel,
                     DM1.cdsResultSet, DM1.DCOM1, Self ) then
         begin
            DM1.cdsEgrCaja.Edit;
            DM1.cdsEgrCaja.FieldByName('ECConta').AsString := 'S' ;   //Establece como Contabilizado el flag
            DM1.cdsEgrCaja.FieldByName('ECEstado').AsString:= 'C';
            DM1.cdsEgrCaja.FieldByName('ECUSER').Value     := DM1.wUsuario;
            DM1.cdsEgrCaja.FieldByName('ECFREG').Value     := DateS;
            DM1.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;
            DM1.cdsEgrCaja.Post;
            xSQL:='Select * from CAJA302 '
                 +'Where CIAID='''   +dblcCia.Text    +''' and '
                 +      'ECANOMM=''' +edtPeriodo.Text +''' and '
                 +      'TDIARID=''' +dblcTDiario.Text+''' and '
                 +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
            DM1.cdsEgrCaja.DataRequest( xSQL );
            DM1.AplicaDatos(DM1.cdsEgrCaja,'EGRCAJA');
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
procedure TFPagoProvVa.z2bbtnAnulaClick(Sender: TObject);
begin
    if DM1.cdsEgrCaja.FieldByName('ECEstado').Value='I' then
    begin

      if MessageDlg('¿Anular Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin

         RetornaSaldosMovCxP;

         DM1.cdsEgrCaja.CancelUpdates;
         DM1.cdsRegCxP.CancelUpdates;
         DM1.cdsMovCxP.CancelUpdates;
         DM1.cdsDocPago.CancelUpdates;

         DM1.cdsEgrCaja.Edit;
         DM1.cdsEgrCaja.FieldByName('ECEstado').Value:='A';
         DM1.cdsEgrCaja.ApplyUpdates(0);

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
procedure TFPagoProvVa.ActPnlBotones;
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
procedure TFPagoProvVa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if pnlActualiza.Visible then
  begin
     z2bbtnCancel3.SetFocus ;
     z2bbtnCancel3Click(nil) ;
  end ;

   // Limpiamos los filtros
   with dm1 do
   begin
      cdsEgrCaja.Filtered  :=False;
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

//      ControlFocoSalida(self,ctrl,evt_exit) ;
       cf1.QuitarExits(self) ;
   end ;
   edtCuenta.Enabled := False ;   
//
//   LibConfigAccesos;
//
end;
{******************************************************************************}
procedure TFPagoProvVa.IniciaPanel;
begin
{     dblcTDiario2.Text   := '';
     dbeSerie.Text       := '';
     dblcTDoc2.Text      := '';
     dbeNoDoc2.Text      := '';
//     dblcCnp2.Text       := '';
     dblcdCnp2.Text       := '';
     edtCuenta2.Text     := '';
//     dblcCCosto.Text     := '';
     dblcdCCosto.Text     := '';
     dbeDH.Text          := '';
     dblcTMon2.Text      := '';
     dbeImporte2.Text    := '';
     dbeTCamDoc.Text     := '';
     edtMtoLoc.Text      := '';
     edtMtoExt.Text      := '';
     dbdtpFEmis2.Date    := 0;
     dbdtpFVcto2.Date    := 0;}

     dblcTDiario2.Text   := '';
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
     edtTDiario2.Text       := '';
     edtCnp2.Text       := '';
     edtTMon2.Text       := '';

end;
{******************************************************************************}
procedure TFPagoProvVa.dbgOtrosIButtonClick(Sender: TObject);
begin
     inhabilitarpaneles;
     AdicionarREgistros;
end;
{******************************************************************************}
procedure TFPagoProvVa.dbgOtrosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (dbgOtrosIButton.Enabled) and (key = VK_DELETE) and (ssCtrl in Shift) then
   begin
      if (dm1.cdsRegCxP.RecordCount=0) then
          ShowMessage('No hay registros')
       else
       begin
          if MessageDlg('¿Eliminar Registro?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
          begin
             dm1.cdsRegCxP.Delete;    // Borro en el original..
             z2bbtnSumatClick(sender);    // Al salir hay que totalizar
         end;
      end;
   end;
end;
{******************************************************************************}
procedure TFPagoProvVa.dbdtpFComp2Exit(Sender: TObject);
begin
   dm1.cdsRegCxP.FieldByName('CPANOMM').Value:=copy(datetostr(dm1.cdsRegCxP.FieldByName('DEFCOMP').Value),7,4)
                              +copy(datetostr(dm1.cdsRegCxP.FieldByName('DEFCOMP').Value),4,2);
end;
{******************************************************************************}
procedure TFPagoProvVa.z2bbtnSumatClick(Sender: TObject);
Var
   xTSalLoc, xTSalExt, xTPagLoc, xTPagExt : double;
   xRegAct : TBookMark;
begin
   with DM1 do
   begin
   // Totales de Documentos pagados
      cdsDocPago.DisableControls ;
      xRegAct   := cdsDocPago.GetBookmark ;
      xTSalLoc  := 0; xTSalExt := 0; xTPagLoc := 0; xTPagExt := 0 ;
      cdsDocPago.First ;
      while not cdsDocPago.Eof do
      begin
         xTSalLoc := xTSalLoc + cdsDocPago.FieldByName('DESALLOC').Value ;
         xTSalExt := xTSalExt + cdsDocPago.FieldByName('DESALEXT').Value ;
         xTPagLoc := xTPagLoc + cdsDocPago.FieldByName('DEMtoLoc').Value ;
         xTPagExt := xTPagExt + cdsDocPago.FieldByName('DEMTOEXT').Value ;
         cdsDocPago.Next ;
      end ;
      dbgDocPago.ColumnByName('DESALLOC').FooterValue:=floattostrf(xTSalLoc, ffNumber, 10, 2) ;
      dbgDocPago.ColumnByName('DESALEXT').FooterValue:=floattostrf(xTSalExt, ffNumber, 10, 2) ;
      dbgDocPago.ColumnByName('DEMtoLoc').FooterValue:=floattostrf(xTPagLoc, ffNumber, 10, 2) ;
      dbgDocPago.ColumnByName('DEMTOEXT').FooterValue:=floattostrf(xTPagExt, ffNumber, 10, 2) ;
      cdsDocPago.GotoBookmark(xRegAct) ;
      cdsDocPago.FreeBookmark(xRegAct) ;
      cdsDocPago.EnableControls ;
   end ;
end;
{Var
   xRegAct : TBookMark;
   xMtoLoc, xMtoExt: Currency;
begin
   With DM1 Do
   Begin
      cdsRegCxP.DisableControls;
      xRegAct := cdsRegCxP.GetBookmark;
      xMtoLoc := 0;
      xMtoExt := 0;
      cdsRegCxP.First ;
      While not cdsRegCxP.Eof do
      Begin
         if cdsRegCxPDEDH.Value='D' then
         begin
           xMtoLoc := xMtoLoc + strtocurr( stringReplace(cdsRegCxPDEMTOLOC.DisplayText,',','',[rfReplaceAll]) ) ;
           xMtoExt := xMtoExt + strToCurr( stringReplace(cdsRegCxPDEMTOEXT.DisplayText,',','',[rfReplaceAll]) ) ;
         end
         else begin
           xMtoLoc := xMtoLoc - strToCurr( stringReplace(cdsRegCxPDEMTOLOC.DisplayText,',','',[rfReplaceAll]) ) ;
           xMtoExt := xMtoExt - strToCurr( stringReplace(cdsRegCxPDEMTOEXT.DisplayText,',','',[rfReplaceAll]) ) ;
         end;
         cdsRegCxP.Next;
      end;
      dbgOtros.ColumnByName('DEMTOLOC').FooterValue := floattostrf(xMtoLoc, ffFixed, 10, 2);
      dbgOtros.ColumnByName('DEMTOEXT').FooterValue := floattostrf(xMtoExt, ffFixed, 10, 2);

      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);
      cdsRegCxP.EnableControls;
   end;
end;
}


{******************************************************************************}
procedure TFPagoProvVa.dbgDocPagoDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   If (not dbgDocPago.Readonly) then
      Accept:=True;
end;
{******************************************************************************}
procedure TFPagoProvVa.dbgDocPagoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   If (not dbgDocPago.Readonly) then
      dbgDocPago.BeginDrag(False);
end;
{******************************************************************************}
procedure TFPagoProvVa.dbgDocPagoEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   If (not dbgDocPago.Readonly) and (Target=dbgpendientes) Then
   begin
        dm1.cdsmovcxp.DisableControls ;
        DM1.cdsMovCxP.Filtered:=False;
        if DM1.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                                VarArrayOf([DM1.cdsDocPago.FieldByName('CIAID').AsString,
                                            DM1.cdsDocPago.FieldByName('TDIARID2').AsString,
                                            DM1.cdsDocPago.FieldByName('CPANOMM').AsString,
                                            DM1.cdsDocPago.FieldByName('CPNOREG').AsString]),
                                []) then
         begin
           DM1.cdsMovCxP.Edit ;
           DM1.cdsMovCxP.FieldByName('CPSALEXT').Value := DM1.cdsMovCxP.FieldByName('CPMTOEXT').Value - dm1.NumeroNoNulo( DM1.cdsMovCxP.FieldByName('CPPAGEXT') ) ;
           DM1.cdsMovCxP.FieldByName('CPSALLOC').Value := DM1.cdsMovCxP.FieldByName('CPMTOLOC').Value - dm1.NumeroNoNulo( DM1.cdsMovCxP.FieldByName('CPPAGLOC') ) ;
           If DM1.cdsMovCxP.FieldByName('TMONID').Value=DM1.wTMonLoc then
              DM1.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DM1.cdsMovCxP.FieldByName('CPSALLOC').AsFloat
           else
              DM1.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DM1.cdsMovCxP.FieldByName('CPSALEXT').AsFloat ;

           DM1.cdsMovCxP.Post ;

           DM1.cdsDocPago.Delete;

           dbgPendientes.RefreshDisplay;
           dbgDocPago.RefreshDisplay;
         end;
         DM1.cdsMovCxP.Filtered:=True;
         dm1.cdsmovcxp.EnableControls ;
         wmodifica:=True;
   end;
end;
{******************************************************************************}
Procedure TFPagoProvVa.LimpiaFiltros;
begin
   // Limpiando filtros si lo tuvieran
   DM1.cdsEgrCaja.Filtered :=False;
   DM1.cdsMovCxP.Filtered  :=False;
   DM1.cdsCntCaja.Filtered :=False;
   DM1.cdsRegCxP.Filtered  :=False;
end;

{******************************************************************************}
{*********************** PROCEDIMIENTOS ADICIONALES   *************************}
procedure TFPagoProvVa.ActivaFiltro(xName:string);
var
   xSQL : String ;
begin
    xName := uppercase(xName);

    // CAJA301
    if xName='REGCXP' then
    begin
        // vhn 22/01/2001
        xSQL:='Select * from CAJA301 '
             +'Where CIAID='''   +dblcCia.Text    +''' and '
             +      'ECANOMM=''' +edtPeriodo.Text +''' and '
             +      'TDIARID=''' +dblcTDiario.Text+''' and '
             +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
        DM1.cdsRegCxP.Close;
        DM1.cdsRegCxP.DataRequest( xSQL );
        DM1.cdsRegCxP.Open;
    end;
    if xName='DOCPAGO' then
    begin
       // vhn 22/01/2001
       xSQL:='Select * from CAJA303 '
            +'Where CIAID='''   +dblcCia.Text    +''' and '
            +      'ECANOMM=''' +edtPeriodo.Text +''' and '
            +      'TDIARID=''' +dblcTDiario.Text+''' and '
            +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
       DM1.cdsDocPago.Close;
       DM1.cdsDocPago.DataRequest( xSQL );
       DM1.cdsDocPago.Open;
    end ;
end ;
{******************************************************************************}
Procedure TFPagoProvVa.CambiaEstado(xName:char);
begin
   case xName of
     'I':begin  //Si está INCOMPLETO o PENDIENTE
            lblEstado.Caption    :='Activo             ';
            pnlCabecera1.Enabled := False;
            pnlCabecera2.Enabled := True;
            z2bbtnOk.Enabled       := True;
            z2bbtnCancel.Enabled   := True;

//2804
            dbgPendientes.ReadOnly :=false ;
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

            if DM1.cdsEgrCaja.FieldByName('ECConta').Value='S' then
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
            pnlCabecera1.Enabled := false;
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
procedure TFPagoProvVa.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   if (dbgPendientes.Readonly = False) then
       Accept:=True;
end;
{******************************************************************************}
procedure TFPagoProvVa.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if (dbgPendientes.Readonly = False) then
      dbgPendientes.BeginDrag(False);
end;
{******************************************************************************}
procedure TFPagoProvVa.dbgPendientesEndDrag(Sender, Target: TObject; X,Y: Integer);
var i: integer;
begin
    If (not dbgPendientes.Readonly) and (Target=dbgDocPago) Then
    Begin
      DM1.cdsMovCxP.DisableControls;
      DM1.cdsDocPago.DisableControls;
      for i:= 0 to dbgPendientes.SelectedList.Count-1 do
      begin
          dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);

          DM1.cdsDocPago.Insert;
          DM1.cdsDocPago.FieldByName('CIAID').Value    := dblcCia.Text;
          DM1.cdsDocPago.FieldByName('TDIARID').Value  := dblcTDiario.Text;
          DM1.cdsDocPago.FieldByName('ECANOMM').Value  := edtPeriodo.Text;
          DM1.cdsDocPago.FieldByName('ECNOCOMP').Value := dbeNoComp.Text;

          DM1.cdsDocPago.FieldByName('TDIARID2').Value := DM1.cdsMovCxP.FieldByName('TDIARID').Value;
          DM1.cdsDocPago.FieldByName('CPANOMM').Value  := DM1.cdsMovCxP.FieldByName('CPANOMES').Value;
          DM1.cdsDocPago.FieldByName('CPNOREG').Value  := DM1.cdsMovCxP.FieldByName('CPNOREG').Value;
          DM1.cdsDocPago.FieldByName('DOCID2').Value   := DM1.cdsMovCxP.FieldByName('DOCID').Value;
          DM1.cdsDocPago.FieldByName('CPSERIE').Value  := DM1.cdsMovCxP.FieldByName('CPSERIE').Value;
          DM1.cdsDocPago.FieldByName('CPNODOC').Value  := DM1.cdsMovCxP.FieldByName('CPNODOC').Value;
          DM1.cdsDocPago.FieldByName('TMONID').Value   := DM1.cdsMovCxP.FieldByName('TMONID').Value;
          DM1.cdsDocPago.FieldByName('DETCDOC').Value  := DM1.FRound(DM1.cdsMovCxP.FieldByName('CPTCAMAJ').Value,8,3);
          DM1.cdsDocPago.FieldByName('DETCPAG').Value  := DM1.FRound(strtofloat(dbeTCambio.Text),8,3);
          DM1.cdsDocPago.FieldByName('CPTOID').Value   := DM1.cdsMovCxP.FieldByName('CPTOTOT').Value;
          DM1.cdsDocPago.FieldByName('CUENTAID').Value := DM1.cdsMovCxP.FieldByName('CTATOTAL').Value;
          DM1.cdsDocPago.FieldByName('CPFEMIS').Value  := DM1.cdsMovCxP.FieldByName('CPFEMIS').Value;
          DM1.cdsDocPago.FieldByName('CPFVCMTO').Value := DM1.cdsMovCxP.FieldByName('CPFVCMTO').Value;
          DM1.cdsDocPago.FieldByName('DEAno').Value    := DM1.cdsMovCxP.FieldByName('CPAAAA').Value;
          DM1.cdsDocPago.FieldByName('DEMM').Value     := DM1.cdsMovCxP.FieldByName('CPMM').Value;
          DM1.cdsDocPago.FieldByName('DEDD').Value     := DM1.cdsMovCxP.FieldByName('CPDD').Value;
          DM1.cdsDocPago.FieldByName('DESS').Value     := DM1.cdsMovCxP.FieldByName('CPSS').Value;
          DM1.cdsDocPago.FieldByName('DESem').Value    := DM1.cdsMovCxP.FieldByName('CPSem').Value;
          DM1.cdsDocPago.FieldByName('DETri').Value    := DM1.cdsMovCxP.FieldByName('CPTri').Value;
          DM1.cdsDocPago.FieldByName('DEAASS').Value   := DM1.cdsMovCxP.FieldByName('CPAASS').Value;
          DM1.cdsDocPago.FieldByName('DEAASem').Value  := DM1.cdsMovCxP.FieldByName('CPAASem').Value;
          DM1.cdsDocPago.FieldByName('DEAATri').Value  := DM1.cdsMovCxP.FieldByName('CPAATri').Value;
          DM1.cdsDocPago.FieldByName('PROV').Value     := DM1.cdsMovCxP.FieldByName('PROV').Value;
          DM1.cdsDocPago.FieldByName('PROVRUC').Value  := DM1.cdsMovCxP.FieldByName('PROVRUC').Value;

          if DM1.cdsDocPago.FieldByName('TMONID').Value=DM1.wtMonLoc then
          begin
             DM1.cdsDocPago.FieldByName('DESALLOC').Value := DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALLOC').Value,15,2);
             DM1.cdsDocPago.FieldByName('DESALEXT').Value := DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALLOC').Value
                                            /DM1.cdsDocPago.FieldByName('DetCPag').Value,15,2);
          end
          else
          begin
             DM1.cdsDocPago.FieldByName('DESALEXT').Value := DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALEXT').Value,15,2);
             DM1.cdsDocPago.FieldByName('DESALLOC').Value := DM1.FRound(DM1.cdsMovCxP.FieldByName('CPSALEXT').Value
                                            *DM1.cdsDocPago.FieldByName('DETCPAG').Value,15,2);
          end;
          DM1.cdsDocPago.FieldByName('DEANTMN').Value  := 0;
          DM1.cdsDocPago.FieldByName('DEANTME').Value  := 0;
          DM1.cdsDocPago.FieldByName('DEMTOORI').Value := DM1.FRound(DM1.cdsMovCxP.FieldByName('CPMTOORI').Value,15,2);
          DM1.cdsDocPago.FieldByName('DEMTOLOC').Value := DM1.FRound(DM1.cdsDocPago.FieldByName('DESALLOC').Value,15,2);
          DM1.cdsDocPago.FieldByName('DEMTOEXT').Value := DM1.FRound(DM1.cdsDocPago.FieldByName('DESALEXT').Value,15,2);
          DM1.cdsDocPago.FieldByName('DEUSER').Value   := DM1.wUsuario;
          DM1.cdsDocPago.FieldByName('DEFREG').Value   := dateS;
          DM1.cdsDocPago.FieldByName('DEHREG').Value   := time;
          dm1.cdsDocPago.fieldbyname('CLAUXID').AsString := dm1.cdsMovCxP.FieldByName('CLAUXID').AsString ;
          DM1.cdsDocPago.Post;

          dm1.cdsMovCxP.Edit;
          dm1.cdsMovCxP.FieldByName('CPSALORI').Value := 0 ;
          dm1.cdsMovCxP.Post;

          dbgPendientes.datasource.dataset.Freebookmark(dbgPendientes.SelectedList.items[i]);
      end; // for

      dbgPendientes.SelectedList.clear;  { Clear selected record list since they are all deleted}
      dbgPendientes.RefreshDisplay;
      dbgDocPago.RefreshDisplay;
      DM1.cdsDocPago.EnableControls;
      DM1.cdsMovCxP.EnableControls;
      z2bbtnSumatclick(nil);
      wmodifica:=True;
   end; // target
end;

procedure TFPagoProvVa.dbgDocPagoColExit(Sender: TObject);
begin
   //Actualizamos el Footer
   z2bbtnSumatclick(nil);
   dbgDocPago.RefreshDisplay;
end;

{******************************************************************************}

procedure TFPagoProvVa.ActSaldosMovCxP;
var   xRegAct : TBookMark;
      xAdicional : Currency    ;
      xLoc    ,
      xExt    ,
      xOri    ,
      xcia    ,
      xtdia   ,
      xperio  ,
      ssql    ,
      xnreg,xSql   : String ;
begin
   with DM1 do
   begin
      cdsMovCxP.DisableControls;
      cdsMovCxP.Filtered:=False;
      cdsDocPago.DisableControls;
      xRegAct := cdsDocPago.GetBookmark;
      cdsDocPago.First;
      While not cdsDocPago.Eof do
       Begin
         xSql := 'select * from CXP301 where CIAID='+quotedstr(DM1.cdsDocPago.fieldbyname('CIAID').AsString)+
                  ' and TDIARID='+quotedstr(DM1.cdsDocPago.fieldbyname('TDIARID2').AsString)+
                 ' and CPANOMES='+quotedstr(DM1.cdsDocPago.fieldbyname('CPANOMM').AsString)+
                 ' and CPNOREG='+quotedstr(DM1.cdsDocPago.fieldbyname('CPNOREG').AsString);
         DM1.cdsMovCxP.close;
         DM1.cdsMovCxP.DataRequest(xSql);
         DM1.cdsMovCxP.Open;
         If DM1.cdsMovCxP.REcordCount > 0 then
          begin
            DM1.cdsMovCxP.edit ;
            if dm1.cdsMovCxP.FieldByName('TMONID').Value = wTMonLoc then
             begin
               DM1.cdsMovCxP.FieldByName('CPSALLOC').AsFloat := DM1.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat -
                                              dm1.numerononulo(DM1.cdsMovCxP.FieldByName('CPPAGLOC'))-
                                              DM1.cdsDocPago.FieldByName('DEMTOLOC').AsFloat ;

               DM1.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DM1.cdsMovCxP.FieldByName('CPSALLOC').AsFloat ;
               //Calculo del otro Saldo
               xAdicional := Redondea( DM1.cdsDocPago.FieldByName('DEMTOLOC').AsFloat / DM1.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat ) ;
               DM1.cdsMovCxP.FieldByName('CPSALEXT').Value := DM1.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat -
                                              dm1.numerononulo(DM1.cdsMovCxP.FieldByName('CPPAGEXT'))-
                                              xAdicional ;
             end
            else
             begin
               DM1.cdsMovCxP.FieldByName('CPSALEXT').AsFloat := DM1.cdsMovCxP.FieldByName('CPMTOEXT').AsFloat -
                                              dm1.numerononulo(DM1.cdsMovCxP.FieldByName('CPPAGEXT'))-
                                              DM1.cdsDocPago.FieldByName('DEMTOEXT').AsFloat ;

               DM1.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DM1.cdsMovCxP.FieldByName('CPSALEXT').AsFloat      ;
               //Calculo del otro Saldo
               xAdicional := Redondea( DM1.cdsDocPago.FieldByName('DEMTOEXT').AsFloat * DM1.cdsMovCxP.FieldByName('CPTCAMAJ').AsFloat ) ;
               DM1.cdsMovCxP.FieldByName('CPSALLOC').Value := DM1.cdsMovCxP.FieldByName('CPMTOLOC').AsFloat -
                                              dm1.numerononulo(DM1.cdsMovCxP.FieldByName('CPPAGLOC'))-
                                              xAdicional ;
             end ;

            xLoc   := DM1.cdsMovCxP.FieldByName('CPSALLOC').AsString ;
            xExt   := DM1.cdsMovCxP.FieldByName('CPSALEXT').AsString ;
            xOri   := DM1.cdsMovCxP.FieldByName('CPSALORI').AsString ;
            xcia   := trim(dblccia.text) ;
            xtdia  := DM1.cdsMovCxp.fieldbyname('TDIARID').AsString ;
            xperio := DM1.cdsMovCxp.fieldbyname('CPANOMES').AsString ;
            xnreg  := DM1.cdsMovCxp.fieldbyname('CPNOREG').AsString ;
            ///
              ssql := 'UPDATE CXP301 SET '+
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
              end;
              if dm1.cdsMovCxP.FieldByName('CPPAGLOC').IsNull then
                dm1.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat := 0 ;
              if dm1.cdsMovCxP.FieldByName('CPPAGEXT').IsNull then
                dm1.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat := 0 ;
              DM1.cdsMovCxP.post;
          end
         else
            Showmessage('No se Actualizó CXP ');
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
procedure TFPagoProvVa.ActMovCxP;
var   xRegAct : TBookMark;
   ssql : string;
   xtcam,xori,xext,xloc : string;
   xcia,xtdia,xperio,xnreg : string;
begin
    with DM1 do
    begin
      cdsMovCxP.DisableControls;
      cdsMovCxP.Filtered:=False;
      cdsDocPago.DisableControls;
      xRegAct := cdsDocPago.GetBookmark;
      cdsDocPago.First;
      While not cdsDocPago.Eof do
      Begin
        if DM1.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                                VarArrayOf([DM1.cdsDocPago.FieldByName('CIAID').AsString,
                                            DM1.cdsDocPago.FieldByName('TDIARID2').AsString,
                                            DM1.cdsDocPago.FieldByName('CPANOMM').AsString,
                                            DM1.cdsDocPago.FieldByName('CPNOREG').AsString]),
                                []) then
        begin
            xcia   := DM1.cdsDocPago.FieldByName('CIAID').AsString;
            xtdia  := DM1.cdsDocPago.FieldByName('TDIARID2').AsString;
            xperio := DM1.cdsDocPago.FieldByName('CPANOMM').AsString;
            xnreg  := DM1.cdsDocPago.FieldByName('CPNOREG').AsString;

            DM1.cdsMovCxP.edit;

            DM1.cdsMovCxP.fieldbyname('CPPAGLOC').AsFloat :=
                          DM1.cdsMovCxP.fieldbyname('CPMTOLOC').AsFloat -
                          DM1.cdsMovCxP.fieldbyname('CPSALLOC').AsFloat  ;
            DM1.cdsMovCxP.fieldbyname('CPPAGEXT').AsFloat :=
                          DM1.cdsMovCxP.fieldbyname('CPMTOEXT').AsFloat -
                          DM1.cdsMovCxP.fieldbyname('CPSALEXT').AsFloat  ;

            If DM1.cdsMovCxP.FieldByName('TMONID').Value=DM1.wTMonLoc then
            begin
               DM1.cdsMovCxP.fieldbyname('CPPAGORI').AsFloat :=
                                         DM1.cdsMovCxP.fieldbyname('CPPAGLOC').AsFloat ;
               If DM1.cdsMovCxP.FieldByName('CPSALLOC').AsFloat <= 0.02 then
                  DM1.cdsMovCxP.FieldByName('CPEstado').AsString := 'C';
            end
            else
            begin
               DM1.cdsMovCxP.fieldbyname('CPPAGORI').AsFloat :=
                                         DM1.cdsMovCxP.fieldbyname('CPPAGEXT').AsFloat ;
               If DM1.cdsMovCxP.FieldByName('CPSALEXT').AsFloat <= 0.02 then
                  DM1.cdsMovCxP.FieldByName('CPEstado').AsString := 'C';
            end;
            DM1.cdsMovCxP.FieldByName('CPTCamPa').AsFloat := DM1.cdsDocPago.FieldByName('DETCPAG').AsFloat ;
            DM1.cdsMovCxP.post ;
//////////////////////
//
            xLoc   := DM1.cdsMovCxP.FieldByName('CPPAGLOC').AsString ;
            xExt   := DM1.cdsMovCxP.FieldByName('CPPAGext').AsString ;
            xOri   := DM1.cdsMovCxP.FieldByName('CPPAGori').AsString ;
//
            ssql:='';
            ssql := 'UPDATE CXP301 SET '+
                    ' CPPAGLOC='+xloc+
                    ' ,CPPAGEXT='+xext+
                    ' ,CPPAGORI='+xori;
            If (DM1.cdsMovCxP.FieldByName('CPSALLOC').AsFloat <= 0.02) or (DM1.cdsMovCxP.FieldByName('CPSALEXT').AsFloat <= 0.02) then
             ssql := ssql +  ' ,CPESTADO='+quotedstr('C');
            //** 17/08/2001- pjsv
            If xtcam = '' then xtcam := '0';
            //**
            ssql := ssql + ' ,CPTCAMPA='+xtcam+
                           ' WHERE CIAID='+quotedstr(xcia)+
                           ' AND TDIARID='+quotedstr(xtdia)+
                           ' AND CPANOMES='+quotedstr(xperio)+
                           ' AND CPNOREG='+quotedstr(xnreg);
            try
             DCOM1.AppServer.EjecutaSQL(ssql);
            except
            end;
//////////////////////
        end
        else
        begin
            ShowMessage('Error :Actualización Mov WMC') ;
        end ;
        cdsDocPago.Next;
      end ;
      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);
      cdsDocPago.EnableControls;
      cdsMovCxP.Filtered:=True;
      cdsMovCxP.First;
      cdsMovCxP.EnableControls;
    end;
end;

procedure TFPagoProvVa.RetornaSaldosMovCxP;
begin
    with DM1 do
    begin
      cdsMovCxP.DisableControls;
      cdsMovCxP.Filtered:=False;
      cdsDocPago.DisableControls;
      cdsDocPago.First;
      While not cdsDocPago.Eof do
      Begin
        if DM1.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                                VarArrayOf([DM1.cdsDocPago.FieldByName('CIAID').AsString,
                                            DM1.cdsDocPago.FieldByName('TDIARID2').AsString,
                                            DM1.cdsDocPago.FieldByName('CPANOMM').AsString,
                                            DM1.cdsDocPago.FieldByName('CPNOREG').AsString]),
                                []) then
         begin
            cdsMovCxP.edit;
            DM1.cdsMovCxP.FieldByName('CPSALEXT').Value := DM1.cdsMovCxP.FieldByName('CPMTOEXT').Value - dm1.numerononulo( DM1.cdsMovCxP.FieldByName('CPPAGEXT') ) ;
            DM1.cdsMovCxP.FieldByName('CPSALLOC').Value := DM1.cdsMovCxP.FieldByName('CPMTOLOC').Value - dm1.numerononulo( DM1.cdsMovCxP.FieldByName('CPPAGLOC') ) ;
            If dm1.cdsMovCxP.FieldByName('TMONID').AsString = wTMonLoc then
               DM1.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DM1.cdsMovCxP.FieldByName('CPSALLOC').Value
            else
               DM1.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DM1.cdsMovCxP.FieldByName('CPSALEXT').Value ;
         end;
         cdsDocPago.Next;
     end;
     cdsDocPago.EnableControls;
     cdsMovCxP.Filtered:=True;
     cdsMovCxP.EnableControls;
   end;
end;

procedure TFPagoProvVa.dbeLoteExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then
      exit;

   dbeLote.text:=DM1.StrZero(dbeLote.text,DM1.cdsEgrCaja.FieldByName('ECLOTE').DisplayWidth);
end;

procedure TFPagoProvVa.dbeGiradoAChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagoProvVa.dbeTCambioChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagoProvVa.dbeImporteChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagoProvVa.dbeNoDocChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagoProvVa.dbeNoChqChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagoProvVa.dbeLoteChange(Sender: TObject);
begin
   wmodifica:=True;
end;


procedure TFPagoProvVa.dbeGlosaChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagoProvVa.FormKeyPress(Sender: TObject; var Key: Char);
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

end;}

procedure TFPagoProvVa.z2bbtnOKCabClick(Sender: TObject);
var
    xWhere : String ;
   xSQL : string;
begin

   if validacionCabecera = False then
      exit;

   dbeTCambio.text   := dm1.RecuperarTipoCambio(dbdtpFComp.date) ;
   with DM1 do
   begin
      xWhere :=  'CIAID ='+''''+dblcCia.Text+''''
                +' AND TDIARID ='+''''+dblcTDiario.Text+''''
                +' AND ECANOMM ='+''''+edtPeriodo.Text+''''
                +' AND ECNOCOMP ='+''''+dbeNoComp.Text +'''';
      if DM1.DisplayDescrip('prvTGE','CAJA302','COUNT(*) TOTREG',xWhere,'TOTREG') > '0' then
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
        //0805
        //liberamos el filtro del detalle
         dm1.cdsRegCxP.Filtered := False ;

        //// Insertar un nuevo registro
        //primero se recupera de la base de datos
         xSQL:='Select * from CAJA302 '
              +'Where CIAID='''   +dblcCia.Text    +''' and '
              +      'ECANOMM=''' +edtPeriodo.Text +''' and '
              +      'TDIARID=''' +dblcTDiario.Text+''' and '
              +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
         DM1.cdsEgrCaja.Close;
         DM1.cdsEgrCaja.DataRequest( xSQL );
         DM1.cdsEgrCaja.Open;

        //hacemos una nueva comprobacion
         if cdsEgrCaja.RecordCount <> 0 then
         begin
             ShowMessage('Comprobante ya esta registrado : Tipo 2');
             dbeNoComp.Text:='';
             dbeNoComp.SetFocus;
             exit;
         end  ;
        //insertamos el Nuevo Registro
        cdsEgrCaja.Insert;
////////////////////////////////////////////
        CambiaEstado('N');
      end;
   end;
   (Sender as tcontrol).enabled:=false;
   perform(CM_DialogKey,VK_TAB,0);
   wmodifica:=False;

end;

procedure TFPagoProvVa.dbeNoCompExit(Sender: TObject);
begin
   dbeNoComp.text:=DM1.StrZero(dbeNoComp.text,DM1.cdsEgrCaja.FieldByName('ECNOCOMP').DisplayWidth);
end;

procedure TFPagoProvVa.dbgDocPagoCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'DEMTOLOC') or (AFieldName = 'DEMTOEXT') then
    begin
       ABrush.Color := clNone;
    end;

end;

procedure TFPagoProvVa.dbgOtrosCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'DEMTOLOC') or (AFieldName = 'DEMTOEXT') then
    begin
       ABrush.Color := clNone;
    end;
end;

procedure TFPagoProvVa.dblcdCnpExit(Sender: TObject);
var
 xSql : string;
begin
   xSql := 'CPTOID='+quotedstr(dblcdCnp.Text);
   dbeGlosa.text := DM1.DisplayDescrip('prvCnpEgr','CAJA201','CPTODES',xSql,'CPTODES');
end;

procedure TFPagoProvVa.dblcEmpleadoChange(Sender: TObject);
begin

  if not Tcustomedit(dblcEmpleado).focused then Exit ;
   wmodifica:=True;

   if Length(dblcEmpleado.Text)=dblcEmpleado.LookupTable.FieldByName('USERID').size then
   begin
        if dblcEmpleado.Text = dblcEmpleado.LookupTable.FieldByName('USERID').AsString then
        begin
           edtEmpleado.Text:=dblcEmpleado.LookupTable.FieldByName('USERNOM').AsString;
           dbeGiradoA.text:=dblcEmpleado.LookupTable.FieldByName('USERNOM').AsString
        end
        else
        begin
          if not dblcEmpleado.LookupTable.Locate('USERID', dblcEmpleado.Text,[]) then
          begin
            edtEmpleado.Text:='';
            dbeGiradoA.text:='';
          end
          else
          begin
            edtEmpleado.Text:=dblcEmpleado.LookupTable.FieldByName('USERNOM').AsString;
            dbeGiradoA.text:=dblcEmpleado.LookupTable.FieldByName('USERNOM').AsString;
          end;
        end;
   end

end;

procedure TFPagoProvVa.dblcEmpleadoExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then
      exit;

   if edtEmpleado.Text='' then
   begin
      if dblcEmpleado.Text='' then
         ShowMessage('Ingrese Código de Empleado')
      else
         ShowMessage('Código de Empleado Errado');
      dblcEmpleado.SetFocus;
   end;
end;

procedure TFPagoProvVa.InhabilitarPaneles;
begin
   pnlDetalle.Enabled  := False;
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

procedure TFPagoProvVa.EdiTarRegistros;
begin
   BlanqueaEdits( pnlActualiza ) ;
   dm1.cdsRegCxP.Edit;    //Lo pongo en modo de edicion
   dbeNoReg.Text:=dm1.cdsRegCxP.FieldByName('CPNOREG').Value  ;
   dbeNoReg.Enabled:=false;
   label1.Caption := 'En Edicion';
   dbeNoReg.Enabled := False;
   dbeNoReg.Color   := clBtnFace;
   cdsTDiarioDet.Filter := 'TDIARID=''' + dblcTdiario2.Text + '''' ;
   cdsTDiarioDet.Filtered := True ;


   if not dm1.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dm1.wClaseAuxProv ]),[]) then
      Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''') ;

   //Recuperacion de los detalles del panel
   if trim(dblcTDiario2.Text) <> '' then  edtTDiario2.text  := dm1.DisplayDescripLocal(dm1.cdsTDiario,'TDIARID',dblctDiario2.Text,'TDIARABR') ;
   if trim(dblcTDoc2.Text)    <> '' then  edtTDoc2.Text     := dm1.DisplayDescrip('prvTGE','TGE110','DOCABR','DOCID=''' + dblcTDoc2.Text + '''','DOCABR') ;
   if trim(dblcdCnp2.Text)    <> '' then  edtCnp2.Text      := dm1.DisplayDescrip('prvTGE','CAJA201','CPTOABR','CPTOID=''' + dblcdCnp2.Text + '''','CPTOABR') ;

   if trim( dblcdAuxDet.Text ) <> '' then
   begin
      dbeAuxDet.Text    :=
            dm1.DisplayDescrip('prvTGE','CNT201','AUXABR',
                               'CLAUXID = ''' +
                               dm1.cdsRegCxP.fieldbyname('CLAUXID').AsString
                                + ''' AND AUXID=''' + dblcdAuxDet.Text + '''','AUXABR') ;
      edtClaseDet.Text     :=
            dm1.DisplayDescrip('prvTGE','TGE102','CLAUXABR',
                               'CLAUXID = ''' +
                               dm1.cdsRegCxP.fieldbyname('CLAUXID').AsString + ''' ','clauxabr') ;

   end ;

   if trim( dblcTMon2.Text ) <> '' then
      edtTMon2.Text     := dm1.DisplayDescripLocal(dm1.cdsTMon,'TMONID',dblctmon2.Text,'TMONABR') ;
   //fin de los detalles del panel

   if not dm1.cdsRegCxP.FieldByName('PROV').Isnull then
   begin
      if trim(dm1.cdsRegCxP.FieldByName('PROV').AsString) <> '' then
            dblcdAuxDet.Enabled := True
      else
            dblcdAuxDet.Enabled := False ;
   end
   else
      dblcdAuxDet.Enabled := False ;

   if not dm1.cdsRegCxP.FieldByName('CCOSID').Isnull then
   begin
      if trim(dm1.cdsRegCxP.FieldByName('CCOSID').AsString) <> '' then
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
      if not dm1.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClasedet.Text ]),[]) then
         Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''') ;



end;

procedure TFPagoProvVa.AdicionarRegistros;
var
xWhere,Aux :String;
begin
  with DM1 do
  begin
             dbeNoReg.Enabled:=true;
             dbeNoReg.Text:='';
             dbeNoReg.Text := GeneraCorrelativo( dm1.cdsRegCxP , 'CPNOREG' ) ;

             dm1.cdsRegCxP.Insert;
             dm1.cdsRegCxP.FieldByName('CIAID').Value   := dblcCia.Text;
             dm1.cdsRegCxP.FieldByName('TDIARID').Value := dblcTDiario.Text;
             dm1.cdsRegCxP.FieldByName('ECANOMM').Value := edtPeriodo.Text;
             dm1.cdsRegCxP.FieldByName('ECNOCOMP').Value:= dbeNoComp.Text;
             // Iniciar Datos, el reg. y su llave ya estan creados
             cdsRegCxP.FieldByName('DETCPAG').Value  := strtofloat(dbeTCambio.Text);
             cdsRegCxP.FieldByName('DEFCOMP').Value  := cdsEgrCaja.FieldByName('ECFCOMP').Value;
             cdsRegCxP.FieldByName('CPFEMIS').Value  := DateS;
             cdsRegCxP.FieldByName('CPFVCMTO').Value := DateS;
             cdsRegCxP.FieldByName('CPANOMM').Value  := copy(datetostr(cdsRegCxP.FieldByName('DEFCOMP').Value),7,4)
                                       +copy(datetostr(cdsRegCxP.FieldByName('DEFCOMP').Value),4,2);
             cdsRegCxP.FieldByName('DETCPAG').Value  := cdsEgrCaja.FieldByName('ECTCAMB').Value;
             cdsRegCxP.FieldByName('DETCDOC').Value  := cdsEgrCaja.FieldByName('ECTCAMB').Value;
             cdsRegCxP.FieldByName('DEDH').Value     := 'D';     //Inicializo en Debe

             xWhere:='FECHA=' +DM1.wRepFuncDate + '''' + formatdatetime(DM1.wFormatFecha,cdsRegCxP.FieldByName('DEFComp').AsDateTime)+''')' ;
             aux   :=DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
             cdsRegCxP.FieldByName('DEANO').Value  := cdsqry.FieldByName('FecAno').Value;
             cdsRegCxP.FieldByName('DEMM').Value   := cdsqry.FieldByName('FecMes').Value;
             cdsRegCxP.FieldByName('DEDD').Value   := cdsqry.FieldByName('FecDia').Value;
             cdsRegCxP.FieldByName('DESS').Value   := cdsqry.FieldByName('FecSS').Value;
             cdsRegCxP.FieldByName('DESEM').Value  := cdsqry.FieldByName('FecSem').Value;
             cdsRegCxP.FieldByName('DETRI').Value  := cdsqry.FieldByName('FecTrim').Value;
             cdsRegCxP.FieldByName('DEAASS').Value := cdsqry.FieldByName('FecAASS').Value;
             cdsRegCxP.FieldByName('DEAASem').Value:= cdsqry.FieldByName('FecAASem').Value;
             cdsRegCxP.FieldByName('DEAATri').Value:= cdsqry.FieldByName('FecAATri').Value;
   end;
   dbeNoReg.SetFocus;
   BlanqueaEdits(pnlActualiza) ;
   //blanqueo de descripciones
   edtTDoc2.Text := '' ;
   edtTDiario2.text := '' ;
   edtCnp2.Text := '' ;
   dbeAuxDet.Text := '' ;
   edtTMon2.Text := ''  ;

   dblcClaseDet.Enabled   := False ;
   dblcdAuxDet.Enabled := False ;
   dblcdCCosto.Enabled := False ;
   //
   label1.Caption := 'Nuevo     '   ;
   cdsTDiarioDet.Filter := 'Tdiarid=''''' ;
   cdsTDiarioDet.Filtered := True ;
   
end;

procedure TFPagoProvVa.LiberarFiltrosRegistroEgresos;
begin
      dm1.cdsTDoc.Filter:='';
      dm1.cdsTDoc.Filtered:=true;
end;

procedure TFPagoProvVa.EstablecerFiltrosRegistroEgresos;
begin
   dm1.cdsTDoc.Filter := 'NOT ( TDIARID IS NULL) OR NOT (TDIARID2 IS NULL) ' ;
   dm1.cdsTDoc.Filtered := true;
end;



procedure TFPagoProvVa.z2bbtnOK2Click(Sender: TObject);
begin

   if DM1.cdsRegCxP.State=dsInsert then
       if EncuentraDuplicado(DM1.cdsRegCxP,'CPNoReg',dbeNoReg.Text) then
          begin
            ShowMessage('Numero de Registro duplicado');
            dbeNoReg.SetFocus;
            exit;
          end;

   if not ValidaCampo then
      ShowMessage('No se puede grabar')
   else
   begin
      dm1.cdsRegCxP.Post;
      ShowMessage('Grabacion Ok');
      wmodifica:=True;
      //
      if not dbeNoReg.Enabled then
      begin
           PnlActualiza.Visible := False;
           pnlDetalle.Enabled   := True;
           pnlBotones.Enabled   := True;
           z2bbtnSumatClick(sender);    // Al salir hay que totalizar
           //quitar los filtros que se hubieran establecido
           liberarfiltrosregistroegresos;
      end
      else
      begin
           adicionarRegistros;
           //dbgDetPagoIButtonClick(Sender);
      end;
      //
   end;

end;


procedure TFPagoProvVa.z2bbtnCancel3Click(Sender: TObject);
begin
{     if dm1.cdsRegCxP.State = dsInsert then
        dm1.cdsRegCxP.Delete
     else begin
        dm1.cdsRegCxP.Cancel;
     end;
     PnlActualiza.Visible := False;
     pnlDetalle.Enabled   := True;
     pnlBotones.Enabled   := True;
     z2bbtnSumatClick(sender);    // Al salir hay que totalizar}
//     bFlagRecuperacion:=false;
     if dm1.cdsRegCxP.State = dsInsert then
        dm1.cdsRegCxP.Delete
     else
     begin
        if dm1.cdsRegCxP.State = dsedit then
          dm1.cdsRegCxP.Cancel;
     end;
     PnlActualiza.Visible := False;
     pnlDetalle.Enabled   := True;
     pnlBotones.Enabled   := True;
     z2bbtnSumatClick(Nil);    // Al salir hay que totalizar
   //quitar los filtros que se hubieran establecido
     liberarfiltrosregistroegresos;

end;

procedure TFPagoProvVa.dbgOtrosDblClick(Sender: TObject);
begin
   if not dbgOtrosIbutton.Enabled then
      exit ;

   if dbgOtros.DataSource.DataSet.RecordCount<>0 then
   begin
      inHabilitarPaneles;
      editarRegistros;
   end;
end;

function TFPagoProvVa.ValidacionCabecera: Boolean;
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

end;

procedure TFPagoProvVa.z2bbtnImprimeClick(Sender: TObject);
var
   Comprobante : RCabComprobante;
   xSql : string;
begin
  if DM1.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' THEN
  begin
      ShowMessage('Este Movimiento no Está Contabilizado');
      exit;
  end ;

  with Comprobante do
  begin
    CIAID    := dblcCia.Text ;
    TDIARID  := dblcTDiario.Text ;
    CiaDes   := dm1.DisplayDescrip('prvTGE','TGE101','CIADES','CIAID='+quotedstr(dblcCia.text),'CIADES');
    Diario   := edtTDiario.Text ;
    Proveedor:= edtEmpleado.Text ;
    Glosa    := dbeGlosa.Text ;
    Lote     := dbeLote.Text ;
    TipoDoc  := edtTDoc.Text ;
    TipoCamb := dbeTCambio.Text ;
    Periodo  := edtPeriodo.Text ;
    NoComp   := dbeNoComp.Text ;
    NoDoc    := dbeNoDoc.Text ;
    Cuenta   := dblcCCBco.Text;
    Banco    := edtBanco.text ;
    NumChq   := dbeNoChq.text ;
    Moneda   := dm1.DisplayDescrip('prvTGE','TGE103','TMONABR','TMONID='+quotedstr(dblcTMon.text),'TMONABR');
    Importe  := DM1.cdsEgrCaja.Fieldbyname('ECMTOORI').AsString;
    xsql := 'TMONID='+quotedstr(dblcTMon.text);
    Tmoneda  := Dm1.displayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC');
  end;

   FVoucherImp:=TFVoucherImp.Create(Self);
   FVoucherImp.wBienedeForma := 'PAGOVPROV';
   FVoucherImp.wComprobanteI:=Comprobante;
   with FVoucherImp do
   Try
      ShowModal;
   Finally
      Free;
   End;
end;

procedure TFPagoProvVa.FormShow(Sender: TObject);
begin
   with dm1 do
   begin
      if Trim(dblcBanco.Text) <> '' then
      begin
          if cdsEgrCaja.FieldByName('ECEstado').Value='I' then//Si está INCOMPLETO o PENDIENTE
          begin
                //focus
                pnlCabecera2.setfocus ;
                perform(CM_DialogKey,VK_TAB,0);
                //
          end;

          if ( cdsEgrCaja.FieldByName('ECEstado').Value='C' ) or
             ( cdsEgrCaja.FieldByName('ECEstado').Value='A' ) then      //Si está CANCELADO
          begin
               //focus
               pnlBotones.SetFocus ;
               perform(CM_DialogKey,VK_TAB,0);
               //
          end;
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
//          ControlFocoEntrada (ctrl,evt_exit) ;
   end ;
   // añadido por wmc
   z2bbtnSumatDocPagoClick( nil ) ;
   z2bbtnSumatClick( nil ) ;
   //
   cf1.PonerExits ;
end;

procedure TFPagoProvVa.dbeNoChqChange2(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFPagoProvVa.dbeTCambioChange2(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFPagoProvVa.dblcBancoExit2(Sender: TObject);
begin
 if DiaAperturado(dblcCia.text,dbdtpFComp.Date,dblcBanco.text) then
  begin
    edtBanco.Text := DM1.DisplayDescrip('prvTGE','TGE105','BANCOABR','BANCOID='+quotedstr(dblcBanco.text),'BANCOABR');
    if edtBanco.Text = '' then
     begin
      dblcBanco.Value := '';
      edtBanco.Text := '';
      dblcBanco.SetFocus;
      exit;
     end
    else
     begin
      dblcCCBco.Text := '' ;
      edtCuenta.Text := '' ;
      dblcdCnp.Text  := '' ;
      dbeGlosa.Text := '' ;
      dblcTMon.Text := '' ;
      edtTMon.Text := '' ;
      if DM1.cdsbancoegr.FieldByName('BCOTIPCTA').Value='C' then
       begin //Si es CAJA
        dblcTDiario.Text := DM1.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco.text),'CCBCOVOUCH');
        dblcTDiario.OnExit(dblcTDiario);
        dblcCCBco.Enabled:=False;
        dblcTMon.Enabled := True ;
        edtCuenta.Text := DM1.DisplayDescrip('prvTGE','TGE105','CUENTAID','BANCOID='+quotedstr(dblcBanco.text),'CUENTAID');
        dblcdCnp.text  := DM1.DisplayDescrip('prvTGE','TGE105','CPTOID','BANCOID='+quotedstr(dblcBanco.text),'CPTOID');
        dbeGlosa.Text  := DM1.DisplayDescrip('prvTGE','CAJA201','CPTODES','CPTOID='+quotedstr(dblcdCnp.text),'CPTODES');
        DM1.cdsFormPago.Filter := 'FCEGR=''1'' or FCEGR=''S'' ' ;
        DM1.cdsFormPago.Filtered := True ;
       end
      else
       begin  //Si es BANCO
        dblcCCBco.Enabled:=True;
        dblcTMon.Enabled := False ;
        dblcFormPago.Enabled := False ;
        DM1.cdsCCBco.Filtered:=False;
        DM1.cdsCCBco.Filter:='';   //Filtrar la lista de CtaCte por Banco
        DM1.cdsCCBco.Filter:='BANCOID='+''''+dblcBanco.Text+''''+' AND CIAID='+quotedstr(dblcCia.text);
        DM1.cdsCCBco.Filtered:=True;
        //filtrar los tipos de pago
        DM1.cdsFormPago.Filter := 'FCBCO=''1'' or FCBCO=''S'' ' ;
        DM1.cdsFormPago.Filtered := true ;
        dblcCCBco.setfocus;
        //cim 26/11/2001
        dbeNoChq.enabled := true;

       end;
      If dm1.cdsFormPago.RecordCount > 1 then
       begin
        dblcFormPago.Enabled := True;
        dblcFormPago.text := '' ;
        edtFormPago.text := '' ;
       end
      else
       dblcFormPago.Enabled := False;
      dbeNoChq.Text := '' ;
      wmodifica:=True;
     end;
  end;
end;

procedure TFPagoProvVa.dblcCCBcoChange2(Sender: TObject);
begin
   if trim(dblcccbco.Text)<>'' then
   begin
      if DM1.cdsCCBco.Locate('BANCOID;CCBCOID',VararrayOf([dblcbanco.text,dblcccbco.text]),[]) then
      begin
           edtCCBco.Text  := DM1.cdsCCBco.fieldbyname('CCBCODES').AsString ;
           edtCuenta.Text := DM1.cdsCCBco.fieldbyname('CTAPRINC').AsString ;
           //**08/06/2001 - pjsv
           dblcdCnp.Text  := dm1.DisplayDescrip('prvTGE','CAJA201','CPTOID','CPTOID='+quotedstr(DM1.cdsCCBco.fieldbyname('CPTOID').AsString),'CPTOID');
           dbeGlosa.Text := dm1.DisplayDescrip('prvTGE','CAJA201','CPTODES','CPTOID='+quotedstr(dblcCCBco.text),'CPTODES');  //  DM1.cdsCCBcoLKGLOSA.AsString ;
           //**
           //**05/06/2001 - pjsv
           xVoucher := DM1.cdsCCBco.fieldbyname('CCBCOVOUCH').AsString;
           //**
        If dm1.wModo = 'I' then
         begin
          dblcTDiario.Text := DM1.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco.text)+' AND CCBCOID='+quotedstr(dblcCCBco.text),'CCBCOVOUCH');
          dblcTDiario.OnExit(dblcTDiario);
         end;
      end
      else
      begin
           edtCCBco.Text := '' ;
           edtCuenta.Text:= '' ;
           //WMC123666
           dblcdCnp.Text := '' ;
           dbeGlosa.Text := '' ;
      end;
   end
   else
   begin
        edtCCBco.Text := '' ;
        edtCuenta.Text:= '' ;
        //WMC123666
        dblcdCnp.Text := '' ;
        dbeGlosa.Text := '' ;

   end ;

   if edtCCBco.Text <> '' then
   begin
   //** 06/03/2001 - pjsv - para nelly
   If dm1.cdsFormPago.RecordCount = 1 then
    dblcformpago.Enabled := false
   else
    dblcformpago.Enabled := true;
   end   ;
   //**
   wmodifica:=True;

{   if trim(dblcccbco.Text)<>'' then
   begin
      if dm1.cdsCCBco.Locate('BANCOID;CCBCOID',VararrayOf([dblcbanco.text,dblcccbco.text]),[]) then
      begin
           edtCCBco.Text :=DM1.cdsCCBco.fieldbyname('CCBCODES').AsString ;
           edtCuenta.Text:=DM1.cdsCCBco.fieldbyname('CTAPRINC').AsString ;
           //WMC123666
           dblcdCnp.Text  := dm1.cdsCCBcoCPTOID.AsString ;
           dbeGlosa.Text := dm1.cdsCCBcoLKGLOSA.AsString ;
           //**05/06/2001 - pjsv
           xVoucher := DM1.cdsCCBco.fieldbyname('CCBCOVOUCH').AsString;
           //**
      end
      else
      begin
           edtCCBco.Text := '' ;
           //WMC123666
           edtCuenta.Text:= '' ;
           dblcdCnp.Text  := '' ;
           dbeGlosa.Text  := '' ;
      end;
   end
   else
   begin
        edtCCBco.Text := '' ;
        //WMC123666
        edtCuenta.Text:= '' ;
        dblcdCnp.Text  := '' ;
        dbeGlosa.Text := '' ;

   end ;

   if edtCCBco.Text <> '' then
   begin
      dblcformpago.Enabled := True ;
   end   ;
   //** 06/03/2001 - pjsv - para nelly
   If dm1.cdsFormPago.RecordCount = 1 then
    dblcformpago.Enabled := false
   else
    dblcformpago.Enabled := true;
   //**
   wmodifica:=True;
}
end;

procedure TFPagoProvVa.dblcCCBcoExit2(Sender: TObject);
var
   Tmp : String ;
begin
	 if dblcBanco.Focused then Exit;

   edtCCBco.Text:=DM1.DisplayDescripLocal(DM1.cdsCCBco,'CCBCOID',dblcCCBco.Text,'CCBCOID') ;

	 if Tmp='' then
	 begin
      edtCCBco.Text := '' ;
      edtCuenta.Text:= '' ;
      dblcdCnp.Text := '' ;
      dbeGlosa.Text := '' ;
      ShowMessage('Error : Cuenta Corriente No Valida');
		  dblcCCBco.SetFocus;
		  exit;
	 end;

   dblcTmon.Text := dm1.cdsCCBco.fieldbyname('TMONID').AsString ;
   edtTMon.Text := dm1.DisplayDescripLocal(dm1.cdsTMon,'TMONID',dblcTMon.text,'TMONDES') ;
   dbeNOChq.Text := '' ;

   edtCCBco.Text  := DM1.cdsCCBco.fieldbyname('CCBCODES').AsString ;
   edtCuenta.Text := DM1.cdsCCBco.fieldbyname('CTAPRINC').AsString ;
   dblcdCnp.Text  := dm1.DisplayDescrip('prvTGE','CAJA201','CPTOID','CPTOID='+quotedstr(DM1.cdsCCBco.fieldbyname('CPTOID').AsString),'CPTOID');
   dbeGlosa.Text := dm1.DisplayDescrip('prvTGE','CAJA201','CPTODES','CPTOID='+quotedstr(dblcCCBco.text),'CPTODES');  //  DM1.cdsCCBcoLKGLOSA.AsString ;
   xVoucher := DM1.cdsCCBco.fieldbyname('CCBCOVOUCH').AsString;
   dblcTDiario.Text := DM1.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco.text)+' AND CCBCOID='+quotedstr(dblcCCBco.text),'CCBCOVOUCH');

end;

procedure TFPagoProvVa.dblcFormPagoExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then exit;
   if dblcTMon.Focused then exit;

   edtFormPago.text:= DM1.DisplayDescripLocal(DM1.cdsFormPago,'FPAGOID',dblcFormPago.Text,'FPAGODES') ;

   if dblcFormPago.Text='' then begin
      dbeNoChq.Text :='';
      ShowMessage('Error : Forma de Pago no Valida');
      dblcFormPago.SetFocus;
      Exit;
   end;
   dbdtpFEmis.date := 0 ;
   dbeNoChq.Text :='';

   if (DM1.cdsFormPago.FieldByName('FCHQ').AsString='1') or
      (DM1.cdsFormPago.FieldByName('FCHQ').AsString='S') then
   begin
      dbeNoChq.Enabled :=True ;
      dbdtpFEmis.Enabled := True ;
   end
   else
   begin
      dbeNoChq.Enabled :=False;
      dbdtpFEmis.Enabled := False ;
   end;
   if DM1.cdsFormPago.FieldByName('FCANJE').Value='S' then
      edtCuenta.Enabled := True
   else
   begin
      edtCuenta.Enabled := False ;
   end;

end;

procedure TFPagoProvVa.RecuperaDescrip;
var
   CLAUXID ,
   AUXID   : sTRING ;
begin
{
  TSOLsrvCAJA.DescripPagoVaProv(const xCIAID, xECANOMM, xTDIARID,
  xECNOCOMP: WideString);
        TGE105.BANCONOM, TGE103.TMONDES, TGE106.CCBCODES, TGE112.FPAGODES,
        TGE102.CLAUXABR, TGE110.DOCABR ,TGE002.USERNOM
}
    dm1.DescripPagoVaProv(dblcCia.text,edtPeriodo.text,dblcTDiario.Text,dbeNoComp.text);
    dm1.cdsDescrip.Active := False ;
    dm1.cdsDescrip.Active := True ;
    edtTMon.text     := dm1.FieldNoNulo(dm1.cdsDescrip.fieldBYname('TMONABR'));
    edtTDoc.text     := dm1.FieldNoNulo(dm1.cdsDescrip.fieldBYname('DOCABR'));
    edtBanco.text    := dm1.FieldNoNulo(dm1.cdsDescrip.fieldBYname('BANCOABR'));
    edtCCBco.text    := dm1.FieldNoNulo(dm1.cdsDescrip.fieldBYname('CCBCODES'));
    edtFormPago.text := dm1.FieldNoNulo(dm1.cdsDescrip.fieldBYname('FPAGOABR'));
    if DM1.cdsEmpleado.Locate('USERID',VARARRAYOF([DM1.cdsEgrCaja.FIELDBYNAme('USERRESP').AsString ]),[]) then
    begin
       CLAUXID  := DM1.cdsEmpleado.FIELDBYNAME('CLAUXID').AsString   ;
       AUXID    := DM1.cdsEmpleado.FIELDBYNAME('AUXID').AsString   ;
       IF DM1.RecuperarDatos('CNT201','AUXNOMB','CLAUXID='''+CLAUXID+''' AND AUXID = '''+ AUXID + ''' ') THEN
          edtEmpleado.Text := dm1.cdsrec.fieldBYname('AUXNOMB').AsString ;
    end ;
    edtCia.Text := dm1.FieldNoNulo(dm1.cdsDescrip.fieldBYname('CIADES'));
    edtTDiario.Text := dm1.FieldNoNulo(dm1.cdsDescrip.fieldBYname('TDIARABR')); ;
    if not dm1.cdsDescrip.FieldByName('FLUEFEABR').isnull then
       dbeFEfec.text := dm1.cdsDescrip.FieldByName('FLUEFEABR').AsString ;

end;

procedure TFPagoProvVa.Adiciona;
var
   xSQL : String ;
begin
 //Código Nuevo
         IniciaDatos ;
         edtCuenta.Enabled := False ;
         xGraboNuevo := False ;
         //Validacion Adicional

         //
         dm1.cdsRegCxP.Filter := 'CIAID=''''' ;
         dm1.cdsRegCxP.Filtered := True ;
         z2bbtnNuevo.Visible := True ;
         z2bbtnCancel.Visible := True ;

         // vhn 22/01/2001
         xSQL:='Select * from CAJA303 '
              +'Where CIAID='''' and ECANOMM='''' and '
              +      'TDIARID='''' and ECNOCOMP='''' ';
         DM1.cdsDocPago.Close;
         DM1.cdsDocPago.DataRequest( xSQL );
         DM1.cdsDocPago.Open;

         dm1.cdsMovCxP.Filter := 'CIAID=''''' ;
         dm1.cdsMovCxP.Filtered := True ;

         dblcEmpleado.Enabled := true ;
         xTC := 0 ;
         dm1.RecuperaCierre( wFechacierre , wFrecu ) ;

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

procedure TFPagoProvVa.Edita(Comp: structComprobante;cds : Twwclientdataset);
var
   xWhere ,
   xFiltro : String ;
   xSQL : string;
begin
   IniciaDatos;
   cdsfiltro :=  cds ;
   dblcCia.Text      :=  Comp.CIAID    ;
   dblcTDiario.Text  :=  Comp.TDIARID  ;
   edtPeriodo.Text   :=  Comp.ECANOMM  ;
   dbeNoComp.Text    :=  Comp.ECNOCOMP ;
   with DM1 do
   begin
      // Asignar desde valores del registro activo
      dbdtpFComp.date  :=cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
      dblcEmpleado.Text:=cdsEgrCaja.FieldByName('USERRESP').AsString;
      //fin de nueva linea de william manriuque cautín
      dbeGiradoA.Text  :=cdsEgrCaja.FieldByName('ECGIRA').AsString;
      dblcTMon.Text    :=cdsEgrCaja.FieldByName('TMONID').AsString;
      dbeTCambio.Text  :=cdsEgrCaja.FieldByName('ECTCAMB').AsString;
      xTC              := cdsEgrCaja.FieldByName('ECTCAMB').AsFloat ;
      dbeImporte.Text  :=cdsEgrCaja.FieldByName('ECMTOORI').AsString;
      dblcTDoc.Text    := cdsEgrCaja.FieldByName('DOCID').AsString;
      dbeNoDoc.Text    :=cdsEgrCaja.FieldByName('ECNODOC').AsString;
      dblcBanco.Text   :=cdsEgrCaja.FieldByName('BANCOID').AsString;
      dblcCCBco.Text   :=cdsEgrCaja.FieldByName('CCBCOID').AsString;
      edtCuenta.Text   :=cdsEgrCaja.FieldByName('CUENTAID').AsString;
      dblcFormPago.Text:=cdsEgrCaja.FieldByName('FPAGOID').AsString;
      dbeNoChq.Text    :=cdsEgrCaja.FieldByName('ECNOCHQ').AsString;
      dbeLote.Text     :=cdsEgrCaja.FieldByName('ECLOTE').AsString;
      dblcdCnp.Text    :=cdsEgrCaja.FieldByName('CPTOID').AsString;
      dbeGlosa.Text    :=cdsEgrCaja.FieldByName('ECGLOSA').AsString;
      dblcdFEfec.Text  :=cdsEgrCaja.FieldByName('FLUEID').AsString ;
      dbdtpFEmis.date  :=cdsEgrCaja.FieldbyName('ECFEMICH').AsDateTime ;
      //Asigna descripciones wmc
      RecuperaDescrip ;
      //fin de asigna descripciones wmc
      ActivaFiltro('REGCXP');
      ActivaFiltro('DOCPAGO');

      if cdsEgrCaja.FieldByName('ECEstado').Value='I' then//Si está INCOMPLETO o PENDIENTE
      begin
         cdsEgrCaja.Edit;
         CambiaEstado ('I');
         dbgOtrosIButton.Enabled := True ;
         //**************************
         xWhere :=  'CIAID = ''' +dblcCia.Text  + ''' AND ' +
                    ' CPESTADO =' + '''' + 'P' + ''' ' ;

         xFiltro := ' (( (CPMTOORI-CPPAGORI-CPSALORI)> -0.01 and (CPMTOORI-CPPAGORI-CPSALORI) < 0.01 ) OR '+
                    '   ( CPMTOORI = CPSALORI ) )  AND ( CPSALORI > 0 ) '  ;

         dm1.cdsMovCxP.active := False ;
         dm1.cdsMovCxP.Datarequest('SELECT * FROM CXP301 WHERE ' + xWhere ) ;
         dm1.cdsMovCxP.Active := True ;

         dm1.cdsMovCxP.Filter   := xFiltro ;

         dm1.cdsMovCxP.Filtered := True ;
         //**************************
      end;

      if cdsEgrCaja.FieldByName('ECEstado').Value='C' then      //Si está CANCELADO
      begin
         CambiaEstado('C');
         dbgOtrosIButton.Enabled := False ;
         ActPnlBotones;
      end;

      if cdsEgrCaja.FieldByName('ECEstado').Value='A' then      // Si esta ANULADO
      begin
         CambiaEstado('A');
         dbgOtrosIButton.Enabled := False ;
         ActPnlBotones;
      end;

      z2bbtnSumatClick(nil);
      z2bbtnSumatDocPagoClick(nil);
      dblcEmpleado.Enabled := False ;

   end;
   (z2bbtnOkCab).enabled:=false;
   z2bbtnNuevo.Visible := False ;
   z2bbtnCancel.Visible := False ;
   wmodifica:=False;
end;

procedure TFPagoProvVa.FormCreate(Sender: TObject);
begin
    dm1.ASignaTipoDiario(dblcTDiario,self) ;
    setLength(A2digitos,1) ;
    setLength(A4digitos,1) ;
    A2digitos[0] := dbeImporte ;
    A4digitos[0] := dbeTcambio ;

    cdsConceptoC1 := TwwClientdataset.Create(Self) ;
    cdsConceptoC1.CloneCursor(DM1.cdsCnpEgr ,True) ;
    cdsConceptoC1.Name := 'cdsConceptoC1' ;
    cdsConceptoC1.Filtered := True ;
    dblcdCnp2.LookupTable := cdsConceptoC1 ;

    cdsTdiarioDet := TwwClientdataset.Create(Self) ;
    cdsTdiarioDet.CloneCursor(DM1.cdsTDiario ,True) ;
    cdsTdiarioDet.Name := 'cdsTdiarioDet' ;
    dblcTDiario2.LookupTable := cdsTdiarioDet ;
    cf1 := TControlFoco.Create ;
    dm1.cdsFEfec.Filter := 'FLUEFE_IS = ''S'' ' ;
    dm1.cdsFEfec.Filtered := True ;
    cdsTdiarioDet.CloneCursor(DM1.cdsTDiario1 ,True);
end;

procedure TFPagoProvVa.AdicIniciaDatos;
begin

   RecuperarCiaUnica(dblcCia,edtCia);
   edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
   if dblccia.Text<>'' then
      perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFPagoProvVa.ActualizaSaldosCaja;
begin
    if trim(dblcCCBco.TEXT) <> '' then
    begin
       dm1.ActSdoTlfn(dblcCia.text,dblcBanco.text,dblcCCBCo.Text,
                      dm1.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                      DBDTPfcOMP.DATE) ;
       dm1.ActSdoMen(dblcBanco.text,dblcCCBCo.Text,
                      dm1.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                      DBDTPfcOMP.DATE) ;
    end
    else
      with dm1.cdsEgrCaja do
       dm1.ActSdoCaja(fieldbyname('TMONID').AsString , fieldbyname('BANCOID').AsString ,
                      fieldbyname('ECMTOORI').AsString ,fieldbyname('ECFCOMP').AsString) ;
    
end;

procedure TFPagoProvVa.ConfiguraAccesos;
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

procedure TFPagoProvVa.Libera_Admin;
begin
    Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFPagoProvVa.Libera_Consul;
begin

end;

procedure TFPagoProvVa.Proc_Admin;
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

procedure TFPagoProvVa.Proc_Consul;
begin
    pnlCabecera1.Enabled := False ;
    pnlCabecera2.Enabled := False ;
    pnlDeTalle.Enabled := True ;
    pnlBotones.Enabled := False ;
end;

procedure TFPagoProvVa.LibConfigAccesos;
begin
    if DM1.wAdmin = 'G' then
       Libera_Admin
    else
    begin
       if DM1.wModo = 'C' then
          Libera_Consul ;
    end ;
end;

procedure TFPagoProvVa.ValidaCabecera2;
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

   if length(dbeImporte.Text)=0 then raise exception.Create('Falta Monto a Pagar')
   else
      if strtofloat(dbeImporte.Text)<=0 then raise exception.Create('Importe Errado');

   if length(dblcTDoc.Text)=0 then raise exception.Create('Falta Tipo de Documento');
   if length(edtTDoc.Text)=0 then raise exception.Create('Tipo de Documento Errado');
   if length(dbeNoDoc.Text)=0 then raise exception.Create('Falta Nro.de Documento');

   if length(dblcBanco.Text)=0 then raise exception.Create('Falta definir Banco');
   if length(edtBanco.Text)=0 then raise exception.Create('Codigo de Banco Errado');

   if dblcCCBco.Enabled=True then
   begin
      if length(dblcCCBco.Text)=0 then raise exception.Create('Falta Cuenta Corriente Banco');
      if length(edtCCBco.Text)=0 then raise exception.Create('Codigo de Cta Cte Errado');
      IF dbdtpFEmis.Date = 0 then
      begin
         dbdtpFEmis.SetFocus ;
         raise exception.create('Ingrese Fecha de Emisión del Cheque') ;
      end ;

   end;

   if dblcFormPago.Enabled=True then
   begin
      if length(dblcFormPago.Text)=0 then raise exception.Create('Falta Forma de Pago');
      if length(edtFormPago.Text)=0 then raise exception.Create('Codigo de Forma de Pago Errado');
   end;

   if (dbeNoChq.Enabled=True) and (length(dbeNoChq.Text)=0) then
      raise exception.Create('Falta No. de Cheque');
//YA NO ES OBLIGATORIO EL INGRESO DEL LOTE
//   if length(dbeLote.Text)=0 then raise exception.Create('Falta Lote');
   if length(dblcdCnp.Text)=0 then raise exception.Create('Falta Concepto');

end;

procedure TFPagoProvVa.Z2bbtnEmiChqClick(Sender: TObject);
var
   strChq : structChq ;
   ArchivoReporte : string ;
begin
   if trim(dblcCCBco.Text) <> '' then
   begin
        dm1.RecuperarDatos('TGE106','*',
                           'BANCOID = ''' + dblcBanco.text+ ''' AND CCBCOID = ''' + dblcCCBco.Text+ '''') ;
        ArchivoReporte  := dm1.cdsRec.fieldbyname('CCFMTCHQ').ASString ;
        with strChq do
        begin
          ppFileName    := ArchivoReporte                                             ;
          ppGiradoA     := dbeGiradoA.Text                                            ;
          ppImporte     := floattostrf(strtocurr(trim(dbeImporte.Text)),fffixed,10,2) ;
          ppMontoLetras := strNum(strtofloat(ppImporte))                              ;
          ppDia         := strDia(dbdtpFEmis.Date)                                    ;
          ppmes         := strMes(dbdtpFEmis.Date)                                    ;
          ppAno         := strAno(dbdtpFEmis.Date)                                    ;
          If dblcCCBco.Text <> '0100001518' then
           ppRuc         := xRUCCIA;
        end ;
        Fprincipal.EmiteChq(ArchivoReporte, strChq);
   end
   else
   begin
      Showmessage('No ha seleccionado Cuenta Corriente') ;
   end ;

end;

procedure TFPagoProvVa.dbdtpFEmisEnter(Sender: TObject);
begin
   strTmp := dbdtpFEmis.Text ;
end;

procedure TFPagoProvVa.dbdtpFEmisExit(Sender: TObject);
begin
   if (dbdtpFEmis.Text <> strTmp) and (dbdtpFEmis.Date <> 0) then
   begin
      dbeTcambio.Text := floattostrf(strtofloat(Dm1.RecuperarTipoCambio(dbdtpFEmis.Date)),fffixed,10,2) ;
   end ;
end;

procedure TFPagoProvVa.dbeTCambioEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFPagoProvVa.dbeImporteEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFPagoProvVa.dbeImporteExit(Sender: TObject);
begin
    if strTmp <> TCustomEdit(Sender).text then
    begin
       TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text) ;
    end ;
end;

procedure TFPagoProvVa.dbeTCambioExit(Sender: TObject);
begin
    if strTmp <> TCustomEdit(Sender).text then
    begin
       TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text,4) ;
    end ;

end;

procedure TFPagoProvVa.SaldosAux;
var
   Previo ,
   Actual ,
   xClase : String ;
   cdsClone : TwwClientDataSet ;
begin
    with dm1.cdsDocPago do
    begin
       if RecordCount = 0 then
          Exit ;
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
       IndexFieldNames := '' ;
       EnableControls ;
       cdsClone.free ;
    end ;
end;

procedure TFPagoProvVa.Opera(xProv , xClase : string;cdsClone : TwwClientDataSet) ;
var
   xFiltro : string          ;
   xDEMTOLOC ,
   xDEMTOEXT : Currency      ;
   xDatAux : structSaldosAux ;
   xMTOSLOC ,
   xMTOSEXT : Currency       ;
begin
   xMTOSLOC := 0;
   xMTOSEXT := 0;

   xFiltro  := 'CLAUXID = ''' + xClase + ''' AND PROV = ''' + xProv + '''' ;
   cdsclone.CloneCursor(dm1.cdsDocPago,true) ;
   //Calculo de Montos Locales
   cdsclone.Filter   := xfiltro +' AND TMONID= '''+dm1.wTMonLoc+'''' ;
   cdsclone.Filtered := true   ;
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
   end
   else
     xMTOSLOC := 0 ;
   //calculo de Montos Extranjeros
   cdsclone.Filter   := xfiltro +' AND TMONID= '''+dm1.wTMonExt+'''' ;
   cdsclone.Filtered := true   ;
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
   end
   else
     xMTOSEXT := 0 ;

   xDEMTOLOC := DM1.OperClientDataSet( DM1.cdsDocPago , 'SUM(DEMTOLOC)',xFiltro ) ;
   xDEMTOEXT := DM1.OperClientDataSet( DM1.cdsDocPago , 'SUM(DEMTOEXT)',xFiltro ) ;
   with xDatAux , DM1.cdsEgrcaja do
   begin
      CIAID     :=  dblcCia.Text    ;
      CLAUXID   :=  xClase  ;
      AUXID     :=  xProv    ;
      MONTOMN   :=  CajaDec( floatToStr( xDEMTOLOC ) ) ;
      MONTOME   :=  CajaDec( floatToStr( xDEMTOEXT ) ) ;
      MTOSLOC   :=  currtoStr( xMTOSLOC )  ;
      MTOSEXT   :=  CurrToStr( xMTOSEXT )  ;
      FECHA     :=  dbdtpFComp.date  ;
      dm1.ActSaldosAux ( xDatAux )  ;
   end ;
end;

function TFPagoProvVa.BuscaClase: String;
var
  cds : TwwClientDataset ;
begin
  cds := TwwClientDataset.Create( self ) ;
  cds.CloneCursor(dm1.cdsMovCxP , True ) ;
  if cds.Locate('CIAID;CPANOMES;TDIARID;CPNOREG',
                 VarArrayOf([dm1.cdsDocPago.fieldbyname ('CIAID').AsString ,
                             dm1.cdsDocPago.fieldbyname ('CPANOMM').AsString ,
                             dm1.cdsDocPago.fieldbyname ('TDIARID2').AsString ,
                             dm1.cdsDocPago.fieldbyname ('CPNOREG').AsString]) , []) then
  begin
    Result := cds.FieldBYname('CLAUXID').AsString ;
  end
  else
  begin
    Result := '' ;
  end ;
end;

procedure TFPagoProvVa.dblcTDoc2Enter(Sender: TObject);
begin
   strTmp := dblcTDoc2.Text ;
end;

procedure TFPagoProvVa.dblcTDoc2Exit2(Sender: TObject);
var
   Filtro : String ;
   Tmp : String ;
begin
   Tmp := StrTmp ;
   StrTmp := Tmp ;
   if (trim(dblcTDoc2.text)<>'') and (dblcTDoc2.Text <> StrTmp) then
   begin
      //Filtra y Blanquea
      DM1.cdsTDoc.Locate('DOCID',VarArrayOf([dblcTDoc2.text]),[]);
      Filtro:='TDIARID='''+TwwDBCustomLookupCombo(Sender).LookUpTable.FieldbyName('TDIARID').asstring +
              ''' OR TDIARID='''+TwwDBCustomLookupCombo(Sender).LookUpTable.FieldbyName('TDIARID2').asstring+'''';
      if cdsTDiarioDet.Filter<>Filtro then
      begin
         cdsTdiarioDet.Filter := Filtro;
         cdsTdiarioDet.Filtered := true;
         if dblcTDiario2.Text <> cdsTdiarioDet.FieldByName('TDIARID').AsString then
            dblcTDiario2.Text :='';
      end;
   end;
end;


procedure TFPagoProvVa.RecCptosDifC;
begin
    if trim(dblcCCBco.Text) = '' then
    begin
       if not dm1.RecuperarDatos('TGE105','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP,CCOSDIF','BANCOID=''' + dblcBanco.Text + '''' )  then
          Raise exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio') ;
    end
    else
    begin
       if not dm1.RecuperarDatos('TGE106','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP,CCOSDIF','BANCOID=''' + dblcBanco.Text +
                                 ''' AND CCBCOID=''' + dblcCCBco.Text + '''' )  then
          Raise exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio') ;
    end ;
    wCptoGan  := dm1.cdsRec.fieldbyname('CPTODIFG').AsString ;
    wCptoPer  := dm1.cdsRec.fieldbyname('CPTODIFP').AsString ;
    wCtaGan   := dm1.cdsRec.fieldbyname('CTADIFG').AsString ;
    wCtaPer   := dm1.cdsRec.fieldbyname('CTADIFP').AsString ;
    wCCosDif  := DM1.cdsRec.fieldbyname('CCOSDIF').AsString ;
end;

procedure TFPagoProvVa.dblcClaseDetExit(Sender: TObject);
var
   sSQL,Tmp : String ;
begin
    if z2bbtnCancel3.Focused then Exit;
    if dblcdCnp2.Focused then Exit;

    edtClaseDet.text:= DM1.DisplayDescripLocal(DM1.cdsClaseAux,'CLAUXID',dblcClaseDet.Text,'CLAUXDES') ;

    if (dblcClaseDet.Text='') and (edtClaseDet.text<>'') then
    begin
       ShowMessage('Clase de Auxiliar no Existe');
       dblcdAuxDet.Text := '' ;
       dbeAuxDet.Text := '' ;
       dblcClaseDet.SetFocus;
    end ;

    dblcdAuxDet.Text := '' ;
    dbeAuxDet.Text := '' ;
    //CIM 23/11/2001
    sSQL:='Select * from CNT201 Where CLAUXID='''+dblcClaseDet.Text+'''';
    DM1.cdsAux.Close;
    DM1.cdsAux.DataRequest( sSQL );
    DM1.cdsAux.Open;
end;

procedure TFPagoProvVa.dblcdAuxEnter2(Sender: TObject);
begin
    if trim(dblcClaseDet.Text) = '' then
    begin
       dblcClaseDet.SetFocus ;
       exit ;
    end ;
end;

procedure TFPagoProvVa.dblcdAuxExit2(Sender: TObject);
begin
   if dblcClaseDet.Focused then Exit;
   if z2bbtnCancel3.Focused then exit;
   if dblcdCnp2.Focused     then exit;

   dbeAuxDet.text:= DM1.DisplayDescripLocal(DM1.cdsAux,'AUXID',dblcdAuxDet.Text,'AUXNOMB') ;

   if dbeAuxDet.Text='' then begin
      ShowMessage('Error : Auxiliar no Valido');
      dblcdAuxDet.SetFocus;
      Exit;
   end;
end;

procedure TFPagoProvVa.dblcdCnp2Exit2(Sender: TObject);
var
   ssql,xWhere : String;
begin
 //** 21/03/2001 - pjsv
  ssql := 'CPTOID='+quotedstr(dblcdCnp2.text);
  edtCnp2.Text := DM1.DisplayDEscrip('prvTGE','CAJA201','CPTODES, CUENTAID',ssql,'CPTODES');
  if Trim(edtCnp2.Text) = '' then
   begin
    DM1.cdsRegCxP.FieldByName('CUENTAID').AsString := '' ;
    dblcdAuxDet.Enabled := False ;
    dblcdCCosto.Enabled := False ;
   end
  else
   begin
     DM1.cdsRegCxP.FieldByName('CUENTAID').AsString := DM1.cdsQry.fieldbyName('CUENTAID').asString;
     //Busca y Habilita
     xWhere:='CIAID=''' + dblccia.Text + ''' AND CUENTAID=''' +  DM1.cdsRegCxP.FieldByName('CUENTAID').AsString + '''' ;
     if Length(DM1.DisplayDescrip('prvTGE','TGE202','CUENTAID, CTA_CCOS',xWhere,'CuentaId'))>0 then
     begin
         //** 20/12/2000 - pjsv
         if (DM1.cdsQry.fieldbyname('CTA_CCOS').Value='S') then
         begin
           ssql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
           DM1.cdsCCosto.Close;
           DM1.cdsCCosto.DataRequest(ssql);
           DM1.cdsCCosto.open;
           dblcdCCosto.Enabled:=true;
         end
         else
           dblcdCCosto.Enabled := False ;
        if DM1.DisplayDescrip('prvTGE','TGE202','CTA_AUX',xWhere,'CTA_AUX') = 'S'
        then dblcdAuxDet.Enabled := True
        else dblcdAuxDet.Enabled := False ;
     end
   end ;

   dblcClaseDet.Enabled :=  dblcdAuxDet.Enabled   ;
   if (trim(edtCnp2.Text) <> '') and (StrTmp <> dblcdCnp2.Text) then
    begin
     if not dblcdAuxDet.Enabled then
       begin
         DM1.cdsRegCxP.FieldByName('PROV').AsString    := '' ;
         DM1.cdsRegCxP.FieldByName('CLAUXID').AsString := '' ;
         edtClaseDet.Text  := '' ;
         dbeAuxDet.Text := '' ;
       end ;
      if not dblcdCCosto.Enabled then
        DM1.cdsRegCxP.FieldByName('CCOSID').AsString := '' ;
   end ;
   //**
end;

procedure TFPagoProvVa.wwDBEdit1Change22(Sender: TObject);
begin
    wmodifica:=True;
end;
procedure TFPagoProvVa.FormDestroy(Sender: TObject);
begin
   cf1.Free ;
end;

procedure TFPagoProvVa.dblcdFEfecEnter(Sender: TObject);
begin
   strTmp := dblcdFEfec.Text ;
end;

procedure TFPagoProvVa.dblcdFEfecExit(Sender: TObject);
begin
//Validacion
  if trim(TCustomEdit(Sender).Text) <> strTmp then
  begin
     if trim(TCustomEdit(Sender).Text) <> '' then
     begin
        if dm1.RecuperarDatos('TGE217','FLUEFEABR','FLUEFEID=''' + TCustomEdit(Sender).Text + ''' ') then
        begin
          dbeFEfec.Text := dm1.cdsRec.fieldbyname('FLUEFEABR').AsString ;
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

procedure TFPagoProvVa.ActDetCaja;
begin
   if not dm1.cdsRegCxP.Eof then
   begin   //Hay documentos en el detalle
      dm1.cdsRegCxP.DisableControls ;
      dm1.cdsRegCxP.First ;
      While not dm1.cdsRegCxP.Eof do
      Begin
        dm1.cdsRegCxP.Edit ;
        dm1.cdsRegCxP.FieldByName('DETCPAG').Value  := strtofloat(dbeTCambio.Text) ;
        if DM1.cdsRegCxP.FieldByName('TMONID').Value = dm1.wTMonLoc then
        begin
           DM1.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DM1.cdsRegCxP.FieldByName('DEMTOORI').Value ;
           DM1.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DM1.cdsRegCxP.FieldByName('DEMTOORI').Value / DM1.cdsEgrCaja.FieldByName('ECTCAMB').Value ;
        end
        else
        begin
           DM1.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DM1.cdsRegCxP.FieldByName('DEMTOORI').Value * DM1.cdsEgrCaja.FieldByName('ECTCAMB').Value ;
           DM1.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DM1.cdsRegCxP.FieldByName('DEMTOORI').Value ;
        end ;
        dm1.cdsRegCxP.Next;
      end ;
      dm1.cdsRegCxP.First ;
      dm1.cdsRegCxP.EnableControls ;
   end ;
   xTC := strtocurr( dbeTCambio.Text ) ;   
end;

procedure TFPagoProvVa.ActDetCxP ;
var
   evt1 : TFieldNotifyEvent ;
   evt2 : TFieldNotifyEvent ;
   evt3 : TFieldNotifyEvent ;
begin
   evt1 := dm1.cdsDocPago.FieldByName('DEMTOLOC').OnChange ;
   evt2 := dm1.cdsDocPago.FieldByName('DEMTOEXT').OnChange ;
   evt3 := dm1.cdsDocPago.FieldByName('DETCPAG').OnChange ;

   if not dm1.cdsDocPago.Eof then
   begin   //Hay documentos en el detalle
      dm1.cdsDocPago.DisableControls ;
      dm1.cdsDocPago.First ;
      While not dm1.cdsDocPago.Eof do
      Begin
        dm1.cdsDocPago.Edit ;
        dm1.cdsDocPago.FieldByName('DEMTOLOC').OnChange := nil ;
        dm1.cdsDocPago.FieldByName('DEMTOEXT').OnChange := nil ;
        dm1.cdsDocPago.FieldByName('DETCPAG').OnChange  := nil ;
         dm1.cdsDocPago.FieldByName('DETCPAG').Value  := StrToCurr(dbeTCambio.Text) ;
         with dm1 do
         begin
            if dblcTMon.Text = dm1.wtMonLoc then
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
        dm1.cdsDocPago.Next;
      end ;
      dm1.cdsDocPago.FieldByName('DEMTOLOC').OnChange := evt1 ;
      dm1.cdsDocPago.FieldByName('DEMTOEXT').OnChange := evt2 ;
      dm1.cdsDocPago.FieldByName('DETCPAG').OnChange  := evt3 ;

      dm1.cdsDocPago.First ;
      dm1.cdsDocPago.EnableControls ;
      xTC := strtocurr( dbeTCambio.Text ) ;
   end ;
end;

procedure TFPagoProvVa.ActualizaFiltro;
begin
    if z2bbtnNuevo.Visible then
    begin
       if not xGraboNuevo then
          cdsFiltro.Append ;
       dm1.ActualizaCDS(dm1.cdsEgrCaja,cdsFiltro) ;
    end
    else
    begin
       dm1.ActualizaCDS(dm1.cdsEgrCaja,cdsFiltro) ;
    end ;
    xGraboNuevo := True ;
end;

procedure TFPagoProvVa.AsignaCDSFiltro(cds: TwwClientDataset);
begin
    cdsFiltro := cds ;
end;

procedure TFPagoProvVa.ActualizaDetCanje;
begin
         // ABRIR DETALLE DE CANJE
         dm1.cdsDetCanjeCxP.close ;
         dm1.cdsDetCanjeCxP.DataRequest('SELECT * FROM CXP305 WHERE CIAID = ''''') ;
         DM1.cdsDetCanjeCxP.Open  ;

         DM1.cdsDocPago.DisableControls;
         DM1.cdsDocPago.First;

         While not DM1.cdsDocPago.Eof do
         begin
            DM1.cdsDetCanjeCxP.Insert;
            DM1.cdsDetCanjeCxP.FieldByName('CIAID').Value    := DM1.cdsDocPago.FieldByName('CIAID').Value   ;
            DM1.cdsDetCanjeCxP.FieldByName('PROV').Value     := DM1.cdsDocPago.FieldByName('PROV').Value    ;
            DM1.cdsDetCanjeCxP.FieldByName('PROVRUC').Value  := DM1.cdsDocPago.FieldByName('PROVRUC').Value ;
            DM1.cdsDetCanjeCxP.FieldByName('DOCID').Value    := DM1.cdsDocPago.FieldByName('DOCID2').value;
            DM1.cdsDetCanjeCxP.FieldByName('CPSERIE').Value  := DM1.cdsDocPago.FieldByName('CPSERIE').Value;
            DM1.cdsDetCanjeCxP.FieldByName('CPNODOC').Value  := DM1.cdsDocPago.FieldByName('CPNODOC').Value;
            DM1.cdsDetCanjeCxP.FieldByName('CPNOREG').Value  := DM1.cdsDocPago.FieldByName('CPNOREG').Value;
            DM1.cdsDetCanjeCxP.FieldByName('TCANJEID').Value := '' ;
            DM1.cdsDetCanjeCxP.FieldByName('CCPCANJE').Value := '' ;
            DM1.cdsDetCanjeCxP.FieldByName('CCPFCJE').AsDateTime  := dbdtpFComp.Date ;

            DM1.cdsDetCanjeCxP.FieldByName('TMONID').Value   := DM1.cdsDocPago.FieldByName('TMONID').Value;

            If DM1.cdsDocPago.FieldByName('TMONID').Value=DM1.wTMonLoc then
            begin
               DM1.cdsDetCanjeCxP.FieldByName('DCDMoLoc').Value := DM1.FRound(DM1.cdsDocPago.FieldByName('DEMtoLoc').Value,15,2);
               DM1.cdsDetCanjeCxP.FieldByName('DCDMoExt').Value := DM1.FRound(DM1.cdsDocPago.FieldByName('DEMtoLoc').Value/DM1.cdsDocPago.FieldByName('DETCDoc').Value,15,2);
               end
            else
            begin
               DM1.cdsDetCanjeCxP.FieldByName('DCDMoExt').Value := DM1.FRound(DM1.cdsDocPago.FieldByName('DEMTOEXT').Value,15,2);
               DM1.cdsDetCanjeCxP.FieldByName('DCDMoLoc').Value := DM1.FRound(DM1.cdsDocPago.FieldByName('DEMTOEXT').Value*DM1.cdsDocPago.FieldByName('DETCDoc').Value,15,2);
            end;

            DM1.cdsDetCanjeCxP.FieldByName('DCDUser').Value  := DM1.cdsDocPago.FieldByName('DEUser').Value;
            DM1.cdsDetCanjeCxP.FieldByName('DCDFReg').Value  := DM1.cdsDocPago.FieldByName('DEFReg').Value;
            DM1.cdsDetCanjeCxP.FieldByName('DCDHReg').Value  := DM1.cdsDocPago.FieldByName('DEHReg').Value;
            DM1.cdsDetCanjeCxP.FieldByName('DCDMM').Value    := DM1.cdsDocPago.FieldByName('DEMM').Value;
            DM1.cdsDetCanjeCxP.FieldByName('DCDDD').Value    := DM1.cdsDocPago.FieldByName('DEDD').Value;
            DM1.cdsDetCanjeCxP.FieldByName('DCDTri').Value   := DM1.cdsDocPago.FieldByName('DETri').Value;
            DM1.cdsDetCanjeCxP.FieldByName('DCDSem').Value   := DM1.cdsDocPago.FieldByName('DESem').Value;
            DM1.cdsDetCanjeCxP.FieldByName('DCDSS').Value    := DM1.cdsDocPago.FieldByName('DESS').Value;
            DM1.cdsDetCanjeCxP.FieldByName('DCDAATri').Value := DM1.cdsDocPago.FieldByName('DEAATri').Value;
            DM1.cdsDetCanjeCxP.FieldByName('DCDAASem').Value := DM1.cdsDocPago.FieldByName('DEAASem').Value;
            DM1.cdsDetCanjeCxP.FieldByName('DCDAASS').Value  := DM1.cdsDocPago.FieldByName('DEAASS').Value;

            DM1.cdsDocPago.Next;
         end;
         DM1.cdsDocPago.First ;
         DM1.cdsDocPago.EnableControls ;
         if DM1.cdsDetCanjeCxP.ApplyUpdates(0) >0 then
            Raise Exception.create ('Falla en la grabación del 305') ;
         DM1.cdsDetCanjeCxP.Close ;

end;

procedure TFPagoProvVa.Buscar1Click(Sender: TObject);
begin
  lkdCxP.LookupTable := dm1.cdsMovCxP ;
  lkdCxP.Execute ;
end;

procedure TFPagoProvVa.lkdCxPCloseDialog(Dialog: TwwLookupDlg);
begin
   lkdCxP.LookupTable := nil ;
end;

procedure TFPagoProvVa.lkdCxPInitDialog(Dialog: TwwLookupDlg);
begin
    Dialog.wwDBGrid1.TitleLines := 2 ;
    Dialog.wwDBGrid1.Selected.clear ;
    Dialog.wwDBGrid1.Selected.Assign( dbgPendientes.Selected ) ;
end;




procedure TFPagoProvVa.dbeTCExit(Sender: TObject);
begin
   if DM1.cdsDocPago.fieldbyName('TMONID').asString = DM1.wtMonLoc then
   begin
      DM1.cdsDocPago.fieldbyName('DESALEXT').asFloat:=dm1.FRound( DM1.cdsDocPago.fieldbyName('DESALLOC').asFloat / DM1.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
      DM1.cdsDocPago.fieldbyName('DEMTOEXT').asFloat:=dm1.FRound( DM1.cdsDocPago.fieldbyName('DEMTOLOC').asFloat / DM1.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
   end
   else
   begin
      DM1.cdsDocPago.fieldbyName('DESALLOC').asFloat:=dm1.FRound( DM1.cdsDocPago.fieldbyName('DESALEXT').asFloat * DM1.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2) ;
      DM1.cdsDocPago.fieldbyName('DEMTOLOC').asFloat:=dm1.FRound( DM1.cdsDocPago.fieldbyName('DEMTOEXT').asFloat * DM1.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2) ;
   end ;
end;

procedure TFPagoProvVa.dbeMPLExit(Sender: TObject);
var
   xSaldo,xMonto : double ;
begin
   DM1.cdsDocPago.Edit ;

   if DM1.cdsdocpago.FieldByName('TMONID').AsString = DM1.wTMonExt then
   begin
      xMonto := dm1.FRound( DM1.cdsDocPago.fieldbyName('DEMTOLOC').asFloat / DM1.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
      xSaldo := DM1.cdsDocPago.fieldbyName('DESALEXT').asFloat ;                                ;
   end
   else
   begin
      xMonto := DM1.cdsDocPago.fieldbyName('DEMTOLOC').asFloat                                ;
      xSaldo := DM1.cdsDocPago.fieldbyName('DESALLOC').asFloat                                ;
   end ;

   if DM1.FRoundwmc(xMonto ) > DM1.FRoundwmc ( xSaldo ) then
   begin
      ShowMessage('Monto excede a Saldo Actual');
      DM1.cdsDocPago.fieldbyName('DEMTOLOC').asFloat :=0;
   end
   else
   begin
      DM1.cdsDocPago.fieldbyName('DEMTOEXT').asFloat:=dm1.FRound( DM1.cdsDocPago.fieldbyName('DEMTOLOC').asFloat / DM1.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2);
   end;
end;

procedure TFPagoProvVa.dbeMPEExit(Sender: TObject);
var
   xMonto, xSaldo : double ;
begin
   DM1.cdsDocPago.Edit;
   if DM1.cdsdocpago.FieldByName('TMONID').AsString = DM1.wTMonLoc then
   begin
      xMonto := dm1.FRound( DM1.cdsDocPago.FieldByName('DEMTOEXT').asFloat * DM1.cdsDocPago.fieldbyName('DETCPAG').asFloat, 15, 2) ;
      xSaldo := DM1.cdsDocPago.FieldByName('DESALLOC').asFloat ;
   end
   else begin
      xMonto := DM1.cdsDocPago.FieldByName('DEMTOEXT').asFloat ;
      xSaldo := DM1.cdsDocPago.FieldByName('DESALEXT').asFloat ;
   end ;

   if DM1.FRoundwmc(xMonto ) > DM1.FRoundwmc ( xSaldo ) then
   begin
      ShowMessage('Monto excede a Saldo Actual');
      DM1.cdsDocPago.Edit;
      DM1.cdsDocPago.FieldByName('DEMTOEXT').asFloat := 0 ;
   end
   else begin
      DM1.cdsDocPago.FieldByName('DEMTOLOC').asFloat:=dm1.FRound( DM1.cdsDocPago.FieldByName('DEMTOEXT').asFloat * DM1.cdsDocPago.FieldByName('DETCPAG').asFloat, 15, 2);
   end;
end;

end.

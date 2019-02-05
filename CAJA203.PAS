unit Caja203;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient,
  ComCtrls, Tabnotbk,CAJADM;

type
  TFPagoProv = class(TForm)
    pnlCabecera1: TPanel;
    lblCia: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    pnlCabecera2: TPanel;
    lblTMon: TLabel;
    lblTCambio: TLabel;
    lblProv: TLabel;
    lblProvRuc: TLabel;
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
    edtCCBco: TEdit;
    pnlDetalle: TPanel;
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
    lblClase: TLabel;
    dbeClase1: TwwDBEdit;
    dblcTDoc: TwwDBLookupCombo;
    lblTDoc: TLabel;
    edtTDoc: TEdit;
    edtClase2: TEdit;
    dbeNoDoc: TwwDBEdit;
    lblNoDoc: TLabel;
    lblCuenta: TLabel;
    edtCuenta: TEdit;
    lblEstado: TLabel;
    z2bbtnAnula: TBitBtn;
    z2bbtnCalc: TBitBtn;
    lblOPago: TLabel;
    dbdtpFPago: TwwDBDateTimePicker;
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
    Label18: TLabel;
    Label15: TLabel;
    Label2: TLabel;
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
    TabbedNotebook1: TTabbedNotebook;
    Label17: TLabel;
    dbgDocCanje: TwwDBGrid;
    dbgOtros: TwwDBGrid;
    dbgOtrosIButton: TwwIButton;
    Label16: TLabel;
    dbeTCamDoc: TwwDBEdit;
    Label19: TLabel;
    dbeDH: TwwDBEdit;
    z2bbtnOKCab: TBitBtn;
    dblcdCnp: TwwDBLookupComboDlg;
    dblcOPago: TwwDBLookupCombo;
    dbeProv: TwwDBEdit;
    dbeProvRUC: TwwDBEdit;
    dblcdCCosto: TwwDBLookupComboDlg;
    Z2bbtnEmiChq: TBitBtn;
    dbdtpFEmis: TwwDBDateTimePicker;
    Label24: TLabel;
    Label6: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    dblcdCnp2: TwwDBLookupComboDlg;
    edtCnp2: TEdit;
    dblcClaseDet: TwwDBLookupCombo;
    edtClaseDet: TEdit;
    dblcdAuxDet: TwwDBLookupComboDlg;
    dbeAuxDet: TwwDBEdit;
    Label5: TLabel;
    Label4: TLabel;
    dblcTDoc2: TwwDBLookupCombo;
    dblcTDiario2: TwwDBLookupCombo;
    edtTDoc2: TEdit;
    edtTDiario2: TEdit;
    Label1: TLabel;
    dblcdFEfec: TwwDBLookupComboDlg;
    dbeFEfec: TwwDBEdit;

    procedure FormActivate(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure z2bbtnCancelClick(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure z2bbtnCalcClick(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure z2bbtnSumatCanjeClick(Sender: TObject);
    procedure z2bbtnSubeClick(Sender: TObject);
    procedure z2bbtnCancel2Click(Sender: TObject);
    procedure z2bbtnNuevoClick(Sender: TObject);
    procedure z2bbtnGrabaClick(Sender: TObject);
    procedure z2bbtnCanceladoClick(Sender: TObject);
    procedure z2bbtnContClick(Sender: TObject);
    procedure z2bbtnAnulaClick(Sender: TObject);
//    procedure dbeOPagoExit(Sender: TObject);
    procedure dbgOtrosIButtonClick(Sender: TObject);
    procedure dbgOtrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeNoRegExit(Sender: TObject);
    procedure dblcTMon2Change(Sender: TObject);
    procedure dblcTMon2Exit(Sender: TObject);
    procedure dbeImporte2Exit(Sender: TObject);
    procedure dbdtpFComp2Exit(Sender: TObject);
    procedure z2bbtnOK2Click(Sender: TObject);
    procedure z2bbtnCancel3Click(Sender: TObject);
    procedure z2bbtnSumatClick(Sender: TObject);
    procedure dbgOtrosCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbgDocCanjeCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbeDHChange(Sender: TObject);
    procedure dbeLoteExit(Sender: TObject);
    procedure dbeImporteChange(Sender: TObject);
    procedure dbeNoDocChange(Sender: TObject);
    procedure dbeLoteChange(Sender: TObject);
    procedure dbeGlosaChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure dbgDocCanjeCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure FormShow(Sender: TObject);
    procedure dblcOPagoChange(Sender: TObject);
    procedure dblcOPagoExit(Sender: TObject);
    procedure dbgOtrosCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure dblcdCnpChange(Sender: TObject);
    procedure dblcdCnpExit(Sender: TObject);
    procedure dbgOtrosDblClick(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Z2bbtnEmiChqClick(Sender: TObject);
    procedure dbeImporteEnter(Sender: TObject);
    procedure dbeImporteExit(Sender: TObject);
    procedure dblcClaseDetChange(Sender: TObject);
    procedure dblcClaseDetEnter(Sender: TObject);
    procedure dblcClaseDetExit(Sender: TObject);
    procedure dblcdAuxChange2(Sender: TObject);
    procedure dblcdAuxEnter2(Sender: TObject);
    procedure dblcdAuxExit2(Sender: TObject);
    procedure dblcdCnp2Exit2(Sender: TObject);
    procedure wwDBEdit1Change22(Sender: TObject);
    procedure dblcTDiario2Change2(Sender: TObject);
    procedure dblcTDiario2Exit2(Sender: TObject);
    procedure dblcTDiario2NotInList2(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure dblcTDoc2Change2(Sender: TObject);
    procedure dblcTDoc2Enter(Sender: TObject);
    procedure dblcTDoc2Exit2(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblcdFEfecEnter(Sender: TObject);
    procedure dblcdFEfecExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dbeClase1Exit(Sender: TObject);

  private
    { Private declarations }
    cf1: TControlFoco;
    cdsOPagoElegibles: TClientDataSet;
    cdsTDiarioDet : TwwClientDataset ;    
    ctrl: TCustomEdit;
    evt_Exit: TNotifyEvent;
    A1 : Array of Integer ;
    A2 : Array Of TNotifyEvent ;
    A2digitos ,A4digitos : Array of TWinControl ;
    strTmp: string;
    xGraboNuevo: Boolean ;    
    //
    wCptoGan  ,
    wCptoPer  ,
    wCtaGan   ,
    wCtaPer   : String ;
    cdsFiltro: TwwClientDataset;
    //
    procedure ActPnlBotones;
    procedure IniciaPanel;
    procedure Contab_EgrCaja;
    procedure Contab_RegCxP;
    procedure Contab_CanjeCxP;
    procedure Contab_DifCamRegCxP;
    procedure Contab_DifCamCanje;
    function  ValidaCampo:Boolean;
    procedure ConsisCancela(var xconsis:Boolean);

    procedure ActualizaSaldos;    
    procedure InhabilitarPaneles;
    procedure EdiTarRegistros;
    procedure AdicionarRegistros;
    procedure LiberarFiltrosRegistroEgresos;
    procedure EstablecerFiltrosRegistroEgresos;
    procedure PosicionarOrdenPago;
    procedure NoPosicionarOrdenPago;
    Function ValidacionCabecera:Boolean;
    procedure ValidacionCabecera2 ;
    procedure RecuperaDescrip;
    procedure RecuperaDescripOPago;
    procedure AdicIniciaDatos;
    procedure IniciaDatos;
    procedure ActualizaSaldosCaja ;
    procedure ConfiguraAccesos;
    procedure Contabiliza;
    procedure Proc_Admin;
    procedure Proc_Consul;
    procedure Libera_Admin;
    procedure Libera_Consul;
    procedure LibConfigAccesos;
    procedure RecCptosDifC ;
    procedure ActualizaFiltro ;        
		procedure DescripPagoProv(const xCIAID, xECANOMM, xTDIARID, xECNOCOMP: String);
  public
    { Public declarations }
    procedure Adiciona ;
    procedure Edita (Comp : structComprobante;cds : Twwclientdataset);
    procedure AsignaCDSFiltro(cds : TwwClientDataset) ;    

  end;
var
  FPagoProv: TFPagoProv;
  wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,wbChq ,
  wbcancel2: Boolean;
  wmodifica: Boolean;

implementation
uses CAJAUTIL, Caja001, Caja290;
{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}

procedure TFPagoProv.FormActivate(Sender: TObject);
var
 xsql : string;
begin
  //** 05/04/2001 - pjsv
  xsql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
  DM1.cdsCCosto.Close;
  DM1.cdsCCosto.DataRequest(xsql);
  DM1.cdsCCosto.open;
  //**
end;

procedure TFPagoProv.IniciaDatos;
var
   xSQL :String ;
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
   edtCia.Text       := '';   // Descripción de la Compañía
   dbdtpFComp.Date   := date; // Fecha de Comprob.
   edtPeriodo.Text   := '';   // Periodo
   dblcTDiario.Text  := '';   // Tipo de Diario
   edtTDiario.Text   := '';   // Descripción del T.Diario
   dbeNoComp.Text    := '';   // Voucher
//   dbeOPago.Text     := '';   // Orden Pago
   dblcOPago.Text     := '';   // Orden Pago
   dbeClase1.Text    := '';
//   edtProv.Text    := '';    // Código de Proveedor
   dbeProv.Text    := '';    // Código de Proveedor
//   edtProvRuc.Text := '';    // RUC del Proveedor
   dbeProvRuc.Text := '';    // RUC del Proveedor
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
   lblEstado.Caption := '';   //Inicializar el Estado
      dbeFEfec.Text     := '' ;
   dbdtpFEmis.Date := 0 ;
   wmodifica         := False;

   dbgOtros.ColumnByName('DEMTOLOC').FooterValue:='';
   dbgOtros.ColumnByName('DEMTOEXT').FooterValue:='';

   dbgDocCanje.ColumnByName('CPSalLoc').FooterValue:='';
   dbgDocCanje.ColumnByName('CPSalExt').FooterValue:='';
   dbgDocCanje.ColumnByName('CCPMoLoc').FooterValue:='';
   dbgDocCanje.ColumnByName('CCPMoExt').FooterValue:='';

   // Limpiando filtros si lo tuvieran
   DM1.cdsEgrCaja.Filtered  :=False;
   DM1.cdsRegCxP.Filtered :=False;
   DM1.cdsCntCaja.Filtered  :=False;
   DM1.cdsMovCxP.Filtered :=False;

   // Estableciendo el filtro para que el detalle del grid aparezca vacio
{3004
   DM1.cdsRegCxP.Filter:='';
   DM1.cdsRegCxP.Filter:='CiaID='+''''+''+'''';
   DM1.cdsRegCxP.Filtered:=True;
}
   // Ordenes de Pago
   DM1.cdsPagoCxP.Filter:='';
   DM1.cdsPagoCxP.Filter:='CiaId='+''''+''+'''';
   DM1.cdsPagoCxP.Filtered:=True;

// Documentos Pendientes
   DM1.cdsMovCxP.Filter:='';
   DM1.cdsMovCxP.Filter:='CiaId='+''''+''+'''';
   DM1.cdsMovCxP.Filtered:=True;

// ubica en primer dato a pedir
//   dblcCia.SetFocus;
{
   RecuperarCiaUnica(dblcCia,edtCia);
   edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
   if dblccia.text <> '' then
      perform(CM_DialogKey,VK_TAB,0);
}

   z2bbtnOKCab.Enabled := True ;
//apuntre de william manrique cautin
//establecimiento del filtro para las ordenes de pago disponibles
//0505
   xSQL := ' SELECT * FROM CXP303     '
          + '   WHERE CIAID = '''+dblcCia.text + ''' AND '
          + '     OPESTADO=''I'' '
          + '   ORDER BY OPAGO   ' ;
   DM1.cdsQry2.Active := False ;
   DM1.cdsQry2.DataRequest(xSQL) ;
   DM1.cdsQry2.Active := True ;
   cdsOPagoElegibles.CloneCursor(dm1.cdsQry2 , False);
//
end;

{*******************************************************
PRIMER PANEL - DATOS INICIALES DE LA CABECERA
*******************************************************}

procedure TFPagoProv.dblcCiaExit(Sender: TObject);
var xWhere:string;
begin
   if not dblccia.Enabled then
      exit;
   xWhere:='CIAID='+''''+dblcCia.Text+'''';
   edtCia.Text:=DM1.DisplayDescrip('prvTGE','TGE101','CIADES',xWhere,'CiaDes');
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Codigo de Compañia Errado');
      dblcCia.SetFocus;
   end
   else
      dbdtpFComp.SetFocus;
end;

procedure TFPagoProv.dbdtpFCompExit(Sender: TObject);
begin
   if dbdtpFComp.Date=0 then
   begin
      ShowMessage('Fecha de Comprobante Errada');
      dbdtpFComp.SetFocus;
   end
   else begin
      edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
      dblcTDiario.SetFocus;
   end;
end;

procedure TFPagoProv.dblcTDiarioExit(Sender: TObject);
var xWhere:string;
begin
   xWhere:='TDIARID='+''''+dblcTDiario.Text+'''';
   edtTDiario.Text:=DM1.DisplayDescrip('prvTGE','TGE104','TDIARABR',xWhere,'TDIARABR');
   if length(edtTDiario.Text)=0 then
   begin
      ShowMessage('Tipo de Diario Errado');
      dblcTDiario.SetFocus;
   end
   else begin
      xWhere:='CIAID='+''''+dblcCia.Text+''''+' AND ECANOMM='+
             ''''+edtPeriodo.Text+''''+' AND TDIARID='+''''+
             dblcTDiario.Text+'''';
      dbeNoComp.text:=DM1.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      dbeNoComp.SetFocus;
   end;
end;

procedure TFPagoProv.dbeNoCompExit(Sender: TObject);
begin
   dbeNoComp.text:=DM1.StrZero(dbeNoComp.text,DM1.cdsEgrCaja.Fieldbyname('ECNOCOMP').DisplayWidth);
end;

{*******************************************************
SEGUNDO PANEL - DATOS ADICIONALES DE LA CABECERA
*******************************************************}

procedure TFPagoProv.dbeClase1Exit(Sender: TObject);
//var xWhere:string;
begin
{
   xWhere:='CLAUXID='+''''+dbeClase1.Text+'''';
   edtClase2.Text    :=DM1.DisplayDescrip('prvTGE','TGE102','CLAUXDES',xWhere,'CLAUXDES');
}
end;

procedure TFPagoProv.dblcTDocExit(Sender: TObject);
var xWhere:string;
begin
   if z2bbtnCancel.Focused then
      exit;
   xWhere:='DOCID='+''''+dblcTDoc.Text+'''';
   edtTDoc.Text:=DM1.DisplayDescrip('prvTGE','TGE110','DOCDES',xWhere,'DOCDES');
   if length(edtTDoc.Text)=0 then
      dblcTDoc.Text:='';
   wmodifica:=True;
end;

procedure TFPagoProv.dblcBancoExit(Sender: TObject);
var xWhere:string;
begin
   xWhere:='BANCOID='+''''+dblcBanco.Text+'''';
   edtBanco.Text:=DM1.DisplayDescrip('prvTGE','TGE105','BANCONOM',xWhere,'BANCONOM');

   if length(edtBanco.Text)>0 then begin
       if DM1.cdsqry.FieldByName('BcoTipCta').Value='C' then  //Si es CAJA
          edtCuenta.Text:=DM1.cdsqry.FieldByName('CuentaID').Value //Se toma de la tabla Bancos
       else  //Si es BANCO
          edtCuenta.Text   :='';     //La Cuenta se tomara posteriormente por medio de la CtaCte
   end;
end;


procedure TFPagoProv.z2bbtnOKClick(Sender: TObject);
Var xWhere,aux:string;
begin
    // consistencia de Datos
   ValidacionCabecera2;

    // Actualizamos el Client Data Set de Egr.Caja (CAJA302)
   with DM1 do begin
     cdsEgrCaja.Edit;
     cdsEgrCaja.Fieldbyname('CIAID').Value   :=dblcCia.Text;
     cdsEgrCaja.Fieldbyname('TDIARID').Value :=dblcTDiario.Text;
     cdsEgrCaja.Fieldbyname('ECANOMM').Value :=edtPeriodo.Text;
     cdsEgrCaja.Fieldbyname('ECNOCOMP').Value:=dbeNoComp.Text;
     cdsEgrCaja.Fieldbyname('ECOPAGO').Value:= dblcOPago.Text;
     cdsEgrCaja.Fieldbyname('CLAUXID').Value :=dbeClase1.Text;
     cdsEgrCaja.Fieldbyname('PROV').Value    :=dbeProv.Text;
     cdsEgrCaja.Fieldbyname('PROVRUC').Value :=dbeProvRuc.Text;
     cdsEgrCaja.Fieldbyname('ECFCOMP').Value :=dbdtpFComp.Date;
     //cdsEgrCajaECEMICH.Value:=;
     cdsEgrCaja.Fieldbyname('ECFPAGOP').AsDateTime := dbdtpFPago.Date;
     //cdsEgrCajaECFCOBCH.Value:=;
     cdsEgrCaja.Fieldbyname('FPAGOID').Value :=dblcFormPago.Text;
     //Grabación del equivalente  123666
     cdsEgrCaja.Fieldbyname('EQUIID').AsString := EquivFPago( dblcFormPago.Text ,dblcBanco.Text) ;
     //fin de grabacion del equivalente
     cdsEgrCaja.Fieldbyname('DOCID').Value   :=dblcTDoc.Text;
     cdsEgrCaja.Fieldbyname('ECNODOC').Value :=dbeNoDoc.Text;
     cdsEgrCaja.Fieldbyname('TMONID').Value  :=dblcTMon.Text;
     cdsEgrCaja.Fieldbyname('ECTCAMB').Value :=strtofloat(dbeTCambio.Text);
     cdsEgrCaja.Fieldbyname('ECMTOORI').Value:=strtofloat(dbeImporte.Text);
     //0105
     cdsEgrCaja.fieldBYName('ECFEMICH').AsDateTime := dbdtpFEmis.Date ;
     //

     if cdsEgrCaja.Fieldbyname('TMONID').Value=wTMonLoc then
     begin
        cdsEgrCaja.Fieldbyname('ECMTOLOC').Value:=strtofloat(dbeImporte.Text);
        cdsEgrCaja.Fieldbyname('ECMTOEXT').Value:=strtofloat(dbeImporte.Text)/strtofloat(dbeTCambio.Text);
     end
     else
     begin
        cdsEgrCaja.Fieldbyname('ECMTOLOC').Value:=strtofloat(dbeImporte.Text)*strtofloat(dbeTCambio.Text);
        cdsEgrCaja.Fieldbyname('ECMTOEXT').Value:=strtofloat(dbeImporte.Text);
     end;
     cdsEgrCaja.Fieldbyname('BANCOID').Value :=dblcBanco.Text;
     cdsEgrCaja.Fieldbyname('CCBCOID').Value :=dblcCCBco.Text;
     cdsEgrCaja.Fieldbyname('ECNOCHQ').Value :=dbeNoChq.Text;
     cdsEgrCaja.Fieldbyname('ECGIRA').Value  :=dbeGiradoA.Text;
     cdsEgrCaja.Fieldbyname('CPTOID').Value  :=dblcdCnp.Text;
     cdsEgrCaja.Fieldbyname('CUENTAID').Value:=edtCuenta.Text;
     cdsEgrCaja.Fieldbyname('ECGLOSA').Value :=dbeGlosa.Text;
     cdsEgrCaja.Fieldbyname('ECLOTE').Value  :=dbeLote.Text;
     cdsEgrCaja.Fieldbyname('ECESTADO').Value :='I';


     xWhere:='FECHA=' +DM1.wRepFuncDate + '''' + formatdatetime(DM1.wFormatFecha,dbdtpFComp.date)+''')' ;
     aux   :=DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
     //wmc2808
     if trim(dblcdFEfec.Text) = '' then
        cdsEgrCaja.fieldbyname('FLUEID').Clear
     else
        cdsEgrCaja.fieldbyname('FLUEID').AsString := trim(dblcdFEfec.Text) ;
     //
     cdsEgrCaja.Fieldbyname('ECANO').Value  := cdsqry.FieldByName('FecAno').Value;
     cdsEgrCaja.Fieldbyname('ECMM').Value   := cdsqry.FieldByName('FecMes').Value;
     cdsEgrCaja.Fieldbyname('ECDD').Value   := cdsqry.FieldByName('FecDia').Value;
     cdsEgrCaja.Fieldbyname('ECSS').Value   := cdsqry.FieldByName('FecSS').Value;
     cdsEgrCaja.Fieldbyname('ECSEM').Value  := cdsqry.FieldByName('FecSem').Value;
     cdsEgrCaja.Fieldbyname('ECTRI').Value  := cdsqry.FieldByName('FecTrim').Value;
     cdsEgrCaja.Fieldbyname('ECAASS').Value := cdsqry.FieldByName('FecAASS').Value;
     cdsEgrCaja.Fieldbyname('ECAASem').Value:= cdsqry.FieldByName('FecAASem').Value;
     cdsEgrCaja.Fieldbyname('ECAATri').Value:= cdsqry.FieldByName('FecAATri').Value;
     cdsEgrCaja.Fieldbyname('EC_PROCE').Value:='2';
     cdsEgrCaja.Fieldbyname('EC_IE').Value   :='E';
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
        dm1.cdsRegCxPDETCPAG.Value  := strtofloat(dbeTCambio.Text);
        if DM1.cdsRegCxPTMONID.Value = dm1.wTMonLoc then
        begin
           DM1.cdsRegCxPDEMTOLOC.Value:=DM1.cdsRegCxPDEMTOORI.Value;
           DM1.cdsRegCxPDEMTOEXT.Value:=DM1.cdsRegCxPDEMTOORI.Value/DM1.cdsEgrCaja.Fieldbyname('ECTCAMB').Value;
        end
        else
        begin
           DM1.cdsRegCxPDEMTOLOC.Value:=DM1.cdsRegCxPDEMtoOri.Value*DM1.cdsEgrCaja.Fieldbyname('ECTCAMB').Value;
           DM1.cdsRegCxPDEMTOEXT.Value:=DM1.cdsRegCxPDEMtoOri.Value;
        end;
        dm1.cdsRegCxP.Next;
      end;
      dm1.cdsRegCxP.First ;
      dm1.cdsRegCxP.EnableControls;
   end;
   //Actualizamos el Footer
   z2bbtnSumatClick(sender);


   // Estado de los componentes
   pnlCabecera1.enabled  := False;
   pnlCabecera2.enabled  := False;
   pnlDetalle.enabled    := True;
   pnlBotones.Enabled    := True;
   ActPnlBotones;
   // Estado de los botones
   z2bbtnOk.Enabled        := False;
   z2bbtnCancel.Enabled    := False;
end;

procedure TFPagoProv.z2bbtnCancelClick(Sender: TObject);
begin
   DM1.cdsEgrCaja.CancelUpdates;
   DM1.cdsRegCxP.CancelUpdates;
   DM1.cdsPagoCxP.CancelUpdates;
{0505
   IniciaDatos;
   z2bbtnokcab.Enabled:=true;
}
   adiciona ;
   AdicIniCiaDatos ;

end;

procedure TFPagoProv.z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('C:\windows\calc.exe',1);  //Activa la calculadora del Windows
end;

{*******************************************************
CUARTO PANEL - BOTONES
*******************************************************}
procedure TFPagoProv.z2bbtnSumatCanjeClick(Sender: TObject);
var
   xTSalLoc, xTSalExt, xTPagLoc, xTPagExt : Real;
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
         xTSalLoc := xTSalLoc + cdsCanjeCxPCPSalLoc.Value;
         xTSalExt := xTSalExt + cdsCanjeCxPCPSalExt.Value;
         xTPagLoc := xTPagLoc + cdsCanjeCxPCCPMoLoc.Value;
         xTPagExt := xTPagExt + cdsCanjeCxPCCPMoExt.Value;
         cdsCanjeCxP.Next;
      end;
      dbgDocCanje.ColumnByName('CPSalLoc').FooterValue:=floattostrf(xTSalLoc, ffNumber, 10, 2);
      dbgDocCanje.ColumnByName('CPSalExt').FooterValue:=floattostrf(xTSalExt, ffNumber, 10, 2);
      dbgDocCanje.ColumnByName('CCPMoLoc').FooterValue:=floattostrf(xTPagLoc, ffNumber, 10, 2);
      dbgDocCanje.ColumnByName('CCPMoExt').FooterValue:=floattostrf(xTPagExt, ffNumber, 10, 2);
      cdsCanjeCxP.GotoBookmark(xRegAct);
      cdsCanjeCxP.FreeBookmark(xRegAct);
      cdsCanjeCxP.EnableControls;
   end;
end;

procedure TFPagoProv.z2bbtnSubeClick(Sender: TObject);
begin
   DM1.cdsEgrCaja.Edit;
   DM1.cdsRegCxP.Edit;

   pnlCabecera2.Enabled:= True;
   pnlDetalle.Enabled  := False;
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

procedure TFPagoProv.z2bbtnCancel2Click(Sender: TObject);
begin
   if MessageDlg('¿Anular los cambios?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin
      DM1.cdsEgrCaja.CancelUpdates  ;
      DM1.cdsRegCxP.CancelUpdates   ;
      DM1.cdsPagoCxP.CancelUpdates  ;
      DM1.cdsCanjeCxP.CancelUpdates ;
      IniciaDatos                   ;
   end;
end;

procedure TFPagoProv.z2bbtnNuevoClick(Sender: TObject);
begin
   if DM1.cdsEgrCaja.Fieldbyname('ECEstado').Value ='I' then
   begin
      if wmodifica then
      begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      end;
      if MessageDlg('¿Nuevo Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin
//0805         IniciaDatos;
         Adiciona ;
         AdicIniciadatos ;
      end;
   end
   else
   begin
//0805      IniciaDatos;
      Adiciona ;
      AdicIniciadatos ;
   end;
end;

procedure TFPagoProv.z2bbtnGrabaClick(Sender: TObject);
begin
   if DM1.cdsEgrCaja.Fieldbyname('ECEstado').Value='I' then
   begin
      if MessageDlg('¿Grabar?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
      begin
         DM1.cdsPagoCxP.Edit;
         DM1.cdsPagoCxPOPESTADO.Value:='P';  //Lo marco como Pendiente

         DM1.cdsEgrCaja.ApplyUpdates(0);
         dm1.cdsEgrCaja.refresh ;
         DM1.cdsRegCxP.ApplyUpdates(0);
         DM1.cdsRegCxP.Refresh ;
         DM1.cdsPagoCxP.ApplyUpdates(0);
         DM1.cdsPagoCxP.Refresh ;
         ActualizaFiltro ;

         z2bbtnNuevo.Enabled    := True;
         z2bbtnCancelado.Enabled:= True;
         z2bbtnAnula.Enabled    := True;
         z2bbtnImprime.Enabled  := True;
         Z2bbtnEmiChq.Enabled   := True ; 
         wmodifica:=False;

         z2bbtnSumatClick(sender);
         ShowMessage('Grabacion OK');
      end
   end
   else
   begin
       ShowMessage('Imposible Grabar');
   end;
end;

procedure TFPagoProv.ActualizaSaldos;
{ mucho ojo :
  wmc fijate como recuperar los datos del cdsMovCxP
}
var
   xWhere : String ;
   xSQL : String ;
begin
         DM1.cdsMovCxP.Filtered:=False;
//0805       FILTRAR MOVIMIENTOS
///////////////////////////////////////////////////////////////////
{
         xWhere := ' CIAID||CPANOMES||TDIARID||CPNOREG IN ' +
                   '                   ( SELECT CIAID||CCPANOMM||TDIARID||CPNOREG         ' +
                   '                     FROM CXP304                                      ' +
                   '                     WHERE CIAID = '''+ dblcCia.Text + '''            ' +
                   '                           AND TCANJEID = ''OP''                      ' +
                   '                           AND CCPCANJE = '''+ dblcOPago.Text + ''' ) ' ;
         DM1.cdsMovCxP.active := False ;
         DM1.cdsMovCxP.CommandText := 'SELECT * FROM CXP301 WHERE ' + xWhere ;
         DM1.cdsMovCxP.Active := True ;
}
///////////////////////////////////////////////////////////////////
//****************************ini
{
       //QUITAFLAG
       DM1.SetFlagPagoProv('', '', '0') ;
       //PONFLAG
       DM1.SetFlagPagoProv(dblcCia.Text,dblcOPago.Text, '1') ;
       DM1.cdsMovCxP.active := False ;
       xWhere := 'FLAGVAR2 = ''X'' ' ;
}
       DM1.cdsMovCxP.active := False ;
//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      xWhere := ' CIAID||CPANOMES||TDIARID||CPNOREG IN                                 ' +
                '                   ( SELECT CIAID||CCPANOMM||TDIARID||CPNOREG         ' +
                '                     FROM CXP304                                      ' +
                '                     WHERE CIAID = '''+ dblccia.Text + '''            ' +
                '                           AND TCANJEID = ''OP''                      ' +
                '                           AND CCPCANJE = '''+ dblcOPago.Text + ''' ) ' ;

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
//wmc1809       DM1.cdsMovCxP.CommandText := 'SELECT * FROM CXP301 WHERE ' + xWhere ;
       DM1.cdsMovCxP.DataRequest('SELECT * FROM CXP301 WHERE ' + xWhere ) ;
       DM1.cdsMovCxP.Active := True ;
//****************************fin
//       FIN DE FILTRADO
         DM1.cdsCanjeCxP.DisableControls;
         DM1.cdsCanjeCxP.First;
         While not DM1.cdsCanjeCxP.Eof do
         Begin
{0805wmc
            DM1.cdsMovCxP.Setkey;
            DM1.cdsMovCxPCiaID.Value    := DM1.cdsCanjeCxPCiaID.Value;
            DM1.cdsMovCxPTDiarID.Value  := DM1.cdsCanjeCxPTDiarID.Value;
            DM1.cdsMovCxPCPAnoMes.Value := DM1.cdsCanjeCxPCCPAnoMM.Value;
            DM1.cdsMovCxPCPNoReg.Value  := DM1.cdsCanjeCxPCPNoReg.Value;
            if DM1.cdsMovCxP.GotoKey then
}
           if DM1.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                                   VarArrayOf([DM1.cdsCanjeCxPCiaId.AsString,
                                               DM1.cdsCanjeCxPTDiarID.AsString,
                                               DM1.cdsCanjeCxPCCPAnoMM.AsString,
                                               DM1.cdsCanjeCxPCPNoReg.AsString]),
                                   []) then
           begin
               DM1.cdsMovCxP.edit;
               If DM1.cdsMovCxPTMonID.Value = DM1.wTMonLoc then
               begin
                  DM1.cdsMovCxPCPPagLoc.Value := DM1.FRound(DM1.cdsMovCxPCPPagLoc.Value + DM1.cdsCanjeCxPCCPMoLoc.Value,15,2) ;
                  DM1.cdsMovCxPCPPagExt.Value := DM1.FRound(DM1.cdsMovCxPCPPagLoc.Value/DM1.cdsCanjeCxPCCPTCCje.Value,15,2)   ;
                  If DM1.cdsMovCxPCPSalLoc.Value <= 0 then
                     DM1.cdsMovCxPCPEstado.Value := 'C';
               end
               else
               begin
                  DM1.cdsMovCxPCPPagExt.Value := DM1.FRound(DM1.cdsMovCxPCPPagExt.Value + DM1.cdsCanjeCxPCCPMoExt.Value,15,2) ;
                  DM1.cdsMovCxPCPPagLoc.Value := DM1.FRound(DM1.cdsMovCxPCPPagExt.Value * DM1.cdsCanjeCxPCCPTCCje.Value,15,2) ;
                  If DM1.cdsMovCxPCPSalExt.Value<=0 then
                     DM1.cdsMovCxPCPEstado.Value:='C';
               end;
               DM1.cdsMovCxPCPTCamPa.Value:=DM1.FRound(DM1.cdsCanjeCxPCCPTCCje.Value,15,2);
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
         //0505 Recuperación de datos de la nota de cobranza

         // vhn 23/01/2001
         xSQL:='Select * from CXP305 '
              +'Where CIAID='''   +dblcCia.Text    +''' and '
              +      'CCPCANJE='''+dblcOPago.Text  +''' ';
         DM1.cdsDetCanjeCxP.Close;
         DM1.cdsDetCanjeCxP.DataRequest( xSQL );
         DM1.cdsDetCanjeCxP.Open;

         //
         DM1.cdsDetCanjeCxP.First;
         While (not DM1.cdsDetCanjeCxP.Eof) and (DM1.cdsDetCanjeCxP.RecordCount>0) do
            DM1.cdsDetCanjeCxP.Delete;

         DM1.cdsCanjeCxP.DisableControls;
         DM1.cdsCanjeCxP.First;

         While not DM1.cdsCanjeCxP.Eof do
         begin
            DM1.cdsDetCanjeCxP.Insert;
            DM1.cdsDetCanjeCxPCiaID.Value    := DM1.cdsCanjeCxPCiaID.Value;
            DM1.cdsDetCanjeCxPProv.Value     := DM1.cdsCanjeCxPProv.Value;
            DM1.cdsDetCanjeCxPProvRuc.Value  := DM1.cdsCanjeCxPProvRuc.Value;
            DM1.cdsDetCanjeCxPDocID.Value    := DM1.cdsCanjeCxPDocID.Value;
            DM1.cdsDetCanjeCxPCPserie.Value  := DM1.cdsCanjeCxPCPSerie.Value;
            DM1.cdsDetCanjeCxPCPNoDoc.Value  := DM1.cdsCanjeCxPCPNoDoc.Value;
            DM1.cdsDetCanjeCxPCPNoReg.Value  := DM1.cdsCanjeCxPCPNoReg.Value;
            DM1.cdsDetCanjeCxPTCanjeID.Value := DM1.cdsCanjeCxPTCanjeID.Value;
            DM1.cdsDetCanjeCxPCCPCanje.Value := DM1.cdsCanjeCxPCCPCanje.Value;
            DM1.cdsDetCanjeCxPCCPFCje.Value  := DM1.cdsCanjeCxPCCPFCje.Value;
            DM1.cdsDetCanjeCxPDocID2.Value   := '05';  // Orden de Pago
            DM1.cdsDetCanjeCxPCPSerie2.Value := '000';
//            DM1.cdsDetCanjeCxPCPNoDoc2.Value := dbeOPago.Text;
            DM1.cdsDetCanjeCxPCPNoDoc2.Value := dblcOPago.Text;
            DM1.cdsDetCanjeCxPTMonID.Value   := DM1.cdsCanjeCxPTMonID.Value;

            If DM1.cdsCanjeCxPTMonID.Value=DM1.wTMonLoc then
            begin
               DM1.cdsDetCanjeCxPDCDMoLoc.Value := DM1.FRound(DM1.cdsCanjeCxPCCPMoLoc.Value,15,2);
               DM1.cdsDetCanjeCxPDCDMoExt.Value := DM1.FRound(DM1.cdsCanjeCxPCCPMoLoc.Value/DM1.cdsCanjeCxPCCPTCDoc.Value,15,2);
               end
            else
            begin
               DM1.cdsDetCanjeCxPDCDMoExt.Value := DM1.FRound(DM1.cdsCanjeCxPCCPMoExt.Value,15,2);
               DM1.cdsDetCanjeCxPDCDMoLoc.Value := DM1.FRound(DM1.cdsCanjeCxPCCPMoExt.Value*DM1.cdsCanjeCxPCCPTCDoc.Value,15,2);
            end;

            DM1.cdsDetCanjeCxPDCDUser.Value  := DM1.cdsCanjeCxPCCPUser.Value;
            DM1.cdsDetCanjeCxPDCDFReg.Value  := DM1.cdsCanjeCxPCCPFReg.Value;
            DM1.cdsDetCanjeCxPDCDHReg.Value  := DM1.cdsCanjeCxPCCPHReg.Value;
            DM1.cdsDetCanjeCxPDCDAAAA.Value  := DM1.cdsCanjeCxPCCPAnoC.Value;
            DM1.cdsDetCanjeCxPDCDMM.Value    := DM1.cdsCanjeCxPCCPMM.Value;
            DM1.cdsDetCanjeCxPDCDDD.Value    := DM1.cdsCanjeCxPCCPDD.Value;
            DM1.cdsDetCanjeCxPDCDTri.Value   := DM1.cdsCanjeCxPCCPTri.Value;
            DM1.cdsDetCanjeCxPDCDSem.Value   := DM1.cdsCanjeCxPCCPSem.Value;
            DM1.cdsDetCanjeCxPDCDSS.Value    := DM1.cdsCanjeCxPCCPSS.Value;
            DM1.cdsDetCanjeCxPDCDAnoMM.Value := DM1.cdsCanjeCxPCCPAnoMM.Value;
            DM1.cdsDetCanjeCxPDCDAATri.Value := DM1.cdsCanjeCxPCCPAATri.Value;
            DM1.cdsDetCanjeCxPDCDAASem.Value := DM1.cdsCanjeCxPCCPAASem.Value;
            DM1.cdsDetCanjeCxPDCDAASS.Value  := DM1.cdsCanjeCxPCCPAASS.Value;
            DM1.cdsCanjeCxP.Next;
         end;

         DM1.cdsDetCanjeCxP.First;
         DM1.cdsCanjeCxP.First;
         DM1.cdsCanjeCxP.EnableControls;

         DM1.cdsDetCanjeCxP.ApplyUpdates(0);
         DM1.cdsMovCxP.ApplyUpdates(0);
end;

procedure TFPagoProv.z2bbtnCanceladoClick(Sender: TObject);
var
   xConsis:Boolean;
   xDatAux : StructSaldosAux ;
begin
   if (DM1.cdsEgrCaja.Fieldbyname('ECEstado').Value = 'I')
      or (DM1.cdsEgrCaja.Fieldbyname('ECEstado').Value = 'P') then
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

             ActualizaSaldos ;

             DM1.cdsEgrCaja.Edit;
             DM1.cdsEgrCaja.FieldByName('ECEstado').Value:='C';
             DM1.cdsEgrCaja.ApplyUpdates(0);
             ActualizaFiltro ;
             //0805
             DM1.cdsEgrCaja.Refresh ;
             //
             DM1.cdsPagoCxP.Edit;
             DM1.cdsPagoCxPOPESTADO.Value:='C';  //Lo marco como Cancelado
             DM1.cdsPagoCxP.Post ;
             DM1.cdsPagoCxP.ApplyUpdates(0);
             //
             DM1.cdsPagoCxP.Refresh ;
             //

             z2bbtnSumatClick(sender);
//
             with xDatAux , DM1.cdsEgrcaja do
             begin
               CIAID     :=  dblcCia.Text ;
               CLAUXID   :=  dbeClase1.Text ;
               AUXID     :=  dbeProv.Text ;
               MONTOMN   :=  fieldbyName('ECMTOLOC').AsString ;
               MONTOME   :=  fieldbyName('ECMTOEXT').AsString ;
               FECHA     :=  dbdtpFComp.date ;
               dm1.ActSaldosAux ( xDatAux ) ;
             end ;
//
             //sitio para actualizaciones de saldo
             ActualizaSaldosCaja ;
             //
             dbgOtrosIButton.Enabled:=False;
             z2bbtnSumat.Enabled    := False;
             z2bbtnCont.Enabled     := True;
             z2bbtnSube.Enabled     := False;
             z2bbtnGraba.Enabled    := False;
             z2bbtnCancelado.Enabled:= False;
             z2bbtnCancel2.Enabled  := False;
             z2bbtnAnula.Enabled    := False;
             Z2bbtnEmiChq.Enabled   := False ;
             lblEstado.Caption    :='Cancelado          ';

          end;
      end;
   end
   else
   begin
      ShowMessage('Imposible Cancelar');
   end;
end;

function TFPagoProv.ValidaCampo:Boolean;
var xWhere,aux:string;
begin
     Result:=True;
     with DM1 do
     begin

        if length(cdsRegCxPCPNOREG.Value)=0 then
        begin  //No Registro
           ShowMessage('Falta No Registro');
           Result:=False;
           exit;
        end
        else
        begin
           if length(cdsRegCxPCPNOREG.Value)<6 then
           begin
              ShowMessage('Codigo de Registro Errado');
              Result:=False;
              exit;
           end;
        end;

        if length(cdsRegCxPTDIARID2.Value)=0 then
        begin  //Tipo de Diario
           ShowMessage('Falta Tipo de Diario');
           Result:=False;
           exit;
        end
        else begin
           xWhere:='TDIARID='+''''+cdsRegCxPTDIARID2.Value+'''';
           aux   :=DisplayDescrip('prvTGE','TGE104','TDIARABR',xWhere,'TDIARABR');
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Tipo de Diario Errado');
              Result:=False;
              exit;
           end;
        end;

        if length(cdsRegCxPDOCID2.Value)=0 then
        begin  //Tipo de Documento
           ShowMessage('Falta Tipo de Documento');
           Result:=False;
           exit;
        end
        else
        begin
           xWhere:='DOCID='+''''+cdsRegCxPDOCID2.Value+'''';
           aux   :=DisplayDescrip('prvTGE','TGE110','DOCDES',xWhere,'DOCDES');
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Tipo de Documento Errado');
              Result:=False;
              exit;
           end;
        end;

        if cdsRegCxPCPSERIE.Value='' then
        begin      //Serie
           ShowMessage('Falta Serie');
           Result:=False;
           exit;
        end;

        if cdsRegCxPCPNODOC.Value='' then
        begin      //No Documento
           ShowMessage('Falta Nro. de Documento');
           Result:=False;
           exit;
        end;

        if length(cdsRegCxPTMONID.Value)=0 then
        begin //Tipo de Moneda
           ShowMessage('Falta Tipo de Moneda');
           Result:=False;
           exit;
        end
        else
        begin
           xWhere:='TMONID='+''''+cdsRegCxPTMONID.Value+'''';
           aux   :=DisplayDescrip('prvTGE','TGE103','TMONABR',xWhere,'TMONABR');
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Tipo de Moneda Errado');
              Result:=False;
              exit;
           end;
        end;

        if cdsRegCxPDETCDOC.Value<=0 Then
        begin // Tipo de Cambio Detalle
           ShowMessage('Tipo de Cambio debe ser mayor que cero');
           Result:=False;
           exit;
        end;

        if cdsRegCxPDEMTOORI.Value<=0 Then
        begin   //Importe
           ShowMessage('Importe debe ser mayor que cero');
           Result:=False;
           exit;
        end;

        if cdsRegCxPCPTOID.Value='' then
        begin      //Concepto
           ShowMessage('Falta Concepto');
           Result:=False;
           exit;
        end
        else
        begin                             // Cuenta
           aux:=cdsRegCxPCUENTAID.Value;
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
          IF (length(cdsRegCxPCCOSID.Value)=0) THEN
          BEGIN
              ShowMessage('Falta Centro de Costo') ;
              Result:=False ;
              exit ;
          END
          else
          begin
           xWhere:='CCosID='+''''+cdsRegCxPCCOSID.Value+'''' ;
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

        if cdsRegCxPCPFVCMTO.Value<cdsRegCxPCPFEMIS.Value then
        begin //Fecha de Vencimiento
             ShowMessage('Fecha de Vencimiento debe ser posterior a la Fecha de Emision');
             Result:=False;
             exit;
        end;
    end;
end;

procedure TFPagoProv.ConsisCancela(Var xConsis:boolean);
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
         if cdsRegCxPDEDH.Value='D' then
            if cdsEgrCaja.FieldByName('TMONID').Value = wtMonLoc then
               xSumImp := xSumImp + strToCurr(stringReplace(cdsRegCxPDEMTOLOC.DisplayText,'´','',[rfReplaceAll]))
            else
               xSumImp := xSumImp + strToCurr(stringReplace(cdsRegCxPDEMTOEXT.DisplayText,',','',[rfReplaceAll]))
         else
            if cdsEgrCaja.FieldByName('TMONID').Value = wtMonLoc then
               xSumImp := xSumImp - strToCurr(stringReplace(cdsRegCxPDEMTOLOC.DisplayText,'´','',[rfReplaceAll]) )
            else
               xSumImp := xSumImp - strToCurr(stringReplace(cdsRegCxPDEMTOEXT.DisplayText,',','',[rfReplaceAll]) ) ;

         cdsRegCxP.Next;
      end;
      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);
   end;
   // Adicionamos el total de la Orden de Pago
   if DM1.cdsEgrCaja.FieldByName('TMONID').Value = dm1.wtMonLoc then
      xSumImp:=xSumImp + strtocurr(floattostrf(DM1.cdsPagoCxPOPMTOLOC.ASCurrency,fffixed,10,2))
   else
      xSumImp:=xSumImp + strToCurr(floattostrf(DM1.cdsPagoCxPOPMTOEXT.ASCurrency,fffixed,10,2)) ;
/////////////
   if dm1.cdsEgrCaja.FieldByName('TMONID').Value = dm1.wtMonLoc then
      Suma :=  strtocurr(floattostrf(dm1.cdsEgrCaja.fieldbyname('ECMTOLOC').ASCurrency,fffixed,10,2))
   else
      Suma :=  strtocurr(floattostrf(dm1.cdsEgrCaja.fieldbyname('ECMTOEXT').ASCurrency,fffixed,10,2)) ;
/////////////
   // Comparamos
//   if xSumImp <> DM1.cdsEgrCajaECMTOORI.Value then
   if xSumImp <> Suma then
   begin
        xConsis := False;
        if Suma > xSumImp then
           ShowMessage('El Monto a Pagar es mayor que el Provisionado')
        else
           ShowMessage('El Monto a Pagar es menor que el Provisionado');
   end;
end;

procedure TFPagoProv.Contab_EgrCaja;
begin
    dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsEgrcaja.FieldByName('CIAID').Value;
    dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsEgrCaja.FieldByName('TDIARID').Value;
    dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
    dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
    dm1.cdsCntCajaDCLOTE.Value  :=  dm1.cdsEgrCaja.FieldByName('ECLOTE').Value;
    dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsEgrCaja.FieldByName('DOCID').Value;
    //dm1.cdsCntCajaDCSERIE.Value :=  ;
    dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsEgrCaja.FieldByName('ECNODOC').Value;
    dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsEgrCaja.FieldByName('ECFCOMP').Value;
    //dm1.cdsCntCajaDCFEMIS.Value :=;
    //dm1.cdsCntCajaDCFVCMTO.Value:=;
    dm1.cdsCntCajaCPTOID.Value  :=  dm1.cdsEgrCaja.FieldByName('CPTOID').Value;
    dm1.cdsCntCajaCUENTAID.Value:=  dm1.cdsEgrCaja.FieldByName('CUENTAID').Value;
    //dm1.cdsCntCajaCLAUXID.Value :=  ; No va porque la cuenta 10 no lleva auxiliar
    //dm1.cdsCntCajaDCAUXID.Value :=  ; No va porque la cuenta 10 no lleva auxiliar
    //dm1.cdsCntCajaCCOSID.Value  :=  ;
    dm1.cdsCntCajaDCDH.Value    :=  'H';
    dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsEgrCaja.FieldByName('ECTCAMB').Value;
    //dm1.cdsCntCajaDCTCAMPR.Value:=  ;    No se usa porque se llena del detalle
    dm1.cdsCntCajaTMONID.Value  :=  dm1.cdsEgrCaja.FieldByName('TMONID').Value;
    dm1.cdsCntCajaDCMTOORI.Value:=  dm1.cdsEgrCaja.FieldByName('ECMTOORI').Value;
    dm1.cdsCntCajaDCMTOLO.Value :=  dm1.cdsEgrCaja.FieldByName('ECMTOLOC').Value;
    dm1.cdsCntCajaDCMTOEXT.Value:=  dm1.cdsEgrCaja.FieldByName('ECMTOEXT').Value;
    //dm1.cdsCntCajaDCESTADO.Value:=;
    dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
    //dm1.cdsCntCajaDCFLAAUT.Value:=;
    //dm1.cdsCntCajaDCUSER.Value  :=;
    //dm1.cdsCntCajaDCFREG.Value  :=;
    //dm1.cdsCntCajaDCHREG.Value  :=;
    dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsEgrCaja.FieldByName('ECANO').Value;
    dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsEgrCaja.FieldByName('ECMM').Value;
    dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsEgrCaja.FieldByName('ECDD').Value;
    dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsEgrCaja.FieldByName('ECSS').Value;
    dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsEgrCaja.FieldByName('ECSEM').Value;
    dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsEgrCaja.FieldByName('ECTRI').Value;
    dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsEgrCaja.FieldByName('ECAASS').Value;
    dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsEgrCaja.FieldByName('ECAASEM').Value;
    dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsEgrCaja.FieldByName('ECAATRI').Value;
    dm1.cdsCntCaja.FieldByName('DCGLOSA').AsString := dm1.cdsEgrCaja.fieldBYName('ECGLOSA').AsString ;
    dm1.cdsCntCaja.FieldByName('DCTCAMPA').AsString := dbeTCambio.Text ;
    dm1.cdsCntCaja.FieldByName('FCAB').AsString := '1' ;
end;

procedure TFPagoProv.Contab_RegCxP;
begin
    dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsRegCxPCIAID.Value;
    dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsRegCxPTDIARID.Value;
    dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsRegCxPECANOMM.Value;
    dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsRegCxPECNOCOMP.Value;
    dm1.cdsCntCajaDCLOTE.Value  :=  dm1.cdsEgrCaja.FieldByName('ECLOTE').Value;
    dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsRegCxPDOCID2.Value;
    dm1.cdsCntCajaDCSERIE.Value :=  dm1.cdsRegCxPCPSERIE.Value;
    dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsRegCxPCPNODOC.Value;
    dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsRegCxPDEFCOMP.Value;
    dm1.cdsCntCajaDCFEMIS.Value :=  dm1.cdsRegCxPCPFEMIS.Value;
    dm1.cdsCntCajaDCFVCMTO.Value:=  dm1.cdsRegCxPCPFVCMTO.Value;
    dm1.cdsCntCajaCPTOID.Value  :=  dm1.cdsRegCxPCPTOID.Value;
    dm1.cdsCntCajaCUENTAID.Value:=  dm1.cdsRegCxPCUENTAID.Value;
    dm1.cdsCntCajaCLAUXID.Value :=  dm1.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
    dm1.cdsCntCajaDCAUXID.Value :=  dm1.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
    dm1.cdsCntCajaCCOSID.Value  :=  dm1.cdsRegCxPCCOSID.Value;
    dm1.cdsCntCajaDCDH.Value    :=  dm1.cdsRegCxPDEDH.Value;
    dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsRegCxPDETCPAG.Value;
    dm1.cdsCntCajaDCTCAMPR.Value:=  dm1.cdsRegCxPDETCDOC.Value;
    dm1.cdsCntCajaTMONID.Value  :=  dm1.cdsRegCxPTMONID.Value;
    dm1.cdsCntCajaDCMTOORI.Value:=  dm1.cdsRegCxPDEMTOORI.Value;
    if dm1.cdsRegCxPTMONID.Value = dm1.wtMonLoc then
    begin
       dm1.cdsCntCajaDCMTOLO.Value := dm1.cdsRegCxPDEMTOLOC.Value;
       dm1.cdsCntCajaDCMTOEXT.Value:= dm1.cdsRegCxPDEMTOLOC.Value / dm1.cdsRegCxPDETCDOC.Value;
    end
    else
    begin
       dm1.cdsCntCajaDCMTOEXT.Value:= dm1.cdsRegCxPDEMTOEXT.Value;
       dm1.cdsCntCajaDCMTOLO.Value := dm1.cdsRegCxPDEMTOEXT.Value * dm1.cdsRegCxPDETCDOC.Value;
    end;

    //dm1.cdsCntCajaDCESTADO.Value:=;
    dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
    //dm1.cdsCntCajaDCFLAAUT.Value:=;
    //dm1.cdsCntCajaDCUSER.Value  :=;
    //dm1.cdsCntCajaDCFREG.Value  :=;
    //dm1.cdsCntCajaDCHREG.Value  :=;
    dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsEgrCaja.FieldByName('ECANO').Value;
    dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsEgrCaja.FieldByName('ECMM').Value;
    dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsEgrCaja.FieldByName('ECDD').Value;
    dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsEgrCaja.FieldByName('ECSS').Value;
    dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsEgrCaja.FieldByName('ECSEM').Value;
    dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsEgrCaja.FieldByName('ECTRI').Value;
    dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsEgrCaja.FieldByName('ECAASS').Value;
    dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsEgrCaja.FieldByName('ECAASEM').Value;
    dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsEgrCaja.FieldByName('ECAATRI').Value;
{    dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsRegCxPDEANO.Value;
    dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsRegCxPDEMM.Value;
    dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsRegCxPDEDD.Value;
    dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsRegCxPDESS.Value;
    dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsRegCxPDESEM.Value;
    dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsRegCxPDETRI.Value;
    dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsRegCxPDEAASS.Value;
    dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsRegCxPDEAASEM.Value;
    dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsRegCxPDEAATRI.Value;}
    //dm1.cdsCntCajaFLAGVAR.Value :=;
end;

procedure TFPagoProv.Contab_CanjeCxP;
begin
    dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsEgrCaja.FieldByName('CIAID').Value;
    dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsEgrCaja.FieldByName('TDIARID').Value;
    dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
    dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
    dm1.cdsCntCajaDCLOTE.Value  :=  dm1.cdsEgrCaja.FieldByName('ECLOTE').Value;
    dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsCanjeCxPDOCID.Value;
    dm1.cdsCntCajaDCSERIE.Value :=  dm1.cdsCanjeCxPCPSERIE.Value;
    dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsCanjeCxPCPNODOC.Value;
    dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsEgrCaja.FieldByName('ECFCOMP').Value;
    dm1.cdsCntCajaDCFEMIS.Value :=  dm1.cdsCanjeCxPCPFEMIS.Value;
    dm1.cdsCntCajaDCFVCMTO.Value:=  dm1.cdsCanjeCxPCPFVCMTO.Value;
    dm1.cdsCntCajaCPTOID.Value  :=  dm1.cdsCanjeCxPCPTOTOT.Value;
    dm1.cdsCntCajaCUENTAID.Value:=  dm1.cdsCanjeCxPCTATOTAL.Value;
    dm1.cdsCntCajaCLAUXID.Value :=  dm1.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
    dm1.cdsCntCajaDCAUXID.Value :=  dm1.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
    //dm1.cdsCntCajaCCOSID.Value  :=  dm1.cdsCanjeCxPCCOSID.Value;
    dm1.cdsCntCajaDCDH.Value    :=  'D';
    dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsCanjeCxPCCPTCCJE.Value;
    dm1.cdsCntCajaDCTCAMPR.Value:=  dm1.cdsCanjeCxPCCPTCDOC.Value;
    dm1.cdsCntCajaTMONID.Value  :=  dm1.cdsCanjeCxPTMONID.Value;
    dm1.cdsCntCajaDCMTOORI.Value:=  dm1.cdsCanjeCxPCCPMOORI.Value;
    if dm1.cdsCanjeCxPTMONID.Value = dm1.wtMonLoc then
    begin
       dm1.cdsCntCajaDCMTOLO.Value := dm1.cdsCanjeCxPCCPMOORI.Value; //dm1.cdsCanjeCxPCCPMOLOC.Value;
       dm1.cdsCntCajaDCMTOEXT.Value:= dm1.cdsCanjeCxPCCPMOORI.Value / dm1.cdsCanjeCxPCCPTCCJE.Value;
    end
    else
    begin
       dm1.cdsCntCajaDCMTOEXT.Value:= dm1.cdsCanjeCxPCCPMOORI.Value;
       dm1.cdsCntCajaDCMTOLO.Value := dm1.cdsCanjeCxPCCPMOORI.Value * dm1.cdsCanjeCxPCCPTCCJE.Value;
    end;

    //dm1.cdsCntCajaDCESTADO.Value:=;
    dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
    //dm1.cdsCntCajaDCFLAAUT.Value:=;
    //dm1.cdsCntCajaDCUSER.Value  :=;
    //dm1.cdsCntCajaDCFREG.Value  :=;
    //dm1.cdsCntCajaDCHREG.Value  :=;
    dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsEgrCaja.FieldByName('ECANO').Value;
    dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsEgrCaja.FieldByName('ECMM').Value;
    dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsEgrCaja.FieldByName('ECDD').Value;
    dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsEgrCaja.FieldByName('ECSS').Value;
    dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsEgrCaja.FieldByName('ECSEM').Value;
    dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsEgrCaja.FieldByName('ECTRI').Value;
    dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsEgrCaja.FieldByName('ECAASS').Value;
    dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsEgrCaja.FieldByName('ECAASEM').Value;
    dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsEgrCaja.FieldByName('ECAATRI').Value;
    //dm1.cdsCntCajaFLAGVAR.Value :=;
end;

procedure TFPagoProv.Contab_DifCamCanje;
var
    xDif_Camb : real;
begin
    // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO

    if dm1.cdsCanjeCxPCCPTCDOC.Value <> dm1.cdsCanjeCxPCCPTCCJE.Value then begin

       DM1.cdsCntCaja.Insert;
       dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsEgrCaja.FieldByName('CIAID').Value;
       dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsEgrCaja.FieldByName('TDIARID').Value;
       dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
       dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
       dm1.cdsCntCajaDCLOTE.Value  :=  dm1.cdsEgrCaja.FieldByName('ECLOTE').Value;
       dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsCanjeCxPDOCID.Value;
       dm1.cdsCntCajaDCSERIE.Value :=  dm1.cdsCanjeCxPCPSERIE.Value;
       dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsCanjeCxPCPNODOC.Value;
       dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsEgrCaja.FieldByName('ECFCOMP').Value;
       dm1.cdsCntCajaDCFEMIS.Value :=  dm1.cdsCanjeCxPCPFEMIS.Value;
       dm1.cdsCntCajaDCFVCMTO.Value:=  dm1.cdsCanjeCxPCPFVCMTO.Value;
       dm1.cdsCntCajaCPTOID.Value  :=  dm1.cdsCanjeCxPCPTOTOT.Value;
       dm1.cdsCntCajaCUENTAID.Value:=  dm1.cdsCanjeCxPCTATOTAL.Value;
       dm1.cdsCntCajaCLAUXID.Value :=  dm1.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
       dm1.cdsCntCajaDCAUXID.Value :=  dm1.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera

       dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsCanjeCxPCCPTCCJE.Value;
       dm1.cdsCntCajaDCTCAMPR.Value:=  dm1.cdsCanjeCxPCCPTCDOC.Value;

       dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsEgrCaja.FieldByName('ECANO').Value;
       dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsEgrCaja.FieldByName('ECMM').Value;
       dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsEgrCaja.FieldByName('ECDD').Value;
       dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsEgrCaja.FieldByName('ECSS').Value;
       dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsEgrCaja.FieldByName('ECSEM').Value;
       dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsEgrCaja.FieldByName('ECTRI').Value;
       dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsEgrCaja.FieldByName('ECAASS').Value;
       dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsEgrCaja.FieldByName('ECAASEM').Value;
       dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsEgrCaja.FieldByName('ECAATRI').Value;
    //dm1.cdsCntCajaFLAGVAR.Value :=;

       //dm1.cdsCntCajaDCESTADO.Value:=;
       dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
       //dm1.cdsCntCajaDCFLAAUT.Value:=;
       //dm1.cdsCntCajaDCUSER.Value  :=;
       //dm1.cdsCntCajaDCFREG.Value  :=;
       //dm1.cdsCntCajaDCHREG.Value  :=;

       //dm1.cdsCntCajaFLAGVAR.Value :=;}

       if dm1.cdsCanjeCxPTMONID.Value=dm1.wtMonLoc then
       begin   //Provision en Mon.Local
             xDif_Camb:= abs(dm1.cdsCanjeCxPCCPMOLOC.Value / dm1.cdsCanjeCxPCCPTCDOC.Value -
                             dm1.cdsCanjeCxPCCPMOLOC.Value / dm1.cdsCanjeCxPCCPTCCJE.Value);//En Mon.Ext.
             dm1.cdsCntCajaDCMTOEXT.Value := xDif_Camb;
             dm1.cdsCntCajaTMONID.Value   :=  dm1.wtMonExt;

             if dm1.cdsCanjeCxPCCPTCDOC.Value > dm1.cdsCanjeCxPCCPTCCJE.Value then
                dm1.cdsCntCajaDCDH.Value := 'D'
             else
                dm1.cdsCntCajaDCDH.Value := 'H';

       end
       else
       begin                                            //Provision en Mon.Ext.
             xDif_Camb:= abs(dm1.cdsCanjeCxPCCPMOEXT.Value * dm1.cdsCanjeCxPCCPTCDOC.Value -
                             dm1.cdsCanjeCxPCCPMOEXT.Value * dm1.cdsCanjeCxPCCPTCCJE.Value);//En Mon.Local
             dm1.cdsCntCajaDCMTOLO.Value := xDif_Camb;
             dm1.cdsCntCajaTMONID.Value  := dm1.wtMonLoc;

             if dm1.cdsRegCxPDETCDOC.Value > dm1.cdsCanjeCxPCCPTCCJE.Value then
                dm1.cdsCntCajaDCDH.Value := 'H'
             else
                dm1.cdsCntCajaDCDH.Value := 'D';
       end;
       //0706
       if dm1.cdsCntCajaDCDH.Value = 'D' then
       begin
          dm1.cdsCntCajaCPTOID.Value  :=  wCptoPer;
          dm1.cdsCntCajaCUENTAID.Value:=  wCtaPer;
       end
       else
       begin
          dm1.cdsCntCajaCPTOID.Value  :=  wCptoGan;
          dm1.cdsCntCajaCUENTAID.Value:=  wCtaGan;
       end;
    end
end;

procedure TFPagoProv.Contab_DifCamRegCxP;
//var
//    xDif_Camb : real;
begin
{    // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO

    if dm1.cdsRegCxPDETCDOC.Value <> dm1.cdsRegCxPDETCPAG.Value then begin

       DM1.cdsCntCaja.Insert;

       dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsRegCxPCIAID.Value;
       dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsRegCxPTDIARID.Value;
       dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsRegCxPECANOMM.Value;
       dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsRegCxPECNOCOMP.Value;
       //dm1.cdsCntCajaDCLOTE.Value  :=  ;
       dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsRegCxPDOCID2.Value;
       dm1.cdsCntCajaDCSERIE.Value :=  dm1.cdsRegCxPCPSERIE.Value;
       dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsRegCxPCPNODOC.Value;
       dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsRegCxPDEFCOMP.Value;
       dm1.cdsCntCajaDCFEMIS.Value :=  dm1.cdsRegCxPCPFEMIS.Value;
       dm1.cdsCntCajaDCFVCMTO.Value:=  dm1.cdsRegCxPCPFVCMTO.Value;
       dm1.cdsCntCajaCLAUXID.Value :=  dm1.cdsEgrCajaCLAUXID.Value; //Aqui se toma de la cabecera
       dm1.cdsCntCajaDCAUXID.Value :=  dm1.cdsEgrCajaPROV.Value;    //Aqui se toma de la cabecera
       dm1.cdsCntCajaCCOSID.Value  :=  dm1.cdsRegCxPCCOSID.Value;

       dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsRegCxPDETCPAG.Value;
       dm1.cdsCntCajaDCTCAMPR.Value:=  dm1.cdsRegCxPDETCDOC.Value;

       //dm1.cdsCntCajaDCESTADO.Value:=;
       dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
       //dm1.cdsCntCajaDCFLAAUT.Value:=;
       //dm1.cdsCntCajaDCUSER.Value  :=;
       //dm1.cdsCntCajaDCFREG.Value  :=;
       //dm1.cdsCntCajaDCHREG.Value  :=;
       dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsRegCxPDEANO.Value;
       dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsRegCxPDEMM.Value;
       dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsRegCxPDEDD.Value;
       dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsRegCxPDESS.Value;
       dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsRegCxPDESEM.Value;
       dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsRegCxPDETRI.Value;
       dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsRegCxPDEAASS.Value;
       dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsRegCxPDEAASEM.Value;
       dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsRegCxPDEAATRI.Value;
       //dm1.cdsCntCajaFLAGVAR.Value :=;

       if dm1.cdsRegCxPTMONID.Value=dm1.wtMonLoc then begin   //Provision en Mon.Local
             xDif_Camb:= abs(dm1.cdsRegCxPDEMTOLOC.Value / dm1.cdsRegCxPDETCDOC.Value -
                             dm1.cdsRegCxPDEMTOLOC.Value / dm1.cdsRegCxPDETCPAG.Value);//En Mon.Ext.
             dm1.cdsCntCajaDCMTOEXT.Value := xDif_Camb;
             dm1.cdsCntCajaTMONID.Value   :=  dm1.wtMonExt;

             if dm1.cdsRegCxPDETCDOC.Value > dm1.cdsRegCxPDETCPAG.Value then
                dm1.cdsCntCajaDCDH.Value := 'D'
             else
                dm1.cdsCntCajaDCDH.Value := 'H';

       end
       else begin                                            //Provision en Mon.Ext.
             xDif_Camb:= abs(dm1.cdsRegCxPDEMTOEXT.Value * dm1.cdsRegCxPDETCDOC.Value -
                             dm1.cdsRegCxPDEMTOEXT.Value * dm1.cdsRegCxPDETCPAG.Value);//En Mon.Local
             dm1.cdsCntCajaDCMTOLO.Value := xDif_Camb;
             dm1.cdsCntCajaTMONID.Value  := dm1.wtMonLoc;

             if dm1.cdsRegCxPDETCDOC.Value > dm1.cdsRegCxPDETCPAG.Value then
                dm1.cdsCntCajaDCDH.Value := 'H'
             else
                dm1.cdsCntCajaDCDH.Value := 'D';
       end;
       if dm1.cdsCntCajaDCDH.Value = 'D' then begin
          dm1.cdsCntCajaCPTOID.Value  :=  dm1.wCptoPer;
          dm1.cdsCntCajaCUENTAID.Value:=  dm1.wCtaPer;
       end
       else begin
          dm1.cdsCntCajaCPTOID.Value  :=  dm1.wCptoGan;
          dm1.cdsCntCajaCUENTAID.Value:=  dm1.wCtaGan;
       end;
    end}
end;


procedure TFPagoProv.Contabiliza;
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

    DM1.cdsCntCaja.Insert;
    Contab_EgrCaja;

   // GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde Docs Registro
    dm1.cdsRegCxP.DisableControls;
    xRegAct := dm1.cdsRegCxP.GetBookmark;
    dm1.cdsRegCxP.First ;
    While not dm1.cdsRegCxP.Eof do
    begin
       DM1.cdsCntCaja.Insert;
       Contab_RegCxP;
       //Contab_DifCamRegCxP;     No hay un reg. de dif.cambio porque el t.cambio es igual
       dm1.cdsRegCxP.Next;
    end;
    dm1.cdsRegCxP.GotoBookmark(xRegAct);
    dm1.cdsRegCxP.FreeBookmark(xRegAct);
    dm1.cdsRegCxP.EnableControls;

   // GENERA LOS REGISTROS DE "DEBE" Y LOS REGISTROS POR DIF. DE CAMBIO desde Docs Canje
    dm1.cdsCanjeCxP.DisableControls;
    xRegAct := dm1.cdsCanjeCxP.GetBookmark;
    dm1.cdsCanjeCxP.First ;
    While not dm1.cdsCanjeCxP.Eof do
    Begin
       DM1.cdsCntCaja.Insert;
       Contab_CanjeCxP;         // Aqui hay solo DEBE
       Contab_DifCamCanje;
       dm1.cdsCanjeCxP.Next;
    end;
    dm1.cdsCanjeCxP.GotoBookmark(xRegAct);
    dm1.cdsCanjeCxP.FreeBookmark(xRegAct);
    dm1.cdsCanjeCxP.EnableControls;

    //Actualizamos en la tabla de Contabilidad
    DM1.cdsCntCaja.ApplyUpdates(0);
end;

procedure TFPagoProv.z2bbtnContClick(Sender: TObject);
begin

   if DM1.cdsEgrCaja.FieldByName('ECEstado').Value='C' then
   begin
     if DM1.cdsEgrCaja.fieldbyname('FEXTCHQ').AsString = '1' then
     begin
        ShowMessage('No Puede Contabilizar este Movimiento ' + #13 +
                    'Pues se encuentra extornado') ;
        Exit ;            
     end ;
     if MessageDlg('¿Contabilizar y Generar Asientos Automaticos?',mtConfirmation,
                  [mbYes, mbNo], 0)=mrYes then
     begin
       screen.Cursor := crHourGlass ;
       RecCptosDifC ;
       Contabiliza;             // Realiza la generacion del Asiento
       dm1.GeneraContabilidad(dblccia.text , dblctdiario.text , edtperiodo.Text,dbenocomp.Text ,self, 'CXP' ) ;
       DM1.cdsEgrCaja.Edit;
       DM1.cdsEgrCaja.FieldByName('ECConta').Value:='S';   //Establece como Contabilizado el flag
       DM1.cdsEgrCaja.ApplyUpdates(0);
       //0805
       DM1.cdsEgrCaja.Refresh ;
       //
       z2bbtnCont.Enabled := False;
       lblEstado.Caption  :='Cancelado y Contab.' ;
       screen.Cursor := crDefault ;
     end;
   end
   else
   begin
       ShowMessage('Imposible Contabilizar');
   end;

end;

procedure TFPagoProv.z2bbtnAnulaClick(Sender: TObject);
begin
    if DM1.cdsEgrCaja.FieldByName('ECEstado').Value='I' then
    begin
      if MessageDlg('¿Anular Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin

         DM1.cdsEgrCaja.CancelUpdates;
         DM1.cdsRegCxP.CancelUpdates;
         DM1.cdsPagoCxP.CancelUpdates;

         DM1.cdsEgrCaja.Edit;
         DM1.cdsEgrCaja.FieldByName('ECEstado').Value:='A';
         DM1.cdsEgrCaja.ApplyUpdates(0);

         // Liberamos la Orden de Pago
         DM1.cdsPagoCxP.Edit;
         DM1.cdsPagoCxPOPEstado.Value:='I';
         DM1.cdsPagoCxP.ApplyUpdates(0);

         dbgOtrosIButton.Enabled:=False;
         z2bbtnSumat.Enabled    := False;
         z2bbtnNuevo.Enabled    := True;
         z2bbtnCont.Enabled     := False;
         z2bbtnSube.Enabled     := False;
         z2bbtnGraba.Enabled    := False;
         z2bbtnCancelado.Enabled:= False;
         z2bbtnCancel2.Enabled  := False;
         z2bbtnAnula.Enabled    := False;
         lblEstado.Caption    :='Anulado            ';
      end;
    end
    else
    begin
       ShowMessage('Imposible Anular Comprobante');
    end;
end;

procedure TFPagoProv.ActPnlBotones;
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
   Z2bbtnEmiChq.Enabled   := wbChq ;
end;

procedure TFPagoProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if pnlActualiza.Visible then
  begin
     z2bbtnCancel3.SetFocus ;
     z2bbtnCancel3Click(nil) ;
  end ;
  with dm1 do
  begin
   if cdsEgrCaja.active then
   begin
        cdsEgrCaja.CancelUpdates ;
        cdsEgrCaja.Filtered  :=False ;
   end ;
   if cdsRegCxP.active then
        cdsRegCxP.CancelUpdates ;
   cdsRegCxP.Filtered := False ;
   if cdsPagoCxP.active then
   begin
        cdsPagoCxP.CancelUpdates ;
        cdsPagoCxP.Filtered  :=False ;
   end ;
   if cdsCanjeCxP.active then
   begin
        cdsCanjeCxP.CancelUpdates ;
   end ;

   // Limpiamos los filtros
//   ControlFocoSalida(self,ctrl,evt_exit) ;
   cf1.QuitarExits(self) ;
  end ;
//
//   LibConfigAccesos;
//
end;

{procedure TFPagoProv.dbeOPagoExit(Sender: TObject);
var   xRegAct : TBookMark;
begin
   dbeOPago.Text:=DM1.strzero(dbeOPago.Text,DM1.cdsPagoCxPOPAGO.DisplayWidth);
   // Buscamos que DEBE existir la Orden Pedida
   DM1.cdsPagoCxP.Filtered:=False;
   DM1.cdsPagoCxP.SetKey;
   DM1.cdsPagoCxPCIAID.Value   := dblcCia.Text;
   DM1.cdsPagoCxPOPAGO.Value   := dbeOPago.Text;

   if DM1.cdsPagoCxP.GotoKey then begin
      if not (DM1.cdsPagoCxPOPESTADO.Value[1] in ['I','P']) then begin
         DM1.cdsPagoCxP.Filtered:=True;
         ShowMessage('Hay un error en la consistencia de Datos');
         dbeOPago.Text:='';
         dbeOPago.SetFocus;
         exit;
      end;
      if (DM1.cdsPagoCxPOPESTADO.Value ='P') then begin
             // Voy a verificar que la nueva orden no este ya Pendiente
             xRegAct := DM1.cdsEgrCaja.GetBookmark;
             DM1.cdsEgrCaja.Filtered:=False;
             DM1.cdsEgrCaja.Filter:='';
             DM1.cdsEgrCaja.Filter:='CiaID='+''''+dblcCia.Text+''''
                                  +' and TDiarID='+''''+dblcTDiario.Text+''''
                                  +' and ECAnoMM='+''''+edtPeriodo.Text+''''
                                  +' and ECOPago='+''''+dbeOPago.Text +'''';
             DM1.cdsEgrCaja.Filtered:=True;
             //Si existiese el registro y pertenece a otro Voucher..
             if (dm1.cdsEgrCaja.RecordCount>0) and (dm1.cdsEgrCajaECNoComp.Value<>dbeNoComp.Text) then
             begin //..no se puede tomar
                  DM1.cdsEgrCaja.Filtered:=False;     // restauramos el puntero
                  DM1.cdsEgrCaja.GotoBookmark(xRegAct);
                  DM1.cdsEgrCaja.FreeBookmark(xRegAct);

                  ShowMessage('Orden esta asociada a otro Voucher');
                  dbeOPago.Text:='';
                  dbeOPago.SetFocus;
                  exit;
             end
             else begin
                  DM1.cdsEgrCaja.Filtered:=False;     // restauramos el puntero
                  DM1.cdsEgrCaja.GotoBookmark(xRegAct);
                  DM1.cdsEgrCaja.FreeBookmark(xRegAct);
             end;
      end;
   end
   else begin
      DM1.cdsPagoCxP.Filtered:=True;
      ShowMessage('Orden de Pago No Existe');
      dbeOPago.Text:='';
      dbeOPago.SetFocus;
      exit;
   end;
   // En este punto debe haber encontrado la Orden de Pago
   DM1.cdsCanjeCxP.Filtered:=False;
   DM1.cdsCanjeCxP.Filter:='';

   DM1.cdsCanjeCxP.Filter:='CiaId='   +''''+dblcCia.Text+''''+' and '
                          +'TCanjeId='+''''+'OP'+''''+' and '
                          +'CCPCanje='+''''+dbeOPago.Text+'''';

   DM1.cdsCanjeCxP.Filtered:=True;

   z2bbtnSumatCanjeClick(Sender);

   if dm1.cdsPagoCxPOPESTADO.Value<>'P' then begin  //No debe haber estado ya grabada

     dbeTCambio.Text := floattostr(DM1.cdsPagoCxPOPTCAMB.Value);
     if DM1.cdsPagoCxPTMONID.Value = dm1.wtMonLoc then
        dbeImporte.Text := floattostr(DM1.cdsPagoCxPOPMTOLOC.Value)
     else
        dbeImporte.Text := floattostr(DM1.cdsPagoCxPOPMTOEXT.Value);
   end;
end;}

procedure TFPagoProv.IniciaPanel;
begin
     dblcTDiario2.Text   := '';
     dbeSerie.Text       := '';
     dblcTDoc2.Text      := '';
     dbeNoDoc2.Text      := '';
//     dblcCnp2.Text       := '';
     dblcdCnp2.Text       := '';
     dbeDH.Text          := '';
//     dblcCCosto.Text     := '';
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

procedure TFPagoProv.dbgOtrosIButtonClick(Sender: TObject);
begin

     inhabilitarpaneles;
     AdicionarREgistros;

end;

procedure TFPagoProv.dbgOtrosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (dbgOtrosIButton.Enabled=True) and (key = VK_DELETE) and (ssCtrl in Shift) then
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

procedure TFPagoProv.dbeNoRegExit(Sender: TObject);
begin
   if not z2bbtnCancel3.Focused then
   begin
//0106      dbeNoReg.Text:=dm1.strzero(dbeNoReg.Text,6);
      dbeNoReg.Text:=dm1.strzero(dbeNoReg.Text,10);
      if strtoint(dbeNoReg.Text)=0 then
      begin     // NoRegistro
         dbeNoReg.Text:='';
         ShowMessage('No es valido el No Registro');
         dbeNoReg.SetFocus;
         exit;
      end;
       dm1.cdsRegCxPCPNoReg.Value  := dbeNoReg.Text;
//       dbeNoReg.Enabled := False;
//       dbeNoReg.Color   := clBtnFace;
   end
   else
   dbeNoReg.Text:='';

end;

procedure TFPagoProv.dblcTMon2Change(Sender: TObject);
var xWhere:string;
begin
   xWhere:='TMONID='+''''+dblcTMon2.Text+'''';
   edtTMon2.Text:=DM1.DisplayDescrip('prvTGE','TGE103','TMONABR',xWhere,'TMONABR');
end;

procedure TFPagoProv.dblcTMon2Exit(Sender: TObject);
var xWhere, aux: string;
begin
      if  z2bbtnCancel3.Focused then
          exit;
      xWhere:='TMONID='+''''+DM1.cdsRegCxPTMONID.Value+'''';
      aux:=DM1.DisplayDescrip('prvTGE','TGE103','TMONABR',xWhere,'TMONABR');
      if (length(aux)>0) and (DM1.cdsRegCxPDEMTOORI.Value>0) then
      begin
        if DM1.cdsRegCxPTMONID.Value = dm1.wTMonLoc then begin
           DM1.cdsRegCxPDEMTOLOC.Value:=DM1.cdsRegCxPDEMTOORI.Value;
           DM1.cdsRegCxPDEMTOEXT.Value:=DM1.cdsRegCxPDEMTOORI.Value/DM1.cdsEgrCaja.FieldByName('ECTCAMB').Value;
        end
        else
        begin
           DM1.cdsRegCxPDEMTOLOC.Value:=DM1.cdsRegCxPDEMtoOri.Value*DM1.cdsEgrCaja.FieldByName('ECTCAMB').Value;
           DM1.cdsRegCxPDEMTOEXT.Value:=DM1.cdsRegCxPDEMtoOri.Value;
        end;
      end
      else
      begin
           DM1.cdsRegCxPDEMTOLOC.Value:=0;
           DM1.cdsRegCxPDEMTOEXT.Value:=0;
      end;
end;

procedure TFPagoProv.dbeImporte2Exit(Sender: TObject);
var xWhere, aux: string;
begin
      if  z2bbtnCancel3.Focused then
          exit;
      xWhere:='TMONID='+''''+DM1.cdsRegCxPTMONID.Value+'''';
      aux:=DM1.DisplayDescrip('prvTGE','TGE103','TMONABR',xWhere,'TMONABR');
      if (length(aux)>0) and (DM1.cdsRegCxPDEMTOORI.Value>0) then
      begin
        if DM1.cdsRegCxPTMONID.Value = dm1.wTMonLoc then
        begin
           DM1.cdsRegCxPDEMTOLOC.Value:=DM1.cdsRegCxPDEMTOORI.Value;
           DM1.cdsRegCxPDEMTOEXT.Value:=DM1.cdsRegCxPDEMTOORI.Value/DM1.cdsEgrCaja.FieldByName('ECTCAMB').Value;
        end
        else
        begin
           DM1.cdsRegCxPDEMTOLOC.Value:=DM1.cdsRegCxPDEMtoOri.Value*DM1.cdsEgrCaja.FieldByName('ECTCAMB').Value;
           DM1.cdsRegCxPDEMTOEXT.Value:=DM1.cdsRegCxPDEMtoOri.Value;
        end;
      end
      else
      begin
           DM1.cdsRegCxPDEMTOLOC.Value:=0;
           DM1.cdsRegCxPDEMTOEXT.Value:=0;
      end;
end;

procedure TFPagoProv.dbdtpFComp2Exit(Sender: TObject);
begin
   dm1.cdsRegCxPCPANOMM.Value:=copy(datetostr(dm1.cdsRegCxPDEFCOMP.Value),7,4)
                              +copy(datetostr(dm1.cdsRegCxPDEFCOMP.Value),4,2);
end;

procedure TFPagoProv.z2bbtnOK2Click(Sender: TObject);
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

procedure TFPagoProv.z2bbtnCancel3Click(Sender: TObject);
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
     z2bbtnSumatClick(sender);    // Al salir hay que totalizar
   //quitar los filtros que se hubieran establecido
     liberarfiltrosregistroegresos;

end;

procedure TFPagoProv.z2bbtnSumatClick(Sender: TObject);
Var
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
         else
         begin
           xMtoLoc := xMtoLoc - strtocurr( stringReplace(cdsRegCxPDEMTOLOC.DisplayText,',','',[rfReplaceAll]) ) ;
           xMtoExt := xMtoExt - strToCurr( stringReplace(cdsRegCxPDEMTOEXT.DisplayText,',','',[rfReplaceAll]) ) ;
         end;
         cdsRegCxP.Next;
      end;
      dbgOtros.ColumnByName('DEMTOLOC').FooterValue:=floattostrf(xMtoLoc, ffFixed, 10, 2);
      dbgOtros.ColumnByName('DEMTOEXT').FooterValue:=floattostrf(xMtoExt, ffFixed, 10, 2);

      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);
      cdsRegCxP.EnableControls;
   end;
end;

procedure TFPagoProv.dbgOtrosCalcCellColors(Sender: TObject; Field: TField;
  State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
{    if (Field.FieldName = 'DEMTOLOC') or (Field.FieldName = 'DEMTOEXT') then begin
	if (DM1.cdsRegCxPDEDH.Value = 'H') then
           AFont.Color := clRed
        else
           AFont.Color := clBlue;
    end;}
end;

procedure TFPagoProv.dbgDocCanjeCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
{    if (Field.FieldName = 'CCPMOLOC') or (Field.FieldName = 'CCPMOEXT') then begin
       AFont.Color := clBlue;
    end;}
end;

procedure TFPagoProv.dbeDHChange(Sender: TObject);
begin
     if not ((dbeDH.Text='D') or (dbeDH.Text='H') or (length(dbeDH.Text)=0)) then
     begin
        dbeDH.Text:='';
        dbeDH.SetFocus;
     end;
end;

procedure TFPagoProv.dbeLoteExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then
      exit;

   dbeLote.text:=DM1.StrZero(dbeLote.text,DM1.cdsEgrCaja.FieldByName('ECLOTE').DisplayWidth);
end;

procedure TFPagoProv.dbeImporteChange(Sender: TObject);
begin
     wmodifica:=True;
end;

procedure TFPagoProv.dbeNoDocChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagoProv.dbeLoteChange(Sender: TObject);
begin
   wmodifica:=True;
end;


procedure TFPagoProv.dbeGlosaChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFPagoProv.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFPagoProv.z2bbtnOKCabClick(Sender: TObject);
var
   xWhere ,
   xSQL : String ;
begin

   if validacionCabecera=false then
      exit;

   dbeClase1.Text    := DM1.wClaseAux1;
   edtClase2.Enabled := False;

   with DM1 do
   begin
      xWhere :=  'CIAID ='+''''+dblcCia.Text+''''
                +' AND TDIARID ='+''''+dblcTDiario.Text+''''
                +' AND ECANOMM ='+''''+edtPeriodo.Text+''''
                +' AND ECNOCOMP ='+''''+dbeNoComp.Text +'''';
      if DM1.DisplayDescrip('prvTGE','CAJA302','COUNT(*) TOTREG',xWhere,'TOTREG') > '0' then
      begin
                ShowMessage('Comprobante ya esta registrado');
                dbeNoComp.Text:='';
                dbeNoComp.SetFocus;
                exit;
      end
      else
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

        // Actualizar Label Estado
        lblEstado.Caption:='Nuevo     ';
        //0805
        //liberamos el filtro del detalle
         dm1.cdsRegCxP.Filtered := False ;

        //// Insertar un nuevo registro

        //primero se recupera de la base de datos

         // vhn 22/01/2001
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

        // Estado de componentes
        pnlCabecera1.Enabled := false;
        pnlCabecera2.Enabled := True;

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
   wmodifica         := False;
   perform(CM_DialogKey,VK_TAB,0);
//establecimiento del filtro para las ordenes de pago disponibles
   xSQL := 'SELECT * FROM CXP303 '
          + ' WHERE CIAID = '''+dblcCia.text + ''' AND OPESTADO=''I'' '
          + ' ORDER BY OPAGO   ' ;
   DM1.cdsQry2.Active := False ;
   DM1.cdsQry2.DataRequest(xSQL) ;
   DM1.cdsQry2.Active := True ;
   cdsOPagoElegibles.CloneCursor(dm1.cdsQry2 , False);
end;

procedure TFPagoProv.dbgDocCanjeCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'CCPMOLOC') or (AFieldName = 'CCPMOEXT') then
    begin
       ABrush.Color := clNone;
    end;

end;

procedure TFPagoProv.FormShow(Sender: TObject);
begin
  with dm1 do
  begin
    if trim(dblcBanco.Text) <> '' then
    begin
       if (cdsEgrCaja.FieldByName('ECEstado').Value='I') or (cdsEgrCaja.FieldByName('ECEstado').Value='P') then      //Si está INCOMPLETO o PENDIENTE
       begin
          //focus
          pnlCabecera2.setfocus ;
          perform(CM_DialogKey,VK_TAB,0);
          //
       end;

       if (cdsEgrCaja.FieldByName('ECEstado').Value='C') or (cdsEgrCaja.FieldByName('ECEstado').Value='A') then      //Si está CANCELADO
       begin
          //focus
          pnlBotones.setfocus ;
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
//    ControlFocoEntrada (ctrl,evt_exit) ;
  end ;
   cf1.PonerExits ;

end;

procedure TFPagoProv.dblcOPagoChange(Sender: TObject);
begin
   if FPagoProv.ActiveControl <> dblcOPago then
      exit;
   if Length(dblcOPago.Text)=dblcOPago.LookupTable.FieldByName('OPAGO').size then
   begin
        if dblcOPago.Text=dblcOPago.LookupTable.FieldByName('OPAGO').AsString then
        begin
           //posicionar el clientdataset en esta posicion
           PosicionarOrdenPago;
        end
        else
        begin
          if not dblcOPago.LookupTable.Locate('OPAGO', dblcOPago.Text,[]) then
          begin
            //deseleccionar cabecera y grid
            NoPosicionarOrdenPago;
          end
          else
          begin
            //posicionar el clientdataset  en esta posicion
            PosicionarOrdenPago;
          end;
        end;
   end
   else
   begin
      //deseleccionar cabecera y grid
      NoPosicionarOrdenPago;
   end;
end;

procedure TFPagoProv.dblcOPagoExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then
      exit;

   if dbdtpFPago.Text = '' then
   begin
      if dblcOPago.Text='' then
         ShowMessage('Ingrese Orden de Pago')
      else
         ShowMessage('Orden de Pago Equivocada');
      dblcOPago.SetFocus;
   end;
end;

procedure TFPagoProv.PosicionarOrdenPago;
var
   xSQL : String ;
begin
    // vhn 23/01/2001
    xSQL:='Select * from CXP303 '
         +'Where CIAID=''' +dblcCia.Text  +''' and '
         +      'OPAGO=''' +dblcOPago.Text+''' ';
    DM1.cdsPagoCxP.Close;
    DM1.cdsPagoCxP.DataRequest( xSQL );
    DM1.cdsPagoCxP.Open;

    DM1.cdsPagoCxP.Filtered:=False;

   //recuperación de datos de la orden de pago
///
//    dbdtpFPago.text := dm1.fieldnonulo( DM1.cdsPagoCxP.fieldbyname('OPFPAGO') ) ;
    if not DM1.cdsPagoCxP.fieldbyname('OPFPAGO').IsNUll then
       dbdtpFPago.date := DM1.cdsPagoCxP.fieldbyname('OPFPAGO').AsDateTime
    else
       dbdtpFPago.date := 0 ;
    dbeProv.text := dm1.fieldnonulo( DM1.cdsPagoCxP.fieldbyname('PROV') ) ;
    dbeProvRUC.text := dm1.fieldnonulo( DM1.cdsPagoCxP.fieldbyname('PROVRUC') ) ;
    dbeGiradoA.text := dm1.fieldnonulo( DM1.cdsPagoCxP.fieldbyname('PROVGIRA') ) ;
    dblcTMon.text := dm1.fieldnonulo( DM1.cdsPagoCxP.fieldbyname('TMONID')) ;
    dbeTCambio.text := dm1.fieldnonulo( DM1.cdsPagoCxP.fieldbyname('OPTCAMB')) ;
    dblcBanco.text := dm1.fieldnonulo( DM1.cdsPagoCxP.fieldbyname('BANCOID') ) ;
    dblcCCBco.text := dm1.fieldnonulo( DM1.cdsPagoCxP.fieldbyname('CCBCOID') ) ;
    edtCuenta.text := dm1.fieldnonulo( DM1.cdsPagoCxP.fieldbyname('CUENTAID') ) ;
    dblcFormPago.text := dm1.fieldnonulo( DM1.cdsPagoCxP.fieldbyname('FPAGOID') ) ;
    dbeNoChq.text := dm1.fieldnonulo( DM1.cdsPagoCxP.fieldbyname('OPNOCHQ') ) ;
    RecuperaDescripOPago ;
///
     // vhn 23/01/2001
    xSQL:='Select * from CXP304 '
         +'Where CIAID='''   +dblcCia.Text    +''' and '
         +      'CCPCANJE='''+dblcOPago.Text  +''' ';
    DM1.cdsCanjeCxP.Close;
    DM1.cdsCanjeCxP.DataRequest( xSQL );
    DM1.cdsCanjeCxP.Open;

   z2bbtnSumatCanjeClick(self);

  //No debe haber estado ya grabada
   dbeTCambio.Text := floattostr(DM1.cdsPagoCxPOPTCAMB.Value);
   if DM1.cdsPagoCxPTMONID.Value = dm1.wtMonLoc then
      dbeImporte.Text := floattostr(DM1.cdsPagoCxPOPMTOLOC.Value)
   else
      dbeImporte.Text := floattostr(DM1.cdsPagoCxPOPMTOEXT.Value);

end;
procedure TFPagoProv.NoPosicionarOrdenPago;
var
   xSQL : String ;
begin

   DM1.cdsPagoCxP.Filter:='';
   DM1.cdsPagoCxP.Filter:='CiaId='+''''+''+'''';
   DM1.cdsPagoCxP.Filtered:=True;

   // Estableciendo el filtro para que el detalle del grid aparezca vacio
   // vhn 23/01/2001
   xSQL:='Select * from CXP304 '
        +'Where CIAID='''' and '
        +      'CCPCANJE='''' ';
   DM1.cdsCanjeCxP.Close;
   DM1.cdsCanjeCxP.DataRequest( xSQL );
   DM1.cdsCanjeCxP.Open;
   //3004
end;

procedure TFPagoProv.dbgOtrosCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'DEMTOLOC') or (AFieldName = 'DEMTOEXT') then
       ABrush.Color:=clNone;
end;

procedure TFPagoProv.dblcdCnpChange(Sender: TObject);
begin
   wmodifica:=True;
   dm1.EncuentraDescripcion(dblcdCnp,dbeGlosa) ;
end;

procedure TFPagoProv.dblcdCnpExit(Sender: TObject);
begin
   if not ((Sender as TCustomEdit).Focused) then
      exit;

   dm1.xxExit(dblcdCnp,dbeGlosa,[z2bbtnCancel],'Concepto') ;

end;

procedure TFPagoProv.InhabilitarPaneles;
begin

   pnlDetalle.Enabled  := False;
   pnlBotones.Enabled  := False;
   IniciaPanel;
   pnlActualiza.BringToFront ;
   pnlActualiza.Visible:= True;
   dbeNoReg.Enabled    := True;
   dbeNoReg.Color      := clWindow;
   dbeNoReg.SetFocus;
   establecerfiltrosRegistroEgresos;
end;
procedure TFPagoProv.EdiTarRegistros;
begin
   BlanqueaEdits(pnlActualiza) ;
   dm1.cdsRegCxP.Edit ;                                 //Lo pongo en modo de edicion
   dbeNoReg.Text:=dm1.cdsRegCxPCPNoReg.Value  ;
   dbeNoReg.Enabled:=false;

   dbeNoReg.Enabled := False;
   dbeNoReg.Color   := clBtnFace;
   
   cdsTDiarioDet.Filter := 'TDIARID=''' + dblcTdiario2.Text + '''' ;
   cdsTDiarioDet.Filtered := True ;

   //Recuperacion de los detalles del panel
   if trim(dblcTDoc2.Text)    <> '' then edtTDoc2.Text   := dm1.DisplayDescrip('prvTGE','TGE110','DOCABR','DOCID=''' + dblcTDoc2.Text + '''','DOCABR') ;
   if trim(dblcTDiario2.Text) <> '' then edtTDiario2.text:= dm1.DisplayDescripLocal(dm1.cdsTDiario,'TDIARID',dblctDiario2.Text,'TDIARABR') ;
   if trim(dblcdCnp2.Text)    <> '' then edtCnp2.Text    := dm1.DisplayDescrip('prvTGE','CAJA201','CPTOABR','CPTOID=''' + dblcdCnp2.Text + '''','CPTOABR') ;

   if trim( dblcdAuxDet.Text ) <> '' then
   begin
     dbeAuxDet.Text    :=  dm1.DisplayDescrip('prvTGE','CNT201','AUXABR',
                              'CLAUXID = ''' +
                              dm1.cdsRegCxP.fieldbyname('CLAUXID').AsString
                               + ''' AND AUXID=''' + dblcdAuxDet.Text + '''','AUXABR') ;
     edtClaseDet.Text  :=  dm1.DisplayDescrip('prvTGE','TGE102','CLAUXABR',
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
      if not dm1.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClaseDet.Text ]),[]) then
         Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''') ;

{2107
   dm1.cdsRegCxP.Edit;    //Lo pongo en modo de edicion
   dbeNoReg.Text:=dm1.cdsRegCxPCPNoReg.Value  ;
   dbeNoReg.Enabled:=false;
   //label1.Visible := True;
   dbeNoReg.Enabled := False;
   dbeNoReg.Color   := clBtnFace;
}
end;

procedure TFPagoProv.AdicionarRegistros;
begin
   with dm1 do
   begin
        dbeNoReg.Enabled:=true;
        dbeNoReg.Text:='';
        dbeNoReg.Text := GeneraCorrelativo( dm1.cdsRegCxP , 'CPNOREG' ) ;        
        cdsRegCxP.Insert;
        cdsRegCxPCIAID.Value   := dblcCia.Text;
        cdsRegCxPTDIARID.Value := dblcTDiario.Text;
        cdsRegCxPECANOMM.Value := edtPeriodo.Text;
        cdsRegCxPECNOCOMP.Value:= dbeNoComp.Text;
        // Iniciar Datos, el reg. y su llave ya estan creados
        //cdsRegCxPCPNoReg.Value  := dbeNoReg.Text;
        cdsRegCxPDETCPAG.Value  := strtofloat(dbeTCambio.Text);
        cdsRegCxPDEFCOMP.Value  := dbdtpFComp.Date;
        cdsRegCxPCPFEMIS.Value  := Date;
        cdsRegCxPCPFVCMTO.Value := Date;
        cdsRegCxPCPANOMM.Value  := copy(datetostr(cdsRegCxPDEFCOMP.Value),7,4)
                                  +copy(datetostr(cdsRegCxPDEFCOMP.Value),4,2);
        cdsRegCxPDETCPAG.Value  := dm1.cdsEgrCaja.FieldByName('ECTCAMB').Value;
        cdsRegCxPDEDH.Value     := 'D';     //Inicializo en Debe
        cdsREgCxP.FieldBYName('DETCDOC').AsString := dbeTCambio.Text ;
        dbeNoReg.SetFocus;
   end;
   //blanqueo de descripciones
   edtTDoc2.Text := '' ;
   edtTDiario2.text := '' ;
   edtCnp2.Text := '' ;

   edtClaseDet.Text := '' ;
   dbeAuxDet.Text   := '' ;
   edtTMon2.Text    := ''  ;

   dblcClaseDet.Enabled   := False ;
   dblcdAuxDet.Enabled    := False ;
   dblcdCCosto.Enabled    := False ;


   cdsTDiarioDet.Filter := 'Tdiarid=''''' ;
   cdsTDiarioDet.Filtered := True ;
   if not dm1.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dbeClase1.Text ]),[]) then
      Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''') ;

end;
procedure TFPagoProv.LiberarFiltrosRegistroEgresos;
begin
   dm1.cdsTDoc.Filter:='';
   dm1.cdsTDoc.Filtered:=true;
   dm1.cdsTDiario.Filter:='';
   dm1.cdsTDiario.Filtered:=true;
//   bFlagRecuperacion:=false;

end;

procedure TFPagoProv.EstablecerFiltrosRegistroEgresos;
begin
      dm1.cdsTDoc.Filter:='not ( tdiarid is null) or not (tdiarid2 is null)' ;
      dm1.cdsTDoc.Filtered:=true;
//      bFlagRecuperacion:=True;
end;


procedure TFPagoProv.dbgOtrosDblClick(Sender: TObject);
begin
if dbgOtros.DataSource.DataSet.RecordCount<>0 then
begin
   inHabilitarPaneles;
   editarRegistros;
end;

end;

function TFPagoProv.ValidacionCabecera: Boolean;
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


procedure TFPagoProv.ValidacionCabecera2;
begin

   if length(dblcOPago.Text)=0 then
      raise exception.Create('Falta Orden de Pago');
   if length(dbeTCambio.Text)=0 then
      raise exception.Create('Falta Tipo de Cambio')
   else
      if strtofloat(dbeTCambio.Text)<=0 then
         raise exception.Create('Tipo de Cambio Errado');

   if length(dbeImporte.Text)=0 then
      raise exception.Create('Falta Monto a Pagar')
   else
      if strtofloat(dbeImporte.Text)<=0 then
         raise exception.Create('Importe Errado');

   if length(dblcTDoc.Text)=0 then
      raise exception.Create('Falta Tipo de Documento');
   if length(edtTDoc.Text)=0 then
      raise exception.Create('Tipo de Documento Errado');
   if length(dbeNoDoc.Text)=0 then
      raise exception.Create('Falta Nro.de Documento');
   if length(dbeLote.Text)=0 then
      raise exception.Create('Falta Lote');
   if length(dblcdCnp.Text)=0 then
      raise exception.Create('Falta Concepto');

end;

procedure TFPagoProv.RecuperaDescrip;
begin
{
TSOLsrvCAJA.DescripPagoProv(const xCIAID, xECANOMM, xTDIARID,
  xECNOCOMP: WideString);
   TGE105.BANCONOM, TGE103.TMONDES, TGE106.CCBCODES,
   TGE112.FPAGODES,TGE102.CLAUXABR, TGE110.DOCABR
}
    DescripPagoProv(dblcCia.text,edtPeriodo.text,dblcTDiario.Text,dbeNoComp.text);
    dm1.cdsDescrip.Active := False ;
    dm1.cdsDescrip.Active := True ;
    edtClase2.text := dm1.FieldNoNulo(dm1.cdsDescrip.fieldBYname('CLAUXABR'));
    edtTMon.text := dm1.FieldNoNulo(dm1.cdsDescrip.fieldBYname('TMONABR'));
    edtTDoc.text := dm1.FieldNoNulo(dm1.cdsDescrip.fieldBYname('DOCABR'));
    edtBanco.text := dm1.FieldNoNulo(dm1.cdsDescrip.fieldBYname('BANCOABR'));
    edtCCBco.text := dm1.FieldNoNulo(dm1.cdsDescrip.fieldBYname('CCBCODES'));
    edtFormPago.text := dm1.FieldNoNulo(dm1.cdsDescrip.fieldBYname('FPAGOABR'));
//2504
    edtCia.Text := dm1.FieldNoNulo(dm1.cdsDescrip.fieldBYname('CIADES'));
    edtTDiario.Text := dm1.FieldNoNulo(dm1.cdsDescrip.fieldBYname('TDIARABR')); ;
    dbeFEfec.text := dm1.fieldnonulo(dm1.cdsDescrip.FieldByName('FLUEFEABR') ) ;

end;
procedure TFPagoProv.RecuperaDescripOPago;
begin
//procedure TSOLsrvCAJA.DescripOPago(const xCIAID, xOPAGO: WideString);
//SELECT TGE105.BANCONOM, TGE103.TMONDES, TGE106.CCBCODES, TGE112.FPAGODES
    dm1.DescripOpago(dblcCia.text,dblcOPago.text) ;
    dm1.cdsDescrip.Active := False ;
    dm1.cdsDescrip.Active := True ;
    edtBanco.Text := dm1.FieldNoNulo(dm1.cdsDescrip.FieldByName('BANCOABR'));
    edtCCBco.text := dm1.FieldNoNulo(dm1.cdsDescrip.FieldByName('CCBCODES'));
    edtTMon.text := dm1.FieldNoNulo(dm1.cdsDescrip.FieldByName('TMONABR'));
    edtFormPago.text := dm1.FieldNoNulo(dm1.cdsDescrip.FieldByName('FPAGOABR'));
end;

procedure TFPagoProv.Adiciona;
var
   xSQL : String ;
begin
   // Estableciendo el filtro para el detalle (CAJA301) para mostrar Detalle
   IniciaDatos ;
   xGraboNuevo := False ;
   dm1.cdsRegCxP.Filter := 'CIAID=''''' ;
   dm1.cdsRegCxP.Filtered := True ;
   z2bbtnNuevo.Visible := True ;
   z2bbtnCancel.Visible := True ;
   dblcOPago.Enabled := True ;

   // vhn 23/01/2001
   xSQL:='Select * from CXP304 '
        +'Where CIAID='''' and CCPCANJE='''' ';
   DM1.cdsCanjeCxP.Close;
   DM1.cdsCanjeCxP.DataRequest( xSQL );
   DM1.cdsCanjeCxP.Open;
end;

procedure TFPagoProv.Edita(Comp: structComprobante;cds : Twwclientdataset);
var
   xSQL : String;
begin
// Inicia Datos para que los DBEdit no se vean con datos llenos
   IniciaDatos;
   cdsfiltro :=  cds ;
   dblcCia.Text      :=  Comp.CIAID    ;
   dblcTDiario.Text  :=  Comp.TDIARID  ;
   edtPeriodo.Text   :=  Comp.ECANOMM  ;
   dbeNoComp.Text    :=  Comp.ECNOCOMP ;

   dbeClase1.Text    := DM1.wClaseAux1;
   edtClase2.Enabled := False;

   with DM1 do
   begin

      // vhn 22/01/2001
      xSQL:='Select * from CAJA302 '
           +'Where CIAID='''   +Comp.CIAID   +''' and '
           +      'ECANOMM=''' +Comp.ECANOMM +''' and '
           +      'TDIARID=''' +Comp.TDIARID +''' and '
           +      'ECNOCOMP='''+Comp.ECNOCOMP+''' ';
      DM1.cdsEgrCaja.Close;
      DM1.cdsEgrCaja.DataRequest( xSQL );
      DM1.cdsEgrCaja.Open;

      if cdsEgrCaja.RecordCount = 1 then
      begin
{3004
             if cdsEgrCajaEC_PROCE.Value<>'2' then
             begin
                ShowMessage('Comprobante ya esta registrado por otro Modulo');
                dbeNoComp.Text:='';
                dbeNoComp.SetFocus;
                exit;
             end;
}
             // Asignar desde valores del registro activo
//             dbeOPago.Text    :=cdsEgrCajaECOPAGO.Value;
             dblcOPago.Text := cdsEgrCaja.FieldByName('ECOPAGO').Value;
          //   dbdtpFPago.Text  := DM1.FIELDNOnuLO(cdsEgrCajaECFPAGOP) ;
             //
             if not DM1.cdsEgrCaja.fieldbyname('ECFPAGOP').IsNUll then
                dbdtpFPago.date := DM1.cdsEgrCaja.fieldbyname('ECFPAGOP').AsDateTime
             else
                dbdtpFPago.date := 0 ;
             //
             dbdtpFComp.date  := cdsEgrCaja.FieldByName('ECFCOMP').Value;
             dbeClase1.Text   := cdsEgrCaja.FieldByName('CLAUXID').Value;
//             edtProv.Text   :=cdsEgrCajaPROV.Value;
             dbeProv.Text   :=cdsEgrCaja.FieldByName('PROV').Value;
//             edtProvRuc.Text:=cdsEgrCajaPROVRUC.Value;
             dbeProvRuc.Text:=cdsEgrCaja.FieldByName('PROVRUC').Value;
             dbeGiradoA.Text  :=cdsEgrCaja.FieldByName('ECGIRA').Value;
             dblcTMon.Text    :=cdsEgrCaja.FieldByName('TMONID').Value;
             dbeTCambio.Text  :=floattostr(cdsEgrCaja.FieldByName('ECTCAMB').Value);
             dbeImporte.Text  :=floattostr(cdsEgrCaja.FieldByName('ECMTOORI').Value);
             dblcTDoc.Text    :=cdsEgrCaja.FieldByName('DOCID').Value;
             dbeNoDoc.Text    :=cdsEgrCaja.FieldByName('ECNODOC').Value;
             dblcBanco.Text   :=cdsEgrCaja.FieldByName('BANCOID').Value;
             dblcCCBco.Text   :=cdsEgrCaja.FieldByName('CCBCOID').Value;
             edtCuenta.Text   :=cdsEgrCaja.FieldByName('CUENTAID').Value;
             dblcFormPago.Text:=cdsEgrCaja.FieldByName('FPAGOID').Value;
             dbeNoChq.Text    :=cdsEgrCaja.FieldByName('ECNOCHQ').Value;
             dbeLote.Text     :=cdsEgrCaja.FieldByName('ECLOTE').Value;
             dblcdFEfec.Text  := cdsEgrCaja.FieldByName('FLUEID').AsString ;
//             dblcCnp.Text     :=cdsEgrCajaCPTOID.Value;
             dblcdCnp.Text     :=cdsEgrCaja.FieldByName('CPTOID').Value;
             dbeGlosa.Text    :=cdsEgrCaja.FieldByName('ECGLOSA').Value;
             dbdtpFEmis.date  :=   cdsEgrCaja.FieldbyName('ECFEMICH').AsDateTime ;
             //Recuperar Descripciones
              RecuperaDescrip ;

             //fin de recuperar descripciones
             // Estableciendo el filtro para el detalle (CAJA301) para mostrar Detalle

              // vhn 22/01/2001
              xSQL:='Select * from CAJA301 '
                   +'Where CIAID='''   +Comp.CIAID    +''' and '
                   +      'ECANOMM=''' +Comp.ECANOMM  +''' and '
                   +      'TDIARID=''' +Comp.TDIARID  +''' and '
                   +      'ECNOCOMP='''+Comp.ECNOCOMP +''' ';
              DM1.cdsRegCxP.Close;
              DM1.cdsRegCxP.DataRequest( xSQL );
              DM1.cdsRegCxP.Open;

             // Filtro de la Orden de Pago
             // vhn 23/01/2001
             xSQL:='Select * from CXP304 '
                  +'Where CIAID='''   +dblcCia.Text    +''' and '
                  +      'CCPCANJE='''+dblcOPago.Text  +''' ';
             DM1.cdsCanjeCxP.Close;
             DM1.cdsCanjeCxP.DataRequest( xSQL );
             DM1.cdsCanjeCxP.Open;

             if (cdsEgrCaja.FieldByName('ECEstado').Value='I') or (cdsEgrCaja.FieldByName('ECEstado').Value='P') then      //Si está INCOMPLETO o PENDIENTE
             begin
                // Activar modo de Editado
                cdsEgrCaja.Edit;

                // Estado de componentes
                pnlCabecera1.Enabled := False;    // Desactivar Panel1
                pnlCabecera2.Enabled := True;     // Activar Panel2
                dbgOtrosIButton.Enabled:=True;
                z2bbtnOk.Enabled       := True;
                z2bbtnCancel.Enabled   := True;

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

             if cdsEgrCaja.FieldByName('ECEstado').Value='C' then      //Si está CANCELADO
             begin
                pnlCabecera1.Enabled := False;    // Desactivar Panel1
                pnlCabecera2.Enabled := False;    // Desactivar Panel2
                pnlDetalle.Enabled   := True;     // Activar Panel de Detalle
                pnlBotones.Enabled   := True;     // Activar Panel de Botones
                dbgOtrosIButton.Enabled:=False;
                z2bbtnOk.Enabled       := False;
                z2bbtnCancel.Enabled   := False;

                wbSumat              := False;
                if cdsEgrCaja.FieldByName('ECConta').Value='S' then
                begin  //Esta contabilizado
                   wbCont             := False;
                   lblEstado.Caption  :='Cancelado y Contab.'
                end
                else
                begin
                   wbCont             := True;
                   lblEstado.Caption  :='Cancelado          ';
                end;

                wbNuevo     := True;
                wbImprime   := True;
                wbSube      := False;
                wbGraba     := False;
                wbCancelado := False;
                wbCancel2   := False;
                wbAnula     := False;
                wbChq       := False ;

                ActPnlBotones;
             end;

             if cdsEgrCaja.FieldByName('ECEstado').Value='A' then      // Si esta ANULADO
             begin
                pnlCabecera1.Enabled := False;    // Desactivar Panel1
                pnlCabecera2.Enabled := False;    // Desactivar Panel2
                pnlDetalle.Enabled   := True;     // Activar Panel de Detalle
                pnlBotones.Enabled   := True;     // Activar Panel de Botones

                dbgOtrosIButton.Enabled:=False;
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
             z2bbtnSumatCanjeClick(nil);
      end ;
   end;
   
   (z2bbtnokcab).enabled:=false;
   wmodifica         := False;
   z2bbtnNuevo.Visible := False ;
   z2bbtnCancel.Visible := False ;
   dblcOPago.Enabled := False ;
end;

procedure TFPagoProv.FormCreate(Sender: TObject);
begin

  cdsOPagoElegibles :=  TClientDataSet.Create(self);
  dblcOPago.LookupTable:=cdsOPagoElegibles;

  dm1.ASignaTipoDiario(dblcTDiario,self) ;

  cdsTdiarioDet := TwwClientdataset.Create(Self) ;
  cdsTdiarioDet.CloneCursor(DM1.cdsTDiario ,True) ;
  cdsTdiarioDet.Name := 'cdsTdiarioDet' ;
  dblcTDiario2.LookupTable := cdsTdiarioDet ;


// Crea indice para la tabla de Egreso de Caja (CAJA302)
   DM1.cdsEgrCaja.IndexFieldNames := 'CiaID;TDiarID;ECAnoMM;ECNoComp';

// Crea indice para el Data Set cdsRegCxP (CAJA301)
   DM1.cdsRegCxP.IndexFieldNames := 'CiaID;TDiarID;ECAnoMM;ECNoComp;CPNoReg';

// Crea Indice para la tabla de Orden de Pago (CxP303)
   DM1.cdsPagoCxP.IndexFieldNames := 'CiaId;OPago';

//   DM1.cdsMovCxP.IndexFieldNames  := 'CiaId;TdiarId;CPAnoMes;CPNoReg';
   setlength(A2digitos,1) ;
   A2digitos[0] := dbeImporte ;
   cf1 := TControlFoco.Create ;
    dm1.cdsFEfec.Filter := 'FLUEFE_IS = ''S'' ' ;
    dm1.cdsFEfec.Filtered := True ;

end;

procedure TFPagoProv.AdicIniciaDatos;
var
   xSQL : String ;
begin

   RecuperarCiaUnica(dblcCia,edtCia);
   edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
   if dblccia.text <> '' then
      perform(CM_DialogKey,VK_TAB,0);

   // vhn 23/01/2001
   xSQL:='Select * from CXP304 '
        +'Where CIAID='''' and CCPCANJE='''' ';
   DM1.cdsCanjeCxP.Close;
   DM1.cdsCanjeCxP.DataRequest( xSQL );
   DM1.cdsCanjeCxP.Open;
end;

procedure TFPagoProv.ActualizaSaldosCaja;
begin
    if trim(dblcCCBco.TEXT) <> '' then
    begin
       dm1.ActSdoTlfn(dblcBanco.text,dblcCCBCo.Text,
                      dm1.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                      DBDTPfcOMP.DATE) ;
       dm1.ActSdoMen(dblcBanco.text,dblcCCBCo.Text,
                      dm1.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                      DBDTPfcOMP.DATE) ;
    end ;                  
end;

procedure TFPagoProv.ConfiguraAccesos;
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

procedure TFPagoProv.Proc_Admin;
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

procedure TFPagoProv.Proc_Consul;
begin
    pnlCabecera1.Enabled := False ;
    pnlCabecera2.Enabled := False ;
    pnlDeTalle.Enabled := True ;
    pnlBotones.Enabled := False ;
end;

procedure TFPagoProv.Libera_Admin;
begin
    Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFPagoProv.Libera_Consul;
begin

end;

procedure TFPagoProv.LibConfigAccesos;
begin
    if DM1.wAdmin = 'G' then
       Libera_Admin
    else
    begin
       if DM1.wModo = 'C' then
          Libera_Consul ;
    end ;
end;

procedure TFPagoProv.Z2bbtnEmiChqClick(Sender: TObject);
var
   strChq : structChq ;
   ArchivoReporte : string ;
begin
   if trim(dblcCCBco.Text) <> '' then
   begin
        dm1.RecuperarDatos('TGE106','*',
                           'BANCOID = ''' + dblcBanco.text+ ''' AND CCBCOID = ''' + dblcCCBco.Text+ '''') ;
        ArchivoReporte := dm1.cdsRec.fieldbyname('CCFMTCHQ').ASString ;
        with strChq do
        begin
          ppFileName    := ArchivoReporte  ;
          ppGiradoA     := dbeGiradoA.Text ;
          ppImporte     := floattostrf(strtocurr(trim(dbeImporte.Text)),fffixed,10,2) ;
          ppMontoLetras := strNum(strtofloat(ppImporte)) ;
        end ;
   end ;
end;

procedure TFPagoProv.dbeImporteEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFPagoProv.dbeImporteExit(Sender: TObject);
begin
    if strTmp <> TCustomEdit(Sender).text then
    begin
       TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text) ;
    end ;
end;

procedure TFPagoProv.RecCptosDifC;
begin
    if trim(dblcCCBco.Text) = '' then
    begin
       if not dm1.RecuperarDatos('TGE105','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP','BANCOID=''' + dblcBanco.Text + '''' )  then
          Raise exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio') ;
    end
    else
    begin
       if not dm1.RecuperarDatos('TGE106','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP','BANCOID=''' + dblcBanco.Text +
                                 ''' AND CCBCOID=''' + dblcCCBco.Text + '''' )  then
          Raise exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio') ;
    end ;
    wCptoGan  := dm1.cdsRec.fieldbyname('CPTODIFG').AsString ;
    wCptoPer  := dm1.cdsRec.fieldbyname('CPTODIFP').AsString ;
    wCtaGan   := dm1.cdsRec.fieldbyname('CTADIFG').AsString ;
    wCtaPer   := dm1.cdsRec.fieldbyname('CTADIFP').AsString ;
end;

procedure TFPagoProv.dblcClaseDetChange(Sender: TObject);
begin
     if not (sender as tcustomedit).focused then
        Exit ;
     DM1.EncuentraDescripcion( dblcClaseDet , edtClaseDet ) ;
     dblcdAuxDet.Enabled := True ;
     wModifica := TRUE ;
end;

procedure TFPagoProv.dblcClaseDetEnter(Sender: TObject);
begin
   strTmp := dblcClaseDet.Text ;
end;

procedure TFPagoProv.dblcClaseDetExit(Sender: TObject);
var
   Tmp : String ;
begin
    Tmp := StrTmp ;
    dm1.xxExit(dblcClaseDet,edtClaseDet,[z2bbtnCancel3],'Clase del Auxiliar','A') ;
    StrTmp := Tmp ;
    if (dblcClaseDet.Text <> strTmp) and (trim(edtClaseDet.text) <> '') then
    begin
       dblcdAuxDet.Text := '' ;
       dbeAuxDet.Text := '' ;
    end ;
end;

procedure TFPagoProv.dblcdAuxChange2(Sender: TObject);
var
   Tmp : String ;
begin

   if not (sender as TcustomEdit).focused then
      Exit ;
   Tmp := StrTmp ;
   dm1.EncuentraDescripcion ( dblcdAuxDet , dbeAuxDet ) ;
   StrTmp := Tmp ;

   wModifica := True ;
end;

procedure TFPagoProv.dblcdAuxEnter2(Sender: TObject);
begin
    if trim(dblcClaseDet.Text) = '' then
    begin
       dblcClaseDet.SetFocus ;
       exit ;
    end ;

    strTmp := dblcdAuxDet.Text ;
end;

procedure TFPagoProv.dblcdAuxExit2(Sender: TObject);
begin
   if dblcClaseDet.Focused then
   begin
      if (trim(dbeAuxDet.Text) = '' ) then
      begin
         TCustomEdit(Sender).Text := '' ;
         Exit ;
      end ;
   end ;
   dm1.xxExit(dblcdAuxDet,dbeAuxDet,[Z2bbtnCancel3],'Auxiliar') ;
end;

procedure TFPagoProv.dblcdCnp2Exit2(Sender: TObject);
var
   ssql,xWhere : String;
begin
 //** 21/03/2001 - pjsv
  ssql := 'CPTOID='+quotedstr(dblcdCnp2.text);
  edtCnp2.Text := DM1.DisplayDEscrip('prvTGE','CAJA201','CPTODES',ssql,'CPTODES');
  if Trim(edtCnp2.Text) = '' then
   begin
    DM1.cdsRegCxP.FieldByName('CUENTAID').AsString := '' ;
    dblcdAuxDet.Enabled := False ;
    dblcdCCosto.Enabled := False ;
   end
  else
   begin
     DM1.cdsRegCxP.FieldByName('CUENTAID').AsString := dblcdCnp2.text;
     //Busca y Habilita
      xWhere:='CIAID=''' + dblccia.Text + ''' AND CUENTAID=''' +
               DM1.cdsRegCxP.FieldByName('CUENTAID').AsString + '''' ;
      if Length(DM1.DisplayDescrip('prvTGE','TGE202','CUENTAID',xWhere,'CuentaId'))>0 then
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
          else  dblcdCCosto.Enabled := False ;
        if DM1.DisplayDescrip('prvTGE','TGE202','CTA_AUX',xWhere,'CTA_AUX') = 'S' then
            dblcdAuxDet.Enabled := True
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

procedure TFPagoProv.wwDBEdit1Change22(Sender: TObject);
begin
    wmodifica:=True;
end;
procedure TFPagoProv.dblcTDiario2Change2(Sender: TObject);
begin
   if not dblcTDiario2.Focused then
      Exit ;
   DM1.EncuentraDescripcion(dblctDiario2,edtTDiario2) ;
end;

procedure TFPagoProv.dblcTDiario2Exit2(Sender: TObject);
begin
  dm1.xxExit(dblcTDiario2,edtTDiario2,[Z2bbtnCancel3],'Tipo de Diario') ;
end;

procedure TFPagoProv.dblcTDiario2NotInList2(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   showMessage('El tipo de Diario que ingresó '+#13+
               'No Está Registrado para Este tipo de Documento');
   dblcTDiario2.SetFocus;
   edtTDiario2.Text:='';
   (sender as TwwDBLookUpCombo).text:='';
end;

procedure TFPagoProv.dblcTDoc2Change2(Sender: TObject);
begin
   if not dblcTDoc2.Focused then
      Exit ;
   dm1.EncuentraDescripcion( dblcTDoc2,edtTDoc2) ;

end;

procedure TFPagoProv.dblcTDoc2Enter(Sender: TObject);
begin
   strTmp := dblcTDoc2.Text ;
end;
procedure TFPagoProv.dblcTDoc2Exit2(Sender: TObject);
//aqui esta el codigo al momento de a salida
var
   Filtro : String ;
   Tmp : String ;
begin

   Tmp := StrTmp ;
   dm1.xxExit(dblcTDoc2,edtTDoc2,[z2bbtnCancel3],'Tipo de Documento') ;
   StrTmp := Tmp ;
   if (trim(dblcTDoc2.text)<>'') and (dblcTDoc2.Text <> StrTmp) then
   begin
      //Filtra y Blanquea
      dm1.cdsTDoc.Locate('DOCID',VarArrayOf([dblcTDoc2.text]),[]);
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
procedure TFPagoProv.FormDestroy(Sender: TObject);
begin
   cf1.Free ;
end;

procedure TFPagoProv.dblcdFEfecEnter(Sender: TObject);
begin
   strTmp := dblcdFEfec.Text ;
end;

procedure TFPagoProv.dblcdFEfecExit(Sender: TObject);
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

procedure TFPagoProv.ActualizaFiltro;
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

procedure TFPagoProv.AsignaCDSFiltro(cds: TwwClientDataset);
begin
    cdsFiltro := cds ;
end;


procedure TFPagoProv.z2bbtnImprimeClick(Sender: TObject);
var
   Comprobante : RCabComprobante;
   xsql : string;
begin
   if DM1.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' THEN
   begin
      ShowMessage('Este Movimiento no Está Contabilizado');
      exit;
   end ;
   with Comprobante do begin
      CIAID    := dblcCia.Text;
      TDIARID  := dblcTDiario.Text;
      CiaDes   := edtCia.Text;
      Diario   := edtTDiario.Text;
      Proveedor:= '';
      Glosa    := dbeGlosa.Text;
      Lote     := dbeLote.Text;
      TipoDoc  := edtTDoc.Text;
      TipoCamb := dbeTCambio.Text;
      Periodo  := edtPeriodo.Text;
      NoComp   := dbeNoComp.Text;
      NoDoc    := dbeNoDoc.Text;
      Cuenta   := dblcCCBco.Text;
      Banco    := edtBanco.text;
      NumChq   := dbeNoChq.text;
      Moneda   := edtTMon.text;
      Importe  := DM1.cdsEgrCaja.Fieldbyname('ECMTOLOC').AsString;
      xsql := 'TMONID='+quotedstr(dblcTMon.text);
      Tmoneda  := Dm1.displayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC');
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

procedure TFPagoProv.DescripPagoProv(const xCIAID, xECANOMM, xTDIARID, xECNOCOMP: String);
var  xSQL : String ;
begin
  if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
    xSQL := 'SELECT TGE105.BANCOABR, TGE103.TMONABR, TGE106.CCBCODES, '      +
                  'TGE112.FPAGOABR, TGE102.CLAUXABR, TGE110.DOCABR , '       +
                  'TGE101.CIADES,TGE104.TDIARABR , TGE217.FLUEFEABR '        +
            'FROM  CAJA302 '                                                 +
                 'LEFT JOIN TGE105 ON (CAJA302.BANCOID = TGE105.BANCOID) '  +
                 'LEFT JOIN TGE106 ON (CAJA302.BANCOID = TGE106.BANCOID) '  +
                                  'AND (CAJA302.CCBCOID = TGE106.CCBCOID) '  +
                 'LEFT JOIN TGE103 ON (CAJA302.TMONID = TGE103.TMONID) '    +
                 'LEFT JOIN TGE112 ON (CAJA302.FPAGOID = TGE112.FPAGOID) '  +
                 'LEFT JOIN TGE102 ON (CAJA302.CLAUXID = TGE102.CLAUXID) '  +
                 'LEFT JOIN TGE110 ON (CAJA302.DOCID = TGE110.DOCID) '      +
                 'LEFT JOIN TGE101 ON (CAJA302.CIAID = TGE101.CIAID) '      +
                 'LEFT JOIN TGE104 ON (CAJA302.TDIARID = TGE104.TDIARID) '  +
                 'LEFT JOIN TGE217 ON (CAJA302.FLUEID = TGE217.FLUEFEID) '  +
            'WHERE CAJA302.CIAID= '''   + xCIAID    +''' AND '               +
                   'CAJA302.TDIARID=''' + xTDIARID  +''' AND '               +
                   'CAJA302.ECANOMM=''' + xECANOMM  +''' AND '               +
                   'CAJA302.ECNOCOMP='''+ xECNOCOMP +''' '
  else
    if DM1.SRV_D = 'ORACLE' then
      xSQL := 'SELECT TGE105.BANCOABR, TGE103.TMONABR, TGE106.CCBCODES, '  +
                    'TGE112.FPAGOABR, TGE102.CLAUXABR, TGE110.DOCABR , '   +
                    'TGE101.CIADES,TGE104.TDIARABR , TGE217.FLUEFEABR '    +
              'FROM CAJA302, TGE105, TGE106, TGE103, TGE112, '             +
                      'TGE102, TGE110, TGE101, TGE104, TGE217 '            +
              'WHERE CAJA302.CIAID= '''   + xCIAID    +''' AND '           +
                     'CAJA302.TDIARID=''' + xTDIARID  +''' AND '           +
                     'CAJA302.ECANOMM=''' + xECANOMM  +''' AND '           +
                     'CAJA302.ECNOCOMP='''+ xECNOCOMP +''' '               +
                     ' AND (CAJA302.BANCOID = TGE105.BANCOID(+) ) '        +
                     ' AND (CAJA302.BANCOID = TGE106.BANCOID(+) ) '        +
                     ' AND (CAJA302.CCBCOID = TGE106.CCBCOID(+) ) '        +
                     ' AND (CAJA302.TMONID = TGE103.TMONID(+) ) '          +
                     ' AND (CAJA302.FPAGOID = TGE112.FPAGOID(+) ) '        +
                     ' AND (CAJA302.CLAUXID = TGE102.CLAUXID(+) ) '        +
                     ' AND (CAJA302.DOCID = TGE110.DOCID(+) ) '            +
                     ' AND (CAJA302.CIAID = TGE101.CIAID(+) ) '            +
                     ' AND (CAJA302.TDIARID = TGE104.TDIARID(+) ) '        +
                     ' AND (CAJA302.FLUEID = TGE217.FLUEFEID(+) ) '        ;
  DM1.cdsDescrip.close ;
  DM1.cdsDescrip.dataRequest(xSQL) ;
end;


end.

unit Caja205;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient , CAJADM;

type
  TFTransferencia = class(TForm)
    pnlCabecera1: TPanel;
    lblCia: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    pnlCabecera2: TPanel;
    lblTCambio: TLabel;
    dbeTCambio: TwwDBEdit;
    z2bbtnCancel: TBitBtn;
    z2bbtnOK: TBitBtn;
    pnlDetTrans: TPanel;
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
    dbeNoComp: TwwDBEdit;
    dbeLote: TwwDBEdit;
    lblLote: TLabel;
    dbeGlosa: TwwDBEdit;
    lblGlosa: TLabel;
    lblConcepto: TLabel;
    dbgTrans: TwwDBGrid;
    dblcTDoc: TwwDBLookupCombo;
    lblTDoc: TLabel;
    edtTDoc: TEdit;
    dbeNoDoc: TwwDBEdit;
    lblNoDoc: TLabel;
    lblEstado: TLabel;
    z2bbtnAnula: TBitBtn;
    z2bbtnCalc: TBitBtn;
    dbgTransIButton: TwwIButton;
    gbOrigen: TGroupBox;
    dblcBanco: TwwDBLookupCombo;
    lblBanco: TLabel;
    edtBanco: TEdit;
    lblCCBco: TLabel;
    dblcCCBco: TwwDBLookupCombo;
    edtCCBco: TEdit;
    lblCuenta: TLabel;
    edtCuenta: TEdit;
    gbDestino: TGroupBox;
    lblBanco2: TLabel;
    lblCCBco2: TLabel;
    lblCuenta2: TLabel;
    dblcBanco2: TwwDBLookupCombo;
    edtbanco2: TEdit;
    dblcCCBco2: TwwDBLookupCombo;
    edtCuenta2: TEdit;
    edtCCBco2: TEdit;
    pnlActualiza: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    dblcTMon2: TwwDBLookupCombo;
    dbeImporte2: TwwDBEdit;
    edtTMon2: TEdit;
    edtMtoLoc: TwwDBEdit;
    edtMtoExt: TwwDBEdit;
    z2bbtnOK2: TBitBtn;
    z2bbtnCancel3: TBitBtn;
    Label4: TLabel;
    dbeTCambio2: TwwDBEdit;
    Label8: TLabel;
    dbeNoReg: TwwDBEdit;
    dbeCheque: TwwDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    dblcBanco3: TwwDBLookupCombo;
    edtBanco3: TEdit;
    dbeFPago: TwwDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dblcCia2: TwwDBLookupCombo;
    edtCia2: TEdit;
    Label15: TLabel;
    dbdtpFComp2: TwwDBDateTimePicker;
    Label16: TLabel;
    edtPeriodo2: TEdit;
    Label17: TLabel;
    dblcTDiario2: TwwDBLookupCombo;
    edtTDiario2: TEdit;
    dbeNoComp2: TwwDBEdit;
    Label18: TLabel;
    z2bbtnOKCab: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label19: TLabel;
    Label20: TLabel;
    dblcdCnp: TwwDBLookupComboDlg;
    procedure IniciaDatos;
    procedure IniciaPanel;
    procedure Contab_EgrCaja;
    procedure Contab_Trans(wDH,wCuenta:string);
    procedure Contabiliza;
    function  ValidaCampo:Boolean;
    procedure ActPnlBotones;
    procedure dblcCiaExit(Sender: TObject);
    procedure z2bbtnCancelClick(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dblcBancoChange(Sender: TObject);
    procedure dblcCCBcoChange(Sender: TObject);
    procedure z2bbtnCalcClick(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);
//    procedure dblcCnpExit(Sender: TObject);
    procedure dblcTDocChange(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcCCBcoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure z2bbtnSumatClick(Sender: TObject);
    procedure z2bbtnSubeClick(Sender: TObject);
    procedure z2bbtnCancel2Click(Sender: TObject);
    procedure z2bbtnNuevoClick(Sender: TObject);
    procedure z2bbtnGrabaClick(Sender: TObject);
    procedure z2bbtnCanceladoClick(Sender: TObject);
    procedure z2bbtnContClick(Sender: TObject);
    procedure z2bbtnAnulaClick(Sender: TObject);
    procedure dbeTCambioChange(Sender: TObject);
    procedure dbgTransIButtonClick(Sender: TObject);
    procedure z2bbtnCancel3Click(Sender: TObject);
    procedure dbeNoRegExit(Sender: TObject);
    procedure z2bbtnOK2Click(Sender: TObject);
    procedure dblcTMon2Exit(Sender: TObject);
    procedure dblcTMon2Change(Sender: TObject);
    procedure dbeImporte2Exit(Sender: TObject);
    procedure dbgTransKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgTransCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dblcBanco2Change(Sender: TObject);
    procedure dblcBanco2Exit(Sender: TObject);
    procedure dblcCCBco2Change(Sender: TObject);
    procedure dblcCCBco2Exit(Sender: TObject);
    procedure dblcBanco3Change(Sender: TObject);
    procedure dblcBanco3Exit(Sender: TObject);
    procedure dbeFPagoChange(Sender: TObject);
    procedure rgTipTranExit(Sender: TObject);
    procedure dbeLoteExit(Sender: TObject);
    procedure dbeNoDocChange(Sender: TObject);
    procedure dbeLoteChange(Sender: TObject);
//    procedure dblcCnpChange(Sender: TObject);
    procedure dbeGlosaChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure dblcTDiarioChange(Sender: TObject);
    procedure dblcTDiario2Change(Sender: TObject);
    procedure dblcTDiario2Exit(Sender: TObject);
    procedure dblcCiaChange(Sender: TObject);
    procedure dbdtpFCompChange(Sender: TObject);
    procedure dblcdCnpChange(Sender: TObject);
    procedure dblcdCnpExit(Sender: TObject);
    procedure dbgTransCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    Procedure CodAuxTipMon;
    Procedure AdicionaRegistro;
    Procedure EditaRegistro;
    procedure dbgTransDblClick(Sender: TObject);
    procedure dbeFPagoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
    procedure dbeNoComp2Exit(Sender: TObject);
    procedure dbeNoCompChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    cdsEgrCajaDestino:TWWClientdataset;
    Bandera : Boolean ;
    procedure BuscaComprobanteOrigen;
    procedure BuscaComprobanteDestino;    
    procedure HabilitaBotonCabecera(Panel: TPanel;Boton:TButton);
  public
    { Public declarations }
  end;

var
  FTransferencia: TFTransferencia;
  wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,
  wbcancel2: Boolean;
  wmodifica: Boolean;
  
implementation
uses CAJAUTIL, Caja001;
{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}

procedure TFTransferencia.IniciaDatos;
begin

   pnlCabecera1.Enabled  := True;
   pnlCabecera2.Enabled  := False;
   pnlDetTrans.Enabled    := False;
   pnlBotones.Enabled    := False;
   //pnlActualiza.Visible  := False;

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
   dbdtpFComp.Date   := date; // Fecha de Comprob.
   edtPeriodo.Enabled:= False;
   edtPeriodo.Text   := '';   // Periodo
   dblcTDiario.Text  := '';   // Tipo de Diario
   edtTDiario.Enabled:= False;
   edtTDiario.Text   := '';   // Descripción del T.Diario
   dbeNoComp.Text    := '';   // Comprobante
   dbeTCambio.Text   := '';   // Tipo de Cambio
   dblcTDoc.Text     := '';   // Tipo de Documento
   edtTDoc.Enabled   := False;
   edtTDoc.Text      := '';   // Descripción del T.Doc
   dbeNoDoc.Text     := '';   // Nro.Documento
   dblcBanco.Text    := '';   // Código de Banco
   dblcBanco2.Text   := '';   // Código de Banco
   edtBanco.Enabled  := False;
   edtBanco.Text     := '';   // Descripción de Banco
   dblcCCBco.Enabled := False;
   dblcCCBco.Text    := '';   // Cuenta Corriente del Banco
   dblcCCBco2.Text   := '';   // Cuenta Corriente del Banco
   edtCCBco.Enabled  := False;
   edtCCBco.Text     := '';   // Descripción de la Cuenta Corriente
   edtCuenta.Enabled := False;
   edtCuenta.Text    := '';   // Descripción de la Cuenta Contable Principal
   edtCuenta2.Text    := '';   // Descripción de la Cuenta Contable Principal
   dbeLote.Text      := '';   // Lote
//   dblcCnp.Text      := '';   // Concepto
   dblcdCnp.Text      := '';   // Concepto
   dbeGlosa.Text     := '';   // Glosa
   dbeGlosa.Text     := '';   // Glosa
//   rgTipTran.ItemIndex:=-1;   // No seleccionado
//   rgTipTran.ItemIndex:=0;   // No seleccionado

   lblEstado.Caption := '';   //Inicializar el Estado
   dbgTransIButton.Enabled:=True;
   dbgTrans.KeyOptions:=[dgEnterToTab];
   dbgTrans.ColumnByName('DEMTOLOC').FooterValue:='';
   dbgTrans.ColumnByName('DEMTOEXT').FooterValue:='';

   // Limpiando filtros si lo tuvieran
   DM1.cdsEgrCaja.Filtered:=False;
   //wmcKKK esta linea es patra filtrar los datos del clientdataset del destino
   cdsEgrCajaDestino.Filtered:=False;

   DM1.cdsTrans.Filtered :=False;
   DM1.cdsCntCaja.Filtered:=False;

   // Estableciendo el filtro para que el detalle del grid aparezca vacio
   DM1.cdsTrans.Filter:='';
   DM1.cdsTrans.Filter:='CiaID='+''''+''+'''';
   DM1.cdsTrans.Filtered:=True;

// ubica en primer dato a pedir
//   dblcCia.SetFocus;
   RecuperarCiaUnica(dblcCia,edtCia);
   edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
   HabilitaBotonCabecera(pnlCabecera1,z2bbtnOKCab);
   if dblccia.text <> '' then
      perform(CM_DialogKey,VK_TAB,0);


end;

{*******************************************************
PRIMER PANEL - DATOS INICIALES DE LA CABECERA
*******************************************************}

procedure TFTransferencia.dblcCiaExit(Sender: TObject);
begin
if edtCia.Text='' then
begin
    if dblcCia.Text='' then
      ShowMessage('Ingrese Compañía')
    else
      ShowMessage('La Compañía que ha Ingresado'+#13 +
                  'No está registrada');
    (Sender as twincontrol).SetFocus;
end
end;

procedure TFTransferencia.dbdtpFCompExit(Sender: TObject);
var
   Periodo:String;
begin
if edtPeriodo.text='' then
begin
    if dbdtpFComp.date=0 then
      ShowMessage('Ingrese Fecha de Comprobante')
    else
      ShowMessage('Ingrese La Fecha Correctamente');
    (Sender as twincontrol).SetFocus;
end
else
begin
    Periodo:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
    if dbdtpFComp.Date<>dbdtpFComp2.Date then
         dbdtpFComp2.Date:=dbdtpFComp.Date;
    if edtPeriodo.Text<>Periodo then
       edtPeriodo.Text:=Periodo;
    if edtPeriodo2.text<>Periodo then
       edtPeriodo2.text:=Periodo;

end;
end;
{begin
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
end;}

procedure TFTransferencia.dblcTDiarioExit(Sender: TObject);
{var xWhere:string;
begin
   xWhere:='TDiarID='+''''+dblcTDiario.Text+'''';
   edtTDiario.Text:=DM1.DisplayDescrip('prvTGE','TGE104','*',xWhere,'TDiarDes');
   if length(edtTDiario.Text)=0 then
   begin
      ShowMessage('Tipo de Diario Errado');
      dblcTDiario.SetFocus;
   end
   else begin
      xWhere:='CiaID='+''''+dblcCia.Text+''''+' and ECAnoMM='+
             ''''+edtPeriodo.Text+''''+' and TDiarID='+''''+
             dblcTDiario.Text+'''';
      dbeNoComp.text:=DM1.UltimoNum('prvCaja','CAJA302','ECNoComp',xWhere);
      dbeNoComp.SetFocus;
   end;
end;}
begin
if edtTDiario.Text='' then
begin
    if dblcTDiario.Text='' then
      ShowMessage('Ingrese Tipo de Diario')
    else
      ShowMessage('El Tipo de Diario que ha Ingresado'+#13 +
                  'No está registrado');
    (Sender as twincontrol).SetFocus;
end
end;


procedure TFTransferencia.dbeNoCompExit(Sender: TObject);
begin
    if (trim(dbeNoComp.text)<>'') and
                  (length(trim(dbeNoComp.text)) <> DM1.cdsEgrCajaECNOCOMP.DisplayWidth) then
    begin
       dbeNoComp.text :=dm1.StrZero(dbeNoComp.text,DM1.cdsEgrCajaECNOCOMP.DisplayWidth);
    end
end;

{*******************************************************
SEGUNDO PANEL - DATOS ADICIONALES DE LA CABECERA
*******************************************************}

procedure TFTransferencia.dbeTCambioChange(Sender: TObject);
begin
{  if length(dbeTCambio.Text)>0 then
     dbeTCambio.Text:=floattostrf(strtofloat(dbeTCambio.Text), ffFixed, 10, 2);}
   wmodifica:=True;
end;

procedure TFTransferencia.dblcTDocChange(Sender: TObject);
var
   xWhere,xDes :String;
begin
   if  length(dblcTDoc.Text)=dblcTDoc.LookupTable.FieldByName('DOCID').Size then
   begin
	   if dblcTDoc.Text=dblcTDoc.LookupTable.FieldByName('DOCID').AsString then
	   begin
	      if edtTDoc.Text<>dblcTDoc.LookupTable.FieldByName('DOCDES').AsString then
	      begin
	            edtTDoc.Text:=dblcTDoc.LookupTable.FieldByName('DOCDES').AsString;
	      end;
	   end
	   else
	   begin
             xWhere:='DOCID='+''''+dblcTDoc.Text+'''';
	     xDes:=DM1.DisplayDescrip('prvTGE','TGE110','*',xWhere,'DOCDES');

	     if xDes='' then
	     begin
	          edtTDoc.text:='';
	     end
	     else
	     begin
	          edtTDoc.text:=DM1.cdsQry.fieldbyname('DOCDES').AsString;
	     end;

{	     if not dblcTDoc.LookupTable.Locate('DOCID', dblcTDoc.Text,[]) then
	     begin
	          edtTDoc.text:='';
	     end
	     else
	     begin
	          edtTDoc.text:=dblcTDoc.LookupTable.fieldbyname('DOCDES').AsString;
	     end;}
	   end;
   end
   else
   begin
           edtTDoc.text:='';
   end;
end;

procedure TFTransferencia.dblcTDocExit(Sender: TObject);
begin
if z2bbtnCancel.Focused then exit;
if edtTDoc.Text='' then
begin
    if dblcTDoc.Text='' then
      ShowMessage('Ingrese Tipo de Documento')
    else
      ShowMessage('El Tipo de Documento que ha Ingresado'+#13 +
                  'No está registrado');
    (Sender as twincontrol).SetFocus;
end
end;


procedure TFTransferencia.dblcBancoChange(Sender: TObject);
var xWhere:string;
begin
   DblcCCBco.Text:='';
   edtCuenta.Text:='';
   xWhere:='BANCOID='+''''+dblcBanco.Text+'''';
   edtBanco.Text:=DM1.DisplayDescrip('prvTGE','TGE105','*',xWhere,'BANCONOM');
   if length(edtBanco.Text)>0 then begin
       if DM1.cdsqry.FieldByName('BcoTipCta').Value='C' then begin //Si es CAJA
          dblcCCBco.Enabled:=False;
          dblcCCBco.Text:='';
          edtCuenta.Text:=DM1.cdsqry.FieldByName('CuentaID').Value; //Se toma de la tabla Bancos
//wmckkk
{          if rgTipTran.ItemIndex=1 then   //Si es Ingreso la otra cuenta se calcula de la remesa de la primera
             edtCuenta2.Text:=DM1.cdsqry.FieldByName('RemesaID').Value;}
//wmckkk
       end
       else begin  //Si es BANCO
          dblcCCBco.Enabled:=True;   //Habilitar CtaCte
          edtCuenta.Text   :='';     //La Cuenta se tomara posteriormente por medio de la CtaCte
          DM1.cdsCCBco.Filtered:=False;
          DM1.cdsCCBco.Filter:='';   //Filtrar la lista de CtaCte por Banco
          DM1.cdsCCBco.Filter:='BANCOID='+''''+dblcBanco.Text+'''';
          DM1.cdsCCBco.Filtered:=True;
          dblcCCBco.Enabled:=true;
       end;
   end;
   wmodifica:=True;
end;

procedure TFTransferencia.dblcBancoExit(Sender: TObject);
begin
   if length(edtBanco.Text)=0 then
      dblcBanco.Text:='';
end;

procedure TFTransferencia.dblcCCBcoChange(Sender: TObject);
var xWhere:string;
begin
   xWhere:='BANCOID='+''''+dblcBanco.text+''''+' AND CCBCOID='+''''+dblcCCBco.Text+'''';
   edtCCBco.Text :=DM1.DisplayDescrip('prvTGE','TGE106','*',xWhere,'CCBCODES');
   if length(edtCCBco.Text)>0 then begin
      edtCuenta.Text:=DM1.DisplayDescrip('prvTGE','TGE106','*',xWhere,'CTAPRINC');
      //wmckkk
{      if rgTipTran.ItemIndex=1 then   //Si es Ingreso la otra cuenta se calcula de la remesa de la primera
         edtCuenta2.Text:=DM1.DisplayDescrip('prvTGE','TGE106','*',xWhere,'CtaRemes');}
      //wmckkk
   end;
   wmodifica:=True;
end;

procedure TFTransferencia.dblcCCBcoExit(Sender: TObject);
begin
   if length(edtCCBco.Text)=0 then
      dblcCCBco.Text:='';
end;

{procedure TFTransferencia.dblcCnpExit(Sender: TObject);
var xWhere:string;
begin
   xWhere:='CptoID='+''''+dblcCnp.text+'''';
   dbeGlosa.Text:=DM1.DisplayDescrip('prvCAJA','CAJA201','*',xWhere,'CptoDes');
   dbeGlosa.Text:=DM1.DisplayDescrip('prvCxP','CxP201','*',xWhere,'CptoDes');
   if length(dbeGlosa.Text)=0 then
      dblcCnp.Text:='';
end;}

procedure TFTransferencia.z2bbtnOKClick(Sender: TObject);
Var xWhere,aux:string;
begin
 // consistencia de Datos
   if length(dblcCia.Text)=0 then raise exception.Create('Falta Codigo de Compañia');
   if length(edtCia.Text)=0 then raise exception.Create('Codigo de Compañia Errado');
   if length(dblcTDiario.Text)=0 then raise exception.Create('Falta Tipo de Diario');
   if length(edtTDiario.Text)=0 then raise exception.Create('Tipo de Diario Errado');

   //if rgTipTran.ItemIndex<0 then raise exception.Create('Falta Tipo de Transferencia');

   if length(dblcTDoc.Text)=0 then raise exception.Create('Falta Tipo de Documento');
   if length(edtTDoc.Text)=0 then raise exception.Create('Tipo de Documento Errado');
   if length(dbeNoDoc.Text)=0 then raise exception.Create('Falta Nro.de Documento');

   if length(dbeTCambio.Text)=0 then raise exception.Create('Falta Tipo de Cambio')
   else
      if strtofloat(dbeTCambio.Text)<=0 then raise exception.Create('Tipo de Cambio Errado');

   if length(dbeLote.Text)=0 then raise exception.Create('Falta Lote');
//   if length(dblcCnp.Text)=0 then raise exception.Create('Falta Concepto');
   if length(dblcdCnp.Text)=0 then raise exception.Create('Falta Concepto');


   if length(dblcBanco.Text)=0 then raise exception.Create('Falta definir Banco Origen');
   if length(edtBanco.Text)=0 then raise exception.Create('Codigo de Banco Origen Errado');

   if dblcCCBco.Enabled=True then begin
      if length(dblcCCBco.Text)=0 then raise exception.Create('Falta Cuenta Corriente Banco Origen');
      if length(edtCCBco.Text)=0 then raise exception.Create('Codigo de Cta Cte Origen Errado');
   end;

   if length(dblcBanco2.Text)=0 then raise exception.Create('Falta definir Banco Destino');
   if length(edtBanco2.Text)=0 then raise exception.Create('Codigo de Banco Destino Errado');

   if dblcCCBco2.Enabled=True then begin
      if length(dblcCCBco2.Text)=0 then raise exception.Create('Falta Cuenta Corriente Banco Destino');
      if length(edtCCBco2.Text)=0 then raise exception.Create('Codigo de Cta Cte Destino Errado');
   end;

   if (dblcBanco.Text=dblcBanco2.Text) and (dblcCCBco.Text=dblcCCBco2.Text) then
   begin
      ShowMessage('La Cuenta de Destino debe ser diferente'+#13+
                   'Que la Cuenta de Origen');
      Exit;
   end;

   // Nota: El "raise" termina el procedure o function si es que se da la consistencia
   // En este punto ya se ha probado todas las consistencias y ya se puede grabar

   // Actualizamos el Client Data Set de Egr.Caja (CAJA302)

   with DM1 do begin
     cdsEgrCaja.Edit;
     cdsEgrCajaCIAID.Value   :=dblcCia.Text;
     cdsEgrCajaTDIARID.Value :=dblcTDiario.Text;
     cdsEgrCajaECANOMM.Value :=edtPeriodo.Text;
     cdsEgrCajaECNOCOMP.Value:=dbeNoComp.Text;

     cdsEgrCajaECFCOMP.Value :=dbdtpFComp.Date;


     //wmckkk
     //aqui escribo los datos que se necesitan recuperar del destino de la trasferencia
     cdsEgrCaja.FieldByName('TDIARIO2').AsString :=dblcTDiario2.Text;
     cdsEgrCaja.FieldByName('ECNOCOMP2').AsString:=dbeNoComp2.Text;
     //wmckkk


{     if rgTipTran.ItemIndex = 0 then
        cdsEgrCajaEC_IE.Value:='E';

     if rgTipTran.ItemIndex = 1 then
        cdsEgrCajaEC_IE.Value:='I';}

        //wmckkk
        cdsEgrCajaEC_IE.Value:='E';
        //wmckkk

     //cdsEgrCajaECEMICH.Value:=;
     //cdsEgrCajaECFPAGOP.Value:=dbdtpFPago.Date;
     //cdsEgrCajaECFCOBCH.Value:=;
     cdsEgrCajaDOCID.Value   :=dblcTDoc.Text;
     cdsEgrCajaECNODOC.Value :=dbeNoDoc.Text;
     cdsEgrCajaECTCAMB.Value :=strtofloat(dbeTCambio.Text);

     cdsEgrCajaBANCOID.Value :=dblcBanco.Text;
//wmc777
//     cdsEgrCajaBANCOID2.Value :=dblcBanco2.Text;
     cdsEgrCajaCCBCOID.Value :=dblcCCBco.Text;
//wmc888     cdsEgrCajaCCBCOID2.Value :=dblcCCBco2.Text;
//     cdsEgrCajaCPTOID.Value  :=dblcCnp.Text;
     cdsEgrCajaCPTOID.Value  :=dblcdCnp.Text;
     cdsEgrCajaCUENTAID.Value:=edtCuenta.Text;
//wmckkk
//     cdsEgrCajaCUENTAID2.Value:=edtCuenta2.Text;
//wmckkk
     cdsEgrCajaECGLOSA.Value :=dbeGlosa.Text;
     cdsEgrCajaECLOTE.Value  :=dbeLote.Text;
     //cdsEgrCajaECAPROB.Value :=;
     //cdsEgrCajaECELABO.Value :=;
     cdsEgrCajaECESTADO.Value :='I';
     //cdsEgrCajaECCONTA.Value :=;
     //cdsEgrCajaUSER.Value :=;
     //cdsEgrCajaFREG.Value :=;
     //cdsEgrCajaHREG.Value :=;
//     DATE(''' + formatdatetime('yyyy-mm-dd',dbdtpFComp.Date)+''')' ;
//     xWhere:='FECHA='+''''+datetostr(dbdtpFComp.date)+'''';
     xWhere:='FECHA=DATE(''' + formatdatetime('yyyy-mm-dd',dbdtpFComp.Date)+''')' ;
     aux   :=DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
     cdsEgrCajaECANO.Value  := cdsqry.FieldByName('FecAno').Value;
     cdsEgrCajaECMM.Value   := cdsqry.FieldByName('FecMes').Value;
     cdsEgrCajaECDD.Value   := cdsqry.FieldByName('FecDia').Value;
     cdsEgrCajaECSS.Value   := cdsqry.FieldByName('FecSS').Value;
     cdsEgrCajaECSEM.Value  := cdsqry.FieldByName('FecSem').Value;
     cdsEgrCajaECTRI.Value  := cdsqry.FieldByName('FecTrim').Value;
     cdsEgrCajaECAASS.Value := cdsqry.FieldByName('FecAASS').Value;
     cdsEgrCajaECAASem.Value:= cdsqry.FieldByName('FecAASem').Value;
     cdsEgrCajaECAATri.Value:= cdsqry.FieldByName('FecAATri').Value;
     //cdsEgrCajaFLAGVAR.Value :=;
     cdsEgrCajaEC_PROCE.Value:='4';
   end;
   //wmckkk
   //Codigo de llenado de datos del clientdataset de ingresos
     cdsEgrCajaDestino.Edit;
     cdsEgrCajaDestino.FieldByName('CIAID').AsString   :=dblcCia.Text;
     cdsEgrCajaDestino.FieldByName('TDIARID').AsString :=dblcTDiario2.Text;
     cdsEgrCajaDestino.FieldByName('ECANOMM').AsString :=edtPeriodo.Text;
     cdsEgrCajaDestino.FieldByName('ECNOCOMP').AsString:=dbeNoComp2.Text;

     cdsEgrCajaDestino.FieldByName('ECFCOMP').Value :=dbdtpFComp.Date;
     cdsEgrCajaDestino.FieldByName('EC_IE').AsString:='I';
     //cdsEgrCajaECEMICH.Value:=;
     //cdsEgrCajaECFPAGOP.Value:=dbdtpFPago.Date;
     //cdsEgrCajaECFCOBCH.Value:=;

     //wmckkk
     //aqui escribo los datos que se necesitan recuperar el origen de la trasferencia
     cdsEgrCajaDestino.FieldByName('TDIARIO2').AsString :=dblcTDiario.Text;
     cdsEgrCajaDestino.FieldByName('ECNOCOMP2').AsString:=dbeNoComp.Text;
     //wmckkk

     cdsEgrCajaDestino.FieldByName('DOCID').AsString   :=dblcTDoc.Text;
     cdsEgrCajaDestino.FieldByName('ECNODOC').AsString :=dbeNoDoc.Text;
     cdsEgrCajaDestino.Fieldbyname('ECTCAMB').value :=strtofloat(dbeTCambio.Text);

     cdsEgrCajaDestino.FieldByName('BANCOID').AsString :=dblcBanco2.Text;
     cdsEgrCajaDestino.FieldbyName('CCBCOID').AsString :=dblcCCBco2.Text;
     cdsEgrCajaDestino.FieldByName('CPTOID').AsString  :=dblcdCnp.Text;
     cdsEgrCajaDestino.FieldbyName('CUENTAID').AsString:=edtCuenta2.Text;
     cdsEgrCajaDestino.FieldByName('ECGLOSA').AsString :=dbeGlosa.Text;
     cdsEgrCajaDestino.FieldbyName('ECLOTE').AsString  :=dbeLote.Text;
     //cdsEgrCajaECAPROB.Value :=;
     //cdsEgrCajaECELABO.Value :=;
     cdsEgrCajaDestino.FieldbyName('ECESTADO').AsString :='I';
     //cdsEgrCajaECCONTA.Value :=;
     //cdsEgrCajaUSER.Value :=;
     //cdsEgrCajaFREG.Value :=;
     //cdsEgrCajaHREG.Value :=;
     cdsEgrCajaDestino.FieldbyName('ECANO').AsString  := DM1.cdsqry.FieldByName('FecAno').Value;
     cdsEgrCajaDestino.FieldbyName('ECMM').AsString   := DM1.cdsqry.FieldByName('FecMes').Value;
     cdsEgrCajaDestino.FieldbyName('ECDD').AsString   := DM1.cdsqry.FieldByName('FecDia').Value;
     cdsEgrCajaDestino.FieldbyName('ECSS').AsString   := DM1.cdsqry.FieldByName('FecSS').Value;
     cdsEgrCajaDestino.FieldbyName('ECSEM').AsString  := DM1.cdsqry.FieldByName('FecSem').Value;
     cdsEgrCajaDestino.FieldbyName('ECTRI').AsString  := DM1.cdsqry.FieldByName('FecTrim').Value;
     cdsEgrCajaDestino.FieldbyName('ECAASS').AsString := DM1.cdsqry.FieldByName('FecAASS').Value;
     cdsEgrCajaDestino.FieldbyName('ECAASem').AsString:= DM1.cdsqry.FieldByName('FecAASem').Value;
     cdsEgrCajaDestino.FieldbyName('ECAATri').AsString:= DM1.cdsqry.FieldByName('FecAATri').Value;
     //cdsEgrCajaFLAGVAR.Value :=;
     cdsEgrCajaDestino.FieldByname('EC_PROCE').Value:='7';

   //wmckkk

   // Actualizamos el Detalle mostrado en el grid ante posibles cambios del
   // Tipo de Cambio
   if not dm1.cdsTrans.Eof then begin   //Hay documentos en el detalle
      dm1.cdsTrans.DisableControls;
      dm1.cdsTrans.First;
      While not dm1.cdsTrans.Eof do Begin
        dm1.cdsTrans.Edit;
        DM1.cdsTransTXTCAMB.Value  := strtofloat(dbeTCambio.Text);
        if DM1.cdsTransTMONID.Value = dm1.wTMonLoc then begin
           DM1.cdsTransTXMTOLOC.Value:=DM1.cdsTransTXMTOORI.Value;
           DM1.cdsTransTXMTOEXT.Value:=DM1.cdsTransTXMTOORI.Value/DM1.cdsEgrCajaECTCAMB.Value;
        end
        else begin
           DM1.cdsTransTXMTOLOC.Value:=DM1.cdsTransTXMtoOri.Value*DM1.cdsEgrCajaECTCAMB.Value;
           DM1.cdsTransTXMTOEXT.Value:=DM1.cdsTransTXMtoOri.Value;
        end;
        dm1.cdsTrans.Next;
      end;
      dm1.cdsTrans.First ;
      dm1.cdsTrans.EnableControls;
   end;
   //Actualizamos el Footer
   z2bbtnSumatClick(sender);

   // Estado de los componentes
   pnlCabecera1.enabled  := False;
   pnlCabecera2.enabled  := False;
   pnlDetTrans.enabled    := True;
   pnlBotones.Enabled    := True;
   ActPnlBotones;
   // Estado de los botones
   z2bbtnOk.Enabled        := False;
   z2bbtnCancel.Enabled    := False;
end;

procedure TFTransferencia.z2bbtnCancelClick(Sender: TObject);
begin
   DM1.cdsEgrCaja.CancelUpdates;
   //wmckkk
   cdsEgrCajaDestino.CancelUpdates;
   //wmckkk

   DM1.cdsTrans.CancelUpdates;
   IniciaDatos;
end;

procedure TFTransferencia.z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('C:\windows\calc.exe',1);  //Activa la calculadora del Windows
end;

{*******************************************************
CUARTO PANEL - BOTONES
*******************************************************}
procedure TFTransferencia.z2bbtnSumatClick(Sender: TObject);
Var
   xRegAct : TBookMark;
   xMtoLoc, xMtoExt: Real;
begin
   With DM1 Do Begin
      cdsTrans.DisableControls;
      xRegAct := cdsTrans.GetBookmark;
      xMtoLoc := 0;
      xMtoExt := 0;
      cdsTrans.First ;
      While not cdsTrans.Eof do Begin
         xMtoLoc := xMtoLoc + cdsTransTXMTOLOC.Value;
         xMtoExt := xMtoExt + cdsTransTXMTOEXT.Value;
         cdsTrans.Next;
      end;
      dbgTrans.ColumnByName('TXMTOLOC').FooterValue:=floattostrf(xMtoLoc, ffFixed, 10, 2);
      dbgTrans.ColumnByName('TXMTOEXT').FooterValue:=floattostrf(xMtoExt, ffFixed, 10, 2);

      cdsTrans.GotoBookmark(xRegAct);
      cdsTrans.FreeBookmark(xRegAct);
      cdsTrans.EnableControls;
   end;
end;

procedure TFTransferencia.z2bbtnSubeClick(Sender: TObject);
begin
   DM1.cdsEgrCaja.Edit;
   //wmckkk
   cdsEgrCajaDestino.Edit;
   //wmckkk
   DM1.cdsTrans.Edit;

   pnlCabecera2.Enabled:= True;
   pnlDetTrans.Enabled  := False;
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

procedure TFTransferencia.z2bbtnCancel2Click(Sender: TObject);
begin
   if MessageDlg('¿Anular los cambios?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then begin
      DM1.cdsEgrCaja.CancelUpdates;
      //wmckkk
      cdsEgrCajaDestino.CancelUpdates;
      //wmckkk
      DM1.cdsTrans.CancelUpdates;
      IniciaDatos;
   end;
end;

procedure TFTransferencia.z2bbtnNuevoClick(Sender: TObject);
begin
   if DM1.cdsEgrCajaECEstado.Value ='I' then begin
      if wmodifica then
      begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      end;
      if MessageDlg('¿Grabar e Iniciar un Nuevo Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin
         IniciaDatos;
      end;
   end
   else
   begin
      IniciaDatos;
   end;
end;

procedure TFTransferencia.z2bbtnGrabaClick(Sender: TObject);
begin
   if DM1.cdsEgrCajaECEstado.Value='I' then
   begin
      if MessageDlg('¿Grabar?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
      begin
         DM1.cdsEgrCaja.ApplyUpdates(0);
         //wmckkk
         cdsEgrCajaDestino.ApplyUpdates(0);
         //wmckkk
         DM1.cdsTrans.ApplyUpdates(0);
         z2bbtnSumatClick(sender);
         ShowMessage('Grabacion OK');

         z2bbtnNuevo.Enabled    := True;
         z2bbtnCancelado.Enabled:= True;
         z2bbtnAnula.Enabled    := True;
         z2bbtnImprime.Enabled  := True;
         wmodifica:=False;
      end
   end
   else
   begin
       ShowMessage('Imposible Grabar');
   end;
end;


procedure TFTransferencia.z2bbtnCanceladoClick(Sender: TObject);
begin
   if DM1.cdsEgrCajaECEstado.Value='I' then begin
      if wmodifica then begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      end;
      if MessageDlg('¿Efectuar la Cancelacion del Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then begin

         DM1.cdsEgrCaja.Edit;
         DM1.cdsEgrCajaECEstado.Value:='C';
         DM1.cdsEgrCaja.ApplyUpdates(0);

         //wmckkk
         cdsEgrCajaDestino.Edit;
         cdsEgrCajaDestino.FieldbyName('ECEstado').AsString:='C';
         cdsEgrCajaDestino.ApplyUpdates(0);
         //wmckkk

         z2bbtnSumatClick(sender);

         dbgTransIButton.Enabled:=False;
         z2bbtnSumat.Enabled    := False;
         z2bbtnCont.Enabled     := True;
         z2bbtnSube.Enabled     := False;
         z2bbtnGraba.Enabled    := False;
         z2bbtnCancelado.Enabled:= False;
         z2bbtnCancel2.Enabled  := False;
         z2bbtnAnula.Enabled    := False;
         lblEstado.Caption    :='Cancelado          ';
      end;
   end
   else begin
      ShowMessage('Imposible Cancelar');
   end;
end;

function TFTransferencia.ValidaCampo:Boolean;
var xWhere,aux:string;
begin
     Result:=True;
     with DM1 do begin

        if length(cdsTransTXNOREG.Value)=0 then begin  //No Registro
           ShowMessage('Falta No Registro');
           Result:=False;
           exit;
        end
        else begin
           if length(cdsTransTXNOREG.Value)<6 then begin
              ShowMessage('Codigo de Registro Errado');
              Result:=False;
              exit;
           end;
        end;

        if length(cdsTransTMONID.Value)=0 then begin //Tipo de Moneda
           ShowMessage('Falta Tipo de Moneda');
           Result:=False;
           exit;
        end
        else begin
           xWhere:='TMONID='+''''+cdsTransTMONID.Value+'''';
           aux   :=DisplayDescrip('prvTGE','TGE103','*',xWhere,'TMONDES');
           if length(aux)=0 then begin
              ShowMessage('Codigo de Tipo de Moneda Errado');
              Result:=False;
              exit;
           end;
        end;

        if length(cdsTransTXTPAGO.Value)=0 then begin
           ShowMessage('Falta especificar Tipo de Pago');
           Result:=False;
           exit;
        end;

        if dblcBanco3.Enabled=True then begin
           if length(cdsTransTXNOCHQ.Value)=0 then begin
              ShowMessage('Falta Cheque');
              Result:=False;
              exit;
           end;
        end;

        if cdsTransTXTCAMB.Value<=0 Then begin // Tipo de Cambio Detalle
           ShowMessage('Tipo de Cambio debe ser mayor que cero');
           Result:=False;
           exit;
        end;

        if cdsTransTXMTOORI.Value<=0 Then begin   //Importe
           ShowMessage('Importe debe ser mayor que cero');
           Result:=False;
           exit;
        end;

    end; {DM1}
end;

procedure TFTransferencia.Contab_EgrCaja;
begin
    dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsEgrcajaCIAID.Value;
    dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsEgrCajaTDIARID.Value;
    dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsEgrCajaECANOMM.Value;
    dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsEgrCajaECNOCOMP.Value;
    dm1.cdsCntCajaDCLOTE.Value  :=  dm1.cdsEgrCajaECLOTE.Value;
    dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsEgrCajaDOCID.Value;
    //dm1.cdsCntCajaDCSERIE.Value :=  ;
    dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsEgrCajaECNODOC.Value;
    dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsEgrCajaECFCOMP.Value;
    //dm1.cdsCntCajaDCFEMIS.Value :=;
    //dm1.cdsCntCajaDCFVCMTO.Value:=;
    dm1.cdsCntCajaCPTOID.Value  :=  dm1.cdsEgrCajaCPTOID.Value;
    dm1.cdsCntCajaCUENTAID.Value:=  dm1.cdsEgrCajaCUENTAID.Value;
    //dm1.cdsCntCajaCLAUXID.Value :=  ; No va porque la cuenta 10 no lleva auxiliar
    //dm1.cdsCntCajaDCAUXID.Value :=  ; No va porque la cuenta 10 no lleva auxiliar
    //dm1.cdsCntCajaCCOSID.Value  :=  ;
    dm1.cdsCntCajaDCDH.Value    :=  'H';
    dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsEgrCajaECTCAMB.Value;
    //dm1.cdsCntCajaDCTCAMPR.Value:=  ;    No se usa porque se llena del detalle
    dm1.cdsCntCajaTMONID.Value  :=  dm1.cdsEgrCajaTMONID.Value;
    dm1.cdsCntCajaDCMTOORI.Value:=  dm1.cdsEgrCajaECMTOORI.Value;
    dm1.cdsCntCajaDCMTOLO.Value :=  dm1.cdsEgrCajaECMTOLOC.Value;
    dm1.cdsCntCajaDCMTOEXT.Value:=  dm1.cdsEgrCajaECMTOEXT.Value;
    //dm1.cdsCntCajaDCESTADO.Value:=;
    dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
    //dm1.cdsCntCajaDCFLAAUT.Value:=;
    //dm1.cdsCntCajaDCUSER.Value  :=;
    //dm1.cdsCntCajaDCFREG.Value  :=;
    //dm1.cdsCntCajaDCHREG.Value  :=;
    dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsEgrCajaECANO.Value;
    dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsEgrCajaECMM.Value;
    dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsEgrCajaECDD.Value;
    dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsEgrCajaECSS.Value;
    dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsEgrCajaECSEM.Value;
    dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsEgrCajaECTRI.Value;
    dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsEgrCajaECAASS.Value;
    dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsEgrCajaECAASEM.Value;
    dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsEgrCajaECAATRI.Value;
    //dm1.cdsCntCajaFLAGVAR.Value :=;
end;

procedure TFTransferencia.Contab_Trans(wDH,wCuenta:string);
begin
    dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsEgrCajaCIAID.Value;
    dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsEgrCajaTDIARID.Value;
    dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsEgrCajaECANOMM.Value;
    dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsEgrCajaECNOCOMP.Value;
    //dm1.cdsCntCajaDCLOTE.Value  :=  ;
    dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsEgrCajaDOCID.Value;
    //dm1.cdsCntCajaDCSERIE.Value :=  ;
    dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsEgrCajaECNODOC.Value;
    dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsEgrCajaECFCOMP.Value;
    //dm1.cdsCntCajaDCFEMIS.Value :=  ;
    //dm1.cdsCntCajaDCFVCMTO.Value:=  ;
    dm1.cdsCntCajaCPTOID.Value  :=  dm1.cdsEgrCajaCPTOID.Value;
    dm1.cdsCntCajaCUENTAID.Value:=  wCuenta;
    //dm1.cdsCntCajaCLAUXID.Value :=  ; //Aqui se toma de la cabecera
    //dm1.cdsCntCajaDCAUXID.Value :=  ; //Aqui se toma de la cabecera
    //dm1.cdsCntCajaCCOSID.Value  :=  ;
    dm1.cdsCntCajaDCDH.Value    :=  wDH;
    dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsTransTXTCAMB.Value;
    //dm1.cdsCntCajaDCTCAMPR.Value:=  ;
    dm1.cdsCntCajaTMONID.Value  :=  dm1.cdsTransTMONID.Value;
    dm1.cdsCntCajaDCMTOORI.Value:=  dm1.cdsTransTXMTOORI.Value;
    if dm1.cdsTransTMONID.Value = dm1.wtMonLoc then begin
       dm1.cdsCntCajaDCMTOLO.Value := dm1.cdsTransTXMTOLOC.Value;
       dm1.cdsCntCajaDCMTOEXT.Value:= dm1.cdsTransTXMTOLOC.Value / dm1.cdsTransTXTCAMB.Value;
    end
    else begin
       dm1.cdsCntCajaDCMTOEXT.Value:= dm1.cdsTransTXMTOEXT.Value;
       dm1.cdsCntCajaDCMTOLO.Value := dm1.cdsTransTXMTOEXT.Value * dm1.cdsTransTXTCAMB.Value;
    end;

    //dm1.cdsCntCajaDCESTADO.Value:=;
    dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
    //dm1.cdsCntCajaDCFLAAUT.Value:=;
    //dm1.cdsCntCajaDCUSER.Value  :=;
    //dm1.cdsCntCajaDCFREG.Value  :=;
    //dm1.cdsCntCajaDCHREG.Value  :=;
    dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsEgrCajaECANO.Value;
    dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsEgrCajaECMM.Value;
    dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsEgrCajaECDD.Value;
    dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsEgrCajaECSS.Value;
    dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsEgrCajaECSEM.Value;
    dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsEgrCajaECTRI.Value;
    dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsEgrCajaECAASS.Value;
    dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsEgrCajaECAASEM.Value;
    dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsEgrCajaECAATRI.Value;
    //dm1.cdsCntCajaFLAGVAR.Value :=;}
end;

procedure TFTransferencia.Contabiliza;
var xRegAct : TBookMark;
begin
    // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera
    //DM1.cdsCntCaja.Insert;
    //Contab_EgrCaja;

    dm1.cdsTrans.DisableControls;
    xRegAct := dm1.cdsTrans.GetBookmark;
    dm1.cdsTrans.First ;

   // GENERA LOS REGISTROS DE "DEBE/HABER"
{    While not dm1.cdsTrans.Eof do Begin
       if rgTipTran.ItemIndex=0 then begin   // Egresos
          dm1.cdsCntCaja.Insert;
          Contab_Trans('H',edtCuenta.Text);
          dm1.cdsCntCaja.Insert;
          Contab_Trans('D',edtCuenta2.Text);
       end
       else begin                            // Ingresos
          dm1.cdsCntCaja.Insert;
          Contab_Trans('D',edtCuenta.Text);
          dm1.cdsCntCaja.Insert;
          Contab_Trans('H',edtCuenta2.Text);
       end;
       dm1.cdsTrans.Next;
    end;
    dm1.cdsTrans.GotoBookmark(xRegAct);
    dm1.cdsTrans.FreeBookmark(xRegAct);
    dm1.cdsTrans.EnableControls;}

    While not dm1.cdsTrans.Eof do
    Begin
       // Egresos
      dm1.cdsCntCaja.Insert;
      Contab_Trans('H',edtCuenta.Text);
      dm1.cdsCntCaja.Insert;
      Contab_Trans('D',edtCuenta2.Text);
      dm1.cdsTrans.Next;
    end;
    dm1.cdsTrans.GotoBookmark(xRegAct);
    dm1.cdsTrans.FreeBookmark(xRegAct);
    dm1.cdsTrans.EnableControls;

    //Actualizamos en la tabla de Contabilidad
    DM1.cdsCntCaja.ApplyUpdates(0);
end;

procedure TFTransferencia.z2bbtnContClick(Sender: TObject);
begin
   if DM1.cdsEgrCajaECEstado.Value='C' then begin
     if MessageDlg('¿Contabilizar y Generar Asientos Automaticos?',mtConfirmation,
                  [mbYes, mbNo], 0)=mrYes then begin

       Contabiliza;             // Realiza la generacion del Asiento

       DM1.cdsEgrCaja.Edit;
       DM1.cdsEgrCajaECConta.Value:='S';   //Establece como Contabilizado el flag
       DM1.cdsEgrCaja.ApplyUpdates(0);
       z2bbtnCont.Enabled := False;
       lblEstado.Caption  :='Cancelado y Contab.'
     end;
   end
   else begin
       ShowMessage('Imposible Contabilizar');
   end;
end;

procedure TFTransferencia.z2bbtnAnulaClick(Sender: TObject);
begin
    if DM1.cdsEgrCajaECEstado.Value='I' then begin

      if MessageDlg('¿Anular Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then begin

         DM1.cdsEgrCaja.CancelUpdates;
         //wmckkk
         cdsEgrCajaDestino.CancelUpdates;
         //wmckkk
         DM1.cdsTrans.CancelUpdates;

         DM1.cdsEgrCaja.Edit;
         DM1.cdsEgrCajaECEstado.Value:='A';
         DM1.cdsEgrCaja.ApplyUpdates(0);

         //wmckkk
         cdsEgrCajaDestino.Edit;
         cdsEgrCajaDestino.FieldByName('ECEstado').AsString:='A';
         cdsEgrCajaDestino.ApplyUpdates(0);
         //wmckkk

         dbgTransIButton.Enabled:=False;
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
    else begin
       ShowMessage('Imposible Anular Comprobante');
    end;
end;

procedure TFTransferencia.ActPnlBotones;
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

procedure TFTransferencia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DM1.cdsEgrCaja.CancelUpdates;
   //wmckkk
   cdsEgrCajaDestino.CancelUpdates;
   //wmckkk
   DM1.cdsTrans.CancelUpdates;

   // Limpiamos los filtros
   DM1.cdsEgrCaja.Filtered:=False;
   //wmckkk
   cdsEgrCajaDestino.Filtered:=False;
   //wmckkk
   DM1.cdsTrans.Filtered :=False;
   DM1.cdsCntCaja.Filtered:=False;
   DM1.cdsCCBco.Filtered  :=False;
end;

procedure TFTransferencia.dbgTransIButtonClick(Sender: TObject);
begin
     pnlDetTrans.Enabled  := False;
     pnlBotones.Enabled  := False;
     pnlActualiza.Visible:= True;
     pnlActualiza.BringtoFront ;

     AdicionaRegistro
end;

procedure TFTransferencia.z2bbtnCancel3Click(Sender: TObject);
begin
     if dm1.cdsTrans.State = dsInsert then
        dm1.cdsTrans.Delete
     else begin
        dm1.cdsTrans.Cancel;
     end;
     PnlActualiza.Visible := False;
     pnlDetTrans.Enabled   := True;
     pnlBotones.Enabled   := True;
     z2bbtnSumatClick(sender);    // Al salir hay que totalizar
end;

procedure TFTransferencia.dbeNoRegExit(Sender: TObject);
begin
   if not z2bbtnCancel3.Focused then
   begin
      dbeNoReg.Text:=dm1.strzero(dbeNoReg.Text,6);
      if strtoint(dbeNoReg.Text)=0 then
      begin     // NoRegistro
         dbeNoReg.Text:='';
         ShowMessage('No es valido el No Registro');
         dbeNoReg.SetFocus;
         exit;
      end;
      DM1.cdsTransTXNoReg.AsString := dbeNoReg.Text;

   end
   else
      dbeNoReg.Text:='';
end;

{var
   aux     : string;
begin
   if not bbtnCancel3.Focused then begin

      dbeNoReg.Text:=dm1.strzero(dbeNoReg.Text,6);

      if strtoint(dbeNoReg.Text)=0 then begin     // NoRegistro
         dbeNoReg.Text:='';
         ShowMessage('No es valido el No Registro');
         dbeNoReg.SetFocus;
         exit;
      end;

       With DM1 do begin
          // Busco en cdsTrans que el NoReg no se duplique
          aux:=dbeNoReg.Text;
          cdsTrans.SetKey;
          cdsTransCIAID.Value   := dblcCia.Text;
          cdsTransTDIARID.Value := dblcTDiario.Text;
          cdsTransECANOMM.Value := edtPeriodo.Text;
          cdsTransECNOCOMP.Value:= dbeNoComp.Text;
          cdsTransTXNOREG.Value := aux;

          if cdsTrans.GotoKey then begin //Se hace la busqueda y lo encuentra
             cdsTrans.Edit;    //Lo pongo en modo de edicion
             label1.Visible := True;
             label1.Caption := 'En Edicion'
          end
          else begin
             dm1.cdsTrans.Insert;
             dm1.cdsTransCIAID.Value   := dblcCia.Text;
             dm1.cdsTransTDIARID.Value := dblcTDiario.Text;
             dm1.cdsTransECANOMM.Value := edtPeriodo.Text;
             dm1.cdsTransECNOCOMP.Value:= dbeNoComp.Text;
             // Iniciar Datos, el reg. y su llave ya estan creados
             cdsTransTXNoReg.Value   := dbeNoReg.Text;
             cdsTransTXTCAMB.Value   := strtofloat(dbeTCambio.Text);
             label1.Visible := True;
             label1.Caption := 'Nuevo     '
          end;
       end;
       dbeNoReg.Enabled := False;
       dbeNoReg.Color   := clBtnFace;
   end;
end;}

procedure TFTransferencia.z2bbtnOK2Click(Sender: TObject);
begin
   if DM1.cdsTrans.State=dsInsert then
       if EncuentraDuplicado(DM1.cdsTrans,'TXNoReg',dbeNoReg.Text) then
          begin
            ShowMessage('Numero de Registro duplicado');
            dbeNoReg.SetFocus;
            exit;
          end;

   if not ValidaCampo then
      ShowMessage('No se puede grabar')
   else begin
      dm1.cdsTrans.Post;
      ShowMessage('Grabacion Ok');
      //dbgTransIButtonClick(Sender);
      wmodifica:=True;
      if not dbeNoReg.Enabled then
      begin
           PnlActualiza.Visible := False;
           pnlDetTrans.Enabled   := True;
           pnlBotones.Enabled   := True;
           z2bbtnSumatClick(sender);    // Al salir hay que totalizar
           //quitar los filtros que se hubieran establecido
//           liberarfiltrosregistroegresos;
      end
      else
      begin
           //adicionarRegistros;
           dbgTransIButtonClick(Sender);
           dbeNoReg.SetFocus;
      end;

   end;
end;

{procedure TFTransferencia.dblcTMon2Exit(Sender: TObject);
var xWhere, aux: string;
begin
      xWhere:='TMonId='+''''+dblcTMon2.Text+'''';
      aux:=DM1.DisplayDescrip('prvTGE','TGE103','*',xWhere,'TMONDES');
      if (length(aux)>0) and (DM1.cdsTransTXMTOORI.Value>0) then begin
        if DM1.cdsTransTMONID.Value = dm1.wTMonLoc then begin
           DM1.cdsTransTXMTOLOC.Value:=DM1.cdsTransTXMTOORI.Value;
           DM1.cdsTransTXMTOEXT.Value:=DM1.cdsTransTXMTOORI.Value/DM1.cdsEgrCajaECTCAMB.Value;
        end
        else begin
           DM1.cdsTransTXMTOLOC.Value:=DM1.cdsTransTXMtoOri.Value*DM1.cdsEgrCajaECTCAMB.Value;
           DM1.cdsTransTXMTOEXT.Value:=DM1.cdsTransTXMtoOri.Value;
        end;
      end
      else begin
           DM1.cdsTransTXMTOLOC.Value:=0;
           DM1.cdsTransTXMTOEXT.Value:=0;
      end;
end;]

{procedure TFTransferencia.dblcTMon2Change(Sender: TObject);
var xWhere:string;
begin
   xWhere:='TMonId='+''''+dblcTMon2.Text+'''';
   edtTMon2.Text:=DM1.DisplayDescrip('prvTGE','TGE103','*',xWhere,'TMONDES');
end;}

procedure TFTransferencia.dbeImporte2Exit(Sender: TObject);
var xWhere, aux: string;
begin
      if  z2bbtnCancel3.Focused then
          exit;
      if  z2bbtnCancel3.Focused then
          exit;
      xWhere:='TMONID='+''''+DM1.cdsTransTMONID.Value+'''';
      aux:=DM1.DisplayDescrip('prvTGE','TGE103','*',xWhere,'TMONDES');
      if (length(aux)>0) and (DM1.cdsTransTXMTOORI.Value>0) then begin
        if DM1.cdsTransTMONID.Value = dm1.wTMonLoc then begin
           DM1.cdsTransTXMTOLOC.Value:=DM1.cdsTransTXMTOORI.Value;
           DM1.cdsTransTXMTOEXT.Value:=DM1.cdsTransTXMTOORI.Value/DM1.cdsEgrCajaECTCAMB.Value;
        end
        else begin
           DM1.cdsTransTXMTOLOC.Value:=DM1.cdsTransTXMtoOri.Value*DM1.cdsEgrCajaECTCAMB.Value;
           DM1.cdsTransTXMTOEXT.Value:=DM1.cdsTransTXMtoOri.Value;
        end;
      end
      else begin
           DM1.cdsTransTXMTOLOC.Value:=0;
           DM1.cdsTransTXMTOEXT.Value:=0;
      end;
end;

procedure TFTransferencia.dbgTransKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (dbgTransIButton.Enabled=True) and (dm1.cdsEgrCajaECEstado.Value='I') and (key = VK_DELETE) and (ssCtrl in Shift) then begin
      if (dm1.cdsTrans.RecordCount=0) then
          ShowMessage('No hay registros')
       else begin
          if MessageDlg('¿Eliminar Registro?',mtconfirmation,[mbYes,mbNo],0)=mrYes then begin
             dm1.cdsTrans.Delete;    // Borro en el original..
             z2bbtnSumatClick(sender);    // Al salir hay que totalizar
         end;
      end;
   end;
end;


procedure TFTransferencia.dbgTransCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
{    if (Field.FieldName = 'TXMTOLOC') or (Field.FieldName = 'TXMTOEXT') then
           AFont.Color := clBlue;}
end;

procedure TFTransferencia.dblcBanco2Change(Sender: TObject);
var xWhere:string;
begin
   DblcCCBco2.Text:='';
   xWhere:='BANCOID='+''''+dblcBanco2.Text+'''';
   edtBanco2.Text:=DM1.DisplayDescrip('prvTGE','TGE105','*',xWhere,'BANCONOM');
   if length(edtBanco2.Text)>0 then begin
       if DM1.cdsqry.FieldByName('BcoTipCta').Value='C' then begin //Si es CAJA
          dblcCCBco2.Enabled:=False;
          dblcCCBco2.Text:='';
//wmckkk
{          if rgTipTran.ItemIndex=0 then     //Si es Egreso se toma la cuenta
//wmckkk                                                                                    }
           edtCuenta2.Text:=DM1.cdsqry.FieldByName('CuentaID').Value; //Se toma de la tabla Bancos

       end
       else begin  //Si es BANCO
          dblcCCBco2.Enabled:=True;   //Habilitar CtaCte
          edtCuenta2.Text   :='';     //La Cuenta se tomara posteriormente por medio de la CtaCte
          DM1.cdsCCBco2.Filtered:=False;
          DM1.cdsCCBco2.Filter:='';   //Filtrar la lista de CtaCte por Banco
          DM1.cdsCCBco2.Filter:='BANCOID='+''''+dblcBanco2.Text+'''';
          DM1.cdsCCBco2.Filtered:=True;
          dblcCCBco2.Enabled:=true;
       end;
   end;
   wmodifica:=True;
end;

procedure TFTransferencia.dblcBanco2Exit(Sender: TObject);
begin
   if length(edtBanco2.Text)=0 then
      dblcBanco2.Text:='';
end;

procedure TFTransferencia.IniciaPanel;
begin
     dblcTMon2.Text      := '';
     dbeImporte2.Text    := '';
     dbeTCambio2.Text    := '';
     edtMtoLoc.Text      := '';
     edtMtoExt.Text      := '';
     dbeFPago.Text       := '';
     dblcBanco3.Enabled  := False;
     dblcBanco3.Text     := '';
     edtBanco3.Text      := '';
     dbeCheque.Enabled   := False;
     dbeCheque.Text      := '';

     dbeNoReg.Text       := '';
end;

procedure TFTransferencia.dblcCCBco2Change(Sender: TObject);
var xWhere:string;
begin
   xWhere:='BANCOID='+''''+dblcBanco2.text+''''+' AND CCBCOID='+''''+dblcCCBco2.Text+'''';
   edtCCBco2.Text :=DM1.DisplayDescrip('prvTGE','TGE106','*',xWhere,'CCBCODES');
   //wmckkk
//   if (rgTipTran.ItemIndex=0) and (length(edtCCBco2.Text)>0) then begin //Si es Egreso
   //wmckkk
   if (length(edtCCBco2.Text)>0) then begin //Si es Egreso
      edtCuenta2.Text:=DM1.DisplayDescrip('prvTGE','TGE106','*',xWhere,'CTAREMES');
   end;
   wmodifica:=True;
end;

procedure TFTransferencia.dblcCCBco2Exit(Sender: TObject);
begin
   if length(edtCCBco2.Text)=0 then
      dblcCCBco2.Text:='';
end;



procedure TFTransferencia.dbeFPagoChange(Sender: TObject);
var
  tipo:Char;
  p:Pchar;
begin
     if (DM1.cdsTrans.State<>dsInsert) and (DM1.cdsTrans.State<>dsEdit) then exit;
     if not ((dbeFPago.Text='E') or (dbeFPago.Text='C') or (length(dbeFPago.Text)=0)) then
     begin
        dbeFPago.Text:='';
        dbeFPago.SetFocus;
     end
     else
     begin
     p:=pchar(dbeFPago.text);
     tipo:=char(p[0]);
          case tipo of
          'E':
              begin

                   dblcBanco3.Text:='';
//                   dbeCheque.Text:=str;
                   DM1.cdsTransTXNOCHQ.Value:='';

                   dblcBanco3.Enabled:=False;
                   dbeCheque.Enabled:=False;
              end;
          'C':
              Begin
                   showmessage('C');
                   dbeCheque.Enabled:=True;
                   dblcBanco3.Enabled:=true;
              end;
          end;
     end;

end;

procedure TFTransferencia.rgTipTranExit(Sender: TObject);
begin
    dblcBanco.Text:='';
    edtBanco.Text:='';
    dblcBanco2.Text:='';
    edtBanco2.Text:='';
    dblcCCBco.Text:='';
    edtCCBco.Text:='';
    dblcCCBco2.Text:='';
    edtCCBco2.Text:='';
    edtCuenta.Text:='';
    edtCuenta2.Text:='';
end;

procedure TFTransferencia.dbeLoteExit(Sender: TObject);
begin
   dbeLote.text:=DM1.StrZero(dbeLote.text,DM1.cdsEgrCajaECLOTE.DisplayWidth);
end;

procedure TFTransferencia.dbeNoDocChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFTransferencia.dbeLoteChange(Sender: TObject);
begin
   wmodifica:=True;
end;


procedure TFTransferencia.dbeGlosaChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFTransferencia.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  begin
   key:=#0;
   perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFTransferencia.z2bbtnOKCabClick(Sender: TObject);
begin
   //dbeNoComp.text:=DM1.StrZero(dbeNoComp.text,DM1.cdsEgrCajaECNOCOMP.DisplayWidth);

   with DM1 do begin
      cdsEgrCaja.SetKey;
      cdsEgrCajaCIAID.Value   :=dblcCia.Text;
      cdsEgrCajaTDIARID.Value :=dblcTDiario.Text;
      cdsEgrCajaECANOMM.Value :=edtPeriodo.Text;
      cdsEgrCajaECNOCOMP.Value:=dbeNoComp.Text;
      if cdsEgrCaja.GotoKey then
      begin
             if cdsEgrCajaEC_PROCE.Value<>'4' then begin
                ShowMessage('Comprobante ya esta registrado por otro Modulo');
                dbeNoComp.Text:='';
                dbeNoComp.SetFocus;
                exit;
             end;
              //wmckkk
              cdsEgrCajaDestino.SetKey;
              cdsEgrCajaDestino.FieldByName('CIAID').AsString   :=dblcCia.Text;

              cdsEgrCajaDestino.FieldByName('TDIARID').AsString :=
                                              cdsEgrCaja.FieldByName('TDIARIO2').AsString ;
              cdsEgrCajaDestino.FieldByName('ECANOMM').AsString :=edtPeriodo.Text;
              cdsEgrCajaDestino.FieldByName('ECNOCOMP').AsString:=
                                              cdsEgrCaja.FieldByName('ECNOCOMP2').AsString;
              if not cdsEgrCajaDestino.GotoKey then
              begin
                MessageDlg('error en la busqyeda del relacionado', mtInformation,[mbOk], 0);
                exit;
              end ;
              //wmckkk


              ////
              Bandera := True ;
              dbdtpFComp.date := cdsEgrCajaDestino.FieldByName('ECFCOMP').Value;
              dbdtpFComp2.date := cdsEgrCajaDestino.FieldByName('ECFCOMP').Value ;
              dblcTdiario2.text := cdsEgrCajaDestino.FieldByName('TDIARID').AsString ;
              dblcTDiario2.LookupTable.Locate('TDIARID', dblcTDiario2.Text,[]);
              edtTDiario2.Text:=dblcTDiario2.LookupTable.FieldByName('TDIARDES').AsString;
              dbeNoComp2.Text := cdsEgrCajaDestino.FieldByName('ECNOCOMP').AsString ;
              Bandera := False ;
              ////


             // Estableciendo el filtro para el detalle (CAJA301) para mostrar Detalle
             DM1.cdsTrans.Filtered:=False;
             DM1.cdsTrans.Filter:='';
             DM1.cdsTrans.Filter:='CiaID='+''''+dblcCia.Text+''''
                                  +' and TDiarID='+''''+dblcTDiario.Text+''''
                                  +' and ECAnoMM='+''''+edtPeriodo.Text+''''
                                  +' and ECNoComp='+''''+dbeNoComp.Text +'''';

             DM1.cdsTrans.Filtered:=True;

             // Asignar desde valores del registro activo
{             if cdsEgrCajaEC_IE.Value='E' then
                rgTipTran.ItemIndex := 0;
             if cdsEgrCajaEC_IE.Value='I' then
                rgTipTran.ItemIndex:=  1;
}


             dbdtpFComp.date  :=cdsEgrCajaECFCOMP.Value;
             dbeTCambio.Text  :=floattostr(cdsEgrCajaECTCAMB.Value);
             dblcTDoc.Text    :=cdsEgrCajaDOCID.Value;
             dbeNoDoc.Text    :=cdsEgrCajaECNODOC.Value;
             dblcBanco.Text   :=cdsEgrCajaBANCOID.Value;
             dblcCCBco.Text   :=cdsEgrCajaCCBCOID.Value;
             edtCuenta.Text   :=cdsEgrCajaCUENTAID.Value;

//wmckkk
             dblcBanco2.Text  :=cdsEgrCajaDestino.FieldByName('BANCOID').AsString;
             dblcCCBco2.Text  :=cdsEgrCajaDestino.FieldByName('CCBCOID').AsString;
             edtCuenta2.Text  :=cdsEgrCajaDestino.FieldBYName('CUENTAID').Value;
//wmckkk


             dbeLote.Text     :=cdsEgrCajaECLOTE.Value;
//             dblcCnp.Text     :=cdsEgrCajaCPTOID.Value;
             dblcdCnp.Text     :=cdsEgrCajaCPTOID.Value;
             dbeGlosa.Text    :=cdsEgrCajaECGLOSA.Value;

             if cdsEgrCajaECEstado.Value='I' then      //Si está INCOMPLETO
             begin
                // Activar modo de Editado
                cdsEgrCaja.Edit;

                // Estado de componentes
                pnlCabecera1.Enabled := False;    // Desactivar Panel1
                pnlCabecera2.Enabled := True;     // Activar Panel2

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
                lblEstado.Caption    :='Activo             ';
             end;

             if cdsEgrCajaECEstado.Value='C' then      //Si está CANCELADO
             begin
                pnlCabecera1.Enabled := False;    // Desactivar Panel1
                pnlCabecera2.Enabled := False;    // Desactivar Panel2
                pnlDetTrans.Enabled   := True;     // Activar Panel de Detalle
                pnlBotones.Enabled   := True;     // Activar Panel de Botones

                dbgTransIButton.Enabled:=False;
                z2bbtnOk.Enabled       := False;
                z2bbtnCancel.Enabled   := False;

                wbSumat              := False;
                if cdsEgrCajaECConta.Value='S' then begin  //Esta contabilizado
                   wbCont             := False;
                   lblEstado.Caption  :='Cancelado y Contab.'
                end
                else begin
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

                ActPnlBotones;
             end;

             if cdsEgrCajaECEstado.Value='A' then      // Si esta ANULADO
             begin
                pnlCabecera1.Enabled := False;    // Desactivar Panel1
                pnlCabecera2.Enabled := False;    // Desactivar Panel2
                pnlDetTrans.Enabled   := True;     // Activar Panel de Detalle
                pnlBotones.Enabled   := True;     // Activar Panel de Botones

                dbgTransIButton.Enabled:=False;
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
                ActPnlBotones;
                lblEstado.Caption     :='Anulado            ';
             end;
             z2bbtnSumatClick(sender);
      end
      else begin
///////////////////////////
          if trim(dbeNoComp2.Text) = '' then
          begin
               ShowMessage('Ingrese Número de Comprobante'+ #13+'de Destino de La Transferencia');
               exit;
          end;
          if (dblcTdiario.Text = dblctdiario2.text) and (dbeNocomp.Text=dbeNoComp2.Text) then
              dbeNoComp2.Text := DM1.StrZero(inttostr(strtoint64(dbeNoComp2.text)+1),6)
          else
          begin
              //wmckkk
              cdsEgrCajaDestino.SetKey;
              cdsEgrCajaDestino.FieldByName('CIAID').AsString   := dblcCia2.Text;
              cdsEgrCajaDestino.FieldByName('TDIARID').AsString := dblcTDiario2.Text; ;
              cdsEgrCajaDestino.FieldByName('ECANOMM').AsString := edtPeriodo2.Text;
              cdsEgrCajaDestino.FieldByName('ECNOCOMP').AsString:= dbeNoComp2.Text;
              if cdsEgrCajaDestino.GotoKey then
              begin
                MessageDlg('El Comprobante de Destino esta siendo utilizado escoja otro', mtInformation,[mbOk], 0);
                exit;
              end ;
              //wmckkk
          end;

////////////////////////////
           // Estableciendo el filtro para el detalle (CAJA301) para mostrar Detalle
          DM1.cdsTrans.Filtered:=False;
          DM1.cdsTrans.Filter:='';
          DM1.cdsTrans.Filter:='CiaID='+''''+dblcCia.Text+''''
                               +' and TDiarID='+''''+dblcTDiario.Text+''''
                               +' and ECAnoMM='+''''+edtPeriodo.Text+''''
                               +' and ECNoComp='+''''+dbeNoComp.Text +'''';
          DM1.cdsTrans.Filtered:=True;

        // Actualizar Label Estado
        lblEstado.Caption:='Nuevo     ';

        // Insertar un nuevo registro
        cdsEgrCaja.Insert;
        //wmckkk
        cdsEgrCajaDestino.Insert;
        //wmckkk

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
   (sender as tbutton).enabled:=false;
   wmodifica:=False;
   perform(CM_DialogKey,VK_TAB,0);   
end;
procedure TFTransferencia.dblcTDiarioChange(Sender: TObject);
//var xWhere : String ;
begin
//   if not (Sender as twincontrol).focused then exit  ;
   if Bandera  then exit ;
   if  length(dblcTDiario.Text)=dblcTDiario.LookupTable.FieldByName('TDIARID').Size then
   begin
	   if dblcTDiario.Text=dblcTDiario.LookupTable.FieldByName('TDIARID').AsString then
	   begin
	      if edtTDiario.Text<>dblcTDiario.LookupTable.FieldByName('TDIARDES').AsString then
	      begin
{                    xWhere:='CiaID='+''''+dblcCia.Text+''''+' and ECAnoMM='+
                           ''''+edtPeriodo.Text+''''+' and TDiarID='+''''+
                           dblcTDiario.Text+'''';
                    dbeNoComp.text:=DM1.UltimoNum('prvCaja','CAJA302','ECNoComp',xWhere);
                    dbeNoComp.text:=DM1.StrZero(dbeNoComp.text,DM1.cdsEgrCajaECNOCOMP.DisplayWidth);}
	            edtTDiario.Text:=dblcTDiario.LookupTable.FieldByName('TDIARDES').AsString;
	      end;
	   end
	   else
	   begin
	     if not dblcTDiario.LookupTable.Locate('TDIARID', dblcTDiario.Text,[]) then
	     begin
	          edtTDiario.text:='';
                  dbeNoComp.text:='';
	     end
	     else
	     begin
{                  xWhere:='CiaID='+''''+dblcCia.Text+''''+' and ECAnoMM='+
                         ''''+edtPeriodo.Text+''''+' and TDiarID='+''''+
                         dblcTDiario.Text+'''';
                  dbeNoComp.text:=DM1.UltimoNum('prvCaja','CAJA302','ECNoComp',xWhere);
                  dbeNoComp.text:=DM1.StrZero(dbeNoComp.text,DM1.cdsEgrCajaECNOCOMP.DisplayWidth);}
	          edtTDiario.text:=dblcTDiario.LookupTable.fieldbyname('TDIARDES').AsString;

	     end;
	   end;
   end
   else
   begin
           edtTDiario.text:='';
           dbeNoComp.text:='';
   end;

   ////
   BuscaComprobanteOrigen;
   BuscaComprobanteDestino;   
   HabilitaBotonCabecera(pnlCabecera1,z2bbtnOkcab);
   ////
end;


procedure TFTransferencia.dblcTDiario2Change(Sender: TObject);
//var xWhere : String ;
begin
//   if not (Sender as twincontrol).focused then exit;
   if Bandera  then exit ;
   if  length(dblcTDiario2.Text)=dblcTDiario2.LookupTable.FieldByName('TDIARID').Size then
   begin
	   if dblcTDiario2.Text=dblcTDiario2.LookupTable.FieldByName('TDIARID').AsString then
	   begin
	      if edtTDiario2.Text<>dblcTDiario2.LookupTable.FieldByName('TDIARDES').AsString then
	      begin
{                    xWhere:='CiaID='+''''+dblcCia2.Text+''''+' and ECAnoMM='+
                           ''''+edtPeriodo2.Text+''''+' and TDiarID='+''''+
                           dblcTDiario2.Text+'''';
                    dbeNoComp2.text:=DM1.UltimoNum('prvCaja','CAJA302','ECNoComp',xWhere);
                    dbeNoComp2.text:=DM1.StrZero(dbeNoComp2.text,DM1.cdsEgrCajaECNOCOMP.DisplayWidth);}
	            edtTDiario2.Text:=dblcTDiario2.LookupTable.FieldByName('TDIARDES').AsString;
	      end;
	   end
	   else
	   begin
	     if not dblcTDiario2.LookupTable.Locate('TDIARID', dblcTDiario2.Text,[]) then
	     begin
	          edtTDiario2.text:='';
                  dbeNoComp2.text:='';
	     end
	     else
	     begin
{                  xWhere:='CiaID='+''''+dblcCia2.Text+''''+' and ECAnoMM='+
                         ''''+edtPeriodo2.Text+''''+' and TDiarID='+''''+
                         dblcTDiario2.Text+'''';
                  dbeNoComp2.text:=DM1.UltimoNum('prvCaja','CAJA302','ECNoComp',xWhere);
                  dbeNoComp2.text:=DM1.StrZero(dbeNoComp2.text,DM1.cdsEgrCajaECNOCOMP.DisplayWidth);}
	          edtTDiario2.text:=dblcTDiario2.LookupTable.fieldbyname('TDIARDES').AsString;

	     end;
	   end;
   end
   else
   begin
           edtTDiario2.text:='';
           dbeNoComp2.text:='';
   end;

   ////
   BuscaComprobanteDestino;
   ////

end;
procedure TFTransferencia.HabilitaBotonCabecera(Panel: TPanel;Boton: TButton);
var
  i:byte;
begin

  boton.Enabled:=False;
  for i:=0 to Panel.ControlCount-1 do
  begin
   if (Panel.Controls[i] is TCustomEdit) then
//      if not Panel.Controls[i].enabled then
      if ((panel.Controls[i] as TCustomEdit).text='') and (panel.Controls[i].tag=1) then
        exit;
  end;
  Boton.Enabled:=True;


{  boton.Enabled:=False;
  for i:=0 to Panel.ControlCount-1 do
  begin
   if (Panel.Controls[i] is TCustomEdit) then
      if not Panel.Controls[i].enabled then
          if (panel.Controls[i] as TCustomEdit).text='' then
          begin
            exit;
          end;
  end;
  Boton.Enabled:=True;}
end;

procedure TFTransferencia.dblcTDiario2Exit(Sender: TObject);
begin
if edtTDiario2.Text='' then
begin
    if dblcTDiario2.Text='' then
      ShowMessage('Ingrese Tipo de Diario')
    else
      ShowMessage('El Tipo de Diario que ha Ingresado'+#13 +
                  'No está registrado');
    (Sender as twincontrol).SetFocus;
end
end;

procedure TFTransferencia.dblcCiaChange(Sender: TObject);
begin
   //if FTransferencia.ActiveControl<> dblcTDiario then exit;
//   if not (Sender as twincontrol).focused then exit   ;
   if Bandera  then exit ;
   if  length(dblcCia.Text)=dblcCia.LookupTable.FieldByName('CIAID').Size then
   begin
	   if dblcCia.Text=dblcCia.LookupTable.FieldByName('CIAID').AsString then
	   begin
	      if edtCia.Text<>dblcCia.LookupTable.FieldByName('CIADES').AsString then
	      begin
	            edtCia.Text:=dblcCia.LookupTable.FieldByName('CIADES').AsString;
                    edtCia2.Text:=dblcCia.LookupTable.FieldByName('CIADES').AsString;
                    dblcCia2.Text:=dblcCia.LookupTable.FieldByName('CIAID').AsString
	      end;
	   end
	   else
	   begin
	     if not dblcCia.LookupTable.Locate('CIAID', dblcCia.Text,[]) then
	     begin
	          edtCia.text:='';
                  edtCia2.text:='';
                  dblcCia2.Text:='';
	     end
	     else
	     begin
	          edtCia.text:=dblcCia.LookupTable.fieldbyname('CIADES').AsString;
                  edtCia2.Text:=dblcCia.LookupTable.FieldByName('CIADES').AsString;
                  dblcCia2.Text:=dblcCia.LookupTable.FieldByName('CIAID').AsString

	     end;
	   end;
   end
   else
   begin
          edtCia.text:='';
          edtCia2.text:='';
          dblcCia2.Text:='';

   end;
   ////
   BuscaComprobanteOrigen;
   BuscaComprobanteDestino;
   HabilitaBotonCabecera(pnlCabecera1,z2bbtnOkcab);
   ////
end;
procedure TFTransferencia.dbdtpFCompChange(Sender: TObject);
Var
   Periodo:String;
begin
//   if not (Sender as twincontrol).focused then exit;

   if Bandera  then exit ;
   if dbdtpFComp.Date=0 then
   begin
        dbdtpFComp2.Date:=0;
        edtPeriodo.text:='';
        edtPeriodo2.text:=''

   end
   else
   begin
      dbdtpFComp2.Date:=dbdtpFComp.Date;
      Periodo:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
      if edtPeriodo.text<>Periodo then
      begin
         edtPeriodo.text:=Periodo;
         edtPeriodo2.Text:=edtPeriodo.Text;
      end;
   end;
   ////
   BuscaComprobanteOrigen;
   BuscaComprobanteDestino;
   HabilitaBotonCabecera(pnlCabecera1,z2bbtnOkcab);
   ////
end;

procedure TFTransferencia.dblcdCnpChange(Sender: TObject);
var
Aux,xDes,xWhere:String;
begin
   wmodifica:=True;
   if Length(dblcdCnp.Text)=dblcdCnp.LookupTable.FieldByName('CPTOID').size then
   begin
        if dblcdCnp.Text=dblcdCnp.LookupTable.FieldByName('CPTOID').AsString then
        begin
           aux:=dblcdCnp.LookupTable.FieldByName('CPTODES').AsString;
           dbeGlosa.Text:=aux;
        end
        else
        begin
         xWhere:='CPTOID='+''''+dblcdCnp.text+'''';
         xDes:=DM1.DisplayDescrip('prvCxP','CxP201','*',xWhere,'CPTODES');
         if xDes='' then
          begin
            dbeGlosa.text:='';
          end
          else
          begin
            dbeGlosa.Text:=xDes;
          end;

{          if not dblcdCnp.LookupTable.Locate('CPTOID', dblcdCnp.Text,[]) then
          begin
            dbeGlosa.text:='';
          end
          else
          begin
            aux:=dblcdCnp.LookupTable.FieldByName('CPTODES').AsString;
            dbeGlosa.Text:=aux;
          end;}
        end;
   end
   else
   begin
      dbeGlosa.text:='';
   end;

end;

procedure TFTransferencia.dblcdCnpExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then exit;
   if dbeGlosa.Text='' then
   begin
      if dblcdCnp.Text='' then
         ShowMessage('Ingrese Concepto')
      else
         ShowMessage('Concepto Errado');
      dblcdCnp.SetFocus;
   end;

end;

procedure TFTransferencia.dbgTransCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'TXMTOLOC') or (AFieldName = 'TXMTOEXT') then
           ABrush.Color := clNone;

end;

procedure TFTransferencia.dblcBanco3Change(Sender: TObject);
begin
   if  length(dblcBanco3.Text)=2 then //dblcBanco3.LookupTable.FieldByName('BANCOID').Size then
   begin
	   if dblcBanco3.Text=dblcBanco3.LookupTable.FieldByName('BANCOID').AsString then
	   begin
	      if edtBanco3.Text<>dblcBanco3.LookupTable.FieldByName('BANCONOM').AsString then
	      begin
	            edtBanco3.Text:=dblcBanco3.LookupTable.FieldByName('BANCONOM').AsString;
	      end;
	   end
	   else
	   begin
	     if not dblcBanco3.LookupTable.Locate('BANCOID', dblcBanco3.Text,[]) then
	     begin
	          edtBanco3.text:='';
	     end
	     else
	     begin
	          edtBanco3.text:=dblcBanco3.LookupTable.fieldbyname('BANCONOM').AsString;
	     end;
	   end;
   end
   else
   begin
           edtBanco3.text:='';
   end;
end;


procedure TFTransferencia.dblcBanco3Exit(Sender: TObject);
begin
if  z2bbtnCancel3.Focused then
    exit;
if edtBanco3.Text='' then
begin
    if dblcBanco3.Text='' then
      ShowMessage('Ingrese Caja/Banco')
    else
      ShowMessage('El Código de Caja/Banco que ha Ingresado'+#13 +
                  'No está registrado');
    (Sender as twincontrol).SetFocus;
end
end;
procedure TFTransferencia.CodAuxTipMon;
begin
      if (DM1.cdsTransTXMTOORI.Value>0) then begin
        if DM1.cdsTransTMONID.Value = dm1.wTMonLoc then begin
           DM1.cdsTransTXMTOLOC.Value:=DM1.cdsTransTXMTOORI.Value;
           DM1.cdsTransTXMTOEXT.Value:=DM1.cdsTransTXMTOORI.Value/DM1.cdsEgrCajaECTCAMB.Value;
        end
        else begin
           DM1.cdsTransTXMTOLOC.Value:=DM1.cdsTransTXMtoOri.Value*DM1.cdsEgrCajaECTCAMB.Value;
           DM1.cdsTransTXMTOEXT.Value:=DM1.cdsTransTXMtoOri.Value;
        end;
      end
      else begin
           DM1.cdsTransTXMTOLOC.Value:=0;
           DM1.cdsTransTXMTOEXT.Value:=0;
      end;

end;


procedure TFTransferencia.dblcTMon2Change(Sender: TObject);
begin
   if (DM1.cdsTrans.State<>dsInsert) and (DM1.cdsTrans.State<>dsEdit) then exit;
   if  length(dblcTMon2.Text)=2 then //dblcTMon2.LookupTable.FieldByName('TMONID').Size then
   begin
	   if dblcTMon2.Text=dblcTMon2.LookupTable.FieldByName('TMONID').AsString then
	   begin
	      if edtTMon2.Text<>dblcTMon2.LookupTable.FieldByName('TMONDES').AsString then
	      begin
	            edtTMon2.Text:=dblcTMon2.LookupTable.FieldByName('TMONDES').AsString;
	            CodAuxTipMon;
	      end;
	   end
	   else
	   begin
	     if not dblcTMon2.LookupTable.Locate('TMONID', dblcTMon2.Text,[]) then
	     begin
	          edtTMon2.text:='';
	     end
	     else
	     begin
	          edtTMon2.text:=dblcTMon2.LookupTable.fieldbyname('TMONDES').AsString;
                  CodAuxTipMon;
	     end;
	   end;
   end
   else
   begin
           edtTMon2.text:='';
   end;
end;


procedure TFTransferencia.dblcTMon2Exit(Sender: TObject);
begin
if  z2bbtnCancel3.Focused then
    exit;
if edtTMon2.Text='' then
begin
    if dblcTMon2.Text='' then
      ShowMessage('Ingrese Tipo de Moneda')
    else
      ShowMessage('El Tipo de Moneda que ha Ingresado'+#13 +
                  'No está registrado');
    (Sender as twincontrol).SetFocus;
end
end;

procedure TFTransferencia.AdicionaRegistro;
begin
     dbeNoREg.Text:='';
     dbeNoReg.Enabled := True;
     dm1.cdsTrans.Insert;
     dm1.cdsTransCIAID.Value   := dblcCia.Text;
     dm1.cdsTransTDIARID.Value := dblcTDiario.Text;
     dm1.cdsTransECANOMM.Value := edtPeriodo.Text;
     dm1.cdsTransECNOCOMP.Value:= dbeNoComp.Text;
     // Iniciar Datos, el reg. y su llave ya estan creados
//     cdsTransTXNoReg.Value   := dbeNoReg.Text;
     dm1.cdsTransTXTCAMB.Value   := strtofloat(dbeTCambio.Text);
     perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFTransferencia.EditaRegistro;
begin
dbeNoReg.Text:= dm1.cdsTransTXNoReg.Value   ;
dm1.cdsTrans.Edit;    //Lo pongo en modo de edicion
dbeNoReg.Enabled := False ;
perform(CM_DialogKey,VK_TAB,0);

end;

procedure TFTransferencia.dbgTransDblClick(Sender: TObject);
begin

     if (DM1.cdsEgrCajaECEstado.Value='A') or (DM1.cdsEgrCajaECEstado.Value='C') then
     begin
          ShowMessage('No Puede Efectuar Modificaciones en este Movimiento');
          Exit;
     end;

     if dbgTrans.DataSource.DataSet.RecordCount=0 then
     begin
       MessageDlg('No hay Registros por Editar', mtInformation,
      [mbOk], 0);
       exit;
     end;

     pnlDetTrans.Enabled  := False;
     pnlBotones.Enabled  := False;
     pnlActualiza.Visible:= True;
     IniciaPanel;
     dbeNoReg.enabled:=False;
     EditaRegistro;

end;

procedure TFTransferencia.dbeFPagoExit(Sender: TObject);
{begin
     if dbeFPago.Text='C' then begin //Cheque
        dblcBanco3.Enabled:=True;
        dbeCheque.Enabled :=True;
     end
     else begin     // Efectivo
        dblcBanco3.Enabled:=False;
        dbeCheque.Enabled :=False;
        dbeCheque.Text    :='';
     end;
end;}
begin
//showmessage('');
if  z2bbtnCancel3.Focused then
    exit;
if dbeFPago.Text='' then
begin
  ShowMessage('Ingrese Forma de Pago');
  dbeFPago.SetFocus;
end;
end;

procedure TFTransferencia.FormShow(Sender: TObject);
begin
// Crea indice para la tabla de Egreso de Caja (CAJA302)
   DM1.cdsEgrCaja.IndexFieldNames:='CiaID;TDiarID;ECAnoMM;ECNoComp';

// Crea indice para el Data Set cdsTran (CAJA301)
   DM1.cdsTrans.IndexFieldNames:='CiaID;TDiarID;ECAnoMM;ECNoComp;TXNoReg';

  cdsEgrCajaDestino :=  TWWClientDataSet.Create(self);
  cdsEgrCajaDestino.CloneCursor(dm1.cdsEgrCaja , False);

// Inicia Datos para que los DBEdit no se vean con datos llenos
   IniciaDatos;
  
end;

procedure TFTransferencia.z2bbtnImprimeClick(Sender: TObject);
var
   Comprobante : RCabComprobante;
begin
  with Comprobante do
  begin
    CiaDes := edtCia.Text ;
    CIAID := dblcCia.Text ;
    TDIARID := dblcTDiario.Text ;
    Diario := edtTDiario.Text ;
    Proveedor := '' ; // edtProv.Text ;
    Glosa := dbeGlosa.Text ;
    Lote := dbeLote.Text ;
    TipoDoc := edtTDoc.Text ;
    TipoCamb := dbeTCambio.Text ;
    Periodo := edtPeriodo.Text ;
    NoComp := dbeNoComp.Text ;
    NoDoc := dbeNoDoc.Text ;
  end;

     Fprincipal.ImprimirComprobante(Comprobante);
end;

procedure TFTransferencia.BuscaComprobanteOrigen;
var
   xWhere : String ;
begin
//     if (edtCia.text <> '') and (edtPeriodo.text <> '')
//                  and (edtTDiario.Text <> '') and (Trim(dbeNoComp.text)='') then

     if (edtCia.text <> '') and (edtPeriodo.text <> '')
                  and (edtTDiario.Text <> '') then

     begin
          //Buscar el siguiente numero de comprobante
          xWhere:='CIAID='+''''+dblcCia.Text+''''+' AND ECANOMM='+
                 ''''+edtPeriodo.Text+''''+' AND TDIARID='+''''+
                 dblcTDiario.Text+'''';
          dbeNoComp.text:=DM1.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
          dbeNoComp.text:=DM1.StrZero(dbeNoComp.text,DM1.cdsEgrCajaECNOCOMP.DisplayWidth);

     end;
end;

procedure TFTransferencia.BuscaComprobanteDestino;
var
   xWhere : String ;
begin

     if (edtCia2.text <> '') and (edtPeriodo2.text <> '')
                  and (edtTDiario2.Text <> '') then
     begin
          //Buscar el siguiente numero de comprobante
          xWhere:='CIAID='+''''+dblcCia2.Text+''''+' AND ECANOMM='+
                 ''''+edtPeriodo2.Text+''''+' AND TDIARID='+''''+
                 dblcTDiario2.Text+'''';
          dbeNoComp2.text:=DM1.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
          dbeNoComp2.text:=DM1.StrZero(dbeNoComp2.text,DM1.cdsEgrCajaECNOCOMP.DisplayWidth);

     end;

end;

procedure TFTransferencia.dbeNoComp2Exit(Sender: TObject);
begin
    if (trim(dbeNoComp2.text)<>'') and
                  (length(trim(dbeNoComp2.text)) <> DM1.cdsEgrCajaECNOCOMP.DisplayWidth) then
    begin
       dbeNoComp2.text :=dm1.StrZero(dbeNoComp2.text,DM1.cdsEgrCajaECNOCOMP.DisplayWidth);
    end

end;

procedure TFTransferencia.dbeNoCompChange(Sender: TObject);
begin
   ////
   HabilitaBotonCabecera(pnlCabecera1,z2bbtnOkcab);
   ////
end;

procedure TFTransferencia.FormCreate(Sender: TObject);
begin
   Bandera := False ;
end;

end.

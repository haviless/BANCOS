unit Caja210;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Buttons, StdCtrls, wwdblook, Mask,
  wwdbedit, Db, DBClient, wwclient,CAJADM;

type

  TAcumulados = Record
    CobradoORIG,
    CobradoEfectivoLOCAL,
    CobradoEfectivoEXT,    
    RestanteORIG,
    RecLocalTOT,
    RecExtTOT,
    RecLocalCOB,
    RecExtCOB,
    DevLocalRES,
    DevExtRES : Currency;
  end;


  TFDevEfectivo = class(TForm)
    pnlMtoEntregado: TPanel;
    bbtnOK: TBitBtn;
    bbtnCancel: TBitBtn;
    StaticText1: TStaticText;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    bvlMontos: TBevel;
    dblcFormPago: TwwDBLookupCombo;
    cboMoneda: TComboBox;
    pnlPrincipal: TPanel;
    Bevel1: TBevel;
    dbgIngresos: TwwDBGrid;
    dbgPruebaIButton: TwwIButton;
    bbtnOKPrincipal: TBitBtn;
    bbtnCancelPrincipal: TBitBtn;
    edtFormPago: TEdit;
    gbxBco: TGroupBox;
    lblNro: TLabel;
    lblNroID: TLabel;
    Label13: TLabel;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TEdit;
    gbxMto: TGroupBox;
    lblRecibido: TLabel;
    lblCobrar: TLabel;
    lblDevolver: TLabel;
    dbeNro: TwwDBEdit;
    dbeNroDoc: TwwDBEdit;
    chkAsigResto: TCheckBox;
    lblEquivalente: TLabel;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    Bevel4: TBevel;
    Label7: TLabel;
    Label8: TLabel;
    dbeDevModExt: TwwDBEdit;
    dbeDevModLocal: TwwDBEdit;
    edtDevResLocal: TEdit;
    edtDevResExt: TEdit;
    Bevel3: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtMoneda: TEdit;
    edtMtoOriginal: TEdit;
    Label14: TLabel;
    edtTCambio: TEdit;
    StaticText2: TStaticText;
    GroupBox1: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Bevel6: TBevel;
    Label17: TLabel;
    Label18: TLabel;
    edtTotCobExt: TwwDBEdit;
    edtTotCobLocal: TwwDBEdit;
    edtTotRecLocal: TEdit;
    edtTotRecExt: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label19: TLabel;
    edtMtoCobrado: TEdit;
    edtMtoRestante: TEdit;
    Button2: TButton;
    Bevel2: TBevel;
    Bevel5: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    edtMtoRecibido: TEdit;
    edtMtoEquivalente: TEdit;
    edtMtoCobrar: TEdit;
    edtMtoDevolver: TEdit;
    edtMtoRestantePnl: TEdit;
    bbtnCalc: TBitBtn;
    procedure dblcBancoChange(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure KeyPressGenerico(Sender: TObject; var Key: Char);
    procedure dblcFormPagoChange(Sender: TObject);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure bbtnOKClick(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure cboMonedaChange(Sender: TObject);
    procedure dbgPruebaIButtonClick(Sender: TObject);
    procedure cboMonedaExit(Sender: TObject);
    procedure dbgIngresosDblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure bbtnCancelPrincipalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtMtoRecibidoChange(Sender: TObject);
    procedure edtMtoCobrarChange(Sender: TObject);
    procedure edtMtoDevolverChange(Sender: TObject);
    procedure edtMtoRecibidoExit(Sender: TObject);
    procedure edtMtoCobrarExit(Sender: TObject);
    procedure edtMtoDevolverExit(Sender: TObject);
    procedure chkAsigRestoClick(Sender: TObject);
    procedure dbgIngresosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnCalcClick2(Sender: TObject);
    procedure edtMtoEquivalenteChange(Sender: TObject);

  private
    { Private declarations }
    cdsRegCobrosClone : TwwClientDataset;
    CIAID,
    ECANOMM,
    TDIARID,
    ECNOCOMP :String;
    TCAMB : real;
    ADICION  : Boolean;
    MONEDA : Char;
    TIPOCAMBIO : Currency;
    Acumulado:TAcumulados;
    procedure HallarMontoRestante;
    function Convertir(MtoAConvertir:Currency ; Dolares : Boolean ):Currency;
    procedure LlenarEquivalente(xRecibido :Currency);
    procedure ConfiguraPnlMonto(FormaPago:Boolean);
    procedure OcultarPanelMontos;
    procedure Adiciona;
    procedure Edita;
    procedure IniciaPanel;
    procedure ActualizaAcumulados;
    procedure RecuperaAcumulados;
    function Valida:Boolean;
    procedure RefrescaPanelPrincipal;
    function ValidaEfectivo:Boolean;
    function SegundaValidacion :Boolean;
    Procedure ActualizaItem;
    function ValidaChequeTarjeta: Boolean;

  public
    { Public declarations }
    procedure RecibirMonto;
  end;


var
  FDevEfectivo: TFDevEfectivo;
implementation

uses CajaUtil;

{$R *.DFM}


procedure TFDevEfectivo.dblcBancoChange(Sender: TObject);
begin
   if  length(dblcBanco.Text)=2 then //dblcBanco.LookupTable.FieldByName('BANCOID').Size then
   begin
	   if dblcBanco.Text=dblcBanco.LookupTable.FieldByName('BANCOID').AsString then
	   begin
	      if edtBanco.Text<>dblcBanco.LookupTable.FieldByName('BANCONOM').AsString then
	      begin
	            edtBanco.Text:=dblcBanco.LookupTable.FieldByName('BANCONOM').AsString;
	      end;
	   end
	   else
	   begin
	     if not dblcBanco.LookupTable.Locate('BANCOID', dblcBanco.Text,[]) then
	     begin
	          edtBanco.text:='';
	     end
	     else
	     begin
	          edtBanco.text:=dblcBanco.LookupTable.fieldbyname('BANCONOM').AsString;
	     end;
	   end;
   end
   else
   begin
           edtBanco.text:='';
   end;
end;


procedure TFDevEfectivo.dblcBancoExit(Sender: TObject);
begin
if bbtnCancel.Focused then exit;
if edtBanco.Text='' then
begin
    if dblcBanco.Text='' then
      ShowMessage('Ingrese Banco')
    else
      ShowMessage('El Código de Banco que ha Ingresado'+#13 +
                  'No está registrado');
    (Sender as twincontrol).SetFocus;
end
end;

procedure TFDevEfectivo.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  begin
   key:=#0;
   perform(CM_DialogKey,VK_TAB,0);
  end
else if key=#27 then
     begin
        if pnlMtoEntregado.Visible then
        begin
             bbtnCancel.SetFocus;
             bbtnCancelClick(Self);
        end;
     end;
end;

procedure TFDevEfectivo.dblcFormPagoChange(Sender: TObject);
begin
   if  length(dblcFormPago.Text)=dblcFormPago.LookupTable.FieldByName('FPAGOID').Size then
   begin
	   if dblcFormPago.Text=dblcFormPago.LookupTable.FieldByName('FPAGOID').AsString then
	   begin
	      if edtFormPago.Text<>dblcFormPago.LookupTable.FieldByName('FPAGODES').AsString then
	      begin
	            edtFormPago.Text:=dblcFormPago.LookupTable.FieldByName('FPAGODES').AsString;
                    //aqui se llama a la funcion que configura el panel
                    ConfiguraPnlMonto(true);
	      end;
	   end
	   else
	   begin
	     if not dblcFormPago.LookupTable.Locate('FPAGOID', dblcFormPago.Text,[]) then
	     begin
	            edtFormPago.text:='';
	     end
	     else
	     begin
	            edtFormPago.text:=dblcFormPago.LookupTable.fieldbyname('FPAGODES').AsString;
                    //aqui se llama a la funcion que configura el panel
                    ConfiguraPnlMonto(true);
	     end;
	   end;
   end
   else
   begin
           edtFormPago.text:='';
   end;
end;


procedure TFDevEfectivo.dblcFormPagoExit(Sender: TObject);
begin
if bbtnCancel.Focused then exit;
if edtFormPago.Text='' then
begin
    if dblcFormPago.Text='' then
      ShowMessage('Ingrese Forma de Pago')
    else
      ShowMessage('La Forma de Pago que ha Ingresado'+#13 +
                  'No está registrado');
    (Sender as twincontrol).SetFocus;
end
end;

procedure TFDevEfectivo.ConfiguraPnlMonto(Formapago:Boolean);

//efectivo                                01
//cheque                                  02
//tarjeta                                 04
//Separacion entre groupboxes             8
//Separacion entre controles              3
//Separacion entre panel y control        8
//Separacion contra los bordes            10

begin
if (dblcformpago.Text='') or (cboMoneda.Text='') then exit;
if FormaPago=True then
begin
//blanquear controles
  dbeNro.Text:= '';
  dbeNroDoc.Text:= '';
  dblcBanco.Text:='';
  edtBanco.Text:='';
//  edtMtoRecibido.Text:='';
  edtMtoRecibido.Text:='';
  edtMtoEquivalente.Text:='';
//  edtMtoCobrar.Text:='';
//  edtMtoDevolver.Text:='';
  edtMtoDevolver.Text:='';
  chkAsigresto.Checked:=false;

end;
if AnsiUpperCase(edtformpago.Text)='EFECTIVO' then
begin
    if gbxBco.Visible then gbxBco.Visible:=false;
    if not gbxMto.Visible then gbxMto.Visible:=true;
    gbxMto.top:=bvlMontos.top+ bvlMontos.Height+8;
    bbtnOK.Top:=gbxMto.top+gbxMto.Height+8;
    chkAsigResto.Top:=gbxMto.top+gbxMto.Height+4;
    bbtnCancel.Top:=bbtnOK.Top;
    pnlMtoEntregado.Height:=bbtnOK.top+bbtnOK.Height+10;

end
else
begin
        gbxBco.top:=bvlMontos.top+ bvlMontos.Height+8;
        if not gbxBco.Visible then gbxBco.Visible:=true;
        if not gbxMto.Visible then gbxMto.Visible:=true;
        gbxMto.top:=gbxBco.top+ gbxBco.Height+8;
        bbtnOK.Top:=gbxMto.top+gbxMto.Height+8;
        chkAsigResto.Top:=gbxMto.top+gbxMto.Height+4;
        bbtnCancel.Top:=bbtnOK.Top;
        pnlMtoEntregado.Height:=bbtnOK.top+bbtnOK.Height+10;
        if AnsiUpperCase(edtformpago.Text)='TARJETA'  then
        begin
        gbxBco.Caption:='Tarjeta';
        lblNro.Caption:='Nro. Voucher :';
        lblNroID.Caption:='Nro. Tarjeta :';
        end
        else if AnsiUpperCase(edtformpago.Text)='CHEQUE'  then
             begin
                gbxBco.Caption:='Cheque : ';
                lblNro.Caption:='Nro. :';
                lblNroID.Caption:='Cta. Bancaria :';
             end;

end     ;
end;


procedure TFDevEfectivo.bbtnOKClick(Sender: TObject);
begin

if not Valida then exit;
if not  SegundaValidacion then exit;

with dm1.cdsRegCobros do
begin
     FieldbyName('FPAGOID').AsString:=dblcFormPago.Text;
     FieldbyName('TMONID').AsString:=InttoStr(cbomoneda.itemindex);    //cbomoneda.Text;
     FieldbyName('NRODOC').AsString:=dbeNro.Text;
     FieldbyName('IDDOC').AsString:=dbeNroDoc.Text;
     FieldbyName('BANCOID').AsString:=dblcBanco.Text;

//      if edtMtoRecibido.Text ='' then
      if edtMtoRecibido.Text ='' then
         FieldbyName('MTORECIBIDO').Clear
      else
         FieldbyName('MTORECIBIDO').AsFloat:=strToFloat(edtMtoRecibido.Text);

      if edtMtoEquivalente.Text='' then
         FieldbyName('MTOEQUIVALENTE').Clear
      else
         FieldbyName('MTOEQUIVALENTE').AsFloat:=strToFloat(edtMtoEquivalente.Text);

      if edtMtoCobrar.Text='' then
         FieldbyName('MTOACOBRAR').Clear
      else
         FieldbyName('MTOACOBRAR').AsFloat:=strToFloat(edtMtoCobrar.Text);

      if edtMtoDevolver.Text='' then
         FieldbyName('MTOADEVOLVER').Clear
      else
         FieldbyName('MTOADEVOLVER').AsFloat:=strToFloat(edtMtoDevolver.Text);

      Post;
      ActualizaAcumulados;

      if ADICION then
      begin
         Adiciona;
      end
      else
      begin
         ActualizaItem;
         bbtnCancelClick(Self);
      end;


end;

end;

procedure TFDevEfectivo.bbtnCancelClick(Sender: TObject);
begin
//DM1.cdsRegCobros.CancelUpdates;
DM1.cdsRegCobros.Cancel;
OcultarPanelMontos;
end;

procedure TFDevEfectivo.cboMonedaChange(Sender: TObject);
begin
if cboMoneda.Text='' then exit;
ConfiguraPnlMonto(false);
if edtmtorecibido.text<> '' then
   llenarEquivalente(strtocurr(edtmtorecibido.text));
end;

procedure TFDevEfectivo.dbgPruebaIButtonClick(Sender: TObject);
begin
Adiciona;
end;

procedure TFDevEfectivo.Adiciona;
begin
  //cdsRegCobrosClone:=nil;
//  cdsRegCobrosClone.CloneCursor(DM1.cdsRegCobros , True);
  ADICION:=TRUE;
  RecuperaAcumulados;
  IniciaPanel;

  if not dblcFormPago.Enabled then dblcFormPago.Enabled:=true;
  if not cboMoneda.Enabled then cboMoneda.Enabled:=true;
  gbxBco.Visible:=false;
  gbxMto.Visible:=false;
  cboMoneda.ItemIndex:=-1;
  bbtnCancel.Top:=100;

  pnlMtoEntregado.Height:=142;
  pnlMtoEntregado.Visible:=true;

  dblcFormPago.SetFocus;
  with DM1.cdsRegCobros do
  begin
       Insert;
       //ingrso de clave
       FieldbyName('CIAID').AsString:=CIAID;
       FieldbyName('ECANOMM').AsString:=ECANOMM;
       FieldbyName('TDIARID').AsString:=TDIARID;
       FieldbyName('ECNOCOMP').AsString:=ECNOCOMP;

       FieldbyName('ORDREGISTRO').Value:=RecordCount+1;
  end;


end;

procedure TFDevEfectivo.IniciaPanel;
begin
  //blanquear controles
  //uso los dbe por su capacida de formato de entrada
  dblcFormPago.Text:='';
  edtFormPago.Text:='';
  cboMoneda.ItemIndex:=-1;
  dbeNro.Text:= '';
  dbeNroDoc.Text:= '';
  dblcBanco.Text:='';
  edtBanco.Text:='';
  edtMtoRecibido.Text:='';
  edtMtoCobrar.Text:='';
  edtMtoEquivalente.Text:='';  
  edtMtoDevolver.Text:='';
  chkAsigresto.Checked:=false;
  DM1.cdsFormPago.Filter:='FPAGODEVEFEC=''1''';
  DM1.cdsFormPago.Filtered:=TRUE;

  pnlPrincipal.Enabled:=false;
end;

procedure TFDevEfectivo.Edita;
begin
//sirve para editar los datos del grid
//cdsRegCobrosClone.CloneCursor(DM1.cdsRegCobros , True);
ADICION:=FALSE;
RecuperaAcumulados;
iniciapanel;
with dm1.cdsRegCobros do
begin
 cboMoneda.ItemIndex:=strtoint(fieldbyname('TMONID').AsString);
 dblcFormPago.Text:=fieldbyname('FPAGOID').AsString;
 //deshabilitar forma de pago y moneda
{ dblcFormPago.Enabled:=false;
 cbomoneda.Enabled:=false;}
 //fin de deshabiliatar forma de pago y moneda
 ConfiguraPnlMonto(true);
 edit;
end;
pnlPrincipal.Enabled:=False;
pnlMtoEntregado.Visible:=true;

end;



function TFDevEfectivo.Valida : Boolean;
begin
//Para Validar
Result:=False;

if AnsiUpperCase(edtFormpago.Text)='CHEQUE' then
begin
    if dbeNro.Text=''  then
    begin
       ShowMessage('Ingrese Número de Cheque');
       dbeNro.SetFocus;
       Exit;
    end;

    if dbeNroDoc.Text=''  then
    begin
       ShowMessage('Ingrese Nro. de Cuenta');
       dbenroDoc.SetFocus;
       Exit;
    end;

    if dblcBanco.Text=''  then
    begin
       ShowMessage('Ingrese Banco');
       dblcBanco.SetFocus;
       Exit;
    end;

end;
if AnsiUpperCase(edtFormpago.Text)='TARJETA' then
begin
{    if dbeNro.Text=''  then
    begin
       ShowMessage('Ingrese Número de Voucher');
       dbeNro.SetFocus;
       Exit;
    end;}

    if dbeNroDoc.Text=''  then
    begin
       ShowMessage('Ingrese Número de Tarjeta');
       dbenroDoc.SetFocus;
       Exit;
    end;

    if dblcBanco.Text=''  then
    begin
       ShowMessage('Ingrese Banco');
       dblcBanco.SetFocus;
       Exit;
    end;

end;

if cboMoneda.Text='' then
begin
   ShowMessage('Ingrese Moneda');
   cbomoneda.SetFocus;
   Exit;
end;
if edtMtoRecibido.Text=''  then
begin
   ShowMessage('Ingrese Monto Recibido');
   edtMtoRecibido.SetFocus;
   Exit;
end;


Result:=True;

end;

procedure TFDevEfectivo.OcultarPanelMontos;
begin
    pnlMtoEntregado.Visible:=false;
    pnlPrincipal.Enabled:=true;
    DM1.cdsFormPago.Filtered:=FALSE;
end;

procedure TFDevEfectivo.cboMonedaExit(Sender: TObject);
begin
if bbtnCancel.Focused then exit;
if cbomoneda.Text='' then
begin
   Showmessage('Ingrese Moneda');
   cbomoneda.SetFocus;
end;
end;

procedure TFDevEfectivo.RecibirMonto;
{el tipo de moneda 0 - LOCAL
                   1 - EXTRANJERA
}
var
   Filtro:String;
begin
    edtMoneda.Text:='LOCAL';
    MONEDA:='0';
    edtMtoOriginal.Text:='5000.36';
    edtTCambio.Text:='3.50';
    TIPOCAMBIO:=3.50;
    CIAID:='01';
    TDIARID:='03';
    ECANOMM:='200001';
    ECNOCOMP:='000001';
    TCAMB :=3.50;

    //aqui filtrar los datos del detalle de la Operacion
    //según el numero del comprobante
    Filtro:='CIAID='''+CIAID+''' AND ECANOMM='''+ECANOMM+''' AND TDIARID='''
             +TDIARID+'''  AND ECNOCOMP='''+ECNOCOMP+'''';

    DM1.cdsRegCobros.Filter:=Filtro;
    DM1.cdsRegCobros.Filtered:=True;

    cdsRegCobrosClone :=  TwwClientDataSet.Create(self);
    cdsRegCobrosClone.CloneCursor(DM1.cdsRegCobros , True);
    edtMtoRestante.Text := edtMtoOriginal.text;
end;

procedure TFDevEfectivo.dbgIngresosDblClick(Sender: TObject);
begin
if dbgingresos.DataSource.DataSet.RecordCount<>0 then
   edita
else
   ShowMessage('No Hay Datos Por Editar');
end;


function TFDevEfectivo.ValidaChequeTarjeta: Boolean;
var
   Mensaje,Campo:String;
   Iguales,Encontrado:Boolean;
begin
//Aqui se pone el codigo para validar el ingreso
//de efectivo
     Result:=false;
     if dblcFormPago.text='02' then
     begin
       Mensaje:='Este Cheque Ya'+#13+
                   'Ha sido Ingresado';
       Campo:='MTORECIBIDO';
     end
     else
     begin
       Mensaje:='Esta Tarjeta Ya'+#13+
                   'Ha sido Ingresado';
       Campo:='MTORECIBIDO';
     end;

     //identificar si es el mismo registro :

     with dm1.cdsRegCobros do
     begin
          Iguales:=(  (FieldByName('NRODOC').AsString = dbeNro.Text) and
                      (FieldByName('IDDOC').AsString = dbeNroDoc.Text) and
                      (FieldByName('BANCOID').AsString = dblcBanco.Text))  ;
     end;

     if ADICION then
     begin
           Encontrado:=cdsRegCobrosClone.Locate('FPAGOID;NRODOC;IDDOC;BANCOID',
                                 varArrayof([dblcFormPago.text,dbeNro.Text,dbeNroDoc.Text ,dblcBanco.Text]),[]);
           if Encontrado then
           begin
               MessageDlg(Mensaje, mtInformation,[mbOk], 0);
               exit ;
           end;
     end
     else
     begin
           //En caso sea edición :
           if not Iguales then
           begin
               Encontrado:=cdsRegCobrosClone.Locate('FPAGOID;NRODOC;IDDOC;BANCOID',
                                 varArrayof([dblcFormPago.text,dbeNro.Text,dbeNroDoc.Text ,dblcBanco.Text]),[]);
               if Encontrado then
               begin
                   MessageDlg(Mensaje, mtInformation,[mbOk], 0);
                   exit ;
               end
           end;
     end;

     Result:=true;
end;
function TFDevEfectivo.ValidaEfectivo: Boolean;
var
   Filtro,Mensaje,Campo:String;
   Iguales:Boolean;
begin
//Aqui se pone el codigo para validar el ingreso
//de efectivo
     Result:=false;
     Filtro:='CIAID='''+CIAID+''' AND ECANOMM='''+ECANOMM+''' AND TDIARID='''
             +TDIARID+'''  AND ECNOCOMP='''+ECNOCOMP+''' AND FPAGOID=''01'' AND TMONID='''
             +inttostr(cbomoneda.itemindex)+'''';
     if cbomoneda.itemindex=0 then
     begin
        Mensaje:='Ya existe un registro para Moneda Local'+#13+
                 '¿Desea Agregarle lo que acaba de ingresar?';
        Campo:='MTORECIBIDO';
     end
     else
     begin
        Mensaje:='Ya existe un registro para Moneda Local'+#13+
                 '¿Desea Agregarle lo que acaba de ingresar?';
        Campo:='MTORECIBIDO';
     end;
     //identificar si es el mismo registro :
     with dm1.cdsRegCobros do
     begin
          Iguales:=((FieldByName('FPAGOID').AsString = dblcFormPago.Text) and
                      (FieldByName('TMONID').AsString = inttoStr(cboMoneda.ItemIndex))) ;
     end;

     if ADICION then
     begin

           cdsRegCobrosClone.Filter:=Filtro;
           cdsRegCobrosClone.Filtered:=true;
           if cdsRegCobrosClone.RecordCount<>0 then
           begin
               if MessageDlg(Mensaje, mtInformation,[mbYes,mbNo], 0)=mrYes then
               begin
                 //actualizar
                 dm1.cdsRegCobros.Cancel;
                 dm1.cdsRegCobros.Bookmark:=cdsRegCobrosClone.Bookmark;
                 dm1.cdsRegCobros.Edit;
                 dm1.cdsRegCobros.FieldByName(Campo).AsFloat:=
                          StrToFloat(edtMtoRecibido.Text)+dm1.cdsRegCobros.FieldByName(Campo).AsFloat;
                 dm1.cdsRegCobros.Post;

                 ActualizaAcumulados;
                 Adiciona;
               end ;
               exit ;
           end;
     end
     else
     begin
           //En caso sea edición :
           if not Iguales then
           begin
               cdsRegCobrosClone.Filter:=Filtro;
               cdsRegCobrosClone.Filtered:=true;
               if cdsRegCobrosClone.RecordCount<>0 then
               begin
                   if MessageDlg(Mensaje, mtInformation,[mbYes,mbNo], 0)=mrYes then
                   begin
                     //actualizar
{                     cdsRegCobrosClone.edit;
                     cdsRegCobrosClone.FieldByName(Campo).AsFloat:=
                              StrToFloat(edtMtoRecibido.Text)+cdsRegCobrosClone.FieldByName(Campo).AsFloat;
                     cdsRegCobrosClone.Post;                                                               }
                     dm1.cdsRegCobros.Cancel;
                     dm1.cdsRegCobros.delete;
                     dm1.cdsRegCobros.Bookmark:=cdsRegCobrosClone.Bookmark;
                     dm1.cdsRegCobros.edit;
                     dm1.cdsRegCobros.FieldByName(Campo).AsFloat:=
                              StrToFloat(edtMtoRecibido.Text)+dm1.cdsRegCobros.FieldByName(Campo).AsFloat;
                     dm1.cdsRegCobros.Post;
                     ActualizaAcumulados;
                     ActualizaItem;
                     bbtnCancelClick(Self);
                     Exit;

                   end
                   else
                   begin
                     exit;
                   end;
               end
               else
               begin
                   with dm1.cdsRegCobros do
                   begin
                         //Borro el actual
                         Cancel;
                         delete;
                         //Inserto uno nuevo
                         Insert;
                         FieldbyName('CIAID').AsString:=CIAID;
                         FieldbyName('ECANOMM').AsString:=ECANOMM;
                         FieldbyName('TDIARID').AsString:=TDIARID;
                         FieldbyName('ECNOCOMP').AsString:=ECNOCOMP;
                   end;

                   //dm1.cdsRegCobros.Edit;
               end;

           end;
           //
     end;

     Result:=true;
end;


function TFDevEfectivo.SegundaValidacion: Boolean;
var
chrAux : Char;
x      : STRING;
begin
//chrAux:=pChar(Copy(edtFormPago.Text,1,1))^;
x:=edtFormPago.Text;
chrAux:=x[1];
result:=False;
case chrAux  of
  'E':
      result:=ValidaEfectivo;
  'C','T':
      result:=ValidaChequeTarjeta;
end;
end;




procedure TFDevEfectivo.ActualizaItem;
var
   BMK:String;
begin
//    with dm1.cdsRegCobros do
    with cdsRegCobrosClone do
    begin
        MessageDlg(inttostr(cdsRegcobrosClone.RecordCount), mtInformation,
              [mbOk], 0);
        bmk:=BookMark;
        if RecordCount<>0 then
        begin
           First;
           while not Eof do
           begin
                edit;
                FieldByName('ORDREGISTRO').AsInteger:=RecNo;
                Next;
           end;
        end;
        BookMark:=BMK;
    end;
end;
procedure TFDevEfectivo.Button2Click(Sender: TObject);
var
   xCurr:Currency;
begin
   xCurr:=RecuperaNumero('22669.336888');
   MessageDlg(currtostr(xCurr), mtInformation,
      [mbOk], 0);

end;

procedure TFDevEfectivo.bbtnCancelPrincipalClick(Sender: TObject);
begin
 self.Close;
end;


procedure TFDevEfectivo.KeyPressGenerico(Sender: TObject; var Key: Char);
var
   xStr : String;
   Pos  : integer;
begin

  if key=#8 then exit;
  if not (key in ['.','0','1','2','3','4','5','6','7','8','9']) then
     key:=#0;

  if Key='.' then
  begin
    if (Sender as Tedit).SelLength=Length((Sender as Tedit).text) then
        exit;    
    xStr:=(Sender as TEdit).Text;
    Pos:=AnsiPos('.',xStr);
    if Pos<>0 then
       key:=#0;
  end;

end;
procedure TFDevEfectivo.FormShow(Sender: TObject);
begin
recibirMonto;
end;


procedure TFDevEfectivo.edtMtoRecibidoChange(Sender: TObject);
var
   xRecibido,
   xDevolver :Currency;
begin
    if not (sender as tEdit).focused then exit   ;

    if edtMtoRecibido.Text='' then
    begin
      edtMtoCobrar.Text:='';
      if edtMtoEquivalente.text<>'' then
         edtMtoEquivalente.text := ''; 
      exit;
    end;
    xRecibido:=strtoCurr(edtMtoRecibido.Text);
    LlenarEquivalente(xRecibido);
    if (edtMtoDevolver.Text='') or (edtMtoDevolver.Text='0.00') then
    begin
         edtMtoCobrar.Text:=floatToStr(xRecibido);
    end
    else
    begin
        xDevolver:=strtoFloat(edtMtoDevolver.Text);
        if xDevolver<xRecibido then
        begin
           edtMtoCobrar.Text:=FloatToStr(xRecibido-xDevolver);
        end
    end;

end;
procedure TFDevEfectivo.edtMtoCobrarChange(Sender: TObject);
var
   xReal ,
   xMontoRecibido ,
   xMontoDevolver: Currency;
begin

    //este codigo esta escrito para hallar el monto restante
    HallarMontoRestante;
    //

    if not (sender as TEdit).focused then exit;

    if edtMtoCobrar.Text='' then
    begin
       edtMtoDevolver.Text:='';
       Exit;
    end;



    xReal:=strtofloat(edtMtoCobrar.text);
    xMontoRecibido:=strtofloat(edtMtoRecibido.text);

    if xReal<=xMontoRecibido then
    begin
       xMontoDevolver:=(xMontorecibido-xReal);
       if xMontoDevolver<>0 then
          edtMtoDevolver.Text:=floattostr(xMontorecibido-xReal)
       else
          edtMtoDevolver.Text:='';

    end;

end;


procedure TFDevEfectivo.edtMtoDevolverChange(Sender: TObject);
var
   xReal ,
   xMontoRecibido : Currency;
begin

    if not (sender as TEdit).focused then exit;
    if edtMtoDevolver.Text='' then
    begin
       edtMtoCobrar.Text:=EDTmTOrECIBIDO.Text;
       Exit;
    end;

    xReal:=strtofloat(edtMtoDevolver.text);
    xMontoRecibido:=strtofloat(edtMtoRecibido.text);

    if xReal<xMontoRecibido then
    begin
       edtMtoCobrar.Text:=floattostr(xMontorecibido-xReal);
    end;

    {    if edtMtoDevolver.Text='' then
    begin
       edtMtoCobrar.Text:='';
       Exit;
    end;

    xReal:=strtofloat(edtMtoDevolver.Text);
    xMontoRecibido:=strToFloat(edtMtoRecibido.Text);
    if xReal <= xMontoRecibido then
    begin
       edtMtoCobrar.Text:=floattostr(xMontoRecibido-xReal);
    end;}


end;

procedure TFDevEfectivo.edtMtoRecibidoExit(Sender: TObject);
var
   xReal:Currency;
begin
   //
   if bbtnCancel.Focused then exit;
   if chkAsigResto.Focused then exit;  
   //
   if edtMtoRecibido.Text='' then
   begin
        ShowMessage('Ingrese Monto Recibido');
        edtMtoRecibido.SetFocus;
        exit;
   end;
   xReal:=strToFloat(edtMtoRecibido.Text);
   if xReal=0 then
   begin
        ShowMessage('Ingrese Monto Recibido');
        edtMtoRecibido.SetFocus;
        exit;
   end;
   edtMtoRecibido.Text:=FloatToStr(xReal);


   //Validacion de xCobrar y xDevolver
   if edtMtoDevolver.Text<>'' then
   begin
      if strtoFloat(edtMtoDevolver.text)>xReal then
      begin
         edtMtoDevolver.text:='';
         edtMtoCobrar.Text:=edtMtoRecibido.Text;
      end;
   end;
//   edtmtorecibido.text:=Format('%12.2f',[xReal])
end;


procedure TFDevEfectivo.edtMtoCobrarExit(Sender: TObject);
var
   xReal:Currency;
begin
   if bbtnCancel.Focused then exit;
   if edtMtoCobrar.Text='' then
   begin
        ShowMessage('Ingrese Monto a Cobrar');
        edtMtoCobrar.SetFocus;
        exit;
   end;
   xReal:=strToFloat(edtMtoCobrar.Text);
   if xReal=0 then
   begin
        ShowMessage('Ingrese Monto a Cobrar');
        edtMtoCobrar.SetFocus;
        exit;
   end;
   edtMtoCobrar.Text:=FloatToStr(xReal);
//   edtmtoCobrar.text:=Format('%12.2f',[xReal])

   //Validacion de xCobrar y xDevolver
   if edtMtoCobrar.Text<>'' then
   begin
      if xReal>strtoFloat(edtMtoRecibido.text) then
      begin
         edtMtoDevolver.text:='';
         edtMtoCobrar.Text:=edtMtoRecibido.Text;
      end;
   end;
end;

procedure TFDevEfectivo.edtMtoDevolverExit(Sender: TObject);
var
   xReal:Currency;
begin
   if bbtnCancel.Focused then exit;
   if edtMtoDevolver.Text='' then
   begin
        edtMtoCobrar.text:=edtMtoRecibido.Text;
        exit;
   end;
   xReal:=strToFloat(edtMtoDevolver.Text);
   if xReal=0 then
   begin
        edtMtoCobrar.text:=edtMtoRecibido.Text;
        exit;
   end;
   edtMtoDevolver.Text:=FloatToStr(xReal);
//   edtmtoCobrar.text:=Format('%12.2f',[xReal])

   //Validacion de xCobrar y xDevolver
   if edtMtoDevolver.Text<>'' then
   begin
      if xReal>strtoFloat(edtMtoRecibido.text) then
      begin
         edtMtoDevolver.text:='';
         edtMtoCobrar.Text:=edtMtoRecibido.Text;
      end;
   end;
end;

procedure TFDevEfectivo.chkAsigRestoClick(Sender: TObject);
var
   xRecibido : Currency ;
begin
  if chkAsigResto.Checked then
  begin
      xRecibido := (Acumulado.RestanteORIG);
      if MONEDA <> inttostr(cboMOneda.Itemindex) then
      begin
           if UpperCase(edtMoneda.Text) = 'LOCAL' then
              xRecibido := xRecibido / TIPOCAMBIO
           else
              xRecibido := xRecibido * TIPOCAMBIO;

           edtMtoRecibido.Text := currtostr(xRecibido);
           edtMtoEquivalente.Text := currtostr(Acumulado.RestanteORIG) ;
      end
      else
      begin
           edtMtoRecibido.Text := currtostr(xRecibido);
           edtMtoEquivalente.Text := edtMtoRecibido.Text ;
      end;

      ///
      edtMtoDevolver.Text := '';
      edtMtoCobrar.Text := edtMtoRecibido.Text;
      ///
      edtMtoRecibido.Enabled := false ;
      edtMtoDevolver.Enabled := false ;
      edtMtoCobrar.Enabled := false ;

  end
  else
  begin
      edtMtoRecibido.Enabled := true ;
      edtMtoDevolver.Enabled := true ;
      edtMtoCobrar.Enabled := true ;
  end;
end;


procedure TFDevEfectivo.ActualizaAcumulados;
var
   currEquivalente:Currency;
begin
         if DM1.cdsRegCobros.FieldByName('TMONID').AsString<>MONEDA then
         begin
             currEquivalente:=RecuperaNumero(edtMtoRecibido.text);
             if MONEDA='0' then
             begin
                currEquivalente:=(currEquivalente*TIPOCAMBIO);
             end
             else
             begin
                currEquivalente:=(currEquivalente/TIPOCAMBIO);
             end;
          end
          else
             currEquivalente:=RecuperaNumero(edtMtoRecibido.text);

        with Acumulado do
        begin
            CobradoORIG:=CobradoORIG+currEquivalente;
            RestanteORIG:=RecuperaNumero(edtMtoOriginal.text)-
                   CobradoORIG;

            if DM1.cdsRegCobros.FieldByName('TMONID').AsString='0' then
            begin
                RecLocalTOT:=RecLocalTOT+RecuperaNumero(edtMtoRecibido.text);
                RecLocalCOB:=RecLocalCOB+RecuperaNumero(edtMtoCobrar.Text);
                DevLocalRES:=DevLocalRES+RecuperaNumero(edtMtoDevolver.Text);
                //RecExtCOB:=RecExtCOB+RecuperaNumero(edtTOTCobEXT.Text);
                //DevExtRES:=DevExtRES+RecuperaNumero(edtDevResExt.Text);
                //RecExtTOT:=RecExtTOT+RecuperaNumero(edtTOTRecExt.text);
            end
            else
            begin
                RecExtTOT:=RecExtTOT+RecuperaNumero(edtMtoRecibido.text);
                DevExtRES:=DevExtRES+RecuperaNumero(edtMtoDevolver.Text);
                RecExtCOB:=RecExtCOB+RecuperaNumero(edtMtoCobrar.Text);
                //RecLocalTOT:=RecLocalTOT+RecuperaNumero(edtTOTRecLocal.text);
                //DevLocalRES:=DevLocalRES+RecuperaNumero(edtDevResLocal.Text);
                //RecLocalCOB:=RecLocalCOB+RecuperaNumero(edtTOTCobLocal.Text);
            end;
        end;
        RefrescaPanelPrincipal;
end;

procedure TFDevEfectivo.RecuperaAcumulados;
var
   currEquivalente:Currency;
begin
     if ADICION then
     begin
          with Acumulado do
          begin
              CobradoORIG:=RecuperaNumero(edtMtoCobrado.Text);
              RestanteORIG:=RecuperaNumero(edtMtoRestante.Text);
              RecLocalTOT:=RecuperaNumero(edtTOTRecLocal.text);
              RecExtTOT:=RecuperaNumero(edtTOTRecExt.text);
              RecLocalCOB:=RecuperaNumero(edtTOTCobLocal.Text);
              RecExtCOB:=RecuperaNumero(edtTOTCobEXT.Text);
              DevLocalRES:=RecuperaNumero(edtDevResLocal.Text);
              DevExtRES:=RecuperaNumero(edtDevResExt.Text);
              ///
              CobradoEfectivoLOCAL := RecLocalCOB+Convertir(RecExtCOB,FALSE);
              CobradoEfectivoEXT := convertir(RecLocalCOB,TRUE)+RecExtCOB;
              ///
          end;
     end
     else
     begin
          //En caso de Edición :
          with Acumulado do
          begin
              if DM1.cdsRegCobros.FieldByName('TMONID').AsString=MONEDA then
              begin
                 CobradoORIG:=RecuperaNumero(edtMtoCobrado.Text)-
                   DM1.cdsRegCobros.FieldByName('').AsCurrency;
                 RestanteORIG:=RecuperaNumero(edtMtoOriginal.text)-
                   CobradoORIG;
              end
              else
              begin
                 //Calcular equivalente em moneda de la transaccion
                 currEquivalente:=DM1.cdsRegCobros.FieldByName('MTOACOBRAR').AsCurrency;
                 if MONEDA='0' then
                 begin
                    currEquivalente:=(currEquivalente*TIPOCAMBIO);
                 end
                 else
                 begin
                    currEquivalente:=(currEquivalente/TIPOCAMBIO);
                 end;
                 CobradoORIG:=RecuperaNumero(edtMtoCobrado.Text)-
                   CurrEquivalente;
                 RestanteORIG:=RecuperaNumero(edtMtoOriginal.text)-
                   CobradoORIG;


              end;

              RecLocalTOT:=RecuperaNumero(edtTOTRecLocal.text)-
                   DM1.cdsRegCobros.FieldByName('').AsCurrency;
              RecExtTOT:=RecuperaNumero(edtTOTRecExt.text)-
                   DM1.cdsRegCobros.FieldByName('').AsCurrency;
              RecLocalCOB:=RecuperaNumero(edtTOTCobLocal.Text)-
                   DM1.cdsRegCobros.FieldByName('').AsCurrency;
              RecExtCOB:=RecuperaNumero(edtTOTCobEXT.Text)-
                   DM1.cdsRegCobros.FieldByName('').AsCurrency;
              DevLocalRES:=RecuperaNumero(edtDevResLocal.Text)-
                   DM1.cdsRegCobros.FieldByName('').AsCurrency;
              DevExtRES:=RecuperaNumero(edtDevResExt.Text)-
                   DM1.cdsRegCobros.FieldByName('').AsCurrency;
              ///
              CobradoEfectivoLOCAL := RecLocalCOB+Convertir(RecExtCOB,FALSE);
              CobradoEfectivoEXT := convertir(RecLocalCOB,TRUE)+RecExtCOB;
              ///

          end;
     end;

end;

procedure TFDevEfectivo.dbgIngresosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key = VK_DELETE) and (ssCtrl in Shift) then
   begin
      if (dm1.cdsRegCobros.RecordCount=0) then
          ShowMessage('No hay registros')
      else
          if MessageDlg('¿Eliminar Registro?',mtconfirmation,[mbYes,mbNo],0)=mrYes then begin
          begin
             dm1.cdsRegCobros.Delete;    // Borro en el original..
             ActualizaItem;
          end;
      end;
   end;

end;


procedure TFDevEfectivo.RefrescaPanelPrincipal;
begin
     edtMtoCobrado.Text := CurrtoStr(Acumulado.CobradoORIG);
     edtMtoRestante.Text := CurrtoStr(Acumulado.RestanteORIG );
     edtTotRecLocal.Text := CurrtoStr(Acumulado.RecLocalTOT );
     edtTotCobLocal.Text := CurrtoStr(Acumulado.RecLocalCOB );
     edtTotRecExt.Text := CurrtoStr(Acumulado.RecExtTOT );
     edtTotCobExt.Text := CurrtoStr(Acumulado.RecExtCOB );
     edtDevResLocal.Text := CurrtoStr(Acumulado.DevLocalRES );
     edtDevResExt.Text := CurrtoStr(Acumulado.DevExtRES );

end;

procedure TFDevEfectivo.bbtnCalcClick2(Sender: TObject);
begin
   WinExec('C:\windows\calc.exe',1);  //Activa la calculadora del Windows
end;
procedure TFDevEfectivo.LlenarEquivalente(xRecibido :Currency);
var
   xEquivalente : Currency ;
begin
     xEquivalente := 0;
     if xRecibido=0 then
     begin
        xEquivalente := 0;
        edtMtoEquivalente.Text := '';
     end
     else
        if MONEDA <> inttostr(cboMOneda.Itemindex) then
        begin
             if UpperCase(edtMoneda.Text) = 'LOCAL' then
                xEquivalente := xRecibido * TIPOCAMBIO
             else
                xEquivalente := xRecibido / TIPOCAMBIO;
             edtMtoEquivalente.Text := currtostr(xEquivalente);
        end
        else
             edtMtoEquivalente.Text := currtostr(xRecibido);

end;

procedure TFDevEfectivo.edtMtoEquivalenteChange(Sender: TObject);
begin
{     if edtMtoEquivalente.Text = '' then
        if (Acumulado.RestanteORIG)=0 then
          edtMtoRestantePnl.Text := ''
        else
          edtMtoRestantePnl.Text := currtostr(Acumulado.RestanteORIG)
     else
        edtMtoRestantePnl.Text := currtostr(Acumulado.RestanteORIG-strtocurr(edtMtoEquivalente.text));}

end;

Function TFDevEfectivo.Convertir(MtoAConvertir: Currency; Dolares: Boolean):Currency;
begin
    if Dolares then
    begin
       MtoAConvertir := MtoAConvertir / TIPOCAMBIO;;
    end
    else
    begin
       MtoAConvertir := MtoAConvertir*TIPOCAMBIO;
    end;
    Result := MtoaConvertir;
end;

procedure TFDevEfectivo.HallarMontoRestante;
var
   xMontoCobrar : Currency ;
begin
   if edtMtoCobrar.Text = '' then
      edtMtoRestantePnl.Text := currtostr(Acumulado.CobradoEfectivoLOCAL)
   else
   begin
        xMontoCobrar := strtocurr(edtMtoCobrar.text);
        if MONEDA <> inttostr(cboMOneda.Itemindex) then
        begin
             if UpperCase(edtMoneda.Text) = 'LOCAL' then
                xMontoCobrar := xMontoCobrar * TIPOCAMBIO
             else
                xMontoCobrar := xMontoCobrar / TIPOCAMBIO;

        end ;
        if UpperCase(edtMoneda.Text) = 'LOCAL' then
             edtMtoRestantePnl.Text := currtostr( strtocurr(edtMtoOriginal.text) -
                                         Acumulado.CobradoEfectivoLOCAL -
                                         xMontoCobrar)

        else
             edtMtoRestantePnl.Text := currtostr( strtocurr(edtMtoOriginal.text) -
                                         Acumulado.CobradoEfectivoLOCAL -
                                         xMontoCobrar);
   end;

end;

end.

unit Caja209;
{   28/12/2001 PJSV, SE MODIFICARON PARA PODER USER EL SLCONTABILIZA
 CAJADM,CAJA001,CAJA201,CAJA228,CAJA204,CAJA209,CAJA218,CAJA235,CAJA240,CAJA233
 // SE AGREGARON PARACONCESIONES
 CAJA245,CAJA246
}

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit, variants,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient,
  CAJADM, oaContabiliza, oaVariables;

type
  TFComVenMon = class(TForm)
    pnlCabecera1: TPanel;
    lblCia: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    pnlCabecera2: TPanel;
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
    dblcTDoc: TwwDBLookupCombo;
    lblTDoc: TLabel;
    edtTDoc: TEdit;
    Label17: TLabel;
    dblcTDiario2: TwwDBLookupCombo;
    edtTDiario2: TEdit;
    dbeNoComp2: TwwDBEdit;
    Label18: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label19: TLabel;
    Label20: TLabel;
    dblcdCnp: TwwDBLookupComboDlg;
    GroupBox1: TGroupBox;
    lblTransac: TLabel;
    lblOriginal: TLabel;
    lblChange: TLabel;
    lblTCambio2: TLabel;
    dbeOriginal: TwwDBEdit;
    dbeChange: TwwDBEdit;
    dbeTCambio: TwwDBEdit;
    Label31: TLabel;
    dbeNoDoc: TwwDBEdit;
    cboTransaccion: TComboBox;
    pnlBotones: TPanel;
    lblEstado: TLabel;
    z2bbtnGraba: TBitBtn;
    z2bbtnCancelado: TBitBtn;
    z2bbtnCancel2: TBitBtn;
    z2bbtnNuevo: TBitBtn;
    z2bbtnCont: TBitBtn;
    z2bbtnAnula: TBitBtn;
    z2bbtnCalc: TBitBtn;
    z2bbtnOKCab: TBitBtn;
    Label1: TLabel;
    dbdtpFEmis: TwwDBDateTimePicker;
    dblcBanco2 : TwwDBLookupCombo;
    dblcBanco : TwwDBLookupCombo;
    edtBanco2 : TEdit;
    edtCuenta2 : TEdit;
    edtCuenta  : TEdit;
    edtBanco : TEdit;
    dblcCCBco2 : TwwDBLookupCombo;
    dblcCCBco  : TwwDBLookupCombo;
    Z2bbtnImprimeI: TBitBtn;
    Z2bbtnImprimeE: TBitBtn;
    procedure IniciaDatos;
    procedure Contab_egrCaja(xCuenta,xDH : string ) ;
    procedure ActPnlBotones;
    procedure dblcCiaExit(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeTCambioChange(Sender: TObject);
    procedure dblcTMon2Exit(Sender: TObject);
    procedure dbeImporte2Exit(Sender: TObject);
    procedure dbeLoteExit(Sender: TObject);
    procedure dbeNoDocChange(Sender: TObject);
    procedure dbeLoteChange(Sender: TObject);
    procedure dbeGlosaChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure dblcTDiario2Exit(Sender: TObject);
    procedure dbdtpFCompChange(Sender: TObject);
    procedure dblcdCnpExit(Sender: TObject);
    procedure bbtnAnulaClick2(Sender: TObject);
    procedure bbtnCalcClick2(Sender: TObject);
    procedure bbtnCancel2Click2(Sender: TObject);
    procedure bbtnCanceladoClick2(Sender: TObject);
    procedure bbtnContClick2(Sender: TObject);
    procedure bbtnGrabaClick2(Sender: TObject);
    procedure bbtnNuevoClick2(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeOriginalChange(Sender: TObject);
    procedure cboTransaccionChange(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);
    procedure dbeNoComp2Exit(Sender: TObject);
    procedure dbeTCambioEnter(Sender: TObject);
    procedure dbeOriginalEnter(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure dbeOriginalExit(Sender: TObject);
    procedure dblcBanco2Exit(Sender: TObject);
    procedure dblcCCBco2Exit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcCCBcoExit(Sender: TObject);
    procedure Z2bbtnImprimeIClick(Sender: TObject);
    procedure Z2bbtnImprimeEClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    cdsCCBco1: TwwClientDataset;
    cdsCCBco2: TwwClientDataset;
    xEstado: String;
    Bandera : Boolean ;
    Soles,Dolares : String;
    A1 : Array of Integer ;
    A2 : Array Of TNotifyEvent ;
    A2digitos ,A4digitos : Array of TWinControl ;
//    cdsComVenEgreso:TWWClientdataset;
    cds: TwwClientDataset;
    strTmp: string;
    xDescrip : String;
    //** 04/06/2001-pjsv, para el nuevo dato (CCBCOVOUCH - TGE106 y CAJA302)
    xVoucher : String;
    xVoucher1 : String;
    //**
    procedure HabilitaBotonCabecera(Panel: TPanel;Boton:TButton);
    procedure ValidacionCabecera;
    procedure ValidacionComprobante ;
    procedure ValidacionMovimiento ;
    procedure RecuperarMovAExtornar(xCIAID, xTDIARID, xECANOMM,
      xECNOCOMP: String);
    procedure CambiaEstado(xName: char);
    procedure BuscaComprobanteOrigen;
    procedure BuscaComprobanteDestino;
    procedure ConfiguraAccesos;
    procedure Proc_Admin;
    procedure Proc_Consul;
    procedure Libera_Admin;
    procedure Libera_Consul;
    procedure LibConfigAccesos;
    procedure RecuperaDescrip;
    procedure HabilitaComp2;
    procedure Comprobante2;
    procedure HabilitaComp;
    procedure Comprobante;
    function  ValidaComprobante (ctrl : TCustomEdit): Boolean ;
    procedure Contabiliza;
    procedure RecuperaComp(Trans_Comp : structComprobante) ;
    procedure HabilitaEdicion;
    procedure RecuperaCabecera(var Trans_Comp : structComprobante) ;
    procedure LLenarDatosCab;
    procedure RecDescripCabecera ;
    procedure LLenaDescripCab ;
    procedure DescripCVME(const xCIAID, xECANOMM, xTDIARID, xECNOCOMP: String);

  public
    { Public declarations }
//    procedure Edita (Comp : structComprobante) ;
    procedure Edita (Trans_Comp : structComprobante;cds : Twwclientdataset);
    procedure Adiciona ;
  end;

var
  FComVenMon: TFComVenMon;
  wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,
  wbcancel2: Boolean;
  wmodifica: Boolean;

implementation

uses CAJAUTIL;

{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}

procedure TFComVenMon.IniciaDatos;
begin
   pnlCabecera1.Enabled  := True ;
   pnlCabecera2.Enabled  := True ;
   pnlBotones.Enabled    := True ;

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
////   bbtnOk.Enabled        := False;
////   bbtnCancel.Enabled    := False;
//   bbtnSumat.Enabled     := False;
   z2bbtnCont.Enabled      := False;
   Z2bbtnNUevo.Visible     := True ;
   z2bbtnNuevo.Enabled     := False;
   z2bbtnImprimeI.Enabled   := False;
   z2bbtnImprimeE.Enabled   := False;
   z2bbtnGraba.Enabled     := False;
   z2bbtnCancelado.Enabled := False;
   z2bbtnCancel2.Enabled   := False;
   z2bbtnAnula.Enabled     := False;

   dblcCia.Text      := '';   // Código de Compañía
   edtCia.Enabled    := False;
   edtCia.Text       := '';   // Descripción de la Compañía
   dbdtpFComp.Enabled:= True;
   dbdtpFComp.Date   := DateS; // Fecha de Comprob.
   dbdtpFEmis.Enabled:= True;
   dbdtpFEmis.Date   := DateS; // Fecha de Comprob.   edtPeriodo.Enabled:= False;
   edtPeriodo.Text   := '';   // Periodo
   dblcTDiario.Text  := '';   // Tipo de Diario
   edtTDiario.Enabled:= False;
   dblcTDiario2.Text  := '';   // Tipo de Diario
   edtTDiario2.Enabled:= False;
   edtTDiario.Text   := '';   // Descripción del T.Diario
   dbeNoComp.Text    := '';   // Comprobante
   dblcTDoc.Text     := '';   // Tipo de Documento
   edtTDoc.Enabled   := False;
   edtTDoc.Text      := '';   // Descripción del T.Doc
   dbeNoDoc.Text     := '';   // Nro.Documento
   dbeLote.Text      := '';   // Lote
   dblcdCnp.Text      := '';   // Concepto
   dbeGlosa.Text     := '';   // Glosa
   dbeGlosa.Text     := '';   // Glosa
   dblcTDoc.Text:= '';
   dbeLote.Text:= '';
   dbeNoDoc.Text:= '';
   dblcdCnp.Text:= '';
   dbeGlosa.Text:='';
   cboTransaccion.ItemIndex:=-1    ;
   dbeTCambio.Text:= '';
   dbeOriginal.Text:= '';
   dbeChange.Text:= '';
   lblEstado.Caption := '';   //Inicializar el Estado
   //** 04/04/2001 - pjsv
   edtTDiario2.text := '';
   dbeNoComp2.text := '';
   //**

   dblcBanco.text := '';
   edtBanco.text := '';
   dblcCcbco.text := '';
   edtCuenta.text := '';
   dblcBanco2.text := '';
   edtBanco2.text := '';
   dblcCcbco2.text := '';
   edtCuenta2.text := '';

   RecuperarCiaUnica(dblcCia,edtCia) ;
   edtPeriodo.text:=strano(dbdtpFComp.date)
                      +strMes(dbdtpFComp.date) ;
   if self.Showing then
   begin
      pnlCabecera1.SetFocus ;
      perform(CM_DialogKey,VK_TAB,0);
   end
end;

{*******************************************************
PRIMER PANEL - DATOS INICIALES DE LA CABECERA
*******************************************************}

procedure TFComVenMon.dblcCiaExit(Sender: TObject);
var
   xSQL : string;
begin
   if Bandera  then exit ;
   if dblcCia.Text='' then
      ShowMessage('Ingrese Compañía')
   else
   begin
      xSQL := 'SELECT * FROM TGE101 WHERE CIAID='+quotedstr(dblcCia.text);
      DMTE.cdsSQL.Close;
      DMTE.cdsSQL.DataRequest(xSQL);
      DMTE.cdsSQL.Open;
      edtCia.Text := DMTE.cdsSql.Fieldbyname('CIADES').AsString;
     //**
     //** viene del OnChange
     BuscaComprobanteOrigen;
     BuscaComprobanteDestino;
     HabilitaBotonCabecera(pnlCabecera1,z2bbtnOkcab);
     DMTE.cdsBancoEgr.Filter:='CIAID='+QuotedStr(dblcCia.text);
     DMTE.cdsBancoEgr.Filtered:=True;
   end;
end;

procedure TFComVenMon.dbdtpFCompExit(Sender: TObject);
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
    if edtPeriodo.Text<>Periodo then
       edtPeriodo.Text:=Periodo;
end;
end;




{*******************************************************
SEGUNDO PANEL - DATOS ADICIONALES DE LA CABECERA
*******************************************************}

procedure TFComVenMon.dbeTCambioChange(Sender: TObject);
begin
   if ( sender as twincontrol).focused then
      wmodifica:=true;
end;

procedure TFComVenMon.dblcTDocExit(Sender: TObject);
begin
   xDescrip := 'DOCID='+quotedstr(dblcTDoc.text);
   edtTDoc.text := DMTE.DisplayDescrip('prvTGE','TGE110','DOCABR',xDescrip,'DOCABR');
   If edtTDoc.text = '' then
     begin
      showmessage('Falta Tipo de Documento');
       dblcTDoc.SetFocus;
     end
   else
      dbeNodoc.enabled := true;
   wmodifica:=True;
end;

procedure TFComVenMon.ActPnlBotones;
begin
//   bbtnSumat.Enabled    := wbSumat;
   z2bbtnCont.Enabled     := wbCont;
   z2bbtnNuevo.Enabled    := wbNuevo;
   z2bbtnImprimeI.Enabled  := wbImprime;
   z2bbtnImprimeE.Enabled  := wbImprime;
   z2bbtnGraba.Enabled    := wbGraba;
   z2bbtnCancelado.Enabled:= wbCancelado;
   z2bbtnCancel2.Enabled  := wbCancel2;
   z2bbtnAnula.Enabled    := wbAnula;
end;

procedure TFComVenMon.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if DMTE.cdsEgrCaja.active then
      DMTE.cdsEgrCaja.CancelUpdates;

   // Limpiamos los filtros
   DMTE.cdsEgrCaja.Filtered:=False;
   DMTE.cdsCntCaja.Filtered:=False;
   DMTE.cdsCCBco.Filtered  :=False;
   if PnlCabecera1.Enabled then
      pnlCabecera1.SetFocus
   else if pnlCabecera2.Enabled then
           pnlcabecera2.SetFocus
        else if pnlBotones.Enabled then
                pnlBotones.SetFocus ;

   FVariables.w_Num_Formas:=FVariables.w_Num_Formas-1;
   Action:=caFree;
end;

procedure TFComVenMon.dbeImporte2Exit(Sender: TObject);

begin
end;



{procedure TFComVenMon.dbeFPagoChange(Sender: TObject);
var
  tipo:Char;
  p:Pchar;
begin
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

end;}


procedure TFComVenMon.dbeLoteExit(Sender: TObject);
begin
   dbeLote.text:=DMTE.StrZero(dbeLote.text,DMTE.cdsEgrCaja.FieldByName('ECLOTE').Size);
end;

procedure TFComVenMon.dbeNoDocChange(Sender: TObject);
begin
   if ( sender as twincontrol).focused then
      wmodifica:=true;

end;

procedure TFComVenMon.dbeLoteChange(Sender: TObject);
begin
   if ( sender as twincontrol).focused then
      wmodifica:=true;

end;


procedure TFComVenMon.dbeGlosaChange(Sender: TObject);
begin
   if ( sender as twincontrol).focused then
      wmodifica:=true;

end;

procedure TFComVenMon.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFComVenMon.z2bbtnOKCabClick(Sender: TObject);
begin
   //EC_PROCE='9'
   ValidacionCabecera ;
   with DMTE do
   begin
      cdsEgrCaja.SetKey;
      cdsEgrCaja.FieldByName('CIAID').Value   :=dblcCia.Text;
      cdsEgrCaja.FieldByName('TDIARID').Value :=dblcTDiario.Text;
      cdsEgrCaja.FieldByName('ECANOMM').Value :=edtPeriodo.Text;
      cdsEgrCaja.FieldByName('ECNOCOMP').Value:=dbeNoComp.Text;
      if cdsEgrCaja.GotoKey then
      begin
      //wmckkk
             if cdsEgrCaja.FieldByName('EC_PROCE').Value<>'9' then
             begin
                ShowMessage('Comprobante ya esta registrado por otro Modulo');
                dbeNoComp.Text:='';
                dbeNoComp.SetFocus;
                exit;
             end;
              Bandera := True ;
              dblcTDiario2.LookupTable.Locate('TDIARID', dblcTDiario2.Text,[]);
              edtTDiario2.Text:=dblcTDiario2.LookupTable.FieldByName('TDIARDES').AsString;
              Bandera := False ;
              ////


           with cdsEgrCaja do
             begin
                   RecuperarMovAExtornar(FieldByName('CIAID').AsString,
                                         FieldByName('TDIARIO2').AsString,
                                         FieldByName('ECANOMM2').AsString,
                                         FieldByName('ECNOCOMP2').AsString);


                   //Recuperar el resto de campos
                   dblcTDoc.Text:= FieldByName('DOCID').AsString;
                   dbeLote.Text:= FieldByName('ECLOTE').AsString;
                   dbeNoDoc.Text:= FieldByName('ECNODOC').AsString;
                   dblcdCnp.Text:= FieldByName('CPTOID').AsString;
                   dbeGlosa.Text:=FieldByName('ECGLOSA').AsString;
                   if FieldByName('TMONID').AsString=DOLARES  then
                      cboTransaccion.ItemIndex:=0
                   else
                      cboTransaccion.ItemIndex:=1;

                   dbeTCambio.Text:= FieldByName('ECTCAMB').AsString;
                   dbeOriginal.Text:= FieldByName('ECMTOEXT').AsString;
                   dbeChange.Text:= FieldByName('ECMTOLOC').AsString;


             end;

             if cdsEgrCaja.FieldByName('ECEstado').Value='I' then //Si está INCOMPLETO o PENDIENTE
             begin
                cdsEgrCaja.Edit;
                CambiaEstado ('I');
                ActPnlBotones;
             end;

             if cdsEgrCaja.FieldByName('ECEstado').Value='C' then      //Si está CANCELADO
             begin
                CambiaEstado('C');
                ActPnlBotones;
             end;

             if cdsEgrCaja.FieldByName('ECEstado').Value='A' then      // Si esta ANULADO
             begin
                CambiaEstado('A');
                ActPnlBotones;
             end;
      end
      else
      begin
///////////////////////////
          if trim(dbeNoComp2.Text) = '' then
          begin
               ShowMessage('Ingrese Número de Comprobante'+ #13+'del Egreso de la Compra Venta');
               exit;
          end;
          if (dblcTdiario.Text = dblctdiario2.text) and (dbeNocomp.Text=dbeNoComp2.Text) then
              dbeNoComp2.Text := DMTE.StrZero(inttostr(strtoint64(dbeNoComp2.text)+1),10)
          else
          begin
              //wmckkk
          end;

        cdsEgrCaja.Insert;
        CambiaEstado('N');
        ActPnlBotones;

      end;
   end;
   (Sender as tcontrol).enabled:=false;
   wmodifica:=False;
end;

procedure TFComVenMon.dblcTDiarioExit(Sender: TObject);
var
 xWhere:string;
begin
   xDescrip := 'TDIARID='+quotedstr(dblcTDiario.text);
   edtTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE104','TDIARDES',xDescrip,'TDIARDES');
   if edtTDiario.Text<>'' then
    begin
      xWhere:='CIAID='+quotedstr(dblcCia.Text)+' AND ECANOMM='+quotedstr(edtPeriodo.Text)
             +' AND TDIARID='+ quotedstr(dblcTDiario.Text); // + ' AND EC_PROCE='+quotedstr('1');
      dbeNoComp.text:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text, StrToInt(dbeNoComp.text));
      HabilitaComp ;
      Comprobante ;
    end
   else
     begin
      showmessage('Falta Tipo de Diario');
     end;
end;


procedure TFComVenMon.dblcTDiario2Exit(Sender: TObject);
var
 xWhere:string;
begin
   xDescrip := 'TDIARID='+quotedstr(dblcTDiario2.text);
   edtTDiario2.Text := DMTE.DisplayDescrip('prvTGE','TGE104','TDIARDES',xDescrip,'TDIARDES');
   if edtTDiario2.Text<>'' then
    begin
      xWhere:='CIAID='+quotedstr(dblcCia.Text)+' AND ECANOMM='+quotedstr(edtPeriodo.Text)
             +' AND TDIARID='+ quotedstr(dblcTDiario2.Text); // + ' AND EC_PROCE='+quotedstr('1');
      dbeNoComp2.text:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      dbeNoComp2.text:=DMTE.StrZero(dbeNoComp2.text, StrToInt(dbeNoComp2.text));
      HabilitaComp2 ;
      Comprobante2 ;
    end
   else
     begin
      showmessage('Falta Tipo de Diario');
      dblcTDiario2.SetFocus;
     end;
end;

procedure TFComVenMon.HabilitaBotonCabecera(Panel: TPanel;Boton: TButton);
var
  i:byte;
begin
  boton.Enabled:=False;
  for i:=0 to Panel.ControlCount-1 do
  begin
   if (Panel.Controls[i] is TCustomEdit) then
      if ((panel.Controls[i] as TCustomEdit).text='') and (panel.Controls[i].tag=1) then
        exit;
  end;
  Boton.Enabled:=True;
end;


procedure TFComVenMon.dbdtpFCompChange(Sender: TObject);
Var
   Periodo:String;
begin
   if not (Sender as twincontrol).focused then
      exit ;
   if Bandera  then exit ;
   if dbdtpFComp.Date=0 then
   begin
        edtPeriodo.text:='';
   end
   else
   begin
      Periodo:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
      if edtPeriodo.text<>Periodo then
      begin
         edtPeriodo.text:=Periodo;
      end;
   end;
   ////
   BuscaComprobanteOrigen;
   BuscaComprobanteDestino;
   HabilitaBotonCabecera(pnlCabecera1,z2bbtnOkcab);
   ////
end;


procedure TFComVenMon.dblcTMon2Exit(Sender: TObject);
begin
{if edtTMon2.Text='' then
begin
    if dblcTMon2.Text='' then
      ShowMessage('Ingrese Tipo de Moneda')
    else
      ShowMessage('El Tipo de Moneda que ha Ingresado'+#13 +
                  'No está registrado');
    (Sender as twincontrol).SetFocus;
end}
end;


procedure TFComVenMon.dblcdCnpExit(Sender: TObject);
var
 xAux : string;
begin
{  if dblcdCnp.Text='' then
   begin
      ShowMessage('Ingrese Concepto');
      dblcdCnp.SetFocus;
   end
  else
   begin}
    xDescrip := 'CPTOID='+quotedstr(dblcdCnp.Text);
    dbeGlosa.text := DMTE.DisplayDescrip('prvCnpEgr','CAJA201','CPTODES, CUENTAID',xDescrip,'CPTODES');
    xAux :=          DMTE.cdsQry.fieldbyName('CUENTAID').asString;
    wmodifica:=true;
//   end;
end;

procedure TFComVenMon.ValidacionCabecera;
begin
     if trim(dblccia.text)='' then
     begin
          dblccia.SetFocus ;
          Raise ExCeption.Create ('Ingrese Compañía ') ;
     end;
     if dbdtpFComp.Date=0 then
     begin
          dbdtpFComp.SetFocus;
          Raise ExCeption.Create ('Ingrese Fecha de Comprobante');
     end;
     if trim(edtPeriodo.text)='' then
     begin
          dbdtpFComp.SetFocus;
          Raise ExCeption.Create ('Ingrese Fecha de Comprobante');
     end;
     if trim(dblcTDiario.text)='' then
     begin
          dblcBanco.SetFocus;
          Raise ExCeption.Create ('Banco no esta Relacionado a Tipo de Diario');
     end;
     if trim(dbeNocomp.text)='' then
     begin
          dbeNocomp.SetFocus;
          Raise ExCeption.Create ('Ingrese Número de Comprobante');
     end;
     if trim(dbeNocomp2.text)='' then
     begin
          dbeNocomp2.SetFocus;
          Raise ExCeption.Create ('Ingrese Número de Comprobante');
     end;

end;

procedure TFComVenMon.RecuperarMovAExtornar(xCIAID,xTDIARID,xECANOMM,xECNOCOMP : String);
begin
end;

Procedure TFComVenMon.CambiaEstado(xName:char);
begin
   case xName of
     'I':begin  //Si está INCOMPLETO o PENDIENTE
            pnlBotones.Enabled   := True;
            lblEstado.Caption    :='Activo             ';
            pnlCabecera1.Enabled := False;
            pnlCabecera2.Enabled := True;

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
            pnlCabecera2.Enabled := False;    // Desactivar Panel2
            pnlBotones.Enabled   := True;     // Activar Panel de Botones


//            bbtnOk.Enabled       := False;
//            bbtnCancel.Enabled   := False;

            if DMTE.cdsEgrCaja.FieldByName('ECConta').Value='S' then
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
         end;

     'A':begin
            lblEstado.Caption     :='Anulado            ';
            pnlCabecera1.Enabled := False;    // Desactivar Panel1
            pnlCabecera2.Enabled := False;    // Desactivar Panel2
            pnlBotones.Enabled   := True;     // Activar Panel de Botones

//            bbtnOk.Enabled        := False;
//            bbtnCancel.Enabled    := False;

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
            pnlBotones.Enabled   := True;
            lblEstado.Caption:='Nuevo     ';
            pnlCabecera1.Enabled := True ;
            pnlCabecera2.Enabled := True ;

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


procedure TFComVenMon.bbtnAnulaClick2(Sender: TObject);
begin
    if DMTE.cdsEgrCaja.FieldByName('ECEstado').Value='I' then
    begin

      if MessageDlg('¿Anular Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin
         DMTE.cdsEgrCaja.CancelUpdates;
         DMTE.cdsEgrCaja.Edit;
         DMTE.cdsEgrCaja.FieldByName('ECEstado').Value:='A';

         DMTE.cdsEgrCaja.ApplyUpdates(0);

         z2bbtnNuevo.Enabled    := True;
         z2bbtnCont.Enabled     := False;
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
procedure TFComVenMon.bbtnCalcClick2(Sender: TObject);
begin
   WinExec('calc.exe',1);  //Activa la calculadora del Windows
end;
procedure TFComVenMon.bbtnCancel2Click2(Sender: TObject);
begin
   if MessageDlg('¿Cancelar los cambios?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin
      DMTE.cdsEgrCaja.CancelUpdates;
      IniciaDatos;
      //** 05/06/2001 - pjsv, para grabar el nuevo voucher
      xVoucher := '';
      //**
   end;
end;

procedure TFComVenMon.bbtnCanceladoClick2(Sender: TObject);
var
   xSQL : String;
begin
  if DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString='I' then
  begin
    if wmodifica then
    begin
      ShowMessage('Debe grabar primero las actualizaciones realizadas') ;
      exit ;
    end ;

    if MessageDlg('¿Efectuar la Cancelacion del Comprobante?',mtConfirmation,
                 [mbYes, mbNo], 0) = mrYes then
    begin
      if DMTE.cdsEgrCaja.Locate('CIAID;ECANOMM;TDIARID;ECNOCOMP',
                                  VarArrayOf([dblcCia.text,edtPeriodo.Text,dblcTDiario.text,dbeNoComp.Text ]), [loPartialKey]) then
         DMTE.cdsEgrCaja.Edit
      else
      begin
        ShowMessage('Error al Grabar');
        Exit;
      end;

      DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString := 'C' ;
      DMTE.cdsEgrCaja.FieldByName('ECUSER').Value     := DMTE.wUsuario;
      DMTE.cdsEgrCaja.FieldByName('ECFREG').Value     := DateS;
      DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;
      cdspost(DMTE.cdsEgrCaja);
    	 xSQL:='Select * from CAJA302 '
           +'Where CIAID='''   +dblcCia.Text    +''' and '
           +      'ECANOMM=''' +edtPeriodo.Text +''' and '
           +      'TDIARID=''' +dblcTDiario.Text+''' and '
           +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
      DMTE.cdsEgrCaja.DataRequest( xSQL );
      DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

      if DMTE.cdsEgrCaja.Locate('CIAID;ECANOMM;TDIARID;ECNOCOMP',
                    VarArrayOf([dblcCia.text,edtPeriodo.Text,dblcTDiario2.text,dbeNoComp2.Text ]), [loPartialKey]) then
        DMTE.cdsEgrCaja.Edit
      else
      begin
        ShowMessage('Error al Grabar');
        Exit;
      end;
      DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString := 'C' ;
      DMTE.cdsEgrCaja.FieldByName('ECUSER').Value     := DMTE.wUsuario;
      DMTE.cdsEgrCaja.FieldByName('ECFREG').Value     := DateS;
      DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;
      cdspost(DMTE.cdsEgrCaja);
      xSQL:='Select * from CAJA302 '
             +'Where CIAID='''   +dblcCia.Text    +''' and '
             +      'ECANOMM=''' +edtPeriodo.Text +''' and '
             +      'TDIARID=''' +dblcTDiario2.Text+''' and '
             +      'ECNOCOMP='''+dbeNoComp2.Text  +''' ';
      DMTE.cdsEgrCaja.DataRequest( xSQL );
      DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

      z2bbtnCont.Enabled     := True ;
      z2bbtnGraba.Enabled    := False ;
      z2bbtnCancelado.Enabled:= False ;
      z2bbtnCancel2.Enabled  := False ;
      z2bbtnAnula.Enabled    := False ;
      lblEstado.Caption      := 'Cancelado          ' ;
    end ;
  end
  else
  begin
      ShowMessage('Imposible Cancelar') ;
  end ;
end ;

procedure TFComVenMon.bbtnContClick2(Sender: TObject);
Var
   xSql,xRemt : String;
begin
   //** 12/09/2001 - pjsv
   If DMTE.MesCerrado(copy(edtPeriodo.text,5,2),copy(edtPeriodo.text,1,4),dblcCia.text) then
    begin
     ShowMessage(' Mes cerrado, no se puede contabilizar');
     exit;
    end;
   //**

   if MessageDlg('¿Contabilizar y Generar Asientos Automaticos?',mtConfirmation,
                [mbYes, mbNo], 0)=mrYes then
   begin

      screen.Cursor := crHourGlass ;

		  Contabiliza;

      ActualizaCNT311( dblcCia.Text, dblcTDiario.Text, dbeNoComp.Text, edtPeriodo.Text );

      if SOLConta( dblcCia.Text, dblcTDiario.Text, edtPeriodo.Text, dbeNoComp.Text,
                   DMTE.SRV_D, 'C', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                   DMTE.cdsResultSet, DMTE.DCOM1, Self ) then
      begin

      end
      else begin
         ShowMessage('Error');
         screen.Cursor := crDefault ;
         Exit;
      end;

      ActualizaCNT311( dblcCia.Text, dblcTDiario2.Text, dbeNoComp2.Text, edtPeriodo.Text );

      if SOLConta( dblcCia.Text, dblcTDiario2.Text, edtPeriodo.Text, dbeNoComp2.Text,
                   DMTE.SRV_D, 'C', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                   DMTE.cdsResultSet, DMTE.DCOM1, Self ) then
      begin

         if DMTE.cdsEgrCaja.Locate('CIAID;ECANOMM;TDIARID;ECNOCOMP',
                    VarArrayOf([dblcCia.text,edtPeriodo.Text,dblcTDiario.text,dbeNoComp.Text ]), [loPartialKey]) then
         DMTE.cdsEgrCaja.Edit
         else begin
            ShowMessage('Error al Grabar');
            Exit;
         end;
         DMTE.cdsEgrCaja.Edit;
         DMTE.cdsEgrCaja.fieldByname('ECConta').Value:='S';   //Establece como Contabilizado el flag
         DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString:= 'C';
         DMTE.cdsEgrCaja.FieldByName('ECUSER').Value     := DMTE.wUsuario;
         DMTE.cdsEgrCaja.FieldByName('ECFREG').Value     := DateS;
         DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;
         DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

         if DMTE.cdsEgrCaja.Locate('CIAID;ECANOMM;TDIARID;ECNOCOMP',
                    VarArrayOf([dblcCia.text,edtPeriodo.Text,dblcTDiario2.text,dbeNoComp2.Text ]), [loPartialKey]) then
         DMTE.cdsEgrCaja.Edit
         else begin
            ShowMessage('Error al Grabar');
            Exit;
         end;
         
         DMTE.cdsEgrCaja.Edit;
         DMTE.cdsEgrCaja.FieldByName('ECConta').AsString := 'S' ;   //Establece como Contabilizado el flag
         DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString:= 'C';
         DMTE.cdsEgrCaja.FieldByName('ECUSER').Value     := DMTE.wUsuario;
         DMTE.cdsEgrCaja.FieldByName('ECFREG').Value     := DateS;
         DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;
         DMTE.cdsEgrCaja.Post;
         DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

         lblEstado.Caption  :='Cancelado y Contab.' ;
         Z2bbtnCont.Enabled := False ;
         ShowMessage('Contabilización OK') ;
      end
      else
        ShowMessage('Error en Contabilización') ;

      screen.Cursor := crDefault ;

   end ;
end;


procedure TFComVenMon.bbtnGrabaClick2(Sender: TObject);
var
   xWhere , Aux , xModo : String ;
   xSQL : string;
begin
   xModo := 'E' ;
   ValidacionCabecera ;
   if pnlCabecera1.Enabled = True then
   begin
      xModo := 'A' ;
      ValidacionComprobante ;
      pnlCabecera1.Enabled := False ;
   end;

   ValidacionMovimiento ;

   if MessageDlg('¿Grabar?',mtConfirmation,[mbYes, mbNo], 0) = mrYes then
   begin
      with DMTE do
      begin
         if xModo = 'A' then
            cdsEgrCaja.Insert
         else begin
            if DMTE.cdsEgrCaja.Locate('CIAID;ECANOMM;TDIARID;ECNOCOMP',
                          VarArrayOf([dblcCia.text,edtPeriodo.Text,dblcTDiario.text,dbeNoComp.Text ]),[loPartialKey]) then
               cdsEgrCaja.Edit ;
         end;

         cdsEgrCaja.FieldByName('CIAID').Value   :=dblcCia.Text;
         cdsEgrCaja.FieldByName('TDIARID').Value :=dblcTDiario.Text;
         cdsEgrCaja.FieldByName('ECANOMM').Value :=edtPeriodo.Text;
         cdsEgrCaja.FieldByName('ECNOCOMP').Value:=dbeNoComp.Text;
         // Comprobante del documento relacionado
         cdsEgrCaja.FieldByName('TDIARIO2').Value := dblcTDiario2.Text; ; //    dblcTDiario.Text;
         cdsEgrCaja.FieldByName('ECNOCOMP2').Value := dbeNoComp2.Text;       //dbeNoComp.Text;
         cdsEgrCaja.FieldByName('BANCOID').Value := dblcBanco.Text;
         cdsEgrCaja.FieldByName('CCBCOID').Value := dblcCCBco.Text;
         cdsEgrCaja.FieldByName('CUENTAID').Value := edtCuenta.Text;
         cdsEgrCaja.FieldByName('CCBCOVOUCH').Value := xVoucher;
         cdsEgrCaja.FieldByName('ECFCOMP').Value :=dbdtpFComp.Date;
         cdsEgrCaja.FieldByName('DOCID').Value   :=dblcTDoc.Text;
         cdsEgrCaja.FieldByName('ECNODOC').Value :=dbeNoDoc.Text;

         if cboTransaccion.ItemIndex = 0 then // Compra
         begin
            cdsEgrCaja.FieldByName('TMONID').AsString   := DMTE.wTMonExt ;
            cdsEgrCaja.FieldByName('ECMTOORI').AsString := dbeOriginal.text ;
         end
         else                                 // Venta
         begin
            cdsEgrCaja.FieldByName('TMONID').Value  := DMTE.wTMonLoc ;
            cdsEgrCaja.FieldByName('ECMTOORI').AsString := dbeChange.text ;
         end;

         cdsEgrCaja.FieldByName('ECMTOLOC').AsString   := dbeChange.Text ;
         cdsEgrCaja.FieldByName('ECMTOEXT').AsString   := dbeOriginal.Text ;
         cdsEgrCaja.FieldByName('ECTCAMB').ASFloat     := strtofloat(dbeTCambio.text);
         cdsEgrCaja.FieldByName('CPTOID').Value        := dblcdCnp.Text;
         cdsEgrCaja.FieldByName('ECGLOSA').Value       := dbeGlosa.Text;
         cdsEgrCaja.FieldByName('ECLOTE').Value        := dbeLote.Text;
         cdsEgrCaja.FieldByName('ECESTADO').Value      := 'I';
         xWhere:='FECHA=' +DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date)+''')' ;
         aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
         cdsEgrCaja.FieldByName('ECANO').Value         := cdsqry.FieldByName('FecAno').Value;
         cdsEgrCaja.FieldByName('ECMM').Value          := cdsqry.FieldByName('FecMes').Value;
         cdsEgrCaja.FieldByName('ECDD').Value          := cdsqry.FieldByName('FecDia').Value;
         cdsEgrCaja.FieldByName('ECSS').Value          := cdsqry.FieldByName('FecSS').Value;
         cdsEgrCaja.FieldByName('ECSEM').Value         := cdsqry.FieldByName('FecSem').Value;
         cdsEgrCaja.FieldByName('ECTRI').Value         := cdsqry.FieldByName('FecTrim').Value;
         cdsEgrCaja.FieldByName('ECAASS').Value        := cdsqry.FieldByName('FecAASS').Value;
         cdsEgrCaja.FieldByName('ECAASem').Value       := cdsqry.FieldByName('FecAASem').Value;
         cdsEgrCaja.FieldByName('ECAATri').Value       := cdsqry.FieldByName('FecAATri').Value;
         cdsEgrCaja.FieldByName('EC_PROCE').Value      := '9';
         cdsEgrCaja.FieldByName('EC_IE').Value         := 'I';
         DMTE.cdsEgrCaja.FieldByName('ECUSER').Value     := DMTE.wUsuario;
         DMTE.cdsEgrCaja.FieldByName('ECFREG').Value     := DateS;
         DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;

         cdspost(DMTE.cdsEgrCaja);
         xSQL:='Select * from CAJA302 '
                +'Where CIAID='''   +dblcCia.Text    +''' and '
                +      'ECANOMM=''' +edtPeriodo.Text +''' and '
                +      'TDIARID=''' +dblcTDiario.Text+''' and '
                +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
         DMTE.cdsEgrCaja.DataRequest( xSQL );
         DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');
       end;

       // vhn 23/01/2001
       xSQL:='Select * from CAJA301 '
            +'Where CIAID='''   +dblcCia.Text    +''' and '
            +      'ECANOMM=''' +edtPeriodo.Text +''' and '
            +      'TDIARID=''' +dblcTDiario.Text+''' and '
            +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
       DMTE.cdsRegCxP.Close;
       DMTE.cdsRegCxP.DataRequest( xSQL );
       DMTE.cdsRegCxP.Open;

       with DMTE.cdsRegCxP do
       begin
          if xModo = 'A' then
          begin
             Insert ;
          end
          else
          begin
             Edit ;
          end ;
          fieldByName('CIAID').AsString    := DMTE.cdsEgrCaja.fieldbyName('CIAID').AsString ;
          fieldByName('TDIARID').AsString  := DMTE.cdsEgrCaja.fieldbyName('TDIARID').AsString ;
          fieldByName('ECANOMM').AsString  := DMTE.cdsEgrCaja.fieldbyName('ECANOMM').AsString ;
          fieldByName('ECNOCOMP').AsString := DMTE.cdsEgrCaja.fieldbyName('ECNOCOMP').AsString ;
          fieldByName('TMONID').AsString   := DMTE.cdsEgrCaja.fieldbyName('TMONID').AsString ;
          fieldByName('DEDH').AsString     := 'D';
          fieldByName('DEMTOORI').AsString := DMTE.cdsEgrCaja.fieldbyName('ECMTOORI').AsString ;
          fieldByName('DEMTOLOC').AsString := DMTE.cdsEgrCaja.fieldbyName('ECMTOLOC').AsString ;
          fieldByName('DEMTOEXT').AsString := DMTE.cdsEgrCaja.fieldbyName('ECMTOEXT').AsString ;
          fieldByName('CPTOID').AsString := DMTE.cdsEgrCaja.fieldbyName('CPTOID').AsString ;
          Post ;
          ApplyUpdates(0) ;
       end ;
       //fin de grabación del detalle contable

       with DMTE do
       begin
         if xModo = 'A' then
            cdsEgrCaja.Insert
         else begin
            if DMTE.cdsEgrCaja.Locate('CIAID;ECANOMM;TDIARID;ECNOCOMP',
                          VarArrayOf([dblcCia.text,edtPeriodo.Text,dblcTDiario2.text,dbeNoComp2.Text ]), [loPartialKey]) then
               cdsEgrCaja.Edit
            else begin
               ShowMessage('Error al Grabar');
               Exit;
            end;
         end;

         cdsEgrCaja.FieldByName('CIAID').Value   :=dblcCia.Text;
         cdsEgrCaja.FieldByName('TDIARID').Value :=dblcTDiario2.Text;
         cdsEgrCaja.FieldByName('ECANOMM').Value :=edtPeriodo.Text;
         cdsEgrCaja.FieldByName('ECNOCOMP').Value:=dbeNoComp2.Text;
         cdsEgrCaja.FieldByName('BANCOID').Value := dblcBanco2.Text;
         cdsEgrCaja.FieldByName('CCBCOID').Value := dblcCCBco2.Text;
         cdsEgrCaja.FieldByName('CUENTAID').Value := edtCuenta2.Text;
         cdsEgrCaja.FieldByName('CCBCOVOUCH').Value := xVoucher1;
         cdsEgrCaja.FieldByName('TDIARIO2').Value := dblcTDiario.Text; ; //    dblcTDiario.Text;
         cdsEgrCaja.FieldByName('ECNOCOMP2').Value := dbeNoComp.Text;       //dbeNoComp.Text;
         cdsEgrCaja.FieldByName('ECFCOMP').Value :=dbdtpFComp.Date;
         cdsEgrCaja.FieldByName('DOCID').Value   :=dblcTDoc.Text;
         cdsEgrCaja.FieldByName('ECNODOC').Value :=dbeNoDoc.Text;
         ///
         if cboTransaccion.ItemIndex = 0 then // Compra
         begin
            cdsEgrCaja.FieldByName('TMONID').AsString   := DMTE.wTMonLoc ;
            cdsEgrCaja.FieldByName('ECMTOORI').AsString := dbeChange.text ;
         end
         else                                 // Venta
         begin
            cdsEgrCaja.FieldByName('TMONID').Value  := DMTE.wTMonExt ;
            cdsEgrCaja.FieldByName('ECMTOORI').AsString := dbeOriginal.text ;
         end;
         ///
         cdsEgrCaja.FieldByName('ECMTOLOC').AsString   := dbeChange.Text ;
         cdsEgrCaja.FieldByName('ECMTOEXT').AsString   := dbeOriginal.Text ;
         cdsEgrCaja.FieldByName('ECTCAMB').ASFloat     := strtofloat(dbeTCambio.text);
         cdsEgrCaja.FieldByName('CPTOID').Value        := dblcdCnp.Text;
         cdsEgrCaja.FieldByName('ECGLOSA').Value       := dbeGlosa.Text;
         cdsEgrCaja.FieldByName('ECLOTE').Value        := dbeLote.Text;
         cdsEgrCaja.FieldByName('ECESTADO').Value      := 'I';
         xWhere:='FECHA=' +DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date)+''')' ;
         aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
         cdsEgrCaja.FieldByName('ECANO').Value         := cdsqry.FieldByName('FecAno').Value;
         cdsEgrCaja.FieldByName('ECMM').Value          := cdsqry.FieldByName('FecMes').Value;
         cdsEgrCaja.FieldByName('ECDD').Value          := cdsqry.FieldByName('FecDia').Value;
         cdsEgrCaja.FieldByName('ECSS').Value          := cdsqry.FieldByName('FecSS').Value;
         cdsEgrCaja.FieldByName('ECSEM').Value         := cdsqry.FieldByName('FecSem').Value;
         cdsEgrCaja.FieldByName('ECTRI').Value         := cdsqry.FieldByName('FecTrim').Value;
         cdsEgrCaja.FieldByName('ECAASS').Value        := cdsqry.FieldByName('FecAASS').Value;
         cdsEgrCaja.FieldByName('ECAASem').Value       := cdsqry.FieldByName('FecAASem').Value;
         cdsEgrCaja.FieldByName('ECAATri').Value       := cdsqry.FieldByName('FecAATri').Value;
         cdsEgrCaja.FieldByName('EC_PROCE').Value      := '0';
         cdsEgrCaja.FieldByName('EC_IE').Value         := 'E';
          DMTE.cdsEgrCaja.FieldByName('ECUSER').Value     := DMTE.wUsuario;
          DMTE.cdsEgrCaja.FieldByName('ECFREG').Value     := DateS;
          DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;

         cdspost(DMTE.cdsEgrCaja);
         xSQL:='Select * from CAJA302 '
                +'Where CIAID='''   +dblcCia.Text    +''' and '
                +      'ECANOMM=''' +edtPeriodo.Text +''' and '
                +      'TDIARID=''' +dblcTDiario2.Text+''' and '
                +      'ECNOCOMP='''+dbeNoComp2.Text  +''' ';
         DMTE.cdsEgrCaja.DataRequest( xSQL );
         DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');
       end;

       ShowMessage('Grabacion OK');
       z2bbtnNuevo.Enabled    := True;
       z2bbtnCancelado.Enabled:= True;
       z2bbtnAnula.Enabled    := True;
       z2bbtnImprimeI.Enabled  := True;
       z2bbtnImprimeE.Enabled  := True;
       wmodifica:=False ;
   end ;
end;

procedure TFComVenMon.bbtnNuevoClick2(Sender: TObject);
begin
   if DMTE.cdsEgrCaja.FieldByName('ECEstado').Value ='I' then
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
      end;
   end
   else
   begin
      Adiciona ;
   end;
  //** 05/06/2001 - pjsv, para grabar el nuevo voucher
  xVoucher := '';
  xVoucher1 := '';
  //**
end;

procedure TFComVenMon.ValidacionMovimiento ;
begin
 // consistencia de Datos
   if length(trim(dblcTDoc.Text))=0 then
   begin
        dblcTDoc.SetFocus;
        Raise Exception.Create ('Ingrese Tipo de Documento');
   end;
   if length(trim(dbeNoDoc.Text))=0 then
   begin
        dbeNoDoc.SetFocus;
        Raise Exception.Create ('Ingrese Documento');
   end;
   if length(trim(dbdtpFEmis.Text))=0 then
   begin
        dbdtpFEmis.SetFocus;
        Raise Exception.Create ('Ingrese Fecha de Emisión');
   end;
   if length(trim(dbeLote.Text))=0 then
   begin
        dbeLote.SetFocus;
        Raise Exception.Create ('Ingrese Lote');
   end;
{   if length(trim(dblcdCnp.Text))=0 then
   begin
        dblcdCnp.SetFocus;
        Raise Exception.Create ('Ingrese Concepto');
   end;  }
   if length(trim(dbeGlosa.Text))=0 then
   begin
        dbeGlosa.SetFocus;
        Raise Exception.Create ('Ingrese Glosa');
   end;
   if cbotransaccion.ItemIndex = -1 then
   begin
        cbotransaccion.SetFocus;
        Raise Exception.Create('Ingrese Tipo de la Transaccion');
   end;
   if length(dbeTCambio.Text)=0 then
   begin
      dbeTCambio.SetFocus;
        Raise Exception.Create ('Falta Tipo de Cambio');
   end
   else
   begin
      if strtofloat(dbeTCambio.Text)<=0 then
      begin
        dbeTCambio.SetFocus;
        Raise Exception.Create ('Tipo de Cambio Errado');
      end;
   end;
   if length(trim(dbeOriginal.Text))=0 then
   begin
        ShowMessage('Ingrese Cantidad de Dólares');
        dbeOriginal.SetFocus;
        Raise Exception.Create ('Ingrese Cantidad de Dólares');
   end;
end;



procedure TFComVenMon.FormCreate(Sender: TObject);
begin
   SOLES   := DMTE.wtmonLoc ;
   DOLARES := DMTE.wtmonExt ;
   Bandera := False ;
   DMTE.ASignaTipoDiario(dblcTDiario,self) ;
   dblcTDiario2.LookupTable := dblcTDiario.LookupTable;
   cds := TwwClientDataset.Create (Self ) ;
   cds.RemoteServer := DMTE.DCOM1 ;
   cds.ProviderName := DMTE.cdsEgrCaja.ProviderName ;
   cds.FetchParams ;

   setlength(A2digitos,1) ;
   setlength(A4digitos,1) ;
   A2digitos[0] := dbeOriginal ;
   A4digitos[0] := dbeTCambio ;
   //** 13/06/2001 - pjsv
   DMTE.cdsCCBco.open;
   //**

   //Establecer los filtros pra las ctas Ctes.
   cdsCCBco1 := TwwClientDataset.Create(self) ;
   cdsCCBco1.Name := 'cdsCCBco1' ;
   cdsCCBco1.CloneCursor(DMTE.cdsCCBco,True) ;

   cdsCCBco2 := TwwClientDataset.Create(self) ;
   cdsCCBco2.Name := 'cdsCCBco2' ;
   cdsCCBco2.CloneCursor(DMTE.cdsCCBco,True) ;

   dblcCCBco.LookupTable := cdsCCBco2 ;
   dblcCCBco2.LookupTable := cdsCCBco1 ;

end;

procedure TFComVenMon.dbeOriginalChange(Sender: TObject);
begin
     if ( sender as twincontrol).focused then
         wmodifica:=true;
end;

procedure TFComVenMon.cboTransaccionChange(Sender: TObject);
begin
   if ( sender as twincontrol).focused then
      wmodifica:=true;

end;

procedure TFComVenMon.dbeNoCompExit(Sender: TObject);
var
   xSQL : String;
begin
   if not ValidaComprobante( dbeNoComp ) then Exit;
   xSQL:='Select COUNT(*) TOTREG from CAJA302 '
        +'Where CIAID='''   +dblcCia.Text    +''' and '
        +      'ECANOMM=''' +edtPeriodo.Text +''' and '
        +      'TDIARID=''' +dblcTDiario.Text+''' and '
        +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   if DMTE.cdsQry.fieldbyName('TOTREG').asInteger>0 then
    begin
      dbeNoComp.SetFocus;
      ShowMessage('Número de Registro Existe');
    end
   else
    begin
     dbeNoComp.text :=DMTE.StrZero(dbeNoComp.text,DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').DisplayWidth);
     HabilitaBotonCabecera(pnlCabecera1,z2bbtnOkcab);
    end;
end;

procedure TFComVenMon.dbeNoComp2Exit(Sender: TObject);
var
   xSQL : String;
begin
   if not ValidaComprobante(dbeNoComp2) then Exit;

   xSQL:='Select COUNT(*) TOTREG from CAJA302 '
        +'Where CIAID='''   +dblcCia.Text    +''' and '
        +      'ECANOMM=''' +edtPeriodo.Text +''' and '
        +      'TDIARID=''' +dblcTDiario2.Text+''' and '
        +      'ECNOCOMP='''+dbeNoComp2.Text  +''' ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   if DMTE.cdsQry.fieldbyName('TOTREG').asInteger>0 then
    begin
      dbeNoComp2.SetFocus;
      ShowMessage('Número de Registro Existe');
    end
   else
    dbeNoComp2.text :=DMTE.StrZero(dbeNoComp2.text,DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').DisplayWidth);
end;

procedure TFComVenMon.BuscaComprobanteDestino;
var
   xWhere : String ;
begin
     if (edtCia.text <> '') and (edtPeriodo.text <> '')
                  and (edtTDiario2.Text <> '') then
     begin
          //Buscar el siguiente numero de comprobante
          xWhere:='CIAID='+''''+dblcCia.Text+''''+' AND ECANOMM='+
                 ''''+edtPeriodo.Text+''''+' AND TDIARID='+''''+
                 dblcTDiario2.Text+'''';
          dbeNoComp2.text:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
          dbeNoComp2.text:=DMTE.StrZero(dbeNoComp2.text,DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').DisplayWidth);

     end;

end;

procedure TFComVenMon.BuscaComprobanteOrigen;
var
   xWhere : String ;
begin
     if (edtCia.text <> '') and (edtPeriodo.text <> '')
                  and (edtTDiario.Text <> '') then
     begin
          //Buscar el siguiente numero de comprobante
          xWhere:='CIAID='+''''+dblcCia.Text+''''+' AND ECANOMM='+
                 ''''+edtPeriodo.Text+''''+' AND TDIARID='+''''+
                 dblcTDiario.Text+'''';
          dbeNoComp.text:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
          dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').DisplayWidth);
     end;
end;

procedure TFComVenMon.ConfiguraAccesos;
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

procedure TFComVenMon.Libera_Admin;
begin
    Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFComVenMon.Libera_Consul;
begin

end;

procedure TFComVenMon.Proc_Admin;
begin
end;

procedure TFComVenMon.Proc_Consul;
begin

end;

procedure TFComVenMon.LibConfigAccesos;
begin
    if DMTE.wAdmin = 'G' then
       Libera_Admin
    else
    begin
       if DMTE.wModo = 'C' then
          Libera_Consul ;
    end ;

end;

procedure TFComVenMon.Adiciona;
begin
   IniciaDatos ;

   dblcCCBco.Selected.Clear;
   dblcCCBco.Selected.Add('CCBCOID'#9'25'#9'Cuenta Corriente del Banco'#9'F');
   dblcCCBco.Selected.Add('CCBCODES'#9'30'#9'Descripción'#9'F');
   dblcCCBco.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');

   dblcCCBco2.Selected.Clear;
   dblcCCBco2.Selected.Add('CCBCOID'#9'25'#9'Cuenta Corriente del Banco'#9'F');
   dblcCCBco2.Selected.Add('CCBCODES'#9'30'#9'Descripción'#9'F');
   dblcCCBco2.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');


   CambiaEstado('N') ;
   ActPnlBotones ;
end;

procedure TFComVenMon.Edita;
var
   xSQL    : String;
   xDescrip: String;
begin
   z2bbtnNuevo.Visible    :=False ;
   z2bbtnCancel2.Visible:=False ;
//   xModoEd:='E';
   IniciaDatos ;

   HabilitaEdicion ;

   //procedimientos de Recuperacion y LLenado de Datos
   RecuperaCabecera(Trans_Comp) ;
   LlenarDatosCab ;
   RecDescripCabecera ;
   LLenaDescripCab ;

   xDescrip := 'BANCOID='+quotedstr(dblcBanco.text);
    edtBanco.text := DMTE.DisplayDescrip('prvTGE','TGE105','BANCOABR, BCOTIPCTA',xDescrip,'BANCOABR');

   dblcTDoc.Text:= DMTE.cdsEgrCaja.FieldByName('DOCID').AsString;
   XSQL := 'DOCID='+quotedstr(dblcTDoc.Text);
   edtTDoc.text := DMTE.displaydescrip('prvTGE','TGE110','DOCDES',xsql,'DOCDES');
   dbeLote.Text:= DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
  dbeNoDoc.Text:= DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString;
  dblcdCnp.Text:= DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString;
  dbeGlosa.Text:=DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString;
  if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString=DOLARES  then
     cboTransaccion.ItemIndex:=0
  else cboTransaccion.ItemIndex:=1;
  dbeTCambio.Text:= DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsString;
  dbeOriginal.Text:= DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsString;
  dbeChange.Text:= DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString;
  if DMTE.cdsEgrCaja.FieldByName('ECEstado').Value='I' then //Si está INCOMPLETO o PENDIENTE
    begin
     CambiaEstado ('I');
     ActPnlBotones;
    end;
  if DMTE.cdsEgrCaja.FieldByName('ECEstado').Value='C' then      //Si está CANCELADO
   begin
    CambiaEstado('C');
    ActPnlBotones;
   end;
  if DMTE.cdsEgrCaja.FieldByName('ECEstado').Value='A' then      // Si esta ANULADO
   begin
    CambiaEstado('A');
    ActPnlBotones;
   end;
   Z2bbtnNUevo.Visible := False ;
   wModifica := False ;

end;

procedure TFComVenMon.RecuperaDescrip ;
begin
  DescripCVME(dblcCia.text,edtPeriodo.text,dblcTDiario.Text,dbeNoComp.text) ;
  DMTE.cdsDescrip.Active := False ;
  DMTE.cdsDescrip.Active := True ;
  edtTDoc.text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('DOCABR')) ;
  edtCia.Text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('CIAABR')) ;
  edtTDiario.Text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('TDIARABR')) ;
  edtTDiario2.Text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('TDIARABR2')) ;
end;


procedure TFComVenMon.ValidacionComprobante;
var
   xWhere : String ;
begin
      xWhere :=  'CIAID ='+''''+        dblcCia.Text +  ''''
                +' AND TDIARID ='+''''+ dblcTDiario.Text+''''
                +' AND ECANOMM ='+''''+ edtPeriodo.Text+''''
                +' AND ECNOCOMP ='+''''+dbeNoComp.Text +'''';
      if DMTE.DisplayDescrip('prvTGE','CAJA302','COUNT(*) TOTREG',xWhere,'TOTREG')>'0' then
      begin
          dbeNoComp.Text:='';
          dbeNoComp.SetFocus;
          Raise Exception.create('Comprobante ya esta registrado');
      end ;

      xWhere :=  'CIAID ='+''''+        dblcCia.Text +  ''''
                +' AND TDIARID ='+''''+ dblcTDiario2.Text+''''
                +' AND ECANOMM ='+''''+ edtPeriodo.Text+''''
                +' AND ECNOCOMP ='+''''+dbeNoComp2.Text +'''';
      if DMTE.DisplayDescrip('prvTGE','CAJA302','COUNT(*) TOTREG',xWhere,'TOTREG')>'0' then
      begin
          dbeNoComp.Text:='';
          dbeNoComp.SetFocus;
          Raise Exception.create('Comprobante ya esta registrado');
      end ;

      if ( dblcTDiario.text = dblcTDiario2.text ) and ( dbeNOComp.text = dbeNoComp2.Text ) then
      begin
         dbeNoComp2.Text := DMTE.strZero(inttostr(strtoint(dbeNOComp.text) + 1),10) ;
      end ;
end;

procedure TFComVenMon.dbeTCambioEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFComVenMon.dbeOriginalEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFComVenMon.dbeTCambioExit(Sender: TObject);
begin
    if strTmp <> TCustomEdit(Sender).text then
    begin
      If TCustomEdit(Sender).text <> '' then
       begin
        TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text,4) ;
         try
          IF (dbeoriginal.Text <> '') and (dbetCambio.text <> '') then
           dbeChange.text := cajadec(currtostr(strToCurr(dbeoriginal.Text) * strtoCurr(dbetCambio.text)))
          else
           dbeChange.text := '0.00';
         except
           dbeChange.text := '0.00';
         end;
       end;
    end ;
end;

procedure TFComVenMon.dbeOriginalExit(Sender: TObject);
begin
     if strTmp <> TCustomEdit(Sender).text then
     begin
        TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text) ;
        try
          IF (dbeoriginal.Text <> '') and (dbetCambio.text <> '') then
           dbeChange.text := cajadec(currtostr(strToCurr(dbeoriginal.Text)*strtoCurr(dbetCambio.text)))
          else
           dbeChange.text := '0.00';
        except
           dbeChange.text := '0.00';
        end;
     end ;
end;

procedure TFComVenMon.dblcBanco2Exit(Sender: TObject);
begin
  if DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').Value='C' then
   if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco2.Text, '', dbdtpFComp.Date ) then
   begin
      Showmessage('Error : Mes de Fecha Fue Cerrado. Verificar...');
      Exit;
   end;

   if DiaAperturado(dblcCia.text,dbdtpFComp.Date,dblcBanco2.text) then
   begin

      edtBanco2.text:=DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr,'BANCOID',dblcBanco2.Text,'BANCOABR') ;

      if edtBanco2.Text='' then
      begin
         showmessage('Falta Banco');
         dblcBanco2.SetFocus;
         Exit;
      end;

      dblcCCBco2.Text := '' ;
      edtCuenta2.Text := '' ;
      if DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').Value='C' then
      begin //Si es CAJA
         dblcTDiario2.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco2.text),'CCBCOVOUCH');
         dblcTDiario2.OnExit(dblcTDiario);
         dblcCCBco2.Enabled:=False;
         edtCuenta2.Text := DMTE.DisplayDescrip('prvTGE','TGE105','CUENTAID','BANCOID='+quotedstr(dblcBanco2.text),'CUENTAID');
      end
      else begin  //Si es BANCO
         dblcCCBco2.Enabled:=True;
         cdsCCBco1.Filtered:=False;
         cdsCCBco1.Filter:='';   //Filtrar la lista de CtaCte por Banco
         cdsCCBco1.Filter:='BANCOID='+''''+dblcBanco2.Text+''''+' AND CIAID='+quotedstr(dblcCia.text);
         cdsCCBco1.Filtered:=True;
         dblcCCBco2.setfocus;
      end;
   end
   else
   begin
     dblcBanco2.setfocus;
     exit;
   end;
end;

procedure TFComVenMon.dblcCCBco2Exit(Sender: TObject);
begin
   if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco2.Text, dblcCCBco2.text, dbdtpFComp.Date ) then
   begin
      Showmessage('Error : Mes de Fecha Fue Cerrado. Verificar...');
      Exit;
   end;

   if Trim(dblcCCBco2.Text) <> '' then
    begin
      xDescrip := 'BANCOID='+quotedstr(dblcBanco2.text)+' AND CCBCOID='+quotedstr(dblcCCBco2.text);
      If (DMTE.DisplayDescrip('prvTGE','TGE106','CCBCODES',xDescrip,'CCBCODES') = '') then
       begin
        showmessage('Cuenta no existe');
        dblcCCBco2.SetFocus;
        edtCuenta2.Text:= '' ;
       end
      else
       begin
         //** 08/06/2001 - pjsv
         dblcTDiario2.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco2.text)+' AND CCBCOID='+quotedstr(dblcCCBco2.text),'CCBCOVOUCH');
         dblcTDiario2.OnExit(dblcTDiario);
         edtCuenta2.Text:=DMTE.cdsCCBco.fieldbyname('CTAPRINC').AsString ;
         xVoucher1 := dblcTDiario2.Text;
         //**
       end;
    end
   else
    begin
      edtCuenta2.Text:= '' ;
    end;
   wmodifica:=True;
end;

procedure TFComVenMon.dblcBancoExit(Sender: TObject);
begin
   if DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').Value='C' then
      if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, '', dbdtpFComp.Date ) then
      begin
         Showmessage('Error : Mes de Fecha Fue Cerrado. Verificar...');
         Exit;
      end;

   if DiaAperturado(dblcCia.text,dbdtpFComp.Date,dblcBanco.text) then
   begin

      edtBanco.text:=DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr,'BANCOID',dblcBanco.Text,'BANCOABR') ;

      if edtBanco.Text='' then
      begin
         showmessage('Falta Banco');
         dblcBanco.SetFocus;
         Exit;
      end;

      dblcCCBco.Text := '' ;
      if DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').Value='C' then
      begin //Si es CAJA
          dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBVOUING','BANCOID='+quotedstr(dblcBanco.text),'CCBVOUING');
          dblcTDiario.OnExit(dblcTDiario);
          dblcCCBco.Enabled:=False;
          edtCuenta.Text := DMTE.DisplayDescrip('prvTGE','TGE105','CUENTAID','BANCOID='+quotedstr(dblcBanco.text),'CUENTAID');
          dblcdCnp.text  := DMTE.DisplayDescrip('prvTGE','TGE105','CPTOID','BANCOID='+quotedstr(dblcBanco.text),'CPTOID');
          dbeGlosa.Text  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTODES','CPTOID='+quotedstr(dblcdCnp.text),'CPTODES');
          DMTE.cdsFormPago.Filter := 'FCEGR=''1'' or FCEGR=''S'' ' ;
          DMTE.cdsFormPago.Filtered := True ;
      end
      else begin  //Si es BANCO
          dblcCCBco.Enabled:=True;
          cdsCCBco2.Filtered:=False;
          cdsCCBco2.Filter:='';   //Filtrar la lista de CtaCte por Banco
          cdsCCBco2.Filter:='BANCOID='+''''+dblcBanco.Text+''''+' AND CIAID='+quotedstr(dblcCia.text);
          cdsCCBco2.Filtered:=True;
          dblcCCBco.SetFocus;
      end;
   end
   else
   begin
     dblcBanco.setfocus;
     exit;
   end;
end;

procedure TFComVenMon.dblcCCBcoExit(Sender: TObject);
begin
   if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, dblcCCBco.text, dbdtpFComp.Date ) then
   begin
      Showmessage('Error : Mes de Fecha Fue Cerrado. Verificar...');
      Exit;
   end;

   if Trim(dblcCCBco.Text) <> '' then
    begin
      xDescrip := 'BANCOID='+quotedstr(dblcBanco.text)+' AND CCBCOID='+quotedstr(dblcCCBco.text);
      If (DMTE.DisplayDescrip('prvTGE','TGE106','CCBCODES',xDescrip,'CCBCODES') = '') then
       begin
        showmessage('Cuenta no existe');
        dblcCCBco.SetFocus;
        edtCuenta.Text:= '' ;
       end
      else
       begin
         //** 08/06/2001 - pjsv
         dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBVOUING','BANCOID='+quotedstr(dblcBanco.text)+' AND CCBCOID='+quotedstr(dblcCCBco.text),'CCBVOUING');
         dblcTDiario.OnExit(dblcTDiario);
         edtCuenta.Text:=DMTE.cdsCCBco.fieldbyname('CTAPRINC').AsString ;
         xVoucher := dblcTDiario.Text;
         //**
       end;
    end
   else
    begin
      edtCuenta.Text:= '' ;
    end;
   wmodifica:=True;
end;

procedure TFComVenMon.HabilitaComp2;
var
   A : Array of TCustomEdit;
   i : Integer;
begin
   SetLength(A,3);
   A[0]:= dblcCia;
   A[1]:= dbdtpFComp;
   A[2]:= dblcTDiario2;
   for i:=0 to high(A) do begin
      if A[i].text='' then
         Exit;
   end;
   dbeNoComp2.Enabled:=True;
end;

procedure TFComVenMon.Comprobante2;
var
   xWhere : string ;
begin
   if dbeNoComp2.Enabled = False then  exit ;
   xWhere:='CIAID='''+dblcCia.text+''' AND TDIARID='''+dblcTDiario2.Text+''''
          +' and ECANOMM='''+edtPeriodo.Text+'''';
   if DMTE.RecuperarDatos('CAJA302','MAX(ECNOCOMP) MAXIMO',xWhere) then
   begin
      if not DMTE.cdsRec.fieldbyname('MAXIMO').isnull then
         dbeNoComp2.Text := DMTE.strZero(inttostr((DMTE.cdsRec.fieldbyname('MAXIMO').AsInteger +1)),10)
      else
         dbeNoComp2.Text := '0000000001' ;
      if (dbeNoComp.text <> '') and (dblcTDiario.Text = dblcTDiario2.Text ) then
        if dbeNoComp2.Text = dbeNoComp.Text then
           dbeNoComp2.text := DMTE.strZero(inttostr(strtoint(dbeNoComp2.text)+1),10) ;
   end ;
end;

procedure TFComVenMon.HabilitaComp;
var
   A : Array of TCustomEdit ;
   i : Integer ;
begin

  SetLength(A,3) ;
  A[0] := dblcCia ;
  A[1] := dbdtpFComp ;
  A[2] := dblcTDiario;
  for i := 0 to high(A) do
   begin
     if A[i].text = '' then Exit ;
   end;
  dbeNoComp.Enabled := True ;
end ;

procedure TFComVenMon.Comprobante;
var
   xWhere : string ;
begin
  if dbeNoComp.Enabled = False then exit ;

  xWhere := 'CIAID='''+dblcCia.text+''' AND TDIARID = ''' + dblcTDiario.Text +
            ''' AND ECANOMM = ''' + edtPeriodo.Text + '''' ;
  if DMTE.RecuperarDatos('CAJA302','MAX(ECNOCOMP) MAXIMO',xWhere) then
  begin
     if not DMTE.cdsRec.fieldbyname('MAXIMO').isnull then
        dbeNoComp.Text := DMTE.strZero(inttostr((DMTE.cdsRec.fieldbyname('MAXIMO').AsInteger +1)),10)
     else
        dbeNoComp.Text := '0000000001' ;
     if (dbeNoComp2.text <> '') and (dblcTDiario.Text = dblcTDiario2.Text ) then
       if dbeNoComp2.Text = dbeNoComp.Text then
           dbeNoComp.text := DMTE.strZero(inttostr(strtoint(dbeNoComp.text)+1),10) ;
  end ;
end;

function TFComVenMon.ValidaComprobante(ctrl: TCustomEdit):Boolean;
begin
   if trim(ctrl.Text)<>'' then
      if strtoint(ctrl.Text) <> 0 then
      begin
         Result:=True;
         ctrl.Text := DMTE.StrZero(ctrl.Text,10)
      end
      else begin
         ctrl.Text := '' ;
         ShowMessage('Ingrese Comprobante') ;
         Result:=False;
         ctrl.SetFocus ;
      end
   else begin
      ShowMessage('Ingrese Comprobante') ;
      Result:=False;
      ctrl.SetFocus ;
   end;
end;

procedure TFComVenMon.Contabiliza;
var
   Trans_Comp : structComprobante ;
   xRemesa : String;
   xSQL    : String;
begin
   if trim(dblcCCBco2.Text) <>'' then
   begin
      DMTE.RecuperarDatos('TGE106','CTAREMES','BANCOID='''+dblcBanco2.Text+''' AND CCBCOID='''+dblcCCBco2.Text+'''') ;
      xRemesa := DMTE.cdsRec.fieldbyname('CTAREMES').AsString ;
   end
   else begin
      DMTE.RecuperarDatos('TGE105','REMESAID','BANCOID=''' +dblcBanco2.Text + '''') ;
      xRemesa := DMTE.cdsRec.fieldbyname('REMESAID').AsString ;
   end ;

   xsql:='DELETE FROM CAJA304 '
        +'WHERE CIAID='   +quotedstr( dblcCia.Text      ) +' AND '
        +      'TDIARID=' +quotedstr( dblcTDiario.Text ) +' AND '
        +      'ECANOMM=' +quotedstr( edtPeriodo.Text   ) +' AND '
        +      'ECNOCOMP='+quotedstr( dbeNoComp.Text   );
   try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;

   xsql:='DELETE FROM CAJA304 '
        +'WHERE CIAID='   +quotedstr( dblcCia.Text      ) +' AND '
        +      'TDIARID=' +quotedstr( dblcTDiario2.Text ) +' AND '
        +      'ECANOMM=' +quotedstr( edtPeriodo.Text   ) +' AND '
        +      'ECNOCOMP='+quotedstr( dbeNoComp2.Text   );
   try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;


   // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera

   // vhn 23/01/2001
   xSQL:='Select * from CAJA304 Where CIAID='''' and '
        +  'ECANOMM='''' and TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsCNTCaja.Close;
   DMTE.cdsCNTCaja.DataRequest( xSQL );
   DMTE.cdsCNTCaja.Open;
   //

  if DMTE.cdsEgrCaja.Locate('CIAID;ECANOMM;TDIARID;ECNOCOMP',
                              VarArrayOf([dblcCia.text,edtPeriodo.Text,dblcTDiario.text,dbeNoComp.Text ]), [loPartialKey]) then
     DMTE.cdsEgrCaja.Edit
  else begin
     ShowMessage('Error al Grabar');
     Exit;
  end;

   DMTE.cdsCntCaja.Insert;
   Contab_EgrCaja( xRemesa, 'D' );
   DMTE.cdsCntCaja.FieldByName('NREG').Value:= 1;
   DMTE.cdsCntCaja.Post;

   DMTE.cdsCntCaja.Insert;
   Contab_EgrCaja( edtCuenta.Text, 'H' );
   DMTE.cdsCntCaja.FieldByName('NREG').Value:= 2;
   DMTE.cdsCntCaja.Post;
   //Actualizamos en la tabla de Contabilidad CAJA304

    if DMTE.cdsEgrCaja.Locate('CIAID;ECANOMM;TDIARID;ECNOCOMP',
                  VarArrayOf([dblcCia.text,edtPeriodo.Text,dblcTDiario2.text,dbeNoComp2.Text ]), [loPartialKey]) then
       DMTE.cdsEgrCaja.Edit
    else begin
       ShowMessage('Error al Grabar');
       Exit;
    end;

   DMTE.cdsCntCaja.Insert;
   Contab_EgrCaja( edtCuenta2.Text, 'D' );
   DMTE.cdsCntCaja.FieldByName('NREG').Value:= 1;
   DMTE.cdsCntCaja.Post;

   DMTE.cdsCntCaja.Insert;
   Contab_EgrCaja( xRemesa, 'H' );
   DMTE.cdsCntCaja.FieldByName('NREG').Value:= 2;
   DMTE.cdsCntCaja.Post;

   //Actualizamos en la tabla de Contabilidad CAJA304
   DMTE.cdsCntCaja.ApplyUpdates(0);
end ;


procedure TFComVenMon.Contab_EgrCaja;
begin
   DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsEgrcaja.fieldBYName('CIAID').Value;
   DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsEgrCaja.fieldBYName('TDIARID').Value;
   DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsEgrCaja.fieldBYName('DOCID').Value;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  :=  'CAJA';
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsEgrCaja.fieldBYName('ECFCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  DMTE.cdsEgrCaja.fieldBYName('CPTOID').Value ;
   DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  XCuenta ; //DMTE.c.fieldBYName('dsEgrCajaCUENTAID.Value ;
   DMTE.cdsCntCaja.FieldByName('DCDH').Value    :=  xDH ; //'H';
   DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsEgrCaja.fieldBYName('TMONID').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value:=  DMTE.cdsEgrCaja.fieldBYName('ECMTOORI').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value :=  DMTE.cdsEgrCaja.fieldBYName('ECMTOLOC').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:=  DMTE.cdsEgrCaja.fieldBYName('ECMTOEXT').Value;
   DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado

   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsEgrCaja.fieldBYName('ECNOCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.fieldBYName('ECLOTE').Value;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.fieldBYName('ECANOMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.fieldBYName('ECANO').Value;
   DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.fieldBYName('ECMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.fieldBYName('ECDD').Value;
   DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.fieldBYName('ECSS').Value;
   DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.fieldBYName('ECSEM').Value;
   DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.fieldBYName('ECTRI').Value;
   DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.fieldBYName('ECAASS').Value;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.fieldBYName('ECAASEM').Value;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.fieldBYName('ECAATRI').Value;
   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString ;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsString:= dbeTCambio.Text ;
   DMTE.cdsCntCaja.FieldByName('FCAB').AsString    := '1' ;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsEgrCaja.fieldBYName('ECTCAMB').Value;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsEgrCaja.fieldBYName('ECTCAMB').Value;
end;

procedure TFComVenMon.RecuperaComp;
var
   xSQL : String ;
begin
   xSQL:='Select * from CAJA302 '
        +'Where CIAID='''   +Trans_Comp.CIAID    +''' and '
        +      'TDIARID=''' +Trans_Comp.TDIARID  +''' and '
        +      'ECANOMM=''' +Trans_Comp.ECANOMM  +''' and '
        +      'ECNOCOMP='''+Trans_Comp.ECNOCOMP +''' ';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest( xSQL );
   DMTE.cdsEgrCaja.Open;
   xEstado := DMTE.cdsEgrCaja.FieldBYName('ECEstado').AsString ;
end;

procedure TFComVenMon.HabilitaEdicion;
var
   A : Array of Tpanel ;
   i , j : Integer;
begin
   SetLength(A,2) ;
   A[0] := pnlCabecera1 ;
   A[1] := pnlCabecera2 ;
   for i := 0 to High(A) do
   begin
      for j := 0  to A[i].ControlCount-1 do
      begin
          if A[i].Controls[j].Tag = 1 then
             (A[i].Controls[j] as TCustomEdit).Enabled := False ;
      end;
   end;
end;

procedure TFComVenMon.RecuperaCabecera;
var
   xWhere : String ;
begin
   xWhere:='CIAID='''   +DMTE.cdsEgrCaja.FieldByName('CIAID').AsString   +''' AND '
          +'TDIARID=''' +DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString +''' AND '
          +'ECNOCOMP='''+DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' AND '
          +'ECANOMM=''' +DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString +''' ';

   if DMTE.RecuperarDatos('CAJA302','*',xWhere) then
   begin
      if DMTE.cdsRec.FieldByName('EC_IE').AsString = 'E' then
      begin
            dblcBanco2.Text := DMTE.cdsrec.FieldByname('BANCOID').AsString ;
            dblcCCBco2.Text := DMTE.cdsrec.FieldByname('CCBCOID').AsString ;
            edtCuenta2.Text := DMTE.cdsrec.FieldByname('CUENTAID').AsString ;
      end
      else
      begin
         xWhere:='CIAID='''   +Trans_Comp.CIAID                            +''' AND  ' +
                 'TDIARID=''' +DMTE.cdsrec.FieldByname('TDIARIO2').AsString +''' AND '+
                 'ECNOCOMP='''+DMTE.cdsrec.FieldByname('ECNOCOMP2').AsString+''' AND '+
                 'ECANOMM=''' +Trans_Comp.ECANOMM + ''' ' ;
         if DMTE.RecuperarDatos('CAJA302','*',xWhere) then
         begin
           dblcBanco2.Text    := DMTE.cdsrec.FieldByname('BANCOID').AsString ;
           dblcCCBco2.Text    := DMTE.cdsrec.FieldByname('CCBCOID').AsString ;
           edtCuenta2.Text    := DMTE.cdsrec.FieldByname('CUENTAID').AsString ;
           Trans_Comp.TDIARID := DMTE.cdsrec.FieldByname('TDIARIO2').AsString ;
           Trans_Comp.ECNOCOMP:= DMTE.cdsrec.FieldByname('ECNOCOMP2').AsString ;
         end;
      end ;
   end ;
   xEstado := DMTE.cdsEgrCaja.FieldBYName('ECEstado').AsString ;
end;

procedure TFComVenMon.LLenarDatosCab;
{
  Este Procedimiento llena los datos de la cabecera
  incluyendo los datos de tipo de diario y numero de comprobante
  del segundo comprobante
}
begin
   with DMTE.cdsEgrCaja do
   begin
      dblcCia.Text     := FieldByName('CIAID').AsString ;
      dbdtpFComp.Date  := FieldBYName('ECFCOMP').AsDateTime ;
      edtperiodo.text  := FieldByName('ECANOMM').AsString ;
      dbeNoDoc.Text    := FieldBYName('ECNODOC').AsString ;

      dblcTDiario.Text := FieldByName('TDIARID').AsString ;
      dbeNoComp.Text   := FieldByName('ECNOCOMP').AsString ;
      dblcBanco.Text   := FieldByName('BANCOID').AsString ;
      dblcCCBco.Text   := FieldBYName('CCBCOID').AsString ;
      edtCuenta.Text   := FieldBYName('CUENTAID').AsString ;

      dblcTDiario2.Text:= FieldByName('TDIARIO2').AsString ;
      dbeNoComp2.Text  := FieldByName('ECNOCOMP2').AsString ;

      dbeTCambio.Text  := FieldBYName('ECTCAMB').AsString ;
      dbeLOte.Text     := FieldBYName('ECLOTE').AsString ;
      dblcdCnp.Text    := FieldBYName('CPTOID').AsString ;
      dbeGlosa.Text    := FieldBYName('ECGLOSA').AsString ;
   end;
   if trim(dblcCCBco.Text) <> '' then
   begin
      dblcCCBco.Enabled := True ;
   end
   else begin
      dblcCCBco.Enabled := False ;
   end;
   if trim(dblcCCBco2.Text) <> '' then
   begin
      dblcCCBco2.Enabled := True ;
   end
   else begin
      dblcCCBco2.Enabled := False ;
   end;
end;

procedure TFComVenMon.RecDescripCabecera;
{ Este Procedimiento Recupera las descripciones adicionales de ambos comprobantes }
begin
   DMTE.DescripTrans(dblcCia.Text,edtPeriodo.Text,dblcTDiario.Text,
                                    dbeNoComp.Text,dblcTDiario2.Text,dbeNoComp2.Text) ;
   DMTE.cdsDescrip.active := False ;
   DMTE.cdsDescrip.active := True ;
end;

procedure TFComVenMon.LLenaDescripCab;
{ Este procedimiento llena las descripciones adicionales }
begin
   with DMTE.cdsDescrip do
   begin
      First ;
      while not eof do begin
         if FieldByName('EC_IE').AsString = 'E' then
         begin
            edtCia.Text    := FieldByName('CIADES').AsString ;
            edtTDiario.Text:= FieldByName('TDIARABR').AsString ;
            edtBanco.Text  := FieldByName('BANCOABR').AsString ;
         end
         else begin
            edtTDiario2.Text:= FieldByName('TDIARABR').AsString ;
            edtBanco2.Text  := FieldByName('BANCOABR').AsString ;
         end;
         Next;
      end;
   end;
end;

procedure TFComVenMon.DescripCVME(const xCIAID, xECANOMM, xTDIARID, xECNOCOMP: String);
var xSQL : String ;
begin
  if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
     xSQL := 'SELECT TGE110.DOCABR, TGE101.CIAABR, TGE104.TDIARABR, DIARIO.TDIARABR TDIARABR2 ' +
             'FROM CAJA302'                                                                     +
               ' LEFT JOIN TGE110 ON (CAJA302.DOCID = TGE110.DOCID)'                            +
               ' LEFT JOIN TGE101 ON (CAJA302.CIAID = TGE101.CIAID)'                            +
               ' LEFT JOIN TGE104 ON (CAJA302.TDIARID = TGE104.TDIARID)'                        +
               ' LEFT JOIN TGE104 DIARIO ON (CAJA302.TDIARIO2 = DIARIO.TDIARID)'                +
             'WHERE  CAJA302.CIAID= ''' + xCIAID    +''' AND '                                  +
               ' CAJA302.TDIARID='''    + xTDIARID  +''' AND '                                  +
               ' CAJA302.ECANOMM='''    + xECANOMM  +''' AND '                                  +
               ' CAJA302.ECNOCOMP='''   + xECNOCOMP +''' '                                      
	else
	  if DMTE.SRV_D = 'ORACLE' then
       xSQL := 'SELECT TGE110.DOCABR, TGE101.CIAABR, TGE104.TDIARABR, DIARIO.TDIARABR TDIARABR2 ' +
               'FROM CAJA302, TGE110, TGE101, TGE104, TGE104 DIARIO '                             +
               'WHERE  CAJA302.CIAID= ''' + xCIAID    +''' AND '                                  +
                 ' CAJA302.TDIARID='''    + xTDIARID  +''' AND '                                  +
                 ' CAJA302.ECANOMM='''    + xECANOMM  +''' AND '                                  +
                 ' CAJA302.ECNOCOMP='''   + xECNOCOMP +''' '                                      +
                 ' AND (CAJA302.DOCID = TGE110.DOCID (+))'                                        +
                 ' AND (CAJA302.CIAID = TGE101.CIAID (+))'                                        +
                 ' AND (CAJA302.TDIARID = TGE104.TDIARID (+))'                                    +
                 ' AND (CAJA302.TDIARIO2 = DIARIO.TDIARID (+))'                                   ;
   DMTE.cdsDescrip.close ;
   DMTE.cdsDescrip.DataRequest(xSQL) ;
end;

procedure TFComVenMon.Z2bbtnImprimeIClick(Sender: TObject);
begin

   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' THEN
	 begin

		  Contabiliza;

      ActualizaCNT311( dblcCia.Text,
                       dblcTDiario.Text,
                       dbeNoComp.Text,
                       edtPeriodo.Text );

      if SOLConta( dblcCia.Text,
                   dblcTDiario.Text,
                   edtPeriodo.Text,
                   dbeNoComp.Text,
                   DMTE.SRV_D, 'P', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                   DMTE.cdsResultSet, DMTE.DCOM1, Self ) then

      ImprimeVoucher( 'CNT311', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
 	 end;

   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' THEN
	 begin
      ImprimeVoucher( 'CNT301', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
   end;

end;

procedure TFComVenMon.Z2bbtnImprimeEClick(Sender: TObject);
begin
   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' THEN
	 begin

		  Contabiliza;

      ActualizaCNT311( dblcCia.Text,
                       dblcTDiario2.Text,
                       dbeNoComp2.Text,
                       edtPeriodo.Text );

      if SOLConta( dblcCia.Text,
                   dblcTDiario2.Text,
                   edtPeriodo.Text,
                   dbeNoComp2.Text,
                   DMTE.SRV_D, 'P', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                   DMTE.cdsResultSet, DMTE.DCOM1, Self ) then

      ImprimeVoucher( 'CNT311', dblcCia.Text, edtPeriodo.Text, dblcTDiario2.Text, dbeNoComp2.Text, dbeGlosa.Text );
 	 end;

   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' then
	 begin
      ImprimeVoucher( 'CNT301', dblcCia.Text, edtPeriodo.Text, dblcTDiario2.Text, dbeNoComp2.Text, dbeGlosa.Text );
   end;

end;

procedure TFComVenMon.FormShow(Sender: TObject);
var
   TransComp : structComprobante ;
begin
   if DMTE.wModo='A' then
   begin
      Adiciona ;
   end
   else
   begin
     Edita( TransComp, DMTE.cdsEgrCaja );
   end;

   IniciaDatos ;
   xVoucher  := '';
   xVoucher1 := '';
end;

end.


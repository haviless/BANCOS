unit Caja224;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, wwdblook,
  StdCtrls, Buttons, ExtCtrls, Wwdbdlg, CajaDM, Db, DBClient, wwclient ,
  CajaUtil;

type
  TACUMULADOS = Record
    SOLES          ,
    DOLARES        ,
    DEVSOLES       ,
    DEVDOLARES     ,
    CHQTJASOLES    ,
    CHQTJADOLARES  ,
    COBRADOSOLES   ,
    COBRADODOLARES : Currency ;
  end ;
  TDatosCancelacion = Record
    TMONID     ,
    TMONDES    ,
    FECHATC    ,
    ECTCAMB    ,
    ECMTOORI   ,
    ECLOTE     ,
    CPTOID     ,
    ECGLOSA    ,
    CIAID      ,
    CIADES     ,
    ECANOMM    ,
    ECNOCOMP   ,
    TDIARID    ,
    PROV       ,
    PROVRUC    ,
    CLAUXID    ,
    ECOPAGO    ,
    BANCOID    ,
    CCTREC     ,
    DOCID      ,
    CCSERIE    ,
    CCNODOC    ,
    TDIARDES   : String ;
  end ;

  TFDetCancela = class(TForm)
    PnlFPago: TPanel;
    Z2OkDetalle: TBitBtn;
    Z2bbtnCancelDet: TBitBtn;
    pnlDetalle: TPanel;
    gbxTotales: TGroupBox;
    Label8: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    dbeImpEXT: TwwDBEdit;
    dbeImpLOC: TwwDBEdit;
    dbeDifEXT: TwwDBEdit;
    dbeCancEXT: TwwDBEdit;
    dbeCancLOC: TwwDBEdit;
    dbeDifLOC: TwwDBEdit;
    gbxFPago: TGroupBox;
    dbgDetFPago: TwwDBGrid;
    wwDBGrid1IButton: TwwIButton;
    gbxPago: TGroupBox;
    Label4: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    dbdtpFCanc: TwwDBDateTimePicker;
    dbeTCamb: TwwDBEdit;
    Z2bbtnCalc: TBitBtn;
    pnlBotones: TPanel;
    Z2bbtnCancel: TBitBtn;
    Z2bbtnOK: TBitBtn;
    Z2bbtnImprimir: TBitBtn;
    StaticText1: TStaticText;
    lblFormPago: TLabel;
    lblNoChq: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    dblcFormPago: TwwDBLookupCombo;
    dbeNoChq: TwwDBEdit;
    dbeRecibido: TwwDBEdit;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TEdit;
    edtFormPago: TEdit;
    dblcTMonC: TwwDBLookupCombo;
    edtTMonC: TEdit;
    Edit6: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    gbxACobrar: TGroupBox;
    Label24: TLabel;
    Label28: TLabel;
    dbeCobLOC: TwwDBEdit;
    dbeCobEXT: TwwDBEdit;
    gbxADevolver: TGroupBox;
    Label14: TLabel;
    Label19: TLabel;
    dbeDevLOC: TwwDBEdit;
    dbeDevEXT: TwwDBEdit;
    Label20: TLabel;
    dbeACobrar: TwwDBEdit;
    Label21: TLabel;
    dbeADevolver: TwwDBEdit;
    chkAsignaResto: TCheckBox;
    Label22: TLabel;
    z2bbtnNuevo: TBitBtn;
    dblcTarjeta: TwwDBLookupCombo;
    edtTarjeta: TEdit;
    cboVuelto: TComboBox;
    Bevel4: TBevel;
    StaticText2: TStaticText;
    lblEstado: TLabel;
    Z2bbtnCV: TBitBtn;
    procedure wwDBGrid1IButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcTMonCExit(Sender: TObject);
    procedure Z2bbtnCancelDetClick(Sender: TObject);
    procedure dblcTarjetaExit(Sender: TObject);
    procedure chkAsignaRestoClick(Sender: TObject);
    procedure Z2bbtnCalcClick(Sender: TObject);
    procedure z2bbtnNuevoClick(Sender: TObject);
    procedure dbgDetFPagoDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgDetFPagoEnter(Sender: TObject);
    procedure Z2OkDetalleClick(Sender: TObject);
    procedure dbeCancEXTChange(Sender: TObject);
    procedure dbeCancLOCChange(Sender: TObject);
    procedure dbeRecibidoEnter(Sender: TObject);
    procedure dbeACobrarEnter(Sender: TObject);
    procedure dbeADevolverEnter(Sender: TObject);
    procedure dbeRecibidoExit(Sender: TObject);
    procedure dbeACobrarExit(Sender: TObject);
    procedure dbeADevolverExit(Sender: TObject);
    procedure dbeRecibidoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeRecibidoChange(Sender: TObject);
    procedure bbtnOKClick(Sender: TObject);
    procedure Z2bbtnCancelClick(Sender: TObject);
    procedure Z2bbtnOKClick(Sender: TObject);
    procedure Z2bbtnCVClick(Sender: TObject);
  private
    { Private declarations }
    strTmp    : String ;
    xTC : Currency ;
    xOrden: Integer;
    xDat: TDatosCancelacion;
    xOK: Boolean;
    procedure DeshabilitaPaneles ;
    procedure HabilitaPaneles ;
    procedure ValidacionGrid ;
    procedure AdicFPago;
    procedure EditFPago;
    procedure LevantaPnlDetalle;

    procedure ValidacionTjaChq ;
    procedure ValidacionCobradoTotal ;
    procedure ValidacionDatos ;

    procedure ActualizaAcumulados ;
    procedure GrabaDetalle ;
    procedure LLenaEdits ;
    procedure AcumEnEdit ;
    procedure AcumEnSave ;
    procedure Copia(var Acum1 , Acum2 : TAcumulados ) ;
    procedure Inserta ;
    procedure Valida ;
    procedure ValidaCab ;
    procedure ValidaCancelacion ;
    function  EncIndex (xSTR : String ) : Integer ;
    procedure Configura ;
    procedure GrabarDetalle ;
    procedure validaGrabacion ;
  public
    { Public declarations }
    procedure RecibirDatos (Datos : TDatosCancelacion ) ;
    function  FinalizadoOK : Boolean ;
    function MuestraCancelacion (xCIAID , xECOPAGO : String ): Boolean;
  end;

var
  FDetCancela: TFDetCancela;

implementation

uses Caja209;

{$R *.DFM}
const
   MENSAJES : Array[0..7,0..1] of String =
       (('dblctdiario', 'Ingrese tipo de diario'),
        ('dbenocomp'  , 'Ingrese Número de Comprobante'),
        ('dblctmon'   , 'Ingrese Tipo de Moneda'),
        ('dbdtpfcanc' , 'Ingrese Fecha de cancelación'),
        ('dbetcamb'   , 'Ingrese Tipo de Cambio'),
        ('dbelote'    , 'Ingrese Lote'),
        ('dblcdcnp'   , 'Ingrese concepto'),
        ('dbeglosa'   , 'Ingrese Glosa')
        );
var
   Acum ,
   AcumBCK : TACUMULADOS ;
procedure TFDetCancela.wwDBGrid1IButtonClick(Sender: TObject);
begin
    if not xOK then
      AdicFPago
    else
      ShowMessage('El Movimiento Ya se encuentra Cancelado') ;   
end;

procedure TFDetCancela.DesHabilitaPaneles ;
begin
   if not pnlDetalle.Enabled then
      pnlDetalle.Tag := 1
   else
      pnlDetalle.Tag := 0 ;

   if not pnlBotones.Enabled then
      pnlBotones.Tag := 1
   else
      pnlBotones.Tag := 0 ;

   pnlDetalle.Enabled   := False ;
   pnlBotones.Enabled   := False ;
   dbgDetFPago.Enabled  := False ;

end ;

procedure TFDetCancela.HabilitaPaneles;
begin
   if pnlDetalle.Tag = 0 then
      pnlDetalle.Enabled := True ;
   if pnlBotones.Tag = 0 then
      pnlBotones.Enabled := True ;
      
   dbgDetFPago.Enabled := True ;
end;

procedure TFDetCancela.FormCreate(Sender: TObject);
begin
   with DMTE do
   begin
     cdsFormPago.Filter:=' FPAGODEVEFEC=''1'' or FCEGR=''S'' ' ;
     cdsFormPago.Filtered:=TRUE ;

//     cdsBancoEgr.Filter := 'TRIM(BCOTIPCTA) <> ''C''' ;
     DMTE.cdsBancoEgr.Filter := ' (BCOTIPCTA IS NULL) OR TRIM(BCOTIPCTA)=''B'' ' ;
     cdsBancoEgr.Filtered:=TRUE ;

     cdsTarjeta := TwwClientDataset.Create(self);
     cdsTarjeta.Name := 'cdsTarjeta' ;
     cdsTarjeta.RemoteServer := DCOM1 ;
     cdsTarjeta.providerName := cdsQry2.ProviderName ;
     cdsTarjeta.DataRequest('SELECT * FROM TGE167 ORDER BY TJAID') ;
     cdsTarjeta.Active := True ;
     dblcTarjeta.LookupTable := cdsTarjeta ;

     xOK := False ;
     //Linea Temporal
     //RecibirDatos ( Dat ) ;
     //
   end ;
end;

procedure TFDetCancela.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     DMTE.cdsFormPago.Filter   := '';
     DMTE.cdsFormPago.Filtered := TRUE;
end;

procedure TFDetCancela.dblcFormPagoExit(Sender: TObject);
var
   ctrl : TWinControl ;
   Tmp : String ;
   xDescrip : String;
begin

   xDescrip := 'FPAGOID='+quotedstr(dblcFormPago.text);
   edtFormPago.text := DMTE.DisplayDescrip('prvTGE','TGE112','FPAGODES',xDescrip,'FPAGODES');

   if (trim(edtFormPago.text) <> '' ) and (dblcFormPago.text <> strTmp)then
   begin
      if dblcFormPago.text = DMTE.wEFECTIVO then
      begin
         DesHabilitaControles([dblcBanco,dblcTarjeta,dbeNOChq]) ;
      end
      else begin
         if dblcFormPago.text = DMTE.wCHEQUE then
         begin
             DesHabilitaControles ([dblcTarjeta]) ;
             HabilitaControles ([dbeNOChq,dblcBanco]) ;
         end
         else
         begin
             HabilitaControles ([dbeNOChq,dblcBanco,dblcTarjeta]) ;
         end;
      end;

      ctrl := self.ActiveControl ;
      if dblcFormPago.text = DMTE.wEFECTIVO then
      begin
         dblcBanco.Text   := '' ;
         edtBanco.text    := '' ;
         dblcTarjeta.text := '' ;
         edtTarjeta.text  := '' ;
         dbeNOChq.Text    := '' ;
      end
      else
         if dblcFormPago.text = DMTE.wCHEQUE then
         begin
             dblcTarjeta.text := '' ;
             edtTarjeta.text  := '' ;
             dbeNOChq.Text    := '' ;
         end
         else
         begin
             dbeNOChq.Text    := '' ;
         end;
   end;
end;

procedure TFDetCancela.dblcBancoExit(Sender: TObject);
begin
   edtBanco.text:=DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr,'BANCOID',dblcBanco.Text,'BANCOABR') ;

   if edtBanco.Text='' then begin
      dblcBanco.Value:= '';
      edtBanco.Text  := '';
      ShowMessage('Error : Banco no Valido');
      dblcBanco.SetFocus;
      Exit;
   end;
end;

procedure TFDetCancela.dblcTMonCExit(Sender: TObject);
begin
   if z2bbtnCancelDet.Focused then exit;

   edtTMonC.text:= DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMonC.Text,'TMONDES') ;

   if edtTMonC.Text='' then begin
      ShowMessage('Error : Moneda no Valida');
      dblcTMonC.SetFocus;
      Exit;
   end;
end;

procedure TFDetCancela.Z2bbtnCancelDetClick(Sender: TObject);
begin
   DMTE.cdsDetFPago.Cancel ;
   HabilitaPaneles ;
   pnlFPago.Visible := False ;
   copia(Acum,AcumBCK) ;
end;

procedure TFDetCancela.dblcTarjetaExit(Sender: TObject);
var
    xDescrip : String;
begin
   xDescrip := 'TJAID='+quotedstr(dblcTarjeta.text);
   edtTarjeta.text := DMTE.displaydescrip('prvTGE','TGE167','TJADES',xDescrip,'TJADES');
   If dblcTarjeta.text = '' then
   begin
      showmessage('Falta Tarjeta');
      dblcTarjeta.SetFocus;
   end;
end;

procedure TFDetCancela.chkAsignaRestoClick(Sender: TObject);
begin
  if chkAsignaResto.Checked then
  begin
      dbeRecibido.Enabled  := False ;
      dbeACobrar.Enabled   := False ;
      dbeADevolver.Enabled := False ;
      if dblcTMonC.Text = DMTE.wTMonLoc then
         dbeRecibido.Text := dbeDifLoc.text
      else
         dbeRecibido.Text := dbeDifExt.text ;
      dbeRecibidoExit(nil) ;
  end
  else
  begin
      dbeRecibido.Enabled  := True ;
      dbeACobrar.Enabled   := True ;
      dbeADevolver.Enabled := True ;
  end;
end;

procedure TFDetCancela.Z2bbtnCalcClick(Sender: TObject);
begin
     WinExec('C:\windows\calc.exe',1);  //Activa la calculadora del Windows
end;

procedure TFDetCancela.ValidacionGrid;
begin
end;

procedure TFDetCancela.z2bbtnNuevoClick(Sender: TObject);
begin
//   prueba
//   dblcFormpago.setfocus ;
     if DMTE.cdsDetFPago.State in [dsedit,dsinsert] then
     begin
         if MessageDlg(' Añadir Cancelará los Cambios Actuales'+ #13 +
                       '     ¿ Desea Continuar ?     ',mtConfirmation,[mbYes, mbNo],0) = mrNo then
            exit ;
     end ;
     DMTE.cdsDetFPago.Cancel ;
     Copia( Acum,AcumBCK ) ;
     BlanqueaEdits(pnlFPago) ;
     Inserta ;
end;

procedure TFDetCancela.AdicFPago;
begin
  //Deshabilitar resto de paneles
  if CajaDec( dbeDifEXT.text ) = BLANCO then
  begin
     ShowMessage('Movimiento Cancelado'+
                 #13+'No puede Ingresar mas detalles') ;
     Exit ;
  end ;
  Z2bbtnNuevo.Visible := True ;
  LevantaPnlDetalle ;
  Inserta ;
end;

procedure TFDetCancela.EditFPago ;
begin
  LevantaPnlDetalle ;
//  CalculoMontos
  AcumEnEdit ;
  LLenaEdits ;
  DMTE.cdsDetFPago.edit ;
end ;

procedure TFDetCancela.LevantaPnlDetalle;
begin

  DeshabilitaPaneles ;
  PnlFpago.Bringtofront ;
  BlanqueaEdits(pnlFPago) ;
  PnlFpago.Visible := True ;
  PnlFpago.setfocus ;
  perform(CM_DialogKey,VK_TAB,0) ;
  
end;

procedure TFDetCancela.dbgDetFPagoDblClick(Sender: TObject);
begin
    if xOk then
       Exit ;
    if dbgDetFPago.DataSource.DataSet.RecordCount = 0 then
    begin
      ShowMessage ('No hay Registros por editar') ;
      Exit ;
    end ;
    EditFPago ;
end;

procedure TFDetCancela.FormShow(Sender: TObject);
begin
    xOrden := 0 ;
    //Establecimiento del foco inicial
    if pnlDetalle.Enabled then
       pnlDetalle.SetFocus
    else if pnlBotones.enabled then
             pnlBotones.SetFocus
         else
            Exit ;

    perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFDetCancela.RecibirDatos (Datos : TDatosCancelacion ) ;
begin
     xDat := Datos ;
     Configura ;
end;

procedure TFDetCancela.dbgDetFPagoEnter(Sender: TObject);
begin

    if dbgDetFPago.DataSource.DataSet.RecordCount = 0 then
    begin
       AdicFPago ;
    end ;

end;

procedure TFDetCancela.Z2OkDetalleClick(Sender: TObject);
begin
   ValidacionDatos ;
   ValidacionTjaChq ;
   ValidacionCobradoTotal ;
   GrabaDetalle ;
   ActualizaAcumulados ;
   DMTE.cdsDetFPago.edit ;
end;

procedure TFDetCancela.ValidacionCobradoTotal;
var
   xMonto : string ;
begin
   if chkAsignaResto.Checked then
      Exit ;

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
end;

procedure TFDetCancela.ValidacionTjaChq;
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

    if trim(dbeADevolver.Text) <> BLANCO then
    begin
       Raise Exception.create('No puede Haber Monto a Devolver' + #13 +
                              'Si el tipo de pago es Cheque o Tarjeta') ;
    end ;
end;

procedure TFDetCancela.dbeCancEXTChange(Sender: TObject);
begin
   if ( trim(dbeImpEXT.Text) <> '' ) and ( trim(dbeCancEXT.text) <>'' ) then
    dbeDifExt.Text := currtostr(strtocurr(dbeImpEXT.Text) - strtocurr(dbeCancEXT.text)) ;
end;

procedure TFDetCancela.dbeCancLOCChange(Sender: TObject);
begin
   if ( trim(dbeImpLOC.Text) <> '' ) and ( trim(dbeCancLOC.text) <>'' ) then
    dbeDifLoc.Text := currtostr(strtocurr(dbeImpLoc.Text) - strtocurr(dbeCancLoc.text)) ;
end;


procedure TFDetCancela.GrabaDetalle;
begin
    with DMTE.cdsDetFPago do
    begin
        FieldByName('FPAGOID').AsString        := dblcFormPago.text ;
        FieldByName('BANCOID').AsString        := dblcBanco.text ;
        FieldByName('TJAID').AsString          := dblcTarjeta.text ;
        FieldByName('TMONID').AsString         := dblcTMOnC.Text ;
        FieldByName('ECNOCHQ').AsString        := dbeNOChq.Text ;
        FieldByName('FC_RECIBIDO').AsString    := dbeRecibido.text ;
        FieldByName('FC_COBRADO').AsString     := dbeaCobrar.text ;
        FieldByName('FC_DEVOLVER').AsString    := dbeADevolver.Text ;
        Post ;
    end ;
end ;

procedure TFDetCancela.LLenaEdits;
begin
    with DMTE.cdsDetFPago do
    begin
        dblcFormPago.text := DMTE.FieldNoNUlo(FieldByName('FPAGOID'))      ;
        dblcBanco.text    := DMTE.FieldNoNUlo(FieldByName('BANCOID'))      ;
        dblcTarjeta.text  := DMTE.FieldNoNUlo(FieldByName('TJAID'))        ;
        dblcTMOnC.Text    := DMTE.FieldNoNUlo(FieldByName('TMONID'))       ;
        dbeNOChq.Text     := DMTE.FieldNoNUlo(FieldByName('ECNOCHQ'))      ;
        dbeRecibido.text  := DMTE.FieldNoNUlo(FieldByName('FC_RECIBIDO'))  ;
        dbeaCobrar.text   := DMTE.FieldNoNUlo(FieldByName('FC_COBRADO'))   ;
        dbeADevolver.Text := DMTE.FieldNoNUlo(FieldByName('FC_DEVOLVER'))  ;
        //Llenado de LookUps
{        edtFormPago.text  := DMTE.cdsDetFPagoLK_FORMAPAGO.AsString ;
        edtBanco.text     := DMTE.cdsDetFPagoLK_BANCO.AsString     ;
        edtTarjeta.text   := DMTE.cdsDetFPagoLK_TARJETA.AsString   ;
        edtTMOnC.Text     := DMTE.cdsDetFPagoLK_MONEDA.AsString    ;}
    end ;
    dbeRecibido.Enabled  := True ;
    dbeACobrar.Enabled   := True ;
    dbeAdevolver.Enabled := True ;
    Z2bbtnNuevo.Visible := False ;
end;

procedure TFDetCancela.AcumEnEdit;
begin
  Copia(AcumBCK,Acum) ;
  with Acum do
  begin
   if DMTE.cdsDetFPago.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
   begin
     SOLES    :=  Redondea( SOLES - DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat ) ;
     DEVSOLES := Redondea( DEVSOLES - DMTE.cdsDetFPago.FieldByName('FC_DEVOLVER').AsFloat ) ;
     if ( DMTE.cdsDetFPago.FieldByName('FPAGOID').AsString = DMTE.wCHEQUE ) or
        ( DMTE.cdsDetFPago.FieldByName('FPAGOID').AsString = DMTE.wTARJETA ) then
     begin
        CHQTJASOLES  :=  CHQTJASOLES - Redondea( DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat );
     end ;
   end
   else
   begin
     DOLARES  :=  Redondea( DOLARES - DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat ) ;
     DEVDOLARES := Redondea( DEVDOLARES - DMTE.cdsDetFPago.FieldByName('FC_DEVOLVER').AsFloat ) ;
     if ( DMTE.cdsDetFPago.FieldByName('FPAGOID').AsString = DMTE.wCHEQUE ) or
        ( DMTE.cdsDetFPago.FieldByName('FPAGOID').AsString = DMTE.wTARJETA ) then
     begin
        CHQTJADOLARES  :=  CHQTJADOLARES - Redondea( DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat ) ;
     end ;
   end ;

   COBRADOSOLES     :=  SOLES + REDONDEA(( DOLARES * xTC )) ;
   COBRADODOLARES   :=  DOLARES + redondea(( SOLES / xTC )) ;
  end ;
end;

procedure TFDetCancela.ActualizaAcumulados;
begin
   AcumEnSave ;
   dbeCobLoc.text  :=  currtostr(Acum.SOLES) ;
   dbeCobExt.Text  :=  currtostr(Acum.DOLARES) ;
   dbeDEvLOC.text  :=  currtostr(Acum.DEVSOLES)  ;
   dbeDevEXT.text  :=  currtostr(Acum.DEVDOLARES)  ;
   dbeCancLOC.Text :=  currtostr(Acum.COBRADOSOLES)  ;
   dbeCancEXT.text :=  currtostr(Acum.COBRADODOLARES)  ;
   if cajadec(dbeDifLOC.Text) = BLANCO then
      dbeDifEXT.text := '0.00'
   else
      if cajadec(dbeDifEXT.text) = BLANCO then
         dbeDifLOC.text := '0.00' ;
   AcumEnEdit ;
end;

procedure TFDetCancela.AcumEnSave;
begin
  with Acum do
  begin
   if DMTE.cdsDetFPago.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
   begin
     SOLES    :=  SOLES + redondea(DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat) ;
     DEVSOLES := DEVSOLES + redondea(DMTE.cdsDetFPago.FieldByName('FC_DEVOLVER').AsFloat ) ;
     if ( DMTE.cdsDetFPago.FieldByName('FPAGOID').AsString = DMTE.wCHEQUE ) or
        ( DMTE.cdsDetFPago.FieldByName('FPAGOID').AsString = DMTE.wTARJETA ) then
     begin
        CHQTJASOLES  :=  CHQTJASOLES + redondea(DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat) ;
     end ;
   end
   else
   begin
     DOLARES  :=  DOLARES + redondea(DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat) ;
     DEVDOLARES := DEVDOLARES + redondea(DMTE.cdsDetFPago.FieldByName('FC_DEVOLVER').AsFloat) ;
     if ( DMTE.cdsDetFPago.FieldByName('FPAGOID').AsString = DMTE.wCHEQUE ) or
        ( DMTE.cdsDetFPago.FieldByName('FPAGOID').AsString = DMTE.wTARJETA ) then
     begin
        CHQTJADOLARES  :=  CHQTJADOLARES + redondea( DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat ) ;
     end ;
   end ;

   COBRADOSOLES     :=  SOLES + Redondea(( DOLARES * xTC )) ;
   COBRADODOLARES   :=  DOLARES + redondea(( SOLES / xTC )) ;
  end ;
  copia(AcumBCK,Acum) ;
end ;

procedure TFDetCancela.Copia(var Acum1 , Acum2 : TAcumulados);
begin
    with Acum1 do
    begin
      SOLES          :=  Acum2.SOLES          ;
      DOLARES        :=  acum2.DOLARES        ;
      DEVSOLES       :=  Acum2.DEVSOLES       ;
      DEVDOLARES     :=  acum2.DEVDOLARES     ;
      CHQTJASOLES    :=  Acum2.CHQTJASOLES    ;
      CHQTJADOLARES  :=  acum2.CHQTJADOLARES  ;
      COBRADOSOLES   :=  Acum2.COBRADOSOLES   ;
      COBRADODOLARES :=  acum2.COBRADODOLARES ;
    end
end;

procedure TFDetCancela.Inserta;
begin
  with DMTE.cdsDetFPago do
  begin
    Insert ;
  //Establecer Algunos Datos default ;
    Inc(xOrden) ;
    FieldByName('CORRE').AsInteger := xOrden ;
    dblcTMonC.text       := dblcTMon.Text ;
    edtTMonC.Text        := edtTMon.Text ;
    dbeRecibido.Enabled  := True ;
    dbeACobrar.Enabled   := False ;
    dbeAdevolver.Enabled := False ;
    dblcFormPago.SetFocus ;
  end ;
end;

procedure TFDetCancela.dbeRecibidoEnter(Sender: TObject);
begin
   strTmp := dbeRecibido.Text ;
end;

procedure TFDetCancela.dbeACobrarEnter(Sender: TObject);
begin
   strTmp := dbeACobrar.Text ;
end;

procedure TFDetCancela.dbeADevolverEnter(Sender: TObject);
begin
   strTmp := dbeADevolver.Text ;
end;

procedure TFDetCancela.dbeRecibidoExit(Sender: TObject);
var
   Tmp : String ;
begin
   Tmp := StrTmp ;
   if CajaDec( dbeRecibido.text ) = BLANCO then
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
      dbeADevolver.Text := BLANCO ;
   end ;

end;

procedure TFDetCancela.dbeACobrarExit(Sender: TObject);
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
      begin
         dbeACobrar.Text := dbeRecibido.Text ;
         dbeADevolver.text := BLANCO ;
      end
      else
      begin
         dbeADevolver.text := DifDec( dbeRecibido.Text , dbeACobrar.Text ) ;
      end ;
   end ;

end;

procedure TFDetCancela.dbeADevolverExit(Sender: TObject);
begin
   if strTmp <> dbeACobrar.text then
   begin
//////
      if CajaDec( dbeADevolver.text ) = BLANCO then
      begin
         dbeADevolver.text := CajaDec ( dbeADevolver.text ) ;
         dbeACobrar.text := dbeRecibido.Text ;
         Exit ;
      end ;
//////

      if CmpDec( dbeRecibido.Text , dbeADevolver.Text ) <= 0 then
      begin
         ShowMessage ('El Monto a Devolver ' + #13 +
                      'No puede ser mayor ni igual al Monto Recibido ') ;
         dbeADevolver.SetFocus ;
         Exit ;
      end
      else
      begin
         dbeACobrar.text := DifDec( dbeRecibido.Text , dbeADevolver.Text ) ;
      end ;
   end ;

end;

procedure TFDetCancela.dbeRecibidoKeyPress(Sender: TObject; var Key: Char);
var
   xStr : String ;
begin
    if not( Key in [ '0'..'9' , '.' , #8 ]) then
    begin
       Key := #0 ;
    end ;
    xStr := TwwDBEdit(Sender).text ;
    if key = '.' then
       if pos('.',xSTR) <> 0 then
          Key := #0 ;
end;

procedure TFDetCancela.dbeRecibidoChange(Sender: TObject);
begin
    dbeACobrar.Enabled := True ;
    dbeAdevolver.Enabled := True ;
end;

procedure TFDetCancela.bbtnOKClick(Sender: TObject);
begin
    Valida ;
end;

procedure TFDetCancela.Valida;
begin
{0507
  if pnlCabecera1.Enabled then
  begin
     ValidaCab        ;
     ValidaComp       ;
  end ;
}
  ValidaCancelacion   ;
end;

procedure TFDetCancela.ValidaCab;
var
  i : Integer ;
begin
{0507
   for i := 0  to pnlCabecera1.ControlCount - 1  do
   begin
       if ( pnlCabecera1.Controls[i] is TCustomEdit ) then
          if TCustomEdit(pnlCabecera1.Controls[i]).enabled then
             if Trim(TCustomEdit(pnlCabecera1.Controls[i]).text) = '' then
             begin
                TCustomEdit(pnlCabecera1.Controls[i]).setfocus ;
                Raise Exception.create(MENSAJES[EncIndex(TCustomEdit(pnlCabecera1.Controls[i]).Name),1]) ;
             end ;
   end;
}
   for i := 0  to gbxPago.ControlCount - 1  do
   begin
       if ( gbxPago.Controls[i] is TCustomEdit ) then
          if TCustomEdit(gbxPago.Controls[i]).enabled then
             if Trim(TCustomEdit(gbxPago.Controls[i]).text) = '' then
             begin
                TCustomEdit(gbxPago.Controls[i]).setfocus ;
                Raise Exception.create(MENSAJES[EncIndex(TCustomEdit(gbxPago.Controls[i]).Name),1]) ;
             end ;
   end;

end;

procedure TFDetCancela.ValidaCancelacion;
begin
    if cajadec(dbedifext.text) <> blanco then
    begin
       Raise Exception.create('Aún no se ha Cancelado el Movimiento') ;
    end ;
end;


function TFDetCancela.EncIndex(xSTR: String) : integer;
var
   i : Integer ;
begin
   Result := 0 ;
   for i := 0  to 7 do
   begin
       if mensajes[i,0] = ansilowercase(xSTR) then
       begin
          Result := i ;
          break ;
       end ;
   end;
end;

procedure TFDetCancela.ValidacionDatos;
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

   if (cajadec(dbeRecibido.text) = BLANCO)  then
   begin
        dbeRecibido.SetFocus ;
        Raise Exception.Create ('Ingrese Monto Recibido') ;
   end
   else if (cajadec(dbeACobrar.text) = BLANCO) then
        begin
            dbeACobrar.SetFocus ;
            Raise Exception.Create ('Ingrese Monto a Cobrar') ;
        end ;

end;

procedure TFDetCancela.Configura;
var
   xSQL : String ;
begin
     Blanqueaeditsenform(self) ;
     with Acum do
     begin
        COBRADOSOLES    := 0 ;
        COBRADODOLARES  := 0 ;
        DEVSOLES        := 0 ;
        DEVDOLARES      := 0 ;
        SOLES           := 0 ;
        DOLARES         := 0 ;
        CHQTJASOLES     := 0 ;
        CHQTJADOLARES   := 0 ;
     end ;
     copia(AcumBCK,Acum ) ;

     dblcTMon.Text    := xDat.TMONID    ;
     edtTMon.Text     := xDat.TMONDES   ;
     dbeTCamb.Text    := xDat.ECTCAMB   ;
     dbdtpFCanc.Date  := strtodate(xDat.FECHATC) ;
     xTC              := strtocurr(xDat.ECTCAMB) ;

     //LLenado de los Montos
     if xDat.TMONID = DMTE.wTMonLoc then
     begin
        dbeImpEXT.text  :=  floattostrf(strtocurr(xDat.ECMTOORI) / xTC,ffFixed,10,2)  ;
        dbeIMpLoc.text  :=  xDat.ECMTOORI   ;
        dbeCancEXT.text :=  '0'   ;
        dbeCancLoc.text :=  '0'   ;
     end
     else
     begin
        dbeImpEXT.text  :=  xDat.ECMTOORI  ;
        dbeIMpLoc.text  :=  floattostrf(strtocurr(xDat.ECMTOORI) * xTC,ffFixed,10,2)   ;
        dbeCancEXT.text :=  '0'   ;
        dbeCancLoc.text :=  '0'   ;
     end ;
     dbeCobLOc.Text := '0' ;
     dbeCobEXT.Text := '0' ;
     dbeDevLOc.Text := '0' ;
     dbeDevEXT.Text := '0' ;
     //fin de llenado de montos

     cboVuelto.ItemIndex := 0 ;

     // vhn 22/01/2001
     xSQL:='Select * from CAJA314 '
          +'Where CIAID='''' and CCTREC='''' and '
          +      'DOCID='''' and CCSERIE='''' and '
          +      'CCNODOC='''' ';
     DMTE.cdsDetFPago.Close;
     DMTE.cdsDetFPago.DataRequest( xSQL );
     DMTE.cdsDetFPago.Open;
end;

function TFDetCancela.FinalizadoOK: Boolean;
begin
    Result := xOK ;
end;

procedure TFDetCancela.Z2bbtnCancelClick(Sender: TObject);
begin
    if not xOK then
    begin
       if MessageDlg('¿ Desea Aplicar los Cambios'+ #13 +
                     ' Antes de Salir ?    ',mtConfirmation,[mbYes, mbNo],0) = mrYes then
       begin
          Z2bbtnOkClick(nil) ;
       end
       else
       begin

         DMTE.cdsDetFPago.CancelUpdates ;
       end ;
       Close ;
    end
    else
    begin
       Close ;
    end ;
end;

procedure TFDetCancela.Z2bbtnOKClick(Sender: TObject);
begin
   validaGrabacion ;
   with DMTE do
   begin
      //Datos Adicionales
      cdsIngDocs.Edit ;
      cdsIngDocs.FieldByName('ECCOBLOC').ASString := dbeCobLOc.Text ;
      cdsIngDocs.FieldByName('ECCOBEXT').ASString := dbeCobExt.text ;
      cdsIngDocs.FieldByName('ECDEVLOC').AsString := dbeDevLoc.Text ;
      cdsIngDocs.FieldByName('ECDEVEXT').AsString := dbeDevExt.Text ;
      //Fin de Datos Adicionales
   end;
   GrabarDetalle ;
   lblEstado.Caption    :='Cancelado          ' ;

   xOK := True ;
   gbxPago.Enabled      := False ;
   Z2bbtnOK.Enabled     := False ;

end;

procedure TFDetCancela.GrabarDetalle;
begin
  with DMTE.cdsDetFPago do
  begin
    DisableControls ;
    First ;
    while not Eof do
    begin
        Edit ;
        FieldBYname('CIAID').AsString    := xDat.CIAID  ;
        FieldBYname('CCTREC').AsString  := xDat.CCTREC  ;
        FieldBYname('DOCID').AsString  := xDat.DOCID    ;
        FieldBYname('CCSERIE').AsString := xDat.CCSERIE ;
        FieldBYname('CCNODOC').AsString := xDat.CCNODOC ;
        Post ;
        Next ;
    end;
    First ;
    EnableControls ;

  end ;
end;

function TFDetCancela.MuestraCancelacion (xCIAID , xECOPAGO : String ):Boolean;
var
   xSQL : String ;
   xWhere : String ;
begin
      Result := False ;
      xWhere := 'ECOPAGO = '''+ xECOPAGO + ''' AND CIAID = ''' + xCIAID + '''' ;
      if DMTE.RecuperarDatos('CAJA302','*',xWhere) then
      begin
         with DMTE.cdsREc do
         begin
            xDat.CIAID      :=  FieldBYname('CIAID').AsString ;
            dblcTMon.Text :=    FieldBYname('TMONID').AsString ;
            dbdtpFCanc.Text :=  FieldBYname('ECFCOMP').AsString ;
            dbeTCamb.Text :=    FieldBYname('ECTCAMB').AsString ;
            dbeCobLoc.Text :=   FieldBYname('ECCOBLOC').AsString  ;
            dbeCobExt.Text :=   FieldBYname('ECCOBEXT').AsString  ;
            dbeDEvLOC.Text :=   FieldBYname('ECDEVLOC').AsString  ;
            dbeDEVEXT.Text :=   FieldBYname('ECDEVEXT').AsString  ;
            dbeImpExt.Text :=   FieldBYname('ECMTOEXT').AsString  ;
            dbeImpLoc.Text :=   FieldBYname('ECMTOLOC').AsString  ;
            dbeCancExt.Text :=  FieldBYname('ECMTOEXT').AsString  ;
            dbeCancLoc.Text :=  FieldBYname('ECMTOLOC').AsString  ;
            dbeDifExt.Text :=   '0.00'  ;
            dbeDifLoc.Text :=   '0.00'  ;
            DMTE.RecuperarDatos('TGE103','TMONABR','TMONID='''+ dblcTMon.Text + '''' ) ;
            edtTMon.text   := FieldBYname('TMONABR').AsString ;
         end ;
         ActivaBotones(pnlBotones,False ) ;
         pnlDetalle.Enabled   := False ;
         pnlBotones.Enabled   := False ;
      end
      else
      begin
        ShowMessage('ERRor') ;
        Exit ;
      end ;

     // vhn 22/01/2001
     xSQL:='Select * from CAJA314 '
          +'Where CIAID='''   +xDat.CIAID      +''' ';
     DMTE.cdsDetFPago.Close;
     DMTE.cdsDetFPago.DataRequest( xSQL );
     DMTE.cdsDetFPago.Open;

     Result := true ;
end;


procedure TFDetCancela.Z2bbtnCVClick(Sender: TObject);
begin
   FComVenMon := TFComVenMon.Create(Self) ;
   FComVenMon.Adiciona ;
   try
     FComVenMon.Showmodal ;
   finally
     FComVenMon.Free ;
   end ;
end;

procedure TFDetCancela.validaGrabacion;
begin
   if strtocurr(dbeDifEXT.Text) <> 0 then
   begin
      Raise Exception.create('Ingrese Monto Cancelado') ;
   end ;
   if strtocurr(dbeDifLOC.Text) <> 0 then
   begin
      Raise Exception.create('Ingrese Monto Cancelado') ;
   end ;

end;


end.

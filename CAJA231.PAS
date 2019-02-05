unit Caja231;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit, wwdblook,
  StdCtrls, Buttons, ExtCtrls, Wwdbdlg, CajaDM, Db, DBClient, wwclient ,
  CajaUtil;

type
{
  TACUMULADOS = Record
    SOLES          , Indica la cantidad cobrada en soles
    DOLARES        , Indica la cantidad cobrada en dolares
    CHQTJASOLES    , indica la cantidad cobrada en soles entre cheque y tarjeta
    CHQTJADOLARES  , indica la cantidad cobrada en dolares entre cheque y tarjeta
    COBRADOSOLES   , Cantidad total cobrada convertida a soles
    COBRADODOLARES : Cantidad total cobrada convertida a dolares
}
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
    TDIARDES   : String ;
  end ;

  TFDetCancela1 = class(TForm)
    PnlFPago: TPanel;
    Z2OkDetalle: TBitBtn;
    Z2bbtnCancelDet: TBitBtn;
    PnlEmiteDoc: TPanel;
    Label5: TLabel;
    Panel4: TPanel;
    lblTDoc: TLabel;
    lblNoDoc: TLabel;
    Label1: TLabel;
    dblcTDoc: TwwDBLookupCombo;
    edtTDoc: TEdit;
    dbeNoDoc: TwwDBEdit;
    wwDBLookupCombo3: TwwDBLookupCombo;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    z2bbtnCancel2: TBitBtn;
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
    Label6: TLabel;
    lblConcepto: TLabel;
    lblGlosa: TLabel;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    dbdtpFCanc: TwwDBDateTimePicker;
    dbeTCamb: TwwDBEdit;
    dbeLote: TwwDBEdit;
    dblcdCnp: TwwDBLookupComboDlg;
    dbeGlosa: TwwDBEdit;
    Z2bbtnCalc: TBitBtn;
    pnlCabecera1: TPanel;
    lblTDiario: TLabel;
    lblNoComp: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    dbeNoComp: TwwDBEdit;
    pnlBotones: TPanel;
    Z2bbtnCancel: TBitBtn;
    Z2bbtnOK: TBitBtn;
    Z2bbtnContab: TBitBtn;
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
    Bevel3: TBevel;
    Label22: TLabel;
    z2bbtnNuevo: TBitBtn;
    dblcTarjeta: TwwDBLookupCombo;
    edtTarjeta: TEdit;
    cboVuelto: TComboBox;
    Bevel4: TBevel;
    StaticText2: TStaticText;
    lblPeriodo: TLabel;
    edtPeriodo: TEdit;
    lblEstado: TLabel;
    Z2bbtnCV: TBitBtn;
    procedure Z2bbtnImprimirClick(Sender: TObject);
    procedure wwDBGrid1IButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcTDiarioChange(Sender: TObject);
    procedure dblcdCnpChange(Sender: TObject);
    procedure dblcFormPagoChange(Sender: TObject);
    procedure dblcBancoChange(Sender: TObject);
    procedure dblcTMonCChange(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dblcdCnpExit(Sender: TObject);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcTMonCExit(Sender: TObject);
    procedure Z2bbtnCancelDetClick(Sender: TObject);
    procedure dblcTarjetaChange(Sender: TObject);
    procedure dblcTarjetaExit(Sender: TObject);
    procedure dblcTDiarioEnter(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);
    procedure chkAsignaRestoClick(Sender: TObject);
    procedure Z2bbtnCalcClick(Sender: TObject);
    procedure dbdtpFCancExit(Sender: TObject);
    procedure dblcFormPagoEnter(Sender: TObject);
    procedure z2bbtnNuevoClick(Sender: TObject);
    procedure dbgDetFPagoDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgDetFPagoEnter(Sender: TObject);
    procedure dbeLoteExit(Sender: TObject);
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
    procedure Z2bbtnContabClick(Sender: TObject);
    procedure Z2bbtnCancelClick(Sender: TObject);
    procedure Z2bbtnOKClick(Sender: TObject);
    procedure Z2bbtnCVClick(Sender: TObject);
  private
    { Private declarations }
    cdsTarjeta : TwwClientDataset ;
    strTmp    : String ;
    xTC : Currency ;
    xOrden: Integer;
    xDat: TDatosCancelacion;
    xOK: Boolean;
    //
    wCptoGan  ,
    wCptoPer  ,
    wCtaGan   ,
    wCtaPer   : String ;
    //
    procedure PonMensajeEnTag ;
    procedure DeshabilitaPaneles ;
    procedure HabilitaPaneles ;
    procedure ValidacionGrid ;
    procedure AdicFPago;
    procedure EditFPago;
    procedure LevantaPnlDetalle;
    procedure ValidacionTjaChq ;
    procedure ValidacionCobradoTotal ;
    procedure ActualizaAcumulados ;
    procedure GrabaDetalle ;
    procedure LLenaEdits ;
    procedure AcumEnEdit ;
    procedure AcumEnSave ;
    procedure Copia(var Acum1 , Acum2 : TAcumulados ) ;
    procedure Inserta ;
    procedure Valida ;
    procedure ValidaCab ;
    procedure ValidaComp ;
    procedure ValidaCancelacion ;
    function  EncIndex (xSTR : String ) : Integer ;
    procedure ValidacionDatos ;
    procedure Configura ;
    procedure Contabiliza ;
    procedure Contab_EgrCaja;
    procedure ActualizaSaldos;
    procedure Contab_CanjeCxC;
    procedure Contab_DifCamCanje;
    procedure GrabarDetalle ;
    procedure RecCptosDifC ;
    procedure validaGrabacion ;
  public
    { Public declarations }
    procedure RecibirDatos (Datos : TDatosCancelacion ) ;
    function  FinalizadoOK : Boolean ;
    function MuestraCancelacion (xCIAID , xECOPAGO : String ): Boolean;
  end;

var
  FDetCancela1: TFDetCancela1;

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
procedure TFDetCancela1.Z2bbtnImprimirClick(Sender: TObject);
begin
   pnlemitedoc.Visible := not PnlEmitedoc.Visible
end;

procedure TFDetCancela1.wwDBGrid1IButtonClick(Sender: TObject);
begin
    if not xOK then
      AdicFPago
    else
      ShowMessage('El Movimiento Ya se encuentra Cancelado') ;   
end;

procedure TFDetCancela1.DesHabilitaPaneles ;
begin

   if not pnlCabecera1.Enabled then
      pnlCabecera1.Tag := 1
   else
      pnlCabecera1.Tag := 0 ;

   if not pnlDetalle.Enabled then
      pnlDetalle.Tag := 1
   else
      pnlDetalle.Tag := 0 ;

   if not pnlBotones.Enabled then
      pnlBotones.Tag := 1
   else
      pnlBotones.Tag := 0 ;

   pnlCabecera1.Enabled := False ;
   pnlDetalle.Enabled   := False ;
   pnlBotones.Enabled   := False ;
   dbgDetFPago.Enabled  := False ;

end ;

procedure TFDetCancela1.HabilitaPaneles;
begin
   if pnlCabecera1.Tag = 0 then
      pnlCabecera1.Enabled := True ;
   if pnlDetalle.Tag = 0 then
      pnlDetalle.Enabled := True ;
   if pnlBotones.Tag = 0 then
      pnlBotones.Enabled := True ;
      
   dbgDetFPago.Enabled := True ;
end;

procedure TFDetCancela1.FormCreate(Sender: TObject);
{
var
   Dat : TDatosCancelacion ;
}   
begin
   with dm1 do
   begin
     ASignaTipoDiario(dblcTDiario,self) ;
     cdsFormPago.Filter:=' FPAGODEVEFEC=''1'' ' ;
     cdsFormPago.Filtered:=TRUE ;
     cdsBanco.Filter := 'TRIM(BCOTIPCTA) <> ''C''' ;
     cdsBanco.Filtered:=TRUE ;

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

procedure TFDetCancela1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     DM1.cdsFormPago.Filter   := '';
     DM1.cdsFormPago.Filtered := TRUE;
end;

procedure TFDetCancela1.dblcTDiarioChange(Sender: TObject);
begin
     dm1.EncuentraDescripcion( dblcTDiario , edtTDiario ) ;
end;

procedure TFDetCancela1.dblcdCnpChange(Sender: TObject);
begin
     dm1.EncuentraDescripcion( dblcdCnp , dbeGlosa ) ;
end;

procedure TFDetCancela1.dblcFormPagoChange(Sender: TObject);
var
   Tmp : String ;
begin
     Tmp := StrTmp ;
     dm1.EncuentraDescripcion( dblcFormPago , edtFormPago ) ;
     StrTmp := Tmp ;
     if (trim(edtFormPago.text) <> '' ) and (dblcFormPago.text <> strTmp)then
     begin
        if dblcFormPago.text = dm1.wEFECTIVO then
        begin
           DesHabilitaControles([dblcBanco,dblcTarjeta,dbeNOChq]) ;
        end
        else
             if dblcFormPago.text = dm1.wCHEQUE then
             begin
                 DesHabilitaControles ([dblcTarjeta]) ;
                 HabilitaControles ([dbeNOChq,dblcBanco]) ;
             end
             else
             begin
                 HabilitaControles ([dbeNOChq,dblcBanco,dblcTarjeta]) ;
             end   ;
     end ;
end;

procedure TFDetCancela1.dblcBancoChange(Sender: TObject);
begin
     dm1.EncuentraDescripcion( dblcBanco , edtBanco ) ;
end;

procedure TFDetCancela1.dblcTMonCChange(Sender: TObject);
begin
     dm1.EncuentraDescripcion( dblcTMonC , edtTMonC ) ;
end;

procedure TFDetCancela1.dblcTDiarioExit(Sender: TObject);
var
   xWhere ,
   Tmp : String ;
begin
      Tmp := StrTmp ;
      dm1.xxExit(dblcTDiario,edtTDiario,[],'Tipo de Diario') ;
      StrTmp := Tmp ;

      if ( edtTDiario.Text <> '' ) and ( strTmp <> dblcTDiario.text ) then
      begin
         xWhere := 'CIAID = ' + '''' + xDat.CIAID + '''' + ' AND ECANOMM = ' +
                   '''' + xDat.ECANOMM + '''' + ' AND TDIARID=' + '''' +
                    dblcTDiario.Text + '''';
         dbeNoComp.text:=DM1.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
//0601         dbeNoComp.text:=DM1.StrZero( dbeNoComp.text,6 );
         dbeNoComp.text:=DM1.StrZero( dbeNoComp.text,10 );
      end;

end;

procedure TFDetCancela1.dblcdCnpExit(Sender: TObject);
begin
     dm1.xxExit(dblcdCnp , dbeGlosa ,[] , 'Concepto' )
end;

procedure TFDetCancela1.dblcFormPagoExit(Sender: TObject);
var
   ctrl : TWinControl ;
   Tmp : String ;
begin
//nota : Las Habilitaciones correspondientes se hacen en el evento change
     Tmp := StrTmp ;
     dm1.xxExit (dblcFormPago , edtFormPago , [Z2bbtnCancelDet] , 'Forma de Pago' , 'A') ;
     StrTmp := Tmp ;

     if (trim(edtFormPago.text) <> '' ) and (dblcFormPago.text <> strTmp)then
     begin
        ctrl := self.ActiveControl ;
        if dblcFormPago.text = dm1.wEFECTIVO then
        begin
           dblcBanco.Text   := '' ;
           edtBanco.text    := '' ;
           dblcTarjeta.text := '' ;
           edtTarjeta.text  := '' ;
           dbeNOChq.Text    := '' ;
        end
        else
             if dblcFormPago.text = dm1.wCHEQUE then
             begin
                 dblcTarjeta.text := '' ;
                 edtTarjeta.text  := '' ;
                 dbeNOChq.Text    := '' ;
             end
             else
             begin
                 dbeNOChq.Text    := '' ;
             end   ;
     end ;
end;

procedure TFDetCancela1.dblcBancoExit(Sender: TObject);
begin
     dm1.xxExit (dblcBanco , edtbanco , [Z2bbtnCancelDet] , 'Banco') ;
end;

procedure TFDetCancela1.dblcTMonCExit(Sender: TObject);
begin
     dm1.xxExit ( dblcTMonC , edtTMonC ,[Z2bbtnCancelDet] ,'Tipo de Moneda','O' ) ;
end;

procedure TFDetCancela1.Z2bbtnCancelDetClick(Sender: TObject);
begin
   dm1.cdsDetFPago.Cancel ;
   HabilitaPaneles ;
   pnlFPago.Visible := False ;
   copia(Acum,AcumBCK) ;
end;

procedure TFDetCancela1.dblcTarjetaChange(Sender: TObject);
begin
   DM1.EncuentraDescripcion ( dblcTarjeta , edtTarjeta ) ;
end;

procedure TFDetCancela1.dblcTarjetaExit(Sender: TObject);
begin
   DM1.xxExit (dblcTarjeta , edtTarjeta , [Z2bbtnCancelDet] , 'Tarjeta') ;
end;

procedure TFDetCancela1.dblcTDiarioEnter(Sender: TObject);
begin
    strTmp := dblcTDiario.text ;
end;

procedure TFDetCancela1.dbeNoCompExit(Sender: TObject);
var
   xWhere : string ;
begin

   dbeNoComp.text:=DM1.StrZero(dbeNoComp.text,DM1.cdsEgrCajaECNOCOMP.DisplayWidth);
   xWhere :=   '     CIAID    =' + ''''    + xDat.CIAID           +  ''''
             + ' AND TDIARID  ='''  + dblcTDiario.Text + ''''
             + ' AND ECANOMM  ='''  + xDat.ECANOMM         + ''''
             + ' AND ECNOCOMP =''' + dbeNoComp.Text   + '''' ;

   if dm1.RecuperarDatos('CAJA302','*',xWhere) then
   begin
      ShowMessage('El Comprobante Ya Existe') ;
      dbeNOComp.setfocus ;
   end
   else
   begin
      //Recuperar Datos de la forma de cobranza
      with dm1.cdsDetFPago do
      begin
        Active := False ;
        params.ParamByName('CIAID').AsString    := ''  ;
        Params.ParamByName('TDIARID').AsString  := ''  ;
        params.ParamByName('ECANOMM').AsString  := ''  ;
        Params.ParamByName('ECNOCOMP').AsString := ''  ;
        Active := True ;
      end ;
   end ;

end;

procedure TFDetCancela1.chkAsignaRestoClick(Sender: TObject);
begin
  if chkAsignaResto.Checked then
  begin
      dbeRecibido.Enabled  := False ;
      dbeACobrar.Enabled   := False ;
      dbeADevolver.Enabled := False ;
      if dblcTMonC.Text = dm1.wTMonLoc then
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

procedure TFDetCancela1.Z2bbtnCalcClick(Sender: TObject);
begin
     WinExec('C:\windows\calc.exe',1);  //Activa la calculadora del Windows
end;

procedure TFDetCancela1.ValidacionGrid;
var
   ctrl : TWinControl ;
begin
    if self.ActiveControl <> nil then
       if ((pnlCabecera1.Enabled) and ( Self.ActiveControl.Parent = pnlCabecera1 )) or
          ( gbxPago.Enabled ) and ( Self.ActiveControl.Parent = gbxPago ) then
       begin
          ctrl := Self.ActiveControl ;
          dbgDetFPago.Setfocus ;
          if dbgDetFPago <> Self.ActiveControl then
          begin
             Raise Exception.Create('') ;
          end ;
       end ;

    if dbdtpFCanc.date = 0 then
    begin
       ShowMessage('Ingrese Fecha de Cancelación') ;
       dbdtpFCanc.SetFocus ;
       Raise Exception.Create('') ;
    end ;

end;

procedure TFDetCancela1.dbdtpFCancExit(Sender: TObject);
var
   xWhere : string ;
begin
{comentado hasta especificación coherente
    if ( dbdtpFCanc.Date = 0 ) then
    begin
       ShowMessage('Ingrese Fecha') ;
       dbdtpFCanc.SetFocus ;
    end
    else
    begin
       xWhere := 'FECHA = DATE(''' + FechaDB2( dbdtpFCanc.Date ) + ''')';
       if dm1.RecuperarDatos( 'TGE107','*',xWhere ) then
          xTC := dm1.cdsREc.fieldbyname( dm1.wTCVenta ).AsFloat ;
    end ;
}
end;

procedure TFDetCancela1.dblcFormPagoEnter(Sender: TObject);
begin
    strTmp := dblcFormPago.text ;
end;

procedure TFDetCancela1.z2bbtnNuevoClick(Sender: TObject);
begin
//   prueba
//   dblcFormpago.setfocus ;
     if dm1.cdsDetFPago.State in [dsedit,dsinsert] then
     begin
         if MessageDlg(' Añadir Cancelará los Cambios Actuales'+ #13 +
                       '     ¿ Desea Continuar ?     ',mtConfirmation,[mbYes, mbNo],0) = mrNo then
            exit ;
     end ;
     dm1.cdsDetFPago.Cancel ;
     Copia( Acum,AcumBCK ) ;
     BlanqueaEdits(pnlFPago) ;
     Inserta ;
end;

procedure TFDetCancela1.AdicFPago;
begin
  //Deshabilitar resto de paneles
  try
    ValidacionGrid
  except
    Exit ;
  end ;
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

procedure TFDetCancela1.EditFPago ;
begin
  LevantaPnlDetalle ;
//  CalculoMontos
  AcumEnEdit ;
  LLenaEdits ;
  dm1.cdsDetFPago.edit ;
end ;

procedure TFDetCancela1.LevantaPnlDetalle;
begin

  DeshabilitaPaneles ;
  PnlFpago.Bringtofront ;
  BlanqueaEdits(pnlFPago) ;  
  PnlFpago.Visible := True ;
  PnlFpago.setfocus ;
  perform(CM_DialogKey,VK_TAB,0) ;
  
end;

procedure TFDetCancela1.dbgDetFPagoDblClick(Sender: TObject);
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

procedure TFDetCancela1.FormShow(Sender: TObject);
begin
    xOrden := 0 ;
    //Establecimiento del foco inicial
    if pnlCabecera1.Enabled then
       pnlCabecera1.setfocus
    else
       if pnlDetalle.Enabled then
          pnlDetalle.SetFocus
       else if pnlBotones.enabled then
                pnlBotones.SetFocus
            else
               Exit ;

    perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFDetCancela1.RecibirDatos (Datos : TDatosCancelacion ) ;
begin

     xDat := Datos ;
     Configura ;
     
end;

procedure TFDetCancela1.dbgDetFPagoEnter(Sender: TObject);
begin
    if dbgDetFPago.DataSource.DataSet.RecordCount = 0 then
    begin
       AdicFPago ;
    end ;
end;

procedure TFDetCancela1.dbeLoteExit(Sender: TObject);
begin
    dbeLote.text:=DM1.StrZero( dbeLote.text,4 );
end;

procedure TFDetCancela1.Z2OkDetalleClick(Sender: TObject);
begin
   ValidacionDatos ;
   ValidacionTjaChq ;
   ValidacionCobradoTotal ;
   GrabaDetalle ;
   ActualizaAcumulados ;
   dm1.cdsDetFPago.edit ;
end;

procedure TFDetCancela1.ValidacionCobradoTotal;
var
   xMonto : string ;
begin
   if chkAsignaResto.Checked then
      Exit ;

   if dblcTMonC.Text = dm1.wTMonLoc then
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

procedure TFDetCancela1.ValidacionTjaChq;
begin
    if dblcFormPago.Text = dm1.wEFECTIVO then
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

    if dblcFormPago.Text = dm1.wTARJETA then
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

procedure TFDetCancela1.dbeCancEXTChange(Sender: TObject);
begin
   if ( trim(dbeImpEXT.Text) <> '' ) and ( trim(dbeCancEXT.text) <>'' ) then
    dbeDifExt.Text := currtostr(strtocurr(dbeImpEXT.Text) - strtocurr(dbeCancEXT.text)) ;
end;

procedure TFDetCancela1.dbeCancLOCChange(Sender: TObject);
begin
   if ( trim(dbeImpLOC.Text) <> '' ) and ( trim(dbeCancLOC.text) <>'' ) then
    dbeDifLoc.Text := currtostr(strtocurr(dbeImpLoc.Text) - strtocurr(dbeCancLoc.text)) ;
end;


procedure TFDetCancela1.GrabaDetalle;
begin
    with dm1.cdsDetFPago do
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
end;

procedure TFDetCancela1.LLenaEdits;
begin
    with dm1.cdsDetFPago do
    begin
        dblcFormPago.text := dm1.FieldNoNUlo(FieldByName('FPAGOID'))      ;
        dblcBanco.text    := dm1.FieldNoNUlo(FieldByName('BANCOID'))      ;
        dblcTarjeta.text  := dm1.FieldNoNUlo(FieldByName('TJAID'))        ;
        dblcTMOnC.Text    := dm1.FieldNoNUlo(FieldByName('TMONID'))       ;
        dbeNOChq.Text     := dm1.FieldNoNUlo(FieldByName('ECNOCHQ'))      ;
        dbeRecibido.text  := dm1.FieldNoNUlo(FieldByName('FC_RECIBIDO'))  ;
        dbeaCobrar.text   := dm1.FieldNoNUlo(FieldByName('FC_COBRADO'))   ;
        dbeADevolver.Text := dm1.FieldNoNUlo(FieldByName('FC_DEVOLVER'))  ;
        //Llenado de LookUps
        edtFormPago.text  := dm1.cdsDetFPagoLK_FORMAPAGO.AsString ;
        edtBanco.text     := dm1.cdsDetFPagoLK_BANCO.AsString     ;
        edtTarjeta.text   := dm1.cdsDetFPagoLK_TARJETA.AsString   ;
        edtTMOnC.Text     := dm1.cdsDetFPagoLK_MONEDA.AsString    ;
    end ;
    dbeRecibido.Enabled  := True ;
    dbeACobrar.Enabled   := True ;
    dbeAdevolver.Enabled := True ;
    Z2bbtnNuevo.Visible := False ;
{   probable codigo a usar en caso no funcione el codigo de enabled
    if dblcFormPago.text = dm1.wEFECTIVO then
    begin

    end
    else if dblcFormPago.text = dm1.wCHEQUE then
         begin

         end
         else
         begin

         end ;
}         
end;

procedure TFDetCancela1.AcumEnEdit;
begin
  Copia(AcumBCK,Acum) ;
  with Acum do
  begin
   if dm1.cdsDetFPago.FieldByName('TMONID').AsString = dm1.wTMonLoc then
   begin
     SOLES    :=  Redondea( SOLES - dm1.cdsDetFPago.FieldByName('FC_COBRADO').AsCurrency ) ;
     DEVSOLES := Redondea( DEVSOLES - dm1.cdsDetFPago.FieldByName('FC_DEVOLVER').AsCurrency ) ;
     if ( dm1.cdsDetFPago.FieldByName('FPAGOID').AsString = dm1.wCHEQUE ) or
        ( dm1.cdsDetFPago.FieldByName('FPAGOID').AsString = dm1.wTARJETA ) then
     begin
        CHQTJASOLES  :=  CHQTJASOLES - Redondea( dm1.cdsDetFPago.FieldByName('FC_COBRADO').AsCurrency );
     end ;
   end
   else
   begin
     DOLARES  :=  Redondea( DOLARES - dm1.cdsDetFPago.FieldByName('FC_COBRADO').AsCurrency ) ;
     DEVDOLARES := Redondea( DEVDOLARES - dm1.cdsDetFPago.FieldByName('FC_DEVOLVER').AsCurrency ) ;
     if ( dm1.cdsDetFPago.FieldByName('FPAGOID').AsString = dm1.wCHEQUE ) or
        ( dm1.cdsDetFPago.FieldByName('FPAGOID').AsString = dm1.wTARJETA ) then
     begin
        CHQTJADOLARES  :=  CHQTJADOLARES - Redondea( dm1.cdsDetFPago.FieldByName('FC_COBRADO').AsCurrency ) ;
     end ;
   end ;

   COBRADOSOLES     :=  SOLES + REDONDEA(( DOLARES * xTC )) ;
   COBRADODOLARES   :=  DOLARES + redondea(( SOLES / xTC )) ;
  end ;
end;

procedure TFDetCancela1.ActualizaAcumulados;
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

procedure TFDetCancela1.AcumEnSave;
begin
  with Acum do
  begin
   if dm1.cdsDetFPago.FieldByName('TMONID').AsString = dm1.wTMonLoc then
   begin
     SOLES    :=  SOLES + redondea(dm1.cdsDetFPago.FieldByName('FC_COBRADO').AsCurrency) ;
     DEVSOLES := DEVSOLES + redondea(dm1.cdsDetFPago.FieldByName('FC_DEVOLVER').AsCurrency ) ;
     if ( dm1.cdsDetFPago.FieldByName('FPAGOID').AsString = dm1.wCHEQUE ) or
        ( dm1.cdsDetFPago.FieldByName('FPAGOID').AsString = dm1.wTARJETA ) then
     begin
        CHQTJASOLES  :=  CHQTJASOLES + redondea(dm1.cdsDetFPago.FieldByName('FC_COBRADO').AsCurrency) ;
     end ;
   end
   else
   begin
     DOLARES  :=  DOLARES + redondea(dm1.cdsDetFPago.FieldByName('FC_COBRADO').AsCurrency) ;
     DEVDOLARES := DEVDOLARES + redondea(dm1.cdsDetFPago.FieldByName('FC_DEVOLVER').AsCurrency) ;
     if ( dm1.cdsDetFPago.FieldByName('FPAGOID').AsString = dm1.wCHEQUE ) or
        ( dm1.cdsDetFPago.FieldByName('FPAGOID').AsString = dm1.wTARJETA ) then
     begin
        CHQTJADOLARES  :=  CHQTJADOLARES + redondea( dm1.cdsDetFPago.FieldByName('FC_COBRADO').AsCurrency ) ;
     end ;
   end ;

   COBRADOSOLES     :=  SOLES + Redondea(( DOLARES * xTC )) ;
   COBRADODOLARES   :=  DOLARES + redondea(( SOLES / xTC )) ;
  end ;
  copia(AcumBCK,Acum) ;
end ;

procedure TFDetCancela1.Copia(var Acum1 , Acum2 : TAcumulados);
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

procedure TFDetCancela1.Inserta;
begin
  with dm1.cdsDetFPago do
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

procedure TFDetCancela1.dbeRecibidoEnter(Sender: TObject);
begin
   strTmp := dbeRecibido.Text ;
end;

procedure TFDetCancela1.dbeACobrarEnter(Sender: TObject);
begin
   strTmp := dbeACobrar.Text ;
end;

procedure TFDetCancela1.dbeADevolverEnter(Sender: TObject);
begin
   strTmp := dbeADevolver.Text ;
end;

procedure TFDetCancela1.dbeRecibidoExit(Sender: TObject);
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

procedure TFDetCancela1.dbeACobrarExit(Sender: TObject);
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

procedure TFDetCancela1.dbeADevolverExit(Sender: TObject);
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

procedure TFDetCancela1.dbeRecibidoKeyPress(Sender: TObject; var Key: Char);
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

procedure TFDetCancela1.dbeRecibidoChange(Sender: TObject);
begin
    dbeACobrar.Enabled := True ;
    dbeAdevolver.Enabled := True ;
end;

procedure TFDetCancela1.bbtnOKClick(Sender: TObject);
begin
    Valida ;
end;

procedure TFDetCancela1.Valida;
begin
  if pnlCabecera1.Enabled then
  begin
     ValidaCab        ;
     ValidaComp       ;
  end ;
  ValidaCancelacion   ;
end;

procedure TFDetCancela1.ValidaCab;
var
  i : Integer ;
begin
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

procedure TFDetCancela1.ValidaCancelacion;
begin
    if cajadec(dbedifext.text) <> blanco then
    begin
       Raise Exception.create('Aún no se ha Cancelado el Movimiento') ;
    end ;
end;

procedure TFDetCancela1.ValidaComp;
var
 xWhere : string ;
begin
   xWhere :=   '     CIAID    =' + ''''    + xDat.CIAID           +  ''''
             + ' AND TDIARID  ='''  + dblcTDiario.Text + ''''
             + ' AND ECANOMM  ='''  + xDat.ECANOMM         + ''''
             + ' AND ECNOCOMP =''' + dbeNoComp.Text   + '''' ;

   if dm1.RecuperarDatos('CAJA302','*',xWhere) then
   begin
      dbeNOComp.setfocus ;
      Raise exception.create('El Comprobante Ya Existe') ;
   end
end;

procedure TFDetCancela1.PonMensajeEnTag;
var
  i : Integer ;
  ctrl : TComponent ;
begin
{
   for i := 0 to 7 do
   begin
       ctrl := pnlCabecera1.FindComponent(mensajes[i,0]);
       if ctrl = nil then
          TCustomEdit(gbxPago.FindComponent(mensajes[i,0])).Tag := i
       else
          TCustomEdit(ctrl).Tag := i
   end;
}
end;

procedure TFDetCancela1.Z2bbtnContabClick(Sender: TObject);
begin
     if MessageDlg('¿Contabilizar y Generar Asientos Automaticos?',mtConfirmation,
                  [mbYes, mbNo], 0)=mrYes then
     begin
       screen.Cursor := crHourGlass ;
       RecCptosDifC ;
       Contabiliza;             // Realiza la generacion del Asiento
       dm1.GeneraContabilidad (xDat.CIAID ,dblctdiario.Text , edtperiodo.Text , dbeNoComp.Text) ;
       DM1.cdsEgrCaja.Edit;
       DM1.cdsEgrCajaECConta.Value:='S';   //Establece como Contabilizado el flag
       DM1.cdsEgrCaja.ApplyUpdates(0);
       lblEstado.Caption := 'Cancelado y Contab.' ;
       Z2bbtnContab.Enabled := False ;
       Z2bbtnImprimir.Enabled := True ;
       screen.Cursor := crDefault ;
     end ;
end;

function TFDetCancela1.EncIndex(xSTR: String) : integer;
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

procedure TFDetCancela1.ValidacionDatos;
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

procedure TFDetCancela1.Configura;
begin
///
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
     edtPeriodo.text := xDat.ECANOMM ;
     
     if xDat.ECNOCOMP = '' then
     begin
        pnlCabecera1.enabled := True ;
        gbxPago.Enabled := True ;
     end
     else
     begin
        pnlCabecera1.enabled := False ;
        gbxPago.Enabled := False ;
        dblcTDiario.text := xDat.TDIARID ;
        edtTDiario.text := xDat.TDIARDES ;
        dbeNOComp.text := xDat.ECNOCOMP  ;
        dbeLOte.text := xdat.ECLOTE ;
        dblcdCnp.text := xDat.CPTOID ;
        dbeGlosa.text := xDat.ECGLOSA ;
     end ;

     //LLenado de los Montos
     if xDat.TMONID = dm1.wTMonLoc then
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

///
end;

function TFDetCancela1.FinalizadoOK: Boolean;
begin
    Result := xOK ;
end;

procedure TFDetCancela1.Z2bbtnCancelClick(Sender: TObject);
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
          
         dm1.cdsDetFPago.CancelUpdates ;
       end ;
       Close ;
    end
    else
    begin
       Close ;
    end ;
end;

procedure TFDetCancela1.Z2bbtnOKClick(Sender: TObject);
Var
   xWhere , aux , xModo , xSQL :string;
begin
   validaGrabacion ;
   if pnlCabecera1.Enabled then
      xModo := 'A'
   else
      xModo := 'E'  ;

   with DM1 do
   begin
      if xModo = 'A' then
      begin
         cdsEgrCaja.Active := False ;
         cdsEgrCaja.Params.ParamByName('CIAID').AsString    := xDat.CIAID ;
         cdsEgrCaja.Params.ParamByName('ECANOMM').AsString  := edtPeriodo.Text ;
         cdsEgrCaja.Params.ParamByName('TDIARID').AsString  := dblcTDiario.Text ;
         cdsEgrCaja.Params.ParamByName('ECNOCOMP').AsString := dbeNoComp.text ;
         cdsEgrCaja.Active := True ;
         cdsEgrCaja.Insert ;

         cdsEgrCajaCIAID.AsString       := xDat.CIAID     ;
         cdsEgrCajaTDIARID.AsString     := dblcTDiario.Text   ;
         cdsEgrCajaECANOMM.AsString     := edtPeriodo.Text   ;
         cdsEgrCajaECNOCOMP.AsString    := dbeNoComp.Text ;
//
         cdsEgrCajaECOPAGO.Value        := xDat.ECOPAGO ;
         cdsEgrCajaCLAUXID.Value        := xDat.CLAUXID ;
         cdsEgrCajaPROV.Value           := xDat.PROV ;
         cdsEgrCajaPROVRUC.Value        := xDat.PROVRUC ;
//
         cdsEgrCajaECFCOMP.Value     := dbdtpFCanc.Date;
         cdsEgrCajaDOCID.Value       := dblcTDoc.Text  ;
         cdsEgrCajaECNODOC.Value     := dbeNoDoc.Text  ;
         cdsEgrCajaTMONID.Value      := dblcTMon.Text  ;
         cdsEgrCajaECTCAMB.AsString  := dbeTCamb.Text  ;
         cdsEgrCajaECMTOORI.AsString := xDat.ECMTOORI  ;
         if cdsEgrCajaTMONID.Value = wTMonLoc then
         begin
            cdsEgrCajaECMTOLOC.Value := strtofloat(xDat.ECMTOORI) ;
            cdsEgrCajaECMTOEXT.Value := strtofloat(xDat.ECMTOORI)/strtofloat(dbeTCamb.Text) ;
         end
         else
         begin
            cdsEgrCajaECMTOLOC.Value := strtofloat(xDat.ECMTOORI) * StrToFloat(dbeTCamb.Text) ;
            cdsEgrCajaECMTOEXT.Value := strtofloat(xDat.ECMTOORI) ;
         end ;
         cdsEgrCajaCPTOID.Value  :=dblcdCnp.Text ;
         cdsEgrCajaECGLOSA.Value :=dbeGlosa.Text ;
         cdsEgrCajaECLOTE.Value  :=dbeLote.Text ;
         cdsEgrCajaECESTADO.Value :='I' ;
         xWhere:='FECHA=DATE(''' + formatdatetime('yyyy-mm-dd',dbdtpFCanc.Date)+''')' ;
         aux   :=DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO') ;
         cdsEgrCajaECANO.Value    := cdsqry.FieldByName('FecAno').Value ;
         cdsEgrCajaECMM.Value     := cdsqry.FieldByName('FecMes').Value ;
         cdsEgrCajaECDD.Value     := cdsqry.FieldByName('FecDia').Value ;
         cdsEgrCajaECSS.Value     := cdsqry.FieldByName('FecSS').Value  ;
         cdsEgrCajaECSEM.Value    := cdsqry.FieldByName('FecSem').Value ;
         cdsEgrCajaECTRI.Value    := cdsqry.FieldByName('FecTrim').Value ;
         cdsEgrCajaECAASS.Value   := cdsqry.FieldByName('FecAASS').Value ;
         cdsEgrCajaECAASem.Value  := cdsqry.FieldByName('FecAASem').Value ;
         cdsEgrCajaECAATri.Value  := cdsqry.FieldByName('FecAATri').Value ;
         cdsEgrCajaEC_PROCE.Value := '6' ;
         cdsEgrCajaEC_IE.Value    := 'I' ;
         //Datos Adicionales
         cdsEgrCaja.FieldByName('ECCOBLOC').ASString := dbeCobLOc.Text ;
         cdsEgrCaja.FieldByName('ECCOBEXT').ASString := dbeCobExt.text ;
         cdsEgrCaja.FieldByName('ECDEVLOC').AsString := dbeDevLoc.Text ;
         cdsEgrCaja.FieldByName('ECDEVEXT').AsString := dbeDevExt.Text ;
         //Fin de Datos Adicionales
      end
      else
      begin
         dm1.cdsEgrCaja.Edit ;
      end ;
///////////////
   end;
   GrabarDetalle ;
   ActualizaSaldos ;
   DM1.cdsEgrCajaECEstado.AsString := 'C' ;
   DM1.cdsEgrCaja.Post ;

   if ( DM1.cdsEgrCaja.ApplyUpdates(0) > 0) then
   begin
      ShowMessage('La Grabación No se ha realizado correctamente') ;
   end
   else
      DM1.cdsEgrCaja.Refresh ;

   xWhere := ' WHERE CIAID = ''' + xDat.CIAID + ''' AND NOTACOB = ''' + xDat.ECOPAGO + '''' ;
   xSQL := 'UPDATE CXC303 SET NCOESTADO = ''C'' ' + xWhere ;
   dm1.DCOM1.AppServer.EjecutaSQL(xSQL) ;
{
   DM1.cdsCobraCxC.Edit ;
   DM1.cdsCobraCxCNCOESTADO.Value := 'C' ;  //Lo marco como Cancelado
   DM1.cdsCobraCxC.ApplyUpdates(0) ;
}
   lblEstado.Caption    :='Cancelado          ' ;
////

   xOK := True ;
   gbxPago.Enabled      := False ;
   pnlCabecera1.Enabled := False ;

   Z2bbtnOK.Enabled     := False ;
   Z2bbtnContab.Enabled := True  ;

end;

procedure TFDetCancela1.ActualizaSaldos ;
var
   xFiltro,xWhere : string ;
begin
   //Aqui recupera los movimientos de cxc
///////////////////////////////////////////////////////////////////
{
   xWhere := ' CIAID||CCANOMES||TDIARID||CCNOREG IN ' +
             '                   ( SELECT CIAID||CCANOMM||TDIARID||CCNOREG         ' +
             '                     FROM CXC304                                      ' +
             '                     WHERE CIAID = '''+ xDat.CIAID + '''            ' +
             '                           AND TCANJEID = ''OC''                      ' +
             '                           AND CCCANJE = '''+ xDat.ECOPAGO + ''' ) ' ;
   DM1.cdsMovCxC.Active := False ;
   DM1.cdsMovCxC.CommandText := 'SELECT * FROM CXC301 WHERE ' + xWhere ;
   DM1.cdsMovCxC.Active := True ;
}
///////////////////////////////////////////////////////////////////

   DM1.cdsMovCxC.Filtered := False ;
//****************************ini
         //QUITAFLAG
         DM1.DCOM1.AppServer.SetFlagCobranza('', '', '0') ;
         //PONFLAG
         DM1.DCOM1.AppServer.SetFlagCobranza(xDat.CIAID, xDat.ECOPAGO , '1') ;
         DM1.cdsMovCxC.active := False ;
         xWhere := 'FLAGVAR2 = ''X'' ' ;
         DM1.cdsMovCxC.CommandText := 'SELECT * FROM CXC301 WHERE ' + xWhere ;
         DM1.cdsMovCxC.Active := True ;
         if DM1.cdsMovCxC.RecordCount = 0 then
         begin
            ShowMessage('Mensaje para WMC : ERROR en la Recuperación de MOV')
         end ;
//****************************fin

   DM1.cdsCanjeCxC.DisableControls;
   DM1.cdsCanjeCxC.First;
   While not DM1.cdsCanjeCxC.Eof do
   Begin
   if DM1.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
                           VarArrayOf([
                                        DM1.cdsCanjeCxCCiaId.AsString,
                                        DM1.cdsCanjeCxCTDiarID.AsString,
                                        DM1.cdsCanjeCxCCCAnoMM.AsString,
                                        DM1.cdsCanjeCxCCCNoReg.AsString
                                      ]),[]) then
      begin
         DM1.cdsMovCxC.edit;
         If DM1.cdsMovCxCTMonID.Value=DM1.wTMonLoc then
         begin
            DM1.cdsMovCxCCCPagLoc.Value:=DM1.FRound( DM1.cdsMovCxCCCPagLoc.Value + DM1.cdsCanjeCxCCCMToLoc.Value,15,2 ) ;
            DM1.cdsMovCxCCCPagExt.Value:=DM1.FRound( DM1.cdsMovCxCCCPagLoc.Value / DM1.cdsCanjeCxCCCTCAMCje.Value,15,2 ) ;
            If DM1.cdsMovCxCCCSalLoc.Value <= 0 then
               DM1.cdsMovCxCCCEstado.Value := 'C';
            end
         else
         begin
            DM1.cdsMovCxCCCPagExt.Value := DM1.FRound( DM1.cdsMovCxCCCPagExt.Value+DM1.cdsCanjeCxCCCMToExt.Value,15,2 ) ;
            DM1.cdsMovCxCCCPagLoc.Value := DM1.FRound( DM1.cdsMovCxCCCPagExt.Value*DM1.cdsCanjeCxCCCTCAMCje.Value,15,2 ) ;
            If DM1.cdsMovCxCCCSalExt.Value <= 0 then
               DM1.cdsMovCxCCCEstado.Value := 'C';
         end;
         DM1.cdsMovCxCCCTCamPa.Value := DM1.FRound( DM1.cdsCanjeCxCCCTCAMCje.Value,15,2 ) ;
         DM1.cdsMovCxC.post ;
      end;
      DM1.cdsCanjeCxC.Next ;
   end;
   DM1.cdsMovCxC.First ;
   DM1.cdsCanjeCxC.EnableControls ;

   // Actualizacion..
   //0405 Recuperación de datos de la nota de cobranza
   dm1.cdsdetcanjecxc.Active := False ;
   dm1.cdsdetCanjeCxC.Params.ParamByName('CIAID').AsString   := xDat.CIAID ;
   dm1.cdsdetCanjeCxC.Params.ParamByName('CCCANJE').AsString := xDat.ECOPAGO ;
   dm1.cdsdetcanjecxc.Active := True ;
   DM1.cdsDetCanjeCxC.First;
   While (not DM1.cdsDetCanjeCxC.Eof)and(DM1.cdsDetCanjeCxC.RecordCount>0) do
      DM1.cdsDetCanjeCxC.Delete;

   DM1.cdsCanjeCxC.DisableControls;
   DM1.cdsCanjeCxC.First;
   While not DM1.cdsCanjeCxC.Eof do
   begin
      DM1.cdsDetCanjeCxC.Insert;
      DM1.cdsDetCanjeCxCCiaID.Value    := DM1.cdsCanjeCxCCiaID.Value;
      DM1.cdsDetCanjeCxCClieID.Value   := DM1.cdsCanjeCxCClieID.Value;
      DM1.cdsDetCanjeCxCClieRuc.Value  := DM1.cdsCanjeCxCClieRuc.Value;
      DM1.cdsDetCanjeCxCDocID.Value    := DM1.cdsCanjeCxCDocID.Value;
      DM1.cdsDetCanjeCxCCCSerie.Value  := DM1.cdsCanjeCxCCCSerie.Value;
      DM1.cdsDetCanjeCxCCCNoDoc.Value  := DM1.cdsCanjeCxCCCNoDoc.Value;
      DM1.cdsDetCanjeCxCCCNoReg.Value  := DM1.cdsCanjeCxCCCNoReg.Value;
      DM1.cdsDetCanjeCxCTCanjeID.Value := DM1.cdsCanjeCxCTCanjeID.Value;
      DM1.cdsDetCanjeCxCCCCanje.Value  := DM1.cdsCanjeCxCCCCanje.Value;
      DM1.cdsDetCanjeCxCCCFCanje.Value := DM1.cdsCanjeCxCCCFCanje.Value;
      DM1.cdsDetCanjeCxCDocID2.Value   := '99';  // Provisional
      DM1.cdsDetCanjeCxCCCSerie2.Value := '000';
      DM1.cdsDetCanjeCxCCCNoDoc2.Value := xDat.ECOPAGO ;
      DM1.cdsDetCanjeCxCTMonID.Value   := DM1.cdsCanjeCxCTMonID.Value;

      If DM1.cdsCanjeCxCTMonID.Value=DM1.wTMonLoc then
      begin
         DM1.cdsDetCanjeCxCDCCMtoLoc.Value := DM1.FRound(DM1.cdsCanjeCxCCCMtoLoc.Value,15,2);
         DM1.cdsDetCanjeCxCDCCMtoExt.Value := DM1.FRound(DM1.cdsCanjeCxCCCMtoLoc.Value/DM1.cdsCanjeCxCCCTCamDoc.Value,15,2);
         end
      else
      begin
         DM1.cdsDetCanjeCxCDCCMtoExt.Value := DM1.FRound(DM1.cdsCanjeCxCCCMtoExt.Value,15,2);
         DM1.cdsDetCanjeCxCDCCMtoLoc.Value := DM1.FRound(DM1.cdsCanjeCxCCCMtoExt.Value*DM1.cdsCanjeCxCCCTCamDoc.Value,15,2);
      end;

      DM1.cdsDetCanjeCxCDCCUser.Value  := DM1.cdsCanjeCxCCCUser.Value;
      DM1.cdsDetCanjeCxCDCCFReg.Value  := DM1.cdsCanjeCxCCCFReg.Value;
      DM1.cdsDetCanjeCxCDCCHReg.Value  := DM1.cdsCanjeCxCCCHReg.Value;
      DM1.cdsDetCanjeCxCDCCAAAA.Value  := DM1.cdsCanjeCxCCCAAAA.Value;
      DM1.cdsDetCanjeCxCDCCMM.Value    := DM1.cdsCanjeCxCCCMM.Value;
      DM1.cdsDetCanjeCxCDCCDD.Value    := DM1.cdsCanjeCxCCCDD.Value;
      DM1.cdsDetCanjeCxCDCCTri.Value   := DM1.cdsCanjeCxCCCTri.Value;
      DM1.cdsDetCanjeCxCDCCSem.Value   := DM1.cdsCanjeCxCCCSem.Value;
      DM1.cdsDetCanjeCxCDCCSS.Value    := DM1.cdsCanjeCxCCCSS.Value;
      DM1.cdsDetCanjeCxCDCCAnoMM.Value := DM1.cdsCanjeCxCCCAnoMM.Value;
      DM1.cdsDetCanjeCxCDCCAATri.Value := DM1.cdsCanjeCxCCCAATri.Value;
      DM1.cdsDetCanjeCxCDCCAASem.Value := DM1.cdsCanjeCxCCCAASem.Value;
      DM1.cdsDetCanjeCxCDCCAASS.Value  := DM1.cdsCanjeCxCCCAASS.Value;
      DM1.cdsCanjeCxC.Next;
   end;
   DM1.cdsDetCanjeCxC.First;
   DM1.cdsCanjeCxC.First;
   DM1.cdsCanjeCxC.EnableControls;

   DM1.cdsDetCanjeCxC.ApplyUpdates(0);
   DM1.cdsMovCxC.ApplyUpdates(0);
   DM1.cdsMovCxC.Filtered := True ;
{
   /////////////wmci
      xFiltro := 'CIAID ='   + '''' + xDat.CIAID  + '''' + ' AND ' +
                 'CLIEID ='  + '''' + xDat.PROV + '''' + ' AND CCSALLOC>0 AND ' +
                 '(CCCANJE <> ' + '''' + xDat.ECOPAGO  +'''' + ' OR CCCANJE IS NULL) '+
                 ' AND CCESTADO=' + '''' + 'P' + '''' ; //+

   //0805Recuperación de datos del servidor
      xWhere := '(' + xFiltro + ')' + ' OR ( CCCANJE = ''' + xDat.ECOPAGO + ''' ) ' +
                ' ORDER BY CLIEID , DOCID , CCFEMIS ' ;

      dm1.cdsMovCxC.active      := False ;
      dm1.cdsMovCxC.CommandText := 'SELECT * FROM CXC301 WHERE ' + xWhere ;
      dm1.cdsMovCxC.Active      := True ;

      dm1.cdsMovCxC.Filter      := xFiltro ;
      dm1.cdsMovCxC.Filtered    := True;
   /////////////wmcf
}
end;

procedure TFDetCancela1.Contabiliza;
var xRegAct : TBookMark;
begin
    // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera
    dm1.cdsCNTCaja.Active := False ;
    dm1.cdsCNTCaja.Params.ParamByName('CIAID').AsString := '' ;
    dm1.cdsCNTCaja.Params.ParamByName('ECANOMM').AsString := '' ;
    dm1.cdsCNTCaja.Params.ParamByName('TDIARID').AsString := '' ;
    dm1.cdsCNTCaja.Params.ParamByName('ECNOCOMP').AsString := '' ;
    dm1.cdsCNTCaja.Active := True ;
    DM1.cdsCntCaja.Insert;
    Contab_EgrCaja;
    // GENERA LOS REGISTROS DE "DEBE" Y LOS REGISTROS POR DIF. DE CAMBIO desde Docs Canje
    dm1.cdsCanjeCxC.DisableControls;
    xRegAct := dm1.cdsCanjeCxC.GetBookmark;
    dm1.cdsCanjeCxC.First ;
    While not dm1.cdsCanjeCxC.Eof do
    Begin
       DM1.cdsCntCaja.Insert;
       Contab_CanjeCxC;         // Aqui hay solo DEBE
       Contab_DifCamCanje;
       dm1.cdsCanjeCxC.Next;
    end;
    dm1.cdsCanjeCxC.GotoBookmark(xRegAct);
    dm1.cdsCanjeCxC.FreeBookmark(xRegAct);
    dm1.cdsCanjeCxC.EnableControls;

    //Actualizamos en la tabla de Contabilidad
    DM1.cdsCntCaja.ApplyUpdates(0);
end;

procedure TFDetCancela1.Contab_EgrCaja;
begin
    dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsEgrcajaCIAID.Value;
    dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsEgrCajaTDIARID.Value;
    dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsEgrCajaECANOMM.Value;
    dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsEgrCajaECNOCOMP.Value;
    dm1.cdsCntCajaDCLOTE.Value  :=  dm1.cdsEgrCajaECLOTE.Value;
    dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsEgrCajaDOCID.Value;
    dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsEgrCajaECNODOC.Value;
    dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsEgrCajaECFCOMP.Value;
    dm1.cdsCntCajaCPTOID.Value  :=  dm1.cdsEgrCajaCPTOID.Value;
    dm1.cdsCntCajaCUENTAID.Value:=  dm1.cdsEgrCajaCUENTAID.Value;
    dm1.cdsCntCajaDCDH.Value    :=  'H';
    dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsEgrCajaECTCAMB.Value;
    dm1.cdsCntCajaTMONID.Value  :=  dm1.cdsEgrCajaTMONID.Value;
    dm1.cdsCntCajaDCMTOORI.Value:=  dm1.cdsEgrCajaECMTOORI.Value;
    dm1.cdsCntCajaDCMTOLO.Value :=  dm1.cdsEgrCajaECMTOLOC.Value;
    dm1.cdsCntCajaDCMTOEXT.Value:=  dm1.cdsEgrCajaECMTOEXT.Value;
    dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
    dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsEgrCajaECANO.Value;
    dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsEgrCajaECMM.Value;
    dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsEgrCajaECDD.Value;
    dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsEgrCajaECSS.Value;
    dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsEgrCajaECSEM.Value;
    dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsEgrCajaECTRI.Value;
    dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsEgrCajaECAASS.Value;
    dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsEgrCajaECAASEM.Value;
    dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsEgrCajaECAATRI.Value;
    dm1.cdsCntCaja.FieldByName('FCAB').AsString := '1' ;
end;

procedure TFDetCancela1.Contab_CanjeCxC;
begin
    dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsEgrCajaCIAID.Value;
    dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsEgrCajaTDIARID.Value;
    dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsEgrCajaECANOMM.Value;
    dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsEgrCajaECNOCOMP.Value;
    dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsCanjeCxCDOCID.Value;
    dm1.cdsCntCajaDCSERIE.Value :=  dm1.cdsCanjeCxCCCSERIE.Value;
    dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsCanjeCxCCCNODOC.Value;
    dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsEgrCajaECFCOMP.Value;
    dm1.cdsCntCajaDCFVCMTO.Value:=  dm1.cdsCanjeCxCCCFVCMTO.Value;
    dm1.cdsCntCajaCPTOID.Value  :=  dm1.cdsCanjeCxCCPTOTOT.Value;
    dm1.cdsCntCajaCUENTAID.Value:=  dm1.cdsCanjeCxCCTATOTAL.Value;
    dm1.cdsCntCajaCLAUXID.Value :=  dm1.cdsEgrCajaCLAUXID.Value; //Aqui se toma de la cabecera
    dm1.cdsCntCajaDCAUXID.Value :=  dm1.cdsEgrCajaPROV.Value;    //Aqui se toma de la cabecera
    dm1.cdsCntCajaDCDH.Value    :=  'D';
    dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsCanjeCxCCCTCAMCJE.Value;
    dm1.cdsCntCajaDCTCAMPR.Value:=  dm1.cdsCanjeCxCCCTCAMDOC.Value;
    dm1.cdsCntCajaTMONID.Value  :=  dm1.cdsCanjeCxCTMONID.Value;
    dm1.cdsCntCajaDCMTOORI.Value:=  dm1.cdsCanjeCxCCCMTOORI.Value;
    if dm1.cdsCanjeCxCTMONID.Value = dm1.wtMonLoc then
    begin
       dm1.cdsCntCajaDCMTOLO.Value := dm1.cdsCanjeCxCCCMTOLOC.Value;
       dm1.cdsCntCajaDCMTOEXT.Value:= dm1.cdsCanjeCxCCCMTOLOC.Value / dm1.cdsCanjeCxCCCTCAMCJE.Value;
    end
    else
    begin
       dm1.cdsCntCajaDCMTOEXT.Value:= dm1.cdsCanjeCxCCCMTOEXT.Value;
       dm1.cdsCntCajaDCMTOLO.Value := dm1.cdsCanjeCxCCCMTOEXT.Value * dm1.cdsCanjeCxCCCTCAMCJE.Value;
    end;
    dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
    dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsCanjeCxCCCAAAA.Value;
    dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsCanjeCxCCCMM.Value;
    dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsCanjeCxCCCDD.Value;
    dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsCanjeCxCCCSS.Value;
    dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsCanjeCxCCCSEM.Value;
    dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsCanjeCxCCCTRI.Value;
    dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsCanjeCxCCCAASS.Value;
    dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsCanjeCxCCCAASEM.Value;
    dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsCanjeCxCCCAATRI.Value;

end;

procedure TFDetCancela1.Contab_DifCamCanje;
var
    xDif_Camb : real;
begin
    // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO

    if dm1.cdsCanjeCxCCCTCAMDOC.Value <> dm1.cdsCanjeCxCCCTCAMCJE.Value then
    begin

       DM1.cdsCntCaja.Insert;

       dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsEgrCajaCIAID.Value;
       dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsEgrCajaTDIARID.Value;
       dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsEgrCajaECANOMM.Value;
       dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsEgrCajaECNOCOMP.Value;
       dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsCanjeCxCDOCID.Value;
       dm1.cdsCntCajaDCSERIE.Value :=  dm1.cdsCanjeCxCCCSERIE.Value;
       dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsCanjeCxCCCNODOC.Value;
       dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsEgrCajaECFCOMP.Value;
       dm1.cdsCntCajaDCFEMIS.Value :=  dm1.cdsCanjeCxCCCFEMIS.Value;
       dm1.cdsCntCajaDCFVCMTO.Value:=  dm1.cdsCanjeCxCCCFVCMTO.Value;
       dm1.cdsCntCajaCPTOID.Value  :=  dm1.cdsCanjeCxCCPTOTOT.Value;
       dm1.cdsCntCajaCUENTAID.Value:=  dm1.cdsCanjeCxCCTATOTAL.Value;
       dm1.cdsCntCajaCLAUXID.Value :=  dm1.cdsEgrCajaCLAUXID.Value; //Aqui se toma de la cabecera
       dm1.cdsCntCajaDCAUXID.Value :=  dm1.cdsEgrCajaPROV.Value;    //Aqui se toma de la cabecera

       dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsCanjeCxCCCTCAMCJE.Value;
       dm1.cdsCntCajaDCTCAMPR.Value:=  dm1.cdsCanjeCxCCCTCAMDOC.Value;

       dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsCanjeCxCCCMM.Value;
       dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsCanjeCxCCCDD.Value;
       dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsCanjeCxCCCSS.Value;
       dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsCanjeCxCCCSEM.Value;
       dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsCanjeCxCCCTRI.Value;
       dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsCanjeCxCCCAASS.Value;
       dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsCanjeCxCCCAASEM.Value;
       dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsCanjeCxCCCAATRI.Value;
       dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
       dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsCanjeCxCCCAAAA.Value;
       if dm1.cdsCanjeCxCTMONID.Value=dm1.wtMonLoc then
       begin   //Provision en Mon.Local
             xDif_Camb:= abs(dm1.cdsCanjeCxCCCMTOLOC.Value / dm1.cdsCanjeCxCCCTCAMDOC.Value -
                             dm1.cdsCanjeCxCCCMTOLOC.Value / dm1.cdsCanjeCxCCCTCAMCJE.Value);//En Mon.Ext.
             dm1.cdsCntCajaDCMTOEXT.Value := xDif_Camb;
             dm1.cdsCntCajaTMONID.Value   :=  dm1.wtMonExt;

             if dm1.cdsCanjeCxCCCTCAMDOC.Value > dm1.cdsCanjeCxCCCTCAMCJE.Value then
                dm1.cdsCntCajaDCDH.Value := 'D'
             else
                dm1.cdsCntCajaDCDH.Value := 'H';
       end
       else
       begin                                            //Provision en Mon.Ext.
             xDif_Camb:= abs(dm1.cdsCanjeCxCCCMTOEXT.Value * dm1.cdsCanjeCxCCCTCAMDOC.Value -
                             dm1.cdsCanjeCxCCCMTOEXT.Value * dm1.cdsCanjeCxCCCTCAMCJE.Value);//En Mon.Local
             dm1.cdsCntCajaDCMTOLO.Value := xDif_Camb;
             dm1.cdsCntCajaTMONID.Value  := dm1.wtMonLoc;

             if dm1.cdsRegCxPDETCDOC.Value > dm1.cdsCanjeCxCCCTCAMCJE.Value then
                dm1.cdsCntCajaDCDH.Value := 'H'
             else
                dm1.cdsCntCajaDCDH.Value := 'D';
       end;
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

procedure TFDetCancela1.GrabarDetalle;
begin
  with dm1.cdsDetFPago do
  begin
    DisableControls ;
    First ;
    while not Eof do
    begin
        edit ;
        FieldBYname('CIAID').AsString    := xDat.CIAID ;
        FieldBYname('ECANOMM').AsString  := edtPeriodo.text ;
        FieldBYname('TDIARID').AsString  := dblcTDiario.Text ;
        FieldBYname('ECNOCOMP').AsString := dbeNoComp.Text ;
        Post ;
        Next ;
    end;
    ApplyUpdates(0) ;
    First ;
    EnableControls ;
  end ;
end;

function TFDetCancela1.MuestraCancelacion (xCIAID , xECOPAGO : String ):Boolean;
var
   xWhere : String ;
begin
      Result := False ;
      xWhere := 'ECOPAGO = '''+ xECOPAGO + ''' AND CIAID = ''' + xCIAID + '''' ;
      if dm1.RecuperarDatos('CAJA302','*',xWhere) then
      begin
         with dm1.cdsREc do
         begin
            xDat.CIAID      :=  FieldBYname('CIAID').AsString ;
            edtPeriodo.text :=  FieldBYname('ECANOMM').AsString ;
            dblcTDiario.text := FieldBYname('TDIARID').AsString ;
            dbeNOComp.text :=   FieldBYname('ECNOCOMP').AsString ;
            dblcTMon.Text :=    FieldBYname('TMONID').AsString ;
            dbdtpFCanc.Text :=  FieldBYname('ECFCOMP').AsString ;
            dbeTCamb.Text :=    FieldBYname('ECTCAMB').AsString ;
            dbeLOte.text :=     FieldBYname('ECLOTE').AsString  ;
            dblcdCnp.text :=    FieldBYname('CPTOID').AsString  ;
            dbeGlosa.text :=    FieldBYname('ECGLOSA').AsString  ;
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
            DM1.RecuperarDatos('TGE104','*','TDIARID = '''+dblcTDiario.text+'''') ;
            edtTDiario.text := FieldBYname('TDIARDES').AsString ;
            DM1.RecuperarDatos('TGE103','*','TMONID='''+ dblcTMon.Text + '''' ) ;
            edtTMon.text   := FieldBYname('TMONABR').AsString ;
         end ;
         ActivaBotones(pnlBotones,False ) ;
         pnlCabecera1.Enabled := False ;
         pnlDetalle.Enabled   := False ;
         pnlBotones.Enabled   := False ;
      end
      else
      begin
        ShowMessage('ERRor') ;
        Exit ;
      end ;

      with dm1.cdsDetFPago do
      begin
        Active := False ;
        params.ParamByName('CIAID').AsString    := xDat.CIAID  ;
        Params.ParamByName('TDIARID').AsString  := dblcTDiario.Text  ;
        params.ParamByName('ECANOMM').AsString  := edtPeriodo.text  ;
        Params.ParamByName('ECNOCOMP').AsString := dbeNoComp.text  ;
        Active := True ;
      end ;
      Result := true ;
end;

procedure TFDetCancela1.RecCptosDifC;
begin

    if not dm1.RecuperarDatos('TGE105','*','BANCOID=''' + xdat.BANCOID + '''' )  then
       Raise exception.create('No se puede Contabilizar '+#13+
             'Falta Definir las Cuentas de Dif. de Cambio') ;

    wCptoGan  := dm1.cdsRec.fieldbyname('CPTODIFG').AsString ;
    wCptoPer  := dm1.cdsRec.fieldbyname('CPTODIFP').AsString ;
    wCtaGan   := dm1.cdsRec.fieldbyname('CTADIFG').AsString ;
    wCtaPer   := dm1.cdsRec.fieldbyname('CTADIFP').AsString ;

end;

procedure TFDetCancela1.Z2bbtnCVClick(Sender: TObject);
begin
   FComVenMon := TFComVenMon.Create(Self) ;
   FComVenMon.Adiciona ;
   try
     FComVenMon.Showmodal ;
   finally
     FComVenMon.Free ;
   end ;
end;

procedure TFDetCancela1.validaGrabacion;
begin
   if trim( dbeNoComp.Text)= '' then
   begin
      dbeNoComp.SetFocus ;
      Raise Exception.Create('Ingrese Comprobante') ;
   end ;
   if trim( dblcdCnp.Text)= '' then
   begin
      dblcdCnp.SetFocus ;
      Raise Exception.Create('Ingrese Concepto') ;
   end ;
   if trim( dbeGlosa.Text)= '' then
   begin
      dbeGlosa.SetFocus ;
      Raise Exception.Create('Ingrese Glosa') ;
   end ;
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

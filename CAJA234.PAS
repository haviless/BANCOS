unit Caja234;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient,CAJADM;

type
  TFCobModulos = class(TForm)
    pnlCabecera1: TPanel;
    pnlBotones: TPanel;
    Z2bbtnSumat: TBitBtn;
    Z2bbtnImprime: TBitBtn;
    Z2bbtnCancelado: TBitBtn;
    Z2bbtnAnula: TBitBtn;
    Z2bbtnOKCab: TBitBtn;
    Z2bbtnCancelCab: TBitBtn;
    Z2bbtnCont: TBitBtn;
    lblEstadoMov: TLabel;
    lblCia: TLabel;
    lblConcepto: TLabel;
    lblGlosa: TLabel;
    dblcdCnp: TwwDBLookupComboDlg;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    dbeGlosa: TwwDBEdit;
    lblTDoc: TLabel;
    lblNoDoc: TLabel;
    Label9: TLabel;
    lblProvRuc: TLabel;
    lblProvDes: TLabel;
    Label23: TLabel;
    dblcTDoc: TwwDBLookupCombo;
    edtTDoc: TEdit;
    dbeNoDoc: TwwDBEdit;
    dbeSerie: TwwDBEdit;
    edtAuxRuc: TEdit;
    dbeGiradoA: TwwDBEdit;
    dblcdAux: TwwDBLookupComboDlg;
    dblcClase: TwwDBLookupCombo;
    edtClase: TEdit;
    Label1: TLabel;
    lblBanco: TLabel;
    lblCuenta: TLabel;
    dblcTMonCab: TwwDBLookupCombo;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TEdit;
    edtCuenta: TEdit;
    edtTMonCab: TEdit;
    lblFComp: TLabel;
    dbdtpFEmision: TwwDBDateTimePicker;
    dbeTCambio: TwwDBEdit;
    lblTCambio: TLabel;
    Z2bbtnCalc: TBitBtn;
    pnlDetalle: TPanel;
    pnlPendientes: TPanel;
    Label16: TLabel;
    dbgPendientes: TwwDBGrid;
    pnlDocCanje: TPanel;
    Label17: TLabel;
    dbgDocCanje: TwwDBGrid;
    Label2: TLabel;
    dblcdFEfec: TwwDBLookupComboDlg;
    dbeFEfec: TwwDBEdit;
    procedure Z2bbtnCalcClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Z2bbtnSumatClick(Sender: TObject);
    procedure Z2bbtnCanceladoClick(Sender: TObject);
    procedure Z2bbtnAnulaClick(Sender: TObject);
    procedure Z2bbtnCancelCabClick(Sender: TObject);
    procedure Z2bbtnOKCabClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Z2bbtnImprimeClick(Sender: TObject);
    procedure Z2bbtnContClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbeSerieExit2(Sender: TObject);
    procedure dbeTCambioChange2(Sender: TObject);
    procedure dbeTCambioEnter2(Sender: TObject);
    procedure dbeTCambioExit2(Sender: TObject);
    procedure dblcBancoChange22(Sender: TObject);
    procedure dblcBancoEnter22(Sender: TObject);
    procedure dblcBancoExit22(Sender: TObject);
    procedure dblcCiaChange2(Sender: TObject);
    procedure dblcClaseChange22(Sender: TObject);
    procedure dblcClaseEnter2(Sender: TObject);
    procedure dblcClaseExit22(Sender: TObject);
    procedure dblcdAuxChange2(Sender: TObject);
    procedure dblcdAuxEnter2(Sender: TObject);
    procedure dblcdAuxExit2(Sender: TObject);
    procedure dblcdCnpChange2(Sender: TObject);
    procedure dblcdCnpExit2(Sender: TObject);
    procedure dblcTDocChange2(Sender: TObject);
    procedure dblcTDocExit2(Sender: TObject);
    procedure dblcTMonCabChange2(Sender: TObject);
    procedure dblcTMonCabExit2(Sender: TObject);
    procedure dbeGiradoAChange(Sender: TObject);
    procedure dbeSerieChange(Sender: TObject);
    procedure dbeNoDocChange(Sender: TObject);
    procedure dbdtpFEmisionChange(Sender: TObject);
    procedure dbeGlosaChange(Sender: TObject);
    procedure dbdtpFEmisionExit(Sender: TObject);
    procedure dbgDocCanjeCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
    procedure dbgDocCanjeCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
    procedure dbgDocCanjeColExit(Sender: TObject);
    procedure dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
    procedure dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure dblcdFEfecEnter(Sender: TObject);
    procedure dblcdFEfecExit(Sender: TObject);
  private
    { Private declarations }
    cf1: TControlFoco;
    strTmp  : String;
    xMtoCta : Real;
    xMtoLoc, xMtoExt: Real;
    evt_Exit: TNotifyEvent;
    A1 : Array of Integer ;
    A2 : Array Of TNotifyEvent ;
    A2digitos ,A4digitos : Array of TWinControl ;
    //
    wCptoGan  ,
    wCptoPer  ,
    wCtaGan   ,
    wCtaPer   : String ;
    cdsFiltro: TwwClientDaTaset;
    xGraboNuevo: Boolean ;    
    //
    procedure RecalculaReg;
    procedure Contabiliza;
    procedure Contab_IngCaja;
    procedure Contab_RegCxP;
    procedure Contab_DifCambio;
    procedure ActPnlBotones;
    procedure SetMtosCab ;
    procedure IniciaDatos;
    procedure ConfiguraAccesos;
    procedure Proc_Admin;
    procedure Proc_Consul;
    procedure Libera_Admin;
    procedure Libera_Consul;
    procedure LibConfigAccesos;
    procedure ActivaBotones(pnl: TPanel;xFlag : Boolean);
    procedure FocoInicial ;
    procedure GrabaMontoTotal  ;
    procedure ActualizaSaldosCaja;
    procedure ProcAuxiliar(x: Boolean);
    procedure RecCptosDifC ;
    procedure ValidaCab ;
    procedure RecuperaDescrip ;
    procedure InHabilitaControles ;
    procedure HabilitaControles ;
    procedure AsignaClaveDetalle ;
    procedure AsignaParametros ;
    procedure ActualizaDetalle ;
    procedure ActualizaSaldos ;
    procedure ActualizaFiltro ;    
  public
    { Public declarations }
    procedure Adiciona ;
    procedure Edita (Doc : structDocIng;cds : Twwclientdataset);
    procedure AsignaCDSFiltro(cds : TwwClientDataset) ;    
  end;

var
  FCobModulos: TFCobModulos;
  wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,
  wbcancel2: Boolean;
  wModifica: Boolean;

implementation
uses CAJAUTIL, Caja001, Caja290;
{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}

procedure TFCobModulos.IniciaDatos;
begin
   BlanqueaEdits ( pnlCabecera1 ) ;

//   dbgDetPago.KeyOptions:=[dgEnterToTab];
//0707   dbgDetPago.ColumnByName('DEMTOLOC').FooterValue:='';
//0707   dbgDetPago.ColumnByName('DEMTOEXT').FooterValue:='';
   pnlPendientes.Enabled := False;
   pnlDocCanje.Enabled   := False;
   RecuperarCiaUnica(dblcCia,edtCia);

end;


procedure TFCobModulos.Z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('C:\windows\calc.exe',1);  //Activa la calculadora del Windows
end;

{*******************************************************
CUARTO PANEL - BOTONES
*******************************************************}
procedure TFCobModulos.Z2bbtnSumatClick(Sender: TObject);
Var
   xRegAct : TBookMark;
begin
   With DM1 do begin
      cdsregcxc.DisableControls ;
      xRegAct := cdsregcxc.GetBookmark;
      xMtoLoc := 0;
      xMtoExt := 0;
      xMtoCta := 0;
      cdsregcxc.First ;
      While not cdsregcxc.Eof do begin
         if cdsregcxcDEDH.Value = 'H' then begin
           xMtoLoc := xMtoLoc + cdsregcxcDEMTOLOC.Value;
           xMtoExt := xMtoExt + cdsregcxcDEMTOEXT.Value;
         end
         else
         begin
           xMtoLoc := xMtoLoc - cdsregcxcDEMTOLOC.Value;
           xMtoExt := xMtoExt - cdsregcxcDEMTOEXT.Value;
         end;
         cdsregcxc.Next;
      end;

//0707      dbgDetPago.ColumnByName('DEMTOLOC').FooterValue:=floattostrf(xMtoLoc, ffFixed, 10, 2);
//0707      dbgDetPago.ColumnByName('DEMTOEXT').FooterValue:=floattostrf(xMtoExt, ffFixed, 10, 2);

      cdsregcxc.GotoBookmark(xRegAct);
      cdsregcxc.FreeBookmark(xRegAct);
      cdsregcxc.EnableControls;
   end;
end;

procedure TFCobModulos.Z2bbtnCanceladoClick(Sender: TObject);
begin

   Raise Exception.Create('Codigo en Construcción') ;

   if DM1.cdsIngDocs.fieldByName('NCOESTADO').AsString = 'I' then begin
      if wModifica then begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      end;
      if MessageDlg('¿Efectuar la Cancelacion del Documento?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then begin

         if not dm1.cdsregcxc.Eof then begin   //Hay documentos en el detalle
            dm1.cdsregcxc.DisableControls;
            dm1.cdsregcxc.First;
            While not dm1.cdsregcxc.Eof do
            Begin
              ActualizaSaldosCaja ;
              dm1.cdsregcxc.Edit;
              dm1.cdsregcxcDEEstado.Value:='C';
              dm1.cdsregcxc.Next;
            end;
            dm1.cdsregcxc.First ;
            dm1.cdsregcxc.EnableControls;
         end;

         DM1.cdsregcxc.ApplyUpdates(0);
         //1005
         DM1.cdsregcxc.Refresh ;
         //1005
         Z2bbtnSumatClick(sender);
         ActualizaFiltro ;
         Z2bbtnSumat.Enabled    := False;
         Z2bbtnCont.Enabled     := True;
         Z2bbtnCancelado.Enabled:= False;
         Z2bbtnAnula.Enabled    := False;
      end;
   end
   else
   begin
      ShowMessage('Imposible Cancelar');
   end;
end;


procedure TFCobModulos.Z2bbtnAnulaClick(Sender: TObject);
begin
      if MessageDlg('¿Anular Documento?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin
         dm1.cdsIngDocs.CancelUpdates ;
         DM1.cdsCanjeCxCDoc.CancelUpdates  ;
         DM1.cdsIngDocs.edit ;
         DM1.cdsIngDocs.fieldbyname('NCOESTADO').AsString := 'A' ;
         if DM1.cdsIngDocs.ApplyUpdates(0) > 0 then
         begin
            ShowMessage('Error en Ingreso de Documentos') ;
         end ;

         Z2bbtnCancelado.Enabled := False ;
         Z2bbtnAnula.Enabled     := False ;
         lblEstadoMov.Caption    := 'Anulado' ;
      end
      else
      begin
         ShowMessage('Imposible Anular Documento');
      end;
end;

procedure TFCobModulos.ActPnlBotones;
begin
   Z2bbtnSumat.Enabled    := wbSumat;
   Z2bbtnImprime.Enabled  := wbImprime;
   Z2bbtnCancelado.Enabled:= wbCancelado;
   Z2bbtnAnula.Enabled    := wbAnula;
end;

procedure TFCobModulos.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   IF DM1.cdsIngDocs.Active then
      DM1.cdsIngDocs.CancelUpdates ;
   if dm1.cdsregcxc.Active then
      DM1.cdsregcxc.CancelUpdates ;


   DM1.cdsCCBco.Filtered  := False ;
   DM1.cdsTDoc.Filtered := False ;

   cf1.QuitarExits( self ) ;

//   dm1.ControlFocoSalida(self,ctrl,evt_exit) ;
//
//   LibConfigAccesos;
//
end;


procedure TFCobModulos.Z2bbtnCancelCabClick(Sender: TObject);
var
   Doc : structDocIng ;
begin
   //Cancela las Actualizaciones Realizadas
   dm1.cdsIngDocs.CancelUpdates;
   dm1.cdsCanjeCxcDoc.CancelUpdates;
   if DM1.wModo='A' then
      Adiciona
   else begin
      with Doc do
      begin
         CIAID    := dblcCia.Text ;
         CCTREC   := 'RC' ;
         DOCID    := dblcTDoc.Text ;
         CCSERIE  := trim( dbeSerie.Text ) ;
         CCNODOC  := trim( dbeNoDoc.Text ) ;
      end ;
      Edita(doc,cdsFiltro) ;
   end;
   pnlCabecera1.SetFocus ;
   perform(CM_DialogKey,VK_TAB,0) ;
end;

procedure TFCobModulos.Z2bbtnOKCabClick(Sender: TObject);
var
   xWhere, xFiltro : string;
begin

   ValidaCab ;
   with DM1.cdsIngDocs do
   begin
     Edit ;
     if trim(FieldbyName('CIAID').AsString) = '' then
     begin
        FieldbyName('CIAID').AsString     := dblcCia.Text         ;
        FieldbyName('DOCID').AsString     := dblcTDoc.Text        ;
        FieldbyName('CCSERIE').AsString   := trim(dbeSerie.Text)  ;
        FieldbyName('CCNODOC').AsString   := trim(dbeNoDoc.Text)  ;
     end  ;
     //wmc2808
     if trim(dblcdFEfec.Text) = '' then
        fieldbyname('FLUEID').Clear
     else
        fieldbyname('FLUEID').AsString := trim(dblcdFEfec.Text) ;
     //

     FieldbyName('CCFEMIS').AsDateTime    := dbdtpFEmision.Date      ;
     FieldbyName('BANCOID').Value         := dblcBanco.Text          ;
     FieldbyName('CUENTAID').Value        := edtCuenta.Text          ;
     FieldbyName('TMONID').Value          := dblcTMonCab.Text        ;
     FieldbyName('NCOTCAMB').Value        := dbeTCambio.Text         ;
     FieldbyName('CLAUXID').Value         := dblcClase.Text          ;
     FieldbyName('CLIEID').Value           := dblcdAux.Text           ;
     FieldbyName('CLIERUC').Value         := edtAuxRUC.Text          ;
     FieldbyName('CCNOMB').Value          := dbeGiradoA.Text         ;
     FieldbyName('CPTOID').Value          := dblcdCnp.Text           ;
     FieldbyName('CCGLOSA').Value         := dbeGlosa.Text           ;
     FieldbyName('CCTREC').Value          := 'RC'                    ;
     fieldbyName('NCOESTADO').Value       := 'I'                      ;
     Post ;
   end ;
   pnlCabecera1.enabled := False ;
   //configuracion de botones
   ActivaBotones( pnlCabecera1,false) ;
   pnlDetalle.Enabled := True ;
   pnlBotones.Enabled := True ;
   if wmodifica then
   begin
   end
   else
   begin
      Z2bbtnCancelado.Enabled := True ;
      Z2bbtnAnula.Enabled     := True ;
   end ;
//
   pnlPendientes.enabled := True;
   pnlDocCanje.enabled   := True;
//

////////////////////************************************************

      xWhere := 'CIAID = ''' +dblcCia.Text  + ''' AND ' +
                 ' CCESTADO =' + '''' + 'P' + ''' AND ' +
                 ' CLAUXID = ''' + dblcClase.Text + '''  AND ' +
                 ' CLIEID = ''' + dblcdAux.Text + '''  ' ;

      xFiltro := ' ((CCMTOLOC - CCPAGLOC = CCSALLOC) OR (CCPAGLOC IS NULL) ) ' +
                 ' AND CCSALLOC > 0 '  ;

      dm1.cdsMovCxC.active := False ;
//wmc1809      dm1.cdsMovCxC.CommandText := 'SELECT * FROM CXC301 WHERE ' + xWhere ;
      dm1.cdsMovCxC.Datarequest( 'SELECT * FROM CXC301 WHERE ' + xWhere ) ;
      dm1.cdsMovCxC.Active := True ;

      dm1.cdsMovCxC.Filter:= xFiltro ;
      dm1.cdsMovCxC.Filtered:=True;
      if dm1.cdsMovCxC.RecordCount=0 then
      begin
         ShowMessage('No hay Documentos Pendientes para Cliente');
         exit;
      end;
////////////////////************************************************

   if not dm1.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClase.Text ]),[]) then
      Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''') ;

   if dm1.cdsregcxc.RecordCount = 0 then
   begin
        //0707Z2dbgDetPagoIButtonClick(nil) ;
   end
   else
   begin
        //Comprobar si no ha habido un  cambio en el tipo de cambio
        if ( dblcTMonCab.Text <> dm1.cdsRegCxC.fieldbyname('TMONID').AsString ) or
           ( strtocurr(dbeTCambio.Text) <> (dm1.cdsRegCxC.fieldbyname('DETCDOC').AsCurrency) ) then
        begin
           ActualizaDetalle ;
        end ;
   end ;
end;


procedure TFCobModulos.RecalculaReg;
var
    xcont   : integer;
begin
    xcont:=0;
    dm1.cdsregcxc.DisableControls;
    dm1.cdsregcxc.First ;
    While not dm1.cdsregcxc.Eof do Begin
       xcont:=xcont+1;
       dm1.cdsregcxc.Edit;
//0106       dm1.cdsregcxcCPNoReg.Value:=dm1.strzero(inttostr(xcont),6);
       dm1.cdsregcxcCPNoReg.Value:=dm1.strzero(inttostr(xcont),10);
       dm1.cdsregcxc.Post;
       dm1.cdsregcxc.Next;
    end;
    dm1.cdsregcxc.First ;
    dm1.cdsregcxc.EnableControls;
end;

procedure TFCobModulos.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFCobModulos.FormShow(Sender: TObject);
begin


   FocoInicial ;
   dm1.cdsTDoc.Filter := ' FCING = ''1'' ' ;
   dm1.cdsTDoc.Filtered := True ;

   cf1.PonerExits ;
end;


procedure TFCobModulos.Z2bbtnImprimeClick(Sender: TObject);
var
   Comprobante : RCabComprobante;
begin
  if DM1.cdsIngDocs.FieldByName('ECCONTA').AsString <> 'S' THEN
  begin
      ShowMessage('Este Movimiento no Está Contabilizado');
      exit;
  end ;

   with Comprobante do
   begin
      CIAID     := dblcCia.Text ;
      CiaDes    := edtCia.Text ;
      Proveedor := '' ;
      Glosa     := dbeGlosa.Text ;
      TipoDoc   := edtTDoc.Text ;
      TipoCamb  := dbeTCambio.Text ;
      NoDoc     := dbeNoDoc.Text ;
      Cuenta    := '';
      Banco     := edtBanco.text ;
      NumChq    := '' ;
      Importe  := DM1.cdsIngDocs.Fieldbyname('NCOMTOLOC').AsString;
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

procedure TFCobModulos.Z2bbtnContClick(Sender: TObject);
begin
     Raise Exception.create('por Revisar Código de Contabilización') ;
end;

procedure TFCobModulos.Contabiliza;
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

//0405
    DM1.cdsCntCaja.Insert;
    Contab_IngCaja;

    dm1.cdsregcxc.DisableControls;
    xRegAct := dm1.cdsregcxc.GetBookmark;
    dm1.cdsregcxc.First ;

   // GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde el Detalle
    While not dm1.cdsregcxc.Eof do
    Begin
       dm1.cdsCntCaja.Insert;
       Contab_RegCxP;
       Contab_DifCambio;
       dm1.cdsregcxc.Next;
    end;
    dm1.cdsregcxc.GotoBookmark(xRegAct);
    dm1.cdsregcxc.FreeBookmark(xRegAct);
    dm1.cdsregcxc.EnableControls;

    //Actualizamos en la tabla de Contabilidad
    DM1.cdsCntCaja.ApplyUpdates(0);
//    DM1.ActualizaData(DM1.cdsCntCaja);
end;

procedure TFCobModulos.Contab_IngCaja;
begin
    dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsIngDocs.fieldbyName('CIAID').Value;
    dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsIngDocs.fieldbyName('TDIARID').Value;
    dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsIngDocs.fieldbyName('ECANOMM').Value;
    dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsIngDocs.fieldbyName('ECNOCOMP').Value;
    dm1.cdsCntCajaDCLOTE.Value  :=  dm1.cdsIngDocs.fieldbyname('ECLOTE').Value;
    dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsIngDocs.fieldbyName('ECNODOC').Value;
    dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsIngDocs.fieldbyName('ECFCOMP').Value;
    dm1.cdsCntCajaCPTOID.Value  :=  dm1.cdsIngDocs.fieldbyname('CPTOID').Value;
    dm1.cdsCntCajaCUENTAID.Value:= edtCuenta.Text;
    dm1.cdsCntCajaDCDH.Value    :=  'D';
    dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsIngDocs.fieldbyName('ECTCAMB').Value;
    dm1.cdsCntCajaTMONID.Value  :=  dm1.cdsIngDocs.fieldbyName('TMONID').Value;
    dm1.cdsCntCajaDCMTOORI.Value:=  dm1.cdsIngDocs.fieldbyName('ECMTOORI').Value;
    dm1.cdsCntCajaDCMTOLO.Value :=  dm1.cdsIngDocs.fieldbyName('ECMTOLOC').Value;
    dm1.cdsCntCajaDCMTOEXT.Value:=  dm1.cdsIngDocs.fieldbyname('ECMTOEXT').Value;
    dm1.cdsCntCajaDCFLACDR.Value:= 'S';   //Registro ya cuadrado
    dm1.cdsCntCajaDCANO.Value   := dm1.cdsIngDocs.fieldbyName('ECANO').Value;
    dm1.cdsCntCajaDCMM.Value    := dm1.cdsIngDocs.fieldbyName('ECMM').Value;
    dm1.cdsCntCajaDCDD.Value    := dm1.cdsIngDocs.fieldbyName('ECDD').Value;
    dm1.cdsCntCajaDCSS.Value    := dm1.cdsIngDocs.fieldbyName('ECSS').Value;
    dm1.cdsCntCajaDCSEM.Value   := dm1.cdsIngDocs.fieldbyName('ECSEM').Value;
    dm1.cdsCntCajaDCTRI.Value   := dm1.cdsIngDocs.fieldbyName('ECTRI').Value;
    dm1.cdsCntCajaDCAASS.Value  := dm1.cdsIngDocs.fieldbyName('ECAASS').Value;
    dm1.cdsCntCajaDCAASEM.Value := dm1.cdsIngDocs.fieldbyName('ECAASEM').Value;
    dm1.cdsCntCajaDCAATRI.Value := dm1.cdsIngDocs.fieldbyname('ECAATRI').Value;
    dm1.cdsCntCaja.FieldByName('DCGLOSA').AsString := dm1.cdsIngDocs.fieldBYName('ECGLOSA').AsString ;
    dm1.cdsCntCaja.FieldByName('DCTCAMPA').AsString := dbeTCambio.Text ;
    dm1.cdsCntCaja.FieldByName('FCAB').AsString := '1' ;
end;

procedure TFCobModulos.Contab_RegCxP;
begin
    dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsregcxcCIAID.Value;
    dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsregcxcTDIARID.Value;
    dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsregcxcECANOMM.Value;
    dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsregcxcECNOCOMP.Value;
    //dm1.cdsCntCajaDCLOTE.Value  :=  ;
    dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsregcxcDOCID2.Value;
    dm1.cdsCntCajaDCSERIE.Value :=  dm1.cdsregcxcCPSERIE.Value;
    dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsregcxcCPNODOC.Value;
    dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsregcxcDEFCOMP.Value;
    dm1.cdsCntCajaDCFEMIS.Value :=  dm1.cdsregcxcCPFEMIS.Value;
    dm1.cdsCntCajaDCFVCMTO.Value:=  dm1.cdsregcxcCPFVCMTO.Value;
    dm1.cdsCntCajaCPTOID.Value  :=  dm1.cdsregcxcCPTOID.Value;
    dm1.cdsCntCajaCUENTAID.Value:=  dm1.cdsregcxcCUENTAID.Value;
    dm1.cdsCntCajaCLAUXID.Value :=  dm1.cdsIngDocs.fieldbyName('CLAUXID').Value; //Aqui se toma de la cabecera
    dm1.cdsCntCajaDCAUXID.Value :=  dm1.cdsIngDocs.fieldbyName('PROV').Value;    //Aqui se toma de la cabecera
    dm1.cdsCntCajaCCOSID.Value  :=  dm1.cdsregcxcCCOSID.Value;
    dm1.cdsCntCajaDCDH.Value    :=  dm1.cdsregcxcDEDH.Value;
    dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsregcxcDETCPAG.Value;
    dm1.cdsCntCajaDCTCAMPR.Value:=  dm1.cdsregcxcDETCDOC.Value;
    dm1.cdsCntCajaTMONID.Value  :=  dm1.cdsregcxcTMONID.Value;
    dm1.cdsCntCajaDCMTOORI.Value:=  dm1.cdsregcxcDEMTOORI.Value;
    if dm1.cdsregcxcTMONID.Value = dm1.wtMonLoc then begin
       dm1.cdsCntCajaDCMTOLO.Value := dm1.cdsregcxcDEMTOLOC.Value;
       dm1.cdsCntCajaDCMTOEXT.Value:= dm1.cdsregcxcDEMTOLOC.Value / dm1.cdsregcxcDETCDOC.Value;
    end
    else begin
       dm1.cdsCntCajaDCMTOEXT.Value:= dm1.cdsregcxcDEMTOEXT.Value;
       dm1.cdsCntCajaDCMTOLO.Value := dm1.cdsregcxcDEMTOEXT.Value * dm1.cdsregcxcDETCDOC.Value;
    end;

    //dm1.cdsCntCajaDCESTADO.Value:=;
    dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
    //dm1.cdsCntCajaDCFLAAUT.Value:=;
    //dm1.cdsCntCajaDCUSER.Value  :=;
    //dm1.cdsCntCajaDCFREG.Value  :=;
    //dm1.cdsCntCajaDCHREG.Value  :=;
    dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsregcxcDEANO.Value;
    dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsregcxcDEMM.Value;
    dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsregcxcDEDD.Value;
    dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsregcxcDESS.Value;
    dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsregcxcDESEM.Value;
    dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsregcxcDETRI.Value;
    dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsregcxcDEAASS.Value;
    dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsregcxcDEAASEM.Value;
    dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsregcxcDEAATRI.Value;
    //dm1.cdsCntCajaFLAGVAR.Value :=;}
end;

procedure TFCobModulos.Contab_DifCambio;
var
    xDif_Camb : real;
begin
    // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
    if dm1.cdsregcxcDETCDOC.Value <> dm1.cdsregcxcDETCPAG.Value then begin

       DM1.cdsCntCaja.Insert;

       dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsregcxcCIAID.Value;
       dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsregcxcTDIARID.Value;
       dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsregcxcECANOMM.Value;
       dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsregcxcECNOCOMP.Value;
       //dm1.cdsCntCajaDCLOTE.Value  :=  ;
       dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsregcxcDOCID2.Value;
       dm1.cdsCntCajaDCSERIE.Value :=  dm1.cdsregcxcCPSERIE.Value;
       dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsregcxcCPNODOC.Value;
       dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsregcxcDEFCOMP.Value;
       dm1.cdsCntCajaDCFEMIS.Value :=  dm1.cdsregcxcCPFEMIS.Value;
       dm1.cdsCntCajaDCFVCMTO.Value:=  dm1.cdsregcxcCPFVCMTO.Value;
       dm1.cdsCntCajaCLAUXID.Value :=  dm1.cdsIngDocs.fieldbyName('CLAUXID').Value; //Aqui se toma de la cabecera
       dm1.cdsCntCajaDCAUXID.Value :=  dm1.cdsIngDocs.fieldbyName('PROV').Value;    //Aqui se toma de la cabecera
       dm1.cdsCntCajaCCOSID.Value  :=  dm1.cdsregcxcCCOSID.Value;

       dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsregcxcDETCPAG.Value;
       dm1.cdsCntCajaDCTCAMPR.Value:=  dm1.cdsregcxcDETCDOC.Value;

       //dm1.cdsCntCajaDCESTADO.Value:=;
       dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
       //dm1.cdsCntCajaDCFLAAUT.Value:=;
       //dm1.cdsCntCajaDCUSER.Value  :=;
       //dm1.cdsCntCajaDCFREG.Value  :=;
       //dm1.cdsCntCajaDCHREG.Value  :=;
       dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsregcxcDEANO.Value;
       dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsregcxcDEMM.Value;
       dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsregcxcDEDD.Value;
       dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsregcxcDESS.Value;
       dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsregcxcDESEM.Value;
       dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsregcxcDETRI.Value;
       dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsregcxcDEAASS.Value;
       dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsregcxcDEAASEM.Value;
       dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsregcxcDEAATRI.Value;
       //dm1.cdsCntCajaFLAGVAR.Value :=;}

       if dm1.cdsregcxcTMONID.Value=dm1.wtMonLoc then begin   //Provision en Mon.Local
             xDif_Camb:= abs(dm1.cdsregcxcDEMTOLOC.Value / dm1.cdsregcxcDETCDOC.Value -
                             dm1.cdsregcxcDEMTOLOC.Value / dm1.cdsregcxcDETCPAG.Value);//En Mon.Ext.
             dm1.cdsCntCajaDCMTOEXT.Value := xDif_Camb;
             dm1.cdsCntCajaTMONID.Value   :=  dm1.wtMonExt;

             if dm1.cdsregcxcDETCDOC.Value > dm1.cdsregcxcDETCPAG.Value then
                dm1.cdsCntCajaDCDH.Value := 'D'
             else
                dm1.cdsCntCajaDCDH.Value := 'H';

       end
       else begin                                            //Provision en Mon.Ext.
             xDif_Camb:= abs(dm1.cdsregcxcDEMTOEXT.Value * dm1.cdsregcxcDETCDOC.Value -
                             dm1.cdsregcxcDEMTOEXT.Value * dm1.cdsregcxcDETCPAG.Value);//En Mon.Local
             dm1.cdsCntCajaDCMTOLO.Value := xDif_Camb;
             dm1.cdsCntCajaTMONID.Value  := dm1.wtMonLoc;

             if dm1.cdsregcxcDETCDOC.Value > dm1.cdsregcxcDETCPAG.Value then
                dm1.cdsCntCajaDCDH.Value := 'H'
             else
                dm1.cdsCntCajaDCDH.Value := 'D';
       end;
       if dm1.cdsCntCajaDCDH.Value = 'D' then begin
          dm1.cdsCntCajaCPTOID.Value  :=  wCptoPer;
          dm1.cdsCntCajaCUENTAID.Value:=  wCtaPer;
       end
       else begin
          dm1.cdsCntCajaCPTOID.Value  :=  wCptoGan;
          dm1.cdsCntCajaCUENTAID.Value:=  wCtaGan;
       end;
    end
end;

procedure TFCobModulos.Adiciona;
var
   xSQL : String ;
begin

   IniciaDatos ;
   xGraboNuevo := False ;

   pnlCabecera1.Enabled := True  ;
   pnlDetalle.Enabled   := False ;
   pnlBotones.Enabled   := False ;

   ActivaBotones ( pnlCabecera1 , True ) ;
   ActivaBotones ( pnlBotones , False )  ;
   HabilitaControles ;
   dblcTMonCab.Enabled := True ;

   // vhn 23/01/2001
   xSQL:='Select * from CXC303 '
        +'Where CIAID='''' and DOCID='''' and '
        +      'CCSERIE='''' and CCNODOC='''' ';
   DM1.cdsIngDocs.Close;
   DM1.cdsIngDocs.DataRequest( xSQL );
   DM1.cdsIngDocs.Open;
   dm1.cdsIngDocs.Insert ;

   // vhn 23/01/2001
   xSQL:='Select * from CXC304 '
        +'Where CIAID='''' and DOCID='''' and '
        +      'CCSERIE='''' and CCNODOC='''' ';
   DM1.cdsCanjeCxCDOC.Close;
   DM1.cdsCanjeCxCDOC.DataRequest( xSQL );
   DM1.cdsCanjeCxCDOC.Open;

   dm1.cdsMovCxC.Filter := 'CIAID=''''' ;
   dm1.cdsMovCxC.Filtered := True ;

   lblEstadoMov.Caption := 'Nuevo' ;
   wModifica :=false ;
end;

procedure TFCobModulos.Edita(Doc : structDocIng;cds : Twwclientdataset);
var
   xSQL : String ;
begin
   IniciaDatos ;
   cdsFiltro := cds ;
   InHabilitaControles ;

   // vhn 23/01/2001
   xSQL:='Select * from CXC303 '
        +'Where CIAID='''  +Doc.CIAID   +''' and '
        +      'DOCID='''  +Doc.DOCID   +''' and '
        +      'CCSERIE='''+Doc.CCSERIE +''' and '
        +      'CCNODOC='''+Doc.CCNODOC +''' ';
   DM1.cdsIngDocs.Close;
   DM1.cdsIngDocs.DataRequest( xSQL );
   DM1.cdsIngDocs.Open;
   DM1.cdsIngDocs.Edit ;

   dm1.cdsMovCxC.Filter := 'CIAID=''''' ;
   dm1.cdsMovCxC.Filtered := True ;

   with DM1.cdsIngDocs do
   begin
      dblcCia.Text       :=  FieldbyName('CIAID').AsString ;
      dblcTDoc.Text      :=  FieldbyName('DOCID').AsString ;
      dbeSerie.Text      :=  FieldbyName('CCSERIE').AsString ;
      dbeNoDoc.Text      :=  FieldbyName('CCNODOC').AsString ;
      dbdtpFEmision.Date :=  FieldbyName('CCFEMIS').AsDateTime ;
      dblcBanco.Text     :=  FieldbyName('BANCOID').Value ;
      edtCuenta.Text     :=  FieldbyName('CUENTAID').Value ;
      dblcTMonCab.Text   :=  FieldbyName('TMONID').Value ;
      dbeTCambio.Text    :=  CajaDEc( FieldbyName('NCOTCAMB').AsString ) ;
      dblcClase.Text     :=  FieldbyName('CLAUXID').Value ;
      dblcdAux.Text      :=  FieldbyName('CLIEID').Value ;
      edtAuxRUC.Text     :=  FieldbyName('CLIERUC').Value ;
      dbeGiradoA.Text    :=  FieldbyName('CCNOMB').Value ;
      dblcdCnp.Text      :=  FieldbyName('CPTOID').Value ;
      dbeGlosa.Text      :=  FieldbyName('CCGLOSA').Value ;
      dblcdFEfec.Text    :=  FieldbyName('FLUEID').asstring ;
//0707      dbgDetPago.ColumnByName('DEMTOLOC').FooterValue:= FieldbyName('NCOMTOLOC').AsString  ;
//0707      dbgDetPago.ColumnByName('DEMTOEXT').FooterValue:= FieldbyName('NCOMTOEXT').AsString  ;
      dm1.cdsregcXc.DisableControls ;
      dm1.cdsRegCxC.EnableControls ;
   end;
   RecuperaDescrip ;

   // vhn 22/01/2001
   xSQL:='Select * from CXC304 '
        +'Where CIAID='''   +dblcCia.Text        +''' and '
        +      'DOCID='''   +dblcTDoc.Text       +''' and '
        +      'CCSERIE=''' +trim(dbeSerie.Text) +''' and '
        +      'CCNODOC=''' +trim(dbeNoDoc.text) +''' ';
   DM1.cdsCanjeCxCDOC.Close;
   DM1.cdsCanjeCxCDOC.DataRequest( xSQL );
   DM1.cdsCanjeCxCDOC.Open;

   case dm1.cdsIngDocs.fieldbyname('NCOESTADO').AsString[1] of
     'I':
         begin
            pnlCabecera1.Enabled        := False ;
            pnlBotones.Enabled          := False ;

            pnlDetalle.Enabled := True ;
            pnlPendientes.Enabled:= False;
            pnlDocCanje.Enabled  := True;
            dbgDocCanje.ReadOnly := True;     // Grid en Solo Lectura

            ActivaBotones(pnlCabecera1 , False ) ;
            ActivaBotones( pnlBotones , True )   ;

            lblEstadoMov.Caption := 'Activo'     ;
         end ;
     'A','C':
         begin
            pnlCabecera1.Enabled := False ;
            pnlDetalle.Enabled := True ;
            pnlPendientes.Enabled:= False;
            pnlDocCanje.Enabled  := True;
            dbgDocCanje.ReadOnly := True;     // Grid en Solo Lectura

            ActivaBotones( pnlCabecera1 , False ) ;
            ActivaBotones( pnlBotones , False ) ;
            if dm1.cdsIngDocs.fieldbyname('NCOESTADO').AsString[1] = 'C' then
            begin
               lblEstadoMov.Caption  := 'Cancelado' ;
               Z2bbtnCont.Enabled    := True ;
               Z2bbtnImprime.Enabled := True ;
            end
            else
            begin
               lblEstadoMov.Caption := 'Anulado' ;
            end ;
         end ;
   end;
   wModifica := False ;
end;

procedure TFCobModulos.FormCreate(Sender: TObject);
begin
   RecuperarCiaUnica(dblcCia,edtCia);
   SetLength(A4digitos,1) ;
   A4digitos[0] := dbeTCambio ;
   cf1 := TControlFoco.Create ;
   dm1.cdsFEfec.Filter := 'FLUEFE_IS = ''I'' ' ;
   dm1.cdsFEfec.Filtered := True ;
end;

procedure TFCobModulos.FormActivate(Sender: TObject);
begin
//
//   ConfiguraAccesos ;
//
end;

procedure TFCobModulos.ConfiguraAccesos;
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

procedure TFCobModulos.Libera_Admin;
begin
    Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFCobModulos.Libera_Consul;
begin

end;

procedure TFCobModulos.Proc_Admin;
var
   Contador : Integer ;
begin
    pnlCabecera1.Enabled := False ;
    pnlDeTalle.Enabled := False ;
    //Array de controles y eventos
    Contador := BotonesEnPanel( pnlBotones ) ;
    setlength( A1 , Contador) ;
    setlength( A2 , Contador) ;
    Quita(A1,A2,pnlBotones) ;
    //
    pnlBotones.Enabled := True ;
end;

procedure TFCobModulos.Proc_Consul;
begin
    pnlCabecera1.Enabled := False ;
    pnlDeTalle.Enabled := True ;
    pnlBotones.Enabled := False ;
end;

procedure TFCobModulos.LibConfigAccesos;
begin
    if DM1.wAdmin = 'G' then
       Libera_Admin
    else
    begin
       if DM1.wModo = 'C' then
          Libera_Consul ;
    end ;
end;

procedure TFCobModulos.ActivaBotones(pnl: TPanel;xFlag : Boolean);
var
 i : Integer ;
begin
   for i := 0 to pnl.ControlCount-1 do
   begin
     if pnl.controls[i] is tbitbtn then
        TBitBtn(pnl.controls[i]).enabled := xFlag ;
   end;
end;

procedure TFCobModulos.SetMtosCab;
begin
//DEEstado
   with dm1 do
   begin
      cdsregcxc.First ;
      while not cdsregcxc.Eof do
      begin
           if cdsregcxc.FieldBYname('DEESTADO').AsString <> 'A' then
           begin
               if cdsregcxc.FieldBYname('DEESTADO').AsString <> 'C' then
               begin
                  //////
                  ActualizaSaldosCaja ;
                  //////
               end ;
               cdsregcxc.Edit;
               cdsregcxcDEEstado.AsString := 'C';
               cdsregcxc.Post;
           end ;
           dm1.cdsregcxc.Next ;
      end;
      cdsregcxc.ApplyUpdates(0) ;
      cdsregcxc.Refresh ;
      cdsregcxc.First ;
   end ;
end;

procedure TFCobModulos.FocoInicial;
begin
     if pnlCabecera1.Enabled then
        pnlCabecera1.SetFocus
          else if pnlDetalle.Enabled then
                  pnlDeTalle.setfocus
               else if pnlBotones.enabled then
                       pnlBotones.SetFocus
                    else
                       self.SetFocus ;
     perform(CM_DialogKey,VK_TAB,0);

end;

procedure TFCobModulos.GrabaMontoTotal;
begin
  dm1.cdsIngDocs.Edit;
  dm1.cdsIngDocs.fieldbyName('NCOMTOLOC').AsCurrency := OperClientDataSet(dm1.cdsCanjeCxCDoc,'SUM(CCMTOLOC)','') ;
  dm1.cdsIngDocs.fieldbyName('NCOMTOEXT').AsCurrency := OperClientDataSet(dm1.cdsCanjeCxCDoc,'SUM(CCMTOEXT)','') ;
  if dblcTMonCab.Text = dm1.wTMonLoc then
     dm1.cdsIngDocs.fieldbyName('NCOMTOORI').AsFloat := dm1.cdsIngDocs.fieldbyName('NCOMTOLOC').AsCurrency
  else
     dm1.cdsIngDocs.fieldbyName('NCOMTOORI').AsFloat := dm1.cdsIngDocs.fieldbyName('NCOMTOEXT').AsCurrency ;
end;

procedure TFCobModulos.ActualizaSaldosCaja;
//var   Campo : String ;
begin
{1307
    if trim(dblcCCBco.TEXT) <> '' then
    begin
      if dm1.wTMonLoc = dm1.cdsIngDocs.FieldByName('TMONID').AsString then
         Campo := 'ECMTOLOC'
      else
         Campo := 'ECMTOEXT'  ;
    end ;
}
end;


procedure TFCobModulos.ProcAuxiliar(x: Boolean);
begin
      if dm1.cdsCDSLookUp.Locate('CDS',VarArrayOf(['cdsaux']),[]) then
      begin
         dm1.cdsCDSLookUp.edit ;
         if x then
            dm1.cdsCDSLookUp.FieldByName('CAMPOABR').AsString := 'AUXABR'
         else
            dm1.cdsCDSLookUp.FieldByName('CAMPOABR').Value := dm1.cdsCDSLookUp.FieldByName('CAMPOABR').OldValue ;
         dm1.cdsCDSLookUp.Post ;
      end
      else
          ShowMessage('wmc : error en aux')
end;

procedure TFCobModulos.RecCptosDifC;
begin
    begin
       if not dm1.RecuperarDatos('TGE105','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP','BANCOID=''' + dblcBanco.Text + '''' )  then
          Raise exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio') ;
    end ;
    wCptoGan  := dm1.cdsRec.fieldbyname('CPTODIFG').AsString ;
    wCptoPer  := dm1.cdsRec.fieldbyname('CPTODIFP').AsString ;
    wCtaGan   := dm1.cdsRec.fieldbyname('CTADIFG').AsString ;
    wCtaPer   := dm1.cdsRec.fieldbyname('CTADIFP').AsString ;
end;

procedure TFCobModulos.dbeSerieExit2(Sender: TObject);
begin
{
   if not (Z2bbtnCancelCab.Focused ) then begin
       if length(dbeSerie.Text)=0 then
       begin
          ShowMessage('Falta registrar la Serie');
          //dbeSerie.SetFocus;
       end
   end;
}   
end;

procedure TFCobModulos.dbeTCambioChange2(Sender: TObject);
begin
  if not TCustomEdit(Sender).Focused then
     Exit ;
  wModifica := True ;
end;

procedure TFCobModulos.dbeTCambioEnter2(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFCobModulos.dbeTCambioExit2(Sender: TObject);
var
    Tmp : string ;
begin

    if ( Trim(strTmp) = Trim( dbeTCambio.Text ) ) AND ( (Trim(strTmp) = '0.00') OR (trim(strtmp) = '' ) ) then
    begin
       TCustomEdit(Sender).SetFocus ;
       Tmp := Strtmp ;
       ShowMessage('Ingrese Tipo de Cambio') ;
       strTmp := Tmp ;
       Exit ;
    end ;

    if strTmp <> TCustomEdit(Sender).text then
    begin
       if strtocurr(TCustomEdit(Sender).text) = 0 then
       begin
          TCustomEdit(Sender).SetFocus ;
          Tmp := Strtmp ;
          ShowMessage('Ingrese Tipo de Cambio') ;
          strTmp := Tmp ;
          Exit ;
       end ;
       TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text,4) ;
    end ;
end;

procedure TFCobModulos.dblcBancoChange22(Sender: TObject);
begin
    if not TCustomEdit(Sender).Focused then
      Exit ;

    DM1.EncuentraDescripcion(dblcBanco,edtBanco);
    wModifica:=True;

end;

procedure TFCobModulos.dblcBancoEnter22(Sender: TObject);
begin
   strTmp := dblcBanco.text ;
end;

procedure TFCobModulos.dblcBancoExit22(Sender: TObject);
var
    Tmp : String ;
begin
   Tmp := StrTmp ;
   dm1.xxExit(dblcBanco,edtBanco,[z2bbtnCancelCab],'Banco') ;
   StrTmp := Tmp ;

   if edtBanco.Text = '' then
      exit ;

   if dblcBanco.Text <> strTmp then
   begin

       edtCuenta.Text := '' ;
       dblcTMonCab.Text := '' ;
       edtTMonCab.Text := '' ;

       if DM1.cdsbancoegr.FieldByName('BCOTIPCTA').Value='C' then
       begin //Si es CAJA
          edtCuenta.Text:=DM1.cdsbancoegr.FieldByName('CUENTAID').Value; //Se toma de la tabla Bancos
       end
       else
       begin  //Si es BANCO
          DM1.cdsCCBco.Filtered:=False;
          DM1.cdsCCBco.Filter:='';   //Filtrar la lista de CtaCte por Banco
          DM1.cdsCCBco.Filter:='BANCOID='+''''+dblcBanco.Text+'''';
          DM1.cdsCCBco.Filtered:=True;
       end;
   end;

end;

procedure TFCobModulos.dblcCiaChange2(Sender: TObject);
begin
      if not TCustomEdit(Sender).Focused then
         Exit ;
      dm1.EncuentraDescripcion(dblccia,edtCia) ;
      wModifica := True ;
end;

procedure TFCobModulos.dblcClaseChange22(Sender: TObject);
begin
     if not (sender as tcustomedit).focused then
        Exit ;
     DM1.EncuentraDescripcion( dblcClase , edtClase ) ;
     dblcdAux.Enabled := True ;
     wModifica := TRUE ;
end;

procedure TFCobModulos.dblcClaseEnter2(Sender: TObject);
begin
   strTmp := dblcClase.Text ;
end;

procedure TFCobModulos.dblcClaseExit22(Sender: TObject);
var
   Tmp : String ;
begin
    Tmp := StrTmp ;
    dm1.xxExit(dblcClase,edtClase,[],'Clase del Auxiliar','A') ;
    StrTmp := Tmp ;
    if (dblcClase.Text <> strTmp) and (trim(edtClase.text) <> '') then
    begin
       dblcdAux.Text := '' ;
       edtAuxRUC.Text := '' ;
       dbeGiradoA.Text := '' ;
    end ;
end;
procedure TFCobModulos.dblcdAuxChange2(Sender: TObject);
var
   Tmp : String ;
begin

   if not (sender as TcustomEdit).focused then
      Exit ;
   Tmp := StrTmp ;
   dm1.EncuentraDescripcionRpta( dblcdAux , edtAuxRUC ,dblcClase.Text ) ;
   StrTmp := Tmp ;
   if (edtAuxruc.Tag = 1 )  then
   begin
       if dm1.RecuperarDatos('CNT201','AUXGIRA,AUXNOMB','AUXID='''+dblcdAux.Text+'''')  then
       begin
       try
          if (dm1.cdsRec.FieldByName('AUXGIRA').Isnull) or
             (trim(dm1.cdsRec.FieldByName('AUXGIRA').Asstring)='') then
             dbeGiradoA.Text := dm1.cdsRec.FieldByName('AUXNOMB').Asstring
          else
             dbeGiradoA.Text := dm1.cdsRec.FieldByName('AUXGIRA').Asstring ;
       except
          dbeGiradoA.Text := 'SuperTemporal'  ;
       end ;
       end
       else
          ShowMessage('error para wmc no encontró descripcion')
   end
   else
       dbeGiradoA.Text := ''  ;
   wModifica := True ;
end;

procedure TFCobModulos.dblcdAuxEnter2(Sender: TObject);
begin
    if trim(dblcClase.Text) = '' then
    begin
       dblcClase.SetFocus ;
       exit ;
    end ;

    strTmp := dblcdAux.Text ;
    if trim(strTmp) <> '' then
       edtAuxRUC.Tag := 1
    else
       edtAuxRUC.Tag := 0
end;

procedure TFCobModulos.dblcdAuxExit2(Sender: TObject);
begin
   if dblcClase.Focused then
      Exit ;
   dm1.xxExit2(dblcdAux,edtAuxRUC,[],'Auxiliar') ;
end;

procedure TFCobModulos.dblcdCnpChange2(Sender: TObject);
begin
   if not TCustomedit(Sender).Focused then
      Exit ;
   dm1.EncuentraDescripcion(dblcdCnp,dbeGlosa) ;
   wModifica:=True;
end;

procedure TFCobModulos.dblcdCnpExit2(Sender: TObject);
begin
  dm1.xxExit(dblcdCnp,dbeGlosa,[] ,'Concepto') ;
end;

procedure TFCobModulos.dblcTDocChange2(Sender: TObject);
begin
    if not TWinControl(Sender).Focused then
       Exit ;
    dm1.EncuentraDescripcion(dblcTDoc,edtTDoc) ;
    wModifica := True ;
end;

procedure TFCobModulos.dblcTDocExit2(Sender: TObject);
begin
   dm1.xxExit(dblcTDoc,edtTDoc,[Z2bbtnCancelCab],'Tipo de Documento') ;
end;

procedure TFCobModulos.dblcTMonCabChange2(Sender: TObject);
begin

   if not TCustomedit(sender).Focused then
      Exit ;
   dm1.EncuentraDescripcion(dblcTMonCab , edtTMonCab) ;
   wModifica:=True;
   
end;

procedure TFCobModulos.dblcTMonCabExit2(Sender: TObject);
begin
  dm1.xxExit(dblcTMonCab , edtTMonCab , [ Z2bbtnCancelCab ] ,'Moneda')
end;

procedure TFCobModulos.dbeGiradoAChange(Sender: TObject);
begin
   if Not TCustomEdit(Sender).Focused then
      Exit ;
   wModifica := tRUE ;
end;

procedure TFCobModulos.ValidaCab;
var
   xWhere : String ;
begin
    ValidaEdit(dblcCia ,'Ingrese Compañía') ;
    ValidaEdit(dblcTDoc ,'Ingrese Tipo de Documento') ;
    ValidaEdit(dbeNODoc ,'Ingrese Número de Documento') ;
    ValidaEdit(dbdtpFEmision ,'Ingrese Fecha de Emisión') ;
    ValidaEdit(dblcBanco ,'Ingrese Caja ó Banco') ;
    ValidaEdit(dblcTMonCab ,'Ingrese Moneda') ;
    ValidaEdit(dbeTCambio ,'Ingrese Tipo de Cambio') ;
    if strtocurr(dbeTCambio.Text) = 0 then
    begin
       dbeTCambio.SetFocus ;
       Raise exception.create('Ingrese Tipo de Cambio') ;
    end ;
    ValidaEdit(dblcClase ,'Ingrese Clase') ;
    ValidaEdit(dblcdAux ,'Ingrese Auxiliar') ;
    ValidaEdit(dbeGiradoA ,'Ingrese Nombre del Cliente') ;
    ValidaEdit(dblcdCnp ,'Ingrese Concepto') ;
    ValidaEdit(dbeGlosa ,'Ingrese Glosa') ;

    //Valida Numero de Documento En caso de Nuevo Documento
    if DM1.wModo='A' then
    begin
       //Búsqueda en CXC303
       xWhere := 'CIAID=''' + dblcCia.Text + ''' ' +
                 ' AND DOCID = '''+ dblcTDoc.Text + ''' ' +
                 ' AND '+DM1.wReplacCeros+'(CCSERIE,'''') = '''+ dbeSerie.Text + ''' ' +
                 ' AND CCNODOC = '''+ dbeNoDoc.Text + ''' ' ;
       if DM1.DisplayDescrip('prvTGE','CXC303','COUNT(*) TOTREG',xWhere,'TOTREG')>'0' then
          Raise Exception.create ('El Número de Documento ya Ha sido Ingresado') ;
       //Búsqueda en CxC301
       if DM1.DisplayDescrip('prvTGE','CXC301','COUNT(*) TOTREG',xWhere,'TOTREG')>'0' then
          Raise Exception.create ('El Número de Documento ya Ha sido Ingresado') ;
    end ;
end;

procedure TFCobModulos.RecuperaDescrip;
begin
		DM1.DescripIngDocs(dblcCia.text, dm1.cdsIngDocs.FieldByName('CCTREC').AsString, dm1.cdsIngDocs.FieldByName('DOCID').AsString, dm1.cdsIngDocs.FieldByName('CCNODOC').AsString, dm1.cdsIngDocs.FieldByName('CCNODOC').AsString );
    Dm1.cdsDescrip.Active := False ;
    Dm1.cdsDescrip.Active := True ;
    with dm1.cdsDescrip do
    begin
       edtCia.Text     := FieldbyName('CIAABR').AsString ;
       edtTDoc.Text    := FieldbyName('DOCABR').AsString ;
       edtBanco.Text   := FieldbyName('BANCOABR').AsString ;
       edtTMonCab.Text := FieldbyName('TMONABR').AsString ;
       edtClase.Text   := FieldbyName('CLAUXABR').AsString ;
       if not dm1.cdsDescrip.FieldByName('FLUEFEABR').isnull then
          dbeFEfec.text := dm1.cdsDescrip.FieldByName('FLUEFEABR').AsString ;

    end ;

end;

procedure TFCobModulos.InHabilitaControles;
begin
   dblcCia.Enabled    := False ;
   dblcTDoc.Enabled   := False ;
   dbeSerie.Enabled   := False ;
   dbeNoDoc.Enabled   := False ;
end;

procedure TFCobModulos.HabilitaControles;
begin
   dblcTDoc.Enabled   := true ;
   dbeSerie.Enabled   := true ;
   dbeNoDoc.Enabled   := true ;
end;

procedure TFCobModulos.AsignaClaveDetalle;
var
   BMK : TBookmark ;
begin
   with dm1.cdsCanjeCxCDoc do
   begin
      BMK := GetBookmark ;
      DisableControls ;
      First ;
      while not eof do
      begin
         Edit ;
         fieldBYName('CIAID').AsString    := dblccia.Text ;
         fieldBYName('TCANJEID').AsString   := 'RC' ;
         fieldBYName('CJEDOCID').AsString   := dblcTDoc.Text ;
         fieldBYName('CJESERIE').AsString  := trim(dbeSerie.Text) ;
         fieldBYName('CJENODOC').AsString  := trim(dbeNoDoc.Text) ;
         Next ;
      end;
      GotoBookmark(BMK) ;
      FreeBookmark(BMK) ;
      EnableControls ;
   end ;
end;

procedure TFCobModulos.dbeSerieChange(Sender: TObject);
begin
   if not TCustomEdit(Sender).Focused then
      Exit ;
   wModifica := True ;
end;

procedure TFCobModulos.dbeNoDocChange(Sender: TObject);
begin
  if not TCustomEdit(Sender).Focused then
     Exit ;
  wModifica := True ;

end;

procedure TFCobModulos.dbdtpFEmisionChange(Sender: TObject);
begin
  if not TCustomEdit(Sender).Focused then
     Exit ;
  wModifica := True ;
end;

procedure TFCobModulos.dbeGlosaChange(Sender: TObject);
begin
  if not TCustomEdit(Sender).Focused then
     Exit ;
  wModifica := True ;
end;

procedure TFCobModulos.AsignaParametros;
var
   xSQL : String ;
begin
   // vhn 23/01/2001
   xSQL:='Select * from CXC303 '
        +'Where CIAID='''  +dblcCia.Text          +''' and '
        +      'DOCID='''  +Trim( dblcTDoc.Text ) +''' and '
        +      'CCSERIE='''+Trim( dbeSerie.Text ) +''' and '
        +      'CCNODOC='''+Trim( dbeNoDoc.Text ) +''' ';
   DM1.cdsIngDocs.Close;
   DM1.cdsIngDocs.DataRequest( xSQL );
   DM1.cdsIngDocs.Open;

   // vhn 22/01/2001
   xSQL:='Select * from CXC304 '
        +'Where CIAID='''   +dblcCia.Text          +''' and '
        +      'DOCID='''   +Trim( dblcTDoc.Text ) +''' and '
        +      'CCSERIE=''' +Trim( dbeSerie.Text ) +''' and '
        +      'CCNODOC=''' +Trim( dbeNoDoc.Text ) +''' ';
   DM1.cdsCanjeCxCDOC.DisableControls;
   DM1.cdsCanjeCxCDOC.Close;
   DM1.cdsCanjeCxCDOC.DataRequest( xSQL );
   DM1.cdsCanjeCxCDOC.Open;
   DM1.cdsCanjeCxCDOC.EnableControls;
end;


procedure TFCobModulos.dbdtpFEmisionExit(Sender: TObject);
var
   xStr : String ;
begin
   if dbdtpFEmision.Date = 0 then
   Begin
      TCustomEdit(Sender).SetFocus ;
      Raise Exception.create('Ingrese Fecha') ;
   end ;
   if trim(dbeTCambio.Text) = '' then
   begin
		 	xSTR := 'FECHA = '+ DM1.wRepFuncDate + '''' + quotedStr(formatdatetime(DM1.wFormatFecha,dbdtpFEmision.date) )+')';
      if dm1.RecuperarDatos('TGE107',DM1.wTipoCambioUsar,xSTR) then
         dbeTCambio.Text :=  dm1.cdsRec.fieldbyname(DM1.wTipoCambioUsar).AsString
      else
         dbeTCambio.Text := '0.00' ;
   end ;
end;

procedure TFCobModulos.ActualizaDetalle;
var
   BMK            : TBookmark ;
begin
   Showmessage('Actualizando detalle') ;
   BMK := dm1.cdsRegCxC.GetBookmark ;
   dm1.cdsregcxc.DisableControls ;
   dm1.cdsRegCxC.First ;
   while not dm1.cdsRegCxC.eof do
   begin
      dm1.cdsRegCxC.Edit ;

      dm1.cdsRegCxC.fieldBYName('TMONID').AsString    := dblcTMonCab.Text ;
      dm1.cdsRegCxC.fieldBYName('DETCDOC').AsString   := dbeTCambio.Text ;
      if dblcTMonCab.Text = dm1.wTMonLoc then
      begin
         DM1.cdsregcxcDEMTOLOC.AsString := Cajadec(CurrtoStr(DM1.cdsregcxcDEMTOORI.AsCurrency)) ;
         DM1.cdsregcxcDEMTOEXT.AsString := Cajadec(Currtostr(DM1.cdsregcxcDEMTOORI.AsCurrency / strtocurr( dbeTCambio.text ))) ;
      end
      else
      begin
         DM1.cdsregcxcDEMTOLOC.AsString := Cajadec(CurrtoStr(DM1.cdsregcxcDEMtoOri.AsCurrency * strtocurr( dbeTCambio.text ))) ;
         DM1.cdsregcxcDEMTOEXT.AsString := Cajadec(CurrtoStr(DM1.cdsregcxcDEMtoOri.AsCurrency )) ;
      end;
      dm1.cdsRegCxC.Next ;
   end;
   dm1.cdsregcxc.GotoBookmark(BMK) ;
   dm1.cdsRegCxC.FreeBookmark(BMK) ;
   dm1.cdsregcxc.EnableControls ;
end;

procedure TFCobModulos.dbgDocCanjeCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
{    if (Field.FieldName = 'CCMTOLOC') or (Field.FieldName = 'CCMTOEXT') then begin
       AFont.Color := clBlue;
    end;}
end;
procedure TFCobModulos.dbgDocCanjeCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'CCMTOLOC') or (AFieldName = 'CCMTOEXT') then
    begin
       ABrush.Color := clNone;
    end;

end;

procedure TFCobModulos.dbgDocCanjeColExit(Sender: TObject);
begin
   if dbgDocCanje.SelectedField.FieldName='CCTCAMCJE' then
   begin
      dbgDocCanje.RefreshDisplay;
   end;

   if dbgDocCanje.SelectedField.FieldName='CCMTOLOC' then
   begin
      if DM1.FRound(DM1.cdsCanjeCxCDocCCMtoLoc.Value,15,2)>DM1.FRound(DM1.cdsCanjeCxCDocCCSalLoc.Value,15,2) then
      begin
         ShowMessage('Monto excede a Saldo Actual');
         DM1.cdsCanjeCxCDoc.Edit;
         DM1.cdsCanjeCxCDocCCMTOLOC.Value:=DM1.cdsCanjeCxCDocCjeAntMN.Value;
         dbgDocCanje.SelectedIndex:=8; // debería ser 9 pero no hace caso
         dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
      end;
   end;

   if dbgDocCanje.SelectedField.FieldName='CCMOEXT' then
   begin
      if DM1.FRound(DM1.cdsCanjeCxCDocCCMtoExt.Value,15,2)>DM1.Fround(DM1.cdsCanjeCxCDocCCSalExt.Value,15,2) then
      begin
         ShowMessage('Monto excede a Saldo Actual');
         DM1.cdsCanjeCxCDoc.Edit;
         DM1.cdsCanjeCxCDocCCMTOExt.Value:=DM1.cdsCanjeCxCDocCjeAntME.Value;
         dbgDocCanje.SelectedIndex:=9; // debería ser 9 pero no hace caso
         dbgDocCanje.SelectedIndex:=10; // debería ser 9 pero no hace caso
      end;
   end;
end;

procedure TFCobModulos.dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFCobModulos.dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   If Target=dbgpendientes Then
   Begin
      With DM1 do
      Begin
         cdsMovCxC.Filtered:=False;
         if cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG' ,
                                    VarArrayOf([
                                                dm1.cdsCanjeCxCDocCiaID.AsString ,
                                                dm1.cdsCanjeCxCDocTDiarID.AsString ,
                                                dm1.cdsCanjeCxCDocCCAnoMM.AsString ,
                                                dm1.cdsCanjeCxCDocCCNoReg.AsString
                                                ]),[]) then
         begin
            cdsMovCxC.Edit;
            DM1.cdsMovCxCTCanjeID.Value:='';
            DM1.cdsMovCxCCCCanje.Value :='';
            DM1.cdsMovCxCCCSalExt.Value := DM1.cdsMovCxCCCMtoExt.Value - DM1.cdsMovCxCCCPagExt.Value ;
            DM1.cdsMovCxCCCSalLoc.Value := DM1.cdsMovCxCCCMtoLoc.Value - DM1.cdsMovCxCCCPagLoc.Value ;

            DM1.cdsMovCxC.Post;
            cdsCanjeCxCDoc.Delete;
         end;
         cdsMovCxC.Filtered:=True;
      end;
      wmodifica:=True;
   end;
end;

procedure TFCobModulos.dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocCanje.BeginDrag(False);
end;

procedure TFCobModulos.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFCobModulos.dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
var
  I: integer;
begin
   With DM1 do
   Begin
      If Target=dbgDocCanje Then
      Begin
         DM1.cdsMovCxC.DisableControls;

         cdsCanjeCxCDoc.DisableControls;
         for i:= 0 to dbgPendientes.SelectedList.Count-1 do
         begin
             dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);
             if not cdsCanjeCxCDoc.Locate('CIAID;CJEDOCID;CJESERIE;CJENODOC;TDIARID;CCANOMM;CCNOREG' ,
                                       VarArrayOf([DM1.cdsMovCxCCiaID.AsString,
                                                   dblcTDoc.text ,
                                                   trim(dbeSerie.text) ,
                                                   trim(dbeNoDoc.Text) ,
                                                   DM1.cdsMovCxCTDiarID.AsString,
                                                   DM1.cdsMovCxCCCAnoMes.AsString,
                                                   DM1.cdsMovCxCCCNoReg.AsString
                                                   ]),[]) then
             begin
                cdsCanjeCxCDoc.Insert ;
                cdsCanjeCxCDocCiaID.Value             := cdsMovCxCCiaID.Value    ;
                cdsCanjeCxCDocTDiarID.Value           := cdsMovCxCTDiarID.Value  ;
                cdsCanjeCxCDocCCNoReg.Value           := cdsMovCxCCCNoReg.Value  ;

                cdsCanjeCxCDocCCAAAA.Value            := cdsMovCxCCCAAAA.Value   ;
                cdsCanjeCxCDocCCAnoMM.Value           := cdsMovCxCCCAnoMes.Value ;
                cdsCanjeCxCDocClieID.Value            := cdsMovCxCClieID.Value   ;
                cdsCanjeCxCDocClieRuc.Value           := cdsMovCxCClieRuc.Value  ;
                cdsCanjeCxCDocDocID.Value             := cdsMovCxCDocID.Value    ;
                cdsCanjeCxCDoclkDocID.Value           := cdsMovCxClkDocID.Value  ;
                cdsCanjeCxCDocCCSerie.Value           := cdsMovCxCCCSerie.Value  ;
                cdsCanjeCxCDocCCNoDoc.Value           := cdsMovCxCCCNoDoc.Value  ;
//                cdsCanjeCxCDocTCanjeId.Value := 'OC';  // Orden de Cobranza

                cdsCanjeCxCDocTCanjeId.Value := 'RC';  // Recibo de Caja
                cdsCanjeCxCDocCJEDOCID.AsString       :=  dblcTDoc.text          ;
                cdsCanjeCxCDocCJESERIE.AsString       :=  dbeSerie.Text          ;
                cdsCanjeCxCDocCJENODOC.AsString       :=  dbeNoDoc.Text          ;

                cdsCanjeCxCDocCCFCanje.Value          := cdsMovCxCCCFCanje.Value ;
                cdsCanjeCxCDocTMonID.Value            := cdsMovCxCTMonID.Value   ;

                cdsCanjeCxCDocCCMtoOri.Value := FRound(cdsMovCxCCCMtoOri.Value,15,2)  ;
                cdsCanjeCxCDocCCMtoLoc.Value := FRound(cdsMovCxCCCSalLoc.Value,15,2)  ;
                cdsCanjeCxCDocCCMtoExt.Value := FRound(cdsMovCxCCCSalExt.Value,15,2)  ;

                cdsCanjeCxCDocCjeAntMN.Value := 0 ;
                cdsCanjeCxCDocCjeAntME.Value := 0 ;
                cdsCanjeCxCDocCCTCamDoc.Value:= FRound(cdsMovCxCCCTCamPr.Value,8,3);
                cdsCanjeCxCDocCCTCamcje.Value:= FRound(strtofloat(dbeTCambio.Text),8,3);
                cdsCanjeCxCDocCtaTotal.Value := cdsMovCxCCtaTotal.Value;
                cdsCanjeCxCDocCptoTot.Value  := cdsMovCxCCCptoTot.Value;
                cdsCanjeCxCDocCCFVcmto.Value := cdsMovCxCCCFVcmto.Value;
                cdsCanjeCxCDocCCUser.Value  := DM1.wUsuario;
                cdsCanjeCxCDocCCFReg.Value  := date;
                cdsCanjeCxCDocCCHReg.Value  := time;

                cdsMovCxC.Edit;
                cdsMovCxCCCSALLOC.Value := 0 ;
                cdsMovCxC.Post;
             end;
             dbgPendientes.datasource.dataset.Freebookmark(dbgPendientes.SelectedList.items[i]);
         end; // for
         dbgPendientes.SelectedList.clear;  { Clear selected record list since they are all deleted}
         cdsCanjeCxCDoc.EnableControls;
         cdsMovCxC.EnableControls;
         z2bbtnSumat.click;
         wmodifica:=True;
      end; // target
   end; // DM1
end;

procedure TFCobModulos.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgPendientes.BeginDrag(False);
end;

procedure TFCobModulos.ActualizaSaldos;
var
    xRegAct : TBookmark ;
    xPagLoc ,
    xPagExt : Currency ;
begin
    DM1.cdsMovCxC.DisableControls;
    DM1.cdsMovCxC.Filtered:=False;
    DM1.cdsCanjeCxCDoc.DisableControls;
    xRegAct := DM1.cdsCanjeCxCDoc.GetBookmark;
    DM1.cdsCanjeCxCDoc.First;
    While not DM1.cdsCanjeCxCDoc.Eof do
    Begin
       DM1.cdsCanjeCxCDoc.Edit ;
       if DM1.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
                                VarArrayOf([DM1.cdsCanjeCxCDocCiaId.AsString,
                                            DM1.cdsCanjeCxCDocTDiarID.AsString,
                                            DM1.cdsCanjeCxCDocCCAnoMM.AsString,
                                            DM1.cdsCanjeCxCDocCCNoReg.AsString]),
                                []) then
       begin
          DM1.cdsMovCxC.edit;
          If DM1.cdsMovCxCTMonID.Value=DM1.wTMonLoc then
          begin
             xPagLoc := DM1.FRound(DM1.cdsCanjeCxCDocCCMtoLoc.Value-DM1.cdsCanjeCxCDocCjeAntMN.Value,15,2);
             DM1.cdsMovCxCCCSalLoc.Value := DM1.FRound(DM1.cdsMovCxCCCSalLoc.Value-xPagLoc,15,2);
             DM1.cdsMovCxCCCSalExt.Value := DM1.FRound(DM1.cdsMovCxCCCSalLoc.Value/DM1.cdsCanjeCxCDocCCTCAMCje.Value,15,2);
          end
          else
          begin
             xPagExt := DM1.FRound(DM1.cdsCanjeCxCDocCCMtoExt.Value-DM1.cdsCanjeCxCDocCjeAntME.Value,15,2);
             DM1.cdsMovCxCCCSalExt.Value := DM1.FRound(DM1.cdsMovCxCCCSalExt.Value-xPagExt,15,2);
             DM1.cdsMovCxCCCSalLoc.Value := DM1.FRound(DM1.cdsMovCxCCCSalExt.Value*DM1.cdsCanjeCxCDocCCTCAMCje.Value,15,2);
          end;
          DM1.cdsMovCxC.post;
       end;
       DM1.cdsCanjeCxCDoc.Next;
    end;
    DM1.cdsCanjeCxCDoc.GotoBookmark(xRegAct);
    DM1.cdsCanjeCxCDoc.FreeBookmark(xRegAct);
    DM1.cdsCanjeCxCDoc.EnableControls;
    DM1.cdsMovCxC.Filtered:=True;
    DM1.cdsMovCxC.EnableControls;
end;

procedure TFCobModulos.FormDestroy(Sender: TObject);
begin
   cf1.Free ;
end;

procedure TFCobModulos.dblcdFEfecEnter(Sender: TObject);
begin
   strTmp := dblcdFEfec.Text ;
end;

procedure TFCobModulos.dblcdFEfecExit(Sender: TObject);
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

procedure TFCobModulos.ActualizaFiltro;
begin
   // por definicion de esta operacion siempre s e edita y no se
   // adiciona --WMC
   dm1.ActualizaCDS( dm1.cdsIngDocs , cdsFiltro ) ;
end;

procedure TFCobModulos.AsignaCDSFiltro(cds: TwwClientDataset);
begin
    cdsFiltro := cds ;
end;

end.



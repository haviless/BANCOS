unit Caja254;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, StdCtrls, Buttons, Mask, wwdbedit, wwdblook, ExtCtrls,
  CajaDM, Wwdbdlg, wwclient,db, Variants, oaVariables;

type
  TFAnulCheque = class(TForm)
    pnlCabecera1: TPanel;
    lblCia: TLabel;
    lblFComp: TLabel;
    lblTDiario: TLabel;
    lblPeriodo: TLabel;
    lblNoComp: TLabel;
    lblBanco: TLabel;
    lblCCBco: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    edtPeriodo: TEdit;
    dbeNoComp: TwwDBEdit;
    z2bbtnOKCab: TBitBtn;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TEdit;
    dblcCCBco: TwwDBLookupCombo;
    dbdtpFComp: TwwDBDateTimePicker;
    pnlCabecera2: TPanel;
    lblProvDes: TLabel;
    lblImporte: TLabel;
    lblLote: TLabel;
    lblGlosa: TLabel;
    lblConcepto: TLabel;
    lblTCambio: TLabel;
    lblNoChq: TLabel;
    lblFormPago: TLabel;
    lblCuenta: TLabel;
    lblTMon: TLabel;
    Label24: TLabel;
    Label23: TLabel;
    lblProvRuc: TLabel;
    Label18: TLabel;
    dblcdCnp: TwwDBLookupComboDlg;
    z2bbtnOK: TBitBtn;
    dbeGiradoA: TwwDBEdit;
    dbeImporte: TwwDBEdit;
    dbeLote: TwwDBEdit;
    dbeGlosa: TwwDBEdit;
    dbeTCambio: TwwDBEdit;
    dbeNoChq: TwwDBEdit;
    dblcFormPago: TwwDBLookupCombo;
    edtFormPago: TEdit;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    dbdtpFEmis: TwwDBDateTimePicker;
    edtCuenta: TwwDBLookupComboDlg;
    dblcClase: TwwDBLookupCombo;
    edtClase: TEdit;
    dblcdAux: TwwDBLookupComboDlg;
    edtAuxRuc: TEdit;
    lblEstado: TLabel;
    z2bbtnNuevo: TBitBtn;
    z2bbtnCancel: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure dbeLoteExit(Sender: TObject);
    procedure dbeLoteChange(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcCCBcoExit(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dblcClaseExit(Sender: TObject);
    procedure dblcdAuxExit(Sender: TObject);
    procedure dbeGiradoAChange(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure dbeNoChqChange(Sender: TObject);
    procedure dbdtpFEmisEnter(Sender: TObject);
    procedure dbdtpFEmisExit(Sender: TObject);
    procedure dbeTCambioChange(Sender: TObject);
    procedure dbeTCambioEnter(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure dbeImporteChange(Sender: TObject);
    procedure dbeImporteEnter(Sender: TObject);
    procedure dbeImporteExit(Sender: TObject);
    procedure dblcdCnpExit(Sender: TObject);
    procedure dbeGlosaChange(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure z2bbtnNuevoClick(Sender: TObject);
    procedure dbeNoChqExit(Sender: TObject);
  private
    { Private declarations }
    xVoucher : String;
    cf1: TControlFoco;
    strTmp: String;    
    A2digitos ,A4digitos : Array of TWinControl ;
    cdsConceptoC1 : TwwClientDataset ;
    cdsFiltro   : TwwClientDataset;
    xGraboNuevo : Boolean ;
    xTC: Double;
    wFechaCierre: TDatetime;
    wFrecu      : Integer;
    procedure IniciaDatos;
    function ValidacionCabecera: Boolean;
    procedure ValidaCabecera2;
    procedure AdicIniciaDatos;            
  public
    { Public declarations }
    procedure Adiciona ;
    procedure Edita(Comp: structComprobante;cds : Twwclientdataset);
    procedure AsignaCDSFiltro(cds: TwwClientDataset);
    procedure RecuperaDescrip;
    Procedure CambiaEstado(xName:char);

  end;

var
  FAnulCheque: TFAnulCheque;
  wmodifica: Boolean;  


implementation


uses CAJAUTIL;

{$R *.DFM}

procedure TFAnulCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
var xSQL:string;
begin

   // Limpiamos los filtros
   with DMTE do
   begin
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

      cdsConsulta.IndexFieldNames:='';
      cdsConsulta.Filter:='';
      cdsConsulta.Filtered:= False;
      cdsConsulta.Close;

      cdsRetencion.IndexFieldNames:='';
      cdsRetencion.Filter:='';
      cdsRetencion.Filtered := False;
      cdsRetencion.Close;

      cdsTrans.IndexFieldNames :='';
      cdsTrans.Filter   := '';
      cdsTrans.Filtered := False;

       cf1.QuitarExits(self) ;
   end ;
   DMTE.cdsRetencion.Filter:='';
   DMTE.cdsRetencion.Filtered := false;
   DMTE.cdsRetencion.IndexFieldNames := '';

   edtCuenta.Enabled := False ;
   if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='X' then
   begin
     DMTE.cdsEgrCaja.Delete;
     xSQL:='Select * from CAJA302 '
                          +'Where CIAID='''   +dblcCia.Text    +''' and '
                          +      'ECANOMM=''' +edtPeriodo.Text +''' and '
                          +      'TDIARID=''' +dblcTDiario.Text+''' and '
                          +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
     DMTE.cdsEgrCaja.DataRequest( xSQL );
     DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

   end;

   FVariables.w_Num_Formas:=FVariables.w_Num_Formas-1;
   Action:=caFree;
end;

procedure TFAnulCheque.FormCreate(Sender: TObject);
begin
   DMTE.ASignaTipoDiario(dblcTDiario,self) ;
   setLength(A2digitos,1) ;
   setLength(A4digitos,1) ;
   A2digitos[0] := dbeImporte ;
   A4digitos[0] := dbeTcambio ;

   cdsConceptoC1 := TwwClientdataset.Create(Self) ;
   cdsConceptoC1.CloneCursor(DMTE.cdsCnpEgr ,True) ;
   cdsConceptoC1.Name := 'cdsConceptoC1' ;
   cdsConceptoC1.Filtered := True ;

   cf1 := TControlFoco.Create ;
   DMTE.cdsFEfec.Filter := 'FLUEFE_IS = ''S'' ' ;
   DMTE.cdsFEfec.Filtered := True ;

end;

procedure TFAnulCheque.FormDestroy(Sender: TObject);
begin
   cf1.Free ;
end;

procedure TFAnulCheque.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFAnulCheque.FormShow(Sender: TObject);
var
 xwhere,xsql : string;
   Comp : structComprobante ;
begin
   if DMTE.wModo='A' then
   begin
      Adiciona ;
   end
   else
   begin
     Edita( Comp, DMTE.cdsEgrCaja );
   end;
   with DMTE do
   begin
      if Trim(dblcBanco.Text) <> '' then
      begin
          if cdsEgrCaja.FieldByName('ECESTADO').Value='I' then//Si está INCOMPLETO o PENDIENTE
          begin
                //focus
                pnlCabecera2.setfocus ;
                perform(CM_DialogKey,VK_TAB,0);
                //
          end;

          if ( cdsEgrCaja.FieldByName('ECESTADO').Value='C' ) or
             ( cdsEgrCaja.FieldByName('ECESTADO').Value='A' ) then      //Si está CANCELADO
          begin
               //focus
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
   end ;

   xsql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
   DMTE.cdsCCosto.Close;
   DMTE.cdsCCosto.DataRequest(xsql);
   DMTE.cdsCCosto.open;
   xVoucher := '';
   If DMTE.cdsFormPago.RecordCount = 1 then
   begin
      dbdtpFEmis.Enabled  := True ;
      xWhere:='FPAGOID='+quotedstr(dblcFormPago.text);
      if DMTE.DisplayDescrip('prvQry2','TGE112','FCANJE',xWhere,'FCANJE') = 'S' then
         edtCuenta.Enabled := True
      else
         edtCuenta.Enabled := False ;
   end;
   dbeLote.text := '000';
   dbeLote.OnExit(self);

   cf1.PonerExits ;

end;

procedure TFAnulCheque.AsignaCDSFiltro(cds: TwwClientDataset);
begin
    cdsFiltro := cds ;
end;

procedure TFAnulCheque.Adiciona;
var
   xSQL : String ;
begin
 //Código Nuevo
   IniciaDatos ;

   dblcCCBco.Selected.Clear;
   dblcCCBco.Selected.Add('CCBCOID'#9'25'#9'Cuenta Corriente del Banco'#9'F');
   dblcCCBco.Selected.Add('CCBCODES'#9'30'#9'Descripción'#9'F');
   dblcCCBco.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');

   edtCuenta.Enabled := False ;
   xGraboNuevo := False ;
   //Validacion Adicional

   //
   DMTE.cdsRegCxP.Filter := 'CIAID=''''' ;
   DMTE.cdsRegCxP.Filtered := True ;

   xTC := 0 ;
   DMTE.RecuperaCierre( wFechacierre , wFrecu ) ;

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

procedure TFAnulCheque.IniciaDatos;
var
    xSQL : string;
begin

   pnlCabecera1.Enabled  := True;
   pnlCabecera2.Enabled  := False;

   // Estado de variables Botones

   // Estado de Botones
   z2bbtnOk.Enabled        := False;
   z2bbtnCancel.Enabled    := False;
   //
   dblcCia.Text      := '';   // Código de Compañía
   edtCia.Text       := '';   // Descripción de la Compañía
   edtPeriodo.Text   := '';   // Periodo
   dblcTDiario.Text  := '';   // Tipo de Diario
   edtTDiario.Text   := '';   // Descripción del T.Diario
   dbeNoComp.Text    := '';   // Voucher
   dbeGiradoA.Text   := '';    // Pago Girado A ....
   dblcTMon.Text     := '';   // Tipo de Moneda
   edtTMon.Enabled   := False;
   edtTMon.Text      := '';   // Descripción de la Moneda
   dbeTCambio.Text   := '';   // Tipo de Cambio
	 dbeImporte.Text   := '';   // Monto a pagar
	 dblcBanco.Text    := '';   // Código de Banco
   edtBanco.Enabled  := False;
   edtBanco.Text     := '';   // Descripción de Banco
   dblcCCBco.Enabled := False;
   dblcCCBco.Text    := '';   // Cuenta Corriente del Banco
	 edtCuenta.Enabled := False;
   edtCuenta.Text    := '';   // Descripción de la Cuenta Contable Principal
   dblcFormPago.Enabled := False;   // Forma de Pago
   dblcFormPago.Text := '';   // Forma de Pago
   edtFormPago.Enabled  := False;
   edtFormPago.Text  := '';   // descripción de forma de pago
   dbeNoChq.Enabled  := False;
   dbeNoChq.Text     := '';   // Cheque
   dbeLote.Text      := '';   // Lote
   dblcdCnp.Text      := '';   // Concepto
   dbeGlosa.Text     := '';   // Glosa
   dbeGlosa.Text     := '';   // Glosa
   dbdtpFEmis.Date := 0 ;
   lblEstado.Caption := '';   //Inicializar el Estado
   wmodifica         := False;

   // Estableciendo el filtro para que el detalle del grid aparezca vacio
    z2bbtnOkCab.Enabled := True ;
end;

procedure TFAnulCheque.Edita(Comp: structComprobante;cds : Twwclientdataset);
var
   xWhere ,
   xFiltro : String ;
   xSQL : string;
begin
	 IniciaDatos;
   cdsfiltro :=  cds ;
   with DMTE do
   begin
      dblcCia.Text      :=  cdsEgrCaja.FieldByName('CIAID').AsString;
      dblcTDiario.Text  :=  cdsEgrCaja.FieldByName('TDIARID').AsString;
      edtPeriodo.Text   :=  cdsEgrCaja.FieldByName('ECANOMM').AsString;
      dbeNoComp.Text    :=  cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
      // Asignar desde valores del registro activo
      dbdtpFComp.date  :=cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
      dblcClase.Text   :=cdsEgrCaja.FieldByName('CLAUXID').AsString;
      dblcdAux.Text    :=cdsEgrCaja.FieldByName('PROV').AsString;
      edtAuxRuc.Text   :=cdsEgrCaja.FieldByName('PROVRUC').AsString;
      dbeGiradoA.Text  :=cdsEgrCaja.FieldByName('ECGIRA').AsString;
      dblcTMon.Text    :=cdsEgrCaja.FieldByName('TMONID').AsString;
      dbeTCambio.Text  :=cdsEgrCaja.FieldByName('ECTCAMB').AsString;
      xTC              := cdsEgrCaja.FieldByName('ECTCAMB').AsFloat ;
      dbeImporte.Text  :=cdsEgrCaja.FieldByName('ECMTOORI').AsString;
      dblcBanco.Text   :=cdsEgrCaja.FieldByName('BANCOID').AsString;
      dblcCCBco.Text   :=cdsEgrCaja.FieldByName('CCBCOID').AsString;
      edtCuenta.Text   :=cdsEgrCaja.FieldByName('CUENTAID').AsString;
      dblcFormPago.Text:=cdsEgrCaja.FieldByName('FPAGOID').AsString;
      dbeNoChq.Text    :=cdsEgrCaja.FieldByName('ECNOCHQ').AsString;
      dbeLote.Text     :=cdsEgrCaja.FieldByName('ECLOTE').AsString;
      dblcdCnp.Text    :=cdsEgrCaja.FieldByName('CPTOID').AsString;
      dbeGlosa.Text    :=cdsEgrCaja.FieldByName('ECGLOSA').AsString;
      dbdtpFEmis.date  :=cdsEgrCaja.FieldbyName('ECFEMICH').AsDateTime ;
      RecuperaDescrip ;

      if cdsEgrCaja.FieldByName('ECESTADO').Value='A' then      // Si esta ANULADO
      begin
         CambiaEstado('A');
      end;

   end;
   z2bbtnOkCab.enabled:=false;
   z2bbtnCancel.Visible := False ;
   wmodifica:=False;
end;

procedure TFAnulCheque.RecuperaDescrip;
var
	 CLAUXID ,
	 AUXID   : sTRING ;
begin
		DMTE.DescripPagoVaProv(dblcCia.text,edtPeriodo.text,dblcTDiario.Text,dbeNoComp.text);
		DMTE.cdsDescrip.Active := False ;
		DMTE.cdsDescrip.Active := True ;
		edtTMon.text     := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('TMONABR'));
		edtBanco.text    := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('BANCOABR'));
		edtFormPago.text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('FPAGOABR'));
		if DMTE.cdsEmpleado.Locate('USERID',VARARRAYOF([DMTE.cdsEgrCaja.FIELDBYNAme('USERRESP').AsString ]),[]) then
		begin
			 CLAUXID  := DMTE.cdsEmpleado.FIELDBYNAME('CLAUXID').AsString   ;
			 AUXID    := DMTE.cdsEmpleado.FIELDBYNAME('AUXID').AsString   ;

		end ;
		edtCia.Text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('CIADES'));
		edtTDiario.Text := DMTE.FieldNoNulo(DMTE.cdsDescrip.fieldBYname('TDIARABR')); ;

	 edtClase.text := DMTE.DisplayDescrip('prvTGE','TGE102','*','CLAUXCP='+quotedstr('B'),'CLAUXDES');
end;
Procedure TFAnulCheque.CambiaEstado(xName:char);
begin
   case xName of
     'I':begin  //Si está INCOMPLETO o PENDIENTE
            lblEstado.Caption    :='Activo             ';
            pnlCabecera1.Enabled := False;
            pnlCabecera2.Enabled := True;
            z2bbtnOk.Enabled       := True;
            z2bbtnCancel.Enabled   := True;

         end;

     'C':begin
            pnlCabecera1.Enabled := False;    // Desactivar Panel1
            pnlCabecera2.Enabled := False;    // Desactivar Panel2
            z2bbtnOk.Enabled       := False;
            z2bbtnCancel.Enabled   := False;

            if DMTE.cdsEgrCaja.FieldByName('ECCONTA').Value='S' then
            begin  //Esta contabilizado
               lblEstado.Caption  :='Cancelado y Contab.'
            end
            else
            begin
               lblEstado.Caption  :='Cancelado          ';
            end;
         end;

     'A':begin
            lblEstado.Caption     :='Anulado            ';
            pnlCabecera1.Enabled := False;    // Desactivar Panel1
            pnlCabecera2.Enabled := False;    // Desactivar Panel2

            z2bbtnOk.Enabled        := False;
            z2bbtnCancel.Enabled    := False;

         end;

     'N':begin
            lblEstado.Caption:='Nuevo     ';
            pnlCabecera1.Enabled := false;
            pnlCabecera2.Enabled := True;


            z2bbtnOk.Enabled       := True;
            z2bbtnCancel.Enabled   := True;

         end;
   end;
end;







procedure TFAnulCheque.dbeLoteExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then
      exit;

   dbeLote.text:=DMTE.StrZero(dbeLote.text,DMTE.cdsEgrCaja.FieldByName('ECLOTE').DisplayWidth);

end;

procedure TFAnulCheque.dbeLoteChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFAnulCheque.dblcCiaExit(Sender: TObject);
begin
   edtCia.text:= DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIADES') ;

   if edtCia.Text='' then begin
      ShowMessage('Error : Compañía no Valida');
      dblcCia.SetFocus;
      Exit;
   end;

   DMTE.abreCuentas(dblcCia.text) ;

end;

procedure TFAnulCheque.dblcBancoExit(Sender: TObject);
begin
  if dblcCia.Focused then Exit;

  edtBanco.text:=DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr,'BANCOID',dblcBanco.Text,'BANCOABR') ;

  if edtBanco.Text='' then begin
     dblcBanco.Value:= '';
     edtBanco.Text  := '';
     ShowMessage('Error : Banco no Valido');
     dblcBanco.SetFocus;
     Exit;
  end;

  dblcCCBco.Text:= '' ;
  edtCuenta.Text:= '' ;
  dblcdCnp.Text := '' ;
  dbeGlosa.Text := '' ;
  dblcTMon.Text := '' ;
  edtTMon.Text  := '' ;
  if DMTE.cdsbancoegr.FieldByName('BCOTIPCTA').Value='C' then
  begin //Si es CAJA
     dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco.text),'CCBCOVOUCH');
     dblcTDiario.OnExit(dblcTDiario);
     dblcCCBco.Enabled:=False;
     dblcTMon.Enabled := True ;
     edtCuenta.Text := DMTE.DisplayDescrip('prvTGE','TGE105','CUENTAID','BANCOID='+quotedstr(dblcBanco.text),'CUENTAID');
     dblcdCnp.text  := DMTE.DisplayDescrip('prvTGE','TGE105','CPTOID','BANCOID='+quotedstr(dblcBanco.text),'CPTOID');
     dbeGlosa.Text  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTODES','CPTOID='+quotedstr(dblcdCnp.text),'CPTODES');
     DMTE.cdsFormPago.Filter := 'FCEGR=''1'' or FCEGR=''S'' ' ;
     DMTE.cdsFormPago.Filtered := True ;
  end
  else begin  //Si es BANCO
     dblcCCBco.Enabled:=True;
     dblcTMon.Enabled := False ;
     dblcFormPago.Enabled := False ;
     DMTE.cdsCCBco.Filtered:=False;
     DMTE.cdsCCBco.Filter:='';   //Filtrar la lista de CtaCte por Banco
     DMTE.cdsCCBco.Filter:='BANCOID='+''''+dblcBanco.Text+''''+' AND CIAID='+quotedstr(dblcCia.text);
     DMTE.cdsCCBco.Filtered:=True;
     //filtrar los tipos de pago
     DMTE.cdsFormPago.Filter := 'FCBCO=''1'' or FCBCO=''S'' ' ;
     DMTE.cdsFormPago.Filtered := true ;

     dblcCCBco.setfocus;
  end;
  if DMTE.cdsFormPago.RecordCount > 1 then
  begin
     dblcFormPago.Enabled := True;
     dblcFormPago.text := '' ;
     edtFormPago.text := '' ;
  end
  else
     dblcFormPago.Enabled := False;

  dblcFormPago.text := DMTE.cdsFormPago.FieldByName('FPAGOID').AsString;
  dbeNoChq.Text := '' ;
  wmodifica:=True;

end;

procedure TFAnulCheque.dblcCCBcoExit(Sender: TObject);
var
   Tmp : String ;
begin

	if dblcCia.Focused   then Exit;
	if dblcBanco.Focused then Exit;

   tmp:=DMTE.DisplayDescripLocal(DMTE.cdsCCBco,'CCBCOID',dblcCCBco.Text,'CCBCOID') ;

	if Tmp='' then
	begin
      edtCuenta.Text:= '' ;
      dblcdCnp.Text := '' ;
      dbeGlosa.Text := '' ;
      ShowMessage('Error : Cuenta Corriente No Valida');
		dblcccbco.SetFocus;
		exit;
	end;

	dblcTmon.Text := DMTE.cdsCCBco.fieldbyname('TMONID').AsString ;
	edtTMon.Text  := DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMon.text,'TMONDES') ;
	dbeNOChq.Text := '' ;

   //edtCCBco.Text := DMTE.cdsCCBco.fieldbyname('CCBCODES').AsString ;
   edtCuenta.Text:= DMTE.cdsCCBco.fieldbyname('CTAPRINC').AsString ;
   dblcdCnp.Text := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID','CPTOID='+quotedstr(DMTE.cdsCCBco.fieldbyname('CPTOID').AsString),'CPTOID');
   dbeGlosa.Text := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTODES','CPTOID='+quotedstr(dblcCCBco.text),'CPTODES');  //  DMTE.cdsCCBcoLKGLOSA.AsString ;
   xVoucher      := DMTE.cdsCCBco.fieldbyname('CCBCOVOUCH').AsString;
           //**
   If DMTE.wModo = 'A' then
   begin
      dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco.text)+' AND CCBCOID='+quotedstr(dblcCCBco.text),'CCBCOVOUCH');
      dblcTDiario.OnExit(dblcTDiario);
   end;

   if DMTE.cdsFormPago.RecordCount = 1 then
      dblcformpago.Enabled := false
   else
      dblcformpago.Enabled := true;

   wmodifica:=True;

end;

procedure TFAnulCheque.dbdtpFCompExit(Sender: TObject);
begin
   if dblcCia.Focused   then Exit;
   if dblcBanco.Focused then Exit;
   if dblcCCBco.Focused then Exit;

   if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, dblcCCBco.text, dbdtpFComp.Date ) then
   begin
     Showmessage('Error : Mes de Fecha Fue Cerrado. Verificar...');
     dbdtpFComp.SetFocus;
     Exit;
   end;

   if not DiaAperturado(dblcCia.text,dbdtpFComp.Date,dblcBanco.text) then
   Begin
     dbdtpFComp.setfocus;
     exit;
   End;

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
   end;

end;

procedure TFAnulCheque.dbeNoCompExit(Sender: TObject);
begin
   dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').DisplayWidth);
end;

procedure TFAnulCheque.z2bbtnOKCabClick(Sender: TObject);
var
		xWhere : String ;
	 xSQL : string;
begin

	 if validacionCabecera = False then
			exit;

	 dbeTCambio.text   := DMTE.RecuperarTipoCambio(dbdtpFComp.date) ;
	 //dbeGiradoA.text   := DMTE.cdsBancoEgr.FieldByName('BANCONOM').AsString;

	 dblcClase.text := DMTE.DisplayDescrip('prvTGE','TGE102','*','CLAUXCP='+quotedstr('B'),'CLAUXID');
	 edtClase.text  := DMTE.cdsQry.fieldByname('CLAUXDES').AsString;
	 if edtClase.text= '' then begin
			ShowMessage( 'Error : No Existe Clase de Auxiliar de bancos');
			exit;
	 end;

		xSQL:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+'''';
		DMTE.cdsAux.Close;
		DMTE.cdsAux.DataRequest( xSQL ) ;
		DMTE.cdsAux.Open;


	 with DMTE do
	 begin
			xWhere :=  'CIAID ='+''''+dblcCia.Text+''''
								+' AND TDIARID ='+''''+dblcTDiario.Text+''''
								+' AND ECANOMM ='+''''+edtPeriodo.Text+''''
								+' AND ECNOCOMP ='+''''+dbeNoComp.Text +'''';
			if DMTE.DisplayDescrip('prvTGE','CAJA302','COUNT(*) TOTREG',xWhere,'TOTREG') > '0' then
			begin
						 ShowMessage('Comprobante ya esta Registrado');
						 dbeNoComp.Text:='';
						 dbeNoComp.SetFocus;
						 exit;
			end
			else
			begin
				cdsEgrCaja.Insert;
				CambiaEstado('N');
			end;
	 end;
	 (Sender as tcontrol).enabled:=false;
	 perform(CM_DialogKey,VK_TAB,0);
	 wmodifica:=False;


end;

function TFAnulCheque.ValidacionCabecera: Boolean;
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


procedure TFAnulCheque.dblcTDiarioExit(Sender: TObject);
var xWhere:string;
begin
   edtTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE104','TDIARDES','TDIARID='+quotedstr(dblcTDiario.text),'TDIARDES');
   if trim(edtTDiario.Text) <> '' then
      if trim(edtTDiario.Text) <> '' then
      begin
         xWhere:='CIAID='+''''+dblcCia.Text+''''+' AND ECANOMM='+
                ''''+edtPeriodo.Text+''''+' AND TDIARID='+''''+
                dblcTDiario.Text+'''';
         dbeNoComp.text:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      end ;

end;

procedure TFAnulCheque.dblcClaseExit(Sender: TObject);
var
   xSQLx : string ;
begin

   edtClase.text:= DMTE.DisplayDescripLocal(DMTE.cdsClaseAux,'CLAUXID',dblcClase.Text,'CLAUXDES') ;

{   if edtClase.Text='' then
   begin
      dblcdAux.Text  := '' ;
		edtAuxRUC.Text := '' ;
      dbeGiradoA.Text:= '' ;
      ShowMessage('Error : Clase de Auxiliar');
      dblcClase.SetFocus;
      Exit;
   end;}

   xSQLx:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+'''';
   DMTE.cdsAux.Close;
   DMTE.cdsAux.DataRequest( xSQLx ) ;
   DMTE.cdsAux.Open;

   dblcdAux.Selected.Clear;
   dblcdAux.Selected.Add('AUXID'#9'13'#9'Auxiliar'#9'F');
   dblcdAux.Selected.Add('AUXRUC'#9'13'#9'R.U.C'#9'F');
   dblcdAux.Selected.Add('AUXABR'#9'15'#9'Abreviatura'#9'F');
   dblcdAux.Selected.Add('AUXNOMB'#9'20'#9'Nombre Auxiliar'#9'F');

end;

procedure TFAnulCheque.dblcdAuxExit(Sender: TObject);
var
	 xWhere : String;
begin
	 xWhere := 'CLAUXID='''+dblcClase.text+''' and AUXID='+quotedstr(dblcdAux.text);
	 edtAuxRUC.text := DMTE.DisplayDescrip('prvTGE','CNT201','AUXRUC,AUXGIRA,AUXNOMB,AUXDIR',xWhere,'AUXRUC');
	 dbeGiradoA.Text := DMTE.cdsQry.FieldByName('AUXNOMB').Asstring;

{	 if trim( dbeGiradoA.Text )='' then begin
			ShowMessage( 'Error : No Existe Banco' );
			dblcdAux.SetFocus;
	 end;   }

end;

procedure TFAnulCheque.dbeGiradoAChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFAnulCheque.dblcTMonExit(Sender: TObject);
var
   xWhere :String;
begin
   if z2bbtnCancel.Focused then exit;

   edtTMon.text:= DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMon.Text,'TMONDES') ;

   if edtTMon.Text='' then begin
      edtTmon.text   :='';
      dbeTCambio.Text:='';
      dblcTMon.Text  :='';
      ShowMessage('Error : Moneda no Valida');
      dblcTMon.SetFocus;
      Exit;
   end;

end;

procedure TFAnulCheque.dblcFormPagoExit(Sender: TObject);
var
   Tmp : String ;
begin

   if z2bbtnCancel.Focused then exit;
   if dblcTMon.Focused then exit;

   edtFormPago.text:= DMTE.DisplayDescripLocal(DMTE.cdsFormPago,'FPAGOID',dblcFormPago.Text,'FPAGODES') ;

   if dblcFormPago.Text='' then begin
      ShowMessage('Error : Forma de Pago no Valida');
      dblcFormPago.SetFocus;
      Exit;
   end;

   dbeNoChq.Text :='';
   dbdtpFEmis.date := 0 ;

   if DMTE.cdsFormPago.FieldByName('FCANJE').Value='S' then begin
      edtCuenta.Enabled:=True;
      edtCuenta.SetFocus;
   end
   else begin
      edtCuenta.Enabled := False ;
   end;

   if (DMTE.cdsFormPago.FieldByName('FCHQ').AsString='1') or
      (DMTE.cdsFormPago.FieldByName('FCHQ').AsString='S') then
   begin
      dbeNoChq.Enabled  :=True ;
      dbdtpFEmis.Enabled:= True ;
      if not edtCuenta.Focused then
         dbeNoChq.SetFocus;
   end
   else
   begin
      dbeNoChq.Enabled  :=False;
      dbdtpFEmis.Enabled:= False ;
   end;

end;

procedure TFAnulCheque.dbeNoChqChange(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFAnulCheque.dbdtpFEmisEnter(Sender: TObject);
begin
   strTmp := dbdtpFEmis.Text ;
end;

procedure TFAnulCheque.dbdtpFEmisExit(Sender: TObject);
begin
   if (dbdtpFEmis.Text <> strTmp) and (dbdtpFEmis.Date <> 0) then
   begin
      dbeTcambio.Text := floattostrf(strtofloat(DMTE.RecuperarTipoCambio(dbdtpFEmis.Date)),fffixed,10,4) ;
   end ;

end;

procedure TFAnulCheque.dbeTCambioChange(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFAnulCheque.dbeTCambioEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFAnulCheque.dbeTCambioExit(Sender: TObject);
begin
   if strTmp <> TCustomEdit(Sender).text then
   begin
      TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text,4) ;
   end ;

end;

procedure TFAnulCheque.dbeImporteChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFAnulCheque.dbeImporteEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFAnulCheque.dbeImporteExit(Sender: TObject);
begin
    if strTmp <> TCustomEdit(Sender).text then
    begin
       TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text) ;
    end ;

end;

procedure TFAnulCheque.dblcdCnpExit(Sender: TObject);
var
   xSql : string;
begin
   if z2bbtnCancel.Focused then exit;
   if dbeLote.Focused      then exit;

   xSql := 'CPTOID='+quotedstr(dblcdCnp.Text);
   if Length(Trim(dbeGlosa.text))=0 then
      dbeGlosa.text := DMTE.DisplayDescrip('prvCnpEgr','CAJA201','CPTODES',xSql,'CPTODES');

{   if dbeGlosa.text='' then begin
      ShowMessage('Error : Concepto no Valido');
      dblcdCnp.SetFocus;
   end;   }

end;

procedure TFAnulCheque.dbeGlosaChange(Sender: TObject);
begin
   wmodifica:=True;
end;

procedure TFAnulCheque.z2bbtnOKClick(Sender: TObject);
var
  xWhere,aux,xSQL : string;
begin
	 // consistencia de Datos
	 ValidaCabecera2 ;
	 // Actualizamos el Client Data Set de Egr.Caja (CAJA302)
	 with DMTE do
	 begin
		 cdsEgrCaja.Edit;
		 cdsEgrCaja.FieldByName('CIAID').Value   :=dblcCia.Text;
		 cdsEgrCaja.FieldByName('TDIARID').Value :=dblcTDiario.Text;
		 cdsEgrCaja.FieldByName('ECANOMM').Value :=edtPeriodo.Text;
		 cdsEgrCaja.FieldByName('ECNOCOMP').Value:=dbeNoComp.Text;

		 cdsEgrCaja.FieldByName('CLAUXID').Value :=dblcClase.Text;
		 cdsEgrCaja.FieldByName('PROV').Value    :=dblcdAux.Text;
		 cdsEgrCaja.FieldByName('PROVRUC').Value :=edtAuxRUC.Text;
		 cdsEgrCaja.FieldByName('ECGIRA').Value  :=dbeGiradoA.Text;

		 cdsEgrCaja.FieldByName('ECFCOMP').Value :=dbdtpFComp.Date;
		 cdsEgrCaja.FieldByName('FPAGOID').Value :=dblcFormPago.Text;
		 cdsEgrCaja.FieldByName('EQUIID').AsString := EquivFPago( dblcFormPago.Text ,dblcBanco.Text) ;
		 cdsEgrCaja.fieldBYName('ECFEMICH').AsDateTime := dbdtpFEmis.Date ;
		 cdsEgrCaja.FieldByName('TMONID').Value  :=dblcTMon.Text;
		 cdsEgrCaja.FieldByName('ECTCAMB').Value :=strtofloat(dbeTCambio.Text);
		 cdsEgrCaja.FieldByName('ECMTOORI').Value:=strtofloat(dbeImporte.Text);
		 cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString := xVoucher;
		 //**
		 if cdsEgrCaja.FieldByName('TMONID').Value=wTMonLoc then
		 begin
				cdsEgrCaja.FieldByName('ECMTOLOC').Value:=strtofloat(dbeImporte.Text);
				cdsEgrCaja.FieldByName('ECMTOEXT').Value:=FRound(strtofloat(dbeImporte.Text)/strtofloat(dbeTCambio.Text),15,2);
		 end
		 else
		 begin
				cdsEgrCaja.FieldByName('ECMTOLOC').Value:=FRound(strtofloat(dbeImporte.Text)*strtofloat(dbeTCambio.Text),15,2);
				cdsEgrCaja.FieldByName('ECMTOEXT').Value:=strtofloat(dbeImporte.Text);
		 end;
		 cdsEgrCaja.FieldByName('BANCOID').Value :=dblcBanco.Text;
		 cdsEgrCaja.FieldByName('CCBCOID').Value :=dblcCCBco.Text;
		 cdsEgrCaja.FieldByName('ECNOCHQ').Value :=dbeNoChq.Text;
		 cdsEgrCaja.FieldByName('ECGIRA').Value  :=dbeGiradoA.Text;
		 cdsEgrCaja.FieldByName('CPTOID').Value  :=dblcdCnp.Text;
		 cdsEgrCaja.FieldByName('CUENTAID').Value:=edtCuenta.Text;
		 cdsEgrCaja.FieldByName('ECGLOSA').Value :=dbeGlosa.Text;
		 cdsEgrCaja.FieldByName('ECLOTE').Value  :=dbeLote.Text;
		 cdsEgrCaja.FieldByName('ECESTADO').Value :='A';

		 xWhere:='FECHA=' +DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date)+''')' ;
		 aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');

		 cdsEgrCaja.FieldByName('ECANO').Value  := cdsqry.FieldByName('FECANO').Value;
		 cdsEgrCaja.FieldByName('ECMM').Value   := cdsqry.FieldByName('FECMES').Value;
		 cdsEgrCaja.FieldByName('ECDD').Value   := cdsqry.FieldByName('FECDIA').Value;
		 cdsEgrCaja.FieldByName('ECSS').Value   := cdsqry.FieldByName('FECSS').Value;
		 cdsEgrCaja.FieldByName('ECSEM').Value  := cdsqry.FieldByName('FECSEM').Value;
		 cdsEgrCaja.FieldByName('ECTRI').Value  := cdsqry.FieldByName('FECTRIM').Value;
		 cdsEgrCaja.FieldByName('ECAASS').Value := cdsqry.FieldByName('FECAASS').Value;
		 cdsEgrCaja.FieldByName('ECAASem').Value:= cdsqry.FieldByName('FECAASEM').Value;
		 cdsEgrCaja.FieldByName('ECAATri').Value:= cdsqry.FieldByName('FECAATRI').Value;
		 cdsEgrCaja.FieldByName('EC_PROCE').Value:='3';
		 cdsEgrCaja.FieldByName('EC_IE').Value   :='E';
		 cdsEgrCaja.FieldByName('ECELABO').Value   :='NULO';
                 DMTE.cdsEgrCaja.FieldByName('ECUSER').Value     := DMTE.wUsuario; // usuario que registra
                 DMTE.cdsEgrCaja.FieldByName('ECFREG').Value     := DateS;         // fecha que registra Usuario
                 DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;         // Hora de Registro de Usuario
                 cdspost(DMTE.cdsEgrCaja);


	 end;

   xSQL:='Select * from CAJA302 '
        +'Where CIAID='''   +dblcCia.Text    +''' and '
        +      'ECANOMM=''' +edtPeriodo.Text +''' and '
        +      'TDIARID=''' +dblcTDiario.Text+''' and '
        +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
   DMTE.cdsEgrCaja.DataRequest( xSQL );

   DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

   ShowMessage('Grabacion OK');

   z2bbtnNuevo.Enabled    := True;
         

//*****************************
   // Estado de los componentes
   pnlCabecera1.enabled  := False;
   pnlCabecera2.enabled  := True;

   z2bbtnOk.Enabled        := False;
//   z2bbtnCancel.Enabled    := False;


end;

procedure TFAnulCheque.ValidaCabecera2;
begin
	 if length(dblcCia.Text)=0 then raise exception.Create('Falta Codigo de Compañia');
	 if length(edtCia.Text)=0 then raise exception.Create('Codigo de Compañia Errado');
	 if length(dblcTDiario.Text)=0 then raise exception.Create('Falta Tipo de Diario');
	 if length(edtTDiario.Text)=0 then raise exception.Create('Tipo de Diario Errado');

//	 if length(dbeGiradoA.Text)=0 then raise exception.Create('Datos del Proveedor Errados');

	 if length(dblcTMon.Text)=0 then raise exception.Create('Falta Tipo de Moneda');
	 if length(edtTMon.Text)=0 then raise exception.Create('Codigo de Moneda Errado');
	 if length(dbeTCambio.Text)=0 then dbeTCambio.Text:='0'
	 else
	    if strtofloat(dbeTCambio.Text)<=0 then dbeTCambio.Text:='0';

	 if length(dbeImporte.Text)=0 then dbeImporte.Text :='0'
	 else
   	    if strtofloat(dbeImporte.Text)<=0 then dbeImporte.Text :='0';

//   if length(dblcTDoc.Text)=0 then raise exception.Create('Falta Tipo de Documento');
//   if length(edtTDoc.Text)=0 then raise exception.Create('Tipo de Documento Errado');
//   if length(dbeNoDoc.Text)=0 then raise exception.Create('Falta Nro.de Documento');

	 if length(dblcBanco.Text)=0 then raise exception.Create('Falta definir Banco');
	 if length(edtBanco.Text)=0 then raise exception.Create('Codigo de Banco Errado');

	 if dblcCCBco.Enabled=True then
	 begin
			if length(dblcCCBco.Text)=0 then raise exception.Create('Falta Cuenta Corriente Banco');
	 end;

	 if dblcFormPago.Enabled=True then
	 begin
			if length(dblcFormPago.Text)=0 then raise exception.Create('Falta Forma de Pago');
			if length(edtFormPago.Text)=0 then raise exception.Create('Codigo de Forma de Pago Errado');
	 end;

	 if (dbeNoChq.Enabled=True) and (length(dbeNoChq.Text)=0) then
			raise exception.Create('Falta No. de Cheque');

	 IF (dbeNoChq.Enabled=True) and (dbdtpFEmis.Date=0) then
	 begin
			dbdtpFEmis.SetFocus ;
			raise exception.create('Ingrese Fecha de Emisión del Cheque') ;
	 end ;

//YA NO ES OBLIGATORIO EL INGRESO DEL LOTE
//   if length(dbeLote.Text)=0 then raise exception.Create('Falta Lote');
//   if length(dblcdCnp.Text)=0 then raise exception.Create('Falta Concepto');

end;


procedure TFAnulCheque.z2bbtnNuevoClick(Sender: TObject);
begin
   if DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value ='I' then
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
//0805      IniciaDatos;
      Adiciona ;
      AdicIniciadatos ;
   end;
  //** 05/06/2001 - pjsv, para grabar el nuevo voucher
  xVoucher := '';
  //**

end;

procedure TFAnulCheque.AdicIniciaDatos;
begin

   RecuperarCiaUnica(dblcCia,edtCia);
   edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
   if dblccia.Text<>'' then
      perform(CM_DialogKey,VK_TAB,0);
end;


procedure TFAnulCheque.dbeNoChqExit(Sender: TObject);
var
 xSql : string;
begin
  xSql:='CIAID='+quotedstr(dblcCia.text)+' AND TDIARID='+quotedstr(dblcTDiario.text)+' and '
       +'ECNOCOMP<>'+quotedstr( dbeNoComp.Text )+' and '
			 +'CCBCOID='+quotedstr(dblcCCBco.Text)+' AND ECNOCHQ='+quotedstr(dbeNoChq.text);
//			 +' AND ECESTADO<>''A'' ';

  DMTE.DisplayDescrip('prvTGE','CAJA302','ECNOCHQ,ECESTADO,ECELABO',xsql,'ECNOCHQ');
  if DMTE.cdsQry.FieldByName('ECNOCHQ').AsString<>'' then
  begin
     if DMTE.cdsQry.FieldByName('ECESTADO').AsString<>'A' then
     begin
        showmessage('El número de Cheque ya fue Utilizado');
        dbeNoChq.Text := '';
        dbeNoChq.SetFocus;
     end
     else
     begin
        if DMTE.cdsQry.FieldByName('ECELABO').AsString='NULO' then
        begin
           showmessage('El número de Cheque ya fue Utilizado');
           dbeNoChq.Text := '';
           dbeNoChq.SetFocus;
        end
     end;
  end;
  if Length(Trim(dbeGlosa.text))=0 then
     dbeGlosa.text := 'Registro de Cheque Anulado: '+dbeNoChq.Text


end;

end.

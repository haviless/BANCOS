unit Caja235;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit, Variants,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient, //libRLP,
  Wwdotdot,wwidlg,CAJADM, ppComm, ppRelatv, ppProd, ppClass, ppReport, oaContabiliza,
  oaVariables;

type
  TFMovBcos = class(TForm)
    pnlCabecera1: TPanel;
    lblCia: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    pnlCabecera2: TPanel;
    lblTMon: TLabel;
    lblTCambio: TLabel;
    edtTMon: TEdit;
    dbeTCambio: TwwDBEdit;
    z2bbtnCancel: TBitBtn;
    z2bbtnOK: TBitBtn;
    dblcTMon: TwwDBLookupCombo;
    pnlDetPago: TPanel;
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
    dbgDetPago: TwwDBGrid;
    dblcTDoc: TwwDBLookupCombo;
    lblTDoc: TLabel;
    edtTDoc: TEdit;
    dbeNoDoc: TwwDBEdit;
    lblNoDoc: TLabel;
    lblEstado: TLabel;
    z2bbtnAnula: TBitBtn;
    z2bbtnCalc: TBitBtn;
    dbgDetPagoIButton: TwwIButton;
    pnlActualiza: TPanel;
    dbeNoReg: TwwDBEdit;
    Label3: TLabel;
    Label9: TLabel;
    dbeSerie: TwwDBEdit;
    Label10: TLabel;
    dbeNoDoc2: TwwDBEdit;
    Label6: TLabel;
    edtCnp2: TEdit;
    Label11: TLabel;
    edtCuenta2: TwwDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    dblcTMon2: TwwDBLookupCombo;
    Label12: TLabel;
    dbeImporte2: TwwDBEdit;
    edtTMon2: TEdit;
    dbeTCamDoc: TwwDBEdit;
    Label13: TLabel;
    edtMtoLoc: TwwDBEdit;
    Label14: TLabel;
    edtMtoExt: TwwDBEdit;
    z2bbtnOK2: TBitBtn;
    z2bbtnCancel3: TBitBtn;
    Label2: TLabel;
    Label21: TLabel;
    dbeDH: TwwDBEdit;
    Label22: TLabel;
    z2bbtnOKCab: TBitBtn;
    dblcdCCosto: TwwDBLookupComboDlg;
    dblcdCnp2: TwwDBLookupComboDlg;
    dbeAuxDet: TwwDBEdit;
    Label25: TLabel;
    Label16: TLabel;
    dblcdAuxDet: TwwDBLookupComboDlg;
    dblcClase: TwwDBLookupCombo;
    edtClase: TEdit;
    Label1: TLabel;
    dblcdCnp: TwwDBLookupComboDlg;
    Label17: TLabel;
    dblcdFEfec: TwwDBLookupComboDlg;
    dbeFEfec: TwwDBEdit;
    lblBanco: TLabel;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TEdit;
    lblCCBco: TLabel;
    dblcCCBco: TwwDBLookupCombo;
    lblCuenta: TLabel;
    edtCuenta: TEdit;
    dblcTDoc1: TwwDBLookupCombo;
    Label4: TLabel;
    rgbTipMov: TRadioGroup;
    procedure dblcCiaExit(Sender: TObject);
    procedure z2bbtnCancelClick(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dblcTMonChange(Sender: TObject);
    procedure z2bbtnCalcClick(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcCCBcoExit(Sender: TObject);
    procedure dblcCnp2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure z2bbtnSumatClick(Sender: TObject);
    procedure z2bbtnSubeClick(Sender: TObject);
    procedure z2bbtnCancel2Click(Sender: TObject);
    procedure z2bbtnNuevoClick(Sender: TObject);
    procedure z2bbtnGrabaClick(Sender: TObject);
    procedure z2bbtnCanceladoClick(Sender: TObject);
    procedure z2bbtnContClick(Sender: TObject);
    procedure z2bbtnAnulaClick(Sender: TObject);
    procedure dbgDetPagoIButtonClick(Sender: TObject);
    procedure z2bbtnCancel3Click(Sender: TObject);
    procedure dbeNoRegExit(Sender: TObject);
    procedure z2bbtnOK2Click(Sender: TObject);
    procedure dblcTMon2Exit(Sender: TObject);
    procedure dbdtpFComp2Exit(Sender: TObject);
    procedure dblcTMon2Change(Sender: TObject);
    procedure dblcCnp2Change(Sender: TObject);
    procedure dbeImporte2Exit(Sender: TObject);
    procedure dbgDetPagoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeDHChange(Sender: TObject);
    procedure dbgDetPagoCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure dbeLoteExit(Sender: TObject);
    procedure dblcdProvChange(Sender: TObject);
    procedure edtProvRUCChange(Sender: TObject);
    procedure dbeTCambioChange(Sender: TObject);
    procedure dbeNoDocChange(Sender: TObject);
    procedure dbeNoChqChange(Sender: TObject);
    procedure dbeLoteChange(Sender: TObject);
    procedure dbeGlosaChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure LookUpMostrado(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure NoEstaenLookUp(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcTDocNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcTDocCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcTMonCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dblcTMonNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure InhabilitarPaneles;
    procedure dbgDetPagoDblClick(Sender: TObject);
    procedure LiberarFiltrosRegistroEgresos;
    procedure EstablecerFiltrosRegistroEgresos;
    procedure FormCreate(Sender: TObject);
    procedure dblcdCnp2Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeTCambioEnter(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure wwDBEdit1Change2(Sender: TObject);
    procedure dblcClaseExit22(Sender: TObject);
    procedure dblcdAuxEnter2(Sender: TObject);
    procedure dblcdAuxExit2(Sender: TObject);
    procedure dblcdCnpExit2(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblcdFEfecEnter(Sender: TObject);
    procedure dblcdFEfecExit(Sender: TObject);
    procedure rgbTipMovClick(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dblcTDoc1Exit(Sender: TObject);
    procedure dblcdCCostoExit(Sender: TObject);

  private
    xDifLoc,xDifExt:double;
    cf1: TControlFoco;
    cdsConceptoC1 : TwwClientDataset;
    strTmp: String;
    { Private declarations }
    A1 : Array of Integer;
    A2 : Array Of TNotifyEvent;
    A2digitos ,A4digitos : Array of TWinControl;
    //
    wCptoGan  ,
    wCptoPer  ,
    wCtaGan   ,
    wCtaPer   : String;
    cdsFiltro: TwwClientDataset;
    xGraboNuevo: Boolean;
    wFechaCierre: TDatetime;
    wFrecu: Integer;
    //
    //** 04/06/2001-pjsv, para el nuevo dato (CCBCOVOUCH - TGE106 y CAJA302)
    xVoucher : String;
    //**
    Function ValidacionCabecera:Boolean;
    procedure ValidacionCabecera1;
    procedure ActPnlBotones;
    procedure AdicionarRegistros;
    procedure ConsisCancela(var xconsis:Boolean);
    procedure Contabiliza;
    procedure Contab_DifCambio;
    procedure Contab_EgrCaja;
    procedure IniciaDatos;
    procedure IniciaPanel;
    procedure Contab_RegCxP;
    function  ValidaCampo:Boolean;
    procedure AdicIniciaDatos;
    procedure ActualizaSaldosCaja;
    procedure ConfiguraAccesos;
    procedure Proc_Admin;
    procedure Proc_Consul;
    procedure Libera_Admin;
    procedure Libera_Consul;
    procedure LibConfigAccesos;
    procedure EdiTarRegistros;
    procedure RecCptosDifC;
    procedure Valida;
    procedure CalculaMontos(var xECMTOORI,xECMTOLOC,xECMTOEXT:String );
    procedure ActualizaFiltro;
    procedure GrabaCabeceraDeComprobante;    
  public
    { Public declarations }
    xReg : Integer;
    procedure Adiciona;
    procedure Edita (Comp : structComprobante;cds : Twwclientdataset);
    procedure AsignaCDSFiltro(cds : TwwClientDataset);
  end;

var
  FMovBcos: TFMovBcos;
  wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,
  wbcancel2 , wbChq : Boolean;
  wmodifica: Boolean;
  bFlagRecuperacion: Boolean;

implementation

uses CAJAUTIL, Caja290, oaTE2000;

{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}

procedure TFMovBcos.IniciaDatos;
begin

   pnlCabecera1.Enabled  := True;
   pnlCabecera2.Enabled  := False;
   pnlDetPago.Enabled    := False;
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
   wbChq       := False;
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
   edtPeriodo.Enabled:= False;
   edtPeriodo.Text   := '';   // Periodo
   dblcTDiario.Text  := '';   // Tipo de Diario
   edtTDiario.Enabled:= False;
   edtTDiario.Text   := '';   // Descripción del T.Diario
   dbeNoComp.Text    := '';   // Comprobante
   dbeFEfec.Text     := '';

   //lineas a cambiar por william manrique cautin
   //fin de lineas a cambiar por william manrique cautin

   dblcTMon.Text     := '';   // Tipo de Moneda
   edtTMon.Enabled   := False;
   edtTMon.Text      := '';   // Descripción de la Moneda
   dbeTCambio.Text   := '';   // Tipo de Cambio
   dblcTDoc.Text     := '';   // Tipo de Documento
   edtTDoc.Enabled   := False;
   edtTDoc.Text      := '';   // Descripción del T.Doc
   dbeNoDoc.Text     := '';   // Nro.Documento
   dblcBanco.Text    := '';   // Código de Banco
   edtBanco.Enabled  := False;
   edtBanco.Text     := '';   // Descripción de Banco
   dblcCCBco.Enabled := False;
   dblcCCBco.Text    := '';   // Cuenta Corriente del Banco
//   edtCCBco.Enabled  := False;
//   edtCCBco.Text     := '';   // Descripción de la Cuenta Corriente
   edtCuenta.Enabled := False;
   edtCuenta.Text    := '';   // Descripción de la Cuenta Contable Principal
   dbeLote.Text      := '';   // Lote
   dblcdCnp.Text      := '';   // Concepto
   dbeGlosa.Text     := '';   // Glosa
   dbeGlosa.Text     := '';   // Glosa
   lblEstado.Caption := '';   //Inicializar el Estado
   wmodifica := False;

   dbgDetPagoIButton.Enabled:=True;
   dbgDetPago.KeyOptions:=[dgEnterToTab];
   dbgDetPago.ColumnByName('DEMTOLOC').FooterValue:='';
   dbgDetPago.ColumnByName('DEMTOEXT').FooterValue:='';

   // Limpiando filtros si lo tuvieran
   DMTE.cdsRegCxP.Filtered :=False;
   // Estableciendo el filtro para que el detalle del grid aparezca vacio
   z2bbtnOKCab.Enabled:=true;

end;

{*******************************************************
PRIMER PANEL - DATOS INICIALES DE LA CABECERA
*******************************************************}

procedure TFMovBcos.dblcCiaExit(Sender: TObject);
begin
   edtCia.text:= DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIADES') ;

   if edtCia.Text='' then begin
      ShowMessage('Error : Compañía no Valida');
      dblcCia.SetFocus;
      Exit;
   end;
end;

procedure TFMovBcos.dbdtpFCompExit(Sender: TObject);
begin
   if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, dblcCCBco.text, dbdtpFComp.Date ) then
   begin
      Showmessage('Error : Mes de Fecha Fue Cerrado. Verificar...');
      Exit;
   end;

   if not DiaAperturado(dblcCia.text,dbdtpFComp.Date,dblcBanco.text) then exit;

   if dbdtpFComp.Date=0 then
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
             TwwDBDateTimePicker(Sender).SetFocus;
             Showmessage('Ingrese Fecha dentro del Rango'+#13+
                         'Fecha de Cierre  : ' + datetimetostr(wfechacierre) + #13+
                         'Frecuencia       : ' + inttostr(wFrecu) );
             Exit;
         end;
      edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);

      dblcTDiarioExit(Sender);                      
   end;
end;

procedure TFMovBcos.dbeNoCompExit(Sender: TObject);
begin
   dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);
end;

{*******************************************************
SEGUNDO PANEL - DATOS ADICIONALES DE LA CABECERA
*******************************************************}




procedure TFMovBcos.dblcTMonChange(Sender: TObject);
var xWhere:string;
begin
  if self.ActiveControl<>dblcTMon then
  begin
     xWhere:='TMONID='+''''+dblcTMon.Text+'''';
     edtTMon.Text:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
     if length(edtTMon.Text)>0 then
     begin
        xWhere := 'TMONID='+''''+DMTE.wTMonExt+''''
                  +' AND FECHA='+DMTE.wRepFuncDate +''''+formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date) +''')';
        if length(DMTE.DisplayDescrip('prvTGE','TGE107','TMONID, TCAMVOV',xWhere,'TMONID'))>0 then
            dbeTCambio.Text:=DMTE.cdsqry.fieldbyname('TCAMVOV').AsString;
     end;
  end;
  wmodifica:=True;
end;

procedure TFMovBcos.dblcTMonExit(Sender: TObject);
var xWhere :String;
begin
  //llamar avalidacion
  if z2bbtnCancel.Focused then
    exit;

  if (Sender as twwDBCustomLookupCombo).Text='' then
  begin
     (Sender as twincontrol).SetFocus;
     edtTmon.text:='';
     dbeTCambio.Text:='';
     showMessage('Ingrese un tipo de Moneda Válido');
  end
  else
    if dblcTMon.Text=dblcTMon.LookupTable.FieldByName('TMONID').asstring then
       if dblcTMon.LookupTable.FieldByName('TMONDES').AsString<>dbeTCambio.Text then
       begin
           edtTmon.text:=(Sender as TwwDBCustomLookupCombo).LookUpTable.Fields[1].AsString;;
           xWhere := 'TMONID='+''''+dblcTMon.Text+''''
                    +' AND FECHA='+DMTE.wRepFuncDate + quotedStr(formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date) ) +')';
           if length(DMTE.DisplayDescrip('prvTGE','TGE107','TMONID, TCAMVOV',xWhere,'TMONID'))>0 then
            dbeTCambio.Text:=DMTE.cdsqry.fieldbyname('TCAMVOV').AsString;
       end
    else
      showmessage('mensaje para william evento dblcTMon'+#13+
                  'el id ingresado esta en la tabla pero la tabla no esta posicionada');
end;

procedure TFMovBcos.dblcTDocExit(Sender: TObject);
begin
  EDTtdOC.Text := DMTE.displaydescrip('prvTGE','TGE110','DOCABR','DOCID='+quotedstr(dblcTDoc.text),'DOCABR');
  wmodifica:=True;
end;

procedure TFMovBcos.dblcBancoExit(Sender: TObject);
//var
//    Tmp : String;
begin

   edtBanco.Text := DMTE.DisplayDescrip('prvTGE','TGE105','BANCOABR','BANCOID='+quotedstr(dblcBanco.text),'BANCOABR');
   if edtBanco.Text = '' then
   begin
      dblcBanco.text := '';
      edtBanco.Text := '';
      dblcBanco.SetFocus;
      exit;
   end
   else begin
      dblcCCBco.Text := '' ;
      edtCuenta.Text := '' ;
      dblcdCnp.Text  := '' ;
      dbeGlosa.Text := '' ;
      dblcTMon.Text := '' ;
      edtTMon.Text := '' ;
      if DMTE.cdsbancoegr.FieldByName('BCOTIPCTA').AsString='C' then
      begin //Si es CAJA
         if rgbTipMov.ItemIndex=1 then
            dblcTDiario.Text:=DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco.text),'CCBCOVOUCH')
         else
            dblcTDiario.Text:=DMTE.DisplayDescrip('prvTGE','TGE106','CCBVOUING','BANCOID='+quotedstr(dblcBanco.text),'CCBVOUING');

         dblcTDiarioExit(Sender);
         dblcCCBco.Enabled:=False;
         dblcCCBco.Text := '';
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
         DMTE.cdsCCBco.Filtered:=False;
         DMTE.cdsCCBco.Filter:='';   //Filtrar la lista de CtaCte por Banco
         DMTE.cdsCCBco.Filter:='BANCOID='+''''+dblcBanco.Text+''''+' AND CIAID='+quotedstr(dblcCia.text);
         DMTE.cdsCCBco.Filtered:=True;
         DMTE.cdsFormPago.Filter := 'FCBCO=''1'' or FCBCO=''S'' ' ;
         DMTE.cdsFormPago.Filtered := true ;
         dblcCCBco.setfocus;
      end;
   end;
end;

procedure TFMovBcos.dblcCCBcoExit(Sender: TObject);
var
   Tmp : String;
begin
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

   dblcTmon.Text := DMTE.cdsCCBco.fieldbyname('TMONID').AsString;

   if DMTE.cdsCCBco.Locate('BANCOID;CCBCOID',VararrayOf([dblcbanco.text,dblcccbco.text]),[]) then
   begin
      edtCuenta.Text := DMTE.cdsCCBco.fieldbyname('CTAPRINC').AsString ;
      dblcdCnp.Text  := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOID','CPTOID='+quotedstr(DMTE.cdsCCBco.fieldbyname('CPTOID').AsString),'CPTOID');
      dbeGlosa.Text := DMTE.DisplayDescrip('prvTGE','CAJA201','CPTODES','CPTOID='+quotedstr(dblcdCnp.text),'CPTODES');  //  DMTE.cdsCCBcoLKGLOSA.AsString ;
      xVoucher := DMTE.cdsCCBco.fieldbyname('CCBCOVOUCH').AsString;

      if rgbTipMov.ItemIndex=1 then
         dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco.text)+' AND CCBCOID='+quotedstr(dblcCCBco.text),'CCBCOVOUCH')
      else
         dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBVOUING','BANCOID='+quotedstr(dblcBanco.text)+' AND CCBCOID='+quotedstr(dblcCCBco.text),'CCBVOUING');

      dblcTDiarioExit(Sender);
   end;
end;

procedure TFMovBcos.z2bbtnOKClick(Sender: TObject);
Var xWhere,aux:string;
begin

   ValidacionCabecera1;

   // VALIDA LA CUENTA
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,'',edtCuenta.text)) and (dblcTMon.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+edtCuenta.text+' Se registra sólo en Moneda Extranjera.');
   end;

   // VALIDA LA CUENTA DEL CONCEPTO
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,dblcdCnp.text,'')) and (dblcTMon.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+DMTE.cdsQry.FieldByName('CUENTAID').AsString+' del Concepto '+dblcdCnp.text+' Se registra sólo en Moneda Extranjera.');
   end;

   // Actualizamos el Client Data Set de Egr.Caja (CAJA302)
   with DMTE do begin
     cdsEgrCaja.Edit;
     cdsEgrCaja.FieldByName('CIAID').AsString    := dblcCia.Text;
     cdsEgrCaja.FieldByName('TDIARID').AsString  := dblcTDiario.Text;
     cdsEgrCaja.FieldByName('ECANOMM').AsString  := edtPeriodo.Text;
     cdsEgrCaja.FieldByName('ECNOCOMP').AsString := dbeNoComp.Text;
     cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime  := dbdtpFComp.Date;
     cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime := dbdtpFComp.Date;
     cdsEgrCaja.FieldByName('DOCID').AsString    := dblcTDoc.Text;
     cdsEgrCaja.FieldByName('ECNODOC').AsString  := dbeNoDoc.Text;
     cdsEgrCaja.FieldByName('TMONID').AsString   := dblcTMon.Text;
     cdsEgrCaja.FieldByName('ECTCAMB').AsFloat     := strtofloat(dbeTCambio.Text);

     cdsEgrCaja.FieldByName('BANCOID').AsString  :=dblcBanco.Text;
     cdsEgrCaja.FieldByName('CCBCOID').AsString  :=dblcCCBco.Text;
     cdsEgrCaja.FieldByName('CPTOID').AsString   :=dblcdCnp.Text;
     cdsEgrCaja.FieldByName('CUENTAID').AsString :=edtCuenta.Text;
     cdsEgrCaja.FieldByName('ECGLOSA').AsString  :=dbeGlosa.Text;
     cdsEgrCaja.FieldByName('ECLOTE').AsString   :=dbeLote.Text;
     //** 04/06/2001 - pjsv, asigna el voucher asociado a la cuenta del banco
     cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString := xVoucher;
     //**
     if trim(dblcdFEfec.Text) = '' then
        cdsEgrCaja.fieldbyname('FLUEID').Clear
     else
        cdsEgrCaja.fieldbyname('FLUEID').AsString := trim(dblcdFEfec.Text);
     //** se anula porque se han ocultado estos controles
     //cdsEgrCaja.fieldBYName('ECFEMICH').AsDateTime := dbdtpFEmis.Date;
     //**
     cdsEgrCaja.FieldByName('ECESTADO').AsString :='I';

     xWhere:='FECHA='+wRepFuncDate+ quotedStr(formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date) ) +')';
     aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FecAno');
     cdsEgrCaja.FieldByName('ECANO').AsString   := cdsqry.FieldByName('FecAno').AsString;
     cdsEgrCaja.FieldByName('ECMM').AsString    := cdsqry.FieldByName('FecMes').AsString;
     cdsEgrCaja.FieldByName('ECDD').AsString    := cdsqry.FieldByName('FecDia').AsString;
     cdsEgrCaja.FieldByName('ECSS').AsString    := cdsqry.FieldByName('FecSS').AsString;
     cdsEgrCaja.FieldByName('ECSEM').AsString   := cdsqry.FieldByName('FecSem').AsString;
     cdsEgrCaja.FieldByName('ECTRI').AsString   := cdsqry.FieldByName('FecTrim').AsString;
     cdsEgrCaja.FieldByName('ECAASS').AsString  := cdsqry.FieldByName('FecAASS').AsString;
     cdsEgrCaja.FieldByName('ECAASem').AsString := cdsqry.FieldByName('FecAASem').AsString;
     cdsEgrCaja.FieldByName('ECAATri').AsString := cdsqry.FieldByName('FecAATri').AsString;
     cdsEgrCaja.FieldByName('EC_PROCE').AsString:='D';

     {if rgbTipMov.ItemIndex = 0 then
         cdsEgrCaja.FieldByName('EC_IE').AsString   :='I'
     else
         cdsEgrCaja.FieldByName('EC_IE').AsString   :='E';}

   end;

   // Actualizamos el Detalle mostrado en el grid ante posibles cambios del
   // Tipo de Cambio
   if not DMTE.cdsRegCxP.Eof then begin   //Hay documentos en el detalle
      DMTE.cdsRegCxP.DisableControls;
      DMTE.cdsRegCxP.First;
      While not DMTE.cdsRegCxP.Eof do Begin
        DMTE.cdsRegCxP.Edit;
        DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat  := strtofloat(dbeTCambio.Text);
        if DMTE.cdsRegCxP.FieldByName('TMONID').AsString= DMTE.wTMonLoc then begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat/DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
        end
        else
        begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat*DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
        end;
        DMTE.cdsRegCxP.Next;
      end;
      DMTE.cdsRegCxP.First;
      DMTE.cdsRegCxP.EnableControls;
   end;
   //Actualizamos el Footer
   z2bbtnSumatClick(sender);

   // Estado de los componentes
   pnlCabecera1.enabled  := False;
   pnlCabecera2.enabled  := False;
   pnlDetPago.enabled    := True;
   pnlBotones.Enabled    := True;
   ActPnlBotones;
   // Estado de los botones
   z2bbtnOk.Enabled        := False;
   z2bbtnCancel.Enabled    := False;

   if DMTE.cdsRegCxP.RecordCount = 0 then
   begin
      dbgDetPagoIButtonClick(nil);
   end;
end;

procedure TFMovBcos.z2bbtnCancelClick(Sender: TObject);
begin
   DMTE.cdsEgrCaja.CancelUpdates;
   DMTE.cdsRegCxP.CancelUpdates;
   Adiciona;
   ADICiNICIAdATOS;
//0505   IniciaDatos;

end;

procedure TFMovBcos.z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('C:\windows\calc.exe',1);  //Activa la calculadora del Windows
end;

{*******************************************************
CUARTO PANEL - BOTONES
*******************************************************}
procedure TFMovBcos.z2bbtnSumatClick(Sender: TObject);
Var
   xRegAct : TBookMark;
   xMtoLoc, xMtoExt: Currency;
begin

   With DMTE do begin
      cdsRegCxP.DisableControls;
      xRegAct := cdsRegCxP.GetBookmark;
      xMtoLoc := 0;
      xMtoExt := 0;
      cdsRegCxP.First;
      While not cdsRegCxP.Eof do
      Begin
         //if rgbTipMov.ItemIndex = 0 then
         begin
            if cdsRegCxP.FieldByName('DEDH').AsString='D' then
            begin
              xMtoLoc := xMtoLoc + strtocurr( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) );
              xMtoExt := xMtoExt + strToCurr( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) );
            end
            else
            begin
              xMtoLoc := xMtoLoc - strToCurr( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) );
              xMtoExt := xMtoExt - strToCurr( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) );
            end;
            cdsRegCxP.Next;
         end
         {else
         begin
            if cdsRegCxP.FieldByName('DEDH').AsString='D' then
            begin
              xMtoLoc := xMtoLoc + strtocurr( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) );
              xMtoExt := xMtoExt + strToCurr( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) );
            end
            else
            begin
              xMtoLoc := xMtoLoc - strToCurr( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) );
              xMtoExt := xMtoExt - strToCurr( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) );
            end;
            cdsRegCxP.Next;
         end;}

      end;
      dbgDetPago.ColumnByName('DEMTOLOC').FooterValue:=floattostrf(xMtoLoc, ffFixed, 10, 2);
      dbgDetPago.ColumnByName('DEMTOEXT').FooterValue:=floattostrf(xMtoExt, ffFixed, 10, 2);

       xDifLoc:=xMtoLoc;
       xDifExt:=xMtoExt;

      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);
      cdsRegCxP.EnableControls;
   end;

end;

procedure TFMovBcos.z2bbtnSubeClick(Sender: TObject);
begin
   DMTE.cdsEgrCaja.Edit;
   DMTE.cdsRegCxP.Edit;

   pnlCabecera2.Enabled:= True;
   pnlDetPago.Enabled  := False;
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

procedure TFMovBcos.z2bbtnCancel2Click(Sender: TObject);
begin
   if MessageDlg('¿Anular los cambios?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then begin
      DMTE.cdsEgrCaja.CancelUpdates;
      DMTE.cdsRegCxP.CancelUpdates;
      IniciaDatos;
   end;
end;

procedure TFMovBcos.z2bbtnNuevoClick(Sender: TObject);
begin
   if DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString ='I' then
   begin
      if wmodifica then
      begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      end;
      if MessageDlg('¿Nuevo Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin
         Adiciona;
         ADICiNICIAdATOS;
         //0805 IniciaDatos;
      end
   end
   else
   begin
      Adiciona;
      ADICINICIADATOS;
      //0805 IniciaDatos;
   end;
end;

procedure TFMovBcos.z2bbtnGrabaClick ( Sender: TObject );
var
   xECMTOORI,xECMTOLOC,xECMTOEXT : STRING;
begin
   if DMTE.cdsregcxp.recordcount = 0 then
      Raise exception.create ('Ingrese Detalles');

   CalculaMontos(xECMTOORI,xECMTOLOC,xECMTOEXT);
   if strtocurr(xECMTOLOC) < 0 then
      raise Exception.create('No se pueden Grabar Montos Negativos');

   if DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString='I' then
   begin
      if MessageDlg( '¿Grabar?' , mtConfirmation ,[mbYes, mbNo] , 0 ) = mrYes then
      begin
         Valida;
         screen.Cursor:=crHourGlass;
         CalculaMontos(xECMTOORI,xECMTOLOC,xECMTOEXT);

         DMTE.cdsEgrCaja.Edit;
         DMTE.cdsEgrCaja.fieldbyname('ECMTOORI').AsString:= xECMTOORI;
         DMTE.cdsEgrCaja.fieldbyname('ECMTOLOC').AsString:= xECMTOLOC;
         DMTE.cdsEgrCaja.fieldbyname('ECMTOEXT').AsString:= xECMTOEXT;
         DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString     := DMTE.wUsuario; // usuario que registra
         DMTE.cdsEgrCaja.FieldByName('ECFREG').AsDateTime   := DateS;         // fecha que registra Usuario
         DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime   := Time;         // Hora de Registro de Usuario
         if xDifExt>0 then
           DMTE.cdsEgrCaja.FieldByName('EC_IE').AsString:='E'
         else
           DMTE.cdsEgrCaja.FieldByName('EC_IE').AsString:='I';
           
         cdspost(DMTE.cdsEgrCaja);
         DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

         DMTE.cdsRegCxP.ApplyUpdates(0);

         z2bbtnSumatClick(sender);
         screen.Cursor := crDefault;
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


procedure TFMovBcos.z2bbtnCanceladoClick(Sender: TObject);
var
 xsql : String;
begin
   if DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString = 'I' then
   begin
      if wmodifica then
      begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      end;

      if MessageDlg('¿Efectuar la Cancelacion del Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin
         screen.Cursor := crHourGlass;
         xSQL:='Select * from CAJA302 '
              +'Where CIAID='''   +dblcCia.Text    +''' and '
              +      'ECANOMM=''' +edtPeriodo.Text +''' and '
              +      'TDIARID=''' +dblcTDiario.Text+''' and '
              +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
         DMTE.cdsEgrCaja.Close;
         DMTE.cdsEgrCaja.DataRequest( xSQL );
         DMTE.cdsEgrCaja.Open;
         DMTE.cdsEgrCaja.Edit;
         DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString:='C';
         DMTE.cdsEgrCaja.FieldByName('ECUSER').AsString   := DMTE.wUsuario; // usuario que registra
         DMTE.cdsEgrCaja.FieldByName('ECFREG').AsDateTime := DateS;         // fecha que registra Usuario
         DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;         // Hora de Registro de Usuario
         cdspost(DMTE.cdsEgrCaja);
         DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');
//         DMTE.cdsEgrCaja.ApplyUpdates(0);
         //3004
         DMTE.cdsEgrCaja.refresh;

         z2bbtnSumatClick(sender);

         dbgDetPagoIButton.Enabled:=False;
         z2bbtnSumat.Enabled    := False;
         z2bbtnCont.Enabled     := True;
         z2bbtnSube.Enabled     := False;
         z2bbtnGraba.Enabled    := False;
         z2bbtnCancelado.Enabled:= False;
         z2bbtnCancel2.Enabled  := False;
         z2bbtnAnula.Enabled    := False;
//         ActualizaFiltro;
         lblEstado.Caption    :='Cancelado          ';
         //sitio para actualizaciones de saldo
         ActualizaSaldosCaja;
         //
         screen.Cursor := crDefault;
      end;
   end
   else
   begin
      ShowMessage('Imposible Cancelar');
   end;
end;

function TFMovBcos.ValidaCampo:Boolean;
//aqui adiciionar el codigo para validar que no se ingrese un codigo repetido
var xWhere,aux:string;
begin
     Result:=True;
     with DMTE do
     begin
        if length(cdsRegCxP.FieldByName('CPNOREG').AsString)=0 then
        begin  //No Registro
          dbeNoReg.SetFocus;
          ShowMessage('Falta No Registro');
          Result:=False;
          exit;
        end
        else
        begin
           if length(cdsRegCxP.FieldByName('CPNOREG').AsString)<6 then
           begin
             dbeNoReg.SetFocus;
             ShowMessage('Codigo de Registro Errado');
             Result:=False;
             exit;
           end;
        end;

        if cdsRegCxP.FieldByName('CPSERIE').AsString='' then
        begin      //Serie
          dbeSerie.SetFocus;
          ShowMessage('Falta Serie');
          Result:=False;
          exit;
        end;

        if cdsRegCxP.FieldByName('CPNODOC').AsString='' then
        begin      //No Documento
          dbeNoDoc2.SetFocus;
          ShowMessage('Falta Nro. de Documento');
          Result:=False;
          exit;
        end;

        if length(cdsRegCxP.FieldByName('TMONID').AsString)=0 then
        begin //Tipo de Moneda

          dblcTMon2.SetFocus;
          ShowMessage('Falta Tipo de Moneda');
          Result:=False;
          exit;
        end
        else
        begin
           xWhere:='TMONID='+''''+cdsRegCxP.FieldByName('TMONID').AsString+'''';
           aux   :=DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
           if length(aux)=0 then
           begin
             ShowMessage('Codigo de Tipo de Moneda Errado');
             Result:=False;
             exit;
           end;
        end;

        if cdsRegCxP.FieldByName('DETCDOC').AsFloat<=0 Then
        begin // Tipo de Cambio Detalle
          dbeTCamDoc.SetFocus;
          ShowMessage('Tipo de Cambio debe ser mayor que cero');
          Result:=False;
          exit;
        end;

        if cdsRegCxP.FieldByName('DEMTOORI').AsFloat<=0 Then
        begin   //Importe
          dbeImporte2.SetFocus;
          ShowMessage('Importe debe ser mayor que cero');
          Result:=False;
          exit;
        end;

        if cdsRegCxP.FieldByName('CPTOID').AsString='' then
        begin      //Concepto
          dblcdCnp2.SetFocus;
          ShowMessage('Falta Concepto');
          Result:=False;
          exit;
        end
        else
        begin                             // Cuenta
          aux:=cdsRegCxP.FieldByName('CUENTAID').AsString;
          if length(aux)=0 then
          begin
            dblcdCnp2.SetFocus;
            ShowMessage('Codigo de Concepto Errado');
            Result:=False;
            exit;
          end;
        end;

        if (dblcdCCosto.Enabled) then
        begin  //Centro de Costo
          IF (length(cdsRegCxP.FieldByName('CCOSID').AsString)=0) THEN
          BEGIN
              dblcdCCosto.SetFocus;
              ShowMessage('Falta Centro de Costo');
              Result:=False;
              exit;
          END
          else
          begin
           xWhere:='CCosID='+''''+cdsRegCxP.FieldByName('CCOSID').AsString+'''';
           aux   :=DisplayDescrip('prvTGE','TGE203','CCOSDES',xWhere,'CCosDes');
           if length(aux)=0 then
           begin
              dblcdCCosto.SetFocus;
              ShowMessage('Codigo de Centro de Costo Errado');
              Result:=False;
              exit;
           end;
          end;
        end;

        if length(cdsRegCxP.FieldByName('DEDH').AsString)=0 then
        begin
          dbeDH.SetFocus;
          ShowMessage('Falta especificar Debe / Haber');
          Result:=False;
          exit;
        end;

        if cdsRegCxP.FieldByName('CPFVCMTO').AsDateTime < cdsRegCxP.FieldByName('CPFEMIS').AsDateTime then
        begin //Fecha de Vencimiento
          ShowMessage('Fecha de Vencimiento debe ser posterior a la Fecha de Emision');
          Result:=False;
          exit;
        end;

        xWhere:='Fecha= '+wRepFuncDate+'''' + formatdatetime(DMTE.wFormatFecha,cdsRegCxP.FieldByName('DEFComp').AsDateTime)+''')';
        aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FecAno');
        cdsRegCxP.FieldByName('DEANO').AsString  := cdsqry.FieldByName('FecAno').AsString;
        cdsRegCxP.FieldByName('DEMM').AsString   := cdsqry.FieldByName('FecMes').AsString;
        cdsRegCxP.FieldByName('DEDD').AsString   := cdsqry.FieldByName('FecDia').AsString;
        cdsRegCxP.FieldByName('DESS').AsString   := cdsqry.FieldByName('FecSS').AsString;
        cdsRegCxP.FieldByName('DESEM').AsString  := cdsqry.FieldByName('FecSem').AsString;
        cdsRegCxP.FieldByName('DETRI').AsString  := cdsqry.FieldByName('FecTrim').AsString;
        cdsRegCxP.FieldByName('DEAASS').AsString := cdsqry.FieldByName('FecAASS').AsString;
        cdsRegCxP.FieldByName('DEAASem').AsString:= cdsqry.FieldByName('FecAASem').AsString;
        cdsRegCxP.FieldByName('DEAATri').AsString:= cdsqry.FieldByName('FecAATri').AsString;

    end; {DMTE}
end;

procedure TFMovBcos.ConsisCancela(Var xConsis:boolean);
var xRegAct : TBookMark;
    xSumImp , Suma : Currency;
begin
    xConsis := True;
    xSumImp := 0;
    With DMTE do
    begin
      xRegAct := cdsRegCxP.GetBookmark;
      cdsRegCxP.First;
      While not cdsRegCxP.Eof do
      begin
         if cdsRegCxP.FieldByName('DEDH').AsString='D' then
            if cdsEgrCaja.FieldByName('TMONID').AsString= wtMonLoc then
               xSumImp := xSumImp + strtocurr(stringreplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]))
            else
               xSumImp := xSumImp + strtocurr(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]))
         else
            if cdsEgrCaja.FieldByName('TMONID').AsString= wtMonLoc then
               xSumImp := xSumImp - strtocurr(stringreplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]))
            else
               xSumImp := xSumImp - strtocurr(stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]));

         cdsRegCxP.Next;
      end;
      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);

      if cdsEgrCaja.FieldByName('TMONID').AsString= wtMonLoc then
         Suma :=  strtocurr(floattostrf(cdsEgrCaja.fieldbyname('ECMTOLOC').AsFloat,fffixed,10,2))
      else
         Suma :=  strtocurr(floattostrf(cdsEgrCaja.fieldbyname('ECMTOEXT').AsFloat,fffixed,10,2));
    end;

    if xSumImp <> Suma then
    begin
      xConsis := False;
      if Suma > xSumImp then
         ShowMessage('El Monto a Pagar es mayor que el Provisionado')
      else
         ShowMessage('El Monto a Pagar es menor que el Provisionado');
    end;
end;

procedure TFMovBcos.Contab_EgrCaja;
begin
   DMTE.cdsCntCaja.FieldByName('CIAID').AsString   :=  DMTE.cdsEgrcaja.FieldByName('CIAID').AsString;
   DMTE.cdsCntCaja.FieldByName('TDIARID').AsString :=  DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString:=  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCID').AsString   :=  DMTE.cdsEgrCaja.FieldByName('DOCID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsString;
   DMTE.cdsCntCaja.FieldByName('CPTOID').AsString  :=  DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString;
   DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString:=  DMTE.cdsEgrCaja.FieldByName('CUENTAID').AsString;
//   if rgbTipMov.ItemIndex = 0 then
   if (xDifExt<0) or (xDifLoc<0) then
      DMTE.cdsCntCaja.FieldByName('DCDH').AsString  := 'D'
   else
      DMTE.cdsCntCaja.FieldByName('DCDH').AsString  := 'H';
   DMTE.cdsCntCaja.FieldByName('TMONID').AsString  :=  DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
   if dblcTMon.text=DMTE.wTMonLoc then
   begin
     DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat :=  abs(xDifLoc);
     DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat  :=  abs(xDifLoc);
     DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat :=  abs(xDifExt);
   end
   else
   begin
     DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat := abs(xDifExt);
     DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat  := abs(xDifLoc);
     DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat := abs(xDifExt);
   end;

   DMTE.cdsCntCaja.FieldByName('DCFLACDR').AsString:=  'S';   //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCUSER').AsString  :=  DMTE.wUsuario;
   DMTE.cdsCntCaja.FieldByName('DCFREG').AsDateTime  :=  Date;
   DMTE.cdsCntCaja.FieldByName('DCHREG').AsDateTime  :=  Time;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').AsString  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   DMTE.cdsCntCaja.FieldByName('DCANO').AsString   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMM').AsString    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDD').AsString    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSS').AsString    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
   DMTE.cdsCntCaja.fieldbyname('DOCMOD').AsString  := FRegistro.xModulo;
   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsString := dbeTCambio.Text;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsString := dbeTCambio.Text;
   DMTE.cdsCntCaja.FieldByName('FCAB').AsString := '1';
   //**28/12/2001 - pjsv
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:=  DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:=  DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   xReg:=xReg+1;
   DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  :=  xReg;
end;

procedure TFMovBcos.Contab_RegCxP;
begin
   DMTE.cdsCntCaja.FieldByName('CIAID').AsString   :=  DMTE.cdsRegCxP.FieldByName('CIAID').AsString;
   DMTE.cdsCntCaja.FieldByName('TDIARID').AsString :=  DMTE.cdsRegCxP.FieldByName('TDIARID').AsString;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCID').AsString   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSERIE').AsString :=  DMTE.cdsRegCxP.FieldByName('CPSERIE').AsString;
   DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString :=  DMTE.cdsRegCxP.FieldByName('CPNODOC').AsString;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').AsString :=  DMTE.cdsRegCxP.FieldByName('DEFCOMP').AsString;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').AsString :=  DMTE.cdsRegCxP.FieldByName('CPFEMIS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').AsString:=  DMTE.cdsRegCxP.FieldByName('CPFVCMTO').AsString;
   DMTE.cdsCntCaja.FieldByName('CPTOID').AsString  :=  DMTE.cdsRegCxP.FieldByName('CPTOID').AsString;
   DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString:=  DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString;
   if DMTE.cdsRegCxP.recordcount>1 then begin
      DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString :=  DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
      DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString :=  DMTE.cdsRegCxP.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
   end
   else
     begin
       DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
       DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString :=  DMTE.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
     end;

   DMTE.cdsCntCaja.FieldByName('CCOSID').AsString  :=  DMTE.cdsRegCxP.FieldByName('CCOSID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDH').AsString    :=  DMTE.cdsRegCxP.FieldByName('DEDH').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:=  DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:=  DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
   DMTE.cdsCntCaja.FieldByName('TMONID').AsString :=  DMTE.cdsRegCxP.FieldByName('TMONID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMTOORI').AsFloat:=  DMTE.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
   if DMTE.cdsRegCxP.FieldByName('TMONID').AsString= DMTE.wtMonLoc then
   begin
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;                                          //DOC
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= DMTE.FRound(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat/DMTE.cdsRegCxP.FieldByName('DETCPAG').AsFloat,15,2);
   end
   else
   begin
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:= DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.FRound( DMTE.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat*DMTE.cdsRegCxP.FieldByName('DETCDOC').AsFloat, 15,2);
   end;

   DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
   DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
   DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString:= FRegistro.xModulo;
   
   if DMTE.vRN_GLOSADET='S' then
      DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsRegCxP.fieldBYName('DEGLOSA').AsString
   else
       DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;

//   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
   xReg:=xReg+1;
   DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  :=  xReg;
end;

procedure TFMovBcos.Contab_DifCambio;
var
    xDif_Camb : real;
    xSql,xSql1 : String;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
   //08/05/2001 - pjsv
   // se valida por sugerencia de Jorge y Jose, me confirmaron que por el tipo
  // de moneda de la cabecera, para que no genere <> de cambio cuando es local
   xsql := 'TMONID='+quotedstr(dblcTMon.Text);
   xsql1 := 'TMONID='+quotedstr(DMTE.cdsRegCxP.FieldByName('TMONID').AsString);
   {If (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') or
      (DMTE.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then}
   if (dblcTMon.Text=DMTE.wTMonLoc) and (DMTE.cdsRegCxP.FieldByName('TMONID').AsString<>DMTE.wTMonLoc) then
   begin
     if DMTE.cdsRegCxP.FieldByName('DETCDOC').Value <> DMTE.cdsRegCxP.FieldByName('DETCPAG').Value then
      begin
        DMTE.cdsCntCaja.Insert;
        DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsRegCxP.FieldByName('CIAID').Value;
        DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsRegCxP.FieldByName('TDIARID').Value;
        DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsRegCxP.FieldByName('ECNOCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsRegCxP.FieldByName('DOCID2').Value;
        DMTE.cdsCntCaja.FieldByName('DCSERIE').Value :=  DMTE.cdsRegCxP.FieldByName('CPSERIE').Value;
        DMTE.cdsCntCaja.FieldByName('DCNODOC').Value :=  DMTE.cdsRegCxP.FieldByName('CPNODOC').Value;
        DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value;
        DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value :=  DMTE.cdsRegCxP.FieldByName('CPFEMIS').Value;
        DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  DMTE.cdsRegCxP.FieldByName('CPFVCMTO').Value;
        //CIM 23/11/2001
        if DMTE.cdsRegCxP.recordcount>1 then
         begin
           DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsRegCxP.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
           DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsRegCxP.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
         end
        else
          begin
            DMTE.cdsCntCaja.FieldByName('CLAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
            DMTE.cdsCntCaja.FieldByName('DCAUXID').Value :=  DMTE.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
          end;
        //*
        DMTE.cdsCntCaja.FieldByName('CCOSID').Value  :=  DMTE.cdsRegCxP.FieldByName('CCOSID').Value;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsRegCxP.FieldByName('DETCPAG').Value;
        DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  DMTE.cdsRegCxP.FieldByName('DETCDOC').Value;

        DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
        DMTE.cdsCntCaja.FieldByName('DCUSER').Value  :=  DMTE.wUsuario;
        DMTE.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
        DMTE.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
        DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
        DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
        DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECANO').Value;
        DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECMM').Value;
        DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECDD').Value;
        DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsEgrCaja.FieldByName('ECSS').Value;
        DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECSEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsEgrCaja.FieldByName('ECTRI').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsEgrCaja.FieldByName('ECAASS').Value;
        DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAASEM').Value;
        DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsEgrCaja.FieldByName('ECAATRI').Value;
        DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
        DMTE.cdsCntCaja.FieldByName('TMONID').AsString :=  DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
        DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString:= 'Diferencia de Cambio';
        xReg:=xReg+1;
        DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  :=  xReg;

        if DMTE.cdsRegCxP.FieldByName('TMONID').AsString=DMTE.wtMonLoc then
        begin   //Provision en Mon.Local                                                             //DOC
           xDif_Camb:=abs(DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value/DMTE.cdsRegCxP.FieldByName('DETCPAG').Value -
                          DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value/DMTE.cdsRegCxP.FieldByName('DETCPAG').Value);//En Mon.Ext.
              DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := xDif_Camb;

           if DMTE.cdsRegCxP.FieldByName('DETCDOC').Value > DMTE.cdsRegCxP.FieldByName('DETCPAG').Value then
              DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H'
           else
              DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';

        end
        else
        begin                                            //Provision en Mon.Ext.                   
           xDif_Camb:=abs(DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value*DMTE.cdsRegCxP.FieldByName('DETCDOC').Value -
                          DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value*DMTE.cdsRegCxP.FieldByName('DETCPAG').Value);//En Mon.Local
              DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := xDif_Camb;

           if DMTE.cdsRegCxP.FieldByName('DETCDOC').Value > DMTE.cdsRegCxP.FieldByName('DETCPAG').Value then
              DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D'
           else
              DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
        end;
        if DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'D' then
         begin
           DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoPer;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaPer;
         end
        else
         begin
           DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
           DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
         end;
      end
    end;
end;

procedure TFMovBcos.Contabiliza;
var
   xRegAct : TBookMark;
   xSQL    : String;
begin
    // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera

    xsql:='DELETE FROM CAJA304 '
         +'WHERE CIAID='   +quotedstr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)   +' AND '
         +      'ECANOMM=' +quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) +' AND '
         +      'TDIARID=' +quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) +' AND '
         +      'ECNOCOMP='+quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
    try
       DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
    except
    end;

    // vhn 23/01/2001
    xSQL:='Select * from CAJA304 Where CIAID='''' and '
         +  'ECANOMM='''' and TDIARID='''' and ECNOCOMP='''' ';
    DMTE.cdsCNTCaja.Close;
    DMTE.cdsCNTCaja.DataRequest( xSQL );
    DMTE.cdsCNTCaja.Open;
    //
    xReg:=0;

    DMTE.cdsCntCaja.Insert;
    Contab_EgrCaja;

    DMTE.cdsRegCxP.DisableControls;
    xRegAct := DMTE.cdsRegCxP.GetBookmark;
    DMTE.cdsRegCxP.First;

   // GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde el Detalle
    While not DMTE.cdsRegCxP.Eof do Begin
       DMTE.cdsCntCaja.Insert;
       Contab_RegCxP;
       Contab_DifCambio;
       DMTE.cdsRegCxP.Next;
    end;
    DMTE.cdsRegCxP.GotoBookmark(xRegAct);
    DMTE.cdsRegCxP.FreeBookmark(xRegAct);
    DMTE.cdsRegCxP.EnableControls;

    //Actualizamos en la tabla de Contabilidad
    DMTE.cdsCntCaja.ApplyUpdates(0);
//    DMTE.ActualizaData(DMTE.cdsCntCaja);
end;

procedure TFMovBcos.z2bbtnContClick(Sender: TObject);
var
 xSql : String;
begin
   if DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString = 'C' then
   begin

     if DMTE.cdsEgrCaja.fieldbyname('FEXTCHQ').AsString = '1' then
     begin
        ShowMessage('No Puede Contabilizar este Movimiento ' + #13 +
                    'Pues se encuentra extornado');
        Exit;
     end;
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
       Screen.Cursor := crHourglass;
       RecCptosDifC;

       Contabiliza;             // Realiza la generacion del Asiento

  		  ActualizaCNT311 (DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
												 DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
												 DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
												 DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString);

				if SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
										DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
										DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
										DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
										DMTE.SRV_D, 'C', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
										DMTE.cdsResultSet, DMTE.DCOM1, Self ) then
				begin

					 DMTE.cdsEgrCaja.Edit ;
					 DMTE.cdsEgrCaja.FieldByName('ECConta').AsString:='S';   //Establece como Contabilizado el flag
           DMTE.cdsEgrCaja.FieldByName('ECUSER').Value     := DMTE.wUsuario; // usuario que registra
           DMTE.cdsEgrCaja.FieldByName('ECFREG').Value     := DateS;         // fecha que registra Usuario
           DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;         // Hora de Registro de Usuario
					 DMTE.cdsEgrCaja.DataRequest('SELECT * FROM CAJA302');
					 DMTE.AplicaDatos(DMTE.cdsEgrCaja, 'EGRCAJA');
				end;

       z2bbtnCont.Enabled := False;
       lblEstado.Caption  :='Cancelado y Contab.';
       Screen.Cursor := crDefault;
     end;
   end
   else begin
       ShowMessage('Imposible Contabilizar');
   end;
end;

procedure TFMovBcos.z2bbtnAnulaClick(Sender: TObject);
begin
    if DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString='I' then begin

      if MessageDlg('¿Anular Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then begin

         DMTE.cdsEgrCaja.CancelUpdates;
         DMTE.cdsRegCxP.CancelUpdates;

         DMTE.cdsEgrCaja.Edit;
         DMTE.cdsEgrCaja.FieldByName('ECEstado').AsString:='A';
         DMTE.cdsEgrCaja.ApplyUpdates(0);
//         DMTE.ActualizaData(DMTE.cdsEgrCaja);

         dbgDetPagoIButton.Enabled:=False;
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

procedure TFMovBcos.ActPnlBotones;
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

procedure TFMovBcos.FormClose(Sender: TObject; var Action: TCloseAction);
var xSQL:string;
begin
   if pnlActualiza.Visible then
   begin
      z2bbtnCancel3.SetFocus;
      z2bbtnCancel3Click(nil);
   end;

   if DMTE.cdsEgrCaja.Active then DMTE.cdsEgrCaja.CancelUpdates;
   if DMTE.cdsRegCxP.Active  then DMTE.cdsRegCxP.CancelUpdates;

   // Limpiamos los filtros
   DMTE.cdsRegCxP.Filtered :=False;
   DMTE.cdsCCBco.Filtered  :=False;

   cf1.QuitarExits(self);
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

procedure TFMovBcos.IniciaPanel;
begin
     dbeSerie.Text       := '';
     dbeNoDoc2.Text      := '';
     dblcdCnp2.Text      := '';
     dblcDCnp2.Text       := '';

     //nueva linea para reemplazar a la que  le sigue
     dblcdCCosto.Text     := '';
     dblcdCCosto.Text     := '';
     dblcTMon2.Text      := '';
     dbeImporte2.Text    := '';
     dbeTCamDoc.Text     := '';
     edtCuenta2.Text     := '';
     edtMtoLoc.Text      := '';
     edtMtoExt.Text      := '';
     edtCnp2.Text    := '';
end;

procedure TFMovBcos.dbgDetPagoIButtonClick(Sender: TObject);
begin
   inhabilitarpaneles;
   AdicionarREgistros;
end;

procedure TFMovBcos.z2bbtnCancel3Click(Sender: TObject);
begin
     bFlagRecuperacion:=false;
     if DMTE.cdsRegCxP.State = dsInsert then
        DMTE.cdsRegCxP.Delete
     else
     begin
        if DMTE.cdsRegCxP.State = dsedit then
          DMTE.cdsRegCxP.Cancel;
     end;
     PnlActualiza.Visible := False;
     pnlDetPago.Enabled   := True;
     pnlBotones.Enabled   := True;
     z2bbtnSumatClick(sender);    // Al salir hay que totalizar
   //quitar los filtros que se hubieran establecido
     liberarfiltrosregistroegresos;
end;

procedure TFMovBcos.dbeNoRegExit(Sender: TObject);
begin
   if not z2bbtnCancel3.Focused then
   begin
      dbeNoReg.Text:=DMTE.strzero(dbeNoReg.Text,10);
      if strtoint(dbeNoReg.Text)=0 then
      begin     // NoRegistro
         dbeNoReg.Text:='';
         ShowMessage('No es valido el No Registro');
         dbeNoReg.SetFocus;
         exit;
      end;
       DMTE.cdsRegCxP.FieldByName('CPNOREG').Value  := dbeNoReg.Text;
   end
   else
   dbeNoReg.Text:='';
end;

procedure TFMovBcos.z2bbtnOK2Click(Sender: TObject);
begin
   // VALIDA LA CUENTA DEL CONCEPTO
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,dblcdCnp2.text,'')) and (dblcTMon2.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+DMTE.cdsQry.FieldByName('CUENTAID').AsString+' del Concepto '+dblcdCnp2.text+' Se registra sólo en Moneda Extranjera.');
   end;

   if DMTE.cdsRegCxP.State=dsInsert then
     if EncuentraDuplicado(DMTE.cdsRegCxP,'CPNoReg',dbeNoReg.Text) then
     begin
       ShowMessage('Numero de Registro duplicado');
       dbeNoReg.SetFocus;
       exit;
     end;
   if not ValidaCampo then
   begin
      //ShowMessage('No se puede grabar')
   end
   else
   begin
      DMTE.cdsregcxp.fieldbyname('DEDH').AsString    := dbeDH.text;
      // A PEDIDO DE COUS 06/03/2003
      DMTE.cdsregcxp.fieldbyname('DEGLOSA').AsString := edtCnp2.text;
      DMTE.cdsregcxp.Post;
      wmodifica:=True;
      //
      if not dbeNoReg.Enabled then
      begin
        PnlActualiza.Visible := False;
        pnlDetPago.Enabled   := True;
        pnlBotones.Enabled   := True;
        z2bbtnSumatClick(sender);    // Al salir hay que totalizar
        //quitar los filtros que se hubieran establecido
        liberarfiltrosregistroegresos;
      end
      else
      begin
           adicionarRegistros;
      end;
   end;
end;

procedure TFMovBcos.dblcTMon2Exit(Sender: TObject);
var xWhere, aux: string;
begin
   if  z2bbtnCancel3.Focused then exit;

    xWhere:='TMONID='+''''+DMTE.cdsRegCxP.FieldByName('TMONID').AsString+'''';
    aux:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
    if (length(aux)>0) and (DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value>0) then begin
      if DMTE.cdsRegCxP.FieldByName('TMONID').AsString= DMTE.wTMonLoc then
      begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value := (DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value);
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value := (DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value/DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value);
      end
      else
      begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:= (DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value*DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value);
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:= (DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value);
      end;
    end
    else begin
         DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=0;
         DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=0;
    end;
end;

procedure TFMovBcos.dbdtpFComp2Exit(Sender: TObject);
begin
   DMTE.cdsRegCxP.FieldByName('CPANOMM').Value:=copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value),7,4)
                              +copy(datetostr(DMTE.cdsRegCxP.FieldByName('DEFCOMP').Value),4,2);
end;

procedure TFMovBcos.dblcTMon2Change(Sender: TObject);
var xWhere:string;
begin
   xWhere:='TMONID='+''''+dblcTMon2.Text+'''';
   edtTMon2.Text:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
end;

procedure TFMovBcos.dblcCnp2Change(Sender: TObject);
var xWhere:string;
begin
   xWhere:='CPTOID='+''''+dblcdCnp2.text+'''';
   edtCnp2.Text:=DMTE.DisplayDescrip('prvCxP','CAJA201','CPTODES',xWhere,'CPTODES');
end;

procedure TFMovBcos.dblcCnp2Exit(Sender: TObject);
var xWhere:string;
begin
   xWhere:='CPTOID='+''''+dblcdCnp2.text+'''';
   DMTE.cdsRegCxP.FieldByName('CUENTAID').Value:=DMTE.DisplayDescrip('prvCxP','CAJA201','CUENTAID',xWhere,'CUENTAID');
end;

procedure TFMovBcos.dbeImporte2Exit(Sender: TObject);
var xWhere, aux: string;
begin
      if  z2bbtnCancel3.Focused then
          exit;
      xWhere:='TMONID='+''''+DMTE.cdsRegCxP.FieldByName('TMONID').AsString+'''';
      aux:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
      if (length(aux)>0) and (DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value>0) then begin
        if DMTE.cdsRegCxP.FieldByName('TMONID').AsString= DMTE.wTMonLoc then begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value/DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
        end
        else begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value*DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=DMTE.cdsRegCxP.FieldByName('DEMTOORI').Value;
        end;
      end
      else begin
           DMTE.cdsRegCxP.FieldByName('DEMTOLOC').Value:=0;
           DMTE.cdsRegCxP.FieldByName('DEMTOEXT').Value:=0;
      end;
end;

procedure TFMovBcos.dbgDetPagoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (dbgDetPagoIButton.Enabled=True) and (key = VK_DELETE) and (ssCtrl in Shift) then begin
      if (DMTE.cdsRegCxP.RecordCount=0) then
          ShowMessage('No hay registros')
       else begin
          if MessageDlg('¿Eliminar Registro?',mtconfirmation,[mbYes,mbNo],0)=mrYes then begin
             DMTE.cdsRegCxP.Delete;    // Borro en el original..
             z2bbtnSumatClick(sender);    // Al salir hay que totalizar
         end;
      end;
   end;
end;

procedure TFMovBcos.dbeDHChange(Sender: TObject);
begin
     if not ((dbeDH.Text='D') or (dbeDH.Text='H') or (length(dbeDH.Text)=0)) then begin
        dbeDH.Text:='';
        dbeDH.SetFocus;
     end;
end;

procedure TFMovBcos.dbgDetPagoCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
//Comentado por WMC ESTE CODIGO SE ENCARGA DE PONER EN
//AZUL LOS NUMEROS DEL GRID(TAMBIEN LOS PONE EN ROJO)
{    if (Field.FieldName = 'DEMTOLOC') or (Field.FieldName = 'DEMTOEXT') then begin
	if (DMTE.cdsRegCxPDEDH.Value = 'H') then
           AFont.Color := clRed
        else
           AFont.Color := clBlue;
    end;}
end;

procedure TFMovBcos.dbeLoteExit(Sender: TObject);
begin
   if z2bbtnCancel.Focused then
      exit;

   dbeLote.text:=DMTE.StrZero(dbeLote.text,DMTE.cdsEgrCaja.FieldByName('ECLOTE').DisplayWidth);
end;

procedure TFMovBcos.dblcdProvChange(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFMovBcos.edtProvRUCChange(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFMovBcos.dbeTCambioChange(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFMovBcos.dbeNoDocChange(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFMovBcos.dbeNoChqChange(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFMovBcos.dbeLoteChange(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFMovBcos.dbeGlosaChange(Sender: TObject);
begin
    wmodifica:=True;
end;

procedure TFMovBcos.FormKeyPress(Sender: TObject; var Key: Char);
var
   xStr : String;
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
    if not aplicaKeyPress(self ,A2digitos , A4digitos) then
       Exit;
    if not( Key in [ '0'..'9' , '.' , #8 ]) then
    begin
       Key := #0;
    end;
    xStr := TCustomEdit(self.ActiveControl).text;
    if key = '.' then
       if pos('.',xSTR) <> 0 then
          Key := #0;
end;

procedure TFMovBcos.z2bbtnOKCabClick(Sender: TObject);
var
   xStr ,
   xWhere :String;
   xSQL : string;
begin
   //dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsEgrCajaECNOCOMP.DisplayWidth);
   if validacionCabecera=false then exit;

   with DMTE do begin
      xWhere :=  'CIAID ='+''''+        dblcCia.Text +  ''''
                +' AND TDIARID ='+''''+ dblcTDiario.Text+''''
                +' AND ECANOMM ='+''''+ edtPeriodo.Text+''''
                +' AND ECNOCOMP ='+''''+dbeNoComp.Text +'''';

      if DisplayDescrip('prvTGE','CAJA302','COUNT(*) TOTREG',xWhere,'TOTREG') > '0' then
      begin
          ShowMessage('Comprobante ya esta registrado');
          dbeNoComp.Text:='';
          dbeNoComp.SetFocus;
          exit;
      end
      else
      begin
        GrabaCabeceraDeComprobante;

        lblEstado.Caption:='Nuevo     ';

         DMTE.cdsRegCxP.Filtered := False;

         //cdsEgrCaja.Insert;

         // vhn 22/01/2001
         xSQL:='Select * from CAJA301 '
              +'Where CIAID='''   +dblcCia.Text    +''' and '
              +      'ECANOMM=''' +edtPeriodo.Text +''' and '
              +      'TDIARID=''' +dblcTDiario.Text+''' and '
              +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
         DMTE.cdsRegCxP.Close;
         DMTE.cdsRegCxP.DataRequest( xSQL );
         DMTE.cdsRegCxP.Open;


        //aqui se recupera el tipo de cambio
        xSTR := 'FECHA = '+wRepFuncDate+''''+ formatdatetime(DMTE.wFormatFecha,dbdtpFComp.date)+''')';
        if DMTE.RecuperarDatos('TGE107',DMTE.wTipoCambioUsar,xSTR) then
           dbeTCambio.Text :=  DMTE.cdsRec.fieldbyname(DMTE.wTipoCambioUsar).AsString
        else
           dbeTCambio.Text := '0.00';
        //fin de recuperacion del tipo de cambio

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
   wmodifica := False;
   pnlCabecera2.SetFocus;
   perform(CM_DialogKey,VK_TAB,0);

end;

procedure TFMovBcos.LookUpMostrado(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
Var
  edicion :^Tedit;
begin
  if modified=true then
  begin
     edicion:=(ptr((Sender as TwwDBCustomLookupCombo).tag));
     if (LookupTable.Eof) or (LookupTable.Eof)
        or ((Sender as TwwDBCustomLookupCombo).Text <> LookUpTable.Fields[0].AsString) then
     begin
         edicion.Text:='';
         (Sender as twwDBCustomLookupCombo).text:='';
     end
     else
         edicion.Text:=LookupTable.Fields[1].AsString;
  end;
end;

procedure TFMovBcos.NoEstaenLookUp(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
Var edicion :^Tedit;
begin
   edicion:=(ptr((Sender as TwwDBLookupCombo).tag));
   edicion.text:='';
   (sender as TwwDBLookUpCombo).text:='';
end;

procedure TFMovBcos.dblcTDocNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
     NoEstaEnLookUp(Sender,LookupTable,NewValue,Accept);
end;

procedure TFMovBcos.dblcTDocCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  LookUpMOstrado(Sender, LookupTable,FillTable, modified);
end;

procedure TFMovBcos.dblcTMonCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
var
xWhere : String;
begin
  if modified=true then
  begin
     if (LookupTable.Bof) or (LookupTable.Eof)
        or ((Sender as TwwDBCustomLookupCombo).Text <> LookUpTable.Fields[0].AsString) then
     begin
         edtTmon.text:='';
         dbeTCambio.Text:='';
         dblcTMon.Text:='';
     end
     else
     begin
         edtTmon.text:=LookupTable.Fields[1].AsString;
         xWhere := 'TMONID='+''''+dblcTMon.Text+''''
                   +' AND FECHA='+DMTE.wRepFuncDate + quotedStr( formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date)) +')';
         if length(DMTE.DisplayDescrip('prvTGE','TGE107','TMONID, TCAMVOV',xWhere,'TMONID'))>0 then
          dbeTCambio.Text:=DMTE.cdsqry.fieldbyname('TCAMVOV').AsString;
     end;
  end;
end;

procedure TFMovBcos.dblcTMonNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  //codigo par el que no esta en lista
  //blanquera los dos adicionales
  edtTmon.text:='';
  dbeTCambio.Text:='';
  dblcTMon.Text:='';
end;

procedure TFMovBcos.InhabilitarPaneles;
begin

   pnlDetPago.Enabled  := False;
   pnlBotones.Enabled  := False;
   IniciaPanel;
   pnlActualiza.BringToFront;
   pnlActualiza.Visible:= True;
   dbeNoReg.Enabled    := True;
   dbeNoReg.Color      := clWindow;
   dbeNoReg.SetFocus;
   //Aqui se establecen los filtros para edicion en el grid
   establecerfiltrosRegistroEgresos;
end;

procedure TFMovBcos.EdiTarRegistros;
begin
   DMTE.cdsRegCxP.Edit;                                 //Lo pongo en modo de edicion
   dbeNoReg.Text:=DMTE.cdsRegCxP.FieldByName('CPNOREG').Value;
   dbeDH.text := DMTE.cdsregcxp.fieldbyname('DEDH').AsString;
   dbeNoReg.Enabled:=false;
   dbeNoReg.Enabled := False;
   dbeNoReg.Color   := clBtnFace;

   //Recuperacion de los detalles del panel
//   if trim( dblcdCnp2.Text ) <> '' then
   edtCnp2.Text := DMTE.cdsregcxp.fieldbyname('DEGLOSA').AsString;
   dbeNoReg.Text:=DMTE.cdsRegCxP.FieldByName('CPNOREG').Value;
   if (trim( dblcdCnp2.Text ) <> '') and (edtCnp2.Text='') then
      edtCnp2.Text  :=  DMTE.DisplayDescrip('prvTGE','CAJA201','CPTOABR','CPTOID=''' + dblcdCnp2.Text + '''','CPTOABR');

   if trim( dblcdAuxDet.Text ) <> '' then
   begin
      dbeAuxDet.Text:=  DMTE.DisplayDescrip('prvTGE','CNT201','AUXABR',
                               'CLAUXID = ''' +
                               DMTE.cdsRegCxP.fieldbyname('CLAUXID').AsString
                                + ''' AND AUXID=''' + dblcdAuxDet.Text + '''','AUXABR');
      edtClase.Text :=  DMTE.DisplayDescrip('prvTGE','TGE102','CLAUXABR',
                               'CLAUXID = ''' +
                               DMTE.cdsRegCxP.fieldbyname('CLAUXID').AsString + ''' ','clauxabr');

   end;
   if trim( dblcTMon2.Text ) <> '' then
      edtTMon2.Text     := DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblctmon2.Text,'TMONABR');


   if not DMTE.cdsRegCxP.FieldByName('PROV').Isnull then
   begin
      if trim(DMTE.cdsRegCxP.FieldByName('PROV').AsString) <> '' then
      begin
            dblcdAuxDet.Enabled := True;
      end
      else
      begin
            dblcdAuxDet.Enabled := False;
      end;
   end
   else
   begin
      dblcClase.Enabled   := False;
      dblcdAuxDet.Enabled := False;
   end;

   if not DMTE.cdsRegCxP.FieldByName('CCOSID').Isnull then
   begin
      if trim(DMTE.cdsRegCxP.FieldByName('CCOSID').AsString) <> '' then
            dblcdCCosto.Enabled := True
      else
            dblcdCCosto.Enabled := False;
   end
   else
      dblcdCCosto.Enabled := False;

//
   dblcClase.Enabled   := dblcdAuxDet.Enabled;
   if not dblcclase.Enabled then
   begin
      edtClase.Text  := '';
      dbeAuxDet.Text := '';
   end
   else
      if not DMTE.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClase.Text ]),[]) then
         Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''');

      {if rgbTipMov.ItemIndex = 0 then
         DMTE.cdsRegCxP.FieldByName('DEDH').AsString     := 'H'     //Inicializo en Habe
      else
         DMTE.cdsRegCxP.FieldByName('DEDH').AsString     := 'D';     //Inicializo en Debe}
  //**
end;

procedure TFMovBcos.AdicionarRegistros;
begin
   with DMTE do
   begin
      dbeNoReg.Enabled:=true;
      dbeNoReg.Text:='';
      dbeNoReg.Text := GeneraCorrelativo( DMTE.cdsRegCxP , 'CPNOREG' );

      cdsRegCxP.Insert;
      cdsRegCxP.FieldByName('CIAID').Value   := dblcCia.Text;
      cdsRegCxP.FieldByName('TDIARID').Value := dblcTDiario.Text;
      cdsRegCxP.FieldByName('ECANOMM').Value := edtPeriodo.Text;
      cdsRegCxP.FieldByName('ECNOCOMP').Value:= dbeNoComp.Text;
      cdsRegCxP.FieldByName('DETCPAG').Value := strtofloat(dbeTCambio.Text);
      cdsRegCxP.FieldByName('DEFCOMP').Value := dbdtpFComp.Date;
      cdsRegCxP.FieldByName('DOCID2').Value  := dblcTDoc.Text;
      cdsRegCxP.FieldByName('DOCMOD').Value  := DMTE.cdsTDoc.FieldByname('DOCMOD').AsString;
      cdsRegCxP.FieldByName('CPSerie').Value := '000';
      cdsRegCxP.FieldByName('CPNoDoc').Value := dbeNoDoc.Text;
      cdsRegCxP.FieldByName('TMONID').AsString := dblcTMon.Text;
      cdsRegCxP.FieldByName('CPFEMIS').Value := DateS;
      cdsRegCxP.FieldByName('CPFVCMTO').Value:= DateS;
      cdsRegCxP.FieldByName('CPANOMM').Value := copy(datetostr(cdsRegCxP.FieldByName('DEFCOMP').Value),7,4)
                              + copy(datetostr(cdsRegCxP.FieldByName('DEFCOMP').Value),4,2);
      cdsRegCxP.FieldByName('DETCPAG').Value := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value;
      {if rgbTipMov.ItemIndex = 0 then
         cdsRegCxP.FieldByName('DEDH').AsString     := 'H'     //Inicializo en Habe
      else
         cdsRegCxP.FieldByName('DEDH').AsString     := 'D';     //Inicializo en Debe}

      cdsREgCxP.FieldBYName('DETCDOC').AsString := dbeTCambio.Text;
      cdsRegCxP.FieldByName('CPTOID').AsString  := dblcdCnp.Text;
      dbeNoReg.SetFocus;
   end;
   //blanqueo de descripciones
   edtCnp2.Text  := '';
   dbeAuxDet.Text:= '';
   edtTMon2.Text := edtTMon.Text;

//   dblcClase.Enabled   := False;
//   dblcdAuxDet.Enabled := False;
   dblcdCCosto.Enabled := False;

end;


procedure TFMovBcos.dbgDetPagoDblClick(Sender: TObject);
begin
   if not dbgdetpagoibutton.Enabled then
      exit;

   if dbgDetPago.DataSource.DataSet.RecordCount<>0 then
   begin
      inHabilitarPaneles;
      editarRegistros;
   end;
end;


procedure TFMovBcos.LiberarFiltrosRegistroEgresos;
begin
      DMTE.cdsTDoc.Filter:='';
      DMTE.cdsTDoc.Filtered:=true;

      bFlagRecuperacion:=false;
end;
procedure TFMovBcos.EstablecerFiltrosRegistroEgresos;
begin
      DMTE.cdsTDoc.Filter   := ' NOT ( TDIARID IS NULL ) OR NOT ( TDIARID2 IS NULL ) ';
      DMTE.cdsTDoc.Filtered := True;
      bFlagRecuperacion    := True;
end;

procedure TFMovBcos.FormCreate(Sender: TObject);
begin

   DMTE.cdsRegCxP.DisableControls;

   DMTE.ASignaTipoDiario(dblcTDiario,self);

   cdsConceptoC1 := TwwClientdataset.Create(Self);
   cdsConceptoC1.CloneCursor(DMTE.cdsCnpEgr ,True);
   cdsConceptoC1.Name   := 'cdsConceptoC1';
   cdsConceptoC1.Filter := 'CPTOIS=''E''';
   cdsConceptoC1.Filtered := True;

   dblcdCnp2.LookupTable := cdsConceptoC1;

   DMTE.cdsRegCxP.EnableControls;
   setlength(A2digitos,1);
   setlength(A4digitos,1);
   A4digitos[0] := dbeTCambio;
   cf1 := TControlFoco.Create;
   DMTE.cdsFEfec.Filter := 'FLUEFE_IS = ''I'' ';
   DMTE.cdsFEfec.Filtered := True;

end;

procedure TFMovBcos.dblcdCnp2Exit(Sender: TObject);
var
   sSQL,xWhere,xCCos,xAux : string;
begin
  //** 22/03/2001 - pjsv
   ssql := 'CPTOID='+quotedstr(dblcdCnp2.text);
   edtCnp2.Text := DMTE.DisplayDEscrip('prvTGE','CAJA201','CPTODES,CUENTAID',ssql,'CPTODES');
   if Trim(edtCnp2.Text) = '' then
   begin
      DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString := '';
      //dblcdAuxDet.Enabled := False;
      dblcdCCosto.Enabled := False;
   end
   else
   begin
      DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString := DMTE.cdsQry.FieldbyName('CUENTAID').AsString;
   // Busca y Habilita
      xWhere:='CIAID='+quotedstr(dblcCia.Text)+' and CUENTAID='+quotedstr(DMTE.cdsRegCxP.FieldByName('CUENTAID').AsString);
      if length(DMTE.DisplayDescrip('prvTGE','TGE202','CUENTAID,CTA_CCOS,CTA_AUX',xWhere,'CUENTAID'))>0 then
      begin
         xCCos := DMTE.cdsQry.fieldbyname('CTA_CCOS').AsString;
         xAux := DMTE.cdsQry.fieldbyname('CTA_AUX').AsString;
         if xCCos='S' then
         begin
            sSQL := 'select * from TGE203 where CCOSMOV='+quotedstr('S');
            DMTE.cdsCCosto.Close;
            DMTE.cdsCCosto.DataRequest(sSQL);
            DMTE.cdsCCosto.Open;
            dblcdCCosto.Enabled:=true;
         end
         else
            dblcdCCosto.Enabled := False;
           //a pedido de OUS 28/01/2003 
{         if xAux='S' then
            dblcdAuxDet.Enabled := True
         else
            dblcdAuxDet.Enabled := False;}
      end
      else
      begin
         ShowMessage('Concepto no tiene Cuenta Contable Asignada!!!');
         dblcdCnp2.SetFocus;
         exit;
      end;
   end;
   dblcClase.Enabled :=  dblcdAuxDet.Enabled;
   if (trim(edtCnp2.Text) <> '') and (StrTmp <> dblcdCnp2.Text) then
   begin
      if not dblcdAuxDet.Enabled then
      begin
         DMTE.cdsRegCxP.FieldByName('PROV').AsString    := '';
         DMTE.cdsRegCxP.FieldByName('CLAUXID').AsString := '';
         edtClase.Text  := '';
         dbeAuxDet.Text := '';
      end;
      if not dblcdCCosto.Enabled then
         DMTE.cdsRegCxP.FieldByName('CCOSID').AsString := '';
   end;
   //**
end;

procedure TFMovBcos.Button1Click(Sender: TObject);
begin
  dblcdCCosto.Text:='';
end;

function TFMovBcos.ValidacionCabecera: Boolean;
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

procedure TFMovBcos.z2bbtnImprimeClick(Sender: TObject);
var
   xECMTOORI,xECMTOLOC,xECMTOEXT : STRING;
   Comprobante : RCabComprobante;
   xsql:string;
begin
   z2bbtnSumatClick(NIL);
   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' THEN
	 begin

         CalculaMontos(xECMTOORI,xECMTOLOC,xECMTOEXT);
         DMTE.cdsEgrCaja.Edit;
         DMTE.cdsEgrCaja.fieldbyname('ECMTOORI').AsString:= xECMTOORI;
         DMTE.cdsEgrCaja.fieldbyname('ECMTOLOC').AsString:= xECMTOLOC;
         DMTE.cdsEgrCaja.fieldbyname('ECMTOEXT').AsString:= xECMTOEXT;
         DMTE.cdsEgrCaja.Post;
         DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

   	   RecCptosDifC ;
         Contabiliza;



      ActualizaCNT311( DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
                       DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                       DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                       DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString );

      if SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                  DMTE.SRV_D, 'P', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                  DMTE.cdsResultSet, DMTE.DCOM1, Self ) then

      ImprimeVoucher( 'CNT311', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
 	 end;

   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' THEN
	 begin
      ImprimeVoucher( 'CNT301', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
   end;
end;

procedure TFMovBcos.ValidacionCabecera1;
begin
   // Nota: El "raise" termina el procedure o function si es que se da la consistencia
   // En este punto ya se ha probado todas las consistencias y ya se puede grabar

   try
    // consistencia de Datos
      ValidaEDit( dblcCia ,   'Falta Codigo de Compañia'  );
      ValidaEDit( dblcTDiario,'Falta Tipo de Diario'      );
      ValidaEDit( dblcTMon,   'Falta Tipo de Moneda'      );
      ValidaEDit( dbeTCambio, 'Falta Tipo de Cambio'      );
      ValidaEDit( dblcTDoc,   'Falta Tipo de Documento'   );
      ValidaEDit( dbeNoDoc,   'Falta Nro.de Documento'    );
      ValidaEDit( dblcBanco,  'Falta definir Caja / Banco');
      ValidaEDit( dbeLote,    'Falta Lote'                );
      ValidaEDit( dblcdCnp,   'Falta Concepto'            );


      if dblcCCBco.Enabled=True then
      begin
         ValidaEDit( dblcCCBco , 'Falta Cuenta Corriente Banco' );
//         ValidaEDit( edtCCBco , 'Codigo de Cta Cte Errado');
      end;

      //** 06/06/2001- pjsv , se deshabilita xque se han ocultado estos controles
//      if dblcFormPago.Enabled=True then
//         ValidaEDit( dblcFormPago , 'Falta Forma de Pago' );
      //**

      if strtofloat(dbeTCambio.Text)<=0 then
      begin
         dbeTCambio.SetFocus;
         raise exception.Create('Tipo de Cambio Errado');
      end;
      if rgbTipMov.ItemIndex = -1 then
      begin
         rgbTipMov.SetFocus;
         raise Exception.create('Ingrese Tipo de Movimiento');
      end;
   except
      raise;
   end;

end;


procedure TFMovBcos.Adiciona;
var   xSQL : String;
begin
   IniciaDatos;

   dblcCCBco.Selected.Clear;
   dblcCCBco.Selected.Add('CCBCOID'#9'25'#9'Cuenta Corriente del Banco'#9'F');
   dblcCCBco.Selected.Add('CCBCODES'#9'30'#9'Descripción'#9'F');
   dblcCCBco.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');
   
   xGraboNuevo := False;

   // vhn 23/01/2001
   xSQL:='Select * from CAJA301 '
        +'Where CIAID='''' and ECANOMM='''' and '
        +      'TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsRegCxP.Close;
   DMTE.cdsRegCxP.DataRequest( xSQL );
   DMTE.cdsRegCxP.Open;
   //
   DMTE.cdsRegCxP.Filter := 'CIAID=''''';
   DMTE.cdsRegCxP.Filtered := True;

   z2bbtnNuevo.Visible := True;
   Z2bbtnCancel.Visible := True;
   DMTE.RecuperaCierre( wFechacierre , wFrecu );
   if wFechaCierre = 0 then
   begin
      dbdtpFComp.date := dateS;
   end
   else
   begin
      if (tDate(date) > wFechaCierre) and (tdate(date)<=wFechaCierre+wFrecu) then
          dbdtpFComp.date := dateS
      else
          dbdtpFComp.date := wFechaCierre+1;
   end;
end;

procedure TFMovBcos.Edita(Comp: structComprobante;cds : Twwclientdataset);
var
   xERROR :String;
   xSQL : string;
begin
   IniciaDatos;

   with DMTE do
   begin
      dblcCia.Text     := Comp.CIAID;
      dblcTDiario.Text := Comp.TDIARID;
      edtPeriodo.Text  := Comp.ECANOMM;
      dbeNoComp.Text   := Comp.ECNOCOMP;

      // vhn 22/01/2001
      xSQL:='Select * from CAJA301 '
           +'Where CIAID='''   +Comp.CIAID    +''' and '
           +      'ECANOMM=''' +Comp.ECANOMM  +''' and '
           +      'TDIARID=''' +Comp.TDIARID  +''' and '
           +      'ECNOCOMP='''+Comp.ECNOCOMP +''' ';
      DMTE.cdsRegCxP.Close;
      DMTE.cdsRegCxP.DataRequest( xSQL );
      DMTE.cdsRegCxP.Open;

      // Asignar desde valores del registro activo
      dbdtpFComp.date  := cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
      dblcTMon.Text    := cdsEgrCaja.FieldByName('TMONID').AsString;
      dbeTCambio.Text  := cdsEgrCaja.FieldByName('ECTCAMB').AsString;
      dblcTDoc.Text    := cdsEgrCaja.FieldByName('DOCID').AsString;
      dbeNoDoc.Text    := cdsEgrCaja.FieldByName('ECNODOC').AsString;
      dblcBanco.Text   := cdsEgrCaja.FieldByName('BANCOID').AsString;
      dblcCCBco.Text   := cdsEgrCaja.FieldByName('CCBCOID').AsString;
      edtCuenta.Text   := cdsEgrCaja.FieldByName('CUENTAID').AsString;
      dbeLote.Text     := cdsEgrCaja.FieldByName('ECLOTE').AsString;
      dblcdCnp.Text    := cdsEgrCaja.FieldByName('CPTOID').AsString;
      dbeGlosa.Text    := cdsEgrCaja.FieldByName('ECGLOSA').AsString;
      dblcdFEfec.Text  := cdsEgrCaja.FieldByName('FLUEID').AsString;
      dblcClase.Text   := cdsEgrCaja.FieldByName('CLAUXID').AsString;

      DMTE.SQLAdicEgresos(dblcCia.Text,edtPeriodo.Text,
                          dblcTDiario.Text,dbeNoComp.Text , xERROR);
      DMTE.cdsRec.active := False;
      DMTE.cdsRec.active := True;

      if not DMTE.cdsRec.FieldByName('DOCDES').isnull then
         edtTDoc.Text := DMTE.cdsRec.FieldByName('DOCDES').AsString;


      if not DMTE.cdsRec.FieldByName('BANCOABR').isnull then
         edtBanco.text := DMTE.cdsRec.FieldByName('BANCOABR').AsString;

      if not DMTE.cdsRec.FieldByName('FLUEFEABR').isnull then
         dbeFEfec.text := DMTE.cdsRec.FieldByName('FLUEFEABR').AsString;

      edtCia.Text := DMTE.FieldNoNulo(DMTE.cdsRec.fieldBYname('CIADES'));
      edtTDiario.Text := DMTE.FieldNoNulo(DMTE.cdsRec.fieldBYname('TDIARABR'));;

      {if cdsEgrCaja.FieldByName('EC_IE').AsString ='I' then
         rgbTipMov.ItemIndex := 0
      else
         rgbTipMov.ItemIndex := 1;}

      if cdsEgrCaja.FieldByName('ECEstado').AsString='I' then      //Si está INCOMPLETO
      begin

         cdsEgrCaja.Edit;
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
         wbChq       := True;
         lblEstado.Caption    :='Activo             ';
      end;

      if cdsEgrCaja.FieldByName('ECEstado').AsString='C' then      //Si está CANCELADO
      begin
         pnlCabecera1.Enabled := False;    // Desactivar Panel1
         pnlCabecera2.Enabled := False;    // Desactivar Panel2
         pnlDetPago.Enabled   := True;     // Activar Panel de Detalle
         pnlBotones.Enabled   := True;     // Activar Panel de Botones

         dbgDetPagoIButton.Enabled:=False;
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
         wbChq       := False;

         ActPnlBotones;
      end;

      if cdsEgrCaja.FieldByName('ECEstado').AsString='A' then      // Si esta ANULADO
      begin
         pnlCabecera1.Enabled := False;    // Desactivar Panel1
         pnlCabecera2.Enabled := False;    // Desactivar Panel2
         pnlDetPago.Enabled   := True;     // Activar Panel de Detalle
         pnlBotones.Enabled   := True;     // Activar Panel de Botones

         dbgDetPagoIButton.Enabled:=False;
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
         wbChq       := False;
         ActPnlBotones;
         lblEstado.Caption     :='Anulado            ';
      end;

      z2bbtnSumatClick(nil);

      z2bbtnOkCab.enabled:=false;
      wmodifica := False;
      z2bbtnNuevo.Visible := False;
      Z2bbtnCancel.Visible := False;

   end;{fin del with}
end;


procedure TFMovBcos.FormShow(Sender: TObject);
var
   TransComp : structComprobante ;
   xSql : string;
begin
   if DMTE.wModo='A' then
   begin
      Adiciona ;
   end;
   begin
      Edita( TransComp ,FRegistro.xFiltroMovBancos.fmant.cds2) ;
   end;

  //** 05/04/2001 - pjsv
  xsql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
  DMTE.cdsCCosto.Close;
  DMTE.cdsCCosto.DataRequest(xsql);
  DMTE.cdsCCosto.open;
  //** 04/06/2001 - pjsv, para grabar el nuevo voucher
  xVoucher := '';
  //**

   with DMTE do
   begin
      if Trim(dblcBanco.Text) <> '' then
      begin
          if cdsEgrCaja.FieldByName('ECEstado').AsString='I' then      //Si está INCOMPLETO
          begin
               pnlCabecera2.SetFocus;
               perform(CM_DialogKey,VK_TAB,0);
          end;

          if (cdsEgrCaja.FieldByName('ECEstado').AsString='C') or
             (cdsEgrCaja.FieldByName('ECEstado').AsString='A') then      //Si está CANCELADO
          begin
            pnlBotones.SetFocus;
            perform(CM_DialogKey,VK_TAB,0);
          end;
       end
       else
       begin
         RecuperarCiaUnica(dblcCia,edtCia);
         edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                            +copy(datetostr(dbdtpFComp.date),4,2);
         if dblccia.text <> '' then
            perform(CM_DialogKey,VK_TAB,0);
       end;
   end;

   z2bbtnSumatClick(nil);


   cf1.PonerExits;
end;

procedure TFMovBcos.AdicIniciaDatos;
begin
   RecuperarCiaUnica(dblcCia,edtCia);
   edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
   if dblccia.text <> '' then
      perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFMovBcos.ActualizaSaldosCaja;
begin
    if trim(dblcCCBco.TEXT) <> '' then
    begin
       DMTE.ActSdoTlfn(dblcCia.text,dblcBanco.text,dblcCCBCo.Text,
                      DMTE.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                      DBDTPfcOMP.DATE);
       DMTE.ActSdoMen(dblcBanco.text,dblcCCBCo.Text,
                      DMTE.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                      DBDTPfcOMP.DATE);
    end;
end;

procedure TFMovBcos.ConfiguraAccesos;
begin
    if DMTE.wAdmin = 'G' then
       Proc_Admin
    else
    begin
       if DMTE.wModo = 'C' then
          Proc_Consul
       else
          DMTE.AccesosUsuarios( DMTE.wModulo,DMTE.wUsuario,'2',Screen.ActiveForm.Name );
    end;
end;

procedure TFMovBcos.Libera_Admin;
begin
    Pon( A1 , A2 , pnlBotones );
end;

procedure TFMovBcos.Libera_Consul;
begin

end;

procedure TFMovBcos.Proc_Admin;
var
   Contador : Integer;
begin
    pnlCabecera1.Enabled := False;
    pnlCabecera2.Enabled := False;
    pnlDeTPago.Enabled := False;
    //Array de controles y eventos
    Contador := BotonesEnPanel( pnlBotones );
    setlength( A1 , Contador);
    setlength( A2 , Contador);
    Quita(A1,A2,pnlBotones);

    pnlBotones.Enabled := True;
end;

procedure TFMovBcos.Proc_Consul;
begin
    pnlCabecera1.Enabled := False;
    pnlCabecera2.Enabled := False;
    pnlDeTPago.Enabled := True;
    pnlBotones.Enabled := False;
end;

procedure TFMovBcos.LibConfigAccesos;
begin
    if DMTE.wAdmin = 'G' then
       Libera_Admin
    else
    begin
       if DMTE.wModo = 'C' then
          Libera_Consul;
    end;
end;

procedure TFMovBcos.dbeTCambioEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text;
end;

procedure TFMovBcos.dbeTCambioExit(Sender: TObject);
begin
    if strTmp <> dbeTCambio.text then
    begin
       dbeTcambio.text := CajaDec(dbeTCambio.text,4);
    end;
end;

procedure TFMovBcos.wwDBEdit1Change2(Sender: TObject);
begin
    wmodifica:=True;

end;


procedure TFMovBcos.RecCptosDifC;
begin
    if trim(dblcCCBco.Text) = '' then
    begin
       if not DMTE.RecuperarDatos('TGE105','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP','BANCOID=''' + dblcBanco.Text + '''' )  then
          Raise exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio');
    end
    else
    begin
       if not DMTE.RecuperarDatos('TGE106','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP','BANCOID=''' + dblcBanco.Text +
                                 ''' AND CCBCOID=''' + dblcCCBco.Text + '''' )  then
          Raise exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio');
    end;
    wCptoGan  := DMTE.cdsRec.fieldbyname('CPTODIFG').AsString;
    wCptoPer  := DMTE.cdsRec.fieldbyname('CPTODIFP').AsString;
    wCtaGan   := DMTE.cdsRec.fieldbyname('CTADIFG').AsString;
    wCtaPer   := DMTE.cdsRec.fieldbyname('CTADIFP').AsString;

end;

procedure TFMovBcos.dblcClaseExit22(Sender: TObject);
begin
   if z2bbtnCancel3.Focused then exit;
   if dblcdCnp2.Focused     then exit;

   edtClase.text:= DMTE.DisplayDescripLocal(DMTE.cdsClaseAux,'CLAUXID',dblcClase.Text,'CLAUXDES') ;

   if length(dblcClase.text)>0 then
   begin
      if edtClase.Text='' then begin
         dblcdAuxDet.Text := '';
         dbeAuxDet.Text := '';
         ShowMessage('Error : Clase de Auxiliar no Válido');
         dblcClase.SetFocus;
         Exit;
      end;
      DMTE.cdsAux.Filter:='CLAUXID='+quotedstr(dblcClase.Text);
      DMTE.cdsAux.Filtered:=True;
   end;
end;

procedure TFMovBcos.dblcdAuxEnter2(Sender: TObject);
begin
 //a pedido de ous 28/01/2003
{    if trim(dblcClase.Text) = '' then
    begin
       dblcClase.SetFocus;
       exit;
    end;}
end;

procedure TFMovBcos.dblcdAuxExit2(Sender: TObject);
begin

   if dblcClase.Focused  then Exit;
   if z2bbtnCancel3.Focused then exit;
   if dblcdCnp2.Focused     then exit;

   dbeAuxDet.text:= DMTE.DisplayDescripLocal(DMTE.cdsAux,'AUXID',dblcdAuxDet.Text,'AUXNOMB') ;

   if (dbeAuxDet.Text='') and (length(Trim(dblcClase.text))>0) then begin
      ShowMessage('Error : Auxiliar no Valido');
      dblcdAuxDet.SetFocus;
      Exit;
   end;
end;

procedure TFMovBcos.dblcdCnpExit2(Sender: TObject);
begin
   if z2bbtnCancel.Focused then exit;
   if dbeLote.Focused      then exit;

   dbeGlosa.text := DMTE.DisplayDescripLocal(DMTE.cdsCnpEgr,'CPTOID',dblcdCnp.Text,'CPTODES') ;

   if dbeGlosa.text='' then begin
      ShowMessage('Error : Concepto no Valido');
      dblcdCnp.SetFocus;
   end;
end;

procedure TFMovBcos.Valida;
begin
   if DMTE.cdsRegCxP.RecordCount = 0 then
   begin
      Raise Exception.create( 'Ingrese Detalles del MOvimiento' );
   end;
end;

procedure TFMovBcos.FormDestroy(Sender: TObject);
begin
   DMTE.cdsBancoEgr.Filter             := '';
   DMTE.cdsBancoEgr.filtered           := False;
   cf1.Free;
end;

procedure TFMovBcos.dblcdFEfecEnter(Sender: TObject);
begin
   strTmp := dblcdFEfec.Text;
end;

procedure TFMovBcos.dblcdFEfecExit(Sender: TObject);
begin
//Validacion
  if trim(TCustomEdit(Sender).Text) <> strTmp then
  begin
     if trim(TCustomEdit(Sender).Text) <> '' then
     begin
        if DMTE.RecuperarDatos('TGE217','FLUEFEABR','FLUEFEID=''' + TCustomEdit(Sender).Text + ''' ') then
        begin
          dbeFEfec.Text := DMTE.cdsRec.fieldbyname('FLUEFEABR').AsString;
        end
        else
        begin
          TCustomEdit(Sender).Text := '';
          dbeFEfec.Text := ''
        end;
     end
     else
        dbeFEfec.Text := ''
  end;
  TCustomEdit(Sender).Text := trim(TCustomEdit(Sender).Text);
end;

procedure TFMovBcos.CalculaMontos ( var xECMTOORI,xECMTOLOC,xECMTOEXT:String );
Var
   x1 ,x2 : Currency;
begin

{   if rgbTipMov.ItemIndex = 0 then //Ingreso
   begin

      x1 := DMTE.OperClientDataSet ( DMTE.cdsRegCxP , 'SUM(DEMTOLOC)' , 'DEDH=''H''' );
      x2 := DMTE.OperClientDataSet ( DMTE.cdsRegCxP , 'SUM(DEMTOLOC)' , 'DEDH=''D''' );
      xECMTOLOC := currtostr( x1 - x2 );

      x1 := DMTE.OperClientDataSet ( DMTE.cdsRegCxP , 'SUM(DEMTOEXT)' , 'DEDH=''H''' );
      x2 := DMTE.OperClientDataSet ( DMTE.cdsRegCxP , 'SUM(DEMTOEXT)' , 'DEDH=''D''' );
      xECMTOEXT := currtostr( x1 - x2 );
   end
   else }                           //Egreso
//   begin
      x1 := DMTE.OperClientDataSet ( DMTE.cdsRegCxP , 'SUM(DEMTOLOC)' , 'DEDH=''D''' );
      x2 := DMTE.OperClientDataSet ( DMTE.cdsRegCxP , 'SUM(DEMTOLOC)' , 'DEDH=''H''' );
      if x1>x2 then
      begin
        x2:=x2+Abs(xDifLoc);
      end
      else
      begin
        x1:=x1+Abs(xDifLoc);
      end;
      //
      xECMTOLOC := currtostr( x1 );

      x1 := DMTE.OperClientDataSet ( DMTE.cdsRegCxP , 'SUM(DEMTOEXT)' , 'DEDH=''D''' );
      x2 := DMTE.OperClientDataSet ( DMTE.cdsRegCxP , 'SUM(DEMTOEXT)' , 'DEDH=''H''' );
      if x1>x2 then
      begin
        x2:=x2+Abs(xDifExt);
      end
      else
      begin
        x1:=x1+Abs(xDifExt);
      end;
      xECMTOEXT := currtostr( x1 );

     //xECMTOLOC:=xECMTOLOC+Abs(xDifLoc);
     //xECMTOEXT:=xECMTOEXT+Abs(xDifExt);

   if dblcTMon.Text = DMTE.wTMonLoc then
   begin
      xECMTOORI :=   xECMTOLOC;
   end
   else
   begin
      xECMTOORI :=   xECMTOEXT;
   end;
end;


procedure TFMovBcos.ActualizaFiltro;
begin
   if z2bbtnNuevo.Visible then
   begin
      if not xGraboNuevo then
         cdsFiltro.Append;
      DMTE.ActualizaCDS(DMTE.cdsEgrCaja,cdsFiltro);
   end
   else
   begin
      DMTE.ActualizaCDS(DMTE.cdsEgrCaja,cdsFiltro);
   end;
   xGraboNuevo := True;
end;

procedure TFMovBcos.AsignaCDSFiltro(cds: TwwClientDataset);
begin
    cdsFiltro := cds;
end;

procedure TFMovBcos.rgbTipMovClick(Sender: TObject);
begin
    {If rgbTipMov.ItemIndex = 0 then
     dbeDH.text := 'H'
    else
     If rgbTipMov.ItemIndex = 1 then
      dbeDH.text := 'D'}
end;

procedure TFMovBcos.dblcTDiarioExit(Sender: TObject);
var
   xWhere : String;
begin
   edtTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE104','TDIARDES','TDIARID='+quotedstr(dblcTDiario.text),'TDIARDES');
   if edtTDiario.Text<>'' then
   begin
      xWhere:='CIAID='+quotedstr(dblcCia.Text)+' AND ECANOMM='+quotedstr(edtPeriodo.Text)
             +' AND TDIARID='+ quotedstr(dblcTDiario.Text); // + ' AND EC_PROCE='+quotedstr('1');
      dbeNoComp.text:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text, DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size );
   end;

end;

procedure TFMovBcos.GrabaCabeceraDeComprobante;
var xSQL:string;
begin
    DMTE.cdsEgrCaja.Insert;
    DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString:='X';
    DMTE.cdsEgrCaja.FieldByName('CIAID').AsString:=dblcCia.Text;
    DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString:=edtPeriodo.Text;
    DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString:=dblcTDiario.Text;
    DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString:=dbeNoComp.Text;

    xSQL:='Select * from CAJA302 '
    			+'Where CIAID='''   +dblcCia.Text    +''' and '
    			+      'ECANOMM=''' +edtPeriodo.Text +''' and '
    			+      'TDIARID=''' +dblcTDiario.Text+''' and '
    			+      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
    DMTE.cdsEgrCaja.DataRequest( xSQL );
    DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');
end;

procedure TFMovBcos.dblcTDoc1Exit(Sender: TObject);
begin
//  EDTtdOC.Text := DMTE.displaydescrip('prvTGE','TGE110','DOCABR','DOCID='+quotedstr(dblcTDoc.text),'DOCABR');
//  wmodifica:=True;
end;

procedure TFMovBcos.dblcdCCostoExit(Sender: TObject);
begin
   if (dblcdCCosto.Enabled) and (length(Trim(dblcdCCosto.text))=0) then
   begin
      Showmessage('Ingrese Centro Costo');
      dblcdCCosto.SetFocus;
      Exit;
   end;

end;

end.

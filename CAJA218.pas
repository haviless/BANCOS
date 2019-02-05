unit Caja218;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Wwdbigrd, Grids, Wwdbgrid, StdCtrls, Wwdbdlg, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls,wwClient,CajaDM,db, wwDialog,
  wwidlg, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCache,
  ppDB, ppDBPipe, ppBands, ppCtrls, ppPrnabl, ppDBBDE, oaContabiliza, DBTables, Wwquery,
  Wwkeycb, ComCtrls, wwriched, ppStrtch, ppRichTx, ppViewr, Variants, ppTypes,
  oaVariables, FileCtrl;

type
  TFTransferencia = class(TForm)
    pnlCabecera2: TPanel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    dbeNoComp: TwwDBEdit;
    dblcTDiario2: TwwDBLookupCombo;
    edtTDiario2: TEdit;
    dbeNoComp2: TwwDBEdit;
    z2bbtnOKCab: TBitBtn;
    pnlDetTrans: TPanel;
    Label13: TLabel;
    dbgTrans: TwwDBGrid;
    dbgTransIButton: TwwIButton;
    pnlBotones: TPanel;
    lblEstado: TLabel;
    z2bbtnSumat: TBitBtn;
    Z2bbtnImprimeE: TBitBtn;
    z2bbtnGraba: TBitBtn;
    z2bbtnCancelado: TBitBtn;
    z2bbtnCancel: TBitBtn;
    z2bbtnNuevo: TBitBtn;
    z2bbtnSube: TBitBtn;
    z2bbtnCont: TBitBtn;
    z2bbtnAnula: TBitBtn;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TEdit;
    dblcCCBco: TwwDBLookupCombo;
    edtCuenta: TEdit;
    dblcBanco2: TwwDBLookupCombo;
    edtBanco2: TEdit;
    dblcCCBco2: TwwDBLookupCombo;
    edtCuenta2: TEdit;
    edtMoneda: TEdit;
    edtMoneda2: TEdit;
    dblcdCnp: TwwDBLookupComboDlg;
    dbeTCambio: TwwDBEdit;
    dbeLote: TwwDBEdit;
    dbeGlosa: TwwDBEdit;
    z2bbtnCancelCab: TBitBtn;
    pnlCabecera1: TPanel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    dbdtpFComp: TwwDBDateTimePicker;
    edtPeriodo: TEdit;
    dbeNoDoc: TwwDBEdit;
    dblcTMonO: TwwDBLookupCombo;
    dblcTMonD: TwwDBLookupCombo;
    Z2bbtnImprimeI: TBitBtn;
    dbeLiquida: TwwDBEdit;
    lblLiquida: TLabel;
    z2bbtnCarta: TBitBtn;
    pnlCarta: TPanel;
    Label1: TLabel;
    z2bbtnImpCarta: TBitBtn;
    z2bbtnCierraCarta: TBitBtn;
    flbCarta: TFileListBox;
    pprptCarta: TppReport;
    ppdbMant1: TppBDEPipeline;
    pnlActualiza: TPanel;
    Label2: TLabel;
    Label12: TLabel;
    dblcTMon2: TwwDBLookupCombo;
    dbeImporte2: TwwDBEdit;
    edtTMon2: TEdit;
    edtMtoLoc: TwwDBEdit;
    edtMtoExt: TwwDBEdit;
    z2bbtnOK2: TBitBtn;
    z2bbtnCancel3: TBitBtn;
    dbeTCambio2: TwwDBEdit;
    dbeNoReg: TwwDBEdit;
    dblcBanco3: TwwDBLookupCombo;
    edtBanco3: TEdit;
    dbeFPago: TwwDBEdit;
    Label3: TLabel;
    dbeGiradoA: TwwDBEdit;
    pnlBusca: TPanel;
    dbgTransf: TwwDBGrid;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Z2bbtnBusca: TBitBtn;
    dblcFormPago: TwwDBLookupCombo;
    edtFormPago: TEdit;
    dbeCheque: TwwDBEdit;
    isBusca: TwwIncrementalSearch;
    lblBusca: TLabel;
    Z2bbtnEmiChq: TBitBtn;
    Z2bbtChqVouch: TBitBtn;
    ppdbpChqVouch: TppDBPipeline;
    pprChqVouch: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppImporte: TppLabel;
    ppAno: TppLabel;
    ppMes: TppLabel;
    ppDia: TppLabel;
    ppGiradoA: TppLabel;
    ppMontoLetras: TppLabel;
    ppFecha: TppDBText;
    ppTipoCambio: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppCtaBanco: TppLabel;
    ppGiradoA2: TppLabel;
    ppGlosa: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppImporte2: TppLabel;
    ppMoneda: TppLabel;
    ppComprobante: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBText20: TppDBText;
    wwDBRichEdit1: TwwDBRichEdit;
    wwDBRichEdit2: TwwDBRichEdit;
    rptOficio: TppReport;
    ppHeaderBand2: TppHeaderBand;
    rchtPagina: TppRichText;
    ppDetailBand3: TppDetailBand;
    z2bbtnGeneraCarta: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    BitBtn3: TBitBtn;
    procedure dbdtpFCompChange(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dbdtpFCompEnter(Sender: TObject);
    procedure dblcTDiarioEnter(Sender: TObject);
    procedure dblcTDiario2Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dblcTDiario2Exit(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);
    procedure dbeNoComp2Exit(Sender: TObject);
    procedure dbeLoteExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcCCBcoExit(Sender: TObject);
    procedure dblcBanco2Exit(Sender: TObject);
    procedure dblcCCBco2Exit(Sender: TObject);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure z2bbtnSubeClick(Sender: TObject);
    procedure z2bbtnCalcClick(Sender: TObject);
    procedure z2bbtnCanceladoClick(Sender: TObject);
    procedure z2bbtnNuevoClick(Sender: TObject);
    procedure dbgTransIButtonClick(Sender: TObject);
    procedure dbgTransDblClick(Sender: TObject);
    procedure z2bbtnCancel3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure z2bbtnSumatClick(Sender: TObject);
    procedure z2bbtnOK2Click(Sender: TObject);
    procedure dbeNoRegExit(Sender: TObject);
    procedure dbeImporte2Exit(Sender: TObject);
    procedure dblcTMon2Exit(Sender: TObject);
    procedure dbeImporte2Enter(Sender: TObject);
    procedure dbgTransKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure z2bbtnGrabaClick(Sender: TObject);
    procedure z2bbtnAnulaClick(Sender: TObject);
    procedure z2bbtnCancelClick(Sender: TObject);
    procedure dbeTCambioChange(Sender: TObject);
    procedure dbeLoteChange(Sender: TObject);
    procedure dbeGlosaChange(Sender: TObject);
    procedure z2bbtnContClick(Sender: TObject);
    procedure z2bbtnCancelCabClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbeTCambioEnter(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure dblcTMonDExit(Sender: TObject);
    procedure dblcTMonOExit(Sender: TObject);
    procedure Z2bbtnImprimeEClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbeFPagoExit(Sender: TObject);
    procedure dblcBanco3Exit(Sender: TObject);
    procedure Z2bbtnImprimeIClick(Sender: TObject);
    procedure z2bbtnCartaClick(Sender: TObject);
    procedure z2bbtnCierraCartaClick(Sender: TObject);
    procedure z2bbtnImpCartaClick(Sender: TObject);
    procedure flbCartaChange(Sender: TObject);
    procedure Z2bbtnBuscaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure dbgTransfTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure isBuscaExit(Sender: TObject);
    procedure dblcCCBcoEnter(Sender: TObject);
    procedure dblcCCBco2Enter(Sender: TObject);
    procedure Z2bbtnEmiChqClick(Sender: TObject);
    procedure Z2bbtChqVouchClick(Sender: TObject);
    procedure dbeChequeExit(Sender: TObject);
    procedure pprChqVouchPrintingComplete(Sender: TObject);
    procedure z2bbtnGeneraCartaClick(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure rptOficioPreviewFormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
	 // JCC 19/06/2002
		xNReg : Integer;
	//
    cf1: TControlFoco;
    strTmp: string;
    cdsCCBco1: TwwClientDataset;
    cdsCCBco2: TwwClientDataset;
    xModoEd: String;
    xEstado: String;
    xTipoCaja: String;
    xTipoCaja2: String;    
    ESPACIOCONTROL : Integer ;
    xMoneda: String;
    wModifica: Boolean;
    ctrl: TCustomEdit;
    A1 : Array of Integer ;
    A2 : Array Of TNotifyEvent ;
    A2digitos ,A4digitos : Array of TWinControl ;
    wTRANS: String;
    cdsFiltro: TwwClientDataset;
    xGraboNuevo: Boolean ;
    wFechaCierre: TDatetime;
    wFrecu: Integer;
    //** 05/04/2001 - pjsv, para Cartas
    xCarta : String;
    xRuta : String;
    //**
    //** 04/06/2001-pjsv, para el nuevo dato (CCBCOVOUCH - TGE106 y CAJA302)
    xVoucher : String;
    xVoucher1 : String;
    //**
    { Private declarations }
    procedure RecDescripCabecera ;
    procedure GrabaDetalle ;
    procedure ValidaCampo ;
    procedure RecuperaCabecera(var Trans_Comp : structComprobante) ;
    procedure RecuperaDetalle(Trans_Comp : structComprobante) ;
    function ValidaComprobante (ctrl : TCustomEdit): Boolean ;
    procedure ValidaGrabacion ;
    procedure IniciaDatos ;
    procedure Insertar;
    procedure HabilitaEdicion ;
    procedure DeshabilitaEdicion ;
    procedure HabilitaComp1 ;
    procedure HabilitaComp2 ;
    procedure Comprobante1 ;
    procedure Comprobante2 ;
    function ValidaCabecera:boolean;
    procedure ActivaBotones(xEstado: String);
    procedure ActivaBotonesCab;
    procedure DesactivaBotonesPanel(xPanel : TPanel );
    Procedure AdicionaRegistro;
    Procedure EditaRegistro;
    procedure DatosDefault ;
    procedure IniciaPanelActualiza;
    procedure CodAuxTipMon;
    procedure LLenaDescripcionesPnl;
    procedure GrabaCab1 ;
    procedure GrabaCab2 ;
    procedure LLenarDatosCab;
    procedure ConfiguraPantalla;
    procedure LLenaDescripCab ;
    procedure RecuperaEdicion;
    procedure ActualizaPaneles ( xEstado : String );
    procedure RecuperaComp(Trans_Comp : structComprobante) ;
    procedure ActualizaSaldosCaja ;
    procedure ConfiguraAccesos;
    procedure Proc_Admin;
    procedure Proc_Consul;
    procedure Libera_Admin;
    procedure Libera_Consul;
    procedure LibConfigAccesos;
    procedure ProcesaCombos(xEnabled : Boolean);
    procedure CalculaMontos (var xECMTOORI, xECMTOLOC, xECMTOEXT:String ; EC_IE : String) ;
    procedure Contabiliza ;
// JCC 19/06/2002
		procedure Contab_egrCaja(wGlosa,xCuenta,xDH : string ) ;
//
    procedure ActualizaFiltro ;
    procedure GeneraRegChqVouch;
    procedure ImprimeCarta;
    procedure GeneraCarta;
    procedure ActualizaCaja( cCia, cTDiario, cNoComp, cAnoMM : String );
  public

    { Public declarations }
    procedure Adiciona ;
    procedure Edita (Trans_Comp : structComprobante;cds : TwwClientDataSet);
    procedure AsignaCDSFiltro(cds : TwwClientDataset) ;
  end;
    function WinExecAndWait32(FileName:String; Visibility:integer):Integer;
var
  FTransferencia: TFTransferencia;
   wBcoTipCta  : string;

implementation

uses  CajaUtil, oaTE2000, Caja290;

{$R *.DFM}

procedure TFTransferencia.Adiciona;
begin
   z2bbtnNuevo.Visible := True ;
   z2bbtnCancelCab.Visible := True ;
   
   dblcCCBco.Selected.Clear;
   dblcCCBco.Selected.Add('CCBCOID'#9'25'#9'Cuenta Corriente del Banco'#9'F');
   dblcCCBco.Selected.Add('CCBCODES'#9'30'#9'Descripción'#9'F');
   dblcCCBco.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');

   dblcCCBco2.Selected.Clear;
   dblcCCBco2.Selected.Add('CCBCOID'#9'25'#9'Cuenta Corriente del Banco'#9'F');
   dblcCCBco2.Selected.Add('CCBCODES'#9'30'#9'Descripción'#9'F');
   dblcCCBco2.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');

   Insertar ;
   wModifica := False ;
end;

procedure TFTransferencia.Edita;
begin
   z2bbtnNuevo.Visible     := False ;
   z2bbtnCancelCab.Visible := False ;
   xModoEd := 'E';
   IniciaDatos ;

   HabilitaEdicion ;

   //procedimientos de Recuperacion y LLenado de Datos
   RecuperaCabecera(Trans_Comp) ;
   LlenarDatosCab ;
   RecDescripCabecera ;
   LLenaDescripCab ;

   //Recuperacion de Detalle (Grid)
   RecuperaDetalle(Trans_Comp) ;

   ConfiguraPantalla ;

   wModifica := False ;
end;

procedure TFTransferencia.IniciaDatos;
var
   A : Array of Tpanel ;
   i ,
   j : Integer;
begin
   SetLength(A,2) ;
   A[0] := pnlCabecera1 ;
   A[1] := pnlCabecera2 ;
   for i := 0 to High(A) do
   begin
      for j := 0  to A[i].ControlCount-1 do
      begin
          if A[i].Controls[j] is TCustomEdit then
             (A[i].Controls[j] as TCustomEdit).text := '' ;
      end;
   end;
end;

procedure TFTransferencia.Insertar;
var
     Trans_Comp : structComprobante ;
begin
   IniciaDatos ;
   xGraboNuevo := False ;
   //Habilitamiento de controles
   dblcCia.Enabled    := True ;
   dbdtpFComp.Enabled := True ;
   dbeNoDoc.Enabled   := True ;

   pnlCabecera1.Enabled := True ;
   pnlCabecera2.Enabled := True ;

   dblcBanco.Enabled  := True;
   dblcCCBco.Enabled  := True;
   dblcTMonO.Enabled  := True;
   dbeNoComp.Enabled  := True;
   dblcBanco2.Enabled := True;
   dblcCCBco2.Enabled := True;
   dblcTMonD.Enabled  := True;
   dbeNoComp2.Enabled := True;

   DesHabilitaEdicion ;

   Trans_Comp.CIAID    := '' ;
   Trans_Comp.ECANOMM  := '' ;
   Trans_Comp.TDIARID  := '' ;
   Trans_Comp.ECNOCOMP := '' ;
   RecuperaDetalle(Trans_Comp) ;

   xEstado := 'N' ;
   xModoEd := 'A' ;
   //configurar Pantalla
   ActivaBotonesCab ;
   pnlDetTrans.Enabled := False ;
   pnlBotones.Enabled  := False ;
   DesactivaBotonesPanel(pnlBotones) ;
   //fin de configurar Pantalla

   //Datos Default
   edtPeriodo.Text := strAno(Now)+strMes(Now) ;
   // vhndema
   dbeLote.Text:='TCAB';
   dbeGlosa.Text:='Depositos de Caja a Banco';
   // end vhndema

   RecuperarCiaUnica(dblcCia, edtCia) ;
   dbeTCambio.Text := DMTE.RecuperarTipoCambio(Now) ;
   dbgTransiButton.Enabled := True ;
   if xEstado ='N' then      // Si es NUEVO
   begin
      lblEstado.Caption := 'Nuevo            ';
   end;
   DMTE.RecuperaCierre( wFechacierre , wFrecu ) ;
   if wFechaCierre = 0 then
   begin
      dbdtpFComp.date := dateS ;
   end
   else begin
      if (tDate(Date)>wFechaCierre) and (tdate(Date)<=wFechaCierre+wFrecu) then
         dbdtpFComp.Date := DateS
      else
         dbdtpFComp.Date := wFechaCierre+1 ;
   end ;
end;

procedure TFTransferencia.DeshabilitaEdicion;
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
          begin
             if (A[i].Controls[j].Name = dbeNOComp.Name) or
                (A[i].Controls[j].Name = dbeNOComp2.Name) then
                continue;

             (A[i].Controls[j] as TCustomEdit).Enabled := True ;
          end;
      end;
   end;
end;

procedure TFTransferencia.HabilitaEdicion;
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

procedure TFTransferencia.dbdtpFCompChange(Sender: TObject);
begin
{ if not (Sender as TCustomEdit).focused then
    Exit ;

 if esfecha(dbdtpFComp.text) then
 begin
    edtPeriodo.Text := strAno(strtodatetime(dbdtpFComp.text))+strMes(strtodatetime(dbdtpFComp.text)) ;
    dbeTCambio.Text := DMTE.RecuperarTipoCambio (strToDateTime(dbdtpFComp.text));
 end
 else
 begin
    edtPeriodo.Text := '' ;
    dbeTCambio.text := '' ;
 end ;

 if edtPeriodo.Text <> '' then
 begin
    HabilitaComp1 ;
    HabilitaComp2 ;
 end ;
}
end;

procedure TFTransferencia.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text := DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIADES') ;

   if Length(edtCia.Text)=0 then
   begin
      ShowMessage('Compañía no Válida');
      dblcCia.SetFocus;
      Exit;
   end;

   HabilitaComp1 ;
   HabilitaComp2 ;
end;

procedure TFTransferencia.dbdtpFCompExit(Sender: TObject);
var
   Tmp, xSql : String ;
begin
  // vhndema
  xSql := 'SELECT * FROM TGE154 WHERE CIAID='+quotedstr(dblcCia.text)+
          ' AND ANO='+quotedstr(Copy(DateToStr(dbdtpFComp.Date),7,4));
  DMTE.cdsQry.close;
  DMTE.cdsQry.datarequest(xsql);
  DMTE.cdsQry.open;
  if DMTE.cdsQry.FieldByName('PER'+Copy(DateToStr(dbdtpFComp.Date),4,2)).AsString = 'S' then
  begin
  	 Showmessage('El periodo se encuentra Cerrado');
     dbdtpFComp.setfocus;
     exit;
  end;
  // end vhndema

   if wFechaCierre <> 0 then
      if (TwwDBDateTimePicker(Sender).date <= wFechaCierre )
         or (TwwDBDateTimePicker(Sender).date > (wFechaCierre + wFrecu) ) then
      begin
         TwwDBDateTimePicker(Sender).SetFocus ;
         ShowMessage('Ingrese Fecha dentro del Rango'+#13+
                     'Fecha de Cierre  : ' + DateTimeToStr(wFechaCierre) + #13+
                     'Frecuencia       : ' + IntToStr(wFrecu) ) ;
         Exit ;
      end ;

      //Este Código se Escribe en el caso de un error el evento change al ingresar el cero
      if EsFecha(dbdtpFComp.Text) then
      begin
         edtPeriodo.Text := strAno(dbdtpFComp.Date)+strMes(dbdtpFComp.Date);
         dbeTCambio.Text := DMTE.RecuperarTipoCambio(dbdtpFComp.Date);
         if edtPeriodo.Text<>strTmp then begin
            HabilitaComp1 ;
            HabilitaComp2 ;
            Comprobante1 ;
            Comprobante2 ;
         end;
      end
      else begin
         Tmp := strTmp ;
         ShowMessage('Ingrese Fecha') ;
         dbdtpFComp.SetFocus ;
         strTmp := Tmp ;
      end ;
end;

procedure TFTransferencia.Comprobante1;
var
   xWhere : string ;
begin
   if dbeNoComp.Enabled = False then
      Exit;

   xWhere:='CIAID='''+dblcCia.Text+''' AND TDIARID='''+dblcTDiario.Text+''''
          +' and ECANOMM='''+edtPeriodo.Text+'''';
   if DMTE.RecuperarDatos('CAJA302','MAX(ECNOCOMP) MAXIMO',xWhere) then
   begin
      if not DMTE.cdsRec.FieldByName('MAXIMO').IsNull then
         dbeNoComp.Text := DMTE.strZero(IntToStr((DMTE.cdsRec.FieldByName('MAXIMO').AsInteger +1)),10)
      else
         dbeNoComp.Text := '0000000001' ;

      if dbeNoComp2.text <> '' then
      begin
         if (dbeNoComp2.Text = dbeNoComp.Text) and
            (dblcTDiario.Text = dblcTDiario2.Text ) then
         begin
            dbeNoComp.Text := DMTE.strZero(inttostr(strtoint(dbeNoComp.text)+1),10) ;
         end ;
      end ;
   end ;
end;

procedure TFTransferencia.Comprobante2;
var
   xWhere : string ;
begin

  if dbeNoComp2.Enabled = False then
     Exit ;

  xWhere := 'CIAID='''+dblcCia.text+''' AND TDIARID = ''' + dblcTDiario2.Text +
            ''' AND ECANOMM = ''' + edtPeriodo.Text + '''' ;
  if DMTE.RecuperarDatos('CAJA302','MAX(ECNOCOMP) MAXIMO',xWhere) then
  begin
     if not DMTE.cdsRec.FieldByName('MAXIMO').IsNull then
        dbeNoComp2.Text := DMTE.StrZero(IntToStr((DMTE.cdsRec.FieldByName('MAXIMO').AsInteger +1)),10)
     else
        dbeNoComp2.Text := '0000000001' ;

     if (dbeNoComp.Text <> '') and
           (dblcTDiario.Text = dblcTDiario2.Text ) then
     begin
        if dbeNoComp2.Text = dbeNoComp.Text then
        begin
           dbeNoComp2.Text := DMTE.StrZero(IntToStr(StrToInt(dbeNoComp2.Text)+1),10) ;
        end ;
     end ;
  end;
end;

procedure TFTransferencia.dbdtpFCompEnter(Sender: TObject);
begin
    strTmp := edtPeriodo.Text ;
end;

procedure TFTransferencia.dblcTDiarioEnter(Sender: TObject);
begin
//     strTmp := dblcTDiario.Text ;
end;

procedure TFTransferencia.dblcTDiario2Enter(Sender: TObject);
begin
//    strTmp := dblcTDiario2.Text ;
end;

procedure TFTransferencia.FormShow(Sender: TObject);
var
   TransComp : structComprobante ;
begin

   if DMTE.wModo='A' then
   begin
      Adiciona
   end
   else
   begin
      Edita( TransComp, DMTE.cdsEgrCajaX );
   end;

   with DMTE do
   begin
      if xEstado <> 'N' then
      begin
          if cdsEgrCajaX.FieldByName('ECEstado').AsString='I' then//Si está INCOMPLETO o PENDIENTE
          begin
                //focus
                pnlCabecera2.SetFocus ;
                Perform(CM_DialogKey, VK_TAB, 0);
                //
          end;

          if ( cdsEgrCajaX.FieldByName('ECEstado').AsString = 'C' ) or
             ( cdsEgrCajaX.FieldByName('ECEstado').AsString = 'A' ) then      //Si está CANCELADO
          begin
               //focus
               pnlBotones.SetFocus ;
               Perform(CM_DialogKey, VK_TAB, 0);
               //
          end;
      end
      else
      begin
        //codigo nuevo
         RecuperarCiaUnica(dblcCia,edtCia);
         edtPeriodo.Text := strAno(dbdtpFComp.Date)+strMes(dbdtpFComp.Date) ;
         pnlCabecera1.SetFocus ;
         if dblcCia.Text <> '' then
            Perform(CM_DialogKey,VK_TAB,0);
        //fin de codigo nuevo
      end ;
   end ;

   z2bbtnSumatClick(nil) ;
   dbeLiquida.Enabled := True;
   xVoucher := '';
   xVoucher1 := '';
   pnlCarta.visible := False;

   cf1.PonerExits ;
end;

procedure TFTransferencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if pnlActualiza.Visible then
   begin
      z2bbtnCancel3.SetFocus ;
      z2bbtnCancel3Click(nil) ;
   end ;

   DMTE.cdsTDiario.Filtered := False ;
   cf1.QuitarExits(Self) ;

   FVariables.w_Num_Formas:=FVariables.w_Num_Formas-1;
   Action:=caFree;
end;

procedure TFTransferencia.dblcTDiarioExit(Sender: TObject);
begin
	if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then Exit;

   edtTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE104','TDIARDES','TDIARID='+QuotedStr(dblcTDiario.Text),'TDIARDES');
   if Length(dblcTDiario.Text)>0 then
   begin
     HabilitaComp1 ;
     if DMTE.wModo='A' then
       Comprobante1 ;
   end ;
end;

procedure TFTransferencia.dblcTDiario2Exit(Sender: TObject);
begin
	if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then Exit;

   edtTDiario2.Text := DMTE.DisplayDescrip('prvTGE','TGE104','TDIARDES','TDIARID='+QuotedStr(dblcTDiario2.Text),'TDIARDES');
   if length(dblcTDiario2.Text)>0 then
      begin
        HabilitaComp2 ;
       if DMTE.wModo='A' then
         Comprobante2 ;
      end ;
end;

procedure TFTransferencia.dbeNoCompExit(Sender: TObject);
var
	 xSQL : String;
begin
   if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then Exit;
	 if not ValidaComprobante( dbeNoComp ) then Exit;

   if DMTE.wModo='A' then
    begin
     xSQL := 'Select Count(*) TOTREG From CAJA302'
            +' Where CIAID ='+QuotedStr(dblcCia.Text)
            +' And ECANOMM ='+QuotedStr(edtPeriodo.Text)
            +' And TDIARID ='+QuotedStr(dblcTDiario.Text)
            +' And ECNOCOMP ='+QuotedStr(dbeNoComp.Text);

     DMTE.cdsQry.Close;
     DMTE.cdsQry.DataRequest( xSQL );
     DMTE.cdsQry.Open;
     if DMTE.cdsQry.FieldByName('TOTREG').AsInteger>0 then
      begin
       dbeNoComp.SetFocus;
       ShowMessage('Número de Registro Existe');
       Exit;
      end;
    end;
end;

procedure TFTransferencia.dbeNoComp2Exit(Sender: TObject);
var
   xSQL : String;
begin
	 if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then Exit;
	 if not ValidaComprobante( dbeNoComp2 ) then Exit;

   if DMTE.wModo='A' then
    begin
     xSQL := 'Select COUNT(*) TOTREG From CAJA302'
            +' Where CIAID ='+QuotedStr(dblcCia.Text)
            +' And ECANOMM ='+QuotedStr(edtPeriodo.Text)
            +' And TDIARID ='+QuotedStr(dblcTDiario2.Text)
            +' And ECNOCOMP ='+QuotedStr(dbeNoComp2.Text);
     DMTE.cdsQry.Close;
     DMTE.cdsQry.DataRequest( xSQL );
     DMTE.cdsQry.Open;
     if DMTE.cdsQry.FieldByName('TOTREG').AsInteger >0 then
      begin
       ShowMessage('Número de Registro Existe');
       dbeNoComp2.SetFocus;
      end;
    end;
end;

function TFTransferencia.ValidaComprobante(ctrl: TCustomEdit):Boolean;
begin
   if length(trim(ctrl.Text))>0 then
      if strtoint(ctrl.Text) <> 0 then
      begin
         Result := True;
         ctrl.Text := DMTE.StrZero(ctrl.Text,10)
      end
      else begin
         ctrl.Text := '' ;
         ShowMessage('Ingrese Comprobante') ;
         Result := False;
         ctrl.SetFocus ;
      end
   else
   begin
      ShowMessage('Ingrese Comprobante') ;
      Result:=False;
      ctrl.SetFocus ;
   end;
end;

procedure TFTransferencia.HabilitaComp1;
var
   A : Array of TCustomEdit;
   i : Integer;
begin
   SetLength(A,3);
   A[0]:= dblcCia;
   A[1]:= dbdtpFComp;
   A[2]:= dblcTDiario;

   for i:=0 to high(A) do begin
      if A[i].text='' then
         Exit;
   end;
   if DMTE.wModo = 'A' then
   begin
    dbeNoComp.Enabled:=True;
   end;
end;

procedure TFTransferencia.HabilitaComp2;
var
   A : Array of TCustomEdit ;
   i : Integer ;
begin

  SetLength(A,3) ;
  A[0] := dblcCia ;
  A[1] := dbdtpFComp ;
  A[2] := dblcTDiario2 ;

  for i := 0 to high(A) do
  begin
     if A[i].text = '' then
        Exit ;
  end;
  if DMTE.wModo='A' then
  begin
   dbeNoComp2.Enabled := True ;
  end;
end ;

procedure TFTransferencia.dbeLoteExit(Sender: TObject);
begin
	if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then Exit;
    dbeLOte.Text := DMTE.StrZero(dbeLOte.Text,4) ;
end;

procedure TFTransferencia.dblcBancoExit(Sender: TObject);
var
   sCajaBanco:string;
begin
 	 if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then Exit;

   if dbdtpFComp.Focused then Exit;
   if dbeNoDoc.Focused   then Exit;

   if dbeNoDoc.Text='' then
   begin
      ShowMessage('Debe Ingresar Nro. de Transferencia');
      dblcBanco.Text:='';
      dbeNoDoc.SetFocus;
      Exit
   end;
   
   edtBanco.Text := DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr, 'BANCOID', dblcBanco.Text, 'BANCOABR') ;

   wBcoTipCta := DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').AsString;

   if DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').Value='C' then
    begin
     If wBcoTipCta='B' Then //Busca en el CAJA402
      begin
       if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, dblcCCBco.Text, dbdtpFComp.Date ) then
        begin
         dbdtpFComp.SetFocus;
         Exit;
        end;
      end;
    end;

{  If wBcoTipCta='C' Then //Busca en el CAJA402
    begin
     if not DiaAperturado(dblcCia.Text, dbdtpFComp.Date, dblcBanco.Text) then
      begin
       dbdtpFComp.SetFocus;
       Exit;
      end
     Else
      begin
       edtBanco.Text := DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr, 'BANCOID', dblcBanco.Text, 'BANCOABR') ;
       //edtBanco.Text:=DMTE.DisplayDescrip('prvTGE','TGE105','BCOTIPCTA,BANCOABR,CUENTAID,CPTOID','BANCOID='+QuotedStr(dblcBanco.text),'BANCOABR');
       sCajaBanco := DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').AsString;
       if Length(edtBanco.Text) = 0 then
        begin
         ShowMessage('Banco de Origen no registrado');
         dblcBanco.Clear;
         dblcCCBco.Clear;
         edtBanco.Clear;
         dblcBanco.SetFocus;
         Exit;
        end;
       if sCajaBanco='C' then
        begin //Si es CAJA
         edtCuenta.Text := DMTE.cdsBancoEgr.FieldByName('CUENTAID').AsString;
         dblcdCnp.Text  := DMTE.cdsBancoEgr.FieldByName('CPTOID').AsString;

         dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE', 'TGE106', 'CCBCOVOUCH', 'BANCOID ='+QuotedStr(dblcBanco.Text), 'CCBCOVOUCH');
         dblcTDiario.OnExit(dblcTDiario);
         dblcCCBco.Clear;
         dblcCCBco.Enabled := False;
         dblcTMonO.Enabled := True;
         DMTE.cdsFormPago.Filter   := 'FCEGR=''1'' or FCEGR=''S'' or FCBCO=''1'' OR FCBCO=''S'' ' ;
         DMTE.cdsFormPago.Filtered := True ;

         if (Length(Trim(dblcBanco2.Text))>0) then
          begin    //si el destino es una caja
           if not (dblcCCBco2.Enabled ) then
            dblcTMonD.Enabled := True
           else  //si el destino es un banco
            dblcTMonD.Enabled := False ;
          end;
         xTipoCaja := 'C' ;
         dblcTMonO.SetFocus;
         dbeNoComp.Enabled := True;
         Comprobante1;
        end
       else
        begin  //Si es BANCO
         dblcCCBco.Enabled  := True;
         dblcTMonO.Enabled  := False ;
         cdsCCBco1.Filtered := False;
         cdsCCBco1.Filter   := '';   //Filtrar la lista de CtaCte por Banco
         cdsCCBco1.Filter   := 'BANCOID='+''''+dblcBanco.Text+''''+' and CIAID='+QuotedStr(dblcCia.text);
         cdsCCBco1.Filtered := True;
         //DMTE.cdsFormPago.Filter := 'FCBCO=''1'' or FCBCO=''S'' ' ;
         DMTE.cdsFormPago.Filter   := 'FCEGR=''1'' or FCEGR=''S'' or FCBCO=''1'' OR FCBCO=''S'' ' ;
         DMTE.cdsFormPago.Filtered := True ;
         dblcTMonO.Enabled := False ;
         dblcTMonD.Enabled := False ;
         xTipoCaja := 'B' ;
         dblcCCBco.SetFocus;
        end;
       wModifica := True;
      end;
    end;}

//*************************************** A N T E S ****************************


{  if DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').Value='C' then
   begin
      if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, '', dbdtpFComp.Date ) then
      begin
         dblcBanco.Text:='';
         ShowMessage('Caja ya fué Cerrada para la Fecha de Trnasferencia');
         dbdtpFComp.SetFocus;
         Exit;
      end;
   end;}

   // vhndema
   //if DiaAperturado(dblcCia.Text, dbdtpFComp.Date, dblcBanco.Text) then
   if True then
   // end vhndema
   begin
     edtBanco.Text := DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr, 'BANCOID', dblcBanco.Text, 'BANCOABR') ;
     //edtBanco.Text:=DMTE.DisplayDescrip('prvTGE','TGE105','BCOTIPCTA,BANCOABR,CUENTAID,CPTOID','BANCOID='+QuotedStr(dblcBanco.text),'BANCOABR');
     sCajaBanco := DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').AsString;
     if Length(edtBanco.Text) = 0 then
      begin
       Beep;
       MessageDlg('Banco de Origen no Registrado', mtInformation, [mbOk], 0);
    	 dblcBanco.Clear;
       dblcCCBco.Clear;
       edtBanco.Clear;
       dblcBanco.SetFocus;
       Exit;
      end;
     if sCajaBanco = 'C' then
      begin //Si es CAJA
       edtCuenta.Text := DMTE.cdsBancoEgr.FieldByName('CUENTAID').AsString;
       dblcdCnp.text  := DMTE.cdsBancoEgr.FieldByName('CPTOID').AsString;

       // vhndema
       dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE', 'TGE106', 'TMONID, CCBCOVOUCH', 'BANCOID ='+QuotedStr(dblcBanco.Text), 'CCBCOVOUCH');
       dblcTMonO.Text   := DMTE.cdsQry.FieldByName('TMONID').AsString;
 			 dblcTDiario.OnExit(dblcTDiario);
 			 dblcTMonO.OnExit(dblcTMonO);
 			 dblcCCBco.Clear;
       dblcCCBco.Enabled := False;
       dblcTMonO.Enabled := True;
       dblcTMonO.Enabled := False;

       DMTE.cdsFormPago.Filter   := 'FCEGR=''1'' or FCEGR=''S'' or FCBCO=''1'' OR FCBCO=''S'' ' ;
       DMTE.cdsFormPago.Filtered := True ;
       if (length(trim(dblcBanco2.Text))>0) then
        begin    //si el destino es una caja
         if not (dblcCCBco2.Enabled ) then
          dblcTMonD.Enabled := True
         else  //si el destino es un banco
          dblcTMonD.Enabled := False ;
        end;
       xTipoCaja := 'C' ;
       dbeNoComp.Enabled := True;
 	     Comprobante1;
       dbeNoComp.SetFocus;
       // end vhndema
      end
     else
      begin  //Si es BANCO
       dblcCCBco.Enabled  := True;
       dblcTMonO.Enabled  := False ;
       cdsCCBco1.Filtered := False;
       cdsCCBco1.Filter   := '';   //Filtrar la lista de CtaCte por Banco
       cdsCCBco1.Filter   := 'BANCOID ='+''''+dblcBanco.Text+''''+' and CIAID ='+QuotedStr(dblcCia.Text);
       cdsCCBco1.Filtered := True;
       //DMTE.cdsFormPago.Filter := 'FCBCO=''1'' or FCBCO=''S'' ' ;
       DMTE.cdsFormPago.Filter   := 'FCEGR=''1'' or FCEGR=''S'' or FCBCO=''1'' OR FCBCO=''S'' ' ;
       DMTE.cdsFormPago.Filtered := True ;
       dblcTMonO.Enabled := False ;
       dblcTMonD.Enabled := False ;
       xTipoCaja := 'B' ;
       dblcCCBco.SetFocus;
      end;
     wModifica := True;
    end
   else // si día no ha sido aperturado
    begin
     dblcBanco.Clear;
     edtBanco.Clear;
     dblcCCBco.Clear;
     edtCuenta.Clear;
     dbdtpFComp.SetFocus;
     dblcTMonO.Clear;
     edtMoneda.Clear;
     dbeNoComp.Clear;
     Exit;
    end;
end;

procedure TFTransferencia.dblcCCBcoExit(Sender: TObject);
var
	 Tmp, xWhere : String ;
begin
   if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then Exit;

	 if dblcBanco.Focused then Exit;

	 if Length(dblcCCBco.Text) = 0 then
	  begin
     ShowMessage('Debe registrar la Cuenta Corriente del Banco!');
     dblcCCBco.SetFocus;
	   Exit;
	  end;

   // vhndema
   //if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, dblcCCBco.Text, dbdtpFComp.Date ) then
   // begin
   //  dbdtpFComp.SetFocus;
   //  Exit;
   // end;
   // end vhndema 

   xWhere := 'BANCOID ='+QuotedStr(dblcBanco.Text)+' and CCBCOID ='+QuotedStr(dblcCCBco.Text);
	 edtCuenta.Text := DMTE.DisplayDescrip('prvTGE', 'TGE106', 'CCBCODES, CTAPRINC, CTAREMES, TMONID, CCBCOVOUCH', xWhere, 'CTAPRINC');

	 if Length(Trim(edtCuenta.Text))=0 then
	  begin
		 ShowMessage('La Cuenta Corriente No tiene Asignada una Cuenta Contable'+chr(13)
								 +'Actualice por Referencias');
     dblcCCBco.SetFocus;
		 Exit;
	  end;

   dblcTDiario.Text := DMTE.cdsQry.FieldByName('CCBCOVOUCH').AsString;
	 xMoneda := DMTE.cdsQry.FieldByName('TMONID').AsString ;
	 dblcTMonO.Text := xMoneda;
	 edtMOneda.Text := DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMONABR', 'TMONID ='+QuotedStr(dblcTMonO.Text), 'TMONABR');

	 if DMTE.wModo='A' then
	  begin
     dbeNoComp.Enabled := True;
     Comprobante1;
	  end;

// se parte de que la transferencia debería ser a otra cuenta con la misma moneda del Origen

   if (Length(Trim(dblcBanco2.Text))>0) and (not dblcCCBco2.Enabled) then
	  begin
     dblcTMonD.Text :=  xMoneda;
     edtMoneda2.text := dblcCCBco.LookupTable.FieldByName('TMONABR').AsString;
   	end;
end;

procedure TFTransferencia.dblcBanco2Exit(Sender: TObject);
var
   sCajaBanco : String;
//var
//   Tmp : String ;
begin
   if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then Exit;

   if dbeNoDoc.Text='' then
   begin
      ShowMessage('Debe Ingresar Nro. de Transferencia');
      dblcBanco.Text:='';
      dbeNoDoc.SetFocus;
      Exit
   end;

   if DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').Value = 'C' then
    begin
     if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco2.Text, '', dbdtpFComp.Date ) then
      begin
       dblcBanco2.Text := '';
       ShowMessage('Caja ya fué Cerrada para la Fecha de Trnasferencia');
       dbdtpFComp.SetFocus;
      end;
    end;

   // vhndema
   //if DiaAperturado(dblcCia.Text, dbdtpFComp.Date, dblcBanco2.Text) then
   if True then
   // end vhndema
    begin
     edtBanco2.Text := DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr, 'BANCOID', dblcBanco2.Text, 'BANCOABR') ;

     sCajaBanco := DMTE.cdsBancoEgr.FieldByName('BCOTIPCTA').AsString;
     if Length(edtBanco2.Text) = 0 then
      begin
       dblcBanco2.Value := '';
       edtBanco2.Text := '';
       ShowMessage('Error : Banco no Válido');
       dblcBanco2.SetFocus;
       Exit;
      end
     else
      begin
       if sCajaBanco='C' then
        begin //Si es CAJA
            //dblcTDiario2.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+QuotedStr(dblcBanco2.text),'CCBCOVOUCH');
            // SE CAMBIA EL DIARIO PORQUE ES DE INGRESO
           dblcTDiario2.Text := DMTE.DisplayDescrip('prvTGE', 'TGE106', 'CCBVOUING', 'BANCOID ='+QuotedStr(dblcBanco2.Text), 'CCBVOUING');
           dblcTDiario2.OnExit(dblcTDiario2);
           dblcCCBco2.Text := '';
           dblcCCBco2.Enabled := False;
           dblcTMonD.Enabled  := True ;
           edtCuenta2.Text := DMTE.DisplayDescrip('prvTGE', 'TGE105', 'CUENTAID', 'BANCOID ='+QuotedStr(dblcBanco2.Text), 'CUENTAID');
           dblcdCnp.Text   := DMTE.DisplayDescrip('prvTGE', 'TGE105', 'CPTOID', 'BANCOID ='+QuotedStr(dblcBanco2.Text), 'CPTOID');
           //DMTE.cdsFormPago.Filter := 'FCEGR=''1'' OR FCEGR=''S''' ;
           DMTE.cdsFormPago.Filter := 'FCEGR=''1'' or FCEGR=''S'' or FCBCO=''1'' OR FCBCO=''S'' ' ;
           DMTE.cdsFormPago.Filtered := True ;
           if (Length(Trim(dblcBanco2.Text))>0) and (dblcCCBco2.Enabled) then
            begin
             dblcTMonD.Text  := dblcTMonO.Text ;
             edtMoneda2.Text := edtMoneda.Text ;
            end ;
           xTipoCaja2 := 'C' ;
           dblcTMonD.Enabled  := True;
           dblcTMonD.SetFocus;
			     dbeNoComp2.Enabled := True;
			     Comprobante2;
         end
         else
         begin
            dblcCCBco2.Enabled := True;
            dblcTMonD.Enabled  := False ;
            cdsCCBco2.Filtered := False;
            cdsCCBco2.Filter   := '';   //Filtrar la lista de CtaCte por Banco
            cdsCCBco2.Filter   := 'BANCOID ='+''''+dblcBanco2.Text+''''+' AND CIAID='+QuotedStr(dblcCia.Text);
            cdsCCBco2.Filtered := True;
            //DMTE.cdsFormPago.Filter := 'FCBCO=''1'' or FCBCO=''S''' ;
            DMTE.cdsFormPago.Filter   := 'FCEGR=''1'' or FCEGR=''S'' or FCBCO=''1'' OR FCBCO=''S'' ' ;
            DMTE.cdsFormPago.Filtered := True ;
            dblcTMonD.Enabled := False ;
            xTipoCaja2 := 'B' ;
            dblcCCBco2.SetFocus;
         end;
         wModifica := True;
      end;
   end
   else
   begin                                                                     
      dblcBanco2.SetFocus;
      Exit;
   end;
end;

procedure TFTransferencia.dblcCCBco2Exit(Sender: TObject);
var
   Tmp, xWhere : string ;
begin
   if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then Exit;
   // JCC 18/06/2002
   if dblcBanco2.Focused then Exit;

   if length(dblcCCBco2.Text)=0 then
   begin
      Exit;
   end;

   // vhndema
   //if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco2.Text,dblcCCBco2.text, dbdtpFComp.Date ) then
   //begin
   //   ShowMessage('Error : Mes de Fecha Fue Cerrado. Verificar...');
   //   Exit;
   //end;
   // end vhndema

   xWhere := 'BANCOID ='+QuotedStr(dblcBanco2.Text)+' and CCBCOID ='+QuotedStr(dblcCCBco2.text);
   edtCuenta2.Text := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCODES,CTAPRINC,CTAREMES,TMONID,CCBVOUING',xWhere,'CTAPRINC');

   if edtCuenta2.Text <> '' then
    begin
     dblcTDiario2.Text := DMTE.cdsQry.FieldByName('CCBVOUING').AsString;
     dblcTMonD.Text    := DMTE.cdsQry.FieldByName('TMONID').AsString ;
     edtMOneda2.Text   := DMTE.displaydescrip('prvTGE','TGE103','TMONABR','TMONID='+QuotedStr(dblcTMonD.text),'TMONABR');
    end
   else
    begin
     ShowMessage('La Segunda Cuenta Corriente No tiene Asignada una Cuenta Contable'+chr(13)
     		 +'Actualice por Referencias');
     Exit;
    end;
   if DMTE.wModo='A' then
    begin
     dbeNoComp2.Enabled := True;
     Comprobante2;
    end;
end;

function TFTransferencia.ValidaCabecera : Boolean ;
begin
// try
   // Validacion de datos en blanco
      if Length(Trim(dblcCia.Text))=0 then
      begin
         ShowMessage('Ingrese Compañía');
         dblcCia.SetFocus;
         Result := False;
         Exit;
      end;
      if dbdtpFComp.date=0 then
      begin
         ShowMessage('Ingrese Fecha de Transferencia') ;
         dbdtpFComp.SetFocus;
         Result := False;
         Exit;
      end;

      if Length(Trim(dbeNoDoc.Text))=0 then
      begin
         ShowMessage('Ingrese Número de Transferencia') ;
         dbeNoDoc.SetFocus;
         Result := False;
         Exit;
      end;

      if Length(Trim(dblcBanco.Text))=0 then
      begin
         ShowMessage('Ingrese Caja o Banco de Origen') ;
         dblcBanco.SetFocus;
         Result := False;
         Exit;
      end;

      if dblcCCBco.Enabled then
       begin
        if Length(Trim(dblcCCBco.Text))=0 then
         begin
          ShowMessage('Ingrese Cuenta Corriente Origen');
          dblcCCBco.SetFocus;
          Result := False;
          Exit;
         end ;
       end;

      if dblcTMonO.Enabled then
       begin
        if Length(Trim(dblcTMonO.Text))=0 then
         begin
          ShowMessage('Ingrese Moneda Origen');
          dblcTMonO.SetFocus;
          Result := False;
          Exit;
         end ;
       end;
       // vhndema
       if dblcTMonO.Text<>dblcTMonD.Text then
         begin
          ShowMessage('Moneda de Caja/Banco Origen y Destino deben ser iguales');
          dblcBanco.SetFocus;
          Result := False;
          Exit;
         end ;
       // end vhndema  


      if Length(Trim(dblcTDiario.Text))=0 then
       begin
        ShowMessage('Ingrese Tipo de Diario Origen') ;
        dblcTDiario.SetFocus;
        Result := False;
        Exit;
       end;

      if Length(Trim(dbeNoComp.Text))=0 then
      begin
         ShowMessage('Ingrese Número de Comprobante Origen') ;
         dbeNoComp.SetFocus;
         Result := False;
         Exit;
      end;

      if Length(Trim(dblcTDiario2.Text))=0 then
      begin
         ShowMessage('Ingrese Tipo de Diario Destino') ;
         dblcTDiario2.SetFocus;
         Result := False;
         Exit;
      end;

      if Length(Trim(dbeNoComp2.Text))=0 then
      begin
         ShowMessage('Ingrese Número de Comprobante Destino') ;
         dbeNoComp2.SetFocus;
         Result := False;
         Exit;
      end;

      if Length(Trim(dblcBanco2.Text))=0 then
      begin
         ShowMessage('Ingrese Caja o Banco Destino') ;
         dblcBanco2.SetFocus;
         Result := False;
         Exit;
      end;

      if StrToFloat(dbeTCambio.Text)=0 then
      begin
         ShowMessage('Ingrese Tipo de Cambio') ;
         dbeTCambio.SetFocus;
         Result := False;
         Exit;
      end;

      if Length(Trim(dbeGlosa.Text))=0 then
      begin
         ShowMessage('Ingrese Glosa') ;
         dbeGlosa.SetFocus;
         Result := False;
         Exit;
      end;

      if length(trim(dbeLote.Text))=0 then
      begin
         ShowMessage('Ingrese Lote') ;
         dbeLote.SetFocus;
         Result := False;
         Exit;
      end;

      if dblcCCBco2.Enabled then
       begin
        if length(trim(dblcCCBco2.Text))=0 then
         begin
          ShowMessage('Ingrese Cuenta Corriente') ;
          dblcCCBco2.SetFocus;
          Result := False;
          Exit;
         end ;
       end;

   //Validación de Origen y Destino Distintos
      if (dblcBanco.Text = dblcbanco2.Text) and (dblcCCBco.Text = dblcCCBco2.Text) then
      begin
         ShowMessage('El Origen y el Destino de la Transferencia '+ #13+
                                'Deben ser diferentes ') ;
         dblcbanco2.SetFocus;
         Result := False;
         Exit;
      end;

   //Validación de Comprobante
      if xModoEd = 'A' then
      begin
          //Pendiente
          //Raise ;
      end ;
   Result := True;
//   except
//      Raise ;
//   end ;
end;

procedure TFTransferencia.z2bbtnOKCabClick(Sender: TObject);
var
   sTMonOrigen, sCheque, sSQL : string;
   xSQL : String;
begin
  // vhndema
  // Valida Periodo
  xSql := 'SELECT * FROM TGE154 WHERE CIAID='+quotedstr(dblcCia.text)+
          ' AND ANO='+quotedstr(Copy(DateToStr(dbdtpFComp.Date),7,4));
  DMTE.cdsQry.close;
  DMTE.cdsQry.datarequest(xsql);
  DMTE.cdsQry.open;
  if DMTE.cdsQry.FieldByName('PER'+Copy(DateToStr(dbdtpFComp.Date),4,2)).AsString = 'S' then
  begin
  	 Showmessage('El periodo se encuentra Cerrado');
     dbdtpFComp.setfocus;
     exit;
  end;
  // end vhndema

   // VALIDA LA CUENTA
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,'',edtCuenta.text)) and (dblcTMonO.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+edtCuenta.text+' Se registra sólo en Moneda Extranjera.');
   end;

   // VALIDA LA CUENTA
   if (DMTE.LaCuentaSeRegistraSoloEnME(dblcCia.text,'',edtCuenta2.text)) and (dblcTMonD.text=DMTE.wTMonLoc) then
   begin
      Raise Exception.Create('La cuenta '+edtCuenta2.text+' Se registra sólo en Moneda Extranjera.');
   end;

   if DMTE.wModo='M' then
    begin
     DMTE.DisplayDescrip('prvTGE', 'TGE105', 'BCOTIPCTA', 'BANCOID='+QuotedStr(dblcBanco.Text),'BCOTIPCTA');
     if DMTE.cdsQry.FieldByName('BCOTIPCTA').AsString='C' then
        xTipoCaja := 'C'
     else
        xTipoCaja := 'B';
    end;
   //*

	sCheque := DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCID',' DOCMOD=''CXC'' AND DOC_FREG=''H''', 'DOCID');

	if (xTipoCaja='B') and (xTipoCaja='B') then
	begin
		sTMonOrigen := ' AND TMONID ='+QuotedStr(dblcTMonO.text);
	end
	else
		sTMonOrigen := '';

// Para Filtrar Ingresos de Caja
	if xTipoCaja = 'C' then
   begin
		xSQL := 'Select * From CAJA314 '
			  +'Where CIAID='''+dblcCia.Text+''' AND FC_ESTADO=''C'' AND FPAGOID<>'''+DMTE.wDeposito+''' '
			  //+'Where CIAID='''+dblcCia.Text+''' AND FC_ESTADO=''C'' AND FPAGOID='''+DMTE.wCheque+''' AND '
			  //+'Where CIAID='''+dblcCia.Text+''' AND FC_ESTADO=''C'' '
				+  'and (FCTRANSF=''N'' OR FCTRANSF IS NULL OR FCTRANSF='''') AND '
				+ DMTE.wReplacCeros+'(CHQ_ESTADO,''X'')<>''DEVUELTO'' '
				+' ORDER BY TJAID, DOCID, CCSERIE, CCNODOC';
		DMTE.cdsDetFPago.Close;
		DMTE.cdsDetFPago.DataRequest( xSQL );
		DMTE.cdsDetFPago.Open;
		DMTE.cdsDetFPago.Filtered := False;
		DMTE.cdsDetFPago.Filter   := '';
		DMTE.cdsDetFPago.Filter   := '( FCTRANSF=''N'' or FCTRANSF is null or FCTRANSF='''')';
		DMTE.cdsDetFPago.Filtered := True;
	end;

	if not ValidaCabecera then Exit;

   pnlCabecera1.Enabled := False ;
	 DesactivaBotonesPanel(pnlCabecera2) ;
	 ActivaBotones(xEstado);
	 pnlCabecera1.Enabled := False ;
	 pnlCabecera2.Enabled := False ;
	 pnlDetTrans.Enabled  := True ;
	 pnlBotones.Enabled   := True ;
	 if ( Length(Trim(dblcCCBco.Text))>0 ) and ( DMTE.cdsTrans.RecordCount > 1 ) then
	  begin
		 DMTE.cdstrans.DisableControls ;
	   while not DMTE.cdsTrans.Eof do
		  begin
		   DMTE.cdsTrans.Delete;
		  end;
		 DMTE.cdstrans.EnableControls ;
	  end ;

   if DMTE.cdsTrans.RecordCount = 0 then
	  begin
		 //dbgTransIButtonClick(nil);
     Z2bbtnBuscaClick(nil);
	  end ;
end;

procedure TFTransferencia.RecuperaCabecera;
var
	 xWhere : String ;
begin
	 xWhere := 'CIAID='''   +DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString   +''' AND '
  					+'TDIARID=''' +DMTE.cdsEgrCajaX.FieldByName('TDIARID').AsString +''' AND '
	  				+'ECNOCOMP='''+DMTE.cdsEgrCajaX.FieldByName('ECNOCOMP').AsString+''' AND '
		  			+'ECANOMM=''' +DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString +''' ';

	 if DMTE.RecuperarDatos('CAJA302', 'TMONID, EC_IE, BANCOID, CCBCOID, CUENTAID, TDIARIO2, ECNOCOMP2', xWhere) then
	  begin
		 if DMTE.cdsRec.FieldByName('EC_IE').AsString = 'E' then
			begin
				 xWhere := 'CIAID='''   +DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString+''' AND  ' +
  								 'TDIARID=''' +DMTE.cdsRec.FieldByname('TDIARIO2').AsString  +''' AND '+
	  							 'ECNOCOMP='''+DMTE.cdsRec.FieldByname('ECNOCOMP2').AsString +''' AND '+
		  						 'ECANOMM=''' +DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString+ ''' ' ;
				 if DMTE.RecuperarDatos('CAJA302','BANCOID,CCBCOID,CUENTAID,TMONID',xWhere) then
				  begin
           dblcBanco2.Text := DMTE.cdsRec.FieldByname('BANCOID').AsString ;
           dblcCCBco2.Text := DMTE.cdsRec.FieldByname('CCBCOID').AsString ;
           edtCuenta2.Text := DMTE.cdsRec.FieldByname('CUENTAID').AsString ;
           dblcTMonD.Text  := DMTE.cdsRec.FieldByname('TMONID').AsString ;
          end ;
      end
     else
      begin
         dblcBanco2.Text     := DMTE.cdsRec.FieldByname('BANCOID').AsString ;
         dblcCCBco2.Text     := DMTE.cdsRec.FieldByName('CCBCOID').AsString ;
         edtCuenta2.Text     := DMTE.cdsRec.FieldByName('CUENTAID').AsString ;
         dblcTMonD.Text      := DMTE.cdsRec.FieldByName('TMONID').AsString ;
         Trans_Comp.TDIARID  := DMTE.cdsRec.FieldByName('TDIARIO2').AsString ;
         Trans_Comp.ECNOCOMP := DMTE.cdsRec.FieldByName('ECNOCOMP2').AsString ;
      end;
	 end;

   xEstado := DMTE.cdsEgrCajaX.FieldBYName('ECESTADO').AsString ;
end;

procedure TFTransferencia.RecuperaDetalle;  //(Trans_Comp : structComprobante) ;
var
   xSQL : String ;
begin
  // vhndema
  xSQL:='Select * from CAJA305 '
       +'Where CIAID='''   +DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString   +''' '
  		 +  'and TDIARID=''' +DMTE.cdsEgrCajaX.FieldByName('TDIARIO2').AsString +''' '
		   +  'and ECANOMM=''' +DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString +''' '
	  	 +  'and ECNOCOMP='''+DMTE.cdsEgrCajaX.FieldByName('ECNOCOMP2').AsString+'''';
  DMTE.cdsTrans.Close;
  DMTE.cdsTrans.DataRequest( xSQL );
  DMTE.cdsTrans.Open;
  (DMTE.cdsTrans.FieldByName('TXMTOORI') AS TFloatField).DisplayFormat := '##,###,##0.00';
  (DMTE.cdsTrans.FieldByName('TXMTOLOC') AS TFloatField).DisplayFormat := '##,###,##0.00';
  (DMTE.cdsTrans.FieldByName('TXMTOEXT') AS TFloatField).DisplayFormat := '##,###,##0.00';
end;

procedure TFTransferencia.ActivaBotones(xEstado: String);
begin

  if xEstado = 'N' then
  begin
     //** 05/04/2001 - pjsv
     z2bbtnCarta.Enabled := False;
		 //**
     z2bbtnSumat.Enabled     := True ;
     z2bbtnNuevo.Enabled     := False ;
     z2bbtnCancelado.Enabled := False ;
     z2bbtnCont.Enabled      := False ;
     z2bbtnGraba.Enabled     := True ;
     Z2bbtnBusca.Enabled     := True;
     z2bbtnAnula.Enabled     := False ;
     Z2bbtnImprimeI.Enabled  := False ;
     Z2bbtnImprimeE.Enabled  := False ;
     z2bbtnSube.Enabled      := True ;
     z2bbtnCancel.Enabled    := True ;
     Exit ;
  end ;

  if xEstado = 'I' then
  begin
     //** 05/04/2001 - pjsv
     z2bbtnCarta.Enabled := False;
     //**
     z2bbtnSumat.Enabled     := True ;
     z2bbtnNuevo.Enabled     := True ;
     z2bbtnCancelado.Enabled := True ;
     z2bbtnCont.Enabled      := False ;
     z2bbtnGraba.Enabled     := True ;
     Z2bbtnBusca.Enabled     := True;
     z2bbtnAnula.Enabled     := True ;
     z2bbtnImprimeI.Enabled  := False ;
     z2bbtnImprimeE.Enabled  := False ;
     z2bbtnSube.Enabled      := True ;
		 z2bbtnCancel.Enabled    := True ;
     Exit ;
  end ;
  if xEstado = 'C' then
  begin
     //** 05/04/2001 - pjsv
     z2bbtnCarta.Enabled := True;
     //**
     z2bbtnSumat.Enabled := True;
     z2bbtnNuevo.Enabled := True;
     z2bbtnCancelado.Enabled := False;

     if DMTE.cdsEgrCajaX.FieldByName('ECCONTA').AsString = 'S' then
        z2bbtnCont.Enabled := False
     else
        z2bbtnCont.Enabled := True ;

     z2bbtnGraba.Enabled    := False ;
     Z2bbtnBusca.Enabled    := False;
     z2bbtnAnula.Enabled    := False;
     z2bbtnImprimeI.Enabled := True;
     z2bbtnImprimeE.Enabled := True;
     z2bbtnSube.Enabled     := False ;
     z2bbtnCancel.Enabled   := False;
     Exit ;
  end ;
  if xEstado = 'A' then
  begin
     //** 05/04/2001 - pjsv
     z2bbtnCarta.Enabled := False;
		 //**
     z2bbtnSumat.Enabled     := False;
     z2bbtnNuevo.Enabled     := True;
     z2bbtnCancelado.Enabled := False;
     z2bbtnCont.Enabled      := False;
     z2bbtnGraba.Enabled     := False;
     Z2bbtnBusca.Enabled     := False;
     z2bbtnAnula.Enabled     := False;
     z2bbtnImprimeI.Enabled  := False ;
     z2bbtnImprimeE.Enabled  := False ;
     z2bbtnSube.Enabled      := False ;
     z2bbtnCancel.Enabled    := False ;
     Exit ;
  end ;
end;

procedure TFTransferencia.ActivaBotonesCab;
begin
    if xEstado = 'N' then
       pnlCabecera1.Enabled := True
    else
       pnlCabecera1.Enabled := False ;

    pnlCabecera2.Enabled := True ;
    z2bbtnOkCab.Enabled := True ;
//    z2bbtnCancel.Enabled := True ;
end;

{procedure TFTransferenciaX.DesactivaBotonesCab;
begin
    bbtnOkCab.Enabled := False ;
    bbtnCancel.Enabled := False ;
end;}

procedure TFTransferencia.z2bbtnSubeClick(Sender: TObject);
begin
     DesactivaBotonesPanel(pnlBotones) ;

     pnlDetTrans.Enabled := False ;
     pnlcabecera1.Enabled := True ;
     pnlcabecera2.Enabled := True ;
     ActivaBotonescab ;

end;

procedure TFTransferencia.DesactivaBotonesPanel;
var
   i : Integer ;
begin

   xPanel.Enabled := False ;
   for i := 0 to xPanel.ControlCount-1 do
   begin
      if xPanel.Controls[i] is TBitBtn then
         (xPanel.Controls[i] as TBitBtn).Enabled := False ;
   end;

end;

procedure TFTransferencia.z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('calc.exe', 1);  //Activa la calculadora del Windows
end;

procedure TFTransferencia.z2bbtnCanceladoClick(Sender: TObject) ;
var
   xSQL : String;
begin
// a revisar Por William Manrique Cautín
   if wModifica then
    begin
      ShowMessage('Debe Grabar o Cancelar primero' +#13+
                  'las actualizaciones realizadas');
      Exit;
    end;

   if MessageDlg('¿Efectuar la Cancelación del Comprobante?',mtConfirmation,
                [mbYes, mbNo], 0)=mrYes then
    begin

      DMTE.cdsEgrCajaX.Edit ;
      DMTE.cdsEgrCajaX.FieldByName('ECEstado').AsString := 'C' ;
      DMTE.cdsEgrCajaX.FieldByName('ECUSER').Value      := DMTE.wUsuario; // usuario que registra
      DMTE.cdsEgrCajaX.FieldByName('ECFREG').Value      := DateS;         // fecha que registra Usuario
     // DMTE.cdsEgrCajaX.FieldByName('ECHREG').AsDateTime := Time;         // Hora de Registro de Usuario
      cdsPost(DMTE.cdsEgrCajaX);
      xSQL := 'Select * From CAJA302'
             +' Where CIAID ='+QuotedStr(dblcCia.Text)
             +' And ECANOMM ='+QuotedStr(edtPeriodo.Text)
             +' And TDIARID ='+QuotedStr(dblcTDiario.Text)
             +' And ECNOCOMP ='+QuotedStr(dbeNoComp.Text);
      DMTE.cdsEgrCajaX.DataRequest( xSQL );
      DMTE.AplicaDatos(DMTE.cdsEgrCajaX, 'EGRCAJAX');

      xEstado := 'C' ;

      ActivaBotones('C') ;

      lblEstado.Caption    := 'Cancelado        ';

      // Actualiza Mov. Destino
      xSQL := 'Update CAJA302 SET ECESTADO =''C'' '
             +' Where CIAID ='+QuotedStr(dblcCia.Text)
             +' And ECANOMM ='+QuotedStr(edtPeriodo.Text)
             +' And TDIARID ='+QuotedStr(dblcTDiario2.Text)
             +' And ECNOCOMP ='+QuotedStr(dbeNoComp2.Text);
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest( xSQL );
      try
         DMTE.cdsQry.Execute;
      except
         ShowMessage('Error : Al Aceptar Comprobante Destino');
         Exit;
      end;

      ActualizaSaldosCaja;

//****************************ACTUALIZA SALDOS DE CAJA *************************
//O R I G E N
      If wBcoTipCta='C' Then
       begin
        DMTE.ActSaldosCaja(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString, DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString,
                          DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString,
                          DMTE.cdsEgrCajaX.FieldByName('ECMTOORI').AsString, 'E', DMTE.cdsEgrCajaX.FieldByName('ECFCOMP').AsString);
       end
      Else
       begin
        DMTE.ActSaldosBancos(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString, DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString,
                            DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString,
                            DMTE.cdsEgrCajaX.FieldByName('CCBCOID').AsString, DMTE.cdsEgrCajaX.FieldByName('ECMTOORI').AsString,
                            'E', DMTE.cdsEgrCajaX.FieldByName('ECFCOMP').AsString);
       end;

//D E S T I N O       
      If wBcoTipCta='C' Then
       begin
        DMTE.ActSaldosCaja(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString, DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString,
                          DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString,
                          DMTE.cdsEgrCajaX.FieldByName('ECMTOORI').AsString, 'I', DMTE.cdsEgrCajaX.FieldByName('ECFCOMP').AsString);
       end
      Else
       begin
        DMTE.ActSaldosBancos(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString, DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString,
                            DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString,
                            DMTE.cdsEgrCajaX.FieldByName('CCBCOID').AsString, DMTE.cdsEgrCajaX.FieldByName('ECMTOORI').AsString,
                            'I', DMTE.cdsEgrCajaX.FieldByName('ECFCOMP').AsString);
       end;
//******************************************************************************

      z2bbtnSumatClick(Sender);

      MessageDlg('Aceptado', mtCustom, [mbOk], 0);
    end;
end;

procedure TFTransferencia.ValidaGrabacion;
begin
   if dbgTrans.DataSource.DataSet.RecordCount = 0 then
   begin
      dbgTrans.SetFocus ;
      Raise Exception.Create('Debe Ingresar Detalles de La Transferencia') ;
   end ;
end;

procedure TFTransferencia.z2bbtnNuevoClick(Sender: TObject);
begin
   if wModifica then
    begin
      ShowMessage('Primero debe Grabar o cancelar sus Modificaciones');
      Exit;
    end;
   Insertar;
   xVoucher  := '';
   xVoucher1 := '';
end;

procedure TFTransferencia.dbgTransIButtonClick(Sender: TObject);
begin
   //Analisis previo de la Cabecera
   if xTipoCaja = 'B' then
    begin
     if DMTE.cdsTrans.RecordCount = 1 then
      begin
         ShowMessage( 'En Caso de Transferencia desde un Banco ' + #13 +
                      'No pueden Haber más de un Registro Registrado' )  ;
         Exit                    ;
      end                        ;
    end                           ;
   pnlDetTrans.Enabled  := False ;
   pnlBotones.Enabled  := False  ;
   pnlActualiza.BringtoFront     ;
   pnlActualiza.Visible:= True   ;
   AdicionaRegistro              ;
end;

procedure TFTransferencia.AdicionaRegistro;
begin
   IniciaPanelActualiza ;
   dbeNoREg.Text:='';
   dbeNoReg.Text := GeneraCorrelativo( DMTE.cdsTrans , 'TXNoReg' ) ;
   dbeNoReg.Enabled := True;
   DMTE.cdsTrans.Insert;
   DatosDefault ;
   DMTE.cdsTrans.FieldByName('TMONID').Value := dblcTMonO.Text;
   dblcTMon2.OnExit(dblcTMon2);
   DMTE.cdsTrans.FieldByName('TXTCAMB').Value := StrToFloat(dbeTCambio.Text);
   Perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFTransferencia.dbgTransDblClick(Sender: TObject);
begin
   if (xEstado='A') or (xEstado='C') then
    begin
     ShowMessage('No Puede Efectuar Modificaciones en este Movimiento');
     Exit;
    end;

   if dbgTrans.DataSource.DataSet.RecordCount = 0 then
    begin
     MessageDlg('No hay Registros por Editar', mtInformation,[mbOk], 0);
     Exit;
    end;

   if DMTE.cdsTrans.FieldByName('BANCOTRANS').AsString<>'' then
    begin
     ShowMessage('No se Puede Editar. Movimiento fue Transferido de CxC');
     Exit;
    end;

   pnlDetTrans.Enabled  := False;
   pnlBotones.Enabled   := False;
   pnlActualiza.Visible := True;
   dbeNoReg.enabled := False;
   EditaRegistro;
end;

procedure TFTransferencia.EditaRegistro;
begin

   dbeNoReg.Text := DMTE.cdsTrans.FieldByName('TXNOREG').Value   ;
   //Lo pongo en modo de edicion
   DMTE.cdsTrans.Edit;
   dbeNoReg.Enabled := False ;
   llenaDescripcionesPnl ;
   Perform(CM_DialogKey, VK_TAB, 0);
end;

procedure TFTransferencia.z2bbtnCancel3Click(Sender: TObject);
begin
   if DMTE.cdsTrans.State = dsInsert then
      DMTE.cdsTrans.Delete
   else begin
      DMTE.cdsTrans.Cancel;
   end;
   pnlActualiza.Visible := False;
   pnlDetTrans.Enabled  := True;
   pnlBotones.Enabled   := True;
end;

procedure TFTransferencia.FormCreate(Sender: TObject);
begin
   ESPACIOCONTROL := 37 ;
   DMTE.cdsBancoEgr.Filter   := '';
   DMTE.cdsBancoEgr.Filtered := False;
// JCC 18/06/2002
	 DMTE.cdsBancoEgr.IndexFieldNames := 'BANCOID';
	 DMTE.ASignaTipoDiario( dblcTDiario , Self ) ;
   dblcTDiario2.LookupTable := dblcTDiario.LookupTable ;

   //Establecer los filtros pra las ctas Ctes.
   cdsCCBco1 := TwwClientDataset.Create(Self) ;
   cdsCCBco1.Name := 'cdsCCBco1' ;
   cdsCCBco1.CloneCursor(DMTE.cdsCCBco,True) ;

   cdsCCBco2 := TwwClientDataset.Create(Self) ;
   cdsCCBco2.Name := 'cdsCCBco2' ;
   cdsCCBco2.CloneCursor(DMTE.cdsCCBco,True) ;

   dblcCCBco.LookupTable := cdsCCBco1 ;
   dblcCCBco2.LookupTable := cdsCCBco2 ;
   setLength(A4digitos,1) ;
   A4digitos[0] := dbeTcambio ;
   if DMTE.RecuperarDatos('TGE112', 'FPAGOID', 'FTRANS=''1''') then
    begin
      wTrans := DMTE.cdsRec.FieldByName('FPAGOID').AsString ;
    end
   else
    begin
      wTrans := '' ;
    end ;
   cf1 := TControlFoco.Create ;
end;

procedure TFTransferencia.DatosDefault;
begin
   DMTE.cdsTrans.FieldByName('TXTPAGO').AsString := 'E' ;
   if xTipoCaja = 'C' then
    begin
     DMTE.cdsTrans.FieldByName('BANCOID').AsString := dblcBanco.Text ;
     edtBanco3.Text := edtBanco.Text ;
    end
   else
    begin
     DMTE.cdsTrans.FieldByName('TMONID').AsString := xMoneda ;
     edtTMon2.Text := edtMoneda.Text ;
    end ;
end;

procedure TFTransferencia.IniciaPanelActualiza;
var
   I : Integer ;
begin
   for I := 0 to pnlActualiza.ControlCount-1 do
    begin
     if pnlActualiza.Controls[i] is TCustomEdit then
      TCustomEdit(pnlActualiza.Controls[i]).Text := '' ;
    end;
end;

procedure TFTransferencia.z2bbtnSumatClick(Sender: TObject);
var
   xRegAct : TBookMark;
   xMtoLoc, xMtoExt: Real;
begin
   With DMTE Do
    begin
     cdsTrans.DisableControls;
     xRegAct := cdsTrans.GetBookmark;
     xMtoLoc := 0;
     xMtoExt := 0;
     cdsTrans.First ;
     While not cdsTrans.Eof do
      begin
       xMtoLoc := xMtoLoc+cdsTrans.FieldByName('TXMTOLOC').Value;
       xMtoExt := xMtoExt+cdsTrans.FieldByName('TXMTOEXT').Value;
       cdsTrans.Next;
      end;
     dbgTrans.ColumnByName('TXMTOLOC').FooterValue := FloatToStrF(xMtoLoc, ffFixed, 10, 2);
     dbgTrans.ColumnByName('TXMTOEXT').FooterValue := FloatToStrF(xMtoExt, ffFixed, 10, 2);

     cdsTrans.GotoBookmark(xRegAct);
     cdsTrans.FreeBookmark(xRegAct);
     cdsTrans.EnableControls;
    end;
end;

procedure TFTransferencia.z2bbtnOK2Click(Sender: TObject);
begin
   if DMTE.cdsTrans.State=dsInsert then
      if EncuentraDuplicado(DMTE.cdsTrans,'TXNoReg',dbeNoReg.Text) then
      begin
         ShowMessage('Número de Registro duplicado');
         dbeNoReg.SetFocus;
         Exit;
      end;

   ValidaCampo ;
   DMTE.cdsTrans.Post;
   wmodifica:=True;

   if not dbeNoReg.Enabled then
   begin
      PnlActualiza.Visible := False;
      pnlDetTrans.Enabled   := True;
      pnlBotones.Enabled   := True;
      z2bbtnSumatClick(sender);
   end
   else
   begin
      if xTipoCaja <> 'B' then
      begin
         z2bbtnSumatClick(sender);
         AdicionaRegistro ;
         dbeNoReg.SetFocus;
      end
      else
      begin
         PnlActualiza.Visible := False;
         pnlDetTrans.Enabled   := True;
         pnlBotones.Enabled   := True;
         z2bbtnSumatClick(sender);
      end;
   end;
end;

procedure TFTransferencia.ValidaCampo ;
begin
   try
      ValidaEdit( dblcTMon2,'Ingrese Tipo de Moneda ' ) ;
      ValidaEdit( dbeImporte2,'Ingrese Monto ' ) ;

      if DMTE.cdstrans.FieldByName('TXMTOORI').AsFloat <= 0 Then
      begin   //Importe
         Raise Exception.Create('Importe debe ser mayor que cero');
      end;
   except
      Raise;
   end;
end;

procedure TFTransferencia.dbeNoRegExit(Sender: TObject);
begin
   if not z2bbtnCancel3.Focused then
    begin
     dbeNoReg.Text := DMTE.StrZero(dbeNoReg.Text, 10);
     if Length(Trim(dbeNoReg.Text))=0 then
      begin     // NoRegistro
       dbeNoReg.Text := '';
       ShowMessage('No es Válido el No Registro');
       dbeNoReg.SetFocus;
       Exit;
      end;
      DMTE.cdsTrans.FieldByName('TXNOREG').AsString := dbeNoReg.Text;
    end
   else
    dbeNoReg.Text := '';
end;

procedure TFTransferencia.CodAuxTipMon;
begin
   if not (DMTE.cdsTrans.State in [dsEdit,dsinsert]) then
      DMTE.cdsTrans.Edit ;

    if ( DMTE.cdsTrans.FieldByName('TXMTOORI').Value>0 ) then
     begin
      if dblcTMon2.Text = DMTE.wTMonLoc then
       begin
         DMTE.cdsTrans.FieldByName('TXMTOLOC').Value   := DMTE.cdsTrans.FieldByName('TXMTOORI').Value ;
         DMTE.cdsTrans.FieldByName('TXMTOEXT').AsFloat := DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat/DMTE.cdsEgrCajaX.FieldByName('ECTCAMB').AsFloat ;
       end
      else
       begin
        DMTE.cdsTrans.FieldByName('TXMTOLOC').AsFloat := DMTE.cdsTrans.FieldByName('TXMTOORI').Value*DMTE.cdsEgrCajaX.FieldByName('ECTCAMB').AsFloat ;
        DMTE.cdsTrans.FieldByName('TXMTOEXT').AsFloat := DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat ;
       end;
     end
    else
     begin
      DMTE.cdsTrans.FieldByName('TXMTOLOC').Value := 0 ;
      DMTE.cdsTrans.FieldByName('TXMTOEXT').Value := 0 ;
     end;
end;

procedure TFTransferencia.dbeImporte2Exit(Sender: TObject);
var
   xWhere, aux: string;
   xTC : Currency ;
begin
   if z2bbtnCancel3.Focused then
      Exit;

   if strTmp <> dbeImporte2.Text then
   begin
      xWhere:='TMONID='+''''+DMTE.cdsTrans.FieldByName('TMONID').AsString+'''';
      aux:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
      if (length(aux)>0) and (DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat>0) then
      begin
      
         xTC :=0;
         if dbeTCambio2.text<>'' then
            xTC := strtocurr(dbeTCambio2.text) ;

         if xTC>0 then begin
            if DMTE.cdsTrans.FieldByName('TMONID').Value = DMTE.wTMonLoc then
            begin
               DMTE.cdsTrans.FieldByName('TXMTOLOC').Value:=DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat;
               DMTE.cdsTrans.FieldByName('TXMTOEXT').Value:=DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat/xTC ;
            end
            else
            begin
               DMTE.cdsTrans.FieldByName('TXMTOLOC').Value:=DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat*xTC;
               DMTE.cdsTrans.FieldByName('TXMTOEXT').Value:=DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat;
            end;
         end
         else begin
            DMTE.cdsTrans.FieldByName('TXMTOLOC').Value:=0;
            DMTE.cdsTrans.FieldByName('TXMTOEXT').Value:=0;
         end;
      end
      else
      begin
         DMTE.cdsTrans.FieldByName('TXMTOLOC').Value:=0;
         DMTE.cdsTrans.FieldByName('TXMTOEXT').Value:=0;
      end;
   end ;
end;

procedure TFTransferencia.dblcTMon2Exit(Sender: TObject);
begin
   edtTMon2.Text := DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMONABR', 'TMONID='+QuotedStr(dblcTMon2.Text), 'TMONABR');
   if length(trim(edtTMon2.text))>0 then  CodAuxTipMon
end;

procedure TFTransferencia.dbeImporte2Enter(Sender: TObject);
begin
   strTmp := dbeImporte2.Text ;
end;

procedure TFTransferencia.LLenaDescripcionesPnl;
begin
   dblcTMon2.Enabled := False;
   if DMTE.cdsTMon.Locate('TMONID',VarArrayOf([dblcTMon2.Text]),[]) then
      edtTMon2.Text := DMTE.cdsTMon.FieldByName('TMONABR').AsString
   else
      ShowMessage('Error en la Recuperación del tipo de moneda') ;

	 if Length(Trim(dblcBanco3.Text)) > 0 then
			if DMTE.cdsBanco.Locate('BANCOID',VarArrayOf([dblcBanco3.Text]),[]) then
				 edtBanco3.Text := DMTE.cdsBanco.FieldByName('BANCOABR').AsString
			else
				 ShowMessage('Error en la Recuperación del tipo de banco') ;

end;

procedure TFTransferencia.dbgTransKeyDown(Sender: TObject; var Key: Word;
	Shift: TShiftState);
var
	 xSQL, xCampos : String;
	 xBusca : Boolean;
begin
	 if (dbgTransIButton.Enabled=True) and (key = VK_DELETE) and (ssCtrl in Shift) then
	 begin
			if (DMTE.cdsTrans.RecordCount=0) then
					ShowMessage('No hay registros')
			else
			begin
				 if MessageDlg('¿Eliminar Registro?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
				 begin

						if DMTE.cdsTrans.FieldByName('BANCOTRANS').AsString<>'' then begin

							 DMTE.cdsDetFPago.Filtered:=False;
							 xBusca:=False;
							 if length(DMTE.cdsTrans.FieldByName('TXNOCHQ').AsString)=0 then begin
									if DMTE.cdsDetFPago.Locate('CIAID;FC_ESTADO;CCTREC;DOCID;CCNODOC;FPAGOID;CLAUXID;CLIEID',
														VarArrayOf( [dblcCia.Text, 'C',
																				 DMTE.cdsTrans.FieldByName('CCTREC').AsString,
																				 DMTE.cdsTrans.FieldByName('DOCID').AsString,
																				 DMTE.cdsTrans.FieldByName('CCNODOC').AsString,
																				 DMTE.cdsTrans.FieldByName('FPAGOID').AsString,
																				 DMTE.cdsTrans.FieldByName('CLAUXID').AsString,
																				 DMTE.cdsTrans.FieldByName('CLIEID').AsString
																				] ), [loPartialKey] ) then
									begin
										 DMTE.cdsDetFPago.Edit;
										 DMTE.cdsDetFPago.FieldByName('FCTRANSF').AsString:='N';
										 DMTE.cdsDetFPago.Post;
										 xBusca:=True;
									end;
							 end
							 else begin
									xCampos:='CIAID;FC_ESTADO;CCTREC;DOCID;CCNODOC;FPAGOID;CLAUXID;CLIEID;BANCOID;ECNOCHQ';

									if DMTE.cdsDetFPago.Locate( xCampos,
																VarArrayOf( [ dblcCia.Text, 'C',
																							DMTE.cdsTrans.FieldByName('CCTREC').AsString,
																							DMTE.cdsTrans.FieldByName('DOCID').AsString,
																							DMTE.cdsTrans.FieldByName('CCNODOC').AsString,
																							DMTE.cdsTrans.FieldByName('FPAGOID').AsString,
																							DMTE.cdsTrans.FieldByName('CLAUXID').AsString,
																							DMTE.cdsTrans.FieldByName('CLIEID').AsString,
																							DMTE.cdsTrans.FieldByName('BANCOID').AsString,
																							DMTE.cdsTrans.FieldByName('TXNOCHQ').AsString
																						] ), [loPartialKey] ) then
									begin
										 DMTE.cdsDetFPago.Edit;
										 DMTE.cdsDetFPago.FieldByName('FCTRANSF').AsString:='N';
										 DMTE.cdsDetFPago.Post;
										 xBusca:=True;
									end
							 end;

							 if not xBusca then begin

									xSQL:='Update CAJA314 Set FCTRANSF=''N'' '
											 +'Where CIAID=''' +dblcCia.Text+''' AND FC_ESTADO =''C'' and '
											 +      'CCTREC=''' +DMTE.cdsTrans.FieldByName('CCTREC').AsString +''' and '
											 +      'DOCID='''  +DMTE.cdsTrans.FieldByName('DOCID').AsString  +''' and '
											 +      'CCNODOC='''+DMTE.cdsTrans.FieldByName('CCNODOC').AsString+''' and '
											 +      'FPAGOID='''+DMTE.cdsTrans.FieldByName('FPAGOID').AsString+''' and '
											 +      'CLAUXID='''+DMTE.cdsTrans.FieldByName('CLAUXID').AsString+''' and '
											 +      'CLIEID=''' +DMTE.cdsTrans.FieldByName('CLIEID').AsString +'''';

									if DMTE.cdsTrans.FieldByName('TXNOCHQ').AsString<>'' then
										 xSQL:=xSQL+' and ECNOCHQ='''+DMTE.cdsTrans.FieldByName('TXNOCHQ').AsString+'''';

									if DMTE.cdsTrans.FieldByName('BANCOID').AsString<>'' then
										 xSQL:=xSQL+' and BANCOID='''+DMTE.cdsTrans.FieldByName('BANCOID').AsString+'''';

									DMTE.cdsQry.Close;
									DMTE.cdsQry.DataRequest( xSQL );
									try
										 DMTE.cdsQry.Execute;
									except
									end;
							 end;

							 DMTE.cdsDetFPago.Filtered := True;
						end;

						DMTE.cdsTrans.Delete;    // Borro en el original..
						z2bbtnSumatClick(sender);    // Al salir hay que totalizar
				 end;
			end;
	 end;
end;

procedure TFTransferencia.z2bbtnGrabaClick(Sender: TObject) ;
begin
	 ValidaGrabacion ;
	 if xEstado = 'N' then
	 begin
			GrabaCab1;
			GrabaDetalle;
      if DMTE.cdsDetFPago.Active then
         DMTE.cdsDetFPago.ApplyUpdates( 0 );
      xEstado:='I';
      ActivaBotones('I');
      HabilitaEdicion;
      RecDescripCabecera;
   end
   else
   begin
      if wModifica then
      begin
         GrabaCab2 ;
         wModifica := False ;
      end;
      GrabaDetalle ;
      if DMTE.cdsDetFPago.Active then
         DMTE.cdsDetFPago.ApplyUpdates( 0 );
   end;

   dblcBanco.Enabled  := False;
   dblcCCBco.Enabled  := False;
   dblcTMonO.Enabled  := False;
   dbeNoComp.Enabled  := False;
   dblcBanco2.Enabled := False;
   dblcCCBco2.Enabled := False;
   dblcTMonD.Enabled  := False;
   dbeNoComp2.Enabled := False;

   MessageDlg( 'Grabación OK', mtCustom, [mbOk], 0 );
end;

procedure TFTransferencia.GrabaCab1;
var
   xWhere , aux : String ;
   Trans_Comp : structComprobante ;
   xECMTOORI,xECMTOLOC,xECMTOEXT : STRING ;
begin
   Trans_Comp.CIAID   := '';
   Trans_Comp.ECANOMM := '';
   Trans_Comp.TDIARID := '';
   Trans_Comp.ECNOCOMP:= '';

   RecuperaCabecera ( Trans_Comp ) ;

	 DMTE.cdsEgrCajaX.Insert;
	 DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString     :=dblcCia.Text                                ;
	 DMTE.cdsEgrCajaX.FieldByName('TDIARID').AsString   :=dblcTDiario2.Text                           ;
	 DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString   :=edtPeriodo.Text                             ;
	 DMTE.cdsEgrCajaX.FieldByName('ECNOCOMP').AsString  :=dbeNoComp2.Text                             ;
	 DMTE.cdsEgrCajaX.FieldByName('ECFCOMP').Value      :=dbdtpFComp.Date                                ;
	 DMTE.cdsEgrCajaX.FieldByName('ECFEMICH').Value     :=dbdtpFComp.Date                                ;
	 DMTE.cdsEgrCajaX.FieldByName('EC_IE').AsString     :='I'                                            ;
	 DMTE.cdsEgrCajaX.FieldByName('ECGIRA').AsString    :=dbeGiradoA.Text;
	 DMTE.cdsEgrCajaX.FieldByName('TDIARIO2').AsString  :=dblcTDiario.Text                           ;
	 DMTE.cdsEgrCajaX.FieldByName('ECNOCOMP2').AsString :=dbeNoComp.Text                             ;
	 DMTE.cdsEgrCajaX.FieldByName('DOCID').AsString     :=DMTE.wTipoDocTransferencia                   ;
	 DMTE.cdsEgrCajaX.FieldByName('ECNODOC').AsString   :=dbeNoDoc.Text                               ;
	 DMTE.cdsEgrCajaX.Fieldbyname('ECTCAMB').AsString   :=dbeTCambio.Text                             ;
	 DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString   :=dblcBanco2.Text                              ;
	 DMTE.cdsEgrCajaX.FieldbyName('CCBCOID').AsString   :=dblcCCBco2.Text                              ;
	 DMTE.cdsEgrCajaX.FieldbyName('CCBCOVOUCH').AsString:= xVoucher;
	 DMTE.cdsEgrCajaX.FieldByName('CPTOID').AsString    :=dblcdCnp.Text                                ;
	 DMTE.cdsEgrCajaX.FieldbyName('CUENTAID').AsString  :=edtCuenta2.Text                              ;
	 DMTE.cdsEgrCajaX.FieldByName('ECGLOSA').AsString   :=dbeGlosa.Text                                ;
	 DMTE.cdsEgrCajaX.FieldbyName('ECLOTE').AsString    :=dbeLote.Text                                 ;
	 DMTE.cdsEgrCajaX.FieldbyName('ECESTADO').AsString  :='I'                                         ;
	 DMTE.cdsEgrCajaX.FieldBYName('TMONID').AsString    :=dblcTMOnD.Text                               ;
	 xWhere:='FECHA=' +DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date)+''')'   ;
	 aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO')              ;
	 DMTE.cdsEgrCajaX.FieldbyName('ECANO').AsString     := DMTE.cdsqry.FieldByName('FecAno').AsString    ;
	 DMTE.cdsEgrCajaX.FieldbyName('ECMM').AsString      := DMTE.cdsqry.FieldByName('FecMes').AsString    ;
	 DMTE.cdsEgrCajaX.FieldbyName('ECDD').AsString      := DMTE.cdsqry.FieldByName('FecDia').AsString    ;
	 DMTE.cdsEgrCajaX.FieldbyName('ECSS').AsString      := DMTE.cdsqry.FieldByName('FecSS').AsString     ;
	 DMTE.cdsEgrCajaX.FieldbyName('ECSEM').AsString     := DMTE.cdsqry.FieldByName('FecSem').AsString    ;
	 DMTE.cdsEgrCajaX.FieldbyName('ECTRI').AsString     := DMTE.cdsqry.FieldByName('FecTrim').Asstring   ;
	 DMTE.cdsEgrCajaX.FieldbyName('ECAASS').AsString    := DMTE.cdsqry.FieldByName('FecAASS').AsString   ;
	 DMTE.cdsEgrCajaX.FieldbyName('ECAASem').AsString   := DMTE.cdsqry.FieldByName('FecAASem').AsString  ;
	 DMTE.cdsEgrCajaX.FieldbyName('ECAATri').AsString   := DMTE.cdsqry.FieldByName('FecAATri').AsString  ;
	 DMTE.cdsEgrCajaX.FieldByName('EC_PROCE').Value     := '7'                                             ;
	 CalculaMontos(xECMTOORI, xECMTOLOC, xECMTOEXT, 'I');
	 DMTE.cdsEgrCajaX.FieldByName('ECMTOORI').AsString  := xECMTOORI;
	 DMTE.cdsEgrCajaX.FieldByName('ECMTOLOC').AsString  := xECMTOLOC;
	 DMTE.cdsEgrCajaX.FieldByName('ECMTOEXT').AsString  := xECMTOEXT;
	 DMTE.cdsEgrCajaX.FieldByName('FPAGOID').AsString   := wTrans;
	 DMTE.cdsEgrCajaX.FieldBYName('ECFEMICH').AsString  := dbdtpFComp.Text;
	 DMTE.cdsEgrCajaX.FieldByName('CAJARETIGV').Value   := 'N';
	 DMTE.cdsEgrCajaX.FieldByName('ECUSER').Value       := DMTE.wUsuario; // usuario que registra
	 DMTE.cdsEgrCajaX.FieldByName('ECFREG').Value       := DateS;         // fecha que registra Usuario
	 DMTE.cdsEgrCajaX.FieldByName('ECHREG').AsDateTime  := Time;         // Hora de Registro de Usuario
	 DMTE.cdsEgrCajaX.Post;

	 DMTE.cdsEgrCajaX.Insert ;
	 DMTE.cdsEgrCajaX.FieldBYName('CIAID').AsString     := dblcCia.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('TDIARID').AsString   := dblcTDiario.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('ECANOMM').AsString   := edtPeriodo.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('ECNOCOMP').AsString  := dbeNoComp.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('ECFCOMP').AsString   := dbdtpFComp.Text;
	 DMTE.cdsEgrCajaX.FieldByName('ECFEMICH').Value     := dbdtpFComp.Date;
	 DMTE.cdsEgrCajaX.FieldByName('TDIARIO2').AsString  := dblcTDiario2.Text;
	 DMTE.cdsEgrCajaX.FieldByName('ECNOCOMP2').AsString := dbeNoComp2.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('EC_IE').AsString     := 'E';
	 DMTE.cdsEgrCajaX.FieldByName('ECGIRA').AsString    := dbeGiradoA.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('DOCID').AsString     := DMTE.wTipoDocTransferencia;
	 DMTE.cdsEgrCajaX.FieldBYName('ECNODOC').AsString   := dbeNoDoc.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('ECTCAMB').AsString   := dbeTCambio.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('BANCOID').AsString   := dblcBanco.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('CCBCOID').AsString   := dblcCCBco.Text;

   if xTipoCaja = 'B' then
   begin
      if DMTE.cdsTrans.RecordCount = 1 then
      begin
       DMTE.cdsTrans.DisableControls;
       DMTE.cdsEgrCajaX.FieldBYName('ECNOCHQ').AsString := DMTE.cdsTrans.FieldByName('TXNOCHQ').AsString;
       DMTE.cdsTrans.EnableControls;
      end;
   end
   else
   begin
      if DMTE.cdsEgrCajaX.FieldBYName('CCBCOID').AsString='' then;
         DMTE.cdsEgrCajaX.FieldBYName('CCBCOID').AsString:='-';
   end;

   if DMTE.cdsEgrCajaX.FieldBYName('ECGIRA').AsString='' then
      DMTE.cdsEgrCajaX.FieldBYName('ECGIRA').AsString:= '-';


//GAR **************************************************************************
	 xWhere := 'FECHA=' +DMTE.wRepFuncDate + '''' + FormatDateTime(DMTE.wFormatFecha,dbdtpFComp.Date)+''')';
	 DMTE.DisplayDescrip('prvTGE','TGE114','*', xWhere, 'FECANO');
//GAR **************************************************************************

	 DMTE.cdsEgrCajaX.FieldBYName('CPTOID').AsString   := dblcdCnp.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('CUENTAID').AsString := edtCuenta.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('ECGLOSA').AsString  := dbeGlosa.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('ECLOTE').AsString   := dbeLote.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('ECESTADO').AsString := 'I';
	 DMTE.cdsEgrCajaX.FieldBYName('TMONID').AsString   := dblcTMonO.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('ECANO').AsString    := DMTE.cdsQry.FieldByName('FecAno').AsString;
	 DMTE.cdsEgrCajaX.FieldBYName('ECMM').AsString     := DMTE.cdsQry.FieldByName('FecMes').AsString;
	 DMTE.cdsEgrCajaX.FieldBYName('ECDD').AsString     := DMTE.cdsQry.FieldByName('FecDia').AsString;
	 DMTE.cdsEgrCajaX.FieldBYName('ECSS').AsString     := DMTE.cdsQry.FieldByName('FecSS').AsString;
	 DMTE.cdsEgrCajaX.FieldBYName('ECSEM').AsString    := DMTE.cdsQry.FieldByName('FecSem').AsString;
	 DMTE.cdsEgrCajaX.FieldBYName('ECTRI').AsString    := DMTE.cdsQry.FieldByName('FecTrim').AsString;
	 DMTE.cdsEgrCajaX.FieldBYName('ECAASS').AsString   := DMTE.cdsQry.FieldByName('FecAASS').Asstring;
	 DMTE.cdsEgrCajaX.FieldBYName('ECAASem').AsString  := DMTE.cdsQry.FieldByName('FecAASem').AsString;
	 DMTE.cdsEgrCajaX.FieldBYName('ECAATri').AsString  := DMTE.cdsQry.FieldByName('FecAATri').AsString;
	 DMTE.cdsEgrCajaX.FieldBYName('EC_PROCE').AsString := '4';
	 CalculaMontos(xECMTOORI,xECMTOLOC,xECMTOEXT,'E');
	 DMTE.cdsEgrCajaX.FieldByName('ECMTOORI').AsString := xECMTOORI;
	 DMTE.cdsEgrCajaX.FieldByName('ECMTOLOC').AsString := xECMTOLOC;
	 DMTE.cdsEgrCajaX.FieldByName('ECMTOEXT').AsString := xECMTOEXT;
	 DMTE.cdsEgrCajaX.FieldByName('FPAGOID').AsString  := wTrans;
	 DMTE.cdsEgrCajaX.FieldBYName('ECFEMICH').AsString := dbdtpFComp.Text;
	 DMTE.cdsEgrCajaX.FieldByName('CAJARETIGV').Value  := 'N';
	 DMTE.cdsEgrCajaX.FieldByName('ECUSER').Value      := DMTE.wUsuario; // usuario que registra
	 DMTE.cdsEgrCajaX.FieldByName('ECFREG').Value      := DateS;         // fecha que registra Usuario
	 DMTE.cdsEgrCajaX.FieldByName('ECHREG').AsDateTime := Time;         // Hora de Registro de Usuario
	 DMTE.cdsEgrCajaX.Post;
	 DMTE.cdsEgrCajaX.ApplyUpdates(0);
	 wModifica:=False;
end;

procedure TFTransferencia.GrabaCab2;
var
	 xWhere, aux, xSQL : String ;
	 xECMTOORI,xECMTOLOC,xECMTOEXT : STRING ;
begin
	 DMTE.cdsEgrCajaX.Edit ;
	 DMTE.cdsEgrCajaX.FieldBYName('ECFCOMP').AsString   :=dbdtpFComp.Text;
	 DMTE.cdsEgrCajaX.FieldByName('TDIARIO2').AsString  :=dblcTDiario2.Text;
	 DMTE.cdsEgrCajaX.FieldByName('ECNOCOMP2').AsString :=dbeNoComp2.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('EC_IE').AsString     :='E';
	 DMTE.cdsEgrCajaX.FieldByName('ECGIRA').AsString    :=dbeGiradoA.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('DOCID').AsString     :=DMTE.wTipoDocTransferencia ;
	 DMTE.cdsEgrCajaX.FieldBYName('ECNODOC').AsString   :=dbeNoDoc.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('ECTCAMB').AsString   :=dbeTCambio.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('BANCOID').AsString   :=dblcBanco.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('CCBCOID').AsString   :=dblcCCBco.Text;
	 DMTE.cdsEgrCajaX.FieldbyName('CCBCOVOUCH').AsString:=xVoucher1;
	 DMTE.cdsEgrCajaX.FieldBYName('CPTOID').AsString    :=dblcdCnp.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('CUENTAID').AsString  :=edtCuenta.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('ECGLOSA').AsString   :=dbeGlosa.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('ECLOTE').AsString    :=dbeLote.Text;
	 DMTE.cdsEgrCajaX.FieldBYName('ECESTADO').AsString  :='I';

	 xWhere:='FECHA=' +DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha,dbdtpFComp.Date)+''')';
	 aux   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');

	 DMTE.cdsEgrCajaX.FieldBYName('ECANO').AsString    := DMTE.cdsqry.FieldByName('FecAno').AsString ;
	 DMTE.cdsEgrCajaX.FieldBYName('ECMM').AsString     := DMTE.cdsqry.FieldByName('FecMes').AsString ;
	 DMTE.cdsEgrCajaX.FieldBYName('ECDD').AsString     := DMTE.cdsqry.FieldByName('FecDia').AsString ;
	 DMTE.cdsEgrCajaX.FieldBYName('ECSS').AsString     := DMTE.cdsqry.FieldByName('FecSS').AsString ;
	 DMTE.cdsEgrCajaX.FieldBYName('ECSEM').AsString    := DMTE.cdsqry.FieldByName('FecSem').AsString ;
	 DMTE.cdsEgrCajaX.FieldBYName('ECTRI').AsString    := DMTE.cdsqry.FieldByName('FecTrim').AsString ;
	 DMTE.cdsEgrCajaX.FieldBYName('ECAASS').AsString   := DMTE.cdsqry.FieldByName('FecAASS').Asstring ;
	 DMTE.cdsEgrCajaX.FieldBYName('ECAASem').AsString  := DMTE.cdsqry.FieldByName('FecAASem').AsString ;
	 DMTE.cdsEgrCajaX.FieldBYName('ECAATri').AsString  := DMTE.cdsqry.FieldByName('FecAATri').AsString ;
	 DMTE.cdsEgrCajaX.FieldBYName('EC_PROCE').AsString := '4';
	 DMTE.cdsEgrCajaX.FieldBYName('TMONID').AsString   := dblcTMOnO.Text ;
	 DMTE.cdsEgrCajaX.FieldBYName('ECFEMICH').AsString := dbdtpFComp.Text;
	 DMTE.cdsEgrCajaX.FieldByName('ECUSER').Value      := DMTE.wUsuario; // usuario que registra
	 DMTE.cdsEgrCajaX.FieldByName('ECFREG').Value      := DateS;         // fecha que registra Usuario
	 DMTE.cdsEgrCajaX.FieldByName('ECHREG').AsDateTime := Time;         // Hora de Registro de Usuario

	 CalculaMontos(xECMTOORI,xECMTOLOC,xECMTOEXT,'E')                               ;
	 cdsPost(DMTE.cdsEgrCajaX) ;
	 xSQL:='Select * From CAJA302 ';
{           +'Where CIAID='''   +dblcCia.Text    +''' and '
					 +      'ECANOMM=''' +edtPeriodo.Text +''' and '
					 +      'TDIARID=''' +dblcTDiario.Text+''' and '
					 +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';}
	 DMTE.cdsEgrCajaX.DataRequest( xSQL );

	 DMTE.AplicaDatos( DMTE.cdsEgrCajaX, 'EGRCAJAX' );

	 xSQL := 'Select * from CAJA302 '
			   	+'Where CIAID='''   +dblcCia.Text     +''' and '
			  	+      'ECANOMM=''' +edtPeriodo.Text  +''' and '
				  +      'TDIARID=''' +dblcTDiario2.Text+''' and '
				  +      'ECNOCOMP='''+dbeNoComp2.Text  +''' ';
	 DMTE.cdsEgrCaja.Close;
	 DMTE.cdsEgrCaja.DataRequest( xSQL );
	 DMTE.cdsEgrCaja.Open;

	 DMTE.cdsEgrCaja.Edit ;
	 DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value     :=dbdtpFComp.Date;
	 DMTE.cdsEgrCaja.FieldByName('EC_IE').AsString    :='I';
	 DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString   :=dbeGiradoA.Text;
	 DMTE.cdsEgrCaja.FieldByName('DOCID').AsString    :=DMTE.wTipoDocTransferencia ;
	 DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString  :=dbeNoDoc.Text;
	 DMTE.cdsEgrCaja.Fieldbyname('ECTCAMB').AsString  :=dbeTCambio.Text;
	 DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString  :=dblcBanco2.Text;
	 DMTE.cdsEgrCaja.FieldbyName('CCBCOID').AsString  :=dblcCCBco2.Text;
	 DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString   :=dblcdCnp.Text;
	 DMTE.cdsEgrCaja.FieldbyName('CUENTAID').AsString :=edtCuenta2.Text;
	 DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString  :=dbeGlosa.Text;
	 DMTE.cdsEgrCaja.FieldbyName('ECLOTE').AsString   :=dbeLote.Text;
	 DMTE.cdsEgrCaja.FieldbyName('ECESTADO').AsString :='I';
	 DMTE.cdsEgrCaja.FieldbyName('ECANO').AsString    :=DMTE.cdsqry.FieldByName('FecAno').AsString;
	 DMTE.cdsEgrCaja.FieldbyName('ECMM').AsString     :=DMTE.cdsqry.FieldByName('FecMes').AsString ;
	 DMTE.cdsEgrCaja.FieldbyName('ECDD').AsString     :=DMTE.cdsqry.FieldByName('FecDia').AsString ;
	 DMTE.cdsEgrCaja.FieldbyName('ECSS').AsString     :=DMTE.cdsqry.FieldByName('FecSS').AsString ;
	 DMTE.cdsEgrCaja.FieldbyName('ECSEM').AsString    :=DMTE.cdsqry.FieldByName('FecSem').AsString ;
	 DMTE.cdsEgrCaja.FieldbyName('ECTRI').AsString    :=DMTE.cdsqry.FieldByName('FecTrim').AsString ;
	 DMTE.cdsEgrCaja.FieldbyName('ECAASS').AsString   :=DMTE.cdsqry.FieldByName('FecAASS').AsString ;
	 DMTE.cdsEgrCaja.FieldbyName('ECAASem').AsString  :=DMTE.cdsqry.FieldByName('FecAASem').AsString ;
	 DMTE.cdsEgrCaja.FieldbyName('ECAATri').AsString  :=DMTE.cdsqry.FieldByName('FecAATri').AsString ;
	 DMTE.cdsEgrCaja.FieldByName('EC_PROCE').Value    :='7';
	 DMTE.cdsEgrCaja.FieldBYName('TMONID').AsString   :=dblcTMOnD.Text ;
	 DMTE.cdsEgrCaja.FieldBYName('ECFEMICH').AsString :=dbdtpFComp.Text;
	 DMTE.cdsEgrCaja.FieldByName('ECUSER').Value      :=DMTE.wUsuario; // usuario que registra
	 DMTE.cdsEgrCaja.FieldByName('ECFREG').Value      :=DateS;         // fecha que registra Usuario
	 DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime :=Time;         // Hora de Registro de Usuario

	 CalculaMontos(xECMTOORI,xECMTOLOC,xECMTOEXT,'I')                               ;
	 cdsPost(DMTE.cdsEgrCaja);
	 DMTE.AplicaDatos( DMTE.cdsEgrCaja, 'EGRCAJA' );

	 wModifica := False ;
end;

procedure TFTransferencia.GrabaDetalle;
begin
	 if ( DMTE.cdsTrans.ChangeCount>0 ) or ( DMTE.cdsTrans.Modified ) then
	 begin
      DMTE.cdsTrans.DisableControls ;
      DMTE.cdsTrans.First ;
      while not DMTE.cdsTrans.Eof do
      begin
         DMTE.cdsTrans.Edit ;
         DMTE.cdsTrans.FieldByName('CIAID').AsString   :=dblcCia.Text;
				 DMTE.cdsTrans.FieldByName('ECANOMM').AsString :=edtPeriodo.Text;
				 //VERIFICAR CON EL USUARIO CIM 22/01/2003
//				 DMTE.cdsTrans.FieldByName('ECNOCOMP').AsString:=dbeNoComp.Text;
				 DMTE.cdsTrans.FieldByName('ECNOCOMP').AsString:=dbeNoComp2.Text;
//				 DMTE.cdsTrans.FieldByName('TDIARID').AsString :=dblcTDiario.Text;
				 DMTE.cdsTrans.FieldByName('TDIARID').AsString :=dblcTDiario2.Text;
         DMTE.cdsTrans.FieldByName('TXUSER').Value     :=DMTE.wUsuario; // usuario que registra
         DMTE.cdsTrans.FieldByName('TXFREG').Value     :=DateS;         // fecha que registra Usuario
         DMTE.cdsTrans.FieldByName('TXHREG').AsDateTime:=Time;         // Hora de Registro de Usuario
         DMTE.cdsTrans.Post ;
         DMTE.cdsTrans.Next ;
      end;
      DMTE.cdsTrans.ApplyUpdates(0) ;
      DMTE.cdsTrans.First ;
      DMTE.cdsTrans.EnableControls ;
   end;
end;

procedure TFTransferencia.z2bbtnAnulaClick(Sender: TObject);
var
   xSQL : String;
begin
   if MessageDlg('¿Anular Comprobante?',mtConfirmation,
                [mbYes, mbNo], 0)=mrYes then
   begin
      DMTE.cdsTrans.CancelUpdates ;

      // Actualiza en Caja314
      DMTE.cdsTrans.First;
      while not DMTE.cdsTrans.Eof do begin
         xSQL:='Update CAJA314 Set FCTRANSF=''N'' '
              +'Where CIAID=''' +dblcCia.Text+''' AND FC_ESTADO=''C'' and '
              +      'CCTREC=''' +DMTE.cdsTrans.FieldByName('CCTREC').AsString +''' and '
              +      'DOCID='''  +DMTE.cdsTrans.FieldByName('DOCID').AsString  +''' and '
              +      'CCNODOC='''+DMTE.cdsTrans.FieldByName('CCNODOC').AsString+''' and '
              +      'FPAGOID='''+DMTE.cdsTrans.FieldByName('FPAGOID').AsString+''' and '
              +      'CLAUXID='''+DMTE.cdsTrans.FieldByName('CLAUXID').AsString+''' and '
              +      'CLIEID=''' +DMTE.cdsTrans.FieldByName('CLIEID').AsString +'''';

         if DMTE.cdsTrans.FieldByName('TXNOCHQ').AsString<>'' then
            xSQL:=xSQL+' and ECNOCHQ='''+DMTE.cdsTrans.FieldByName('TXNOCHQ').AsString+'''';

         if DMTE.cdsTrans.FieldByName('BANCOID').AsString<>'' then
            xSQL:=xSQL+' and BANCOID='''+DMTE.cdsTrans.FieldByName('BANCOID').AsString+'''';

         DMTE.cdsQry.Close;
         DMTE.cdsQry.DataRequest( xSQL );
         TRY
         DMTE.cdsQry.Execute;
         EXCEPT
         END;

         DMTE.cdsTrans.Next;
      end;

      DMTE.cdsEgrCajaX.Edit ;
      DMTE.cdsEgrCajaX.FieldBYName('ECEstado').AsString :='A' ;
      DMTE.cdsEgrCajaX.ApplyUpdates(0) ;

      lblEstado.Caption    :='Anulado            ' ;
   end;
end;

procedure TFTransferencia.z2bbtnCancelClick(Sender: TObject);
begin
   // A Revisar por WMC

  if MessageDlg('¿Cancelar los cambios?',mtConfirmation,[mbYes, mbNo], 0) = mrYes then
   begin
     //** 05/06/2001-pjsv, para el nuevo dato (CCBCOVOUCH - TGE106 y CAJA302)
     xVoucher := '';
     xVoucher1 := '';
     //**
     DMTE.cdsTrans.CancelUpdates;
     if xEstado = 'N' then
      begin
         Insertar ;
         wModifica := False ;
      end
     else
      begin
         RecuperaEdicion ;
         wModifica := False ;
      end;
   end;
end;

procedure TFTransferencia.dbeTCambioChange(Sender: TObject);
begin
    if not (sender as TCustomEdit).focused then
       Exit ;
    wModifica := True ;   
end;

procedure TFTransferencia.dbeLoteChange(Sender: TObject);
begin
    if not (sender as TCustomEdit).focused then
       Exit ;
    wModifica := True ;   
end;

procedure TFTransferencia.dbeGlosaChange(Sender: TObject);
begin
    if not (sender as TCustomEdit).focused then
       Exit ;
    wModifica := True ;
end;

procedure TFTransferencia.LLenarDatosCab;
{
  Este Procedimiento llena los datos de la cabecera
  incluyendo los datos de tipo de diario y numero de comprobante
  del segundo comprobante
}
begin
   with DMTE.cdsEgrCajaX do
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
      dblcTMonO.Text   := FieldBYName('TMONID').AsString ;
      dbeTCambio.Text  := FieldBYName('ECTCAMB').AsString ;
      dbeLOte.Text     := FieldBYName('ECLOTE').AsString ;
      dblcdCnp.Text    := FieldBYName('CPTOID').AsString ;
      dbeGlosa.Text    := FieldBYName('ECGLOSA').AsString ;
      dbeGiradoA.Text  := FieldBYName('ECGIRA').AsString ;
   end;
   if length(trim(dblcCCBco.Text)) > 0 then
   begin
      dblcCCBco.Enabled := True ;
      dblcTMonO.Enabled := False ;
   end
   else begin
      dblcCCBco.Enabled := False ;
      dblcTmonO.Enabled := True  ;
   end;
   if length(trim(dblcCCBco2.Text))>0 then
   begin
      dblcCCBco2.Enabled := True ;
      dblcTMonD.Enabled  := False ;
   end
   else begin
      dblcCCBco2.Enabled := False ;
      if length(Trim( dblcCCBco.Text )) = 0 then
      begin
         dblcTMOnD.Enabled := True ;
      end
      else begin
         dblcTMOnD.Enabled := False ;
      end ;
   end;
end;

procedure TFTransferencia.RecDescripCabecera;
{
    Este Procedimiento Recupera las descripciones adicionales
    de ambos comprobantes
}
begin
   DMTE.DescripTrans(dblcCia.Text,edtPeriodo.Text,dblcTDiario.Text,
                                    dbeNoComp.Text,dblcTDiario2.Text,dbeNoComp2.Text) ;
   DMTE.cdsDescrip.active := False ;
   DMTE.cdsDescrip.active := True ;
end;

procedure TFTransferencia.ConfiguraPantalla;
{
     Este Procedimiento configura la pantalla
     en caso de edición
}
begin
   if xEstado = 'I' then
   begin
      pnlCabecera1.Enabled := False ;
      pnlCabecera2.Enabled := True ;

      dblcBanco.Enabled :=False;
      dblcCCBco.Enabled :=False;
      dblcTMonO.Enabled :=False;
      dbeNoComp.Enabled :=False;
      dblcBanco2.Enabled:=False;
      dblcCCBco2.Enabled:=False;
      dblcTMonD.Enabled :=False;
      dbeNoComp2.Enabled:=False;

      z2bbtnOkCab.Enabled  := True ;
      pnlDeTTrans.Enabled  := False ;
      pnlBotones.Enabled   := False ;
      DesactivaBotonesPanel(pnlBotones) ;
      dbgTransiButton.Enabled := True ;
   end
   else begin
      pnlCabecera1.Enabled := False ;
      pnlCabecera2.Enabled := False ;
      z2bbtnOkCab.Enabled  := False ;
      pnlDeTTrans.Enabled  := True ;
      pnlBotones.Enabled   := True ;
      ActivaBotones(xEstado) ;
      dbgTransiButton.Enabled := False ;
   end ;

   if (xEstado = 'I') or
      (xEstado = 'P') then      //Si está INCOMPLETO o PENDIENTE
   begin
      lblEstado.Caption    :='Activo             ';
      //Configurar combos
   end;

   if xEstado = 'C' then      //Si está CANCELADO
   begin
      if DMTE.cdsEgrCajaX.fieldByName('ECConta').AsString = 'S' then
      begin  //Esta contabilizado
         lblEstado.Caption  :='Cancelado y Contab.'
      end
      else begin
         lblEstado.Caption  :='Cancelado          ';
      end;
   end;
   if xEstado ='A' then      // Si esta ANULADO
   begin
      lblEstado.Caption     :='Anulado            ';
   end;

   if xEstado ='N' then      // Si es NUEVO
   begin
      lblEstado.Caption     :='Anulado            ';
   end;
end;

procedure TFTransferencia.LLenaDescripCab;
{
   Este procedimiento llena
   las descripciones adicionales
}
begin
   with DMTE.cdsDescrip do
    begin
     First ;
     while not eof do
      begin
       if FieldByName('EC_IE').AsString = 'E' then
        begin
         edtCia.Text     := FieldByName('CIADES').AsString ;
         edtTDiario.Text := FieldByName('TDIARABR').AsString ;
         edtBanco.Text   := DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr,'BANCOID',dblcBanco.Text,'BANCOABR') ;
         //edtBanco.Text  := FieldByName('BANCOABR').AsString ;
         edtMoneda.Text  := FieldByName('TMONABR').AsString ;
        end
       else
        begin
         edtTDiario2.Text := FieldByName('TDIARABR').AsString ;
         edtBanco2.Text   := FieldByName('BANCOABR').AsString ;
         edtMoneda2.Text  := FieldByName('TMONABR').AsString ;
        end;
       Next;
      end;
   end;
end;

procedure TFTransferencia.RecuperaEdicion;
 {
   Este Procedimiento se ha escrito para recuperar en caso de cancel
 }
begin
// Revisar por wmc
   IniciaDatos ;
   HabilitaEdicion ;
   LlenarDatosCab ;

   //Recuperacion de los datos del comprobante de destino
   if DMTE.cdsDescrip.Locate('EC_IE',VarArrayOf(['I']),[]) then
   begin
      dblcBanco2.Text := DMTE.cdsrec.FieldByName('BANCOID').AsString ;
      dblcCCBco2.Text := DMTE.cdsrec.FieldByName('CCBCOID').AsString ;
      edtCuenta2.Text := DMTE.cdsrec.FieldByName('CUENTAID').AsString ;
   end
   else
   begin
      dblcBanco2.Text := '' ;
      dblcCCBco2.Text := '' ;
      edtCuenta2.Text := '' ;
   end ;

   LLenaDescripCab ;
   ConfiguraPantalla;
// fin de revisar por wmc
end;

procedure TFTransferencia.ActualizaPaneles;
begin

end;

procedure TFTransferencia.z2bbtnContClick(Sender: TObject);
Var
   xSql,xRemt : String;
begin
   if MessageDlg('¿Contabilizar y Generar Asientos Automaticos?',mtConfirmation,
                [mbYes, mbNo], 0)=mrYes then
   begin
      screen.Cursor := crHourGlass ;

      // Hallar la Remesa
      if (length(trim(dblcCCBco.Text))>0) AND (Copy(dblcCCBco.Text,1,1)<>'-') then begin
         DMTE.RecuperarDatos('TGE106','CTAREMES','BANCOID='''+dblcBanco.Text+''' AND CCBCOID='''+dblcCCBco.Text+'''') ;
         xRemt := DMTE.cdsRec.FieldByName('CTAREMES').AsString ;
      end
      else
      begin
         DMTE.RecuperarDatos('TGE105','REMESAID','BANCOID=''' +dblcBanco.Text + '''') ;
         xRemt := DMTE.cdsRec.FieldByName('REMESAID').AsString ;
      end;

      if length(xRemt)=0 then begin
         ShowMessage('Error Caja/Banco No Tiene Cuenta de Remesa. Verificar');
         Exit;
      end;

      // Genera CAJA304
      Contabiliza ;

      ActualizaCNT311( dblcCia.Text, dblcTDiario.Text, dbeNoComp.Text, edtPeriodo.Text );

      if SOLConta(dblccia.Text, dblctdiario.Text, edtPeriodo.Text, dbeNoComp.Text,
                   DMTE.SRV_D, 'C', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                   DMTE.cdsResultSet, DMTE.DCOM1, Self ) then
      begin
      end;

      ActualizaCNT311( dblcCia.Text, dblcTDiario2.Text, dbeNoComp2.Text, edtPeriodo.Text );

      if SOLConta(dblccia.text,dblctdiario2.Text, edtPeriodo.Text, dbeNoComp2.Text,
                   DMTE.SRV_D, 'C', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                   DMTE.cdsResultSet, DMTE.DCOM1, Self ) then
      begin
      end;

      xsql:='Update CAJA302 SET ECCONTA=''S'', ECESTADO=''C'' '
           +'WHERE CIAID='   +QuotedStr( dblcCia.Text      ) +' AND '
           +      'ECANOMM=' +QuotedStr( edtPeriodo.Text   ) +' AND '
           +      'TDIARID=' +QuotedStr( dblcTDiario2.Text ) +' AND '
           +      'ECNOCOMP='+QuotedStr( dbeNoComp2.Text   );
      try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      except
      end;

      DMTE.cdsEgrCajax.Edit;
      DMTE.cdsEgrCajax.FieldByName('ECConta').AsString  := 'S' ;   //Establece como Contabilizado el flag
      DMTE.cdsEgrCajax.FieldByName('ECEstado').AsString := 'C';
      DMTE.cdsEgrCajax.FieldByName('ECUSER').Value      := DMTE.wUsuario;
      DMTE.cdsEgrCajax.FieldByName('ECFREG').Value      := DateS;
      DMTE.cdsEgrCajax.FieldByName('ECHREG').AsDateTime := Time;
      DMTE.cdsEgrCajax.Post;
      DMTE.AplicaDatos(DMTE.cdsEgrCajax,'EGRCAJA');
      xSQL := 'Select * From CAJA302'
             +'Where CIAID ='+QuotedStr(dblcCia.Text)
             +' And ECANOMM ='+QuotedStr(edtPeriodo.Text)
             +' And TDIARID ='+QuotedStr(dblcTDiario.Text)
             +' And ECNOCOMP ='+QuotedStr(dbeNoComp.Text);
      DMTE.cdsEgrCajax.DataRequest( xSQL );
      lblEstado.Caption  :='Cancelado y Contab.' ;
      Z2bbtnCont.Enabled := False ;
      Screen.Cursor := crDefault ;
      MessageDlg('Contabilización OK', mtCustom, [mbOk], 0) ;
   end ;
end;

procedure TFTransferencia.RecuperaComp;
var
   xSQL : String ;
begin
   // vhn 23/01/2001
   xSQL := 'Select * from CAJA302 '
          +'Where CIAID='''   +Trans_Comp.CIAID    +''' and '
          +      'TDIARID=''' +Trans_Comp.TDIARID  +''' and '
          +      'ECANOMM=''' +Trans_Comp.ECANOMM  +''' and '
          +      'ECNOCOMP='''+Trans_Comp.ECNOCOMP +''' ';
   DMTE.cdsSQL.Close;
   DMTE.cdsSQL.DataRequest( xSQL );
   DMTE.cdsSQL.Open;

   xEstado := DMTE.cdsSQL.FieldBYName('ECEstado').AsString ;
end;

procedure TFTransferencia.ActualizaSaldosCaja;
var
   xCampo : String ;
begin

   if length(trim(dblcCCBco.TEXT))>0 then
   begin
      if dblcTMonO.Text = DMTE.wTMonLoc then
         xCampo := 'ECMTOLOC'
      else
         xCampo := 'ECMTOEXT' ;

      DMTE.ActSdoTlfn(dblcCia.text,dblcBanco.text,trim(dblcCCBCo.Text),
                     DMTE.cdsEgrCajaX.fieldBYname(xCampo).AsString,
                     DBDTPfcOMP.DATE) ;

      DMTE.ActSdoMen(dblcBanco.text,trim(dblcCCBCo.Text),
                    DMTE.cdsEgrCajaX.fieldBYname(xCampo).AsString,
                    DBDTPfcOMP.DATE) ;
   end
   else
   begin
      //egreso de caja
      with DMTE.cdsEgrCajaX do
      DMTE.ActSdoCaja(FieldByName('TMONID').AsString , FieldByName('BANCOID').AsString ,
                     FieldByName('ECMTOORI').AsString,FieldByName('ECFCOMP').AsString) ;
   end;

   if length(trim(dblcCCBco2.TEXT)) >0 then
   begin
      if dblcTMonD.Text = DMTE.wTMonLoc then
         xCampo := 'ECMTOLOC'
      else
         xCampo := 'ECMTOEXT' ;

      DMTE.ActSdoTlfn(dblcCia.text,dblcBanco2.text,trim(dblcCCBCo2.Text),
                     DMTE.cdsEgrCajaX.fieldBYname(xCampo).AsString ,
                     DBDTPfcOMP.DATE ,'I') ;

      DMTE.ActSdoMen(dblcBanco2.text,trim(dblcCCBCo2.Text) ,
                    DMTE.cdsEgrCajaX.fieldBYname(xCampo).AsString ,
                    DBDTPfcOMP.DATE,'I') ;
   end
   else
   begin
       //Ingreso a Caja
      with DMTE.cdsEgrCajaX do
      DMTE.ActSdoCaja(FieldByName('TMONID').AsString , FieldByName('BANCOID').AsString ,
                     FieldByName('ECMTOORI').AsString,FieldByName('ECFCOMP').AsString , 'I') ;

   end ;
end;

procedure TFTransferencia.ConfiguraAccesos;
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

procedure TFTransferencia.Libera_Admin;
begin
    Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFTransferencia.Libera_Consul;
begin

end;

procedure TFTransferencia.Proc_Admin;
var
   Contador : Integer ;
begin
    pnlCabecera1.Enabled := False ;
    pnlCabecera2.Enabled := False ;
    pnlDeTTrans.Enabled := False ;
    //Array de controles y eventos
    Contador := BotonesEnPanel( pnlBotones ) ;
    setlength( A1 , Contador) ;
    setlength( A2 , Contador) ;
    Quita(A1,A2,pnlBotones) ;
    //
    pnlBotones.Enabled := True ;
end;

procedure TFTransferencia.Proc_Consul;
begin
    pnlCabecera1.Enabled := False ;
    pnlCabecera2.Enabled := False ;
    pnlDeTTrans.Enabled := True ;
    pnlBotones.Enabled := False ;
end;

procedure TFTransferencia.LibConfigAccesos;
begin
   if DMTE.wAdmin = 'G' then
    Libera_Admin
   else
    begin
     if DMTE.wModo = 'C' then
      Libera_Consul ;
    end ;
end;

procedure TFTransferencia.z2bbtnCancelCabClick(Sender: TObject);
begin
   Adiciona ;
end;

procedure TFTransferencia.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFTransferencia.dbeTCambioEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFTransferencia.dbeTCambioExit(Sender: TObject);
begin
	if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then Exit;

    if strTmp <> TCustomEdit(Sender).text then
    begin
       TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text,4) ;
    end ;
end;

procedure TFTransferencia.dblcTMonDExit(Sender: TObject);
begin
	 if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then Exit;

	 edtMOneda2.Text := DMTE.DisplayDescrip('prvTGE', 'TGE103', 'TMONABR', 'TMONID='+QuotedStr(dblcTMonD.Text), 'TMONABR');
   if Length(edtMOneda2.Text)=0 then
    begin
     ShowMessage('Moneda no Existe');
     dblcTMonD.SetFocus;
     Exit;
    end;

   wModifica := True;
end;

procedure TFTransferencia.dblcTMonOExit(Sender: TObject);
begin
	 if (Screen.ActiveControl).TabOrder<(Sender as TWinControl).TabOrder then Exit;

	 edtMOneda.text := DMTE.DisplayDescrip('prvTGE','TGE103','TMONABR','TMONID='+QuotedStr(dblcTMonO.Text),'TMONABR');
   if Length(edtMOneda.Text)=0 then
    begin
      ShowMessage('Moneda no existe');
      dblcTMonO.SetFocus;
      Exit;
   end;
   wModifica := True ;
end;

procedure TFTransferencia.ProcesaCombos;
begin
    if xEnabled then
    begin

    end
    else
    begin

    end ;
end;

procedure TFTransferencia.CalculaMontos(var xECMTOORI,xECMTOLOC,xECMTOEXT:String ;EC_IE : string) ;
begin
   if EC_IE = 'E' then
   begin
      xECMTOLOC :=    floattostrf(DMTE.OperClientDataSet(DMTE.cdstrans,'SUM(TXMTOLOC)','' ),fffixed,10,2) ;
      xECMTOEXT :=    floattostrf(DMTE.OperClientDataSet(DMTE.cdstrans,'SUM(TXMTOEXT)','' ),fffixed,10,2) ;

      if dblcTMonO.Text = DMTE.wTMonLoc then
      begin
         xECMTOORI :=   xECMTOLOC ;
      end
      else
      begin
         xECMTOORI :=   xECMTOEXT ;
      end ;
   end
   else
   begin
      xECMTOLOC :=    floattostrf(DMTE.OperClientDataSet(DMTE.cdstrans,'SUM(TXMTOLOC)',''),fffixed,10,2) ;
      xECMTOEXT :=    floattostrf(DMTE.OperClientDataSet(DMTE.cdstrans,'SUM(TXMTOEXT)',''),fffixed,10,2) ;
      if dblcTMonD.Text = DMTE.wTMonLoc then
      begin
         xECMTOORI :=   xECMTOLOC ;
      end
      else
      begin
         xECMTOORI :=   xECMTOEXT ;
      end ;
   end ;
end;

procedure TFTransferencia.Contabiliza;
var
   Trans_Comp : structComprobante ;
   xRemesa : String;
   xSQL    : String;
// JCC 19/06/2002
	 xGlosa : String;
//
begin
   if length(trim(dblcCCBco2.Text)) > 0 then
   begin
      DMTE.RecuperarDatos('TGE106','CTAREMES','BANCOID='''+dblcBanco2.Text+''' AND CCBCOID='''+dblcCCBco2.Text+'''') ;
      xRemesa := DMTE.cdsRec.FieldByName('CTAREMES').AsString ;
   end
   else begin
      DMTE.RecuperarDatos('TGE105','REMESAID','BANCOID=''' +dblcBanco2.Text + '''') ;
      xRemesa := DMTE.cdsRec.FieldByName('REMESAID').AsString ;
   end ;

   xSQL := 'DELETE FROM CAJA304 '
          +'WHERE CIAID='   +QuotedStr( dblcCia.Text      ) +' AND '
          +      'ECANOMM=' +QuotedStr( edtPeriodo.Text   ) +' AND '
          +      'TDIARID=' +QuotedStr( dblcTDiario.Text ) +' AND '
          +      'ECNOCOMP='+QuotedStr( dbeNoComp.Text   );
   try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;

   xSQL := 'DELETE FROM CAJA304 '
          +'WHERE CIAID='   +QuotedStr( dblcCia.Text      ) +' AND '
          +      'ECANOMM=' +QuotedStr( edtPeriodo.Text   ) +' AND '
          +      'TDIARID=' +QuotedStr( dblcTDiario2.Text ) +' AND '
          +      'ECNOCOMP='+QuotedStr( dbeNoComp2.Text   );
   try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;

   // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera

   // vhn 23/01/2001
   xSQL := 'Select * From CAJA304 Where CIAID='''' and '
   				+'ECANOMM='''' and TDIARID='''' and ECNOCOMP='''' ';
	 DMTE.cdsCNTCaja.Close;
	 DMTE.cdsCNTCaja.DataRequest( xSQL );
	 DMTE.cdsCNTCaja.Open;

	 Trans_Comp.CIAID    := dblccia.Text ;
	 Trans_Comp.ECANOMM  := edtPeriodo.Text;
	 Trans_Comp.TDIARID  := dblcTDiario.Text;
	 Trans_Comp.ECNOCOMP := dbeNoComp.Text;
	 RecuperaComp(Trans_Comp) ;

/////////////// JCC 19/06/2002
	 xNReg := 0;
{	 xGlosa := DMTE.DisplayDescrip('prvTGE','TGE202','CTADES',
																'CIAID='+QuotedStr(dblcCia.Text)+' and CUENTAID='+QuotedStr(xRemesa),'CTADES');}
	 xGlosa := 'TRANSF. A '+edtBanco2.Text;
	 DMTE.cdsCntCaja.Insert;
	 Contab_EgrCaja( xGlosa, xRemesa, 'D' );
	 DMTE.cdsCntCaja.Post;

	 xGlosa := DMTE.DisplayDescrip('prvTGE','TGE202','CTADES',
																'CIAID='+QuotedStr(dblcCia.Text)+' and CUENTAID='+QuotedStr(edtCuenta.Text),'CTADES');
	 DMTE.cdsCntCaja.Insert;
	 Contab_EgrCaja( xGlosa, edtCuenta.Text, 'H' );
	 DMTE.cdsCntCaja.Post;

	 DMTE.cdsCntCaja.ApplyUpdates(0);

	 //RecuperaIngresos
	 Trans_Comp.CIAID   := dblccia.Text ;
	 Trans_Comp.ECANOMM := edtPeriodo.Text;
	 Trans_Comp.TDIARID := dblcTDiario2.Text;
	 Trans_Comp.ECNOCOMP:= dbeNoComp2.Text;
	 //RecuperaCabecera(Trans_Comp) ;
	 RecuperaComp(Trans_Comp) ;

	 xNReg  := 0;
	 xGlosa := DMTE.DisplayDescrip('prvTGE','TGE202','CTADES',
																'CIAID='+QuotedStr(dblcCia.Text)+' and CUENTAID='+QuotedStr(edtCuenta2.Text),'CTADES');
	 DMTE.cdsCntCaja.Insert;
	 Contab_EgrCaja( xGlosa, edtCuenta2.Text, 'D' );
	 DMTE.cdsCntCaja.Post;
{	 xGlosa := DMTE.DisplayDescrip('prvTGE','TGE202','CTADES',
																'CIAID='+QuotedStr(dblcCia.Text)+' and CUENTAID='+QuotedStr(xRemesa),'CTADES');}
	 xGlosa:= 'TRANSF. DE '+edtBanco.text;

	 DMTE.cdsCntCaja.Insert;
	 Contab_EgrCaja( xGlosa, xRemesa, 'H' );
	 DMTE.cdsCntCaja.Post;

////////////// JCC 19/06/2002
   //Actualizamos en la tabla de Contabilidad CAJA304
   DMTE.cdsCntCaja.ApplyUpdates(0);
end ;


procedure TFTransferencia.Contab_egrCaja(wGlosa,xCuenta,xDH : string ) ;
begin
   DMTE.cdsCntCaja.FieldByName('CIAID').Value   :=  DMTE.cdsSQL.fieldBYName('CIAID').Value;
   DMTE.cdsCntCaja.FieldByName('TDIARID').Value :=  DMTE.cdsSQL.fieldBYName('TDIARID').Value;
   DMTE.cdsCntCaja.FieldByName('DOCID').Value   :=  DMTE.cdsSQL.fieldBYName('DOCID').Value;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').Value  :=  'CAJA';
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value :=  DMTE.cdsSQL.fieldBYName('ECFCOMP').Value;
   //CIM 28/12/2001
   DMTE.cdsCntCaja.FieldByName('CPTOID').Value  :=  DMTE.cdsSQL.fieldBYName('CPTOID').AsString ;
   DMTE.cdsCntCaja.FieldByName('CUENTAID').Value:=  XCuenta ; //DMTE.c.fieldBYName('dsEgrCajaCUENTAID.Value ;
   DMTE.cdsCntCaja.FieldByName('DCDH').Value    :=  xDH ; //'H';
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  DMTE.cdsSQL.fieldBYName('ECTCAMB').Value;
   DMTE.cdsCntCaja.FieldByName('TMONID').Value  :=  DMTE.cdsSQL.fieldBYName('TMONID').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value:=  DMTE.cdsSQL.fieldBYName('ECMTOORI').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value :=  DMTE.cdsSQL.fieldBYName('ECMTOLOC').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value:=  DMTE.cdsSQL.fieldBYName('ECMTOEXT').Value;
   DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado

   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  DMTE.cdsSQL.fieldBYName('ECNOCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').Value  :=  DMTE.cdsSQL.fieldBYName('ECLOTE').AsString;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value :=  DMTE.cdsSQL.fieldBYName('ECANOMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCANO').Value   :=  DMTE.cdsSQL.fieldBYName('ECANO').Value;
   DMTE.cdsCntCaja.FieldByName('DCMM').Value    :=  DMTE.cdsSQL.fieldBYName('ECMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCDD').Value    :=  DMTE.cdsSQL.fieldBYName('ECDD').Value;
   DMTE.cdsCntCaja.FieldByName('DCSS').Value    :=  DMTE.cdsSQL.fieldBYName('ECSS').Value;
   DMTE.cdsCntCaja.FieldByName('DCSEM').Value   :=  DMTE.cdsSQL.fieldBYName('ECSEM').Value;
   DMTE.cdsCntCaja.FieldByName('DCTRI').Value   :=  DMTE.cdsSQL.fieldBYName('ECTRI').Value;
   DMTE.cdsCntCaja.FieldByName('DCAASS').Value  :=  DMTE.cdsSQL.fieldBYName('ECAASS').Value;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').Value :=  DMTE.cdsSQL.fieldBYName('ECAASEM').Value;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').Value :=  DMTE.cdsSQL.fieldBYName('ECAATRI').Value;
	 DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := wGlosa; // DMTE.cdsSQL.fieldBYName('ECGLOSA').AsString ;
//
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsString:= dbeTCambio.Text ;
   DMTE.cdsCntCaja.FieldByName('FCAB').AsString    := '1' ;
   if xDH='D' then
     DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := DMTE.cdsSQL.fieldBYName('ECNODOC').AsString
   else
    DMTE.cdsCntCaja.FieldByName('DCNODOC').AsString := dbeLiquida.Text;

   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsFloat:=  DMTE.cdsSQL.fieldBYName('ECTCAMB').AsFloat;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsFloat:=  DMTE.cdsSQL.FieldByName('ECTCAMB').AsFloat;
	 xNReg:=xNReg+1;
	 DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;
//
end;

procedure TFTransferencia.Z2bbtnImprimeEClick(Sender: TObject);
var
   Comprobante : RCabComprobante;
begin
   if DMTE.cdsEgrCajaX.FieldByName('ECCONTA').AsString <> 'S' THEN
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
                   DMTE.cdsResultSet, DMTE.DCOM1, Self ) then begin
      end;             

      ImprimeVoucher( 'CNT311', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
 	 end;

   if DMTE.cdsEgrCajaX.FieldByName('ECCONTA').AsString = 'S' then
	 begin
      ImprimeVoucher( 'CNT301', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
   end;
end;

procedure TFTransferencia.FormDestroy(Sender: TObject);
begin
   cf1.Free ;
end;

procedure TFTransferencia.ActualizaFiltro;
begin
   if z2bbtnNuevo.Visible then
    begin
     if not xGraboNuevo then
      cdsFiltro.append ;
     //DMTE.ActualizaCDS(DMTE.cdsEgrCajaX, cdsFiltro) ;
    end
   else
    begin
     //DMTE.ActualizaCDS(DMTE.cdsEgrCajaX, cdsFiltro) ;
    end ;
end;

procedure TFTransferencia.AsignaCDSFiltro(cds: TwwClientDataset);
begin
    cdsFiltro := cds ;
end;

procedure TFTransferencia.dbeFPagoExit(Sender: TObject);
begin
   if z2bbtnCancel3.Focused then Exit;
   if length(dbeFPago.Text)=0 then
   begin
      dbeFPago.SetFocus;
      Exit;
   end;

   if (dbeFPago.Text<>'E') and (dbeFPago.Text<>'C') then
   begin
      ShowMessage('Solo Puede Ser (E)fectivo o (C)heque');
      dbeFPago.SetFocus;
      Exit;
   end;

   if (xTipoCaja='B') and (xTipoCaja2='B') and (dbeFPago.Text='E') then
   begin
      ShowMessage('Só4lo se pueden transferir Cheques de Banco a Banco');
      dbeFPago.SetFocus;
      Exit;
   end;

   dbeCheque.Enabled:=False;

   if (xTipoCaja='B') and (xTipoCaja2='B') then
   begin
     dbeCheque.Enabled:=True;
     dblcTMon2.Enabled:=False;
     dblcBanco3.enabled:=False;
     DMTE.cdsTrans.FieldByName('TMONID').AsString  := dblcTMonO.text;
     DMTE.cdsTrans.FieldByName('BANCOID').AsString := dblcTMonO.text;
     dbeCheque.SetFocus;
   end
   else
   begin
     if dbeFPago.Text = 'C' then
     begin
       dblcTMon2.Enabled := False;
       dbeCheque.Enabled := True;
       dbeCheque.SetFocus;
     end
     else
     begin
       dblcTMon2.Enabled := True;
       dblcTMon2.SetFocus;
     end;
   end;
end;

procedure TFTransferencia.dblcBanco3Exit(Sender: TObject);
begin
   edtBanco3.Text := DMTE.DisplayDescrip('prvTGE', 'TGE105', 'BCOTIPCTA, BANCOABR', 'BANCOID ='+QuotedStr(dblcBanco3.Text), 'BANCOABR');
end;

procedure TFTransferencia.Z2bbtnImprimeIClick(Sender: TObject);
var
   Comprobante : RCabComprobante;
begin
   if DMTE.cdsEgrCajaX.FieldByName('ECCONTA').AsString <> 'S' THEN
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
                   DMTE.cdsResultSet, DMTE.DCOM1, Self ) then begin
      end;

      ImprimeVoucher( 'CNT311', dblcCia.Text, edtPeriodo.Text, dblcTDiario2.Text, dbeNoComp2.Text, dbeGlosa.Text );
 	 end;

   if DMTE.cdsEgrCajaX.FieldByName('ECCONTA').AsString = 'S' THEN
	 begin
      ImprimeVoucher( 'CNT301', dblcCia.Text, edtPeriodo.Text, dblcTDiario2.Text, dbeNoComp2.Text, dbeGlosa.Text );
   end;

end;

procedure TFTransferencia.z2bbtnCartaClick(Sender: TObject);
var
   xFileCarta : string;
begin
   xRuta := 'C:\SOL\'+Trim(FRegistro.xFiltroTRans.Module)+'\'+Trim(FRegistro.xFiltroTRans.SectionName);
   pnlCarta.Visible := True;
   pnlCarta.Enabled := True;
   flbCarta.Directory := wRutaRpt;
   xFileCarta := wRutaRpt+'\CartaTransf_'+Trim(dbeNoDoc.Text)+'.RTF';
   if FileExists(xFileCarta) then//Imprimir
    begin
     z2bbtnGeneraCarta.Enabled := False;
     flbCarta.Enabled          := True;
     z2bbtnImpCarta.Enabled    := True;
    end
   else//Generar Carta
    begin
     z2bbtnGeneraCarta.Enabled := True;
     flbCarta.Enabled          := False;
     z2bbtnImpCarta.Enabled    := False
    end;
end;

procedure TFTransferencia.z2bbtnCierraCartaClick(Sender: TObject);
begin
  pnlCarta.Visible := False;
  pnlCarta.Enabled := False;
end;

procedure TFTransferencia.z2bbtnImpCartaClick(Sender: TObject);
begin
//  If flbCarta.ItemIndex > -1 then
    ImprimeCarta
//  else showmessage('No ha seleccionado ninguna carta');
end;

procedure TFTransferencia.flbCartaChange(Sender: TObject);
begin
   If flbCarta.Items.Count > 0 then
		If flbCarta.ItemIndex <> -1 then
		xCarta := flbCarta.Items.Strings[flbCarta.itemindex];
end;

procedure TFTransferencia.Z2bbtnBuscaClick(Sender: TObject);
begin
	 pnlBusca.BringToFront;
	 pnlBusca.Visible:=True;
end;

procedure TFTransferencia.BitBtn2Click(Sender: TObject);
begin
	 pnlBusca.Visible:=False;
end;

procedure TFTransferencia.BitBtn1Click(Sender: TObject);
var
	 i, xT : Integer;

begin
   if DMTE.cdsDetFPago.FieldByName('TMONID').AsString<>dblcTMonO.Text then
   begin
      ShowMessage('Recibo Seleccionado debe ser de la Misma Moneda que Caja/Banco Origen');
      Exit;
   end;

	 xT:=DMTE.cdsTrans.Recordcount+1;

	 for i:= 0 to dbgTransf.SelectedList.Count-1 do
	 begin
			dbgTransf.DataSource.DataSet.GotoBookmark(dbgTransf.SelectedList.items[i]);

			DMTE.cdsTrans.Insert;
			DMTE.cdsTrans.FieldByName('TXNOREG').AssTRING := DMTE.StrZero( IntToStr( xT+i),10 );
			DMTE.cdsTrans.FieldByName('TXTCAMB').AsString := DMTE.cdsDetFPago.FieldByName('TC_USADO').AsString;
			DMTE.cdsTrans.FieldByName('TMONID').Value     := DMTE.cdsDetFPago.FieldByName('TMONID').AsString;
			DMTE.cdsTrans.FieldByName('FPAGOID').AsString := DMTE.cdsDetFPago.FieldByName('FPAGOID').AsString;
			DMTE.cdsTrans.FieldByName('TXNOCHQ').AsString := DMTE.cdsDetFPago.FieldByName('ECNOCHQ').AsString;
			DMTE.cdsTrans.FieldByName('BANCOID').AsString := DMTE.cdsDetFPago.FieldByName('BANCOID').AsString;
			DMTE.cdsTrans.FieldByName('CCTREC').AsString  := DMTE.cdsDetFPago.FieldByName('CCTREC').AsString;
			DMTE.cdsTrans.FieldByName('DOCID').AsString   := DMTE.cdsDetFPago.FieldByName('DOCID').AsString;
			DMTE.cdsTrans.FieldByName('CCNODOC').AsString := DMTE.cdsDetFPago.FieldByName('CCNODOC').AsString;
			DMTE.cdsTrans.FieldByName('CLAUXID').AsString := DMTE.cdsDetFPago.FieldByName('CLAUXID').AsString;
			DMTE.cdsTrans.FieldByName('CLIEID').AsString  := DMTE.cdsDetFPago.FieldByName('CLIEID').AsString;

			DMTE.cdsTrans.FieldByName('BANCOTRANS').AsString := dblcBanco2.Text;
			DMTE.cdsTrans.FieldByName('CCBCOTRANS').AsString := dblcCCBco2.Text;
			DMTE.cdsTrans.FieldByName('BANCOTRANO').AsString := dblcBanco.Text;
			DMTE.cdsTrans.FieldByName('CCBCOTRANO').AsString := dblcCCBco.Text;

			if DMTE.cdsTrans.FieldByName('FPAGOID').AsString = DMTE.wCHEQUE then
			begin
				 DMTE.cdsTrans.FieldByName('CHQ_ESTADO').AsString := 'PEND.COB';
				 DMTE.cdsTrans.FieldByName('CHQ_FECEMI').Value    := DMTE.cdsDetFPago.FieldByName('FC_FCANC').AsDateTime;
				 DMTE.cdsTrans.FieldByName('CHQ_FECVCM').Value    := DMTE.cdsDetFPago.FieldByName('FC_FVCMTO').AsDateTime;
				 DMTE.cdsTrans.FieldByName('CHQ_FECBCO').Value    := dbdtpFComp.Date;
			end;

      DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat := DMTE.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat;

      if DMTE.cdsTrans.FieldByName('TMONID').Value = DMTE.wTMonLoc then
      begin
         DMTE.cdsTrans.FieldByName('TXMTOLOC').Value:=DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat;
         DMTE.cdsTrans.FieldByName('TXMTOEXT').Value:=DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat/strtocurr(dbeTCambio.text) ;
      end
      else
      begin
         DMTE.cdsTrans.FieldByName('TXMTOLOC').Value:=DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat*strtocurr(dbeTCambio.text);
         DMTE.cdsTrans.FieldByName('TXMTOEXT').Value:=DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat;
      end;

      //dbeImporte2Exit(Sender);
      cdsPost( DMTE.cdsTrans );
      DMTE.cdsTrans.Post;

      DMTE.cdsDetFPago.Edit;
      DMTE.cdsDetFPago.FieldByName('FCTRANSF').AsString := 'S';
      DMTE.cdsDetFPago.Post;

      dbgTransf.DataSource.DataSet.FreeBookmark(dbgTransf.SelectedList.items[i]) ;
   end;

   DMTE.cdsDetFPago.Filtered := False;
   DMTE.cdsDetFPago.Filtered := True;

   z2bbtnSumatClick(Sender);

   DMTE.cdsMovCxP.EnableControls;
   dbgTransf.SelectedList.Clear;  { Clear selected record list since they are all deleted}
   dbgTransf.RefreshDisplay;
   dbgTrans.RefreshDisplay;
   DMTE.cdsTrans.EnableControls;
end;

procedure TFTransferencia.dblcFormPagoExit(Sender: TObject);
var
   xDescrip : String;
begin
   xDescrip := 'FPAGOID='+QuotedStr(dblcFormPago.text);
   edtFormPago.text := DMTE.DisplayDescrip('prvTGE','TGE112','FPAGODES',xDescrip,'FPAGODES');

   if length(edtFormPago.Text)=0 then Exit;

   if dblcFormPago.Text = DMTE.wEFECTIVO then
   begin
      dblcBanco3.Enabled := False;
      dbeCheque.Enabled  := False;
      dblcBanco3.Text    := '';
      edtFormPago.text   := '';
      dbeCheque.Text     := '';
   end
   else begin
      if dblcFormPago.Text = DMTE.wCHEQUE then
      begin
         dblcBanco3.Enabled := True;
         dbeCheque.Enabled  := True;
         dblcBanco3.SetFocus;
      end
      else
         if dblcFormPago.Text = DMTE.wTARJETA then
         begin
            dblcFormPago.SetFocus;
         end;
   end;
end;

procedure TFTransferencia.dbgTransfTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
	 isBusca.Visible     := True;
	 lblBusca.Visible    := True;
	 isBusca.SearchField := AFieldName;
	 isBusca.SetFocus;
end;

procedure TFTransferencia.isBuscaExit(Sender: TObject);
begin
	 isBusca.Visible  := False;
	 lblBusca.Visible := False;
end;

procedure TFTransferencia.dblcCCBcoEnter(Sender: TObject);
begin
   if (dblcBanco.Text = '')  or (edtBanco.Text = '')  then
      dblcBanco.SetFocus;
end;

procedure TFTransferencia.dblcCCBco2Enter(Sender: TObject);
begin
   if (dblcBanco2.Text = '') or (edtBanco2.Text = '') then
      dblcBanco2.SetFocus;
end;

procedure TFTransferencia.Z2bbtnEmiChqClick(Sender: TObject);
var
   strChq : structChq ;
   xSQL, ArchivoReporte : String ;
   xTotal : double;
begin
   if DMTE.cdsEgrCajaX.FieldByName('ECESTADO').AsString='A' then
      raise Exception.Create('La transferencia está Anulada');

   if DMTE.cdsEgrCajaX.FieldByName('ECESTADO').AsString<>'C' then
      raise Exception.Create('Debe aceptar primero la  transferencia ');

   if DMTE.cdsEgrCajaX.FieldByName('EC_IE').AsString<>'E' then
      raise Exception.Create('Debe Escoger la Transferencia del Egreso ');

   if Trim(dblcCCBco.Text) <> '' then
   begin
      //** 08/03/2001 - pjsv - para validar que no se reimprima el chq

      /////////////////////////////////////////
      xTotal := 0;
      xTotal := DMTE.cdsEgrCajaX.FieldByName('ECMTOORI').AsFloat;

      /////////////////////////////////////////

      xSQL:=     ' CIAID='''  +dblcCia.text     +''' and '
          +      'TDIARID=''' +dblcTDiario.text +''' and '
          +      'ECANOMM=''' +edtPeriodo.text  +''' and '
          +      'ECNOCOMP='''+dbeNoComp.text   +''' and '
          +      'EC_IE='''+DMTE.cdsEgrCajaX.FieldByName('EC_IE').AsString   +'''  ';

      if DMTE.DisplayDescrip('prvSQL', 'CAJA302', 'ECCHQEMI', xSQL, 'ECCHQEMI') <> 'S' then
      //**
       begin
        DMTE.RecuperarDatos('TGE106','*',
                           'BANCOID = ''' + dblcBanco.Text+ ''' AND CCBCOID = ''' + dblcCCBco.Text+ '''') ;
        ArchivoReporte  := DMTE.cdsRec.FieldByName('CCFMTCHQ').ASString ;
        if ArchivoReporte = '' then
         ArchivoReporte := 'ChqDefault.rtm';
        with strChq do
        begin
           ppFileName    := ArchivoReporte                                             ;
           ppGiradoA     := dbeGiradoA.Text                                            ;
    			 ppImporte     := FloatToStrF(StrToCurr(FloatToStr(xTotal)), ffFixed, 10, 2) ;
			     ppMontoLetras := strNum(strtofloat(ppImporte))                              ;
           ppDia         := strDia(dbdtpFComp.Date)                                    ;
           ppmes         := strMes(dbdtpFComp.Date)                                    ;
           ppAno         := strAno(dbdtpFComp.Date)                                    ;
{           If dblcCCBco.Text <> '0100001518' then
            ppRuc         := 'RUC :'+xRUCCIA;}
        end;
        //** 08/03/2001 - pjsv
        DMTE.xFlagP := False;
        FRegistro.EmiteChq(ArchivoReporte, strChq);
        if DMTE.xFlagP then
         begin
          xSQL := 'UPDATE CAJA302 SET ECCHQEMI=''S'' '
            +'WHERE CIAID='''   +dblcCia.text+''' and '
            +      'TDIARID=''' +dblcTDiario.text +''' and '
            +      'ECANOMM=''' +edtPeriodo.text+''' and '
            +      'ECNOCOMP='''+dbeNoComp.text+''' ';
          DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         end;
         //**
       end
      else ShowMessage('Cheque ya fué Impreso') ;
   end
   else
    begin
     ShowMessage('No ha seleccionado Cuenta Corriente') ;
    end ;
end;

procedure TFTransferencia.Z2bbtChqVouchClick(Sender: TObject);
var
   strChq : structChq ;
   xSQL, xWhere, ArchivoReporte : String;
   xTotal : Double;
begin
    xWhere := ' CIAID ='+QuotedStr(dblcCia.Text)+ ' AND BANCOID='+Quotedstr(dblcBanco.Text)+
              ' AND CCBCOID ='+QuotedStr(dblcCCBco.Text);
    DMTE.DisplayDescrip('prvQry2','TGE106','CHQVOUCH',xWhere,'CHQVOUCH');
    if DMTE.cdsQry.FieldByName('CHQVOUCH').AsString<>'S' then
       raise Exception.Create('Esta Cta.Cte no genera Cheque Voucher');

    if DMTE.cdsEgrcajaX.FieldByName('ECESTADO').AsString='A' then
       raise Exception.Create('El Comprobante se encuentra Anulado');

    if DMTE.cdsEgrcajaX.FieldByName('ECESTADO').AsString<>'C' then
       raise Exception.Create('Debe Cancelar el Comprobante primero');

    if Trim(dblcCCBco.Text) <> '' then
    begin
       xTotal := 0;

       xTotal := DMTE.cdsEgrcajaX.FieldByName('ECMTOORI').AsFloat;

       xSQL := '     CIAID='''   +dblcCia.text     +''' and '
              +      'TDIARID=''' +dblcTDiario.text +''' and '
              +      'ECANOMM=''' +edtPeriodo.text  +''' and '
              +      'ECNOCOMP='''+dbeNoComp.text   +''' ';
       if DMTE.DisplayDescrip('prvSQL', 'CAJA302', 'ECCHQEMI', xSQL, 'ECCHQEMI') <> 'S' then
       begin
          GeneraRegChqVouch;
          ppdbpChqVouch.DataSource      := DMTE.dsTranCob;
          pprChqVouch.TEMPLATE.FileName := wRutaRpt + '\ChequeVoucher.rtm';
          pprChqVouch.template.LoadFromFile ;
          ppGiradoA.Caption     := dbeGiradoA.Text;
          ppImporte.Caption     := FloatToStrF(StrToCurr(FloatToStr(xTotal)), ffFixed, 10, 2) ;

          ppImporte.Caption := Format('%15.2n',[strtofloat(ppImporte.Caption)])        ;
          ppImporte.Caption := StringReplace(ppImporte.Caption,' ','*',[rfreplaceAll]) ;
          ppMontoLetras.Caption := StrNum(xTotal)                              ;
          ppDia.Caption         := strDia(dbdtpFComp.Date)                                    ;
          ppmes.Caption         := strMes(dbdtpFComp.Date)                                    ;
          ppAno.Caption         := strAno(dbdtpFComp.Date)                                    ;
          ppGiradoA2.Caption    := dbeGiradoA.Text;
          ppCtaBanco.Caption    := dblcCCBco.Text;
          ppGlosa.Caption       := dbeGlosa.Text ;
          ppImporte2.Caption    := ppImporte.Caption;
          ppMoneda.Caption      := edtMoneda.Text;
          ppComprobante.Caption := dblcTDiario.Text+FloatToStr(StrToFloat(dbeNoComp.Text));
          pprChqVouch.Print;

          DMTE.xFlagP := False;
          if DMTE.xFlagP then
           begin
            xSQL := 'UPDATE CAJA302 SET ECCHQEMI =''S'' '
                   +'WHERE CIAID='''   +dblcCia.Text+''' and '
                   +      'TDIARID=''' +dblcTDiario.Text +''' and '
                   +      'ECANOMM=''' +edtPeriodo.Text+''' and '
                   +      'ECNOCOMP='''+dbeNoComp.Text+''' ';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
          end;
       end
       else ShowMessage('Cheque ya fué impreso') ;
    end
    else
     begin
      ShowMessage('No ha seleccionado Cuenta Corriente') ;
     end ;
end;

procedure TFTransferencia.GeneraRegChqVouch;
var
   xCuentaId, xSQL, xWhere : String;
   xMto : Double;
   xMTOCHQLOC         : Double   ;
   xMTOCHQEXT         : Double   ;
   xbEof : Boolean;
   xCtaDG, xCtaDP : String;
begin

   DMTE.cdsCNTCaja.IndexFieldNames := '';

   if DMTE.cdsEgrCajaX.FieldByName('ECCONTA').AsString <> 'S' then
   	begin
     Contabiliza;
 	  end;

   xSQL := 'SELECT A.* ,0.00 DEBE,0.00 HABER FROM CAJA304 A  '
          +'WHERE ( A.CIAID='     +QuotedStr('XY'     ) +' AND '
          +        'A.ECANOMM='  +QuotedStr('190001' ) +' ) ';
   DMTE.cdsTranCob.IndexFieldNames:='';
   DMTE.cdsTranCob.Filter :='';
   DMTE.cdsTranCob.Filtered := False;
   DMTE.cdsTranCob.Close;
   DMTE.cdsTranCob.DataRequest(xSQL);
   DMTE.cdsTranCob.Open;
   DMTE.cdsTranCob.EmptyDataSet;

   if DMTE.cdsEgrCajaX.FieldByName('ECCONTA').AsString = 'S' then
    begin
	     xSQL := 'SELECT A.*, B.CIADES FROM CAJA304 A, TGE101 B  '
	       	+'WHERE ( A.CIAID='     +QuotedStr( DMTE.cdsEgrcajaX.FieldByName('CIAID').AsString    ) +' AND '
	       	+        'A.ECANOMM='   +QuotedStr( DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString  ) +' AND '
	       	+        'A.TDIARID='   +QuotedStr( DMTE.cdsEgrCajaX.FieldByName('TDIARID').AsString  ) +' AND '
	       	+        'A.ECNOCOMP='  +QuotedStr( DMTE.cdsEgrCajaX.FieldByName('ECNOCOMP').AsString ) +' AND '
	       	+        'A.CIAID=B.CIAID ) ';
	     DMTE.cdsCntCaja.Close;
	     DMTE.cdsCntCaja.DataRequest(xSQL);
	     DMTE.cdsCntCaja.Open;
    end;

   xNReg := 0;
   xMto  := 0;
   xbEof := False;

   DMTE.cdsCntCaja.IndexFieldNames := 'CUENTAID';
   DMTE.cdsCntCaja.First;
   xCuentaId := DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString;
   While not DMTE.cdsCntCaja.Eof do
   begin
      xMTOCHQLOC := DMTE.FRound(xMTOCHQLOC+DMTE.cdsCntCaja.FieldByName('DCMTOLO').AsFloat, 15, 2 );
      xMTOCHQEXT := DMTE.FRound(xMTOCHQEXT+DMTE.cdsCntCaja.FieldByName('DCMTOEXT').AsFloat, 15, 2 ) ;

      DMTE.cdsCntCaja.Next;
      xbEof := DMTE.cdsCntCaja.Eof;

      if (DMTE.cdsCntCaja.Eof) or (xCuentaId<>DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString)  then
      begin
         if not DMTE.cdsCntCaja.EOF then
            DMTE.cdsCntCaja.Prior;
         xNReg := 0;

         DMTE.cdsTranCob.Insert;
         DMTE.cdsTranCob.FieldByName('CIAID').Value    := DMTE.cdsCntCaja.FieldByName('CIAID').Value;
         DMTE.cdsTranCob.FieldByName('TDIARID').Value  := DMTE.cdsCntCaja.FieldByName('TDIARID').Value;
         DMTE.cdsTranCob.FieldByName('ECANOMM').Value  := DMTE.cdsCntCaja.FieldByName('ECANOMM').Value;
         DMTE.cdsTranCob.FieldByName('ECNOCOMP').Value := DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value;
         DMTE.cdsTranCob.FieldByName('DCLOTE').Value   := DMTE.cdsCntCaja.FieldByName('DCLOTE').Value;
         DMTE.cdsTranCob.FieldByName('DOCMOD').Value   := 'CXP';
         DMTE.cdsTranCob.FieldByName('DOCID').Value    := DMTE.cdsCntCaja.FieldByName('DOCID').Value;
         DMTE.cdsTranCob.FieldByName('DCSERIE').Value  := DMTE.cdsCntCaja.FieldByName('DCSERIE').Value;
      	 DMTE.cdsTranCob.FieldByName('DCNODOC').Value  := DMTE.cdsCntCaja.FieldByName('DCNODOC').Value;
         DMTE.cdsTranCob.FieldByName('ECFCOMP').Value  := DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value;
      	 DMTE.cdsTranCob.FieldByName('DCFEMIS').Value  := DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value;
       	 DMTE.cdsTranCob.FieldByName('DCFVCMTO').Value := DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value;
       	 DMTE.cdsTranCob.FieldByName('CPTOID').Value   := DMTE.cdsCntCaja.FieldByName('CPTOID').Value;
         DMTE.cdsTranCob.FieldByName('CUENTAID').Value := DMTE.cdsCntCaja.FieldByName('CUENTAID').Value;
         DMTE.cdsTranCob.FieldByName('CLAUXID').Value  := DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString;
         DMTE.cdsTranCob.FieldByName('CCOSID').Value   := DMTE.cdsCntCaja.FieldByName('CCOSID').AsString;
         if DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString<>'' then
         begin
            DMTE.cdsTranCob.FieldByName('DCAUXID').Value := DMTE.cdsCntCaja.FieldByName('DCAUXID').Value;
            DMTE.cdsTranCob.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCajaX.fieldBYName('ECGLOSA').AsString;
         end
         else
         begin
            DMTE.cdsTranCob.FieldByName('DCAUXID').Value := DMTE.cdsCntCaja.FieldByName('CUENTAID').Value;
//            DMTE.cdsTrans.FieldByName('DCGLOSA').AsString := DMTE.cdsEgrCaja.fieldBYName('ECGLOSA').AsString;
         end;

         DMTE.cdsTranCob.FieldByName('DCTCAMPA').Value := DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value;
         DMTE.cdsTranCob.FieldByName('TMONID').Value   := DMTE.cdsCntCaja.FieldByName('TMONID').Value;
         DMTE.cdsTranCob.FieldByName('DCDH').Value     := DMTE.cdsCntCaja.FieldByName('DCDH').Value;
         if DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString = DMTE.wTMonLoc then
         begin
            DMTE.cdsTranCob.FieldByName('DCMTOORI').AsFloat := xMTOCHQLOC;
            DMTE.cdsTranCob.FieldByName('DCMTOEXT').AsFloat := xMTOCHQEXT;
            DMTE.cdsTranCob.FieldByName('DCMTOLO').AsFloat  := xMTOCHQLOC;
            if DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'D' then
               DMTE.cdsTranCob.FieldByName('DEBE').AsFloat := xMTOCHQLOC
            else
               if DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'H' then
                  DMTE.cdsTranCob.FieldByName('HABER').AsFloat := xMTOCHQLOC;

         end
         else
            if DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString = DMTE.wTMonExt then
            begin
               DMTE.cdsTranCob.FieldByName('DCMTOORI').AsFloat := xMTOCHQEXT;
               DMTE.cdsTranCob.FieldByName('DCMTOEXT').AsFloat := xMTOCHQEXT;
               DMTE.cdsTranCob.FieldByName('DCMTOLO').AsFloat  := xMTOCHQLOC;
               if DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'D' then
                  DMTE.cdsTranCob.FieldByName('DEBE').AsFloat := xMTOCHQEXT
               else
                  if DMTE.cdsCntCaja.FieldByName('DCDH').Value='H' then
                     DMTE.cdsTranCob.FieldByName('HABER').AsFloat := xMTOCHQEXT;
            end;
         DMTE.cdsTranCob.FieldByName('DCFLACDR').AsString := 'S';   //Registro ya cuadrado
         DMTE.cdsTranCob.FieldByName('DCANO').AsString    := DMTE.cdsEgrCajaX.FieldByName('ECANO').AsString;
         DMTE.cdsTranCob.FieldByName('DCMM').AsString     := DMTE.cdsEgrCajaX.FieldByName('ECMM').AsString;
         DMTE.cdsTranCob.FieldByName('DCDD').AsString     := DMTE.cdsEgrCajaX.FieldByName('ECDD').AsString;
         DMTE.cdsTranCob.FieldByName('DCSS').AsString     := DMTE.cdsEgrCajaX.FieldByName('ECSS').AsString;
         DMTE.cdsTranCob.FieldByName('DCSEM').AsString    := DMTE.cdsEgrCajaX.FieldByName('ECSEM').AsString;
         DMTE.cdsTranCob.FieldByName('DCTRI').AsString    := DMTE.cdsEgrCajaX.FieldByName('ECTRI').AsString;
         DMTE.cdsTranCob.FieldByName('DCAASS').AsString   := DMTE.cdsEgrCajaX.FieldByName('ECAASS').AsString;
         DMTE.cdsTranCob.FieldByName('DCAASEM').AsString  := DMTE.cdsEgrCajaX.FieldByName('ECAASEM').AsString;
         DMTE.cdsTranCob.FieldByName('DCAATRI').AsString  := DMTE.cdsEgrCajaX.FieldByName('ECAATRI').AsString;
         DMTE.cdsTranCob.FieldByName('DCUSER').AsString   := DMTE.cdsEgrCajaX.FieldByName('ECUSER').AsString;

         if (DMTE.xSRV_RUTA='\\INCORESA') or (DMTE.xSRV_RUTA='\\SACSA') or (DMTE.xSRV_RUTA='\\APLICACIONES\SOLAPLI')  then
          begin
           xSQL := 'Select AUXNOMB from CNT201 '
                  +'Where CLAUXID='''+DMTE.cdsCntCaja.FieldByName('CLAUXID').AsString+''' and '
                  +      'AUXID='''  +DMTE.cdsCntCaja.FieldByName('DCAUXID').AsString  +'''';
           DMTE.cdsQry.Close;
           DMTE.cdsQry.DataRequest( xSQL );
           DMTE.cdsQry.Open;
           DMTE.cdsTranCob.FieldByName('DCGLOSA').AsString := DMTE.cdsQry.FieldByName('AUXNOMB').AsString;
          end;
         xNReg := xNReg+1;
         DMTE.cdsTranCob.FieldByName('NREG').AsInteger  := xNReg;
         if xbEof then
            DMTE.cdsCntCaja.Last
         else
             DMTE.cdsCntCaja.Next;
         xMTOCHQEXT := 0;
         xMTOCHQLOC := 0;
        xCuentaId := DMTE.cdsCntCaja.FieldByName('CUENTAID').AsString;
      end;
   end;
   DMTE.cdsTranCob.Post;
   DMTE.cdsTranCob.Filter := 'DEBE>0 OR HABER>0';
   DMTE.cdsTranCob.Filtered := True;
   DMTE.cdsCntCaja.IndexFieldNames := '';
end;

procedure TFTransferencia.dbeChequeExit(Sender: TObject);
var
   xSQL : String;
begin
   xSQL := 'CIAID='+QuotedStr(dblcCia.Text)+' AND TDIARID='+QuotedStr(dblcTDiario.Text)+' and '
          +'ECNOCOMP<>'+QuotedStr( dbeNoComp.Text )+' and '
	        +'CCBCOID='+QuotedStr(dblcCCBco.Text)+' AND ECNOCHQ='+QuotedStr(dbeCheque.Text);

   DMTE.DisplayDescrip('prvTGE', 'CAJA302', 'ECNOCHQ, ECESTADO, ECELABO', xSQL, 'ECNOCHQ');
   if DMTE.cdsQry.FieldByName('ECNOCHQ').AsString<>'' then
    begin
     if DMTE.cdsQry.FieldByName('ECESTADO').AsString<>'A' then
      begin
       ShowMessage('El número de Cheque ya fué Utilizado');
       dbeCheque.Text := '';
       dbeCheque.SetFocus;
      end
     else
      begin
       if DMTE.cdsQry.FieldByName('ECELABO').AsString='NULO' then
        begin
           showmessage('El número de Cheque ya fué Utilizado');
           dbeCheque.Text := '';
           dbeCheque.SetFocus;
        end
      end;
    end;
end;

procedure TFTransferencia.pprChqVouchPrintingComplete(Sender: TObject);
begin
   DMTE.xFlagP := True;
end;

procedure TFTransferencia.ImprimeCarta;
var
   xRutaWord, xFileCarta : String;
begin
   xFileCarta := wRutaRpt+'\CartaTransf_'+Trim(dbeNoDoc.Text)+'.RTF';
   xRutaWord := ExtractFilePath('C:\Archivos de programa\Microsoft Office\Office\Winword.exe') ;
//   wwDBRichEdit2.Lines.SaveToFile(wRutaRpt+'\CartaTransf_'+Trim(xCampo5)+'.RTF');
//   wwDBRichEdit2.Lines.SaveToFile(wRutaRpt+'\CartaTransf_'+Trim(xCampo5)+'.RTF');
//    wwDBRichEdit2.Lines.SaveToFile(wRutaRpt+'\CartaTransf.RTF');

//   rchtPagina.LoadFromFile(wRutaRpt+'\'+xCarta);
   rchtPagina.LoadFromFile(xFileCarta);

//    WinExecAndWait32(xRutaWord+'Winword.exe ' +ExtractFilePath(Application.ExeName ) +wRutaRpt+'\Oficio1_1_'+Trim(xCampo5)+'.RTF',1);
//    WinExecAndWait32(xRutaWord+'Winword.exe ' +ExtractFilePath(wRutaRpt ) +'Oficio1_1_'+Trim(xCampo5)+'.RTF',1);
//    WinExecAndWait32(xRutaWord+'Winword.exe ' +ExtractFilePath(wRutaRpt ) +DMTE.wRptCia+'\CartaTransf_'+Trim(xCampo5)+'.RTF',1);
   rptOficio.Print;
end;

function WinExecAndWait32(FileName:String; Visibility:integer):integer;
var
  zAppName:array[0..512] of char;
  zCurDir:array[0..255] of char;
  WorkDir:String;
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
  Resultado,exitCode: DWord;
begin
  StrPCopy(zAppName,FileName);
  GetDir(0,WorkDir);
  StrPCopy(zCurDir,WorkDir);
  FillChar(StartupInfo,Sizeof(StartupInfo),#0);
  StartupInfo.cb := Sizeof(StartupInfo);

  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  CreateProcess(nil,
    zAppName,                      { pointer to command line string }
    nil,                           { pointer to process security attributes}
    nil,                           { pointer to thread security attributes}
    False,                         { handle inheritance flag }
    CREATE_NEW_CONSOLE or          { creation flags }
    NORMAL_PRIORITY_CLASS,
    nil,                           { pointer to new environment block }
    nil,                           { pointer to current directory name }
    StartupInfo,                   { pointer to STARTUPINFO }
    ProcessInfo);

  {Espera a que termine la ejecucion}
  {Wait until execution finish}
  repeat
    exitCode := WaitForSingleObject( ProcessInfo.hProcess,1000);
    Application.ProcessMessages;
  until (exitCode <> WAIT_TIMEOUT);
  GetExitCodeProcess(ProcessInfo.hProcess,Resultado);
  MessageBeep(0);
  CloseHandle(ProcessInfo.hProcess );
  Result:=Resultado;
end;


procedure TFTransferencia.z2bbtnGeneraCartaClick(Sender: TObject);
begin
   z2bbtnImpCarta.Enabled := False;
   flbCarta.Enabled := False;

   GeneraCarta;

   flbCarta.Enabled := True;
   z2bbtnGeneraCarta.Enabled := False;
   z2bbtnImpCarta.Enabled    := True;
end;

procedure TFTransferencia.GeneraCarta;
    Function Sustituir(pCadena,pEsto,pPor : String) : STring;
    var
     xPos : Integer;
    begin
     xPos := Pos(pEsto,pCadena);
     Result := '';
     while (xPos <> 0 ) do
      begin
       Result := Result + copy(pCadena,1,xPos-1)+pPor;
       Delete(pCadena,1,xPos+Length(pEsto)-1);
       xPos := Pos(pEsto,pCadena);
      end;
     Result := Result + pCadena;
    end;
const
 cMeses : Array[1..12] of String = ('Enero','Febrero','Marzo','Abril','Mayo','Junio',
                                  'Julio','Agosto','Setiembre','Octubre','Noviembre','Diciembre');
var
   xMeses, xCampo1, xCampo2, xCampo3, xCampo4, xCampo5, xCampo6, xCampo7, xCampo8,
   xCampo9, xCampo10, xCampo11, xCampo12, xCampo13, xCampo14, xSQL : String;
   xAno,xMes, xDia : Word;
   xRutaWord, xFileCarta : String;
begin

   xRutaWord := ExtractFilePath('C:\Archivos de programa\Microsoft Office\Office\Winword.exe') ;
   DecodeDate(Date, xANo, xMes, xDia);
   Case  xMes of
    1 : xMeses := cMeses[xMes];
    2 : xMeses := cMeses[xMes];
    3 : xMeses := cMeses[xMes];
    4 : xMeses := cMeses[xMes];
    5 : xMeses := cMeses[xMes];
    6 : xMeses := cMeses[xMes];
    7 : xMeses := cMeses[xMes];
    8 : xMeses := cMeses[xMes];
    9 : xMeses := cMeses[xMes];
    10 : xMeses := cMeses[xMes];
    11 : xMeses := cMeses[xMes];
    12 : xMeses := cMeses[xMes];
   end;

   xSQL := 'Select CIADES CAMPO01,'+QuotedStr('Módulo de Tesorería')+
          ' CAMPO02,'+QuotedStr(' ')+' CAMPO03,CIALUGAR ||'+
          QuotedStr(', '+FloatToStr(xDia)+' de '+xMeses+' del '+FloatToStr(xAno)) +
         ' CAMPO04 From TGE101 Where CIAID ='+Quotedstr(dblcCia.text);
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;

   xCampo1 := DMTE.cdsQry.FieldByName('CAMPO01').AsString;
   xCampo2 := DMTE.cdsQry.FieldByName('CAMPO02').AsString;
   xCampo3 := DMTE.cdsQry.FieldByName('CAMPO03').AsString;
   xCampo4 := DMTE.cdsQry.FieldByName('CAMPO04').AsString;
   xCampo5 := Trim(dbeNoDoc.Text);

   xSQL := 'BANCOID ='+QuotedStr(dblcBanco.Text);
   xCampo6  := DMTE.DisplayDescrip('prvTGE', 'TGE105', 'BANCONOM', xSQL, 'BANCONOM');
   xCAmpo7  := 'OFICINA PRINCIPAL';
   xCampo10 := dblcCCBco.Text;
   xCampo12 := Floattostr(DMTE.cdsEgrCajaX.FieldByName('ECMTOORI').AsFloat);


   wwDBRichEdit1.Width := 800;
   wwDBRichEdit2.Width := 800;

   xFileCarta := wRutaRpt+'\Plantilla_Transf.RTF';
   if not FileExists(xFileCarta) then//Imprimir
   begin
      raise exception.Create('No existe la Plantilla para la Generación de la Carta'+#13+
                              'Solicitelo a su Implementador' );
   end;

   wwDBRichEdit1.Lines.LoadFromFile(wRutaRpt+'\Plantilla_Transf.RTF');
   wwDBRichEdit2.Lines.Clear;
   wwDBRichEdit1.Font.Name := 'Courier New';
   wwDBRichEdit2.Font.Name := 'Courier New';
   wwDBRichEdit2.Lines.Text := Sustituir(wwDBRichEdit1.Lines.Text,'CAMPO01',xCampo1);
   wwDBRichEdit2.Lines.Text := Sustituir(wwDBRichEdit2.Lines.Text,'CAMPO02',xCampo2);
   wwDBRichEdit2.Lines.Text := Sustituir(wwDBRichEdit2.Lines.Text,'CAMPO03',xCampo3);
   wwDBRichEdit2.Lines.Text := Sustituir(wwDBRichEdit2.Lines.Text,'CAMPO04',xCampo4);
   wwDBRichEdit2.Lines.Text := Sustituir(wwDBRichEdit2.Lines.Text,'CAMPO05',xCampo5);

   wwDBRichEdit2.Lines.Text := Sustituir(wwDBRichEdit2.Lines.Text,'CAMPO06',xCampo6);
   wwDBRichEdit2.Lines.Text := Sustituir(wwDBRichEdit2.Lines.Text,'CAMPO07',xCampo7);
   wwDBRichEdit2.Lines.Text := Sustituir(wwDBRichEdit2.Lines.Text,'CAMPO08',xCampo8);
   wwDBRichEdit2.Lines.Text := Sustituir(wwDBRichEdit2.Lines.Text,'CAMPO09',xCampo9);
   wwDBRichEdit2.Lines.Text := Sustituir(wwDBRichEdit2.Lines.Text,'CAMPO10',xCampo10);
   wwDBRichEdit2.Lines.Text := Sustituir(wwDBRichEdit2.Lines.Text,'CAMPO11',xCampo11);
   wwDBRichEdit2.Lines.Text := Sustituir(wwDBRichEdit2.Lines.Text,'CAMPO12',xCampo12);
   wwDBRichEdit2.Lines.Text := Sustituir(wwDBRichEdit2.Lines.Text,'CAMPO13',xCampo13);
   wwDBRichEdit2.Lines.Text := Sustituir(wwDBRichEdit2.Lines.Text,'CAMPO14',xCampo14);
   wwDBRichEdit2.Lines.SaveToFile(wRutaRpt+'\CartaTransf_'+Trim(xCampo5)+'.RTF');

   flbCarta.Directory := wRutaRpt;
   flbCarta.Update ;
   flbCarta.Refresh ;
   MessageDlg('Carta Generada', mtCustom, [mbOk], 0);

//    rchtPagina.LoadFromFile(wRutaRpt+'\Oficio1_'+Trim(xCampo5)+'.RTF');
//    WinExecAndWait32(xRutaWord+'Winword.exe ' +ExtractFilePath(wRutaRpt ) +DMTE.wRptCia+'\CartaTransf_'+Trim(xCampo5)+'.RTF',1);
//    rptOficio.Print;
end;


procedure TFTransferencia.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
//GAR***************************************************************************
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
//GAR***************************************************************************
end;

procedure TFTransferencia.rptOficioPreviewFormCreate(Sender: TObject);
begin
   rptOficio.PreviewForm.WindowState := wsMaximized;
   TppViewer(rptOficio.PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

procedure TFTransferencia.BitBtn3Click(Sender: TObject);
begin
   DMTE.cdsTrans.Edit;
   if DMTE.cdsTrans.FieldByName('TMONID').Value = DMTE.wTMonLoc then
   begin
      DMTE.cdsTrans.FieldByName('TXMTOLOC').Value:=DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat;
      DMTE.cdsTrans.FieldByName('TXMTOEXT').Value:=DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat/strtocurr(dbeTCambio.text) ;
   end
   else
   begin
      DMTE.cdsTrans.FieldByName('TXMTOLOC').Value:=DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat*strtocurr(dbeTCambio.text);
      DMTE.cdsTrans.FieldByName('TXMTOEXT').Value:=DMTE.cdsTrans.FieldByName('TXMTOORI').AsFloat;
   end;
   DMTE.cdsTrans.ApplyUpdates(0) ;

   ActualizaCaja( dblcCia.Text, dblcTDiario.Text,  dbeNoComp.Text,  edtPeriodo.Text );
   
   ActualizaCaja( dblcCia.Text, dblcTDiario2.Text, dbeNoComp2.Text, edtPeriodo.Text );

   z2bbtnContClick( self );
end;


procedure TFTransferencia.ActualizaCaja( cCia, cTDiario, cNoComp, cAnoMM : String );
var
   xSQL : String;
begin
   xSQL:='update CAJA302 SET ECMTOORI='+DMTE.cdsTrans.FieldByName('TXMTOORI').AsString+', '+
                            'ECMTOLOC='+DMTE.cdsTrans.FieldByName('TXMTOLOC').AsString+', '+
                            'ECMTOEXT='+DMTE.cdsTrans.FieldByName('TXMTOEXT').AsString+' '
        +'Where CIAID='''+cCia+''' and TDIARID='''+cTDiario+''' '
        +  'and ECANOMM='''+cAnoMM+''' and ECNOCOMP='''+cNoComp+'''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Execute;
end;


end.

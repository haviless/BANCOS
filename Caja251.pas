unit Caja251;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit, Variants,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient,ComCtrls;


type
  TFReciboSoc = class(TForm)
    pnlCabecera1: TPanel;
    lblCia: TLabel;
    lblConcepto: TLabel;
    lblGlosa: TLabel;
    lblTDoc: TLabel;
    lblNoDoc: TLabel;
    Label9: TLabel;
    lblProvRuc: TLabel;
    lblProvDes: TLabel;
    Label1: TLabel;
    lblBanco: TLabel;
    lblCuenta: TLabel;
    lblFComp: TLabel;
    lblTCambio: TLabel;
    Z2bbtnOKCab: TBitBtn;
    dblcdCnp: TwwDBLookupComboDlg;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    dbeGlosa: TwwDBEdit;
    dblcTDoc: TwwDBLookupCombo;
    edtAuxRuc: TEdit;
    dbeGiradoA: TwwDBEdit;
    dbeNoDoc: TEdit;
    dblcTMonCab: TwwDBLookupCombo;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TEdit;
    edtCuenta: TEdit;
    edtTMonCab: TEdit;
    dbdtpFEmision: TwwDBDateTimePicker;
    dbeTCambio: TwwDBEdit;
    edtTDoc: TEdit;
    pnlDetalle: TPageControl;
    TabSheet1: TTabSheet;
    pnlPendientes: TPanel;
    Label16: TLabel;
    dbgPendientes: TwwDBGrid;
    pnlDocCanje: TPanel;
    Label17: TLabel;
    dbgDocCanje: TwwDBGrid;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    dbgDetFPago: TwwDBGrid;
    Z2bbtnAdicFPago: TwwIButton;
    dbeSerie: TwwDBEdit;
    PnlFPago: TPanel;
    Bevel2: TBevel;
    lblFormPago: TLabel;
    lblNoChq: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label18: TLabel;
    Label10: TLabel;
    Bevel1: TBevel;
    Label20: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    Z2OkDetalle: TBitBtn;
    BitBtn1: TBitBtn;
    StaticText1: TStaticText;
    dblcFormPago: TwwDBLookupCombo;
    dbeNoChq: TwwDBEdit;
    dbeRecibido: TwwDBEdit;
    dblcBancoFPago: TwwDBLookupCombo;
    edtBcoFPago: TEdit;
    edtFormPago: TEdit;
    dblcTMonC: TwwDBLookupCombo;
    edtTMonC: TEdit;
    Edit6: TEdit;
    dbeACobrar: TwwDBEdit;
    dbeResta: TwwDBEdit;
    BitBtn2: TBitBtn;
    dblcTarjeta: TwwDBLookupCombo;
    edtTarjeta: TEdit;
    pnlBotones: TPanel;
    lblEstadoMov: TLabel;
    Z2bbtnImprime: TBitBtn;
    Z2bbtnGraba: TBitBtn;
    Z2bbtnSube: TBitBtn;
    edtTDiario: TEdit;
    dblcTDiario: TwwDBLookupCombo;
    lblAnoMes: TLabel;
    meAnoMM: TwwDBEdit;
    lblNoReg: TLabel;
    meNoReg: TwwDBEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcTMonCabExit(Sender: TObject);
    procedure dbdtpFEmisionExit(Sender: TObject);
    procedure Z2bbtnOKCabClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgPendientesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgPendientesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgDocCanjeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgDocCanjeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgDocCanjeExit(Sender: TObject);
    procedure dbgDocCanjeCalcTitleAttributes(Sender: TObject;
      AFieldName: String; AFont: TFont; ABrush: TBrush;
      var ATitleAlignment: TAlignment);
    procedure dbgDocCanjeEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure pnlDetalleChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Z2OkDetalleClick(Sender: TObject);
    procedure Z2bbtnAdicFPagoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgDetFPagoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgDetFPagoDblClick(Sender: TObject);
    procedure Z2bbtnSubeClick(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure dblcBancoFPagoExit(Sender: TObject);
    procedure dblcTarjetaExit(Sender: TObject);
    procedure dblcTMonCExit(Sender: TObject);
    procedure dbeRecibidoChange(Sender: TObject);
    procedure dbeRecibidoEnter(Sender: TObject);
    procedure dbeRecibidoExit(Sender: TObject);
    procedure dbeACobrarEnter(Sender: TObject);
    procedure dbeACobrarExit(Sender: TObject);
  private
    strTmp  : String;  
    xDescrip : string;
    xModifica : String;
    xPeriodo : String;
    xMes,xAnio,xDia : Word;
    A2digitos ,A4digitos : Array of TWinControl ;
    xAcuLoc,xAcuExt,xMtoLoc: double;
   procedure BuscaNRecibo;
   procedure Suma;
   procedure ValidacionDatos                            ;
   procedure ValidacionTjaChq                           ;
//   procedure ValidacionCobradoTotal                     ;
   procedure GrabaDetalle                               ;
   PROCEDURE AcumulaDetFPago                            ;
   procedure Inserta                                    ;
   procedure CalculaResto ;
   procedure LLenaEdits                                 ;
   procedure ActivaBotones(pnl: TPanel;xFlag : Boolean);
  public
    { Public declarations }
  end;

var
  FReciboSoc: TFReciboSoc;

implementation
uses CAJAUTIL,CajaDM;
{$R *.DFM}


procedure TFReciboSoc.FormKeyPress(Sender: TObject; var Key: Char);
var
   xStr : String ;
begin
  if not aplicaKeyPress(self ,A2digitos , A4digitos) then  Exit ;
  if not( Key in [ '0'..'9' , '.' , #8 ]) then Key := #0 ;
  xStr := TCustomEdit(self.ActiveControl).text ;
  if key = '.' then
   if pos('.',xSTR) <> 0 then Key := #0 ;
end;

procedure TFReciboSoc.FormActivate(Sender: TObject);
var
 xFecha,xSql,xWhere : String;
begin
   xModifica := 'S';
   pnlBotones.enabled := False;
   pnlDetalle.ActivePageIndex := 0;
   pnlDetalle.Enabled := False;
   xFecha := formatdatetime('YYYY-MM-DD',Date());
   dm1.cdsMovSocRec.DisableControls;
   xSql := 'SELECT * FROM SOC310 WHERE FLAGCA='+quotedstr('C')+' and CCESTADO='+quotedstr('P')+
           ' and CCFEMIS=DATE('+quotedStr(xFecha)+')';
   dm1.cdsMovSocRec.Close;
   dm1.cdsMovSocRec.DataRequest(xSql);
   dm1.cdsMovSocRec.Open;
   dm1.cdsMovSocRec.Filter := 'CLIEID='+quotedstr('PP');
   dm1.cdsMovSocRec.Filtered := True;
   dm1.cdsMovSocRec.FieldByName('CCSERIE').ReadOnly := True;
   dm1.cdsMovSocRec.FieldByName('CCNODOC').ReadOnly := True;
   dm1.cdsMovSocRec.FieldByName('CCANOMES').ReadOnly := True;
   dm1.cdsMovSocRec.FieldByName('CCFEMIS').ReadOnly := True;
   dm1.cdsMovSocRec.FieldByName('CCFVCMTO').ReadOnly := True;
   dm1.cdsMovSocRec.FieldByName('TMONID').ReadOnly := True;
   dm1.cdsMovSocRec.FieldByName('CCTCAMPR').ReadOnly := True;
   dm1.cdsMovSocRec.FieldByName('CCMTOORI').ReadOnly := True;
   dm1.cdsMovSocRec.FieldByName('CCMTOLOC').ReadOnly := True;
   dm1.cdsMovSocRec.FieldByName('CCMTOEXT').ReadOnly := True;
   dm1.cdsMovSocRec.EnableControls;
   DM1.cdsSocDocPag.Open;
   DM1.cdsSocDocPag.Filter := 'CLIEID='+quotedstr('PP');
   DM1.cdsSocDocPag.Filtered := True;

   xSQL:='Select * from CAJA314 '
        +'Where CIAID='''' and CCTREC='''' and '
        +      'DOCID='''' and CCSERIE='''' and '
        +      'CCNODOC='''' ';
   DM1.cdsDetFPago.Close;
   DM1.cdsDetFPago.DataRequest( xSQL );
   DM1.cdsDetFPago.Open;


   dblcCia.TEXT := dm1.cdsSocRec.FieldByName('CIAID').AsString;
   dblcCia.OnExit(dblcCia);
   If DM1.cdsTDoc.RecordCount = 1 then
    begin
     dblcTDoc.TEXT := dm1.cdsTDoc.FieldByName('DOCID').AsString;
     dblcTDoc.OnExit(dblcTDoc);
     dblcTDoc.Enabled := False;
    end
   else
    begin
     dblcTDoc.Enabled := True;
     dblcTDoc.SetFocus;
    end;
  BuscaNRecibo;
  dbdtpFEmision.date := dateS;
  dbdtpFEmision.OnExit(dbdtpFEmision);
  dblcTMonCab.TEXT  :=  DM1.cdsSocRec.FieldByName('TMONID').AsString;
  dblcTMonCab.OnExit(dblcTMonCab);
//  xWhere := 'CLAUXID='+quotedstr(DM1.cdsSocRec.FieldByName('CLAUXID').AsString);
//  edtClase.text := DM1.cdsSocRec.FieldByName('CLAUXID').AsString + ' - '+dm1.DisplayDescrip('prvTGE','TGE102','CLAUXDES',xWhere,'CLAUXDES') ;
  xWhere := 'AUXID='+quotedstr(DM1.cdsSocRec.FieldByName('CLIEID').AsString);
  dbeGiradoA.text := DM1.cdsSocRec.FieldByName('CLIEID').AsString + ' - '+dm1.DisplayDescrip('prvTGE','CNT201','AUXNOMB',xWhere,'AUXNOMB') ;
  edtAuxRuc.text := DM1.cdsSocRec.FieldByName('CLIERUC').AsString;
  dbeSerie.text := DM1.cdsSocRec.FieldByName('CCSERIE').AsString;
  dblcBanco.TEXT := DM1.cdsSocRec.FieldByName('BANCOID').AsString;

  xWhere := 'BANCOID='+quotedstr(dblcBanco.text);
  edtBanco.text := DM1.DisplayDescrip('prvTGE','TGE105','BANCONOM',xwhere,'BANCONOM');
  edtCuenta.Text:= DM1.cdsSocRec.FieldByName('CTACAJA').AsString;
  dblcdCnp.Text :=  DM1.cdsSocRec.FieldByName('CPTOCAJA').AsString;
  xwhere        := 'CPTOID='+quotedstr(dblcdCnp.text);
  dbeGlosa.text:= DM1.DisplayDescrip('prvTGE','CAJA201','CPTODES',xwhere,'CPTODES');
  dblcTDiario.Text := DM1.cdsSocRec.FieldByName('TDIARID').AsString;
end;

procedure TFReciboSoc.dblcCiaExit(Sender: TObject);
var
 xDescrip : String;
begin
   xDescrip := 'CIAID='+quotedstr(dblcCia.Text);
   edtCia.text := DM1.DisplayDescrip('prvTGE','TGE101','CIAABR',xDescrip,'CIAABR');
end;

procedure TFReciboSoc.dblcTDocExit(Sender: TObject);
var
 xDescrip : String;
begin
   xDescrip := 'DOCID='+quotedstr(dblcTDoc.text);
   edtTDoc.text := DM1.DisplayDescrip('prvTGE','TGE110','DOCDES',xDescrip,'DOCDES');
end;

procedure TFReciboSoc.dblcBancoExit(Sender: TObject);
//var
// xDescrip : String;
begin
{  if DiaAperturado(dbdtpFEmision.Date,dblcBanco.text) then
   begin
    xDescrip := 'BANCOID='+quotedstr(dblcBanco.text);
    edtBanco.text := DM1.DisplayDescrip('prvTGE','TGE105','BANCONOM',xDescrip,'BANCONOM');
    edtCuenta.Text:=DM1.cdsbancoegr.FieldByName('CUENTAID').AsString; //Se toma de la tabla Bancos
    dblcdCnp.Text:= dm1.cdsbancoegr.FieldByName('CPTOID').AsString ;
    xDescrip     := 'CPTOID='+quotedstr(dblcdCnp.text);
    dbeGlosa.text:= DM1.DisplayDescrip('prvTGE','CAJA201','CPTODES',xDescrip,'CPTODES');
    dblcTDiario.Text := DM1.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco.text),'CCBCOVOUCH');
   end;
}
end;

procedure TFReciboSoc.dblcTMonCabExit(Sender: TObject);
var
 xDescrip : String;
begin
  xDescrip := 'TMONID='+quotedstr(dblcTMonCab.text);
  edtTMonCab.text := DM1.DisplayDescrip('prvTGE','TGE103','TMONABR',xDescrip,'TMONABR');
end;

procedure TFReciboSoc.dbdtpFEmisionExit(Sender: TObject);
var
 xStr : STring;
begin
  	  xSTR:= 'FECHA = ' +DM1.wRepFuncDate + '''' + formatdatetime(DM1.wFormatFecha,dbdtpFEmision.date)+''') '
           + ' AND TMONID='''+dm1.wTMonExt+'''';
      if dm1.RecuperarDatos('TGE107',DM1.wTipoCambioUsar,xSTR) then
         dbeTCambio.Text :=  dm1.cdsRec.fieldbyname(DM1.wTipoCambioUsar).AsString
      else
      dbeTCambio.Text := '0.00' ;
     decodedate(dbdtpFEmision.date,xAnio,xMes,xDia);
     xPeriodo := FloatToStr(xAnio)+dm1.strzero(FloatToStr(xMes),2);
     meAnoMM.Text := xPeriodo;
//     xTAutoNum   := DM1.DisplayDescrip('TGE104','AUTONUM','TDIARID',dblcTDiario.Text);
     meNoReg.Text:= dbeNoDoc.text;
//     meNoReg.Text:= DM1.UltimoRegistroCXP(xTAutoNum,dblcCia.Text,dblcTDiario.Text,xTAno,xTMes );
//     meNoReg.Text:= Strzero(meNoReg.Text, DM1.cdsMovCxP.fieldbyname('CPNOREG').Size );

end;


procedure TFReciboSoc.Z2bbtnOKCabClick(Sender: TObject);
var
 xValida : String;
begin
    xValida := 'S';
    If dblcCia.value = '' then xValida := 'N';
    if dblcTDoc.value = '' then xValida := 'N';
    if dbdtpFEmision.Date = null then xValida := 'N';
    if dblcBanco.value = '' then xValida := 'N';
    if dblcTMonCab.value = '' then xValida := 'N';
    if (dbeTCambio.Text = '') OR (dbeTCambio.Text = '0.00') then xValida := 'N';
    if dblcdCnp.value = '' then xValida := 'N';
    If xValida = 'N' then
     begin
      Showmessage('Faltan Datos');
      exit;
     end;
   pnlCabecera1.Enabled := False;
   Z2bbtnSube.Enabled   := True;

   If xModifica = 'S' then
    begin
     dm1.cdsMovSocRec.Filter := 'CLIEID='+quotedstr(dm1.cdsSocRec.FieldByName('CLIEID').AsString)+' AND CCESTADO='+quotedstr('P')+
                               ' AND CCFCMPRB='+quotedstr(DateToStr(Date()));
     dm1.cdsMovSocRec.Filtered := True;
     If dm1.cdsMovSocRec.Recordcount = 0 then
      begin
       Showmessage('Socio no presenta recibos pendientes');
       exit;
      end;
    end;
   xModifica := 'N';
   DM1.cdsSocDocPag.Filter := 'CLIEID='+quotedstr(dm1.cdsSocRec.FieldByName('CLIEID').AsString)+' AND CCESTADO='+quotedstr('P');
   DM1.cdsSocDocPag.Filtered := True;
   pnlDetalle.Enabled := True;
   pnlBotones.enabled := True;
end;


procedure TFRecibosoc.BuscaNRecibo;
var
 ssql: string;
begin
 if DM1.cdsTDoc.fieldbyname('DOCRECCAJ').AsString = 'S' then
  begin
   ssql := '';
   ssql := 'SELECT substr('+DM1.wReplacCeros+'(SUBSTR(''000000'',1,6-LENGTH(RTRIM(CHAR(MAX(INTEGER(DENUMREG))+1))))'+
           ' ||(CHAR(MAX(INTEGER(DENUMREG))+1)),''000001''  ),1,6) AS RECIBO FROM CAJA301'+
           ' WHERE DOCID2='+quotedstr(trim(dblcTDoc.text))+' AND (DENUMREG <> '''' and DENUMREG IS NOT NULL)'+
           ' AND CIAID='+quotedstr(dblcCia.text);
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(ssql);
   DM1.cdsQry2.open;
   dbeNoDoc.Text :=  DM1.cdsQry2.fieldbyname('RECIBO').AsString; //xNumReg;
  end;
end;


procedure TFReciboSoc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dm1.cdsMovSocRec.DisableControls;
   dm1.cdsMovSocRec.FieldByName('CCSERIE').ReadOnly := True;
   dm1.cdsMovSocRec.FieldByName('CCNODOC').ReadOnly  := false;
   dm1.cdsMovSocRec.FieldByName('CCANOMES').ReadOnly := false;
   dm1.cdsMovSocRec.FieldByName('CCFEMIS').ReadOnly  := false;
   dm1.cdsMovSocRec.FieldByName('CCFVCMTO').ReadOnly  := false;
   dm1.cdsMovSocRec.FieldByName('TMONID').ReadOnly   := false;
   dm1.cdsMovSocRec.FieldByName('CCTCAMPR').ReadOnly := false;
   dm1.cdsMovSocRec.FieldByName('CCMTOORI').ReadOnly := false;
   dm1.cdsMovSocRec.FieldByName('CCMTOLOC').ReadOnly := false;
   dm1.cdsMovSocRec.FieldByName('CCMTOEXT').ReadOnly := false;
   dm1.cdsMovSocRec.EnableControls;

   dm1.cdsSocDocPag.DisableControls;
   dm1.cdsSocDocPag.FieldByName('CCSERIE').ReadOnly   := false;
   dm1.cdsSocDocPag.FieldByName('CCNODOC').ReadOnly   := false;;
   dm1.cdsSocDocPag.FieldByName('CCTCAMCJE').ReadOnly := false;;
   dm1.cdsSocDocPag.FieldByName('CCMTOORI').ReadOnly  := false;;
   dm1.cdsSocDocPag.FieldByName('CCMTOLOC').ReadOnly  := false;;
   dm1.cdsSocDocPag.FieldByName('CCMTOEXT').ReadOnly  := false;;
   dm1.cdsSocDocPag.FieldByName('CCSALLOC').ReadOnly  := false;;
   dm1.cdsSocDocPag.FieldByName('CCSALEXT').ReadOnly  := false;;
   dm1.cdsSocDocPag.EnableControls;

   dm1.cdsSocDocPag.Filter := '';
   dm1.cdsSocDocPag.Filtered := False;
   dm1.cdsSocDocPag.Cancelupdates;

   dm1.cdsMovSocRec.Filter := '';
   dm1.cdsMovSocRec.Filtered := False;
   dm1.cdsMovSocRec.Cancelupdates;

   dbgDocCanje.ReadOnly := False;
   dbgPendientes.ReadOnly := False;
   dbgDetFPago.ReadOnly := False;

end;

procedure TFReciboSoc.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFReciboSoc.dbgPendientesEndDrag(Sender, Target: TObject; X,
  Y: Integer);
var
  I: integer;
begin
  with DM1 do
   begin
     if Target = dbgDocCanje then
      begin
        cdsMovSocRec.DisableControls;
        cdsSocDocPag.DisableControls;
        for i:= 0 to dbgPendientes.SelectedList.Count-1 do
         begin
          dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);
          if not cdsSocDocPag.Locate('CIAID;CJEDOCID;CJESERIE;CJENODOC;TDIARID;CCANOMM;CCNOREG' ,
                   VarArrayOf([DM1.cdsMovSocRec.fieldbyname('CIAID').AsString,dblcTDoc.text ,
                              trim(dbeSerie.text) ,
                              trim(dbeNoDoc.Text) ,
                              DM1.cdsMovSocRec.fieldbyname('TDIARID').AsString,
                              DM1.cdsMovSocRec.fieldbyname('CCANOMES').AsString,
                              DM1.cdsMovSocRec.fieldbyname('CCNOREG').AsString
                              ]),[]) then
             begin
                cdsSocDocPag.Insert ;
                cdsSocDocPag.fieldbyname('CIAID').Value    := cdsMovSocRec.fieldbyname('CIAID').AsString    ;
                cdsSocDocPag.fieldbyname('TDIARID').Value  := cdsMovSocRec.fieldbyname('TDIARID').AsString  ;
                cdsSocDocPag.fieldbyname('CCNOREG').Value  := cdsMovSocRec.fieldbyname('CCNOREG').AsString ;
                cdsSocDocPag.fieldbyname('CCAAAA').Value   := cdsMovSocRec.fieldbyname('CCAAAA').AsString   ;
                cdsSocDocPag.fieldbyname('CCMM').Value   := cdsMovSocRec.fieldbyname('CCMM').AsString   ;
                cdsSocDocPag.fieldbyname('CCDD').Value   := cdsMovSocRec.fieldbyname('CCDD').AsString   ;
                cdsSocDocPag.fieldbyname('CCTRI').Value   := cdsMovSocRec.fieldbyname('CCTRI').AsString   ;
                cdsSocDocPag.fieldbyname('CCSEM').Value   := cdsMovSocRec.fieldbyname('CCSEM').AsString   ;
                cdsSocDocPag.fieldbyname('CCSS').Value   := cdsMovSocRec.fieldbyname('CCSS').AsString   ;
                cdsSocDocPag.fieldbyname('CCAATRI').Value   := cdsMovSocRec.fieldbyname('CCAATRI').AsString   ;
                cdsSocDocPag.fieldbyname('CCAASEM').Value   := cdsMovSocRec.fieldbyname('CCAASEM').AsString   ;
                cdsSocDocPag.fieldbyname('CCAASS').Value   := cdsMovSocRec.fieldbyname('CCAASS').AsString   ;
                cdsSocDocPag.fieldbyname('CCANOMM').Value  := cdsMovSocRec.fieldbyname('CCANOMES').AsString ;
                cdsSocDocPag.fieldbyname('CLAUXID').Value  := cdsMovSocRec.fieldbyname('CLAUXID').AsString  ;
                cdsSocDocPag.fieldbyname('CLIEID').Value   := cdsMovSocRec.fieldbyname('CLIEID').AsString  ;
                cdsSocDocPag.fieldbyname('CLIERUC').Value  := cdsMovSocRec.fieldbyname('CLIERUC').AsString;
                cdsSocDocPag.fieldbyname('DOCID').Value    := cdsMovSocRec.fieldbyname('DOCID').AsString;
                cdsSocDocPag.fieldbyname('CCSERIE').Value  := cdsMovSocRec.fieldbyname('CCSERIE').AsString;
                cdsSocDocPag.fieldbyname('CCNODOC').Value  := cdsMovSocRec.fieldbyname('CCNODOC').AsString;
                cdsSocDocPag.fieldbyname('TCANJEID').Value := 'RC';  // Recibo de Caja
                cdsSocDocPag.fieldbyname('CJEDOCID').AsString :=  dblcTDoc.text          ;
                cdsSocDocPag.fieldbyname('CJESERIE').AsString :=  dbeSerie.Text          ;
                cdsSocDocPag.fieldbyname('CJENODOC').AsString :=  dbeNoDoc.Text          ;
                cdsSocDocPag.fieldbyname('CCFCANJE').AsDateTime:= cdsMovSocRec.fieldbyname('CCFCMPRB').AsDateTime;
                cdsSocDocPag.fieldbyname('TMONID').Value      := cdsMovSocRec.fieldbyname('TMONID').AsString;
                cdsSocDocPag.fieldbyname('CCTCAMCJE').Value:= FRound(strtofloat(dbeTCambio.Text),8,3) ;
                cdsSocDocPag.fieldbyname('CCMTOORI').Value := FRound(cdsMovSocRec.fieldbyname('CCMTOORI').AsFloat,15,2)  ;
                cdsSocDocPag.fieldbyname('CCSALORI').Value := FRound(cdsMovSocRec.fieldbyname('CCMTOORI').AsFloat,15,2)  ;
                cdsSocDocPag.fieldbyname('CCMTOLOC').Value := FRound(cdsMovSocRec.fieldbyname('CCMTOLOC').AsFloat,15,2);
                cdsSocDocPag.fieldbyname('CCSALLOC').Value := FRound(cdsMovSocRec.fieldbyname('CCMTOLOC').AsFloat,15,2);
                cdsSocDocPag.fieldbyname('CCMTOEXT').Value := FRound(cdsMovSocRec.fieldbyname('CCMTOEXT').AsFloat,15,2);
                cdsSocDocPag.fieldbyname('CCSALEXT').Value := FRound(cdsMovSocRec.fieldbyname('CCMTOEXT').AsFloat,15,2);
                cdsSocDocPag.fieldbyname('CJEANTMN').Value := 0 ;
                cdsSocDocPag.fieldbyname('CJEANTME').Value := 0 ;
                cdsSocDocPag.fieldbyname('CCTCAMDOC').AsFloat := FRound(cdsMovSocRec.fieldbyname('CCTCAMPR').AsFloat,8,3);
                cdsSocDocPag.fieldbyname('CTATOTAL').AsString := edtCuenta.text;
                cdsSocDocPag.fieldbyname('CPTOTOT').AsString  := dblcdCnp.text;
                cdsSocDocPag.fieldbyname('CPTOID').AsString := dblcdCnp.text;
                cdsSocDocPag.fieldbyname('CUENTAID').AsString  := edtCuenta.text;
                cdsSocDocPag.fieldbyname('CCFVCMTO').AsDateTime := cdsMovSocRec.fieldbyname('CCFVCMTO').AsDateTime;
                cdsSocDocPag.fieldbyname('CCESTADO').AsString  := cdsMovSocRec.fieldbyname('CCESTADO').AsString;
                cdsSocDocPag.fieldbyname('CCUSER').AsString  := DM1.wUsuario;
                cdsSocDocPag.fieldbyname('CCFREG').AsDateTime  := dateS;
                cdsSocDocPag.fieldbyname('CCHREG').AsDateTime := time;

                cdsMovSocRec.Edit ;
//                cdsMovSocRec.fieldbyname('CTACAJA').AsString := edtCuenta.text;
//                cdsMovSocRec.fieldbyname('CPTOCAJA').AsString := dblcdCnp.text;
                cdsMovSocRec.fieldbyname('CCCMPRB').AsString := dbeNoDoc.text;
                cdsMovSocRec.fieldbyname('CTATOTAL').AsString := edtCuenta.text;
                cdsMovSocRec.fieldbyname('CCPTOTOT').AsString := dblcdCnp.text;
                cdsMovSocRec.fieldbyname('CCTCAMPA').AsString := dbeTCambio.text ;
                cdsMovSocRec.fieldbyname('CCESTADO').AsString := 'C' ;
                cdsMovSocRec.Post ;
             end ;
             dbgPendientes.datasource.dataset.Freebookmark(dbgPendientes.SelectedList.items[i]) ;
         end;
         dbgPendientes.SelectedList.clear ;  { Clear selected record list since they are all deleted}
         cdsSocDocPag.EnableControls ;
         cdsMovSocRec.EnableControls ;
         Suma;
      end;
   end;
end;

procedure TFReciboSoc.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgPendientes.BeginDrag(False);
end;

procedure TFReciboSoc.dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TFReciboSoc.dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocCanje.BeginDrag(False);
end;

procedure TFReciboSoc.dbgDocCanjeExit(Sender: TObject);
begin
   if dm1.cdsSocDocPag.state in [dsinsert,dsedit] then
      dm1.cdsSocDocPag.Post ;
end;

procedure TFReciboSoc.dbgDocCanjeCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
    if (AFieldName = 'CCMTOLOC') or (AFieldName = 'CCMTOEXT') then
    begin
       ABrush.Color := clNone;
    end;
end;

procedure TFReciboSoc.dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   If Target=dbgpendientes Then
   Begin
      With DM1 do
      Begin
         cdsMovSocRec.DisableControls ;
         cdsMovSocRec.Filtered:=False ;
         if cdsMovSocRec.Locate('CIAID;TDIARID;CCANOMES;CCNOREG' ,
                                    VarArrayOf([
                                                dm1.cdsSocDocPag.fieldbyname('CIAID').AsString ,
                                                dm1.cdsSocDocPag.fieldbyname('TDIARID').AsString ,
                                                dm1.cdsSocDocPag.fieldbyname('CCANOMM').AsString ,
                                                dm1.cdsSocDocPag.fieldbyname('CCNoReg').AsString
                                                ]),[]) then
         begin
            cdsMovSocRec.Edit ;
//            DM1.cdsMovSocRec.fieldbyname('CCSALEXT').Value := DM1.cdsMovSocRec.fieldbyname('CCMTOEXT').Value - dm1.numerononulo( DM1.cdsMovSocRec.FieldByName('CCPAGEXT') );
//            DM1.cdsMovSocRec.fieldbyname('CCSALLOC').Value := DM1.cdsMovSocRec.fieldbyname('CCMTOLOC').Value - dm1.numerononulo( DM1.cdsMovSocRec.FieldByName('CCPAGLOC') );
//            If DM1.cdsMovSocRec.fieldbyname('TMONID').Value=DM1.wTMonLoc then
//               DM1.cdsMovSocRec.fieldbyname('CCSALORI').AsFloat := DM1.cdsMovSocRec.fieldbyname('CCSALLOC').AsFloat
//            else
//               DM1.cdsMovSocRec.fieldbyname('CCSALORI').AsFloat := DM1.cdsMovSocRec.fieldbyname('CCSALEXT').AsFloat ;
//            Dm1.cdsMovSocRec.fieldbyname('CTACAJA').AsString := '';
//            Dm1.cdsMovSocRec.fieldbyname('CPTOCAJA').AsString := '';
            Dm1.cdsMovSocRec.fieldbyname('CCCMPRB').AsString := '';
            Dm1.cdsMovSocRec.fieldbyname('CTATOTAL').AsString := '';
            Dm1.cdsMovSocRec.fieldbyname('CCPTOTOT').AsString := '';
            Dm1.cdsMovSocRec.fieldbyname('CCTCAMPA').AsString := '';
            Dm1.cdsMovSocRec.fieldbyname('CCESTADO').Value := 'P' ;
            DM1.cdsMovSocRec.Post ;
            Dm1.cdsSocDocPag.Delete ;
         end;
         dm1.cdsMovSocRec.EnableControls ;
         dm1.cdsMovSocRec.Filtered:=True ;
         Suma;
      end;
   end ;
end;

procedure TFReciboSoc.Suma;
Var
   xMtoLoc : Double;
   xMtoExt : Double;
begin
  Dm1.cdsSocDocPag.DisableControls;

  xMtoLoc := 0;
  xMtoExt := 0;

  Dm1.cdsSocDocPag.First;
  While not Dm1.cdsSocDocPag.Eof do
  begin
     xMtoLoc:=xMtoLoc+ Dm1.cdsSocDocPag.fieldbyname('CCMTOLOC').AsFloat;
     xMtoExt:=xMtoExt+ Dm1.cdsSocDocPag.fieldbyname('CCMTOEXT').AsFloat;
     Dm1.cdsSocDocPag.Next;
  end;
  Dm1.cdsSocDocPag.First;
  dbgDocCanje.ColumnByName('CCMTOLOC').FooterValue:= floattostrf(xMtoLoc, ffNumber, 10, 2) ;
  dbgDocCanje.ColumnByName('CCMTOEXT').FooterValue:= floattostrf(xMtoExt, ffNumber, 10, 2) ;

  Dm1.cdsSocDocPag.EnableControls;
end;


procedure TFReciboSoc.pnlDetalleChange(Sender: TObject);
begin
   dbgDocCanje.ColumnByName('CCMTOLOC').FooterValue:=floattostrf(xMtoLoc, ffFixed, 10, 2);
   SUMA;
//   dbgDocCanje.ColumnByName('CCMTOLOC').FooterValue :=floattostrf( OperClientDataSet(DM1.cdsSocDocPag,'SUM(CCMTOLOC)', ''), ffFixed, 10, 2 );
//   dbgDocCanje.ColumnByName('CCMTOEXT').FooterValue :=floattostrf( OperClientDataSet(DM1.cdsSocDocPag,'SUM(CCMTOEXT)', ''), ffFixed, 10, 2 );
   dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue:=floattostrf( OperClientDataSet(DM1.cdsDetFPago,   'SUM(FC_MTOLOC)',''), ffFixed, 10, 2 );
   dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue:=floattostrf( OperClientDataSet(DM1.cdsDetFPago,   'SUM(FC_MTOEXT)',''), ffFixed, 10, 2 );
end;

procedure TFReciboSoc.BitBtn2Click(Sender: TObject);
begin
     if dm1.cdsDetFPago.State in [dsedit,dsinsert] then
     begin
         if MessageDlg(' Añadir Cancelará los Cambios Actuales'+ #13 +
                       '     ¿ Desea Continuar ?     ',mtConfirmation,[mbYes, mbNo],0) = mrNo then
            exit ;
     end ;
     dm1.cdsDetFPago.Cancel ;
     BlanqueaEdits(pnlFPago) ;
     Inserta ;
end;

procedure TFReciboSoc.Z2OkDetalleClick(Sender: TObject);
var
   xNuevo : Boolean ;
begin
   ValidacionDatos ;
   ValidacionTjaChq ;
//   ValidacionCobradoTotal ;
   if dm1.cdsDetFPago.state = dsinsert then
      xNuevo := true
   else
      xNuevo := false ;
   GrabaDetalle ;
   AcumulaDetFPago ;
   if xNuevo then
   begin
     BlanqueaEdits(pnlFPago) ;
     Inserta ;
   end
   else
   begin
     pnlFPago.SetFocus            ;
     pnlFPago.Visible := False    ;
     pnlDetalle.Enabled   := True ;
     pnlBotones.Enabled   := True ;
   end;
end;

procedure TFReciboSoc.ValidacionDatos;
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
end;

procedure TFReciboSoc.ValidacionTjaChq;
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
end;

{
procedure TFReciboSoc.ValidacionCobradoTotal;
begin
   if chkAsignaResto.Checked then
      Exit ;
end;
}

procedure TFReciboSoc.GrabaDetalle;
var
    xMonLoc , xMtoExt : Double ;
begin
    with dm1.cdsDetFPago do
    begin
        dm1.cdsDetFPago.FieldByName('CIAID').AsString          := dblcCia.text ;    
        dm1.cdsDetFPago.FieldByName('FPAGOID').AsString        := dblcFormPago.text ;
        dm1.cdsDetFPago.FieldByName('BANCOID').AsString        := dblcBancoFPago.text ;
        dm1.cdsDetFPago.FieldByName('TJAID').AsString          := dblcTarjeta.text ;
        dm1.cdsDetFPago.FieldByName('TMONID').AsString         := dblcTMOnC.Text ;
        dm1.cdsDetFPago.FieldByName('ECNOCHQ').AsString        := TRIM(dbeNOChq.Text) ;
        dm1.cdsDetFPago.FieldByName('FC_RECIBIDO').AsString    := dbeRecibido.text ;
        dm1.cdsDetFPago.FieldByName('TC_USADO').AsString       := dbeTCambio.Text ;
        dm1.cdsDetFPago.FieldByName('FC_COBRADO').AsString     := FieldByName('FC_RECIBIDO').AsString ;
        dm1.cdsDetFPago.FieldByName('FC_DEVOLVER').AsString    := '0.00' ;
        dm1.cdsDetFPago.FieldByName('CPTOID').AsString         := trim(dblcdCnp.Text) ;
        dm1.cdsDetFPago.FieldByName('CCTREC').AsString          := 'RC';
        dm1.cdsDetFPago.FieldByName('DOCID').AsString          := dblcTDoc.Value;
        dm1.cdsDetFPago.FieldByName('CCSERIE').AsString        := 'CTZ';
        dm1.cdsDetFPago.FieldByName('CCNODOC').AsString        := dbeNoDoc.text;
        dm1.cdsDetFPago.FieldByName('FC_ESTADO').AsString      := 'C';
        dm1.cdsDetFPago.FieldByName('ECANOMM').AsString        := meAnoMM.text;
        dm1.cdsDetFPago.FieldByName('ECNOCOMP').AsString       := meNoReg.text;
        dm1.cdsDetFPago.FieldByName('TDIARID').AsString        := dblcTDiario.Value;

        //Calcular y grabar equivalentes
        if dblctmonc.Text = dm1.wTMonLoc then
        begin
           xMonLoc := dm1.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat ;
           xMtoExt := Redondea(dm1.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat /dm1.cdsDetFPago.FieldByName('TC_USADO').AsFloat );
        end
        else
        begin
           xMonLoc := dm1.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat * dm1.cdsDetFPago.FieldByName('TC_USADO').AsFloat ;
           xMtoExt := dm1.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat ;
        end ;
        dm1.cdsDetFPago.FieldByName('FC_MTOLOC').AsFloat  := dm1.FRound(xMonLoc,15,3);// Redondea( xMonLoc ) ;
        dm1.cdsDetFPago.FieldByName('FC_MTOEXT').AsFloat  := dm1.FRound(xMtoExt,15,3); //Redondea( xMtoExt ) ;
        Post ;
    end ;
end;

procedure TFReciboSoc.AcumulaDetFPago;
var
   xMtoLoc, xMtoExt : Double;
   xCountLoc, xCountExt      : Double;
   xMonedaBase               : String      ;
//   xUnaSolaMoneda            : Boolean ;
begin
   xMtoLoc   :=  OperClientDataSet(dm1.cdsDetFPago , 'SUM(FC_MTOLOC)','') ;
   xMtoExt   :=  OperClientDataSet(dm1.cdsDetFPago , 'SUM(FC_MTOEXT)','') ;
   xAcuLoc   := xMtoloc;
   xAcuExt   := xMtoExt;

   dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue  := cajadec(FloatToStrF(xMtoLoc,ffFixed,10,2) ) ;
   dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue  := cajadec(FloatToStrF(xMtoExt,ffFixed,10,2)) ;

   xCountLoc :=  OperClientDataSet(dm1.cdsDetFPago , 'COUNT(*)','TMONID=''' + dm1.wTMonLoc + '''') ;
   xCountExt :=  OperClientDataSet(dm1.cdsDetFPago , 'COUNT(*)','TMONID=''' + dm1.wTMonExt + '''') ;
   if ((xCountLoc > 0) and (xCountExt=0)) or ((xCountLoc = 0) and (xCountExt > 0)) then
   begin
      xMonedaBase   := dm1.cdsDetFPago.fieldbyname('TMONID').AsString ;
//      xUnaSolaMoneda:= true ;
   end
   else
   begin
      xMonedaBase   := trim( dblcTMonCab.Text ) ;
//      xUnaSolaMoneda:= False ;
   end;
end;


procedure TFReciboSoc.Inserta;
begin
  with dm1.cdsDetFPago do
  begin
    Insert ;
    FieldByName('CORRE').AsInteger := recno ;
    if recordcount = 0 then

      if dm1.wTMonLoc = trim(dblcTMonCab.Text) then
         dbeRecibido.Text := dbgDocCanje.columnbyname('CCMTOLOC').FooterValue
      else
         dbeRecibido.Text := dbgDocCanje.columnbyname('CCMTOORI').FooterValue ;

    dblcTMonC.text       := dblcTMonCab.Text ;
    edtTMonC.Text        := edtTMonCab.Text ;
    dbeRecibido.Enabled  := True ;
    dbeACobrar.Enabled   := False ;
    CalculaResto ;
    If StrToFloat(dbeResta.text) <= 0 then
     BitBtn1.onclick(BitBtn1)
    else
     dblcFormPago.SetFocus ;
  end ;

end ;


procedure TFReciboSoc.CalculaResto;
var
    xCampo1  ,
    xCampo2,xMonto0  : string              ;
    xMonto1,xMonto2 : Double;
begin
   if dm1.cdsDetFPago.State = dsedit then
    begin
     if dblcTMonC.Text = dm1.wTMonLoc then
      begin
       xCampo1 := 'CCMTOLOC'  ;
       xCampo2 := 'FC_MTOLOC' ;
      end
     else
      begin
       xCampo1 := 'CCMTOEXT'  ;
       xCampo2 := 'FC_MTOEXT' ;
      end ;
     //** 06/03/2001 - pjsv, para que cuendo sea blanco no salga el error
     // que no es un dato numerico
     If dbgDetFPago.ColumnByName(xCampo2).FooterValue = '' then
       dbgDetFPago.ColumnByName(xCampo2).FooterValue := FloatToStrF(0.00,ffFixed,10,2);
        //**
     dbeResta.Text  := currtostr ( strtocurr( trim(dbgDocCanje.ColumnByName(xCampo1).FooterValue)) -
                          strtocurr( trim(dbgDetFPago.ColumnByName(xCampo2).FooterValue)) +
                          dm1.cdsdetfpago.fieldbyname('FC_RECIBIDO').asFloat )                   ;

    end
   else
    if dm1.cdsDetFPago.State = dsInsert then
      begin
       if dblcTMonC.Text = dm1.wTMonLoc then
        begin
          If dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue = '' then
            dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue := FloatToStrF(0.00,ffFixed,10,2);
          try
           xmonto1 := StrToFloat(dbgDocCanje.ColumnByName('CCMTOLOC').FooterValue);
           xMonto2 := StrToFloat(dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue);
           xMonto0 := FloatToStrF((xMonto1 - xMonto2),ffFixed,15,2);
           dbeResta.Text := xMonto0;
          except
             dbeResta.Text := FloatToStrF(StrToFloat(dbgDocCanje.ColumnByName('CCMTOLOC').FooterValue),ffFixed,15,2) ;
          end ;
        end
       else
        begin
         If dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue = '' then
          dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue := FloatToStrF(0.00,ffFixed,10,2);
         try
          xmonto1 := StrToFloat(dbgDocCanje.ColumnByName('CCMTOEXT').FooterValue);
          xMonto2 := StrToFloat(dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue);
          xMonto0 := FloatToStrF((xMonto1 - xMonto2),ffFixed,15,2);
          dbeResta.Text := xMonto0;
         except
          dbeResta.Text := FloatToStrF(StrToFloat(dbgDocCanje.ColumnByName('CCMTOEXT').FooterValue),ffFixed,15,2) ;
         end ;
        end ;
      end ;
end ;

procedure TFReciboSoc.Z2bbtnAdicFPagoClick(Sender: TObject);
begin
    pnlDetalle.Enabled  := False ;
    pnlBotones.Enabled  := False ;
    PnlFPago.BringToFront ;
    BlanqueaEdits(pnlFPago) ;
    PnlFPago.Visible:= True ;
    PnlFpago.setfocus ;
    perform(CM_DialogKey,VK_TAB,0) ;
    Inserta                   ;
end;

procedure TFReciboSoc.BitBtn1Click(Sender: TObject);
begin
   dm1.cdsDetFPago.Cancel ;
   pnlFPago.SetFocus ;
   pnlFPago.Visible := False ;
   pnlDetalle.Enabled   := True;
   pnlBotones.Enabled   := True;
end;

procedure TFReciboSoc.dbgDetFPagoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
   xPosi : Integer ;
begin
   if (Z2bbtnAdicFPago.Enabled=True) and (key = VK_DELETE) and (ssCtrl in Shift) then
   begin
      if (dm1.cdsDetFPago.RecordCount=0) then
          ShowMessage('No hay registros')
       else
       begin
          if MessageDlg('¿Eliminar Registro?',mtconfirmation,[mbYes,mbNo],0)=mrYes then
          begin
             xPosi := dm1.cdsDetFPago.RecNo      ;
             dm1.cdsDetFPago.Delete              ;    // Borro en el original..
             AcumulaDetFPago                     ;
             if dm1.cdsDetFPago.RecordCount <> 0 then
             begin
                dm1.cdsDetFPago.DisableControls  ;
                dm1.cdsDetFPago.First            ;
                while not dm1.cdsDetFPago.Eof do
                begin
                    DM1.cdsDetFPago.Edit         ;
                    dm1.cdsDetFPago.FieldByName('CORRE').AsInteger := dm1.cdsDetFPago.RecNo ;
                    DM1.cdsDetFPago.Post         ;
                    dm1.cdsDetFPago.Next         ;
                end;
                if xposi <= dm1.cdsDetFPago.RecordCount then
                   dm1.cdsDetFPago.recno := xPosi ;
                dm1.cdsDetFPago.EnableControls   ;
             end ;

         end;
      end;
   end;
end;

procedure TFReciboSoc.dbgDetFPagoDblClick(Sender: TObject);
begin
   if dbgDetFPago.DataSource.DataSet.RecordCount = 0 then
   begin
      MessageDlg('NO hay Registros por Editar', mtInformation,
      [mbOk], 0);
      exit;
   end;
   if DM1.cdsMovSocRec.fieldbyname('CCESTADO').Value = 'C' then
   begin
      ShowMessage('Este Documento Está Cancelado');
      exit ;
   end ;
   if DM1.cdsMovSocRec.fieldbyname('CCESTADO').Value = 'A' then
   begin
      ShowMessage('Este Documento Está Anulado');
      exit ;
   end ;
   pnlDetalle.Enabled  := False ;
   pnlBotones.Enabled  := False ;
   PnlFPago.BringToFront ;
   BlanqueaEdits(pnlFPago) ;
   PnlFPago.Visible:= True ;
   PnlFpago.setfocus ;
   perform(CM_DialogKey,VK_TAB,0) ;
   dm1.cdsDetFPago.Edit ;
   llenaedits ;
end;


procedure TFReciboSoc.LLenaEdits;
begin
    with dm1.cdsDetFPago do
    begin
        dblcFormPago.text      := dm1.FieldNoNUlo(FieldByName('FPAGOID'))      ;
        dblcBancoFPago.text    := dm1.FieldNoNUlo(FieldByName('BANCOID'))      ;
        dblcTarjeta.text       := dm1.FieldNoNUlo(FieldByName('TJAID'))        ;
        dblcTMOnC.Text         := dm1.FieldNoNUlo(FieldByName('TMONID'))       ;
        dbeNOChq.Text          := dm1.FieldNoNUlo(FieldByName('ECNOCHQ'))      ;
        dbeRecibido.text       := dm1.FieldNoNUlo(FieldByName('FC_RECIBIDO'))  ;
        dbeaCobrar.text        := dm1.FieldNoNUlo(FieldByName('FC_COBRADO'))   ;
        CalculaResto ;
    end ;
    dbeRecibido.Enabled  := True  ;
    dbeACobrar.Enabled   := True  ;
    bitbtn2.Visible := False      ;
end ;


procedure TFReciboSoc.Z2bbtnSubeClick(Sender: TObject);
begin
   xModifica := 'N';
   pnlDetalle.Enabled    := False ;
   pnlBotones.Enabled    := False ;
   // ActivaBotones(pnlBotones , False ) ;
   pnlCabecera1.Enabled  := True ;
   ActivaBotones(pnlCabecera1,True) ;
end;

procedure TFReciboSoc.ActivaBotones(pnl: TPanel;xFlag : Boolean);
var
 i : Integer ;
begin
   for i := 0 to pnl.ControlCount-1 do
   begin
     if pnl.controls[i] is tbitbtn then
        TBitBtn(pnl.controls[i]).enabled := xFlag ;
   end;
end;

procedure TFReciboSoc.Z2bbtnGrabaClick(Sender: TObject);
var
 xMes,xAnyo,xSql : String;
begin
  if MessageDlg('¿Grabar?',mtConfirmation,[mbYes, mbNo], 0) = mrYes then
    begin
    if DiaAperturado(dblcCia.text,dbdtpFEmision.Date,dblcBanco.text) then
     begin
       //** actualiza soc310
       DM1.AplicaDatos(dm1.cdsMovSocRec, '' );
       //** actualiza soc304
       DM1.AplicaDatos(DM1.cdsSocDocPag, '' );
       //** actualiza caja314
       dm1.AplicaDatos(dm1.cdsDetFPago,'DETFPAGO');
       //** actualiza soc301
       xSql := 'SELECT * FROM SOC201 WHERE SOCID='+quotedstr(DM1.cdsSocRec.FieldByName('CLIEID').AsString);
       dm1.cdsQry2.close;
       dm1.cdsQry2.DataRequest(xSql);
       dm1.cdsQry2.open;
       dm1.cdsCaSocio.Open;
       dm1.cdsCaSocio.insert;
       dm1.cdsCaSocio.FieldByName('SOCID').AsString := DM1.cdsSocRec.FieldByName('CLIEID').AsString;
       dm1.cdsCaSocio.FieldByName('RECPER').AsString := meAnoMM.Text;
       dm1.cdsCaSocio.FieldByName('RECNRO').AsString := dbeNoDoc.TEXT;
       DM1.cdsCASocio.FieldByName('CONDID').asString   := DM1.cdsQry2.FieldByName('CONDID').asString;
       DM1.cdsCASocio.FieldByName('RECPERDOC').asString:=  meAnoMM.text; // dm1.cdsMovSocRec.FieldByName('CCANOMES').AsString;
       DM1.cdsCASocio.FieldByName('FECHA_MOV').AsDateTime:= DateS;
       DM1.cdsCASocio.FieldByName('RECVOUC').AsString:= dblcTDiario.Text;
       // POR AHORA
       DM1.cdsCASocio.FieldByName('RECVOL').AsString:= meNoReg.text;
       // POR AHORA
       DM1.cdsCASocio.FieldByName('CONCID').AsString := '01';
       DM1.cdsCASocio.FieldByName('RECCTACTE').asString:= DM1.cdsQry2.FieldByName('SOCCTACTE').asString;
       DM1.cdsCASocio.FieldByName('RECSALDO').asString:= dbeResta.TEXT;
       DM1.cdsCASocio.FieldByName('RECMONTO').asString:= dbgDocCanje.ColumnByName('CCMTOEXT').FooterValue; //dm1.cdsDetFPago.FieldByName('FC_COBRADO').AsString;
       DM1.cdsCASocio.FieldByName('RECTC').asString:= dbeTCambio.TEXT;
       DM1.cdsCASocio.FieldByName('RECMESPAG').asString:= meAnoMM.Text;
       DM1.cdsCASocio.FieldByName('COBID').AsString := '00';
       DM1.cdsCASocio.FieldByName('DH').asString:= 'H';
       DM1.cdsCASocio.FieldByName('FPROCESO').AsDateTime:= DATES;
       DM1.cdsCASocio.FieldByName('RECMTOLOC').AsFloat := xAcuLoc;
       DM1.cdsCASocio.FieldByName('RECMTOEXT').AsfLOAT := xAcuExt;
       xSql := 'COBID='+quotedstr('00');
       DM1.cdsCASocio.FieldByName('METID').asString    := dm1.DisplayDescrip('prvTGE','SOC108','METID',xSql,'METID');
       DM1.cdsCASocio.FieldByName('TMONID').AsString := dblcTMonCab.TEXT;
       DM1.cdsCASocio.FieldByName('RECFCOBR').AsDateTime:= DATES;
       DM1.cdsCASocio.Fieldbyname('USUREG').AsString  := DM1.wUsuario;
       DM1.cdsCASocio.fieldbyname('FECREG').AsDateTime  := dateS;
       DM1.cdsCASocio.fieldbyname('HORREG').AsDateTime := time;
       DM1.cdsCASocio.fieldbyname('RECFECREG').AsDateTime := dateS;
       DM1.AplicaDatos(DM1.cdsCASocio, '' );

       xMes := copy(meAnoMM.text, 5, 2);
       xAnyo:= copy(meAnoMM.text, 1, 4);

       //** actualiza soc201
       xSQL := 'UPDATE SOC201 SET '
              +'SLDSACTMN=SLDSACTMN'+ ' - ' +FloatToStr(xAcuLoc)+', '
              +'SLDSACT=SLDSACT'+ ' - ' +FloatToStr(xAcuExt)
              +' WHERE SOCID='+ quotedStr(DM1.cdsSocRec.FieldByName('CLIEID').AsString);
       DM1.DCOM1.AppServer.EjecutaSQL(xSQL);

       //** actualiza soc403
       xSQL := 'UPDATE SOC403 SET '
             + 'SLDMN' +xMes+ ' = SLDMN' +xMes+ ' - ' +FloatToStr(xAcuLoc)+', '
             + 'SLDME' +xMes+ ' = SLDME' +xMes+ ' - ' +FloatToStr(xAcuExt)
             +' WHERE SOCID = '+ quotedStr(DM1.cdsSocRec.FieldByName('CLIEID').AsString)
             +' AND SLDANO = '+ quotedStr(xAnyo);
       DM1.DCOM1.AppServer.EjecutaSQL(xSQL);

       ShowMessage('Grabacion OK')        ;
       Z2bbtnSube.Enabled    := False    ;
       Z2bbtnGraba.Enabled    := False    ;
       lblEstadoMov.Caption   := 'CANCELADO' ;
       dbgDocCanje.ReadOnly := True;
       dbgPendientes.ReadOnly := True;
       dbgDetFPago.ReadOnly := True;
     end;
   end ;
end;


procedure TFReciboSoc.dblcFormPagoExit(Sender: TObject);
begin
   xDescrip := 'FPAGOID='+quotedstr(dblcFormPago.text);
   edtFormPago.text := dm1.DisplayDescrip('prvTGE','TGE112','FPAGODES',xDescrip,'FPAGODES');
   if (trim(edtFormPago.text) <> '' ) then
   begin
      if dblcFormPago.text = dm1.wEFECTIVO then
      begin
           DesHabilitaControles([dblcBancofPago,dblcTarjeta,dbeNOChq]);
           dblcBancofPago.Text   := '';
           edtBcoFPago.text    := '';
           dblcTarjeta.text := '';
           edtTarjeta.text  := '';
           dbeNOChq.Text    := '';
      end
      else
        if dblcFormPago.text = dm1.wCHEQUE then
        begin
          cajautil.HabilitaControles ([dbeNOChq,dblcBancofPago]);
          dblcTarjeta.text := '';
          edtTarjeta.text  := '';
          dbeNOChq.Text    := '';
          dblcBancofPago.SetFocus;
        end
        else
          if dblcFormPago.text = dm1.wTARJETA then
          begin
            cajautil.HabilitaControles ([dbeNOChq,dblcBancofPago,dblcTarjeta]);
            dblcBancofPago.SetFocus;
          end;
   end;
end;

procedure TFReciboSoc.dblcBancoFPagoExit(Sender: TObject);
begin
   xDescrip := 'BANCOID='+quotedstr(dblcBancoFPago.text);
   edtBcoFPago.text := dm1.displaydescrip('prvTGE','TGE105','BANCONOM',xDescrip,'BANCONOM');
   If dblcBancofPago.text = '' then
   begin
     showmessage('Falta Banco');
     dblcBancofPago.SetFocus;
   end;

end;

procedure TFReciboSoc.dblcTarjetaExit(Sender: TObject);
begin
   xDescrip := 'TJAID='+quotedstr(dblcTarjeta.text);
   edtTarjeta.text := dm1.displaydescrip('prvTGE','TGE167','TJADES',xDescrip,'TJADES');
   If dblcTarjeta.text = '' then
    begin
     showmessage('Falta Tarjeta');
     dblcTarjeta.SetFocus;
    end;

end;

procedure TFReciboSoc.dblcTMonCExit(Sender: TObject);
begin
   xDescrip := 'TMONID='+quotedstr(dblcTMonC.text);
   edtTMonC.text := dm1.displaydescrip('prvTGE','TGE103','TMONABR',xDescrip,'TMONABR');
   If dblcTMonC.text = '' then
    begin
     showmessage('Falta Moneda');
     dblcTMonC.SetFocus;
    end;

   if self.ActiveControl <> TWinControl(Sender) then
   begin
      CalculaResto;
   end;

end;

procedure TFReciboSoc.dbeRecibidoChange(Sender: TObject);
begin
    dbeACobrar.Enabled := True ;
end;

procedure TFReciboSoc.dbeRecibidoEnter(Sender: TObject);
begin
   strTmp := dbeRecibido.Text ;
end;

procedure TFReciboSoc.dbeRecibidoExit(Sender: TObject);
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

   end ;

end;

procedure TFReciboSoc.dbeACobrarEnter(Sender: TObject);
begin
   strTmp := dbeACobrar.Text ;
end;

procedure TFReciboSoc.dbeACobrarExit(Sender: TObject);
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
         dbeACobrar.Text := dbeRecibido.Text ;
   end ;

end;

end.



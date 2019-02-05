unit Caja220;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, wwdbedit, StdCtrls, wwdblook, wwdbdatetimepicker, Buttons, ExtCtrls, db, dbtables,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe,
  ppBands, ppCtrls, ppPrnabl, ppVar, ppViewr, ppEndUsr, Spin, Wwdotdot, Variants,
  Wwdbcomb, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Printers, ppPrintr, ppTypes;

type
  TFCajaBancos = class(TForm)
    grbBCO: TGroupBox;
    Label10: TLabel;
    Label9: TLabel;
    dblcCtaCte: TwwDBLookupCombo;
    dbeCtaCte: TwwDBEdit;
    dblcBanco: TwwDBLookupCombo;
    dbeBanco: TwwDBEdit;
    grBFechas: TGroupBox;
    grbExpMon: TGroupBox;
    Panel3: TPanel;
    grBCIA: TGroupBox;
    Label11: TLabel;
    dblcCIA: TwwDBLookupCombo;
    dbeCIA: TwwDBEdit;
    Label1: TLabel;
    dbclMoneda: TwwDBLookupCombo;
    dbeMoneda: TwwDBEdit;
    Z2bbtnPrint: TBitBtn;
    Label2: TLabel;
    dbeMonCTACTE: TwwDBEdit;
    dbePeriodo: TwwDBLookupCombo;
    ppDesigner1: TppDesigner;
    dbpplEgrCaja: TppDBPipeline;
    ppLibCaja: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppSystemVariable7: TppSystemVariable;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    pplblCIA: TppLabel;
    pplblPeriodo: TppLabel;
    pplblBCO: TppLabel;
    ppLabel1: TppLabel;
    pplblCuenta: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel26: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel41: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText15: TppDBText;
    ppDBText17: TppDBText;
    ppDBText22: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppLine6: TppLine;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    pplblSaldoF: TppLabel;
    Label3: TLabel;
    procedure NotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure dbclMonedaChange(Sender: TObject);
    procedure ppLibCajaPreviewFormCreate(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure rbTbancosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcCtaCteExit(Sender: TObject);
    procedure dblcCIAExit(Sender: TObject);
    procedure dbePeriodoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sCIA,
    sBCO,
    sCTAB,
    sMON,
    sFiltro,
    sPFiltro,
    sCTABMON     : String;
    dFEI , dFEF  : TDateTime;
    TfSaldoAnt,
    fDebe, fSaldo : Double;

    procedure dcCIA                ;
    procedure dcBCO                ;
    procedure dcCTAB               ;
    function MonedaCTACTE : String ;
    function SaldoAnt : Double     ;
    procedure processDH            ;
    procedure ValidaComponente(Componente:TObject);
  public
    { Public declarations }
  end;

var
  FCajaBancos: TFCajaBancos;

implementation

uses CajaDM, CajaUtil;

{$R *.DFM}

procedure TFCajaBancos.NotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;


procedure TFCajaBancos.dcBCO;
begin
  DMTE.cdsBanco.First;
  sBCO := trim(DMTE.cdsBanco.FieldByName('BANCOID').AsString);
  dblcBanco.Text := sBCO;
  dblcBanco.Enabled := DMTE.cdsBanco.RecordCount > 1;
end;

procedure TFCajaBancos.dcCIA;
begin
  DMTE.cdsCIA.First;
  sCIA := trim(DMTE.cdsCIA.FieldByName('CIAID').AsString);
  dblcCIA.Text := sCIA;
  dblcCIA.Enabled := DMTE.cdsCIA.RecordCount > 1;
end;

procedure TFCajaBancos.dcCTAB;
begin
  DMTE.cdsCCBco.First;
  sCTAB := trim(DMTE.cdsCCBco.FieldByName('CCBCOID').AsString);
  dblcCtaCte.Text := sCTAB;
  dblcCtaCte.Enabled := DMTE.cdsCCBco.RecordCount > 1;
  if dblcCtaCte.Enabled then
    dblcCtaCte.Setfocus;
end;

procedure TFCajaBancos.z2bbtnOKCabClick(Sender: TObject);
var
  fsBCO, fsCIA, fsCTAB,
  sPeriodoAnt,sano,smes,sSQL : String;
  xSaldo,xsaldoIniMN,xSaldoIniME : Double;

  ADEvice,ADriver,APort : array [0..255] of Char;
  DeviceHandle : THandle;
  DevMode : PDeviceMode;
begin

   if dbclMoneda.Text='' then
   begin
      Application.MessageBox('Debe ingresar la expresión monetaria','Error',MB_OK+MB_ICONERROR);
      Exit;
   end;

	if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
    sSQL := 'SELECT CAJA.*, CIA.CIADES,BANK.BANCONOM,CTAE.CCBCODES,MON.TMONDES,'
           +' MON.TMONABR, CASE WHEN CAJA.EC_PROCE=''4'' OR CAJA.EC_PROCE=''7'' THEN ''TRASNFERENCIA'' ELSE FPA.FPAGODES END FPAGODES, '
           +' (CASE WHEN EC_IE= ''I'' THEN ECMTOORI END ) AS INGRESO,'
           +' (CASE WHEN EC_IE= ''E'' THEN ECMTOORI END ) AS EGRESO'
           +' FROM CAJA302  CAJA'
           +' LEFT JOIN TGE101 CIA ON(CIA.CIAID= CAJA.CIAID )'
           +' LEFT JOIN TGE105 BANK ON(BANK.BANCOID=CAJA.BANCOID)'
           +' LEFT JOIN TGE106 CTAE ON( CTAE.CIAID=CAJA.CIAID AND  CTAE.CCBCOID=CAJA.CCBCOID AND CTAE.BANCOID = CAJA.BANCOID  )'
           +' LEFT JOIN TGE103 MON ON(MON.TMONID=CAJA.TMONID)'
           +' LEFT JOIN TGE112 FPA ON (FPA.FPAGOID=CAJA.FPAGOID)'
           +' WHERE CAJA.CIAID='+QuotedStr(dblcCIA.text)+' AND CAJA.BANCOID='+QuotedStr(dblcBanco.TEXT)
           +' AND CAJA.CCBCOID='+QuotedStr(dblcCtaCte.text)+' AND CAJA.ECANOMM='+QuotedStr(dbePeriodo.text)
   else
   if DMTE.SRV_D = 'ORACLE' then
      sSQL := 'SELECT CAJA.*, CIA.CIADES,BANK.BANCONOM,CTAE.CCBCODES,'
             +' MON.TMONDES,MON.TMONABR,CASE WHEN CAJA.EC_PROCE=''4'' OR CAJA.EC_PROCE=''7'' THEN ''TRASNFERENCIA'' ELSE FPA.FPAGODES END FPAGODES, '
             +' DECODE(EC_IE, ''I'', ECMTOLOC) INGRESO,'
             +' DECODE(EC_IE, ''E'', ECMTOLOC) EGRESO'
{             +' DECODE(EC_IE, ''I'', ECMTOORI) INGRESO,'
             +' DECODE(EC_IE, ''E'', ECMTOORI) EGRESO'}

             +' FROM CAJA302 CAJA, TGE101 CIA, TGE105 BANK, TGE106 CTAE, TGE103 MON, TGE112 FPA'
             +' WHERE  CAJA.CIAID='+QuotedStr(dblcCIA.text)+' AND CAJA.BANCOID='+QuotedStr(dblcBanco.TEXT)
             +' AND CAJA.CCBCOID='+QuotedStr(dblcCtaCte.text)+' AND CAJA.ECANOMM='+QuotedStr(dbePeriodo.text)
             +' and CAJA.CIAID = CIA.CIAID(+)'
             +'  AND CAJA.BANCOID=BANK.BANCOID(+)'
             +'  AND CAJA.CIAID=CTAE.CIAID(+) AND CAJA.CCBCOID =CTAE.CCBCOID(+) AND CAJA.BANCOID=CTAE.BANCOID(+)'
             +'  AND CAJA.TMONID=MON.TMONID(+)'
             +'  AND CAJA.FPAGOID=FPA.FPAGOID(+) ';


  DMTE.cdsQRY.Close;
  DMTE.cdsQRY.DataRequest(sSQL);
  DMTE.cdsQRY.Open;
  DMTE.cdsQRY.IndexFieldNames := 'ECNOCOMP;ECFCOMP';

  sano:=copy(dbePeriodo.text,1,4);
  smes:=copy(dbePeriodo.text,5,2);
  if sMes='01' then
  begin
    sPeriodoAnt:=DMTE.StrZero(IntToStr(StrToInt(sano)-1),4)+'12';
  end
  else
  begin
    sPeriodoAnt:=sano+DMTE.StrZero(IntToStr(StrToInt(smes)-1),2);
  end;


  sSQL:=' SELECT SALDOFINMN,SALDOFINME FROM CAJA402 '+
        ' WHERE CIAID='+QuotedStr(dblcCIA.text)+' AND BANCOID='+QuotedStr(dblcBanco.TEXT)+
        ' AND CCBCOID='+QuotedStr(dblcCtaCte.text)+' AND ANOMM='+QuotedStr(sPeriodoAnt);


  DMTE.Cds1.Close;
  DMTE.cds1.DataRequest(ssql);
  DMTE.cds1.open;

  xsaldoIniMN:=DMTE.cds1.FieldByName('SALDOFINMN').asFloat;
  xSaldoIniME:=DMTE.cds1.FieldByName('SALDOFINME').asFloat;

  sSQL:=' SELECT ''                                 '' ECNOCOMP, '+
        DMTE.wRepFecServi+' ECFCOMP, ''                       '' FPAGODES, '+
        '''                         '' ECNOCHQ, ''                                            '' ECGIRA,'+
        '0.0000 INGRESO, 0.0000 EGRESO, 0.0000 SALDO FROM TGE901';

  DMTE.cdsSQL.Close;
  DMTE.cdsSQL.DataRequest(ssql);
  DMTE.cdsSQL.open;
  DMTE.cdsSQL.EmptyDataSet;

  //LLENAR EL SALDO INICIAL
  DMTE.cdsQry.First;
  DMTE.cdsSQL.Insert;
  DMTE.cdsSQL.FieldByName('ECNOCOMP').AsString := '';
  DMTE.cdsSQL.FieldByName('FPAGODES').AsString := 'SALDO INICIAL';
  if dbclMoneda.text=DMTE.wTMonLoc then
  begin
    DMTE.cdsSQL.FieldByName('SALDO').AsFloat := xsaldoIniMN;
    xSaldo:=xsaldoIniMN;
  end
  else
  begin
    DMTE.cdsSQL.FieldByName('SALDO').AsFloat := xsaldoIniME;
    xSaldo:=xsaldoIniME;
  end;


  DMTE.cdsQry.first;
  while not DMTE.cdsQry.Eof do
   begin
     DMTE.cdsSQL.Insert;
     DMTE.cdsSQL.FieldByName('ECNOCOMP').AsString :=DMTE.cdsQry.FieldByName('ECNOCOMP').AsString;
     DMTE.cdsSQL.FieldByName('FPAGODES').AsString :=DMTE.cdsQry.FieldByName('FPAGODES').AsString;
     DMTE.cdsSQL.FieldByName('ECFCOMP').AsDateTime:=DMTE.cdsQry.FieldByName('ECFCOMP').AsDateTime;
     DMTE.cdsSQL.FieldByName('ECNOCHQ').AsString  :=DMTE.cdsQry.FieldByName('ECNOCHQ').AsString;
     DMTE.cdsSQL.FieldByName('ECGIRA').AsString   :=DMTE.cdsQry.FieldByName('ECGIRA').AsString;
     if DMTE.cdsQry.FieldByName('EC_IE').AsString='I' then
     begin
       DMTE.cdsSQL.FieldByName('INGRESO').AsFloat :=DMTE.cdsQry.FieldByName('ECMTOORI').AsFloat;
     end;

     if DMTE.cdsQry.FieldByName('EC_IE').AsString='E' then
     begin
       DMTE.cdsSQL.FieldByName('EGRESO').AsFloat :=DMTE.cdsQry.FieldByName('ECMTOORI').AsFloat;
     end;
     xSaldo:=xSaldo+DMTE.cdsSQL.FieldByName('INGRESO').AsFloat-DMTE.cdsSQL.FieldByName('EGRESO').AsFloat;
     DMTE.cdsSQL.FieldByName('SALDO').AsFloat:=xSaldo;
     DMTE.cdsQry.next;
   End;
   DMTE.cdsSQL.IndexFieldNames := 'ECNOCOMP;ECFCOMP';

	 //JCC: 24/06/2002
	  ppLibCaja.TEMPLATE.FileName := wRutaRpt + '\LibroBanco.Rtm';
    ppLibCaja.template.LoadFromFile ;
    pplblCIA.Caption    := dbeCIA.text;
    pplblCuenta.caption := dblcCtaCte.text+'('+dbeCtaCte.text+')';
    pplblBco.caption    := dblcBanco.text+ ' '+dbeBanco.text;
    pplblPeriodo.caption:= DMTE.NombreAnoMes(dbePeriodo.text);
    pplblSaldoF.caption:=FloatToStrF(xSaldo,ffNumber,15,2);

   ////////////////////////////////////////////////////////
   ////////////////////////////////////////////////////////

   Printer.GetPrinter(ADevice,ADriver,APort,DeviceHandle);

   if DeviceHandle=0 then
   begin
      Printer.PrinterIndex := Printer.PrinterIndex;
      Printer.GetPrinter(ADevice,ADriver,APort,DeviceHandle);
      Printer.Canvas.Font.Name := 'Draft 12cpi';
   end;

   if DeviceHandle=0 then
      raise exception.Create('No se puede Inicilaizar TDevice Structure Mode')
   else
   begin
      DevMode:= GlobalLock(DeviceHandle);
      Try
         DevMode^.dmFields := DMRES_DRAFT;
      Finally
         GlobalUnlock(DeviceHandle);
      end;
   end;
   ////////////////////////////////////////////////////////
{   ppLibCaja.DeviceType := 'Printer';
    ppLibCaja.PrinterDevice.Canvas.Font.Name := 'Draft 12cpi';}
//    ppLibCaja.PrintDialog.Canvas.Font.Name := 'Draft 12cpi';
    ppLibCaja.Print;
//    ppLibCaja.PrinterSetup.OnGetPrinter(DeviceHandle)
//    ppLibCaja.PrinterDevice.Canvas.Font.Name := 'Draft 12cpi';




//    ppLibCaja.Printer.
    //ppDesigner1.Show;
end;

procedure TFCajaBancos.dbclMonedaChange(Sender: TObject);
begin
  sMON := dbclMoneda.Text;
  dbeMoneda.Text := DMTE.cdsTMon.FieldByName('TMONDES').AsString;
end;


function TFCajaBancos.MonedaCTACTE: String;
var
  bmk   : TBookMark;
begin
  bmk := DMTE.cdsTMon.GetBookmark;
  if DMTE.cdsTMon.Locate('TMONID',DMTE.cdsCCBco.FieldByName('TMONID').AsString,[]) then
  begin
{     result := DMTE.cdsTMon.FieldByName('TMONID').AsString +' - '+
               DMTE.cdsTMon.FieldByName('TMONDES').AsString+' - '+
               DMTE.cdsTMon.FieldByName('TMONABR').AsString;
 }
     result := DMTE.cdsTMon.FieldByName('TMONDES').AsString;

     sCTABMON := DMTE.cdsTMon.FieldByName('TMONDES').AsString;
  end
  else begin
     result := '';
     sCTABMON := '';
  end;
  DMTE.cdsTMon.FreeBookmark(bmk);
end;

procedure TFCajaBancos.ppLibCajaPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;
end;

function TFCajaBancos.SaldoAnt: Double;
var
  fcSaldo  : TDateTime;
  sfcSaldo : String;
begin
 result := 0;
// fcSaldo := dbdpFIni.Date - 1;  // un dia a la fecha
 sfcSaldo := FormatDateTime('dd/mm/yyyy',fcSaldo);
 if DMTE.cdsSaldoTlfnGrab.Locate('BANCOID;CCBCOID;STFECHA',
    VarArrayOf([sCIA,sCTAB,sfcSaldo]),[]) then
 result := DMTE.cdsSaldoTlfnGrab.FieldByName('STSALDOFIN').AsFloat;
end;

procedure TFCajaBancos.processDH;
begin
end;

procedure TFCajaBancos.dblcBancoExit(Sender: TObject);
begin
  ValidaComponente(Sender);
  if dblcBanco.text<>'' then
    dbeBanco.Text := DMTE.cdsBanco.FieldByName('BANCONOM').AsString;
  if dbeBanco.Text='' then
  begin
     DMTE.cdsCCBco.Filtered := False;
     dblcCtaCte.Enabled    := False;
     dbeBanco.Text := '';
     dblcCtaCte.Text := '';
     dbeCtaCte.Text := '';
     Exit;
  end;

  DMTE.cdsCCBco.Filtered := False;
  DMTE.cdsCCBco.Filter   := '';
  DMTE.cdsCCBco.Filter   := 'CIAID='''+dblcCia.text+''' and BANCOID='''+dblcBanco.Text+'''';
  DMTE.cdsCCBco.Filtered := True;

  dcCTAB;

end;

procedure TFCajaBancos.rbTbancosClick(Sender: TObject);
begin
//  if rbTbancos.checked=True then
  Begin
    grbBCO.Enabled:=False;
    grbExpMon.Enabled:=False;
  End;

end;

procedure TFCajaBancos.FormShow(Sender: TObject);
var
 xsql : string;
 a,m,d:word;
begin
  dbePeriodo.LookupTable:=DMTE.cdsRec;
  dbePeriodo.LookupField:='ANOMES';
  //** 02/04/2001 - pjsv
  xsql := 'SELECT * FROM TGE105 WHERE BCOTIPCTA='+quotedstr('B') + ' ORDER BY BANCOID';
  DMTE.cdsBanco.close;
  DMTE.cdsBanco.DataRequest(xsql);
  DMTE.cdsBanco.Open;
  //  DMTE.cdsBanco.IndexFieldNames := 'BANCOID';
  DMTE.cdsCCBco.Open;
  //  DMTE.cdsCCBco.IndexFieldNames := 'CCBCOID';

  DMTE.cdsSaldoTlfnGrab.Open;

  DMTE.cdsResponsable.Open;

  DMTE.cdsCia.Open;

  //agregado 20/06/2002
  // fin 20/06/2002

  sPFiltro := '(EC_PROCE = ''1'' OR EC_PROCE = ''2'' OR EC_PROCE = ''3'')'; /// AND (ECNOCHQ<>'''' AND NOT(ECNOCHQ IS NULL))'; // 12345  caja bancos

{  dcCIA;
  dcBCO;
  dcCTAB;}

  TfSaldoAnt := 0;
  fSaldo     := 0;
  fDebe      := 0;
  fSaldo     := 0;
//  dbeBanco.Text := DMTE.cdsBanco.FieldByName('BANCONOM').AsString;


end;

procedure TFCajaBancos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
   key:=#0;
   perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFCajaBancos.dblcCtaCteExit(Sender: TObject);
var
 xvartmoneda : String;
begin
  ValidaComponente(Sender);
  sCTAB := dblcCtaCte.Text;
  if sCTAB = '' then
  begin
   dbeCtaCte.Text := '';
   Exit;
  end;
  // buscar moneda y cargcar a una variable
  dbeMonCTACTE.Text := MonedaCTACTE;
  dbeCtaCte.Text := DMTE.cdsCCBco.FieldByName('CCBCODES').AsString;
  xvartmoneda:=DMTE.cdsCCBco.FieldByName('TMONID').AsString;
  dbclMoneda.Text:=xvartmoneda;
//  dblcExit(sender);

end;

procedure TFCajaBancos.dblcCIAExit(Sender: TObject);
begin
  ValidaComponente(Sender);
  if dblcCIA.text<>'' then
    dbeCIA.text:=DMTE.cdsCia.FieldByName('CIADES').AsString;
end;

procedure TFCajaBancos.ValidaComponente(Componente:TObject);
begin
   if ((Screen.ActiveControl).Parent.TabOrder+1)*10+((Screen.ActiveControl).TabOrder)< (((Componente as TWinControl).Parent.TabOrder+1)*10)+((Componente as TWinControl).TabOrder) then Exit;
   if (Componente as TCustomEdit).text = '' then

   if (Componente as TWinControl).enabled then
   begin
     (Componente as TWinControl).Setfocus;
      Raise Exception.Create('Ingrese '+(Componente as TWinControl).hint);
   end;
end;

procedure TFCajaBancos.dbePeriodoExit(Sender: TObject);
begin
  ValidaComponente(Sender);
end;

procedure TFCajaBancos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMTE.cdsQry.IndexFieldNames:='';
   DMTE.cdsSQL.IndexFieldNames:='';
   DMTE.cdsSQL.IndexFieldNames :='';
   DMTE.cdsSQL.Filter   :='';
   DMTE.cdsSQL.Filtered := False;
   DMTE.cdsSQL.Close;
   Action:=caFree;
end;

end.

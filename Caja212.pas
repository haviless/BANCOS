unit Caja212;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, wwdbedit, StdCtrls, wwdblook, Buttons, ExtCtrls, ppBands, ppRelatv,
  ppCache, ppClass, ppComm, ppProd, ppReport, ppPrnabl, ppCtrls, ppDB,
  ppDBPipe, ppVar, Db, Wwdatsrc, DBTables, Wwquery, ppEndUsr, ppViewr,CajaDM,
  Grids, Wwdbigrd, Wwdbgrid, ppTypes;

type
  TFRepLibros = class(TForm)
    pnlRegComp: TPanel;
    lblReporte: TLabel;
    z2bbtnOk: TBitBtn;
    z2bbtnBorra: TBitBtn;
    pnlDatos1: TPanel;
    lblCia: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dblcCaja: TwwDBLookupCombo;
    edtCaja: TEdit;
    dbePeriodo: TwwDBEdit;
    pprCaja: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppLabel1: TppLabel;
    ppdbCaja: TppDBPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    pplblCiaC: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    pplblDiarioC: TppLabel;
    pplblPeriodoC: TppLabel;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel8: TppLabel;
    pplblBenef: TppLabel;
    ppdbtBenef: TppDBText;
    ppDBText7: TppDBText;
    ppLabel12: TppLabel;
    ppdbcEgreso: TppDBCalc;
    ppdbcIngreso: TppDBCalc;
    ppLine2: TppLine;
    pplblTotales: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    pplblTotDif: TppLabel;
    procedure z2bbtnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcCajaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pprBancosPreviewFormCreate(Sender: TObject);
    procedure pprCajaPreviewFormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ppSummaryBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
    pprReporte : TppReport;
  public
    { Public declarations }
    procedure ConfiguraReporte(TipoDiario : Char);
  end;

var
  FRepLibros: TFRepLibros;

implementation

uses CajaUtil;

{$R *.DFM}

{ TFRepLibros }

procedure TFRepLibros.ConfiguraReporte(TipoDiario: Char);
begin
   LblReporte.Caption := 'Libro Caja';
   pprReporte := pprCaja;
end;

procedure TFRepLibros.z2bbtnOkClick(Sender: TObject);
var
   xSQL : string;
   xperiodo : string;
   xSaldo : Double;
   Year, Month, Day: Word ;
   xZ : Integer;
   xR : Integer;
begin
//** 01/06/2001 - pjsv
   //** hallo los montos de Ingreso
   xSQL:='SELECT ECNOCOMP, CCFEMIS, CCGLOSA,CCNOMB, '
        +  'ECCOBLOC AS INGRESO, 0.00 AS EGRESO'
        +' FROM CXC303 '
        +' Where CIAID='+ quotedstr(dblccia.Text)+'  AND ECANOMM='
        + quotedstr(dbePeriodo.Text)+ 'AND BANCOID='+quotedstr(dblcCaja.text)
        +' ORDER BY ecnocomp,CCFEMIS';

   xperiodo := copy(dbePeriodo.text,1,4) + dm1.StrZero(IntToStr(StrToInt(copy(dbePeriodo.text,5,2)) - 1),2);
   dm1.cdsQry.IndexFieldNames:='';
   dm1.cdsQry.Close;
   dm1.cdsQry.ProviderName:='prvCaja';
   dm1.cdsQry.DataRequest(xSQL);
   dm1.cdsQry.Open;
   //** se halla los total del periodo anterior de ingresos de caja
   xsql :=  'SELECT CIAID,ECANOMM,sum(ECCOBLOC) as INGRESO '
          +' FROM CXC303 '
          +' Where CIAID='+ quotedstr(dblccia.Text)+'  AND ECANOMM='
          + quotedstr(xPeriodo)+ 'AND BANCOID='+quotedstr(dblcCaja.text)
          +' GROUP BY CIAID,ECANOMM';
           dm1.cdsQry2.Close;
           dm1.cdsQry2.DataRequest(xsql);
           dm1.cdsQry2.open;

   //** hallo los monto de Egreso
   if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
     xSQL:='SELECT ECNOCOMP, ECFCOMP, ECGLOSA,ECGIRA, '
          +  '(CASE WHEN EC_IE =''I'' THEN ECMTOLOC END ) AS INGRESO, '
          +  '(CASE WHEN EC_IE =''E'' THEN ECMTOLOC END ) AS EGRESO'
          +' FROM CAJA302 '
          +' LEFT JOIN TGE105 ON (CAJA302.BANCOID=TGE105.BANCOID AND tge105.BCOTIPCTA=''C'' )'
          +' Where CAJA302.CIAID='+ quotedstr(dblccia.Text)+'  AND ECANOMM='
          + quotedstr(dbePeriodo.Text)+ 'AND CAJA302.BANCOID='+quotedstr(dblcCaja.text)
          +' ORDER BY ecnocomp,ECFCOMP'
   else
    if DM1.SRV_D = 'ORACLE' then
      xSQL:='SELECT ECNOCOMP, ECFCOMP, ECGLOSA,ECGIRA, '
         +  'DECODE(EC_IE , ''I'' , ECMTOLOC ) INGRESO, '
         +  'DECODE(EC_IE , ''E'' , ECMTOLOC ) EGRESO'
         +  ' FROM CAJA302, TGE105 '
         +  ' Where CAJA302.CIAID='+ quotedstr(dblccia.Text)
         +  ' AND ECANOMM=' + quotedstr(dbePeriodo.Text)+ 'AND CAJA302.BANCOID='+quotedstr(dblcCaja.text)
         +  ' AND CAJA302.BANCOID=TGE105.BANCOID(+) AND tge105.BCOTIPCTA(+) =''C'''
         +  ' ORDER BY ecnocomp,ECFCOMP';
   dm1.cdsRec.Close;
   dm1.cdsRec.DataRequest(xSQL);
   dm1.cdsRec.Open;

   xperiodo := copy(dbePeriodo.text,1,4) +dm1.StrZero(IntToStr(StrToInt(copy(dbePeriodo.text,5,2)) - 1),2);

   // se halla el total dem periodo anterior de egresos
   if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
    xsql :=  'SELECT CIAID,ECANOMM,'
            +'SUM((CASE EC_IE WHEN ''I'' THEN ECMTOLOC END )) AS INGRESO,'
            +'SUM((CASE EC_IE WHEN ''E'' THEN ECMTOLOC END )) AS EGRESO'
            +' FROM CAJA302  Where CAJA302.CIAID='+ quotedstr(dblccia.Text)+'  AND ECANOMM='+quotedstr(xperiodo)
            +' AND CAJA302.BANCOID='+quotedstr(dblcCaja.text)+' GROUP BY CIAID,ECANOMM'
   else
    if DM1.SRV_D = 'ORACLE' then
     xsql := 'SELECT CIAID,ECANOMM, '+
             ' SUM(DECODE(EC_IE,''I'',ECMTOLOC,''0'')) AS INGRESO, '+
             ' SUM(DECODE(EC_IE,''E'',ECMTOLOC,''0'')) AS EGRESO '+
             ' FROM CAJA302 ' +
             ' Where CAJA302.CIAID='+quotedstr(dblccia.Text)+'  AND ECANOMM='+quotedstr(xperiodo)+' AND '+
             ' CAJA302.BANCOID=' + quotedstr(dblcCaja.text) +
             ' GROUP BY CIAID,ECANOMM';

           dm1.Cds1.Close;
           dm1.cds1.DataRequest(xsql);
           dm1.cds1.open;


  if (dm1.cdsQry.RecordCount=0) and (dm1.cdsRec.recordcount=0) then
    begin
      ShowMessage('No Existen Comprobantes por Mostrar');
      exit;
    end;

   //** Tabla tonta
    xsql := 'SELECT ''          '' REGISTRO, ''  '' DIA,'
          +'''                    '' BENEFICIARIO,'
          +'''                    '' CONCEPTO,'
          +'0.00 ENTRADA,0.00 SALIDA, 0.00 SALDO'
          +' FROM TGE901';
          dm1.cdsSQL.Close;
          dm1.cdsSQL.DataRequest(xsql);
          dm1.cdsSQL.open;

   //** se borra el registro con los datos en blanco
  while not dm1.cdsSql.eof do
   dm1.cdsSql.Delete;


  //** se graba el saldo inicial de ingresos y egresos
  dm1.cdsQry2.First;
  dm1.cdsSQL.Insert;
  dm1.cdsSQL.FieldByName('ENTRADA').AsFloat := dm1.cdsQry2.FieldByName('INGRESO').AsFloat;
  dm1.cdsSQL.FieldByName('SALIDA').AsFloat := dm1.cds1.FieldByName('EGRESO').AsFloat;
  dm1.cdsSQL.FieldByName('SALDO').AsFloat := dm1.cdsQry2.FieldByName('INGRESO').AsFloat -
                                             dm1.cds1.FieldByName('EGRESO').AsFloat;
  xSaldo := dm1.cdsSQL.FieldByName('SALDO').AsFloat;
  dm1.cdsSQL.FieldByName('CONCEPTO').AsString := 'SALDO INICIAL';
  dm1.cdsSQL.post;


  //** hallo los saldos por dia cuendo es ingresos
  xR := 0;
  dm1.cdsQry.first;
  For xZ := 1 to 31 do
   begin
    repeat
       If not dm1.cdsQry.Eof then DecodeDate(StrToDate(dm1.cdsQry.FieldByName('CCFEMIS').AsString), Year, Month, Day)
       else day := 0;
       If dm1.StrZero(FloatToStr(day),2) = dm1.strZero(IntToStr(xZ),2) then
        begin
         dm1.cdsSQL.Insert;
         xR := xR + 1;
         dm1.cdsSQL.FieldByName('ENTRADA').AsFloat := dm1.cdsQry.FieldByName('INGRESO').AsFloat;
         dm1.cdsSQL.FieldByName('SALIDA').AsFloat := dm1.cdsQry.FieldByName('EGRESO').AsFloat;
         dm1.cdsSQL.FieldByName('SALDO').AsFloat := xSaldo + dm1.cdsQry.FieldByName('INGRESO').AsFloat -
                                                  dm1.cdsQry.FieldByName('EGRESO').AsFloat;
         dm1.cdsSQL.FieldByName('REGISTRO').AsString := dm1.StrZero(IntTostr(xR),3);
         dm1.cdsSQL.FieldByName('DIA').AsString := dm1.StrZero(FloatToStr(day),2);
         dm1.cdsSQL.FieldByName('BENEFICIARIO').AsString := dm1.cdsQry.FieldByName('CCNOMB').AsString;
         dm1.cdsSQL.FieldByName('CONCEPTO').AsString := dm1.cdsQry.FieldByName('CCGLOSA').AsString;
         xSaldo := dm1.cdsSQL.FieldByName('SALDO').AsFloat;
         dm1.cdsSQL.post;
         If not dm1.cdsQry.Eof then dm1.cdsQry.Next
         else day := 0;
        end;
    until dm1.StrZero(FloatToStr(day),2) <> dm1.strZero(IntToStr(xZ),2);

    //** hallo los saldos por dia cuendo es egresos
    dm1.cdsRec.first;
    repeat
       If not dm1.cdsRec.Eof then DecodeDate(StrToDate(dm1.cdsRec.FieldByName('ECFCOMP').AsString), Year, Month, Day)
       else day := 0;
       If dm1.StrZero(FloatToStr(day),2) = dm1.strZero(IntToStr(xZ),2) then
        begin
         dm1.cdsSQL.Insert;
         xR := xR + 1;
         dm1.cdsSQL.FieldByName('ENTRADA').AsFloat := dm1.cdsRec.FieldByName('INGRESO').AsFloat;
         dm1.cdsSQL.FieldByName('SALIDA').AsFloat := dm1.cdsRec.FieldByName('EGRESO').AsFloat;
         dm1.cdsSQL.FieldByName('SALDO').AsFloat := xSaldo + dm1.cdsRec.FieldByName('INGRESO').AsFloat -
                                                dm1.cdsRec.FieldByName('EGRESO').AsFloat;
         dm1.cdsSQL.FieldByName('REGISTRO').AsString := dm1.StrZero(IntTostr(xR),3);
         dm1.cdsSQL.FieldByName('DIA').AsString := dm1.StrZero(FloatToStr(day),2);
         dm1.cdsSQL.FieldByName('BENEFICIARIO').AsString := dm1.cdsRec.FieldByName('ECGIRA').AsString;
         dm1.cdsSQL.FieldByName('CONCEPTO').AsString := dm1.cdsRec.FieldByName('ECGLOSA').AsString;
         xSaldo := dm1.cdsSQL.FieldByName('SALDO').AsFloat;
         dm1.cdsSQL.post;
         dm1.cdsRec.Next;
        end;

    until dm1.StrZero(FloatToStr(day),2) <> dm1.strZero(IntToStr(xZ),2);
   end;

	 ppdbCaja.DataSource := DM1.dsSQL;
	 //JCC: 24/06/2002
	 pprReporte.TEMPLATE.FileName := wRutaRpt + '\LIbroCaja.rtm' ;
   pprReporte.template.LoadFromFile ;
   pplblciac.Caption := edtCia.Text ;
   pplbldiarioc.Caption :=  dm1.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcCaja.text),'CCBCOVOUCH'); //  edtTDiario.Text ;
   pplblperiodoc.Caption := dbePeriodo.Text;
   pprReporte.Print ;
end;

procedure TFRepLibros.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
   key:=#0;
   perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFRepLibros.dblcCiaExit(Sender: TObject);
begin
if edtCia.Text='' then
begin
    if dblcCia.Text='' then
      ShowMessage('Ingrese Compañía')
    else
     edtCia.Text := dm1.DisplayDescrip('prvTGE','TGE101','CIADES','CIAID='+quotedstr(dblcCia.Text),'CIADES');
end
end;

procedure TFRepLibros.dblcCajaExit(Sender: TObject);
begin
   If dblcCaja.text = '' then
    begin
     showmessage('Falta Caja');
     exit;
    end
   else
     edtCaja.Text := dm1.DisplayDescrip('prvTGE','TGE105','BANCONOM','BANCOID='+quotedstr(dblcCaja.text)+ ' AND BCOTIPCTA='+quotedstr('C'),'BANCONOM');
end;


procedure TFRepLibros.FormShow(Sender: TObject);
begin
    RecuperarCiaUnica(dblcCia,edtCia);
end;


procedure TFRepLibros.pprBancosPreviewFormCreate(Sender: TObject);
begin
   (SENDER AS TppReport).PreviewForm.WindowState:=WsMaximized;
   TppViewer((Sender as tppReport).PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
end;

procedure TFRepLibros.pprCajaPreviewFormCreate(Sender: TObject);
begin
   (SENDER AS TppReport).PreviewForm.WindowState:=WsMaximized;
   TppViewer((Sender as tppReport).PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
end;

procedure TFRepLibros.FormActivate(Sender: TObject);
begin
   dm1.cdsBanco.Filtered:=False;
   dm1.cdsBanco.close;
   dm1.cdsBanco.DataRequest('SELECT * FROM TGE105 WHERE BCOTIPCTA='+quotedstr('C'));
   dm1.cdsBanco.Open;
end;

procedure TFRepLibros.ppSummaryBand1BeforePrint(Sender: TObject);
begin
  pplblTotDif.Caption := FloatToStrF((ppdbcIngreso.value - ppdbcEgreso.value),ffFixed,15,2);
end;

end.

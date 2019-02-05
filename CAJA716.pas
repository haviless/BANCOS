unit CAJA716;

// Actualizaciones
// HPC_201403_CAJA cambia control de diseño de reporte

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, wwdbedit, wwdblook, Buttons, wwdbdatetimepicker,
  Wwdbdlg, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppTypes,
  ppBands, ppCtrls, ppVar, ppPrnabl, ppParameter, ppEndUsr, ppDBPipe, ppviewr,
   OleServer, ExcelXP,   variants, ComObj, db;


type
  TFConsCheques = class(TForm)
    pnl: TPanel;
    Z2bbtnPrint: TBitBtn;
    grbBCO: TGroupBox;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TwwDBEdit;
    gbCia: TGroupBox;
    dblcCIA: TwwDBLookupCombo;
    dbeCIA: TwwDBEdit;
    bbtnChqAnu: TBitBtn;
    gbFecha: TGroupBox;
    dtpDesde: TwwDBDateTimePicker;
    dtpHasta: TwwDBDateTimePicker;
    dblcCCBco: TwwDBLookupCombo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ppdbPagoProv: TppDBPipeline;
    pprPagoProv: TppReport;
    ppd1: TppDesigner;
    ppParameterList1: TppParameterList;
    ppTitleBand1: TppTitleBand;
    pplblCiaC: TppLabel;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLine2: TppLine;
    pplblDel: TppLabel;
    pplblAl: TppLabel;
    pplblFechaIni: TppLabel;
    pplblFechaFin: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    pplblTotalS: TppLabel;
    pplblTotalD: TppLabel;
    pplblTMontoS: TppLabel;
    pplblTMontoD: TppLabel;
    ppdbtFechaS: TppDBText;
    ppdbtGiradoS: TppDBText;
    ppdbtGlosaS: TppDBText;
    ppdbtChequeS: TppDBText;
    ppdbtMonedaS: TppDBText;
    ppdbtMontoS: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    bbtnCheques: TBitBtn;
    //ExtraOptions1: TExtraOptions;
    bbtnExcel: TBitBtn;
    cbDisenoRep: TCheckBox;
    sbDisenoRep: TSpeedButton;
    procedure bbtnChqAnuClick(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcCIAExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure pprPagoProvPreviewFormCreate(Sender: TObject);
    procedure Z2bbtnPrintClick(Sender: TObject);
    procedure bbtnChequesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnExcelClick(Sender: TObject);
    procedure dblcCIANotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }
    XLApp: Variant;

  public
    { Public declarations }
    procedure ExportarExcel;
  end;

var
  FConsCheques: TFConsCheques;

implementation

uses CajaDM, oaTE4000;

{$R *.DFM}

procedure TFConsCheques.bbtnChqAnuClick(Sender: TObject);
var
  xSQL, xFPago : String;
begin
   if Length(Trim(dblcCIA.text))=0 then
      raise exception.Create('Ingrese Compañia');

   if dtpDesde.Date=0 then
      raise exception.Create('Ingrese Fecha Inicial');

   if dtpHasta.Date=0 then
      raise exception.Create('Ingrese Fecha Final');


   if (dtpDesde.Date>dtpHasta.Date) then
      raise exception.Create('La Fecha Inicial no puede ser mayor a la Inicial');

   if Length(Trim(dblcBanco.text))=0 then
      raise exception.Create('Ingrese Banco');

   if Length(Trim(dblcCCBco.text))=0 then
      raise exception.Create('Ingrese Cuenta Corriente');

  xSQL:='Select FPAGOID from TGE112 '
        +'where (FCEGR=''1'' or FCEGR=''S'')'
        +' and (FCHQ=''1'' or FCHQ=''S'')';
	DMTE.cdsQry.Close;
	DMTE.cdsQry.Datarequest(xSQL);
	DMTE.cdsQry.open;

  xFPago:='';
	DMTE.cdsQry.open;
  while not DMTE.cdsQry.Eof do
  begin
     xFPago:=xFPago+''''+DMTE.cdsQry.FieldByName('FPAGOID').AsString+''', ';
     DMTE.cdsQry.Next;
  end;
  xFPago:=Copy(xFPago, 1, Length(xFPago)-2 );

  xSQL:='Select A.*, B.TMONDES, B.TMONABR, '
       + ''' Desde '+dtpDesde.Text+' Hasta '+dtpHasta.Text+''' RANGO, '
       + ''''+dbeCIA.text+''' CIADES, '''+edtBanco.text+''' BCODES, '
       + '''CONSULTA DE CHEQUES ANULADOS'' TITULO '
       +'From CAJA302 A, TGE103 B  '
       +'where CIAID='+quotedstr(dblcCia.Text)
       + ' and ECFCOMP>='''+dtpDesde.Text+''' and ECFCOMP<='''+dtpHasta.Text+''' '
       + ' and FPAGOID IN ('+ xFPago +') '
       + ' and BANCOID=''' +dblcBanco.Text+''' and CCBCOID=''' +dblcCCBco.Text+''''
       + ' and EC_IE=''E'' '
       + ' and ECESTADO=''A'' '
       + ' and A.TMONID=B.TMONID(+) '
       +'ORDER BY ECANOMM, ECNOCOMP';
  DMTE.cdsReporte.Close;
  DMTE.cdsReporte.DataRequest( xSQL );
  DMTE.cdsReporte.Open;

  if DMTE.cdsReporte.RecordCount=0 then
  begin
     ShowMessage('No existe Información para los Parámetros Seleccionados');
     Exit;
  end;

   ppdbPagoProv.DataSource := DMTE.dsReporte;

   pprPagoProv.TEMPLATE.FileName := wRutaRpt + '\ConsultaCheques.rtm';
   pprPagoProv.TEMPLATE.LoadFromFile;

// Inicio HPC_201403_CAJA
// cambia control de diseño de reporte
   if cbDisenoRep.Checked then
   begin
      ppd1.ShowModal;
   end
   else
   begin
      pprPagoProv.Print;
      pprPagoProv.Stop;
   end;
// Fin HPC_201403_CAJA
end;

procedure TFConsCheques.dblcBancoExit(Sender: TObject);
begin
  if dblcCia.Focused then Exit;

  edtBanco.text:=DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr,'BANCOID',dblcBanco.Text,'BANCONOM');

  dblcCCBco.Text:= '' ;
  if DMTE.cdsbancoegr.FieldByName('BCOTIPCTA').Value='B' then
  begin
     dblcCCBco.Enabled:=True;
     DMTE.cdsCCBco.Filtered:=False;
     DMTE.cdsCCBco.Filter:='';
     DMTE.cdsCCBco.Filter:='BANCOID='''+dblcBanco.Text+''' AND CIAID='+quotedstr(dblcCia.text)+' AND CUEEMICHE=''S''';
     DMTE.cdsCCBco.Filtered:=True;
     dblcCCBco.setfocus;
  end;

end;

procedure TFConsCheques.dblcCIAExit(Sender: TObject);
begin
  if dblcCIA.text<>'' then
    dbeCIA.text:=DMTE.cdsCia.FieldByName('CIADES').AsString;

end;

procedure TFConsCheques.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFConsCheques.pprPagoProvPreviewFormCreate(Sender: TObject);
begin
  pprPagoProv.PreviewForm.ClientHeight := 580;
  pprPagoProv.PreviewForm.ClientWidth := 780;			// ppViewr
  tppviewer(pprPagoProv.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFConsCheques.Z2bbtnPrintClick(Sender: TObject);
var
  xSQL, xFPago : String;
begin
   if Length(Trim(dblcCIA.text))=0 then
      raise exception.Create('Ingrese Compañia');

   if dtpDesde.Date=0 then
      raise exception.Create('Ingrese Fecha Inicial');

   if dtpHasta.Date=0 then
      raise exception.Create('Ingrese Fecha Final');


   if (dtpDesde.Date>dtpHasta.Date) then
      raise exception.Create('La Fecha Inicial no puede ser mayor a la Inicial');

  xSQL:='Select FPAGOID from TGE112 '
        +'where (FCEGR=''1'' or FCEGR=''S'')'
        +' and (FCHQ=''1'' or FCHQ=''S'')';
	DMTE.cdsQry.Close;
	DMTE.cdsQry.Datarequest(xSQL);
	DMTE.cdsQry.open;

  xFPago:='';
	DMTE.cdsQry.open;
  while not DMTE.cdsQry.Eof do
  begin
     xFPago:=xFPago+''''+DMTE.cdsQry.FieldByName('FPAGOID').AsString+''', ';
     DMTE.cdsQry.Next;
  end;
  xFPago:=Copy(xFPago, 1, Length(xFPago)-2 );

  xSQL:='Select A.*, B.TMONDES, B.TMONABR, '
       + ''' Desde '+dtpDesde.Text+' Hasta '+dtpHasta.Text+''' RANGO, '
       + ''''+dbeCIA.text+''' CIADES, '
       + '''CONSULTA DE CHEQUES'' TITULO '
       +'From CAJA302 A, TGE103 B  '
       +'where CIAID='+quotedstr(dblcCia.Text)
       + ' and ECFCOMP>='''+dtpDesde.Text+''' and ECFCOMP<='''+dtpHasta.Text+''' '
       + ' and FPAGOID IN ('+ xFPago +') '
       + ' and BANCOID=''' +dblcBanco.Text+''' and CCBCOID=''' +dblcCCBco.Text+''''
       + ' and EC_IE=''E'' '
       + ' and A.TMONID=B.TMONID(+)';
  DMTE.cdsReporte.Close;
  DMTE.cdsReporte.DataRequest( xSQL );
  DMTE.cdsReporte.Open;

  if DMTE.cdsReporte.RecordCount=0 then
  begin
     ShowMessage('Usuario No Registrado para Esta Opcion');
     Exit;
  end;

   ppdbPagoProv.DataSource := DMTE.dsReporte;

   pprPagoProv.TEMPLATE.FileName := wRutaRpt + '\ConsultaCheques.rtm';
   pprPagoProv.TEMPLATE.LoadFromFile;

// Inicio HPC_201403_CAJA
// cambia control de diseño de reporte
   if cbDisenoRep.Checked then
   begin
      ppd1.ShowModal;
   end
   else
   begin
      pprPagoProv.Print;
      pprPagoProv.Stop;
   end;
// Fin HPC_201403_CAJA
end;

procedure TFConsCheques.bbtnChequesClick(Sender: TObject);
var
  xSQL, xFPago : String;
begin

   if dtpDesde.Date=0 then
      raise exception.Create('Ingrese Fecha Inicial');

   if dtpHasta.Date=0 then
      raise exception.Create('Ingrese Fecha Final');


   if (dtpDesde.Date>dtpHasta.Date) then
      raise exception.Create('La Fecha Inicial no puede ser mayor a la Inicial');

  xSQL:='Select FPAGOID from TGE112 '
        +'where (FCEGR=''1'' or FCEGR=''S'')'
        +' and (FCHQ=''1'' or FCHQ=''S'')';
	DMTE.cdsQry.Close;
	DMTE.cdsQry.Datarequest(xSQL);
	DMTE.cdsQry.open;

  xFPago:='';
	DMTE.cdsQry.open;
  while not DMTE.cdsQry.Eof do
  begin
     xFPago:=xFPago+''''+DMTE.cdsQry.FieldByName('FPAGOID').AsString+''', ';
     DMTE.cdsQry.Next;
  end;
  xFPago:=Copy(xFPago, 1, Length(xFPago)-2 );

  xSQL:='Select A.*, B.TMONDES, B.TMONABR, C.BANCONOM, C.BANCOABR, '
       + ''' Desde '+dtpDesde.Text+' Hasta '+dtpHasta.Text+''' RANGO, '
       + ''''+dbeCIA.text+''' CIADES, '''+edtBanco.text+''' BCODES, '
       + '''CONSULTA DE CHEQUES'' TITULO, '
       + 'CASE WHEN ECESTADO=''C'' THEN ''EMITIDO'' ELSE ''ANULADO'' END ESTADO, '
       + 'CASE WHEN ECESTADO=''C'' THEN ECMTOORI ELSE 0 END IMPORTE '
       +'From CAJA302 A, TGE103 B, TGE105 C '
       +'where CIAID like '+quotedstr(dblcCia.Text+'%')
       + ' and ECFCOMP>='''+dtpDesde.Text+''' and ECFCOMP<='''+dtpHasta.Text+''' '
       + ' and A.FPAGOID IN ('+ xFPago +') '
       + ' and A.BANCOID LIKE ''' +dblcBanco.Text+'%'' and CCBCOID LIKE ''' +dblcCCBco.Text+'%'''
       + ' and EC_IE=''E'' '
       + ' and ECESTADO IN (''A'',''C'') '
       + ' and A.TMONID=B.TMONID(+) '
       + ' and A.BANCOID=C.BANCOID(+) '
       +'ORDER BY A.BANCOID, A.CCBCOID, ECNOCHQ';
  DMTE.cdsReporte.Close;
  DMTE.cdsReporte.DataRequest( xSQL );
  DMTE.cdsReporte.Open;

  if DMTE.cdsReporte.RecordCount=0 then
  begin
     ShowMessage('No existe Información para los Parámetros Seleccionados');
     Exit;
  end;

   ppdbPagoProv.DataSource := DMTE.dsReporte;

   pprPagoProv.TEMPLATE.FileName := wRutaRpt + '\ConsultaCheques_New.rtm';
   pprPagoProv.TEMPLATE.LoadFromFile;
   pprPagoProv.AllowPrintToArchive:=TRUE;
   pprPagoProv.AllowPrintToFile:=TRUE;

// Inicio HPC_201403_CAJA
// cambia control de diseño de reporte
   if cbDisenoRep.Checked then
   begin
      ppd1.ShowModal;
   end
   else
   begin
      pprPagoProv.Print;
      pprPagoProv.Stop;
   end;
// Fin HPC_201403_CAJA
end;

procedure TFConsCheques.FormActivate(Sender: TObject);
begin
   dtpDesde.Date:=Date;
   dtpHasta.Date:=DATE;
end;

procedure TFConsCheques.bbtnExcelClick(Sender: TObject);
var
  xSQL, xFPago : String;
begin

   if dtpDesde.Date=0 then
      raise exception.Create('Ingrese Fecha Inicial');

   if dtpHasta.Date=0 then
      raise exception.Create('Ingrese Fecha Final');


   if (dtpDesde.Date>dtpHasta.Date) then
      raise exception.Create('La Fecha Inicial no puede ser mayor a la Inicial');

  xSQL:='Select FPAGOID from TGE112 '
        +'where (FCEGR=''1'' or FCEGR=''S'')'
        +' and (FCHQ=''1'' or FCHQ=''S'')';
	DMTE.cdsQry.Close;
	DMTE.cdsQry.Datarequest(xSQL);
	DMTE.cdsQry.open;

  xFPago:='';
	DMTE.cdsQry.open;
  while not DMTE.cdsQry.Eof do
  begin
     xFPago:=xFPago+''''+DMTE.cdsQry.FieldByName('FPAGOID').AsString+''', ';
     DMTE.cdsQry.Next;
  end;
  xFPago:=Copy(xFPago, 1, Length(xFPago)-2 );

  xSQL:='Select A.*, B.TMONDES, B.TMONABR, C.BANCONOM, C.BANCOABR, D.TMONID CC_TMONID, '
       + ''' Desde '+dtpDesde.Text+' Hasta '+dtpHasta.Text+''' RANGO, '
       + ''''+dbeCIA.text+''' CIADES, '''+edtBanco.text+''' BCODES, '
       + '''CONSULTA DE CHEQUES'' TITULO, '
       + 'CASE WHEN ECESTADO=''C'' THEN ''EMITIDO'' ELSE ''ANULADO'' END ESTADO, '
       + 'CASE WHEN ECESTADO=''C'' THEN ECMTOORI ELSE 0 END IMPORTE '
       +'From CAJA302 A, TGE103 B, TGE105 C, TGE106 D '
       +'where A.CIAID like '+quotedstr(dblcCia.Text+'%')
       + ' and ECFCOMP>='''+dtpDesde.Text+''' and ECFCOMP<='''+dtpHasta.Text+''' '
       + ' and A.FPAGOID IN ('+ xFPago +') '
       + ' and A.BANCOID LIKE ''' +dblcBanco.Text+'%'' and A.CCBCOID LIKE ''' +dblcCCBco.Text+'%'''
       + ' and EC_IE=''E'' '
       + ' and nvl(EC_PROCE,''X'')<>''X'' '
       + ' and ECESTADO IN (''A'',''C'') '
       + ' and A.TMONID=B.TMONID(+) '
       + ' and A.BANCOID=C.BANCOID(+) '
       + ' and A.BANCOID=D.BANCOID(+) and A.CCBCOID=D.CCBCOID(+) and D.CIAID=''02'''
       +'ORDER BY A.BANCOID, A.CCBCOID, ECNOCHQ';
  DMTE.cdsReporte.Close;
  DMTE.cdsReporte.DataRequest( xSQL );
  DMTE.cdsReporte.Open;

  if DMTE.cdsReporte.RecordCount=0 then
  begin
     ShowMessage('No existe Información para los Parámetros Seleccionados');
     Exit;
  end;

  ExportarExcel;

end;


procedure TFConsCheques.ExportarExcel;
var
  i, iIni, iFin, c : Integer;
  Sheet: Variant;
  nNum : integer;
  cEstadoRep, sMoneda, sIni, sFin : String;

  dADEBEANT, dAHABEANT : Double;
  dDEBE, dHABE         : Double;
  dADEBE, dAHABE       : Double;
  dASALDOD, dASALDOH   : Double;
  dISALDOD, dISALDOH   : Double;
  dESALDOD, dESALDOH   : Double;
  dISALDOD2, dISALDOH2 : Double;
  dESALDOD2, dESALDOH2 : Double;
begin
  XLApp:= CreateOleObject('Excel.Application');
  XLApp.Visible := True;
  XLApp.Workbooks.Add(xlWBatWorkSheet);
  XLApp.Workbooks[1].WorkSheets[1].Name := 'Cheques Emitidos';
  Sheet := XLApp.Workbooks[1].WorkSheets['Cheques Emitidos'];

  sheet.Columns[1].ColumnWidth :=15;
  sheet.Columns[2].ColumnWidth :=15;
  sheet.Columns[3].ColumnWidth :=12;
  sheet.Columns[4].ColumnWidth :=20;
  sheet.Columns[5].ColumnWidth :=20;
  sheet.Columns[6].ColumnWidth :=12;
  sheet.Columns[7].ColumnWidth :=5;
  sheet.Columns[8].ColumnWidth :=12;
  sheet.Columns[9].ColumnWidth :=10;
  sheet.Columns[10].ColumnWidth:=12;

  i:=1;
  sheet.cells[i,1] :='CHEQUES EMITIDOS';
  sheet.cells[i,2] :='';
  sheet.cells[i,3] :='';
  sheet.cells[i,4] :='';
  sheet.cells[i,5] :='';
  sheet.cells[i,6] :='';
  sheet.cells[i,7] :='';
  sheet.cells[i,8] :='';
  sheet.cells[i,9] :='';
  sheet.cells[i,10]:='';

  inc(i);
  sheet.cells[i,1] :='Desde '+dtpDesde.Text+' Hasta '+dtpHasta.Text;
  sheet.cells[i,2] :='';
  sheet.cells[i,3] :='';
  sheet.cells[i,4] :='';
  sheet.cells[i,5] :='';
  sheet.cells[i,6] :='';
  sheet.cells[i,7] :='';
  sheet.cells[i,8] :='';
  sheet.cells[i,9] :='';
  sheet.cells[i,10]:='';


  inc(i);

  // Titulos 2
  inc(i);
  sheet.cells[i,1] :='CUENTA CORRIENTE';
  sheet.cells[i,2] :='VOUCHER';
  sheet.cells[i,3] :='FECHA';
  sheet.cells[i,4] :='PROVEEDOR';
  sheet.cells[i,5] :='GLOSA';
  sheet.cells[i,6] :='CHEQUE';
  sheet.cells[i,7] :='MONEDA';
  sheet.cells[i,8] :='IMPORTE';
  sheet.cells[i,9] :='ESTADO';
  sheet.cells[i,10]:='ENTREGADO';
  //for c:=1 to 14 do sheet.cells[i,c].Interior.Color:=clMoneyGreen;
  inc(i);

  iIni:=i+1;
  DMTE.cdsReporte.First;
  while not DMTE.cdsReporte.Eof do
  begin
      inc(i);
      sheet.cells[i,1]  :=''''+DMTE.cdsReporte.FieldbyName('CCBCOID').AsString;
      sheet.cells[i,2]  :=''''+DMTE.cdsReporte.FieldbyName('ECNOCOMP').AsString;

      if DMTE.cdsReporte.FieldbyName('ECFEMICH').AsDateTime>0 then
         sheet.cells[i,3]  :=DMTE.cdsReporte.FieldbyName('ECFEMICH').AsDateTime;

      sheet.cells[i,4]  :=DMTE.cdsReporte.FieldbyName('ECGIRA').AsString;
      sheet.cells[i,5]  :=DMTE.cdsReporte.FieldbyName('ECGLOSA').AsString;
      sheet.cells[i,6]  :=DMTE.cdsReporte.FieldbyName('ECNOCHQ').AsString;
      sheet.cells[i,7]  :=DMTE.cdsReporte.FieldbyName('CC_TMONID').AsString;
      sheet.cells[i,8]  :=DMTE.cdsReporte.FieldbyName('IMPORTE').AsString;
      sheet.cells[i,9]  :=DMTE.cdsReporte.FieldbyName('ESTADO').AsString;
      if DMTE.cdsReporte.FieldbyName('ECFPAGOP').AsDateTime>0 then
         sheet.cells[i,10] :=DMTE.cdsReporte.FieldbyName('ECFPAGOP').AsDateTime;

      DMTE.cdsReporte.Next;
  end;

  eXIT;

  {
  // En Blanco
  inc(i);
  // Totales
  inc(i);
  sheet.cells[i,1] := '';
  sheet.cells[i,2] := 'TOTALES';
  sheet.cells[i,3] := dADEBEANT;
  sheet.cells[i,4] := dAHABEANT;
  sheet.cells[i,5] := dDEBE    ;
  sheet.cells[i,6] := dHABE    ;
  sheet.cells[i,7] := dADEBE   ;
  sheet.cells[i,8] := dAHABE   ;
  sheet.cells[i,9] := dASALDOD ;
  sheet.cells[i,10] := dASALDOH ;
  sheet.cells[i,11] := dISALDOD ;
  sheet.cells[i,12] := dISALDOH ;
  sheet.cells[i,13] := dESALDOD ;
  sheet.cells[i,14] := dESALDOH ;

  // Totales
  Inc(i);
  sheet.cells[i,1]  :='';
  sheet.cells[i,2]  :='';
  sheet.cells[i,3]  :='';
  sheet.cells[i,4]  :='';
  sheet.cells[i,5]  :='';
  sheet.cells[i,6]  :='';
  sheet.cells[i,7]  :='';
  sheet.cells[i,8]  :='';
  sheet.cells[i,9]  :='';
  sheet.cells[i,10] :='';

  if dISALDOD<=dISALDOH then
  begin
     sheet.cells[i,11] :=dISALDOH-dISALDOD;
     sheet.cells[i,12] :=0;
  end
  else
  begin
     sheet.cells[i,11] :=0;
     sheet.cells[i,12] :=dISALDOD-dISALDOH;
  end;

  if dESALDOD<=dESALDOH then
  begin
     sheet.cells[i,13] :=dESALDOH-dESALDOD;
     sheet.cells[i,14] :=0;
  end
  else
  begin
     sheet.cells[i,13] :=0;
     sheet.cells[i,14] :=dESALDOD-dESALDOH;
  end;

  dISALDOD2 :=sheet.cells[i,11];
  dISALDOH2 :=sheet.cells[i,12];
  dESALDOD2 :=sheet.cells[i,13];
  dESALDOH2 :=sheet.cells[i,14];


  // Totales 2
  Inc(i);
  sheet.cells[i,1]  :='';
  sheet.cells[i,2]  :='';
  sheet.cells[i,3]  :=dADEBEANT;
  sheet.cells[i,4]  :=dAHABEANT;
  sheet.cells[i,5]  :=dDEBE    ;
  sheet.cells[i,6]  :=dHABE    ;
  sheet.cells[i,7]  :=dADEBE   ;
  sheet.cells[i,8]  :=dAHABE   ;
  sheet.cells[i,9]  :=dASALDOD ;
  sheet.cells[i,10] :=dASALDOH ;
  sheet.cells[i,11] :=dISALDOD + dISALDOD2;
  sheet.cells[i,12] :=dISALDOH + dISALDOH2;
  sheet.cells[i,13] :=dESALDOD + dESALDOD2;
  sheet.cells[i,14] :=dESALDOH + dESALDOH2;

  iFin:=i;
  sIni:=Inttostr(iIni);
  sFin:=Inttostr(iFin);
  sheet.Range['C'+sIni+':'+'C'+sFin].NumberFormat:='###,###,##0.00';
  sheet.Range['D'+sIni+':'+'C'+sFin].NumberFormat:='###,###,##0.00';
  sheet.Range['E'+sIni+':'+'C'+sFin].NumberFormat:='###,###,##0.00';
  sheet.Range['F'+sIni+':'+'C'+sFin].NumberFormat:='###,###,##0.00';
  sheet.Range['G'+sIni+':'+'C'+sFin].NumberFormat:='###,###,##0.00';
  sheet.Range['H'+sIni+':'+'C'+sFin].NumberFormat:='###,###,##0.00';
  sheet.Range['I'+sIni+':'+'C'+sFin].NumberFormat:='###,###,##0.00';
  sheet.Range['J'+sIni+':'+'C'+sFin].NumberFormat:='###,###,##0.00';
  sheet.Range['K'+sIni+':'+'C'+sFin].NumberFormat:='###,###,##0.00';
  sheet.Range['M'+sIni+':'+'C'+sFin].NumberFormat:='###,###,##0.00';
  sheet.Range['N'+sIni+':'+'C'+sFin].NumberFormat:='###,###,##0.00';

  sheet.Range['A5:N5'].Font.Bold:=True;
  sheet.Range['A6:N6'].Font.Bold:=True;
  }
  //
end;


procedure TFConsCheques.dblcCIANotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFConsCheques.sbDisenoRepClick(Sender: TObject);
begin
// Inicio HPC_201403_CAJA
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
// Fin HPC_201403_CAJA
end;

end.

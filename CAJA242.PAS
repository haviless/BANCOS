unit Caja242 ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, StdCtrls, wwdblook, Buttons, ExtCtrls, ppReport,
  ppStrtch, ppSubRpt, ppBands, ppCtrls, ppClass, ppPrnabl, ppProd, ppComm,
  ppRelatv, ppCache, ppDB, ppDBPipe, ppDBBDE, ppVar, Grids, Wwdbigrd,
  Wwdbgrid;

type
  TFArqueoCajaN = class(TForm)
    pnlRegComp: TPanel;
    lblReporte: TLabel;
    Bevel1: TBevel;
    z2bbtnOk: TBitBtn;
    z2bbtnSalir: TBitBtn;
    lblCia: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dbdtpFin: TwwDBDateTimePicker;
    dbdtpInicio: TwwDBDateTimePicker;
    ppRptIngreso: TppReport;
    ppDBIE: TppDBPipeline;
    ppDetailBand4: TppDetailBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    svPag: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel1: TppLabel;
    ppFecha1: TppLabel;
    pplblCia: TppLabel;
    ppLine2: TppLine;
    ppLabel7: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel12: TppLabel;
    ppLabel9: TppLabel;
    ppLabel20: TppLabel;
    ppLabel23: TppLabel;
    ppLabel26: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLine1: TppLine;
    ppLabel10: TppLabel;
    ppLabel19: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel24: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    pplblLiquida: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLabel6: TppLabel;
    ppdbtEFSO: TppDBText;
    ppdbtEFDO: TppDBText;
    ppdbtCHSO: TppDBText;
    ppdbtCHDO: TppDBText;
    ppdbtTASO: TppDBText;
    pplblTotalSo: TppLabel;
    pplblTotalDo: TppLabel;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    pplblTotales: TppLabel;
    ppdbcEFTOSO: TppDBCalc;
    ppdbcEFTODO: TppDBCalc;
    ppdbcCHTOSO: TppDBCalc;
    ppdbcCHTODO: TppDBCalc;
    ppdbcTATOSO: TppDBCalc;
    ppLine3: TppLine;
    ppVariable1: TppVariable;
    ppVariable2: TppVariable;
    procedure dbdtpFinExit(Sender: TObject);
    procedure dbdtpInicioExit(Sender: TObject);
    procedure dblcCiaChange(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure z2bbtnSalirClick(Sender: TObject);
    procedure z2bbtnOkClick(Sender: TObject);
    procedure ppDetailBand5BeforeGenerate(Sender: TObject);
    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);
    procedure ppVariable2Calc(Sender: TObject; var Value: Variant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure ArqueoCaja(const xCIAID, xFECHAINICIO, xFECHAFIN: String);
  public
    { Public declarations }
  end;

var
  FArqueoCajaN: TFArqueoCajaN;

implementation

uses CajaDM, CajaUtil;

{$R *.DFM}

procedure TFArqueoCajaN.dbdtpFinExit(Sender: TObject);
begin
    if dbdtpFin.Date = 0 then
    begin
       dbdtpFin.Date :=tDate( Now);
    end;
    if dbdtpInicio.Date > dbdtpFin.Date then
       dbdtpInicio.Date:=dbdtpFin.Date;
end;

procedure TFArqueoCajaN.dbdtpInicioExit(Sender: TObject);
begin
    if dbdtpInicio.Date = 0 then
    begin
       dbdtpInicio.Date :=tDate( Now);
    end;
end;

procedure TFArqueoCajaN.dblcCiaChange(Sender: TObject);
begin
   if  length(dblcCia.Text)=dblcCia.LookupTable.FieldByName('CIAID').Size then
   begin
	   if dblcCia.Text=dblcCia.LookupTable.FieldByName('CIAID').AsString then
	   begin
	      if edtCia.Text<>dblcCia.LookupTable.FieldByName('CIADES').AsString then
	      begin
	            edtCia.Text:=dblcCia.LookupTable.FieldByName('CIADES').AsString;
	      end;
	   end
	   else
	   begin
	     if not dblcCia.LookupTable.Locate('CIAID', dblcCia.Text,[]) then
	     begin
	          edtCia.text:='';
	     end
	     else
	     begin
	          edtCia.text:=dblcCia.LookupTable.fieldbyname('CIADES').AsString;
	     end;
	   end;
   end
   else
   begin
           edtCia.text:='';
   end;
end;


procedure TFArqueoCajaN.dblcCiaExit(Sender: TObject);
begin
 if edtCia.Text='' then
  begin
    if dblcCia.Text='' then
      ShowMessage('Ingrese Compañía')
    else
      ShowMessage('El Código de Compañía que ha Ingresado'+#13 +
                  'No está registrado');
    (Sender as twincontrol).SetFocus;
  end
end;

procedure TFArqueoCajaN.FormShow(Sender: TObject);
begin
    RecuperarCiaUnica(dblcCia,edtCia) ;
    dbdtpInicio.Date := Date ;
    dbdtpFin.Date := Date ;
end;

procedure TFArqueoCajaN.z2bbtnSalirClick(Sender: TObject);
begin
   Close ;
end;

procedure TFArqueoCajaN.z2bbtnOkClick(Sender: TObject);
var
   FInicio ,
   xfech,ssql,FFin : string ;
   xZ : integer;
begin
   FInicio:= FechaDB2 (dbdtpINicio.Date) ;
   FFin   := FechaDB2 (dbdtpInicio.Date) ;
   ArqueoCaja( dblcCia.Text, FInicio, FFin ) ;
   ppDBIE.DataSource := dm1.dsRec;
	 //JCC: 24/06/2002
	 ppRptIngreso.TEMPLATE.FileName := wRutaRpt + '\ArqIngreso.Rtm' ;
   ppRptIngreso.template.LoadFromFile ;
   pplblCia.caption := DM1.cdsCia.FieldByname('CIADES').AsString;

   xfech := formatdatetime(DM1.wFormatFecha,date);
   ssql := 'SELECT * FROM CAJA310'
           +' WHERE BANCOID='+quotedstr('00')
           +' AND STFECHA='+quotedstr(xfech);
   dm1.cdsQry2.Close;
   dm1.cdsQry2.DataRequest(ssql);
   dm1.cdsQry2.Open;
   pplblLiquida.Caption := 'Num. Liquidación : '+ dm1.cdsQry2.fieldbyname('NUMLIQ').AsString;

   if dm1.cdsRec.RecordCount = 0 then
      Raise Exception.create('No hay datos por Mostrar para el rango seleccionado') ;

   ppFecha1.Caption := dbdtpInicio.Text ;
   ppRptIngreso.Print ;
   ppRptIngreso.Stop;

   xZ := ppSubReport1.Report.GroupCount -1;
   While xZ >= 0 Do
   begin
     ppSubReport1.Report.Groups[xZ].Free;
     xZ := xZ - 1;
   end;
   ppDBIE.DataSource       := nil ;
End;

procedure TFArqueoCajaN.ArqueoCaja(const xCIAID, xFECHAINICIO, xFECHAFIN: String);
var   sFecha,xSQL : String ;
begin
  sFecha := formatdatetime(DM1.wFormatFecha,dbdtpInicio.DateTime);
  if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
    xSQL:='SELECT ''R'' AS DOCABR,'+
          '''-''||CASE WHEN '+DM1.wReplacCeros+'(RTRIM(CXC303.CCSERIE),'''')<> '''' THEN ''-'' ELSE '''' END||CXC303.CCNODOC ECFCOMP,'+
          'CXC303.CLIEID, CXC303.CLAUXID, CXC303.CCNOMB AUXNOMB, CXC303.CCGLOSA, '+
          'SUM( CASE WHEN (TGE112.FPAGODES=''EFECTIVO'') AND (CAJA314.TMONID='''+DM1.wTMonLoc+''') THEN DEC(COALESCE(CAJA314.FC_MTOLOC,0),15,2 ) ELSE 0.00 END ) EFECMTOLOC,'+
          'SUM( CASE WHEN (TGE112.FPAGODES=''EFECTIVO'') AND (CAJA314.TMONID='''+DM1.wTMonExt+''') THEN DEC(COALESCE(CAJA314.FC_MTOEXT,0),15,2 ) ELSE 0.00 END ) EFECMTOEXT,'+
          'SUM( CASE WHEN (TGE112.FPAGODES=''CHEQUE'') AND (CAJA314.TMONID='''+DM1.wTMonLoc+''') THEN DEC(COALESCE(CAJA314.FC_MTOLOC,0),15,2 ) ELSE 0.00 END ) CHECMTOLOC,'+
          'SUM( CASE WHEN (TGE112.FPAGODES=''CHEQUE'') AND (CAJA314.TMONID='''+DM1.wTMonExt+''') THEN DEC(COALESCE(CAJA314.FC_MTOEXT,0),15,2 ) ELSE 0.00 END ) CHECMTOEXT,'+
          'SUM( CASE WHEN (TGE112.FPAGODES=''TARJETA'') AND (CAJA314.TMONID='''+DM1.wTMonLoc+''') THEN DEC(COALESCE(CAJA314.FC_MTOLOC,0),15,2 ) ELSE 0.00 END ) TAECMTOLOC,'+
          'SUM( CASE WHEN (TGE112.FPAGODES=''TARJETA'') AND (CAJA314.TMONID='''+DM1.wTMonExt+''') THEN DEC(COALESCE(CAJA314.FC_MTOEXT,0),15,2 ) ELSE 0.00 END ) TAECMTOEXT,'+
          'MAX( DEC(CXC303.NCOTCAMB,15,3) ) ECTCAMB '+
          ' FROM CXC303'+
          ' LEFT JOIN CAJA314 ON (CAJA314.CCNODOC = CXC303.CCNODOC)'+
          ' LEFT JOIN TGE112 ON (CAJA314.FPAGOID = TGE112.FPAGOID  AND TGE112.F_MOVDIARIO = ''S'')'+
          ' LEFT JOIN TGE103 ON  (CXC303.TMONID = TGE103.TMONID)'+
          ' LEFT JOIN CNT201 ON  (CXC303.CLIEID = CNT201.AUXID AND CXC303.CLAUXID = CNT201.CLAUXID )'+
          ' WHERE CCFEMIS >= '+ quotedstr(sFecha)+'AND CCFEMIS <='+quotedstr(sFecha)+'AND'+
          ' CXC303.CIAID = '+quotedstr(dblcCia.text)+' AND NCOESTADO = ''C''  AND CXC303.CCTREC IN (''NP'',''RC'')'+
          'Group By CXC303.CCSERIE, CXC303.CCNODOC, CXC303.CLIEID, CXC303.CLAUXID, '+
          '         CXC303.CCNOMB, CXC303.CCGLOSA '+
          ' ORDER BY CXC303.CLIEID, CXC303.CCGLOSA'
  else
  	if DM1.SRV_D = 'ORACLE' then
      xSQL:='SELECT ''R'' AS DOCABR,'+
              '''-''||DECODE('+DM1.wReplacCeros+'(TRIM(CXC303.CCSERIE),null),null,null,''-'') || CXC303.CCNODOC ECFCOMP,'+
              'CXC303.CLIEID, CXC303.CLAUXID, CXC303.CCNOMB AUXNOMB, CXC303.CCGLOSA, '+
              ' SUM(DECODE(TGE112.FPAGODES,''EFECTIVO'',DECODE(CAJA314.TMONID,'''+DM1.wTMonLoc+''',TRUNC(NVL(CAJA314.FC_MTOLOC,0),2 ),0.00), 0.00)) EFECMTOLOC,' +
              ' SUM(DECODE(TGE112.FPAGODES,''EFECTIVO'',DECODE(CAJA314.TMONID,'''+DM1.wTMonExt+''',TRUNC(NVL(CAJA314.FC_MTOEXT,0),2 ),0.00), 0.00)) EFECMTOEXT,' +
              ' SUM(DECODE(TGE112.FPAGODES,''CHEQUE''  ,DECODE(CAJA314.TMONID,'''+DM1.wTMonLoc+''',TRUNC(NVL(CAJA314.FC_MTOLOC,0),2 ),0.00), 0.00)) CHECMTOLOC,' +
              ' SUM(DECODE(TGE112.FPAGODES,''CHEQUE''  ,DECODE(CAJA314.TMONID,'''+DM1.wTMonExt+''',TRUNC(NVL(CAJA314.FC_MTOEXT,0),2 ),0.00), 0.00)) CHECMTOEXT,' +
              ' SUM(DECODE(TGE112.FPAGODES,''TARJETA'' ,DECODE(CAJA314.TMONID,'''+DM1.wTMonLoc+''',TRUNC(NVL(CAJA314.FC_MTOLOC,0),2 ),0.00), 0.00)) TAECMTOLOC,' +
              ' SUM(DECODE(TGE112.FPAGODES,''TARJETA'' ,DECODE(CAJA314.TMONID,'''+DM1.wTMonExt+''',TRUNC(NVL(CAJA314.FC_MTOEXT,0),2 ),0.00), 0.00)) TAECMTOEXT,' +
              ' MAX(TRUNC(CXC303.NCOTCAMB,3) ) ECTCAMB '+
            ' FROM CXC303, CAJA314, TGE112, TGE103, CNT201'+
            ' WHERE CCFEMIS>= TO_DATE('+quotedstr(sFecha)+') AND CCFEMIS <= TO_DATE('+quotedstr(sFecha)+') AND'+
              ' CXC303.CIAID = '+quotedstr(dblcCia.text)+' AND NCOESTADO = ''C''  AND CXC303.CCTREC IN (''NP'',''RC'')'+
              ' AND CAJA314.CCNODOC = CXC303.CCNODOC (+)'+
              ' AND CAJA314.FPAGOID = TGE112.FPAGOID  AND TGE112.F_MOVDIARIO(+) = ''S'''+
              ' AND CXC303.TMONID = TGE103.TMONID(+)'+
              ' AND CXC303.CLIEID = CNT201.AUXID (+)  AND CXC303.CLAUXID = CNT201.CLAUXID (+)'+
            ' Group By CXC303.CCSERIE, CXC303.CCNODOC, CXC303.CLIEID, CXC303.CLAUXID, '+
            ' CXC303.CCNOMB, CXC303.CCGLOSA '+
            ' ORDER BY CXC303.CLIEID, CXC303.CCGLOSA';

  dm1.cdsRec.close;
  dm1.cdsRec.DataRequest(xSQL);
  dm1.cdsRec.open;
  dm1.cdsRec.IndexFieldNames:='ECFCOMP';
end;


procedure TFArqueoCajaN.ppDetailBand5BeforeGenerate(Sender: TObject);
begin
  pplblTotalSo.Caption := FormatFloat('#,0.00',dm1.cdsRec.fieldbyname('EFECMTOLOC').value +
                          dm1.cdsRec.fieldbyname('CHECMTOLOC').value +
                          dm1.cdsRec.fieldbyname('TAECMTOLOC').value);
  pplblTotalDo.Caption := FormatFloat('#,0.00',dm1.cdsRec.fieldbyname('EFECMTOEXT').value +
                          dm1.cdsRec.fieldbyname('CHECMTOEXT').value +
                          dm1.cdsRec.fieldbyname('TAECMTOEXT').value);

end;

procedure TFArqueoCajaN.ppVariable1Calc(Sender: TObject;
  var Value: Variant);
begin
   Value:=ppdbcEFTOSO.Value+ppdbcCHTOSO.Value+ppdbcTATOSO.Value;
end;

procedure TFArqueoCajaN.ppVariable2Calc(Sender: TObject;
  var Value: Variant);
begin
   Value:=ppdbcEFTODO.Value+ppdbcCHTODO.Value;
end;

procedure TFArqueoCajaN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dm1.cdsRec.IndexFieldNames:='';
   dm1.cdsRec.close;
end;

end.

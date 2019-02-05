unit Caja226 ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, StdCtrls, wwdblook, Buttons, ExtCtrls, ppReport,
  ppStrtch, ppSubRpt, ppBands, ppCtrls, ppClass, ppPrnabl, ppProd, ppComm,
  ppRelatv, ppCache, ppDB, ppDBPipe, ppDBBDE, ppVar;

type
  TFArqueoCaja = class(TForm)
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
    ppReport5: TppReport;
    ppDBIE: TppDBPipeline;
    ppDBResumen: TppDBPipeline;
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
    ppLabel5: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLabel6: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppMonNac: TppLabel;
    ppMonExt: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText12: TppDBText;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine1: TppLine;
    ppLabel15: TppLabel;
    ppLine2: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel41: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel61: TppLabel;
    ppLabel18: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel8: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel86: TppLabel;
    ppLabel84: TppLabel;
    ppLabel83: TppLabel;
    ppLabel82: TppLabel;
    ppLabel81: TppLabel;
    ppLabel80: TppLabel;
    ppLabel79: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLine4: TppLine;
    ppDetailBand6: TppDetailBand;
    ppDBText39: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText36: TppDBText;
    ppDBText35: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText38: TppDBText;
    ppDBText37: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppDBCalc10: TppDBCalc;
    ppLine3: TppLine;
    ppLabel89: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    procedure dbdtpFinExit(Sender: TObject);
    procedure dbdtpInicioExit(Sender: TObject);
    procedure dblcCiaChange(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure z2bbtnSalirClick(Sender: TObject);
    procedure z2bbtnOkClick(Sender: TObject);
    procedure ppDBCalc4Calc(Sender: TObject);
    procedure ppSummaryBand2BeforeGenerate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ppDBCalc3Calc(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    xTotEgresosS  ,
    xTotEgresosD  ,
    xTotIngresosS ,
    xTotIngresosD : Currency ;
		procedure AsignaSQLArqueoCaja(xCIAID, xFECHAINICIO, xFECHAFIN: String);
  public
    { Public declarations }
  end;

var
  FArqueoCaja: TFArqueoCaja;

implementation

uses CajaDM, CajaUtil;

{$R *.DFM}

procedure TFArqueoCaja.dbdtpFinExit(Sender: TObject);
begin
    if dbdtpFin.Date = 0 then
    begin
       dbdtpFin.Date :=tDate( Now);
    end;
    if dbdtpInicio.Date > dbdtpFin.Date then
       dbdtpInicio.Date:=dbdtpFin.Date;
end;

procedure TFArqueoCaja.dbdtpInicioExit(Sender: TObject);
begin
    if dbdtpInicio.Date = 0 then
    begin
       dbdtpInicio.Date :=tDate( Now);
    end;
{
    if dbdtpInicio.Date > dbdtpFin.Date then
       dbdtpFin.Date:=dbdtpInicio.Date;
}
end;

procedure TFArqueoCaja.dblcCiaChange(Sender: TObject);
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


procedure TFArqueoCaja.dblcCiaExit(Sender: TObject);
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
procedure TFArqueoCaja.FormShow(Sender: TObject);
begin
    RecuperarCiaUnica(dblcCia,edtCia) ;
    dbdtpInicio.Date := Date ;
    dbdtpFin.Date := Date ;
end;

procedure TFArqueoCaja.z2bbtnSalirClick(Sender: TObject);
begin
   Close ;
end;

procedure TFArqueoCaja.z2bbtnOkClick(Sender: TObject);
var
   FInicio ,
   FFin : string ;
   xZ : integer;
begin
	 FInicio :=  FechaDB2 (dbdtpINicio.Date) ;
	 FFin := FechaDB2 (dbdtpInicio.Date);
	 AsignaSQLArqueoCaja( dblcCia.Text , FInicio , FFin ) ;
	 ppDBIE.DataSource     := dm1.dsRec;
	 ppDBResumen.DataSource:= dm1.dsDescrip;
	 //JCC: 24/06/2002
	 ppreport5.TEMPLATE.FileName:=wRutaRpt + '\ArqueoNew.Rtm' ;
   ppreport5.template.LoadFromFile ;
   if dm1.cdsRec.RecordCount = 0 then
      Raise Exception.create('No hay datos por Mostrar para el rango seleccionado') ;
   ppFecha1.Caption := dbdtpInicio.Text ;
   ppLabel61.caption := 'Resumen Adjunto al Movimiento de Caja por Tipo de Documento Al '+ppFecha1.Caption;
   ppreport5.Print;
   ppreport5.Stop;
   xZ := ppSubReport1.Report.GroupCount -1;
   While xZ >= 0 Do
    begin
     ppSubReport1.Report.Groups[xZ].Free;
     xZ := xZ - 1;
    end;
   xZ := ppSubReport2.Report.GroupCount -1;
   While xZ >= 0 Do
    begin
     ppSubReport2.Report.Groups[xZ].Free;
     xZ := xZ - 1;
    end;
   ppDBIE.DataSource       := nil ;
   ppDBResumen.DataSource  := nil ;
   dm1.cdsRec.Active:=False ;
end;

procedure TFArqueoCaja.ppDBCalc4Calc(Sender: TObject);
begin
//local
   if copy(dm1.cdsrec.FieldByName('EC_IE').AsString,1,1) = 'I' then
      xTotIngresosS := ppDBCalc4.Value
   else
      if copy(dm1.cdsrec.FieldByName('EC_IE').AsString,1,1) = 'E' then
         xTotEgresosS := ppDBCalc4.Value
end;

procedure TFArqueoCaja.ppSummaryBand2BeforeGenerate(Sender: TObject);
begin
  ppMonExt.Caption := cajadec(CurrToStr( xTotINgresosD - xTotEgresosD )) ;
  ppMonNac.Caption := cajadec(CurrToStr( xTotIngresosS - xTotEgresosS )) ;
  if trim(ppMonNac.Caption) = '' then ppMonNac.Caption := '0.00' ;
  if trim(ppMonExt.Caption) = '' then ppMonExt.Caption := '0.00' ;
end;

procedure TFArqueoCaja.FormCreate(Sender: TObject);
begin
    xTotEgresosS   := 0 ;
    xTotEgresosD   := 0 ;
    xTotIngresosS  := 0 ;
    xTotIngresosD  := 0 ;
end;

procedure TFArqueoCaja.ppDBCalc3Calc(Sender: TObject)  ;
begin
//externo
   if copy(dm1.cdsrec.FieldByName('EC_IE').AsString,1,1)    = 'I' then
      xTotIngresosD := ppDBCalc3.Value
   else
      if copy(dm1.cdsrec.FieldByName('EC_IE').AsString,1,1) = 'E' then
         xTotEgresosD := ppDBCalc3.Value
end;

procedure TFArqueoCaja.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dm1.cdsRec.Close;
end;


procedure TFArqueoCaja.AsignaSQLArqueoCaja(xCIAID, xFECHAINICIO, xFECHAFIN: String);
var
   xSQL : String ;
begin
   //PROCEDIMIENTO PREVIO AL RESUMEN DEL ARQUEO DE CAJA
   xSQL := 'DELETE FROM CAJARPT1' ;
   //** 04/07/2001 - pjsv
   try
    DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;
   //**

   xSQL := 'DELETE FROM CAJARPT2' ;
   //** 09/10/2001- pjsv
   try
    DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;
   //**

   //INSERTA DATOS EN CAJARPT1
   if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
     xSQL:='INSERT INTO CAJARPT1 '
          +'(SELECT EC_IE, '
          +    'CASE WHEN EC_PROCE = ''1'' THEN ''Egresos'' '
          +         'WHEN EC_PROCE = ''3'' THEN ''Pago a Varios''  '
          +         'WHEN EC_PROCE = ''B'' THEN ''Pago a Prov.'' END DOCID, '
          +    'FPAGOID, '
          +    'CASE WHEN TMONID ='''+DM1.wTMonLoc+''' THEN DEC(SUM( COALESCE(ECMTOLOC,0) ),15,2) END MTOLOC, '
          +    'CASE WHEN TMONID ='''+DM1.wTMonExt+''' THEN DEC(SUM( ECMTOEXT ),15,2) END MTOEXT '
          +'FROM CAJA302 '
          +'WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') AND '
          +    'ECFCOMP >= DATE('''+ xFECHAINICIO + ''') AND '
          +    'ECFCOMP <= DATE('''+ xFECHAFIN + ''')    AND '
          +    'CIAID = '''+ xCIAID + '''                AND '
          +    'EC_IE = ''E''                            AND '
          +    'CASE WHEN (RTRIM(CCBCOID)='''' OR (CCBCOID IS NULL)) THEN ''E'' ELSE COALESCE(ECCHKEST,''P'') END = ''E'' AND '
          +    'ECESTADO = ''C'' '
          +'GROUP BY EC_IE, EC_PROCE, FPAGOID, TMONID )                                      '
   else
    if DM1.SRV_D = 'ORACLE' then
       xSQL:='INSERT INTO CAJARPT1 '
            +'(SELECT EC_IE, '
            +    'DECODE( EC_PROCE , ''1'' , ''Egresos'' '
            +         ', EC_PROCE , ''3'' , ''Pago a Varios''  '
            +         ', EC_PROCE , ''B'' , ''Pago a Prov.'' ) DOCID, '
            +    'FPAGOID, '
            +    'DECODE(TMONID ,'''+DM1.wTMonLoc+''' , TRUNC(SUM( NVL(ECMTOLOC,0)),2)) MTOLOC, '
            +    'DECODE(TMONID ,'''+DM1.wTMonExt+''' , TRUNC(SUM( NVL(ECMTOEXT,0)),2)) MTOEXT '
            +' FROM CAJA302 '
            +' WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') '
            +    ' AND ECFCOMP >= TO_DATE('''+ xFECHAINICIO + ''') '
            +    ' AND ECFCOMP <= TO_DATE('''+ xFECHAFIN + ''')    '
            +    ' AND CIAID = '''+ xCIAID + ''' '
            +    ' AND EC_IE = ''E'' '
            +    ' AND DECODE(RTRIM(NVL(CCBCOID,'''')), '''' , ''E'' , NVL(ECCHKEST,''P'')) = ''E'' '
            +    ' AND ECESTADO = ''C'' '
            +' GROUP BY EC_IE, EC_PROCE, FPAGOID, TMONID ) ';
  //** 10/10/2001 - pjsv
  try
   DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
  except
  end;
  //**
	if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
           xSQL:='INSERT INTO CAJARPT1 '
         +'(SELECT ''I'' EC_IE, '
         +   'CASE WHEN (DOCID IS NULL) OR (LENGTH(RTRIM(DOCID))=0) THEN ''XX'' ELSE DOCID END DOCID, '
         +   'FPAGOID, '
         +   'CASE WHEN TMONID='''+DM1.wTMonLoc+''' THEN DEC(SUM( COALESCE(FC_MTOLOC,0) ),15,2) END MTOLOC, '
         +   'CASE WHEN TMONID='''+DM1.wTMonExt+''' THEN DEC(SUM( COALESCE(FC_MTOEXT,0) ),15,2) END MTOEXT '
         +'FROM CAJA314 '
         +'WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') '
         +   'AND FC_FCANC >= DATE('''+ xFECHAINICIO + ''') '
         +   'AND FC_FCANC <= DATE('''+ xFECHAFIN + ''') '
         +   'AND CIAID = '''+ xCIAID + ''' '
         +   'AND FC_ESTADO = ''C'' '
         +'GROUP BY DOCID, FPAGOID,TMONID'
         +')'
	else
	  if DM1.SRV_D = 'ORACLE' then
               xSQL:='INSERT INTO CAJARPT1 '
            +'(SELECT ''I'' EC_IE, '
            +   'DECODE(TRIM(NVL(DOCID,NULL)),NULL,''XX'',DOCID ) DOCID, '
            +   'FPAGOID, '
            +   'DECODE(TMONID,'''+DM1.wTMonLoc+''' , TRUNC(SUM(NVL(FC_MTOLOC,0)),2) ) MTOLOC, '
            +   'DECODE(TMONID,'''+DM1.wTMonExt+''' , TRUNC(SUM(NVL(FC_MTOEXT,0) ),2) ) MTOEXT '
            +'FROM CAJA314 '
            +'WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') '
            +   'AND FC_FCANC >= TO_DATE('''+ xFECHAINICIO + ''') '
            +   'AND FC_FCANC <= TO_DATE('''+ xFECHAFIN + ''') '
            +   'AND CIAID = '''+ xCIAID + ''' '
            +   'AND FC_ESTADO = ''C'' '
            +'GROUP BY DOCID, FPAGOID,TMONID'
            +')';
  //** 10/10/2001 - pjsv
  try
   DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
  except
  end;
  //**

   //INSERTA DATOS EN CAJARPT2

   //PROCEDIMIENTO PREVIO AL RESUMEN DEL ARQUEO DE CAJA
   xSQL := 'DELETE FROM CAJARPT1_1' ;
   //** 04/07/2001 - pjsv
   try
    DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;
   //**

   xSQL := 'DELETE FROM CAJARPT2_1' ;
   //** 09/10/2001 - pjsv
   try
    DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;
  //**

   //INSERTA DATOS EN CAJARPT1_1
   if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
     xSQL :=   'INSERT INTO CAJARPT1_1 '
             + '(SELECT EC_IE, '
             +    ' CASE WHEN (CPTOID IS NULL) OR (LENGTH(RTRIM(CPTOID))=0) THEN ''XX'' ELSE CPTOID END DOCID, '
             +    ' FPAGOID, '
             +    ' DEC(SUM( COALESCE(ECMTOLOC,0) ),15,2) MTOLOC, '
             +    ' DEC(SUM( COALESCE(ECMTOEXT,0) ),15,2) MTOEXT '
             + 'FROM CAJA302 '
             + 'WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') AND '
             +    ' ECFCOMP >= DATE('''+ xFECHAINICIO + ''') AND '
             +    ' ECFCOMP <= DATE('''+ xFECHAFIN + ''') AND '
             +    ' CIAID = '''+ xCIAID + ''' AND '
             +    ' EC_IE = ''E'' AND '
             +    ' ECESTADO = ''C'' '
             + 'GROUP BY EC_IE, CPTOID, FPAGOID) '
   else
     if DM1.SRV_D = 'ORACLE' then
       xSQL :=   'INSERT INTO CAJARPT1_1 '
               + '(SELECT EC_IE, '
               +    ' DECODE(NVL(CPTOID,NULL),NULL,''XX'',CPTOID ) DOCID, '
               +    ' FPAGOID, '
               +    ' TRUNC(SUM(NVL(ECMTOLOC,0) ),2) MTOLOC, '
               +    ' TRUNC(SUM(NVL(ECMTOEXT,0) ),2) MTOEXT '
               + 'FROM CAJA302 '
               + 'WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') AND '
               +    ' ECFCOMP >= TO_DATE('''+ xFECHAINICIO + ''') AND '
               +    ' ECFCOMP <= TO_DATE('''+ xFECHAFIN + ''') AND '
               +    ' CIAID = '''+ xCIAID + ''' AND '
               +    ' EC_IE = ''E'' AND '
               +    ' ECESTADO = ''C'' '
               + 'GROUP BY EC_IE, CPTOID, FPAGOID'
               + ') ';
   //** 10/10/2001 - pjsv
   try
    DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   end;
   //**

   if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
     xSQL:='INSERT INTO CAJARPT1_1 '
          +'(SELECT ''I'' EC_IE, '
          +  ' CASE WHEN (CPTOID IS NULL) OR (LENGTH(RTRIM(CPTOID))=0) THEN ''XX'' ELSE CPTOID END DOCID, '
          +  ' FPAGOID, '
          +  ' DEC(SUM( COALESCE(FC_MTOLOC,0) ),15,2) MTOLOC, '
          +  ' DEC(SUM( COALESCE(FC_MTOEXT,0) ),15,2) MTOEXT '
          +'FROM CAJA314 '
          +'WHERE (FPAGOID=''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') '
          +  ' AND FC_FCANC >= DATE('''+ xFECHAINICIO + ''') '
          +  ' AND FC_FCANC <= DATE('''+ xFECHAFIN + ''') '
          +  ' AND CIAID = '''+ xCIAID + ''' '
          +  ' AND FC_ESTADO = ''C'' '
          +'GROUP BY CPTOID, FPAGOID) '
   else
    if DM1.SRV_D = 'ORACLE' then
       xSQL:='INSERT INTO CAJARPT1_1 '
            +'(SELECT ''I'' EC_IE, '
            +  ' DECODE (NVL(CPTOID,NULL),NULL , ''XX'' , CPTOID ) DOCID, '
            +  ' FPAGOID, '
            +  ' TRUNC(SUM(NVL(FC_MTOLOC,0) ),2) MTOLOC, '
            +  ' TRUNC(SUM(NVL(FC_MTOEXT,0) ),2) MTOEXT '
            +'FROM CAJA314 '
            +'WHERE (FPAGOID=''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') '
            +  ' AND FC_FCANC >= TO_DATE('''+ xFECHAINICIO + ''') '
            +  ' AND FC_FCANC <= TO_DATE('''+ xFECHAFIN + ''') '
            +  ' AND CIAID = '''+ xCIAID + ''' '
            +  ' AND FC_ESTADO = ''C'' '
            +'GROUP BY CPTOID, FPAGOID) ';
   //** 10/10/2001 - pjsv
   try
    DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   end;
   //**

   //INSERTA DATOS EN CAJARPT2_1

   if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
       xSQL:='INSERT INTO CAJARPT2_1 '
            +'(SELECT DOCID, FPAGOID,EC_IE, '
            +  ' SUM( CASE WHEN FPAGOID=''01'' AND EC_IE=''I'' THEN COALESCE(MTOLOC,0) ELSE 0 END ) EFC_LOC_I, '
            +  ' SUM( CASE WHEN FPAGOID=''01'' AND EC_IE=''I'' THEN COALESCE(MTOEXT,0) ELSE 0 END ) EFC_EXT_I, '
            +  ' SUM( CASE WHEN FPAGOID=''02'' AND EC_IE=''I'' THEN COALESCE(MTOLOC,0) ELSE 0 END ) CHQ_LOC_I, '
            +  ' SUM( CASE WHEN FPAGOID=''02'' AND EC_IE=''I'' THEN COALESCE(MTOEXT,0) ELSE 0 END ) CHQ_EXT_I, '
            +  ' SUM( CASE WHEN FPAGOID=''04'' AND EC_IE=''I'' THEN COALESCE(MTOLOC,0) ELSE 0 END ) TJA_LOC_I, '
            +  ' SUM( CASE WHEN FPAGOID=''04'' AND EC_IE=''I'' THEN COALESCE(MTOEXT,0) ELSE 0 END ) TJA_EXT_I, '
            +  ' SUM( CASE WHEN FPAGOID=''01'' AND EC_IE=''E'' THEN COALESCE(MTOLOC,0) ELSE 0 END ) EFC_LOC_E, '
            +  ' SUM( CASE WHEN FPAGOID=''01'' AND EC_IE=''E'' THEN COALESCE(MTOEXT,0) ELSE 0 END ) EFC_EXT_E, '
            +  ' SUM( CASE WHEN FPAGOID=''02'' AND EC_IE=''E'' THEN COALESCE(MTOLOC,0) ELSE 0 END ) CHQ_LOC_E, '
            +  ' SUM( CASE WHEN FPAGOID=''02'' AND EC_IE=''E'' THEN COALESCE(MTOEXT,0) ELSE 0 END ) CHQ_EXT_E, '
            +  ' SUM( CASE WHEN FPAGOID=''04'' AND EC_IE=''E'' THEN COALESCE(MTOLOC,0) ELSE 0 END ) TJA_LOC_E, '
            +  ' SUM( CASE WHEN FPAGOID=''04'' AND EC_IE=''E'' THEN COALESCE(MTOEXT,0) ELSE 0 END ) TJA_EXT_E '
            +'FROM CAJARPT1_1 '
            +'GROUP BY DOCID, FPAGOID, EC_IE ) '
   else
	   if DM1.SRV_D = 'ORACLE' then
       xSQL:='INSERT INTO CAJARPT2_1 '
            +'(SELECT DOCID, FPAGOID,EC_IE, '
            +  ' SUM( DECODE(FPAGOID, ''01'' , DECODE( EC_IE, ''I'' , NVL(MTOLOC,0) , 0 ) , 0 ) ) EFC_LOC_I, '
            +  ' SUM( DECODE(FPAGOID, ''01'' , DECODE( EC_IE, ''I'' , NVL(MTOEXT,0) , 0 ) , 0 ) ) EFC_EXT_I, '
            +  ' SUM( DECODE(FPAGOID, ''02'' , DECODE( EC_IE, ''I'' , NVL(MTOLOC,0) , 0 ) , 0 ) ) CHQ_LOC_I, '
            +  ' SUM( DECODE(FPAGOID, ''02'' , DECODE( EC_IE, ''I'' , NVL(MTOEXT,0) , 0 ) , 0 ) ) CHQ_EXT_I, '
            +  ' SUM( DECODE(FPAGOID, ''04'' , DECODE( EC_IE, ''I'' , NVL(MTOLOC,0) , 0 ) , 0 ) ) TJA_LOC_I, '
            +  ' SUM( DECODE(FPAGOID, ''04'' , DECODE( EC_IE, ''I'' , NVL(MTOEXT,0) , 0 ) , 0 ) ) TJA_EXT_I, '
            +  ' SUM( DECODE(FPAGOID, ''01'' , DECODE( EC_IE, ''E'' , NVL(MTOLOC,0) , 0 ) , 0 ) ) EFC_LOC_E, '
            +  ' SUM( DECODE(FPAGOID, ''01'' , DECODE( EC_IE, ''E'' , NVL(MTOEXT,0) , 0 ) , 0 ) ) EFC_EXT_E, '
            +  ' SUM( DECODE(FPAGOID, ''02'' , DECODE( EC_IE, ''E'' , NVL(MTOLOC,0) , 0 ) , 0 ) ) CHQ_LOC_E, '
            +  ' SUM( DECODE(FPAGOID, ''02'' , DECODE( EC_IE, ''E'' , NVL(MTOEXT,0) , 0 ) , 0 ) ) CHQ_EXT_E, '
            +  ' SUM( DECODE(FPAGOID, ''04'' , DECODE( EC_IE, ''E'' , NVL(MTOLOC,0) , 0 ) , 0 ) ) TJA_LOC_E, '
            +  ' SUM( DECODE(FPAGOID, ''04'' , DECODE( EC_IE, ''E'' , NVL(MTOEXT,0) , 0 ) , 0 ) ) TJA_EXT_E '
            +'FROM CAJARPT1_1 '
            +'GROUP BY DOCID, FPAGOID, EC_IE ) ';
   //** 10/10/2001 - pjsv
   try
    DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   end;
   //**


   if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
     xSQL:='INSERT INTO CAJARPT2 '
          +'(SELECT DOCID, FPAGOID, EC_IE, '
          +  ' SUM( CASE WHEN FPAGOID=''01'' AND EC_IE=''I'' THEN COALESCE(MTOLOC,0) ELSE 0 END ) EFC_LOC_I, '
          +  ' SUM( CASE WHEN FPAGOID=''01'' AND EC_IE=''I'' THEN COALESCE(MTOEXT,0) ELSE 0 END ) EFC_EXT_I, '
          +  ' SUM( CASE WHEN FPAGOID=''02'' AND EC_IE=''I'' THEN COALESCE(MTOLOC,0) ELSE 0 END ) CHQ_LOC_I, '
          +  ' SUM( CASE WHEN FPAGOID=''02'' AND EC_IE=''I'' THEN COALESCE(MTOEXT,0) ELSE 0 END ) CHQ_EXT_I, '
          +  ' SUM( CASE WHEN FPAGOID=''04'' AND EC_IE=''I'' THEN COALESCE(MTOLOC,0) ELSE 0 END ) TJA_LOC_I, '
          +  ' SUM( CASE WHEN FPAGOID=''04'' AND EC_IE=''I'' THEN COALESCE(MTOEXT,0) ELSE 0 END ) TJA_EXT_I, '
          +  ' SUM( CASE WHEN FPAGOID=''01'' AND EC_IE=''E'' THEN COALESCE(MTOLOC,0) ELSE 0 END ) EFC_LOC_E, '
          +  ' SUM( CASE WHEN FPAGOID=''01'' AND EC_IE=''E'' THEN COALESCE(MTOEXT,0) ELSE 0 END ) EFC_EXT_E, '
          +  ' SUM( CASE WHEN FPAGOID=''02'' AND EC_IE=''E'' THEN COALESCE(MTOLOC,0) ELSE 0 END ) CHQ_LOC_E, '
          +  ' SUM( CASE WHEN FPAGOID=''02'' AND EC_IE=''E'' THEN COALESCE(MTOEXT,0) ELSE 0 END ) CHQ_EXT_E, '
          +  ' SUM( CASE WHEN FPAGOID=''04'' AND EC_IE=''E'' THEN COALESCE(MTOLOC,0) ELSE 0 END ) TJA_LOC_E, '
          +  ' SUM( CASE WHEN FPAGOID=''04'' AND EC_IE=''E'' THEN COALESCE(MTOEXT,0) ELSE 0 END ) TJA_EXT_E '
          +'FROM CAJARPT1 '
          +'GROUP BY DOCID, FPAGOID, EC_IE )'
   else
     if DM1.SRV_D = 'ORACLE' then
       xSQL:='INSERT INTO CAJARPT2 '
            +'(SELECT DOCID, FPAGOID, EC_IE, '
            +  ' SUM( DECODE(FPAGOID , ''01'' , DECODE( EC_IE , ''I'' , NVL(MTOLOC,0) , 0 ) , 0) ) EFC_LOC_I, '
            +  ' SUM( DECODE(FPAGOID , ''01'' , DECODE( EC_IE , ''I'' , NVL(MTOEXT,0) , 0 ) , 0) ) EFC_EXT_I, '
            +  ' SUM( DECODE(FPAGOID , ''02'' , DECODE( EC_IE , ''I'' , NVL(MTOLOC,0) , 0 ) , 0) ) CHQ_LOC_I, '
            +  ' SUM( DECODE(FPAGOID , ''02'' , DECODE( EC_IE , ''I'' , NVL(MTOEXT,0) , 0 ) , 0) ) CHQ_EXT_I, '
            +  ' SUM( DECODE(FPAGOID , ''04'' , DECODE( EC_IE , ''I'' , NVL(MTOLOC,0) , 0 ) , 0) ) TJA_LOC_I, '
            +  ' SUM( DECODE(FPAGOID , ''04'' , DECODE( EC_IE , ''I'' , NVL(MTOEXT,0) , 0 ) , 0) ) TJA_EXT_I, '
            +  ' SUM( DECODE(FPAGOID , ''01'' , DECODE( EC_IE , ''E'' , NVL(MTOLOC,0) , 0 ) , 0) ) EFC_LOC_E, '
            +  ' SUM( DECODE(FPAGOID , ''01'' , DECODE( EC_IE , ''E'' , NVL(MTOEXT,0) , 0 ) , 0) ) EFC_EXT_E, '
            +  ' SUM( DECODE(FPAGOID , ''02'' , DECODE( EC_IE , ''E'' , NVL(MTOLOC,0) , 0 ) , 0) ) CHQ_LOC_E, '
            +  ' SUM( DECODE(FPAGOID , ''02'' , DECODE( EC_IE , ''E'' , NVL(MTOEXT,0) , 0 ) , 0) ) CHQ_EXT_E, '
            +  ' SUM( DECODE(FPAGOID , ''04'' , DECODE( EC_IE , ''E'' , NVL(MTOLOC,0) , 0 ) , 0) ) TJA_LOC_E, '
            +  ' SUM( DECODE(FPAGOID , ''04'' , DECODE( EC_IE , ''E'' , NVL(MTOEXT,0) , 0 ) , 0) ) TJA_EXT_E '
            +'FROM CAJARPT1 '
            +'GROUP BY DOCID, FPAGOID, EC_IE )';

   //** 10/10/2001 - pjsv
   try
    DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   end;
   //**


// querys a utilizar qryREC y qryDescrip
// los clientdatasets relacionados son cdsQry y cdsQry2

   //ASIGNA SQL DE RECUPERACION DE RESUMEN DE CAJA
   if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
     xSQL:='SELECT CAJARPT2_1.DOCID, CAJA201.CPTOABR DOCABR, '
          +'  SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(EFC_LOC_I,0) ELSE 0 END ) EFC_LOC_I, '
          +'  SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(EFC_EXT_I,0) ELSE 0 END ) EFC_EXT_I, '
          +'  SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(CHQ_LOC_I,0) ELSE 0 END ) CHQ_LOC_I, '
          +'  SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(CHQ_EXT_I,0) ELSE 0 END ) CHQ_EXT_I, '
          +'  SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(TJA_LOC_I,0) ELSE 0 END ) TJA_LOC_I, '
          +'  SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(TJA_EXT_I,0) ELSE 0 END ) TJA_EXT_I, '
          +'  SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(EFC_LOC_E,0) ELSE 0 END ) EFC_LOC_E, '
          +'  SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(EFC_EXT_E,0) ELSE 0 END ) EFC_EXT_E, '
          +'  SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(CHQ_LOC_E,0) ELSE 0 END ) CHQ_LOC_E, '
          +'  SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(CHQ_EXT_E,0) ELSE 0 END ) CHQ_EXT_E, '
          +'  SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(TJA_LOC_E,0) ELSE 0 END ) TJA_LOC_E, '
          +'  SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(TJA_EXT_E,0) ELSE 0 END ) TJA_EXT_E, '
          +'  + SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(EFC_LOC_I,0) ELSE 0 END ) '
          +'  + SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(CHQ_LOC_I,0) ELSE 0 END ) '
          +'  + SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(TJA_LOC_I,0) ELSE 0 END ) TOTINGLOC, '
          +'  SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(EFC_EXT_I,0) ELSE 0 END ) '
          +'  + SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(CHQ_EXT_I,0) ELSE 0 END ) '
          +'  + SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(TJA_EXT_I,0) ELSE 0 END ) TOTINGEXT, '
          +'  SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(EFC_LOC_E,0) ELSE 0 END ) '
          +'  + SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(CHQ_LOC_E,0) ELSE 0 END ) '
          +'  + SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(TJA_LOC_E,0) ELSE 0 END ) TOTEGRLOC, '
          +'  SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(EFC_EXT_E,0) ELSE 0 END ) '
          +'  + SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(CHQ_EXT_E,0) ELSE 0 END ) '
          +'  + SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(TJA_EXT_E,0) ELSE 0 END ) TOTEGREXT '
          +'FROM CAJARPT2_1 '
          +'LEFT JOIN CAJA201 ON (CAJARPT2_1.DOCID = CAJA201.CPTOID ) '
          +'GROUP BY CAJARPT2_1.DOCID, CAJA201.CPTOABR '
          +'ORDER BY DOCID '
	 else
     if DM1.SRV_D = 'ORACLE' then
       xSQL:='SELECT CAJARPT2_1.DOCID, CAJA201.CPTOABR DOCABR, '
              +  'SUM( DECODE( EC_IE , ''I'' , NVL(EFC_LOC_I,0) , 0 ) ) EFC_LOC_I, '
              +  'SUM( DECODE( EC_IE , ''I'' , NVL(EFC_EXT_I,0) , 0 ) ) EFC_EXT_I, '
              +  'SUM( DECODE( EC_IE , ''I'' , NVL(CHQ_LOC_I,0) , 0 ) ) CHQ_LOC_I, '
              +  'SUM( DECODE( EC_IE , ''I'' , NVL(CHQ_EXT_I,0) , 0 ) ) CHQ_EXT_I, '
              +  'SUM( DECODE( EC_IE , ''I'' , NVL(TJA_LOC_I,0) , 0 ) ) TJA_LOC_I, '
              +  'SUM( DECODE( EC_IE , ''I'' , NVL(TJA_EXT_I,0) , 0 ) ) TJA_EXT_I, '
              +  'SUM( DECODE( EC_IE , ''E'' , NVL(EFC_LOC_E,0) , 0 ) ) EFC_LOC_E, '
              +  'SUM( DECODE( EC_IE , ''E'' , NVL(EFC_EXT_E,0) , 0 ) ) EFC_EXT_E, '
              +  'SUM( DECODE( EC_IE , ''E'' , NVL(CHQ_LOC_E,0) , 0 ) ) CHQ_LOC_E, '
              +  'SUM( DECODE( EC_IE , ''E'' , NVL(CHQ_EXT_E,0) , 0 ) ) CHQ_EXT_E, '
              +  'SUM( DECODE( EC_IE , ''E'' , NVL(TJA_LOC_E,0) , 0 ) ) TJA_LOC_E, '
              +  'SUM( DECODE( EC_IE , ''E'' , NVL(TJA_EXT_E,0) , 0 ) ) TJA_EXT_E, '
              +  'SUM( DECODE( EC_IE , ''I'' , NVL(EFC_LOC_I,0) , 0 ) ) '
              +  '+ SUM( DECODE( EC_IE , ''I'' , NVL(CHQ_LOC_I,0) , 0 ) ) '
              +  '+ SUM( DECODE( EC_IE , ''I'' , NVL(TJA_LOC_I,0) , 0 ) ) TOTINGLOC, '
              +  'SUM( DECODE( EC_IE , ''I'' , NVL(EFC_EXT_I,0) , 0 ) ) '
              +  '+ SUM( DECODE( EC_IE , ''I'' , NVL(CHQ_EXT_I,0) , 0 ) ) '
              +  '+ SUM( DECODE( EC_IE , ''I'' , NVL(TJA_EXT_I,0) , 0 ) ) TOTINGEXT, '
              +  'SUM( DECODE( EC_IE , ''E'' , NVL(EFC_LOC_E,0) , 0 ) ) '
              +  '+ SUM( DECODE( EC_IE , ''E'' , NVL(CHQ_LOC_E,0) , 0 ) ) '
              +  '+ SUM( DECODE( EC_IE , ''E'' , NVL(TJA_LOC_E,0) , 0 ) ) TOTEGRLOC, '
              +  'SUM( DECODE( EC_IE , ''E'' , NVL(EFC_EXT_E,0) , 0 ) ) '
              +  '+ SUM( DECODE( EC_IE , ''E'' , NVL(CHQ_EXT_E,0) , 0 ) ) '
              +  '+ SUM( DECODE( EC_IE , ''E'' , NVL(TJA_EXT_E,0) , 0 ) ) TOTEGREXT '
            +'FROM CAJARPT2_1, CAJA201 '
            +'WHERE (CAJARPT2_1.DOCID = CAJA201.CPTOID (+) ) '
            +'GROUP BY CAJARPT2_1.DOCID, CAJA201.CPTOABR '
            +'ORDER BY DOCID';
   DM1.cdsQry2.close;
   DM1.cdsQry2.DataRequest(xSQL) ;

   //ASIGNA DATOS DEL 1ER CLIENTDATASET DEL REPORTE

   if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
     xSQL:='SELECT '
          + 'CASE WHEN EC_PROCE = ''1'' THEN ''Egresos'' '
          +     ' WHEN EC_PROCE = ''3'' THEN ''Pago a Varios''  '
          +     ' WHEN EC_PROCE = ''B'' THEN ''Pago a Prov.'' END DOCABR , '
          +     ' TDIARID||''-''||ECNOCOMP ECFCOMP, TGE103.TMONABR, '
          +     ' CAJA302.ECGLOSA , '
          + 'CASE WHEN CAJA302.TMONID='''+DM1.wTMonLoc+''' THEN DEC( CAJA302.ECMTOLOC,15,2 ) END ECMTOLOC, '
          + 'CASE WHEN CAJA302.TMONID='''+DM1.wTMonExt+''' THEN DEC( CAJA302.ECMTOEXT,15,2 ) END ECMTOEXT, '
          + 'DEC( CAJA302.ECTCAMB,15,2 ) ECTCAMB, '
          + 'CAJA302.CLAUXID, CAJA302.PROV, CNT201.AUXNOMB, '
          + '''Egresos''  EC_IE '
          +'FROM CAJA302 '
          + ' LEFT JOIN TGE103 ON (CAJA302.TMONID=TGE103.TMONID) '
          + ' LEFT JOIN CNT201 ON (CAJA302.PROV=CNT201.AUXID AND CAJA302.CLAUXID=CNT201.CLAUXID ) '
          + ' INNER JOIN TGE112      ON (CAJA302.FPAGOID=TGE112.FPAGOID AND TGE112.F_MOVDIARIO=''S'' ) '
          +'WHERE ECFCOMP >= DATE('''+ xFECHAINICIO + ''') '
          + ' AND ECFCOMP <= DATE('''+ xFECHAFIN + ''') '
          + ' AND CIAID = ''' + xCIAID + ''' '
          + ' AND EC_IE = ''E'' '
          + ' AND CASE WHEN (RTRIM(CCBCOID)='''' OR (CCBCOID IS NULL)) THEN ''E'' ELSE COALESCE(ECCHKEST,''P'') END=''E'' '
          + ' AND ECESTADO = ''C'' '

          +'UNION ALL '

          +'SELECT SUBSTR(TGE110VW.DOCABR,1,1) DOCABR, '
          + '  CASE WHEN COALESCE(RTRIM(CXC303.CCSERIE),'''')<> '''' THEN ''-'' ELSE '''' END|| CXC303.CCNODOC ECFCOMP, '
          + '  TGE103.TMONABR, CXC303.CCGLOSA ECGLOSA, '
          + '  ECCOBLOC ECMTOLOC, '
          + '  ECCOBEXT ECMTOEXT, '
          + '  DEC( CXC303.NCOTCAMB,15,2 ) ECTCAMB, '
          + '  CXC303.CLAUXID, CXC303.CLIEID PROV, CNT201.AUXNOMB, '
          + '  ''Ingresos'' EC_IE  '
          +'FROM CXC303 '
          + ' LEFT JOIN TGE110VW ON (CXC303.DOCID =TGE110VW.DOCID) '
          + ' LEFT JOIN TGE103   ON (CXC303.TMONID=TGE103.TMONID) '
          + ' LEFT JOIN CNT201   ON (CXC303.CLIEID=CNT201.AUXID AND CXC303.CLAUXID=CNT201.CLAUXID ) '
          +'WHERE CCFEMIS >= DATE('''+ xFECHAINICIO + ''') '
          + ' AND CCFEMIS <= DATE('''+ xFECHAFIN + ''') '
          + ' AND CIAID = ''' + xCIAID + ''' '
          + ' AND NCOESTADO = ''C'' '
          + ' AND CCTREC IN (''NP'',''RC'') '
          +'ORDER BY 11,2,1 '
   else
    if DM1.SRV_D = 'ORACLE' then
       xSQL:='SELECT '
            + 'DECODE(EC_PROCE , ''1'' , ''Egresos'' '
            +      ' , EC_PROCE , ''3'' , ''Pago a Varios''  '
            +      ' , EC_PROCE , ''B'' , ''Pago a Prov.'' ) DOCABR , '
            +      ' TDIARID||''-''||ECNOCOMP ECFCOMP, TGE103.TMONABR, '
            +      ' CAJA302.ECGLOSA , '
            + 'DECODE(CAJA302.TMONID,'''+DM1.wTMonLoc+''' , TRUNC( CAJA302.ECMTOLOC,2 )) ECMTOLOC, '
            + 'DECODE(CAJA302.TMONID, '''+DM1.wTMonExt+''' , TRUNC( CAJA302.ECMTOEXT,2 )) ECMTOEXT, '
            + 'TRUNC(CAJA302.ECTCAMB,2) ECTCAMB, '
            + 'CAJA302.CLAUXID, CAJA302.PROV, CNT201.AUXNOMB, '
            + '''Egresos''  EC_IE '
            +'FROM CAJA302, TGE103, CNT201, TGE112 '
            +'WHERE ECFCOMP >= TO_DATE('''+ xFECHAINICIO + ''') '
            + ' AND ECFCOMP <= TO_DATE('''+ xFECHAFIN + ''') '
            + ' AND CIAID = '+quotedstr(xCIAID)
            + ' AND EC_IE = '+ quotedstr('E')
            + ' AND DECODE(TRIM(CCBCOID),NULL,''E'',NVL(ECCHKEST,''P''))=''E'' '
            + ' AND ECESTADO = ''C'' '
            + ' AND CAJA302.TMONID=TGE103.TMONID(+) '
            + ' AND CAJA302.PROV=CNT201.AUXID(+) '
            + ' AND CAJA302.CLAUXID=CNT201.CLAUXID(+) '
            + ' AND CAJA302.FPAGOID=TGE112.FPAGOID '
            +  ' AND TGE112.F_MOVDIARIO=''S'' '

            +'UNION ALL '
            //** 10/10/2001 - PJSV, PAR QUE EN EL REPOT. NO SALGA QUE NO EXISTE EL CAMPO
            //+'SELECT SUBSTR(TGE110VW.DOCABR,1,1), '
            +'SELECT SUBSTR(TGE110VW.DOCABR,1,1) DOCABR, '
            //**
            + '  DECODE(NVL(TRIM(CXC303.CCSERIE),null),null,''-'',null)||CXC303.CCNODOC ECFCOMP, '
            + '  TGE103.TMONABR, CXC303.CCGLOSA ECGLOSA, '
            + '  ECCOBLOC ECMTOLOC, '
            + '  ECCOBEXT ECMTOEXT, '
            + '  TRUNC( CXC303.NCOTCAMB, 2 ) ECTCAMB, '
            + '  CXC303.CLAUXID, CXC303.CLIEID PROV, CNT201.AUXNOMB, '
            + '  ''Ingresos'' EC_IE  '
            +'FROM CXC303, TGE110VW, TGE103, CNT201 '
            +'WHERE CCFEMIS >= TO_DATE('''+ xFECHAINICIO + ''') '
            + ' AND CCFEMIS <= TO_DATE('''+ xFECHAFIN + ''') '
            + ' AND CIAID = ''' + xCIAID + ''' '
            + ' AND NCOESTADO = ''C'' '
            + ' AND CCTREC IN (''NP'',''RC'') '
            + ' AND CXC303.DOCID =TGE110VW.DOCID (+) '
            + ' AND CXC303.TMONID=TGE103.TMONID (+) '
            + ' AND CXC303.CLIEID=CNT201.AUXID (+)'
            + ' AND CXC303.CLAUXID=CNT201.CLAUXID (+) '
            +'ORDER BY 11,2,1 ';
   DM1.cdsRec.Close;
   DM1.cdsRec.DataRequest(xSQL);
   DM1.cdsRec.Open;

   //ASIGNA SQL DE RECUPERACION DE RESUMEN DE CAJA
   ////////////////////////
   if (DM1.SRV_D = 'DB2NT') or (DM1.SRV_D = 'DB2400') then
     xSQL:='SELECT CASE WHEN LENGTH(CAJARPT2.DOCID)<=2 THEN CAJARPT2.DOCID END DOCID, '
          +   'COALESCE(SUBSTR(TGE110VW.DOCABR,1,1),CAJARPT2.DOCID) DOCABR, '
          +' SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(EFC_LOC_I,0) ELSE 0 END ) EFC_LOC_I,                                  '
          +' SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(EFC_EXT_I,0) ELSE 0 END ) EFC_EXT_I,                                  '
          +' SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(CHQ_LOC_I,0) ELSE 0 END) CHQ_LOC_I,'
          +' SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(CHQ_EXT_I,0) ELSE 0 END) CHQ_EXT_I,'
          +' SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(TJA_LOC_I,0) ELSE 0 END) TJA_LOC_I,'
          +' SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(TJA_EXT_I,0) ELSE 0 END) TJA_EXT_I,'
          +' SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(EFC_LOC_E,0) ELSE 0 END) EFC_LOC_E,'
          +' SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(EFC_EXT_E,0) ELSE 0 END) EFC_EXT_E,'
          +' SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(CHQ_LOC_E,0) ELSE 0 END) CHQ_LOC_E,'
          +' SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(CHQ_EXT_E,0) ELSE 0 END) CHQ_EXT_E,'
          +' SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(TJA_LOC_E,0) ELSE 0 END) TJA_LOC_E,'
          +' SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(TJA_EXT_E,0) ELSE 0 END) TJA_EXT_E,'

          +' SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(EFC_LOC_I,0) ELSE 0 END ) + '
          +' SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(CHQ_LOC_I,0) ELSE 0 END ) + '
          +' SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(TJA_LOC_I,0) ELSE 0 END ) TOTINGLOC, '
          +' SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(EFC_EXT_I,0) ELSE 0 END ) + '
          +' SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(CHQ_EXT_I,0) ELSE 0 END ) + '
          +' SUM( CASE WHEN EC_IE=''I'' THEN COALESCE(TJA_EXT_I,0) ELSE 0 END) TOTINGEXT, '

          +' SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(EFC_LOC_E,0) ELSE 0 END) + '
          +' SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(CHQ_LOC_E,0) ELSE 0 END) + '
          +' SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(TJA_LOC_E,0) ELSE 0 END) TOTEGRLOC , '
          +' SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(EFC_EXT_E,0) ELSE 0 END) + '
          +' SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(CHQ_EXT_E,0) ELSE 0 END) + '
          +' SUM( CASE WHEN EC_IE=''E'' THEN COALESCE(TJA_EXT_E,0) ELSE 0 END) TOTEGREXT '

          +' FROM CAJARPT2 '
          +  ' LEFT JOIN TGE110VW ON (CAJARPT2.DOCID = TGE110VW.DOCID ) '
          +' GROUP BY CAJARPT2.DOCID, TGE110VW.DOCABR '
          +' ORDER BY DOCID '
   else
     if DM1.SRV_D = 'ORACLE' then
       xSQL:='SELECT DECODE( LEAST(CAJARPT2.DOCID,3) , 3 , CAJARPT2.DOCID ) DOCID, '
            +  ' NVL(SUBSTR(TGE110VW.DOCABR,1,1), CAJARPT2.DOCID) DOCABR, '
            +  ' SUM( DECODE( EC_IE , ''I'' , NVL(EFC_LOC_I,0) , 0 )) EFC_LOC_I,                                  '
            +  ' SUM( DECODE( EC_IE , ''I'' , NVL(EFC_EXT_I,0) , 0 )) EFC_EXT_I,                                  '
            +  ' SUM( DECODE( EC_IE , ''I'' , NVL(CHQ_LOC_I,0) , 0 )) CHQ_LOC_I,'
            +  ' SUM( DECODE( EC_IE , ''I'' , NVL(CHQ_EXT_I,0) , 0 )) CHQ_EXT_I,'
            +  ' SUM( DECODE( EC_IE , ''I'' , NVL(TJA_LOC_I,0) , 0 )) TJA_LOC_I,'
            +  ' SUM( DECODE( EC_IE , ''I'' , NVL(TJA_EXT_I,0) , 0 )) TJA_EXT_I,'
            +  ' SUM( DECODE( EC_IE , ''E'' , NVL(EFC_LOC_E,0) , 0 )) EFC_LOC_E,'
            +  ' SUM( DECODE( EC_IE , ''E'' , NVL(EFC_EXT_E,0) , 0 )) EFC_EXT_E,'
            +  ' SUM( DECODE( EC_IE , ''E'' , NVL(CHQ_LOC_E,0) , 0 )) CHQ_LOC_E,'
            +  ' SUM( DECODE( EC_IE , ''E'' , NVL(CHQ_EXT_E,0) , 0 )) CHQ_EXT_E,'
            +  ' SUM( DECODE( EC_IE , ''E'' , NVL(TJA_LOC_E,0) , 0 )) TJA_LOC_E,'
            +  ' SUM( DECODE( EC_IE , ''E'' , NVL(TJA_EXT_E,0) , 0 )) TJA_EXT_E,'

            +  ' SUM( DECODE( EC_IE , ''I'' , NVL(EFC_LOC_I,0) , 0 )) + '
            +  ' SUM( DECODE( EC_IE , ''I'' , NVL(CHQ_LOC_I,0) , 0 )) + '
            +  ' SUM( DECODE( EC_IE , ''I'' , NVL(TJA_LOC_I,0) , 0 )) TOTINGLOC, '
            +  ' SUM( DECODE( EC_IE , ''I'' , NVL(EFC_EXT_I,0) , 0 )) + '
            +  ' SUM( DECODE( EC_IE , ''I'' , NVL(CHQ_EXT_I,0) , 0 )) + '
            +  ' SUM( DECODE( EC_IE , ''I'' , NVL(TJA_EXT_I,0) , 0 )) TOTINGEXT, '

            +  ' SUM( DECODE( EC_IE , ''E'' , NVL(EFC_LOC_E,0) , 0 )) + '
            +  ' SUM( DECODE( EC_IE , ''E'' , NVL(CHQ_LOC_E,0) , 0 )) + '
            +  ' SUM( DECODE( EC_IE , ''E'' , NVL(TJA_LOC_E,0) , 0 )) TOTEGRLOC , '
            +  ' SUM( DECODE( EC_IE , ''E'' , NVL(EFC_EXT_E,0) , 0 )) + '
            +  ' SUM( DECODE( EC_IE , ''E'' , NVL(CHQ_EXT_E,0) , 0 )) + '
            +  ' SUM( DECODE( EC_IE , ''E'' , NVL(TJA_EXT_E,0) , 0 )) TOTEGREXT '

            +' FROM CAJARPT2, TGE110VW '
            +' WHERE (CAJARPT2.DOCID = TGE110VW.DOCID (+) ) '
            +' GROUP BY CAJARPT2.DOCID, TGE110VW.DOCABR '
            +' ORDER BY DOCID ';
   dm1.cdsDescrip.Close;
   DM1.cdsDescrip.dataRequest(xSQL) ;
   dm1.cdsDescrip.Open;
end;



end.

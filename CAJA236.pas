unit Caja236 ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, StdCtrls, wwdblook, Buttons, ExtCtrls, ppReport,
  ppStrtch, ppSubRpt, ppBands, ppCtrls, ppClass, ppPrnabl, ppProd, ppComm,
  ppRelatv, ppCache, ppDB, ppDBPipe, ppDBBDE, db;

type
  TFResumenCPTO = class(TForm)
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
    ppDBResumen2: TppDBPipeline;
    ppReport5: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLine5: TppLine;
    ppLabel36: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel37: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppLine6: TppLine;
    ppDBCalc28: TppDBCalc;
    ppDBCalc29: TppDBCalc;
    ppDBCalc30: TppDBCalc;
    procedure dbdtpFinExit(Sender: TObject);
    procedure dbdtpInicioExit(Sender: TObject);
    procedure dblcCiaChange(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure z2bbtnSalirClick(Sender: TObject);
    procedure z2bbtnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    { Private declarations }
    procedure AsignaSQLResumenConcepto(const xCIAID, xFECHAINICIO, xFECHAFIN: String);
  public
    { Public declarations }
  end;

var
  FResumenCPTO: TFResumenCPTO;

implementation

uses CajaDM, CajaUtil;

{$R *.DFM}

procedure TFResumenCPTO.dbdtpFinExit(Sender: TObject);
begin
    if dbdtpFin.Date = 0 then
    begin
       dbdtpFin.Date :=tDate( Now);
    end;
    if dbdtpInicio.Date > dbdtpFin.Date then
       dbdtpInicio.Date:=dbdtpFin.Date;
end;

procedure TFResumenCPTO.dbdtpInicioExit(Sender: TObject);
begin
    if dbdtpInicio.Date = 0 then
    begin
       dbdtpInicio.Date :=tDate( Now);
    end;
    if dbdtpInicio.Date > dbdtpFin.Date then
       dbdtpFin.Date:=dbdtpInicio.Date;

end;

procedure TFResumenCPTO.dblcCiaChange(Sender: TObject);
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


procedure TFResumenCPTO.dblcCiaExit(Sender: TObject);
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
procedure TFResumenCPTO.FormShow(Sender: TObject);
begin
    RecuperarCiaUnica(dblcCia,edtCia) ;
    dbdtpInicio.Date := DateS ;
    dbdtpFin.Date := DateS ;
end;

procedure TFResumenCPTO.z2bbtnSalirClick(Sender: TObject);
begin
   Close ;
end;

procedure TFResumenCPTO.z2bbtnOkClick(Sender: TObject);
var
   FInicio ,
   FFin : string ;
begin
{
procedure TSOLsrvCAJA.AsignaSQLArqueoCaja(var xCIAID, xFECHAINICIO,
  xFECHAFIN: WideString);
}
   FInicio :=  FechaDB2 (dbdtpINicio.Date) ;
   FFin := FechaDB2 (dbdtpfin.Date) ;
   AsignaSQLResumenConcepto ( dblcCia.Text , FInicio , FFin ) ;
   DMTE.cdsQRY2.Active := False ;
   DMTE.cdsQRY2.Active := True ;
   ppDBResumen2.DataSource := DMTE.dsQRY2 ;

   if DMTE.cdsqry2.RecordCount = 0 then
      Raise Exception.create('No hay datos por Mostrar para el rango seleccionado') ;

   ppreport5.Print ;

   ppDBResumen2.DataSource := nil ;

End;

procedure TFResumenCPTO.AsignaSQLResumenConcepto(const xCIAID, xFECHAINICIO, xFECHAFIN: String);
var xSQL : String ;
begin
   //PROCEDIMIENTO PREVIO AL RESUMEN DEL ARQUEO DE CAJA
   xSQL := 'DELETE FROM CAJARPT1_1' ;
   //** 04/07/2001 - pjsv
   try
    DMTE.DCOM1.AppServer.EjecutaSQL(xSQL) ;
   except
   end;
   //**

   xSQL := 'DELETE FROM CAJARPT2_1' ;
   //** 10/10/2001 - pjsv
   try
    DMTE.DCOM1.AppServer.EjecutaSQL(xSQL) ;
   except
   end;


   //INSERTA DATOS EN CAJARPT1_1
   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
     xSQL := 'INSERT INTO CAJARPT1_1 '
             + '(SELECT EC_IE, '
             +   'CASE WHEN LENGTH(RTRIM(COALESCE(CPTOID,'''')))=0 THEN ''XX''ELSE CPTOID END DOCID, '
             +   'FPAGOID, '
             +   'CASE WHEN TMONID ='''+DMTE.wTMonLoc+''' THEN DEC(SUM( COALESCE(ECMTOLOC,0) ),15,2) END MTOLOC,'
             +   'CASE WHEN TMONID ='''+DMTE.wTMonExt+''' THEN DEC(SUM( COALESCE(ECMTOEXT,0) ),15,2) END MTOEXT'
             + ' FROM CAJA302'
             + ' WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') AND'
             +   ' ECFCOMP >= DATE('''+ xFECHAINICIO + ''') AND'
             +   ' ECFCOMP <= DATE('''+ xFECHAFIN + ''') AND'
             +   ' CIAID = '''+ xCIAID + ''' AND'
             +   ' EC_IE = ''E'' AND'
             +   ' CASE WHEN RTRIM(COALESCE(CCBCOID,'''')) = '''' THEN ''E'' ELSE COALESCE(ECCHKEST,''P'') END = ''E'' AND '
             +   ' ECESTADO = ''C'''
             + ' GROUP BY EC_IE, CPTOID, FPAGOID,TMONID)'
   else
     if DMTE.SRV_D = 'ORACLE' then
       xSQL := 'INSERT INTO CAJARPT1_1 '
               + '(SELECT EC_IE, '
               +   'DECODE(LENGTH(TRIM(NVL(CPTOID,null))), 0 , ''XX'', CPTOID ) DOCID, '
               +   'FPAGOID, '
               +   'DECODE(TMONID,'''+DMTE.wTMonLoc+''' , TRUNC(SUM(nvl(ECMTOLOC,0)),2) ) MTOLOC,'
               +   'DECODE(TMONID,'''+DMTE.wTMonExt+''' , TRUNC(SUM(nvl(ECMTOEXT,0)),2) ) MTOEXT'
               + ' FROM CAJA302'
               + ' WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') AND'
               +   ' ECFCOMP >= TO_DATE('''+ xFECHAINICIO + ''') AND'
               +   ' ECFCOMP <= TO_DATE('''+ xFECHAFIN + ''') AND'
               +   ' CIAID = '''+ xCIAID + ''' AND'
               +   ' EC_IE = ''E'' AND'
               +   ' DECODE(TRIM(nvl(CCBCOID,null)),null,''E'',nvl(ECCHKEST,''P'')) = ''E'' AND '
               +   ' ECESTADO = ''C'''
               + ' GROUP BY EC_IE, CPTOID, FPAGOID,TMONID)';
   //** 10/10/2001 - pjsv
   try
    DMTE.DCOM1.AppServer.EjecutaSQL(xSQL) ;
   except
   end;
   //**

   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
     xSQL :=   'INSERT INTO CAJARPT1_1'
             + ' (SELECT ''I'' EC_IE,'
             +   ' CASE WHEN LENGTH(RTRIM(COALESCE(CPTOID,'''')))=0 THEN ''XX'' ELSE CPTOID END DOCID,'
             +   ' FPAGOID,'
             +   ' CASE WHEN TMONID='''+DMTE.wTMonLoc+''' THEN DEC(SUM( COALESCE(FC_MTOLOC,0) ),15,2) END MTOLOC, '
             +   ' CASE WHEN TMONID='''+DMTE.wTMonExt+''' THEN DEC(SUM( COALESCE(FC_MTOEXT,0) ),15,2) END MTOEXT '
             + ' FROM caja314'
             + ' WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') AND'
             +   ' FC_FCANC >= DATE('''+ xFECHAINICIO + ''') AND'
             +   ' FC_FCANC <= DATE('''+ xFECHAFIN + ''') AND'
             +   ' CIAID = '''+ xCIAID + ''' AND'
             +   ' FC_ESTADO = ''C'''
             + ' GROUP BY CPTOID, FPAGOID,TMONID)'
   else
    if DMTE.SRV_D = 'ORACLE' then
       xSQL :=   'INSERT INTO CAJARPT1_1'
               + ' (SELECT ''I'' EC_IE,'
               +   ' DECODE(LENGTH(TRIM(nvl(CPTOID,null))), 0 , ''XX'' , CPTOID ) DOCID,'
               +   ' FPAGOID,'
               +   ' DECODE( TMONID , '''+DMTE.wTMonLoc+''' , TRUNC(SUM(nvl(FC_MTOLOC,0) ),2) ) MTOLOC, '
               +   ' DECODE( TMONID , '''+DMTE.wTMonExt+''' , TRUNC(SUM(nvl(FC_MTOEXT,0) ),2) ) MTOEXT '
               + ' FROM CAJA314'
               + ' WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') AND'
               +   ' FC_FCANC >= TO_DATE('''+ xFECHAINICIO + ''') AND'
               +   ' FC_FCANC <= TO_DATE('''+ xFECHAFIN + ''') AND'
               +   ' CIAID = '''+ xCIAID + ''' AND'
               +   ' FC_ESTADO = ''C'''
               + ' GROUP BY CPTOID, FPAGOID,TMONID)' ;
   //** 10/10/2001 - pjsv
   try
    DMTE.DCOM1.AppServer.EjecutaSQL(xSQL) ;
   except
   end;
   //**

   //INSERTA DATOS EN CAJARPT2_1
   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
     xSQL :=  ' INSERT INTO CAJARPT2_1'
             +' (SELECT DOCID,FPAGOID,EC_IE,'
             +  ' SUM(CASE WHEN FPAGOID=''01'' AND EC_IE=''I'' THEN COALESCE(MTOLOC,0) ELSE 0 END ) EFC_LOC_I,'
             +  ' SUM(CASE WHEN FPAGOID=''01'' AND EC_IE=''I'' THEN COALESCE(MTOEXT,0) ELSE 0 END ) EFC_EXT_I,'
             +  ' SUM(CASE WHEN FPAGOID=''02'' AND EC_IE=''I'' THEN COALESCE(MTOLOC,0) ELSE 0 END) CHQ_LOC_I,'
             +  ' SUM(CASE WHEN FPAGOID=''02'' AND EC_IE=''I'' THEN COALESCE(MTOEXT,0) ELSE 0 END) CHQ_EXT_I,'
             +  ' SUM(CASE WHEN FPAGOID=''04'' AND EC_IE=''I'' THEN COALESCE(MTOLOC,0) ELSE 0 END) TJA_LOC_I,'
             +  ' SUM(CASE WHEN FPAGOID=''04'' AND EC_IE=''I'' THEN COALESCE(MTOEXT,0) ELSE 0 END) TJA_EXT_I,'
             +  ' SUM(CASE WHEN FPAGOID=''01'' AND EC_IE=''E'' THEN COALESCE(MTOLOC,0) ELSE 0 END) EFC_LOC_E,'
             +  ' SUM(CASE WHEN FPAGOID=''01'' AND EC_IE=''E'' THEN COALESCE(MTOEXT,0) ELSE 0 END) EFC_EXT_E,'
             +  ' SUM(CASE WHEN FPAGOID=''02'' AND EC_IE=''E'' THEN COALESCE(MTOLOC,0) ELSE 0 END) CHQ_LOC_E,'
             +  ' SUM(CASE WHEN FPAGOID=''02'' AND EC_IE=''E'' THEN COALESCE(MTOEXT,0) ELSE 0 END) CHQ_EXT_E,'
             +  ' SUM(CASE WHEN FPAGOID=''04'' AND EC_IE=''E'' THEN COALESCE(MTOLOC,0) ELSE 0 END) TJA_LOC_E,'
             +  ' SUM(CASE WHEN FPAGOID=''04'' AND EC_IE=''E'' THEN COALESCE(MTOEXT,0) ELSE 0 END) TJA_EXT_E'
             +' FROM CAJARPT1_1'
             +' GROUP BY DOCID , FPAGOID , EC_IE)'
   else
    if DMTE.SRV_D = 'ORACLE' then
         xSQL:= ' INSERT INTO CAJARPT2_1'
               +' (SELECT DOCID,FPAGOID,EC_IE,'
               +  ' SUM( DECODE(FPAGOID, ''01'', DECODE(EC_IE, ''I'', NVL(MTOLOC,0), 0), 0)) EFC_LOC_I, '
               +  ' SUM( DECODE(FPAGOID, ''01'', DECODE(EC_IE, ''I'', NVL(MTOEXT,0), 0), 0)) EFC_EXT_I, '
               +  ' SUM( DECODE(FPAGOID, ''02'', DECODE(EC_IE, ''I'', NVL(MTOLOC,0), 0), 0)) CHQ_LOC_I, '
               +  ' SUM( DECODE(FPAGOID, ''02'', DECODE(EC_IE, ''I'', NVL(MTOEXT,0), 0), 0)) CHQ_EXT_I, '
               +  ' SUM( DECODE(FPAGOID, ''04'', DECODE(EC_IE, ''I'', NVL(MTOLOC,0), 0), 0)) TJA_LOC_I, '
               +  ' SUM( DECODE(FPAGOID, ''04'', DECODE(EC_IE, ''I'', NVL(MTOEXT,0), 0), 0)) TJA_EXT_I, '
               +  ' SUM( DECODE(FPAGOID, ''01'', DECODE(EC_IE, ''E'', NVL(MTOLOC,0), 0), 0)) EFC_LOC_E, '
               +  ' SUM( DECODE(FPAGOID, ''01'', DECODE(EC_IE, ''E'', NVL(MTOEXT,0), 0), 0)) EFC_EXT_E, '
               +  ' SUM( DECODE(FPAGOID, ''02'', DECODE(EC_IE, ''E'', NVL(MTOLOC,0), 0), 0)) CHQ_LOC_E, '
               +  ' SUM( DECODE(FPAGOID, ''02'', DECODE(EC_IE, ''E'', NVL(MTOEXT,0), 0), 0)) CHQ_EXT_E, '
               +  ' SUM( DECODE(FPAGOID, ''04'', DECODE(EC_IE, ''E'', NVL(MTOLOC,0), 0), 0)) TJA_LOC_E, '
               +  ' SUM( DECODE(FPAGOID, ''04'', DECODE(EC_IE, ''E'', NVL(MTOEXT,0), 0), 0)) TJA_EXT_E'
               +' FROM CAJARPT1_1'
               +' GROUP BY DOCID , FPAGOID , EC_IE)' ;
   //** 10/10/2001 - pjsv
   try
    DMTE.DCOM1.AppServer.EjecutaSQL(xSQL) ;
   except
   end;
   //**

   //ASIGNA SQL DE RECUPERACION DE RESUMEN DE CAJA
   ////////////////////////
   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
     xSQL :=  'SELECT CAJARPT2_1.DOCID,CAJA201.CPTOABR DOCABR,'
              + ' SUM(CASE WHEN EC_IE=''I'' THEN COALESCE(EFC_LOC_I,0) ELSE 0 END) EFC_LOC_I,'
              + ' SUM(CASE WHEN EC_IE=''I'' THEN COALESCE(EFC_EXT_I,0) ELSE 0 END) EFC_EXT_I,'
              + ' SUM(CASE WHEN EC_IE=''I'' THEN COALESCE(CHQ_LOC_I,0) ELSE 0 END) CHQ_LOC_I,'
              + ' SUM(CASE WHEN EC_IE=''I'' THEN COALESCE(CHQ_EXT_I,0) ELSE 0 END) CHQ_EXT_I,'
              + ' SUM(CASE WHEN EC_IE=''I'' THEN COALESCE(TJA_LOC_I,0) ELSE 0 END) TJA_LOC_I,'
              + ' SUM(CASE WHEN EC_IE=''I'' THEN COALESCE(TJA_EXT_I,0) ELSE 0 END) TJA_EXT_I,'
              + ' SUM(CASE WHEN EC_IE=''E'' THEN COALESCE(EFC_LOC_E,0) ELSE 0 END) EFC_LOC_E,'
              + ' SUM(CASE WHEN EC_IE=''E'' THEN COALESCE(EFC_EXT_E,0) ELSE 0 END) EFC_EXT_E,'
              + ' SUM(CASE WHEN EC_IE=''E'' THEN COALESCE(CHQ_LOC_E,0) ELSE 0 END) CHQ_LOC_E,'
              + ' SUM(CASE WHEN EC_IE=''E'' THEN COALESCE(CHQ_EXT_E,0) ELSE 0 END) CHQ_EXT_E,'
              + ' SUM(CASE WHEN EC_IE=''E'' THEN COALESCE(TJA_LOC_E,0) ELSE 0 END) TJA_LOC_E,'
              + ' SUM(CASE WHEN EC_IE=''E'' THEN COALESCE(TJA_EXT_E,0) ELSE 0 END) TJA_EXT_E,'
              + ' SUM(CASE WHEN EC_IE=''I'' THEN COALESCE(EFC_LOC_I,0) ELSE 0 END) + '
              + ' SUM(CASE WHEN EC_IE=''I'' THEN COALESCE(CHQ_LOC_I,0) ELSE 0 END) + '
              + ' SUM(CASE WHEN EC_IE=''I'' THEN COALESCE(TJA_LOC_I,0) ELSE 0 END) TOTINGLOC ,'
              + ' SUM(CASE WHEN EC_IE=''I'' THEN COALESCE(EFC_EXT_I,0) ELSE 0 END) + '
              + ' SUM(CASE WHEN EC_IE=''I'' THEN COALESCE(CHQ_EXT_I,0) ELSE 0 END) + '
              + ' SUM(CASE WHEN EC_IE=''I'' THEN COALESCE(TJA_EXT_I,0) ELSE 0 END) TOTINGEXT ,'
              + ' SUM(CASE WHEN EC_IE=''E'' THEN COALESCE(EFC_LOC_E,0) ELSE 0 END) + '
              + ' SUM(CASE WHEN EC_IE=''E'' THEN COALESCE(CHQ_LOC_E,0) ELSE 0 END) + '
              + ' SUM(CASE WHEN EC_IE=''E'' THEN COALESCE(TJA_LOC_E,0) ELSE 0 END) TOTEGRLOC ,'
              + ' SUM(CASE WHEN EC_IE=''E'' THEN COALESCE(EFC_EXT_E,0) ELSE 0 END) + '
              + ' SUM(CASE WHEN EC_IE=''E'' THEN COALESCE(CHQ_EXT_E,0) ELSE 0 END) + '
              + ' SUM(CASE WHEN EC_IE=''E'' THEN COALESCE(TJA_EXT_E,0) ELSE 0 END) TOTEGREXT '
              + ' FROM CAJARPT2_1 '
                + ' LEFT JOIN CAJA201 ON (CAJARPT2_1.DOCID = CAJA201.CPTOID ) '
              + ' GROUP BY CAJARPT2_1.DOCID ,CAJA201.CPTOABR '
              + ' ORDER BY DOCID'
   else
    if DMTE.SRV_D = 'ORACLE' then
       xSQL :=  'SELECT CAJARPT2_1.DOCID,CAJA201.CPTOABR DOCABR,'
                + ' SUM(DECODE( EC_IE , ''I'' , NVL(EFC_LOC_I,0) , 0 )  ) EFC_LOC_I,'
                + ' SUM(DECODE( EC_IE , ''I'' , NVL(EFC_EXT_I,0) , 0 )  ) EFC_EXT_I,'
                + ' SUM(DECODE( EC_IE , ''I'' , NVL(CHQ_LOC_I,0) , 0 )  ) CHQ_LOC_I,'
                + ' SUM(DECODE( EC_IE , ''I'' , NVL(CHQ_EXT_I,0) , 0 )  ) CHQ_EXT_I,'
                + ' SUM(DECODE( EC_IE , ''I'' , NVL(TJA_LOC_I,0) , 0 )  ) TJA_LOC_I,'
                + ' SUM(DECODE( EC_IE , ''I'' , NVL(TJA_EXT_I,0) , 0 )  ) TJA_EXT_I,'
                + ' SUM(DECODE( EC_IE , ''E'' , NVL(EFC_LOC_E,0) , 0 )  ) EFC_LOC_E,'
                + ' SUM(DECODE( EC_IE , ''E'' , NVL(EFC_EXT_E,0) , 0 )  ) EFC_EXT_E,'
                + ' SUM(DECODE( EC_IE , ''E'' , NVL(CHQ_LOC_E,0) , 0 )  ) CHQ_LOC_E,'
                + ' SUM(DECODE( EC_IE , ''E'' , NVL(CHQ_EXT_E,0) , 0 )  ) CHQ_EXT_E,'
                + ' SUM(DECODE( EC_IE , ''E'' , NVL(TJA_LOC_E,0) , 0 )  ) TJA_LOC_E,'
                + ' SUM(DECODE( EC_IE , ''E'' , NVL(TJA_EXT_E,0) , 0 )  ) TJA_EXT_E,'
                + ' SUM(DECODE( EC_IE , ''I'' , NVL(EFC_LOC_I,0) , 0 )  ) + '
                + ' SUM(DECODE( EC_IE , ''I'' , NVL(CHQ_LOC_I,0) , 0 )  ) + '
                + ' SUM(DECODE( EC_IE , ''I'' , NVL(TJA_LOC_I,0) , 0 )  ) TOTINGLOC ,'
                + ' SUM(DECODE( EC_IE , ''I'' , NVL(EFC_EXT_I,0) , 0 )  ) + '
                + ' SUM(DECODE( EC_IE , ''I'' , NVL(CHQ_EXT_I,0) , 0 )  ) + '
                + ' SUM(DECODE( EC_IE , ''I'' , NVL(TJA_EXT_I,0) , 0 )  ) TOTINGEXT ,'
                + ' SUM(DECODE( EC_IE , ''E'' , NVL(EFC_LOC_E,0) , 0 )  ) + '
                + ' SUM(DECODE( EC_IE , ''E'' , NVL(CHQ_LOC_E,0) , 0 )  ) + '
                + ' SUM(DECODE( EC_IE , ''E'' , NVL(TJA_LOC_E,0) , 0 )  ) TOTEGRLOC ,'
                + ' SUM(DECODE( EC_IE , ''E'' , NVL(EFC_EXT_E,0) , 0 )  ) + '
                + ' SUM(DECODE( EC_IE , ''E'' , NVL(CHQ_EXT_E,0) , 0 )  ) + '
                + ' SUM(DECODE( EC_IE , ''E'' , NVL(TJA_EXT_E,0) , 0 )  ) TOTEGREXT '
                + ' FROM CAJARPT2_1, CAJA201 '
                + ' WHERE (CAJARPT2_1.DOCID = CAJA201.CPTOID (+)) '
                + ' GROUP BY CAJARPT2_1.DOCID, CAJA201.CPTOABR '
                + ' ORDER BY DOCID';
   DMTE.cdsQry2.dataRequest(xSQL) ;
end;


procedure TFResumenCPTO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TFResumenCPTO.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFResumenCPTO.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.

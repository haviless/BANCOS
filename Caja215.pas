unit Caja215;

// Actualizaciones
// HPC_201403_CAJA cambia control de diseño de reporte

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, wwdbedit, StdCtrls, wwdblook, Buttons, ExtCtrls, ppBands, ppRelatv,
  ppCache, ppClass, ppComm, ppProd, ppReport, ppPrnabl, ppCtrls, ppDB,
  ppDBPipe, ppVar, Db, Wwdatsrc, DBTables, Wwquery, ppEndUsr, ppViewr, ppTypes,
  wwdbdatetimepicker,CAJADM, Grids, Wwdbigrd, Wwdbgrid, ppStrtch, ppSubRpt,
  ppParameter, DBGrids;

type
  TFChequesEmitidos = class(TForm)
    pnlRegComp: TPanel;
    lblReporte: TLabel;
    z2bbtnOk: TBitBtn;
    z2bbtnBorra: TBitBtn;
    pnlDatos1: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    pprChqEmitidos: TppReport;
    ppdbChqEmitidosS: TppDBPipeline;
    Label2: TLabel;
    dbdtpFin: TwwDBDateTimePicker;
    Label3: TLabel;
    dbdtpInicio: TwwDBDateTimePicker;
    ppdbChqEmitidosD: TppDBPipeline;
    chbGerencia: TCheckBox;
    ppd1: TppDesigner;
    ppParameterList1: TppParameterList;
    BitBtn1: TBitBtn;
    dtgData: TDBGrid;
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
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    pplblLocal: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppdbtFechaS: TppDBText;
    ppdbtGiradoS: TppDBText;
    ppdbtGlosaS: TppDBText;
    ppdbtChequeS: TppDBText;
    ppdbtMonedaS: TppDBText;
    ppdbtMontoS: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppdbcMontoS: TppDBCalc;
    ppLabel4: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    pplblDiario: TppLabel;
    pplblBancoS: TppLabel;
    pplblCuentaS: TppLabel;
    ppdbtDiarioS: TppDBText;
    ppdbtBancoS: TppDBText;
    ppdbtCuentaS: TppDBText;
    pplblFechaS: TppLabel;
    pplblGiradoS: TppLabel;
    pplblGlosaS: TppLabel;
    pplblChequeS: TppLabel;
    pplblMonedaS: TppLabel;
    pplblMontoS: TppLabel;
    ppLabel2: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand3: TppTitleBand;
    pplblExtranjero: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppdbtMontoD: TppDBText;
    ppdbtMonedaD: TppDBText;
    ppdbtChequeD: TppDBText;
    ppdbtGlosaD: TppDBText;
    ppdbtGiradoD: TppDBText;
    ppdbtFechaD: TppDBText;
    ppdbtCorreD: TppDBText;
    ppDBText3: TppDBText;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    pplblDiarioD: TppLabel;
    pplblBancoD: TppLabel;
    pplblCuentaD: TppLabel;
    ppdbtDiarioD: TppDBText;
    ppdbtBancoD: TppDBText;
    ppdbtCuentaD: TppDBText;
    pplblFechaD: TppLabel;
    pplblGiradoD: TppLabel;
    pplblGlosaD: TppLabel;
    pplblChequeD: TppLabel;
    pplblMonedaD: TppLabel;
    pplblMontoD: TppLabel;
    ppLabel3: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppdbcTotalD: TppDBCalc;
    ppLabel5: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    pplblTotalS: TppLabel;
    pplblTotalD: TppLabel;
    pplblTMontoS: TppLabel;
    pplblTMontoD: TppLabel;
    sbDisenoRep: TSpeedButton;
    cbDisenoRep: TCheckBox;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcCiaChange(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbdtpFinExit(Sender: TObject);
    procedure dbdtpInicioExit(Sender: TObject);
    procedure z2bbtnOkClick(Sender: TObject);
    procedure ppdbcTotalDCalc(Sender: TObject);
    procedure ppdbcMontoSCalc(Sender: TObject);
    procedure pprChqEmitidosPreviewFormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }
    xFechaInicio,
    xFechaFin : String ;
    xActualizaS,xactualizaD : bool;
    procedure RecuperarDatos(xFechaInicio,XFechaFin : String);
  public
    { Public declarations }
  end;

var
  FChequesEmitidos: TFChequesEmitidos;

implementation

uses CajaUtil;

{$R *.DFM}

{ TFRepLibros }


procedure TFChequesEmitidos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
   key:=#0;
   perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFChequesEmitidos.dblcCiaChange(Sender: TObject);
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


procedure TFChequesEmitidos.dblcCiaExit(Sender: TObject);
begin
if edtCia.Text='' then
begin
    if dblcCia.Text='' then
       Exit
    else
      ShowMessage('El Código de Compañía que ha Ingresado'+#13 +
                  'No está registrado');
    (Sender as twincontrol).SetFocus;
end
end;

procedure TFChequesEmitidos.FormShow(Sender: TObject);
begin
 RecuperarCiaUnica(dblcCia,edtCia);
 dbdtpInicio.Date := TDate(Now);
 dbdtpFin.Date :=   TDate(Now);
end;


procedure TFChequesEmitidos.dbdtpFinExit(Sender: TObject);
begin
    if dbdtpFin.Date = 0 then
    begin
       dbdtpFin.Date :=tDate( Now);
    end;
    if dbdtpInicio.Date > dbdtpFin.Date then
       dbdtpInicio.Date:=dbdtpFin.Date;
end;

procedure TFChequesEmitidos.dbdtpInicioExit(Sender: TObject);
begin
    if dbdtpInicio.Date = 0 then
    begin
       dbdtpInicio.Date :=tDate( Now);
    end;
    if dbdtpInicio.Date > dbdtpFin.Date then
       dbdtpFin.Date:=dbdtpInicio.Date;

end;

procedure TFChequesEmitidos.z2bbtnOkClick(Sender: TObject);
var
 xtotals, xtotald : double;
 xZ : Integer;
begin
    ppdbChqEmitidosD.DataSource := DMTE.dsQRY2;
    ppdbChqEmitidosS.DataSource := DMTE.dsQRY;

		pprChqEmitidos.TEMPLATE.FileName:=wRutaRpt + '\ChequesEmitidos.Rtm' ;
    pprChqEmitidos.template.LoadFromFile ;
    xFechaInicio := formatdatetime(DMTE.wFormatFecha,dbdtpInicio.Date );
    xFechaFin := formatdatetime(DMTE.wFormatFecha,dbdtpFin.Date ) ;
    RecuperarDatos(xFechaInicio,xFechaFin);

    if DMTE.cdsCia.fieldbyname('CIADES').AsString='' then
       pplblCiaC.caption := 'DERRAMA MAGISTERIAL'
    else
       pplblCiaC.caption := DMTE.cdsCia.fieldbyname('CIADES').AsString;

    pplblLocal.Caption := 'Cheques Emitidos en '+ DMTE.cdsQry.fieldbyname('TMONDES').AsString;
    pplblExtranjero.Caption := 'Cheques Emitidos en '+ DMTE.cdsQry2.fieldbyname('TMONDES').AsString;
    If DMTE.cdsQry.RecordCount > 0 then
      pplblTotalS.Caption := 'Total en '+ DMTE.cdsQry.fieldbyname('TMONDES').AsString
    else
    begin
      pplblTotalS.visible := False;
      pplblTMontoS.visible := False;
    end;
    If DMTE.cdsQry2.RecordCount > 0 then
      pplblTotalD.Caption := 'Total en '+ DMTE.cdsQry2.fieldbyname('TMONDES').AsString
    else
    begin
      pplblTotalD.Visible := false;
      pplblTMontoD.visible := False;
    end;
    DMTE.cdsQry.First;
    xTotalS := 0.0;
    while not DMTE.cdsQry.Eof do
    begin
      If DMTE.cdsQry.fieldbyname('FEXTCHQ').AsString <> '1' then
       xtotals := xtotals + DMTE.cdsQry.fieldbyname('ECMTOORI').value;
      DMTE.cdsQry.next;
    end;
    DMTE.cdsQry2.First;
    xTotalD := 0.0;
    while not DMTE.cdsQry2.Eof do
    begin
      If DMTE.cdsQry.fieldbyname('FEXTCHQ').AsString <> '1' then
       xtotald := xtotald + DMTE.cdsQry2.fieldbyname('ECMTOORI').value;
      DMTE.cdsQry2.next;
    end;
    pplblTMontoS.Caption := FormatFloat('#,0.00',xTotalS);
    pplblTMontoD.Caption := FormatFloat('#,0.00',xTotalD);
    xActualizaD := true;
    xActualizaS := true;
    pplblFechaIni.caption := dbdtpInicio.Text;
    pplblFechaFin.caption := dbdtpFin.Text;
 // Inicio HPC_201403_CAJA
 // cambia control de diseño de reporte
    if cbDisenoRep.Checked then
       ppd1.ShowModal
    else
    begin
       pprChqEmitidos.PRINT;
       pprChqEmitidos.Stop;

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
    end;
 // Fin HPC_201403_CAJA
end;

procedure TFChequesEmitidos.RecuperarDatos(xFechaInicio,XFechaFin : String);
var
   xSQL : String ;
   xdiario : string;
   xcontador : integer;
begin
  if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
  begin
    xSQL:='SELECT CAJA302.CIAID, CAJA302.ECFCOMP,CAJA302.ECANOMM, CAJA302.TDIARID,CAJA302.EC_PROCE,' +
                 //** 14/06/2001 - PSJV
                ' TGE104.TDIARABR, CAJA302.ECNOCOMP, CAJA302.ECGIRA,CASE WHEN CAJA302.FEXTCHQ = ''1'' THEN ''ANULADO'' ELSE'+
                ' CAJA302.ECGLOSA END ECGLOSA,' +
                 //**
                ' TGE105.BANCONOM, CAJA302.ECFEMICH, CAJA302.BANCOID, CAJA302.CCBCOID, CAJA302.ECNOCHQ,' +
                ' CAJA302.ECCHQEMI, CAJA302.TMONID, TGE103.TMONABR,TGE103.TMONDES,' +
                ' DEC(CAJA302.ECMTOORI,15,2) ECMTOORI, ''0000'' AS ITEM,FEXTCHQ ' +
          'FROM CAJA302 '+
                      ' LEFT JOIN  TGE105 ON (CAJA302.BANCOID=TGE105.BANCOID)' +
                      ' LEFT JOIN  TGE103 ON (CAJA302.TMONID=TGE103.TMONID)' +
                      ' LEFT JOIN  TGE104 ON (CAJA302.TDIARID=TGE104.TDIARID)' +
          'WHERE ( (CAJA302.ECNOCHQ IS NOT NULL) OR (RTRIM(LTRIM(CAJA302.ECNOCHQ))<>'''' ) ) and ' +
               ' CAJA302.TMONID = ''' + DMTE.wTMonLoc + ''' AND CAJA302.CIAID='''+dblcCia.TEXT+''' AND ' +
               ' ( ECFCOMP>=' +DMTE.wRepFuncDate + ''''+xFechaInicio+''') ) AND ' +
               ' ( ECFCOMP<=' +DMTE.wRepFuncDate + ''''+xFechaFin+''') ) ';
  end
  else
  begin
    if DMTE.SRV_D = 'ORACLE' then
      xSQL:='SELECT CAJA302.CIAID, CAJA302.ECFCOMP,CAJA302.ECANOMM, CAJA302.TDIARID,CAJA302.EC_PROCE,' +
                  //** 14/06/2001 - PSJV
                  ' TGE104.TDIARABR, CAJA302.ECNOCOMP, '+
                  ' CASE WHEN CAJA302.FEXTCHQ=''1'' THEN ''EXTORNADO'' '+
                        ' WHEN CAJA302.ECESTADO=''A'' THEN ''ANULADO'' '+
                        ' ELSE CAJA302.ECGLOSA '+
                  ' END ECGLOSA, '+
                  'CAJA302.ECGIRA,DECODE(CAJA302.FEXTCHQ,''1'',''ANULADO'', '+
                  ' CAJA302.ECGLOSA) ECGLOSA,' +
                  //**
                  ' TGE105.BANCONOM, CAJA302.ECFEMICH, CAJA302.BANCOID, CAJA302.CCBCOID, CAJA302.ECNOCHQ,' +
                  ' CAJA302.ECCHQEMI, CAJA302.TMONID, TGE103.TMONABR,TGE103.TMONDES,' +
                  ' CASE WHEN CAJA302.FEXTCHQ=''1'' THEN 0 '+
                        ' WHEN CAJA302.ECESTADO=''A'' THEN 0 '+
                        ' ELSE TRUNC(CAJA302.ECMTOORI,2) '+
                  ' END ECMTOORI, '+
                  '''0000'' AS ITEM,FEXTCHQ ' +
            'FROM CAJA302, TGE105, TGE103, TGE104 '+
            'WHERE ( (CAJA302.ECNOCHQ IS NOT NULL) OR (RTRIM(LTRIM(CAJA302.ECNOCHQ))<>'''' ) ) and ' +
                 ' CAJA302.TMONID = ''' + DMTE.wTMonLoc + ''' AND CAJA302.CIAID='''+dblcCia.TEXT+
                 ''' AND  ( ECFCOMP>=TO_DATE('''+xFechaInicio+''') ) AND ' +
                 ' ( ECFCOMP<=TO_DATE('''+xFechaFin+''') ) '+
                 ' AND CAJA302.BANCOID=TGE105.BANCOID(+)' +
                 ' AND CAJA302.TMONID=TGE103.TMONID(+)' +
                 ' AND CAJA302.TDIARID=TGE104.TDIARID(+)'
    end;

  // 11/05/2001 - pjsv
  If chbGerencia.Checked
  then    xsql := xsql + ' AND SUBSTR(ECNOCHQ,1,1)=''G'''
  else    xsql := xsql + ' AND ('+DMTE.wReplacCeros+'( CAJA302.ECCHQEMI,''N'' )= ''S'' )';

//  xsql := xsql + ' ORDER BY CAJA302.TDIARID' ;
//  xsql := xsql + ' ORDER BY CAJA302.CIAID,CAJA302.TDIARID,CAJA302.TMONID,CAJA302.CCBCOID,CAJA302.ECNOCOMP' ;
    xsql := xsql + ' ORDER BY CAJA302.CIAID,CAJA302.TDIARID,CAJA302.TMONID,CAJA302.BANCOID,CAJA302.CCBCOID,CAJA302.ECNOCOMP' ;


  DMTE.cdsQry.Close;
  DMTE.cdsQry.ProviderName:='prvCaja';
  DMTE.cdsQry.DataRequest(xSQL);
  DMTE.cdsQry.Open;
  DMTE.CDSQRY.First;

  xdiario := DMTE.CDSQRY.fieldbyname('TDIARID').AsString;
  xcontador := 0;
  while not DMTE.CDSQRY.Eof do
   begin
     If (DMTE.CDSQRY.fieldbyname('EC_PROCE').AsString = '8') and (DMTE.CDSQRY.fieldbyname('FEXTCHQ').AsString <> '1') then
      begin
       DMTE.CDSQRY.delete;
       end
     else
      begin
       DMTE.CDSQRY.edit;
       If xDiario = DMTE.CDSQRY.fieldbyname('TDIARID').AsString then
        begin
         xcontador := xcontador + 1;
         DMTE.CDSQRY.fieldbyname('ITEM').AsString := DMTE.StrZero(IntToStr(xcontador),4);
        end
       else
        begin
         xcontador := 0;
         xdiario := DMTE.CDSQRY.fieldbyname('TDIARID').AsString;
         xcontador := xcontador + 1;
         DMTE.CDSQRY.fieldbyname('ITEM').AsString := DMTE.StrZero(IntToStr(xcontador),4);
        end;
       DMTE.CDSQRY.post;
       DMTE.CDSQRY.next;
      end;
   end;

  if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
    xSQL:='SELECT CAJA302.CIAID, CAJA302.ECFCOMP,CAJA302.ECANOMM, CAJA302.TDIARID,' +
                //** 14/06/2001 - PSJV
                ' TGE104.TDIARABR, CAJA302.ECNOCOMP, CAJA302.ECGIRA,CASE WHEN CAJA302.FEXTCHQ = ''1'' THEN ''ANULADO'' ELSE'+
                ' CAJA302.ECGLOSA END ECGLOSA,' +
                //**
                ' TGE105.BANCONOM, CAJA302.ECFEMICH, CAJA302.BANCOID, CAJA302.CCBCOID, CAJA302.ECNOCHQ,' +
                ' CAJA302.ECCHQEMI, CAJA302.TMONID, TGE103.TMONABR,TGE103.TMONDES,' +
                ' DEC(CAJA302.ECMTOORI,15,2) ECMTOORI, ''0000'' AS ITEM,FEXTCHQ ' +
          'FROM CAJA302 '+
                ' LEFT JOIN  TGE105 ON (CAJA302.BANCOID=TGE105.BANCOID)' +
                ' LEFT JOIN  TGE103 ON (CAJA302.TMONID=TGE103.TMONID)' +
                ' LEFT JOIN  TGE104 ON (CAJA302.TDIARID=TGE104.TDIARID)' +
          'WHERE ( (CAJA302.ECNOCHQ IS NOT NULL) OR (RTRIM(LTRIM(CAJA302.ECNOCHQ))<>'''' ) ) and ' +
                ' CAJA302.TMONID = '''+ DMTE.wTMonExt+ ''' AND CAJA302.CIAID='''+dblcCia.TEXT+''' AND ' +
                ' ( ECFCOMP>=' +DMTE.wRepFuncDate + ''''+xFechaInicio+''') ) AND ' +
                ' ( ECFCOMP<=' +DMTE.wRepFuncDate + ''''+xFechaFin+'''))'
  else
    if DMTE.SRV_D = 'ORACLE' then
      xSQL:='SELECT CAJA302.CIAID, CAJA302.ECFCOMP,CAJA302.ECANOMM, CAJA302.TDIARID,' +
                 //** 14/06/2001 - PSJV
                  ' TGE104.TDIARABR, CAJA302.ECNOCOMP, CAJA302.ECGIRA, '+
                  ' CASE WHEN CAJA302.FEXTCHQ=''1'' THEN ''EXTORNADO'' '+
                        ' WHEN CAJA302.ECESTADO=''A'' THEN ''ANULADO'' '+
                        ' ELSE CAJA302.ECGLOSA '+
                  ' END ECGLOSA, '+
                 //**
                  ' TGE105.BANCONOM, CAJA302.ECFEMICH, CAJA302.BANCOID, CAJA302.CCBCOID, CAJA302.ECNOCHQ,' +
                  ' CAJA302.ECCHQEMI, CAJA302.TMONID, TGE103.TMONABR,TGE103.TMONDES,' +
                  ' CASE WHEN CAJA302.FEXTCHQ=''1'' THEN 0 '+
                        ' WHEN CAJA302.ECESTADO=''A'' THEN 0 '+
                        ' ELSE TRUNC(CAJA302.ECMTOORI,2) '+
                  ' END ECMTOORI, '+
                  '''0000'' AS ITEM,FEXTCHQ ' +
            'FROM CAJA302, TGE105, TGE103, TGE104 '+
            'WHERE ( (CAJA302.ECNOCHQ IS NOT NULL) OR (RTRIM(LTRIM(CAJA302.ECNOCHQ))<>'''' ) ) and ' +
                  ' CAJA302.TMONID = '''+ DMTE.wTMonExt +''' AND CAJA302.CIAID='''+dblcCia.TEXT+
                  ''' AND  ( ECFCOMP>=' +DMTE.wRepFuncDate + ''''+xFechaInicio+''') ) AND ' +
                  ' ( ECFCOMP<=' +DMTE.wRepFuncDate + ''''+xFechaFin+'''))' +
                  ' and CAJA302.BANCOID=TGE105.BANCOID(+)' +
                  ' and CAJA302.TMONID=TGE103.TMONID(+)' +
                  ' and CAJA302.TDIARID=TGE104.TDIARID(+)' ;


  // 11/05/2001 - pjsv
   if chbGerencia.Checked
   then    xsql := xsql + ' AND SUBSTR(ECNOCHQ,1,1)=''G'''
   else    xsql := xsql + ' AND ('+DMTE.wReplacCeros+'( CAJA302.ECCHQEMI,''N'' )= ''S'' )';
//   xsql := xsql + ' ORDER BY CAJA302.TDIARID' ;
   xsql := xsql + ' ORDER BY CAJA302.CIAID,CAJA302.TDIARID,CAJA302.TMONID,CAJA302.CCBCOID,CAJA302.ECNOCOMP' ;

  //**

  with DMTE do
    begin
     cdsQry2.Close;
     cdsQry2.ProviderName:='prvCaja';
     cdsQry2.DataRequest(xSQL);
     cdsQry2.Open;
    end;
  DMTE.CDSQRY2.First;
  xdiario := DMTE.CDSQRY2.fieldbyname('TDIARID').AsString;
  xcontador := 0;
  while not DMTE.CDSQRY2.Eof do
   begin
     DMTE.CDSQRY2.edit;
     If xDiario = DMTE.CDSQRY2.fieldbyname('TDIARID').AsString then
      begin
       xcontador := xcontador + 1;
       DMTE.CDSQRY2.fieldbyname('ITEM').AsString := DMTE.StrZero(IntToStr(xcontador),4);
      end
     else
      begin
       xcontador := 0;
       xdiario := DMTE.CDSQRY2.fieldbyname('TDIARID').AsString;
       xcontador := xcontador + 1;
       DMTE.CDSQRY2.fieldbyname('ITEM').AsString := DMTE.StrZero(IntToStr(xcontador),4);
      end;
    DMTE.CDSQRY2.post;
    DMTE.CDSQRY2.next;
   end;
end;

//   (SENDER AS TppReport).PreviewForm.WindowState:=WsMaximized;
//   TppViewer((Sender as tppReport).PreviewForm.Viewer).ZoomSetting:=zsPagewidth;

//** 14/06/2001 - PSJV
procedure TFChequesEmitidos.ppdbcTotalDCalc(Sender: TObject);
begin
   If DMTE.cdsQry.fieldbyname('FEXTCHQ').AsString <> '1' then
    ppdbcTotalD.Value := ppdbcTotalD.Value + DMTE.cdsQry2.fieldbyname('ECMTOORI').value;
end;
//**

//** 14/06/2001 - PSJV
procedure TFChequesEmitidos.ppdbcMontoSCalc(Sender: TObject);
begin
   If DMTE.cdsQry.fieldbyname('FEXTCHQ').AsString <> '1' then
    ppdbcMontoS.Value := ppdbcMontoS.Value + DMTE.cdsQry.fieldbyname('ECMTOORI').value;
end;
//**

procedure TFChequesEmitidos.pprChqEmitidosPreviewFormCreate(
  Sender: TObject);
begin
	pprChqEmitidos.PreviewForm.ClientHeight := 500;
	pprChqEmitidos.PreviewForm.ClientWidth  := 650;
	TppViewer(pprChqEmitidos.PreviewForm.Viewer).ZoomSetting := zsPagewidth;

end;

procedure TFChequesEmitidos.BitBtn1Click(Sender: TObject);
var
   xSQL: String;
 xtotals, xtotald : double;
 xZ : Integer;
begin

  xFechaInicio := formatdatetime(DMTE.wFormatFecha,dbdtpInicio.Date );
  xFechaFin := formatdatetime(DMTE.wFormatFecha,dbdtpFin.Date ) ;
  xSQL:='SELECT BANCONOM BANCO, CAJA302.CCBCOID CUENTA, CAJA302.ECNOCHQ CHEQUE, ECFEMICH FECHA, CAJA302.ECCHQEMI IMPRESO, '
       +  'CAJA302.ECGIRA GIRADO, '
       +  ' CASE WHEN CAJA302.FEXTCHQ=''1'' THEN ''EXTORNADO'' '
       +       ' WHEN CAJA302.ECESTADO=''A'' THEN ''ANULADO'' '
       +       ' ELSE CAJA302.ECGLOSA '
       +  ' END ECGLOSA, '
       +  'TGE103.TMONABR MONEDA, '
       +  ' CASE WHEN CAJA302.FEXTCHQ=''1'' THEN 0 '
       +        ' WHEN CAJA302.ECESTADO=''A'' THEN 0 '
       +        ' ELSE TRUNC(CAJA302.ECMTOORI,2) '
       +  ' END ECMTOORI, '
       +  'CAJA302.CIAID CIA, ECNOCOMP COMPROBANTE '
       +'FROM CAJA302, TGE105, TGE103, TGE104 '
       +'WHERE ( (CAJA302.ECNOCHQ IS NOT NULL) OR (RTRIM(LTRIM(CAJA302.ECNOCHQ))<>'''' ) ) '
       + ' and ( ECFCOMP>=TO_DATE('''+xFechaInicio+''') ) AND ( ECFCOMP<=TO_DATE('''+xFechaFin+''') ) '
       + ' AND CAJA302.TDIARID=''06'' AND NVL(CAJA302.ECCHQEMI,''N'')=''S'' '
       + ' AND CAJA302.BANCOID=TGE105.BANCOID(+)'
       + ' AND CAJA302.TMONID=TGE103.TMONID(+)'
       + ' AND CAJA302.TDIARID=TGE104.TDIARID(+) '
       +'Order by BANCONOM, CAJA302.CCBCOID, CAJA302.ECNOCHQ ';

   DMTE.cdsQRY2.close;
   DMTE.cdsQRY2.DataRequest(xSQL);
   DMTE.cdsQRY2.open;

   If DMTE.cdsQry2.RecordCount > 0 Then
   begin
      try
         DMTE.HojaExcel('Archivo',DMTE.dsQry2, dtgData);
      except
         		on Ex: Exception do
          			Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
      end;
   end
   else
      MessageDlg('No Existe Infromación Para Esta Consulta ', mtInformation,[mbOk],0);
end;

procedure TFChequesEmitidos.sbDisenoRepClick(Sender: TObject);
begin
// Inicio HPC_201403_CAJA
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
// Fin HPC_201403_CAJA
end;

end.

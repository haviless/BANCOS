unit Caja214;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ppComm, ppEndUsr, ppBands, ppRelatv, ppCache, ppClass, ppProd,
  ppReport, StdCtrls, ppPrnabl, ppCtrls, Mask, wwdbedit, wwdblook, Db,
  DBTables, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, ComCtrls, Buttons,
  wwdbdatetimepicker, Wwdatsrc, Wwquery, ppVar,CAJADM, ppDB, ppDBPipe,
  DBGrids;

type
  TFEmiCheques = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dbgChqSinEmi: TwwDBGrid;
    StaticText1: TStaticText;
    Label1: TLabel;
    dbdtpInicio: TwwDBDateTimePicker;
    dbdtpFin: TwwDBDateTimePicker;
    de: TLabel;
    Bevel1: TBevel;
    z2bbtnEmitir: TBitBtn;
    z2bbtnBuscar: TBitBtn;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    z2bbtnImprime: TBitBtn;
    pprptListado: TppReport;
    ppdbpListado: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    pplblCia: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel5: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    pplblDel: TppLabel;
    pplblAl: TppLabel;
    pplblFecha1: TppLabel;
    pplblFecha2: TppLabel;
    ppDBText10: TppDBText;
    pplblFechaC: TppLabel;
    procedure dbdtpInicioExit(Sender: TObject);
    procedure dbdtpFinExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure z2bbtnEmitirClick(Sender: TObject);
    procedure z2bbtnBuscarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure z2bbtnImprimeClick(Sender: TObject);
  private
    { Private declarations }
    xRUCCIA : string; // para el ruc de la compañia
    xFechaInicio, xFechaFin : String ;
    procedure RecuperarDatos(xFechaInicio,XFechaFin : String);
  public
    { Public declarations }
  end;

var
  FEmiCheques: TFEmiCheques;

implementation

uses CajaUtil, oaTE2000;

{$R *.DFM}

procedure TFEmiCheques.dbdtpInicioExit(Sender: TObject);
begin
    if dbdtpInicio.Date = 0 then
    begin
       dbdtpInicio.Date :=tDate( Now);
    end;
    if dbdtpInicio.Date > dbdtpFin.Date then
       dbdtpFin.Date:=dbdtpInicio.Date;
end;

procedure TFEmiCheques.dbdtpFinExit(Sender: TObject);
begin
    if dbdtpFin.Date = 0 then
    begin
       dbdtpFin.Date :=tDate( Now);
    end;
    if dbdtpInicio.Date > dbdtpFin.Date then
       dbdtpInicio.Date:=dbdtpFin.Date;

end;

procedure TFEmiCheques.FormShow(Sender: TObject);
begin
    dbgChqSinEmi.DataSource := DMTE.dsQry;
    //** 08/03/2001 - pjsv
//    DMTE.cdsQry.ReadOnly := True;
    //**
    RecuperarCiaUnica(dblcCia,edtCia);
    dbdtpInicio.Date := TDate(Now);
    dbdtpFin.Date :=   TDate(Now);
    xFechaInicio := formatdatetime(DMTE.wFormatFecha,dbdtpInicio.Date );
    xFechaFin := formatdatetime(DMTE.wFormatFecha,dbdtpInicio.Date ) ;
    RecuperarDatos(xFechaInicio,xFechaFin);
end;

procedure TFEmiCheques.z2bbtnEmitirClick(Sender: TObject);
var
   xSQL : String ;
   strChq : structChq ;
   ArchivoReporte : string ;
begin
  //** 08/03/2001 - pjsv
   DMTE.xFlagP := False;
   if trim(DMTE.cdsQry.fieldbyname('CCBCOID').AsString) <> '' then
   begin
      DMTE.RecuperarDatos('TGE106','*',
                         'BANCOID = '+quotedstr('BANCOID')+
                         ' AND CCBCOID = '+quotedstr(trim(DMTE.cdsQry.fieldbyname('CCBCOID').AsString))) ;
      ArchivoReporte  := DMTE.cdsRec.fieldbyname('CCFMTCHQ').ASString ;
      if ArchivoReporte = '' then
       ArchivoReporte := wRutaRpt + 'ChqDefault.rtm';
      with strChq do
      begin
         ppFileName    := ArchivoReporte                                             ;
         ppGiradoA     := trim(DMTE.cdsQry.fieldbyname('ECGIRA').AsString);
         ppImporte     := floattostrf(strtocurr(trim(DMTE.cdsQry.fieldbyname('ECMTOORI').Value)),fffixed,10,2) ;
         ppMontoLetras := strNum(strtofloat(ppImporte))                              ;
         ppDia         := strDia(DMTE.cdsQry.fieldbyname('ECMTOORI').Value);
         ppmes         := strMes(DMTE.cdsQry.fieldbyname('ECMTOORI').Value);
         ppAno         := strAno(DMTE.cdsQry.fieldbyname('ECMTOORI').Value);
         If DMTE.cdsQry.fieldbyname('CCBCOID').AsString <> '0100001518' then
          ppRuc         := 'RUC :'+xRUCCIA;
      end;
      FRegistro.EmiteChq(ArchivoReporte, strChq);
   end
   else
   begin
      Showmessage('No ha seleccionado Cuenta Corriente') ;
   end ;
   If DMTE.xFlagP then
   //**
    begin
     with DMTE.cdsQry do
     xSQL:='UPDATE CAJA302 SET ECCHQEMI=''S'' '
          +'WHERE CIAID='''   +FieldByName('CIAID').AsString   +''' and '
          +      'TDIARID=''' +FieldByName('TDIARID').AsString +''' and '
          +      'ECANOMM=''' +FieldByName('ECANOMM').AsString +''' and '
          +      'ECNOCOMP='''+FieldByName('ECNOCOMP').AsString+''' ';
     try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      //** 08/03/2001 - pjsv
      DMTE.cdsQry.delete;
      dbgChqSinEmi.Refresh;
      //**
     except
     end;
    end;
end;


procedure TFEmiCheques.RecuperarDatos(xFechaInicio,XFechaFin : String);
var
   xSQL : String ;
begin
   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
      xSQL:='SELECT CAJA302.CIAID, CAJA302.ECFCOMP,CAJA302.ECANOMM, CAJA302.TDIARID,' +
            ' TGE104.TDIARABR, CAJA302.ECNOCOMP, CAJA302.ECGIRA,' +
            ' TGE105.BANCOABR, CAJA302.ECFEMICH, CAJA302.BANCOID, CAJA302.CCBCOID, CAJA302.ECNOCHQ,' +
            ' CAJA302.ECCHQEMI, CAJA302.TMONID, TGE103.TMONABR,' +
            ' DEC(CAJA302.ECMTOORI,15,2) ECMTOORI' +
            ' FROM CAJA302'+
            ' LEFT JOIN  TGE105 ON (CAJA302.BANCOID=TGE105.BANCOID)' +
            ' LEFT JOIN  TGE103 ON (CAJA302.TMONID=TGE103.TMONID)' +
            ' LEFT JOIN  TGE104 ON (CAJA302.TDIARID=TGE104.TDIARID)' +
            ' WHERE ( (CAJA302.ECNOCHQ IS NOT NULL) OR (RTRIM(LTRIM(CAJA302.ECNOCHQ))<>'''' ) ) and ' +
            ' ( '+DMTE.wReplacCeros+'( CAJA302.ECCHQEMI,''N'' )= ''N'' )  AND' +
            ' ( ECFCOMP>=' +DMTE.wRepFuncDate + ''''+xFechaInicio+''') ) AND' +
            ' ( ECFCOMP<=' +DMTE.wRepFuncDate + ''''+xFechaFin+''') ) AND ' +
            ' (ECNOCHQ<>'''' and ECNOCHQ IS NOT NULL)'+
            ' ORDER BY CAJA302.TDIARID'
   else
     if DMTE.SRV_D = 'ORACLE' then
        xSQL:='SELECT CAJA302.CIAID, CAJA302.ECFCOMP,CAJA302.ECANOMM, CAJA302.TDIARID,' +
              ' TGE104.TDIARABR, CAJA302.ECNOCOMP, CAJA302.ECGIRA,' +
              ' TGE105.BANCOABR, CAJA302.ECFEMICH, CAJA302.BANCOID, CAJA302.CCBCOID, CAJA302.ECNOCHQ,' +
              ' CAJA302.ECCHQEMI, CAJA302.TMONID, TGE103.TMONABR,' +
              ' TRUNC(CAJA302.ECMTOORI,2) ECMTOORI' +
              ' FROM CAJA302, TGE105, TGE103, TGE104'+
              ' WHERE ( (CAJA302.ECNOCHQ IS NOT NULL) OR (RTRIM(LTRIM(CAJA302.ECNOCHQ))<>'''' ) ) and ' +
              ' ( '+DMTE.wReplacCeros+'( CAJA302.ECCHQEMI,''N'' )= ''N'' )  AND' +
              ' ( ECFCOMP>=' +DMTE.wRepFuncDate + ''''+xFechaInicio+''') ) AND' +
              ' ( ECFCOMP<=' +DMTE.wRepFuncDate + ''''+xFechaFin+''') ) AND ' +
              ' (ECNOCHQ<>'''' and ECNOCHQ IS NOT NULL)'+
              '    AND CAJA302.BANCOID=TGE105.BANCOID (+)' +
              '    AND CAJA302.TMONID=TGE103.TMONID (+)' +
              '    AND CAJA302.TDIARID=TGE104.TDIARID (+)' +
              ' ORDER BY CAJA302.TDIARID';

  with DMTE do
  begin
     cdsQry.Close;
     cdsQry.ProviderName:='prvCaja';
     cdsQry.DataRequest(xSQL);
     cdsQry.Open;
  end;
   //** 08/03/2001 - pjsv
   If DMTE.cdsQry.fieldbyname('CIAID').AsString <> '' then
    begin
     xsql := 'SELECT * FROM TGE101 WHERE CIAID='+quotedstr(DMTE.cdsQry.fieldbyname('CIAID').AsString);
     DMTE.cdsSql.IndexFieldNames:='';
     DMTE.cdsSql.Close;
     DMTE.cdsSql.DataRequest(xsql);
     DMTE.cdsSQL.Open;
     xRUCCIA := DMTE.cdsSql.Fieldbyname('CIARUC').AsString;
    end
   else xRUCCIA := '';
   //**
end;

procedure TFEmiCheques.z2bbtnBuscarClick(Sender: TObject);
var
   xFechaInicio,
   xFechaFin : String ;
begin
    xFechaInicio := formatdatetime(DMTE.wFormatFecha,dbdtpInicio.Date );
    xFechaFin := formatdatetime(DMTE.wFormatFecha,dbdtpFin.Date ) ;
    RecuperarDatos(xFechaInicio,xFechaFin);
end;

procedure TFEmiCheques.FormClose(Sender: TObject;var Action: TCloseAction);
begin
  DMTE.cdsQry.ReadOnly := False;
end;

procedure TFEmiCheques.z2bbtnImprimeClick(Sender: TObject);
begin
	 //JCC: 24/06/2002
		pprptListado.TEMPLATE.FileName := wRutaRpt + '\ChqSinEmitir.Rtm';
    pprptListado.template.LoadFromFile ;
    pplblFecha1.Caption :=  dbdtpInicio.text;
    pplblFecha2.Caption :=  dbdtpFin.text;
    pplblCia.Caption := edtCia.Text;
    pprptListado.print;
    //**
end;

end.


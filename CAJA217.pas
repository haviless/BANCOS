unit Caja217;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, ExtCtrls, Buttons, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, Wwdatsrc, wwdbdatetimepicker, Mask, DBCtrls, CajaDM;

type
  TFSaldoTelefonico = class(TForm)
    pnlCabecera: TPanel;
    pnlBotones: TPanel;
    z2bbtnGraba: TBitBtn;
    z2bbtnCancel2: TBitBtn;
    StaticText1: TStaticText;
    dbgSaldoTlfn: TwwDBGrid;
    Label3: TLabel;
    dbdtpFecSdoTlfn: TwwDBDateTimePicker;
    Label2: TLabel;
    z2bbtnOKCab: TBitBtn;
    stFecUltCierre: TStaticText;
    Label1: TLabel;
    stHoraSaldo: TStaticText;
    Label4: TLabel;
    stTipSaldo: TStaticText;
    z2bbtnCalc: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure z2bbtnCalcClick(Sender: TObject);
    procedure dbdtpFecSdoTlfnExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure z2bbtnGrabaClick(Sender: TObject);
    procedure z2bbtnCancel2Click(Sender: TObject);
    procedure dbdtpFecSdoTlfnEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    strTmp: string;
    { Private declarations }
    procedure RecuperarSaldoTelefonico;
    procedure GenerarSaldoTelefonico;
  public
    { Public declarations }
  end;

var
  FSaldoTelefonico: TFSaldoTelefonico;

implementation

uses CajaUtil;



{$R *.DFM}

var
  xFechaCalculo : String ;
const
  MEN_FEC_CIERRE = 'No se ha realizado ningún cierre';

procedure TFSaldoTelefonico.FormShow(Sender: TObject);
var
   xSQL : String ;
begin

    xSQL := ' SELECT FECCIERRE ULTCIERRE ' +
            '  FROM CAJA309 CAJA309 '      +
            '  WHERE FACTIVO = ''S'' '     ;
    with DMTE do
    begin
       cdsQry.Close;
       cdsQry.ProviderName:='prvCaja';
       cdsQry.DataRequest(xSQL);
       cdsQry.Open;
       if cdsQry.FieldByName('ULTCIERRE').isNUll then
          stFecUltCierre.caption := MEN_FEC_CIERRE
       else
          stFecUltCierre.caption := cdsQry.FieldByName('ULTCIERRE').AsString;
    end;
    dbdtpFecSdoTlfn.date := Date ;
    xFechaCalculo := dbdtpFecSdoTlfn.Text ;
    RecuperarSaldoTelefonico ;
end;

procedure TFSaldoTelefonico.z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('calc.exe',1);  //Activa la calculadora del Windows
end;

procedure TFSaldoTelefonico.RecuperarSaldoTelefonico;
var
   xSQL   ,
   xVista  ,
   xFecha : String ;
   NumeroAleatorio1 : integer ;
   NumeroAleatorio2 : integer ;
begin
   xFecha :=formatdatetime(DMTE.wFormatFecha,dbdtpFecSdoTlfn.date );
   Randomize ;
   NumeroAleatorio1 := Random(100) ;
   NumeroAleatorio2 := Random(100) ;
   xVista:='VW'+DMTE.StrZero(inttostr(NumeroAleatorio1),3)+DMTE.StrZero(inttostr(NumeroAleatorio2),3);
   xSQL  :='CREATE VIEW ' + xVista + ' AS '
           +  'SELECT BANCOID, CCBCOID, STSALDOTLFN SALDOTLFN, '
           +    'STINGRESOTLFN INGRESOSTLFN, STEGRESOTLFN EGRESOSTLFN, '
           +    'STSALDOINIC SALDOINICIAL, '
           +    'STTOTING TOTINGRESOS, STTOTEGR TOTEGRESOS, STSALDOFIN SALDOFINAL, '
           +    'STFECHA, STTIPO, STHORA '
           +  ' FROM CAJA310'
           +  ' WHERE CAJA310.STFECHA = (SELECT MAX(B.STFECHA) FROM CAJA310 B WHERE B.STFECHA<=' +DMTE.wRepFuncDate + ''''+ xFecha +'''))' ;
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL) ;

   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
     xSQL :='SELECT TGE106.BANCOID,TGE106.CCBCOID,TGE105.BANCOABR,TGE103.TMONABR,'
            +   ' COALESCE(SALDOTLFN,0) SALDOTLFN, '
            +   ' COALESCE(INGRESOSTLFN,0) INGRESOSTLFN,'
            +   ' COALESCE(EGRESOSTLFN,0) EGRESOSTLFN, '
            +   ' COALESCE(SALDOINICIAL,0) SALDOINICIAL,'
            +   ' COALESCE(TOTINGRESOS,0) TOTINGRESOS, '
            +   ' COALESCE(TOTEGRESOS,0) TOTEGRESOS, '
            +   ' COALESCE(SALDOFINAL,0) SALDOFINAL, '
            +   'STFECHA, STTIPO, STHORA '
            +' FROM TGE106 '
            +   ' LEFT JOIN TGE105 ON (TGE106.BANCOID = TGE105.BANCOID) '
            +   ' LEFT JOIN TGE103 ON (TGE106.TMONID = TGE103.TMONID) '
            +   ' LEFT JOIN ' + xVista+ ' ON  (TGE106.BANCOID =  '+xVista +'.BANCOID AND TGE106.CCBCOID='+ xVista + '.CCBCOID)'
   else
    if DMTE.SRV_D = 'ORACLE' then
       xSQL :='SELECT TGE106.BANCOID,TGE106.CCBCOID,TGE105.BANCOABR,TGE103.TMONABR,'
              +   ' NVL(SALDOTLFN,0) SALDOTLFN, '
              +   ' NVL(INGRESOSTLFN,0) INGRESOSTLFN,'
              +   ' NVL(EGRESOSTLFN,0) EGRESOSTLFN, '
              +   ' NVL(SALDOINICIAL,0) SALDOINICIAL,'
              +   ' NVL(TOTINGRESOS,0) TOTINGRESOS, '
              +   ' NVL(TOTEGRESOS,0) TOTEGRESOS, '
              +   ' NVL(SALDOFINAL,0) SALDOFINAL, '
              +   'STFECHA, STTIPO, STHORA '
              +' FROM TGE106, TGE105, TGE103, '+xVista
              +   ' WHERE TGE106.BANCOID = TGE105.BANCOID (+)'
              +   ' AND TGE106.TMONID = TGE103.TMONID(+)'
              +   ' AND (TGE106.BANCOID = '+xVista +'.BANCOID(+) AND TGE106.CCBCOID='+ xVista + '.CCBCOID(+) )';

   with DMTE do
   begin
      cdsQry.Close;
      cdsQry.ProviderName:='prvCaja';
      cdsQry.DataRequest(xSQL);
      cdsQry.Open;
      if cdsQry.RecordCount = 0 Then
      begin
         ShowMessage('No Hay Ctas. Ctes. Registradas'+#13+
                     ' para la Fecha :'+ dbdtpFecSdoTlfn.Text);
      end
      else
      begin
         if not cdsQry.FieldByName('STFECHA').ISNULL then
         begin
            if cdsQry.FieldByName('STFECHA').AsDateTime <> dbdtpFecSdoTlfn.Date then
            begin
               cdsqry.ReadOnly := False ;
               cdsQry.First ;
               while not cdsQry.Eof do
               begin
                   cdsQry.Edit ;
                   cdsQry.FieldByName('SALDOTLFN').AsFloat    := 0    ;
                   cdsQry.FieldByName('INGRESOSTLFN').AsFloat := 0    ;
                   cdsQry.FieldByName('EGRESOSTLFN').AsFloat  := 0    ;
                   cdsQry.FieldByName('SALDOINICIAL').AsFloat := cdsQry.FieldByName('SALDOFINAL').AsFloat ;
                   cdsQry.FieldByName('SALDOFINAL').AsFloat := cdsQry.FieldByName('SALDOINICIAL').AsFloat
                                                               +  cdsQry.FieldByName('TOTINGRESOS').AsFloat
                                                               -  cdsQry.FieldByName('TOTEGRESOS').AsFloat ;
                   cdsQry.post ;
                   cdsQry.Next ;
               end;
            end ;
         end ;
      end ;
      with cdsQry do
      begin
         FieldByName('SALDOINICIAL').ReadOnly := True ;
         FieldByName('SALDOFINAL').ReadOnly := True   ;
         FieldByName('TOTINGRESOS').ReadOnly := True  ;
         FieldByName('TOTEGRESOS').ReadOnly := True   ;
      end;
      if dbgSaldoTlfn.DataSource <> dsQry then
         dbgSaldoTlfn.DataSource := dsQry ;
   end;
   xSQL := 'DROP VIEW '+ xVista         ;
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL) ;

   xFechaCalculo := dbdtpFecSdoTlfn.Text ;

   if stFecUltCierre.Caption <> MEN_FEC_CIERRE then
   begin
      if dbdtpFecSdoTlfn.date > strtodatetime(stFecUltCierre.Caption) then
      begin
         z2bbtnGraba.Enabled := True  ;
         DMTE.cdsQry.ReadOnly := False ;
      end
      else
      begin
         z2bbtnGraba.Enabled := False ;
         DMTE.cdsQry.ReadOnly := true  ;
      end ;
   end
   else
   begin
      DMTE.cdsQry.ReadOnly := False ;
      z2bbtnGraba.Enabled := True  ;
   end ;
end ;

procedure TFSaldoTelefonico.dbdtpFecSdoTlfnExit(Sender: TObject);
var
   Tmp : String ;
begin
  if dbdtpFecSdotlfn.date = 0 then
  begin
    Tmp := strTmp ;
    ShowMessage('Ingrese Fecha de Saldo Telefónico');
    strTmp := Tmp ;
    dbdtpFecSdoTlfn.SetFocus ;
    Exit ;
  end;
  if strTmp <> dbdtpFecSdotlfn.Text then
  begin
//** 06/06/2001 - pjsv, no borrar, estrará luego de la pruebas
//**     RecalculoSaldos(StrToDate(dbdtpFecSdoTlfn.text),'','');
//**
     RecuperarSaldoTelefonico ;
     dbdtpFecSdoTlfn.date := dbdtpFecSdoTlfn.date ; 
  end ;
end;

procedure TFSaldoTelefonico.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  DMTE.cdsQry.Close; 
  DMTE.cdsQry.ReadOnly := False ;
  
  Action:=caFree;
end;

procedure TFSaldoTelefonico.z2bbtnOKCabClick(Sender: TObject);
begin
  dbgSaldoTlfn.SetFocus ;
end;

procedure TFSaldoTelefonico.z2bbtnGrabaClick(Sender: TObject);
var
   xSQL : String ;
begin
       //validacion
     xSQL := 'DELETE FROM CAJA310 '+
             'WHERE STFECHA=' +DMTE.wRepFuncDate + ''''+
             formatdatetime(DMTE.wFormatFecha,dbdtpFecSdoTlfn.date )+
             ''')';
      try
       DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      except
      end ; 
     dbgSaldoTlFn.DataSource.DataSet.DisableControls;
     dbgSaldoTlFn.DataSource.DataSet.First;
     DMTE.cdsSaldoTlfnGrab.Close ;
     DMTE.cdsSaldoTlfnGrab.Open ;
     while not dbgSaldoTlFn.DataSource.DataSet.Eof do
     begin
       with DMTE.cdsSaldoTlfnGrab do
       begin
            Insert;
            FieldByName('STFECHA').Value:=
                         dbdtpFecSdoTlfn.date;
            FieldByName('BANCOID').AsString:=
                         dbgSaldoTlFn.DataSource.DataSet.FieldByName('BANCOID').AsString;
            FieldByName('CCBCOID').AsString:=
                         dbgSaldoTlFn.DataSource.DataSet.FieldByName('CCBCOID').AsString;
            FieldByName('STSALDOINIC').AsFloat:=
                         dbgSaldoTlFn.DataSource.DataSet.FieldByName('SALDOINICIAL').AsFloat ;
            FieldByName('STTOTING').AsFloat:=
                         dbgSaldoTlFn.DataSource.DataSet.FieldByName('TOTINGRESOS').AsFloat ;
            FieldByName('STTOTEGR').AsFloat:=
                         dbgSaldoTlFn.DataSource.DataSet.FieldByName('TOTEGRESOS').AsFloat ;
//            FieldByName('TMONID').AsString:=
//                         dbgSaldoTlFn.DataSource.DataSet.FieldByName('TMONID').AsString;
            FieldByName('STSALDOFIN').AsFloat:=
                         dbgSaldoTlFn.DataSource.DataSet.FieldByName('SALDOFINAL').AsFloat ;
            FieldByName('STSALDOTLFN').AsFloat:=
                         dbgSaldoTlFn.DataSource.DataSet.FieldByName('SALDOTLFN').AsFloat ;
            FieldByName('STINGRESOTLFN').AsFloat:=
                         dbgSaldoTlFn.DataSource.DataSet.FieldByName('INGRESOSTLFN').AsFloat;
            FieldByName('STEGRESOTLFN').AsFloat:=
                         dbgSaldoTlFn.DataSource.DataSet.FieldByName('EGRESOSTLFN').AsFloat;
            FieldByName('STTIPO').AsString:='M';
            Post;

       end;
       dbgSaldoTlFn.DataSource.DataSet.Next;
     end;
     dbgSaldoTlFn.DataSource.DataSet.First;
     dbgSaldoTlFn.DataSource.DataSet.EnableControls;
     DMTE.cdsSaldoTlfnGrab.ApplyUpdates(0);
end;

procedure TFSaldoTelefonico.z2bbtnCancel2Click(Sender: TObject);
begin
     self.close;
end;

procedure TFSaldoTelefonico.GenerarSaldoTelefonico;
var
   xSQL ,
   xFechaSaldoTlfn ,
   xFechaUltCierre ,
   xFechaAyer : String;
begin

   xFechaSaldoTlfn := formatdatetime(DMTE.wFormatFecha,dbdtpFecSdoTlfn.date );
   if stFecUltCierre.Caption<>MEN_FEC_CIERRE then
      xFechaUltCierre := formatdatetime(DMTE.wFormatFecha,strtodate( stFecUltCierre.Caption ) )
   else
      xFechaUltCierre := '1900-01-01';
   xFechaAyer := formatdatetime(DMTE.wFormatFecha,(dbdtpfecsdotlfn.date-1) );

	if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
    xSQL:='SELECT SALDO_TLFN.* ,SALDO_MOV.SALDOINICIAL,(SALDO_MOV.SALDOINICIAL+TOTINGRESOS-TOTEGRESOS) SALDOFINAL'                       +
          'FROM'                                                                                                                         +
              '(SELECT SALDOTLFN,'                                                                                                       +
               '  CASE WHEN STINGRESOTLFN=0 THEN '+DMTE.wReplacCeros+'(SUM(TMP2.INGRESO),0.00) ELSE STINGRESOTLFN END INGRESOSTLFN,'      +
               '  CASE WHEN STEGRESOTLFN=0  THEN '+DMTE.wReplacCeros+'(SUM(TMP2.EGRESO ),0.00) ELSE STEGRESOTLFN  END EGRESOSTLFN,'       +
               '  TMP2.BANCOABR, TMP2.BANCOID, TMP2.CCBCOID, TMP2.CCBCODES, TMP2.TMONABR, TMP2.TMONID,'                                  +
               '  '+DMTE.wReplacCeros+'(SUM(TMP2.INGRESO ),0.00) TOTINGRESOS,'                                                            +
               '  '+DMTE.wReplacCeros+'(SUM( TMP2.EGRESO ),0.00) TOTEGRESOS'                                                              +
               'FROM (SELECT TMP.*,'                                                                                                     +
                       '  CASE WHEN TMP.EC_IE=''I'' THEN TMP.SUMORI END  AS INGRESO,'                                                    +
                       '  CASE WHEN TMP.EC_IE=''E'' THEN TMP.SUMORI END AS EGRESO'                                                       +
                       'FROM (SELECT Tge105.BANCOABR, Tge105.BANCOID,'                                                                   +
                               '  Tge106.CCBCOID, Tge106.CCBCODES,'                                                                      +
                               '  Tge103.TMONABR, Tge103.TMONID,'                                                                        +
                               '  Tge103.TMON_LOC, CAJA302.EC_IE ,'                                                                      +
                               '  '+DMTE.wReplacCeros+'(TMPX.STSALDOTLFN,0.00) AS SALDOTLFN,'                                             +
                               '  '+DMTE.wReplacCeros+'(TMPX.STINGRESOTLFN,0.00) AS STINGRESOTLFN,'                                       +
                               '  '+DMTE.wReplacCeros+'(TMPX.STEGRESOTLFN,0.00) AS STEGRESOTLFN,'                                         +
                               '  DEC(SUM( CAJA302.ECMTOORI ),15,2) SUMORI'                                                              +
                               'FROM TGE106 '                                                                                            +
                               '  LEFT OUTER JOIN '                                                                                      +
                                      '  (SELECT * FROM CAJA302'                                                                         +
                                      '   WHERE CAJA302.ECFCOMP ='+DMTE.wRepFuncDate + ''''+xFechaSaldoTlfn+''')'                           +
                                      '      AND (CAJA302.BANCOID IS NOT NULL)'                                                          +
                                      '      AND (CAJA302.BANCOID <> '')'                                                                +
                                      '      AND (CAJA302.CCBCOID IS NOT NULL)'                                                          +
                                      '      AND (CAJA302.CCBCOID <> '') '                                                               +
                                      '   ) AS CAJA302 '                                                                                 +
                                      '  ON (Tge106.BANCOID = CAJA302.BANCOID) AND (Tge106.CCBCOID = CAJA302.CCBCOID)'                   +
                               '  LEFT OUTER JOIN TGE105 ON  (Tge106.BANCOID = Tge105.BANCOID)'                                          +
                               '  LEFT OUTER JOIN TGE103 ON  (Tge106.TMONID = Tge103.TMONID)'                                            +
                               '  LEFT OUTER JOIN'                                                                                       +
                                    '    (SELECT * FROM CAJA310'                                                                         +
                                    '     WHERE STFECHA='+DMTE.wRepFuncDate + ''''+xFechaSaldoTlfn+''')'                                    +
                                    '    ) AS TMPX'                                                                                      +
                                    ' ON (Tge106.BANCOID = TMPX.BANCOID) AND (Tge106.CCBCOID = TMPX.CCBCOID)'                            +
                               'GROUP BY Tge106.CCBCOID, Tge106.CCBCODES, Tge103.TMON_LOC,'                                              +
                                           '    CAJA302.EC_IE, Tge105.BANCOABR, Tge105.BANCOID,'                                         +
                                           '    Tge103.TMONABR,Tge103.TMONID,TMPX.STSALDOTLFN,'                                          +
                                           '    TMPX.STINGRESOTLFN,TMPX.STEGRESOTLFN'                                                    +
                       ') AS TMP'                                                                                                        +
               ') AS TMP2'                                                                                                               +
               'GROUP BY TMP2.BANCOABR, TMP2.BANCOID,TMP2.CCBCOID,'                                                                      +
               '    TMP2.CCBCODES, TMP2.TMONABR,TMP2.TMONID,TMP2.SALDOTLFN,'                                                             +
               '    TMP2.STINGRESOTLFN,TMP2.STEGRESOTLFN) AS SALDO_TLFN'                                                                 +
               'LEFT JOIN'                                                                                                               +
               '  (SELECT XXX.BANCOID,XXX.CCBCOID,(XXX.SUMINGRESOS -XXX.SUMEGRESOS+'+DMTE.wReplacCeros+'(STSALDOFIN,0.00)) SALDOINICIAL'  +
               '   FROM (SELECT BANCOID, CBCOID,'                                                                                        +
                     '      '+DMTE.wReplacCeros+'(SUM(SUMI),0.00) SUMINGRESOS,'+DMTE.wReplacCeros+'(SUM(SUME),0.00) SUMEGRESOS'            +
                     '   FROM (SELECT Tge106.BANCOID, Tge106.CCBCOID, CAJA302.EC_IE ,'                                                   +
                              '   CASE WHEN EC_IE=''I'' THEN '+DMTE.wReplacCeros+'(DEC(SUM( CAJA302.ECMTOORI ),15,2) ,0.00) END SUMI,'    +
                              '   CASE WHEN EC_IE=''E'' THEN '+DMTE.wReplacCeros+'(DEC(SUM( CAJA302.ECMTOORI ),15,2) ,0.00) END SUME'     +
                              'FROM TGE106 Tge106'                                                                                       +
                              'LEFT OUTER JOIN  (SELECT * FROM CAJA302'                                                                  +
                                               ' WHERE (CAJA302.ECFCOMP >'+DMTE.wRepFuncDate + ''''+xFechaUltCierre+''')'                   +
                                               '    AND CAJA302.ECFCOMP <'+DMTE.wRepFuncDate + ''''+xFechaSaldoTlfn+'''))'                  +
                                               '    AND  (CAJA302.BANCOID IS NOT NULL)'                                                  +
                                               '    AND  (CAJA302.BANCOID <> '')'                                                        +
                                               '    AND  (CAJA302.CCBCOID IS NOT NULL)'                                                  +
                                               '    AND  (CAJA302.CCBCOID <> '') )  AS CAJA302'                                          +
                              '     ON  (Tge106.BANCOID = CAJA302.BANCOID) AND  (Tge106.CCBCOID = CAJA302.CCBCOID)'                      +
                     '   GROUP BY  Tge106.BANCOID, Tge106.CCBCOID, CAJA302.EC_IE) AS KKK'                                                +
               'GROUP BY BANCOID,CCBCOID   ) AS XXX'                                                                                     +
               'LEFT JOIN (SELECT BANCOID, CCBCOID, STSALDOFIN'                                                                          +
                        '  FROM CAJA310 '                                                                                                +
                        '  WHERE STFECHA=(SELECT '+DMTE.wReplacCeros+'(MAX( FECCIERRE ),'+DMTE.wRepFuncDate + '1900-01-01''))'             +
                        '  FROM CAJA309)) AS KKK'                                                                                        +
                    ' ON (XXX.BANCOID=KKK.BANCOID AND  XXX.CCBCOID=KKK.CCBCOID)) AS SALDO_MOV'                                            +
               'ON (SALDO_TLFN.BANCOID = SALDO_MOV.BANCOID) AND  (SALDO_TLFN.CCBCOID = SALDO_MOV.CCBCOID)'
   else
   	if DMTE.SRV_D = 'ORACLE' then
      xSQL:='SELECT SALDO_TLFN.* ,SALDO_MOV.SALDOINICIAL,(SALDO_MOV.SALDOINICIAL+TOTINGRESOS-TOTEGRESOS) SALDOFINAL'                       +
            'FROM'                                                                                                                         +
                '(SELECT SALDOTLFN,'                                                                                                       +
                   'DECODE( STINGRESOTLFN,0, '+DMTE.wReplacCeros+'(SUM(TMP2.INGRESO),0.00) , STINGRESOTLFN ) INGRESOSTLFN,'                 +
                   'DECODE( STEGRESOTLFN ,0, '+DMTE.wReplacCeros+'(SUM(TMP2.EGRESO ),0.00) , STEGRESOTLFN  ) EGRESOSTLFN,'                  +
                   'TMP2.BANCOABR, TMP2.BANCOID, TMP2.CCBCOID, TMP2.CCBCODES, TMP2.TMONABR, TMP2.TMONID,'                                  +
                   ''+DMTE.wReplacCeros+'(SUM(TMP2.INGRESO ),0.00) TOTINGRESOS,'                                                            +
                   ''+DMTE.wReplacCeros+'(SUM( TMP2.EGRESO ),0.00) TOTEGRESOS'                                                              +
                 'FROM (SELECT TMP.*,'                                                                                                     +
                         '  DECODE( TMP.EC_IE=''I'' , TMP.SUMORI )  AS INGRESO,'                                                           +
                         '  DECODE( TMP.EC_IE=''E'' , TMP.SUMORI ) AS EGRESO'                                                              +
                         'FROM (SELECT Tge105.BANCOABR, Tge105.BANCOID,'                                                                   +
                                 '  Tge106.CCBCOID, Tge106.CCBCODES,'                                                                      +
                                 '  Tge103.TMONABR, Tge103.TMONID,'                                                                        +
                                 '  Tge103.TMON_LOC, CAJA302.EC_IE ,'                                                                      +
                                 '  '+DMTE.wReplacCeros+'(TMPX.STSALDOTLFN,0.00) AS SALDOTLFN,'                                             +
                                 '  '+DMTE.wReplacCeros+'(TMPX.STINGRESOTLFN,0.00) AS STINGRESOTLFN,'                                       +
                                 '  '+DMTE.wReplacCeros+'(TMPX.STEGRESOTLFN,0.00) AS STEGRESOTLFN,'                                         +
                                 '  TRUNC(SUM( CAJA302.ECMTOORI ),2) SUMORI'                                                              +
                                 'FROM TGE106, TGE105, TGE103, '                                                                           +
                                             '(SELECT * FROM CAJA302'                                                                      +
                                              'WHERE CAJA302.ECFCOMP ='+DMTE.wRepFuncDate + ''''+xFechaSaldoTlfn+''')'                        +
                                                ' AND (CAJA302.BANCOID IS NOT NULL)'                                                       +
                                                ' AND (CAJA302.BANCOID <> '')'                                                             +
                                                ' AND (CAJA302.CCBCOID IS NOT NULL)'                                                       +
                                                ' AND (CAJA302.CCBCOID <> '') '                                                            +
                                             ') AS CAJA302, '                                                                              +
                                             '(SELECT * FROM CAJA310'                                                                      +
                                              ' WHERE STFECHA='+DMTE.wRepFuncDate + ''''+xFechaSaldoTlfn+''')'                                +
                                             ') AS TMPX'                                                                                   +
                                 'WHERE (Tge106.BANCOID = CAJA302.BANCOID) (+) '                                                           +
                                    'AND (Tge106.CCBCOID = CAJA302.CCBCOID) (+)'                                                           +
                                    'AND (Tge106.BANCOID = Tge105.BANCOID) (+)'                                                            +
                                    'AND (Tge106.TMONID = Tge103.TMONID) (+)'                                                              +
                                    'AND (Tge106.BANCOID = TMPX.BANCOID) (+)'                                                              +
                                    'AND (Tge106.CCBCOID = TMPX.CCBCOID) (+)'                                                              +
                                 'GROUP BY Tge106.CCBCOID, Tge106.CCBCODES, Tge103.TMON_LOC,'                                              +
                                           'CAJA302.EC_IE, Tge105.BANCOABR, Tge105.BANCOID,'                                               +
                                           'Tge103.TMONABR,Tge103.TMONID,TMPX.STSALDOTLFN,'                                                +
                                           'TMPX.STINGRESOTLFN,TMPX.STEGRESOTLFN'                                                          +
                         ') AS TMP'                                                                                                        +
                 ') AS TMP2'                                                                                                               +
                 'GROUP BY TMP2.BANCOABR, TMP2.BANCOID,TMP2.CCBCOID,'                                                                      +
                    ' TMP2.CCBCODES, TMP2.TMONABR,TMP2.TMONID,TMP2.SALDOTLFN,'                                                             +
                    ' TMP2.STINGRESOTLFN,TMP2.STEGRESOTLFN) AS SALDO_TLFN, '                                                               +
             '(SELECT XXX.BANCOID,XXX.CCBCOID,(XXX.SUMINGRESOS -XXX.SUMEGRESOS+'+DMTE.wReplacCeros+'(STSALDOFIN,0.00)) SALDOINICIAL'        +
             ' FROM ('                                                                                                                     +
                  '(SELECT BANCOID, CBCOID,'                                                                                               +
                    '   '+DMTE.wReplacCeros+'(SUM(SUMI),0.00) SUMINGRESOS,'+DMTE.wReplacCeros+'(SUM(SUME),0.00) SUMEGRESOS'                  +
                    'FROM (SELECT Tge106.BANCOID, Tge106.CCBCOID, CAJA302.EC_IE ,'                                                         +
                          '   DECODE( EC_IE=''I'' , '+DMTE.wReplacCeros+'(TRUNC(SUM( CAJA302.ECMTOORI ),2) ,0.00) ) SUMI, '                +
                          '   DECODE( EC_IE=''E'' , '+DMTE.wReplacCeros+'(TRUNC(SUM( CAJA302.ECMTOORI ),2) ,0.00) ) SUME '                 +
                          'FROM TGE106, (SELECT * FROM CAJA302'                                                                            +
                                           ' WHERE (CAJA302.ECFCOMP >'+DMTE.wRepFuncDate + ''''+xFechaUltCierre+''')'                         +
                                              ' AND CAJA302.ECFCOMP <'+DMTE.wRepFuncDate + ''''+xFechaSaldoTlfn+'''))'                        +
                                              ' AND (CAJA302.BANCOID IS NOT NULL)'                                                         +
                                              ' AND (CAJA302.BANCOID <> '')'                                                               +
                                              ' AND (CAJA302.CCBCOID IS NOT NULL)'                                                         +
                                              ' AND  (CAJA302.CCBCOID <> '') )  AS CAJA302'                                                +
                          'WHERE (Tge106.BANCOID = CAJA302.BANCOID (+)) AND (Tge106.CCBCOID = CAJA302.CCBCOID (+))'                        +
                          'GROUP BY  Tge106.BANCOID, Tge106.CCBCOID, CAJA302.EC_IE) AS KKK'                                                +
                    'GROUP BY BANCOID,CCBCOID   ) AS XXX,'                                                                                 +
                  '(SELECT BANCOID, CCBCOID, STSALDOFIN'                                                                                   +
                    'FROM CAJA310 '                                                                                                        +
                    'WHERE STFECHA=(SELECT '+DMTE.wReplacCeros+'(MAX( FECCIERRE ),'+DMTE.wRepFuncDate + '1900-01-01''))'                     +
                    'FROM CAJA309)) AS KKK'                                                                                                +
            ' WHERE (XXX.BANCOID=KKK.BANCOID (+) AND XXX.CCBCOID=KKK.CCBCOID) (+) ) AS SALDO_MOV '                                                     +
      'WHERE (SALDO_TLFN.BANCOID = SALDO_MOV.BANCOID (+)) AND  (SALDO_TLFN.CCBCOID = SALDO_MOV.CCBCOID (+))';

   with DMTE do
   begin
     cdsQry.Close;
     cdsQry.ProviderName:='prvCaja';
     cdsQry.DataRequest(xSQL);
     cdsQry.Open;
     with cdsQry do
     begin
        FieldByName('SALDOINICIAL').ReadOnly := True ;
        FieldByName('SALDOFINAL').ReadOnly := True ;
        FieldByName('TOTINGRESOS').ReadOnly := True ;
        FieldByName('TOTEGRESOS').ReadOnly := True ;
     end;
     dbgSaldoTlfn.DataSource := dsQry ;
   end;

   xFechaCalculo := dbdtpFecSdoTlfn.Text ;
end;

procedure TFSaldoTelefonico.dbdtpFecSdoTlfnEnter(Sender: TObject);
begin
    strTmp := dbdtpFecSdoTlfn.Text ;
end;

procedure TFSaldoTelefonico.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

end.

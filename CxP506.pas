unit CxP506;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, Buttons,db, StrContainer, ppEndUsr, ppProd, ppClass,
  ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppBands, ppCtrls,
  ppVar, ppPrnabl,ppViewr;

type
  TFTransfRetPDT = class(TForm)
    lblCia: TLabel;
    dblcRUC: TwwDBLookupCombo;
    dblcPeriodo1: TwwDBLookupCombo;
    Label1: TLabel;
    bbtnOK: TBitBtn;
    bbtncancel: TBitBtn;
    sc: TStrContainer;
    sd: TSaveDialog;
    ppDBReport: TppDBPipeline;
    ppReport: TppReport;
    ppDesigner1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    pplblCia: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel3: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppFooterBand1: TppFooterBand;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure NotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure bbtncancelClick(Sender: TObject);
    procedure dblcRUCExit(Sender: TObject);
    procedure dblcPeriodo1Exit(Sender: TObject);
    procedure bbtnOKClick(Sender: TObject);
    procedure ppReportPreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ValidarDatos;
  public
    { Public declarations }
  end;

var
  FTransfRetPDT: TFTransfRetPDT;

implementation

uses CxPDM;

{$R *.DFM}

procedure TFTransfRetPDT.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFTransfRetPDT.FormShow(Sender: TObject);
var xSQL:string;
    a,m,d:word;
begin
   DecodeDate(date,a,m,d);

   DM1.cdsSQL.Close;
   xSQL:= 'SELECT CIAID, CIARUC, CIADES FROM TGE101 GROUP BY CIAID, CIARUC, CIADES';
   DM1.cdsSQL.ProviderName:='dspTGE';
   DM1.cdsSQL.DataRequest(xSQL);
   DM1.cdsSQL.Open;

   xSQL := 'SELECT ANOMES PERIODO FROM TGE813';
   DM1.cdsQry2.IndexFieldNames :='';
   DM1.cdsQry2.Filter   := '';
   DM1.cdsQry2.Filtered := False;
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(xSQL);
   DM1.cdsQry2.Open;
//   DM1.cdsQry2.IndexFieldNames:='PERIODO';
//   DM1.cdsQry2.Setkey;
//   DM1.cdsQry2.FieldByName('PERIODO').AsString:=StrZero(IntToStr(a),4)+StrZero(IntToStr(m),2);
//   DM1.cdsQry2.Gotokey;

   dblcPeriodo1.LookupTable := DM1.cdsQry2;
   dblcPeriodo1.LookupField := 'PERIODO';
   dblcPeriodo1.Text:=StrZero(IntToStr(a),4)+StrZero(IntToStr(m),2);


end;

procedure TFTransfRetPDT.NotInList(Sender: TObject; LookupTable: TDataSet;
  NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFTransfRetPDT.bbtncancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFTransfRetPDT.dblcRUCExit(Sender: TObject);
begin
  if bbtncancel.focused then exit;

  if dblcRUC.text='' then
  begin
    dblcRUC.SetFocus;
    Raise Exception.Create('Ingrese Ruc');
  end;
end;

procedure TFTransfRetPDT.dblcPeriodo1Exit(Sender: TObject);
begin
  if bbtncancel.focused then exit;
  if dblcPeriodo1.text='' then
  begin
    dblcPeriodo1.SetFocus;
    Raise Exception.Create('Ingrese Ruc');
  end;
end;

procedure TFTransfRetPDT.bbtnOKClick(Sender: TObject);
var sSQL:string;
    sNatu,sJuri:string;
begin
  ValidarDatos;
  sSQL:='SELECT ''1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'' GLOSA FROM TGE901 WHERE DUME=''CLG'' ';
  FiltraCds(DM1.cdsReporte,sSQL);

  sC.Lines.Clear;
  sSQL:='SELECT * FROM TGE109 WHERE TIPPERS=''S'' ';
  FiltraCds(DM1.cdsQry,sSQL);
  sNatu:=DM1.cdsQry.FieldByName('TIPPERID').AsString;

  sSQL:='SELECT * FROM TGE109 WHERE TIPPERS=''N'' ';
  FiltraCds(DM1.cdsQry,sSQL);
  sJuri:=DM1.cdsQry.FieldByName('TIPPERID').AsString;

  if SRV_D = 'ORACLE' then
  sSQL:= ' SELECT RUC||''|''||RAZONSOCIAL||''|''||APELLIDOPATERNO||''|''||APELLIDOMATERNO||''|''||NOMBRES||''|''||RETSERIE||''|''||RETNUMERO||''|''||EMISIONRET|| '+
   ' ''|''||TRIM(TO_CHAR(MONTOPAGO,''999999999999.00''))||''|''||TIPOCOMPROB||''|''||SERIECOMPROB||''|''||NROCOMPROB||''|''||EMISIONCOMPROB||''|''||TRIM(TO_CHAR(MTOLOC,''999999999999.00''))||''|'' XSQL, '+
   ' RAZONSOCIAL,NOMBRES,APELLIDOMATERNO,APELLIDOPATERNO,TIPPERID,AUXID,PROVDES FROM ( '+
   ' SELECT TIPPERID,AUXID,PROVDES,SUBSTR(A.AUXRUC,1,11) RUC,CASE WHEN B.TIPPERID='+QuotedStr(sJuri)+' THEN SUBSTR(PROVDES,1,40) ELSE '''' END RAZONSOCIAL, '+
   ' CASE WHEN B.TIPPERID='+QuotedStr(sNatu)+' THEN SUBSTR(PROVAPEPAT,1,20) ELSE '''' END APELLIDOPATERNO, '+
   ' CASE WHEN B.TIPPERID='+QuotedStr(sNatu)+' THEN SUBSTR(PROVAPEMAT,1,20) ELSE '''' END APELLIDOMATERNO, '+
   ' CASE WHEN B.TIPPERID='+QuotedStr(sNatu)+' THEN SUBSTR(PROVNOMBRE,1,20) ELSE '''' END NOMBRES,SUBSTR(A.RETSERIE,1,4) RETSERIE, '+
   ' SUBSTR(A.RETNUMERO,3,8) RETNUMERO,TO_CHAR(A.FECPAGO,'+QuotedStr(DM1.wFormatFecha)+') EMISIONRET, C.MTOLOC MONTOPAGO, A.DOCID TIPOCOMPROB, '+
   ' SUBSTR(A.SERIE,1,4) SERIECOMPROB, SUBSTR(A.NODOC,1,8) NROCOMPROB,TO_CHAR(A.FECEMI,'+QuotedStr(DM1.wFormatFecha)+') EMISIONCOMPROB, '+
   ' A.MTOLOC MTOLOC '+
   ' FROM CNT320 A, TGE201 B, '+
   ' (SELECT RETNUMERO,SUM(C.MTOLOC)  MTOLOC FROM CNT320 C GROUP BY RETNUMERO) C '+
   ' WHERE A.CLAUXID=B.CLAUXID AND A.AUXID=B.PROV AND A.CIARUC='+QuotedStr(dblcRUC.text)+' AND A.ANOMM='+QuotedStr(dblcPeriodo1.text)+
   ' AND NVL(A.ECESTADO,''X'')<>''A'' AND A.RETNUMERO=C.RETNUMERO)X '
  else
  if (SRV_D = 'DB2NT') or
   	 (SRV_D = 'DB2400') then
    // FALTA REVISAR PARA ORACLE
  sSQL:= ' SELECT RUC||''|''||RAZONSOCIAL||''|''||APELLIDOPATERNO||''|''||APELLIDOMATERNO||''|''||NOMBRES||''|''||RETSERIE||''|''||RETNUMERO||''|''||EMISIONRET|| '+
   ' ''|''||TRIM(TO_CHAR(MONTOPAGO,''999999999999.00''))||''|''||TIPOCOMPROB||''|''||SERIECOMPROB||''|''||NROCOMPROB||''|''||EMISIONCOMPROB||''|''||TRIM(TO_CHAR(MTOLOC,''999999999999.00''))||''|'' XSQL FROM ( '+
   ' SELECT SUBSTR(A.AUXRUC,1,11) RUC,CASE WHEN B.TIPPERID='+QuotedStr(sJuri)+' THEN SUBSTR(PROVDES,1,40) ELSE '''' END RAZONSOCIAL, '+
   ' CASE WHEN B.TIPPERID='+QuotedStr(sNatu)+' THEN SUBSTR(PROVAPEPAT,1,20) ELSE '''' END APELLIDOPATERNO, '+
   ' CASE WHEN B.TIPPERID='+QuotedStr(sNatu)+' THEN SUBSTR(PROVAPEMAT,1,20) ELSE '''' END APELLIDOMATERNO, '+
   ' CASE WHEN B.TIPPERID='+QuotedStr(sNatu)+' THEN SUBSTR(PROVNOMBRE,1,20) ELSE '''' END NOMBRES,SUBSTR(A.RETSERIE,1,4) RETSERIE, '+
   ' SUBSTR(A.RETNUMERO,3,8) RETNUMERO,TO_CHAR(A.FECPAGO,'+QuotedStr(DM1.wFormatFecha)+') EMISIONRET, C.MTOLOC MONTOPAGO, A.DOCID TIPOCOMPROB, '+
   ' SUBSTR(A.SERIE,1,4) SERIECOMPROB, SUBSTR(A.NODOC,1,8) NROCOMPROB,TO_CHAR(A.FECEMI,'+QuotedStr(DM1.wFormatFecha)+') EMISIONCOMPROB, '+
   ' A.MTOLOC MTOLOC '+
   ' FROM CNT320 A, TGE201 B, '+
   ' (SELECT RETNUMERO,SUM(C.MTOLOC)  MTOLOC FROM CNT320 C GROUP BY RETNUMERO) C '+
   ' WHERE A.CLAUXID=B.CLAUXID AND A.AUXID=B.PROV AND A.CIARUC='+QuotedStr(dblcRUC.text)+' AND A.ANOMM='+QuotedStr(dblcPeriodo1.text)+
   ' AND NVL(A.ECESTADO,''X'')<>''A'' AND A.RETNUMERO=C.RETNUMERO)X ';

  DM1.cdsQry.Close;
  DM1.cdsQry.DataRequest(sSQL);
  DM1.cdsQry.Open;
  DM1.cdsQry.First;
  while not DM1.cdsQry.EOF do
  begin
     if DM1.cdsQry.FieldByName('TIPPERID').AsString='' then
     begin
       {Raise Exception.Create('El proveedor '+DM1.cdsQry.FieldByName('AUXID').AsString+' '+DM1.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Tipo de Persona.'+#13+
               'Actualice Maestro de Proveedores ');
       }
       DM1.cdsReporte.Append;
       DM1.cdsReporte.FieldByName('GLOSA').AsString:='El proveedor '+DM1.cdsQry.FieldByName('AUXID').AsString+' '+DM1.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Tipo de Persona.';
       DM1.cdsReporte.Post;
     end;

     if DM1.cdsQry.FieldByName('TIPPERID').AsString=sNatu then
     begin
        if DM1.cdsQry.FieldByName('APELLIDOPATERNO').AsString='' then
        begin
          {Raise Exception.Create('El proveedor '+DM1.cdsQry.FieldByName('AUXID').AsString+' '+DM1.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Apellido Paterno.'+#13+
                  'Actualice Maestro de Proveedores ');}
          DM1.cdsReporte.Append;
          DM1.cdsReporte.FieldByName('GLOSA').AsString:='El proveedor '+DM1.cdsQry.FieldByName('AUXID').AsString+' '+DM1.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Apellido Paterno.';
          DM1.cdsReporte.Post;
        end;
        if DM1.cdsQry.FieldByName('APELLIDOMATERNO').AsString='' then
        begin
          {Raise Exception.Create('El proveedor '+DM1.cdsQry.FieldByName('AUXID').AsString+' '+DM1.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Apellido Materno.'+#13+
                  'Actualice Maestro de Proveedores ');}
          DM1.cdsReporte.Append;
          DM1.cdsReporte.FieldByName('GLOSA').AsString:='El proveedor '+DM1.cdsQry.FieldByName('AUXID').AsString+' '+DM1.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Apellido Materno.';
          DM1.cdsReporte.Post;
        end;
        if DM1.cdsQry.FieldByName('NOMBRES').AsString='' then
        begin
          {Raise Exception.Create('El proveedor '+DM1.cdsQry.FieldByName('AUXID').AsString+' '+DM1.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Nombres.'+#13+
                  'Actualice Maestro de Proveedores ');}
          DM1.cdsReporte.Append;
          DM1.cdsReporte.FieldByName('GLOSA').AsString:='El proveedor '+DM1.cdsQry.FieldByName('AUXID').AsString+' '+DM1.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Nombres.';
          DM1.cdsReporte.Post;
        end;
     end;

     if DM1.cdsQry.FieldByName('TIPPERID').AsString=sJuri then
     begin
        if DM1.cdsQry.FieldByName('RAZONSOCIAL').AsString='' then
        begin
          {Raise Exception.Create('El proveedor '+DM1.cdsQry.FieldByName('AUXID').AsString+' '+DM1.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Razón Social.'+#13+
                  'Actualice Maestro de Proveedores ');}
          DM1.cdsReporte.Append;
          DM1.cdsReporte.FieldByName('GLOSA').AsString:='El proveedor '+DM1.cdsQry.FieldByName('AUXID').AsString+' '+DM1.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Razón Social.';
          DM1.cdsReporte.Post;
        end;
     end;

     sC.Lines.Add(DM1.cdsQry.FieldByName('XSQL').AsString);
     DM1.cdsQry.Next;
  end;
  if DM1.cdsReporte.RecordCount>0 then
  begin
    ppReport.Template.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt+'\TxRetencionPDT.rtm' ;
    ppReport.Template.LoadFromFile;
    pplblCia.caption:=DM1.cdsSQL.FieldByName('CIADES').AsString;
    ppDBReport.DataSource:=DM1.dsReporte;
    ppReport.DataPipeline:=ppDBReport;
    ppReport.Print;
    //ppDesigner1.Show;
  end
  else
  begin
     sd.Filename:='0626'+dblcRUC.text+dblcPeriodo1.text;
     if sd.execute then
     begin
       sC.Lines.SaveToFile(sd.filename);
     end;
  end;
  Close;
end;

procedure TFTransfRetPDT.ValidarDatos;
begin
  if dblcRUC.text='' then
  begin
    dblcRUC.SetFocus;
    Raise Exception.Create('Ingrese Ruc');
  end;
  if dblcPeriodo1.text='' then
  begin
    dblcPeriodo1.SetFocus;
    Raise Exception.Create('Ingrese Periodo');
  end;
  
end;

procedure TFTransfRetPDT.ppReportPreviewFormCreate(Sender: TObject);
begin
   ppReport.PreviewForm.WindowState:=WsMaximized;
   TppViewer(ppReport.PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
end;

end.

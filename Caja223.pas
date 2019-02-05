unit Caja223;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, wwdbedit, wwdblook, ExtCtrls, db, StrContainer, ShellAPI,
  dbclient, wwclient, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, Variants ;

type
  TFTrans = class(TForm)
    gbHEADER: TGroupBox;
    Label9: TLabel;
    dblcBanco: TwwDBLookupCombo;
    dbeBanco: TwwDBEdit;
    Label11: TLabel;
    dblcCIA: TwwDBLookupCombo;
    dbeCIA: TwwDBEdit;
    Z2bbtnOK: TBitBtn;
    edFILEPATH: TEdit;
    Label1: TLabel;
    btnFILEPATH: TButton;
    opDLG: TOpenDialog;
    scFILES: TStrContainer;
    Z2bbtnVerArch: TBitBtn;
    Z2bbtnProcesar: TBitBtn;
    pb: TProgressBar;
    Label10: TLabel;
    dblcCtaCte: TwwDBLookupCombo;
    dbeCtaCte: TwwDBEdit;
    pnlTransf: TPanel;
    dbgMov: TwwDBGrid;
    bbtnTransfer: TBitBtn;
    procedure dblcBancoChange(Sender: TObject);
    procedure dblcExist(Sender: TObject);
    procedure dblcNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure Z2bbtnOKClick(Sender: TObject);
    procedure dblcCIAChange(Sender: TObject);
    procedure btnFILEPATHClick(Sender: TObject);
    procedure Z2bbtnVerArchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Z2bbtnProcesarClick(Sender: TObject);
    procedure edFILEPATHChange(Sender: TObject);
  private
    { Private declarations }
    sCIA, sBCO, sPFiltro : String;

    procedure Transfer;
    procedure dcCIA;
    procedure ValidarCampos;    
  public
    { Public declarations }
  end;

var
  FTrans: TFTrans;

implementation

uses CajaDM;

{$R *.DFM}


procedure TFTrans.dcCIA;
begin
  DMTE.cdsCIA.First;
  sCIA := trim(DMTE.cdsCIA.FieldByName('CIAID').AsString);
  dblcCIA.Text := sCIA;
  dblcCIA.Enabled := DMTE.cdsCIA.RecordCount > 1;
end;

procedure TFTrans.dblcBancoChange(Sender: TObject);
begin

 sBCO := dblcBanco.Text;
 dbeBanco.Text := DMTE.cdsBanco.FieldByName('BANCONOM').AsString;
  if sBCO = '' then
 begin
   dbeBanco.Text := '';
   Exit;
 end;

 if DMTE.cdsTransBCO.State in [dsInsert] then
 begin
    if DMTE.cdsTransBCO.Locate('BANCOID','BANCOID',[]) then
    begin
     Application.MessageBox( ' No se puede insertar un nuevo registro de bancos,'+#13+
                             ' la plantilla de banco ya existe','Error',MB_OK+MB_ICONERROR);
     DMTE.cdsTransBCO.Cancel;
     Exit;
    end;
 end;

end;

procedure TFTrans.dblcExist(Sender: TObject);
var
  bRq : Boolean;
  xsql : string;
begin
  if TwwDBCustomLookupCombo(Sender).DataSource <> nil then
    bRq := TwwDBCustomLookupCombo(Sender).DataSource.DataSet.FieldByName(TwwDBCustomLookupCombo(Sender).DataField).Required;

  if (bRq)  and (trim(TwwDBCustomLookupCombo(Sender).Text)='') then
    TwwDBCustomLookupCombo(Sender).DropDown;

	if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then begin
  xsql := 'SELECT TGE106.*, TGE103.TMONDES, TGE103.TMONABR'+
          ' FROM TGE106 Inner Join TGE103 on TGE106.TMONID=TGE103.TMONID'+
          ' WHERE BANCOID='+quotedstr(sBCO) +' ORDER BY BANCOID';
  end;
	if DMTE.SRV_D = 'ORACLE' then begin
  xsql := 'SELECT TGE106.*, TGE103.TMONDES, TGE103.TMONABR'+
          ' FROM TGE106, TGE103 '+
          ' WHERE BANCOID='+quotedstr(sBCO)  +
          '  and TGE106.TMONID=TGE103.TMONID'+
          ' ORDER BY BANCOID';
  end;
  DMTE.cdsCCBCO.Close;
  DMTE.cdsCCBCO.DataRequest(xSql);
  DMTE.cdsCCBCO.Open;


end;

procedure TFTrans.dblcNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFTrans.Z2bbtnOKClick(Sender: TObject);
begin
   ValidarCampos;
   
   Z2bbtnOK.Enabled := False;
   DMTE.cdsTransBCO.Close;
   DMTE.cdsTransBCO.DataRequest ('SELECT * FROM CAJA312 WHERE BANCOID='''+sBCO+'''');
   DMTE.cdsTransBCO.Open;

   if edFILEPATH.Text='' then
   begin
      Application.MessageBox( 'Debe ingresar el Nombre del Archivo..','Error',MB_OK+MB_ICONERROR);
      Exit;
   end;

   if not FileExists(edFILEPATH.Text) then
   begin
      Application.MessageBox( 'El Archivo no Existe','Error',MB_OK+MB_ICONERROR);
      Exit;
   end;

   scFILES.Lines.LoadFromFile(edFILEPATH.Text);

   Transfer;

   Z2bbtnOK.Enabled := True;

   Z2bbtnProcesar.Enabled := True;
   Z2bbtnVerArch.Enabled := True;
end;

procedure TFTrans.dblcCIAChange(Sender: TObject);
begin
  sCIA := dblcCIA.Text;
  dbeCIA.Text := DMTE.cdsCia.FieldByName('CIADES').AsString;
end;

procedure TFTrans.btnFILEPATHClick(Sender: TObject);
begin
  if opDLG.Execute then
  begin
    edFILEPATH.Text := opDLG.FileName;
    Z2bbtnVerArch.Enabled := True;
  end;
end;

procedure TFTrans.Transfer;
var
  i, j, CI, CF : Integer;
  sfecha,xValue,xcampos,xsql,sX, NF, sNames, Value, Typ, Fmt,xTmp : String;
  varValues : Variant;
begin
 pb.Max := scFILES.Lines.Count-1;
 pb.Visible := true;
 with DMTE do
  //** 26/03/2001 - pjsv
  begin
    for i:=0 to scFILES.Lines.Count-1 do
      begin
        if Length(trim(scFILES.Lines[i])) = 0 then Continue;
        pb.Position := i;
        xCampos := 'CIAID, BANCOID, CCBCOID';
        xValue := quotedstr(sCia)+','+quotedstr(sBCO)+','+quotedstr(dblcCtaCte.Text);
        sNames := '';
        DMTE.cdsTransBCO.First;
        j := 0;
        while not DMTE.cdsTransBCO.Eof do
        begin
           CI := DMTE.cdsTransBCO.FieldByName('ESINI').AsInteger;
           CF := DMTE.cdsTransBCO.FieldByName('ESFIN').AsInteger;
           NF := DMTE.cdsTransBCO.FieldByName('ESEQUIFLD').AsString;
           Value := Copy(scFILES.Lines[i],CI,(CF-CI)+1);
           Typ := DMTE.cdsTransBCO.FieldByName('ESTIPO').AsString;
           if not DMTE.cdsTransBCO.FieldByName('ESFORMAT').IsNull then
              Fmt := DMTE.cdsTransBCO.FieldByName('ESFORMAT').AsString
           else
              Fmt := '';
           if Length(Typ)>0 then
            begin
              If (Typ = 'VARCHAR') OR (Typ ='CHAR') or (Typ ='VARCHAR2') then
              Begin
                if trim(NF)<>'CCBCOID' then begin
                   if Length(Fmt)=0 then Fmt := '%s';
                      sNames  := (' AND '+ trim(NF)+' = '''+Trim(Value)+'''') + sNames ;
                      xCampos := xCampos + ','+trim(NF);
                      xValue := xValue + ','+quotedstr(Trim(Value));
                end;
              end;
              If Typ = 'INTEGER' then
               Begin
                sNames  := (' AND '+ trim(NF)+' = '+IntToStr(StrToInt(Value)))+ sNames;
                 xCampos := xCampos + ','+trim(NF);
                 xValue := xValue + ','+Value;
               end;
              If Typ = 'DECIMAL' then
               Begin
                  xTmp := Trim(value);
                   if xTmp='' then value:='0';
                   sNames  := (' AND '+ trim(NF)+' = '+FloatToStr(StrToFloat(Value)))+sNames;
                 xCampos := xCampos + ','+trim(NF);
                 xValue := xValue + ','+FloatToStr(StrToFloat(Value));
               end;
              If Typ = 'DATE' then
               Begin
                 sFecha := FormatDateTime(Fmt,StrToDate(Value));
                 sFecha := FormatDateTime(wFormatFecha,StrToDate(Value));
                 sNames  := (' AND '+ trim(NF)+' = '''+sFecha+'''')+sNames;
                 xCampos := xCampos + ','+trim(NF);
                 xValue := xValue + ','+quotedstr(sFecha);
               end;
            end;
           DMTE.cdsTransBCO.Next;
           inc(j);
        end; {WITH}
        sNames:=Copy(sNames,5,length(sNames));
        sNames:='CIAID='''+dblcCia.Text+''' and BANCOID='''+dblcBanco.Text+''' and '
               +'CCBCOID='''+dblcCtaCte.Text+''' and '+sNames;

        sX:=DisplayDescrip('prvTGE','CAJA313','CIAID',sNames,'CIAID');
        if Length(sX)=0 then
          begin
           xSQL:='INSERT INTO CAJA313 ('+xCampos+')'+
                 ' VALUES ('+xValue+') ';
           cdsSQL.Close;
           cdsSQL.DataRequest(XSQL);
           cdsSQL.Execute;
          end;
      end;
  end;
  //**
 pb.Visible := False;
 varValues:= NULL;
end;

procedure TFTrans.Z2bbtnVerArchClick(Sender: TObject);
begin
     ShellExecute (Handle, 'open',
     PChar (edFILEPATH.Text), '', '', sw_ShowNormal);
end;

procedure TFTrans.FormCreate(Sender: TObject);
var
 xsql : string;
begin
  dcCIA;
  //** 27/03/2001 - pjsv  
  xsql := 'SELECT * FROM TGE105 WHERE (BCOTIPCTA=''B'') ORDER BY BANCOID';
  DMTE.cdsBanco.Close;
  DMTE.cdsBanco.DataRequest(xSql);
  DMTE.cdsBanco.Open;

  dblcCtaCte.Selected.Clear;
  dblcCtaCte.Selected.Add('CCBCOID'#9'25'#9'Cuenta Corriente del Banco'#9'F');
  dblcCtaCte.Selected.Add('CCBCODES'#9'30'#9'Descripción'#9'F');
  dblcCtaCte.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');


  //DMTE.cdsBanco.Open;
  //DMTE.cdsBanco.IndexFieldNames := 'BANCOID';
  //**
  sPFiltro := '(ECNOCHQ<>'''' AND NOT(ECNOCHQ IS NULL))'; // 12345  caja bancos

end;

procedure TFTrans.Z2bbtnProcesarClick(Sender: TObject);
var
 sSQL1, sSQL2, sEQUI, sCOMP,
 sMON,  sNCHQ, sCCB,
 sFPG,  sMto : String;
 fmtori, fxmtori: Double;
begin
//-- Generar--
  sSQL1:= 'SELECT * FROM CAJA302 WHERE CIAID= '''+sCIA+''' AND BANCOID='''+sBCO+'''';
  sSQL2:=  ' SELECT * FROM CAJA313 WHERE CIAID= '''+sCIA+''' AND BANCOID='''+sBCO+''' AND CCBCOID='''+dblcCtaCte.text+''''
         + ' AND ( ECCONSOLID<>''S'' OR ECCONSOLID IS NULL ) ';

  DMTE.cdsExtracBCO.Close;
  DMTE.cdsExtracBCO.DataRequest(sSQL2);
  DMTE.cdsExtracBCO.Open;

  if DMTE.cdsExtracBCO.RecordCount=0 then
     raise exception.Create('No Existen Movimientos Transferidos');


  with DMTE do
  begin
    pb.Visible := True;
    pb.Max := DMTE.cdsExtracBCO.RecordCount;

    while not DMTE.cdsExtracBCO.Eof do
    begin

      sEQUI := DMTE.cdsExtracBCO.FieldByName('EQUIID').AsString;
      sCOMP := DMTE.cdsExtracBCO.FieldByName('ECFCOMP').AsString;
      sMON  := DMTE.cdsExtracBCO.FieldByName('TMONID').AsString;
      sNCHQ := DMTE.cdsExtracBCO.FieldByName('ECNOCHQ').AsString;
      sCCB  := DMTE.cdsExtracBCO.FieldByName('CCBCOID').AsString;
      sMto  := DMTE.cdsExtracBCO.FieldByName('ECMTOORI').AsString;

      sFPG  := DMTE.cdsExtracBCO.FieldByName('FPAGOID').AsString;
{     sSQL1:= ' SELECT * FROM CAJA302 WHERE CIAID= '''+sCIA+''' AND BANCOID='''+sBCO+''''+
             ' AND '+sPFiltro+'AND (ECCONSOLID<>''S'' OR ECCONSOLID IS NULL) '+
             ' AND EQUIID='''+sEQUI+''' AND  ECNOCHQ='''+sNCHQ+''' AND CCBCOID='''+sCCB+'''';}
      sSQL1:='SELECT * FROM CAJA302 '
           +'WHERE CIAID= '''+sCIA+''' AND BANCOID='''+sBCO+''' AND CCBCOID='''+sCCB+''''
           + ' AND ( ECCONSOLID<>''S'' OR ECCONSOLID IS NULL ) ';
      if sNCHQ<>'' then
         sSQL1:=sSQL1+' and ECNOCHQ='''+sNCHQ+'''';
      if sEQUI<>'' then
         sSQL1:=sSQL1+' and EQUIID='''+sEQUI+''' ';
      if sMto<>'' then
         sSQL1:=sSQL1+' and ECMTOORI='+sMto;

      DMTE.cdsQRY.Close;
      DMTE.cdsQRY.DataRequest(sSQL1);
      DMTE.cdsQRY.Open;

      if DMTE.cdsQRY.RecordCount>0 then
      begin
        cdsQRY.Edit;

        cdsQRY.FieldByName('ECCONSOLID').AsString := 'S';

        fmtori  := cdsQRY.FieldByName('ECMTOORI').AsFloat;
        fxmtori := cdsExtracBCO.FieldByName('ECMTOORI').AsFloat;

        cdsQRY.FieldByName('ECMTCON').AsFloat := fxmtori;           // monto conciliado
        cdsQRY.FieldByName('ECMTDIF').AsFloat := fmtori - fxmtori;  // diferencia conciliatoria

        cdsQRY.Post;
        cdsQRY.ApplyUpdates(0);
      end;

     DMTE.cdsExtracBCO.Next;
     pb.Position := DMTE.cdsExtracBCO.RecNo;
    end;

    pb.Visible := False;

  end;
end;

procedure TFTrans.edFILEPATHChange(Sender: TObject);
begin
  Z2bbtnOK.Enabled := True;
end;

procedure TFTrans.ValidarCampos;
begin
   if Length(Trim(dblcCIA.text))=0 then
      raise exception.Create('Ingrese Compañia');

   if Length(Trim(dblcBanco.text))=0 then
      raise exception.Create('Ingrese Banco');

   if Length(Trim(dblcCtaCte.text))=0 then
      raise exception.Create('Ingrese Cta.Cte.');

end;

end.


//** 26/03/2001 - pjsv - NO BORRAR, es una copia
{
procedure TFTrans.Transfer;
var
  i, j, CI, CF : Integer;
  sX, NF, sNames, Value, Typ, Fmt : String;
  fech      : TDate;
  varValues : Variant;
begin
 varValues:= VarArrayCreate([0, DMTE.cdsTransBCO.RecordCount-1 ], varVariant);
 pb.Max := scFILES.Lines.Count-1;
 pb.Visible := true;
 with DMTE, DMTE.cdsTransBCO do
 begin
   cdsExtracBCO.Open;
     for i:=0 to scFILES.Lines.Count-1 do
     begin
        if Length(trim(scFILES.Lines[i])) = 0 then
          Continue;
        pb.Position := i;
        cdsExtracBCO.Insert;
        cdsExtracBCO.FieldByName('CIAID').AsString   := sCIA;
        cdsExtracBCO.FieldByName('BANCOID').AsString := sBCO;
        sNames := '';
        First;
        j := 0;
        while not Eof do
         begin
           CI := FieldByName('ESINI').AsInteger;
           CF := FieldByName('ESFIN').AsInteger;
           NF := FieldByName('ESEQUIFLD').AsString;
           Value := Copy(scFILES.Lines[i],CI,(CF-CI)+1);
           Typ := FieldByName('ESTIPO').AsString;
           if not FieldByName('ESFORMAT').IsNull then
              Fmt := FieldByName('ESFORMAT').AsString
           else
              Fmt := '';
           if Length(Typ)>0 then
            begin
              If Typ = 'VARCHAR' then
               Begin
                if Length(Fmt)=0 then Fmt := '%s';
                 cdsExtracBCO.FieldByName(NF).AsString := Format(Fmt,[Value]);
                 varValues[j] := Value;
                 sNames  := (' AND '+ trim(NF)+' = '''+Trim(Value)+'''') + sNames ;
               end;
              If Typ = 'INTEGER' then
               Begin
                cdsExtracBCO.FieldByName(NF).AsString := Value;
                varValues[j] := StrToInt(Value);
                sNames  := (' AND '+ trim(NF)+' = '+IntToStr(StrToInt(Value)))+ sNames
               end;
              If Typ = 'DECIMAL' then
               Begin
                cdsExtracBCO.FieldByName(NF).AsString := Value;
                varValues[j] := StrToFloat(Value);
                   sNames  := (' AND '+ trim(NF)+' = '+FloatToStr(StrToFloat(Value)))+sNames;
               end;
              If Typ = 'DATE' then
               Begin
                 fech := StrToDate(Value);
                 cdsExtracBCO.FieldByName(NF).AsString := FormatDateTime(Fmt,fech);
                 varValues[j] := FormatDateTime(Fmt,fech);
                 sNames  := (' AND '+ trim(NF)+' = '''+FormatDateTime(Fmt,fech)+'''')+sNames;
               end;
            end
           else
               cdsExtracBCO.FieldByName(NF).AsString := Value;
           Next;
           inc(j);
        end;
        sNames  := Copy(sNames,5,length(sNames));
        sX:=DisplayDescrip('prvTGE','CAJA313','*',sNames,cdsExtracBCO.Fields[0].FieldName);
        if Length(sX)=0 then
        begin
         cdsExtracBCO.Post;
         cdsExtracBCO.ApplyUpdates(-1);
        end
        else begin
          cdsExtracBCO.Cancel;
        end;
     end;
 end;
 pb.Visible := False;
 varValues:= NULL;
end;

}

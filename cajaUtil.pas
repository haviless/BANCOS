// Actualizaciones
// HPC_201401_CAJA   02/04/2014     corrige rutina STRNUM - antepone 0 a número decimal menor que 10      

unit CajaUtil;

interface

uses windows,wwdblook,wwClient,StdCtrls,SysUtils,Classes,extCtrls, buttons , controls ,
    forms ,db , dbclient, variants;

procedure RecuperarCiaUnica(ComboLookUp:TwwDBLookupCombo;Edicion:TEdit);
Function  IsNumeric(S:String):Boolean;
Function  EsFecha(S:String):Boolean;
function  strMes (Fecha : TDateTime) : String ;
function  strDia (Fecha : TDateTime) : String ;
function  strAno (Fecha : TDateTime) : String ;
Function  DiasMes(wMes,wAno:word):Byte;
Function  RecuperaNumero(S:String):Real;
function  EncuentraDuplicado(cds : TwwclientDataset ; Campo ,Clave : String):Boolean;
function  EncuentraDuplicado1(cds : TwwclientDataset ; Campo ,Clave1,Clave2,Clave3 : String):Boolean;
function  StrNum(wNumero:Double):string;
function  FRound2(xReal:currency;xEnteros,xDecimal:Integer):double;
Procedure ValidaEdit(ctrl : TCustomEdit ; Mensaje : String ) ;
procedure Quita(var A1:Array Of Integer;var A2 : Array of TNotifyEvent ;Pnl : TPanel) ;
procedure Pon(A1:Array Of Integer;A2 : Array of TNotifyEvent ;Pnl : TPanel) ;
function  BotonesEnPanel(pnl : TPanel) : INteger ;
function  FechaDB2(Fecha : TDateTime) : String ;
procedure ActivaBotones(pnl: TPanel;xFlag : Boolean);
procedure HabilitaControles ( A : Array of TWinControl ) ;
procedure DesHabilitaControles ( A : Array of TWinControl ) ;
procedure BlanqueaEdits (xPnl : TPanel) ;
procedure BlanqueaEditsEnForm (frm : TForm ;pnl :Tpanel =nil ;gbx : TGroupBox = nil) ;
function  CajaDec(xNumero : string ;Digitos : Integer = 2) : string ;
function  CmpDec( xNum1 , xNum2 : string ) : Integer ;
function  DifDec( xNum1 , xNum2 : string ) : String;
function  Redondea ( xReal : double ; Digitos : Integer = 2 ) : Currency ;
function  OperClientDataSet( ClientDataSet : TwwClientDataSet;
                            Expression, Condicion : String  ) : Double;
function  AplicaKeyPress(Frm : TForm ; A2digitos , A4digitos : Array of TWinControl) : Boolean ;
function  SetPCSystemTime(tDati: TDateTime): Boolean ;
function  UltimoDiaMes(mes : String) : word ;
function  RecuperaCorrelativo(cds : TwwclientDataset ; Campo ,Clave : String):Boolean ;
function  GeneraCorrelativo(cds : TwwclientDataset ; Campo : String):String ;

resourcestring
   BLANCO = '' ;

implementation

uses CajaDM;

procedure RecuperarCiaUnica(ComboLookUp:TwwDBLookupCombo;Edicion:TEdit);
begin
if DMTE.cdsCia.Active=true then
   if DMTE.cdsCia.recordcount=1 then
   begin
      ComboLookUp.Enabled:=FALSE;
   end
   else
   begin
      ComboLookUp.Enabled:=true;
      //ComboLookUp.text:='';
      //Edicion.text:='';
      //try
      //  ComboLookUp.SetFocus
      //except
      //end ;
   end;
   DMTE.cdsCia.first;
   ComboLookUp.Text:=DMTE.cdsCia.fieldbyname('CIAID').AsString;
   Edicion.text:=DMTE.cdsCia.fieldbyname('CIADES').AsString;
end;

Function IsNumeric(S:String):Boolean;
var
   xCodigo : Integer;
   xReal:Real;
begin
   Result:=False;
   if S='.' then
        exit;
   Val(S,xReal,xCodigo);
   if xCodigo<>0 then
        exit;
   result:=True;
end;

Function RecuperaNumero(S:String):Real;
begin
     result:=0;
     if S='' then
        exit;
     result:=strtofloat(s);
end;

function EncuentraDuplicado(cds : TwwclientDataset ; Campo ,Clave : String):Boolean;
var
   cdsClone : TwwClientdataset ;
begin
  try
   result := False;
   cdsClone :=  TwwClientDataSet.Create(nil);
   cdsClone.CloneCursor(cds , false );
   Result := cdsClone.Locate(Campo, Clave,[]) ;
//   Result := cdsClone.Locate(CAMPO, VarArrayOf(['Sight Diver','P']), []);
  finally
   cdsClone.free;
  end;
end;
function EncuentraDuplicado1(cds : TwwclientDataset ; Campo ,Clave1,Clave2,Clave3 : String):Boolean;
var
   cdsClone : TwwClientdataset ;
begin
  try
   result := False;
   cdsClone :=  TwwClientDataSet.Create(nil);
   cdsClone.CloneCursor(cds , false );
//   Result := cdsClone.Locate(Campo, Clave,[]) ;
   Result := cdsClone.Locate(campo, VarArrayOf([Clave1,Clave2,Clave3]), []);
  finally
   cdsClone.free;
  end;
end;

function RecuperaCorrelativo(cds : TwwclientDataset ; Campo ,Clave : String):Boolean;
var
   cdsClone : TwwClientdataset ;
begin
  try
   result := False;
   cdsClone :=  TwwClientDataSet.Create(nil);
   cdsClone.CloneCursor(cds , false );
   Result := cdsClone.Locate(Campo, Clave,[]) ;
  finally
   cdsClone.free;
  end;
end;


Function DiasMes(wMes,wAno:word):Byte;
begin
  Case wMes of
    1,3,5,7,8,10,12 : Result := 31;
    4,6,9,11 :         Result := 30;
    2 :               Result := 28 + Byte(IsLeapYear(wAno));
    else               result := 0;
  end;
end;


function StrNum(wNumero:Double):string;
var
   xNumStr,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12 : string;
   xGrupo, xTotal, xDecimal : string;
   xLargo, xVeces : integer;
   xxDec : double;
begin
// w1 para Unidades
   wNumero := FRound2(wNumero,15,2);
   xNumStr := floattostr(int(wNumero));
   xxDec := wNumero-int(wNumero);
   xxDec := xxDec*100;
   xxDec := FRound2(xxDec,15,2);
   xxDec := int(xxDec);
   xDecimal:= floattostr(xxDec);
   if strtofloat(xDecimal)=0 then
   begin
      xDecimal:='00';
   end;

// Inicio HPC_201401_CAJA
   xDecimal:= DMTE.strzero(xDecimal, 2);
// Fin HPC_201401_CAJA

   xDecimal:= ' y '+xDecimal+'/100';
   xLargo := length(xNumStr);
   x1:='';x2:='';x3:='';x4:='';x5:='';x6:='';x7:='';x8:='';x9:='';x10:='';
   if xLargo>=1 then x1:=copy(xNumStr,xLargo,1);
   if xLargo>=2 then x2:=copy(xNumStr,xLargo-1,1);
   if xLargo>=3 then x3:=copy(xNumStr,xLargo-2,1);
   if xLargo>=4 then x4:=copy(xNumStr,xLargo-3,1);
   if xLargo>=5 then x5:=copy(xNumStr,xLargo-4,1);
   if xLargo>=6 then x6:=copy(xNumStr,xLargo-5,1);
   if xLargo>=7 then x7:=copy(xNumStr,xLargo-6,1);
   if xLargo>=8 then x8:=copy(xNumStr,xLargo-7,1);
   if xLargo>=9 then x9:=copy(xNumStr,xLargo-8,1);
   if xLargo>=10 then x10:=copy(xNumStr,xLargo-9,1);
   if xLargo>=11 then x11:=copy(xNumStr,xLargo-10,1);
   if xLargo>=12 then x12:=copy(xNumStr,xLargo-11,1);

   xVeces:=1; xTotal:='';
   while xVeces<=4 do // hasta 999,999'999,999
   begin
      if xVeces=2 then
      begin
         x1:=x4;
         x2:=x5;
         x3:=x6;
      end;
      if xVeces=3 then
      begin
         x1:=x7;
         x2:=x8;
         x3:=x9;
      end;
      if xVeces=4 then
      begin
         x1:=x10;
         x2:=x11;
         x3:=x12;
      end;

      if x2='1' then // del 11 a 19
      begin
         if x1='0' then x2:='DIEZ';
         if x1='1' then x2:='ONCE';
         if x1='2' then x2:='DOCE';
         if x1='3' then x2:='TRECE';
         if x1='4' then x2:='CATORCE';
         if x1='5' then x2:='QUINCE';
         if x1='6' then x2:='DIECISEIS';
         if x1='7' then x2:='DIECISIETE';
         if x1='8' then x2:='DIECIOCHO';
         if x1='9' then x2:='DIECINUEVE';
         x1:='0';
      end
      else begin // del 0 al 9
         if x1='1' then x1:='UNO';
         if (xVeces>1) and (x1='UNO') then x1:='UN';
         if x1='2' then x1:='DOS';
         if x1='3' then x1:='TRES';
         if x1='4' then x1:='CUATRO';
         if x1='5' then x1:='CINCO';
         if x1='6' then x1:='SEIS';
         if x1='7' then x1:='SIETE';
         if x1='8' then x1:='OCHO';
         if x1='9' then x1:='NUEVE';
         if x2='2' then begin // veinte
            x2:='VEINTI';
            if x1='0' then x2:='VEINTE';
         end;
         if x2='3' then begin
            x2:='TREINTI';
            if x1='0' then x2:='TREINTA';
         end;
         if x2='4' then begin
            x2:='CUARENTI';
            if x1='0' then x2:='CUARENTA';
         end;
         if x2='5' then begin
            x2:='CINCUENTI';
            if x1='0' then x2:='CINCUENTA';
         end;
         if x2='6' then begin
            x2:='SESENTI';
            if x1='0' then x2:='SESENTA';
         end;
         if x2='7' then begin
            x2:='SETENTI';
            if x1='0' then x2:='SETENTA';
         end;
         if x2='8' then begin
            x2:='OCHENTI';
            if x1='0' then x2:='OCHENTA';
         end;
         if x2='9' then begin
            x2:='NOVENTI';
            if x1='0' then x2:='NOVENTA';
         end;
      end;
      if x3='1' then x3:='CIENTO';
      if (x2='0') and (x1='0') and (x3='CIENTO') then x3:='CIEN';
      if x3='2' then x3:='DOSCIENTOS';
      if x3='3' then x3:='TRESCIENTOS';
      if x3='4' then x3:='CUATROCIENTOS';
      if x3='5' then x3:='QUINIENTOS';
      if x3='6' then x3:='SEISCIENTOS';
      if x3='7' then x3:='SETECIENTOS';
      if x3='8' then x3:='OCHOCIENTOS';
      if x3='9' then x3:='NOVECIENTOS';

      xGrupo := '';
//      xGrupo := x3;
      if x3<>'0' then xGrupo:=x3;
      if x2<>'0' then xGrupo:=xGrupo+' '+x2;
      if x1<>'0' then xGrupo:=xGrupo+x1;
      if ((xVeces=2)or(xVeces=4)) and (length(xGrupo)>1) then
      begin
         xGrupo:=xGrupo+' MIL';
      end;
      if (xVeces=3) and (length(xGrupo)>1) then
      begin
         if x1<>'UN' then
            xGrupo:=xGrupo+' MILLONES'
         else begin
            xGrupo:=xGrupo+' MILLÓN';
         end;
      end;
      if length(xTotal)>0 then xGrupo:=xGrupo+' ';
      xTotal := xGrupo+xTotal;
      xVeces := xVeces+1;
   end;
   result := xTotal+xDecimal;
end;

function FRound2(xReal:currency;xEnteros,xDecimal:Integer):double;
Var
   xParteDec   : String;
   xDec: Integer;
   xMultiplo10, xUltdec, xNReal : Double;
begin
   result := 0;
   if xReal=0 then exit;
// primer redondeo a un decimal + de lo indicado en los parámetros
   xDec := xDecimal+1;
   if xDec=0 then xMultiplo10:=1;
   if xDec=1 then xMultiplo10:=10;
   if xDec=2 then xMultiplo10:=100;
   if xDec=3 then xMultiplo10:=1000;
   if xDec=4 then xMultiplo10:=10000;
   if xDec=5 then xMultiplo10:=100000;
   if xDec=6 then xMultiplo10:=1000000;
   if xDec=7 then xMultiplo10:=10000000;
   xParteDec := floattostr(int(xReal*xMultiplo10 - (int(xReal)*xMultiplo10)));
   if length(xParteDec)>=xDec then
      xultdec:=  strtofloat(copy(xParteDec,xDec,1))
   else begin
      xUltDec := 0;
   end;
   xNReal := int(xReal*xMultiplo10/10);
   if xultdec>=5 then xNReal := xNReal+1;
   Result := xNReal/(xMultiplo10/10);
end;


Procedure ValidaEdit(ctrl : TCustomEdit ; Mensaje : String ) ;
begin
   if trim(ctrl.Text) = '' then
   begin
      if ctrl.Enabled then
         ctrl.SetFocus ;

      Raise Exception.create (Mensaje) ;
   end ;
end ;

function strDia;
var
   Year, Month, Day: Word ;
begin

     if Fecha = 0 then
         Result := ''
     else
     begin
         DecodeDate(Fecha, Year, Month, Day);
         Result := DMTE.strzero(inttostr(Day),2) ;
     end ;
end;

function strMes;
var
   Year, Month, Day: Word ;
begin

     if Fecha = 0 then
         Result := ''
     else
     begin
         DecodeDate(Fecha, Year, Month, Day);
         Result := DMTE.strzero(inttostr(Month),2) ;
     end ;
end;

function strAno;
var
   Year, Month, Day: Word ;
begin

     if Fecha = 0 then
         Result := ''
     else
     begin
         DecodeDate(Fecha, Year, Month, Day);
         Result := DMTE.strzero(inttostr(Year),4) ;
     end ;
end;

Function EsFecha(S:String):Boolean;
var
   tmpFecha : TDateTime ;
begin
  try
     tmpFecha := strtodatetime(s) ;
     Result := True ;
  except
     Result := False ;
  end ;
end ;
procedure Pon(A1: array of Integer;
  A2: array of TNotifyEvent; Pnl: TPanel);
var
  I : Integer ;
  Btn : TBitBtn ;
begin
  for i := low(A1) to HIGH(A1) do
  begin
//      showmessage(A1[i]) ;
//      Btn := TBitBtn(pnl.FindComponent(A1[i])) ;
      Btn := TBitBtn(pnl.controls[A1[i]]) ;
      Btn.OnClick := A2[i] ;
  end;
end;
procedure Quita;
var
   i,Contador : INteger ;
begin

   Contador := 0 ;
   for i := 0  to pnl.ControlCount-1  do
   begin
       if pnl.Controls[i] is tbitbtn then
       begin
          A1[contador] := i ;
          A2[contador] :=(pnl.Controls[i] as  TBitBtn).OnClick ;
          (pnl.Controls[i] as  TBitBtn).OnClick := nil ;
          Contador := Contador +1 ;
       end ;
   end;

end;

function BotonesEnPanel(pnl : TPanel) : INteger ;
var
   i : Integer ;
   Contador : Integer ;
begin
   Result := 0 ;
   Contador := 0;
   for i := 0  to pnl.ControlCount-1  do
   begin
       if pnl.Controls[i] is tbitbtn then
          Result := Contador +1 ;
   end;
end ;

procedure ActivaBotones(pnl: TPanel;xFlag : Boolean);
var
 i : Integer ;
begin
   for i := 0 to pnl.ControlCount-1 do
   begin
     if pnl.controls[i] is tbitbtn then
        TBitBtn(pnl.controls[i]).enabled := xFlag ;
   end;
end;

function FechaDB2(Fecha : TDateTime) : String ;
begin
    Result := formatdatetime( DMTE.wFormatFecha , Fecha ) ;
end ;

procedure HabilitaControles ;
var
  I : Integer ;
begin
  for i := low(A) to HIGH(A) do
  begin
     A[i].Enabled := True ;
  end;
end;

procedure DesHabilitaControles ;
var
  I : Integer ;
begin
  for i := low(A) to HIGH(A) do
  begin
     A[i].Enabled := False ;
  end;
end ;

procedure BlanqueaEdits (xPnl : TPanel) ;
var
 i : Integer ;
begin
   for i := 0 to xpnl.ControlCount-1 do
   begin
     if xpnl.controls[i] is TCustomEdit then
        TCustomEdit(xpnl.controls[i]).Text := '' ;
   end;
end;

function CajaDec(xNumero : string ;Digitos : Integer = 2) : string ;
var
   xFloat : Double ;
   xNumTmp : String ;
begin
   if trim(xNumero) <> '' then
      xFloat  := strtofloat ( xNumero )
   else
      xFloat  := 0 ;
   xNumTmp := floattostrf(xFloat,fffixed,10,Digitos) ;
   xFloat  := strtofloat(xNumTmp) ;
   if xFloat = 0 then
   begin
      Result := BLANCO ;
   end
   else
   begin
      Result := xNumTmp ;
   end ;
end ;

function CmpDec ( xNum1 , xNum2 : string ) : Integer ;
var
   xCurr1,xCurr2 : Currency ;
begin
   xCurr1 := strtocurr( xNum1 ) ;
   xCurr2 := strToCurr( xNum2 ) ;

   if xCurr1 < xCurr2 then
      Result := -1
   else
      if xCurr1 = xCurr2 then
         Result := 0
      else
         Result := 1
end ;
function DifDec( xNum1 , xNum2 : string ) : String;
var
   xCurr1,xCurr2 ,xCurr: Currency ;
begin
   xCurr1 := strtocurr( xNum1 ) ;
   xCurr2 := strToCurr( xNum2 ) ;
   xCurr := ( xCurr1 - xCurr2 ) ;
   Result := CajaDec(currtostr(xCurr)) ;
end ;

function Redondea ( xReal : double ; Digitos : Integer = 2 ) : Currency ;
begin
   result := strtocurr(floattostrf(xReal,fffixed,10,digitos)) ;
end ;
///
procedure BlanqueaEditsEnForm ;
var
   i : integer ;
begin
    if ( pnl = nil ) and (gbx = nil) then
    begin
      for i := 0 to frm.ControlCount - 1 do
      begin
         if (frm.Controls[i] is TCustomedit) then
            TCustomedit(frm.Controls[i]).Text := ''
         else if (frm.Controls[i] is TPanel) then
                 BlanqueaEditsEnForm(nil,TPanel(frm.Controls[i]))
              else if frm.Controls[i] is TGroupBox then
                      BlanqueaEditsEnForm(nil,nil ,TGroupBox(frm.Controls[i]))
      end;
    end
    else
       if pnl <> nil then
       begin
         for i := 0 to pnl.ControlCount - 1 do
         begin
            if pnl.Controls[i] is TCustomedit then
               TCustomedit(pnl.Controls[i]).Text := ''
            else if pnl.Controls[i] is TPanel then
                    BlanqueaEditsEnForm(nil,TPanel(pnl.Controls[i]),nil)
                 else if pnl.Controls[i] is TGroupBox then
                         BlanqueaEditsEnForm(nil,nil ,TGroupBox(pnl.Controls[i]))
         end;
       end
       else
       begin
         for i := 0 to gbx.ControlCount - 1 do
         begin
            if gbx.Controls[i] is TCustomedit then
               TCustomedit(gbx.Controls[i]).Text := ''
            else if gbx.Controls[i] is TPanel then
                    BlanqueaEditsEnForm(nil,TPanel(gbx.Controls[i]),nil)
                 else if gbx.Controls[i] is TGroupBox then
                         BlanqueaEditsEnForm(nil,nil ,TGroupBox(gbx.Controls[i]))
         end;
       end ;
end;

function OperClientDataSet( ClientDataSet : TwwClientDataSet;
                            Expression, Condicion : String  ) : Double;
var
  cdsClone    : TwwClientDataSet;
  bmk         : TBookmark;
  Agg         : TAggregate;
begin
  result := 0;
  if trim(Expression)= '' then Exit;
  bmk:=ClientDataSet.GetBookmark;
  cdsClone    := TwwClientDataSet.Create(nil);
  try
    with cdsClone do
    begin
      CloneCursor(ClientDataSet,True);
      Agg := Aggregates.Add;
      Agg.AggregateName := 'OPER';
      Agg.Expression := Expression;
      Agg.Active := True;
      if Trim(Condicion)<>'' then
      begin
        Filtered     := False;
        Filter       := Condicion;
        Filtered     := True;
      end;
      if Aggregates.Items[Aggregates.IndexOf('OPER')].Value<>NULL then
         result := Aggregates.Items[Aggregates.IndexOf('OPER')].Value;
      Aggregates.Clear;
    end;
    ClientDataSet.GotoBookmark(bmk);
    ClientDataSet.FreeBookmark(bmk);
  finally
    cdsClone.Free;
  end;
end;
function  AplicaKeyPress(Frm : TForm ; A2digitos , A4digitos : Array of TWinControl) : Boolean ;
var
   I, J : Integer ;
begin
    Result := False ;
    if length(A2digitos) <> 0 then
    begin
       J := 0 ;
       for i := 0 to high(A2digitos) do
       begin
          if frm.ActiveControl = A2digitos[i] then
             break ;
          J:= j+1
       end;
       if (j <= High(A2digitos)) then
       begin
          Result := True ;
          Exit ;
       end ;
    end ;

    if length(A4digitos) <> 0 then
    begin
       J := 0 ;
       for i := 0 to high(A4digitos) do
       begin
          if frm.ActiveControl = A4digitos[i] then
             break ;
          J:= j+1
       end;
       if (j <= High(A4digitos)) then
       begin
          Result := True ;
          Exit ;
       end ;
    end ;

end ;
function SetPCSystemTime(tDati: TDateTime): Boolean;
var
   tSetDati: TDateTime;
   vDatiBias: Variant;
   tTZI: TTimeZoneInformation;
   tST: TSystemTime;
begin
   GetTimeZoneInformation(tTZI);
   vDatiBias := tTZI.Bias / 1440;
   tSetDati := tDati + vDatiBias;
   with tST do
   begin
        wYear := StrToInt(FormatDateTime('yyyy', tSetDati));
        wMonth := StrToInt(FormatDateTime('mm', tSetDati));
        wDay := StrToInt(FormatDateTime('dd', tSetDati));
        wHour := StrToInt(FormatDateTime('hh', tSetDati));
        wMinute := StrToInt(FormatDateTime('nn', tSetDati));
        wSecond := StrToInt(FormatDateTime('ss', tSetDati));
        wMilliseconds := 0;
   end;
   SetPCSystemTime := SetSystemTime(tST);
end;

function UltimoDiaMes(mes : String) : word;
var
  xFechaStr : String ;
  xFecha : TDateTime ;
begin
  if strtoint(Mes) > 12 then
     Raise exception.create ('El Mes no puede ser Mayor que 12') ;
  if strtoint(mes) < 12 then
  begin
     xFechastr := '01/' + DMTE.StrZero( inttostr(strtoint(Mes)+1 ),2 ) + '/2000' ;
     xFecha := strtodatetime(xFechaStr) ;
     xFecha := xfecha-1 ;
     Result := strtoint(strDia(xFecha)) ;
  end
  else
  begin
     Result := 31 ;
  end ;
end ;

function  GeneraCorrelativo(cds : TwwclientDataset ; Campo : String):String ;
var
  cdsClone    : TwwClientDataSet;
  bmk         : TBookmark;
  Agg         : TAggregate;
begin
  result := '1' ;
  if cds.RecordCount = 0 then
  begin
     Exit ;
  end ;
  bmk       :=   cds.GetBookmark;
  cdsClone  :=   TwwClientDataSet.Create(nil);
  try
    with cdsClone do
    begin
      CloneCursor( cds , False ) ;
      Agg := Aggregates.Add ;
      Agg.AggregateName := 'OPER' ;
      Agg.Expression := 'MAX(' + UpperCase( Campo ) + ')' ;
      Agg.Active := True ;
      if Aggregates.Items[Aggregates.IndexOf('OPER')].Value<>NULL then
         result := currtostr(Aggregates.Items[Aggregates.IndexOf('OPER')].value + 1) ;
      Aggregates.Clear ;
    end ;
    cds.GotoBookmark(bmk) ;
    cds.FreeBookmark(bmk) ;
  finally
    cdsClone.Free;
  end;
end;

end.

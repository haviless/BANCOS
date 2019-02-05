unit Caja241;

// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : Caja241
// FORMULARIO               : FRecalculo
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Apertura y Cierre de Caja

// ACTUALIZACIONES:
//HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdbdatetimepicker, ExtCtrls, Buttons, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, wwdblook,db, Grids, Wwdbigrd, Wwdbgrid,
  ppEndUsr, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  ppBands, ppCache, ppVar, ppCtrls, ppPrnabl, ppParameter;

type
  TFRecalculo = class(TForm)
    z2bbtnOK: TBitBtn;
    z2bbtnCancel: TBitBtn;
    lblActual: TLabel;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    dblcCaja: TwwDBLookupCombo;
    edtCaja: TEdit;
    GroupBox2: TGroupBox;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    GroupBox3: TGroupBox;
    edtFecha: TwwDBDateTimePicker;
    pnlCierre: TPanel;
    bbtnGrabaCierre: TBitBtn;
    lblTitulo: TLabel;
    bbtnOk: TBitBtn;
    Panel1: TPanel;
    Label2: TLabel;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    Label5: TLabel;
    bbtnGrabaApert: TBitBtn;
    bbtnBalance: TBitBtn;
    ppr1: TppReport;
    ppdb1: TppDBPipeline;
    ppd1: TppDesigner;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText7: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel17: TppLabel;
    ppLabel3: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText5: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel13: TppLabel;
    ppFirma01: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLine3: TppLine;
    procedure FormActivate(Sender: TObject);
    procedure dblcCajaExit(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure z2bbtnCancelClick(Sender: TObject);
    procedure dblcCajaChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure NotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcCiaChange(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure z2bbtnOKMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbtnCierreClick(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure bbtnGrabaCierreClick(Sender: TObject);
    procedure edtFechaChange(Sender: TObject);
    procedure bbtnGrabaApertClick(Sender: TObject);
    procedure bbtnBalanceClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRecalculo: TFRecalculo;

implementation

uses cajadm;
{$R *.DFM}

//Inicio HPC_201401_CAJA
// 25/02/2014 : Se crea el Cierre de caja
procedure TFRecalculo.FormActivate(Sender: TObject);
var
   sSQL : String;
begin
   lblActual.Visible := False;
   sSQL := 'Select * from TGE105 where BCOTIPCTA =' + QuotedStr('C');
   DMTE.cds1.Close;
   DMTE.cds1.ProviderName := 'prvQry2';
   DMTE.cds1.DataRequest(sSQL);
   DMTE.cds1.Open;

   dblcCia.Text:='02';
   edtCia.text := DMTE.DisplayDescripLocal(DMTE.cdsCia, 'CIAID', dblcCia.Text, 'CIADES');

   sSQL:='Select BANCOID, BANCONOM, CUENTAID from TGE105 where FLACAJCHI=''S''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(sSQL);
   DMTE.cdsQry.Open;

   dblcCaja.Text:=DMTE.cdsQry.FieldByname('BANCOID').AsString;
   edtCaja.Text := DMTE.DisplayDescripLocal(DMTE.cds1, 'BANCOID', dblcCaja.Text, 'BANCONOM');
   edtFecha.SetFocus;
end;
//Fin HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja

procedure TFRecalculo.dblcCajaExit(Sender: TObject);
var
  xSQL : String;
begin
  edtCaja.Text := DMTE.cds1.FieldByName('BANCONOM').AsString;

  xSQL:='Select * '
       +'  from CAJA310 '
       +' where CIAID='''    +dblcCia.Text +''' '
       +'   and BANCOID='''  +dblcCaja.Text+''' '
       +'   and FLGCIERRE=''N'' '
       +' order BY STFECHA DESC'
end;

procedure TFRecalculo.z2bbtnOKClick(Sender: TObject);
var
   xSQL, Periodo, Periodoa, xWhere, xTipocta : String;
   sFecha, xNumliq : String;
   xSaldoIni : Double; // para los saldos

 { sFecha,xNumLiq,xsql : string;
 xAno,xDia,xMes : word; // para descomponer Fecha del 1er registro del  DMTE.cdsQry2
 xAnoD,xDiaD,xMesD : word; // para descomponer xFecha
 xAnoR,xDiaR,xMesR : word; // para descomponer Fecha por registro del  DMTE.cdsQry2
 xSaldoIni : Double; // para los saldos
 xBool : Boolean; // True = si actualizo al menos un registro de CAJA310
 xMesB,xAnoB : String; //** se usa en el while de CDSREC
 xMontoMes : Double;
 xPeriodo : String;
}

begin

   if dblcCia.Text='' then
   begin
      ShowMessage('Debe Ingresar Compañía');
      dblcCia.SetFocus;
      Exit;
   end;

   if dblcCaja.Text='' then
   begin
      ShowMessage('Debe Ingresar Banco');
      dblcCaja.SetFocus;
      Exit;
   end;

   xSQL := 'Select MAX(STFECHA) STFECHA From CAJA310'
          +' Where CIAID ='+QuotedStr(dblcCia.Text)
          +' And BANCOID ='+QuotedStr(dblcCaja.Text);

   DMTE.cdsQry2.Filter   := '';
   DMTE.cdsQry2.Filtered := False;
   DMTE.cdsQry2.IndexFieldNames := '';
   DMTE.cdsQry2.Close;
   DMTE.cdsQry2.DataRequest(xSQL);
   DMTE.cdsQry2.Open;

//******************************************************************************
   xWhere := 'STFECHA ='+QuotedStr(DateToStr(edtFecha.Date))
            +' And CIAID ='+QuotedStr(dblcCia.Text)
            +' And BANCOID ='+QuotedStr(dblcCaja.Text)
            +' And FLGCIERRE ='+QuotedStr('N');

//Verifica si el Día está Cerrado
//Inicio HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja
   If Length(DMTE.DisplayDescrip('prvSQL', 'CAJA310', 'STFECHA, FLGCIERRE, stsaldoinic, sttoting, sttotegr, stsaldofin', xWhere, 'FLGCIERRE')) > 0 Then
    begin

      xSQL:='Select stsaldoinic, sttoting, sttotegr, stsaldofin from CAJA310 where '+xWhere;
      DMTE.cdsOPago.Close;
      DMTE.cdsOPago.DataRequest( xSQL );
      DMTE.cdsOPago.Open;

     Beep;
     MessageDlg('El día '+edtFecha.Text+' ya fué Aperturado', mtInformation, [mbOk], 0);
     lblActual.Visible := False;
     edtFecha.SetFocus;
     Exit;
    end
// Fin HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja
   Else
    begin //El Día ya fué Cerrado
     xWhere := 'STFECHA ='+QuotedStr(DateToStr(edtFecha.Date))
              +' And CIAID ='+QuotedStr(dblcCia.Text)
              +' And BANCOID ='+QuotedStr(dblcCaja.Text)
              +' And FLGCIERRE ='+QuotedStr('S');
     If Length(DMTE.DisplayDescrip('prvSQL', 'CAJA310', 'STFECHA, FLGCIERRE', xWhere, 'FLGCIERRE')) > 0 Then
      begin
       Beep;
       MessageDlg('El día '+edtFecha.Text+' ya fué Cerrado', mtInformation, [mbOk], 0);
       lblActual.Visible := False;
       edtFecha.SetFocus;
       Exit;
      end
     Else
      begin
       If Length(DMTE.cdsQry2.FieldByName('STFECHA').AsString) = 0 Then
        begin
         xSQL := 'INSERT INTO CAJA310(CIAID, BANCOID, CCBCOID, STFECHA, STSALDOINIC, STSALDOFIN, NUMLIQ, FLGCIERRE, STTOTING, STTOTEGR,'
                +' STSDOINIEXT, STSDOFINEXT, STINGEXT, STEGREXT)'
                +' VALUES ('+QuotedStr(dblcCia.Text)+', '+QuotedStr(dblcCaja.Text)+', '' '''
                +', '+QuotedStr(DateToStr(edtFecha.Date))+', 0, 0, '' '', ''N'', 0, 0, 0, 0, 0, 0)';
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
        end
       Else
        begin
         If edtFecha.Date > StrToDate(DMTE.cdsQry2.FieldByName('STFECHA').AsString) Then
          begin
           xWhere := 'STFECHA ='+QuotedStr(DMTE.cdsQry2.FieldByName('STFECHA').AsString)
                    +' And CIAID ='+QuotedStr(dblcCia.Text)
                    +' And BANCOID ='+QuotedStr(dblcCaja.Text);
           DMTE.DisplayDescrip('prvSQL', 'CAJA310', 'STSALDOINIC, STSALDOFIN, STSDOINIEXT, STSDOFINEXT', xWhere, 'STSALDOINIC');
           xSQL := 'INSERT INTO CAJA310(CIAID, BANCOID, CCBCOID, STFECHA, STSALDOINIC, STSALDOFIN, NUMLIQ, FLGCIERRE, STTOTING, STTOTEGR,'
                  +' STSDOINIEXT, STSDOFINEXT, STINGEXT, STEGREXT)'
                  +' VALUES ('+QuotedStr(dblcCia.Text)+', '+QuotedStr(dblcCaja.Text)+', '' '''
                  +', '+QuotedStr(DateToStr(edtFecha.Date))+','+FloatToStr(DMTE.cdsQry.FieldByName('STSALDOFIN').AsFloat)
                  +', '+FloatToStr(DMTE.cdsQry.FieldByName('STSALDOFIN').AsFloat)+', '' '', ''N'''
                  +', 0, 0, '+FloatToStr(DMTE.cdsQry.FieldByName('STSDOFINEXT').AsFloat)+', '+FloatToStr(DMTE.cdsQry.FieldByName('STSDOFINEXT').AsFloat)
                  +', 0, 0)';
           DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

           xSQL := 'Update CAJA310'
                  +' Set FLGCIERRE ='+QuotedStr('S')
                  +' Where STFECHA ='+QuotedStr(DMTE.cdsQry2.FieldByName('STFECHA').AsString)
                  +' And CIAID ='+QuotedStr(dblcCia.Text)
                  +' And BANCOID ='+QuotedStr(dblcCaja.Text);
           DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
          end
         Else
          begin
           Beep;
           MessageDlg('El día '+edtFecha.Text+' es Anterior a la última Fecha de Apertura : '+DMTE.cdsQry2.FieldByName('STFECHA').AsString, mtInformation, [mbOk], 0);
           edtFecha.SetFocus;
           Exit;
          end;
        end;
      end;
    end;
//******************************************************************************
   Beep;
   MessageDlg('Dia '+edtFecha.Text+' Aperturado', mtCustom, [mbOk], 0);
   lblActual.Visible := True;
end;

procedure TFRecalculo.z2bbtnCancelClick(Sender: TObject);
var
   sSQL : String;
begin
   sSQL := '';
   sSQL := 'SELECT * FROM TGE105';
   DMTE.cds1.Close;
   DMTE.cds1.ProviderName := 'prvQry2';
   DMTE.cds1.DataRequest(sSQL);
   Close;
end;

procedure TFRecalculo.dblcCajaChange(Sender: TObject);
begin
   lblActual.Visible := False;
// Inicio HPC_201401_CAJA
   pnlCierre.Visible:=False;
// Fin HPC_201401_CAJA
end;

/// NO BORRAR - ACTUALIZA CAJA310, por un AÑO DETERMINADO,  /////
//** 15/05/2001 - pjsv, NO BORRAR, es para recalcular los saldos de CAJA310
//** se esta probando con CAJA310P
procedure TFRecalculo.BitBtn1Click(Sender: TObject);
begin
   RecalculoSaldos(dblcCia.Text, edtFecha.Date, '');
end;
{var
 sFecha,xSql,xDia : String;
 xFecha : TDate;
 xY,xD,xM,xY1,xD1,xM1: word;
 xSaldoFin : Double;
 xZ : integer;
begin
  xSql := 'Update CAJA310P SET '+
          ' STSALDOINIC=0.00 ';
  DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

  xSql := 'select TRIM(TGE105.BANCOID) BANCOID,TRIM('+DMTE.wReplacCeros+'(TGE106.CCBCOID,''-'')) CCBCOID from TGE105 '   +
          'LEFT JOIN tge106 ON (TGE106.BANCOID=TGE105.BANCOID) ' +
          'ORDER BY BANCOID,CCBCOID';
  DMTE.cdsQry.Close;
  DMTE.cdsQry.DataRequest(xSql);
  DMTE.cdsQry.Open;
  DMTE.cdsQry.IndexFieldNames := 'BANCOID;CCBCOID';
  xsql := 'SELECT STFECHA,trim(BANCOID) BANCOID ,trim('+DMTE.wReplacCeros+'(CCBCOID,''-'')) CCBCOID,'+DMTE.wReplacCeros+'(STSALDOINIC,0) STSALDOINIC,'+DMTE.wReplacCeros+'(STTOTING,0) STTOTING,'+DMTE.wReplacCeros+'(STTOTEGR,0) STTOTEGR,'+DMTE.wReplacCeros+'(STSALDOFIN,0) STSALDOFIN'
           +' FROM CAJA310P ORDER BY stfecha,bancoid,ccbcoid';
  DMTE.cdsQry2.Close;
  DMTE.cdsQry2.DataRequest(xsql);
  DMTE.cdsQry2.Open;
  DMTE.cdsQry2.IndexFieldNames := 'STFECHA;BANCOID;CCBCOID';
  DMTE.cdsBanco.First;
  DMTE.cdsQry2.First;
  xDia := '01'+'/01'+'/2000';
  xFecha := StrToDate(xDia);
  DecodeDate(xFecha,xY,xM,xD);
  DecodeDate(xFecha,xY1,xM1,xD1);
  while not DMTE.cdsQry.Eof do
   begin
    repeat
     For xZ := 1 to 10 do
      begin
       DMTE.cdsQry2.SetKey;
       DMTE.cdsQry2.fieldbyname('STFECHA').AsString := DateToStr(xFecha-xZ);
       DMTE.cdsQry2.fieldbyname('BANCOID').AsString := DMTE.cdsQry.fieldbyname('BANCOID').AsString;
       DMTE.cdsQry2.fieldbyname('CCBCOID').AsString := DMTE.cdsQry.fieldbyname('CCBCOID').AsString;
       if DMTE.cdsQry2.GotoKey then
        begin
         xSaldoFin := DMTE.cdsQry2.fieldbyname('STSALDOFIN').AsFloat;
         break;
        end
       else xSaldoFin := 0.00;
      end;

     DMTE.cdsQry2.SetKey;
     DMTE.cdsQry2.fieldbyname('STFECHA').AsString := DateToStr(xFecha);
     DMTE.cdsQry2.fieldbyname('BANCOID').AsString := DMTE.cdsQry.fieldbyname('BANCOID').AsString;
     DMTE.cdsQry2.fieldbyname('CCBCOID').AsString := DMTE.cdsQry.fieldbyname('CCBCOID').AsString;
     if DMTE.cdsQry2.GotoKey then
      begin
       DMTE.cdsQry2.Edit;
       DMTE.cdsQry2.fieldbyname('STSALDOINIC').Value := xSaldoFin;
       DMTE.cdsQry2.fieldbyname('STSALDOFIN').Value :=
          DMTE.cdsQry2.fieldbyname('STSALDOINIC').Value +
          DMTE.cdsQry2.fieldbyname('STTOTING').Value -
          DMTE.cdsQry2.fieldbyname('STTOTEGR').Value;
       DMTE.cdsQry2.Post;
      end;
     xFecha := xFecha + 1;
     DecodeDate(xFecha,xY1,xM1,xD1);
    until xY1 > xY;
    xFecha := StrToDate(xDia);
    DMTE.cdsQry.Next;
   end;

  DMTE.cdsQry2.First;
  while not DMTE.cdsQry2.Eof do
   begin
     sFecha := formatdatetime(DMTE.wFormatFecha,DMTE.cdsQry2.fieldbyname('STFECHA').Value );
     xSql := 'Update CAJA310P SET '+
             ' STSALDOINIC='+FloatToStrF(DMTE.cdsQry2.fieldbyname('STSALDOINIC').AsFloat,ffFixed,15,2)+
             ' ,STSALDOFIN='+FloatToStrF(DMTE.cdsQry2.fieldbyname('STSALDOFIN').AsFloat,ffFixed,15,2)+
             ' WHERE STFECHA='+quotedstr(sFecha)+
             ' AND BANCOID ='+quotedstr(DMTE.cdsQry2.fieldbyname('BANCOID').AsString);
     If DMTE.cdsQry2.fieldbyname('CCBCOID').AsString <> '-' then
      xSql := xSql + ' AND CCBCOID='+quotedstr(DMTE.cdsQry2.fieldbyname('CCBCOID').AsString)
     else
      xSql := xSql + ' AND CCBCOID is NULL';
     DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
    DMTE.cdsQry2.Next;
   end;
end;
}

procedure TFRecalculo.NotInList(Sender: TObject; LookupTable: TDataSet;
  NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFRecalculo.dblcCiaChange(Sender: TObject);
begin
   lblActual.Visible := False;
// Inicio HPC_201401_CAJA
   pnlCierre.Visible:=False;
// Fin HPC_201401_CAJA
end;

procedure TFRecalculo.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text := DMTE.cdsCia.FieldByName('CIADES').AsString;
end;

procedure TFRecalculo.FormShow(Sender: TObject);
begin
// Inicio HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja
   edtFecha.Date := DateS;
   lblTitulo.Color := clblue;
// Fin HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja
end;

procedure TFRecalculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DMTE.cds1.Filter   := '';
   DMTE.cds1.Filtered := False;
   DMTE.cds1.IndexFieldNames := '';
   DMTE.cds1.Close;
   DMTE.cdsQry2.Filter   := '';
   DMTE.cdsQry2.Filtered := False;
   DMTE.cdsQry2.IndexFieldNames := '';
   DMTE.cdsQry2.Close;
// Inicio HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja
   DMTE.cdsOPago.Close;
// Fin HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja
end;

procedure TFRecalculo.z2bbtnOKMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   z2bbtnOK.Hint := 'Aperturar día : '+edtFecha.Text;
end;

procedure TFRecalculo.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFRecalculo.bbtnCierreClick(Sender: TObject);
var
   xSQL : String;
begin

end;

// Inicio HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja
procedure TFRecalculo.bbtnOkClick(Sender: TObject);
var
   xWhere, xSQL : String;
begin
   if dblcCia.Text='' then
   begin
      ShowMessage('Debe Ingresar Compañía');
      dblcCia.SetFocus;
      Exit;
   end;

   if dblcCaja.Text='' then
   begin
      ShowMessage('Debe Ingresar la Caja');
      dblcCaja.SetFocus;
      Exit;
   end;

   xSQL := 'SELECT TO_CHAR(SYSDATE,''DD/MM/YYYY'') FECHA FROM DUAL';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;

   lblTitulo.Color := clblue;

   If edtFecha.Date > DateS then
   begin
      ShowMessage('No se puede aperturar una fecha mayor a '+datetostr(DateS));
      Exit;
   end;

   xWhere:='STFECHA ='+QuotedStr(DateToStr(edtFecha.Date))
          +' And CIAID ='+QuotedStr(dblcCia.Text)
          +' And BANCOID ='+QuotedStr(dblcCaja.Text)
          +' And FLGCIERRE ='+QuotedStr('S');
   If Length(DMTE.DisplayDescrip('prvSQL', 'CAJA310', 'STFECHA, FLGCIERRE', xWhere, 'FLGCIERRE')) > 0 Then
   begin
      xSQL:='Select STSALDOINIC, STTOTING, STTOTEGR, STSALDOFIN from CAJA310 where '+xWhere;
      DMTE.cdsOPago.Close;
      DMTE.cdsOPago.DataRequest( xSQL );
      DMTE.cdsOPago.Open;
      Beep;
      TNumericField( DMTE.cdsOPago.FieldByName( 'STSALDOINIC'  ) ).DisplayFormat:='#,##0.00';
      TNumericField( DMTE.cdsOPago.FieldByName( 'STTOTING'  ) ).DisplayFormat:='#,##0.00';
      TNumericField( DMTE.cdsOPago.FieldByName( 'STTOTEGR'  ) ).DisplayFormat:='#,##0.00';
      TNumericField( DMTE.cdsOPago.FieldByName( 'STSALDOFIN'  ) ).DisplayFormat:='#,##0.00';


      //MessageDlg('El día '+edtFecha.Text+' ya fué Cerrado', mtInformation, [mbOk], 0);
      lblTitulo.Caption := 'Caja Cerrada';
      lblTitulo.Color := clRed;
      lblActual.Visible := False;
      edtFecha.SetFocus;
      bbtnGrabaCierre.Visible:=False;
      bbtnGrabaApert.Visible :=False;
      bbtnBalance.Visible:=True;
      z2bbtnOK.Visible:=False;
      pnlCierre.Visible:=True;
      Exit;
   end;

   xWhere:='STFECHA ='+QuotedStr(DateToStr(edtFecha.Date))
          +' And CIAID ='+QuotedStr(dblcCia.Text)
          +' And BANCOID ='+QuotedStr(dblcCaja.Text)
          +' And FLGCIERRE ='+QuotedStr('N');
   If Length(DMTE.DisplayDescrip('prvSQL', 'CAJA310', 'STFECHA, FLGCIERRE', xWhere, 'FLGCIERRE')) > 0 Then
   begin
      xSQL:='Select stsaldoinic, sttoting, sttotegr, stsaldofin from CAJA310 where '+xWhere;
      DMTE.cdsOPago.Close;
      DMTE.cdsOPago.DataRequest( xSQL );
      DMTE.cdsOPago.Open;
      Beep;
      TNumericField( DMTE.cdsOPago.FieldByName( 'STSALDOINIC'  ) ).DisplayFormat:='#,##0.00';
      TNumericField( DMTE.cdsOPago.FieldByName( 'sttoting'  ) ).DisplayFormat:='#,##0.00';
      TNumericField( DMTE.cdsOPago.FieldByName( 'sttotegr'  ) ).DisplayFormat:='#,##0.00';
      TNumericField( DMTE.cdsOPago.FieldByName( 'stsaldofin'  ) ).DisplayFormat:='#,##0.00';

      //MessageDlg('El día '+edtFecha.Text+' ya fué Cerrado', mtInformation, [mbOk], 0);
      lblTitulo.Caption := 'Caja Aperturada';
      lblActual.Visible := False;
      edtFecha.SetFocus;
      z2bbtnOK.Visible:=False;
      pnlCierre.Visible:=True;
      bbtnGrabaCierre.Visible:=True;
      bbtnGrabaCierre.Enabled:=True;
      bbtnBalance.Visible    :=False;
      bbtnGrabaApert.Visible :=False;
      Exit;
   end;

   If edtFecha.Date < DateS then
   begin
      ShowMessage('No se puede aperturar una fecha menor a '+datetostr(DateS));
      Exit;
   end;

   xSQL := 'Select MAX(STFECHA) STFECHA '
          +'  from CAJA310'
          +' where CIAID ='+QuotedStr(dblcCia.Text)
          +'   and BANCOID ='+QuotedStr(dblcCaja.Text);
   DMTE.cdsQry2.Filter   := '';
   DMTE.cdsQry2.Filtered := False;
   DMTE.cdsQry2.IndexFieldNames := '';
   DMTE.cdsQry2.Close;
   DMTE.cdsQry2.DataRequest(xSQL);
   DMTE.cdsQry2.Open;

   xWhere := 'STFECHA ='+QuotedStr(DMTE.cdsQry2.FieldByName('STFECHA').AsString)
            +' And CIAID ='+QuotedStr(dblcCia.Text) +' And BANCOID ='+QuotedStr(dblcCaja.Text);
   DMTE.DisplayDescrip('prvSQL', 'CAJA310', 'STSALDOINIC, STSALDOFIN, STSDOINIEXT, STSDOFINEXT, FLGCIERRE', xWhere, 'STSALDOINIC');

   if DMTE.cdsQry.FieldByName('FLGCIERRE').AsString='N' then
   begin
      ShowMessage( 'Falta Cerrar el día '+DMTE.cdsQry2.FieldByName('STFECHA').AsString );
      Exit;
   end;

   xSQL:='Select '+DMTE.cdsQry.FieldByName('STSALDOFIN').AsString+' STSALDOINIC, 0 STTOTING, 0 STTOTEGR, 0 STSALDOFIN from DUAL';
   DMTE.cdsOPago.Close;
   DMTE.cdsOPago.DataRequest( xSQL );
   DMTE.cdsOPago.Open;
   TNumericField( DMTE.cdsOPago.FieldByName( 'STSALDOINIC'  ) ).DisplayFormat:='#,##0.00';
   TNumericField( DMTE.cdsOPago.FieldByName( 'STTOTING'  ) ).DisplayFormat:='#,##0.00';
   TNumericField( DMTE.cdsOPago.FieldByName( 'STTOTEGR'  ) ).DisplayFormat:='#,##0.00';
   TNumericField( DMTE.cdsOPago.FieldByName( 'STSALDOFIN'  ) ).DisplayFormat:='#,##0.00';
   pnlCierre.Visible:=True;
   lblTitulo.Caption := 'Aperturar Caja';
   bbtnGrabaApert.Visible :=True;
   bbtnGrabaApert.Enabled :=True;
   bbtnGrabaCierre.Visible:=False;
   bbtnBalance.Visible    :=False;
end;
// Fin  HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja

// Inicio HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja
procedure TFRecalculo.bbtnGrabaCierreClick(Sender: TObject);
var
   xSQL : String;
begin
   If MessageDlg('¿Seguro de Cerrar Caja del día '+DateToStr(edtFecha.Date)+'?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
       xSQL := 'Update CAJA310'
              +' Set FLGCIERRE ='+QuotedStr('S')
              +' Where STFECHA ='+QuotedStr(DateToStr(edtFecha.Date))
              +' And CIAID ='+QuotedStr(dblcCia.Text)
              +' And BANCOID ='+QuotedStr(dblcCaja.Text);
       DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
       lblTitulo.Caption := 'Caja Cerrada';
       bbtnGrabaCierre.Visible:=False;
       ShowMessage('Caja Cerrada');
       bbtnBalance.Visible:=True;
   end;
end;
// Fin HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja

// Inicio HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja
procedure TFRecalculo.edtFechaChange(Sender: TObject);
begin
   pnlCierre.Visible:=False;
end;
// Fin HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja

// Inicio HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja
procedure TFRecalculo.bbtnGrabaApertClick(Sender: TObject);
var
   xSQL : String;
begin
   If MessageDlg('¿Seguro de Aperturar Caja del día '+DateToStr(edtFecha.Date)+'?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
       bbtnGrabaApert.Enabled:=False;
       xSQL := 'INSERT INTO CAJA310(CIAID, BANCOID, CCBCOID, STFECHA, STSALDOINIC, STSALDOFIN, NUMLIQ, FLGCIERRE, STTOTING, STTOTEGR,'
              +' STSDOINIEXT, STSDOFINEXT, STINGEXT, STEGREXT)'
              +' VALUES ('+QuotedStr(dblcCia.Text)+', '+QuotedStr(dblcCaja.Text)+', '' '''
              +', '+QuotedStr(DateToStr(edtFecha.Date))+','+FloatToStr(DMTE.cdsOPago.FieldByName('STSALDOINIC').AsFloat)
              +', '+FloatToStr(DMTE.cdsOPago.FieldByName('STSALDOINIC').AsFloat)+', '' '', ''N'''
              +', 0, 0, 0, 0 '
              +', 0, 0)';
       DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
       lblTitulo.Caption := 'Caja Aperturada';
       ShowMessage('Caja Aperturada');
   end;
end;
// Fin HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja

// Inicio HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja
procedure TFRecalculo.bbtnBalanceClick(Sender: TObject);
var
  xSQL : String;
  xNomUsu, xPeriodo, xFecha, xExpresado : String;
begin
  xSQL:='Select A.TMONID, B.TMONDES  '
       +'  from TGE106 A, TGE103 B '
       +' where A.CIAID='''+dblcCia.Text+''' and A.BANCOID='''+dblcCaja.Text+''' '
       +'   and A.TMONID=B.TMONID(+)';
  DMTE.cdsQry.Close;
  DMTE.cdsQry.DataRequest( xSQL );
  DMTE.cdsQry.Open;
  xExpresado:='Expresado en '+DMTE.cdsQry.FieldByName('TMONDES').AsString;

  xSQL:='Select USERNOM from TGE006 where USERID='''+DMTE.wUsuario+'''';
  DMTE.cdsQry.Close;
  DMTE.cdsQry.DataRequest( xSQL );
  DMTE.cdsQry.Open;

  xNomUsu:=DMTE.cdsQry.FieldByName('USERNOM').AsString;
  DMTE.cdsQry.Close;

  xFecha:=DateToStr(edtFecha.Date);
  xPeriodo:=Copy(xFecha,7,4)+Copy(xFecha,4,2);
  // Saldo Inicial

  xSQL:='select ''1'' ORDEN, ''Saldo Inicial'' Observa, '
       +       'stsaldoinic, 0 sttoting, 0 sttotegr, 0 stsaldofin, '
       +       'to_date('''+xFecha+''') ecfcomp,  '
       +       ''''+dblcCaja.Text+'  '+edtCaja.Text+''' CAJA, '''+xNomUsu+''' NOMUSU, '
       +       ''''+xExpresado+''' EXPRESADO '
       +  'from CAJA310 A '
       + 'WHERE ciaid='''+dblcCia.Text+''' and bancoid='''+dblcCaja.Text+''' '
       +   'and STFECHA='''+xFecha+''' '
  // Reposición de Caja -- Ingresos - Origen 06 y cptoid EG0001 y ec_proce='1'
       +' union all '
       +'select ''2'' ORDEN, ''Reposición de Caja'' observa, '
       +       '0 saldoini, sum(ecmtoori) ecmtoori, 0 egresos, 0 saldofin, '
       +       'ecfcomp, '
       +       ''''+dblcCaja.Text+'  '+edtCaja.Text+''' CAJA, '''+xNomUsu+''' NOMUSU, '
       +       ''''+xExpresado+''' EXPRESADO '
       +  'from caja302 a, caja301 b '
       + 'where a.ciaid='''+dblcCia.Text+''' and a.tdiarid=''06'' '
       +   'and a.ecanomm='''+xPeriodo+''' and a.ecfcomp='''+xFecha+''' '
       +   'and a.ecestado=''C'' and ec_proce=''1'' '
       +   'and a.ciaid=b.ciaid(+) and a.tdiarid=b.tdiarid(+) and a.ecanomm=b.ecanomm(+) '
       +   'and a.ecnocomp=b.ecnocomp(+) and b.cuentaid=''10202'' '
       + 'group by ecfcomp '
  // Vales de Caja - origen 07 y ec_proce='1'
       +' union all '
       +'select ''3'' ORDEN, ''Vale de Caja'' Observa, '
       +       '0 saldoini, 0 ingresos, sum(ecmtoori), 0 saldofin, '
       +       'ecfcomp, '
       +       ''''+dblcCaja.Text+'  '+edtCaja.Text+''' CAJA, '''+xNomUsu+''' NOMUSU, '
       +       ''''+xExpresado+''' EXPRESADO '
       +  'from caja302 a, caja301 b '
       + 'where a.ciaid='''+dblcCia.Text+''' and a.tdiarid=''07'' '
       +   'and a.ecanomm='''+xPeriodo+''' and a.ecfcomp='''+xFecha+''' '
       +   'and a.ecestado=''C'' and ec_proce=''1'' '
       +   'and a.ciaid=b.ciaid(+) and a.tdiarid=b.tdiarid(+) and a.ecanomm=b.ecanomm(+) '
       +   'and a.ecnocomp=b.ecnocomp(+) and b.cuentaid=''386'' '
       + 'group by ecfcomp '
  // Egresos Varios - origen 07 y ec_proce='1'
       +' union all '
       +'select ''3'' ORDEN, ''Egresos Varios'' Observa, '
       +       '0 saldoini, 0 ingresos, sum(ecmtoori), 0 saldofin, '
       +       'ecfcomp, '
       +       ''''+dblcCaja.Text+'  '+edtCaja.Text+''' CAJA, '''+xNomUsu+''' NOMUSU, '
       +       ''''+xExpresado+''' EXPRESADO '
       +  'from caja302 a, caja301 b '
       + 'where a.ciaid='''+dblcCia.Text+''' and a.tdiarid=''07'' '
       +   'and a.ecanomm='''+xPeriodo+''' and a.ecfcomp='''+xFecha+''' '
       +   'and a.ecestado=''C'' and ec_proce=''1'' '
       +   'and a.ciaid=b.ciaid(+) and a.tdiarid=b.tdiarid(+) and a.ecanomm=b.ecanomm(+) '
       +   'and a.ecnocomp=b.ecnocomp(+) and b.cuentaid<>''386'' '
       + 'group by ecfcomp '

  // Rendición  -
       +' union all '
       +'select ''4'' ORDEN, ''Ingresos por Rendición'' observa, '
       +       '0 saldoini, sum(b.demtoori) ecmtoori, 0 egresos, 0 saldofin, '
       +       'ecfcomp, '
       +       ''''+dblcCaja.Text+'  '+edtCaja.Text+''' CAJA, '''+xNomUsu+''' NOMUSU, '
       +       ''''+xExpresado+''' EXPRESADO '
       +  'from caja302 a, caja301 b '
       + 'where a.ciaid='''+dblcCia.Text+''' and a.tdiarid=''07'' '
       +   'and a.ecanomm='''+xPeriodo+''' and a.ecfcomp='''+xFecha+''' '
       +   'and ecestado=''C'' and ec_proce=''I'' '
       +   'and a.ciaid=b.ciaid(+) and a.tdiarid=b.tdiarid(+) and a.ecanomm=b.ecanomm(+) '
       +   'and a.ecnocomp=b.ecnocomp(+) and b.cuentaid=''10202'' '
       + 'group by ecfcomp '
  // Saldo Final
       +' union all '
       +'select ''5'' ORDEN, ''Saldo Final'' Observa, '
       +       'stsaldofin stsaldoinic, 0 sttoting, 0 sttotegr, stsaldofin, '
       +       'null ecfcomp, '
       +       ''''+dblcCaja.Text+'  '+edtCaja.Text+''' CAJA, '''+xNomUsu+''' NOMUSU, '
       +       ''''+xExpresado+''' EXPRESADO '
       +  'from CAJA310 A '
       + 'WHERE ciaid='''+dblcCia.Text+''' and bancoid='''+dblcCaja.Text+''' '
       +   'and STFECHA='''+xFecha+''' '
       +'order by ORDEN';


  DMTE.cdsReporte.Close;
  DMTE.cdsReporte.Datarequest(xSQL);
  DMTE.cdsReporte.Open;
  ppdb1.DataSource:=DMTE.dsReporte;

  ppr1.Template.FileName := wRutaRpt + '\LiquidacionCajaDiaria.rtm';
  ppr1.Template.LoadFromFile;

  ppr1.Print;
  //ppd1.ShowModal;
end;
// Fin  HPC_201401_CAJA 25/02/2014 : Se creá el Cierre de caja

end.

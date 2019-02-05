unit Caja227;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, wwdbdatetimepicker, ExtCtrls, Mask, wwdbedit, Wwdbspin,
  CajaUtil, CajaDM, wwdblook, db, Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid,
  fcButton, fcImgBtn, fcShapeBtn, ppPrnabl, ppClass, ppCtrls, ppBands, ppTypes,
  ppProd, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppVar, ppViewr;

type
  TFCierreMensual = class(TForm)
    z2bbtnOK: TBitBtn;
    z2bbtnCancel2: TBitBtn;
    dbseMes: TwwDBSpinEdit;
    dbseAno: TwwDBSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    StaticText1: TStaticText;
    Bevel2: TBevel;
    GroupBox2: TGroupBox;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    GroupBox1: TGroupBox;
    rgSelec: TRadioGroup;
    dblcdCCBco: TwwDBLookupComboDlg;
    Label1: TLabel;
    dbeBcoDes: TwwDBEdit;
    dbeBanco: TwwDBEdit;
    Label4: TLabel;
    ppdbRepMovxDef: TppDBPipeline;
    ppRepMovxDef: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    pplblCia: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    pplblTitulo: TppLabel;
    ppLabel5: TppLabel;
    ppdbFecha: TppDBText;
    ppShape1: TppShape;
    ppLabel6: TppLabel;
    ppdbNroComp: TppDBText;
    ppLabel7: TppLabel;
    ppdbTDiario: TppDBText;
    ppLabel8: TppLabel;
    ppdbOperacion: TppDBText;
    ppLabel9: TppLabel;
    ppdbMonto: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppShape2: TppShape;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    procedure FormShow(Sender: TObject);
    procedure XKeyPress(Sender: TObject; var Key: Char);
    procedure dbseMesExit(Sender: TObject);
    procedure dbseAnoExit(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure z2bbtnCancel2Click(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcdCCBcoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgSelecClick(Sender: TObject);
    procedure dblcdCCBcoEnter(Sender: TObject);
    procedure ppRepMovxDefPreviewFormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Validacion ;
    procedure ProcesoCierre;
  public
    { Public declarations }
  end;

var
  FCierreMensual: TFCierreMensual;

implementation

{$R *.DFM}

procedure TFCierreMensual.FormShow(Sender: TObject);
begin
//
   dbseAno.Text := strAno( Date ) ;
   dbseMes.Text := strMes( Date ) ;
end;

procedure TFCierreMensual.XKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = '.' then
    begin
     Key := #0 ;
   end ;
end;

procedure TFCierreMensual.dbseMesExit(Sender: TObject);
var
   xSQL : String;
begin
   if Length(Trim(dbseMes.Text)) = 0 then
    begin
     MessageDlg('Ingrese el Mes', mtInformation, [mbOk], 0);
     dbseMes.SetFocus ;
     Exit ;
    end ;
   dbseMes.Text := Trim(dbseMes.Text) ;
   if Length(dbseMes.Text) <> 2 then
    begin
     dbseMes.Text := '0' + dbseMes.Text ;
    end;

   if ( DMTE.SRV_D = 'DB2400' ) or ( DMTE.SRV_D = 'DB2NT' ) then
    begin
     xSQL := 'Select A.BANCOID, A.CCBCOID, C.BANCONOM'
            +' From TGE106 A'
            +' LEFT JOIN TGE105 C ON A.BANCOID = C.BANCOID'
            +' LEFT JOIN CAJA402 B ON A.CIAID = B.CIAID And A.BANCOID=B.BANCOID AND'
            +'                        A.CCBCOID = B.CCBCOID And B.ANOMM='''+dbseAno.Text+dbseMes.Text+''' '
            +' Where A.CIAID ='+QuotedStr(dblcCia.Text)
            +' And COALESCE(B.CIERRE,''N'')=''N'''
            +' And C.BCOTIPCTA=''B'' ';
    end;
   if (DMTE.SRV_D = 'ORACLE' ) then
    begin
     xSQL := 'Select A.BANCOID, A.CCBCOID, C.BANCONOM'
            +' From TGE106 A,TGE105 C, CAJA402 B WHERE A.CIAID=B.CIAID(+) And A.BANCOID=B.BANCOID(+)'
            +' And A.CCBCOID=B.CCBCOID(+) And B.ANOMM(+)='''+dbseAno.Text+dbseMes.Text+''' '
            +' And A.BANCOID=C.BANCOID(+)'
            +' And A.CIAID ='+QuotedStr(dblcCia.Text)
            +' And '+DMTE.wReplacCeros+'(B.CIERRE(+),''N'')=''N'' '
            +' And C.BCOTIPCTA=''B'' ';
    end;

   DMTE.cds1.Close;
   DMTE.cds1.DataRequest(xSQL);
   DMTE.cds1.Open;
end;

procedure TFCierreMensual.dbseAnoExit(Sender: TObject);
var
   xSQL : String;
begin
   if Trim(dbseAno.Text) = '' then
    begin
     Beep;
     MessageDlg('Ingrese el Año', mtInformation, [mbOk], 0);
     dbseAno.SetFocus ;
     Exit ;
    end;
   dbseAno.Text := Trim(dbseAno.Text) ;
   if dbseAno.Text = FloatToStr(dbseAno.MinValue) then
    begin
     dbseAno.Text := strAno(Date) ;
     Exit ;
    end ;
   if Length(dbseAno.Text) <> 4 then
    begin
     dbseAno.Text := DMTE.StrZero( dbseAno.Text,4) ;
    end ;

   if ( DMTE.SRV_D = 'DB2400' ) or ( DMTE.SRV_D = 'DB2NT' ) then
    begin
     xSQL := 'Select A.BANCOID, A.CCBCOID, C.BANCONOM'
            +' From TGE106 A'
            +' LEFT JOIN TGE105 C ON A.BANCOID=C.BANCOID'
            +' LEFT JOIN CAJA402 B ON A.CIAID=B.CIAID AND A.BANCOID=B.BANCOID AND'
            +'                        A.CCBCOID=B.CCBCOID AND B.ANOMM='''+dbseAno.Text+dbseMes.Text+''' '
            +' Where A.CIAID='+QuotedStr(dblcCia.Text)
            +' And COALESCE(B.CIERRE,''N'')=''N''';
    end;
   if (DMTE.SRV_D = 'ORACLE' ) then
    begin
     xSQL := 'Select A.BANCOID, A.CCBCOID, C.BANCONOM'
            +' From TGE106 A,TGE105 C,CAJA402 B'
            +' Where A.CIAID=B.CIAID(+) And A.BANCOID=B.BANCOID(+)'
            +' And A.CCBCOID=B.CCBCOID(+) And B.ANOMM(+)='''+dbseAno.Text+dbseMes.Text+''' '
            +' And A.BANCOID=C.BANCOID(+)'
            +' And A.CIAID ='+QuotedStr(dblcCia.Text)
            +' And '+DMTE.wReplacCeros+'(B.CIERRE(+),''N'')=''N''';
    end;
   DMTE.cds1.Close;
   DMTE.cds1.DataRequest(xSQL);
   DMTE.cds1.Open;
end;

procedure TFCierreMensual.z2bbtnOKClick(Sender: TObject);
var
   xSaldoMN, xSaldoME : Double;
   xAnoOri, xMesOri, xSQL, xxMSG, xWhere : String;
   xBanco, xCtaCte, xVacio : String;
   xFecha : TDate;
   x10 : Integer;
begin
//******************************************************************************
//   VALIDAR SI NO HAY NINGUN DOCUMENTO EN ESTADO INCIAL EN CAJA302 Y CXC303  \\
//******************************************************************************
   if rgSelec.ItemIndex = 0 Then
   begin
      xSQL := 'Select CAJA302.CIAID, CAJA302.TDIARID, CAJA302.ECANOMM, CAJA302.ECNOCOMP, CAJA302.EC_PROCE,'
            +' CAJA302.BANCOID, CAJA302.CCBCOID, CAJA302.ECESTADO, CAJA302.ECFCOMP, CAJA302.ECMTOLOC '
            +'From CAJA302, TGE105 '
            +'Where CAJA302.CIAID ='+QuotedStr(dblcCia.Text)
            +' and CAJA302.ECANOMM ='+QuotedStr(dbseAno.Text+DMTE.StrZero(dbseMes.Text, 2))
            +' and CAJA302.ECESTADO ='+QuotedStr('I')
            +' and TGE105.BANCOID=CAJA302.BANCOID '
            +' and TGE105.BCOTIPCTA=''B'' ';

      DMTE.cdsQry3.Filter   := '';
      DMTE.cdsQry3.Filtered := False;
      DMTE.cdsQry3.IndexFieldNames := '';
      DMTE.cdsQry3.Close;
      DMTE.cdsQry3.DataRequest(xSQL);
      DMTE.cdsQry3.Open;
      DMTE.cdsQry3.IndexFieldNames := 'ECFCOMP; ECNOCOMP';

      xSQL := 'Select CXC303.CIAID, CXC303.TDIARID, CXC303.ECANOMM, CXC303.ECNOCOMP, '''' EC_PROCE,'
             +' CXC303.BANCOID, CXC303.CCBCOID, CXC303.NCOESTADO, CXC303.CCFEMIS, CXC303.NCOMTOLOC '
             +'From CXC303, TGE105 '
             +'Where CXC303.CIAID ='+QuotedStr(dblcCia.Text)
             +'  and CXC303.ECANOMM ='+QuotedStr(dbseAno.Text+DMTE.StrZero(dbseMes.Text, 2))
             +'  and CXC303.NCOESTADO ='+QuotedStr('I')
             +'  and TGE105.BANCOID=CXC303.BANCOID '
             +'  and TGE105.BCOTIPCTA=''B'' ';
      DMTE.cdsQry4.Filter   := '';
      DMTE.cdsQry4.Filtered := False;
      DMTE.cdsQry4.IndexFieldNames := '';
      DMTE.cdsQry4.Close;
      DMTE.cdsQry4.DataRequest(xSQL);
      DMTE.cdsQry4.Open;
      DMTE.cdsQry4.IndexFieldNames := 'CCFEMIS; ECNOCOMP';
   end
   else
   begin
     If Length(dblcdCCBco.Text) = 0 Then
      begin
       Beep;
       MessageDlg('Ingrese la Cuenta Corriente', mtInformation, [mbOk], 0);
       dblcdCCBco.SetFocus;
       Exit;
      end;

     xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, EC_PROCE,'
            +' BANCOID, CCBCOID, ECESTADO, ECFCOMP, ECMTOLOC From CAJA302'
            +' Where CIAID ='+QuotedStr(dblcCia.Text)
            +' And ECANOMM ='+QuotedStr(dbseAno.Text+DMTE.StrZero(dbseMes.Text, 2))
            +' And BANCOID ='+QuotedStr(DMTE.cds1.FieldByName('BANCOID').AsString)
            +' And CCBCOID ='+QuotedStr(DMTE.cds1.FieldByName('CCBCOID').AsString)
            +' And ECESTADO ='+QuotedStr('I');

     DMTE.cdsQry3.Filter   := '';
     DMTE.cdsQry3.Filtered := False;
     DMTE.cdsQry3.IndexFieldNames := '';
     DMTE.cdsQry3.Close;
     DMTE.cdsQry3.DataRequest(xSQL);
     DMTE.cdsQry3.Open;
     DMTE.cdsQry3.IndexFieldNames := 'ECFCOMP; ECNOCOMP';

     xSQL := 'Select CIAID, TDIARID, ECANOMM, ECNOCOMP, '''' EC_PROCE,'
            +' BANCOID, CCBCOID, NCOESTADO, CCFEMIS, NCOMTOLOC From CXC303'
            +' Where CIAID ='+QuotedStr(dblcCia.Text)
            +' And ECANOMM ='+QuotedStr(dbseAno.Text+DMTE.StrZero(dbseMes.Text, 2))
            +' And BANCOID ='+QuotedStr(DMTE.cds1.FieldByName('BANCOID').AsString)
            +' And CCBCOID ='+QuotedStr(DMTE.cds1.FieldByName('CCBCOID').AsString)
            +' And NCOESTADO ='+QuotedStr('I');

     DMTE.cdsQry4.Filter   := '';
     DMTE.cdsQry4.Filtered := False;
     DMTE.cdsQry4.IndexFieldNames := '';
     DMTE.cdsQry4.Close;
     DMTE.cdsQry4.DataRequest(xSQL);
     DMTE.cdsQry4.Open;
     DMTE.cdsQry4.IndexFieldNames := 'CCFEMIS; ECNOCOMP';
    end;

   If (DMTE.cdsQry3.RecordCount > 0) Or (DMTE.cdsQry4.RecordCount > 0) Then
    begin
     Beep;
     MessageDlg('Existen Documentos Pendientes de Cancelación', mtInformation, [mbOk], 0);

     xSQL := 'Select Cast(''AAA'' As Varchar2(25)) EC_PROCDES,'
            +' Cast(''AAA'' As Varchar2(15)) ECNOCOMP,'
            +' ''AAA'' TDIARID, ''AAAAAAAAAA'' FECHA, 0.00 MONTO From DUAL';

     DMTE.cdsQry5.Filter   := '';
     DMTE.cdsQry5.Filtered := False;
     DMTE.cdsQry5.IndexFieldNames := '';
     DMTE.cdsQry5.Close;
     DMTE.cdsQry5.DataRequest(xSQL);
     DMTE.cdsQry5.Open;
     DMTE.cdsQry5.Delete;

     If DMTE.cdsQry3.RecordCount > 0 Then
      begin
       DMTE.cdsQry3.First;
       While Not DMTE.cdsQry3.EOF do
        begin
         DMTE.cdsQry5.Append;
         DMTE.cdsQry5.FieldByName('EC_PROCDES').AsString := DMTE.DisplayDescrip('prvSQL', 'CAJA802', 'DESCRIP', 'ID ='+QuotedStr(DMTE.cdsQry3.FieldByName('EC_PROCE').AsString), 'DESCRIP');
         DMTE.cdsQry5.FieldByName('ECNOCOMP').AsString   := DMTE.cdsQry3.FieldByName('ECNOCOMP').AsString;
         DMTE.cdsQry5.FieldByName('TDIARID').AsString    := DMTE.cdsQry3.FieldByName('TDIARID').AsString;
         DMTE.cdsQry5.FieldByName('FECHA').AsString      := DMTE.cdsQry3.FieldByName('ECFCOMP').AsString;
         DMTE.cdsQry5.FieldByName('MONTO').AsFloat       := DMTE.cdsQry3.FieldByName('ECMTOLOC').AsFloat;
         DMTE.cdsQry3.Next;
        end;
      end;

     If DMTE.cdsQry4.RecordCount > 0 Then
      begin
       DMTE.cdsQry4.First;
       While Not DMTE.cdsQry4.EOF do
        begin
         DMTE.cdsQry5.Append;
         DMTE.cdsQry5.FieldByName('EC_PROCDES').AsString := 'Cobranza';
         DMTE.cdsQry5.FieldByName('ECNOCOMP').AsString   := DMTE.cdsQry4.FieldByName('ECNOCOMP').AsString;
         DMTE.cdsQry5.FieldByName('TDIARID').AsString    := DMTE.cdsQry4.FieldByName('TDIARID').AsString;
         DMTE.cdsQry5.FieldByName('FECHA').AsString      := DMTE.cdsQry4.FieldByName('CCFEMIS').AsString;
         DMTE.cdsQry5.FieldByName('MONTO').AsFloat       := DMTE.cdsQry4.FieldByName('NCOMTOLOC').AsFloat;
         DMTE.cdsQry4.Next;
        end;
      end;

     ppRepMovxDef.Template.FileName  := wRutaRpt +'\MovxDefinir.rtm';
     ppRepMovxDef.Template.LoadFromFile;
     pplblCia.Caption := DMTE.DisplayDescrip('prvSQL', 'TGE101', 'CIADES', 'CIAID ='+QuotedStr(dblcCia.Text), 'CIADES');
     pplblTitulo.Caption := 'Movimientos por Definir Antes de Cierre para el Período '+dbseAno.Text+dbseMes.Text;
     ppRepMovxDef.Print;
     ppRepMovxDef.Stop;

     x10 := Self.ComponentCount - 1;
     While x10 > 0 do
      begin
       If Self.Components[x10].ClassName = 'TppGroup' Then
        begin
         Self.Components[x10].Free;
        end;
       x10 := x10 - 1;
      end;
     Exit;
    end;

   {
   Validacion ;
   }

   if rgSelec.ItemIndex = 0 then
    begin
     DMTE.cds1.Filtered := False;
     DMTE.cds1.Filter   := '';
    end
   else
    begin
     if Length(dbeBanco.Text) = 0 then
      begin
      Beep;
      MessageDlg('Debe Seleccionar Caja/Banco', mtInformation, [mbOk], 0);
      Exit;
     end;
    end;

   xSaldoMN := 0;

   xSaldoME := 0;

   Screen.Cursor := crHourGlass;

   DMTE.cds1.First;
   While not DMTE.cds1.Eof do
    begin
     xBanco  := DMTE.cds1.FieldByName('BANCOID').AsString;
     xCtaCte := DMTE.cds1.FieldByName('CCBCOID').AsString;

     xVacio := '';
     if DMTE.SRV_D = 'ORACLE' then
      begin
       if Length(xCtaCte) = 0 then xCtaCte := 'X';
        xVacio := 'X';
      end;

     xAnoOri := dbseAno.Text;
     xMesOri := dbseMes.Text;

      //////////////////////////////////////////////////
      //  Verifica Si Año Mes de Caja no fué cerrado  //
      //////////////////////////////////////////////////


     If (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
      xSQL := 'Select CIERRE From CAJA402'
             +' Where CIAID ='+QuotedStr(dblcCia.Text)
             +' And BANCOID ='+QuotedStr(xBanco)
             +' And COALESCE(CCBCOID,'''+xVacio+''')='''+xCtaCte+''' And ANOMM='''+xAnoOri+xMesOri+''''
     Else
      xSQL := 'Select CIERRE From CAJA402'
             +' Where CIAID ='+QuotedStr(dblcCia.Text)
             +' And BANCOID ='+QuotedStr(xBanco)
             +' And NVL(CCBCOID,'''+xVacio+''')='''+xCtaCte+''' And ANOMM='''+xAnoOri+xMesOri+'''';

     DMTE.cdsQry2.Filter   := '';
     DMTE.cdsQry2.Filtered := False;
     DMTE.cdsQry2.IndexFieldNames := '';
     DMTE.cdsQry2.Close;
     DMTE.cdsQry2.DataRequest( xSQL );
     DMTE.cdsQry2.Open;

     if DMTE.cdsQry2.FieldByName('CIERRE').AsString = 'S' then
      begin
       Screen.Cursor := crDefault;
       Beep;
       MessageDlg('El Mes '+dbseMes.Text+' para el Año '+dbseAno.Text+' ya Fué Cerrado', mtInformation, [mbOk], 0);
       Exit;
      end;

     xFecha := DMTE.UltimoDiaMes( xAnoOri, xMesOri );

      //////////////////////////////////////////////////////////////////////////////
      //  Verifica Si En Cuentas por Cobrar Hay Consolidados por Entregar a Caja  //
      //////////////////////////////////////////////////////////////////////////////

     if DMTE.VerificaDocumentosEstadoInicial( dblcCia.Text, xBanco, xCtaCte, xFecha ) then
      begin
       xxMSG := 'Banco : '+xBanco+' Cta.Cte.: '+xCtaCte;
       Screen.Cursor       := crDefault;
       MessageDlg('Existen Documentos en '+xxMSG+' En Estado Inicial ', mtInformation, [mbOk], 0);
       Exit;
      end;

      //////////////////////////////////////////////////////////////////////////////
      //  Verifica Si En Cuentas por Cobrar Hay Consolidados por Entregar a Caja  //
      //////////////////////////////////////////////////////////////////////////////

     if ( DMTE.SRV_D = 'DB2400' ) or ( DMTE.SRV_D = 'DB2NT' ) then
      begin
       xSQL := ' Select A.CIAID, A.LICOID, A.COID, C.CCFEMIS, C.TMONID, C.LICOUSER,'
              +' SUM(CASE WHEN A.TMONIDPAGO ='+QuotedStr(DMTE.wTMonLoc)+' THEN A.LICOMTOABOLOC ELSE 0 END) LICOMTOABOLOC,'
              +' SUM(CASE WHEN A.TMONIDPAGO ='+QuotedStr(DMTE.wTMonExt)+' THEN A.LICOMTOABOEXT ELSE 0 END) LICOMTOABOEXT'
              +' From CXC320 A '
              +' LEFT JOIN CXC206 B ON A.CIAID=B.CIAID AND A.COID = B.COID'
              +' LEFT JOIN CXC318 C ON C.CIAID=A.CIAID AND C.LICOID = A.LICOID'
              +' Where COALESCE(C.LICOCAJA,''N'')<>''S'' And B.COCONS=''S'' '
              +' And C.CCFEMIS<='+DMTE.wRepFuncDate+''''+FormatDateTime( DMTE.wFormatFecha, xFecha )+''') '
              +' GROUP BY A.CIAID, A.LICOID, A.COID, C.CCFEMIS, C.TMONID, C.LICOUSER';
      end
     Else
      begin
       xSQL := ' Select A.CIAID, A.LICOID, A.COID, C.CCFEMIS, C.TMONID, C.LICOUSER,'
              +' SUM(CASE WHEN A.TMONIDPAGO='+QuotedStr(DMTE.wTMonLoc)+' THEN A.LICOMTOABOLOC ELSE 0 END) LICOMTOABOLOC,'
              +' SUM(CASE WHEN A.TMONIDPAGO='+QuotedStr(DMTE.wTMonExt)+' THEN A.LICOMTOABOEXT ELSE 0 END) LICOMTOABOEXT'
              +' From CXC320 A, CXC206 B, CXC318 C'
              +' Where A.CIAID=B.CIAID And A.COID = B.COID'
              +' And C.CIAID=A.CIAID And C.LICOID = A.LICOID'
              +' And NVL(C.LICOCAJA,''N'')<>''S'' And B.COCONS=''S'' '
              +' And C.CCFEMIS<='+DMTE.wRepFuncDate+''''+FormatDateTime( DMTE.wFormatFecha, xFecha )+''') '
              +' GROUP BY A.CIAID, A.LICOID, A.COID, C.CCFEMIS, C.TMONID, C.LICOUSER';
{       xSQL := 'Select A.CIAID, A.LICOID, A.COID, A.CCFEMIS, A.TMONID, A.LICOMTOORI,'
              +' A.LICOCAJA, LICOUSER'
              +' From CXC318 A, CXC206 B, CXC318 C'
              +' Where COALESCE(A.LICOCAJA,''N'')<>''S'' AND B.COCONS=''S'''
              +' and A.CIAID=B.CIAID AND A.COID=B.COID'
              + 'and C.CIAID=A.CIAID AND C.LICOID=A.LICOID'
              + 'and C.CCFEMIS<='+DMTE.wRepFuncDate+''''+FormatDateTime( DMTE.wFormatFecha, xFecha )+''')'}
      end;

     DMTE.cdsQry2.Filter   := '';
     DMTE.cdsQry2.Filtered := False;
     DMTE.cdsQry2.IndexFieldNames := '';
     DMTE.cdsQry2.Close;
     DMTE.cdsQry2.DataRequest( xSQL );
     DMTE.cdsQry2.Open;

     if DMTE.cdsQry2.RecordCount > 0 then
      begin
       Screen.Cursor := crDefault;
       MessageDlg('Existen Documentos en Cobranzas por Tranferir', mtInformation, [mbOk], 0);
       Exit;
      end;

     if xCtaCte = 'X' then xCtaCte := '';

     DMTE.CalculaSaldo( dblcCia.Text, xBanco, xCtaCte, xFecha, xSaldoMN, xSaldoME );

     xVacio := '';
     if DMTE.SRV_D = 'ORACLE' then
      begin
       if Length(xCtaCte) = 0 then xCtaCte := 'X';
        xVacio := 'X';
      end;

     If ( DMTE.SRV_D = 'DB2400' ) or ( DMTE.SRV_D = 'DB2NT' ) then
      xSQL := 'Select * From CAJA402'
             +' Where CIAID ='+QuotedStr(dblcCia.Text)
             +' And BANCOID ='+QuotedStr(xBanco)
             +' And COALESCE(CCBCOID,'''+xVacio+''')='''+xCtaCte+''' And ANOMM='''+xAnoOri+xMesOri+''''
     Else
      xSQL := 'Select * From CAJA402'
             +' Where CIAID ='+QuotedStr(dblcCia.Text)
             +' And BANCOID ='+QuotedStr(xBanco)
             +' And NVL(CCBCOID,'''+xVacio+''')='''+xCtaCte+''' And ANOMM='''+xAnoOri+xMesOri+'''';

     DMTE.cdsQry2.Filter   := '';
     DMTE.cdsQry2.Filtered := False;
     DMTE.cdsQry2.IndexFieldNames := ''; 
     DMTE.cdsQry2.Close;
     DMTE.cdsQry2.DataRequest( xSQL );
     DMTE.cdsQry2.Open;

     if DMTE.cdsQry2.RecordCount > 0 then
      begin
       If ( DMTE.SRV_D = 'DB2400' ) or ( DMTE.SRV_D = 'DB2NT' ) then
        begin
         xSQL := 'Delete From CAJA402'
                +' Where CIAID ='+QuotedStr(dblcCia.Text)
                +' And BANCOID ='+QuotedStr(xBanco)
                +' And COALESCE(CCBCOID,'''+xVacio+''')='''+xCtaCte+''' And ANOMM='''+xAnoOri+xMesOri+'''';
         DMTE.cdsQry2.Close;
         DMTE.cdsQry2.DataRequest( xSQL );
        end
       Else
        begin
         xSQL := 'Delete From CAJA402'
                +' Where CIAID ='+QuotedStr(dblcCia.Text)
                +' And BANCOID ='+QuotedStr(xBanco)
                +' And NVL(CCBCOID,'''+xVacio+''')='''+xCtaCte+''' And ANOMM='''+xAnoOri+xMesOri+'''';
         DMTE.cdsQry2.Close;
         DMTE.cdsQry2.DataRequest( xSQL );
        end;
       try
        DMTE.cdsQry2.Execute;
       except
       end;
      end
     Else
      begin
       If ( DMTE.SRV_D = 'DB2400' ) or ( DMTE.SRV_D = 'DB2NT' ) then
        begin
         xWhere := 'CIAID ='+QuotedStr(dblcCia.Text)
                  +' And BANCOID ='+QuotedStr(xBanco)
                  +' And COALESCE(CCBCOID,'''+xVacio+''')='+QuotedStr(xCtaCte)
                  +' And CIERRE ='+QuotedStr('N');
         DMTE.DisplayDescrip('prvSQL', 'CAJA402', 'MAX(ANOMM) ANOMM', xWhere, 'ANOMM');
        end
       Else
        begin
         xWhere := 'CIAID ='+QuotedStr(dblcCia.Text)
                  +' And BANCOID ='+QuotedStr(xBanco)
                  +' And NVL(CCBCOID,'''+xVacio+''')='+QuotedStr(xCtaCte) 
                  +' And CIERRE ='+QuotedStr('N');
         DMTE.DisplayDescrip('prvSQL', 'CAJA402', 'MAX(ANOMM) ANOMM', xWhere, 'ANOMM');
        end;
       xSQL := 'Update CAJA402'
              +' Set CIERRE ='+QuotedStr('S')
              +' Where CIAID ='+QuotedStr(dblcCia.Text)
              +' And BANCOID ='+QuotedStr(xBanco)
              +' And ANOMM ='+QuotedStr(DMTE.cdsQry.FieldByName('ANOMM').AsString);
       DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;

     if xCtaCte = 'X' then xCtaCte := '';

     DMTE.CalculaSaldo( dblcCia.Text, xBanco, xCtaCte, xFecha, xSaldoMN, xSaldoME );     
     xSQL := 'Insert Into CAJA402( CIAID, BANCOID, CCBCOID, ANOMM,'
            +' SALDOINIMN, INGRESOMN, EGRESOMN, SALDOFINMN,'
            +' SALDOINIME, INGRESOME, EGRESOME, SALDOFINME,'
            +' USUARIO, FREG, HREG, CIERRE)'
            +' Values( '''+dblcCia.Text+''', '''+xBanco+''', '''+xCtaCte+''', '''+xAnoOri+xMesOri+''', '
            +   FloatToStr(DMTE.cdsQry.FieldByName('SALMN').AsFloat)+', '+FloatToStr(DMTE.cdsQry.FieldByName('INGMN').AsFloat)+', '
            +   FloatToStr(DMTE.cdsQry.FieldByName('EGRMN').AsFloat)+', '+FloatToStr(xSaldoMN)+', '
            +   FloatToStr(DMTE.cdsQry.FieldByName('SALME').AsFloat)+', '+FloatToStr(DMTE.cdsQry.FieldByName('INGME').AsFloat)+', '
            +   FloatToStr(DMTE.cdsQry.FieldByName('EGRME').AsFloat)+', '+FloatToStr(xSaldoME)+', '
            +  ''''+DMTE.wUsuario+''', '+DMTE.wRepFecServi+', '+DMTE.wRepHorServi+', ''N'' ) ';

     DMTE.cdsQry2.Close;
     DMTE.cdsQry2.DataRequest( xSQL );
     try
      DMTE.cdsQry2.Execute;
     except
      Screen.Cursor       := crDefault;
      ShowMessage('Error : Al Generar Saldo');
      Exit;
     end;

     DMTE.cds1.Next;
    end;

   if ( DMTE.SRV_D = 'DB2400' ) or ( DMTE.SRV_D = 'DB2NT' ) then
   begin
      xSQL := 'Select A.BANCOID, A.CCBCOID, C.BANCONOM'
             +' From TGE106 A'
             +' LEFT JOIN TGE105 C ON A.BANCOID = C.BANCOID'
             +' LEFT JOIN CAJA402 B ON A.CIAID = B.CIAID And A.BANCOID=B.BANCOID AND '
             +'                        A.CCBCOID = B.CCBCOID And B.ANOMM='''+dbseAno.Text+dbseMes.Text+''' '
             +' Where A.CIAID ='+QuotedStr(dblcCia.Text)
             +' And COALESCE(B.CIERRE,''N'')=''N'''
             +' And C.BCOTIPCTA=''B'' ';
   end;
   if (DMTE.SRV_D = 'ORACLE' ) then
   begin
      xSQL := 'Select A.BANCOID, A.CCBCOID, C.BANCONOM'
             +' From TGE106 A, TGE105 C, CAJA402 B'
             +' Where A.CIAID ='+QuotedStr(dblcCia.Text)
             +' and B.CIAID = A.CIAID and B.BANCOID = A.BANCOID and B.CCBCOID = A.CCBCOID '
             +'     and B.ANOMM ='+QuotedStr(dbseAno.Text+dbseMes.Text)
             +'     and '+DMTE.wReplacCeros+'(B.CIERRE(+),''N'')=''N'''
             +' and C.BANCOID = A.BANCOID and C.BCOTIPCTA=''B'' ';
   end;

   DMTE.cds1.Close;
   DMTE.cds1.DataRequest(xSQL);
   DMTE.cds1.Open;
   DMTE.cds1.IndexFieldNames := 'BANCOID';

   dbeBanco.Text  := '';
   dbeBcoDes.Text := '';

   Screen.Cursor := crDefault;
   MessageDlg('Cierre Ok', mtCustom, [mbOk], 0);
end;

procedure TFCierreMensual.Validacion;
var
   xWhere       ,
   xSQL         ,
   xFecha       ,
   xFechaMax    ,
   xFechaMaxSQL : String ;
   xNumRows     : Integer ;
begin
   xFecha := dbseAno.Text + '-'+ dbseMes.Text+'-'+DMTE.StrZero( IntToStr(UltimoDiaMes(dbseMes.Text)),2 ) ;
     ////////////validacion inicial///////////////////////////

   DMTE.RecuperarDatos('CAJA309',' COUNT(*) NUMROWS, MAX(FECCIERRE) FECHAMAX ','') ;

   xNumRows := DMTE.cdsRec.FieldByName('NUMROWS').AsInteger ;
   if DMTE.cdsRec.FieldByName('NUMROWS').AsInteger <> 0 then
    begin
     xFechaMax := DMTE.cdsRec.FieldByName('FECHAMAX').AsString ;
     DMTE.RecuperarDatos('CAJA309', 'COUNT(*) NUMROWS',
                          'FECCIERRE >= '+DMTE.wRepFuncDate+''''+xFecha + ''')')  ;
     if DMTE.cdsRec.FieldByName('NUMROWS').AsInteger <> 0 then
        Raise Exception.create('Esta fecha se Encuentra Cerrada');
    end
   else
    xfechamax := 'Inicio de Operaciones' ;

   if xNumRows = 0 then
    xFechaMaxSQL := '1900-01-01'
   else
    xFechaMaxSQL := FechaDB2(StrToDate(xFechaMax)) ;

   //comprobar la existencia de movimientos
   xWhere := ' ECFCOMP > '+DMTE.wRepFuncDate + ''''+ xFechaMaxSQL + ''')' +
             ' AND ECFCOMP<='+DMTE.wRepFuncDate+''''+xFecha+''')' +
             ' AND ECESTADO = ''I''';

   DMTE.RecuperarDatos('CAJA302', 'COUNT(*) NUMROWS', xWhere) ;

   if DMTE.cdsRec.FieldByName('NUMROWS').AsInteger = 0 then
    begin
     //Comprobar la existencia de ordenes de pago
     xWhere := ' OPFPAGO > '+DMTE.wRepFuncDate +''''+ xFechaMaxSQL + ''')' +
               '  AND OPFPAGO<='+DMTE.wRepFuncDate+''''+xFecha+''')' +
               '  AND OPESTADO = ''I''' ;
     DMTE.RecuperarDatos('CXP303','COUNT(*) NUMROWS',xWhere) ;
     if DMTE.cdsRec.FieldByName('NUMROWS').AsInteger = 0 then
      begin
       //Comprobar la existencia de Notas de Cobranza
       xWhere := ' NCOFCOB > '+DMTE.wRepFuncDate +''''+ xFechaMaxSQL + ''')' +
                 ' AND NCOFCOB<='+DMTE.wRepFuncDate+''''+xFecha+''')' +
                 ' AND NCOESTADO = ''I''';
       DMTE.RecuperarDatos('CXC303','COUNT(*) NUMROWS',xWhere) ;
       if DMTE.cdsRec.FieldByName('NUMROWS').AsInteger <> 0 then
        Raise Exception.Create('Hay Notas de Cobranza pendientes de Cancelación'+ #13 +
                               'No se puede Efectuar el Cierre Hasta la fecha especificada') ;
      end
     else
      Raise Exception.Create('Hay Ordenes de Pago pendientes de Cancelación'+ #13 +
                             'No se puede Efectuar el Cierre Hasta la fecha especificada') ;
      end
   else
    Raise Exception.Create('Hay Movimientos pendientes de Cancelación'+ #13 +
                           'No se puede Efectuar el Cierre Hasta la fecha especificada') ;

   xSQL := 'INSERT INTO CAJA309 ('+
              'FECCIERRE, USERID '+
            ') VALUES('+
              DMTE.wRepFuncDate+''+xFecha+'''),'
              +DMTE.wUsuario+')' ;
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   ProcesoCierre;

   ShowMessage('Cierre de Fecha se efectuó Satisfactoriamente');
end;

procedure TFCierreMensual.ProcesoCierre;
begin
//
end;

procedure TFCierreMensual.z2bbtnCancel2Click(Sender: TObject);
begin
   Close;
end;

procedure TFCierreMensual.dblcCiaExit(Sender: TObject);
var
   xSQL : String;
begin
   edtCia.Text := DMTE.cdsCia.FieldByName('CIADES').AsString;

   if ( DMTE.SRV_D = 'DB2400' ) or ( DMTE.SRV_D = 'DB2NT' ) then
   begin
     xSQL := 'Select A.BANCOID, A.CCBCOID, C.BANCONOM '
            +'from TGE106 A '
            +'LEFT JOIN TGE105 C ON A.BANCOID=C.BANCOID '
            +'LEFT JOIN CAJA402 B ON A.CIAID=B.CIAID AND A.BANCOID=B.BANCOID AND '
            +                         'A.CCBCOID=B.CCBCOID AND B.ANOMM='''+dbseAno.Text+dbseMes.Text+''' '
            +' Where A.CIAID ='+QuotedStr(dblcCia.Text)
            +' And COALESCE(B.CIERRE,''N'')=''N'' '
            +' And C.BCOTIPCTA=''B'' ';
   end;

   if (DMTE.SRV_D = 'ORACLE' ) then
   begin
      xSQL := 'Select A.BANCOID, A.CCBCOID, C.BANCONOM '
             +'From TGE106 A, TGE105 C, CAJA402 B Where A.CIAID=B.CIAID(+) And A.BANCOID=B.BANCOID(+)'
             +' and A.CCBCOID=B.CCBCOID(+) And B.ANOMM(+)='''+dbseAno.Text+dbseMes.Text+''' '
             +' and A.BANCOID=C.BANCOID(+)'
             +' and A.CIAID ='+QuotedStr(dblcCia.Text)
             +' and '+DMTE.wReplacCeros+'(B.CIERRE(+),''N'')=''N'' '
             +' and C.BCOTIPCTA=''B'' ';
   end;

   DMTE.cds1.Filter   := '';
   DMTE.cds1.Filtered := False;
   DMTE.cds1.IndexFieldNames := '';
   DMTE.cds1.Close;
   DMTE.cds1.DataRequest(xSQL);
   DMTE.cds1.Open;
end;

procedure TFCierreMensual.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFCierreMensual.dblcdCCBcoExit(Sender: TObject);
var
   xCC : String;
begin
   dbeBanco.Text  := DMTE.cds1.FieldByName('BANCOID').AsString;
   xCC            := DMTE.cds1.FieldByName('CCBCOID').AsString;
   dbeBcoDes.Text := DMTE.cds1.FieldByName('BANCONOM').AsString;

   DMTE.cds1.Filtered := False;
   DMTE.cds1.Filter   := 'BANCOID='''+dbeBanco.Text +''' And '
                     +'CCBCOID='''+xCC           +'''';
   DMTE.cds1.Filtered := True;
   DMTE.cdsQry.Filter   := '';
   DMTE.cdsQry.Filtered := False;
   DMTE.cdsQry.IndexFieldNames := '';
   DMTE.cdsQry.Close;
   DMTE.cdsQry2.Filter   := '';
   DMTE.cdsQry2.Filtered := False;
   DMTE.cdsQry2.IndexFieldNames := '';
   DMTE.cdsQry2.Close;
   DMTE.cdsQry3.Filter   := '';
   DMTE.cdsQry3.Filtered := False;
   DMTE.cdsQry3.IndexFieldNames := '';
   DMTE.cdsQry3.Close;
   DMTE.cdsQry4.Filter   := '';
   DMTE.cdsQry4.Filtered := False;
   DMTE.cdsQry4.IndexFieldNames := '';
   DMTE.cdsQry4.Close;
   DMTE.cdsQry5.Filter   := '';
   DMTE.cdsQry5.Filtered := False;
   DMTE.cdsQry5.IndexFieldNames := '';
   DMTE.cdsQry5.Close;
end;

procedure TFCierreMensual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMTE.cds1.Filtered := False;
   DMTE.cds1.Filter   := '';
   DMTE.cds1.IndexFieldNames := '';
   DMTE.cds1.Close;
   DMTE.cdsQry.Filter   := '';
   DMTE.cdsQry.Filtered := False;
   DMTE.cdsQry.IndexFieldNames := '';
   DMTE.cdsQry.Close;
   DMTE.cdsQry2.Filter   := '';
   DMTE.cdsQry3.Filtered := False;
   DMTE.cdsQry3.IndexFieldNames := '';
   DMTE.cdsQry3.Close;
   DMTE.cdsQry4.Filter   := '';
   DMTE.cdsQry4.Filtered := False;
   DMTE.cdsQry4.IndexFieldNames := '';
   DMTE.cdsQry4.Close;
   DMTE.cdsQry5.Filter   := '';
   DMTE.cdsQry5.Filtered := False;
   DMTE.cdsQry5.IndexFieldNames := '';
   DMTE.cdsQry5.Close;
end;

procedure TFCierreMensual.rgSelecClick(Sender: TObject);
begin
   DMTE.cds1.Filtered := False;
   DMTE.cds1.Filter   := '';
   DMTE.cds1.Filtered := True;
   if rgSelec.ItemIndex = 0 then
    begin
      dblcdCCBco.Enabled := False;
      dblcdCCBco.Clear;
      dbeBanco.Clear;
      dbeBcoDes.Clear;
    end
   else
    begin
     dblcdCCBco.Enabled := True;
     dblcdCCBco.SetFocus;
    end;
end;

procedure TFCierreMensual.dblcdCCBcoEnter(Sender: TObject);
begin
   DMTE.cds1.Filtered := False;
   DMTE.cds1.Filter   := '';
   DMTE.cds1.Filtered := True;
end;

procedure TFCierreMensual.ppRepMovxDefPreviewFormCreate(Sender: TObject);
begin
   TppReport(Sender).PreviewForm.WindowState := WsMaximized;
   TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

procedure TFCierreMensual.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

end.

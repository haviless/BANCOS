unit CajaTM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ComCtrls, StdCtrls, ToolWin, ExtCtrls, wwdbdatetimepicker,
  wwdblook , db , Mant ;

type
  TFTool1 = class(TForm)
    cb1: TControlBar;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    lblCia: TLabel;
    Label1: TLabel;
    dbdtpInicio: TwwDBDateTimePicker;
    dbdtpFin: TwwDBDateTimePicker;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    z2bbtnOK: TBitBtn;
    procedure dbdtpFinExit(Sender: TObject);
    procedure dbdtpInicioExit(Sender: TObject);
    procedure dblcCiaChange(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dbdtpInicioEnter(Sender: TObject);
    procedure dbdtpInicioChange(Sender: TObject);
    procedure dbdtpFinEnter(Sender: TObject);
    procedure dbdtpFinChange(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure dblcCiaEnter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
  private
    { Private declarations }
    xMant : TMant ;
    strTmp: string;
  public
    { Public declarations }
    procedure AsignaMant(x : TMant) ;
    procedure ConfiguraColumnas;

  end;

var
  FTool1: TFTool1;

implementation

uses CajaUtil, CajaDM ,wwClient ;

{$R *.DFM}
CONST
   Cwhere =    ' WHERE BCOTIPCTA = ''C'''
             +  ' GROUP BY A.BANCOID ,A.BANCONOM )';

procedure TFTool1.dbdtpFinExit(Sender: TObject);
begin
    if dbdtpFin.Date = 0 then
    begin
       dbdtpFin.Date :=tDate( Now);
    end;
    if dbdtpInicio.Date > dbdtpFin.Date then
       dbdtpInicio.Date:=dbdtpFin.Date;
end;

procedure TFTool1.dbdtpInicioExit(Sender: TObject);
begin
    if dbdtpInicio.Date = 0 then
    begin
       dbdtpInicio.Date :=tDate( Now);
    end;
{
    if dbdtpInicio.Date > dbdtpFin.Date then
       dbdtpFin.Date:=dbdtpInicio.Date;
}
end ;

procedure TFTool1.dblcCiaChange(Sender: TObject);
begin
   if  length(dblcCia.Text)=dblcCia.LookupTable.FieldByName('CIAID').Size then
   begin
	   if dblcCia.Text=dblcCia.LookupTable.FieldByName('CIAID').AsString then
	   begin
	      if edtCia.Text<>dblcCia.LookupTable.FieldByName('CIADES').AsString then
	      begin
	            edtCia.Text:=dblcCia.LookupTable.FieldByName('CIADES').AsString  ;
	      end;
	   end
	   else
	   begin
	     if not dblcCia.LookupTable.Locate('CIAID', dblcCia.Text,[]) then
	     begin
	          edtCia.text:='' ;
	     end
	     else
	     begin
	          edtCia.text:=dblcCia.LookupTable.fieldbyname('CIADES').AsString ;
	     end ;
	   end   ;
   end
   else
   begin
           edtCia.text:='' ;
   end ;
   if trim(dblccia.Text) <> strTmp then
      z2bbtnOK.Enabled := True
   else
      z2bbtnOK.Enabled := False ;
end ;


procedure TFTool1.dblcCiaExit(Sender: TObject);
var
   Tmp : string ;
begin
   Tmp := strTmp ;
   if edtCia.Text='' then
   begin
    if dblcCia.Text='' then
      ShowMessage('Ingrese Compañía')
    else
      ShowMessage('El Código de Compañía que ha Ingresado'+#13 +
                  'No está registrado');
    (Sender as twincontrol).SetFocus;
   end ;
   strTmp := Tmp ;
end;
procedure TFTool1.dbdtpInicioEnter( Sender: TObject ) ;
var
   x: double ;
begin
   x := dbdtpInicio.date       ;
   dbdtpInicio.Tag := Round(x) ;
end;

procedure TFTool1.dbdtpInicioChange(Sender: TObject) ;
begin
   if (round(dbdtpInicio.date) <> dbdtpInicio.Tag) then
       z2bbtnOK.Enabled := true
   else
       z2bbtnOK.Enabled := False ;
end;

procedure TFTool1.dbdtpFinEnter(Sender: TObject) ;
var
   x: double ;
begin
   x := dbdtpFin.date       ;
   dbdtpFin.Tag := Round(x) ;
end;

procedure TFTool1.dbdtpFinChange(Sender: TObject);
begin
   if (round(dbdtpFin.date) <> dbdtpFin.Tag) then
       z2bbtnOK.Enabled := true
   else
       z2bbtnOK.Enabled := False ;
end ;

procedure TFTool1.AsignaMant(x : TMant);
begin
   xMant := x ;
end;

procedure TFTool1.z2bbtnOKClick(Sender: TObject);
var
   cdsClone : Twwclientdataset ;
   xWhere  , xSql : string ;
   xJOIN   : String ;
begin
   xSQL := 'DROP VIEW ' + xMant.TableName;
   DMTE.DCOM1.Appserver.ejecutasql(xSQL);
   xSQL:='( SELECT A.BANCOID, A.BANCONOM, '+DMTE.wReplacCeros+'(SUM(B.STSALDOINIC),0.00) STSALDOINIC, '
        +   ''+DMTE.wReplacCeros+'(SUM(B.STTOTING),0.00) STTOTING, '+DMTE.wReplacCeros+'(SUM(B.STTOTEGR ),0.00) STTOTEGR, '
        +   ''+DMTE.wReplacCeros+'(SUM(B.STSALDOFIN ),0.00) STSALDOFIN ,'+DMTE.wReplacCeros+'( SUM(B.STSDOINIEXT),0.00) STSDOINIEXT, '
        +   ''+DMTE.wReplacCeros+'(SUM(B.STINGEXT),0.00) STINGEXT, '+DMTE.wReplacCeros+'(SUM(B.STEGREXT),0.00) STEGREXT, '
        +   ''+DMTE.wReplacCeros+'(SUM(B.STSDOFINEXT ),0.00) STSDOFINEXT '
        +'FROM TGE105 A ';

   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
    begin
     xJOIN:='LEFT JOIN CAJA310 B ON ( A.BANCOID = B.BANCOID and '
           +           'B.STFECHA>='''+FechaDB2(dbdtpInicio.date)+''' and '
           +           'B.STFECHA<='''+ FechaDB2(dbdtpFin.date)  +''' ) ';
     xSQl := 'CREATE VIEW ' + xMant.TableName + ' AS ' + xSQL + xJOIN + Cwhere ;
    end
   else
    if DMTE.SRV_D = 'ORACLE' then
     begin
      xJOIN:=', CAJA310 B WHERE ( A.BANCOID = B.BANCOID (+) and '
           +'B.STFECHA>= TO_DATE('+quotedstr(FechaDB2(dbdtpInicio.date))+') and '
           +'B.STFECHA<= TO_DATE('+quotedstr(FechaDB2(dbdtpFin.date))  +')) ';
      xSQl := 'CREATE VIEW ' + xMant.TableName + ' AS ' + xSQL + xJOIN +
              ' AND BCOTIPCTA = ''C'' GROUP BY A.BANCOID ,A.BANCONOM )'  ;
     end;


   DMTE.DCOM1.Appserver.ejecutasql(xSQL) ;

   xMant.RefreshFilter  ;

   //Calculo de Saldos Iniciales
   cdsClone := Twwclientdataset.create(self) ;
   cdsClone.CloneCursor( xMant.FMant.cds2 , False ) ;
   cdsClone.First     ;
   while not cdsClone.Eof do
   begin
      //Busca datos de Saldo inicial
      cdsClone.Edit ;
      xWhere:='STFECHA<'+QuotedStr(fechadb2(dbdtpInicio.date) )+' AND '
             +'BANCOID='+QuotedStr( cdsclone.fieldbyname('BANCOID').asstring );
      if DMTE.RecuperarDatos('CAJA310','MAX(STFECHA) FECHA',xWhere) then
      begin
         xWhere:='STFECHA<'+QuotedStr(fechadb2(DMTE.cdsrec.fieldbyname('FECHA').AsDatetime))
                +' AND BANCOID='+QuotedStr( cdsclone.fieldbyname('BANCOID').AsString ) ;

         if DMTE.RecuperarDatos('CAJA310','STSALDOFIN,STSDOFINEXT',xWhere) then
         begin
            cdsClone.fieldbyname('STSALDOINIC').AsFloat  :=
                       DMTE.cdsRec.fieldbyname('STSALDOFIN').AsFloat ;
            cdsClone.fieldbyname('STSDOINIEXT').AsFloat :=
                       DMTE.cdsRec.fieldbyname('STSDOFINEXT').AsFloat ;
         END
         else
         begin
            cdsClone.fieldbyname('STSALDOINIC').AsFloat := 0.00 ;
            cdsClone.fieldbyname('STSDOINIEXT').AsFloat := 0.00 ;
         end ;
      end
      else
      begin
         cdsClone.fieldbyname('STSALDOINIC').AsFloat := 0.00 ;
         cdsClone.fieldbyname('STSDOINIEXT').AsFloat := 0.00 ;
      end ;
      //sALDO FINAL SOLES
      cdsClone.fieldbyname('STSALDOFIN').AsFloat  :=
      cdsClone.fieldbyname('STSALDOINIC').AsFloat +
      cdsClone.fieldbyname('STTOTING').AsFloat -
      cdsClone.fieldbyname('STTOTEGR').AsFloat ;
      //SALDO FINAL DOLARES
      cdsClone.fieldbyname('STSDOFINEXT').AsFloat  :=
      cdsClone.fieldbyname('STSDOINIEXT').AsFloat +
      cdsClone.fieldbyname('STINGEXT').AsFloat -
      cdsClone.fieldbyname('STEGREXT').AsFloat ;

      cdsClone.Post ;
      cdsClone.Next ;
   end;
   cdsClone.Free ;
   ConfiguraColumnas ;
   z2bbtnOK.Enabled := False ;
   //finde Calculo de saldos Iniciales
end;


procedure TFTool1.ConfiguraColumnas;
begin
  with xMant.FMant.cds2 , xMant.FMant.dbgFiltro do
  begin
//     fieldbyname('STFECHA').Visible := False ;
     Columnbyname('BANCOID').DisplayLabel     := 'Id.' ;
     Columnbyname('BANCONOM').DisplayLabel    := 'Banco'   ;
     Columnbyname('STSALDOINIC').DisplayLabel := 'Sdo. Inicial (S/.)' ;
     Columnbyname('STTOTING').DisplayLabel    := 'Ingresos (S/.)'   ;
     Columnbyname('STTOTEGR').DisplayLabel    := 'Egresos ($)'      ;
     Columnbyname('STSALDOFIN').DisplayLabel  := 'Sdo. Final(S/.)'  ;
     Columnbyname('STSDOINIEXT').DisplayLabel := 'Sdo. Inicial ($)' ;
     Columnbyname('STINGEXT').DisplayLabel    := 'Ingresos(S/.)'    ;
     Columnbyname('STEGREXT').DisplayLabel    := 'Egresos($)'       ;
     Columnbyname('STSDOFINEXT').DisplayLabel := 'Sdo. Final ($)'   ;
  end ;

end;

procedure TFTool1.dblcCiaEnter(Sender: TObject);
begin
   strTmp := trim ( dblcCia.Text ) ;
end;

procedure TFTool1.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFTool1.dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
  NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

end.

unit Caja213;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, wwdbedit, StdCtrls, wwdblook, Buttons, ExtCtrls, ppBands, ppRelatv,
  ppCache, ppClass, ppComm, ppProd, ppReport, ppPrnabl, ppCtrls, ppDB,
  ppDBPipe, ppVar, Db, Wwdatsrc, DBTables, Wwquery, ppViewr,CAJADM;

type
  TFArqueoCaja = class(TForm)
    pnlRegComp: TPanel;
    lblReporte: TLabel;
    z2bbtnOk: TBitBtn;
    z2bbtnBorra: TBitBtn;
    pnlDatos1: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Label4: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dblcCiaChange(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    PeriodoFechaActual : String;
    DiaActual:Word;
  public
    { Public declarations }
  end;

var
  FArqueoCaja: TFArqueoCaja;

implementation

uses CajaUtil;

{$R *.DFM}

{ TFRepLibros }


procedure TFArqueoCaja.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
   key:=#0;
   perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFArqueoCaja.dblcCiaChange(Sender: TObject);
begin
   if  length(dblcCia.Text)=dblcCia.LookupTable.FieldByName('CIAID').Size then
   begin
	   if dblcCia.Text=dblcCia.LookupTable.FieldByName('CIAID').AsString then
	   begin
	      if edtCia.Text<>dblcCia.LookupTable.FieldByName('CIAABR').AsString then
	      begin
	            edtCia.Text:=dblcCia.LookupTable.FieldByName('CIAABR').AsString;
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
	          edtCia.text:=dblcCia.LookupTable.fieldbyname('CIAABR').AsString;
	     end;
	   end;
   end
   else
   begin
           edtCia.text:='';
   end;
end;


procedure TFArqueoCaja.dblcCiaExit(Sender: TObject);
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


procedure TFArqueoCaja.FormShow(Sender: TObject);
var
   xMes,
   xAno : Word ;
begin
   RecuperarCiaUnica(dblcCia,edtCia);
   DecodeDate(Now, xAno, xMes, DiaActual);
   //Filtrar Por Cajas
   dm1.cdsBanco.Filter:='BCOTIPCTA=''C''';
   DM1.cdsBanco.Filtered := True;
   //fin de filtrar por Cajas
end;


{
procedure TFArqueoCaja.pprArqueoPreviewFormCreate(Sender: TObject);
begin
   (SENDER AS TppReport).PreviewForm.WindowState:=WsMaximized;
   TppViewer((Sender as tppReport).PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
end;
}

procedure TFArqueoCaja.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm1.cdsBanco.Filter:='';
  DM1.cdsBanco.Filtered := True;
end;

{
procedure TSOLsrvCAJA.AsignaSQLArqueoCaja(const xCIAID, xFECHAINICIO,
  xFECHAFIN: WideString);
}
end.

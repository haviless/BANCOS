unit Caja110;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, ExtCtrls;

type
  TFTipoCambio = class(TForm)
    lblTCambio: TLabel;
    dbgData: TwwDBGrid;
    pnlMant: TPanel;
    dbeMontoPC: TwwDBEdit;
    dbeMontoPV: TwwDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    bbtnGrabar: TBitBtn;
    wwDBGrid1IButton: TwwIButton;
    pnlFec: TPanel;
    Label1: TLabel;
    dtpFecha: TwwDBDateTimePicker;
    bbtnCerrar: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure wwDBGrid1IButtonClick(Sender: TObject);
    procedure dbgDataDblClick(Sender: TObject);
    procedure bbtnCerrarClick(Sender: TObject);
    procedure bbtnGrabarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    sTipo : String;
  public
    { Public declarations }
  end;

var
  FTipoCambio: TFTipoCambio;

implementation

{$R *.dfm}

USES CAJADM;

procedure TFTipoCambio.FormActivate(Sender: TObject);
var
   xSQL : String;
begin
   xSQL:='Select * from TGE107 WHERE FECHA>=SYSDATE-30 ORDER BY FECHA DESC';
   DMTE.cdsTransBCO.Close;
   DMTE.cdsTransBCO.DataRequest( xSQL );
   DMTE.cdsTransBCO.Open;
end;



procedure TFTipoCambio.wwDBGrid1IButtonClick(Sender: TObject);
begin
   pnlMant.Visible:=True;
   pnlFec.Enabled :=True;
   dbgData.Enabled :=False;
   sTipo:='A';
   dtpFecha.SetFocus;
   DMTE.cdsTransBCO.Insert;
   DMTE.cdsTransBCO.FieldByname('TMONID').AsString:='D';
end;

procedure TFTipoCambio.dbgDataDblClick(Sender: TObject);
begin
   if dtpFecha.Date<date then
   begin
      ShowMessage('No se puede Ingresar o Modificar Tipo de Cambio con fecha menor a '+DateToStr(date) );
      Exit;
   end;
   sTipo:='M';
   pnlMant.Visible:=True;
   pnlFec.Enabled :=False;
   dbgData.Enabled :=False;
   dbeMontoPC.SetFocus;
end;

procedure TFTipoCambio.bbtnCerrarClick(Sender: TObject);
begin
   pnlMant.Visible :=False;
   dbgData.Enabled :=True;
   DMTE.cdsTransBCO.CancelUpdates;
end;

procedure TFTipoCambio.bbtnGrabarClick(Sender: TObject);
var
   xSQL : String;
begin
   if sTipo='A' then
   begin
      xSQL:='Select fecha, tmonid From TGE107 where FECHA='''+dtpFecha.text+''' and TMONID=''D''';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest( xSQL );
      DMTE.cdsQry.Open;
      if DMTE.cdsQry.Recordcount>0 then
      begin
         ShowMessage('No se puede Ingresar Tipo de Cambio. Fecha '+dtpFecha.text+' ya fue ingresada');
         Exit;
      end;
   end;

   xSQL:='Select TCAMVBC, Round(TCAMVBC*1.33,2) TCCMAX, ROUND(TCAMVBC/1.33,2) TCCMIN, '
        +       'TCAMVBV, Round(TCAMVBV*1.33,2) TCVMAX, ROUND(TCAMVBV/1.33,2) TCVMIN '
        +'From TGE107 '
        +'Where Fecha=(Select max(fecha) fecha from TGE107 '
        +             'Where FECHA>=SYSDATE-60 AND FECHA<TO_CHAR(SYSDATE,''DD/MM/YYYY'') )';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   if (DMTE.cdsTransBCO.FieldByname('TCAMVBC').AsFloat>DMTE.cdsQry.FieldByname('TCCMAX').AsFloat) or
      (DMTE.cdsTransBCO.FieldByname('TCAMVBC').AsFloat<DMTE.cdsQry.FieldByname('TCCMIN').AsFloat) then
   begin
      ShowMessage('Tipo de Cambio Compra '+DMTE.cdsTransBCO.FieldByname('TCAMVBC').AsString+', no esta en el rango permitido. Entre '+DMTE.cdsQry.FieldByname('TCCMIN').AsString+' y '+DMTE.cdsQry.FieldByname('TCCMAX').AsString);
      Exit;
   end;
   if (DMTE.cdsTransBCO.FieldByname('TCAMVBV').AsFloat>DMTE.cdsQry.FieldByname('TCVMAX').AsFloat) or
      (DMTE.cdsTransBCO.FieldByname('TCAMVBV').AsFloat<DMTE.cdsQry.FieldByname('TCVMIN').AsFloat) then
   begin
      ShowMessage('Tipo de Cambio Venta '+DMTE.cdsTransBCO.FieldByname('TCAMVBV').AsString+', no esta en el rango permitido. Entre '+DMTE.cdsQry.FieldByname('TCVMIN').AsString+' y '+DMTE.cdsQry.FieldByname('TCVMAX').AsString);
      Exit;
   end;

   if sTipo='A' then
   begin
      if dtpFecha.Date<date-3 then
      begin
         ShowMessage('No se puede Ingresar o Modificar Tipo de Cambio con fecha menor a '+datetostr(date-3) );
         Exit;
      end;
   end
   else
   begin
      if dtpFecha.Date<(date) then
      begin
         ShowMessage('No se puede Ingresar o Modificar Tipo de Cambio con fecha menor a '+datetostr(date) );
         Exit;
      end;
   end;
   DMTE.cdsTransBCO.Edit;
   DMTE.cdsTransBCO.FieldByname('TCAMVPC').AsFloat:=DMTE.cdsTransBCO.FieldByname('TCAMVBC').AsFloat;
   DMTE.cdsTransBCO.FieldByname('TCAMVPV').AsFloat:=DMTE.cdsTransBCO.FieldByname('TCAMVBV').AsFloat;
   DMTE.cdsTransBCO.FieldByname('TCAMVOC').AsFloat:=DMTE.cdsTransBCO.FieldByname('TCAMVBC').AsFloat;
   DMTE.cdsTransBCO.FieldByname('TCAMVOV').AsFloat:=DMTE.cdsTransBCO.FieldByname('TCAMVBV').AsFloat;
   DMTE.cdsTransBCO.FieldByname('TCAMVXC').AsFloat:=DMTE.cdsTransBCO.FieldByname('TCAMVBC').AsFloat;
   DMTE.cdsTransBCO.FieldByname('TCAMVXV').AsFloat:=DMTE.cdsTransBCO.FieldByname('TCAMVBV').AsFloat;
   if DMTE.cdsTransBCO.ApplyUpdates(-1)>0 Then
      ShowMessage('Error al Grabar Tipo de Cambio')
   else
      ShowMessage('Tipo de Cambio Grabado');

   pnlMant.Visible :=False;
   dbgData.Enabled :=True;
   DMTE.cdsTransBCO.CancelUpdates;
end;

procedure TFTipoCambio.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
  begin
  	key:=#0;
    perform(CM_DialogKey,VK_TAB,0);
  end;
end;

end.

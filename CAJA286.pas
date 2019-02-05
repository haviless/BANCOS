Unit CAJA286;
// Actualizaciones
// HPC_201310_CAJA 14/11/2013  Automatizacion de detracciones y autodetracciones pago manual
// HPC_201501_CAJA  29/05/2015

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, DBCtrls, wwdblook,
   wwdbdatetimepicker, Mask, wwdbedit, ExtCtrls, db;

Type
   TFPagoDetrac = Class(TForm)
      dbgDetalle: TwwDBGrid;
      Panel1: TPanel;
      Label1: TLabel;
      dtpFecha: TwwDBDateTimePicker;
      dblcTMoneda: TwwDBLookupCombo;
      lblTMon: TLabel;
      edtTMoneda: TEdit;
      Panel2: TPanel;
      wwDBGrid1IButton: TwwIButton;
      lblCia: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      bbtnBuscar: TBitBtn;
      Procedure wwDBGrid1IButtonClick(Sender: TObject);
      Procedure bbtnBuscarClick(Sender: TObject);
      Procedure dbgDetalleDblClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcTMonedaExit(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dbgDetalleKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
   Private
    { Private declarations }
      Procedure CargaDataSource;
   Public
    { Public declarations }
// Inicio HPC_201501_CAJA
    xgTipoAct : String;
// Fin HPC_201501_CAJA

   End;

Var
   FPagoDetrac: TFPagoDetrac;

Implementation

{$R *.dfm}

Uses CAJADM, CAJA287;

Procedure TFPagoDetrac.CargaDataSource;
Begin
   dblcCia.LookupTable := DMTE.cdsCia;
   dblcTMoneda.LookupTable := DMTE.cdsTMon;
   dbgDetalle.DataSource := DMTE.dsOPago;
End;

Procedure TFPagoDetrac.wwDBGrid1IButtonClick(Sender: TObject);
Begin
   Try
      DMTE.cdsOPago.Insert;
   // Inicio : HPC_201501_CAJA
      xgTipoAct := 'I';
   // Fin : HPC_201501_CAJA
      FPagoDetCab := TFPagoDetCab.Create(Application);
      FPagoDetCab.ShowModal;
   Finally
      FPagoDetCab.Free;
   End;
End;

Procedure TFPagoDetrac.bbtnBuscarClick(Sender: TObject);
Var
   xSQL: String;
Begin
// Inicio HPC_201310_CAJA
   xSQL := ' Select CIAID, NUMERO, FECHA, TMONID, MONTOT, MONPAG, OBSERVA, FECREG, USUARIO, ESTADO, '
         + '        FECACEPTA, USUACEPTA, FECPAGO, USUPAGO, BANCOID, CCBCOID, USUANULA, FECANU, USUCONTA, '
         + '        FECCONTA, NUMPLA, MODULO '
         + '   from CXP_ORD_PAG_CAB '
         + '  where CIAID LIKE ''' + dblcCia.text + '%'' and MODULO in (''CAJA'',''TLB'') ';
// Fin HPC_201310_CAJA

   If dtpFecha.date <> 0 Then
      xSQL := xSQL + ' and FECHA=''' + dtpFecha.Text + ''' ';

   If dblcTMoneda.Text <> '' Then
      xSQL := xSQL + ' and TMONID=''' + dblcTMoneda.Text + ''' ';

   xSQL := xSQL + ' order by CIAID, NUMERO desc';
   dbgDetalle.Selected.Clear;
   dbgDetalle.Selected.Add('CIAID'#9'3'#9'Cía'#9'F');
   dbgDetalle.Selected.Add('NUMERO'#9'7'#9'Orden~Pago'#9'F');
   dbgDetalle.Selected.Add('NUMPLA'#9'10'#9'No.~Operación'#9'F');
   dbgDetalle.Selected.Add('FECHA'#9'11'#9'Fecha'#9'F');
   dbgDetalle.Selected.Add('TMONID'#9'5'#9'Moneda'#9'F');
   dbgDetalle.Selected.Add('MONPAG'#9'10'#9'Importe~Total'#9'F');
   dbgDetalle.Selected.Add('ESTADO'#9'5'#9'Estado'#9'F');
   dbgDetalle.Selected.Add('USUARIO'#9'15'#9'Usuario'#9'F');
   dbgDetalle.Selected.Add('USUACEPTA'#9'15'#9'Usuario~Acepta'#9'F');
   dbgDetalle.Selected.Add('FECACEPTA'#9'11'#9'Fecha~Acepta'#9'F');
   dbgDetalle.Selected.Add('USUCONTA'#9'10'#9'Usuario~Contab'#9'F');
   dbgDetalle.Selected.Add('MODULO'#9'15'#9'Modulo'#9'F');

   DMTE.cdsOPago.Close;
   DMTE.cdsOPago.DataRequest(xSQL);
   DMTE.cdsOPago.Open;
End;

Procedure TFPagoDetrac.dbgDetalleDblClick(Sender: TObject);
Begin
   Try
      FPagoDetCab := TFPagoDetCab.Create(Application);
      FPagoDetCab.ShowModal;
   Finally
      FPagoDetCab.Free;
   End;
End;

Procedure TFPagoDetrac.FormActivate(Sender: TObject);
Begin

   CargaDataSource;
   dblcCia.Text := '02';
   dblcCiaExit(Self);

   DMTE.cdsBanco.Filtered := False;
   DMTE.cdsBanco.Filter := '';
   DMTE.cdsBanco.Filter := 'BCOTIPCTA=''B'' AND (FLAVIGCOB=''S'' OR FLAHISPRE=''S'')';
   DMTE.cdsBanco.Filtered := True;
   bbtnBuscarClick(Self);
End;

Procedure TFPagoDetrac.dblcCiaExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If trim(dblcCia.Text) = '' Then Exit;

   xWhere := 'CIAID=' + quotedstr(dblcCia.Text);
   edtCia.text := DMTE.DisplayDescripLocal(DMTE.cdsCia, 'CIAID', dblcCia.Text, 'CIADES');

   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Error en código de Compañía');
      dblcCia.SetFocus;
   End;
End;

Procedure TFPagoDetrac.dblcTMonedaExit(Sender: TObject);
Var
   xWhere: String;
Begin
{   if trim(dblcTMoneda.Text)='' then Exit;

   Screen.Cursor:=crHourGlass;
   xWhere:='TMONID='+''''+dblcTMoneda.Text+'''';
   edtTMoneda.Text:=BuscaQry('PrvTGE','TGE103','TMONDES, TMON_LOC',xWhere,'TMONDES');
   Screen.Cursor:=crDefault;

   if length(edtTMoneda.Text)=0 then
   begin
      ShowMessage('Error en Tipo de Moneda');
      dblcTMoneda.SetFocus;
   end;}
End;

Procedure TFPagoDetrac.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   DMTE.cdsMovCxP.IndexFieldNames := '';
   DMTE.cdsBanco.Filtered := False;
   DMTE.cdsBanco.Filter := ''
End;

Procedure TFPagoDetrac.dbgDetalleKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Begin
   If (Key = VK_DELETE) And (ssCtrl In Shift) Then //^Del
   Begin
      If (DMTE.cdsOPago.FieldByname('ESTADO').AsString = 'A') Or (DMTE.cdsOPago.FieldByname('ESTADO').AsString = 'P') Then
      Begin
         ShowMessage('No se puede Eliminar Orden de Pago');
         Exit;
      End;

      DMTE.cdsOPago.Delete;

      If DMTE.cdsOPago.ApplyUpdates(-1) > 0 Then
      Begin
         ShowMessage('Error al grabar 1');
         Exit;
      End;

      ShowMessage('Orden de Pago Eliminada');

   End;
End;

Procedure TFPagoDetrac.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFPagoDetrac.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

End.


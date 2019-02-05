Unit Caja276;
// HPC_201402_CAJA 02/07/2014  Modificación de Consulta que lista al momento de asignar cajeros
//                             Visualizar cajeros que aperturaron en el día.
//                             reindentación de sangría del formulario

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Buttons, Mask, wwdbedit, wwdblook, Wwdbdlg, ExtCtrls;

Type
   TFSelecCajero = Class(TForm)
      pnlDet: TPanel;
      Label2: TLabel;
      dblcdCajero: TwwDBLookupComboDlg;
      dbeUsuNom: TwwDBEdit;
      BitBtn1: TBitBtn;
      Procedure FormActivate(Sender: TObject);
      Procedure dblcdCajeroExit(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
   Private
    { Private declarations }
   Public
    { Public declarations }
   End;

Var
   FSelecCajero: TFSelecCajero;

Implementation

{$R *.dfm}

Uses CAJADM;

Procedure TFSelecCajero.FormActivate(Sender: TObject);
Var
   cSQL: String;
Begin
// Inicio HPC_201402_CAJA
   cSQL := 'select A.USUARIO, B.USERNOM '
         + '  from CAJ_USU_ORD_PAG A, TGE006 B, CAJ_CON_APE_CIE C '
         + ' where A.NIVEL=''05'' '
         + '   and A.USUARIO=B.USERID '
         + '   and A.USUARIO = C.USUARIO '
         + '   and C.FECTRANS = TO_DATE(SYSDATE) '
         + '   and C.OFDESID =''01'' ';
   DMTE.cdsQry4.Close;
   DMTE.cdsQry4.DataRequest(cSQL);
   DMTE.cdsQry4.Open;
   DMTE.cdsQry4.IndexFieldNames := 'USUARIO';
   pnlDet.Enabled := True;
   If dblcdCajero.Text <> '' Then
   Begin
      cSQL := 'Select USUARIO, USERNOM '
            + '  from CAJ_USU_ORD_PAG A, TGE006 B '
            + ' where NIVEL=''05'' '
            + '   and A.USUARIO=B.USERID '
            + '   and USUARIO='+quotedstr(dblcdCajero.Text);
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest(cSQL);
      DMTE.cdsQry.Open;
      dbeUsuNom.Text := DMTE.cdsQry.FieldByname('USERNOM').AsString;

      cSQL := 'Select * '
            + '  from CAJ_ORD_PAG_DET '
            + ' where CIAID='+quotedstr(DMTE.cdsPagoCxP.FieldByname('CIAID').AsString)
            + '   and NUMERO='+quotedstr(DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString)
            + '   and USUPAGO='+quotedstr(dblcdCajero.Text);
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest(cSQL);
      DMTE.cdsQry.Open;
      If DMTE.cdsQry.RecordCount > 0 Then
      Begin
         pnlDet.Enabled := False;
         ShowMessage('Cajero(a) ya registro Pagos. No se puede cambiar.');
      End;
   End;
// Fin HPC_201402_CAJA
End;

Procedure TFSelecCajero.dblcdCajeroExit(Sender: TObject);
Var
   cSQL: String;
Begin
// Inicio HPC_201402_CAJA
   {
   cSQL := 'Select USUARIO, USERNOM '
         + '  from CAJ_USU_ORD_PAG A, TGE006 B '
         + ' where NIVEL=''05'' '
         + '   and A.USUARIO=B.USERID '
         + '   and USUARIO='+quotedstr(dblcdCajero.Text);
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(cSQL);
   DMTE.cdsQry.Open;

   If DMTE.cdsQry.RecordCount > 0 Then
      dbeUsuNom.Text := DMTE.cdsQry.FieldByname('USERNOM').AsString;
   }
   DMTE.cdsQry4.Setkey;
   DMTE.cdsQry4.FieldByName('USUARIO').AsString := dblcdCajero.Text;
   if not DMTE.cdsQry4.gotokey then
   begin
      ShowMessage('Cajero no está en la lista de disponibles');
      dblcdCajero.SetFocus;
      exit;
   end;
   dbeUsuNom.Text := DMTE.cdsQry4.FieldByname('USERNOM').AsString;
// Fin HPC_201402_CAJA

End;

Procedure TFSelecCajero.BitBtn1Click(Sender: TObject);
Begin
   If dbeUsuNom.Text = '' Then
   Begin
      ShowMessage('Falta Seleccionar Cajero(a)');
      DMTE.cdsPagoCxP.FieldByname('USUASIGNA').AsString := '';
      Exit;
   End;

   DMTE.cdsPagoCxP.ApplyUpdates(0);
   Close;
End;

procedure TFSelecCajero.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// Inicio HPC_201402_CAJA
   DMTE.cdsQry4.IndexFieldNames := '';
   DMTE.cdsQry4.Close;
   DMTE.cdsQry.Close;
// Fin HPC_201402_CAJA
end;

procedure TFSelecCajero.FormKeyPress(Sender: TObject; var Key: Char);
begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
end;

End.


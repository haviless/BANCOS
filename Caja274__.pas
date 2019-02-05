unit Caja274;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, wwdbedit, wwdblook, Wwdbdlg, ExtCtrls, DB;

type
  TFPromotorEdit = class(TForm)
    dbeMonto: TwwDBEdit;
    Z1sbPeriodo: TBitBtn;
    Z2bbtnCanc2: TBitBtn;
    Label3: TLabel;
    pnlDet: TPanel;
    dblcdAux: TwwDBLookupComboDlg;
    dbeNombre: TwwDBEdit;
    Label2: TLabel;
    Label1: TLabel;
    Label23: TLabel;
    dblcClase: TwwDBLookupCombo;
    edtClase: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure Z1sbPeriodoClick(Sender: TObject);
    procedure dblcdAuxExit(Sender: TObject);
    procedure Z2bbtnCanc2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcClaseNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcClaseExit(Sender: TObject);
    procedure dblcdAuxEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPromotorEdit: TFPromotorEdit;

implementation

{$R *.dfm}

USES CAJADM;

procedure TFPromotorEdit.FormActivate(Sender: TObject);
begin
   dblcClase.Enabled:=True;
   if DMTE.cdsPagoCxP.FieldByName('CPTOID').AsString='EG0173' then
   begin
      DMTE.cdsProvCta.FieldByname('CLAUXID').AsString:='RE';
      dblcClase.Enabled:=False;
   end;

   dblcdAux.Selected.Clear;
   dblcdAux.Selected.Add('AUXID'#9'10'#9'Auxiliar'#9'F');
   dblcdAux.Selected.Add('AUXNOMB'#9'40'#9'Nombre Auxiliar'#9'F');
   dblcdAux.Selected.Add('AUXDNI'#9'15'#9'D.N.I'#9'F');
end;

procedure TFPromotorEdit.Z1sbPeriodoClick(Sender: TObject);
begin

   if DMTE.cdsProvCta.FieldByname('AUXID').AsString='' then
   begin
      ShowMessage('Debe ingresar el Código');
      Exit;
   end;

   if DMTE.cdsProvCta.FieldByname('AUXOBS').AsString='' then
   begin
      ShowMessage('Debe ingresar el Nombre');
      Exit;
   end;

   if DMTE.cdsProvCta.FieldByname('MONTO').AsFloat<=0 then
   begin
      ShowMessage('Debe ingresar el Monto');
      Exit;
   end;

   DMTE.cdsProvCta.Edit;
   DMTE.cdsProvCta.FieldByname('CIAID').AsString  :=DMTE.cdsPagoCxP.FieldByname('CIAID').AsString;
   DMTE.cdsProvCta.FieldByname('NUMERO').AsString :=DMTE.cdsPagoCxP.FieldByname('NUMERO').AsString;
   DMTE.cdsProvCta.FieldByname('FREG').AsDateTime :=Date + SysUtils.Time;
   DMTE.cdsProvCta.FieldByname('HREG').AsDateTime :=Date + SysUtils.Time;
   DMTE.cdsProvCta.FieldByname('USUARIO').AsString:=DMTE.wUsuario;
   DMTE.cdsProvCta.Post;
   Close;
end;

procedure TFPromotorEdit.dblcdAuxExit(Sender: TObject);
var
  cAux  : String;
  cItem : String;
begin
   DMTE.cdsProvCta.FieldByname('AUXOBS').AsString:= DMTE.DisplayDescripLocal(DMTE.cdsAux,'AUXID',dblcdAux.Text,'AUXNOMB') ;
   cAux :=DMTE.cdsProvCta.FieldByname('AUXOBS').AsString;
   cItem:=DMTE.cdsProvCta.FieldByname('ITEM').AsString;

   DMTE.cdsProvCta.First;
   while not DMTE.cdsProvCta.Eof do
   begin
      if cItem=DMTE.cdsProvCta.FieldByname('ITEM').AsString then
         Exit;

      if DMTE.cdsProvCta.FieldByname('AUXOBS').AsString=cAux then
      begin
         DMTE.cdsProvCta.Last;
         DMTE.cdsProvCta.Edit;
         DMTE.cdsProvCta.FieldByname('AUXID').AsString :='';
         DMTE.cdsProvCta.FieldByname('AUXOBS').AsString:='';
         DMTE.cdsProvCta.Post;
         dblcdAux.SetFocus;
         ShowMessage('Error. El Código ya fue Registrado. Revisar...');
         Exit;
      end;
      DMTE.cdsProvCta.Next;
   end;
end;

procedure TFPromotorEdit.Z2bbtnCanc2Click(Sender: TObject);
begin
   Close;
end;

procedure TFPromotorEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if ( DMTE.cdsProvCta.FieldByname('AUXID').AsString='' ) or
      ( DMTE.cdsProvCta.FieldByname('AUXOBS').AsString='' ) or
      ( DMTE.cdsProvCta.FieldByname('MONTO').AsString='' ) then
      DMTE.cdsProvCta.Delete;

end;

procedure TFPromotorEdit.dblcClaseNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFPromotorEdit.dblcClaseExit(Sender: TObject);
var
   xSQLx : string ;
begin
   edtClase.text:= DMTE.DisplayDescripLocal(DMTE.cdsClaseAux,'CLAUXID',dblcClase.Text,'CLAUXDES') ;

   if DMTE.cdsPagoCxP.FieldByName('CPTOID').AsString='EG0173' then
   begin
      xSQLx:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+'''';
   end
   else
   begin
      xSQLx:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+'''';
   end;
   DMTE.cdsAux.Close;
   DMTE.cdsAux.DataRequest( xSQLx ) ;
   DMTE.cdsAux.Open;

   dblcdAux.Selected.Clear;
   dblcdAux.Selected.Add('AUXID'#9'10'#9'Auxiliar'#9'F');
   dblcdAux.Selected.Add('AUXRUC'#9'15'#9'R.U.C'#9'F');
   dblcdAux.Selected.Add('AUXNOMB'#9'40'#9'Nombre Auxiliar'#9'F');
end;

procedure TFPromotorEdit.dblcdAuxEnter(Sender: TObject);
begin
   if dblcClase.Text='' then
      dblcdAux.SetFocus;
end;

end.

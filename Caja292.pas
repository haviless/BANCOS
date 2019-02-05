unit Caja292;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFAnulaRecibo = class(TForm)
    mObs: TMemo;
    Z2bbtnAnula: TBitBtn;
    Z2bbtnSalir: TBitBtn;
    Label1: TLabel;
    procedure Z2bbtnAnulaClick(Sender: TObject);
    procedure Z2bbtnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAnulaRecibo: TFAnulaRecibo;

implementation

{$R *.dfm}

USES CAJA206;

procedure TFAnulaRecibo.Z2bbtnAnulaClick(Sender: TObject);
var
   i : integer;
   xCadenaPermitida : String;
begin
// Inicio: HPC_201309_CAJA
   xCadenaPermitida:='ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz01234567890 -_áéíóúÁÉÍÓÚü';
   mObs.Text := trim(mObs.Text);
  For i:=1 to length(mObs.Text) do
  begin
     if pos(copy(mObs.Text,i,1),xCadenaPermitida) = 0 then
     begin
         mObs.SetFocus;
         ShowMessage('Sólo se permiten Letras y Números');
         Exit;
     end;
  end;
// Fin: HPC_201309_CAJA

  if Length(mObs.Text)<5 then
  begin
     ShowMessage('Motivo debe tener minimo 5 caracteres');
     Exit;
  end;

  if MessageDlg('Anular Recibo. ¿ Esta Seguro?',mtConfirmation,
               [mbYes, mbNo], 0)=mrYes then
  begin
    fAnula:=True;
    Close;
  end;
end;

procedure TFAnulaRecibo.Z2bbtnSalirClick(Sender: TObject);
begin
  Close;
end;

end.

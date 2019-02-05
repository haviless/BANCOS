unit Caja275;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, wwdbedit, Buttons, ExtCtrls;

type
  TFVoucher = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Z1sbPeriodo: TBitBtn;
    Z2bbtnCanc2: TBitBtn;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    wwDBEdit3: TwwDBEdit;
    wwDBEdit4: TwwDBEdit;
    procedure Z1sbPeriodoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVoucher: TFVoucher;

implementation

{$R *.dfm}

uses CAJADM;

procedure TFVoucher.Z1sbPeriodoClick(Sender: TObject);
begin
   DMTE.cdsProvCta.Edit;
   if DMTE.cdsProvCta.FieldByname('VOUCHER').AsString='' then
   begin
     DMTE.cdsProvCta.FieldByname('MONPAG').AsFloat    :=0;
     DMTE.cdsProvCta.FieldByname('FECPAGO').AsDateTime:=Date + SysUtils.Time;
     DMTE.cdsProvCta.FieldByname('USUPAGO').AsString  :=DMTE.wUsuario;
     DMTE.cdsProvCta.FieldByname('ESTADO').AsString   :='';
   end
   else
   begin
     DMTE.cdsProvCta.FieldByname('MONPAG').AsString   :=DMTE.cdsProvCta.FieldByname('MONTO').AsString;
     DMTE.cdsProvCta.FieldByname('FECPAGO').AsDateTime:=Date + SysUtils.Time;
     DMTE.cdsProvCta.FieldByname('USUPAGO').AsString  :=DMTE.wUsuario;
     DMTE.cdsProvCta.FieldByname('ESTADO').AsString   :='S';
   end;
   DMTE.cdsProvCta.Post;
   if DMTE.cdsProvCta.ApplyUpdates( 0 )>0 then
   begin
      ShowMessage('Error al grabar en el detalle. Intente nuevamente');
      DMTE.cdsProvCta.Close;
      DMTE.cdsProvCta.Open;
   end;
   Close;
end;

end.

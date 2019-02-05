unit CAJA206B;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Wwkeycb, Grids, Wwdbigrd, Wwdbgrid,CAJADM;

type
  TfBusCli = class(TForm)
    dbgCliente: TwwDBGrid;
    searchCliente: TwwIncrementalSearch;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBusCli: TfBusCli;

implementation
//Uses CAJAUTIL, Caja224, ppviewr, Caja290, oaTE2000, CAJA712, CAJA292, CAJA710, CLIE002;

{$R *.dfm}

procedure TfBusCli.FormCreate(Sender: TObject);
begin

  dbgCliente.Selected.Clear;
  dbgCliente.Selected.Add('AUXID'#9'12'#9'Código'#9'T');
  dbgCliente.Selected.Add('AUXNOMB'#9'30'#9'Nombres'#9'T');
  dbgCliente.Selected.Add('AUXDNI'#9'09'#9'DNI'#9'T');
  dbgCliente.Selected.Add('AUXRUC'#9'11'#9'RUC'#9'T');
  dbgCliente.DataSource   :=DMTE.dsAux;
  searchCliente.DataSource:=DMTE.dsAux;
  searchCliente.Text:='';
  DMTE.cdsAux.IndexFieldNames := 'AUXNOMB';
  searchCliente.SearchField :='AUXNOMB';
end;

procedure TfBusCli.BitBtn1Click(Sender: TObject);
begin
  DMTE.EjecutaPrograma2('MaestroClientesPk00.bpl','fg_ListarClientes');
end;

procedure TfBusCli.BitBtn3Click(Sender: TObject);
begin
 DMTE.cdsAux.Locate('AUXID', VarArrayOf([Trim(searchCliente.Text)]), []);
 Close;
end;

procedure TfBusCli.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.

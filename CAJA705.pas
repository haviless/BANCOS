unit Caja705;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TFToolConciliacion = class(TForm)
    pnl: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolConciliacion: TFToolConciliacion;

implementation

uses CajaDM, Caja222, Caja223, Caja221;

{$R *.DFM}

procedure TFToolConciliacion.BitBtn1Click(Sender: TObject);
var
  sSQL :string;
begin
//   SacaMenu;

   sSQL:='Select * from PLAN04 where ARCHIVO=''CAJA302'' AND ( '
        +  DMTE.wReplacCeros+'(FLAG,'''')<>''S'')'
        + 'and ('+DMTE.wReplacCeros+'(DESCRIPCION,'''')<>'''' AND '
        + '(CAMPO<> ''CIAID'' AND CAMPO<>''BANCOID'') )';
   DMTE.cdsQry3.close;
   DMTE.cdsQry3.DataRequest(sSQL);
   DMTE.cdsQry3.Open;

   sSQL := 'SELECT * FROM TGE105 WHERE (BCOTIPCTA=''B'') ORDER BY BANCOID';
   DMTE.cdsBanco.Close;
   DMTE.cdsBanco.DataRequest(sSQL);
   DMTE.cdsBanco.Open;

   FMntBco:=TFMntBco.Create(Self);
   With FMntBco Do
   Try
      ShowModal;
   Finally
      Free;
   End;

end;

procedure TFToolConciliacion.BitBtn2Click(Sender: TObject);
begin
   FTrans:=TFTrans.Create(Self);
   With FTrans Do
   Try
      ShowModal;
   Finally
      Free;
   End;

end;

procedure TFToolConciliacion.BitBtn3Click(Sender: TObject);
begin
   DMTE.cdsSaldoTlfnGrab.Open;
   DMTE.cdsResponsable.Open;
   DMTE.cdsCia.Open;
   //**
   FConBank :=TFConBank.Create(Self);
   With FConBank Do
   Try
      ShowModal;
   Finally
      Free;
   End;

end;

procedure TFToolConciliacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;

end;

end.

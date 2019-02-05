unit Caja278;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, Mask,
  wwdbedit;

type
  TFPromotorBusca = class(TForm)
    dbgCab: TwwDBGrid;
    dbgDet: TwwDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dbeCpto: TwwDBEdit;
    dbeObserva: TwwDBEdit;
    wwDBEdit1: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure dbgCabRowChanged(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgCabDblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cNumero : String;
  end;

var
  FPromotorBusca: TFPromotorBusca;

implementation

{$R *.dfm}

USES CAJADM;

procedure TFPromotorBusca.FormActivate(Sender: TObject);
var
  xSQL : String;
begin
  xSQL:='SELECT * FROM CAJ_ORD_PAG_CAB ORDER BY NUMERO DESC';
  DMTE.cdsQry6.Close;
  DMTE.cdsQry6.DataRequest( xSQL );
  DMTE.cdsQry6.Open;

  xSQL:='SELECT * FROM CAJ_ORD_PAG_DET '
       +'WHERE NUMERO='''+DMTE.cdsQry6.FieldByname('NUMERO').AsString+''' '
       +'ORDER BY NUMERO, ITEM';
  DMTE.cdsQry7.Close;
  DMTE.cdsQry7.DataRequest( xSQL );
  DMTE.cdsQry7.Open;
end;

procedure TFPromotorBusca.dbgCabRowChanged(Sender: TObject);
var
  xSQL : String;
begin
  xSQL:='SELECT * FROM CAJ_ORD_PAG_DET '
       +'WHERE NUMERO='''+DMTE.cdsQry6.FieldByname('NUMERO').AsString+''' '
       +'ORDER BY NUMERO, ITEM';
  DMTE.cdsQry7.Close;
  DMTE.cdsQry7.DataRequest( xSQL );
  DMTE.cdsQry7.Open;
end;

procedure TFPromotorBusca.BitBtn1Click(Sender: TObject);
begin
   cNumero:=DMTE.cdsQry6.FieldByname('NUMERO').AsString;
   Close;
end;

procedure TFPromotorBusca.dbgCabDblClick(Sender: TObject);
begin
   cNumero:=DMTE.cdsQry6.FieldByname('NUMERO').AsString;
   Close;
end;

procedure TFPromotorBusca.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

end.

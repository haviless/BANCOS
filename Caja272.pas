unit Caja272;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ppEndUsr, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, StdCtrls, Buttons, wwdbdatetimepicker;

type
  TFToolOP = class(TForm)
    pnl: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    dtpDesde: TwwDBDateTimePicker;
    Label4: TLabel;
    dtpHasta: TwwDBDateTimePicker;
    bbtnRepVisado: TBitBtn;
    ppr1: TppReport;
    ppdb1: TppDBPipeline;
    ppd1: TppDesigner;
    procedure bbtnRepVisadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolOP: TFToolOP;

implementation

{$R *.dfm}

uses CAJADM;

procedure TFToolOP.bbtnRepVisadoClick(Sender: TObject);
var
   cSQL, cCia : String;
begin
   cCia:='02';
   cSQL:='select A.CIAID, '' '' NUMERO, B.AUXID, AUXOBS, SUM(B.MONTO) MONTO, SUM(B.MONPAG) MONPAG, C.AUXDNI, '
        +  ''' Desde '+dtpDesde.Text+' al '+dtpHasta.Text+''' RANGO, '' '' ITEM '
        +'From CAJ_ORD_PAG_CAB A, CAJ_ORD_PAG_DET B, CNT201 C '
        +'where A.CIAID=''' +cCia+''' '
        +  'AND A.FECHA>='''+dtpDesde.Text+''' and A.FECHA<='''+dtpHasta.Text+''' '
        + ' AND A.CIAID=B.CIAID AND A.NUMERO=B.NUMERO '
        + ' AND C.CLAUXID=''E'' AND B.AUXID=C.AUXID '
        +'Group by A.CIAID, B.AUXID, AUXOBS, C.AUXDNI '
        +'Order by B.AUXID';
   DMTE.cdsQry5.Close;
   DMTE.cdsQry5.DataRequest( cSQL );
   DMTE.cdsQry5.Open;
   DMTE.cdsQry5.Last;

   ppdb1.DataSource:=DMTE.dsQry5;
	 ppr1.TEMPLATE.FileName := wRutaRpt + '\PromotoresResumen.rtm';
	 ppr1.template.LoadFromFile ;
	 ppr1.Print;
   //ppd1.ShowModal;
   ppdb1.DataSource:=nil;
end;

end.

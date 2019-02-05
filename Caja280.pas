unit Caja280;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Wwdbigrd, Grids, Wwdbgrid, StdCtrls, wwdblook,
  wwdbdatetimepicker, ExtCtrls, StrContainer, DB, DBClient, wwclient;

type
  TFTarjetaCredito = class(TForm)
    Panel1: TPanel;
    bbtnBuscar: TBitBtn;
    dbgDetalle: TwwDBGrid;
    wwDBGrid1IButton: TwwIButton;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    sdGraba: TSaveDialog;
    scData: TStrContainer;
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgDetalleTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure wwDBGrid1IButtonClick(Sender: TObject);
    procedure bbtnBuscarClick(Sender: TObject);
    procedure dbgDetalleDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTarjetaCredito: TFTarjetaCredito;

implementation

{$R *.dfm}

USES CAJADM, CAJA282, CAJA284;

procedure TFTarjetaCredito.BitBtn1Click(Sender: TObject);
begin
   try
     FTarjetaImportar := TFTarjetaImportar.Create(SELF);
     FTarjetaImportar.ShowModal;
   finally
     FTarjetaImportar.Free;
   end;
end;




procedure TFTarjetaCredito.dbgDetalleTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   dbgDetalle.SetActiveField( AFieldName );
   DMTE.cdsTarCreTransf.IndexFieldNames:=AFieldName;

end;

procedure TFTarjetaCredito.wwDBGrid1IButtonClick(Sender: TObject);
var
  xSQL : String;
begin
   try
     xSQL:='Select * from CAJ_TAR_CRE_DET '
          +'where CIAID=''XX'' and TDIARID=''YY'' and ECANOMM=''AAAAMM'' and ECNOCOMP=''NNNNNNNNNN''';
     DMTE.cdsTarCreTransf.Close;
     DMTE.cdsTarCreTransf.DataRequest( xSQL );
     DMTE.cdsTarCreTransf.Open;

     DMTE.wModo := 'A';
     FContabTarCre:=TFContabTarCre.Create(Self);
     FContabTarCre.ShowModal;
   finally
     FContabTarCre:=tFContabTarCre.Create(Self);
   end;
end;

procedure TFTarjetaCredito.bbtnBuscarClick(Sender: TObject);
var
  xSQL : String;
begin
  xSQL:='Select * from CAJ_TAR_CRE_CNT where CIAID LIKE '''+dblcCia.Text+'%''';
  DMTE.cdsCreCNT.Close;
  DMTE.cdsCreCNT.DataRequest( xSQL );
  DMTE.cdsCreCNT.Open;
end;

procedure TFTarjetaCredito.dbgDetalleDblClick(Sender: TObject);
var
  xSQL : String;
begin
   xSQL:='Select * from CAJ_TAR_CRE_DET '
        +'where CIAID   ='''+DMTE.cdsCreCNT.FieldByName('CIAID').AsString   +''' '
        +  'and TDIARID ='''+DMTE.cdsCreCNT.FieldByName('TDIARID').AsString +''' '
        +  'and ECANOMM ='''+DMTE.cdsCreCNT.FieldByName('ECANOMM').AsString +''' '
        +  'and ECNOCOMP='''+DMTE.cdsCreCNT.FieldByName('ECNOCOMP').AsString+'''';
   DMTE.cdsTarCreTransf.Close;
   DMTE.cdsTarCreTransf.DataRequest( xSQL );
   DMTE.cdsTarCreTransf.Open;
   try
     DMTE.wModo := 'M';
     FContabTarCre:=TFContabTarCre.Create(Self);
     FContabTarCre.ShowModal;
   finally
     FContabTarCre:=tFContabTarCre.Create(Self);
   end;
end;

procedure TFTarjetaCredito.FormActivate(Sender: TObject);
begin
   bbtnBuscarClick(Self);
end;




end.

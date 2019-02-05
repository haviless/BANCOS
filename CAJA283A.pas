unit CAJA283A;
//------------------------------------------------------------------------------------
// Unidad                   : CAJA283A
// Formulario               : FSelDocPagoServicio
// Fecha de Creación        : 09/05/2017
// Autor                    : Equipo de Desarrollo.
// Objetivo                 : Solicitud documento de servicio
// Fecha de Actualización   : 09/05/2017
//------------------------------------------------------------------------------------
// HPC_201702_CAJA  09/05/2017 Se creo el formulario CAJA283A para soportar la nueva opcion
//                             para importar y contabilizar transacciones por Pago de Servicios.
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Spin;

type
  TFSelDocPagoServicio = class(TForm)
    dbgListDocPagoServicio: TwwDBGrid;
    btnAceptarDocPagoServicio: TButton;
    btnCancelarDocPagoServicio: TButton;
    Label2: TLabel;
    seAno: TSpinEdit;
    seMes: TSpinEdit;
    btnFiltrar: TButton;
    procedure btnCancelarDocPagoServicioClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnAceptarDocPagoServicioClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure ListarDocumentos();
  private
    { Private declarations }

  public
    { Public declarations }
    sCiaId : String;
  end;

var
  FSelDocPagoServicio: TFSelDocPagoServicio;

implementation

uses CajaDM;

{$R *.dfm}

procedure TFSelDocPagoServicio.btnCancelarDocPagoServicioClick(Sender: TObject);
begin
   close;
end;

procedure TFSelDocPagoServicio.FormActivate(Sender: TObject);
var
   xSQL: String;
begin
   seMes.Value:=StrToInt(Copy(DMTE.cdsTarCreTransf.FieldByName('FECHA').AsString,4,2));
   seAno.Value:=StrToInt(Copy(DMTE.cdsTarCreTransf.FieldByName('FECHA').AsString,7,4));

   dbgListDocPagoServicio.Selected.Clear;
   dbgListDocPagoServicio.Selected.Add('PROV'#9'9'#9'Proveedor'#9'F');
   dbgListDocPagoServicio.Selected.Add('PROVDES'#9'35'#9'Razón Social'#9'F');
   dbgListDocPagoServicio.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
   dbgListDocPagoServicio.Selected.Add('CPNODOC'#9'11'#9'Número'#9'F');
   dbgListDocPagoServicio.Selected.Add('TMONID'#9'7'#9'Tipo~Moneda'#9'F');
   dbgListDocPagoServicio.Selected.Add('CPMTOORI'#9'11'#9'Monto'#9'F');
   dbgListDocPagoServicio.Selected.Add('CPFEMIS'#9'10'#9'Fecha~Emisión'#9'F');
   dbgListDocPagoServicio.Selected.Add('CPFVCMTO'#9'10'#9'Fecha~Vencimiento'#9'F');
   dbgListDocPagoServicio.Selected.Add('CTATOTAL'#9'11'#9'Cuenta'#9'F');

   ListarDocumentos();
   
end;

procedure TFSelDocPagoServicio.btnAceptarDocPagoServicioClick(
  Sender: TObject);
begin
   if length(DMTE.cdsTarCreTransf.FieldByName('ECNOCOMP').AsString) > 0 then
   begin
      ShowMessage('Este registro ya fue contabilizado. No puede marcarlo nuevamente');
      Exit;
   end;

   if DMTE.cdsTarCreTransf.FieldByName('cargo').AsFloat<>DMTE.cdsQry6.FieldByName('CPMTOORI').Asfloat then
   begin
      ShowMessage('Los importes son diferentes. Revisar el pago...');
      Exit;
   end;

   DMTE.cdsTarCreTransf.Edit;
   DMTE.cdsTarCreTransf.FieldByName('CIAID').AsString :=sCiaId;
   DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString:=DMTE.wUsuario;

   DMTE.cdsTarCreTransf.FieldByName('DOCID').AsString :='14';
   DMTE.cdsTarCreTransf.FieldByName('CPSERIE').AsString :=DMTE.cdsQry6.FieldByName('CPSERIE').AsString;
   DMTE.cdsTarCreTransf.FieldByName('CPNODOC').AsString:=DMTE.cdsQry6.FieldByName('CPNODOC').AsString;
   DMTE.cdsTarCreTransf.FieldByName('CTATOTAL').AsString:=DMTE.cdsQry6.FieldByName('CTATOTAL').AsString;

   DMTE.cdsTarCreTransf.Post;
   DMTE.cdsTarCreTransf.ApplyUpdates(0);

   close;
end;

procedure TFSelDocPagoServicio.btnFiltrarClick(
  Sender: TObject);
begin
   ListarDocumentos();
end;

procedure TFSelDocPagoServicio.ListarDocumentos();
var
   sMes, sAno, xSQL :String;
begin
   sMes:=DMTE.StrZero(IntToStr(seMes.value),2);
   sAno := seAno.Text;

   xSQL := ' select c.prov, c.provdes, c.cpserie, c.cpnodoc, c.tmonid, c.cpmtoori, c.cpfemis, c.cpfvcmto, c.ctatotal '
           + ' from cxp301 c '
           + ' where c.docid = ' + QuotedStr('14')
           + ' and   c.cpanomes = ' + QuotedStr(sAno + sMes)
           + ' and   c.cpestado = ' + QuotedStr('P')
           + ' and   not exists '
           + ' ( select 1 from caj_tar_cre_det d where d.numero = ' + QuotedStr(DMTE.cdsCabTranf.FieldByname('NUMERO').AsString)
           + '   and d.docid =  c.docid '
           + '   and d.cpserie =  c.cpserie '
           + '   and d.cpnodoc =  c.cpnodoc ) '
           + '   and c.cpmtoori = '+ DMTE.cdsTarCreTransf.FieldByname('CARGO').AsString+ ' '
           + ' order by c.provdes, c.cpserie, c.cpnodoc ';

   dbgListDocPagoServicio.Datasource := DMTE.dsQry6;
   DMTE.cdsQry6.Close;
   DMTE.cdsQry6.DataRequest( xSQL );
   DMTE.cdsQry6.Open;
end;


end.

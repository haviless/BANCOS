unit CAJA712;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Buttons, Mant, Db, Wwdatsrc, DBClient, wwclient, ppDB,
  ppDBPipe, ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls, fcButton,
  fcImgBtn, fcShapeBtn, oaVariables;

type
  TFToolAportes = class(TForm)
    pnlBot: TPanel;
    bbtnReclamos: TBitBtn;
    bbtnAceptar: TfcShapeBtn;
    edtAsociado: TEdit;
    lblApeMat: TLabel;
    Timer1: TTimer;
    procedure bbtnAceptarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    grid : TwwDBGrid;
  public
    { Public declarations }
    mTX2, MTX1 : TMant;
  	procedure OnNoDelete (Sender : TObject; MantFields: TFields);
  end;

var
  FToolAportes: TFToolAportes;
   xAccesoBotones : Boolean;

implementation

uses oaTE2000, CAJADM, CAJA206;

{$R *.DFM}

procedure TFToolAportes.OnNoDelete(Sender: TObject; MantFields: TFields);
begin
	ShowMessage(' No se Puede Eliminar este Registro ');
end;

procedure TFToolAportes.bbtnAceptarClick(Sender: TObject);
var
   xSQL: String;
begin
   if length(Trim(edtAsociado.Text))=0 Then
      edtAsociado.Text:= FIngresoCaja.MtxAsocia.FMant.cds2.FieldbyName('ASOAPENOMDNI').AsString;
   xSQL:='SELECT * FROM APO201 '
        +'WHERE ASOAPENOMDNI LIKE '+QuotedStr(Trim(edtAsociado.Text+'%'));
        // vhndema
        //+'WHERE ASOAPENOM LIKE '+QuotedStr(Trim(edtAsociado.Text+'%'));
        // end vhndema
   Screen.Cursor:=crHourGlass;

   FIngresoCaja.MtxAsocia.UsuarioSQL.Clear;
   FIngresoCaja.MtxAsocia.FMant.wTabla:='APO201';
   FIngresoCaja.MtxAsocia.UsuarioSQL.Add(xSQL);
   FIngresoCaja.MtxAsocia.NewQuery;
   Screen.Cursor:=crDefault;
end;

procedure TFToolAportes.Timer1Timer(Sender: TObject);
begin
   FVariables.w_NombreForma := 'FToolAportes';
   if (DMTE.wAdmin='G') or (DMTE.wAdmin='P') then Exit;
   if not xAccesoBotones then
   begin
      DMTE.AccesosUsuariosR( DMTE.wModulo,DMTE.wUsuario,'2',FToolAportes);
      xAccesoBotones := True;
   end;
   Timer1.Destroy;
end;

end.

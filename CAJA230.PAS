unit Caja230;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Db, Wwdatsrc, DBClient,
  wwclient, Mask, DBCtrls, wwdblook, Wwdbdlg, wwdbedit, Buttons;

type
  TFEmpRendCuentas = class(TForm)
    GroupBox1: TGroupBox;
    wwDBGrid1: TwwDBGrid;
    Bevel1: TBevel;
    cdsEmpResp: TwwClientDataSet;
    cdsEmpRespUSERID: TStringField;
    cdsEmpRespAUXID: TStringField;
    cdsEmpRespCLAUXID: TStringField;
    cdsEmpRespAUXNOMB: TStringField;
    cdsEmpRespCLAUXDES: TStringField;
    cdsEmpRespEdit: TwwClientDataSet;
    dsEmpResp: TwwDataSource;
    dsEmpRespEdit: TwwDataSource;
    cdsEmpRespEditUSERID: TStringField;
    cdsEmpRespEditAUXID: TStringField;
    cdsEmpRespEditCLAUXID: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    lblProvRuc: TLabel;
    lblProvDes: TLabel;
    Label23: TLabel;
    edtAuxRuc: TwwDBEdit;
    dbeAbreviatura: TwwDBEdit;
    dblcdAux: TwwDBLookupComboDlg;
    dblcClase: TwwDBLookupCombo;
    Label2: TLabel;
    Bevel2: TBevel;
    Label4: TLabel;
    dbeNombre: TwwDBEdit;
    cdsEmpRespAUXABR: TStringField;
    cdsEmpRespAUXRUC: TStringField;
    cdsEmpRespqryEmpRespEdit: TDataSetField;
    edtClase: TwwDBEdit;
    z2bbtnNuevo: TBitBtn;
    z2bbtnGraba: TBitBtn;
    z2bbtnCancel2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure dblcClaseExit(Sender: TObject);
    procedure dblcdAuxEnter(Sender: TObject);
    procedure dblcdAuxExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure z2bbtnNuevoClick(Sender: TObject);
  private
    { Private declarations }
    strTmp : String ;
  public
    { Public declarations }
  end;

var
  FEmpRendCuentas: TFEmpRendCuentas;

implementation

uses CajaDM;

{$R *.DFM}

procedure TFEmpRendCuentas.dblcClaseExit(Sender: TObject);
begin
    edtClase.text:= DM1.DisplayDescripLocal(DM1.cdsClaseAux,'CLAUXID',dblcClase.Text,'CLAUXDES') ;

    if (dblcClase.Text <> strTmp) and (trim(edtClase.text) <> '') then
    begin
       dblcdAux.Text := '' ;
       edtAuxRUC.Text := '' ;
       dbeabreviatura.Text := '' ;
    end ;
end;

procedure TFEmpRendCuentas.dblcdAuxEnter(Sender: TObject);
begin
    if trim(dblcClase.Text) = '' then
    begin
       dblcClase.SetFocus ;
       exit ;
    end ;
end;

procedure TFEmpRendCuentas.dblcdAuxExit(Sender: TObject);
begin
   if dblcClase.Focused then Exit ;

   edtAuxRuc.Text:= DM1.DisplayDescripLocal(DM1.cdsAux,'AUXID',dblcdAux.Text,'AUXRUC') ;

   if (dm1.cdsAux.FieldByName('AUXGIRA').Isnull) or
      (trim(dm1.cdsAux.FieldByName('AUXGIRA').Asstring)='') then
      dbeAbreviatura.Text := dm1.cdsAux.FieldByName('AUXNOMB').Asstring
   else
      dbeAbreviatura.Text := dm1.cdsAux.FieldByName('AUXGIRA').Asstring ;

end;







procedure TFEmpRendCuentas.FormShow(Sender: TObject);
begin
   cdsEmpResp.Active := true ;
   cdsEmpRespEdit.Active := True ;
end;

procedure TFEmpRendCuentas.z2bbtnNuevoClick(Sender: TObject);
begin
  cdsEmpRespeDIT.INSERT ;
end;

end.

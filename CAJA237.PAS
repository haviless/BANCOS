unit Caja237;
{ 28/08/2000    PJSV }
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, wwdbdatetimepicker, Mask, wwdbedit, StdCtrls, wwdblook,
  ComCtrls, Buttons, Grids, Wwdbigrd, Wwdbgrid, DB, DBCtrls;

type
  TFCierreO = class(TForm)
    Z2bbtnRegOk: TBitBtn;
    Z2bbtnRegCanc: TBitBtn;
    pcCierre: TPageControl;
    tsCierre: TTabSheet;
    Bevel1: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pnlDA: TPanel;
    lblCIA: TLabel;
    dbeCIA: TwwDBEdit;
    dbeFrecu: TwwDBEdit;
    dbeUltFec: TwwDBEdit;
    dbeActFec: TwwDBEdit;
    dblcCIA: TwwDBLookupCombo;

    procedure Z2bbtnRegCancClick(Sender: TObject);
    procedure Z2bbtnRegOkClick(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure dblcNotInList(Sender: TObject;
     LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure dblcCIAExit(Sender: TObject);
    procedure dblcCIAChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    xCrea : bool;    
    procedure nuevafecha;
  public
    { Public declarations }
  end;

var
  FCierreO: TFCierreO;

implementation

uses ALMDM1;

{$R *.DFM}

procedure TFCierreO.FormCreate(Sender: TObject);
begin
  dm1.cdsCIA.Open;
  dm1.cdsLOC.Open;
  dm1.cdsALM.Open;
  dm1.cdsCIERRE.open;
  dbeFrecu.Text := '';
  dbeUltFec.Text := '';
  dbeActFec.Text := '';
  dblcCIA.Text := ''; dblcCIAChange(nil);
  dblcLOC.Text := ''; dblcLOCChange(nil);
  dblcALM.Text := ''; dblcALMChange(nil);
  dbeCIA.Text := '';
  dbeLOC.Text := '';
  dbeALM.Text := '';
  pcCierre.ActivePage := tsCierre;
end;

procedure TFCierreO.FormActivate(Sender: TObject);
begin
  xcrea := True;
  dblcCIA.setfocus;
  xcrea := false;  
end;


procedure TFCierreO.Z2bbtnRegCancClick(Sender: TObject);
begin
  with DM1.cdsCIERRE do
  begin
    if State in [dsInsert, dsEdit] then
      Cancel;
  end;
  FCierreO.Close;
end;

procedure TFCierreO.Z2bbtnRegOkClick(Sender: TObject);
begin
  if (dbeFrecu.text <> '') and (dbeUltFec.text <> '') AND (dbeActFec.text <> '') then
   begin
    dm1.cdsCIERRE.Insert;
    dm1.cdsCIERRE.fieldbyname('CIAID').AsString := dblcCIA.text;
    dm1.cdsCIERRE.fieldbyname('LOCID').AsString := dblcLOC.text;
    dm1.cdsCIERRE.fieldbyname('ALMID').AsString := dblcALM.text;
    dm1.cdsCIERRE.fieldbyname('CNSULTCIE').AsString := dbeActFec.text;
    dm1.cdsCIERRE.fieldbyname('CNSFRECU').AsString := dbeFrecu.text;
    dm1.ControlTran;
    //dm1.cdsCIERRE.Post;
    //dm1.cdsCIERRE.ApplyUpdates(0);
    FCierreO.close;
   end
  else
   ErrorMsg('Error','Faltan Datos');
end;

procedure TFCierreO.dblcNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;


procedure TFCierreO.dblcCIAExit(Sender: TObject);
var
ssql : string;
begin
  If xCrea Then exit;
  if dblcCIA.Text <> '' then
   begin
    ssql := '';
    ssql := 'SELECT * FROM TGE126 WHERE CIAID='+quotedstr(dblcCIA.Text) +' ORDER BY CIAID,LOCID';
    dm1.cdsLOC.Close;
    dm1.cdsLOC.DataRequest(ssql);
    dm1.cdsLOC.Open;
   end
  else
   if dm1.cdsCIA.RecordCount > 0 then
    begin
     ErrorMsg('Error','Debe de escoger una Compañia');
     dblcCIA.setfocus;
    end;
end;

procedure TFCierreO.dblcCIAChange(Sender: TObject);
begin
  dblcLOC.Text := '';
  dbeLOC.Text := '';
  dblcALM.Text := '';
  dbeALM.Text := '';
  dbeFrecu.Text := '';
  dbeUltFec.Text := '';
  dbeActFec.Text := '';
  if dblcCIA.Text <> '' then
   begin
    dbeCIA.Text := dm1.cdsCIA.fieldbyname('CIADES').Asstring;
    dblcLOC.setfocus; 
   end;
end;

procedure TFCierreO.nuevafecha;
var
ix : integer;
vfecult,vmasdia : Tdate;
vyear,vmonth,vday : word;
vyear1,vmonth1,vday1 : word;
begin
  vmasdia := StrToInt(dbeFrecu.Text) + StrToDate(dbeUltFec.Text);
  vfecult := StrToDate(dbeUltFec.Text);
  DecodeDate(vmasdia,vyear,vmonth,vday);
  DecodeDate(vfecult,vyear1,vmonth1,vday1);
  if vyear = vyear1 then
   dbeActFec.text := DateToStr(vmasdia)
  else
   begin
    ix := 1;
    repeat
     vmasdia := (StrToInt(dbeFrecu.Text)-iX) + StrToDate(dbeUltFec.Text);
     DecodeDate(vmasdia,vyear,vmonth,vday);
     DecodeDate(vfecult,vyear1,vmonth1,vday1);
     iX := iX+1;
    until vyear = vyear1;
    dbeActFec.text := DateToStr(vmasdia);
   end;
end;


procedure TFCierreO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   dm1.cdsCIA.close;
   dm1.cdsALM.close;
   dm1.cdsLOC.close;
   if dm1.cdsCIERRE.State = dsInsert then
    dm1.cdsCIERRE.cancel;
   dm1.cdsCIERRE.close;
   xCrea := True;
end;

end.


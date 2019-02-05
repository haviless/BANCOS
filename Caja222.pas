unit Caja222;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, wwdbedit, wwdblook, Buttons, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, Wwdbspin, db, DBClient, wwclient, StrContainer, Wwdbdlg, ppVar,
  ppCtrls, ppPrnabl, ppClass, ppDB, ppBands, ppProd, ppReport, ppComm,
  ppRelatv, ppCache, ppDBPipe, Variants;

type
  TFMntBco = class(TForm)
    gbHEADER: TGroupBox;
    Label9: TLabel;
    dblcBanco: TwwDBLookupCombo;
    dbeBanco: TwwDBEdit;
    Z2bbtnPrint: TBitBtn;
    Bevel1: TBevel;
    pnlFOOT: TPanel;
    dbgPBCO: TwwDBGrid;
    pnlActItm: TPanel;
    Bevel4: TBevel;
    Panel4: TPanel;
    z2bbtnOkCono: TBitBtn;
    z2bbtnCancelCono: TBitBtn;
    dbgPBCOBTN: TwwIButton;
    dbITEM: TwwDBEdit;
    dbeDESC: TwwDBEdit;
    dbseINI: TwwDBSpinEdit;
    dbseFIN: TwwDBSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label7: TLabel;
    dblcdEquiv: TwwDBLookupComboDlg;
    pnlPie: TPanel;
    BitBtn2: TBitBtn;
    z2bbtnNuevo: TBitBtn;
    z2bbtnCacelUp: TBitBtn;
    Z2bbtnGraba: TBitBtn;
    Z2bbtnImp: TBitBtn;
    dbeFormat: TwwDBEdit;
    Label8: TLabel;
    ppdbpPlantilla: TppDBPipeline;
    pprptPlantilla: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppdbtItem: TppDBText;
    pplblBanco: TppLabel;
    pplblTitulo: TppLabel;
    pplblFecha: TppLabel;
    ppsvFecha: TppSystemVariable;
    ppsvPag: TppSystemVariable;
    pplblPag: TppLabel;
    pplblItem: TppLabel;
    pplblDescripcion: TppLabel;
    pplblInicio: TppLabel;
    pplblFin: TppLabel;
    pplblFormato: TppLabel;
    ppdbtDescripcion: TppDBText;
    ppdbtInicio: TppDBText;
    ppdbtFin: TppDBText;
    ppdbtFormato: TppDBText;
    ppLine1: TppLine;
    procedure dblcBancoChange(Sender: TObject);
    procedure dblcExist(Sender: TObject);
    procedure dblcNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure dbgPBCOBTNClick(Sender: TObject);
    procedure z2bbtnOkConoClick(Sender: TObject);
    procedure z2bbtnCancelConoClick(Sender: TObject);
    procedure Z2bbtnPrintClick(Sender: TObject);
    procedure Z2bbtnRegresaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure z2bbtnNuevoClick(Sender: TObject);
    procedure dbseFINExit(Sender: TObject);
    procedure dbgPBCODblClick(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure z2bbtnCacelUpClick(Sender: TObject);
    procedure dblcdEquivExit(Sender: TObject);
    procedure Z2bbtnImpClick(Sender: TObject);
  private
    { Private declarations }
    xType,xCampo : String;
    dIni,dFin : double;
  public
    { Public declarations }
    sBCO : String;
    procedure dcBCO;
    procedure EnBtn;

  end;

var
  FMntBco: TFMntBco;

implementation

uses CajaDM;

{$R *.DFM}


function OperClientDataSet( ClientDataSet : TwwClientDataSet;
                            Expression, Condicion : String  ) : Double;
var
  cdsClone    : TwwClientDataSet;
  bmk         : TBookmark;
  Agg         : TAggregate;
begin
  result := 0;
  
  if trim(Expression)= '' then Exit;

  bmk:=ClientDataSet.GetBookmark;
  cdsClone    := TwwClientDataSet.Create(nil);
  try

    with cdsClone do
    begin
      CloneCursor(ClientDataSet,True);

      Agg := Aggregates.Add;
      Agg.AggregateName := 'OPER';
      Agg.Expression := Expression;
      Agg.Active := True;

      if Trim(Condicion)<>'' then
      begin
        Filtered     := False;
        Filter       := Condicion;
        Filtered     := True;
      end;
      
      if Aggregates.Items[Aggregates.IndexOf('OPER')].Value<>NULL then
         result := Aggregates.Items[Aggregates.IndexOf('OPER')].Value;

      Aggregates.Clear;

    end;

    ClientDataSet.GotoBookmark(bmk);
    ClientDataSet.FreeBookmark(bmk);

  finally
    cdsClone.Free;
  end;
end;


procedure TFMntBco.dcBCO;
begin
  DMTE.cdsBanco.First;
  sBCO := trim(DMTE.cdsBanco.FieldByName('BANCOID').AsString);
  dblcBanco.Text := sBCO;
  dblcBanco.Enabled := DMTE.cdsBanco.RecordCount > 1;
end;

procedure TFMntBco.dblcBancoChange(Sender: TObject);
begin

 sBCO := dblcBanco.Text;
 dbeBanco.Text := DMTE.cdsBanco.FieldByName('BANCONOM').AsString;
  if sBCO = '' then
 begin
   dbeBanco.Text := '';
   Exit;
 end;

 if DMTE.cdsTransBCO.State in [dsInsert] then
 begin
    if DMTE.cdsTransBCO.Locate('BANCOID','BANCOID',[]) then
    begin
     Application.MessageBox( ' No se puede insertar un nuevo registro de bancos,'+#13+
                             ' la plantilla de banco ya existe','Error',MB_OK+MB_ICONERROR);
     DMTE.cdsTransBCO.Cancel;
     Exit;
    end;
 end;

end;

procedure TFMntBco.dblcExist(Sender: TObject);
var
 bRq : Boolean;
begin
  if TwwDBCustomLookupCombo(Sender).DataSource <> nil then
    bRq := TwwDBCustomLookupCombo(Sender).DataSource.DataSet.FieldByName(TwwDBCustomLookupCombo(Sender).DataField).Required;

  if (bRq)  and (trim(TwwDBCustomLookupCombo(Sender).Text)='') then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFMntBco.dblcNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFMntBco.dbgPBCOBTNClick(Sender: TObject);
var
 sItem  : String;
begin
 pnlPie.Enabled := False;
 gbHEADER.Enabled  := False;
 pnlActItm.Visible := True;
 pnlFOOT.Enabled   := False;
 dbgPBCO.Enabled   := False;

 sItem :=DMTE.StrZero(FloatToStr(OperClientDataSet(DMTE.cdsTransBCO,
                                                  'MAX(ESID)','BANCOID='''+sBCO+'''')+1),3);

 dbITEM.Text :=  sItem;

 DMTE.cdsTransBCO.Insert;

 dbeDESC.Text  := '';
{ if dIni=0 then
    dbseINI.Text  := ''
 else
    dbseINI.Text  := Floattostr(dINI+1);}

 dbseFIN.Text  := '';    
 if dFin=0 then
    dbseINI.Text  := ''
 else
    dbseINI.Text  := Floattostr(dFIN+1);

 gbHEADER.Enabled  := False;
 pnlActItm.Visible := True;
 pnlFOOT.Enabled   := False;
 if dbeDESC.Enabled then
    dbeDESC.SetFocus;

end;

procedure TFMntBco.z2bbtnOkConoClick(Sender: TObject);
var
 xI : integer;
 xTipo : string;
begin

 pnlFOOT.Enabled   := True;
 dbgPBCO.Enabled   := True;
 //Warnings
 if Length(Trim(dbseINI.Text))=0 then
 begin
    Showmessage('Ingrese Col.Inicio');
    dbseINI.SetFocus;
    Exit;
 end;

 if Length(Trim(dbseFIN.Text))=0 then
 begin
    Showmessage('Ingrese Col.Final');
    dbseFIN.SetFocus;
    Exit;
 end;
 pnlActItm.Visible := False;

 if  not (DMTE.cdsTransBCO.State in [dsInsert, dsEdit]) then  Exit;
 with DMTE.cdsTransBCO do
 begin
   FieldByName('BANCOID').AsString   := sBCO;
   FieldByName('ESID').AsString      := dbITEM.Text;
   FieldByName('ESDES').AsString     := dbeDESC.Text;
   FieldByName('ESINI').AsString     := dbseINI.Text;
   FieldByName('ESFIN').AsString     := dbseFIN.Text;
   FieldByName('ESEQUIDES').AsString := dblcdEquiv.Text;
   FieldByName('ESEQUIFLD').AsString := xCampo;
   FieldByName('ESFORMAT').AsString  := dbeFormat.text ;
   xTipo := '';
   For xI := 1 to Length(xType) do
   begin
    If Copy(xType,xI,1) <> '(' then
     begin
      xTipo := xTipo + Copy(xType,xI,1);
      FieldByName('ESTIPO').AsString    := xTipo;
     end
    else Break;
   end;
   Post;
 end;
// dIni:= strtoFloat(DMTE.cdsTransBCO.FieldByName('ESINI').AsString);
 dFin:= strtoFloat(DMTE.cdsTransBCO.FieldByName('ESFIN').AsString);
 EnBtn;
 pnlPie.Enabled := true;
end;

procedure TFMntBco.z2bbtnCancelConoClick(Sender: TObject);
begin
 pnlPie.Enabled := true;
 pnlActItm.Visible := False;
 pnlFOOT.Enabled := True;
 dbgPBCO.Enabled := True;

 if DMTE.cdsTransBCO.State in [dsEdit, dsInsert] then
    DMTE.cdsTransBCO.Cancel;
end;

procedure TFMntBco.Z2bbtnPrintClick(Sender: TObject);
begin
 pnlPie.Enabled := True;
 Z2bbtnPrint.Enabled := False;
 DMTE.cdsTransBCO.Close;
 DMTE.cdsTransBCO.DataRequest ('SELECT * FROM CAJA312 WHERE BANCOID='''+sBCO+'''');
 DMTE.cdsTransBCO.Open;

 gbHEADER.Enabled := False;
 dbgPBCO.Enabled  := True;
 
 if DMTE.cdsTransBCO.RecordCount=0 then
 begin
    dIni := 0;
    dFin := 0;
    dbgPBCOBTN.OnClick(Self)
 end
 else
 begin
    DMTE.cdsTransBCO.Last;
    dIni := StrtoFloat(DMTE.cdsTransBCO.fieldbyname('ESINI').AsString);
    dFin := StrtoFloat(DMTE.cdsTransBCO.fieldbyname('ESFIN').AsString);
    DMTE.cdsTransBCO.First;    
 end;


end;

procedure TFMntBco.Z2bbtnRegresaClick(Sender: TObject);
begin
 if (DMTE.cdsTransBCO.ChangeCount >0) or
    (DMTE.cdsTransBCO.Modified) or
    (DMTE.cdsTransBCO.State in [dsInsert, dsEdit]) then
 begin
   Application.MessageBox( ' Debe guardar los datos antes de activar la cabecera ...!!! '
                           ,'Error',MB_OK+MB_ICONERROR);
   exit;
 end;

 Z2bbtnPrint.Enabled := True;
 gbHEADER.Enabled := True;
 EnBtn;
end;

procedure TFMntBco.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFMntBco.FormCreate(Sender: TObject);
var
 xsql : string;
begin
  //**
  DMTE.cdsBanco.First;

  // abrir tabla de plantillas
  dbgPBCO.Selected.Clear;
  //**
  dbgPBCO.Selected.Add('ESID'#9'3'#9'Nº'#9'F');;
  dbgPBCO.Selected.Add('ESDES'#9'30'#9'Descripción'#9'F');;
  dbgPBCO.Selected.Add('ESINI'#9'10'#9'Inicio'#9'F');;
  dbgPBCO.Selected.Add('ESFIN'#9'10'#9'Final'#9'F');;
//  dbgPBCO.Selected.Add('ESEQUIDES'#9'30'#9'Campo~Equivalente'#9'F');;
//dbgPBCO.Selected.Add('ESEQUIFLD'#9'30'#9'Campo~Equivalente'#9'F');;

  DMTE.cdsTransBCO.IndexFieldNames := 'BANCOID;ESID';
  DMTE.cdsTransBCO.Close;
  DMTE.cdsTransBCO.DataRequest ('SELECT * FROM CAJA312 WHERE BANCOID=''*''');
  DMTE.cdsTransBCO.Open;

  dIni := 0;
  dFin := 0;

  EnBtn;

end;


procedure TFMntBco.z2bbtnNuevoClick(Sender: TObject);
begin
  dblcBanco.Text := '';
  dbeBanco.Text  := '';
  dblcBanco.Enabled   := True;
  gbHEADER.Enabled    := True;
  Z2bbtnPrintClick(nil);
  Z2bbtnPrint.Enabled := True;
  gbHEADER.Enabled := True;
//  DMTE.cdsTransBCO.Insert;
  EnBtn;
end;

procedure TFMntBco.EnBtn;
var
  En : Boolean;
begin
 En := (DMTE.cdsTransBCO.ChangeCount >0) or (DMTE.cdsTransBCO.Modified) or (DMTE.cdsTransBCO.State in [dsInsert]);
 Z2bbtnImp.Enabled     := not En;
 Z2bbtnGraba.Enabled   := En;
 z2bbtnCacelUp.Enabled := En;
 z2bbtnNuevo.Enabled   := not En;
end;

procedure TFMntBco.dbseFINExit(Sender: TObject);
begin
    if dbseINI.Value >  dbseFIN.Value then
    begin
      Application.MessageBox( ' La Columna Inicial no pude ser '+#13+
                              ' mayor que la Columna Final ','Error',MB_OK+MB_ICONERROR);
      Exit;
    end;
end;

procedure TFMntBco.dbgPBCODblClick(Sender: TObject);
begin
 with DMTE.cdsTransBCO do
 begin
   dbITEM.Text   :=  FieldByName('ESID').AsString;
   dbeDESC.Text  :=  FieldByName('ESDES').AsString;
   dbseINI.Text  :=  FieldByName('ESINI').AsString;
   dbseFIN.Text  :=  FieldByName('ESFIN').AsString;
   dblcdEquiv.text := FieldByName('ESEQUIDES').AsString;
   dbeFormat.text := FieldByName('ESFORMAT').AsString;
   Edit;
   pnlActItm.Visible := True;
   gbHEADER.Enabled  := False;
   pnlFOOT.Enabled   := False;
   dbgPBCO.Enabled   := False;
   EnBtn;
 end;
end;

procedure TFMntBco.Z2bbtnGrabaClick(Sender: TObject);
begin
  DMTE.cdsTransBCO.ApplyUpdates(-1);
  EnBtn;
end;

procedure TFMntBco.z2bbtnCacelUpClick(Sender: TObject);
begin
  DMTE.cdsTransBCO.CancelUpdates;
  EnBtn;
end;

procedure TFMntBco.dblcdEquivExit(Sender: TObject);
var xWhere: String;
begin
   xWhere := 'archivo=''CAJA302'' AND '+DMTE.wReplacCeros+'(FLAG,'''') <> ''S'' AND DESCRIPCION='+quotedstr(Trim(dblcdEquiv.text));
   //** se borro el control
   DMTE.Filtracds(DMTE.cdsQry, 'SELECT TIPO, CAMPO FROM PLAN04 WHERE '+xWhere);
   xType := DMTE.cdsQry.fieldbyName('TIPO').asString;
   xCampo:= DMTE.cdsQry.fieldbyName('CAMPO').asString;
end;

procedure TFMntBco.Z2bbtnImpClick(Sender: TObject);
begin
 //** 23/03/2001 - pjsv
 If DMTE.cdsTransBCO.recordcount > 0 then
  begin
	 //JCC: 24/06/2002
	 pprptPlantilla.TEMPLATE.FileName := wRutaRpt + '\Plantilla.Rtm';
   pprptPlantilla.template.LoadFromFile ;
   pplblBanco.Caption := 'Banco : '+dbeBanco.text;
   pprptPlantilla.print;
  end
 else Showmessage(' No Hay Datos a mostrar');
 //**
end;

end.

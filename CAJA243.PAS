//** 04/04/2001 - pjsv
unit Caja243;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, wwriched, wwrichedspell, Buttons, Mask, wwdbedit,
  wwdblook, ExtCtrls,CajaUtil, CheckLst;

type
  TFGenCartas = class(TForm)
    pnlCabecera: TPanel;
    lblCiaid: TLabel;
    lblBanco: TLabel;
    lblCtacte: TLabel;
    lblDescrip: TLabel;
    lblNumReg: TLabel;
    dblcCia: TwwDBLookupCombo;
    dblcBanco: TwwDBLookupCombo;
    dblcCtaCte: TwwDBLookupCombo;
    dbeDescrip: TwwDBEdit;
    dbeNumReg: TwwDBEdit;
    z2bbtnOKCab: TBitBtn;
    dbremswCartas: TwwDBRichEditMSWord;
    dbeArchivo: TwwDBEdit;
    Label1: TLabel;
    edtCia: TEdit;
    edtBanco: TEdit;
    clbDescrip: TCheckListBox;
    clbCampo: TCheckListBox;
    Label2: TLabel;
    edtDirigido: TEdit;
    edtDirecc: TEdit;
    lblDirigido: TLabel;
    lblDirecc: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcCtaCteExit(Sender: TObject);
    procedure clbDescripClickCheck(Sender: TObject);
  private
    { Private declarations }
    xDescrip : string;
    A2digitos ,A4digitos : Array of TWinControl ;
    procedure BuscaNRecibo;
  public
    { Public declarations }
  end;

var
  FGenCartas: TFGenCartas;

implementation
uses CajaDM;
{$R *.DFM}

procedure TFGenCartas.FormKeyPress(Sender: TObject; var Key: Char);
var
   xStr : String ;
begin
    if not aplicaKeyPress(self ,A2digitos, A4digitos) then
       Exit ;
    if not( Key in [ '0'..'9' , '.' , #8 ]) then
    begin
       Key := #0 ;
    end ;
    xStr := TCustomEdit(self.ActiveControl).text ;
    if key = '.' then
       if pos('.',xSTR) <> 0 then
          Key := #0 ;
end;

procedure TFGenCartas.z2bbtnOKCabClick(Sender: TObject);
var
  F: TextFile;
  xArchivo : String;
  xI : Integer;
  xBool : Bool;
begin
   // ´por defecto
   xBool := False;
   If (dblcBanco.text = '') then
    begin
     showmessage('Falta Banco');
     exit;
    end;
   if (dm1.cdsCCBco.recordcount > 0) and  (dblcCtaCte.text = '') then
    begin
     showmessage('Falta Cta.Cte.');
     exit;
    end;
   if (dbeArchivo.text = '') then
    begin
     showmessage('Falta Nombre del Archivo');
     exit;
    end;
     // carga el nombre del archivo TXT asocido al RTF
     xArchivo := ExtractFilePath(application.ExeName ) + 'SOLFORMATOS\'+Trim(dbeArchivo.text)+'.TXT';
     // pregunta por el archivo
     AssignFile(F,xArchivo);
     // lo crea
     Rewrite(F);
     if edtDirigido.text <> '' then
      Writeln(F, edtDirigido.text);
     if edtDirecc.text <> '' then
      Writeln(F, edtDirecc.text);
     // recorre el listbox
     For xI := 0 to clbCampo.Items.Count - 1 do
      begin
       // si hay al menos un campo marcado
       If clbCampo.Checked[xI] then
        begin
         Writeln(F, clbCampo.Items.Strings[xI]);
         xBool := True;
        end;
      end;
     // si se graba al menos un campo
     If xBool then
      begin
       // limpia cualquier linea
       dbremswCartas.Lines.Clear;
       // seteo la ruta y el nombre del archivo
       dbremswCartas.Lines.SaveToFile(ExtractFilePath( application.ExeName ) + 'SOLFORMATOS\'+Trim(dbeArchivo.text)+'.RTF');
       if edtDirigido.text <> '' then
        dbremswCartas.lines.Add(edtDirigido.text);
       if edtDirecc.text <> '' then
        dbremswCartas.lines.Add(edtDirecc.text);

       // recorre el listbox
       For xI := 0 to clbCampo.Items.Count - 1 do
        begin
         // si hay al menos un campo marcado
         If clbDescrip.Checked[xI] then
          begin
           dbremswCartas.lines.Add(clbDescrip.Items.Strings[xI]);
          end;
        end;
       dbremswCartas.Execute;
       // al salir grabo los datos
       DM1.cdsCartas.Insert;
       DM1.cdsCartas.fieldbyname('BANCOID').AsString := dblcBanco.text;
       DM1.cdsCartas.fieldbyname('CCBCOID').AsString:= dblcCtaCte.text;
       DM1.cdsCartas.fieldbyname('CIAID').AsString:= dblcCia.text;
       DM1.cdsCartas.fieldbyname('FILEDETA').AsString:= dbeDescrip.text;
       DM1.cdsCartas.fieldbyname('FILENOMBRE').AsString:= dbeArchivo.text;
       DM1.cdsCartas.fieldbyname('FILENUMREG').AsString:= dbeNumReg.text;
       DM1.cdsCartas.fieldbyname('FILEUSER').AsString:= dm1.wUsuario;
       DM1.cdsCartas.fieldbyname('FILEFREG').value:= date;
       DM1.cdsCartas.fieldbyname('FILEHREG').value:= time;
       DM1.cdsCartas.post;
       DM1.cdsCartas.ApplyUpdates(0);
      end
     else showmessage('No ha escogido ningun Dato');
     // cierro el archivo de texto
     CloseFile(F);
end;

procedure TFGenCartas.FormCreate(Sender: TObject);
var
 xsql : string;
begin
   RecuperarCiaUnica(dblcCia,edtCia);
   clbCampo.Items.Clear;
   clbDescrip.Items.Clear;
   xsql := 'select * from plan04 where archivo=''CAJA302'' AND (coalesce(FLAG,'''')<>''S'')'+
           'and (coalesce(descripcion,'''')<>'''')';
   dm1.cdsSQL.close;
   dm1.cdsSQL.DataRequest(xsql);
   dm1.cdsSQL.open;
   while not dm1.cdsSQL.Eof do
    begin
     clbCampo.Items.Add(dm1.cdsSQL.fieldbyname('CAMPO').AsString);
     clbDescrip.Items.Add(dm1.cdsSQL.fieldbyname('DESCRIPCION').AsString);
     dm1.cdsSQL.next;
    end;
end;

procedure TFGenCartas.dblcCiaExit(Sender: TObject);
begin
   xDescrip := 'CIAID='+quotedstr(dblcCia.Text);
   edtCia.text := DM1.DisplayDescrip('prvTGE','TGE101','*',xDescrip,'CIAABR');
end;

procedure TFGenCartas.dblcBancoExit(Sender: TObject);
var
 xsql : string;
begin
   xDescrip := 'BANCOID='+quotedstr(dblcBanco.text);
   edtBanco.text := DM1.DisplayDescrip('prvTGE','TGE105','*',xDescrip,'BANCONOM');
   If edtBanco.text <> '' then
    begin
     // el SQL lo he tomado del servidor, solo le agregue el Where
     xSql := 'Select TGE106.*, TGE103.TMONDES, TGE103.TMONABR'+
             ' From TGE106'+
             ' Inner Join TGE103 on TGE106.TMONID=TGE103.TMONID'+
             ' WHERE BANCOID='+quotedstr(dblcBanco.text);
     dm1.cdsCCBco.Close;
     dm1.cdsCCBco.DataRequest(xsql);
     dm1.cdsCCBco.open;
     If dm1.cdsCCBco.recordCount = 0 then
      BuscaNRecibo
    end
   else
    begin
     Showmessage('Falta el Banco');
     dblcBanco.SetFocus;
    end;
end;

procedure TFGenCartas.BuscaNRecibo;
var
 ssql: string;
begin
   ssql := '';
   ssql := 'SELECT substr(coalesce(SUBSTR(''000000'',1,6-LENGTH(RTRIM(CHAR(MAX(INTEGER(FILENUMREG))+1))))'+
           ' ||(CHAR(MAX(INTEGER(FILENUMREG))+1)),''000001''  ),1,6) AS CARTA FROM CAJA315'+
           ' WHERE CIAID='+quotedstr(trim(dblcCia.text))+' AND (FILENUMREG <> '''' and FILENUMREG IS NOT NULL)'+
           ' AND BANCOID='+quotedstr(dblcBanco.text)+ ' AND CCBCOID='+quotedstr(dblcCtaCte.text);
   DM1.cdsQry2.Close;
   DM1.cdsQry2.DataRequest(ssql);
   DM1.cdsQry2.open;
   dbeNumReg.Text :=  DM1.cdsQry2.fieldbyname('CARTA').AsString;
end;



procedure TFGenCartas.dblcCtaCteExit(Sender: TObject);
begin
  If dblcBanco.Focused Then Exit;
  // cuando el banco o Caja tienen una Cta.
  If dm1.cdsCCBco.RecordCount > 0 then
   // se debe de escoger una
   If dblcCtaCte.Text <> '' then
    BuscaNRecibo
   else
    begin
     Showmessage('Falta Cta. Cte.');
     dblcCtaCte.SetFocus;
    end
  else // si el Banco o Caja no tienen cta. ???
   BuscaNRecibo;
end;

procedure TFGenCartas.clbDescripClickCheck(Sender: TObject);
begin
    clbCampo.ItemIndex := clbDescrip.ItemIndex;
    clbCampo.Checked[clbDescrip.ItemIndex] := clbDescrip.Checked[clbDescrip.ItemIndex];
end;

end.

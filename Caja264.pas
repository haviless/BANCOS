unit Caja264;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, StrContainer, Printers, ComCtrls, wwriched, ppPrnabl,
  ppClass, ppStrtch, ppRichTx, ppBands, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, ExtCtrls, Mask, wwdbedit;

type
  TFrmPrint = class(TForm)
    od1: TOpenDialog;
    scFileN: TStrContainer;
    scFile: TStrContainer;
    dbere: TwwDBRichEdit;
    psd1: TPrinterSetupDialog;
    ppr1: TppReport;
    ppDetailBand1: TppDetailBand;
    pprt1: TppRichText;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    dbre1: TwwDBRichEdit;
    BitBtn5: TBitBtn;
    pd1: TPrintDialog;
    BitBtn7: TBitBtn;
    dbe1: TwwDBEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure pprt1Print(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
    i : Integer;
  public
    { Public declarations }
    reCustom : TwwCustomRichEdit;
  end;

var
  FrmPrint: TFrmPrint;

implementation

uses CajaDM;

{$R *.DFM}

procedure TFrmPrint.BitBtn1Click(Sender: TObject);
var
   xCont, i : Integer;
   MyFile : TextFile;
begin
   od1.Execute;

//   dbere.Lines.LoadFromFile( od1.FileName );
//   dbere.Font.Name:='Courier New';
//   dbere.Font.Name:='Draft 12cpi';

   scFile.Lines.LoadFromFile( od1.FileName );

   xCont:=0;

   AssignPrn( MyFile );

   Rewrite( MyFile );

   for i:=0 to scFile.Lines.Count-1 do begin
       xCont:=xCont+1;
       if xCont<75 then
          WriteLn( MyFile, scFile.Lines[ i ] )
          //scFileN.Lines.Add(  scFile.Lines[ i ] )
       else begin
          xCont:=0;
       end
   end;
   System.CloseFile( MyFile );
end;

procedure TFrmPrint.BitBtn2Click(Sender: TObject);
var
   EditorOptions: TwwRichEditOptions;
begin
   od1.Execute;


   dbere.Lines.LoadFromFile( od1.FileName );
//   dbere.Lines.LoadFromFile( dm1.wRutaCNT + '\Retenciones.rtm' );


   // Letra para Visualizar Ordenado en el Previo
   dbere.Font.Name:='Courier New';

   // Letra para Imprimir Ordenado
   //dbere.Font.Name:='Draft 17cpi';

   dbere.WordWrap :=False;

   //dbere.PrintMargins.Top:=0.25;
   dbere.PrintMargins.Left :=0;
   dbere. PrintMargins.Right:=0;
   //dbere.PrintMargins.Bottom:=0.25;}

   dbere.ReadOnly:=False;

   // Visualizar RE
   //dbere.Execute;
end;


procedure TFrmPrint.BitBtn4Click(Sender: TObject);
begin
   psd1.Execute;
end;

procedure TFrmPrint.pprt1Print(Sender: TObject);
var
   FDefaultFont: TFont;
begin

  FDefaultFont := TFont.Create;
  {
  //ok
  FDefaultFont.Name := 'Draft 12cpi';
  FDefaultFont.Size := 10;
  //
  FDefaultFont.Name := 'Draft 15cpi';
  FDefaultFont.Size := 08;

  FDefaultFont.Name := 'Draft 15cpi';
  FDefaultFont.Size := 12;

  FDefaultFont.Name := 'Draft 12cpi';
  FDefaultFont.Size := 8;
  }
  //FDefaultFont.Name := 'Draft 20cpi';
  FDefaultFont.Name := 'Draft 17cpi';
//  FDefaultFont.Size := 8;

    {assign default font to all text }
  ppRT1.SelectAll;
  ppRT1.SelAttributes.Assign(FDefaultFont);

   //pprt1.LoadFromFile( od1.FileName );
//   scFile.Lines.LoadFromFile( od1.FileName );
//   for i:=0 to scFile.Lines.Count-1 do begin
//       pprt1.RichText:= scFile.Lines[2];
//       pprt1.LoadRichText;
//   end;
//    i:=i+1;
//    if i=1 then
//       pprt1.RichText:=scFile.Lines[i]+ #13 + #13
//    else
//       pprt1.RichText:=pprt1.RichText+scFile.Lines[i]+ #13 + #13;
    {
    i:=i+1;
    if i=1 then
       pprt1.RichText:='111'+ #13 + #13;

    if i=2 then
       pprt1.RichText:=pprt1.RichText+'222'+ #13 + #13;

    if i=3 then
       pprt1.RichText:=pprt1.RichText+'333'+ #13 + #13;
    }
end;

procedure TFrmPrint.BitBtn6Click(Sender: TObject);
begin
//   od1.Execute;
   dbre1.Lines.Clear;

   dbre1.Lines.LoadFromFile( od1.FileName );

   // Letra para Imprimir Ordenado
   dbre1.Font.Name:='Draft 17cpi';

   dbre1.WordWrap :=False;

   dbre1.PrintMargins.Top   :=0;
   dbre1.PrintMargins.Left  :=0;
   dbre1.PrintMargins.Right :=0;
   dbre1.PrintMargins.Bottom:=0;

   dbre1.ReadOnly:=False;

   // Imprimir
   //dbre1.Print( dbere.PrintJobName );
 //  dbre1.E Print( dbre1.PrintJobName );

   dbre1.Print( dbre1.PrintJobName );

   ShowMessage('Imprimiendo');

end;

procedure TFrmPrint.BitBtn5Click(Sender: TObject);
var
   xCont, i : Integer;
   MyFile : TextFile;
begin
//   od1.Execute;
  {
   pprt1.Font.Name:='Draft 12cpi';
   pprt1.Font.Name:='Draft 17cpi';
   pprt1.Font.Style:=[];
   }
   pprt1.LoadFromFile( od1.FileName );

//&   pprt1.Font.Name:='Draft 12cpi';

   {scFile.Lines.LoadFromFile( od1.FileName );

   pprt1.RichText:='';
   for i:=0 to scFile.Lines.Count-1 do begin
       pprt1.RichText := pprt1.RichText + scFile.Lines[i] + #13 + #13;
   end;

   i:=0;}

   ppr1.Print;
end;

procedure TFrmPrint.BitBtn7Click(Sender: TObject);
begin
  pd1.Execute;   
end;

end.

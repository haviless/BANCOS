unit Caja239;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, StdCtrls, ExtCtrls, Math ;
type
  TFToolCJA1 = class(TForm)
    cb1: TControlBar;
    ToolBar2: TToolBar;
    spb1: TSpeedButton;
    spb2: TSpeedButton;
    spb3: TSpeedButton;
    spbAct: TSpeedButton;
    spbNor: TSpeedButton;
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FToolCJA1: TFToolCJA1;

implementation

uses CAJADM ;

{$R *.DFM}


end.

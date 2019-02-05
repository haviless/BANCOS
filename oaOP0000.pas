unit oaOP0000;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ACC002, ACC003, ACC005, oaVariables, mant, DB, DBClient, wwclient;

type
  TFOPIni = class(TForm)
    wwClientDataSet1: TwwClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    MantHelp : TMant;
  end;

  procedure CXPDataModulo; stdcall;
  procedure CXPMantenimientoAccesos; stdcall;
  procedure CXPOpcionAccesos; stdcall;
  procedure CXPOpcionAccesosShow; stdcall;
  procedure CXPMantenimientoAyudaMant; stdcall;
  procedure CambioPassword; stdcall;

exports
  CXPDataModulo,
  CXPMantenimientoAccesos,
  CXPOpcionAccesos,
  CXPOpcionAccesosShow,
  CXPMantenimientoAyudaMant,
  CambioPassword;

var
  FOPIni: TFOPIni;

implementation

{$R *.dfm}

USES CXPDM;


procedure CXPDataModulo;
begin

   Application.Initialize;

   try
      if ( DM1=nil ) or ( DM1.sClose='1' ) then
      begin
         DM1:=TDM1.Create( Application );
      end;
   finally
   end;

end;


procedure CXPMantenimientoAccesos;
begin
   try
      if FMantAcceso=Nil then
      begin
         FMantAcceso:=TFMantAcceso.Create( nil );
         FMantAcceso.wDCOM1       :=DM1.DCOM1;
         FMantAcceso.wcdsAcceso   :=DM1.cdsAcceso;
         FMantAcceso.wcdsGrupos   :=DM1.cdsGrupos;
         FMantAcceso.wcdsMGrupo   :=DM1.cdsMGrupo;
         FMantAcceso.wcdsUsuarios :=DM1.cdsUsuarios;
         FMantAcceso.wcdsResultSet:=DM1.cdsResultSet;
         FMantAcceso.wcdsUser     :=DM1.cdsUser;
         //FMantAcceso.wFPrincipal  :=FPrincipal;
         FMantAcceso.sModulo      :=DM1.wModulo;
         FMantAcceso.sSRV_D       :=SRV_D;
      end
      else begin
         Exit;
      end;

      With FMantAcceso Do
      Try
         ShowModal;
      Finally
         DM1.wGrupoTmp:=FMantAcceso.sGrupoTmp;
         Free;
         FMantAcceso:=Nil;
      End;
   except
   end;

end;


procedure CXPOpcionAccesos;
begin
   IF FMantOpcion <> nil then Exit;

   FMantOpcion:=TFMantOpcion.Create( nil );
   FMantOpcion.wcdsAcceso   :=DM1.cdsAcceso;
   FMantOpcion.wcdsGrupos   :=DM1.cdsGrupos;
   FMantOpcion.wcdsMGrupo   :=DM1.cdsMGrupo;
   FMantOpcion.wcdsUsuarios :=DM1.cdsUsuarios;
   FMantOpcion.wcdsResultSet:=DM1.cdsResultSet;
   FMantOpcion.wDCOM1       :=DM1.DCOM1;
   FMantOpcion.sGrupoTmp    :=DM1.wGrupoTmp;
   FMantOpcion.sObjetoDescr :=DM1.wObjetoDescr;
   FMantOpcion.sObjetoForma :=DM1.wObjetoForma;
   FMantOpcion.sObjetoNombr :=DM1.wObjetoNombr;
   FMantOpcion.sModulo      :=DM1.wModulo;
end;


procedure CXPOpcionAccesosShow;
begin
   Try
      If Length(DM1.wGrupoTmp)>0 then begin
         FMantOpcion.ShowModal;
      end;
   Finally
      FMantOpcion.Free;
   End;

   FMantOpcion:=nil;
end;


procedure CambioPassword;
begin
   try
     FCPassw:=TFCPassw.Create( Application );

     FCPassw.dbeUser.Text:=DM1.wUsuario;
     FCPassw.sUser       :=DM1.wUsuario;
     FCPassw.wcdsUsuarios:=DM1.cdsUsuarios;
     FCPassw.wDCOM1      :=DM1.DCOM1;
     FCPassw.sModulo     :=DM1.wModulo;

     FCPassw.ShowModal;
   finally
     FCPassw.Free;
   end;
End;


procedure CXPMantenimientoAyudaMant;
begin
   FVariables.cdsTempVar :=TwwClientDataSet( DM1.FindComponent( FVariables.dblcTempVar.LookupTable.Name ) );
   FOPIni:=TFOPIni.Create( NIL );
   FOPIni.MantHelp:=TMant.Create( Application );
   FOPIni.MantHelp.ClientDataSet:= FVariables.cdsTempVar;
   FOPIni.MantHelp.Module       := DM1.wModulo;
   FOPIni.MantHelp.Tipo         := 'HELP';
   FOPIni.MantHelp.Admin        := 'N';
   FOPIni.MantHelp.DComC        := DM1.DCOM1;
   FOPIni.MantHelp.User         := DM1.wUsuario;
   FOPIni.MantHelp.Execute;
end;


end.

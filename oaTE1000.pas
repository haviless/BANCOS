unit oaTE1000;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaTE1000
// FORMULARIO               : FParametros
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Formulario inicial que contiene las funcionalidades
//                            que permiten acceder a las opciones de par�metros generales

// ACTUALIZACIONES:
//HPC_201207_CAJA 21/09/2012:  Se implement� el control de versiones
//HPC_201304_CAJA 24/04/2013:  Cambio de Versi�n a 20130424180000
//HPC_201305_CAJA 06/05/2013:  Cambio de Versi�n a 20130506180000
//HPC_201306_CAJA 07/06/2013:  Cambio de Versi�n a 20130720083000
//HPC_201308_CAJA 14/08/2013:  Cambio de Versi�n a 20130821083000
//HPC_201401_CAJA 27/05/2013:  Cambio de Versi�n a 20140625083000
//HPC_201603_CAJA 27/12/2016:  Cambio de Versi�n a 20161228083000
//CAJA_201804     09/11/2018:  Cambio de Control de Versi�n a CAJA-201804, cambio solo en el DFM

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mant, oaVariables, StdCtrls;

type
  TFParametros = class(TForm)
    lblVersion: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure TEReferencias; stdcall;
  procedure TETipoCambio; stdcall;

   procedure TEVerificaVersion; stdcall;

exports
  TEReferencias,

  TEVerificaVersion,

  TETipoCambio;

var
  FParametros: TFParametros;

implementation

{$R *.dfm}

USES CAJADM, caja110;

procedure TEReferencias;
var
   MRefe : TMant;
begin
   if DMTE=nil then exit;
   if not DMTE.DCOM1.Connected then Exit;
   if not DMTE.VerificaAccesoOpcion( FVariables.w_Var_sObjetoNombr ) then Exit;

   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a m�s de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   FVariables.w_Num_Formas:=FVariables.w_Num_Formas+1;

   Application.Initialize;
   try
      MRefe := TMant.Create( Application );
      MRefe.Module := 'CAJA';
      MRefe.Admin  := DMTE.wAdmin;
      MRefe.DComC  := DMTE.DCOM1 ;
      MRefe.User   := DMTE.wUsuario;
      MRefe.OnCierra := DMTE.DisminuyeForma;
      MRefe.Execute;
   except
   end;
end;


procedure TETipoCambio;
var
   MRefe : TMant;
begin
   if DMTE=nil then exit;
   if not DMTE.DCOM1.Connected then Exit;
   if not DMTE.VerificaAccesoOpcion( FVariables.w_Var_sObjetoNombr ) then Exit;
   if FVariables.w_Num_Formas>FVariables.w_Max_Formas then
   begin
      ShowMessage('No puede Invocar a m�s de '+Trim(IntToStr(FVariables.w_Max_Formas))+' opciones al mismo tiempo' );
      Exit;
   end;
   FVariables.w_Num_Formas:=FVariables.w_Num_Formas+1;

   Application.Initialize;
   Try
      FTipoCambio:=TFTipoCambio.Create( Application );
      FTipoCambio.ShowModal;
   except
      FTipoCambio.Free;
   end;
end;

Procedure TEVerificaVersion;
Begin
   if DMTE=nil then exit;
   if not DMTE.DCOM1.Connected then Exit;
   FParametros := TFParametros.Create( Application );
   If DMTE.fg_VerificaVersion(FParametros.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no est� actualizado.'+#13+'Comun�quese con Soporte T�cnico');
			Application.Terminate;
      Exit;
   End;
End;


end.

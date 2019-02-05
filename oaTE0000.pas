Unit oaTE0000;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaTE0000
// FORMULARIO               : FTEIni
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Formulario inicial que contiene las funcionalidades
//                            que permiten acceder a las opciones de parámetros generales

// ACTUALIZACIONES:
//HPC_201207_CAJA 21/09/2012:  Se implementó el control de versiones
//HPC_201304_CAJA 24/04/2013:  Cambio de Versión a 20130424180000
//HPC_201305_CAJA 06/05/2013:  Cambio de Versión a 20130506180000
//HPC_201306_CAJA 07/06/2013:  Cambio de Versión a 20130720083000
//HPC_201308_CAJA 14/08/2013:  Cambio de Versión a 20130821083000
//HPC_201401_CAJA 27/05/2013:  Cambio de Versión a 20140625083000
//HPC_201603_CAJA 27/12/2016:  Cambio de Versión a 20161228083000
//CAJA_201804     09/11/2018:  Cambio de Control de Versión a CAJA-201804, cambio solo en el DFM

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, oaVariables, wwclient, Mant, StdCtrls;

Type
   TFTEIni = Class(TForm)
      lblVersion: TLabel;
   Private
    { Private declarations }
   Public
      MantHelp: TMant;
    { Public declarations }
   End;

   Procedure TEDataModulo; stdcall;
   Procedure TEMantenimientoAccesos; stdcall;
   Procedure TEOpcionAccesos; stdcall;
   Procedure TEOpcionAccesosShow; stdcall;
   Procedure TEMantenimientoAyudaMant; stdcall;
   Procedure TEVerificaVersion; stdcall;

Exports
   TEDataModulo,
   TEMantenimientoAccesos,
   TEOpcionAccesos,
   TEOpcionAccesosShow,
   TEVerificaVersion,
   TEMantenimientoAyudaMant;

Var
   FTEIni: TFTEIni;

Implementation

{$R *.dfm}
// Inicio HPC_201308_CAJ
// Se añade módulo de datos de BPL del Maestro de Clientes
Uses CAJADM;
// Fin HPC_201308_BAN

Procedure TEDataModulo;
Begin
   Application.Initialize;
   Try
      If (DMTE = Nil) Or (DMTE.sClose = '1') Then
      Begin
         FVariables := TFVariables.Create(Application);
         DMTE := TDMTE.Create(Application);
         If DMTE.sClose = '1' Then
         Begin
            DMTE.Free;
            DMTE := Nil;
         End;
      End;
   Finally
   End;
End;

Procedure TEMantenimientoAccesos;
Begin

End;

Procedure TEOpcionAccesos;
Begin

End;

Procedure TEOpcionAccesosShow;
Begin

End;

Procedure TEMantenimientoAyudaMant;
Begin
   FVariables.cdsTempVar := TwwClientDataSet(DMTE.FindComponent(FVariables.dblcTempVar.LookupTable.Name));
   FTEIni := TFTEIni.Create(Nil);
   FTEIni.MantHelp := TMant.Create(Application);
   FTEIni.MantHelp.ClientDataSet := FVariables.cdsTempVar;
   FTEIni.MantHelp.Module := DMTE.wModulo;
   FTEIni.MantHelp.Tipo := 'HELP';
   FTEIni.MantHelp.Admin := 'N';
   FTEIni.MantHelp.DComC := DMTE.DCOM1;
   FTEIni.MantHelp.User := DMTE.wUsuario;
   FTEIni.MantHelp.Execute;
End;

Procedure TEVerificaVersion;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   FTEIni := TFTEIni.Create(Application);
   If DMTE.fg_VerificaVersion(FTEIni.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;

End.


unit oaTE5000;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaTE5000
// FORMULARIO               : FProcesos
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Formulario inicial que contiene las funcionalidades
//                            de la opción de consultas en el menú

// ACTUALIZACIONES:
// HPC_201207_CAJA 21/09/2012:  Se implementó el control de versiones
// HPC_201305_CAJA 06/05/2013:  Cambio de Versión a 20130506180000
// HPC_201306_CAJA 07/06/2013:  Cambio de Versión a 20130720083000
// HPC_201308_CAJA 14/08/2013:  Cambio de Versión a 20130821083000
// HPC_201401_CAJA 04/03/2014:  Apertura de Caja para control de Fondo Fijo
//                 27/05/2013:  Cambio de Versión a 20140625083000
// HPC_201603_CAJA 27/12/2016:  Cambio de Versión a 20161228083000
// CAJA_201804     09/11/2018:  Cambio de Control de Versión a CAJA-201804, cambio solo en el DFM

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mant, db, StdCtrls;

type
     RCabComprobante = record
       CiaDes,
       Forma,
       CIAID,
       TDIARID,
       Diario,
       Proveedor,
       GiradoA,
		 numchq,
       banco,
       cuenta,
		 Moneda,
       Glosa,
       Lote,
       TipoDoc,
       TipoCamb,
		 Periodo,
       NoComp,
       NoDoc,
       FPagoDes,
       Importe,
       Tmoneda : String;
		 Banco2 : String;
  end;


  TFProcesos = class(TForm)
    lblVersion: TLabel;

  private
    { Private declarations }
		procedure evt_Delete(Sender: TObject; MantFields: TFields);
  public
    { Public declarations }
    xModulo : String;
    xFiltroContab : TMant;
  end;

  procedure TECierreOperativo; stdcall;
  procedure TECierreMensual; stdcall;
  procedure TEAperturaDiaria; stdcall;
   //INICIO HPC_201207_CAJA
   procedure TEVerificaVersion; stdcall;
   //FIN HPC_201207_CAJA
exports
  TECierreOperativo,
  TECierreMensual,
  //INICIO HPC_201207_CAJA
  TEVerificaVersion,
  //FIN HPC_201207_CAJA
  TEAperturaDiaria;

var
  FProcesos: TFProcesos;

implementation

{$R *.dfm}

USES CAJADM, CAJA216, CAJA227, CAJA241;

// CAJA216   FCierreDiario         Cierre Diario
// CAJA227   FCierreMensual        Cierre Mensual
// CAJA241   FRecalculo            Apertura Diaria



procedure TECierreOperativo;
begin
   if DMTE=nil then exit;
  if not DMTE.DCOM1.Connected then Exit;
  try
    FCierreDiario:=TFCierreDiario.Create( Application );
    FCierreDiario.ShowModal;
  Finally
    FCierreDiario.Free;
  end;
end;


procedure TECierreMensual;
var
   xSQL : String;
begin
   if DMTE=nil then exit;
  if not DMTE.DCOM1.Connected then Exit;
  try
    xSQL := 'Select A.BANCOID, A.CCBCOID, C.BANCONOM'
          +' From TGE106 A,TGE105 C'
          +' Where A.CIAID=''ZZ'' AND A.BANCOID = C.BANCOID';

    DMTE.cds1.Close;
    DMTE.cds1.DataRequest(xSQL);
    DMTE.cds1.Open;

    FCierreMensual:=TFCierreMensual.Create( Application );
    FCierreMensual.ShowModal;
  Finally
    FCierreMensual.Free;
    DMTE.cds1.Filter   := '';
    DMTE.cds1.Filtered := False;
    DMTE.cds1.IndexFieldNames := '';
    DMTE.cds1.Close;
  end;
end;


procedure TEAperturaDiaria;
begin
// Inicio HPC_201401_CAJA
   if DMTE=nil then exit;
   if not DMTE.DCOM1.Connected then Exit;
   try
   // CAJA241.pas
      FRecalculo := TFRecalculo.Create( Application );
      FRecalculo.ShowModal;
   finally
      FRecalculo.Free;
      DMTE.cdsBancoEgr.Close;
   end;
// Fin HPC_201401_CAJA
end;


procedure TFProcesos.evt_Delete;
begin
	 ShowMessage( 'No se Puede Eliminar');
end;
//INICIO HPC_201207_CAJA
Procedure TEVerificaVersion;
Begin
   if DMTE=nil then exit;
   if not DMTE.DCOM1.Connected then Exit;
   FProcesos := TFProcesos.Create( Application );
   If DMTE.fg_VerificaVersion(FProcesos.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.'+#13+'Comuníquese con Soporte Técnico');
			Application.Terminate;
      Exit;
   End;
End;
//FIN HPC_201207_CAJA
end.

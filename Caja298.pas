unit Caja298;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : Caja298
// FORMULARIO               : FChqEntregado
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Pone Fecha al Cheque por Reposición

// ACTUALIZACIONES:
// HPC_201401_CAJA 28/04/2014 : Actualiza Saldo en la tabla de cierre diario

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, wwdbedit, ExtCtrls, wwdbdatetimepicker, CAJADM;

type
  TFChqEntregado = class(TForm)
    Label1: TLabel;
    dtpFecEntChq: TwwDBDateTimePicker;
    Panel1: TPanel;
    lblNoChq: TLabel;
    dbeNoChq: TwwDBEdit;
    Label24: TLabel;
    dbdtpFEmis: TwwDBDateTimePicker;
    lblImporte: TLabel;
    dbeImporte: TwwDBEdit;
    Z2bbtnSalir: TBitBtn;
    z2bbtnGraba: TBitBtn;
    procedure z2bbtnGrabaClick(Sender: TObject);
    procedure Z2bbtnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      // Inicio HPC_201401_CAJA  28/02/2014  -  Movimientos de Caja Chica
      sCuentaCajaChica:String;
      // Fin HPC_201401_CAJA  28/02/2014  -  Movimientos de Caja Chica    
  end;

var
  FChqEntregado: TFChqEntregado;

implementation

uses oaTE2000;

{$R *.dfm}

procedure TFChqEntregado.z2bbtnGrabaClick(Sender: TObject);
var
   xSQL, sCajaChica, xCuentaCajaChica : String; // HPC_201401_CAJA
begin
// Inicio HPC_201401_CAJA
// Reposición de Caja Chica

// Ver si la caja esta aperturada
   xSQL:='Select A.CUENTAID, B.BANCOID '
        +'  from CAJA201 A, TGE105 B '
        +' where A.CPTOID='''+FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CPTOID').AsString+''' AND A.CUENTAID=B.CUENTAID(+)';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataReQuest(xSQL);
   DMTE.cdsQry.Open;

   sCajaChica       := DMTE.cdsQry.FieldByName('BANCOID').AsString;
   xCuentaCajaChica := DMTE.cdsQry.FieldByName('CUENTAID').AsString;

   if DMTE.cdsQry.FieldByName('CUENTAID').AsString=sCuentaCajaChica then
   begin
      xSQL:='select * '
           +'  from CAJA310 '
           +' where BANCOID='+quotedstr(sCajaChica)
           +'   and STFECHA='+quotedstr(datetostr(dtpFecEntChq.datetime));
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataReQuest(xSQL);
      DMTE.cdsQry.Open;
      if DMTE.cdsQry.Recordcount<0 then
      begin
         ShowMessage('Caja del '+datetostr(dtpFecEntChq.datetime)+' no ha sido aperturada');
         exit;
      end;
   end;

   DMTE.DCOM1.AppServer.IniciaTransaccion;
   xSigueGrab := True;
   xSQL := 'Update CAJA302 '
          +'   set ECFPAGOP='+quotedstr(datetostr(dtpFecEntChq.datetime))
          +' where CIAID='  +quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString   )
          +'   and TDIARID=' +quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('TDIARID').AsString )
          +'   and ECANOMM=' +quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString )
          +'   and ECNOCOMP='+quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECNOCOMP').AsString);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      DMTE.DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('Error al intentar grabar la Fecha de Entrega del Cheque al Proveedor');
      Exit;
   End;

   if xCuentaCajaChica=sCuentaCajaChica then
   begin
      DMTE.ActSaldosCaja(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString,
                         FRegistro.xFiltroEgr.FMant.cds2.FieldByName('TMONID').AsString,
                         sCajaChica,
                         FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECMTOORI').AsString,
                         'I',
                         dtpFecEntChq.Text);
      if not xSigueGrab then
      begin
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      end;
   end;
   ShowMessage('Fecha de Entrega del Cheque actualizada con éxito');
   Close;
// Fin HPC_201401_CAJA
end;

procedure TFChqEntregado.Z2bbtnSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFChqEntregado.FormCreate(Sender: TObject);
VAR   xWhere:String;
begin
// Inicio HPC_201401_CAJA  28/04/2014  -  Movimientos de Caja Chica
   xWhere:='select BANCOID, BANCONOM, CUENTAID from TGE105 where FLACAJCHI=''S'' ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xWhere);
   DMTE.cdsQry.Open;
   sCuentaCajaChica:=DMTE.cdsQry.FieldByName('CUENTAID').AsString;
// Fin HPC_201401_CAJA  28/04/2014  -  Movimientos de Caja Chica
end;

end.

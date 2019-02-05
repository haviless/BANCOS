unit Caja704;

// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : Caja704
// FORMULARIO               : FToolEgresos
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Tool de Egresos

// ACTUALIZACIONES:
// HPC_201401_CAJA 03/03/2014 : Se pone en invisible botón de pagos Provisionados, ya que cumple la misma
//                              función que el botón de Pago Global, para evitar un mantenimiento innecesario
//                 26/02/2014 : Boton para Rendición de Caja Chica
// HPC_201603_CAJA 08/04/2016 : Formulario Nuevo para Registro Global (Caja296 a Caja297)
// HPC_201701_CAJA Ocultar botón Ajusta CNT (Sólo se ha modificado en diseño)
// HPC_201801_CAJA Ajustes en la Anulación de los cheques de Filiales

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons;

type
  TFToolEgresos = class(TForm)
    pnl: TPanel;
    Z2bbtnPagDocNoProv: TBitBtn;
    Z2bbtnPagDocProv: TBitBtn;
    Z2bbtnPagProvBco: TBitBtn;
    Z2bbtnCompensa: TBitBtn;
    Z2bbtnEmiChq: TBitBtn;
    bbtnPagoGlobal: TBitBtn;
    Label1: TLabel;
    bbtnChqEnt: TBitBtn;
    BitBtn1: TBitBtn;
    bbtnSaldo: TBitBtn;
    bbtnVouchersXX: TBitBtn;
    sbDisenoRep: TSpeedButton;
    bbtnAjustaCNT: TBitBtn; // HPC_201401_CAJA	
// Inicio HPC_201801_CAJA
// CAJA Ajustes en la Anulación de los cheques de Filiales
    sbtEliminar: TSpeedButton; 							  
// Fin HPC_201801_CAJA
    procedure Z2bbtnPagDocNoProvClick(Sender: TObject);
    procedure Z2bbtnPagDocProvClick(Sender: TObject);
    procedure Z2bbtnPagProvBcoClick(Sender: TObject);
    procedure Z2bbtnCompensaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z2bbtnEmiChqClick(Sender: TObject);
    procedure bbtnPagoGlobalClick(Sender: TObject);
    procedure bbtnChqEntClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bbtnSaldoClick(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);
    procedure bbtnVouchersXXClick(Sender: TObject);
    procedure bbtnAjustaCNTClick(Sender: TObject);	// HPC_201401_CAJA
// Inicio HPC_201801_CAJA
// CAJA Ajustes en la Anulación de los cheques de Filiales    
    procedure sbtEliminarClick(Sender: TObject); 
// Fin HPC_201801_CAJA 
  private
    { Private declarations }

  public
    { Public declarations }
    procedure egr_InsertEgreso_Pago_NoProvisionado;
    procedure egr_InsertEgreso_Pago_Provisionado;
    procedure egr_InsertEgreso_Pago_ProvBanco;
    procedure egr_InsertEgreso_Pago_Compensa;
    procedure egr_InsertEgreso_Rendicion_CajaChica;  // HPC_201401_CAJA

  end;

var
  FToolEgresos: TFToolEgresos;

implementation

// Inicio HPC_201603_CAJA
// 04/04/2016  Creación de Formulario para Registro Global (Cambio de CAJA296 a CAJA297)
//uses CajaDM, Caja201, Caja228, Caja247, Caja263, oaTE2000, Caja296, Caja298, CAJA258,CAJA704A;
uses CajaDM, Caja201, Caja228, Caja247, Caja263, oaTE2000, Caja297, Caja298, CAJA258, CAJA704A;
// Fin HPC_201603_CAJA

{$R *.DFM}

// Inicio HPC_201401_CAJA 26/02/2014 : Boton para Rendición de Caja Chica
procedure TFToolEgresos.BitBtn1Click(Sender: TObject);
begin
   egr_InsertEgreso_Rendicion_CajaChica;
end;
// Fin HPC_201401_CAJA 26/02/2014 : Boton para Rendición de Caja Chica


// Inicio HPC_201401_CAJA 26/02/2014 : Boton para Rendición de Caja Chica
procedure TFToolEgresos.egr_InsertEgreso_Rendicion_CajaChica;
var
   xSQL : String;
begin
  Try
  // Inicio HPC_201603_CAJA
  // 08/04/2016 : Cambia Formulario Nuevo para Registro Global (Caja296 a Caja297)
     //if (FPagoFacturas<>nil) or (FPagoGlobal<>nil) or (FEgresoCaja<>nil) or (FRendicionCaja<>nil) then
     if (FPagoFacturas<>nil) or (FPagoGlobal2<>nil) or (FEgresoCaja<>nil) or (FRendicionCaja<>nil) then
  // Fin HPC_201603_CAJA
     begin
        ShowMessage('Esta opción esta en Uso');
        Exit;
     end;

     xSQL:='Select CIAID, TDIARID, ECANOMM, ECNOCOMP, CLAUXID, PROV, PROVRUC, ECFCOMP, ECFEMICH, ECFPAGOP, '
          +'       ECFCOBCH, FPAGOID, DOCID, ECNODOC, TMONID, ECTCAMB, ECMTOORI, ECMTOLOC, ECMTOEXT, BANCOID, CCBCOID, '
          +'       ECNOCHQ, ECGIRA, CPTOID, CUENTAID, ECGLOSA, ECLOTE, ECELABO, ECAPROB, ECESTADO, ECCONTA, ECUSER, '
          +'       ECFREG, ECHREG, ECANO, ECMM, ECDD, ECSS, ECSEM, ECTRI, ECAASS, ECAASEM, ECAATRI, FLAGVAR, EC_PROCE, '
          +'       ECOPAGO, TDIARIO2, ECNOCOMP2, ECANOMM2, EC_IE, ECCHQEMI, USERRESP, EQUIID, ECCHKEST, ECPERNDOC, '
          +'       ECPERREC, TIPDOCCOD, PERID, ECFENTR, ECCONSOLID, ECMTCON, ECFCV, ECCOBLOC, ECMTDIF, ECCOBEXT, ECDEVLOC, '
          +'       ECDEVEXT, FEXTCHQ, FLUEID, ECCONING, ECNOREPO, CLAUXID1, AUXID, PROV1, CCBCOVOUCH, PRVBANCOID, PRVCCBCOID, '
          +'       ECSALMN, ECSALME, CAJARETIGV, FDOFIJJUST, GCONCID, TIPDET, ECNOCOMPR, CNTCOMPROB '
          +'  from CAJA302 '
          +' Where CIAID=''' + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString + ''' '
          +'   and TDIARID=''' + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('TDIARID').AsString + ''' '
          +'   and ECANOMM=''' + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString + ''' '
          +'   and ECNOCOMP=''' + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECNOCOMP').AsString + ''' '
          +'   and ECESTADO=''C'' and EC_PROCE=''1''';
     DMTE.cdsLiq305.Close;
     DMTE.cdsLiq305.Filter := '';
     DMTE.cdsLiq305.DataRequest(xSQL);
     DMTE.cdsLiq305.open;

     if DMTE.cdsLiq305.FieldByname('CPTOID').AsString<>'EG0141' then
     begin
        ShowMessage('Movimiento de Caja NO genera Rendición de Cuenta');
        Exit;
     end;

     If Not DiaAperturado(DMTE.cdsLiq305.FieldByname('CIAID').AsString, DateS, DMTE.cdsLiq305.FieldByname('BANCOID').AsString) Then
     Begin
        Exit;
     End;

     xSQL := 'Select ECANOMM, TDIARID, ECNOCOMP, ECFCOMP '
            +'  from CAJA302 '
            +' Where CIAID=''' + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString   + ''' '
            +'   and TDIARID=''' + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('TDIARID').AsString + ''' '
            +'   and PROV='''    + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('PROV').AsString    + ''' '
            +'   and DOCID='''   + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('DOCID').AsString   + ''' '
            +'   and ECNODOC=''' + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECNODOC').AsString + ''' '
            +'   and ECMTOORI='  + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECMTOORI').AsString+ ' '
            +'   and ECFCOMP>=to_date(sysdate)-30 '
            +'   and EC_PROCE = ''I'' and ECESTADO = ''C''';
     DMTE.cdsQry.Close;
     DMTE.cdsQry.Datarequest(xSQL);
     DMTE.cdsQry.Open;
     if DMTE.cdsQry.Recordcount>0 then
     begin
        ShowMessage('Rendición de Cuenta generada.'+chr(13)+
                    'Dia      : '+DMTE.cdsQry.FieldByName('ECFCOMP').AsString+chr(13)+
                    'Origen   : '+DMTE.cdsQry.FieldByName('TDIARID').AsString+chr(13)+
                    'Comprobante : '+DMTE.cdsQry.FieldByName('ECNOCOMP').AsString
                    );
        Exit;
     end;

     //rmz
     xSql:=' Select ECANOMM, TDIARID, ECNOCOMP, ECFCOMP,ECESTADO,ECMTOORI '
            +' From CAJA302 '
            +' Where CIAID=''' + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString   + ''' '
            +'   and TDIARID=''' + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('TDIARID').AsString + ''' '
            +'   and PROV='''    + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('PROV').AsString    + ''' '
            +'   and DOCID='''   + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('DOCID').AsString   + ''' '
            +'   and ECNODOC=''' + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECNODOC').AsString + ''' '
            +'   and ECFCOMP>=to_date(sysdate)-30 '
            +'   and EC_PROCE = ''I'' and ECESTADO NOT IN (''C'',''A'') ';
     DMTE.cdsQry.Close;
     DMTE.cdsQry.Datarequest(xSQL);
     DMTE.cdsQry.Open;            
      if DMTE.cdsQry.Recordcount>0 then
     begin
        ShowMessage('Rendición de Cuenta pendiente en Vou.'+DMTE.cdsQry.FieldByName('ECNOCOMP').AsString+' '+chr(13)+
                    'Dia      : '+DMTE.cdsQry.FieldByName('ECFCOMP').AsString+chr(13)+
                    'Origen   : '+DMTE.cdsQry.FieldByName('TDIARID').AsString+chr(13)+
                    'Comprobante : '+DMTE.cdsQry.FieldByName('ECNOCOMP').AsString+chr(13)+
                    'Imp. Rendido: '+DMTE.cdsQry.FieldByName('ECMTOORI').AsString+chr(13)
                    );
        Exit;
     end;
     //rmz

     DMTE.cdsEgrCaja.Data:=FRegistro.xFiltroEgr.FMant.cds2.Data;
     DMTE.cdsEgrCaja.GotoCurrent( FRegistro.xFiltroEgr.FMant.cds2 );

	// Registro de Pago de Proveedores
     DMTE.FiltraTabla( DMTE.cdsBancoEgr, 'TGE105', 'BANCOID' );
     DMTE.cdsBancoEgr.Filter   := '';
     DMTE.cdsBancoEgr.Filtered := False;
     DMTE.cdsBancoEgr.IndexFieldNames := 'BANCOID';

     DMTE.cdsNivel.Open;
     DMTE.FiltraTabla(DMTE.cdsCCBco,'TGE106', 'CCBCOID' );
     DMTE.FiltraTabla(DMTE.cdsFEfec,'TGE217', 'FLUEFEID' );
     DMTE.FiltraTabla(DMTE.cdsEquiv,'TGE160', '' );

     DMTE.FiltraTabla(DMTE.cdsTDoc,    'TGE110', 'DOCID' );
     DMTE.cdsTDoc.Filter   :=' (DOCMOD=''CAJA'' OR DOCMOD=''CXP'' ) '; // and (FCING<>''S'' or FCING<>''1'')';
     DMTE.cdsTDoc.Filtered := True;

     DMTE.cdsClaseAux.Filter   := ' ( CLAUXCP=''P'' OR CLAUXCP=''A'' ) ';
     DMTE.cdsClaseAux.Filtered := True;

     DMTE.wModo := 'A';
     FRendicionCaja  := TFRendicionCaja.Create( Application );
     FRendicionCaja.ActiveMDIChild;
  Finally
  {
     FEgresoCaja.Free ;
     }
  end;
end;
// Fin HPC_201401_CAJA 26/02/2014 : Boton para Rendición de Caja Chica

procedure TFToolEgresos.egr_InsertEgreso_Pago_NoProvisionado;
var
   xSQL : String;
begin
  Try
     if (FPagoFacturas<>nil) or (FPagoGlobal2<>nil) or (FEgresoCaja<>nil) then
     begin
        ShowMessage('Esta opción esta en Uso');
        Exit;
     end;

     DMTE.cdsEgrCaja.Data:=FRegistro.xFiltroEgr.FMant.cds2.Data;
     DMTE.cdsEgrCaja.GotoCurrent( FRegistro.xFiltroEgr.FMant.cds2 );

  // Registro de Pago de Proveedores
     DMTE.FiltraTabla( DMTE.cdsBancoEgr, 'TGE105', 'BANCOID' );
     DMTE.cdsBancoEgr.Filter   := '';
     DMTE.cdsBancoEgr.Filtered := False;
     DMTE.cdsBancoEgr.IndexFieldNames := 'BANCOID';

     DMTE.cdsNivel.Open;
     DMTE.FiltraTabla(DMTE.cdsCCBco,'TGE106', 'CCBCOID' );
     DMTE.FiltraTabla(DMTE.cdsFEfec,'TGE217', 'FLUEFEID' );
     DMTE.FiltraTabla(DMTE.cdsEquiv,'TGE160', '' );

     DMTE.FiltraTabla(DMTE.cdsTDoc,    'TGE110', 'DOCID' );
     DMTE.cdsTDoc.Filter   :=' (DOCMOD=''CAJA'' OR DOCMOD=''CXP'' ) '; // and (FCING<>''S'' or FCING<>''1'')';
     DMTE.cdsTDoc.Filtered := True;

     DMTE.cdsClaseAux.Filter   := ' ( CLAUXCP=''P'' OR CLAUXCP=''A'' ) ';
     DMTE.cdsClaseAux.Filtered := True;

     DMTE.wModo := 'A';
     FEgresoCaja  := TFEgresoCaja.Create( Application );
     FEgresoCaja.ActiveMDIChild;
  Finally
  {
     FEgresoCaja.Free ;
     }
  end;
end;

procedure TFToolEgresos.egr_InsertEgreso_Pago_Provisionado;
var
   xSQL : string;
begin
  Try
     if (FPagoFacturas<>nil) or (FPagoGlobal2<>nil) or (FEgresoCaja<>nil) then
     begin
        ShowMessage('Esta opción esta en Uso');
        Exit;
     end;

     DMTE.cdsEgrCaja.Data:=FRegistro.xFiltroEgr.FMant.cds2.Data;
     DMTE.cdsEgrCaja.GotoCurrent( FRegistro.xFiltroEgr.FMant.cds2 );

     DMTE.FiltraTabla( DMTE.cdsBancoEgr,'TGE105', 'BANCOID' );
     DMTE.cdsBancoEgr.Filter   := '';
     DMTE.cdsBancoEgr.Filtered := False;
     DMTE.cdsBancoEgr.IndexFieldNames := 'BANCOID';
     DMTE.cdsNivel.Open;
     DMTE.cdsTDiario1.Open;

     DMTE.cdsMovCxP.open;
     DMTE.FiltraTabla( DMTE.cdsCCBco,'TGE106', 'CCBCOID'  );
     DMTE.FiltraTabla( DMTE.cdsFEfec,'TGE217', 'FLUEFEID' );
     DMTE.FiltraTabla( DMTE.cdsEquiv,'TGE160', '' );
     DMTE.FiltraTabla(DMTE.cdsTDoc,    'TGE110', 'DOCID' );
     DMTE.cdsTDoc.Filter:=' (DOCMOD=''CAJA'' OR DOCMOD=''CXP'')  ';
     DMTE.cdsTDoc.Filtered:=True;

     DMTE.cdsAux.IndexFieldNames:='';
     DMTE.cdsAux.Filter:='';
     if not DMTE.cdsAux.Active then
     begin
        xSQL:='select CLAUXID,AUXID,AUXRUC,AUXNOMB,AUXABR from CNT201';
        DMTE.cdsAux.Close;
        DMTE.cdsAux.DataRequest( xSQL ) ;
        DMTE.cdsAux.Open;
     end;

     DMTE.cdsClaseAux.Filter   := ' ( CLAUXCP=''P'' OR CLAUXCP=''A'' ) ';
     DMTE.cdsClaseAux.Filtered := True;
     DMTE.cdsCnpEgr.Filtered   := False;
     DMTE.cdsCnpEgr.Filter     := '';
     DMTE.cdsCnpEgr.Filter     := 'CPTOIS=''E''';
     DMTE.cdsCnpEgr.Filtered   := True;
     DMTE.wModo := 'A';
     FPagoFacturas := TFPagoFacturas.Create ( Application ) ;
     FPagoFacturas.AsignaCDSFiltro( FRegistro.xFiltroEgr.FMant.cds2) ;
     TRY
       FPagoFacturas.ActiveMDIChild;
     except
       ShowMessage('Sucedió un Error En la Apertura') ;
     end ;

   finally
     {
     FPagoFacturas.Free;
     DMTE.cdsBancoEgr.Filter   := '';
     DMTE.cdsBancoEgr.Filtered := False;
     DMTE.cdsBancoEgr.IndexFieldNames := '';
     DMTE.cdsBancoEgr.Close;
     DMTE.cdsClaseAux.Filter   := '';
     DMTE.cdsClaseAux.Filtered := False;
     DMTE.cdsCnpEgr.Filter     := '';
     DMTE.cdsCnpEgr.Filtered   := False;
     DMTE.cdsCCBco.Filter   := '';
     DMTE.cdsCCBco.Filtered := False;
     DMTE.cdsCCBco.IndexFieldNames := '';
     DMTE.cdsCCBco.Close;
     }
   end ;
end;

procedure TFToolEgresos.egr_InsertEgreso_Pago_ProvBanco;
var
   xSQL : String;
begin
   DMTE.cdsEgrCaja.Data:=FRegistro.xFiltroEgr.FMant.cds2.Data;
   DMTE.cdsEgrCaja.GotoCurrent( FRegistro.xFiltroEgr.FMant.cds2 );

// Registro de Pago a Varios Provedores
   Try
      DMTE.cdsRegCxP.PacketRecords := 1;
      DMTE.cdsRegCxP.Open;
      DMTE.cdsEmpleado.Open;
      DMTE.FiltraTabla(DMTE.cdsBancoEgr,'TGE105', 'BANCOID' );
{     DMTE.cdsBancoEgr.Filter:=' (BCOTIPCTA=''B'')  ';
     DMTE.cdsBancoEgr.Filtered:=True;}
      DMTE.cdsBancoEgr.Filter   := '';
      DMTE.cdsBancoEgr.Filtered := False;
      DMTE.cdsBancoEgr.IndexFieldNames := 'BANCOID';

      DMTE.FiltraTabla(DMTE.cdsCCBco,    'TGE106', 'CCBCOID' );
      DMTE.FiltraTabla(DMTE.cdsEquiv,    'TGE160', 'FPAGOID' );
      DMTE.FiltraTabla(DMTE.cdsTDiario1, 'TGE104', 'TDIARID' );
      DMTE.FiltraTabla(DMTE.cdsFEfec,    'TGE217', 'FLUEFEID' );
      DMTE.FiltraTabla(DMTE.cdsNivel,    'CNT202', 'NIVEL' );

      DMTE.FiltraTabla(DMTE.cdsTDoc,    'TGE110', 'DOCID' );
      DMTE.cdsTDoc.Filter   := '(DOCMOD=''CAJA'' OR DOCMOD=''CXP'') ';
      DMTE.cdsTDoc.Filtered := True;

      DMTE.cdsClaseAux.Filter   := ' ( CLAUXCP=''P'' OR CLAUXCP=''A'' OR CLAUXCP=''B'') ';
      DMTE.cdsClaseAux.Filtered := True;
      DMTE.cdsCnpEgr.Filter   := 'CPTOIS=''E''';
      DMTE.cdsCnpEgr.Filtered := True;

      DMTE.wModo := 'A';
      FPagoProvBco := TFPagoProvBco.Create( Application );
      FPagoProvBco.AsignaCDSFiltro( FRegistro.xFiltroEgr.FMant.cds2) ;
      try
        FPagoProvBco.ActiveMDIChild;
      except
        ShowMessage('Sucedió un ERROR') ;
      end ;

   Finally
     {
      FPagoProvBco.Free ;
      DMTE.cdsBancoEgr.Filter   := '';
      DMTE.cdsBancoEgr.Filtered := False;
      DMTE.cdsBancoEgr.IndexFieldNames := '';
      DMTE.cdsBancoEgr.Close;
      DMTE.cdsRegCxP.Close;
      DMTE.cdsEmpleado.Close;
      DMTE.cdsRegCxP.PacketRecords := -1;
      DMTE.cdsTDoc.Filter   := '';
      DMTE.cdsTDoc.Filtered := False;
      DMTE.cdsClaseAux.Filter   := '';
      DMTE.cdsClaseAux.Filtered := False;
      DMTE.cdsCnpEgr.Filter   := '';
      DMTE.cdsCnpEgr.Filtered := False;
      DMTE.cdsCCBco.Filter   := '';
      DMTE.cdsCCBco.Filtered := False;
      DMTE.cdsCCBco.IndexFieldNames := '';
      DMTE.cdsCCBco.Close;
      DMTE.cdsEquiv.Filter   := '';
      DMTE.cdsEquiv.Filtered := False;
      DMTE.cdsEquiv.IndexFieldNames := '';
      DMTE.cdsEquiv.Close;
      DMTE.cdsTDiario1.Filter   := '';
      DMTE.cdsTDiario1.Filtered := False;
      DMTE.cdsTDiario1.IndexFieldNames := '';
      DMTE.cdsTDiario1.Close;
      DMTE.cdsFEfec.Filter   := '';
      DMTE.cdsFEfec.Filtered := False;
      DMTE.cdsFEfec.IndexFieldNames := '';
      DMTE.cdsFEfec.Close;
      DMTE.cdsNivel.Filter   := '';
      DMTE.cdsNivel.Filtered := False;
      DMTE.cdsNivel.IndexFieldNames := '';
      DMTE.cdsNivel.Close;
      DMTE.cdsTDoc.Filter   := '';
      DMTE.cdsTDoc.Filtered := False;
      DMTE.cdsTDoc.IndexFieldNames := '';
      DMTE.cdsTDoc.Close;
      }
   end ;
end;

procedure TFToolEgresos.Z2bbtnPagDocNoProvClick(Sender: TObject);
begin
   egr_InsertEgreso_Pago_NoProvisionado;
end;

procedure TFToolEgresos.Z2bbtnPagDocProvClick(Sender: TObject);
begin
   egr_InsertEgreso_Pago_Provisionado;
end;

procedure TFToolEgresos.Z2bbtnPagProvBcoClick(Sender: TObject);
begin
   egr_InsertEgreso_Pago_ProvBanco;
end;

procedure TFToolEgresos.Z2bbtnCompensaClick(Sender: TObject);
begin
   egr_InsertEgreso_Pago_Compensa;
end;

procedure TFToolEgresos.egr_InsertEgreso_Pago_Compensa;
var
   xSQL : String;
begin
   Try
      DMTE.cdsEgrCaja.Data:=FRegistro.xFiltroEgr.FMant.cds2.Data;
      DMTE.cdsEgrCaja.GotoCurrent( FRegistro.xFiltroEgr.FMant.cds2 );

      xSQL := 'SELECT DISTINCT TGE106.CIAID,TGE105.* FROM TGE105, TGE106'
             +' WHERE TGE105.BANCOID = TGE106.BANCOID AND '+DMTE.wReplacCeros+'(TGE106.CCBCOID,''XX'')<>''XX'' ';
      DMTE.FiltraCds(DMTE.cdsBancoEgr, xSQL);

      DMTE.cdsBancoEgr.Filter   := '';
      DMTE.cdsBancoEgr.Filtered := False;
      DMTE.cdsBancoEgr.IndexFieldNames := '';
      DMTE.cdsNivel.Open;
      DMTE.cdsTDiario1.Open;

      DMTE.cdsMovCxP.open;
      DMTE.FiltraTabla( DMTE.cdsCCBco, 'TGE106', 'CCBCOID'  );
      DMTE.FiltraTabla( DMTE.cdsFEfec, 'TGE217', 'FLUEFEID' );
      DMTE.FiltraTabla( DMTE.cdsEquiv, 'TGE160', '' );

      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID' );
      DMTE.cdsTDoc.Filter   := ' (DOCMOD = ''CAJA'' OR DOCMOD=''CXP'')  ';
      DMTE.cdsTDoc.Filtered := True;

      DMTE.cdsAux.IndexFieldNames := '';
      DMTE.cdsAux.Filter :='';
      if not DMTE.cdsAux.Active then
      begin
         xSQL := 'Select CLAUXID, AUXID, AUXRUC, AUXNOMB, AUXABR From CNT201';
         DMTE.cdsAux.Close;
         DMTE.cdsAux.DataRequest( xSQL ) ;
         DMTE.cdsAux.Open;
      end;

      DMTE.cdsClaseAux.Filter   := ' ( CLAUXCP=''P'' OR CLAUXCP=''A'' ) ';
      DMTE.cdsClaseAux.Filtered := True;
      DMTE.cdsCnpEgr.Filtered   := False;
      DMTE.cdsCnpEgr.Filter     := '';
      DMTE.cdsCnpEgr.Filter     := 'CPTOIS=''E''';
      DMTE.cdsCnpEgr.Filtered   := True;

      DMTE.wModo := 'A';
      FPagoCompensa := TFPagoCompensa.Create ( Application );
      FPagoCompensa.AsignaCDSFiltro( FRegistro.xFiltroEgr.FMant.cds2) ;
      TRY
         FPagoCompensa.ActiveMDIChild;
      except
         Showmessage('Sucedió un Error En la Apertura') ;
      end ;

   finally
     {
     FPagoCompensa.Free ;
     DMTE.cdsBancoEgr.Filter   := '';
     DMTE.cdsBancoEgr.Filtered := False;
     DMTE.cdsBancoEgr.IndexFieldNames := '';
     DMTE.cdsBancoEgr.Close;
     DMTE.cdsClaseAux.Filter   := '';
     DMTE.cdsClaseAux.Filtered := False;
     DMTE.cdsCnpEgr.Filter     := '';
     DMTE.cdsCnpEgr.Filtered   := False;
     DMTE.cdsCCBco.Filter   := '';
     DMTE.cdsCCBco.Filtered := False;
     DMTE.cdsCCBco.IndexFieldNames := '';
     DMTE.cdsCCBco.Close;
     DMTE.cdsFEfec.Filter   := '';
     DMTE.cdsFEfec.Filtered := False;
     DMTE.cdsFEfec.IndexFieldNames := '';
     DMTE.cdsFEfec.Close;
     DMTE.cdsEquiv.Filter   := '';
     DMTE.cdsEquiv.Filtered := False;
     DMTE.cdsEquiv.IndexFieldNames := '';
     DMTE.cdsEquiv.Close;
     DMTE.cdsTDoc.Filter   := '';
     DMTE.cdsTDoc.Filtered := False;
     DMTE.cdsTDoc.IndexFieldNames := '';
     DMTE.cdsTDoc.Close;
     }
   end ;
end;

procedure TFToolEgresos.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFToolEgresos.Z2bbtnEmiChqClick(Sender: TObject);
var
   xSQL,xEmision : String;
begin
   if (FPagoFacturas<>nil) or (FPagoGlobal2<>nil) or (FEgresoCaja<>nil) then
   begin
      ShowMessage('Para ejecutar esta opcion debe Cerrar la ventana en Uso');
      Exit;
   end;

   DMTE.cdsEgrCaja.Data:=FRegistro.xFiltroEgr.FMant.cds2.Data;
   DMTE.cdsEgrCaja.GotoCurrent( FRegistro.xFiltroEgr.FMant.cds2 );

   if DMTE.cdsEgrCaja.FieldByName('ECCHQEMI').AsString='S' then
      xEmision:='N'
   else
      if DMTE.cdsEgrCaja.FieldByName('ECCHQEMI').AsString='' then
         xEmision:='N'
      else
         xEmision:='S';
   DMTE.cdsEgrCaja.Edit;
   DMTE.cdsEgrCaja.FieldByName('ECCHQEMI').AsString:=xEmision;
   if DMTE.cdsEgrCaja.ApplyUpdates(0)>0 then
   begin
      xSQL:='Update CAJA302 '
           +'   set ECCHQEMI='+quotedstr(xEmision)
           +' where CIAID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString)
           +'   and TDIARID='+quotedstr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString)
           +'   and ECANOMM='+quotedstr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString)
           +'   and ECNOCOMP='+quotedstr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
      try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      except
         ShowMessage('No se pudo Actualizar la Marca de Impresión de Cheque, reintente luego');
         exit;
      end;
   end;
   FRegistro.xFiltroEgr.FMant.cds2.Edit;
   FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECCHQEMI').AsString := DMTE.cdsEgrCaja.FieldByName('ECCHQEMI').AsString;
   FRegistro.xFiltroEgr.FMant.cds2.Post;
end;

procedure TFToolEgresos.bbtnPagoGlobalClick(Sender: TObject);
var
   xSQL : string;
begin
  Try
     if (FPagoFacturas<>nil) or (FPagoGlobal2<>nil) or (FEgresoCaja<>nil) then
     begin
        ShowMessage('Esta opción esta en Uso');
        Exit;
     end;

     DMTE.cdsEgrCaja.Data:=FRegistro.xFiltroEgr.FMant.cds2.Data;
     DMTE.cdsEgrCaja.GotoCurrent( FRegistro.xFiltroEgr.FMant.cds2 );

     DMTE.FiltraTabla( DMTE.cdsBancoEgr,'TGE105', 'BANCOID' );
     DMTE.cdsBancoEgr.Filter   := '';
     DMTE.cdsBancoEgr.Filtered := False;
     DMTE.cdsBancoEgr.IndexFieldNames := 'BANCOID';
     DMTE.cdsNivel.Open;
     DMTE.cdsTDiario1.Open;

     DMTE.cdsMovCxP.open;
     DMTE.FiltraTabla( DMTE.cdsCCBco,'TGE106', 'CCBCOID'  );
     DMTE.FiltraTabla( DMTE.cdsFEfec,'TGE217', 'FLUEFEID' );
     DMTE.FiltraTabla( DMTE.cdsEquiv,'TGE160', '' );
     DMTE.FiltraTabla(DMTE.cdsTDoc,    'TGE110', 'DOCID' );
     DMTE.cdsTDoc.Filter:=' (DOCMOD=''CAJA'' OR DOCMOD=''CXP'')  ';
     DMTE.cdsTDoc.Filtered:=True;

     DMTE.cdsAux.IndexFieldNames:='';
     DMTE.cdsAux.Filter:='';
     if not DMTE.cdsAux.Active then
     begin
        xSQL:='select CLAUXID,AUXID,AUXRUC,AUXNOMB,AUXABR from CNT201';
        DMTE.cdsAux.Close;
        DMTE.cdsAux.DataRequest( xSQL ) ;
        DMTE.cdsAux.Open;
     end;

     DMTE.cdsClaseAux.Filter   := ' ( CLAUXCP=''P'' OR CLAUXCP=''A'' ) ';
     DMTE.cdsClaseAux.Filtered := True;
     DMTE.cdsCnpEgr.Filtered   := False;
     DMTE.cdsCnpEgr.Filter     := '';
     DMTE.cdsCnpEgr.Filter     := 'CPTOIS=''E''';
     DMTE.cdsCnpEgr.Filtered   := True;
     DMTE.wModo := 'A';
     FPagoGlobal2 := TFPagoGlobal2.Create ( Application ) ;
     FPagoGlobal2.AsignaCDSFiltro( FRegistro.xFiltroEgr.FMant.cds2) ;
     TRY
       FPagoGlobal2.ActiveMDIChild;
     except
       ShowMessage('Sucedió un Error En la Apertura') ;
     end ;

   finally
   end ;
end;

procedure TFToolEgresos.bbtnChqEntClick(Sender: TObject);
var
   xSQL,xEmision : String;
begin
   if (FPagoFacturas<>nil) or (FPagoGlobal2<>nil) or (FEgresoCaja<>nil) then
   begin
      ShowMessage('Para ejecutar esta opcion debe Cerrar la ventana en Uso');
      Exit;
   end;

   xSQL:='Select * '
        +'  from CAJA302 '
        +' where CIAID='  +quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString   )
        +'   and TDIARID=' +quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('TDIARID').AsString )
        +'   and ECANOMM=' +quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString )
        +'   and ECNOCOMP='+quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECNOCOMP').AsString);
   DMTE.cdsMovCxC.Close;
   DMTE.cdsMovCxC.DataRequest( xSQL );
   DMTE.cdsMovCxC.open;

   if DMTE.cdsMovCxC.FieldByName('ECCHQEMI').AsString<>'S' then
   begin
      ShowMessage('Cheque no ha sido emitido');
      Exit;
   end;

// Inicio HPC_201401_CAJA
   xSigueGrab := True;

   Try
   // CAJA298.PAS
      FChqEntregado := TFChqEntregado.Create ( Application ) ;
      FChqEntregado.ShowModal;
      FChqEntregado.Free;
   except
      FChqEntregado.Free;
   end;

   if not xSigueGrab then exit;
// Fin HPC_201401_CAJA

   FRegistro.xFiltroEgr.FMant.cds2.Edit;
   FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECFPAGOP').AsString := DMTE.cdsMovCxC.FieldByName('ECFPAGOP').AsString;
   FRegistro.xFiltroEgr.FMant.cds2.Post;
end;

procedure TFToolEgresos.bbtnSaldoClick(Sender: TObject);
begin
//Inicio HPC_2014XX_BAN
   if DMTE=nil then exit;
   if not DMTE.DCOM1.Connected then Exit;
   try
   // CAJA704A.pas
      FSaldoCaja := TFSaldoCaja.Create( Application );
      FSaldoCaja.ShowModal;
   finally
      FSaldoCaja.Free;
      //DMTE.cdsBancoEgr.Close;
   end;
//Final HPC_2014XX_BAN

end;

procedure TFToolEgresos.sbDisenoRepClick(Sender: TObject);
begin
   bbtnVouchersXX.Visible := not bbtnVouchersXX.Visible; 
end;

procedure TFToolEgresos.bbtnVouchersXXClick(Sender: TObject);
var
   xSQL : String;
begin
{
---Estos Alter, Update e Insert es para la Implementación de la nueva funcionalidad de
---EGRESOS DE CAJA DE FONDO FIJO - NO PROVISIONADO.

alter table tge105 add flacajchi varchar2(1);
comment on column TGE105.flacajchi is 'Flag de Caja Chica';

update tge105 set flacajchi='S' where bancoid='20';

INSERT INTO TGE110( DOCID, DOCMOD, DOCDES, DOCABR, DOC_FREG, TDIARID, DOCTIPREG, DOCRESTA, DOCCONTA )
VALUES( '74', 'CAJA', 'VALE DE CAJA CHICA', 'VALE', 'C', '07', 'VC', 'N',  'S' );

UPDATE CAJA310 SET stsaldoinic=5200.30, stsaldofin=5200.30 WHERE stfecha='16/04/2014' AND bancoid='20'; ---- 01 registros a modificar

}

{
  xSQL := 'Update CAJA302 '
         +'   Set EC_PROCE=''1'', '
         +'       ECUSER='+quotedstr(DMTE.wUsuario)
         +' where CIAID=''02'' '
         +'   and ECANOMM>=''201400'' '
         +'   and TDIARID IN (''07'') '
         +'   and (EC_PROCE is null or ECUSER is null)';
}
//   xSQL := 'Update CAJA201 set PROV=''CAJCH'' where CPTOID=''EG0049'' ';
//   xSql :=  ' Update CAJA201 set PROV=''CAJCH'',FCTZ=''M'' where CPTOID=''EG0110'' ';

//   xSQL := 'Update CAJA310 set STTOTING=0.00, STSALDOFIN=STSALDOINIC-STTOTEGR where STFECHA=''16/04/2014'' and BANCOID=''20'' ';
{
   try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
      ShowMessage('No se pudo Actualizar los Vouchers Incompletos');
      exit;
   end;
}   

 {  xSQL := ' UPDATE CAJA302 SET ECESTADO=''X''  '
           +' WHERE TDIARID=''06'' AND ECANOMM>=''201404'' AND CIAID=''02'' AND ECNOCOMP=''0000000548'' AND ECESTADO=''A'' ';   }

  { xSQL:=' Update CAJA302 SET ECMTOORI=6899.76, ECMTOLOC=6899.76, ECMTOEXT=2464.2 Where CIAID=''02'' AND ECANOMM=''201405'' AND ECNOCOMP=  ''0000000103'' ';
   try
     DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
     ShowMessage('No se pudo Actualizar los Vouchers Incompletos');
     exit;
   end;   }

   bbtnVouchersXX.Visible := False;
   FRegistro.xFiltroEgr.RefreshDisplay;
end;

procedure TFToolEgresos.bbtnAjustaCNTClick(Sender: TObject);
var
   xSQL, xLLave, xCia, xTDiario, xAnoMes, xNroComp : String;
   xMtoPagoOri, xMtoPagoLoc, xMtoPagoExt : Currency;
begin
   xSQL := 'CIAID='  +quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString)
        +'   and TDIARID=' +quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('TDIARID').AsString)
        +'   and ECANOMM=' +quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString)
        +'   and ECNOCOMP='+quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECNOCOMP').AsString);
   If length(DMTE.DisplayDescrip('PrvTGE', 'CAJA302', 'ECNOCOMP', xSQL, 'ECNOCOMP')) > 0 Then
   Begin
      xLLave := '%91/'
         +            FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECNOCOMP').AsString + '%';
      xSQL := 'Select * '
         +    '  from CAJA302 '
         +    ' where ECANOMM=' + quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString)
         +    '   and ECPERREC like ' + quotedstr(xLLave)
         +    '   and PROV='+quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('PROV').AsString);
      DMTE.cdsQry2.IndexFieldNames := '';
      DMTE.cdsQry2.Filter := '';
      DMTE.cdsQry2.Filtered := False;
      DMTE.cdsQry2.DataRequest(xSQL);
      DMTE.cdsQry2.Open;
      If DMTE.cdsQry2.recordcount > 0 Then
      Begin
         If MessageDlg(' El Voucher tiene asientos automáticos, ' + chr(13)
                     + ' se eliminarán los asientos automáticos generados, '
                     + ' ¿Continuar? ', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
            exit;

         DMTE.DCOM1.AppServer.IniciaTransaccion;

      ////////////////////////////////////////////////////////////////////////
      // Elimina los movimientos contables y marca de cabecera del CAJA302  //
      ////////////////////////////////////////////////////////////////////////

      // asiento principal, el que ve el usuario en forma operativa
         xCia := FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString;
         xTDiario := FRegistro.xFiltroEgr.FMant.cds2.FieldByName('TDIARID').AsString;
         xAnoMes := FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString;
         xNroComp := FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECNOCOMP').AsString;

      // borra movimientos del asiento
         xSQL := 'delete from CNT301 '
               + ' where CIAID=' + quotedstr(xCia)
               + '   and TDIARID=' + quotedstr(xTDiario)
               + '   and CNTANOMM=' + quotedstr(xAnoMes)
               + '   and CNTCOMPROB=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Asiento');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

      // borra movimientos del detalle temporal del asiento
         xSQL := 'delete from CNT311 '
               + ' where CIAID=' + quotedstr(xCia)
               + '   and TDIARID=' + quotedstr(xTDiario)
               + '   and CNTANOMM=' + quotedstr(xAnoMes)
               + '   and CNTCOMPROB=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Asiento');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

      // borra movimientos de la cabecera del asiento
         xSQL := 'delete from CNT300 '
               + ' where CIAID=' + quotedstr(xCia)
               + '   and TDIARID=' + quotedstr(xTDiario)
               + '   and CNTANOMM=' + quotedstr(xAnoMes)
               + '   and CNTCOMPROB=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera del Asiento');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

      // borra voucher de Caja
         xSQL := 'delete from CAJA304 '
               + 'where CIAID=' + quotedstr(xCia)
               + '  and TDIARID=' + quotedstr(xTDiario)
               + '  and ECANOMM=' + quotedstr(xAnoMes)
               + '  and ECNOCOMP=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar voucher de Caja (CAJA304)');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

      // actualiza cabecera de Caja
         xSQL := 'update CAJA302 '
               + '   set ECCONTA=' + quotedstr('N')
               + ' where CIAID=' + quotedstr(xCia)
               + '   and TDIARID=' + quotedstr(xTDiario)
               + '   and ECANOMM=' + quotedstr(xAnoMes)
               + '   and ECNOCOMP=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo actualizar cabecera de Caja (CAJA302)');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

      // asiento Cia que desembolsa dinero (Cia='02')
         xCia := copy(DMTE.cdsQry2.FieldByName('ECPERREC').AsString, 4, 2);
         xTDiario := copy(DMTE.cdsQry2.FieldByName('ECPERREC').AsString, 7, 2);
         xNroComp := copy(DMTE.cdsQry2.FieldByName('ECPERREC').AsString, 10, 10);
      // borra movimientos del detalle temporal del asiento
         xSQL := 'delete from CNT301 '
               + ' where CIAID=' + quotedstr(xCia)
               + '   and TDIARID=' + quotedstr(xTDiario)
               + '   and CNTANOMM=' + quotedstr(xAnoMes)
               + '   and CNTCOMPROB=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Asiento, Cia=' + xCia);
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      // borra movimientos del detalle temporal del asiento
         xSQL := 'delete from CNT311 '
               + ' where CIAID=' + quotedstr(xCia)
               + '   and TDIARID=' + quotedstr(xTDiario)
               + '   and CNTANOMM=' + quotedstr(xAnoMes)
               + '   and CNTCOMPROB=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Asiento, Cia=' + xCia);
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      // borra movimientos de la cabecera del asiento
         xSQL := 'delete from CNT300 '
               + ' where CIAID=' + quotedstr(xCia)
               + '   and TDIARID=' + quotedstr(xTDiario)
               + '   and CNTANOMM=' + quotedstr(xAnoMes)
               + '   and CNTCOMPROB=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera del Asiento, Cia=' + xCia);
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      // borra voucher de Caja
         xSQL := 'delete from CAJA304 '
               + 'where CIAID=' + quotedstr(xCia)
               + '  and TDIARID=' + quotedstr(xTDiario)
               + '  and ECANOMM=' + quotedstr(xAnoMes)
               + '  and ECNOCOMP=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar Voucher de Caja, Cia=' + xCia);
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      // actualiza cabecera de Caja
         xSQL := 'delete from CAJA302 '
               + ' where CIAID=' + quotedstr(xCia)
               + '   and TDIARID=' + quotedstr(xTDiario)
               + '   and ECANOMM=' + quotedstr(xAnoMes)
               + '   and ECNOCOMP=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar Cabecera de Caja, Cia ' + xCia);
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;

      // asiento auxiliar q realiza el ingreso de dinero para el pago (TDiario='91')
//         1         2         3         4         5         6         7         8         9
//123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890
//1. 02/06/0000000004][2. 04/91/0000000004
         xCia := copy(DMTE.cdsQry2.FieldByName('ECPERREC').AsString, 25, 2);
         xTDiario := copy(DMTE.cdsQry2.FieldByName('ECPERREC').AsString, 28, 2);
         xNroComp := copy(DMTE.cdsQry2.FieldByName('ECPERREC').AsString, 31, 10);

      // borra movimientos del detalle temporal del asiento
         xSQL := 'delete from CNT301 '
               + ' where CIAID=' + quotedstr(xCia)
               + '   and TDIARID=' + quotedstr(xTDiario)
               + '   and CNTANOMM=' + quotedstr(xAnoMes)
               + '   and CNTCOMPROB=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Asiento, Cia=' + xCia);
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      // borra movimientos del detalle temporal del asiento
         xSQL := 'delete from CNT311 '
               + ' where CIAID=' + quotedstr(xCia)
               + '   and TDIARID=' + quotedstr(xTDiario)
               + '   and CNTANOMM=' + quotedstr(xAnoMes)
               + '   and CNTCOMPROB=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Asiento, Cia=' + xCia);
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      // borra movimientos de la cabecera del asiento
         xSQL := 'delete from CNT300 '
               + ' where CIAID=' + quotedstr(xCia)
               + '   and TDIARID=' + quotedstr(xTDiario)
               + '   and CNTANOMM=' + quotedstr(xAnoMes)
               + '   and CNTCOMPROB=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera del Asiento, Cia=' + xCia);
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      // borra voucher de Caja
         xSQL := 'delete from CAJA304 '
               + 'where CIAID=' + quotedstr(xCia)
               + '  and TDIARID=' + quotedstr(xTDiario)
               + '  and ECANOMM=' + quotedstr(xAnoMes)
               + '  and ECNOCOMP=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar voucher de Caja, Cia=' + xCia);
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      // actualiza cabecera de Caja
         xSQL := 'delete from CAJA302 '
               + ' where CIAID=' + quotedstr(xCia)
               + '   and TDIARID=' + quotedstr(xTDiario)
               + '   and ECANOMM=' + quotedstr(xAnoMes)
               + '   and ECNOCOMP=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar cabecera de Caja, Cia=' + xCia);
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      End
      Else // si el voucher de caja es único
      Begin
         DMTE.DCOM1.AppServer.IniciaTransaccion;

         xCia := FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString;
         xTDiario := FRegistro.xFiltroEgr.FMant.cds2.FieldByName('TDIARID').AsString;
         xAnoMes := FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString;
         xNroComp := FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECNOCOMP').AsString;

      // borra movimientos del detalle del asiento
         xSQL := 'delete from CNT301 '
            +    ' where CIAID='+quotedstr(xCia)
            +    '   and CNTANOMM='+quotedstr(xAnoMes)
            +    '   and TDIARID='+quotedstr(xTDiario)
            +    '   and CNTCOMPROB='+quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Asiento');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      // borra movimientos del detalle temporal del asiento
         xSQL := 'delete from CNT311 '
            +    ' where CIAID='+quotedstr(xCia)
            +    '   and CNTANOMM='+quotedstr(xAnoMes)
            +    '   and TDIARID='+quotedstr(xTDiario)
            +    '   and CNTCOMPROB='+quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el Detalle del Asiento');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      // borra movimientos de la cabecera del asiento
         xSQL := 'delete from CNT300 '
            +    ' where CIAID='+quotedstr(xCia)
            +    '   and CNTANOMM='+quotedstr(xAnoMes)
            +    '   and TDIARID='+quotedstr(xTDiario)
            +    '   and CNTCOMPROB='+quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar la Cabecera del Asiento');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      // borra voucher de Caja
         xSQL := 'delete from CAJA304 '
               + ' where CIAID=' + quotedstr(xCia)
               + '   and TDIARID=' + quotedstr(xTDiario)
               + '   and ECANOMM=' + quotedstr(xAnoMes)
               + '   and ECNOCOMP=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo eliminar el voucher de Caja');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      // actualiza cabecera de Caja
         xSQL := 'update CAJA302 '
            +    '   set ECCONTA=' + quotedstr('N')
            +    ' where CIAID=' + quotedstr(xCia)
            +    '   and TDIARID=' + quotedstr(xTDiario)
            +    '   and ECANOMM=' + quotedstr(xAnoMes)
            +    '   and ECNOCOMP=' + quotedstr(xNroComp);
         Try
            DMTE.DCOM1.AppServer.EjecutaQry(xSQL);
         Except
            ShowMessage('No se pudo actualizar el dato de contabilizado en el voucher de Caja');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         End;
      End;

      xCia := FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString;
      xTDiario := FRegistro.xFiltroEgr.FMant.cds2.FieldByName('TDIARID').AsString;
      xAnoMes := FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString;
      xNroComp := FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECNOCOMP').AsString;

      xSQL := 'Select * '
         +    '  from CAJA303 '
         +    ' where CIAID=' + quotedstr(xCia)
         +    '   and TDIARID=' + quotedstr(xTDiario)
         +    '   and ECANOMM=' + quotedstr(xAnoMes)
         +    '   and ECNOCOMP=' + quotedstr(xNroComp);
      DMTE.cdsQry6.IndexFieldNames := '';
      DMTE.cdsQry6.Filter := '';
      DMTE.cdsQry6.Filtered := False;
      DMTE.cdsQry6.Close;
      DMTE.cdsQry6.DataRequest(xSQL);
      DMTE.cdsQry6.Open;

      DMTE.cdsQry7.IndexFieldNames := '';
      DMTE.cdsQry7.Filter := '';
      DMTE.cdsQry7.Filtered := False;

      DMTE.cdsQry6.First;
      while not DMTE.cdsQry6.EOF do
      begin
         xSQL := 'Select * '
            +    '  from CXP302 '
            +    ' where CIAID=' + quotedstr(DMTE.cdsQry6.FieldByName('CIAID2').AsString)
            +    '   and TDIARID='+quotedstr(DMTE.cdsQry6.FieldByName('TDIARID2').AsString)
            +    '   and DCPANOMM='+quotedstr(DMTE.cdsQry6.FieldByName('CPANOMM').AsString)
            +    '   and CPNOREG='+quotedstr(DMTE.cdsQry6.FieldByName('CPNOREG').AsString)
            +    '   and TIPDET=''TO'' ';
         DMTE.cdsQry7.Close;
         DMTE.cdsQry7.DataRequest(xSQL);
         DMTE.cdsQry7.Open;

         If DMTE.cdsQry7.FieldByName('TMONID').AsString = 'N' then
         Begin
            xMtoPagoOri := DMTE.cdsQry7.FieldByName('DCPMOLOC').AsFloat;
            xMtoPagoLoc := DMTE.cdsQry7.FieldByName('DCPMOLOC').AsFloat;
            xMtoPagoExt := DMTE.FRound(DMTE.cdsQry7.FieldByName('DCPMOLOC').AsFloat/FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECTCAMB').AsFloat,15,2);
         End
         Else
         Begin
            xMtoPagoOri := DMTE.cdsQry7.FieldByName('DCPMOEXT').AsFloat;
            xMtoPagoLoc := DMTE.FRound(DMTE.cdsQry7.FieldByName('DCPMOEXT').AsFloat*FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECTCAMB').AsFloat,15,2);
            xMtoPagoExt := DMTE.cdsQry7.FieldByName('DCPMOEXT').AsFloat;
         End;

         xSQL := 'Update CAJA303 '
            +    '   Set DEMTOORI='+floattostr(xMtoPagoOri)+','
            +    '       DEMTOLOC='+floattostr(xMtoPagoLoc)+','
            +    '       DEMTOEXT='+floattostr(xMtoPagoExt)+','
            +    '       DESALLOC='+floattostr(xMtoPagoLoc)+','
            +    '       DESALEXT='+floattostr(xMtoPagoExt)
            +    ' where CIAID=' + quotedstr(xCia)
            +    '   and TDIARID=' + quotedstr(xTDiario)
            +    '   and ECANOMM=' + quotedstr(xAnoMes)
            +    '   and ECNOCOMP=' + quotedstr(xNroComp)
            +    '   and CIAID2='+quotedstr(DMTE.cdsQry6.FieldByName('CIAID2').AsString)
            +    '   and PROV='+quotedstr(DMTE.cdsQry6.FieldByName('PROV').AsString)
            +    '   and DOCID2='+quotedstr(DMTE.cdsQry6.FieldByName('DOCID2').AsString)
            +    '   and CPSERIE='+quotedstr(DMTE.cdsQry6.FieldByName('CPSERIE').AsString)
            +    '   and CPNODOC='+quotedstr(DMTE.cdsQry6.FieldByName('CPNODOC').AsString);
         try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            ShowMessage('No se pudo Actualizar el Detalle del Egreso de Caja'+chr(13)
               +        'PROVEEDOR='+DMTE.cdsQry6.FieldByName('PROV').AsString+chr(13)
               +        'T.DOC='+quotedstr(DMTE.cdsQry6.FieldByName('DOCID2').AsString)+chr(13)
               +        'SERIE='+quotedstr(DMTE.cdsQry6.FieldByName('CPSERIE').AsString)+chr(13)
               +        'NUM.DOC='+quotedstr(DMTE.cdsQry6.FieldByName('CPNODOC').AsString));
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         end;
         DMTE.cdsQry6.Next;
      end;
      DMTE.DCOM1.AppServer.GrabaTransaccion;
      ShowMessage('Descontabilización correcta');
   End;
end;

// Inicio HPC_201801_CAJA
// CAJA Ajustes en la Anulación de los cheques de Filiales
procedure TFToolEgresos.sbtEliminarClick(Sender: TObject);
var xSQL : String;
begin

    If DMTE.MesCerrado(copy(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString, 5, 2),
       copy(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString, 1, 4),
       FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString) Then
    Begin
       ShowMessage(' Mes cerrado, no se puede Eliminar');
       exit;
    End;
    xSQL := 'Select nvl(sum(1),0) REGISTROS '
      + '     from CAJA303 '
      + '    where CIAID=' + quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString)
      + '      and ECANOMM=' + quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString)
      + '      and TDIARID=' + quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('TDIARID').AsString)
      + '      and ECNOCOMP=' + quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECNOCOMP').AsString);
    DMTE.cdsQry.Close;
    DMTE.cdsQry.DataRequest(xSQL);
    DMTE.cdsQry.Open;
    If DMTE.cdsQry.FieldByName('REGISTROS').AsInteger > 0 Then
    Begin
       ShowMessage(' No se puede Eliminar el Pago');
       exit;
    end;

    xSQL := 'Select nvl(sum(1),0) REGISTROS '
      + '     from CAJA301 '
      + '    where CIAID=' + quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString)
      + '      and ECANOMM=' + quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString)
      + '      and TDIARID=' + quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('TDIARID').AsString)
      + '      and ECNOCOMP=' + quotedstr(FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECNOCOMP').AsString);
    DMTE.cdsQry.Close;
    DMTE.cdsQry.DataRequest(xSQL);
    DMTE.cdsQry.Open;
    If DMTE.cdsQry.FieldByName('REGISTROS').AsInteger > 0 Then
    Begin
       ShowMessage(' No se puede Eliminar el Pago');
       exit;
    end;

    If Application.MessageBox('¿Confirme Eliminación?','Eliminar', MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK Then
       Exit;

    If (FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECESTADO').AsString = 'X') or (FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECESTADO').AsString = 'I') Then
    Begin
         xSQL := 'delete CAJA302 '
            + '    Where CIAID=''' + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString + ''' '
            + '      and ECANOMM=''' + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString + ''' '
            + '      and TDIARID=''' + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('TDIARID').AsString + ''' '
            + '      and ECNOCOMP=''' + FRegistro.xFiltroEgr.FMant.cds2.FieldByName('ECNOCOMP').AsString + ''' ';
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         ShowMessage(' Se eliminó correctamente el Pago');
         DMTE.cdsEgrCaja.Data:=FRegistro.xFiltroEgr.FMant.cds2.Data;
         DMTE.cdsEgrCaja.GotoCurrent( FRegistro.xFiltroEgr.FMant.cds2 );

         DMTE.cdsCnpEgr.Filter := 'CPTOIS=''E'' and ACTIVO=''S'' ';
         DMTE.cdsCnpEgr.Filtered := True;

         FRegistro.xFiltroEgr.RefreshFilter;

    End;

end;
// Fin HPC_201801_CAJA

end.

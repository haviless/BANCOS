Unit oaTE2000;

// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaTE2000
// FORMULARIO               : FRegistro
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Formulario inicial que contiene las funcionalidades
//                            de la opción de transacciones en el menú

// ACTUALIZACIONES:
// HPC_201207_CAJA 21/09/2012:  Se implementó el control de versiones
// HPC_201304_CAJA 24/04/2013:  Cambio de Versión a 20130424180000
// HPC_201305_CAJA 06/05/2013:  Cambio de Versión a 20130506180000
// HPC_201306_CAJA 07/06/2013:  Se adiciona una nuava busqueda de cliente y creaciòn de nuevo cliente
// HPC_201308_CAJA 14/08/2013:  Se realizan ajustes al pase HPC_201306_CAJA
// HPC_201401_CAJA 27/05/2013:  Cambio de Versión a 20140625083000
// HPC_201403_CAJA cambia control de diseño de reporte
// HPC_201603_CAJA 21/03/2016:  Se añade filtro de Estado a apertura de Conceptos de Caja
//                 04/04/2016  Creación de Formulario para Registro Global
//                 27/12/2016:  Cambio de Versión a 20161228083000
// HPC_201703_CAJA: Validación SEMT para proveedores con cobranza coactiva
// CAJA_201804      09/11/2018:  Cambio de Control de Versión a CAJA-201804, cambio solo en el DFM

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, DBClient, wwclient, Mant, ExtCtrls, CAJADM, ppComm,
   ppRelatv, ppProd, ppClass, ppReport, ppTypes, oaVariables, ppEndUsr,
   StdCtrls;

Type

   RCabComprobante = Record
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
         Tmoneda: String;
      Banco2: String;

   End;

   TFRegistro = Class(TForm)
      ppd1: TppDesigner;
      lblVersion: TLabel;

   Private
    { Private declarations }
      Procedure evt_Adiciona(Sender: TObject);
      Procedure evt_Edita(Sender: TObject; MantFields: TFields);
      Procedure evt_AdicionaIngresoCaja(Sender: TObject);
      Procedure evt_EditaIngresoCaja(Sender: TObject; MantFields: TFields);
      Procedure evt_Delete(Sender: TObject; MantFields: TFields);
      Procedure PGridShow(Sender: TObject);
      Procedure evt_AdicionaReciboCaja(Sender: TObject);
      Procedure evt_EditaReciboCaja(Sender: TObject; MantFields: TFields);
      Procedure PegaPanelToolRecibo(Sender: TObject);
      Procedure PegaPanelToolEgreso(Sender: TObject);
      Procedure egr_EditaEgreso(Sender: TObject; MantFields: TFields);
      Procedure egr_EditaEgreso_Pago_NoProvisionado;
      Procedure egr_EditaEgreso_Pago_Provisionado;
      Procedure egr_EditaEgreso_Pago_ProvBanco;
      Procedure egr_EditaEgreso_Pago_Global;
// Inicio HPC_201401_CAJ  11/02/2014  -  Rendicion de Cuentas
      Procedure egr_EditaEgreso_Rendicion_CajaChica;
// Fin HPC_201401_CAJ  11/02/2014  -  Rendicion de Cuentas

      Procedure ChqCompleto(Sender: TObject);
      Procedure evt_AdicionaPagoProvRep(Sender: TObject);
      Procedure evt_EditaPagoProvRep(Sender: TObject; MantFields: TFields);
      Procedure evt_AdicionaFFijo(Sender: TObject);
      Procedure evt_EditaFFijo(Sender: TObject; MantFields: TFields);
      Procedure ToolCheque(Sender: TObject);
      Procedure FiltraDocumento;
      Procedure evt_AdicionaChequeAnul(Sender: TObject);
      Procedure evt_EditaChequeAnul(Sender: TObject; MantFields: TFields);
      Procedure evt_AdicionaComVenMon(Sender: TObject);
      Procedure evt_EditaComVenMon(Sender: TObject; MantFields: TFields);
      Procedure evt_AdicionaTrans(Sender: TObject);
      Procedure evt_EditaTrans(Sender: TObject; MantFields: TFields);
      Procedure evt_EditaMovBanco(Sender: TObject; MantFields: TFields);
      Procedure evt_AdicionaMovBanco(Sender: TObject);
      Procedure PegaPanelToolConciliacion(Sender: TObject);
      Procedure gc_AdicionaConciliacion(Sender: TObject);
      Procedure gc_EditaConciliacion(Sender: TObject; MantFields: TFields);
      Procedure PegaToolDocProv(Sender: TObject);
      Procedure evt_EditaPagoFacturasCobrar(Sender: TObject; MantFields: TFields);
      Procedure evt_AdicionaPagoFacturasCobrar(Sender: TObject);
      Procedure evt_AdicionaContabIng(Sender: TObject);
      Procedure evt_EditaContabIng(Sender: TObject; MantFields: TFields);

      Procedure IngresosCierra(Sender: TObject);

      Procedure evt_AdicionaOrdenPago(Sender: TObject);
      Procedure evt_EditaOrdenPago(Sender: TObject; MantFields: TFields);
      Procedure OrdenPagoCierra(Sender: TObject);
      Procedure PegaPanelToolOrdenPago(Sender: TObject);

   Public
    { Public declarations }
      xModulo: String;
      xForName: String;
      xFiltroIng: TMant;
      xFiltroRecCaja: TMant;
      xFiltroEgr: TMant;
      xFiltroPVProv: TMant;
      xFiltroPagoProvBco: TMant;
      xFiltroCHQ: TMant;
      xFiltroCV: TMant;
      xFiltroTrans: TMant;
      xFiltroMovBancos: TMant;
      xMant: TMant;
      xFiltroPProv: TMant;
      xFiltroContab: TMant;
      xFiltroPromot: TMant;
      

      Procedure FiltraTabla(xxCds: TwwClientDataSet; xxArchivo, xxCampo: String);
      Procedure EmiteChq(NombreArchivo: String; strChq: structChq);
      Procedure ToolAsociaCreate(Sender: TObject); //Asociados
      Procedure OnEditAsoCta(Sender: TObject; MantFields: TFields);

   End;

   Procedure TEIngresosCajaMant; stdcall;
   Procedure TEIngresosCaja; stdcall;
   Procedure TECobranzasCXCMant; stdcall;
   Procedure TECobranzasCXC; stdcall;
   Procedure TEEgresosMant; stdcall;
   Procedure TERendicionCuentaMant; stdcall;
   Procedure TERendicionCuenta; stdcall;
   Procedure TEFondoFijoMant; stdcall;
   Procedure TEFondoFijo; stdcall;
   Procedure TEControlChequesMant; stdcall;
   Procedure TEChequesAnuladosMant; stdcall;
   Procedure TEChequesAnulados; stdcall;
   Procedure TECompraVentaDolaresMant; stdcall;
   Procedure TECompraVentaDolares; stdcall;
   Procedure TETransferenciasMant; stdcall;
   Procedure TETransferencias; stdcall;
   Procedure TEMovimientoBancosMant; stdcall;
   Procedure TEMovimientoBancos; stdcall;
   Procedure TEConciliacionMant; stdcall;
   Procedure TEConciliacion; stdcall;
   Procedure TEPagoNotasAbonoMant; stdcall;
   Procedure TEPagoNotasAbono; stdcall;
   Procedure TEContabilizacionIngresos; stdcall;
   Procedure TEOrdenDePago; stdcall;
   Procedure TETarjetaCredito; stdcall;
   Procedure TEPagoDetraccion; stdcall;

   Procedure TEVerificaVersion; stdcall;
   Exports
      TEIngresosCajaMant,
      TEIngresosCaja,
      TECobranzasCXCMant,
      TECobranzasCXC,
      TEEgresosMant,
      TERendicionCuentaMant,
      TERendicionCuenta,
      TEFondoFijoMant,
      TEFondoFijo,
      TEControlChequesMant,
      TEChequesAnuladosMant,
      TEChequesAnulados,
      TECompraVentaDolaresMant,
      TECompraVentaDolares,
      TETransferenciasMant,
      TETransferencias,
      TEMovimientoBancosMant,
      TEMovimientoBancos,
      TEConciliacionMant,
      TEConciliacion,
      TEPagoNotasAbonoMant,
      TEPagoNotasAbono,
      TEContabilizacionIngresos,
      TEOrdenDePago,
      TETarjetaCredito,
      TEVerificaVersion,
      TEPagoDetraccion;
   // Inicio HPC_201308_CAJA
   // Se retira Maestro de Clientes
   // TEMaestroCliente;
   // Fin HPC_201308_CAJA
   Var
   FRegistro: TFRegistro;
   wEstado: String;


Implementation

{$R *.dfm}

Uses CAJA206, CAJA232, CAJA704, CAJA201, CAJA228, CAJA247, CAJA240, CAJA253,
   CAJA260, CAJA254, CAJA209, CAJA218, CAJA235, CAJA221, CAJA249, CAJA705,
// Inicio HPC_201603_CAJA
// 04/04/2016  Creación de Formulario para Registro Global (Cambio de CAJA296 a CAJA297)
//   CAJA702, CAJA233, CAJA710, CAJA712, CAJA270, CAJA272, CAJA296, CAJA282,
   CAJA702, CAJA233, CAJA710, CAJA712, CAJA270, CAJA272, CAJA297, CAJA282,
// Fin HPC_201603_CAJA
   CAJA286,
   CAJA258; // HPC_201401_CAJA

// CAJA704  FToolEgresos         Tool de Egresos
// CAJA206  FIngresoCaja         Ingresos a Caja
// CAJA232  FReciboCaja          Cobranzas CxC
// CAJA201  FEgresoCaja          Pago Documentos No Provisionados
// CAJA228  FPagoFacturas        Pago Documentos Provisionados
// CAJA247  FPagoProvBco         Pago Varios Proveedores
// CAJA240  FPagoProvRep         Rendicion de Cuenta
// CAJA260  FToolCheque          Control de Cheques
// CAJA253  FFondoFijo           Fondo Fijo
// CAJA254  FAnulCheque          Anula Cheques
// CAJA209  FComVenMon           Compra Venta de Moneda Extranjera
// CAJA218  FTransferencia       Transferencias
// CAJA235  FMovBcos             Movimiento de Bancos
// CAJA221  FConBank             Conciliacion Bancaria
// CAJA249  FPagoFacturasCobrar  PagoNotasdeabono
// CAJA705  FToolConciliacion    Tool Conciliacion
// CAJA221  FConBank             Conciliacion bancaria
// CAJA702  FToolDocProv         Tool de Nota Abono por Cobrar
// CAJA249  FPagoFacturasCobrar  Pago de Facturas por Cobrar
// CAJA233  FContabIng           Contabiliza Ingresos
// CAJA263  FPagoCompensa        Compensacion
//--- CAJA296  FPagoGlobal          Pago Global
// CAJA297  FPagoGlobal2          Pago Global
// CAJA280  FCobTarjetaCredito   Cobranza de Tarjeta de Crédito
// CAJA286  FPagoDetrac          Pago de Detracciones por Telecredito
// CAJA704A FSaldoCaja           Muestra salso de Caja en Egresos

Procedure TEPagoDetraccion;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If Not DMTE.VerificaAccesoOpcion(FVariables.w_Var_sObjetoNombr) Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   If Not FVariables.w_OP_Registro Then
   Begin

      DMTE.wModo := 'A';
      FPagoDetrac := TFPagoDetrac.Create(Application);
      FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
      FPagoDetrac.ShowModal;
      FPagoDetrac.Free;
   End
   Else
   Begin
      ShowMessage('Opcion en USO');
   End
End;

Procedure TETarjetaCredito;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If Not DMTE.VerificaAccesoOpcion(FVariables.w_Var_sObjetoNombr) Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   If Not FVariables.w_OP_Registro Then
   Begin

      DMTE.wModo := 'A';
      FTarjetaImportar := TFTarjetaImportar.Create(Application);
      FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
      FTarjetaImportar.ShowModal;
      FTarjetaImportar.Free;
   End
   Else
   Begin
      ShowMessage('Opcion en USO');
   End
End;

Procedure TEOrdenDePago;
Var
   xSQLx: String;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If Not DMTE.VerificaAccesoOpcion(FVariables.w_Var_sObjetoNombr) Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;

   Try
      If Not Assigned(FRegistro) Then
         FRegistro := TFRegistro.Create(Application);

      If Not (FRegistro.xFiltroPromot = Nil) Then Exit;

      FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;

      xSQLx := 'Select * from CNT201 Where CLAUXID=''E''';
      DMTE.cdsAux.Close;
      DMTE.cdsAux.DataRequest(xSQLx);
      DMTE.cdsAux.Open;

      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa

      FToolOP := TFToolOP.Create(Application);

      FRegistro.xFiltroPromot := TMant.create(Application);
      FRegistro.xFiltroPromot.Admin := DMTE.wAdmin;
      FRegistro.xFiltroPromot.Titulo := 'Orden de Pago';
      FRegistro.xFiltroPromot.Tablename := 'CAJ_ORD_PAG_CAB';
      FRegistro.xFiltroPromot.Filter := '';
      FRegistro.xFiltroPromot.OnCreateMant := FRegistro.PegaPanelToolOrdenPago;
      FRegistro.xFiltroPromot.OnInsert := FRegistro.evt_AdicionaOrdenPago;
      FRegistro.xFiltroPromot.OnEdit := FRegistro.evt_EditaOrdenPago;
      FRegistro.xFiltroPromot.OnShow := FRegistro.PGridShow;
      FRegistro.xFiltroPromot.OnDelete := FRegistro.evt_Delete;
      FRegistro.xFiltroPromot.DComC := DMTE.DCOM1;
      FRegistro.xFiltroPromot.ClientDataSet := DMTE.cdsPagoCxP;
      FRegistro.xFiltroPromot.Module := 'CAJA';
      FRegistro.xFiltroPromot.SectionName := 'CAJAEGRPROM';
      FRegistro.xFiltroPromot.FileNameIni := '\SOLCAJA.INI';
      FRegistro.xFiltroPromot.User := DMTE.wUsuario;
      FRegistro.xFiltroPromot.Module := DMTE.wModulo;
      FRegistro.xFiltroPromot.OnCierra := FRegistro.OrdenPagoCierra;
      FRegistro.xFiltroPromot.Execute;
   Finally
   End;
End;

Procedure TFregistro.evt_AdicionaOrdenPago(Sender: TObject);
Var
   xSQL, xSTR, sFec: String;
   nDia: Integer;
Begin
   DMTE.wmodo := 'A';

   sFec := 'N';
   nDia := 0;
   While (sFec = 'N') And (nDia <= 30) Do
   Begin
      xSTR := 'FECHA=' + DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha, dateS - nDia) + ''') '
         + ' AND TMONID=''' + DMTE.wTMonExt + '''';
      If DMTE.RecuperarDatos('TGE107', DMTE.wTipoCambioUsar, xSTR) Then
      Begin
         sFec := 'S';
      End;
      inc(nDia);
   End;

   xSQL := 'select * from CAJ_USU_ORD_PAG '
      + 'where USUARIO=''' + DMTE.wUsuario + ''' and NIVEL IN (''01'',''02'',''03'')';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.Datarequest(xSQL);
   DMTE.cdsQry.Open;
   If DMTE.cdsQry.RecordCount <= 0 Then
   Begin
      ShowMessage('Usuario NO esta autorizado a esta opción');
      Exit;
   End;

   xSQL := 'Select * from CAJ_ORD_PAG_CAB where CIAID=''ZZ'' AND NUMERO=''ZZZZZZ''';
   DMTE.cdsPagoCxP.Close;
   DMTE.cdsPagoCxP.DataRequest(xSQL);
   DMTE.cdsPagoCxP.Open;
   DMTE.cdsPagoCxP.Insert;
   Try
      FOrdenPago := TFOrdenPago.Create(Application);
      FOrdenPago.ShowModal;
   Finally
      FOrdenPago.Free;
      FRegistro.xFiltroPromot.RefreshFilter;
   End;
End;

Procedure TFRegistro.evt_EditaOrdenPago(Sender: TObject; MantFields: TFields);
Var
   xSQL, cPermiso: String;
Begin
   DMTE.wModo := 'M';

   xSQL := 'Select * from CAJ_ORD_PAG_CAB '
      + 'where CIAID=''' + MantFields.FieldByname('CIAID').AsString + ''' '
      + 'AND NUMERO=''' + MantFields.FieldByname('NUMERO').AsString + '''';

   DMTE.cdsPagoCxP.Close;
   DMTE.cdsPagoCxP.DataRequest(xSQL);
   DMTE.cdsPagoCxP.Open;

   xSQL := 'select * from CAJ_USU_ORD_PAG where USUARIO=''' + DMTE.wUsuario + ''' ORDER BY NIVEL DESC';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.Datarequest(xSQL);
   DMTE.cdsQry.Open;

   cPermiso := DMTE.cdsQry.FieldByname('AUTORIZADO').AsString;

   If cPermiso = 'CAJA' Then
   Begin
      If DMTE.cdsPagoCxP.FieldByname('USUACEPTA').AsString = '' Then
      Begin
         ShowMessage('Usuario NO ha ACEPTADO la Orden de Pago');
         Exit;
      End;
   End;

   If cPermiso = 'PAGA' Then
   Begin
      If DMTE.cdsPagoCxP.FieldByname('USUASIGNA').AsString = '' Then
      Begin
         ShowMessage('Cajero(a) No ha sido asignado' + DMTE.cdsPagoCxP.FieldByname('USUASIGNA').AsString);
         Exit;
      End;

      If DMTE.cdsPagoCxP.FieldByname('USUASIGNA').AsString <> DMTE.wUsuario Then
      Begin
         ShowMessage('Cajero(a) asignado para pagar es : ' + DMTE.cdsPagoCxP.FieldByname('USUASIGNA').AsString);
         Exit;
      End;
   End;

   If xFiltroPromot.FMant.cds2.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No Existen Registros por Editar');
   End;

   Try
      DMTE.cdsPagoCxP.Edit;
      FOrdenPago := TFOrdenPago.Create(Application);
      FOrdenPago.ShowModal;
   Finally
      FOrdenPago.Free;
      FRegistro.xFiltroPromot.RefreshFilter;
   End;
End;

Procedure TFRegistro.PegaPanelToolOrdenPago(Sender: TObject);
Var
   cb, cl: TPanel;
Begin
   cb := FToolOP.Pnl;
   cl := TMant(Sender).FMant.pnlBtns;
   cl.Height := cb.Height + 2;
   cb.Align := alClient;
   cb.Parent := TMant(Sender).FMant.pnlBtns;
   cl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TEIngresosCajaMant;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If Not DMTE.VerificaAccesoOpcion(FVariables.w_Var_sObjetoNombr) Then Exit;

   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;

   Try
      If Not Assigned(FRegistro) Then
         FRegistro := TFRegistro.Create(Application);

      If Not (FRegistro.xFiltroIng = Nil) Then Exit;

      FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;

      DMTE.FiltraTabla(DMTE.cdsNivel, 'TGE160', 'NIVEL');
      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');

   // Inicio HPC_201603_CAJA
   // Se añade filtro de Estado a apertura de Conceptos de Caja
      DMTE.cdsCnpEgr.Filter := 'CPTOIS=''I'' and ACTIVO=''S'' ';
   // Fin HPC_201603_CAJA

      DMTE.cdsCnpEgr.Filtered := True;
      If DMTE.cdsCnpEgr.IndexFieldNames <> 'CPTODES' Then
         DMTE.cdsCnpEgr.IndexFieldNames := 'CPTODES';
      DMTE.cdsClaseAux.Filter := '( CLAUXCP=''C'' OR CLAUXCP=''A'' )';
      DMTE.cdsClaseAux.Filtered := True;
      DMTE.cdsFormPago.Filter := 'FCING=''S'' OR FCHQ=''S'' OR FCHQ=''1'' ';
      DMTE.cdsFormPago.Filtered := True;
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := 'DOCMOD=''CAJA''';
      DMTE.cdsTDoc.Filtered := True;

      DMTE.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa

      FToolIngresos := TFToolIngresos.Create(Application);

      FRegistro.xFiltroIng := TMant.create(Application);
      FRegistro.xFiltroIng.Admin := DMTE.wAdmin;
      FRegistro.xFiltroIng.Titulo := 'Ingresos a Caja';
      FRegistro.xFiltroIng.Tablename := 'CXC303';

      FRegistro.xFiltroIng.Filter := 'CXC303.CCTREC=''NP''';

      If (DMTE.cFilterUsuarioUser <> '') Then
      Begin
         If (FRegistro.xFiltroIng.Filter <> '') And (DMTE.cFilterUsuarioUser <> '') Then
            FRegistro.xFiltroIng.Filter := FRegistro.xFiltroIng.Filter + ' and ' + DMTE.cFilterUsuarioUser
         Else
            FRegistro.xFiltroIng.Filter := DMTE.cFilterUsuarioUser;
      End;

      FRegistro.xFiltroIng.OnCreateMant := FRegistro.PegaPanelToolRecibo;


      FRegistro.xFiltroIng.OnInsert := FRegistro.evt_AdicionaIngresoCaja;
      FRegistro.xFiltroIng.OnEdit := FRegistro.evt_EditaIngresoCaja;
      FRegistro.xFiltroIng.OnShow := FRegistro.PGridShow;
      FRegistro.xFiltroIng.OnDelete := FRegistro.evt_Delete;
      FRegistro.xFiltroIng.DComC := DMTE.DCOM1;
      FRegistro.xFiltroIng.ClientDataSet := DMTE.cdsIngDocs;
      FRegistro.xmodulo := 'CXC';
      FRegistro.xFiltroIng.Module := 'CAJA';
      FRegistro.xFiltroIng.SectionName := 'CAJAING';
      FRegistro.xFiltroIng.FileNameIni := '\SOLCAJA.INI';
      FRegistro.xFiltroIng.User := DMTE.wUsuario;
      FRegistro.xFiltroIng.Module := DMTE.wModulo;
      FRegistro.xFiltroIng.OnCierra := FRegistro.IngresosCierra;
      FRegistro.xFiltroIng.SetFilter('CIAID=''' + FToolIngresos.dblcCia.Text + ''' AND CCFEMIS=''' + DateToStr(FToolIngresos.dtpFecha.Date) + '''');
      FRegistro.xFiltroIng.Execute;
   Finally
   End;
End;

Procedure TFRegistro.IngresosCierra(Sender: TObject);
Begin
   xFiltroIng := Nil;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;
End;

Procedure TFRegistro.OrdenPagoCierra(Sender: TObject);
Begin
   xFiltroPromot := Nil;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas - 1;
End;

Procedure TEIngresosCaja;
Var
   xSQL: String;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If Not DMTE.VerificaAccesoOpcion(FVariables.w_Var_sObjetoNombr) Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;

   Try
      DMTE.FiltraTabla(DMTE.cdsNivel, 'TGE160', 'NIVEL');
      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');

   // Inicio HPC_201603_CAJA
   // Se añade filtro de Estado a apertura de Conceptos de Caja
      DMTE.cdsCnpEgr.Filter := 'CPTOIS=''I'' and ACTIVO=''S'' ';
   // Fin HPC_201603_CAJA

      DMTE.cdsCnpEgr.Filtered := True;
      If DMTE.cdsCnpEgr.IndexFieldNames <> 'CPTODES' Then
         DMTE.cdsCnpEgr.IndexFieldNames := 'CPTODES';
      DMTE.cdsClaseAux.Filter := '( CLAUXCP=''C'' OR CLAUXCP=''A'' )';
      DMTE.cdsClaseAux.Filtered := True;
      DMTE.cdsFormPago.Filter := 'FCING=''S'' OR FCHQ=''S'' OR FCHQ=''1'' ';
      DMTE.cdsFormPago.Filtered := True;
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := 'DOCMOD=''CAJA''';
      DMTE.cdsTDoc.Filtered := True;

      wEstado := 'I';
      DMTE.wmodo := 'A';
      FRegistro := TFRegistro.Create(Application);

      xSQL := 'Select * from CXC303 '
         + 'Where CIAID=''ZZ'' AND DOCID=''ZZ''AND CCSERIE=''ZZZ'' AND CCNODOC=''ZZZZ''';
      DMTE.cdsIngDocs.Close;
      DMTE.cdsIngDocs.DataRequest(xSQL);
      DMTE.cdsIngDocs.Open;

// CAJA206  FIngresoCaja         Ingresos a Caja
      FIngresoCaja := TFIngresoCaja.Create(Application);
      FIngresoCaja.AsignaCDSFiltro(DMTE.cdsIngDocs);
      FIngresoCaja.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Finally
   End;
End;

Procedure TECobranzasCXCMant;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      DMTE.cdsNivel.Open;
      FRegistro := TFRegistro.Create(Application);

      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.cdsBancoEgr.IndexFieldNames := 'BANCOID';
   // Inicio HPC_201603_CAJA
   // Se añade filtro de Estado a apertura de Conceptos de Caja
      DMTE.cdsCnpEgr.Filter := 'CPTOIS=''I'' and ACTIVO=''S'' ';
   // Fin HPC_201603_CAJA
      DMTE.cdsCnpEgr.Filtered := True;
      DMTE.cdsClaseAux.Filter := '( CLAUXCP=''C'' OR CLAUXCP=''A'' )';
      DMTE.cdsClaseAux.Filtered := True;
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := 'DOCMOD=''CAJA''';
      DMTE.cdsTDoc.Filtered := True;

      DMTE.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FRegistro.xFiltroRecCaja := TMant.create(Application);
      FRegistro.xFiltroRecCaja.Admin := DMTE.wAdmin;
      FRegistro.xFiltroRecCaja.Titulo := 'Cobranzas CxC';
      FRegistro.xFiltroRecCaja.Tablename := 'CXC303';
      FRegistro.xFiltroRecCaja.Filter := 'CXC303.CCTREC=''RC'' ';
      FRegistro.xFiltroRecCaja.OnInsert := FRegistro.evt_AdicionaReciboCaja;
      FRegistro.xFiltroRecCaja.OnEdit := FRegistro.evt_EditaReciboCaja;
      FRegistro.xFiltroRecCaja.OnShow := FRegistro.PGridShow;
      FRegistro.xFiltroRecCaja.OnDelete := FRegistro.evt_Delete;
      FRegistro.xFiltroRecCaja.DComC := DMTE.DCOM1;
      FRegistro.xFiltroRecCaja.ClientDataSet := DMTE.cdsIngDocs;
      FRegistro.xmodulo := 'CXC';
      FRegistro.xFiltroRecCaja.Module := 'CAJA';
      FRegistro.xFiltroRecCaja.SectionName := 'CAJARECIBOS';
      FRegistro.xFiltroRecCaja.FileNameIni := '\SOLCAJA.INI';
      FRegistro.xFiltroRecCaja.User := DMTE.wUsuario;
      FRegistro.xFiltroRecCaja.Module := DMTE.wModulo;
      FRegistro.xFiltroRecCaja.OnCierra := DMTE.DisminuyeForma;
      FRegistro.xFiltroRecCaja.Execute;
   Finally
   End;
End;

Procedure TECobranzasCXC;
Var
   xSQL: String;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      wEstado := 'I';
      DMTE.wModo := 'A';

      xSQL := 'Select * from CXC303 '
         + 'Where CIAID=''ZZ'' AND DOCID=''ZZ''AND CCSERIE=''ZZZ'' AND CCNODOC=''ZZZZ''';
      DMTE.cdsIngDocs.Close;
      DMTE.cdsIngDocs.DataRequest(xSQL);
      DMTE.cdsIngDocs.Open;

      DMTE.cdsNivel.Open;
      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.cdsBancoEgr.IndexFieldNames := 'BANCOID';

   // Inicio HPC_201603_CAJA
   // Se añade filtro de Estado a apertura de Conceptos de Caja
      DMTE.cdsCnpEgr.Filter := 'CPTOIS=''I'' and ACTIVO=''S'' ';
   // Fin HPC_201603_CAJA

      DMTE.cdsCnpEgr.Filtered := True;
      DMTE.cdsClaseAux.Filter := '( CLAUXCP=''C'' OR CLAUXCP=''A'' )';
      DMTE.cdsClaseAux.Filtered := True;
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := 'DOCMOD=''CAJA''';
      DMTE.cdsTDoc.Filtered := True;

// CAJA232  FReciboCaja          Cobranzas CxC
      FReciboCaja := TFReciboCaja.Create(Application);
      FReciboCaja.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Finally
   End;
End;

Procedure TEEgresosMant;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If Not DMTE.VerificaAccesoOpcion(FVariables.w_Var_sObjetoNombr) Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      DMTE.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FRegistro := TFRegistro.Create(Application);
      FRegistro.xForName := 'EGRESOS';
      FToolEgresos := TFToolEgresos.Create(Application);
      FRegistro.xFiltroEgr := TMant.create(Application);

      FRegistro.xFiltroEgr.Admin := DMTE.wAdmin;
      FRegistro.xFiltroEgr.Titulo := 'Egresos de Caja';
      FRegistro.xFiltroEgr.TableName := 'CAJA302';
// Inicio HPC_201401_CAJ  11/02/2014  -  Reordenamiento de la sangría a todo el formulario
      FRegistro.xFiltroEgr.Filter := '( CAJA302.EC_PROCE=''1'' OR CAJA302.EC_PROCE=''B'' '
         + ' OR CAJA302.EC_PROCE=''3'' OR CAJA302.EC_PROCE=''G'' OR CAJA302.EC_PROCE=''I'' )';
// Fin HPC_201401_CAJ  11/02/2014  -  Reordenamiento de la sangría a todo el formulario

      If (DMTE.cFilterUsuarioUserEgr <> '') Then
      Begin
         If (FRegistro.xFiltroEgr.Filter <> '') And (DMTE.cFilterUsuarioUserEgr <> '') Then
            FRegistro.xFiltroEgr.Filter := FRegistro.xFiltroEgr.Filter + ' and ' + DMTE.cFilterUsuarioUserEgr
         Else
            FRegistro.xFiltroEgr.Filter := DMTE.cFilterUsuarioUserEgr;
      End;

      FRegistro.xFiltroEgr.OnInsert := Nil;
      FRegistro.xFiltroEgr.OnCreateMant := FRegistro.PegaPanelToolEgreso;
      FRegistro.xFiltroEgr.OnEdit := FRegistro.egr_EditaEgreso;
      FRegistro.xFiltroEgr.OnShow := FRegistro.PGridShow;
      FRegistro.xFiltroEgr.OnDelete := Nil;
      FRegistro.xFiltroEgr.DComC := DMTE.DCOM1;
      FRegistro.xFiltroEgr.ClientDataSet := DMTE.cdsEgrCaja;
      FRegistro.xmodulo := 'CXP';
      FRegistro.xFiltroEgr.Module := 'CAJA';
      FRegistro.xFiltroEgr.SectionName := 'CAJAEGRESO';
      FRegistro.xFiltroEgr.FileNameIni := '\SOLCAJA.INI';
      FRegistro.xFiltroEgr.User := DMTE.wUsuario;
      FRegistro.xFiltroEgr.Module := DMTE.wModulo;
      FRegistro.xFiltroEgr.OnCierra := DMTE.DisminuyeForma;
      FRegistro.xFiltroEgr.Execute;
   Finally

   End;
End;

Procedure TERendicionCuentaMant;
Var
   xSQL: String;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If Not DMTE.VerificaAccesoOpcion(FVariables.w_Var_sObjetoNombr) Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      FRegistro := TFRegistro.Create(Application);

      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.cdsBancoEgr.IndexFieldNames := 'BANCOID';
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := 'DOCMOD=''CAJA''';
      DMTE.cdsTDoc.Filtered := True;
      DMTE.cdsClaseAux.Filter := ' ( RESPFF=''S'') '; //Para Clases de auxiliar de rendicion
      DMTE.cdsClaseAux.Filtered := True;

      xSQL := 'Select CLAUXID,CLAUXDES from TGE102 where CLAUXCP=''P'' or CLAUXCP=''A'' ';
      DMTE.cdsQry4.Close;
      DMTE.cdsQry4.IndexFieldNames := '';
      DMTE.cdsQry4.Filter := '';
      DMTE.cdsQry4.DataRequest(xSQL);
      DMTE.cdsQry4.Open;

   // Inicio HPC_201603_CAJA
   // Se añade filtro de Estado a apertura de Conceptos de Caja
      DMTE.cdsCnpEgr.Filter := 'CPTOIS=''E'' and ACTIVO=''S'' ';
   // Fin HPC_201603_CAJA

      DMTE.cdsCnpEgr.Filtered := True;

      DMTE.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FRegistro.xFiltroPVProv := TMant.create(Application);

      FRegistro.xFiltroPVProv.Admin := DMTE.wAdmin;
      FRegistro.xFiltroPVProv.Titulo := 'Rendición de Cuenta';
      FRegistro.xFiltroPVProv.Tablename := 'CAJA302';
      FRegistro.xFiltroPVProv.Filter := 'CAJA302.EC_PROCE=''R''';
      FRegistro.xFiltroPVProv.OnInsert := FRegistro.evt_AdicionaPagoProvRep;
      FRegistro.xFiltroPVProv.OnEdit := FRegistro.evt_EditaPagoProvRep;
      FRegistro.xFiltroPVProv.OnShow := FRegistro.PGridShow;
      FRegistro.xFiltroPVProv.OnDelete := FRegistro.evt_Delete;
      FRegistro.xFiltroPVProv.DComC := DMTE.DCOM1;
      FRegistro.xFiltroPVProv.ClientDataSet := DMTE.cdsEgrCaja;
      FRegistro.xmodulo := 'CXP';
      FRegistro.xFiltroPVProv.Module := 'CAJA';
      FRegistro.xFiltroPVProv.SectionName := 'CAJAPAGORENPROV';
      FRegistro.xFiltroPVProv.FileNameIni := '\SOLCAJA.INI';
      FRegistro.xFiltroPVProv.User := DMTE.wUsuario;
      FRegistro.xFiltroPVProv.Module := DMTE.wModulo;
      FRegistro.xFiltroPVProv.OnCierra := DMTE.DisminuyeForma;
      FRegistro.xFiltroPVProv.Execute;
   Finally
   End;
End;

Procedure TERendicionCuenta;
Var
   xSQL: String;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.cdsBancoEgr.IndexFieldNames := 'BANCOID';
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := 'DOCMOD=''CAJA''';
      DMTE.cdsTDoc.Filtered := True;
      DMTE.cdsClaseAux.Filter := ' ( RESPFF=''S'') '; //Para Clases de auxiliar de rendicion
      DMTE.cdsClaseAux.Filtered := True;

      xSQL := 'Select CLAUXID,CLAUXDES from TGE102 where CLAUXCP=''P'' or CLAUXCP=''A'' ';
      DMTE.cdsQry4.Close;
      DMTE.cdsQry4.IndexFieldNames := '';
      DMTE.cdsQry4.Filter := '';
      DMTE.cdsQry4.DataRequest(xSQL);
      DMTE.cdsQry4.Open;

   // Inicio HPC_201603_CAJA
   // Se añade filtro de Estado a apertura de Conceptos de Caja
      DMTE.cdsCnpEgr.Filter := 'CPTOIS=''E'' and ACTIVO=''S'' ';
   // Fin HPC_201603_CAJA

      DMTE.cdsCnpEgr.Filtered := True;

      xSQL := 'Select * from CAJA302 '
         + 'Where CIAID=''ZZ'' AND TDIARID=''ZZ'' AND ECANOMM=''ZZYYYY'' AND ECNOCOMP=''ZXZXZX''';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.Open;

      DMTE.wModo := 'A';
// CAJA240  FPagoProvRep         Rendicion de Cuenta
      FPagoProvRep := TFPagoProvRep.Create(Application);
      FPagoProvRep.Adiciona;
      FPagoProvRep.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
   End;
End;

Procedure TEFondoFijoMant;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If Not DMTE.VerificaAccesoOpcion(FVariables.w_Var_sObjetoNombr) Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      FRegistro := TFRegistro.Create(Application);

      FRegistro.FiltraDocumento;
      DMTE.cdsRegCxP.PacketRecords := 1;
      DMTE.cdsRegCxP.open;
      DMTE.cdsEmpleado.Open;
      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.cdsBancoEgr.IndexFieldNames := 'BANCOID';
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsEquiv, 'TGE160', 'FPAGOID');
      DMTE.FiltraTabla(DMTE.cdsTDiario1, 'TGE104', 'TDIARID');
      DMTE.FiltraTabla(DMTE.cdsFEfec, 'TGE217', 'FLUEFEID');
      DMTE.FiltraTabla(DMTE.cdsNivel, 'CNT202', 'NIVEL');
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := '(DOCMOD=''CAJA'' OR DOCMOD=''CXP'') ';
      DMTE.cdsTDoc.Filtered := True;
      DMTE.cdsClaseAux.Filter := ' ( CLAUXFF=''S'' ) ';
      DMTE.cdsClaseAux.Filtered := True;

   // Inicio HPC_201603_CAJA
   // Se añade filtro de Estado a apertura de Conceptos de Caja
      DMTE.cdsCnpEgr.Filter := 'CPTOIS=''E'' and ACTIVO=''S'' ';
   // Fin HPC_201603_CAJA

      DMTE.cdsCnpEgr.Filtered := True;
      FRegistro.xForName := 'FONDOFIJO';

      DMTE.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FRegistro.xFiltroPagoProvBco := TMant.create(Application);
      FRegistro.xFiltroPagoProvBco.Admin := DMTE.wAdmin;
      FRegistro.xFiltroPagoProvBco.Titulo := 'Fondo Fijo';
      FRegistro.xFiltroPagoProvBco.Tablename := 'CAJA302';
      FRegistro.xFiltroPagoProvBco.Filter := 'CAJA302.EC_PROCE=''F''';
      FRegistro.xFiltroPagoProvBco.ClientDataSet := DMTE.cdsEgrCaja;
      FRegistro.xFiltroPagoProvBco.OnCreateMant := Nil;
      FRegistro.xFiltroPagoProvBco.OnInsert := FRegistro.evt_AdicionaFFijo;
      FRegistro.xFiltroPagoProvBco.OnEdit := FRegistro.evt_EditaFFijo;
      FRegistro.xFiltroPagoProvBco.OnShow := FRegistro.PGridShow;
      FRegistro.xFiltroPagoProvBco.OnDelete := Nil;
      FRegistro.xFiltroPagoProvBco.DComC := DMTE.DCOM1;
      FRegistro.xmodulo := 'CXP';
      FRegistro.xFiltroPagoProvBco.Module := 'CAJA';
      FRegistro.xFiltroPagoProvBco.SectionName := 'CAJAFFIJO';
      FRegistro.xFiltroPagoProvBco.FileNameIni := '\SOLCAJA.INI';
      FRegistro.xFiltroPagoProvBco.User := DMTE.wUsuario;
      FRegistro.xFiltroPagoProvBco.Module := DMTE.wModulo;
      FRegistro.xFiltroPagoProvBco.OnCierra := DMTE.DisminuyeForma;
      FRegistro.xFiltroPagoProvBco.Execute;
   Finally
   End;
End;

Procedure TEFondoFijo;
Var
   xSQL, xWhere, xDocId: String;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      xWhere := ' DOCTIPREG=''FF'' AND DOCMOD=''CAJA'' ';
      xDocId := DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCID', xWhere, 'DOCID');
      If Length(Trim(xDocId)) = 0 Then
      Begin
         ShowMessage('Error : Registre un Documento para Fondo Fijo');
         Exit;
      End;

      DMTE.cdsRegCxP.PacketRecords := 1;
      DMTE.cdsRegCxP.open;
      DMTE.cdsEmpleado.Open;
      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.cdsBancoEgr.IndexFieldNames := 'BANCOID';
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsEquiv, 'TGE160', 'FPAGOID');
      DMTE.FiltraTabla(DMTE.cdsTDiario1, 'TGE104', 'TDIARID');
      DMTE.FiltraTabla(DMTE.cdsFEfec, 'TGE217', 'FLUEFEID');
      DMTE.FiltraTabla(DMTE.cdsNivel, 'CNT202', 'NIVEL');
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := '(DOCMOD=''CAJA'' OR DOCMOD=''CXP'') ';
      DMTE.cdsTDoc.Filtered := True;
      DMTE.cdsClaseAux.Filter := ' ( CLAUXFF=''S'' ) ';
      DMTE.cdsClaseAux.Filtered := True;

   // Inicio HPC_201603_CAJA
   // Se añade filtro de Estado a apertura de Conceptos de Caja
      DMTE.cdsCnpEgr.Filter := 'CPTOIS=''E'' and ACTIVO=''S'' ';
   // Fin HPC_201603_CAJA

      DMTE.cdsCnpEgr.Filtered := True;

      xSQL := 'Select * from CAJA302 '
         + 'Where CIAID=''ZZ'' AND TDIARID=''ZZ'' AND ECANOMM=''ZZYYYY'' AND ECNOCOMP=''ZXZXZX''';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.Open;
      DMTE.wModo := 'A';
// CAJA253  FFondoFijo           Fondo Fijo
      FFondoFijo := TFFondoFijo.Create(Application);
      FFondoFijo.AsignaCDSFiltro(DMTE.cdsEgrCaja);
      FFondoFijo.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except

   End;
End;

Procedure TEControlChequesMant;
Var
   xSQL, xFiltro: String;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If Not DMTE.VerificaAccesoOpcion(FVariables.w_Var_sObjetoNombr) Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      FRegistro := TFRegistro.Create(Application);

      xSQL := 'Select FPAGOID from TGE112 '
         + 'where (FCEGR=''1'' or FCEGR=''S'')'
         + ' and (FCHQ=''1'' or FCHQ=''S'')';
      DMTE.cdsQry2.Close;
      DMTE.cdsQry2.Datarequest(xSQL);
      DMTE.cdsQry2.open;

      If DMTE.cdsQry2.RecordCount = 0 Then
      Begin
         ShowMessage('Error : Falta Registrar Formas de Pago');
         Exit;
      End;

      If DMTE.cdsQry2.RecordCount = 1 Then
         xFiltro := 'CAJA302.FPAGOID=''' + DMTE.cdsQry2.FieldByName('FPAGOID').AsString + ''''
      Else
      Begin
         xFiltro := ' (';
         DMTE.cdsQry2.First;
         While Not DMTE.cdsQry2.EOF Do
         Begin
            xFiltro := xFiltro + 'CAJA302.FPAGOID=' + DMTE.cdsQry2.FieldByName('FPAGOID').AsString;
            DMTE.cdsQry2.Next;
            If Not DMTE.cdsQry2.EOF Then
               xFiltro := xFiltro + ' or ';
         End;
         xFiltro := xFiltro + ') ';
      End;

      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');

      DMTE.cdsBancoEgr.Filtered := False;
      DMTE.cdsBancoEgr.Filter := '';
      DMTE.cdsBancoEgr.Filter := 'BCOTIPCTA=''B''';
      DMTE.cdsBancoEgr.Filtered := True;

      FToolCheque := TFToolCheque.Create(Application);
      FToolCheque.pgctrlOrigen.ActivePageIndex := 0;

      DMTE.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FRegistro.xFiltroCHQ := TMant.create(Application);

      xSQL := 'Select * from CAJA302 '
         + 'where CIAID=''ZZ''';


      FRegistro.xFiltroCHQ.Admin := DMTE.wAdmin;
      FRegistro.xFiltroCHQ.Titulo := 'Control de Cheques';
      FRegistro.xFiltroCHQ.Tablename := 'VWCAJACHQCXP';
      FRegistro.xFiltroCHQ.Filter := ''; // xFiltro;
      FRegistro.xFiltroCHQ.ClientDataSet := DMTE.cdsEgrCajaX;
      FRegistro.xFiltroCHQ.OnShow := Nil;
      FRegistro.xFiltroCHQ.OnInsert := FRegistro.evt_Adiciona;
      FRegistro.xFiltroCHQ.OnEdit := FRegistro.evt_Edita;
      FRegistro.xFiltroCHQ.OnDelete := FRegistro.evt_Delete;
      FRegistro.xFiltroCHQ.Multiselect := True;
      FRegistro.xFiltroCHQ.OnShow := Nil;
      FRegistro.xFiltroCHQ.DComC := DMTE.DCOM1;
      FRegistro.xFiltroCHQ.Module := 'CAJA';
      FRegistro.xFiltroCHQ.SectionName := 'CONTROLCHEQUES';
      FRegistro.xFiltroCHQ.FileNameIni := '\SOLCAJA.INI';
      FRegistro.xFiltroCHQ.User := DMTE.wUsuario;
      FRegistro.xFiltroCHQ.OnCreateMant := FRegistro.ToolCheque;
      FRegistro.xFiltroCHQ.UsuarioSQL.Add(xSQL);
      FRegistro.xFiltroCHQ.Module := DMTE.wModulo;
      FRegistro.xFiltroCHQ.Execute;
   Finally

   End;
End;

Procedure TEChequesAnuladosMant;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If Not DMTE.VerificaAccesoOpcion(FVariables.w_Var_sObjetoNombr) Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      FRegistro := TFRegistro.Create(Application);

      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.cdsBancoEgr.Filter := ' (BCOTIPCTA=''B'')  ';
      DMTE.cdsBancoEgr.Filtered := True;
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsEquiv, 'TGE160', 'FPAGOID');
      DMTE.FiltraTabla(DMTE.cdsTDiario1, 'TGE104', 'TDIARID');
      DMTE.cdsEmpleado.Open;

      FRegistro.xForname := 'ANULACIONCHEQUES';

      DMTE.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FRegistro.xFiltroPagoProvBco := TMant.create(Application);
      FRegistro.xFiltroPagoProvBco.Admin := DMTE.wAdmin;
      FRegistro.xFiltroPagoProvBco.Titulo := 'Registro de Cheques Anulados';
      FRegistro.xFiltroPagoProvBco.Tablename := 'CAJA302';
      FRegistro.xFiltroPagoProvBco.Filter := 'CAJA302.EC_PROCE=''3'' AND CAJA302.ECESTADO=''A'' AND ECELABO=''NULO''';
      FRegistro.xFiltroPagoProvBco.ClientDataSet := DMTE.cdsEgrCaja;
      FRegistro.xFiltroPagoProvBco.OnCreateMant := Nil;
      FRegistro.xFiltroPagoProvBco.OnInsert := FRegistro.evt_AdicionaChequeAnul;
      FRegistro.xFiltroPagoProvBco.OnEdit := FRegistro.evt_EditaChequeAnul;
      FRegistro.xFiltroPagoProvBco.OnShow := FRegistro.PGridShow;
      FRegistro.xFiltroPagoProvBco.OnDelete := Nil;
      FRegistro.xFiltroPagoProvBco.DComC := DMTE.DCOM1;
      FRegistro.xmodulo := 'CXP';
      FRegistro.xFiltroPagoProvBco.SectionName := 'CAJAANULCHEQUE';
      FRegistro.xFiltroPagoProvBco.FileNameIni := '\SOLCAJA.INI';
      FRegistro.xFiltroPagoProvBco.User := DMTE.wUsuario;
      FRegistro.xFiltroPagoProvBco.Module := DMTE.wModulo;
      FRegistro.xFiltroPagoProvBco.OnCierra := DMTE.DisminuyeForma;
      FRegistro.xFiltroPagoProvBco.Execute;
   Finally
   End;
End;

Procedure TEChequesAnulados;
Var
   xSQL: String;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      xSQL := 'Select * from CAJA302 '
         + 'Where CIAID=''ZZ'' AND TDIARID=''ZZ'' AND ECANOMM=''ZZYYYY'' AND ECNOCOMP=''ZXZXZX''';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.Open;

      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.cdsBancoEgr.Filter := ' (BCOTIPCTA=''B'')  ';
      DMTE.cdsBancoEgr.Filtered := True;

      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsEquiv, 'TGE160', 'FPAGOID');
      DMTE.FiltraTabla(DMTE.cdsTDiario1, 'TGE104', 'TDIARID');
      DMTE.cdsEmpleado.Open;

      DMTE.wModo := 'A';
// CAJA254  FAnulCheque          Anula Cheques
      FAnulCheque := TFAnulCheque.Create(Application);
      FAnulCheque.AsignaCDSFiltro(DMTE.cdsEgrCaja);
      FAnulCheque.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
   End;
End;

Procedure TECompraVentaDolaresMant;
Var
   xSQL: String;
Begin
// Compra Venta de Moneda Extranjera
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If Not DMTE.VerificaAccesoOpcion(FVariables.w_Var_sObjetoNombr) Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      FRegistro := TFRegistro.Create(Application);

      xSQL := 'select distinct TGE106.CIAID,TGE105.* '
         + 'from TGE105, TGE106 '
         + 'where TGE105.BANCOID=TGE106.BANCOID '
         + '  and ' + DMTE.wReplacCeros + '(TGE106.CCBCOID,''XX'')<>''XX'' ';
      DMTE.FiltraCds(DMTE.cdsBancoEgr, xSQL);
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := 'DOCMOD=''CAJA'' ';
      DMTE.cdsTDoc.Filtered := True;

      DMTE.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FRegistro.xFiltroCV := TMant.Create(Application);
      FRegistro.xFiltroCV.Admin := DMTE.wAdmin;
      FRegistro.xFiltroCV.Titulo := 'Compra-Venta Moneda Extranjera';
      FRegistro.xFiltroCV.Module := DMTE.wModulo;
      FRegistro.xFiltroCV.Tablename := 'CAJA302';
      FRegistro.xFiltroCV.Filter := 'EC_PROCE=''9'' OR EC_PROCE=''0'' '; // nueve ó cero
      FRegistro.xFiltroCV.OnInsert := FRegistro.evt_AdicionaComVenMon;
      FRegistro.xFiltroCV.OnEdit := FRegistro.evt_EditaComVenMon;
      FRegistro.xFiltroCV.OnShow := FRegistro.PGridShow;
      FRegistro.xFiltroCV.OnDelete := FRegistro.evt_Delete;
      FRegistro.xFiltroCV.ClientDataSet := DMTE.cdsEgrCaja;
      FRegistro.xFiltroCV.DComC := DMTE.DCOM1;
      FRegistro.xFiltroCV.User := DMTE.wUsuario;
      FRegistro.xFiltroCV.SectionName := 'CAJACOMPRAVENTAME';
      FRegistro.xFiltroCV.FileNameIni := '\SOLCAJA.INI';
      FRegistro.xFiltroCV.OnCierra := DMTE.DisminuyeForma;
      FRegistro.xFiltroCV.Execute;
   Finally
   End;
End;

Procedure TECompraVentaDolares;
Var
   xSQL: String;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      xSQL := 'Select * from CAJA302 '
         + 'Where CIAID=''ZZ'' AND TDIARID=''ZZ'' AND ECANOMM=''ZZYYYY'' AND ECNOCOMP=''ZXZXZX''';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.Open;

      DMTE.wModo := 'A';
      xSQL := 'select distinct TGE106.CIAID,TGE105.* '
         + 'from TGE105, TGE106 '
         + 'where TGE105.BANCOID=TGE106.BANCOID '
         + '  and ' + DMTE.wReplacCeros + '(TGE106.CCBCOID,''XX'')<>''XX'' ';
      DMTE.FiltraCds(DMTE.cdsBancoEgr, xSQL);
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := 'DOCMOD=''CAJA'' ';
      DMTE.cdsTDoc.Filtered := True;

// CAJA209  FComVenMon           Compra Venta de Moneda Extranjera
      FComVenMon := TFComVenMon.Create(Application);
      FComVenMon.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
   End;
End;

Procedure TETransferenciasMant;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If Not DMTE.VerificaAccesoOpcion(FVariables.w_Var_sObjetoNombr) Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      FRegistro := TFRegistro.Create(Application);

      DMTE.cdsNivel.Open;
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := 'DOCMOD=''CAJA''';
      DMTE.cdsTDoc.Filtered := True;

      DMTE.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FRegistro.xFiltroTrans := TMant.Create(Application);
      FRegistro.xFiltroTrans.Admin := DMTE.wAdmin;
      FRegistro.xFiltroTrans.Titulo := 'Transferencias';
      FRegistro.xFiltroTrans.Tablename := 'CAJA302';
      FRegistro.xFiltroTrans.Filter := 'CAJA302.EC_PROCE=''4'' OR CAJA302.EC_PROCE=''7'' ';
      FRegistro.xFiltroTrans.OnInsert := FRegistro.evt_AdicionaTrans;
      FRegistro.xFiltroTrans.OnEdit := FRegistro.evt_EditaTrans;
      FRegistro.xFiltroTrans.OnShow := FRegistro.PGridShow;
      FRegistro.xFiltroTrans.OnDelete := FRegistro.evt_Delete;
      FRegistro.xFiltroTrans.DComC := DMTE.DCOM1;
      FRegistro.xFiltroTrans.ClientDataSet := DMTE.cdsEgrCajaX;
      FRegistro.xmodulo := 'CAJA';
      FRegistro.xFiltroTrans.Module := 'CAJA';
      FRegistro.xFiltroTrans.SectionName := 'CAJATRANS';
      FRegistro.xFiltroTrans.FileNameIni := '\SOLCAJA.INI';
      FRegistro.xFiltroTrans.User := DMTE.wUsuario;
      FRegistro.xFiltroTrans.OnCierra := DMTE.DisminuyeForma;
      FRegistro.xFiltroTrans.Execute;
   Finally
   End;
End;

Procedure TETransferencias;
Var
   xSQL: String;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      xSQL := 'Select * from CAJA302 '
         + 'Where CIAID=''ZZ'' AND TDIARID=''ZZ'' AND ECANOMM=''ZZYYYY'' AND ECNOCOMP=''ZXZXZX''';
      DMTE.cdsEgrCajaX.Close;
      DMTE.cdsEgrCajaX.DataRequest(xSQL);
      DMTE.cdsEgrCajaX.Open;

      DMTE.cdsNivel.Open;
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := 'DOCMOD=''CAJA''';
      DMTE.cdsTDoc.Filtered := True;

      DMTE.wModo := 'A';
// CAJA218  FTransferencia       Transferencias
      FTransferencia := TFTransferencia.Create(Application);
      FTransferencia.AsignaCDSFiltro(DMTE.cdsEgrCajaX);
      FTransferencia.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
   End;
End;

Procedure TEMovimientoBancosMant;
Var
   xSQL: String;
Begin
 // Registro de Egresos de Caja
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If Not DMTE.VerificaAccesoOpcion(FVariables.w_Var_sObjetoNombr) Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      FRegistro := TFRegistro.Create(Application);
      DMTE.cdsNivel.Open;
      DMTE.cdsEquiv.Open;
      DMTE.FiltraTabla(DMTE.cdsFEfec, 'TGE217', 'FLUEFEID');
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := 'DOCMOD=''CAJA''';
      DMTE.cdsTDoc.Filtered := True;
      DMTE.cdsBancoEgr.Filtered := False;
      DMTE.cdsBancoEgr.Filter := '';
      DMTE.cdsBancoEgr.Filter := 'BCOTIPCTA=''B'' ';
      DMTE.cdsBancoEgr.Filtered := True;
      DMTE.cdsAux.IndexFieldNames := '';
      DMTE.cdsAux.Filter := '';
      If Not DMTE.cdsAux.Active Then
      Begin
         xSQL := 'select CLAUXID,AUXID,AUXRUC,AUXNOMB,AUXABR from CNT201';
         DMTE.cdsAux.Close;
         DMTE.cdsAux.DataRequest(xSQL);
         DMTE.cdsAux.Open;
      End;
      //**

   // Inicio HPC_201603_CAJA
   // Se añade filtro de Estado a apertura de Conceptos de Caja
      DMTE.cdsCnpEgr.Filter := 'CPTOIS=''E'' and ACTIVO=''S'' ';
   // Fin HPC_201603_CAJA

      DMTE.cdsCnpEgr.Filtered := True;

      DMTE.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FRegistro.xFiltroMovBancos := TMant.create(Application);
      FRegistro.xFiltroMovBancos.Admin := DMTE.wAdmin;
      FRegistro.xFiltroMovBancos.Titulo := 'Mov. de Bancos';
      FRegistro.xFiltroMovBancos.Tablename := 'CAJA302';
      FRegistro.xFiltroMovBancos.Filter := 'CAJA302.EC_PROCE=''D''';
      FRegistro.xFiltroMovBancos.OnInsert := FRegistro.evt_AdicionaMovBanco;
      FRegistro.xFiltroMovBancos.OnEdit := FRegistro.evt_EditaMovBanco;
      FRegistro.xFiltroMovBancos.OnShow := FRegistro.PGridShow;
      FRegistro.xFiltroMovBancos.OnDelete := FRegistro.evt_Delete;
      FRegistro.xFiltroMovBancos.DComC := DMTE.DCOM1;
      FRegistro.xFiltroMovBancos.ClientDataSet := DMTE.cdsEgrCaja;
      FRegistro.xmodulo := 'CAJA';
      FRegistro.xFiltroMovBancos.Module := 'CAJA';
      FRegistro.xFiltroMovBancos.SectionName := 'CAJAMOVBCOS';
      FRegistro.xFiltroMovBancos.FileNameIni := '\SOLCAJA.INI';
      FRegistro.xFiltroMovBancos.User := DMTE.wUsuario;
      FRegistro.xFiltroMovBancos.OnCierra := DMTE.DisminuyeForma;
      FRegistro.xFiltroMovBancos.Execute;
   Finally
   End;
End;

Procedure TEMovimientoBancos;
Var
   xSQL: String;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      xSQL := 'Select * from CAJA302 '
         + 'Where CIAID=''ZZ'' AND TDIARID=''ZZ'' AND ECANOMM=''ZZYYYY'' AND ECNOCOMP=''ZXZXZX''';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.Open;

      DMTE.cdsNivel.Open;
      DMTE.cdsEquiv.Open;
      DMTE.FiltraTabla(DMTE.cdsFEfec, 'TGE217', 'FLUEFEID');
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := 'DOCMOD=''CAJA''';
      DMTE.cdsTDoc.Filtered := True;
      DMTE.cdsBancoEgr.Filtered := False;
      DMTE.cdsBancoEgr.Filter := '';
      DMTE.cdsBancoEgr.Filter := 'BCOTIPCTA=''B'' ';
      DMTE.cdsBancoEgr.Filtered := True;
      DMTE.cdsAux.IndexFieldNames := '';
      DMTE.cdsAux.Filter := '';
      If Not DMTE.cdsAux.Active Then
      Begin
         xSQL := 'select CLAUXID,AUXID,AUXRUC,AUXNOMB,AUXABR from CNT201';
         DMTE.cdsAux.Close;
         DMTE.cdsAux.DataRequest(xSQL);
         DMTE.cdsAux.Open;
      End;
      //**

   // Inicio HPC_201603_CAJA
   // Se añade filtro de Estado a apertura de Conceptos de Caja
      DMTE.cdsCnpEgr.Filter := 'CPTOIS=''E'' and ACTIVO=''S'' ';
   // Fin HPC_201603_CAJA

      DMTE.cdsCnpEgr.Filtered := True;

      DMTE.wModo := 'A';
// CAJA235  FMovBcos             Movimiento de Bancos
      FMovBcos := TFMovBcos.Create(Application);
      FMovBcos.AsignaCDSFiltro(DMTE.cdsEgrCaja);
      FMovBcos.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
   End;
End;

Procedure TEConciliacionMant;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If Not DMTE.VerificaAccesoOpcion(FVariables.w_Var_sObjetoNombr) Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      FRegistro := TFRegistro.Create(Application);

      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.cdsBancoEgr.Filter := '';
      DMTE.cdsBancoEgr.Filtered := False;

      DMTE.cdsEgrCaja.IndexFieldNames := '';
      DMTE.cdsEgrCaja.Filter := '';
      DMTE.cdsEgrCaja.Filtered := False;
      DMTE.cdsEgrCaja.Close;

      DMTE.cdsSaldoTlfnGrab.Open;
      DMTE.cdsResponsable.Open;

      FToolConciliacion := TFToolConciliacion.Create(Application);

      DMTE.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FRegistro.xMant := TMant.create(Application);
      FRegistro.xMant.Admin := DMTE.wAdmin;
      FRegistro.xMant.Titulo := 'Gestion de Conciliacion';
      FRegistro.xMant.Tablename := 'CAJA316';
      FRegistro.xMant.ClientDataSet := DMTE.cdsEgrCaja;
      FRegistro.xMant.OnCreateMant := FRegistro.PegaPanelToolConciliacion;
      FRegistro.xMant.OnInsert := FRegistro.gc_AdicionaConciliacion;
      FRegistro.xMant.OnEdit := FRegistro.gc_EditaConciliacion;
      FRegistro.xMant.OnShow := FRegistro.PGridShow;
      FRegistro.xMant.OnDelete := Nil;
      FRegistro.xMant.DComC := DMTE.DCOM1;
      FRegistro.xMant.Module := 'CAJA';
      FRegistro.xMant.SectionName := 'GESTIONCONC';
      FRegistro.xMant.FileNameIni := '\SOLCAJA.INI';
      FRegistro.xMant.User := DMTE.wUsuario;
      FRegistro.xMant.OnCierra := DMTE.DisminuyeForma;
      FRegistro.xMant.Execute;
   Finally
   End;
End;

Procedure TEConciliacion;
Var
   xSQL: String;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      xSQL := 'Select * from CAJA316 '
         + 'Where CIAID=''ZZ'' AND GCONCID=''ZZ'' AND GCONANOMM=''ZZYYYY''';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.Open;

      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.cdsBancoEgr.Filter := '';
      DMTE.cdsBancoEgr.Filtered := False;

      DMTE.cdsEgrCaja.IndexFieldNames := '';
      DMTE.cdsEgrCaja.Filter := '';
      DMTE.cdsEgrCaja.Filtered := False;

      DMTE.cdsSaldoTlfnGrab.Open;
      DMTE.cdsResponsable.Open;

      DMTE.wModo := 'A';
      DMTE.cdsCia.Open;
      DMTE.cdsEgrCaja.Insert;

// CAJA221  FConBank             Conciliacion Bancaria
      FConBank := TFConBank.Create(Application);
      FConBank.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
   End;
End;

Procedure TEPagoNotasAbonoMant;
Var
   xSQL: String;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If Not DMTE.VerificaAccesoOpcion(FVariables.w_Var_sObjetoNombr) Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      FRegistro := TFRegistro.Create(Application);

      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.cdsNivel.Open;
      DMTE.cdsTDiario1.open;
      DMTE.cdsMovCxP.open;
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsFEfec, 'TGE217', 'FLUEFEID');
      DMTE.FiltraTabla(DMTE.cdsEquiv, 'TGE160', '');

      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := ' (DOCMOD=''CAJA'' OR DOCMOD=''CXP'')  ';
      DMTE.cdsTDoc.Filtered := True;

      DMTE.cdsAux.IndexFieldNames := '';
      DMTE.cdsAux.Filter := '';
      If Not DMTE.cdsAux.Active Then
      Begin
         xSQL := 'select CLAUXID,AUXID,AUXRUC,AUXNOMB,AUXABR from CNT201';
         DMTE.cdsAux.Close;
         DMTE.cdsAux.DataRequest(xSQL);
         DMTE.cdsAux.Open;
      End;

      DMTE.cdsClaseAux.Filter := ' ( CLAUXCP=''P'' OR CLAUXCP=''A''  OR  CLAUXCP=''C'' ) ';
      DMTE.cdsClaseAux.Filtered := True;
      DMTE.cdsCnpEgr.Filtered := False;
      DMTE.cdsCnpEgr.Filter := '';

   // Inicio HPC_201603_CAJA
   // Se añade filtro de Estado a apertura de Conceptos de Caja
      DMTE.cdsCnpEgr.Filter := 'CPTOIS=''E'' and ACTIVO=''S'' ';
   // Fin HPC_201603_CAJA

      DMTE.cdsCnpEgr.Filtered := True;
      FRegistro.xForname := 'PAGOCLIE';

      FToolDocProv := TFToolDocProv.Create(Application);

      DMTE.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FRegistro.xFiltroPProv := TMant.create(Application);
      FRegistro.xFiltroPProv.Admin := DMTE.wAdmin;
      FRegistro.xFiltroPProv.Titulo := 'Pago - Notas Abono x Cobrar';
      FRegistro.xFiltroPProv.Tablename := 'CAJA302';
      FRegistro.xFiltroPProv.Filter := 'CAJA302.EC_PROCE=''L''';
      FRegistro.xFiltroPProv.ClientDataSet := DMTE.cdsEgrCaja;
      FRegistro.xFiltroPProv.OnCreateMant := FRegistro.PegaToolDocProv;
      FRegistro.xFiltroPProv.OnInsert := FRegistro.evt_AdicionaPagoFacturasCobrar;
      FRegistro.xFiltroPProv.OnEdit := FRegistro.evt_EditaPagoFacturasCobrar;
      FRegistro.xFiltroPProv.OnShow := FRegistro.PGridShow;
      FRegistro.xFiltroPProv.OnDelete := FRegistro.evt_Delete;
      FRegistro.xFiltroPProv.DComC := DMTE.DCOM1;
      FRegistro.xmodulo := 'CXC';
      FRegistro.xFiltroPProv.Module := 'CAJA';
      FRegistro.xFiltroPProv.SectionName := 'CAJAPAGOCLIE';
      FRegistro.xFiltroPProv.FileNameIni := '\SOLCAJA.INI';
      FRegistro.xFiltroPProv.User := DMTE.wUsuario;
      FRegistro.xFiltroPProv.OnCierra := DMTE.DisminuyeForma;
      FRegistro.xFiltroPProv.Execute;
   Finally
   End;
End;

Procedure TEPagoNotasAbono;
Var
   xSQL: String;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      xSQL := 'Select * from CAJA302 '
         + 'Where CIAID=''ZZ'' AND TDIARID=''ZZ'' AND ECANOMM=''ZZYYYY'' AND ECNOCOMP=''ZXZXZX''';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.Open;

      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.cdsNivel.Open;
      DMTE.cdsTDiario1.open;
      DMTE.cdsMovCxP.open;
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsFEfec, 'TGE217', 'FLUEFEID');
      DMTE.FiltraTabla(DMTE.cdsEquiv, 'TGE160', '');

      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := ' (DOCMOD=''CAJA'' OR DOCMOD=''CXP'')  ';
      DMTE.cdsTDoc.Filtered := True;

      DMTE.cdsAux.IndexFieldNames := '';
      DMTE.cdsAux.Filter := '';
      If Not DMTE.cdsAux.Active Then
      Begin
         xSQL := 'select CLAUXID,AUXID,AUXRUC,AUXNOMB,AUXABR from CNT201';
         DMTE.cdsAux.Close;
         DMTE.cdsAux.DataRequest(xSQL);
         DMTE.cdsAux.Open;
      End;

      DMTE.cdsClaseAux.Filter := ' ( CLAUXCP=''P'' OR CLAUXCP=''A''  OR  CLAUXCP=''C'' ) ';
      DMTE.cdsClaseAux.Filtered := True;
      DMTE.cdsCnpEgr.Filtered := False;
      DMTE.cdsCnpEgr.Filter := '';

   // Inicio HPC_201603_CAJA
   // Se añade filtro de Estado a apertura de Conceptos de Caja
      DMTE.cdsCnpEgr.Filter := 'CPTOIS=''E'' and ACTIVO=''S'' ';
   // Fin HPC_201603_CAJA

      DMTE.cdsCnpEgr.Filtered := True;

      DMTE.wModo := 'A';
// CAJA249  FPagoFacturasCobrar  PagoNotasdeabono
      FPagoFacturasCobrar := TFPagoFacturasCobrar.Create(Application);
      FPagoFacturasCobrar.AsignaCDSFiltro(DMTE.cdsEgrCaja);
      FPagoFacturasCobrar.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
   End;
End;

Procedure TEContabilizacionIngresos;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   If FVariables.w_Num_Formas > FVariables.w_Max_Formas Then
   Begin
      ShowMessage('No puede Invocar a más de ' + Trim(IntToStr(FVariables.w_Max_Formas)) + ' opciones al mismo tiempo');
      Exit;
   End;
   FVariables.w_Num_Formas := FVariables.w_Num_Formas + 1;
   Try
      FRegistro := TFRegistro.Create(Application);
      DMTE.cdsNivel.Open;
      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.cdsCCBco.Open;

      DMTE.wTipoAdicion := 'xFiltro'; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa
      FRegistro.xFiltroContab := TMant.Create(Application);
      FRegistro.xFiltroContab.Admin := DMTE.wAdmin;
      FRegistro.xFiltroContab.Titulo := 'Contabilización de Ingresos';
      FRegistro.xFiltroContab.Tablename := 'CAJA302';
      FRegistro.xFiltroContab.Filter := 'EC_PROCE=''C'' ';
      FRegistro.xFiltroContab.OnInsert := FRegistro.evt_AdicionaContabIng;
      FRegistro.xFiltroContab.OnEdit := FRegistro.evt_EditaContabIng;
      FRegistro.xFiltroContab.OnDelete := FRegistro.evt_Delete;
      FRegistro.xFiltroContab.DComC := DMTE.DCOM1;
      FRegistro.xFiltroContab.ClientDataSet := DMTE.cdsEgrCaja;
      FRegistro.xModulo := 'CAJA';
      FRegistro.xFiltroContab.Module := 'CAJA';
      FRegistro.xFiltroContab.SectionName := 'CAJACONTB';
      FRegistro.xFiltroContab.FileNameIni := '\SOLCAJA.INI';
      FRegistro.xFiltroContab.User := DMTE.wUsuario;
      FRegistro.xFiltroContab.OnCierra := DMTE.DisminuyeForma;
      FRegistro.xFiltroContab.Execute;
   Finally
   End;
End;

Procedure TFRegistro.FiltraTabla(xxCds: TwwClientDataSet; xxArchivo, xxCampo: String);
Var
   xFiltro, xSQL2: String;
Begin
   DMTE.cdsAcceso.Filtered := False;
   DMTE.cdsAcceso.Filter := '';
   DMTE.cdsAcceso.Filter := 'NTabla=' + '''' + xxArchivo + '''';
   DMTE.cdsAcceso.Filtered := True;

   xFiltro := '';
   DMTE.cdsAcceso.First;
   While Not DMTE.cdsAcceso.Eof Do
   Begin
      If Length(xFiltro) = 0 Then
         xFiltro := xxCampo + '=' + '''' + DMTE.cdsAcceso.FieldByName('CODIGO').AsString + ''''
      Else
         xFiltro := xFiltro + ' OR ' + xxCampo + '=' + '''' + DMTE.cdsAcceso.FieldByName('CODIGO').AsString + '''';

      DMTE.cdsAcceso.Next;
   End;

   If Length(xFiltro) > 0 Then
   Begin
      xSQL2 := 'SELECT * FROM ' + xxArchivo + ' WHERE ' + xFiltro;
      xxCds.IndexFieldNames := '';
      xxCds.Filter := '';
      xxCds.Filtered := False;
      xxCds.Close;
      xxCds.DataRequest(xSQL2);
   End;
   xxCds.Open;
End;

Procedure TFregistro.evt_AdicionaIngresoCaja(Sender: TObject);
Var
   xSQL, xSTR: String;
Begin
   wEstado := 'I';
   DMTE.wmodo := 'A';

   xSTR := 'FECHA=' + DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha, dateS) + ''') '
      + ' AND TMONID=''' + DMTE.wTMonExt + '''';
   If Not DMTE.RecuperarDatos('TGE107', DMTE.wTipoCambioUsar, xSTR) Then
   Begin
      ShowMessage('Falta Ingresar el Tipo de Cambio del Dia. Avisar a Contabilidad');
      Exit;
   End;

   xSQL := 'Select * From CAJ_USU_SUP where USUCAJ=''' + DMTE.wUsuario + '''';

   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.RecordCount = 0 Then
   Begin
      ShowMessage('Usuario : ' + DMTE.wUsuario + ', NO registrado para realizar Cobranzas');
      Exit;
   End;

   xSQL := 'Select * from CXC303 '
      + 'Where CIAID=''ZZ'' AND DOCID=''ZZ''AND CCSERIE=''ZZZ'' AND CCNODOC=''ZZZZ''';
   DMTE.cdsIngDocs.Close;
   DMTE.cdsIngDocs.DataRequest(xSQL);
   DMTE.cdsIngDocs.Open;

// CAJA206  FIngresoCaja         Ingresos a Caja
   FIngresoCaja := TFIngresoCaja.Create(Application);
   FIngresoCaja.AsignaCDSFiltro(xFiltroIng.FMant.cds2);
   FIngresoCaja.Adiciona;
   FIngresoCaja.ActiveMDIChild;
//   FIngresoCaja.Show;
   FVariables.ConfiguraForma(Screen.ActiveForm);
End;

Procedure TFRegistro.evt_EditaIngresoCaja(Sender: TObject;
   MantFields: TFields);
Var
   TransDoc: structDocIng;
   xSQL: String;
Begin
   wEstado := 'E';

   xSQL := 'Select * from CXC303 '
      + 'Where CIAID=''' + MantFields.FieldbyName('CIAID').AsString + ''' '
      + 'AND DOCID=''' + MantFields.FieldbyName('DOCID').AsString + ''' '
      + 'AND CCSERIE=''' + MantFields.FieldbyName('CCSERIE').AsString + ''' '
      + 'AND CCNODOC=''' + MantFields.FieldbyName('CCNODOC').AsString + '''';
   DMTE.cdsIngDocs.Close;
   DMTE.cdsIngDocs.DataRequest(xSQL);
   DMTE.cdsIngDocs.Open;

   If xFiltroIng.FMant.cds2.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No Existen Registros por Editar');
   End;

   If xFiltroIng.FMant.Z2bbtnModifica.Enabled Then
      DMTE.wModo := 'M'
   Else
      DMTE.wModo := 'C';

   With TransDoc, MantFields Do
   Begin
      CIAID := FieldbyName('CIAID').AsString;
      CCTREC := FieldbyName('CCTREC').AsString;
      DOCID := FieldbyName('DOCID').AsString;
      CCSERIE := FieldbyName('CCSERIE').AsString;
      CCNODOC := FieldbyName('CCNODOC').AsString;
   End;
// CAJA206  FIngresoCaja         Ingresos a Caja
   FIngresoCaja := TFIngresoCaja.Create(Application);
   FIngresoCaja.ActiveMDIChild;
   FVariables.ConfiguraForma(Screen.ActiveForm);
End;

Procedure TFRegistro.evt_Delete;
Var
   xSQL: String;
Begin
   If DMTE.wUsuario <> 'HNORIEGA' Then
   Begin
      ShowMessage('No se Puede Eliminar');
      Exit;
   End;

   If MessageDlg('¿Desea Eliminar Registro Contable ?', mtConfirmation,
      [mbYes, mbNo], 0) = mrNo Then
      Exit;

   xSQL := 'Update CXC303 set CCCONTA=''N'', TDIARID=NULL, ECNOCOMP=NULL '
      + 'Where CIAID=''' + MantFields.FieldbyName('CIAID').AsString + ''' '
      + 'and NCOESTADO=''C'' and NVL(CCCONTA,''N'')=''S'' '
      + 'and TDIARID=''' + MantFields.FieldbyName('TDIARID').AsString + ''' '
      + 'and ECNOCOMP=''' + MantFields.FieldbyName('ECNOCOMP').AsString + ''' '
      + 'and CCFEMIS>=''' + MantFields.FieldByName('ECFEMICH').AsString + ''' '
      + 'and CCFEMIS<=''' + MantFields.FieldByName('ECFCOBCH').AsString + ''' ';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   xSQL := 'Delete CAJA302 '
      + 'Where CIAID=''' + MantFields.FieldbyName('CIAID').AsString + ''' '
      + 'and TDIARID=''' + MantFields.FieldbyName('TDIARID').AsString + ''' '
      + 'and ECANOMM=''' + MantFields.FieldbyName('ECANOMM').AsString + ''' '
      + 'and ECNOCOMP=''' + MantFields.FieldbyName('ECNOCOMP').AsString + '''';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   xFiltroIng.RefreshFilter;

   ShowMessage('Registro Eliminado')
End;

Procedure TFRegistro.PGridShow(Sender: TObject);
Var
   i: Integer;
   MGrid: TMant;
Begin

End;

Procedure TFregistro.evt_AdicionaReciboCaja(Sender: TObject);
Var
   xSQL: String;
Begin
   wEstado := 'I';
   DMTE.wModo := 'A';

   xSQL := 'Select * from CXC303 '
      + 'Where CIAID=''ZZ'' AND DOCID=''ZZ''AND CCSERIE=''ZZZ'' AND CCNODOC=''ZZZZ''';
   DMTE.cdsIngDocs.Close;
   DMTE.cdsIngDocs.DataRequest(xSQL);
   DMTE.cdsIngDocs.Open;

// CAJA232  FReciboCaja          Cobranzas CxC
   FReciboCaja := TFReciboCaja.Create(Application);
   FReciboCaja.ActiveMDIChild;
   FVariables.ConfiguraForma(Screen.ActiveForm);
End;

Procedure TFRegistro.evt_EditaReciboCaja(Sender: TObject; MantFields: TFields);
Var
   TransDoc: structDocIng;
   xSQL: String;
Begin
   wEstado := 'E';

   xSQL := 'Select * from CXC303 '
      + 'Where CIAID=''' + MantFields.FieldbyName('CIAID').AsString + ''' '
      + 'AND DOCID=''' + MantFields.FieldbyName('DOCID').AsString + ''' '
      + 'AND CCSERIE=''' + MantFields.FieldbyName('CCSERIE').AsString + ''' '
      + 'AND CCNODOC=''' + MantFields.FieldbyName('CCNODOC').AsString + '''';
   DMTE.cdsIngDocs.Close;
   DMTE.cdsIngDocs.DataRequest(xSQL);
   DMTE.cdsIngDocs.Open;

   If TMant(Sender).FMant.cds2.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No Existen Registros por Editar');
   End;

   If TMant(Sender).FMant.Z2bbtnModifica.Enabled Then
      DMTE.wModo := 'M'
   Else
      DMTE.wModo := 'C';

   With TransDoc, MantFields Do
   Begin
      CIAID := FieldbyName('CIAID').AsString;
      CCTREC := FieldbyName('CCTREC').AsString;
      DOCID := FieldbyName('DOCID').AsString;
      CCSERIE := FieldbyName('CCSERIE').AsString;
      CCNODOC := FieldbyName('CCNODOC').AsString;
   End;

// CAJA232  FReciboCaja          Cobranzas CxC
   FReciboCaja := TFReciboCaja.Create(Application);
   FReciboCaja.ActiveMDIChild;
   FVariables.ConfiguraForma(Screen.ActiveForm);
End;

Procedure TFRegistro.PegaPanelToolRecibo(Sender: TObject);
Var
   cb, cl: TPanel;
Begin

   cb := FToolIngresos.Pnl;
   cl := TMant(Sender).FMant.pnlBtns;
   cl.Height := cb.Height + 2;
   cb.Align := alClient;
   cb.Parent := TMant(Sender).FMant.pnlBtns;
   cl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;

   FToolIngresos.dblcCia.Text := '02';
End;

Procedure TFRegistro.PegaPanelToolEgreso(Sender: TObject);
Var
   cb, cl: TPanel;
Begin
   cb := FToolEgresos.Pnl;
   cl := TMant(Sender).FMant.pnlBtns;
   cl.Height := cb.Height + 2;
   cb.Align := alClient;
   cb.Parent := TMant(Sender).FMant.pnlBtns;
   cl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFRegistro.egr_EditaEgreso(Sender: TObject; MantFields: TFields);
Var
   TransComp: structComprobante;
   xSQL: String;
Begin
   If TMant(Sender).FMant.cds2.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No Existen Registros por Editar');
   End;

// Inicio HPC_201603_CAJA
// Formulario 2 para Registro Global
//   If (FPagoFacturas <> Nil) Or (FPagoGlobal <> Nil) Or (FEgresoCaja <> Nil) Then
   If (FPagoFacturas <> Nil) Or (FPagoGlobal2 <> Nil) Or (FEgresoCaja <> Nil) Then
// Fin HPC_201603_CAJA
   Begin
      ShowMessage('Esta opción esta en Uso');
      Exit;
   End;

   xSQL := 'Select * from CAJA302 '
      + 'Where CIAID=''' + xFiltroEgr.FMant.cds2.FieldByName('CIAID').AsString + ''' '
      + 'and TDIARID=''' + xFiltroEgr.FMant.cds2.FieldByName('TDIARID').AsString + ''' '
      + 'and ECANOMM=''' + xFiltroEgr.FMant.cds2.FieldByName('ECANOMM').AsString + ''' '
      + 'and ECNOCOMP=''' + xFiltroEgr.FMant.cds2.FieldByName('ECNOCOMP').AsString + '''';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.Filter := '';
   DMTE.cdsEgrCaja.DataRequest(xSQL);
   DMTE.cdsEgrCaja.open;

   If DMTE.cdsEgrCaja.FieldByName('EC_PROCE').AsString = '1' Then //'Pago - Doc.NO Provisionados
   Begin
      egr_EditaEgreso_Pago_NoProvisionado;
   End;
   If DMTE.cdsEgrCaja.FieldByName('EC_PROCE').AsString = 'B' Then //'Pago - Doc.Provisionados' ;
   Begin
      egr_EditaEgreso_Pago_Provisionado;
   End;
   If DMTE.cdsEgrCaja.FieldByName('EC_PROCE').AsString = '3' Then //Pago a Proveedores en Banco' ;
   Begin
      egr_EditaEgreso_Pago_ProvBanco;
   End;
   If DMTE.cdsEgrCaja.FieldByName('EC_PROCE').AsString = 'G' Then //Pago a Proveedores en Banco' ;
   Begin
      egr_EditaEgreso_Pago_Global;
   End;
// Inicio HPC_201401_CAJ  11/02/2014  -  Reordenamiento de la sangría a todo el formulario
   If DMTE.cdsEgrCaja.FieldByName('EC_PROCE').AsString = 'I' Then //'Pago - Rendición de Cuenta
   Begin
      egr_EditaEgreso_Rendicion_CajaChica;
   End;
// Fin HPC_201401_CAJ  11/02/2014  -  Reordenamiento de la sangría a todo el formulario
End;

Procedure TFregistro.egr_EditaEgreso_Pago_NoProvisionado;
Var
   TransComp: structComprobante;
   xSQL: String;
Begin
   Try
 // Registro de Pago de Proveedores
      If xFiltroEgr.FMant.cds2.RecordCount = 0 Then
         Raise Exception.Create('No Existen Registros por Editar');

      If xFiltroEgr.FMant.Z2bbtnModifica.Enabled Then
         DMTE.wModo := 'M'
      Else
         DMTE.wModo := 'C';

      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.cdsNivel.Open;
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsFEfec, 'TGE217', 'FLUEFEID');
      DMTE.FiltraTabla(DMTE.cdsEquiv, 'TGE160', '');

      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := ' (DOCMOD=''CAJA'' OR DOCMOD=''CXP'' ) '; // and (FCING<>''S'' or FCING<>''1'')';
      DMTE.cdsTDoc.Filtered := True;

      DMTE.cdsClaseAux.Filter := ' ( CLAUXCP=''P'' OR CLAUXCP=''A'' ) ';
      DMTE.cdsClaseAux.Filtered := True;

      FEgresoCaja := TFEgresoCaja.Create(Application);

      With TransComp Do
      Begin
         CIAID := DMTE.cdsEgrCaja.FieldbyName('CIAID').AsString;
         ECANOMM := DMTE.cdsEgrCaja.FieldbyName('ECANOMM').AsString;
         TDIARID := DMTE.cdsEgrCaja.FieldbyName('TDIARID').AsString;
         ECNOCOMP := DMTE.cdsEgrCaja.FieldbyName('ECNOCOMP').AsString;
      End;
// CAJA201  FEgresoCaja          Pago Documentos No Provisionados
      FEgresoCaja.ActiveMDIChild;

   Finally

   End;
End;

Procedure TFRegistro.egr_EditaEgreso_Pago_Provisionado;
Var
   Comp: structComprobante;
   xSQL: String;
Begin
   Try

      If xFiltroEgr.FMant.cds2.RecordCount = 0 Then
      Begin
         Raise Exception.Create('No Existen Registros por Editar');
      End;
      If xFiltroEgr.FMant.Z2bbtnModifica.Enabled Then
         DMTE.wModo := 'M'
      Else
         DMTE.wModo := 'C';
      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');

      DMTE.cdsNivel.Open;
      DMTE.cdsTDiario1.open;

      DMTE.cdsMovCxP.open;
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsFEfec, 'TGE217', 'FLUEFEID');
      DMTE.FiltraTabla(DMTE.cdsEquiv, 'TGE160', '');
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := ' (DOCMOD=''CAJA'' OR DOCMOD=''CXP'')  ';
      DMTE.cdsTDoc.Filtered := True;

      DMTE.cdsAux.IndexFieldNames := '';
      DMTE.cdsAux.Filter := '';
      If Not DMTE.cdsAux.Active Then
      Begin
         xSQL := 'select CLAUXID,AUXID,AUXRUC,AUXNOMB,AUXABR from CNT201';
         DMTE.cdsAux.Close;
         DMTE.cdsAux.DataRequest(xSQL);
         DMTE.cdsAux.Open;
      End;

      DMTE.cdsClaseAux.Filter := ' ( CLAUXCP=''P'' OR CLAUXCP=''A'' ) ';
      DMTE.cdsClaseAux.Filtered := True;
      DMTE.cdsCnpEgr.Filtered := False;
      DMTE.cdsCnpEgr.Filter := '';

   // Inicio HPC_201603_CAJA
   // Se añade filtro de Estado a apertura de Conceptos de Caja
      DMTE.cdsCnpEgr.Filter := 'CPTOIS=''E'' and ACTIVO=''S'' ';
   // Fin HPC_201603_CAJA

      DMTE.cdsCnpEgr.Filtered := True;
      FPagoFacturas := TFPagoFacturas.Create(Application);
      With Comp Do
      Begin
         CIAID := DMTE.cdsEgrCaja.FieldbyName('CIAID').AsString;
         ECANOMM := DMTE.cdsEgrCaja.FieldbyName('ECANOMM').AsString;
         TDIARID := DMTE.cdsEgrCaja.FieldbyName('TDIARID').AsString;
         ECNOCOMP := DMTE.cdsEgrCaja.FieldbyName('ECNOCOMP').AsString;
      End;

      Try
// CAJA228  FPagoFacturas        Pago Documentos Provisionados
         FPagoFacturas.ActiveMDIChild;
      Except
      End;
   Finally
   End;
End;

Procedure TFRegistro.egr_EditaEgreso_Pago_ProvBanco;
Var
   Comp: structComprobante;
   xSQL: String;
Begin
// Registro de Pago a Varios Provedores
   Try
      DMTE.cdsRegCxP.PacketRecords := 1;
      DMTE.cdsRegCxP.open;
      DMTE.cdsEmpleado.Open;
      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsEquiv, 'TGE160', 'FPAGOID');
      DMTE.FiltraTabla(DMTE.cdsTDiario1, 'TGE104', 'TDIARID');
      DMTE.FiltraTabla(DMTE.cdsFEfec, 'TGE217', 'FLUEFEID');
      DMTE.FiltraTabla(DMTE.cdsNivel, 'CNT202', 'NIVEL');
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := '(DOCMOD=''CAJA'' OR DOCMOD=''CXP'') ';
      DMTE.cdsTDoc.Filtered := True;

      DMTE.cdsClaseAux.Filter := ' ( CLAUXCP=''P'' OR CLAUXCP=''B'' OR CLAUXCP=''A'' ) ';
      DMTE.cdsClaseAux.Filtered := True;

   // Inicio HPC_201603_CAJA
   // Se añade filtro de Estado a apertura de Conceptos de Caja
      DMTE.cdsCnpEgr.Filter := 'CPTOIS=''E'' and ACTIVO=''S'' ';
   // Fin HPC_201603_CAJA

      DMTE.cdsCnpEgr.Filtered := True;
      FPagoProvBco := TFPagoProvBco.Create(Application);

      If xFiltroEgr.FMant.cds2.RecordCount = 0 Then
      Begin
         Raise Exception.Create('No Existen Registros por Editar');
      End;

      If xFiltroEgr.FMant.Z2bbtnModifica.Enabled Then
         DMTE.wModo := 'M'
      Else
         DMTE.wModo := 'C';

      With Comp Do
      Begin
         CIAID := DMTE.cdsEgrCaja.FieldbyName('CIAID').AsString;
         ECANOMM := DMTE.cdsEgrCaja.FieldbyName('ECANOMM').AsString;
         TDIARID := DMTE.cdsEgrCaja.FieldbyName('TDIARID').AsString;
         ECNOCOMP := DMTE.cdsEgrCaja.FieldbyName('ECNOCOMP').AsString;
      End;
      Try
// CAJA247  FPagoProvBco         Pago Varios Proveedores
         FPagoProvBco.ActiveMDIChild;
      Except
      End;

   Finally
   End;

End;

Procedure TFRegistro.egr_EditaEgreso_Pago_Global;
Var
   Comp: structComprobante;
   xSQL: String;
Begin
// Registro de Pago a Provedores Global
   Try
      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsEquiv, 'TGE160', 'FPAGOID');
      DMTE.FiltraTabla(DMTE.cdsTDiario1, 'TGE104', 'TDIARID');
      DMTE.FiltraTabla(DMTE.cdsFEfec, 'TGE217', 'FLUEFEID');
      DMTE.FiltraTabla(DMTE.cdsNivel, 'CNT202', 'NIVEL');
      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := '(DOCMOD=''CAJA'' OR DOCMOD=''CXP'') ';
      DMTE.cdsTDoc.Filtered := True;

      DMTE.cdsClaseAux.Filter := ' ( CLAUXCP=''P'' OR CLAUXCP=''B'' OR CLAUXCP=''A'' ) ';
      DMTE.cdsClaseAux.Filtered := True;

   // Inicio HPC_201603_CAJA
   // Se añade filtro de Estado a apertura de Conceptos de Caja
      DMTE.cdsCnpEgr.Filter := 'CPTOIS=''E'' and ACTIVO=''S'' ';
   // Fin HPC_201603_CAJA

      DMTE.cdsCnpEgr.Filtered := True;

   // Inicio HPC_201603_CAJA
   // Formulario Nuevo para Registro Global
   //   FPagoGlobal := TFPagoGlobal.Create(Application);
   // Inicio HPC_201703_CAJA
   // Validación SEMT para proveedores con cobranza coactiva
      //FPagoGlobal2 := TFPagoGlobal2.Create(Application);
   // Final HPC_201703_CAJA
   // Fin HPC_201603_CAJA

      If xFiltroEgr.FMant.cds2.RecordCount = 0 Then
      Begin
         Raise Exception.Create('No Existen Registros por Editar');
      End;

      If xFiltroEgr.FMant.Z2bbtnModifica.Enabled Then
         DMTE.wModo := 'M'
      Else
         DMTE.wModo := 'C';
      // Inicio HPC_201703_CAJA
      // Validación SEMT para proveedores con cobranza coactiva
      FPagoGlobal2 := TFPagoGlobal2.Create(Application);
      // Final HPC_201703_CAJA
      With Comp Do
      Begin
         CIAID := DMTE.cdsEgrCaja.FieldbyName('CIAID').AsString;
         ECANOMM := DMTE.cdsEgrCaja.FieldbyName('ECANOMM').AsString;
         TDIARID := DMTE.cdsEgrCaja.FieldbyName('TDIARID').AsString;
         ECNOCOMP := DMTE.cdsEgrCaja.FieldbyName('ECNOCOMP').AsString;
      End;
      Try
      // Inicio HPC_201603_CAJA
      // Formulario 2 para Registro Global
      //   FPagoGlobal.ActiveMDIChild;
         FPagoGlobal2.ActiveMDIChild;
      // Inicio HPC_201603_CAJA
      Except
      End;

   Finally
   End;
End;

// Inicio HPC_201401_CAJA
Procedure TFregistro.egr_EditaEgreso_Rendicion_CajaChica;
Var
   TransComp: structComprobante;
   xSQL: String;
Begin
   Try
 // Registro de Pago de Proveedores
      If xFiltroEgr.FMant.cds2.RecordCount = 0 Then
         Raise Exception.Create('No Existen Registros por Editar');

      If xFiltroEgr.FMant.Z2bbtnModifica.Enabled Then
         DMTE.wModo := 'M'
      Else
         DMTE.wModo := 'C';

      DMTE.FiltraTabla(DMTE.cdsBancoEgr, 'TGE105', 'BANCOID');
      DMTE.cdsNivel.Open;
      DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID');
      DMTE.FiltraTabla(DMTE.cdsFEfec, 'TGE217', 'FLUEFEID');
      DMTE.FiltraTabla(DMTE.cdsEquiv, 'TGE160', '');

      DMTE.FiltraTabla(DMTE.cdsTDoc, 'TGE110', 'DOCID');
      DMTE.cdsTDoc.Filter := ' (DOCMOD=''CAJA'' OR DOCMOD=''CXP'' ) '; // and (FCING<>''S'' or FCING<>''1'')';
      DMTE.cdsTDoc.Filtered := True;

      DMTE.cdsClaseAux.Filter := ' ( CLAUXCP=''P'' OR CLAUXCP=''A'' ) ';
      DMTE.cdsClaseAux.Filtered := True;

      FRendicionCaja  := TFRendicionCaja .Create(Application);

      With TransComp Do
      Begin
         CIAID := DMTE.cdsEgrCaja.FieldbyName('CIAID').AsString;
         ECANOMM := DMTE.cdsEgrCaja.FieldbyName('ECANOMM').AsString;
         TDIARID := DMTE.cdsEgrCaja.FieldbyName('TDIARID').AsString;
         ECNOCOMP := DMTE.cdsEgrCaja.FieldbyName('ECNOCOMP').AsString;
      End;
   // CAJA258  FRendicionCaja   Rendición de Caja
      FRendicionCaja .ActiveMDIChild;
   Finally

   End;
End;
// Fin HPC_201401_CAJA

Procedure TFRegistro.EmiteChq(NombreArchivo: String; strChq: structChq);
Var
   Banda,
      Componente: Integer;
   PPREPORT1: TppReport;
Begin
   If TRIM(strChq.ppFileName) = '' Then
      Raise exception.create('No hay formato de impresión parar este Cheque' + #13 +
         'comuniquese con el implementador');
   Try
      ppreport1 := TppReport.Create(self);
      PPREPORT1.DeviceType := dtPrinter;

      PPREPORT1.TEMPLATE.FileName := wRutaRpt + '\' + strChq.ppFileName;
      ppreport1.template.LoadFromFile;

      If PPREPORT1.ObjectByName(bANDA, Componente, 'ppGiradoa') Then
         ppreport1.Bands[Banda].Objects[Componente].Caption := trim(strChq.ppGiradoA)
            + stringofchar('*', 120 - length(trim(strChq.ppGiradoA)));

      strChq.ppImporte := Format('%15.2n', [strtofloat(strChq.ppImporte)]);
      strChq.ppImporte := StringReplace(strChq.ppImporte, ' ', '*', [rfreplaceAll]);

      If PPREPORT1.ObjectByName(Banda, Componente, 'ppImporte') Then
         ppreport1.Bands[Banda].Objects[Componente].Caption := strChq.ppImporte;

      If PPREPORT1.ObjectByName(Banda, Componente, 'ppMontoLetras') Then
      Begin
         If length(trim(strChq.ppMontoLetras)) > 58 Then ppreport1.Bands[Banda].Objects[Componente].Font.Size := 8;
         If length(trim(strChq.ppMontoLetras)) > 67 Then ppreport1.Bands[Banda].Objects[Componente].Font.Size := 7;
         If length(trim(strChq.ppMontoLetras)) > 80 Then ppreport1.Bands[Banda].Objects[Componente].Font.Size := 6;

         ppreport1.Bands[Banda].Objects[Componente].Caption := trim(strChq.ppMontoLetras)
            + stringofchar('*', 120 - length(trim(strChq.ppMontoLetras)));
      End;

      If PPREPORT1.ObjectByName(Banda, Componente, 'ppDia') Then
         ppreport1.Bands[Banda].Objects[Componente].Caption := strChq.ppDia;
      If PPREPORT1.ObjectByName(Banda, Componente, 'ppMes') Then
         ppreport1.Bands[Banda].Objects[Componente].Caption := strChq.ppMes;
      If PPREPORT1.ObjectByName(Banda, Componente, 'ppAno') Then
         ppreport1.Bands[Banda].Objects[Componente].Caption := strChq.ppAno;
      If PPREPORT1.ObjectByName(Banda, Componente, 'ppRuc') Then
         ppreport1.Bands[Banda].Objects[Componente].Caption := strChq.ppRUC;
      If Application.MessageBox('Coloque Cheque en la Impresora',
         'Confirmación Impresión',
         MB_OKCANCEL + MB_DEFBUTTON1) = IDOK Then
      Begin
         ppreport1.OnPrintingComplete := ChqCompleto;

         ppd1.Report := ppReport1;
      // Inicio HPC_201403_CAJA
      // cambia control de diseño de reporte
      //   if cbDisenoRep.Checked then
      //      ppd1.ShowModal
      //   Else
            ppReport1.Print;
      // Fin HPC_201403_CAJA
      End;

   Finally
      ppReport1.free;
   End;
End;

Procedure TFRegistro.ChqCompleto;
Begin
   DMTE.xFlagP := true;
End;

Procedure TFRegistro.evt_AdicionaPagoProvRep(Sender: TObject);
Var
   xSQL: String;
Begin
   Try
      xSQL := 'Select * from CAJA302 '
         + 'Where CIAID=''ZZ'' and TDIARID=''ZZ'' and ECANOMM=''ZZXXXX'' and ECNOCOMP=''ZZXXZZXX''';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.open;

      DMTE.wModo := 'A';
// CAJA240  FPagoProvRep         Rendicion de Cuenta
      FPagoProvRep := TFPagoProvRep.Create(Application);
      FPagoProvRep.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);

   Except
      Showmessage('Sucedió un ERROR');
   End;
End;

Procedure TFRegistro.evt_EditaPagoProvRep(Sender: TObject; MantFields: TFields);
Var
   Comp: structComprobante;
   xSQL: String;
Begin
   xSQL := 'Select * from CAJA302 '
      + 'Where CIAID=''' + FRegistro.xFiltroPVProv.FMant.cds2.FieldByName('CIAID').AsString + ''' '
      + 'and TDIARID=''' + FRegistro.xFiltroPVProv.FMant.cds2.FieldByName('TDIARID').AsString + ''' '
      + 'and ECANOMM=''' + FRegistro.xFiltroPVProv.FMant.cds2.FieldByName('ECANOMM').AsString + ''' '
      + 'and ECNOCOMP=''' + FRegistro.xFiltroPVProv.FMant.cds2.FieldByName('ECNOCOMP').AsString + '''';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest(xSQL);
   DMTE.cdsEgrCaja.open;

   If DMTE.cdsEgrCaja.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No Existen Registros por Editar');
   End;

   If FRegistro.xFiltroPVProv.FMant.Z2bbtnModifica.Enabled Then
      DMTE.wModo := 'M'
   Else
      DMTE.wModo := 'C';

   With Comp, MantFields Do
   Begin
      CIAID := FieldbyName('CIAID').AsString;
      ECANOMM := FieldbyName('ECANOMM').AsString;
      TDIARID := FieldbyName('TDIARID').AsString;
      ECNOCOMP := FieldbyName('ECNOCOMP').AsString;
   End;
   Try
// CAJA240  FPagoProvRep         Rendicion de Cuenta
      FPagoProvRep := TFPagoProvRep.Create(Application);
      FPagoProvRep.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
      Showmessage('Sucedio un error');
   End;
End;

Procedure TFRegistro.FiltraDocumento;
Var
   xWhere, xDocId: String;
Begin
   xWhere := ' DOCTIPREG=''FF'' AND DOCMOD=''CAJA'' ';
   xDocId := DMTE.DisplayDescrip('prvTGE', 'TGE110', 'DOCID', xWhere, 'DOCID');
   If Length(Trim(xDocId)) = 0 Then
      Raise exception.Create('Registre un Documento para Fondo Fijo');
End;

Procedure TFRegistro.evt_Adiciona(Sender: TObject);
Begin
   ShowMessage('No se Puede Adicionar');
End;

Procedure TFRegistro.evt_Edita(Sender: TObject; MantFields: TFields);
Begin
   ShowMessage('No se Puede Editar');
End;

Procedure TFRegistro.ToolCheque(Sender: TObject);
Var
   pl: TPanel;
   pl1: TPanel;
Begin
   pl1 := FToolCheque.pnlCheque;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.Height := pl1.Height + 2;
   pl1.Align := alClient;
   pl1.Parent := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
   FToolCheque.FecCheque.Date := DateS;
End;

Procedure TFRegistro.evt_AdicionaFFijo(Sender: TObject);
Var
   xSQL: String;
Begin
   Try
      xSQL := 'Select * from CAJA302 '
         + 'Where CIAID=''ZZ'' and TDIARID=''ZZ'' and ECANOMM=''ZZXXXX'' and ECNOCOMP=''ZZXXZZXX''';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.open;

      DMTE.wModo := 'A';
// CAJA253  FFondoFijo           Fondo Fijo
      FFondoFijo := TFFondoFijo.Create(Application);
      FFondoFijo.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
      Showmessage('Sucedió un ERROR');
   End;
End;

Procedure TFRegistro.evt_EditaFFijo(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
Begin

   xSQL := 'Select * from CAJA302 '
      + 'Where CIAID=''' + FRegistro.xFiltroPagoProvBco.FMant.cds2.FieldByName('CIAID').AsString + ''' '
      + 'and TDIARID=''' + FRegistro.xFiltroPagoProvBco.FMant.cds2.FieldByName('TDIARID').AsString + ''' '
      + 'and ECANOMM=''' + FRegistro.xFiltroPagoProvBco.FMant.cds2.FieldByName('ECANOMM').AsString + ''' '
      + 'and ECNOCOMP=''' + FRegistro.xFiltroPagoProvBco.FMant.cds2.FieldByName('ECNOCOMP').AsString + '''';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest(xSQL);
   DMTE.cdsEgrCaja.open;

   If DMTE.cdsEgrCaja.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No Existen Registros por Editar');
   End;

   If FRegistro.xFiltroPagoProvBco.FMant.Z2bbtnModifica.Enabled Then
      DMTE.wModo := 'M'
   Else
      DMTE.wModo := 'C';

   Try
// CAJA253  FFondoFijo           Fondo Fijo
      FFondoFijo := TFFondoFijo.Create(Application);
      FFondoFijo.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
      Showmessage('Sucedio un error');
   End;
End;

Procedure TFRegistro.evt_AdicionaChequeAnul(Sender: TObject);
Var
   xSQL: String;
Begin
   Try
      xSQL := 'Select * from CAJA302 '
         + 'Where CIAID=''ZZ'' and TDIARID=''ZZ'' and ECANOMM=''ZZXXXX'' and ECNOCOMP=''ZZXXZZXX''';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.open;

      DMTE.wModo := 'A';
// CAJA254  FAnulCheque          Anula Cheques
      FAnulCheque := TFAnulCheque.Create(Application);
      FAnulCheque.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
      ShowMessage('Sucedió un ERROR');
   End;
End;

Procedure TFRegistro.evt_EditaChequeAnul(Sender: TObject; MantFields: TFields);
Var
   Comp: structComprobante;
   xSQL: String;
Begin
   Try
      xSQL := 'Select * from CAJA302 '
         + 'Where CIAID=''' + FRegistro.xFiltroPagoProvBco.FMant.cds2.FieldByName('CIAID').AsString + ''' '
         + 'and TDIARID=''' + FRegistro.xFiltroPagoProvBco.FMant.cds2.FieldByName('TDIARID').AsString + ''' '
         + 'and ECANOMM=''' + FRegistro.xFiltroPagoProvBco.FMant.cds2.FieldByName('ECANOMM').AsString + ''' '
         + 'and ECNOCOMP=''' + FRegistro.xFiltroPagoProvBco.FMant.cds2.FieldByName('ECNOCOMP').AsString + '''';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.open;

      If DMTE.cdsEgrCaja.RecordCount = 0 Then
      Begin
         Raise Exception.Create('No Existen Registros por Editar');
      End;

      If FRegistro.xFiltroPagoProvBco.FMant.Z2bbtnModifica.Enabled Then
         DMTE.wModo := 'M'
      Else
         DMTE.wModo := 'C';

      With Comp, MantFields Do
      Begin
         CIAID := FieldbyName('CIAID').AsString;
         ECANOMM := FieldbyName('ECANOMM').AsString;
         TDIARID := FieldbyName('TDIARID').AsString;
         ECNOCOMP := FieldbyName('ECNOCOMP').AsString;
      End;
// CAJA254  FAnulCheque          Anula Cheques
      FAnulCheque := TFAnulCheque.Create(Application);
      FAnulCheque.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
      ShowMessage('Sucedió un error');
   End;
End;

Procedure TFRegistro.evt_AdicionaComVenMon(Sender: TObject);
Var
   xSQL: String;
Begin
   Try
      xSQL := 'Select * from CAJA302 '
         + 'Where CIAID=''ZZ'' and TDIARID=''ZZ'' and ECANOMM=''ZZXXXX'' and ECNOCOMP=''ZZXXZZXX''';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.open;

      DMTE.wModo := 'A';
// CAJA209  FComVenMon           Compra Venta de Moneda Extranjera
      FComVenMon := TFComVenMon.create(Application);
      FComVenMon.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
   End;
End;

Procedure TFRegistro.evt_EditaComVenMon(Sender: TObject; MantFields: TFields);
Var
   TransComp: structComprobante;
   xSQL: String;
Begin
   Try
      xSQL := 'Select * from CAJA302 '
         + 'Where CIAID=''' + FRegistro.xFiltroCV.FMant.cds2.FieldByName('CIAID').AsString + ''' '
         + 'and TDIARID=''' + FRegistro.xFiltroCV.FMant.cds2.FieldByName('TDIARID').AsString + ''' '
         + 'and ECANOMM=''' + FRegistro.xFiltroCV.FMant.cds2.FieldByName('ECANOMM').AsString + ''' '
         + 'and ECNOCOMP=''' + FRegistro.xFiltroCV.FMant.cds2.FieldByName('ECNOCOMP').AsString + '''';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.open;

      If DMTE.cdsEgrCaja.RecordCount = 0 Then
      Begin
         Raise Exception.Create('No Existen Registros por Editar');
      End;

      If FRegistro.xFiltroCV.FMant.Z2bbtnModifica.Enabled Then
         DMTE.wModo := 'M'
      Else
         DMTE.wModo := 'C';

      ShowMessage('ec_ie : ' + DMTE.cdsEgrCaja.FieldByname('EC_IE').AsString);
      If DMTE.cdsEgrCaja.FieldByname('EC_IE').AsString = 'E' Then
      Begin
         With TransComp, MantFields Do
         Begin
            CIAID := FieldbyName('CIAID').AsString;
            ECANOMM := FieldbyName('ECANOMM').AsString;
            TDIARID := FieldbyName('TDIARIO2').AsString;
            ECNOCOMP := FieldbyName('ECNOCOMP2').AsString;
         End;
      End
      Else
      Begin
         TransComp.CIAID := DMTE.cdsEgrCaja.FieldbyName('CIAID').AsString;
         TransComp.ECANOMM := DMTE.cdsEgrCaja.FieldbyName('ECANOMM').AsString;
         TransComp.TDIARID := DMTE.cdsEgrCaja.FieldbyName('TDIARID').AsString;
         TransComp.ECNOCOMP := DMTE.cdsEgrCaja.FieldbyName('ECNOCOMP').AsString;
      End;

// CAJA209  FComVenMon           Compra Venta de Moneda Extranjera
      FComVenMon := TFComVenMon.create(Application);
      FComVenMon.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
   End;
End;

Procedure TFRegistro.evt_AdicionaTrans(Sender: TObject);
Var
   xSQL: String;
Begin
   DMTE.wModo := 'A';

   xSQL := 'Select * from CAJA302 '
      + 'Where CIAID=''ZZ'' and TDIARID=''ZZ'' and ECANOMM=''ZZXXXX'' and ECNOCOMP=''ZZXXZZXX''';
   DMTE.cdsEgrCajaX.Close;
   DMTE.cdsEgrCajaX.DataRequest(xSQL);
   DMTE.cdsEgrCajaX.open;

// CAJA218  FTransferencia       Transferencias
   FTransferencia := TFTransferencia.Create(Application);
   FTransferencia.ActiveMDIChild;
   FVariables.ConfiguraForma(Screen.ActiveForm);
End;

Procedure TFRegistro.evt_EditaTrans(Sender: TObject; MantFields: TFields);
Var
   TransComp: structComprobante;
   xSQL: String;
Begin
   If TMant(Sender).FMant.cds2.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No Existen Registros por Editar');
   End;

   If TMant(Sender).FMant.Z2bbtnModifica.Enabled Then
      DMTE.wModo := 'M'
   Else
      DMTE.wModo := 'C';

   xSQL := 'Select * from CAJA302 '
      + 'Where CIAID=''' + FRegistro.xFiltroTrans.FMant.cds2.FieldByName('CIAID').AsString + ''' '
      + 'and TDIARID=''' + FRegistro.xFiltroTrans.FMant.cds2.FieldByName('TDIARID').AsString + ''' '
      + 'and ECANOMM=''' + FRegistro.xFiltroTrans.FMant.cds2.FieldByName('ECANOMM').AsString + ''' '
      + 'and ECNOCOMP=''' + FRegistro.xFiltroTrans.FMant.cds2.FieldByName('ECNOCOMP').AsString + '''';
   DMTE.cdsEgrCajaX.Close;
   DMTE.cdsEgrCajaX.DataRequest(xSQL);
   DMTE.cdsEgrCajaX.open;

   If DMTE.cdsEgrCajaX.FieldByname('EC_IE').AsString = 'E' Then
   Begin
      With TransComp, MantFields Do
      Begin
         CIAID := FieldbyName('CIAID').AsString;
         ECANOMM := FieldbyName('ECANOMM').AsString;
         TDIARID := FieldbyName('TDIARID').AsString;
         ECNOCOMP := FieldbyName('ECNOCOMP').AsString;
      End;
   End
   Else
   Begin
      TransComp.CIAID := DMTE.cdsEgrCajaX.FieldbyName('CIAID').AsString;
      TransComp.ECANOMM := DMTE.cdsEgrCajaX.FieldbyName('ECANOMM').AsString;
      TransComp.TDIARID := DMTE.cdsEgrCajaX.FieldbyName('TDIARIO2').AsString;
      TransComp.ECNOCOMP := DMTE.cdsEgrCajaX.FieldbyName('ECNOCOMP2').AsString;
      If Not DMTE.cdsEgrCajaX.Locate('CIAID;TDIARID;ECANOMM;ECNOCOMP;ECNODOC',
         VarArrayOf([TransComp.CIAID, TransComp.TDIARID, TransComp.ECANOMM, TransComp.ECNOCOMP,
         DMTE.cdsEgrCajaX.FieldbyName('ECNODOC').AsString]), [loPartialKey]) Then
         Exit;
   End;
// CAJA218  FTransferencia       Transferencias
   FTransferencia := TFTransferencia.Create(Application);
   FTransferencia.ActiveMDIChild;
   FVariables.ConfiguraForma(Screen.ActiveForm);
End;

Procedure TFRegistro.evt_AdicionaMovBanco(Sender: TObject);
Var
   xSQL: String;
Begin
   DMTE.wModo := 'A';
   xSQL := 'Select * from CAJA302 '
      + 'Where CIAID=''ZZ'' and TDIARID=''ZZ'' and ECANOMM=''ZZXXXX'' and ECNOCOMP=''ZZXXZZXX''';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest(xSQL);
   DMTE.cdsEgrCaja.open;

// CAJA235  FMovBcos             Movimiento de Bancos
   FMovBcos := TFMovBcos.Create(Application);
   FMovBcos.AsignaCDSFiltro(TMant(Sender).FMant.cds2);
   FMovBcos.ActiveMDIChild;
   FVariables.ConfiguraForma(Screen.ActiveForm);
End;

Procedure TFRegistro.evt_EditaMovBanco(Sender: TObject;
   MantFields: TFields);
Var
   TransComp: structComprobante;
   xSQL: String;
Begin
   If TMant(Sender).FMant.cds2.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No Existen Registros por Editar');
   End;

   If TMant(Sender).FMant.Z2bbtnModifica.Enabled Then
      DMTE.wModo := 'M'
   Else
      DMTE.wModo := 'C';

   xSQL := 'Select * from CAJA302 '
      + 'Where CIAID=''' + FRegistro.xFiltroMovBancos.FMant.cds2.FieldByName('CIAID').AsString + ''' '
      + 'and TDIARID=''' + FRegistro.xFiltroMovBancos.FMant.cds2.FieldByName('TDIARID').AsString + ''' '
      + 'and ECANOMM=''' + FRegistro.xFiltroMovBancos.FMant.cds2.FieldByName('ECANOMM').AsString + ''' '
      + 'and ECNOCOMP=''' + FRegistro.xFiltroMovBancos.FMant.cds2.FieldByName('ECNOCOMP').AsString + '''';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest(xSQL);
   DMTE.cdsEgrCaja.open;

   With TransComp, MantFields Do
   Begin
      CIAID := FieldbyName('CIAID').AsString;
      ECANOMM := FieldbyName('ECANOMM').AsString;
      TDIARID := FieldbyName('TDIARID').AsString;
      ECNOCOMP := FieldbyName('ECNOCOMP').AsString;
   End;
// CAJA235  FMovBcos             Movimiento de Bancos
   FMovBcos := TFMovBcos.Create(Application);
   FMovBcos.ActiveMDIChild;
   FVariables.ConfiguraForma(Screen.ActiveForm);
End;

Procedure TFRegistro.PegaPanelToolConciliacion(Sender: TObject);
Var
   cb, cl: TPanel;
Begin
   cb := FToolConciliacion.Pnl;
   cl := TMant(Sender).FMant.pnlBtns;
   cb.Parent := TMant(Sender).FMant.pnlBtns;
   cl.Height := cb.Height + 5;
   cb.Align := alClient;
   cl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFRegistro.gc_AdicionaConciliacion(Sender: TObject);
Var
   xSQL: String;
Begin
   DMTE.wModo := 'A';
   xSQL := 'Select * from CAJA316 '
      + 'Where CIAID=''ZZ'' AND GCONCID=''ZZ'' AND GCONANOMM=''ZZYYYY''';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest(xSQL);
   DMTE.cdsEgrCaja.Open;
   DMTE.cdsEgrCaja.Insert;

   DMTE.cdsCia.Open;

// CAJA221  FConBank             Conciliacion Bancaria
   FConBank := TFConBank.Create(Application);
   FConBank.ActiveMDIChild;
   FVariables.ConfiguraForma(Screen.ActiveForm);

End;

Procedure TFRegistro.gc_EditaConciliacion(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
Begin
   DMTE.wModo := 'M';
   xSQL := 'Select * from CAJA316 '
      + 'Where CIAID=''' + FRegistro.xMant.FMant.cds2.FieldByName('CIAID').AsString + ''' '
      + 'AND GCONCID=''' + FRegistro.xMant.FMant.cds2.FieldByName('GCONCID').AsString + ''' '
      + 'AND GCONANOMM=''' + FRegistro.xMant.FMant.cds2.FieldByName('GCONANOMM').AsString + '''';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest(xSQL);
   DMTE.cdsEgrCaja.Open;

   DMTE.cdsCia.Open;
// CAJA221  FConBank             Conciliacion Bancaria
   FConBank := TFConBank.Create(Application);
   FConBank.ActiveMDIChild;
   FVariables.ConfiguraForma(Screen.ActiveForm);
End;

Procedure TFRegistro.PegaToolDocProv(Sender: TObject);
Var
   cb, cl: TPanel;
Begin
   cb := FToolDocProv.PnlComprobante;
   cl := TMant(Sender).FMant.pnlBtns;
   cb.Parent := TMant(Sender).FMant.pnlBtns;
   cl.Height := cb.Height + 5;
   cb.Align := alClient;
   cl.AutoSize := True;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFRegistro.evt_AdicionaPagoFacturasCobrar(Sender: TObject);
Var
   xSQL: String;
Begin
   Try
      DMTE.wModo := 'I';
      xSQL := 'Select * from CAJA302 '
         + 'Where CIAID=''ZZ'' AND TDIARID=''ZZ'' AND ECANOMM=''ZZYYYY'' AND ECNOCOMP=''ZXZXZX''';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.Open;

// CAJA249  FPagoFacturasCobrar  PagoNotasdeabono
      FPagoFacturasCobrar := TFPagoFacturasCobrar.Create(Application);
      FPagoFacturasCobrar.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
      Showmessage('Sucedió un Error En la Apertura');
   End;
End;

Procedure TFRegistro.evt_EditaPagoFacturasCobrar(Sender: TObject;
   MantFields: TFields);
Var
   Comp: structComprobante;
   xSQL: String;
Begin

   If TMant(Sender).FMant.cds2.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No Existen Registros por Editar');
   End;
   If TMant(Sender).FMant.Z2bbtnModifica.Enabled Then
      DMTE.wModo := 'M'
   Else
      DMTE.wModo := 'C';

   xSQL := 'Select * from CAJA302 '
      + 'Where CIAID=''' + FRegistro.xFiltroPProv.FMant.cds2.FieldByName('CIAID').AsString + ''' '
      + 'and TDIARID=''' + FRegistro.xFiltroPProv.FMant.cds2.FieldByName('TDIARID').AsString + ''' '
      + 'and ECANOMM=''' + FRegistro.xFiltroPProv.FMant.cds2.FieldByName('ECANOMM').AsString + ''' '
      + 'and ECNOCOMP=''' + FRegistro.xFiltroPProv.FMant.cds2.FieldByName('ECNOCOMP').AsString + '''';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest(xSQL);
   DMTE.cdsEgrCaja.open;

   With Comp, MantFields Do
   Begin
      CIAID := FieldbyName('CIAID').AsString;
      ECANOMM := FieldbyName('ECANOMM').AsString;
      TDIARID := FieldbyName('TDIARID').AsString;
      ECNOCOMP := FieldbyName('ECNOCOMP').AsString;
   End;
   Try
// CAJA249  FPagoFacturasCobrar  PagoNotasdeabono
      FPagoFacturasCobrar := TFPagoFacturasCobrar.Create(Application);
      FPagoFacturasCobrar.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Except
   End;
End;

Procedure TFRegistro.evt_AdicionaContabIng(Sender: TObject);
Var
   xSQL: String;
Begin
   Try
      DMTE.wModo := 'A';

      xSQL := 'Select * from CAJA302 '
         + 'Where CIAID=''ZZ'' AND TDIARID=''ZZ'' AND ECANOMM=''ZZYYYY'' AND ECNOCOMP=''ZXZXZX''';
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.Open;

// CAJA233  FContabIng           Contabiliza Ingresos
      FContabIng := TFContabIng.Create(Application);
      FContabIng.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
   Finally
   End;
End;

Procedure TFRegistro.evt_EditaContabIng(Sender: TObject; MantFields: TFields);
Var
   TransComp: structComprobante;
   xSQL: String;
Begin

   If TMant(Sender).FMant.cds2.RecordCount = 0 Then
   Begin
      Raise Exception.Create('No Existen Registros por Editar');
   End;

   If TMant(Sender).FMant.Z2bbtnModifica.Enabled Then
      DMTE.wModo := 'M'
   Else
      DMTE.wModo := 'C';

   xSQL := 'Select * from CAJA302 '
      + 'Where CIAID=''' + FRegistro.xFiltroContab.FMant.cds2.FieldByName('CIAID').AsString + ''' '
      + 'and TDIARID=''' + FRegistro.xFiltroContab.FMant.cds2.FieldByName('TDIARID').AsString + ''' '
      + 'and ECANOMM=''' + FRegistro.xFiltroContab.FMant.cds2.FieldByName('ECANOMM').AsString + ''' '
      + 'and ECNOCOMP=''' + FRegistro.xFiltroContab.FMant.cds2.FieldByName('ECNOCOMP').AsString + '''';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest(xSQL);
   DMTE.cdsEgrCaja.open;

   With TransComp, MantFields Do
   Begin
      CIAID := FieldbyName('CIAID').AsString;
      ECANOMM := FieldbyName('ECANOMM').AsString;
      TDIARID := FieldbyName('TDIARID').AsString;
      ECNOCOMP := FieldbyName('ECNOCOMP').AsString;
   End;
// CAJA233  FContabIng           Contabiliza Ingresos
   FContabIng := TFContabIng.Create(Application);
   FContabIng.ActiveMDIChild;
   FVariables.ConfiguraForma(Screen.ActiveForm);
End;

Procedure TFRegistro.ToolAsociaCreate(Sender: TObject);
Var
   pl, pg: TPanel;
Begin
   pg := FToolAportes.pnlBot;
   pl := TMant(Sender).FMant.pnlBtns;
   pl.AutoSize := True;
   pg.Align := alClient;
   pg.Parent := TMant(Sender).FMant.pnlBtns;
   pl.Height := pg.Height + 5;
   TMant(Sender).FMant.pnlBtns.Visible := True;
End;

Procedure TFRegistro.OnEditAsoCta(Sender: TObject; MantFields: TFields);
Var
   xSQL: String;
Begin
   If Not DMTE.DCOM1.Connected Then Exit;
   Screen.Cursor := crHourGlass;

   FIngresoCaja.dblcdAso.Text := MantFields.FieldByName('ASOID').AsString;
   FIngresoCaja.dblcdAsoExit(Sender);
   TMant(Sender).FMant.Close;
   FIngresoCaja.dblcdAso.SetFocus;

   Screen.Cursor := crDefault;
End;

Procedure TEVerificaVersion;
Begin
   If DMTE = Nil Then exit;
   If Not DMTE.DCOM1.Connected Then Exit;
   FRegistro := TFRegistro.Create(Application);
   If DMTE.fg_VerificaVersion(FRegistro.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.' + #13 + 'Comuníquese con Soporte Técnico');
      Application.Terminate;
      Exit;
   End;
End;
// Inicio HPC_201308_CAJA
// Se retira Mantenimiento de Maestro de Clientes de este contenedor
{
Procedure TEMaestroCliente;
Begin
// CLIE001 MAESTRO DE CLIENTE
      FMaesClie := TFMaesClie(Application);
      FMaesClie.ActiveMDIChild;
      FVariables.ConfiguraForma(Screen.ActiveForm);
End;
}
// Fin HPC_201308_CAJA

End.


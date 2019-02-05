Unit CAJA287;
// Inicio Uso Estándares:   01/08/2011
// Unidad               :   CxP264
// Formulario           :   FPagoDetCab
// Fecha de Creación    :
// Autor                :   Hugo Noriega
// Objetivo             :   Registra la cabecera de la Orden de pago

// Actualizaciones      :
// HPP_201108_CAJA  28/12/2012  contabilizar pago de detracciones.
// HPC_201209_CAJA  22/01/2013  contabilizar el pago de las detracciones en un
//                              único asiento en la principal y un asiento en
//                              la filial
// HPC_201305_CAJA  06/05/2013  Se modifica la generación del asiento contable
//                              para que el periodo del asiento sea el mismo
//                              que el mes de contabilización del pago de la
//                              detracción.
// HPC_201310_CAJA 14/11/2013  Automatizacion de detracciones y autodetracciones pago manual
// HPC_201312_CAJA 11/12/2013  Control Transaccional a la Contabilización
// HPC_201403_CAJA cambia control de diseño de reporte
// HPC_201501_CAJA 12/01/2015  Cambia estructura de archivo texto de exportación para el Banco de la Nación
//                             Automatización en el Pago de Detracciones de Proveedores generada por
//                             Orden de Pago en el Módulo de Tesorería.
// HPC_201502_CAJA 28/09/2015  Se agrega campo MODULO en la grabación de la cabecera
//                             Se agrega rutina que recupera detalle luego de la grabación del archivo de Exportación
//                             Se corrige SQL en donde se indica el Orden de la Consulta Select
//                             Se agrega campos que se utilizan para la Exportación
//                             Se retira comentario de HPC_201501_CAJA
// HPC_201603_CAJA 31/10/2016  Valida Cierre Contable
// HPC_201701_CAJA Corrección del cálculo del importe pagado
// HPC_201702_CAJA CORREGIR CUENTA DE FILIAL
// HPC_201703_CAJA Número de constancia de Depósito Detracciones
// HPC_201705_CAJA Ajustes en la generación de asientos contables por pago de detracciones
//                 Ajustes en la anulación de un pago de detracción
// HPC_201706_CAJA Número de constancia de Depósito Detracciones

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, DBCtrls, wwdblook,
   wwdbdatetimepicker, Mask, wwdbedit, ExtCtrls, DB, ppEndUsr, ppProd,
   ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands, ppCache;

Type
   TFPagoDetCab = Class(TForm)
      dbgDetalle: TwwDBGrid;
      pnlCab: TPanel;
      Label2: TLabel;
      dbeNumero: TwwDBEdit;
      Label3: TLabel;
      DBMemo: TDBMemo;
      Panel2: TPanel;
      pnlGraba: TPanel;
      Label4: TLabel;
      bbtnGraba: TBitBtn;
      dbeUsuGraba: TwwDBEdit;
      pnlVisa: TPanel;
      Label5: TLabel;
      bbtnAcepta: TBitBtn;
      dbeUsuAcepta: TwwDBEdit;
      z2bbtnAnula: TBitBtn;
      wwDBGrid1IButton: TwwIButton;
      bbtnExporta: TBitBtn;
      sdGraba: TSaveDialog;
      Memo1: TMemo;
      edtEstado: TEdit;
      pnlCab2: TPanel;
      lblBanco: TLabel;
      dblcBanco: TwwDBLookupCombo;
      edtBanco: TEdit;
      lblCCBco: TLabel;
      dblcCCBco: TwwDBLookupCombo;
      pnlCnt: TPanel;
      Label6: TLabel;
      dbeNumPla: TwwDBEdit;
      bbtnContabiliza: TBitBtn;
      bbtnRet: TBitBtn;
      bbtnVerCont: TBitBtn;
      BitBtn1: TBitBtn;
      BitBtn3: TBitBtn;
      bbtnRetUno: TBitBtn;
      pnlCab1: TPanel;
      lblCia: TLabel;
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      Label1: TLabel;
      dtpFecha: TwwDBDateTimePicker;
      dblcTMoneda: TwwDBLookupCombo;
      edtTMoneda: TEdit;
      lblTMon: TLabel;
      dtpFechaCnt: TwwDBDateTimePicker;
      Label7: TLabel;
      bbtnIni: TBitBtn;
      bbtnRep: TBitBtn;
      ppdb1: TppDBPipeline;
      ppr1: TppReport;
      ppd1: TppDesigner;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      bbtnImporta: TBitBtn;
      sdImp: TSaveDialog;
      pnlImp: TPanel;
      mImp: TMemo;
      Label8: TLabel;
      bbtnConsta: TBitBtn;
      bbtnCancela: TBitBtn;
      pnlConstancia: TPanel;
      Label9: TLabel;
      edtConstancia: TwwDBEdit;
      btnActualizarConstancia: TBitBtn;
      btnCerrarPanelConstancia: TBitBtn;
      BitBtn2: TBitBtn;
      BitBtn4: TBitBtn;
      cbDisenoRep: TCheckBox;
      sbDisenoRep: TSpeedButton;
      bbtnPago: TBitBtn;
      Procedure wwDBGrid1IButtonClick(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcTMonedaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure bbtnGrabaClick(Sender: TObject);
      Procedure FormActivate(Sender: TObject);
      Procedure dbgDetalleKeyDown(Sender: TObject; Var Key: Word;
         Shift: TShiftState);
      Procedure bbtnExportaClick(Sender: TObject);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcTMonedaExit(Sender: TObject);
      Procedure bbtnAceptaClick(Sender: TObject);
      Procedure dblcBancoExit(Sender: TObject);
      Procedure bbtnContabilizaClick(Sender: TObject);
      Procedure z2bbtnAnulaClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure dblcCCBcoEnter(Sender: TObject);
      Procedure dbgDetalleDblClick(Sender: TObject);
      Procedure dblcBancoNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcCCBcoNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure bbtnRetClick(Sender: TObject);
      Procedure bbtnVerContClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure BitBtn3Click(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure bbtnIniClick(Sender: TObject);
      Procedure bbtnRetUnoClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure dtpFechaExit(Sender: TObject);
      Procedure bbtnRepClick(Sender: TObject);
      Procedure bbtnImportaClick(Sender: TObject);
      Procedure bbtnCancelaClick(Sender: TObject);
      Procedure bbtnConstaClick(Sender: TObject);
      Procedure btnCerrarPanelConstanciaClick(Sender: TObject);
      Procedure btnActualizarConstanciaClick(Sender: TObject);
      procedure BitBtn2Click(Sender: TObject);
      procedure BitBtn4Click(Sender: TObject);
      procedure sbDisenoRepClick(Sender: TObject);
      procedure bbtnPagoClick(Sender: TObject);

   Private
    { Private declarations }
      xsTipoCambio: String;

      Procedure GrabaTexto(Datos: TDatasource; Fichero: String; Delimitador: char);
      Procedure SumaGrid;
      Procedure CargaGridDetalle;
      Function SumaCuentas: String;
      Function ValidaRetenciones: Boolean;
      Procedure CargaDataSource;
      Function fg_Valida_AsientoContable(wgCiaid, wgNumOrdenPago, wgOrigen: String): Boolean;
      Function fg_validaCierreContable(wgFecha: TDateTime): Boolean;

      Function ValidaUsuarioCNT(sUsuario: String): Boolean;
      Procedure fg_HabilitaPanelConstancia;
      Procedure fg_RecuperaDetalle;
      Function fg_ValidaDatosCNT: Boolean;
      Function fg_GeneraAsiento: Boolean;
     // Function fg_GeneraAsiento_TLB: Boolean;
      Procedure fg_ActualizaComprob;
      Procedure fg_InsertaAjusteRedondeo(wgCompania, wgTipoDiario, wgPeriodo, wgNumero: String);
      Procedure fg_InsertaPago(wgCompania, wgTipoDiario, wgPeriodo, wgNumero: String);
      Procedure fg_GeneraAsientoFilial;
      Function fg_ExisteDocFilial: Boolean;
      Procedure fg_ActualizaNComprob(wgCompania, wgTDiario, wgPeriodo, wgPago, wgNumero: String);
      Function fg_ObtieneCtaProvision(wgClauxid, wgProv, wgDocId, wgSerie, wgNoDoc, wgNumProvision: String): String;
      Function fg_ValidaProvDetraccion(wgDatos: TDatasource): Boolean;

      //Inicio HPC_201705_CAJA
      //Ajustes en la opción de pago de detracciones
      Function fg_GeneraAsientoCNT: Boolean;
      //Fin HPC_201705_CAJA

   Public
    { Public declarations }
      nImpPago: Double;
      xModu: String;
   End;

Var
   FPagoDetCab: TFPagoDetCab;
   xgContinuaGrab : boolean;

Implementation

{$R *.dfm}

Uses CAJADM, StrUtils, CAJA288, CAJA286, oaTE2000;

Function TFPagoDetCab.ValidaUsuarioCNT(sUsuario: String): Boolean;
Var
   sSQL: String;
Begin
   sSQL := 'Select B.USERID, C.USERNOM '
         + '  from TGE001 A, TGE007 B, TGE006 C '
         + ' where A.MODULOID IN (''CNT'') AND A.TIPO=''0'' '
         + '   and B.USERID=''' + sUsuario + ''' '
         + '   and B.USERID IS NOT NULL '
         + '   and A.GRUPOID=B.GRUPOID(+) '
         + '   and B.USERID=C.USERID(+) '
         + '   and ( (FECEXP IS NULL AND FECFIN_PWD IS NULL ) OR ( TO_DATE(SYSDATE)<FECFIN_PWD )  ) ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(sSql);
   DMTE.cdsQry.Open;

   Result := False;
   If DMTE.cdsQry.RecordCount > 0 Then
      Result := True;
End;

Procedure TFPagoDetCab.CargaDataSource;
Begin
   // Cabecera
   dblcCia.LookupTable := DMTE.cdsCia;
   dblcCia.DataSource := DMTE.dsOPago;
   dtpFecha.DataSource := DMTE.dsOPago;
   dtpFechaCnt.DataSource := DMTE.dsOPago;
   dblcTMoneda.LookupTable := DMTE.cdsTMon;
   dblcTMoneda.DataSource := DMTE.dsOPago;
   dbeNumero.DataSource := DMTE.dsOPago;
   DBMemo.DataSource := DMTE.dsOPago;

   dbeUsuGraba.DataSource := DMTE.dsOPago;
   dbeUsuAcepta.DataSource := DMTE.dsOPago;
   dblcBanco.DataSource := DMTE.dsOPago;
   dblcBanco.LookupTable := DMTE.cdsBanco;
   dblcCCBco.DataSource := DMTE.dsOPago;
   dblcCCBco.LookupTable := DMTE.cdsCCBco;
   dbeNumPla.DataSource := DMTE.dsOPago;

   // Detalle
   dbgDetalle.DataSource := DMTE.dsDetallePres;
End;

Procedure TFPagoDetCab.wwDBGrid1IButtonClick(Sender: TObject);
Var
   xSQl: String;
Begin
   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'P' Then
   Begin
      ShowMessage('Orden de Pago se encuentra en Estado Aceptado');
      Exit;
   End;
   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago se encuentra en Estado Anulado');
      Exit;
   End;

   If dblcCia.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar la Compañía');
      Exit;
   End;
   If dblcTMoneda.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar el Tipo de Moneda');
      Exit;
   End;
   If Trim(DBMemo.Text) = '' Then
   Begin
      ShowMessage('Falta Ingresar la Observación');
      Exit;
   End;
   If dtpFecha.Date = 0 Then
   Begin
      ShowMessage('Falta Ingresar la fecha');
      Exit;
   End;
   xModu := DMTE.cdsOPago.fieldByname('MODULO').AsString;

   If DMTE.cdsOPago.fieldByname('NUMERO').AsString = '' Then
      bbtnGrabaClick(Self);

   Try
      FOrdenSelec := TFOrdenSelec.Create(Application);
      FOrdenSelec.ShowModal;
   Finally
      FOrdenSelec.Free;

      fg_RecuperaDetalle;

   End;
End;

Procedure TFPagoDetCab.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFPagoDetCab.dblcTMonedaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFPagoDetCab.bbtnGrabaClick(Sender: TObject);
Var
   xSQL, sAnoT: String;
   nCont: Integer;
   nReg: Integer;

Begin
   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'P' Then
   Begin
      ShowMessage('Orden de Pago se encuentra Aceptada');
      Exit;
   End;
   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago Esta Anulada');
      Exit;
   End;

   // Inicio HPC_201701_CAJA Corrección del cálculo del importe pagado
   If (DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'C') and (DMTE.cdsOPago.fieldByname('USUCONTA').AsString <> '') Then
   Begin
      ShowMessage('Orden de Pago ya fue contabilizada');
      Exit;
   End
   else
   Begin
      If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'C' Then
      Begin
          ShowMessage('Orden de Pago ya se encuentra CONFIRMADA');
          Exit;
      End;
   End;
   // Fin HPC_201701_CAJA

   If dblcCia.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar la Compañía');
      Exit;
   End;
   If dblcTMoneda.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar el Tipo de Moneda');
      Exit;
   End;
   If Trim(DBMemo.Text) = '' Then
   Begin
      ShowMessage('Falta Ingresar la Observación');
      Exit;
   End;
   If dtpFecha.Date = 0 Then
   Begin
      ShowMessage('Falta Ingresar la fecha');
      Exit;
   End;
   If fg_validaCierreContable(dtpFecha.Date) = True Then
   Begin
      ShowMessage(' Mes Cerrado Contablemente!!!, No se puede Registrar');
      Exit;
   End;

   If xModu = 'CAJA' Then
   Begin
      DMTE.cdsOPago.Edit;
      DMTE.cdsOPago.fieldByname('MODULO').AsString := 'CAJA';
      DMTE.cdsOPago.fieldByname('USUARIO').AsString := DMTE.wUsuario;
      DMTE.cdsOPago.fieldByname('ESTADO').AsString := 'I';
   End
   Else
   Begin
      DMTE.cdsOPago.Edit;
      DMTE.cdsOPago.fieldByname('MODULO').AsString := 'TLB';
      DMTE.cdsOPago.fieldByname('USUARIO').AsString := DMTE.wUsuario;
      DMTE.cdsOPago.fieldByname('ESTADO').AsString := 'I';
   End;

   SumaGrid;

   sAnoT := Copy(dtpFecha.Text, 9, 2);

   DMTE.DCOM1.AppServer.IniciaTransaccion;                                      // primer inicia boton grabar
   if FPagoDetrac.xgTipoAct='I' then
   begin
      xSQL := 'Select lpad(to_char(nvl(to_number(max(NUMERO)),0)+1),6,''0'') NUMMAX '
            + '  From CXP_ORD_PAG_CAB '
            + ' Where CIAID='+quotedstr(dblcCia.Text);
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest(xSQL);
      DMTE.cdsQry.Open;
      DMTE.cdsOPago.Edit;
      DMTE.cdsOPago.fieldByname('NUMERO').AsString := DMTE.cdsQry.fieldByname('NUMMAX').AsString;
      DMTE.cdsOPago.fieldByname('USUARIO').AsString := DMTE.wUsuario;
      DMTE.cdsOPago.fieldByname('ESTADO').AsString  := 'I';
      DMTE.cdsOPago.fieldByname('FECHA').AsString   := dtpFecha.Text;

      SumaGrid; // MONPAG con Sumatoria del Detalle
      DMTE.cdsOPago.Post;
   // Inicio HPC_201502_CAJA
   // Se agrega campo MODULO en la grabación de la cabecera
      xSQL := 'Insert into CXP_ORD_PAG_CAB(CIAID, NUMERO, USUARIO, FECHA, TMONID, ESTADO, OBSERVA, MODULO) '
             +'values('+quotedstr(dblcCia.Text)+ ', '
                       +quotedstr(DMTE.cdsOPago.fieldByname('NUMERO').AsString)+', '
                       +quotedstr(DMTE.wUsuario)+', '
                       +quotedstr(datetostr(dtpFecha.date))+', '
                       +quotedstr(dblcTMoneda.Text)+', '
                       +quotedstr('I')+', '
                       +quotedstr(DBMemo.Text)+', '
                       +quotedstr(DMTE.cdsOPago.fieldByname('MODULO').AsString)+') ';
   // Fin HPC_201502_CAJA
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   end
   else
   begin
      If DMTE.cdsOPago.fieldByname('NUMERO').AsString <> '' Then
      Begin
         DMTE.cdsOPago.Edit;
         DMTE.cdsOPago.fieldByname('USUARIO').AsString := DMTE.wUsuario;
         DMTE.cdsOPago.fieldByname('ESTADO').AsString  := 'I';
         DMTE.cdsOPago.fieldByname('FECHA').AsDateTime := dtpFecha.Date;
         DMTE.cdsOPago.fieldByname('BANCOID').AsString := dblcBanco.Text;
         SumaGrid; // MONPAG con Sumatoria del Detalle
         DMTE.cdsOPago.Post;
         xSQL := ' update CXP_ORD_PAG_CAB '
                +'   set USUARIO='+quotedstr(DMTE.cdsOPago.fieldByname('USUARIO').AsString)+', '
                +'       ESTADO='+quotedstr(DMTE.cdsOPago.fieldByname('ESTADO').AsString)+', '
                +'       FECHA='+quotedstr(datetostr(dtpFecha.date))+', '
//                +'       BANCOID='+quotedstr(DMTE.cdsOPago.fieldByname('BANCOID').AsString)+', '
                +'       MONPAG='+quotedstr(DMTE.cdsOPago.fieldByname('MONPAG').AsString)+' '
                +' where CIAID='+quotedstr(DMTE.cdsOPago.fieldByname('CIAID').AsString)
                +'   and NUMERO='+quotedstr(DMTE.cdsOPago.fieldByname('NUMERO').AsString);
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      END;

   End;
   Try
      DMTE.DCOM1.AppServer.GrabaTransaccion;                          // primer GrabaTransaccion boton grabar
   Except
      ShowMessage('Error en la actualización del registro en la cabecera..');
      DMTE.DCOM1.AppServer.RetornaTransaccion;                          // Primer retorna de boton grabar
      Exit;
   End;

   If DMTE.cdsOPago.fieldByname('NUMERO').AsString = '' Then
   Begin
         nCont := 1;
         While (DMTE.cdsOPago.fieldByname('NUMERO').AsString = '') And (nCont <= 10) Do
         Begin

            xSQL := 'Select ''' + sAnoT + '''||LPAD(TO_CHAR(NVL(TO_NUMBER(SUBSTR(MAX(NUMERO),3,4)),0)+1),4,''0'') NUMMAX '
                  + 'From CXP_ORD_PAG_CAB '
                  + 'Where CIAID=''' + dblcCia.Text + ''' and NUMERO LIKE ''' + sAnoT + '%''';
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest(xSQL);
            DMTE.cdsQry.Open;
            DMTE.cdsOPago.fieldByname('NUMERO').AsString := DMTE.cdsQry.fieldByname('NUMMAX').AsString;
            DMTE.cdsOPago.Post;

            If DMTE.cdsOPago.ApplyUpdates(-1) > 0 Then
               DMTE.cdsOPago.fieldByname('NUMERO').AsString := '';
            inc(nCont);
         End;
         If DMTE.cdsOPago.fieldByname('NUMERO').AsString = '' Then
         Begin
            ShowMessage('Error al grabar, intente nuevamente');
            Exit;
         End;
         If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'I' Then edtEstado.Text := 'INICIAL';
         pnlCab1.Enabled := False;

   End;

   // borrado de registros físicos
   DMTE.DCOM1.AppServer.IniciaTransaccion;                                  // segundo inicia boton grabar

   xSQL := 'Delete from CXP_ORD_PAG_DET '
         + ' where CIAID =''' + DMTE.cdsOPago.FieldByname('CIAID').AsString + ''' '
         + '   and NUMERO=''' + DMTE.cdsOPago.FieldByname('NUMERO').AsString + ''' ';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      ShowMessage('Error en la Transaccion Eliminar');
      DMTE.DCOM1.AppServer.RetornaTransaccion;                               // segundo retorna boton grabar
   End;

   nReg := 0;
   DMTE.cdsDetallePres.First;
   While Not DMTE.cdsDetallePres.EOF Do
   Begin
      nReg := nReg + 1;
      xSQL := 'Insert into CXP_ORD_PAG_DET(CIAID, NUMERO, ITEM, CLAUXID, AUXID, DOCID, CPSERIE, CPNODOC, '
            + '                            TMONID, CPMTOORI, CPPAGORI, CPSALORI, IMPPAGO, IMPRETE, FREG, HREG, USUARIO, ESTADO,MOD_DETR,NUMDETRAC,NUMCONSTA ) '
            + 'Values( ''' + DMTE.cdsOPago.FieldByName('CIAID').AsString + ''', '
                    + '''' + DMTE.cdsOPago.FieldByName('NUMERO').AsString + ''', '
                    + '''' + DMTE.strzero(IntToStr(nReg), 3) + ''', '
                    + '''' + DMTE.cdsDetallePres.FieldByName('CLAUXID').AsString + ''', '
                    + '''' + DMTE.cdsDetallePres.FieldByName('AUXID').AsString + ''', '
                    + '''' + DMTE.cdsDetallePres.FieldByName('DOCID').AsString + ''', '
                    + '''' + DMTE.cdsDetallePres.FieldByName('CPSERIE').AsString + ''', '
                    + '''' + DMTE.cdsDetallePres.FieldByName('CPNODOC').AsString + ''', '
                    + '''' + DMTE.cdsDetallePres.FieldByName('TMONID').AsString + ''', '
                    + FloatToStr(DMTE.cdsDetallePres.FieldByName('CPMTOORI').AsFloat) + ', '
                    + FloatToStr(DMTE.cdsDetallePres.FieldByName('CPPAGORI').AsFloat) + ', '
                    + FloatToStr(DMTE.cdsDetallePres.FieldByName('CPSALORI').AsFloat) + ', '
                    + FloatToStr(DMTE.cdsDetallePres.FieldByName('IMPPAGO').AsFloat) + ', '
                    + FloatToStr(DMTE.cdsDetallePres.FieldByName('IMPRETE').AsFloat) + ', '
                    + 'SYSDATE, SYSDATE, '
                    + '''' + DMTE.wUsuario + ''', '
                    + '''P'', '
                    + '''' + DMTE.cdsDetallePres.FieldByName('MOD_DETR').AsString + ''', '
                    + '''' + DMTE.cdsDetallePres.FieldByName('NUMDETRAC').AsString + ''', '
                    + '''' + DMTE.cdsDetallePres.FieldByName('NUMCONSTA').AsString + ''' '
            + ' )';
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en la Transacción Insertar');
         DMTE.DCOM1.AppServer.RetornaTransaccion;                               // tercer retorna boton grabar
      End;
      DMTE.cdsDetallePres.Next;
   End;
   DMTE.DCOM1.AppServer.GrabaTransaccion;

   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'I' Then edtEstado.Text := 'INICIAL';
   pnlCab1.Enabled := False;
   FPagoDetrac.xgTipoAct:='M';
   ShowMessage('Grabado');
   CargaGridDetalle;

End;

Procedure TFPagoDetCab.SumaGrid;
Var
   dImpPago: Double;
   dDifPago: Double;
   dTotDif: Double;
   dImpTot: Double;
Begin
   dImpPago := 0;
   dTotDif := 0;
   DMTE.cdsDetallePres.First;
   While Not DMTE.cdsDetallePres.Eof Do
   Begin
      dImpPago := dImpPago + DMTE.cdsDetallePres.FieldByname('IMPPAGO').AsFloat;

      dDifPago := DMTE.cdsDetallePres.fieldByname('IMPPAGO').AsFloat - DMTE.cdsDetallePres.fieldByname('CPSALORI').AsFloat;
      dTotDif := dTotDif + dDifPago;
      dImpTot := dImpTot + DMTE.cdsDetallePres.fieldByname('CPSALORI').AsFloat;

      If DMTE.cdsDetallePres.fieldByname('CPPAGORI').AsFloat = 0 Then
      Begin
         If (DMTE.cdsDetallePres.fieldByname('CPPAGORI').AsFloat = 0) And (dDifPago <> 0) Then
         Begin
            DMTE.cdsDetallePres.Edit;
            DMTE.cdsDetallePres.fieldByname('CPPAGORI').AsFloat := DMTE.cdsDetallePres.fieldByname('IMPPAGO').AsFloat -
               DMTE.cdsDetallePres.fieldByname('CPSALORI').AsFloat;
            DMTE.cdsDetallePres.Post;
            DMTE.cdsDetallePres.ApplyUpdates(-1);
         End;
      End;

      DMTE.cdsDetallePres.Next;
   End;

   If (DMTE.cdsOPago.State = dsInsert) Or (DMTE.cdsOPago.State = dsEdit) Then
   Begin

      DMTE.cdsOPago.fieldByname('MONPAG').AsFloat := dImpPago;

   End;
   dbgDetalle.ColumnByName('IMPPAGO').FooterValue := floattostrf(dImpPago, ffNumber, 10, 2);
   dbgDetalle.ColumnByName('CPPAGORI').FooterValue := floattostrf(dTotDif, ffNumber, 10, 2);
   dbgDetalle.ColumnByName('CPSALORI').FooterValue := floattostrf(dImpTot, ffNumber, 10, 2);
   DMTE.cdsDetallePres.First;
End;

Procedure TFPagoDetCab.FormActivate(Sender: TObject);
Var
   xSQL: String;
Begin
   dbgDetalle.Selected.Clear;
   dbgDetalle.Selected.Add('CLAUXID'#9'4'#9'Cl.~Aux.'#9'F');
   dbgDetalle.Selected.Add('AUXID'#9'10'#9'Id.~Prov.'#9'F');
   dbgDetalle.Selected.Add('DOCID'#9'3'#9'Doc.'#9'F');
   dbgDetalle.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
   dbgDetalle.Selected.Add('CPNODOC'#9'11'#9'No.~Documento'#9'F');
   dbgDetalle.Selected.Add('TMONID'#9'3'#9'TM'#9'F');
   dbgDetalle.Selected.Add('CPMTOORI'#9'11'#9'Importe'#9'F');
   dbgDetalle.Selected.Add('CPSALORI'#9'11'#9'Importe~Saldo'#9'F');
   dbgDetalle.Selected.Add('IMPPAGO'#9'11'#9'Monto a~Pagar'#9'F');
   dbgDetalle.Selected.Add('CPPAGORI'#9'11'#9'Diferencia~Redondeo'#9'F');
   dbgDetalle.Selected.Add('NUMDETRAC'#9'11'#9'No.~Detracción'#9'F');
   dbgDetalle.Selected.Add('NUMCONSTA'#9'10'#9'No.~Constancia'#9'F');

   pnlImp.Visible := False;
   pnlImp.SendToBack;

   pnlCab.Enabled := False;
   pnlCab2.Enabled := False;
   xModu := DMTE.cdsOPago.fieldByname('MODULO').AsString;
   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = '' Then
   Begin
      pnlCab.Enabled := True;
      pnlCab1.Enabled := True;
      pnlCab2.Enabled := True;
      DMTE.cdsOPago.fieldByname('CIAID').AsString := '02';
      dblcCiaExit(Self);
      DMTE.cdsOPago.fieldByname('FECHA').AsDatetime := DATE;
      DMTE.cdsOPago.fieldByname('TMONID').AsString := 'N';
      dblcTMonedaExit(self);
   End;

   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'I' Then
   Begin
      pnlCab.Enabled := True;
      pnlCab1.Enabled := False;
      pnlCab2.Enabled := True;
      edtEstado.Text := 'INICIAL';
   End;

   pnlCnt.Enabled := True;

   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'P' Then edtEstado.Text := 'ACEPTADO';
   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'C' Then edtEstado.Text := 'CONFIRMADO';
   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then edtEstado.Text := 'ANULADO';

   If DMTE.cdsOPago.fieldByname('USUCONTA').AsString <> '' Then
   Begin
      pnlCnt.Enabled := False;
      edtEstado.Text := 'CONTABILIZADO'
   End;

   edtBanco.text := DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr, 'BANCOID', dblcBanco.Text, 'BancoNom');

   xSQL := 'CIAID=' + quotedstr(dblcCia.Text);

   edtCia.text := DMTE.DisplayDescripLocal(DMTE.cdsCia, 'CIAID', dblcCia.Text, 'CIADES');

   xSQL := 'TMONID=' + '''' + dblcTMoneda.Text + '''';

   edtTMoneda.text := DMTE.DisplayDescripLocal(DMTE.cdsTMon, 'TMONID', dblcTMoneda.Text, 'TMONDES');

   fg_RecuperaDetalle;
   CargaDataSource;

End;

Procedure TFPagoDetCab.dbgDetalleKeyDown(Sender: TObject; Var Key: Word;
   Shift: TShiftState);
Var
   xSQL: String;
Begin
   If (Key = VK_DELETE) And (ssCtrl In Shift) Then //^Del
   Begin
      If DMTE.cdsOPago.FieldByname('USUACEPTA').AsString <> '' Then
      Begin
         ShowMessage('No se Puede Eliminar detalle. Documento esta Aceptado');
         Exit;
      End;
// Inicio HPC_201603_CAJA
      If fg_validaCierreContable(dtpFecha.Date) = True Then
      Begin
        ShowMessage(' Mes Cerrado Contablemente!!!, No se puede Registrar');
        Exit;
      End
      Else
      Begin
        If DMTE.cdsDetallePres.FieldByName('MOD_DETR').AsString = 'CAJA' Then
        Begin
         xSQL := 'Update CAJA302 '
               + '   set ECOPAGO =NULL '
               + ' where ECESTADO = ''C'' '
               + '   and tipdet=''I4'' '
               + '   and CLAUXID = ''' + DMTE.cdsDetallePres.FieldByName('CLAUXID').AsString + ''' '
               + '   and PROV = ''' + DMTE.cdsDetallePres.FieldByName('AUXID').AsString + ''' '
               + '   and ECOPAGO=''' + DMTE.cdsDetallePres.FieldByName('NUMERO').AsString + ''' ';
          DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
        End
        else
        Begin
          //Inicio HPC_201705_CAJA
          //Ajustes en la opción de pago de detracciones
          xSQL := 'Update CXP302 '
                  + '   set FLAGVAR =''N'' '
                  //+ ' where CIAID=''' + dblcCia.Text + ''' '
                  + ' where DCPAUXID = ''' + DMTE.cdsDetallePres.FieldByName('AUXID').AsString + ''' '
                  + '   and tipdet=''I4'' '
                  + '   and DOCID = ''' + DMTE.cdsDetallePres.FieldByName('DOCID').AsString + ''' '
                  + '   and CPSERIE = ''' + DMTE.cdsDetallePres.FieldByName('CPSERIE').AsString + ''' '
                  + '   and CPNODOC = ''' + DMTE.cdsDetallePres.FieldByName('CPNODOC').AsString + ''' '
                  + '   and CLAUXID=''' + DMTE.cdsDetallePres.FieldByName('CLAUXID').AsString + ''' ';
          //Fin HPC_201705_CAJA
          DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
        End;
        DMTE.cdsDetallePres.Delete;
          bbtnGrabaClick(Self);
      End;
// Fin HPC_201603_CAJA      
   End;

End;

Procedure TFPagoDetCab.bbtnExportaClick(Sender: TObject);
Begin
   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago Esta Anulada');
      Exit;
   End;
   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'I' Then
   Begin
      ShowMessage('Orden de Pago se encuentra en Estado Inicial');
      Exit;
   End;

   sdGraba.FileName := 'D20136424867' + dbeNumero.text + '.TXT';
   If Not sdGraba.Execute Then Exit;
// Inicio HPC_201502_CAJA
// Se agrega rutina que recupera detalle luego de la grabación del archivo de Exportación
   fg_RecuperaDetalle;
// Fin HPC_201502_CAJA

   If DMTE.cdsDetallePres.RecordCount > 0 Then
      GrabaTexto(DMTE.dsDetallePres, sdGraba.FileName, ',')
   Else
   Begin
      ShowMessage('No existe detalle para generar archivo de Texto');
   End;

End;

Procedure TFPagoDetCab.GrabaTexto(Datos: TDatasource; Fichero: String; Delimitador: char);
Var
   f: textfile;
   n, i: integer;
   Linea, Entero, Decimal, Cuenta, Importe, Punto, xSQL, Ruc, xCtaCte, xTmpC, xTM, xfec, xNom, xTipD: String;
   xTDoc, xNoDoc, xRuc, xRef, xDir, xDis, xPro, xDep, xContacto, xCtl, xReg, sLote: String;
   nTotal, nTotPag: Double;
   sCodBien, sCodTipOpe, sPeriodo: String;
   xsSql: String;
Begin

   If fg_ValidaProvDetraccion(Datos) = False Then
   Begin
      Exit;
   End;

   // CALCULA TOTAL DE PAGO
   nTotPag := 0;
   With Datos.DataSet Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         nTotPag := nTotPag + DMTE.FRound(Datos.DataSet.FieldByName('IMPPAGO').AsFloat, 15, 0);
         Next;
      End;
      EnableControls;
   End;

   // EXPORTA DATOS

// Cabecera
//         1         2         3         4         5         6         7
//1234567890123456789012345678901234567890123456789012345678901234567890
// 12345678901
//            12345678901234567890123456789012345
//                                               123456
//                                                     123456789012345
//*20136424867DERRAMA MAGISTERIAL                120001999999999999999

   If Length(dblcCCBco.Text) = 16 Then
   Begin
      //194-0625508-0-61
      xTmpC := StringReplace(dblcCCBco.Text, '-', '', [rfReplaceAll]);
      xCtaCte := Copy(xTmpC, 1, 3) + '0' + Copy(xTmpC, 4, 13) + '      ';
   End;
   If Length(dblcCCBco.Text) = 17 Then
   Begin
      //194-04238403-0-14
      xTmpC := StringReplace(dblcCCBco.Text, '-', '', [rfReplaceAll]);
      xCtaCte := xTmpC + '      ';
   End;

   Importe := FormatFloat('######.#0', nTotPag);
   Entero := Copy(DMTE.StrZero(Importe, 16), 1, 13);
   Decimal := Copy(DMTE.StrZero(Importe, 16), 15, 2);

   If dblcTMoneda.text = 'N' Then
      xTM := 'S/'
   Else
      xTM := 'US';

   xfec := StringReplace(dtpFecha.text, '/', '', [rfReplaceAll]);
   xfec := StringReplace(xFec, '-', '', [rfReplaceAll]);
   xfec := StringReplace(xFec, '-', '', [rfReplaceAll]);
   xRef := Copy(DMTE.cdsOPago.FieldByname('OBSERVA').AsString + '                    ', 1, 20);
   xReg := RightStr('000000' + Trim(IntToStr(Datos.DataSet.RecordCount)), 6);

   sLote := dbeNumero.text; // AA9999

   Linea := '*20136424867DERRAMA MAGISTERIAL                ' + sLote + Entero + Decimal;

   AssignFile(f, Fichero);
   Rewrite(f);
   Memo1.Lines.Add(Linea);
   writeln(f, Linea);

   Datos.DataSet.DisableControls;
   Datos.DataSet.First;
   while not Datos.DataSet.Eof do
   begin
      Linea := '';
      Linea := Datos.DataSet.FieldByName('TIPDOC_PROV').AsString
              +Datos.DataSet.FieldByName('PROVRUC').AsString // -- RUC
              +Datos.DataSet.FieldByName('PROVDES').AsString // -- Nombre o Razón Social del Proveedor
              +Datos.DataSet.FieldByName('PROFORMA').AsString // -- Proforma
              +Datos.DataSet.FieldByName('CPTODETRSUNATID').AsString // -- Código del Bien o Servicio por el cual se aplica la Detracción
              +Datos.DataSet.FieldByName('CCBCOID').AsString //  Cuenta Corriente de Depósitos de Detracción del Proveedor en el Banco de la Nación
              +Datos.DataSet.FieldByName('IMPORTE').AsString // -- Importe del Depósito
              +Datos.DataSet.FieldByName('TIPOOPERSUNATID').AsString // -- Tipo de Operación realizada
              +Datos.DataSet.FieldByName('PERIODO_TRIB').AsString // -- Periodo Tributario
              +Datos.DataSet.FieldByName('TIPO_COMPROB').AsString // -- Tipo de Comprobante
              +Datos.DataSet.FieldByName('CPSERIE_TXT').AsString // -- Serie de Documento q genera Detracción
              +Datos.DataSet.FieldByName('CPNODOC_TXT').AsString; // -- Número de Documento q genera Detracción
      Memo1.Lines.Add(Linea);
      writeln(f, Linea);
      Datos.DataSet.Next;
   end;
   Datos.DataSet.EnableControls;
   
   CloseFile(f);
// Inicio HPC_201502_CAJA
   MessageDlg(' Diskette se grabó con éxito ', mtInformation, [mbOk], 0);
// Fin HPC_201502_CAJA
End;

Function TFPagoDetCab.SumaCuentas: String;
Var
   nTotal: Double;
   xSQL, xTmpC, xCtaCte: String;
Begin
   nTotal := 0;
   DMTE.cdsDetallePres.First;
   While Not DMTE.cdsDetallePres.Eof Do
   Begin
      xSQL := 'select * FROM TGE201 '
            + ' where CLAUXID=''' + DMTE.cdsDetallePres.FieldByName('CLAUXID').AsString + ''' '
            + '   and PROV=''' + DMTE.cdsDetallePres.FieldByName('AUXID').AsString + '''';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.indexfieldnames := '';
      DMTE.cdsQry.DataRequest(xSQL);
      DMTE.cdsQry.Open;

      xSQL := 'Select * FROM CAJA102 '
            + ' where CLAUXID=''' + DMTE.cdsDetallePres.FieldByName('CLAUXID').AsString + ''' '
            + '   and PROV=''' + DMTE.cdsDetallePres.FieldByName('AUXID').AsString + ''' '
            + '   and DETRACCION=''S'' ';
      DMTE.cdsQry2.Close;
      DMTE.cdsQry2.indexfieldnames := '';
      DMTE.cdsQry2.DataRequest(xSQL);
      DMTE.cdsQry2.Open;

      If DMTE.cdsQry2.FieldByname('FPAGOID').AsString = 'AB' Then
      Begin
         If Length(DMTE.cdsQry2.FieldByname('CCBCOID').AsString) = 11 Then
         Begin
            xTmpC := StringReplace(DMTE.cdsQry2.FieldByname('CCBCOID').AsString, '-', '', [rfReplaceAll]);
         End;
         If xTmpC = '' Then
         Begin
            ShowMessage('Error en Datos del Proveedor ' + Trim(DMTE.cdsQry.FieldByname('PROV').AsString) + ' - ' + Trim(DMTE.cdsQry.FieldByname('PROVDES').AsString) + ', RUC ' + Trim(DMTE.cdsQry.FieldByname('PROVRUC').AsString) + ',  Cta.Cte.:' + DMTE.cdsQry2.FieldByname('CCBCOID').AsString);
            Break;
         End;
      End
      Else
      Begin
         ShowMessage('Error en Datos del Proveedor ' + Trim(DMTE.cdsQry.FieldByname('PROV').AsString) + ' - ' + Trim(DMTE.cdsQry.FieldByname('PROVDES').AsString) + ', RUC ' + Trim(DMTE.cdsQry.FieldByname('PROVRUC').AsString) + ',  Cta.Cte.:' + DMTE.cdsQry2.FieldByname('CCBCOID').AsString);
         Break;
      End;

      DMTE.cdsDetallePres.Next;
   End;
End;

Procedure TFPagoDetCab.dblcCiaExit(Sender: TObject);
Var
   xWhere: String;
Begin
   xWhere := 'CIAID=' + quotedstr(dblcCia.Text);

   edtCia.text := DMTE.DisplayDescripLocal(DMTE.cdsCia, 'CIAID', dblcCia.Text, 'CIADES');

   If length(edtCia.Text) = 0 Then
   Begin
      ShowMessage('Error en código de Compañía');
      dblcCia.SetFocus;
   End;
End;

Procedure TFPagoDetCab.dblcTMonedaExit(Sender: TObject);
Var
   xWhere: String;
Begin
   If trim(dblcTMoneda.Text) = '' Then Exit;

   Screen.Cursor := crHourGlass;
   xWhere := 'TMONID=' + '''' + dblcTMoneda.Text + '''';

   edtTMoneda.text := DMTE.DisplayDescripLocal(DMTE.cdsTMon, 'TMONID', dblcTMoneda.Text, 'TMONDES');
   Screen.Cursor := crDefault;

   If length(edtTMoneda.Text) = 0 Then
   Begin
      ShowMessage('Error en Tipo de Moneda');
      dblcTMoneda.SetFocus;
   End;
End;

Procedure TFPagoDetCab.bbtnAceptaClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'P' Then
   Begin
      ShowMessage('Orden de Pago se encuentra Aceptada');
      Exit;
   End;
   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago Esta Anulada');
      Exit;
   End;
   // Inicio HPC_201701_CAJA Corrección del cálculo del importe pagado
   If (DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'C') and (DMTE.cdsOPago.fieldByname('USUCONTA').AsString <> '') Then
   Begin
      ShowMessage('Orden de Pago ya fue contabilizada');
      Exit;
   End
   else
   Begin
      If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'C' Then
      Begin
          ShowMessage('Orden de Pago ya se encuentra CONFIRMADA');
          Exit;
      End;
   End;
   // Fin HPC_201701_CAJA
   If fg_validaCierreContable(dtpFecha.Date) = True Then
   Begin
      ShowMessage(' Mes Cerrado Contablemente!!!, No se puede Registrar');
      Exit;
   End;
   If MessageDlg('¿ Aceptar Orden de Pago ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

   If DMTE.cdsOPago.fieldByname('NUMERO').AsString = '' Then
      ShowMessage('Error al Grabar')
   Else
   Begin
      DMTE.cdsOPago.Edit;
      DMTE.cdsOPago.fieldByname('ESTADO').AsString := 'P';
      DMTE.cdsOPago.fieldByname('USUACEPTA').AsString := DMTE.wUsuario;
      DMTE.cdsOPago.fieldByname('FECACEPTA').AsDateTime := DATE;
      SumaGrid;
      DMTE.cdsOPago.Post;

      xSQL := 'Update CXP_ORD_PAG_CAB '
             +'   set ESTADO='+quotedstr('P')+', '
             +'       BANCOID='+quotedstr(dblcBanco.Text)+', '
             +'       USUACEPTA='+quotedstr(DMTE.wUsuario)+', '
             +'       MONPAG='+quotedstr(DMTE.cdsOPago.fieldByname('MONPAG').AsString) +', '
             +'       FECACEPTA= trunc(sysdate), '
             +'       MODULO='+quotedstr('CAJA')
             +' where CIAID='+quotedstr(DMTE.cdsOPago.fieldByname('CIAID').AsString)
             +'   and NUMERO='+quotedstr(DMTE.cdsOPago.fieldByname('NUMERO').AsString);
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error en la Aceptación de la Orden de Pago');
         Exit;
      End;

      If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'P' Then edtEstado.Text := 'ACEPTADO';
      pnlCab.Enabled := False;
      pnlCab2.Enabled := False;
      ShowMessage('Aceptada');
      //Inicio HPC_201705_CAJA
      //Ajustes en la opción de pago de detracciones
      CargaGridDetalle;
      //Fin HPC_201705_CAJA
   End;

End;

Procedure TFPagoDetCab.dblcBancoExit(Sender: TObject);
Var
   xSQL: String;
Begin

   edtBanco.text := DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr, 'BANCOID', dblcBanco.Text, 'BANCOABR');

   If length(edtBanco.Text) > 0 Then
   Begin
      xSQL := 'Select CIAID, BANCOID, CCBCOID '
             +'  from TGE106 '
             +' where CIAID=''02'' and BANCOID=' + '''' + dblcBanco.Text + ''' and TMONID=''' + dblcTMoneda.TEXT + ''' '
             +'   and CUEEMICHE=''A''';
      DMTE.cdsCCBco.Close;
      DMTE.cdsCCBco.DataRequest(xSQL);
      DMTE.cdsCCBco.Open;
      dblcCCBco.Enabled := true;
   End;
End;

Procedure TFPagoDetCab.bbtnContabilizaClick(Sender: TObject);
Var
   xSQL, xNoComp, xPeriodo, xOrigen, xLote, xTCambio, xCta166, xCta466, xWhere, xCiaAbr: String;
Begin

   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago Detracción está Anulada');
      Exit;
   End;
   If DMTE.cdsOPago.fieldByname('ESTADO').AsString <> 'C' Then
   Begin
      ShowMessage('Orden de Pago Detracción no está CONFIRMADA');
      Exit;
   End;
   //Inicio HPC_201705_CAJA
   //Ajustes en la opción de pago de detracciones
   //validación del tipo de cambio
   xSQL := 'TMONID=' + quotedstr(DMTE.wTMonExt)
          + ' AND FECHA=' + DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha, dtpFecha.Date) + ''')';
   xsTipoCambio := DMTE.DisplayDescrip('prvTGE', 'TGE107', 'TMONID, ' + DMTE.wTipoCambioUsar, xSQL, DMTE.wTipoCambioUsar);
   If (xsTipoCambio = '') Then
   Begin
      ShowMessage('Ingrese Tipo de cambio del día:' + formatdatetime(DMTE.wFormatFecha, dtpFecha.Date) );
      Exit;
   End;
   //Fin HPC_201705_CAJA
   // Inicio HPC_201703_CAJA
   // Número de constancia de Depósito Detracciones
   {
   If fg_ValidaDatosCNT = False Then
   Begin
      Exit;
   End;
   }
   // Fin HPC_201703_CAJA
   If MessageDlg('¿ Contabilizar Orden de Pago ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      DMTE.DCOM1.AppServer.IniciaTransaccion;

   // Graba el usuario que contabiliza
      DMTE.cdsOPago.Edit;
      DMTE.cdsOPago.fieldByname('USUCONTA').AsString := DMTE.wUsuario;
(*
      If xModu = 'CAJA' Then
      Begin
   // Actualiza en Número de Operación

         xSQL := 'update CAJA302 '
               + '   set ECNOCHQ=''' + dbeNumPla.text + ''' '
               + ' where ciaid=''02'' and ecopago=''' + dbeNumero.text + ''' ';
         try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            ShowMessage('No se pudo actualizar el archivo de Caja para cheques');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         end;
      End;

   // Actualiza el numero de Constancia
      With DMTE.cdsDetallePres Do
      Begin
         DisableControls;
         First;
         While Not Eof Do
         Begin
            xSQL := 'Update CXP301 '
                  + '   set FECDEPDET=''' + dtpFechaCnt.TEXT + ''', '
                  + '       NUMDEPDET=''' + FieldByName('NUMCONSTA').AsString + ''' '
                  + ' where CLAUXID=''' + FieldByName('CLAUXID').AsString + ''' '
                  + '   and PROV=''' + FieldByName('AUXID').AsString + ''' '
                  + '   and DOCID  =''' + FieldByName('DOCID').AsString + ''' '
                  + '   and CPSERIE=''' + FieldByName('CPSERIE').AsString + ''' '
                  + '   and CPNODOC=''' + FieldByName('CPNODOC').AsString + ''' ';
            try
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            except
               ShowMessage('No se pudo actualizar datos de Detracción en el archivo de Cuentas por Pagar');
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               exit;
            end;
            Next;
         End;
         EnableControls;
      End;

      If xModu = 'CAJA' Then
      Begin
      // Actualiza Contabilizacion
         xSQL := 'Select ciaid, tdiarid, ecanomm, ecnocomp from caja302 '
               + 'where ciaid=''02'' and ecopago=''' + dbeNumero.text + ''' ';
         DMTE.cdsQry.Close;
         DMTE.cdsQry.DataRequest(xSQL);
         DMTE.cdsQry.Open;

         While Not DMTE.cdsQry.Eof Do
         Begin
            xSQL := 'update CAJA304 '
                  + '   set DCNODOC=''' + dbeNumPla.text + ''' '
                  + ' where CIAID=''' + DMTE.cdsQry.FieldByname('CIAID').AsString + ''' '
                  + '   and TDIARID=''' + DMTE.cdsQry.FieldByname('TDIARID').AsString + ''' '
                  + '   and ECANOMM=''' + DMTE.cdsQry.FieldByname('ECANOMM').AsString + ''' '
                  + '   and ECNOCOMP=''' + DMTE.cdsQry.FieldByname('ECNOCOMP').AsString + ''' '
                  + '   and CUENTAID like ''104%''';
            try
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            except
               ShowMessage('No se pudo actualizar Nro. de Detracción en el archivo CAJA304');
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               exit;
            end;
            DMTE.cdsQry.Next;
         End;
      End;
*)
      Screen.Cursor := crDefault;

      xSQL := 'update CXP_ORD_PAG_CAB '
             +'   set USUCONTA='+quotedstr(DMTE.cdsOPago.fieldByname('USUCONTA').AsString)+' '
            { +'       NUMPLA='+quotedstr(DMTE.cdsOPago.fieldByname('NUMPLA').AsString)+','
             +'       FECCONTA='+quotedstr(datetostr(DMTE.cdsOPago.fieldByname('FECCONTA').AsDateTime))
             }
             +' where CIAID='+quotedstr(DMTE.cdsOPago.fieldByname('CIAID').AsString)
             +'   and NUMERO='+quotedstr(DMTE.cdsOPago.fieldByname('NUMERO').AsString);

      try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      except
         ShowMessage('No se pudo actualizar los datos Contables en la Cabecera de la O.Pago de Detracciones');
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         exit;
      end;

      //Inicio HPC_201705_CAJA
      //Ajustes en la opción de pago de detracciones
      //If fg_GeneraAsiento = False Then
      If fg_GeneraAsientoCNT = False Then
      Begin
      //   ShowMessage('Error al contabilizar');
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         Exit;
      End;
      //Fin HPC_201705_CAJA
      Screen.Cursor := crHourGlass;

      xgContinuaGrab := True;
      pnlCab.Enabled := False;
      pnlCab2.Enabled := False;
   // Asiento de Retencion
      bbtnRetClick(Self);
      Screen.Cursor := crDefault;
      if not xgContinuaGrab then
      begin
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         exit;
      end
      else
      begin
         DMTE.DCOM1.AppServer.GrabaTransaccion;
         pnlCnt.Enabled := False;
         // Inicio HPC_201703_CAJA 
         // Número de constancia de Depósito Detracciones
         edtEstado.Text := 'CONTABILIZADO';
         // Fin HPC_201703_CAJA
         ShowMessage('Contabilizado');
      end;
   End;
End;

Function TFPagoDetCab.ValidaRetenciones: Boolean;
Var
   sMensaje, xSQL, xNumRet: String;
Begin
   // ACTUALIZA SALDOS
   DMTE.cdsDetallePres.First;
   DMTE.cdsDetallePres.Filtered := False;
   DMTE.cdsDetallePres.Filter := '';
   DMTE.cdsDetallePres.Filter := 'IMPRETE>0';
   DMTE.cdsDetallePres.IndexFieldNames := 'CLAUXID;AUXID;DOCID;CPSERIE;CPNODOC';
   DMTE.cdsDetallePres.Filtered := True;

   Result := False;
   sMensaje := '';

   DMTE.cdsDetallePres.First;
   While Not DMTE.cdsDetallePres.Eof Do
   Begin

      xSQL := 'Select CIAID, CLAUXID, AUXID, DOCID, SERIE, NODOC, MTOORI, MTORETORI, RETSERIE, RETNUMERO '
            + '  from CNT320 '
            + ' where CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
            + '   and CLAUXID=''' + DMTE.cdsDetallePres.fieldByname('CLAUXID').AsString + ''' '
            + '   and AUXID=''' + DMTE.cdsDetallePres.fieldByname('AUXID').AsString + ''' '
            + '   and DOCID=''' + DMTE.cdsDetallePres.fieldByname('DOCID').AsString + ''' '
            + '   and NODOC LIKE ''%' + DMTE.cdsDetallePres.fieldByname('CPNODOC').AsString + '%'' AND NVL(ECESTADO,''P'')<>''A'''
            + '   and FECPAGO>=''' + DateToStr(dtpFecha.Date - 2) + '''';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.indexfieldnames := '';
      DMTE.cdsQry.DataRequest(xSQL);
      DMTE.cdsQry.Open;

      xNumRet := DMTE.cdsQry.fieldByname('RETNUMERO').AsString;

      If xNumRet = '' Then
      Begin
         sMensaje := sMensaje
            + 'Compañía ' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + '  '
            + 'Auxiliar ' + DMTE.cdsDetallePres.fieldByname('CLAUXID').AsString + '-' + DMTE.cdsDetallePres.fieldByname('AUXID').AsString + '  '
            + 'Documento ' + DMTE.cdsDetallePres.fieldByname('DOCID').AsString + ' ' + DMTE.cdsDetallePres.fieldByname('CPNODOC').AsString + '  ' + chr(13);
         Result := True;
      End;

      DMTE.cdsDetallePres.Next;
   End;

   DMTE.cdsDetallePres.Filtered := False;
   DMTE.cdsDetallePres.Filter := '';
   DMTE.cdsDetallePres.IndexFieldNames := '';
   DMTE.cdsDetallePres.First;

   If sMensaje <> '' Then
   Begin
      ShowMessage('Vefifique si faltan registrar las Retenciones de los siguientes Proveedores ' + chr(13) + chr(13) + sMensaje)
   End;
End;

Procedure TFPagoDetCab.z2bbtnAnulaClick(Sender: TObject);
Var
   xSQL: String;
Begin

   If DMTE.cdsOPago.fieldByname('USUCONTA').AsString <> '' Then
   Begin
      ShowMessage('Orden de Pago se Contabilizada. No se puede Anular');
      Exit;
   End;

   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago Esta Anulada');
      Exit;
   End;

   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'P' Then
   Begin
      If MessageDlg('Orden de Pago se encuentra Aceptada ¿ Desea Anular ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
         Exit;
   End
   Else
   Begin
      If MessageDlg('¿ Desea Anular Orden de Pago?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then
         Exit;
   End;

   If DMTE.cdsOPago.fieldByname('NUMERO').AsString = '' Then
      ShowMessage('Error al Grabar')
   Else
   Begin
      DMTE.cdsOPago.Edit;
      DMTE.cdsOPago.fieldByname('ESTADO').AsString := 'A';
      DMTE.cdsOPago.fieldByname('USUANULA').AsString := DMTE.wUsuario;
      DMTE.cdsOPago.fieldByname('FECANU').AsDateTime := Date;
      DMTE.cdsOPago.Post;
      If DMTE.cdsOPago.ApplyUpdates(-1) > 0 Then
      Begin
         ShowMessage('Error al grabar 1');
         Exit;
      End;
      If DMTE.cdsDetallePres.ApplyUpdates(-1) > 0 Then
      Begin
         ShowMessage('Error al grabar 2');
         Exit;
      End;
      DMTE.cdsDetallePres.First;
      While Not DMTE.cdsDetallePres.Eof Do
      Begin
         //Inicio HPC_201705_CAJA
         //Ajustes en la opción de pago de detracciones
         //xSQL := 'Update CAJA302 SET ECOPAGO=NULL '
         //      + ' where CIAID=''' + dblcCia.Text + ''' '
         //      + '   and ECOPAGO=''' + dbeNumero.Text + ''' '
         //      + '   and PROV=''' + DMTE.cdsDetallePres.FieldByName('AUXID').AsString + ''' '
         //      + '   and CLAUXID=''' + DMTE.cdsDetallePres.FieldByName('CLAUXID').AsString + ''' ';
         //DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         //DMTE.cdsDetallePres.Next;
         If DMTE.cdsDetallePres.FieldByName('MOD_DETR').AsString = 'CAJA' Then
         Begin
            xSQL := 'Update CAJA302 '
                  + '   set ECOPAGO =NULL '
                  + ' where ECESTADO = ''C'' '
                  + '   and tipdet=''I4'' '
                  + '   and CLAUXID = ''' + DMTE.cdsDetallePres.FieldByName('CLAUXID').AsString + ''' '
                  + '   and PROV = ''' + DMTE.cdsDetallePres.FieldByName('AUXID').AsString + ''' '
                  + '   and ECOPAGO=''' + DMTE.cdsDetallePres.FieldByName('NUMERO').AsString + ''' ';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         End
         Else
         Begin
            xSQL := 'Update CXP302 '
                  + '   set FLAGVAR =''N'' '
                  + ' where DCPAUXID = ''' + DMTE.cdsDetallePres.FieldByName('AUXID').AsString + ''' '
                  + '   and tipdet=''I4'' '
                  + '   and DOCID = ''' + DMTE.cdsDetallePres.FieldByName('DOCID').AsString + ''' '
                  + '   and CPSERIE = ''' + DMTE.cdsDetallePres.FieldByName('CPSERIE').AsString + ''' '
                  + '   and CPNODOC = ''' + DMTE.cdsDetallePres.FieldByName('CPNODOC').AsString + ''' '
                  + '   and CLAUXID=''' + DMTE.cdsDetallePres.FieldByName('CLAUXID').AsString + ''' ';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         End;
         DMTE.cdsDetallePres.Next;
         //Fin HPC_201705_CAJA
      End;
      If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then edtEstado.Text := 'ANULADO';
      pnlCab.Enabled := False;
      pnlCab2.Enabled := False;
      ShowMessage('Anulada');
   End;
End;

Procedure TFPagoDetCab.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   DMTE.cdsOPago.CancelUpdates;
End;

Procedure TFPagoDetCab.dblcCCBcoEnter(Sender: TObject);
Begin
   If dblcBanco.text = '' Then
   Begin
      ShowMessage('Debe ingresar Banco');
   End;
End;

Procedure TFPagoDetCab.dbgDetalleDblClick(Sender: TObject);
Begin
   // Inicio HPC_201703_CAJA 
   // Número de constancia de Depósito Detracciones
   //If (DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'C') And (DMTE.cdsOPago.fieldByname('USUCONTA').AsString = '') Then
   If (DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'P') Then
   // Fin HPC_201703_CAJA
   Begin
      fg_HabilitaPanelConstancia;
      Exit;
   End;

   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago se encuentra Anulada');
      Exit;
   End;

End;

Procedure TFPagoDetCab.dblcBancoNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFPagoDetCab.dblcCCBcoNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFPagoDetCab.bbtnRetClick(Sender: TObject);
Var
   xLLave, xNumRet, xSQL, xCiaAbr: String;
   xNoComp, xPeriodo, xOrigen, xLote, xTCambio, xCta166, xCta466, xWhere, xCtaRet: String;
Begin
   xWhere := 'CIAID=' + quotedstr(dblcCia.Text);

   xCiaAbr := DMTE.DisplayDescripLocal(DMTE.cdsCia, 'CIAID', dblcCia.Text, 'CIAABR');

   xCtaRet := '4010105';
   xOrigen := '53';
   xPeriodo := Copy(dtpFecha.text, 7, 4) + Copy(dtpFecha.text, 4, 2);

   xLote := Copy(dbeNumero.Text, 3, 4);
   xTCambio := '0';
   xWhere := 'TMONID=''' + DMTE.wTMonExt + ''' and FECHA=''' + dtpFecha.text + '''';
   If length(DMTE.DisplayDescrip('prvTGE', 'TGE107', '*', xWhere, 'TMONID')) > 0 Then
      xTCambio := FloatToStr(DMTE.cdsQry.fieldbyname('TCAMVOV').AsFloat);

   If xTCambio = '0' Then
   Begin
      ShowMessage('Falta ingresar el Tipo de Cambio');
      Exit;
   End;

   xSQL := 'Select CTADEBE, B.CTA_AUX AUX_D, B.CTA_CCOS CCOS_D, CTAHABER, C.CTA_AUX AUX_H, C.CTA_CCOS CCOS_H, TDIARID, CIAORIGEN, TDIARID2 '
         + '  from CAJA103 A, TGE202 B, TGE202 C '
         + ' where A.CIAID=''' + dblcCia.Text + ''' '
         + '   and B.CIAID=A.CIAID AND A.CTADEBE=B.CUENTAID '
         + '   and C.CIAID=A.CIAID AND A.CTAHABER=C.CUENTAID ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;
   xCta166 := DMTE.cdsQry.FieldByName('CTADEBE').AsString;
   xCta466 := DMTE.cdsQry.FieldByName('CTAHABER').AsString;

   If dblcCia.Text = '02' Then xCta466 := xCtaRet;

      // ACTUALIZA SALDOS
   DMTE.cdsDetallePres.First;
   DMTE.cdsDetallePres.Filtered := False;
   DMTE.cdsDetallePres.Filter := '';
   DMTE.cdsDetallePres.Filter := 'IMPRETE>0';
   DMTE.cdsDetallePres.IndexFieldNames := 'CLAUXID;AUXID;DOCID;CPSERIE;CPNODOC';
   DMTE.cdsDetallePres.Filtered := True;

   xLLave := '';
   DMTE.cdsDetallePres.First;
   While Not DMTE.cdsDetallePres.Eof Do
   Begin
      If xLLave <> DMTE.cdsDetallePres.FieldByname('CLAUXID').AsString + DMTE.cdsDetallePres.FieldByname('AUXID').AsString Then
      Begin
         xSQL := 'Select CIAID, CLAUXID, AUXID, DOCID, SERIE, NODOC, MTOORI, MTORETORI, RETSERIE, RETNUMERO '
               + '  from CNT320 '
               + ' where CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
               + '   and CLAUXID=''' + DMTE.cdsDetallePres.fieldByname('CLAUXID').AsString + ''' '
               + '   and AUXID=''' + DMTE.cdsDetallePres.fieldByname('AUXID').AsString + ''' '
               + '   and DOCID=''' + DMTE.cdsDetallePres.fieldByname('DOCID').AsString + ''' '
               + '   and NODOC LIKE ''%' + DMTE.cdsDetallePres.fieldByname('CPNODOC').AsString + '%'' AND NVL(ECESTADO,''P'')<>''A'''
               + '   and FECPAGO>=''' + DateToStr(dtpFecha.Date - 2) + '''';
         DMTE.cdsQry.Close;
         DMTE.cdsQry.indexfieldnames := '';
         DMTE.cdsQry.DataRequest(xSQL);
         DMTE.cdsQry.Open;

         xNumRet := DMTE.cdsQry.fieldByname('RETNUMERO').AsString;

         xSQL := 'Select CIAID, CLAUXID, AUXID, DOCID, SERIE, NODOC, MTOORI, MTORETORI, RETSERIE, RETNUMERO '
               + '  from CNT320 '
               + ' where CIAID=''' + DMTE.cdsQry.fieldByname('CIAID').AsString + ''' AND RETNUMERO=''' + xNumret + '''';
         DMTE.cdsQry.Close;
         DMTE.cdsQry.indexfieldnames := '';
         DMTE.cdsQry.DataRequest(xSQL);
         DMTE.cdsQry.Open;

         /////////////

          //////////////////////////////////
         //  ASIENTO EN COMPAÑIA FILIAL  //
         //////////////////////////////////

         xSQL := 'Select LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
               + ' where CIAID=''' + dblcCia.Text + ''' AND CNTANOMM=''' + xPeriodo + ''' AND TDIARID=''' + xOrigen + '''';
         DMTE.cdsQry.Close;
         DMTE.cdsQry.indexfieldnames := '';
         DMTE.cdsQry.DataRequest(xSQL);
         DMTE.cdsQry.Open;
         xNoComp := DMTE.cdsQry.FieldByName('NOCOMP').AsString;

         // cabecera
         xSQL := 'INSERT INTO CNT300 (CIAID, TDIARID, CNTCOMPROB, '
               + 'CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
               + 'CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
               + 'CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
               + 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
               + 'Select ''' + dblcCia.Text + ''', ''' + xOrigen + ''', ''' + xNoComp + ''', '
               + '''' + xPeriodo + ''', ''' + xLote + ''', ''P:' + dbeNumPla.text + ' / ' + dblcCia.Text + ' / Ret:''||RETNUMERO, ' + xTCambio + ', ''' + dtpFecha.text + ''', '
               + '''I'', ''N'', NULL, ''' + DMTE.wUsuario + ''', SYSDATE, SYSDATE, max(b.fecano) , max(b.fecmes), max(b.fecdia), '
               + 'max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), ''N'' TMONID,  NULL, NULL, NULL, '
               + 'max(TDIARDES), sum(A.MTORETLOC), sum(MTORETEXT), sum(A.MTORETLOC), sum(MTORETEXT), 0, 0, NULL, ''CXP'', ''CXP'' '
               + 'FROM CNT320 A, TGE114 B, TGE104 C '
               + 'Where A.CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
               + 'AND RETNUMERO=''' + xNumret + ''' '
               + 'AND ''' + dtpFecha.text + '''=B.FECHA '
               + 'AND C.TDIARID=''' + xOrigen + ''' '
               + 'GROUP BY RETNUMERO';
         try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            showMessage('Error al insertar Cabecera Contable por Pago de Retenciones');
            xgContinuaGrab := False;
         end;

         // DETALLE 1
         xSQL := 'INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
               + 'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
               + 'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
               + 'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
               + 'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
               + 'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
               + 'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
               + 'Select ''' + dblcCia.Text + ''', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , b.fecano, ''' + xPeriodo + ''', ''' + xLote + ''', D.CTATOTAL, D.CLAUXID, PROV, '
               + 'D.DOCID, D.CPSERIE, D.CPNODOC, SUBSTR(D.PROVDES,1,40), ''D'', NULL, ' + xTCambio + ', A.MTORETLOC, A.MTORETLOC, MTORETEXT, '
               + 'D.CPFEMIS, D.CPFVCMTO, ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMTE.wUsuario + ''', '
               + 'SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, '
               + '''N'' TMONID, NULL, NULL, NULL, C.TDIARDES, E.CTAABR, SUBSTR(D.PROVDES,1,15), F.DOCABR, NULL, '
               + 'A.MTORETLOC, MTORETEXT, 0, 0, 0, 0, NULL, NULL, '
               + 'NULL, ''CXP'', ROWNUM, ''CXP'', NULL '
               + 'FROM CNT320 A, CXP301 D, TGE114 B, TGE104 C, TGE202 E, TGE110 F '
               + 'Where A.CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
               + 'AND RETNUMERO=''' + xNumret + ''' '
               + 'AND D.CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
               + 'AND A.CLAUXID=D.CLAUXID AND A.AUXID=D.PROV AND A.DOCID=D.DOCID(+) '
               + 'AND CAST(D.CPNODOC AS NUMERIC)= CAST(NODOC AS NUMERIC) '
               + 'AND CAST(D.CPSERIE AS NUMERIC)= CAST(SERIE AS NUMERIC) '
               + 'AND D.CPESTADO IN (''P'',''C'') '
               + 'AND B.FECHA(+)=''' + dtpFecha.text + ''' '
               + 'AND C.TDIARID(+)=''' + xOrigen + ''' '
               + 'AND A.CIAID=E.CIAID AND D.CTATOTAL=E.CUENTAID '
               + 'AND A.DOCID=F.DOCID ';
         try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            showMessage('Error al insertar Detalle Contable 1 por Pago de Retenciones');
            xgContinuaGrab := False;
         end;

         // DETALLE 2
         xSQL := 'INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
               + 'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
               + 'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
               + 'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
               + 'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
               + 'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
               + 'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
               + 'Select ''' + dblcCia.Text + ''', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , max(b.fecano), ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCta466 + ''', NULL, NULL, '
               + '''49'', RETSERIE, RETNUMERO, ''P:' + dbeNumPla.text + ' / Ret:''||RETNUMERO, ''H'', NULL, ' + xTCambio + ', sum(A.MTORETLOC), sum(A.MTORETLOC), sum(A.MTORETEXT), '
               + '''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMTE.wUsuario + ''', '
               + 'SYSDATE, SYSDATE, max(b.fecmes), max(b.fecdia), max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
               + '''N'' TMONID, NULL, NULL, NULL, MAX(C.TDIARDES), MAX(E.CTAABR), NULL, ''A Cuenta'', NULL, '
               + '0, 0, sum(A.MTORETLOC), sum(A.MTORETEXT), 0, 0, NULL, NULL, '
               + 'NULL, ''CXP'', ' + IntToStr(DMTE.cdsDetallePres.RecordCount + 1) + ', ''CXP'', NULL '
               + 'FROM CNT320 A, TGE114 B, TGE104 C, TGE202 E '
               + 'Where A.CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
               + 'AND RETNUMERO=''' + xNumret + ''' '
               + 'AND B.FECHA(+)=''' + dtpFecha.text + ''' '
               + 'AND C.TDIARID(+)=''' + xOrigen + ''' '
               + 'AND A.CIAID=E.CIAID AND ''' + xCta466 + '''=E.CUENTAID '
               + 'GROUP BY RETSERIE, RETNUMERO';
         try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            showMessage('Error al insertar Detalle Contable 2 por Pago de Retenciones');
            xgContinuaGrab := False;
         end;

         ///////////////////////////////
         //  ASIENTO EN COMPAÑIA 02   //
         ///////////////////////////////

         xSQL := 'SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
            + 'WHERE CIAID=''02'' AND CNTANOMM=''' + xPeriodo + ''' AND TDIARID=''' + xOrigen + '''';
         DMTE.cdsQry.Close;
         DMTE.cdsQry.indexfieldnames := '';
         DMTE.cdsQry.DataRequest(xSQL);
         DMTE.cdsQry.Open;
         xNoComp := DMTE.cdsQry.FieldByName('NOCOMP').AsString;

         If dblcCia.Text <> '02' Then
         Begin
            // cabecera
            xSQL := 'INSERT INTO CNT300 (CIAID, TDIARID, CNTCOMPROB, '
                  + 'CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
                  + 'CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
                  + 'CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
                  + 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
                  + 'Select ''02'', ''' + xOrigen + ''', ''' + xNoComp + ''', '
                  + '''' + xPeriodo + ''', ''' + xLote + ''', ''Ret:''||RETNUMERO||'' ' + xCiaAbr + ''', ' + xTCambio + ', ''' + dtpFecha.text + ''', '
                  + '''I'', ''N'', NULL, ''' + DMTE.wUsuario + ''', SYSDATE, SYSDATE, max(b.fecano) , max(b.fecmes), max(b.fecdia), '
                  + 'max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), ''N'' TMONID,  NULL, NULL, NULL, '
                  + 'max(TDIARDES), sum(A.MTORETLOC), sum(MTORETEXT), sum(A.MTORETLOC), sum(MTORETEXT), 0, 0, NULL, ''CXP'', ''CXP'' '
                  + 'FROM CNT320 A, TGE114 B, TGE104 C '
                  + 'Where A.CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
                  + 'AND RETNUMERO=''' + xNumret + ''' '
                  + 'AND ''' + dtpFecha.text + '''=B.FECHA '
                  + 'AND C.TDIARID=''' + xOrigen + ''' '
                  + 'GROUP BY RETNUMERO';
            try
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            except
               showMessage('Error al insertar Cabecera Contable por Pago de Retenciones Filiales');
               xgContinuaGrab := False;
            end;

            // DETALLE 1
            xSQL := 'INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + 'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + 'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + 'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + 'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + 'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + 'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + 'Select ''02'', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , max(b.fecano), ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCta166 + ''', NULL, NULL, '
                  + '''49'', RETSERIE, RETNUMERO, ''P:' + dbeNumPla.text + ' / Ret:''' + '||RETNUMERO, ''D'', NULL, ' + xTCambio + ', sum(A.MTORETLOC), sum(A.MTORETLOC), sum(A.MTORETEXT), '
                  + '''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMTE.wUsuario + ''', '
                  + 'SYSDATE, SYSDATE, max(b.fecmes), max(b.fecdia), max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
                  + '''N'' TMONID, NULL, NULL, NULL, MAX(C.TDIARDES), MAX(E.CTAABR), NULL, ''A Cuenta'', NULL, '
                  + 'sum(A.MTORETLOC), sum(A.MTORETEXT), 0, 0, 0, 0, NULL, NULL, '
                  + 'NULL, ''CXP'', ' + IntToStr(1) + ', ''CXP'', NULL '
                  + 'FROM CNT320 A, TGE114 B, TGE104 C, TGE202 E '
                  + 'Where A.CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
                  + 'AND RETNUMERO=''' + xNumret + ''' '
                  + 'AND B.FECHA(+)=''' + dtpFecha.text + ''' '
                  + 'AND C.TDIARID(+)=''' + xOrigen + ''' '
                  + 'AND ''02''=E.CIAID AND ''' + xCta166 + '''=E.CUENTAID '
                  + 'GROUP BY RETSERIE, RETNUMERO';
            try
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            except
               showMessage('Error al insertar Detalle Contable 1 por Pago de Retenciones Filiales');
               xgContinuaGrab := False;
            end;

            // DETALLE 2
            xSQL := 'INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + 'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + 'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + 'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + 'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + 'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + 'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + 'Select ''02'', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , max(b.fecano), ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCtaRet + ''', NULL, NULL, '
                  + '''49'', RETSERIE, RETNUMERO, ''' + Trim(xCiaAbr) + ' / Ret:''||RETNUMERO, ''H'', NULL, ' + xTCambio + ', sum(A.MTORETLOC), sum(A.MTORETLOC), sum(A.MTORETEXT), '
                  + '''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMTE.wUsuario + ''', '
                  + 'SYSDATE, SYSDATE, max(b.fecmes), max(b.fecdia), max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
                  + '''N'' TMONID, NULL, NULL, NULL, MAX(C.TDIARDES), MAX(E.CTAABR), NULL, ''A Cuenta'', NULL, '
                  + '0, 0, sum(A.MTORETLOC), sum(A.MTORETEXT), 0, 0, NULL, NULL, '
                  + 'NULL, ''CXP'', ' + IntToStr(2) + ', ''CXP'', NULL '
                  + 'FROM CNT320 A, TGE114 B, TGE104 C, TGE202 E '
                  + 'Where A.CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
                  + 'AND RETNUMERO=''' + xNumret + ''' '
                  + 'AND B.FECHA(+)=''' + dtpFecha.text + ''' '
                  + 'AND C.TDIARID(+)=''' + xOrigen + ''' '
                  + 'AND ''02''=E.CIAID AND ''' + xCtaRet + '''=E.CUENTAID '
                  + 'GROUP BY RETSERIE, RETNUMERO';
            try
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            except
               showMessage('Error al insertar Detalle Contable 2 por Pago de Retenciones Filiales');
               xgContinuaGrab := False;
            end;
         End;

         //////////////
         xLLave := DMTE.cdsDetallePres.FieldByname('CLAUXID').AsString + DMTE.cdsDetallePres.FieldByname('AUXID').AsString;
      End;
      DMTE.cdsDetallePres.Next;
   End;

   pnlCab.Enabled := False;
   pnlCab2.Enabled := False;
   pnlCnt.Enabled := False;

   DMTE.cdsDetallePres.Filtered := False;
   DMTE.cdsDetallePres.Filter := '';
   DMTE.cdsDetallePres.IndexFieldNames := '';
   DMTE.cdsDetallePres.First;

End;

Procedure TFPagoDetCab.bbtnVerContClick(Sender: TObject);
Var
   xSQL, xOrigen, xPeriodo, xLote: String;
Begin

End;

Procedure TFPagoDetCab.BitBtn1Click(Sender: TObject);
Var
   xSQL, xOrigen, xPeriodo, xLote: String;
Begin

End;

Procedure TFPagoDetCab.BitBtn3Click(Sender: TObject);
Var
   xSQL, xOrigen, xPeriodo, xLote: String;
Begin

End;

Procedure TFPagoDetCab.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;

End;

Procedure TFPagoDetCab.bbtnIniClick(Sender: TObject);
//Inicio HPC_201705_CAJA
//Ajustes en la opción de pago de detracciones
var
   xSQL: String;
//Fin HPC_201705_CAJA
Begin

   If DMTE.cdsOPago.fieldByname('USUCONTA').AsString <> '' Then
   Begin
      ShowMessage('Orden de Pago ya fue contabilizada. No se puede cambiar a Inicial');
      Exit;
   End;

   //Inicio HPC_201705_CAJA
   //Ajustes en la opción de pago de detracciones
   IF DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin

      DMTE.DCOM1.AppServer.IniciaTransaccion;
      DMTE.cdsDetallePres.First;
      While Not DMTE.cdsDetallePres.EOF Do
      Begin

          xSQL := 'SELECT COUNT(1) cuenta FROM  CXP_ORD_PAG_DET '
            + ' where CLAUXID = ''' + DMTE.cdsDetallePres.FieldByName('CLAUXID').AsString + ''' '
            + ' and AUXID = ''' + DMTE.cdsDetallePres.FieldByName('AUXID').AsString + ''' '
            + ' and DOCID = ''' + DMTE.cdsDetallePres.FieldByName('DOCID').AsString + ''' '
            + ' and CPSERIE = ''' + DMTE.cdsDetallePres.FieldByName('CPSERIE').AsString + ''' '
            + ' and CPNODOC = ''' + DMTE.cdsDetallePres.FieldByName('CPNODOC').AsString + ''' '
            + ' and CIAID =''' + DMTE.cdsOPago.FieldByname('CIAID').AsString + ''' '
            + ' and NUMERO <> ''' + DMTE.cdsOPago.FieldByname('NUMERO').AsString + ''' '
            + ' and (Select ESTADO From CXP_ORD_PAG_CAB '
            + '      where CIAID =''' + DMTE.cdsOPago.FieldByname('CIAID').AsString + ''' '
            + '      and NUMERO = ''' + DMTE.cdsOPago.FieldByname('NUMERO').AsString + ''' ) <> CXP_ORD_PAG_DET.ESTADO ';

          DMTE.cdsQry7.Close;
          DMTE.cdsQry7.DataRequest(xSQL);
          DMTE.cdsQry7.Open;

          If DMTE.cdsQry7.FieldByName('cuenta').AsInteger > 0 Then
          Begin
              ShowMessage('El documento (DOCID:' + DMTE.cdsDetallePres.FieldByName('DOCID').AsString +
                      ',CPSERIE:' + DMTE.cdsDetallePres.FieldByName('CPSERIE').AsString +
                      ',CPNODOC:' + DMTE.cdsDetallePres.FieldByName('CPNODOC').AsString +
                      ') se asignó en otra Orden de Pago. No se puede cambiar a Inicial');
              DMTE.DCOM1.AppServer.RetornaTransaccion;
              Exit;
          End;

          If DMTE.cdsDetallePres.FieldByName('MOD_DETR').AsString = 'CAJA' Then
          Begin
              xSQL := 'Update CAJA302 '
                  + '   set ECOPAGO = ''' + DMTE.cdsOPago.FieldByName('NUMERO').AsString + ''' '
                  + ' where ECESTADO = ''C'' '
                  + '   and tipdet=''I4'' '
                  + '   and CLAUXID = ''' + DMTE.cdsDetallePres.FieldByName('CLAUXID').AsString + ''' '
                  + '   and PROV = ''' + DMTE.cdsDetallePres.FieldByName('AUXID').AsString + ''' '
                  + '   and ECNOCHQ=''' + DMTE.cdsDetallePres.FieldByName('NUMDETRAC').AsString + ''' ';
          End
          Else
          Begin
              xSQL := 'Update CXP302 '
                  + '   set FLAGVAR =''S'' '
                  + ' where tipdet=''I4'' '
                  + '   and CLAUXID=''' + DMTE.cdsDetallePres.FieldByName('CLAUXID').AsString + ''' '
                  + '   and DCPAUXID = ''' + DMTE.cdsDetallePres.FieldByName('AUXID').AsString + ''' '
                  + '   and DOCID = ''' + DMTE.cdsDetallePres.FieldByName('DOCID').AsString + ''' '
                  + '   and CPSERIE = ''' + DMTE.cdsDetallePres.FieldByName('CPSERIE').AsString + ''' '
                  + '   and CPNODOC = ''' + DMTE.cdsDetallePres.FieldByName('CPNODOC').AsString + ''' ';
          End;

          Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
          Except
            ShowMessage('Error en la Transacción Insertar');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
          End;
          DMTE.cdsDetallePres.Next;
      End;
      DMTE.DCOM1.AppServer.GrabaTransaccion;
   End;
   //Fin HPC_201705_CAJA

   DMTE.cdsOPago.Edit;
   DMTE.cdsOPago.fieldByname('USUACEPTA').AsString := '';
   DMTE.cdsOPago.fieldByname('ESTADO').AsString := 'I';
   DMTE.cdsOPago.Post;

   If DMTE.cdsOPago.ApplyUpdates(-1) > 0 Then
   Begin
      ShowMessage('Error al grabar 1');
      Exit;
   End;
   ShowMessage('Orden de Pago en Estado Inicial');

End;

Procedure TFPagoDetCab.bbtnRetUnoClick(Sender: TObject);
Var
   xLLave, xNumRet, xSQL, xCiaAbr, xNoDoc, xDoc: String;
   xNoComp, xPeriodo, xOrigen, xLote, xTCambio, xCta166, xCta466, xWhere, xCtaRet: String;
Begin
   If MessageDlg('¿ Esta Seguro de Generar Asiento de Retenciones ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo Then Exit;

   xWhere := 'CIAID=' + quotedstr(dblcCia.Text);

   xCiaAbr := DMTE.DisplayDescripLocal(DMTE.cdsCia, 'CIAID', dblcCia.Text, 'CIAABR');

   xCtaRet := '4010105';
   xOrigen := '53';
   xPeriodo := Copy(dtpFecha.text, 7, 4) + Copy(dtpFecha.text, 4, 2);

   xLote := Copy(dbeNumero.Text, 3, 4);
   xTCambio := '0';
   xWhere := 'TMONID=''' + DMTE.wTMonExt + ''' and FECHA=''' + dtpFecha.text + '''';
   If length(DMTE.DisplayDescrip('prvTGE', 'TGE107', '*', xWhere, 'TMONID')) > 0 Then
      xTCambio := FloatToStr(DMTE.cdsQry.fieldbyname('TCAMVOV').AsFloat);

   If xTCambio = '0' Then
   Begin
      ShowMessage('Falta ingresar el Tipo de Cambio');
      Exit;
   End;

   xSQL := 'Select CTADEBE, B.CTA_AUX AUX_D, B.CTA_CCOS CCOS_D, CTAHABER, C.CTA_AUX AUX_H, C.CTA_CCOS CCOS_H, TDIARID, CIAORIGEN, TDIARID2 '
         + 'From CAJA103 A, TGE202 B, TGE202 C '
         + 'Where A.CIAID=''' + dblcCia.Text + ''' '
         + ' AND B.CIAID=A.CIAID AND A.CTADEBE=B.CUENTAID '
         + ' AND C.CIAID=A.CIAID AND A.CTAHABER=C.CUENTAID ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;
   xCta166 := DMTE.cdsQry.FieldByName('CTADEBE').AsString;
   xCta466 := DMTE.cdsQry.FieldByName('CTAHABER').AsString;

      // ACTUALIZA SALDOS

   xLLave := DMTE.cdsDetallePres.FieldByname('CLAUXID').AsString + DMTE.cdsDetallePres.FieldByname('AUXID').AsString;

   xDoc := DMTE.cdsDetallePres.fieldByname('DOCID').AsString;
   xNoDoc := DMTE.cdsDetallePres.fieldByname('CPNODOC').AsString;

   xSQL := 'SELECT CIAID, CLAUXID, AUXID, DOCID, SERIE, NODOC, MTOORI, MTORETORI, RETSERIE, RETNUMERO '
         + 'FROM CNT320 '
         + 'Where CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + 'AND CLAUXID=''' + DMTE.cdsDetallePres.fieldByname('CLAUXID').AsString + ''' '
         + 'AND AUXID=''' + DMTE.cdsDetallePres.fieldByname('AUXID').AsString + ''' '
         + 'AND DOCID=''' + xDoc + ''' '
         + 'AND NODOC LIKE ''%' + xNoDoc + '%'' AND NVL(ECESTADO,''P'')<>''A'''
         + 'AND FECPAGO>=''' + DateToStr(dtpFecha.Date - 2) + '''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.indexfieldnames := '';
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;

   xNumRet := DMTE.cdsQry.fieldByname('RETNUMERO').AsString;

   xSQL := 'SELECT CIAID, CLAUXID, AUXID, DOCID, SERIE, NODOC, MTOORI, MTORETORI, RETSERIE, RETNUMERO '
         + 'FROM CNT320 '
         + 'Where CIAID=''' + DMTE.cdsQry.fieldByname('CIAID').AsString + ''' AND RETNUMERO=''' + xNumret + '''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.indexfieldnames := '';
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;

   If DMTE.cdsQry.RecordCount <= 0 Then
   Begin
      ShowMessage('Error no Existe retención generada para este documento');
      Exit;
   End;

          //////////////////////////////////
         //  ASIENTO EN COMPAÑIA FILIAL  //
         //////////////////////////////////

   xSQL := 'SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
         + 'WHERE CIAID=''' + dblcCia.Text + ''' AND CNTANOMM=''' + xPeriodo + ''' AND TDIARID=''' + xOrigen + '''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.indexfieldnames := '';
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;
   xNoComp := DMTE.cdsQry.FieldByName('NOCOMP').AsString;

         // cabecera
   xSQL := 'INSERT INTO CNT300 (CIAID, TDIARID, CNTCOMPROB, '
         + 'CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
         + 'CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
         + 'CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
         + 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
         + 'Select ''' + dblcCia.Text + ''', ''' + xOrigen + ''', ''' + xNoComp + ''', '
         + '''' + xPeriodo + ''', ''' + xLote + ''', ''P:' + dbeNumPla.text + ' / ' + dblcCia.Text + ' / Ret:''||RETNUMERO, ' + xTCambio + ', ''' + dtpFecha.text + ''', '
         + '''I'', ''N'', NULL, ''' + DMTE.wUsuario + ''', SYSDATE, SYSDATE, max(b.fecano) , max(b.fecmes), max(b.fecdia), '
         + 'max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), ''N'' TMONID,  NULL, NULL, NULL, '
         + 'max(TDIARDES), sum(A.MTORETLOC), sum(MTORETEXT), sum(A.MTORETLOC), sum(MTORETEXT), 0, 0, NULL, ''CXP'', ''CXP'' '
         + 'FROM CNT320 A, TGE114 B, TGE104 C '
         + 'Where A.CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + 'AND RETNUMERO=''' + xNumret + ''' '
         + 'AND ''' + dtpFecha.text + '''=B.FECHA '
         + 'AND C.TDIARID=''' + xOrigen + ''' '
         + 'GROUP BY RETNUMERO';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 1
   xSQL := 'INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
         + 'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
         + 'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
         + 'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         + 'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
         + 'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
         + 'CNTPAGADO, CNTMODDOC, CNTREG, MODULO ) '
         + 'Select ''' + dblcCia.Text + ''', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , b.fecano, ''' + xPeriodo + ''', ''' + xLote + ''', D.CTATOTAL, D.CLAUXID, PROV, '
         + 'D.DOCID, D.CPSERIE, D.CPNODOC, SUBSTR(D.PROVDES,1,40), ''D'', NULL, ' + xTCambio + ', A.MTORETLOC, A.MTORETLOC, MTORETEXT, '
         + 'D.CPFEMIS, D.CPFVCMTO, ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMTE.wUsuario + ''', '
         + 'SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem , b.fecaass, '
         + '''N'' TMONID, NULL, NULL, NULL, C.TDIARDES, E.CTAABR, SUBSTR(D.PROVDES,1,15), F.DOCABR, NULL, '
         + 'A.MTORETLOC, MTORETEXT, 0, 0, 0, 0, NULL, NULL, '
         + 'NULL, ''CXP'', ROWNUM, ''CXP'' '
         + 'FROM CNT320 A, CXP301 D, TGE114 B, TGE104 C, TGE202 E, TGE110 F '
         + 'Where A.CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + 'AND RETNUMERO=''' + xNumret + ''' '
         + 'AND D.CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + 'AND A.CLAUXID=D.CLAUXID AND A.AUXID=D.PROV AND A.DOCID=D.DOCID(+) '
         + 'AND CAST(replace(D.CPNODOC,''.'') AS NUMERIC)= CAST(NODOC AS NUMERIC) '
         + 'AND CAST(D.CPSERIE AS NUMERIC)= CAST(SERIE AS NUMERIC) '
         + 'AND D.CPESTADO IN (''P'',''C'') '
         + 'AND B.FECHA(+)=''' + dtpFecha.text + ''' '
         + 'AND C.TDIARID(+)=''' + xOrigen + ''' '
         + 'AND A.CIAID=E.CIAID AND D.CTATOTAL=E.CUENTAID '
         + 'AND A.DOCID=F.DOCID ';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 2
   xSQL := 'INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
         + 'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
         + 'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
         + 'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         + 'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
         + 'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
         + 'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
         + 'Select ''' + dblcCia.Text + ''', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , max(b.fecano), ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCta466 + ''', NULL, NULL, '
         + '''49'', RETSERIE, RETNUMERO, ''P:' + dbeNumPla.text + ' / Ret:''||RETNUMERO, ''H'', NULL, ' + xTCambio + ', sum(A.MTORETLOC), sum(A.MTORETLOC), sum(A.MTORETEXT), '
         + '''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMTE.wUsuario + ''', '
         + 'SYSDATE, SYSDATE, max(b.fecmes), max(b.fecdia), max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
         + '''N'' TMONID, NULL, NULL, NULL, MAX(C.TDIARDES), MAX(E.CTAABR), NULL, ''A Cuenta'', NULL, '
         + '0, 0, sum(A.MTORETLOC), sum(A.MTORETEXT), 0, 0, NULL, NULL, '
         + 'NULL, ''CXP'', ' + IntToStr(DMTE.cdsDetallePres.RecordCount + 1) + ', ''CXP'', NULL '
         + 'FROM CNT320 A, TGE114 B, TGE104 C, TGE202 E '
         + 'Where A.CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + 'AND RETNUMERO=''' + xNumret + ''' '
         + 'AND B.FECHA(+)=''' + dtpFecha.text + ''' '
         + 'AND C.TDIARID(+)=''' + xOrigen + ''' '
         + 'AND A.CIAID=E.CIAID AND ''' + xCta466 + '''=E.CUENTAID '
         + 'GROUP BY RETSERIE, RETNUMERO';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         ///////////////////////////////
         //  ASIENTO EN COMPAÑIA 02   //
         ///////////////////////////////

   xSQL := 'SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
         + 'WHERE CIAID=''02'' AND CNTANOMM=''' + xPeriodo + ''' AND TDIARID=''' + xOrigen + '''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.indexfieldnames := '';
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;
   xNoComp := DMTE.cdsQry.FieldByName('NOCOMP').AsString;

         // cabecera
   xSQL := 'INSERT INTO CNT300 (CIAID, TDIARID, CNTCOMPROB, '
         + 'CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
         + 'CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
         + 'CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
         + 'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
         + 'Select ''02'', ''' + xOrigen + ''', ''' + xNoComp + ''', '
         + '''' + xPeriodo + ''', ''' + xLote + ''', ''Ret:''||RETNUMERO||'' ' + xCiaAbr + ''', ' + xTCambio + ', ''' + dtpFecha.text + ''', '
         + '''I'', ''N'', NULL, ''' + DMTE.wUsuario + ''', SYSDATE, SYSDATE, max(b.fecano) , max(b.fecmes), max(b.fecdia), '
         + 'max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), ''N'' TMONID,  NULL, NULL, NULL, '
         + 'max(TDIARDES), sum(A.MTORETLOC), sum(MTORETEXT), sum(A.MTORETLOC), sum(MTORETEXT), 0, 0, NULL, ''CXP'', ''CXP'' '
         + 'FROM CNT320 A, TGE114 B, TGE104 C '
         + 'Where A.CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + 'AND RETNUMERO=''' + xNumret + ''' '
         + 'AND ''' + dtpFecha.text + '''=B.FECHA '
         + 'AND C.TDIARID=''' + xOrigen + ''' '
         + 'GROUP BY RETNUMERO';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 1
   xSQL := 'INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
         + 'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
         + 'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
         + 'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         + 'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
         + 'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
         + 'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
         + 'Select ''02'', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , max(b.fecano), ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCta166 + ''', NULL, NULL, '
         + '''49'', RETSERIE, RETNUMERO, ''P:' + dbeNumPla.text + ' / Ret:''' + '||RETNUMERO, ''D'', NULL, ' + xTCambio + ', sum(A.MTORETLOC), sum(A.MTORETLOC), sum(A.MTORETEXT), '
         + '''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMTE.wUsuario + ''', '
         + 'SYSDATE, SYSDATE, max(b.fecmes), max(b.fecdia), max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
         + '''N'' TMONID, NULL, NULL, NULL, MAX(C.TDIARDES), MAX(E.CTAABR), NULL, ''A Cuenta'', NULL, '
         + 'sum(A.MTORETLOC), sum(A.MTORETEXT), 0, 0, 0, 0, NULL, NULL, '
         + 'NULL, ''CXP'', ' + IntToStr(1) + ', ''CXP'', NULL '
         + 'FROM CNT320 A, TGE114 B, TGE104 C, TGE202 E '
         + 'Where A.CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + 'AND RETNUMERO=''' + xNumret + ''' '
         + 'AND B.FECHA(+)=''' + dtpFecha.text + ''' '
         + 'AND C.TDIARID(+)=''' + xOrigen + ''' '
         + 'AND ''02''=E.CIAID AND ''' + xCta166 + '''=E.CUENTAID '
         + 'GROUP BY RETSERIE, RETNUMERO';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 2
   xSQL := 'INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
         + 'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
         + 'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
         + 'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         + 'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
         + 'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
         + 'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
         + 'Select ''02'', ''' + xOrigen + ''' TDIARID, ''' + xNoComp + ''' CNTCOMPROB , max(b.fecano), ''' + xPeriodo + ''', ''' + xLote + ''', ''' + xCtaRet + ''', NULL, NULL, '
         + '''49'', RETSERIE, RETNUMERO, ''' + Trim(xCiaAbr) + ' / Ret:''||RETNUMERO, ''H'', NULL, ' + xTCambio + ', sum(A.MTORETLOC), sum(A.MTORETLOC), sum(A.MTORETEXT), '
         + '''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''' + dtpFecha.text + ''', ''I'', ''N'', ''N'', ''' + DMTE.wUsuario + ''', '
         + 'SYSDATE, SYSDATE, max(b.fecmes), max(b.fecdia), max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
         + '''N'' TMONID, NULL, NULL, NULL, MAX(C.TDIARDES), MAX(E.CTAABR), NULL, ''A Cuenta'', NULL, '
         + '0, 0, sum(A.MTORETLOC), sum(A.MTORETEXT), 0, 0, NULL, NULL, '
         + 'NULL, ''CXP'', ' + IntToStr(2) + ', ''CXP'', NULL '
         + 'FROM CNT320 A, TGE114 B, TGE104 C, TGE202 E '
         + 'Where A.CIAID IN (''' + DMTE.cdsDetallePres.fieldByname('CIAID').AsString + ''',''02'') '
         + 'AND RETNUMERO=''' + xNumret + ''' '
         + 'AND B.FECHA(+)=''' + dtpFecha.text + ''' '
         + 'AND C.TDIARID(+)=''' + xOrigen + ''' '
         + 'AND ''02''=E.CIAID AND ''' + xCtaRet + '''=E.CUENTAID '
         + 'GROUP BY RETSERIE, RETNUMERO';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   pnlCab.Enabled := False;
   pnlCab2.Enabled := False;
   pnlCnt.Enabled := False;

   DMTE.cdsDetallePres.Filtered := False;
   DMTE.cdsDetallePres.Filter := '';
   DMTE.cdsDetallePres.IndexFieldNames := '';
   DMTE.cdsDetallePres.First;

End;

Procedure TFPagoDetCab.FormCreate(Sender: TObject);
Begin
   CargaDataSource;
End;

//verfica si el detalle de la contabilización corresponde a todos los documentos
//contenidos en la Orden de Pago

Function TFPagoDetCab.fg_Valida_AsientoContable(wgCiaid, wgNumOrdenPago, wgOrigen: String): Boolean;
Var
   xsMensaje, xsSql: String;
Begin
   xsSql := ' SELECT A.*  FROM CXP_ORD_PAG_DET  A '
         + ' WHERE A.CIAID=' + QuotedStr(wgCiaid) + ' AND A.NUMERO=' + QuotedStr(wgNumOrdenPago)
         + ' AND NOT EXISTS (SELECT 1 FROM CXP301 D, TGE114 B, TGE104 C, TGE202 E, TGE110 F , CXP_ORD_PAG_CAB '
         + ' WHERE A.CIAID=D.CIAID(+) AND A.CLAUXID=D.CLAUXID AND A.AUXID=D.PROV '
         + ' AND A.DOCID=D.DOCID(+) AND NVL(A.CPSERIE,''0'')=NVL(D.CPSERIE,''0'') AND A.CPNODOC=D.CPNODOC(+) '
         + ' AND D.CPESTADO IN (''P'',''C'') '
         + ' AND B.FECHA(+)=' + QuotedStr(DMTE.cdsOPago.FieldByname('FECHA').AsString)
         + ' AND C.TDIARID(+)=' + QuotedStr(wgOrigen)
         + ' AND A.CIAID=E.CIAID AND D.CTATOTAL=E.CUENTAID '
         + ' AND A.DOCID=F.DOCID '
         + ' AND A.CIAID = CXP_ORD_PAG_CAB.CIAID '
         + ' AND A.NUMERO = CXP_ORD_PAG_CAB.NUMERO )';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;
   If DMTE.cdsQry.RecordCount > 0 Then
   Begin
      xsMensaje := 'El pago del documento ' + #13 +
         ' Serie :' + DMTE.cdsQry.FieldByname('FECHA').AsString +
         ' Número :' + DMTE.cdsQry.FieldByname('FECHA').AsString +
         ' no puede ser Contabilizado ';
      ShowMessage(xsMensaje);
      Result := False;
      Exit;
   End;
   Result := True;
End;

Procedure TFPagoDetCab.dtpFechaExit(Sender: TObject);
Begin
   If fg_validaCierreContable(dtpFecha.Date) = True Then
   Begin
      ShowMessage(' Mes Cerrado Contablemente!!!, No se puede Registrar');
      dtpFecha.SetFocus;
      Exit;
   End;
End;

Function TFPagoDetCab.fg_validaCierreContable(
   wgFecha: TDateTime): Boolean;
Var
   xnAnio, xnMes, xnDia: Word;
Begin
   decodeDate(wgFecha, xnAnio, xnMes, xnDia);
   If DMTE.MesCerrado(intToStr(xnMes), intToStr(xnAnio), dblcCia.text) Then
   Begin
      Result := True;
      exit;
   End;

   Result := False;
End;

Procedure TFPagoDetCab.bbtnRepClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'A' Then
   Begin
      ShowMessage('Orden de Pago Esta Anulada');
      Exit;
   End;
   If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'I' Then
   Begin
      ShowMessage('Orden de Pago se encuentra en Estado Inicial');
      Exit;
   End;

   xSQL := 'Select p.ciaid, p.numero, p.item, p.clauxid, p.auxid, c.ecgira, '
         + 'p.docid, p.cpnodoc, p.cpserie, p.tmonid, p.cpmtoori, c.ecanomm, NUMDETRAC,'
         + 'b.CPTODETRSUNATID, b.TIPOOPERSUNATID, A.PROVRUC, x.CCBCOID, nvl(IMPPAGO,0) DEMTOLOC '
         + ', p.CPSALORI, p.IMPPAGO, p.CPPAGORI, p.NUMCONSTA, '
         + '(SELECT CXP_DETR_SUNAT.CPTODETRSUNATDES FROM CXP_DETR_SUNAT WHERE b.CPTODETRSUNATID = CXP_DETR_SUNAT.CPTODETRSUNATID ) TIPODETRACCION, '
         + '(SELECT CXP_TIP_OPER_SUNAT.TIPOOPERSUNATDES FROM CXP_TIP_OPER_SUNAT WHERE b.TIPOOPERSUNATID = CXP_TIP_OPER_SUNAT.TIPOOPERSUNATID ) TIPOOPERACION '
         + 'from CXP_ORD_PAG_DET P, CAJA302 C, CAJA303 a, CXP301 b, caja102 x '
         + 'where p.CIAID =''' + DMTE.cdsOPago.FieldByname('CIAID').AsString + ''' '
         + ' and p.NUMERO=''' + DMTE.cdsOPago.FieldByname('NUMERO').AsString + ''' '
         + ' and c.clauxid=p.clauxid  and c.prov=p.auxid and p.numero=c.ecopago(+) and c.tipdet=''I4'' '
         + ' and p.docid=a.docid2 and p.cpserie=a.cpserie and p.cpnodoc=a.cpnodoc and p.auxid=a.prov and a.tdiarid=''62'' '
         + ' and a.ciaid=c.ciaid and a.ecanomm=c.ecanomm and a.tdiarid=c.tdiarid and a.ecnocomp=c.ecnocomp '
         + ' and a.ciaid2=b.ciaid and tdiarid2=b.tdiarid and a.cpanomm=b.cpanomes and a.cpnoreg=b.cpnoreg '
         + ' and x.CLAUXID(+)=p.clauxid and x.PROV(+)=p.auxid and x.CIAID(+)=p.ciaid and x.detraccion(+)=''S'' '
         + 'ORDER BY ITEM';
   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.Recordcount <= 0 Then
   Begin
      ShowMessage('No existe información para este Pago');
      Exit;
   End;

   ppdb1.DataSource := DMTE.dsReporte;
   ppr1.TEMPLATE.FileName := wRutaRpt + '\PagoDetraccion.Rtm';
   ppr1.template.LoadFromFile;

// cambia control de diseño de reporte
   if cbDisenoRep.Checked then
      ppd1.ShowModal
   else
   begin
      ppr1.Print;
      ppr1.Stop;
   end;
End;

Procedure TFPagoDetCab.bbtnImportaClick(Sender: TObject);
Begin
   If DMTE.cdsOPago.fieldByname('USUCONTA').AsString <> '' Then
   Begin
      ShowMessage('Orden de Pago ya fue contabilizada. No se puede Importar datos');
      Exit;
   End;

   If Not sdImp.Execute Then Exit;
   mImp.Lines.Clear;
   mImp.Lines.LoadFromFile(sdImp.FileName);
   pnlImp.Visible := True;
   pnlImp.BringToFront;
End;

Procedure TFPagoDetCab.bbtnCancelaClick(Sender: TObject);
Begin
   pnlImp.Visible := False;
   pnlImp.SendToBack;
End;

Procedure TFPagoDetCab.bbtnConstaClick(Sender: TObject);
Var
   i: integer;
   xSQL: String;
   // Inicio HPC_201703_CAJA 
   // Número de constancia de Depósito Detracciones
   sNumOpeTitulo, sRucProTitulo, sMonDepTitulo, sNumCompTitulo: String;
   sTipCompr,sNumCompr,sNumComprSer,sNumComprNum : String;
   // Fin HPC_201703_CAJA
   sNumOpe, sNumCon, sRucPro: String;
   sFecPag, sPerTri, xxx: String;
   nMonDep: Double;
   nMonTot: Double;
Begin
// Inicio HPC_201706_CAJA
   // Inicio HPC_201703_CAJA
   // Número de constancia de Depósito Detracciones
   For i := 0 To mImp.Lines.Count Do
   // Fin HPC_201703_CAJA
   Begin
      // Inicio HPC_201703_CAJA
      // Número de constancia de Depósito Detracciones
      If ((Copy(mImp.Lines[i], 1, 19) = 'Numero de operacion') Or (Copy(mImp.Lines[i], 1, 19) = 'N?mero de operacion') Or (Copy(mImp.Lines[i], 1, 19) = 'Numero de operaci?n') Or (Copy(mImp.Lines[i], 1, 19) = 'N?mero de operaci?n') Or (Copy(mImp.Lines[i], 1, 19) = 'Número de operación')) Then
      // Fin HPC_201703_CAJA
      Begin
         sNumOpe := trim(StringReplace(mImp.Lines[i], 'Numero de operacion', '', [rfReplaceAll]));
      End;

      If Copy(mImp.Lines[i], 1, 20) = 'Fecha y hora de pago' Then
      Begin
         sFecPag := Copy(mImp.Lines[i], 33, 10);
         sFecPag := copy(trim(StringReplace(mImp.Lines[i], 'Fecha y hora de pago', '', [rfReplaceAll])),1,10);
      End;

      If Copy(mImp.Lines[i], 1, 11) = 'Monto total' Then
      Begin
         nMonTot := strtofloat(trim(StringReplace(mImp.Lines[i], 'Monto total', '', [rfReplaceAll]))) * 1.00;
      End;
   End;

   If nMonTot <> strtofloat(StringReplace(dbgDetalle.ColumnByName('IMPPAGO').FooterValue, ',', '', [rfReplaceAll])) Then
   Begin
      ShowMessage('Error : El Importe Total del pago (' + dbgDetalle.ColumnByName('IMPPAGO').FooterValue + '), NO es igual al del archivo (' + floattostrf(nMonTot, ffNumber, 10, 2) + '). Verificar....');
      Exit;
   End;

   i := 15;
   // Inicio HPC_201703_CAJA
   // Número de constancia de Depósito Detracciones
   While i <= mImp.Lines.Count Do
   // Fin HPC_201703_CAJA
   Begin
      // Inicio HPC_201703_CAJA
      // Número de constancia de Depósito Detracciones
      If ((Copy(mImp.Lines[i], 1, 20) = 'Numero de constancia') Or (Copy(mImp.Lines[i], 1, 20) = 'N?mero de constancia') Or (Copy(mImp.Lines[i], 1, 20) = 'Número de constancia')) Then
      Begin
         sNumOpeTitulo:= Copy(mImp.Lines[i], 1, 20);
         //sNumCon := trim(StringReplace(mImp.Lines[i], 'Numero de constancia', '', [rfReplaceAll]));
         sNumCon := trim(StringReplace(mImp.Lines[i], sNumOpeTitulo, '', [rfReplaceAll]));
         //trim(Copy(mImp.Lines[i], 41, 10));
      End;
      If ((Copy(mImp.Lines[i], 1, 30) = 'Número Documento del Proveedor') Or (Copy(mImp.Lines[i], 1, 30) = 'N?mero Documento del Proveedor') Or (Copy(mImp.Lines[i], 1, 30) = 'Numero Documento del Proveedor')) Then
      Begin
         sRucProTitulo:= Copy(mImp.Lines[i], 1, 30);
         //sRucPro := trim(StringReplace(mImp.Lines[i], 'Número Documento del Proveedor', '', [rfReplaceAll]));
         sRucPro := trim(StringReplace(mImp.Lines[i], sRucProTitulo, '', [rfReplaceAll]));
      End;
      If (Copy(mImp.Lines[i], 1, 16) = 'Monto deposito  ') or (Copy(mImp.Lines[i], 1, 16) = 'Monto dep?sito  ') or (Copy(mImp.Lines[i], 1, 16) = 'Monto depósito  ') Then
      Begin
         sMonDepTitulo:= Copy(mImp.Lines[i], 1, 16);
         nMonDep := strtofloat(trim(StringReplace(mImp.Lines[i], sMonDepTitulo, '', [rfReplaceAll]))) * 1.00;
      End;
	  // Fin HPC_201703_CAJA
      If Copy(mImp.Lines[i], 1, 18) = 'Periodo Tributario' Then
      Begin
         sPerTri := trim(StringReplace(mImp.Lines[i], 'Periodo Tributario', '', [rfReplaceAll]));
      End;
      // Inicio HPC_201703_CAJA
      // Número de constancia de Depósito Detracciones
      If Copy(mImp.Lines[i], 1, 19) = 'Tipo de Comprobante' Then
      Begin
         sTipCompr := trim(StringReplace(mImp.Lines[i], 'Tipo de Comprobante', '', [rfReplaceAll]));
         sTipCompr := copy(sTipCompr,1,2);
      End;
      If (Copy(mImp.Lines[i], 1, 21) = 'N?mero de Comprobante') or (Copy(mImp.Lines[i], 1, 21) = 'Numero de Comprobante') or (Copy(mImp.Lines[i], 1, 21) = 'Número de Comprobante') Then
      Begin
         sNumCompTitulo := Copy(mImp.Lines[i], 1, 21);
         sNumCompr := trim(StringReplace(mImp.Lines[i], sNumCompTitulo, '', [rfReplaceAll]));
         sNumComprSer := copy(sNumCompr,1,4);
         sNumComprNum := intTostr(Strtoint(copy(sNumCompr,6,8)));
      End;
      // Fin HPC_201703_CAJA
      // Inicio HPC_201703_CAJA
      // Número de constancia de Depósito Detracciones
      //i := i + 1;
      //if ((i=(mImp.Lines.Count-1)) or ((Copy(mImp.Lines[i], 1, 20) = 'Numero de constancia')) Or (Copy(mImp.Lines[i], 1, 20) = 'N?mero de constancia')) and (length(sRucPro)>0) then
      if ((length(sNumCon)>0) And (length(sRucPro)>0) And (nMonDep>0) And (length(sTipCompr)>0) And (length(sNumComprSer)>0) And (length(sNumComprNum)>0) ) then
      // Fin HPC_201703_CAJA
      begin
         xSQL := 'select CLAUXID, PROV from TGE201 where PROVRUC=''' + sRucPro + ''' and CLAUXID in (''P'',''H'')';
         DMTE.cdsQry.Close;
         DMTE.cdsQry.indexfieldnames := '';
         DMTE.cdsQry.DataRequest(xSQL);
         DMTE.cdsQry.Open;
         If DMTE.cdsQry.Recordcount > 0 Then
         Begin
         // Inicio HPC_201703_CAJA
         // Número de constancia de Depósito Detracciones
            xSQL := 'Update CXP_ORD_PAG_DET '
                  + '   set NUMCONSTA=''' + sNumCon + ''' '
                  + ' where NUMERO=''' + dbeNumero.Text + ''' '
                  + '   and AUXID=''' + DMTE.cdsQry.FieldByname('PROV').AsString + ''' '
                  + '   and IMPPAGO=' + Floattostr(nMonDep) + ' and (NUMCONSTA is null or NUMCONSTA='''') '
                  + '   and DOCID =''' + sTipCompr + ''' and CPSERIE =''' + sNumComprSer + ''' and TO_NUMBER(NVL(CPNODOC,''0'')) = ''' + sNumComprNum + ''' ';
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest(xSQL);
            DMTE.cdsQry.Execute;
            sNumCon :='';
            sRucPro :='';
            nMonDep :=0;
            sTipCompr :='';
            sNumComprSer :='';
            sNumComprNum :='';
         // Fin HPC_201703_CAJA
         End;
      End;
      // Inicio HPC_201703_CAJA
      // Número de constancia de Depósito Detracciones
      i := i + 1;
      // Fin HPC_201703_CAJA
   End;
   xSQL := 'Update CXP_ORD_PAG_CAB '
         + '   set NUMPLA=''' + sNumOpe + ''', FECCONTA=''' + sFecPag + ''' '
         + ' where NUMERO=''' + dbeNumero.Text + '''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Execute;

   // Inicio HPC_201703_CAJA
   // Número de constancia de Depósito Detracciones
   CargaGridDetalle;
   // Fin HPC_201703_CAJA
   ShowMessage('Datos Grabados');
// Fin HPC_201706_CAJA
   fg_RecuperaDetalle;


   pnlImp.Visible := False;
   pnlImp.SendToBack;
End;

Procedure TFPagoDetCab.fg_HabilitaPanelConstancia;
Begin
   pnlConstancia.Visible := True;
   pnlConstancia.Top := 208;
   pnlConstancia.Left := 304;
   dbgDetalle.Enabled := False;
   edtConstancia.DataSource := DMTE.dsDetallePres;
   edtConstancia.DataField := 'NUMCONSTA';
   edtConstancia.SetFocus;
End;

Procedure TFPagoDetCab.btnCerrarPanelConstanciaClick(Sender: TObject);
Begin
   pnlConstancia.Visible := False;
   dbgDetalle.Enabled := True;
   fg_RecuperaDetalle;
End;

Procedure TFPagoDetCab.btnActualizarConstanciaClick(Sender: TObject);
Var
   xsSql: String;
Begin
   pnlConstancia.Visible := False;
   dbgDetalle.Enabled := True;
   xsSql := ' UPDATE CXP_ORD_PAG_DET SET NUMCONSTA = ' + QuotedStr(DMTE.cdsDetallePres.FieldByname('NUMCONSTA').AsString) +
            ' WHERE CIAID =' + QuotedStr(DMTE.cdsDetallePres.FieldByname('CIAID').AsString) +
            ' AND NUMERO =' + QuotedStr(DMTE.cdsDetallePres.FieldByname('NUMERO').AsString) +
            ' AND ITEM = ' + QuotedStr(DMTE.cdsDetallePres.FieldByname('ITEM').AsString);
   DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
   fg_RecuperaDetalle;
End;

Procedure TFPagoDetCab.fg_RecuperaDetalle;
Var
   xsSql: String;
Begin

   xsSQL := 'Select ''6'' TIPDOC_PROV, ' // Tipo de Documento del Proveedor (6 corresponde a RUC)
           +'       nvl(MAEPROV.PROVRUC,''           '') PROVRUC, ' // RUC
           +'       ''                                   '' PROVDES, ' //  -- Nombre o Razón Social del Proveedor
           +'       ''         '' PROFORMA, ' //  Proforma
           +'       nvl(PROVISION.CPTODETRSUNATID,''   '') CPTODETRSUNATID, ' //  Código del Bien o Servicio por el cual se aplica la Detracción
           +'       nvl(CTACTEPROV.CCBCOID,''           '') CCBCOID, ' //  Cuenta Corriente de Depósitos de Detracción del Proveedor en el Banco de la Nación
           +'       LPAD(cast(trunc(nvl(DETPAGO.IMPPAGO,0.00)) as varchar2(13)),13,''0'')||''00'' IMPORTE, ' //-- Importe del Depósito
           +'       nvl(CTACTEPROV.CCBCOID,''           '') CCBCOID, ' // -- Nro Cuenta corriente de Proveedor en Bco Nación
           +'       DETPAGO.IMPPAGO, ' //-- Importe del Depósito
           +'       nvl(PROVISION.TIPOOPERSUNATID,''  '') TIPOOPERSUNATID, ' //-- Tipo de Operación realizada
           +'       nvl(to_char(PROVISION.CPFEMIS,''YYYYMM''),''YYYYMM'') PERIODO_TRIB, ' //-- Periodo Tributario
           +'       ''01'' TIPO_COMPROB, ' // -- Tipo de Comprobante
           +'       LPAD(nvl(DETPAGO.CPSERIE,''''),4,''0'') CPSERIE_TXT, ' // -- Serie de Documento q genera Detracción
           +'       LPAD(nvl(DETPAGO.CPNODOC,''''),8,''0'') CPNODOC_TXT, ' // -- Número de Documento q genera Detracción
           +'       DETPAGO.CPSERIE, ' // -- Serie de Documento q genera Detracción
           +'       DETPAGO.CPNODOC, ' // -- Número de Documento q genera Detracción
           +'       DETPAGO.CIAID, DETPAGO.NUMERO, DETPAGO.ITEM, DETPAGO.CLAUXID, DETPAGO.AUXID, DETPAGO.DOCID, '
           +'       DETPAGO.TMONID, DETPAGO.CPMTOORI, DETPAGO.CPPAGORI, DETPAGO.CPSALORI, '
           +'       DETPAGO.IMPRETE, DETPAGO.FREG, DETPAGO.HREG, DETPAGO.USUARIO, DETPAGO.ESTADO, '
           +'       DETPAGO.IMPDEVO, DETPAGO.RQCIAID, DETPAGO.RQORIGEN, DETPAGO.NUMDETRAC, DETPAGO.NUMCONSTA,DETPAGO.MOD_DETR '
           +'  from CXP_ORD_PAG_DET DETPAGO, '
           +'       TGE201 MAEPROV, '
           +'       CAJA102 CTACTEPROV, '
           +'       CXP_ORD_PAG_CAB CABPAGO, '
           +'       CXP301 PROVISION '
           +' where DETPAGO.CIAID = '+quotedstr(dblcCia.Text)
           +'   and DETPAGO.NUMERO = '+quotedstr(dbeNumero.Text)
           +'   and MAEPROV.CLAUXID = DETPAGO.CLAUXID '
           +'   and MAEPROV.PROV = DETPAGO.AUXID '
           +'   and CTACTEPROV.CIAID(+)=DETPAGO.CIAID '
           +'   and CTACTEPROV.CLAUXID(+)=DETPAGO.CLAUXID '
           +'   and CTACTEPROV.PROV(+)=DETPAGO.AUXID '
           +'   and CTACTEPROV.DETRACCION(+)=''S'' '
           +'   and CABPAGO.CIAID=DETPAGO.CIAID '
           +'   and CABPAGO.NUMERO=DETPAGO.NUMERO '
           +'   and PROVISION.CLAUXID(+) = DETPAGO.CLAUXID '
           +'   and PROVISION.PROV(+) = DETPAGO.AUXID '
           +'   and PROVISION.DOCID(+) = DETPAGO.DOCID '
           +'   and PROVISION.CPSERIE(+) = DETPAGO.CPSERIE '
           +'   and PROVISION.CPNODOC(+) = DETPAGO.CPNODOC '
           +'   and PROVISION.CPESTADO(+)<>''A'' '
           +'   and PROVISION.CPESTADO(+)<>''E'' '
           +'   and PROVISION.CPESTADO(+)<>''I'' '
           +' ORDER BY DETPAGO.Item ';
   DMTE.cdsDetallePres.Close;
   DMTE.cdsDetallePres.DataRequest(xsSql);
   DMTE.cdsDetallePres.Open;
   SumaGrid;

End;

Function TFPagoDetCab.fg_ValidaDatosCNT: Boolean;
Var
   xsSql: String;
Begin
   If dbeNumPla.Text = '' Then
   Begin
      ShowMessage('Debe ingresar el Nº de Planilla');
      Result := False;
      Exit;
   End;
   If dtpFechaCnt.Text = '' Then
   Begin
      ShowMessage('Debe ingresar la Fecha Contable');
      Result := False;
      Exit;
   End;

   xsSql := ' SELECT * FROM CXP_ORD_PAG_DET ' +
            ' WHERE CIAID = ' + QuotedStr(DMTE.cdsDetallePres.FieldByname('CIAID').AsString) +
            ' AND NUMERO =' + QuotedStr(DMTE.cdsDetallePres.FieldByname('NUMERO').AsString) +
            ' AND NVL(NUMCONSTA,' + QuotedStr('X') + ' ) = ' + QuotedStr('X');
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;
   If DMTE.cdsQry.RecordCount > 0 Then
   Begin
      ShowMessage('Existe una ó más Detracciones sin Constancia');
      Result := False;
      Exit;
   End;
   Result := True;
End;

Function TFPagoDetCab.fg_GeneraAsiento: Boolean;
Var
   xsFecAno, xsFecMes, xsFecDia, xsFecDiaSs, xsFecTrim: String;
   xsFecSem, xsFecSs, xsFecAaTri, xsFecAaSem, xsFecAaSs: String;
   xsFecMmSs, xsFecLab: String;
   xsSql: String;
   xsNumComprob: String;
   xsLote: String;
   xsTipoDiario: String;
   xsTipoDiarioDes: String;
   xsGlosa: String;
   xnDiferencia: Double;
   xsMensaje: String;
   xsFechaAsiento: String;
   xsmtoori : Double;
   xsmtoloc : Double;
   xsmtoext : Double;
   xsdebemn : Double;
   xsdebeme : Double;
   xshabemn : Double;
   xshabeme : Double;
   xsitem: Integer;

Begin
   xsTipoDiario := '62';
   xsFechaAsiento := 'TO_DATE(' + QuotedStr(dtpFechaCnt.Text) + ',' + QuotedStr('DD/MM/YYYY') + ')';
   xsGlosa := DMTE.cdsOPago.FieldByname('OBSERVA').AsString + ' NºOPag: ' + dbeNumero.Text;

   //Obteniendo los datos complementarios del asiento contable
   xsSql := 'SELECT * FROM TGE114 WHERE TO_DATE(FECHA, ' + QuotedStr('DD/MM/YYYY') + ') = TO_DATE(' + QuotedStr(dtpFechaCnt.Text) + ',' + QuotedStr('DD/MM/YYYY') + ')';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;

   xsLote := 'DTRC';
   xsFecAno := DMTE.cdsQry.FieldByname('FECANO').AsString;
   xsFecMes := DMTE.cdsQry.FieldByname('FECMES').AsString;
   xsFecDia := DMTE.cdsQry.FieldByname('FECDIA').AsString;
   xsFecDiaSs := DMTE.cdsQry.FieldByname('FECDIASS').AsString;
   xsFecTrim := DMTE.cdsQry.FieldByname('FECTRIM').AsString;
   xsFecSem := DMTE.cdsQry.FieldByname('FECSEM').AsString;
   xsFecSs := DMTE.cdsQry.FieldByname('FECSS').AsString;
   xsFecAaTri := DMTE.cdsQry.FieldByname('FECAATRI').AsString;
   xsFecAaSem := DMTE.cdsQry.FieldByname('FECAASEM').AsString;
   xsFecAaSs := DMTE.cdsQry.FieldByname('FECAASS').AsString;
   xsFecMmSs := DMTE.cdsQry.FieldByname('FECMMSS').AsString;
   xsFecLab := DMTE.cdsQry.FieldByname('FECLAB').AsString;

   //obteniendo el número de comprobante
   xsSql := 'SELECT LPAD( NVL(MAX(TO_NUMBER(CNTCOMPROB)),0) + 1,10,' + QuotedStr('0') + ') NUMCOMPROB' +
            ' FROM CNT300 ' +
            ' WHERE CIAID = ' + QuotedStr(dblcCia.Text) +
            ' AND CNTANOMM = ' + QuotedStr(xsFecAno + xsFecMes) +
            ' AND TDIARID = ' + QuotedStr(xsTipoDiario);
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;
   xsNumComprob := DMTE.cdsQry.FieldByname('NUMCOMPROB').AsString;

   //obteniendo el tipo de cambio
   xsSql := 'TMONID=' + quotedstr(DMTE.wTMonExt)
          + ' AND FECHA=' + DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha, dtpFecha.Date) + ''')';
   xsTipoCambio := DMTE.DisplayDescrip('prvTGE', 'TGE107', 'TMONID, ' + DMTE.wTipoCambioUsar, xsSql, DMTE.wTipoCambioUsar);

   //Obteniendo la descripción del tipo de diario
   xsTipoDiarioDes := DMTE.DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', 'TDIARID = ' + QuotedStr(xsTipoDiario), 'TDIARDES');

   xsSql := 'INSERT INTO CNT300 (CIAID,TDIARID,CNTCOMPROB,CNTANOMM,CNTLOTE,CNTGLOSA,CNTTCAMBIO, '
          + '                    CNTFCOMP,CNTESTADO,CNTCUADRE,CNTFAUTOM,CNTUSER,CNTFREG,CNTHREG, '
          + '                    CNTANO,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS, '
          + '                    TMONID,FLAGVAR,FCONS,CNTFMEC,TDIARDES,CNTDEBEMN,CNTDEBEME,CNTHABEMN, '
          + '                    CNTHABEME,CNTSALDMN,CNTSALDME,CNTTS,DOCMOD,MODULO ) '
          + ' VALUES (' + QuotedStr(dblcCia.text) + ',' + QuotedStr(xsTipoDiario) + ',' + QuotedStr(xsNumComprob) + ','
                        + QuotedStr(xsFecAno + xsFecMes) + ',' + QuotedStr(xsLote) + ',SUBSTR(' + QuotedStr(xsGlosa) + ',1,50),'
                        + xsTipoCambio + ', ' + xsFechaAsiento + ',' + QuotedStr('I') + ',' + QuotedStr('N') + ','
                        + QuotedStr('N') + ',USER,trunc(sysdate),sysdate, '
                        + QuotedStr(xsFecAno) + ',' + QuotedStr(xsFecMes) + ',' + QuotedStr(xsFecDia) + ','
                        + QuotedStr(xsFecTrim) + ',' + QuotedStr(xsFecSem) + ',' + QuotedStr(xsFecSs) + ','
                        + QuotedStr(xsFecAaTri) + ',' + QuotedStr(xsFecAaSem) + ',' + QuotedStr(xsFecAaSs) + ', '
                        + QuotedStr(dblcTMoneda.Text) + ',null,null,null,' + QuotedStr(xsTipoDiarioDes) + ',0,0,0,  '
                        + ' 0,0,0,null,' + QuotedStr('CXP') + ',' + QuotedStr(xModu) + ') ';
   xsMensaje := ' Cia:' + dblcCia.text + ' Nº: ' + xsNumComprob;
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      ShowMessage('Error al intentar añadir el Asiento:'+xsMensaje+' en la Cabecera contable');
      Result := False;
      Exit;
   End;

   xsitem := 1;
   DMTE.cdsDetallePres.first;
   While Not DMTE.cdsDetallePres.Eof Do
   Begin
      xsmtoori := 0;
      xsmtoloc := 0;
      xsmtoext := 0;
      xsdebemn := 0;
      xsdebeme := 0;
      xshabemn := 0;
      xshabeme := 0;

      if DMTE.cdsDetallePres.FieldByName('TMONID').AsString ='N' then
      begin
         xsmtoori := DMTE.cdsDetallePres.FieldByName('CPMTOORI').AsFloat;
         xsmtoloc := DMTE.cdsDetallePres.FieldByName('CPMTOORI').AsFloat;
         xsmtoext := DMTE.FRound((DMTE.cdsDetallePres.FieldByName('CPMTOORI').AsFloat/ strtofloat(xsTipoCambio)),15,2);
      end
      else
      begin
         xsmtoori := DMTE.cdsDetallePres.FieldByName('CPMTOORI').AsFloat;
         xsmtoloc := DMTE.FRound((DMTE.cdsDetallePres.FieldByName('CPMTOORI').AsFloat* strtofloat(xsTipoCambio)),15,2);
         xsmtoext := DMTE.cdsDetallePres.FieldByName('CPMTOORI').AsFloat;

      end;

      if DMTE.cdsDetallePres.FieldByName('MOD_DETR').AsString ='CAJA' then
      Begin
      //obteniendo el número de comprobante DE CAJA
            xsSql := ' SELECT CAJA304.CIAID, CAJA304.TDIARID,CAJA304.ECNOCOMP,CAJA304.ECANOMM,CAJA304.DCLOTE, CAJA304.CUENTAID, CAJA304.CLAUXID,CAJA304.DCAUXID,CAJA304.DOCID,CAJA304.DCSERIE, ' +
                     ' CAJA304.DCNODOC, CAJA304.DCGLOSA,CAJA304.DCDH,CAJA304.CCOSID,CAJA304.DCTCAMPR,CAJA304.DCMTOORI,CAJA304.DCMTOLO,CAJA304.DCMTOEXT,CAJA304.DCFEMIS,CAJA304.DCFVCMTO, ' +
                     ' CAJA304.DCFLACDR,CAJA304.DCUSER,CAJA304.DCANO,CAJA304.DCMM,CAJA304.DCDD,CAJA304.DCAATRI,CAJA304.DCSEM,CAJA304.DCSS,CAJA304.DCTRI,CAJA304.DCAASEM,CAJA304.DCAASS,CAJA304.TMONID, ' +
                     ' CAJA304.FLAGVAR,CAJA304.DOCMOD,CAJA304.NREG,TGE104.TDIARDES,TGE202.CTADES ' +
                     ' FROM CAJA304, CAJA302, TGE104, TGE202 ' +
                     ' WHERE CAJA304.CIAID = CAJA302.CIAID AND CAJA304.TDIARID = CAJA302.TDIARID ' +
                     ' AND CAJA304.ECANOMM = CAJA302.ECANOMM AND CAJA304.ECNOCOMP = CAJA302.ECNOCOMP ' +
                     ' AND CAJA302.ECESTADO IN (''P'',''C'') AND CAJA304.TDIARID = TGE104.TDIARID ' +
                     ' AND CAJA304.CIAID = TGE202.CIAID AND CAJA304.CUENTAID = TGE202.CUENTAID ' +
                     ' AND CAJA302.ECOPAGO = ' + QuotedStr(dbeNumero.Text) + ' AND CAJA304.CUENTAID NOT LIKE (''10401%'') AND CAJA304.CUENTAID NOT LIKE (''769%'') ' +
                     ' AND CAJA304.CUENTAID NOT LIKE (''66909%'') AND CAJA304.CUENTAID NOT LIKE (''776%'') AND CAJA304.CUENTAID NOT LIKE (''976%'') ' +
                     ' AND CAJA304.CLAUXID =' + QuotedStr(DMTE.cdsDetallePres.FieldByName('CLAUXID').AsString) +
                     ' AND CAJA304.DCAUXID =' + QuotedStr(DMTE.cdsDetallePres.FieldByName('AUXID').AsString) +
                     ' AND CAJA304.DOCID =' + QuotedStr(DMTE.cdsDetallePres.FieldByName('DOCID').AsString) +
                     ' AND CAJA304.DCSERIE =' + QuotedStr(DMTE.cdsDetallePres.FieldByName('CPSERIE').AsString) +
                     ' AND CAJA304.DCNODOC =' + QuotedStr(DMTE.cdsDetallePres.FieldByName('CPNODOC').AsString) ;
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest(xsSql);
            DMTE.cdsQry.Open;

            if DMTE.cdsQry.FieldByName('DCDH').AsString ='D' then
            begin
               xsdebemn := xsmtoloc;
               xsdebeme := xsmtoext;
               xshabemn := 0;
               xshabeme := 0;
            end
            else
            begin
               xsdebemn := 0;
               xsdebeme := 0;
               xshabemn := xsmtoloc;
               xshabeme := xsmtoext;

            end;

         // Insertando el detalle del asiento contable
            xsSql := 'INSERT INTO CNT311 (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,CLAUXID,AUXID, '
                   + '                    DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC, '
                   + '                    CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,CNTCUADRE,CNTFAUTOM,CNTUSER, '
                   + '                    CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS, '
                   + '                    TMONID,FLAGVAR,FCONS,CNTFMEC,TDIARDES,CTADES,AUXDES,DOCDES,CCOSDES,CNTDEBEMN, '
                   + '                    CNTDEBEME,CNTHABEMN,CNTHABEME,CNTSALDMN,CNTSALDME,CAMPOVAR,CNTTS,CNTPAGADO, '
                   + '                    CNTMODDOC,CNTREG,MODULO,CTA_SECU) '
                   + ' VALUES ( ' + QuotedStr(DMTE.cdsQry.FieldByName('CIAID').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('TDIARID').AsString) +',' + QuotedStr(xsNumComprob) + ',' + QuotedStr(xsFecAno) + ','
                   + QuotedStr(xsFecAno + xsFecMes) + ','+ QuotedStr(DMTE.cdsQry.FieldByName('DCLOTE').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('CUENTAID').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('CLAUXID').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('DCAUXID').AsString) +', '
                   + QuotedStr(DMTE.cdsQry.FieldByName('DOCID').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('DCSERIE').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('DCNODOC').AsString) +',' + QuotedStr(DMTE.cdsQry.FieldByName('DCGLOSA').AsString) + ','+ QuotedStr(DMTE.cdsQry.FieldByName('DCDH').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('CCOSID').AsString) +','+xsTipoCambio+',' + floattostr(xsmtoori) + ','+ floattostr(xsmtoloc) +', '
                   + floattostr(xsmtoext) +','+ QuotedStr(DMTE.cdsQry.FieldByName('DCFEMIS').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('DCFVCMTO').AsString) +',' + xsFechaAsiento + ',' + QuotedStr('I') + ',' + QuotedStr('N') + ','
                   + QuotedStr('N') + ',USER, TRUNC(SYSDATE) ,SYSDATE,' + QuotedStr(xsFecMes) + ','
                   + QuotedStr(xsFecDia) + ',' + QuotedStr(xsFecTrim) + ',' + QuotedStr(xsFecSem) + ',' + QuotedStr(xsFecSs) + ','
                   + QuotedStr(xsFecAaTri) + ',' + QuotedStr(xsFecAaSem) + ',' + QuotedStr(xsFecAaSs) + ', '
                   + QuotedStr(DMTE.cdsQry.FieldByName('TMONID').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('FLAGVAR').AsString) +',NULL,NULL,'+ QuotedStr(DMTE.cdsQry.FieldByName('TDIARDES').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('CTADES').AsString) +',NULL,NULL,NULL, '
                   + floattostr(xsdebemn) +', '+ floattostr(xsdebeme) +', '+ floattostr(xshabemn) +', '+ floattostr(xshabeme) +', NULL,NULL,NULL,NULL,NULL, '
                   + QuotedStr(DMTE.cdsDetallePres.FieldByName('MOD_DETR').AsString) +','+ inttostr(xsitem) +',''CAJA'',NULL )';
            Try
                DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
            Except
                ShowMessage('Error al intentar añadir el Asiento:'+xsMensaje+' en el Detalle contable desde caja');
                Result := False;
                Exit;
            End;

      END
      ELSE IF DMTE.cdsDetallePres.FieldByName('MOD_DETR').AsString ='TLB' then
      BEGIN
            // INICIO HPC_201702_CAJA CORREGIR CUENTA DE FILIAL
            xsSql := ' SELECT CXP301.CIAID, CXP301.TDIARID, CXP301.CPNOREG, CXP301.CPANOMES, CXP301.DCPLOTE, '
            + '              CASE WHEN CXP301.CIAID =''02'' THEN CXP302.CUENTAID ELSE CAJA103.CTADEBE END CUENTAID, '
            + '              CXP302.CLAUXID,CXP302.DCPAUXID,CXP302.DOCID,CXP302.CPSERIE, CXP302.CPNODOC, substr(TGE201.PROVDES,1,40) PROVDES, '
            + '              ''D'' DCPDH, CXP302.CCOSID, CXP302.CPTCAMPR, CXP_ORD_PAG_DET.CPMTOORI DCPMOORI, CXP_ORD_PAG_DET.CPMTOORI DCPMOLOC, CXP302.DCPMOEXT, '
            + '              CXP302.CPFEMIS, CXP302.CPFVCMTO, CXP302.DCPFLCDR, CXP302.DCPUSER, CXP302.DCPANOC, CXP302.DCPMM, '
            + '              CXP302.DCPDD, CXP302.DCPAATRI, CXP302.DCPSEM, CXP302.DCPSS, CXP302.DCPTRI, CXP302.DCPAASEM, '
            + '              CXP302.DCPAASS,CXP302.TMONID, CXP302.FLAGVAR,''TLB'' DOCMOD, CXP302.DCPREG, TGE104.TDIARDES, '
            + '              TGE202.CTADES, CXP_ORD_PAG_DET.CPMTOORI CNTDEBEMN, CXP302.DCPMOEXT CNTDEBEME, 0 CNTHABEMN, 0 CNTHABEME, '
            + '              ROWNUM CNTREG '
            + '         FROM CXP301, CXP302, TGE104, TGE202, TGE201, CXP_ORD_PAG_DET, CAJA103 '
            + '        WHERE CXP301.CIAID = CXP302.CIAID '
            + '          AND CXP301.TDIARID = CXP302.TDIARID '
            + '          AND CXP301.CPANOMES = CXP302.DCPANOMM '
            + '          AND CXP301.CPNOREG = CXP302.CPNOREG '
            + '          AND CXP_ORD_PAG_DET.DOCID = CXP301.DOCID '
            + '          AND CXP_ORD_PAG_DET.CPSERIE = CXP301.CPSERIE '
            + '          AND CXP_ORD_PAG_DET.CPNODOC = CXP301.CPNODOC '
            + '          AND CXP_ORD_PAG_DET.CLAUXID = CXP301.CLAUXID '
            + '          AND CXP_ORD_PAG_DET.AUXID = CXP301.PROV '
            + '          AND CXP_ORD_PAG_DET.MOD_DETR = ''TLB'' '
            + '          AND CXP301.CPESTADO IN (' + QuotedStr('P') + ',' + QuotedStr('C') + ') '
            + '          AND CXP301.TDIARID = TGE104.TDIARID '
            + '          AND CXP301.CIAID = TGE202.CIAID '
            + '          AND CXP302.DCPAUXID = TGE201.PROV '
            + '          AND CXP302.CLAUXID = TGE201.CLAUXID '
            + '          AND CXP302.CUENTAID = TGE202.CUENTAID '
            + '          AND CXP_ORD_PAG_DET.NUMERO = ' + QuotedStr(dbeNumero.Text)
            + '          AND CXP302.CUENTAID NOT LIKE (' + QuotedStr('10401%') + ') '
            + '          AND CXP302.CUENTAID NOT LIKE (' + QuotedStr('769%') + ') '
            + '          AND CXP302.CUENTAID NOT LIKE (' + QuotedStr('66909%') + ') '
            + '          AND CXP302.CUENTAID NOT LIKE (' + QuotedStr('776%') + ') '
            + '          AND CXP302.CUENTAID NOT LIKE (' + QuotedStr('976%') + ') '
            + '          AND CXP302.TIPDET =''I4'' '
            + '          AND CXP302.CLAUXID =' + QuotedStr(DMTE.cdsDetallePres.FieldByName('CLAUXID').AsString)
            + '          AND CXP302.DCPAUXID =' + QuotedStr(DMTE.cdsDetallePres.FieldByName('AUXID').AsString)
            + '          AND CXP302.DOCID =' + QuotedStr(DMTE.cdsDetallePres.FieldByName('DOCID').AsString)
            + '          AND CXP302.CPSERIE =' + QuotedStr(DMTE.cdsDetallePres.FieldByName('CPSERIE').AsString)
            + '          AND CXP302.CPNODOC =' + QuotedStr(DMTE.cdsDetallePres.FieldByName('CPNODOC').AsString)
            + '          AND CXP302.CIAID=CAJA103.CIAID(+) '
            + '  ORDER BY CIAID, TDIARID, CPNOREG, DCPREG ';
            // FIN   HPC_201702_CAJA CORREGIR CUENTA DE FILIAL
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest(xsSql);
            DMTE.cdsQry.Open;

            if DMTE.cdsQry.FieldByName('DCPDH').AsString ='D' then
            begin
               xsdebemn := xsmtoloc;
               xsdebeme := xsmtoext;
               xshabemn := 0;
               xshabeme := 0;
            end
            else
            begin
               xsdebemn := 0;
               xsdebeme := 0;
               xshabemn := xsmtoloc;
               xshabeme := xsmtoext;

            end;

            xsSql := ' INSERT INTO CNT311 (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,CLAUXID,AUXID, '
            + '                    DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC, '
            + '                    CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,CNTCUADRE,CNTFAUTOM,CNTUSER, '
            + '                    CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS, '
            + '                    TMONID,FLAGVAR,FCONS,CNTFMEC,TDIARDES,CTADES,AUXDES,DOCDES,CCOSDES,CNTDEBEMN, '
            + '                    CNTDEBEME,CNTHABEMN,CNTHABEME,CNTSALDMN,CNTSALDME,CAMPOVAR,CNTTS,CNTPAGADO, '
            + '                    CNTMODDOC,CNTREG,MODULO,CTA_SECU) '
            + ' VALUES ( ''02'',' + QuotedStr(xsTipoDiario) + ',' + QuotedStr(xsNumComprob) + ',' + QuotedStr(xsFecAno) + ','
            + QuotedStr(xsFecAno + xsFecMes) + ','+ QuotedStr(DMTE.cdsQry.FieldByName('DCPLOTE').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('CUENTAID').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('CLAUXID').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('DCPAUXID').AsString) +', '
            + QuotedStr(DMTE.cdsQry.FieldByName('DOCID').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('CPSERIE').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('CPNODOC').AsString) +',' + QuotedStr(DMTE.cdsQry.FieldByName('PROVDES').AsString) + ','+ QuotedStr('D') +','+ QuotedStr(DMTE.cdsQry.FieldByName('CCOSID').AsString) +','+xsTipoCambio+',' + floattostr(xsmtoori) + ','+ floattostr(xsmtoloc) +', '
            + floattostr(xsmtoext) +','+ QuotedStr(DMTE.cdsQry.FieldByName('CPFEMIS').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('CPFVCMTO').AsString) +',' + xsFechaAsiento + ',' + QuotedStr('I') + ',' + QuotedStr('N') + ','
            + QuotedStr('N') + ',USER, TRUNC(SYSDATE) , SYSDATE,' + QuotedStr(xsFecMes) + ','
            + QuotedStr(xsFecDia) + ',' + QuotedStr(xsFecTrim) + ',' + QuotedStr(xsFecSem) + ',' + QuotedStr(xsFecSs) + ','
            + QuotedStr(xsFecAaTri) + ',' + QuotedStr(xsFecAaSem) + ',' + QuotedStr(xsFecAaSs) + ', '
            + QuotedStr('N') +','+ QuotedStr(DMTE.cdsQry.FieldByName('FLAGVAR').AsString) +',NULL,NULL,'+ QuotedStr(DMTE.cdsQry.FieldByName('TDIARDES').AsString) +','+ QuotedStr(DMTE.cdsQry.FieldByName('CTADES').AsString) +',NULL,NULL,NULL, '
            + floattostr(xsdebemn) +', '+ floattostr(xsdebeme) +', '+ floattostr(xshabemn) +', '+ floattostr(xshabeme) +', NULL,NULL,NULL,NULL,NULL, '
            + QuotedStr(DMTE.cdsDetallePres.FieldByName('MOD_DETR').AsString) +','+ inttostr(xsitem) +',''CAJA'',NULL )';

            Try
                DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
            Except
                ShowMessage('Error al intentar añadir el Asiento:'+xsMensaje+' en el Detalle contable desde caja');
                Result := False;
                Exit;
            End;

      END;

      xsitem := xsitem + 1;
      DMTE.cdsDetallePres.Next;

   End;

{
   if DMTE.cdsDetallePres.RecordCount <> 0 then
   Begin
   // Insertando el detalle del asiento contable
      xsSql := 'INSERT INTO CNT311 (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,CLAUXID,AUXID, '
             + '                    DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC, '
             + '                    CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,CNTCUADRE,CNTFAUTOM,CNTUSER, '
             + '                    CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS, '
             + '                    TMONID,FLAGVAR,FCONS,CNTFMEC,TDIARDES,CTADES,AUXDES,DOCDES,CCOSDES,CNTDEBEMN, '
             + '                    CNTDEBEME,CNTHABEMN,CNTHABEME,CNTSALDMN,CNTSALDME,CAMPOVAR,CNTTS,CNTPAGADO, '
             + '                    CNTMODDOC,CNTREG,MODULO,CTA_SECU) '
             + ' SELECT A.CIAID,A.TDIARID,' + QuotedStr(xsNumComprob) + ',' + QuotedStr(xsFecAno) + ','
             + QuotedStr(xsFecAno + xsFecMes) + ',A.DCLOTE,A.CUENTAID,A.CLAUXID,A.DCAUXID, '
             + '        A.DOCID,A.DCSERIE,A.DCNODOC,A.DCGLOSA,A.DCDH,A.CCOSID,A.DCTCAMPR,A.DCMTOORI,A.DCMTOLO, '
             + '        A.DCMTOEXT,A.DCFEMIS,A.DCFVCMTO,' + xsFechaAsiento + ',' + QuotedStr('I') + ',' + QuotedStr('N') + ','
             + QuotedStr('N') + ',USER, ' + xsFechaAsiento + ' ,' + xsFechaAsiento + ',' + QuotedStr(xsFecMes) + ','
             + QuotedStr(xsFecDia) + ',' + QuotedStr(xsFecTrim) + ',' + QuotedStr(xsFecSem) + ',' + QuotedStr(xsFecSs) + ','
             + QuotedStr(xsFecAaTri) + ',' + QuotedStr(xsFecAaSem) + ',' + QuotedStr(xsFecAaSs) + ', '
             + '        A.TMONID,A.FLAGVAR,NULL,NULL,A.TDIARDES,A.CTADES,NULL,NULL,NULL,A.CNTDEBEMN, '
             + '        A.CNTDEBEME, A.CNTHABEMN, A.CNTHABEME, NULL,NULL,NULL,NULL,NULL, '
             + '        A.DOCMOD,A.CNTREG,A.DOCMOD,NULL '
             + '   FROM (SELECT CAJA304.CIAID, CAJA304.TDIARID,CAJA304.ECNOCOMP,CAJA304.ECANOMM,CAJA304.DCLOTE, '
             + '                CAJA304.CUENTAID, CAJA304.CLAUXID,CAJA304.DCAUXID,CAJA304.DOCID,CAJA304.DCSERIE, '
             + '                CAJA304.DCNODOC, CAJA304.DCGLOSA,CAJA304.DCDH,CAJA304.CCOSID,CAJA304.DCTCAMPR, '
             + '                CAJA304.DCMTOORI,CAJA304.DCMTOLO,CAJA304.DCMTOEXT,CAJA304.DCFEMIS,CAJA304.DCFVCMTO, '
             + '                CAJA304.DCFLACDR,CAJA304.DCUSER,CAJA304.DCANO,CAJA304.DCMM,CAJA304.DCDD,CAJA304.DCAATRI, '
             + '                CAJA304.DCSEM,CAJA304.DCSS,CAJA304.DCTRI,CAJA304.DCAASEM,CAJA304.DCAASS,CAJA304.TMONID, '
             + '                CAJA304.FLAGVAR,CAJA304.DOCMOD,CAJA304.NREG,TGE104.TDIARDES,TGE202.CTADES,'
             + '               (CASE WHEN CAJA304.DCDH = ' + QuotedStr('D') + ' THEN CAJA304.DCMTOLO ELSE 0 END ) CNTDEBEMN, '
             + '               (CASE WHEN CAJA304.DCDH = ' + QuotedStr('D') + ' THEN CAJA304.DCMTOEXT ELSE 0 END ) CNTDEBEME, '
             + '               (CASE WHEN CAJA304.DCDH = ' + QuotedStr('H') + ' THEN CAJA304.DCMTOLO ELSE 0 END ) CNTHABEMN, '
             + '               (CASE WHEN CAJA304.DCDH = ' + QuotedStr('H') + ' THEN CAJA304.DCMTOEXT ELSE 0 END ) CNTHABEME, '
             + '                ROWNUM CNTREG '
             + '           FROM CAJA304, CAJA302, TGE104, TGE202 '
             + '          WHERE CAJA304.CIAID = CAJA302.CIAID '
             + '            AND CAJA304.TDIARID = CAJA302.TDIARID '
             + '            AND CAJA304.ECANOMM = CAJA302.ECANOMM '
             + '            AND CAJA304.ECNOCOMP = CAJA302.ECNOCOMP '
             + '            AND CAJA302.ECESTADO IN (' + QuotedStr('P') + ',' + QuotedStr('C') + ') '
             + '            AND CAJA304.TDIARID = TGE104.TDIARID '
             + '            AND CAJA304.CIAID = TGE202.CIAID '
             + '            AND CAJA304.CUENTAID = TGE202.CUENTAID '
 //          + '            AND CAJA302.CIAID = ' + QuotedStr(dblcCia.Text)
             + '            AND CAJA302.ECOPAGO = ' + QuotedStr(dbeNumero.Text)
             + '            AND CAJA304.CUENTAID NOT LIKE (' + QuotedStr('10401%') + ') '
             + '            AND CAJA304.CUENTAID NOT LIKE (' + QuotedStr('769%') + ') '
             + '            AND CAJA304.CUENTAID NOT LIKE (' + QuotedStr('66909%') + ') '
             + '            AND CAJA304.CUENTAID NOT LIKE (' + QuotedStr('776%') + ') '
             + '            AND CAJA304.CUENTAID NOT LIKE (' + QuotedStr('976%') + ') '
// Inicio HPC_201502_CAJA
             // + ' ORDER BY CAJA304.CIAID,CAJA304.TDIARID,CAJA304.ECNOCOMP,CAJA304.NREG ) A ';
             + '        ) A '
             + '  ORDER BY CIAID, TDIARID, ECNOCOMP, NREG ';
// Fin HPC_201502_CAJA
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
      Except
         ShowMessage('Error al intentar añadir el Asiento:'+xsMensaje+' en el Detalle contable desde caja');
         Result := False;
         Exit;
      End;

// Insertando el detalle del asiento contable
      xsSql := ' INSERT INTO CNT311 (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,CLAUXID,AUXID, '
            + '                    DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC, '
            + '                    CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,CNTCUADRE,CNTFAUTOM,CNTUSER, '
            + '                    CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS, '
            + '                    TMONID,FLAGVAR,FCONS,CNTFMEC,TDIARDES,CTADES,AUXDES,DOCDES,CCOSDES,CNTDEBEMN, '
            + '                    CNTDEBEME,CNTHABEMN,CNTHABEME,CNTSALDMN,CNTSALDME,CAMPOVAR,CNTTS,CNTPAGADO, '
            + '                    CNTMODDOC,CNTREG,MODULO,CTA_SECU) '
            + ' SELECT ''02'' CIAID, ' + QuotedStr(xsTipoDiario) + ' TDIARID,' + QuotedStr(xsNumComprob) + ','
            + QuotedStr(xsFecAno) + ',' + QuotedStr(xsFecAno + xsFecMes) + ', A.DCPLOTE, '
            + '       CASE WHEN A.CIAID=''02'' THEN A.CUENTAID ELSE ''166''||A.CIAID END CUENTAID, '
//          + '       A.CUENTAID, '
            + '       A.CLAUXID, A.DCPAUXID, '
            + '       A.DOCID,A.CPSERIE,A.CPNODOC, '
            + '       substr(A.PROVDES,1,40) PROVDES, '
            + '       ''D'' DCPDH,A.CCOSID, ' + QuotedStr(xsTipoCambio) + ' CPTCAMPR, '
            + ' A.DCPMOLOC DCPMOORI, '
            + ' A.DCPMOLOC, '
            + '       A.DCPMOEXT,A.CPFEMIS,A.CPFVCMTO,' + xsFechaAsiento + ',' + QuotedStr('I') + ',' + QuotedStr('N') + ', '
            + QuotedStr('N') + ',USER, ' + xsFechaAsiento + ' ,' + xsFechaAsiento + ',' + QuotedStr(xsFecMes) + ', '
            + QuotedStr(xsFecDia) + ',' + QuotedStr(xsFecTrim) + ',' + QuotedStr(xsFecSem) + ',' + QuotedStr(xsFecSs) + ','
            + QuotedStr(xsFecAaTri) + ',' + QuotedStr(xsFecAaSem) + ',' + QuotedStr(xsFecAaSs) + ', '
            + '       ''N'' TMONID,A.FLAGVAR,NULL,NULL,A.TDIARDES,A.CTADES,NULL,NULL,NULL,A.CNTDEBEMN, '
            + '       A.CNTDEBEME,A.CNTHABEMN,A.CNTHABEME,NULL,NULL,NULL,NULL,NULL, '
            + '       A.DOCMOD,A.CNTREG,A.DOCMOD,NULL '
            + ' FROM (SELECT CXP301.CIAID, CXP301.TDIARID, CXP301.CPNOREG, CXP301.CPANOMES, CXP301.DCPLOTE, CXP302.CUENTAID, '
            + '              CXP302.CLAUXID,CXP302.DCPAUXID,CXP302.DOCID,CXP302.CPSERIE, CXP302.CPNODOC, TGE201.PROVDES, '
            + '              CXP302.DCPDH, CXP302.CCOSID, CXP302.CPTCAMPR, CXP_ORD_PAG_DET.CPMTOORI DCPMOORI, CXP_ORD_PAG_DET.CPMTOORI DCPMOLOC, CXP302.DCPMOEXT, '
            + '              CXP302.CPFEMIS, CXP302.CPFVCMTO, CXP302.DCPFLCDR, CXP302.DCPUSER, CXP302.DCPANOC, CXP302.DCPMM, '
            + '              CXP302.DCPDD, CXP302.DCPAATRI, CXP302.DCPSEM, CXP302.DCPSS, CXP302.DCPTRI, CXP302.DCPAASEM, '
            + '              CXP302.DCPAASS,CXP302.TMONID, CXP302.FLAGVAR,''TLB'' DOCMOD, CXP302.DCPREG, TGE104.TDIARDES, '
            + '              TGE202.CTADES, CXP_ORD_PAG_DET.CPMTOORI CNTDEBEMN, CXP302.DCPMOEXT CNTDEBEME, 0 CNTHABEMN, 0 CNTHABEME, '
            + '              ROWNUM CNTREG '
            + '         FROM CXP301, CXP302, TGE104, TGE202, TGE201, CXP_ORD_PAG_DET '
            + '        WHERE CXP301.CIAID = CXP302.CIAID '
            + '          AND CXP301.TDIARID = CXP302.TDIARID '
            + '          AND CXP301.CPANOMES = CXP302.DCPANOMM '
            + '          AND CXP301.CPNOREG = CXP302.CPNOREG '
            + '          AND CXP_ORD_PAG_DET.DOCID = CXP301.DOCID '
            + '          AND CXP_ORD_PAG_DET.CPSERIE = CXP301.CPSERIE '
            + '          AND CXP_ORD_PAG_DET.CPNODOC = CXP301.CPNODOC '
            + '          AND CXP_ORD_PAG_DET.CLAUXID = CXP301.CLAUXID '
            + '          AND CXP_ORD_PAG_DET.AUXID = CXP301.PROV '
            + '          AND CXP_ORD_PAG_DET.MOD_DETR = ''TLB'' '
            + '          AND CXP301.CPESTADO IN (' + QuotedStr('P') + ',' + QuotedStr('C') + ') '
            + '          AND CXP301.TDIARID = TGE104.TDIARID '
            + '          AND CXP301.CIAID = TGE202.CIAID '
            + '          AND CXP302.DCPAUXID = TGE201.PROV '
            + '          AND CXP302.CLAUXID = TGE201.CLAUXID '
            + '          AND CXP302.CUENTAID = TGE202.CUENTAID '
//          + '          AND CXP_ORD_PAG_DET.CIAID = ' + QuotedStr(dblcCia.Text)
            + '          AND CXP_ORD_PAG_DET.NUMERO = ' + QuotedStr(dbeNumero.Text)
            + '          AND CXP302.CUENTAID NOT LIKE (' + QuotedStr('10401%') + ') '
            + '          AND CXP302.CUENTAID NOT LIKE (' + QuotedStr('769%') + ') '
            + '          AND CXP302.CUENTAID NOT LIKE (' + QuotedStr('66909%') + ') '
            + '          AND CXP302.CUENTAID NOT LIKE (' + QuotedStr('776%') + ') '
            + '          AND CXP302.CUENTAID NOT LIKE (' + QuotedStr('976%') + ') '
            + '          AND CXP302.TIPDET =''I4'' '
// Inicio HPC_201502_CAJA
            // + '        ORDER BY CXP301.CIAID,CXP301.TDIARID,CXP301.CPNOREG,CXP302.DCPREG )  A ';
            + '      )  A '
            + ' ORDER BY CIAID, TDIARID, CPNOREG, DCPREG ';
// Fin HPC_201502_CAJA
//    End;
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
      Except
         ShowMessage('Error al intentar añadir el Asiento:'+xsMensaje+' en el Detalle contable desde Telebanco');
         Result := False;
         Exit;
      End;

   end;
}
   //Insertando el pago
   xgContinuaGrab := True;
   fg_InsertaPago(dblcCia.text, xsTipoDiario, xsFecAno + xsFecMes, xsNumComprob);
   if not xgContinuaGrab then
   begin
      Result := False;
      Exit;
   end;

   //Ajuste por Redondeo
   xnDiferencia := StrToFloat(dbgDetalle.ColumnByName('CPPAGORI').FooterValue);
   If Abs(xnDiferencia) > 0 Then
   Begin
      fg_InsertaAjusteRedondeo(dblcCia.text, xsTipoDiario, xsFecAno + xsFecMes, xsNumComprob);
   End;
   //Actualizando el número de asiento en tablas de caja
   fg_ActualizaNComprob(dblcCia.text, xsTipoDiario, xsFecAno + xsFecMes, dbeNumero.text, xsNumComprob);
   //Genera Asiento en la filial
   If fg_ExisteDocFilial = True Then
   Begin
      fg_GeneraAsientoFilial;
   End;
   ShowMessage(xsMensaje);
   Result := True;
   Exit;
End;

Procedure TFPagoDetCab.fg_ActualizaComprob;
Begin

End;

Procedure TFPagoDetCab.fg_InsertaAjusteRedondeo(wgCompania, wgTipoDiario, wgPeriodo, wgNumero: String);
Var
   xsFecAno, xsFecMes, xsFecDia, xsFecDiaSs, xsFecTrim, xsFecLab: String;
   xsFecSem, xsFecSs, xsFecAaTri, xsFecAaSem, xsFecAaSs, xsFecMmSs: String;
   xsGlosa, xsTipoDiarioDes, xsCuenta, xsCuentaDes: String;
   xsSql: String;
   xsDebeHaber: String;
// Inicio HPC_201701_CAJA Corrección del cálculo del importe pagado
   xnDebe, xnHaber,xnValorDebeME,xnValorHaberME,xnDiferencia: Double;
   xnNumReg: Integer;
   xsFechaAsiento: String;
// Fin    HPC_201701_CAJA Corrección del cálculo del importe pagado
Begin
// Inicio HPC_201701_CAJA Corrección del cálculo del importe pagado
   xsGlosa := 'Ajuste por Redondeo - Detracción';
   xsFechaAsiento := 'TO_DATE(' + QuotedStr(dtpFechaCnt.Text) + ',' + QuotedStr('DD/MM/YYYY') + ')';
   //Obteniendo los datos complementarios del asiento contable
   xsSql := 'SELECT * FROM TGE114 WHERE TO_DATE(FECHA, ' + QuotedStr('DD/MM/YYYY') + ') = TO_DATE(' + QuotedStr(dtpFechaCnt.Text) + ',' + QuotedStr('DD/MM/YYYY') + ')';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;

   xsFecAno := DMTE.cdsQry.FieldByname('FECANO').AsString;
   xsFecMes := DMTE.cdsQry.FieldByname('FECMES').AsString;
   xsFecDia := DMTE.cdsQry.FieldByname('FECDIA').AsString;
   xsFecDiaSs := DMTE.cdsQry.FieldByname('FECDIASS').AsString;
   xsFecTrim := DMTE.cdsQry.FieldByname('FECTRIM').AsString;
   xsFecSem := DMTE.cdsQry.FieldByname('FECSEM').AsString;
   xsFecSs := DMTE.cdsQry.FieldByname('FECSS').AsString;
   xsFecAaTri := DMTE.cdsQry.FieldByname('FECAATRI').AsString;
   xsFecAaSem := DMTE.cdsQry.FieldByname('FECAASEM').AsString;
   xsFecAaSs := DMTE.cdsQry.FieldByname('FECAASS').AsString;
   xsFecMmSs := DMTE.cdsQry.FieldByname('FECMMSS').AsString;
   xsFecLab := DMTE.cdsQry.FieldByname('FECLAB').AsString;

   xnDiferencia := StrToFloat(dbgDetalle.ColumnByName('CPPAGORI').FooterValue);

   If xnDiferencia > 0 Then
   Begin
      xsDebeHaber := 'D';
      xnDebe := Abs(xnDiferencia);
      xnHaber := 0;
      xnValorDebeME:= Abs(xnDiferencia / strtofloat(xsTipoCambio));
      xnValorHaberME:=0;
      xsCuenta := '66909';
   End
   Else
      If xnDiferencia < 0 Then
      Begin
         xsDebeHaber := 'H';
         xnDebe := 0;
         xnValorDebeME:= 0;
         xnValorHaberME:=Abs(xnDiferencia / strtofloat(xsTipoCambio));
         xnHaber := Abs(xnDiferencia);
         xsCuenta := '769';
      End
      Else
         If xnDiferencia = 0 Then
         Begin
            Exit;
         End;
   xnDiferencia := Abs(xnDiferencia);
   //Obteniendo la descripción del tipo de diario
   xsTipoDiarioDes := DMTE.DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', 'TDIARID = ' + QuotedStr(wgTipoDiario), 'TDIARDES');
   //Obteniendo la descripcion de la cuenta
   xsCuentaDes := DMTE.DisplayDescrip('prvTGE', 'TGE202', 'CTADES', 'CIAID = ' + QuotedStr(wgCompania) + ' AND CUENTAID = ' + QuotedStr(xsCuenta), 'CTADES');
   
   //numero de registro
   xsSql := ' SELECT MAX(CNTREG)+1 NUMREG FROM CNT311 ' +
            ' WHERE CIAID = ' + QuotedStr(wgCompania) +
            ' AND TDIARID = ' + QuotedStr(wgTipoDiario) +
            ' AND CNTANOMM = ' + QuotedStr(wgPeriodo) +
            ' AND CNTCOMPROB = ' + QuotedStr(wgNumero);
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;
   xnNumReg := DMTE.cdsQry.FieldByname('NUMREG').AsInteger;

   xsSql := 'INSERT INTO CNT311 (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,CLAUXID,AUXID, '
          + '                    DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC, '
          + '                    CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,CNTCUADRE,CNTFAUTOM,CNTUSER, '
          + '                    CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS, '
          + '                    TMONID,FLAGVAR,FCONS,CNTFMEC,TDIARDES,CTADES,AUXDES,DOCDES,CCOSDES,CNTDEBEMN, '
          + '                    CNTDEBEME,CNTHABEMN,CNTHABEME,CNTSALDMN,CNTSALDME,CAMPOVAR,CNTTS,CNTPAGADO, '
          + '                    CNTMODDOC,CNTREG,MODULO,CTA_SECU) '
          + ' VALUES (' + QuotedStr(wgCompania) + ',' + QuotedStr(wgTipoDiario) + ',' + QuotedStr(wgNumero) + ','
          + QuotedStr(xsFecAno) + ',' + QuotedStr(xsFecAno + xsFecMes) + ',null,' + QuotedStr(xsCuenta) + ','
          + 'null, null, NULL, NULL, NULL, ' + QuotedStr(xsGlosa) + ',' + QuotedStr(xsDebeHaber) + ',NULL,'
          + xsTipoCambio + ',' + FloatToStr(xnDiferencia) + ',' + FloatToStr(xnDiferencia) + ', '
          + FloatToStr(xnDiferencia / strtofloat(xsTipoCambio)) + ',' + xsFechaAsiento + ',' + xsFechaAsiento + ','
          + xsFechaAsiento + ',' + QuotedStr('I') + ',' + QuotedStr('N') + ',' + QuotedStr('N') + ',USER, '
          + ' trunc(SYSDATE),SYSDATE,' + QuotedStr(xsFecMes) + ',' + QuotedStr(xsFecDia) + ',' + QuotedStr(xsFecTrim) + ','
          + QuotedStr(xsFecSem) + ',' + QuotedStr(xsFecSs) + ',' + QuotedStr(xsFecAaTri) + ','
          + QuotedStr(xsFecAaSem) + ',' + QuotedStr(xsFecAaSs) + ', ' + QuotedStr(dblcTMoneda.Text) + ', '
          + 'NULL,NULL,NULL,' + QuotedStr(xsTipoDiarioDes) + ',' + QuotedStr(xsCuentaDes) + ',NULL,NULL,NULL,'
          + FloatToStr(xnDebe) + ', ' + FloatToStr(xnValorDebeME)+ ',' + FloatToStr(xnHaber) + ','+ FloatToStr(xnValorHaberME)+',NULL,NULL,NULL,NULL,NULL, '
          + 'NULL,' + FloatToStr(xnNumReg) + ',' + QuotedStr(xModu) + ',NULL  )';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      showMessage('Error al intentar grabar detalle contable para ajustar redondeo');
      xgContinuaGrab := False;
      Exit;
   End;
// Fin HPC_201701_CAJA Corrección del cálculo del importe pagado
End;

Procedure TFPagoDetCab.fg_InsertaPago(wgCompania, wgTipoDiario, wgPeriodo, wgNumero: String);
Var
   xsFecAno, xsFecMes, xsFecDia, xsFecDiaSs, xsFecTrim, xsFecLab: String;
   xsFecSem, xsFecSs, xsFecAaTri, xsFecAaSem, xsFecAaSs, xsFecMmSs: String;
   xsGlosa, xsTipoDiarioDes, xsCuenta, xsCuentaDes: String;
   xsSql,xsSql1: String;
   xsDebeHaber: String;
   xnHaberMN, xnHaberME: Double;
   xnNumReg: Integer;
   xsFechaAsiento: String;

Begin
   xsGlosa := 'Pago de Detraccion';
   xsFechaAsiento := 'TO_DATE(' + QuotedStr(dtpFechaCnt.Text) + ',' + QuotedStr('DD/MM/YYYY') + ')';
   //Obteniendo los datos complementarios del asiento contable
   xsSql := 'SELECT * FROM TGE114 WHERE TO_DATE(FECHA, ' + QuotedStr('DD/MM/YYYY') + ') = TO_DATE(' + QuotedStr(dtpFechaCnt.Text) + ',' + QuotedStr('DD/MM/YYYY') + ')';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;

   xsFecAno := DMTE.cdsQry.FieldByname('FECANO').AsString;
   xsFecMes := DMTE.cdsQry.FieldByname('FECMES').AsString;
   xsFecDia := DMTE.cdsQry.FieldByname('FECDIA').AsString;
   xsFecDiaSs := DMTE.cdsQry.FieldByname('FECDIASS').AsString;
   xsFecTrim := DMTE.cdsQry.FieldByname('FECTRIM').AsString;
   xsFecSem := DMTE.cdsQry.FieldByname('FECSEM').AsString;
   xsFecSs := DMTE.cdsQry.FieldByname('FECSS').AsString;
   xsFecAaTri := DMTE.cdsQry.FieldByname('FECAATRI').AsString;
   xsFecAaSem := DMTE.cdsQry.FieldByname('FECAASEM').AsString;
   xsFecAaSs := DMTE.cdsQry.FieldByname('FECAASS').AsString;
   xsFecMmSs := DMTE.cdsQry.FieldByname('FECMMSS').AsString;
   xsFecLab := DMTE.cdsQry.FieldByname('FECLAB').AsString;

   // Obteniendo el importe del pago
      xsSql := ' Select nvl(sum(case when CAJA304.DCDH = ' + QuotedStr('D') + ' then CAJA304.DCMTOLO else 0 end ),0) CNTDEBEMN, '
             + '        nvl(sum(case when CAJA304.DCDH = ' + QuotedStr('D') + ' then CAJA304.DCMTOEXT else 0 end ),0) CNTDEBEME, '
             + '        nvl(sum(case when CAJA304.DCDH = ' + QuotedStr('H') + ' then CAJA304.DCMTOLO else 0 end ),0) CNTHABEMN, '
             + '        nvl(sum(case when CAJA304.DCDH = ' + QuotedStr('H') + ' then CAJA304.DCMTOEXT else 0 end ),0) CNTHABEME '
             + '   from CAJA304, CAJA302, TGE104, TGE202 '
             + '  where CAJA304.CIAID = CAJA302.CIAID '
             + '    and CAJA304.TDIARID = CAJA302.TDIARID '
             + '    and CAJA304.ECANOMM = CAJA302.ECANOMM '
             + '    and CAJA304.ECNOCOMP = CAJA302.ECNOCOMP '
             + '    and CAJA302.ECESTADO IN (' + QuotedStr('P') + ',' + QuotedStr('C') + ') '
             + '    and CAJA304.TDIARID = TGE104.TDIARID '
             + '    and CAJA304.CIAID = TGE202.CIAID '
             + '    and CAJA304.CUENTAID = TGE202.CUENTAID '
             + '    and CAJA302.CIAID = ' + QuotedStr(dblcCia.Text)
             + '    and CAJA302.ECOPAGO = ' + QuotedStr(dbeNumero.Text)
             + '    and CAJA304.CUENTAID LIKE (' + QuotedStr('10401%') + ') ';
   DMTE.cdsQry3.Close;
   DMTE.cdsQry3.DataRequest(xsSql);
   DMTE.cdsQry3.Open;

     xsSql1 := ' Select nvl(SUM(CASE WHEN CXP302.DCPDH = ' + QuotedStr('D') + ' THEN CXP_ORD_PAG_DET.IMPPAGO ELSE 0 END ),0) CNTDEBEMN, '
             + '        nvl(SUM(CASE WHEN CXP302.DCPDH = ' + QuotedStr('D') + ' THEN CXP302.DCPMOEXT ELSE 0 END ),0) CNTDEBEME, '
             + '        nvl(SUM(CASE WHEN CXP302.DCPDH = ' + QuotedStr('H') + ' THEN CXP_ORD_PAG_DET.IMPPAGO ELSE 0 END ),0) CNTHABEMN, '
             + '        nvl(SUM(CASE WHEN CXP302.DCPDH = ' + QuotedStr('H') + ' THEN CXP302.DCPMOEXT ELSE 0 END ),0) CNTHABEME  '
             + '   from CXP301, CXP302, TGE104, TGE202,CXP_ORD_PAG_DET  '
             + '  where CXP301.CIAID = CXP302.CIAID  '
             + '    and CXP301.TDIARID = CXP302.TDIARID '
             + '    and CXP301.CPANOMES = CXP302.DCPANOMM '
             + '    and CXP301.CPNOREG = CXP302.CPNOREG '
             + '    and CXP_ORD_PAG_DET.DOCID = CXP301.DOCID '
             + '    and CXP_ORD_PAG_DET.CPSERIE = CXP301.CPSERIE '
             + '    and CXP_ORD_PAG_DET.CPNODOC = CXP301.CPNODOC '
             + '    and CXP_ORD_PAG_DET.CLAUXID = CXP301.CLAUXID '
             + '    and CXP_ORD_PAG_DET.AUXID = CXP301.PROV '
             + '    and CXP301.CPESTADO IN (' + QuotedStr('P') + ',' + QuotedStr('C') + ') '
             + '    and CXP301.TDIARID = TGE104.TDIARID '
             + '    and CXP301.CIAID = TGE202.CIAID '
             + '    and CXP302.CUENTAID = TGE202.CUENTAID '
//           + '    and CXP301.CIAID = ' + QuotedStr(dblcCia.Text)
             + '    and CXP_ORD_PAG_DET.MOD_DETR = ''TLB'' '
             + '    and CXP_ORD_PAG_DET.NUMERO = ' + QuotedStr(dbeNumero.Text)
             + '    and CXP302.CUENTAID NOT LIKE (' + QuotedStr('10401%') + ') '
             + '    and CXP302.CUENTAID NOT LIKE (' + QuotedStr('769%') + ') '
             + '    and CXP302.CUENTAID NOT LIKE (' + QuotedStr('66909%') + ') '
             + '    and CXP302.TIPDET =''I4'' '
             + '  order by CXP301.CIAID,CXP301.TDIARID,CXP301.CPNOREG,CXP302.DCPREG ';

   DMTE.cdsQry2.Close;
   DMTE.cdsQry2.DataRequest(xsSql1);
   DMTE.cdsQry2.Open;

   xsDebeHaber := 'H';
   xnHaberMN := DMTE.cdsQry3.FieldByname('CNTHABEMN').Asfloat
               +DMTE.cdsQry2.FieldByname('CNTHABEMN').Asfloat;

   xnHaberME := DMTE.cdsQry3.FieldByname('CNTHABEME').Asfloat
               +DMTE.cdsQry2.FieldByname('CNTHABEME').Asfloat;

// xnHaber := 0;
   xsCuenta := '104010304';

   //Obteniendo la descripción del tipo de diario
   xsTipoDiarioDes := DMTE.DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', 'TDIARID = ' + QuotedStr(wgTipoDiario), 'TDIARDES');
   //Obteniendo la descripcion de la cuenta
   xsCuentaDes := DMTE.DisplayDescrip('prvTGE', 'TGE202', 'CTADES', 'CIAID = ' + QuotedStr(wgCompania) + ' AND CUENTAID = ' + QuotedStr(xsCuenta), 'CTADES');

   //numero de registro
   xsSql := ' SELECT MAX(CNTREG)+1 NUMREG FROM CNT311 ' +
            ' WHERE CIAID = ' + QuotedStr(wgCompania) +
            ' AND TDIARID = ' + QuotedStr(wgTipoDiario) +
            ' AND CNTANOMM = ' + QuotedStr(wgPeriodo) +
            ' AND CNTCOMPROB = ' + QuotedStr(wgNumero);
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;
   xnNumReg := DMTE.cdsQry.FieldByname('NUMREG').AsInteger;
// Inicio HPC_201310_CAJA
   xsSql := 'INSERT INTO CNT311 (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,CLAUXID,AUXID, '
          + '                    DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC, '
          + '                    CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,CNTCUADRE,CNTFAUTOM,CNTUSER, '
          + '                    CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS, '
          + '                    TMONID,FLAGVAR,FCONS,CNTFMEC,TDIARDES,CTADES,AUXDES,DOCDES,CCOSDES,CNTDEBEMN, '
          + '                    CNTDEBEME,CNTHABEMN,CNTHABEME,CNTSALDMN,CNTSALDME,CAMPOVAR,CNTTS,CNTPAGADO, '
          + '                    CNTMODDOC,CNTREG,MODULO,CTA_SECU) '
          + ' VALUES (' + QuotedStr(wgCompania) + ',' + QuotedStr(wgTipoDiario) + ',' + QuotedStr(wgNumero) + ','
          + QuotedStr(xsFecAno) + ',' + QuotedStr(xsFecAno + xsFecMes) + ',null,' + QuotedStr(xsCuenta) + ', '
          + 'null,null, NULL,' + QuotedStr('OP') + ',' + QuotedStr(dbeNumPla.Text) + ',' + QuotedStr(xsGlosa) + ','
          + QuotedStr(xsDebeHaber) + ',NULL,' + xsTipoCambio + ',' + floattostr(xnHaberMN) + ','
          + FloatToStr(xnHaberMN) + ', ' + FloatToStr(xnHaberMN / StrTofloat(xsTipoCambio)) + ', ' + xsFechaAsiento + ','
          + xsFechaAsiento + ',' + xsFechaAsiento + ',' + QuotedStr('I') + ',' + QuotedStr('N') + ',' + QuotedStr('N') + ', '
          + 'USER, SYSDATE, SYSDATE,' + QuotedStr(xsFecMes) + ',' + QuotedStr(xsFecDia) + ',' + QuotedStr(xsFecTrim) + ','
          + QuotedStr(xsFecSem) + ',' + QuotedStr(xsFecSs) + ',' + QuotedStr(xsFecAaTri) + ',' + QuotedStr(xsFecAaSem) + ','
          + QuotedStr(xsFecAaSs) + ', ' + QuotedStr(dblcTMoneda.Text) + ',NULL,NULL,NULL,' + QuotedStr(xsTipoDiarioDes) + ','
          + QuotedStr(xsCuentaDes) + ',NULL,NULL,NULL,0, 0,' + FloatToStr(xnHaberMN) + ','
          + FloatToStr(xnHaberMN / StrTofloat(xsTipoCambio)) + ',NULL,NULL,NULL,NULL,NULL, '
          + ' NULL,' + FloatToStr(xnNumReg) + ',' + QuotedStr(xModu) + ',NULL  )';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
   Except
      showMessage('Error al insertar Detalle Contable por Pago de Detracciones');
      xgContinuaGrab := False;
      Exit;
   End;
End;

Procedure TFPagoDetCab.fg_GeneraAsientoFilial;
Var
   xsSql: String;
   xsFecAno, xsFecMes, xsFecDia, xsFecDiaSs, xsFecTrim, xsFecLab: String;
   xsFecSem, xsFecSs, xsFecAaTri, xsFecAaSem, xsFecAaSs, xsFecMmSs: String;
   xsClauxid, xsProv, xsDocId, xsSerie, xsNoDoc: String;
   xsLote: String;
   xsCiaPago, xsPeriodo, xsEcnoComp, xsCiaFilial, xsTipoDiario: String;
   xsTipoDiarioDes, xsNumComprob, xsGlosa: String;
   xnImpDetraccion, xnImpDetraccionME: Double;
   xnDebeNM, xnHaberMN, xnDebeME, xnHaberME: Double;
   xnRegistro: Integer;
   xsCuenta, xsDebeHaber, xsCuentaDes: String;
   xsMensaje: String;
   xsNumRegistro: String;
   xsFechaAsiento: String;
Begin
   xsFechaAsiento := 'TO_DATE(' + QuotedStr(dtpFechaCnt.Text) + ',' + QuotedStr('DD/MM/YYYY') + ')';
   //Obteniendo los datos complementarios del asiento contable
   xsSql := 'SELECT * FROM TGE114 WHERE TO_DATE(FECHA, ' + QuotedStr('DD/MM/YYYY') + ') = TO_DATE(' + QuotedStr(dtpFechaCnt.Text) + ',' + QuotedStr('DD/MM/YYYY') + ')';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;

   xsLote := 'DTRC';
   xsMensaje := '';
   xsGlosa := DBMemo.Text + 'Nº OP:' + dbeNumero.Text;
   xsFecAno := DMTE.cdsQry.FieldByname('FECANO').AsString;
   xsFecMes := DMTE.cdsQry.FieldByname('FECMES').AsString;
   xsFecDia := DMTE.cdsQry.FieldByname('FECDIA').AsString;
   xsFecDiaSs := DMTE.cdsQry.FieldByname('FECDIASS').AsString;
   xsFecTrim := DMTE.cdsQry.FieldByname('FECTRIM').AsString;
   xsFecSem := DMTE.cdsQry.FieldByname('FECSEM').AsString;
   xsFecSs := DMTE.cdsQry.FieldByname('FECSS').AsString;
   xsFecAaTri := DMTE.cdsQry.FieldByname('FECAATRI').AsString;
   xsFecAaSem := DMTE.cdsQry.FieldByname('FECAASEM').AsString;
   xsFecAaSs := DMTE.cdsQry.FieldByname('FECAASS').AsString;
   xsFecMmSs := DMTE.cdsQry.FieldByname('FECMMSS').AsString;
   xsFecLab := DMTE.cdsQry.FieldByname('FECLAB').AsString;

   DMTE.cdsDetallePres.First;
   While Not DMTE.cdsDetallePres.Eof Do
   Begin
      xsClauxid := DMTE.cdsDetallePres.FieldByname('CLAUXID').AsString;
      xsProv := DMTE.cdsDetallePres.FieldByname('AUXID').AsString;
      xsDocId := DMTE.cdsDetallePres.FieldByname('DOCID').AsString;
      xsSerie := DMTE.cdsDetallePres.FieldByname('CPSERIE').AsString;
      xsNoDoc := DMTE.cdsDetallePres.FieldByname('CPNODOC').AsString;

      //Verificamos si el documento fue provisionado en otra Cia

      xsSql := ' SELECT * FROM CXP301 WHERE CLAUXID = ' + QuotedStr(xsClauxid) +
               ' AND PROV = ' + QuotedStr(xsProv) +
               ' AND DOCID = ' + QuotedStr(xsDocId) +
               ' AND CPSERIE = ' + QuotedStr(xsSerie) +
               ' AND CPNODOC = ' + QuotedStr(xsNoDoc) +
               ' AND CPESTADO IN (' + QuotedStr('P') + ',' + QuotedStr('C') + ')' +
               ' AND CIAID <> ' + QuotedStr('02');
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest(xsSql);
      DMTE.cdsQry.Open;
      If DMTE.cdsQry.RecordCount > 0 Then // el documento E a otra empresa
      Begin
         xsNumRegistro := DMTE.cdsQry.FieldByname('CPNOREG').AsString;

         //datos pago
         xsCiaPago := DMTE.cdsDetallePres.FieldByname('CIAID').AsString;

         xsPeriodo := xsFecAno + xsFecMes;

         xnImpDetraccion := DMTE.cdsDetallePres.FieldByname('CPSALORI').AsFloat;

         xsCiaFilial := DMTE.cdsQry.FieldByname('CIAID').AsString;

         xsTipoDiario := '62';
         //Obteniendo la descripción del tipo de diario
         xsTipoDiarioDes := DMTE.DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', 'TDIARID = ' + QuotedStr(xsTipoDiario), 'TDIARDES');

         //obteniendo el número de comprobante
         xsSql := 'SELECT LPAD( NVL(MAX(TO_NUMBER(CNTCOMPROB)),0) + 1,10,' + QuotedStr('0') + ') NUMCOMPROB' +
                  ' FROM CNT300 ' +
                  ' WHERE CIAID = ' + QuotedStr(xsCiaFilial) +
                  ' AND CNTANOMM = ' + QuotedStr(xsFecAno + xsFecMes) +
                  ' AND TDIARID = ' + QuotedStr(xsTipoDiario);
         DMTE.cdsQry.Close;
         DMTE.cdsQry.DataRequest(xsSql);
         DMTE.cdsQry.Open;
         xsNumComprob := DMTE.cdsQry.FieldByname('NUMCOMPROB').AsString;

         //Insertando la cabecera del asiento contable
         xsSql := 'INSERT INTO CNT300 (CIAID,TDIARID,CNTCOMPROB,CNTANOMM,CNTLOTE,CNTGLOSA,CNTTCAMBIO, ' +
                  ' CNTFCOMP,CNTESTADO,CNTCUADRE,CNTFAUTOM,CNTUSER,CNTFREG,CNTHREG, ' +
                  ' CNTANO,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS, ' +
                  ' TMONID,FLAGVAR,FCONS,CNTFMEC,TDIARDES,CNTDEBEMN,CNTDEBEME,CNTHABEMN, ' +
                  ' CNTHABEME,CNTSALDMN,CNTSALDME,CNTTS,DOCMOD,MODULO ) ' +
                  ' VALUES (' + QuotedStr(xsCiaFilial) + ',' + QuotedStr(xsTipoDiario) + ',' + QuotedStr(xsNumComprob) + ',' + QuotedStr(xsFecAno + xsFecMes) + ',' + QuotedStr(xsLote) + ',SUBSTR(' + QuotedStr(xsGlosa) + ',1,50),' + xsTipoCambio + ', ' +
                  xsFechaAsiento + ' ,' + QuotedStr('I') + ',' + QuotedStr('N') + ',' + QuotedStr('N') + ',USER,sysdate,sysdate, ' +
                  QuotedStr(xsFecAno) + ',' + QuotedStr(xsFecMes) + ',' + QuotedStr(xsFecDia) + ',' + QuotedStr(xsFecTrim) + ',' + QuotedStr(xsFecSem) + ',' + QuotedStr(xsFecSs) + ',' + QuotedStr(xsFecAaTri) + ',' + QuotedStr(xsFecAaSem) + ',' + QuotedStr(xsFecAaSs) + ', ' +
                  QuotedStr(dblcTMoneda.Text) + ',null,null,null,' + QuotedStr(xsTipoDiarioDes) + ',0,0,0,  ' +
                  ' 0,0,0,null,' + QuotedStr('CXP') + ',' + QuotedStr(xModu) + ') ';
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
         Except
            showMessage('Error al insertar Cabecera Contable por Pago de Detracciones en filial');
            xgContinuaGrab := False;
            Exit;
         End;
         //----------primera línea-------------//
         xnImpDetraccionME := DMTE.Fround(xnImpDetraccion / StrToFloat(xsTipoCambio), 15, 3);
         //insertando el detalle del asiento contable
         xnDebeNM := xnImpDetraccion;
         xnHaberMN := 0;
         xnDebeME := xnImpDetraccionME;
         xnHaberME := 0;
         xsCuenta := fg_ObtieneCtaProvision(xsClauxid, xsProv, xsDocId, xsSerie, xsNoDoc, xsNumRegistro);
         xsDebeHaber := 'D';
         xnRegistro := 1;

         //Obteniendo la descripcion de la cuenta
         xsCuentaDes := DMTE.DisplayDescrip('prvTGE', 'TGE202', 'CTADES', 'CIAID = ' + QuotedStr(xsCiaFilial) + ' AND CUENTAID = ' + QuotedStr(xsCuenta), 'CTADES');

         xsSql := 'INSERT INTO CNT311 (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,CLAUXID,AUXID, ' +
                  ' DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC, ' +
                  ' CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,CNTCUADRE,CNTFAUTOM,CNTUSER, ' +
                  ' CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS, ' +
                  ' TMONID,FLAGVAR,FCONS,CNTFMEC,TDIARDES,CTADES,AUXDES,DOCDES,CCOSDES,CNTDEBEMN, ' +
                  ' CNTDEBEME,CNTHABEMN,CNTHABEME,CNTSALDMN,CNTSALDME,CAMPOVAR,CNTTS,CNTPAGADO, ' +
                  ' CNTMODDOC,CNTREG,MODULO,CTA_SECU) ' +
                  ' VALUES ( ' + QuotedStr(xsCiaFilial) + ',' + QuotedStr(xsTipoDiario) + ',' + QuotedStr(xsNumComprob) + ',' + QuotedStr(xsFecAno) + ',' + QuotedStr(xsFecAno + xsFecMes) + ',' + QuotedStr(xsLote) + ',' + QuotedStr(xsCuenta) + ',' + QuotedStr(xsClauxid) + ',' + QuotedStr(xsProv) + ', ' +
                  QuotedStr(xsDocId) + ',' + QuotedStr(xsSerie) + ',' + QuotedStr(xsNoDoc) + ',SUBSTR(' + QuotedStr(xsGlosa) + ',1,40),' + QuotedStr(xsDebeHaber) + ',NULL,' + xsTipoCambio + ',' + FloatToStr(xnImpDetraccion) + ',' + FloatToStr(xnImpDetraccion) + ', ' +
                  FloatToStr(xnImpDetraccionME) + ' ,' + xsFechaAsiento + ',' + xsFechaAsiento + ',' + xsFechaAsiento + ',' + QuotedStr('I') + ',' + QuotedStr('N') + ',' + QuotedStr('N') + ',USER, ' +
                  ' SYSDATE,SYSDATE,' + QuotedStr(xsFecMes) + ',' + QuotedStr(xsFecDia) + ',' + QuotedStr(xsFecTrim) + ',' + QuotedStr(xsFecSem) + ',' + QuotedStr(xsFecSs) + ',' + QuotedStr(xsFecAaTri) + ',' + QuotedStr(xsFecAaSem) + ',' + QuotedStr(xsFecAaSs) + ',  ' +
                  QuotedStr(dblcTMoneda.Text) + ',NULL,NULL,NULL,' + QuotedStr(xsTipoDiarioDes) + ',' + Quotedstr(xsCuentaDes) + ',NULL,NULL,NULL,' + FloatToStr(xnDebeNM) + ', ' +
                  FloatToStr(xnDebeME) + ',' + FloatToStr(xnHaberMN) + ',' + FloatToStr(xnHaberME) + ',NULL,NULL,NULL,NULL,NULL, ' +
                  QuotedStr('CAJA') + ',' + IntToStr(xnRegistro) + ',' + QuotedStr(xModu) + ',NULL )';
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
         Except
            showMessage('Error al insertar Detalle Contable por Pago de Detracciones en filial');
            xgContinuaGrab := False;
            Exit;
         End;
         //----------segunda línea-------------//
         xnImpDetraccionME := DMTE.Fround(xnImpDetraccion / StrToFloat(xsTipoCambio), 15, 3);
         //insertando el detalle del asiento contable
         xnDebeNM := 0;
         xnHaberMN := xnImpDetraccion;
         xnDebeME := 0;
         xnHaberME := xnImpDetraccionME;
         xsCuenta := '46602';
         xsDebeHaber := 'H';
         xnRegistro := 2;

            //Obteniendo la descripcion de la cuenta
         xsCuentaDes := DMTE.DisplayDescrip('prvTGE', 'TGE202', 'CTADES', 'CIAID = ' + QuotedStr(xsCiaFilial) + ' AND CUENTAID = ' + QuotedStr(xsCuenta), 'CTADES');

         xsSql := 'INSERT INTO CNT311 (CIAID,TDIARID,CNTCOMPROB,CNTANO,CNTANOMM,CNTLOTE,CUENTAID,CLAUXID,AUXID, ' +
                  ' DOCID,CNTSERIE,CNTNODOC,CNTGLOSA,CNTDH,CCOSID,CNTTCAMBIO,CNTMTOORI,CNTMTOLOC, ' +
                  ' CNTMTOEXT,CNTFEMIS,CNTFVCMTO,CNTFCOMP,CNTESTADO,CNTCUADRE,CNTFAUTOM,CNTUSER, ' +
                  ' CNTFREG,CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTAATRI,CNTAASEM,CNTAASS, ' +
                  ' TMONID,FLAGVAR,FCONS,CNTFMEC,TDIARDES,CTADES,AUXDES,DOCDES,CCOSDES,CNTDEBEMN, ' +
                  ' CNTDEBEME,CNTHABEMN,CNTHABEME,CNTSALDMN,CNTSALDME,CAMPOVAR,CNTTS,CNTPAGADO, ' +
                  ' CNTMODDOC,CNTREG,MODULO,CTA_SECU) ' +
                  ' VALUES ( ' + QuotedStr(xsCiaFilial) + ',' + QuotedStr(xsTipoDiario) + ',' + QuotedStr(xsNumComprob) + ',' + QuotedStr(xsFecAno) + ',' + QuotedStr(xsFecAno + xsFecMes) + ',' + QuotedStr(xsLote) + ',' + QuotedStr(xsCuenta) + ',' + QuotedStr(xsClauxid) + ',' + QuotedStr(xsProv) + ', ' +
                  QuotedStr(xsDocId) + ',' + QuotedStr(xsSerie) + ',' + QuotedStr(xsNoDoc) + ',SUBSTR(' + QuotedStr(xsGlosa) + ',1,40),' + QuotedStr(xsDebeHaber) + ',NULL,' + xsTipoCambio + ',' + FloatToStr(xnImpDetraccion) + ',' + FloatToStr(xnImpDetraccion) + ', ' +
                  FloatToStr(xnImpDetraccionME) + ' ,' + xsFechaAsiento + ',' + xsFechaAsiento + ',' + xsFechaAsiento + ',' + QuotedStr('I') + ',' + QuotedStr('N') + ',' + QuotedStr('N') + ',USER, ' +
                  ' SYSDATE,SYSDATE,' + QuotedStr(xsFecMes) + ',' + QuotedStr(xsFecDia) + ',' + QuotedStr(xsFecTrim) + ',' + QuotedStr(xsFecSem) + ',' + QuotedStr(xsFecSs) + ',' + QuotedStr(xsFecAaTri) + ',' + QuotedStr(xsFecAaSem) + ',' + QuotedStr(xsFecAaSs) + ',  ' +
                  QuotedStr(dblcTMoneda.Text) + ',NULL,NULL,NULL,' + QuotedStr(xsTipoDiarioDes) + ',' + Quotedstr(xsCuentaDes) + ',NULL,NULL,NULL,' + FloatToStr(xnDebeNM) + ', ' +
                  FloatToStr(xnDebeME) + ',' + FloatToStr(xnHaberMN) + ',' + FloatToStr(xnHaberME) + ',NULL,NULL,NULL,NULL,NULL, ' +
                  QuotedStr('CAJA') + ',' + IntToStr(xnRegistro) + ',' + QuotedStr(xModu) + ',NULL )';
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
            xsMensaje := xsMensaje + 'Cia:' + xsCiaFilial + ' nº: ' + xsNumComprob + #13;
         Except
            showMessage('Error al insertar Detalle Contable 2 por Pago de Detracciones en filial');
            xgContinuaGrab := False;
            Exit;
         End;

      End;
      DMTE.cdsDetallePres.Next;
   End;
   Showmessage(xsMensaje);
End;

Function TFPagoDetCab.fg_ExisteDocFilial: Boolean;
Var
   xsSql: String;
   xsClauxid, xsProv, xsDocId, xsSerie, xsNoDoc: String;
   xbDocFilial: Boolean;
Begin
   xbDocFilial := False;
   DMTE.cdsDetallePres.First;
   While Not DMTE.cdsDetallePres.Eof Do
   Begin
      xsClauxid := DMTE.cdsDetallePres.FieldByname('CLAUXID').AsString;
      xsProv := DMTE.cdsDetallePres.FieldByname('AUXID').AsString;
      xsDocId := DMTE.cdsDetallePres.FieldByname('DOCID').AsString;
      xsSerie := DMTE.cdsDetallePres.FieldByname('CPSERIE').AsString;
      xsNoDoc := DMTE.cdsDetallePres.FieldByname('CPNODOC').AsString;
      xsSql := ' SELECT * FROM CXP301 WHERE CLAUXID = ' + QuotedStr(xsClauxid) +
               ' AND PROV = ' + QuotedStr(xsProv) +
               ' AND DOCID = ' + QuotedStr(xsDocId) +
               ' AND CPSERIE = ' + QuotedStr(xsSerie) +
               ' AND CPNODOC = ' + QuotedStr(xsNoDoc) +
               ' AND CPESTADO IN (' + QuotedStr('P') + ',' + QuotedStr('C') + ')' +
               ' AND CIAID <> ' + QuotedStr('02');
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest(xsSql);
      DMTE.cdsQry.Open;
      If DMTE.cdsQry.RecordCount > 0 Then // el documento E a otra empresa
      Begin
         xbDocFilial := True;
      End;
      DMTE.cdsDetallePres.Next;
   End;
   Result := xbDocFilial;
   Exit;
End;
//Actualiza el número de asiento contable en las tablas de caja

Procedure TFPagoDetCab.fg_ActualizaNComprob(wgCompania, wgTDiario, wgPeriodo, wgPago, wgNumero: String);
Var
   xsSql: String;
Begin
   If xModu = 'CAJA' Then
   Begin
      xsSql := ' UPDATE CAJA302 SET CNTCOMPROB = ' + QuotedStr(wgNumero)
             + '  WHERE CIAID = ' + QuotedStr(wgCompania)
             + '    AND TDIARID = ' + QuotedStr(wgTDiario)
             + '    AND ECANOMM = ' + QuotedStr(wgPeriodo)
             + '    AND ECOPAGO = ' + QuotedStr(wgPago);
      try
         DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
      except
         ShowMessage('Error al intentar grabar Nro.Comprobante en CAJA302');
         xgContinuaGrab := False;
         exit;
      end;
      xsSql := ' UPDATE CAJA303 SET CNTCOMPROB = ' + QuotedStr(wgNumero)
             + '  WHERE  EXISTS (SELECT 1 FROM CAJA302 '
             + '                  WHERE CAJA302.CIAID = CAJA303.CIAID'
             + '                    AND CAJA302.TDIARID = CAJA303.TDIARID '
             + '                    AND CAJA302.ECANOMM = CAJA303.ECANOMM '
             + '                    AND CAJA302.ECNOCOMP = CAJA303.ECNOCOMP '
             + '                    AND CAJA302.TDIARID = ' + QuotedStr(wgTDiario)
             + '                    AND CAJA302.ECANOMM = ' + QuotedStr(wgPeriodo)
             + '                    AND CAJA302.ECOPAGO = ' + QuotedStr(wgPago) + ')';
      try
         DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
      except
         ShowMessage('Error al intentar grabar Nro.Comprobante en CAJA303');
         xgContinuaGrab := False;
         exit;
      end;
      xsSql := ' UPDATE CAJA304 SET CNTCOMPROB = ' + QuotedStr(wgNumero)
             + '  WHERE EXISTS (SELECT 1 FROM CAJA302 '
             + '                 WHERE CAJA302.CIAID = CAJA304.CIAID '
             + '                   AND CAJA302.TDIARID = CAJA304.TDIARID '
             + '                   AND CAJA302.ECANOMM = CAJA304.ECANOMM '
             + '                   AND CAJA302.ECNOCOMP = CAJA304.ECNOCOMP '
             + '                   AND CAJA302.TDIARID = ' + QuotedStr(wgTDiario)
             + '                   AND CAJA302.ECANOMM = ' + QuotedStr(wgPeriodo)
             + '                   AND CAJA302.ECOPAGO = ' + QuotedStr(wgPago) + ')';
      try
         DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
      except
         ShowMessage('Error al intentar grabar Nro.Comprobante en CAJA304');
         xgContinuaGrab := False;
         exit;
      end;
   End;

   xsSql := ' Update CXP_ORD_PAG_CAB '
          + '    set TDIARID = ' + QuotedStr(wgTDiario) + ','
          + '        CNTANOMM = ' + QuotedStr(wgPeriodo) + ','
          + '        CNTCOMPROB = ' + QuotedStr(wgNumero)
          + '  where CIAID = ' + QuotedStr(dblcCia.Text)
          + '    and NUMERO = ' + QuotedStr(dbeNumero.Text);
   try
      DMTE.DCOM1.AppServer.EjecutaSQL(xsSql);
   except
      ShowMessage('Error al intentar grabar datos del Comprobante en Cabecera de Orden de Pago');
      xgContinuaGrab := False;
      exit;
   end;
End;
//obteniedo la cuenta contable con que se provisionó la detracción

Function TFPagoDetCab.fg_ObtieneCtaProvision(wgClauxid, wgProv, wgDocId, wgSerie, wgNoDoc, wgNumProvision: String): String;
Var
   xsSql: String;
   xsCuenta: String;
Begin
   xsSql := ' CLAUXID = ' + QuotedStr(wgClauxid) +
            ' AND DCPAUXID = ' + QuotedStr(wgProv) +
            ' AND DOCID = ' + QuotedStr(wgDocId) +
            ' AND CPSERIE = ' + QuotedStr(wgSerie) +
            ' AND CPNODOC = ' + QuotedStr(wgNoDoc) +
            ' AND CPNOREG = ' + QuotedStr(wgNumProvision) +
            ' AND TREGID = ' + QuotedStr('13');
   xsCuenta := DMTE.DisplayDescrip('prvTGE', 'CXP302', 'CUENTAID', xsSql, 'CUENTAID');
   If length(xsCuenta) = 0 Then
   Begin
      xsCuenta := '42203';
   End;
   Result := xsCuenta;
End;

Function TFPagoDetCab.fg_ValidaProvDetraccion(wgDatos: TDatasource): Boolean;
Var
   xsTipoDetraccion: String;
   xsTipoOperacion: String;
   xsSql: String;
Begin
   // CONSISTENCIA DATOS
   With wgDatos.DataSet Do
   Begin
      DisableControls;
      First;
      While Not Eof Do
      Begin
         xsSql := ' SELECT * FROM CXP301 ' +
                  ' WHERE CLAUXID = ' + QuotedStr(wgDatos.DataSet.FieldByName('CLAUXID').AsString) +
                  ' AND PROV = ' + QuotedStr(wgDatos.DataSet.FieldByName('AUXID').AsString) +
                  ' AND DOCID = ' + Quotedstr(wgDatos.DataSet.FieldByName('DOCID').AsString) +
                  ' AND CPSERIE = ' + QuotedStr(wgDatos.DataSet.FieldByName('CPSERIE').AsString) +
                  ' AND CPNODOC = ' + QuotedStr(wgDatos.DataSet.FieldByName('CPNODOC').AsString) +
                  ' AND CPESTADO IN (' + QuotedStr('P') + ',' + QuotedStr('C') + ') ';
         DMTE.cdsQry.Close;
         DMTE.cdsQry.DataRequest(xsSql);
         DMTE.cdsQry.Open;
         If DMTE.cdsQry.RecordCount = 0 Then
         Begin
            ShowMessage('No se encontró la provisión del documento' + #13 +
                        'Tipo Auxiliar: ' + wgDatos.DataSet.FieldByName('CLAUXID').AsString + #13 +
                        'Código Proveedor: ' + wgDatos.DataSet.FieldByName('AUXID').AsString + #13 +
                        'Tipo Documento: ' + wgDatos.DataSet.FieldByName('DOCID').AsString + #13 +
                        'Número doc: ' + wgDatos.DataSet.FieldByName('CPNODOC').AsString + #13);
            Result := False;
            Exit;
         End;

         xsTipoDetraccion := Copy(trim(DMTE.cdsQry.FieldByName('CPTODETRSUNATID').AsString) + '   ', 1, 3);
         xsTipoOperacion := Copy(trim(DMTE.cdsQry.FieldByName('TIPOOPERSUNATID').AsString) + '  ', 1, 2);
         If (trim(xsTipoDetraccion) = '') Or (trim(xsTipoOperacion) = '') Then
         Begin
            ShowMessage('Verificar los Códigos de Servicio y Tipo (SUNAT) ' + #13 +
                        'Compañía : ' + DMTE.cdsQry.FieldByName('CIAID').AsString + #13 +
                        'RUC      : ' + DMTE.cdsQry.FieldByName('PROVRUC').AsString + #13 +
                        'Documento: ' + DMTE.cdsQry.FieldByName('CPNODOC').AsString);
            Result := False;
            Exit;
         End;

         Next;
      End;
      EnableControls;
   End;
   Result := True;
End;

procedure TFPagoDetCab.BitBtn2Click(Sender: TObject);
VAR    xSQL, xxSql, xsSql, xsPERIODO, xsFecMes, xscomprob,xscia,xsnumero: String;
       xsestado: String;
       xsTipoDiario: String;
begin


xSQL := 'Select * from CXP_ORD_PAG_CAB '
            + 'where CIAID =''' + dblcCia.TEXT + ''' '
            + ' and NUMERO=''' + dbeNumero.TEXT + ''' ';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest(xSQL);
      DMTE.cdsQry.Open;


xsTipoDiario := '62';
xsPERIODO := DMTE.cdsQry.FieldByname('CNTANOMM').AsString;
xscomprob:=  DMTE.cdsQry.FieldByname('CNTCOMPROB').AsString;
xscia:=  DMTE.cdsQry.FieldByname('CIAID').AsString;
xsnumero:=  DMTE.cdsQry.FieldByname('NUMERO').AsString;
xsSql := ' SELECT CNTESTADO ' +
            ' FROM CNT300 ' +
            ' WHERE CIAID = ' + QuotedStr(dblcCia.Text) +
            ' AND CNTANOMM = ' + QuotedStr(xsPERIODO) +
            ' AND TDIARID = ' + QuotedStr(xsTipoDiario) +
            ' AND CNTCOMPROB =' + QuotedStr(xscomprob) ;
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;
   xsestado := DMTE.cdsQry.FieldByname('CNTESTADO').AsString;

   IF DMTE.cdsQry.fieldByname('CNTESTADO').AsString ='I' THEN
   BEGIN
      DMTE.DCOM1.AppServer.IniciaTransaccion;


      xxSql:='DELETE FROM CNT300 '
            +'WHERE CIAID='+QuotedStr(xscia)
            +'   AND TDIARID='+QuotedStr(xsTipoDiario)
            +'   and CNTANOMM='+QuotedStr(xsPERIODO)
            +'   AND CNTCOMPROB =' + QuotedStr(xscomprob);
      DMTE.DCOM1.AppServer.EjecutaSQL(xxSql);
      xxSql:='DELETE FROM CNT311 '
            +' WHERE CIAID='+QuotedStr(xscia)
            +' AND TDIARID='+QuotedStr(xsTipoDiario)
            +' and CNTANOMM='+QuotedStr(xsPERIODO)
            +' AND CNTCOMPROB =' + QuotedStr(xscomprob);
      DMTE.DCOM1.AppServer.EjecutaSQL(xxSql);

      xxSql := 'update CXP_ORD_PAG_CAB '
                   +'   set USUCONTA='+QuotedStr('')+','
                   +'       NUMPLA='+QuotedStr('')+','
                   +'       FECCONTA='+QuotedStr('')+' '
                   +' where CIAID='+QuotedStr(xscia)
                   +'   and NUMERO='+QuotedStr(xsnumero);
      try
         DMTE.DCOM1.AppServer.EjecutaSQL(xxSql);
         DMTE.DCOM1.AppServer.GrabaTransaccion;
         ShowMessage('Se descontabilizó con éxito');
      except
         ShowMessage('No se pudo actualizar');
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         exit;
      end;

   END
   ELSE
   BEGIN
      ShowMessage('No se puede descontabilizar');
      exit;
   END;


end;

procedure TFPagoDetCab.BitBtn4Click(Sender: TObject);
VAR    xSQL, xxSql, xsSql, xsPERIODO, xsFecMes, xscomprob,xscia,xsnumero: String;
       xsestado: String;
       xsTipoDiario: String;
begin


xSQL := 'Select * from CXP_ORD_PAG_CAB '
            + 'where CIAID =''' + dblcCia.TEXT + ''' '
            + ' and NUMERO=''' + dbeNumero.TEXT + ''' ';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest(xSQL);
      DMTE.cdsQry.Open;


xsTipoDiario := '62';
xsPERIODO := DMTE.cdsQry.FieldByname('CNTANOMM').AsString;
xscomprob:=  DMTE.cdsQry.FieldByname('CNTCOMPROB').AsString;
xscia:=  DMTE.cdsQry.FieldByname('CIAID').AsString;
xsnumero:=  DMTE.cdsQry.FieldByname('NUMERO').AsString;
xsSql := ' SELECT CNTESTADO ' +
            ' FROM CNT300 ' +
            ' WHERE CIAID = ' + QuotedStr(dblcCia.Text) +
            ' AND CNTANOMM = ' + QuotedStr(xsPERIODO) +
            ' AND TDIARID = ' + QuotedStr(xsTipoDiario) +
            ' AND CNTCOMPROB =' + QuotedStr(xscomprob) ;
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;
   xsestado := DMTE.cdsQry.FieldByname('CNTESTADO').AsString;

   IF DMTE.cdsQry.recordcount = 0 THEN
   BEGIN

      xxSql := 'update CXP_ORD_PAG_CAB '
                   +'   set USUCONTA='+QuotedStr('')+','
                   +'       FECCONTA='+QuotedStr('')+' '
                   +' where CIAID='+QuotedStr(xscia)
                   +'   and NUMERO='+QuotedStr(xsnumero);
      try
         DMTE.DCOM1.AppServer.EjecutaSQL(xxSql);
         ShowMessage('Se Actualizó con éxito');
      except
         ShowMessage('No se pudo actualizar');

         exit;
      end;

   END;

end;

procedure TFPagoDetCab.sbDisenoRepClick(Sender: TObject);
begin
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
end;

procedure TFPagoDetCab.bbtnPagoClick(Sender: TObject);
var xSQL : String;
begin
   If dtpFechaCnt.Date = 0 Then
   Begin
      ShowMessage('Falta Ingresar la fecha de Pago');
      Exit;
   End;

   If dbeNumPla.Text = '' Then
   Begin
      ShowMessage('Falta Ingresar Número de Planilla de Banco');
      Exit;
   End;

   // Inicio HPC_201701_CAJA Corrección del cálculo del importe pagado
   If (DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'C') and (DMTE.cdsOPago.fieldByname('USUCONTA').AsString <> '') Then
   Begin
      ShowMessage('Orden de Pago ya fue contabilizada');
      Exit;
   End
   else
   Begin
      If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'C' Then
      Begin
          ShowMessage('Orden de Pago ya se encuentra CONFIRMADA');
          Exit;
      End;
   End;
   // Fin HPC_201701_CAJA
   If DMTE.cdsOPago.fieldByname('ESTADO').AsString <> 'P' Then
   Begin
      ShowMessage('Orden de Pago Detracción no está ACEPTADA');
      Exit;
   End;

   // Inicio HPC_201703_CAJA 
   // Número de constancia de Depósito Detracciones
    If fg_ValidaDatosCNT = False Then
    Begin
        Exit;
    End;
   // Fin HPC_201703_CAJA

   If MessageDlg('¿ Confirmar Orden de Pago Detracción ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      Screen.Cursor := crHourGlass;
      DMTE.DCOM1.AppServer.IniciaTransaccion;
      //CreaRetenciones;
      DMTE.cdsOPago.Edit;
      DMTE.cdsOPago.fieldByname('ESTADO').AsString := 'C';
      DMTE.cdsOPago.fieldByname('NUMPLA').AsString := Trim(dbeNumPla.Text);
      DMTE.cdsOPago.fieldByname('FECCONTA').AsDateTime := (dtpFechaCnt.Date);
      DMTE.cdsOPago.Post;
      xSQL := 'Update CXP_ORD_PAG_CAB '
             +'   set NUMPLA='+quotedstr(dbeNumPla.Text)+', '
             +'       FECCONTA='+quotedstr(datetostr(dtpFechaCnt.Date))+', '
             +'       ESTADO='+quotedstr('C')+' '
             +' where CIAID='+quotedstr(DMTE.cdsOPago.fieldByname('CIAID').AsString)
             +'   and NUMERO='+quotedstr(DMTE.cdsOPago.fieldByname('NUMERO').AsString);
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         DMTE.DCOM1.AppServer.RetornaTransaccion;                               //cuarto retorna boton contabiliza
         ShowMessage('Error en la Confirmación de la Orden de Pago');
         Exit;
      End;
// Inicio HPC_201701_CAJA Corrección del cálculo del importe pagado
      If xModu = 'CAJA' Then
      Begin
   // Actualiza en Número de Operación

         xSQL := 'update CAJA302 '
               + '   set ECNOCHQ=''' + dbeNumPla.text + ''' '
               + ' where ciaid=''02'' and ecopago=''' + dbeNumero.text + ''' ';
         try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            ShowMessage('No se pudo actualizar el archivo de Caja para cheques');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         end;
      End;
      // Actualiza el numero de Constancia
      With DMTE.cdsDetallePres Do
      Begin
         DisableControls;
         First;
         While Not Eof Do
         Begin
            xSQL := 'Update CXP301 '
                  + '   set FECDEPDET=''' + dtpFechaCnt.TEXT + ''', '
                  + '       NUMDEPDET=''' + FieldByName('NUMCONSTA').AsString + ''' '
                  + ' where CLAUXID=''' + FieldByName('CLAUXID').AsString + ''' '
                  + '   and PROV=''' + FieldByName('AUXID').AsString + ''' '
                  + '   and DOCID  =''' + FieldByName('DOCID').AsString + ''' '
                  + '   and CPSERIE=''' + FieldByName('CPSERIE').AsString + ''' '
                  + '   and CPNODOC=''' + FieldByName('CPNODOC').AsString + ''' ';
            try
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            except
               ShowMessage('No se pudo actualizar datos de Detracción en el archivo de Cuentas por Pagar');
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               exit;
            end;
            Next;
         End;
         EnableControls;
      End;

      If xModu = 'CAJA' Then
      Begin
      // Actualiza Contabilizacion
         xSQL := 'Select ciaid, tdiarid, ecanomm, ecnocomp from caja302 '
               + 'where ciaid=''02'' and ecopago=''' + dbeNumero.text + ''' ';
         DMTE.cdsQry.Close;
         DMTE.cdsQry.DataRequest(xSQL);
         DMTE.cdsQry.Open;

         While Not DMTE.cdsQry.Eof Do
         Begin
            xSQL := 'update CAJA304 '
                  + '   set DCNODOC=''' + dbeNumPla.text + ''' '
                  + ' where CIAID=''' + DMTE.cdsQry.FieldByname('CIAID').AsString + ''' '
                  + '   and TDIARID=''' + DMTE.cdsQry.FieldByname('TDIARID').AsString + ''' '
                  + '   and ECANOMM=''' + DMTE.cdsQry.FieldByname('ECANOMM').AsString + ''' '
                  + '   and ECNOCOMP=''' + DMTE.cdsQry.FieldByname('ECNOCOMP').AsString + ''' '
                  + '   and CUENTAID like ''104%''';
            try
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            except
               ShowMessage('No se pudo actualizar Nro. de Detracción en el archivo CAJA304');
               DMTE.DCOM1.AppServer.RetornaTransaccion;
               exit;
            end;
            DMTE.cdsQry.Next;
         End;
      End;
// Fin HPC_201701_CAJA

      DMTE.DCOM1.AppServer.GrabaTransaccion;
      Screen.Cursor := crDefault;
      If DMTE.cdsOPago.fieldByname('ESTADO').AsString = 'C' Then edtEstado.Text := 'CONFIRMADA';
      ShowMessage('Pago Confirmado');
   End;

End;

Procedure TFPagoDetCab.CargaGridDetalle;
Var
   xSQL: String;
Begin
   // Inicio HPC_201703_CAJA
   // Número de constancia de Depósito Detracciones
   {dbgDetalle.Selected.Clear;
   dbgDetalle.Selected.Add('CLAUXID'#9'4'#9'Cl.~Aux.'#9'F');
   dbgDetalle.Selected.Add('AUXID'#9'10'#9'Id.~Prov.'#9'F');
   dbgDetalle.Selected.Add('DOCID'#9'3'#9'Doc.'#9'F');
   dbgDetalle.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
   dbgDetalle.Selected.Add('CPNODOC'#9'11'#9'No.~Documento'#9'F');
   dbgDetalle.Selected.Add('TMONID'#9'3'#9'TM'#9'F');
   dbgDetalle.Selected.Add('CPMTOORI'#9'11'#9'Importe'#9'F');
   dbgDetalle.Selected.Add('CPSALORI'#9'11'#9'Importe~Saldo'#9'F');
   dbgDetalle.Selected.Add('IMPPAGO'#9'11'#9'Monto a~Pagar'#9'F');
   dbgDetalle.Selected.Add('CPPAGORI'#9'11'#9'Diferencia~Redondeo'#9'F');
   dbgDetalle.Selected.Add('NUMDETRAC'#9'11'#9'No.~Detracción'#9'F');
   dbgDetalle.Selected.Add('NUMCONSTA'#9'10'#9'No.~Constancia'#9'F');}
   // Fin HPC_201703_CAJA

// Inicio HPC_201502_CAJA
// Se agrega campos que se utilizan para la Exportación
   xSQL := 'Select ''6'' TIPDOC_PROV, ' // Tipo de Documento del Proveedor (6 corresponde a RUC)
         + '       ''         '' PROFORMA, ' //  Proforma
         + '       D.IMPRETE IMPORTE, ' // Importe del Depósito
         + '       nvl(to_char(C.CPFEMIS,''YYYYMM''),''YYYYMM'') PERIODO_TRIB, ' //-- Periodo Tributario
         + '       ''01'' TIPO_COMPROB, ' // -- Tipo de Comprobante
         + '       D.CPSERIE CPSERIE_TXT, ' // -- Serie de Documento q genera Detracción
         + '       D.CPNODOC CPNODOC_TXT, ' // -- Número de Documento q genera Detracción
         + '       D.CIAID, D.NUMERO, D.ITEM, D.CLAUXID, D.AUXID, D.DOCID, D.CPSERIE, D.CPNODOC, D.TMONID, D.CPMTOORI, D.CPPAGORI, D.CPSALORI, D.IMPPAGO, D.IMPRETE, D.FREG, D.HREG, '
         + '       D.USUARIO, D.ESTADO, D.IMPDEVO, D.RQCIAID, D.RQORIGEN, D.NUMDETRAC, D.NUMCONSTA,'
         + '       C.CIAID, C.CPANOMES, C.TDIARID, C.CPNOREG, C.CLAUXID, C.PROV, C.PROVRUC, C.DOCID, C.CPSERIE, C.CPNODOC, C.CPFRECEP, C.CPFEMIS, C.CPFVCMTO, C.TMONID, C.CPTCAMPR, '
         + '       C.CPTCAMPA, C.CPESTADO, C.CPOCOMP, C.CP_CONTA, C.CPGRAVAD, C.CPNOGRAV, C.CPIGV, C.CPISC, C.CPDCTO, C.CPSERVIC, C.CPMTOORI, C.CPMTOLOC, C.CPMTOEXT, C.CPPAGORI, '
         + '       C.CPPAGLOC, C.CPPAGEXT, C.CPSALORI, C.CPSALLOC, C.CPSALEXT, C.TCANJEID, C.CPCANJE, C.CPFCANJE, C.CPUSER, C.CPFREG, C.CPHREG, C.CPAAAA, C.CPMM, C.CPDD, C.CPTRI, '
         + '       C.CPSEM, C.CPSS, C.CPAATRI, C.CPAASEM, C.CPAASS, C.CPFCMPRB, C.DCPLOTE, C.DCPCOMP, C.CTATOTAL, C.FLAGVAR, C.CPTOTOT, C.CPIGV2, C.CPGRAVAD2, C.CPHMOD, C.FLAGVAR2, '
         + '       C.PROVDES, C.CLAUXREND, C.AUXIDREND, C.CCBCOID, C.BANCOID, C.SITUAID, C.CPFLAGTDOC, C.CXPRRHH, C.AUXIDINTER, C.CLAUXINTER, C.CPTCAMDOL, C.PROVRETIGV, C.CPTCAMAJ, '
         + '       C.DTRPORC, C.CPMTOORIB, C.DTRFLAG, C.FECDEPDET, C.NUMDEPDET, C.ADQ_NO_GRAV, C.IGV_GRA_NO_DEST, C.CP_OTROS, C.CPTODETRSUNATID, C.TIPOOPERSUNATID, C.PORCDESC, '
         + '       C.CP4TAPENSION, C.SNPAFPID, C.TIPCOMAFPID,D.MOD_DETR '
         + '  from CXP_ORD_PAG_DET D '
         + ' INNER JOIN CXP301 C ON D.CLAUXID = C.CLAUXID AND D.AUXID=C.PROV AND D.DOCID = C.DOCID AND D.CPSERIE =C.CPSERIE and D.CPNODOC = C.CPNODOC '
         + ' where D.CIAID =''' + DMTE.cdsOPago.FieldByname('CIAID').AsString + ''' '
         + '   and D.NUMERO=''' + DMTE.cdsOPago.FieldByname('NUMERO').AsString + ''' '
         + '   and C.CPESTADO in (''C'',''P'') '
         + ' order by D.ITEM';
// Fin HPC_201502_CAJA
   DMTE.cdsDetallePres.Close;
   DMTE.cdsDetallePres.DataRequest(xSQL);
   DMTE.cdsDetallePres.Open;
   // Inicio HPC_201703_CAJA
   // Número de constancia de Depósito Detracciones
   dbgDetalle.Selected.Clear;
   dbgDetalle.Selected.Add('CLAUXID'#9'4'#9'Cl.~Aux.'#9'F');
   dbgDetalle.Selected.Add('AUXID'#9'10'#9'Id.~Prov.'#9'F');
   dbgDetalle.Selected.Add('DOCID'#9'3'#9'Doc.'#9'F');
   dbgDetalle.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
   dbgDetalle.Selected.Add('CPNODOC'#9'11'#9'No.~Documento'#9'F');
   dbgDetalle.Selected.Add('TMONID'#9'3'#9'TM'#9'F');
   dbgDetalle.Selected.Add('CPMTOORI'#9'11'#9'Importe'#9'F');
   dbgDetalle.Selected.Add('CPSALORI'#9'11'#9'Importe~Saldo'#9'F');
   dbgDetalle.Selected.Add('IMPPAGO'#9'11'#9'Monto a~Pagar'#9'F');
   dbgDetalle.Selected.Add('CPPAGORI'#9'11'#9'Diferencia~Redondeo'#9'F');
   dbgDetalle.Selected.Add('NUMDETRAC'#9'11'#9'No.~Detracción'#9'F');
   dbgDetalle.Selected.Add('NUMCONSTA'#9'10'#9'No.~Constancia'#9'F');
   // Fin HPC_201703_CAJA
   // Inicio HPC_201703_CAJA
   // Número de constancia de Depósito Detracciones
   xSQL := 'SELECT CIAID, NUMERO, FECHA, TMONID, MONTOT, MONPAG, OBSERVA, FECREG, USUARIO, ESTADO,'
           +' FECACEPTA, USUACEPTA, FECPAGO, USUPAGO, BANCOID, CCBCOID, USUANULA, FECANU, USUCONTA,'
           +' FECCONTA, USUDEVO, FECDEVO, NUMPLA, MODULO, FECRECBAN, FPAGOID, DOCREF, DOCASU, DOCA,'
           +' CPTCAMPR, DOCID, CPSERIE, CPNODOC, BCODIR, BCOSEC, TDIARID, CNTANOMM, CNTCOMPROB,'
           +' ORIGEN, FLAG_OPER, NUMOPE FROM CXP_ORD_PAG_CAB WHERE NUMERO='+ quotedstr(dbeNumero.Text);
   DMTE.cdsOPago.Close;
   DMTE.cdsOPago.DataRequest(xSQL);
   DMTE.cdsOPago.Open;
   // Fin HPC_201703_CAJA
   CargaDataSource;
End;

//Inicio HPC_201705_CAJA
//Ajustes en la opción de pago de detracciones
Function TFPagoDetCab.fg_GeneraAsientoCNT: Boolean;
Var
   xsSQL: String;
Begin
   xsSQL:= 'BEGIN DB2ADMIN.SP_CNT_DETRACCION(' + quotedstr(dbeNumero.Text) + '); END;';

   try
     DMTE.DCOM1.AppServer.EjecutaSQL(xsSQL);
   Except
     ShowMessage('Error al Contabilizar Orden de Pago de Detracción');
     DMTE.DCOM1.AppServer.EjecutaSQL(xsSQL);
     Screen.Cursor := crDefault;
     Result:= False;
     Exit;
   End;

   Result:= True;

End;
//Fin HPC_201705_CAJA

End.


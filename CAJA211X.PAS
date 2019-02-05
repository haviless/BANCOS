unit Caja211X;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient,
  ComCtrls, Tabnotbk, wwDialog, wwidlg, CAJADM;

type
  TFExtChequesX = class(TForm)
    pnlCabecera1: TPanel;
    lblCia: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    pnlBotones: TPanel;
    z2bbtnImprime: TBitBtn;
    z2bbtnGraba: TBitBtn;
    z2bbtnCancelado: TBitBtn;
    z2bbtnCancel2: TBitBtn;
    z2bbtnNuevo: TBitBtn;
    z2bbtnSube: TBitBtn;
    z2bbtnCont: TBitBtn;
    dbdtpFComp: TwwDBDateTimePicker;
    lblFComp: TLabel;
    lblTDiario: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    lblPeriodo: TLabel;
    lblNoComp: TLabel;
    edtPeriodo: TEdit;
    dbeNoComp: TwwDBEdit;
    lblEstado: TLabel;
    z2bbtnAnula: TBitBtn;
    z2bbtnCalc: TBitBtn;
    z2bbtnOKCab: TBitBtn;
    pnlDocExtornar: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Bevel1: TBevel;
    lblClase: TLabel;
    lblProv: TLabel;
    lblProvRuc: TLabel;
    lblProvDes: TLabel;
    lblTMon: TLabel;
    lblTCambio: TLabel;
    lblImporte: TLabel;
    lblTDoc: TLabel;
    lblNoDoc: TLabel;
    lblBanco: TLabel;
    lblCCBco: TLabel;
    lblCuenta: TLabel;
    lblNoChq: TLabel;
    lblLote: TLabel;
    lblConcepto: TLabel;
    lblGlosa: TLabel;
    Label24: TLabel;
    z2bbtnCheque: TBitBtn;
    stTDiarioDes: TStaticText;
    stTDiario: TStaticText;
    stPeriodo: TStaticText;
    stFComp: TStaticText;
    stCiaDes: TStaticText;
    stCia: TStaticText;
    stNoComp: TStaticText;
    stGiradoA: TStaticText;
    stProvRUC: TStaticText;
    stProv: TStaticText;
    stClaseDes: TStaticText;
    stClase: TStaticText;
    stNoDoc: TStaticText;
    stTDocDes: TStaticText;
    stTDoc: TStaticText;
    stImporte: TStaticText;
    stTCambio: TStaticText;
    stTMonDes: TStaticText;
    stTMon: TStaticText;
    stCuenta: TStaticText;
    stCCBcoDes: TStaticText;
    stCCBco: TStaticText;
    stBancoDes: TStaticText;
    stBanco: TStaticText;
    stGlosa: TStaticText;
    stCnp: TStaticText;
    stLote: TStaticText;
    stNoChq: TStaticText;
    ldlgCheque: TwwLookupDialog;
    Z2bbtnCancel5: TBitBtn;
    Z2bbtnOK: TBitBtn;
    dbgExtorno: TwwDBGrid;

    procedure IniciaDatos;
    procedure IniciaDatos2;

//    procedure IniciaPanel;
    procedure LimpiaFiltros;
//    procedure ActivaFiltro(xName:string);
    procedure CambiaEstado(xName:char);
    procedure Contab_DifCamRegCxP;
    procedure Contabiliza;
    procedure Contab_ExtCaja;
    procedure Contab_RegCxP;
    procedure Contab_DifCambio;
    function  ValidaCampo:Boolean;
    procedure ConsisCancela(var xconsis:Boolean);
    procedure ActPnlBotones;
    procedure dblcCiaExit(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure z2bbtnCalcClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure z2bbtnSumatDocPagoClick(Sender: TObject);
    procedure z2bbtnSubeClick(Sender: TObject);
    procedure z2bbtnCancel2Click(Sender: TObject);
    procedure z2bbtnNuevoClick(Sender: TObject);
    procedure z2bbtnCanceladoClick(Sender: TObject);
    procedure z2bbtnContClick(Sender: TObject);
    procedure z2bbtnAnulaClick(Sender: TObject);
    procedure dbdtpFComp2Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);
    procedure EdiTarRegistros;
    procedure AdicionarRegistros;
    procedure LiberarFiltrosRegistroEgresos;
    procedure EstablecerFiltrosRegistroEgresos;
    procedure dblcTMon2Exit(Sender: TObject);
    procedure z2bbtnChequeClick(Sender: TObject);
    procedure ldlgChequeUserButton1Click(Sender: TObject;
      LookupTable: TDataSet);
    procedure ldlgChequeCloseDialog(Dialog: TwwLookupDlg);
    procedure ldlgChequeUserButton2Click(Sender: TObject;
      LookupTable: TDataSet);
    procedure z2bbtnGrabaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
    procedure ldlgChequeInitDialog(Dialog: TwwLookupDlg);
    procedure Z2bbtnCancel5Click(Sender: TObject);
    procedure Z2bbtnOKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private
    xCiaId1, xTDiarId1,   xEcaNom1,   xEcNocomp1 : String;
    { Private declarations }
    cdsExtorno: TWWClientDataSet;
    A1 : Array of Integer ;
    A2 : Array Of TNotifyEvent ;
    procedure RecuperarMovAExtornar(xCIAID,xTDIARID,xECANOMM,xECNOCOMP : String);
    Function ValidacionCabecera:Boolean;
    procedure BuscaYActualizaMovAExtornar(xStr : String);
    Function ValidacionMovimiento : Boolean;
    procedure MuestraDatos;
    procedure ConfiguraAccesos;
    procedure Proc_Admin;
    procedure Proc_Consul;
    procedure Libera_Admin;
    procedure Libera_Consul;
    procedure LibConfigAccesos;

  public
    { Public declarations }
  end;
var
  FExtChequesX: TFExtChequesX;
  wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,
  wbcancel2: Boolean;
  wmodifica: Boolean;

implementation
uses CAJAUTIL, Caja001;
{$R *.DFM}


procedure TFExtChequesX.IniciaDatos;
begin
   pnlCabecera1.Enabled   := True;
   pnlBotones.Enabled     := False;
   pnlDocExtornar.Enabled := False;

   // Estado de variables Botones
   wbSumat     := False;
   wbCont      := False;
   wbNuevo     := False;
   wbImprime   := False;
   wbSube      := False;
   wbGraba     := False;
   wbCancelado := False;
   wbCancel2   := False;
   wbAnula     := False;

   // Estado de Botones
//   z2bbtnOk.Enabled        := False;
//   z2bbtnCancel.Enabled    := False;
//   z2bbtnSumat.Enabled     := False;

   z2bbtnOKCab.Enabled     := True;
   z2bbtnCheque.Enabled    := False;
   Z2bbtnCancel5.Enabled   := False;
   Z2bbtnOk.Enabled        := False;
   z2bbtnCont.Enabled      := False;
   z2bbtnNuevo.Enabled     := False;
   z2bbtnImprime.Enabled   := False;
   z2bbtnSube.Enabled      := False;
   z2bbtnGraba.Enabled     := False;
   z2bbtnCancelado.Enabled := False;
   z2bbtnCancel2.Enabled   := False;
   z2bbtnAnula.Enabled     := False;

   dblcCia.Text      := '';   // Código de Compañía
   edtCia.Text       := '';   // Descripción de la Compañía
   dbdtpFComp.Date   := date; // Fecha de Comprob.
   edtPeriodo.Text   := '';   // Periodo
   dblcTDiario.Text  := '';   // Tipo de Diario
   edtTDiario.Text   := '';   // Descripción del T.Diario
   dbeNoComp.Text    := '';   // Voucher
    stTDiarioDes.Caption :='';
    stTDiario.Caption :='';
    stPeriodo.Caption :='';
    stFComp.Caption :='';
    stCiaDes.Caption :='';
    stCia.Caption :='';
    stNoComp.Caption :='';
    stGiradoA.Caption :='';
    stProvRUC.Caption :='';
    stProv.Caption :='';
    stClaseDes.Caption :='';
    stClase.Caption :='';
    stNoDoc.Caption :='';
    stTDocDes.Caption :='';
    stTDoc.Caption :='';
    stImporte.Caption :='';
    stTCambio.Caption :='';
    stTMonDes.Caption :='';
    stTMon.Caption :='';
    stCuenta.Caption :='';
    stCCBcoDes.Caption :='';
    stCCBco.Caption :='';
    stBancoDes.Caption :='';
    stBanco.Caption :='';
    stGlosa.Caption :='';
    stCnp.Caption :='';
    stLote.Caption :='';
    stNoChq.Caption :='';

   //dblcdCCosto.Text:='';


   lblEstado.Caption := '';   //Inicializar el Estado
   wmodifica         := False;


   LimpiaFiltros;

//   dblcCia.SetFocus;
   RecuperarCiaUnica(dblcCia,edtCia);
   edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);

end;


procedure TFExtChequesX.dblcCiaExit(Sender: TObject);
var xWhere:string;
begin
   If xCrea then Exit;
   
   xWhere:='CIAID='+''''+dblcCia.Text+'''';
   edtCia.Text:=DM1.DisplayDescrip('prvTGE','TGE101','*',xWhere,'CIAABR');
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Codigo de Compañia Errado');
      dblcCia.SetFocus;
   end
   else
      dbdtpFComp.SetFocus;
end;

procedure TFExtChequesX.dbdtpFCompExit(Sender: TObject);
begin
   If xCrea then Exit;

   if dbdtpFComp.Date=0 then
   begin
      ShowMessage('Fecha de Comprobante Errada');
      dbdtpFComp.SetFocus;
   end
   else
   begin
      edtPeriodo.text:=copy(datetostr(dbdtpFComp.date),7,4)
                      +copy(datetostr(dbdtpFComp.date),4,2);
      dblcTDiario.SetFocus;
   end;
end;

procedure TFExtChequesX.dblcTDiarioExit(Sender: TObject);
var xWhere:string;
begin
   If xCrea then Exit;
   
   xWhere:='TDIARID='+''''+dblcTDiario.Text+'''';
   edtTDiario.Text:=DM1.DisplayDescrip('prvTGE','TGE104','*',xWhere,'TDIARDES');
   if length(edtTDiario.Text)=0 then
   begin
      ShowMessage('Tipo de Diario Errado');
      dblcTDiario.SetFocus;
   end
   else
   begin
      xWhere:='CIAID='+''''+dblcCia.Text+''''+' AND ECANOMM='+
             ''''+edtPeriodo.Text+''''+' AND TDIARID='+''''+
             dblcTDiario.Text+'''';
      dbeNoComp.text:=DM1.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      dbeNoComp.SetFocus;
   end;
end;

procedure TFExtChequesX.z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('C:\windows\calc.exe',1);  //Activa la calculadora del Windows
end;

procedure TFExtChequesX.z2bbtnSubeClick(Sender: TObject);
begin
{   DM1.cdsEgrCaja.Edit;
   DM1.cdsRegCxP.Edit;

   pnlBotones.Enabled  := False;

   // Desactivamos los botones
   z2bbtnSumat.Enabled     := False;
   z2bbtnCont.Enabled      := False;
   z2bbtnNuevo.Enabled     := False;
   z2bbtnImprime.Enabled   := False;
   z2bbtnSube.Enabled      := False;
   z2bbtnGraba.Enabled     := False;
   z2bbtnCancelado.Enabled := False;
   z2bbtnCancel2.Enabled   := False;
   z2bbtnAnula.Enabled     := False;}
   z2bbtnCheque.SetFocus;
end;

procedure TFExtChequesX.z2bbtnCancel2Click(Sender: TObject);
begin
   if MessageDlg('¿Anular los cambios?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin
      DM1.cdsEgrCaja.CancelUpdates;
      IniciaDatos;
   end;
end;

procedure TFExtChequesX.z2bbtnNuevoClick(Sender: TObject);
begin
   if DM1.cdsEgrCajaECEstado.Value ='I' then
   begin
      if wmodifica then
      begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      end;
      if MessageDlg('¿Nuevo Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin
         IniciaDatos;
      end;
   end
   else
   begin
      IniciaDatos;
   end;
end;

procedure TFExtChequesX.z2bbtnCanceladoClick(Sender: TObject);
var xConsis:Boolean;
begin
   if DM1.cdsEgrCajaECEstado.Value='I' then
   begin
      if wmodifica then
      begin
         ShowMessage('Debe grabar primero las actualizaciones realizadas');
         exit;
      end;

      DM1.cdsRegCxP.DisableControls;
      ConsisCancela(xConsis);
      DM1.cdsRegCxP.EnableControls;
      if not xConsis then
          ShowMessage('No se puede Cancelar el Comprobante')
      else
      begin
          if MessageDlg('¿Efectuar la Cancelacion del Comprobante?',mtConfirmation,
                       [mbYes, mbNo], 0)=mrYes then
          begin


             DM1.cdsEgrCaja.Edit;
             DM1.cdsEgrCajaECEstado.Value:='C';
             DM1.cdsEgrCaja.ApplyUpdates(0);

             DM1.cdsRegCxP.ApplyUpdates(0);
{0405
             DM1.cdsRegCxP.Close;
             DM1.cdsRegCxP.Open;
             DM1.cdsRegCxP.Filtered:=False;
             DM1.cdsRegCxP.Filter:='';
             DM1.cdsRegCxP.Filter:='CIAID='+''''+dblcCia.Text+''''
                                 +' and TDIARID='+''''+dblcTDiario.Text+''''
                                 +' and ECANOMM='+''''+edtPeriodo.Text+''''
                                 +' and ECNOCOMP='+''''+dbeNoComp.Text +'''';
             DM1.cdsRegCxP.Filtered:=True;
}
            //0405
            dm1.cdsRegCxP.Active := False ;
            dm1.cdsRegCxP.Params.ParamByName('CIAID').AsString := dblcCia.Text ;
            dm1.cdsRegCxP.Params.ParamByName('ECANOMM').AsString := edtPeriodo.Text ;
            dm1.cdsRegCxP.Params.ParamByName('TDIARID').AsString := dblcTDiario.Text ;
            dm1.cdsRegCxP.Params.ParamByName('ECNOCOMP').AsString := dbeNoComp.Text ;
            dm1.cdsRegCxP.Active := True ;
            //

             z2bbtnCont.Enabled     := True;
             z2bbtnSube.Enabled     := False;
             z2bbtnGraba.Enabled    := False;
             z2bbtnCancelado.Enabled:= False;
             z2bbtnCancel2.Enabled  := False;
             z2bbtnAnula.Enabled    := False;
             lblEstado.Caption    :='Cancelado          ';
          end;
      end;
   end
   else
   begin
      ShowMessage('Imposible Cancelar');
   end;
end;

function TFExtChequesX.ValidaCampo:Boolean;
var xWhere,aux:string;
begin
     Result:=True;
     with DM1 do
     begin

        if length(cdsRegCxPCPNOREG.Value)=0 then
        begin  //No Registro
           ShowMessage('Falta No Registro');
           Result:=False;
           exit;
        end
        else
        begin
           if length(cdsRegCxPCPNOREG.Value)<6 then
           begin
              ShowMessage('Codigo de Registro Errado');
              Result:=False;
              exit;
           end;
        end;

        if length(cdsRegCxPTDIARID2.Value)=0 then
        begin  //Tipo de Diario
           ShowMessage('Falta Tipo de Diario');
           Result:=False;
           exit;
        end
        else
        begin
           xWhere:='TDIARID='+''''+cdsRegCxPTDIARID2.Value+'''';
           aux   :=DisplayDescrip('prvTGE','TGE104','*',xWhere,'TDIARDES');
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Tipo de Diario Errado');
              Result:=False;
              exit;
           end;
        end;

        if length(cdsRegCxPDOCID2.Value)=0 then
        begin  //Tipo de Documento
           ShowMessage('Falta Tipo de Documento');
           Result:=False;
           exit;
        end
        else
        begin
           xWhere:='DOCID='+''''+cdsRegCxPDOCID2.Value+'''';
           aux   :=DisplayDescrip('prvTGE','TGE110','*',xWhere,'DOCDES');
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Tipo de Documento Errado');
              Result:=False;
              exit;
           end;
        end;

        if cdsRegCxPCPSERIE.Value='' then
        begin      //Serie
           ShowMessage('Falta Serie');
           Result:=False;
           exit;
        end;

        if cdsRegCxPCPNODOC.Value='' then
        begin      //No Documento
           ShowMessage('Falta Nro. de Documento');
           Result:=False;
           exit;
        end;

        if length(cdsRegCxPTMONID.Value)=0 then
        begin //Tipo de Moneda
           ShowMessage('Falta Tipo de Moneda');
           Result:=False;
           exit;
        end
        else
        begin
           xWhere:='TMONID='+''''+cdsRegCxPTMONID.Value+'''';
           aux   :=DisplayDescrip('prvTGE','TGE103','*',xWhere,'TMONDES');
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Tipo de Moneda Errado');
              Result:=False;
              exit;
           end;
        end;

        if cdsRegCxPDETCDOC.Value<=0 Then
        begin // Tipo de Cambio Detalle
           ShowMessage('Tipo de Cambio debe ser mayor que cero');
           Result:=False;
           exit;
        end;

        if cdsRegCxPDEMTOORI.Value<=0 Then
        begin   //Importe
           ShowMessage('Importe debe ser mayor que cero');
           Result:=False;
           exit;
        end;

        if cdsRegCxPCPTOID.Value='' then
        begin      //Concepto
           ShowMessage('Falta Concepto');
           Result:=False;
           exit;
        end
        else
        begin                             // Cuenta
           aux:=cdsRegCxPCUENTAID.Value;
           if length(aux)=0 then
           begin
              ShowMessage('Codigo de Concepto Errado');
              Result:=False;
              exit;
           end;
        end;

{        if length(cdsRegCxPCCOSID.Value)=0 then
        begin  //Centro de Costo
           ShowMessage('Falta Centro de Costo');
           Result:=False;
           exit;
        end
        else begin
           xWhere:='CCosID='+''''+cdsRegCxPCCOSID.Value+'''';
           aux   :=DisplayDescrip('prvTGE','TGE203','*',xWhere,'CCosDes');
           if length(aux)=0 then begin
              ShowMessage('Codigo de Centro de Costo Errado');
              Result:=False;
              exit;
           end;
        end;}
        if (length(cdsRegCxPCCOSID.Value)=0) then
        begin  //Centro de Costo
           ShowMessage('Falta Centro de Costo');
           Result:=False;
           exit;
        end  ;


        if cdsRegCxPCPFVCMTO.Value<cdsRegCxPCPFEMIS.Value then
        begin //Fecha de Vencimiento
             ShowMessage('Fecha de Vencimiento debe ser posterior a la Fecha de Emision');
             Result:=False;
             exit;
        end;
    end;
end;

procedure TFExtChequesX.ConsisCancela(Var xConsis:boolean);
var
    xRegAct : TBookMark;
    xSumImp : Real;
begin
   xConsis := True;
{   xSumImp := 0;
   With DM1 do begin
      xRegAct := cdsRegCxP.GetBookmark;
      cdsRegCxP.First ;
      While not cdsRegCxP.Eof do Begin
         if cdsRegCxPDEDH.Value='D' then
            if cdsEgrCajaTMONID.Value = wtMonLoc then
               xSumImp := xSumImp + cdsRegCxPDEMTOLOC.Value
            else
               xSumImp := xSumImp + cdsRegCxPDEMTOEXT.Value
         else
            if cdsEgrCajaTMONID.Value = wtMonLoc then
               xSumImp := xSumImp - cdsRegCxPDEMTOLOC.Value
            else
               xSumImp := xSumImp - cdsRegCxPDEMTOEXT.Value;

         cdsRegCxP.Next;
      end;
      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);

      // Adicionamos el total de los Documentos Pagados
      xRegAct := cdsDocPago.GetBookmark;
      cdsDocPago.First ;
      While not cdsDocPago.Eof do Begin
         if cdsEgrCajaTMONID.Value = wtMonLoc then
            xSumImp := xSumImp + cdsDocPagoDEMTOLOC.Value
         else
            xSumImp := xSumImp + cdsDocPagoDEMTOEXT.Value;

         cdsDocPago.Next;
      end;
      cdsDocPago.GotoBookmark(xRegAct);
      cdsDocPago.FreeBookmark(xRegAct);

   end;

   // Comparamos
   if xSumImp<>DM1.cdsEgrCajaECMTOORI.Value then begin
        xConsis := False;
        if DM1.cdsEgrCajaECMTOORI.Value > xSumImp then
           ShowMessage('El Monto a Pagar es mayor que el Provisionado')
        else
           ShowMessage('El Monto a Pagar es menor que el Provisionado');
   end;}
end;

procedure TFExtChequesX.Contab_DifCamRegCxP;
//var
//    xDif_Camb : real;
begin
{    // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO

    if dm1.cdsRegCxPDETCDOC.Value <> dm1.cdsRegCxPDETCPAG.Value then begin

       DM1.cdsCntCaja.Insert;

       dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsRegCxPCIAID.Value;
       dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsRegCxPTDIARID.Value;
       dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsRegCxPECANOMM.Value;
       dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsRegCxPECNOCOMP.Value;
       //dm1.cdsCntCajaDCLOTE.Value  :=  ;
       dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsRegCxPDOCID2.Value;
       dm1.cdsCntCajaDCSERIE.Value :=  dm1.cdsRegCxPCPSERIE.Value;
       dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsRegCxPCPNODOC.Value;
       dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsRegCxPDEFCOMP.Value;
       dm1.cdsCntCajaDCFEMIS.Value :=  dm1.cdsRegCxPCPFEMIS.Value;
       dm1.cdsCntCajaDCFVCMTO.Value:=  dm1.cdsRegCxPCPFVCMTO.Value;
       dm1.cdsCntCajaCLAUXID.Value :=  dm1.cdsEgrCajaCLAUXID.Value; //Aqui se toma de la cabecera
       dm1.cdsCntCajaDCAUXID.Value :=  dm1.cdsEgrCajaPROV.Value;    //Aqui se toma de la cabecera
       dm1.cdsCntCajaCCOSID.Value  :=  dm1.cdsRegCxPCCOSID.Value;

       dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsRegCxPDETCPAG.Value;
       dm1.cdsCntCajaDCTCAMPR.Value:=  dm1.cdsRegCxPDETCDOC.Value;

       //dm1.cdsCntCajaDCESTADO.Value:=;
       dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
       //dm1.cdsCntCajaDCFLAAUT.Value:=;
       //dm1.cdsCntCajaDCUSER.Value  :=;
       //dm1.cdsCntCajaDCFREG.Value  :=;
       //dm1.cdsCntCajaDCHREG.Value  :=;
       dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsRegCxPDEANO.Value;
       dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsRegCxPDEMM.Value;
       dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsRegCxPDEDD.Value;
       dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsRegCxPDESS.Value;
       dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsRegCxPDESEM.Value;
       dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsRegCxPDETRI.Value;
       dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsRegCxPDEAASS.Value;
       dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsRegCxPDEAASEM.Value;
       dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsRegCxPDEAATRI.Value;
       //dm1.cdsCntCajaFLAGVAR.Value :=;

       if dm1.cdsRegCxPTMONID.Value=dm1.wtMonLoc then begin   //Provision en Mon.Local
             xDif_Camb:= abs(dm1.cdsRegCxPDEMTOLOC.Value / dm1.cdsRegCxPDETCDOC.Value -
                             dm1.cdsRegCxPDEMTOLOC.Value / dm1.cdsRegCxPDETCPAG.Value);//En Mon.Ext.
             dm1.cdsCntCajaDCMTOEXT.Value := xDif_Camb;
             dm1.cdsCntCajaTMONID.Value   :=  dm1.wtMonExt;

             if dm1.cdsRegCxPDETCDOC.Value > dm1.cdsRegCxPDETCPAG.Value then
                dm1.cdsCntCajaDCDH.Value := 'D'
             else
                dm1.cdsCntCajaDCDH.Value := 'H';

       end
       else begin                                            //Provision en Mon.Ext.
             xDif_Camb:= abs(dm1.cdsRegCxPDEMTOEXT.Value * dm1.cdsRegCxPDETCDOC.Value -
                             dm1.cdsRegCxPDEMTOEXT.Value * dm1.cdsRegCxPDETCPAG.Value);//En Mon.Local
             dm1.cdsCntCajaDCMTOLO.Value := xDif_Camb;
             dm1.cdsCntCajaTMONID.Value  := dm1.wtMonLoc;

             if dm1.cdsRegCxPDETCDOC.Value > dm1.cdsRegCxPDETCPAG.Value then
                dm1.cdsCntCajaDCDH.Value := 'H'
             else
                dm1.cdsCntCajaDCDH.Value := 'D';
       end;
       if dm1.cdsCntCajaDCDH.Value = 'D' then begin
          dm1.cdsCntCajaCPTOID.Value  :=  dm1.wCptoPer;
          dm1.cdsCntCajaCUENTAID.Value:=  dm1.wCtaPer;
       end
       else begin
          dm1.cdsCntCajaCPTOID.Value  :=  dm1.wCptoGan;
          dm1.cdsCntCajaCUENTAID.Value:=  dm1.wCtaGan;
       end;
    end}
end;


procedure TFExtChequesX.Contabiliza;
var xRegAct : TBookMark;
begin
{
    // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera
//0405    DM1.cdsCntCaja.Insert;
    //0405
    dm1.cdsCNTCaja.Active := False ;
    dm1.cdsCNTCaja.Params.ParamByName('CIAID').AsString := '' ;
    dm1.cdsCNTCaja.Params.ParamByName('ECANOMM').AsString := '' ;
    dm1.cdsCNTCaja.Params.ParamByName('TDIARID').AsString := '' ;
    dm1.cdsCNTCaja.Params.ParamByName('ECNOCOMP').AsString := '' ;
    dm1.cdsCNTCaja.Active := True ;
    //

    Contab_ExtCaja;

    dm1.cdsRegCxP.DisableControls;
    xRegAct := dm1.cdsRegCxP.GetBookmark;
    dm1.cdsRegCxP.First ;

   // GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde el Detalle
    While not dm1.cdsRegCxP.Eof do
    Begin
       dm1.cdsCntCaja.Insert;
       Contab_RegCxP;
       Contab_DifCambio;
       dm1.cdsRegCxP.Next;
    end;
    dm1.cdsRegCxP.GotoBookmark(xRegAct);
    dm1.cdsRegCxP.FreeBookmark(xRegAct);
    dm1.cdsRegCxP.EnableControls;

    //Actualizamos en la tabla de Contabilidad
    DM1.cdsCntCaja.ApplyUpdates(0);
//    DM1.ActualizaData(DM1.cdsCntCaja);
}
end;

procedure TFExtChequesX.Contab_ExtCaja;
begin
    dm1.cdsCntCajaCIAID.Value   := dm1.cdsEgrcajaCIAID.Value;
    dm1.cdsCntCajaTDIARID.Value := dm1.cdsEgrCajaTDIARID.Value;
    dm1.cdsCntCajaECANOMM.Value := dm1.cdsEgrCajaECANOMM.Value;
    dm1.cdsCntCajaECNOCOMP.Value:= dm1.cdsEgrCajaECNOCOMP.Value;
    dm1.cdsCntCajaDCLOTE.Value  := dm1.cdsEgrCajaECLOTE.Value;
    //dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsEgrCajaDOCID.Value;
    //dm1.cdsCntCajaDCSERIE.Value :=  ;
    dm1.cdsCntCajaDCNODOC.Value := dm1.cdsEgrCajaECNODOC.Value;
    dm1.cdsCntCajaECFCOMP.Value := dm1.cdsEgrCajaECFCOMP.Value;
    dm1.cdsCntCajaDCFEMIS.Value := dbdtpFComp.Date;
    //dm1.cdsCntCajaDCFVCMTO.Value:=;
    dm1.cdsCntCajaCPTOID.Value  := dm1.cdsEgrCajaCPTOID.Value;
    //dm1.cdsCntCajaCUENTAID.Value:=  dm1.cdsEgrCajaCUENTAID.Value;
    dm1.cdsCntCajaCUENTAID.Value:= stCuenta.Caption;
    //dm1.cdsCntCajaCLAUXID.Value :=  ; No va porque la cuenta 10 no lleva auxiliar
    //dm1.cdsCntCajaDCAUXID.Value :=  ; No va porque la cuenta 10 no lleva auxiliar
    //dm1.cdsCntCajaCCOSID.Value  :=  ;
    dm1.cdsCntCajaDCDH.Value    :=  'D';
    dm1.cdsCntCajaDCTCAMPA.Value:= dm1.cdsEgrCajaECTCAMB.Value;
    //dm1.cdsCntCajaDCTCAMPR.Value:=  ;    No se usa porque se llena del detalle
    dm1.cdsCntCajaTMONID.Value  := dm1.cdsEgrCajaTMONID.Value;
    dm1.cdsCntCajaDCMTOORI.Value:= dm1.cdsEgrCajaECMTOORI.Value;
    dm1.cdsCntCajaDCMTOLO.Value := dm1.cdsEgrCajaECMTOLOC.Value;
    dm1.cdsCntCajaDCMTOEXT.Value:= dm1.cdsEgrCajaECMTOEXT.Value;
    //dm1.cdsCntCajaDCESTADO.Value:=;
    dm1.cdsCntCajaDCFLACDR.Value:= 'S';   //Registro ya cuadrado
    //dm1.cdsCntCajaDCFLAAUT.Value:=;
    //dm1.cdsCntCajaDCUSER.Value  :=;
    //dm1.cdsCntCajaDCFREG.Value  :=;
    //dm1.cdsCntCajaDCHREG.Value  :=;
    dm1.cdsCntCajaDCANO.Value   := dm1.cdsEgrCajaECANO.Value;
    dm1.cdsCntCajaDCMM.Value    := dm1.cdsEgrCajaECMM.Value;
    dm1.cdsCntCajaDCDD.Value    := dm1.cdsEgrCajaECDD.Value;
    dm1.cdsCntCajaDCSS.Value    := dm1.cdsEgrCajaECSS.Value;
    dm1.cdsCntCajaDCSEM.Value   := dm1.cdsEgrCajaECSEM.Value;
    dm1.cdsCntCajaDCTRI.Value   := dm1.cdsEgrCajaECTRI.Value;
    dm1.cdsCntCajaDCAASS.Value  := dm1.cdsEgrCajaECAASS.Value;
    dm1.cdsCntCajaDCAASEM.Value := dm1.cdsEgrCajaECAASEM.Value;
    dm1.cdsCntCajaDCAATRI.Value := dm1.cdsEgrCajaECAATRI.Value;
    //dm1.cdsCntCajaFLAGVAR.Value :=;
end;

procedure TFExtChequesX.Contab_RegCxP;
begin
    dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsRegCxPCIAID.Value;
    dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsRegCxPTDIARID.Value;
    dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsRegCxPECANOMM.Value;
    dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsRegCxPECNOCOMP.Value;
    //dm1.cdsCntCajaDCLOTE.Value  :=  ;
    dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsRegCxPDOCID2.Value;
    dm1.cdsCntCajaDCSERIE.Value :=  dm1.cdsRegCxPCPSERIE.Value;
    dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsRegCxPCPNODOC.Value;
    dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsRegCxPDEFCOMP.Value;
    dm1.cdsCntCajaDCFEMIS.Value :=  dm1.cdsRegCxPCPFEMIS.Value;
    dm1.cdsCntCajaDCFVCMTO.Value:=  dm1.cdsRegCxPCPFVCMTO.Value;
    dm1.cdsCntCajaCPTOID.Value  :=  dm1.cdsRegCxPCPTOID.Value;
    dm1.cdsCntCajaCUENTAID.Value:=  dm1.cdsRegCxPCUENTAID.Value;
    dm1.cdsCntCajaCLAUXID.Value :=  dm1.cdsEgrCajaCLAUXID.Value; //Aqui se toma de la cabecera
    dm1.cdsCntCajaDCAUXID.Value :=  dm1.cdsEgrCajaPROV.Value;    //Aqui se toma de la cabecera
    dm1.cdsCntCajaCCOSID.Value  :=  dm1.cdsRegCxPCCOSID.Value;
    dm1.cdsCntCajaDCDH.Value    :=  dm1.cdsRegCxPDEDH.Value;
    dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsRegCxPDETCPAG.Value;
    dm1.cdsCntCajaDCTCAMPR.Value:=  dm1.cdsRegCxPDETCDOC.Value;
    dm1.cdsCntCajaTMONID.Value  :=  dm1.cdsRegCxPTMONID.Value;
    dm1.cdsCntCajaDCMTOORI.Value:=  dm1.cdsRegCxPDEMTOORI.Value;
    if dm1.cdsRegCxPTMONID.Value = dm1.wtMonLoc then
    begin
       dm1.cdsCntCajaDCMTOLO.Value := dm1.cdsRegCxPDEMTOLOC.Value;
       dm1.cdsCntCajaDCMTOEXT.Value:= dm1.cdsRegCxPDEMTOLOC.Value / dm1.cdsRegCxPDETCDOC.Value;
    end
    else
    begin
       dm1.cdsCntCajaDCMTOEXT.Value:= dm1.cdsRegCxPDEMTOEXT.Value;
       dm1.cdsCntCajaDCMTOLO.Value := dm1.cdsRegCxPDEMTOEXT.Value * dm1.cdsRegCxPDETCDOC.Value;
    end;

    //dm1.cdsCntCajaDCESTADO.Value:=;
    dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
    //dm1.cdsCntCajaDCFLAAUT.Value:=;
    //dm1.cdsCntCajaDCUSER.Value  :=;
    //dm1.cdsCntCajaDCFREG.Value  :=;
    //dm1.cdsCntCajaDCHREG.Value  :=;
    dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsRegCxPDEANO.Value;
    dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsRegCxPDEMM.Value;
    dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsRegCxPDEDD.Value;
    dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsRegCxPDESS.Value;
    dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsRegCxPDESEM.Value;
    dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsRegCxPDETRI.Value;
    dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsRegCxPDEAASS.Value;
    dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsRegCxPDEAASEM.Value;
    dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsRegCxPDEAATRI.Value;
    //dm1.cdsCntCajaFLAGVAR.Value :=;}
end;

{procedure TFExtCheques.Contab_RegCxP;
begin
    dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsRegCxPCIAID.Value;
    dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsRegCxPTDIARID.Value;
    dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsRegCxPECANOMM.Value;
    dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsRegCxPECNOCOMP.Value;
    //dm1.cdsCntCajaDCLOTE.Value  :=  ;
    dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsRegCxPDOCID2.Value;
    dm1.cdsCntCajaDCSERIE.Value :=  dm1.cdsRegCxPCPSERIE.Value;
    dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsRegCxPCPNODOC.Value;
    dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsRegCxPDEFCOMP.Value;
    dm1.cdsCntCajaDCFEMIS.Value :=  dm1.cdsRegCxPCPFEMIS.Value;
    dm1.cdsCntCajaDCFVCMTO.Value:=  dm1.cdsRegCxPCPFVCMTO.Value;
    dm1.cdsCntCajaCPTOID.Value  :=  dm1.cdsRegCxPCPTOID.Value;
    dm1.cdsCntCajaCUENTAID.Value:=  dm1.cdsRegCxPCUENTAID.Value;
    dm1.cdsCntCajaCLAUXID.Value :=  dm1.cdsEgrCajaCLAUXID.Value; //Aqui se toma de la cabecera
    dm1.cdsCntCajaDCAUXID.Value :=  dm1.cdsEgrCajaPROV.Value;    //Aqui se toma de la cabecera
    dm1.cdsCntCajaCCOSID.Value  :=  dm1.cdsRegCxPCCOSID.Value;
    dm1.cdsCntCajaDCDH.Value    :=  dm1.cdsRegCxPDEDH.Value;
    dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsRegCxPDETCPAG.Value;
    dm1.cdsCntCajaDCTCAMPR.Value:=  dm1.cdsRegCxPDETCDOC.Value;
    dm1.cdsCntCajaTMONID.Value  :=  dm1.cdsRegCxPTMONID.Value;
    dm1.cdsCntCajaDCMTOORI.Value:=  dm1.cdsRegCxPDEMTOORI.Value;
    if dm1.cdsRegCxPTMONID.Value = dm1.wtMonLoc then begin
       dm1.cdsCntCajaDCMTOLO.Value := dm1.cdsRegCxPDEMTOLOC.Value;
       dm1.cdsCntCajaDCMTOEXT.Value:= dm1.cdsRegCxPDEMTOLOC.Value / dm1.cdsRegCxPDETCDOC.Value;
    end
    else begin
       dm1.cdsCntCajaDCMTOEXT.Value:= dm1.cdsRegCxPDEMTOEXT.Value;
       dm1.cdsCntCajaDCMTOLO.Value := dm1.cdsRegCxPDEMTOEXT.Value * dm1.cdsRegCxPDETCDOC.Value;
    end;

    //dm1.cdsCntCajaDCESTADO.Value:=;
    dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
    //dm1.cdsCntCajaDCFLAAUT.Value:=;
    //dm1.cdsCntCajaDCUSER.Value  :=;
    //dm1.cdsCntCajaDCFREG.Value  :=;
    //dm1.cdsCntCajaDCHREG.Value  :=;
    dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsRegCxPDEANO.Value;
    dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsRegCxPDEMM.Value;
    dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsRegCxPDEDD.Value;
    dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsRegCxPDESS.Value;
    dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsRegCxPDESEM.Value;
    dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsRegCxPDETRI.Value;
    dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsRegCxPDEAASS.Value;
    dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsRegCxPDEAASEM.Value;
    dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsRegCxPDEAATRI.Value;
end;}

procedure TFExtChequesX.Contab_DifCambio;
var
    xDif_Camb : real;
begin
(*
    // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
    if dm1.cdsRegCxPDETCDOC.Value <> dm1.cdsRegCxPDETCPAG.Value then
    begin

       DM1.cdsCntCaja.Insert;

       dm1.cdsCntCajaCIAID.Value   :=  dm1.cdsRegCxPCIAID.Value;
       dm1.cdsCntCajaTDIARID.Value :=  dm1.cdsRegCxPTDIARID.Value;
       dm1.cdsCntCajaECANOMM.Value :=  dm1.cdsRegCxPECANOMM.Value;
       dm1.cdsCntCajaECNOCOMP.Value:=  dm1.cdsRegCxPECNOCOMP.Value;
       //dm1.cdsCntCajaDCLOTE.Value  :=  ;
       dm1.cdsCntCajaDOCID.Value   :=  dm1.cdsRegCxPDOCID2.Value;
       dm1.cdsCntCajaDCSERIE.Value :=  dm1.cdsRegCxPCPSERIE.Value;
       dm1.cdsCntCajaDCNODOC.Value :=  dm1.cdsRegCxPCPNODOC.Value;
       dm1.cdsCntCajaECFCOMP.Value :=  dm1.cdsRegCxPDEFCOMP.Value;
       dm1.cdsCntCajaDCFEMIS.Value :=  dm1.cdsRegCxPCPFEMIS.Value;
       dm1.cdsCntCajaDCFVCMTO.Value:=  dm1.cdsRegCxPCPFVCMTO.Value;
       dm1.cdsCntCajaCLAUXID.Value :=  dm1.cdsEgrCajaCLAUXID.Value; //Aqui se toma de la cabecera
       dm1.cdsCntCajaDCAUXID.Value :=  dm1.cdsEgrCajaPROV.Value;    //Aqui se toma de la cabecera
       dm1.cdsCntCajaCCOSID.Value  :=  dm1.cdsRegCxPCCOSID.Value;

       dm1.cdsCntCajaDCTCAMPA.Value:=  dm1.cdsRegCxPDETCPAG.Value;
       dm1.cdsCntCajaDCTCAMPR.Value:=  dm1.cdsRegCxPDETCDOC.Value;

       //dm1.cdsCntCajaDCESTADO.Value:=;
       dm1.cdsCntCajaDCFLACDR.Value:=  'S';   //Registro ya cuadrado
       //dm1.cdsCntCajaDCFLAAUT.Value:=;
       //dm1.cdsCntCajaDCUSER.Value  :=;
       //dm1.cdsCntCajaDCFREG.Value  :=;
       //dm1.cdsCntCajaDCHREG.Value  :=;
       dm1.cdsCntCajaDCANO.Value   :=  dm1.cdsRegCxPDEANO.Value;
       dm1.cdsCntCajaDCMM.Value    :=  dm1.cdsRegCxPDEMM.Value;
       dm1.cdsCntCajaDCDD.Value    :=  dm1.cdsRegCxPDEDD.Value;
       dm1.cdsCntCajaDCSS.Value    :=  dm1.cdsRegCxPDESS.Value;
       dm1.cdsCntCajaDCSEM.Value   :=  dm1.cdsRegCxPDESEM.Value;
       dm1.cdsCntCajaDCTRI.Value   :=  dm1.cdsRegCxPDETRI.Value;
       dm1.cdsCntCajaDCAASS.Value  :=  dm1.cdsRegCxPDEAASS.Value;
       dm1.cdsCntCajaDCAASEM.Value :=  dm1.cdsRegCxPDEAASEM.Value;
       dm1.cdsCntCajaDCAATRI.Value :=  dm1.cdsRegCxPDEAATRI.Value;
       //dm1.cdsCntCajaFLAGVAR.Value :=;}

       if dm1.cdsRegCxPTMONID.Value=dm1.wtMonLoc then
       begin   //Provision en Mon.Local
             xDif_Camb:= abs(dm1.cdsRegCxPDEMTOLOC.Value / dm1.cdsRegCxPDETCDOC.Value -
                             dm1.cdsRegCxPDEMTOLOC.Value / dm1.cdsRegCxPDETCPAG.Value);//En Mon.Ext.
             dm1.cdsCntCajaDCMTOEXT.Value := xDif_Camb;
             dm1.cdsCntCajaTMONID.Value   :=  dm1.wtMonExt;

             if dm1.cdsRegCxPDETCDOC.Value > dm1.cdsRegCxPDETCPAG.Value then
                dm1.cdsCntCajaDCDH.Value := 'D'
             else
                dm1.cdsCntCajaDCDH.Value := 'H';

       end
       else
       begin                                            //Provision en Mon.Ext.
             xDif_Camb:= abs(dm1.cdsRegCxPDEMTOEXT.Value * dm1.cdsRegCxPDETCDOC.Value -
                             dm1.cdsRegCxPDEMTOEXT.Value * dm1.cdsRegCxPDETCPAG.Value);//En Mon.Local
             dm1.cdsCntCajaDCMTOLO.Value := xDif_Camb;
             dm1.cdsCntCajaTMONID.Value  := dm1.wtMonLoc;

             if dm1.cdsRegCxPDETCDOC.Value > dm1.cdsRegCxPDETCPAG.Value then
                dm1.cdsCntCajaDCDH.Value := 'H'
             else
                dm1.cdsCntCajaDCDH.Value := 'D';
       end;
       if dm1.cdsCntCajaDCDH.Value = 'D' then
       begin
          dm1.cdsCntCajaCPTOID.Value  :=  dm1.wCptoPer;
          dm1.cdsCntCajaCUENTAID.Value:=  dm1.wCtaPer;
       end
       else
       begin
          dm1.cdsCntCajaCPTOID.Value  :=  dm1.wCptoGan;
          dm1.cdsCntCajaCUENTAID.Value:=  dm1.wCtaGan;
       end;
    end
*)
end;

procedure TFExtChequesX.z2bbtnContClick(Sender: TObject);
var
   xSQL : String;
begin
   if DM1.cdsEgrCajaECEstado.Value='C' then
   begin
     if MessageDlg('¿Contabilizar y Generar Asientos Automaticos?',mtConfirmation,
                  [mbYes, mbNo], 0)=mrYes then
     begin

       Contabiliza;             // Realiza la generacion del Asiento

       DM1.cdsEgrCaja.Edit;
       DM1.cdsEgrCajaECConta.Value:='S';   //Establece como Contabilizado el flag
       DM1.cdsEgrCaja.ApplyUpdates(0);

       {xSQL:='update CAJA302 SET ECCONTA=''S'' '+
                'WHERE CIAID='''+DBLCCIA.TEXT+''' AND ' +
                'ECANOMM='''+EDTPERIODO.TEXT+''' AND ' +
                'TDIARID='''+DBLCTDIARIO.TEXT+''' AND ' +
                'ECNOCOMP='''+DBENOCOMP.TEXT+'''';
       DM1.DCOM1.AppServer.EJECUTA(xSQL);
       }
       
       DM1.Contabiliza(dblccia.text,edtPeriodo.text,dblctdiario.Text,dbeNoComp.Text);
       Z2bbtnCont.Enabled := False;
       lblEstado.Caption  :='Cancelado y Contab.'
     end;
   end
   else
   begin
       ShowMessage('Imposible Contabilizar');
   end;
end;

procedure TFExtChequesX.z2bbtnAnulaClick(Sender: TObject);
begin
    if DM1.cdsEgrCajaECEstado.Value='I' then
    begin

      if MessageDlg('¿Anular Comprobante?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin

         DM1.cdsEgrCaja.CancelUpdates;
         //DM1.cdsRegCxP.CancelUpdates;

         DM1.cdsEgrCaja.Edit;
         DM1.cdsEgrCajaECEstado.Value:='A';

         //
         cdsExtorno.CloneCursor(dm1.cdsEgrCaja , True);
         //
         BuscaYActualizaMovAExtornar('');
         DM1.cdsEgrCaja.ApplyUpdates(0);

//         z2bbtnSumat.Enabled    := False;
         z2bbtnNuevo.Enabled    := True;
         z2bbtnCont.Enabled     := False;
         z2bbtnSube.Enabled     := False;
         z2bbtnGraba.Enabled    := False;
         z2bbtnCancelado.Enabled:= False;
         z2bbtnCancel2.Enabled  := False;
         z2bbtnAnula.Enabled    := False;
         lblEstado.Caption    :='Anulado            ';
      end;
    end
    else
    begin
       ShowMessage('Imposible Anular Comprobante');
    end;
end;

procedure TFExtChequesX.ActPnlBotones;
begin
//   z2bbtnSumat.Enabled    := wbSumat;
   z2bbtnCont.Enabled     := wbCont;
   z2bbtnNuevo.Enabled    := wbNuevo;
   z2bbtnImprime.Enabled  := wbImprime;
   z2bbtnSube.Enabled     := wbSube;
   z2bbtnGraba.Enabled    := wbGraba;
   z2bbtnCancelado.Enabled:= wbCancelado;
   z2bbtnCancel2.Enabled  := wbCancel2;
   z2bbtnAnula.Enabled    := wbAnula;
end;

procedure TFExtChequesX.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   DM1.cdsEgrCaja.CancelUpdates;
   DM1.cdsRegCxP.CancelUpdates;
//
//   LibConfigAccesos;
//
   // Limpiamos los filtros
//0405   DM1.cdsEgrCaja.Filtered  :=False;
//0405   DM1.cdsRegCxP.Filtered   :=False;
end;

procedure TFExtChequesX.dbdtpFComp2Exit(Sender: TObject);
begin
   dm1.cdsRegCxPCPANOMM.Value:=copy(datetostr(dm1.cdsRegCxPDEFCOMP.Value),7,4)
                              +copy(datetostr(dm1.cdsRegCxPDEFCOMP.Value),4,2);
end;

Procedure TFExtChequesX.LimpiaFiltros;
begin
   // Limpiando filtros si lo tuvieran
//   DM1.cdsEgrCaja.Filtered :=False;
//0405   DM1.cdsCntCaja.Filtered :=False;
{0405
   DM1.cdsRegCxP.Filtered  :=False;

   DM1.cdsRegCxP.Filter:='';
   DM1.cdsRegCxP.Filter:='CiaID='+''''+''+'''';
   DM1.cdsRegCxP.Filtered:=True;
}
   // 3004
   dm1.cdsRegCxP.Active := False ;
   dm1.cdsRegCxP.Params.ParamByName('CIAID').AsString := '' ;
   dm1.cdsRegCxP.Params.ParamByName('ECANOMM').AsString := '' ;
   dm1.cdsRegCxP.Params.ParamByName('TDIARID').AsString := '' ;
   dm1.cdsRegCxP.Params.ParamByName('ECNOCOMP').AsString := '' ;
   dm1.cdsRegCxP.Active := True ;
   // 3004

end;

Procedure TFExtChequesX.CambiaEstado(xName:char);
begin
   case xName of
     'I':begin  //Si está INCOMPLETO o PENDIENTE
            pnlBotones.Enabled   := True;
            pnlDocExtornar.Enabled := true;
            z2bbtnCheque.Enabled := true ;
            //
            z2bbtnCheque.Enabled := False;
            //
            lblEstado.Caption    :='Activo             ';
            pnlCabecera1.Enabled := False;

            wbSumat     := True;
            wbCont      := False;
            wbNuevo     := True;
            wbImprime   := True;
            wbSube      := True;
            wbGraba     := True;
            wbCancelado := True;
            wbCancel2   := True;
            wbAnula     := True;
         end;

     'C':begin
            pnlCabecera1.Enabled := False;    // Desactivar Panel1
//            pnlCabecera2.Enabled := False;    // Desactivar Panel2
            pnlBotones.Enabled   := True;     // Activar Panel de Botones


//            z2bbtnOk.Enabled       := False;
//            z2bbtnCancel.Enabled   := False;

            if DM1.cdsEgrCajaECConta.Value='S' then
            begin  //Esta contabilizado
               wbCont             := False;
               lblEstado.Caption  :='Cancelado y Contab.'
            end
            else
            begin
               wbCont             := True;
               lblEstado.Caption  :='Cancelado          ';
            end;
            wbSumat     := False;
            wbNuevo     := True;
            wbImprime   := True;
            wbSube      := False;
            wbGraba     := False;
            wbCancelado := False;
            wbCancel2   := False;
            wbAnula     := False;
         end;

     'A':begin
            lblEstado.Caption     :='Anulado            ';
            pnlCabecera1.Enabled := False;    // Desactivar Panel1
//            pnlCabecera2.Enabled := False;    // Desactivar Panel2
            pnlBotones.Enabled   := True;     // Activar Panel de Botones

//            z2bbtnOk.Enabled        := False;
//            z2bbtnCancel.Enabled    := False;

            wbSumat     := False;
            wbCont      := False;
            wbNuevo     := True;
            wbImprime   := True;
            wbSube      := False;
            wbGraba     := False;
            wbCancelado := False;
            wbCancel2   := False;
            wbAnula     := False;
         end;

     'N':begin
            pnlBotones.Enabled   := True;
            pnlDocExtornar.Enabled := true;
            z2bbtnCheque.Enabled := true ;
            lblEstado.Caption:='Nuevo     ';
            pnlCabecera1.Enabled := false;

            wbSumat     := True;
            wbCont      := False;
            wbImprime   := False;
            wbNuevo     := False;
            wbSube      := True;
            wbGraba     := True;
            wbCancelado := False;
            wbCancel2   := True;
            wbAnula     := False;
         end;
   end;
end;


procedure TFExtChequesX.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  begin
   key:=#0;
   perform(CM_DialogKey,VK_TAB,0);
  end;
end;

procedure TFExtChequesX.z2bbtnOKCabClick(Sender: TObject);
var
   xWhere : String;
begin
   if validacionCabecera=false then exit;
   with DM1 do
   begin
{0405
      cdsEgrCaja.SetKey;
      cdsEgrCajaCIAID.Value   :=dblcCia.Text;
      cdsEgrCajaTDIARID.Value :=dblcTDiario.Text;
      cdsEgrCajaECANOMM.Value :=edtPeriodo.Text;
      cdsEgrCajaECNOCOMP.Value:=dbeNoComp.Text;
      if cdsEgrCaja.GotoKey then begin
         Raise Exception.Create('Comprobante ya esta registrado por otro Modulo');
      end
}
      xWhere :=  'CIAID ='+''''+        dblcCia.Text +  ''''
                +' AND TDIARID ='+''''+ dblcTDiario.Text+''''
                +' AND ECANOMM ='+''''+ edtPeriodo.Text+''''
                +' AND ECNOCOMP ='+''''+dbeNoComp.Text +'''';

      if dm1.RecuperarDatos('CAJA302','*',xWhere) then
      begin
          ShowMessage('Comprobante ya esta registrado');
          dbeNoComp.Text:='';
          dbeNoComp.SetFocus;
          exit;
      end
      else
      begin
        cdsEgrCaja.Insert;
        CambiaEstado('N');
        ActPnlBotones;

      end;
   end;
   (Sender as tcontrol).enabled:=false;
   wmodifica:=False;
end;

procedure TFExtChequesX.dbeNoCompExit(Sender: TObject);
begin
   If xCrea then Exit;

   dbeNoComp.text:=DM1.StrZero(dbeNoComp.text,DM1.cdsEgrCajaECNOCOMP.DisplayWidth);
end;

procedure TFExtChequesX.EdiTarRegistros;
begin
dm1.cdsRegCxP.Edit;    //Lo pongo en modo de edicion
//dbeNoReg.Text:=dm1.cdsRegCxPCPNoReg.Value  ;
//dbeNoReg.Enabled:=false;
//label1.Visible := True;
//label1.Caption := 'En Edicion';
//dbeNoReg.Enabled := False;
//dbeNoReg.Color   := clBtnFace;
end;

procedure TFExtChequesX.AdicionarRegistros;
var
xWhere,Aux :String;
begin
  with DM1 do
  begin
//             dbeNoReg.Enabled:=true;
//             dbeNoReg.Text:='';

             dm1.cdsRegCxP.Insert;
             dm1.cdsRegCxPCIAID.Value   := dblcCia.Text;
             dm1.cdsRegCxPTDIARID.Value := dblcTDiario.Text;
             dm1.cdsRegCxPECANOMM.Value := edtPeriodo.Text;
             dm1.cdsRegCxPECNOCOMP.Value:= dbeNoComp.Text;
             // Iniciar Datos, el reg. y su llave ya estan creados
//             cdsRegCxPCPNoReg.Value  := dbeNoReg.Text;
//             cdsRegCxPDETCPAG.Value  := strtofloat(dbeTCambio.Text);
             cdsRegCxPDEFCOMP.Value  := cdsEgrCajaECFCOMP.Value;
             cdsRegCxPCPFEMIS.Value  := Date;
             cdsRegCxPCPFVCMTO.Value := Date;
             cdsRegCxPCPANOMM.Value  := copy(datetostr(cdsRegCxPDEFCOMP.Value),7,4)
                                       +copy(datetostr(cdsRegCxPDEFCOMP.Value),4,2);
             cdsRegCxPDETCPAG.Value  := cdsEgrCajaECTCAMB.Value;
             cdsRegCxPDETCDOC.Value  := cdsEgrCajaECTCAMB.Value;
             cdsRegCxPDEDH.Value     := 'D';     //Inicializo en Debe
             //DATE(''' + formatdatetime('yyyy-mm-dd',cdsRegCxPDEFComp.AsDateTime)+''')' ;
             xWhere:='FECHA=DATE(''' + formatdatetime('yyyy-mm-dd',cdsRegCxPDEFComp.AsDateTime)+''')' ;
             aux   :=DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
             cdsRegCxPDEANO.Value  := cdsqry.FieldByName('FecAno').Value;
             cdsRegCxPDEMM.Value   := cdsqry.FieldByName('FecMes').Value;
             cdsRegCxPDEDD.Value   := cdsqry.FieldByName('FecDia').Value;
             cdsRegCxPDESS.Value   := cdsqry.FieldByName('FecSS').Value;
             cdsRegCxPDESEM.Value  := cdsqry.FieldByName('FecSem').Value;
             cdsRegCxPDETRI.Value  := cdsqry.FieldByName('FecTrim').Value;
             cdsRegCxPDEAASS.Value := cdsqry.FieldByName('FecAASS').Value;
             cdsRegCxPDEAASem.Value:= cdsqry.FieldByName('FecAASem').Value;
             cdsRegCxPDEAATri.Value:= cdsqry.FieldByName('FecAATri').Value;
   end;
//   dbeNoReg.SetFocus;
//             label1.Visible := True;
//             label1.Caption := 'Nuevo     '
end;

procedure TFExtChequesX.LiberarFiltrosRegistroEgresos;
begin
   dm1.cdsTDoc.Filter:='';
   dm1.cdsTDoc.Filtered:=true;
   dm1.cdsTDiario.Filter:='';
   dm1.cdsTDiario.Filtered:=true;

end;

procedure TFExtChequesX.EstablecerFiltrosRegistroEgresos;
begin
      dm1.cdsTDoc.Filter:='not ( tdiarid is null) or not (tdiarid2 is null)' ;
      dm1.cdsTDoc.Filtered:=true;

end;

procedure TFExtChequesX.dblcTMon2Exit(Sender: TObject);
var xWhere, aux: string;
begin
      xWhere:='TMONID='+''''+DM1.cdsRegCxPTMONID.Value+'''';
      aux:=DM1.DisplayDescrip('prvTGE','TGE103','*',xWhere,'TMONDES');
      if (length(aux)>0) and (DM1.cdsRegCxPDEMTOORI.Value>0) then
      begin
        if DM1.cdsRegCxPTMONID.Value = dm1.wTMonLoc then
        begin
           DM1.cdsRegCxPDEMTOLOC.Value:=DM1.cdsRegCxPDEMTOORI.Value;
           DM1.cdsRegCxPDEMTOEXT.Value:=DM1.cdsRegCxPDEMTOORI.Value/DM1.cdsEgrCajaECTCAMB.Value;
        end
        else
        begin
           DM1.cdsRegCxPDEMTOLOC.Value:=DM1.cdsRegCxPDEMtoOri.Value*DM1.cdsEgrCajaECTCAMB.Value;
           DM1.cdsRegCxPDEMTOEXT.Value:=DM1.cdsRegCxPDEMtoOri.Value;
        end;
      end
      else
      begin
           DM1.cdsRegCxPDEMTOLOC.Value:=0;
           DM1.cdsRegCxPDEMTOEXT.Value:=0;
      end;
end;


procedure TFExtChequesX.z2bbtnChequeClick(Sender: TObject);
begin
 ldlgCheque.Execute
end;

procedure TFExtChequesX.ldlgChequeUserButton1Click(Sender: TObject;
   LookupTable: TDataSet);
begin
   (Sender as TForm).ModalResult := mrOK;
end;

procedure TFExtChequesX.ldlgChequeCloseDialog(Dialog: TwwLookupDlg);
begin
if dialog.ModalResult=mrOk then
begin
   with cdsExtorno do
   begin
      RecuperarMovAExtornar(FieldByName('CIAID').AsString,
                            FieldByName('TDIARID').AsString,
                            FieldByName('ECANOMM').AsString,
                            FieldByName('ECNOCOMP').AsString);

      xCiaId1   :=FieldByName('CIAID').AsString;
      xTDiarId1 :=FieldByName('TDIARID').AsString;
      xEcaNom1  :=FieldByName('ECANOMM').AsString;
      xEcNocomp1:=FieldByName('ECNOCOMP').AsString;
   end;
   Z2bbtnCancel5.Enabled   := True;
   Z2bbtnOk.Enabled        := True;
   z2bbtnGraba.Enabled     := True;
   Z2bbtnSube.Enabled      := True;
   Z2bbtnCancel2.Enabled   := True;
   Z2bbtnOK.SetFocus;
end
end;

procedure TFExtChequesX.ldlgChequeUserButton2Click(Sender: TObject;
  LookupTable: TDataSet);
begin
(Sender as TForm).ModalResult := mrCancel;
end;


procedure TFExtChequesX.z2bbtnGrabaClick(Sender: TObject);
var
   xWhere , Aux : String ;
begin

  if stNoChq.Caption='' then
  begin
       ShowMessage('Ingrese Movimiento a Extornar');
       z2bbtnCheque.SetFocus;
       exit;
  end;

  if not validacionMovimiento then exit;
////////////////////////////////////
   // En este punto ya se ha probado todas las consistencias y ya se puede grabar

   // Actualizamos el Client Data Set de Egr.Caja (CAJA302)

   with DM1 do
   begin
     cdsEgrCaja.Edit;
     cdsEgrCajaCIAID.Value   :=dblcCia.Text;
     cdsEgrCajaTDIARID.Value :=dblcTDiario.Text;
     cdsEgrCajaECANOMM.Value :=edtPeriodo.Text;
     cdsEgrCajaECNOCOMP.Value:=dbeNoComp.Text;

     // Comprobante del documento extornado

     cdsEgrCajaTDIARIO2.Value := stTDiario.Caption ; //  dblcTDiario.Text;
     cdsEgrCajaECANOMM2.Value := stPeriodo.Caption ; //  edtPeriodo.Text;
     cdsEgrCajaECNOCOMP2.Value:= stNoComp.Caption ;  //  dbeNoComp.Text;

{     cdsEgrCajaECOPAGO.Value:= dblcOPago.Text;
     cdsEgrCajaCLAUXID.Value :=dbeClase1.Text;
     cdsEgrCajaPROV.Value    :=dbeProv.Text;
     cdsEgrCajaPROVRUC.Value :=dbeProvRuc.Text;	}
     cdsEgrCajaECFCOMP.Value :=dbdtpFComp.Date;
{    cdsEgrCajaFPAGOID.Value:=dblcFormPago.Text;
     cdsEgrCajaDOCID.Value   :=dblcTDoc.Text;
     cdsEgrCajaECNODOC.Value :=dbeNoDoc.Text;	}

     cdsEgrCajaTMONID.Value     :=stTMon.Caption;
     cdsEgrCajaECTCAMB.Asstring :=stTCambio.Caption;
     cdsEgrCajaECMTOORI.Asstring:=stImporte.Caption;
     cdsEgrCajaECMTOLOC.Value   :=DM1.cdsRegCxPDEMTOLOC.Value;
     cdsEgrCajaECMTOEXT.Value   :=DM1.cdsRegCxPDEMTOEXT.Value;

///     cdsEgrCajaBANCOID.Value :=dblcBanco.Text;
///     cdsEgrCajaCCBCOID.Value :=dblcCCBco.Text;
///     cdsEgrCajaECNOCHQ.Value :=dbeNoChq.Text;
///     cdsEgrCajaECGIRA.Value  :=dbeGiradoA.Text;
///     cdsEgrCajaCPTOID.Value  :=dblcdCnp.Text;
///     cdsEgrCajaCUENTAID.Value:=edtCuenta.Text;
///     cdsEgrCajaECGLOSA.Value :=dbeGlosa.Text;
     cdsEgrCajaECESTADO.Value :='I';
     //DATE(''' + formatdatetime('yyyy-mm-dd',dbdtpFComp.Date)+''')' ;
     xWhere:='FECHA=DATE(''' + formatdatetime('yyyy-mm-dd',dbdtpFComp.Date)+''')' ;
     aux   :=DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
     cdsEgrCajaECANO.Value  := cdsqry.FieldByName('FecAno').Value;
     cdsEgrCajaECMM.Value   := cdsqry.FieldByName('FecMes').Value;
     cdsEgrCajaECDD.Value   := cdsqry.FieldByName('FecDia').Value;
     cdsEgrCajaECSS.Value   := cdsqry.FieldByName('FecSS').Value;
     cdsEgrCajaECSEM.Value  := cdsqry.FieldByName('FecSem').Value;
     cdsEgrCajaECTRI.Value  := cdsqry.FieldByName('FecTrim').Value;
     cdsEgrCajaECAASS.Value := cdsqry.FieldByName('FecAASS').Value;
     cdsEgrCajaECAASem.Value:= cdsqry.FieldByName('FecAASem').Value;
     cdsEgrCajaECAATri.Value:= cdsqry.FieldByName('FecAATri').Value;
     cdsEgrCajaEC_PROCE.Value:='8';
     cdsEgrCajaEC_IE.Value   :='I';
   end;

   // Estado de los componentes
{   pnlCabecera1.enabled  := False;
   pnlCabecera2.enabled  := False;
   pnlDetalle.enabled    := True;
   pnlBotones.Enabled    := True;
   ActPnlBotones;
   // Estado de los botones
   z2bbtnOk.Enabled        := False;
   z2bbtnCancel.Enabled    := False;}

////////////////////////////////////

 //
 //
   
  DM1.cdsRegCxP.First;
  while not DM1.cdsRegCxP.Eof do
  begin
     DM1.cdsRegCxP.Insert;
     DM1.cdsRegCxPCIAID.Value   :=dblcCia.Text;
     DM1.cdsRegCxPTDIARID.Value :=dblcTDiario.Text;
     DM1.cdsRegCxPECANOMM.Value :=edtPeriodo.Text;
     DM1.cdsRegCxPECNOCOMP.Value:=dbeNoComp.Text;
     DM1.cdsRegCxPTDIARID2.Value:=DM1.cdsRegCxPTDIARID2.Value;
     DM1.cdsRegCxPCPANOMM.Value :=DM1.cdsRegCxPCPANOMM.Value;
     DM1.cdsRegCxPCPNOREG.Value :=DM1.cdsRegCxPCPNOREG.Value;
     DM1.cdsRegCxPDOCID2.Value  :=DM1.cdsRegCxPDOCID2.Value;
     DM1.cdsRegCxPCPSERIE.Value :=DM1.cdsRegCxPCPSERIE.Value;
     DM1.cdsRegCxPCPNODOC.Value :=DM1.cdsRegCxPCPNODOC.Value;
     DM1.cdsRegCxPTMONID.Value  :=DM1.cdsRegCxPTMONID.Value;
     DM1.cdsRegCxPDEFCOMP.Value :=DM1.cdsRegCxPDEFCOMP.Value;
     DM1.cdsRegCxPDETCDOC.Value :=DM1.cdsRegCxPDETCDOC.Value;
     DM1.cdsRegCxPDETCPAG.Value :=DM1.cdsRegCxPDETCPAG.Value;
     DM1.cdsRegCxPDEMTOORI.Value:=DM1.cdsRegCxPDEMTOORI.Value;
     DM1.cdsRegCxPDEMTOLOC.Value:=DM1.cdsRegCxPDEMTOLOC.Value;
     DM1.cdsRegCxPDEMTOEXT.Value:=DM1.cdsRegCxPDEMTOEXT.Value;
     DM1.cdsRegCxPDESALLOC.Value:=DM1.cdsRegCxPDESALLOC.Value;
     DM1.cdsRegCxPDESALEXT.Value:=DM1.cdsRegCxPDESALEXT.Value;
     DM1.cdsRegCxPCPTOID.Value  :=DM1.cdsRegCxPCPTOID.Value;
     DM1.cdsRegCxPCUENTAID.Value:=DM1.cdsRegCxPCUENTAID.Value;
     DM1.cdsRegCxPCCOSID.Value  :=DM1.cdsRegCxPCCOSID.Value;
     DM1.cdsRegCxPCPFEMIS.Value :=DM1.cdsRegCxPCPFEMIS.Value;
     DM1.cdsRegCxPCPFVCMTO.Value:=DM1.cdsRegCxPCPFVCMTO.Value;
     DM1.cdsRegCxPDEANO.Value   :=DM1.cdsRegCxPDEANO.Value;
     DM1.cdsRegCxPDEMM.Value    :=DM1.cdsRegCxPDEMM.Value;
     DM1.cdsRegCxPDEDD.Value    :=DM1.cdsRegCxPDEDD.Value;
     DM1.cdsRegCxPDESS.Value    :=DM1.cdsRegCxPDESS.Value;
     DM1.cdsRegCxPDESEM.Value   :=DM1.cdsRegCxPDESEM.Value;
     DM1.cdsRegCxPDETRI.Value   :=DM1.cdsRegCxPDETRI.Value;
     DM1.cdsRegCxPDEAASS.Value  :=DM1.cdsRegCxPDEAASS.Value;
     DM1.cdsRegCxPDEAASEM.Value :=DM1.cdsRegCxPDEAASEM.Value;
     DM1.cdsRegCxPDEAATRI.Value :=DM1.cdsRegCxPDEAATRI.Value;
     DM1.cdsRegCxPFLAGVAR.Value :=DM1.cdsRegCxPFLAGVAR.Value;
     DM1.cdsRegCxPECOPAGO.Value :=DM1.cdsRegCxPECOPAGO.Value;
     DM1.cdsRegCxPDEESTADO.Value:=DM1.cdsRegCxPDEESTADO.Value;
     DM1.cdsRegCxPPROV.Value    :=DM1.cdsRegCxPPROV.Value;
     DM1.cdsRegCxPPROVRUC.Value :=DM1.cdsRegCxPPROVRUC.Value;
     DM1.cdsRegCxPDEGIRA.Value  :=DM1.cdsRegCxPDEGIRA.Value;
     DM1.cdsRegCxPCLAUXID.Value :=DM1.cdsRegCxPCLAUXID.Value;

     if DM1.cdsRegCxPDEDH.Value='D' then
        DM1.cdsRegCxPDEDH.Value    :='H'
     else
        DM1.cdsRegCxPDEDH.Value    :='D';

     DM1.cdsRegCxP.Post;
     DM1.cdsRegCxP.Next;
  end;


  if DM1.cdsEgrCajaECEstado.Value='I' then
  begin
     if MessageDlg('¿Grabar?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
     begin
        //
        cdsExtorno.CloneCursor(dm1.cdsEgrCaja , True);
        //
        BuscaYActualizaMovAExtornar('EXT');
        DM1.cdsEgrCaja.ApplyUpdates(0);
//        DM1.cdsRegCxP.ApplyUpdates(0);
//        z2bbtnSumatClick(sender);
        ShowMessage('Grabacion OK');
        z2bbtnNuevo.Enabled    := True;
        z2bbtnCancelado.Enabled:= True;
        z2bbtnAnula.Enabled    := True;
        z2bbtnImprime.Enabled  := True;
        wmodifica:=False;
     end
  end
  else
  begin
      ShowMessage('Imposible Grabar');
  end;
end;

procedure TFExtChequesX.RecuperarMovAExtornar(xCIAID,xTDIARID,xECANOMM,xECNOCOMP : String);
var
   xSQL : String ;
begin
     DM1.DCOM1.Appserver.AsignaSQLExtorno(xCIAID,xTDIARID,xECANOMM,xECNOCOMP ) ;

 {    XSQL:= ' SELECT CAJA302.CIAID,	CAJA302.TDIARID, 	CAJA302.ECANOMM, '+
            '        CAJA302.ECNOCOMP,	CAJA302.CLAUXID, 	CAJA302.ECFCOMP, ' +
            '        CAJA302.PROV, 	CAJA302.PROVRUC, 	CAJA302.ECGIRA,  ' +
            '        CAJA302.TMONID,	CAJA302.ECTCAMB, 	CAJA302.ECMTOORI, ' +
            '        CAJA302.DOCID, 	CAJA302.ECNODOC, 	CAJA302.BANCOID,  ' +
            '        CAJA302.CCBCOID, 	CAJA302.CUENTAID, 	CAJA302.ECNOCHQ,  ' +
            '        CAJA302.ECLOTE,	CAJA302.CPTOID, 		CAJA302.ECGLOSA, ' +
            '        TGE101.CIADES, 	TGE104.TDIARDES, 	TGE110.DOCDES, ' +
            '        TGE103.TMONDES, TGE105.BANCONOM, 	TGE106.CCBCODES, ' +
            '        TGE102.CLAUXDES ' +
            ' FROM CAJA302  ' +
            '    LEFT OUTER JOIN TGE101 ' +
            '    ON  ( CAJA302.CIAID =TGE101.CIAID) ' +
            '    LEFT OUTER JOIN TGE104 ' +
            '    ON  (CAJA302.TDIARID =TGE104.TDIARID ) ' +
            '    LEFT OUTER JOIN TGE110 ' +
            '    ON  ( CAJA302.DOCID=TGE110.DOCID ) ' +
            '    LEFT OUTER JOIN TGE103 ' +
            '    ON  ( CAJA302.TMONID =TGE103.TMONID) ' +
            '    LEFT OUTER JOIN TGE105 ' +
            '    ON  (CAJA302.BANCOID=TGE105.BANCOID  ) ' +
            '    LEFT OUTER JOIN TGE106 ' +
            '    ON  (CAJA302.CCBCOID= TGE106.CCBCOID ) ' +
            '    LEFT OUTER JOIN TGE102 ' +
            '    ON  ( CAJA302.CLAUXID=TGE102.CLAUXID ) ' +
            ' WHERE  CAJA302.CIAID= ''' + xCIAID +''' AND  ' +
            '        CAJA302.TDIARID=''' + xTDIARID +'''  AND  ' +
            '        CAJA302.ECANOMM=''' + xECANOMM +'''  AND ' +
            '        CAJA302.ECNOCOMP=''' + xECNOCOMP +''' ';}

{   DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   if DM1.cdsEjecutaQuery.Active then
      DM1.cdsEjecutaQuery.Active:=False;
   DM1.cdsEjecutaQuery.Active:=TRUE;
   with DM1.cdsEjecutaQuery do}

   DM1.cdsRec.Active:=False;
   DM1.cdsRec.Active:=TRUE;
   with DM1.cdsRec do
   begin
       if RecordCount<>0 then
         begin
             if ( (FieldByName('CIAID').AsString = stCia.Caption) AND
                (FieldByName('TDIARID').AsString = stTDiario.Caption) AND
                (FieldByName('ECANOMM').AsString = stPeriodo.Caption) AND
                (FieldByName('ECNOCOMP').AsString = stNoComp.Caption )) then// OR
                //(stCia.Caption='') then
                exit
             else
             begin
             //aqui se siguen las operaciones

                stTDiarioDes.Caption:=FieldByName('TDIARABR').AsString;
                stTDiario.Caption   :=FieldByName('TDIARID').AsString;
                stPeriodo.Caption   :=FieldByName('ECANOMM').AsString;
                stFComp.Caption     :=FieldByName('ECFCOMP').AsString;
                stCiaDes.Caption    :=FieldByName('CIADES').AsString;
                stCia.Caption       :=FieldByName('CIAID').AsString;
                stNoComp.Caption    :=FieldByName('ECNOCOMP').AsString;
                stGiradoA.Caption   :=FieldByName('ECGIRA').AsString;
                stProvRUC.Caption   :=FieldByName('PROVRUC').AsString;
                stProv.Caption      :=FieldByName('PROV').AsString;
                stClaseDes.Caption  :=FieldByName('CLAUXABR').AsString;
                stClase.Caption     :=FieldByName('CLAUXID').AsString;
                stNoDoc.Caption     :=FieldByName('ECNODOC').AsString;
                stTDocDes.Caption   :=FieldByName('DOCDES').AsString;
                stTDoc.Caption      :=FieldByName('DOCID').AsString;
                stImporte.Caption   :=FieldByName('ECMTOORI').AsString;
                stTCambio.Caption   :=FieldByName('ECTCAMB').AsString;
                stTMonDes.Caption   :=FieldByName('TMONABR').AsString;
                stTMon.Caption      :=FieldByName('TMONID').AsString;
                stCuenta.Caption    :=FieldByName('CUENTAID').AsString;
                stCCBcoDes.Caption  :=FieldByName('CCBCODES').AsString;
                stCCBco.Caption     :=FieldByName('CCBCOID').AsString;
                stBancoDes.Caption  :=FieldByName('BANCOABR').AsString;
                stBanco.Caption     :=FieldByName('BANCOID').AsString;
                stGlosa.Caption     :=FieldByName('ECGLOSA').AsString;
                stCnp.Caption       :=FieldByName('CPTOID').AsString;
                stLote.Caption      :=FieldByName('ECLOTE').AsString;
                stNoChq.Caption     :=FieldByName('ECNOCHQ').AsString;

             end
       end;
    end;

end;

procedure TFExtChequesX.FormShow(Sender: TObject);
begin
//0405   DM1.cdsEgrCaja.IndexFieldNames  :='CiaID;TDiarID;ECAnoMM;ECNoComp';
//0405   DM1.cdsRegCxP.IndexFieldNames   :='CiaID;TDiarID;ECAnoMM;ECNoComp;CPNoReg';
//0405   IniciaDatos;

  cdsExtorno :=  TwwClientDataSet.Create(self);
  cdsExtorno.CloneCursor(dm1.cdsEgrCaja , True);
  ldlgCheque.LookupTable:=cdsExtorno;


end;


Function TFExtChequesX.validacionCabecera:Boolean;
begin
     result:=false;
     if trim(dblccia.text)='' then
     begin

     end;
     if dbdtpFComp.Date=0 then
     begin
          ShowMessage('Ingrese Fecha de Comprobante');
          dbdtpFComp.SetFocus;
          exit;
     end;
     if trim(edtPeriodo.text)='' then
     begin
          ShowMessage('Ingrese Fecha de Comprobante');
          dbdtpFComp.SetFocus;
          exit;
     end;
     if trim(dblcTDiario.text)='' then
     begin
          ShowMessage('Ingrese Tipo de Diario');
          dblcTDiario.SetFocus;
          exit;
     end;
     if trim(edtTDiario.text)='' then
     begin
          ShowMessage('Ingrese Tipo de Diario');
          dblcTDiario.SetFocus;
          exit;
     end;
     if trim(dbeNocomp.text)='' then
     begin
          ShowMessage('Ingrese Número de Comprobante');
          dbeNocomp.SetFocus;
          exit;
     end;

     //si llega aqui es true
     result:=true;
end;

function TFExtChequesX.ValidacionMovimiento: Boolean;
begin
   Result:= False ;
 // consistencia de Datos

   Result := True;

end;

procedure TFExtChequesX.z2bbtnImprimeClick(Sender: TObject);
var
   Comprobante : RCabComprobante;
begin
   with Comprobante do
   begin
      CIAID  := dblcCia.Text ;
      TDIARID:= dblcTDiario.Text ;
      CiaDes := edtCia.Text ;
      Diario := edtTDiario.Text ;
      Proveedor := '' ; //edtClie.Text ;
      Glosa  := stGlosa.Caption ;
      Lote   := stLote.Caption ;
      TipoDoc := stTDoc.Caption;
      TipoCamb:= stTCambio.Caption ;
      Periodo:= edtPeriodo.Text ;
      NoComp := dbeNoComp.Text ;
      NoDoc  := stNoDoc.Caption ;
      //nuevos
      Cuenta := stCuenta.Caption ;
      Banco  := stBanco.Caption ;
      NumChq := stNoChq.Caption ;
      Moneda := stTMon.Caption ;
      //
   end;
   Fprincipal.ImprimirComprobante(Comprobante);
end;

procedure TFExtChequesX.BuscaYActualizaMovAExtornar(xStr : String);
var
   xSQL : String ;
begin

    with cdsExtorno do
    begin
      if Locate('CIAID;TDIARID;ECANOMM;ECNOCOMP',
                                 varArrayof([stCia.Caption,stTDiario.Caption,stPeriodo.Caption ,stNoComp.Caption]),[]) then
      begin
          edit;
          fieldbyname('ECANOMM2').AsString  :=xStr;
          post;
          //applyUpdates(0);
      end
      else
          showmessage('Mensaje para William'+ #13+
                      'No se Encontró el documento a extornar');
    end;


    //Reemplazar por ejecuta query

  {  xSQL := ' UPDATE CAJA302 SET ECANOMM2=''EXT'' ' +
            ' WHERE  CIAID = '''+stCia.Caption + '''' +
            '        TDIARID = '''+stTDiario.Caption + '''' +
            '        ECANOMM = '''+stPeriodo.Caption + '''' +
            '        ECNOCOMP = '''+stNoComp.Caption + '''' ;

    DM1.DCOM1.AppServer.EjecutaSQL(xSQL);}


{
    with cdsExtorno do
    begin
      SetKey;
      fieldbyname('CIAID').AsString    :=stCia.Caption;
      fieldbyname('TDIARID').AsString  :=stTDiario.Caption;
      fieldbyname('ECANOMM').AsString  :=stPeriodo.Caption;
      fieldbyname('ECNOCOMP').AsString :=stNoComp.Caption;
      if GotoKey then
      begin
          edit;
          //fieldbyname('ECESTADO').AsString    :='A';
          fieldbyname('ECANOMM2').AsString  :='EXT';
          post;
          applyUpdates(0);
      end
      else
          showmessage('Mensaje para William'+ #13+
                      'No se Encontró el documento a extornar');
    end;}


end;

procedure TFExtChequesX.ldlgChequeInitDialog(Dialog: TwwLookupDlg);
var
   xFiltro : String;
begin

   xFiltro := ' ECESTADO=''C'' AND ' +
              ' TRIM(ECNOCHQ)<>''''  AND ' +
              ' ECANOMM2<>''EXT'' AND ' +
              ' EC_IE=''E'' ' ;
   cdsExtorno.Filter := xFiltro;
   cdsExtorno.Filtered := True ;
end;

procedure TFExtChequesX.Z2bbtnCancel5Click(Sender: TObject);
begin
   if MessageDlg('¿Anular los cambios?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin
      DM1.cdsEgrCaja.CancelUpdates;
      IniciaDatos2;
   end;
end;

procedure TFExtChequesX.IniciaDatos2;
begin
    stTDiarioDes.Caption :='';
    stTDiario.Caption :='';
    stPeriodo.Caption :='';
    stFComp.Caption :='';
    stCiaDes.Caption :='';
    stCia.Caption :='';
    stNoComp.Caption :='';
    stGiradoA.Caption :='';
    stProvRUC.Caption :='';
    stProv.Caption :='';
    stClaseDes.Caption :='';
    stClase.Caption :='';
    stNoDoc.Caption :='';
    stTDocDes.Caption :='';
    stTDoc.Caption :='';
    stImporte.Caption :='';
    stTCambio.Caption :='';
    stTMonDes.Caption :='';
    stTMon.Caption :='';
    stCuenta.Caption :='';
    stCCBcoDes.Caption :='';
    stCCBco.Caption :='';
    stBancoDes.Caption :='';
    stBanco.Caption :='';
    stGlosa.Caption :='';
    stCnp.Caption :='';
    stLote.Caption :='';
    stNoChq.Caption :='';
   //dblcdCCosto.Text:='';

   lblEstado.Caption := '';   //Inicializar el Estado
   wmodifica         := False;
   z2bbtnCheque.Enabled   := True;
   Z2bbtnCancel5.Enabled  := False;
   Z2bbtnOk.Enabled       := False;
   z2bbtnGraba.Enabled    := False;
   Z2bbtnSube.Enabled     := False;
   Z2bbtnCancel2.Enabled  := False;
end;

procedure TFExtChequesX.Z2bbtnOKClick(Sender: TObject);
//var
//   xSQL : String
begin
  { xSQL := ' Select * From CAJA301'
          +' Where CIAID='+''''+xCiaId1+''''
          +' and TDIARID='+''''+xTDiarId1+''''
          +' and ECANOMM='+''''+xEcaNom1+''''
          +' and ECNOCOMP='+''''+xEcNocomp1+'''';
   DM1.cdsRegCxp.Close;              // Cierra Cds para cambiar propiedades
   DM1.cdsRegCxp.DataRequest(xSQL);  // Renueva Sentencia SQL desde la Aplic. Servidor
   DM1.cdsRegCxp.Open;               // Abre cds con el Filtro
   }
{0405
   DM1.cdsRegCxP.Filtered:=False;
   DM1.cdsRegCxP.Filter:='';
   DM1.cdsRegCxP.Filter:=' CIAID='+''''+xCiaId1+''''
                        +' and TDIARID='+''''+xTDiarId1+''''
                        +' and ECANOMM='+''''+xEcaNom1+''''
                        +' and ECNOCOMP='+''''+xEcNocomp1+'''';
   DM1.cdsRegCxP.Filtered:=True;
}
   //0405
   dm1.cdsRegCxP.Active := False ;
   dm1.cdsRegCxP.Params.ParamByName('CIAID').AsString := dblcCia.Text ;
   dm1.cdsRegCxP.Params.ParamByName('ECANOMM').AsString := stPeriodo.Caption ;
   dm1.cdsRegCxP.Params.ParamByName('TDIARID').AsString := stTDiario.Caption ;
   dm1.cdsRegCxP.Params.ParamByName('ECNOCOMP').AsString := stNoComp.Caption ;
   dm1.cdsRegCxP.Active := True ;
   //
   dbgExtorno.SetFocus;

   z2bbtnCheque.Enabled    := False;
   Z2bbtnCancel5.Enabled   := False;
   Z2bbtnOk.Enabled        := False;
end;

procedure TFExtChequesX.FormActivate(Sender: TObject);
begin
   xCrea := True;

   if DM1.wModo='A' then
   begin
        DM1.cdsEgrCaja.Insert;
//        CambiaEstado('N');
        IniciaDatos;
        ActPnlBotones;
   end
   else
   begin
      dblcCia.Text     := DM1.cdsEgrCajaCIAID.Value;
      dblcTDiario.Text := DM1.cdsEgrCajaTDIARID.Value;
      edtPeriodo.Text  := DM1.cdsEgrCajaECANOMM.Value;
      dbeNoComp.Text   := DM1.cdsEgrCajaECNOCOMP.Value;
      MuestraDatos;
   end;
   xCrea := False;
//
//   ConfiguraAccesos ;
//   
end;

procedure TFExtChequesX.MuestraDatos;
begin
   with DM1.cdsEgrCaja do
   begin
      RecuperarMovAExtornar(FieldByName('CIAID').AsString,
                            FieldByName('TDIARIO2').AsString,
                            FieldByName('ECANOMM2').AsString,
                            FieldByName('ECNOCOMP2').AsString);
     end;

     if DM1.cdsEgrCajaECEstado.Value='I' then //Si está INCOMPLETO o PENDIENTE
     begin
        DM1.cdsEgrCaja.Edit;
        CambiaEstado ('I');
        ActPnlBotones;
     end;

     if DM1.cdsEgrCajaECEstado.Value='C' then      //Si está CANCELADO
     begin
        CambiaEstado('C');
        ActPnlBotones;
     end;

     if DM1.cdsEgrCajaECEstado.Value='A' then      // Si esta ANULADO
     begin
        CambiaEstado('A');
        ActPnlBotones;
     end;
{0405
   DM1.cdsRegCxP.Filtered:=False;
   DM1.cdsRegCxP.Filter:='';
   DM1.cdsRegCxP.Filter:=' CIAID='       +''''+DM1.cdsEgrCaja.FieldByName('CIAID').AsString+''''
                        +' and TDIARID=' +''''+DM1.cdsEgrCaja.FieldByName('TDIARIO2').AsString+''''
                        +' and ECANOMM=' +''''+DM1.cdsEgrCaja.FieldByName('ECANOMM2').AsString+''''
                        +' and ECNOCOMP='+''''+DM1.cdsEgrCaja.FieldByName('ECNOCOMP2').AsString+'''';
   DM1.cdsRegCxP.Filtered:=True;
}
   //0405
   dm1.cdsRegCxP.Active := False ;
   dm1.cdsRegCxP.Params.ParamByName('CIAID').AsString := dblcCia.Text ;
   dm1.cdsRegCxP.Params.ParamByName('ECANOMM').AsString := edtPeriodo.Text ;
   dm1.cdsRegCxP.Params.ParamByName('TDIARID').AsString := dblcTDiario.Text ;
   dm1.cdsRegCxP.Params.ParamByName('ECNOCOMP').AsString := dbeNoComp.Text ;
   dm1.cdsRegCxP.Active := True ;
   //
end;

procedure TFExtChequesX.FormCreate(Sender: TObject);
begin
  DM1.ASignaTipoDiario(dblcTDiario,Self) ;
end;

procedure TFExtChequesX.ConfiguraAccesos;
begin
    if DM1.wAdmin = 'S' then
       Proc_Admin
    else
    begin
       if DM1.wModo = 'C' then
          Proc_Consul
       else
          dm1.AccesosUsuarios( DM1.wModulo,DM1.wUsuario,'2',Screen.ActiveForm.Name ) ;
    end ;

end;

procedure TFExtChequesX.Libera_Admin;
begin
    Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFExtChequesX.Libera_Consul;
begin

end;

procedure TFExtChequesX.Proc_Admin;
var
   Contador : Integer ;
begin
    pnlCabecera1.Enabled := False ;
    pnlDocExtornar.Enabled := False ;
    dbgExtorno.Enabled := False ;
    //Array de controles y eventos
    Contador := BotonesEnPanel( pnlBotones ) ;
    setlength( A1 , Contador) ;
    setlength( A2 , Contador) ;
    Quita(A1,A2,pnlBotones) ;
    //
    pnlBotones.Enabled := True ;
end;

procedure TFExtChequesX.Proc_Consul;
begin
    pnlCabecera1.Enabled := False ;
    pnlDocExtornar.Enabled := False ;
    dbgExtorno.Enabled := True ;
    pnlBotones.Enabled := False ;
end;

procedure TFExtChequesX.LibConfigAccesos;
begin
    if DM1.wAdmin = 'S' then
       Libera_Admin
    else
    begin
       if DM1.wModo = 'C' then
          Libera_Consul ;
    end ;
end;

end.

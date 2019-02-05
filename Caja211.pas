unit Caja211;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient,
  ComCtrls, Tabnotbk, wwDialog, wwidlg, CAJADM, oaContabiliza;

type
  TFExtCheques = class(TForm)
    pnlCabecera1: TPanel;
    pnlBotones: TPanel;
    z2bbtnImprime: TBitBtn;
    z2bbtnCancelado: TBitBtn;
    z2bbtnCancel: TBitBtn;
    lblEstado: TLabel;
    z2bbtnCalc: TBitBtn;
    pnlDocExtornar: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    Label23: TLabel;
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
    pnlGrid: TPanel;
    dbgExtorno: TwwDBGrid;
    gbDatosExtorno: TGroupBox;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    lblFComp: TLabel;
    dbdtpFComp: TwwDBDateTimePicker;
    lblPeriodo: TLabel;
    edtPeriodo: TEdit;
    Label1: TLabel;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TEdit;
    Label2: TLabel;
    dblcCCBco: TwwDBLookupCombo;
    lblNoComp: TLabel;
    dbeNoComp: TwwDBEdit;
    procedure z2bbtnCalcClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure z2bbtnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
    procedure z2bbtnCanceladoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbdtpFCompEnter(Sender: TObject);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);

  private
    xECCONTA, xEC_PROCE ,xECOPAGO   : String;
    { Private declarations }
    cdsExtorno: TWWClientDataSet;
    A1 : Array of Integer ;
    A2 : Array Of TNotifyEvent ;
    procedure CambiaEstado(wEstado:String);
    procedure RevierteSaldos ;
    procedure Contabiliza ;
    procedure SetFlagExtorno ;
    procedure ActualizaSaldosCaja ;
  public
    { Public declarations }
  end;
var
  FExtCheques: TFExtCheques;
  wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,
  wbcancel2: Boolean;
  wmodifica: Boolean;
  wNoCompExtorno : String;
  wAnoMMExtorno  : String;

implementation

uses CAJAUTIL, Caja290, Caja260, oaTE2000;

{$R *.DFM}


procedure TFExtCheques.z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('C:\windows\calc.exe',1);  //Activa la calculadora del Windows
end;

procedure TFExtCheques.z2bbtnCancelClick(Sender: TObject);
begin
   DMTE.cdsEgrCajaX.CancelUpdates;
end;

procedure TFExtCheques.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DMTE.cdsEgrCajaX.Active then DMTE.cdsEgrCajaX.CancelUpdates;
  if DMTE.cdsRegCxP.Active  then DMTE.cdsRegCxP.CancelUpdates;

  DMTE.cdsregcxp.Filter := '' ;
  DMTE.cdsregcxp.Filtered := False  ;

end;

Procedure TFExtCheques.CambiaEstado(wEstado:String);
begin
   if wEstado='XX' then
   begin
      lblEstado.Caption        := 'No se puede Extornar';
      z2bbtnCancelado.Enabled  := False;
      z2bbtnImprime.Enabled    := False;
      gbDatosExtorno.Caption:='No hay Datos del Comprobante por que no se puede Generar el Extorno';
      exit;
   end;
   if (wEstado='1') or (wEstado='S') then
   begin
      lblEstado.Caption        := 'Extornado';
      z2bbtnCancelado.Enabled  := False;
      z2bbtnImprime.Enabled    := True;
      gbDatosExtorno.Caption:='Datos del Comprobante generado por el Extorno';
   end
   else
   begin
      lblEstado.Caption        := 'por Extornar';
      z2bbtnCancelado.Enabled  := True;
      z2bbtnImprime.Enabled    := False;
      gbDatosExtorno.Caption:='Datos del Comprobante que se generará para el Extorno';
      dbdtpFComp.SetFocus;
   end;
end;


procedure TFExtCheques.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
   begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFExtCheques.FormShow(Sender: TObject);
var
   xSQL,xWhere,xECCONTA,xEC_PROCE,xECOPAGO :string;
   i:integer;
   xAno , xMes, xDia : word;
   xSigue : Boolean;
begin
///////////////////////////////////////////

//   if (DMTE.cdsEgrCajaX.FieldByName('FEXTCHQ').AsString='1') or
//      (DMTE.cdsEgrCajaX.FieldByName('FEXTCHQ').AsString='S') then
//   begin
//		ShowMessage('El Cheque ya fue Extornado');
//      exit;
//	end;

{
   decodedate(FToolCheque.dtpFecExtorno.Date,xAno,xMes,xDia);
   wAnoMMExtorno := DMTE.strZero(inttostr(xAno),4)+DMTE.strZero(inttostr(xMes),2);

   xSigue := True;

   if (DMTE.cdsEgrCajaX.FieldByName('FEXTCHQ').AsString<>'1') and
      (DMTE.cdsEgrCajaX.FieldByName('FEXTCHQ').AsString<>'S') then
   begin

      if strtoint(wAnoMMExtorno)<strtoint(DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString) then
      begin
         ShowMessage('Fecha de Extorno no puede ser inferior a Fecha de Cheque!');
         xSigue := False;
      end;

      if FToolCheque.dtpFecExtorno.Date<DMTE.cdsEgrCajaX.FieldByName('ECFEMICH').AsDateTime then
      begin
         ShowMessage('Fecha de Extorno no puede ser inferior a Fecha de Cheque!');
         xSigue := False;
      end;

      if DMTE.BuscaCierre(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString,
                         DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString,
                         DMTE.cdsEgrCajaX.FieldByName('CCBCOID').AsString,
                         DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString
                         ) then
      begin
         ShowMessage('Cheque pertenece a un Periodo Cerrado, no se puede Extornar!');
         xSigue := False;
      end;

      if DMTE.BuscaCierre(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString,
                         DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString,
                         DMTE.cdsEgrCajaX.FieldByName('CCBCOID').AsString,
                         wAnoMMExtorno
                         ) then
      begin
         ShowMessage('Fecha con la cual se desea realizar el Extorno pertenece a un Periodo Cerrado'
                     +chr(13)+', no se puede realizar la operación');
         xSigue := False;
      end;
   end;

///////////////////////////////////////////
   if xSigue then
   begin
   // determina número de Comprobante a Generar
      xWhere:='CIAID='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString)
             +' and ECANOMM='+quotedstr(wAnoMMExtorno)
             +' and TDIARID='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('TDIARID').AsString);
      wNoCompExtorno:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      wNoCompExtorno:=DMTE.StrZero(wNoCompExtorno,length(DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString));

      xECCONTA := DMTE.fieldnonulo(DMTE.cdsEgrCajaX.FieldByName('ECCONTA'))  ;
      xEC_PROCE:= DMTE.cdsEgrCajaX.FieldByName('EC_PROCE').AsString ;
      xECOPAGO := DMTE.fieldnonulo( DMTE.cdsEgrCajaX.FieldByName('ECOPAGO') ) ;

      dblcCia.Text    := FToolCheque.dblcCiaxPag.text;
      edtCia.Text     := FToolCheque.edtCiaxPag.Text;
      dbdtpFComp.Date := FToolCheque.dtpFecExtorno.date;
      edtPeriodo.Text := wAnoMMExtorno;
      dblcBanco.Text  := DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString;
      dblcCCBco.Text  := DMTE.cdsEgrCajaX.FieldByName('CCBCOID').AsString;
      dbeNoComp.Text  := wNoCompExtorno;
   end;

   stCia.Caption       := DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString;
   stCiaDes.Caption    := DMTE.cdsEgrCajaX.FieldByName('CIADES').AsString;
   stFComp.Caption     := DMTE.cdsEgrCajaX.FieldByName('ECFCOMP').AsString;
   stPeriodo.Caption   := DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString;
   stTDiario.Caption   := DMTE.cdsEgrCajaX.FieldByName('TDIARID').AsString;
   stTDiarioDes.Caption:= DMTE.cdsEgrCajaX.FieldByName('TDIARABR').AsString;
   stNoComp.Caption    := DMTE.cdsEgrCajaX.FieldByName('ECNOCOMP').AsString;
   stClase.Caption     := DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString;
   stClaseDes.Caption  := DMTE.cdsEgrCajaX.FieldByName('CLAUXABR').AsString;
   stProv.Caption      := DMTE.cdsEgrCajaX.FieldByName('PROV').AsString;
   stProvRUC.Caption   := DMTE.cdsEgrCajaX.FieldByName('PROVRUC').AsString;
   stGiradoA.Caption   := DMTE.cdsEgrCajaX.FieldByName('ECGIRA').AsString;
   stTMon.Caption      := DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString;
   stTMonDes.Caption   := DMTE.cdsEgrCajaX.FieldByName('TMONABR').AsString;
   stTCambio.Caption   := DMTE.cdsEgrCajaX.FieldByName('ECTCAMB').AsString;
   stImporte.Caption   := DMTE.cdsEgrCajaX.FieldByName('ECMTOORI').AsString;
   stTDoc.Caption      := DMTE.cdsEgrCajaX.FieldByName('DOCID').AsString;
   stTDocDes.Caption   := DMTE.cdsEgrCajaX.FieldByName('DOCDES').AsString;
   stNoDoc.Caption     := DMTE.cdsEgrCajaX.FieldByName('ECNODOC').AsString;
   stBanco.Caption     := DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString;
   stBancoDes.Caption  := DMTE.cdsEgrCajaX.FieldByName('BANCOABR').AsString;
   stCCBco.Caption     := DMTE.cdsEgrCajaX.FieldByName('CCBCOID').AsString;
   stCCBcoDes.Caption  := DMTE.cdsEgrCajaX.FieldByName('CCBCODES').AsString;
   stCuenta.Caption    := DMTE.cdsEgrCajaX.FieldByName('CUENTAID').AsString;
   stNoChq.Caption     := DMTE.cdsEgrCajaX.FieldByName('ECNOCHQ').AsString;
   stLote.Caption      := DMTE.cdsEgrCajaX.FieldByName('ECLOTE').AsString;
   stCnp.Caption       := DMTE.cdsEgrCajaX.FieldByName('CPTOID').AsString;
   stGlosa.Caption     := DMTE.cdsEgrCajaX.FieldByName('ECGLOSA').AsString;

   xSQL:='Select * from CAJA303 '
        +'Where CIAID='''   +dblcCia.Text      +''' and '
        +      'ECANOMM=''' +stPeriodo.Caption +''' and '
        +      'TDIARID=''' +stTDiario.Caption +''' and '
        +      'ECNOCOMP='''+stNoComp.Caption  +''' ';
   DMTE.cdsRegCxP.Close;
   DMTE.cdsRegCxP.Datarequest(xSQL);
   DMTE.cdsRegCxP.Open;

   if not xSigue then
      CambiaEstado('XX')
   else
      CambiaEstado(DMTE.cdsEgrCajaX.FieldByName('FEXTCHQ').AsString);
}
end;


procedure TFExtCheques.z2bbtnImprimeClick(Sender: TObject);
var
   Comprobante : RCabComprobante;
   xSQL: String;
begin
{   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' THEN
	 begin
   		//RecCptosDifC ;
		  Contabiliza;

      ActualizaCNT311( DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
                       DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                       DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                       DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString );

      if SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                  DMTE.SRV_D, 'P', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                  DMTE.cdsResultSet, DMTE.DCOM1, Self ) then

      ImprimeVoucher( 'CNT311', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text );
 	 end;
}
   if DMTE.cdsEgrCajaX.FieldByName('ECCONTA').AsString = 'S' THEN
	 begin
      ImprimeVoucher( 'CNT301', dblcCia.Text, edtPeriodo.Text, stTDiario.Caption, dbeNoComp.Text, 'Extorno de Cheque' );
   end;
end;

procedure TFExtCheques.RevierteSaldos;
var
   xSQL ,
   xWhere : String ;
   xCPPAGORI ,
   xCPPAGLOC ,
   xCPPAGEXT : Currency ;
begin
   // vhn 22/01/2001
   xSQL:='Select * from CAJA303 '
        +'Where CIAID='''   +stCia.Caption+''' and '
        +      'ECANOMM=''' +stPeriodo.Caption+''' and '
        +      'TDIARID=''' +stTDiario.Caption+''' and '
        +      'ECNOCOMP='''+stNoComp.Caption+''' ';
   DMTE.cdsDocPago.Close;
   DMTE.cdsDocPago.DataRequest( xSQL );
   DMTE.cdsDocPago.Open;

   DMTE.cdsDocPago.First ;
   while not DMTE.cdsDocPago.Eof do
   begin
      xWhere:='CIAID='''   +stCia.Caption+''' and '
             +'CPANOMES='''+DMTE.cdsDocPago.fieldbyName('CPANOMM').AsString +''' and '
             +'TDIARID=''' +DMTE.cdsDocPago.fieldbyName('TDIARID2').AsString+''' and '
             +'CPNOREG=''' +DMTE.cdsDocPago.fieldbyName('CPNOREG').AsString +'''';
      xSQL:='SELECT * FROM CXP301 WHERE '+ xWhere;

      DMTE.cdsMovCxP.Close;
      DMTE.cdsMovCxP.Datarequest( xSQL );
      DMTE.cdsMovCxP.Open;
      //Procesos
      if DMTE.cdsDocPago.fieldbyname('TMONID').AsString = DMTE.wTMonLoc then
      begin
         xCPPAGLOC := DMTE.cdsDocPago.fieldbyName('DEMTOLOC').AsFloat ;
         xCPPAGEXT := DMTE.FRound(DMTE.cdsDocPago.fieldbyName('DEMTOLOC').AsFloat /
                      DMTE.cdsDocPago.fieldbyName('DETCDOC').AsFloat,15,2) ;
         xCPPAGORI := xCPPAGLOC ;
      end
      else
      begin
         xCPPAGEXT := DMTE.cdsDocPago.fieldbyName('DEMTOEXT').AsFloat ;
         xCPPAGLOC := DMTE.cdsDocPago.fieldbyName('DEMTOEXT').AsFloat *
                      DMTE.cdsDocPago.fieldbyName('DETCDOC').AsFloat  ;
         xCPPAGORI := xCPPAGEXT ;

      end ;
      DMTE.cdsMovCxP.Edit ;
      if DMTE.cdsMovCxP.FieldByName('CPESTADO').AsString = 'C' then
         DMTE.cdsMovCxP.FieldByName('CPESTADO').AsString := 'P'         ;
      DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat :=
          DMTE.cdsMovCxP.FieldByName('CPPAGORI').AsFloat - xCPPAGORI ;
      DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat :=
          DMTE.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat - xCPPAGLOC ;
      DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat :=
          DMTE.cdsMovCxP.FieldByName('CPPAGEXT').AsFloat - xCPPAGEXT ;
      DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat :=
          DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat + xCPPAGORI ;
      DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat :=
          DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat + xCPPAGLOC ;
      DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat :=
          DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat + xCPPAGEXT ;
      DMTE.AplicaDatos( DMTE.cdsMovCxP, 'MOVCXP' );
      DMTE.cdsDocPago.Next ;
   end;
end;

procedure TFExtCheques.z2bbtnCanceladoClick(Sender: TObject);
var
   xNmes,xMes, xtmonid, xsql, ssql, xAno : String ;
   cMTOLOC, cMTOEXT, xWhere : String;
   i : integer;
begin
// El Extorno es un Movimiento Duplicado en CAJA302 pero con el FLAG EC_IE Invertido
// se apertura todos los Campos del CAJA302, no se toma los campos de DMTE.cdsEgrCajaX
// porque puede que no estén disponibles por el Diccionario PLAN04

   xWhere:='CIAID='+QuotedStr(stCia.Caption)+' and '
          +'ECANOMM='+QuotedStr(stPeriodo.Caption)+' and '
          +'TDIARID='+QuotedStr(stTDiario.Caption)+' and '
          +'ECNOCOMP='+QuotedStr(stNoComp.Caption);

   xSQL:='Select * from CAJA302 where '+xWhere;
   DMTE.cdsRec.Filter:='';
   DMTE.cdsRec.IndexFieldNames:='';
   DMTE.cdsRec.Close;
   DMTE.cdsRec.DataRequest(xSQL);
   DMTE.cdsRec.Open;

   if DMTE.cdsRec.RecordCount=0 then
   begin
   // aqui no debería entrar nunca
      ShowMessage('No existen Mov a Extornar');
      Exit;
   end ;

// Se apertura DMTE.cdsQry para actualizar el Registro del Extorno
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;
   //
   DMTE.cdsQry.Insert;
   for i := 0 to DMTE.cdsRec.Fields.Count-1 do
   begin
      try
         DMTE.cdsQry.Fieldbyname( DMTE.cdsRec.Fields[i].FieldName ).AsString :=
                        DMTE.fieldnonulo(DMTE.cdsRec.Fields[i]) ;
      except
         Continue ;
      end  ;
   end;

   DMTE.cdsQry.FieldByName('CIAID').AsString    := stCia.Caption ;
   DMTE.cdsQry.FieldByName('ECANOMM').AsString  := wAnoMMExtorno ; // toma AñoMes de Fecha Extorno
   DMTE.cdsQry.FieldByName('TDIARID').AsString  := stTDiario.Caption ;
   DMTE.cdsQry.FieldByName('ECNOCOMP').AsString := wNoCompExtorno ; // toma Nuevo Nro.Comprobante
   DMTE.cdsQry.FieldByName('ECANOMM2').AsString := wAnoMMExtorno ;  // toma AñoMes de Fecha Extorno
   DMTE.cdsQry.FieldByName('TDIARIO2').AsString := stTDiario.Caption ;
   DMTE.cdsQry.FieldByName('ECNOCOMP2').AsString:= wNoCompExtorno ; // toma Nuevo Nro.Comprobante
   DMTE.cdsQry.FieldByName('EC_PROCE').AsString := '8' ; // indica que es el Extorno

// se invierte el FLAG de Ingreso/Egreso
   if DMTE.cdsQry.FieldByName('EC_IE').asString = 'E' then
      DMTE.cdsQry.FieldByName('EC_IE').asString := 'I'
   else
      DMTE.cdsQry.FieldByName('EC_IE').asString := 'E';

   DMTE.cdsQry.FieldByName('CCBCOVOUCH').asString := stTDiario.Caption;
   DMTE.cdsQry.Post ;

   DMTE.AplicaDatos(DMTE.cdsQry,'EGRCAJA');

	if DMTE.cdsQry.FieldByName('CAJARETIGV').AsString='S' then
   begin
//		DMTE.AnulaRetencion;
	   xSQL:=' update CNT320 set ECESTADO=''A'' where '+xWhere;
	   try
	      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
	   except
	   end;
   end;

   if xEC_PROCE <> '1' then // si es que no es Doc. No Provisionado
      RevierteSaldos;

   ActualizaSaldosCaja ; // CAJA310 Y CAJA401

   if xECCONTA = 'S' then
   begin
      Contabiliza;
      ActualizaCNT311(DMTE.cdsEgrcajaX.FieldByName('CIAID').AsString,
                   DMTE.cdsEgrCajaX.FieldByName('TDIARID').AsString,
                   wNoCompExtorno,
                   wAnoMMExtorno);

      if SOLConta(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString,
               DMTE.cdsEgrCajaX.FieldByName('TDIARID').AsString,
               wNoCompExtorno,
               wAnoMMExtorno,
               DMTE.SRV_D, 'C', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
               DMTE.cdsResultSet, DMTE.DCOM1, Self ) then
   end;

   SetFlagExtorno ; // actualiza Flag de Extorno

   ShowMessage('Cheque ha sido Extornado');

   DMTE.cdsRec.Filter:='';
   DMTE.cdsRec.IndexFieldNames:='';
   DMTE.cdsRec.Close;
   DMTE.cdsQry.Filter:='';
   DMTE.cdsQry.IndexFieldNames:='';
   DMTE.cdsQry.Close;
   CambiaEstado('S');
end;

procedure TFExtCheques.Contabiliza;
var
   xWhere : string ;
   i, xReg : Integer ;
   xSQL : String;
begin
   xWhere:='CIAID='''  +stCia.Caption    +''' AND ECANOMM=''' +stPeriodo.Caption+''' and '
          +'TDIARID='''+stTDiario.Caption+''' AND ECNOCOMP='''+stNoComp.Caption +''' ' ;

    if not DMTE.RecuperarDatos('CAJA304','*',xWhere) then
    begin
   // a este error cae cuando ESTA declarado Contabilizado pero no encuentra
   // correspondencia en el CAJA304
       Raise Exception.Create('Error No existe comprobante Contabilizado') ;
    end ;

    // vhn 23/01/2001
    xSQL:='Select * from CAJA304 '
         +'Where CIAID='''   +dblcCia.Text    +''' and '
         +      'ECANOMM=''' +edtPeriodo.Text +''' and '
         +      'TDIARID=''' +stTDiario.Caption+''' and '
         +      'ECNOCOMP='''+dbeNoComp.Text  +'''';
    DMTE.cdsCNTCaja.Close;
    DMTE.cdsCNTCaja.DataRequest( xSQL );
    DMTE.cdsCNTCaja.Open;

    xReg:=0;
    DMTE.cdsRec.First ;
    while not DMTE.cdsRec.Eof do
    begin
       DMTE.cdsCntCaja.Insert ;
       for i := 0 to DMTE.cdsrec.Fields.Count-1 do
       begin
         DMTE.cdsCntCaja.Fieldbyname( DMTE.cdsRec.Fields[i].FieldName ).AsString :=
                             DMTE.fieldnonulo(DMTE.cdsRec.Fields[i]) ;
       end;
       DMTE.cdsCntCaja.FieldByName('CIAID').AsString    := dblcCia.Text ;
       DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString  := edtPeriodo.Text ;
       DMTE.cdsCntCaja.FieldByName('TDIARID').AsString  := stTDiario.Caption ;
       DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := dbeNoComp.Text ;
       xReg:=xReg+1;
       DMTE.cdsCntCaja.FieldByName('NREG').AsInteger    := xReg;

       if DMTE.cdsCntCaja.FieldByName('DCDH').value = 'H' then
          DMTE.cdsCntCaja.FieldByName('DCDH').value := 'D'
       else
          DMTE.cdsCntCaja.FieldByName('DCDH').value := 'H'  ;
       DMTE.cdsCntCaja.Post ;

       DMTE.cdsRec.Next ;
    end;
    DMTE.AplicaDatos( DMTE.cdsCntCaja, 'CNTCAJA' );
end;

procedure TFExtCheques.SetFlagExtorno;
var
   xSQL : String ;
begin     // vhn 22/01/2001
   xSQL:='Select CIAID, ECANOMM, TDIARID, ECNOCOMP, FEXTCHQ,ECESTADO from CAJA302 '
        +'Where CIAID='''   +stCia.Caption     +''' and '
        +      'ECANOMM=''' +stPeriodo.Caption +''' and '
        +      'TDIARID=''' +stTDiario.Caption +''' and '
        +      'ECNOCOMP='''+stNoComp.Caption  +''' ';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest( xSQL );
   DMTE.cdsEgrCaja.Open;

   if DMTE.cdsEgrCaja.RecordCount <> 0 then
   begin
      DMTE.cdsEgrCaja.Edit;
      DMTE.cdsEgrCaja.FieldByName('FEXTCHQ').AsString:='S';
      DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString:='A';
      DMTE.cdsEgrCaja.Post;
      DMTE.AplicaDatos( DMTE.cdsEgrCaja, 'EGRCAJA' );
   end;
end;

procedure TFExtCheques.ActualizaSaldosCaja;
var
   strFecha : TDate ;
begin
   strFecha := dbdtpFComp.Date;
   DMTE.ActSdoTlfn(stCia.Caption,stBanco.Caption ,stCCBCo.Caption ,
                   DMTE.cdsEgrCajaX.FieldbyName('ECMTOORI').AsString,strFecha,'E','-') ;

   DMTE.ActSdoMen(stBanco.Caption,stCCBCo.Caption,
                   DMTE.cdsEgrCajaX.FieldbyName('ECMTOORI').AsString,strFecha,'I') ;
end;

procedure TFExtCheques.FormActivate(Sender: TObject);
var
   xSQL,xWhere :string;
   xExtornado : Boolean;
begin
   stCia.Caption       := DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString;
   stCiaDes.Caption    := FToolCheque.edtCiaxPag.Text;
   stFComp.Caption     := DMTE.cdsEgrCajaX.FieldByName('ECFCOMP').AsString;
   stPeriodo.Caption   := DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString;

   stTDiario.Caption   := DMTE.cdsEgrCajaX.FieldByName('TDIARID').AsString;
   xWhere := 'TDIARID='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('TDIARID').AsString);
   stTDiarioDes.Caption:= DMTE.DisplayDescrip('prvTGE','TGE104','TDIARDES',xWhere,'TDIARDES');

   stNoComp.Caption    := DMTE.cdsEgrCajaX.FieldByName('ECNOCOMP').AsString;

   stClase.Caption     := DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString;
   xWhere := 'CLAUXID='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString);
   stClaseDes.Caption  := DMTE.DisplayDescrip('prvTGE','TGE102','CLAUXDES',xWhere,'CLAUXDES');

   stProv.Caption      := DMTE.cdsEgrCajaX.FieldByName('PROV').AsString;
   stProvRUC.Caption   := DMTE.cdsEgrCajaX.FieldByName('PROVRUC').AsString;
   stGiradoA.Caption   := DMTE.cdsEgrCajaX.FieldByName('ECGIRA').AsString;

   stTMon.Caption      := DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString;
   xWhere := 'TMONID='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString);
   stTMonDes.Caption   := DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');

   stTCambio.Caption   := floattostrf(DMTE.cdsEgrCajaX.FieldByName('ECTCAMB').AsFloat,ffNumber,10,2);
   stImporte.Caption   := floattostrf(DMTE.cdsEgrCajaX.FieldByName('ECMTOORI').AsFloat,ffNumber,10,2);

   stTDoc.Caption      := DMTE.cdsEgrCajaX.FieldByName('DOCID').AsString;
   xWhere := 'DOCID='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('DOCID').AsString);
   stTDocDes.Caption   := DMTE.DisplayDescrip('prvTGE','TGE110','DOCDES',xWhere,'DOCDES');

   stNoDoc.Caption     := DMTE.cdsEgrCajaX.FieldByName('ECNODOC').AsString;

   stBanco.Caption     := DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString;
   xWhere := 'BANCOID='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString);
   stBancoDes.Caption  := DMTE.DisplayDescrip('prvTGE','TGE105','BANCONOM',xWhere,'BANCONOM');

   stCCBco.Caption     := DMTE.cdsEgrCajaX.FieldByName('CCBCOID').AsString;
   xWhere := 'BANCOID='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString)
            +' and CCBCOID='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('CCBCOID').AsString);
   stCCBcoDes.Caption  := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCODES',xWhere,'CCBCODES');

   stCuenta.Caption    := DMTE.cdsEgrCajaX.FieldByName('CUENTAID').AsString;
   stNoChq.Caption     := DMTE.cdsEgrCajaX.FieldByName('ECNOCHQ').AsString;
   stLote.Caption      := DMTE.cdsEgrCajaX.FieldByName('ECLOTE').AsString;
   stCnp.Caption       := DMTE.cdsEgrCajaX.FieldByName('CPTOID').AsString;
   stGlosa.Caption     := DMTE.cdsEgrCajaX.FieldByName('ECGLOSA').AsString;

   xSQL:='Select * from CAJA303 '
        +'Where CIAID='''   +stCia.Caption     +''' and '
        +      'ECANOMM=''' +stPeriodo.Caption +''' and '
        +      'TDIARID=''' +stTDiario.Caption +''' and '
        +      'ECNOCOMP='''+stNoComp.Caption  +''' ';
   DMTE.cdsRegCxP.Close;
   DMTE.cdsRegCxP.Datarequest(xSQL);
   DMTE.cdsRegCxP.Open;

   xExtornado := False;
   dbdtpFComp.Enabled := True;
   dbeNoComp.Enabled := True;
   if (DMTE.cdsEgrCajaX.FieldByName('FEXTCHQ').AsString='1') or
      (DMTE.cdsEgrCajaX.FieldByName('FEXTCHQ').AsString='S') then
   begin
      xExtornado := True;
      dbdtpFComp.Enabled := False;
      dbeNoComp.Enabled := False;
   end;

   dblcCia.Text    := FToolCheque.dblcCiaxPag.text;
   edtCia.Text     := FToolCheque.edtCiaxPag.Text;
   dblcBanco.Text  := DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString;
   dblcCCBco.Text  := DMTE.cdsEgrCajaX.FieldByName('CCBCOID').AsString;

   dbdtpFComp.Clear;
   edtPeriodo.Clear;
   dbeNoComp.Clear;

   if xExtornado then
   begin
   // busca comprobante generado por el Extorno
      xSQL := 'Select ECFCOMP,ECANOMM,ECNOCOMP from CAJA302 '
             +'where CIAID='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString)
             +' and CLAUXID='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString)
             +' and PROV='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('PROV').AsString)
             +' and ECNOCHQ='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('ECNOCHQ').AsString)
             +' and EC_IE='+quotedstr('I');
      DMTE.cdsEgrCaja.Close;
      DMTE.cdsEgrCaja.DataRequest(xSQL);
      DMTE.cdsEgrCaja.Open;
      if DMTE.cdsEgrCaja.RecordCount>0 then
      begin
         dbdtpFComp.Date := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         edtPeriodo.Text := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
         dbeNoComp.Text  := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
      end
      else
      begin
         ShowMessage('No se encontró Comprobante de Extorno!!!');
      end;
   end;

   CambiaEstado(DMTE.cdsEgrCajaX.FieldByName('FEXTCHQ').AsString);
end;

procedure TFExtCheques.dbdtpFCompEnter(Sender: TObject);
begin
   if dbdtpFComp.Date=0 then
      dbdtpFComp.Date:=DateS;
end;

procedure TFExtCheques.dbdtpFCompExit(Sender: TObject);
var
   xAno , xMes, xDia : word;
   xWhere : String;
begin

   if z2bbtnCancel.Focused then exit;

   if dbdtpFComp.Date=0 then
   begin
		ShowMessage('Debe indicar Fecha de Extorno');
      dbdtpFComp.SetFocus;
      exit;
	end;

   if dbdtpFComp.Date<DMTE.cdsEgrCajaX.FieldByName('ECFEMICH').AsDateTime then
   begin
      ShowMessage('Fecha de Extorno no puede ser inferior a Fecha de Cheque!');
      dbdtpFComp.SetFocus;
      exit;
   end;

   decodedate(dbdtpFComp.Date,xAno,xMes,xDia);
   wAnoMMExtorno := DMTE.strZero(inttostr(xAno),4)+DMTE.strZero(inttostr(xMes),2);
// determina número de Comprobante a Generar
   xWhere:='CIAID='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString)
          +' and ECANOMM='+quotedstr(wAnoMMExtorno)
          +' and TDIARID='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('TDIARID').AsString);
   wNoCompExtorno:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
   wNoCompExtorno:=DMTE.StrZero(wNoCompExtorno,length(DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString));

   if strtoint(wAnoMMExtorno)<strtoint(DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString) then
   begin
      ShowMessage('Fecha de Extorno no puede ser inferior a Fecha de Cheque!');
      dbdtpFComp.SetFocus;
      exit;
   end;

   if DMTE.BuscaCierre(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString,
                      DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString,
                      DMTE.cdsEgrCajaX.FieldByName('CCBCOID').AsString,
                      DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString
                      ) then
   begin
      ShowMessage('Cheque pertenece a un Periodo Cerrado, no se puede Extornar!');
      dbdtpFComp.SetFocus;
      exit;
   end;

   if DMTE.BuscaCierre(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString,
                      DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString,
                      DMTE.cdsEgrCajaX.FieldByName('CCBCOID').AsString,
                      wAnoMMExtorno
                      ) then
   begin
      ShowMessage('Fecha con la cual se desea realizar el Extorno pertenece a un Periodo Cerrado'
                  +chr(13)+', no se puede realizar la operación');
      dbdtpFComp.SetFocus;
      exit;
   end;

   edtPeriodo.Text:=wAnoMMExtorno;
   dbeNoComp.text:=wNoCompExtorno;

end;

procedure TFExtCheques.dbeNoCompExit(Sender: TObject);
var
   xWhere : String;
   xAno, xMes, xDia : word;
begin
   dbeNoComp.text:=DMTE.StrZero(dbeNoComp.text,DMTE.cdsEgrCajaX.FieldByName('ECNOCOMP').Size);
   xWhere :=  'CIAID ='+quotedstr(dblcCia.Text)
             +' AND TDIARID ='+quotedstr(stTDiario.Caption)
             +' AND ECANOMM ='+quotedstr(edtPeriodo.Text)
             +' AND ECNOCOMP ='+quotedstr(dbeNoComp.Text);
   if DMTE.DisplayDescrip('prvTGE','CAJA302','COUNT(*) TOTREG',xWhere,'TOTREG') > '0' then
   begin
      ShowMessage('Nro. de Comprobante ya fue utilizado en otro Voucher');
      decodedate(dbdtpFComp.Date,xAno,xMes,xDia);
      wAnoMMExtorno := DMTE.strZero(inttostr(xAno),4)+DMTE.strZero(inttostr(xMes),2);
   // determina número de Comprobante a Generar
      xWhere:='CIAID='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString)
          +' and ECANOMM='+quotedstr(wAnoMMExtorno)
          +' and TDIARID='+quotedstr(DMTE.cdsEgrCajaX.FieldByName('TDIARID').AsString);
      wNoCompExtorno:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      wNoCompExtorno:=DMTE.StrZero(wNoCompExtorno,length(DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString));
      dbeNoComp.text:=DMTE.StrZero(wNoCompExtorno,DMTE.cdsEgrCajaX.FieldByName('ECNOCOMP').Size);
      dbeNoComp.SetFocus;
      exit;
   end;
end;

end.

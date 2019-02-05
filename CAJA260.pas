unit Caja260;

// Actualizaciones
// HPC_201403_CAJA cambia control de diseño de reporte

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, wwdbedit, wwdblook, wwdbdatetimepicker, Buttons,
  ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB,
  ppDBPipe, ppBands, ppCtrls, ppVar, ppPrnabl, oaContabiliza, ComCtrls, db;

type
  TFToolCheque = class(TForm)
    ppdbCheques: TppDBPipeline;
    pprCheques: TppReport;
    ppd1: TppDesigner;
    dbpCheque: TppDBPipeline;
    ppRptCheque: TppReport;
    pnlCheque: TPanel;
    pgctrlOrigen: TPageControl;
    tsPorPagar: TTabSheet;
    gbEstado1: TGroupBox;
    bbtnExtorna: TBitBtn;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    dblcBcoxPag: TwwDBLookupCombo;
    edtBcoxPag: TwwDBEdit;
    tsPorCobrar: TTabSheet;
    gbEstado: TGroupBox;
    Label2: TLabel;
    bbtnCobrado: TBitBtn;
    bbtnDevuelto: TBitBtn;
    FecCheque: TwwDBDateTimePicker;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    lblEstado: TLabel;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TwwDBEdit;
    bbtnOk: TBitBtn;
    dblcEstado: TwwDBLookupCombo;
    Z2bbtnOrdenPago: TBitBtn;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    dblcCiaxPag: TwwDBLookupCombo;
    edtCiaxPag: TwwDBEdit;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    dblcCiaxCob: TwwDBLookupCombo;
    edtCiaxCob: TwwDBEdit;
    Z2bbtnSinEmitir: TBitBtn;
    Z2bbtnEmitidos: TBitBtn;
    Label6: TLabel;
    dblcMotDevChq: TwwDBLookupCombo;
    edtMotDevChq: TwwDBEdit;
    tsPorCobrarCaja: TTabSheet;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    dblcCiaCaja: TwwDBLookupCombo;
    edtCiaCaja: TwwDBEdit;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    dblcBancoCaja: TwwDBLookupCombo;
    edtBcoNomCaja: TwwDBEdit;
    bbtnAceptarCaja: TBitBtn;
    GroupBox7: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    bbtnDevueltoCaja: TBitBtn;
    FecChequeCaja: TwwDBDateTimePicker;
    dblcMotDevChqCaja: TwwDBLookupCombo;
    edtMotDevChqCaja: TwwDBEdit;
    Label9: TLabel;
    dblcBancoDest: TwwDBLookupCombo;
    edtBcoDescDest: TwwDBEdit;
    Label12: TLabel;
    dblcCajaDest: TwwDBLookupCombo;
    edtCajaDest: TwwDBEdit;
    Z2bbtnCambiaFV: TBitBtn;
    ppHeaderBand2: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine1: TppLine;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    pplblSubTitulo: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel15: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLine2: TppLine;
    pplblTotMN: TppLabel;
    pplblTotME: TppLabel;
    BitBtn1: TBitBtn;
    bbtnAnulados: TBitBtn;
    cbDisenoRep: TCheckBox;
    sbDisenoRep: TSpeedButton;
    procedure dblcBancoExit(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure bbtnCobradoClick(Sender: TObject);
    procedure bbtnDevueltoClick(Sender: TObject);
    procedure dblcBancoEnter(Sender: TObject);
    procedure Z2bbtnOrdenPagoClick(Sender: TObject);
    procedure bbtnExtornaClick(Sender: TObject);
    procedure pgctrlOrigenChange(Sender: TObject);
    procedure dblcBcoxPagEnter(Sender: TObject);
    procedure dblcBcoxPagExit(Sender: TObject);
    procedure dblcCiaxPagEnter(Sender: TObject);
    procedure dblcCiaxPagExit(Sender: TObject);
    procedure dblcCiaxCobEnter(Sender: TObject);
    procedure dblcCiaxCobExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Z2bbtnSinEmitirClick(Sender: TObject);
    procedure Z2bbtnEmitidosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblcMotDevChqExit(Sender: TObject);
    procedure dblcCiaCajaExit(Sender: TObject);
    procedure tsPorCobrarCajaShow(Sender: TObject);
    procedure tsPorCobrarShow(Sender: TObject);
    procedure dblcBancoCajaExit(Sender: TObject);
    procedure dblcMotDevChqCajaExit(Sender: TObject);
    procedure bbtnAceptarCajaClick(Sender: TObject);
    procedure bbtnCobradoCajaClick(Sender: TObject);
    procedure bbtnDevueltoCajaClick(Sender: TObject);
    procedure dblcBancoDestExit(Sender: TObject);
    procedure dblcCajaDestExit(Sender: TObject);
    procedure Z2bbtnCambiaFVClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure dblcCiaxPagNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }

     xTDiario : String;
     xNoComp  : String;
     xTMoneda : String;
     xCuenta  : String;
     xCpto    : String;
     xAAMM    : String;
     stCia,stPeriodo,stTDiario,stNoComp:string;
     procedure GeneraChequeEnCxC301;
     procedure GrabaTransferencia;
     procedure BuscaBanco( cBanco, cCCBco : String );
     procedure Contabiliza ;
     procedure RevierteSaldos ;
     procedure ActualizaSaldosCaja;
     procedure SetFlagExtorno ;
  public
    { Public declarations }
  end;

var
	FToolCheque: TFToolCheque;
   wNoCompExtorno : String;
   wAnoMMExtorno  : String;

implementation

uses CajaDM, Caja214, Caja215, Caja211, oaTE2000;

{$R *.DFM}

procedure TFToolCheque.dblcBancoExit(Sender: TObject);
var
 xdescrip , flagtipban: String;
begin
    if length(dblcBanco.text)=0 then begin
       edtBanco.Text:='';
       exit;
    end;

	 edtBanco.Text:=DMTE.DisplayDescripLocal(DMTE.cdsQry3,'BANCOID',dblcBanco.Text,'BANCONOM') ;
    if length(edtBanco.text)=0 then
    begin
     Showmessage('No Existe Banco');
     dblcBanco.text:='';
     dblcBanco.setfocus;
    end;

end;

procedure TFToolCheque.bbtnOkClick(Sender: TObject);
var
	 xSQL : String;
begin

   xSQL:='Select FPAGOID from TGE112 '
        +'where (FCEGR=''1'' or FCEGR=''S'')'
        +' and (FCHQ=''1'' or FCHQ=''S'')';
   DMTE.cdsQry.Close;
	DMTE.cdsQry.Datarequest(xSQL);
	DMTE.cdsQry.Open;

//////////////////
   xSQL:='Select CAJA305.CIAID, CAJA305.TDIARID, CAJA305.ECANOMM, CAJA305.ECNOCOMP, CAJA305.TXNOREG, '
        +  'CAJA305.BANCOID,CAJA305.TXNOCHQ, CAJA305.TMONID, CAJA305.TXTCAMB, CAJA305.TXMTOORI, '
        +  'CAJA305.TXMTOLOC, CAJA305.TXMTOEXT,CAJA305.TXUSER, CAJA305.TXFREG, CAJA305.TXHREG, '
        +  'CAJA305.FLAGVAR, CAJA305.TXTPAGO, CAJA305.FPAGOID, CAJA305.CLAUXID, CAJA305.CLIEID, '
        +  'CAJA305.BANCOTRANS, CAJA305.CCBCOTRANS, CAJA305.BANCOTRANO,CAJA305.CCBCOTRANO, CAJA305.CCTREC,'
        +  'CAJA305.DOCID, CAJA305.CCNODOC, CAJA305.CHQ_ESTADO, CAJA305.CHQ_FECBCO, CAJA305.CHQ_FECEMI, '
        +  'CAJA305.CHQ_FECVCM, CAJA305.CHQ_FECCAN, CAJA305.CHQ_FECDCM, CAJA305.MOTDEVCHQ, '
        +  'TGE204.CLIEDES, TGE204.CLIERUC, CAJA305.CHQ_FECDEV '
        +'from CAJA305 '
        +'left outer join TGE204 on TGE204.CLAUXID=CAJA305.CLAUXID and TGE204.CLIEID=CAJA305.CLIEID ';
   if dblcCiaxCob.text='' then
      xSQL:=xSQL+'WHERE ( CAJA305.CHQ_ESTADO=''PEND.COB'' OR CAJA305.CHQ_ESTADO=''COBRADO'' OR CAJA305.CHQ_ESTADO=''DEVUELTO'' ) '
   else
      xSQL:=xSQL+'where CAJA305.CIAID='+quotedstr(dblcCiaxCob.Text)
		  +' and ( CAJA305.CHQ_ESTADO=''PEND.COB'' OR CAJA305.CHQ_ESTADO=''COBRADO'' OR CAJA305.CHQ_ESTADO=''DEVUELTO'' ) ';


   if DMTE.cdsQry.RecordCount=1 then
      xSQL := xSQL +' and CAJA305.FPAGOID='''+DMTE.cdsQry.FieldByName('FPAGOID').AsString+''''
   else
   begin
      xSQL := xSQL+' and (';
      DMTE.cdsQry.First;
      while not DMTE.cdsQry.EOF do
      begin
         xSQL := xSQL+'CAJA305.FPAGOID='+quotedstr(DMTE.cdsQry.FieldByName('FPAGOID').AsString);
         DMTE.cdsQry.Next;
         if not DMTE.cdsQry.EOF then
            xSQL := xSQL+' or ';
      end;
      xSQL := xSQL+') ';
   end;

	if dblcBanco.Text<>''  then xSQL:=xSQL+' and CAJA305.BANCOID='''   +dblcBanco.Text+'''';
   //anax
	if dblcBancoDest.Text<>''  then xSQL:=xSQL+' and CAJA305.BANCOTRANS='''   +dblcBancoDest.Text+'''';
   //anax
	if dblcEstado.Text<>'' then xSQL:=xSQL+' and CAJA305.CHQ_ESTADO='''+dblcEstado.Text+'''';

   xSQL := 'Select * from ( '+xSQL+' ) SOLVISTA';
   
	FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.clear;
	FRegistro.xFiltroCHQ.UsuarioSQL.Clear;
	FRegistro.xFiltroCHQ.FMant.wTabla:='VWCAJACHQCCBCO';
	FRegistro.xFiltroCHQ.UsuarioSQL.Add(xSQL);
	FRegistro.xFiltroCHQ.NewQuery;
end;


procedure TFToolCheque.bbtnCobradoClick(Sender: TObject);
var
	 I : Integer;
    UpSQL : String;
begin

	if FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count>1 then
	begin
		ShowMessage('Error : Se debe Seleccionar Solo Un Cheque');
	end;

	for i:= 0 to FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count-1 do
	begin
		 FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.GotoBookmark( FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i] );

		 if DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString='DEVUELTO' then
       begin
		 	 ShowMessage('Cheque Ya Fue Devuelto');
		 	 FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
		 	 FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Clear;
		 	 Exit;
		 end;

		 if DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString='COBRADO' then
       begin
		 	 ShowMessage('Cheque Ya Fue Cobrado');
		 	 FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark( FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i] ) ;
		 	 FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Clear;
		 	 Exit;
		 end;
	end;

	if MessageDlg('¿Actualizar el Cheque a Situación Cobrado?',mtConfirmation, [mbYes, mbNo], 0) IN [mrNo,mrCancel] then
		Exit;

	for i:= 0 to FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count-1 do
	begin
	 	 FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.GotoBookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]);

		 DMTE.cdsEgrCajaX.Edit;
		 DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString:='COBRADO';
 		 DMTE.cdsEgrCajaX.FieldByName('CHQ_FECCAN').AsDateTime:=FecCheque.Date;
		 DMTE.cdsEgrCajaX.Post;

       UpSQL:='UPDATE CAJA305 SET CHQ_FECCAN='+DMTE.wRepFuncDate+''''+FormatDatetime(DMTE.wFormatFecha, FecCheque.Date)+'''), '
             +                   'CHQ_ESTADO='''+DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString+''' '
            +'WHERE CIAID='''  +DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString   +''' '
            +  'AND CLAUXID='''+DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString +''' '
            +  'AND CLIEID=''' +DMTE.cdsEgrCajaX.FieldByName('CLIEID').AsString  +''' '
            +  'AND FPAGOID='''+DMTE.cdsEgrCajaX.FieldByName('FPAGOID').AsString +''' '
            +  'AND BANCOID='''+DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString +''' '
            +  'AND TMONID=''' +DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString  +''' '
            +  'AND TXNOCHQ='''+DMTE.cdsEgrCajaX.FieldByName('TXNOCHQ').AsString +'''';
      DMTE.DCOM1.AppServer.EjecutaSQL(UpSQL);

       UpSQL:='UPDATE CAJA314 SET CHQ_FECCAN='+DMTE.wRepFuncDate+''''+FormatDatetime(DMTE.wFormatFecha, FecCheque.Date)+'''), '
             +                   'CHQ_ESTADO='''+DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString+''' '
             +'WHERE CIAID='''  +DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString   +''' '
             +  'AND CLAUXID='''+DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString +''' '
             +  'AND CLIEID=''' +DMTE.cdsEgrCajaX.FieldByName('CLIEID').AsString  +''' '
             +  'AND FPAGOID='''+DMTE.cdsEgrCajaX.FieldByName('FPAGOID').AsString +''' '
             +  'AND BANCOID='''+DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString +''' '
             +  'AND TMONID=''' +DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString  +''' '
             +  'AND ECNOCHQ='''+DMTE.cdsEgrCajaX.FieldByName('TXNOCHQ').AsString +'''';
       DMTE.DCOM1.AppServer.EjecutaSQL(UpSQL);

		 FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
	end;

	//DMTE.AplicaDatos( DMTE.cdsEgrCajaX, 'EGRCAJAX' );

	FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.clear ;  { Clear selected record list since they are all deleted}
	FRegistro.xFiltroCHQ.FMant.dbgFiltro.RefreshDisplay  ;

   ShowMessage('El Cheque se Actualizó con Exito');
end;

procedure TFToolCheque.bbtnDevueltoClick(Sender: TObject);
var
   i : Integer;
   xSQL, UpSQL : String;
   a,m,d :word;
begin
  if length(dblcMotDevChq.text)=0 then
  begin
    Showmessage('Falta ingresar el Motivo de Devolución del Cheque');
    dblcMotDevChq.setfocus;
    Exit;
  end;

  DecodeDate(FecCheque.Date,a,m,d);

   if DMTE.BuscaCierre(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString,
                      DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString,
                      DMTE.cdsEgrCajaX.FieldByName('CCBCOTRANS').AsString,
                      DMTE.StrZero(IntToStr(a),4)+DMTE.StrZero(IntToStr(m),2)
                      ) then
   begin
      ShowMessage('Fecha con la cual se desea realizar el Extorno pertenece a un Periodo Cerrado.'
                  +chr(13)+'No se puede realizar la operación');
      exit;
	end;

   if DMTE.BuscaCierre(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString,
                      DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString,
                      DMTE.cdsEgrCajaX.FieldByName('CCBCOTRANS').AsString,
                      DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString
                      ) then
   begin
      ShowMessage('Cheque pertenece a un Periodo Cerrado, no se puede Devolver!');
      exit;
	end;

	{QUITAR
   if FecCheque.Date<DMTE.cdsEgrCajaX.FieldByName('CHQ_FECEMI').AsDateTime then
   begin
      ShowMessage('La Fecha de Operación no puede ser menor que la fecha de emisión del Cheque');
      exit;
   end;}

	if FecCheque.Date=0 then
  begin
    ShowMessage('Seleccione Fecha de Operación');
    exit;
  end;

	if FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count>1 then
  begin
    ShowMessage('Error : Se debe Seleccionar Solo Un Cheque');
    exit;
  end;

	if FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count=0 then
  begin
    ShowMessage('Error : Debe Seleccionar Un Cheque');
    exit;
  end;

   for i:= 0 to FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count-1 do
   begin
		FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.GotoBookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]);

		if DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString='DEVUELTO' then
    begin
			ShowMessage('Cheque Ya Fue Devuelto');
			FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
			exit;
		end;

		if DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString='COBRADO' then
    begin
			ShowMessage('Cheque Ya Fue Cobrado');
			FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
			Exit;
		end;

	end;

	if MessageDlg('¿ Devolver el Cheque?',mtConfirmation, [mbYes, mbNo], 0) IN [mrNo,mrCancel] then
		exit;

	screen.Cursor := crHourGlass ;

	xSQL:='Select * from CXC301 '
        +'Where CIAID=''ZZ''';
   DMTE.cdsMovCxC.Close;
   DMTE.cdsMovCxC.DataRequest( xSQL );
   DMTE.cdsMovCxC.Open;

   for i:= 0 to FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count-1 do
   begin
      FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.GotoBookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]);

		DMTE.cdsEgrCajaX.Edit;
		DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString:='DEVUELTO';
		DMTE.cdsEgrCajaX.FieldByName('MOTDEVCHQ').AsString :=dblcMotDevChq.Text;
      DMTE.cdsEgrCajaX.FieldByName('CHQ_FECDEV').AsDateTime := FecCheque.Date;
		DMTE.cdsEgrCajaX.Post;

      UpSQL:='UPDATE CAJA305 SET CHQ_ESTADO='''+DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString+''', '
            +                   'MOTDEVCHQ=''' +DMTE.cdsEgrCajaX.FieldByName('MOTDEVCHQ').AsString +''', '
            +                   'CHQ_FECDEV='  +DMTE.wRepFuncDate+''''+FormatDatetime(DMTE.wFormatFecha, FecCheque.Date)+''') '
            +'WHERE CIAID='''  +DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString   +''' '
            +  'AND CLAUXID='''+DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString +''' '
            +  'AND CLIEID=''' +DMTE.cdsEgrCajaX.FieldByName('CLIEID').AsString  +''' '
            +  'AND FPAGOID='''+DMTE.cdsEgrCajaX.FieldByName('FPAGOID').AsString +''' '
            +  'AND BANCOID='''+DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString +''' '
            +  'AND TMONID=''' +DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString  +''' '
            +  'AND TXNOCHQ='''+DMTE.cdsEgrCajaX.FieldByName('TXNOCHQ').AsString +'''';
      DMTE.DCOM1.AppServer.EjecutaSQL(UpSQL);

      ////21/12/2002 ACTUALIZA ESTADO EN CAJA314 A PEDIDO DE JCC
       UpSQL:='UPDATE CAJA314 SET CHQ_FECDEV='+DMTE.wRepFuncDate+''''+FormatDatetime(DMTE.wFormatFecha, FecCheque.Date)+'''), '
            +                    'MOTDEVCHQ=''' +DMTE.cdsEgrCajaX.FieldByName('MOTDEVCHQ').AsString +''', '
             +                   'CHQ_ESTADO='''+DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString+''' '
             +'WHERE CIAID='''  +DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString   +''' '
             +  'AND CLAUXID='''+DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString +''' '
             +  'AND CLIEID=''' +DMTE.cdsEgrCajaX.FieldByName('CLIEID').AsString  +''' '
             +  'AND FPAGOID='''+DMTE.cdsEgrCajaX.FieldByName('FPAGOID').AsString +''' '
             +  'AND BANCOID='''+DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString +''' '
             +  'AND TMONID=''' +DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString  +''' '
             +  'AND ECNOCHQ='''+DMTE.cdsEgrCajaX.FieldByName('TXNOCHQ').AsString +'''';
       DMTE.DCOM1.AppServer.EjecutaSQL(UpSQL);



		GeneraChequeEnCxC301;

		FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
	end;

	GrabaTransferencia;

   //DMTE.AplicaDatos( DMTE.cdsEgrCajaX, 'EGRCAJAX' );

	FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.clear ;  { Clear selected record list since they are all deleted}
	FRegistro.xFiltroCHQ.FMant.dbgFiltro.RefreshDisplay  ;

	screen.Cursor := crDefault ;

   ShowMessage('El Cheque se Devolvió con Exito');
end;


procedure TFToolCheque.GeneraChequeEnCxC301;
var
   xSQL : string;
   sOficina,sTDiarid,sSector,sZona,sCheque,sRuc,sNombre:string;
   xTAutoNum,xxNoReg:string;
   nNoReg:integer;
   a,m,d:word;
   smes,sano,ncheque,xfecha :string;
begin

   sOficina:=DMTE.DisplayDescrip('prvTGE','CXC105','UBICAID','UBICAFLAG=''O''','UBICAID');
   sCheque:=DMTE.DisplayDescrip('prvTGE','TGE110','DOCID,TDIARID','DOCMOD=''CXC'' AND DOC_FREG=''H''','DOCID');
   sTDiarid:=DMTE.cdsQry.FieldByName('TDIARID').AsString;
   sSector:=DMTE.DisplayDescrip('prvTGE','TGE204','CLIERUC,CLIEDES,TVTAID,ZONVTAID','CIAID='+QuotedStr(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString)+
             ' AND CLAUXID='+QuotedStr(DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString)+' AND CLIEID='+QuotedStr(DMTE.cdsEgrCajaX.FieldByName('CLIEID').AsString),'TVTAID');
   sZona:=DMTE.cdsQry.FieldByName('ZONVTAID').AsString;
   sRuc:=DMTE.cdsQry.FieldByName('CLIERUC').AsString;
   sNombre:=DMTE.cdsQry.FieldByName('CLIEDES').AsString;

   if pgctrlOrigen.ActivePageIndex=1 then
      DecodeDate(DMTE.cdsEgrCajaX.FieldByName('CHQ_FECEMI').AsDateTime,a,m,d);
   if pgctrlOrigen.ActivePageIndex=2 then
      DecodeDate(DMTE.cdsEgrCajaX.FieldByName('FC_FEMIS').AsDateTime,a,m,d);

   smes:=DMTE.StrZero(IntToStr(m),2);
   sano:=DMTE.StrZero(IntToStr(a),4);

   xTAutoNum:= DMTE.DisplayDescrip('prvTGE','TGE104','AUTONUM','TDIARID='+QuotedStr(sTDiarid),'AUTONUM');
   xxNoReg  := DMTE.UltimoRegistro(xTAutoNum,DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString,sTDiarid,sAno,sMes );
   nNoReg   := strtoint(xxNoReg);
   xxNoReg  := DMTE.GrabaUltimoRegistro(xTAutoNum,DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString,
               sTDiarid,sAno,sMes, nNoReg );
   xxNoReg  := DMTE.Strzero( xxNoReg,10);

   if pgctrlOrigen.ActivePageIndex=1 then
      ncheque:='TXNOCHQ';
   if pgctrlOrigen.ActivePageIndex=2 then
      ncheque:='ECNOCHQ';

   xSQL:='Select * from CXC301 '
				+'Where CIAID='''  +DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString   +''' AND '
				+      'DOCID='+QuotedStr(sCheque)+' AND '
            + ' CCSERIE=''000'' AND '
				+      'CCNODOC='''+DMTE.cdsEgrCajaX.FieldByName(ncheque).AsString +''' AND '

        +' BANCOID='+QuotedStr(DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString)+ ' AND '
        +' TMONID='+QuotedStr(DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString)+ ' AND '
				+      'CLAUXID='''+DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString +''' AND '
				+      'CLIEID=''' +DMTE.cdsEgrCajaX.FieldByName('CLIEID').AsString  +'''';

   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;

   if DMTE.cdsQry.RecordCount>0 then begin
      Raise Exception.Create(' Error : Cheque ya Existe ')
   end;

   DMTE.cdsMovCxC.Insert;
	DMTE.cdsMovCxC.FieldByName('TDIARID').AsString   := sTDiarid;
	DMTE.cdsMovCxC.FieldByName('CCLOTE').AsString   := '000';
	DMTE.cdsMovCxC.FieldByName('CIAID').AsString   := DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString;
	DMTE.cdsMovCxC.FieldByName('DOCID').AsString   := sCheque;
	DMTE.cdsMovCxC.FieldByName('CCSERIE').AsString   := '000';
   if pgctrlOrigen.ActivePageIndex=1 then
   	DMTE.cdsMovCxC.FieldByName('CCNODOC').AsString := DMTE.cdsEgrCajaX.FieldByName('TXNOCHQ').AsString;
   if pgctrlOrigen.ActivePageIndex=2 then
   	DMTE.cdsMovCxC.FieldByName('CCNODOC').AsString := DMTE.cdsEgrCajaX.FieldByName('ECNOCHQ').AsString;

	DMTE.cdsMovCxC.FieldByName('CLAUXID').AsString := DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString;
	DMTE.cdsMovCxC.FieldByName('CLIEID').AsString  := DMTE.cdsEgrCajaX.FieldByName('CLIEID').AsString;
	DMTE.cdsMovCxC.FieldByName('CLIERUC').AsString  :=sRuc;
	DMTE.cdsMovCxC.FieldByName('CLIEDES').AsString  :=sNombre;
	DMTE.cdsMovCxC.FieldByName('TMONID').AsString  := DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString;
	DMTE.cdsMovCxC.FieldByName('CCANOMES').AsString:= DMTE.cdsEgrCajaX.FieldByName('ECANOMM').AsString;
   if pgctrlOrigen.ActivePageIndex=1 then
   begin
      DMTE.cdsMovCxC.FieldByName('CCFEMIS').AsDateTime:= DMTE.cdsEgrCajaX.FieldByName('CHQ_FECEMI').AsDateTime;
      DMTE.cdsMovCxC.FieldByName('CCFCMPRB').AsDateTime:=DMTE.cdsEgrCajaX.FieldByName('CHQ_FECEMI').AsDateTime;
      DMTE.cdsMovCxC.FieldByName('CCFVCMTO').AsDateTime:=DMTE.cdsEgrCajaX.FieldByName('CHQ_FECBCO').AsDateTime;

      if DMTE.cdsMovCxC.FieldByName('TMONID').AsString= DMTE.wTMonLoc then begin
         DMTE.cdsMovCxC.FieldByName('CCMTOORI').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('TXMTOLOC').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCMTOLOC').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('TXMTOLOC').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCMTOEXT').AsFloat:= DMTE.Fround(DMTE.cdsEgrCajaX.FieldByName('TXMTOLOC').AsFloat/DMTE.cdsEgrCajaX.FieldByName('TXTCAMB').AsFloat,15,2);
         DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('TXMTOLOC').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('TXMTOLOC').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat:= DMTE.cdsMovCxC.FieldByName('CCMTOEXT').AsFloat
      end;
      if DMTE.cdsMovCxC.FieldByName('TMONID').AsString= DMTE.wTMonExt then begin
         DMTE.cdsMovCxC.FieldByName('CCMTOORI').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('TXMTOEXT').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCMTOEXT').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('TXMTOEXT').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCMTOLOC').AsFloat:= DMTE.Fround(DMTE.cdsEgrCajaX.FieldByName('TXMTOEXT').AsFloat*DMTE.cdsEgrCajaX.FieldByName('TXTCAMB').AsFloat,15,2);
         DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('TXMTOEXT').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('TXMTOEXT').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat:= DMTE.cdsMovCxC.FieldByName('CCMTOLOC').AsFloat
      end;

      DMTE.cdsMovCxC.FieldByName('CCTCAMPR').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('TXTCAMB').AsFloat;
      DMTE.cdsMovCxC.FieldByName('CCTCAMAJ').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('TXTCAMB').AsFloat;
   end;
   if pgctrlOrigen.ActivePageIndex=2 then
   begin
      DMTE.cdsMovCxC.FieldByName('CCFEMIS').AsDateTime:= DMTE.cdsEgrCajaX.FieldByName('FC_FEMIS').AsDateTime;
      DMTE.cdsMovCxC.FieldByName('CCFCMPRB').AsDateTime:=DMTE.cdsEgrCajaX.FieldByName('FC_FEMIS').AsDateTime;
      DMTE.cdsMovCxC.FieldByName('CCFVCMTO').AsDateTime:=DMTE.cdsEgrCajaX.FieldByName('FC_FCANC').AsDateTime;

      if DMTE.cdsMovCxC.FieldByName('TMONID').AsString= DMTE.wTMonLoc then begin
         DMTE.cdsMovCxC.FieldByName('CCMTOORI').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('FC_MTOLOC').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCMTOLOC').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('FC_MTOLOC').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCMTOEXT').AsFloat:= DMTE.Fround(DMTE.cdsEgrCajaX.FieldByName('FC_MTOLOC').AsFloat/DMTE.cdsEgrCajaX.FieldByName('TC_USADO').AsFloat,15,2);
         DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('FC_MTOLOC').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('FC_MTOLOC').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat:= DMTE.cdsMovCxC.FieldByName('CCMTOEXT').AsFloat;
      end;
      if DMTE.cdsMovCxC.FieldByName('TMONID').AsString= DMTE.wTMonExt then begin
         DMTE.cdsMovCxC.FieldByName('CCMTOORI').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('FC_MTOEXT').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCMTOEXT').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('FC_MTOEXT').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCMTOLOC').AsFloat:= DMTE.Fround(DMTE.cdsEgrCajaX.FieldByName('FC_MTOEXT').AsFloat*DMTE.cdsEgrCajaX.FieldByName('TC_USADO').AsFloat,15,2);
         DMTE.cdsMovCxC.FieldByName('CCSALORI').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('FC_MTOEXT').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCSALEXT').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('FC_MTOEXT').AsFloat;
         DMTE.cdsMovCxC.FieldByName('CCSALLOC').AsFloat:= DMTE.cdsMovCxC.FieldByName('CCMTOLOC').AsFloat;
      end;
      DMTE.cdsMovCxC.FieldByName('CCTCAMPR').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('TC_USADO').AsFloat;
      DMTE.cdsMovCxC.FieldByName('CCTCAMAJ').AsFloat:= DMTE.cdsEgrCajaX.FieldByName('TC_USADO').AsFloat;
   end;

   DMTE.cdsMovCxC.FieldByName('BANCOID').AsString:= DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString;
	DMTE.cdsMovCxC.FieldByName('CCPAGORI').AsFloat:= 0;
	DMTE.cdsMovCxC.FieldByName('CCPAGLOC').AsFloat:= 0;
	DMTE.cdsMovCxC.FieldByName('CCPAGEXT').AsFloat:= 0;
	DMTE.cdsMovCxC.FieldByName('UBIID').AsString  := sOficina;

	// pREGUNTAR A QUE CUENTA Y AQUE CONCEPTO VAN
	DMTE.cdsMovCxC.FieldByName('CCPTOTOT').AsString:= DMTE.DisplayDescrip('prvTGE','CXC208','CPTOCAB,CUENTAID','CIAID='+QuotedStr(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString)+
          ' AND DOCID='+QuotedStr(sCheque)+' AND TMONID='+QuotedStr(DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString)+
          ' AND TVTAID='+QuotedStr(sSector),'CPTOCAB');
   DMTE.cdsMovCxC.FieldByName('CPTOID').AsString:= DMTE.cdsMovCxC.FieldByName('CCPTOTOT').AsString;  
	DMTE.cdsMovCxC.FieldByName('CTATOTAL').AsString:= DMTE.cdsQry.FieldByName('CUENTAID').AsString;
	DMTE.cdsMovCxC.FieldByName('TVTAID').AsString  := sSector;
	DMTE.cdsMovCxC.FieldByName('ZVTAID').AsString  := sZona;
	DMTE.cdsMovCxC.FieldByName('CCNOREG').AsString := xxNoReg;
	DMTE.cdsMovCxC.FieldByName('FLAGVAR').AsString := '.';
   DMTE.cdsMovCxC.FieldByName('COMPROMET').AsString := 'NA';
	DMTE.cdsMovCxC.FieldByName('CCEstado').AsString:= 'P';
	DMTE.cdsMovCxC.FieldByName('CCFReg').value     := DateS;
	DMTE.cdsMovCxC.FieldByName('CCHReg').value     := Time;
	DMTE.cdsMovCxC.FieldByName('CCUser').AsString  := DMTE.wUsuario;
	DMTE.cdsMovCxC.FieldByName('TCANJEID').AsString:= 'DE';

   if pgctrlOrigen.ActivePageIndex=1 then
      xfecha:='CHQ_FECEMI';
   if pgctrlOrigen.ActivePageIndex=2 then
      xfecha:='FC_FEMIS';

   if DMTE.BuscaFecha('TGE114','Fecha','FECHA',DMTE.cdsEgrCajaX.FieldByName(xfecha).AsDateTime) then
   begin
      DMTE.cdsMovCxC.FieldByName('CCANOMES').AsString:=DMTE.cdsQry.FieldByName('FECANO').AsString+DMTE.cdsQry.FieldByName('FECMES').AsString;
      DMTE.cdsMovCxC.FieldByName('CCAAAA').AsString  :=DMTE.cdsQry.FieldByName('FECANO').AsString;
      DMTE.cdsMovCxC.FieldByName('CCMM').AsString    :=DMTE.cdsQry.FieldByName('FECMES').AsString;
      DMTE.cdsMovCxC.FieldByName('CCDD').AsString    :=DMTE.cdsQry.FieldByName('FECDIA').AsString;
      DMTE.cdsMovCxC.FieldByName('CCTRI').AsString   :=DMTE.cdsQry.FieldByName('FECTRIM').AsString;
      DMTE.cdsMovCxC.FieldByName('CCSEM').AsString   :=DMTE.cdsQry.FieldByName('FECSEM').AsString;
      DMTE.cdsMovCxC.FieldByName('CCSS').AsString    :=DMTE.cdsQry.FieldByName('FECSS').AsString;
      DMTE.cdsMovCxC.FieldByName('CCAATRI').AsString :=DMTE.cdsQry.FieldByName('FECAATRI').AsString;
      DMTE.cdsMovCxC.FieldByName('CCAASEM').AsString :=DMTE.cdsQry.FieldByName('FECAASEM').AsString;
      DMTE.cdsMovCxC.FieldByName('CCAASS').AsString  :=DMTE.cdsQry.FieldByName('FECAASS').AsString;
   end;
   //ANAX
   if pgctrlOrigen.ActivePageIndex=1 then
      DMTE.cdsMovCxC.FieldByName('MOTDEVCHQ').AsString  := dblcMotDevChq.text;
   if pgctrlOrigen.ActivePageIndex=2 then
      DMTE.cdsMovCxC.FieldByName('MOTDEVCHQ').AsString  := dblcMotDevChqCaja.text;
   //FIN DE ANAX
   cdsPost( DMTE.cdsMovCxC );
   DMTE.cdsMovCxC.DataRequest('SELECT * FROM CXC301 '
	      						  +'Where CIAID='''  +DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString   +''' AND '
									  +      'CCNODOC='''+DMTE.cdsEgrCajaX.FieldByName('CCNODOC').AsString +''' AND '
									  +      'CLAUXID='''+DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString +''' AND '
									  +      'CLIEID=''' +DMTE.cdsEgrCajaX.FieldByName('CLIEID').AsString  +'''' );
	DMTE.AplicaDatos( DMTE.cdsMovCxC, 'MovCxC' );
   if pgctrlOrigen.ActivePageIndex=1 then
   begin
     DMTE.SaldosAuxiliar(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString,sAno+smes,DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString,
                        DMTE.cdsEgrCajaX.FieldByName('CLIEID').AsString,'+',DMTE.cdsEgrCajaX.FieldByName('TXMTOLOC').AsFloat,DMTE.cdsEgrCajaX.FieldByName('TXMTOEXT').AsFloat,
                        DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString);
   end;
   if pgctrlOrigen.ActivePageIndex=2 then
   begin
      DMTE.SaldosAuxiliar(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString,sAno+smes,DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString,
                         DMTE.cdsEgrCajaX.FieldByName('CLIEID').AsString,'+',DMTE.cdsEgrCajaX.FieldByName('FC_MTOLOC').AsFloat,DMTE.cdsEgrCajaX.FieldByName('FC_MTOEXT').AsFloat,
                         DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString);
   end;

end;


procedure TFToolCheque.GrabaTransferencia;
var
   xWhere, xSQL : String ;
   xNoComp1, xTDiario1, xCuenta1, xMoneda1, xCpto1 : String;
   xNoComp2, xTDiario2, xCuenta2, xMoneda2, xCpto2 : String;
   xECANO, xECMM, xECDD, xECSS, xECSEM : String;
   xECTRI, xECAASS, xECAASem, xECAATri : String;
begin

   xWhere:='FECHA=' +DMTE.wRepFuncDate + '''' + formatdatetime(DMTE.wFormatFecha, FecCheque.Date)+''')';
   xAAMM :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
   xAAMM :=xAAMM+ DMTE.cdsQry.FieldByName('FECMES').AsString;

   xECANO  :=DMTE.cdsqry.FieldByName('FecAno').AsString  ;
   xECMM   :=DMTE.cdsqry.FieldByName('FecMes').AsString  ;
   xECDD   :=DMTE.cdsqry.FieldByName('FecDia').AsString  ;
   xECSS   :=DMTE.cdsqry.FieldByName('FecSS').AsString   ;
   xECSEM  :=DMTE.cdsqry.FieldByName('FecSem').AsString  ;
   xECTRI  :=DMTE.cdsqry.FieldByName('FecTrim').Asstring ;
   xECAASS :=DMTE.cdsqry.FieldByName('FecAASS').AsString ;
   xECAASem:=DMTE.cdsqry.FieldByName('FecAASem').AsString;
   xECAATri:=DMTE.cdsqry.FieldByName('FecAATri').AsString;

   BuscaBanco( DMTE.cdsEgrCajaX.FieldByName('BANCOTRANS').AsString, DMTE.cdsEgrCajaX.FieldByName('CCBCOTRANS').AsString );
	 xMoneda1 :=xTMoneda;
   xTDiario1:=xTDiario;
   xCuenta1 :=xCuenta;
   xNoComp1 :=xNoComp;
   xCpto1   :=xCpto   ;

   BuscaBanco( DMTE.cdsEgrCajaX.FieldByName('BANCOTRANO').AsString, DMTE.cdsEgrCajaX.FieldByName('CCBCOTRANO').AsString );
	 xMoneda2 :=xTMoneda;
   xTDiario2:=xTDiario;
   xCuenta2 :=xCuenta;
   xNoComp2 :=xNoComp;
   xCpto2   :=xCpto   ;


   // Cabeceras de Transferencias
   xSQL:='Select * from CAJA302 Where CIAID=''ZZ''';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest( xSQL );
   DMTE.cdsEgrCaja.Open;

   DMTE.cdsEgrCaja.Insert;
	 DMTE.cdsEgrCaja.FieldByName('CIAID').AsString     :=DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString;
	 DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString   :=DMTE.cdsEgrCajaX.FieldByName('BANCOTRANO').AsString;
	 DMTE.cdsEgrCaja.FieldbyName('CCBCOID').AsString   :=DMTE.cdsEgrCajaX.FieldByName('CCBCOTRANO').AsString;
	 DMTE.cdsEgrCaja.FieldbyName('ECNOCHQ').AsString   :=DMTE.cdsEgrCajaX.FieldByName('TXNOCHQ').AsString;
	 DMTE.cdsEgrCaja.FieldBYName('TMONID').AsString    :=xMoneda1;
   DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString   :=xTDiario1;
   DMTE.cdsEgrCaja.FieldbyName('CUENTAID').AsString  :=xCuenta1;
   DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString    :=xCpto1;
   DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString  :=xNoComp1;
   DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString   :=xAAMM;
   DMTE.cdsEgrCaja.FieldByName('TDIARIO2').AsString  :=xTDiario2;
   DMTE.cdsEgrCaja.FieldByName('ECNOCOMP2').AsString :=xNoComp2;
   DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value      :=DateS;
   DMTE.cdsEgrCaja.FieldByName('ECFEMICH').Value     :=DateS;
   DMTE.cdsEgrCaja.FieldByName('EC_IE').AsString     :='I';
   DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString    :='';
   DMTE.cdsEgrCaja.FieldByName('DOCID').AsString     :=DMTE.wTipoDocTransferencia;
   DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString   :=DMTE.cdsEgrCajaX.FieldByName('CCNODOC').AsString;
   DMTE.cdsEgrCaja.Fieldbyname('ECTCAMB').AsString   :=DMTE.cdsEgrCajaX.FieldByName('TXTCAMB').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString   :='Devolución de Cheques';
   DMTE.cdsEgrCaja.FieldbyName('ECLOTE').AsString    :='';
   DMTE.cdsEgrCaja.FieldbyName('ECESTADO').AsString  :='P';
   DMTE.cdsEgrCaja.FieldbyName('ECANO').AsString    :=xECANO;
   DMTE.cdsEgrCaja.FieldbyName('ECMM').AsString     :=xECMM;
   DMTE.cdsEgrCaja.FieldbyName('ECDD').AsString     :=xECDD;
   DMTE.cdsEgrCaja.FieldbyName('ECSS').AsString     :=xECSS;
   DMTE.cdsEgrCaja.FieldbyName('ECSEM').AsString    :=xECSEM;
   DMTE.cdsEgrCaja.FieldbyName('ECTRI').AsString    :=xECTRI;
   DMTE.cdsEgrCaja.FieldbyName('ECAASS').AsString   :=xECAASS;
   DMTE.cdsEgrCaja.FieldbyName('ECAASem').AsString  :=xECAASem;
   DMTE.cdsEgrCaja.FieldbyName('ECAATri').AsString  :=xECAATri;
   DMTE.cdsEgrCaja.FieldByname('EC_PROCE').Value    :='7';
	 DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString :=DMTE.cdsEgrCajaX.FieldByName('TXMTOORI').AsString;
	 DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString :=DMTE.cdsEgrCajaX.FieldByName('TXMTOLOC').AsString;
	 DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsString :=DMTE.cdsEgrCajaX.FieldByName('TXMTOEXT').AsString;
	 DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString  :=DMTE.cdsEgrCajaX.FieldByName('FPAGOID').AsString;
	 DMTE.cdsEgrCaja.FieldBYName('ECFEMICH').Value    :=DateS;
   DMTE.cdsEgrCaja.FieldByName('ECUSER').Value      :=DMTE.wUsuario; // usuario que registra
   DMTE.cdsEgrCaja.FieldByName('ECFREG').Value      :=DateS;         // fecha que registra Usuario
   DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime :=Time;         // Hora de Registro de Usuario
   DMTE.cdsEgrCaja.Post;

   DMTE.cdsEgrCaja.Insert ;
	 DMTE.cdsEgrCaja.FieldByName('CIAID').AsString     :=DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString;
	 DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString   :=DMTE.cdsEgrCajaX.FieldByName('BANCOTRANS').AsString;
	 DMTE.cdsEgrCaja.FieldbyName('CCBCOID').AsString   :=DMTE.cdsEgrCajaX.FieldByName('CCBCOTRANS').AsString;
	 DMTE.cdsEgrCaja.FieldbyName('ECNOCHQ').AsString   :=DMTE.cdsEgrCajaX.FieldByName('TXNOCHQ').AsString;
	 DMTE.cdsEgrCaja.FieldBYName('TMONID').AsString    :=xMoneda2;
	 DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString   :=xTDiario2;
	 DMTE.cdsEgrCaja.FieldbyName('CUENTAID').AsString  :=xCuenta2;
	 DMTE.cdsEgrCaja.FieldByName('CPTOID').AsString    :=xCpto2;
	 DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString  :=xNoComp2;
	 DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString   :=xAAMM;
	 DMTE.cdsEgrCaja.FieldByName('TDIARIO2').AsString  :=xTDiario1;
	 DMTE.cdsEgrCaja.FieldByName('ECNOCOMP2').AsString :=xNoComp1;
	 DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value      :=DateS;
	 DMTE.cdsEgrCaja.FieldByName('ECFEMICH').Value     :=DateS;
	 DMTE.cdsEgrCaja.FieldBYName('EC_IE').AsString     :='E';
	 DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString    :='';
	 DMTE.cdsEgrCaja.FieldBYName('DOCID').AsString     :=DMTE.wTipoDocTransferencia;
   DMTE.cdsEgrCaja.FieldByName('ECNODOC').AsString   :=DMTE.cdsEgrCajaX.FieldByName('CCNODOC').AsString;
	 DMTE.cdsEgrCaja.Fieldbyname('ECTCAMB').AsString   :=DMTE.cdsEgrCajaX.FieldByName('TXTCAMB').AsString;
	 DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString   :='Devolución de Cheques';
   DMTE.cdsEgrCaja.FieldbyName('ECLOTE').AsString    :='';
   DMTE.cdsEgrCaja.FieldbyName('ECESTADO').AsString  :='P';
   DMTE.cdsEgrCaja.FieldbyName('ECANO').AsString    :=xECANO;
   DMTE.cdsEgrCaja.FieldbyName('ECMM').AsString     :=xECMM;
   DMTE.cdsEgrCaja.FieldbyName('ECDD').AsString     :=xECDD;
   DMTE.cdsEgrCaja.FieldbyName('ECSS').AsString     :=xECSS;
   DMTE.cdsEgrCaja.FieldbyName('ECSEM').AsString    :=xECSEM;
   DMTE.cdsEgrCaja.FieldbyName('ECTRI').AsString    :=xECTRI;
   DMTE.cdsEgrCaja.FieldbyName('ECAASS').AsString   :=xECAASS;
   DMTE.cdsEgrCaja.FieldbyName('ECAASem').AsString  :=xECAASem;
   DMTE.cdsEgrCaja.FieldbyName('ECAATri').AsString  :=xECAATri;
   DMTE.cdsEgrCaja.FieldBYName('EC_PROCE').AsString  :='4';
   DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString :=DMTE.cdsEgrCajaX.FieldByName('TXMTOORI').AsString;
	 DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString :=DMTE.cdsEgrCajaX.FieldByName('TXMTOLOC').AsString;
	 DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsString :=DMTE.cdsEgrCajaX.FieldByName('TXMTOEXT').AsString;
	 DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString  :=DMTE.cdsEgrCajaX.FieldByName('FPAGOID').AsString;
	 DMTE.cdsEgrCaja.FieldBYName('ECFEMICH').Value    :=DateS;
   DMTE.cdsEgrCaja.FieldByName('ECUSER').Value      :=DMTE.wUsuario; // usuario que registra
   DMTE.cdsEgrCaja.FieldByName('ECFREG').Value      :=DateS;         // fecha que registra Usuario
   DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime :=Time;         // Hora de Registro de Usuario
   DMTE.cdsEgrCaja.Post;
   DMTE.cdsEgrCaja.ApplyUpdates(0);


   // Detalle de Transferencia
   xSQL:='Select * from CAJA305 Where CIAID=''ZZ'' ';
   DMTE.cdsTrans.Close;
   DMTE.cdsTrans.DataRequest( xSQL );
   DMTE.cdsTrans.Open;

   DMTE.cdsTrans.Insert;
   DMTE.cdsTrans.FieldByName('CIAID').AsString     :=DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString;
   DMTE.cdsTrans.FieldByName('ECANOMM').AsString   :=xAAMM;
   DMTE.cdsTrans.FieldByName('ECNOCOMP').AsString  :=xNoComp1;
   DMTE.cdsTrans.FieldByName('TDIARID').AsString   :=xTDiario1;
   DMTE.cdsTrans.FieldByName('TXUSER').Value       :=DMTE.wUsuario; // usuario que registra
   DMTE.cdsTrans.FieldByName('TXFREG').Value       :=DateS;         // fecha que registra Usuario
   DMTE.cdsTrans.FieldByName('TXHREG').AsDateTime  :=Time;         // Hora de Registro de Usuario
   DMTE.cdsTrans.FieldByName('TXNOREG').AsString   :='0000000001';
	 DMTE.cdsTrans.FieldByName('TXTCAMB').AsString   :=DMTE.cdsEgrCajaX.FieldByname('TXTCAMB').AsString;
	 DMTE.cdsTrans.FieldByName('TMONID').Value       :=DMTE.cdsEgrCajaX.FieldByname('TMONID').AsString;
	 DMTE.cdsTrans.FieldByName('FPAGOID').AsString   :=DMTE.cdsEgrCajaX.FieldByname('FPAGOID').AsString;
	 DMTE.cdsTrans.FieldByName('TXNOCHQ').AsString   :=DMTE.cdsEgrCajaX.FieldByname('TXNOCHQ').AsString;
	 DMTE.cdsTrans.FieldByName('BANCOID').AsString   :=DMTE.cdsEgrCajaX.FieldByname('BANCOID').AsString;
	 DMTE.cdsTrans.FieldByName('CCTREC').AsString    :=DMTE.cdsEgrCajaX.FieldByname('CCTREC').AsString;
	 DMTE.cdsTrans.FieldByName('DOCID').AsString     :=DMTE.cdsEgrCajaX.FieldByname('DOCID').AsString;
	 DMTE.cdsTrans.FieldByName('CCNODOC').AsString   :=DMTE.cdsEgrCajaX.FieldByname('CCNODOC').AsString;
	 DMTE.cdsTrans.FieldByName('CLAUXID').AsString   :=DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString;
	 DMTE.cdsTrans.FieldByName('CLIEID').AsString    :=DMTE.cdsEgrCajaX.FieldByName('CLIEID').AsString;
	 DMTE.cdsTrans.FieldByName('BANCOTRANS').AsString:=DMTE.cdsEgrCajaX.FieldByName('BANCOTRANO').AsString;
	 DMTE.cdsTrans.FieldByName('CCBCOTRANS').AsString:=DMTE.cdsEgrCajaX.FieldByName('CCBCOTRANO').AsString;
	 DMTE.cdsTrans.FieldByName('BANCOTRANO').AsString:=DMTE.cdsEgrCajaX.FieldByName('BANCOTRANS').AsString;
	 DMTE.cdsTrans.FieldByName('CCBCOTRANO').AsString:=DMTE.cdsEgrCajaX.FieldByName('CCBCOTRANS').AsString;
 //DMTE.cdsTrans.FieldByName('CHQ_ESTADO').AsString:='DEVUELTO';
	 DMTE.cdsTrans.FieldByName('TXMTOORI').AsString  :=DMTE.cdsEgrCajaX.FieldByname('TXMTOORI').AsString;
	 DMTE.cdsTrans.FieldByName('TXMTOLOC').AsString  :=DMTE.cdsEgrCajaX.FieldByname('TXMTOLOC').AsString;
	 DMTE.cdsTrans.FieldByName('TXMTOEXT').AsString  :=DMTE.cdsEgrCajaX.FieldByname('TXMTOEXT').AsString;
	 cdsPost( DMTE.cdsTrans );
	 DMTE.cdsTrans.Post;

	 DMTE.cdsTrans.Insert;
   DMTE.cdsTrans.FieldByName('CIAID').AsString     := DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString;
	 DMTE.cdsTrans.FieldByName('ECANOMM').AsString   := xAAMM;
   DMTE.cdsTrans.FieldByName('ECNOCOMP').AsString  := xNoComp2;
   DMTE.cdsTrans.FieldByName('TDIARID').AsString   := xTDiario2;
   DMTE.cdsTrans.FieldByName('TXUSER').Value       := DMTE.wUsuario; // usuario que registra
   DMTE.cdsTrans.FieldByName('TXFREG').Value       := Date;         // fecha que registra Usuario
   DMTE.cdsTrans.FieldByName('TXHREG').AsDateTime  := Time;         // Hora de Registro de Usuario
   DMTE.cdsTrans.FieldByName('TXNOREG').AsString   :='0000000001';
	 DMTE.cdsTrans.FieldByName('TXTCAMB').AsString   :=DMTE.cdsEgrCajaX.FieldByname('TXTCAMB').AsString;
	 DMTE.cdsTrans.FieldByName('TMONID').Value       :=DMTE.cdsEgrCajaX.FieldByname('TMONID').AsString;
	 DMTE.cdsTrans.FieldByName('FPAGOID').AsString   :=DMTE.cdsEgrCajaX.FieldByname('FPAGOID').AsString;
	 DMTE.cdsTrans.FieldByName('TXNOCHQ').AsString   :=DMTE.cdsEgrCajaX.FieldByname('TXNOCHQ').AsString;
	 DMTE.cdsTrans.FieldByName('BANCOID').AsString   :=DMTE.cdsEgrCajaX.FieldByname('BANCOID').AsString;
	 DMTE.cdsTrans.FieldByName('CCTREC').AsString    :=DMTE.cdsEgrCajaX.FieldByname('CCTREC').AsString;
	 DMTE.cdsTrans.FieldByName('DOCID').AsString     :=DMTE.cdsEgrCajaX.FieldByname('DOCID').AsString;
	 DMTE.cdsTrans.FieldByName('CCNODOC').AsString   :=DMTE.cdsEgrCajaX.FieldByname('CCNODOC').AsString;
	 DMTE.cdsTrans.FieldByName('CLAUXID').AsString   :=DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString;
	 DMTE.cdsTrans.FieldByName('CLIEID').AsString    :=DMTE.cdsEgrCajaX.FieldByName('CLIEID').AsString;
	 DMTE.cdsTrans.FieldByName('BANCOTRANS').AsString:=DMTE.cdsEgrCajaX.FieldByName('BANCOTRANO').AsString;
	 DMTE.cdsTrans.FieldByName('CCBCOTRANS').AsString:=DMTE.cdsEgrCajaX.FieldByName('CCBCOTRANO').AsString;
	 DMTE.cdsTrans.FieldByName('BANCOTRANO').AsString:=DMTE.cdsEgrCajaX.FieldByName('BANCOTRANS').AsString;
	 DMTE.cdsTrans.FieldByName('CCBCOTRANO').AsString:=DMTE.cdsEgrCajaX.FieldByName('CCBCOTRANS').AsString;
 //DMTE.cdsTrans.FieldByName('CHQ_ESTADO').AsString:='DEVUELTO';
	 DMTE.cdsTrans.FieldByName('TXMTOORI').AsString  :=DMTE.cdsEgrCajaX.FieldByname('TXMTOORI').AsString;
	 DMTE.cdsTrans.FieldByName('TXMTOLOC').AsString  :=DMTE.cdsEgrCajaX.FieldByname('TXMTOLOC').AsString;
	 DMTE.cdsTrans.FieldByName('TXMTOEXT').AsString  :=DMTE.cdsEgrCajaX.FieldByname('TXMTOEXT').AsString;
	 cdsPost( DMTE.cdsTrans );
	 DMTE.cdsTrans.Post;

	 DMTE.cdsTrans.ApplyUpdates(0) ;
end;


procedure TFToolCheque.BuscaBanco( cBanco, cCCBco : String );
var
   xWhere, xBcoDes, sCajaBanco : String;

begin

{   if DiaAperturado(dbdtpFComp.Date,dblcBanco.text) then
   begin}
      xBcoDes:=DMTE.DisplayDescrip('prvTGE','TGE105','*','BANCOID='+quotedstr(cBanco),'BANCOABR');
      sCajaBanco:=DMTE.cdsQry.FieldbyName('BCOTIPCTA').AsString;
      if xBcoDes<>'' then begin
         if sCajaBanco='C' then
         begin //Si es CAJA
            xTMoneda:=DMTE.cdsQry.fieldbyName('TMONID').AsString;
            xTDiario:=DMTE.DisplayDescrip('prvTGE','TGE106','*','BANCOID='+quotedstr(cBanco),'CCBCOVOUCH');
            xCuenta :=DMTE.DisplayDescrip('prvTGE','TGE105','CUENTAID','BANCOID='+quotedstr(cBanco),'CUENTAID');
            xCpto   :=DMTE.DisplayDescrip('prvTGE','TGE105','CPTOID','BANCOID='+quotedstr(cBanco),'CPTOID');
         end
         else
         begin  //Si es BANCO
            xWhere:='BANCOID='+quotedstr(cBanco)+' and CCBCOID='+quotedstr(cCCBco);
            xTDiario:=DMTE.DisplayDescrip('prvTGE','TGE106','*', xWhere,'CCBCOVOUCH');
            xTMoneda:=DMTE.cdsQry.fieldbyName('TMONID').AsString ;
            xCuenta :=DMTE.cdsQry.fieldbyname('CTAPRINC').AsString ;
            xCpto   :='';
         end;

         xWhere:='CIAID='''  +DMTE.cdsEgrCajaX.fieldbyName('CIAID').AsString+''' AND '
                +'TDIARID='''+xTDiario +''' and ECANOMM='''+xAAMM+'''';

         if DMTE.RecuperarDatos('CAJA302','MAX(ECNOCOMP) MAXIMO',xWhere) then
         begin
            if not DMTE.cdsRec.fieldbyname('MAXIMO').isnull then
               xNoComp:=DMTE.strZero(inttostr((DMTE.cdsRec.fieldbyname('MAXIMO').AsInteger +1)),10)
            else
               xNoComp:='0000000001';
         end;
      end;
{   end;}
end;


procedure TFToolCheque.dblcBancoEnter(Sender: TObject);
begin
	 dblcBanco.Selected.Clear;
	 dblcBanco.Selected.Add( 'BANCOID'    + #9 + '05' + #9 + 'Id.'  );
	 dblcBanco.Selected.Add( 'BANCONOM'   + #9 + '20' + #9 + 'Banco' );
end;

procedure TFToolCheque.Z2bbtnOrdenPagoClick(Sender: TObject);
//////// Para sustituir tipo CTRL + R del DELPHI
   Function Sustituir(pCadena,pEsto,pPor : String) : STring;
   var
      xPos : Integer;
   begin
      xPos := Pos(pEsto,pCadena);
      Result := '';
      while (xPos <> 0 ) do
      begin
         Result := Result + copy(pCadena,1,xPos-1)+pPor;
         Delete(pCadena,1,xPos+Length(pEsto)-1);
         xPos := Pos(pEsto,pCadena);
      end;
      Result := Result + pCadena;
   end;

var
   xFecha1,xFecha2,xOrder,xSql,xSQL2,xCadena,xWhere : String;
   xPos : Integer;
   xTotMN, xTotME : double;
begin

   if edtCiaxPag.Text='' then
   begin
      ShowMessage('Debe Seleccionar una Compañía');
      exit;
   end;
   xSQL :=  FRegistro.xFiltroCHQ.FMant.SQL;
{   xCadena := 'DECODE(CAJA302.ECESTADO,''A'',''ANULADO'',CNT201.AUXNOMB) AUXNOMB,'
                         +'DECODE(CAJA302.ECESTADO,''A'',0.00,CAJA302.ECMTOORI) ECMTOORI,'
                         +'CAJA302.* ';}
   xCadena := quotedstr(edtCiaxPag.Text)+' RAZ_SOC_COMPANIA,'
             +'case when CAJA302.ECESTADO=''A'' then ''ANULADO'' else CNT201.AUXNOMB end AUXNOMB,'
             +'case when CAJA302.ECESTADO=''A'' then 0.00 else CAJA302.ECMTOORI end ECMTOORI2,'
             +'CAJA302.* ';
   xSQL := uppercase(xSQL);
   xSQL := Sustituir(xSQL,'CAJA302.*',xCadena );
   xSQL := Sustituir(xSQL,' FROM CAJA302','FROM CAJA302,CNT201');
//   xSQL2 := ' and CAJA302.PROV = CNT201.AUXID ';
//   xSQL := Sustituir(xSQL,') SOLVISTA',' and CAJA302.PROV = CNT201.AUXID ) SOLVISTA');

   xPos := pos('ORDER',xSQL);
   xOrder := '';
   if xPos>0 then
   begin
      xOrder := TRIM(Copy(xSQL,xPos,Length(xSQL)));
      xSQL := Copy(xSQL,1,xPos -1);
   end;
   dblcEstado.LookupField:='';

   xPos := pos(') SOLVISTA',xSQL);
   if xPos>0 then
   xSQL := Sustituir(xSQL,') SOLVISTA',' and CAJA302.PROV = CNT201.AUXID and CAJA302.CLAUXID = CNT201.CLAUXID) SOLVISTA ')
   else
      xSQL := xSQL + ' and CAJA302.PROV = CNT201.AUXID and CAJA302.CLAUXID = CNT201.CLAUXID ';

   xSQL := xSQL +xOrder;
   DMTE.cdsQry2.IndexFieldNames := '';
   DMTE.cdsQry2.close;
   DMTE.cdsQry2.DataRequest(xSQL);
   DMTE.cdsQry2.Open;
   DMTE.cdsQry2.Last;
   xFecha2 := DMTE.cdsQry2.FieldByName('ECFEMICH').AsString;
   DMTE.cdsQry2.First;
   xFecha1 := DMTE.cdsQry2.FieldByName('ECFEMICH').AsString;

   xTotMN := 0;
   xTotME := 0;
   while not DMTE.cdsQry2.EOF do
   begin
      if DMTE.cdsQry2.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
         xTotMN := xTotMN+DMTE.Fround(DMTE.cdsQry2.FieldByName('ECMTOORI').AsFloat,12,2)
      else
         xTotME := xTotME+DMTE.FRound(DMTE.cdsQry2.FieldByName('ECMTOORI').AsFloat,12,2);
      DMTE.cdsQry2.Next;
   end;

   DMTE.cdsQry2.First;
   dbpCheque.DataSource := DMTE.dsQry2;
//   ppRptCheque.TEMPLATE.FileName := wRutaRpt + '\OrdenPago.rtm';  // <== asi decía en versión DM

   ppRptCheque.TEMPLATE.FileName := wRutaRpt + '\ORD. DE PAGO.rtm';   //  <== asi decía en versión INC
   ppRptCheque.template.LoadFromFile ;

   pplblTotMN.Text := floattostrf(xTotMN, ffNumber, 12, 2);
   pplblTotME.Text := floattostrf(xTotME, ffNumber, 12, 2);

   pplblSubTitulo.Caption := 'DEL '+xFecha1+' AL '+xFecha2;

   if DMTE.wUsuario='HNORIEGA' then
      ppd1.ShowModal
   else
      ppRptCheque.Print;

   dbpCheque.DataSource := nil;
   ppRptCheque.Stop;
end;

procedure TFToolCheque.bbtnExtornaClick(Sender: TObject);
var
   xSQL,xWhere,xECCONTA,xEC_PROCE,xECOPAGO :string;
   i:integer;
   xAno , xMes, xDia : word;
begin

	if (FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count>1) then
	begin
		ShowMessage('Se debe seleccionar solamente un(1) cheque');
      exit;
	end;

	if (FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count=0) then
	begin
		ShowMessage('Debe seleccionar un(1) cheque');
      exit;
	end;

   if (DMTE.cdsEgrCajaX.FieldByName('EC_IE').AsString='I') then
   begin
		ShowMessage('El Movimiento es el resultado(Ingreso) de un Extorno');
      exit;
	end;

   FExtCheques := TFExtCheques.Create(Self);
   try
      FExtCheques.ShowModal;
   finally
      FExtCheques.Free;
   end;

   pgctrlOrigenChange(Sender);

end;

procedure TFToolCheque.Contabiliza;
var
   xWhere : string ;
   i, xReg : Integer ;
   xSQL : String;
begin
   xWhere:='CIAID='''  +stCia+''' AND ECANOMM=''' +stPeriodo+''' and '
          +'TDIARID='''+stTDiario+''' AND ECNOCOMP='''+stNoComp+''' ' ;

   if not DMTE.RecuperarDatos('CAJA304','*',xWhere) then
   begin
   // a este error cae cuando ESTA declarado Contabilizado pero no encuentra
   // correspondencia en el CAJA304
      Raise Exception.Create('Error No existe comprobante Contabilizado') ;
   end ;

    // vhn 23/01/2001
   xSQL:='Select * from CAJA304 '
         +'Where CIAID='''   +stcia+''' and '
         +      'ECANOMM=''' +stperiodo+''' and '
         +      'TDIARID=''' +stTDiario+''' and '
         +      'ECNOCOMP='''+stNoComp+'''';
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
      DMTE.cdsCntCaja.FieldByName('CIAID').AsString    := stCia;
      DMTE.cdsCntCaja.FieldByName('ECANOMM').AsString  := wAnoMMExtorno;
      DMTE.cdsCntCaja.FieldByName('TDIARID').AsString  := stTDiario;
      DMTE.cdsCntCaja.FieldByName('ECNOCOMP').AsString := wNoCompExtorno;
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

procedure TFToolCheque.RevierteSaldos;
var
   xSQL ,
   xWhere : String ;
   xCPPAGORI ,
   xCPPAGLOC ,
   xCPPAGEXT : Currency ;
begin
   // vhn 22/01/2001
   xSQL:='Select * from CAJA303 '
        +'Where CIAID='''   +stCia+''' and '
        +      'ECANOMM=''' +stPeriodo+''' and '
        +      'TDIARID=''' +stTDiario+''' and '
        +      'ECNOCOMP='''+stNoComp+''' ';
   DMTE.cdsDocPago.Close;
   DMTE.cdsDocPago.DataRequest( xSQL );
   DMTE.cdsDocPago.Open;

   DMTE.cdsDocPago.First ;
   while not DMTE.cdsDocPago.Eof do
   begin
      xWhere:='CIAID='''   +stCia+''' and '
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

procedure TFToolCheque.ActualizaSaldosCaja;
var
   strFecha : TDate ;
begin
   strFecha := DMTE.cdsEgrCajaX.FieldByName('ECFCOMP').AsDateTime;
   DMTE.ActSdoTlfn(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString,DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString ,DMTE.cdsEgrCajaX.FieldByName('CCBCOID').AsString ,
                      DMTE.cdsEgrCajaX.fieldBYname('ECMTOORI').AsString,
                      strFecha,'E','-') ;

   DMTE.ActSdoMen(DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString ,DMTE.cdsEgrCajaX.FieldByName('CCBCOID').AsString,
                      DMTE.cdsEgrCajaX.fieldBYname('ECMTOORI').AsString,
                      strFecha,'I') ;
end;

procedure TFToolCheque.SetFlagExtorno;
var
   xSQL : String ;
begin     // vhn 22/01/2001
   xSQL:='Select CIAID, ECANOMM, TDIARID, ECNOCOMP, FEXTCHQ,ECESTADO from CAJA302 '
        +'Where CIAID='''   +stCia+''' and '
        +      'ECANOMM=''' +stPeriodo+''' and '
        +      'TDIARID=''' +stTDiario+''' and '
        +      'ECNOCOMP='''+stNoComp+''' ';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest( xSQL );
   DMTE.cdsEgrCaja.Open;

   if DMTE.cdsEgrCaja.RecordCount <> 0 then
   begin
      DMTE.cdsEgrCaja.Edit;
      DMTE.cdsEgrCaja.FieldByName('FEXTCHQ').AsString:='S';
      //** 25/07/2001 - PJSV
      DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString:='A';
      //**
      DMTE.cdsEgrCaja.Post;

      DMTE.AplicaDatos( DMTE.cdsEgrCaja, 'EGRCAJA' );
   end;
end;

procedure TFToolCheque.pgctrlOrigenChange(Sender: TObject);
var
	 xSQL : String;
begin
   xSQL:='Select FPAGOID from TGE112 '
        +'where (FCEGR=''1'' or FCEGR=''S'')'
        +' and (FCHQ=''1'' or FCHQ=''S'')';
	DMTE.cdsQry.Close;
	DMTE.cdsQry.Datarequest(xSQL);
	DMTE.cdsQry.open;

	if pgctrlOrigen.ActivePageIndex=0 then // Cheques por Pagar
   begin
	   xSQL:='Select CAJA302.* from CAJA302 '
        +'where CIAID='+quotedstr(dblcCiaxPag.Text);
      if DMTE.cdsQry.RecordCount=1 then
         xSQL := xSQL+' and FPAGOID='''+DMTE.cdsQry.FieldByName('FPAGOID').AsString+''''
      else
      begin
         xSQL := xSQL+' and (';
         DMTE.cdsQry.First;
         while not DMTE.cdsQry.EOF do
         begin
            xSQL := xSQL+' FPAGOID='+quotedstr(DMTE.cdsQry.FieldByName('FPAGOID').AsString);
            DMTE.cdsQry.Next;
            if not DMTE.cdsQry.EOF then
               xSQL := xSQL+' or ';
         end;
         xSQL := xSQL+') ';
      end;
  	   if dblcBcoxPag.Text<>'' then
         xSQL := xSQL+' and BANCOID=''' +dblcBcoxPag.Text+'''';
      xSQL := xSQL+' and EC_IE=''E'' ';
//      xSQL := 'Select * from ( '+xSQL+' ) SOLVISTA';
//      xSQL := 'Select SOLVISTA.* from ( '+xSQL+' ) SOLVISTA';

   	  FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.clear;
      FRegistro.xFiltroCHQ.UsuarioSQL.Clear;
      FRegistro.xFiltroCHQ.FMant.wTabla:='VWCAJACHQCXP';
      FRegistro.xFiltroCHQ.UsuarioSQL.Add( xSQL );
      FRegistro.xFiltroCHQ.NewQuery;
      FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.clear;
	end;

	if pgctrlOrigen.ActivePageIndex=1 then // Cheques por Cobrar en Banco
   begin
	   xSQL:='select * from TGE822';
	   DMTE.cdsQry2.Close;
	   DMTE.cdsQry2.DataRequest( xSQL );
	   DMTE.cdsQry2.Open;

	   dblcEstado.LookupTable:=DMTE.cdsQry2;
	   dblcEstado.LookupField:='CHQ_ESTADO';

   xSQL:='Select CAJA305.CIAID, CAJA305.TDIARID, CAJA305.ECANOMM, CAJA305.ECNOCOMP, CAJA305.TXNOREG, '
        +  'CAJA305.BANCOID,CAJA305.TXNOCHQ, CAJA305.TMONID, CAJA305.TXTCAMB, CAJA305.TXMTOORI, '
        +  'CAJA305.TXMTOLOC, CAJA305.TXMTOEXT,CAJA305.TXUSER, CAJA305.TXFREG, CAJA305.TXHREG, '
        +  'CAJA305.FLAGVAR, CAJA305.TXTPAGO, CAJA305.FPAGOID, CAJA305.CLAUXID, CAJA305.CLIEID, '
        +  'CAJA305.BANCOTRANS, CAJA305.CCBCOTRANS, CAJA305.BANCOTRANO,CAJA305.CCBCOTRANO, CAJA305.CCTREC,'
        +  'CAJA305.DOCID, CAJA305.CCNODOC, CAJA305.CHQ_ESTADO, CAJA305.CHQ_FECBCO, CAJA305.CHQ_FECEMI, '
        +  'CAJA305.CHQ_FECVCM, CAJA305.CHQ_FECCAN, CAJA305.CHQ_FECDCM, CAJA305.MOTDEVCHQ, '
        +  'TGE204.CLIEDES, TGE204.CLIERUC, CAJA305.CHQ_FECDEV '
        +'from CAJA305 '
        +'left outer join TGE204 on TGE204.CLAUXID=CAJA305.CLAUXID and TGE204.CLIEID=CAJA305.CLIEID ';

     if dblcCiaxCob.Text<>'' then
//       xSQL:=xSQL+' Where CIAID='+quotedstr(dblcCiaxCob.Text)+' and ( CHQ_ESTADO=''PEND.COB'' OR CHQ_ESTADO=''COBRADO'' OR CHQ_ESTADO=''DEVUELTO'' ) '
       xSQL:=xSQL+' Where CAJA305.CIAID=''D'' and ( CAJA305.CHQ_ESTADO=''PEND.COB'' OR CAJA305.CHQ_ESTADO=''COBRADO'' OR CAJA305.CHQ_ESTADO=''DEVUELTO'' ) '

     else
//       xSQL:=xSQL+' Where ( CHQ_ESTADO=''PEND.COB'' OR CHQ_ESTADO=''COBRADO'' OR CHQ_ESTADO=''DEVUELTO'' ) ';
       xSQL:=xSQL+' Where CAJA305.CIAID=''D'' and   ( CAJA305.CHQ_ESTADO=''PEND.COB'' OR CAJA305.CHQ_ESTADO=''COBRADO'' OR CAJA305.CHQ_ESTADO=''DEVUELTO'' ) ';

      if DMTE.cdsQry.RecordCount=1 then
         xSQL := xSQL +' and CAJA305.FPAGOID='''+DMTE.cdsQry.FieldByName('FPAGOID').AsString+''''
      else
      begin
         xSQL := xSQL+' AND (';
         DMTE.cdsQry.First;
         while not DMTE.cdsQry.EOF do
         begin
            //xSQL := xSQL+DMTE.cdsQry.FieldByName('FPAGOID').AsString;
            xSQL:=xSQL+'CAJA305.FPAGOID='+quotedstr(DMTE.cdsQry.FieldByName('FPAGOID').AsString);
            DMTE.cdsQry.Next;
            if not DMTE.cdsQry.EOF then
               xSQL := xSQL+' or ';
         end;
         xSQL := xSQL+') ';
      end;

	   if dblcBanco.Text<>''  then xSQL:=xSQL+' and CAJA305.BANCOID='''   +dblcBanco.Text+'''';

	   if dblcEstado.Text<>'' then xSQL:=xSQL+' and CAJA305.CHQ_ESTADO='''+dblcEstado.Text+'''';

      xSQL := 'Select * from ( '+xSQL+' ) SOLVISTA';

   	 FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.clear;
	   FRegistro.xFiltroCHQ.UsuarioSQL.Clear;
   	 FRegistro.xFiltroCHQ.FMant.wTabla:='VWCAJACHQCCBCO';
	   FRegistro.xFiltroCHQ.UsuarioSQL.Add( xSQL );
	   FRegistro.xFiltroCHQ.NewQuery;
	   FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.clear ;
	end;
end;

procedure TFToolCheque.dblcBcoxPagEnter(Sender: TObject);
begin
	dblcBcoxPag.Selected.Clear;
	dblcBcoxPag.Selected.Add( 'BANCOID'    + #9 + '05' + #9 + 'Id.'  );
	dblcBcoxPag.Selected.Add( 'BANCONOM'   + #9 + '20' + #9 + 'Banco' );
end;

procedure TFToolCheque.dblcBcoxPagExit(Sender: TObject);
var
   xSQL : String;
begin
	edtBcoxPag.Text:=DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr,'BANCOID',dblcBcoxPag.Text,'BANCONOM');

   xSQL:='Select FPAGOID from TGE112 '
        +'where (FCEGR=''1'' or FCEGR=''S'')'
        +' and (FCHQ=''1'' or FCHQ=''S'')';
   DMTE.cdsQry.Close;
	DMTE.cdsQry.Datarequest(xSQL);
	DMTE.cdsQry.Open;

	xSQL:='select * from CAJA302 '
        +'where CIAID='+quotedstr(dblcCiaxPag.Text);
   if DMTE.cdsQry.RecordCount=1 then
      xSQL := xSQL+' and FPAGOID='''+DMTE.cdsQry.FieldByName('FPAGOID').AsString+''''
   else
   begin
      xSQL := xSQL+' and (';
      DMTE.cdsQry.First;
      while not DMTE.cdsQry.EOF do
      begin
         xSQL := xSQL+'FPAGOID='+quotedstr(DMTE.cdsQry.FieldByName('FPAGOID').AsString);
         DMTE.cdsQry.Next;
         if not DMTE.cdsQry.EOF then
            xSQL := xSQL+' or ';
      end;
      xSQL := xSQL+') ';
   end;

	if dblcBcoxPag.Text<>'' then
      xSQL := xSQL+' and BANCOID=''' +dblcBcoxPag.Text+'''';

	FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.clear;
	FRegistro.xFiltroCHQ.UsuarioSQL.Clear;
	FRegistro.xFiltroCHQ.FMant.wTabla:='CAJA302';
	FRegistro.xFiltroCHQ.UsuarioSQL.Add( xSQL );
	FRegistro.xFiltroCHQ.NewQuery;
end;

procedure TFToolCheque.dblcCiaxPagEnter(Sender: TObject);
begin
	dblcCiaxPag.Selected.Clear;
	dblcCiaxPag.Selected.Add( 'CIAID'    + #9 + '05' + #9 + 'Id.'  );
	dblcCiaxPag.Selected.Add( 'CIADES'   + #9 + '20' + #9 + 'Compañía' );
end;

procedure TFToolCheque.dblcCiaxPagExit(Sender: TObject);
begin
	edtCiaxPag.Text:=DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCiaxPag.Text,'CIADES');
   if length(edtCiaxPag.Text)>0 then
      pgctrlOrigenChange(Sender);
end;

procedure TFToolCheque.dblcCiaxCobEnter(Sender: TObject);
begin
	dblcCiaxCob.Selected.Clear;
	dblcCiaxCob.Selected.Add( 'CIAID'    + #9 + '05' + #9 + 'Id.'  );
	dblcCiaxCob.Selected.Add( 'CIADES'   + #9 + '20' + #9 + 'Compañía' );
end;

procedure TFToolCheque.dblcCiaxCobExit(Sender: TObject);
begin
	 edtCiaxCob.Text:=DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCiaxCob.Text,'CIADES');
   if length(edtCiaxCob.Text)>0 then
      pgctrlOrigenChange(Sender);
end;

procedure TFToolCheque.FormActivate(Sender: TObject);
begin
   pgctrlOrigen.ActivePageIndex:=0;
   pgctrlOrigenChange(Sender);
   //anaX
   dblcCiaCaja.clear;
   dblcCiaCaja.Selected.Add('CIAID'#9'4'#9'Código'#9'F');
   dblcCiaCaja.Selected.Add('CIADES'#9'10'#9'Descripción'#9'F');

   //fin de Anax


end;

procedure TFToolCheque.Z2bbtnSinEmitirClick(Sender: TObject);
begin
   if edtCiaxPag.Text='' then
   begin
      ShowMessage('Debe Seleccionar una Compañía');
      exit;
   end;

   FEmiCheques :=TFEmiCheques.Create(Self);
   With FEmiCheques Do
   Try
      ShowModal;
   Finally
     Free;
   End;
end;

procedure TFToolCheque.Z2bbtnEmitidosClick(Sender: TObject);
begin
   if edtCiaxPag.Text='' then
   begin
      ShowMessage('Debe Seleccionar una Compañía');
      exit;
   end;
   FChequesEmitidos :=TFChequesEmitidos.Create(Self);
   FChequesEmitidos.dblcCia.text:=dblcCiaxPag.text;
   FChequesEmitidos.edtCia.text:=edtCiaxPag.text;
   Try
     FChequesEmitidos.ShowModal;
   Finally
      FChequesEmitidos.Free;
   end;
end;

procedure TFToolCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMTE.cdsConsulta.Close;
   DMTE.cdsConsulta.IndexFieldNames:='';
   DMTE.cdsConsulta.Filter:='';


end;

procedure TFToolCheque.dblcMotDevChqExit(Sender: TObject);
var
 xdescrip : String;
begin
    if length(dblcMotDevChq.text)=0 then
    begin
       edtMotDevChq.Text:='';
       Exit;
    end;
    xDescrip := ' MOTDEVCHQ='+quotedstr(dblcMotDevChq.text);
    edtMotDevChq.Text := DMTE.DisplayDescrip('prvTGE','CAJA104','MOTDEVCHQDES',xDescrip,'MOTDEVCHQDES');

    if length(edtMotDevChq.text)=0 then
    begin
     Showmessage('Debe Seleccionar el Tipo de Devolución');
     edtMotDevChq.setfocus;
     Exit;
    end;

end;

procedure TFToolCheque.dblcCiaCajaExit(Sender: TObject);
var
 xdescrip : String;
begin
   xDescrip := 'CIAID='+quotedstr(dblcCiaCaja.text);
   edtCiaCaja.Text := DMTE.DisplayDescrip('prvTGE','TGE101','CIADES',xDescrip,'CIADES');

   if length(dblcCiaCaja.text)=0 then
   begin
     showmessage('Falta Registrar Compañía');
     dblcCiaCaja.setfocus;
     Exit;
   End;

   if length(edtCiaCaja.text)=0 then
   begin
     showmessage('Falta Registrar Compañía');
     dblcCiaCaja.setfocus;
     Exit;
   End;
{    if length(dblcMotDevChq.text)=0 then
    begin
     Showmessage('Debe Seleccionar el Tipo de Devolución');
     dblcMotDevChq.setfocus;
     Exit;
    end;
    xDescrip := ' MOTDEVCHQ='+quotedstr(dblcMotDevChq.text);
    edtMotDevChq.Text := DMTE.DisplayDescrip('prvTGE','CAJA104','MOTDEVCHQDES',xDescrip,'MOTDEVCHQDES');

    if length(edtMotDevChq.text)=0 then
    begin
     Showmessage('Debe Seleccionar el Tipo de Devolución');
     edtMotDevChq.setfocus;
     Exit;
    end;

}
end;

procedure TFToolCheque.tsPorCobrarCajaShow(Sender: TObject);
var
 xsql : String;
begin
  //anax
   DMTE.cdsQry3.Filter:='';
   DMTE.cdsQry3.close;
   DMTE.Filtracds(DMTE.cdsQry3,'SELECT * FROM TGE105 WHERE BCOTIPCTA=''C''');
   dblcBancoDest.LOOKUPFIELD:='BANCOID';
   dblcBancoDest.lookuptable:=DMTE.cdsQry3;

   dblcBancoDest.Selected.Clear;
   dblcBancoDest.Selected.Add('BANCOID'#9'4'#9'Código'#9'F');
   dblcBancoDest.Selected.Add('BANCONOM'#9'20'#9'Descripción'#9'F');
   if length(dblcCajaDest.text)=0 then
      edtCajaDest.text:='';
  //anax

  dblcCiaCaja.Selected.Clear;
  dblcCiaCaja.Selected.Add('CIAID'#9'4'#9'Código'#9'F');
  dblcCiaCaja.Selected.Add('CIADES'#9'20'#9'Descripción'#9'F');

  DMTE.cdsBancoEgr.filter:='';
  DMTE.cdsBancoEgr.filter:='BCOTIPCTA=''B'' ';


  DMTE.cdsSQL.IndexFieldNames:='';
  DMTE.cdsSQL.close;
  DMTE.Filtracds(DMTE.cdsSQL,'SELECT * FROM TGE105 WHERE BCOTIPCTA=''B''');
  dblcBancoCaja.LOOKUPFIELD:='BANCOID';
  dblcBancoCaja.lookuptable:=DMTE.cdsSQL;

  dblcBancoCaja.Selected.Clear;
  dblcBancoCaja.Selected.Add('BANCOID'#9'4'#9'Código'#9'F');
  dblcBancoCaja.Selected.Add('BANCONOM'#9'20'#9'Descripción'#9'F');

  dblcCajaDest.Selected.Clear;
  dblcCajaDest.Selected.Add('BANCOID'#9'4'#9'Código'#9'F');
  dblcCajaDest.Selected.Add('BANCONOM'#9'20'#9'Descripción'#9'F');
  if length(dblcMotDevChqCaja.text)=0 then
     edtMotDevChqCaja.text:='';
  if length(dblcBancoCaja.text)=0 then
     edtBcoNomCaja.text:='';

  DMTE.Filtracds(DMTE.cdsConsulta,'select * from CAJA104 where  BCOFLAG=''N''');

  if DMTE.cdsConsulta.recordcount=0 then
  begin
    Showmessage('Falta Ingresar Motivos de Devolución en Referencias');
    Exit;
  end;
  dblcMotDevChqCaja.LOOKUPFIELD:='MOTDEVCHQ';
  dblcMotDevChqCaja.lookuptable:=DMTE.cdsconsulta;

  dblcMotDevChqCaja.Selected.Clear;
  dblcMotDevChqCaja.Selected.Add('MOTDEVCHQ'#9'4'#9'Código'#9'F');
  dblcMotDevChqCaja.Selected.Add('MOTDEVCHQDES'#9'15'#9'Descripción'#9'F');

  xSQL:='Select FPAGOID from TGE112 '
       +'where (FCEGR=''1'' or FCEGR=''S'')'
       +' and (FCHQ=''1'' or FCHQ=''S'')';
  DMTE.cdsQry.Close;
  DMTE.cdsQry.Datarequest(xSQL);
  DMTE.cdsQry.Open;

  if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
  begin
    xSQL:='Select '
          +'CAJA314.CIAID, CAJA314.TDIARID, CAJA314.ECNOCOMP, CAJA314.ECANOMM, CAJA314.FPAGOID, CAJA314.BANCOID,'
          +'CAJA314.TJAID, CAJA314.TMONID, CAJA314.FC_RECIBIDO, CAJA314.FC_COBRADO, CAJA314.FC_DEVOLVER,'
          +'CAJA314.TC_USADO, CAJA314.FCTCAMB, CAJA314.ECNOCHQ, CAJA314.CORRE, CAJA314.CCTREC, CAJA314.DOCID,'
          +'CAJA314.CCSERIE, CAJA314.CCNODOC, CAJA314.FC_MTOLOC, CAJA314.FC_MTOEXT, CAJA314.FC_FCANC,'
          +'CAJA314.FC_ESTADO, CAJA314.CPTOID, CAJA314.CLAUXID, CAJA314.CLIEID, CAJA314.FCTRANSF, CAJA314.LICOID,'
          +'CAJA314.CCBCOID, CAJA314.FC_FVCMTO, CAJA314.FC_FEMIS, CAJA314.FPAGODES, CAJA314.TMONABR, CAJA314.CAJAID,'
          +'CAJA314.CHQ_ESTADO, CAJA314.MOTDEVCHQ, TGE204.CLIEDES, TGE204.CLIERUC, CHQ_FECDEV '
          +'from CAJA314 '
          +'left outer join TGE204 on TGE204.CLAUXID=CAJA314.CLAUXID and TGE204.CLIEID=CAJA314.CLIEID ';
     xSQL:=xSQL+'where CAJA314.CIAID=''d'''
        +' and ( coalesce(CAJA314.FCTRANSF,''N'')<>''S'' ) ';
  end;
  if DMTE.SRV_D = 'ORACLE' then
  begin
    xSQL:='Select '
          +'CAJA314.CIAID, CAJA314.TDIARID, CAJA314.ECNOCOMP, CAJA314.ECANOMM, CAJA314.FPAGOID, CAJA314.BANCOID,'
          +'CAJA314.TJAID, CAJA314.TMONID, CAJA314.FC_RECIBIDO, CAJA314.FC_COBRADO, CAJA314.FC_DEVOLVER,'
          +'CAJA314.TC_USADO, CAJA314.FCTCAMB, CAJA314.ECNOCHQ, CAJA314.CORRE, CAJA314.CCTREC, CAJA314.DOCID,'
          +'CAJA314.CCSERIE, CAJA314.CCNODOC, CAJA314.FC_MTOLOC, CAJA314.FC_MTOEXT, CAJA314.FC_FCANC,'
          +'CAJA314.FC_ESTADO, CAJA314.CPTOID, CAJA314.CLAUXID, CAJA314.CLIEID, CAJA314.FCTRANSF, CAJA314.LICOID,'
          +'CAJA314.CCBCOID, CAJA314.FC_FVCMTO, CAJA314.FC_FEMIS, CAJA314.FPAGODES, CAJA314.TMONABR, CAJA314.CAJAID,'
          +'CAJA314.CHQ_ESTADO, CAJA314.MOTDEVCHQ, TGE204.CLIEDES, TGE204.CLIERUC, CHQ_FECDEV '
          +'from CAJA314,TGE204 ';
     xSQL:=xSQL+'where TGE204.CLAUXID=CAJA314.CLAUXID and TGE204.CLIEID=CAJA314.CLIEID and CAJA314.CIAID=''d'''
        +' and ( '+DMTE.wReplacCeros+'(CAJA314.FCTRANSF,''N'')<>''S'' ) ';
  end;
   if DMTE.cdsQry.RecordCount=1 then
      xSQL := xSQL +' and CAJA314.FPAGOID='''+DMTE.cdsQry.FieldByName('FPAGOID').AsString+''''
   else
   begin
      xSQL := xSQL+' and (';
      DMTE.cdsQry.First;
      while not DMTE.cdsQry.EOF do
      begin
         xSQL := xSQL+'CAJA314.FPAGOID='+quotedstr(DMTE.cdsQry.FieldByName('FPAGOID').AsString);
         DMTE.cdsQry.Next;
         if not DMTE.cdsQry.EOF then
            xSQL := xSQL+' or ';
      end;
      xSQL := xSQL+') ';
   end;

   xSQL := 'Select * from ( '+xSQL+' ) SOLVISTA';

	FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.clear;
	FRegistro.xFiltroCHQ.UsuarioSQL.Clear;
	FRegistro.xFiltroCHQ.FMant.wTabla:='VWCAJACHQCCCAJ';
	FRegistro.xFiltroCHQ.UsuarioSQL.Add(xSQL);
	FRegistro.xFiltroCHQ.NewQuery;

end;

procedure TFToolCheque.tsPorCobrarShow(Sender: TObject);
var
 xsql : String;
begin
  dblcBancoCaja.LOOKUPFIELD:='';
  dblcBancoCaja.lookuptable:=NIL;
  //anax
  DMTE.cdsQry3.Filter:='';
  DMTE.cdsQry3.close;
  DMTE.Filtracds(DMTE.cdsQry3,'SELECT * FROM TGE105 WHERE BCOTIPCTA=''B''');
//  dblcBancoDest.LOOKUPFIELD:='BANCOID';
//  dblcBancoDest.lookuptable:=DMTE.cdsQry3;
  dblcBanco.LOOKUPFIELD:='BANCOID';
  dblcBanco.lookuptable:=DMTE.cdsQry3;

  dblcBancoDest.Selected.Clear;
  dblcBancoDest.Selected.Add('BANCOID'#9'4'#9'Código'#9'F');
  dblcBancoDest.Selected.Add('BANCONOM'#9'20'#9'Descripción'#9'F');

  if length(dblcBancoDest.text)=0 then
    edtBcoDescDest.text:='';
  if length(dblcMotDevChq.text)=0 then
    edtMotDevChq.text:='';
  if length(dblcBanco.text)=0 then
    edtBanco.text:='';


   //ANAX
  DMTE.Filtracds(DMTE.cdsConsulta,'select * from CAJA104 where  BCOFLAG=''S''');

  if DMTE.cdsConsulta.recordcount=0 then
  begin
   Showmessage('Falta Ingresar Motivos de Devolución en Referencias');
   Exit;
  end;
  dblcMotDevChq.LOOKUPFIELD:='MOTDEVCHQ';
  dblcMotDevChq.lookuptable:=DMTE.cdsconsulta;

  dblcMotDevChq.Selected.Clear;
  dblcMotDevChq.Selected.Add('MOTDEVCHQ'#9'4'#9'Código'#9'F');
  dblcMotDevChq.Selected.Add('MOTDEVCHQDES'#9'10'#9'Descripción'#9'F');

  xSQL:='Select FPAGOID from TGE112 '
        +'where (FCEGR=''1'' or FCEGR=''S'')'
        +' and (FCHQ=''1'' or FCHQ=''S'')';
  DMTE.cdsQry.Close;
  DMTE.cdsQry.Datarequest(xSQL);
  DMTE.cdsQry.Open;

  if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
  begin
   xSQL:='Select CAJA305.CIAID, CAJA305.TDIARID, CAJA305.ECANOMM, CAJA305.ECNOCOMP, CAJA305.TXNOREG, '
        +  'CAJA305.BANCOID,CAJA305.TXNOCHQ, CAJA305.TMONID, CAJA305.TXTCAMB, CAJA305.TXMTOORI, '
        +  'CAJA305.TXMTOLOC, CAJA305.TXMTOEXT,CAJA305.TXUSER, CAJA305.TXFREG, CAJA305.TXHREG, '
        +  'CAJA305.FLAGVAR, CAJA305.TXTPAGO, CAJA305.FPAGOID, CAJA305.CLAUXID, CAJA305.CLIEID, '
        +  'CAJA305.BANCOTRANS, CAJA305.CCBCOTRANS, CAJA305.BANCOTRANO,CAJA305.CCBCOTRANO, CAJA305.CCTREC,'
        +  'CAJA305.DOCID, CAJA305.CCNODOC, CAJA305.CHQ_ESTADO, CAJA305.CHQ_FECBCO, CAJA305.CHQ_FECEMI, '
        +  'CAJA305.CHQ_FECVCM, CAJA305.CHQ_FECCAN, CAJA305.CHQ_FECDCM, CAJA305.MOTDEVCHQ, '
        +  'TGE204.CLIEDES, TGE204.CLIERUC, CHQ_FECDEV  '
        +'from CAJA305 '
        +'left outer join TGE204 on TGE204.CLAUXID=CAJA305.CLAUXID and TGE204.CLIEID=CAJA305.CLIEID';
  xSQL:=xSQL+' WHERE CAJA305.CIAID=''D'' AND ( CAJA305.CHQ_ESTADO=''PEND.COB'' OR CAJA305.CHQ_ESTADO=''COBRADO'' OR CAJA305.CHQ_ESTADO=''DEVUELTO'' ) ';
 end;

 if DMTE.SRV_D = 'ORACLE' then
 begin
   xSQL:='Select CAJA305.CIAID, CAJA305.TDIARID, CAJA305.ECANOMM, CAJA305.ECNOCOMP, CAJA305.TXNOREG, '
        +  'CAJA305.BANCOID,CAJA305.TXNOCHQ, CAJA305.TMONID, CAJA305.TXTCAMB, CAJA305.TXMTOORI, '
        +  'CAJA305.TXMTOLOC, CAJA305.TXMTOEXT,CAJA305.TXUSER, CAJA305.TXFREG, CAJA305.TXHREG, '
        +  'CAJA305.FLAGVAR, CAJA305.TXTPAGO, CAJA305.FPAGOID, CAJA305.CLAUXID, CAJA305.CLIEID, '
        +  'CAJA305.BANCOTRANS, CAJA305.CCBCOTRANS, CAJA305.BANCOTRANO,CAJA305.CCBCOTRANO, CAJA305.CCTREC,'
        +  'CAJA305.DOCID, CAJA305.CCNODOC, CAJA305.CHQ_ESTADO, CAJA305.CHQ_FECBCO, CAJA305.CHQ_FECEMI, '
        +  'CAJA305.CHQ_FECVCM, CAJA305.CHQ_FECCAN, CAJA305.CHQ_FECDCM, CAJA305.MOTDEVCHQ, '
        +  'TGE204.CLIEDES, TGE204.CLIERUC, CHQ_FECDEV  '
        +'from CAJA305,TGE204 ';
  xSQL:=xSQL+' WHERE TGE204.CLAUXID=CAJA305.CLAUXID and TGE204.CLIEID=CAJA305.CLIEID AND CAJA305.CIAID=''D'' AND ( CAJA305.CHQ_ESTADO=''PEND.COB'' OR CAJA305.CHQ_ESTADO=''COBRADO'' OR CAJA305.CHQ_ESTADO=''DEVUELTO'' ) ';
 end;

   if DMTE.cdsQry.RecordCount=1 then
      xSQL := xSQL +' and CAJA305.FPAGOID='''+DMTE.cdsQry.FieldByName('FPAGOID').AsString+''''
   else
   begin
      xSQL := xSQL+' and (';
      DMTE.cdsQry.First;
      while not DMTE.cdsQry.EOF do
      begin
         xSQL := xSQL+'CAJA305.FPAGOID='+quotedstr(DMTE.cdsQry.FieldByName('FPAGOID').AsString);
         DMTE.cdsQry.Next;
         if not DMTE.cdsQry.EOF then
            xSQL := xSQL+' or ';
      end;
      xSQL := xSQL+') ';
   end;

   xSQL := 'Select * from ( '+xSQL+' ) SOLVISTA';

	FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.clear;
	FRegistro.xFiltroCHQ.UsuarioSQL.Clear;
	FRegistro.xFiltroCHQ.FMant.wTabla:='VWCAJACHQCCBCO';
	FRegistro.xFiltroCHQ.UsuarioSQL.Add(xSQL);
	FRegistro.xFiltroCHQ.NewQuery;
 //FIN DE ANAX
  //anax
end;

procedure TFToolCheque.dblcBancoCajaExit(Sender: TObject);
var
 xdescrip : String;
begin
    if length(dblcBancoCaja.text)=0 then
    begin
       edtBcoNomCaja.Text :='';
       Exit;
    end;
    
    xDescrip := ' BANCOID='+quotedstr(dblcBancoCaja.text);
    edtBcoNomCaja.Text := DMTE.DisplayDescrip('prvTGE','TGE105','BANCONOM',xDescrip,'BANCONOM');
    if length(edtBcoNomCaja.text)=0 then
    begin
     Showmessage('Debe Seleccionar el Banco');
     dblcBancoCaja.Text:='';
     dblcBancoCaja.setfocus;
    end;



end;

procedure TFToolCheque.dblcMotDevChqCajaExit(Sender: TObject);
var
 xdescrip : String;
begin
    if length(dblcMotDevChqCaja.text)=0 then
    begin
     edtMotDevChqCaja.Text:='';
     Exit;
    end;
    
    xDescrip := ' MOTDEVCHQ='+quotedstr(dblcMotDevChqCaja.text);
    edtMotDevChqCaja.Text := DMTE.DisplayDescrip('prvTGE','CAJA104','MOTDEVCHQDES',xDescrip,'MOTDEVCHQDES');

    if length(edtMotDevChqCaja.text)=0 then
    begin
     Showmessage('Debe Seleccionar el Tipo de Devolución');
     dblcMotDevChqCaja.setfocus;
     Exit;
    end;

end;


procedure TFToolCheque.bbtnAceptarCajaClick(Sender: TObject);
var
	 xSQL : String;
begin
{    if length(dblcBancoCaja.text)=0 then
    begin
     Showmessage('Debe Seleccionar Banco');
     dblcBancoCaja.setfocus;
     Exit;
    end;

    if length(edtBcoNomCaja.text)=0 then
    begin
     Showmessage('Debe Seleccionar el Banco');
     dblcBancoCaja.setfocus;
     Exit;
    end;
 }
   xSQL:='Select FPAGOID from TGE112 '
        +'where (FCEGR=''1'' or FCEGR=''S'')'
        +' and (FCHQ=''1'' or FCHQ=''S'')';
   DMTE.cdsQry.Close;
	DMTE.cdsQry.Datarequest(xSQL);
	DMTE.cdsQry.Open;

	xSQL:='Select '
        +'CAJA314.CIAID, CAJA314.TDIARID, CAJA314.ECNOCOMP, CAJA314.ECANOMM, CAJA314.FPAGOID, CAJA314.BANCOID,'
        +'CAJA314.TJAID, CAJA314.TMONID, CAJA314.FC_RECIBIDO, CAJA314.FC_COBRADO, CAJA314.FC_DEVOLVER,'
        +'CAJA314.TC_USADO, CAJA314.FCTCAMB, CAJA314.ECNOCHQ, CAJA314.CORRE, CAJA314.CCTREC, CAJA314.DOCID,'
        +'CAJA314.CCSERIE, CAJA314.CCNODOC, CAJA314.FC_MTOLOC, CAJA314.FC_MTOEXT, CAJA314.FC_FCANC,'
        +'CAJA314.FC_ESTADO, CAJA314.CPTOID, CAJA314.CLAUXID, CAJA314.CLIEID, CAJA314.FCTRANSF, CAJA314.LICOID,'
        +'CAJA314.CCBCOID, CAJA314.FC_FVCMTO, CAJA314.FC_FEMIS, CAJA314.FPAGODES, CAJA314.TMONABR, CAJA314.CAJAID,'
        +'CAJA314.CHQ_ESTADO, CAJA314.MOTDEVCHQ, TGE204.CLIEDES, TGE204.CLIERUC, CAJA314.CHQ_FECDEV '
        +'from CAJA314 '
        +'left outer join TGE204 on TGE204.CLAUXID=CAJA314.CLAUXID and TGE204.CLIEID=CAJA314.CLIEID ';
    xSQL:=xSQL+'where CAJA314.CIAID='+quotedstr(dblcCiaCaja.Text);
//		  +' and ( coalesce(FCTRANSF,''N'')<>''S'' ) ';

   if DMTE.cdsQry.RecordCount=1 then
      xSQL := xSQL +' and CAJA314.FPAGOID='''+DMTE.cdsQry.FieldByName('FPAGOID').AsString+''''
   else
   begin
      xSQL := xSQL+' and (';
      DMTE.cdsQry.First;
      while not DMTE.cdsQry.EOF do
      begin
         xSQL := xSQL+'CAJA314.FPAGOID='+quotedstr(DMTE.cdsQry.FieldByName('FPAGOID').AsString);
         DMTE.cdsQry.Next;
         if not DMTE.cdsQry.EOF then
            xSQL := xSQL+' or ';
      end;
      xSQL := xSQL+') ';
   end;

	if dblcBancoCaja.Text<>''  then xSQL:=xSQL+' and CAJA314.BANCOID='''   +dblcBancoCaja.Text+'''';

	if dblcCajaDest.Text<>''  then xSQL:=xSQL+' and CAJA314.CAJAID='''   +dblcCajaDest.Text+'''';

   xSQL := 'Select * from ( '+xSQL+' ) SOLVISTA';
	FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.clear;
	FRegistro.xFiltroCHQ.UsuarioSQL.Clear;
	FRegistro.xFiltroCHQ.FMant.wTabla:='VWCAJACHQCCCAJ';
	FRegistro.xFiltroCHQ.UsuarioSQL.Add(xSQL);
	FRegistro.xFiltroCHQ.NewQuery;
end;


procedure TFToolCheque.bbtnCobradoCajaClick(Sender: TObject);
var
	 I : Integer;
begin
    if bbtnDevueltoCaja.Focused then exit;
	 if FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count>1 then
	 begin
			ShowMessage('Error : Se debe Seleccionar Solo Un Cheque');
	 end;

	 for i:= 0 to FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count-1 do
	 begin
			FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.GotoBookmark( FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i] );

			if DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString='DEVUELTO' then
      begin
				 ShowMessage('Cheque Ya Fue Devuelto');
				 FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
				 FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Clear;
				 Exit;
			end;

			if DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString='COBRADO' then
      begin
				 ShowMessage('Cheque Ya Fue Cobrado');
				 FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark( FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i] ) ;
				 FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Clear;
				 Exit;
			end;

	 end;

	 if MessageDlg('¿Actualizar el Cheque a Situación Cobrado?',mtConfirmation, [mbYes, mbNo], 0) IN [mrNo,mrCancel] then
			Exit;

	 for i:= 0 to FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count-1 do
	 begin
			FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.GotoBookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]);

			DMTE.cdsEgrCajaX.Edit;
			DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString:='COBRADO';
 			DMTE.cdsEgrCajaX.FieldByName('FC_FEMIS').AsDateTime:=FecChequeCaja.Date;
			DMTE.cdsEgrCajaX.Post;

			FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
	 end;

	 DMTE.AplicaDatos( DMTE.cdsEgrCajaX, 'EGRCAJAX' );


	 FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.clear ;  { Clear selected record list since they are all deleted}
	 FRegistro.xFiltroCHQ.FMant.dbgFiltro.RefreshDisplay  ;

   ShowMessage('El Cheque se Actualizó con Exito');
end;


procedure TFToolCheque.bbtnDevueltoCajaClick(Sender: TObject);
var
   i : Integer;
   xSQL, UpSQL : String;
   a,m,d :word;
begin
   if length(dblcMotDevChqCaja.text)=0 then
   begin
     Showmessage('Falta ingresar el Motivo de Devolución del Cheque');
     dblcMotDevChqCaja.setfocus;
     Exit;
   end;

   DecodeDate(FecChequeCaja.Date,a,m,d);

   if DMTE.BuscaCierre(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString,
                      DMTE.cdsEgrCajaX.FieldByName('CAJAID').AsString,
                      '',
                      DMTE.StrZero(IntToStr(a),4)+DMTE.StrZero(IntToStr(m),2)
                      ) then
   begin
      ShowMessage('Fecha con la cual se desea realizar el Extorno pertenece a un Periodo Cerrado.'
                  +chr(13)+'No se puede realizar la operación');
      exit;
	end;

   if DMTE.BuscaCierre(DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString,
                      DMTE.cdsEgrCajaX.FieldByName('CAJAID').AsString,
                      '',
                      DMTE.StrZero(IntToStr(a),4)+DMTE.StrZero(IntToStr(m),2)
                      ) then
   begin
      ShowMessage('Cheque pertenece a un Periodo Cerrado, no se puede Devolver!');
      exit;
	end;

	{QUITAR
   if FecCheque.Date<DMTE.cdsEgrCajaX.FieldByName('CHQ_FECEMI').AsDateTime then
   begin
      ShowMessage('La Fecha de Operación no puede ser menor que la fecha de emisión del Cheque');
      exit;
   end;}

	if FecChequeCaja.Date=0 then
  begin
    ShowMessage('Seleccione Fecha de Operación');
    exit;
  end;

	if FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count>1 then
  begin
    ShowMessage('Error : Se debe Seleccionar Solo Un Cheque');
    exit;
  end;

	if FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count=0 then
  begin
    ShowMessage('Error : Debe Seleccionar Un Cheque');
    exit;
  end;

   for i:= 0 to FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count-1 do
   begin
		FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.GotoBookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]);

		if DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString='DEVUELTO' then
      begin
			ShowMessage('Cheque Ya Fue Devuelto');
			FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
			exit;
		end;
		if DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString='COBRADO' then
      begin
			ShowMessage('Cheque Ya Fue Cobrado');
			FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
			Exit;
		end;
		if DMTE.cdsEgrCajaX.FieldByName('FCTRANSF').AsString='S' then
      begin
			ShowMessage('Cheque Ya Fue Transferido');
			FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
			Exit;
		end;
    /////
      xSQL := 'SELECT TXNOCHQ FROM CAJA305 '
      +'WHERE CIAID='''  +DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString   +''' '
      +  'AND CLAUXID='''+DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString +''' '
      +  'AND CLIEID=''' +DMTE.cdsEgrCajaX.FieldByName('CLIEID').AsString  +''' '
      +  'AND FPAGOID='''+DMTE.cdsEgrCajaX.FieldByName('FPAGOID').AsString +''' '
      +  'AND BANCOID='''+DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString +''' '
      +  'AND TMONID=''' +DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString  +''' '
      +  'AND TXNOCHQ='''+DMTE.cdsEgrCajaX.FieldByName('ECNOCHQ').AsString +'''';
      DMTE.cdsQry4.Close;
      DMTE.cdsQry4.DataRequest(xSQL);
      DMTE.cdsQry4.Open;
      if DMTE.cdsQry4.RecordCount>0 then
      begin
       ShowMessage('Cheque debe ser Devuelto desde la opción de Cheques x Cobrar en Banco');
       FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
       Exit;
	   	end;
    ////
	end;

	if MessageDlg('¿ Devolver el Cheque?',mtConfirmation, [mbYes, mbNo], 0) IN [mrNo,mrCancel] then
		exit;

	screen.Cursor := crHourGlass ;

	xSQL:='Select * from CXC301 Where CIAID=''ZZ''';
   DMTE.cdsMovCxC.Close;
   DMTE.cdsMovCxC.DataRequest( xSQL );
   DMTE.cdsMovCxC.Open;

   for i:= 0 to FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count-1 do
   begin
      FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.GotoBookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]);

		DMTE.cdsEgrCajaX.Edit;
		DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString  :='DEVUELTO';
		DMTE.cdsEgrCajaX.FieldByName('MOTDEVCHQ').AsString   :=dblcMotDevChqCaja.Text;
      DMTE.cdsEgrCajaX.FieldByName('CHQ_FECDEV').AsDateTime:=FecChequeCaja.Date;
		DMTE.cdsEgrCajaX.Post;

      UpSQL:='UPDATE CAJA314 SET CHQ_ESTADO='''+DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString+''', '
            +                   'MOTDEVCHQ=''' +DMTE.cdsEgrCajaX.FieldByName('MOTDEVCHQ').AsString +''', '
            +                   'CHQ_FECDEV='  +DMTE.wRepFuncDate+''''+FormatDatetime(DMTE.wFormatFecha, FecChequeCaja.Date)+''') '
            +'WHERE CIAID='''  +DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString   +''' '
            +  'AND CLAUXID='''+DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString +''' '
            +  'AND CLIEID=''' +DMTE.cdsEgrCajaX.FieldByName('CLIEID').AsString  +''' '
            +  'AND FPAGOID='''+DMTE.cdsEgrCajaX.FieldByName('FPAGOID').AsString +''' '
            +  'AND BANCOID='''+DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString +''' '
            +  'AND TMONID=''' +DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString  +''' '
            +  'AND ECNOCHQ='''+DMTE.cdsEgrCajaX.FieldByName('ECNOCHQ').AsString +'''';

      DMTE.DCOM1.AppServer.EjecutaSQL(UpSQL);

		GeneraChequeEnCxC301;

		FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
	end;

   if pgctrlOrigen.ActivePageIndex=1 then
      GrabaTransferencia;

   //if pgctrlOrigen.ActivePageIndex=2 then
   	 // GrabaTransferencia;    anax consultar a caja

	//DMTE.AplicaDatos( DMTE.cdsEgrCajaX, 'EGRCAJAX' );

	FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.clear ;  { Clear selected record list since they are all deleted}
	FRegistro.xFiltroCHQ.FMant.dbgFiltro.RefreshDisplay  ;

	screen.Cursor := crDefault ;

   ShowMessage('El Cheque se Devolvió con Exito');
end;


procedure TFToolCheque.dblcBancoDestExit(Sender: TObject);
var
 xdescrip : String;
begin
{    if length(dblcBancoDest.text)=0 then
    begin
     Showmessage('Debe Seleccionar el Banco de Destino');
     dblcBancoDest.setfocus;
     Exit;
    end;}

    xDescrip := ' BANCOID='+quotedstr(dblcBancoDest.text)+' AND BCOTIPCTA=''B'' '  ;
    edtBcoDescDest.Text := DMTE.DisplayDescrip('prvTGE','TGE105','BANCONOM',xDescrip,'BANCONOM');

{    if length(edtBcoDescDest.text)=0 then
    begin
     Showmessage('Debe Seleccionar el Banco de Destino');
     dblcBancoDest.setfocus;
     Exit;
    end;
 }

end;

procedure TFToolCheque.dblcCajaDestExit(Sender: TObject);
var
 xDescrip : String;
begin
    if length(dblcCajaDest.text)=0 then
    begin
       edtCajaDest.Text:='';
       Exit;
    end;

    xDescrip := ' BANCOID='+quotedstr(dblcCajaDest.text)+' AND BCOTIPCTA=''C'' '  ;
    edtCajaDest.Text := DMTE.DisplayDescrip('prvTGE','TGE105','BANCONOM',xDescrip,'BANCONOM');

    if length(edtCajaDest.text)=0 then
    begin
     Showmessage('Debe Seleccionar una Caja');
     dblcCajaDest.setfocus;
     Exit;
    end;


end;


procedure TFToolCheque.Z2bbtnCambiaFVClick(Sender: TObject);
var
   i : Integer;
   xSQL, UpSQL : String;
   a, m, d :word;
begin

   if length(dblcMotDevChqCaja.text)>0 then
   begin
     Showmessage('No debe Ingresar Motivo de Devolución del Cheque');
     Exit;
   end;

   DecodeDate(FecChequeCaja.Date,a,m,d);


	if FecChequeCaja.Date=0 then
   begin
      ShowMessage('Seleccione la Nueva Fecha de Vencimiento');
      exit;
   end;

	if FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count>1 then
   begin
      ShowMessage('Error : Se debe Seleccionar Solo Un Cheque');
      exit;
   end;

	if FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count=0 then
   begin
      ShowMessage('Error : Debe Seleccionar Un Cheque');
      exit;
   end;

   for i:= 0 to FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count-1 do
   begin
		FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.GotoBookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]);

		if DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString='DEVUELTO' then
      begin
			ShowMessage('Cheque Ya Fue Devuelto');
			FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
			exit;
		end;

		if DMTE.cdsEgrCajaX.FieldByName('CHQ_ESTADO').AsString='COBRADO' then
      begin
			ShowMessage('Cheque Ya Fue Cobrado');
			FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
			Exit;
		end;

		if DMTE.cdsEgrCajaX.FieldByName('FCTRANSF').AsString='S' then
      begin
			ShowMessage('Cheque Ya Fue Transferido');
			FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
			Exit;
		end;
	end;

	if MessageDlg('¿ Seguro de Cambiar la Fecha de Vencimiento del Cheque?',mtConfirmation, [mbYes, mbNo], 0) IN [mrNo,mrCancel] then
		exit;

	screen.Cursor := crHourGlass ;

   for i:= 0 to FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.Count-1 do
   begin
      FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.GotoBookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]);

		DMTE.cdsEgrCajaX.Edit;
		DMTE.cdsEgrCajaX.FieldByName('FC_FVCMTO').Value :=FecChequeCaja.Date;
      DMTE.cdsEgrCajaX.Post;

      UpSQL:='UPDATE CAJA314 SET FC_FVCMTO='+DMTE.wRepFuncDate+''''+FormatDatetime(DMTE.wFormatFecha, FecChequeCaja.Date)+''') '
            +'WHERE CIAID='''  +DMTE.cdsEgrCajaX.FieldByName('CIAID').AsString   +''' '
            +  'AND CLAUXID='''+DMTE.cdsEgrCajaX.FieldByName('CLAUXID').AsString +''' '
            +  'AND CLIEID=''' +DMTE.cdsEgrCajaX.FieldByName('CLIEID').AsString  +''' '
            +  'AND FPAGOID='''+DMTE.cdsEgrCajaX.FieldByName('FPAGOID').AsString +''' '
            +  'AND BANCOID='''+DMTE.cdsEgrCajaX.FieldByName('BANCOID').AsString +''' '
            +  'AND TMONID=''' +DMTE.cdsEgrCajaX.FieldByName('TMONID').AsString  +''' '
            +  'AND ECNOCHQ='''+DMTE.cdsEgrCajaX.FieldByName('ECNOCHQ').AsString +'''';

      DMTE.DCOM1.AppServer.EjecutaSQL(UpSQL);


		FRegistro.xFiltroCHQ.FMant.dbgFiltro.datasource.dataset.Freebookmark(FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.items[i]) ;
	end;

	//DMTE.AplicaDatos( DMTE.cdsEgrCajaX, 'EGRCAJAX' );

	FRegistro.xFiltroCHQ.FMant.dbgFiltro.SelectedList.clear ;  { Clear selected record list since they are all deleted}
	FRegistro.xFiltroCHQ.FMant.dbgFiltro.RefreshDisplay  ;

	screen.Cursor := crDefault ;

   ShowMessage('Cambio de Fecha de Vencimiento se Realizo con Exito');
end;

procedure TFToolCheque.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFToolCheque.BitBtn1Click(Sender: TObject);
   Function Sustituir(pCadena,pEsto,pPor : String) : STring;
   var
      xPos : Integer;
   begin
      xPos := Pos(pEsto,pCadena);
      Result := '';
      while (xPos <> 0 ) do
      begin
         Result := Result + copy(pCadena,1,xPos-1)+pPor;
         Delete(pCadena,1,xPos+Length(pEsto)-1);
         xPos := Pos(pEsto,pCadena);
      end;
      Result := Result + pCadena;
   end;

var
   xFecha1,xFecha2,xOrder,xSql,xSQL2,xCadena,xWhere : String;
   xPos : Integer;
   xTotMN, xTotME : double;
begin
   xSQL:='SELECT MAX(ECFEMICH) MAXFEC, MIN(ECFEMICH) MINFEC '
        +'FROM CAJA302 WHERE tdiarid=''06'' and EC_PROCE IN (''B'',''1'')';
   if FRegistro.xFiltroCHQ.FMant.SQL_WHERE<>'' then
      xSQL:=xSQL+' and '+FRegistro.xFiltroCHQ.FMant.SQL_WHERE;

   DMTE.cdsQry2.IndexFieldNames := '';
   DMTE.cdsQry2.close;
   DMTE.cdsQry2.DataRequest(xSQL);
   DMTE.cdsQry2.Open;
   xFecha2 := DMTE.cdsQry2.FieldByName('MAXFEC').AsString;
   xFecha1 := DMTE.cdsQry2.FieldByName('MINFEC').AsString;

   xSQL:= 'SELECT ''DERRAMA MAGISTERIAL'' RAZ_SOC_COMPANIA,'
        +'case when CAJA302.ECESTADO=''A'' then ''ANULADO'' else CNT201.AUXNOMB end AUXNOMB,'
        +'case when CAJA302.ECESTADO=''A'' then 0.00 else CAJA302.ECMTOORI end ECMTOORI2,'
        +'case when CAJA302.ECESTADO=''A'' then ''ANULADO'' else NULL end ESTADO, '
        +'case when CAJA302.TMONID=''N'' then 1 else 0 END TOTCHESOL,'
        +'case when CAJA302.TMONID=''D'' then 1 else 0 END TOTCHEDOL,'
        +'case when CAJA302.TMONID=''N'' and NVL(ECESTADO,''X'')=''C'' then ECMTOORI ELSE 0 END TOTSOL, '
        +'case when CAJA302.TMONID=''D'' and NVL(ECESTADO,''X'')=''C'' then ECMTOORI ELSE 0 END TOTDOL, '
        +'TGE103.TMONDES, TGE103.TMONABR, '
        +'CAJA302.* FROM CAJA302 WHERE tdiarid=''06'' and EC_PROCE IN (''B'',''1'') ';
   if FRegistro.xFiltroCHQ.FMant.SQL_WHERE<>'' then
      xSQL:=xSQL+' and '+FRegistro.xFiltroCHQ.FMant.SQL_WHERE;

   xSQL:=Sustituir(xSQL,' FROM CAJA302',' FROM CAJA302, CNT201, TGE103');
   xSQL:=xSQL+' and CAJA302.PROV=CNT201.AUXID and CAJA302.CLAUXID=CNT201.CLAUXID AND CAJA302.TMONID=TGE103.TMONID ';
   xSQL:=xSQL+' Order by CAJA302.TMONID, ECNOCHQ';

   DMTE.cdsQry2.IndexFieldNames := '';
   DMTE.cdsQry2.close;
   DMTE.cdsQry2.DataRequest(xSQL);
   DMTE.cdsQry2.Open;

   xTotMN := 0;
   xTotME := 0;
   while not DMTE.cdsQry2.EOF do
   begin
      if DMTE.cdsQry2.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
         xTotMN := xTotMN+DMTE.Fround(DMTE.cdsQry2.FieldByName('ECMTOORI').AsFloat,12,2)
      else
         xTotME := xTotME+DMTE.FRound(DMTE.cdsQry2.FieldByName('ECMTOORI').AsFloat,12,2);
      DMTE.cdsQry2.Next;
   end;

   DMTE.cdsQry2.First;
   dbpCheque.DataSource := DMTE.dsQry2;
   ppRptCheque.TEMPLATE.FileName := wRutaRpt + '\Cheques_Total.rtm';   //  <== asi decía en versión INC
   ppRptCheque.template.LoadFromFile ;
   pplblTotMN.Text := floattostrf(xTotMN, ffNumber, 12, 2);
   pplblTotME.Text := floattostrf(xTotME, ffNumber, 12, 2);
   pplblSubTitulo.Caption := 'DEL '+xFecha1+' AL '+xFecha2;

// Inicio HPC_201403_CAJA
// cambia control de diseño de reporte
   if cbDisenoRep.Checked then
      ppd1.ShowModal
   else
   begin
      ppRptCheque.Print;
      dbpCheque.DataSource := nil;
      ppRptCheque.Stop;
   end;
// Fin HPC_201403_CAJA
end;

procedure TFToolCheque.dblcCiaxPagNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFToolCheque.sbDisenoRepClick(Sender: TObject);
begin
// Inicio HPC_201403_CAJA
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
// Fin HPC_201403_CAJA
end;

end.


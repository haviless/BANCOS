unit Caja262;

// HPC_201601_CAJA 11/01/2016: Se define la variable wTMonLocDes para descripción de la Moneda Local
//                            Se define la variable wTMonExtDes para descripción de la Moneda Extranjera

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient,CAJADM,
  ppDB, ppDBPipe, ppCtrls, ppBands, ppPrnabl, ppClass, ppCache, ppComm,
	ppRelatv, ppProd, ppReport, oaContabiliza, Variants, ppTypes;

type
  TFCobConsolidado = class(TForm)
    pnlCabecera1: TPanel;
    pnlDetPago: TPanel;
    pnlBotones: TPanel;
    Z2bbtnSumat: TBitBtn;
    Z2bbtnGraba: TBitBtn;
    Z2bbtnCancelado: TBitBtn;
    Z2bbtnCancel2: TBitBtn;
    Z2bbtnNuevo: TBitBtn;
    Z2bbtnSube: TBitBtn;
    Z2bbtnAnula: TBitBtn;
    Z2bbtnOKCab: TBitBtn;
    Z2bbtnCancelCab: TBitBtn;
		Z2bbtnCont: TBitBtn;
		lblEstadoMov: TLabel;
    dblcdCnp: TwwDBLookupComboDlg;
    edtCia: TEdit;
		dblcCia: TwwDBLookupCombo;
    dbeGlosa: TwwDBEdit;
    dblcTDoc: TwwDBLookupCombo;
    edtTDoc: TEdit;
    dbeSerie: TwwDBEdit;
    dbeGiradoA: TwwDBEdit;
    dblcdAux: TwwDBLookupComboDlg;
    dblcClase: TwwDBLookupCombo;
    edtClase: TEdit;
    dblcTMonCab: TwwDBLookupCombo;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TEdit;
    edtCuenta: TEdit;
    edtTMonCab: TEdit;
    dbdtpFEmision: TwwDBDateTimePicker;
    dbeTCambio: TwwDBEdit;
    Z2bbtnCalc: TBitBtn;
    dblcdFEfec: TwwDBLookupComboDlg;
    dbeFEfec: TwwDBEdit;
    dbgDetFPago: TwwDBGrid;
    edtAuxRuc: TEdit;
    Z2bbtnEmite: TBitBtn;
    pprRecibo: TppReport;
    ppHeaderBand2: TppHeaderBand;
		ppDBText1: TppDBText;
    ppDBText2: TppDBText;
		ppDBText3: TppDBText;
		ppnNombre: TppLabel;
    ppLbDescrip: TppLabel;
    pplbFecha: TppLabel;
		ppLabel5: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText6: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppdbRecibo: TppDBPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    ppField7: TppField;
    ppField8: TppField;
    ppField9: TppField;
    ppField10: TppField;
    ppField11: TppField;
    edNumReg: TEdit;
    ppLbDescrip1: TppLabel;
		ppShape1: TppShape;
		pplbValor: TppLabel;
		dblcdLICO: TwwDBLookupComboDlg;
    Label1: TLabel;
    Label2: TLabel;
    dbgDepositos: TwwDBGrid;
    dbeNoComp: TwwDBEdit;
    z2bbtnImprime: TBitBtn;
    Label3: TLabel;
    dbeMN: TwwDBEdit;
    dbeME: TwwDBEdit;
    Label6: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Z2bbtnCalcClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Z2bbtnSumatClick(Sender: TObject);
    procedure Z2bbtnSubeClick(Sender: TObject);
    procedure Z2bbtnNuevoClick(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure Z2bbtnCanceladoClick(Sender: TObject);
    procedure Z2bbtnAnulaClick(Sender: TObject);
    procedure Z2bbtnCancelCabClick(Sender: TObject);
    procedure Z2bbtnOKCabClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Z2bbtnContClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeTCambioChange2(Sender: TObject);
    procedure dbeTCambioEnter2(Sender: TObject);
    procedure dbeTCambioExit2(Sender: TObject);
    procedure dblcBancoExit22(Sender: TObject);
    procedure dblcClaseExit22(Sender: TObject);
    procedure dblcdAuxExit2(Sender: TObject);
    procedure dblcdCnpExit2(Sender: TObject);
		procedure dblcTDocExit2(Sender: TObject);
		procedure dblcTMonCabExit2(Sender: TObject);
		procedure dbeGiradoAChange(Sender: TObject);
		procedure dbeSerieChange(Sender: TObject);
		procedure dbdtpFEmisionChange(Sender: TObject);
		procedure dbeGlosaChange(Sender: TObject);
		procedure FormDestroy(Sender: TObject);
		procedure Z2bbtnCancel2Click(Sender: TObject);
		procedure dbdtpFEmisionExit(Sender: TObject);
		procedure dblcdFEfecExit(Sender: TObject);
		procedure Z2bbtnEmiteClick(Sender: TObject);
		procedure pprReciboBeforePrint(Sender: TObject);
		procedure pprReciboPreviewFormCreate(Sender: TObject);
		procedure dblcCiaExit(Sender: TObject);
		procedure FormActivate(Sender: TObject);
		procedure dblcClaseNotInList(Sender: TObject; LookupTable: TDataSet;
			NewValue: String; var Accept: Boolean);
		procedure dblcdLICOEnter(Sender: TObject);
		procedure dblcdLICOExit(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
    procedure dblcdAuxDropDown(Sender: TObject);
	private
		{ Private declarations }
		//** 27/03/2001 - pjsv, para usarse con los DisplayDescrip
		xDescrip : String;
		//**
		cf1: TControlFoco;
		strTmp  : String;
		xMtoCta : Real;
		xMtoLoc, xMtoExt: Real;
		A2digitos ,A4digitos : Array of TWinControl;
		cdsFiltro: TwwClientDataset;
		xGraboNuevo: Boolean;
		//
		cdsTarjeta : TwwClientDataSet;
		cdsBanco : TwwClientDataSet;
		wFechaCierre: TDatetime;
		wFrecu: Integer;
		xInsercion : String;
		xNReg : Integer;
		xToTalMN : Double;
		xToTalME : Double;
		xToTalCMN : Double;
		xToTalCME : Double;
		xDiario, xPeriodo  : String;

		procedure RecalculaReg;
		procedure IniciaPanel;
		procedure Contabiliza;
		procedure Contab_IngCaja;
		procedure Contab_RegCxP;
//    procedure Contab_DifCambio;
		function  ValidaCampo:Boolean;
//    procedure ActPnlBotones;
		procedure IniciaDatos;
//    procedure ConfiguraAccesos;
//    procedure Proc_Admin;
//    procedure Proc_Consul;
//    procedure Libera_Admin;
//    procedure Libera_Consul;
//    procedure LibConfigAccesos;
		procedure ActivaBotones(pnl: TPanel;xFlag : Boolean);
		procedure FocoInicial;
		procedure GrabaMontoTotal;
//    procedure ActualizaSaldosCaja;
		Procedure AdicionaRegistro;
		Procedure EditaRegistro;
//    procedure RecCptosDifC;
		procedure ValidaCab;
		procedure RecuperaDescrip;
		procedure InHabilitaControles;
		procedure HabilitaControles;
		procedure AsignaClaveDetalle;
		procedure AsignaParametros;
		procedure cdsRegCxCBeforePost(DataSet: TDataSet);
		procedure ActualizaDetalle;
		procedure ActualizaFiltro;
		procedure LLenaEdits;
		procedure Inserta;
		procedure GrabaDetalle;
		procedure ValidacionTjaChq;
		procedure ValidacionCobradoTotal;
		procedure ValidacionDatos;
		procedure ValidaCancelacion;
		Procedure GrabaClave;
		procedure GrabaEstadoFPago(xEstado: string);
		PROCEDURE AcumulaDetFPago;
		procedure CalculaResto;
		procedure Redondear;
		procedure BuscaNRecibo;
		procedure Contab_Banco( xDHB : String );
		procedure InsertaCAJA302( xxCIA, xxTDI, xxAAMM, xxCOMP, xxCpto, xxCta,xxCta1, xxTmon, xxBCO, xxCCB : String;
															xxMtoLoc, xxMtoExt : Double;xProce:string );
		procedure PreparaCaja304( xxDIA, xxCOM : String );
    procedure InsertaComprobanteBancos;

	public
		{ Public declarations }
		procedure Adiciona;
    procedure Edita (Doc : structDocIng;cds : Twwclientdataset);
    procedure AsignaCDSFiltro(cds : TwwClientDataset);
  end;

var
  FCobConsolidado: TFCobConsolidado;
  wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,
  wbcancel2: Boolean;
  wModifica: Boolean;
  xdnumreg : string;

implementation
uses CAJAUTIL, Caja001, Caja224 , ppviewr, Caja006, Caja290 ;
{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}
function NumtoStr(wNumero:double):string;
var
	xNumStr,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12 : string;
  xGrupo, xTotal, xDecimal : string;
  xLargo, xVeces : integer;
  xcontador : integer;
begin
	// w1 para Unidades
  xNumStr := floattostr(int(wNumero));
  for xcontador := 1 to Length(FloatToStr(wNumero)) do
   begin
    if copy(FloatToStr(wNumero),xcontador,1) = '.' then
     begin
      xDecimal := copy(FloatToStr(wNumero),xcontador+1,Length(FloatToStr(wNumero)));
      break;
     end;
   end;
//  xDecimal:= floattostr(wNumero-int(wNumero));

  if wNumero-int(wNumero)>0 then
  begin
//  	if strtoint(copy(xDecimal,Length(xDecimal),1)) >= 5 then
    //** 02/01/2001 - pjsv
{    if copy(xDecimal,Length(xDecimal),1) <> '' then
    //**
    	if strtoint(copy(xDecimal,Length(xDecimal),1)) >= 5 then
      	xDecimal := inttostr(strtoint(copy(xDecimal,3,2))+1)
      else	xDecimal := copy(xDecimal,3,2)
    //** 02/01/2001 - pjsv
    else 	xDecimal := copy(xDecimal,3,2);
    //**
}
  end
  else
  begin
  	xDecimal:='00';
  end;
  //** 02/01/2001 - pjsv
  if length(xdecimal) = 1 then xdecimal := xdecimal + '0';
  //**
  xDecimal:= ' y '+xDecimal+'/100';
  xLargo := length(xNumStr);
  x1:='';x2:='';x3:='';x4:='';x5:='';x6:='';x7:='';x8:='';x9:='';x10:='';
  if xLargo>=1  then x1:=copy(xNumStr,xLargo,1);
  if xLargo>=2  then x2:=copy(xNumStr,xLargo-1,1);
  if xLargo>=3  then x3:=copy(xNumStr,xLargo-2,1);
  if xLargo>=4  then x4:=copy(xNumStr,xLargo-3,1);
  if xLargo>=5  then x5:=copy(xNumStr,xLargo-4,1);
  if xLargo>=6  then x6:=copy(xNumStr,xLargo-5,1);
  if xLargo>=7  then x7:=copy(xNumStr,xLargo-6,1);
  if xLargo>=8  then x8:=copy(xNumStr,xLargo-7,1);
  if xLargo>=9  then x9:=copy(xNumStr,xLargo-8,1);
  if xLargo>=10 then x10:=copy(xNumStr,xLargo-9,1);
  if xLargo>=11 then x11:=copy(xNumStr,xLargo-10,1);
  if xLargo>=12 then x12:=copy(xNumStr,xLargo-11,1);
  xVeces:=1; xTotal:='';
  while xVeces<=4 do // hasta 999,999'999,999
  begin
    if xVeces=2 then
    begin
       x1:=x4;
       x2:=x5;
       x3:=x6;
    end;
    if xVeces=3 then
    begin
       x1:=x7;
       x2:=x8;
       x3:=x9;
    end;
    if xVeces=4 then
    begin
       x1:=x10;
       x2:=x11;
       x3:=x12;
    end;
    if x2='1' then // del 11 a 19
    begin
       if x1='0' then x2:='DIEZ';
       if x1='1' then x2:='ONCE';
       if x1='2' then x2:='DOCE';
       if x1='3' then x2:='TRECE';
       if x1='4' then x2:='CATORCE';
       if x1='5' then x2:='QUINCE';
       if x1='6' then x2:='DIECISEIS';
       if x1='7' then x2:='DIECISIETE';
       if x1='8' then x2:='DIECIOCHO';
       if x1='9' then x2:='DIECINUEVE';
       x1:='0';
    end
    else
    begin // del 0 al 9
    	if x1='1' then x1:='UNO';
      if (xVeces>1) and (x1='UNO') then x1:='UN';
      if x1='2' then x1:='DOS';
      if x1='3' then x1:='TRES';
      if x1='4' then x1:='CUATRO';
      if x1='5' then x1:='CINCO';
      if x1='6' then x1:='SEIS';
      if x1='7' then x1:='SIETE';
      if x1='8' then x1:='OCHO';
      if x1='9' then x1:='NUEVE';
      if x2='2' then
      begin // veinte
      	x2:='VEINTI';
      	if x1='0' then x2:='VEINTE';
      end;
      if x2='3' then begin
      	x2:='TREINTI';
        if x1='0' then x2:='TREINTA';
      end;
      if x2='4' then begin
        x2:='CUARENTI';
        if x1='0' then x2:='CUARENTA';
      end;
      if x2='5' then begin
        x2:='CINCUENTI';
        if x1='0' then x2:='CINCUENTA';
      end;
      if x2='6' then begin
        x2:='SESENTI';
        if x1='0' then x2:='SESENTA';
      end;
      if x2='7' then begin
        x2:='SETENTI';
        if x1='0' then x2:='SETENTA';
      end;
      if x2='8' then begin
        x2:='OCHENTI';
        if x1='0' then x2:='OCHENTA';
      end;
      if x2='9' then begin
      	x2:='NOVENTI';
        if x1='0' then x2:='NOVENTA';
      end;
      end;
      if x3='1' then x3:='CIENTO';
      if (x2='0') and (x1='0') and (x3='CIENTO') then
      	x3:='CIEN';
      if x3='2' then x3:='DOSCIENTOS';
      if x3='3' then x3:='TRESCIENTOS';
      if x3='4' then x3:='CUATROCIENTOS';
      if x3='5' then x3:='QUINIENTOS';
      if x3='6' then x3:='SEISCIENTOS';
      if x3='7' then x3:='SETECIENTOS';
      if x3='8' then x3:='OCHOCIENTOS';
      if x3='9' then x3:='NOVECIENTOS';
      xGrupo := '';
			//xGrupo := x3;
      if x3<>'0' then xGrupo:=x3;
      if x2<>'0' then xGrupo:=xGrupo+' '+x2;
      if x1<>'0' then xGrupo:=xGrupo+x1;
      if ((xVeces=2)or(xVeces=4)) and (length(xGrupo)>1) then
      begin
      	xGrupo:=xGrupo+' MIL';
      end;
      if (xVeces=3) and (length(xGrupo)>1) then
      begin
      	if x1<>'UN' then
        	xGrupo:=xGrupo+' MILLONES'
        else
        begin
        	xGrupo:=xGrupo+' MILLÓN';
        end;
    end;
    if length(xTotal)>0 then xGrupo:=xGrupo+' ';
    xTotal := xGrupo+xTotal;
    xVeces := xVeces+1;
  end;
  result := xTotal+xDecimal;
end;

procedure TFCobConsolidado.IniciaDatos;
begin
	 BlanqueaEdits ( pnlCabecera1 );
	 RecuperarCiaUnica(dblcCia,edtCia);
end;

procedure TFCobConsolidado.Z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('calc.exe',1);  //Activa la calculadora del Windows
end;

{*******************************************************
CUARTO PANEL - BOTONES
*******************************************************}
procedure TFCobConsolidado.Z2bbtnSumatClick(Sender: TObject);
var
   xRegAct : TBookMark;
begin
	 DM1.cdsRegCxC.DisableControls;
	 xRegAct := DM1.cdsRegCxC.GetBookmark;
	 xMtoLoc := 0;
	 xMtoExt := 0;
	 xMtoCta := 0;
	 DM1.cdsRegCxC.First;
	 While not DM1.cdsRegCxC.Eof do
	  begin
		 if DM1.cdsRegCxC.FieldByName('DEDH').AsString = 'H' then
			begin
			 xMtoLoc := xMtoLoc + DM1.cdsRegCxC.FieldByName('DEMTOLOC').AsFloat;
			 xMtoExt := xMtoExt + DM1.cdsRegCxC.FieldByName('DEMTOEXT').AsFloat;
			end
		 else
			begin
			 xMtoLoc := xMtoLoc - DM1.cdsRegCxC.FieldByName('DEMTOLOC').AsFloat;
			 xMtoExt := xMtoExt - DM1.cdsRegCxC.FieldByName('DEMTOEXT').AsFloat;
			end;
		 DM1.cdsRegCxC.Next;
	  end;

	DM1.cdsRegCxC.GotoBookmark(xRegAct);
	DM1.cdsRegCxC.FreeBookmark(xRegAct);
	DM1.cdsRegCxC.EnableControls;
end;

procedure TFCobConsolidado.Z2bbtnSubeClick(Sender: TObject);
begin
	 pnlDetPago.Enabled    := False;
	 pnlBotones.Enabled    := False;
	 ActivaBotones(pnlBotones , False );
	 pnlCabecera1.Enabled  := True;
   ActivaBotones(pnlCabecera1,True);
end;

procedure TFCobConsolidado.Z2bbtnNuevoClick(Sender: TObject);
begin
  xInsercion := '';
	if DM1.cdsIngDocs.FieldByName('NCOESTADO').AsString ='I' then
   begin
    if wModifica then
    begin
      ShowMessage('Debe grabar o  Cancelar las actualizaciones realizadas');
      exit;
    end;
    if MessageDlg('¿Nuevo Documento?',mtConfirmation,
								 [mbYes, mbNo], 0)=mrYes then
    begin
      //** 24/11/2000 - pjsv
      edNumReg.Text := '';
      //**
      Adiciona;
      FormShow( Sender );
      pnlCabecera1.SetFocus;
      perform(CM_DialogKey,VK_TAB,0);
    end;
   end
  else
   begin
    //** 24/11/2000 - pjsv
    edNumReg.Text := '';
    //**
    Adiciona;
    FormShow( Sender );
    pnlCabecera1.SetFocus;
    perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFCobConsolidado.Z2bbtnGrabaClick(Sender: TObject);
var sSQL, xSQL,sPMtoLoc, sPMtoExt, sFMtoLoc, sFMtoExt : string;
    nPMtoLoc, nPMtoExt, nFMtoLoc, nFMtoExt : double;
    Anio,Mes,Dia : Word;
begin

	 if DM1.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'I' then
	 begin

			if MessageDlg('¿Grabar?',mtConfirmation,[mbYes, mbNo], 0) = mrNo then Exit;

			{
			sFMtoLoc:= dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue;
			sFMtoExt:= dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue;
			sPMtoLoc:= dbgDetPago.ColumnByName('DEMTOLOC').FooterValue;
			sPMtoExt:= dbgDetPago.ColumnByName('DEMTOEXT').FooterValue;

			nFMtoLoc:= strtofloat(sFMtoLoc);
			nFMtoExt:= strtofloat(sFMtoExt);
			nPMtoLoc:= strtofloat(sPMtoLoc);
			nPMtoExt:= strtofloat(sPMtoExt);

			if (abs(nFMtoLoc-nPMtoLoc)<0.5) and (abs(nFMtoExt-nPMtoExt)<0.5) then
			begin
				 Redondear;
				 AcumulaDetFPago ;
			end;
			}
			if DM1.wModo='A' then
				 AsignaClaveDetalle;

			GrabaMontoTotal;

			DM1.cdsIngDocs.Edit;
			DecodeDate(dbdtpFEmision.date,anio,mes,dia);
			DM1.cdsIngDocs.FieldByName('ECANOMM').AsString := FloatToStr(anio)+DM1.StrZero(FloatToStr(mes),2);
			DM1.cdsIngDocs.FieldByName('NCOUSER').AsString := DM1.wUsuario;
			DM1.cdsIngDocs.FieldByName('NCOFREG').AsString := DateToStr(date);
			DM1.cdsIngDocs.FieldByName('NCOHREG').AsDateTime := SysUtils.Time;
			cdspost(DM1.cdsIngDocs);
			xSQL:='Select * from CXC303 '
					 +'Where CIAID='''   +dblcCia.Text  +''' and '
					 +      'DOCID='''   +dblcTDOC.Text +''' and '
					 +      'CCSERIE=''' +dbeSerie.Text +''' and '
					 +      'CCNODOC=''' +dblcdLICO.Text +''' ';
//					 +      'CCNODOC=''' +dbeNoDoc.Text +''' ';
			DM1.cdsIngDocs.DataRequest( xSQL );
			DM1.AplicaDatos( DM1.cdsIngDocs, 'INGDOCS' );

			if DM1.cdsRegCxC.ApplyUpdates(0) > 0 then
				 Raise Exception.Create ('Error en La Grabación del Detalle');

			Z2bbtnSumatClick(Sender);
			if DM1.wModo='A' then
				 AsignaParametros;

			dblccia.Enabled     := False;
			dblctdoc.Enabled    := False;
			dbeSerie.Enabled    := False;
			//dbeNoDoc.Enabled    := False;
			dblcdLICo.Enabled    := False;
			GrabaClave;

			if DM1.cdsDetFPago.ApplyUpdates(0) > 0 then
				 Raise Exception.Create ('Error en La Grabación de Detalle de Cancelación');

			xSQL:='Select * from CAJA314 '
					 +'Where CIAID='''   +dblcCia.Text  +''' and '
					 +      'CCTREC='''  +'CO'          +''' and '
					 +      'CCSERIE=''' +dbeSerie.Text +''' and '
					 +      'DOCID='''   +dblcTDoc.Text +''' and '
					 +      'CCNODOC=''' +dblcdLICO.Text+''' and '
					 +      'FPAGOID=''' +DM1.wDeposito +''' ';
			DM1.cdsCanjeCxC.DataRequest( xSQL );
			DM1.AplicaDatos(DM1.cdsCanjeCxC, 'CANJECXC');


			// Para Actualizar Consolidado CXC
			xSQL:='Update CXC318 Set LICOCAJA=''I'' '
					 +'Where CIAID=''' +dblcCia.Text  +''' and '
					 +      'LICOID='''+dblcdLico.Text+''' and '
					 +      'COALESCE(LICOCAJA,''N'')<>''S'' ';
			DM1.cdsQry.Close;
			DM1.cdsQry.DataRequest( xSQL );
			TRY
				DM1.cdsQry.Execute;
			EXCEPT
			END;

			ShowMessage('Grabacion OK');

			//** 04/06/2001 - pjsv, cambio el estado para que si vuelvo
			//** a la cabecera a modificar algun dato sin haber salido
			//** de la insercion no me genera el mensaje de que el
			//** registro ya existe.
			xInsercion := 'S'; //DM1.wModo := 'M';
			//**

			Z2bbtnNuevo.Enabled    := True;
			if (DM1.cdsDetFPago.RecordCount > 0) or (DM1.cdsCanjeCxC.RecordCount > 0) then
			begin
				 Z2bbtnCancelado.Enabled:= True;
				 Z2bbtnGraba.Enabled    := False
			end;

			Z2bbtnAnula.Enabled    := True;
			lblEstadoMov.Caption   := 'Activo';
			wModifica:=False;
	 end
	 else
	 begin
			ShowMessage('Imposible Grabar');
	 end;
end;

procedure TFCobConsolidado.Z2bbtnCanceladoClick(Sender: TObject);
var
  xCobLoc,	 xCobExt : Currency;
  xSQL : String;
  sDoc,sFClie,xWhere,sAnt,sNoreg : string;
  xMes,xAno : string;
  xDatAux : StructSaldosAux;
  a,m,d:word;
  sRemesa,sCuenta,sDiarioCaja,sDiarioBanco:string;
  sPeriodo,sNoComp:string;
begin
  sDiarioCaja:=DM1.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','CIAID='+QuotedStr(dblcCia.text)+' AND BANCOID='+quotedstr(dblcBanco.text),'CCBCOVOUCH');
  DecodeDate(dbdtpFEmision.Date,a,m,d);
  sPeriodo:=DM1.StrZero(IntToStr(a),4)+DM1.StrZero(IntToStr(m),2);
	xWhere  :='CIAID='+quotedstr(dblcCia.Text)+' AND ECANOMM='+quotedstr(sPeriodo)
						+' AND TDIARID='+ quotedstr( sDiarioCaja);

	dbeNoComp.text:=DM1.strZero(DM1.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere),10);
  DM1.cdsIngDocs.Edit;
	DM1.cdsIngDocs.fieldBYName('TDIARID').AsString :=sDiarioCaja;
	DM1.cdsIngDocs.fieldBYName('ECNOCOMP').AsString:=dbeNoComp.text;

    xSQL:='Select * from CAJA302 '
         +'Where CIAID='''   +dblcCia.Text   +''' and '
         +      'TDIARID=''' +sDiarioCaja+''' and '
         +      'ECANOMM=''' +sPeriodo       +''' and '
         +      'ECNOCOMP='''+dbeNoComp.Text +''' ';
    DM1.cdsEgrCaja.Close;
    DM1.cdsEgrCaja.DataRequest( xSQL );
    DM1.cdsEgrCaja.Open;

    xSQL:='Select * from CAJA301 '
         +'Where CIAID='''' and ECANOMM='''' and '
         +      'TDIARID='''' and ECNOCOMP='''' ';
    DM1.cdsRegCxP.Close;
    DM1.cdsRegCxP.DataRequest( xSQL );
    DM1.cdsRegCxP.Open;

  ValidaCancelacion;

  if DM1.cdsIngDocs.fieldByName('NCOESTADO').AsString = 'I' then
  begin
    if wModifica then
    begin
    	 ShowMessage('Debe grabar primero las actualizaciones realizadas');
    	 exit;
    end;

    if MessageDlg('¿Efectuar la Cancelacion del Documento?',mtConfirmation,
    						 [mbYes, mbNo], 0)=mrYes then
    begin
      //GENERAR COMPROBANTES PARA EL INGRESO A CAJA
      sCuenta:=DM1.DisplayDescrip('prvTGE','TGE106','CTAPRINC,CTAREMES','CIAID='+QuotedStr(dblcCia.text)+' AND BANCOID='+quotedstr(dblcBanco.text),'CTAPRINC');
      sRemesa:=DM1.cdsQry.FieldByName('CTAREMES').AsString;
      if DM1.cdsIngDocs.fieldBYName('NCOMTOLOC').AsFloat>0 then
      begin
        InsertaCAJA302( dblcCia.Text, sDiarioCaja, sPeriodo, dbeNoComp.Text,
                        DM1.cdsIngDocs.FieldByName('CPTOID').AsString,
                        sCuenta, sRemesa ,
                        DM1.wTMonLoc,
                        DM1.cdsIngDocs.fieldbyName('BANCOID').AsString,
                        DM1.cdsIngDocs.fieldbyName('CCBCOID').AsString,
                        xTotalCMN,
                        DM1.FRound(xTotalCMN/StrToFloat(dbeTCambio.text),15,2),'C' );
        DM1.cdsEgrCaja.FieldByName('ECPERREC').AsString:='TCC.';
        cdspost( DM1.cdsEgrCaja );
        DM1.AplicaDatos(DM1.cdsEgrCaja,'EGRCAJA');
      end;

      if DM1.cdsIngDocs.fieldBYName('NCOMTOEXT').AsFloat>0 then
      begin
        InsertaCAJA302( dblcCia.Text, sDiarioCaja, sPeriodo, DM1.strZero(DM1.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere),10),
                        DM1.cdsIngDocs.FieldByName('CPTOID').AsString,
                        sCuenta, sRemesa,
                        DM1.wTMonExt,
                        DM1.cdsIngDocs.fieldbyName('BANCOID').AsString,
                        DM1.cdsIngDocs.fieldbyName('CCBCOID').AsString,
                        DM1.FRound(xTotalCME*StrToFloat(dbeTCambio.text),15,2),
                        xTotalCME,'C' );
        DM1.cdsEgrCaja.FieldByName('ECPERREC').AsString:='TCC.';
        cdspost( DM1.cdsEgrCaja );
        DM1.AplicaDatos(DM1.cdsEgrCaja,'EGRCAJA');
      end;

      //GENERAR COMPROBANTES PARA EL INGRESO A BANCOS
      DM1.cdsCanjeCxC.First;
      while not DM1.cdsCanjeCxC.EOF do
      begin
        sDiarioBanco:=DM1.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH,CTAPRINC,CTAREMES',
                                         'CIAID='+QuotedStr(dblcCia.text)+
                                         ' AND BANCOID='+quotedstr(DM1.cdsCanjeCxC.FieldByName('BANCOID').AsString)+
                                         ' AND CCBCOID='+QuotedStr(DM1.cdsCanjeCxC.FieldByName('CCBCOID').AsString),'CCBCOVOUCH');
      sCuenta:=DM1.cdsQry.FieldByName('CTAPRINC').AsString;
      sRemesa:=DM1.cdsQry.FieldByName('CTAREMES').AsString;

       	xWhere  :='CIAID='+quotedstr(dblcCia.Text)+' AND ECANOMM='+quotedstr(sPeriodo)
						     +' AND TDIARID='+ quotedstr(sDiarioBanco);
        sNoComp:=DM1.strZero(DM1.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere),10);
        InsertaCAJA302( dblcCia.Text,sDiarioBanco,
                        sPeriodo,sNoComp,DM1.cdsIngDocs.FieldByName('CPTOID').AsString,
                        sCuenta,sRemesa,
                        DM1.cdsCanjeCxC.FieldByName('TMONID').AsString,
                        DM1.cdsCanjeCxC.FieldByName('BANCOID').AsString,
                        DM1.cdsCanjeCxC.FieldByName('CCBCOID').AsString,
                        DM1.cdsCanjeCxC.FieldByName('FC_MTOLOC').AsFloat,
                        DM1.cdsCanjeCxC.FieldByName('FC_MTOEXT').AsFloat,'D');
        DM1.cdsEgrCaja.FieldByName('ECPERREC').AsString:='TCC.';
        cdspost( DM1.cdsEgrCaja );
        DM1.AplicaDatos(DM1.cdsEgrCaja,'EGRCAJA');

        DM1.cdsCanjeCxC.Edit;
        DM1.cdsCanjeCxC.FieldByName('ECNOCOMP').AsString:=sNoComp;
        DM1.cdsCanjeCxC.FieldByName('ECANOMM').AsString:=sPeriodo;
        DM1.cdsCanjeCxC.Post;
        DM1.AplicaDatos(DM1.cdsCanjeCxC, 'CANJECXC');

        DM1.cdsCanjeCxC.Next;
      end;


      //QUITAR DM1.cdsIngDocs.edit;
      DM1.cdsIngDocs.FieldByName('NCOESTADO').AsString := 'C';

      //Calculo de Cobrados soles dolares
      xCobLoc   := OperClientDataSet(DM1.cdsDetFPago ,'SUM(FC_MTOLOC)' , 'TMONID='+QuotedStr(DM1.wTMonLoc));
      xCobExt   := OperClientDataSet(DM1.cdsDetFPago ,'SUM(FC_MTOEXT)' , 'TMONID='+QuotedStr(DM1.wTMonExt));



      {DM1.cdsIngDocs.FieldByName('ECCOBLOC').AsFloat := xCobLoc;
      DM1.cdsIngDocs.FieldByName('ECCOBEXT').AsFloat := xCobExt;}
      DM1.cdsIngDocs.FieldByName('NCOUSER').AsString := DM1.wUsuario;
      DM1.cdsIngDocs.FieldByName('NCOFREG').Value    := dateS;
      DM1.cdsIngDocs.FieldByName('NCOHREG').Value    := Time;
      cdspost(DM1.cdsIngDocs);

      xSQL:='Select * from CXC303 '
      			+'Where CIAID='''   +dblcCia.Text  +''' and '
      			+      'DOCID='''   +dblcTDOC.Text +''' and '
      			+      'CCSERIE=''' +dbeSerie.Text +''' and '
      			+      'CCNODOC=''' +dblcdLICO.Text +''' ';

      DM1.cdsIngDocs.DataRequest( xSQL );
      DM1.AplicaDatos( DM1.cdsIngDocs, 'INGDOCS' );

      /////ACTUALIZACIÓN DE SALDOS//////
      if ( xCobLoc > 0 ) then
      		with DM1.cdsIngDocs do
      		DM1.ActSdoCaja(DM1.wTMonLoc , FieldByName('BANCOID').AsString ,
      									 FieldByName('ECCOBLOC').AsString ,FieldByName('CCFEMIS').AsString,'I') ;

      if ( xCobExt > 0 ) then
      		with DM1.cdsIngDocs do
      		DM1.ActSdoCaja(DM1.wTMonExt , FieldByName('BANCOID').AsString ,
      									 FieldByName('ECCOBEXT').AsString ,FieldByName('CCFEMIS').AsString,'I') ;

      /////FIN DE ACTUALIZACIÓN DE SALDOS/////
      GrabaEstadoFPago('C');

      if DM1.cdsDetFPago.ApplyUpdates(0) > 0 then
      	Raise Exception.create ('Error en la grabacion de los detalles de cancelación');

      if DM1.cdsCanjeCxC.ApplyUpdates(0) > 0 then
      	Raise Exception.create ('Error en la grabacion de los detalles de cancelación');

      Z2bbtnSumat.Enabled        := False;
      Z2bbtnCont.Enabled         := True;
      z2bbtnImprime.Enabled      := True;
      Z2bbtnEmite.Enabled        := True ;
      Z2bbtnSube.Enabled         := False;
      Z2bbtnGraba.Enabled        := False;
      Z2bbtnCancelado.Enabled    := False;
      Z2bbtnCancel2.Enabled      := False;
      Z2bbtnAnula.Enabled        := False;
      lblEstadoMov.Caption       := 'Cancelado';

			xSQL:='Update CXC318 Set LICOCAJA=''S'' '
					 +'Where CIAID=''' +dblcCia.Text  +''' and '
					 +      'LICOID='''+dblcdLico.Text+''' and '
					 +      'COALESCE(LICOCAJA,''N'')<>''S'' ';
			DM1.cdsQry.Close;
			DM1.cdsQry.DataRequest( xSQL );
			TRY
				DM1.cdsQry.Execute;
			EXCEPT
			END;

    end
    else
    begin
    	 ShowMessage('Imposible Cancelar');
    end;
  end;
end;

function TFCobConsolidado.ValidaCampo:Boolean;
var
	 xWhere,
	 aux :string;
begin
		 Result:=True;
		 with DM1 do begin

				if length(cdsRegCxC.FieldByname('CPNOREG').AsString)=0 then begin  //No Registro
					 ShowMessage('Falta No Registro');
					 Result:=False;
					 exit;
				end
				else begin
					 if length(cdsRegCxC.FieldByname('CPNOREG').AsString)<6 then
						begin
							ShowMessage('Codigo de Registro Errado');
							Result:=False;
							exit;
						end;
				end;

				if cdsRegCxC.FieldByname('DEMTOORI').AsFloat<=0 Then begin   //Importe
					 ShowMessage('Importe debe ser mayor que cero');
					 Result:=False;
					 exit;
				end;

				if cdsRegCxC.FieldByname('CPTOID').AsString='' then begin      //Concepto
					 ShowMessage('Falta Concepto');
					 Result:=False;
					 exit;
				end
				else begin                             // Cuenta
					 aux:= DM1.cdsRegCxC.FieldByname('CUENTAID').AsString;
					 if length(aux)=0 then begin
							ShowMessage('Codigo de Concepto Errado');
							Result:=False;
							exit;
					 end;
				end;

        //Validación de centro de costo y auxiliares


//fin de validaciones

        if length(cdsRegCxC.FieldByName('DEDH').Value)=0 then
         begin
           ShowMessage('Falta especificar Debe / Haber');
           Result:=False;
           exit;
         end;
    end; {DM1}
end;

procedure TFCobConsolidado.Z2bbtnAnulaClick(Sender: TObject);
var sSQL:string;
begin
      if MessageDlg('¿Anular Documento?',mtConfirmation,
                   [mbYes, mbNo], 0)=mrYes then
      begin
         DM1.cdsIngDocs.CancelUpdates;
         DM1.cdsRegCxC.CancelUpdates;
         DM1.cdsIngDocs.edit;
         DM1.cdsIngDocs.FieldByName('NCOESTADO').AsString := 'A';
         if DM1.cdsIngDocs.ApplyUpdates(0) > 0 then
         begin
            raise exception.create('Error en Ingreso de Documentos');
         end;
         GrabaEstadoFPago('A');
         if DM1.cdsDetFPago.ApplyUpdates(0) > 0 then
         begin
            raise exception.create('Error en detalle de forma de Pago');
         end;

         if DM1.cdsCanjeCxC.ApplyUpdates(0) > 0 then
         begin
            raise exception.create('Error en detalle de forma de Pago');
         end;
         sSQL:='UPDATE CXC318 SET LICOCAJA='''' WHERE CIAID='+QuotedStr(dblcCia.text)+' AND LICOID='+QuotedStr(dblcdLICO.text);
         try
      		DM1.DCOM1.AppServer.EjecutaSQL(sSQL);
         except
         end;

				 Z2bbtnNuevo.Enabled     := True;
         Z2bbtnSube.Enabled      := False;
         Z2bbtnGraba.Enabled     := False;
         Z2bbtnCancelado.Enabled := False;
         Z2bbtnCancel2.Enabled   := False;
         Z2bbtnAnula.Enabled     := False;
         lblEstadoMov.Caption    := 'Anulado';
      end
      else
      begin
         ShowMessage('Imposible Anular Documento');
      end;
end;

{procedure TFIngresoCaja.ActPnlBotones;
begin
   Z2bbtnSumat.Enabled    := wbSumat;
   Z2bbtnNuevo.Enabled    := wbNuevo;
   Z2bbtnImprime.Enabled  := wbImprime;
   Z2bbtnSube.Enabled     := wbSube;
   Z2bbtnGraba.Enabled    := wbGraba;
   Z2bbtnCancelado.Enabled:= wbCancelado;
   Z2bbtnCancel2.Enabled  := wbCancel2;
   Z2bbtnAnula.Enabled    := wbAnula;
end;
}

procedure TFCobConsolidado.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   IF DM1.cdsIngDocs.Active then
      DM1.cdsIngDocs.CancelUpdates;
   if DM1.cdsRegCxC.Active then
      DM1.cdsRegCxC.CancelUpdates;

	 DM1.cdsBanco.Filtered  := False;
   DM1.cdsCCBco.Filtered  := False;
   DM1.cdsTDoc.Filtered := False;
   cf1.QuitarExits(self);
end;

procedure TFCobConsolidado.IniciaPanel;
begin
end;

procedure TFCobConsolidado.Z2bbtnCancelCabClick(Sender: TObject);
VAR
	 Doc : structDocIng;
begin
   //Cancela las Actualizaciones Realizadas
   //** 24/11/2000 - pjsv
   edNumReg.Text := '';
   //**
   DM1.cdsIngDocs.CancelUpdates;
   DM1.cdsRegCxC.CancelUpdates;
   if DM1.wModo<>'A' then
   begin
      with Doc do
      begin
         CIAID    := dblcCia.Text;
         CCTREC   := 'CO';
         DOCID    := dblcTDoc.Text;
				 CCSERIE  := trim( dbeSerie.Text );
				 CCNODOC  := trim( dblcdLICO.Text );
//         CCNODOC  := trim( dbeNoDoc.Text );
			end;
      Edita(doc,cdsFiltro);
   end
   else Adiciona;
   pnlCabecera1.SetFocus;
   perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFCobConsolidado.Z2bbtnOKCabClick(Sender: TObject);
var
   xSQL, xWhere : String;
   xMonLoc,   xMonExt   : Double;
	xxTMonLoc, xxTMtoExt : Double;
   xFCobCons : tdate;
begin
  ValidaCab;

  xSQL:='Select * from CXC318 '
  		 +'Where CIAID=''' +dblcCia.Text  +''' and '
		 +      'LICOID='''+dblcdLico.Text+''' ';
  DM1.cdsQry.Close;
  DM1.cdsQry.dataRequest(xSQL);
  DM1.cdsQry.Open;

  xFCobCons:=DM1.cdsQry.FieldByname('CCFEMIS').AsdateTime;

  DM1.cdsIngDocs.Edit;
  if DM1.wModo='A' then
  begin
  		DM1.cdsIngDocs.FieldbyName('CIAID').AsString     := dblcCia.Text;
  		DM1.cdsIngDocs.FieldbyName('DOCID').AsString     := dblcTDoc.Text;
  		DM1.cdsIngDocs.FieldbyName('CCSERIE').AsString   := trim( dbeSerie.Text );
  		DM1.cdsIngDocs.FieldbyName('CCNODOC').AsString   := trim( dblcdLICO.Text );
  end;

  if trim(dblcdFEfec.Text) = '' then
  		DM1.cdsIngDocs.FieldByName('FLUEID').Clear
  else
  		DM1.cdsIngDocs.FieldByName('FLUEID').AsString := trim(dblcdFEfec.Text);

  DM1.cdsIngDocs.FieldbyName('CCFEMIS').AsDateTime    := dbdtpFEmision.Date;
  DM1.cdsIngDocs.FieldbyName('BANCOID').Value         := dblcBanco.Text;
  DM1.cdsIngDocs.FieldbyName('CUENTAID').Value        := edtCuenta.Text;
  DM1.cdsIngDocs.FieldbyName('TMONID').Value          := dblcTMonCab.Text;
  DM1.cdsIngDocs.FieldbyName('NCOTCAMB').Value        := dbeTCambio.Text;
  DM1.cdsIngDocs.FieldbyName('CLAUXID').Value         := dblcClase.Text;
  DM1.cdsIngDocs.FieldbyName('CLIEID').Value          := dblcdAux.Text;
  DM1.cdsIngDocs.FieldbyName('CLIERUC').Value         := edtAuxRUC.Text;
  DM1.cdsIngDocs.FieldbyName('CCNOMB').Value          := dbeGiradoA.Text;
  DM1.cdsIngDocs.FieldbyName('CPTOID').Value          := dblcdCnp.Text;
  DM1.cdsIngDocs.FieldbyName('CCGLOSA').Value         := dbeGlosa.Text;
  DM1.cdsIngDocs.FieldbyName('CCTREC').Value          := 'CO';
  DM1.cdsIngDocs.fieldbyName('NCOESTADO').Value       := 'I';
  DM1.cdsIngDocs.fieldbyName('LICOID').Value          := dblcdLICO.Text;
  DM1.cdsIngDocs.Post;

  if (DM1.cdsDetFPago.RecordCount<=0) AND (DM1.cdsCanjeCxC.RecordCount<=0) then
  begin
    xSQL:='Select * from CAJA314 '
    		 +'Where CIAID='''   +dblcCia.Text  +''' and '
    		 +      'CCTREC='''  +'CO'          +''' and '
    		 +      'CCSERIE=''' +dbeSerie.Text +''' and '
    		 +      'DOCID='''   +dblcTDoc.Text +''' and '
    		 +      'CCNODOC=''' +dblcdLICO.Text+''' and '
    		 +      'FPAGOID=''' +DM1.wDeposito +''' AND FC_ESTADO<>''A'' ';
    DM1.cdsCanjeCxC.Close;
    DM1.cdsCanjeCxC.DataRequest( xSQL );
    DM1.cdsCanjeCxC.Open;

    xSQL:='SELECT CLAUXID, CLIEID, CIAID, FPAGOID, BANCOID, CCBCOID, TMONIDPAGO, LICONOCHQ, '
         +   'FECPAGO, FECEMICHQ, MAX(TGE103.TMONABR) TMONABR, '
    		+   'SUM(LICOMTOABOLOC) LICOMTOABOLOC, '
    		+   'SUM(LICOMTOABOEXT) LICOMTOABOEXT, '
    		+   'SUM(LICOMTOABOORI) LICOMTOABOORI, '
    		+   'ROUND(SUM( LICOTCAMBL)/COUNT(*),3) LICOTCAMBL '
    		+'FROM CXC320, TGE103 '
    		+'Where CIAID=''' +dblcCia.Text  +''' and '
    		+      'LICOID='''+dblcdLico.Text+''' and '
         +      'TGE103.TMONID=CXC320.TMONIDPAGO '
    		+'GROUP BY CLAUXID, CLIEID, CIAID, FPAGOID, BANCOID, CCBCOID, TMONIDPAGO, LICONOCHQ, FECPAGO, FECEMICHQ ';

    DM1.cdsQry.Close;
    DM1.cdsQry.DataRequest(xSQL);
    DM1.cdsQry.Open;
    DM1.cdsQry.First;

    while not DM1.cdsQry.Eof do
    begin
      if DM1.cdsQry.FieldByname('FPAGOID').AsString=DM1.wDeposito then
      begin
        DM1.cdsCanjeCxC.Insert;
        DM1.cdsCanjeCxC.FieldByName('CORRE').AsInteger     := DM1.cdsCanjeCxC.recno;
        //DM1.cdsCanjeCxC.FieldByName('CAJAID').AsString     := dblcBanco.Text;
        DM1.cdsCanjeCxC.FieldByName('FPAGOID').AsString    := DM1.cdsQry.FieldByname('FPAGOID').AsString;
        DM1.cdsCanjeCxC.FieldByName('BANCOID').AsString    := DM1.cdsQry.FieldByname('BANCOID').AsString;
        DM1.cdsCanjeCxC.FieldByName('CLAUXID').AsString    := DM1.cdsQry.FieldByname('CLAUXID').AsString;
        DM1.cdsCanjeCxC.FieldByName('CLIEID').AsString     := DM1.cdsQry.FieldByname('CLIEID').AsString;
        DM1.cdsCanjeCxC.FieldByName('TMONID').AsString     := DM1.cdsQry.FieldByname('TMONIDPAGO').AsString;
        DM1.cdsCanjeCxC.FieldByName('TMONABR').AsString    := DM1.cdsQry.FieldByname('TMONABR').AsString;
        DM1.cdsCanjeCxC.FieldByName('ECNOCHQ').AsString    := DM1.cdsQry.FieldByname('LICONOCHQ').AsString;
        ////////////////////
        //cim 06/11/2002
        if DM1.cdsQry.FieldByname('TMONIDPAGO').AsString=DM1.wTMonLoc then
           DM1.cdsCanjeCxC.FieldByName('FC_RECIBIDO').AsString:= DM1.cdsQry.FieldByname('LICOMTOABOLOC').AsString
        else
          if DM1.cdsQry.FieldByname('TMONIDPAGO').AsString=DM1.wTMonExt then
             DM1.cdsCanjeCxC.FieldByName('FC_RECIBIDO').AsString:= DM1.cdsQry.FieldByname('LICOMTOABOEXT').AsString;

        DM1.cdsCanjeCxC.FieldByName('TC_USADO').AsString   := DM1.cdsQry.FieldByname('LICOTCAMBL').AsString;
        if DM1.cdsQry.FieldByname('TMONIDPAGO').AsString=DM1.wTMonLoc then
            DM1.cdsCanjeCxC.FieldByName('FC_COBRADO').AsString := DM1.cdsQry.FieldByname('LICOMTOABOLOC').AsString
        else
           if DM1.cdsQry.FieldByname('TMONIDPAGO').AsString=DM1.wTMonExt then
              DM1.cdsCanjeCxC.FieldByName('FC_COBRADO').AsString := DM1.cdsQry.FieldByname('LICOMTOABOEXT').AsString;

        DM1.cdsCanjeCxC.FieldByName('CCBCOID').AsString    := DM1.cdsQry.FieldByname('CCBCOID').AsString;
        DM1.cdsCanjeCxC.FieldByName('FC_DEVOLVER').AsString:= '0.00';
        DM1.cdsCanjeCxC.fieldbyName('LICOID').AsString     := dblcdLICO.Text;
        DM1.cdsCanjeCxC.FieldByName('FC_FVCMTO').AsDateTime:= DM1.cdsQry.FieldByname('FECPAGO').AsDateTime;
        DM1.cdsCanjeCxC.FieldByName('FC_FEMIS').Value      := DM1.cdsQry.FieldByname('FECEMICHQ').AsDateTime;
        DM1.cdsCanjeCxC.FieldByName('FC_FCOBC').AsDateTime := xFCobCons;
        //Calcular y grabar equivalentes
        if DM1.cdsCanjeCxC.FieldByName('TMONID').AsString = DM1.wTMonLoc then
        begin
          xMonLoc := DM1.FRound(DM1.cdsCanjeCxC.FieldByName('FC_COBRADO').AsFloat,15,2);
          xMtoExt := DM1.FRound( DM1.cdsCanjeCxC.FieldByName('FC_COBRADO').AsFloat / DM1.cdsCanjeCxC.FieldByName('TC_USADO').AsFloat,15,2);
          DM1.cdsCanjeCxC.FieldByName('FC_MTOLOC').AsFloat := XMonLoc;
          DM1.cdsCanjeCxC.FieldByName('FC_MTOEXT').AsFloat := 0;
        end
        else
        begin
          xMonLoc := DM1.FRound(DM1.cdsCanjeCxC.FieldByName('FC_COBRADO').AsFloat * DM1.cdsCanjeCxC.FieldByName('TC_USADO').AsFloat,15,2);
          xMtoExt := DM1.FRound(DM1.cdsCanjeCxC.FieldByName('FC_COBRADO').AsFloat,15,2);
          DM1.cdsCanjeCxC.FieldByName('FC_MTOLOC').AsFloat := 0;
          DM1.cdsCanjeCxC.FieldByName('FC_MTOEXT').AsFloat := xMtoExt;
        end;
        cdsPost( DM1.cdsCanjeCxC );
        //fin de calcular
        DM1.cdsCanjeCxC.Post;
      end
      else
      begin
        DM1.cdsDetFPago.Insert;
        DM1.cdsDetFPago.FieldByName('CORRE').AsInteger     := DM1.cdsDetFPago.recno;
        DM1.cdsDetFPago.FieldByName('CAJAID').AsString     := dblcBanco.Text;
        DM1.cdsDetFPago.FieldByName('FPAGOID').AsString    := DM1.cdsQry.FieldByname('FPAGOID').AsString;
        DM1.cdsDetFPago.FieldByName('BANCOID').AsString    := DM1.cdsQry.FieldByname('BANCOID').AsString;
        DM1.cdsDetFPago.FieldByName('CLAUXID').AsString    := DM1.cdsQry.FieldByname('CLAUXID').AsString;
        DM1.cdsDetFPago.FieldByName('CLIEID').AsString     := DM1.cdsQry.FieldByname('CLIEID').AsString;
        DM1.cdsDetFPago.FieldByName('TMONID').AsString     := DM1.cdsQry.FieldByname('TMONIDPAGO').AsString;
        DM1.cdsDetFPago.FieldByName('TMONABR').AsString    := DM1.cdsQry.FieldByname('TMONABR').AsString;
        DM1.cdsDetFPago.FieldByName('ECNOCHQ').AsString    := DM1.cdsQry.FieldByname('LICONOCHQ').AsString;
        //cim 06/11/2002
        if DM1.cdsQry.FieldByname('TMONIDPAGO').AsString=DM1.wTMonLoc then
           DM1.cdsDetFPago.FieldByName('FC_RECIBIDO').AsString:= DM1.cdsQry.FieldByname('LICOMTOABOLOC').AsString
        else
          if DM1.cdsQry.FieldByname('TMONIDPAGO').AsString=DM1.wTMonExt then
             DM1.cdsDetFPago.FieldByName('FC_RECIBIDO').AsString:= DM1.cdsQry.FieldByname('LICOMTOABOEXT').AsString;

        DM1.cdsDetFPago.FieldByName('TC_USADO').AsString   := DM1.cdsQry.FieldByname('LICOTCAMBL').AsString;
        if DM1.cdsQry.FieldByname('TMONIDPAGO').AsString=DM1.wTMonLoc then
            DM1.cdsDetFPago.FieldByName('FC_COBRADO').AsString := DM1.cdsQry.FieldByname('LICOMTOABOLOC').AsString
        else
           if DM1.cdsQry.FieldByname('TMONIDPAGO').AsString=DM1.wTMonExt then
              DM1.cdsDetFPago.FieldByName('FC_COBRADO').AsString := DM1.cdsQry.FieldByname('LICOMTOABOEXT').AsString;


        DM1.cdsDetFPago.FieldByName('FC_DEVOLVER').AsString:= '0.00';
        DM1.cdsDetFPago.fieldbyName('LICOID').AsString     := dblcdLICO.Text;
        DM1.cdsDetFPago.FieldByName('FC_FVCMTO').AsDateTime:= DM1.cdsQry.FieldByname('FECPAGO').AsDateTime;
        DM1.cdsDetFPago.FieldByName('FC_FEMIS').AsDateTime := DM1.cdsQry.FieldByname('FECEMICHQ').AsDateTime;
        DM1.cdsDetFPago.FieldByName('FC_FCOBC').AsDateTime := xFCobCons;

        xMonLoc := DM1.FRound(DM1.cdsQry.FieldByname('LICOMTOABOLOC').AsFloat,15,2);
        xMtoExt := DM1.FRound(DM1.cdsQry.FieldByname('LICOMTOABOEXT').AsFloat,15,2);

        if DM1.cdsDetFPago.FieldByName('TMONID').AsString=DM1.wTMonLoc then
        begin
          DM1.cdsDetFPago.FieldByName('FC_MTOLOC').AsFloat  := xMonLoc;
          DM1.cdsDetFPago.FieldByName('FC_MTOEXT').AsFloat  := 0;
        end
        else
        begin
          DM1.cdsDetFPago.FieldByName('FC_MTOLOC').AsFloat  := 0;
          DM1.cdsDetFPago.FieldByName('FC_MTOEXT').AsFloat  := xMtoExt;
        end;
        cdsPost( DM1.cdsDetFPago );
        //fin de calcular
        DM1.cdsDetFPago.Post;
      end;

      DM1.cdsQry.Next;
    end;
  end;

  AcumulaDetFPago;

  pnlDetPago.enabled := True;
  pnlCabecera1.enabled := False;
  //
  ActivaBotones( pnlCabecera1,False);
  pnlDetPago.Enabled := True;
  pnlBotones.Enabled := True;
  if wmodifica then
  begin
    Z2bbtnGraba.Enabled := True;
    Z2bbtnNuevo.Enabled := False;
    //z2bbtnImprime.Enabled:=True;
  end
  else
  begin
    Z2bbtnNuevo.Enabled     := True;
    if DM1.cdsDetFPago.RecordCount > 0 then
    begin
      Z2bbtnGraba.Enabled     := False;
      Z2bbtnCancelado.Enabled := True;
    end
    else
    begin
      Z2bbtnGraba.Enabled     := True;
      Z2bbtnCancelado.Enabled := False;
    end;
    Z2bbtnAnula.Enabled     := True;
  end;
  Z2bbtnSube.Enabled  := True;
  Z2bbtnCancel2.Enabled := True;

  if not DM1.cdsClaseAux.Locate('CLAUXID',VarArrayOf([ dblcClase.Text ]),[]) then
    Showmessage('Mensaje para WMC:''Error en la Búsqueda del Auxiliar''');

  if DM1.cdsRegCxC.RecordCount=0 then
  begin
    // Adiciona Concepto PARA SOLES
    DM1.cdsRegCxC.Insert;
    DM1.cdsRegCxC.FieldByName('CPNOREG').AsString:= DM1.strzero(GeneraCorrelativo( DM1.cdsRegCxC , 'CPNOREG' ), 10);
    DM1.cdsRegCxC.FieldByName('CIAID').Value     := dblcCia.Text;
    DM1.cdsRegCxC.FieldByName('CCTREC').Value    := 'CO';
    DM1.cdsRegCxC.FieldByName('DOCID2').Value    := dblcTDoc.Text;
    DM1.cdsRegCxC.FieldByName('CPSERIE').Value   := dbeSerie.Text;
    DM1.cdsRegCxC.FieldByName('CPNODOC').Value   := dblcdLICO.Text;
    DM1.cdsRegCxC.fieldbyName('TMONID').AsString := DM1.wTMonLoc;

    DM1.cdsRegCxC.FieldbyName('CPTOID').AsString  := dblcdCnp.Text;
    xWhere:='CPTOID='''+dblcdCnp.Text+'''';
    DM1.cdsRegCxC.FieldbyName('CUENTAID').AsString:=DM1.DisplayDescrip('prvTGE','CAJA201','*',xWhere,'CUENTAID');

    DM1.cdsRegCxC.fieldbyName('DETCDOC').AsString:= dbeTCambio.Text;
    DM1.cdsRegCxC.FieldByName('DEDH').AsString   := 'H';     //Inicializo en haber
    xWhere:='FECHA='+DM1.wRepFuncDate+''''+formatdatetime(DM1.wFormatFecha,dbdtpFEmision.Date) +''')';
    DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
    DM1.cdsRegCxC.FieldByName('DEANO').Value  := DM1.cdsQry.FieldByName('FecAno').AsString;
    DM1.cdsRegCxC.FieldByName('DEMM').Value   := DM1.cdsQry.FieldByName('FecMes').AsString;
    DM1.cdsRegCxC.FieldByName('DEDD').Value   := DM1.cdsQry.FieldByName('FecDia').AsString;
    DM1.cdsRegCxC.FieldByName('DESS').Value   := DM1.cdsQry.FieldByName('FecSS').AsString;
    DM1.cdsRegCxC.FieldByName('DESEM').Value  := DM1.cdsQry.FieldByName('FecSem').AsString;
    DM1.cdsRegCxC.FieldByName('DETRI').Value  := DM1.cdsQry.FieldByName('FecTrim').AsString;
    DM1.cdsRegCxC.FieldByName('DEAASS').Value := DM1.cdsQry.FieldByName('FecAASS').AsString;
    DM1.cdsRegCxC.FieldByName('DEAASem').Value:= DM1.cdsQry.FieldByName('FecAASem').AsString;
    DM1.cdsRegCxC.FieldByName('DEAATri').Value:= DM1.cdsQry.FieldByName('FecAATri').AsString;

    DM1.cdsRegCxC.FieldByName('DEMTOORI').AsFloat := xTotalCMN;
    DM1.cdsRegCxC.FieldByName('DEMTOLOC').AsFloat := xTotalCMN;
    DM1.cdsRegCxC.FieldByName('DEMTOEXT').AsFloat := DM1.FRound(xTotalCME/DM1.cdsRegCxC.fieldbyName('DETCDOC').AsFloat,15,2);

    // Adiciona Concepto PARA DOLARES
    DM1.cdsRegCxC.Insert;
    DM1.cdsRegCxC.FieldByName('CPNOREG').AsString:= DM1.strzero(GeneraCorrelativo( DM1.cdsRegCxC , 'CPNOREG' ), 10);
    DM1.cdsRegCxC.FieldByName('CIAID').Value     := dblcCia.Text;
    DM1.cdsRegCxC.FieldByName('CCTREC').Value    := 'CO';
    DM1.cdsRegCxC.FieldByName('DOCID2').Value    := dblcTDoc.Text;
    DM1.cdsRegCxC.FieldByName('CPSERIE').Value   := dbeSerie.Text;
    DM1.cdsRegCxC.FieldByName('CPNODOC').Value   := dblcdLICO.Text;
    DM1.cdsRegCxC.fieldbyName('TMONID').AsString := DM1.wTMonExt;

    DM1.cdsRegCxC.FieldbyName('CPTOID').AsString  := dblcdCnp.Text;
    xWhere:='CPTOID='''+dblcdCnp.Text+'''';
    DM1.cdsRegCxC.FieldbyName('CUENTAID').AsString:=DM1.DisplayDescrip('prvTGE','CAJA201','*',xWhere,'CUENTAID');

    DM1.cdsRegCxC.fieldbyName('DETCDOC').AsString:= dbeTCambio.Text;
    DM1.cdsRegCxC.FieldByName('DEDH').AsString   := 'H';     //Inicializo en haber
    xWhere:='FECHA='+DM1.wRepFuncDate+''''+formatdatetime(DM1.wFormatFecha,dbdtpFEmision.Date) +''')';
    DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
    DM1.cdsRegCxC.FieldByName('DEANO').Value  := DM1.cdsQry.FieldByName('FecAno').AsString;
    DM1.cdsRegCxC.FieldByName('DEMM').Value   := DM1.cdsQry.FieldByName('FecMes').AsString;
    DM1.cdsRegCxC.FieldByName('DEDD').Value   := DM1.cdsQry.FieldByName('FecDia').AsString;
    DM1.cdsRegCxC.FieldByName('DESS').Value   := DM1.cdsQry.FieldByName('FecSS').AsString;
    DM1.cdsRegCxC.FieldByName('DESEM').Value  := DM1.cdsQry.FieldByName('FecSem').AsString;
    DM1.cdsRegCxC.FieldByName('DETRI').Value  := DM1.cdsQry.FieldByName('FecTrim').AsString;
    DM1.cdsRegCxC.FieldByName('DEAASS').Value := DM1.cdsQry.FieldByName('FecAASS').AsString;
    DM1.cdsRegCxC.FieldByName('DEAASem').Value:= DM1.cdsQry.FieldByName('FecAASem').AsString;
    DM1.cdsRegCxC.FieldByName('DEAATri').Value:= DM1.cdsQry.FieldByName('FecAATri').AsString;

    DM1.cdsRegCxC.FieldByName('DEMTOORI').AsFloat := xTotalCME;
    DM1.cdsRegCxC.FieldByName('DEMTOEXT').AsFloat := xTotalCME;
    DM1.cdsRegCxC.FieldByName('DEMTOLOC').AsFloat := DM1.FRound(xTotalCME*DM1.cdsRegCxC.fieldbyName('DETCDOC').AsFloat,15,2);
  end
  else
  begin
    //Comprobar si no ha habido un  cambio en el tipo de cambio
    if ( dblcTMonCab.Text <> DM1.cdsRegCxC.FieldByName('TMONID').AsString ) or
       ( strtocurr(dbeTCambio.Text) <> (DM1.cdsRegCxC.FieldByName('DETCDOC').AsFloat) ) then
    begin
      ActualizaDetalle;
      z2bbtnSumatClick(sender)
    end;
  end;
end;


procedure TFCobConsolidado.RecalculaReg;
var
		xcont   : integer;
begin
		xcont:=0;
		DM1.cdsRegCxC.DisableControls;
		DM1.cdsRegCxC.First;
		While not DM1.cdsRegCxC.Eof do begin
			 xcont:=xcont+1;
			 DM1.cdsRegCxC.Edit;
       DM1.cdsRegCxC.FieldByName('CPNOREG').Value:=DM1.strzero(inttostr(xcont),10);
			 DM1.cdsRegCxC.Post;
       DM1.cdsRegCxC.Next;
    end;
    DM1.cdsRegCxC.First;
    DM1.cdsRegCxC.EnableControls;
end;

procedure TFCobConsolidado.FormKeyPress(Sender: TObject; var Key: Char);
var
   xStr : String;
begin
    if not aplicaKeyPress(self ,A2digitos , A4digitos) then
       Exit;
    if not( Key in [ '0'..'9' , '.' , #8 ]) then
    begin
       Key := #0;
    end;
    xStr := TCustomEdit(self.ActiveControl).text;
    if key = '.' then
       if pos('.',xSTR) <> 0 then
          Key := #0;
end;

procedure TFCobConsolidado.FormShow(Sender: TObject);
begin
   FocoInicial;
   if DM1.wModo='A' then
	 begin
			dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue:= '0.00';
			dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue:= '0.00';
	 end
	 else
	 begin
			AcumulaDetFPago;
	 end;
	 cf1.PonerExits;
	 xdnumreg := edNumReg.Text;

	 DM1.cdsTDoc.Filtered:= False;
	 DM1.cdsTDoc.Filter  := '';
	 DM1.cdsTDoc.Filter  := 'DOCMOD=''CAJA'' and DOCTIPREG=''CC'' ';
	 DM1.cdsTDoc.Filtered:= True;

   if Dm1.Wmodo = 'A' then
   begin
      if DM1.cdsTDoc.recordcount = 1 then
      begin
         dblcTDoc.Enabled := False;
         dblcTDoc.Text:= DM1.cdsTDoc.FieldByName('DOCID').AsString;
         edtTDoc.Text := DM1.cdsTDoc.FieldByName('DOCDES').AsString;
      end;

     DM1.cdsTMon.First;
     dblcTMonCab.Text := DM1.cdsTMon.FieldByName('TMONID').AsString;
     edtTMonCab.Text := DM1.cdsTMon.FieldByName('TMONABR').AsString;

     DM1.cdsBanco.Filtered:= False;
     DM1.cdsBanco.Filter  := '';
     DM1.cdsBanco.Filter  := 'BCOTIPCTA=''C'''; // AND BANCOID=''00'' ';
     DM1.cdsBanco.Filtered:= True;

      if DM1.cdsBanco.RecordCount = 1 then
      begin
         dblcBanco.enabled:=False;
         dblcBanco.text   :=DM1.cdsBanco.FieldByName('BANCOID').AsString;
         edtBanco.text    :=DM1.cdsBanco.FieldByName('BANCONOM').AsString;
      end;

       if dblcCia.Enabled then
          dblcCia.SetFocus
       else begin
          if dblcBanco.Enabled then
             dblcBanco.SetFocus
          else
             dbdtpFEmision.SetFocus;

       end;


//         dbeNoDoc.SetFocus;
	 end
   else begin
      dblcCia.Enabled   :=False;
      dblcTDoc.Enabled  :=False;
      dbeSerie.Enabled  :=False;
      dblcdLICO.Enabled  :=False;
			//dbeNoDoc.Enabled  :=False;
			dbdtpFEmision.Enabled:=False;
      dblcBanco.Enabled :=False;
      edNumReg.Enabled  :=False;
      if DM1.cdsIngDocs.FieldByName('NCOESTADO').AsString='I' then
         dblcTMonCab.SetFocus;
	 end;
end;

Procedure TFCobConsolidado.AdicionaRegistro;
var
	 aux,xWhere : string;
begin

	 With DM1 do
	 begin
			cdsRegCxC.Insert;
			cdsRegCxC.FieldByName('CPNOREG').AsString := DM1.strzero(GeneraCorrelativo( DM1.cdsRegCxC , 'CPNOREG' ), 10);
			cdsRegCxC.FieldByName('CIAID').Value     := dblcCia.Text;
			cdsRegCxC.FieldByName('DOCID2').Value    := dblcTDoc.Text;
			cdsRegCxC.FieldByName('CPSERIE').Value   := dbeSerie.Text;
			cdsRegCxC.FieldByName('CPNODOC').Value   := dblcdLICO.Text;
			//cdsRegCxC.FieldByName('CPNODOC').Value   := dbeNoDoc.Text;
			cdsRegCxC.fieldbyName('TMONID').AsString := dblcTMonCab.Text;
			cdsRegCxC.FieldbyName('CPTOID').AsString := dblcdCnp.Text;
			cdsRegCxC.fieldbyName('DETCDOC').AsString:= dbeTCambio.Text;
			cdsRegCxC.FieldByName('DEDH').AsString   := 'H';     //Inicializo en haber
			xWhere:='FECHA='+wRepFuncDate+''''+formatdatetime(DM1.wFormatFecha,dbdtpFEmision.Date) +''')';
			aux   :=DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
			cdsRegCxC.FieldByName('DEANO').Value  := cdsqry.FieldByName('FecAno').Value;
			cdsRegCxC.FieldByName('DEMM').Value   := cdsqry.FieldByName('FecMes').Value;
			cdsRegCxC.FieldByName('DEDD').Value   := cdsqry.FieldByName('FecDia').Value;
			cdsRegCxC.FieldByName('DESS').Value   := cdsqry.FieldByName('FecSS').Value;
			cdsRegCxC.FieldByName('DESEM').Value  := cdsqry.FieldByName('FecSem').Value;
			cdsRegCxC.FieldByName('DETRI').Value  := cdsqry.FieldByName('FecTrim').Value;
			cdsRegCxC.FieldByName('DEAASS').Value := cdsqry.FieldByName('FecAASS').Value;
			cdsRegCxC.FieldByName('DEAASem').Value:= cdsqry.FieldByName('FecAASem').Value;
			cdsRegCxC.FieldByName('DEAATri').Value:= cdsqry.FieldByName('FecAATri').Value;
	 end;


	 perform(CM_DialogKey,VK_TAB,0);
end;

Procedure TFCobConsolidado.EditaRegistro;
begin
	 DM1.cdsRegCxC.Edit;

	 perform(CM_DialogKey,VK_TAB,0);

end;

procedure TFCobConsolidado.Z2bbtnContClick(Sender: TObject);
var
	 xWhere, xSQL,  xxAA : String;
   a,m,d:word;
begin
	 if MessageDlg('¿Contabilizar y Generar Asientos Automaticos?',mtConfirmation,
								[mbYes, mbNo], 0)=mrYes then
	 begin
       if DM1.cdsIngDocs.FieldByName('CCCONTA').AsString<>'S' THEN
       begin
          screen.Cursor := crHourGlass;
          DM1.cdsRegCxC.DisableControls;
          DM1.cdsRegCxC.Filtered := False;

          Contabiliza;

          DM1.cdsRegCxC.Filtered := True;
          DM1.cdsRegCxC.EnableControls;

          xSQL:='Select * from CAJA302 '
               +'Where CIAID='''   +DM1.cdsIngDocs.FieldByName('CIAID').AsString+''' and '
               +      'TDIARID=''' +DM1.cdsIngDocs.FieldByName('TDIARID').AsString+''' and '
               +      'ECANOMM=''' +DM1.cdsIngDocs.FieldByName('ECANOMM').AsString+''' and '
               +      'ECNODOC='''+dblcdLICO.Text +''' ';
          DM1.cdsEgrCaja.Close;
          DM1.cdsEgrCaja.DataRequest( xSQL );
          DM1.cdsEgrCaja.Open;
          DM1.cdsEgrCaja.First;

          while not DM1.cdsEgrCaja.EOF do
          begin
            ActualizaCNT311( DM1.cdsEgrcaja.FieldByName('CIAID').AsString,
                             DM1.cdsEgrcaja.FieldByName('TDIARID').AsString,
                             DM1.cdsEgrcaja.FieldByName('ECNOCOMP').AsString,
                             DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString );

            if NOT SOLConta(DM1.cdsEgrCaja.FieldByName('CIAID').AsString,
                        DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
                        DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                        DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                        DM1.SRV_D, 'CCNA', DM1.wModulo, DM1.cdsCNT311, DM1.cdsNivel,
                        DM1.cdsResultSet, DM1.DCOM1, Self ) then
            begin
              ShowMessage('Error el la contabilización');
            end;
            {ImprimeVoucher( 'CNT311', dblcCia.Text, DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                            DM1.cdsEgrCaja.FieldByName('TDIARID').AsString, DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                            DM1.cdsEgrCaja.FieldByName('ECGLOSA').AsString);}

            DM1.cdsEgrCaja.Next;
          end;


          // generar Asientos de Depositos en Banco
          xSQL:='Select  CIAID, TDIARID, ECANOMM, ECNOCOMP,ECGLOSA '
               +'From CAJA302 '
               +'Where CIAID='''+dblcCia.Text+''' and ECNODOC='''+dblcdLICO.Text+''' AND CCBCOID<>'''' '
               +'GROUP BY CIAID, TDIARID, ECANOMM, ECNOCOMP,ECGLOSA';

          DM1.cdsEgrcaja2.Close;
          DM1.cdsEgrcaja2.DataRequest( xSQL );
          DM1.cdsEgrcaja2.Open;

          while not DM1.cdsEgrcaja2.Eof do
          begin
            ActualizaCNT311( DM1.cdsEgrcaja2.FieldByName('CIAID').AsString,
                             DM1.cdsEgrCaja2.FieldByName('TDIARID').AsString,
                             DM1.cdsEgrCaja2.FieldByName('ECNOCOMP').AsString,
                             DM1.cdsEgrCaja2.FieldByName('ECANOMM').AsString );

            if NOT SOLConta(DM1.cdsEgrCaja2.FieldByName('CIAID').AsString,
                         DM1.cdsEgrCaja2.FieldByName('TDIARID').AsString,
                         DM1.cdsEgrCaja2.FieldByName('ECANOMM').AsString,
                         DM1.cdsEgrCaja2.FieldByName('ECNOCOMP').AsString,
                         DM1.SRV_D, 'CCNA', DM1.wModulo, DM1.cdsCNT311, DM1.cdsNivel,
                         DM1.cdsResultSet, DM1.DCOM1, Self ) then
            begin
              ShowMessage('Error el la contabilización');
            end;
            {ImprimeVoucher( 'CNT311', dblcCia.Text, DM1.cdsEgrCaja2.FieldByName('ECANOMM').AsString,
                            DM1.cdsEgrCaja2.FieldByName('TDIARID').AsString, DM1.cdsEgrCaja2.FieldByName('ECNOCOMP').AsString,
                            DM1.cdsEgrCaja2.FieldByName('ECGLOSA').AsString);}

            DM1.cdsEgrcaja2.Next;
          end;

          screen.Cursor := crDefault;
       end;

       DM1.cdsIngDocs.Edit;
       DM1.cdsIngDocs.FieldByName('CCCONTA').AsString :='S';
       DM1.cdsIngDocs.Post;
       if DM1.cdsIngDocs.ApplyUpdates(0) > 0 then
       begin
          raise exception.create('Error en Ingreso de Documentos');
       end;
       Z2bbtnCont.enabled:=False;
			ShowMessage('Contabilizacion OK');

	 end;
end;


procedure TFCobConsolidado.z2bbtnImprimeClick(Sender: TObject);
var
	 xWhere, xSQL,  xxAA : String;
begin

	 if DM1.cdsIngDocs.FieldByName('CCCONTA').AsString<>'S' THEN
	 begin
			screen.Cursor := crHourGlass;
			DM1.cdsRegCxC.DisableControls;
			DM1.cdsRegCxC.Filtered := False;

			Contabiliza;

			DM1.cdsRegCxC.Filtered := True;
			DM1.cdsRegCxC.EnableControls;

      xSQL:='Select * from CAJA302 '
           +'Where CIAID='''   +DM1.cdsIngDocs.FieldByName('CIAID').AsString+''' and '
           +      'TDIARID=''' +DM1.cdsIngDocs.FieldByName('TDIARID').AsString+''' and '
           +      'ECANOMM=''' +DM1.cdsIngDocs.FieldByName('ECANOMM').AsString+''' and '
           +      'ECNODOC='''+dblcdLICO.Text +''' ';
      DM1.cdsEgrCaja.Close;
      DM1.cdsEgrCaja.DataRequest( xSQL );
      DM1.cdsEgrCaja.Open;
      DM1.cdsEgrCaja.First;

      while not DM1.cdsEgrCaja.EOF do
      begin
        ActualizaCNT311( DM1.cdsEgrcaja.FieldByName('CIAID').AsString,
                         DM1.cdsEgrcaja.FieldByName('TDIARID').AsString,
                         DM1.cdsEgrcaja.FieldByName('ECNOCOMP').AsString,
                         DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString );

        if NOT SOLConta(DM1.cdsEgrCaja.FieldByName('CIAID').AsString,
                    DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
                    DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                    DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                    DM1.SRV_D, 'PCNA', DM1.wModulo, DM1.cdsCNT311, DM1.cdsNivel,
                    DM1.cdsResultSet, DM1.DCOM1, Self ) then
        begin
          ShowMessage('Error el la contabilización');
        end;
        ImprimeVoucher( 'CNT311', dblcCia.Text, DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                        DM1.cdsEgrCaja.FieldByName('TDIARID').AsString, DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                        DM1.cdsEgrCaja.FieldByName('ECGLOSA').AsString);

        DM1.cdsEgrCaja.Next;
      end;


			// generar Asientos de Depositos en Banco
			xSQL:='Select  CIAID, TDIARID, ECANOMM, ECNOCOMP,ECGLOSA '
					 +'From CAJA302 '
					 +'Where CIAID='''+dblcCia.Text+''' and ECNODOC='''+dblcdLICO.Text+''' AND CCBCOID<>'''' '
					 +'GROUP BY CIAID, TDIARID, ECANOMM, ECNOCOMP,ECGLOSA';

			DM1.cdsEgrcaja2.Close;
			DM1.cdsEgrcaja2.DataRequest( xSQL );
			DM1.cdsEgrcaja2.Open;

			while not DM1.cdsEgrcaja2.Eof do
      begin
				ActualizaCNT311( DM1.cdsEgrcaja2.FieldByName('CIAID').AsString,
												 DM1.cdsEgrCaja2.FieldByName('TDIARID').AsString,
												 DM1.cdsEgrCaja2.FieldByName('ECNOCOMP').AsString,
												 DM1.cdsEgrCaja2.FieldByName('ECANOMM').AsString );

				if NOT SOLConta(DM1.cdsEgrCaja2.FieldByName('CIAID').AsString,
										 DM1.cdsEgrCaja2.FieldByName('TDIARID').AsString,
										 DM1.cdsEgrCaja2.FieldByName('ECANOMM').AsString,
										 DM1.cdsEgrCaja2.FieldByName('ECNOCOMP').AsString,
										 DM1.SRV_D, 'PCNA', DM1.wModulo, DM1.cdsCNT311, DM1.cdsNivel,
										 DM1.cdsResultSet, DM1.DCOM1, Self ) then
				begin
          ShowMessage('Error el la contabilización');
				end;
        ImprimeVoucher( 'CNT311', dblcCia.Text, DM1.cdsEgrCaja2.FieldByName('ECANOMM').AsString,
                        DM1.cdsEgrCaja2.FieldByName('TDIARID').AsString, DM1.cdsEgrCaja2.FieldByName('ECNOCOMP').AsString,
                        DM1.cdsEgrCaja2.FieldByName('ECGLOSA').AsString);

				DM1.cdsEgrcaja2.Next;
			end;

 		  screen.Cursor := crDefault;
	 end
   else
   begin
   //IMPRIME COMPROBANTES SIN CONTABILIZAR
      xSQL:='Select * from CAJA302 '
           +'Where CIAID='''   +DM1.cdsIngDocs.FieldByName('CIAID').AsString+''' and '
           +      'TDIARID=''' +DM1.cdsIngDocs.FieldByName('TDIARID').AsString+''' and '
           +      'ECANOMM=''' +DM1.cdsIngDocs.FieldByName('ECANOMM').AsString+''' and '
           +      'ECNODOC='''+dblcdLICO.Text +''' ';
      DM1.cdsEgrCaja.Close;
      DM1.cdsEgrCaja.DataRequest( xSQL );
      DM1.cdsEgrCaja.Open;
      DM1.cdsEgrCaja.First;

      while not DM1.cdsEgrCaja.EOF do
      begin
        ImprimeVoucher( 'CNT301', dblcCia.Text, DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                        DM1.cdsEgrCaja.FieldByName('TDIARID').AsString, DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                        DM1.cdsEgrCaja.FieldByName('ECGLOSA').AsString);

        DM1.cdsEgrCaja.Next;
      end;


			// generar Asientos de Depositos en Banco
			xSQL:='Select  CIAID, TDIARID, ECANOMM, ECNOCOMP,ECGLOSA '
					 +'From CAJA302 '
					 +'Where CIAID='''+dblcCia.Text+''' and ECNODOC='''+dblcdLICO.Text+''' AND CCBCOID<>'''' '
					 +'GROUP BY CIAID, TDIARID, ECANOMM, ECNOCOMP,ECGLOSA';

			DM1.cdsEgrcaja2.Close;
			DM1.cdsEgrcaja2.DataRequest( xSQL );
			DM1.cdsEgrcaja2.Open;
      DM1.cdsEgrcaja2.First;


			while not DM1.cdsEgrcaja2.Eof do
      begin
        ImprimeVoucher( 'CNT301', dblcCia.Text, DM1.cdsEgrCaja2.FieldByName('ECANOMM').AsString,
                        DM1.cdsEgrCaja2.FieldByName('TDIARID').AsString, DM1.cdsEgrCaja2.FieldByName('ECNOCOMP').AsString,
                        DM1.cdsEgrCaja2.FieldByName('ECGLOSA').AsString);

				DM1.cdsEgrcaja2.Next;
			end;
   end;
 		  screen.Cursor := crDefault;
end;




procedure TFCobConsolidado.Contabiliza;
var
 xRegAct : TBookMark;
 xSQL, xNoCompB, xWhere : String;

begin
	 // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera
	 // Se Inserta en Cabecera de caja

	 xSQL:='Select * from CAJA302 '
				+'Where CIAID='''   +DM1.cdsIngDocs.FieldByName('CIAID').AsString+''' and '
				+      'TDIARID=''' +DM1.cdsIngDocs.FieldByName('TDIARID').AsString+''' and '
				+      'ECANOMM=''' +DM1.cdsIngDocs.FieldByName('ECANOMM').AsString+''' and '
				+      'ECNODOC='''+dblcdLICO.Text +''' ';
	 DM1.cdsEgrCaja.Close;
	 DM1.cdsEgrCaja.DataRequest( xSQL );
	 DM1.cdsEgrCaja.Open;

   while not DM1.cdsEgrCaja.EOF do
   begin
  	 PreparaCaja304( DM1.cdsIngDocs.FieldByName('TDIARID').AsString,DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
     DM1.cdsCntCaja.Insert;
     xNReg := 0;
     Contab_IngCaja;

     xSQL:='Select * from CAJA301 '
          +'Where CIAID='''   +DM1.cdsIngDocs.FieldByName('CIAID').AsString+''' and '
          +      'TDIARID=''' +DM1.cdsIngDocs.FieldByName('TDIARID').AsString+''' and '
          +      'ECANOMM=''' +DM1.cdsIngDocs.FieldByName('ECANOMM').AsString+''' and '
          +      'ECNOCOMP='+QuotedStr(DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
     DM1.cdsRegCxC.Close;
     DM1.cdsRegCxC.DataRequest( xSQL );
     DM1.cdsRegCxC.Open;

     DM1.cdsRegCxC.First;

     // GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde el Detalle
     While not DM1.cdsRegCxC.Eof do
     begin
        DM1.cdsCntCaja.Insert;
        Contab_RegCxP;
        DM1.cdsRegCxC.Next;
     end;

     DM1.AplicaDatos(DM1.cdsCntCaja, 'CNTCAJA');
     DM1.cdsEgrCaja.Next;
   end; //Caja


	 // Para Generar los Asientos de Ingreso a Banco
	 xSQL:='SELECT A.*, B.CCBCOVOUCH TDIARID, CTAPRINC CUENTAID, CTAREMES, TMONID '
				+'FROM ( select  CIAID, ECNOCOMP, ECANOMM, BANCOID, CCBCOID, ECNOCHQ, FPAGOID, FC_MTOLOC MTOLOC, FC_MTOEXT MTOEXT '
				+      ' from CAJA314 '
				+      ' where CIAID='''+dblcCia.Text+''' and LICOID='''+dblcdLICO.Text+''' AND CCBCOID<>'''' '
				+      ') A, TGE106 B '
				+'WHERE B.CIAID=A.CIAID AND B.BANCOID=A.BANCOID AND B.CCBCOID=A.CCBCOID';
	 DM1.cdsEgrcaja2.Close;
	 DM1.cdsEgrcaja2.DataRequest( xSQL );
	 DM1.cdsEgrcaja2.Open;

	 DM1.cdsEgrCaja2.First;
	 while not DM1.cdsEgrCaja2.Eof do
   begin

			xSQL:='Select * from CAJA302 '
					 +'Where CIAID='''   +dblcCia.Text    +''' and '
					 +      'TDIARID=''' +DM1.cdsEgrcaja2.FieldByName('TDIARID').AsString+''' and '
					 +      'ECANOMM=''' +DM1.cdsEgrcaja2.FieldByName('ECANOMM').AsString+''' and '
					 +      'ECNOCOMP='''+DM1.cdsEgrcaja2.FieldByName('ECNOCOMP').AsString        +''' ';
      DM1.cdsEgrCaja.Close;
			DM1.cdsEgrCaja.DataRequest( xSQL );
      DM1.cdsEgrCaja.Open;


			PreparaCaja304( DM1.cdsEgrCaja.FieldByName('TDIARID').AsString, DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString );

			Contab_Banco( 'D' );
			Contab_Banco( 'H' );

			DM1.AplicaDatos(DM1.cdsCntCaja, 'CNTCAJA');

			DM1.cdsEgrCaja2.Next;
	 end;

end;


procedure TFCobConsolidado.PreparaCaja304( xxDIA, xxCOM : String );
var
	 xSQL : String;
begin
	 xSQL:='DELETE FROM CAJA304 '
				+'WHERE CIAID='   +quotedstr(DM1.cdsEgrcaja.FieldByName('CIAID').AsString  ) +' AND '
				+      'TDIARID=' +quotedstr( xxDIA                                        ) +' AND '
				+      'ECANOMM=' +quotedstr(DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString) +' AND '
				+      'ECNOCOMP='+quotedstr( xxCOM                                        );
	 try
			DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
	 except
	 end;

	 xSQL:='Select * from CAJA304 '
				+'WHERE CIAID='   +quotedstr(DM1.cdsEgrcaja.FieldByName('CIAID').AsString   ) +' AND '
				+      'TDIARID=' +quotedstr( xxDIA                                         ) +' AND '
				+      'ECANOMM=' +quotedstr(DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString ) +' AND '
				+      'ECNOCOMP='+quotedstr( xxCOM                                         );
	 DM1.cdsCNTCaja.Close;
	 DM1.cdsCNTCaja.DataRequest( xSQL );
	 try
		 DM1.cdsCNTCaja.Open;
	 except
	 end;
end;


procedure TFCobConsolidado.InsertaCAJA302( xxCIA, xxTDI, xxAAMM, xxCOMP, xxCpto, xxCta,xxCta1,xxTMon, xxBCo, xxCCb : String;
																					 xxMtoLoc, xxMtoExt : Double;xProce:string);
var
	 xWhere, aux : String;
begin
	 DM1.cdsEgrCaja.Insert;
	 DM1.cdsEgrcaja.FieldByName('CIAID').AsString   :=xxCIA;
	 DM1.cdsEgrCaja.FieldByName('TDIARID').AsString :=xxTDI;
	 DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString :=xxAAMM;
	 DM1.cdsEgrCaja.FieldByName('ECNODOC').AsString :=dblcdLICO.text;
	 DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString:=xxCOMP;
	 DM1.cdsEgrCaja.FieldByName('ECFCOMP').Value    :=dbdtpFEmision.Date;
	 DM1.cdsEgrCaja.FieldByName('TMONID').Value     :=xxTMon;
	 DM1.cdsEgrCaja.FieldByName('ECTCAMB').Value    :=strtofloat(dbeTCambio.Text);

	 if DM1.cdsEgrCaja.FieldByName('TMONID').Value=DM1.wTMonLoc then
			DM1.cdsEgrCaja.FieldByName('ECMTOORI').Value:=xxMtoLoc
	 else begin
			DM1.cdsEgrCaja.FieldByName('ECMTOORI').Value:=xxMtoExt;
	 end;

	 DM1.cdsEgrCaja.FieldByName('ECMTOLOC').Value:=xxMtoLoc;
	 DM1.cdsEgrCaja.FieldByName('ECMTOEXT').Value:=xxMtoExt;

	 if trim(dblcdFEfec.Text) = '' then
			DM1.cdsEgrCaja.FieldByName('FLUEID').Clear
	 else
			DM1.cdsEgrCaja.FieldByName('FLUEID').AsString := trim(dblcdFEfec.Text) ;

	 DM1.cdsEgrCaja.FieldByName('BANCOID').Value :=xxBco;
	 DM1.cdsEgrCaja.FieldByName('CCBCOID').Value :=xxCCB;

	 // se condiciona porque si esta en blanco la fecha graba 1899
	 //DM1.cdsEgrCaja.FieldByName('PROV').Value    := dblcdAux.Text ;
	 //DM1.cdsEgrCaja.FieldByName('PROVRUC').Value := edtAuxRuc.Text ;
	 //DM1.cdsEgrCaja.FieldByName('CLAUXID').AsString := dblcClase.Text ;
	 //DM1.cdsEgrCaja.FieldByName('ECGIRA').AsString := dbeGiradoA.Text ;
	 DM1.cdsEgrCaja.FieldByName('CPTOID').Value  :=xxCpto;
	 DM1.cdsEgrCaja.FieldByName('CUENTAID').Value:=xxCta;
	 DM1.cdsEgrCaja.FieldByName('ECGLOSA').Value :=dbeGlosa.Text;
	 DM1.cdsEgrCaja.FieldByName('ECESTADO').Value:='C';

	 xWhere:='FECHA='+DM1.wRepFuncDate +''''+ formatdatetime(DM1.wFormatFecha,dbdtpFEmision.Date)+''')';
	 aux   :=DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
	 DM1.cdsEgrCaja.FieldByName('ECANO').AsString   := DM1.cdsQry.FieldByName('FECANO').AsString;
	 DM1.cdsEgrCaja.FieldByName('ECMM').AsString    := DM1.cdsQry.FieldByName('FECMES').AsString;
	 DM1.cdsEgrCaja.FieldByName('ECDD').AsString    := DM1.cdsQry.FieldByName('FECDIA').AsString;
	 DM1.cdsEgrCaja.FieldByName('ECSS').AsString    := DM1.cdsQry.FieldByName('FECSS').AsString;
	 DM1.cdsEgrCaja.FieldByName('ECSEM').AsString   := DM1.cdsQry.FieldByName('FECSEM').AsString;
	 DM1.cdsEgrCaja.FieldByName('ECTRI').AsString   := DM1.cdsQry.FieldByName('FECTRIM').AsString;
	 DM1.cdsEgrCaja.FieldByName('ECAASS').AsString  := DM1.cdsQry.FieldByName('FECAASS').AsString;
	 DM1.cdsEgrCaja.FieldByName('ECAASEM').AsString := DM1.cdsQry.FieldByName('FECAASEM').AsString;
	 DM1.cdsEgrCaja.FieldByName('ECAATRI').AsString := DM1.cdsQry.FieldByName('FECAATRI').AsString;

 	 DM1.cdsEgrCaja.FieldByName('EC_PROCE').AsString:=xProce;

	 DM1.cdsEgrCaja.FieldByName('EC_IE').AsString   :='I' ;

			// Inserta en Detalle de Caja Cuando es deposito a Banco
			DM1.cdsRegCxP.Insert;
			DM1.cdsRegCxP.FieldByName('CIAID').Value   := xxCIA;
			DM1.cdsRegCxP.FieldByName('CUENTAID').Value:= xxCta1;
			DM1.cdsRegCxP.FieldByName('TDIARID').Value := xxTDI;
			DM1.cdsRegCxP.FieldByName('ECANOMM').Value := xxAAMM;
			DM1.cdsRegCxP.FieldByName('ECNOCOMP').Value:= xxCOMP;
			DM1.cdsRegCxP.FieldByName('DEFCOMP').Value := dbdtpFEmision.Date;
			DM1.cdsRegCxP.FieldByName('DETCPAG').Value := strtofloat(dbeTCambio.Text);
			DM1.cdsREgCxP.FieldBYName('DETCDOC').Value := strtofloat(dbeTCambio.Text);
			DM1.cdsRegCxP.FieldByName('DOCID2').Value  := dblcTDoc.Text;
			DM1.cdsRegCxP.FieldByName('DOCMOD').Value  := DM1.cdsTDoc.FieldByname('DOCMOD').AsString;
			DM1.cdsRegCxP.FieldByName('CPSERIE').Value := '';
			DM1.cdsRegCxP.FieldByName('CPNODOC').AsString := dblcdLICO.text;
			DM1.cdsRegCxP.FieldByName('TMONID').Value  := xxTMon;
			DM1.cdsRegCxP.FieldByName('CPFEMIS').Value := DateS;
			DM1.cdsRegCxP.FieldByName('CPFVCMTO').Value:= DateS;
			DM1.cdsRegCxP.FieldByName('DETCPAG').Value := DM1.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
			DM1.cdsRegCxP.FieldByName('DEDH').Value    := 'H';     //Inicializo en Debe
			DM1.cdsRegCxP.FieldByName('CPTOID').Value  := dblcdCnp.Text;
			if DM1.cdsRegCxP.FieldByName('TMONID').Value=DM1.wTMonLoc then
					DM1.cdsRegCxP.FieldByName('DEMTOORI').Value:=xxMtoLoc
			else begin
					DM1.cdsRegCxP.FieldByName('DEMTOORI').Value:=xxMtoExt;
			end;
			DM1.cdsRegCxP.FieldByName('DEMTOLOC').Value:=xxMtoLoc;
			DM1.cdsRegCxP.FieldByName('DEMTOEXT').Value:=xxMtoExt;
      DM1.cdsRegCxP.FieldByName('DEANO').AsString   := DM1.cdsQry.FieldByName('FECANO').AsString;
      DM1.cdsRegCxP.FieldByName('DEMM').AsString    := DM1.cdsQry.FieldByName('FECMES').AsString;
      DM1.cdsRegCxP.FieldByName('DEDD').AsString    := DM1.cdsQry.FieldByName('FECDIA').AsString;
      DM1.cdsRegCxP.FieldByName('DESS').AsString    := DM1.cdsQry.FieldByName('FECSS').AsString;
      DM1.cdsRegCxP.FieldByName('DESEM').AsString   := DM1.cdsQry.FieldByName('FECSEM').AsString;
      DM1.cdsRegCxP.FieldByName('DETRI').AsString   := DM1.cdsQry.FieldByName('FECTRIM').AsString;
      DM1.cdsRegCxP.FieldByName('DEAASS').AsString  := DM1.cdsQry.FieldByName('FECAASS').AsString;
      DM1.cdsRegCxP.FieldByName('DEAASEM').AsString := DM1.cdsQry.FieldByName('FECAASEM').AsString;
      DM1.cdsRegCxP.FieldByName('DEAATRI').AsString := DM1.cdsQry.FieldByName('FECAATRI').AsString;
			cdspost( DM1.cdsRegCxP );
			DM1.AplicaDatos(DM1.cdsRegCxP,   'REGCXP');
end;



procedure TFCobConsolidado.Contab_Banco( xDHB : String );
begin
	 DM1.cdsCntCaja.Insert;
	 DM1.cdsCntCaja.FieldByName('CIAID').Value   := DM1.cdsEgrCaja.fieldbyName('CIAID').AsString;
	 DM1.cdsCntCaja.FieldByName('TDIARID').Value := DM1.cdsEgrCaja.fieldbyName('TDIARID').AsString;
	 DM1.cdsCntCaja.FieldByName('ECANOMM').Value := DM1.cdsEgrCaja.fieldbyName('ECANOMM').AsString;
	 DM1.cdsCntCaja.FieldByName('ECNOCOMP').Value:= DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
	 DM1.cdsCntCaja.FieldByName('DOCID').Value   := DM1.cdsIngDocs.fieldbyName('DOCID').AsString;
	 DM1.cdsCntCaja.FieldByName('DCSERIE').Value := DM1.cdsIngDocs.fieldbyName('CCSERIE').AsString;
	 //DM1.cdsCntCaja.FieldByName('DCNODOC').Value := DM1.cdsIngDocs.fieldbyName('CCNODOC').AsString;
	 DM1.cdsCntCaja.FieldByName('DCNODOC').Value := DM1.cdsEgrcaja2.fieldbyName('ECNOCHQ').AsString;
	 DM1.cdsCntCaja.FieldByName('ECFCOMP').Value := DM1.cdsIngDocs.FieldbyName('CCFEMIS').AsDateTime;
	 DM1.cdsCntCaja.FieldByName('DCFEMIS').Value := DM1.cdsIngDocs.FieldbyName('CCFEMIS').AsDateTime;
	 DM1.cdsCntCaja.FieldByName('DCFVCMTO').Value:= DM1.cdsIngDocs.FieldbyName('CCFEMIS').AsDateTime;
	 DM1.cdsCntCaja.FieldByName('CPTOID').Value  := '';
	 if xDHB='D' then begin
			DM1.cdsCntCaja.FieldByName('DCDH').Value    := xDHB;
			DM1.cdsCntCaja.FieldByName('CUENTAID').Value:= DM1.cdsEgrCaja2.FieldByName('CUENTAID').AsString;
			DM1.cdsCntCaja.FieldByName('FCAB').AsString := '1';
			DM1.cdsCntCaja.fieldbyName('NREG').AsInteger:= 1;
	 end
	 else begin
			DM1.cdsCntCaja.FieldByName('DCDH').Value    := xDHB;
			DM1.cdsCntCaja.FieldByName('CUENTAID').Value:= DM1.cdsEgrCaja2.FieldByName('CTAREMES').AsString;
			DM1.cdsCntCaja.fieldbyName('NREG').AsInteger:= 2;
	 end;

	 DM1.cdsCntCaja.FieldByName('TMONID').Value  := DM1.cdsEgrCaja.fieldbyName('TMONID').AsString;

	 if DM1.cdsIngDocs.FieldByName('TMONID').Value=DM1.wtMonLoc then
			DM1.cdsCntCaja.FieldByName('DCMTOORI').Value:= DM1.cdsEgrCaja2.fieldbyName('MTOLOC').AsFloat
	 else
			DM1.cdsCntCaja.FieldByName('DCMTOORI').Value:= DM1.cdsEgrCaja2.fieldbyName('MTOEXT').AsFloat;

	 DM1.cdsCntCaja.FieldByName('DCMTOLO').Value    := DM1.cdsEgrCaja2.fieldbyName('MTOLOC').AsFloat;
	 DM1.cdsCntCaja.FieldByName('DCMTOEXT').Value   := DM1.cdsEgrCaja2.FieldByName('MTOEXT').AsFloat;
	 DM1.cdsCntCaja.FieldByName('DCFLACDR').Value   := 'S';   //Registro ya cuadrado
	 DM1.cdsCntCaja.FieldByName('DCANO').Value      := DM1.cdsIngDocs.fieldbyName('NCOANO').AsString;
	 DM1.cdsCntCaja.FieldByName('DCMM').Value       := DM1.cdsIngDocs.fieldbyName('NCOMM').AsString;
	 DM1.cdsCntCaja.FieldByName('DCDD').Value       := DM1.cdsIngDocs.fieldbyName('NCODD').AsString;
	 DM1.cdsCntCaja.FieldByName('DCSS').Value       := DM1.cdsIngDocs.fieldbyName('NCOSS').AsString;
	 DM1.cdsCntCaja.FieldByName('DCSEM').Value      := DM1.cdsIngDocs.fieldbyName('NCOSEM').AsString;
	 DM1.cdsCntCaja.FieldByName('DCTRI').Value      := DM1.cdsIngDocs.fieldbyName('NCOTRI').AsString;
	 DM1.cdsCntCaja.FieldByName('DCAASS').Value     := DM1.cdsIngDocs.fieldbyName('NCOAASS').AsString;
	 DM1.cdsCntCaja.FieldByName('DCAASEM').Value    := DM1.cdsIngDocs.fieldbyName('NCOAASEM').AsString;
	 DM1.cdsCntCaja.FieldByName('DCAATRI').Value    := DM1.cdsIngDocs.FieldByName('NCOAATRI').AsString;
	 DM1.cdsCntCaja.FieldByName('DCGLOSA').AsString := DM1.cdsIngDocs.fieldBYName('CCGLOSA').AsString;
	 DM1.cdsCntCaja.FieldByName('DCTCAMPA').AsString:= dbeTCambio.Text;
	 DM1.cdsCntCaja.FieldByName('DCTCAMPR').AsString:= dbeTCambio.Text;
	 DM1.cdsCntCaja.FieldByName('DOCMOD').AsString  := Fprincipal.xModulo;
	 DM1.cdsCntCaja.FieldByName('DCUSER').Value     :=  DM1.wUsuario;
	 DM1.cdsCntCaja.FieldByName('DCFREG').Value     :=  Date;
	 DM1.cdsCntCaja.FieldByName('DCHREG').Value     :=  Time;
end;


procedure TFCobConsolidado.Contab_IngCaja;
begin
	 DM1.cdsCntCaja.FieldByName('CIAID').AsString  := DM1.cdsIngDocs.fieldbyName('CIAID').AsString;
	 DM1.cdsCntCaja.FieldByName('TDIARID').AsString:= DM1.cdsIngDocs.fieldbyName('TDIARID').AsString;
	 DM1.cdsCntCaja.FieldByName('ECANOMM').AsString:= DM1.cdsIngDocs.fieldbyName('ECANOMM').AsString;
	 DM1.cdsCntCaja.FieldByName('ECNOCOMP').Value  := DM1.cdsEgrCaja.fieldbyName('ECNOCOMP').AsString;
	 DM1.cdsCntCaja.FieldByName('DCLOTE').Value    := DM1.cdsIngDocs.FieldByName('CCLOTE').AsString;
	 DM1.cdsCntCaja.FieldByName('DCNODOC').Value   := DM1.cdsIngDocs.fieldbyName('CCNODOC').Value;
	 DM1.cdsCntCaja.FieldByName('ECFCOMP').Value   := DM1.cdsIngDocs.FieldbyName('CCFEMIS').AsDateTime;
	 DM1.cdsCntCaja.FieldByName('CPTOID').Value    := DM1.cdsIngDocs.FieldByName('CPTOID').AsString;
	 DM1.cdsCntCaja.FieldByName('CUENTAID').Value  := DM1.cdsEgrCaja.FieldByName('CUENTAID').AsString;
	 DM1.cdsCntCaja.FieldByName('DCDH').Value      := 'D';
	 DM1.cdsCntCaja.FieldByName('TMONID').Value    := DM1.cdsEgrCaja.fieldbyName('TMONID').AsString;

	 if DM1.cdsEgrCaja.fieldbyName('TMONID').AsString = DM1.wtMonLoc then
		 DM1.cdsCntCaja.FieldByName('DCMTOORI').Value := DM1.cdsEgrCaja.fieldbyName('ECMTOLOC').AsFloat
	 else
		 DM1.cdsCntCaja.FieldByName('DCMTOORI').Value := DM1.cdsEgrCaja.fieldbyName('ECMTOEXT').AsFloat;

	 DM1.cdsCntCaja.FieldByName('DCMTOLO').Value    := DM1.cdsEgrCaja.fieldbyName('ECMTOLOC').AsFloat;
	 DM1.cdsCntCaja.FieldByName('DCMTOEXT').Value   := DM1.cdsEgrCaja.fieldbyName('ECMTOEXT').AsFloat;
	 DM1.cdsCntCaja.FieldByName('DCFLACDR').Value   := 'S';   //Registro ya cuadrado
	 DM1.cdsCntCaja.FieldByName('DCANO').Value      := DM1.cdsEgrCaja.fieldbyName('ECANO').AsString;
	 DM1.cdsCntCaja.FieldByName('DCMM').Value       := DM1.cdsEgrCaja.fieldbyName('ECMM').AsString;
	 DM1.cdsCntCaja.FieldByName('DCDD').Value       := DM1.cdsEgrCaja.fieldbyName('ECDD').AsString;
	 DM1.cdsCntCaja.FieldByName('DCSS').Value       := DM1.cdsEgrCaja.fieldbyName('ECSS').AsString;
	 DM1.cdsCntCaja.FieldByName('DCSEM').Value      := DM1.cdsEgrCaja.fieldbyName('ECSEM').AsString;
	 DM1.cdsCntCaja.FieldByName('DCTRI').Value      := DM1.cdsEgrCaja.fieldbyName('ECTRI').AsString;
	 DM1.cdsCntCaja.FieldByName('DCAASS').Value     := DM1.cdsEgrCaja.fieldbyName('ECAASS').AsString;
	 DM1.cdsCntCaja.FieldByName('DCAASEM').Value    := DM1.cdsEgrCaja.fieldbyName('ECAASEM').AsString;
	 DM1.cdsCntCaja.FieldByName('DCAATRI').Value    := DM1.cdsEgrCaja.fieldbyName('ECAATRI').AsString;
	 DM1.cdsCntCaja.FieldByName('DCGLOSA').AsString := DM1.cdsEgrCaja.fieldbyName('ECGLOSA').AsString;
	 DM1.cdsCntCaja.FieldByName('DCTCAMPA').AsString:= dbeTCambio.Text;
	 DM1.cdsCntCaja.FieldByName('DCTCAMPR').AsString:= dbeTCambio.Text;
	 DM1.cdsCntCaja.FieldByName('FCAB').AsString    := '1';
	 DM1.cdsCntCaja.FieldByName('DOCMOD').AsString  := Fprincipal.xModulo;
	 DM1.cdsCntCaja.FieldByName('DCUSER').Value     :=  DM1.wUsuario;
	 DM1.cdsCntCaja.FieldByName('DCFREG').Value     :=  Date;
	 DM1.cdsCntCaja.FieldByName('DCHREG').Value     :=  Time;
	 xNReg:=xNReg+1;
	 DM1.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
	 cdspost( DM1.cdsCntCaja );
end;

procedure TFCobConsolidado.Contab_RegCxP;
begin
	 DM1.cdsCntCaja.FieldByName('CIAID').AsString  := DM1.cdsRegCxC.FieldByName('CIAID').AsString;
	 DM1.cdsCntCaja.FieldByName('TDIARID').Value   := DM1.cdsIngDocs.FieldByName('TDIARID').Value;
	 DM1.cdsCntCaja.FieldByName('ECANOMM').Value   := DM1.cdsIngDocs.fieldbyName('ECANOMM').Value;
	 DM1.cdsCntCaja.FieldByName('ECNOCOMP').Value  := DM1.cdsRegCxC.FieldByName('ECNOCOMP').AsString;
	 DM1.cdsCntCaja.FieldByName('DCLOTE').Value    := DM1.cdsIngDocs.FieldByName('CCLOTE').Value;
	 DM1.cdsCntCaja.FieldByName('DOCID').Value     := DM1.cdsRegCxC.FieldByName('DOCID2').Value;
	 DM1.cdsCntCaja.FieldByName('DCSERIE').Value   := DM1.cdsRegCxC.FieldByName('CPSERIE').Value;
	 DM1.cdsCntCaja.FieldByName('DCNODOC').Value   := DM1.cdsRegCxC.FieldByName('CPNODOC').Value;
	 DM1.cdsCntCaja.FieldByName('ECFCOMP').Value   := DM1.cdsRegCxC.FieldByName('DEFCOMP').Value;
	 DM1.cdsCntCaja.FieldByName('DCFEMIS').Value   := DM1.cdsRegCxC.FieldByName('CPFEMIS').Value;
	 DM1.cdsCntCaja.FieldByName('DCFVCMTO').Value  := DM1.cdsRegCxC.FieldByName('CPFVCMTO').Value;
	 DM1.cdsCntCaja.FieldByName('CPTOID').Value    := DM1.cdsRegCxC.FieldByName('CPTOID').Value;
	 DM1.cdsCntCaja.FieldByName('CUENTAID').Value  := DM1.cdsRegCxC.FieldByName('CUENTAID').Value;
	 DM1.cdsCntCaja.FieldByName('CLAUXID').Value   := DM1.cdsIngDocs.fieldbyName('CLAUXID').Value; //Aqui se toma de la cabecera
	 DM1.cdsCntCaja.FieldByName('DCAUXID').Value   := DM1.cdsIngDocs.fieldbyName('CLIEID').Value;    //Aqui se toma de la cabecera
	 DM1.cdsCntCaja.FieldByName('CCOSID').Value    := DM1.cdsRegCxC.FieldByName('CCOSID').Value;
	 DM1.cdsCntCaja.FieldByName('DCDH').Value      := DM1.cdsRegCxC.FieldByName('DEDH').Value;
	 DM1.cdsCntCaja.FieldByName('DCTCAMPA').Value  := DM1.cdsRegCxC.FieldByName('DETCPAG').Value;
	 DM1.cdsCntCaja.FieldByName('DCTCAMPR').Value  := DM1.cdsRegCxC.FieldByName('DETCDOC').Value;
	 DM1.cdsCntCaja.FieldByName('TMONID').Value    := DM1.cdsRegCxC.FieldByName('TMONID').Value;
	 DM1.cdsCntCaja.FieldByName('DCMTOORI').Value  := DM1.cdsRegCxC.FieldByName('DEMTOORI').Value;
	 DM1.cdsCntCaja.FieldByName('DCMTOLO').Value   := DM1.cdsRegCxC.FieldByName('DEMTOLOC').Value;
	 DM1.cdsCntCaja.FieldByName('DCMTOEXT').Value  := DM1.cdsRegCxC.FieldByName('DEMTOEXT').Value;
	 DM1.cdsCntCaja.FieldByName('DCFLACDR').Value  := 'S';   //Registro ya cuadrado
	 DM1.cdsCntCaja.FieldByName('DCANO').Value     := DM1.cdsIngDocs.fieldbyName('NCOANO').AsString;
	 DM1.cdsCntCaja.FieldByName('DCMM').Value      := DM1.cdsIngDocs.fieldbyName('NCOMM').AsString;
	 DM1.cdsCntCaja.FieldByName('DCDD').Value      := DM1.cdsIngDocs.fieldbyName('NCODD').AsString;
	 DM1.cdsCntCaja.FieldByName('DCSS').Value      := DM1.cdsIngDocs.fieldbyName('NCOSS').AsString;
	 DM1.cdsCntCaja.FieldByName('DCSEM').Value     := DM1.cdsIngDocs.fieldbyName('NCOSEM').AsString;
	 DM1.cdsCntCaja.FieldByName('DCTRI').Value     := DM1.cdsIngDocs.fieldbyName('NCOTRI').AsString;
	 DM1.cdsCntCaja.FieldByName('DCAASS').Value    := DM1.cdsIngDocs.fieldbyName('NCOAASS').AsString;
	 DM1.cdsCntCaja.FieldByName('DCAASEM').Value   := DM1.cdsIngDocs.fieldbyName('NCOAASEM').AsString;
	 DM1.cdsCntCaja.FieldByName('DCAATRI').Value   := DM1.cdsIngDocs.FieldByName('NCOAATRI').AsString;
//	 DM1.cdsCntCaja.FieldByName('DCGLOSA').AsString:= DM1.cdsRegCxC.fieldBYName('ECGLOSA').AsString;
	 DM1.cdsCntCaja.FieldByName('DCGLOSA').AsString:= DM1.cdsRegCxC.fieldBYName('DEGLOSA').AsString;
	 DM1.cdsCntCaja.FieldByName('DOCMOD').AsString := Fprincipal.xModulo;
	 DM1.cdsCntCaja.FieldByName('DCUSER').Value    := DM1.wUsuario;
	 DM1.cdsCntCaja.FieldByName('DCFREG').Value    := DateS;
	 DM1.cdsCntCaja.FieldByName('DCHREG').Value    := Time;
	 xNReg:=xNReg+1;
	 DM1.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
   cdspost( DM1.cdsCntCaja );

end;


procedure TFCobConsolidado.Adiciona;
var
	 xSQL : String ;
begin
	 IniciaDatos;
	 xGraboNuevo := False;
	 //
	 if dblcCia.LookupTable.RecordCount > 1 then
			dblcCia.Enabled := True;
	 dblcTDoc.Enabled := True;
	 dbeSerie.Enabled := True;
	 dblcdLICO.Enabled := True;
	 //dbeNoDoc.Enabled := True;
	 dblcBanco.enabled:= True;
	 dbdtpFEmision.Enabled:=True;
	 edNumReg.Enabled:=True;
	 //
	 pnlCabecera1.Enabled := True;
	 pnlDetPago.Enabled   := False;
	 pnlBotones.Enabled   := False;

	 ActivaBotones(pnlCabecera1 , True );
	 ActivaBotones( pnlBotones , False );
	 HabilitaControles;
	 z2bbtnNuevo.Visible := True;
	 dblcTMonCab.Enabled := True;

	 DM1.cdsIngDocs.Insert;

	 // vhn 23/01/2001
	 xSQL:='Select * from CAJA301 '
				+'Where CIAID='''' and CCTREC='''' and DOCID2='''' and '
				+      'CPSERIE='''' and CPNODOC='''' ';
	 DM1.cdsRegCxC.Close;
	 DM1.cdsRegCxC.DataRequest( xSQL );
	 DM1.cdsRegCxC.Open;

	 // vhn 22/01/2001
	 xSQL:='Select * from CAJA314 '
				+'Where CIAID='''' and CCTREC='''' and '
				+      'DOCID='''' and CCSERIE='''' and '
				+      'CCNODOC='''' ';
	 DM1.cdsDetFPago.Close;
	 DM1.cdsDetFPago.DataRequest( xSQL );
	 DM1.cdsDetFPago.Open;

	 xSQL:='Select * from CAJA314 '
				+'Where CIAID='''' and CCTREC='''' and '
				+      'DOCID='''' and CCSERIE='''' and '
				+      'CCNODOC='''' ';
	 DM1.cdsCanjeCxC.Close;
	 DM1.cdsCanjeCxC.DataRequest( xSQL );
	 DM1.cdsCanjeCxC.Open;

	 lblEstadoMov.Caption := 'Nuevo';
	 DM1.RecuperaCierre( wFechacierre , wFrecu );

	 if wFechaCierre = 0 then
	 begin
			dbdtpFEmision.date := dateS;
	 end
	 else
	 begin
			if (tDate(date) > wFechaCierre) and (tdate(date)<=wFechaCierre+wFrecu) then
				 dbdtpFEmision.date := dateS
			else
				 dbdtpFEmision.date := wFechaCierre+1;
   end;

	 If DM1.cdsBanco.RecordCount = 1 then
			begin
			dblcBanco.enabled:=False;
			dblcBanco.text   :=DM1.cdsBanco.FieldByName('BANCOID').AsString;
			edtBanco.text    :=DM1.cdsBanco.FieldByName('BANCONOM').AsString;
	 end;

	 wModifica :=False;
end;

procedure TFCobConsolidado.Edita(Doc : structDocIng;cds : Twwclientdataset);
var
	 xSQL : String ;
begin
	 IniciaDatos;
	 cdsfiltro :=  cds;
	 Z2bbtnNuevo.Visible  := False;

	 DM1.cdsIngDocs.Edit;

	 // vhn 23/01/2001
	 xSQL:='Select * from CAJA301 '
				+'Where CIAID='''  +Doc.CIAID  +''' and '
				+      'CCTREC=''' +Doc.CCTREC +''' and '
				+      'DOCID2=''' +Doc.DOCID  +''' and '
				+      'CPSERIE='''+Doc.CCSERIE+''' and '
				+      'CPNODOC='''+Doc.CCNODOC+''' ';
	 DM1.cdsRegCxC.Close;
	 DM1.cdsRegCxC.DataRequest( xSQL );
	 DM1.cdsRegCxC.Open;

	 // vhn 23/01/2001
	 xSQL:='Select * from CAJA314 '
				+'Where CIAID='''   +Doc.CIAID    +''' and '
				+      'CCTREC='''  +Doc.CCTREC   +''' and '
				+      'DOCID='''   +Doc.DOCID    +''' and '
				+      'CCSERIE=''' +Doc.CCSERIE  +''' and '
				+      'CCNODOC=''' +Doc.CCNODOC  +''' and '
				+      'FPAGOID<>'''+DM1.wDeposito+''' AND FC_ESTADO<>''A'' ';
	 DM1.cdsDetFPago.Close;
	 DM1.cdsDetFPago.DataRequest( xSQL );
	 DM1.cdsDetFPago.Open;

	 // vhn 23/01/2001
	 xSQL:='Select * from CAJA314 '
				+'Where CIAID='''   +Doc.CIAID    +''' and '
				+      'CCTREC='''  +Doc.CCTREC   +''' and '
				+      'DOCID='''   +Doc.DOCID    +''' and '
				+      'CCSERIE=''' +Doc.CCSERIE  +''' and '
				+      'CCNODOC=''' +Doc.CCNODOC  +''' and '
				+      'FPAGOID=''' +DM1.wDeposito+''' AND FC_ESTADO<>''A'' ';
	 DM1.cdsCanjeCxC.Close;
	 DM1.cdsCanjeCxC.DataRequest( xSQL );
	 DM1.cdsCanjeCxC.Open;


	 dblcCia.Text       :=  DM1.cdsIngDocs.FieldbyName('CIAID').AsString;
	 dblcTDoc.Text      :=  DM1.cdsIngDocs.FieldbyName('DOCID').AsString;
	 dbeSerie.Text      :=  DM1.cdsIngDocs.FieldbyName('CCSERIE').AsString;
	 dblcdLICO.Text     :=  DM1.cdsIngDocs.FieldbyName('CCNODOC').AsString;
	 //dbeNoDoc.Text      :=  DM1.cdsIngDocs.FieldbyName('CCNODOC').AsString;
	 dbdtpFEmision.Date :=  DM1.cdsIngDocs.FieldbyName('CCFEMIS').AsDateTime;
	 dblcBanco.Text     :=  DM1.cdsIngDocs.FieldbyName('BANCOID').AsString;
	 edtCuenta.Text     :=  DM1.cdsIngDocs.FieldbyName('CUENTAID').AsString;
	 dblcTMonCab.Text   :=  DM1.cdsIngDocs.FieldbyName('TMONID').AsString;
	 dbeTCambio.Text    :=  Cajadec( DM1.cdsIngDocs.FieldbyName('NCOTCAMB').AsString );
	 dblcClase.Text     :=  DM1.cdsIngDocs.FieldbyName('CLAUXID').AsString;
	 dblcdAux.Text      :=  DM1.cdsIngDocs.FieldbyName('CLIEID').AsString;
	 edtAuxRUC.Text     :=  DM1.cdsIngDocs.FieldbyName('CLIERUC').AsString;
	 dbeGiradoA.Text    :=  DM1.cdsIngDocs.FieldbyName('CCNOMB').AsString;
	 dblcdCnp.Text      :=  DM1.cdsIngDocs.FieldbyName('CPTOID').AsString;
	 dbeGlosa.Text      :=  DM1.cdsIngDocs.FieldbyName('CCGLOSA').AsString;
	 dblcdFEfec.Text    :=  DM1.cdsIngDocs.FieldByName('FLUEID').AsString;
	 dblcdLICO.Text     :=  DM1.cdsIngDocs.fieldbyName('LICOID').AsString;

	 RecuperaDescrip;

	 if (DM1.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'I') or
			(DM1.cdsIngDocs.FieldByName('NCOESTADO').AsString = '')then
	 begin
			pnlCabecera1.Enabled        := True;
			pnlDetPago.Enabled          := False;
			pnlBotones.Enabled          := False;
			ActivaBotones( pnlBotones , False );
			ActivaBotones(pnlCabecera1 , True );
			lblEstadoMov.Caption := 'Activo';
	 end;

	 if (DM1.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'A') or
			(DM1.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'C') then
	 begin
			pnlCabecera1.Enabled := False;
			pnlDetPago.Enabled   := True ;
			pnlBotones.Enabled   := True ;
			ActivaBotones( pnlCabecera1 , False );
			ActivaBotones( pnlBotones , False );
			if DM1.cdsIngDocs.FieldByName('NCOESTADO').AsString = 'C' then
			begin
				 lblEstadoMov.Caption  := 'Cancelado';
				 Z2bbtnCont.Enabled    := True;
				 Z2bbtnEmite.Enabled   := True ;
				 Z2bbtnImprime.Enabled := True;
				 Z2bbtnCancel2.Enabled := True;
			end
			else
				 lblEstadoMov.Caption := 'Anulado';
	 end;

	 if DM1.cdsIngDocs.fieldByName('CCCONTA').AsString='S' then begin
			lblEstadoMov.Caption:='Cancelado y Contab.';
			Z2bbtnCont.Enabled    := False;
	 end;

	 xDescrip := 'CIAID='+quotedstr(dblcCia.Text);
	 edtCia.text := DM1.DisplayDescrip('prvTGE','TGE101','CIAABR',xDescrip,'CIAABR');

	 edNumReg.text :=  DM1.cdsRegCxC.FieldByName('DENUMREG').AsString;

end;


procedure TFCobConsolidado.FormCreate(Sender: TObject);
begin
	 RecuperarCiaUnica(dblcCia,edtCia);
	 SetLength(A4digitos,1);
	 A4digitos[0] := dbeTCambio;
	 DM1.cdsRegCxC.BeforePost   := cdsRegCxCBeforePost;
	 DM1.cdsDetFPago.BeforePost := cdsRegCxCBeforePost;

	 cf1 := TControlFoco.Create;
   DM1.cdsFEfec.Filter := 'FLUEFE_IS = ''I'' ';
   DM1.cdsFEfec.Filtered := True;
   cdsTarjeta := TwwClientDataset.Create(self);
   cdsTarjeta.Name := 'cdsTarjeta';
   cdsTarjeta.RemoteServer := DM1.DCOM1;
   cdsTarjeta.providerName := DM1.cdsQry2.ProviderName;
   cdsTarjeta.DataRequest('SELECT * FROM TGE167 ORDER BY TJAID');
   cdsTarjeta.Active := True;

   cdsBanco := TwwClientDataset.Create(self);
   cdsBanco.Name := 'cdsBanco';
   cdsBanco.RemoteServer := DM1.DCOM1;
   cdsBanco.providerName := DM1.cdsQry2.ProviderName;
   cdsBanco.DataRequest('SELECT * FROM TGE105 WHERE BCOTIPCTA<>''C'' ORDER BY BANCOID ');
   cdsBanco.Active := True;

end;


procedure TFCobConsolidado.ActivaBotones(pnl: TPanel;xFlag : Boolean);
var
 i : Integer;
begin
   for i := 0 to pnl.ControlCount-1 do
   begin
     if pnl.controls[i] is tbitbtn then
        TBitBtn(pnl.controls[i]).enabled := xFlag;
   end;
end;

procedure TFCobConsolidado.FocoInicial;
begin
     if pnlCabecera1.Enabled then
        pnlCabecera1.SetFocus
          else if pnlDetPago.Enabled then
                  pnlDeTpago.setfocus
               else if pnlBotones.enabled then
                       pnlBotones.SetFocus
                    else
                       self.SetFocus;
     perform(CM_DialogKey,VK_TAB,0);

end;

procedure TFCobConsolidado.GrabaMontoTotal;
begin
  DM1.cdsIngDocs.Edit;
  DM1.cdsIngDocs.fieldbyName('NCOMTOLOC').AsFloat := OperClientDataSet(DM1.cdsDetFPago,'SUM(FC_MTOLOC)','TMONID='+QuotedStr(DM1.wTMonLoc));
  DM1.cdsIngDocs.fieldbyName('NCOMTOEXT').AsFloat := OperClientDataSet(DM1.cdsDetFPago,'SUM(FC_MTOEXT)','TMONID='+QuotedStr(DM1.wTMonExt));

{  if dblcTMonCab.Text = DM1.wTMonLoc then
     DM1.cdsIngDocs.fieldbyName('NCOMTOORI').AsFloat := DM1.cdsIngDocs.fieldbyName('NCOMTOLOC').AsFloat
  else
     DM1.cdsIngDocs.fieldbyName('NCOMTOORI').AsFloat := DM1.cdsIngDocs.fieldbyName('NCOMTOEXT').AsFloat;}

  DM1.cdsIngDocs.fieldbyName('ECCOBLOC').AsFloat := DM1.cdsIngDocs.fieldbyName('NCOMTOLOC').AsFloat;
  DM1.cdsIngDocs.fieldbyName('ECCOBEXT').AsFloat := DM1.cdsIngDocs.fieldbyName('NCOMTOEXT').AsFloat;

end;


procedure TFCobConsolidado.dbeTCambioChange2(Sender: TObject);
begin
  if not TCustomEdit(Sender).Focused then
     Exit;
  wModifica := True;
end;

procedure TFCobConsolidado.dbeTCambioEnter2(Sender: TObject);
begin
		strTmp := TCustomEdit(Sender).Text;
end;

procedure TFCobConsolidado.dbeTCambioExit2(Sender: TObject);
	procedure Mensaje;
	var
		 Tmp : string;
	begin
		 TCustomEdit(Sender).SetFocus;
		 Tmp := Strtmp;
		 ShowMessage('Ingrese Tipo de Cambio');
		 strTmp := Tmp;
		 Exit;
	end;
begin
	 if trim(dbeTCambio.Text) = '' then
			Mensaje
	 else
			if strtocurr(dbeTCambio.Text) = 0 then
				 Mensaje
			else if strTmp <> dbetcambio.Text then
				 begin
						dbeTCambio.Text := CajaDec( dbeTCambio.Text ,4 );
				 end;
end;

procedure TFCobConsolidado.dblcBancoExit22(Sender: TObject);
begin
	if dblcCia.Focused         then Exit;
	if Z2bbtnCancelCab.Focused then Exit;
	wModifica:=True;
	xDescrip := 'BANCOID='+quotedstr(dblcBanco.text);
	edtBanco.text := DM1.DisplayDescrip('prvTGE','TGE105','BANCONOM,CUENTAID,CPTOID',xDescrip,'BANCONOM');
	if edtBanco.text = '' then
	begin
      Showmessage('Falta registrar la Caja');
      dblcBanco.SetFocus;
      exit;
	end;
   edtCuenta.Text:=DM1.cdsQry.FieldByName('CUENTAID').AsString;
   dblcdCnp.Text :=DM1.cdsQry.FieldByName('CPTOID').AsString;
end;

procedure TFCobConsolidado.dblcClaseExit22(Sender: TObject);
var
	 xSQLx : String;
begin
		xDescrip := 'CLAUXID='+quotedstr(dblcClase.text);
		edtClase.text := DM1.DisplayDescrip('prvTGE','TGE102','CLAUXDES',xDescrip,'CLAUXDES');

    dblcdAux.Enabled := True;
    wModifica := TRUE;
    DM1.xxExit(dblcClase,edtClase,[],'Clase del Auxiliar','A');
    if trim(edtclase.Text) = '' then
       Exit;

    if (dblcClase.Text <> strTmp) then
    begin
       dblcdAux.Text := '';
       edtAuxRUC.Text := '';
       dbeGiradoA.Text := '';
    end;

		xSQLx:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+'''';
    DM1.cdsAux.Close;
    DM1.cdsAux.DataRequest( xSQLx ) ;
    DM1.cdsAux.Open;
end;

procedure TFCobConsolidado.dblcdAuxExit2(Sender: TObject);
begin
  xDescrip := 'AUXID='+quotedstr(dblcdAux.text);
  DM1.Filtracds(DM1.cdsQry,'SELECT AUXID, AUXRUC, AUXGIRA, AUXNOMB FROM CNT201 WHERE '+xDescrip);

  If Trim(DM1.cdsQry.fieldbyName('AUXID').asString) = '' then
  begin
    showmessage('No se encuentra registrado el Auxiliar');
    dblcdAux.Text := '';
    dblcdAux.setfocus;
  end
  else
  begin
    edtAuxRuc.text := DM1.cdsQry.fieldbyName('AUXRUC').asString;
    If Trim(DM1.cdsQry.fieldbyName('AUXGIRA').asString) = ''
    then     dbeGiradoA.text := DM1.cdsQry.fieldbyName('AUXNOMB').asString
    else     dbeGiradoA.text := DM1.cdsQry.fieldbyName('AUXGIRA').asString;
    wModifica := True;
  end;
end;

procedure TFCobConsolidado.dblcdCnpExit2(Sender: TObject);
var sTemp: string;
begin
	xDescrip := 'CPTOID='+quotedstr(dblcdCnp.text);
  sTemp := DM1.DisplayDescrip('prvTGE','CAJA201','CPTODES',xDescrip,'CPTODES');
  if sTemp = '' then
  begin
    showmessage('No se encuentra registrado el concepto');
    dblcdCnp.Text := '';
    dblcdCnp.setfocus;
  end
  else
  begin
    dbeGlosa.text := sTemp;
    wModifica:=True;
  end;
end;

procedure TFCobConsolidado.dblcTDocExit2(Sender: TObject);
begin
	 if dbdtpFEmision.Focused   then Exit;
	 if Z2bbtnCancelCab.Focused then Exit;

	 xDescrip := 'DOCID='+quotedstr(dblcTDoc.text);
   edtTDoc.text := DM1.DisplayDescrip('prvTGE','TGE110','DOCDES',xDescrip,'DOCDES');
   if dblcTDoc.Text <> '' Then  BuscaNRecibo
   else
   if dblcTDoc.enabled Then dblcTDoc.SetFocus;

   wModifica := True;
end;

procedure TFCobConsolidado.dblcTMonCabExit2(Sender: TObject);
begin
  wModifica:=True;
  xDescrip := 'TMONID='+quotedstr(dblcTMonCab.text);
	edtTMonCab.text := DM1.DisplayDescrip('prvTGE','TGE103','TMONABR',xDescrip,'TMONABR');
  DM1.xxExit(dblcTMonCab , edtTMonCab , [ Z2bbtnCancelCab ] ,'Moneda')
end;

procedure TFCobConsolidado.dbeGiradoAChange(Sender: TObject);
begin
  if Not TCustomEdit(Sender).Focused then
      Exit;
   wModifica := tRUE;
end;

procedure TFCobConsolidado.ValidaCab;
var
   xWhere : String;
begin
    ValidaEdit(dblcCia ,'Ingrese Compañía');
    ValidaEdit(dblcTDoc ,'Ingrese Tipo de Documento');
    ValidaEdit(dblcTDoc ,'Ingrese Tipo de Documento');
		ValidaEdit(dblcdLICO ,'Ingrese Número de Documento');
		//ValidaEdit(dbeNODoc ,'Ingrese Número de Documento');
		ValidaEdit(dbdtpFEmision ,'Ingrese Fecha de Emisión');
		ValidaEdit(dblcBanco ,'Ingrese Caja ó Banco');
    ValidaEdit(dblcTMonCab ,'Ingrese Moneda');
    ValidaEdit(dbeTCambio ,'Ingrese Tipo de Cambio');
    if strtocurr(dbeTCambio.Text) = 0 then
    begin
       dbeTCambio.SetFocus;
       Raise exception.create('Ingrese Tipo de Cambio');
    end;
    ValidaEdit(dblcClase ,'Ingrese Clase');
		ValidaEdit(dblcdAux ,'Ingrese Auxiliar');
    ValidaEdit(dbeGiradoA ,'Ingrese Nombre del Cliente');
    ValidaEdit(dblcdCnp ,'Ingrese Concepto');
    ValidaEdit(dbeGlosa ,'Ingrese Glosa');
    //Valida Numero de Documento En caso de Nuevo Documento
    if (DM1.wModo='A') and (xInsercion = '') then
    begin
       //Búsqueda en CXC303
       xWhere:='CIAID=''' + dblcCia.Text + ''' AND DOCID='''+ dblcTDoc.Text + ''' AND '
              +DM1.wReplacCeros+'(CCSERIE,'''') = '''+ dbeSerie.Text + ''' AND '
              +'CCNODOC = '''+ dblcdLICO.Text + ''' ';
//              +'CCNODOC = '''+ dbeNoDoc.Text + ''' ';
			 if DM1.DisplayDescrip('prvTGE','CXC303','COUNT(*) TOTREG',xWhere+' AND NCOESTADO<>''A'' ','TOTREG') > '0' then
          Raise Exception.create ('El Número de Documento ya Ha sido Ingresado');
       //Búsqueda en CxC301
       if DM1.DisplayDescrip('prvTGE','CXC301','COUNT(*) TOTREG',xWhere,'TOTREG')>'0' then
          Raise Exception.create ('El Número de Documento ya Ha sido Ingresado');
    end;
end;

procedure TFCobConsolidado.RecuperaDescrip;
begin
    Dm1.DescripIngDocs(dblcCia.text,
                       DM1.cdsIngDocs.FieldByName('CCTREC').AsString ,
                       DM1.cdsIngDocs.FieldByName('DOCID').AsString ,
                       DM1.cdsIngDocs.FieldByName('CCSERIE').AsString ,
                       DM1.cdsIngDocs.FieldByName('CCNODOC').AsString
                      );

    Dm1.cdsDescrip.Active := False;
		Dm1.cdsDescrip.Active := True;
    with DM1.cdsDescrip do
    begin
       edtCia.Text     := FieldbyName('CIAABR').AsString;
       edtTDoc.Text    := FieldbyName('DOCABR').AsString;
       edtBanco.Text   := FieldbyName('BANCOABR').AsString;
       edtTMonCab.Text := FieldbyName('TMONABR').AsString;
       edtClase.Text   := FieldbyName('CLAUXABR').AsString;
       if not DM1.cdsDescrip.FieldByName('FLUEFEABR').isnull then
          dbeFEfec.text := DM1.cdsDescrip.FieldByName('FLUEFEABR').AsString;
    end;

end;

procedure TFCobConsolidado.InHabilitaControles;
begin
   dblcCia.Enabled    := False;
   dblcTDoc.Enabled   := False;
   dbeSerie.Enabled   := False;
   dblcdLICO.Enabled   := False;
	 //dbeNoDoc.Enabled   := False;
end;

procedure TFCobConsolidado.HabilitaControles;
begin
   dblcTDoc.Enabled   := True;
   dbeSerie.Enabled   := True;
   dblcdLICO.Enabled   := True;
	 //dbeNoDoc.Enabled   := True;
end;

procedure TFCobConsolidado.AsignaClaveDetalle;
var
   BMK : TBookmark;
begin
   BMK := DM1.cdsRegCxC.GetBookmark;
   DM1.cdsRegCxC.DisableControls;
   DM1.cdsRegCxC.First;
   while not DM1.cdsRegCxC.eof do
   begin
      DM1.cdsRegCxC.Edit;
      DM1.cdsRegCxC.fieldBYName('CIAID').AsString    := dblccia.Text;
      DM1.cdsRegCxC.fieldBYName('CCTREC').AsString   := 'CO';
      DM1.cdsRegCxC.fieldBYName('DOCID2').AsString    := dblcTDoc.Text;
      DM1.cdsRegCxC.fieldBYName('CPSERIE').AsString  := trim(dbeSerie.Text);
      DM1.cdsRegCxC.fieldBYName('CPNODOC').AsString  := trim(dblcdLICO.Text);
			//DM1.cdsRegCxC.fieldBYName('CPNODOC').AsString  := trim(dbeNoDoc.Text);
			DM1.cdsRegCxC.Next;
   end;
   DM1.cdsRegCxC.GotoBookmark(BMK);
   DM1.cdsRegCxC.FreeBookmark(BMK);
   DM1.cdsRegCxC.EnableControls;
end;

procedure TFCobConsolidado.dbeSerieChange(Sender: TObject);
begin
   if not TCustomEdit(Sender).Focused then
      Exit;
   wModifica := True;
end;

procedure TFCobConsolidado.dbdtpFEmisionChange(Sender: TObject);
begin
  if not TCustomEdit(Sender).Focused then
     Exit;
  wModifica := True;
end;

procedure TFCobConsolidado.dbeGlosaChange(Sender: TObject);
begin
  if not TCustomEdit(Sender).Focused then
     Exit;
  wModifica := True;
end;

procedure TFCobConsolidado.AsignaParametros;
var
   xSQL : String ;
begin
   // vhn 23/01/2001
   xSQL:='Select * from CAJA301 '
        +'Where CIAID='''  +dblcCia.Text+''' and CCTREC=''CO'' and '
        +      'DOCID2=''' +Trim( dblcTDoc.Text )+''' and '
        +      'CPSERIE='''+Trim( dbeSerie.Text )+''' and '
				+      'CPNODOC='''+Trim( dblcdLICO.Text )+''' ';
//				+      'CPNODOC='''+Trim( dbeNoDoc.Text )+''' ';
	 DM1.cdsRegCxC.DisableControls;
   DM1.cdsRegCxC.Close;
   DM1.cdsRegCxC.DataRequest( xSQL );
   DM1.cdsRegCxC.Open;
   DM1.cdsRegCxC.EnableControls;
end;

procedure TFCobConsolidado.FormDestroy(Sender: TObject);
begin
   DM1.cdsRegCxC.BeforePost := nil;
   DM1.cdsDetFPago.BeforePost := nil;
   cf1.Free;
   //** 13/01/2001 - pjsv
   //DM1.cdsBancoEgr.Filter := '';
   //DM1.cdsBancoEgr.Filtered := True;
   //**
end;

procedure TFCobConsolidado.cdsRegCxCBeforePost(DataSet: TDataSet);
begin
    wModifica := True;
    if not Z2bbtnGraba.Enabled then
    begin
      Z2bbtnGraba.Enabled     := True;
      Z2bbtnCancelado.Enabled := False;
      Z2bbtnAnula.Enabled     := False;
    end;
end;

procedure TFCobConsolidado.Z2bbtnCancel2Click(Sender: TObject);
VAR
   Doc : structDocIng;
begin
   //Cancela las Actualizaciones Realizadas

   DM1.cdsIngDocs.CancelUpdates;
   DM1.cdsRegCxC.CancelUpdates;
   if DM1.wModo<>'A' then
    begin
      with Doc do
      begin
         CIAID    := dblcCia.Text;
         CCTREC   := 'CO';
         DOCID    := dblcTDoc.Text;
         CCSERIE  := trim( dbeSerie.Text );
         CCNODOC  := trim( dblcdLICO.Text );
				 //CCNODOC  := trim( dbeNoDoc.Text );
			 end;
      Edita(doc,cdsfiltro);
   end
   else
      Adiciona;
  if DM1.cdsIngDocs.FieldByName('NCOESTADO').AsString <> 'C' then
     pnlCabecera1.SetFocus;
  perform(CM_DialogKey,VK_TAB,0);
end;

procedure TFCobConsolidado.dbdtpFEmisionExit(Sender: TObject);
var
   xStr : String;
begin
   if dblcCia.Focused         then exit;
   if dblcBanco.Focused       then exit;
   if Z2bbtnCancelCab.Focused then exit;

   if edtBanco.Text = '' then
   begin
      dblcBanco.SetFocus;
      exit;
   end;

   if dbdtpFEmision.Date = 0 then
   begin
      TCustomEdit(Sender).SetFocus;
      raise Exception.create('Ingrese Fecha');
   end;

   if DM1.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, '', dbdtpFEmision.Date ) then begin
      Showmessage('No se permite la Operación en esta Fecha porque mes de Fecha ya fue Cerrado!');
      dbdtpFEmision.SetFocus;
      exit;
   end;

   if not DiaAperturado(dblcCia.text,dbdtpFEmision.Date,dblcBanco.text) then exit;

   if wFechaCierre <> 0 then
      if (TwwDBDateTimePicker(Sender).date <= wFechaCierre )
          or (TwwDBDateTimePicker(Sender).date > (wFechaCierre + wFrecu) ) then
      begin
          TwwDBDateTimePicker(Sender).SetFocus;
          Showmessage('Ingrese Fecha dentro del Rango'+#13+
                      'Fecha de Cierre  : ' + datetimetostr(wfechacierre) + #13+
                      'Frecuencia       : ' + inttostr(wFrecu));
          Exit;
      end;

   if (trim(dbeTCambio.Text) = '') or (dbeTCambio.Text='0.00') then
   begin
      xSTR:='FECHA=' +DM1.wRepFuncDate+''''+ formatdatetime(DM1.wFormatFecha,dbdtpFEmision.date)+''') '
           +' AND TMONID='''+DM1.wTMonExt+'''';
      if DM1.RecuperarDatos('TGE107',DM1.wTipoCambioUsar,xSTR) then
         dbeTCambio.Text :=  DM1.cdsRec.FieldByName(DM1.wTipoCambioUsar).AsString
      else
      begin
         dbeTCambio.Text := '0.00';
         TCustomEdit(Sender).SetFocus;
         raise Exception.Create('Fecha no tiene tipo de Cambio');
      end;
   end;
end;

procedure TFCobConsolidado.ActualizaDetalle;
var
   BMK            : TBookmark;
begin
   Showmessage('Actualizando detalle');
   BMK := DM1.cdsRegCxC.GetBookmark;
   DM1.cdsRegCxC.DisableControls;
   DM1.cdsRegCxC.First;
   while not DM1.cdsRegCxC.eof do
   begin
      DM1.cdsRegCxC.Edit;

      //DM1.cdsRegCxC.fieldBYName('TMONID').AsString    := dblcTMonCab.Text;
      DM1.cdsRegCxC.fieldBYName('DETCDOC').AsString   := dbeTCambio.Text;
      {if dblcTMonCab.Text = DM1.wTMonLoc then
      begin
         DM1.cdsRegCxC.FieldByName('DEMTOLOC').AsString := Cajadec(CurrtoStr(DM1.cdsRegCxC.FieldByName('DEMTOORI').AsFloat));
         DM1.cdsRegCxC.FieldByName('DEMTOEXT').AsString := Cajadec(Currtostr(DM1.cdsRegCxC.FieldByName('DEMTOORI').AsFloat / strtocurr( dbeTCambio.text )));
      end
      else
      begin
         DM1.cdsRegCxC.FieldByName('DEMTOLOC').AsString := Cajadec(CurrtoStr(DM1.cdsRegCxC.FieldByName('DEMTOORI').AsFloat * strtocurr( dbeTCambio.text )));
         DM1.cdsRegCxC.FieldByName('DEMTOEXT').AsString := Cajadec(CurrtoStr(DM1.cdsRegCxC.FieldByName('DEMTOORI').AsFloat ));
      end;}
      DM1.cdsRegCxC.Next;
   end;
   DM1.cdsRegCxC.GotoBookmark(BMK);
   DM1.cdsRegCxC.FreeBookmark(BMK);
   DM1.cdsRegCxC.EnableControls;

   BMK := DM1.cdsDetFPago.GetBookmark;
   DM1.cdsDetFPago.DisableControls;
   DM1.cdsDetFPago.First;
   while not DM1.cdsDetFPago.eof do
   begin
      DM1.cdsDetFPago.Edit;

//      DM1.cdsDetFPago.fieldBYName('TMONID').AsString    := dblcTMonCab.Text;
      DM1.cdsDetFPago.fieldBYName('TC_USADO').AsString   := dbeTCambio.Text;
{      if dblcTMonCab.Text = DM1.wTMonLoc then
      begin
         DM1.cdsDetFPago.FieldByName('FC_MTOLOC').AsString := Cajadec(CurrtoStr(DM1.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat));
         DM1.cdsDetFPago.FieldByName('FC_MTOEXT').AsString := Cajadec(Currtostr(DM1.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat / strtocurr( dbeTCambio.text )));
      end
      else
      begin
         DM1.cdsDetFPago.FieldByName('FC_MTOLOC').AsString := Cajadec(CurrtoStr(DM1.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat * strtocurr( dbeTCambio.text )));
         DM1.cdsDetFPago.FieldByName('FC_MTOEXT').AsString := Cajadec(CurrtoStr(DM1.cdsDetFPago.FieldByName('FC_COBRADO').AsFloat ));
      end;}
      DM1.cdsDetFPago.Next;
   end;
   DM1.cdsDetFPago.GotoBookmark(BMK);
   DM1.cdsDetFPago.FreeBookmark(BMK);
   DM1.cdsDetFPago.EnableControls;
end;

procedure TFCobConsolidado.dblcdFEfecExit(Sender: TObject);
begin
  xDescrip := 'FLUEFEID='+quotedstr(dblcdFEfec.text);
  dbeFEfec.text := DM1.DisplayDescrip('prvTGE','TGE217','FLUEFEDES',xDescrip,'FLUEFEDES');
end;

procedure TFCobConsolidado.ActualizaFiltro;
begin
    if z2bbtnNuevo.Visible then
    begin
       if not xGraboNuevo then
          cdsFiltro.append;
       DM1.ActualizaCDS(DM1.cdsIngDocs,cdsFiltro);
    end
    else
    begin
       DM1.ActualizaCDS(DM1.cdsIngDocs,cdsFiltro);
    end;
    xGraboNuevo := True;
end;

procedure TFCobConsolidado.AsignaCDSFiltro(cds: TwwClientDataset);
begin
   cdsFiltro := cds;
end;

procedure TFCobConsolidado.LLenaEdits;
begin
    with DM1.cdsDetFPago do
    begin

				CalculaResto;
    end;
end;

procedure TFCobConsolidado.Inserta;
begin
	 DM1.cdsDetFPago.Insert;
	 DM1.cdsDetFPago.FieldByName('CORRE').AsInteger := DM1.cdsDetFPago.recno;
	 if DM1.cdsDetFPago.recordcount = 0 then
	 CalculaResto;
end;

procedure TFCobConsolidado.GrabaDetalle;
begin
end;

procedure TFCobConsolidado.ValidacionCobradoTotal;
begin
end;

procedure TFCobConsolidado.ValidacionDatos;
begin


end;

procedure TFCobConsolidado.ValidacionTjaChq;
begin

		if trim(dblcBanco.text) = '' then
		begin
       dblcBanco.setfocus;
       Raise Exception.Create ('Ingrese Banco');
    end;

end;

procedure TFCobConsolidado.ValidaCancelacion;
begin
end;

procedure TFCobConsolidado.GrabaClave;
//var  xContador : Integer;
begin
	 DM1.cdsDetFPago.DisableControls;
	 DM1.cdsDetFPago.First;
	 while not DM1.cdsDetFPago.Eof do
	 begin
			DM1.cdsDetFPago.Edit;
			DM1.cdsDetFPago.FieldBYname('CIAID').AsString    := trim(dblcCia.Text);
			DM1.cdsDetFPago.FieldBYname('CCTREC').AsString   := 'CO';
			DM1.cdsDetFPago.FieldBYname('DOCID').AsString    := trim(dblcTDoc.Text);
			DM1.cdsDetFPago.FieldBYname('CCSERIE').AsString  := trim(dbeSerie.Text);
			DM1.cdsDetFPago.FieldBYname('CCNODOC').AsString  := trim(dblcdLICO.Text);
			//FieldBYname('CCNODOC').AsString  := trim(dbeNoDoc.Text);
			DM1.cdsDetFPago.FieldBYname('FC_ESTADO').AsString  := 'I';
			DM1.cdsDetFPago.Post;
			DM1.cdsDetFPago.Next;
	 end;
	 DM1.cdsDetFPago.First;
	 DM1.cdsDetFPago.EnableControls;

	 DM1.cdsCanjeCxC.DisableControls;
	 DM1.cdsCanjeCxC.First;
	 while not DM1.cdsCanjeCxC.Eof do
	 begin
			DM1.cdsCanjeCxC.Edit;
			DM1.cdsCanjeCxC.FieldBYname('CIAID').AsString    := trim(dblcCia.Text);
			DM1.cdsCanjeCxC.FieldBYname('CCTREC').AsString   := 'CO';
			DM1.cdsCanjeCxC.FieldBYname('DOCID').AsString    := trim(dblcTDoc.Text);
			DM1.cdsCanjeCxC.FieldBYname('CCSERIE').AsString  := trim(dbeSerie.Text);
			DM1.cdsCanjeCxC.FieldBYname('CCNODOC').AsString  := trim(dblcdLICO.Text);
			DM1.cdsCanjeCxC.FieldBYname('FC_ESTADO').AsString  := 'I';
			DM1.cdsCanjeCxC.Post;
			DM1.cdsCanjeCxC.Next;
	 end;
	 DM1.cdsCanjeCxC.First;
	 DM1.cdsCanjeCxC.EnableControls;

end;

procedure TFCobConsolidado.GrabaEstadoFPago(xEstado: string);
var
	 sSQL,sFCanc : string;
begin
	 sFCanc:=  formatdatetime( DM1.wFormatFecha , dbdtpFEmision.date );

	 DM1.cdsDetFPago.DisableControls;
	 DM1.cdsDetFPago.First;
	 while not DM1.cdsDetFPago.Eof do
	 begin
	 		DM1.cdsDetFPago.Edit;
	 		DM1.cdsDetFPago.FieldBYname('FC_ESTADO').AsString  := xEstado;
	 		DM1.cdsDetFPago.FieldByName('FC_FCANC').AsDateTime := dbdtpFEmision.date;
	 		DM1.cdsDetFPago.Post;
	 		DM1.cdsDetFPago.Next;
	 end;
	 DM1.cdsDetFPago.First;
	 DM1.cdsDetFPago.EnableControls;

	 DM1.cdsCanjeCxC.DisableControls;
	 DM1.cdsCanjeCxC.First;
	 while not DM1.cdsCanjeCxC.Eof do
	 begin
	 		DM1.cdsCanjeCxC.Edit;
	 		DM1.cdsCanjeCxC.FieldBYname('FC_ESTADO').AsString  := xEstado;
	 		DM1.cdsCanjeCxC.FieldByName('FC_FCANC').AsDateTime := dbdtpFEmision.date;
	 		DM1.cdsCanjeCxC.Post;
	 		DM1.cdsCanjeCxC.Next;
	 end;
	 DM1.cdsCanjeCxC.First;
	 DM1.cdsCanjeCxC.EnableControls;
end;

procedure TFCobConsolidado.AcumulaDetFPago;
var
	 xMtoLoc,xMtoExt : Double;
//   Xcds : TwwClientDataSet;
	 xCountLoc,xCountExt   : Double;
	 xMonedaBase : String;
begin

	 xToTalMN:=0;
	 xToTalME:=0;
	 xToTalCMN:=0;
	 xToTalCME:=0;

	 //xMtoLoc   := OperClientDataSet(DM1.cdsDetFPago , 'SUM(FC_MTOLOC)','');
	 //xMtoExt   := OperClientDataSet(DM1.cdsDetFPago , 'SUM(FC_MTOEXT)','');
	 xMtoLoc   := OperClientDataSet(DM1.cdsDetFPago , 'SUM(FC_MTOLOC)','TMONID='+QuotedStr(DM1.wTMonLoc));
	 xMtoExt   := OperClientDataSet(DM1.cdsDetFPago , 'SUM(FC_MTOEXT)','TMONID='+QuotedStr(DM1.wTMonExt));
	 xToTalMN  := xTotalMN + xMtoLoc;
	 xToTalME  := xTotalME + xMtoExt;
	 xToTalCMN := xMtoLoc;
	 xToTalCME := xMtoExt;

	 //dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue  := cajadec(currtostr(xMtoLoc));
	 //dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue  := cajadec(currtostr(xMtoExt));
	 dbgDetFPago.ColumnByName('FC_MTOLOC').FooterValue  := FloatToStrF(xMtoLoc,ffNumber,15,2);
	 dbgDetFPago.ColumnByName('FC_MTOEXT').FooterValue  := FloatToStrF(xMtoExt,ffNumber,15,2);

	 //xMtoLoc  := OperClientDataSet(DM1.cdsCanjeCxC, 'SUM(FC_MTOLOC)','');
	 //xMtoExt  := OperClientDataSet(DM1.cdsCanjeCxC, 'SUM(FC_MTOEXT)','');
	 xMtoLoc  := OperClientDataSet(DM1.cdsCanjeCxC, 'SUM(FC_MTOLOC)','TMONID='+QuotedStr(DM1.wTMonLoc));
	 xMtoExt  := OperClientDataSet(DM1.cdsCanjeCxC, 'SUM(FC_MTOEXT)','TMONID='+QuotedStr(DM1.wTMonExt));

	 xToTalMN := xTotalMN + xMtoLoc;
	 xToTalME := xTotalME + xMtoExt;

   //CLG: 22/07/2002
	 //dbeMN.Text := cajadec(currtostr( xToTalMN ));
	 //dbeME.Text := cajadec(currtostr( xToTalME ));
	 dbeMN.Text := FloatToStrF(xToTalMN,ffNumber,15,2);
	 dbeME.Text := FloatToStrF(xToTalME,ffNumber,15,2);

	 dbgDepositos.ColumnByName('FC_MTOLOC').FooterValue  := FloatToStrF(xMtoLoc,ffNumber,15,2);
	 dbgDepositos.ColumnByName('FC_MTOEXT').FooterValue  := FloatToStrF(xMtoExt,ffNumber,15,2);

	 xCountLoc :=  OperClientDataSet(DM1.cdsDetFPago , 'COUNT(*)','TMONID=''' + DM1.wTMonLoc + '''');
	 xCountExt :=  OperClientDataSet(DM1.cdsDetFPago , 'COUNT(*)','TMONID=''' + DM1.wTMonExt + '''');
	 if ((xCountLoc > 0) and (xCountExt=0)) or ((xCountLoc = 0) and (xCountExt > 0)) then
	 begin
			xMonedaBase := DM1.cdsDetFPago.FieldByName('TMONID').AsString;
	 end
	 else
	 begin
			xMonedaBase := trim( dblcTMonCab.Text );
	 end;
end;

procedure TFCobConsolidado.CalculaResto;
var
		xCampo1  ,
		xCampo2  : string;
begin

end;

procedure TFCobConsolidado.Redondear;
var nTMtoLoc, nTMtoExt: double;  //'T' Total
	nSMtoLoc, nSMtoExt: double;    //'S' S
	bkmReg: TBookmark;
begin
	 bkmReg := DM1.cdsDetFPago.GetBookmark;
	 DM1.cdsDetFPago.DisableControls;

	 nSMtoLoc := 0;  nSMtoExt := 0;
	 try
			DM1.cdsDetFPago.First;
			while not DM1.cdsDetFPago.EOF do
			begin
				 nSMtoLoc := nSMtoLoc + DM1.cdsDetFPago.fieldbyName('FC_MTOLOC').asfloat;
				 nSMtoExt := nSMtoExt + DM1.cdsDetFPago.fieldbyName('FC_MTOEXT').asFloat;
				 DM1.cdsDetFPago.Next;
			end;
			if not (DM1.cdsDetFPago.state in [dsEdit, dsInsert]) then
				 DM1.cdsDetFPago.edit;
			DM1.cdsDetFPago.fieldbyName('FC_MTOLOC').asfloat:=nTMtoLoc-nSMtoLoc+DM1.cdsDetFPago.fieldbyName('FC_MTOLOC').asfloat;
			DM1.cdsDetFPago.fieldbyName('FC_MTOEXT').asFloat:=nTMtoExt-nSMtoExt+DM1.cdsDetFPago.fieldbyName('FC_MTOEXT').asFloat;
			cdsPost( DM1.cdsDetFPago );
	 finally
			DM1.cdsDetFPago.GotoBookmark(bkmReg);
			DM1.cdsDetFPago.EnableControls;
			DM1.cdsDetFPago.FreeBookmark(bkmReg);
	 end;
end;

procedure TFCobConsolidado.Z2bbtnEmiteClick(Sender: TObject);
var
  CadSql : String;
begin
  if DM1.cdsIngDocs.FieldByName('NCOESTADO').AsString <> 'C' then
  begin
     rAISE Exception.Create('El Documento debe estar aceptado' +#13+' para poder ser emitido') ;
  end ;
//
  CadSql:='SELECT R.CIAID , T.CIADES, B.BANCONOM, P.FPAGODES, ' +
					' J.FC_COBRADO, M.TMONABR, R.TMONID, ' +
					' R.CCFEMIS, R.CCNODOC, R.NCOMTOORI, R.CCGLOSA, ' +
					' R.NCOTCAMB, CAJA301.DENUMREG, R.CCNOMB ' +
					' FROM CXC303 R, TGE101 T, TGE105 B, CAJA314 J, ' +
					' TGE112 P, TGE103 M,  CAJA301 '+

					' WHERE R.CIAID = ''' + trim( dblcCia.Text  ) + ''' '     +
					' AND R.CCNODOC ='''  + trim( dblcdLICO.Text ) + ''' '  +
					//' AND R.CCNODOC ='''  + trim( dbenodoc.Text ) + ''' '  +
					' AND R.CCSERIE = ''' + trim( dbeSerie.Text ) + ''' '       +
					' AND R.DOCID = '''   + trim( dblcTDoc.Text ) + ''' '       +

          ' AND R.CIAID = T.CIAID '      +
          ' AND R.BANCOID = B.BANCOID '  +
          ' AND R.CIAID   = J.CIAID '    +
          ' AND R.CCSERIE = J.CCSERIE '  +
          ' AND R.CCNODOC = J.CCNODOC '  +
          ' AND R.DOCID   = J.DOCID '    +

          ' AND J.FPAGOID = P.FPAGOID '  +

          ' AND J.TMONID = M.TMONID '    +
          ' AND CAJA301.DENUMREG='+quotedstr(edNumReg.text)+
          ' GROUP BY '+
          ' R.CIAID , T.CIADES, B.BANCONOM, P.FPAGODES, ' +
          ' J.FC_COBRADO, M.TMONABR, R.TMONID, ' +
          ' R.CCFEMIS, R.CCNODOC, R.NCOMTOORI, R.CCGLOSA, ' +
          ' R.NCOTCAMB, CAJA301.DENUMREG, R.CCNOMB ';
  DM1.cdsqry.close;
  DM1.cdsqry.datarequest(CadSql);
	DM1.cdsqry.open;
	ppdbRecibo.DataSource   := DM1.dsQry ;
		 //JCC: 24/06/2002
	pprRecibo.TEMPLATE.FileName := wRutaRpt + '\Ingreso.Rtm';
  pprRecibo.template.LoadFromFile ;

  ppLbDescrip.Caption := dbeGiradoA.text;
  pprRecibo.Print                      ;
  ppdbRecibo.DataSource   := nil       ;
//
end;

procedure TFCobConsolidado.pprReciboBeforePrint(Sender: TObject);
var
  Year, Month, Day: Word ;
  xSQL : String ;
  xMoneda, xMes : String ;
  xConver : Double;
begin
// Inicio HPC_201601_CAJA
   xMoneda := DMTE.wTMonLocDes;
//   xMoneda := 'Nuevos Soles';
// Fin HPC_201601_CAJA
   DM1.cdsTMon.Locate('TMONID',DM1.wTMonLoc,[]);
   xConver := DM1.cdsQry.FieldByName('NCOMTOORI').AsFloat * StrToFloat(dbeTCambio.Text);
   if DM1.cdsqry.FieldByName('TMONID').AsString = DM1.wTMonExt then
    begin
     pplbValor.Caption:= DM1.cdsTMon.FieldByName('TMONABR').AsString + ' '
                       + FloatToStrF(xconver,ffNumber,12,2);
     ppLbDescrip.AutoSize := False;
     ppLbDescrip.Width := 165;
     ppLbDescrip.Caption  :='La cantidad de '+Trim(NumtoStr(xConver)) +' '+xMoneda;
     ppLbDescrip.WordWrap := True;
		 ppLbDescrip.AutoSize := True;
    end
   else
    begin
     xconver := DM1.cdsQry.FieldByName('NCOMTOORI').asFloat;
//     pplbValor.Caption:= DM1.cdsTMon.FieldByName('TMONABR').AsString + ' ' + Format('%-8.2f',[xconver]);
     pplbValor.Caption := DM1.cdsTMon.FieldByName('TMONABR').AsString + ' '
                         + FloatToStrF(xconver,ffNumber,12,2);
     ppLbDescrip.Caption := 'La cantidad de '+Trim(NumtoStr(xConver)) +' '+xMoneda;
    end;
   //**
   ppLbDescrip1.AutoSize := False;
   ppLbDescrip1.Width    := 165;
	 ppLbDescrip1.Caption  := 'Por Concepto de '+DM1.cdsqry.FieldByName('CCGLOSA').AsString;
                            DecodeDate(DM1.cdsqry.fieldbyName('CCFEMIS').AsDateTime, Year, Month, Day);
   xSQL := 'CIAID=' + QuotedStr(DM1.cdsqry.FieldByName('CIAID').AsString);
   ppLbDescrip1.WordWrap := True;
   ppLbDescrip1.AutoSize := True;

   case Month of
    1  : xMes := 'Enero' ;
    2  : xMes := 'Febrero' ;
    3  : xMes := 'Marzo' ;
    4  : xMes := 'Abril' ;
    5  : xMes := 'Mayo' ;
    6  : xMes := 'Junio' ;
    7  : xMes := 'Julio' ;
    8  : xMes := 'Agosto' ;
    9  : xMes := 'Setiembre' ;
   10 : xMes := 'Octubre' ;
	 11 : xMes := 'Noviembre' ;
   12 : xMes := 'Diciembre' ;
  end;

   if DM1.RecuperarDatos('TGE101','*',xSQL) then
    begin
     pplbFecha.Caption := 'Lima, '+IntToStr(Day)+' de '+xmes +' del '+inttostr(Year);
    end ;
//  ppnNombre.Caption:='Hemos recibido de Sr./Sra: '+DM1.cdsqry.FieldByName('AUXNOMB').AsString;
   ppnNombre.Caption:='Hemos recibido de Sr./Sra: '+DM1.cdsqry.FieldByName('CCNOMB').AsString;
   xSQL := 'TMONID=' + QuotedStr(DM1.cdsQry.FieldByName('TMONID').AsString);
end;

procedure TFCobConsolidado.pprReciboPreviewFormCreate(Sender: TObject);
begin
   pprRecibo.PreviewForm.ClientHeight := 500;
   pprRecibo.PreviewForm.ClientWidth  := 650;
   TppViewer(pprRecibo.PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

procedure TFCobConsolidado.BuscaNRecibo;
var
	 sSql: string;
begin
	 if DM1.cdsTDoc.FieldByName('DOCRECCAJ').AsString = 'S' then
	 begin
			ssql := '';
			ssql := 'SELECT substr('+DM1.wReplacCeros+'(SUBSTR(''000000'',1,6-LENGTH(RTRIM(CHAR(MAX(INTEGER(DENUMREG))+1))))'+
					 ' ||(CHAR(MAX(INTEGER(DENUMREG))+1)),''000001''  ),1,6) AS RECIBO FROM CAJA301'+
					 ' WHERE DOCID2='+quotedstr(trim(dblcTDoc.text))+' AND (DENUMREG <> '''' and DENUMREG IS NOT NULL)'+
					 ' AND CIAID='+quotedstr(dblcCia.text);
			DM1.cdsQry2.Close;
			DM1.cdsQry2.DataRequest(ssql);
			DM1.cdsQry2.open;
			dblcdLICO.Text :=  DM1.cdsQry2.FieldByName('RECIBO').AsString; //xNumReg;
			//dbeNoDoc.Text :=  DM1.cdsQry2.FieldByName('RECIBO').AsString; //xNumReg;
	 end
   else
			edNumReg.Text := '';
end;


procedure TFCobConsolidado.dblcCiaExit(Sender: TObject);
begin
   xDescrip := 'CIAID='+quotedstr(dblcCia.Text);
   edtCia.text := DM1.DisplayDescrip('prvTGE','TGE101','CIAABR',xDescrip,'CIAABR');
   wModifica := True;
end;

procedure TFCobConsolidado.FormActivate(Sender: TObject);
var xsql : string;
begin
  xsql := 'SELECT * FROM TGE203 WHERE CCOSMOV=''S''';
  DM1.cdsCCosto.Close;
  DM1.cdsCCosto.DataRequest(xsql);
  DM1.cdsCCosto.open;
  xInsercion := '';
	dbeSerie.Text:='CAJA';
end;

procedure TFCobConsolidado.dblcClaseNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
 if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;


procedure TFCobConsolidado.dblcdLICOEnter(Sender: TObject);
var
   xSQL : String;
begin

   if ( DM1.SRV_D = 'DB2400' ) or ( DM1.SRV_D = 'DB2NT' ) then begin
{   xSQL:='Select A.CIAID, A.LICOID, A.COID, A.CCFEMIS, A.TMONID, A.LICOMTOORI, '
        +   'A.LICOCAJA, LICOUSER '
        +'From CXC318 A '
        +  'LEFT JOIN CXC206 B ON A.CIAID=B.CIAID AND A.COID=B.COID '
        +'WHERE COALESCE(A.LICOCAJA,''N'')<>''S'' AND B.COCONS=''S''';}
    xSQL:=' Select A.CIAID, A.LICOID, A.COID, C.CCFEMIS, C.TMONID, C.LICOUSER, '+
        ' SUM(CASE WHEN A.TMONIDPAGO='+QuotedStr(DM1.wTMonLoc)+' THEN A.LICOMTOABOLOC ELSE 0 END ) LICOMTOABOLOC, '+
        ' SUM(CASE WHEN A.TMONIDPAGO='+QuotedStr(DM1.wTMonExt)+' THEN A.LICOMTOABOEXT ELSE 0 END) LICOMTOABOEXT '+
        ' From CXC320 A '+
        ' LEFT JOIN CXC206 B ON A.CIAID=B.CIAID AND A.COID=B.COID '+
        ' LEFT JOIN CXC318 C ON C.CIAID=A.CIAID AND C.LICOID=A.LICOID '+
        ' WHERE A.CIAID='+QuotedStr(dblcCia.text)+' AND COALESCE(C.LICOCAJA,''N'')<>''S'' AND B.COCONS=''S'' '+
        ' GROUP BY A.CIAID, A.LICOID, A.COID, C.CCFEMIS, C.TMONID, C.LICOUSER ';

   end;

   if ( DM1.SRV_D = 'ORACLE' ) then begin
   xSQL:='Select A.CIAID, A.LICOID, A.COID, A.CCFEMIS, A.TMONID, A.LICOMTOORI, '
        +   'A.LICOCAJA, LICOUSER '
				+'From CXC318 A, CXC206 B '
				+'WHERE COALESCE(A.LICOCAJA,''N'')<>''S'' AND B.COCONS=''S'' and '
				+      'A.CIAID=B.CIAID AND A.COID=B.COID ';
	 end;

	 DM1.cdsCobraCxC.Close;
	 DM1.cdsCobraCxC.DataRequest( xSQL );
	 DM1.cdsCobraCxC.Open;

	 dblcdLICO.Selected.Clear;
	 dblcdLICO.Selected.Add( 'LICOID'    + #9 + '06' + #9 + '# Consolidado'  );
	 dblcdLICO.Selected.Add( 'CCFEMIS'   + #9 + '10' + #9 + 'F.Emisión' );
	 dblcdLICO.Selected.Add( 'TMONID'    + #9 + '03' + #9 + 'TM'     );
	 dblcdLICO.Selected.Add( 'LICOMTOABOLOC'+ #9 + '13' + #9 + 'Monto Local'  );
	 dblcdLICO.Selected.Add( 'LICOMTOABOEXT'+ #9 + '13' + #9 + 'Monto Extr.'  );
	 dblcdLICO.Selected.Add( 'LICOUSER'  + #9 + '12' + #9 + 'Usuario');

end;

procedure TFCobConsolidado.dblcdLICOExit(Sender: TObject);
var
	 xSQL : String;
	 xWhere : String;
begin
	 if dblcdLico.text='' then Exit;

	 xSQL:='Select * from CXC320 '
				+'Where CIAID=''' +dblcCia.Text  +''' and '
				+      'LICOID='''+dblcdLico.Text+''' ';
	 DM1.cdsQry.Close;
	 DM1.cdsQry.DataRequest(xSQL);
	 DM1.cdsQry.Open;

	 if DM1.cdsQry.RecordCount=0 then begin
			ShowMessage( 'Número de Liquidación no Existe' );
			dblcdLICO.SetFocus;
			Exit;
	 end;

	 if (DM1.wModo='A') and (xInsercion = '') then
	 begin
      dbeSerie.Text:='CAJA';
      xWhere:='CIAID='''  + dblcCia.Text  + ''' and '
             +'DOCID='''  + dblcTDoc.Text + ''' and '
             +' '+DM1.wReplacCeros+'(CCSERIE,'''')='''+ dbeSerie.Text + ''' and '
             +'CCNODOC='''+ dblcdLICO.Text + ''' AND NCOESTADO<>''A'' ';

      if DM1.DisplayDescrip('prvTGE','CXC303','COUNT(*) TOTREG',xWhere,'TOTREG') > '0' then begin
         ShowMessage('El Número de Documento ya Ha sido Ingresado. Se Cambiara por el Siguiente...');
    		 dblcdLICO.SetFocus;
         Exit;
      end;
	 end;

	 dblcTMonCab.Text:=DM1.cdsCobraCxC.FieldByname('TMONID').AsString;
	 xDescrip := 'TMONID='+quotedstr(dblcTMonCab.text);
	 edtTMonCab.text := DM1.DisplayDescrip('prvTGE','TGE103','TMONABR',xDescrip,'TMONABR');
	 dblcdCnp.Text   := DM1.cdsCnpEgr.FieldByName('CPTOID').AsString;
	 dbeGlosa.text   := DM1.cdsCnpEgr.FieldByName('CPTODES').AsString;
end;





procedure TFCobConsolidado.InsertaComprobanteBancos;
begin

end;

procedure TFCobConsolidado.dblcdAuxDropDown(Sender: TObject);
begin
   DM1.cdsAux.IndexFieldNames :='AUXNOMB';
end;

end.

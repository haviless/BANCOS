unit Caja701;

// Inicio Uso Estándares:   01/08/2011
// Unidad               :   Caja701
// Formulario           :   FToolRegRet
// Fecha de Creación    :   14/04/2010
// Autor                :   Hugo Noriega
// Objetivo             :   Tool para imprimir reportes de Retenciones del IGV.
//
// Actualizaciones      :
// HPC_201103_Caja  09/08/2011  Poder cambiar la Fecha de Emisión del Reporte.
// HPC_201403_CAJA cambia control de diseño de reporte
// HPC_201601_CAJA 11/01/2016: Se define la variable wTMonLocDes para descripción de la Moneda Local
//                             Se remueve componente lista de parámetros del formulario
//                             Botón para asignar Monto Retención en Letras
//                             Rutina bbtnNumLetrasClick, invoca a función para asignar Total Monto de Retención en Letras
//                             Se retira componentes de reporte de formulario
//                                serán invocados desde archivo de reporte
//                             Se retira evento de reporte de Retención
// HPC_201602_CAJA 02/02/2016: Se incluye Botón que genera archivo diario de Comprobantes de Retención IGV
//                             Cambio de apariencia por colores a variable de Fecha de Reporte / Archivo
//                             Fin 08/02/2016
//                 18/02/2016  Se añade serie a la búsqueda que genera archivo para PDT 626
// HPC_201603_CAJA 14/03/2016  Se modifica select parfa omitir Notas de Crédito
//                 14/03/2016  Se omite valores de pago y retención para cuando es Nota de Crédito
//                 15/03/2016  Se incluye campo RETSERIE a subconculta C

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls,db, DBClient, wwclient,Mant, StdCtrls, Mask, ppCache,
  ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands,
  ppCtrls, ppPrnabl, wwdblook, wwdbedit, Wwdbspin, Spin, ppEndUsr, ppVar,
  Grids, Wwdbigrd, Wwdbgrid, StrContainer,ppViewr, ppTypes, ppParameter,
   wwExport,  shellapi,
  wwdbdatetimepicker;

type
  TFToolRegRet = class(TForm)
    PnlComprobante: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Z2bbtnRegRetenc: TBitBtn;
    Label1: TLabel;
    pprRegRetencion: TppReport;
    ppDBRegRetencion: TppDBPipeline;
    dblcPeriodo: TwwDBLookupCombo;
    Z2bbtnLibReten: TBitBtn;
    Z2bbtnRevisaRet: TBitBtn;
    pprComprobante: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel51: TppLabel;
    ppLabel53: TppLabel;
    ppDBText24: TppDBText;
    pplblPeriodo2: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppdbMtoProv: TppDBText;
    ppdbMtoPago: TppDBText;
    ppdbMtoRet: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppdbcMtoTRet: TppDBCalc;
    ppdbcMtoTPago: TppDBCalc;
    ppLabel57: TppLabel;
    ppLabel50: TppLabel;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLabel52: TppLabel;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppLabel54: TppLabel;
    ppDBText30: TppDBText;
    ppDBText37: TppDBText;
    ppLabel55: TppLabel;
    ppDBText38: TppDBText;
    ppLabel56: TppLabel;
    rgOrden: TRadioGroup;
    Z2bbtnImpBloque: TBitBtn;
    pprRetencion: TppReport;
    pprCompRet: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText11: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel38: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    pplblCia: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape7: TppShape;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel18: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    pplblTotalBase: TppLabel;
    pplblTotalRetenido: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppShape2: TppShape;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    Z2bbtnTxPDT: TBitBtn;
    sc: TStrContainer;
    sd: TSaveDialog;
    ppReport: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel60: TppLabel;
    pplblCiaRetPdt: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppLabel62: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText53: TppDBText;
    ppDBCalc9: TppDBCalc;
    ppFooterBand4: TppFooterBand;
 // Inicio HPC_201601_BAN
 // Se remueve componente lista de parámetros del formulario
 //    ppParameterList1: TppParameterList;
 // Fin HPC_201601_BAN
    ppd1: TppDesigner;
    ppdbRetencion: TppDBPipeline;
    ppField26: TppField;
    ppField27: TppField;
    ppField28: TppField;
    ppField29: TppField;
    ppField30: TppField;
    ppField31: TppField;
    ppField32: TppField;
    ppField33: TppField;
    ppField67: TppField;
    ppField68: TppField;
    ppField69: TppField;
    ppField70: TppField;
    ppField71: TppField;
    ppField72: TppField;
    ppField73: TppField;
    ppField74: TppField;
    ppField75: TppField;
    ppField76: TppField;
    ppField77: TppField;
    ppField78: TppField;
    ppField79: TppField;
    ppField80: TppField;
    ppField81: TppField;
    ppField82: TppField;
    ppField83: TppField;
    ppField84: TppField;
    ppField85: TppField;
    ppdbpLCR: TppDBPipeline;
    ppdbCompRet: TppDBPipeline;
// Inicio HPC_201602_CAJA
// retiro de variables de reporte
{
    ppField34: TppField;
    ppField35: TppField;
    ppField36: TppField;
    ppField37: TppField;
    ppField38: TppField;
    ppField39: TppField;
    ppField40: TppField;
    ppField41: TppField;
    ppField42: TppField;
    ppField43: TppField;
    ppField44: TppField;
    ppField45: TppField;
    ppField46: TppField;
    ppField47: TppField;
    ppField48: TppField;
    ppField49: TppField;
    ppField50: TppField;
    ppField51: TppField;
    ppField52: TppField;
    ppField53: TppField;
    ppField54: TppField;
    ppField55: TppField;
    ppField56: TppField;
    ppField57: TppField;
    ppField58: TppField;
    ppField59: TppField;
    ppField60: TppField;
    ppField61: TppField;
    ppField62: TppField;
    ppField63: TppField;
    ppField64: TppField;
    ppField65: TppField;
    ppField66: TppField;
}
// Fin HPC_201602_CAJA

    ppDBReport: TppDBPipeline;
    bbtnRetProv: TBitBtn;
    dtpDesde: TwwDBDateTimePicker;
    dtpHasta: TwwDBDateTimePicker;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    ppReport1: TppReport;
    ppParameterList2: TppParameterList;
    ppHeaderBand6: TppHeaderBand;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppDBText54: TppDBText;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    ppLabel95: TppLabel;
    ppLabel96: TppLabel;
    ppDBText55: TppDBText;
    ppDetailBand6: TppDetailBand;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppSummaryBand4: TppSummaryBand;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppLabel97: TppLabel;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppLabel98: TppLabel;
    ppParameterList3: TppParameterList;
    ppHeaderBand4: TppHeaderBand;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDetailBand4: TppDetailBand;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppDBCalc6: TppDBCalc;
    ppTotal: TppDBCalc;
    ppDBText49: TppDBText;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    gbFecRep: TGroupBox;
    dtpFecRep: TwwDBDateTimePicker;
    cbFecRep: TCheckBox;
    bbtnRegRetA4: TBitBtn;
    btnExportarExcel: TBitBtn;
    dbgRptRetenciones: TwwDBGrid;
// Inicio HPC_201601_CAJA
// se retira componentes de reporte de formulario
// serán invocados desde archivo de reporte
{
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
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
    ppDBText1: TppDBText;
    ppLabel33: TppLabel;
    ppDBText50: TppDBText;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel15: TppLabel;
    ppLabel34: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppsvFec: TppSystemVariable;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel61: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    pplFec: TppLabel;
    ppLabel66: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText10: TppDBText;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    ppDBText51: TppDBText;
    ppDBText4: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText22: TppDBText;
    ppDBText52: TppDBText;
    ppDBText70: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppLabel65: TppLabel;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppLine5: TppLine;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel37: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLine3: TppLine;
    ppLine4: TppLine;
}
// Fin HPC_201601_CAJA
    ppdbRetA4: TppDBPipeline;
    pprRetA4: TppReport;
    ppdRetA4: TppDesigner;
    sbDisenoRep: TSpeedButton;
    cbDisenoRep: TCheckBox;
    ppParameterList4: TppParameterList;
    ppHeaderBand7: TppHeaderBand;
    ppLabel67: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel105: TppLabel;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppDBText71: TppDBText;
    ppLabel110: TppLabel;
    ppDBText72: TppDBText;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppSystemVariable12: TppSystemVariable;
    ppSystemVariable13: TppSystemVariable;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLabel124: TppLabel;
    ppDBText88: TppDBText;
    ppDetailBand7: TppDetailBand;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppLabel125: TppLabel;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppLine8: TppLine;
    ppSummaryBand5: TppSummaryBand;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppLabel126: TppLabel;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLabel123: TppLabel;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppl_BaseImp6: TppLabel;
    ppl_BaseImp3: TppLabel;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppl_Retencion6: TppLabel;
    ppl_Retencion3: TppLabel;
 // Inicio HPC_201601_CAJA
 // Botón para asignar Monto Retención en Letras
    bbtnNumLetras: TBitBtn;
 // Fin HPC_201601_CAJA

 // Inicio HPC_201602_CAJA
 // Botón para generar archivo diario de Comprobantes de Retención IGV
    Z2bbtnResDReten: TBitBtn;
    Timer1: TTimer;
    sdGraba: TSaveDialog;
    BitBtn1: TBitBtn;
 // Fin HPC_201602_CAJA


    Function AsientoCuadra: Boolean;
    procedure sbtABlClick(Sender: TObject);
    procedure Z2bbtnRegRetencClick(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Z2bbtnLibRetenClick(Sender: TObject);
    procedure Z2bbtnRevisaRetClick(Sender: TObject);
    procedure Z2bbtnImpBloqueClick(Sender: TObject);
    procedure dblcCiaEnter(Sender: TObject);
    procedure dblcPeriodoEnter(Sender: TObject);
    procedure dblcPeriodoExit(Sender: TObject);
    procedure Z2bbtnTxPDTClick(Sender: TObject);
    procedure ppReportPreviewFormClose(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ppDBCalc10Print(Sender: TObject);
    procedure pprRetencionPreviewFormCreate(Sender: TObject);
    procedure bbtnRetProvClick(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure ppHeaderBand1BeforePrint(Sender: TObject);
    procedure cbFecRepClick(Sender: TObject);
    procedure bbtnRegRetA4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnExportarExcelClick(Sender: TObject);
    procedure sbDisenoRepClick(Sender: TObject);
 // Inicio HCP_201601_CAJA
 // rutina que invoca a función para asignar Total Monto de Retención en Letras
    procedure bbtnNumLetrasClick(Sender: TObject);
 // Fin HCP_201601_CAJA

 // Inicio HPC_201602_CAJA
 // Generación de Archivo diario de Comprobantes de Retención IGV
    procedure Z2bbtnResDRetenClick(Sender: TObject);
    Procedure fg_PLEexportarFormato(wgRutaArchivo: String);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
 // Fin HPC_201602_CAJA

  private
    { Private declarations }
    xnBaseImponible6 :double;
    xnBaseImponible3 :double;
    xnRetencion6 :double;
    xnRetencion3 :double;


    MProv    : TMant;
    //INICIO SAR666
    xbExportarExcel :Boolean;
    //FIN SAR666
    //Agregado por Ana
     xCont : String;
     cdsGComprobante :  TwwClientDataSet;
      //INICIO SAR666
      procedure fg_ExportarExcel(wgFormato: String);
      //FIN SAR666

  public
    { Public declarations }
    xToolCia,xTooldiario,xToolAnomm,xToolPeriodo,xToolEstado,wPeriodoDesc : String;
    XFiltroDet : TMant;
    sA4 : String;
    Function  PeriodoCuadra:Boolean;
  end;

var
  FToolRegRet: TFToolRegRet;
   xSqlMant: STring;

implementation

uses CajaDM, oaTE4000;

{$R *.DFM}

Function TFToolRegRet.PeriodoCuadra:Boolean;
var
  xA,xR,xI  : integer;
  P,E,T  : string;
begin
    result := False;

    xA:=0 ;  xR:=0 ;  xI:=0 ;
    cdsGComprobante.First ;
    P:= cdsGComprobante.FieldByName('CNTANOMM').AsString ;
    E:= cdsGComprobante.FieldByName('CNTESTADO').AsString ;
    while not  cdsGComprobante.EOF do
    begin
      T := cdsGComprobante.FieldByName('CNTANOMM').AsString;

      if (P = T) and (E = 'I') then //Si periodos son iguales
         xA := xA+1
      else
        if P <> T  then  //  Compara si los periodos son iguales
        begin
           Showmessage(' Debe Aceptar solo Registros con periodos iguales');
           xR := xR+1;
           result := False;
           Exit;
        end ;

        // validación de  los estados
        if  (E ='P') or (E ='C') then //Pendiente  o Contabilizado
        begin
           Showmessage(' Debe Aceptar solo Incompletos');
           xI := xI+1;
           result := False;
           Exit;
        end;

    cdsGComprobante.Next;
    end;
    if (xR =0) or(xI=0) then
       result := true;
 end;

Function TFToolRegRet.AsientoCuadra:Boolean;
var
   xTotDebe, xTotHaber : DOUBLE;
begin
   Result    := False;
   xTotDebe  := 0;
   xTotHaber := 0;
   DMTE.cdsMovCnt1.DisableControls;
   DMTE.cdsMovCnt1.First ;
   while not DMTE.cdsMovCnt1.eof do begin
      if DMTE.cdsMovCnt1.FieldByName('CNTDH').AsString='D' then
         xTotDebe  := xTotDebe  + DMTE.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat
      else begin
         xTotHaber := xTotHaber + DMTE.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat;
      end;
      DMTE.cdsMovCnt1.Next;
   end;
   DMTE.cdsMovCnt1.First;
   DMTE.cdsMovCnt1.EnableControls;
   if DMTE.FRound(xTotDebe,15,2)=DMTE.FRound(xTotHaber,15,2) then Result := True;
end;


procedure TFToolRegRet.sbtABlClick(Sender: TObject);
var
 XSQL,XSQL1,xwhere : String;
 IX ,iy: Integer;
begin

   DMTE.cdsQry3.close;
   DMTE.cdsQry3.IndexFieldNames:='';
   DMTE.FiltraTabla(DMTE.cdsCCBco,'TGE106', 'CCBCOID' );
   DMTE.FiltraTabla(DMTE.cdsFEfec,'TGE217', 'FLUEFEID' );
   DMTE.FiltraTabla(DMTE.cdsEquiv,'TGE160', '' );


   XSQL1:=FConsulta.xFiltroPProv.FMant.SQL;
//   xSQL := Mtx.FMant.SQL;
	for iX := 0 to Length(xsql1) do
	begin
		if copy(xSQL1,iX,5) = 'WHERE' then
		begin
			xwhere := copy(xSQL1,iX+6,length(xSQL1));
			break;
		end;
	end;
	for iY := 0 to Length(xWhere) do
	begin
		if copy(xWhere,iY,8) = 'ORDER BY' then
		begin
			xwhere := copy(xWhere,1,iY-2);
			break;
		end;
	end;
   //**
   if length(xwhere)>0 then
     xwhere:=xwhere+' AND ';
   XSQL:='SELECT '
         +' B.CIAID,B.PROV,B.PROVRUC, '
         +' B.TMONID, B.ECTCAMB,B.ECMTOORI,B.ECMTOLOC '
         +' ,B.ECMTOEXT, '
         +' B.CCBCOID,C.CPTOID,C.DCPDH,C.CPTCAMPR,C.CCOSID, '
         +' C.DCPMOORI,C.DCPMOLOC,C.DCPMOEXT,C.CPFEMIS,B.ECFCOMP, '
         +' D.AUXNOMB,C.CUENTAID,E.MTORETLOC,B.ECGLOSA, CASE WHEN C.TIPDET=''MG'' THEN ''S''  ELSE ''N'' END AS CABECERA '
         +' FROM  (select  CAJA302.TDIARID,CAJA302.ECANOMM,CAJA302.ECNOCOMP, '
         +' B.CIAID, B.TDIARID2,B.CPANOMM,B.CPNOREG,B.DOCID2, '
         +'   B.CPNODOC,CAJA302.PROV,CAJA302.PROVRUC,CAJA302.ECFCOMP,CAJA302.ECFEMICH, '
         +'   CAJA302.ECFPAGOP,CAJA302.FPAGOID,CAJA302.ECNODOC,CAJA302.ECTCAMB,CAJA302.ECMTOORI,CAJA302.ECMTOLOC,CAJA302.ECMTOEXT,'
         +'   CAJA302.BANCOID,CAJA302.CCBCOID,CAJA302.ECNOCHQ,CAJA302.ECGIRA,CAJA302.CPTOID,CAJA302.CUENTAID,CAJA302.ECGLOSA,CAJA302.ECLOTE,'
         +'  CAJA302.ECESTADO,CAJA302.ECCONTA,CAJA302.TMONID  '
         +' from CAJA302 , CAJA303 B '
         +' where '+xwhere +'  CAJA302.CIAID=B.CIAID AND CAJA302.TDIARID=B.TDIARID '
         +' AND CAJA302.ECANOMM=B.ECANOMM AND CAJA302.ECNOCOMP=B.ECNOCOMP '
         +' ) B,CXP302 C, CNT201 D , CNT320 E'
         +' WHERE  B.CIAID=C.CIAID AND B.CIAID=E.CIAID AND E.AUXID=D.AUXID '
         +' AND B.TDIARID=E.TDIARID AND B.TDIARID2=C.TDIARID AND B.ECNOCOMP=E.ECNOCOMP '
         +' AND B.CPANOMM=C.DCPANOMM AND B.ECANOMM=E.ANOMM AND '
         +' C.DOCID=E.DOCID AND C.CPSERIE=E.SERIE AND C.CPNODOC=E.NODOC AND '
         +' B.CPNOREG=C.CPNOREG AND E.AUXID=B.PROV AND B.PROV=D.AUXID ';

  xFiltroDet := TMant.create(self) ;

   With XFiltroDet do
   begin
      Admin         := DMTE.wAdmin ;
      Titulo        := 'Pago a Proveedores' ;
      Tablename     := 'VWCAJADETALLECXP' ;

      Filter        := 'CAJA302.EC_PROCE=''B''' ;
      ClientDataSet := DMTE.cdsQry3 ;
      OnInsert      := nil ;
      OnEdit        := nil ;
//      OnShow        := fprincipal.PGridShow;
      OnDelete      := nil ;
      DComC         := DMTE.DCOM1 ;
      Module        := 'CAJA' ;
      SectionName   := 'CAJAPAGOPROV';
      FileNameIni   := '\SOLCAJA.INI';
      User          := DMTE.wUsuario ;
      UsuarioSQL.Add(xsql);
      try
         Execute ;
      Finally
        {
         Free ;
         DMTE.cdsBancoEgr.Close;
         DMTE.cdsBancoEgr.open;
         DMTE.cdsNivel.Open;
         DMTE.cdsTDiario1.open;
         DMTE.cdsMovCxP.open;
         DMTE.cdsQry3.close;
         }
      end ;
   end ;



end;

procedure TFToolRegRet.Z2bbtnRegRetencClick(Sender: TObject);
var
   xSQL: String;
   x10 : Integer;
begin
   if length(dblccia.TEXT)=0 then
   begin
      Showmessage('Debe Seleccionar RUC de la Compañía');
      dblccia.setfocus;
      exit;
   end;

   if length(dblcPeriodo.TEXT)=0 then
   begin
      Showmessage('Debe Seleccionar el Año+Mes');
      dblcPeriodo.setfocus;
      exit;
   end;

   xSQL:=' SELECT A.ECESTADO,A.RETNUMERO,D.CPFEMIS AS FECPAGO,A.AUXID,B.PROVDES,B.PROVRUC ,C.DOCDES, '
		  +' RTRIM(A.SERIE)||''-''||RTRIM(A.NODOC) NUMERO, ''COMPRA'' TIPO,0 DEBE, '
		  +' A.MTOLOC HABE, A.MTOLOC SALDO, ''1'' ORDEN, A.ANOMM,A.NODOC NODOC '
		  +' FROM CNT320 A, TGE201 B, TGE110 C, CAJA303 D '
		  +' WHERE A.AUXID=B.PROV AND C.DOCID=A.DOCID '
		  +' AND A.CIAID=D.CIAID AND A.TDIARID=D.TDIARID AND '
		  +' A.ANOMM=D.ECANOMM AND A.ECNOCOMP=D.ECNOCOMP AND D.PROV=A.AUXID AND '
		  +' D.DOCID2=A.DOCID AND  D.CPSERIE=A.SERIE AND A.NODOC=D.CPNODOC AND C.DOCMOD=''CXP'''
		  +' AND A.CIARUC='''+dblcCia.TEXT+''' AND A.ANOMM='''+dblcPeriodo.TEXT+''''
		  +' UNION '
        +' SELECT A.ECESTADO,A.RETNUMERO,D.CPFEMIS AS FECPAGO,A.AUXID,B.PROVDES,B.PROVRUC ,C.DOCDES, '
        +' RTRIM(A.SERIE)||''-''||RTRIM(A.NODOC)  NUMERO, ''COMPRA'' TIPO,0 DEBE, '
        +' A.MTOLOC HABE, A.MTOLOC SALDO, ''1'' ORDEN, A.ANOMM,A.NODOC NODOC '
        +' FROM CNT320 A , TGE201 B , TGE110 C , CAJA301 D   '
        +' WHERE A.AUXID=B.PROV AND C.DOCID=A.DOCID '
        +' AND A.CIAID=D.CIAID AND A.TDIARID=D.TDIARID AND '
        +' A.ANOMM=D.ECANOMM AND A.ECNOCOMP=D.ECNOCOMP AND D.PROV=A.AUXID AND '
        +' D.DOCID2=A.DOCID AND  D.CPSERIE=A.SERIE AND A.NODOC=D.CPNODOC AND C.DOCMOD=''CXP'''
        +' AND A.CIARUC='''+dblcCia.TEXT+''' AND A.ANOMM='''+dblcPeriodo.TEXT+''''
        +' UNION '
        +' SELECT A.ECESTADO,A.RETNUMERO,A.FECPAGO,A.AUXID,B.PROVDES,B.PROVRUC ,C.FPAGODES AS DOCDES, '
        +' D.ECNOCHQ AS NUMERO, ''PAGO A PROVEEDOR'' AS TIPO, '
        +' CASE WHEN A.ECESTADO=''A'' THEN 0 ELSE '+DMTE.wReplacCeros+'(A.MTOLOC,0)-'+DMTE.wReplacCeros+'(MTORETLOC,0) END DEBE, 0 AS HABE , '
        +' CASE WHEN A.ECESTADO=''A'' THEN '+DMTE.wReplacCeros+'(A.MTOLOC,0) ELSE '+DMTE.wReplacCeros+'(A.MTOLOC,0)-('+DMTE.wReplacCeros+'(A.MTOLOC,0)-'+DMTE.wReplacCeros+'(MTORETLOC,0)) END SALDO,''2'' AS ORDEN , A.ANOMM,A.NODOC AS NODOC '
        +' FROM CNT320 A, TGE201 B , TGE112 C, CAJA302 D '
        +' WHERE A.AUXID=B.PROV AND C.FPAGOID=D.FPAGOID AND '
        +' A.CIAID=D.CIAID AND A.TDIARID=D.TDIARID   AND A.ANOMM=D.ECANOMM '
        +' AND A.ECNOCOMP=D.ECNOCOMP AND  A.CIARUC='''+dblcCia.TEXT+''' AND A.ANOMM='''+dblcPeriodo.TEXT+''''
        +' UNION '
        +' SELECT A.ECESTADO,A.RETNUMERO,A.FECPAGO,A.AUXID,B.PROVDES,B.PROVRUC ,''COMP. RETENCION'' AS DOCDES, '
        +' RTRIM(A.RETSERIE)||''-''||A.RETNUMERO  NUMERO, ''RETENCION'' AS TIPO, '
        +' CASE WHEN A.ECESTADO=''A'' THEN 0 ELSE A.MTORETLOC END DEBE, 0 AS HABE , '
        +' CASE WHEN A.ECESTADO=''A'' THEN A.MTOLOC ELSE '+DMTE.wReplacCeros+'(A.MTOLOC,0)-('+DMTE.wReplacCeros+'(A.MTOLOC,0)-'+DMTE.wReplacCeros+'(A.MTORETLOC,0))-'+DMTE.wReplacCeros+'(A.MTORETLOC,0) END SALDO,''3'' AS ORDEN,  A.ANOMM,A.NODOC AS NODOC  '
        +' FROM CNT320 A , TGE201 B , TGE112 C, CAJA302 D '
        +' WHERE A.AUXID=B.PROV AND C.FPAGOID=D.FPAGOID AND '
        +' A.CIAID=D.CIAID AND A.TDIARID=D.TDIARID   AND A.ANOMM=D.ECANOMM '
        +' AND A.ECNOCOMP=D.ECNOCOMP AND  A.CIARUC='+quotedstr(dblcCia.text)
        +' AND A.ANOMM='+quotedstr(dblcPeriodo.text); // +' order by AUXID';

	DMTE.cdsReporte.Close;
	DMTE.cdsReporte.DataRequest(xSQL);
	DMTE.cdsReporte.open;
   DMTE.cdsReporte.IndexFieldNames:='AUXID';
   DMTE.cdsReporte.First;
   while not DMTE.cdsReporte.EOF do
   begin
      if (DMTE.cdsReporte.FieldByName('ECESTADO').AsString='A')
            AND (DMTE.cdsReporte.FieldByName('ORDEN').AsString='1') then
      begin
         DMTE.cdsReporte.Edit;
         DMTE.cdsReporte.FieldByName('TIPO').AsString:='A N U L A D O';
         DMTE.cdsReporte.FieldByName('DEBE').AsFloat:=0;
         DMTE.cdsReporte.FieldByName('SALDO').AsFloat:=
                    DMTE.cdsReporte.FieldByName('SALDO').AsFloat+DMTE.cdsReporte.FieldByName('DEBE').AsFloat;
         DMTE.cdsReporte.Post;
      end;
      DMTE.cdsReporte.Next;
   end;

   xSQL:=' SELECT SUM(MTOLOC) MTOLOC, SUM(MTORETLOC) RETLOC FROM CNT320 '
        +' WHERE CIAID='+QuotedStr(dblcCia.TEXT)
        +' AND ANOMM='+QuotedStr(dblcPeriodo.TEXT)
        +' AND '+DMTE.wReplacCeros+'(ECESTADO,''NULO'')<>''A'' ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;

   ppDBRegretencion.DataSource:=DMTE.dsReporte;
   pprRegRetencion.DataPipeline:=ppDBRegretencion;

   pprRegRetencion.Template.FileName:=wRutaRpt + '\RegistroRetenciones.rtm';
   pprRegRetencion.Template.LoadFromFile;
//   pplblTotalBase.caption:=FloatToStrF(DMTE.cdsQry.FieldByName('MTOLOC').AsFloat,ffNumber,15,2);
//   pplblTotalRetenido.caption:=FloatToStrF(DMTE.cdsQry.FieldByName('RETLOC').AsFloat,ffNumber,15,2);
//   pplblCia.caption:=edtCia.text;

   ppd1.Report:=pprRegRetencion;
   ppd1.Show;
{   pprRegRetencion.print;
   pprRegRetencion.Stop;

	x10:=self.componentCount-1;
	while x10>0 do begin
		if self.components[x10].classname='TppGroup' then
      begin
			self.components[x10].free;
	   end;
      x10:=x10-1;
   end;
}
   DMTE.cdsReporte.IndexFieldNames:='';
end;

procedure TFToolRegRet.dblcCiaExit(Sender: TObject);
var
   xSQL : String;
begin
{   DMTE.cdsQry6.SetKey;
   DMTE.cdsQry6.FieldByName('CIARUC').AsString:=dblcCia.text;
   if not DMTE.cdsQry6.Gotokey then
   begin
      ShowMessage('RUC de Compañía no definido');
      dblcCia.SetFocus;
      exit;
   end;}
   edtCia.Text := DMTE.cdsQry6.Fieldbyname('CIADES').AsString;
   dblcPeriodo.SetFocus;
end;

procedure TFToolRegRet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMTE.cdsReporte.close;
end;

procedure TFToolRegRet.Z2bbtnLibRetenClick(Sender: TObject);
var
   sentencia,xSQL,xwhere, xAuxNomb, xDocAbr, xPagoAbr, xTipoTrans :string;
   x10,ipos,iposG,iposs,posicion,longitudd   : Integer;
   xMtoLoc, xDifCambio, xTCamProv : double;
   xMto1,xMto2,xMto3,xMto4:double;
   xRet : string;
   xLast:boolean;
begin
// Inicio HPC_201401_CAJA
// Se modifica para que siempre sea en formato A4
   sA4:='S';
// Fin HPC_201401_CAJA

   xLast:=false;
   if length(dblccia.text)=0 then
   begin
      Showmessage('Debe Seleccionar RUC de la Compañía');
      dblccia.setfocus;
      Exit;
   end;

   if length(dblcPeriodo.text)=0 then
   begin
      Showmessage('Debe Seleccionar el Año+Mes');
      dblcPeriodo.setfocus;
      exit;
   end;
   screen.Cursor:=crHourGlass;
	sentencia:=UpperCase(FConsulta.xfiltroCabRegRet.fMant.sql);
	longitudd:=length(sentencia);
	ipos:=pos('WHERE',sentencia);
	iposG:=pos('GROUP BY',sentencia);

	if ipos > 0 then
		xwhere:= copy(sentencia,ipos+5,(iposG-5)-ipos);

   if length(xWhere)>0 then xWhere:=' AND '+xWhere;
   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
   begin
      xSQL:=' SELECT A.CIAID,A.CIARUC,A.ECESTADO ESTADO,A.ECNOCOMP,A.FECEMI AS FECEMI,A.CLAUXID,A.AUXID,A.DOCID,A.SERIE,A.NODOC,RTRIM(A.SERIE)||''-''||A.NODOC AS '
           +' DOCUMENTO,B.AUXNOMB,A.TCAMB TCAMBPROV,A.TCAMB TCAMBRET,A.MTOLOC MONTOPROV,A.MTOLOC MONTOPAG,A.MTOEXT MONTOPAGME,'
           +' A.MTORETLOC MONTORET,  0.00 DIFCAMBIO, '
           +' A.FECPAGO AS FECPAGO,RTRIM(A.RETSERIE)||''-''||A.RETNUMERO RETNUMERO, '
           +' D.FPAGOID,E.DOCABR, D.ECNOCHQ ,F.FPAGOABR, G.CIADES  '
           +' FROM CNT320 A '
           +' LEFT JOIN TGE110 E ON A.DOCID=E.DOCID '
           +' LEFT JOIN TGE101 G ON A.CIAID=G.CIAID '
           +' LEFT JOIN CNT201 B ON A.CLAUXID=B.CLAUXID AND A.AUXID=B.AUXID '
           +' LEFT JOIN CAJA302 D ON A.CIAID=D.CIAID AND D.TDIARID=A.TDIARID AND  A.ANOMM=D.ECANOMM AND A.ECNOCOMP=D.ECNOCOMP '
           +' LEFT JOIN TGE112 F ON F.FPAGOID=D.FPAGOID '
           +' WHERE A.CIARUC='+QuotedStr(dblcCia.text)+' AND A.ANOMM='+QuotedStr(dblcPeriodo.text)+' '+xwhere;
      if ipos>0 then
         xSQL:=xSQL+' AND ';
      xSQL:=xSQL+' E.DOCMOD=''CXP'' ';
   end;

   if (DMTE.SRV_D = 'ORACLE') then
   begin
   // Inicio HPC_201401_CAJA
      xSQL:=' Select A.CIAID,A.CIARUC,A.ECESTADO ESTADO,A.ECNOCOMP,A.FECEMI AS FECEMI,A.CLAUXID,'
           +'        A.AUXID,A.DOCID,A.SERIE,A.NODOC,RTRIM(A.SERIE)||''-''||A.NODOC AS DOCUMENTO,'
           +'        B.AUXNOMB,A.TCAMB TCAMBPROV,A.TCAMB TCAMBRET,A.MTOLOC MONTOPROV,'
           +'        A.MTOLOC MONTOPAG,A.MTOEXT MONTOPAGME,'
           +'        A.MTORETLOC MONTORET,  0.00 DIFCAMBIO, '
           +'        A.FECPAGO AS FECPAGO,RTRIM(A.RETSERIE)||''-''||A.RETNUMERO RETNUMERO, '
           +'        D.FPAGOID,E.DOCABR, D.ECNOCHQ ,F.FPAGOABR, G.CIADES,  '
           +         quotedstr(datetostr(dtpFecRep.date))+' FECHA_REP '
           +'   from CNT320 A,TGE110 E,TGE101 G,CNT201 B,CAJA302 D,TGE112 F '
           +'  where F.FPAGOID(+)=D.FPAGOID AND A.CIAID=D.CIAID(+) '
           +'    and D.TDIARID(+)=A.TDIARID AND A.ANOMM=D.ECANOMM(+) '
           +'    and A.ECNOCOMP=D.ECNOCOMP(+) '
           +'    and A.CLAUXID=B.CLAUXID(+) AND A.AUXID=B.AUXID(+) '
           +'    and A.CIAID=G.CIAID(+) AND A.DOCID=E.DOCID(+) '
           +'    and A.CIARUC='+quotedStr(dblcCia.text)
           +'    and A.ANOMM='+QuotedStr(dblcPeriodo.text)+' '+xwhere;
   // Fin HPC_201401_CAJA
      if ipos>0 then
         xSQL:=xSQL+' and ';
      xSQL:=xSQL+' E.DOCMOD(+)=''CXP'' ';
   end;

// Inicio HPC_201401_CAJA
   xSQL:=' SELECT A.CIAID,A.CIARUC,'+quotedstr(edtCia.Text)+' CIADES,A.ECESTADO ESTADO,A.ECNOCOMP, '
        +'        A.FECEMI AS FECEMI,A.CLAUXID, '
        +'        A.AUXID,A.AUXRUC, A.ANOMM, ''MMMMMMMMMMMMMM'' PERIODODES, A.DOCID,A.SERIE, A.NODOC, '
        +'        RTRIM(A.SERIE)||''-''||A.NODOC AS DOCUMENTO, '
        +'        ''MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'' AUXNOMB,A.TCAMB TCAMBPROV,A.TCAMB TCAMBRET, '
        +'        A.MTOLOC MONTOPROV, A.MTOLOC MONTOPAG,A.MTOEXT MONTOPAGME, A.MTORETLOC MONTORET,  0.00 DIFCAMBIO, '
        +'        0.00 IMPPAGADO, ''MMMMMMMMMMMMMMM'' TIPOTRANS, '
        +'        A.FECPAGO AS FECPAGO,RTRIM(A.RETSERIE)||''-''||A.RETNUMERO RETNUMERO, '
        +'        D.FPAGOID,''MMMMMMMMMMMMMMM'' DOCABR, D.ECNOCHQ , ''MMMMMMMMMMMMMMM'' FPAGOABR, '
        +'      ( SELECT CXP301.CIAID '
        +'          FROM CXP301 '
        +'         WHERE A.CLAUXID = CXP301.CLAUXID '
        +'           AND A.AUXID = CXP301.PROV '
        +'           AND A.DOCID = CXP301.DOCID '
        +'           AND TRIM(LEADING '+QuotedStr('0')+' FROM A.SERIE) = TRIM(LEADING '+QuotedStr('0')+' FROM CXP301.CPSERIE) '
        +'           AND ROWNUM = 1 '
        +'           AND TRIM(LEADING '+QuotedStr('0')+' FROM A.NODOC) = TRIM(LEADING '+QuotedStr('0')+' FROM CXP301.CPNODOC) '
        +'           AND CXP301.CPESTADO <> '+QuotedStr('E')+' ) CXPCIAID, '
        +         quotedstr(datetostr(dtpFecRep.date))+' FECHA_REP, '
        +'        0.00 BASEIMP6, 0.00 MTORET6, 0.00 BASEIMP3, 0.00 MTORET3 '
        +'   FROM CNT320 A,CAJA302 D '
        +'  WHERE D.CIAID(+)=A.CIAID '
        +'    AND D.TDIARID(+)=A.TDIARID AND D.ECANOMM(+)=A.ANOMM '
        +'    AND D.ECNOCOMP(+)=A.ECNOCOMP '
        +'    AND A.CIARUC='+quotedStr(dblcCia.text)
        +'    AND A.ANOMM='+QuotedStr(dblcPeriodo.text);
  // MONTOPROV es el monto Total de la Provisión ej. S/.4,000.00
  // MONTOPAG es el monto bruto a pagar de la factura antes del calculo de la retención ej: S/.1,000.00
  // MONTOPAGME es el monto bruto a pagar de la factura en Moneda extranjera ej: 1000/3.485 = US$.286.94
  // MONTORET es el monto de la Retención del Pago a efectuar ej: 1000*6% = S/.60
  // IMPPAGADO es la monto neto a pagar Monto Bruto-Monto Retención ej: 1000-60=940


   if length(xWhere)>0 then
      xSQL := xSQL+' '+xWhere;

	DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(XSQL);
   DMTE.cdsReporte.open;
   DMTE.cdsReporte.IndexFieldNames:='RETNUMERO';

// Inicio HPC_201401_CAJA
   if DMTE.cdsReporte.RecordCount=0 then
      raise Exception.Create('No hay registros que mostrar');

   xnBaseImponible6 := 0;
   xnBaseImponible3 := 0;
   xnRetencion6 := 0;
   xnRetencion3 := 0;

   DMTE.cdsReporte.First;
   while not DMTE.cdsReporte.EOF do
   begin
      xMto1:=0; xMto2:=0; xMto3:=0;xMto4:=0;
      xRet:=DMTE.cdsReporte.FieldByName('RETNUMERO').AsString;

      while (not DMTE.cdsReporte.EOF) and (DMTE.cdsReporte.FieldByName('RETNUMERO').AsString=xRet) do
      begin
         if DMTE.cdsReporte.FieldByName('ESTADO').AsString='A' then
         begin
            DMTE.cdsReporte.Edit;
            DMTE.cdsReporte.FieldByName('AUXRUC').AsString    := '';
            DMTE.cdsReporte.FieldByName('AUXID').AsString     := '';

            DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat:=0;
            DMTE.cdsReporte.FieldByName('MONTORET').AsFloat:=0;
            DMTE.cdsReporte.FieldByName('MONTOPROV').AsFloat:=0;
            //INICIO SAR666
            DMTE.cdsReporte.FieldByName('MONTOPAGME').AsFloat:=0;
            //FIN SAR666
            DMTE.cdsReporte.FieldByName('DOCABR').AsString:='';
            DMTE.cdsReporte.FieldByName('DOCUMENTO').AsString:='A   N   U   L   A   D   O';
            DMTE.cdsReporte.FieldByName('AUXNOMB').AsString:='';
   //         DMTE.cdsReporte.FieldByName('ESTADO').AsString:='';
            DMTE.cdsReporte.FieldByName('FECEMI').Clear;
            DMTE.cdsReporte.FieldByName('FPAGOABR').AsString:='';
            DMTE.cdsReporte.FieldByName('ECNOCHQ').AsString:='';
            DMTE.cdsReporte.FieldByName('TIPOTRANS').AsString  := '';
            DMTE.cdsReporte.FieldByName('PERIODODES').AsString := wPeriodoDesc;
            DMTE.cdsReporte.Post;
         end
         else
         begin
            // RECUPERA EL NOMBRE DEL AUXILIAR
            xAuxNomb := ''; xDocAbr := ''; xPagoAbr := '';
            xWhere:='CLAUXID='+quotedstr(DMTE.cdsReporte.FieldByName('CLAUXID').AsString)
                +' and AUXID='+quotedstr(DMTE.cdsReporte.FieldByName('AUXID').AsString);
            xAuxNomb := DMTE.DisplayDescrip('prvTGE','CNT201','AUXNOMB',xWhere,'AUXNOMB');

            // RECUPERA LA ABREVIATURA DEL DOCUMENTO
            xWhere:='DOCMOD=''CXP'' AND DOCID='+quotedstr(DMTE.cdsReporte.FieldByName('DOCID').AsString);
            xDocAbr := DMTE.DisplayDescrip('prvTGE','TGE110','DOCABR',xWhere,'DOCABR');

            // RECUPERA LA FORMA DE PAGO DEL COMPROBANTE
            xWhere:='FPAGOID='+quotedstr(DMTE.cdsReporte.FieldByName('FPAGOID').AsString);
            xPagoAbr := DMTE.DisplayDescrip('prvTGE','TGE112','FPAGODES',xWhere,'FPAGODES');

            xWhere:='CIAID='+QuotedStr(DMTE.cdsReporte.FieldByName('CIAID').AsString)
                   +' and DOCID='+QuotedStr(DMTE.cdsReporte.FieldByName('DOCID').AsString)
                   +' and CPSERIE='+QuotedStr(DMTE.cdsReporte.FieldByName('SERIE').AsString)
                   +' and CPNODOC='+QuotedStr(DMTE.cdsReporte.FieldByName('NODOC').AsString)
                   +' and CLAUXID='+QuotedStr(DMTE.cdsReporte.FieldByName('CLAUXID').AsString)
                   +' and PROV='+QuotedStr(DMTE.cdsReporte.FieldByName('AUXID').AsString);

            xMtoLoc   := DMTE.cdsReporte.FieldByName('MONTOPROV').AsFloat;
            xTCamProv := DMTE.cdsReporte.FieldByName('TCAMBPROV').AsFloat;
            xDifCambio:= 0.00;
  // MONTOPROV es el monto Total de la Provisión ej. S/.4,000.00
  // MONTOPAG es el monto bruto a pagar de la factura antes del calculo de la retención ej: S/.1,000.00
            if DMTE.cdsReporte.FieldByName('MONTOPROV').AsFloat=DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat then
               xTipoTrans := 'Pago Total'
            else
               xTipoTrans := 'Pago Parcial';
            if length(DMTE.DisplayDescrip('prvTGE','CXP301','CPMTOORI,CPMTOLOC,CPTCAMPR,TMONID,CPTCAMDOL,CPTCAMAJ',xWhere,'CPMTOLOC'))>0 then
            begin
               //xMtoLoc := DMTE.cdsQry.FieldByName('CPMTOLOC').AsFloat;
            // Si la provisión es en otra Moneda Distinta a la Local y la Extranjera
               if (DMTE.cdsQry.FieldByName('TMONID').AsString<>DMTE.wTMonLoc) and
                  (DMTE.cdsQry.FieldByName('TMONID').AsString<>DMTE.wTMonExt) then
                  xTCamProv:=DMTE.cdsQry.FieldByName('CPTCAMDOL').AsFloat
               else
            // Si la provisión es en Moneda Extranjera
                  xTCamProv:=DMTE.cdsQry.FieldByName('CPTCAMAJ').AsFloat;

               if DMTE.cdsQry.FieldByName('TMONID').AsString<>DMTE.wTMonLoc then
               begin
                  xDifCambio := DMTE.FRound((DMTE.cdsReporte.FieldByName('MONTOPAGME').AsFloat
                               *DMTE.cdsReporte.FieldByName('TCAMBPROV').AsFloat*DMTE.xTasaPorce/100)
                               -(DMTE.cdsReporte.FieldByName('MONTORET').AsFloat),15,2);
               end;
            end;
            xMto2:=xMto2+DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat;
            xMto3:=xMto3+DMTE.cdsReporte.FieldByName('MONTORET').AsFloat;
            xMto4:=xMto2-xMto3;
            DMTE.cdsReporte.Edit;
            DMTE.cdsReporte.FieldByName('AUXNOMB').AsString    := xAuxNomb;
            DMTE.cdsReporte.FieldByName('DOCABR').AsString     := xDocAbr;
            DMTE.cdsReporte.FieldByName('FPAGOABR').AsString   := xPagoAbr;
            DMTE.cdsReporte.FieldByName('PERIODODES').AsString := wPeriodoDesc;
            DMTE.cdsReporte.FieldByName('TCAMBPROV').AsFloat   := xTCamProv;
            DMTE.cdsReporte.FieldByName('DIFCAMBIO').AsFloat   := xDifCambio;
            DMTE.cdsReporte.FieldByName('TIPOTRANS').AsString  := xTipoTrans;
            DMTE.cdsReporte.Post;

            DMTE.cdsReporte.Next;
            if (DMTE.cdsReporte.EOF) or (DMTE.cdsReporte.FieldByName('RETNUMERO').AsString<>xRet) then
               xLast := True
            else
               xLast := False;
            if not DMTE.cdsReporte.EOF then
               DMTE.cdsReporte.Prior
            else
               DMTE.cdsReporte.Last;
  // MONTOPROV es el monto Total de la Provisión ej. S/.4,000.00
  // MONTOPAG es el monto bruto a pagar de la factura antes del calculo de la retención ej: S/.1,000.00
  // MONTOPAGME es el monto bruto a pagar de la factura en Moneda extranjera ej: 1000/3.485 = US$.286.94
  // MONTORET es el monto de la Retención del Pago a efectuar ej: 1000*6% = S/.60
  // IMPPAGADO es la monto neto a pagar Monto Bruto-Monto Retención ej: 1000-60=940
            DMTE.cdsReporte.Edit;
            if not xLast then
            begin
         {1}   DMTE.cdsReporte.FieldByName('MONTOPROV').AsFloat   := xMtoLoc;
         {2}   DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat    := 0;
         {3}   DMTE.cdsReporte.FieldByName('MONTORET').AsFloat    := 0;
         {4}   DMTE.cdsReporte.FieldByName('IMPPAGADO').AsFloat   := 0;
            end
            else
            begin
         {1}   DMTE.cdsReporte.FieldByName('MONTOPROV').AsFloat   := xMtoLoc;
         {2}   DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat    := xMto2; //+DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat;
         {3}   DMTE.cdsReporte.FieldByName('MONTORET').AsFloat    := xMto3; //+DMTE.cdsReporte.FieldByName('MONTORET').AsFloat;
         {4}   DMTE.cdsReporte.FieldByName('IMPPAGADO').AsFloat   := xMto4; //+(DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat-DMTE.cdsReporte.FieldByName('MONTORET').AsFloat);
            end;
            DMTE.cdsReporte.Post;
         end;

         If DMTE.cdsReporte.FieldByName('FECEMI').Value >= '01/03/2014' then
         Begin
            xnBaseImponible3 := xnBaseImponible3 +  DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat ;
            xnRetencion3 := xnRetencion3 +  DMTE.cdsReporte.FieldByName('MONTORET').AsFloat;
         End
         Else
         Begin
            xnBaseImponible6 := xnBaseImponible6 +  DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat ;
            xnRetencion6 := xnRetencion6 +    DMTE.cdsReporte.FieldByName('MONTORET').AsFloat;
         End;
         DMTE.cdsReporte.Next;
      end; // while del número de retención
   end; // while general

   DMTE.cdsReporte.First;
   while not DMTE.cdsReporte.EOF do
   begin
      DMTE.cdsReporte.Edit;
      DMTE.cdsReporte.FieldByName('BASEIMP6').AsFloat := xnBaseImponible6;
      DMTE.cdsReporte.FieldByName('MTORET6').AsFloat := xnRetencion6;
      DMTE.cdsReporte.FieldByName('BASEIMP3').AsFloat := xnBaseImponible3;
      DMTE.cdsReporte.FieldByName('MTORET3').AsFloat := xnRetencion3;
      DMTE.cdsReporte.Post;
      DMTE.cdsReporte.Next;
   end;
   screen.Cursor:=crDefault;
// Fin HPC_201401_CAJA

   //INICIO SAR666
   If xbExportarExcel = True Then
   Begin
      fg_ExportarExcel( 'FORMATO1');
      Exit;
   End;
   //FIN SAR666
   ppdbRetA4.DataSource:=DMTE.dsReporte;
   pprRetA4.DataPipeline := ppdbRetA4;
   if sA4='S' then
      pprRetA4.TEMPLATE.FileName:=wRutaRpt + '\LibroRetencion_A4.rtm'
   else
      pprRetA4.TEMPLATE.FileName:=wRutaRpt + '\LibroRetencion.rtm';
   pprRetA4.template.LoadFromFile;

// Inicio HPC_201401_CAJA
   if cbDisenoRep.Checked then
   begin
      ppdRetA4.Report:=pprRetA4;
      ppdRetA4.ShowModal;
   end
   else
      pprRetA4.print;
// Fin HPC_201401_CAJA

   ppdRetA4.Report:=nil;


   (*ppDBRegretencion.DataSource:=DMTE.dsReporte;
   pprRegRetencion.DataPipeline:=ppDBRegretencion;
   if sA4='S' then
      pprRegRetencion.TEMPLATE.FileName:=wRutaRpt + '\LibroRetencion_A4.rtm'
   else
      pprRegRetencion.TEMPLATE.FileName:=wRutaRpt + '\LibroRetencion.rtm';
   pprRegRetencion.template.LoadFromFile ;

   if cbDisenoRep.Checked then
   begin
      ppd1.Report:=pprRegRetencion;
      ppd1.ShowModal;
   end
   else
      pprRegRetencion.print;

   ppd1.Report:=nil;  *)

// Inicio HPC_201401_CAJA
// Se restaura el default
   sA4:='N';
// Fin HPC_201401_CAJA

end;

procedure TFToolRegRet.Z2bbtnRevisaRetClick(Sender: TObject);
var
   sentencia,xSQL,xwhere:string;
   x10,ipos,iposG,iposs,posicion,longitudd   : Integer;
begin
   if length(dblccia.TEXT)=0 THEN
   begin
      Showmessage('Debe Seleccionar la Compañía');
      dblccia.setfocus;
      exit;
   end;

   if length(dblcPeriodo.TEXT)=0 THEN
   begin
      Showmessage('Debe Seleccionar el Año');
      dblcPeriodo.setfocus;
      exit;
   end;

	sentencia:=UpperCase(FConsulta.xfiltroCabRegRet.fMant.sql);
	longitudd:=length(sentencia);
	ipos:=pos('WHERE',sentencia);
	iposG:=pos('GROUP BY',sentencia);
	If ipos > 0 then
   	xwhere:= copy(sentencia,ipos+5,(iposG-5)-ipos);

   xWhere:=' AND '+xWhere;
   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
   begin
      xSQL:='SELECT A.CIAID, A.ECESTADO ESTADO, A.ECNOCOMP, A.FECEMI AS FECEMI, A.CLAUXID, A.AUXID, '
         +  'A.DOCID, A.SERIE, A.NODOC, RTRIM(A.SERIE)||''-''||A.NODOC AS DOCUMENTO, B.AUXNOMB, '
         +  'A.TCAMB TCAMBPROV, A.TCAMB TCAMBRET, A.MTOLOC MONTOPROV, A.MTOLOC MONTOPAG, A.MTOEXT MONTOPAGME, '
         +  'A.MTORETLOC MONTORET,  0.00 DIFCAMBIO, A.TMONIDFAC TMONID, M.TMONABR, A.TDIARID, '
         +' A.FECPAGO AS FECPAGO, RTRIM(A.RETSERIE)||''-''||A.RETNUMERO RETNUMERO, '
         +' D.FPAGOID, E.DOCABR, D.ECNOCHQ ,F.FPAGOABR, G.CIADES, A.AUXRUC '
         +' FROM CNT320 A '
         +' LEFT JOIN TGE110 E ON A.DOCID=E.DOCID '
         +' LEFT JOIN TGE101 G ON A.CIAID=G.CIAID '
         +' LEFT JOIN TGE103 M ON A.TMONIDFAC=M.TMONID '
         +' LEFT JOIN CNT201 B ON A.CLAUXID=B.CLAUXID AND A.AUXID=B.AUXID '
         +' LEFT JOIN CAJA302 D ON A.CIAID=D.CIAID AND D.TDIARID=A.TDIARID AND  A.ANOMM=D.ECANOMM AND A.ECNOCOMP=D.ECNOCOMP '
         +' LEFT JOIN TGE112 F ON F.FPAGOID=D.FPAGOID '
         +' WHERE A.CIAID='+QuotedStr(dblcCia.text)+' AND A.ANOMM='+QuotedStr(dblcPeriodo.text)+' '+xwhere;
         if ipos>0 then
            xSQL:=xSQL+' AND ';
      xSQL:=xSQL+' E.DOCMOD=''CXP'' ';
   end;
   if (DMTE.SRV_D = 'ORACLE') then
   begin
      xSQL:='SELECT A.CIAID, A.ECESTADO ESTADO, A.ECNOCOMP, A.FECEMI AS FECEMI, A.CLAUXID, A.AUXID, '
         +  'A.DOCID, A.SERIE, A.NODOC, RTRIM(A.SERIE)||''-''||A.NODOC AS DOCUMENTO, B.AUXNOMB, '
         +  'A.TCAMB TCAMBPROV, A.TCAMB TCAMBRET, A.MTOLOC MONTOPROV, A.MTOLOC MONTOPAG, A.MTOEXT MONTOPAGME, '
         +  'A.MTORETLOC MONTORET,  0.00 DIFCAMBIO, A.TMONIDFAC TMONID, M.TMONABR, A.TDIARID, '
         +' A.FECPAGO AS FECPAGO, RTRIM(A.RETSERIE)||''-''||A.RETNUMERO RETNUMERO, '
         +' D.FPAGOID, E.DOCABR, D.ECNOCHQ ,F.FPAGOABR, G.CIADES, A.AUXRUC '
         +' FROM CNT320 A,TGE110 E,TGE101 G,TGE103 M,CNT201 B,CAJA302 D,TGE112 F  '
         +' WHERE F.FPAGOID(+)=D.FPAGOID AND A.CIAID=D.CIAID(+) '
         +'   AND D.TDIARID(+)=A.TDIARID AND A.ANOMM=D.ECANOMM(+) '
         +'   AND A.ECNOCOMP=D.ECNOCOMP(+) '
         +'   and A.CLAUXID=B.CLAUXID(+) AND A.AUXID=B.AUXID(+) AND A.TMONIDFAC=M.TMONID(+)'
         +'   AND A.CIAID=G.CIAID(+) AND A.DOCID=E.DOCID(+) '
         +'   AND A.CIAID='+quotedStr(dblcCia.text)
         +'   AND A.ANOMM='+QuotedStr(dblcPeriodo.text)+' '+xwhere;
         if ipos>0 then
            xSQL:=xSQL+' AND ';
         xSQL:=xSQL+' E.DOCMOD(+)=''CXP'' ';
   end;

	DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(XSQL);
   DMTE.cdsReporte.open;
   DMTE.cdsReporte.First;
   while not DMTE.cdsReporte.EOF do
   begin
      if DMTE.cdsReporte.FieldByName('ESTADO').AsString='A' then
      begin
         DMTE.cdsReporte.Edit;
         DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat:=0;
         DMTE.cdsReporte.FieldByName('MONTORET').AsFloat:=0;
         DMTE.cdsReporte.FieldByName('MONTOPROV').AsFloat:=0;
         DMTE.cdsReporte.FieldByName('DOCABR').AsString:='';
         DMTE.cdsReporte.FieldByName('DOCUMENTO').AsString:='A N U L A D O';
         DMTE.cdsReporte.FieldByName('AUXNOMB').AsString:='';
         DMTE.cdsReporte.FieldByName('ESTADO').AsString:='';
         DMTE.cdsReporte.FieldByName('FECEMI').Clear;
         DMTE.cdsReporte.FieldByName('FPAGOABR').AsString:='';
         DMTE.cdsReporte.FieldByName('ECNOCHQ').AsString:='';
         DMTE.cdsReporte.Post;
      end
      else
      begin
         xWhere:='CIAID='+QuotedStr(DMTE.cdsReporte.FieldByName('CIAID').AsString)
                +' AND DOCID='+QuotedStr(DMTE.cdsReporte.FieldByName('DOCID').AsString)
                +' AND CPSERIE='+QuotedStr(DMTE.cdsReporte.FieldByName('SERIE').AsString)
                +' AND CPNODOC='+QuotedStr(DMTE.cdsReporte.FieldByName('NODOC').AsString)
                +' AND CLAUXID='+QuotedStr(DMTE.cdsReporte.FieldByName('CLAUXID').AsString)
                +' AND PROV='+QuotedStr(DMTE.cdsReporte.FieldByName('AUXID').AsString)
                +' AND (CPESTADO=''P'' OR CPESTADO=''C'' )';
         if length(DMTE.DisplayDescrip('prvTGE','CXP301','CPMTOLOC,CPTCAMPR,TMONID,CPTCAMDOL,CPTCAMAJ',xWhere,'CPMTOLOC'))>0 then
         begin
            DMTE.cdsReporte.Edit;
            DMTE.cdsReporte.FieldByName('MONTOPROV').AsFloat:=DMTE.cdsQry.FieldByName('CPMTOLOC').AsFloat;
         // Si la provisión es en otra Moneda Distinta a la Local y la Extranjera
            if (DMTE.cdsQry.FieldByName('TMONID').AsString<>DMTE.wTMonLoc) and
               (DMTE.cdsQry.FieldByName('TMONID').AsString<>DMTE.wTMonExt) then
               DMTE.cdsReporte.FieldByName('TCAMBPROV').AsFloat:=DMTE.cdsQry.FieldByName('CPTCAMDOL').AsFloat
            else
         // Si la provisión es en Moneda Extranjera
               DMTE.cdsReporte.FieldByName('TCAMBPROV').AsFloat:=DMTE.cdsQry.FieldByName('CPTCAMAJ').AsFloat;

            if DMTE.cdsQry.FieldByName('TMONID').AsString<>DMTE.wTMonLoc then
            begin
               DMTE.cdsReporte.FieldByName('DIFCAMBIO').AsFloat:=
               DMTE.FRound((DMTE.cdsReporte.FieldByName('MONTOPAGME').AsFloat
                       *DMTE.cdsReporte.FieldByName('TCAMBPROV').AsFloat*DMTE.xTasaPorce/100)
                       -(DMTE.cdsReporte.FieldByName('MONTORET').AsFloat),15,2);
            end;
            DMTE.cdsReporte.Post;
         end;
      end;
      DMTE.cdsReporte.Next;
   end;
   if rgOrden.ItemIndex=0 then
      DMTE.cdsReporte.IndexFieldNames:='RETNUMERO'
   else
      DMTE.cdsReporte.IndexFieldNames:='CLAUXID;AUXID;RETNUMERO';

   if DMTE.cdsReporte.RecordCount=0 then
      Raise Exception.Create('No hay registros que mostrar');

   ppdbpLCR.DataSource:=DMTE.dsReporte;

   pprComprobante.TEMPLATE.FileName:=wRutaRpt + '\LibroComprobanteRetIGV.rtm';
   pprComprobante.template.LoadFromFile ;
   pplblPeriodo2.caption:=DMTE.NombreAnoMes(dblcPeriodo.text);
   pprComprobante.print;
end;

procedure TFToolRegRet.Z2bbtnImpBloqueClick(Sender: TObject);
var
	xSQL : String;
	x10  : Integer;
   cad  : string;
begin
   cad:='';
   DMTE.cdsQry3.Data:=FConsulta.xfiltroCabRegRet.FMant.cds2.data;
   DMTE.cdsQry3.First;
   while not DMTE.cdsQry3.EOF do
   begin
      cad:=cad
			+' (A.CIAID='+QuotedStr(DMTE.cdsQry3.FieldByName('CIAID').AsString)+' AND '
			+' A.ANOMM='+QuotedStr(DMTE.cdsQry3.FieldByName('ANOMM').AsString)+' AND '
			+' A.TDIARID='+QuotedStr(DMTE.cdsQry3.FieldByName('TDIARID').AsString)+' AND '
			+' A.ECNOCOMP='+QuotedStr(DMTE.cdsQry3.FieldByName('ECNOCOMP').AsString)+') ';
      DMTE.cdsQry3.Next;
      if (DMTE.cdsQry3.RecordCount>0) AND (not DMTE.cdsQry3.EOF) then
      begin
         cad:=cad+'OR ';
      end;
   end;
   cad:='('+cad+')';
	xSQL:='Select A.*, C.DOCABR DOCDESC, B.AUXNOMB, B.AUXDIR,D.CIADES, D.CIARUC '
		  +'from CNT320 A, CNT201 B, TGE110 C, TGE101 D '
		  +'WHERE '+cad
		  +  ' AND A.CLAUXID=B.CLAUXID AND A.AUXID=B.AUXID '
		  +  'AND C.DOCMOD=''CXP'' AND C.DOCID=A.DOCID '
		  +  'AND D.CIAID=A.CIAID '
		  +'ORDER BY A.CLAUXID, A.AUXID, A.DOCID, A.SERIE, NODOC';

	DMTE.cdsRetencion.Close;
	DMTE.cdsRetencion.Datarequest( xSQL );
	DMTE.cdsRetencion.Open;

	if DMTE.cdsRetencion.RecordCount<=0 then begin
		ShowMessage('No Existe Retención');
		Exit;
	end;
  DMTE.cdsRetencion.IndexFieldNames := 'RETNUMERO;CLAUXID;AUXID;DOCID;SERIE;NODOC';
  ppdbRetencion.DataSource:=DMTE.dsRetencion;
	pprRetencion.TEMPLATE.FileName:=DMTE.wRutaCNT + '\RetencionesBloque.rtm';
	pprRetencion.template.LoadFromFile ;

// Inicio HPC_201401_CAJA
   //if DMTE.wUsuario='HNORIEGA' then
   if cbDisenoRep.Checked then
// Fin HPC_201401_CAJA
   begin
      ppd1.Report:=pprRetencion;
      ppd1.Show;
   end
   else
   begin
      pprRetencion.Print;
      pprRetencion.Stop;

      x10:=DMTE.ComponentCount-1;
      while x10>0 do begin
         if DMTE.components[x10].classname='TppGroup' then
         begin
            DMTE.components[x10].free;
         end;
         x10:=x10-1;
      end;
      ppdbRetencion.DataSource:=NIL;
   end;
end;

procedure TFToolRegRet.dblcCiaEnter(Sender: TObject);
begin
   dblcCia.Selected.Clear;
   dblcCia.Selected.Add('CIARUC'#9'15'#9'R.U.C.'#9'F');
   dblcCia.Selected.Add('CIADES'#9'30'#9'Descripción'#9'F');
end;

procedure TFToolRegRet.dblcPeriodoEnter(Sender: TObject);
begin
   dblcPeriodo.LookupTable:=DMTE.cdsConsulta;
   dblcPeriodo.Selected.Clear;
   dblcPeriodo.Selected.Add('ANOMES'#9'8'#9'Año+Mes'#9'F');
end;

procedure TFToolRegRet.dblcPeriodoExit(Sender: TObject);
begin
   wPeriodoDesc := DMTE.NombreAnoMes(dblcPeriodo.Text);
// Inicio HPC_201401_CAJA
   dtpFecRep.date := DateS;
// Fin HPC_201401_CAJA
end;

procedure TFToolRegRet.Z2bbtnTxPDTClick(Sender: TObject);
var sSQL:string;
    sNatu,sJuri:string;
begin
   if length(dblccia.text)=0 then
   begin
      Showmessage('Debe Seleccionar RUC de la Compañía');
      dblccia.setfocus;
      Exit;
   end;

   if length(dblcPeriodo.text)=0 then
   begin
      Showmessage('Debe Seleccionar el Año+Mes');
      dblcPeriodo.setfocus;
      exit;
   end;

  DMTE.cdsReporte.Filter:='';
  DMTE.cdsReporte.Filtered:=False;
  DMTE.cdsReporte.IndexFieldNames:='';

  sSQL:='SELECT ''1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'' GLOSA FROM TGE901 WHERE DUME=''CLG'' ';
  DMTE.FiltraCds(DMTE.cdsReporte,sSQL);

  sC.Lines.Clear;
  sSQL:='SELECT * FROM TGE109 WHERE TIPPERS=''S'' ';
  DMTE.FiltraCds(DMTE.cdsQry,sSQL);
  sNatu:=DMTE.cdsQry.FieldByName('TIPPERID').AsString;

  sSQL:='SELECT * FROM TGE109 WHERE TIPPERS=''N'' ';
  DMTE.FiltraCds(DMTE.cdsQry,sSQL);
  sJuri:=DMTE.cdsQry.FieldByName('TIPPERID').AsString;

// Inicio HPC_201602_CAJA
// Se añade serie a la búsqueda que genera archivo para PDT 626
  {
  if DMTE.SRV_D = 'ORACLE' then
  sSQL:= ' SELECT RUC||''|''||RAZONSOCIAL||''|''||APELLIDOPATERNO||''|''||APELLIDOMATERNO||''|''||NOMBRES||''|''||RETSERIE||''|''||RETNUMERO||''|''||EMISIONRET|| '+
   ' ''|''||TRIM(TO_CHAR(MONTOPAGO,''999999999999.00''))||''|''||TIPOCOMPROB||''|''||SERIECOMPROB||''|''||NROCOMPROB||''|''||EMISIONCOMPROB||''|''||TRIM(TO_CHAR(MTOLOC,''999999999999.00''))||''|'' XSQL, '+
   ' RAZONSOCIAL,NOMBRES,APELLIDOMATERNO,APELLIDOPATERNO,TIPPERID,AUXID,PROVDES FROM ( '+
   ' SELECT TIPPERID,AUXID,PROVDES,SUBSTR(A.AUXRUC,1,11) RUC,CASE WHEN B.TIPPERID='+QuotedStr(sJuri)+' THEN SUBSTR(PROVDES,1,40) ELSE '''' END RAZONSOCIAL, '+
   ' CASE WHEN B.TIPPERID='+QuotedStr(sNatu)+' THEN SUBSTR(PROVAPEPAT,1,20) ELSE '''' END APELLIDOPATERNO, '+
   ' CASE WHEN B.TIPPERID='+QuotedStr(sNatu)+' THEN SUBSTR(PROVAPEMAT,1,20) ELSE '''' END APELLIDOMATERNO, '+
   ' CASE WHEN B.TIPPERID='+QuotedStr(sNatu)+' THEN SUBSTR(PROVNOMBRE,1,20) ELSE '''' END NOMBRES,SUBSTR(A.RETSERIE,1,4) RETSERIE, '+
   ' SUBSTR(A.RETNUMERO,3,8) RETNUMERO,TO_CHAR(A.FECPAGO,'+QuotedStr(DMTE.wFormatFecha)+') EMISIONRET, C.MTOLOC MONTOPAGO, A.DOCID TIPOCOMPROB, '+
   ' SUBSTR(A.SERIE,1,4) SERIECOMPROB, SUBSTR(A.NODOC,1,8) NROCOMPROB,TO_CHAR(A.FECEMI,'+QuotedStr(DMTE.wFormatFecha)+') EMISIONCOMPROB, '+
   // VHNDEMA
   ' CASE WHEN A.DOCID=''07'' THEN A.MTOLOC*(-1) ELSE A.MTOLOC END MTOLOC '+
   // END VHNDEMA
   ' FROM CNT320 A, TGE201 B, '+
   ' (SELECT RETNUMERO,SUM(C.MTOLOC)  MTOLOC FROM CNT320 C GROUP BY RETNUMERO) C '+
   ' WHERE A.CLAUXID=B.CLAUXID AND A.AUXID=B.PROV AND A.CIARUC='+QuotedStr(dblcCia.text)+' AND A.ANOMM='+QuotedStr(dblcPeriodo.text)+
   ' AND NVL(A.ECESTADO,''X'')<>''A'' AND A.RETNUMERO=C.RETNUMERO)X '
  else
  if (DMTE.SRV_D = 'DB2NT') or
   	 (DMTE.SRV_D = 'DB2400') then
    // FALTA REVISAR PARA ORACLE
  sSQL:= ' SELECT RUC||''|''||RAZONSOCIAL||''|''||APELLIDOPATERNO||''|''||APELLIDOMATERNO||''|''||NOMBRES||''|''||RETSERIE||''|''||RETNUMERO||''|''||EMISIONRET|| '+
   ' ''|''||TRIM(TO_CHAR(MONTOPAGO,''999999999999.00''))||''|''||TIPOCOMPROB||''|''||SERIECOMPROB||''|''||NROCOMPROB||''|''||EMISIONCOMPROB||''|''||TRIM(TO_CHAR(MTOLOC,''999999999999.00''))||''|'' XSQL FROM ( '+
   ' SELECT SUBSTR(A.AUXRUC,1,11) RUC,CASE WHEN B.TIPPERID='+QuotedStr(sJuri)+' THEN SUBSTR(PROVDES,1,40) ELSE '''' END RAZONSOCIAL, '+
   ' CASE WHEN B.TIPPERID='+QuotedStr(sNatu)+' THEN SUBSTR(PROVAPEPAT,1,20) ELSE '''' END APELLIDOPATERNO, '+
   ' CASE WHEN B.TIPPERID='+QuotedStr(sNatu)+' THEN SUBSTR(PROVAPEMAT,1,20) ELSE '''' END APELLIDOMATERNO, '+
   ' CASE WHEN B.TIPPERID='+QuotedStr(sNatu)+' THEN SUBSTR(PROVNOMBRE,1,20) ELSE '''' END NOMBRES,SUBSTR(A.RETSERIE,1,4) RETSERIE, '+
   ' SUBSTR(A.RETNUMERO,3,8) RETNUMERO,TO_CHAR(A.FECPAGO,'+QuotedStr(DMTE.wFormatFecha)+') EMISIONRET, C.MTOLOC MONTOPAGO, A.DOCID TIPOCOMPROB, '+
   ' SUBSTR(A.SERIE,1,4) SERIECOMPROB, SUBSTR(A.NODOC,1,8) NROCOMPROB,TO_CHAR(A.FECEMI,'+QuotedStr(DMTE.wFormatFecha)+') EMISIONCOMPROB, '+
   ' A.MTOLOC MTOLOC '+
   ' FROM CNT320 A, TGE201 B, '+
   ' (SELECT RETNUMERO,SUM(C.MTOLOC)  MTOLOC FROM CNT320 C GROUP BY RETNUMERO) C '+
   ' WHERE A.CLAUXID=B.CLAUXID AND A.AUXID=B.PROV AND A.CIARUC='+QuotedStr(dblcCia.text)+' AND A.ANOMM='+QuotedStr(dblcPeriodo.text)+
   ' AND NVL(A.ECESTADO,''X'')<>''A'' AND A.RETNUMERO=C.RETNUMERO)X ';
  }
  sSQL:= ' Select RUC||''|''||RAZONSOCIAL||''|''||APELLIDOPATERNO||''|''||APELLIDOMATERNO|| '
     +   '        ''|''||NOMBRES||''|''||RETSERIE||''|''||RETNUMERO||''|''||EMISIONRET|| '
     +   '        ''|''||trim(to_char(MONTOPAGO,''999999999999.00''))||''|''||TIPOCOMPROB|| '
     +   '        ''|''||SERIECOMPROB||''|''||NROCOMPROB||''|''||EMISIONCOMPROB|| '
     +   '        ''|''||trim(to_char(MTOLOC,''999999999999.00''))||''|'' XSQL, '
     +   '        RAZONSOCIAL, NOMBRES, APELLIDOMATERNO, APELLIDOPATERNO, TIPPERID, AUXID, '
     +   '        PROVDES '
     +   '   from (Select TIPPERID, AUXID, PROVDES, SUBSTR(A.AUXRUC,1,11) RUC, '
     +   '                case when B.TIPPERID='+QuotedStr(sJuri)
     +   '                     then SUBSTR(PROVDES,1,40) else '''' end RAZONSOCIAL, '
     +   '                case when B.TIPPERID='+QuotedStr(sNatu)
     +   '                     then SUBSTR(PROVAPEPAT,1,20) else '''' end APELLIDOPATERNO, '
     +   '                case when B.TIPPERID='+QuotedStr(sNatu)
     +   '                     then SUBSTR(PROVAPEMAT,1,20) else '''' end APELLIDOMATERNO, '
     +   '                case when B.TIPPERID='+QuotedStr(sNatu)
     +   '                     then SUBSTR(PROVNOMBRE,1,20) else '''' end NOMBRES, '
     +   '                substr(A.RETSERIE,1,4) RETSERIE, '
     +   '                substr(A.RETNUMERO,3,8) RETNUMERO, '
     +   '                to_char(A.FECPAGO,'+QuotedStr(DMTE.wFormatFecha)+') EMISIONRET, '
     +   '                C.MTOLOC MONTOPAGO, A.DOCID TIPOCOMPROB, '
     +   '                substr(A.SERIE,1,4) SERIECOMPROB, substr(A.NODOC,1,8) NROCOMPROB, '
     +   '                to_char(A.FECEMI,'+QuotedStr(DMTE.wFormatFecha)+') EMISIONCOMPROB, '
     +   '                case when A.DOCID=''07'' then A.MTOLOC*(-1) else A.MTOLOC end MTOLOC '
     +   '           from CNT320 A, TGE201 B, '
// Inicio HPC_201603_CAJA
// Se incluye campo RETSERIE a subconculta C
     +   '               (Select RETSERIE,RETNUMERO, sum(C.MTOLOC) MTOLOC '
     +   '                  from CNT320 C '
     +   '                 where C.ANOMM='+QuotedStr(dblcPeriodo.text)
     +   '                   and nvl(ECESTADO,''X'')<>''A'' '
     +   '                 group by RETSERIE,RETNUMERO) C '
// Fin HPC_201603_CAJA
     +   '          where A.CLAUXID=B.CLAUXID AND A.AUXID=B.PROV '
     +   '            and A.CIARUC='+QuotedStr(dblcCia.text)
     +   '            and A.ANOMM='+QuotedStr(dblcPeriodo.text)
     +   '            and nvl(A.ECESTADO,''X'')<>''A'' '
     +   '            and A.RETSERIE=C.RETSERIE and A.RETNUMERO=C.RETNUMERO)X ';
// Fin HPC_201602_CAJA

  DMTE.cdsQry.Close;
  DMTE.cdsQry.DataRequest(sSQL);
  DMTE.cdsQry.Open;
  DMTE.cdsQry.First;
  while not DMTE.cdsQry.EOF do
  begin
     if DMTE.cdsQry.FieldByName('TIPPERID').AsString='' then
     begin
       {Raise Exception.Create('El proveedor '+DMTE.cdsQry.FieldByName('AUXID').AsString+' '+DMTE.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Tipo de Persona.'+#13+
               'Actualice Maestro de Proveedores ');
       }
       DMTE.cdsReporte.Append;
       DMTE.cdsReporte.FieldByName('GLOSA').AsString:='El proveedor '+DMTE.cdsQry.FieldByName('AUXID').AsString+' '+DMTE.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Tipo de Persona.';
       DMTE.cdsReporte.Post;
     end;

     if DMTE.cdsQry.FieldByName('TIPPERID').AsString=sNatu then
     begin
        if DMTE.cdsQry.FieldByName('APELLIDOPATERNO').AsString='' then
        begin
          {Raise Exception.Create('El proveedor '+DMTE.cdsQry.FieldByName('AUXID').AsString+' '+DMTE.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Apellido Paterno.'+#13+
                  'Actualice Maestro de Proveedores ');}
          DMTE.cdsReporte.Append;
          DMTE.cdsReporte.FieldByName('GLOSA').AsString:='El proveedor '+DMTE.cdsQry.FieldByName('AUXID').AsString+' '+DMTE.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Apellido Paterno.';
          DMTE.cdsReporte.Post;
        end;
        if DMTE.cdsQry.FieldByName('APELLIDOMATERNO').AsString='' then
        begin
          {Raise Exception.Create('El proveedor '+DMTE.cdsQry.FieldByName('AUXID').AsString+' '+DMTE.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Apellido Materno.'+#13+
                  'Actualice Maestro de Proveedores ');}
          DMTE.cdsReporte.Append;
          DMTE.cdsReporte.FieldByName('GLOSA').AsString:='El proveedor '+DMTE.cdsQry.FieldByName('AUXID').AsString+' '+DMTE.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Apellido Materno.';
          DMTE.cdsReporte.Post;
        end;
        if DMTE.cdsQry.FieldByName('NOMBRES').AsString='' then
        begin
          {Raise Exception.Create('El proveedor '+DMTE.cdsQry.FieldByName('AUXID').AsString+' '+DMTE.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Nombres.'+#13+
                  'Actualice Maestro de Proveedores ');}
          DMTE.cdsReporte.Append;
          DMTE.cdsReporte.FieldByName('GLOSA').AsString:='El proveedor '+DMTE.cdsQry.FieldByName('AUXID').AsString+' '+DMTE.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Nombres.';
          DMTE.cdsReporte.Post;
        end;
     end;

     if DMTE.cdsQry.FieldByName('TIPPERID').AsString=sJuri then
     begin
        if DMTE.cdsQry.FieldByName('RAZONSOCIAL').AsString='' then
        begin
          {Raise Exception.Create('El proveedor '+DMTE.cdsQry.FieldByName('AUXID').AsString+' '+DMTE.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Razón Social.'+#13+
                  'Actualice Maestro de Proveedores ');}
          DMTE.cdsReporte.Append;
          DMTE.cdsReporte.FieldByName('GLOSA').AsString:='El proveedor '+DMTE.cdsQry.FieldByName('AUXID').AsString+' '+DMTE.cdsQry.FieldByName('PROVDES').AsString+' No Tiene Razón Social.';
          DMTE.cdsReporte.Post;
        end;
     end;

     sC.Lines.Add(DMTE.cdsQry.FieldByName('XSQL').AsString);
     DMTE.cdsQry.Next;
  end;
  if DMTE.cdsReporte.RecordCount>0 then
  begin
    ppReport.Template.FileName := wRutaRpt+'\TxRetencionPDT.rtm' ;
    ppReport.Template.LoadFromFile;
    pplblCiaRetPdt.Caption:=edtCia.text;
    ppDBReport.DataSource:=DMTE.dsReporte;
    ppReport.DataPipeline:=ppDBReport;
    ppReport.Print;
  end
  else
  begin
     sd.Filename:='0626'+dblcCia.text+dblcPeriodo.text;
     if sd.execute then
     begin
       sC.Lines.SaveToFile(sd.filename);
     end;
  end;

end;

procedure TFToolRegRet.ppReportPreviewFormClose(Sender: TObject);
begin
   ppReport.PreviewForm.WindowState:=WsMaximized;
   TppViewer(ppReport.PreviewForm.Viewer).ZoomSetting:=zsPagewidth;
end;

procedure TFToolRegRet.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFToolRegRet.ppDBCalc10Print(Sender: TObject);
begin
   ppDBCalc6.Value:=ppDBCalc10.Value;
   ppTotal.Value:=ppDBCalc11.Value;
end;

procedure TFToolRegRet.pprRetencionPreviewFormCreate(Sender: TObject);
begin
  pprRetencion.PreviewForm.ClientHeight := 580;
  pprRetencion.PreviewForm.ClientWidth := 780;			// ppViewr
  tppviewer(pprRetencion.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFToolRegRet.bbtnRetProvClick(Sender: TObject);
var
   sentencia,xSQL,xwhere, xAuxNomb, xDocAbr, xPagoAbr, xTipoTrans :string;
   x10,ipos,iposG,iposs,posicion,longitudd   : Integer;
   xMtoLoc, xDifCambio, xTCamProv : double;
   xMto1,xMto2,xMto3,xMto4:double;
   xRet : string;
   xLast:boolean;
begin
   xLast:=false;
   if length(dblccia.text)=0 then
   begin
      Showmessage('Debe Seleccionar RUC de la Compañía');
      dblccia.setfocus;
      Exit;
   end;

   if dtpDesde.Date=0 then
   begin
      ShowMessage('Mensaje : Ingrese Fecha Inicio...');
      Exit;
   end;

   if dtpHasta.Date=0 then
   begin
      ShowMessage('Mensaje : Ingrese Fecha Final...');
      Exit;
   end;

   if dtpDesde.Date>dtpHasta.Date then
   begin
      ShowMessage('Mensaje : Fecha de Inicio NO puede ser mayor a Fecha Final ...');
      Exit;
   end;


   screen.Cursor:=crHourGlass;
	 sentencia:=UpperCase(FConsulta.xfiltroCabRegRet.fMant.sql);
	 longitudd:=length(sentencia);
	 ipos:=pos('WHERE',sentencia);
	 iposG:=pos('GROUP BY',sentencia);

	 if ipos > 0 then
	   	xwhere:= copy(sentencia,ipos+5,(iposG-5)-ipos);

   if length(xWhere)>0 then xWhere:=' AND '+xWhere;

   if pos('AUXID',xwhere)<=0 then
   begin
      ShowMessage('Mensaje : Falta Seleccionar Auxiliar...');
      Exit;
   end;


   xSQL:=' SELECT A.CIAID,A.CIARUC,'+quotedstr(edtCia.Text)+' CIADES,A.ECESTADO ESTADO,A.ECNOCOMP,'
           +'A.FECEMI AS FECEMI,A.CLAUXID,'
           +' A.AUXID,A.AUXRUC, A.ANOMM, ''MMMMMMMMMMMMMM'' PERIODODES, A.DOCID,A.SERIE,A.NODOC,RTRIM(A.SERIE)||''-''||A.NODOC AS DOCUMENTO,'
           +' ''MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM'' AUXNOMB,A.TCAMB TCAMBPROV,A.TCAMB TCAMBRET, '
           +' A.MTOLOC MONTOPROV, A.MTOLOC MONTOPAG,A.MTOEXT MONTOPAGME, A.MTORETLOC MONTORET,  0.00 DIFCAMBIO, '
           +' 0.00 IMPPAGADO, ''MMMMMMMMMMMMMMM'' TIPOTRANS, '
           +' A.FECPAGO AS FECPAGO,RTRIM(A.RETSERIE)||''-''||A.RETNUMERO RETNUMERO, '
           +' D.FPAGOID,''MMMMMMMMMMMMMMM'' DOCABR, D.ECNOCHQ , ''MMMMMMMMMMMMMMM'' FPAGOABR,  '
           +' ''FECHA INICIO '+dtpDesde.Text+' FINAL '+dtpHasta.Text+''' RANGO'
           +' FROM CNT320 A,CAJA302 D '
           +' WHERE D.CIAID(+)=A.CIAID '
           +'   AND D.TDIARID(+)=A.TDIARID AND D.ECANOMM(+)=A.ANOMM '
           +'   AND D.ECNOCOMP(+)=A.ECNOCOMP '
           +'   AND A.CIARUC='+quotedStr(dblcCia.text)
           +'   AND A.FECEMI>='+quotedStr(dtpDesde.Text)+' and A.FECEMI<='+quotedStr(dtpHasta.Text);
   // MONTOPROV es el monto Total de la Provisión ej. S/.4,000.00
   // MONTOPAG es el monto bruto a pagar de la factura antes del calculo de la retención ej: S/.1,000.00
   // MONTOPAGME es el monto bruto a pagar de la factura en Moneda extranjera ej: 1000/3.485 = US$.286.94
   // MONTORET es el monto de la Retención del Pago a efectuar ej: 1000*6% = S/.60
   // IMPPAGADO es la monto neto a pagar Monto Bruto-Monto Retención ej: 1000-60=940

   if length(xWhere)>0 then
      xSQL := xSQL+' '+xWhere;

	 DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(XSQL);
   DMTE.cdsReporte.open;
   DMTE.cdsReporte.IndexFieldNames:='RETNUMERO';
   DMTE.cdsReporte.First;
   while not DMTE.cdsReporte.EOF do
   begin
      xMto1:=0; xMto2:=0; xMto3:=0;xMto4:=0;
      xRet:=DMTE.cdsReporte.FieldByName('RETNUMERO').AsString;
      while (not DMTE.cdsReporte.EOF) and (DMTE.cdsReporte.FieldByName('RETNUMERO').AsString=xRet) do
      begin
         if DMTE.cdsReporte.FieldByName('ESTADO').AsString='A' then
         begin
            DMTE.cdsReporte.Edit;
            DMTE.cdsReporte.FieldByName('AUXRUC').AsString    :='';
            DMTE.cdsReporte.FieldByName('AUXID').AsString     :='';

            DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat   :=0;
            DMTE.cdsReporte.FieldByName('MONTORET').AsFloat   :=0;
            DMTE.cdsReporte.FieldByName('MONTOPROV').AsFloat  :=0;
            DMTE.cdsReporte.FieldByName('DOCABR').AsString    :='';
            DMTE.cdsReporte.FieldByName('DOCUMENTO').AsString :='A   N   U   L   A   D   O';
            DMTE.cdsReporte.FieldByName('AUXNOMB').AsString   :='';
            DMTE.cdsReporte.FieldByName('FECEMI').Clear;
            DMTE.cdsReporte.FieldByName('FPAGOABR').AsString  :='';
            DMTE.cdsReporte.FieldByName('ECNOCHQ').AsString   :='';
            DMTE.cdsReporte.FieldByName('TIPOTRANS').AsString :='';
            DMTE.cdsReporte.FieldByName('PERIODODES').AsString:=wPeriodoDesc;
            DMTE.cdsReporte.Post;
         end
         else
         begin
            // RECUPERA EL NOMBRE DEL AUXILIAR
            xAuxNomb := ''; xDocAbr := ''; xPagoAbr := '';
            xWhere:='CLAUXID='+quotedstr(DMTE.cdsReporte.FieldByName('CLAUXID').AsString)
                +' and AUXID='+quotedstr(DMTE.cdsReporte.FieldByName('AUXID').AsString);
            xAuxNomb := DMTE.DisplayDescrip('prvTGE','CNT201','AUXNOMB',xWhere,'AUXNOMB');

            // RECUPERA LA ABREVIATURA DEL DOCUMENTO
            xWhere:='DOCMOD=''CXP'' AND DOCID='+quotedstr(DMTE.cdsReporte.FieldByName('DOCID').AsString);
            xDocAbr := DMTE.DisplayDescrip('prvTGE','TGE110','DOCABR',xWhere,'DOCABR');

            // RECUPERA LA FORMA DE PAGO DEL COMPROBANTE
            xWhere:='FPAGOID='+quotedstr(DMTE.cdsReporte.FieldByName('FPAGOID').AsString);
            xPagoAbr := DMTE.DisplayDescrip('prvTGE','TGE112','FPAGODES',xWhere,'FPAGODES');

            xWhere:='CIAID='+QuotedStr(DMTE.cdsReporte.FieldByName('CIAID').AsString)
                   +' and DOCID='+QuotedStr(DMTE.cdsReporte.FieldByName('DOCID').AsString)
                   +' and CPSERIE='+QuotedStr(DMTE.cdsReporte.FieldByName('SERIE').AsString)
                   +' and CPNODOC='+QuotedStr(DMTE.cdsReporte.FieldByName('NODOC').AsString)
                   +' and CLAUXID='+QuotedStr(DMTE.cdsReporte.FieldByName('CLAUXID').AsString)
                   +' and PROV='+QuotedStr(DMTE.cdsReporte.FieldByName('AUXID').AsString);

            xMtoLoc   := DMTE.cdsReporte.FieldByName('MONTOPROV').AsFloat;
            xTCamProv := DMTE.cdsReporte.FieldByName('TCAMBPROV').AsFloat;
            xDifCambio:= 0.00;
  // MONTOPROV es el monto Total de la Provisión ej. S/.4,000.00
  // MONTOPAG es el monto bruto a pagar de la factura antes del calculo de la retención ej: S/.1,000.00
            if DMTE.cdsReporte.FieldByName('MONTOPROV').AsFloat=DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat then
               xTipoTrans := 'Pago Total'
            else
               xTipoTrans := 'Pago Parcial';
            if length(DMTE.DisplayDescrip('prvTGE','CXP301','CPMTOORI,CPMTOLOC,CPTCAMPR,TMONID,CPTCAMDOL,CPTCAMAJ',xWhere,'CPMTOLOC'))>0 then
            begin
               //xMtoLoc := DMTE.cdsQry.FieldByName('CPMTOLOC').AsFloat;
            // Si la provisión es en otra Moneda Distinta a la Local y la Extranjera
               if (DMTE.cdsQry.FieldByName('TMONID').AsString<>DMTE.wTMonLoc) and
                  (DMTE.cdsQry.FieldByName('TMONID').AsString<>DMTE.wTMonExt) then
                  xTCamProv:=DMTE.cdsQry.FieldByName('CPTCAMDOL').AsFloat
               else
            // Si la provisión es en Moneda Extranjera
                  xTCamProv:=DMTE.cdsQry.FieldByName('CPTCAMAJ').AsFloat;

               if DMTE.cdsQry.FieldByName('TMONID').AsString<>DMTE.wTMonLoc then
               begin
                  xDifCambio := DMTE.FRound((DMTE.cdsReporte.FieldByName('MONTOPAGME').AsFloat
                               *DMTE.cdsReporte.FieldByName('TCAMBPROV').AsFloat*DMTE.xTasaPorce/100)
                               -(DMTE.cdsReporte.FieldByName('MONTORET').AsFloat),15,2);
               end;
            end;
            xMto2:=xMto2+DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat;
            xMto3:=xMto3+DMTE.cdsReporte.FieldByName('MONTORET').AsFloat;
            xMto4:=xMto2-xMto3;
            DMTE.cdsReporte.Edit;
            DMTE.cdsReporte.FieldByName('AUXNOMB').AsString    := xAuxNomb;
            DMTE.cdsReporte.FieldByName('DOCABR').AsString     := xDocAbr;
            DMTE.cdsReporte.FieldByName('FPAGOABR').AsString   := xPagoAbr;
            DMTE.cdsReporte.FieldByName('PERIODODES').AsString := wPeriodoDesc;
            DMTE.cdsReporte.FieldByName('TCAMBPROV').AsFloat   := xTCamProv;
            DMTE.cdsReporte.FieldByName('DIFCAMBIO').AsFloat   := xDifCambio;
            DMTE.cdsReporte.FieldByName('TIPOTRANS').AsString  := xTipoTrans;
            DMTE.cdsReporte.Post;

            DMTE.cdsReporte.Next;
            if (DMTE.cdsReporte.EOF) or (DMTE.cdsReporte.FieldByName('RETNUMERO').AsString<>xRet) then
               xLast := True
            else
               xLast := False;
            if not DMTE.cdsReporte.EOF then
               DMTE.cdsReporte.Prior
            else
               DMTE.cdsReporte.Last;
  // MONTOPROV es el monto Total de la Provisión ej. S/.4,000.00
  // MONTOPAG es el monto bruto a pagar de la factura antes del calculo de la retención ej: S/.1,000.00
  // MONTOPAGME es el monto bruto a pagar de la factura en Moneda extranjera ej: 1000/3.485 = US$.286.94
  // MONTORET es el monto de la Retención del Pago a efectuar ej: 1000*6% = S/.60
  // IMPPAGADO es la monto neto a pagar Monto Bruto-Monto Retención ej: 1000-60=940
            DMTE.cdsReporte.Edit;
            if not xLast then
            begin
         {1}   DMTE.cdsReporte.FieldByName('MONTOPROV').AsFloat   := xMtoLoc;
         {2}   DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat    := 0;
         {3}   DMTE.cdsReporte.FieldByName('MONTORET').AsFloat    := 0;
         {4}   DMTE.cdsReporte.FieldByName('IMPPAGADO').AsFloat   := 0;
            end
            else
            begin
         {1}   DMTE.cdsReporte.FieldByName('MONTOPROV').AsFloat   := xMtoLoc;
         {2}   DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat    := xMto2; //+DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat;
         {3}   DMTE.cdsReporte.FieldByName('MONTORET').AsFloat    := xMto3; //+DMTE.cdsReporte.FieldByName('MONTORET').AsFloat;
         {4}   DMTE.cdsReporte.FieldByName('IMPPAGADO').AsFloat   := xMto4; //+(DMTE.cdsReporte.FieldByName('MONTOPAG').AsFloat-DMTE.cdsReporte.FieldByName('MONTORET').AsFloat);
            end;
            DMTE.cdsReporte.Post;
         end;
         DMTE.cdsReporte.Next;
      end; // while del número de retención
   end; // while general
   screen.Cursor:=crDefault;
   if DMTE.cdsReporte.RecordCount=0 then
      raise Exception.Create('No hay registros que mostrar');

   ppDBRegretencion.DataSource:=DMTE.dsReporte;
   pprRegRetencion.DataPipeline:=ppDBRegretencion;
   pprRegRetencion.TEMPLATE.FileName:=wRutaRpt + '\RetencionxProv.rtm';
   pprRegRetencion.template.LoadFromFile;

// Inicio HPC_201403_CAJA
// cambia control de diseño de reporte
   if cbDisenoRep.Checked then
   begin
      ppd1.Report:=pprRegRetencion;
      ppd1.ShowModal;
   end
   else
   begin
      pprRegRetencion.print;
      ppd1.Report:=nil;
   end;
// Fin HPC_201403_CAJA
end;

procedure TFToolRegRet.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFToolRegRet.ppHeaderBand1BeforePrint(Sender: TObject);
begin
// Inicio HPC_201601_CAJA
// Se retira evento de reporte de Retención
{
   // HPC_201103_Caja - Cambiar la fecha de Emisión del reporte
   pplFec.Visible :=False;
   ppsvFec.Visible:=False;
   if (cbFecRep.Checked) and (dtpFecRep.Date>0) then
   begin
      pplFec.Text:=Datetostr(dtpFecRep.Date);
      pplFec.Visible:=True;
   end
   else
      ppsvFec.Visible:=True;
   // HPC_201103_Caja - fin
}
// Fin HPC_201601_CAJA
end;

procedure TFToolRegRet.cbFecRepClick(Sender: TObject);
begin
// Inicio HPC_201602_CAJA
// Cambio de apariencia por colores a variable de Fecha de Reporte
   if cbFecRep.Checked then
   Begin
      gbFecRep.Enabled:=True;
      dtpFecRep.Enabled := True;
      dtpFecRep.color := clWindow;
   End
   else
   Begin
      gbFecRep.Enabled := False;
      dtpFecRep.Enabled := False;
      dtpFecRep.color := clCream;
   End;
// Fin HPC_201602_CAJA
end;

procedure TFToolRegRet.bbtnRegRetA4Click(Sender: TObject);
begin
// Inicio HPC_201401_CAJA
// Se deshabilita para que sea siempre A4 desde botón principal
   {
   sA4:='S';
   Z2bbtnLibRetenClick(Self);
   sA4:='N';
   }
// Fin HPC_201401_CAJA
end;

procedure TFToolRegRet.FormActivate(Sender: TObject);
begin
   sA4:='N';
end;

procedure TFToolRegRet.btnExportarExcelClick(Sender: TObject);
begin
   xbExportarExcel := True;
   bbtnRegRetA4Click(Self);
   xbExportarExcel := False;
end;
Procedure TFToolRegRet.fg_ExportarExcel( wgFormato :String);
Begin
   dbgRptRetenciones.Selected.Clear;
   If  wgFormato = 'FORMATO1' Then
   Begin
      dbgRptRetenciones.Selected.Add('CIAID'#9'8'#9'Compañía'#9'F');
      dbgRptRetenciones.Selected.Add('ANOMM'#9'8'#9'Periodo'#9'F');
      dbgRptRetenciones.Selected.Add('ECNOCOMP'#9'8'#9'NºRegistro'#9'F');
      dbgRptRetenciones.Selected.Add('RETNUMERO'#9'10'#9'NumComprobRetención'#9'F');
      dbgRptRetenciones.Selected.Add('FECPAGO'#9'8'#9'FechRetencion'#9'F');
      dbgRptRetenciones.Selected.Add('DOCID'#9'6'#9'CodigoDoc'#9'F');
      dbgRptRetenciones.Selected.Add('DOCABR'#9'10'#9'DenominDocumento'#9'F');
      dbgRptRetenciones.Selected.Add('DOCUMENTO'#9'12'#9'NumeroDocumento'#9'F');
      dbgRptRetenciones.Selected.Add('FECEMI'#9'10'#9'FechaDocumento'#9'F');
      dbgRptRetenciones.Selected.Add('AUXRUC'#9'11'#9'RUC'#9'F');
      dbgRptRetenciones.Selected.Add('AUXID'#9'8'#9'CódigoRelacion'#9'F');
      dbgRptRetenciones.Selected.Add('AUXNOMB'#9'15'#9'Proveedor'#9'F');
      dbgRptRetenciones.Selected.Add('TIPOTRANS'#9'10'#9'TipoTransaccion'#9'F');
      dbgRptRetenciones.Selected.Add('MONTOPROV'#9'12'#9'ImporteTransaccion'#9'F');
      dbgRptRetenciones.Selected.Add('MONTOPAG'#9'12'#9'ImporteAPagar'#9'F');
      dbgRptRetenciones.Selected.Add('MONTORET'#9'12'#9'Retención'#9'F');
      dbgRptRetenciones.Selected.Add('IMPPAGADO'#9'12'#9'ImportePagado'#9'F');

   End;

   dbgRptRetenciones.DataSource :=  DMTE.dsReporte;
   Try
      Screen.Cursor := crHourGlass;
      dbgRptRetenciones.ExportOptions.ExportType := wwgetSYLK;
      dbgRptRetenciones.ExportOptions.FileName := 'Retenciones_'+dblcPeriodo.Text + '.slk';
      dbgRptRetenciones.ExportOptions.Save;//el primero genera error
      dbgRptRetenciones.ExportOptions.Save;
      ShellExecute(Handle, 'Open', PChar(dbgRptRetenciones.ExportOptions.Filename),Nil, Nil, sw_shownormal);
      Screen.Cursor := crDefault;
   Except
         On Ex: Exception Do
            Application.MessageBox(PChar(Ex.Message), 'ERROR', 16);
   End;
End;
procedure TFToolRegRet.sbDisenoRepClick(Sender: TObject);
begin
// Inicio HPC_201401_CAJA
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
// Fin HPC_201401_CAJA
end;

// Inicio HPC_201601_CAJA
// rutina que invoca a función para asignar Total Monto de Retención en Letras
procedure TFToolRegRet.bbtnNumLetrasClick(Sender: TObject);
var
   xSQL, xCia, xSerie, xRetNumero : String;
   xMontoRet : Currency;

begin
   xCia := FConsulta.xfiltroCabRegRet.FMant.cds2.FieldByName('CIAID').AsString;
   xSerie := FConsulta.xfiltroCabRegRet.FMant.cds2.FieldByName('RETSERIE').AsString;
   xRetNumero := FConsulta.xfiltroCabRegRet.FMant.cds2.FieldByName('RETNUMERO').AsString;
   xSQL := 'Select sum(MTORETLOC) MONTORET '
      +    '  from CNT320 '
      +    ' where CIAID='+quotedstr(xCia)
      +    '   and RETSERIE='+quotedstr(xSerie)
      +    '   and RETNUMERO='+quotedstr(xRetNumero);
	DMTE.cdsReporte.Close;
	DMTE.cdsReporte.DataRequest(xSQL);
	DMTE.cdsReporte.open;
   if DMTE.cdsReporte.RecordCount>0 then
   Begin
      xMontoRet := DMTE.cdsReporte.FieldByName('MONTORET').AsFloat;
      xSQL := 'Update CNT320 '
         +    '   Set RETTOTDES=DB2ADMIN.NUM_A_LETRAS('+floattostr(xMontoRet)+')||'' ''||' +quotedstr(DMTE.wTMonLocDes)
         +    ' where CIAID='+quotedstr(xCia)
         +    '   and RETSERIE='+quotedstr(xSerie)
         +    '   and RETNUMERO='+quotedstr(xRetNumero);
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
         ShowMessage('Error al intentar actualizar la Retención');
         Exit;
      End;
   End;
   ShowMessage('ok');
end;
// Fin HPC_201601_CAJA

// Inicio HPC_201602_CAJA
// Generación de archivo diario de Comprobantes de Retención IGV
Procedure TFToolRegRet.Z2bbtnResDRetenClick(Sender: TObject);
Var
   xsRuc, xsFecha, xsNombre, xsCarpeta: String;
   xsDia, xsMes, xsAnio: String;
   xsContador: double;
   xsSql, xSQL: String;
   xsRetSerie: String;
   xsRetNumero: String;
   xsTipoDocRel: String;
   xsSerieRel: String;
   xsNumDocRel: String;
   xsItem: String;
   xRetItem: Integer;
Begin
   If length(dblccia.text) = 0 Then
   Begin
      Showmessage('Debe Seleccionar RUC de la Compañía');
      dblccia.setfocus;
      Exit;
   End;

   xsSql := ' Select A.RETSERIE, A.RETNUMERO, A.DOCID TIPDOCREL, A.SERIE SERIEREL, '
      + '            A.NODOC NUMDOCREL '
      + '       from CNT320 A '
      + '      where A.FECPAGO=' + QuotedStr(DatetoStr(dtpFecRep.date))
      + '        and nvl(A.ECESTADO,''X'')<>''A'' '
      + '      order by A.RETSERIE,A.RETNUMERO';
   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xsSql);
   DMTE.cdsReporte.open;

   If DMTE.cdsReporte.RecordCount = 0 Then
      Raise Exception.Create('No hay registros que mostrar');

   While Not DMTE.cdsReporte.Eof Do
   Begin
      xsRetSerie   := DMTE.cdsReporte.FieldByName('RETSERIE').AsString;
      xsRetNumero  := DMTE.cdsReporte.FieldByName('RETNUMERO').AsString;
      xRetItem := 1;
      While (Not DMTE.cdsReporte.Eof)
        and (DMTE.cdsReporte.FieldByName('RETSERIE').AsString=xsRetSerie)
        and (DMTE.cdsReporte.FieldByName('RETNUMERO').AsString=xsRetNumero) Do
      Begin
         xsTipoDocRel := DMTE.cdsReporte.FieldByName('TIPDOCREL').AsString;
         xsSerieRel   := DMTE.cdsReporte.FieldByName('SERIEREL').AsString;
         xsNumDocRel  := DMTE.cdsReporte.FieldByName('NUMDOCREL').AsString;

         xsItem := FormatFloat('##0', xRetItem);
         if length(xsItem) = 1 then
            xsItem := '00'+ xsItem
         else
            xsItem := '0'+ xsItem;

         xSQL := 'Update CNT320 '
               + '   Set NUMREGRET=' + quotedstr(xsItem)+','
               + '       TASARET = (case when MTORETLOC<>0 and MTOLOC<>0 '
               + '                       then round(MTORETLOC/MTOLOC*100,0) '
               + '                       else 0.00 '
               + '                  end) '
               + ' where DOCID=' + quotedstr(xsTipoDocRel)
               + '   and SERIE=' + quotedstr(xsSerieRel)
               + '   and NODOC=' + quotedstr(xsNumDocRel);
         Try
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         Except
            ShowMessage('Error al intentar actualizar la Retención');
            Exit;
         End;
         xRetItem := xRetItem + 1;
         DMTE.cdsReporte.Next;
      End;
   End;
   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.IndexFieldNames := '';

   xsRuc := dblccia.text;
   xsfecha := DatetoStr(dtpFecRep.date);
   xsDia  := copy(xsfecha,1,2);
   xsMes  := copy(xsfecha,4,2);
   xsAnio := copy(xsfecha,7,4);
   xsfecha := xsAnio + xsMes + xsDia ;
   xsNombre := xsRuc + '-' + '20' + '-' + xsfecha + '-' + '1' + '.txt';

   sdGraba.FileName := xsNombre;
   If Not sdGraba.Execute Then Exit;
   fg_PLEexportarFormato(sdGraba.FileName);
End;
// Fin HPC_201602_CAJA

// Inicio HPC_201602_CAJA
// Exporta formato de archivo diario de comprobantes de retención
Procedure TFToolRegRet.fg_PLEexportarFormato(wgRutaArchivo: String);
Var
   xsSql: String;
   xfArchivoTexto: TextFile;
   xsDelimitador: String;

   xsPeriodoRC: String;
   xsMes: String;
   xsRER: String;
   xsCantid : Integer;
   xsTamano : Integer;

   xsMotivoCont: String;
   xsRetSerie: String;
   xsRetNumero: String;
   xdFecEmi: String;

   xsAuxRuc: String;
   xsTipoDocProv: String;
   xsProvRazSoc: String;

   xsRegimenRet: String;
   xsTasaRet: String;
   xsImporteTotRet: String;
   xsImporteTotPag: String;

   xsTipoDocRel: String;
   xsSerieRel: String;
   xsNumDocRel: String;
   xdFecEmiRel: String;
   xsImporteRel: String;
   xsMonedaRel: String;

   xdFecPag: String;
   xsNumDocPag: String;
   xsImportePag: String;
   xsMonedaPag: String;

   xsImporteRet: String;
   xdFechaRet: String;
   xsImportePagNet: String;

   xsMonedaExt: String;
   xsTCambioRet: String;
   xdFechaTC: String;

   xsDocId: String;
   xsAnio: String;

Begin
   xsDelimitador := '|';
// Inicio HPC_201603_CAJA 
// 14/03/2016  Se modifica select para omitir Notas de Crédito
   xsSql := ' Select ''6'' MOTIVO,(CASE WHEN Length(A.RETSERIE)>3 THEN A.RETSERIE ELSE ''0''|| A.RETSERIE END)RETSERIE, '
      + '            SUBSTR(A.RETNUMERO,3,8) RETNUMERO, A.FECPAGO FECEMIRET, '
      + '            A.AUXRUC, ''6'' TIPODOC,B.AUXNOMB,''01'' REGRET, A.TASARET, '
      + '            (Select SUM(X.MTORETLOC) '
      + '               from CNT320 X '
      + '              where X.RETSERIE=A.RETSERIE AND X.RETNUMERO= A.RETNUMERO '
      + '                    AND X.AUXID=A.AUXID AND nvl(X.ECESTADO,''X'')<>''A'' AND X.DOCID <> ''07'') IMPTOTRET,'
      + '            (Select SUM(X.MTOLOC-X.MTORETLOC) '
      + '               from CNT320 X '
      + '              where X.RETSERIE=A.RETSERIE AND X.RETNUMERO= A.RETNUMERO '
      + '                    AND X.AUXID=A.AUXID AND nvl(X.ECESTADO,''X'')<>''A'' AND X.DOCID <> ''07'') IMPTOTPAG, '
      + '            A.DOCID TIPDOCREL, (CASE WHEN Length(A.SERIE)>3 THEN A.SERIE ELSE ''0''|| A.SERIE END) SERIEREL, '
      + '            A.NODOC NUMDOCREL, A.FECEMI FECEMIREL, '
      + '            (CASE WHEN A.TMONIDFAC = ''N'' THEN ABS(A.MTOLOC) ELSE ABS(A.MTOEXT) END)IMPDOCREL,'
      + '            C.ISOCODEALF CODMONREL, A.FECPAGO, A.NUMREGRET NUMDOCPAG, '
      + '            (CASE WHEN A.TMONIDFAC = ''N'' THEN DECODE(A.DOCID, ''07'', 0.00,A.MTOLOC) ELSE DECODE(A.DOCID, ''07'', 0.00,A.MTOEXT) END) IMPPAG,'
      + '            C.ISOCODEALF CODMONPAG, DECODE(A.DOCID, ''07'', 0.00,A.MTORETLOC) IMPORTERET, A.FECPAGO FECHARET, '
      + '            DECODE(A.DOCID, ''07'', 0.00,(A.MTOLOC-A.MTORETLOC)) IMPPAGNET, '
      + '            C.ISOCODEALF CODMONEXT, A.TCAMB TCAMBRET, A.FECPAGO FECHATC  '
      + '       from CNT320 A, CNT201 B, TGE103 C '
      + '      where A.FECPAGO=' + QuotedStr(DatetoStr(dtpFecRep.date))
      + '        and A.CLAUXID= B.CLAUXID and A.AUXID=B.AUXID AND A.TMONIDFAC=C.TMONID'
      + '        and nvl(A.ECESTADO,''X'')<>''A'' '
      + '      order by A.RETSERIE+A.RETNUMERO';
// Fin HPC_201603_CAJA 
   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xsSql);
   DMTE.cdsReporte.open;
   DMTE.cdsReporte.IndexFieldNames := 'RETNUMERO';

   If DMTE.cdsReporte.RecordCount = 0 Then
      Raise Exception.Create('No hay registros que mostrar');

   AssignFile(xfArchivoTexto, wgRutaArchivo);
   Rewrite(xfArchivoTexto);
   While Not DMTE.cdsReporte.Eof Do
   Begin
      xsMotivoCont := DMTE.cdsReporte.FieldByName('MOTIVO').AsString;
      xsRetSerie   := DMTE.cdsReporte.FieldByName('RETSERIE').AsString;
      xsRetNumero  := DMTE.cdsReporte.FieldByName('RETNUMERO').AsString;
      xdFecEmi     := DMTE.cdsReporte.FieldByName('FECEMIRET').AsString;

      xsAuxRuc     := DMTE.cdsReporte.FieldByName('AUXRUC').AsString;
      xsTipoDocProv:= DMTE.cdsReporte.FieldByName('TIPODOC').AsString;
      xsProvRazSoc := DMTE.cdsReporte.FieldByName('AUXNOMB').AsString;

      xsRegimenRet := DMTE.cdsReporte.FieldByName('REGRET').AsString;
      xsTasaRet    := FormatFloat('##0.00', DMTE.cdsReporte.FieldByName('TASARET').AsFloat);
      xsImporteTotRet:= FormatFloat('##0.00', DMTE.cdsReporte.FieldByName('IMPTOTRET').AsFloat);
      xsImporteTotPag:= FormatFloat('##0.00', DMTE.cdsReporte.FieldByName('IMPTOTPAG').AsFloat);

      xsTipoDocRel := DMTE.cdsReporte.FieldByName('TIPDOCREL').AsString;
      xsSerieRel   := DMTE.cdsReporte.FieldByName('SERIEREL').AsString;
      xsNumDocRel  := DMTE.cdsReporte.FieldByName('NUMDOCREL').AsString;
      xdFecEmiRel  := DMTE.cdsReporte.FieldByName('FECEMIREL').AsString;
      xsImporteRel := FormatFloat('##0.00', DMTE.cdsReporte.FieldByName('IMPDOCREL').AsFloat);
      xsMonedaRel  := DMTE.cdsReporte.FieldByName('CODMONREL').AsString;

   // Inicio HPC_201603_CAJA
   // 14/03/2016  Se omite valores de pago y retención para cuando es Nota de Crédito
      If xsTipoDocRel <> '07' Then
      Begin
         xdFecPag     := DMTE.cdsReporte.FieldByName('FECPAGO').AsString;
         xsNumDocPag  := DMTE.cdsReporte.FieldByName('NUMDOCPAG').AsString;
         xsImportePag := FormatFloat('##0.00', DMTE.cdsReporte.FieldByName('IMPPAG').AsFloat);
         xsMonedaPag  := DMTE.cdsReporte.FieldByName('CODMONPAG').AsString;

         xsImporteRet := FormatFloat('##0.00', DMTE.cdsReporte.FieldByName('IMPORTERET').AsFloat);
         xdFechaRet   := DMTE.cdsReporte.FieldByName('FECHARET').AsString;
         xsImportePagNet := FormatFloat('##0.00', DMTE.cdsReporte.FieldByName('IMPPAGNET').AsFloat);
      End
      Else
      Begin
         xdFecPag     := '';
         xsNumDocPag  := '';
         xsImportePag := FormatFloat('##0.00', DMTE.cdsReporte.FieldByName('IMPPAG').AsFloat);
         xsMonedaPag  := '';

         xsImporteRet := FormatFloat('##0.00', DMTE.cdsReporte.FieldByName('IMPORTERET').AsFloat);
         xdFechaRet   := '';
         xsImportePagNet := FormatFloat('##0.00', DMTE.cdsReporte.FieldByName('IMPPAGNET').AsFloat);
      End;
   // Fin HPC_201603_CAJA

      If xsMonedaRel <> 'PEN' Then
      Begin
         xsMonedaExt  := DMTE.cdsReporte.FieldByName('CODMONEXT').AsString;
         xsTCambioRet := FormatFloat('##0.0000', DMTE.cdsReporte.FieldByName('TCAMBRET').AsFloat);
         xdFechaTC    := DMTE.cdsReporte.FieldByName('FECHATC').AsString;
      End
      Else
      Begin
         xsMonedaExt := '';
         xsTCambioRet:= '';
         xdFechaTC   := '';
      End;

      WriteLn(xfArchivoTexto, xsMotivoCont+ xsDelimitador + // 1
         xsRetSerie + xsDelimitador +                       // 2
         xsRetNumero + xsDelimitador +                      // 3
         xdFecEmi + xsDelimitador +                         // 4
         xsAuxRuc + xsDelimitador +                         // 5
         xsTipoDocProv + xsDelimitador +                    // 6
         xsProvRazSoc + xsDelimitador +                     // 7
         xsRegimenRet + xsDelimitador +                     // 8
         xsTasaRet + xsDelimitador +                        // 9
         xsImporteTotRet + xsDelimitador +                  // 10
         xsImporteTotPag + xsDelimitador +                  // 11
         xsTipoDocRel + xsDelimitador +                     // 12
         xsSerieRel + xsDelimitador +                       // 13
         xsNumDocRel + xsDelimitador +                      // 14
         xdFecEmiRel + xsDelimitador +                      // 15
         xsImporteRel + xsDelimitador +                     // 16
         xsMonedaRel + xsDelimitador +                      // 17
         xdFecPag + xsDelimitador +                         // 18
         xsNumDocPag + xsDelimitador +                      // 19
         xsImportePag + xsDelimitador +                     // 20
         xsMonedaPag + xsDelimitador +                      // 21
         xsImporteRet + xsDelimitador +                     // 22
         xdFechaRet + xsDelimitador +                       // 23
         xsImportePagNet + xsDelimitador +                  // 24
         xsMonedaExt + xsDelimitador +                      // 25
         xsTCambioRet + xsDelimitador +                     // 26
         xdFechaTC + xsDelimitador);                        // 27
      DMTE.cdsReporte.Next;
   End;
   CloseFile(xfArchivoTexto);
   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.IndexFieldNames := '';
   ShowMessage('Archivo '+wgRutaArchivo+#13+' generado correctamente');
end;
// Fin HPC_201602_CAJA

// Inicio HPC_201602_CAJA
// Se inicializa componente de Compañía con data set de RUC
procedure TFToolRegRet.Timer1Timer(Sender: TObject);
begin
   dblcCia.LookupField := 'CIARUC';
   dblcCia.LookupTable := DMTE.cdsQry6;
   Timer1.Enabled := False;
end;
// Fin HPC_201602_CAJA

procedure TFToolRegRet.BitBtn1Click(Sender: TObject);
Var
   xnumserie, xnumretencion : String;
   xSQL, xNumRet, siRet, xClaseAux, xProveedor ,xsSQL, xCia, xTdiarid: String;
   xTCAMVPV : Double;
   sAno , sMes, xPeriodo : String ;
   iFrac  : Extended ;
   itotal : Currency;
   ltotal : String;
   xNumReg: Integer;
   xTasaRet: Double;
   xfArchivoTexto: TextFile;
   xsNombreTxt, xCarpeta, xsClave, xTDocSunat  : String;
begin
   xSQL := 'Select distinct RETSERIE, RETNUMERO, DOCID '
      + '     from CNT320 '
      + '    where RETSERIE=''R001'' ';
   DMTE.cdsQry2.Close;
   DMTE.cdsQry2.DataRequest(xSQL);
   DMTE.cdsQry2.Open ;
   DMTE.cdsQry2.IndexFieldNames := 'RETNUMERO';

   DMTE.cdsQry2.First;
   While not DMTE.cdsQry2.EOF do
   Begin
      xnumserie := DMTE.cdsQry2.FieldByName('RETSERIE').AsString;
      xnumretencion := DMTE.cdsQry2.FieldByName('RETNUMERO').AsString;

   // Resolviendo ID de Envio
      xsClave :=  '02' + xnumserie + xnumretencion;

   // Resolviendo último número de Envio
      xSQL := 'Select max(NUMENVRET) NUMENVRET '
         + '     from db2admin.CAJA_CERT_RETIGV '
         + '    where CODRETIGV = '+QuotedStr(xsClave);
      DMTE.cdsQry4.Close;
      DMTE.cdsQry4.DataRequest(xSQL);
      DMTE.cdsQry4.Open;

   // Resolviendo Tipo de Documento Sunat
      xSQL := 'Select TDOC_SUNAT '
         + '     From db2admin.TGE110 '
         + '     Where DOCID = ' +QuotedStr(DMTE.cdsQry2.FieldByName('DOCID').AsString);
      DMTE.cdsQry5.IndexFieldNames:='';
      DMTE.cdsQry5.Filter:='';
      DMTE.cdsQry5.Filtered:=False;
      DMTE.cdsQry5.Close;
      DMTE.cdsQry5.DataRequest(xSQL);
      DMTE.cdsQry5.Open;

      xTDocSunat := DMTE.cdsQry5.FieldByName('TDOC_SUNAT').AsString;

   // Resolviendo Carpeta para Archivo
      xSQL := 'Select RUTADES '
         + '  From db2admin.TGE837 '
         + '  Where APLIC = ' +QuotedStr('RET')
         + '   And RUTAID = ' +QuotedStr(wId_Rutadest);
      DMTE.cdsQry5.Close;
      DMTE.cdsQry5.DataRequest(xSQL);
      DMTE.cdsQry5.Open;

      xCarpeta := DMTE.cdsQry5.FieldByName('RUTADES').AsString;
      xCarpeta := 'D:\RetencionesIGV\';

   // Seleccionando Registros para escribir en Txt
      xSQL := 'Select NUMDETLIN, DESDETLIN '
         +    '  from db2admin.CAJA_CERT_RETIGV '
         +    '  where CODRETIGV  = ' +QuotedStr(xsClave)
         +    '    and NUMENVRET  = ' +inttostr(DMTE.cdsQry4.FieldByName('NUMENVRET').AsInteger);
      DMTE.cdsQry7.Close;
      DMTE.cdsQry7.DataRequest(xSQL);
      DMTE.cdsQry7.Open;
      DMTE.cdsQry7.IndexFieldNames := 'NUMDETLIN';
   //
      xsNombreTxt := xCarpeta+'RE_'+xTDocSunat+'_'+xnumserie+'_'+xnumretencion+'.txt';
      AssignFile(xfArchivoTexto, xsNombreTxt);
      Rewrite(xfArchivoTexto);

      DMTE.cdsQry7.First;
      while not DMTE.cdsQry7.EOF do
      Begin
         WriteLn(xfArchivoTexto, DMTE.cdsQry7.FieldByName('DESDETLIN').AsString);
         DMTE.cdsQry7.Next;
      End;
      CloseFile(xfArchivoTexto);
      DMTE.cdsQry2.Next;
   End;
   DMTE.cdsQry2.IndexFieldNames := '';
   DMTE.cdsQry2.Close;
   DMTE.cdsQry5.Close;
   DMTE.cdsQry7.Close;
end;

end.

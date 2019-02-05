unit Caja703;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, db, DBClient, wwclient,Mant, StdCtrls, Mask, ppCache,
  ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands,
  ppCtrls, ppPrnabl, wwdblook, wwdbedit, Wwdbspin, Spin, ppEndUsr, ppTypes,
  wwdbdatetimepicker, ppVar, ppViewr, ppStrtch, ppSubRpt, fcLabel, Wwdbdlg,
  Variants;

type
  TFToolMovCaja = class(TForm)
    PnlComprobante: TPanel;
    ppDBIngresoCaja: TppDBPipeline;
    pprCompRet: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppShape6: TppShape;
    ppShape5: TppShape;
    ppDBText18: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppDBText19: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape4: TppShape;
    ppShape3: TppShape;
    ppShape2: TppShape;
    ppShape1: TppShape;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppDBText26: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppdbCompRet: TppDBPipeline;
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
    GroupBox1: TGroupBox;
    RbIngreso: TRadioButton;
    RbEgreso: TRadioButton;
    RbTodos: TRadioButton;
    bbtnOK: TBitBtn;
    GroupBox2: TGroupBox;
    dblcCaja: TwwDBLookupCombo;
    Label2: TLabel;
    edtCajades: TEdit;
    dbdtpInicio: TwwDBDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    dbdtpFin: TwwDBDateTimePicker;
    pprIngresoCaja: TppReport;
    bbtnCuadreCaja: TBitBtn;
    bbtnLibCaja: TBitBtn;
    pprMovDiario: TppReport;
    Label5: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
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
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel44: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppDBText32: TppDBText;
    ppDBText31: TppDBText;
    ppDBText2: TppDBText;
    pplblfecIni: TppLabel;
    pplblFecFin: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText6: TppDBText;
    ppDBText11: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppHeaderBand3: TppHeaderBand;
    ppLabel14: TppLabel;
    ppDBText8: TppDBText;
    ppLabel15: TppLabel;
    ppLabel37: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppDBText10: TppDBText;
    ppDBText29: TppDBText;
    pplblFechaIni: TppLabel;
    pplblFechaFin: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText30: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    pprLibroCaja: TppReport;
    ppReport1: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppLabel105: TppLabel;
    ppDBText63: TppDBText;
    ppLabel106: TppLabel;
    ppLabel107: TppLabel;
    ppLabel108: TppLabel;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppLabel111: TppLabel;
    ppLabel112: TppLabel;
    ppLabel113: TppLabel;
    ppLabel114: TppLabel;
    ppLabel115: TppLabel;
    ppLabel116: TppLabel;
    ppLabel117: TppLabel;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppLabel120: TppLabel;
    ppLabel121: TppLabel;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppLabel128: TppLabel;
    ppLabel129: TppLabel;
    ppLabel130: TppLabel;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppLabel133: TppLabel;
    ppLabel134: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppFooterBand5: TppFooterBand;
    ppSummaryBand4: TppSummaryBand;
    ppLabel135: TppLabel;
    ppLabel136: TppLabel;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppDBCalc25: TppDBCalc;
    ppDesigner1: TppDesigner;
    ppReport2: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand6: TppHeaderBand;
    pplblCompaniaECaja: TppLabel;
    ppLabel138: TppLabel;
    pplblTituloECaja: TppLabel;
    pplblRangoECaja: TppLabel;
    ppSystemVariable13: TppSystemVariable;
    ppSystemVariable14: TppSystemVariable;
    ppSystemVariable15: TppSystemVariable;
    ppLabel141: TppLabel;
    ppLabel142: TppLabel;
    ppLabel143: TppLabel;
    ppLabel144: TppLabel;
    ppLabel145: TppLabel;
    ppLabel146: TppLabel;
    ppLabel147: TppLabel;
    ppLabel148: TppLabel;
    ppLabel149: TppLabel;
    ppLabel150: TppLabel;
    ppLabel152: TppLabel;
    ppLabel151: TppLabel;
    ppLabel153: TppLabel;
    ppLabel154: TppLabel;
    ppLabel156: TppLabel;
    ppLabel157: TppLabel;
    ppLabel158: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppDBText84: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppLabel155: TppLabel;
    ppDBCalc26: TppDBCalc;
    ppDBCalc27: TppDBCalc;
    ppDBCalc28: TppDBCalc;
    bbtnEgrCaja: TBitBtn;
    bbtnMovDia: TBitBtn;
    ppLabel137: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppRCuadre: TppReport;
    ppHeaderBand7: TppHeaderBand;
    pplblCia: TppLabel;
    pplblTitulo: TppLabel;
    pplblFecha: TppLabel;
    pplblHora: TppLabel;
    pplblPg: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    pplblDocu: TppLabel;
    pplblFech: TppLabel;
    pplblMone: TppLabel;
    pplblConcep: TppLabel;
    pplblIngLoc: TppLabel;
    pplblIngExt: TppLabel;
    pplblTC: TppLabel;
    pplblAux: TppLabel;
    pplblClase: TppLabel;
    svPag: TppSystemVariable;
    ppsvHora: TppSystemVariable;
    ppsvFecha: TppSystemVariable;
    pplblDescri: TppLabel;
    pplblImpLoc: TppLabel;
    pplblImpExt: TppLabel;
    pplblEgrExt: TppLabel;
    pplblEgrLoc: TppLabel;
    pplblAcuLoc: TppLabel;
    pplblAcuExt: TppLabel;
    pplblDel: TppLabel;
    pplblSaldoIng: TppLabel;
    ppvSaldoASol: TppVariable;
    ppvSaldoADol: TppVariable;
    ppDetailBand7: TppDetailBand;
    ppdbFecha: TppDBText;
    ppdbMone: TppDBText;
    ppdbGlosa: TppDBText;
    ppdbMonIngLoc: TppDBText;
    ppdbMonEgrLoc: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppdbMonIngExt: TppDBText;
    ppdbMonEgrExt: TppDBText;
    ppdbSumaIng: TppVariable;
    ppdbSumaEgr: TppVariable;
    ppSummaryBand6: TppSummaryBand;
    pplblTotal: TppLabel;
    ppdbcIngLoc: TppDBCalc;
    ppdbcIngExt: TppDBCalc;
    ppdbcEgrLoc: TppDBCalc;
    ppdbcEgrExt: TppDBCalc;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    pplblTitulo2: TppLabel;
    pplblDel2: TppLabel;
    ppLabel45: TppLabel;
    pplblImporS: TppLabel;
    pplblIngS: TppLabel;
    pplblEgrS: TppLabel;
    pplblImporD: TppLabel;
    pplblIngD: TppLabel;
    pplblEgrD: TppLabel;
    pplblAcumuS: TppLabel;
    pplblAcumuD: TppLabel;
    pplblSaldoAS: TppLabel;
    ppl1: TppLine;
    ppl2: TppLine;
    pplblSaldoAD: TppLabel;
    ppvSaldoAS: TppVariable;
    ppvSaldoAD: TppVariable;
    ppLine5: TppLine;
    ppDetailBand8: TppDetailBand;
    ppdbtDocu: TppDBText;
    ppdbtMtoingloci: TppDBText;
    ppdbtMtoingloce: TppDBText;
    ppdbtMtoegrloci: TppDBText;
    ppdbtMtoegrloce: TppDBText;
    ppSummaryBand7: TppSummaryBand;
    ppdbcingS: TppDBCalc;
    ppdbcingD: TppDBCalc;
    ppdbcegrS: TppDBCalc;
    ppdbcegrD: TppDBCalc;
    ppvIng: TppVariable;
    ppvegr: TppVariable;
    ppvSaldoAS1: TppVariable;
    ppvSaldoAD1: TppVariable;
    ppDBIE: TppDBPipeline;
    ppDBIE1: TppDBPipeline;
    ppDesigner2: TppDesigner;
    ppShape11: TppShape;
    ppDBText100: TppDBText;
    fcLabel1: TfcLabel;
    dblcdAnoMes: TwwDBLookupComboDlg;
    Bevel1: TBevel;
    ppLabel54: TppLabel;
    ppLabel63: TppLabel;
    ppLabel90: TppLabel;
    ppLabel100: TppLabel;
    ppLabel160: TppLabel;
    ppLabel161: TppLabel;
    ppLabel162: TppLabel;
    ppLabel163: TppLabel;
    ppHeaderBand4: TppHeaderBand;
    ppLabel76: TppLabel;
    ppDBText47: TppDBText;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel93: TppLabel;
    ppLabel94: TppLabel;
    pplblPeriodo: TppLabel;
    pplblTDiario: TppLabel;
    ppDBText48: TppDBText;
    ppLabel95: TppLabel;
    ppDBText49: TppDBText;
    ppLabel96: TppLabel;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    pplblFechIni: TppLabel;
    pplblFechIFin: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel101: TppLabel;
    ppLabel102: TppLabel;
    ppLabel103: TppLabel;
    ppLabel104: TppLabel;
    ppLabel139: TppLabel;
    ppLabel140: TppLabel;
    ppLabel159: TppLabel;
    ppShape9: TppShape;
    ppDetailBand4: TppDetailBand;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBCalc17: TppDBCalc;
    ppSummaryBand3: TppSummaryBand;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppLabel99: TppLabel;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppShape10: TppShape;
    BitBtn1: TBitBtn;
    ppdb2: TppDBPipeline;
    ppdb1: TppDBPipeline;
    ppr1: TppReport;
    ppHeaderBand8: TppHeaderBand;
    ppDetailBand9: TppDetailBand;
    ppFooterBand4: TppFooterBand;
    ppd1: TppDesigner;
    Function AsientoCuadra: Boolean;
    procedure sbtABlClick(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnMovDiaIngrClick(Sender: TObject);
    procedure dblcCajaExit(Sender: TObject);
    procedure BBTNIClick(Sender: TObject);
    procedure bbtnOKClick(Sender: TObject);
    procedure bbtnMovDiaClick(Sender: TObject);
    procedure bbtnCuadreCajaClick(Sender: TObject);
    procedure bbtnLibCajaClick(Sender: TObject);
    procedure bbtnEgrCajaClick(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure pprMovDiarioPreviewFormCreate(Sender: TObject);
    procedure ppReport2PreviewFormCreate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pprLibroCajaPreviewFormCreate(Sender: TObject);
    procedure ppdbSumaEgrCalc(Sender: TObject; var Value: Variant);
    procedure ppdbSumaIngCalc(Sender: TObject; var Value: Variant);
    procedure ppRCuadrePreviewFormCreate(Sender: TObject);
    procedure ppRCuadreStartPage(Sender: TObject);
    procedure ppTitleBand1BeforePrint(Sender: TObject);
    procedure ppvSaldoAS1Calc(Sender: TObject; var Value: Variant);
    procedure ppvSaldoAD1Calc(Sender: TObject; var Value: Variant);
    procedure ppvegrCalc(Sender: TObject; var Value: Variant);
    procedure ppvIngCalc(Sender: TObject; var Value: Variant);
    procedure dblcdAnoMesExit(Sender: TObject);
    procedure dblcdAnoMesKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
    MProv    : TMant;
    //Agregado por Ana
    xCont : String;
    cdsGComprobante :  TwwClientDataSet;
    xVez, xVez1 : bool;
    xTotEgresosS  ,
    xTotEgresosD  ,
    xTotIngresosS ,
    xTotIngresosD : Currency ;
    xSalIngLoc,xSalIngExt : Real;
		procedure AsignaSQLArqueoCajaP(xCiaId, xFechaInicio, xFechaFin: String);
  public
    { Public declarations }
    xToolCia, xTooldiario, xToolAnomm, xToolPeriodo, xToolEstado : String;
    xFiltroDet : TMant;
    xAno, xMes : String;
    Function PeriodoCuadra:Boolean;
  end;

var
   FToolMovCaja: TFToolMovCaja;
   xSqlMant: STring;

implementation

uses CajaDM, oaTE4000, Caja238, CajaUtil;

{$R *.DFM}

Function TFToolMovCaja.PeriodoCuadra:Boolean;
var
   xA, xR, xI  : Integer;
   P, E, T  : String;
begin
   Result := False;

   xA := 0 ;  xR := 0 ;  xI := 0 ;
   cdsGComprobante.First ;
   P := cdsGComprobante.FieldByName('CNTANOMM').AsString ;
   E := cdsGComprobante.FieldByName('CNTESTADO').AsString ;
   while not cdsGComprobante.EOF do
    begin
      T := cdsGComprobante.FieldByName('CNTANOMM').AsString;

      if (P = T) and (E = 'I') then //Si periodos son iguales
         xA := xA+1
      else
        if P <> T  then  //  Compara si los periodos son iguales
        begin
           ShowMessage(' Debe Aceptar solo Registros con periodos iguales');
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
     Result := True;
end;

Function TFToolMovCaja.AsientoCuadra:Boolean;
var
   xTotDebe, xTotHaber : Double;
begin
   Result    := False;
   xTotDebe  := 0;
   xTotHaber := 0;
   DMTE.cdsMovCnt1.DisableControls;
   DMTE.cdsMovCnt1.First ;
   while not DMTE.cdsMovCnt1.eof do begin
    if DMTE.cdsMovCnt1.FieldByName('CNTDH').AsString='D' then
     xTotDebe  := xTotDebe  + DMTE.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat
    else
     begin
      xTotHaber := xTotHaber + DMTE.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat;
     end;
    DMTE.cdsMovCnt1.Next;
   end;
   DMTE.cdsMovCnt1.First;
   DMTE.cdsMovCnt1.EnableControls;
   if DMTE.FRound(xTotDebe,15,2) = DMTE.FRound(xTotHaber,15,2) then Result := True;
end;

procedure TFToolMovCaja.sbtABlClick(Sender: TObject);
var
   xSQL, xSQL1, xWhere : String;
   iX ,iY: Integer;
begin

   DMTE.cdsQry3.Close;
   DMTE.cdsQry3.IndexFieldNames := '';

//   DMTE.cdsBancoEgr.open;
//   DMTE.cdsNivel.Open;
//   DMTE.cdsTDiario1.open;
//   DMTE.cdsMovCxP.open;
   //** 17/03/2001 - pjsv
   DMTE.FiltraTabla(DMTE.cdsCCBco, 'TGE106', 'CCBCOID' );
   DMTE.FiltraTabla(DMTE.cdsFEfec, 'TGE217', 'FLUEFEID' );
   DMTE.FiltraTabla(DMTE.cdsEquiv, 'TGE160', '' );


   xSQL1 := FConsulta.xFiltroPProv.FMant.SQL;
//   xSQL := Mtx.FMant.SQL;
   for iX := 0 to Length(xSQL1) do
	  begin
	   if copy(xSQL1,iX,5) = 'WHERE' then
		  begin
       xWhere := copy(xSQL1,iX+6,Length(xSQL1));
			 Break;
  		end;
	  end;
	 for iY := 0 to Length(xWhere) do
	  begin
	   if copy(xWhere, iY, 8) = 'ORDER BY' then
		  begin
		   xWhere := copy(xWhere,1,iY-2);
		   Break;
      end;
	  end;
   //**
   if Length(xWhere)>0 then
     xWhere := xWhere+' AND ';
   xSQL := 'SELECT '
         +' B.CIAID,B.PROV, B.PROVRUC, '
         +' B.TMONID, B.ECTCAMB, B.ECMTOORI, B.ECMTOLOC '
         +' ,B.ECMTOEXT, '
         +' B.CCBCOID, C.CPTOID, C.DCPDH, C.CPTCAMPR, C.CCOSID,'
         +' C.DCPMOORI, C.DCPMOLOC, C.DCPMOEXT, C.CPFEMIS, B.ECFCOMP, '
         +' D.AUXNOMB, C.CUENTAID, E.MTORETLOC, B.ECGLOSA, CASE WHEN C.TIPDET=''MG'' THEN ''S''  ELSE ''N'' END AS CABECERA'
         +' FROM (Select CAJA302.TDIARID, CAJA302.ECANOMM, CAJA302.ECNOCOMP, '
         +' B.CIAID, B.TDIARID2, B.CPANOMM, B.CPNOREG, B.DOCID2, '
         +' B.CPNODOC, CAJA302.PROV, CAJA302.PROVRUC, CAJA302.ECFCOMP, CAJA302.ECFEMICH,'
         +' CAJA302.ECFPAGOP, CAJA302.FPAGOID, CAJA302.ECNODOC, CAJA302.ECTCAMB, CAJA302.ECMTOORI, CAJA302.ECMTOLOC, CAJA302.ECMTOEXT,'
         +' CAJA302.BANCOID, CAJA302.CCBCOID, CAJA302.ECNOCHQ, CAJA302.ECGIRA, CAJA302.CPTOID, CAJA302.CUENTAID, CAJA302.ECGLOSA, CAJA302.ECLOTE,'
         +' CAJA302.ECESTADO, CAJA302.ECCONTA, CAJA302.TMONID'
         +' From CAJA302 , CAJA303 B '
         +' Where '+xWhere +'  CAJA302.CIAID=B.CIAID AND CAJA302.TDIARID=B.TDIARID '
         +' AND CAJA302.ECANOMM=B.ECANOMM AND CAJA302.ECNOCOMP=B.ECNOCOMP '
         +' ) B,CXP302 C, CNT201 D , CNT320 E'
         +' WHERE  B.CIAID=C.CIAID AND B.CIAID=E.CIAID AND E.AUXID=D.AUXID '
         +' AND B.TDIARID=E.TDIARID AND B.TDIARID2=C.TDIARID AND B.ECNOCOMP=E.ECNOCOMP '
         +' AND B.CPANOMM=C.DCPANOMM AND B.ECANOMM=E.ANOMM AND '
         +' C.DOCID=E.DOCID AND C.CPSERIE=E.SERIE AND C.CPNODOC=E.NODOC AND '
         +' B.CPNOREG=C.CPNOREG AND E.AUXID=B.PROV AND B.PROV=D.AUXID ';

   xFiltroDet := TMant.Create(Self);

   With xFiltroDet do
    begin
     Admin         := DMTE.wAdmin ;
     Titulo        := 'Pago a Proveedores' ;
     Tablename     := 'VWCAJADETALLECXP' ;

     Filter        := 'CAJA302.EC_PROCE=''B''' ;
     ClientDataSet := DMTE.cdsQry3 ;
     OnInsert      := nil ;
     OnEdit        := nil ;
     OnDelete      := nil ;
     DComC         := DMTE.DCOM1 ;
     Module        := 'CAJA' ;
     SectionName   := 'CAJAPAGOPROV';
     FileNameIni   := '\SOLCAJA.INI';
     User          := DMTE.wUsuario ;
     UsuarioSQL.Add(xSQL);
     try
      Execute ;
     Finally
      Free ;
      DMTE.cdsBancoEgr.Close;
      DMTE.cdsBancoEgr.Open;
      DMTE.cdsNivel.Open;
      DMTE.cdsTDiario1.Open;
      DMTE.cdsMovCxP.Open;
      DMTE.cdsQry3.Close;
     end;
   end;
end;

procedure TFToolMovCaja.dblcCiaExit(Sender: TObject);
var
   xSQL : String;
begin
   edtCia.Text := DMTE.DisplayDescrip('prvTGE', 'TGE101', 'CIADES', 'CIAID='+QuotedStr(dblcCia.Text),'CIADES');
end;

procedure TFToolMovCaja.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   DMTE.cdsReporte.Close;
end;

procedure TFToolMovCaja.bbtnMovDiaIngrClick(Sender: TObject);
var
   Sentencia, xSQL, xWhere : String;
   x10, iPos, iPosG, iPoss, Posicion, Longitudd : Integer;
begin
   DMTE.cdsReporte.Close;

   Sentencia := UpperCase(FConsulta.xfiltroCabRegRet.FMant.SQL);
   Longitudd := Length(Sentencia);
   iPos      := pos('WHERE', Sentencia);
   iPosG     := pos('GROUP BY', Sentencia);
   If iPos > 0 then

   	xWhere := copy(Sentencia,iPos+5,(iPosG-5)-iPos);

   xSQL := 'SELECT A.ECNOCOMP,A.FECEMI AS FECEMI,A.SERIE||''-''||A.NODOC AS '
          +' DOCUMENTO,B.AUXNOMB,C.DEMTOLOC AS MONTOPROV,A.MTOLOC AS '
          +' MONTOPAG,A.MTORETLOC AS MONTORET,A.FECPAGO AS FECPAGO,A.RETNUMERO '
          +' ,C.DEMTOLOC,D.FPAGOID,E.DOCABR, D.ECNOCHQ ,F.FPAGOABR, G.CIADES  '
          +' FROM CNT320 A, CNT201 B , CAJA303 C, CAJA302 D, TGE110 E, TGE112 F, TGE101 G '
          +' WHERE '+xWhere
          +' AND A.AUXID=B.AUXID AND A.CIAID=C.CIAID AND A.TDIARID=C.TDIARID '
          +' AND A.ANOMM=C.ECANOMM AND A.ECNOCOMP=C.ECNOCOMP AND A.AUXID=C.PROV '
          +' AND A.DOCID=C.DOCID2 AND A.SERIE=CPSERIE AND A.NODOC=C.CPNODOC '
          +' AND  A.CIAID=D.CIAID AND D.CIAID=A.CIAID AND D.CIAID=C.CIAID '
          +' AND  A.TDIARID=D.TDIARID AND D.TDIARID=A.TDIARID AND '
          +' D.TDIARID=C.TDIARID AND A.ANOMM=D.ECANOMM AND D.ECANOMM=C.ECANOMM '
          +' AND A.ECNOCOMP=D.ECNOCOMP AND C.ECNOCOMP=D.ECNOCOMP AND '
          +' A.AUXID=D.PROV AND C.PROV=D.PROV AND A.DOCID=E.DOCID AND '
          +' E.DOCMOD=''CXP'' AND F.FPAGOID=D.FPAGOID AND A.CIAID=G.CIAID';
   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

{  pprRegRetencion.TEMPLATE.FileName:=wRutaRpt + '\LibroRetencion.rtm';
  pprRegRetencion.template.LoadFromFile ;
  pprRegRetencion.print;
 }
end;

procedure TFToolMovCaja.dblcCajaExit(Sender: TObject);
begin
   edtCajades.Text := DMTE.DisplayDescrip('prvTGE', 'TGE105', 'BANCONOM', 'BANCOID ='+QuotedStr(dblcCaja.Text)+ ' AND BCOTIPCTA='+QuotedStr('C'),'BANCONOM');
end;

procedure TFToolMovCaja.BBTNIClick(Sender: TObject);
var
   xSQL : String;
begin

end;

procedure TFToolMovCaja.bbtnOKClick(Sender: TObject);
var
   xSQL : String;
   xSQL1, xSQL2, xSQL3, xSQL4, xSQL5, xSQL6 : String;
begin
   if Length(dblcCaja.Text) = 0 then
    begin
     ShowMessage('Debe Seleccionar la Caja');
     Exit;
    end;

   if Length(edtCajades.Text) = 0 then
    begin
     ShowMessage('Debe Seleccionar la Caja');
     Exit;
    end;

   if Length(dbdtpInicio.text)=0 then
    begin
     ShowMessage('Debe Seleccionar la Fecha de Inicio');
     Exit;
    end;

   if Length(dbdtpFin.text)=0 then
    begin
     Showmessage('Debe seleccionar la fecha de Termino');
     Exit;
    end;

   xSQL := FConsulta.xfiltroMovLibCaja.FMant.SQL;
   FConsulta.xfiltroMovLibCaja.FMant.cds2.Filtered := False;

   if RbIngreso.Checked = True then
    begin
     if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
      begin
       xSQL1 := 'SELECT ECNOCOMP, PROV, INGRESOLOC, EGRESOLOC, INGRESOEXT, EGRESOEXT, '
               +' CCGLOSA, CCNOMB, FPAGOID, ECNOCHQ, PAGCHEQUMN, PAGCHEQUME,'
               +' PAGEFECTMN, PAGEFECTME, PAGNOTDMN, PAGNOTDME, FPAGODES, TCAMBIO, CLAUXID, CIAID,'
               +' CIADES, BANCONOM, TMONID, TMONDES, FECHA, CLAUXDES, DOCID, NODOC, CPTOID, CUENTAID,'
               +' CPTODES, TIPO, BANCOID, TOTALLOC, TOTALEXT, HORA, SALDOMN, SALDOME, NORDEN, SALDOANTMN,'
               +' SALDOANTME, CTACPTO, 0.00 DEBEMN, 0.00 HABERMN, 0.00 DEBEME, 0.00 HABERME FROM'
               +' ( SELECT MAX(A.ECNOCOMP) ECNOCOMP, A.CLIEID PROV, '
               +' CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN MAX(A.NCOMTOLOC) ELSE 0 END INGRESOLOC, '
               +' CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN 0.00 ELSE 0.00 END EGRESOLOC , '
               +' CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN MAX(A.NCOMTOEXT) ELSE 0 END INGRESOEXT , '
               +' CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN 0.00 ELSE 0.00 END EGRESOEXT , '
               +' MAX(A.CCGLOSA) CCGLOSA, MAX(A.CCNOMB) CCNOMB, MAX(B.FPAGOID) FPAGOID, MAX(B.ECNOCHQ) ECNOCHQ, '
               +' SUM(CASE WHEN (C.FCHQ=''S'' OR C.FCHQ=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO ELSE 0 END) PAGCHEQUMN,'
               +' SUM(CASE WHEN (C.FCHQ=''S'' OR C.FCHQ=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO ELSE 0 END) PAGCHEQUME,'
               +' SUM(CASE WHEN (C.FEFE=''S'' OR C.FEFE=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO ELSE 0 END) PAGEFECTMN,'
               +' SUM(CASE WHEN (C.FEFE=''S'' OR C.FEFE=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO ELSE 0 END) PAGEFECTME,'
               +' SUM(CASE WHEN (C.FNDE=''S'' OR C.FNDE=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO ELSE 0 END) PAGNOTDMN,'
               +' SUM(CASE WHEN (C.FNDE=''S'' OR C.FNDE=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO ELSE 0 END) PAGNOTDME,'
               +' MAX(B.FPAGODES) FPAGODES,'
               +' MAX(A.NCOTCAMB) TCAMBIO, A.CLAUXID, A.CIAID CIAID, MAX(E.CIADES) CIADES, MAX(D.BANCONOM) BANCONOM,'
               +' A.TMONID, MAX(F.TMONDES) TMONDES, A.CCFEMIS FECHA, MAX(G.CLAUXDES) CLAUXDES, A.DOCID,'
               +' A.CCNODOC NODOC, A.CPTOID, A.CUENTAID, MAX(H.CPTODES) CPTODES, ''INGRESO'' TIPO,A.BANCOID,'
               +' (SUM( CASE WHEN (C.FCHQ=''S'' OR C.FCHQ=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO ELSE 0 END))'
               +' +(SUM(CASE WHEN (C.FEFE=''S'' OR C.FEFE=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO ELSE 0 END)) '
               +' +(SUM(CASE WHEN (C.FNDE=''S'' OR C.FNDE=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO ELSE 0 END)) TOTALLOC,'
               +' (SUM(CASE WHEN (C.FCHQ=''S'' OR C.FCHQ=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO ELSE 0 END))'
               +' + (SUM(CASE WHEN (C.FEFE=''S'' OR C.FEFE=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO ELSE 0 END))'
               +' +(SUM(CASE WHEN (C.FNDE=''S'' OR C.FNDE=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO ELSE 0 END)) TOTALEXT,'
               +' MAX(A.NCOHREG) HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, MAX(H.CUENTAID) CTACPTO'
               +' FROM CXC303 A '
               +' LEFT JOIN CAJA314 B ON B.CIAID=A.CIAID AND B.DOCID=A.DOCID AND B.CCSERIE=A.CCSERIE AND B.CCNODOC=A.CCNODOC AND B.CLAUXID=A.CLAUXID AND B.CLIEID=A.CLIEID'
               +' LEFT JOIN TGE112  C ON C.FPAGOID=B.FPAGOID '
               +' LEFT JOIN TGE105  D ON A.BANCOID=D.BANCOID '
               +' LEFT JOIN TGE101  E ON A.CIAID=E.CIAID '
               +' LEFT JOIN TGE103  F ON A.TMONID=F.TMONID '
               +' LEFT JOIN TGE102  G ON A.CLAUXID=G.CLAUXID '
               +' LEFT JOIN CAJA201 H ON A.CPTOID=H.CPTOID '
               +' Where A.NCOESTADO=''C'' AND D.BCOTIPCTA=''C''   '
               +' GROUP BY A.CIAID, A.CLIEID, A.BANCOID, A.CPTOID, A.CUENTAID, A.DOCID, A.CCNODOC, '
               +' A.CCFEMIS, A.ECANOMM, A.TMONID, A.CLAUXID  ';
       xSQL2 := ' UNION ALL '
               +' SELECT A.ECNOCOMP, MAX(A.PROV) PROV,'
               +' SUM(CASE WHEN (A.EC_IE =''I'' AND A.TMONID='''+DMTE.wTMonLoc+''') THEN A.ECMTOLOC ELSE 0 END ) INGRESOLOC,'
               +' 0.00  EGRESOLOC,'
               +' SUM(CASE WHEN (A.EC_IE =''I'' AND A.TMONID='''+DMTE.wTMonExt+''') THEN A.ECMTOEXT ELSE 0 END ) INGRESOEXT,'
               +' 0.00 EGRESOEXT,'
               +'  '' '' CCGLOSA, ''TRANSFERENCIA'' AS CCNOMB, MAX(F.FPAGOID) FPAGOID,'
               +'  '' '' ECNOCHQ,'
               +' SUM(CASE WHEN F.FPAGOID='''+DMTE.wCheque+''' AND F.TMONID='''+DMTE.wTMonLoc+''' THEN F.TXMTOLOC ELSE 0 END) PAGCHEQUMN,'
               +' SUM(CASE WHEN F.FPAGOID='''+DMTE.wCheque+''' AND F.TMONID='''+DMTE.wTMonExt+''' THEN F.TXMTOEXT ELSE 0 END) PAGCHEQUME,'
               +' SUM(CASE WHEN F.FPAGOID='''+DMTE.wEfectivo+''' AND F.TMONID='''+DMTE.wTMonLoc+''' THEN F.TXMTOLOC ELSE 0 END) PAGEFECTMN,'
               +' SUM(CASE WHEN F.FPAGOID='''+DMTE.wEfectivo+''' AND F.TMONID='''+DMTE.wTMonExt+''' THEN F.TXMTOEXT ELSE 0 END) PAGEFECTME,'
               +' SUM(CASE WHEN F.FPAGOID='''+DMTE.wDeposito+''' AND F.TMONID='''+DMTE.wTMonLoc+''' THEN F.TXMTOLOC ELSE 0 END) PAGNOTDMN,'
               +' SUM(CASE WHEN F.FPAGOID='''+DMTE.wDeposito+''' AND F.TMONID='''+DMTE.wTMonExt+''' THEN F.TXMTOEXT ELSE 0 END) PAGNOTDME,'
               +' '' ''  FPAGODES, MAX(A.ECTCAMB) TCAMBIO, MAX(A.CLAUXID) CLAUXID, A.CIAID CIAID,'
               +' D.CIADES, C.BANCONOM, A.TMONID,'
               +' MAX(E.TMONDES) TMONDES, MAX(A.ECFCOMP) FECHA, '' '' CLAUXDES, A.DOCID, A.ECNODOC NODOC, A.CPTOID, '
               +' '' '' CUENTAID, ''TRANSFERENCIA'' CPTODES, ''INGRESO''  '
               +' TIPO, A.BANCOID,'
               +' (SUM(CASE WHEN F.FPAGOID='''+DMTE.wCheque+''' AND F.TMONID='''+DMTE.wTMonLoc+''' THEN F.TXMTOLOC ELSE 0 END))'
               +' +(SUM(CASE WHEN F.FPAGOID='''+DMTE.wEfectivo+''' AND F.TMONID='''+DMTE.wTMonLoc+''' THEN F.TXMTOLOC ELSE 0 END)) '
               +' +(SUM(CASE WHEN F.FPAGOID='''+DMTE.wDeposito+''' AND F.TMONID='''+DMTE.wTMonLoc+''' THEN F.TXMTOLOC ELSE 0 END)) TOTALLOC,'
               +' (SUM(CASE WHEN F.FPAGOID='''+DMTE.wCheque+''' AND F.TMONID='''+DMTE.wTMonExt+''' THEN F.TXMTOEXT ELSE 0 END)) '
               +' +(SUM(CASE WHEN F.FPAGOID='''+DMTE.wEfectivo+''' AND F.TMONID='''+DMTE.wTMonExt+''' THEN F.TXMTOEXT ELSE 0 END)) '
               +' +(SUM(CASE WHEN F.FPAGOID='''+DMTE.wDeposito+''' AND F.TMONID='''+DMTE.wTMonExt+''' THEN F.TXMTOEXT ELSE 0 END)) TOTALEXT,'
               +' CURRENT TIME HORA,'
               +' 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, '' '' CTACPTO'
               +' FROM CAJA302 A'
               +' LEFT JOIN TGE105  C ON A.BANCOID=C.BANCOID'
               +' LEFT JOIN TGE101  D ON A.CIAID=D.CIAID'
               +' LEFT JOIN TGE103  E ON A.TMONID=E.TMONID'
               +' LEFT JOIN CAJA305 F ON A.CIAID=F.CIAID AND A.TDIARIO2=F.TDIARID AND A.ECANOMM=F.ECANOMM AND A.ECNOCOMP2=F.ECNOCOMP'
               +' Where A.EC_PROCE IN (''7'') AND C.BCOTIPCTA=''C'' '
               +' GROUP BY A.CIAID, D.CIADES, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.DOCID, A.ECNODOC, A.BANCOID, A.CPTOID, A.TMONID, C.BANCONOM'
               +' ) SOLVISTA  '
               +' WHERE BANCOID='''+dblcCaja.Text
               +''' AND (FECHA>='''+dbdtpInicio.Text+''' AND FECHA<='''+dbdtpFin.Text
               +''') AND TIPO=''INGRESO'' AND CIAID='''+dblcCia.Text+''''
               +' ORDER BY PROV, FECHA, HORA ';
      end;
     if (DMTE.SRV_D = 'ORACLE') then
      begin
       xSQL1 := ' SELECT ECNOCOMP, PROV, INGRESOLOC, EGRESOLOC, INGRESOEXT, EGRESOEXT, '
               +' CCGLOSA, CCNOMB, FPAGOID, ECNOCHQ, PAGCHEQUMN, PAGCHEQUME, '
               +' PAGEFECTMN, PAGEFECTME, PAGNOTDMN, PAGNOTDME, FPAGODES, TCAMBIO, CLAUXID, CIAID, '
               +' CIADES, BANCONOM, TMONID, TMONDES, FECHA, CLAUXDES, DOCID, NODOC, CPTOID, CUENTAID, '
               +' CPTODES, TIPO, BANCOID, TOTALLOC, TOTALEXT, HORA, SALDOMN, SALDOME, NORDEN, SALDOANTMN, SALDOANTME,'
               +' CTACPTO, 0.00 DEBEMN, 0.00 HABERMN, 0.00 DEBEME, 0.00 HABERME FROM'
               +' ( SELECT MAX(A.ECNOCOMP) ECNOCOMP, A.CLIEID PROV,  '
               +' DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', MAX(A.NCOMTOLOC), 0) INGRESOLOC,'
               +' DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', 0.00, 0.00 ) EGRESOLOC,'
               +' DECODE( A.TMONID,'''+DMTE.wTMonExt+''', MAX(A.NCOMTOEXT), 0) INGRESOEXT,'
               +' DECODE( A.TMONID,'''+DMTE.wTMonExt+''', 0.00, 0.00 ) EGRESOEXT,'
               +' MAX(A.CCGLOSA) CCGLOSA, MAX(A.CCNOMB) CCNOMB, MAX(B.FPAGOID) FPAGOID, MAX(B.ECNOCHQ) ECNOCHQ,'
               +' SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) PAGCHEQUMN,'
               +' SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ) PAGCHEQUME,'
               +' SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) PAGEFECTMN,'
               +' SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ) PAGEFECTME,'
               +' SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) PAGNOTDMN,'
               +' SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ) PAGNOTDME,'
               +' MAX(B.FPAGODES) FPAGODES,'
               +' MAX(A.NCOTCAMB) TCAMBIO, A.CLAUXID, A.CIAID CIAID, MAX(E.CIADES) CIADES, MAX(D.BANCONOM) BANCONOM,'
               +' A.TMONID, MAX(F.TMONDES) TMONDES, A.CCFEMIS FECHA, MAX(G.CLAUXDES) CLAUXDES, A.DOCID,'
               +' A.CCNODOC NODOC, A.CPTOID, A.CUENTAID, MAX(H.CPTODES) CPTODES, ''INGRESO'' TIPO, A.BANCOID,'
               +' (SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''', B.FC_COBRADO,0)),0) ))'
               +' +(SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''', B.FC_COBRADO,0)),0) ))'
               +' +(SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''', B.FC_COBRADO,0)),0) ) ) TOTALLOC,'
               +' (SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''', B.FC_COBRADO,0)),0) ))'
               +' +(SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''', B.FC_COBRADO,0)),0) ))'
               +' +(SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''', B.FC_COBRADO,0)),0) )) TOTALEXT,'
               +' MAX(A.NCOHREG) HORA, 0.00 SALDOMN, 0.00 SALDOME,''   '' NORDEN , 0.00 SALDOANTMN , 0.00 SALDOANTME, MAX(H.CUENTAID) CTACPTO'
               +' FROM CXC303 A, CAJA314 B, TGE112 C, TGE105 D, TGE101 E, TGE103 F,'
               +' TGE102 G, CAJA201 H'
               +' Where A.NCOESTADO =''C'' AND B.CIAID = A.CIAID'
               +' AND B.DOCID = A.DOCID AND B.CCSERIE=A.CCSERIE'
               +' AND B.CCNODOC = A.CCNODOC AND B.CLAUXID = A.CLAUXID AND B.CLIEID = A.CLIEID'
               +' AND C.FPAGOID = B.FPAGOID'
               +' AND A.BANCOID = D.BANCOID AND D.BCOTIPCTA=''C'' AND A.CIAID = E.CIAID'
               +' AND A.CIAID = E.CIAID AND B.CIAID = E.CIAID AND A.TMONID = F.TMONID'
               +' AND A.CLAUXID = G.CLAUXID AND A.CPTOID = H.CPTOID'
               +' GROUP BY A.CIAID, A.CLIEID, A.BANCOID, A.CPTOID, A.CUENTAID, A.DOCID, A.CCNODOC,'
               +' A.CCFEMIS, A.ECANOMM, A.TMONID, A.CLAUXID';

       xSQL2 := ' UNION ALL '
               +' SELECT A.ECNOCOMP, MAX(A.PROV) PROV, '
               +' SUM( DECODE(A.EC_IE ,''I'' ,(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0)  ) INGRESOLOC, '
               +' 0.00 EGRESOLOC, '
               +' SUM( DECODE(A.EC_IE ,''I'' ,(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) INGRESOEXT, '
               +' 0.00 EGRESOEXT, '
               +''' ''  CCGLOSA, ''TRANSFERENCIA'' AS CCNOMB, MAX(A.FPAGOID) FPAGOID, '' '' ECNOCHQ, '
               +' SUM( DECODE(F.FPAGOID,'''+DMTE.wCheque+''' ,(DECODE(F.TMONID,'''+DMTE.wTMonLoc+''',F.TXMTOLOC,0)),0) ) PAGCHEQUMN, '
               +' SUM( DECODE(F.FPAGOID,'''+DMTE.wCheque+''' ,(DECODE(F.TMONID,'''+DMTE.wTMonExt+''',F.TXMTOEXT,0)),0) ) PAGCHEQUME, '
               +' SUM( DECODE(F.FPAGOID,'''+DMTE.wEfectivo+''' ,(DECODE(F.TMONID,'''+DMTE.wTMonLoc+''',F.TXMTOLOC,0)),0) ) PAGEFECTMN, '
               +' SUM( DECODE(F.FPAGOID,'''+DMTE.wEfectivo+''' ,(DECODE(F.TMONID,'''+DMTE.wTMonExt+''',F.TXMTOEXT,0)),0) ) PAGEFECTME, '
               +' SUM( DECODE(F.FPAGOID,'''+DMTE.wDeposito+''' ,(DECODE(F.TMONID,'''+DMTE.wTMonLoc+''',F.TXMTOLOC,0)),0) ) PAGNOTDMN, '
               +' SUM( DECODE(F.FPAGOID,'''+DMTE.wDeposito+''' ,(DECODE(F.TMONID,'''+DMTE.wTMonExt+''',F.TXMTOEXT,0)),0) ) PAGNOTDME, '
               +' '' ''  FPAGODES, MAX(A.ECTCAMB) TCAMBIO, MAX(A.CLAUXID) CLAUXID, A.CIAID CIAID, D.CIADES, C.BANCONOM, '
               +' A.TMONID, MAX(E.TMONDES) TMONDES, MAX(A.ECFCOMP) FECHA,'' '' CLAUXDES, A.DOCID, A.ECNODOC NODOC,'
               +' A.CPTOID, '' '' , ''TRANSFERENCIA'' CPTODES, ''INGRESO'' TIPO, A.BANCOID,'
               +' (SUM( DECODE(F.FPAGOID,'''+DMTE.wCheque+''' ,(DECODE(F.TMONID,'''+DMTE.wTMonLoc+''',F.TXMTOLOC,0)),0) )) '
               +' +(SUM( DECODE(F.FPAGOID,'''+DMTE.wEfectivo+''' ,(DECODE(F.TMONID,'''+DMTE.wTMonLoc+''',F.TXMTOLOC,0)),0) )) '
               +' +(SUM( DECODE(F.FPAGOID,'''+DMTE.wDeposito+''' ,(DECODE(F.TMONID,'''+DMTE.wTMonLoc+''',F.TXMTOLOC,0)),0) )) TOTALLOC,'
               +' (SUM( DECODE(F.FPAGOID,'''+DMTE.wCheque+''' ,(DECODE(F.TMONID,'''+DMTE.wTMonExt+''',F.TXMTOEXT,0)),0) ) ) '
               +' +(SUM( DECODE(F.FPAGOID,'''+DMTE.wEfectivo+''' ,(DECODE(F.TMONID,'''+DMTE.wTMonExt+''',F.TXMTOEXT,0)),0) )) '
               +' +(SUM( DECODE(F.FPAGOID,'''+DMTE.wDeposito+''' ,(DECODE(F.TMONID,'''+DMTE.wTMonExt+''',F.TXMTOEXT,0)),0) )) TOTALEXT,'
               +' MAX(A.ECHREG) HORA, 0.00 SALDOMN, 0.00 SALDOME, ''  '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
               +' FROM CAJA302 A, TGE105 C, TGE101 D, TGE103 E, CAJA305 F'
               +' Where A.EC_PROCE IN (''7'') AND A.ECESTADO =''C'' '
               +' AND A.BANCOID = C.BANCOID AND C.BCOTIPCTA = ''C'' AND A.CIAID = D.CIAID'
               +' AND A.TMONID = E.TMONID'
               +' AND A.CIAID = F.CIAID AND A.TDIARIO2 = F.TDIARID AND A.ECANOMM = F.ECANOMM AND A.ECNOCOMP2 = F.ECNOCOMP'
               +' GROUP BY A.CIAID, D.CIADES, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.DOCID, A.ECNODOC, A.BANCOID, A.CPTOID, A.TMONID, C.BANCONOM'
      end;
    end;
   if RbEgreso.Checked = True then
    begin
     if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
      begin
       xSQL1 := ' SELECT ECNOCOMP, PROV, INGRESOLOC, EGRESOLOC, INGRESOEXT, EGRESOEXT, '
               +' CCGLOSA, CCNOMB, FPAGOID, ECNOCHQ, PAGCHEQUMN, PAGCHEQUME, '
               +' PAGEFECTMN, PAGEFECTME, PAGNOTDMN, PAGNOTDME, FPAGODES, TCAMBIO, CLAUXID, CIAID, '
               +' CIADES, BANCONOM, TMONID, TMONDES, FECHA, CLAUXDES, DOCID, NODOC, CPTOID, CUENTAID, '
               +' CPTODES, TIPO, BANCOID, TOTALLOC, TOTALEXT, HORA, SALDOMN, SALDOME, NORDEN, SALDOANTMN, '
               +' SALDOANTME, CTACPTO, 0.00 DEBEMN, 0.00 HABERMN, 0.00 DEBEME, 0.00 HABERME FROM   '
               +' ( SELECT A.ECNOCOMP, A.PROV PROV, '
               +' (CASE WHEN (A.EC_IE =''I'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END )  INGRESOLOC, '
               +' (CASE WHEN (A.EC_IE =''E'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END )  EGRESOLOC, '
               +' (CASE WHEN (A.EC_IE =''I'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END )  INGRESOEXT, '
               +' (CASE WHEN (A.EC_IE =''E'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END )  EGRESOEXT, '
               +''' '' AS CCGLOSA,H.PROVDES  CCNOMB, A.FPAGOID,A.ECNOCHQ, '
               +' (CASE WHEN (B.FCHQ=''S'' OR B.FCHQ=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGCHEQUMN,'
               +' (CASE WHEN (B.FCHQ=''S'' OR B.FCHQ=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGCHEQUME,'
               +' (CASE WHEN (B.FEFE=''S'' OR B.FEFE=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGEFECTMN,'
               +' (CASE WHEN (B.FEFE=''S'' OR B.FEFE=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGEFECTME,'
               +' (CASE WHEN (B.FNDE=''S'' OR B.FNDE=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGNOTDMN,'
               +' (CASE WHEN (B.FNDE=''S'' OR B.FNDE=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGNOTDME,'
               +' B.FPAGODES, A.ECTCAMB  TCAMBIO,A.CLAUXID, A.CIAID CIAID , D.CIADES, C.BANCONOM,'
               +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, F.CLAUXDES,'
               +' CASE WHEN A.EC_PROCE=''1'' THEN ''PAG. NO PROV'' ELSE  ''PAG.PROV'' END  DOCID ,A.ECNOCOMP NODOC,'
               +' A.CPTOID, A.CUENTAID, G.CPTODES, ''EGRESO'' TIPO, A.BANCOID,'
               +' ((CASE WHEN (B.FCHQ=''S'' OR B.FCHQ=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END))'
               +' +((CASE WHEN (B.FEFE=''S'' OR B.FEFE=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END))'
               +' +((CASE WHEN (B.FNDE=''S'' OR B.FNDE=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END)) TOTALLOC,'
               +' ((CASE WHEN (B.FCHQ=''S'' OR B.FCHQ=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END)) '
               +' +((CASE WHEN (B.FEFE=''S'' OR B.FEFE=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END))'
               +' +((CASE WHEN (B.FNDE=''S'' OR B.FNDE=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END)) TOTALEXT,'
               +' A.ECHREG HORA , 0.00 SALDOMN, 0.00 SALDOME,''   '' NORDEN ,0.00 SALDOANTMN ,0.00 SALDOANTME, ''  '' CTACPTO'
               +' FROM CAJA302 A, TGE112 B ,TGE105 C, TGE101 D, TGE103 E, TGE102 F,CAJA201 G, TGE201 H'
               +' Where (CASE WHEN A.EC_IE =''E'' THEN A.ECMTOLOC ELSE 0 END )>0'
               +' AND A.EC_PROCE IN (''B'',''1'') AND A.ECESTADO=''C'' AND A.FPAGOID=B.FPAGOID'
               +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID AND A.TMONID=E.TMONID'
               +' AND A.CLAUXID=F.CLAUXID AND A.CPTOID=G.CPTOID AND A.PROV=H.PROV';
       xSQL2 := ' UNION ALL '
               +' SELECT A.ECNOCOMP, A.PROV PROV, '
               +' 0.00 INGRESOLOC, '
               +' (CASE WHEN (A.EC_IE =''E'' AND A.TMONID='''+DMTE.wTMonLoc+''') THEN A.ECMTOLOC ELSE 0 END ) EGRESOLOC,'
               +' 0.00   INGRESOEXT, '
               +' (CASE WHEN (A.EC_IE =''E'' AND A.TMONID='''+DMTE.wTMonExt+''') THEN A.ECMTOEXT ELSE 0 END ) EGRESOEXT,'
               +' '' '' CCGLOSA, ''TRANSFERENCIA'' CCNOMB, A.FPAGOID,A.ECNOCHQ,'
               +' 0.00 PAGCHEQUMN, '
               +' 0.00 PAGCHEQUME, '
               +' (CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGEFECTMN,'
               +' (CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGEFECTME,'
               +' 0.00 PAGNOTDMN,'
               +' 0.00 PAGNOTDME,'
               +' '' ''  FPAGODES, A.ECTCAMB TCAMBIO, A.CLAUXID, A.CIAID CIAID , D.CIADES, C.BANCONOM,'
               +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, '' '' CLAUXDES,A.DOCID,A.ECNODOC NODOC,'
               +' A.CPTOID,A.CUENTAID ,''TRANSFERENCIA'' CPTODES,''EGRESO'' TIPO ,A.BANCOID,'
               +' (CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) TOTALLOC,'
               +' (CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) TOTALEXT,'
               +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN , 0.00 SALDOANTMN, 0.00 SALDOANTME,''  '' CTACPTO'
               +' FROM CAJA302 A, TGE105 C, TGE101 D, TGE103 E'
               +' Where (CASE WHEN A.EC_IE =''E'' THEN A.ECMTOLOC ELSE 0 END )>0'
               +' AND A.EC_PROCE IN (''4'') AND A.ECESTADO=''C'' '
               +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID'
               +' AND A.TMONID=E.TMONID'
               +'  ) SOLVISTA'
               +' WHERE BANCOID='''+dblcCaja.Text
               +''' AND (FECHA>='''+dbdtpInicio.Text+''' AND FECHA<='''+dbdtpFin.Text
               +''') AND TIPO=''EGRESO'' AND CIAID='''+dblcCia.Text+''''
               +' ORDER BY PROV, FECHA, HORA';

      end;
     if (DMTE.SRV_D = 'ORACLE') then
      begin
       xSQL1 := ' SELECT ECNOCOMP, PROV,INGRESOLOC, EGRESOLOC, INGRESOEXT, EGRESOEXT,'
               +' CCGLOSA, CCNOMB, FPAGOID, ECNOCHQ, PAGCHEQUMN, PAGCHEQUME,'
               +' PAGEFECTMN, PAGEFECTME, PAGNOTDMN, PAGNOTDME, FPAGODES, TCAMBIO, CLAUXID, CIAID,'
               +' CIADES, BANCONOM, TMONID, TMONDES, FECHA, CLAUXDES, DOCID, NODOC, CPTOID, CUENTAID,'
               +' CPTODES, TIPO, BANCOID, TOTALLOC, TOTALEXT, HORA, SALDOMN, SALDOME, NORDEN, SALDOANTMN, SALDOANTME,'
               +' CTACPTO, 0.00 DEBEMN, 0.00 HABERMN, 0.00 DEBEME, 0.00 HABERME FROM'
               +' ( '
               +' SELECT A.ECNOCOMP, A.PROV PROV,'
               +' ( DECODE(A.EC_IE,''I'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC,0)),0) ) INGRESOLOC,'
               +' ( DECODE(A.EC_IE,''E'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC,0)),0) ) EGRESOLOC,'
               +' ( DECODE(A.EC_IE,''I'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''',A.ECMTOEXT,0)),0) ) INGRESOEXT,'
               +' ( DECODE(A.EC_IE,''E'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''',A.ECMTOEXT,0)),0) ) EGRESOEXT,'
               +' '' '' AS CCGLOSA,H.PROVDES  CCNOMB, A.FPAGOID,A.ECNOCHQ, '
               +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) PAGCHEQUMN,'
               +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) PAGCHEQUME,'
               +' ( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) PAGEFECTMN,'
               +' ( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) PAGEFECTME,'
               +' ( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) PAGNOTDMN,'
               +' ( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) PAGNOTDME,'
               +' B.FPAGODES, A.ECTCAMB TCAMBIO, A.CLAUXID, A.CIAID CIAID, D.CIADES, C.BANCONOM,'
               +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, F.CLAUXDES,'
               +' DECODE(A.EC_PROCE,''1'', ''PAG. NO PROV'',''PAG.PROV'') DOCID, A.ECNOCOMP NODOC,'
               +' A.CPTOID,A.CUENTAID, G.CPTODES, ''EGRESO'' TIPO, A.BANCOID,'
               +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) )'
               +' +( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) )'
               +' +(( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) )) TOTALLOC,'
               +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) '
               +' +( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) '
               +' +( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) TOTALEXT, '
               +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME,''  '' CTACPTO'
               +' FROM CAJA302 A, TGE112 B, TGE105 C, TGE101 D, TGE103 E, TGE102 F, CAJA201 G, TGE201 H'
               +' Where (CASE WHEN A.EC_IE =''E'' THEN A.ECMTOLOC ELSE 0 END )>0'
               +' AND A.EC_PROCE IN (''B'',''1'') AND A.ECESTADO=''C'' AND A.FPAGOID=B.FPAGOID'
               +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID AND A.TMONID=E.TMONID'
               +' AND A.CLAUXID=F.CLAUXID AND A.CPTOID=G.CPTOID AND A.PROV=H.PROV ';
       xSQL2 := ' UNION ALL '
               +' SELECT A.ECNOCOMP, A.PROV PROV,'
               +' 0.00 INGRESOLOC,'
               +' ( DECODE(A.EC_IE ,''E'' ,(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC,0)),0)) EGRESOLOC,'
               +' 0.00 INGRESOEXT,'
               +' ( DECODE(A.EC_IE ,''E'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0)) EGRESOEXT,'
               +' '' ''  CCGLOSA,''TRANSFERENCIA''  CCNOMB, A.FPAGOID,A.ECNOCHQ,'
               +' 0.00 PAGCHEQUMN,'
               +' 0.00 PAGCHEQUME,'
               +' ( DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0) ) PAGEFECTMN,'
               +' ( DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0) ) PAGEFECTME,'
               +' 0.00 PAGNOTDMN,'
               +' 0.00 PAGNOTDME,'
               +' '' '' FPAGODES, A.ECTCAMB TCAMBIO, A.CLAUXID, A.CIAID CIAID, D.CIADES, C.BANCONOM,'
               +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, '' '' CLAUXDES, A.DOCID, A.ECNODOC NODOC,'
               +' A.CPTOID, A.CUENTAID, ''TRANSFERENCIA'' CPTODES, ''EGRESO'' TIPO, A.BANCOID,'
               +' ( DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0 ) ) TOTALLOC,'
               +' ( DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0 ) ) TOTALEXT,'
               +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
               +' FROM CAJA302 A, TGE105 C, TGE101 D, TGE103 E'
               +' WHERE'
               +' A.EC_PROCE IN (''4'') AND A.ECESTADO=''C'' '
               +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID'
               +' AND A.TMONID=E.TMONID'
               +' ) SOLVISTA '
               +' WHERE BANCOID='''+dblcCaja.Text
               +''' AND (FECHA>='''+dbdtpInicio.Text+''' AND FECHA<='''+dbdtpFin.Text
               +''') AND TIPO=''EGRESO'' AND CIAID='+QuotedStr(dblcCia.Text)
               +' ORDER BY PROV, FECHA, HORA';
      end;

     FConsulta.xfiltroMovLibCaja.UsuarioSQL.Clear;
     FConsulta.xfiltroMovLibCaja.FMant.wTabla := 'VWCAJAMOVCAJA';
     FConsulta.xfiltroMovLibCaja.UsuarioSQL.Add( xSQL1+xSQL2 );
     FConsulta.xfiltroMovLibCaja.NewQuery;

{      Fprincipal.xfiltroMovLibCaja.FMant.cds2.Filter:='  BANCOID='''+dblcCaja.TEXT
      +''' AND (FECHA>='''+dbdtpInicio.TEXT+''' AND FECHA<='''+dbdtpFin.TEXT
      +''') AND TIPO=''EGRESO'' AND CIAID='''+dblcCia.TEXT+'''';}
    end;
   FConsulta.xfiltroMovLibCaja.FMant.cds2.Filtered := True;

   if FConsulta.xfiltroMovLibCaja.FMant.cds2.RecordCount>0 then
    begin
     ppDBIngresoCaja.DataSource  := FConsulta.xfiltroMovLibCaja.FMant.ds2;
     pprIngresoCaja.DataPipeline := ppDBIngresoCaja;

     pprIngresoCaja.Template.FileName := wRutaRpt + '\MovDiarioDetallado.rtm';
     pprIngresoCaja.Template.LoadFromFile;
     pplblFecini.Caption := dbdtpInicio.Text;
     pplblFecFin.Caption := dbdtpFin.Text;

     pprIngresoCaja.Print;
    end
   else
    begin
     Beep;
     MessageDlg('No hay Registros que Mostrar', mtInformation, [mbOk], 0);
    end;
end;

procedure TFToolMovCaja.bbtnMovDiaClick(Sender: TObject);
var
   xSQL : String;
   xSQL1, xSQL2, xSQL3, xSQL4, xSQL5, xSQL6 : String;
begin
   dblcdAnoMes.Enabled := False;
   If Length(dblcCia.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Compañía', mtInformation, [mbOk], 0);
     dblcCia.SetFocus;
     Exit;
    end;

   if Length(dblcCaja.Text) = 0 then
    begin
     Beep;
     MessageDlg('Debe Seleccionar la Caja', mtInformation, [mbOk], 0);
     dblcCaja.SetFocus;
     Exit;
    end;

   if Length(dbdtpInicio.Text) = 0 then
    begin
     Beep;
     MessageDlg('Debe Seleccionar la Fecha de Inicio', mtInformation, [mbOk], 0);
     dbdtpInicio.SetFocus;
     Exit;
    end;

   if Length(dbdtpFin.Text) = 0 then
    begin
     Beep;
     MessageDlg('Debe Seleccionar la Fecha de Término', mtInformation, [mbOk], 0);
     dbdtpFin.SetFocus;
     Exit;
    end;

   If (dbdtpInicio.DateTime) > (dbdtpFin.DateTime) Then
    begin
     Beep;
     MessageDlg('La Fecha de Inicio es Mayor a la Fecha de Fin', mtInformation, [mbOk], 0);
     dbdtpInicio.SetFocus;
     Exit;
    end;

    xSQL := FConsulta.xfiltroMovLibCaja.FMant.SQL;
    FConsulta.xfiltroMovLibCaja.FMant.cds2.Filtered := False;

    if RbIngreso.Checked = True then
     begin
      if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
       begin
{        xSQL1 := ' SELECT ECNOCOMP, PROV, INGRESOLOC, EGRESOLOC, INGRESOEXT, EGRESOEXT, '
                +' CCGLOSA, CCNOMB, FPAGOID, ECNOCHQ, PAGCHEQUMN, PAGCHEQUME, '
                +' PAGEFECTMN, PAGEFECTME, PAGNOTDMN, PAGNOTDME, FPAGODES, TCAMBIO, CLAUXID, CIAID, '
                +' CIADES, BANCONOM, TMONID, TMONDES, FECHA, CLAUXDES, DOCID, NODOC, CPTOID, CUENTAID, '
                +' CPTODES, TIPO, BANCOID, TOTALLOC, TOTALEXT, HORA,SALDOMN, SALDOME, NORDEN, SALDOANTMN, '
                +' SALDOANTME, CTACPTO, 0.00 DEBEMN, 0.00 HABERMN, 0.00 DEBEME, 0.00 HABERME FROM '
                +' (  SELECT MAX(A.ECNOCOMP) ECNOCOMP, A.CLIEID PROV,'
                +' CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN MAX(A.NCOMTOLOC) ELSE 0 END INGRESOLOC, '
                +' CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN 0.00 ELSE 0.00 END EGRESOLOC , '
                +' CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN MAX(A.NCOMTOEXT) ELSE 0 END INGRESOEXT , '
                +' CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN 0.00 ELSE 0.00 END EGRESOEXT , '
                +' MAX(A.CCGLOSA) CCGLOSA,MAX(A.CCNOMB) CCNOMB,MAX(B.FPAGOID) FPAGOID, MAX(B.ECNOCHQ) ECNOCHQ, '
                +' SUM(CASE WHEN (C.FCHQ=''S'' OR C.FCHQ=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO   ELSE 0 END) PAGCHEQUMN, '
                +' SUM(CASE WHEN (C.FCHQ=''S'' OR C.FCHQ=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO   ELSE 0 END) PAGCHEQUME, '
                +' SUM(CASE WHEN (C.FEFE=''S'' OR C.FEFE=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO   ELSE 0 END) PAGEFECTMN, '
                +' SUM(CASE WHEN (C.FEFE=''S'' OR C.FEFE=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO   ELSE 0 END) PAGEFECTME, '
                +' SUM(CASE WHEN (C.FNDE=''S'' OR C.FNDE=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO   ELSE 0 END) PAGNOTDMN, '
                +' SUM(CASE WHEN (C.FNDE=''S'' OR C.FNDE=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO   ELSE 0 END) PAGNOTDME, '
                +' MAX(B.FPAGODES) FPAGODES, '
                +' MAX(A.NCOTCAMB)   TCAMBIO, A.CLAUXID ,A.CIAID CIAID, MAX(E.CIADES) CIADES, MAX(D.BANCONOM) BANCONOM,'
                +' A.TMONID, MAX(F.TMONDES) TMONDES, A.CCFEMIS FECHA , MAX(G.CLAUXDES) CLAUXDES,A.DOCID, '
                +' A.CCNODOC NODOC ,A.CPTOID,A.CUENTAID, MAX(H.CPTODES) CPTODES,''INGRESO'' TIPO,A.BANCOID, '
                +' (SUM( CASE WHEN (C.FCHQ=''S'' OR C.FCHQ=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO ELSE 0 END))'
                +' +(SUM(CASE WHEN (C.FEFE=''S'' OR C.FEFE=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO ELSE 0 END)) '
                +' +(SUM(CASE WHEN (C.FNDE=''S'' OR C.FNDE=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO ELSE 0 END)) TOTALLOC,'
                +' (SUM(CASE WHEN  (C.FCHQ=''S'' OR C.FCHQ=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO ELSE 0 END)) '
                +'+ (SUM(CASE WHEN (C.FEFE=''S'' OR C.FEFE=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO ELSE 0 END)) '
                +' +(SUM(CASE WHEN (C.FNDE=''S'' OR C.FNDE=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO ELSE 0 END)) TOTALEXT, '
                +' MAX(A.NCOHREG) HORA, 0.00 SALDOMN, 0.00 SALDOME,''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, MAX(H.CUENTAID) CTACPTO '
                +' FROM CXC303 A, CAJA314 B, TGE112 C, TGE105 D, TGE101 E, TGE103 F, '
                +' TGE102 G, CAJA201 H  '
                +' Where A.NCOESTADO=''C'' AND B.CIAID=A.CIAID '
                +' AND B.DOCID=A.DOCID AND B.CCSERIE=A.CCSERIE '
                +' AND B.CCNODOC=A.CCNODOC  AND B.CLAUXID=A.CLAUXID AND B.CLIEID=A.CLIEID '
                +' AND C.FPAGOID=B.FPAGOID '
                +' AND A.BANCOID=D.BANCOID AND D.BCOTIPCTA=''C'' AND A.CIAID=E.CIAID  '
                +' AND A.CIAID=E.CIAID AND B.CIAID=E.CIAID  AND A.TMONID=F.TMONID '
                +' AND A.CLAUXID=G.CLAUXID AND A.CPTOID=H.CPTOID'
                +' AND A.CIAID ='+QuotedStr(dblcCia.Text)
                +' GROUP BY A.CIAID,A.CLIEID, A.BANCOID, A.CPTOID, A.CUENTAID, A.DOCID, A.CCNODOC, '
                +' A.CCFEMIS, A.ECANOMM, A.TMONID, A.CLAUXID';}

        xSQL1 := ' SELECT ECNOCOMP, PROV, INGRESOLOC, EGRESOLOC, INGRESOEXT, EGRESOEXT,'
                +' CCGLOSA, CCNOMB, FPAGOID, ECNOCHQ, PAGCHEQUMN, PAGCHEQUME,'
                +' PAGEFECTMN, PAGEFECTME, PAGNOTDMN, PAGNOTDME, FPAGODES, TCAMBIO, CLAUXID, CIAID,'
                +' CIADES, BANCONOM, TMONID, TMONDES, FECHA, CLAUXDES, DOCID, NODOC, CPTOID, CUENTAID,'
                +' CPTODES, TIPO, BANCOID, TOTALLOC, TOTALEXT, HORA, SALDOMN, SALDOME, NORDEN, SALDOANTMN, SALDOANTME,'
                +' CTACPTO, 0.00 DEBEMN, 0.00 HABERMN, 0.00 DEBEME, 0.00 HABERME FROM'
                +' ( SELECT MAX(A.ECNOCOMP) ECNOCOMP, A.CLIEID PROV,'
                +' DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', MAX(A.NCOMTOLOC), 0) INGRESOLOC,'
                +' DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', 0.00 , 0.00 ) EGRESOLOC,'
                +' DECODE( A.TMONID,'''+DMTE.wTMonExt+''', MAX(A.NCOMTOEXT), 0 ) INGRESOEXT,'
                +' DECODE( A.TMONID,'''+DMTE.wTMonExt+''', 0.00, 0.00 ) EGRESOEXT,'
                +' MAX(A.CCGLOSA) CCGLOSA, MAX(A.CCNOMB) CCNOMB, MAX(B.FPAGOID) FPAGOID, MAX(B.ECNOCHQ) ECNOCHQ,'
                +' SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) PAGCHEQUMN,'
                +' SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ) PAGCHEQUME,'
                +' SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) PAGEFECTMN,'
                +' SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ) PAGEFECTME,'
                +' SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) PAGNOTDMN,'
                +' SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ) PAGNOTDME,'
                +' MAX(B.FPAGODES) FPAGODES,'
                +' MAX(A.NCOTCAMB) TCAMBIO, A.CLAUXID, A.CIAID CIAID, MAX(E.CIADES) CIADES, MAX(D.BANCONOM) BANCONOM,'
                +' A.TMONID, MAX(F.TMONDES) TMONDES, A.CCFEMIS FECHA, MAX(G.CLAUXDES) CLAUXDES, A.DOCID,'
                +' A.CCNODOC NODOC, A.CPTOID, A.CUENTAID, MAX(H.CPTODES) CPTODES, ''INGRESO'' TIPO, A.BANCOID,'
                +' (SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ))'
                +' +(SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ))'
                +' +(SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) ) TOTALLOC,'
                +' (SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ))'
                +' + (SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) )) '
                +' +(SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) )) TOTALEXT,'
                +' MAX(A.NCOHREG) HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, MAX(H.CUENTAID) CTACPTO'
//                +' FROM CXC303 A, CAJA314 B, TGE112 C, TGE105 D, TGE101 E, TGE103 F,'
//                +' TGE102 G, CAJA201 H'
                +' FROM CXC303 A LEFT JOIN CAJA314 B ON (A.CIAID = B.CIAID AND A.DOCID = B.DOCID AND A.CCSERIE = B.CCSERIE'
                +'                                             AND A.CCNODOC = B.CCNODOC AND A.CLAUXID = B.CLAUXID'
                +'                                             AND A.CLIEID = B.CLIEID)'
                +'               LEFT OUTER JOIN TGE105 D ON (A.BANCOID = D.BANCOID)'
                +'               LEFT OUTER JOIN TGE101 E ON (A.CIAID = E.CIAID)'
                +'               LEFT OUTER JOIN TGE103 F ON (A.TMONID = F.TMONID)'
                +'               LEFT OUTER JOIN TGE102 G ON (A.CLAUXID = G.CLAUXID)'
                +'               LEFT JOIN CAJA201 H ON (A.CPTOID = H.CPTOID)'
                +' CAJA314 B LEFT OUTER JOIN TGE112 C ON (B.FPAGOID = C.FPAGOID)'
                +'           LEFT OUTER JOIN TGE101 E ON (B.CIAID = E.CIAID)'
                +' Where A.NCOESTADO =''C'''
                +' AND D.BCOTIPCTA =''C'''
                +' AND A.CIAID ='+QuotedStr(dblcCia.Text)
                +' GROUP BY A.CIAID, A.CLIEID, A.BANCOID, A.CPTOID, A.CUENTAID, A.DOCID, A.CCNODOC, '
                +' A.CCFEMIS, A.ECANOMM, A.TMONID, A.CLAUXID';

        xSQL2 := 'UNION ALL'
                +' SELECT A.ECNOCOMP, A.PROV PROV, ( DECODE(A.EC_IE ,''I'' ,(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) INGRESOLOC,'
                +' CASE WHEN A.TMONID=''N'' THEN ECMTOLOC ELSE 0 END EGRESOLOC,'
                +' 0.00 INGRESOEXT, CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN ECMTOEXT ELSE 0 END EGRESOEXT, A.ECGLOSA CCGLOSA, '''' CCNOMB, A.FPAGOID,'
                +' A.ECNOCHQ, 0.00 PAGCHEQUMN, 0.00 PAGCHEQUME, (DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0) ) PAGEFECTMN,'
                +' (DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0) ) PAGEFECTME, 0.00 PAGNOTDMN,'
                +' 0.00 PAGNOTDME, '''' FPAGODES,'
                +' A.ECTCAMB TCAMBIO, A.CLAUXID, A.CIAID, D.CIADES, E.BANCONOM, A.TMONID, F.TMONDES, A.ECFCOMP FECHA, G.CLAUXDES, A.DOCID,'
                +' A.ECNODOC NODOC, A.CPTOID, A.CUENTAID, '''' CPTODES, '''' TIPO, A.BANCOID, (DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0 ) ) TOTALLOC,'
                +' (DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0 ) ) TOTALEXT, A.ECHREG HORA, 0.00  SALDOMN, 0.00 SALDOME, '''' NORDEN, 0.00 SALDOANTMN,'
                +' 0.00 SALDOANTME, '''' CTACPTO'
                +' FROM CAJA302 A LEFT OUTER JOIN TGE106 B ON (A.BANCOID = B.BANCOID)'
                +'                LEFT OUTER JOIN TGE110 C ON (A.DOCID = C.DOCID)'
                +'                LEFT OUTER JOIN TGE101 D ON (A.CIAID = D.CIAID)'
                +'                LEFT OUTER JOIN TGE105 E ON (A.BANCOID = E.BANCOID)'
                +'                LEFT OUTER JOIN TGE103 F ON (A.TMONID = F.TMONID)'
                +'                LEFT OUTER JOIN TGE102 G ON (A.CLAUXID = G.CLAUXID)'
                +' WHERE E.BCOTIPCTA='+QuotedStr('C')
                +' AND A.EC_PROCE IN (''7'',''9'')'
                +' AND To_Date(To_Char(ECFCOMP, ''DD/MM/YYYY'')) >='+QuotedStr(DateToStr(dbdtpInicio.Date))
                +' AND To_Date(To_Char(ECFCOMP, ''DD/MM/YYYY'')) <='+QuotedStr(DateToStr(dbdtpFin.Date))
                +' And EC_IE = ''I'''
                +' And B.CIAID ='+QuotedStr('02')
                +' And C.DOCMOD =''CAJA'''
                +' And A.CIAID ='+QuotedStr(dblcCia.Text);


        xSQL3 := ' UNION ALL'
                +' SELECT A.ECNOCOMP, A.PROV PROV, '
                +' ( DECODE(A.EC_IE ,''I'' ,(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) INGRESOLOC,'
                +' 0.00 EGRESOLOC,'
                +' ( DECODE(A.EC_IE ,''I'' ,(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) INGRESOEXT,'
                +' 0.00 EGRESOEXT,'
                +' '' '' CCGLOSA, ''TRANSFERENCIA'' AS CCNOMB, A.FPAGOID, A.ECNOCHQ,'
                +' 0.00 PAGCHEQUMN,'
                +' 0.00 PAGCHEQUME,'
                +' (DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0) ) PAGEFECTMN,'
                +' (DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0) ) PAGEFECTME,'
                +' 0.00 PAGNOTDMN,'
                +' 0.00 PAGNOTDME,'
                +' '' '' FPAGODES, A.ECTCAMB TCAMBIO, A.CLAUXID, A.CIAID CIAID , D.CIADES, C.BANCONOM,'
                +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, '' '' CLAUXDES, A.DOCID, A.ECNODOC NODOC,'
                +' A.CPTOID, A.CUENTAID, ''TRANSFERENCIA'' CPTODES, ''INGRESO'' TIPO, A.BANCOID,'
                +' (DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0 ) ) TOTALLOC,'
                +' (DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0 ) ) TOTALEXT,'
                +' A.ECHREG HORA, 0.00  SALDOMN, 0.00 SALDOME, ''  '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
                +' FROM CAJA302 A, TGE105 C, TGE101 D, TGE103 E'
                +' FROM CAJA302 A LEFT JOIN TGE105 C ON (A.BANCOID = C.BANCOID)'
                +'                LEFT JOIN TGE101 D ON (A.CIAID = D.CIAID)'
                +'                LEFT JOIN TGE103 E ON (A.TMONID = E,TMONID)'
                +' Where A.EC_PROCE IN (''7'') AND A.ECESTADO=''C'''
                +' AND C.BCOTIPCTA =''C'''
                +' AND A.CIAID ='+QuotedStr(dblcCia.Text)
                +' ) SOLVISTA'
                +' WHERE BANCOID='+QuotedStr(dblcCaja.Text)
                +' AND (To_Date(To_Char(FECHA, ''DD/MM/YYYY'')) >='+QuotedStr(DateToStr(dbdtpInicio.Date))
                +' AND To_Date(To_Char(FECHA, ''DD/MM/YYYY'')) <='+QuotedStr(DateToStr(dbdtpFin.Date))
                +' ) AND TIPO=''INGRESO'' AND CIAID='+QuotedStr(dblcCia.Text)

{        xSQL3 := ' UNION ALL '
                +' SELECT A.ECNOCOMP, A.PROV PROV,'
                +' (CASE WHEN (A.EC_IE =''I'' AND A.TMONID='''+DMTE.wTMonLoc+''') THEN A.ECMTOLOC ELSE 0 END ) INGRESOLOC,'
                +' 0.00 EGRESOLOC,'
                +' (CASE WHEN (A.EC_IE =''I'' AND A.TMONID='''+DMTE.wTMonExt+''') THEN A.ECMTOEXT ELSE 0 END ) INGRESOEXT,'
                +' 0.00 EGRESOEXT,'
                +''' ''  CCGLOSA,''TRANSFERENCIA'' AS CCNOMB, A.FPAGOID, A.ECNOCHQ, '
                +' 0.00 PAGCHEQUMN,'
                +' 0.00 PAGCHEQUME,'
                +' (CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGEFECTMN,'
                +' (CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGEFECTME,'
                +' 0.00 PAGNOTDMN,'
                +' 0.00 PAGNOTDME,'
                +' '' ''  FPAGODES, A.ECTCAMB TCAMBIO, A.CLAUXID, A.CIAID CIAID, D.CIADES, C.BANCONOM,'
                +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA  ,'' '' CLAUXDES, A.DOCID, A.ECNODOC NODOC,'
                +' A.CPTOID, A.CUENTAID, ''TRANSFERENCIA'' CPTODES, ''INGRESO'' TIPO, A.BANCOID,'
                +' (CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) TOTALLOC,'
                +' (CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) TOTALEXT,'
                +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''  '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
                +' FROM CAJA302 A ,TGE105 C, TGE101 D, TGE103 E'
                +' Where A.EC_PROCE IN (''7'') '
                +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID'
                +' AND A.CIAID ='+QuotedStr(dblcCia.Text)
                +' AND A.TMONID=E.TMONID  ) SOLVISTA'
                +' WHERE BANCOID='''+dblcCaja.Text
                +''' AND (FECHA>='''+dbdtpInicio.Text+''' AND FECHA<='''+dbdtpFin.Text
                +''') AND TIPO=''INGRESO'' AND CIAID='''+dblcCia.Text+''''   }
                +' ORDER BY FECHA, HORA ';
       end;

      if (DMTE.SRV_D = 'ORACLE') then
       begin
        xSQL1 := ' SELECT ECNOCOMP, PROV, INGRESOLOC, EGRESOLOC, INGRESOEXT, EGRESOEXT,'
                +' CCGLOSA, CCNOMB, FPAGOID, ECNOCHQ, PAGCHEQUMN, PAGCHEQUME,'
                +' PAGEFECTMN, PAGEFECTME, PAGNOTDMN, PAGNOTDME, FPAGODES, TCAMBIO, CLAUXID, CIAID,'
                +' CIADES, BANCONOM, TMONID, TMONDES, FECHA, CLAUXDES, DOCID, NODOC, CPTOID, CUENTAID,'
                +' CPTODES, TIPO, BANCOID, TOTALLOC, TOTALEXT, HORA, SALDOMN, SALDOME, NORDEN, SALDOANTMN, SALDOANTME,'
                +' CTACPTO, 0.00 DEBEMN, 0.00 HABERMN, 0.00 DEBEME, 0.00 HABERME FROM'
                +' ( SELECT MAX(A.ECNOCOMP) ECNOCOMP, A.CLIEID PROV,'
                +' DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', MAX(A.NCOMTOLOC), 0) INGRESOLOC,'
                +' DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', 0.00 , 0.00 ) EGRESOLOC,'
                +' DECODE( A.TMONID,'''+DMTE.wTMonExt+''', MAX(A.NCOMTOEXT), 0 ) INGRESOEXT,'
                +' DECODE( A.TMONID,'''+DMTE.wTMonExt+''', 0.00, 0.00 ) EGRESOEXT,'
                +' MAX(A.CCGLOSA) CCGLOSA, MAX(A.CCNOMB) CCNOMB, MAX(B.FPAGOID) FPAGOID, MAX(B.ECNOCHQ) ECNOCHQ,'
                +' SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) PAGCHEQUMN,'
                +' SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ) PAGCHEQUME,'
                +' SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) PAGEFECTMN,'
                +' SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ) PAGEFECTME,'
                +' SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) PAGNOTDMN,'
                +' SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ) PAGNOTDME,'
                +' MAX(B.FPAGODES) FPAGODES,'
                +' MAX(A.NCOTCAMB) TCAMBIO, A.CLAUXID, A.CIAID CIAID, MAX(E.CIADES) CIADES, MAX(D.BANCONOM) BANCONOM,'
                +' A.TMONID, MAX(F.TMONDES) TMONDES, A.CCFEMIS FECHA, MAX(G.CLAUXDES) CLAUXDES, A.DOCID,'
                +' A.CCNODOC NODOC, A.CPTOID, A.CUENTAID, MAX(H.CPTODES) CPTODES, ''INGRESO'' TIPO, A.BANCOID,'
                +' (SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ))'
                +' +(SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ))'
                +' +(SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) ) TOTALLOC,'
                +' (SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ))'
                +' + (SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) )) '
                +' +(SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) )) TOTALEXT,'
                +' MAX(A.NCOHREG) HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, MAX(H.CUENTAID) CTACPTO'
                +' FROM CXC303 A, CAJA314 B, TGE112 C, TGE105 D, TGE101 E, TGE103 F,'
                +' TGE102 G, CAJA201 H'
                +' Where A.NCOESTADO=''C'' AND B.CIAID=A.CIAID'
                +' AND B.DOCID=A.DOCID AND B.CCSERIE=A.CCSERIE'
                +' AND B.CCNODOC=A.CCNODOC AND B.CLAUXID=A.CLAUXID AND B.CLIEID=A.CLIEID'
                +' AND C.FPAGOID=B.FPAGOID'
                +' AND A.BANCOID=D.BANCOID AND D.BCOTIPCTA=''C'' AND A.CIAID=E.CIAID'
                +' AND A.CIAID=E.CIAID AND B.CIAID=E.CIAID AND A.TMONID=F.TMONID'
                +' AND A.CLAUXID=G.CLAUXID AND A.CPTOID=H.CPTOID'
                +' AND A.CIAID ='+QuotedStr(dblcCia.Text)
                +' GROUP BY A.CIAID, A.CLIEID, A.BANCOID, A.CPTOID, A.CUENTAID, A.DOCID, A.CCNODOC, '
                +' A.CCFEMIS, A.ECANOMM, A.TMONID, A.CLAUXID';

        xSQL2 := ' UNION ALL'
                +' SELECT A.ECNOCOMP, A.PROV PROV, ( DECODE(A.EC_IE ,''I'' ,(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) INGRESOLOC,'
                +' CASE WHEN A.TMONID=''N'' THEN ECMTOLOC ELSE 0 END EGRESOLOC,'
                +' 0.00 INGRESOEXT, CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN ECMTOEXT ELSE 0 END EGRESOEXT, A.ECGLOSA CCGLOSA, '''' CCNOMB, A.FPAGOID,'
                +' A.ECNOCHQ, 0.00 PAGCHEQUMN, 0.00 PAGCHEQUME, (DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0) ) PAGEFECTMN,'
                +' (DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0) ) PAGEFECTME, 0.00 PAGNOTDMN,'
                +' 0.00 PAGNOTDME, '''' FPAGODES,'
                +' A.ECTCAMB TCAMBIO, A.CLAUXID, A.CIAID, D.CIADES, E.BANCONOM, A.TMONID, F.TMONDES, A.ECFCOMP FECHA, G.CLAUXDES, A.DOCID,'
                +' A.ECNODOC NODOC, A.CPTOID, A.CUENTAID, '''' CPTODES, '''' TIPO, A.BANCOID, (DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0 ) ) TOTALLOC,'
                +' (DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0 ) ) TOTALEXT, A.ECHREG HORA, 0.00  SALDOMN, 0.00 SALDOME, '''' NORDEN, 0.00 SALDOANTMN,'
                +' 0.00 SALDOANTME, '''' CTACPTO'
                +' FROM CAJA302 A, TGE106 B, TGE110 C, TGE101 D, TGE105 E, TGE103 F, TGE102 G'
                +' WHERE E.BCOTIPCTA='+QuotedStr('C')
                +' AND A.EC_PROCE IN (''7'',''9'')'
                +' AND To_Date(To_Char(ECFCOMP, ''DD/MM/YYYY'')) >='+QuotedStr(DateToStr(dbdtpInicio.Date))
                +' AND To_Date(To_Char(ECFCOMP, ''DD/MM/YYYY'')) <='+QuotedStr(DateToStr(dbdtpFin.Date))
                +' And EC_IE = ''I'''
                +' And A.BANCOID = B.BANCOID'
                +' And B.CIAID ='+QuotedStr('02')
                +' And A.DOCID = C.DOCID'
                +' And C.DOCMOD =''CAJA'''
                +' And A.CIAID ='+QuotedStr(dblcCia.Text)
                +' And A.CIAID = D.CIAID'
                +' And A.BANCOID = E.BANCOID And A.TMONID = F.TMONID And A.CLAUXID = G.CLAUXID';

        xSQL3 := ' UNION ALL '

                +' SELECT A.ECNOCOMP, A.PROV PROV, '
                +' ( DECODE(A.EC_IE ,''I'' ,(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) INGRESOLOC,'
                +' 0.00 EGRESOLOC,'
                +' ( DECODE(A.EC_IE ,''I'' ,(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) INGRESOEXT,'
                +' 0.00 EGRESOEXT,'
                +' '' '' CCGLOSA, ''TRANSFERENCIA'' AS CCNOMB, A.FPAGOID, A.ECNOCHQ,'
                +' 0.00 PAGCHEQUMN,'
                +' 0.00 PAGCHEQUME,'
                +' (DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0) ) PAGEFECTMN,'
                +' (DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0) ) PAGEFECTME,'
                +' 0.00 PAGNOTDMN,'
                +' 0.00 PAGNOTDME,'
                +' '' '' FPAGODES, A.ECTCAMB TCAMBIO, A.CLAUXID, A.CIAID CIAID , D.CIADES, C.BANCONOM,'
                +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, '' '' CLAUXDES, A.DOCID, A.ECNODOC NODOC,'
                +' A.CPTOID, A.CUENTAID, ''TRANSFERENCIA'' CPTODES, ''INGRESO'' TIPO, A.BANCOID,'
                +' (DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0 ) ) TOTALLOC,'
                +' (DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0 ) ) TOTALEXT,'
                +' A.ECHREG HORA, 0.00  SALDOMN, 0.00 SALDOME, ''  '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
                +' FROM CAJA302 A, TGE105 C, TGE101 D, TGE103 E'
                +' Where A.EC_PROCE IN (''7'') AND A.ECESTADO=''C'''
                +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID'
                +' AND A.CIAID ='+QuotedStr(dblcCia.Text)
                +' AND A.TMONID=E.TMONID ) SOLVISTA'
                +' WHERE BANCOID='+QuotedStr(dblcCaja.Text)
                +' AND (To_Date(To_Char(FECHA, ''DD/MM/YYYY'')) >='+QuotedStr(DateToStr(dbdtpInicio.Date))
                +' AND To_Date(To_Char(FECHA, ''DD/MM/YYYY'')) <='+QuotedStr(DateToStr(dbdtpFin.Date))
                +' ) AND TIPO=''INGRESO'' AND CIAID='+QuotedStr(dblcCia.Text)
                +' ORDER BY FECHA, NODOC';
       end;

   FConsulta.xfiltroMovLibCaja.UsuarioSQL.Clear;
   FConsulta.xfiltroMovLibCaja.FMant.wTabla := 'VWCAJAMOVCAJA';
   FConsulta.xfiltroMovLibCaja.UsuarioSQL.Add( xSQL1+xSQL2+xSQL3 );
   FConsulta.xfiltroMovLibCaja.NewQuery;

   if FConsulta.xfiltroMovLibCaja.FMant.cds2.RecordCount > 0 then
    begin
     ppDBIngresoCaja.DataSource := FConsulta.xfiltroMovLibCaja.FMant.ds2;
     pprMovDiario.DataPipeline  := ppDBIngresoCaja;

     pprMovDiario.Template.FileName := wRutaRpt + '\MovDiarioCajaIng.rtm';
     pprMovDiario.Template.LoadFromFile ;
     pplblFechaini.Caption := dbdtpInicio.Text;
     pplblFechaFin.Caption := dbdtpFin.Text;
     pprMovDiario.Print;
     pprMovDiario.Stop;
     ppDBIngresoCaja.DataSource := nil;
    end
   else
     ShowMessage('No hay Registros que mostrar');
   end;

   if RbEgreso.Checked = True then
    begin
     if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
      begin
        xSQL1 := ' SELECT ECNOCOMP, PROV, INGRESOLOC, EGRESOLOC, INGRESOEXT, EGRESOEXT,'
               +' CCGLOSA, CCNOMB, FPAGOID, ECNOCHQ, PAGCHEQUMN, PAGCHEQUME,'
               +' PAGEFECTMN, PAGEFECTME, PAGNOTDMN, PAGNOTDME, FPAGODES, TCAMBIO, CLAUXID, CIAID,'
               +' CIADES, BANCONOM, TMONID, TMONDES, FECHA, CLAUXDES, DOCID, NODOC, CPTOID, CUENTAID,'
               +' CPTODES, TIPO, BANCOID, TOTALLOC, TOTALEXT, HORA, SALDOMN, SALDOME, NORDEN, SALDOANTMN,'
               +' SALDOANTME, CTACPTO, 0.00 DEBEMN, 0.00 HABERMN, 0.00 DEBEME, 0.00 HABERME FROM'
               +' (SELECT A.ECNOCOMP, A.PROV PROV,'
               +' (CASE WHEN (A.EC_IE =''I'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END ) INGRESOLOC,'
               +' (CASE WHEN (A.EC_IE =''E'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END ) EGRESOLOC,'
               +' (CASE WHEN (A.EC_IE =''I'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END ) INGRESOEXT,'
               +' (CASE WHEN (A.EC_IE =''E'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END ) EGRESOEXT,'
               +' '' '' AS CCGLOSA, H.PROVDES CCNOMB, A.FPAGOID, A.ECNOCHQ,'
               +' (CASE WHEN (B.FCHQ=''S'' OR B.FCHQ=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGCHEQUMN,'
               +' (CASE WHEN (B.FCHQ=''S'' OR B.FCHQ=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGCHEQUME,'
               +' (CASE WHEN (B.FEFE=''S'' OR B.FEFE=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGEFECTMN,'
               +' (CASE WHEN (B.FEFE=''S'' OR B.FEFE=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGEFECTME,'
               +' (CASE WHEN (B.FNDE=''S'' OR B.FNDE=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGNOTDMN,'
               +' (CASE WHEN (B.FNDE=''S'' OR B.FNDE=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGNOTDME,'
               +' B.FPAGODES, A.ECTCAMB  TCAMBIO,A.CLAUXID, A.CIAID CIAID , D.CIADES, C.BANCONOM,'
               +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, F.CLAUXDES,'
               +' CASE WHEN A.EC_PROCE=''1'' THEN ''PAG. NO PROV'' ELSE ''PAG.PROV'' END DOCID, A.ECNOCOMP NODOC,'
               +' A.CPTOID, A.CUENTAID, G.CPTODES, ''EGRESO'' TIPO, A.BANCOID,'
               +' ((CASE WHEN  (B.FCHQ=''S'' OR B.FCHQ=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END))'
               +' +((CASE WHEN (B.FEFE=''S'' OR B.FEFE=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END))'
               +' +((CASE WHEN (B.FNDE=''S'' OR B.FNDE=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END)) TOTALLOC,'
               +' ((CASE WHEN  (B.FCHQ=''S'' OR B.FCHQ=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END)) '
               +' +((CASE WHEN (B.FEFE=''S'' OR B.FEFE=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END)) '
               +' +((CASE WHEN (B.FNDE=''S'' OR B.FNDE=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END)) TOTALEXT,'
               +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
               +' FROM CAJA302 A'
               +' LEFT JOIN TGE112 B ON A.FPAGOID=B.FPAGOID'
               +' LEFT JOIN TGE105 C ON A.BANCOID=C.BANCOID'
               +' LEFT JOIN TGE101 D ON A.CIAID=D.CIAID'
               +' LEFT JOIN TGE103 E ON A.TMONID=E.TMONID'
               +' LEFT JOIN TGE102 F ON A.CLAUXID=F.CLAUXID'
               +' LEFT JOIN CAJA201 G ON A.CPTOID=G.CPTOID'
               +' LEFT JOIN TGE201 H ON A.PROV=H.PROV'
               +' Where (CASE WHEN A.EC_IE =''E'' THEN A.ECMTOLOC ELSE 0 END )>0'
               +' AND A.EC_PROCE IN (''B'',''1'') AND A.ECESTADO=''C'' '
               +' AND C.BCOTIPCTA=''C'' ';

        xSQL2 := ' UNION ALL '
                +' SELECT A.ECNOCOMP, A.PROV PROV,'
                +' 0.00  INGRESOLOC,'
                +' (CASE WHEN (A.EC_IE =''E'' AND A.TMONID='''+DMTE.wTMonLoc+''') THEN A.ECMTOLOC ELSE 0 END ) EGRESOLOC,'
                +' 0.00  INGRESOEXT,'
                +' (CASE WHEN (A.EC_IE =''E'' AND A.TMONID='''+DMTE.wTMonExt+''') THEN A.ECMTOEXT ELSE 0 END ) EGRESOEXT,'
                +' '' ''  CCGLOSA, ''TRANSFERENCIA'' CCNOMB, A.FPAGOID, A.ECNOCHQ,'
                +' 0.00 PAGCHEQUMN,'
                +' 0.00 PAGCHEQUME,'
                +' (CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGEFECTMN,'
                +' (CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGEFECTME,'
                +' 0.00 PAGNOTDMN,'
                +' 0.00 PAGNOTDME,'
                +' '' '' FPAGODES, A.ECTCAMB TCAMBIO, A.CLAUXID, A.CIAID CIAID, D.CIADES, C.BANCONOM,'
                +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, '' '' CLAUXDES, A.DOCID, A.ECNODOC NODOC,'
                +' A.CPTOID, A.CUENTAID, ''TRANSFERENCIA'' CPTODES, ''EGRESO'' TIPO, A.BANCOID,'
                +' (CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) TOTALLOC,'
                +' (CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) TOTALEXT,'
                +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
                +' FROM CAJA302 A'
                +' LEFT JOIN TGE105 C ON A.BANCOID=C.BANCOID'
                +' LEFT JOIN TGE101 D ON A.CIAID=D.CIAID'
                +' LEFT JOIN TGE103 E ON A.TMONID=E.TMONID'
                +' Where (CASE WHEN A.EC_IE =''E'' THEN A.ECMTOLOC ELSE 0 END )>0'
                +' AND A.EC_PROCE IN (''4'') AND A.ECESTADO=''C'' '
                +' AND C.BCOTIPCTA=''C'' '
                +' ) SOLVISTA'
                +' WHERE BANCOID='''+dblcCaja.Text
                +''' AND (FECHA>='''+dbdtpInicio.Text+''' AND FECHA<='''+dbdtpFin.Text
                +''') AND TIPO=''EGRESO'' AND CIAID='''+dblcCia.Text+''''
                +' ORDER BY PROV, FECHA, HORA';
      end;
     if (DMTE.SRV_D = 'ORACLE') then
      begin
       xSQL1 := ' SELECT ECNOCOMP, PROV, INGRESOLOC, EGRESOLOC, INGRESOEXT, EGRESOEXT,'
               +' CCGLOSA, CCNOMB, FPAGOID, ECNOCHQ, PAGCHEQUMN, PAGCHEQUME,'
               +' PAGEFECTMN, PAGEFECTME, PAGNOTDMN, PAGNOTDME, FPAGODES, TCAMBIO, CLAUXID, CIAID,'
               +' CIADES, BANCONOM, TMONID, TMONDES, FECHA, CLAUXDES, DOCID, NODOC, CPTOID, CUENTAID,'
               +' CPTODES, TIPO, BANCOID, TOTALLOC, TOTALEXT, HORA, SALDOMN, SALDOME, NORDEN, SALDOANTMN, SALDOANTME,'
               +' CTACPTO, 0.00 DEBEMN, 0.00 HABERMN, 0.00 DEBEME, 0.00 HABERME FROM'
               +' ( '
               +' SELECT A.ECNOCOMP, A.PROV  PROV,'
               +' ( DECODE(A.EC_IE,''I'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC,0)),0) ) INGRESOLOC,'
               +' ( DECODE(A.EC_IE,''E'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC,0)),0) ) EGRESOLOC,'
               +' ( DECODE(A.EC_IE,''I'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''',A.ECMTOEXT,0)),0) ) INGRESOEXT,'
               +' ( DECODE(A.EC_IE,''E'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''',A.ECMTOEXT,0)),0) ) EGRESOEXT,'
               +' '' '' AS CCGLOSA,H.PROVDES  CCNOMB, A.FPAGOID,A.ECNOCHQ, '
               +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) PAGCHEQUMN,'
               +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) PAGCHEQUME,'
               +' ( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) PAGEFECTMN,'
               +' ( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) PAGEFECTME,'
               +' ( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) PAGNOTDMN,'
               +' ( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) PAGNOTDME,'
               +' B.FPAGODES, A.ECTCAMB TCAMBIO, A.CLAUXID, A.CIAID CIAID , D.CIADES, C.BANCONOM,'
               +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, F.CLAUXDES,'
               +' DECODE(A.EC_PROCE,''1'', ''PAG. NO PROV'',''PAG.PROV'') DOCID, A.ECNOCOMP NODOC,'
               +' A.CPTOID, A.CUENTAID, G.CPTODES, ''EGRESO'' TIPO, A.BANCOID, '
               +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) )'
               +' +( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) )'
               +' +(( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) )) TOTALLOC,'
               +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) '
               +' +( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) '
               +' +( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) TOTALEXT,'
               +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
               +' FROM CAJA302 A, TGE112 B, TGE105 C, TGE101 D, TGE103 E, TGE102 F, CAJA201 G, TGE201 H '
               +' Where (CASE WHEN A.EC_IE =''E'' THEN A.ECMTOLOC ELSE 0 END )>0'
               +' AND A.EC_PROCE IN (''B'',''1'') AND A.ECESTADO=''C'' AND  A.FPAGOID=B.FPAGOID'
               +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID AND A.TMONID=E.TMONID '
               +' AND A.CLAUXID=F.CLAUXID AND A.CPTOID=G.CPTOID AND A.PROV=H.PROV';
       xSQL2 := ' UNION ALL '
               +' SELECT A.ECNOCOMP, A.PROV PROV,'
               +' 0.00 INGRESOLOC,'
               +' ( DECODE(A.EC_IE ,''E'', (DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0)),0)) EGRESOLOC,'
               +' 0.00 INGRESOEXT,'
               +' ( DECODE(A.EC_IE ,''E'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''',  A.ECMTOEXT, 0)),0)) EGRESOEXT,'
               +' '' '' CCGLOSA, ''TRANSFERENCIA'' CCNOMB, A.FPAGOID, A.ECNOCHQ,'
               +' 0.00 PAGCHEQUMN,'
               +' 0.00 PAGCHEQUME,'
               +' ( DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0) ) PAGEFECTMN,'
               +' ( DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0) ) PAGEFECTME,'
               +' 0.00 PAGNOTDMN,'
               +' 0.00 PAGNOTDME,'
               +' '' ''  FPAGODES, A.ECTCAMB  TCAMBIO,A.CLAUXID, A.CIAID CIAID , D.CIADES,C.BANCONOM,'
               +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, '' '' CLAUXDES,A.DOCID, A.ECNODOC NODOC,'
               +' A.CPTOID, A.CUENTAID, ''TRANSFERENCIA'' CPTODES, ''EGRESO'' TIPO, A.BANCOID,'
               +' ( DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0 ) ) TOTALLOC,'
               +' ( DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0 ) ) TOTALEXT,'
               +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
               +' FROM CAJA302 A, TGE105 C, TGE101 D, TGE103 E'
               +' WHERE'
               +' A.EC_PROCE IN (''4'') AND A.ECESTADO=''C'' '
               +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID'
               +' AND A.TMONID=E.TMONID'
               +' ) SOLVISTA'
               +' WHERE BANCOID='+QuotedStr(dblcCaja.Text)
               +' AND (FECHA>='''+dbdtpInicio.Text+''' AND FECHA<='''+dbdtpFin.Text
               +''') AND TIPO=''EGRESO'' AND CIAID ='+QuotedStr(dblcCia.Text)
               +' ORDER BY PROV, FECHA, HORA ';
      end;

   	FConsulta.xfiltroMovLibCaja.UsuarioSQL.Clear;
	  FConsulta.xfiltroMovLibCaja.FMant.wTabla := 'VWCAJAMOVCAJA';
	  FConsulta.xfiltroMovLibCaja.UsuarioSQL.Add( xSQL1+xSQL2 );
	  FConsulta.xfiltroMovLibCaja.NewQuery;

    if FConsulta.xfiltroMovLibCaja.FMant.cds2.RecordCount>0 then
     begin
      ppDBIngresoCaja.DataSource := FConsulta.xfiltroMovLibCaja.FMant.ds2;
      pprMovDiario.DataPipeline  := ppDBIngresoCaja;

      pprMovDiario.Template.FileName := wRutaRpt + '\MovDiarioCajaEgr.rtm';

      pprMovDiario.Template.LoadFromFile ;
      pplblFechaini.Caption := dbdtpInicio.Text;
      pplblFechaFin.Caption := dbdtpFin.Text;
      pprMovDiario.Print;
      pprMovDiario.Stop;
      ppDBIngresoCaja.DataSource := nil;
     end
    else
      ShowMessage('No Existen Registros que Mostrar');

   {  Fprincipal.xfiltroMovLibCaja.FMant.cds2.Filter:='  BANCOID='''+dblcCaja.TEXT
     +''' AND (FECHA>='''+dbdtpInicio.TEXT+''' AND FECHA<='''+dbdtpFin.TEXT
     +''') AND TIPO=''EGRESO'' AND CIAID='''+dblcCia.TEXT+'''';
     Fprincipal.xfiltroMovLibCaja.FMant.cds2.Filtered:=True;

     ppDBIngresoCaja.DataSource:=Fprincipal.xfiltroMovLibCaja.FMant.ds2;
     pprMovDiario.DataPipeline:=ppDBIngresoCaja;

     pprMovDiario.TEMPLATE.FileName:=wRutaRpt + '\MovDiarioCajaEgr.rtm';

     pprMovDiario.template.LoadFromFile ;
     pplblFechaini.caption:=dbdtpInicio.text;
     pplblFechaFin.caption:=dbdtpFin.text;
     pprMovDiario.print;}
   end;
end;

procedure TFToolMovCaja.bbtnCuadreCajaClick(Sender: TObject);
var
   FInicio, FFin : String;
   sFecha, sSQL : String;
begin
   dblcdAnoMes.Enabled := False;
   xVez := False; xVez1 := False;
   xTotEgresosS   := 0 ;
   xTotEgresosD   := 0 ;
   xTotIngresosS  := 0 ;
   xTotIngresosD  := 0 ;

   If Length(dblcCia.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Compañía', mtInformation, [mbOk], 0);
     dblcCia.SetFocus;
     Exit;
    end;

   If Length(dblcCaja.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Debe Seleccionar la Caja', mtInformation, [mbOk], 0);
     dblcCaja.SetFocus;
     Exit;
    end;

   if Length(dbdtpInicio.Text) = 0 then
    begin
     Beep;
     MessageDlg('Debe Seleccionar la Fecha de Inicio', mtInformation, [mbOk], 0);
     dbdtpInicio.SetFocus;
     Exit;
    end;

   If Length(dbdtpFin.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Debe Seleccionar la Fecha de Fin', mtInformation, [mbOk], 0);
     dbdtpFin.SetFocus;
     Exit;
    end;

   If (dbdtpInicio.DateTime) > (dbdtpFin.DateTime) Then
    begin
     Beep;
     MessageDlg('La Fecha de Inicio es Mayor a la Fecha de Fin', mtInformation, [mbOk], 0);
     dbdtpInicio.SetFocus;
     Exit;
    end;

   DMTE.cdsBancoEgr.Filter   := ' BCOTIPCTA=''C''';
   DMTE.cdsBancoEgr.Filtered := True;
   DMTE.cdsBancoEgr.Open;

   FInicio := FechaDB2 (dbdtpInicio.Date);
//   FFin    := FechaDB2 (dbdtpInicio.Date);
   FFin    := FechaDB2 (dbdtpFin.Date);
   AsignaSQLArqueoCajap ( dblcCia.Text , FInicio , FFin ) ;
//   AsignaSQLArqueoCajap ( dblcCia.Text , FInicio , FInicio ) ;
   sFecha := FormatDateTime(DMTE.wFormatFecha, dbdtpInicio.Date);
{   sSQL := 'SELECT * FROM CAJA310'
          +' WHERE BANCOID =' +QuotedStr(dblcCaja.Text)
          +' AND STFECHA ='+QuotedStr(sfecha);}

   sSQL := 'SELECT * FROM CAJA310'
          +' WHERE BANCOID =' +QuotedStr(dblcCaja.Text)
          +' AND To_Date(To_Char(STFECHA, ''DD/MM/YYYY'')) >= '+QuotedStr(DateToStr(dbdtpInicio.Date))
          +' AND To_Date(To_Char(STFECHA, ''DD/MM/YYYY'')) <= '+QuotedStr(DateToStr(dbdtpFin.Date))
          +' AND CIAID ='+QuotedStr(dblcCia.Text)
          +' AND BANCOID ='+QuotedStr(dblcCaja.Text);

   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(sSQL);
   DMTE.cdsQry.Open;

   If DMTE.cdsRec.RecordCount > 0 Then
    begin
     ppDBIE.DataSource  := DMTE.dsRec;
     ppDBIE1.DataSource := DMTE.dsDescrip;
     ppRCuadre.Template.FileName := wRutaRpt + '\ArqueoCajaP.rtm';
     ppRCuadre.Template.LoadFromFile ;
     pplblCia.Text := edtCia.Text;
     pplblDel.Text := 'Del : '+sFecha;
     ppRCuadre.Print;
    end
   Else
    begin
     Beep;
     if DMTE.cdsQry.RecordCount = 0 then
      Raise Exception.Create('No hay datos por Mostrar para el Rango Seleccionado') ;
    end;

   //ppDesigner1.Show;
   xVez := False; xVez1 := False;
   ppDBIE.DataSource    := nil;

{   FArqueoCajaP := TFArqueoCajaP.Create(Self);
   Try
      FArqueoCajaP.dbdtpInicio.Date := dbdtpInicio.Date;
      FArqueoCajaP.dblcCaja.Text    := dblcCaja.Text;
      FArqueoCajaP.edtCaja.Text     := edtCajades.Text;
      FArqueoCajaP.ShowModal;
   Finally
      FArqueoCajaP.Free;
      DMTE.cdsBancoEgr.Filter   := '';
      DMTE.cdsBancoEgr.Filtered := True;
   end;}
end;

procedure TFToolMovCaja.bbtnLibCajaClick(Sender: TObject);
var
   xYear, xMonth, xDay : Word;
begin
   If Length(dblcCia.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Compañía', mtInformation, [mbOk], 0);
     dblcCia.SetFocus;
     Exit;
    end;

   If Length(dblcCaja.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Debe Seleccionar la Caja', mtInformation, [mbOk], 0);
     dblcCaja.SetFocus;
     Exit;
    end;

   DecodeDate(dbdtpInicio.Date, xYear, xMonth, xDay);
   dblcdAnoMes.Enabled := True;
   If Length(dbdtpInicio.Text) > 0 Then
    begin
     xAno := CurrToStr(xYear);
     xMes := DMTE.StrZero(CurrToStr(xMonth), 2);
     dblcdAnoMes.Text := xAno+xMes;
    end
   Else
    dblcdAnoMes.Clear;

   dblcdAnoMes.SetFocus;
end;

procedure TFToolMovCaja.bbtnEgrCajaClick(Sender: TObject);
var
   sSQL : String;
begin
   dblcdAnoMes.Enabled := False;
   If Length(dblcCia.Text) = 0 then
    begin
     Beep;
     MessageDlg('Falta Seleccionar la Compañía', mtInformation, [mbOk], 0);
     dblcCia.SetFocus;
     Exit;
    end;

   if Length(dblcCaja.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Falta Seleccionar el Banco', mtInformation, [mbOk], 0);
     dblcCaja.SetFocus;
     Exit;
    end;

   if Length(dbdtpInicio.Text) = 0 then
    begin
     Beep;
     MessageDlg('Debe Seleccionar la Fecha de Inicio', mtInformation, [mbOk], 0);
     dbdtpInicio.SetFocus;
     Exit;
    end;

   if Length(dbdtpFin.Text) = 0 then
    begin
     Beep;
     MessageDlg('Debe Seleccionar la Fecha de Término', mtInformation, [mbOk], 0);
     dbdtpFin.SetFocus;
     Exit;
    end;

   If (dbdtpInicio.DateTime) > (dbdtpFin.DateTime) Then
    begin
     Beep;
     MessageDlg('La Fecha de Inicio es Mayor a la Fecha de Fin', mtInformation, [mbOk], 0);
     dbdtpInicio.SetFocus;
     Exit;
    end;

   Screen.Cursor := crHourGlass;
   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
    sSQL := ' SELECT X.CIAID, X.TDIARID, X.ECANOMM, X.ECNOCOMP, X.DOCID2, X.CPSERIE, X.CPNODOC, X.DETCPAG, X.TMONID, X.INGRESOLOC,'
           +' X.EGRESOLOC, X.INGRESOEXT, X.EGRESOEXT, X.INGRESOSOL, X.EGRESOSOL, X.CPTOID, X.CUENTAID, X.CLAUXID, X.PROV,'
           +' X.EC_PROCE, X.ECFCOMP, C.AUXNOMB, D.DOCDES, E.CPTODES FROM ( '
           +' SELECT A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.DOCID2, A.CPSERIE, A.CPNODOC, A.DETCPAG, A.TMONID, 0.00 INGRESOLOC,'
           +' CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonLoc)+' THEN A.DEMTOLOC ELSE 0 END EGRESOLOC,0.00 INGRESOEXT,'
           +' CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonExt)+' THEN A.DEMTOEXT ELSE 0 END EGRESOEXT,0.00 INGRESOSOL,'
           +' CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonLoc)+' THEN A.DEMTOLOC ELSE ROUND(A.DEMTOEXT*A.DETCPAG,2) END EGRESOSOL,'
           +' A.CPTOID, A.CUENTAID, A.CLAUXID, A.PROV, B.EC_PROCE, B.ECFCOMP'
           +' FROM CAJA301 A'
           +' LEFT JOIN CAJA302 B ON A.CIAID=B.CIAID AND A.TDIARID=B.TDIARID AND A.ECANOMM=B.ECANOMM AND A.ECNOCOMP=B.ECNOCOMP '
           +' WHERE (CASE WHEN B.EC_IE =''E'' THEN B.ECMTOLOC ELSE 0 END )>0'// AND B.EC_PROCE IN (''B'',''1'')
           +' AND B.ECESTADO=''C'' AND B.BANCOID='+QuotedStr(dblcCaja.Text)
           +' UNION ALL '
           +' SELECT A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.DOCID2, A.CPSERIE, A.CPNODOC, A.DETCPAG, A.TMONID, 0.00 INGRESOLOC, '
           +' CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonLoc)+' THEN A.DEMTOLOC ELSE 0 END EGRESOLOC, 0.00 INGRESOEXT,'
           +' CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonExt)+' THEN A.DEMTOEXT ELSE 0 END EGRESOEXT, '
           +' 0.00 INGRESOSOL, CASE WHEN A.TMONID ='+QuotedStr(DMTE.wTMonLoc)+' THEN A.DEMTOLOC ELSE ROUND(A.DEMTOEXT*A.DETCPAG,2) END EGRESOSOL,'
           +' A.CPTOID, A.CUENTAID, A.CLAUXID, A.PROV, B.EC_PROCE, B.ECFCOMP '
           +' FROM CAJA303 A'
           +' LEFT JOIN CAJA302 B ON A.CIAID=B.CIAID AND A.TDIARID=B.TDIARID AND A.ECANOMM = B.ECANOMM AND A.ECNOCOMP = B.ECNOCOMP '
           +' WHERE (CASE WHEN B.EC_IE =''E'' THEN B.ECMTOLOC ELSE 0 END )>0'// AND B.EC_PROCE IN (''B'',''1'')
           +' AND B.ECESTADO=''C'' AND B.BANCOID='+QuotedStr(dblcCaja.Text)+') X'
           +' LEFT JOIN TGE110 D ON X.DOCID2=D.DOCID AND DOCMOD=''CXP'' '
           +' LEFT JOIN CNT201 C ON X.CLAUXID=C.CLAUXID AND X.PROV=C.AUXID '
           +' LEFT JOIN CAJA201 E ON X.CPTOID=E.CPTOID '
           +' WHERE ECFCOMP>='+QuotedStr(dbdtpInicio.Text)+' AND ECFCOMP<='+QuotedStr(dbdtpFin.Text)
           +' UNION ALL '
           +' SELECT A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.DOCID DOCID2, '' '' CPSERIE, A.ECNODOC CPNODOC, A.ECTCAMB DETCPAG, A.TMONID, '
           +' 0.00 INGRESOLOC, CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonLoc)+' THEN ECMTOLOC ELSE 0 END EGRESOLOC, 0.00 INGRESOEXT, '
           +' CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonExt)+' THEN ECMTOEXT ELSE 0 END EGRESOEXT, '
           +' 0.00 INGRESOSOL, CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonLoc)+' THEN ECMTOLOC ELSE ROUND(ECMTOEXT*A.ECTCAMB,2) END EGRESOSOL,'
           +' A.CPTOID, B.CTAREMES CUENTAID, '' '' CLAUXID, A.PROV, EC_PROCE, ECFCOMP,'
           +' ECGIRA AUXNOMB, ''TRANSFERENCIA'' DOCDES, A.ECGLOSA CPTODES '
           +' FROM CAJA302 A '
           +' LEFT JOIN TGE106 B ON A.BANCOID=B.BANCOID '
//           +' LEFT JOIN TGE110 C ON A.DOCID=C.DOCID AND C.DOCMOD=''CAJA'' '
           +' WHERE A.BANCOID='+QuotedStr(dblcCaja.Text)+' AND A.EC_PROCE IN (''4'',''0'')'
           +' AND EC_IE ='+QuotedStr('E')
           +' AND ECFCOMP>='+QuotedStr(dbdtpInicio.Text)+' AND ECFCOMP<='+QuotedStr(dbdtpFin.Text)
           +' Order By ECFCOMP, ECNOCOMP';

   If (DMTE.SRV_D = 'ORACLE') Then
    sSQL := 'SELECT X.CIAID, X.TDIARID, X.ECANOMM, X.ECNOCOMP, X.DOCID2, X.CPSERIE, X.CPNODOC, X.DETCPAG, X.TMONID, X.INGRESOLOC,'
           +' X.EGRESOLOC, X.INGRESOEXT, X.EGRESOEXT, X.INGRESOSOL, X.EGRESOSOL, X.CPTOID, X.CUENTAID, X.CLAUXID, X.PROV,'
           +' X.EC_PROCE, X.ECFCOMP, C.AUXNOMB, InitCap(D.DOCDES) DOCDES, E.CPTODES FROM ('
           +' SELECT A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.DOCID2, A.CPSERIE, A.CPNODOC, A.DETCPAG, A.TMONID, 0.00 INGRESOLOC,'
           +' CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonLoc)+' THEN A.DEMTOLOC ELSE 0 END EGRESOLOC,0.00 INGRESOEXT,'
           +' CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonExt)+' THEN A.DEMTOEXT ELSE 0 END EGRESOEXT,0.00 INGRESOSOL,'
           +' CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonLoc)+' THEN A.DEMTOLOC ELSE ROUND(A.DEMTOEXT*A.DETCPAG,2) END EGRESOSOL,'
           +' A.CPTOID, A.CUENTAID, A.CLAUXID, A.PROV, B.EC_PROCE, B.ECFCOMP'
           +' FROM CAJA301 A, CAJA302 B'
//           +' LEFT JOIN CAJA302 B ON A.CIAID=B.CIAID AND A.TDIARID=B.TDIARID AND A.ECANOMM=B.ECANOMM AND A.ECNOCOMP=B.ECNOCOMP '
           +' WHERE (CASE WHEN B.EC_IE =''E'' THEN B.ECMTOLOC ELSE 0 END )>0' //AND B.EC_PROCE IN (''B'',''1'')
           +' AND B.ECESTADO=''C'''
           +' AND B.BANCOID='+QuotedStr(dblcCaja.Text)
           +' And A.CIAID = B.CIAID'
           +' And A.CIAID ='+QuotedStr(dblcCia.Text)
           +' And A.TDIARID = B.TDIARID AND A.ECANOMM = B.ECANOMM AND A.ECNOCOMP = B.ECNOCOMP '
           +' UNION ALL '
           +' SELECT A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.DOCID2, A.CPSERIE, A.CPNODOC, A.DETCPAG, A.TMONID, 0.00 INGRESOLOC,'
           +' CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonLoc)+' THEN A.DEMTOLOC ELSE 0 END EGRESOLOC, 0.00 INGRESOEXT,'
           +' CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonExt)+' THEN A.DEMTOEXT ELSE 0 END EGRESOEXT, '
           +' 0.00 INGRESOSOL, CASE WHEN A.TMONID ='+QuotedStr(DMTE.wTMonLoc)+' THEN A.DEMTOLOC ELSE ROUND(A.DEMTOEXT*A.DETCPAG,2) END EGRESOSOL,'
           +' A.CPTOID, A.CUENTAID, A.CLAUXID, A.PROV, B.EC_PROCE, B.ECFCOMP '
           +' FROM CAJA303 A, CAJA302 B'
           +' WHERE (CASE WHEN B.EC_IE =''E'' THEN B.ECMTOLOC ELSE 0 END )>0'// AND B.EC_PROCE IN (''B'',''1'')
           +' AND B.ECESTADO=''C'''
           +' AND B.BANCOID='+QuotedStr(dblcCaja.Text)
           +' And A.CIAID = B.CIAID And A.TDIARID = B.TDIARID And A.ECANOMM = B.ECANOMM'
           +' And A.CIAID ='+QuotedStr(dblcCia.Text)
           +' And A.ECNOCOMP = B.ECNOCOMP'+') X,'
           +' TGE110 D, CNT201 C, CAJA201 E'
           +' Where X.DOCID2 = D.DOCID'
           +' And X.CLAUXID = C.CLAUXID'
           +' And X.PROV = C.AUXID'
           +' And X.CPTOID = E.CPTOID'
           +' And ECFCOMP>='+QuotedStr(dbdtpInicio.Text)+' AND ECFCOMP<='+QuotedStr(dbdtpFin.Text)
           +' UNION ALL '
           +' SELECT A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.DOCID DOCID2, '' '' CPSERIE, A.ECNODOC CPNODOC, A.ECTCAMB DETCPAG, A.TMONID,'
           +' 0.00 INGRESOLOC, CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonLoc)+' THEN ECMTOLOC ELSE 0 END EGRESOLOC, 0.00 INGRESOEXT,'
           +' CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonExt)+' THEN ECMTOEXT ELSE 0 END EGRESOEXT, '
           +' 0.00 INGRESOSOL, CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonLoc)+' THEN ECMTOLOC ELSE ROUND(ECMTOEXT*A.ECTCAMB,2) END EGRESOSOL, '
           +' A.CPTOID, B.CTAREMES CUENTAID, '' '' CLAUXID, A.PROV, EC_PROCE, ECFCOMP,'
           +' ECGIRA AUXNOMB, ''Transferencia'' DOCDES, A.ECGLOSA CPTODES '
           +' FROM CAJA302 A, TGE106 B'//, TGE110 C'
           +' WHERE A.BANCOID='+QuotedStr(dblcCaja.Text)+' AND A.EC_PROCE IN (''4'',''0'')'
           +' AND EC_IE ='+QuotedStr('E')
           +' AND ECFCOMP>='+QuotedStr(dbdtpInicio.Text)+' AND ECFCOMP<='+QuotedStr(dbdtpFin.Text)
           +' And A.BANCOID = B.BANCOID'
           +' And B.CIAID ='+QuotedStr(dblcCia.Text)
//           +' And A.DOCID = C.DOCID'
//           +' And C.DOCMOD ='+QuotedStr('CAJA')
           +' And A.CIAID ='+QuotedStr(dblcCia.Text)
           +' Order By ECFCOMP, ECNOCOMP';

   DMTE.cdsQry3.Close;
   DMTE.cdsQry3.DataRequest(sSQL);
   DMTE.cdsQry3.Open;

   FConsulta.xfiltroMovLibCaja.UsuarioSQL.Clear;
   FConsulta.xfiltroMovLibCaja.FMant.wTabla := 'VWCAJAEGRCAJA';
	 FConsulta.xfiltroMovLibCaja.UsuarioSQL.Add(sSQL);
	 FConsulta.xfiltroMovLibCaja.NewQuery;

   if DMTE.cdsQry3.RecordCount > 0 then
    begin
     ppReport2.Template.FileName := wRutaRpt + '\ECaja.rtm';
     ppReport2.Template.LoadFromFile ;
     pplblCompaniaECaja.Caption := edtCia.Text;
     pplblTituloECaja.Caption := 'Caja : '+dblcCaja.Text+'   '+edtCajades.Text;
     pplblRangoECaja.Caption  := 'Del '+dbdtpInicio.Text+' al '+dbdtpFin.Text;
     ppReport2.Print;
     ppReport2.Stop;
     Screen.Cursor := crDefault;
    end
   else
    begin
     Beep;
     MessageDlg('No hay Registros que Mostrar', mtInformation, [mbOk], 0);
     Screen.Cursor := crDefault;
    end;
end;

procedure TFToolMovCaja.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFToolMovCaja.pprMovDiarioPreviewFormCreate(Sender: TObject);
begin
   pprMovDiario.PreviewForm.WindowState := wsMaximized;
   TppViewer(pprMovDiario.PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

procedure TFToolMovCaja.ppReport2PreviewFormCreate(Sender: TObject);
begin
   ppReport2.PreviewForm.WindowState := wsMaximized;
   TppViewer(ppReport2.PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

procedure TFToolMovCaja.FormCreate(Sender: TObject);
var
   Present : TDate;
begin
   Present := Date;
   dbdtpInicio.Date := Present;
   dbdtpFin.Date    := Present;
end;

procedure TFToolMovCaja.pprLibroCajaPreviewFormCreate(Sender: TObject);
begin
   pprLibroCaja.PreviewForm.WindowState := wsMaximized;
   TppViewer(pprLibroCaja.PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

procedure TFToolMovCaja.ppdbSumaEgrCalc(Sender: TObject;
  var Value: Variant);
begin
   if xVez1 = False then
    begin
     Value := Value + ppvSaldoADol.Value + StrToCurr ( ppdbMonIngExt.FieldValue ) - StrToCurr (ppdbMonEgrExt.FieldValue );
     xVez1 := True;
    end
   else
    Value := Value + StrToCurr ( ppdbMonIngExt.FieldValue ) - StrToCurr (ppdbMonEgrExt.FieldValue );
end;

procedure TFToolMovCaja.ppdbSumaIngCalc(Sender: TObject;
  var Value: Variant);
begin
   if xVez = False then
    begin
     Value := value + ppvSaldoASol.Value + StrToCurr (ppdbMonIngLoc.FieldValue) - StrToCurr (ppdbMonEgrLoc.FieldValue);
     xVez := True;
    end
   else
    Value := Value + StrToCurr ( ppdbMonIngLoc.FieldValue ) - StrToCurr ( ppdbMonEgrLoc.FieldValue );
end;

procedure TFToolMovCaja.ppRCuadrePreviewFormCreate(Sender: TObject);
begin
//   pplblTitulo.Left := (ppRCuadre.PrinterSetup.PaperWidth / 2) - (pplblTitulo.Width/2);
   pplblDel.Text := 'Del : '+ dbdtpInicio.Text;
//   pplblDel.Left := (ppRCuadre.PrinterSetup.PaperWidth / 2) - (pplblDel.Width/2);
   TppReport(Sender).PreviewForm.WindowState := WsMaximized;
   TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

procedure TFToolMovCaja.ppRCuadreStartPage(Sender: TObject);
begin
   if ppRCuadre.PageNo > 1 then
    begin
     pplblSaldoIng.Visible := False;
     ppvSaldoASol.Visible  := False;
     ppvSaldoADol.Visible  := False;
    end
   else
    begin
     pplblSaldoIng.Visible := True;
     ppvSaldoASol.Visible  := True;
     ppvSaldoADol.Visible  := True;
    end;
   if ppRCuadre.PageNo = 1 then
    begin
     pplblSaldoIng.Caption := 'Saldo Inicial ----------->';
     if (DMTE.cdsQry.FieldByName('STSALDOINIC').AsString = '') or (DMTE.cdsQry.FieldByName('STSALDOFIN').AsString = Null) then
      xSalIngLoc := 0
     else
      xSalIngLoc := DMTE.cdsQry.FieldByName('STSALDOINIC').Value;

     if (DMTE.cdsQry.FieldByName('STSDOFINEXT').AsString = '') or (DMTE.cdsQry.FieldByName('STSDOFINEXT').AsString = Null) then
      xSalIngExt := 0
     else
      xSalIngExt := DMTE.cdsQry.FieldByName('STSDOFINEXT').Value;
     if xSalIngLoc > 0 then ppvSaldoASol.Left := ppdbMonEgrLoc.Left
     else ppvSaldoASol.Left := ppdbMonIngLoc.Left;
     if xSalIngExt > 0 then ppvSaldoADol.Left := ppdbMonIngExt.Left
     else ppvSaldoADol.Left := ppdbMonEgrExt.Left;
     ppvSaldoASol.Value := xSalIngLoc;
     ppvSaldoADol.Value := xSalIngExt;
    end;
end;

procedure TFToolMovCaja.ppTitleBand1BeforePrint(Sender: TObject);
begin
   ppvSaldoAS.Value := xSalIngLoc;
   ppvSaldoAD.Value := xSalIngExt;
   pplblDel2.Text := 'Del : '+ dbdtpInicio.Text;
end;

procedure TFToolMovCaja.ppvSaldoAS1Calc(Sender: TObject;
  var Value: Variant);
begin
   Value := ppvSaldoAS.Value;
end;

procedure TFToolMovCaja.ppvSaldoAD1Calc(Sender: TObject;
  var Value: Variant);
begin
   Value := ppvSaldoAD.Value;
end;

procedure TFToolMovCaja.ppvegrCalc(Sender: TObject; var Value: Variant);
begin
   Value := ppvSaldoAD.Value + ppdbcegrS.Value - ppdbcegrD.Value;
end;

procedure TFToolMovCaja.ppvIngCalc(Sender: TObject; var Value: Variant);
begin
   Value := ppvSaldoAS.Value + ppdbcingS.Value - ppdbcingD.Value;
end;

procedure TFToolMovCaja.AsignaSQLArqueoCajaP(xCiaId, xFechaInicio, xFechaFin: String);
var
	 xSQL : String ;
begin
	 //ASIGNA DATOS DEL 1ER CLIENTDATASET DEL REPORTE
		//EGRESOS
   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
    xSQL  := 'SELECT SubStr(DECODE( EC_PROCE , ''1'' , ''Egresos'', ''3'','
            +' ''Pago a Varios'', ''B'' , ''Pago a Prov.'' ) , 1, 3)||''/''||'
            +' TDIARID||''-''||ECNOCOMP ECFCOMP, TGE103.TMONABR,'
{    xSQL  := 'SELECT CAJA302.CUENTAID, CTADES,'
            +'CASE WHEN EC_PROCE = ''1'' THEN ''Egresos'' '
            +    ' WHEN EC_PROCE = ''3'' THEN ''Pago a Varios''  '
            +    ' WHEN EC_PROCE = ''4'' THEN ''Transferencias''  '
            +    ' WHEN EC_PROCE = ''R'' THEN ''Rendicion Ctas.'' '
            +    ' WHEN EC_PROCE = ''0'' THEN ''Compra/Venta ME.'' '
            +    ' WHEN EC_PROCE = ''7'' THEN ''Transferencias''  '
            +    ' WHEN EC_PROCE = ''B'' THEN ''Pago a Prov.'' END DOCABR , '
            +  ' TDIARID||''-''||ECNOCOMP ECFCOMP, TGE103.TMONABR, '}
            +' CAJA302.ECGLOSA, '
            +' CASE WHEN CAJA302.TMONID = '''+DMTE.wTMonLoc+''' THEN DEC( CAJA302.ECMTOLOC,15,2 ) ELSE 0 END ECMTOLOC, '
            +' CASE WHEN CAJA302.TMONID = '''+DMTE.wTMonExt+''' THEN DEC( CAJA302.ECMTOEXT,15,2 ) ELSE 0 END ECMTOEXT, '
            +' DEC( 0,15,2 ) ECMTOLOCI,'
            +' DEC( 0,15,2 ) ECMTOEXTI,'
            +' DEC( CAJA302.ECTCAMB,15,2 ) ECTCAMB,'
            +' CAJA302.CLAUXID, CAJA302.PROV, CNT201.AUXNOMB,'
            +' ''Egresos'' EC_IE,'
            +' CAJA302.ECFCOMP FECHA'
            +' FROM CAJA302 '
            +' LEFT OUTER JOIN TGE103 ON (CAJA302.TMONID = TGE103.TMONID) '
            +' LEFT OUTER JOIN CNT201 ON (CAJA302.PROV = CNT201.AUXID AND CAJA302.CLAUXID = CNT201.CLAUXID )'
            +' LEFT JOIN TGE202 CTA ON CTA.CIAID=CAJA302.CIAID AND CTA.CUENTAID=CAJA302.CUENTAID '
//              +   ' INNER JOIN TGE112 ON (CAJA302.FPAGOID = TGE112.FPAGOID AND TGE112.F_MOVDIARIO = ''S'' )'
            +' WHERE ECFCOMP >= DATE('''+ xFechaInicio +''') '
            +' AND ECFCOMP <= DATE('''+ xFechaFin +''') '
            +' AND CAJA302.CIAID = ''' + xCiaId +''' '
            +' AND EC_IE = ''E'' '
            +' AND (CCBCOID IS NULL OR LENGTH(RTRIM(CCBCOID))=0) '
            +' AND CASE WHEN (RTRIM(CCBCOID) = '''' OR (CCBCOID IS NULL)) THEN ''E'' ELSE COALESCE(ECCHKEST,''P'') END = ''E'' AND'
            +' ECESTADO = ''C'' '
            +' AND CAJA302.EC_PROCE In (''1'', ''3'', ''B'')'

//-- egresos transferencias y compra venta m.e

            +' UNION ALL'
            +' SELECT SubStr(DECODE( EC_PROCE , ''0'', ''Egr. por Transf'', ''4'', ''Compra M.E''), 1, 3)||''/''||'
            +' TDIARID||''-''||ECNOCOMP ECFCOMP, TGE103.TMONABR,'
{    xSQL  := 'SELECT CAJA302.CUENTAID, CTADES,'
            +'CASE WHEN EC_PROCE = ''1'' THEN ''Egresos'' '
            +    ' WHEN EC_PROCE = ''3'' THEN ''Pago a Varios''  '
            +    ' WHEN EC_PROCE = ''4'' THEN ''Transferencias''  '
            +    ' WHEN EC_PROCE = ''R'' THEN ''Rendicion Ctas.'' '
            +    ' WHEN EC_PROCE = ''0'' THEN ''Compra/Venta ME.'' '
            +    ' WHEN EC_PROCE = ''7'' THEN ''Transferencias''  '
            +    ' WHEN EC_PROCE = ''B'' THEN ''Pago a Prov.'' END DOCABR , '
            +  ' TDIARID||''-''||ECNOCOMP ECFCOMP, TGE103.TMONABR, '}
            +' CAJA302.ECGLOSA, '
            +' CASE WHEN CAJA302.TMONID = '''+DMTE.wTMonLoc+''' THEN DEC( CAJA302.ECMTOLOC,15,2 ) ELSE 0 END ECMTOLOC,'
            +' CASE WHEN CAJA302.TMONID = '''+DMTE.wTMonExt+''' THEN DEC( CAJA302.ECMTOEXT,15,2 ) ELSE 0 END ECMTOEXT,'
            +' DEC( 0,15,2 ) ECMTOLOCI,'
            +' DEC( 0,15,2 ) ECMTOEXTI,'
            +' DEC( CAJA302.ECTCAMB,15,2 ) ECTCAMB,'
            +' CAJA302.CLAUXID, CAJA302.PROV, CNT201.AUXNOMB,'
            +' ''Egresos'' EC_IE,'
            +' CAJA302.ECFCOMP FECHA'
            +' FROM CAJA302 '
            +' LEFT OUTER JOIN TGE103 ON (CAJA302.TMONID = TGE103.TMONID) '
            +' LEFT OUTER JOIN CNT201 ON (CAJA302.PROV = CNT201.AUXID AND CAJA302.CLAUXID = CNT201.CLAUXID )'
            +' LEFT JOIN TGE202 CTA ON CTA.CIAID=CAJA302.CIAID AND CTA.CUENTAID=CAJA302.CUENTAID '
//              +   ' INNER JOIN TGE112 ON (CAJA302.FPAGOID = TGE112.FPAGOID AND TGE112.F_MOVDIARIO = ''S'' )'
            +' WHERE ECFCOMP >= DATE('''+ xFechaInicio +''') '
            +' AND ECFCOMP <= DATE('''+ xFechaFin +''') '
            +' AND CAJA302.CIAID = ''' + xCiaId +''' '
            +' AND EC_IE = ''E'' '
            +' AND (CCBCOID IS NULL OR LENGTH(RTRIM(CCBCOID))=0) '
            +' AND CASE WHEN (RTRIM(CCBCOID) = '''' OR (CCBCOID IS NULL)) THEN ''E'' ELSE COALESCE(ECCHKEST,''P'') END = ''E'' AND'
            +' ECESTADO = ''C'' '
            +' AND CAJA302.EC_PROCE In (''0'', ''4'')'

            +' UNION ALL '

            +'SELECT SubStr(TGE110.DOCABR, 1, 3)||''/''||'
            +' DECODE(NVL(CXC303.CCSERIE,null),null,null,''-'')||CXC303.CCNODOC ECFCOMP, TGE103.TMONABR,'
{            +'SELECT CXC303.CUENTAID, CTADES, TGE110VW.DOCABR, '
            +' CASE WHEN COALESCE(RTRIM(CXC303.CCSERIE),'''')<> '''' THEN ''-'' ELSE '''' END|| CXC303.CCNODOC ECFCOMP, TGE103.TMONABR, '}
            +' CXC303.CCGLOSA ECGLOSA,'
            +' DEC( 0, 15, 2 ) ECMTOLOC,'
            +' DEC( 0, 15, 2 ) ECMTOEXT,'
            +' ECCOBLOC ECMTOLOCI,'
            +' ECCOBEXT ECMTOEXTI,'
            +' DEC( CXC303.NCOTCAMB,15,2 ) ECTCAMB,'
            +' CXC303.CLAUXID, CXC303.CLIEID PROV, CNT201.AUXNOMB,'
            +' ''Ingresos'' EC_IE,'
            +' CXC303.CCFEMIS FECHA'
            +' FROM CXC303 '
            +' LEFT OUTER JOIN TGE110 ON (CXC303.DOCID = TGE110.DOCID)'
            +' LEFT OUTER JOIN TGE103 ON (CXC303.TMONID = TGE103.TMONID)'
            +' LEFT OUTER JOIN CNT201 ON (CXC303.CLIEID = CNT201.AUXID AND CXC303.CLAUXID = CNT201.CLAUXID)'
            +' LEFT JOIN TGE202 CTA ON CTA.CIAID=CXC303.CIAID AND CTA.CUENTAID=CXC303.CUENTAID '
            +' WHERE CCFEMIS >= DATE('''+ xFechaInicio +''') AND'
            +' CCFEMIS <= DATE('''+ xFechaFin +''') AND'
            +' CXC303.CIAID = ''' + xCiaId +''' AND'
            +' NCOESTADO = ''C'' AND'
            +' CCTREC IN (''NP'',''RC'',''LI'') '
//            +' ORDER BY 11, 2, 1 '
            +' Order By FECHA'
   else
    if DMTE.SRV_D = 'ORACLE' then
{      xSQL  := 'SELECT SubStr(DECODE( EC_PROCE , ''1'', ''Egresos'', EC_PROCE, ''3'','
              +' ''Pago a Varios'', EC_PROCE , ''B'' , ''Pago a Prov.'' ) , 1, 3)||''/''||'
              +' TDIARID||''-''||ECNOCOMP ECFCOMP, TGE103.TMONABR,'}
      xSQL  := 'SELECT SubStr(DECODE( EC_PROCE , ''1'', ''Egresos'', ''3'','
              +' ''Pago a Varios'', ''B'' , ''Pago a Prov.'' ) , 1, 3)||''/''||'
              +' TDIARID||''-''||ECNOCOMP ECFCOMP, TGE103.TMONABR,'
              +' CAJA302.ECGLOSA,'
              +' DECODE(CAJA302.TMONID,'''+DMTE.wTMonLoc+''', CAJA302.ECMTOLOC,0) ECMTOLOC,'
              +' DECODE(CAJA302.TMONID,'''+DMTE.wTMonExt+''', CAJA302.ECMTOEXT,0) ECMTOEXT,'
              +' 0 ECMTOLOCI,'
              +' 0 ECMTOEXTI,'
              +' CAJA302.ECTCAMB ECTCAMB,'
              +' CAJA302.CLAUXID, CAJA302.PROV, CNT201.AUXNOMB,'
              +' ''Egresos'' EC_IE,'
              +' CAJA302.ECFCOMP FECHA'
              +' FROM CAJA302, TGE103, CNT201, TGE112 '
              +' WHERE ECFCOMP >= TO_DATE('''+ xFechaInicio +''')'
              +' AND ECFCOMP <= TO_DATE('''+ xFechaFin +''')'
              +' AND CIAID = '+QuotedStr(xCiaId)
              +' AND EC_IE = ''E'' '
              +' AND (CCBCOID IS NULL OR LENGTH(TRIM(CCBCOID))=0) '
              +' AND DECODE(TRIM(CCBCOID),null,''E'',NVL(ECCHKEST,''P'')) = ''E'' AND '
              +' ECESTADO = ''C'' '
              +' AND (CAJA302.TMONID = TGE103.TMONID (+))'
              +' AND (CAJA302.PROV = CNT201.AUXID (+) '
              +' AND CAJA302.CLAUXID = CNT201.CLAUXID (+))'
              +' AND (CAJA302.FPAGOID = TGE112.FPAGOID '
              +' AND TGE112.F_MOVDIARIO = ''S'' )'
              +' AND CAJA302.EC_PROCE In (''1'', ''3'', ''B'')'
//-- egresos transferencias y compra venta m.e
              +' UNION ALL'
{              +' SELECT SubStr(DECODE( EC_PROCE , ''0'', ''Egr. por Transf'', EC_PROCE , ''4'', ''Compra M.E''), 1, 3)||''/''||'
              +' TDIARID||''-''||ECNOCOMP ECFCOMP, TGE103.TMONABR,'}
              +' SELECT SubStr(DECODE( EC_PROCE , ''0'', ''Egr. por Transf'', ''4'', ''Compra M.E''), 1, 3)||''/''||'
              +' TDIARID||''-''||ECNOCOMP ECFCOMP, TGE103.TMONABR,'
              +' CAJA302.ECGLOSA, DECODE(CAJA302.TMONID,'''+DMTE.wTMonLoc+''', CAJA302.ECMTOLOC,0) ECMTOLOC,'
              +' DECODE(CAJA302.TMONID, '''+DMTE.wTMonExt+''', CAJA302.ECMTOEXT,0) ECMTOEXT, 0 ECMTOLOCI,'
              +' 0 ECMTOEXTI, CAJA302.ECTCAMB ECTCAMB,'
              +' CAJA302.CLAUXID, CAJA302.PROV, CNT201.AUXNOMB, ''Egresos'' EC_IE,'
              +' CAJA302.ECFCOMP FECHA'
              +' FROM CAJA302, TGE103, CNT201'
              +' WHERE ECFCOMP >= TO_DATE('''+ xFechaInicio +''')'
              +' AND ECFCOMP <= TO_DATE('''+ xFechaFin +''')'
              +' AND CIAID = '+QuotedStr(xCiaId)
              +' AND EC_IE = '+QuotedStr('E')
              +' AND (CCBCOID IS NULL OR LENGTH(TRIM(CCBCOID))=0)'
              +' AND DECODE(TRIM(CCBCOID),null,''E'',NVL(ECCHKEST,''P'')) = ''E'''
              +' AND  ECESTADO = '+QuotedStr('C')
              +' AND (CAJA302.TMONID = TGE103.TMONID (+) )'
              +' AND (CAJA302.PROV = CNT201.AUXID (+)'
              +' AND CAJA302.CLAUXID = CNT201.CLAUXID (+) )'
              +' AND CAJA302.EC_PROCE In (''0'', ''4'')'              
//-- Ingresos
              +' UNION ALL '
              +' SELECT SubStr(TGE110.DOCABR, 1, 3)||''/''||'
              +' DECODE(NVL(CXC303.CCSERIE,null),null,null,''-'')||CXC303.CCNODOC ECFCOMP, TGE103.TMONABR,'
              +' CXC303.CCGLOSA ECGLOSA,'
              +' 0 ECMTOLOC,'
              +' 0 ECMTOEXT,'
              +' ECCOBLOC ECMTOLOCI,'
              +' ECCOBEXT ECMTOEXTI,'
              +' TRUNC(CXC303.NCOTCAMB,2) ECTCAMB,'
              +' CXC303.CLAUXID, CXC303.CLIEID PROV, CNT201.AUXNOMB,'
              +' ''Ingresos'' EC_IE,'
              +' CXC303.CCFEMIS FECHA'
              +' FROM CXC303, TGE110, TGE103, CNT201'
              +' WHERE CCFEMIS >= TO_DATE('''+ xFechaInicio +''') '
              +' AND CCFEMIS <= TO_DATE('''+ xFechaFin +''') '
              +' AND CIAID = '+QuotedStr(xCiaId)
              +' AND NCOESTADO = ''C'' '
              +' AND CCTREC IN (''NP'',''RC'',''LI'') '
              +' AND (CXC303.DOCID = TGE110.DOCID (+)) '
              +' AND (CXC303.TMONID = TGE103.TMONID (+)) '
              +' AND (CXC303.CLIEID = CNT201.AUXID (+) AND CXC303.CLAUXID = CNT201.CLAUXID (+)) '
              +' AND BANCOID ='+QuotedStr(dblcCaja.Text)
//              +' ORDER BY 11, 2, 1 ';
              +' Order By FECHA';

	 DMTE.cdsRec.Close;
	 DMTE.cdsRec.DataRequest(xSQL);
	 DMTE.cdsRec.Open;

	 //PROCEDIMIENTO PREVIO AL RESUMEN DEL ARQUEO DE CAJA
	 xSQL := 'DELETE FROM CAJARPT1_2' ;
	 //** 04/007/2001 - pjsv
	 try
		DMTE.DCOM1.AppServer.EjecutaSQL(xSQL) ;
	 except
	 end;
	 //**

	 //INSERTA DATOS EN CAJARPT1
   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
	  xSQL := 'INSERT INTO CAJARPT1_2(EC_IE, FPAGOID, MTOLOC, MTOEXT) '
					 +  '(SELECT EC_IE, FPAGOID, '
					 +     ' CASE WHEN TMONID ='''+DMTE.wTMonLoc+''' THEN DEC(SUM( COALESCE(ECMTOLOC,0) ),15,2) END MTOLOC, '
					 +     ' CASE WHEN TMONID ='''+DMTE.wTMonExt+''' THEN DEC(SUM( COALESCE(ECMTOEXT,0) ),15,2) END MTOEXT '
					 +   ' FROM CAJA302 '
					 +   ' WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') AND '
					 +     ' ECFCOMP >= DATE('''+ xFechaInicio +''') AND '
					 +     ' ECFCOMP <= DATE('''+ xFechaFin +''')AND '
					 +     ' CIAID = '''+ xCiaId   +''' AND '
					 +     ' EC_IE = ''E'' AND'
					 +     ' CASE WHEN (RTRIM(CCBCOID) = '''' OR (CCBCOID IS NULL)) THEN ''E'' ELSE COALESCE(ECCHKEST,''P'') END = ''E''   AND '
					 +     ' ECESTADO = ''C'' '
					 +   ' GROUP BY EC_IE, FPAGOID, TMONID ) '
	 else
	  if DMTE.SRV_D = 'ORACLE' then
		 xSQL := 'SELECT EC_IE, FPAGOID,'
//							 ' decode(TMONID,'+QuotedStr(DMTE.wTMonLoc)+',SUM(nvl(ECMTOLOC,0))) MTOLOC,'
            +' CASE WHEN TMONID ='+QuotedStr(DMTE.wTMonLoc)+' THEN SUM(NVL(ECMTOLOC, 0)) ELSE 0 END MTOLOC,'
//							 ' decode(TMONID,'+QuotedStr(DMTE.wTMonExt)+',SUM(nvl(ECMTOEXT,0))) MTOEXT'+
            +' CASE WHEN TMONID = '+QuotedStr(DMTE.wTMonExt)+' THEN SUM(NVL(ECMTOEXT, 0)) ELSE 0 END MTOEXT'
            +' FROM CAJA302'+
							 //** 16/10/2001- pjsv Cambiar el codigo duro, queda pendiente
             ' WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') AND'+
             ' ECFCOMP >= TO_DATE('+QuotedStr(xFechaInicio)+') AND'+
             ' ECFCOMP <= TO_DATE('+QuotedStr(xFechaFin)+') AND'+
             ' CIAID = '+QuotedStr(xCiaId)+' AND  EC_IE = ''E'''
            +' AND CASE WHEN CCBCOID Is NULL THEN ''E'' ELSE NVL(ECCHKEST, ''P'') END = ''E'''
//							 ' decode(TRIM(CCBCOID),null,''E'',nvl(ECCHKEST,''P'')) = ''E'''
            +' AND ECESTADO = ''C'' GROUP BY EC_IE, FPAGOID, TMONID';

	 //** 04/07/2001  - pjsv
	 try
		DMTE.DCOM1.AppServer.EjecutaSQL(xSQL) ;
	 except
	 end;
	 //**

	 if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
	 xSQL := 'INSERT INTO CAJARPT1_2(EC_IE,FPAGOID, MTOLOC, MTOEXT) '
					 +  '(SELECT ''I'' EC_IE, FPAGOID, '
					 +     ' CASE WHEN TMONID = '''+DMTE.wTMonLoc+''' THEN DEC(SUM( COALESCE(FC_MTOLOC,0) ),15,2) END MTOLOC,'
					 +     ' CASE WHEN TMONID = '''+DMTE.wTMonExt+''' THEN DEC(SUM( COALESCE(FC_MTOEXT,0) ),15,2) END MTOEXT '
					 +   ' FROM CAJA314 '
					 +   ' WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') AND '
					 +     ' FC_FCANC >= DATE('''+ xFechaInicio +''') AND '
					 +     ' FC_FCANC <= DATE('''+ xFechaFin    +''') AND '
					 +     ' CIAID = '''+ xCiaId  +''' AND '
					 +     ' FC_ESTADO = ''C'' '
					 +  ' GROUP BY FPAGOID,TMONID)'
	 else
		if DMTE.SRV_D = 'ORACLE' then
			 xSQL := 'INSERT INTO CAJARPT1_2(EC_IE, FPAGOID, MTOLOC, MTOEXT)'
							 +'(SELECT ''I'' EC_IE, FPAGOID,'
//							 +       ' DECODE( TMONID , '''+DMTE.wTMonLoc+''' , TRUNC(SUM( NVL(FC_MTOLOC,0) ),2)) MTOLOC,'
               +' CASE WHEN TMONID ='+QuotedStr(DMTE.wTMonLoc)+' THEN TRUNC(SUM( NVL(FC_MTOLOC,0) ),2) END MTOLOC,'
//							 +       ' DECODE( TMONID , '''+DMTE.wTMonLoc+''' , TRUNC(SUM( NVL(FC_MTOEXT,0) ),2)) MTOEXT'
               +' CASE WHEN TMONID ='+QuotedStr(DMTE.wTMonLoc)+' THEN TRUNC(SUM( NVL(FC_MTOEXT,0)),2) END MTOEXT'
							 +' FROM CAJA314'
							 //** 17/10/2001- pjsv , cambiar codigo duro
							 +' WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') AND'
							 +' FC_FCANC >= TO_DATE('''+ xFechaInicio+''') AND'
							 +' FC_FCANC <= TO_DATE('''+ xFechaFin+''') AND'
							 +' CIAID = '+QuotedStr(xCiaId)
							 +' AND FC_ESTADO = ''C'' '
							 +' GROUP BY FPAGOID, TMONID)';
	//** 04/07/2001 - pjsv
   try
	  DMTE.DCOM1.AppServer.EjecutaSQL(xSQL) ;
	 except
	 end;
	//**
   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
		 xSQL := 'SELECT CAJARPT1_2.FPAGOID, TGE112.FPAGODES,'+
									 ' SUM(CASE WHEN EC_IE = ''I'' THEN CASE WHEN NOT (MTOLOC IS NULL) THEN MTOLOC ELSE 0 END ELSE 0  END) AS MTOLOCI,'+
									 ' SUM(CASE WHEN EC_IE = ''I'' THEN CASE WHEN NOT (MTOEXT IS NULL) THEN MTOEXT ELSE 0 END ELSE 0  END) AS MTOEXTI,'+
									 ' SUM(CASE WHEN EC_IE = ''E'' THEN CASE WHEN NOT (MTOLOC IS NULL) THEN MTOLOC ELSE 0 END ELSE 0  END) AS MTOLOCE,'+
									 ' SUM(CASE WHEN EC_IE = ''E'' THEN CASE WHEN NOT (MTOEXT IS NULL) THEN MTOEXT ELSE 0 END ELSE 0  END) AS MTOEXTE'+
						 ' FROM CAJARPT1_2 '
							+' LEFT JOIN TGE112 ON (CAJARPT1_2.FPAGOID = TGE112.FPAGOID )'
							+' GROUP BY CAJARPT1_2.FPAGOID, TGE112.FPAGODES'
   else
	  if DMTE.SRV_D = 'ORACLE' then
		 xSQL := 'SELECT CAJARPT1_2.FPAGOID, TGE112.FPAGODES,'+
             ' SUM(DECODE(EC_IE , ''I'',NVL(MTOLOC, 0))) MTOLOCI,'+
             ' SUM(DECODE(EC_IE , ''I'',NVL(MTOEXT, 0))) MTOEXTI,'+
             ' SUM(DECODE(EC_IE , ''E'',NVL(MTOLOC, 0))) MTOLOCE,'+
             ' SUM(DECODE(EC_IE , ''E'',NVL(MTOEXT, 0))) MTOEXTE' +
		 				 ' FROM CAJARPT1_2, TGE112'
		  	    +' WHERE (CAJARPT1_2.FPAGOID = TGE112.FPAGOID )'
						+' GROUP BY CAJARPT1_2.FPAGOID, TGE112.FPAGODES';
	 DMTE.cdsDescrip.Close;
	 DMTE.cdsDescrip.DataRequest(xSQL);
   DMTE.cdsDescrip.Open;
end;

procedure TFToolMovCaja.dblcdAnoMesExit(Sender: TObject);
var
   xSQL, xDia : String;
   SaldoMN, SaldoME : Double;
   xFecha, FechaProc: TDate;
   xSQL1, xSQL2,  xSQL3, xWhere : String;
   Year, Month, Day : Word;
   nOrden : Integer;
begin
   If Length(dblcdAnoMes.Text) > 0 Then
    begin
     If Length(dblcdAnoMes.Text) > 0 Then
      begin
       xAno := Copy(dblcdAnoMes.Text, 1, 4);
       xMes := Copy(dblcdAnoMes.Text, 5, 2);
       dbdtpInicio.Date := StrToDate('01/'+xMes+'/'+xAno);
    //Para la Fecha Final
       If StrToInt(xMes) = 12 Then
        begin
         xAno := IntToStr(StrToInt(xAno) + 1);
         xMes := DMTE.StrZero('1', 2);
        end
       Else
        begin
         xMes := DMTE.StrZero(xMes, 2);
        end;

       xSQL := 'Select CASE WHEN '+QuotedStr(xMes)+' In ( ''01'',''03'',''05'',''07'',''08'',''10'',''12'' )'
              +' THEN ''31/''||'+QuotedStr(xMes)+'||''/''||'+QuotedStr(xAno)
              +' ELSE CASE WHEN '+QuotedStr(xMes)+' In ( ''04'',''06'',''09'',''11'' )'
              +' THEN ''30/''||'+QuotedStr(xMes)+'||''/''||'+QuotedStr(xAno)
              +' ELSE ''28/''||'+QuotedStr(xMes)+'||''/''||'+QuotedStr(xAno)+' END END FECHA From DUAL';

       DMTE.cdsQry5.Filter   := '';
       DMTE.cdsQry5.Filtered := False;
       DMTE.cdsQry5.IndexFieldNames := '';
       DMTE.cdsQry5.Close;
       DMTE.cdsQry5.DataRequest(xSQL);
       DMTE.cdsQry5.Open;

       dbdtpFin.Date  := StrToDate(DMTE.cdsQry5.FieldByName('FECHA').AsString);
      end;

  //******************************************************************************
     SaldoMN := 0;
     SaldoME := 0;

     If Length(dblcdAnoMes.Text) = 0 Then
      begin
       Beep;
       MessageDlg('Ingrese el Año y Mes', mtInformation, [mbOk], 0);
       dblcdAnoMes.SetFocus;
       Exit;
      end;
  //   Else
  //    dblcdAnoMesExit(Sender);

     FechaProc := dbdtpInicio.Date;

     xFecha := StrToDate(dbdtpInicio.Text);
     DecodeDate(xFecha ,Year, Month, Day);

     If StrToInt(xMes) = 12 Then
      begin
       xAno := IntToStr(StrToInt(xAno) + 1);
       xMes := DMTE.StrZero('1', 2);
      end
     Else
      begin
       xMes := DMTE.StrZero(IntToStr(StrToInt(xMes) - 1), 2);
      end;

     xWhere := 'CIAID = '+QuotedStr(dblcCia.Text)
              +' And BANCOID = '+QuotedStr(dblcCaja.Text)
              +' And To_Char(STFECHA, ''YYYYMM'') ='+QuotedStr(xAno+xMes);
     DMTE.DisplayDescrip('prvSQL', 'CAJA310', 'MAX(STFECHA) STFECHA', xWhere, 'STFECHA');

     xWhere := 'CIAID ='+QuotedStr(dblcCia.Text)
              +' And BANCOID ='+QuotedStr(dblcCaja.Text)
              +' And STFECHA ='+QuotedStr(DMTE.cdsQry.FieldByName('STFECHA').AsString);
     DMTE.DisplayDescrip('prvSQL', 'CAJA310', 'STSALDOFIN, STSDOFINEXT', xWhere, 'STSALDOFIN');
     SaldoMN := DMTE.cdsQry.FieldByName('STSALDOFIN').AsFloat;
     SaldoME := DMTE.cdsQry.FieldByName('STSDOFINEXT').AsFloat;
  {   DMTE.CalculaSaldo(dblcCia.Text,
                    dblcCaja.Text,
                    ' ', FechaProc, Saldomn, Saldome);}

  {   XSQL:=Fprincipal.xfiltroMovLibCaja.FMant.SQL;
     Fprincipal.xfiltroMovLibCaja.FMant.cds2.Filtered:=False;
   }


  {      Fprincipal.xfiltroMovLibCaja.FMant.cds2.Filter:='  BANCOID='''+dblcCaja.TEXT
        +''' AND (FECHA>='''+dbdtpInicio.TEXT+''' AND FECHA<='''+dbdtpFin.TEXT
        +''') AND CIAID='''+dblcCia.TEXT+'''';}

     if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
      begin
       xSQL1 := 'SELECT ECNOCOMP, PROV, INGRESOLOC, EGRESOLOC, INGRESOEXT, EGRESOEXT, '
               +' CCGLOSA, CCNOMB,FPAGOID, ECNOCHQ, PAGCHEQUMN, PAGCHEQUME, '
               +' PAGEFECTMN, PAGEFECTME, PAGNOTDMN, PAGNOTDME, FPAGODES, TCAMBIO, CLAUXID, CIAID, '
               +' CIADES, BANCONOM, TMONID, TMONDES, FECHA, CLAUXDES, DOCID, NODOC, CPTOID, CUENTAID, '
               +' CPTODES, TIPO, BANCOID, TOTALLOC, TOTALEXT, HORA, SALDOMN, SALDOME, NORDEN, SALDOANTMN, '
               +' SALDOANTME, CTACPTO, 0.00 DEBEMN, 0.00 HABERMN, 0.00 DEBEME, 0.00 HABERME FROM'
               +' ( SELECT MAX(A.ECNOCOMP) ECNOCOMP, A.CLIEID PROV,'
               +' CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN MAX(A.NCOMTOLOC) ELSE 0 END INGRESOLOC,'
               +' CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN 0.00 ELSE 0.00 END EGRESOLOC,'
               +' CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN MAX(A.NCOMTOEXT) ELSE 0 END INGRESOEXT,'
               +' CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN 0.00 ELSE 0.00 END EGRESOEXT,'
               +' MAX(A.CCGLOSA) CCGLOSA, MAX(A.CCNOMB) CCNOMB, MAX(B.FPAGOID) FPAGOID , MAX(B.ECNOCHQ) ECNOCHQ,'
               +' SUM(CASE WHEN (C.FCHQ=''S'' OR C.FCHQ=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO ELSE 0 END) PAGCHEQUMN,'
               +' SUM(CASE WHEN (C.FCHQ=''S'' OR C.FCHQ=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO ELSE 0 END) PAGCHEQUME,'
               +' SUM(CASE WHEN (C.FEFE=''S'' OR C.FEFE=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO ELSE 0 END) PAGEFECTMN,'
               +' SUM(CASE WHEN (C.FEFE=''S'' OR C.FEFE=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO ELSE 0 END) PAGEFECTME,'
               +' SUM(CASE WHEN (C.FNDE=''S'' OR C.FNDE=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO ELSE 0 END) PAGNOTDMN,'
               +' SUM(CASE WHEN (C.FNDE=''S'' OR C.FNDE=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO ELSE 0 END) PAGNOTDME,'
               +' MAX(B.FPAGODES) FPAGODES,'
               +' MAX(A.NCOTCAMB) TCAMBIO, A.CLAUXID, A.CIAID CIAID, MAX(E.CIADES) CIADES, MAX(D.BANCONOM) BANCONOM,'
               +' A.TMONID, MAX(F.TMONDES) TMONDES, A.CCFEMIS FECHA, MAX(G.CLAUXDES) CLAUXDES, A.DOCID,'
               +' A.CCNODOC NODOC, A.CPTOID, A.CUENTAID, MAX(H.CPTODES) CPTODES, ''INGRESO'' TIPO, A.BANCOID,'
               +' (SUM( CASE WHEN (C.FCHQ=''S'' OR C.FCHQ=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO ELSE 0 END))'
               +' +(SUM(CASE WHEN (C.FEFE=''S'' OR C.FEFE=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO ELSE 0 END))'
               +' +(SUM(CASE WHEN (C.FNDE=''S'' OR C.FNDE=''1'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO ELSE 0 END)) TOTALLOC,'
               +' (SUM(CASE WHEN (C.FCHQ=''S'' OR C.FCHQ=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO ELSE 0 END))'
               +' +(SUM(CASE WHEN (C.FEFE=''S'' OR C.FEFE=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO ELSE 0 END))'
               +' +(SUM(CASE WHEN (C.FNDE=''S'' OR C.FNDE=''1'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO ELSE 0 END)) TOTALEXT,'
               +' MAX(A.NCOHREG) HORA, 0.00  SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, MAX(H.CUENTAID) CTACPTO '
  //             +' FROM CXC303 A, CAJA314 B, TGE112 C, TGE105 D, TGE101 E, TGE103 F,'
  //             +' TGE102 G, CAJA201 H '
               +' FROM CXC303 A LEFT JOIN CAJA314 B ON (A.CIAID = B.CIAID AND A.DOCID = B.DOCID'
               +' AND A.CCSERIE = B.CCSERIE AND A.CCNODOC=B.CCNODOC AND A.CLAUXID = B.CLAUXID'
               +' AND A.CLIEID = B.CLIEID)'
               +'               LEFT JOIN TGE105 D ON (A.BANCOID = D.BANCOID)'
               +'               LEFT JOIN TGE101 E ON (A.CIAID = E.CIAID)'
               +'               LEFT JOIN TGE103 F ON (A.TMONID = F.TMONID)'
               +'               LEFT JOIN TGE102 G ON (A.CLAUXID = G.CLAUXID)'
               +'               LEFT JOIN CAJA201 H ON (A.CPTOID = H.CPTOID)'
               +' TGE112 C LEFT JOIN CAJA314 B ON (C.FPAGOID = B.FPAGOID)'
               +' CAJA314 B LEFT JOIN TGE101 E ON (B.CIAID = E.CIAID)'
               +' Where A.NCOESTADO ='+QuotedStr('C')
               +' AND D.BCOTIPCTA ='+QuotedStr('C')
               +' GROUP BY A.CIAID, A.CLIEID, A.BANCOID, A.CPTOID, A.CUENTAID, A.DOCID, A.CCNODOC,'
               +' A.CCFEMIS, A.ECANOMM, A.TMONID, A.CLAUXID';

       xSQL2 := ' UNION ALL '

               +' SELECT A.ECNOCOMP, A.PROV PROV, '
               +' (CASE WHEN (A.EC_IE =''I'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END ) INGRESOLOC,'
               +' (CASE WHEN (A.EC_IE =''E'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END ) EGRESOLOC,'
               +' (CASE WHEN (A.EC_IE =''I'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END ) INGRESOEXT,'
               +' (CASE WHEN (A.EC_IE =''E'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END ) EGRESOEXT,'
               +' '' '' AS CCGLOSA,H.PROVDES CCNOMB, A.FPAGOID,A.ECNOCHQ,'
               +' (CASE WHEN (B.FCHQ=''S'' OR B.FCHQ=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGCHEQUMN,'
               +' (CASE WHEN (B.FCHQ=''S'' OR B.FCHQ=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGCHEQUME,'
               +' (CASE WHEN (B.FEFE=''S'' OR B.FEFE=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGEFECTMN,'
               +' (CASE WHEN (B.FEFE=''S'' OR B.FEFE=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGEFECTME,'
               +' (CASE WHEN (B.FNDE=''S'' OR B.FNDE=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGNOTDMN,'
               +' (CASE WHEN (B.FNDE=''S'' OR B.FNDE=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGNOTDME,'
               +' B.FPAGODES, A.ECTCAMB  TCAMBIO,A.CLAUXID, A.CIAID CIAID , D.CIADES, C.BANCONOM,'
               +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, F.CLAUXDES,'
               +' CASE WHEN A.EC_PROCE=''1'' THEN ''PAG. NO PROV'' ELSE  ''PAG.PROV'' END  DOCID ,A.ECNOCOMP NODOC,'
               +' A.CPTOID,A.CUENTAID,G.CPTODES ,''EGRESO'' TIPO, A.BANCOID,'
               +' ((CASE WHEN  (B.FCHQ=''S'' OR B.FCHQ=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END))'
               +'+((CASE WHEN  (B.FEFE=''S'' OR B.FEFE=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END))'
               +'+((CASE WHEN  (B.FNDE=''S'' OR B.FNDE=''1'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END)) TOTALLOC,'
               +' ((CASE WHEN  (B.FCHQ=''S'' OR B.FCHQ=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END))'
               +' +((CASE WHEN (B.FEFE=''S'' OR B.FEFE=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END))'
               +' +((CASE WHEN (B.FNDE=''S'' OR B.FNDE=''1'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END)) TOTALEXT,'
               +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN , 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
  //             +' FROM CAJA302 A, TGE112 B, TGE105 C, TGE101 D, TGE103 E, TGE102 F, CAJA201 G, TGE201 H '
               +' FROM CAJA302 A LEFT JOIN TGE112 B ON (A.FPAGOID = B.FPAGOID)'
               +'                LEFT JOIN TGE105 C ON (A.BANCOID = C.BANCOID)'
               +'                LEFT JOIN TGE101 D ON (A.CIAID = D.CIAID)'
               +'                LEFT JOIN TGE103 E ON (A.TMONID = E.TMONID)'
               +'                LEFT JOIN TGE102 F ON (A.CLAUXID = F.CLAUXID)'
               +'                LEFT JOIN CAJA201 G ON (A.CPTOID = G.CPTOID)'
               +'                LEFT JOIN TGE201 H ON (A.PROV = H.PROV)'
               +' Where (CASE WHEN A.EC_IE =''E'' THEN A.ECMTOLOC ELSE 0 END )>0'
               +' AND A.EC_PROCE IN (''B'',''1'')'
               +' AND A.ECESTADO ='+QuotedStr('C')
               +' AND C.BCOTIPCTA ='+QuotedStr('C')

               +' UNION ALL'
               +' Select A.ECNOCOMP, A.PROV, 0.00 INGRESOLOC,'
               +' CASE WHEN A.TMONID= '+QuotedStr(DMTE.wTMonLoc)+' THEN ECMTOLOC ELSE ROUND(ECMTOEXT*A.ECTCAMB,2) END EGRESOSOL,'
               +' 0.00 INGRESOEXT,'
               +' CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonExt)+' THEN ECMTOEXT ELSE 0 END EGRESOEXT, A.ECGLOSA,'
               +' ''Transferencia'' CCNOMB, A.FPAGOID, A.ECNOCHQ,'
               +' 0.00 PAGCHEQUMN, 0.00 PAGCHEQUME, (DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC, 0)) PAGEFECTMN,'
               +' (DECODE(A.TMONID,'''+DMTE.wTMonExt+''',A.ECMTOEXT, 0)) PAGEFECTME, 0.00 PAGNOTDMN, 0.00 PAGNOTDME,'
               +' '''' FPAGODES, A.ECTCAMB TCAMBIO, A.CLAUXID,'
               +' A.CIAID CIAID, D.CIADES, C.BANCONOM, A.TMONID, E.TMONDES, A.ECFCOMP FECHA,'
               +' '' '' CLAUXDES, A.DOCID, A.ECNODOC NODOC, A.CPTOID,'
               +' B.CTAREMES CUENTAID, ''Transferencia'' CPTODES, ''INGRESO'' TIPO, A.BANCOID,'
               +' (DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0 )) TOTALLOC,'
               +' (DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0 ) ) TOTALEXT, A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME,'
               +' ''  '' NORDEN, 0.00 SALDOANTMN,'
               +' 0.00 SALDOANTME, ''  '' CTACPTO'
  //             +' FROM CAJA302 A, TGE106 B, TGE105 C, TGE101 D, TGE103 E'
               +' FROM CAJA302 A LEFT JOIN TGE106 B ON (A.BANCOID = B.BANCOID)'
               +'                LEFT JOIN TGE105 C ON (A.BANCOID = C.BANCOID)'
               +'                LEFT JOIN TGE101 D ON (A.CIAID = D.CIAID)'
               +'                LEFT JOIN TGE103 E ON (A.TMONID = E.TMONID)'
               +' WHERE A.BANCOID='+QuotedStr(dblcCaja.Text)
               +' AND A.EC_PROCE IN (''0'')'
               +' AND EC_IE = '+QuotedStr('E')
               +' AND ECFCOMP >= '+QuotedStr(dbdtpInicio.Text)
               +' AND ECFCOMP <= '+QuotedStr(dbdtpFin.Text)
               +' And B.CIAID ='+QuotedStr(dblcCia.Text)
               +' And A.CIAID ='+QuotedStr(dblcCia.Text);

       xSQL3 := ' UNION ALL '

               +' SELECT A.ECNOCOMP, A.PROV PROV,'
               +' 0.00   INGRESOLOC, '
               +' (CASE WHEN (A.EC_IE =''E'' AND A.TMONID='''+DMTE.wTMonLoc+''') THEN A.ECMTOLOC ELSE 0 END ) EGRESOLOC,'
               +' 0.00   INGRESOEXT, '
               +' (CASE WHEN (A.EC_IE =''E'' AND A.TMONID='''+DMTE.wTMonExt+''') THEN A.ECMTOEXT ELSE 0 END ) EGRESOEXT,'
               +' '' '' CCGLOSA, ''TRANSFERENCIA'' CCNOMB, A.FPAGOID, A.ECNOCHQ, '
               +' 0.00 PAGCHEQUMN, '
               +' 0.00 PAGCHEQUME, '
               +' (CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGEFECTMN,'
               +' (CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGEFECTME,'
               +' 0.00 PAGNOTDMN,'
               +' 0.00 PAGNOTDME,'
               +' '' '' FPAGODES, A.ECTCAMB TCAMBIO, A.CLAUXID, A.CIAID CIAID, D.CIADES,C.BANCONOM,'
               +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA ,'' '' CLAUXDES, A.DOCID, A.ECNODOC NODOC,'
               +' A.CPTOID, A.CUENTAID, ''Transferencia'' CPTODES, ''EGRESO'' TIPO, A.BANCOID, '
               +' (CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) TOTALLOC,'
               +' (CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) TOTALEXT, '
               +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
  //             +' FROM CAJA302 A, TGE105 C, TGE101 D, TGE103 E'
               +' FROM CAJA302 A LEFT JOIN TGE105 C ON (A.BANCOID = C.BANCOID)'
               +'                LEFT JOIN TGE101 D ON (A.CIAID = D.CIAID)'
               +'                LEFT JOIN TGE103 E ON (A.TMONID = E.TMONID)'
               +' Where (CASE WHEN A.EC_IE =''E'' THEN A.ECMTOLOC ELSE 0 END )>0  '
               +' AND A.EC_PROCE IN (''4'') AND A.ECESTADO=''C'' '
               +' AND C.BCOTIPCTA='+QuotedStr('C')

               +' UNION ALL '

               +' SELECT A.ECNOCOMP, A.PROV PROV, '
               +' (CASE WHEN (A.EC_IE =''I'' AND A.TMONID='''+DMTE.wTMonLoc+''') THEN A.ECMTOLOC ELSE 0 END ) INGRESOLOC,'
               +' 0.00 EGRESOLOC,'
               +' (CASE WHEN (A.EC_IE =''I'' AND A.TMONID='''+DMTE.wTMonExt+''') THEN A.ECMTOEXT ELSE 0 END ) INGRESOEXT,'
               +' 0.00 EGRESOEXT,'
               +' '' '' CCGLOSA,''TRANSFERENCIA'' AS CCNOMB, A.FPAGOID,A.ECNOCHQ, '
               +' 0.00 PAGCHEQUMN,'
               +' 0.00 PAGCHEQUME,'
               +' (CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGEFECTMN,'
               +' (CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGEFECTME,'
               +' 0.00 PAGNOTDMN,'
               +' 0.00 PAGNOTDME,'
               +' '' ''  FPAGODES, A.ECTCAMB TCAMBIO,A.CLAUXID, A.CIAID CIAID, D.CIADES, C.BANCONOM,  '
               +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA  ,'' '' CLAUXDES, A.DOCID, A.ECNODOC NODOC,'
               +' A.CPTOID, A.CUENTAID, ''Transferencia'' CPTODES, ''INGRESO'' TIPO, A.BANCOID,'
               +' (CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) TOTALLOC,'
               +' (CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) TOTALEXT,'
               +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''  '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
  //             +' FROM CAJA302 A, TGE105 C, TGE101 D, TGE103 E '
               +' FROM CAJA302 A LEFT JOIN TGE105 C ON (A.BANCOID = C.BANCOID)'
               +'                LEFT JOIN TGE101 D ON (A.CIAID = D.CIAID)'
               +'                LEFT JOIN TGE103 E ON (A.TMONID = E.TMONID)'
               +' Where   A.EC_PROCE IN (''7'') '
               +' AND C.BCOTIPCTA ='+QuotedStr('C')
               +' ) SOLVISTA'
               +' WHERE BANCOID='+QuotedStr(dblcCaja.Text)
               +' AND (FECHA>='''+dbdtpInicio.Text+''' AND FECHA<='''+dbdtpFin.Text
               +''')  AND CIAID='+QuotedStr(dblcCia.Text)
               +' ORDER BY FECHA, HORA';
      end;

     if (DMTE.SRV_D = 'ORACLE') then
      begin
       xSQL1 := ' SELECT ECNOCOMP, PROV, INGRESOLOC, EGRESOLOC, INGRESOEXT, EGRESOEXT,'
               +' CCGLOSA, CCNOMB, FPAGOID, ECNOCHQ, PAGCHEQUMN, PAGCHEQUME,'
               +' PAGEFECTMN, PAGEFECTME, PAGNOTDMN, PAGNOTDME, FPAGODES, TCAMBIO, CLAUXID, CIAID,'
               +' CIADES, BANCONOM, TMONID, TMONDES, FECHA, CLAUXDES, DOCID, NODOC, CPTOID, CUENTAID,'
               +' CPTODES, TIPO, BANCOID, TOTALLOC, TOTALEXT, HORA, SALDOMN, SALDOME, NORDEN, SALDOANTMN, SALDOANTME, CTACPTO,'
               +' 0.00 DEBEMN, 0.00 HABERMN, 0.00 DEBEME, 0.00 HABERME FROM'
               +' (  SELECT MAX(A.ECNOCOMP) ECNOCOMP, A.CLIEID PROV,'
               +' DECODE( A.TMONID,'''+DMTE.wTMonLoc+''',MAX(A.NCOMTOLOC), 0) INGRESOLOC,'
               +' DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', 0.00 , 0.00 ) EGRESOLOC,'
               +' DECODE( A.TMONID,'''+DMTE.wTMonExt+''', MAX(A.NCOMTOEXT), 0 ) INGRESOEXT,'
               +' DECODE( A.TMONID,'''+DMTE.wTMonExt+''',  0.00, 0.00 ) EGRESOEXT,'
               +' MAX(A.CCGLOSA) CCGLOSA, MAX(A.CCNOMB) CCNOMB, MAX(B.FPAGOID) FPAGOID, MAX(B.ECNOCHQ) ECNOCHQ,'
               +' SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) PAGCHEQUMN,'
               +' SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ) PAGCHEQUME,'
               +' SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) PAGEFECTMN,'
               +' SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ) PAGEFECTME,'
               +' SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) PAGNOTDMN,'
               +' SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ) PAGNOTDME,'
               +' MAX(B.FPAGODES) FPAGODES, '
               +' MAX(A.NCOTCAMB) TCAMBIO, A.CLAUXID ,A.CIAID CIAID, MAX(E.CIADES) CIADES ,MAX(D.BANCONOM) BANCONOM,'
               +' A.TMONID, MAX(F.TMONDES) TMONDES, A.CCFEMIS FECHA, MAX(G.CLAUXDES) CLAUXDES, A.DOCID,'
               +' A.CCNODOC NODOC, A.CPTOID, A.CUENTAID, MAX(H.CPTODES) CPTODES, ''INGRESO'' TIPO, A.BANCOID,'
               +' (SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ))'
               +' +(SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ))'
               +' +(SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) ) TOTALLOC,'
               +' (SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ))'
               +' +(SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ))'
               +' +(SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) )) TOTALEXT,'
               +' MAX(A.NCOHREG) HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, MAX(H.CUENTAID) CTACPTO'
               +' FROM CXC303 A, CAJA314 B, TGE112 C, TGE105 D, TGE101 E, TGE103 F,'
               +' TGE102 G, CAJA201 H'
               +' Where A.NCOESTADO=''C'' AND B.CIAID=A.CIAID'
               +' AND B.DOCID=A.DOCID AND B.CCSERIE=A.CCSERIE'
               +' AND B.CCNODOC=A.CCNODOC AND B.CLAUXID=A.CLAUXID AND B.CLIEID=A.CLIEID'
               +' AND C.FPAGOID=B.FPAGOID'
               +' AND A.BANCOID=D.BANCOID AND D.BCOTIPCTA=''C'' AND A.CIAID=E.CIAID'
               +' AND A.CIAID=E.CIAID AND B.CIAID=E.CIAID AND A.TMONID=F.TMONID'
               +' AND A.CLAUXID=G.CLAUXID AND A.CPTOID=H.CPTOID'
               +' GROUP BY A.CIAID, A.CLIEID, A.BANCOID, A.CPTOID, A.CUENTAID, A.DOCID, A.CCNODOC,'
               +' A.CCFEMIS, A.ECANOMM, A.TMONID, A.CLAUXID';

       xSQL2 := ' UNION ALL '

               +' SELECT A.ECNOCOMP, A.PROV  PROV,'
               +' ( DECODE(A.EC_IE,''I'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC,0)),0) ) INGRESOLOC,'
               +' ( DECODE(A.EC_IE,''E'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC,0)),0) ) EGRESOLOC,'
               +' ( DECODE(A.EC_IE,''I'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''',A.ECMTOEXT,0)),0) ) INGRESOEXT,'
               +' ( DECODE(A.EC_IE,''E'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''',A.ECMTOEXT,0)),0) ) EGRESOEXT,'
               +' '' '' AS CCGLOSA, H.PROVDES CCNOMB, A.FPAGOID, A.ECNOCHQ,'
               +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) PAGCHEQUMN,'
               +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) PAGCHEQUME,'
               +' ( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) PAGEFECTMN,'
               +' ( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) PAGEFECTME,'
               +' ( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) PAGNOTDMN,'
               +' ( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) PAGNOTDME,'
               +' B.FPAGODES, A.ECTCAMB TCAMBIO, A.CLAUXID, A.CIAID CIAID, D.CIADES, C.BANCONOM,'
               +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, F.CLAUXDES,'
               +' DECODE(A.EC_PROCE,''1'', ''PAG. NO PROV'',''PAG.PROV'') DOCID, A.ECNOCOMP NODOC,'
               +' A.CPTOID, A.CUENTAID, G.CPTODES, ''EGRESO'' TIPO, A.BANCOID,'
               +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) )'
               +'+( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) )'
               +'+(( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) )) TOTALLOC,'
               +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) )'
               +' +( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) )'
               +' +( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) TOTALEXT,'
               +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
               +' FROM CAJA302 A, TGE112 B, TGE105 C, TGE101 D, TGE103 E, TGE102 F, CAJA201 G, TGE201 H'
               +' Where (CASE WHEN A.EC_IE =''E'' THEN A.ECMTOLOC ELSE 0 END )>0'
               +' AND A.EC_PROCE IN (''B'',''1'') AND A.ECESTADO=''C'' AND A.FPAGOID=B.FPAGOID'
               +' AND A.BANCOID = C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID AND A.TMONID = E.TMONID'
               +' AND A.CLAUXID = F.CLAUXID AND A.CPTOID=G.CPTOID AND A.PROV = H.PROV'

               +' UNION ALL'
               +' Select A.ECNOCOMP, A.PROV, 0.00 INGRESOLOC,'
               +' CASE WHEN A.TMONID= '+QuotedStr(DMTE.wTMonLoc)+' THEN ECMTOLOC ELSE ROUND(ECMTOEXT*A.ECTCAMB,2) END EGRESOSOL,'
               +' 0.00 INGRESOEXT,'
               +' CASE WHEN A.TMONID='+QuotedStr(DMTE.wTMonExt)+' THEN ECMTOEXT ELSE 0 END EGRESOEXT, A.ECGLOSA,'
               +' ''Transferencia'' CCNOMB, A.FPAGOID, A.ECNOCHQ,'
               +' 0.00 PAGCHEQUMN, 0.00 PAGCHEQUME, (DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC,  0) ) PAGEFECTMN,'
               +' (DECODE(A.TMONID,'''+DMTE.wTMonExt+''',A.ECMTOEXT, 0)) PAGEFECTME, 0.00 PAGNOTDMN, 0.00 PAGNOTDME,'
               +' '''' FPAGODES, A.ECTCAMB TCAMBIO, A.CLAUXID,'
               +' A.CIAID CIAID, D.CIADES, C.BANCONOM, A.TMONID, E.TMONDES, A.ECFCOMP FECHA,'
               +' '' '' CLAUXDES, A.DOCID, A.ECNODOC NODOC, A.CPTOID,'
               +' B.CTAREMES CUENTAID, ''Transferencia'' CPTODES, ''INGRESO'' TIPO, A.BANCOID,'
               +' (DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0 )) TOTALLOC,'
               +' (DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0 )) TOTALEXT, A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME,'
               +' ''  '' NORDEN, 0.00 SALDOANTMN,'
               +' 0.00 SALDOANTME, ''  '' CTACPTO'
               +' FROM CAJA302 A, TGE106 B, TGE105 C, TGE101 D, TGE103 E'
               +' WHERE A.BANCOID='+QuotedStr(dblcCaja.Text)
               +' AND A.EC_PROCE IN (''0'')'
               +' AND EC_IE = '+QuotedStr('E')
               +' AND ECFCOMP >= '+QuotedStr(dbdtpInicio.Text)
               +' AND ECFCOMP <= '+QuotedStr(dbdtpFin.Text)
               +' And A.BANCOID = B.BANCOID'
               +' And B.CIAID ='+QuotedStr(dblcCia.Text)
               +' And A.CIAID ='+QuotedStr(dblcCia.Text)
               +' And A.BANCOID =  C.BANCOID'
               +' And A.CIAID = D.CIAID'
               +' And A.TMONID = E.TMONID';

       xSQL3 := ' UNION ALL '

               +' SELECT A.ECNOCOMP, A.PROV  PROV,'
               +' 0.00 INGRESOLOC,'
               +' ( DECODE(A.EC_IE ,''E'' ,(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC,0)),0)) EGRESOLOC,'
               +' 0.00 INGRESOEXT,'
               +' ( DECODE(A.EC_IE ,''E'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0)) EGRESOEXT,'
               +' '' '' CCGLOSA, ''TRANSFERENCIA'' CCNOMB, A.FPAGOID, A.ECNOCHQ,'
               +' 0.00 PAGCHEQUMN,'
               +' 0.00 PAGCHEQUME,'
               +' ( DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0) ) PAGEFECTMN,'
               +' ( DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0) ) PAGEFECTME,'
               +' 0.00 PAGNOTDMN,'
               +' 0.00 PAGNOTDME,'
               +' '' '' FPAGODES, A.ECTCAMB TCAMBIO, A.CLAUXID, A.CIAID CIAID, D.CIADES, C.BANCONOM,'
               +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, '' '' CLAUXDES, A.DOCID, A.ECNODOC NODOC '
               +',A.CPTOID, A.CUENTAID, ''Transferencia'' CPTODES, ''EGRESO'' TIPO, A.BANCOID,'
               +' ( DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0 ) ) TOTALLOC,'
               +' ( DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0 ) ) TOTALEXT,'
               +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
               +' FROM CAJA302 A, TGE105 C, TGE101 D, TGE103 E'
      //        +' Where  (CASE WHEN A.EC_IE =''E'' THEN A.ECMTOLOC ELSE 0 END )>0  '
               +' WHERE '
               +' A.EC_PROCE IN (''4'') AND A.ECESTADO=''C'' '
               +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID '
               +' AND A.TMONID=E.TMONID'

               +' UNION ALL '

               +' SELECT A.ECNOCOMP, A.PROV PROV,'
               +' ( DECODE(A.EC_IE ,''I'' ,(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0)) INGRESOLOC,'
               +' 0.00 EGRESOLOC,'
               +' ( DECODE(A.EC_IE ,''I'' ,(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0)) INGRESOEXT,'
               +' 0.00 EGRESOEXT,'
               +' '' '' CCGLOSA, ''TRANSFERENCIA'' AS CCNOMB, A.FPAGOID, A.ECNOCHQ,'
               +' 0.00 PAGCHEQUMN,'
               +' 0.00 PAGCHEQUME,'
               +' (DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC,  0) ) PAGEFECTMN,'
               +' (DECODE(A.TMONID,'''+DMTE.wTMonExt+''',A.ECMTOEXT,  0) ) PAGEFECTME,'
               +' 0.00 PAGNOTDMN,'
               +' 0.00 PAGNOTDME,'
               +' '' '' FPAGODES, A.ECTCAMB TCAMBIO, A.CLAUXID, A.CIAID CIAID, D.CIADES, C.BANCONOM,'
               +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, '' '' CLAUXDES, A.DOCID, A.ECNODOC NODOC,'
               +' A.CPTOID, A.CUENTAID, ''Transferencia'' CPTODES, ''INGRESO'' TIPO, A.BANCOID,'
               +' (DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0 ) ) TOTALLOC,'
               +' (DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0 ) ) TOTALEXT,'
               +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''  '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
               +' FROM CAJA302 A, TGE105 C, TGE101 D, TGE103 E'
               +' Where A.EC_PROCE IN (''7'') AND A.ECESTADO=''C''  '
               +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID'
               +' AND A.TMONID=E.TMONID ) SOLVISTA'
               +' WHERE BANCOID='+QuotedStr(dblcCaja.Text)
               +' AND (FECHA>='''+dbdtpInicio.Text+''' AND FECHA<='''+dbdtpFin.Text
               +''') AND CIAID='+QuotedStr(dblcCia.Text)
  //             +' ORDER BY FECHA, HORA';
               +' ORDER BY FECHA, ECNOCOMP';
      end;

     FConsulta.xfiltroMovLibCaja.UsuarioSQL.Clear;
     FConsulta.xfiltroMovLibCaja.FMant.wTabla := 'VWCAJAMOVCAJA';
     FConsulta.xfiltroMovLibCaja.UsuarioSQL.Add(xSQL1+xSQL2+xSQL3);
     FConsulta.xfiltroMovLibCaja.NewQuery;

  //   Fprincipal.xfiltroMovLibCaja.FMant.cds2.Filtered:=True;

     DMTE.cdsQry3.DisableControls;

     FConsulta.xfiltroMovLibCaja.FMant.cds2.First;

     While not FConsulta.xfiltroMovLibCaja.FMant.cds2.Eof do
      begin

        FConsulta.xfiltroMovLibCaja.FMant.cds2.Edit;
        //Cálculo de Saldo en Soles
        FConsulta.xfiltroMovLibCaja.FMant.cds2.FieldByName('SALDOANTMN').AsFloat := SaldoMN;
        FConsulta.xfiltroMovLibCaja.FMant.cds2.FieldByName('SALDOMN').AsFloat :=
        FConsulta.xfiltroMovLibCaja.FMant.cds2.FieldByName('INGRESOLOC').AsFloat -
        FConsulta.xfiltroMovLibCaja.FMant.cds2.FieldByName('EGRESOLOC').AsFloat +
        SaldoMN;
        SaldoMN := FConsulta.xfiltroMovLibCaja.FMant.cds2.FieldByName('SALDOMN').AsFloat;

        //Cálculo de Saldo en Dólares
        FConsulta.xfiltroMovLibCaja.FMant.cds2.FieldByName('SALDOANTME').AsFloat := SaldoME;
        FConsulta.xfiltroMovLibCaja.FMant.cds2.FieldByName('SALDOME').AsFloat :=
        FConsulta.xfiltroMovLibCaja.FMant.cds2.FieldByName('INGRESOEXT').AsFloat -
        FConsulta.xfiltroMovLibCaja.FMant.cds2.FieldByName('EGRESOEXT').AsFloat +
        SaldoME;
        SaldoME := FConsulta.xfiltroMovLibCaja.FMant.cds2.FieldByName('SALDOME').AsFloat;
        FConsulta.xfiltroMovLibCaja.FMant.cds2.Next;
      end;

     DMTE.cdsQry3.EnableControls;

     if FConsulta.xfiltroMovLibCaja.FMant.cds2.RecordCount>0 then
      begin
       ppDBIngresoCaja.DataSource := FConsulta.xfiltroMovLibCaja.FMant.ds2;
       pprLibroCaja.DataPipeline  := ppDBIngresoCaja;

       pprLibroCaja.Template.FileName := wRutaRpt + '\LibroCajaN.rtm';

       pprLibroCaja.Template.LoadFromFile;
       pplblTDiario.Text := DMTE.DisplayDescrip('prvTGE', 'TGE106', 'CCBCOVOUCH', 'CIAID='''
       +dblcCia.Text+''' AND BANCOID='''+dblcCaja.Text+'''' ,'CCBCOVOUCH');

       pplblPeriodo.Text := IntToStr(Year)+xMes;
       pplblFechIni.Caption  := dbdtpInicio.Text;
       pplblFechIFin.Caption := dbdtpFin.Text;
       pprLibroCaja.Print;
       FConsulta.xfiltroMovLibCaja.FMant.cds2.IndexFieldNames := '';
      end
     else
      ShowMessage('No hay Registros que Mostrar');
  //******************************************************************************
    end;
end;

procedure TFToolMovCaja.dblcdAnoMesKeyPress(Sender: TObject;
  var Key: Char);
begin
   If Key In ['a'..'z', 'A'..'Z'] Then
    Key := #0; 
end;

procedure TFToolMovCaja.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFToolMovCaja.BitBtn1Click(Sender: TObject);
var
   xSQL, cSQL : String;
begin
   If Length(dblcCia.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Compañía', mtInformation, [mbOk], 0);
     dblcCia.SetFocus;
     Exit;
    end;

   if Length(dbdtpInicio.Text) = 0 then
    begin
     Beep;
     MessageDlg('Debe Seleccionar la Fecha de Inicio', mtInformation, [mbOk], 0);
     dbdtpInicio.SetFocus;
     Exit;
    end;

   if Length(dbdtpFin.Text) = 0 then
    begin
     Beep;
     MessageDlg('Debe Seleccionar la Fecha de Término', mtInformation, [mbOk], 0);
     dbdtpFin.SetFocus;
     Exit;
    end;

   If (dbdtpInicio.DateTime) > (dbdtpFin.DateTime) Then
    begin
     Beep;
     MessageDlg('La Fecha de Inicio es Mayor a la Fecha de Fin', mtInformation, [mbOk], 0);
     dbdtpInicio.SetFocus;
     Exit;
    end;

  xSQL:='select A.CIAID, B.CIADES, A.BANCOID, C.BANCONOM, DOCID, CCSERIE, CCNODOC, '
       +  'CCFEMIS, A.TMONID, NCOMTOORI, NCOMTOLOC, NCOMTOEXT, CLIEID, A.CLAUXID, '
       +  'CCNOMB, A.CPTOID, A.CCGLOSA, A.NCOUSER, A.NCOUSER||'' - ''||D.USERNOM USUARIO, '
       +  'CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTMN, '
       +  'CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTME, '
       +  'NCOHREG, NCOFREG, D.USERNOM, '' '' ANOMES, '
       +  'CASE WHEN NCOESTADO=''A'' THEN ''ANULADO'' ELSE '''' END ESTADO, OBSANU, '
       +  '''Desde '+DateToStr(dbdtpInicio.Date)+' Hasta '+DateToStr(dbdtpFin.Date)+''' RANGO '
       +'From CXC303 A, TGE101 B, TGE105 C, TGE006 D '
       +'WHERE A.CIAID='''+dblcCIA.text+''' '
       +  'AND CCFEMIS>='''+DateToStr(dbdtpInicio.Date)+''' and CCFEMIS<='''+DateToStr(dbdtpFin.Date)+''' '
       +  'AND A.CIAID=B.CIAID(+) AND A.BANCOID=C.BANCOID(+) '
       +  'AND A.NCOUSER=D.USERID(+) '
       +'Order by CCNODOC';

  cSQL:='select A.CIAID, B.CIADES, A.BANCOID, C.BANCONOM, DOCID, CCSERIE, CCNODOC, '
       +  'CCFEMIS, A.TMONID, NCOMTOORI, NCOMTOLOC, NCOMTOEXT, CLIEID, A.CLAUXID, '
       +  'CCNOMB, A.CPTOID, A.CCGLOSA, A.NCOUSER, A.NCOUSER||'' - ''||D.USERNOM USUARIO, '
       +  'CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTMN, '
       +  'CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTME, '
       +  'NCOHREG, NCOFREG, D.USERNOM, A.USUANU, FECANU, '' '' ANOMES, '
       +  'CASE WHEN NCOESTADO=''A'' THEN ''ANULADO'' ELSE '''' END ESTADO, OBSANU, '
       +  '''Desde '+DateToStr(dbdtpInicio.Date)+' Hasta '+DateToStr(dbdtpFin.Date)+''' RANGO '
       +'From CXC303 A, TGE101 B, TGE105 C, TGE006 D '
       +'WHERE A.CIAID='''+dblcCIA.text+''' '
       +  'AND CCFEMIS>='''+DateToStr(dbdtpInicio.Date)+''' and CCFEMIS<='''+DateToStr(dbdtpFin.Date)+''' '
       +  'AND NCOESTADO=''A'' '
       +  'AND A.CIAID=B.CIAID(+) AND A.BANCOID=C.BANCOID(+) '
       +  'AND A.USUANU=D.USERID(+) '
       +'Order by CCNODOC';

  DMTE.cdsQry4.Close;
  DMTE.cdsQry4.DataRequest( cSQL );
  DMTE.cdsQry4.Open;

  DMTE.cdsQry5.Close;
  DMTE.cdsQry5.DataRequest( xSQL );
  DMTE.cdsQry5.Open;

  ppdb1.DataSource:=DMTE.dsQry5;
  ppdb2.DataSource:=DMTE.dsQry4;

  ppr1.TEMPLATE.FileName := wRutaRpt + '\IngresosCajaControl.Rtm';

  ppr1.template.LoadFromFile ;

  ppd1.Report:=ppr1;

  if (DMTE.wUsuario='HNORIEGA') or (DMTE.wUsuario='HTUPIA') or (DMTE.wUsuario='ILUCERO') then
     ppd1.ShowModal
  else
     ppr1.Print;

  ppr1.Stop;
  ppd1.Report:=nil;
  ppdb1.DataSource:=nil;
  ppdb2.DataSource:=nil;

end;

end.

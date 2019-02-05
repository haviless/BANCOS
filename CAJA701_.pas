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


interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls,db, DBClient, wwclient,Mant, StdCtrls, Mask, ppCache,
  ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppBands,
  ppCtrls, ppPrnabl, wwdblook, wwdbedit, Wwdbspin, Spin, ppEndUsr, ppVar,
  Grids, Wwdbigrd, Wwdbgrid, StrContainer,ppViewr, ppTypes, ppParameter,
   //INICIO SAR666
   wwExport,  shellapi,
   //FIN SAR666  
  wwdbdatetimepicker;

type
  TFToolRegRet = class(TForm)
    PnlComprobante: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Z2bbtnRegRetenc: TBitBtn;
    Label1: TLabel;
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
    bbtnNumLetras: TBitBtn;
    pprRegRetencion: TppReport;
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
    procedure bbtnNumLetrasClick(Sender: TObject);

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
end;

procedure TFToolRegRet.cbFecRepClick(Sender: TObject);
begin
   // HPC_201103_Caja - Cambiar la fecha de Emisión del reporte
   if cbFecRep.Checked then
      gbFecRep.Enabled:=True
   else
      gbFecRep.Enabled:=False;
   // HPC_201103_Caja - Fin
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
         +    '   Set RETTOTDES=DB2ADMIN.NUM_A_LETRAS('+floattostr(xMontoRet)+')||'' SOLES'' '
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

end.

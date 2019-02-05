unit CajaDM;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : CajaDM
// FORMULARIO               : DMTE
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : El módulo de datos contiene los ClientaDataSet y los
//                            DataSource que se usan en el módulo para interactuar
//                            con los datos de la Base de Datos.
//                            también contiene las funcionalidades genéricas que
//                            pueden ser invocadas desde cualquier formulario
//                            del módulo

// ACTUALIZACIONES:
//HPC_201207_LOG 21/09/2012:   Se implementó el control de versiones
//HPC_201302_CAJA 09/03/2013:  Se modifica la impresión del Voucher por cambios en
//                             la contabilización de los fondos fijos.
//HPC_201306_CAJA 06/07/2013   Se adiciona una funcion para ejecutar programas bpl
//HPC_201401_CAJA 12/02/2014   Envía Mensaje si no hay Periodo Aperturado
//HPC_201601_CAJA 11/01/2016: Se define la variable wTMonLocDes para descripción de la Moneda Local
//                            Se define la variable wTMonExtDes para descripción de la Moneda Extranjera
//HPC_201603_CAJA 19/04/2016  Modifica rutina de grabacion en CNT320
//HPC_201603_CAJA 27/06/2016  Se esta Adicionando la rutina de Generación de Archivo de Retención IGV hacia Sunat
//                            Reordena sangría de procedimiento IMPRIMEVOUCHER
//                            Añade Texto en Voucher de Caja para invitar a ver Retenciones IGV por Web de Derrama
//HPC_201702_CAJA 03/05/2017  Se agrego control de transacciones al generar archivo
//HPC_201705_CAJA Ajustes en la generación de asientos contables por pago de detracciones
//HPC_201706_CAJA Ajustes en la generación de asientos contables por pago de detracciones
//HPC_201801_CAJA Ajustes en la Anulación de los cheques de Filiales se adiciona un cds

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdatsrc, MConnect, wwDBLook, stdctrls, wwDbEdit, Db, DBClient, wwclient,
  wwdbdlg, wwDBDateTimePicker, extctrls, comctrls, RecError, oaContabiliza,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppTypes,
  ppDB, ppDBPipe, ppCtrls, ppBands, ppVar, ppPrnabl, ppViewr, ppEndUsr,
  Variants, IniFiles, Mant, DBGrids, OleServer, ExcelXP,
  ppParameter, ppStrtch, ppSubRpt, winsock, SConnect, oaVariables,
  Excel2000;

type

  structComprobante = Record
    CIAID,
    ECANOMM,
    TDIARID,
    ECNOCOMP,
    EC_PROCE,
    TDIARIO2,
    ECNOCOMP2 : String;
  end;

  structDocIng = Record
    CIAID,
    CCTREC,
    DOCID,
    CCSERIE,
    CCNODOC : String;
  end;

  structOPago = Record
    CIAID,
    OPAGO : String;
  end;

  structChq = Record
    ppFileName ,
    ppGiradoA  ,
    ppImporte  ,
    ppMontoLetras ,
    ppDia ,
    ppMes ,
    ppAno,ppRUC : String ;
  end;

  structSaldosAux = Record
    CIAID   ,
    CLAUXID ,
    AUXID   ,
    MONTOMN ,
    MONTOME ,
    MTOSLOC ,
    MTOSEXT : String    ;
    FECHA   : TDateTime ;
  end;

  TControlFoco = Class(TObject)

  private
     ctrlLookDlg : TwwDBLookUpComboDlg;
     ctrlLookCbo : TwwDBLookUpCombo   ;
     ctrlEdit    : TwwDBEdit          ;
     ctrlDate    : TwwDBDateTimePicker;
     Evento      : TNotifyEvent       ;
  public
     procedure QuitarExits(Forma : TForm);
     procedure PonerExits;
  end;

  TDMTE = class(TDataModule)
   cdsCia: TwwClientDataSet;
   dsCia: TwwDataSource;
   cdsTDiario: TwwClientDataSet;
   dsTDiario: TwwDataSource;
   cdsTDoc: TwwClientDataSet;
   dsTDoc: TwwDataSource;
   cdsTMon: TwwClientDataSet;
   cdsFormPago: TwwClientDataSet;
   cdsBanco: TwwClientDataSet;
   dsTMon: TwwDataSource;
   dsFormPago: TwwDataSource;
   dsBanco: TwwDataSource;
   cdsCCBco: TwwClientDataSet;
   dsCCBco: TwwDataSource;
   dsEgrCaja: TwwDataSource;
   cdsRegCxP: TwwClientDataSet;
   dsRegCxP: TwwDataSource;
   cdsQry: TwwClientDataSet;
   dsQry: TwwDataSource;
   cdsCnpEgr: TwwClientDataSet;
   dsCnpEgr: TwwDataSource;
   cdsCCosto: TwwClientDataSet;
   dsCCosto: TwwDataSource;
   cdsCntCaja: TwwClientDataSet;
   dsCntCaja: TwwDataSource;
   cdsMovCxP: TwwClientDataSet;
   dsMovCxP: TwwDataSource;
   cdsCanjeCxP: TwwClientDataSet;
   dsCanjeCxP: TwwDataSource;
   cdsDetCanjeCxP: TwwClientDataSet;
   dsDetCanjeCxP: TwwDataSource;
   dsPagoCxP: TwwDataSource;
   cdsDocPago: TwwClientDataSet;
   dsDocPago: TwwDataSource;
   cdsCCBco2: TwwClientDataSet;
   dsCCBco2: TwwDataSource;
   cdsClase: TwwClientDataSet;
   dsClase: TwwDataSource;
   cdsMovCxC: TwwClientDataSet;
   dsMovCxC: TwwDataSource;
   cdsCobraCxC: TwwClientDataSet;
   cdsCanjeCxC: TwwClientDataSet;
   dsCobraCxC: TwwDataSource;
   dsCanjeCxC: TwwDataSource;
   cdsDetCanjeCxC: TwwClientDataSet;
   dsDetCanjeCxC: TwwDataSource;
   cdsTranCob: TwwClientDataSet;
   dsTranCob: TwwDataSource;
   cdsEmpleado: TwwClientDataSet;
   dsEmpleado: TwwDataSource;
   cdsNivel: TwwClientDataSet;
   dsNivel: TwwDataSource;
   dsMovCNT1: TwwDataSource;
   cdsSaldoTlfnGrab: TwwClientDataSet;
   dsSaldoTlfnGrab: TwwDataSource;
   cdsRec: TwwClientDataSet;
   cdsBancoEgr: TwwClientDataSet;
   cdsEgrCajaX: TwwClientDataSet;
   dsEgrcajaX: TwwDataSource;
   cdsDescrip: TwwClientDataSet;
   dsDescrip: TwwDataSource;
   cdsEquiv: TwwClientDataSet;
   dsEquiv: TwwDataSource;
   cdsResponsable: TwwClientDataSet;
	dsResponsable: TwwDataSource;
   cdsClaseAux: TwwClientDataSet;
   cdsAux: TwwClientDataSet;
   cdsQry2: TwwClientDataSet;
   dsQry2: TwwDataSource;
   cdsUsuarios: TwwClientDataSet;
   cdsMGrupo: TwwClientDataSet;
   cdsGrupos: TwwClientDataSet;
   cdsAcceso: TwwClientDataSet;
   dsUsuarios: TwwDataSource;
   dsMGrupo: TwwDataSource;
   dsGrupos: TwwDataSource;
   dsAcceso: TwwDataSource;
   cdsPagoCxP: TwwClientDataSet;
   cdsTransBCO: TwwClientDataSet;
   dsTransBCO: TwwDataSource;
   cdsExtracBCO: TwwClientDataSet;
   dsExtracBCO: TwwDataSource;
   dsDetFPago: TwwDataSource;
   dsRec: TwwDataSource;
   cdsEgrCaja2: TwwClientDataSet;
   dsEgrCaja2: TwwDataSource;
   cdsRegCxC: TwwClientDataSet;
   dsRegCxC: TwwDataSource;
   cdsDetFPago: TwwClientDataSet;
   cdsCanjeCxCDoc: TwwClientDataSet;
   dsCanjeCxCDoc: TwwDataSource;
   cdsFEfec: TwwClientDataSet;
   cdsIngDocs: TwwClientDataSet;
	dsIngDocs: TwwDataSource;
   cdsTrans: TwwClientDataSet;
   dsTrans: TwwDataSource;
   cds1: TwwClientDataSet;
   cdsCuentas: TwwClientDataSet;
   dsCuentas: TwwDataSource;
   cdsECRepo: TwwClientDataSet;
   dsECRepo: TwwDataSource;
   cdsMovCNT1: TwwClientDataSet;
   cdsSQL: TwwClientDataSet;
   cdsEgrCaja: TwwClientDataSet;
   cdsTdiario1: TwwClientDataSet;
   dsTdiario1: TwwDataSource;
   cdsProv: TwwClientDataSet;
   dsProv: TwwDataSource;
   dsSQL: TwwDataSource;
   cdsSaldos: TwwClientDataSet;
   dsSaldos: TwwDataSource;
   cdsQry3: TwwClientDataSet;
   dsQry3: TwwDataSource;
   cdsProvCta: TwwClientDataSet;
   dsProvCta: TwwDataSource;
   cdsCLiqCob1: TwwClientDataSet;
   dsCLiqCob1: TwwDataSource;
   dsCNT311: TwwDataSource;
   cdsCNT311: TwwClientDataSet;
   cdsResultSet: TwwClientDataSet;
   cdsLiq305: TwwClientDataSet;
   dsLiq305: TwwDataSource;
   ppdbVoucher: TppDBPipeline;
   cdsSocRec: TwwClientDataSet;
   dsSocRec: TwwDataSource;
 	 cdsMovSocRec: TwwClientDataSet;
   dsMovSocRec: TwwDataSource;
	 cdsSocDocPag: TwwClientDataSet;
	 dsSocDocPag: TwwDataSource;
	 cdsCASocio: TwwClientDataSet;
	 dsCASocio: TwwDataSource;
   cdsRetencion: TwwClientDataSet;
   dsRetencion: TwwDataSource;
   cdsConsulta: TwwClientDataSet;
    ppd1: TppDesigner;
   cdsSaldo: TwwClientDataSet;
   dsSaldo: TwwDataSource;
   cdsReporte: TwwClientDataSet;
   dsReporte: TwwDataSource;
    cdsQry4: TwwClientDataSet;
    dsQry4: TwwDataSource;
    cdsReglas: TwwClientDataSet;
    dsReglas: TwwDataSource;
    cdsQry1: TwwClientDataSet;
    dsQry1: TwwDataSource;
    cdsQry5: TwwClientDataSet;
    dsQry5: TwwDataSource;
    cdsDocsCont: TwwClientDataSet;
    dsDocsCont: TwwDataSource;
    cdsDocsContWork: TwwClientDataSet;
    dsDocsContWork: TwwDataSource;
    cdsUser: TwwClientDataSet;
    dsUser: TwwDataSource;
    cdsAsocia: TwwClientDataSet;
    dsAsocia: TwwDataSource;
    cdsCptos: TwwClientDataSet;
    dsCptos: TwwDataSource;
    ExcelApp: TExcelApplication;
    ExcelBook: TExcelWorkbook;
    WS: TExcelWorksheet;
    cdsTarjeta: TwwClientDataSet;
    cdsQry6: TwwClientDataSet;
    dsQry6: TwwDataSource;
    cdsQry7: TwwClientDataSet;
    dsQry7: TwwDataSource;
    cdsReporteDet: TwwClientDataSet;
    dsReporteDet: TwwDataSource;
    ppdbDet: TppDBPipeline;
    pprVoucher: TppReport;
    ppParameterList1: TppParameterList;
    DCOM1: TSocketConnection;
    cdsTarCreTransf: TwwClientDataSet;
    dsTarCreTransf: TwwDataSource;
    cdsCabTranf: TwwClientDataSet;
    dsCabTranf: TwwDataSource;
    cdsCreCNT: TwwClientDataSet;
    dsCreCNT: TwwDataSource;
    cdsVerificaOPC: TwwClientDataSet;
    cdsOPago: TwwClientDataSet;
    dsOPago: TwwDataSource;
    cdsDetallePres: TwwClientDataSet;
    dsDetallePres: TwwDataSource;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppShape1: TppShape;
    ppShape5: TppShape;
    ppShape3: TppShape;
    ppLabel10: TppLabel;
    ppLabel23: TppLabel;
    ppLabel14: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel38: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel43: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel44: TppLabel;
    ppLabel25: TppLabel;
    ppLabel41: TppLabel;
    ppLabel20: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppLabel21: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppLabel9: TppLabel;
    pplblFecha: TppLabel;
    pplblPeriodo: TppLabel;
    pplblTcam: TppLabel;
    pplblDiario: TppLabel;
    pplblComp: TppLabel;
    pplblLote: TppLabel;
    pplblTmon: TppLabel;
    pplblEstado: TppLabel;
    ppLabel12: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    pplblglosa: TppLabel;
    lblperiodo: TppLabel;
    ppDBText12: TppDBText;
    ppdbtComp: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText3: TppDBText;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    pplBanco: TppLabel;
    pplProv: TppLabel;
    pplGirado: TppLabel;
    pplCtaCte: TppLabel;
    pplChq: TppLabel;
    pplImporte: TppLabel;
    ppDBText5: TppDBText;
    ppDBText11: TppDBText;
    ppLabel8: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText9: TppDBText;
    ppDBText25: TppDBText;
    ppDBText2: TppDBText;
    ppDBText10: TppDBText;
    ppLine4: TppLine;
    ppDBText1: TppDBText;
    ppLine2: TppLine;
    ppSummaryBand3: TppSummaryBand;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppShape2: TppShape;
    ppLabel18: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppLabel5: TppLabel;
    ppDBText99: TppDBText;
    pplCmp: TppLabel;
    ppLabel3: TppLabel;
    ppLabel22: TppLabel;
    ppLabel13: TppLabel;
    ppLabel42: TppLabel;
    ppLabel45: TppLabel;
    pplModulo: TppLabel;
    pplLetras: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel54: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel55: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel71: TppLabel;
    ppLabel59: TppLabel;
    ppDBText39: TppDBText;
    ppDBText24: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLabel11: TppLabel;
    ppLabel6: TppLabel;
    ppLabel24: TppLabel;
    ppLabel7: TppLabel;
    ppLabel19: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel66: TppLabel;
    ppLabel69: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText23: TppDBText;
    ppDBText26: TppDBText;
    ppLabel60: TppLabel;
    ppDBText13: TppDBText;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLabel67: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel68: TppLabel;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    ppSubReport3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand4: TppDetailBand;
    ppSummaryBand4: TppSummaryBand;
    ppSummaryBand2: TppSummaryBand;
    pplDet1: TppLabel;
    pplDet2: TppLabel;
    cdsCiaFilial: TwwClientDataSet;
    dsCiaFilial: TwwDataSource;
    cdsCaja304: TwwClientDataSet;
    dsCaja304: TwwDataSource;
    dsAux: TDataSource;
// Inicio HPC_201801_CAJA
// Se adiciona un Cds en el módulo de Datos
    cdsQry8: TwwClientDataSet;
    dsQry8: TwwDataSource;
// Fin HPC_201801_CAJA
	procedure cdsCanjeCxPCCPTCCJEChange(Sender: TField);
	procedure cdsRegCobrosCalcFields(DataSet: TDataSet);
	procedure cdsCntCajaCalcFields(DataSet: TDataSet);
	procedure DataModuleCreate(Sender: TObject);
	procedure cdsMovCxCFilter(DataSet: TDataSet; var Accept: Boolean);
	procedure cdsRegCxPAfterOpen(DataSet: TDataSet);
	procedure pprVoucherPreviewFormCreate(Sender: TObject);
   procedure cdsCntCajaReconcileError(DataSet: TCustomClientDataSet;
     E: EReconcileError; UpdateKind: TUpdateKind;
     var Action: TReconcileAction);
    procedure cdsEgrCajaEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure cdsEgrCajaPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure cdsEgrCajaXReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure cdsIngDocsReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure HojaExcel(Tit: string; TDs: TDataSource; TDb: TDBGrid);
    procedure FormatosCeldas(N: Integer ; TDs: TDataSource);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ppGroupFooterBand3BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand7BeforePrint(Sender: TObject);
    procedure ppTitleBand2BeforePrint(Sender: TObject);

	private
		{ Private declarations }
    FormatCel: array of OleVariant;
		pnlConta : TPanel ;
		pbConta  : tprogressbar ;
		wDBFunc01, wDBFunc02 : String;
		Function RecuperaDescripcionAno(xAno:string):string;
		Function RecuperaDescripcionCuenta(xCia,xCuenta : String):String ;

   public
		{ Public declarations }

    // vhndema
    cIP, wOfiId, widepc, ideconex, fechorcon :String;
    cFilterCiaUser    : String;
    cFilterOrigenUser : String;
    cFilterCuentaUser : String;
    cFilterUsuarioUser   : String;
    cFilterUsuarioUserEgr: String;
    // end vhndema

     //rmz
     //xSigueGrab : boolean;
     //rmz

     wAdmin       : String;
		 wUsuario     : String;
		 wGrupo       : String;
     sClose, wSRV : String;
		 wRutaCNT : string;
     wVRN_CptoCia: String;
     xSRV_RUTA : string;
     wFormatFecha: string;
     wReplacCeros: string;
     wRepFecServi: string;
		 wRepFuncDate: string;
		 wRepHorServi: string;

		 SRV_E   : String;
		 SRV_D   : String;
		 SRV_V   : String;
		 wRptCia : String;

		 xFlagP : bool; // se usara en pagos a proveedores, egreso de caja y en
										 // el reporte de emision de cheque(caja214), se actualiza
										 // en Caja001
		 wTMonLoc , wTMonExt ,
		 wTipoCambioUsar ,
		 wTipoDocTransferencia ,
		 wTCCompra ,
		 wTCVenta : String;
		 wTipoDif : String;
		 wModo           ,
     wModulo         ,
     wGrupoTmp       ,
     wObjetoDescr    ,
     wObjetoForma    ,
     wObjetoNombr    ,
     wObjetoDesPr    ,
     wCHEQUE         ,
  	 wTARJETA        ,
     wDeposito       ,
	   wClaseAuxClie   ,
     wClaseAuxProv   ,
	   wEFECTIVO       : String;

     // Para Retenciones
     xCptoRet  : String;
     xCtaRet   : String;

     xTotRetMN  : Double;
     xTotRetME  : Double;
     xTotPagMN  : Double;
     xTotPagME  : Double;

     xTRetLoc   : Double;
     xTRetExt   : Double;
     xRetencionL: Double;
     xRetencionE: Double;
     pbMtoPagTotLoc,pbMtoPagTotExt,pbMtoRetLoc,pbMtoRetExt:double;
     wComponente  : TControl;
     wFechaUCierre: TDatetime;
     FVoucher     : TFoaConta;
     xTasaCan, xTasaPorce, xTasaMonto : Double;
     xTasaFec : TDateTime;
     sLet:string;

     wCodigoError : Integer;

     vRN_GLOSADET : string; //SI ES 'S' SE RESPETA LA GLOSA DEL DETALLE
                            //SI ES 'N' SE RESPETA LA GLOSA DE LA CABECERA

     wTipoAdicion : String; // 'xFiltro' = adicion a través del Filtro, 'Directo' = adición directa

 // Inicio HPC_201601_CAJA
 // Se define la variable wTMonLocDes para descripción de la Moneda Local
 // Se define la variable wTMonExtDes para descripción de la Moneda Extranjera
    wTMonLocDes : String;
    wTMonExtDes : String;
 // Fin HPC_201601_CAJA


 // Inicio HPC_201605_CAJA
    wsSerieRetIGV, wsNumRetIGV : String;
 // Fin HPC_201605_CAJA


     function  OperClientDataSet( ClientDataSet : TwwClientDataSet;
                                     Expression, Condicion : String  ) : Double;
     procedure ControlFocoEntrada (var control : TCustomEdit;Evento : TNotifyEvent ) ;
     procedure ControlFocoSalida (Forma : TForm ;var  control : TCustomEdit;Evento : TNotifyEvent ) ;

     procedure xxExit( dblcX:TwwDBCustomLookUpCombo; dbeX : TCustomEDit ; A : Array of TwinControl ;
                      M :  String ; Genero : String = '0';Obligatorio : Boolean = True );
     procedure xxExit2( dblcX:TwwDBCustomLookUpCombo; dbeX : TCustomEDit ; A : Array of TwinControl ;
                      M :  String ; Genero : String = '0';Obligatorio : Boolean = True );
     function  RecuperarDatos(xTabla,xCampos,xWhere : String): Boolean ;
     Function  DisplayDescripLocal(cds : TwwClientdataset ;xCodigo,xDato,xMostrar : String) : String;

     function NombreMes(wwMes:string):String;
     function NombreAnoMes(wwAnoMes:string):String;

     function  DisplayData(wPrv,wSQL,wWhere,wResult:string):string ;
     function  DisplayDescrip(wPrv,wTabla,wCampos,wWhere,wResult:string):string ;
     function  UltimoNum(wPrv,wTabla,wCampo,wWhere:string):string ;
	   function  StrZero(wNumero:String;wLargo:Integer):string ;
     function  FRound(xReal:double;xEnteros,xDecimal:Integer):double ;
     function  FRoundWMC (xReal:double ;xDecimal:Integer = 2):double ;
     function  BuscaUltFecha(xPrv,xTabla,xCampo,xWhere:String): TDate ;
     function  RecuperarTipoCambio(xFecha : TDateTime ): String ;
     function  FieldNoNulo(xCampo : TField ) : String ;
	   function  NumeroNoNulo(xCampo : TField ) : double ;
     procedure ASignaTipoDiario(dblcX:TwwDBCustomLookUpCombo; Forma: TForm ) ;
     function  EquivFPago(xFAGOID , xBANCOID : STRING): String ;
     procedure ActSdoTlfn ( xCia,xBco, xCtaCte, xMonto : String; xFecha : TDateTime;
                           EC_IE : String='E'; xOper : String='+' );

     procedure ActSdoCaja ( xTMONID,xBco , xMonto,xFecha  : String ;
                            EC_IE : String = 'E'; xOper : string ='+' ) ;
     procedure ActSdoMen  ( xBco , xCtaCte , xMonto : String ; xFecha : TDateTime ; EC_IE : String = 'E' ) ;

     function  Encripta(wPalabra:String): String ;
     function  DesEncripta(wPalabra:String): String ;
     procedure AccesosUsuarios(xxModulo,xxUsuario,xxTipo,xxForma:String) ;
     procedure AccesosUsuariosR(xxModulo,xxUsuario,xxTipo:String; xxForma:TForm) ;
     function  BuscaObjeto( const xNombre:String; xForm:TForm):TControl ;

     procedure ActSaldosAux(DatosAux : structSaldosAux) ;
     function  RecuperaCorrelativo (xbcoId,xCCBcoId : String ) : String ;
     procedure ActualizaCDS(cdsO, cdsD: TwwClientDataset);
     procedure RecuperaCierre(var xFecha: TDateTime; xFrecu: Integer);
     procedure abreCuentas(xCia : String) ;
     function BuscaFecha(PTable,PDescrip,PKey: String; PVal:TDateTime ): Boolean;
     procedure Filtracds( xxCds:TwwClientDataSet; xxSQL:String  ) ;

     procedure AplicaDatos(wCDS: TClientDataSet; wNomArch : String);
	  procedure ControlTran( wControlError : Integer; wCDS: TClientDataSet; wNomArch : String );

		 procedure DescripIngDocs(const xCIAID, xCCTREC, xDOCID, xCCSERIE, xCCNODOC: String);
		 procedure DescripPagoVaProv(const xCIAID, xECANOMM, xTDIARID, xECNOCOMP: String);
     procedure DescripTrans(const xCIAID, xECANOMM, xTDIARID, xECNOCOMP, xTDIARID2, xECNOCOMP2: String);
		 procedure DescripOPago(const xCIAID, xOPAGO: string);
     procedure SetFlagPagoProv(var xCIAID, xOPAGO: string; xFlag: String = 'X');
     procedure RecUltTipoCambio(var xFecha: string);
     procedure SQLAdicEgresos(const xCIAID, xECANOMM, xTDIARID, xECNOCOMP, xError: string);
     procedure SQLSelect(const xTabla, xCampos, xWhere: WideString);
     procedure ActSdoAuxiliar(const xCIAID, xANO, xMES, xCLAUXID, xAUXID, MONTOMN, MONTOME, MTOSLOC, MTOSEXT, xOper: String);
     Function  MesCerrado(xMes,xAno,xCiaid : String) : Boolean;
     procedure SaldosAuxiliar( xxCia,xxAnoMes,xxClAux,xxAux,xxSigno:String;
                                    xxImpMN,xxImpME: Double; xxTMonid : String );
     function  CalculaRetencionIGV:Boolean;
     function  CalculaRetencionIGVGlobal:Boolean;
     function  CalculaRetencionIGV_SinNC:Boolean;
     procedure CalculaRetencionYMonto(xxCia,xxTDiar,xxAnomes,xxNocomp:string);
     procedure InsertaRetencionIGV;
     procedure InsertaEnCNT320;
     procedure GrabaNumeroRetencion;
     function UltimoRegistro( xAutoNum,xCia,xTDiario,xAno,xMes:String ):String;
     function GrabaUltimoRegistro( xAutoNum,xCia,xTDiario,xAno,xMes:String; xNumUsu:Integer ):String;
     procedure AnulaRetencion;

     function UltimoDiaMes( xxAno, xxMes : String) : TDate;
     function VerificaDocumentosEstadoInicial( xCia, xBanco, xCCBco : String; xFecFin : TDate  ) : Boolean;
     procedure CalculaSaldo( xCia, xBanco, xCCBco : String; xFecFin : TDate;  Var nSaldoMN, nSaldoME : Double );

     function  BuscaCierre(wwCia,wwBanco,wwCCBanco,wwAnoMM: String ) : Boolean;
     function  BuscaFechaCierre(wwCia, wwBanco, wwCCBanco : String;
                               wwFecha: TDate ): Boolean;
     procedure InsertaLETRASEnCNT320;
     procedure ActSaldosClientes(DatosAux: structSaldosAux);
     procedure AsientosAdicionales( cRegAdicional : String );
     procedure ActSaldosBancos(xCia, xTMonid, xBco, xCuenta, xMonto, xTipoIE, xFecha: String);
     procedure ActSaldosCaja(xCia, xTMonid, xBco, xMonto, xTipoIE, xFecha: String);
     function LaCuentaSeRegistraSoloEnME(xxCia:string;xxCpto:string='';xxCuenta:string=''):boolean;
     procedure FiltraTabla( xxCds:TwwClientDataSet; xxArchivo,xxCampo:String  );
     procedure DisminuyeForma(Sender: TObject);
     procedure ActualizaFiltro(wwFiltro:TMant;wwCdsLee:TwwClientDataSet;wwAccion:String);
     function ObtenerIpdeNetbios(Host: string): string;
     function ComputerName: string;
     function AccesosModulo :  Boolean;

     // vhn
     function FiltraCiaPorUsuario( cdsCiaUser :TwwClientDataSet ) : String;
     function FiltraOrigenPorUsuario_Cia( xxArchivo, xxCampo  : String ) : String;
     function FiltraUsuarioPorUsuario_Cia( xxArchivo, xxCampo : String ) : String;

     function VerificaAccesoOpcion( s_Objeto_sss : String ) : Boolean;
     function fg_VerificaVersion(wgVersion :String): Boolean;
   //INICIO HPC_201306_CAJA
     function ejecutaPrograma2( cPaquete, cPrograma : String ):String;
   //FINAL HPC_201306_CAJA

   // Inicio HPC_201603_CAJA
     Procedure InsertaEnCNT320Global;
   // Fin HPC_201603_CAJA
  end;

  TFormaPckProc = function:String; stdcall;

  function DiaAperturado(xCia:string; xFecha : TDate; xCaja : String) : bool;
  procedure RecalculoSaldos(xCia:string; xFecha : TDate; xCaja : String);

  procedure cdsPost(xxCds:TwwClientDataSet);
  procedure ActualizaCNT311(pCiaid,pTdiarid,pComprob,pperiodo : String);

var
   DMTE: TDMTE;
   wBD : String;
   ErrorCount:Integer;
   xBorrar:string;
   xFlagCal : Boolean;
   wRutaRpt : string;
   wAmedida : String;
   xNumLinRet : Integer; // numero de lineas máximas en ceertificado de retencion IGV
   xSigueGrab : boolean;
// INICIO HPC_201603_CAJA
   wIP_Impresora : String;
   wId_Rutadest  : String;
   xTienda  : String;
   xPVenta  : String;
   xDisenoImp : Boolean;
// FIN HPC_201603_CAJA
   procedure ImprimeVoucher( xTabCNT, cCia, cAAMM, cTD, cCMP, cGlosa  : String );
   function DateS: TDatetime;

implementation

{$R *.DFM}

uses cajaUtil, CAJA020;


function TDMTE.VerificaAccesoOpcion( s_Objeto_sss : String ) : Boolean;
var
   sAccesosTmp : String;
   sSQL : String;
begin
   TRY
      sSQL:='SELECT A.USERID, A.GRUPOID, B.GRUPOID, B.MODULOID, B.OBJETO, TIPO, DESCRIPTIVO '
           +'FROM TGE007 A, TGE001 B '
           +'where USERID='''+wUsuario+''' '
           + ' and A.GRUPOID=B.GRUPOID(+) and OBJETO='''+s_Objeto_sss+'''';
      cdsVerificaOPC.Close;
      cdsVerificaOPC.DataRequest( sSQL );
      cdsVerificaOPC.Open;

      if cdsVerificaOPC.recordcount>0 then
      begin
         ShowMessage('No tiene ACCESO a la OPCION');
         Result:=False;
         Exit;
      end;
   EXCEPT
   END;
   Result:=True;;
end;


function TDMTE.FiltraUsuarioPorUsuario_Cia( xxArchivo, xxCampo : String ) : String;
var
   xFiltro : String;
begin
   cdsAcceso.Filtered := False;
   cdsAcceso.Filter   := '';
   cdsAcceso.Filter   := 'NTABLA='+''''+xxArchivo+'''';
   cdsAcceso.Filtered := True;

   xFiltro := '';
   cdsAcceso.First;
   while not cdsAcceso.Eof do begin
      if cdsAcceso.FieldByName('CIAID').AsString<>'' then
      begin
         If Length(xFiltro)=0 then
            xFiltro:='(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +   xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')'
         else
            xFiltro:=xFiltro+' OR '
                    +'(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')';
      end;
      cdsAcceso.Next;
   end;

   if xFiltro<>'' then
      xFiltro:=' ( '+ xFiltro+ ' or ('+cFilterCiaUser+' and '+xxCampo+'='''+wUsuario+''')'+ ' ) '
   else
      xFiltro:=' ( '+'('+cFilterCiaUser+' and '+xxCampo+'='''+wUsuario+''')'+ ' ) ';

   if (wAdmin='V') or (wAdmin='P') or (wAdmin='G') then
      xFiltro:=' ( '+xxCampo+' is not NULL ) ';


   Result:=xFiltro;
end;


function TDMTE.FiltraOrigenPorUsuario_Cia( xxArchivo, xxCampo : String ) : String;
var
   xFiltro : String;
   xCiaFil : String;
begin
   xCiaFil:=cFilterCiaUser;

   cdsAcceso.Filtered := False;
   cdsAcceso.Filter   := '';
   cdsAcceso.Filter   := 'NTABLA='+''''+xxArchivo+'''';
   cdsAcceso.Filtered := True;

   xFiltro := '';
   cdsAcceso.First;
   while not cdsAcceso.Eof do begin
      if cdsAcceso.FieldByName('CIAID').AsString<>'' then
      begin
         If Length(xFiltro)=0 then
            xFiltro:='(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +   xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')'
         else
            xFiltro:=xFiltro+' OR '
                    +'(CIAID='''+cdsAcceso.FieldByName('CIAID').AsString+''' AND '
                    +xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''')';

         if xCiaFil<>'' then
         begin
            xCiaFil:=StringReplace(xCiaFil,''''+cdsAcceso.FieldByName('CIAID').AsString+''',','',[rfReplaceAll]);
            xCiaFil:=StringReplace(xCiaFil,''''+cdsAcceso.FieldByName('CIAID').AsString+'''' ,'',[rfReplaceAll]);
         end;

      end;
      cdsAcceso.Next;
   end;

   if xCiaFil=' CIAID IN (  ) ' then
      xCiaFil:=''
   else
      xCiaFil:=' or '+xCiaFil;

   if xFiltro<>'' then
      xFiltro:=' ( '+ xFiltro + xCiaFil +' ) ';

   Result:=xFiltro;
end;


function TDMTE.FiltraCiaPorUsuario( cdsCiaUser :TwwClientDataSet ) : String;
var
   cFilter : String;
begin
   cFilter:='';
   cdsCiaUser.First;
   while not cdsCiaUser.Eof do
   begin
      if cFilter='' then
         cFilter:=' CIAID IN ( '''+cdsCiaUser.FieldByName('CIAID').AsString+''''
      else
         cFilter:=cFilter+', '''+cdsCiaUser.FieldByName('CIAID').AsString+'''';

      cdsCiaUser.Next;
   end;

   if cFilter<>'' then
      cFilter:=cFilter+' ) ';

   Result:=cFilter;
end;


function TDMTE.DisplayDescrip(wPrv,wTabla,wCampos,wWhere,wResult:string):string;
var
   xSQL : string;
begin
   result:='';
   xSQL := 'SELECT '+wCampos+' FROM '+wTabla;
   if length(wWhere)>0 then xSQL:=xSQL+' WHERE '+wWhere;
   cdsQry.Close;
   cdsQry.ProviderName:=wPrv;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   result:=cdsQry.FieldByName(wResult).AsString;
end;


function TDMTE.DisplayData(wPrv,wSQL,wWhere,wResult:string):string;
var
	 xSQL : string;
begin
   result:='N';
   xSQL := wSQL;
   if length(wWhere)>0 then xSQL:=xSQL+' WHERE '+wWhere;
   cdsQry.Close;
   cdsQry.ProviderName:=wPrv;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   if cdsQry.recordcount<>0 then
      result:='S';
end;


function TDMTE.UltimoNum(wPrv,wTabla,wCampo,wWhere:string):string;
var
   xSQL : string;
begin
   xSQL := 'SELECT MAX('+wCampo+') ULTNUM FROM '+wTabla;
   if length(wWhere)>0 then xSQL:=xSQL+' WHERE '+wWhere;
   cdsQry.Close;
   cdsQry.ProviderName:=wPrv;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If (cdsQry.FieldbyName('ULTNUM').value = null) or (cdsQry.FieldbyName('ULTNUM').AsString = '') then
     result:='1'
   else result:=inttostr(cdsQry.FieldbyName('ULTNUM').asInteger+1);
end;

function TDMTE.StrZero(wNumero:String;wLargo:Integer):string;
var
   s : string;
begin
   s := '';
   s := StringOfChar( '0' ,wLargo ) ;
   s := s+trim(wNumero);
   result:= copy(s,length(s)-(wLargo-1),wLargo);
end;

function TDMTE.BuscaUltFecha(xPrv,xTabla,xCampo,xWhere:String): TDate;
var
   xSQL : string;

begin
   xSQL:= 'SELECT MAX('+xCampo+') MAXIMO FROM '+xTabla;
   if length(xWhere)>0 then xSQL:=xSQL+' WHERE '+xWhere;

   cdsQry.Close;
   cdsQry.ProviderName:=xPrv;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;

   if cdsQry.FieldByName('MAXIMO').Value=null
   then result:= encodeDate(1999,1,1)
   else result:= cdsQry.FieldByName('MAXIMO').asDateTime;
end;

procedure TDMTE.cdsCanjeCxPCCPTCCJEChange(Sender: TField);
begin
   If wTMonLoc = cdsCanjeCxP.fieldbyName('TMONID').asString then begin
      cdsCanjeCxP.fieldbyName('CCPMOLOC').asFloat := FRound( cdsCanjeCxP.fieldbyName('CCPMOLOC').asFloat,15,2);
      If cdsCanjeCxP.fieldbyName('CPSALLOC').asFloat=0 then begin
         cdsCanjeCxP.fieldbyName('CPSALLOC').asFloat := FRound( cdsCanjeCxP.fieldbyName('CCPMOLOC').asFloat,15,2);
         cdsCanjeCxP.fieldbyName('CPSALEXT').asFloat := FRound( cdsCanjeCxP.fieldbyName('CCPMOLOC').asFloat/cdsCanjeCxP.fieldbyName('CCPTCCje').asFloat,15,2 );
         end
      else begin
         cdsCanjeCxP.fieldbyName('CPSALLOC').asFloat := FRound( cdsCanjeCxP.fieldbyName('CPSALLOC').asFloat,15,2);
         cdsCanjeCxP.fieldbyName('CPSALEXT').asFloat := FRound( cdsCanjeCxP.fieldbyName('CPSALLOC').asFloat/cdsCanjeCxP.fieldbyName('CCPTCCje').asFloat,15,2 );
      end;
      end
   else
   begin
      cdsCanjeCxP.fieldbyName('CCPMOEXT').asFloat := FRound( cdsCanjeCxP.fieldbyName('CCPMOEXT').asFloat,15,2);
      If cdsCanjeCxP.fieldbyName('CPSALEXT').asFloat=0 then begin
         cdsCanjeCxP.fieldbyName('CPSALLOC').asFloat := FRound( cdsCanjeCxP.fieldbyName('CCPMOEXT').asFloat*cdsCanjeCxP.fieldbyName('CCPTCCje').asFloat,15,2 );
         cdsCanjeCxP.fieldbyName('CPSALEXT').asFloat := FRound( cdsCanjeCxP.fieldbyName('CCPMOEXT').asFloat,15,2);
         end
      else begin
         cdsCanjeCxP.fieldbyName('CPSALLOC').asFloat := FRound( cdsCanjeCxP.fieldbyName('CPSALEXT').asFloat*cdsCanjeCxP.fieldbyName('CCPTCCje').asFloat,15,2 );
         cdsCanjeCxP.fieldbyName('CPSALEXT').asFloat := FRound( cdsCanjeCxP.fieldbyName('CPSALEXT').asFloat,15,2);
      end;
   end;
end;

procedure TDMTE.cdsRegCobrosCalcFields(DataSet: TDataSet);
begin
  if Dataset.FieldByName('TMONID').AsString = '0' then
     Dataset.FieldByName('TipoMoneda').AsString:='LOCAL'
	else
     Dataset.FieldByName('TipoMoneda').AsString :='EXT';
end;

procedure TDMTE.cdsCntCajaCalcFields(DataSet: TDataSet);
begin
   if cdsCntCaja.fieldbyName('DCDH').asString = 'D'
   then cdsCntCaja.fieldbyName('DEBE').asFloat  := cdsCntCaja.fieldbyName('DCMTOLO').asFloat
   else cdsCntCaja.fieldbyName('HABER').asFloat := cdsCntCaja.fieldbyName('DCMTOLO').asFloat;
end;

function TDMTE.RecuperaDescripcionCuenta(xCia,xCuenta: String): String;
var
   xSQL : string;
begin
   Result:='';
   xSQL := 'SELECT CTAABR FROM TGE202 '+
           'WHERE CIAID = '''+xCia+''''+
           ' AND  CUENTAID = '''+ xCuenta + '''' ;
   cdsQry.Close;
   cdsQry.ProviderName:='prvCaja';
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   if cdsQry.RecordCount=0 then
      exit;
   Result:=cdsQry.FieldByName('CTAABR').AsString;
end;


procedure TDMTE.DataModuleCreate(Sender: TObject);
var
	xWhere, sSQL, xSQL2 :string;
  inifile : TIniFile;
begin
   Screen.Cursor:=crHourGlass;
   DCOM1.Connected:=False;

   if ParamStr(1)='' then
   begin
      inifile:=TIniFile.Create( ExtractFilePath( application.ExeName )+'\oaCfg.ini');
      DCOM1.Address:=IniFile.ReadString('TCPIP','ADDRESS','');
      wSRV:=IniFile.ReadString('MOTOR','NAME','');
   end;

   TRY
      DCOM1.Connected:=true;
   EXCEPT
      // por no realizar la conexion
      SHOWMESSAGE( 'ERROR de Conexión.');
      Screen.Cursor:=CrDefault;
      Exit;
   END;

   Try
      cIP:= DMTE.ObtenerIpdeNetbios(DMTE.computerName);
   Except
      ShowMessage( 'ERROR de Conexión.');
      DCOM1.Connected:=False;
      Screen.Cursor:=CrDefault;
      Exit;
   End;

   FCtrlAcceso := TFCtrlAcceso.Create(Application);
   wModulo := 'CAJA';
   FCtrlAcceso.wDCOM1:=DCOM1;
   Screen.Cursor:=crHourGlass;

   FCtrlAcceso.ShowModal;

   if FCtrlAcceso.cAccesoSistema='S' then
   begin
      wUsuario := FCtrlAcceso.dbeUsuario.Text;
      FCtrlAcceso.free;
   end
   else
   begin
      DCOM1.Connected:=False;
      FCtrlAcceso.free;
      sClose:='1';
      Screen.Cursor:=CrDefault;
      Exit;
   end;

   if not AccesosModulo then
   begin
      DCOM1.Connected:=False;
      Screen.Cursor:=CrDefault;
   end
   else
   begin

       if (wSRV = 'ORACLE') then
       begin
          xSQL2:='Select A.USERID, A.GRUPOID, B.MODULOID, B.TIPO, C.GRUPOADM '
                +'From TGE007 A, TGE001 B, TGE003 C '
                +'WHERE A.USERID='''+wUsuario+''' '
                +'AND A.GRUPOID=B.GRUPOID(+) and B.MODULOID='''+wModulo+''''
                +'AND A.GRUPOID=C.GRUPOID(+) '
                +'Order by A.USERID';
       end;
       if (wSRV = 'DB2NT') or (wSRV = 'DB2400') then
       begin
          xSQL2:='Select A.USERID, A.GRUPOID, B.MODULOID, B.TIPO, C.GRUPOADM '
                +'From TGE007 A '
                +'Left Outer Join TGE001 B ON (A.GRUPOID=B.GRUPOID) '
                +'Left Outer Join TGE003 C ON (A.GRUPOID=C.GRUPOID) '
                +'WHERE A.USERID='''+wUsuario+''' '
                +'and B.MODULOID='''+wModulo+'''';
       end;

      cdsUsuarios.Close;
      cdsUsuarios.DataRequest( xSQL2 );
      cdsUsuarios.Open;
      cdsMGrupo.Open;
      wAdmin := cdsMGrupo.fieldbyname('GrupoAdm').AsString;
      wAdmin := cdsUsuarios.fieldbyname('GrupoAdm').AsString;
      cdsGrupos.Open;


      xSQL2 := 'Select * from TGE004 '
          + 'Where ModuloId='+''''+wModulo +''''
          + ' and  UserID='  +''''+wUsuario+'''';
      cdsAcceso.Close;
      cdsAcceso.DataRequest( xSQL2 );
      cdsAcceso.Open;

      sSQL:='Select TASAMTO, TASACAN, TASADES, TASAFEC, NUMLINRET from TGE108 Where TASAFLG=''R''';
      cdsQry.Close;
      cdsQry.Datarequest( sSQL );
      cdsQry.Open;

      xTasaPorce := cdsQry.FieldByName('TASACAN').AsFloat;
      xTasaMonto := cdsQry.FieldByName('TASAMTO').AsFloat;
      xTasaFec   := cdsQry.FieldByName('TASAFEC').AsDateTime;
      xNumLinRet := cdsQry.FieldByname('NUMLINRET').AsInteger;

      wTipoCambioUsar      := 'TCAMVOV' ;
      wModulo := 'CAJA' ;
      wTCCompra := 'TCAMVOC' ;
      wTCVenta  := 'TCAMVOV' ;
      wVRN_CptoCia:=DisplayDescrip('prvTGE','SOLREGLAS','*','VRN_MODULO=''CXP''','VRN_CPTOCIA');
      xWhere:='DOCTIPREG=''TR''';
      wTipoDocTransferencia:=DisplayDescrip('prvTGE','TGE110','DOCID',xWhere,'DOCID');

      xWhere:='FEFE=''1'' or FEFE=''S''';
      wEfectivo:=DisplayDescrip('prvTGE','TGE112','FPAGOID',xWhere,'FPAGOID');
      xWhere:='FCHQ=''1'' or FCHQ=''S''';
      wCheque  :=DisplayDescrip('prvTGE','TGE112','FPAGOID',xWhere,'FPAGOID');
      xWhere:='FCANJE=''T''';
      wTarjeta :=DisplayDescrip('prvTGE','TGE112','FPAGOID',xWhere,'FPAGOID');
      xWhere:='FNDE=''1'' or FNDE=''S''';
      wDeposito:=DisplayDescrip('prvTGE','TGE112','FPAGOID',xWhere,'FPAGOID');

      xWhere:='CLAUXCP=''C''';
      wClaseAuxClie:=DisplayDescrip('prvTGE','TGE102','CLAUXID',xWhere,'CLAUXID');
      xWhere:='CLAUXCP=''P''';
      wClaseAuxProv:=DisplayDescrip('prvTGE','TGE102','CLAUXID',xWhere,'CLAUXID');

      xWhere:='TMon_Loc='+''''+'L'+'''';
      wTMonLoc:=DisplayDescrip('prvTGE','TGE103','TMONID',xWhere,'TMonID');
  // Inicio HPC_201601_CAJA
  // Se inicializa la variable wTMonLocDes para descripción de la Moneda Local
  // Se inicializa la variable wTMonExtDes para descripción de la Moneda Extranjera
      wTMonLocDes := UpperCase(DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMonDes'));
      xWhere:='TMon_Loc='+''''+'E'+'''';
      wTMonExt:=DisplayDescrip('prvTGE','TGE103','TMONID',xWhere,'TMonID');
      wTMonExtDes := UpperCase(DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMonDes'));
  // Fin HPC_201601_CAJA

      DisplayDescrip('prvSQL','SOLCONFIG','*','','SRV_DB');
      SRV_E   := cdsqry.FieldByName('SRV_EQUIP').AsString;
      SRV_D   := cdsqry.FieldByName('SRV_DB').AsString;
      SRV_V   := cdsqry.FieldByName('SRV_VERS').AsString;
      wRptCia := cdsqry.FieldByName('RPTCIA').AsString;
      wAmedida := cdsqry.FieldByName('AMEDIDAOPC').AsString;
      xBorrar:='0';

      xSRV_RUTA := cdsQry.FieldByName('SRV_RUTA').AsString;

      // rutas para los reportes
      wRutaRpt := ExtractFilePath( application.ExeName )+'RTMs\'+wModulo+'\'+wRptCia;
      wRutaCNT := ExtractFilePath( application.ExeName )+'RTMs\CNT\'+wRptCia;

     if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      begin
       wFormatFecha := 'YYYY-MM-DD';
       wReplacCeros := 'COALESCE';
       wRepFecServi := 'CURRENT DATE';
       wRepHorServi := 'CURRENT TIME';
       wRepFuncDate := 'DATE(';
      end
     else
      if SRV_D = 'ORACLE' then
       begin
        wFormatFecha := 'DD/MM/YYYY';
        wReplacCeros := 'NVL';
        wRepFecServi := 'SYSDATE';
        wRepHorServi := 'SYSDATE';
        wRepFuncDate := 'TO_DATE(';
       end;

     sSQL:='SELECT DOCID FROM TGE110 WHERE DOC_FREG=''L'' AND DOCMOD=''CXP'' AND '+wReplacCeros+'(DOCTIPREG,''X'')=''X'' ';
     cdsQry.Close;
     cdsQry.Datarequest( sSQL );
     cdsQry.Open;
     sLet:=cdsQry.FieldByname('DOCID').AsString;

     if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
     begin
        sSQL:=' Select TGE106.*, TGE103.TMONDES, TGE103.TMONABR '
             +' from TGE106 '
             +' inner Join TGE103 on TGE106.TMONID=TGE103.TMONID ';
        cdsCCBco.DataRequest(sSQL);

        sSQL:=' SELECT * FROM TGE105 WHERE BCOTIPCTA=''C'' '+
            ' UNION '+
            ' SELECT DISTINCT TGE105.* FROM TGE105 '+
            '  INNER JOIN TGE106 '+
            '  ON(TGE105.BANCOID=TGE106.BANCOID)';

        cdsBancoEgr.DataRequest(sSQL);

     end
     else
     begin
        sSQL:=' Select TGE106.*, TGE103.TMONDES, TGE103.TMONABR '+
        ' From TGE106,TGE103 '+
        ' WHERE TGE106.TMONID=TGE103.TMONID(+) ';
        cdsCCBco.DataRequest(sSQL);

        sSQL:=' SELECT * FROM TGE105 WHERE BCOTIPCTA=''C'' '+
            ' UNION '+
            ' SELECT DISTINCT TGE105.* FROM TGE105,TGE106 '+
            ' WHERE  TGE105.BANCOID=TGE106.BANCOID(+) ';
        cdsBancoEgr.DataRequest(sSQL);
     end;

     // Apertura del Tablas
     xSQL2 := 'Select * from TGE004 '
            + 'Where ModuloId='+''''+wModulo +''''
            + ' and  UserID='  +''''+wUsuario+'''';

     cdsAcceso.Close;
     cdsAcceso.DataRequest( xSQL2 );
     cdsAcceso.Open;

     FiltraTabla( cdsCia,     'TGE101', 'CiaId'   );
     FiltraTabla( cdsTDiario, 'TGE104', 'TDiarId' );
     FiltraTabla( cdsTDoc,    'TGE110', 'DocId'   );
     FiltraTabla( cdsTMon,    'TGE103', 'TMonId'  );
     FiltraTabla( cdsBanco,   'TGE105', 'BANCOID' );
     FiltraTabla( cdsFormPago,'TGE112', 'FPAGOID' );
     FiltraTabla( cdsBancoEgr,'TGE105', 'BANCOID' );
     FiltraTabla( cdsCnpEgr,  'CAJA201','CPTOID'  );

     cFilterCiaUser    :=FiltraCiaPorUsuario( cdsCia );
     cFilterOrigenUser :=FiltraOrigenPorUsuario_cia( 'TGE104', 'TDIARID' );
     cFilterUsuarioUser   :=FiltraUsuarioPorUsuario_cia( 'TGE006', 'NCOUSER' );
     cFilterUsuarioUserEgr:=FiltraUsuarioPorUsuario_cia( 'TGE006', 'ECUSER' );

     cdsClaseAux.Open ;
     cdsNivel.Open;
   end;

   FVariables.w_Var_sktDCOM := DCOM1;

end;

function TDMTE.RecuperarTipoCambio(xFecha : TDateTime ): String;
var
   xFechaFormato : string ;
begin
     xFechaFormato := Formatdatetime(wFormatFecha,xFecha) ;
     RecUltTipoCambio(xFechaFormato);
     cdsRec.active := False ;
     cdsRec.active := True ;
     if cdsRec.RecordCount <> 0 then
     begin
        if not cdsRec.FieldByName(wTipoCambioUsar).isnull then
           Result := cdsRec.FieldByName(wTipoCambioUsar).AsString
        else
           Result := '0.00' ;
     end
     else
     begin
           Result := '0.00' ;
     end ;
end;

procedure TDMTE.ASignaTipoDiario (dblcX:TwwDBCustomLookUpCombo ; Forma: TForm);
var cdsTDiarioC1: TwwClientDataset;
begin
    cdsTDiarioC1 := TwwClientdataset.Create(Forma) ;
    cdsTDiarioC1.CloneCursor(cdsTDiario,True) ;
    cdsTDiarioC1.Name := 'cdsTDiarioC1' ;
    cdsTDiarioC1.Filter := 'FLAGBCOCJA=''S''' ;
    cdsTDiarioC1.FilterED := True ;
    dblcX.LookupTable := cdsTDiarioC1 ;
end;

function TDMTE.FieldNoNulo(xCampo: TField): String;
begin
  if not xCampo.IsNull then
    Result := xCampo.AsString
  else
    Result := '' ;
end;

function TDMTE.EquivFPago;
begin
   cdsEquiv.Open;
    if cdsEquiv.Locate('FPAGOID;BANCOID',VarArrayOf([xFAGOID,xBANCOID]),[]) then
       Result := cdsEQuiv.FieldByName('EQUIID').AsString
    else
       Result := '' ;
end;

procedure TDMTE.ActSdoTlfn ( xCia,xBco, xCtaCte, xMonto : String; xFecha : TDateTime;
                            EC_IE : String='E'; xOper : String='+' );
var
   strFecha, Fecha : String ;
   xSQL,xWhere : String ;
   xTOTEgresos, xTOTIngresos : String ;
   xSaldoInic, xSaldoFin : Double;
   CIA, BCO, CCBCO, MONTO : String;
begin
   strFecha := FormatDateTime( wFormatFecha, xFecha ) ;
   Fecha := strFecha;
   CIA   := xCia;
   BCO   := xBco;
   CCBCO := xCtaCte;
   MONTO := xMonto;

   xWhere := 'STFECHA = '+wRepFuncDate+''''+FECHA+''') ';
   xWhere := xWhere +' AND CIAID='+QuotedStr(CIA)+' AND BANCOID='''+BCO+''' AND CCBCOID='''+ CCBCO + ''''  ;
   xSQL   := 'SELECT * FROM CAJA310 WHERE '  + xWhere ;

   cdsSQL.Close;
   cdsSQL.DataRequest( xSQL );
   cdsSQL.Open;

   if cdsSQL.recordcount > 0 then
   begin
      if EC_IE = 'E' then
      begin
        if xOper = '-' then
           xTOTEgresos := FloatToStrf(cdsSQL.FieldByName('STTOTEGR').AsFloat-StrToFloat(MONTO),ffFixed, 15, 2 )
        else
           xTOTEgresos := FloatToStrf(cdsSQL.FieldByName('STTOTEGR').AsFloat+StrtoFloat(MONTO),ffFixed, 12, 2 );

        xSQL:='UPDATE CAJA310 '
             +'SET STTOTEGR='  +xTOTEgresos + ', '
             +    'STSALDOFIN='+FloatToStr(cdsSQL.FieldByName('STSALDOINIC').AsFloat-StrToFloat(xTOTEgresos))
             +' WHERE STFECHA = '+wRepFuncDate+''''+FECHA+''') '
             +       'AND CIAID='+QuotedStr(CIA)+' AND BANCOID = '''+BCO+'''  AND CCBCOID = '''+CCBCO+'''' ;
      end
      else
      begin
        if xOper = '-' then
           xTOTIngresos:=FloatToStrF(cdsSQL.FieldByName('STTOTING').AsFloat - StrToFloat(MONTO),ffFixed,15,2)
        else
           xTOTIngresos:=floattostrf(cdsSQL.FieldByName('STTOTING').AsFloat + StrToFloat(MONTO),ffFixed, 12,2);

	xSQL:='UPDATE CAJA310 '
             +' SET STTOTING='  +xTOTIngresos + ', '
             +     'STSALDOFIN='+CurrToStr(cdsSQL.FieldByName('STSALDOINIC').AsFloat - StrToFloat(xTOTIngresos) )
             +' WHERE STFECHA='+wRepFuncDate+''''+FECHA+''') '
             +  'AND CIAID='+QuotedStr(CIA)+' AND BANCOID='''+BCO+''' AND CCBCOID='''+CCBCO+'''';
      end;
   end
   else
   begin
     xSQL:='SELECT * FROM CAJA310 '
          +'WHERE CIAID='+QuotedStr(CIA)+' AND BANCOID='''+BCO+'''  AND CCBCOID = '''+CCBCO+'''  AND '
          +      'STFECHA=( SELECT MAX(STFECHA) '
          +                'FROM CAJA310 A  '
          +                'WHERE A.CIAID='+QuotedStr(CIA)+' AND A.BANCOID = '''+BCO+'''  AND A.CCBCOID = '''+CCBCO+''' '
          +                '  AND A.STFECHA < '+wRepFuncDate+''''+FECHA+''')'
          +              ') ';
     cdsSQL.Close;
     cdsSQL.DataRequest(xSQL);
     cdsSQL.Open;

     if cdsSQL.RecordCount = 0 then
        xSaldoInic := 0
     else
        xSaldoInic := cdsSQL.FieldByName('STSALDOFIN').AsFloat ;

     if EC_IE = 'E' then
     begin
       xTOTEgresos := MONTO;
       xSaldoFin  := xSaldoInic - StrToFloat(xTOTEgresos) ;
       xSQL:='INSERT INTO CAJA310 (STFECHA , CIAID,BANCOID , CCBCOID , STTOTEGR,STSALDOINIC,STSALDOFIN )'+
             'VALUES ('''+FECHA+''','''+CIA+''','''+BCO+''','''+CCBCO+''','+ xTOTEgresos+ ' ,' +
                     FloatToStr(xSaldoinic) + ',' + FloatToStr(xSaldoFin) +') ';
     end
     else
     begin
        xTOTIngresos := MONTO;
        xSaldoFin  := xSaldoInic + StrToFloat(xtotingresos) ;
        xSQL:='INSERT INTO CAJA310 (STFECHA , CIAID, BANCOID , CCBCOID , STTOTING ,STSALDOINIC,STSALDOFIN )'+
              'VALUES ('''+FECHA+''','''+CIA+''','''+BCO+''','''+CCBCO+''','+ xTOTIngresos+', '+
                      FloatToStr(xSaldoinic) + ',' + FloatToStr(xSaldoFin) +') ';
     end;
   end;

   try
     DCOM1.AppServer.EjecutaSQL(xSQL);
   except
     DMTE.ControlTran(1,nil,'');
   end;

   {cdsSQL.Close;
   cdsSQL.DataRequest( xSQL );
   cdsSQL.Execute;}
end;


procedure TDMTE.ActSdoMen ( xBco , xCtaCte , xMonto : String ; xFecha : TDateTime ; EC_IE : String = 'E' );
var
   xSQL : String ;
   a,m,d:word;
   sANO,sMES,sDIA:string;
begin
   DecodeDate(xFecha,a,m,d);
   sANO:=DMTE.StrZero(IntToStr(a),4);
   sMES:=DMTE.StrZero(IntToStr(m),2);

   xSQL := 'SELECT * FROM CAJA401 WHERE SBANO ='''+sANO+''' AND ' +
           '         SBBANCO = '''+xBCO+''''  ;
   if trim(xCtaCte) <> '' then
   begin
     xSQL := xSQL + ' AND CTACTE = '''+xCtaCte+'''' ;
   end ;
   cdsSaldo.Close;
   cdsSaldo.DataRequest(xSQL);
   cdsSaldo.Open;

   if cdsSaldo.recordcount > 0 then
   begin
     cdsSaldo.Edit ;
   end
   else
   begin
     cdsSaldo.Insert ;
     cdsSaldo.FieldByName('SBANO').AsString := sANO ;
     cdsSaldo.FieldByName('SBBANCO').AsString := xBCO ;
     cdsSaldo.FieldByName('CTACTE').AsString := xCtaCte;
     cdsSaldo.FieldByName('SALDOANT'+sMES).AsString := '0' ;
     cdsSaldo.FieldByName('SALDOMES'+sMES ).AsString := '0' ;
     cdsSaldo.FieldByName('SALDOACUM'+ sMES ).AsString := '0' ;
   end ;

   if EC_IE = 'E' then
   begin
     cdsSaldo.FieldByName('SALDOMES'+sMES ).AsString := FloatToStrF(cdsSaldo.FieldByName('SALDOMES'+sMES ).AsFloat-StrToFloat(xMONTO),ffFixed,12,2);
   end
   else
   begin
     cdsSaldo.FieldByName('SALDOMES'+sMES ).AsString := FloatToStrF(cdsSaldo.FieldByName('SALDOMES'+sMES ).AsFloat+StrToFloat(xMONTO),ffFixed,12,2);
   end ;
   cdsSaldo.FieldByName('SALDOACUM'+ sMES ).AsString := FloatToStrF(cdsSaldo.FieldByName('SALDOANT'+sMES ).AsFloat+cdsSaldo.FieldByName('SALDOMES'+sMES ).AsFloat,ffFixed,12,2);
   cdsSaldo.Post;
   //CLG: 20/10/2003
   //DMTE.AplicaDatos(cdsSaldo,'SALDO');
   DMTE.ControlTran(0,cdsSaldo,'SALDO');
end;


function TDMTE.DesEncripta(wPalabra:String): String;
var
   xLargoPal,i,j : integer;
   xReal,xEncriptado1,xEncriptado2,xEncriptado3,xEncriptado4,
   xEncriptado5,xNuevaPal,xEncriptado : string;
   xTiene : boolean;
begin
   xReal       := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1:= '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2:= '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3:= '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4:= 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5:= ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal   := length(wPalabra);
   xNuevaPal   := '';
   i := 1;
   while i<=xLargoPal do begin
      j := 1;
      xTiene := False;
      if (i=1) or (i=11)or (i=21) or (i=31) then xEncriptado:=xEncriptado1;
      if (i=2) or (i=12)or (i=22) or (i=32) then xEncriptado:=xEncriptado2;
      if (i=3) or (i=13)or (i=23) or (i=33) then xEncriptado:=xEncriptado3;
      if (i=4) or (i=14)or (i=24) or (i=34) then xEncriptado:=xEncriptado4;
      if (i=5) or (i=15)or (i=25) or (i=35) then xEncriptado:=xEncriptado5;
      if (i=6) or (i=16)or (i=26) or (i=36) then xEncriptado:=xEncriptado1;
      if (i=7) or (i=17)or (i=27) or (i=37) then xEncriptado:=xEncriptado2;
      if (i=8) or (i=18)or (i=28) or (i=38) then xEncriptado:=xEncriptado3;
      if (i=9) or (i=19)or (i=29) or (i=39) then xEncriptado:=xEncriptado4;
      if (i=10)or (i=20)or (i=30) or (i=40) then xEncriptado:=xEncriptado5;
      while j<=length(xReal) do begin
         if copy(wPalabra,i,1)=copy(xEncriptado,j,1) then begin
            xNuevaPal := xNuevaPal+copy(xReal,j,1);
            xTiene := True;
         end;
         j := j+1;
      end;
      if not xTiene then xNuevaPal:=xNuevaPal+copy(wPalabra,i,1);
      i := i+1;
   end;
   result:=xNuevaPal;
end;

function TDMTE.Encripta(wPalabra:String): String;
var
   xLargoPal,i,j : integer;
   xReal,xEncriptado1,xEncriptado2,xEncriptado3,xEncriptado4,
   xEncriptado5,xNuevaPal,xEncriptado : string;
   xTiene : boolean;
begin
   xReal       := 'ABCDEFGHIJKLMNÑOPQRSTUVWXYZ0123456789abcdefghijklmnñopqrstuvwxyz';
   xEncriptado1:= '|+_)(*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM';
   xEncriptado2:= '*&^%$#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(';
   xEncriptado3:= '#@!~[ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$';
   xEncriptado4:= 'ñ{}]:;"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[';
   xEncriptado5:= ';"\<>?,./98126534IOUEAXYZCDBHGFLÑJKNQPTSRWVM|+_)(*&^%$#@!~[ñ{}]:';
   xLargoPal   := length(wPalabra);
   xNuevaPal   := '';
   i := 1;
   while i<=xLargoPal do begin
      j := 1;
      xTiene := False;
      if (i=1) or (i=11)or (i=21) or (i=31) then xEncriptado:=xEncriptado1;
      if (i=2) or (i=12)or (i=22) or (i=32) then xEncriptado:=xEncriptado2;
      if (i=3) or (i=13)or (i=23) or (i=33) then xEncriptado:=xEncriptado3;
      if (i=4) or (i=14)or (i=24) or (i=34) then xEncriptado:=xEncriptado4;
      if (i=5) or (i=15)or (i=25) or (i=35) then xEncriptado:=xEncriptado5;
      if (i=6) or (i=16)or (i=26) or (i=36) then xEncriptado:=xEncriptado1;
      if (i=7) or (i=17)or (i=27) or (i=37) then xEncriptado:=xEncriptado2;
      if (i=8) or (i=18)or (i=28) or (i=38) then xEncriptado:=xEncriptado3;
      if (i=9) or (i=19)or (i=29) or (i=39) then xEncriptado:=xEncriptado4;
      if (i=10)or (i=20)or (i=30) or (i=40) then xEncriptado:=xEncriptado5;
      while j<=length(xReal) do begin
         if copy(wPalabra,i,1)=copy(xReal,j,1) then begin
            xNuevaPal := xNuevaPal+copy(xEncriptado,j,1);
            xTiene := True;
         end;
         j := j+1;
      end;
      if not xTiene then xNuevaPal:=xNuevaPal+copy(wPalabra,i,1);
      i := i+1;
   end;
   result:=xNuevaPal;
end;

Procedure TDMTE.AccesosUsuarios(xxModulo,xxUsuario,xxTipo,xxForma:String);
begin
   if Trim(cdsUsuarios.fieldbyName('GrupoId').AsString)='' then begin
      cdsUsuarios.SetKey;
      cdsUsuarios.fieldbyName('UserId').asString := xxUsuario;
      If not cdsUsuarios.GotoKey then Exit;
   end;

   cdsGrupos.Filter := '';
   If xxTipo='1' then begin
      cdsGrupos.Filter:='GrupoID='+''''+cdsUsuarios.FieldByName('GRUPOID').AsString+''''+' and '
                       +'ModuloID='+''''+xxModulo+''''+' and '
                       +'Tipo='+''''+xxTipo+'''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      While not cdsGrupos.Eof do begin
         wComponente := BuscaObjeto( cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm);
         wComponente.Enabled := False;
         cdsGrupos.Next;
      end;
   end;

   If xxTipo='2' then begin
      cdsGrupos.Filter:='GrupoID=' +''''+cdsUsuarios.fieldbyName('GrupoId').asString+''''+' and '
                       +'ModuloID='+''''+xxModulo+''''+' and '
                       +'Forma='   +''''+xxForma +''''+' and '
                       +'Tipo='    +''''+xxTipo  +'''';
      cdsGrupos.Filtered := True;
      cdsGrupos.First;
      While not cdsGrupos.Eof do begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, Screen.ActiveForm );
         If (wComponente.Name='Z2bbtnModifica') or
            (wComponente.Name='Z2bbtnConsulta') then
            wComponente.Enabled := False
         else begin
            wComponente.Visible := False;
         end;
         cdsGrupos.Next;
      end;
   end;

end;

procedure TDMTE.AccesosUsuariosR(xxModulo,xxUsuario,xxTipo:String; xxForma:TForm);
begin
   if Trim(cdsUsuarios.FieldByName('GRUPOID').AsString)='' then begin
      cdsUsuarios.SetKey;
      cdsUsuarios.FieldByName('USERID').AsString := xxUsuario;
      If not cdsUsuarios.GotoKey then Exit;
   end;

   cdsGrupos.Filter := '';
   If xxTipo='1' then begin
      cdsGrupos.Filter:='GrupoID='+''''+cdsUsuarios.FieldByName('GRUPOID').AsString+''''+' and '
                       +'ModuloID='+''''+xxModulo+''''+' and '
                       +'Tipo='+''''+xxTipo+'''';
      cdsGrupos.Filtered := True;

      if wAdmin='G' then Exit;

      cdsGrupos.First;
      While not cdsGrupos.Eof do begin
         wComponente := BuscaObjeto( cdsGrupos.FieldByName('OBJETO').AsString, xxForma );
         wComponente.Enabled := False;
         cdsGrupos.Next;
      end;
   end;

   If xxTipo='2' then begin
      cdsGrupos.Filter:='GrupoID=' +''''+cdsUsuarios.FieldByName('GRUPOID').AsString+''''+' and '
                       +'ModuloID='+''''+xxModulo                +''''+' and '
                       +'Forma='   +''''+xxForma.Name            +''''+' and '
                       +'Tipo='    +''''+xxTipo                  +'''';
      cdsGrupos.Filtered := True;

      if wAdmin='G' then Exit;

      cdsGrupos.First;
      While not cdsGrupos.Eof do begin
         wComponente := BuscaObjeto(cdsGrupos.FieldByName('OBJETO').AsString, xxForma );
         If (wComponente.Name='Z2bbtnModifica') or
            (wComponente.Name='Z2bbtnConsulta') then
            wComponente.Enabled := False
         else begin
            wComponente.Visible := False;
         end;
         cdsGrupos.Next;
      end;
   end;
end;

function TDMTE.BuscaObjeto( const xNombre:String; xForm:TForm):TControl;
var
   ic : Integer;
begin

   ic := xForm.ComponentCount-1;
   while (xForm.Components[ic].Name<>xNombre) and (ic>-1) do begin
      Dec(ic);
   end;
   If xForm.Components[ic].Name=xNombre then
      Result := TControl( xForm.Components[ic]);
end;


procedure TDMTE.ActSaldosAux(DatosAux: structSaldosAux);
var
   xAno,
   xMes : string ;
begin
   xMes := strMes ( DatosAux.FECHA ) ;
   xAno := strAno ( DatosAux.FECHA ) ;

   DMTE.ActSdoAuxiliar( DatosAux.CIAID , xANO , xMES , DatosAux.CLAUXID , DatosAux.AUXID ,
                       DatosAux.MONTOMN , DatosAux.MONTOME,datosaux.MTOSLOC,datosaux.MTOSEXT, '-' );
end;



procedure TDMTE.Filtracds( xxCds:TwwClientDataSet; xxSQL:String  );
begin
   if Length( xxSQL )>0 then begin
      xxCds.Close;
      xxCds.IndexFieldNames:='';
      xxCds.DataRequest( xxSQL );
   end;

   xxCds.Open;
end;


function TDMTE.RecuperaCorrelativo(xbcoId, xCCBcoId: String) : String ;
begin
    if RecuperarDatos('TGE106','CORRELATIVO, LONGITUD',
                      'BANCOID=''' + xbcoid + ''' AND CCBCOID=''' + xCCBcoId + '''') then
    begin
      if cdsRec.FieldByName('CORRELATIVO').IsNull then
      begin
         if cdsRec.FieldByName('LONGITUD').isNull then
         begin
         end
         else
         begin
         end ;
      end ;
    end
    else
    begin
      Result := '' ;
    end ;
end;

function TDMTE.OperClientDataSet( ClientDataSet : TwwClientDataSet;
                            Expression, Condicion : String  ) : Double;
var
  cdsClone    : TwwClientDataSet;
  bmk         : TBookmark;
  Agg         : TAggregate;
begin
  result := 0;

  if trim(Expression)= '' then Exit;

  bmk:=ClientDataSet.GetBookmark;
  cdsClone    := TwwClientDataSet.Create(nil);
  try

    with cdsClone do
    begin
      CloneCursor(ClientDataSet,True);

      Agg := Aggregates.Add;
      Agg.AggregateName := 'OPER';
      Agg.Expression := Expression;
      Agg.Active := True;

      if Trim(Condicion)<>'' then
      begin
        Filtered     := False;
        Filter       := Condicion;
        Filtered     := True;
      end;

      if Aggregates.Items[Aggregates.IndexOf('OPER')].Value<>NULL then
         result := Aggregates.Items[Aggregates.IndexOf('OPER')].Value;

      Aggregates.Clear;

    end;

    ClientDataSet.GotoBookmark(bmk);
    ClientDataSet.FreeBookmark(bmk);

  finally
    cdsClone.Free;
  end;
end;

procedure TDMTE.ControlFocoEntrada( var control: TCustomEdit;
  Evento: TNotifyEvent);
begin

   if ( control<> nil ) then
   begin

       if control is TwwDBLookUpComboDlg then
       begin
          TwwDBLookUpComboDlg(control).OnExit := Evento ;
          Exit ;
       end ;
       if control is TwwDBLookUpCombo then
       begin
          TwwDBLookUpCombo(control).OnExit := Evento ;
          exit ;
       end ;
       if control is TwwDBEdit then
       begin
          TwwDBEdit(control).OnExit := Evento ;
          Exit ;
       end ;
       if control is TwwDBDateTimePicker then
       begin
          TwwDBDateTimePicker(control).OnExit := Evento ;
          Exit ;
       end ;
   end ;
end;

procedure TDMTE.ControlFocoSalida( Forma : TForm ; var control: TCustomEdit ;
  Evento : TNotifyEvent);
var
    ctrlLookDlg : TwwDBLookUpComboDlg ;
    ctrlLookCbo : TwwDBLookUpCombo ;
    ctrlEdit : TwwDBEdit ;
    ctrlDate : TwwDBDateTimePicker ;
begin

    if (not (Forma.ActiveControl is TwwDBCustomLookUpCombo)) and
       (not(Forma.ActiveControl is TwwDBCustomEdit)) and
       (not(Forma.ActiveControl is TwwDBdateTimePicker))  then
    begin
       control := nil ;
       evento := nil ;
       Exit ;
    end ;
    //CASO DE COMBO DIALOGO
    if Forma.ActiveControl is TwwDBLookUpComboDlg   then
    begin
       ctrlLookDlg := TwwDBLookUpComboDlg(Forma.ActiveControl) ;
       if Assigned(ctrlLookDlg.OnExit) then
       begin
          Evento := ctrlLookDlg.onexit ;
          control := TCustomEdit(ctrlLookDlg) ;
          ctrlLookDlg.onexit := nil ;
       end
       else
       begin
          Evento := nil ;
          control := nil ;
       end ;
       Exit ;
    end ;

    //Caso de Combo
    if Forma.ActiveControl is TwwDBLookUpCombo   then
    begin
       ctrlLookCbo := TwwDBLookUpCombo(Forma.ActiveControl) ;
       if Assigned(ctrlLookCbo.OnExit) then
       begin
          Evento := ctrlLookCbo.onexit ;
          control := TCustomEdit(ctrlLookCbo) ;
          ctrlLookCbo.onexit := nil ;
       end
       else
       begin
          Evento := nil ;
          control := nil ;
       end ;
       Exit ;
    end ;

    //Caso de Edit
    if Forma.ActiveControl is TwwDBLookUpComboDlg   then
    begin
       ctrlEdit := TwwDBEdit(Forma.ActiveControl) ;
       if Assigned(ctrlEdit.OnExit) then
       begin
          Evento := ctrlEdit.onexit ;
          control := TCustomEdit(ctrlEdit) ;
          ctrledit.onexit := nil ;
       end
       else
       begin
          Evento := nil ;
          control := nil ;
       end ;
       Exit ;
    end ;

    //caso de date time picker
    if Forma.ActiveControl is TwwDBDateTimePicker   then
    begin
       ctrlDate := TwwDBDateTimePicker(Forma.ActiveControl) ;
       if Assigned(ctrldate.OnExit) then
       begin
          Evento := ctrldate.onexit ;
          control := TCustomEdit(ctrlDate) ;
          ctrlDate.onexit := nil ;
       end
       else
       begin
          Evento := nil ;
          control := nil ;
       end ;
       Exit ;
    end ;

end;

procedure TDMTE.xxExit ;
{
( dblcX:TwwDBCustomLookUpCombo; dbeX : TCustomEDit ; A : Array of TwinControl ;
                      M :  String ; Genero : String = '0';Obligatorio : Boolean = True );
}
var
   i : Byte;
   xGenero : String ;
begin

   if  length(A) <> 0 then
      for i := 0 to high(A) do
      begin
         if a[i].Focused then
            exit;
      end;

   if dbeX.Text ='' then
   begin

       if dblcX.Text='' then
         ShowMessage('Ingrese ' + M)
       else
       begin

         if Genero = '0' then
           xGenero := Copy(M,Length( M ),1)
         else
           xGenero := Genero ;

         if AnsiUpperCase(xGenero) = 'A' then
         begin
            ShowMessage('La ' + M + ' Que ha Ingresado ' + #13 +
                        'No está registrada') ;
         end
         else
         begin
            ShowMessage('El ' + M + ' Que ha Ingresado ' + #13 +
                        'No está registrado') ;
         end ;

         dblcX.Text:=''
       end;
       if Obligatorio then
          (dblcX).SetFocus;
   end
end;

procedure TDMTE.xxExit2(dblcX: TwwDBCustomLookUpCombo; dbeX: TCustomEDit;
  A: array of TwinControl; M, Genero: String; Obligatorio: Boolean);
var
   i : Byte;
   xGenero : String ;
begin

   if  length(A) <> 0 then
      for i := 0 to high(A) do
      begin
         if a[i].Focused then
            exit;
      end;

   if dbeX.Tag = 0 then
   begin

       if dblcX.Text='' then
         ShowMessage('Ingrese ' + M)
       else
       begin

         if Genero = '0' then
           xGenero := Copy(M,Length( M ),1)
         else
           xGenero := Genero ;

         if AnsiUpperCase(xGenero) = 'A' then
         begin
            ShowMessage('La ' + M + ' Que ha Ingresado ' + #13 +
                        'No está registrada') ;
         end
         else
         begin
            ShowMessage('El ' + M + ' Que ha Ingresado ' + #13 +
                        'No está registrado') ;
         end ;

         dblcX.Text:=''
       end;
       if Obligatorio then
          (dblcX).SetFocus;
   end
end;

function TDMTE.RecuperarDatos;
begin
    DMTE.SQLSelect(xTabla,xCampos,xWhere);
    cdsRec.active := False ;
    cdsRec.active := True ;

    if cdsRec.RecordCount=0
    then       Result := False
    else       Result := True ;
end;

Function TDMTE.DisplayDescripLocal;
begin
    if cds.Locate(xcodigo,VarArrayOf([xDato]),[]) then
       Result := cds.FieldByName(xMostrar).AsString
    else
       Result := '' ;
end;


function TDMTE.NumeroNoNulo(xCampo: TField): double;
begin
     if not xCampo.IsNull then
        Result := xCampo.asFloat
     else
        Result := 0 ;
end;

procedure TDMTE.cdsMovCxCFilter(DataSet: TDataSet; var Accept: Boolean);
begin

    if ( DataSet.FieldByName('CCMTOLOC').asFloat - Numerononulo(DataSet.FieldByName('CCPAGLOC')) -
       DataSet.FieldByName('CCSALLOC').asFloat=0 )
       and (DataSet.FieldByName('CCSALLOC').asFloat > 0 ) then
       Accept := True
    else
       Accept := False ;

end;

function TDMTE.FRoundWMC(xReal: double; xDecimal: Integer = 2): double;
begin
   Result := strtoCurr(floattostrf(xReal ,ffFixed ,15,xDecimal)) ;
end;

{ ControlFoco }

procedure TControlFoco.PonerExits;
begin
     if (( ctrlLookDlg = nil ) and
         ( ctrlLookCbo = nil ) and
         ( ctrlEdit    = nil ) and
         ( ctrlDate    = nil )) then
     begin
        Exit ;
     end ;
     If ctrlLookDlg <> nil then
     begin
        ctrlLookDlg.OnExit := Evento     ;
        ctrlLookDlg        := nil        ;
        Evento             := nil ;
        Exit ;
     end ;
     If ctrlLookCbo <> nil then
     begin
        ctrlLookCbo.OnExit  := Evento    ;
        ctrlLookCbo         := nil       ;
        Evento := nil ;
        exit ;
     end ;
     If ctrlEdit <> nil then
     begin
        ctrlEdit.OnExit     := evento    ;
        ctrlEdit            := nil       ;
        Evento              := nil ;
        Exit ;
     end ;
     If ctrlDate <> nil  then
     begin
        ctrlDate.OnExit     := Evento    ;
        ctrlDate            :=  nil ;
        Evento := nil ;
        Exit  ;
     end ;
end;

procedure TControlFoco.QuitarExits;
begin
     If not (( Forma.ActiveControl is TwwDBLookUpComboDlg ) or
        ( Forma.ActiveControl is TwwDBLookUpCombo ) or
        ( Forma.ActiveControl is TwwDBEdit ) or
        ( Forma.ActiveControl is TwwDBDateTimePicker )) then
     begin
        Evento := nil ;
        ctrlLookDlg := nil ;
        ctrlLookCbo := nil ;
        ctrlEdit    := nil ;
        ctrlDate    := nil ;
        Exit ;
     end ;
     If ( Forma.ActiveControl is TwwDBLookUpComboDlg ) then
     begin
        ctrlLookDlg := TwwDBLookUpComboDlg(Forma.ActiveControl) ;
        Evento      := ctrlLookDlg.OnExit ;
        ctrlLookDlg.OnExit := nil ;
     end ;
     If ( Forma.ActiveControl is TwwDBLookUpCombo ) then
     begin
        ctrlLookCbo := TwwDBLookUpCombo(Forma.ActiveControl) ;
        Evento      := ctrlLookCbo.OnExit ;
        ctrlLookCbo.OnExit := nil ;
     end ;
     If ( Forma.ActiveControl is TwwDBEdit ) then
     begin
        ctrlEdit    :=  TwwDBEdit(Forma.ActiveControl) ;
        evento      :=  ctrlEdit.OnExit ;
        ctrlEdit.OnExit := nil ;
     end ;

     If ( Forma.ActiveControl is TwwDBDateTimePicker ) then
     begin
        ctrlDate    :=  TwwDBDateTimePicker(Forma.ActiveControl) ;
        Evento      :=  ctrlDate.OnExit ;
        ctrlDate.OnExit := nil ;
     end ;

end;


procedure TDMTE.ActualizaCDS(cdsO, cdsD: TwwClientDataset);
var
   I : Integer ;
begin
   cdsD.edit ;
   for i := 0 to cdso.Fields.Count - 1 do
   begin
       try
         cdsD.FieldByName(cdsO.fields[i].FieldName).Value := cdsO.fields[i].Value ;
       except
       end ;
   end;
   cdsD.post ;
end;

procedure TDMTE.RecuperaCierre(var xFecha: TDateTime; xFrecu: Integer);
begin
    if RecuperarDatos( 'CAJA309','FECCIERRE, FRECUCIERRE','FACTIVO = ''S''' ) then
    begin
       xFecha := cdsRec.FieldByName('FECCIERRE').asdatetime ;
       xFrecu := cdsRec.FieldByName('FRECUCIERRE').AsInteger  ;
    end
    else
    begin
       xFecha := 0 ;
       xFrecu := 0 ;
    end ;
end ;

procedure TDMTE.abreCuentas;
var
    xSQL : String  ;
begin
    if not cdsCuentas.Active then
    begin
       xSQL := ' SELECT CUENTAID, CTADES,CTAABR FROM TGE202 '
               + ' WHERE CTA_DET = ''S'' AND CIAID='+QuotedStr(xCia)  ;
       cdsCuentas.close ;
       cdsCuentas.DataRequest(xSQL);
       cdsCuentas.Open ;
    end  ;
end;

function TDMTE.BuscaFecha(PTable, PDescrip, PKey: String;
  PVal: TDateTime): Boolean;
var
   xSQL: String;
begin
   xSQL:='SELECT * FROM '+PTable
         +' WHERE ' + PKey + '=' + wRepFuncDate+''''+ FORMATDATETIME(wFormatFecha,PVal) +''''+ ')';
         ;

   xSQL := UpperCase( xSQL );
   cdsQry.Close;
   cdsQry.ProviderName:='prvCaja';
   cdsQry.DataRequest(xSQL);    //este es la llamada remota al provider del servidor
   cdsQry.Open;
   if cdsQry.RecordCount>0 then
      Result:=True
   else
      Result:=False;
end;

procedure TDMTE.ActSdoCaja( xTMONID,xBco, xMonto, xFecha: String; EC_IE,
  xOper: string );
var
   strFecha,xSQL,xWhere : string ;
   xINGRESO, xEGRESO, xSALDOINICIAL, xSALDOFINAL, xTOTEgresos, xTOTIngresos : String ;
   xSaldoInic,xSaldoFin   : double;
begin
   strFecha := formatdatetime( wFormatFecha , StrToDate(xFecha) ) ;
   if xTMonId = DMTE.wTMonLoc then
   begin
     xINGRESO      := 'STTOTING'    ;
     xEGRESO       := 'STTOTEGR'    ;
     xSALDOINICIAL := 'STSALDOINIC' ;
     xSALDOFINAL   := 'STSALDOFIN'  ;
   end
   else
   begin
     xINGRESO      :=  'STINGEXT'   ;
     xEGRESO       :=  'STEGREXT'   ;
     xSALDOINICIAL :=  'STSDOINIEXT';
     xSALDOFINAL   :=  'STSDOFINEXT';
   end;

   //CALCULO DEL SALDO INICIAL
   xWhere := ' WHERE STFECHA < '+QuotedStr(strFecha)+' AND '  +
             ' BANCOID = '+QuotedStr(xBCO);

   xSQL   := ' SELECT MAX(STFECHA) STFECHA FROM CAJA310 '  + xWhere ;

   cdsRec.Close;
   cdsRec.DataRequest(xSQL);
   cdsRec.Open;

   if cdsRec.recordcount > 0 then
   begin
     xWhere := '   WHERE STFECHA = '+QuotedStr(Formatdatetime(DMTE.wFormatFecha,cdsRec.FieldByName('STFECHA').AsDateTime))
               + '  AND    BANCOID = '+QuotedStr(xBCO);
     xSQL   := ' SELECT * FROM CAJA310 ' + xWhere ;

     cdsRec.Close;
     cdsRec.DataRequest(xSQL);
     cdsRec.Open;

     xSaldoInic := cdsRec.FieldByName(xSALDOFINAL).AsFloat ;
   end
   else
   begin
     xSaldoInic := 0 ;
   end;

   xWhere := '   WHERE STFECHA = '+QuotedStr(strFECHA)+
             '   AND BANCOID = '+QuotedStr(xBCO);

   xSQL   := ' SELECT * FROM CAJA310 '  + xWhere ;

   cdsRec.Close;
   cdsRec.DataRequest(xSQL);
   cdsRec.Open;

   if cdsRec.recordcount > 0 then
   begin
     if EC_IE = 'E' then
     begin
       if xOper = '-' then
          xTOTEgresos := floattostrf(cdsRec.fieldByName(xEGRESO).AsFloat-StrToFloat(xMONTO),ffFixed,15,2)
       else
          xTOTEgresos := floattostrf(cdsRec.fieldByName(xEGRESO).AsCurrency+StrToCurr(xMONTO),ffFixed,15,2);

       xSQL := ' UPDATE CAJA310 SET '+ xEGRESO +' = ' + xTOTEgresos + ','+
                        xSALDOFINAL+' = '+FloatToStr(xSaldoInic-strtoFloat(xTOTEgresos))+' + '+DMTE.wReplacCeros+'('+xINGRESO+',0) '+xWhere;
     end
     else
     begin
       if xOper = '-' then
         xTOTIngresos := floattostrf(cdsRec.FieldByName('STTOTING').AsFloat-StrToFloat(xMONTO),ffFixed,12,2)
       else
         xTOTIngresos := floattostrf(cdsRec.FieldByName('STTOTING').AsFloat+StrToCurr(xMONTO),ffFixed,12,2);

       xSQL := ' UPDATE CAJA310 SET '+ xINGRESO + ' = ' + xTOTIngresos + ', ' +
                        xSALDOFINAL+' = '+FloatToStr(xSaldoInic+strtoFloat(xTOTIngresos))+' - '+wReplacCeros+'('+xEGRESO+',0) '+xWhere;
     end ;
   end
   else
   begin
     if EC_IE = 'E' then
     begin
       xTOTEgresos := xMONTO;
       xSaldoFin   := xSaldoInic - StrToFloat(xTOTEgresos);
       xSQL := 'INSERT INTO CAJA310 (STFECHA , BANCOID ,'+xEGRESO+','+xSALDOFINAL+' )'+
               ' VALUES ('''+StrFECHA+''','''+xBCO+''','+ xTOTEgresos+ ' ,'+FloatToStr(xSaldoFin) + ')'   ;

     end
     else
     begin
       xTOTIngresos := xMONTO;
       xSaldoFin    := xSaldoInic + strtoFloat(xtotingresos);
       xSQL := 'INSERT INTO CAJA310 (STFECHA , BANCOID ,'+xINGRESO+','+xSALDOFINAL+ ' )'+
               ' VALUES ('''+strFECHA+''','''+xBCO+''',' + xTOTIngresos+ ','+FloatToStr(xSaldoFin) +')'   ;

     end ;
   end ;

   try
     DCOM1.AppServer.EjecutaSQL(xSQL);
   except
     DMTE.ControlTran(1,nil,'');
   end;
end;

procedure TDMTE.ControlTran( wControlError : Integer; wCDS: TClientDataSet; wNomArch : String );
begin
// wControlError=1 errores en el SQL, entra a través del Except
// wControlError=9 para la grabación en línea
// wControlError=0 grabación a través de procesos batch, no actualiza físicamente
// wControlError=8 commit;
// DMTE.ControlTran( 0, nil, '' ); para grabar todas los cds que han sido modificados
// DMTE.ControlTran( 0, cdsGuia, 'GUIA');  graba sólo el cds especificado

	if wControlError=1 then
	begin
      DMTE.Dcom1.AppServer.RetornaTransaccion;
      ErrorCount:=1;
      ShowMessage('Avise a su Proveedor de Software...( 1 )');
      Application.Terminate;
      Abort;
	end;

	if wControlError=9 then
	begin
		DCOM1.AppServer.IniciaTransaccion;
		ErrorCount:=0;
	end;

	if (wControlError=0) or (wControlError=9) then
   begin
      if wNomArch<>'' then
      begin
         if ErrorCount = 0 then
            DMTE.AplicaDatos( wCDS, wNomArch );
      end
      else
      begin
        //AplicaDatos en Cascada (Obsoleto)
      end;
   end;

	if wControlError=9 then
	begin
      wControlError:=8;
	end;

	if wControlError=8 then
		if ErrorCount=0 then
         DCOM1.AppServer.GrabaTransaccion;

   if ErrorCount>0 then
   begin
      DCOM1.AppServer.RetornaTransaccion;
      ShowMessage('Avise a su Proveedor de Software...( 1 )');
      Application.Terminate;
      Abort;
   end;
end;

procedure TDMTE.AplicaDatos(wCDS: TClientDataSet; wNomArch : String);
var
	Results, OwnerData : OleVariant;
	ErrorCount : Integer;
begin
{  //
  // wCodigoError = 9729 : Error al Grabar Registro Duplicado
  //
  if (wCDS.Modified) or (wCDS.changeCount>0) then
  begin

    if VarIsEmpty( wCDS.Delta ) then Exit;

    ErrorCount := 0;
/////    wFErrorCode:= '0';
    //if (SRV_D = 'DB2400') or (SRV_D = 'DB2NT')then
    //	DMTE.DCOM1.AppServer.ParamDSPGraba('1', wNomArch);

    wCDS.CheckBrowseMode;
    Results:=DCOM1.AppServer.AS_ApplyUpdates(wCDS.ProviderName,wCDS.Delta,-1,
    																				ErrorCount,OwnerData);
    cdsResultSet.Data := Results;
    wCDS.Reconcile(Results);

    // Codigo de Error
/////    wCodigoError:=strtoint(wFErrorCode);


    //if (SRV_D = 'DB2400') or (SRV_D = 'DB2NT')then
    	 DMTE.DCOM1.AppServer.ParamDSPGraba('0', wNomArch);//
  end;}
   If (wCDS.ChangeCount > 0) or (wCDS.Modified) then
    begin
     If (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      if xBorrar = '0' then
       DMTE.DCOM1.AppServer.ParamDSPGraba('1', wNomArch);

     wCDS.CheckBrowseMode;
     Results:=DCOM1.AppServer.AS_ApplyUpdates(wCDS.ProviderName,wcds.Delta,-1,ErrorCount,OwnerData);
     cdsResultSet.Data:=Results;
     wCDS.Reconcile(Results);
     if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
      if xBorrar = '0' then
       DMTE.DCOM1.AppServer.ParamDSPGraba('0', wNomArch);
    end;
end;

// Esta comprobación sólo es para cuando es Caja
function DiaAperturado(xCia:string; xFecha : TDate; xCaja : String) : bool;
var
   sFecha, sSQL, xWhere : String;
begin
   sFecha := FormatDateTime(DMTE.wFormatFecha, xFecha);
   sSQL := 'BANCOID ='+QuotedStr(xCaja);
   // Si es Caja
   if DMTE.DisplayDescrip('prvQry2', 'TGE105', 'BCOTIPCTA', sSQL, 'BCOTIPCTA') = 'C' then
   begin
      sSQL := 'Select * From CAJA310'
             +' Where CIAID ='+QuotedStr(xCia)
             +' And BANCOID ='+QuotedStr(xCaja)
             +' And STFECHA ='+QuotedStr(sFecha);

      DMTE.cdsQry2.Filter   := '';
      DMTE.cdsQry2.Filtered := False;
      DMTE.cdsQry2.IndexFieldNames := '';
      DMTE.cdsQry2.Close;
      DMTE.cdsQry2.DataRequest(sSQL);
      DMTE.cdsQry2.Open;

   // Verifica si el día Fué Aperturado
      if DMTE.cdsQry2.RecordCount > 0 Then
      begin
         if (Length(DMTE.cdsQry2.FieldByName('FLGCIERRE').AsString) = 0) Or
            (DMTE.cdsQry2.FieldByName('FLGCIERRE').AsString = 'N') Then
         begin
            Result := True;
         end
         else
         begin
            Beep;
         // Inicio HPC_201401_CAJA
            MessageDlg('En Caja el día : '+sFecha+' ya fué Cerrado', mtInformation, [mbOk], 0);
         // Fin HPC_201401_CAJA
            Result := False;
        end;
      end
      else
      begin
      // Inicio HPC_201401_CAJA 26/02/2014 : Boton para Rendición de Caja Chica
         xWhere := 'CIAID ='+QuotedStr(xCia)
                  +' And BANCOID ='+QuotedStr(xCaja)
                  +' And NVL(FLGCIERRE, ''N'') ='+QuotedStr('N');
         DMTE.DisplayDescrip('prvSQL', 'CAJA310', 'MAX(STFECHA) STFECHA', xWhere, 'STFECHA');
         if Length(DMTE.cdsQry.FieldByName('STFECHA').AsString) > 0 Then
         begin
            Beep;
            MessageDlg('En Caja el día : '+sFecha+' No se encuentra Aperturado'+#13+'El último día Aperturado es el '+DMTE.cdsQry.FieldByName('STFECHA').AsString, mtInformation, [mbOk], 0);
            Result := False;
         end
         else
         begin
            Beep;
            MessageDlg('En Caja No Existe Un día previamente Aperturado, por Favor Aperture el día', mtInformation, [mbOk], 0);
            Result := False;
         end;
      // Fin  HPC_201401_CAJA 26/02/2014 : Boton para Rendición de Caja Chica
      end;
   end
   else
      result := true; // caso contrario, porque no es caja
end;


procedure RecalculoSaldos(xCia:string; xFecha : TDate; xCaja : String);
var
 sFecha,xNumLiq,xsql : string;
 xAno,xDia,xMes : word; // para descomponer Fecha del 1er registro del  DMTE.cdsQry2
 xAnoD,xDiaD,xMesD : word; // para descomponer xFecha
 xAnoR,xDiaR,xMesR : word; // para descomponer Fecha por registro del  DMTE.cdsQry2
 xSaldoIni : Double; // para los saldos
 xBool : Boolean; // True = si actualizo al menos un registro de CAJA310
 xMesB,xAnoB : String; //** se usa en el while de CDSREC
 xMontoMes : Double;
 xPeriodo : String;
begin
   xPeriodo := '';
   xBool := False;
   If  xCaja <> '' then
   begin
    //** borro los saldos para el periodo seleccionado
    xSql := 'Update CAJA310 SET '+
            ' STSALDOINIC=0.00 WHERE CIAID='+QuotedStr(xCia)+' AND BANCOID='+QuotedStr(xcaja)+' AND CCBCOID IS NULL';
   end
   else
    //** borro los saldos para el periodo seleccionado
    xSql := 'Update CAJA310 SET '+
            ' STSALDOINIC=0.00';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;
  //**

   //** PASO I
   //** Cargo los Bancos con sus cuentas respectivas y Caja
   if (DMTE.SRV_D = 'DB2NT') OR (DMTE.SRV_D = 'DB2400')then
   xSql := 'select CIAID,LTRIM(RTRIM(TGE105.BANCOID)) BANCOID,'+
  	  		  ' CASE WHEN (LTRIM(RTRIM(TGE106.CCBCOID)) = '''') OR (LTRIM(RTRIM(TGE106.CCBCOID)) IS NULL) THEN'+
  			  QuotedStr('-')+ ' ELSE TGE106.CCBCOID END CCBCOID '+
  			  	' from TGE105 '   +
  			  	' LEFT JOIN tge106 ON (TGE106.BANCOID=TGE105.BANCOID) ';
   if DMTE.SRV_D = 'ORACLE' then
   xSql := 'select CIAID,TRIM(TGE105.BANCOID) BANCOID,'+
  			  'DECODE(TGE106.CCBCOID,'''',DECODE(TGE106.CCBCOID,NULL,''-'',TGE106.CCBCOID),TGE106.CCBCOID) CCBCOID'+

  			  	  ' from TGE105, TGE106 '   +
  				  ' WHERE CIAID='+QuotedStr(xCia)+' AND TGE106.BANCOID(+)=TGE105.BANCOID';
  			  //**
  //**
   If xCaja <> '' then
   begin
  	 if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
  	  xsql := xsql + ' WHERE CIAID='+QuotedStr(xCia)+' AND TGE105.BANCOID='+QuotedStr(xCaja)
 		else //ORACLE
 		 xsql := xsql + ' AND TGE105.BANCOID='+QuotedStr(xCaja);
 	 end;
 	 xsql := xsql + ' ORDER BY BANCOID,CCBCOID';
 	 DMTE.cdsQry.Close;
 	 DMTE.cdsQry.DataRequest(xSql);
 	 DMTE.cdsQry.Open;
 	 DMTE.cdsQry.IndexFieldNames := 'CIAID;BANCOID;CCBCOID';
 	 //**

 		//** PASO II
 	 //** selecciono los registros que pertenezcan al periodo seleccionado
 		if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
 		 begin
 			xsql := 'SELECT STFECHA, CIAID, LTRIM(Rtrim(BANCOID)) BANCOID ,LTRIM(Rtrim(coalesce(CCBCOID,''-''))) CCBCOID,'+
 							'COALESCE(STSALDOINIC,0) STSALDOINIC,COALESCE(STTOTING,0) STTOTING,'+
 							'COALESCE(STTOTEGR,0) STTOTEGR,COALESCE(STSALDOFIN,0) STSALDOFIN, COALESCE(NUMLIQ,''0'') NUMLIQ'+
 							' FROM CAJA310 WHERE CIAID='+QuotedStr(xCIA)+' AND BANCOID='+QuotedStr(xCaja);
 			If DMTE.cdsQry.FieldByName('CCBCOID').AsString = '-' then
 			 xsql := xsql + ' AND CCBCOID IS NULL';
 			xsql := xsql + ' ORDER BY STFECHA,BANCOID,CCBCOID';
 		 end
 		else
 		 begin
 			xsql := 'SELECT STFECHA,CIAID,LTRIM(Rtrim(BANCOID)) BANCOID ,LTRIM(Rtrim('+DMTE.wReplacCeros+'(CCBCOID,''-''))) CCBCOID,'+
 							DMTE.wReplacCeros+'(STSALDOINIC,0) STSALDOINIC,'+DMTE.wReplacCeros+'(STTOTING,0) STTOTING,'+
 							DMTE.wReplacCeros+'(STTOTEGR,0) STTOTEGR,'+DMTE.wReplacCeros+'(STSALDOFIN,0) STSALDOFIN,'+DMTE.wReplacCeros+'(NUMLIQ,''0'') NUMLIQ'+
 							' FROM CAJA310 WHERE CIAID='+QuotedStr(xCIA)+' AND BANCOID='+QuotedStr(xCaja);
			If DMTE.cdsQry.FieldByName('CCBCOID').AsString = '-' then
			 xsql := xsql + ' AND CCBCOID IS NULL';
			xsql := xsql + ' ORDER BY stfecha,bancoid,ccbcoid';
		 end;
	 DMTE.cdsQRY2.Close;
	 DMTE.cdsQRY2.DataRequest(xsql);
	 DMTE.cdsQRY2.Open;
	 DMTE.cdsQRY2.IndexFieldNames := 'STFECHA;CIAID;BANCOID;CCBCOID';
	 DMTE.cdsQRY2.first;

	 //** tomo la fecha del primer registro, para de ahi tomar el mes anterior y año
	 DecodeDate(DMTE.cdsQRY2.fieldByName('STFECHA').AsDateTime,xano,xMes,xDia);
	 //** descompone de la variable del parametro
	 DecodeDate(xFecha,xanoD,xMesD,xDiaD);
	 //**

	//** PASO III
	//** valido el mes y año
	If DMTE.StrZero(floattostr(xMes),2) = '01' then
	 begin
		//** resto 1 al año y por defecto el mes se pasa a 12 (diciembre)
		xano := xano -1;
		xMes := 12;
	 end
	else
	 //** solo resto 1 al mes para tomarlo como mes anterior
	 xMes := xMes-1;
	//** carga el saldo del mes anterior desde CAJA315
	xSql := 'SELECT * FROM CAJA315 WHERE SALPERIODO='+QuotedStr(FloatToStr(xAno)+DMTE.StrZero(FloatToStr(xMes),2));
	//** si se hubiera escogido algún banco o cuenta en especial
	If xCaja <> '' then
	 begin
		xsql := xsql + ' AND BANCOID='+QuotedStr(xCaja);
		If DMTE.cdsQry.FieldByName('CCBCOID').AsString <> '-' then
		 xsql := xsql + 'AND CCBCOID='+QuotedStr(DMTE.cdsQry.FieldByName('CCBCOID').AsString);
	 end;
	xsql := xsql +  ' ORDER BY SALPERIODO,CIAID,BANCOID,CCBCOID';
	DMTE.cdsSaldos.Close;
	DMTE.cdsSaldos.DataRequest(xsql);
	DMTE.cdsSaldos.Open;
	DMTE.cdsSaldos.IndexFieldNames := 'SALPERIODO;CIAID;BANCOID;CCBCOID';
	//**

	//** PASO IV
	//** recorro la tabla de bancos (TG105 y TGE106)
	DMTE.cdsQry.first;
	while not DMTE.cdsQry.Eof do
	 begin
		 //** busco en la tabla de saldos (CAJA315)
		 //** el saldo del periodo anterior para tomarlo como saldo inicial
		 DMTE.cdsSaldos.SetKey;
		 DMTE.cdsSaldos.FieldByName('SALPERIODO').AsString := TRIM(FloatToStr(xAno)+DMTE.strzero(FloatToStr(xMes),2));
                 DMTE.cdsSaldos.FieldByName('CIAID').AsString    := TRIM(DMTE.cdsQry.FieldByName('CIAID').AsString);
		 DMTE.cdsSaldos.FieldByName('BANCOID').AsString    := TRIM(DMTE.cdsQry.FieldByName('BANCOID').AsString);
		 If DMTE.cdsQry.FieldByName('CCBCOID').AsString = '-' then
			DMTE.cdsSaldos.FieldByName('CCBCOID').clear  //:= null  //TRIM(DMTE.cdsQry.FieldByName('CCBCOID').AsString);
		 else
			DMTE.cdsSaldos.FieldByName('CCBCOID').AsString := TRIM(DMTE.cdsQry.FieldByName('CCBCOID').AsString);
		 if DMTE.cdsSaldos.GotoKey then
			xSaldoIni := DMTE.cdsSaldos.FieldByName('SALMONTO').AsFloat
		 else xSaldoIni := 0.00;
		 //**
		 DMTE.cdsQRY2.filter := ' CIAID='+QuotedStr(DMTE.cdsQry.FieldByName('CIAID').AsString)+
                                       ' AND BANCOID='+QuotedStr(DMTE.cdsQry.FieldByName('BANCOID').AsString)+
                                       ' AND CCBCOID='+QuotedStr(DMTE.cdsQry.FieldByName('CCBCOID').AsString);
		 DMTE.cdsQRY2.filtered := True;
		 DMTE.cdsQRY2.first;
		 DMTE.cdsSaldoTlfnGrab.open;
		 DMTE.cdsSaldoTlfnGrab.IndexFieldNames := 'STFECHA;CIAID;BANCOID;CCBCOID';
		 while not DMTE.cdsQRY2.eof do
			begin
			 //** carga los montos
			 DMTE.cdsSaldoTlfnGrab.SetKey;
			 DMTE.cdsSaldoTlfnGrab.FieldByName('STFECHA').AsString := DMTE.cdsQRY2.FieldByName('STFECHA').AsString;
                         DMTE.cdsSaldoTlfnGrab.FieldByName('CIAID').AsString := DMTE.cdsQRY.FieldByName('CIAID').AsString;
			 DMTE.cdsSaldoTlfnGrab.FieldByName('BANCOID').AsString := DMTE.cdsQRY.FieldByName('BANCOID').AsString;
			 If DMTE.cdsQRY.FieldByName('CCBCOID').AsString = '-' then
			   DMTE.cdsSaldoTlfnGrab.FieldByName('CCBCOID').Clear //value := null
			 else
			   DMTE.cdsSaldoTlfnGrab.FieldByName('CCBCOID').AsString := trim(DMTE.cdsQRY.FieldByName('CCBCOID').AsString);
			 If DMTE.cdsSaldoTlfnGrab.gotokey then
				begin
				 DMTE.cdsSaldoTlfnGrab.Edit;
				 DMTE.cdsSaldoTlfnGrab.FieldByName('STSALDOINIC').AsFloat := xSaldoIni;
				 DMTE.cdsSaldoTlfnGrab.FieldByName('STSALDOFIN').AsFloat :=
				 DMTE.cdsSaldoTlfnGrab.FieldByName('STSALDOINIC').AsFloat +
				 DMTE.cdsSaldoTlfnGrab.FieldByName('STTOTING').AsFloat -
				 DMTE.cdsSaldoTlfnGrab.FieldByName('STTOTEGR').AsFloat;
				 DMTE.cdsSaldoTlfnGrab.Post;
				end;
			 xSaldoIni := DMTE.cdsSaldoTlfnGrab.FieldByName('STSALDOFIN').AsFloat;
			 DecodeDate(DMTE.cdsSaldoTlfnGrab.fieldByName('STFECHA').AsDateTime,xanoR,xMesR,xDiaR);
			 DMTE.cdsQRY2.Next
			end;
		 DMTE.AplicaDatos(DMTE.cdsSaldoTlfnGrab,'SALDOSTLF');
		 //** SI EL AÑO Y MES SON IGUAL AL ACTUAL (AL DE LA FECHA)
		 //** 10/10/2001 -´psv
		//     If (xanoD=xAnoR ) and (xmesD=xMesR ) then
		 If (xanoD>=xAnoR ) and (xmesD>=xMesR ) then
		 //**
			begin
			 //** TOMO DEL ULTIMO REGISTRO EL NUMERO DE LIQUIDACION
			 //** se supone que el numero de liquidacion solo es para caja '00', pero mientras se queda asi
			 If DMTE.cdsSaldoTlfnGrab.FieldByName('NUMLIQ').AsString = '' then
				xnumliq := '1'
			 else
				xnumliq := FloatToStr(StrToFloat(DMTE.cdsSaldoTlfnGrab.FieldByName('NUMLIQ').AsString) + 1);
			 //** SI DEL SQL RESULTA > 0 SIGNIFICA QUE LA FECHA YA EXITE Y HAGO UPDATE SINO INSERT
			 sFecha := formatdatetime(DMTE.wFormatFecha,xFecha);
			 xSql := 'SELECT COUNT(*) TOTAL FROM CAJA310 '+
							 ' WHERE CIAID='+QuotedStr(xCIA)+' AND BANCOID='+QuotedStr(xCaja)+' AND STFECHA ='+DMTE.wRepFuncDate+quotedStr(sFecha)+ ')';
			 If DMTE.cdsQRY.FieldByName('CCBCOID').AsString = '-' then
				xsql := xsql + ' AND CCBCOID IS NULL'
			 else
				xsql := xsql + ' AND CCBCOID='+QuotedStr(DMTE.cdsQRY.FieldByName('CCBCOID').AsString);
			 DMTE.cdsREC.Close;
			 DMTE.cdsREC.DataRequest(xSql);
			 DMTE.cdsREC.open;
			 If DMTE.cdsREC.FieldByName('TOTAL').AsFloat > 0 then
				begin
				 xSql := 'UPDATE CAJA310 SET '+
								'STSALDOINIC ='+FloatToStr(xSaldoIni)+
								',STSALDOFIN='+FloatToStr(xSaldoIni)+
								',NUMLIQ='+QuotedStr(DMTE.StrZero(xNumLiq,6))+
								' WHERE CIAID='+QuotedStr(DMTE.cdsQRY2.FieldByName('CIAID').AsString)+' AND BANCOID='+QuotedStr(DMTE.cdsQRY2.FieldByName('BANCOID').AsString);
					If DMTE.cdsQRY.FieldByName('CCBCOID').AsString = '-' then
					 xSql := xSql + ' AND CCBCOID IS NULL'
					else
					 xSql := xSql + ' AND CCBCOID = '+ QuotedStr(trim(DMTE.cdsQRY.FieldByName('CCBCOID').AsString));
				 xSql := xSql + ' AND STFECHA='+DMTE.wRepFuncDate+quotedStr(sFecha)+ ')';
				end
			 else
				begin
				 If DMTE.cdsQRY2.FieldByName('BANCOID').AsString <> '' then
					xSql := 'INSERT INTO CAJA310(CIAID,BANCOID,CCBCOID,STFECHA,STSALDOINIC,STSALDOFIN,NUMLIQ)'+
									' VALUES ('+QuotedStr(DMTE.cdsQRY2.FieldByName('CIAID').AsString)+','+QuotedStr(DMTE.cdsQRY2.FieldByName('BANCOID').AsString)
				 else
					xSql := 'INSERT INTO CAJA310(CIAID,BANCOID,CCBCOID,STFECHA,STSALDOINIC,STSALDOFIN,NUMLIQ)'+
									' VALUES ('+QuotedStr(xCia)+','+QuotedStr(xCaja);

				 If DMTE.cdsQRY.FieldByName('CCBCOID').AsString = '-' then
					xSql := xSql + ',NULL'
				 else
					xSql := xSql + ','+ QuotedStr(trim(DMTE.cdsQRY.FieldByName('CCBCOID').AsString));
				 xSql := xSql + ','+quotedStr(sFecha)+
												','+FloatToStr(xSaldoIni)+
												','+FloatToStr(xSaldoIni)+
												','+QuotedStr(DMTE.StrZero(xNumLiq,6))+')';
				end;
			 DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
			 xBool := True;
			end;
		 //** se al menos un registro se actualizo en CAJA310 se actualiza CAJA315
		 if xBool then
			begin
				//** HAGO UN SUM(STSALDOINIC) POR BANCOID,year(STFECHA),month(stfecha)
				//** CON ESTO OPTENGO EL MONTO POR MES, QUE TUVIERA LA TABLA
				//** PARA ACTUALIZAR CAJA315
				xSql := 'SELECT sum(STSALDOINIC) MONTO,STFECHA,CIAID,BANCOID,CCBCOID FROM CAJA310';
				If DMTE.cdsQRY.FieldByName('CCBCOID').AsString = '-' then
				 xSql := xSql + ' WHERE CIAID='+QuotedStr(xCIA)+' AND BANCOID='+QuotedStr(xCaja)+' AND CCBCOID IS NULL'
				else
				 xSql := xSql + ' WHERE CIAID='+QuotedStr(xCIA)+' AND BANCOID='+QuotedStr(xCaja)+' AND CCBCOID='+QuotedStr(DMTE.cdsQRY.FieldByName('CCBCOID').AsString);
				xSql := xSql +  ' GROUP BY CIAID,BANCOID,CCBCOID,STFECHA'+
												' ORDER BY CIAID,STFECHA,BANCOID,CCBCOID';
				DMTE.cdsREC.Close;
				DMTE.cdsREC.DataRequest(xSql);
				DMTE.cdsREC.Open;
				DMTE.cdsREC.First;
				//** CARGO TODOS LOS REGISTRO QUE TUVIERA CAJA315 PARA LAS VARIABLES XCAJA, XCCBCO
				xSql := 'SELECT * FROM CAJA315 WHERE CIAID='+QuotedStr(xCia)+' AND BANCOID='+QuotedStr(xCaja);
				If DMTE.cdsQRY.FieldByName('CCBCOID').AsString = '-' then
				 xSql := xSql + ' AND CCBCOID Is NULL'
				else
				 xSql := xSql + ' AND CCBCOID='+QuotedStr(DMTE.cdsQRY.FieldByName('CCBCOID').AsString);
				DMTE.cdsSQL.close;
				DMTE.cdsSQL.DataRequest(xsql);
				DMTE.cdsSQL.Open;
				DMTE.cdsSQL.IndexFieldNames := 'SALPERIODO;CIAID;BANCOID;CCBCOID';
				//** RECORRO LA TABLA, SI NO EXISTE EL PERIODO INSERTO, CASO CONTRARIO UPDATE
				xMesB := copy(DMTE.cdsREC.FieldByName('STFECHA').AsString,4,2);
				xAnoB := copy(DMTE.cdsREC.FieldByName('STFECHA').AsString,7,4);
				while not DMTE.cdsREC.eof do
				 begin
					If (xMesB = copy(DMTE.cdsREC.FieldByName('STFECHA').AsString,4,2)) and
						 (xAnoB = copy(DMTE.cdsREC.FieldByName('STFECHA').AsString,7,4)) then
					 begin
						xMontoMes := DMTE.cdsREC.FieldByName('MONTO').AsFloat;
						DMTE.cdsRec.next
					 end
					else
					 begin
						xPeriodo := xAnoB+DMTE.StrZero(xMesB,2);
						DMTE.cdsSQL.setkey;
						DMTE.cdsSQL.FieldByName('SALPERIODO').AsString := xPeriodo;
                                                DMTE.cdsSQL.FieldByName('CIAID').AsString := DMTE.cdsREC.FieldByName('CIAID').AsString;
						DMTE.cdsSQL.FieldByName('BANCOID').AsString := DMTE.cdsREC.FieldByName('BANCOID').AsString;
						If DMTE.cdsQRY.FieldByName('CCBCOID').AsString = '-' then
						 DMTE.cdsSQL.FieldByName('CCBCOID').Clear //value := null
						else
						 DMTE.cdsSQL.FieldByName('CCBCOID').AsString := trim(DMTE.cdsQRY.FieldByName('CCBCOID').AsString);

						If DMTE.cdsSQL.gotokey then
						 begin
							xSql := 'UPDATE CAJA315 SET'+
									 ' SALMONTO='+DMTE.cdsREC.FieldByName('MONTO').AsString+
									 ' WHERE SALPERIODO ='+QuotedStr(xPeriodo)+
									 ' AND CIAID'+QuotedStr(DMTE.cdsQry.FieldByName('CIAID').AsString)+
									 ' AND BANCOID='+QuotedStr(DMTE.cdsQry.FieldByName('BANCOID').AsString);
							If DMTE.cdsQRY.FieldByName('CCBCOID').AsString = '-' then
							 xSql := xSql + ' AND CCBCOID IS NULL'
							else
							 xSql := xSql + ' AND CCBCOID='+QuotedStr(DMTE.cdsQry.FieldByName('CCBCOID').AsString);
						 end
						else
						 begin
							xSql := 'INSERT INTO CAJA315 (SALPERIODO,CIAID,BANCOID,CCBCOID,SALMONTO) '+
									 ' VALUES ('+QuotedStr(xPeriodo)+
									 ' ,'+QuotedStr(DMTE.cdsQry.FieldByName('CIAID').AsString)+','+QuotedStr(DMTE.cdsQry.FieldByName('BANCOID').AsString);
							If DMTE.cdsQRY.FieldByName('CCBCOID').AsString = '-' then
							 xSql := xSql + ', NULL'
							else
							 xSql := xSql + ','+QuotedStr(DMTE.cdsQry.FieldByName('CCBCOID').AsString);
							xSql := xSql + ','+DMTE.cdsREC.FieldByName('MONTO').AsString+')';
						 end;
						DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
						xMesB := copy(DMTE.cdsREC.FieldByName('STFECHA').AsString,4,2);
						xAnoB := copy(DMTE.cdsREC.FieldByName('STFECHA').AsString,7,4);
					 end;
				 end;
			end;
		 //** BUSCO OTRO REGISTRO DE LA TABLA DE BANCOS
		 DMTE.cdsQry.next;
	 end;
end;

procedure TDMTE.DescripIngDocs(const xCIAID, xCCTREC, xDOCID, xCCSERIE, xCCNODOC: String);
var xSQL : String ;
begin
  if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
     xSQL := 'SELECT TGE101.CIAABR, TGE110.DOCABR, TGE105.BANCOABR, TGE106.CCBCOABR, ' +
                ' TGE103.TMONABR, TGE102.CLAUXABR, TGE217.FLUEFEABR '                  +
             'FROM CXC303'                                                             +
                ' LEFT OUTER JOIN TGE101 ON (CXC303.CIAID = TGE101.CIAID)'             +
                ' LEFT OUTER JOIN TGE110 ON (CXC303.DOCID = TGE110.DOCID)'             +
                ' LEFT OUTER JOIN TGE105 ON (CXC303.BANCOID = TGE105.BANCOID)'         +
                ' LEFT OUTER JOIN TGE106 ON (CXC303.BANCOID = TGE106.BANCOID)'         +
                                       ' AND(CXC303.CCBCOID = TGE106.CCBCOID)'         +
                ' LEFT OUTER JOIN TGE103 ON (CXC303.TMONID = TGE103.TMONID)'           +
                ' LEFT OUTER JOIN TGE102 ON (CXC303.CLAUXID = TGE102.CLAUXID)'         +
                ' LEFT OUTER JOIN TGE217 ON (CXC303.FLUEID = TGE217.FLUEFEID)'         +
             'WHERE CXC303.CIAID = '''   + xCIAID  + ''''                              +
                ' AND CCTREC= '''        + xCCTREC + ''''                              +
                ' AND CXC303.DOCID = ''' + xDOCID  + ''''                              +
                ' AND CCSERIE = '''      + xCCSERIE + ''''                             +
                ' AND CCNODOC = '''      + xCCNODOC + ''''
  else
    if DMTE.SRV_D = 'ORACLE' then
         xSQL := 'SELECT TGE101.CIAABR, TGE110.DOCABR, TGE105.BANCOABR, TGE106.CCBCOABR, ' +
                    ' TGE103.TMONABR, TGE102.CLAUXDES, TGE217.FLUEFEABR '                  +
                 'FROM CXC303, TGE101, TGE110, TGE105, TGE106, TGE103, TGE102, TGE217 '    +
                 'WHERE CXC303.CIAID = '''   + xCIAID  + ''''                              +
                    ' AND CCTREC= '''        + xCCTREC + ''''                              +
                    ' AND CXC303.DOCID = ''' + xDOCID  + ''''                              +
                    ' AND CCSERIE = '''      + xCCSERIE + ''''                             +
                    ' AND CCNODOC = '''      + xCCNODOC + ''''                             +
                    ' AND (CXC303.CIAID = TGE101.CIAID (+) )'                              +
                    ' AND (CXC303.DOCID = TGE110.DOCID (+) )'                              +
                    ' AND (CXC303.BANCOID = TGE105.BANCOID (+) )'                          +
                    ' AND (CXC303.BANCOID = TGE106.BANCOID (+) )'                          +
                    ' AND (CXC303.CCBCOID = TGE106.CCBCOID (+) )'                          +
                    ' AND (CXC303.TMONID = TGE103.TMONID (+) )'                            +
                    ' AND (CXC303.CLAUXID = TGE102.CLAUXID (+) )'                          +
                    ' AND (CXC303.FLUEID = TGE217.FLUEFEID (+) )'                          ;
   cdsDescrip.dataRequest(xSQL) ;
end;

procedure TDMTE.DescripPagoVaProv(const xCIAID, xECANOMM, xTDIARID, xECNOCOMP: String);
var xSQL : String ;
begin
  if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
     xSQL := 'SELECT TGE105.BANCOABR, TGE103.TMONABR, TGE106.CCBCODES, '        +
                'TGE112.FPAGOABR, TGE110.DOCABR, TGE101.CIADES, '               +
                'TGE104.TDIARABR, TGE217.FLUEFEABR, TGE112.FPAGOABR '           +
             'FROM CAJA302'                                                     +
                ' LEFT OUTER JOIN TGE105 ON (CAJA302.BANCOID = TGE105.BANCOID) ' +
                ' LEFT OUTER JOIN TGE106 ON (CAJA302.BANCOID = TGE106.BANCOID) ' +
                '                    AND  (CAJA302.CCBCOID = TGE106.CCBCOID) '  +
                ' LEFT OUTER JOIN TGE103 ON (CAJA302.TMONID = TGE103.TMONID) '   +
                ' LEFT OUTER JOIN TGE112 ON (CAJA302.FPAGOID = TGE112.FPAGOID) ' +
                ' LEFT OUTER JOIN TGE110 ON (CAJA302.DOCID = TGE110.DOCID) '     +
                ' LEFT OUTER JOIN TGE101 ON (CAJA302.CIAID = TGE101.CIAID) '     +
                ' LEFT OUTER JOIN TGE104 ON (CAJA302.TDIARID = TGE104.TDIARID) ' +
                ' LEFT OUTER JOIN TGE217 ON (CAJA302.FLUEID = TGE217.FLUEFEID) ' +
             ' WHERE CAJA302.CIAID= ''' + xCIAID +''' AND'                       +
                     ' CAJA302.TDIARID=''' + xTDIARID +'''AND'                   +
                     ' CAJA302.ECANOMM=''' + xECANOMM +'''AND' 	                +
                     ' CAJA302.ECNOCOMP=''' + xECNOCOMP +''' '
  else
    if DMTE.SRV_D = 'ORACLE' then
       xSQL := 'SELECT TGE105.BANCOABR, TGE103.TMONABR, TGE106.CCBCODES, ' +
                  'TGE112.FPAGOABR, TGE110.DOCABR, TGE101.CIADES, '        +
                  'TGE104.TDIARABR, TGE217.FLUEFEABR, TGE112.FPAGOABR '    +
               ' FROM CAJA302, TGE105, TGE106, TGE103, TGE112, '            +
                  'TGE110, TGE101, TGE104, TGE217 '                        +
               ' WHERE CAJA302.CIAID= ''' + xCIAID +''' AND'                +
                  ' CAJA302.TDIARID=''' + xTDIARID +'''AND'                +
                  ' CAJA302.ECANOMM=''' + xECANOMM +'''AND' 	             +
                  ' CAJA302.ECNOCOMP=''' + xECNOCOMP +''' '                +
                  ' AND (CAJA302.BANCOID = TGE105.BANCOID(+) ) '           +
                  ' AND (CAJA302.BANCOID = TGE106.BANCOID(+) ) '           +
                  ' AND (CAJA302.CCBCOID = TGE106.CCBCOID(+) ) '           +
                  ' AND (CAJA302.TMONID = TGE103.TMONID(+) ) '             +
                  ' AND (CAJA302.FPAGOID = TGE112.FPAGOID(+) ) '           +
                  ' AND (CAJA302.DOCID = TGE110.DOCID(+) ) '               +
                  ' AND (CAJA302.CIAID = TGE101.CIAID(+) ) '               +
                  ' AND (CAJA302.TDIARID = TGE104.TDIARID(+) ) '           +
                  ' AND (CAJA302.FLUEID = TGE217.FLUEFEID(+) ) '           ;
   cdsDescrip.close ;
   cdsDescrip.dataRequest(xSQL) ;
end;

procedure TDMTE.DescripTrans(const xCIAID, xECANOMM, xTDIARID, xECNOCOMP, xTDIARID2, xECNOCOMP2: String);
var xSQL : String ;
begin
  if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
     xSQL := 'SELECT CAJA302.*, TGE101.CIADES, ' +
               ' TGE105.BANCOABR, TGE103.TMONABR,' +
               ' TGE104.TDIARABR ' +
             'FROM (SELECT * FROM CAJA302                       '  +
                   'WHERE (CIAID ='''      + xCIAID     + '''  AND ' +
                          ' TDIARID = '''  + xTDIARID   + '''  AND ' +
                          ' ECANOMM = '''  + xECANOMM   + '''  AND ' +
                          ' ECNOCOMP = ''' + xECNOCOMP  + ''' ) OR ' +
                          '(CIAID  = '''   + xCIAID     + '''  AND ' +
                          ' TDIARID = '''  + xTDIARID2  + '''  AND ' +
                          ' ECANOMM = '''  + xECANOMM   + '''  AND ' +
                          ' ECNOCOMP = ''' + xECNOCOMP2 + ''' )) AS CAJA302 ' +
                'LEFT OUTER JOIN TGE101 ON (CAJA302.CIAID = TGE101.CIAID) ' +
                'LEFT OUTER JOIN TGE105 ON (CAJA302.BANCOID = TGE105.BANCOID) ' +
                'LEFT OUTER JOIN TGE103 ON (CAJA302.TMONID = TGE103.TMONID) ' +
                'LEFT OUTER JOIN TGE104 ON (CAJA302.TDIARID = TGE104.TDIARID)'
  else
   if DMTE.SRV_D = 'ORACLE' then
    xSQL := 'SELECT CAJA302.*, TGE101.CIADES,  TGE105.BANCOABR,'+
            'TGE103.TMONABR, TGE104.TDIARABR'+
            ' FROM caja302,TGE101 , TGE105 , TGE103 , TGE104'+
            ' WHERE ((CAJA302.CIAID ='+QuotedStr(xCIAID)+' AND  CAJA302.TDIARID = '+QuotedStr(xTDIARID)+'  AND '+
            ' CAJA302.ECANOMM = '+QuotedStr(xECANOMM) +'  AND CAJA302.ECNOCOMP = '+QuotedStr(xECNOCOMP) +' ) OR'+
            ' (CAJA302.CIAID  = '+QuotedStr(xCIAID)+'  AND  CAJA302.TDIARID = '+QuotedStr(xTDIARID)+'  AND '+
            ' CAJA302.ECANOMM = '+QuotedStr(xECANOMM)+'  AND  CAJA302.ECNOCOMP = '+QuotedStr(xECNOCOMP)+' ) ) and '+
            ' (CAJA302.CIAID = TGE101.CIAID (+) )  AND ' +
            ' (CAJA302.BANCOID = TGE105.BANCOID (+) )  AND '+
            ' (CAJA302.TMONID = TGE103.TMONID (+) )  AND '+
            ' (CAJA302.TDIARID = TGE104.TDIARID (+) ) ';
   cdsDescrip.close;;
   cdsDescrip.dataRequest(xSQL) ;
end;


procedure TDMTE.DescripOPago(const xCIAID, xOPAGO: string);
var xSQL : String ;
begin
	if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
    xSQL := 'SELECT TGE105.BANCOABR, TGE103.TMONABR, TGE106.CCBCODES, TGE112.FPAGOABR ' +
           'FROM CXP303 '                                                              +
              ' LEFT OUTER JOIN TGE105 ON (CXP303.BANCOID = TGE105.BANCOID)'           +
              ' LEFT OUTER JOIN TGE106 ON (CXP303.BANCOID = TGE106.BANCOID)'           +
                                    ' AND (CXP303.CCBCOID = TGE106.CCBCOID)'           +
              ' LEFT OUTER JOIN TGE103 ON (CXP303.TMONID = TGE103.TMONID)'             +
              ' LEFT OUTER JOIN TGE112 ON (CXP303.FPAGOID = TGE112.FPAGOID)'           +
           'WHERE OPAGO = '''+ xOPAGO + ''''                                           +
           '         AND CXP303.CIAID = '''+xCIAID+''''
  else
    if DMTE.SRV_D = 'ORACLE' then
      xSQL := 'SELECT TGE105.BANCOABR, TGE103.TMONABR, TGE106.CCBCODES, TGE112.FPAGOABR ' +
             'FROM CXP303, TGE105, TGE106, TGE103, TGE112 '                               +
             ' WHERE OPAGO = '''+ xOPAGO + ''''                                            +
                ' AND CXP303.CIAID = '''+xCIAID+''''                                             +
                ' AND (CXP303.BANCOID = TGE105.BANCOID(+) )'                              +
                ' AND (CXP303.BANCOID = TGE106.BANCOID(+) )'                              +
                ' AND (CXP303.CCBCOID = TGE106.CCBCOID(+) )'                              +
                ' AND (CXP303.TMONID = TGE103.TMONID(+) )'                                +
                ' AND (CXP303.FPAGOID = TGE112.FPAGOID(+) )'                              ;
  cdsDescrip.close ;
  cdsDescrip.DataRequest(xSQL) ;
end;

procedure TDMTE.SetFlagPagoProv(var xCIAID, xOPAGO: String; xFlag: String = 'X');
var
   xSQL, xWhere : String ;
begin
   cdsSQL.Close      ;
   if trim(xFlag) = '1' then
   begin
      xWhere := ' CIAID||CPANOMES||TDIARID||CPNOREG IN '                                +
                                   '(SELECT CIAID||CCPANOMM||TDIARID||CPNOREG'          +
                                   ' FROM CXP304                    '                   +
                                   ' WHERE CIAID = '''+ xCIAID + ''''                   +
                                         ' AND TCANJEID = ''OP''    '                   +
                                         ' AND CCPCANJE = '''+ xOPAGO + ''' )'          ;
      xSQL := 'UPDATE CXP301 SET FLAGVAR2 = ''' + xFLAG + ''' WHERE ' + xWhere ;
   end
   else
   begin
      xWhere := 'FLAGVAR2 = ''' + xFLAG + ''''  ;
      xSQL := 'UPDATE CXP301 SET FLAGVAR2 = '''' WHERE ' + xWhere  ;
   end  ;
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
end;

procedure TDMTE.RecUltTipoCambio(var xFecha: string);
var xSQL : String ;
begin
   xSQL :='SELECT * FROM TGE107 '                                            +
          'WHERE FECHA=(SELECT MAX(FECHA)'                                  +
                       'FROM TGE107 '                                       +
                       'WHERE FECHA<='+wRepFuncDate+''''+xFecha+''')) '+
           ' and TMONID='''+ wTmonExt + ''''             ;
   cdsRec.close;
   cdsRec.dataRequest(xSQL);
end;

procedure TDMTE.SQLAdicEgresos(const xCIAID, xECANOMM, xTDIARID, xECNOCOMP, xError: string);
var xSQL : String ;
begin
	if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
  xSQL := 'SELECT CAJA302.CIAID, TGE110.DOCDES, TGE112.FPAGOABR, TGE105.BANCOABR, ' +
              'TGE101.CIADES, TGE104.TDIARABR, TGE102.CLAUXABR, TGE217.FLUEFEABR '  +
          ' FROM CAJA302'                                                            +
             ' LEFT JOIN TGE112 ON (CAJA302.FPAGOID = TGE112.FPAGOID)'               +
             ' LEFT JOIN TGE105 ON (CAJA302.BANCOID = TGE105.BANCOID)'               +
             ' LEFT JOIN TGE110 ON (CAJA302.DOCID = TGE110.DOCID)'                   +
             ' LEFT JOIN TGE101 ON (CAJA302.CIAID = TGE101.CIAID)'                   +
             ' LEFT JOIN TGE104 ON (CAJA302.TDIARID = TGE104.TDIARID)'               +
             ' LEFT JOIN TGE102 ON (CAJA302.CLAUXID = TGE102.CLAUXID)'               +
             ' LEFT JOIN TGE217 ON (CAJA302.FLUEID = TGE217.FLUEFEID)'               +
          ' WHERE CAJA302.CIAID= '''+xCIAID+''' AND '                                +
             ' CAJA302.ECANOMM = ''' + xECANOMM + ''' AND '                          +
             ' CAJA302.TDIARID = ''' + xTDIARID + ''' AND '                          +
             ' CAJA302.ECNOCOMP= ''' + xECNOCOMP + ''''
	else
	  if DMTE.SRV_D = 'ORACLE' then
           //** 15/10/2001 - pjsv
            xSQL := 'SELECT CAJA302.CIAID, TGE110.DOCDES, TGE112.FPAGOABR, TGE105.BANCOABR, ' +
                    'TGE101.CIADES, TGE104.TDIARABR, TGE102.CLAUXABR, TGE217.FLUEFEABR '
                    // VHNDEMA
                    +', TGE105.BCOTIPCTA '  +
                    // END VHNDEMA
                    ' FROM CAJA302, TGE112, TGE105, TGE110, TGE101, TGE104, TGE102, TGE217 '  +
                    ' WHERE CAJA302.CIAID= ''' + xCIAID    +''' AND ' +
                    ' CAJA302.ECANOMM = ''' + xECANOMM  + ''' AND ' +
                    ' CAJA302.TDIARID = ''' + xTDIARID  + ''' AND ' +
                    ' CAJA302.ECNOCOMP= ''' + xECNOCOMP + '''' +
                    ' AND CAJA302.FPAGOID = TGE112.FPAGOID (+) AND' +
                    ' CAJA302.BANCOID = TGE105.BANCOID(+) AND'                 +
                    ' CAJA302.DOCID = TGE110.DOCID(+) AND ' +
                    ' CAJA302.CIAID = TGE101.CIAID(+) AND ' +
                    ' CAJA302.TDIARID = TGE104.TDIARID(+) AND' +
                    ' CAJA302.CLAUXID = TGE102.CLAUXID(+) AND' +
                    ' CAJA302.FLUEID = TGE217.FLUEFEID(+) ';
            //**
  cdsrec.close;
  cdsrec.dataRequest(xSQL);
end;

procedure TDMTE.SQLSelect(const xTabla, xCampos, xWhere: WideString);
var   xSQL : String ;
begin
   if xWhere = '' then
     xSQL := 'SELECT '+xCampos+ ' FROM '+ xTabla
   else
     xSQL := 'SELECT '+xCampos+ ' FROM '+ xTabla +' WHERE '+xWhere ;
   cdsRec.close;
   cdsRec.dataRequest(xSQL);
end;


procedure TDMTE.ActSdoAuxiliar(const xCIAID, xANO, xMES, xCLAUXID, xAUXID,MONTOMN, MONTOME, MTOSLOC, MTOSEXT, xOper: String);
var
   xWhere,xParte1,xParte2,xParte11,xParte22 : String;
   xSQL : String;
   xxSaldo13 : String;
   xxSaldo01, xxSaldo02, xxSaldo03, xxSaldo04, xxSaldo05, xxSaldo06 : String;
   xxSaldo07, xxSaldo08, xxSaldo09, xxSaldo10, xxSaldo11, xxSaldo12 : String;
   xZ : Integer;
begin
   xSQL := 'SELECT * FROM TGE401 WHERE CIAID = ''' + xCIAID + ''' AND ' +
              ' ANO     = '''+xANO+''' AND '                            +
              ' CLAUXID = '''+xCLAUXID+''' AND '                    +
              ' AUXID   = ''' + xAUXID +''' '                         ;
   cdsQry.close;
   cdsQry.ProviderName := 'prvTGE';
   DMTE.Filtracds(cdsQry,xSQL);

   if cdsQry.recordcount > 0 then
   begin
      if xOper = '+' then
      XSQL:='UPDATE TGE401 '
           +  'SET HABETMN'+XMES+'='+DMTE.wReplacCeros+'(HABETMN'+xMES+' ,0)+ '+MONTOMN+', '
           +      'HABETME'+XMES+'='+DMTE.wReplacCeros+'(HABETME'+xMES+' ,0)+ '+MONTOME+', '
           +      'HABESMN'+XMES+'='+DMTE.wReplacCeros+'(HABESMN'+xMES+' ,0)+ '+MTOSLOC+', '
           +      'HABESME'+XMES+'='+DMTE.wReplacCeros+'(HABESME'+xMES+' ,0)+ '+MTOSEXT+' '
           +'WHERE CIAID  ='''+xCIAID  +''' AND ANO    ='''+xANO    +''' AND '
           +      'CLAUXID='''+xCLAUXID+''' AND AUXID  ='''+xAUXID  +''' '
      else
      XSQL:='UPDATE TGE401 '
           +  'SET HABETMN'+XMES+'='+DMTE.wReplacCeros+'(HABETMN'+xMES+',0) + '+MONTOMN+', '
           +      'HABETME'+XMES+'='+DMTE.wReplacCeros+'(HABETME'+xMES+',0) + '+MONTOME+', '
           +      'HABESMN'+XMES+'='+DMTE.wReplacCeros+'(HABESMN'+xMES+',0) + '+MTOSLOC+', '
           +      'HABESME'+XMES+'='+DMTE.wReplacCeros+'(HABESME'+xMES+',0) + '+MTOSEXT+' '
           +'WHERE CIAID  ='''+xCIAID  +''' AND ANO    ='''+xANO    +''' AND '
           +      'CLAUXID='''+xCLAUXID+''' AND AUXID  ='''+xAUXID  +''' '
   end
   else
   begin
      XSQL:='INSERT INTO TGE401(CIAID,ANO,CLAUXID,AUXID,HABETMN'+XMES+',HABETME'+XMES +
                       ', HABESMN'+XMES+',HABESME'+XMES+')   ' +
              '            VALUES('''+XCIAID+''','''+XANO+''','''+xCLAUXID+''','''+xAUXID+''', '  +
                           MONTOMN + ','+MONTOME+','+MTOSLOC+','+MTOSEXT +')' ;
   end                                                                                           ;

   try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   // Inicio HPC_201309_CAJA
     //DMTE.ControlTran(1,nil,'')
      ShowMessage('Error al actualizar de Saldos de Auxiliar');
      xSigueGrab := False;
      exit;
   // Fin HPC_201309_CAJA
   end;

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
   xSQL := 'UPDATE TGE401 SET ';
   xxSaldo01:='( '+DMTE.wReplacCeros+'(SALDTMN00,0)+'+DMTE.wReplacCeros+'(DEBETMN01,0)-'+DMTE.wReplacCeros+'(HABETMN01,0))';
   xxSaldo02:='( '+DMTE.wReplacCeros+'(SALDTMN00,0)+'+DMTE.wReplacCeros+'(DEBETMN01,0)-'+DMTE.wReplacCeros+'(HABETMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN02,0)-'+DMTE.wReplacCeros+'(HABETMN02,0) )';
   xxSaldo03:='( '+DMTE.wReplacCeros+'(SALDTMN00,0)+'+DMTE.wReplacCeros+'(DEBETMN01,0)-'+DMTE.wReplacCeros+'(HABETMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN02,0)-'+DMTE.wReplacCeros+'(HABETMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN03,0)-'+DMTE.wReplacCeros+'(HABETMN03,0) )';
   xxSaldo04:='( '+DMTE.wReplacCeros+'(SALDTMN00,0)+'+DMTE.wReplacCeros+'(DEBETMN01,0)-'+DMTE.wReplacCeros+'(HABETMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN02,0)-'+DMTE.wReplacCeros+'(HABETMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN03,0)-'+DMTE.wReplacCeros+'(HABETMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN04,0)-'+DMTE.wReplacCeros+'(HABETMN04,0) )';
   xxSaldo05:='( '+DMTE.wReplacCeros+'(SALDTMN00,0)+'+DMTE.wReplacCeros+'(DEBETMN01,0)-'+DMTE.wReplacCeros+'(HABETMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN02,0)-'+DMTE.wReplacCeros+'(HABETMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN03,0)-'+DMTE.wReplacCeros+'(HABETMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN04,0)-'+DMTE.wReplacCeros+'(HABETMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN05,0)-'+DMTE.wReplacCeros+'(HABETMN05,0) )';
   xxSaldo06:='( '+DMTE.wReplacCeros+'(SALDTMN00,0)+'+DMTE.wReplacCeros+'(DEBETMN01,0)-'+DMTE.wReplacCeros+'(HABETMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN02,0)-'+DMTE.wReplacCeros+'(HABETMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN03,0)-'+DMTE.wReplacCeros+'(HABETMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN04,0)-'+DMTE.wReplacCeros+'(HABETMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN05,0)-'+DMTE.wReplacCeros+'(HABETMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN06,0)-'+DMTE.wReplacCeros+'(HABETMN06,0) )';
   xxSaldo07:='( '+DMTE.wReplacCeros+'(SALDTMN00,0)+'+DMTE.wReplacCeros+'(DEBETMN01,0)-'+DMTE.wReplacCeros+'(HABETMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN02,0)-'+DMTE.wReplacCeros+'(HABETMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN03,0)-'+DMTE.wReplacCeros+'(HABETMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN04,0)-'+DMTE.wReplacCeros+'(HABETMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN05,0)-'+DMTE.wReplacCeros+'(HABETMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN06,0)-'+DMTE.wReplacCeros+'(HABETMN06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN07,0)-'+DMTE.wReplacCeros+'(HABETMN07,0) )';
   xxSaldo08:='( '+DMTE.wReplacCeros+'(SALDTMN00,0)+'+DMTE.wReplacCeros+'(DEBETMN01,0)-'+DMTE.wReplacCeros+'(HABETMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN02,0)-'+DMTE.wReplacCeros+'(HABETMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN03,0)-'+DMTE.wReplacCeros+'(HABETMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN04,0)-'+DMTE.wReplacCeros+'(HABETMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN05,0)-'+DMTE.wReplacCeros+'(HABETMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN06,0)-'+DMTE.wReplacCeros+'(HABETMN06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN07,0)-'+DMTE.wReplacCeros+'(HABETMN07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN08,0)-'+DMTE.wReplacCeros+'(HABETMN08,0) )';
   xxSaldo09:='( '+DMTE.wReplacCeros+'(SALDTMN00,0)+'+DMTE.wReplacCeros+'(DEBETMN01,0)-'+DMTE.wReplacCeros+'(HABETMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN02,0)-'+DMTE.wReplacCeros+'(HABETMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN03,0)-'+DMTE.wReplacCeros+'(HABETMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN04,0)-'+DMTE.wReplacCeros+'(HABETMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN05,0)-'+DMTE.wReplacCeros+'(HABETMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN06,0)-'+DMTE.wReplacCeros+'(HABETMN06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN07,0)-'+DMTE.wReplacCeros+'(HABETMN07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN08,0)-'+DMTE.wReplacCeros+'(HABETMN08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN09,0)-'+DMTE.wReplacCeros+'(HABETMN09,0) )';
   xxSaldo10:='( '+DMTE.wReplacCeros+'(SALDTMN00,0)+'+DMTE.wReplacCeros+'(DEBETMN01,0)-'+DMTE.wReplacCeros+'(HABETMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN02,0)-'+DMTE.wReplacCeros+'(HABETMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN03,0)-'+DMTE.wReplacCeros+'(HABETMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN04,0)-'+DMTE.wReplacCeros+'(HABETMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN05,0)-'+DMTE.wReplacCeros+'(HABETMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN06,0)-'+DMTE.wReplacCeros+'(HABETMN06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN07,0)-'+DMTE.wReplacCeros+'(HABETMN07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN08,0)-'+DMTE.wReplacCeros+'(HABETMN08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN09,0)-'+DMTE.wReplacCeros+'(HABETMN09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN10,0)-'+DMTE.wReplacCeros+'(HABETMN10,0) )';
   xxSaldo11:='( '+DMTE.wReplacCeros+'(SALDTMN00,0)+'+DMTE.wReplacCeros+'(DEBETMN01,0)-'+DMTE.wReplacCeros+'(HABETMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN02,0)-'+DMTE.wReplacCeros+'(HABETMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN03,0)-'+DMTE.wReplacCeros+'(HABETMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN04,0)-'+DMTE.wReplacCeros+'(HABETMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN05,0)-'+DMTE.wReplacCeros+'(HABETMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN06,0)-'+DMTE.wReplacCeros+'(HABETMN06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN07,0)-'+DMTE.wReplacCeros+'(HABETMN07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN08,0)-'+DMTE.wReplacCeros+'(HABETMN08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN09,0)-'+DMTE.wReplacCeros+'(HABETMN09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN10,0)-'+DMTE.wReplacCeros+'(HABETMN10,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN11,0)-'+DMTE.wReplacCeros+'(HABETMN11,0) )';
   xxSaldo12:='( '+DMTE.wReplacCeros+'(SALDTMN00,0)+'+DMTE.wReplacCeros+'(DEBETMN01,0)-'+DMTE.wReplacCeros+'(HABETMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN02,0)-'+DMTE.wReplacCeros+'(HABETMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN03,0)-'+DMTE.wReplacCeros+'(HABETMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN04,0)-'+DMTE.wReplacCeros+'(HABETMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN05,0)-'+DMTE.wReplacCeros+'(HABETMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN06,0)-'+DMTE.wReplacCeros+'(HABETMN06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN07,0)-'+DMTE.wReplacCeros+'(HABETMN07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN08,0)-'+DMTE.wReplacCeros+'(HABETMN08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN09,0)-'+DMTE.wReplacCeros+'(HABETMN09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN10,0)-'+DMTE.wReplacCeros+'(HABETMN10,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN11,0)-'+DMTE.wReplacCeros+'(HABETMN11,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN12,0)-'+DMTE.wReplacCeros+'(HABETMN12,0) )';
   xxSaldo13:='( '+DMTE.wReplacCeros+'(SALDTMN00,0)+'+DMTE.wReplacCeros+'(DEBETMN01,0)-'+DMTE.wReplacCeros+'(HABETMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN02,0)-'+DMTE.wReplacCeros+'(HABETMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN03,0)-'+DMTE.wReplacCeros+'(HABETMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN04,0)-'+DMTE.wReplacCeros+'(HABETMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN05,0)-'+DMTE.wReplacCeros+'(HABETMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN06,0)-'+DMTE.wReplacCeros+'(HABETMN06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN07,0)-'+DMTE.wReplacCeros+'(HABETMN07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN08,0)-'+DMTE.wReplacCeros+'(HABETMN08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN09,0)-'+DMTE.wReplacCeros+'(HABETMN09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN10,0)-'+DMTE.wReplacCeros+'(HABETMN10,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN11,0)-'+DMTE.wReplacCeros+'(HABETMN11,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN12,0)-'+DMTE.wReplacCeros+'(HABETMN12,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETMN13,0)-'+DMTE.wReplacCeros+'(HABETMN13,0) )';
   xParte1 := 'SALDTMN01='+xxSaldo01
             + ',SALDTMN02='+xxSaldo02
             + ',SALDTMN03='+xxSaldo03
             + ',SALDTMN04='+xxSaldo04
             + ',SALDTMN05='+xxSaldo05
             + ',SALDTMN06='+xxSaldo06
             + ',SALDTMN07='+xxSaldo07
             + ',SALDTMN08='+xxSaldo08;
   xParte11 :=',SALDTMN09='+xxSaldo09
             + ',SALDTMN10='+xxSaldo10
             + ',SALDTMN11='+xxSaldo11
             + ',SALDTMN12='+xxSaldo12
             + ',SALDTMN13='+xxSaldo13;

   xxSaldo01:='( '+DMTE.wReplacCeros+'(SALDTME00,0)+'+DMTE.wReplacCeros+'(DEBETME01,0)-'+DMTE.wReplacCeros+'(HABETME01,0) )';
   xxSaldo02:='( '+DMTE.wReplacCeros+'(SALDTME00,0)+'+DMTE.wReplacCeros+'(DEBETME01,0)-'+DMTE.wReplacCeros+'(HABETME01,0) '
                                     +'+'+DMTE.wReplacCeros+'(DEBETME02,0)-'+DMTE.wReplacCeros+'(HABETME02,0) )';
   xxSaldo03:='( '+DMTE.wReplacCeros+'(SALDTME00,0)+'+DMTE.wReplacCeros+'(DEBETME01,0)-'+DMTE.wReplacCeros+'(HABETME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME02,0)-'+DMTE.wReplacCeros+'(HABETME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME03,0)-'+DMTE.wReplacCeros+'(HABETME03,0) )';
   xxSaldo04:='( '+DMTE.wReplacCeros+'(SALDTME00,0)+'+DMTE.wReplacCeros+'(DEBETME01,0)-'+DMTE.wReplacCeros+'(HABETME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME02,0)-'+DMTE.wReplacCeros+'(HABETME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME03,0)-'+DMTE.wReplacCeros+'(HABETME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME04,0)-'+DMTE.wReplacCeros+'(HABETME04,0) )';
   xxSaldo05:='( '+DMTE.wReplacCeros+'(SALDTME00,0)+'+DMTE.wReplacCeros+'(DEBETME01,0)-'+DMTE.wReplacCeros+'(HABETME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME02,0)-'+DMTE.wReplacCeros+'(HABETME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME03,0)-'+DMTE.wReplacCeros+'(HABETME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME04,0)-'+DMTE.wReplacCeros+'(HABETME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME05,0)-'+DMTE.wReplacCeros+'(HABETME05,0) )';
   xxSaldo06:='( '+DMTE.wReplacCeros+'(SALDTME00,0)+'+DMTE.wReplacCeros+'(DEBETME01,0)-'+DMTE.wReplacCeros+'(HABETME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME02,0)-'+DMTE.wReplacCeros+'(HABETME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME03,0)-'+DMTE.wReplacCeros+'(HABETME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME04,0)-'+DMTE.wReplacCeros+'(HABETME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME05,0)-'+DMTE.wReplacCeros+'(HABETME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME06,0)-'+DMTE.wReplacCeros+'(HABETME06,0) )';
   xxSaldo07:='( '+DMTE.wReplacCeros+'(SALDTME00,0)+'+DMTE.wReplacCeros+'(DEBETME01,0)-'+DMTE.wReplacCeros+'(HABETME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME02,0)-'+DMTE.wReplacCeros+'(HABETME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME03,0)-'+DMTE.wReplacCeros+'(HABETME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME04,0)-'+DMTE.wReplacCeros+'(HABETME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME05,0)-'+DMTE.wReplacCeros+'(HABETME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME06,0)-'+DMTE.wReplacCeros+'(HABETME06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME07,0)-'+DMTE.wReplacCeros+'(HABETME07,0) )';
   xxSaldo08:='( '+DMTE.wReplacCeros+'(SALDTME00,0)+'+DMTE.wReplacCeros+'(DEBETME01,0)-'+DMTE.wReplacCeros+'(HABETME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME02,0)-'+DMTE.wReplacCeros+'(HABETME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME03,0)-'+DMTE.wReplacCeros+'(HABETME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME04,0)-'+DMTE.wReplacCeros+'(HABETME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME05,0)-'+DMTE.wReplacCeros+'(HABETME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME06,0)-'+DMTE.wReplacCeros+'(HABETME06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME07,0)-'+DMTE.wReplacCeros+'(HABETME07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME08,0)-'+DMTE.wReplacCeros+'(HABETME08,0) )';
   xxSaldo09:='( '+DMTE.wReplacCeros+'(SALDTME00,0)+'+DMTE.wReplacCeros+'(DEBETME01,0)-'+DMTE.wReplacCeros+'(HABETME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME02,0)-'+DMTE.wReplacCeros+'(HABETME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME03,0)-'+DMTE.wReplacCeros+'(HABETME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME04,0)-'+DMTE.wReplacCeros+'(HABETME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME05,0)-'+DMTE.wReplacCeros+'(HABETME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME06,0)-'+DMTE.wReplacCeros+'(HABETME06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME07,0)-'+DMTE.wReplacCeros+'(HABETME07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME08,0)-'+DMTE.wReplacCeros+'(HABETME08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME09,0)-'+DMTE.wReplacCeros+'(HABETME09,0) )';
   xxSaldo10:='( '+DMTE.wReplacCeros+'(SALDTME00,0)+'+DMTE.wReplacCeros+'(DEBETME01,0)-'+DMTE.wReplacCeros+'(HABETME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME02,0)-'+DMTE.wReplacCeros+'(HABETME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME03,0)-'+DMTE.wReplacCeros+'(HABETME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME04,0)-'+DMTE.wReplacCeros+'(HABETME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME05,0)-'+DMTE.wReplacCeros+'(HABETME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME06,0)-'+DMTE.wReplacCeros+'(HABETME06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME07,0)-'+DMTE.wReplacCeros+'(HABETME07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME08,0)-'+DMTE.wReplacCeros+'(HABETME08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME09,0)-'+DMTE.wReplacCeros+'(HABETME09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME10,0)-'+DMTE.wReplacCeros+'(HABETME10,0) )';
   xxSaldo11:='( '+DMTE.wReplacCeros+'(SALDTME00,0)+'+DMTE.wReplacCeros+'(DEBETME01,0)-'+DMTE.wReplacCeros+'(HABETME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME02,0)-'+DMTE.wReplacCeros+'(HABETME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME03,0)-'+DMTE.wReplacCeros+'(HABETME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME04,0)-'+DMTE.wReplacCeros+'(HABETME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME05,0)-'+DMTE.wReplacCeros+'(HABETME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME06,0)-'+DMTE.wReplacCeros+'(HABETME06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME07,0)-'+DMTE.wReplacCeros+'(HABETME07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME08,0)-'+DMTE.wReplacCeros+'(HABETME08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME09,0)-'+DMTE.wReplacCeros+'(HABETME09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME10,0)-'+DMTE.wReplacCeros+'(HABETME10,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME11,0)-'+DMTE.wReplacCeros+'(HABETME11,0) )';
   xxSaldo12:='( '+DMTE.wReplacCeros+'(SALDTME00,0)+'+DMTE.wReplacCeros+'(DEBETME01,0)-'+DMTE.wReplacCeros+'(HABETME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME02,0)-'+DMTE.wReplacCeros+'(HABETME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME03,0)-'+DMTE.wReplacCeros+'(HABETME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME04,0)-'+DMTE.wReplacCeros+'(HABETME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME05,0)-'+DMTE.wReplacCeros+'(HABETME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME06,0)-'+DMTE.wReplacCeros+'(HABETME06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME07,0)-'+DMTE.wReplacCeros+'(HABETME07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME08,0)-'+DMTE.wReplacCeros+'(HABETME08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME09,0)-'+DMTE.wReplacCeros+'(HABETME09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME10,0)-'+DMTE.wReplacCeros+'(HABETME10,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME11,0)-'+DMTE.wReplacCeros+'(HABETME11,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME12,0)-'+DMTE.wReplacCeros+'(HABETME12,0) )';
   xxSaldo13:='( '+DMTE.wReplacCeros+'(SALDTME00,0)+'+DMTE.wReplacCeros+'(DEBETME01,0)-'+DMTE.wReplacCeros+'(HABETME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME02,0)-'+DMTE.wReplacCeros+'(HABETME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME03,0)-'+DMTE.wReplacCeros+'(HABETME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME04,0)-'+DMTE.wReplacCeros+'(HABETME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME05,0)-'+DMTE.wReplacCeros+'(HABETME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME06,0)-'+DMTE.wReplacCeros+'(HABETME06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME07,0)-'+DMTE.wReplacCeros+'(HABETME07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME08,0)-'+DMTE.wReplacCeros+'(HABETME08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME09,0)-'+DMTE.wReplacCeros+'(HABETME09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME10,0)-'+DMTE.wReplacCeros+'(HABETME10,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME11,0)-'+DMTE.wReplacCeros+'(HABETME11,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME12,0)-'+DMTE.wReplacCeros+'(HABETME12,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBETME13,0)-'+DMTE.wReplacCeros+'(HABETME13,0) ) ';
   xParte2 := 'SALDTME01='+xxSaldo01
             +',SALDTME02='+xxSaldo02
             + ',SALDTME03='+xxSaldo03
             + ',SALDTME04='+xxSaldo04
             + ',SALDTME05='+xxSaldo05
             + ',SALDTME06='+xxSaldo06
             + ',SALDTME07='+xxSaldo07;
   xParte22 := ',SALDTME08='+xxSaldo08
             + ',SALDTME09='+xxSaldo09
             + ',SALDTME10='+xxSaldo10
             + ',SALDTME11='+xxSaldo11
             + ',SALDTME12='+xxSaldo12
             + ',SALDTME13='+xxSaldo13;

  xWhere := ' WHERE CIAID='+''''+xCiaID    +''''+' AND '
               + 'ANO='        +''''+xAno    +''''+' AND '
               + 'CLAUXID='    +''''+xCLAUXID  +''''+' AND '
               + 'AUXID='      +''''+xAUXID    +'''';
   xSQL := xSQL +xParte1+xParte11+','+xParte2+xParte22+xWhere;
   xSQL := UpperCase( xSQL );
   try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   // Inicio HPC_201309_CAJA
     //DMTE.ControlTran(1,nil,'')
      ShowMessage('Error 2 al actualizar de Saldos de Auxiliar');
      xSigueGrab := False;
      exit;
   // Fin HPC_201309_CAJA
   end;

//////////////////////////////////////
//                                  //
//   Actualiza DebeSMN y HaberSME   //
//                                  //
//////////////////////////////////////
   xSQL := 'UPDATE TGE401 SET ';
   xxSaldo01:='( '+DMTE.wReplacCeros+'(SALDSMN00,0)+'+DMTE.wReplacCeros+'(DEBESMN01,0)-'+DMTE.wReplacCeros+'(HABESMN01,0) )';
   xxSaldo02:='( '+DMTE.wReplacCeros+'(SALDSMN00,0)+'+DMTE.wReplacCeros+'(DEBESMN01,0)-'+DMTE.wReplacCeros+'(HABESMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN02,0)-'+DMTE.wReplacCeros+'(HABESMN02,0) )';
   xxSaldo03:='( '+DMTE.wReplacCeros+'(SALDSMN00,0)+'+DMTE.wReplacCeros+'(DEBESMN01,0)-'+DMTE.wReplacCeros+'(HABESMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN02,0)-'+DMTE.wReplacCeros+'(HABESMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN03,0)-'+DMTE.wReplacCeros+'(HABESMN03,0) )';
   xxSaldo04:='( '+DMTE.wReplacCeros+'(SALDSMN00,0)+'+DMTE.wReplacCeros+'(DEBESMN01,0)-'+DMTE.wReplacCeros+'(HABESMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN02,0)-'+DMTE.wReplacCeros+'(HABESMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN03,0)-'+DMTE.wReplacCeros+'(HABESMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN04,0)-'+DMTE.wReplacCeros+'(HABESMN04,0) )';
   xxSaldo05:='( '+DMTE.wReplacCeros+'(SALDSMN00,0)+'+DMTE.wReplacCeros+'(DEBESMN01,0)-'+DMTE.wReplacCeros+'(HABESMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN02,0)-'+DMTE.wReplacCeros+'(HABESMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN03,0)-'+DMTE.wReplacCeros+'(HABESMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN04,0)-'+DMTE.wReplacCeros+'(HABESMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN05,0)-'+DMTE.wReplacCeros+'(HABESMN05,0) )';
   xxSaldo06:='( '+DMTE.wReplacCeros+'(SALDSMN00,0)+'+DMTE.wReplacCeros+'(DEBESMN01,0)-'+DMTE.wReplacCeros+'(HABESMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN02,0)-'+DMTE.wReplacCeros+'(HABESMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN03,0)-'+DMTE.wReplacCeros+'(HABESMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN04,0)-'+DMTE.wReplacCeros+'(HABESMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN05,0)-'+DMTE.wReplacCeros+'(HABESMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN06,0)-'+DMTE.wReplacCeros+'(HABESMN06,0) )';
   xxSaldo07:='( '+DMTE.wReplacCeros+'(SALDSMN00,0)+'+DMTE.wReplacCeros+'(DEBESMN01,0)-'+DMTE.wReplacCeros+'(HABESMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN02,0)-'+DMTE.wReplacCeros+'(HABESMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN03,0)-'+DMTE.wReplacCeros+'(HABESMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN04,0)-'+DMTE.wReplacCeros+'(HABESMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN05,0)-'+DMTE.wReplacCeros+'(HABESMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN06,0)-'+DMTE.wReplacCeros+'(HABESMN06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN07,0)-'+DMTE.wReplacCeros+'(HABESMN07,0) )';
   xxSaldo08:='( '+DMTE.wReplacCeros+'(SALDSMN00,0)+'+DMTE.wReplacCeros+'(DEBESMN01,0)-'+DMTE.wReplacCeros+'(HABESMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN02,0)-'+DMTE.wReplacCeros+'(HABESMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN03,0)-'+DMTE.wReplacCeros+'(HABESMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN04,0)-'+DMTE.wReplacCeros+'(HABESMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN05,0)-'+DMTE.wReplacCeros+'(HABESMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN06,0)-'+DMTE.wReplacCeros+'(HABESMN06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN07,0)-'+DMTE.wReplacCeros+'(HABESMN07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN08,0)-'+DMTE.wReplacCeros+'(HABESMN08,0) )';
   xxSaldo09:='( '+DMTE.wReplacCeros+'(SALDSMN00,0)+'+DMTE.wReplacCeros+'(DEBESMN01,0)-'+DMTE.wReplacCeros+'(HABESMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN02,0)-'+DMTE.wReplacCeros+'(HABESMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN03,0)-'+DMTE.wReplacCeros+'(HABESMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN04,0)-'+DMTE.wReplacCeros+'(HABESMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN05,0)-'+DMTE.wReplacCeros+'(HABESMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN06,0)-'+DMTE.wReplacCeros+'(HABESMN06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN07,0)-'+DMTE.wReplacCeros+'(HABESMN07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN08,0)-'+DMTE.wReplacCeros+'(HABESMN08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN09,0)-'+DMTE.wReplacCeros+'(HABESMN09,0) )';
   xxSaldo10:='( '+DMTE.wReplacCeros+'(SALDSMN00,0)+'+DMTE.wReplacCeros+'(DEBESMN01,0)-'+DMTE.wReplacCeros+'(HABESMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN02,0)-'+DMTE.wReplacCeros+'(HABESMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN03,0)-'+DMTE.wReplacCeros+'(HABESMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN04,0)-'+DMTE.wReplacCeros+'(HABESMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN05,0)-'+DMTE.wReplacCeros+'(HABESMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN06,0)-'+DMTE.wReplacCeros+'(HABESMN06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN07,0)-'+DMTE.wReplacCeros+'(HABESMN07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN08,0)-'+DMTE.wReplacCeros+'(HABESMN08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN09,0)-'+DMTE.wReplacCeros+'(HABESMN09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN10,0)-'+DMTE.wReplacCeros+'(HABESMN10,0) )';
   xxSaldo11:='( '+DMTE.wReplacCeros+'(SALDSMN00,0)+'+DMTE.wReplacCeros+'(DEBESMN01,0)-'+DMTE.wReplacCeros+'(HABESMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN02,0)-'+DMTE.wReplacCeros+'(HABESMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN03,0)-'+DMTE.wReplacCeros+'(HABESMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN04,0)-'+DMTE.wReplacCeros+'(HABESMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN05,0)-'+DMTE.wReplacCeros+'(HABESMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN06,0)-'+DMTE.wReplacCeros+'(HABESMN06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN07,0)-'+DMTE.wReplacCeros+'(HABESMN07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN08,0)-'+DMTE.wReplacCeros+'(HABESMN08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN09,0)-'+DMTE.wReplacCeros+'(HABESMN09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN10,0)-'+DMTE.wReplacCeros+'(HABESMN10,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN11,0)-'+DMTE.wReplacCeros+'(HABESMN11,0) )';
   xxSaldo12:='( '+DMTE.wReplacCeros+'(SALDSMN00,0)+'+DMTE.wReplacCeros+'(DEBESMN01,0)-'+DMTE.wReplacCeros+'(HABESMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN02,0)-'+DMTE.wReplacCeros+'(HABESMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN03,0)-'+DMTE.wReplacCeros+'(HABESMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN04,0)-'+DMTE.wReplacCeros+'(HABESMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN05,0)-'+DMTE.wReplacCeros+'(HABESMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN06,0)-'+DMTE.wReplacCeros+'(HABESMN06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN07,0)-'+DMTE.wReplacCeros+'(HABESMN07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN08,0)-'+DMTE.wReplacCeros+'(HABESMN08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN09,0)-'+DMTE.wReplacCeros+'(HABESMN09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN10,0)-'+DMTE.wReplacCeros+'(HABESMN10,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN11,0)-'+DMTE.wReplacCeros+'(HABESMN11,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN12,0)-'+DMTE.wReplacCeros+'(HABESMN12,0) )';
   xxSaldo13:='( '+DMTE.wReplacCeros+'(SALDSMN00,0)+'+DMTE.wReplacCeros+'(DEBESMN01,0)-'+DMTE.wReplacCeros+'(HABESMN01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN02,0)-'+DMTE.wReplacCeros+'(HABESMN02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN03,0)-'+DMTE.wReplacCeros+'(HABESMN03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN04,0)-'+DMTE.wReplacCeros+'(HABESMN04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN05,0)-'+DMTE.wReplacCeros+'(HABESMN05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN06,0)-'+DMTE.wReplacCeros+'(HABESMN06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN07,0)-'+DMTE.wReplacCeros+'(HABESMN07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN08,0)-'+DMTE.wReplacCeros+'(HABESMN08,0) '
 																	 +'+'+DMTE.wReplacCeros+'(DEBESMN09,0)-'+DMTE.wReplacCeros+'(HABESMN09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN10,0)-'+DMTE.wReplacCeros+'(HABESMN10,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN11,0)-'+DMTE.wReplacCeros+'(HABESMN11,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN12,0)-'+DMTE.wReplacCeros+'(HABESMN12,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESMN13,0)-'+DMTE.wReplacCeros+'(HABESMN13,0) )';
   xParte1 := 'SALDSMN01='+xxSaldo01
              +',SALDSMN02='+xxSaldo02
              + ',SALDSMN03='+xxSaldo03
              + ',SALDSMN04='+xxSaldo04
              + ',SALDSMN05='+xxSaldo05
              + ',SALDSMN06='+xxSaldo06
              + ',SALDSMN07='+xxSaldo07
              + ',SALDSMN08='+xxSaldo08;
   xParte11 := ',SALDSMN09='+xxSaldo09
              + ',SALDSMN10='+xxSaldo10
              + ',SALDSMN11='+xxSaldo11
              + ',SALDSMN12='+xxSaldo12
              + ',SALDSMN13='+xxSaldo13;
 
   xxSaldo01:='( '+DMTE.wReplacCeros+'(SALDSME00,0)+'+DMTE.wReplacCeros+'(DEBESME01,0)-'+DMTE.wReplacCeros+'(HABESME01,0) )';
   xxSaldo02:='( '+DMTE.wReplacCeros+'(SALDSME00,0)+'+DMTE.wReplacCeros+'(DEBESME01,0)-'+DMTE.wReplacCeros+'(HABESME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME02,0)-'+DMTE.wReplacCeros+'(HABESME02,0) )';
   xxSaldo03:='( '+DMTE.wReplacCeros+'(SALDSME00,0)+'+DMTE.wReplacCeros+'(DEBESME01,0)-'+DMTE.wReplacCeros+'(HABESME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME02,0)-'+DMTE.wReplacCeros+'(HABESME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME03,0)-'+DMTE.wReplacCeros+'(HABESME03,0) )';
   xxSaldo04:='( '+DMTE.wReplacCeros+'(SALDSME00,0)+'+DMTE.wReplacCeros+'(DEBESME01,0)-'+DMTE.wReplacCeros+'(HABESME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME02,0)-'+DMTE.wReplacCeros+'(HABESME02,0) '
 																	 +'+'+DMTE.wReplacCeros+'(DEBESME03,0)-'+DMTE.wReplacCeros+'(HABESME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME04,0)-'+DMTE.wReplacCeros+'(HABESME04,0) )';
   xxSaldo05:='( '+DMTE.wReplacCeros+'(SALDSME00,0)+'+DMTE.wReplacCeros+'(DEBESME01,0)-'+DMTE.wReplacCeros+'(HABESME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME02,0)-'+DMTE.wReplacCeros+'(HABESME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME03,0)-'+DMTE.wReplacCeros+'(HABESME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME04,0)-'+DMTE.wReplacCeros+'(HABESME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME05,0)-'+DMTE.wReplacCeros+'(HABESME05,0) )';
   xxSaldo06:='( '+DMTE.wReplacCeros+'(SALDSME00,0)+'+DMTE.wReplacCeros+'(DEBESME01,0)-'+DMTE.wReplacCeros+'(HABESME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME02,0)-'+DMTE.wReplacCeros+'(HABESME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME03,0)-'+DMTE.wReplacCeros+'(HABESME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME04,0)-'+DMTE.wReplacCeros+'(HABESME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME05,0)-'+DMTE.wReplacCeros+'(HABESME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME06,0)-'+DMTE.wReplacCeros+'(HABESME06,0) )';
   xxSaldo07:='( '+DMTE.wReplacCeros+'(SALDSME00,0)+'+DMTE.wReplacCeros+'(DEBESME01,0)-'+DMTE.wReplacCeros+'(HABESME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME02,0)-'+DMTE.wReplacCeros+'(HABESME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME03,0)-'+DMTE.wReplacCeros+'(HABESME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME04,0)-'+DMTE.wReplacCeros+'(HABESME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME05,0)-'+DMTE.wReplacCeros+'(HABESME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME06,0)-'+DMTE.wReplacCeros+'(HABESME06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME07,0)-'+DMTE.wReplacCeros+'(HABESME07,0) )';
   xxSaldo08:='( '+DMTE.wReplacCeros+'(SALDSME00,0)+'+DMTE.wReplacCeros+'(DEBESME01,0)-'+DMTE.wReplacCeros+'(HABESME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME02,0)-'+DMTE.wReplacCeros+'(HABESME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME03,0)-'+DMTE.wReplacCeros+'(HABESME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME04,0)-'+DMTE.wReplacCeros+'(HABESME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME05,0)-'+DMTE.wReplacCeros+'(HABESME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME06,0)-'+DMTE.wReplacCeros+'(HABESME06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME07,0)-'+DMTE.wReplacCeros+'(HABESME07,0) '
 																	 +'+'+DMTE.wReplacCeros+'(DEBESME08,0)-'+DMTE.wReplacCeros+'(HABESME08,0) )';
   xxSaldo09:='( '+DMTE.wReplacCeros+'(SALDSME00,0)+'+DMTE.wReplacCeros+'(DEBESME01,0)-'+DMTE.wReplacCeros+'(HABESME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME02,0)-'+DMTE.wReplacCeros+'(HABESME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME03,0)-'+DMTE.wReplacCeros+'(HABESME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME04,0)-'+DMTE.wReplacCeros+'(HABESME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME05,0)-'+DMTE.wReplacCeros+'(HABESME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME06,0)-'+DMTE.wReplacCeros+'(HABESME06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME07,0)-'+DMTE.wReplacCeros+'(HABESME07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME08,0)-'+DMTE.wReplacCeros+'(HABESME08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME09,0)-'+DMTE.wReplacCeros+'(HABESME09,0) )';
   xxSaldo10:='( '+DMTE.wReplacCeros+'(SALDSME00,0)+'+DMTE.wReplacCeros+'(DEBESME01,0)-'+DMTE.wReplacCeros+'(HABESME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME02,0)-'+DMTE.wReplacCeros+'(HABESME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME03,0)-'+DMTE.wReplacCeros+'(HABESME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME04,0)-'+DMTE.wReplacCeros+'(HABESME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME05,0)-'+DMTE.wReplacCeros+'(HABESME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME06,0)-'+DMTE.wReplacCeros+'(HABESME06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME07,0)-'+DMTE.wReplacCeros+'(HABESME07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME08,0)-'+DMTE.wReplacCeros+'(HABESME08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME09,0)-'+DMTE.wReplacCeros+'(HABESME09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME10,0)-'+DMTE.wReplacCeros+'(HABESME10,0) )';
   xxSaldo11:='( '+DMTE.wReplacCeros+'(SALDSME00,0)+'+DMTE.wReplacCeros+'(DEBESME01,0)-'+DMTE.wReplacCeros+'(HABESME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME02,0)-'+DMTE.wReplacCeros+'(HABESME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME03,0)-'+DMTE.wReplacCeros+'(HABESME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME04,0)-'+DMTE.wReplacCeros+'(HABESME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME05,0)-'+DMTE.wReplacCeros+'(HABESME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME06,0)-'+DMTE.wReplacCeros+'(HABESME06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME07,0)-'+DMTE.wReplacCeros+'(HABESME07,0) '
 																	 +'+'+DMTE.wReplacCeros+'(DEBESME08,0)-'+DMTE.wReplacCeros+'(HABESME08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME09,0)-'+DMTE.wReplacCeros+'(HABESME09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME10,0)-'+DMTE.wReplacCeros+'(HABESME10,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME11,0)-'+DMTE.wReplacCeros+'(HABESME11,0) )';
   xxSaldo12:='( '+DMTE.wReplacCeros+'(SALDSME00,0)+'+DMTE.wReplacCeros+'(DEBESME01,0)-'+DMTE.wReplacCeros+'(HABESME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME02,0)-'+DMTE.wReplacCeros+'(HABESME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME03,0)-'+DMTE.wReplacCeros+'(HABESME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME04,0)-'+DMTE.wReplacCeros+'(HABESME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME05,0)-'+DMTE.wReplacCeros+'(HABESME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME06,0)-'+DMTE.wReplacCeros+'(HABESME06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME07,0)-'+DMTE.wReplacCeros+'(HABESME07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME08,0)-'+DMTE.wReplacCeros+'(HABESME08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME09,0)-'+DMTE.wReplacCeros+'(HABESME09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME10,0)-'+DMTE.wReplacCeros+'(HABESME10,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME11,0)-'+DMTE.wReplacCeros+'(HABESME11,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME12,0)-'+DMTE.wReplacCeros+'(HABESME12,0) )';
   xxSaldo13:='( '+DMTE.wReplacCeros+'(SALDSME00,0)+'+DMTE.wReplacCeros+'(DEBESME01,0)-'+DMTE.wReplacCeros+'(HABESME01,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME02,0)-'+DMTE.wReplacCeros+'(HABESME02,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME03,0)-'+DMTE.wReplacCeros+'(HABESME03,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME04,0)-'+DMTE.wReplacCeros+'(HABESME04,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME05,0)-'+DMTE.wReplacCeros+'(HABESME05,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME06,0)-'+DMTE.wReplacCeros+'(HABESME06,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME07,0)-'+DMTE.wReplacCeros+'(HABESME07,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME08,0)-'+DMTE.wReplacCeros+'(HABESME08,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME09,0)-'+DMTE.wReplacCeros+'(HABESME09,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME10,0)-'+DMTE.wReplacCeros+'(HABESME10,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME11,0)-'+DMTE.wReplacCeros+'(HABESME11,0) '
 																	 +'+'+DMTE.wReplacCeros+'(DEBESME12,0)-'+DMTE.wReplacCeros+'(HABESME12,0) '
                                    +'+'+DMTE.wReplacCeros+'(DEBESME13,0)-'+DMTE.wReplacCeros+'(HABESME13,0) ) ';
   xParte2 := 'SALDSME01='+xxSaldo01
              +',SALDSME02='+xxSaldo02
              + ',SALDSME03='+xxSaldo03
              + ',SALDSME04='+xxSaldo04
              + ',SALDSME05='+xxSaldo05
              + ',SALDSME06='+xxSaldo06
              + ',SALDSME07='+xxSaldo07
              + ',SALDSME08='+xxSaldo08;
   xParte22 :=',SALDSME09='+xxSaldo09
              + ',SALDSME10='+xxSaldo10
              + ',SALDSME11='+xxSaldo11
              + ',SALDSME12='+xxSaldo12
              + ',SALDSME13='+xxSaldo13;

   xWhere := ' WHERE CIAID='+''''+xCiaID    +''''+' AND '
               + 'ANO='        +''''+xAno    +''''+' AND '
               + 'CLAUXID='    +''''+xCLAUXID  +''''+' AND '
               + 'AUXID='      +''''+xAUXID    +'''';
   xSQL := xSQL +xParte1+xParte11+','+xParte2+xParte22+xWhere;
   xSQL := UpperCase( xSQL );
   try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   // Inicio HPC_201309_CAJA
     //DMTE.ControlTran(1,nil,'')
      ShowMessage('Error 3 al actualizar de Saldos de Auxiliar');
      xSigueGrab := False;
      exit;
   // Fin HPC_201309_CAJA
   end;
end;


function TDMTE.MesCerrado(xMes, xAno, xCiaid: String): Boolean;
var
 xSql : String;
begin
  xSql := 'SELECT PER'+strzero(xMes,2)+' FROM TGE154 WHERE CIAID='+QuotedStr(xCiaid)+
          ' AND ANO='+QuotedStr(xAno);
  cds1.Close;
  cds1.DataRequest(xSql);
  cds1.Open;
  If cds1.FieldByName('PER'+strzero(xMes,2)).AsString = 'S' then
   result := True
  else result := False;
end;


procedure cdsPost(xxCds:TwwClientDataSet);
Var
  i:integer;
Begin
  For i:=0 to xxCds.Fields.Count-1 Do
    Begin
      If xxCds.Fields[i].ClassType=TStringField Then
        Begin
          If (xxCds.Fields[i].AsString='') Then
						xxCds.Fields[i].CLEAR;
				end;

			If xxCds.Fields[i].ClassType=TMemoField Then
				Begin
					If (xxCds.Fields[i].AsString='') or (xxCds.Fields[i].AsString=' ') Then xxCds.Fields[i].AsString:='.';
				end;

		end;
end;

procedure ActualizaCNT311(pCiaid,pTdiarid,pComprob,pperiodo : String);
Var
   xValores, xSQL, xWhereCnt: String;
Begin
// Inicio HPC_201401_CAJ  Reordenamiento de la sangría a todo el formulario
//                        Asignación de Control Transaccional, retiro de rutina APLICADATOS y CONTROLTRAN
   xSQL := 'delete from CNT300 '
         + ' where CIAID='+quotedstr(pCiaid)
         + '   and TDIARID='+quotedstr(pTdiarid)
         + '   and CNTANOMM='+quotedstr(pPeriodo)
         + '   and CNTCOMPROB='+quotedstr(pComprob);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xSQL := 'delete from CNT311 '
         + ' where CIAID='+quotedstr(pCiaid)
         + '   and TDIARID='+quotedstr(pTdiarid)
         + '   and CNTANOMM='+quotedstr(pPeriodo)
         + '   and CNTCOMPROB='+quotedstr(pComprob);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xSQL := 'delete from CNT301 '
         + ' where CIAID='+quotedstr(pCiaid)
         + '   and TDIARID='+quotedstr(pTdiarid)
         + '   and CNTANOMM='+quotedstr(pPeriodo)
         + '   and CNTCOMPROB='+quotedstr(pComprob);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xSQL := 'Select ECPERREC '
         + '  from CAJA302 '
         + ' where CIAID='+quotedstr(pCiaid)
         + '   and TDIARID='+quotedstr(pTdiarid)
         + '   and ECANOMM='+quotedstr(pPeriodo)
         + '   and ECNOCOMP='+quotedstr(pComprob);
   DMTE.cdsQry3.Close;
   DMTE.cdsQry3.DataRequest(xSQL);
   DMTE.cdsQry3.Open;

   If DMTE.cdsQry3.FieldByName('ECPERREC').AsString <> '' Then
   Begin
      xWhereCnt := '( CIAID=' + QuotedStr(Copy(DMTE.cdsQry3.FieldByName('ECPERREC').AsString, 4, 2))
              + ' AND CNTANOMM=' + QuotedStr(pPeriodo)
              + ' AND TDIARID=' + QuotedStr(Copy(DMTE.cdsQry3.FieldByName('ECPERREC').AsString, 7, 2))
              + ' AND CNTCOMPROB=' + QuotedStr(Copy(DMTE.cdsQry3.FieldByName('ECPERREC').AsString, 10, 10)) + ' ) '
              + ' or '
              + '   ( CIAID=' + QuotedStr(Copy(DMTE.cdsQry3.FieldByName('ECPERREC').AsString, 25, 2))
              + ' AND CNTANOMM=' + QuotedStr(pPeriodo)
              + ' AND TDIARID=' + QuotedStr(Copy(DMTE.cdsQry3.FieldByName('ECPERREC').AsString, 28, 2))
              + ' AND CNTCOMPROB=' + QuotedStr(Copy(DMTE.cdsQry3.FieldByName('ECPERREC').AsString, 31, 10)) + ' ) ';

      xSQL := 'delete from CNT300 Where ' + xWhereCnt;
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
      End;

      xSQL := 'delete from CNT311 Where ' + xWhereCnt;
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
      End;

      xSQL := 'delete from CNT301 Where ' + xWhereCnt;
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
      End;

      xWhereCnt := '( CIAID=' + QuotedStr(Copy(DMTE.cdsQry3.FieldByName('ECPERREC').AsString, 4, 2))
              + ' AND ECANOMM=' + QuotedStr(pPeriodo)
              + ' AND TDIARID=' + QuotedStr(Copy(DMTE.cdsQry3.FieldByName('ECPERREC').AsString, 7, 2))
              + ' AND ECNOCOMP=' + QuotedStr(Copy(DMTE.cdsQry3.FieldByName('ECPERREC').AsString, 10, 10)) + ' ) '
              + ' or '
              + '   ( CIAID=' + QuotedStr(Copy(DMTE.cdsQry3.FieldByName('ECPERREC').AsString, 25, 2))
              + ' AND ECANOMM=' + QuotedStr(pPeriodo)
              + ' AND TDIARID=' + QuotedStr(Copy(DMTE.cdsQry3.FieldByName('ECPERREC').AsString, 28, 2))
              + ' AND ECNOCOMP=' + QuotedStr(Copy(DMTE.cdsQry3.FieldByName('ECPERREC').AsString, 31, 10)) + ' ) ';

      xSQL := 'delete from CAJA302 Where ' + xWhereCnt;
      Try
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      Except
      End;
   End;

   xSql := 'Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, '
         + '                   AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, '
         + '                   CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTCUADRE, CNTUSER, CCOSID, '
         + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTSS, CNTSEM, CNTTRI, CNTAASS, CNTAASEM, '
         + '                   CNTAATRI, TMONID, CNTMODDOC, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
         + '                   TDIARDES, CTADES, DOCDES, MODULO, CNTREG ) '
         + 'Select A.CIAID, A.TDIARID, ECNOCOMP, DCANO, ECANOMM, DCLOTE, A.CUENTAID, CLAUXID, '
         + '       DCAUXID, A.DOCID, DCSERIE, DCNODOC, DCGLOSA, DCDH, DCTCAMPA, DCMTOORI, DCMTOLO, '
         + '       DCMTOEXT, DCFEMIS, DCFVCMTO, ECFCOMP, NVL(DCFLAAUT,' + QuotedStr('N') + '), '
                 + QuotedStr(DMTE.wUsuario) + ', A.CCOSID, '
                 + DMTE.wRepFecServi + ', ' + DMTE.wRepHorServi + ', DCMM, DCDD, DCSS, DCSEM, DCTRI, '
         + '       DCAASS, DCAASEM, DCAATRI, TMONID, A.DOCMOD, '
         + '       CASE WHEN DCDH=''D'' THEN DCMTOLO ELSE 0 END, CASE WHEN DCDH=''D'' THEN DCMTOEXT ELSE 0 END, '
         + '       CASE WHEN DCDH=''H'' THEN DCMTOLO ELSE 0 END, CASE WHEN DCDH=''H'' THEN DCMTOEXT ELSE 0 END, '
         + '       D.TDIARABR , C.CTAABR, B.DOCABR, ''' + DMTE.wModulo + ''', NREG '
         + '  from CAJA304 A, TGE110 B, TGE202 C, TGE104 D '
         + ' where A.CIAID='+quotedstr(pCiaid)
         + '   and A.TDIARID='+quotedstr(pTdiarid)
         + '   and A.ECANOMM='+quotedstr(pPeriodo)
         + '   and A.ECNOCOMP='+quotedstr(pComprob)
         + '   and B.DOCID(+)=A.DOCID '
         + '   and B.DOCMOD(+)=''CAJA'' '
         + '   and C.CIAID(+)=A.CIAID '
         + '   and C.CUENTAID(+)=A.CUENTAID '
         + '   and D.TDIARID(+)=A.TDIARID ';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      Screen.Cursor := crDefault;
      ShowMessage('No se pudo añadir al archivo de Contabilidad (CNT311)');
      xSigueGrab := False;
      exit;
   End;

   xSQL := 'Select * '
          +'  from CNT311 A '
          +' where A.CIAID=' + QuotedStr(pCiaid)
          +'   and A.CNTANOMM=' + QuotedStr(pPeriodo)
          +'   and A.TDIARID=' + QuotedStr(pTdiarid)
          +'   and A.CNTCOMPROB=' + QuotedStr(pComprob)
          +' order BY A.CNTREG';
   DMTE.cdsCNT311.Filter := '';
   DMTE.cdsCNT311.Filtered := false;
   DMTE.cdsCNT311.IndexFieldNames := '';
   DMTE.cdsCNT311.Close;
   DMTE.cdsCNT311.DataRequest(xSQL);
   DMTE.cdsCNT311.Open;

   xSQL := 'Select A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, '
         + '       A.CNTGLOSA, A.CNTTCAMBIO, CNTESTADO, A.CNTFCOMP, C.TMONDES, '
         + '       A.TMONID, B.CCBCOID, B.ECNOCHQ, B.ECGIRA, ECMTOORI, '
         + '       C.TMONDES, C.TMONABR, B.PROV||''  ''||D.AUXNOMB PROV, B.BANCOID||'' ''||E.BANCONOM BANCOID '
         + '  from CNT311 A, CAJA302 B, TGE103 C, CNT201 D, TGE105 E '
         + ' where A.CIAID='+quotedstr(DMTE.cdsCNT311.FieldByName('CIAID').AsString)
         + '   and A.TDIARID='+quotedstr(DMTE.cdsCNT311.FieldByName('TDIARID').AsString)
         + '   and A.CNTANOMM='+quotedstr(DMTE.cdsCNT311.FieldByName('CNTANOMM').AsString)
         + '   and A.CNTCOMPROB='+quotedstr(DMTE.cdsCNT311.FieldByName('CNTCOMPROB').AsString)
         + '   and A.CNTREG=1 '
         + '   and B.CIAID='+quotedstr(DMTE.cdsCNT311.FieldByName('CIAID').AsString)
         + '   and B.TDIARID='+quotedstr(DMTE.cdsCNT311.FieldByName('TDIARID').AsString)
         + '   and B.ECANOMM='+quotedstr(DMTE.cdsCNT311.FieldByName('CNTANOMM').AsString)
         + '   and B.ECNOCOMP='+quotedstr(DMTE.cdsCNT311.FieldByName('CNTCOMPROB').AsString)
         + '   and B.ECESTADO<>''A'' '
         + '   and C.TMONID=A.TMONID '
         + '   and D.CLAUXID(+)=B.CLAUXID AND D.AUXID(+)=B.PROV '
         + '   and E.BANCOID=B.BANCOID ';
   DMTE.cdsQry3.Close;
   DMTE.cdsQry3.DataRequest(xSQL);
   DMTE.cdsQry3.Open;
// Fin HPC_201401_CAJ
end;

function TDMTE.RecuperaDescripcionAno(xAno: string): string;
var
   xSQL : string;
begin
   Result:='';
   xSQL := 'SELECT GLOSA FROM TGE185 '+
           'WHERE ANIO ='+QuotedStr(xAno);
   cdsQry.Close;
   cdsQry.ProviderName:='prvTGE';
   cdsQry.DataRequest(xSQL);
	 cdsQry.Open;
	 if cdsQry.RecordCount=0 then
			exit;
	 Result:=cdsQry.FieldByName('GLOSA').AsString;
end;

// Inicio HPC_201603_CAJA
// 27/06/2016 Reordena sangría de procedimiento IMPRIMEVOUCHER
//            Añade Texto en Voucher de Caja para invitar a ver Retenciones IGV por Web de Derrama
procedure ImprimeVoucher( xTabCNT, cCia, cAAMM, cTD, cCMP, cGlosa  : String );
var
   x10 : Integer;
   CNTDet, xSQL, mes, ano, MESDES, xWA, cMsgDet : String;
   xImporte : Double;
begin
   try
     CNTDet:=xTabCNT;
     if (CNTDet='CNT301G') or (CNTDet='CNT311G') then
        DMTE.pprVoucher.TEMPLATE.FileName:=DMTE.wRutaCNT + '\ComprobanteCajaGlobal.rtm'
     else
        DMTE.pprVoucher.TEMPLATE.FileName:=DMTE.wRutaCNT + '\ComprobanteCaja.rtm';
     DMTE.pprVoucher.template.LoadFromFile ;

     xWA:='';
     if CNTDet='CNT301' then
     begin
        if DMTE.cdsEgrCaja.Active then
        begin
           if Copy( DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString,1,2)='1.' then
           begin
              xWA:='or '
              +'( A.CIAID='     +QuotedStr(Copy(DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString, 4, 2))+' AND '
              +  'A.CNTANOMM='  +QuotedStr( cAAMM  )            +' AND '
              +  'A.TDIARID='   +QuotedStr(Copy(DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString, 7, 2))+' AND '
              +  'A.CNTCOMPROB='+QuotedStr(Copy(DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString,10,10))+' AND '
              +  'A.CIAID=B.CIAID ) '
              +'or '
              +'( A.CIAID='     +QuotedStr(Copy(DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString,25, 2))+' AND '
              +  'A.CNTANOMM='  +QuotedStr( cAAMM  )            +' AND '
              +  'A.TDIARID='   +QuotedStr(Copy(DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString,28, 2))+' AND '
              +  'A.CNTCOMPROB='+QuotedStr(Copy(DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString,31,10))+' AND '
              +  'A.CIAID=B.CIAID ) ';
              DMTE.pplCmp.caption:= DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString;
           end;

           if Copy( DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString,1,4)='TCC.' then
           begin
              xSQL:='Select  CIAID, TDIARID, ECANOMM, ECNOCOMP '
                    +'From CAJA314 '
                    +'Where CIAID='''+cCia+''' and LICOID='''+DMTE.cdsIngDocs.fieldBYName('LICOID').AsString+''' AND CCBCOID<>'''' '
                    +'GROUP BY CIAID, TDIARID, ECANOMM, ECNOCOMP';

              DMTE.cdsEgrcaja2.Close;
              DMTE.cdsEgrcaja2.DataRequest( xSQL );
              DMTE.cdsEgrcaja2.Open;

              xWA:='';
              while not DMTE.cdsEgrcaja2.Eof do
              begin
                  xWA:=xWA+' or '
                   +'( A.CIAID='     +QuotedStr( DMTE.cdsEgrCaja2.FieldByName('CIAID').AsString   )+' AND '
                   +  'A.CNTANOMM='  +QuotedStr( cAAMM  )                                         +' AND '
                   +  'A.TDIARID='   +QuotedStr( DMTE.cdsEgrCaja2.FieldByName('TDIARID').AsString )+' AND '
                   +  'A.CNTCOMPROB='+QuotedStr( DMTE.cdsEgrCaja2.FieldByName('ECNOCOMP').AsString)+' AND '
                   +  'A.CIAID=B.CIAID ) ';
                  DMTE.cdsEgrcaja2.Next;
              end;
              // Por el momento se cambia para que imprima los asientos de uno en uno
              xWA:='';
              //DMTE.pplCmp.caption       := DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString;
           end;
        end;

        xsql:='Select A.*, B.CIADES, '
           +  ' ''                                                                                                                                                                        '' DATOS_RET '
           +  '  from CNT301 A, TGE101 B '
           +  ' where (A.CIAID='+QuotedStr(cCia)
           +  '   and A.CNTANOMM='+QuotedStr(cAAMM )
           +  '   and A.TDIARID='+QuotedStr(cTD)
           +  '   and A.CNTCOMPROB='+QuotedStr(cCMP)
           +  '   and A.CIAID=B.CIAID ) '
           +  xWA
           +  ' order by A.CIAID, A.CNTANOMM, A.TDIARID, A.CNTCOMPROB, A.CNTREG';
        DMTE.cdsCNT311.Close;
        DMTE.cdsCNT311.DataRequest(xSQL);
        DMTE.cdsCNT311.Open;

        xSQL:= 'Select A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, '
           +   '       A.CNTGLOSA, A.CNTTCAMBIO, CNTESTADO, A.CNTFCOMP, '
           +   '       A.TMONID, B.CCBCOID, B.ECNOCHQ, B.ECGIRA, ECMTOORI, '
           +   '       C.TMONDES, C.TMONABR, B.PROV||''  ''||D.AUXNOMB PROV, B.BANCOID||'' ''||E.BANCONOM BANCOID '
           +   '  from '+CNTDet+' A, CAJA302 B, CNT201 D, TGE103 C, TGE105 E '
           +   ' where A.CIAID='+quotedstr(cCia)
           +   '   and A.TDIARID='+quotedstr(cTD)
           +   '   and A.CNTANOMM='+quotedstr(cAAMM)
           +   '   and A.CNTCOMPROB='+quotedstr(cCMP)
           +   '   and A.CNTREG=1 '
           +   '   and B.CIAID='+quotedstr(cCia)
           +   '   and B.TDIARID='+quotedstr(cTD)
           +   '   and B.ECANOMM='+quotedstr(cAAMM)
           +   '   and B.ECNOCOMP='+quotedstr(cCMP)
           +   '   and C.TMONID=A.TMONID '
           +   '   and D.CLAUXID(+)=A.CLAUXID AND D.AUXID(+)=A.AUXID '
           +   '   and E.BANCOID=B.BANCOID ';
        DMTE.cdsQry3.Close;
        DMTE.cdsQry3.DataRequest( xSQL );
        DMTE.cdsQry3.Open;
     end;

     if (CNTDet='CNT301G') or (CNTDet='CNT311G') then
     begin
        xsql:='Select A.*, B.CIADES, '
            + ' ''                                                                                                                                                                        '' DATOS_RET '
            + '  from CNT301 A, TGE101 B  '
            + ' where ( A.CIAID='+QuotedStr(cCia)
            + '   and A.CNTANOMM='+QuotedStr(cAAMM)
            + '   and A.TDIARID='+QuotedStr(cTD)
            + '   and A.CNTCOMPROB='+QuotedStr(cCMP)
            + '   and A.CIAID=B.CIAID ) '
            +    xWA
            + ' order by A.CIAID, A.CNTANOMM, A.TDIARID, A.CNTCOMPROB, A.CNTREG';
        DMTE.cdsCNT311.Close;
        DMTE.cdsCNT311.DataRequest(xSQL);
        DMTE.cdsCNT311.Open;

        xSQL:= 'Select A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, '
           +   '       A.CNTGLOSA, A.CNTTCAMBIO, CNTESTADO, A.CNTFCOMP, '
           +   '       A.TMONID, B.CCBCOID, B.ECNOCHQ, B.ECGIRA, ECMTOORI, B.PROV PROVID, B.ECNOCOMPR, '
           +   '       C.TMONDES, C.TMONABR, B.PROV||''  ''||D.AUXNOMB PROV, B.BANCOID||'' ''||E.BANCONOM BANCOID '
           +   '  from '+Copy(CNTDet,1,6)+' A, CAJA302 B, CNT201 D, TGE103 C, TGE105 E '
           +   ' where A.CIAID='+quotedStr(cCia)
           +   '   and A.TDIARID='+quotedStr(cTD)
           +   '   and A.CNTANOMM='+quotedStr(cAAMM)
           +   '   and A.CNTCOMPROB='+quotedStr(cCMP)
           +   '   and A.CNTREG=1 '
           +   '   and B.CIAID='+quotedStr(cCia)
           +   '   and B.TDIARID='+quotedStr(cTD)
           +   '   and B.ECANOMM='+quotedStr(cAAMM)
           +   '   and B.ECNOCOMP='+quotedStr(cCMP)
           +   '   and C.TMONID=A.TMONID '
           +   '   and D.CLAUXID(+)=A.CLAUXID AND D.AUXID(+)=A.AUXID '
           +   '   and E.BANCOID=B.BANCOID ';
        DMTE.cdsQry3.Close;
        DMTE.cdsQry3.DataRequest( xSQL );
        DMTE.cdsQry3.Open;

        cMsgDet:='N';
        if DMTE.cdsQry3.FieldByname('ECNOCOMPR').AsString<>'' then
           cMsgDet:='S';

        if (CNTDet='CNT301G') then
        begin
            If cTD <> '07' Then
            Begin
               xSQL:='Select * '
                  +'    from CAJA302 '
                  +'   where ECANOMM='+quotedstr(cAAMM)
                  +'     and TDIARID='+quotedstr(cTD)
                  +'     and PROV='+quotedstr(DMTE.cdsQry3.FieldByName('PROVID').AsString)
                  +'     and ECNOCHQ='+quotedstr(DMTE.cdsQry3.FieldByName('ECNOCHQ').AsString)
                  +'     and CIAID<>''02'' ';
               DMTE.cdsReporteDet.Close;
               DMTE.cdsReporteDet.DataRequest( xSQL );
               DMTE.cdsReporteDet.Open;
            End
            Else
            Begin
               xSQL:='Select * '
                  +'    from CAJA302 '
                  +'   where ECANOMM2 = '+Quotedstr(cAAMM)
                  +'     and TDIARIO2 = '+QuotedStr(cTD)
                  +'     and ECNOCOMP2 = '+QuotedStr(cCMP) ;
               DMTE.cdsReporteDet.Close;
               DMTE.cdsReporteDet.DataRequest( xSQL );
               DMTE.cdsReporteDet.Open;
            End;
            xSQL := 'Select a.*, b.CIADES,A.CIAID||TDIARID||CNTCOMPROB CNTGRUPO '
               + '     from CNT301 A, TGE101 B '
               + '    Where A.CIAID=B.CIAID(+) '
               + '      and ('
               + '           ( a.CIAID='+QuotedStr( Copy( DMTE.cdsReporteDet.FieldByname('ECPERREC').AsString, 4, 2) )
               + '         and a.TDIARID='   +QuotedStr( Copy( DMTE.cdsReporteDet.FieldByname('ECPERREC').AsString, 7, 2) )
               + '         and a.CNTANOMM='  +QuotedStr( cAAMM )
               + '         and a.CNTCOMPROB='+QuotedStr( Copy( DMTE.cdsReporteDet.FieldByname('ECPERREC').AsString,10,10) )+' ) '
               + '        or ( a.CIAID='     +QuotedStr( Copy( DMTE.cdsReporteDet.FieldByname('ECPERREC').AsString,25, 2) )
               + '         and a.TDIARID='   +QuotedStr( Copy( DMTE.cdsReporteDet.FieldByname('ECPERREC').AsString,28, 2) )
               + '         and a.CNTANOMM='  +QuotedStr( cAAMM )
               + '         and a.CNTCOMPROB='+QuotedStr( Copy( DMTE.cdsReporteDet.FieldByname('ECPERREC').AsString,31,10) )+' ) ';
            DMTE.cdsReporteDet.Next;
            while not DMTE.cdsReporteDet.Eof do
            begin
               xSQL:=xSQL+' or '
                  +  '       ( a.CIAID='+QuotedStr( Copy( DMTE.cdsReporteDet.FieldByname('ECPERREC').AsString, 4, 2) )
                  +  '     and a.TDIARID='+QuotedStr( Copy( DMTE.cdsReporteDet.FieldByname('ECPERREC').AsString, 7, 2) )
                  +  '     and a.CNTANOMM='  +QuotedStr( cAAMM )
                  +  '     and a.CNTCOMPROB='+QuotedStr( Copy( DMTE.cdsReporteDet.FieldByname('ECPERREC').AsString,10,10) )+' ) '
                  +  '    or ( a.CIAID='     +QuotedStr( Copy( DMTE.cdsReporteDet.FieldByname('ECPERREC').AsString,25, 2) )
                  +  '     and a.TDIARID='   +QuotedStr( Copy( DMTE.cdsReporteDet.FieldByname('ECPERREC').AsString,28, 2) )
                  +  '     and a.CNTANOMM='  +QuotedStr( cAAMM )
                  +  '     and a.CNTCOMPROB='+QuotedStr( Copy( DMTE.cdsReporteDet.FieldByname('ECPERREC').AsString,31,10) )+' ) ';
                DMTE.cdsReporteDet.next;
            end;
            xSQL:=xSQL+' ) Order by a.CIAID, TDIARID, CNTCOMPROB, CNTREG';
        end
        else
        begin
           xSQL:=     'SELECT b.CIAID, b.TDIARID, ecanomm CNTANOMM, ecnocomp CNTCOMPROB, ';
           xSQL:=xSQL+   'b.ecglosa CNTGLOSA, B.ECTCAMB CNTTCAMBIO, B.ECESTADO CNTESTADO, B.ECFCOMP CNTFCOMP, ';
           xSQL:=xSQL+   'b.TMONID, B.CCBCOID, B.ECNOCHQ, B.ECGIRA, ECMTOORI, B.PROV PROVID, ';
           xSQL:=xSQL+   'C.TMONDES, C.TMONABR, B.PROV||''  ''||D.AUXNOMB PROV, B.BANCOID||'' ''||E.BANCONOM BANCOID ';
           xSQL:=xSQL+'FROM CAJA302 B, CNT201 D, TGE103 C, TGE105 E ';
           xSQL:=xSQL+'WHERE B.CIAID='''    + cCia  +''' AND ';
           xSQL:=xSQL+       'B.TDIARID='''  + cTD   +''' AND ';
           xSQL:=xSQL+       'B.ECANOMM='''  + cAAMM +''' AND ';
           xSQL:=xSQL+       'B.ECNOCOMP=''' + cCMP  +''' ';
           xSQL:=xSQL+ ' and  B.TMONID=C.TMONID ';
           xSQL:=xSQL+ ' and  D.CLAUXID(+)=B.CLAUXID AND D.AUXID(+)=B.PROV ';
           xSQL:=xSQL+ ' and  E.BANCOID=B.BANCOID ';
           DMTE.cdsQry3.Close;
           DMTE.cdsQry3.DataRequest( xSQL );
           DMTE.cdsQry3.Open;

           xSQL:='SELECT b.CIAID, b.TDIARID, ecanomm CNTANOMM, ecnocomp CNTCOMPROB, eclote CNTLOTE, '
                +   'b.ecglosa CNTGLOSA, B.ECTCAMB CNTTCAMBIO, B.ECESTADO CNTESTADO, B.ECFCOMP CNTFCOMP, '
                +   '1 CNTREG, '' '' CUENTAID, '' '' AUXID, '' '' CNTSERIE, '' '' CNTNODOC, '
                +   'B.ECFCOMP CNTFVCMTO, '' '' CNTGLOSA, '' '' CCOSID, ECUSER CNTUSER, '
                +   '0 CNTDEBEMN, 0 CNTHABEMN, 0 CNTDEBEME, 0 CNTHABEME, '
                +   'C.CIADES, D.TDIARDES, '
                + ' ''                                                                                                                                                                        '' DATOS_RET '
                +'FROM CAJA302 B, TGE101 C, TGE104 D '
                +'WHERE B.CIAID='''    + cCia  +''' AND '
                +      'B.TDIARID='''  + cTD   +''' AND '
                +      'B.ECANOMM='''  + cAAMM +''' AND '
                +      'B.ECNOCOMP=''' + cCMP  +''' '
                + ' and B.CIAID=C.CIAID(+) '
                + ' and B.TDIARID=D.TDIARID(+)';
           DMTE.cdsCNT311.Close;
           DMTE.cdsCNT311.DataRequest(xSQL);
           DMTE.cdsCNT311.Open;

           xSQL:='Select a.*, b.CIADES from CNT301 a, TGE101 b '
                +'Where  a.CIAID(+)=''ZZ'' and a.CIAID=b.CIAID(+)';
        end;
        DMTE.cdsReporteDet.Close;
        DMTE.cdsReporteDet.DataRequest( xSQL );
        DMTE.cdsReporteDet.Open;
        DMTE.ppdbDet.DataSource:=DMTE.dsReporteDet;
     end;
     if CNTDet='CNT311' then
     begin
        xSQL:=     'SELECT b.CIAID, b.TDIARID, ecanomm CNTANOMM, ecnocomp CNTCOMPROB, ';
        xSQL:=xSQL+   'b.ecglosa CNTGLOSA, B.ECTCAMB CNTTCAMBIO, B.ECESTADO CNTESTADO, B.ECFCOMP CNTFCOMP, ';
        xSQL:=xSQL+   'b.TMONID, B.CCBCOID, B.ECNOCHQ, B.ECGIRA, ECMTOORI, B.PROV PROVID, ';
        xSQL:=xSQL+   'C.TMONDES, C.TMONABR, B.PROV||''  ''||D.AUXNOMB PROV, B.BANCOID||'' ''||E.BANCONOM BANCOID ';
        xSQL:=xSQL+'FROM CAJA302 B, CNT201 D, TGE103 C, TGE105 E ';
        xSQL:=xSQL+'WHERE B.CIAID='''    + cCia  +''' AND ';
        xSQL:=xSQL+       'B.TDIARID='''  + cTD   +''' AND ';
        xSQL:=xSQL+       'B.ECANOMM='''  + cAAMM +''' AND ';
        xSQL:=xSQL+       'B.ECNOCOMP=''' + cCMP  +''' ';
        xSQL:=xSQL+ ' and  B.TMONID=C.TMONID ';
        xSQL:=xSQL+ ' and  D.CLAUXID(+)=B.CLAUXID AND D.AUXID(+)=B.PROV ';
        xSQL:=xSQL+ ' and  E.BANCOID=B.BANCOID ';
        DMTE.cdsQry3.Close;
        DMTE.cdsQry3.DataRequest( xSQL );
        DMTE.cdsQry3.Open;

        xSQL:='SELECT b.CIAID, b.TDIARID, ecanomm CNTANOMM, ecnocomp CNTCOMPROB, eclote CNTLOTE, '
             +   'b.ecglosa CNTGLOSA, B.ECTCAMB CNTTCAMBIO, B.ECESTADO CNTESTADO, B.ECFCOMP CNTFCOMP, '
             +   '1 CNTREG, '' '' CUENTAID, '' '' AUXID, '' '' CNTSERIE, '' '' CNTNODOC, '
             +   'B.ECFCOMP CNTFVCMTO, '' '' CNTGLOSA, '' '' CCOSID, ECUSER CNTUSER, '
             +   '0 CNTDEBEMN, 0 CNTHABEMN, 0 CNTDEBEME, 0 CNTHABEME, '
             +   'C.CIADES, D.TDIARDES, '
             + ' ''                                                                                                                                                                        '' DATOS_RET '
             +'FROM CAJA302 B, TGE101 C, TGE104 D '
             +'WHERE B.CIAID='''    + cCia  +''' AND '
             +      'B.TDIARID='''  + cTD   +''' AND '
             +      'B.ECANOMM='''  + cAAMM +''' AND '
             +      'B.ECNOCOMP=''' + cCMP  +''' '
             + ' and B.CIAID=C.CIAID(+) '
             + ' and B.TDIARID=D.TDIARID(+)';
        DMTE.cdsCNT311.Close;
        DMTE.cdsCNT311.DataRequest(xSQL);
        DMTE.cdsCNT311.Open;
        xSQL:='Select a.*, b.CIADES from CNT301 a, TGE101 b '
             +'Where  a.CIAID(+)=''ZZ'' and a.CIAID=b.CIAID(+)';
        DMTE.cdsReporteDet.Close;
        DMTE.cdsReporteDet.DataRequest( xSQL );
        DMTE.cdsReporteDet.Open;
        DMTE.ppdbDet.DataSource:=DMTE.dsReporteDet;
     end;

     DMTE.cdsQry3.Edit;
     DMTE.cdsQry3.FieldByName('CNTGLOSA').AsString:=cGlosa;
     DMTE.cdsQry3.Post;

     mes:=copy(DMTE.cdsCNT311.FieldByName('CNTANOMM').AsString,5,2);
     ano:=copy(DMTE.cdsCNT311.FieldByName('CNTANOMM').AsString,1,4);

     if (CNTDet='CNT301') or (CNTDet='CNT301G') then
        DMTE.pplblEstado.Caption :='Estado  :  Contabilizado'
     else
     begin
        mes:=copy(cAAMM,5,2);
        ano:=copy(cAAMM,1,4);
        if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='A' then
           DMTE.pplblEstado.Caption :='Estado  :  Anulado'
        else
           DMTE.pplblEstado.Caption :='Estado  :  Preliminar';
     end;

     DMTE.cdsCNT311.Edit;
     DMTE.cdsCNT311.FieldByName('DATOS_RET').AsString := '';
     DMTE.cdsCNT311.Post;

     xSQL:='Select MAX(RETSERIE) RETSERIE, MAX(RETNUMERO) RETNUMERO, SUM( MTORETLOC ) RETLOC, SUM( MTORETEXT ) RETEXT '
              +'from CNT320 '
              +'WHERE CIAID='''   + cCia   +''' AND '
              +      'ANOMM='''   + cAAMM  +''' AND '
              +      'TDIARID=''' + cTD    +''' AND '
              +      'ECNOCOMP='''+ cCMP   +''' AND '
              +      '( DOCID2 IS NULL OR DOCID2='''' ) ';
     DMTE.cdsQry4.Close;
     DMTE.cdsQry4.Datarequest( xSQL );
     DMTE.cdsQry4.Open;

     If DMTE.cdsQry4.RecordCount>0 then
     Begin
        If DMTE.cdsQry4.FieldByName('RETLOC').AsFloat>0 then
        Begin
           DMTE.cdsCNT311.Edit;
           DMTE.cdsCNT311.FieldByName('DATOS_RET').AsString := 'Visite Nuestra página WEB: www.Derrama.org.pe y obtenga una copia del Comprobante de Retención IGV Electrónica :'
                    +DMTE.cdsQry4.FieldByName('RETSERIE').AsString
                    +'-'
                    +DMTE.cdsQry4.FieldByName('RETNUMERO').AsString;
           DMTE.cdsCNT311.Post;
        End;
     End;

     if mes='01' then mesdes :='ENERO';
     if mes='02' then mesdes :='FEBRERO';
     if mes='03' then mesdes :='MARZO';
     if mes='04' then mesdes :='ABRIL';
     if mes='05' then mesdes :='MAYO';
     if mes='06' then mesdes :='JUNIO';
     if mes='07' then mesdes :='JULIO';
     if mes='08' then mesdes :='AGOSTO';
     if mes='09' then mesdes :='SETIEMBRE';
     if mes='10' then mesdes :='OCTUBRE';
     if mes='11' then mesdes :='NOVIEMBRE';
     if mes='12' then mesdes :='DICIEMBRE';

     if DMTE.cdsQry3.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
        xImporte:=DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat
     else
        xImporte:=DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat;

     if DMTE.cdsReporteDet.Active = True then
     Begin
        If DMTE.cdsReporteDet.RecordCount = 0 Then
        Begin
           DMTE.pprVoucher.TEMPLATE.FileName:=DMTE.wRutaCNT + '\ComprobanteCajaGlobalCia02.rtm';
           DMTE.pprVoucher.template.LoadFromFile ;
        End;
     End;

     if (CNTDet='CNT301G') or (CNTDet='CNT311G') then
     begin
        try
        DMTE.pplDet1.Visible:=False;
        DMTE.pplDet2.Visible:=False;
        if cMsgDet='S' then
        begin
            DMTE.pplDet1.Visible:=True;
            DMTE.pplDet2.Visible:=True;
        end;
        except
        end;
     end;

     DMTE.pplblPeriodo.caption := 'Periodo  :  ';
     DMTE.lblPeriodo.Caption   := mesdes+' '+ano;
     DMTE.pplblTMon.Caption    := 'Moneda  :  '+DMTE.cdsQry3.FieldByName('TMONDES').AsString;
     DMTE.pplblglosa.Caption   := DMTE.cdsQry3.FieldByName('CNTGLOSA').AsString;
     DMTE.pplBanco.Caption     := DMTE.cdsQry3.FieldByName('BANCOID').AsString;
     DMTE.pplCtaCte.Caption    := DMTE.cdsQry3.FieldByName('CCBCOID').AsString;
     DMTE.pplChq.Caption       := DMTE.cdsQry3.FieldByName('ECNOCHQ').AsString;
     DMTE.pplImporte.Caption   := DMTE.cdsQry3.FieldByName('TMONABR').AsString+' '+FloatToStrF( xImporte, ffnumber, 15,2 );
     DMTE.pplProv.Caption      := DMTE.cdsQry3.FieldByName('PROV').AsString;
     DMTE.pplGirado.Caption    := DMTE.cdsQry3.FieldByName('ECGIRA').AsString;
     DMTE.pplModulo.Caption    := 'Modulo: CAJA';
     DMTE.pplLetras.Caption    := '** '+Trim( strNum( xImporte ) )+' '+DMTE.cdsQry3.FieldByName('TMONDES').AsString+' **';

     DMTE.ppdbVoucher.DataSource:=DMTE.dsCNT311;

     // Eliminar Contabilidad de Voucher anulado o Preliminar
     if CNTDet='CNT311G' then
     begin
        xSql:='DELETE FROM CNT301 A '
             +'WHERE ( A.CIAID=' +QuotedStr( cCia ) +' AND A.CNTANOMM='  +QuotedStr( cAAMM )
             + ' AND A.TDIARID=' +QuotedStr( cTD  ) +' AND A.CNTCOMPROB='+QuotedStr( cCMP  )+ ' ) '
             + xWA;
        DMTE.cdsQry.Close;
        DMTE.cdsQry.Datarequest( xSQL );
        try
           DMTE.cdsQry.Execute;
        except
        end;
        xSql:='DELETE FROM CNT300 A '
             +'WHERE ( A.CIAID=' +QuotedStr( cCia ) +' AND A.CNTANOMM='  +QuotedStr( cAAMM )
             + ' AND A.TDIARID=' +QuotedStr( cTD  ) +' AND A.CNTCOMPROB='+QuotedStr( cCMP  )+ ' ) '
             + xWA;
        DMTE.cdsQry.Close;
        DMTE.cdsQry.Datarequest( xSQL );
        try
           DMTE.cdsQry.Execute;
        except
        end;
     end;

       If xDisenoImp then
          DMTE.ppd1.ShowModal
       Else
       Begin
          DMTE.pprVoucher.Print;
          DMTE.pprVoucher.Stop;
          DMTE.ppdbVoucher.DataSource:=nil;
          if CNTDet='CNT301G' then DMTE.ppdbDet.DataSource:=nil;

          x10:=DMTE.ComponentCount-1;
          while x10>0 do
          begin
             if DMTE.components[x10].classname='TppGroup' then
             begin
                DMTE.components[x10].free;
             end;
             x10:=x10-1;
          end;
       End;
   finally
      FoaConta.Free;
   end;
end;
// Fin HPC_201603_CAJA

procedure TDMTE.cdsRegCxPAfterOpen(DataSet: TDataSet);
begin
 {  TNumericField( cdsRegCxP.FieldByName( 'DETCDOC'  ) ).DisplayFormat:='#,##0.000';
   TNumericField( cdsRegCxP.FieldByName( 'DETCDOC'  ) ).EditFormat   :='###0.000';
   TNumericField( cdsRegCxP.FieldByName( 'DETCPAG'  ) ).DisplayFormat:='#,##0.000';
	 TNumericField( cdsRegCxP.FieldByName( 'DETCPAG'  ) ).EditFormat   :='###0.000';
   TNumericField( cdsRegCxP.FieldByName( 'DEMTOORI' ) ).DisplayFormat:='###,###,##0.00';
   TNumericField( cdsRegCxP.FieldByName( 'DEMTOORI' ) ).EditFormat   :='########0.00';
   TNumericField( cdsRegCxP.FieldByName( 'DEMTOLOC' ) ).DisplayFormat:='###,###,##0.00';
   TNumericField( cdsRegCxP.FieldByName( 'DEMTOLOC' ) ).EditFormat   :='########0.00';
   TNumericField( cdsRegCxP.FieldByName( 'DEMTOEXT' ) ).DisplayFormat:='###,###,##0.00';
   TNumericField( cdsRegCxP.FieldByName( 'DEMTOEXT' ) ).EditFormat   :='########0.00';}
end;


procedure TDMTE.SaldosAuxiliar( xxCia,xxAnoMes,xxClAux,xxAux,xxSigno:String;
                               xxImpMN,xxImpME: Double; xxTMonid : String );
var
  xxAno, xxMes, xSQL, xxSaldo13 : String;
  xxSaldo01, xxSaldo02, xxSaldo03, xxSaldo04, xxSaldo05, xxSaldo06 : String;
  xxSaldo07, xxSaldo08, xxSaldo09, xxSaldo10, xxSaldo11, xxSaldo12 : String;
  xxTotMN, xxTotME, xxToSMN, xxToSME : Double;
  iX : integer;
  ssql,ssql1,xmes : string;
begin
// Inicio HPC_201401_CAJA
   xxAno:= Copy(xxAnoMes,1,4);
   xxMes:= Copy(xxAnoMes,5,2);
   xSQL := '';

   xSQL := 'Select CIAID '
          +'  from TGE401 '
          +' where CIAID='  +''''+xxCia    +''''+' and '
          +'       ANO='    +''''+xxAno    +''''+' and '
          +'       CLAUXID='+''''+xxClAux  +''''+' and '
          +'       AUXID='  +''''+xxAux    +'''';
   xSQL := UpperCase( xSQL );
   cdsQry.Close;
   cdsQry.ProviderName:= 'prvTGE';
   cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
   cdsQry.Open;
   if cdsQry.RecordCount=0 then
   begin
      xSQL := 'Insert into TGE401(CIAID,ANO,CLAUXID,AUXID';
      if (xxSigno='+') or (xxSigno='=') then
      begin
         xSQL:= xSQL + ', DEBETMN'+xxMes+', DEBETME'+xxMes;
     	if xxtmonid = DMTE.wTMonLoc then
        	xSQL:= xSQL + ', DEBESMN'+xxMes;
     	if xxtmonid = DMTE.wTMonExt then
        	xSQL:= xSQL + ', DEBESME'+xxMes;
      end;
      if (xxSigno='-') or (xxSigno='=') then
      begin
     	xSQL:= xSQL + ', HABETMN'+xxMes+', HABETME'+xxMes;
    	 if xxtmonid = DMTE.wTMonLoc then
    		xSQL:= xSQL + ', HABESMN'+xxMes;
    	 if xxtmonid = DMTE.wTMonExt then
    		xSQL:= xSQL + ', HABESME'+xxMes;
      end;
      xSQL:= xSQL+ ') Values ('+''''+xxCia  +''''+','+''''+xxAno +''''+','
                             +''''+xxClAux+''''+','+''''+xxAux +'''';
      xSQL:= xSQL + ', '+FloatToStr(xxImpMN)+', '+FloatToStr(xxImpME);
      if xxtmonid = DMTE.wTMonLoc then
         xSQL:= xSQL + ', ' +FloatToStr(xxImpMN);
      if xxtmonid = DMTE.wTMonExt then
         xSQL:= xSQL + ', ' +FloatToStr(xxImpME);

      if xxSigno='=' then 
      begin
         xSQL:= xSQL + ', '+FloatToStr(xxImpMN)+', '+FloatToStr(xxImpME);
         if xxtmonid = wTMonLoc then
            xSQL:= xSQL + ', ' +FloatToStr(xxImpMN);
         if xxtmonid = wTMonExt then
            xSQL:= xSQL + ', ' +FloatToStr(xxImpME);
      end;
      xSQL := UpperCase( xSQL + ' ) ' );
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   end
   else
   begin
  	xxTotMN:= xxImpMN;
      xxTotME:= xxImpME;
  	xxToSMN:= xxImpMN;
      xxToSME:= xxImpME;

  	xSQL := 'Update TGE401 Set ';
      if (xxSigno='+') or (xxSigno='=') then
      begin
         xSQL := xSQL +'  DEBETMN'+xxMes+'='+ DMTE.wReplacCeros+'(DEBETMN' +xxMes+ ' ,0)+ '+FloatToStr(xxTotMN);
         xSQL := xSQL +', DEBETME'+xxMes+'='+ DMTE.wReplacCeros+'(DEBETME' +xxMes+ ' ,0)+ '+FloatToStr(xxTotME);
     	if xxtmonid = DMTE.wTMonLoc then
    		xSQL:= xSQL + ', DEBESMN'+xxMes+'='+ DMTE.wReplacCeros+'(DEBESMN' +xxMes+ ' ,0)+ '+FloatToStr(xxToSMN);
     	if xxtmonid = DMTE.wTMonExt then
    		xSQL:= xSQL + ', DEBESME'+xxMes+'='+ DMTE.wReplacCeros+'(DEBESME' +xxMes+ ' ,0)+ '+FloatToStr(xxToSME);
      end;

      if (xxSigno='-') or (xxSigno='=') then
      begin
     	if xxSigno='=' then
            xSQL := xSQL +',';
         xSQL := xSQL +'  HABETMN'+xxMes+'='+ DMTE.wReplacCeros+'(HABETMN' +xxMes+ ' ,0)+ '+FloatToStr(xxTotMN);
         xSQL := xSQL +', HABETME'+xxMes+'='+ DMTE.wReplacCeros+'(HABETME' +xxMes+ ' ,0)+ '+FloatToStr(xxTotME);
     	if xxtmonid = DMTE.wTMonLoc then
    		xSQL:= xSQL + ', HABESMN'+xxMes+'='+ DMTE.wReplacCeros+'(HABESMN' +xxMes+ ' ,0)+ '+FloatToStr(xxToSMN);
     	if xxtmonid = DMTE.wTMonExt then
    		xSQL:= xSQL + ', HABESME'+xxMes+'='+ DMTE.wReplacCeros+'(HABESME' +xxMes+ ' ,0)+ '+FloatToStr(xxToSME);
      end;
      xSQL := xSQL +' Where CIAID='  +''''+xxCia  +''''+' and '
                   +       'ANO='    +''''+xxAno  +''''+' and '
                   +       'CLAUXID='+''''+xxClAux+''''+' and '
                   +       'AUXID='  +''''+xxAux  +'''';
      xSQL := UpperCase( xSQL );
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   end;
//////////////////////////////////////
//                                  //
//   Actualiza DebeTMN y HaberTME   //
//                                  //
//////////////////////////////////////
   xSQL := 'Update TGE401 Set ';
  sSQL := ' Where CIAID='+''''+xxCia    +''''+' and '
           + 'ANO='        +''''+xxAno    +''''+' and '
           + 'CLAUXID='    +''''+xxClAux  +''''+' and '
           + 'AUXID='      +''''+xxAux    +'''';
   for iX := 0 to 13 do
   begin
      if iX = 0 then
      begin
     	xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX),2);
         xSQL := xSQL + 'SaldTMN'+xmes+'='+
            '('+DMTE.wReplacCeros+'(SaldTMN'+xmes+',0)+'+wReplacCeros+'(DebeTMN'+xmes+',0)-'+wReplacCeros+'(HabeTMN'+xmes+',0) )';
         xSQL := UpperCase(xSQL+ssql);
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;
      if iX > 0 then
      begin
     	xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX),2);
         xSQL := xSQL + 'SaldTMN'+xmes+'=';
         xmes := strzero(IntToStr(iX-1),2);
         xSQL := xSQL + '('+wReplacCeros+'(SaldTMN'+xmes+',0)';
         xmes := strzero(IntToStr(iX),2);
         xSQL := xSQL + '+ '+wReplacCeros+'(DebeTMN'+xmes+',0)-'+wReplacCeros+'(HabeTMN'+xmes+',0) )';
         xSQL := UpperCase(xSQL+ssql);
     	DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;
   end;
   for iX := 0 to 13 do
   begin
      if iX = 0 then
      begin
     	xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX),2);
         xSQL := xSQL + 'SaldTME'+xmes+'='+
            '('+wReplacCeros+'(SaldTME'+xmes+',0)+'+wReplacCeros+'(DebeTME'+xmes+',0)-'+wReplacCeros+'(HabeTME'+xmes+',0) )';
         xSQL := UpperCase(xSQL+ssql);
     	DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;
      if iX > 0 then
      begin
     	xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX),2);
         xSQL := xSQL + 'SaldTME'+xmes+'=';
         xmes := strzero(IntToStr(iX-1),2);
         xSQL := xSQL + '('+wReplacCeros+'(SaldTME'+xmes+',0)';
         xmes := strzero(IntToStr(iX),2);
         xSQL := xSQL + '+ '+wReplacCeros+'(DebeTME'+xmes+',0)-'+wReplacCeros+'(HabeTME'+xmes+',0) )';
         xSQL := UpperCase(xSQL+ssql);
     	DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;
   end;
//////////////////////////////////////
//                                  //
//   Actualiza DebeSMN y HaberSME   //
//                                  //
//////////////////////////////////////
   for iX := 0 to 13 do
   begin
      if iX = 0 then
      begin
     	xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX),2);
         xSQL := xSQL + 'SaldSMN'+xmes+'='+
            '('+wReplacCeros+'(SaldSMN'+xmes+',0)+'+wReplacCeros+'(DebeSMN'+xmes+',0)-'+wReplacCeros+'(HabeSMN'+xmes+',0) )';
         xSQL := UpperCase(xSQL+ssql);
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;
      if iX > 0 then
      begin
     	xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX),2);
         xSQL := xSQL + 'SaldSMN'+xmes+'=';
         xmes := strzero(
         IntToStr(iX-1),2);
         xSQL := xSQL + '('+wReplacCeros+'(SaldSMN'+xmes+',0)';
         xmes := strzero(IntToStr(iX),2);
         xSQL := xSQL + '+ '+wReplacCeros+'(DebeSMN'+xmes+',0)-'+wReplacCeros+'(HabeSMN'+xmes+',0) )';
         xSQL := UpperCase(xSQL+ssql);
     	DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;
   end;
   for iX := 0 to 13 do
   begin
      if iX = 0 then
      begin
     	xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX),2);
         xSQL := xSQL + 'SaldSME'+xmes+'='+
            '('+wReplacCeros+'(SaldSME'+xmes+',0)+'+wReplacCeros+'(DebeSME'+xmes+',0)-'+wReplacCeros+'(HabeSME'+xmes+',0) )';
         xSQL := UpperCase(xSQL+ssql);
     	DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;
      if iX > 0 then
      begin
     	xSQL := 'Update TGE401 Set ';
         xmes := strzero(IntToStr(iX),2);
         xSQL := xSQL + 'SaldSME'+xmes+'=';
         xmes := strzero(IntToStr(iX-1),2);
         xSQL := xSQL + '('+wReplacCeros+'(SaldSME'+xmes+',0)';
         xmes := strzero(IntToStr(iX),2);
         xSQL := xSQL + '+ '+wReplacCeros+'(DebeSME'+xmes+',0)-'+wReplacCeros+'(HabeSME'+xmes+',0) )';
         xSQL := UpperCase(xSQL+ssql);
     	DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;
   end;
// Fin HPC_201401_CAJA
end;

procedure TDMTE.pprVoucherPreviewFormCreate(Sender: TObject);
begin
	 //pprVoucher.PreviewForm.ClientHeight := 540;
	 //pprVoucher.PreviewForm.ClientWidth := 780;			// ppViewr
         pprVoucher.PreviewForm.WindowState := wsMaximized;
	 tppviewer(pprVoucher.PreviewForm.Viewer).zoomSetting := zs100Percent;
end;

procedure TDMTE.cdsCntCajaReconcileError(DataSet: TCustomClientDataSet;
	E: EReconcileError; UpdateKind: TUpdateKind;
	var Action: TReconcileAction);
begin
	 Action := HandleReconcileError(Dataset,UpdateKind,E);
end;

function TDMTE.CalculaRetencionIGV:Boolean;
var
   xRegAct     : TBookMark;
   xSQL, xClauxid,xProv : String;
   xBreak,bMayorQueTasa      : Boolean;
   //NUEVAS VARIABLES
   xTotAPagRet,xPorcAplica : double;
   xAplica : Boolean;
   sRetNC : String;
begin
   Result:=False;
  // Para Saber si la Compañía Retiene IGV.
   xSQL:='Select CIAID, CIARETIGV from TGE101 where CIAID='''+cdsEgrCaja.FieldByName('CIAID').AsString+''' ';
   cdsQry.Close;
   cdsQry.Datarequest( xSQL );
   cdsQry.Open;

	if cdsQry.FieldByName('CIARETIGV').AsString<>'S' then Exit;

	// Concepto y Cuenta de Retención
	xSQL:='Select CPTOID, CUENTAID from CAJA201 Where CPTOIS=''R''';
	cdsQry.Close;
	cdsQry.Datarequest( xSQL );
	cdsQry.Open;

	xCptoRet:=cdsQry.FieldByName('CPTOID').AsString;
	xCtaRet :=cdsQry.FieldByName('CUENTAID').AsString;

	// Tasas de La Retención
   xSQL:='SELECT A.*, B.PROVRETIGV FROM ( '

       +  'SELECT ''PROVISIONADO'' MODO, B.PROVRETIGV PROVDOC, B.TCANJEID, A.DETCPAG DETCDOC, B.TMONID, '
       +    'A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, '
       +    'A.PROVRUC, A.DOCID2, A.TDIARID2, A.CPANOMM, A.CPNOREG, A.CPSERIE, A.CPNODOC, A.CPFEMIS, '
       +    'A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, '
       // derrama vhn SE AÑADE FLAGVAR2 COMO FLAG DE DETRACCION
       +    'NVL(B.FLAGVAR2,''N'') DETRACCION, '
       // derrama end
       +    'CASE WHEN B.TMONID='+Quotedstr(DMTE.wTmonLoc)
       +    '     THEN case when (nvl(B.CPMTOLOC,0)-nvl(B.CPPAGLOC,0))>0 '
       +    '               then ROUND(A.DEMTOLOC/(nvl(B.CPMTOLOC,0)-nvl(B.CPPAGLOC,0)),5) '
       +    '               else 0 end '
       +    '     ELSE case when (nvl(B.CPMTOEXT,0)-nvl(B.CPPAGEXT,0))>0 '
       +    '               then ROUND(A.DEMTOEXT/(nvl(B.CPMTOEXT,0)-nvl(B.CPPAGEXT,0)),5) '
       +    '               else 0 end '
       +    'END PORCPAGO, ''D'' DEDH,'
       // vhn 20110316
       +    'B.CPFEMIS CPFEMIPROV, (nvl(B.CPGRAVAD,0)+nvl(B.CPGRAVAD2,0)+nvl(B.CPNOGRAV,0)+nvl(B.CP_OTROS,0)) CPGRAVAD, B.CPNOGRAV, '
       +    '(nvl(B.CPIGV,0)+nvl(B.CPIGV2,0)+nvl(B.IGV_GRA_NO_DEST,0)) CPIGV, '
       +    'B.CPMTOLOC, B.CPMTOEXT, C.DOCRETIGV,C.DOCRESTA, 0.00 MTOBASERET, 0.00 MONTORET '
       +  'FROM CAJA303 A, CXP301 B, TGE110 C '
       +  'WHERE A.CIAID='''   +cdsEgrCaja.FieldByName('CIAID').AsString   +''' AND '
       +        'A.TDIARID=''' +cdsEgrCaja.FieldByName('TDIARID').AsString +''' AND '
       +        'A.ECANOMM=''' +cdsEgrCaja.FieldByName('ECANOMM').AsString +''' AND '
       +        'A.ECNOCOMP='''+cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' '
       +    'AND B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID2 AND B.CPANOMES=A.CPANOMM '
       +    'AND B.CPNOREG=A.CPNOREG AND C.DOCMOD=''CXP'' and C.DOCID=A.DOCID2 '

       +  'UNION ALL '

       +  'SELECT ''NO PROVISIONADO'' MODO, '''' PROVDOC, '''' TCANJEID, A.DETCPAG DETCDOC, A.TMONID, '
       +  'A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, '
       +    'B.PROVRUC, A.DOCID2, A.TDIARID2, A.CPANOMM, A.CPNOREG, A.CPSERIE, A.CPNODOC, A.CPFEMIS, '
       +    'A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, '
       // derrama vhn SE AÑADE FLAGVAR2 COMO FLAG DE DETRACCION
       +    '''N'' DETRACCION, '
       // derrama end
       +    '1 PORCPAGO, A.DEDH, '
       +    'A.CPFEMIS CPFEMISPROV,0.00 CPGRAVAD,0.00 CPNOGRAV, 0.00 CPIGV, DEMTOLOC CPMTOLOC, DEMTOEXT CPMTOEXT, '
       +    'C.DOCRETIGV,C.DOCRESTA, 0.00 MTOBASERET, 0.00 MONTORET '
       +  'FROM CAJA301 A, TGE110 C, TGE201 B '
       +  'WHERE A.CIAID='''   +cdsEgrCaja.FieldByName('CIAID').AsString   +''' AND '
       +        'A.TDIARID=''' +cdsEgrCaja.FieldByName('TDIARID').AsString +''' AND '
       +        'A.ECANOMM=''' +cdsEgrCaja.FieldByName('ECANOMM').AsString +''' AND '
       +        'A.ECNOCOMP='''+cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' '
       +    'AND '+DMTE.wReplacCeros+'(FLAGVAR,'' '')<>''R'' AND C.DOCMOD=''CXP'' and C.DOCID=A.DOCID2 '
       +    'AND B.CLAUXID=A.CLAUXID AND B.PROV=A.PROV '
       + ' ) A, CNT201 B '
       +'WHERE B.CLAUXID=A.CLAUXID AND B.AUXID=A.PROV '
//       +'  AND A.CPFEMIS>='+DMTE.wRepFuncDate+''''
//       +formatdatetime(DMTE.wFormatFecha,DMTE.xTasaFec)+''') AND A.DOCRETIGV=''S'' AND B.PROVRETIGV=''S'' '
       +' ORDER BY A.CLAUXID, A.PROV,CPNOREG';

   cdsConsulta.IndexFieldNames:='';
   cdsConsulta.Filter:='';
   cdsConsulta.Filtered:=False;
	cdsConsulta.Close;
	cdsConsulta.DataRequest( xSQL );

	try
		cdsConsulta.Open;
	except
	end;

	cdsConsulta.IndexFieldNames := '';
	cdsConsulta.IndexFieldNames:='CLAUXID;PROV;CPNOREG';


    // vhndema añadido para que nota de crédito tambien genere retencion
  sRetNC:='';
  DMTE.cdsConsulta.First;
  while not DMTE.cdsConsulta.Eof do
  begin
     if DMTE.cdsConsulta.FieldByName('DOCID2').AsString='01' then
     begin
        if DMTE.cdsConsulta.FieldByName('PROVDOC').AsString='S' then
           sRetNC:='S';
     end;
     DMTE.cdsConsulta.next;
  end;

  DMTE.cdsConsulta.First;
  while not DMTE.cdsConsulta.Eof do
  begin
     if (DMTE.cdsConsulta.FieldByName('DOCID2').AsString='07') and (DMTE.cdsConsulta.FieldByName('PROVDOC').AsString='') then
     begin
        if sRetNC='S' then
        begin
           DMTE.cdsConsulta.Edit;
           DMTE.cdsConsulta.FieldByName('PROVDOC').AsString:=sRetNC;
           DMTE.cdsConsulta.Post;
        end;
     end;
     DMTE.cdsConsulta.next;
  end;
  // fin vhndema


	xSQL:='Select * from CNT320 '
		+'WHERE CIAID='''   +cdsEgrCaja.FieldByName('CIAID').AsString   +''' AND '
    +      'ANOMM='''   +cdsEgrCaja.FieldByName('ECANOMM').AsString +''' AND '
    +      'TDIARID=''' +cdsEgrCaja.FieldByName('TDIARID').AsString +''' AND '
    +      'ECNOCOMP='''+cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' AND '
    +      'CLAUXID=''' +cdsConsulta.FieldByName('CLAUXID').AsString +''' AND '
    +      'AUXID='''   +cdsConsulta.FieldByName('PROV').AsString    +'''';

   cdsRetencion.Close;
   cdsRetencion.IndexFieldNames:='';
   cdsRetencion.Datarequest( xSQL );
   cdsRetencion.Open;

   xProv:=cdsConsulta.FieldByName('PROV').AsString;
   xTotRetMN:=0;   xTotRetME:=0;
   xTotPagMN:=0;   xTotPagME:=0;
   xTRetLoc :=0;   xTRetExt :=0;

   xTotAPagRet:=0;
   xAplica := False;
   cdsConsulta.First;
   while not cdsConsulta.Eof do
   begin
      if cdsConsulta.FieldByName('DEDH').AsString='D' then // si es Debe, o sea si es pago
      begin
      // si el proveedor retiene
         if ( cdsConsulta.FieldByName('PROVRETIGV').AsString='S' ) and
            // derrama vhn SE AÑADE FLAGVAR2 COMO FLAG DE DETRACCION
            ( cdsConsulta.FieldByName('DETRACCION').AsString<>'S' ) then
            // derrama vhn
         begin
         // si el documento retiene
            if cdsConsulta.FieldByName('DOCRETIGV').AsString='S' then
            begin
            // si la fecha de emisión es >= a la fecha mínima de retención ('01/06/2002')
               if (cdsConsulta.FieldByName('CPFEMIS').AsDateTime>=xTasaFec) then
               begin
               // DOCUMENTOS NO PROVISIONADOS
                  if cdsConsulta.FieldByName('MODO').AsString='NO PROVISIONADO' then
                  begin
                     cdsConsulta.Edit;
                     cdsConsulta.FieldByName('MTOBASERET').AsFloat := cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
                  // Inicio HPC_201401_CAJA
                     // cdsConsulta.FieldByName('MONTORET').AsFloat   := FRound( cdsConsulta.FieldByName('DEMTOLOC').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                     if cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
                        cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                        FRound(cdsConsulta.FieldByName('DEMTOLOC').AsFloat * 0.03, 15, 2 )
                     else
                        cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                        FRound(cdsConsulta.FieldByName('DEMTOLOC').AsFloat * 0.06, 15, 2 );
                  // Fin HPC_201401_CAJA
                     xTotAPagRet:=xTotAPagRet+cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                  end
                  else // DOCUMENTOS PROVISIONADOS
                  begin
                     if cdsConsulta.FieldByName('TCANJEID').AsString<>'LE' then//FACTURAS PROVISIONADAS
                     begin
                     // si tiene marca desde CxP (PROVRETIGV='S')
                        if (cdsConsulta.FieldByName('PROVDOC').AsString='S') then
                        begin
                           xAplica := True;
                           if (cdsConsulta.FieldByName('CPGRAVAD').AsFloat+cdsConsulta.FieldByName('CPIGV').AsFloat)>0 then
                           begin
                             // xPorcAplica := cdsConsulta.FieldByName('DEMTOLOC').AsFloat/(cdsConsulta.FieldByName('CPMTOLOC').AsFloat-cdsConsulta.FieldByName('CPPAGLOC').AsFloat);
                              xPorcAplica := cdsConsulta.FieldByName('PORCPAGO').AsFloat;
                              cdsConsulta.Edit;
                              // SI LA MONEDA DEL DOCUMENTO ES EN SOLES
                              if cdsConsulta.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
                              begin
// Inicio HPC_201706_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
// Inicio HPC_201705_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
                                 cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((cdsConsulta.FieldByName('CPGRAVAD').AsFloat+cdsConsulta.FieldByName('CPIGV').AsFloat)*xPorcAplica,15,2);
                                 //cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((cdsConsulta.FieldByName('DEMTOLOC').AsFloat)*xPorcAplica,15,2);
// Fin  HPC_201705_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
// Fin  HPC_201706_CAJA  Ajustes en la generación de asientos contables por pago de detracciones

                              // Inicio HPC_201401_CAJA
                                 // cdsConsulta.FieldByName('MONTORET').AsFloat   := FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                                 if cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.03, 15, 2 )
                                 else
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.06, 15, 2 );
                              // Fin HPC_201401_CAJA
                              end
                              else
                              begin
// Inicio HPC_201706_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
// Inicio HPC_201705_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
                                 cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((cdsConsulta.FieldByName('CPGRAVAD').AsFloat+cdsConsulta.FieldByName('CPIGV').AsFloat)*xPorcAplica*cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
                                 //cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((cdsConsulta.FieldByName('DEMTOEXT').AsFloat)*xPorcAplica*cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
// Fin  HPC_201705_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
// Fin  HPC_201706_CAJA  Ajustes en la generación de asientos contables por pago de detracciones

                              // Inicio HPC_201401_CAJA
                                 // cdsConsulta.FieldByName('MONTORET').AsFloat   := FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                                 if cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.03, 15, 2 )
                                 else
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.06, 15, 2 );
                              // Fin HPC_201401_CAJA
                              end;
                              xTotAPagRet:=xTotAPagRet+cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                           end
                           else
                           begin
                              cdsConsulta.Edit;
                              cdsConsulta.FieldByName('MTOBASERET').AsFloat := cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
                           // Inicio HPC_201401_CAJA
                              // cdsConsulta.FieldByName('MONTORET').AsFloat   := FRound( cdsConsulta.FieldByName('DEMTOLOC').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                              if cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
                                 cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                 FRound(cdsConsulta.FieldByName('DEMTOLOC').AsFloat * 0.03, 15, 2 )
                              else
                                 cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                 FRound(cdsConsulta.FieldByName('DEMTOLOC').AsFloat * 0.06, 15, 2 );
                           // Fin HPC_201401_CAJA
                              xTotAPagRet:=xTotAPagRet+cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                           end;
                        end
                        else // si no tiene marca desde CxP
                        begin
                          // xPorcAplica := cdsConsulta.FieldByName('DEMTOLOC').AsFloat/(cdsConsulta.FieldByName('CPMTOLOC').AsFloat-cdsConsulta.FieldByName('CPPAGLOC').AsFloat);
                           xPorcAplica := cdsConsulta.FieldByName('PORCPAGO').AsFloat;
                           // VHN CAMBIO PORQUE NO DEBE GENERQAR RETENCION
                           if (DMTE.cdsConsulta.FieldByName('PROVDOC').AsString='S') then
                           begin
                              cdsConsulta.Edit;
                              // SI LA MONEDA DEL DOCUMENTO ES EN SOLES
                              if cdsConsulta.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
                              begin
                                 cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((cdsConsulta.FieldByName('CPGRAVAD').AsFloat+cdsConsulta.FieldByName('CPIGV').AsFloat)*xPorcAplica,15,2);
                              // Inicio HPC_201401_CAJA
                                 // cdsConsulta.FieldByName('MONTORET').AsFloat   := FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                                 if cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.03, 15, 2 )
                                 else
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.06, 15, 2 );
                              // Fin HPC_201401_CAJA
                              end
                              else
                              begin
                                 cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((cdsConsulta.FieldByName('CPGRAVAD').AsFloat+cdsConsulta.FieldByName('CPIGV').AsFloat)*xPorcAplica*cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
                              // Inicio HPC_201401_CAJA
                                 // cdsConsulta.FieldByName('MONTORET').AsFloat   := FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat* DMTE.xTasaPorce/ 100, 15, 2 );
                                 if cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.03, 15, 2 )
                                 else
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.06, 15, 2 );
                              // Fin HPC_201401_CAJA
                              end;
                              xTotAPagRet:=xTotAPagRet+cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                           end;
                        end;
                     end
                     else // si son Letras
                     begin
                        InsertaLETRASEnCNT320;
                        GrabaNumeroRetencion;
                     end;
                  end;
               end;
            end;
         end;
      end;
      cdsConsulta.next;
   end;

   if (xTotAPagRet>=DMTE.xTasaMonto) or (xAplica) then
   begin
      cdsConsulta.First;
      while not cdsConsulta.Eof do
      begin
         if cdsConsulta.FieldByName('MTOBASERET').AsFloat<>0 then
         begin
            InsertaEnCNT320;
         end;
         cdsConsulta.Next;
      end;
      GrabaNumeroRetencion;
      Result:=True;
   end;

   cdsConsulta.IndexFieldNames := '';
end;


function TDMTE.CalculaRetencionIGV_SinNC:Boolean;
var
   xRegAct     : TBookMark;
   xSQL, xClauxid,xProv : String;
   xBreak,bMayorQueTasa      : Boolean;
   //NUEVAS VARIABLES
   xTotAPagRet,xPorcAplica : double;
   xAplica : Boolean;
   sRetNC : String;
begin
   Result:=False;
  // Para Saber si la Compañía Retiene IGV.
   xSQL:='Select CIAID, CIARETIGV from TGE101 where CIAID='''+cdsEgrCaja.FieldByName('CIAID').AsString+''' ';
   cdsQry.Close;
   cdsQry.Datarequest( xSQL );
   cdsQry.Open;

	if cdsQry.FieldByName('CIARETIGV').AsString<>'S' then Exit;

	// Concepto y Cuenta de Retención
	xSQL:='Select CPTOID, CUENTAID from CAJA201 Where CPTOIS=''R''';
	cdsQry.Close;
	cdsQry.Datarequest( xSQL );
	cdsQry.Open;

	xCptoRet:=cdsQry.FieldByName('CPTOID').AsString;
	xCtaRet :=cdsQry.FieldByName('CUENTAID').AsString;

	// Tasas de La Retención
   xSQL:='SELECT A.*, B.PROVRETIGV FROM ( '

       +  'SELECT ''PROVISIONADO'' MODO, B.PROVRETIGV PROVDOC, B.TCANJEID, A.DETCPAG DETCDOC, B.TMONID, '
       +    'A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, '
       +    'A.PROVRUC, A.DOCID2, A.TDIARID2, A.CPANOMM, A.CPNOREG, A.CPSERIE, A.CPNODOC, A.CPFEMIS, '
       +    'A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, '
       // derrama vhn SE AÑADE FLAGVAR2 COMO FLAG DE DETRACCION
       +    'NVL(B.FLAGVAR2,''N'') DETRACCION, '
       // derrama end
       +    'CASE WHEN B.TMONID='+Quotedstr(DMTE.wTmonLoc)
       +    '     THEN case when (nvl(B.CPMTOLOC,0)-nvl(B.CPPAGLOC,0))>0 '
       +    '               then ROUND(A.DEMTOLOC/(nvl(B.CPMTOLOC,0)-nvl(B.CPPAGLOC,0)),5) '
       +    '               else 0 end '
       +    '     ELSE case when (nvl(B.CPMTOEXT,0)-nvl(B.CPPAGEXT,0))>0 '
       +    '               then ROUND(A.DEMTOEXT/(nvl(B.CPMTOEXT,0)-nvl(B.CPPAGEXT,0)),5) '
       +    '               else 0 end '
       +    'END PORCPAGO, ''D'' DEDH,'
       // vhn 20110316
       +    'B.CPFEMIS CPFEMIPROV, (nvl(B.CPGRAVAD,0)+nvl(B.CPGRAVAD2,0)) CPGRAVAD, B.CPNOGRAV, B.CPIGV, '
       +    'B.CPMTOLOC, B.CPMTOEXT, C.DOCRETIGV,C.DOCRESTA, 0.00 MTOBASERET, 0.00 MONTORET '
       +  'FROM CAJA303 A, CXP301 B, TGE110 C '
       +  'WHERE A.CIAID='''   +cdsEgrCaja.FieldByName('CIAID').AsString   +''' AND '
       +        'A.TDIARID=''' +cdsEgrCaja.FieldByName('TDIARID').AsString +''' AND '
       +        'A.ECANOMM=''' +cdsEgrCaja.FieldByName('ECANOMM').AsString +''' AND '
       +        'A.ECNOCOMP='''+cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' '
       +    'AND B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID2 AND B.CPANOMES=A.CPANOMM '
       +    'AND B.CPNOREG=A.CPNOREG AND C.DOCMOD=''CXP'' and C.DOCID=A.DOCID2 '

       +  'UNION ALL '

       +  'SELECT ''NO PROVISIONADO'' MODO, '''' PROVDOC, '''' TCANJEID, A.DETCPAG DETCDOC, A.TMONID, '
       +  'A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, '
       +    'B.PROVRUC, A.DOCID2, A.TDIARID2, A.CPANOMM, A.CPNOREG, A.CPSERIE, A.CPNODOC, A.CPFEMIS, '
       +    'A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, '
       // derrama vhn SE AÑADE FLAGVAR2 COMO FLAG DE DETRACCION
       +    '''N'' DETRACCION, '
       // derrama end
       +    '1 PORCPAGO, A.DEDH, '
       +    'A.CPFEMIS CPFEMISPROV,0.00 CPGRAVAD,0.00 CPNOGRAV, 0.00 CPIGV, DEMTOLOC CPMTOLOC, DEMTOEXT CPMTOEXT, '
       +    'C.DOCRETIGV,C.DOCRESTA, 0.00 MTOBASERET, 0.00 MONTORET '
       +  'FROM CAJA301 A, TGE110 C, TGE201 B '
       +  'WHERE A.CIAID='''   +cdsEgrCaja.FieldByName('CIAID').AsString   +''' AND '
       +        'A.TDIARID=''' +cdsEgrCaja.FieldByName('TDIARID').AsString +''' AND '
       +        'A.ECANOMM=''' +cdsEgrCaja.FieldByName('ECANOMM').AsString +''' AND '
       +        'A.ECNOCOMP='''+cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' '
       +    'AND '+DMTE.wReplacCeros+'(FLAGVAR,'' '')<>''R'' AND C.DOCMOD=''CXP'' and C.DOCID=A.DOCID2 '
       +    'AND B.CLAUXID=A.CLAUXID AND B.PROV=A.PROV '
       + ' ) A, CNT201 B '
       +'WHERE B.CLAUXID=A.CLAUXID AND B.AUXID=A.PROV '
//       +'  AND A.CPFEMIS>='+DMTE.wRepFuncDate+''''
//       +formatdatetime(DMTE.wFormatFecha,DMTE.xTasaFec)+''') AND A.DOCRETIGV=''S'' AND B.PROVRETIGV=''S'' '
       +' ORDER BY A.CLAUXID, A.PROV,CPNOREG';

   cdsConsulta.IndexFieldNames:='';
   cdsConsulta.Filter:='';
   cdsConsulta.Filtered:=False;
	cdsConsulta.Close;
	cdsConsulta.DataRequest( xSQL );

	try
		cdsConsulta.Open;
	except
	end;

	cdsConsulta.IndexFieldNames := '';
	cdsConsulta.IndexFieldNames:='CLAUXID;PROV;CPNOREG';

	xSQL:='Select * from CNT320 '
		+'WHERE CIAID='''   +cdsEgrCaja.FieldByName('CIAID').AsString   +''' AND '
    +      'ANOMM='''   +cdsEgrCaja.FieldByName('ECANOMM').AsString +''' AND '
    +      'TDIARID=''' +cdsEgrCaja.FieldByName('TDIARID').AsString +''' AND '
    +      'ECNOCOMP='''+cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' AND '
    +      'CLAUXID=''' +cdsConsulta.FieldByName('CLAUXID').AsString +''' AND '
    +      'AUXID='''   +cdsConsulta.FieldByName('PROV').AsString    +'''';

   cdsRetencion.Close;
   cdsRetencion.IndexFieldNames:='';
   cdsRetencion.Datarequest( xSQL );
   cdsRetencion.Open;

   xProv:=cdsConsulta.FieldByName('PROV').AsString;
   xTotRetMN:=0;   xTotRetME:=0;
   xTotPagMN:=0;   xTotPagME:=0;
   xTRetLoc :=0;   xTRetExt :=0;

   xTotAPagRet:=0;
   xAplica := False;
   cdsConsulta.First;
   while not cdsConsulta.Eof do
   begin
      if cdsConsulta.FieldByName('DEDH').AsString='D' then // si es Debe, o sea si es pago
      begin
      // si el proveedor retiene
         if ( cdsConsulta.FieldByName('PROVRETIGV').AsString='S' ) and
            // derrama vhn SE AÑADE FLAGVAR2 COMO FLAG DE DETRACCION
            ( cdsConsulta.FieldByName('DETRACCION').AsString<>'S' ) then
            // derrama vhn
         begin
         // si el documento retiene
            if cdsConsulta.FieldByName('DOCRETIGV').AsString='S' then
            begin
            // si la fecha de emisión es >= a la fecha mínima de retención ('01/06/2002')
               if (cdsConsulta.FieldByName('CPFEMIS').AsDateTime>=xTasaFec) then
               begin
               // DOCUMENTOS NO PROVISIONADOS
                  if cdsConsulta.FieldByName('MODO').AsString='NO PROVISIONADO' then
                  begin
                     cdsConsulta.Edit;
                     cdsConsulta.FieldByName('MTOBASERET').AsFloat := cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
                  // Inicio HPC_201401_CAJA
                     // cdsConsulta.FieldByName('MONTORET').AsFloat   := FRound( cdsConsulta.FieldByName('DEMTOLOC').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                     if cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
                        cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                        FRound(cdsConsulta.FieldByName('DEMTOLOC').AsFloat * 0.03, 15, 2 )
                     else
                        cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                        FRound(cdsConsulta.FieldByName('DEMTOLOC').AsFloat * 0.06, 15, 2 );
                  // Fin HPC_201401_CAJA
                     xTotAPagRet:=xTotAPagRet+cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                  end
                  else // DOCUMENTOS PROVISIONADOS
                  begin
                     if cdsConsulta.FieldByName('TCANJEID').AsString<>'LE' then//FACTURAS PROVISIONADAS
                     begin
                     // si tiene marca desde CxP (PROVRETIGV='S')
                        if (cdsConsulta.FieldByName('PROVDOC').AsString='S') then
                        begin
                           xAplica := True;
                           if (cdsConsulta.FieldByName('CPGRAVAD').AsFloat+cdsConsulta.FieldByName('CPIGV').AsFloat)>0 then
                           begin
                             // xPorcAplica := cdsConsulta.FieldByName('DEMTOLOC').AsFloat/(cdsConsulta.FieldByName('CPMTOLOC').AsFloat-cdsConsulta.FieldByName('CPPAGLOC').AsFloat);
                              xPorcAplica := cdsConsulta.FieldByName('PORCPAGO').AsFloat;
                              cdsConsulta.Edit;
                              // SI LA MONEDA DEL DOCUMENTO ES EN SOLES
                              if cdsConsulta.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
                              begin
                                 cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((cdsConsulta.FieldByName('CPGRAVAD').AsFloat+cdsConsulta.FieldByName('CPIGV').AsFloat)*xPorcAplica,15,2);
                              // Inicio HPC_201401_CAJA
                                 // cdsConsulta.FieldByName('MONTORET').AsFloat   := FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                                 if cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.03, 15, 2 )
                                 else
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.06, 15, 2 );
                              // Fin HPC_201401_CAJA
                              end
                              else
                              begin
                                 cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((cdsConsulta.FieldByName('CPGRAVAD').AsFloat+cdsConsulta.FieldByName('CPIGV').AsFloat)*xPorcAplica*cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
                              // Inicio HPC_201401_CAJA
                                 // cdsConsulta.FieldByName('MONTORET').AsFloat   := FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                                 if cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.03, 15, 2 )
                                 else
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.06, 15, 2 );
                              // Fin HPC_201401_CAJA
                              end;
                              xTotAPagRet:=xTotAPagRet+cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                           end
                           else
                           begin
                              cdsConsulta.Edit;
                              cdsConsulta.FieldByName('MTOBASERET').AsFloat := cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
                           // Inicio HPC_201401_CAJA
                              // cdsConsulta.FieldByName('MONTORET').AsFloat   := FRound( cdsConsulta.FieldByName('DEMTOLOC').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                              if cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
                                 cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                 FRound(cdsConsulta.FieldByName('DEMTOLOC').AsFloat * 0.03, 15, 2 )
                              else
                                 cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                 FRound(cdsConsulta.FieldByName('DEMTOLOC').AsFloat * 0.06, 15, 2 );
                           // Fin HPC_201401_CAJA
                              xTotAPagRet:=xTotAPagRet+cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                           end;
                        end
                        else // si no tiene marca desde CxP
                        begin
                          // xPorcAplica := cdsConsulta.FieldByName('DEMTOLOC').AsFloat/(cdsConsulta.FieldByName('CPMTOLOC').AsFloat-cdsConsulta.FieldByName('CPPAGLOC').AsFloat);
                           xPorcAplica := cdsConsulta.FieldByName('PORCPAGO').AsFloat;

                           // VHN CAMBIO PORQUE NO DEBE GENERQAR RETENCION
                           if (DMTE.cdsConsulta.FieldByName('PROVDOC').AsString='S') then
                           begin
                              cdsConsulta.Edit;
                              // SI LA MONEDA DEL DOCUMENTO ES EN SOLES
                              if cdsConsulta.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
                              begin
                                 cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((cdsConsulta.FieldByName('CPGRAVAD').AsFloat+cdsConsulta.FieldByName('CPIGV').AsFloat)*xPorcAplica,15,2);
                              // Inicio HPC_201401_CAJA
                                 // cdsConsulta.FieldByName('MONTORET').AsFloat   := FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                                 if cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.03, 15, 2 )
                                 else
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.06, 15, 2 );
                              // Fin HPC_201401_CAJA
                              end
                              else
                              begin
                                 cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((cdsConsulta.FieldByName('CPGRAVAD').AsFloat+cdsConsulta.FieldByName('CPIGV').AsFloat)*xPorcAplica*cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
                              // Inicio HPC_201401_CAJA
                                 // cdsConsulta.FieldByName('MONTORET').AsFloat   := FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat* DMTE.xTasaPorce/ 100, 15, 2 );
                                 if cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.03, 15, 2 )
                                 else
                                    cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                                    FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.06, 15, 2 );
                              // Fin HPC_201401_CAJA
                              end;
                              xTotAPagRet:=xTotAPagRet+cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                           end;
                        end;
                     end
                     else // si son Letras
                     begin
                        InsertaLETRASEnCNT320;
                        GrabaNumeroRetencion;
                     end;
                  end;
               end;
            end;
         end;
      end;
      cdsConsulta.next;
   end;

   if (xTotAPagRet>=DMTE.xTasaMonto) or (xAplica) then
   begin
      cdsConsulta.First;
      while not cdsConsulta.Eof do
      begin
         if cdsConsulta.FieldByName('MTOBASERET').AsFloat<>0 then
         begin
            InsertaEnCNT320;
         end;
         cdsConsulta.Next;
      end;
      GrabaNumeroRetencion;
      Result:=True;
   end;

   cdsConsulta.IndexFieldNames := '';
end;


function TDMTE.CalculaRetencionIGVGlobal:Boolean;
var
   xRegAct     : TBookMark;
   xSQL, xClauxid,xProv : String;
   xBreak,bMayorQueTasa      : Boolean;
   //NUEVAS VARIABLES
   xTotAPagRet,xPorcAplica : double;
   xAplica : Boolean;
   sRetNC : String;
begin
// Inicio HPC_201401_CAJA
// se reindenta
// se modifica para que Genere Retención en base a Monto Total de Documentos a Pagar y
// no sólo en base a marca registrada en CXP
// se bifurca retencion del 6% para documentos con fecha de emisión anterior al 01/03/2014
// se bifurca retencion del 3% para documentos con fecha de emisión mayor o igual al 01/03/2014

   Result:=False;
  // Para Saber si la Compañía Retiene IGV.
   xSQL:='Select CIAID, CIARETIGV from TGE101 where CIAID='''+cdsEgrCaja.FieldByName('CIAID').AsString+''' ';
   cdsQry.Close;
   cdsQry.Datarequest( xSQL );
   cdsQry.Open;

	if cdsQry.FieldByName('CIARETIGV').AsString<>'S' then Exit;

	// Concepto y Cuenta de Retención
	xSQL:='Select CPTOID, CUENTAID from CAJA201 Where CPTOIS=''R''';
	cdsQry.Close;
	cdsQry.Datarequest( xSQL );
	cdsQry.Open;

	xCptoRet:=cdsQry.FieldByName('CPTOID').AsString;
	xCtaRet :=cdsQry.FieldByName('CUENTAID').AsString;

// Tasas de La Retención
   xSQL:='SELECT A.*, B.PROVRETIGV '
        +'  FROM (SELECT ''PROVISIONADO'' MODO, B.PROVRETIGV PROVDOC, B.TCANJEID, A.DETCPAG DETCDOC, B.TMONID, '
        +'               A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, '
        +'               A.PROVRUC, A.DOCID2, A.TDIARID2, A.CPANOMM, A.CPNOREG, A.CPSERIE, A.CPNODOC, A.CPFEMIS, '
        +'               A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, '
        +'               NVL(B.FLAGVAR2,''N'') DETRACCION, '
        +'               CASE WHEN B.TMONID='+Quotedstr(DMTE.wTmonLoc)
        +'                    THEN case when (nvl(B.CPMTOLOC,0)-nvl(B.CPPAGLOC,0))>0 '
        +'                              then ROUND(A.DEMTOLOC/(nvl(B.CPMTOLOC,0)-nvl(B.CPPAGLOC,0)),5) '
        +'                              else 0 end '
        +'                    ELSE case when (nvl(B.CPMTOEXT,0)-nvl(B.CPPAGEXT,0))>0 '
        +'                              then ROUND(A.DEMTOEXT/(nvl(B.CPMTOEXT,0)-nvl(B.CPPAGEXT,0)),5) '
        +'                              else 0 end '
        +'               END PORCPAGO, ''D'' DEDH,'
        +'               B.CPFEMIS CPFEMIPROV, '
        +'               (nvl(B.CPGRAVAD,0)+nvl(B.CPGRAVAD2,0)+nvl(B.CPNOGRAV,0)+nvl(B.CP_OTROS,0)) CPGRAVAD, B.CPNOGRAV, '
        +'               (nvl(B.CPIGV,0)+nvl(B.CPIGV2,0)+nvl(B.IGV_GRA_NO_DEST,0)) CPIGV, '
        +'               B.CPMTOLOC, B.CPMTOEXT, C.DOCRETIGV, C.DOCRESTA, 0.00 MTOBASERET, 0.00 MONTORET '
        +'          FROM CAJA303 A, CXP301 B, TGE110 C '
        +'         WHERE A.CIAID='+Quotedstr(cdsEgrCaja.FieldByName('CIAID').AsString)
        +'           AND A.TDIARID='+Quotedstr(cdsEgrCaja.FieldByName('TDIARID').AsString)
        +'           AND A.ECANOMM='+Quotedstr(cdsEgrCaja.FieldByName('ECANOMM').AsString)
        +'           AND A.ECNOCOMP='+Quotedstr(cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
        +'           AND B.CIAID=A.CIAID2 AND B.TDIARID=A.TDIARID2 AND B.CPANOMES=A.CPANOMM AND B.CPNOREG=A.CPNOREG '
        +'           AND C.DOCMOD=''CXP'' and C.DOCID=A.DOCID2 '
        +'        UNION ALL '
        +'        SELECT ''NO PROVISIONADO'' MODO, '''' PROVDOC, '''' TCANJEID, A.DETCPAG DETCDOC, A.TMONID, '
        +'               A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, '
        +'               B.PROVRUC, A.DOCID2, A.TDIARID2, A.CPANOMM, A.CPNOREG, A.CPSERIE, A.CPNODOC, A.CPFEMIS, '
        +'               A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, '
        +'               ''N'' DETRACCION, '
        +'               1 PORCPAGO, A.DEDH, '
        +'               A.CPFEMIS CPFEMISPROV, '
        +'               0.00 CPGRAVAD, 0.00 CPNOGRAV, '
        +'               0.00 CPIGV, '
        +'               DEMTOLOC CPMTOLOC, DEMTOEXT CPMTOEXT, C.DOCRETIGV, C.DOCRESTA, 0.00 MTOBASERET, 0.00 MONTORET '
        +'          FROM CAJA301 A, TGE110 C, TGE201 B '
        +'         WHERE A.CIAID='+Quotedstr(cdsEgrCaja.FieldByName('CIAID').AsString)
        +'           AND A.TDIARID='+Quotedstr(cdsEgrCaja.FieldByName('TDIARID').AsString)
        +'           AND A.ECANOMM='+Quotedstr(cdsEgrCaja.FieldByName('ECANOMM').AsString)
        +'           AND A.ECNOCOMP='+Quotedstr(cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
        +'           AND '+DMTE.wReplacCeros+'(FLAGVAR,'' '')<>''R'' AND C.DOCMOD=''CXP'' and C.DOCID=A.DOCID2 '
        +'           AND B.CLAUXID=A.CLAUXID AND B.PROV=A.PROV '
        +'       ) A, CNT201 B '
        +' WHERE B.CLAUXID=A.CLAUXID AND B.AUXID=A.PROV '
        +' ORDER BY A.CLAUXID, A.PROV,CPNOREG';
   cdsConsulta.IndexFieldNames:='';
   cdsConsulta.Filter:='';
   cdsConsulta.Filtered:=False;
	cdsConsulta.Close;
	cdsConsulta.DataRequest( xSQL );
	try
		cdsConsulta.Open;
	except
	end;

	cdsConsulta.IndexFieldNames := '';
	cdsConsulta.IndexFieldNames:='CLAUXID;PROV;CPNOREG';

   {
   sRetNC:='';
   DMTE.cdsConsulta.First;
   while not DMTE.cdsConsulta.Eof do
   begin
      if DMTE.cdsConsulta.FieldByName('DOCID2').AsString='01' then
      begin
         if DMTE.cdsConsulta.FieldByName('PROVDOC').AsString='S' then
            sRetNC:='S';
      end;
      DMTE.cdsConsulta.next;
   end;

   DMTE.cdsConsulta.First;
   while not DMTE.cdsConsulta.Eof do
   begin
      if (DMTE.cdsConsulta.FieldByName('DOCID2').AsString='07') and (DMTE.cdsConsulta.FieldByName('PROVDOC').AsString='') then
      begin
         if sRetNC='S' then
         begin
            DMTE.cdsConsulta.Edit;
            DMTE.cdsConsulta.FieldByName('PROVDOC').AsString:=sRetNC;
            DMTE.cdsConsulta.Post;
         end;
      end;
      DMTE.cdsConsulta.next;
   end;
   }

	xSQL:='Select * '
        +'  from CNT320 '
        +' where CIAID='+quotedstr(cdsEgrCaja.FieldByName('CIAID').AsString)
        +'   and ANOMM='+quotedstr(cdsEgrCaja.FieldByName('ECANOMM').AsString)
        +'   and TDIARID='+quotedstr(cdsEgrCaja.FieldByName('TDIARID').AsString)
        +'   and ECNOCOMP='+quotedstr(cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
        +'   and CLAUXID='+quotedstr(cdsConsulta.FieldByName('CLAUXID').AsString)
        +'   and AUXID='+quotedstr(cdsConsulta.FieldByName('PROV').AsString);
   cdsRetencion.Close;
   cdsRetencion.IndexFieldNames:='';
   cdsRetencion.Datarequest( xSQL );
   cdsRetencion.Open;

   xProv:=cdsConsulta.FieldByName('PROV').AsString;
   xTotRetMN:=0;   xTotRetME:=0;
   xTotPagMN:=0;   xTotPagME:=0;
   xTRetLoc :=0;   xTRetExt :=0;

   xTotAPagRet:=0;
   xAplica := False;
   cdsConsulta.First;
   while not cdsConsulta.Eof do
   begin
      if cdsConsulta.FieldByName('DEDH').AsString='D' then // si es Debe, o sea si es pago
      begin
      // si el proveedor retiene
         if ( cdsConsulta.FieldByName('PROVRETIGV').AsString='S' ) and
            ( cdsConsulta.FieldByName('DETRACCION').AsString<>'S' ) then
         begin
         // si el documento retiene
            if cdsConsulta.FieldByName('DOCRETIGV').AsString='S' then
            begin
            // si la fecha de emisión es >= a la fecha mínima de retención ('01/06/2002')
               if (cdsConsulta.FieldByName('CPFEMIS').AsDateTime>=xTasaFec) then
               begin
               // DOCUMENTOS NO PROVISIONADOS
                  if cdsConsulta.FieldByName('MODO').AsString='NO PROVISIONADO' then
                  begin
                     cdsConsulta.Edit;
                     cdsConsulta.FieldByName('MTOBASERET').AsFloat := cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
                     // cdsConsulta.FieldByName('MONTORET').AsFloat   := FRound( cdsConsulta.FieldByName('DEMTOLOC').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                     if cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
                        cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                        FRound(cdsConsulta.FieldByName('DEMTOLOC').AsFloat * 0.03, 15, 2 )
                     else
                        cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                        FRound(cdsConsulta.FieldByName('DEMTOLOC').AsFloat * 0.06, 15, 2 );
                     xTotAPagRet:=xTotAPagRet+cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                  end
                  else // DOCUMENTOS PROVISIONADOS
                  begin
                     if cdsConsulta.FieldByName('TCANJEID').AsString<>'LE' then//FACTURAS PROVISIONADAS
                     begin
                     // si tiene marca desde CxP (PROVRETIGV='S')
                        if (cdsConsulta.FieldByName('PROVDOC').AsString='S') then xAplica := True;
                        if (cdsConsulta.FieldByName('CPIGV').AsFloat)>0 then
                        begin
                           xPorcAplica := cdsConsulta.FieldByName('PORCPAGO').AsFloat;
                           cdsConsulta.Edit;
                        // Si la moneda del documento es en Nuevos Soles
                           if cdsConsulta.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
                           begin
// Inicio HPC_201706_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
// Inicio HPC_201705_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
                              cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((cdsConsulta.FieldByName('CPGRAVAD').AsFloat+cdsConsulta.FieldByName('CPIGV').AsFloat)*xPorcAplica,15,2);
                              //cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((cdsConsulta.FieldByName('DEMTOLOC').AsFloat)*xPorcAplica,15,2);
// Fin HPC_201705_CAJA
// Fin HPC_201706_CAJA

                            //cdsConsulta.FieldByName('MONTORET').AsFloat   := FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                              if cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
                                 cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                        FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.03, 15, 2 )
                              else
                                 cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                        FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.06, 15, 2 );
                           end // si es en Dólares
                           else
                           begin
// Inicio HPC_201706_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
// Inicio HPC_201705_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
                              cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((cdsConsulta.FieldByName('CPGRAVAD').AsFloat+cdsConsulta.FieldByName('CPIGV').AsFloat)*xPorcAplica*cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
                              //cdsConsulta.FieldByName('MTOBASERET').AsFloat := DMTE.FRound((cdsConsulta.FieldByName('DEMTOEXT').AsFloat)*xPorcAplica,15,2);
// Fin HPC_201705_CAJA
// Fin HPC_201706_CAJA

                              //cdsConsulta.FieldByName('MONTORET').AsFloat   := FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat* DMTE.xTasaPorce / 100, 15, 2 );
                              if cdsConsulta.FieldByName('CPFEMIS').AsDateTime >= strtodate('01/03/2014') then
                                 cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                        FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.03, 15, 2 )
                              else
                                 cdsConsulta.FieldByName('MONTORET').AsFloat :=
                                        FRound(cdsConsulta.FieldByName('MTOBASERET').AsFloat * 0.06, 15, 2 );
                           end;
                           xTotAPagRet:=xTotAPagRet+cdsConsulta.FieldByName('MTOBASERET').AsFloat;
                        end;
                     end
                     else // si son Letras
                     begin
                        InsertaLETRASEnCNT320;
                        GrabaNumeroRetencion;
                     end;
                  end;
               end;
            end;
         end;
      end;
      cdsConsulta.next;
   end;

   if (xTotAPagRet>=DMTE.xTasaMonto) or (xAplica) then
   begin
   // Inicio HPC_201603_CAJA
   // Nueva Rutina de grabación de Registros de Retención IGV
      {
      cdsConsulta.First;
      while not cdsConsulta.Eof do
      begin
         if cdsConsulta.FieldByName('MTOBASERET').AsFloat<>0 then
         begin
            InsertaEnCNT320;
         end;
         cdsConsulta.Next;
      end;
      GrabaNumeroRetencion;
      }
   // Fin HPC_201603_CAJA

      Result:=True;
      InsertaEnCNT320Global;
      If not xSigueGrab then
         Result:=False
      Else
         Result:=True;
   end;

   cdsConsulta.IndexFieldNames := '';
// Fin HPC_201401_CAJA
end;


procedure TDMTE.InsertaRetencionIGV;
var
   xReg, xWhere : String;
begin
   xReg := GeneraCorrelativo( cdsRegCxP , 'CPNOREG' ) ;

   cdsRegCxP.Insert;
   cdsRegCxP.FieldByName('CIAID').Value   :=cdsEgrCaja.FieldByName('CIAID').AsString;
   cdsRegCxP.FieldByName('TDIARID').Value :=cdsEgrCaja.FieldByName('TDIARID').AsString;
   cdsRegCxP.FieldByName('ECANOMM').Value :=cdsEgrCaja.FieldByName('ECANOMM').AsString;
   cdsRegCxP.FieldByName('ECNOCOMP').Value:=cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   cdsRegCxP.FieldByName('CPNOREG').Value :=xReg;
   cdsRegCxP.FieldByName('DEFCOMP').Value :=cdsEgrCaja.FieldByName('ECFCOMP').Value;
   cdsRegCxP.FieldByName('CPFEMIS').Value :=cdsEgrCaja.FieldByName('ECFCOMP').Value;
   cdsRegCxP.FieldByName('CPFVCMTO').Value:=cdsEgrCaja.FieldByName('ECFCOMP').Value;
   cdsRegCxP.FieldByName('CPANOMM').Value :='';
   cdsRegCxP.FieldByName('DETCPAG').Value :=cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   cdsRegCxP.FieldByName('DETCDOC').Value :=cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   cdsRegCxP.FieldByName('DOCID2').Value  :='';
   cdsRegCxP.FieldByName('CPTOID').Value  :=xCptoRet;
   cdsRegCxP.FieldByName('CUENTAID').Value:=xCtaRet;
   cdsRegCxP.FieldByName('FLAGVAR').Value :='R';

   xWhere:='CIAID='''+cdsEgrCaja.FieldByName('CIAID').AsString+''' AND CUENTAID='''+xCtaRet+'''';
   DMTE.DisplayDescrip('prvTGE','TGE202','CUENTAID, CTA_CCOS, CTA_AUX',xWhere,'CuentaId');

   if cdsQry.FieldByName('CTA_AUX').AsString='S' then
   begin
      cdsRegCxP.FieldByName('CLAUXID').Value :=cdsConsulta.FieldByName('CLAUXID').AsString;
      cdsRegCxP.FieldByName('PROV').Value    :=cdsConsulta.FieldByName('PROV').AsString;
   end;

   if cdsQry.FieldByName('CTA_CCOS').AsString='S' then
   begin
      cdsRegCxP.FieldByName('CCOSID').Value :=cdsConsulta.FieldByName('CCOSID').AsString;
   end;

   cdsRegCxP.FieldByName('TMONID').Value  :=DMTE.wTMonLoc;
   cdsRegCxP.FieldByName('CPSERIE').Value :='';
   cdsRegCxP.FieldByName('CPNODOC').Value :='';
   if cdsEgrCaja.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
   begin
     cdsRegCxP.FieldByName('DEMTOORI').Value:=xRetencionL;
     cdsRegCxP.FieldByName('DEMTOLOC').Value:=xRetencionL;
     cdsRegCxP.FieldByName('DEMTOEXT').Value:=xRetencionE;
   end
   else
   begin
     cdsRegCxP.FieldByName('DEMTOORI').Value:=xRetencionE;
     cdsRegCxP.FieldByName('DEMTOLOC').Value:=xRetencionL;
     cdsRegCxP.FieldByName('DEMTOEXT').Value:=xRetencionE;
   end;

   cdsRegCxP.FieldByName('DEDH').Value    :='H';
   xWhere:='FECHA='+wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,cdsRegCxP.FieldByName('DEFCOMP').AsDateTime)+''')';
   cdsRegCxP.FieldByName('DEANO').Value   :=DMTE.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
   cdsRegCxP.FieldByName('DEMM').Value    :=cdsQry.FieldByName('FECMES').AsString;
   cdsRegCxP.FieldByName('DEDD').Value    :=cdsQry.FieldByName('FECDIA').AsString;
   cdsRegCxP.FieldByName('DESS').Value    :=cdsQry.FieldByName('FECSS').AsString;
   cdsRegCxP.FieldByName('DESEM').Value   :=cdsQry.FieldByName('FECSEM').AsString;
   cdsRegCxP.FieldByName('DETRI').Value   :=cdsQry.FieldByName('FECTRIM').AsString;
   cdsRegCxP.FieldByName('DEAASS').Value  :=cdsQry.FieldByName('FECAASS').AsString;
   cdsRegCxP.FieldByName('DEAASem').Value :=cdsQry.FieldByName('FECAASEM').AsString;
   cdsRegCxP.FieldByName('DEAATri').Value :=cdsQry.FieldByName('FECAATRI').AsString;
   cdsPost( cdsRegCxP );

   cdsEgrCaja.Edit;
	cdsEgrCaja.FieldByName('ECMTOORI').AsFloat:=cdsEgrCaja.FieldByName('ECMTOORI').AsFloat-cdsRegCxP.FieldByName('DEMTOORI').AsFloat;
	cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat:=cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat-cdsRegCxP.FieldByName('DEMTOLOC').AsFloat;
	cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat:=cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat-cdsRegCxP.FieldByName('DEMTOEXT').AsFloat;
	cdsPost( cdsEgrCaja );
end;


procedure TDMTE.InsertaEnCNT320;
var
   xFactor : double;
begin
	xFactor:=1;
	cdsRetencion.Insert;
	cdsRetencion.FieldByname('CIAID').AsString     :=  cdsEgrCaja.FieldByName('CIAID').AsString;
   cdsRetencion.FieldByname('CIARUC').AsString    :=  DisplayDescrip('prvTGE','TGE101','CIARUC','CIAID='+Quotedstr(cdsEgrCaja.FieldByName('CIAID').AsString),'CIARUC');
	cdsRetencion.FieldByname('ANOMM').AsString     :=  cdsEgrCaja.FieldByName('ECANOMM').AsString;
	cdsRetencion.FieldByname('TDIARID').AsString   :=  cdsEgrCaja.FieldByName('TDIARID').AsString;
	cdsRetencion.FieldByname('ECNOCOMP').AsString  :=  cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
	cdsRetencion.FieldByname('FECPAGO').AsDateTime :=  cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
	cdsRetencion.FieldByname('CLAUXID').AsString   :=  cdsConsulta.FieldByName('CLAUXID').AsString;
	cdsRetencion.FieldByname('AUXID').AsString     :=  cdsConsulta.FieldByName('PROV').AsString;
	cdsRetencion.FieldByname('AUXRUC').AsString    :=  cdsConsulta.FieldByName('PROVRUC').AsString;
	cdsRetencion.FieldByname('DOCID').AsString     :=  cdsConsulta.FieldByName('DOCID2').AsString;
	cdsRetencion.FieldByname('DOCDES').AsString    :=  cdsConsulta.FieldByName('CPANOMM').AsString;
	cdsRetencion.FieldByname('SERIE').AsString     :=  cdsConsulta.FieldByName('CPSERIE').AsString;
	cdsRetencion.FieldByname('NODOC').AsString     :=  cdsConsulta.FieldByName('CPNODOC').AsString;
	cdsRetencion.FieldByname('FECEMI').AsDateTime  :=  cdsConsulta.FieldByName('CPFEMIS').AsDateTime;
	cdsRetencion.FieldByname('TRANID').AsString    :=  '';
	cdsRetencion.FieldByname('TRANDES').AsString   :=  '';
	cdsRetencion.FieldByname('DH').AsString        :=  'H';

	if cdsConsulta.FieldByname('TMONID').AsString=DMTE.wTMonLoc then
		cdsRetencion.FieldByname('MTOORI').AsFloat  :=  cdsConsulta.FieldByName('MTOBASERET').AsFloat
	else
		if cdsConsulta.FieldByname('TMONID').AsString=DMTE.wTMonExt then
			cdsRetencion.FieldByname('MTOORI').AsFloat:=  DMTE.FROUND(cdsConsulta.FieldByName('MTOBASERET').AsFloat
                                                                     /cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);

	cdsRetencion.FieldByname('MTOLOC').AsFloat     :=  cdsConsulta.FieldByName('MTOBASERET').AsFloat;
	cdsRetencion.FieldByname('MTOEXT').AsFloat     :=  DMTE.FROUND(cdsConsulta.FieldByName('MTOBASERET').AsFloat
                                                                     /cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);

	cdsRetencion.FieldByname('TCAMB').AsFloat      :=  cdsConsulta.FieldByName('DETCDOC').AsFloat;

	if cdsConsulta.FieldByname('TMONID').AsString=DMTE.wTMonLoc then
      cdsRetencion.FieldByname('MTORETORI').AsFloat  := cdsConsulta.FieldByName('MONTORET').AsFloat
   else
      cdsRetencion.FieldByname('MTORETORI').AsFloat  := DMTE.FRound(cdsConsulta.FieldByName('MONTORET').AsFloat
                                                           /cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
   cdsRetencion.FieldByname('MTORETLOC').AsFloat  := cdsConsulta.FieldByName('MONTORET').AsFloat;
   cdsRetencion.FieldByname('MTORETEXT').AsFloat  := DMTE.FRound(cdsConsulta.FieldByName('MONTORET').AsFloat
                                                           /cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
	cdsRetencion.FieldByname('TMONIDFAC').AsString :=  cdsConsulta.FieldByname('TMONID').AsString;
	cdsRetencion.FieldByname('USUARIO').AsString := wUsuario;
	cdsRetencion.FieldByname('FREG').Value       := DateS;
	cdsRetencion.FieldByname('HREG').Value       := Time;
// Inicio HPC_201603_CAJA
// pasa de Estado de Actualización a Estado Browse a cdsRetencion
//	cdsPost( cdsRetencion );
   cdsRetencion.Post;
// Fin HPC_201603_CAJA
end;


procedure TDMTE.GrabaNumeroRetencion;
var
   xSerie, xCiaRUC, xNumero, xSQL, xwhere,xtmondes : String;
   xcontador  : Integer;
   xsuma, xsumatot : Double;
begin
// RUC de la Compañía
   xCiaRUC := DisplayDescrip('prvTGE','TGE101','CIARUC',
                     'CIAID='+Quotedstr(cdsEgrCaja.FieldByName('CIAID').AsString),'CIARUC');

// Descripción de la moneda
   xWhere:='TMONID='+quotedstr(Wtmonloc);
   xtmondes:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');

// Determina Serie a utilizar por los Comprobantes de Retención
   xSQL:='select SERIERET from CXP104 '
        +'where VIGENCIA=''S'' '
        +'  and CIARUC='+QuotedStr(xCiaRUC);

   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;

   xSerie := cdsQry.FieldByName('SERIERET').AsString;

// Concepto y Cuenta de Retención
   xSQL:='Select Max( RETNUMERO ) NUMERO '
        +'From CNT320 '
        +'where CIARUC='+QuotedStr(xCiaRUC)
        +'  and RETSERIE='+quotedstr(xSerie);
   cdsQry.Close;
   cdsQry.Datarequest( xSQL );
   cdsQry.Open;

   if cdsQry.FieldByName('NUMERO').AsString='' then
      xNumero:='0000000001'
   else
      xNumero:=DMTE.StrZero( IntToStr( StrToInt(cdsQry.FieldByName('NUMERO').AsString) +1 ), 10 );

// Inicio HPC_201603_CAJA
// reemplaza rutina de grabación de Serie, Número y Descripción en número del Importe Total
// de Retención
{
   xcontador:=0;
   xsuma:=0; xSumaTot:=0;
   cdsRetencion.First;
   while not cdsRetencion.EOF do begin
      cdsRetencion.Edit;
      cdsRetencion.FieldByname('RETSERIE').AsString   := xSerie;
      cdsRetencion.FieldByname('RETNUMERO').AsString  := xNumero;

      xSuma:=xSuma+cdsRetencion.FieldByname('MTORETLOC').AsFLOAT;
      xSumaTot:=xSumaTot+cdsRetencion.FieldByname('MTORETLOC').AsFLOAT;

      cdsRetencion.Next;

      xContador := xContador+1;
      if xContador >= xNumLinRet then
      begin
      // Inicio HPC_201401_CAJA
         //DMTE.ControlTran(0,cdsRetencion, 'RETENCION');
         xSQL:='Update CNT320 SET RETTOTDES='''+strnum(xsuma)+' '+XTMONDES+''' WHERE RETNUMERO='''+XNUMERO+'''';
         cdsQry.Close;
         cdsQry.Datarequest( xSQL );
         try
           cdsQry.Execute;
         except
           DMTE.ControlTran(1,nil,'');
         end;
         xSuma:=0;
         xContador:=0;
         xSQL:='Select Max( RETNUMERO ) NUMERO '
              +'From CNT320 '
              +'where CIARUC='+QuotedStr(xCiaRUC)
              +'  and RETSERIE='+quotedstr(xSerie);
         cdsQry.Close;
         cdsQry.Datarequest( xSQL );
         cdsQry.Open;
         if cdsQry.FieldByName('NUMERO').AsString='' then
            xNumero:='0000000001'
         else
            xNumero:=DMTE.StrZero( IntToStr( StrToInt(cdsQry.FieldByName('NUMERO').AsString)+1),10);
      // Fin HPC_201401_CAJA
      end;
   end;
   DMTE.ControlTran(0,cdsRetencion, 'RETENCION');
   xSQL:='update CNT320 set RETTOTDES='''+strnum(xSuma)+' '+XTMONDES+''' WHERE RETNUMERO='''+XNUMERO+'''';
   try
      DCOM1.AppServer.EjecutaSQL(xSQL);
   except
      DMTE.ControlTran(1,nil,'');
   end;
}
   xcontador:=0;
   xsuma:=0; xSumaTot:=0;
   cdsRetencion.First;
   while not cdsRetencion.EOF do
   begin
      cdsRetencion.Edit;
      cdsRetencion.FieldByname('RETSERIE').AsString   := xSerie;
      cdsRetencion.FieldByname('RETNUMERO').AsString  := xNumero;
      xSuma:=xSuma+cdsRetencion.FieldByname('MTORETLOC').AsFloat;
      cdsRetencion.Next;

      xContador := xContador+1;
      if xContador >= xNumLinRet then
      begin
         xSQL:='Update CNT320 '
            + '   set RETTOTDES='''+strnum(xSuma)+' '+xTMonDes
            + ' where RETSERIE = '+quotedstr(xSerie)
            + '   and RETNUMERO='+xNumero+'''';
         cdsQry.Close;
         cdsQry.Datarequest( xSQL );
         try
           cdsQry.Execute;
         except
           DMTE.ControlTran(1,nil,'');
         end;
         xSuma:=0;
         xContador:=0;
         xSQL:='Select Max( RETNUMERO ) NUMERO '
              +'From CNT320 '
              +'where CIARUC='+QuotedStr(xCiaRUC)
              +'  and RETSERIE='+quotedstr(xSerie);
         cdsQry.Close;
         cdsQry.Datarequest( xSQL );
         cdsQry.Open;
         if cdsQry.FieldByName('NUMERO').AsString='' then
            xNumero:='0000000001'
         else
            xNumero:=DMTE.StrZero( IntToStr( StrToInt(cdsQry.FieldByName('NUMERO').AsString)+1),10);
      // Fin HPC_201401_CAJA
      end;
   end;

end;



function TDMTE.GrabaUltimoRegistro(xAutoNum, xCia, xTDiario, xAno,
  xMes: String; xNumUsu: Integer): String;
var
   xSQL : string;
begin
   If xAutoNum<>'N' then begin
      xSQL := '';
      xSQL := 'Select Numero from TGE301 '
            + 'Where CiaID='+''''+xCia+''''+' and '
            + 'TDiarID='+''''+xTDiario+'''';
      if (xAutoNum='A') or (xAutoNum='M') then xSQL := xSQL + ' and Ano='+''''+xAno+'''';
      if xAutoNum='M' then xSQL := xSQL + ' and Mes='+''''+xMes+'''';
      xSQL := UpperCase( xSQL );
      cdsQry.Close;
      cdsQry.ProviderName:= 'prvTGE';
      cdsQry.DataRequest(xSQL); // Llamada remota al provider del servidor
      cdsQry.Open;

      if cdsQry.FieldByName('Numero').Value=null then
      begin
         Result := IntToStr( xNumUsu );

         xSQL := 'Insert into TGE301(CiaID,TDiarID';
         if (xAutoNum='A') or (xAutoNum='M') then xSQL:= xSQL+ ',Ano';
         if  xAutoNum='M'                    then xSQL:= xSQL+ ',Mes';
         xSQL := xSQL + ',Numero ) Values ('+''''+xCia+''''+','+''''+xTDiario+'''';
         if (xAutoNum='A') or (xAutoNum='M') then xSQL:= xSQL+ ','+''''+xAno+'''';
         if  xAutoNum='M'                    then xSQL:= xSQL+ ','+''''+xMes+'''';
         xSQL := xSQL + ','+Result+' )';
         xSQL := UpperCase( xSQL );

         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      end
      else begin
         Result := IntToStr( xNumUsu );
         xSQL := 'Update TGE301 Set Numero='+Result+' ';
         xSQL := xSQL + 'Where CiaID='+''''+xCia+''''+' and TDiarID='+''''+xTDiario+'''';
         if (xAutoNum='A') or (xAutoNum='M') then xSQL:= xSQL+ ' and Ano='+''''+xAno+'''';
         if  xAutoNum='M'                    then xSQL:= xSQL+ ' and Mes='+''''+xMes+'''';
         xSQL := UpperCase( xSQL );
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;
   end;
end;

function TDMTE.UltimoRegistro(xAutoNum, xCia, xTDiario, xAno,
  xMes: String): String;
var
   xSQL : string;
begin
   If xAutoNum<>'N' then
   begin
      xSQL := '';
      xSQL := 'Select Numero from TGE301 Where CiaID='+''''+xCia+''''+' and '
            + 'TDiarID='+''''+xTDiario+'''';
      if (xAutoNum='A') or (xAutoNum='M') then xSQL := xSQL + ' and Ano='+''''+xAno+'''';
      if  xAutoNum='M'                    then xSQL := xSQL + ' and Mes='+''''+xMes+'''';

      cdsQry.Close;
      cdsQry.ProviderName:='prvTGE';
      cdsQry.DataRequest(xSQL);    //este es la llamada remota al provider del servidor
      cdsQry.Open;

      if cdsQry.FieldByName('Numero').Value=null then
         result:='1'
      else begin
         result:=inttostr(cdsQry.FieldByName('Numero').Value+1);
      end;
   end
   else
      result:='';
end;

procedure TDMTE.AnulaRetencion;
var
   xSQL:string;
begin
// Inicio HPC_201401_CAJA
   xSQL:=' Update CNT320 '
        +'    set ECESTADO=''A'' '
        +'  where CIAID='+QuotedStr(cdsEgrCaja.FieldByName('CIAID').AsString)
        +'    and TDIARID='+QuotedStr(cdsEgrCaja.FieldByName('TDIARID').AsString)
        +'    and ANOMM='+QuotedStr(cdsEgrCaja.FieldByName('ECANOMM').AsString)
        +'    and ECNOCOMP='+QuotedStr(cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
      ShowMessage('Error: No se pudo Anular el Comprobante de Retención');
      xSigueGrab := False;
      exit;
   end;
// Fin HPC_201401_CAJA
end;

function TDMTE.FRound(xReal: double; xEnteros, xDecimal: Integer): double;
var
   xParteDec,xflgneg   : String;
   xDec: Integer;
   xMultiplo10, xUltdec, xNReal, xPDec : Double;
begin
   Result:=0;
   xflgneg:='0';

   if xReal<0 then
   begin
   xflgneg:='1';
   xReal:=xReal*-1;
   end;
   xreal := strtofloat(floattostr(xReal));

   if xReal=0 then exit;
// primer redondeo a un decimal + de lo indicado en los parámetros
   xDec := xDecimal+1;
   if xDec=0 then xMultiplo10:=1;
   if xDec=1 then xMultiplo10:=10;
   if xDec=2 then xMultiplo10:=100;
   if xDec=3 then xMultiplo10:=1000;
   if xDec=4 then xMultiplo10:=10000;
   if xDec=5 then xMultiplo10:=100000;
   if xDec=6 then xMultiplo10:=1000000;
   if xDec=7 then xMultiplo10:=10000000;

   xNreal := strtofloat(floattostr(xReal*xMultiplo10));
   xPdec  := int(strtofloat(floattostr(xReal)))*xMultiplo10;
   xPdec  := xNReal - xPDec;

   xPDec  := int(xPDec);
   xParteDec := floattostr(xPDec);
   if length(xParteDec)<xDec then
      xParteDec:=DMTE.strZero(xParteDec,xDec);


   if length(xParteDec)>=xDec then
      xultdec:=  strtofloat(copy(xParteDec,xDec,1))
   else begin
      xUltDec := 0;
   end;
   xNReal := strtofloat(floattostr(xReal*xMultiplo10/10));
   xNReal := int(xNReal);
   if xultdec>=5 then xNReal := xNReal+1;

   if xflgneg='1' then
   begin
   Result := (xNReal/(xMultiplo10/10))*-1;
   end
   else
   begin
   Result := xNReal/(xMultiplo10/10);
   end;
end;

function TDMTE.NombreMes(wwMes: string): String;
begin
   if wwMes='01' then result:='Enero';
   if wwMes='02' then result:='Febrero';
   if wwMes='03' then result:='Marzo';
   if wwMes='04' then result:='Abril';
   if wwMes='05' then result:='Mayo';
   if wwMes='06' then result:='Junio';
   if wwMes='07' then result:='Julio';
   if wwMes='08' then result:='Agosto';
   if wwMes='09' then result:='Setiembre';
   if wwMes='10' then result:='Octubre';
   if wwMes='11' then result:='Noviembre';
   if wwMes='12' then result:='Diciembre';
end;

function TDMTE.NombreAnoMes(wwAnoMes:string):String;
begin
   if length(wwAnoMes)=6 then
      result := DMTE.NombreMes(copy(wwAnoMes,5,2))+' '+copy(wwAnoMes,1,4)
   else
      result := '';
end;


/////////////////////////////////////
//  Procedimientos Nuevos de VHN  ///
/////////////////////////////////////

function TDMTE.BuscaCierre(wwCia, wwBanco, wwCCBanco,
  wwAnoMM: String): Boolean;
var
   xSQL : String;
begin
   xSQL := 'Select ANOMM From CAJA402  where CIAID='+QuotedStr(wwCia)
            +' and BANCOID='+QuotedStr(wwBanco);
   if length(wwCCBanco)>0 then
      xSQL := xSQL+' and CCBCOID='+QuotedStr(wwCCBanco);
   cdsRec.Filter:='';
   cdsRec.IndexFieldNames:='';
   cdsRec.Close;
   cdsRec.DataRequest(xSQL);
   cdsRec.Open;
   if cdsRec.RecordCount>0 then
   begin
      cdsRec.IndexFieldNames:='ANOMM';
      cdsRec.Last;
      if Strtoint(cdsRec.FieldByName('ANOMM').AsString)>=strtoint(wwAnoMM) then
         result:=true
      else
         result:=false;
   end
   else
      result:=false;
   cdsRec.Filter:='';
   cdsRec.IndexFieldNames:='';
   cdsRec.Close;
end;


function TDMTE.BuscaFechaCierre(wwCia, wwBanco, wwCCBanco : String;
  wwFecha: TDate ): Boolean;
var
   xSQL, xWhere, wwAnoMM, xMensaje : String;
   xAnoD, xDiaD, xMesD : word;
begin
   DecodeDate(wwFecha, xAnoD, xMesD, xDiaD);
   wwAnoMM := DMTE.StrZero( IntToStr( xAnoD ), 4 )+DMTE.StrZero( IntToStr( xMesD ), 2 );

   if length(wwCCBanco) = 0 then
   begin
      ShowMessage('La cuenta corriente del Banco no es válida, revise su referencia de Ctas.Ctes.');
      Result := true;
      exit;
   end;

   xSQL := 'Select * From CAJA402 '
          +'where CIAID ='+QuotedStr(wwCia)
          +'  and ANOMM   ='+QuotedStr(wwAnoMM)
          +'  and BANCOID ='+QuotedStr(wwBanco)
          +'  and CCBCOID ='+QuotedStr(wwCCBanco);
   cdsRec.Filter := '';
   cdsRec.IndexFieldNames := '';
   cdsRec.Close;
   cdsRec.DataRequest(xSQL);
   cdsRec.Open;

// Verifica si el Año+Mes a trabajar no está cerrado
// Inicio HPC_201401_CAJA
// Envía Mensaje si no hay Periodo Aperturado
   if cdsRec.RecordCount > 0 Then
   begin
      if (Length(cdsRec.FieldByName('CIERRE').AsString) = 0) Or
         (cdsRec.FieldByName('CIERRE').AsString = 'N') Then
      begin
         Result := False;
      end
      else
      begin
         Beep;
         xMensaje := NombreMes(inttostr(xMesD))+'-'+IntToStr(xAnoD)+' ya fué Cerrado '
                    +'para la Cta.Cte'+wwCCBanco+' del Banco'+wwBanco;
         MessageDlg(xMensaje, mtInformation, [mbOk], 0);
         Result := true;
      end;
   end
   else
   begin
      ShowMessage('No se ha aperturado el Año+Mes='+wwAnoMM+' para el Banco='+wwBanco+' Cta.Cte'+wwCCBanco);
      Result := True;
   end;
// Fin HPC_201401_CAJA
end;

procedure TDMTE.CalculaSaldo( xCia, xBanco, xCCBco : String; xFecFin : TDate;  Var nSaldoMN, nSaldoME : Double );
var
   xSQL, xMesAnt, xAnoAnt, xVacio : String;
   xSAntMN, xSAntMe  : Double;
   xAnoD, xDiaD, xMesD : word;
   xFecIni : TDate;
begin

   xVacio:='';
   if DMTE.SRV_D = 'ORACLE' then
    begin
     if Length(Trim(xCCBco))=0 then xCCBco := 'X';
      xVacio := 'X';
   end;

	 DecodeDate( xFecFin, xAnoD, xMesD, xDiaD );

   xFecIni := StrToDate( '01/'+StrZero( IntToStr( xMesD ), 2 )+'/'+IntToStr( xAnoD ) );

   if xMesD = 1 then
    begin
     xAnoD := xAnoD-1;
     xMesD := 12;
    end
   else
    begin
     xMesD := xMesD-1;
    end;

   xMesAnt := DMTE.StrZero( IntToStr(xMesD), 2 );
   xAnoAnt := DMTE.StrZero( IntToStr(xAnoD), 4 );

   xSQL:='Select MAX(B.SALDOFINMN) SALMN, MAX(B.SALDOFINME) SALME, '
        +  'SUM( INGRESOSMN ) INGMN, SUM( INGRESOSME) INGME, '
        +  'SUM( EGRESOSMN  ) EGRMN, SUM( EGRESOSME)  EGRME '
        +'From '
        +'( '
        +  'Select CIAID,BANCOID,CCBCOID, '
        +    'sum(case when TMONID='''+wTMonLoc+''' then '+wReplacCeros+'(NCOMTOLOC,0) else 0 end) INGRESOSMN, '
        +    'sum(case when TMONID='''+wTmonExt+''' then '+wReplacCeros+'(NCOMTOEXT,0) else 0 end) INGRESOSME, '
        +    '0 EGRESOSMN, '
        +    '0 EGRESOSME '
        +  'From CXC303 '
        +  'Where CIAID='''+xCia+''' and BANCOID='''+xBanco+''' '
        +    'and '+wReplacCeros+'(CCBCOID,'''+xVacio+''')='''+xCCBco+''''
        +    'and NCOESTADO=''C'' '
        +    'and CCFEMIS>='+wRepFuncDate+''''+FormatDateTime( wFormatFecha, xFecIni )+''') '
        +    'and CCFEMIS<='+wRepFuncDate+''''+FormatDateTime( wFormatFecha, xFecFin )+''') '
        +  'Group by CIAID, BANCOID, CCBCOID '
        +') A ';

   if DMTE.SRV_D = 'ORACLE' then
   begin
      xSQL:=xSQL+', CAJA402 B  '
           +'Where B.CIAID='''+xCia+''' AND B.BANCOID='''+xBanco+''' '
           +    'and '+wReplacCeros+'( B.CCBCOID,'''+xVacio+''')='''+xCCBco+''' '
           +    'and B.ANOMM='''+xAnoAnt+xMesAnt+'''';
   end
   else
   begin
      xSQL:=xSQL+' LEFT JOIN CAJA402 B ON B.CIAID='''+xCia+''' AND B.BANCOID='''+xBanco+''' '
           +                       'and '+wReplacCeros+'( B.CCBCOID,'''+xVacio+''')='''+xCCBco+''' '
           +                       'and B.ANOMM='''+xAnoAnt+xMesAnt+'''';
   end;

   cdsQry.Close;
   cdsQry.DataRequest( xSQL );
   cdsQry.Open;

///////

   xSQL:='Select MAX(B.SALDOFINMN) SALMN, MAX(B.SALDOFINME) SALME, '
        +  'SUM( INGRESOSMN ) INGMN, SUM( INGRESOSME) INGME, '
        +  'SUM( EGRESOSMN  ) EGRMN, SUM( EGRESOSME) EGRME '
        +'From '
        +'( '
        +  'Select CIAID, BANCOID, CCBCOID, '
        +    'sum(case when EC_IE=''I'' and TMONID='''+wTMonLoc+''' then '+wReplacCeros+'(ECMTOLOC,0) else 0 end) INGRESOSMN, '
        +    'sum(case when EC_IE=''I'' and TMONID='''+wTmonExt+''' then '+wReplacCeros+'(ECMTOEXT,0) else 0 end) INGRESOSME, '
        +    'sum(case when EC_IE=''E'' and TMONID='''+wTMonLoc+''' then '+wReplacCeros+'(ECMTOLOC,0) else 0 end) EGRESOSMN, '
        +    'sum(case when EC_IE=''E'' and TMONID='''+wTmonExt+''' then '+wReplacCeros+'(ECMTOEXT,0) else 0 end) EGRESOSME '
        +  'From CAJA302 '
        +  'Where CIAID='''+xCia+''' and BANCOID='''+xBanco+''' '
        +    'and '+wReplacCeros+'(CCBCOID,'''+xVacio+''')='''+xCCBco+''' '
        +    'AND ECESTADO=''C'' '
        +    'and ECFCOMP>='+wRepFuncDate+''''+FormatDateTime( wFormatFecha, xFecIni )+''') '
        +    'and ECFCOMP<='+wRepFuncDate+''''+FormatDateTime( wFormatFecha, xFecFin )+''') '
        +    'and EC_PROCE<>''C'' '
        +  'Group by CIAID, BANCOID, CCBCOID '
        +') A ';

   if DMTE.SRV_D = 'ORACLE' then
   begin
      xSQL:=xSQL+', CAJA402 B  '
           +'Where B.CIAID='''+xCia+''' AND B.BANCOID='''+xBanco+''' '
           +    'and '+wReplacCeros+'( B.CCBCOID,'''+xVacio+''')='''+xCCBco+''' '
           +    'and B.ANOMM='''+xAnoAnt+xMesAnt+'''';
   end
   else
   begin
      xSQL:=xSQL+' LEFT JOIN CAJA402 B ON B.CIAID='''+xCia+''' AND B.BANCOID='''+xBanco+''' '
           +                       'and '+wReplacCeros+'( B.CCBCOID,'''+xVacio+''')='''+xCCBco+''' '
           +                       'and B.ANOMM='''+xAnoAnt+xMesAnt+'''';
   end;

   cdsQry2.Filter  := '';
   cdsQry2.Filtered := False;
   cdsQry2.IndexFieldNames := '';
   cdsQry2.Close;
   cdsQry2.DataRequest( xSQL );
   cdsQry2.Open;

   cdsQry.Edit;
   cdsQry.FieldByname('INGMN').AsFloat:=cdsQry.FieldByname('INGMN').AsFloat+cdsQry2.FieldByname('INGMN').AsFloat;
   cdsQry.FieldByname('EGRMN').AsFloat:=cdsQry.FieldByname('EGRMN').AsFloat+cdsQry2.FieldByname('EGRMN').AsFloat;
   cdsQry.FieldByname('INGME').AsFloat:=cdsQry.FieldByname('INGME').AsFloat+cdsQry2.FieldByname('INGME').AsFloat;
   cdsQry.FieldByname('EGRME').AsFloat:=cdsQry.FieldByname('EGRME').AsFloat+cdsQry2.FieldByname('EGRME').AsFloat;


   if ( cdsQry.FieldByname('SALMN').AsFloat = 0 ) and
      ( cdsQry.FieldByname('SALME').AsFloat = 0 ) and
      ( cdsQry.FieldByname('INGMN').AsFloat = 0 ) and
      ( cdsQry.FieldByname('INGME').AsFloat = 0 ) and
      ( cdsQry.FieldByname('EGRMN').AsFloat = 0 ) and
      ( cdsQry.FieldByname('EGRME').AsFloat = 0 ) then
   begin
      xSQL:='Select B.SALDOFINMN SALMN, B.SALDOFINME SALME, '
           +  '0 INGMN, 0 INGME, '
           +  '0 EGRMN, 0 EGRME '
           +'From CAJA402 B '
           +'Where B.CIAID='''+xCia+''' AND B.BANCOID='''+xBanco+''' '
           +  'and '+wReplacCeros+'( B.CCBCOID,'''+xVacio+''')='''+xCCBco+''' '
           +  'and B.ANOMM='''+xAnoAnt+xMesAnt+'''';

      cdsQry.Close;
      cdsQry.DataRequest( xSQL );
      cdsQry.Open;
   end;

   nSaldoMN := cdsQry.FieldByname('SALMN').AsFloat+cdsQry.FieldByname('INGMN').AsFloat-cdsQry.FieldByname('EGRMN').AsFloat;
   nSaldoME := cdsQry.FieldByname('SALME').AsFloat+cdsQry.FieldByname('INGME').AsFloat-cdsQry.FieldByname('EGRME').AsFloat;
end;

function TDMTE.VerificaDocumentosEstadoInicial( xCia, xBanco, xCCBco : String; xFecFin : TDate  ) : Boolean;
var
   xSQL, xMesAnt, xAnoAnt, xVacio : String;
   xSAntMN, xSAntMe  : Double;
   xAnoD, xDiaD, xMesD : word;
   xFecIni : TDate;
begin
   Result := False;

   xVacio := '';
   if DMTE.SRV_D = 'ORACLE' then
    begin
     if Length(xCCBco) = 0 then xCCBco := 'X';
      xVacio := 'X';
   end;

	 DecodeDate( xFecFin, xAnoD, xMesD, xDiaD );

   xFecIni := StrToDate( '01/'+StrZero( IntToStr( xMesD ), 2 )+'/'+IntToStr( xAnoD ) );

   if xMesD = 1 then
    begin
     xAnoD := xAnoD-1;
     xMesD := 12;
    end
	 else
    begin
   	 xMesD := xMesD-1;
    end;

   xMesAnt := DMTE.StrZero( IntToStr(xMesD), 2 );
   xAnoAnt := DMTE.StrZero( IntToStr(xAnoD), 4 );

   xSQL := 'Select'
          +' SUM( INGRESOSMN ) INGMN, SUM( INGRESOSME) INGME,'
          +' SUM( EGRESOSMN  ) EGRMN, SUM( EGRESOSME) EGRME'
          +' From'
          +' ( '
          +  'Select CIAID,BANCOID,CCBCOID,'
          +    'sum(case when TMONID='''+wTMonLoc+''' then '+wReplacCeros+'(NCOMTOLOC,0) else 0 end) INGRESOSMN, '
          +    'sum(case when TMONID='''+wTmonExt+''' then '+wReplacCeros+'(NCOMTOEXT,0) else 0 end) INGRESOSME, '
          +    '0 EGRESOSMN, '
          +    '0 EGRESOSME '
          +  'From CXC303'
          +  ' Where CIAID='''+xCia+''' and BANCOID='''+xBanco+''''
          +  ' and '+wReplacCeros+'(CCBCOID,'''+xVacio+''')='''+xCCBco+''''
          +  ' and NCOESTADO=''I'' '
          +  ' and CCFEMIS>='+wRepFuncDate+''''+FormatDateTime( wFormatFecha, xFecIni )+''') '
          +  ' and CCFEMIS<='+wRepFuncDate+''''+FormatDateTime( wFormatFecha, xFecFin )+''') '
          +  'Group by CIAID, BANCOID, CCBCOID '
          +') A ';

   cdsQry.Close;
   cdsQry.DataRequest( xSQL );
   cdsQry.Open;
   if ( cdsQry.FieldByname('INGMN').AsFloat<>0 ) or
      ( cdsQry.FieldByname('INGME').AsFloat<>0 ) or
      ( cdsQry.FieldByname('EGRMN').AsFloat<>0 ) or
      ( cdsQry.FieldByname('EGRME').AsFloat<>0 ) then
    begin
      Result := True;
      Exit;
    end;

   xSQL:='Select '
        +  'SUM( INGRESOSMN ) INGMN, SUM( INGRESOSME) INGME, '
        +  'SUM( EGRESOSMN  ) EGRMN, SUM( EGRESOSME)  EGRME '
        +'From '
        +'( '
        +  'Select CIAID, BANCOID, CCBCOID, '
        +    'sum(case when EC_IE=''I'' and TMONID='''+wTMonLoc+''' then '+wReplacCeros+'(ECMTOLOC,0) else 0 end) INGRESOSMN, '
        +    'sum(case when EC_IE=''I'' and TMONID='''+wTmonExt+''' then '+wReplacCeros+'(ECMTOEXT,0) else 0 end) INGRESOSME, '
        +    'sum(case when EC_IE=''E'' and TMONID='''+wTMonLoc+''' then '+wReplacCeros+'(ECMTOLOC,0) else 0 end) EGRESOSMN, '
        +    'sum(case when EC_IE=''E'' and TMONID='''+wTmonExt+''' then '+wReplacCeros+'(ECMTOEXT,0) else 0 end) EGRESOSME '
        +  'From CAJA302 '
        +  'Where CIAID='''+xCia+''' and BANCOID='''+xBanco+''' '
        +    'and '+wReplacCeros+'(CCBCOID,'''+xVacio+''')='''+xCCBco+''' '
        +    'AND ECESTADO=''I'' '
        +    'and ECFCOMP>='+wRepFuncDate+''''+FormatDateTime( wFormatFecha, xFecIni )+''') '
        +    'and ECFCOMP<='+wRepFuncDate+''''+FormatDateTime( wFormatFecha, xFecFin )+''') '
        +    'and EC_PROCE<>''C'' '
        +  'Group by CIAID, BANCOID, CCBCOID '
        +') A ';

   cdsQry.Close;
   cdsQry.DataRequest( xSQL );
   cdsQry.Open;

   if ( cdsQry.FieldByname('INGMN').AsFloat<>0 ) or
      ( cdsQry.FieldByname('INGME').AsFloat<>0 ) or
      ( cdsQry.FieldByname('EGRMN').AsFloat<>0 ) or
      ( cdsQry.FieldByname('EGRME').AsFloat<>0 ) then
    begin
      Result := True;
    end;
end;


function TDMTE.UltimoDiaMes( xxAno, xxMes : String) : TDate;
var
   xxFecha : TDate;
   xxMesN, xxAnoN : Integer;
begin

   if xxMes='12' then begin
      xxAnoN:=StrToInt(xxAno)+1;
      xxMesN:=1;
   end
	 else begin
      xxAnoN:=StrToInt(xxAno);
      xxMesN:=StrToInt(xxMes)+1
   end;

   xxFecha:=StrToDate( '01/'+StrZero( IntToStr( xxMesN ), 2 )+'/'+IntToStr(xxAnoN) );

   Result:=xxFecha-1;
end;

procedure TDMTE.InsertaLETRASEnCNT320;
var
   xSQL : string;
begin
   xSQL:='SELECT * FROM CXP313 '
        +'WHERE CIAID='     +Quotedstr(cdsEgrCaja.FieldByName('CIAID').AsString)
        + ' AND CLAUXID='   +Quotedstr(cdsConsulta.FieldByName('CLAUXID').AsString)
        + ' AND PROV='      +Quotedstr(cdsConsulta.FieldByName('PROV').AsString)
        + ' AND DOCID='     +Quotedstr(cdsConsulta.FieldByName('DOCID2').AsString)
        + ' AND CPSERIE='   +Quotedstr(cdsConsulta.FieldByName('CPSERIE').AsString)
        + ' AND CPNODOC='   +Quotedstr(cdsConsulta.FieldByName('CPNODOC').AsString)
        + ' AND CPNOREGLET='+Quotedstr(cdsConsulta.FieldByName('CPNOREG').AsString)
        + ' AND (CPNETOLOC<>0 OR CPNETOEXT<>0) ';
   cdsSQL.Close;
   cdsSQL.DataRequest(xSQL);
   cdsSQL.Open;
   cdsSQL.First;
   while not cdsSQL.Eof do
   begin
      cdsRetencion.Insert;
      cdsRetencion.FieldByname('CIAID').AsString     := cdsEgrCaja.FieldByName('CIAID').AsString;
      cdsRetencion.FieldByname('CIARUC').AsString    := DisplayDescrip('prvTGE','TGE101','CIARUC','CIAID='+Quotedstr(cdsEgrCaja.FieldByName('CIAID').AsString),'CIARUC');
      cdsRetencion.FieldByname('ANOMM').AsString     := cdsEgrCaja.FieldByName('ECANOMM').AsString;
      cdsRetencion.FieldByname('TDIARID').AsString   := cdsEgrCaja.FieldByName('TDIARID').AsString;
      cdsRetencion.FieldByname('ECNOCOMP').AsString  := cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
      cdsRetencion.FieldByname('FECPAGO').AsDateTime := cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
      cdsRetencion.FieldByname('CLAUXID').AsString   := cdsConsulta.FieldByName('CLAUXID').AsString;
      cdsRetencion.FieldByname('AUXID').AsString     := cdsConsulta.FieldByName('PROV').AsString;
      cdsRetencion.FieldByname('AUXRUC').AsString    := cdsConsulta.FieldByName('PROVRUC').AsString;
      cdsRetencion.FieldByname('DOCID2').AsString    := cdsConsulta.FieldByName('DOCID2').AsString;
      cdsRetencion.FieldByname('DOCDES').AsString    := cdsSQL.FieldByName('CPANOMES2').AsString;
      cdsRetencion.FieldByname('CPSERIE').AsString   := cdsConsulta.FieldByName('CPSERIE').AsString;
      cdsRetencion.FieldByname('CPNODOC').AsString   := cdsConsulta.FieldByName('CPNODOC').AsString;
      cdsRetencion.FieldByname('FECEMI').AsDateTime  := cdsSQL.FieldByName('CPFEMIS2').AsDateTime;
      cdsRetencion.FieldByname('DOCID').AsString     := cdsSQL.FieldByName('DOCID2').AsString;
      cdsRetencion.FieldByname('SERIE').AsString     := cdsSQL.FieldByName('CPSERIE2').AsString;
      cdsRetencion.FieldByname('NODOC').AsString     := cdsSQL.FieldByName('CPNODOC2').AsString;
      cdsRetencion.FieldByname('FECEMI').AsDateTime  := cdsSQL.FieldByName('CPFEMIS2').AsDateTime;
      cdsRetencion.FieldByname('TRANID').AsString    := '';
      cdsRetencion.FieldByname('TRANDES').AsString   := '';
      cdsRetencion.FieldByname('DH').AsString        := 'H';
      cdsRetencion.FieldByname('TCAMB').AsFloat      := cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
      cdsRetencion.FieldByname('MTOORI').AsFloat     := DMTE.FRound(DMTE.FROUND(cdsSQL.FieldByName('CPNETOORI').AsFloat,15,2)*cdsConsulta.FieldByName('PORCPAGO').AsFloat,15,2);
      if cdsSQL.FieldByName('TMONID2').AsString= DMTE.wTMonLoc then
         cdsRetencion.FieldByname('MTORETORI').AsFloat   := DMTE.FRound(DMTE.FROUND(cdsSQL.FieldByName('CPRETLOC').AsFloat,15,2)*cdsConsulta.FieldByName('PORCPAGO').AsFloat,15,2)
      else
         if cdsSQL.FieldByName('TMONID2').AsString= DMTE.wTMonExt then
            cdsRetencion.FieldByname('MTORETORI').AsFloat:= DMTE.FRound(DMTE.FROUND(cdsSQL.FieldByName('CPRETEXT').AsFloat,15,2)*cdsConsulta.FieldByName('PORCPAGO').AsFloat,15,2);

      if cdsSQL.FieldByName('TMONID2').AsString= DMTE.wTMonLoc then
      begin
         cdsRetencion.FieldByname('MTOLOC').AsFloat     :=DMTE.FRound(DMTE.FRound(cdsSQL.FieldByName('CPNETOORI').AsFloat,15,2)*cdsConsulta.FieldByName('PORCPAGO').AsFloat,15,2);
         cdsRetencion.FieldByname('MTOEXT').AsFloat     :=DMTE.FRound(DMTE.FROUND(cdsSQL.FieldByName('CPNETOORI').AsFloat*cdsConsulta.FieldByName('PORCPAGO').AsFloat,15,2)/cdsEgrCaja.FieldByName('ECTCAMB').AsFloat,15,2);
         cdsRetencion.FieldByname('MTORETLOC').AsFloat  :=DMTE.FRound(cdsRetencion.FieldByname('MTORETORI').AsFloat,15,2);
         cdsRetencion.FieldByname('MTORETEXT').AsFloat  :=DMTE.FRound(cdsRetencion.FieldByname('MTORETORI').AsFloat/cdsEgrCaja.FieldByName('ECTCAMB').AsFloat,15,3);
      end
      else
         if cdsSQL.FieldByName('TMONID2').AsString= DMTE.wTMonExt then
         begin
           cdsRetencion.FieldByname('MTOLOC').AsFloat   :=DMTE.FRound(DMTE.FRound(cdsSQL.FieldByName('CPNETOORI').AsFloat*cdsConsulta.FieldByName('PORCPAGO').AsFloat,15,2)*cdsEgrCaja.FieldByName('ECTCAMB').AsFloat,15,2);
           cdsRetencion.FieldByname('MTOEXT').AsFloat   :=DMTE.FRound(DMTE.FRound(cdsSQL.FieldByName('CPNETOORI').AsFloat,15,2)*cdsConsulta.FieldByName('PORCPAGO').AsFloat,15,2);
           cdsRetencion.FieldByname('MTORETLOC').AsFloat:=DMTE.FRound(DMTE.FRound(cdsRetencion.FieldByname('MTORETORI').AsFloat,15,2)*cdsEgrCaja.FieldByName('ECTCAMB').AsFloat,15,2);
           cdsRetencion.FieldByname('MTORETEXT').AsFloat:=DMTE.FRound(cdsRetencion.FieldByname('MTORETORI').AsFloat,15,2);
         end;
      //*
      cdsRetencion.FieldByname('USUARIO').AsString   := wUsuario;
      cdsRetencion.FieldByname('FREG').Value         := DateS;
      cdsRetencion.FieldByname('HREG').Value         := Time;
      cdsRetencion.FieldByname('DOCID2').AsString    := cdsSQL.FieldByName('DOCID').AsString;
      cdsRetencion.FieldByname('CPSERIE').AsString   := cdsSQL.FieldByName('CPSERIE').AsString;
      cdsRetencion.FieldByname('CPNODOC').AsString   := cdsSQL.FieldByName('CPNODOC').AsString;
      cdsRetencion.FieldByname('CPNOREG').AsString   := cdsSQL.FieldByName('CPNOREGLET').AsString;
      cdsRetencion.FieldByname('TMONIDFAC').AsString := cdsSQL.FieldByName('TMONID2').AsString;
      cdsPost( cdsRetencion );

      cdsSQL.Next;
   end;
end;

//CIM  01/10/2002
procedure TDMTE.ActSaldosClientes(DatosAux: structSaldosAux);
var
   xAno,
   xMes : string ;
begin
   xMes := strMes ( DatosAux.FECHA ) ;
   xAno := strAno ( DatosAux.FECHA ) ;

   DMTE.ActSdoAuxiliar( DatosAux.CIAID , xANO , xMES , DatosAux.CLAUXID , DatosAux.AUXID ,
                       DatosAux.MONTOMN , DatosAux.MONTOME, DatosAux.MTOSLOC, DatosAux.MTOSEXT, '+' );
end;

procedure TDMTE.AsientosAdicionales( cRegAdicional : String );
var
   xInsert : String;
begin
   xInsert:='Insert Into CAJA302 ( CIAID, TDIARID, ECANOMM, ECNOCOMP, '
           +    'BANCOID, CCBCOID, ECNOCHQ, ECFCOMP, FPAGOID, '
           +    'TMONID, ECMTOORI, CLAUXID, PROV, PROVRUC, ECGIRA, ECGLOSA, ECFEMICH, '
           +    'EC_IE, ECESTADO, ECCONTA, ECUSER ) '
       	  +'Values( '+QuotedStr( Copy( cRegAdicional, 4, 2) )                    +', '
      	  +           QuotedStr( Copy( cRegAdicional, 7, 2) )                    +', '
           +           QuotedStr( cdsEgrCaja.FieldByName('ECANOMM').AsString )+', '
           +           QuotedStr( Copy( cRegAdicional,10,10) )                    +', '
           +           QuotedStr( cdsEgrCaja.FieldByName('BANCOID').AsString )+', '
           +           QuotedStr( cdsEgrCaja.FieldByName('CCBCOID').AsString )+', '
           +           QuotedStr( cdsEgrCaja.FieldByName('ECNOCHQ').AsString )+', '
           +           QuotedStr( Formatdatetime(DMTE.wFormatFecha,cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime ))+', '
           +           QuotedStr( cdsEgrCaja.FieldByName('FPAGOID').AsString )+', '
           +           QuotedStr( cdsEgrCaja.FieldByName('TMONID').AsString ) +', '
           +                      cdsEgrCaja.FieldByName('ECMTOORI').AsString +', '
           +           QuotedStr( cdsEgrCaja.FieldByName('CLAUXID').AsString )+', '
           +           QuotedStr( cdsEgrCaja.FieldByName('PROV').AsString )   +', '
           +           QuotedStr( cdsEgrCaja.FieldByName('PROVRUC').AsString )+', '
           +           QuotedStr( cdsEgrCaja.FieldByName('ECGIRA').AsString )+', '
           +           QuotedStr( cdsEgrCaja.FieldByName('ECGLOSA').AsString )+', '
           +           QuotedStr( Formatdatetime(DMTE.wFormatFecha,cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime ))+', '
           +          '''E'', ''C'', ''S'', '''+wUsuario+''' ) ';
// Inicio HPC_201401_CAJA
   cdsQry.Close;
   cdsQry.Datarequest( xInsert );
   try
      cdsQry.Execute;
   except
      ShowMessage('Error al ingresar registro de Asiento Adicional 1 (CAJA302)');
      xSigueGrab := False;
      exit;
   end;
// Fin HPC_201401_CAJA

	xInsert:='Insert Into CAJA302 ( CIAID, TDIARID, ECANOMM, ECNOCOMP, '
           +    ' BANCOID, CCBCOID, ECNOCHQ, ECFCOMP, FPAGOID, '
           +    ' TMONID, ECMTOORI, CLAUXID, PROV, PROVRUC, ECGIRA, ECGLOSA, ECFEMICH,'
           +    ' EC_IE, ECESTADO, ECCONTA, ECUSER ) '
           +'Values( '+QuotedStr( Copy( cRegAdicional,25, 2) )                    +', '
           +           QuotedStr( Copy( cRegAdicional,28, 2) )                    +', '
           +           QuotedStr( cdsEgrCaja.FieldByName('ECANOMM').AsString )+', '
           +           QuotedStr( Copy( cRegAdicional,31,10) )                    +', '
           +           QuotedStr( cdsEgrCaja.FieldByName('BANCOID').AsString )+', '
           +           QuotedStr( cdsEgrCaja.FieldByName('CCBCOID').AsString )+', '
           +           QuotedStr( cdsEgrCaja.FieldByName('ECNOCHQ').AsString )+', '
           +           QuotedStr( Formatdatetime(DMTE.wFormatFecha,cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime ))+', '
           +           QuotedStr( cdsEgrCaja.FieldByName('FPAGOID').AsString )+', '
           +           QuotedStr( cdsEgrCaja.FieldByName('TMONID').AsString ) +', '
           +                      cdsEgrCaja.FieldByName('ECMTOORI').AsString +', '
           +           QuotedStr( cdsEgrCaja.FieldByName('CLAUXID').AsString )+', '
           +           QuotedStr( cdsEgrCaja.FieldByName('PROV').AsString )   +', '
           +           QuotedStr( cdsEgrCaja.FieldByName('PROVRUC').AsString )+', '
           +           QuotedStr( cdsEgrCaja.FieldByName('ECGIRA').AsString )+', '
           +           QuotedStr( cdsEgrCaja.FieldByName('ECGLOSA').AsString )+', '
           +           QuotedStr( Formatdatetime(DMTE.wFormatFecha,cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime ))+', '
           +         '''E'', ''C'', ''S'', '''+wUsuario+''' ) ';
// Inicio HPC_201401_CAJA
   cdsQry.Close;
   cdsQry.Datarequest( xInsert );
   try
     cdsQry.Execute;
   except
      ShowMessage('Error al ingresar registro de Asiento Adicional 2 (CAJA302)');
      xSigueGrab := False;
      exit;
   end;
// Fin HPC_201401_CAJA
end;


procedure TDMTE.cdsEgrCajaEditError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
   ShowMessage('Edit Error ');
end;

procedure TDMTE.cdsEgrCajaPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
   ShowMessage('Post Error ');
end;

function DateS: TDatetime;
var
	 sSQL : String;
begin
 	sSQL := ' SELECT '+DMTE.wRepFuncDate+DMTE.wRepFecServi+') FECHA  FROM TGE901 ';
 	DMTE.cdsQry.Close;
 	DMTE.cdsQry.DataRequest(sSQL);
   DMTE.cdsQry.Open;
   Result := DMTE.cdsQry.FieldByName('FECHA').AsDateTime;
end;

procedure TDMTE.CalculaRetencionYMonto;
var
  pbProvRetiene,pbCiaRetiene,pbMayorQueTasa : Boolean;
  pbMtoPagPorProvLoc, pbMtoPagPorProvExt : Double;
  psSQL, xClProv : String;
begin
   pbMayorQueTasa := False;
   pbCiaRetiene   := False;
   pbProvRetiene  := False;
   pbMtoPagPorProvLoc := 0; pbMtoPagPorProvExt := 0;
   pbMtoPagTotLoc := 0; pbMtoPagTotExt := 0;
   pbMtoRetLoc := 0; pbMtoRetExt := 0;

  psSQL:='';
  xClProv:='';
  pbCiaRetiene:=(DisplayDescrip('prvTGE','TGE101','CIARETIGV','CIAID='+Quotedstr(xxCia),'CIARETIGV')='S');
    psSQL:='SELECT A.*, B.PROVRETIGV FROM ( '
       +  'SELECT ''PROVISIONADO'' MODO, B.PROVRETIGV PROVDOC, B.TCANJEID, A.DETCPAG,A.DETCDOC, B.TMONID, '
       +    'A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, '
       +    'A.PROVRUC, A.DOCID2, A.TDIARID2, A.CPANOMM, A.CPNOREG, A.CPSERIE, A.CPNODOC, A.CPFEMIS,A.CPFVCMTO,A.CPTOID,A.CUENTAID, '
       +    'A.DESALLOC,A.DESALEXT,A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, '
       +    'CASE WHEN B.TMONID='+Quotedstr(DMTE.wTmonLoc)+' THEN ROUND(A.DEMTOLOC/B.CPMTOLOC,5)  '
       +    ' ELSE ROUND(A.DEMTOEXT/B.CPMTOEXT,5) END PORCPAGO, '

       +    'B.CPFEMIS CPFEMIPROV, B.CPGRAVAD, B.CPNOGRAV, B.CPIGV, '
       +    'B.CPMTOLOC, B.CPMTOEXT, C.DOCRETIGV,C.DOCRESTA,'''' DEGLOSA '
       +  'FROM CAJA303 A, CXP301 B, TGE110 C '
       +  'WHERE A.CIAID='+QuotedStr(xxCia)+' AND '
       +        'A.TDIARID='+QuotedStr(xxTdiar)+' AND '
       +        'A.ECANOMM='+QuotedStr(xxAnomes)+' AND '
       +        'A.ECNOCOMP='+QuotedStr(xxNocomp)
       +    ' AND B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID2 AND B.CPANOMES=A.CPANOMM '
       +    'AND B.CPNOREG=A.CPNOREG AND C.DOCMOD=''CXP'' and C.DOCID=A.DOCID2 '
       +  'UNION '
       +  'SELECT ''NO PROVISIONADO'' MODO, '''' PROVDOC, '''' TCANJEID, A.DETCPAG,A.DETCDOC, A.TMONID, '
       +  'A.CIAID, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, '
       +    'B.PROVRUC, A.DOCID2, A.TDIARID2, A.CPANOMM, A.CPNOREG, A.CPSERIE, A.CPNODOC, A.CPFEMIS,A.CPFVCMTO,A.CPTOID,A.CUENTAID, '
       +    'A.DEMTOLOC DESALLOC,A.DEMTOEXT DESALEXT, '
       +    'A.DEMTOORI, A.DEMTOLOC, A.DEMTOEXT, 1 PORCPAGO,'
       +    'A.CPFEMIS CPFEMISPROV,0.00 CPGRAVAD,0.00 CPNOGRAV, 0.00 CPIGV, DEMTOLOC CPMTOLOC, DEMTOEXT CPMTOEXT, '
       +    'C.DOCRETIGV,C.DOCRESTA,A.DEGLOSA '
       +  'FROM CAJA301 A, TGE110 C, TGE201 B '
       +  'WHERE A.CIAID='+QuotedStr(xxCia)+' AND '
       +        'A.TDIARID='+QuotedStr(xxTdiar)+' AND '
       +        'A.ECANOMM='+QuotedStr(xxAnomes)+' AND '
       +        'A.ECNOCOMP='+QuotedStr(xxNocomp)
       +    ' AND '+DMTE.wReplacCeros+'(FLAGVAR,'' '')<>''R'' AND C.DOCMOD=''CXP'' and C.DOCID=A.DOCID2 '
       +    'AND B.CLAUXID=A.CLAUXID AND B.PROV=A.PROV '
       + ' ) A, CNT201 B '
       +'WHERE B.CLAUXID=A.CLAUXID AND B.AUXID=A.PROV '
       +' ORDER BY A.CLAUXID,A.PROV,CPNOREG';

  cdsConsulta.IndexFieldNames:='';
  cdsConsulta.Filter:='';
  cdsConsulta.Filtered:=False;
	cdsConsulta.Close;
	cdsConsulta.DataRequest( psSQL );

	try
		cdsConsulta.Open;
	except
	end;

	cdsConsulta.IndexFieldNames := '';
	cdsConsulta.IndexFieldNames:='CLAUXID;PROV;CPNOREG';

  cdsConsulta.First;
  xClProv:=Trim(cdsConsulta.FieldByName('CLAUXID').AsString)+Trim(cdsConsulta.FieldByName('PROV').AsString);

  while not cdsConsulta.Eof do
  begin
    if (pbCiaRetiene) and (cdsConsulta.FieldByName('PROVRETIGV').AsString='S') AND
       (cdsConsulta.FieldByName('DOCRETIGV').AsString='S') then
    begin
      if (cdsConsulta.FieldByName('CPFEMIS').AsDateTime>=xTasaFec) then
      begin
        if cdsConsulta.FieldByName('CPMTOLOC').AsFloat>=DMTE.xTasaMonto then
        begin
          pbMayorQueTasa := True;
        end;
        pbMtoPagPorProvLoc := pbMtoPagPorProvLoc+cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
        pbMtoPagPorProvExt := pbMtoPagPorProvExt+cdsConsulta.FieldByName('DEMTOEXT').AsFloat;

        pbMtoPagTotLoc := pbMtoPagTotLoc+cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
        pbMtoPagTotExt := pbMtoPagTotExt+cdsConsulta.FieldByName('DEMTOEXT').AsFloat;
      end
      else
      begin
        pbMtoPagTotLoc := pbMtoPagTotLoc+cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
        pbMtoPagTotExt := pbMtoPagTotExt+cdsConsulta.FieldByName('DEMTOEXT').AsFloat;
      end;
    end
    else
    begin
      pbMtoPagTotLoc := pbMtoPagTotLoc+cdsConsulta.FieldByName('DEMTOLOC').AsFloat;
      pbMtoPagTotExt := pbMtoPagTotExt+cdsConsulta.FieldByName('DEMTOEXT').AsFloat;
    end;
    cdsConsulta.Next;
    if cdsConsulta.EOF then
    begin
      xClProv := '';
    end;
    if xClProv<>Trim(cdsConsulta.FieldByName('CLAUXID').AsString)+Trim(cdsConsulta.FieldByName('PROV').AsString) then
    begin
      if (pbMayorQueTasa) or (pbMtoPagPorProvLoc>=DMTE.xTasaMonto) then
      begin
      // Inicio HPC_201401_CAJA
         // pbMtoRetLoc := FRound(pbMtoRetLoc+(pbMtoPagPorProvLoc*DMTE.xTasaPorce/100),15,2);
         //pbMtoRetExt := FRound(pbMtoRetExt+(pbMtoPagPorProvExt*DMTE.xTasaPorce/100),15,2);
         if cdsConsulta.FieldByName('CPFEMISPROV').AsDateTime >= strtodate('01/03/2014') then
         begin
            pbMtoRetLoc := FRound(pbMtoRetLoc+(pbMtoPagPorProvLoc * 0.03),15,2);
            pbMtoRetExt := FRound(pbMtoRetExt+(pbMtoPagPorProvExt * 0.03),15,2);
         end
         else
         begin
            pbMtoRetLoc := FRound(pbMtoRetLoc+(pbMtoPagPorProvLoc * 0.06),15,2);
            pbMtoRetExt := FRound(pbMtoRetExt+(pbMtoPagPorProvExt * 0.06),15,2);
         end;
      // Fin HPC_201401_CAJA
      end;
      pbMtoPagPorProvLoc := 0; pbMtoPagPorProvExt := 0;
    end;
  end;
end;

procedure TDMTE.ActSaldosBancos(xCia, xTMonid, xBco, xCuenta, xMonto, xTipoIE, xFecha: String);
var
   xSQL, xWhere : String;
   xAno, xMes, xDia : Word;
   xSaldoIniSol, xSaldoFinSol, xSaldoIniDol, xSaldoFinDol : String;
   xTotIngSol, xTotEgrSol, xTotIngDol, xTotEgrDol : String;
begin
// Inicio HPC_201401_CAJA
// reordena sangría de la rutina
// añade controles para el Control Transaccional
   DecodeDate(StrToDate(xFecha), xAno, xMes, xDia);
   xFecha := CurrToStr(xAno)+DMTE.StrZero(CurrToStr(xMes), 2);

   xWhere := 'CIAID ='+QuotedStr(xCia)
            +' And BANCOID ='+QuotedStr(xBco)
            +' And CIERRE ='+QuotedStr('N');
   if Length(xCuenta) > 0 then
      xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);

   DMTE.DisplayDescrip('prvSQL', 'CAJA402', 'MAX(ANOMM) FECHA', xWhere, 'FECHA');

   if Length(cdsQry.FieldByName('FECHA').AsString) = 0 Then
   begin
      xSQL := 'Insert Into CAJA402(CIAID, BANCOID, CCBCOID, ANOMM,'
             +'                    SALDOINIMN, INGRESOMN, EGRESOMN, SALDOFINMN,'
             +'                    SALDOINIME, INGRESOME, EGRESOME, SALDOFINME,'
             +'                    USUARIO, FREG, HREG, CIERRE) '
             +'Values('+QuotedStr(xCia)+', '+QuotedStr(xBco)+','+QuotedStr(xCuenta)+', '+QuotedStr(xFecha)+', '
             +'        0, 0, 0, 0, '
             +'        0, 0, 0, 0, '
             +         QuotedStr(wUsuario)+', '+DMTE.wRepFecServi+', '+DMTE.wRepHorServi+', ''N'')';
      try
         DCOM1.AppServer.EjecutaSQL(xSQL);
      except
         ShowMessage('Error al actualizar inicialización de Saldos de Bancos (CAJA402)');
         xSigueGrab := False;
         exit;
      end;

  // Actualizar los Saldos
      xWhere := 'CIAID ='+QuotedStr(xCia)
               +' And BANCOID ='+QuotedStr(xBco)
               +' And ANOMM ='+QuotedStr(xFecha);
      if Length(xCuenta) > 0 then
         xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);

      DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');

      If Length(cdsQry.FieldByName('SALDOINIMN').AsString) > 0 Then
         xSaldoIniSol := cdsQry.FieldByName('SALDOINIMN').AsString
      Else
         xSaldoIniSol := '0';

      If Length(cdsQry.FieldByName('SALDOFINMN').AsString) > 0 Then
         xSaldoFinSol := cdsQry.FieldByName('SALDOFINMN').AsString
      Else
         xSaldoFinSol := '0';

      If Length(cdsQry.FieldByName('SALDOINIME').AsString) > 0 Then
         xSaldoIniDol := cdsQry.FieldByName('SALDOINIME').AsString
      Else
         xSaldoIniDol := '0';

      If Length(cdsQry.FieldByName('SALDOFINME').AsString) > 0 Then
         xSaldoFinDol := cdsQry.FieldByName('SALDOFINME').AsString
      Else
         xSaldoFinDol := '0';

      If Length(cdsQry.FieldByName('INGRESOMN').AsString) > 0 Then
         xTotIngSol   := cdsQry.FieldByName('INGRESOMN').AsString
      Else
         xTotIngSol   := '0';

      If Length(cdsQry.FieldByName('EGRESOMN').AsString) > 0 Then
         xTotEgrSol   := cdsQry.FieldByName('EGRESOMN').AsString
      Else
         xTotEgrSol   := '0';

      If Length(cdsQry.FieldByName('INGRESOME').AsString) > 0 Then
         xTotIngDol   := cdsQry.FieldByName('INGRESOME').AsString
      Else
         xTotIngDol   := '0';

      If Length(cdsQry.FieldByName('EGRESOME').AsString) > 0 Then
         xTotEgrDol   := cdsQry.FieldByName('EGRESOME').AsString
      Else
         xTotEgrDol   := '0';

   // Si es un I N G R E S O
      If xTipoIE = 'I' Then
      begin
         If xTMonid = 'N' Then
         begin
            xTotIngSol   := FloatToStr(StrToFloat(xTotIngSol) + StrToFloat(xMonto));
         // Para Actualizar el Ingreso en Soles
            xSQL := 'Update CAJA402'
                   +'   Set INGRESOMN ='+xTotIngSol+','
                   +'       USUARIO ='+QuotedStr(wUsuario)+','
                   +'       FREG ='+DMTE.wRepFecServi+','
                   +'       HREG ='+DMTE.wRepHorServi
                   +' Where CIAID ='+QuotedStr(xCia)
                   +'   And BANCOID ='+QuotedStr(xBco)
                   +'   And ANOMM ='+QuotedStr(xFecha);
            if Length(xCuenta) > 0 then
               xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);

            try
               DCOM1.AppServer.EjecutaSQL(xSQL);
            except
               ShowMessage('Error al actualizar Saldos Ingreso MN de Bancos (CAJA402)');
               xSigueGrab := False;
               exit;
            end;

          //Para Actualizar el Saldo Final en Soles
            xWhere := 'CIAID ='+QuotedStr(xCia)
                     +' And BANCOID ='+QuotedStr(xBco)
                     +' And ANOMM ='+QuotedStr(xFecha);
            if Length(xCuenta) > 0 then
               xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);
            DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');
            xTotIngSol := cdsQry.FieldByName('INGRESOMN').AsString;
            xTotEgrSol := cdsQry.FieldByName('EGRESOMN').AsString;

            If Length(cdsQry.FieldByName('INGRESOMN').AsString) > 0 Then
              xTotIngSol   := cdsQry.FieldByName('INGRESOMN').AsString
            Else
              xTotIngSol   := '0';

            If Length(cdsQry.FieldByName('EGRESOMN').AsString) > 0 Then
               xTotEgrSol   := cdsQry.FieldByName('EGRESOMN').AsString
            Else
               xTotEgrSol   := '0';

            xSaldoFinSol := FloatToStr(StrToFloat(xSaldoIniSol) + StrToFloat(xTotIngSol) - StrToFloat(xTotEgrSol));
            xSQL := 'Update CAJA402'
                   +'   Set SALDOFINMN ='+xSaldoFinSol+','
                   +'       USUARIO ='+QuotedStr(wUsuario)+','
                   +'       FREG ='+DMTE.wRepFecServi+','
                   +'       HREG ='+DMTE.wRepHorServi
                   +' Where CIAID ='+QuotedStr(xCia)
                   +'   And BANCOID ='+QuotedStr(xBco)
                   +'   And ANOMM ='+QuotedStr(xFecha);
            if Length(xCuenta) > 0 then
               xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
            try
               DCOM1.AppServer.EjecutaSQL(xSQL);
            except
               ShowMessage('Error al actualizar Saldos Final MN de Bancos (CAJA402)');
               xSigueGrab := False;
               exit;
            end;
         end
         Else
         begin
            xTotIngDol   := FloatToStr(StrToFloat(xTotIngDol) + StrToFloat(xMonto));
            xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));
         // Para Actualizar el Ingreso en Dólares
            xSQL := 'Update CAJA402'
                   +'   Set INGRESOME ='+xTotIngDol+','
                   +'       USUARIO ='+QuotedStr(wUsuario)+','
                   +'       FREG ='+DMTE.wRepFecServi+','
                   +'       HREG ='+DMTE.wRepHorServi
                   +' Where CIAID ='+QuotedStr(xCia)
                   +'   And BANCOID ='+QuotedStr(xBco)
                   +'   And ANOMM ='+QuotedStr(xFecha);
            if Length(xCuenta) > 0 then
               xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);

            try
               DCOM1.AppServer.EjecutaSQL(xSQL);
            except
               ShowMessage('Error al actualizar Saldos Ingreso ME de Bancos (CAJA402)');
               xSigueGrab := False;
               exit;
            end;

         // Para Actualizar el Saldo Final en Dólares
            xWhere := 'CIAID ='+QuotedStr(xCia)
                     +' And BANCOID ='+QuotedStr(xBco)
                     +' And ANOMM ='+QuotedStr(xFecha);
            if Length(xCuenta) > 0 then
              xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);

            DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');
            xTotIngDol := cdsQry.FieldByName('INGRESOME').AsString;
            xTotEgrDol := cdsQry.FieldByName('EGRESOME').AsString;

            If Length(cdsQry.FieldByName('INGRESOME').AsString) > 0 Then
               xTotIngDol   := cdsQry.FieldByName('INGRESOME').AsString
            Else
               xTotIngDol   := '0';

            If Length(cdsQry.FieldByName('EGRESOME').AsString) > 0 Then
               xTotEgrDol   := cdsQry.FieldByName('EGRESOME').AsString
            Else
               xTotEgrDol   := '0';

            xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));

            xSQL := 'Update CAJA402'
                   +'   Set SALDOFINME ='+xSaldoFinDol+','
                   +'       USUARIO ='+QuotedStr( wUsuario)+','
                   +'       FREG ='+DMTE.wRepFecServi+','
                   +'       HREG ='+DMTE.wRepHorServi
                   +' Where CIAID ='+QuotedStr(xCia)
                   +'   And BANCOID ='+QuotedStr(xBco)
                   +'   And ANOMM ='+QuotedStr(xFecha);
            if Length(xCuenta) > 0 then
               xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
            try
               DCOM1.AppServer.EjecutaSQL(xSQL);
            except
               ShowMessage('Error al actualizar Saldos Final ME de Bancos (CAJA402)');
               xSigueGrab := False;
               exit;
            end;
         end;
      end;

   // Si es un E G R E S O
      If xTipoIE = 'E' Then
      begin
         If xTMonid = 'N' Then
         begin
            xTotEgrSol   := FloatToStr(StrToFloat(xTotEgrSol) + StrToFloat(xMonto));
         // Para Actualizar el Egreso en Soles
            xSQL := 'Update CAJA402'
                   +'   Set EGRESOMN ='+xTotEgrSol+','
                   +'       USUARIO ='+QuotedStr(wUsuario)+','
                   +'       FREG ='+DMTE.wRepFecServi+','
                   +'       HREG ='+DMTE.wRepHorServi
                   +' Where CIAID  ='+QuotedStr(xCia)
                   +'   And BANCOID  ='+QuotedStr(xBco)
                   +'   And ANOMM    ='+QuotedStr(xFecha);
            if Length(xCuenta) > 0 then
               xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
            try
               DCOM1.AppServer.EjecutaSQL(xSQL);
            except
               ShowMessage('Error al actualizar Saldos Egreso MN de Bancos (CAJA402)');
               xSigueGrab := False;
               exit;
            end;
         // Para Actualizar el Saldo Final en Soles
            xWhere := 'CIAID ='+QuotedStr(xCia)
                     +' And BANCOID ='+QuotedStr(xBco)
                     +' And ANOMM ='+QuotedStr(xFecha);
            if Length(xCuenta) > 0 then
               xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);
            DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');
            xTotIngSol := cdsQry.FieldByName('INGRESOMN').AsString;
            xTotEgrSol := cdsQry.FieldByName('EGRESOMN').AsString;

            If Length(cdsQry.FieldByName('INGRESOMN').AsString) > 0 Then
               xTotIngSol   := cdsQry.FieldByName('INGRESOMN').AsString
            Else
               xTotIngSol   := '0';

            If Length(cdsQry.FieldByName('EGRESOMN').AsString) > 0 Then
               xTotEgrSol   := cdsQry.FieldByName('EGRESOMN').AsString
            Else
               xTotEgrSol   := '0';

            xSaldoFinSol := FloatToStr(StrToFloat(xSaldoIniSol) + StrToFloat(xTotIngSol) - StrToFloat(xTotEgrSol));

            xSQL := 'Update CAJA402'
                   +'   Set SALDOFINMN ='+xSaldoFinSol+','
                   +'       USUARIO ='+QuotedStr( wUsuario)+','
                   +'       FREG ='+DMTE.wRepFecServi+','
                   +'       HREG ='+DMTE.wRepHorServi
                   +' Where CIAID ='+QuotedStr(xCia)
                   +'   And BANCOID ='+QuotedStr(xBco)
                   +'   And ANOMM   ='+QuotedStr(xFecha);
            if Length(xCuenta) > 0 then
               xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
            try
               DCOM1.AppServer.EjecutaSQL(xSQL);
            except
               ShowMessage('Error al actualizar Saldos Final MN de Bancos (CAJA402)');
               xSigueGrab := False;
               exit;
            end;
         end
         Else
         begin
            xTotIngDol   := FloatToStr(StrToFloat(xTotIngDol) + StrToFloat(xMonto));
            xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));
         // Para Actualizar el Egreso en Dólares
            xSQL := 'Update CAJA402'
                   +'   Set EGRESOME ='+xTotIngDol+','
                   +'       USUARIO ='+QuotedStr( wUsuario)+','
                   +'       FREG ='+DMTE.wRepFecServi+','
                   +'       HREG ='+DMTE.wRepHorServi
                   +' Where CIAID ='+QuotedStr(xCia)
                   +'   And BANCOID ='+QuotedStr(xBco)
                   +'   And ANOMM   ='+QuotedStr(xFecha);
            if Length(xCuenta) > 0 then
               xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
            try
               DCOM1.AppServer.EjecutaSQL(xSQL);
            except
               ShowMessage('Error al actualizar Saldos Egreso ME de Bancos (CAJA402)');
               xSigueGrab := False;
               exit;
            end;
         // Para Actualizar el Saldo Final en Dólares
            xWhere := 'CIAID ='+QuotedStr(xCia)
                     +' And BANCOID ='+QuotedStr(xBco)
                     +' And ANOMM ='+QuotedStr(xFecha);
            if Length(xCuenta) > 0 then
               xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);
            DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');
            xTotIngDol := cdsQry.FieldByName('INGRESOME').AsString;
            xTotEgrDol := cdsQry.FieldByName('EGRESOME').AsString;

            If Length(cdsQry.FieldByName('INGRESOME').AsString) > 0 Then
               xTotIngDol   := cdsQry.FieldByName('INGRESOME').AsString
            Else
               xTotIngDol   := '0';

            If Length(cdsQry.FieldByName('EGRESOME').AsString) > 0 Then
               xTotEgrDol   := cdsQry.FieldByName('EGRESOME').AsString
            Else
               xTotEgrDol   := '0';

            xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));

            xSQL := 'Update CAJA402'
                   +'   Set SALDOFINME ='+xSaldoFinDol+','
                   +'       USUARIO ='+QuotedStr( wUsuario)+','
                   +'       FREG ='+DMTE.wRepFecServi+','
                   +'       HREG ='+DMTE.wRepHorServi
                   +' Where CIAID ='+QuotedStr(xCia)
                   +'   And BANCOID ='+QuotedStr(xBco)
                   +'   And ANOMM ='+QuotedStr(xFecha);
            if Length(xCuenta) > 0 then
               xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
            try
               DCOM1.AppServer.EjecutaSQL(xSQL);
            except
               ShowMessage('Error al actualizar Saldos Final ME de Bancos (CAJA402)');
               xSigueGrab := False;
               exit;
            end;
         end;
      end;
   end
   Else
   begin
  //Si la Fecha de la Fecha de Emisión es Mayor a la Ultima Fecha Aperturada
      If xFecha > cdsQry.FieldByName('FECHA').AsString Then
      begin
       //Cerrar el Mes Anterior y Aperturar el Mes Ingresado
         xSQL := 'Update CAJA402'
                +'   Set CIERRE ='+QuotedStr('S')+','
                +'       USUARIO ='+QuotedStr(wUsuario)+','
                +'       FREG ='+DMTE.wRepFecServi+','
                +'       HREG ='+DMTE.wRepHorServi
                +' Where CIAID ='+QuotedStr(xCia)
                +'   And BANCOID ='+QuotedStr(xBco)
                +'   And ANOMM ='+QuotedStr(cdsQry.FieldByName('FECHA').AsString);
         if Length(xCuenta) > 0 then
            xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);

         try
            DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            ShowMessage('Error al actualizar Saldos de Bancos - Flag Cierre  (CAJA402)');
            xSigueGrab := False;
            exit;
         end;

         xWhere := 'CIAID ='+QuotedStr(xCia)
                  +' And BANCOID ='+QuotedStr(xBco)
                  +' And ANOMM ='+QuotedStr(cdsQry.FieldByName('FECHA').AsString);
         if Length(xCuenta) > 0 then
            xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);

         DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');
         xSQL := 'Insert Into CAJA402(CIAID, BANCOID, CCBCOID, ANOMM, '
                +'                    SALDOINIMN, INGRESOMN, EGRESOMN, SALDOFINMN,'
                +'                    SALDOINIME, INGRESOME, EGRESOME, SALDOFINME,'
                +'                    USUARIO, FREG, HREG, CIERRE)'
                +' Values('+QuotedStr(xCia)+', '+QuotedStr(xBco)+','+QuotedStr(xCuenta)+', '+QuotedStr(xFecha)+', '
                +  cdsQry.FieldByName('SALDOFINMN').AsString+', '+'0, 0, '+cdsQry.FieldByName('SALDOFINMN').AsString+', '
                +  cdsQry.FieldByName('SALDOFINME').AsString+', '+'0, 0, '+cdsQry.FieldByName('SALDOFINME').AsString+', '
                +  QuotedStr( wUsuario)+', '+DMTE.wRepFecServi+', '+DMTE.wRepHorServi+', ''N'')';
         try
            DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            ShowMessage('Error al actualizar Saldos de Bancos - Flag Cierre  (CAJA402)');
            xSigueGrab := False;
            exit;
         end;

      // Actualizar los Saldos

         xWhere := 'CIAID ='+QuotedStr(xCia)
                  +' And BANCOID ='+QuotedStr(xBco)
                  +' And ANOMM ='+QuotedStr(xFecha);
         if Length(xCuenta) > 0 then
            xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);

         DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');

         If Length(cdsQry.FieldByName('SALDOINIMN').AsString) > 0 Then
            xSaldoIniSol := cdsQry.FieldByName('SALDOINIMN').AsString
         Else
            xSaldoIniSol := '0';

         If Length(cdsQry.FieldByName('SALDOFINMN').AsString) > 0 Then
            xSaldoFinSol := cdsQry.FieldByName('SALDOFINMN').AsString
         Else
            xSaldoFinSol := '0';

         If Length(cdsQry.FieldByName('SALDOINIME').AsString) > 0 Then
            xSaldoIniDol := cdsQry.FieldByName('SALDOINIME').AsString
         Else
            xSaldoIniDol := '0';

         If Length(cdsQry.FieldByName('SALDOFINME').AsString) > 0 Then
            xSaldoFinDol := cdsQry.FieldByName('SALDOFINME').AsString
         Else
            xSaldoFinDol := '0';

         If Length(cdsQry.FieldByName('INGRESOMN').AsString) > 0 Then
            xTotIngSol   := cdsQry.FieldByName('INGRESOMN').AsString
         Else
           xTotIngSol   := '0';

         If Length(cdsQry.FieldByName('EGRESOMN').AsString) > 0 Then
            xTotEgrSol   := cdsQry.FieldByName('EGRESOMN').AsString
         Else
            xTotEgrSol   := '0';

         If Length(cdsQry.FieldByName('INGRESOME').AsString) > 0 Then
            xTotIngDol   := cdsQry.FieldByName('INGRESOME').AsString
         Else
           xTotIngDol   := '0';

         If Length(cdsQry.FieldByName('EGRESOME').AsString) > 0 Then
            xTotEgrDol   := cdsQry.FieldByName('EGRESOME').AsString
         Else
            xTotEgrDol   := '0';

      // Si es un I N G R E S O
         If xTipoIE = 'I' Then
         begin
            If xTMonid = 'N' Then
            begin
               xTotIngSol   := FloatToStr(StrToFloat(xTotIngSol) + StrToFloat(xMonto));
            // Para Actualizar el Ingreso en Soles
               xSQL := 'Update CAJA402'
                      +'   Set INGRESOMN ='+xTotIngSol+','
                      +'       USUARIO ='+QuotedStr(wUsuario)+','
                      +'       FREG ='+DMTE.wRepFecServi+','
                      +'       HREG ='+DMTE.wRepHorServi
                      +' Where CIAID ='+QuotedStr(xCia)
                      +'   And BANCOID ='+QuotedStr(xBco)
                      +'   And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos - Ingreso MN (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;

            // Para Actualizar el Saldo Final en Soles
               xWhere := 'CIAID ='+QuotedStr(xCia)
                        +' And BANCOID ='+QuotedStr(xBco)
                        +' And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);
               DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');

               xTotIngSol := cdsQry.FieldByName('INGRESOMN').AsString;
               xTotEgrSol := cdsQry.FieldByName('EGRESOMN').AsString;

               If Length(cdsQry.FieldByName('INGRESOMN').AsString) > 0 Then
                  xTotIngSol   := cdsQry.FieldByName('INGRESOMN').AsString
               Else
                  xTotIngSol   := '0';

               If Length(cdsQry.FieldByName('EGRESOMN').AsString) > 0 Then
                  xTotEgrSol   := cdsQry.FieldByName('EGRESOMN').AsString
               Else
                  xTotEgrSol   := '0';

               xSaldoFinSol := FloatToStr(StrToFloat(xSaldoIniSol) + StrToFloat(xTotIngSol) - StrToFloat(xTotEgrSol));
               xSQL := 'Update CAJA402'
                      +'   Set SALDOFINMN ='+xSaldoFinSol+','
                      +'       USUARIO ='+QuotedStr(wUsuario)+','
                      +'       FREG ='+DMTE.wRepFecServi+','
                      +'       HREG ='+DMTE.wRepHorServi
                      +' Where CIAID ='+QuotedStr(xCia)
                      +'   And BANCOID ='+QuotedStr(xBco)
                      +'   And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos Final MN (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;
            end
            Else
            begin
              xTotIngDol   := FloatToStr(StrToFloat(xTotIngDol) + StrToFloat(xMonto));
              xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));
           // Para Actualizar el Ingreso en Dólares
              xSQL := 'Update CAJA402'
                     +'   Set INGRESOME ='+xTotIngDol+','
                     +'       USUARIO ='+QuotedStr(wUsuario)+','
                     +'       FREG ='+DMTE.wRepFecServi+','
                     +'       HREG ='+DMTE.wRepHorServi
                     +' Where CIAID ='+QuotedStr(xCia)
                     +'   And BANCOID ='+QuotedStr(xBco)
                     +'   And ANOMM ='+QuotedStr(xFecha);
              if Length(xCuenta) > 0 then
                 xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos - Ingreso ME (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;

            // Para Actualizar el Saldo Final en Dólares
               xWhere := 'CIAID ='+QuotedStr(xCia)
                        +' And BANCOID ='+QuotedStr(xBco)
                        +' And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);
               DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');
               xTotIngDol := cdsQry.FieldByName('INGRESOME').AsString;
               xTotEgrDol := cdsQry.FieldByName('EGRESOME').AsString;
               If Length(cdsQry.FieldByName('INGRESOME').AsString) > 0 Then
                  xTotIngDol   := cdsQry.FieldByName('INGRESOME').AsString
               Else
                  xTotIngDol   := '0';
               If Length(cdsQry.FieldByName('EGRESOME').AsString) > 0 Then
                  xTotEgrDol   := cdsQry.FieldByName('EGRESOME').AsString
               Else
                  xTotEgrDol   := '0';

               xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));

               xSQL := 'Update CAJA402'
                      +'   Set SALDOFINME ='+xSaldoFinDol+','
                      +'       USUARIO ='+QuotedStr(wUsuario)+','
                      +'       FREG ='+DMTE.wRepFecServi+','
                      +'       HREG ='+DMTE.wRepHorServi
                      +' Where CIAID ='+QuotedStr(xCia)
                      +'   And BANCOID ='+QuotedStr(xBco)
                      +'   And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos - Saldo Final ME (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;
            end;
         end;

       // Si es un E G R E S O
         If xTipoIE = 'E' Then
         begin
            If xTMonid = 'N' Then
            begin
               xTotEgrSol   := FloatToStr(StrToFloat(xTotEgrSol) + StrToFloat(xMonto));
            // Para Actualizar el Egreso en Soles
               xSQL := 'Update CAJA402'
                     +'    Set EGRESOMN ='+xTotEgrSol+','
                     +'        USUARIO ='+QuotedStr(wUsuario)+','
                     +'        FREG ='+DMTE.wRepFecServi+','
                     +'        HREG ='+DMTE.wRepHorServi
                     +'  Where CIAID  ='+QuotedStr(xCia)
                     +'    And BANCOID  ='+QuotedStr(xBco)
                     +'    And ANOMM    ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                   xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos - Egreso MN (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;

            // Para Actualizar el Saldo Final en Soles
               xWhere := 'CIAID ='+QuotedStr(xCia)
                        +' And BANCOID ='+QuotedStr(xBco)
                        +' And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);
               DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');
               xTotIngSol := cdsQry.FieldByName('INGRESOMN').AsString;
               xTotEgrSol := cdsQry.FieldByName('EGRESOMN').AsString;

               If Length(cdsQry.FieldByName('INGRESOMN').AsString) > 0 Then
                  xTotIngSol   := cdsQry.FieldByName('INGRESOMN').AsString
               Else
                  xTotIngSol   := '0';

               If Length(cdsQry.FieldByName('EGRESOMN').AsString) > 0 Then
                   xTotEgrSol   := cdsQry.FieldByName('EGRESOMN').AsString
               Else
                   xTotEgrSol   := '0';
               xSaldoFinSol := FloatToStr(StrToFloat(xSaldoIniSol) + StrToFloat(xTotIngSol) - StrToFloat(xTotEgrSol));
               xSQL := 'Update CAJA402'
                      +'   Set SALDOFINMN ='+xSaldoFinSol+','
                      +'       USUARIO ='+QuotedStr(wUsuario)+','
                      +'       FREG ='+DMTE.wRepFecServi+','
                      +'       HREG ='+DMTE.wRepHorServi
                      +' Where CIAID ='+QuotedStr(xCia)
                      +'   And BANCOID ='+QuotedStr(xBco)
                      +'   And ANOMM   ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                   xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos - Saldo Final MN (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;
            end
            Else
            begin
               xTotIngDol   := FloatToStr(StrToFloat(xTotIngDol) + StrToFloat(xMonto));
               xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));
            // Para Actualizar el Egreso en Dólares
               xSQL := 'Update CAJA402'
                      +'   Set EGRESOME ='+xTotIngDol+','
                      +'       USUARIO ='+QuotedStr(wUsuario)+','
                      +'       FREG ='+DMTE.wRepFecServi+','
                      +'       HREG ='+DMTE.wRepHorServi
                      +' Where CIAID ='+QuotedStr(xCia)
                      +'   And BANCOID ='+QuotedStr(xBco)
                      +'   And ANOMM   ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos - Egreso ME (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;
            // Para Actualizar el Saldo Final en Dólares
               xWhere := 'CIAID ='+QuotedStr(xCia)
                        +' And BANCOID ='+QuotedStr(xBco)
                        +' And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);
               DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');
               xTotIngDol := cdsQry.FieldByName('INGRESOME').AsString;
               xTotEgrDol := cdsQry.FieldByName('EGRESOME').AsString;

               If Length(cdsQry.FieldByName('INGRESOME').AsString) > 0 Then
                  xTotIngDol   := cdsQry.FieldByName('INGRESOME').AsString
               Else
                  xTotIngDol   := '0';

               If Length(cdsQry.FieldByName('EGRESOME').AsString) > 0 Then
                  xTotEgrDol   := cdsQry.FieldByName('EGRESOME').AsString
               Else
                  xTotEgrDol   := '0';

               xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));
               xSQL := 'Update CAJA402'
                      +'   Set SALDOFINME ='+xSaldoFinDol+','
                      +'       USUARIO ='+QuotedStr(wUsuario)+','
                      +'       FREG ='+DMTE.wRepFecServi+','
                      +'       HREG ='+DMTE.wRepHorServi
                      +' Where CIAID ='+QuotedStr(xCia)
                      +'   And BANCOID ='+QuotedStr(xBco)
                      +'   And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos - Saldo Final ME (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;
            end;
         end;
      end
      Else //Si el Mes está Aperturado
      begin
      // Actualizar los Saldos
         xWhere := 'CIAID ='+QuotedStr(xCia)
                  +' And BANCOID ='+QuotedStr(xBco)
                  +' And ANOMM ='+QuotedStr(xFecha)
                  +' And CIERRE ='+QuotedStr('N');
         if Length(xCuenta) > 0 then
            xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);

         DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');

         If Length(cdsQry.FieldByName('SALDOINIMN').AsString) > 0 Then
            xSaldoIniSol := cdsQry.FieldByName('SALDOINIMN').AsString
         Else
            xSaldoIniSol := '0';
         If Length(cdsQry.FieldByName('SALDOFINMN').AsString) > 0 Then
            xSaldoFinSol := cdsQry.FieldByName('SALDOFINMN').AsString
         Else
            xSaldoFinSol := '0';
         If Length(cdsQry.FieldByName('SALDOINIME').AsString) > 0 Then
            xSaldoIniDol := cdsQry.FieldByName('SALDOINIME').AsString
         Else
            xSaldoIniDol := '0';
         If Length(cdsQry.FieldByName('SALDOFINME').AsString) > 0 Then
            xSaldoFinDol := cdsQry.FieldByName('SALDOFINME').AsString
         Else
            xSaldoFinDol := '0';
         If Length(cdsQry.FieldByName('INGRESOMN').AsString) > 0 Then
            xTotIngSol   := cdsQry.FieldByName('INGRESOMN').AsString
         Else
            xTotIngSol   := '0';
         If Length(cdsQry.FieldByName('EGRESOMN').AsString) > 0 Then
            xTotEgrSol   := cdsQry.FieldByName('EGRESOMN').AsString
         Else
            xTotEgrSol   := '0';
         If Length(cdsQry.FieldByName('INGRESOME').AsString) > 0 Then
            xTotIngDol   := cdsQry.FieldByName('INGRESOME').AsString
         Else
            xTotIngDol   := '0';
         If Length(cdsQry.FieldByName('EGRESOME').AsString) > 0 Then
            xTotEgrDol   := cdsQry.FieldByName('EGRESOME').AsString
         Else
            xTotEgrDol   := '0';

      // Si es un I N G R E S O
         If xTipoIE = 'I' Then
         begin
            If xTMonid = 'N' Then
            begin
               xTotIngSol   := FloatToStr(StrToFloat(xTotIngSol) + StrToFloat(xMonto));
            // Para Actualizar el Ingreso en Soles
               xSQL := 'Update CAJA402'
                      +'   Set INGRESOMN ='+xTotIngSol+','
                      +'       USUARIO ='+QuotedStr(wUsuario)+','
                      +'       FREG ='+DMTE.wRepFecServi+','
                      +'       HREG ='+DMTE.wRepHorServi
                      +' Where CIAID ='+QuotedStr(xCia)
                      +'   And BANCOID ='+QuotedStr(xBco)
                      +'   And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos - Ingresos MN (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;
            // Para Actualizar el Saldo Final en Soles
               xWhere := 'CIAID ='+QuotedStr(xCia)
                        +' And BANCOID ='+QuotedStr(xBco)
                        +' And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);
               DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');
               xTotIngSol := cdsQry.FieldByName('INGRESOMN').AsString;
               xTotEgrSol := cdsQry.FieldByName('EGRESOMN').AsString;
               If Length(cdsQry.FieldByName('INGRESOMN').AsString) > 0 Then
                  xTotIngSol   := cdsQry.FieldByName('INGRESOMN').AsString
               Else
                  xTotIngSol   := '0';
               If Length(cdsQry.FieldByName('EGRESOMN').AsString) > 0 Then
                  xTotEgrSol   := cdsQry.FieldByName('EGRESOMN').AsString
               Else
                  xTotEgrSol   := '0';
               xSaldoFinSol := FloatToStr(StrToFloat(xSaldoIniSol) + StrToFloat(xTotIngSol) - StrToFloat(xTotEgrSol));
               xSQL := 'Update CAJA402'
                      +'   Set SALDOFINMN ='+xSaldoFinSol+','
                      +'       USUARIO ='+QuotedStr(wUsuario)+','
                      +'       FREG ='+DMTE.wRepFecServi+','
                      +'       HREG ='+DMTE.wRepHorServi
                      +' Where CIAID ='+QuotedStr(xCia)
                      +'   And BANCOID ='+QuotedStr(xBco)
                      +'   And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos - Saldo Final MN (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;
            end
            Else
            begin
               xTotIngDol   := FloatToStr(StrToFloat(xTotIngDol) + StrToFloat(xMonto));
               xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));
            // Para Actualizar el Ingreso en Dólares
               xSQL := 'Update CAJA402'
                      +'   Set INGRESOME ='+xTotIngDol+','
                      +'       USUARIO ='+QuotedStr(wUsuario)+','
                      +'       FREG ='+DMTE.wRepFecServi+','
                      +'       HREG ='+DMTE.wRepHorServi
                      +' Where CIAID ='+QuotedStr(xCia)
                      +'   And BANCOID ='+QuotedStr(xBco)
                      +'   And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos - Ingreso ME (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;
            // Para Actualizar el Saldo Final en Dólares
               xWhere := 'CIAID ='+QuotedStr(xCia)
                        +' And BANCOID ='+QuotedStr(xBco)
                        +' And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);
               DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');
               xTotIngDol := cdsQry.FieldByName('INGRESOME').AsString;
               xTotEgrDol := cdsQry.FieldByName('EGRESOME').AsString;
               If Length(cdsQry.FieldByName('INGRESOME').AsString) > 0 Then
                  xTotIngDol   := cdsQry.FieldByName('INGRESOME').AsString
               Else
                  xTotIngDol   := '0';
               If Length(cdsQry.FieldByName('EGRESOME').AsString) > 0 Then
                  xTotEgrDol   := cdsQry.FieldByName('EGRESOME').AsString
               Else
                  xTotEgrDol   := '0';
               xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));
               xSQL := 'Update CAJA402'
                      +'   Set SALDOFINME ='+xSaldoFinDol+','
                      +'       USUARIO ='+QuotedStr(wUsuario)+','
                      +'       FREG ='+DMTE.wRepFecServi+','
                      +'       HREG ='+DMTE.wRepHorServi
                      +' Where CIAID ='+QuotedStr(xCia)
                      +'   And BANCOID ='+QuotedStr(xBco)
                      +'   And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos - Saldo Final ME (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;
            end;
         end;

      // Si es un E G R E S O
         If xTipoIE = 'E' Then
         begin
            If xTMonid = 'N' Then
            begin
               xTotEgrSol   := FloatToStr(StrToFloat(xTotEgrSol) + StrToFloat(xMonto));
            // Para Actualizar el Egreso en Soles
               xSQL := 'Update CAJA402'
                      +'   Set EGRESOMN ='+xTotEgrSol+','
                      +'       USUARIO ='+QuotedStr(wUsuario)+','
                      +'       FREG ='+DMTE.wRepFecServi+','
                      +'       HREG ='+DMTE.wRepHorServi
                      +' Where CIAID  ='+QuotedStr(xCia)
                      +'   And BANCOID  ='+QuotedStr(xBco)
                      +'   And ANOMM    ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos - Egreso MN (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;
            // Para Actualizar el Saldo Final en Soles
               xWhere := 'CIAID ='+QuotedStr(xCia)
                        +' And BANCOID ='+QuotedStr(xBco)
                        +' And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);
               DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');
               xTotIngSol := cdsQry.FieldByName('INGRESOMN').AsString;
               xTotEgrSol := cdsQry.FieldByName('EGRESOMN').AsString;
               If Length(cdsQry.FieldByName('INGRESOMN').AsString) > 0 Then
                  xTotIngSol   := cdsQry.FieldByName('INGRESOMN').AsString
               Else
                  xTotIngSol   := '0';
               If Length(cdsQry.FieldByName('EGRESOMN').AsString) > 0 Then
                  xTotEgrSol   := cdsQry.FieldByName('EGRESOMN').AsString
               Else
                  xTotEgrSol   := '0';
               xSaldoFinSol := FloatToStr(StrToFloat(xSaldoIniSol) + StrToFloat(xTotIngSol) - StrToFloat(xTotEgrSol));
               xSQL := 'Update CAJA402'
                      +'   Set SALDOFINMN ='+xSaldoFinSol+','
                      +'       USUARIO ='+QuotedStr(wUsuario)+','
                      +'       FREG ='+DMTE.wRepFecServi+','
                      +'       HREG ='+DMTE.wRepHorServi
                      +' Where CIAID ='+QuotedStr(xCia)
                      +'   And BANCOID ='+QuotedStr(xBco)
                      +'   And ANOMM   ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos - Saldo Final MN (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;
            end
            Else
            begin
               xTotIngDol   := FloatToStr(StrToFloat(xTotIngDol) + StrToFloat(xMonto));
               xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));
            // Para Actualizar el Egreso en Dólares
               xSQL := 'Update CAJA402'
                      +'   Set EGRESOME ='+xTotIngDol+','
                      +'       USUARIO ='+QuotedStr(wUsuario)+','
                      +'       FREG ='+DMTE.wRepFecServi+','
                      +'       HREG ='+DMTE.wRepHorServi
                      +' Where CIAID ='+QuotedStr(xCia)
                      +'   And BANCOID ='+QuotedStr(xBco)
                      +'   And ANOMM   ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos - Egreso ME (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;
            // Para Actualizar el Saldo Final en Dólares
               xWhere := 'CIAID ='+QuotedStr(xCia)
                        +' And BANCOID ='+QuotedStr(xBco)
                        +' And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xWhere := xWhere+' And CCBCOID ='+QuotedStr(xCuenta);
               DMTE.DisplayDescrip('prvSQL', 'CAJA402', '*', xWhere, 'ANOMM');
               xTotIngDol := cdsQry.FieldByName('INGRESOME').AsString;
               xTotEgrDol := cdsQry.FieldByName('EGRESOME').AsString;
               If Length(cdsQry.FieldByName('INGRESOME').AsString) > 0 Then
                  xTotIngDol   := cdsQry.FieldByName('INGRESOME').AsString
               Else
                  xTotIngDol   := '0';
               If Length(cdsQry.FieldByName('EGRESOME').AsString) > 0 Then
                  xTotEgrDol   := cdsQry.FieldByName('EGRESOME').AsString
               Else
                  xTotEgrDol   := '0';
               xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));
               xSQL := 'Update CAJA402'
                      +'   Set SALDOFINME ='+xSaldoFinDol+','
                      +'       USUARIO ='+QuotedStr(wUsuario)+','
                      +'       FREG ='+DMTE.wRepFecServi+','
                      +'       HREG ='+DMTE.wRepHorServi
                      +' Where CIAID ='+QuotedStr(xCia)
                      +'   And BANCOID ='+QuotedStr(xBco)
                      +'   And ANOMM ='+QuotedStr(xFecha);
               if Length(xCuenta) > 0 then
                  xSQL := xSQL+' And CCBCOID ='+QuotedStr(xCuenta);
               try
                  DCOM1.AppServer.EjecutaSQL(xSQL);
               except
                  ShowMessage('Error al actualizar Saldos de Bancos - Saldo Final ME (CAJA402)');
                  xSigueGrab := False;
                  exit;
               end;
            end;
         end;
      end;
   end;
// Fin HPC_201401_CAJA
end;

procedure TDMTE.ActSaldosCaja(xCia, xTMonid, xBco, xMonto, xTipoIE, xFecha: String);
var
   xSQL, xWhere : String;
//   xIngreso, xEgreso, xSdoInicial, xSdoFinal, xTotEgresos, xTotIngresos : String ;
   xSaldoIniSol, xSaldoFinSol, xSaldoIniDol, xSaldoFinDol : String;
   xTotIngSol, xTotEgrSol, xTotIngDol, xTotEgrDol : String;
begin
   xWhere := 'CIAID ='+QuotedStr(xCia)
            +' And BANCOID ='+QuotedStr(xBco)
            +' And STFECHA ='+QuotedStr(xFecha);
   DMTE.DisplayDescrip('prvSQL', 'CAJA310', '*', xWhere, 'STFECHA');
   If Length(cdsQry.FieldByName('STSALDOINIC').AsString) > 0 Then
    xSaldoIniSol := cdsQry.FieldByName('STSALDOINIC').AsString
   Else
    xSaldoIniSol := '0';
   If Length(cdsQry.FieldByName('STSALDOFIN').AsString) > 0 Then
    xSaldoFinSol := cdsQry.FieldByName('STSALDOFIN').AsString
   Else
    xSaldoFinSol := '0';
   If Length(cdsQry.FieldByName('STSDOINIEXT').AsString) > 0 Then
    xSaldoIniDol := cdsQry.FieldByName('STSDOINIEXT').AsString
   Else
    xSaldoIniDol := '0';
   If Length(cdsQry.FieldByName('STSDOFINEXT').AsString) > 0 Then
    xSaldoFinDol := cdsQry.FieldByName('STSDOFINEXT').AsString
   Else
    xSaldoFinDol := '0';
   If Length(cdsQry.FieldByName('STTOTING').AsString) > 0 Then
    xTotIngSol   := cdsQry.FieldByName('STTOTING').AsString
   Else
    xTotIngSol   := '0';
   If Length(cdsQry.FieldByName('STTOTEGR').AsString) > 0 Then
    xTotEgrSol   := cdsQry.FieldByName('STTOTEGR').AsString
   Else
    xTotEgrSol   := '0';
   If Length(cdsQry.FieldByName('STINGEXT').AsString) > 0 Then
    xTotIngDol   := cdsQry.FieldByName('STINGEXT').AsString
   Else
    xTotIngDol   := '0';
   If Length(cdsQry.FieldByName('STEGREXT').AsString) > 0 Then
    xTotEgrDol   := cdsQry.FieldByName('STEGREXT').AsString
   Else
    xTotEgrDol   := '0';

//Si es un I N G R E S O
   If xTipoIE = 'I' Then
    begin
     If xTMonid = 'N' Then
      begin
       xTotIngSol := FloatToStr(StrToFloat(xTotIngSol) + StrToFloat(xMonto));
    // Inicio HPC_201309_CAJA
    // Para Actualizar el Ingreso en Soles
       xSQL := 'Update CAJA310'
              +'   Set STTOTING ='+xTotIngSol+','
              +'       USUARIO ='+QuotedStr(wUsuario)+','
              +'       FREG ='+DMTE.wRepFecServi+','
              +'       HREG ='+DMTE.wRepHorServi
              +' Where CIAID ='+QuotedStr(xCia)
              +'   And BANCOID ='+QuotedStr(xBco)
              +'   And STFECHA ='+QuotedStr(xFecha);
       try
          DCOM1.AppServer.EjecutaSQL(xSQL);
       except
          ShowMessage('Error al actualizar el Total de Ingresos en el archivo de Saldos de Caja');
          xSigueGrab := False;
          exit;
       end;
    // Fin HPC_201309_CAJA

       //Para Actualizar el Saldo Final en Soles
       xWhere := 'CIAID ='+QuotedStr(xCia)
                +' And BANCOID ='+QuotedStr(xBco)
                +' And STFECHA ='+QuotedStr(xFecha);
       DMTE.DisplayDescrip('prvSQL', 'CAJA310', '*', xWhere, 'STFECHA');
       xTotIngSol := cdsQry.FieldByName('STTOTING').AsString;
       xTotEgrSol := cdsQry.FieldByName('STTOTEGR').AsString;
       If Length(cdsQry.FieldByName('STTOTING').AsString) > 0 Then
        xTotIngSol   := cdsQry.FieldByName('STTOTING').AsString
       Else
        xTotIngSol   := '0';
       If Length(cdsQry.FieldByName('STTOTEGR').AsString) > 0 Then
        xTotEgrSol   := cdsQry.FieldByName('STTOTEGR').AsString
       Else
        xTotEgrSol   := '0';
       xSaldoFinSol := FloatToStr(StrToFloat(xSaldoIniSol) + StrToFloat(xTotIngSol) - StrToFloat(xTotEgrSol));
    // Inicio HPC_201309_CAJA
       xSQL := 'Update CAJA310 '
              +'   Set STSALDOFIN ='+xSaldoFinSol+','
              +'       USUARIO ='+QuotedStr(wUsuario)+','
              +'       FREG ='+DMTE.wRepFecServi+','
              +'       HREG ='+DMTE.wRepHorServi
              +' Where CIAID ='+QuotedStr(xCia)
              +'   And BANCOID ='+QuotedStr(xBco)
              +'   And STFECHA ='+QuotedStr(xFecha);
       try
          DCOM1.AppServer.EjecutaSQL(xSQL);
       except
          ShowMessage('Error al actualizar el Saldo Final en el archivo de Saldos de Caja');
          xSigueGrab := False;
          exit;
       end;
    // Fin HPC_201309_CAJA
      end
     Else
      begin
       xTotIngDol   := FloatToStr(StrToFloat(xTotIngDol) + StrToFloat(xMonto));
       xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));
    // Inicio HPC_201309_CAJA
       //Para Actualizar el Ingreso en Dólares
       xSQL := 'Update CAJA310'
              +'   Set STINGEXT ='+xTotIngDol+', '
              +'       USUARIO ='+QuotedStr(wUsuario)+', '
              +'       FREG ='+DMTE.wRepFecServi+', '
              +'       HREG ='+DMTE.wRepHorServi
              +' Where CIAID ='+QuotedStr(xCia)
              +'   and BANCOID ='+QuotedStr(xBco)
              +'   and STFECHA ='+QuotedStr(xFecha);
       try
          DCOM1.AppServer.EjecutaSQL(xSQL);
       except
          ShowMessage('Error al actualizar el Total de Ingresos en el archivo de Saldos de Caja');
          xSigueGrab := False;
          exit;
       end;
    // Fin HPC_201309_CAJA
       //Para Actualizar el Saldo Final en Dólares
       xWhere := 'CIAID ='+QuotedStr(xCia)
                +' And BANCOID ='+QuotedStr(xBco)
                +' And STFECHA ='+QuotedStr(xFecha);
       DMTE.DisplayDescrip('prvSQL', 'CAJA310', '*', xWhere, 'STFECHA');
       xTotIngDol := cdsQry.FieldByName('STINGEXT').AsString;
       xTotEgrDol := cdsQry.FieldByName('STEGREXT').AsString;
       If Length(cdsQry.FieldByName('STINGEXT').AsString) > 0 Then
        xTotIngDol   := cdsQry.FieldByName('STINGEXT').AsString
       Else
        xTotIngDol   := '0';
       If Length(cdsQry.FieldByName('STEGREXT').AsString) > 0 Then
        xTotEgrDol   := cdsQry.FieldByName('STEGREXT').AsString
       Else
        xTotEgrDol   := '0';
       xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));
    // Inicio HPC_201309_CAJA
       xSQL := 'Update CAJA310'
              +'   Set STSDOFINEXT ='+xSaldoFinDol+','
              +'       USUARIO ='+QuotedStr(wUsuario)+','
              +'       FREG ='+DMTE.wRepFecServi+','
              +'       HREG ='+DMTE.wRepHorServi
              +' Where CIAID ='+QuotedStr(xCia)
              +'   And BANCOID ='+QuotedStr(xBco)
              +'   And STFECHA ='+QuotedStr(xFecha);
       try
          DCOM1.AppServer.EjecutaSQL(xSQL);
       except
          ShowMessage('Error al actualizar el Saldo Final en el archivo de Saldos de Caja');
          xSigueGrab := False;
          exit;
       end;
    // Fin HPC_201309_CAJA
      end;
    end;

//Si es un E G R E S O
   If xTipoIE = 'E' Then
    begin
     If xTMonid = 'N' Then
      begin
       xTotEgrSol   := FloatToStr(StrToFloat(xTotEgrSol) + StrToFloat(xMonto));
    // Inicio HPC_201309_CAJA
       //Para Actualizar el Egreso en Soles
       xSQL := 'Update CAJA310'
              +'   Set STTOTEGR ='+xTotEgrSol+', '
              +'       USUARIO ='+QuotedStr(wUsuario)+', '
              +'       FREG ='+DMTE.wRepFecServi+','
              +'       HREG ='+DMTE.wRepHorServi
              +' Where CIAID  ='+QuotedStr(xCia)
              +'   And BANCOID  ='+QuotedStr(xBco)
              +'   And STFECHA  ='+QuotedStr(xFecha);
       try
          DCOM1.AppServer.EjecutaSQL(xSQL);
       except
          ShowMessage('Error al actualizar el Total de Egresos en el archivo de Saldos de Caja');
          xSigueGrab := False;
          exit;
       end;
    // Fin HPC_201309_CAJA
       //Para Actualizar el Saldo Final en Soles
       xWhere := 'CIAID ='+QuotedStr(xCia)
                +' And BANCOID ='+QuotedStr(xBco)
                +' And STFECHA ='+QuotedStr(xFecha);
       DMTE.DisplayDescrip('prvSQL', 'CAJA310', '*', xWhere, 'STFECHA');
       xTotIngSol := cdsQry.FieldByName('STTOTING').AsString;
       xTotEgrSol := cdsQry.FieldByName('STTOTEGR').AsString;
       If Length(cdsQry.FieldByName('STTOTING').AsString) > 0 Then
        xTotIngSol   := cdsQry.FieldByName('STTOTING').AsString
       Else
        xTotIngSol   := '0';
       If Length(cdsQry.FieldByName('STTOTEGR').AsString) > 0 Then
        xTotEgrSol   := cdsQry.FieldByName('STTOTEGR').AsString
       Else
        xTotEgrSol   := '0';
    // Inicio HPC_201401_CAJA
       xSaldoFinSol := FloatToStr(StrToFloat(xSaldoIniSol) + StrToFloat(xTotIngSol) - StrToFloat(xTotEgrSol));
    // Fin  HPC_201401_CAJA
    // Inicio HPC_201309_CAJA
       xSQL := 'Update CAJA310'
              +'   Set STSALDOFIN ='+xSaldoFinSol+', '
              +'       USUARIO ='+QuotedStr(wUsuario)+', '
              +'       FREG ='+DMTE.wRepFecServi+', '
              +'       HREG ='+DMTE.wRepHorServi
              +' Where CIAID ='+QuotedStr(xCia)
              +'   And BANCOID ='+QuotedStr(xBco)
              +'   And STFECHA ='+QuotedStr(xFecha);
       try
          DCOM1.AppServer.EjecutaSQL(xSQL);
       except
          ShowMessage('Error al actualizar el Saldo Final en el archivo de Saldos de Caja');
          xSigueGrab := False;
          exit;
       end;
    // Fin HPC_201309_CAJA
      end
     Else
      begin
       xTotIngDol   := FloatToStr(StrToFloat(xTotIngDol) + StrToFloat(xMonto));
       xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));
    // Inicio HPC_201309_CAJA
       //Para Actualizar el Ingreso en Dólares
       xSQL := 'Update CAJA310'
              +'   Set STEGREXT ='+xTotIngDol+', '
              +'       USUARIO ='+QuotedStr(wUsuario)+', '
              +'       FREG ='+DMTE.wRepFecServi+', '
              +'       HREG ='+DMTE.wRepHorServi
              +' Where CIAID ='+QuotedStr(xCia)
              +'   And BANCOID ='+QuotedStr(xBco)
              +'   And STFECHA ='+QuotedStr(xFecha);
       try
          DCOM1.AppServer.EjecutaSQL(xSQL);
       except
          ShowMessage('Error al actualizar el Total de Egresos ME en el archivo de Saldos de Caja');
          xSigueGrab := False;
          exit;
       end;
    // Fin HPC_201309_CAJA
       //Para Actualizar el Saldo Final en Dólares
       xWhere := 'CIAID ='+QuotedStr(xCia)
                +' And BANCOID ='+QuotedStr(xBco)
                +' And STFECHA ='+QuotedStr(xFecha);
       DMTE.DisplayDescrip('prvSQL', 'CAJA310', '*', xWhere, 'STFECHA');
       xTotIngDol := cdsQry.FieldByName('STINGEXT').AsString;
       xTotEgrDol := cdsQry.FieldByName('STEGREXT').AsString;
       If Length(cdsQry.FieldByName('STINGEXT').AsString) > 0 Then
        xTotIngDol   := cdsQry.FieldByName('STINGEXT').AsString
       Else
        xTotIngDol   := '0';
       If Length(cdsQry.FieldByName('STEGREXT').AsString) > 0 Then
        xTotEgrDol   := cdsQry.FieldByName('STEGREXT').AsString
       Else
        xTotEgrDol   := '0';
       xSaldoFinDol := FloatToStr(StrToFloat(xSaldoIniDol) + StrToFloat(xTotIngDol) - StrToFloat(xTotEgrDol));
    // Inicio HPC_201309_CAJA
       xSQL := 'Update CAJA310 '
              +'   Set STSDOFINEXT ='+xSaldoFinDol+', '
              +'       USUARIO ='+QuotedStr(wUsuario)+', '
              +'       FREG ='+DMTE.wRepFecServi+', '
              +'       HREG ='+DMTE.wRepHorServi
              +' Where CIAID ='+QuotedStr(xCia)
              +'   And BANCOID ='+QuotedStr(xBco)
              +'   And STFECHA ='+QuotedStr(xFecha);
       try
          DCOM1.AppServer.EjecutaSQL(xSQL);
       except
          ShowMessage('Error al actualizar el Saldo Total ME en el archivo de Saldos de Caja');
          xSigueGrab := False;
          exit;
       end;
    // Fin HPC_201309_CAJA
      end;
    end;

//Si es ANULACIÓN de un E G R E S O
   If xTipoIE = 'AE' Then
   begin
      xWhere := 'CIAID ='+QuotedStr(xCia)
               +' And BANCOID ='+QuotedStr(xBco)
               +' And STFECHA ='+QuotedStr(xFecha);
      DMTE.DisplayDescrip('prvSQL', 'CAJA310', '*', xWhere, 'STFECHA');
      If xTMonid = 'N' Then
      begin
         xTotEgrSol := FloatToStr(cdsQry.FieldByName('STTOTEGR').AsFloat - StrToFloat(xMonto));
         xSaldoFinSol := FloatToStr(cdsQry.FieldByName('STSALDOINIC').AsFloat
                                  + cdsQry.FieldByName('STTOTING').AsFloat
                                  - StrToFloat(xTotEgrSol));
      // Para Actualizar el Egreso en Soles
         xSQL := 'Update CAJA310'
                +'   Set STTOTEGR = ' + xTotEgrSol+', '
                +'       STSALDOFIN = ' + xSaldoFinSol+', '
                +'       USUARIO ='+QuotedStr(wUsuario)+', '
                +'       FREG ='+DMTE.wRepFecServi+','
                +'       HREG ='+DMTE.wRepHorServi
                +' Where CIAID  ='+QuotedStr(xCia)
                +'   And BANCOID  ='+QuotedStr(xBco)
                +'   And STFECHA  ='+QuotedStr(xFecha);
         try
            DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            ShowMessage('Error al actualizar el Total de Egresos y Saldo en el archivo de Saldos de Caja');
            xSigueGrab := False;
            exit;
         end;
      end
      else
      begin
         xTotEgrSol := FloatToStr(cdsQry.FieldByName('STEGREXT').AsFloat - StrToFloat(xMonto));
         xSaldoFinSol := FloatToStr(cdsQry.FieldByName('STSDOINIEXT').AsFloat
                                  + cdsQry.FieldByName('STINGEXT').AsFloat
                                  - StrToFloat(xTotEgrSol));
      // Para Actualizar el Egreso en Soles
         xSQL := 'Update CAJA310'
                +'   Set STEGREXT = ' + xTotEgrSol+', '
                +'       STSDOFINEXT = ' + xSaldoFinSol+', '
                +'       USUARIO ='+QuotedStr(wUsuario)+', '
                +'       FREG ='+DMTE.wRepFecServi+','
                +'       HREG ='+DMTE.wRepHorServi
                +' Where CIAID  ='+QuotedStr(xCia)
                +'   And BANCOID  ='+QuotedStr(xBco)
                +'   And STFECHA  ='+QuotedStr(xFecha);
         try
            DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            ShowMessage('Error al actualizar el Total de Egresos y Saldo en el archivo de Saldos de Caja ME');
            xSigueGrab := False;
            exit;
         end;
      end;
   end;

// Si es ANULACIÓN de un <<INGRESO>> o <<EGRESO PARA FONDO FIJO>>
   If xTipoIE = 'AI' Then
   begin
      xWhere := 'CIAID ='+QuotedStr(xCia)
               +' And BANCOID ='+QuotedStr(xBco)
               +' And STFECHA ='+QuotedStr(xFecha);
      DMTE.DisplayDescrip('prvSQL', 'CAJA310', '*', xWhere, 'STFECHA');
      If xTMonid = 'N' Then
      begin
         xTotIngSol := FloatToStr(cdsQry.FieldByName('STTOTING').AsFloat - StrToFloat(xMonto));
         xSaldoFinSol := FloatToStr(cdsQry.FieldByName('STSALDOINIC').AsFloat
                                  + StrToFloat(xTotIngSol)
                                  - cdsQry.FieldByName('STTOTEGR').AsFloat);
      // Para Actualizar el Egreso en Soles
         xSQL := 'Update CAJA310'
                +'   Set STTOTING = ' + xTotIngSol+', '
                +'       STSALDOFIN = ' + xSaldoFinSol+', '
                +'       USUARIO ='+QuotedStr(wUsuario)+', '
                +'       FREG ='+DMTE.wRepFecServi+','
                +'       HREG ='+DMTE.wRepHorServi
                +' Where CIAID  ='+QuotedStr(xCia)
                +'   And BANCOID  ='+QuotedStr(xBco)
                +'   And STFECHA  ='+QuotedStr(xFecha);
         try
            DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            ShowMessage('Error al actualizar el Total de Ingresos y Saldo en el archivo de Saldos de Caja');
            xSigueGrab := False;
            exit;
         end;
      end
      else
      begin
         xTotIngSol := FloatToStr(cdsQry.FieldByName('STINGEXT').AsFloat - StrToFloat(xMonto));
         xSaldoFinSol := FloatToStr(cdsQry.FieldByName('STSDOINIEXT').AsFloat
                                  + StrToFloat(xTotIngSol)
                                  - cdsQry.FieldByName('STEGREXT').AsFloat);
      // Para Actualizar el Egreso en Soles
         xSQL := 'Update CAJA310'
                +'   Set STINGEXT = ' + xTotIngSol+', '
                +'       STSDOFINEXT = ' + xSaldoFinSol+', '
                +'       USUARIO ='+QuotedStr(wUsuario)+', '
                +'       FREG ='+DMTE.wRepFecServi+','
                +'       HREG ='+DMTE.wRepHorServi
                +' Where CIAID  ='+QuotedStr(xCia)
                +'   And BANCOID  ='+QuotedStr(xBco)
                +'   And STFECHA  ='+QuotedStr(xFecha);
         try
            DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            ShowMessage('Error al actualizar el Total de Ingresos y Saldo en el archivo de Saldos de Caja ME');
            xSigueGrab := False;
            exit;
         end;
      end;
   end;

end;

function TDMTE.LaCuentaSeRegistraSoloEnME(xxCia, xxCpto,
  xxCuenta: string): boolean;
var
   sSQL:string;
begin
   if xxCpto<>'' then
   begin
      sSQL:=' SELECT CUENTAID FROM CAJA201 WHERE CPTOID='+QuotedStr(xxCpto);
      DMTE.Filtracds(cdsQry,sSQL);
      sSQL:=' SELECT CUENTAID,REGSOLOME FROM TGE202 WHERE CIAID='+QuotedStr(xxCia)+
            ' AND CUENTAID='+QuotedStr(cdsQry.FieldbyName('CUENTAID').AsString);
      DMTE.Filtracds(cdsQry,sSQL);
      result:=(cdsQry.FieldbyName('REGSOLOME').AsString='S');
   end
   else // si el concepto es vacío, solo verifica la Cia+Cuenta
   begin
      sSQL:=' SELECT CUENTAID,REGSOLOME FROM TGE202 WHERE CIAID='+QuotedStr(xxCia)
           +' AND CUENTAID='+QuotedStr(xxCuenta);
      DMTE.Filtracds(cdsQry,sSQL);
      result:=(cdsQry.FieldbyName('REGSOLOME').AsString='S');
   end;
end;

procedure TDMTE.FiltraTabla( xxCds:TwwClientDataSet; xxArchivo,xxCampo:String  );
var
   xFiltro, xSQL2 : String;
begin
   cdsAcceso.Filtered := False;
   cdsAcceso.Filter   := '';
   cdsAcceso.Filter   := 'NTabla='+''''+xxArchivo+'''';
   cdsAcceso.Filtered := True;

   xFiltro := '';
   cdsAcceso.First;
   while not cdsAcceso.Eof do begin
      If Length(xFiltro)=0 then
         xFiltro:=xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+''''
      else
         xFiltro:=xFiltro+' OR '+xxCampo+'='+''''+cdsAcceso.FieldByName('CODIGO').AsString+'''';

      cdsAcceso.Next;
   end;

   if Length(xFiltro)>0 then begin
      xSQL2 := 'SELECT * FROM '+ xxArchivo+' WHERE '+xFiltro;
      xxCds.IndexFieldNames:='';
      xxCds.Filter:='';
      xxCds.Filtered:= False;
      xxCds.Close;
      xxCds.DataRequest( xSQL2 );
   end;
   xxCds.Open;
end;


procedure TDMTE.DisminuyeForma(Sender: TObject);
begin
  // FVariables.w_Num_Formas := FVariables.w_Num_Formas-1;
end;

procedure TDMTE.ActualizaFiltro(wwFiltro: TMant; wwCdsLee: TwwClientDataSet;
  wwAccion: String);
var
   i : integer;
begin
// wFiltro : Es el Filtro que va a actualizar
// wCDsLee : Es el cds que contiene la información a actualizar
// wAccion : 'A' = Adición/Inserción/Nuevo Item
//           'M' = Actualización del Registro
//           'E' = Eliminación del Registro

   if wwAccion='E' then
   begin
      wwFiltro.FMant.cds2.Delete;
   end;

   if wwAccion='A' then
   begin
      wwFiltro.FMant.cds2.Append;
   end;

   if wwAccion='M' then
   begin
      wwFiltro.FMant.cds2.Edit;
   end;

   if (wwAccion='A') or (wwAccion='M') then
   begin
      for i:=0 to wwCdsLee.FieldCount-1 do
      begin
         wwFiltro.FMant.cds2.FieldByName(wwCdsLee.Fields[i].FieldName).Value :=
                wwCdsLee.FieldByName(wwCdsLee.Fields[i].FieldName).Value;
      end;
   end;
   wwFiltro.FMant.cds2.Post;
end;

procedure TDMTE.cdsEgrCajaXReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
	 Action := HandleReconcileError(Dataset,UpdateKind,E);
end;

procedure TDMTE.cdsIngDocsReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
	 //Action := HandleReconcileError(Dataset,UpdateKind,E);
end;

procedure TDMTE.HojaExcel(Tit: string; TDs: TDataSource; TDb: TDBGrid);
var Lcid, C, CH, CH1, I, W, X, Y, TotHoja: Integer; Bk: TBookmarkStr;
    Tabla: Variant; L, A: OleVariant; HH: Extended;
begin
	if not TDs.DataSet.Active then Exit;
	if TDs.DataSet.RecordCount = 0 then Exit;

	Lcid:= GetUserDefaultLCID;
	C:= TDb.Columns.Count;
	CH:= 1;
	if TDs.DataSet.RecordCount > 15100 then
		begin
			HH:= TDs.DataSet.RecordCount / 15100;
			CH:= Trunc(HH);
			if Frac(HH) > 0 then CH:= CH + 1;
		end;

	ExcelApp.Visible[Lcid]:= True;
	ExcelApp.Caption:= 'Consultas en EXCEL';
	ExcelBook.ConnectTo(ExcelApp.Workbooks.Add(1, Lcid));
	if CH > 1 then
		begin
			ExcelBook.Worksheets.Add(NULL, NULL, (CH - 1), NULL, Lcid);
			for I:= 1 to CH do
				begin
					WS.ConnectTo(ExcelBook.Worksheets[I] as _Worksheet);
					WS.Name:= Tit + '_' + IntToStr(I);
				end;
		end;

	WS.ConnectTo(ExcelBook.Worksheets[1] as _Worksheet);
	WS.Activate(Lcid);
	if CH = 1 then WS.Name:= Tit;
	ExcelApp.ScreenUpdating[Lcid]:= False;
	for X:= 1 to CH do
		begin
			WS.ConnectTo(ExcelBook.Worksheets[X] as _Worksheet);
			WS.Activate(Lcid);
			for I:= 0 to (C - 1) do
				begin
					L:= WS.Cells.Item[1, I + 1];
					WS.Range[L, L].Value2:= TDb.Columns[I].Title.Caption;
				end;
		end;

	WS.ConnectTo(ExcelBook.Worksheets[1] as _Worksheet);
	WS.Activate(Lcid);

	CH1:= 1;
	W:= 2;
	I:= 1;
	Y:= 1;
	TotHoja:= 0;
	TDs.DataSet.DisableControls;
	Bk:= TDs.DataSet.Bookmark;

	Tabla:= VarArrayCreate([1, 5000, 0, C], varVariant);
	TDs.DataSet.First;
	while not TDs.DataSet.Eof do
		begin
			for X:= 0 to (C - 1) do Tabla[Y, X]:= TDs.DataSet.Fields[X].AsString;
			if Y = 5000 then
				begin
					L:= 'A' + IntToStr(W);
					WS.Range[L, WS.Cells.Item[I + 1, C]].Value2:= Tabla;
					try
						Tabla:= Unassigned;
					finally
						Tabla:= VarArrayCreate([1, 5000, 0, C], varVariant);
					end;

					Y:= 0;
					W:= I + 2;
				end;
			Inc(Y, 1);
			Inc(I, 1);
			Inc(TotHoja, 1);
			if TotHoja = 15100 then
				begin
					L:= 'A' + IntToStr(W);
					WS.Range[L, WS.Cells.Item[I, C]].Value2:= Tabla;

					try
						Tabla:= Unassigned;
					finally
						Tabla:= VarArrayCreate([1, 5000, 0, C], varVariant);
					end;

					CH1:= CH1 + 1;
					WS.ConnectTo(ExcelBook.Worksheets[CH1] as _Worksheet);
					WS.Activate(Lcid);

					Y:= 1;
					W:= 2;
					I:= 1;
					TotHoja:= 0;
				end;
			Application.ProcessMessages;
			TDs.DataSet.Next;
		end;
	CH1:= I;
	try
	   WS.Range['A' + IntToStr(W), WS.Cells.Item[CH1, C]].Value2:= Tabla;
	finally
		Tabla:= Unassigned;
	end;

	for X:= 1 to CH do
		begin
			WS.ConnectTo(ExcelBook.Worksheets[X] as _Worksheet);
			WS.Activate(Lcid);

			SetLength(FormatCel, C + 1);
			FormatosCeldas(C,TDs);
			for I:= 1 to C do
				begin
					L:= WS.Cells.Item[1, I];
					WS.Range[L, L].EntireColumn.NumberFormat:= FormatCel[I];
				end;

			for I:= 0 to (C - 1) do
				begin
					L:= WS.Cells.Item[1, I + 1];
					Y:= TDs.DataSet.Fields[I].DisplayWidth;
					if Length(TDb.Columns[I].Title.Caption) > Y then
						Y:= Length(TDb.Columns[I].Title.Caption);
					  WS.Range[L, L].EntireColumn.ColumnWidth:= Y + 2;
					if TDb.Columns[I].Alignment = taLeftJustify then A:= 2;
					if TDb.Columns[I].Alignment = taCenter then A:= 3;
					if TDb.Columns[I].Alignment = taRightJustify then A:= 4;
					WS.Range[L, L].EntireColumn.HorizontalAlignment:= A;
				end;

			L:= WS.Cells.Item[1, C];
			WS.Range['A1', L].HorizontalAlignment:= 3;
			WS.Range['A1', L].Interior.Color:= clMaroon;
			WS.Range['A1', L].Font.Color:= clWhite;
			WS.Range['A1', L].Font.Bold:= True;

			if CH = 1 then W:= TDs.DataSet.RecordCount + 1
			else if (CH > 1) and (X < CH) then W:= 15101
			else if (CH > 1) and (X = CH) then W:= CH1;

			WS.PageSetup.PrintGridlines:= True;
			WS.PageSetup.PrintTitleRows:= '1:1';

			WS.DefaultInterface.Set_DisplayAutomaticPageBreaks(Lcid, True);
		end;

	WS.ConnectTo(ExcelBook.Worksheets[1] as _Worksheet);
	WS.Activate(Lcid);

	ExcelApp.ScreenUpdating[Lcid]:= True;

	TDs.DataSet.EnableControls;
	TDs.DataSet.Bookmark:= Bk;


end;

procedure TDMTE.FormatosCeldas(N: Integer; TDs: TDataSource);
var I: Integer; F: TFieldDef;
begin
    for I:= 1 to N do
    Begin
          F := TDs.DataSet.FieldDefs.Items[I-1];
          Case F.DataType of
               ftString: FormatCel[I]:= DMTE.StrZero('0',Length(TDs.DataSet.Fields[I-1].AsString));
               ftDate: FormatCel[I]:= 'dd/mm/yyyy';
               ftDateTime: FormatCel[I]:= 'dd/mm/yyyy';
               ftTimeStamp: FormatCel[I]:= 'dd/mm/yyyy';
               ftUnknown: FormatCel[I]:= DMTE.StrZero('0',Length(TDs.DataSet.Fields[I-1].AsString));
          Else
               FormatCel[I]:= Null;
          End;
     End;


end;


function TDMTE.ObtenerIpdeNetbios(Host: string): string;
var
  WSAData: TWSADATA;
  HostEnt: phostent;
begin
  Result:= '';
  if WSAStartup(MAKEWORD(1, 1), WSADATA) = 0 then
  begin
    HostEnt:= gethostbyname(PChar(Host));
    if HostEnt <> nil then
      Result:= String(inet_ntoa(PInAddr(HostEnt.h_addr_list^)^));
    WSACleanup;
  end;
end;

function TDMTE.ComputerName: string;
var
  Buffer: array[ 0..100 ] of Char;
  MaxSize: Cardinal ;
begin
  MaxSize := SizeOf( Buffer );
  if not GetComputerName( @Buffer, MaxSize ) then
    raise Exception.Create( 'No puedo determinar el nombre de la máquina' );
  Result := StrPas( @Buffer );
end;

function TDMTE.AccesosModulo :  Boolean;
var
   xSQL : String;
   xfecfin :TDate;
   xdiasexppass:Integer;
   xdiasfaltantes:Integer;
   xdiasduracpass:Integer;
   xpassact, xctrl_ip, xingresa :String;
begin
// busca en tabla DE USUARIO (TGE006) para determinar que es un usuario de base de datos
   xSQL := 'select FECEXP, OFDESID, nvl(CTRL_IP,''S'') CTRL_IP, '
          +'       TO_DATE(nvl(FECINI_PWD,sysdate-30)) FECINI_PWD, '
          +'       TO_DATE(nvl(FECFIN_PWD, sysdate-1)) FECFIN_PWD, '
          +'       nvl(DIASEXP_PWD,7) DIASEXP_PWD,'
          +'       nvl(DIASDURAC_PWD,30) DIASDURAC_PWD '
          +'from TGE006 '
          +'where USERID = '+QuotedStr(wUsuario);
   cdsQry.Close;
   cdsQry.DataRequest(xSql);
   cdsQry.Open;
   If cdsQry.RecordCount=0 then
   Begin
      Showmessage('Usuario no reconocido para el uso de Aplicaciones');
      Result:=False;
      Exit;
   End;

// valida que contraseña en control de aplicaciones (TGE006), no haya expirado
   If (cdsQry.FieldByName('FECEXP').AsDateTime>0) and
      (cdsQry.FieldByName('FECEXP').AsDateTime<Date) Then
   Begin
      Showmessage('Usuario ha caducado para el uso de Aplicaciones');
      Result:=False;
      Exit;
   End;
   xfecfin         := cdsQry.FieldByName('FECFIN_PWD').AsDateTime;
   xdiasexppass    := cdsQry.FieldByName('DIASEXP_PWD').AsInteger;
   xdiasduracpass  := cdsQry.FieldByName('DIASDURAC_PWD').AsInteger;
   //xpassact        := FCtrlAcceso.dbePassword.Text;

   wOfiId  := cdsQry.FieldByName('OFDESID').AsString;
   xctrl_ip:= cdsQry.FieldByName('CTRL_IP').AsString;
   widepc  := computerName;

// determina que el usuario tenga acceso al módulo
// busca en tabla TGE006 para determinar que es un usuario de base de datos y de la aplicación
   xSQL := 'Select USUARIOS.USERID, USUARIOS.USERNOM, USUARIOGRUPO.GRUPOID, '
          +'       GRUPOS.GRUPODES, GRUPOS.GRUPOADM, ACCESOGRUPO.MODULOID, '
          +'       ACCESOGRUPO.TIPO, ACCESOGRUPO.OBJETO, ACCESOGRUPO.FORMA '
          +'From TGE006 USUARIOS, TGE007 USUARIOGRUPO, TGE003 GRUPOS, TGE001 ACCESOGRUPO '
          +'where USUARIOS.USERID='+quotedstr(wUsuario) // -- TGE006 USUARIOS
          +'  and USUARIOGRUPO.USERID=USUARIOS.USERID' // -- TGE007 USUARIOGRUPO
          +'  and GRUPOS.GRUPOID=USUARIOGRUPO.GRUPOID' // -- TGE003 GRUPOS
          +'  and ACCESOGRUPO.GRUPOID=USUARIOGRUPO.GRUPOID '
          +'  and ACCESOGRUPO.MODULOID='+quotedstr(wModulo)
          +'  and ACCESOGRUPO.TIPO=''0'' '; // TGE001 ACCESOGRUPO
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If cdsQry.RecordCount=0 then
   Begin
      ShowMessage('No tiene Acceso al módulo');
      Result:=False;
      Exit;
   End;

// Identifica si el usuario puede ejecutar los sistemas de cualquier maquina
// o solo de las máquina que se le han asignado
   xingresa := 'N';
   If xctrl_ip = 'S' Then
   Begin
     xSQL := 'SELECT IP_ASIGNADO FROM TGE010 WHERE USERID = '+QuotedStr(wUsuario);
     cdsQry.Close;
     cdsQry.DataRequest(xSQL);
     cdsQry.Open;
     While Not cdsQry.Eof Do
     Begin
        If cdsQry.FieldByName('IP_ASIGNADO').AsString = cIP then xingresa := 'S';
        cdsQry.Next;
     End;
   End;
   If (xingresa = 'N') And (xctrl_ip = 'S') Then
   Begin
      Showmessage('Usuario no autorizado para ingresar de este equipo');
      Result:=False;
      Exit;
   End;

// DETERMINA NRO DE IDENTIFICADOR PARA GRABAR EN ARCHIVO LOG DE ACCESOS
// SE DETERMINA EN BASE A LA FECHA+HORA DE INGRESO A LA BASE DE DATOS
   xSQL := 'SELECT TO_CHAR(SYSDATE,''YYYYMMDDHH24MISS'') IDE, SYSDATE FECHORCON FROM DUAL';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   ideconex  := cdsQry.FieldByName('IDE').AsString;
   fechorcon := cdsQry.FieldByName('FECHORCON').AsString;

// ENVIA PARAMETROS DE LA PC DEL USUARIO HACIA LA APLICACION SERVIDOR
   DCOM1.AppServer.ConexionON( wUsuario, cIP, wModulo, ideconex, fechorcon, widepc);

// controla caducidad de contraseña
   xSQL := 'SELECT TO_DATE('+QuotedStr(DateToStr(xfecfin))+') - TO_DATE(SYSDATE) DIASFALTANTE FROM DUAL';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;

   xdiasfaltantes := cdsQry.FieldByName('DIASFALTANTE').AsInteger; // dias que faltan
   If xdiasfaltantes <= xdiasexppass Then
   Begin
      If xdiasfaltantes <= 0 then
         MessageDlg('SU CONTRASEÑA HA CADUCADO, DEBE CAMBIARLA AHORA', mtCustom, [mbOk], 0)
      else
         if xdiasfaltantes=1 then
            MessageDlg('!!! FALTA 1 DíA PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡'+chr(13)
                      +'            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0)
         else
            MessageDlg('!!! FALTAN '+IntToStr(xdiasfaltantes)+' DÍAS PARA EL VENCIMIENTO DE SU CONTRASEÑA ¡¡¡'+chr(13)
                      +'            SE SUGIERE CAMBIARLA AHORA                  ', mtInformation, [mbOk], 0);
     { FCambioContrasena:= TFCambioContrasena.create(self);
      Try
         FCambioContrasena.ShowModal;
      Finally
         FCambioContrasena.Free;
      End;}
   End;
   If xdiasfaltantes <= 0 Then
   Begin
      Result:=False;
      Exit;
   End;

   Result:=True;

end;


procedure TDMTE.DataModuleDestroy(Sender: TObject);
begin
// ENVIA PARAMETROS DE LA PC DEL USUARIO HACIA LA APLICACION SERVIDOR
   try
      if ideconex<>'' then
         DCOM1.AppServer.ConexionOFF( wUsuario, ideconex);
   except
   end;
end;

Function TDMTE.fg_VerificaVersion(wgVersion :String): Boolean;
Var
   xsSQL : String;
Begin
   Result:=False;
   xsSQL:='SELECT * FROM TGE600 WHERE CODIGO = ' + QuotedStr(wModulo);
   cdsQry.Close;
   cdsQry.DataRequest( xsSQL );
   cdsQry.Open;
   If Trim(wgVersion) = Trim(cdsQry.FieldByName('VERSION').AsString) Then
      Result:=True
   Else
      Result:=False;
End;


procedure TDMTE.ppGroupFooterBand3BeforePrint(Sender: TObject);
begin
{   if ppDBText14.Caption='62' then
   begin
      pplDet1.Visible:=True;
      pplDet2.Visible:=True;
   end;}
end;

procedure TDMTE.ppGroupFooterBand7BeforePrint(Sender: TObject);
begin
{   if ppDBText14.Caption='62' then
   begin
      pplDet1.Visible:=True;
      pplDet2.Visible:=True;
   end;}
end;

procedure TDMTE.ppTitleBand2BeforePrint(Sender: TObject);
begin
{   if ppDBText14.text='62' then
   begin
      pplDet1.Visible:=True;
      pplDet2.Visible:=True;
   end;}
end;

//INICIO HPC_201306_CAJA
function TDMTE.ejecutaPrograma2( cPaquete, cPrograma : String ):String;
var
  PackageModule: THandle;
  FormaPckProc: TFormaPckProc;
begin
  PackageModule := LoadPackage( cPaquete );
  try
    @FormaPckProc := GetProcAddress(PackageModule, PChar( cPrograma) );
    if not (@FormaPckProc = nil) then
       result := FormaPckProc;
  finally

  end;
end;
//Final HPC_201306_CAJA

// Inicio HPC_201603_CAJA
// Rutina que inserta detalle de Retenciones IGV para rutina Pago Global 2
procedure TDMTE.InsertaEnCNT320Global;
var
   xSerie, xCiaRUC, xNumero, xSQL, xWhere, xTMonDes : String;
   xContador  : Integer;
   xSuma, xSumaTot : Double;
   xTasaRet: Double;
   xfArchivoTexto: TextFile;
   xsNombreTxt, xCarpeta, xsClave, xTDocSunat : String;
begin
// Corrige Numeración de Retención
// RUC de la Compañía
   xCiaRUC := DisplayDescrip('prvTGE','TGE101','CIARUC',
                        'CIAID='+Quotedstr(cdsEgrCaja.FieldByName('CIAID').AsString),'CIARUC');

// Descripción Moneda Nacional
   xWhere:='TMONID='+quotedstr(wTMonLoc);
   xTMonDes:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');

// Determina Serie a utilizar por los Comprobantes de Retención
   xSQL:='Select SERIERET '
      + '   from CXP104 '
      + '  where VIGENCIA=''S'' '
      + '    and CIARUC='+QuotedStr(xCiaRUC);
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   xSerie := cdsQry.FieldByName('SERIERET').AsString;

// Tasa de Retención
   xSQL := 'Select TASACAN '
      + '     from TGE108 '
      + '    where TASATPO=''R'' ';
   cdsQry.Close;
   cdsQry.DataRequest(xSQL);
   cdsQry.Open;
   If cdsQry.RecordCount = 0 Then
   Begin
      ShowMessage('No hay Tasa de Retención');
      exit;
   End;
   xTasaRet := cdsQry.FieldByName('TASACAN').AsFloat;

   //
   xContador := 0;
   xSuma := 0;
   cdsConsulta.First;
   while not cdsConsulta.Eof do
   begin
      if cdsConsulta.FieldByName('MTOBASERET').AsFloat<>0 then
      begin
         xSuma := xSuma + cdsConsulta.FieldByName('MONTORET').AsFloat;
         xContador := xContador+1;
         if (xContador=1) or (xContador>=xNumLinRet) then
         Begin
            xSQL:='Select max(RETNUMERO) NUMERO '
               + '   from CNT320 '
               + '  where CIARUC='+QuotedStr(xCiaRUC)
               + '    and RETSERIE='+quotedstr(xSerie);
            cdsQry.Close;
            cdsQry.Datarequest( xSQL );
            cdsQry.Open;
            if cdsQry.FieldByName('NUMERO').AsString='' then
               xNumero:='0000000001'
            else
               xNumero:=DMTE.StrZero( IntToStr( StrToInt(cdsQry.FieldByName('NUMERO').AsString) +1 ), 10 );
            xContador := 1;
            xSuma := cdsConsulta.FieldByName('MONTORET').AsFloat;
         End;
         cdsRetencion.Insert;
         cdsRetencion.FieldByname('CIAID').AsString     :=  cdsEgrCaja.FieldByName('CIAID').AsString;
         cdsRetencion.FieldByname('CIARUC').AsString    :=  xCiaRUC;
         cdsRetencion.FieldByname('ANOMM').AsString     :=  cdsEgrCaja.FieldByName('ECANOMM').AsString;
         cdsRetencion.FieldByname('TDIARID').AsString   :=  cdsEgrCaja.FieldByName('TDIARID').AsString;
         cdsRetencion.FieldByname('ECNOCOMP').AsString  :=  cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
         cdsRetencion.FieldByname('RETSERIE').AsString  :=  xSerie;
         cdsRetencion.FieldByname('RETNUMERO').AsString :=  xNumero;
         cdsRetencion.FieldByname('FECPAGO').AsDateTime :=  cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
         cdsRetencion.FieldByname('CLAUXID').AsString   :=  cdsConsulta.FieldByName('CLAUXID').AsString;
         cdsRetencion.FieldByname('AUXID').AsString     :=  cdsConsulta.FieldByName('PROV').AsString;
         cdsRetencion.FieldByname('AUXRUC').AsString    :=  cdsConsulta.FieldByName('PROVRUC').AsString;
         cdsRetencion.FieldByname('DOCID').AsString     :=  cdsConsulta.FieldByName('DOCID2').AsString;
         cdsRetencion.FieldByname('DOCDES').AsString    :=  cdsConsulta.FieldByName('CPANOMM').AsString;
         cdsRetencion.FieldByname('SERIE').AsString     :=  cdsConsulta.FieldByName('CPSERIE').AsString;
         cdsRetencion.FieldByname('NODOC').AsString     :=  cdsConsulta.FieldByName('CPNODOC').AsString;
         cdsRetencion.FieldByname('FECEMI').AsDateTime  :=  cdsConsulta.FieldByName('CPFEMIS').AsDateTime;
         cdsRetencion.FieldByname('TRANID').AsString    :=  '';
         cdsRetencion.FieldByname('TRANDES').AsString   :=  '';
         cdsRetencion.FieldByname('DH').AsString        :=  'H';

         if cdsConsulta.FieldByname('TMONID').AsString=DMTE.wTMonLoc then
            cdsRetencion.FieldByname('MTOORI').AsFloat  :=  cdsConsulta.FieldByName('MTOBASERET').AsFloat
         else
            if cdsConsulta.FieldByname('TMONID').AsString=DMTE.wTMonExt then
// Inicio HPC_201706_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
// Inicio HPC_201705_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
               cdsRetencion.FieldByname('MTOORI').AsFloat:=  DMTE.FROUND(cdsConsulta.FieldByName('MTOBASERET').AsFloat
                                                                           /cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);

         cdsRetencion.FieldByname('MTOLOC').AsFloat     :=  cdsConsulta.FieldByName('MTOBASERET').AsFloat;
         cdsRetencion.FieldByname('MTOEXT').AsFloat     :=  DMTE.FROUND(cdsConsulta.FieldByName('MTOBASERET').AsFloat
                                                                           /cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
         {cdsRetencion.FieldByname('MTOORI').AsFloat:= cdsConsulta.FieldByName('MTOBASERET').AsFloat;
         cdsRetencion.FieldByname('MTOLOC').AsFloat     :=  DMTE.FROUND(cdsConsulta.FieldByName('MTOBASERET').AsFloat
                                                                           *cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
         cdsRetencion.FieldByname('MTOEXT').AsFloat     := cdsConsulta.FieldByName('MTOBASERET').AsFloat;}
// Fin HPC_201705_CAJA
// Fin HPC_201706_CAJA

         cdsRetencion.FieldByname('TCAMB').AsFloat      :=  cdsConsulta.FieldByName('DETCDOC').AsFloat;

         if cdsConsulta.FieldByname('TMONID').AsString=DMTE.wTMonLoc then
            cdsRetencion.FieldByname('MTORETORI').AsFloat  := cdsConsulta.FieldByName('MONTORET').AsFloat
         else
// Inicio HPC_201706_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
// Inicio HPC_201705_CAJA  Ajustes en la generación de asientos contables por pago de detracciones
            cdsRetencion.FieldByname('MTORETORI').AsFloat  := DMTE.FRound(cdsConsulta.FieldByName('MONTORET').AsFloat
                                                                 /cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
         cdsRetencion.FieldByname('MTORETLOC').AsFloat  := cdsConsulta.FieldByName('MONTORET').AsFloat;
         cdsRetencion.FieldByname('MTORETEXT').AsFloat  := DMTE.FRound(cdsConsulta.FieldByName('MONTORET').AsFloat
                                                                 /cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);

         {cdsRetencion.FieldByname('MTORETORI').AsFloat  := cdsConsulta.FieldByName('MONTORET').AsFloat;

         cdsRetencion.FieldByname('MTORETLOC').AsFloat  := DMTE.FRound(cdsConsulta.FieldByName('MONTORET').AsFloat
                                                                 *cdsConsulta.FieldByName('DETCDOC').AsFloat,15,2);
         cdsRetencion.FieldByname('MTORETEXT').AsFloat  := cdsConsulta.FieldByName('MONTORET').AsFloat;}
// Fin HPC_201705_CAJA
// Fin HPC_201706_CAJA
         cdsRetencion.FieldByname('TMONIDFAC').AsString :=  cdsConsulta.FieldByname('TMONID').AsString;
         cdsRetencion.FieldByname('USUARIO').AsString := wUsuario;
         cdsRetencion.FieldByname('FREG').Value       := DateS;
         cdsRetencion.FieldByname('HREG').Value       := Time;
         cdsRetencion.Post;

         xSQL := 'Insert into CNT320(CIAID, CIARUC, ANOMM, TDIARID, ECNOCOMP, RETSERIE, '
            + '                      RETNUMERO, FECPAGO, CLAUXID, AUXID, AUXRUC, DOCID, DOCDES, '
            + '                      SERIE, NODOC, FECEMI, TRANID, TRANDES, DH, MTOORI, MTOLOC, '
            + '                      MTOEXT, TCAMB, MTORETORI, MTORETLOC, MTORETEXT, TMONIDFAC, '
            + '                      USUARIO, FREG, HREG, TASARET, NUMREGRET) '
            + '   Values('
            +            quotedstr(cdsRetencion.FieldByname('CIAID').AsString)+', '
            +            quotedstr(cdsRetencion.FieldByname('CIARUC').AsString)+', '
            +            quotedstr(cdsRetencion.FieldByname('ANOMM').AsString)+', '
            +            quotedstr(cdsRetencion.FieldByname('TDIARID').AsString)+', '
            +            quotedstr(cdsRetencion.FieldByname('ECNOCOMP').AsString)+', '
            +            quotedstr(cdsRetencion.FieldByname('RETSERIE').AsString)+', '
            +            quotedstr(cdsRetencion.FieldByname('RETNUMERO').AsString)+', '
            +            quotedstr(datetostr(cdsRetencion.FieldByname('FECPAGO').AsDateTime))+','
            +            quotedstr(cdsRetencion.FieldByname('CLAUXID').AsString)+', '
            +            quotedstr(cdsRetencion.FieldByname('AUXID').AsString)+', '
            +            quotedstr(cdsRetencion.FieldByname('AUXRUC').AsString)+', '
            +            quotedstr(cdsRetencion.FieldByname('DOCID').AsString)+', '
            +            quotedstr(cdsRetencion.FieldByname('DOCDES').AsString)+', '
            +            quotedstr(cdsRetencion.FieldByname('SERIE').AsString)+', '
            +            quotedstr(cdsRetencion.FieldByname('NODOC').AsString)+', '
            +            quotedstr(datetostr(cdsRetencion.FieldByname('FECEMI').AsDateTime))+', '
            +            quotedstr(cdsRetencion.FieldByname('TRANID').AsString)+', '
            +            quotedstr(cdsRetencion.FieldByname('TRANDES').AsString)+', '
            +            quotedstr(cdsRetencion.FieldByname('DH').AsString)+', '
            +            floattostr(cdsRetencion.FieldByname('MTOORI').AsFloat)+', '
            +            floattostr(cdsRetencion.FieldByname('MTOLOC').AsFloat)+', '
            +            floattostr(cdsRetencion.FieldByname('MTOEXT').AsFloat)+', '
            +            floattostr(cdsRetencion.FieldByname('TCAMB').AsFloat)+', '
            +            floattostr(cdsRetencion.FieldByname('MTORETORI').AsFloat)+', '
            +            floattostr(cdsRetencion.FieldByname('MTORETLOC').AsFloat)+', '
            +            floattostr(cdsRetencion.FieldByname('MTORETEXT').AsFloat)+', '
            +            quotedstr(cdsRetencion.FieldByname('TMONIDFAC').AsString)+', '
            +            quotedstr(cdsRetencion.FieldByname('USUARIO').AsString)+', '
            +            'trunc(sysdate), '
            +            'sysdate, '
            +            floatToStr(xTasaRet) + ', '
            +            'trim(to_char(' + inttostr(xContador) + ',' + quotedstr('000') + ')))';

         try
            DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            ShowMessage('No se pudo actualizar la Retención de IGV');
            xSigueGrab := False;
            exit;
         end;

         xSQL:='Update CNT320 '
            + '    set RETTOTDES='+quotedstr(strnum(xSuma)+' '+xTMonDes)
            + '  where RETSERIE = '+quotedstr(xSerie)
            + '    and RETNUMERO='+quotedstr(xNumero);
         try
            DCOM1.AppServer.EjecutaSQL(xSQL);
         except
            ShowMessage('No se pudo actualizar el importe en letras en la Retención de IGV');
            xSigueGrab := False;
            exit;
         end;
      end;
      cdsConsulta.Next;
   end;

// Inicio HPC_201605_CAJA
   Try
      xSQL := ' Begin '
         +    '    DB2ADMIN.SP_TXT_CNT320_RETIGV2('+quotedstr(xSerie) +','
         +         quotedstr(xNumero)+','
         +         QuotedStr(DMTE.wUsuario) + ','
         +         QuotedStr('ACEPTADO')     + ','
         +         QuotedStr(wIP_Impresora)  + '); '
         +    ' End;';
      DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
      xSigueGrab := False;
      ShowMessage('No se pudo generar el archivo');
      Exit;
   end;
   wsSerieRetIGV := xSerie;
   wsNumRetIGV := xNumero;


// Resolviendo ID de Envio
   xsClave :=  '02' + xSerie + xNumero;

// Resolviendo último número de Envio
   xSQL := 'Select max(NUMENVRET) NUMENVRET '
      + '     from db2admin.CAJA_CERT_RETIGV '
      + '    where CODRETIGV = '+QuotedStr(xsClave);
   DMTE.cdsQry4.Close;
   DMTE.cdsQry4.DataRequest(xSQL);
   DMTE.cdsQry4.Open;

// Resolviendo Tipo de Documento Sunat
   xSQL := 'Select TDOC_SUNAT '
      + '  From db2admin.TGE110 '
      + '  Where DOCID = ' +QuotedStr(DMTE.cdsRetencion.FieldByName('DOCID').AsString);
   DMTE.cdsQry6.Close;
   DMTE.cdsQry6.DataRequest(xSQL);
   DMTE.cdsQry6.Open;

   xTDocSunat := DMTE.cdsQry6.FieldByName('TDOC_SUNAT').AsString;

// Resolviendo Carpeta para Archivo
   xSQL := 'Select RUTADES '
      + '  From db2admin.TGE837 '
      + '  Where APLIC = ' +QuotedStr('RET')
      + '   And RUTAID = ' +QuotedStr(wId_Rutadest);
   DMTE.cdsQry6.Close;
   DMTE.cdsQry6.DataRequest(xSQL);
   DMTE.cdsQry6.Open;

   xCarpeta := DMTE.cdsQry6.FieldByName('RUTADES').AsString;

// Seleccionando Registros para escribir en Txt
   xSQL := 'Select NUMDETLIN, DESDETLIN '
      +    '  from db2admin.CAJA_CERT_RETIGV '
      +    '  where CODRETIGV  = ' +QuotedStr(xsClave)
      +    '    and NUMENVRET  = ' +inttostr(DMTE.cdsQry4.FieldByName('NUMENVRET').AsInteger);
//      +    '     and ESTADOFAC = ' +QuotedStr('ACEPTADO');
   DMTE.cdsQry7.Close;
   DMTE.cdsQry7.DataRequest(xSQL);
   DMTE.cdsQry7.Open;
   DMTE.cdsQry7.IndexFieldNames := 'NUMDETLIN';

//
   xsNombreTxt := xCarpeta+'RE_'+xTDocSunat+'_'+xserie+'_'+xNumero+'.txt';
   //Inicio HPC_201702_CAJA  Se agrego control de transacciones al generar archivo
   try
      AssignFile(xfArchivoTexto, xsNombreTxt);
      Rewrite(xfArchivoTexto);

      DMTE.cdsQry7.First;
      while not DMTE.cdsQry7.EOF do
      Begin
         WriteLn(xfArchivoTexto, DMTE.cdsQry7.FieldByName('DESDETLIN').AsString);
         DMTE.cdsQry7.Next;
      End;
      CloseFile(xfArchivoTexto);
   except
      on E: Exception do
      Begin
         ShowMessage('Error al generar el archivo: ' + xsNombreTxt + #13 + E.Message);
         xSigueGrab := False;
         exit;
      End;
   end;
   //Fin HPC_201702_CAJA

   cdsConsulta.IndexFieldNames := '';
end;
//Final HPC_201306_CAJA

end.


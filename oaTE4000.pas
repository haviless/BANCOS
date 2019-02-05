unit oaTE4000;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : oaTE4000
// FORMULARIO               : FConsulta
// FECHA DE CREACION        :
// AUTOR                    : EQUIPO DE SISTEMAS
// OBJETIVO                 : Formulario inicial que contiene las funcionalidades
//                            de la opción de Procesos en el menú

// ACTUALIZACIONES:
//HPC_201207_CAJA 21/09/2012:  Se implementó el control de versiones
//HPC_201304_CAJA 24/04/2013:  Cambio de Versión a 20130424180000
//HPC_201305_CAJA 06/05/2013:  Cambio de Versión a 20130506180000
//HPC_201306_CAJA 07/06/2013:  Cambio de Versión a 20130720083000
//HPC_201308_CAJA 14/08/2013:  Cambio de Versión a 20130821083000
//HPC_201401_CAJA 27/05/2013:  Cambio de Versión a 20140625083000
// HPC_201403_CAJA cambia control de diseño de reporte
// HPC_201601_CAJA cambios en reporte de Comprobante de Retención
// HPC_201603_CAJA 16/11/2016  Reimpresión de Certificados de Retención IGV Electrónicos
//                 27/12/2016:  Cambio de Versión a 20161228083000
// CAJA_201804     09/11/2018:  Cambio de Control de Versión a CAJA-201804, cambio solo en el DFM

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mant, db, ExtCtrls, oaVariables, StdCtrls, ShellAPI;

type
  TFConsulta = class(TForm)
    lblVersion: TLabel;
  private
    { Private declarations }
    xFiltroActivate : TNotifyEvent  ;
    xBtnClick       : TNotifyEvent  ;
    procedure PegaPanelToolLibBanco(Sender: TObject);
    procedure PegaPanelToolSalBanco(Sender: TObject);
    procedure ToolCheDif(Sender: TObject);
    procedure PegaPanelToolMovCaja(Sender: TObject);
    procedure PegaPanelTool(Sender: TObject);
    procedure PegaPanelToolDetReg (Sender: TObject);
    procedure PegaPanelToolPagoProv(Sender: TObject);
    procedure EditaSalBanco(Sender: TObject; MantFields: TFields);
		procedure evt_Delete(Sender: TObject; MantFields: TFields);
    procedure WMCGridShow( Sender: TObject );
    procedure WMCActivate( Sender: TObject );
    procedure WMCBtnClick( Sender: TObject );
		procedure evt_EditacabRetencion(Sender: TObject; MantFields: TFields);
  public
    { Public declarations }
    xFiltroRep    : TMant;
    xFiltroRep1   : TMant;
    xFiltroDetRep : TMant;
    xFiltroCHQ    : TMant;
    xFiltroPProv  : TMant;
    xFiltro       : TMant;
    xMant         : TMant;
    xfiltroCabRegRet  : TMant;
    xfiltroMovLibCaja : TMant;

  end;

  procedure TELibroBancosGenerico; stdcall;
  procedure TELibroBancosIndividual; stdcall;
  procedure TESaldoBancos; stdcall;
  procedure TESaldoTelefonico; stdcall;
  procedure TEChequesDiferidos; stdcall;
  procedure TEMovimientosCaja; stdcall;
  procedure TESaldosCaja; stdcall;
  procedure TEResumenConcepto; stdcall;
  procedure TERetenciones; stdcall;
  procedure TEPagosProveedor; stdcall;
  procedure TEConsultaIngresos; stdcall;
  procedure TEConsultaCheques; stdcall;

   procedure TEVerificaVersion; stdcall;


exports
  TELibroBancosGenerico,
  TELibroBancosIndividual,
  TESaldoBancos,
  TESaldoTelefonico,
  TEChequesDiferidos,
  TEMovimientosCaja,
  TESaldosCaja,
  TEResumenConcepto,
  TERetenciones,
  TEPagosProveedor,
  TEConsultaIngresos,

  TEVerificaVersion,

  TEConsultaCheques;

var
  FConsulta: TFConsulta;

implementation

{$R *.dfm}

USES CAJADM, CAJA706, CAJA707, CAJA220, CAJA217, CAJA248, CAJA703, CAJATM,
     CAJAUTIL, CAJA236, CAJA701, CAJA708, CAJA714, CAJA716;

// CAJA706  FToolLibBanco             Tools Libro Bancos Generico
// CAJA707  FToolSalBanco             Tools Libro Bancos Individual
// CAJA220  FCajaBanco                Saldo de Bancos
// CAJA217  FSaldoTelefonico          Saldo Telefonico
// CAJA248  FToolCheDif               Tools Cheques Diferidos
// CAJA703  FToolMovCaja              Tools Movimientos de Caja
// CAJATM   FTool1                    Tools Saldos de Caja
// CAJA236  FResumenCpto              Resumen por Concepto
// CAJA701  FToolRegRet               Tools de retenciones
// CAJA708  FToolPagoProv             Tools de Pago a Proveedores
// CAJA714  FConsultaIngresos         Consulta de ingresos a caja
// CAJA716  FConsCheques              Consulta de Cheques



procedure TEConsultaCheques;
var
   xSQL : string;
   a,m,d:word;
begin
  if DMTE=nil then exit;
  if not DMTE.DCOM1.Connected then Exit;

  try
    DMTE.cdsCia.Open;
    DMTE.FiltraTabla( DMTE.cdsCCBco,'TGE106', 'CCBCOID'  );

    FConsCheques  := TFConsCheques.Create( Application );
    FConsCheques.ShowModal;
  finally
    FConsCheques.Free;
  end;
end;


procedure TEConsultaIngresos;
var
   xSQL : string;
   a,m,d:word;
begin
  if DMTE=nil then exit;
  if not DMTE.DCOM1.Connected then Exit;

  try
    DMTE.cdsCia.Open;

    FConsultaIngresos  := TFConsultaIngresos.Create( Application );
    FConsultaIngresos.ShowModal;
  finally
    FConsultaIngresos.Free;
  end;
end;


procedure TELibroBancosGenerico;
var
   xSQL : string;
begin
  if DMTE=nil then exit;
  if not DMTE.DCOM1.Connected then Exit;
  if not DMTE.VerificaAccesoOpcion( FVariables.w_Var_sObjetoNombr ) then Exit;
  try
    FConsulta:=TFConsulta.Create( Application );

    xSQL:='SELECT * FROM TGE813';
    DMTE.cdsRec.Close;
    DMTE.cdsRec.DataRequest(xSQL);
    DMTE.cdsRec.Open;

    DMTE.cdsSQL.IndexFieldNames :='';
    DMTE.cdsSQL.Filter   :='';
    DMTE.cdsSQL.Filtered := False;
    DMTE.cdsSQL.Close;

    xsql := 'SELECT * FROM TGE105 WHERE BCOTIPCTA='+quotedstr('B') + ' ORDER BY BANCOID';
    DMTE.cdsBanco.close;
    DMTE.cdsBanco.DataRequest(xsql);
    DMTE.cdsBanco.Open;
    DMTE.cdsCCBco.Open;

    DMTE.cdsSaldoTlfnGrab.Open;
    DMTE.cdsResponsable.Open;
    DMTE.cdsCia.Open;

    xSQL:=' SELECT ECNOCOMP,ECFCOMP,'' '' FPAGODES, '+
          ' ECNOCHQ,ECGIRA,ECMTOORI INGRESO, ECMTOORI EGRESO,ECMTOORI SALDO, '+
          ' ''           '' CIADES,''     '' BANCONOM,''    '' CCBCODES,''     '' TMONDES, '+
          ' ''    '' TMONABR,EC_IE,ECMTOORI,BANCOID, CCBCOID'+
          ' FROM CAJA302'+
          ' WHERE CIAID=''XYZ'' ';

    FToolLibBanco:=TFToolLibBanco.Create( Application );
    FToolLibBanco.dbePeriodo.LookupTable:=DMTE.cdsRec;
    FToolLibBanco.dbePeriodo.LookupField:='ANOMES';

    FConsulta.xFiltroRep                := TMant.Create( Application );
    FConsulta.xFiltroRep.Admin          := DMTE.wAdmin;
    FConsulta.xFiltroRep.DComC          := DMTE.DCOM1;
    FConsulta.xFiltroRep.OnEdit         := Nil;
    FConsulta.xFiltroRep.UsuarioSQL.Add(xSQL) ;
    FConsulta.xFiltroRep.Module         := DMTE.wModulo;
    FConsulta.xFiltroRep.ClientDataSet  := DMTE.cdsQry;
    FConsulta.xFiltroRep.OnCreateMant   := FConsulta.PegaPanelToolLibBanco;
    FConsulta.xFiltroRep.TableName      := 'VWCAJALIBBANCO';
    FConsulta.xFiltroRep.Titulo         := 'Libro Bancos';
    FConsulta.xFiltroRep.User           := DMTE.wUsuario;
    FConsulta.xFiltroRep.SectionName    :='CAJALIBBANCO';
    FConsulta.xFiltroRep.FileNameIni    :='\SOLCAJA.INI';
    FConsulta.xFiltroRep.Execute;
  finally

  end;
end;


procedure TELibroBancosIndividual;
var
   xSQL:string;
begin
   if DMTE=nil then exit;
  if not DMTE.DCOM1.Connected then Exit;
  try
    xSQL:='SELECT * FROM TGE813';
    DMTE.cdsRec.Close;
    DMTE.cdsRec.DataRequest(xSQL);
    DMTE.cdsRec.Open;

    DMTE.cdsSQL.IndexFieldNames :='';
    DMTE.cdsSQL.Filter   :='';
    DMTE.cdsSQL.Filtered := False;
    DMTE.cdsSQL.Close;

    FCajaBancos:=TFCajaBancos.Create( Application );
    FCajaBancos.ActiveMDIChild;

  Finally

  End;

end;


procedure TESaldoBancos;
var
   xSQL : string;
begin
   if DMTE=nil then exit;
  if not DMTE.DCOM1.Connected then Exit;
  try
    FConsulta:=TFConsulta.Create( Application );

    xSQL:='Select * from TGE813';
    DMTE.cdsRec.IndexFieldNames := '';
    DMTE.cdsRec.Filter := '';
    DMTE.cdsRec.Filtered := False;
    DMTE.cdsRec.Close;
    DMTE.cdsRec.DataRequest(xSQL);
    DMTE.cdsRec.Open;

    DMTE.cdsSQL.IndexFieldNames :='';
    DMTE.cdsSQL.Filter   :='';
    DMTE.cdsSQL.Filtered := False;
    DMTE.cdsSQL.Close;

    xSQL := 'Select * from TGE105 where BCOTIPCTA='+quotedstr('B') + ' order by BANCOID';
    DMTE.cdsBanco.IndexFieldNames := '';
    DMTE.cdsBanco.Filter := '';
    DMTE.cdsBanco.Filtered := False;
    DMTE.cdsBanco.close;
    DMTE.cdsBanco.DataRequest(xSQL);
    DMTE.cdsBanco.Open;

    xSQL := 'Select * from TGE106 ';
    DMTE.cdsCCBco.IndexFieldNames := '';
    DMTE.cdsCCBco.Filter := '';
    DMTE.cdsCCBco.Filtered := False;
    DMTE.cdsCCBco.close;
    DMTE.cdsCCBco.DataRequest(xSQL);
    DMTE.cdsCCBco.Open;

    xSQL := 'select * from CAJA310';
    DMTE.cdsSaldoTlfnGrab.IndexFieldNames := '';
    DMTE.cdsSaldoTlfnGrab.Filter := '';
    DMTE.cdsSaldoTlfnGrab.Filtered := False;
    DMTE.cdsSaldoTlfnGrab.close;
    DMTE.cdsSaldoTlfnGrab.DataRequest(xSQL);
    DMTE.cdsSaldoTlfnGrab.Open;

    xSQL := 'select * from TGE161';
    DMTE.cdsResponsable.IndexFieldNames := '';
    DMTE.cdsResponsable.Filter := '';
    DMTE.cdsResponsable.Filtered := False;
    DMTE.cdsResponsable.close;
    DMTE.cdsResponsable.DataRequest(xSQL);
    DMTE.cdsResponsable.Open;

    xSQL := 'select * from TGE101';
    DMTE.cdsCia.IndexFieldNames := '';
    DMTE.cdsCia.Filter := '';
    DMTE.cdsCia.Filtered := False;
    DMTE.cdsCia.close;
    DMTE.cdsCia.DataRequest(xSQL);
    DMTE.cdsCia.Open;

    if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
       xSQL  := ' SELECT A.CIAID,A.SBBANCO,D.BANCONOM,A.SBANO,A.CTACTE,D.TMONID,0.00 SALDO '+
                ' FROM CAJA401 A '+
                ' LEFT JOIN (SELECT B.CIAID,B.BANCOID,C.BANCONOM,B.CCBCOID,B.TMONID '+
                ' FROM TGE106 B LEFT JOIN TGE105 C ON (B.BANCOID=C.BANCOID)) D ON '+
                ' (D.CIAID=A.CIAID AND D.BANCOID=A.SBBANCO AND D.CCBCOID=A.CTACTE) '+
                ' WHERE A.CIAID=''XY'' '
    else
      if (DMTE.SRV_D = 'ORACLE') then
         xSQL  := '  SELECT A.CIAID,A.SBBANCO,D.BANCONOM,A.SBANO,A.CTACTE, '+
                  '  D.TMONID,0.00 SALDO '+
                  '  FROM CAJA401 A ,(SELECT B.CIAID,B.BANCOID,C.BANCONOM,B.CCBCOID, B.TMONID '+
                                    ' FROM TGE106 B ,TGE105 C  WHERE B.BANCOID=C.BANCOID(+) ) D '+
                  '  WHERE A.CIAID=''XY'' '+
                  '  AND  (D.CIAID=A.CIAID(+) AND D.BANCOID=A.SBBANCO(+) AND D.CCBCOID=A.CTACTE(+))';

    FToolSalBanco:=TFToolSalBanco.Create( Application );
    FToolSalBanco.dbePeriodo.LookupTable:=DMTE.cdsRec;
    FToolSalBanco.dbePeriodo.LookupField:='ANOMES';

    FConsulta.xFiltroRep1                := TMant.Create( Application );
    FConsulta.xFiltroRep1.Admin          := DMTE.wAdmin;
    FConsulta.xFiltroRep1.DComC          := DMTE.DCOM1;
    FConsulta.xFiltroRep1.OnEdit         := FConsulta.EditaSalBanco;
    FConsulta.xFiltroRep1.UsuarioSQL.Add(xSQL) ;
    FConsulta.xFiltroRep1.Module         := DMTE.wModulo;
    FConsulta.xFiltroRep1.ClientDataSet  := DMTE.cdsQry;
    FConsulta.xFiltroRep1.OnCreateMant   := FConsulta.PegaPanelToolSalBanco;
    FConsulta.xFiltroRep1.TableName      := 'VWCAJASALBANCO';
    FConsulta.xFiltroRep1.Titulo         := 'Saldo de Bancos';
    FConsulta.xFiltroRep1.User           := DMTE.wUsuario;
    FConsulta.xFiltroRep1.SectionName    :='CAJASALBANCO';
    FConsulta.xFiltroRep1.FileNameIni    :='\SOLCAJA.INI';
    FConsulta.xFiltroRep1.Execute;
  finally

   end;
end;


procedure TESaldoTelefonico;
begin
   if DMTE=nil then exit;
  if not DMTE.DCOM1.Connected then Exit;
  try
    FSaldoTelefonico:=TFSaldoTelefonico.Create( Application );
    FSaldoTelefonico.ActiveMDIChild;

  Finally
  End;
end;



procedure TEChequesDiferidos;
var
   sFpago,xSQL : string;
begin
   if DMTE=nil then exit;
  if not DMTE.DCOM1.Connected then Exit;
  try
    FConsulta:=TFConsulta.Create( Application );

    xSQL := '(FCEGR=''1'' or FCEGR=''S'') and (FCHQ=''1'' or FCHQ=''S'')';
    sFPago:=DMTE.DisplayDescrip('prvTGE','TGE112','FPAGOID',xSQL,'FPAGOID');

    if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
	   xSQL:='Select '
        +'CAJA314.CIAID, CAJA314.TDIARID, CAJA314.ECNOCOMP, CAJA314.ECANOMM, CAJA314.FPAGOID, CAJA314.BANCOID,'
        +'CAJA314.TJAID, CAJA314.TMONID, CAJA314.FC_RECIBIDO, CAJA314.FC_COBRADO, CAJA314.FC_DEVOLVER,'
        +'CAJA314.TC_USADO, CAJA314.FCTCAMB, CAJA314.ECNOCHQ, CAJA314.CORRE, CAJA314.CCTREC, CAJA314.DOCID,'
        +'CAJA314.CCSERIE, CAJA314.CCNODOC, CAJA314.FC_MTOLOC, CAJA314.FC_MTOEXT, CAJA314.FC_FCANC,'
        +'CAJA314.FC_ESTADO, CAJA314.CPTOID, CAJA314.CLAUXID, CAJA314.CLIEID, CAJA314.FCTRANSF, CAJA314.LICOID,'
        +'CAJA314.CCBCOID, CAJA314.FC_FVCMTO, CAJA314.FC_FCOBC FC_FEMIS, CAJA314.FPAGODES, CAJA314.TMONABR, CAJA314.CAJAID,'
        +'CAJA314.CHQ_ESTADO, CAJA314.MOTDEVCHQ, TGE204.CLIEDES, TGE204.CLIERUC, CXC318.CCFEMIS LICOFEMIS '
        +'from CAJA314 '
        +'left outer join TGE204 on TGE204.CLAUXID=CAJA314.CLAUXID and TGE204.CLIEID=CAJA314.CLIEID '
        +'left outer join CXC318 on CXC318.CIAID=CAJA314.CIAID and CXC318.LICOID=CAJA314.LICOID '
        +'where FPAGOID='+QuotedSTr(sFPago)+' and FC_FVCMTO>FC_FCOBC AND (MOTDEVCHQ IS NULL OR MOTDEVCHQ='''')'
		    +' and ( coalesce(CAJA314.FCTRANSF,''N'')<>''S'' ) ';
    if (DMTE.SRV_D = 'ORACLE') then
  	  xSQL:='Select '
        +'CAJA314.CIAID, CAJA314.TDIARID, CAJA314.ECNOCOMP, CAJA314.ECANOMM, CAJA314.FPAGOID, CAJA314.BANCOID,'
        +'CAJA314.TJAID, CAJA314.TMONID, CAJA314.FC_RECIBIDO, CAJA314.FC_COBRADO, CAJA314.FC_DEVOLVER,'
        +'CAJA314.TC_USADO, CAJA314.FCTCAMB, CAJA314.ECNOCHQ, CAJA314.CORRE, CAJA314.CCTREC, CAJA314.DOCID,'
        +'CAJA314.CCSERIE, CAJA314.CCNODOC, CAJA314.FC_MTOLOC, CAJA314.FC_MTOEXT, CAJA314.FC_FCANC,'
        +'CAJA314.FC_ESTADO, CAJA314.CPTOID, CAJA314.CLAUXID, CAJA314.CLIEID, CAJA314.FCTRANSF, CAJA314.LICOID,'
        +'CAJA314.CCBCOID, CAJA314.FC_FVCMTO, CAJA314.FC_FCOBC FC_FEMIS, CAJA314.FPAGODES, CAJA314.TMONABR, CAJA314.CAJAID,'
        +'CAJA314.CHQ_ESTADO, CAJA314.MOTDEVCHQ, TGE204.CLIEDES, TGE204.CLIERUC, CXC318.CCFEMIS LICOFEMIS '
        +'from CAJA314, TGE204, CXC318 '
        +'where FPAGOID='+QuotedSTr(sFPago)+' and FC_FVCMTO>FC_FCOBC AND (MOTDEVCHQ IS NULL OR MOTDEVCHQ='''')'
		    +' and ( NVL(CAJA314.FCTRANSF,''N'')<>''S'' ) '
        +' and TGE204.CLAUXID(+)=CAJA314.CLAUXID and TGE204.CLIEID(+)=CAJA314.CLIEID '
        +' and CXC318.CIAID(+)=CAJA314.CIAID and CXC318.LICOID(+)=CAJA314.LICOID ';

  	FToolCheDif:= TFToolCheDif.Create( Application );
  	FConsulta.xFiltroCHQ:=TMant.create( Application );
		FConsulta.xFiltroCHQ.Admin        := DMTE.wAdmin;
		FConsulta.xFiltroCHQ.Titulo       := 'Cheques Diferidos';
		FConsulta.xFiltroCHQ.Tablename    := 'VWCAJACHQCCDIF';
		FConsulta.xFiltroCHQ.ClientDataSet:= DMTE.cdsEgrCajaX;
		FConsulta.xFiltroCHQ.OnShow       := NIL;
		FConsulta.xFiltroCHQ.OnInsert     := NIL;
		FConsulta.xFiltroCHQ.OnEdit       := NIL;
		FConsulta.xFiltroCHQ.OnDelete     := NIL;
		FConsulta.xFiltroCHQ.Multiselect  := False;
		FConsulta.xFiltroCHQ.OnShow       := NIL;
		FConsulta.xFiltroCHQ.DComC        := DMTE.DCOM1 ;
		FConsulta.xFiltroCHQ.Module       := 'CAJA' ;
		FConsulta.xFiltroCHQ.SectionName  := 'CHEQUESDIFERIDOS';
		FConsulta.xFiltroCHQ.FileNameIni  := '\SOLCAJA.INI';
		FConsulta.xFiltroCHQ.User         := DMTE.wUsuario ;
		FConsulta.xFiltroCHQ.OnCreateMant := FConsulta.ToolCheDif;
    FConsulta.xFiltroCHQ.UsuarioSQL.Add( xSQL );
		FConsulta.xFiltroCHQ.Execute ;
  Finally

	end;
end;


procedure TEMovimientosCaja;
var
   xSQL, xSQL1, xSQL2, xSQL3 : String;
begin
   if DMTE=nil then exit;
  if not DMTE.DCOM1.Connected then Exit;
  try
    DMTE.Filtracds(DMTE.cdsConsulta, 'SELECT * FROM TGE813 ORDER BY ANOMES');
    DMTE.Filtracds(DMTE.cdsBanco, 'SELECT * FROM TGE105 WHERE BCOTIPCTA=''C'' ORDER BY BANCOID');

    xSQL := 'Select * From TGE813';
    DMTE.Filtracds(DMTE.cdsQry4, 'Select * From TGE813 Order By ANOMES');

    FConsulta:=TFConsulta.Create( Application );
    FToolMovCaja   := TFToolMovCaja.Create( Application );

    if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
    begin
      xSQL1 := ' SELECT ECNOCOMP,PROV,INGRESOLOC,EGRESOLOC,INGRESOEXT,EGRESOEXT, '
         +' CCGLOSA,CCNOMB,FPAGOID,ECNOCHQ,PAGCHEQUMN,PAGCHEQUME, '
         +' PAGEFECTMN,PAGEFECTME,PAGNOTDMN,PAGNOTDME,FPAGODES,TCAMBIO,CLAUXID,CIAID, '
         +' CIADES,BANCONOM,TMONID,TMONDES,FECHA,CLAUXDES,DOCID,NODOC,CPTOID,CUENTAID, '
         +' CPTODES, TIPO ,BANCOID,TOTALLOC,TOTALEXT, HORA,SALDOMN, SALDOME, NORDEN, SALDOANTMN, '
         +' SALDOANTME,CTACPTO,0.00 DEBEMN,0.00 HABERMN,0.00 DEBEME,0.00 HABERME FROM   '
         +' (  SELECT MAX(A.ECNOCOMP) ECNOCOMP, A.CLIEID  PROV,  '
         +' CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN MAX(A.NCOMTOLOC) ELSE 0 END INGRESOLOC, '
         +' CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN 0.00 ELSE 0.00 END  EGRESOLOC , '
         +' CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN MAX(A.NCOMTOEXT) ELSE 0 END INGRESOEXT , '
         +' CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN 0.00 ELSE 0.00 END  EGRESOEXT , '
         +' MAX(A.CCGLOSA) CCGLOSA,MAX(A.CCNOMB) CCNOMB,MAX(B.FPAGOID) FPAGOID , MAX(B.ECNOCHQ) ECNOCHQ, '
         +' SUM( CASE WHEN (C.FCHQ=''S'') AND (B.TMONID='''+DMTE.wTMonLoc+''')  THEN B.FC_COBRADO   ELSE 0 END)  PAGCHEQUMN, '
         +' SUM(CASE WHEN  (C.FCHQ=''S'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO   ELSE 0 END) PAGCHEQUME, '
         +' SUM(CASE WHEN  (C.FEFE=''S'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO   ELSE 0 END)  PAGEFECTMN, '
         +' SUM(CASE WHEN  (C.FEFE=''S'') AND (B.TMONID='''+DMTE.wTMonExt+''')  THEN B.FC_COBRADO   ELSE 0 END) PAGEFECTME, '
         +' SUM(CASE WHEN  (C.FNDE=''S'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO   ELSE 0 END)  PAGNOTDMN, '
         +' SUM(CASE WHEN  (C.FNDE=''S'') AND (B.TMONID='''+DMTE.wTMonExt+''')  THEN B.FC_COBRADO   ELSE 0 END) PAGNOTDME, '
         +' MAX(B.FPAGODES) FPAGODES, '
         +' MAX(A.NCOTCAMB)   TCAMBIO, A.CLAUXID ,A.CIAID CIAID, MAX(E.CIADES) CIADES ,MAX(D.BANCONOM) BANCONOM,'
         +' A.TMONID, MAX(F.TMONDES) TMONDES, A.CCFEMIS FECHA , MAX(G.CLAUXDES) CLAUXDES,A.DOCID, '
         +' A.CCNODOC NODOC ,A.CPTOID,A.CUENTAID, MAX(H.CPTODES) CPTODES,''INGRESO'' TIPO,A.BANCOID, '
         +'(SUM( CASE WHEN (C.FCHQ=''S'') AND (B.TMONID='''+DMTE.wTMonLoc+''')  THEN B.FC_COBRADO   ELSE 0 END))'
         +' +(SUM(CASE WHEN  (C.FEFE=''S'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO   ELSE 0 END)) '
         +' +(SUM(CASE WHEN  (C.FNDE=''S'') AND (B.TMONID='''+DMTE.wTMonLoc+''') THEN B.FC_COBRADO   ELSE 0 END)) TOTALLOC,'
         +'(SUM(CASE WHEN  (C.FCHQ=''S'') AND (B.TMONID='''+DMTE.wTMonExt+''') THEN B.FC_COBRADO   ELSE 0 END)) '
         +'+ (SUM(CASE WHEN  (C.FEFE=''S'') AND (B.TMONID='''+DMTE.wTMonExt+''')  THEN B.FC_COBRADO   ELSE 0 END)) '
         +' +(SUM(CASE WHEN  (C.FNDE=''S'') AND (B.TMONID='''+DMTE.wTMonExt+''')  THEN B.FC_COBRADO   ELSE 0 END)) TOTALEXT, '
         +' MAX(A.NCOHREG) HORA,0.00  SALDOMN, 0.00 SALDOME,''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, MAX(H.CUENTAID) CTACPTO '
         +' FROM CXC303 A, CAJA314 B, TGE112 C, TGE105 D, TGE101 E, TGE103 F, '
         +' TGE102 G, CAJA201 H '
         +' Where A.NCOESTADO=''C'' AND B.CIAID=A.CIAID '
         +' AND B.DOCID=A.DOCID AND B.CCSERIE=A.CCSERIE '
         +' AND  B.CCNODOC=A.CCNODOC AND B.CLAUXID=A.CLAUXID AND B.CLIEID=A.CLIEID '
         +' AND C.FPAGOID=B.FPAGOID '
         +' AND A.BANCOID=D.BANCOID AND D.BCOTIPCTA=''C'' AND A.CIAID=E.CIAID  '
         +' AND A.CIAID=E.CIAID AND B.CIAID=E.CIAID AND A.TMONID=F.TMONID '
         +' AND A.CLAUXID=G.CLAUXID AND A.CPTOID=H.CPTOID  '
         +' GROUP BY A.CIAID,A.CLIEID, A.BANCOID, A.CPTOID, A.CUENTAID, A.DOCID, A.CCNODOC, '
         +' A.CCFEMIS, A.ECANOMM, A.TMONID, A.CLAUXID  ';

        xSQL2:=' UNION ALL '

        +' SELECT A.ECNOCOMP, A.PROV  PROV, '
        +' (CASE WHEN (A.EC_IE =''I'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END ) INGRESOLOC, '
        +' (CASE WHEN (A.EC_IE =''E'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END ) EGRESOLOC, '
        +' (CASE WHEN (A.EC_IE =''I'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END ) INGRESOEXT, '
        +' (CASE WHEN (A.EC_IE =''E'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END ) EGRESOEXT, '
        +''' '' AS CCGLOSA, H.PROVDES CCNOMB, A.FPAGOID, A.ECNOCHQ, '
        +' (CASE WHEN (B.FCHQ=''S'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGCHEQUMN, '
        +' (CASE WHEN (B.FCHQ=''S'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGCHEQUME, '
        +' (CASE WHEN (B.FEFE=''S'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGEFECTMN, '
        +' (CASE WHEN (B.FEFE=''S'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGEFECTME, '
        +' (CASE WHEN (B.FNDE=''S'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGNOTDMN, '
        +' (CASE WHEN (B.FNDE=''S'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGNOTDME, '
        +' B.FPAGODES, A.ECTCAMB  TCAMBIO,A.CLAUXID, A.CIAID CIAID , D.CIADES, C.BANCONOM,  '
        +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, F.CLAUXDES,'
        +' CASE WHEN A.EC_PROCE=''1'' THEN ''PPAGNOPROV'' ELSE ''PAG.PROV'' END DOCID, A.ECNOCOMP NODOC '
        +',A.CPTOID, A.CUENTAID, G.CPTODES, ''EGRESO'' TIPO , A.BANCOID , '
        +' ((CASE WHEN (B.FCHQ=''S'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END))'
        +'+((CASE WHEN (B.FEFE=''S'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END))'
        +'+((CASE WHEN (B.FNDE=''S'') AND A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END)) TOTALLOC, '
        +' ((CASE WHEN (B.FCHQ=''S'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT  ELSE 0 END)) '
        +' +((CASE WHEN (B.FEFE=''S'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END)) '
        +' +((CASE WHEN (B.FNDE=''S'') AND A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END)) TOTALEXT, '
        +' A.ECHREG HORA , 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
        +' FROM CAJA302 A, TGE112 B, TGE105 C, TGE101 D, TGE103 E, TGE102 F, CAJA201 G, TGE201 H '
        +' Where (CASE WHEN A.EC_IE =''E'' THEN A.ECMTOLOC ELSE 0 END )>0  '
        +' AND A.EC_PROCE IN (''B'',''1'') AND A.ECESTADO=''C'' AND A.FPAGOID=B.FPAGOID'
        +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID AND A.TMONID=E.TMONID '
        +' AND A.CLAUXID=F.CLAUXID AND A.CPTOID=G.CPTOID AND A.PROV=H.PROV';

        xSQL3:=' UNION ALL '

        +' SELECT A.ECNOCOMP, A.PROV  PROV, '
        +' 0.00   INGRESOLOC, '
        +' (CASE WHEN (A.EC_IE =''E'' AND A.TMONID='''+DMTE.wTMonLoc+''') THEN A.ECMTOLOC ELSE 0 END )  EGRESOLOC, '
        +' 0.00   INGRESOEXT, '
        +' (CASE WHEN (A.EC_IE =''E'' AND A.TMONID='''+DMTE.wTMonExt+''') THEN A.ECMTOEXT ELSE 0 END )  EGRESOEXT, '
        +''' ''  CCGLOSA,''TRANSFERENCIA''  CCNOMB, A.FPAGOID,A.ECNOCHQ, '
        +' 0.00   PAGCHEQUMN, '
        +' 0.00   PAGCHEQUME, '
        +' (CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGEFECTMN, '
        +' (CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGEFECTME, '
        +' 0.00   PAGNOTDMN, '
        +' 0.00   PAGNOTDME, '
        +' '' ''  FPAGODES, A.ECTCAMB  TCAMBIO,A.CLAUXID, A.CIAID CIAID , D.CIADES,C.BANCONOM, '
        +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA ,'' '' CLAUXDES,A.DOCID,A.ECNODOC NODOC '
        +',A.CPTOID,A.CUENTAID ,''TRANSFERENCIA'' CPTODES,''EGRESO'' TIPO ,A.BANCOID, '
        +' (CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) TOTALLOC,'
        +' (CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) TOTALEXT, '
        +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME, ''  '' CTACPTO'
        +' FROM CAJA302 A, TGE105 C, TGE101 D, TGE103 E '
        +' Where (CASE WHEN A.EC_IE =''E'' THEN A.ECMTOLOC ELSE 0 END )>0  '
        +' AND A.EC_PROCE IN (''4'') AND A.ECESTADO=''C'' '
        +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID '
        +' AND A.TMONID=E.TMONID '

        +' UNION ALL '

        +' SELECT A.ECNOCOMP, A.PROV  PROV, '
        +' (CASE WHEN (A.EC_IE =''I'' AND A.TMONID='''+DMTE.wTMonLoc+''') THEN A.ECMTOLOC ELSE 0 END ) INGRESOLOC, '
        +' 0.00  EGRESOLOC, '
        +' (CASE WHEN (A.EC_IE =''I'' AND A.TMONID='''+DMTE.wTMonExt+''') THEN A.ECMTOEXT ELSE 0 END ) INGRESOEXT, '
        +' 0.00  EGRESOEXT, '
        +''' ''  CCGLOSA,''TRANSFERENCIA'' AS CCNOMB, A.FPAGOID, A.ECNOCHQ, '
        +' 0.00   PAGCHEQUMN, '
        +' 0.00   PAGCHEQUME, '
        +' (CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) PAGEFECTMN, '
        +' (CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) PAGEFECTME, '
        +' 0.00 PAGNOTDMN, '
        +' 0.00 PAGNOTDME, '
        +' '' '' FPAGODES, A.ECTCAMB TCAMBIO, A.CLAUXID, A.CIAID CIAID, D.CIADES, C.BANCONOM, '
        +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, '' '' CLAUXDES, A.DOCID, A.ECNODOC NODOC '
        +',A.CPTOID, A.CUENTAID, ''TRANSFERENCIA'' CPTODES, ''INGRESO'' TIPO, A.BANCOID,   '
        +' (CASE WHEN A.TMONID='''+DMTE.wTMonLoc+''' THEN A.ECMTOLOC ELSE 0 END) TOTALLOC, '
        +' (CASE WHEN A.TMONID='''+DMTE.wTMonExt+''' THEN A.ECMTOEXT ELSE 0 END) TOTALEXT, '
        +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME, ''  '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME,''  '' CTACPTO '
        +' FROM CAJA302 A, TGE105 C, TGE101 D, TGE103 E '
        +' Where A.EC_PROCE IN (''7'') '
        +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID '
        +' AND A.TMONID=E.TMONID  ) SOLVISTA  ORDER BY PROV,FECHA, HORA ';
    end;

    if (DMTE.SRV_D = 'ORACLE') then
    begin
      xSQL1 := ' SELECT ECNOCOMP, PROV, INGRESOLOC, EGRESOLOC, INGRESOEXT, EGRESOEXT, '
         +' CCGLOSA, CCNOMB, FPAGOID, ECNOCHQ, PAGCHEQUMN, PAGCHEQUME, '
         +' PAGEFECTMN, PAGEFECTME, PAGNOTDMN, PAGNOTDME, FPAGODES, TCAMBIO, CLAUXID, CIAID, '
         +' CIADES, BANCONOM, TMONID, TMONDES, FECHA, CLAUXDES, DOCID, NODOC, CPTOID, CUENTAID, '
         +' CPTODES, TIPO, BANCOID, TOTALLOC, TOTALEXT, HORA, SALDOMN, SALDOME, NORDEN, SALDOANTMN, SALDOANTME, CTACPTO '
         +' ,0.00 DEBEMN,0.00 HABERMN,0.00 DEBEME,0.00 HABERME FROM   '
         +' (  SELECT MAX(A.ECNOCOMP) ECNOCOMP, A.CLIEID  PROV,  '
         +' DECODE( A.TMONID,'''+DMTE.wTMonLoc+''',MAX(A.NCOMTOLOC),  0)  INGRESOLOC, '
         +' DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', 0.00 , 0.00 )  EGRESOLOC , '
         +' DECODE( A.TMONID,'''+DMTE.wTMonExt+''', MAX(A.NCOMTOEXT), 0 ) INGRESOEXT , '
         +' DECODE( A.TMONID,'''+DMTE.wTMonExt+''',  0.00, 0.00 )  EGRESOEXT , '
         +' MAX(A.CCGLOSA) CCGLOSA,MAX(A.CCNOMB) CCNOMB,MAX(B.FPAGOID) FPAGOID , MAX(B.ECNOCHQ) ECNOCHQ, '
         +' SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) PAGCHEQUMN, '
         +' SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ) PAGCHEQUME, '
         +' SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) PAGEFECTMN, '
         +' SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ) PAGEFECTME, '
         +' SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) PAGNOTDMN, '
         +' SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) ) PAGNOTDME, '
         +' MAX(B.FPAGODES) FPAGODES, '
         +' MAX(A.NCOTCAMB) TCAMBIO, A.CLAUXID ,A.CIAID CIAID, MAX(E.CIADES) CIADES, MAX(D.BANCONOM) BANCONOM,'
         +' A.TMONID, MAX(F.TMONDES) TMONDES, A.CCFEMIS FECHA , MAX(G.CLAUXDES) CLAUXDES,A.DOCID, '
         +' A.CCNODOC NODOC, A.CPTOID, A.CUENTAID, MAX(H.CPTODES) CPTODES, ''INGRESO'' TIPO, A.BANCOID, '
         +'(SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ))'
         +' +(SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) )) '
         +' +(SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonLoc+''',B.FC_COBRADO,0)),0) ) ) TOTALLOC,'
         +'(SUM( DECODE(C.FCHQ,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) )) '
         +'+ (SUM( DECODE(C.FEFE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) )) '
         +' +(SUM( DECODE(C.FNDE,''S'',(DECODE(B.TMONID,'''+DMTE.wTMonExt+''',B.FC_COBRADO,0)),0) )) TOTALEXT, '
         +' MAX(A.NCOHREG) HORA,0.00  SALDOMN, 0.00 SALDOME,''   '' NORDEN , 0.00 SALDOANTMN , 0.00 SALDOANTME, MAX(H.CUENTAID) CTACPTO'
         +' FROM CXC303 A, CAJA314 B, TGE112 C, TGE105 D, TGE101 E, TGE103 F, '
         +' TGE102 G, CAJA201 H  '
         +' Where A.NCOESTADO=''C'' AND B.CIAID=A.CIAID '
         +' AND B.DOCID=A.DOCID AND B.CCSERIE=A.CCSERIE '
         +' AND  B.CCNODOC=A.CCNODOC  AND B.CLAUXID=A.CLAUXID AND B.CLIEID=A.CLIEID '
         +' AND C.FPAGOID=B.FPAGOID '
         +' AND A.BANCOID=D.BANCOID AND D.BCOTIPCTA=''C'' AND A.CIAID=E.CIAID  '
         +' AND A.CIAID=E.CIAID AND B.CIAID=E.CIAID  AND A.TMONID=F.TMONID '
         +' AND A.CLAUXID=G.CLAUXID AND A.CPTOID=H.CPTOID '
         +' And A.CIAID = '+QuotedStr('XX')
         +' GROUP BY A.CIAID, A.CLIEID, A.BANCOID, A.CPTOID, A.CUENTAID, A.DOCID, A.CCNODOC, '
         +' A.CCFEMIS, A.ECANOMM, A.TMONID, A.CLAUXID ';

        xSQL2 := ' UNION ALL '

        +' SELECT A.ECNOCOMP, A.PROV PROV, '
        +' ( DECODE(A.EC_IE,''I'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC,0)),0) ) INGRESOLOC, '
        +' ( DECODE(A.EC_IE,''E'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC,0)),0) ) EGRESOLOC, '
        +' ( DECODE(A.EC_IE,''I'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''',A.ECMTOEXT,0)),0) ) INGRESOEXT, '
        +' ( DECODE(A.EC_IE,''E'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''',A.ECMTOEXT,0)),0) ) EGRESOEXT, '
        +''' '' AS CCGLOSA,H.PROVDES  CCNOMB, A.FPAGOID,A.ECNOCHQ, '
        +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) PAGCHEQUMN, '
        +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) PAGCHEQUME, '
        +' ( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) PAGEFECTMN, '
        +' ( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) PAGEFECTME, '
        +' ( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) ) PAGNOTDMN, '
        +' ( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) PAGNOTDME, '
        +' B.FPAGODES, A.ECTCAMB  TCAMBIO,A.CLAUXID, A.CIAID CIAID, D.CIADES, C.BANCONOM,  '
        +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA, F.CLAUXDES,'
        +' DECODE(A.EC_PROCE,''1'', ''PPAGNOPROV'',''PAG.PROV'') DOCID, A.ECNOCOMP NODOC '
        +',A.CPTOID,A.CUENTAID,G.CPTODES ,''EGRESO'' TIPO , A.BANCOID , '
        +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) )'
        +'+( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) )'
        +'+(( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC,0)),0) )) TOTALLOC, '
        +' ( DECODE(B.FCHQ,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) '
        +' +( DECODE(B.FEFE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) '
        +' +( DECODE(B.FNDE,''S'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) TOTALEXT, '
        +' A.ECHREG HORA, 0.00 SALDOMN, 0.00 SALDOME,''   '' NORDEN, 0.00 SALDOANTMN, 0.00 SALDOANTME,''  '' CTACPTO'
        +' FROM CAJA302 A, TGE112 B, TGE105 C, TGE101 D, TGE103 E, TGE102 F, CAJA201 G, TGE201 H '
        +' Where (CASE WHEN A.EC_IE =''E'' THEN A.ECMTOLOC ELSE 0 END )>0  '
        +' AND A.EC_PROCE IN (''B'',''1'') AND A.ECESTADO=''C'' AND  A.FPAGOID=B.FPAGOID'
        +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID AND A.TMONID=E.TMONID '
        +' AND A.CLAUXID=F.CLAUXID AND A.CPTOID=G.CPTOID AND A.PROV=H.PROV'
        +' And A.CIAID = '+QuotedStr('XX');

        xSQL3 := ' UNION ALL '

        +' SELECT A.ECNOCOMP, A.PROV PROV, '
        +' 0.00   INGRESOLOC, '
        +' ( DECODE(A.EC_IE ,''E'',(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC,0)),0)  ) EGRESOLOC, '
        +' 0.00   INGRESOEXT, '
        +' ( DECODE(A.EC_IE ,''E'',(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) ) EGRESOEXT, '
        +''' ''  CCGLOSA,''TRANSFERENCIA''  CCNOMB, A.FPAGOID,A.ECNOCHQ, '
        +' 0.00   PAGCHEQUMN, '
        +' 0.00   PAGCHEQUME, '
        +' ( DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0) ) PAGEFECTMN, '
        +' ( DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0) ) PAGEFECTME, '
        +' 0.00   PAGNOTDMN, '
        +' 0.00   PAGNOTDME, '
        +' '' ''  FPAGODES, A.ECTCAMB  TCAMBIO,A.CLAUXID, A.CIAID CIAID , D.CIADES,C.BANCONOM, '
        +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA ,'' '' CLAUXDES,A.DOCID,A.ECNODOC NODOC '
        +',A.CPTOID,A.CUENTAID ,''TRANSFERENCIA'' CPTODES,''EGRESO'' TIPO ,A.BANCOID, '
        +' ( DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0 ) ) TOTALLOC,'
        +' ( DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0 ) ) TOTALEXT, '
        +' A.ECHREG HORA,0.00  SALDOMN,0.00 SALDOME,''   '' NORDEN , 0.00 SALDOANTMN ,0.00 SALDOANTME,''  '' CTACPTO'
        +' FROM CAJA302 A ,TGE105 C, TGE101 D, TGE103 E '

        +' WHERE '
        +'  A.EC_PROCE IN (''4'') AND A.ECESTADO=''C'' '
        +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID '
        +' AND A.TMONID=E.TMONID'
        +' And A.CIAID = '+QuotedStr('XX')

        +' UNION ALL '

        +' SELECT A.ECNOCOMP, A.PROV  PROV, '
        +' ( DECODE(A.EC_IE ,''I'' ,(DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC,0)),0)  )   INGRESOLOC, '
        +' 0.00  EGRESOLOC, '
        +' ( DECODE(A.EC_IE ,''I'' ,(DECODE(A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT,0)),0) )   INGRESOEXT, '
        +' 0.00  EGRESOEXT, '
        +''' ''  CCGLOSA,''TRANSFERENCIA'' AS CCNOMB, A.FPAGOID,A.ECNOCHQ, '
        +' 0.00   PAGCHEQUMN, '
        +' 0.00   PAGCHEQUME, '
        +' (DECODE(A.TMONID,'''+DMTE.wTMonLoc+''',A.ECMTOLOC,  0) ) PAGEFECTMN, '
        +' (DECODE(A.TMONID,'''+DMTE.wTMonExt+''',A.ECMTOEXT,  0) ) PAGEFECTME, '
        +' 0.00   PAGNOTDMN, '
        +' 0.00   PAGNOTDME, '
        +' '' ''  FPAGODES, A.ECTCAMB  TCAMBIO,A.CLAUXID, A.CIAID CIAID ,D.CIADES,C.BANCONOM,  '
        +' A.TMONID, E.TMONDES, A.ECFCOMP FECHA  ,'' '' CLAUXDES,A.DOCID,A.ECNODOC NODOC '
        +',A.CPTOID,A.CUENTAID, ''TRANSFERENCIA'' CPTODES,''INGRESO'' TIPO,A.BANCOID,   '
        +' (DECODE( A.TMONID,'''+DMTE.wTMonLoc+''', A.ECMTOLOC, 0 ) ) TOTALLOC, '
        +' (DECODE( A.TMONID,'''+DMTE.wTMonExt+''', A.ECMTOEXT, 0 ) ) TOTALEXT, '
        +' A.ECHREG HORA, 0.00  SALDOMN,0.00 SALDOME,''  '' NORDEN, 0.00 SALDOANTMN ,0.00 SALDOANTME,''  '' CTACPTO '
        +' FROM CAJA302 A ,TGE105 C, TGE101 D, TGE103 E '
        +' Where A.EC_PROCE IN (''7'') AND A.ECESTADO=''C''  '
        +' AND A.BANCOID=C.BANCOID AND C.BCOTIPCTA=''C'' AND A.CIAID=D.CIAID '
        +' And A.CIAID = '+QuotedStr('XX')
        +' AND A.TMONID=E.TMONID) SOLVISTA ORDER BY PROV,FECHA, HORA ';
    end;

    DMTE.cdsQry3.Close;
    DMTE.cdsQry3.IndexFieldNames:='';
    DMTE.cdsQry3.Filter := '';

    FConsulta.xfiltroMovLibCaja := TMant.Create( Application );
    FConsulta.xfiltroMovLibCaja.Admin         := DMTE.wAdmin ;
    FConsulta.xfiltroMovLibCaja.Titulo        := 'Movimientos de Caja' ;
    FConsulta.xfiltroMovLibCaja.Tablename     := 'VWCAJAMOVCAJA' ;
    FConsulta.xfiltroMovLibCaja.ClientDataSet := DMTE.cdsQry3;
    FConsulta.xfiltroMovLibCaja.OnCreateMant  := FConsulta.PegaPanelToolMovCaja ;
    FConsulta.xfiltroMovLibCaja.OnInsert      := nil ;
    FConsulta.xfiltroMovLibCaja.OnEdit        := nil ;
    FConsulta.xfiltroMovLibCaja.OnDelete      := nil ;
    FConsulta.xfiltroMovLibCaja.DComC         := DMTE.DCOM1 ;
    FConsulta.xfiltroMovLibCaja.Module        := 'CAJA' ;
    FConsulta.xfiltroMovLibCaja.SectionName   := 'CAJAMOVCAJA';
    FConsulta.xfiltroMovLibCaja.FileNameIni   := '\SOLCAJA.INI';
    FConsulta.xfiltroMovLibCaja.User          := DMTE.wUsuario ;
    FConsulta.xfiltroMovLibCaja.Module        := 'CAJA' ;
    FConsulta.xfiltroMovLibCaja.UsuarioSQL.Add(xSQL1+xSQL2+xSQL3);
    FConsulta.xfiltroMovLibCaja.Execute ;
  finally

  end;
end;


procedure TESaldosCaja;
var
   xFiltro : TMant ;
   xVista  : String ;
   xSQL    : string ;
   NumeroAleatorio1  : Integer ;
   NumeroAleatorio2  : Integer ;
begin
   if DMTE=nil then exit;
  if not DMTE.DCOM1.Connected then Exit;
  try
    if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
      xSQL:='SELECT A.BANCOID, A.BANCONOM, '
            +  'SUM(COALESCE(B.STSALDOINIC,0.00)) STSALDOINIC, '
            +  'SUM(COALESCE(B.STTOTING,0.00)) STTOTING, '
            +  'SUM(COALESCE(B.STTOTEGR ,0.00)) STTOTEGR, '
            +  'SUM(COALESCE(B.STSALDOFIN ,0.00)) STSALDOFIN, '
            +  'SUM(COALESCE(B.STSDOINIEXT,0.00)) STSDOINIEXT, '
            +  'SUM(COALESCE(B.STINGEXT,0.00)) STINGEXT, '
            +  'SUM(COALESCE(B.STEGREXT,0.00)) STEGREXT, '
            +  'SUM(COALESCE(B.STSDOFINEXT ,0.00)) STSDOFINEXT '
            +'FROM TGE105 A '
            +'LEFT JOIN CAJA310 B ON ( A.BANCOID = B.BANCOID and '
            +  'B.STFECHA>='''+FechaDB2(date)+''' and '
            +  'B.STFECHA<='''+FechaDB2(date)+''' ) '
            +'WHERE BCOTIPCTA = ''C'' '
            +'GROUP BY A.BANCOID, A.BANCONOM'
    else
    if DMTE.SRV_D = 'ORACLE' then
       xSQL:='SELECT A.BANCOID, A.BANCONOM, '
            +  'SUM(NVL(B.STSALDOINIC,0.00)) STSALDOINIC, '
            +  'SUM(NVL(B.STTOTING,0.00)) STTOTING, '
						+  'SUM(NVL(B.STTOTEGR ,0.00)) STTOTEGR, '
            +  'SUM(NVL(B.STSALDOFIN ,0.00)) STSALDOFIN, '
            +  'SUM(NVL(B.STSDOINIEXT,0.00)) STSDOINIEXT, '
            +  'SUM(NVL(B.STINGEXT,0.00))  STINGEXT, '
            +  'SUM(NVL(B.STEGREXT,0.00)) STEGREXT, '
            +  'SUM(NVL(B.STSDOFINEXT ,0.00)) STSDOFINEXT '
            +'FROM TGE105 A, CAJA310 B '
            + ' WHERE B.STFECHA>= TO_DATE('+quotedstr(FechaDB2(date))+') and '
            + 'B.STFECHA<= TO_DATE('+quotedstr(FechaDB2(date))+')'
            +' AND ( A.BANCOID = B.BANCOID (+) ) '
            +' AND BCOTIPCTA = ''C'' '
            +'GROUP BY A.BANCOID, A.BANCONOM';

    Randomize ;
    NumeroAleatorio1 := Random(100) ;
    NumeroAleatorio2 := Random(100) ;
    xVista:= 'VW' + DMTE.StrZero(inttostr(NumeroAleatorio1),3) + DMTE.StrZero(inttostr(NumeroAleatorio2),3) ;
    xSQl  := 'CREATE VIEW ' + xVista + ' AS ' + xSQL ;
    DMTE.DCOM1.AppServer.ejecutasql(xsql) ;

    FConsulta:=TFConsulta.Create( Application );
    FTool1   := TFTool1.create( Application );

    FConsulta.xFiltro  := TMant.create( Application );
    FConsulta.xFiltro.Admin         := DMTE.wAdmin ;
    FConsulta.xFiltro.Titulo        := 'Saldos de Caja' ;  //<
    FConsulta.xFiltro.Tablename     := xVista ;
    FConsulta.xMant                 := xFiltro ;
    FConsulta.xFiltro.OnCreateMant  := FConsulta.PegaPanelTool ;
	  FConsulta.xFiltro.OnDelete      := FConsulta.evt_Delete ;
    FConsulta.xFiltro.DComC         := DMTE.DCOM1 ;
    FConsulta.xFiltro.ClientDataSet := DMTE.cds1 ; // DMTE.cdsEgrCaja ;
    FConsulta.xFiltro.Module        := 'CAJA' ;
    FConsulta.xFiltro.SectionName   := 'CAJASALDOS';
    FConsulta.xFiltro.FileNameIni   := '\SOLCAJA.INI';
    FConsulta.xFiltro.User          := DMTE.wUsuario ;
    FConsulta.xFiltro.Execute ;
  Finally
  end ;
end;


procedure TEResumenConcepto;
begin
   if DMTE=nil then exit;
  if not DMTE.DCOM1.Connected then Exit;
  try
    Fresumencpto :=TFResumencpto.Create( Application );
    Fresumencpto.ActiveMDIChild;
    FVariables.ConfiguraForma( Screen.ActiveForm );
  finally
  end;
end;


procedure TERetenciones;
var
   xSQL, xWhere : String;
begin
   if DMTE=nil then exit;
  if not DMTE.DCOM1.Connected then Exit;
  try

    xSQL:='Select distinct CIARUC,''DERRAMA MAGISTERIAL'' CIADES from TGE101'
         +' where CIARUC is not null';
    DMTE.cdsQry6.Close;
    DMTE.cdsQry6.IndexFieldNames:='';
    DMTE.cdsQry6.Filter:='';
    DMTE.cdsQry6.Filtered:=False;
    DMTE.cdsQry6.DataRequest(xSQL);
    DMTE.cdsQry6.Open;
    DMTE.cdsQry6.IndexFieldNames:='';
    DMTE.cdsQry6.First;
    while not DMTE.cdsQry4.EOF do
    begin
      xWhere:='CIARUC='+DMTE.cdsQry6.FieldByName('CIARUC').AsString;
      DMTE.cdsQry6.Edit;
      DMTE.cdsQry6.FieldByName('CIADES').AsString:=
             DMTE.DisplayDescrip('prvTGE','TGE101','CIADES',xWhere,'CIADES');
      DMTE.cdsQry6.Next;
    end;

    xSQL := 'Select ANOMES from TGE813';
    DMTE.cdsConsulta.Close;
    DMTE.cdsConsulta.IndexFieldNames:='';
    DMTE.cdsConsulta.Filtered:=False;
    DMTE.cdsConsulta.DataRequest(xSQL);
    DMTE.cdsConsulta.Open;
    DMTE.cdsConsulta.IndexFieldNames:='ANOMES';

    xSQL:='SELECT A.RETNUMERO, A.CIARUC, A.CIAID,A.TDIARID,A.ANOMM,A.ECNOCOMP,A.CLAUXID,A.AUXID,'
        +' A.AUXRUC, SUM(A.MTOLOC) AS MTOLOC,SUM(A.MTORETLOC) AS MTORETLOC,A.RETSERIE,'
        +' MAX(A.FECEMI) AS FECEMI,A.FECPAGO, A.USUARIO, A.ECESTADO '
        +' FROM CNT320 A '
        +' GROUP BY A.RETNUMERO, A.CIARUC, A.CIAID,A.TDIARID,A.ANOMM,A.ECNOCOMP,A.FECPAGO,'
        +'          A.CLAUXID,A.AUXID,A.AUXRUC,A.RETSERIE, A.USUARIO, A.ECESTADO ';

    FToolRegRet  := TFToolRegRet.Create( Application );

    FToolRegRet.dtpDesde.Date:=Date;
    FToolRegRet.dtpHasta.Date:=Date;

    FConsulta    :=TFConsulta.Create( Application );

    FConsulta.xfiltroCabRegRet      := TMant.create( Application );
    FConsulta.xfiltroCabRegRet.Admin         := DMTE.wAdmin;
    FConsulta.xfiltroCabRegRet.Titulo        := 'Régimen de Retenciones';
    FConsulta.xfiltroCabRegRet.Tablename     := 'VWCAJALIBRET'; //'VWCAJACABRET';
    FConsulta.xfiltroCabRegRet.ClientDataSet := DMTE.cdsQry3;
    FConsulta.xfiltroCabRegRet.OnCreateMant  := FConsulta.PegaPanelToolDetReg;
    FConsulta.xfiltroCabRegRet.OnInsert      := nil;
    FConsulta.xfiltroCabRegRet.OnEdit        := nil;
    FConsulta.xfiltroCabRegRet.OnDelete      := nil;
    FConsulta.xfiltroCabRegRet.DComC         := DMTE.DCOM1;
    FConsulta.xfiltroCabRegRet.Module        := 'CAJA';
    FConsulta.xfiltroCabRegRet.SectionName   := 'CAJAREGRET';
    FConsulta.xfiltroCabRegRet.OnEdit        := FConsulta.evt_EditaCabRetencion;
    FConsulta.xfiltroCabRegRet.FileNameIni   := '\SOLCAJA.INI';
    FConsulta.xfiltroCabRegRet.User          := DMTE.wUsuario;
    FConsulta.xfiltroCabRegRet.UsuarioSQL.Add(xSQL);
    FConsulta.xfiltroCabRegRet.Execute ;
  Finally

  end ;
end;


procedure TEPagosProveedor;
var
   xSQL : string;
   a,m,d:word;
begin
   if DMTE=nil then exit;
  if not DMTE.DCOM1.Connected then Exit;
  try
    xsql := 'SELECT * FROM TGE105 WHERE BCOTIPCTA='+quotedstr('B') + ' ORDER BY BANCOID';
    DMTE.cdsBanco.close;
    DMTE.cdsBanco.DataRequest(xsql);
    DMTE.cdsBanco.Open;
    DMTE.cdsCCBco.Open;

    DMTE.cdsCia.Open;
    if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
       xSQL := ' SELECT A.TDIARID,A.ECANOMM,A.ECNOCOMP,A.CLAUXID,A.PROV,B.ECFCOMP,A.DOCID2,A.CPSERIE,A.CPNODOC,'+
              ' A.CPFEMIS,B.FPAGOID,B.ECNOCHQ,B.ECFEMICH,A.TMONID,A.DETCPAG,A.DEMTOORI              '+
              ' FROM CAJA303 A INNER  JOIN CAJA302 B ON (B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID    '+
                                               '  AND B.ECANOMM=A.ECANOMM AND B.ECNOCOMP=A.ECNOCOMP)'+
              ' WHERE A.CIAID=''XYZ'' '+
              ' UNION ALL '+
              ' SELECT A.TDIARID,A.ECANOMM,A.ECNOCOMP,A.CLAUXID,A.PROV,B.ECFCOMP,A.DOCID2,A.CPSERIE,A.CPNODOC,'+
              ' A.CPFEMIS,B.FPAGOID,B.ECNOCHQ,B.ECFEMICH, A.TMONID,A.DETCPAG,A.DEMTOORI             '+
              ' FROM CAJA301 A INNER  JOIN CAJA302 B ON (B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID    '+
                                               '  AND B.ECANOMM=A.ECANOMM AND B.ECNOCOMP=A.ECNOCOMP)'+
              ' WHERE A.CIAID=''XYZ'' '
    else
      if (DMTE.SRV_D = 'ORACLE') then
         xSQL := ' SELECT A.TDIARID,A.ECANOMM,A.ECNOCOMP,A.CLAUXID,A.PROV,B.ECFCOMP,A.DOCID2,A.CPSERIE,A.CPNODOC, '+
                 ' A.CPFEMIS,B.FPAGOID,B.ECNOCHQ,B.ECFEMICH,A.TMONID,A.DETCPAG,A.DEMTOORI '+
                 ' FROM CAJA303 A ,CAJA302 B '+
                 ' WHERE A.CIAID=''XYZ'' '+
                 ' AND (B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID  AND B.ECANOMM=A.ECANOMM AND B.ECNOCOMP=A.ECNOCOMP) '+
                 ' UNION ALL '+
                 ' SELECT A.TDIARID,A.ECANOMM,A.ECNOCOMP,A.CLAUXID,A.PROV,B.ECFCOMP,A.DOCID2,A.CPSERIE, '+
                 ' A.CPNODOC, A.CPFEMIS,B.FPAGOID,B.ECNOCHQ,B.ECFEMICH, A.TMONID,A.DETCPAG,A.DEMTOORI   '+
                 ' FROM CAJA301 A, CAJA302 B  '+
                 ' WHERE A.CIAID=''XYZ''  '+
                 ' AND   '+
                 ' (B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID  AND B.ECANOMM=A.ECANOMM AND B.ECNOCOMP=A.ECNOCOMP) ';


    FToolPagoProv  := TFToolPagoProv.Create( Application );
    FConsulta      :=TFConsulta.Create( Application );

    FConsulta.xFiltroRep                := TMant.Create( Application );
    FConsulta.xFiltroRep.Admin          := DMTE.wAdmin;
    FConsulta.xFiltroRep.DComC          := DMTE.DCOM1;
    FConsulta.xFiltroRep.OnEdit         := Nil;
    FConsulta.xFiltroRep.UsuarioSQL.Add(xSQL) ;
    FConsulta.xFiltroRep.Module         := DMTE.wModulo;
    FConsulta.xFiltroRep.ClientDataSet  := DMTE.cdsQry;
    FConsulta.xFiltroRep.OnCreateMant   := FConsulta.PegaPanelToolPagoProv;
    FConsulta.xFiltroRep.TableName      := 'VWCAJAPAGOXPROV';
    FConsulta.xFiltroRep.Titulo         := 'Pago x Proveedor';
    FConsulta.xFiltroRep.User           := DMTE.wUsuario;
    FConsulta.xFiltroRep.SectionName    :='CAJAPAGOXPROV';
    FConsulta.xFiltroRep.FileNameIni    :='\SOLCAJA.INI';
    FConsulta.xfiltroRep.Module         := 'CAJA';
    FConsulta.xFiltroRep.Execute;
  finally

  end;
end;



procedure TFConsulta.EditaSalBanco(Sender: TObject; MantFields: TFields);
var
   xSQL,xAnoMM : string;
   Y,M,D :word;
begin
   if DMTE.cdsQry.RecordCount = 0 then Exit;

   DMTE.cdsSQL.IndexFieldNames := '';
   DMTE.cdsSQL.Filter   :='';
   DMTE.cdsSQL.Filtered := False;
   DMTE.cdsSQL.Close;

   DecodeDate(FToolSalBanco.dbdtpFHasta.Date,Y,M,D);
   xAnoMM := Floattostr(Y)+DMTE.StrZero(Floattostr(M),2);

   xSQL := ' SELECT CAJA.ECFCOMP, '+
           '  CASE WHEN COALESCE(CAJA.ECNOCHQ,'''')<>'''' THEN CAJA.ECNOCHQ ELSE '+
           '  CAJA.ECNODOC END ECNOCHQ , '+
           '  CAJA.BANCOID,CAJA.CCBCOID, CIA.CIADES,EC_IE,ECMTOORI, MON.TMONABR, '+
           '  CASE WHEN CAJA.EC_PROCE=''4'' OR CAJA.EC_PROCE=''7'' THEN ''TRANSFERENCIA'' ELSE FPA.FPAGODES END FPAGODES, '+
           '  (CASE WHEN EC_IE= ''I'' THEN ECMTOORI ELSE 0 END ) AS INGRESO, '+
           '  (CASE WHEN EC_IE= ''E'' THEN ECMTOORI END ) AS EGRESO '+
           '  FROM CAJA302  CAJA '+
           '  LEFT JOIN TGE101 CIA ON(CIA.CIAID= CAJA.CIAID ) '+
           '  LEFT JOIN TGE105 BANK ON(BANK.BANCOID=CAJA.BANCOID) '+
           '  LEFT JOIN TGE106 CTAE ON( CTAE.CIAID=CAJA.CIAID AND  CTAE.CCBCOID=CAJA.CCBCOID AND CTAE.BANCOID = CAJA.BANCOID  ) '+
           '  LEFT JOIN TGE103 MON ON(MON.TMONID=CAJA.TMONID) '+
           '  LEFT JOIN TGE112 FPA ON (FPA.FPAGOID=CAJA.FPAGOID) '+
           '  WHERE CAJA.CIAID='+Quotedstr(DMTE.cdsQry.fieldbyname('CIAID').AsString)+
           '  AND CAJA.BANCOID ='+Quotedstr(DMTE.cdsQry.fieldbyname('SBBANCO').AsString)+
           '  AND CAJA.CCBCOID ='+Quotedstr(DMTE.cdsQry.fieldbyname('CTACTE').AsString)+
           '  AND CAJA.ECANOMM='+Quotedstr(xAnoMM)+
           '  AND CAJA.ECFCOMP<='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,FToolSalBanco.dbdtpFHasta.Date)+''')'+
           '  ORDER BY CAJA.ECFCOMP,ECNOCHQ ';


  try
     xFiltroDetRep                := TMant.Create( Application );
     xFiltroDetRep.Admin          := DMTE.wAdmin;
     xFiltroDetRep.DComC          := DMTE.DCOM1;
     xFiltroDetRep.OnEdit         := Nil;
     xFiltroDetRep.UsuarioSQL.Add(xSQL) ;
     xFiltroDetRep.Module         := DMTE.wModulo;
     xFiltroDetRep.ClientDataSet  := DMTE.cdsSQL;
     xFiltroDetRep.OnCreateMant   := Nil;
     xFiltroDetRep.TableName      := 'VWCAJADETBANCO';
     xFiltroDetRep.Titulo         := 'Saldo Detallado de Banco';
     xFiltroDetRep.User           := DMTE.wUsuario;
     xFiltroDetRep.SectionName    :='CAJASALDETBANCO';
     xFiltroDetRep.FileNameIni    :='\SOLCAJA.INI';
     xFiltroDetRep.Execute;
   finally
     xFiltroDetRep.Free;
     DMTE.cdsSQL.IndexFieldNames:='';
   end;


end;


procedure TFConsulta.PegaPanelToolLibBanco(Sender: TObject);
var
   cb, cl : TPanel ;
begin
   cb := FToolLibBanco.Pnl ;
   cl:= TMant(Sender).FMant.pnlBtns ;
   cb.Parent   := TMant(Sender).FMant.pnlBtns ;
   cl.Height := cb.Height+5;
   cb.Align    := alClient ;
   cl.AutoSize := True ;
   TMant(Sender).FMant.pnlBtns.Visible  := True;
end;

procedure TFConsulta.PegaPanelToolSalBanco(Sender: TObject);
var
   cb, cl : TPanel ;
begin
   cb := FToolSalBanco.Pnl ;
   cl:= TMant(Sender).FMant.pnlBtns ;
   cb.Parent   := TMant(Sender).FMant.pnlBtns ;
   cl.Height := cb.Height+5;
   cb.Align    := alClient ;
   cl.AutoSize := True ;
   TMant(Sender).FMant.pnlBtns.Visible  := True;
end;


procedure TFConsulta.ToolCheDif(Sender: TObject);
var
  pl : TPanel;
  pl1 : TPanel;
begin
  pl1 := FToolCheDif.pnlDetalle;
  pl := TMant(Sender).FMant.pnlBtns;
  pl.AutoSize := True;
  pl1.Align   := alClient;
	pl.Height   := pl1.Height + 5;
  pl1.Parent  := TMant(Sender).FMant.pnlBtns;
  TMant(Sender).FMant.pnlBtns.Visible  := True;
  FToolCheDif.dbdpFin.Date:=DateS;
  FToolCheDif.dbdpIni.Date:=DateS;
end;


procedure TFConsulta.PegaPanelToolMovCaja(Sender: TObject);
var
   cb, cl : TPanel ;
begin
   cb := FToolMovCaja.PnlComprobante ;
   cl:= TMant(Sender).FMant.pnlBtns ;
   cb.Parent   := TMant(Sender).FMant.pnlBtns ;
   cl.Height := cb.Height+5;
   cb.Align    := alClient ;
   cl.AutoSize := True ;
   TMant(Sender).FMant.pnlBtns.Visible  := True;
end;


procedure TFConsulta.PegaPanelTool(Sender: TObject);
var
   cb : Tcontrolbar ;
   pl : TPanel;
begin
   cb := FTool1.cb1 ;
   pl := TMant(Sender).FMant.pnlBtns ;
   pl.Height   := cb.Height ;
   pl.AutoSize := True ;
   cb.Parent   := TMant(Sender).FMant.pnlBtns ;
   cb.Align    := alClient ;
   TMant(Sender).FMant.pnlBtns.Visible  := True ;
   FTool1.AsignaMant(TMant(Sender)) ;
   TMant(Sender).FMant.OnShow := WMCGridShow ;
end;

procedure TFConsulta.evt_Delete;
begin
	 ShowMessage( 'No se Puede Eliminar');
end;

procedure TFConsulta.WMCGridShow(Sender: TObject)     ;
begin
     RecuperarCiaUnica( FTool1.dblcCia , FTool1.edtCia ) ;
   FTool1.dbdtpInicio.date   := DateS                   ;
   FTool1.dbdtpFin.date      := DateS                   ;
   FTool1.z2bbtnOK.OnClick( nil )                      ;

   xMant.FMant.bbtnSumaClick(nil) ;
   xFiltroActivate           := xMant.FMant.OnActivate ;
   xMant.FMant.OnActivate    := WMCActivate ;
   xBtnClick                 := xMant.FMant.Z2bbtnFiltro.OnClick ;
   xMant.FMant.Z2bbtnFiltro.OnClick :=  WMCBtnClick ;
end;

procedure TFConsulta.WMCActivate(Sender: TObject);
begin
   xFiltroActivate(xMant.FMant)                                                         ;

end;

procedure TFConsulta.WMCBtnClick(Sender: TObject);
begin
   xBtnClick(xMant.FMant.Z2bbtnFiltro)                                                         ;

end;


procedure TFConsulta.PegaPanelToolDetReg(Sender: TObject);
var
   cb, cl : TPanel ;
begin
   cb := FToolRegRet.PnlComprobante ;
   cl:= TMant(Sender).FMant.pnlBtns ;
   cb.Parent   := TMant(Sender).FMant.pnlBtns ;
   cl.Height := cb.Height+5;
   cb.Align    := alClient ;
   cl.AutoSize := True ;
   TMant(Sender).FMant.pnlBtns.Visible  := True;
end;

Procedure TFConsulta.evt_EditacabRetencion(Sender: TObject; MantFields: TFields);
Var
   x10: integer;
   XSQL : String;

// Inicio HPC_201603_CAJA
// Reimpresión de Certificados de Retención IGV Electrónicos
   xCiaRUC : String;
   xSerie, xNumRet : String;
   xRutaPDF : String;
   xFileName : String;
// Fin HPC_201603_CAJA
Begin
// Inicio HPC_201603_CAJA
// Reimpresión de Certificados de Retención IGV Electrónicos
// RUC de la Compañía
   xCiaRUC := DMTE.DisplayDescrip('prvTGE','TGE101','CIARUC',
                     'CIAID='+Quotedstr(xfiltroCabRegRet.FMant.cds2.FieldByName('CIAID').AsString),'CIARUC');
   xSerie := xfiltroCabRegRet.FMant.cds2.FieldByName('RETSERIE').AsString;
   If length(xSerie)<4 then
   Begin
      if length(xSerie)=3 then xSerie := 'R'+xSerie;
      if length(xSerie)=2 then xSerie := 'R0'+xSerie;
      if length(xSerie)=1 then xSerie := 'R00'+xSerie;
   End;
   xNumRet := copy(xfiltroCabRegRet.FMant.cds2.FieldByName('RETNUMERO').AsString,3,8);

   xSQL := 'Select trunc(sysdate) FECHAHOY from DUAL';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xSQL);
   DMTE.cdsQry.Open;

//   if DMTE.cdsQry.FieldByName('FECHAHOY').AsDateTime>strtodate('01/01/2017') then
   if xSerie='R001' then
   Begin
   xFileName := xCiaRUC + '-20-' + xSerie + '-' + xNumRet;
   xRutaPDF :=  '\\10.11.10.156\pdf\';
   xFileName := xRutaPDF+xFileName+'.pdf';
   if not FileExists(xFileName) then
   Begin
      ShowMessage('El archivo PDF:'+chr(13)+xFileName+chr(13)+' del Certificado de Retención de IGV Electrónica, NO EXISTE');
      Exit;
   End;

//   ShellExecute(Self.Handle, 'print', PChar(xFileName),  nil, nil, 0);
   ShellExecute(Self.Handle, nil, PChar(xFileName),  '', '', SW_SHOWNORMAL);
{
   pdfFile.src := xFileName;
   pdfFile.LoadFile(xFileName);
   pdfFile.print;
}
   End
   Else
   Begin
   xSQL := 'Select A.CIAID, A.TDIARID, A.ANOMM, A.ECNOCOMP, A.FECPAGO, A.CLAUXID, A.AUXID, '
      + '          A.AUXRUC, A.DOCID, A.DOCDES, A.SERIE, A.NODOC, A.TRANID, A.TRANDES, A.DH, '
      + '          A.MTOORI, A.MTOLOC, A.MTOEXT, A.USUARIO, A.FREG, A.HREG, A.MTORETORI, '
      + '          A.MTORETLOC, A.MTORETEXT, A.FECEMI, A.RETSERIE, A.RETNUMERO, A.DOCID2, '
      + '          A.CPNODOC, A.CPNOREG, A.CPSERIE, A.ECESTADO, A.RETTOTDES, A.TCAMB, '
      + '          A.TMONIDFAC, A.FOTROREG, A.CIARUC, '
      + '          C.DOCDES DOCDESC, C.DOCABR, '
      + '          B.AUXNOMB, B.AUXDIR, '
      + '          D.CIADES, D.CIAABR, D.CIARUC, E.TMONABR, E.TMONDES '
      + '     from CNT320 A, CNT201 B, TGE110 C, TGE101 D, TGE103 E '
      + '    where A.CIAID='+quotedstr(xfiltroCabRegRet.FMant.cds2.FieldByName('CIAID').AsString)
      + '      and A.ANOMM='+quotedstr(xfiltroCabRegRet.FMant.cds2.FieldByName('ANOMM').AsString)
      + '      and A.TDIARID='+quotedstr(xfiltroCabRegRet.FMant.cds2.FieldByName('TDIARID').AsString)
      + '      and A.ECNOCOMP='+quotedstr(xfiltroCabRegRet.FMant.cds2.FieldByName('ECNOCOMP').AsString)
      + '      and A.RETNUMERO='+quotedstr(xfiltroCabRegRet.FMant.cds2.FieldByName('RETNUMERO').AsString)
      + '      and A.CLAUXID=B.CLAUXID AND A.AUXID=B.AUXID '
      + '      and C.DOCMOD=''CXP'' AND C.DOCID=A.DOCID '
      + '      and D.CIAID=A.CIAID '
      + '      and E.TMONID='+quotedstr(DMTE.wTMonLoc)
      + '    order by A.CLAUXID, A.AUXID';
	DMTE.cdsRetencion.Close;
	DMTE.cdsRetencion.Datarequest( xSQL );
	DMTE.cdsRetencion.Open;
   DMTE.dsRetencion.dataset := DMTE.cdsRetencion;

   FToolRegRet.ppdbCompRet.DataSource:=DMTE.dsRetencion;
   DMTE.cdsRetencion.IndexFieldNames := 'RETNUMERO;CLAUXID;AUXID;DOCID;SERIE;NODOC';
   FToolRegRet.ppdbRetencion.DataSource:=DMTE.dsRetencion;
	FToolRegRet.pprRetencion.TEMPLATE.FileName:=DMTE.wRutaCNT + '\RetencionesBloque.rtm';
	FToolRegRet.pprRetencion.template.LoadFromFile;

   if FToolRegRet.cbDisenoRep.Checked then
   begin
      FToolRegRet.ppd1.Report:=FToolRegRet.pprRetencion;
      FToolRegRet.ppd1.ShowModal;
   end
   else
   begin
      FToolRegRet.pprRetencion.Print;
      FToolRegRet.pprRetencion.Stop;

      x10:=DMTE.ComponentCount-1;
      while x10>0 do begin
         if DMTE.components[x10].classname='TppGroup' then
         begin
            DMTE.components[x10].free;
         end;
         x10:=x10-1;
      end;

      FToolRegRet.ppdbRetencion.DataSource:=NIL;
   end;
   End;
// Fin HPC_201603_CAJA
end;

procedure TFConsulta.PegaPanelToolPagoProv(Sender: TObject);
var
   cb, cl : TPanel ;
begin
   cb := FToolPagoProv.Pnl ;
   cl:= TMant(Sender).FMant.pnlBtns ;
   cb.Parent   := TMant(Sender).FMant.pnlBtns ;
   cl.Height := cb.Height+5;
   cb.Align    := alClient ;
   cl.AutoSize := True ;
   TMant(Sender).FMant.pnlBtns.Visible  := True;
end;


Procedure TEVerificaVersion;
Begin
   if DMTE=nil then exit;
   if not DMTE.DCOM1.Connected then Exit;
   FConsulta := TFConsulta.Create( Application );
   If DMTE.fg_VerificaVersion(FConsulta.lblVersion.Caption) = False Then
   Begin
      ShowMessage('Su Sistema no está actualizado.'+#13+'Comuníquese con Soporte Técnico');
			Application.Terminate;
      Exit;
   End;
End;

end.

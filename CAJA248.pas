unit Caja248;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdbdatetimepicker, Buttons, ExtCtrls, ppEndUsr, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppDBPipe, ppCtrls,
  ppBands, ppVar, ppPrnabl;

type
  TFToolCheDif = class(TForm)
    pnlDetalle: TPanel;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dbdpIni: TwwDBDateTimePicker;
    dbdpFin: TwwDBDateTimePicker;
    bbtnOk: TBitBtn;
    ppdbCheques: TppDBPipeline;
    pprCheques: TppReport;
    ppDesigner1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    pplblCia: TppLabel;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel3: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel14: TppLabel;
    ppDBText1: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel1: TppLabel;
    ppDBText11: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText7: TppDBText;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppLabel7: TppLabel;
    procedure bbtnOkClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolCheDif: TFToolCheDif;

implementation

uses CajaDM, oaTE4000;

{$R *.DFM}

procedure TFToolCheDif.bbtnOkClick(Sender: TObject);
var
   sFPagoId,xSQL:string;
begin
   xSQL := '(FCEGR=''1'' or FCEGR=''S'') and (FCHQ=''1'' or FCHQ=''S'')';
   sFPagoId:=DMTE.DisplayDescrip('prvTGE','TGE112','FPAGOID',xSQL,'FPAGOID');


   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
   begin
   xSQL:='Select '
        +'CAJA314.CIAID, CAJA314.TDIARID, CAJA314.ECNOCOMP, CAJA314.ECANOMM, CAJA314.FPAGOID, CAJA314.BANCOID,'
        +'CAJA314.TJAID, CAJA314.TMONID, CAJA314.FC_RECIBIDO, CAJA314.FC_COBRADO, CAJA314.FC_DEVOLVER,'
        +'CAJA314.TC_USADO, CAJA314.FCTCAMB, CAJA314.ECNOCHQ, CAJA314.CORRE, CAJA314.CCTREC, CAJA314.DOCID,'
        +'CAJA314.CCSERIE, CAJA314.CCNODOC, CAJA314.FC_MTOLOC, CAJA314.FC_MTOEXT, CAJA314.FC_FCANC,'
        +'CAJA314.FC_ESTADO, CAJA314.CPTOID, CAJA314.CLAUXID, CAJA314.CLIEID, CAJA314.FCTRANSF, CAJA314.LICOID,'
        +'CAJA314.CCBCOID, CAJA314.FC_FVCMTO, CAJA314.FC_FEMIS, CAJA314.FPAGODES, CAJA314.TMONABR, CAJA314.CAJAID,'
        +'CAJA314.CHQ_ESTADO, CAJA314.MOTDEVCHQ, TGE204.CLIEDES, TGE204.CLIERUC, CXC318.CCFEMIS LICOFEMIS '
        +'from CAJA314 '
        +'left outer join TGE204 on TGE204.CLAUXID=CAJA314.CLAUXID and TGE204.CLIEID=CAJA314.CLIEID '
        +'left outer join CXC318 on CXC318.CIAID=CAJA314.CIAID and CXC318.LICOID=CAJA314.LICOID '
        +'where FPAGOID='+QuotedSTr(sFPagoId)+' and FC_FVCMTO>FC_FEMIS AND (MOTDEVCHQ IS NULL OR MOTDEVCHQ='''')'
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
        +'CAJA314.CHQ_ESTADO, CAJA314.MOTDEVCHQ, TGE204.CLIEDES, TGE204.CLIERUC, CXC318.CCFEMIS LICOFEMIS '
        +'from CAJA314, TGE204, CXC318 '
        +'where FPAGOID='+QuotedSTr(sFPagoId)+' and FC_FVCMTO>FC_FEMIS AND (MOTDEVCHQ IS NULL OR MOTDEVCHQ='''')'
		    +' and ( nvl(CAJA314.FCTRANSF,''N'')<>''S'' ) '
        +' and TGE204.CLAUXID(+)=CAJA314.CLAUXID and TGE204.CLIEID(+)=CAJA314.CLIEID '
        +' and CXC318.CIAID(+)=CAJA314.CIAID and CXC318.LICOID(+)=CAJA314.LICOID ';
   end;

   if dbdpIni.Date<>0 then
      xSQL:=xSQL+' and FC_FVCMTO>='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdpIni.date)+''')';
	if dbdpFin.Date<>0 then
      xSQL:=xSQL+' and FC_FVCMTO<='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdpFin.date)+''')';

   FConsulta.xFiltroCHQ.UsuarioSQL.Clear;
   FConsulta.xFiltroCHQ.FMant.wTabla:='CAJA314';
   FConsulta.xFiltroCHQ.FMant.wTabla:='VWCAJACHQCCDIF';
   FConsulta.xFiltroCHQ.UsuarioSQL.Add( xSQL );
   FConsulta.xFiltroCHQ.NewQuery;
end;

procedure TFToolCheDif.BitBtn1Click(Sender: TObject);
var
    sFPagoId,sentencia,xSQL,xwhere : string;
  	 x10,ipos   : Integer;
begin
   xSQL := '(FCEGR=''1'' or FCEGR=''S'') and (FCHQ=''1'' or FCHQ=''S'')';
   sFPagoId:=DMTE.DisplayDescrip('prvTGE','TGE112','FPAGOID',xSQL,'FPAGOID');

   sentencia:=UpperCase(FConsulta.xFiltroCHQ.fMant.sql);
   ipos:=pos('WHERE',sentencia);
   if ipos > 0 then
      xwhere:= copy(sentencia,ipos,length(sentencia)-ipos+1);

   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
   begin
   xSQL:='Select '
        +'CAJA314.CIAID, CAJA314.TDIARID, CAJA314.ECNOCOMP, CAJA314.ECANOMM, CAJA314.FPAGOID, CAJA314.BANCOID,'
        +'CAJA314.TJAID, CAJA314.TMONID, CAJA314.FC_RECIBIDO, CAJA314.FC_COBRADO, CAJA314.FC_DEVOLVER,'
        +'CAJA314.TC_USADO, CAJA314.FCTCAMB, CAJA314.ECNOCHQ, CAJA314.CORRE, CAJA314.CCTREC, CAJA314.DOCID,'
        +'CAJA314.CCSERIE, CAJA314.CCNODOC, CAJA314.FC_MTOLOC, CAJA314.FC_MTOEXT, CAJA314.FC_FCANC,'
        +'CAJA314.FC_ESTADO, CAJA314.CPTOID, CAJA314.CLAUXID, CAJA314.CLIEID, CAJA314.FCTRANSF, CAJA314.LICOID,'
        +'CAJA314.CCBCOID, CAJA314.FC_FVCMTO, CAJA314.FC_FEMIS, CAJA314.FPAGODES, CAJA314.TMONABR, CAJA314.CAJAID,'
        +'CAJA314.CHQ_ESTADO, CAJA314.MOTDEVCHQ, TGE204.CLIEDES, TGE204.CLIERUC, CXC318.CCFEMIS LICOFEMIS, '
        +'TGE103.TMONDES, TGE103.TMONABR, TGE105.BANCOABR, '
        +'case when FC_FVCMTO<FC_FEMIS then ''DIFERIDO'' else '''' end TIPOCHQ '
        +'from CAJA314 '
        +'left outer join TGE204 on TGE204.CLAUXID=CAJA314.CLAUXID and TGE204.CLIEID=CAJA314.CLIEID '
        +'left outer join CXC318 on CXC318.CIAID=CAJA314.CIAID and CXC318.LICOID=CAJA314.LICOID '
        +'left outer join TGE103 on TGE103.TMONID=CAJA314.TMONID '
        +'left outer join TGE105 on TGE105.BANCOID=CAJA314.BANCOID ';
   xSQL := xSQL+xWhere
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
        +'CAJA314.CHQ_ESTADO, CAJA314.MOTDEVCHQ, TGE204.CLIEDES, TGE204.CLIERUC, CXC318.CCFEMIS LICOFEMIS, '
        +'TGE103.TMONDES, TGE103.TMONABR, TGE105.BANCOABR, '
        +'case when FC_FVCMTO<FC_FEMIS then ''DIFERIDO'' else '''' end TIPOCHQ '
        +'from CAJA314, TGE204, CXC318, TGE103, TGE105 ';
   xSQL := xSQL+xWhere
//        +' and TGE204.CLAUXID(+)=CAJA314.CLAUXID and TGE204.CLIEID(+)=CAJA314.CLIEID '
//        +' and CXC318.CIAID(+)=CAJA314.CIAID and CXC318(+).LICOID=CAJA314.LICOID '
        +' and TGE103.TMONID(+)=CAJA314.TMONID '
        +' and TGE105.BANCOID(+)=CAJA314.BANCOID ';
   end;

   DMTE.cdsSQL.Close;
   DMTE.cdsSQL.DataRequest(xSQL);
   DMTE.cdsSQL.Open;
   DMTE.cdsSQL.IndexFieldNames:='TMONID;FC_FVCMTO';
   if DMTE.cdsSQL.RecordCount=0 then
      Raise Exception.Create('No hay datos que mostrar');

   ppdbCheques.DataSource := DMTE.dsSQL;
   pprCheques.TEMPLATE.FileName := wRutaRpt + '\ChequeDiferido.rtm';
   pprCheques.template.LoadFromFile ;
   pprCheques.Print;

   x10:=ComponentCount-1;
   while x10>0 do begin
      if components[x10].classname='TppGroup' then begin
         components[x10].free;
      end;
      x10:=x10-1;
   end;
end;

procedure TFToolCheDif.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

end.

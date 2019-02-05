unit Caja238 ;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, StdCtrls, wwdblook, Buttons, ExtCtrls, ppReport,
  ppStrtch, ppSubRpt, ppBands, ppCtrls, ppClass, ppPrnabl, ppProd, ppComm,
  ppRelatv, ppCache, ppDB, ppDBPipe, ppDBBDE, ppVar, ppEndUsr, Variants;

type
  TFArqueoCajaP = class(TForm)
    pnlRegComp: TPanel;
    lblReporte: TLabel;
    Bevel1: TBevel;
    z2bbtnOk: TBitBtn;
    z2bbtnSalir: TBitBtn;
    lblCia: TLabel;
    Label2: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dbdtpInicio: TwwDBDateTimePicker;
    ppRCuadre: TppReport;
    ppDBIE: TppDBPipeline;
    ppDBIE1: TppDBPipeline;
    dbdtpFin: TwwDBDateTimePicker;
    Label1: TLabel;
    dblcCaja: TwwDBLookupCombo;
    edtCaja: TEdit;
    ppDesigner1: TppDesigner;
    ppHeaderBand2: TppHeaderBand;
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
    ppDetailBand4: TppDetailBand;
    ppdbDocu: TppDBText;
    ppdbFecha: TppDBText;
    ppdbMone: TppDBText;
    ppdbGlosa: TppDBText;
    ppdbMonIngLoc: TppDBText;
    ppdbMonEgrLoc: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppdbMonIngExt: TppDBText;
    ppdbMonEgrExt: TppDBText;
    ppdbSumaIng: TppVariable;
    ppdbSumaEgr: TppVariable;
    ppSummaryBand1: TppSummaryBand;
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
    ppLabel3: TppLabel;
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
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppdbtDocu: TppDBText;
    ppdbtMtoingloci: TppDBText;
    ppdbtMtoingloce: TppDBText;
    ppdbtMtoegrloci: TppDBText;
    ppdbtMtoegrloce: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppdbcingS: TppDBCalc;
    ppdbcingD: TppDBCalc;
    ppdbcegrS: TppDBCalc;
    ppdbcegrD: TppDBCalc;
    ppvIng: TppVariable;
    ppvegr: TppVariable;
    ppvSaldoAS1: TppVariable;
    ppvSaldoAD1: TppVariable;
    procedure dbdtpFinExit(Sender: TObject);
    procedure dbdtpInicioExit(Sender: TObject);
    procedure dblcCiaChange(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure z2bbtnSalirClick(Sender: TObject);
    procedure z2bbtnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ppdbSumaIngCalc(Sender: TObject; var Value: Variant);
    procedure ppdbSumaEgrCalc(Sender: TObject; var Value: Variant);
    procedure ppvtotIngCalc(Sender: TObject; var Value: Variant);
    procedure ppRCuadrePreviewFormCreate(Sender: TObject);
    procedure ppRCuadreStartPage(Sender: TObject);
    procedure ppTitleBand1BeforePrint(Sender: TObject);
    procedure ppvIngCalc(Sender: TObject; var Value: Variant);
    procedure ppvegrCalc(Sender: TObject; var Value: Variant);
    procedure ppvSaldoAS1Calc(Sender: TObject; var Value: Variant);
    procedure ppvSaldoAD1Calc(Sender: TObject; var Value: Variant);
    procedure dblcCajaExit(Sender: TObject);
  private
    { Private declarations }
    xVez,xvez1 : bool;
    xTotEgresosS  ,
    xTotEgresosD  ,
    xTotIngresosS ,
    xTotIngresosD : Currency ;
    xsalingloc,xsalingext : real;
		procedure AsignaSQLArqueoCajaP(xCIAID, xFECHAINICIO, xFECHAFIN: String);
  public
    { Public declarations }
  end;

var
  FArqueoCajaP: TFArqueoCajaP;

implementation

uses CajaDM, CajaUtil;

{$R *.DFM}

procedure TFArqueoCajaP.dbdtpFinExit(Sender: TObject);
begin
    if dbdtpFin.Date = 0 then
    begin
       dbdtpFin.Date :=tDate( Now);
    end;
    if dbdtpInicio.Date > dbdtpFin.Date then
       dbdtpInicio.Date:=dbdtpFin.Date;
end;

procedure TFArqueoCajaP.dbdtpInicioExit(Sender: TObject);
begin
    if dbdtpInicio.Date = 0 then
    begin
       dbdtpInicio.Date :=tDate( Now);
    end;
end;

procedure TFArqueoCajaP.dblcCiaChange(Sender: TObject);
begin
   if  length(dblcCia.Text)=dblcCia.LookupTable.FieldByName('CIAID').Size then
   begin
	   if dblcCia.Text=dblcCia.LookupTable.FieldByName('CIAID').AsString then
	   begin
	      if edtCia.Text<>dblcCia.LookupTable.FieldByName('CIADES').AsString then
	      begin
	            edtCia.Text:=dblcCia.LookupTable.FieldByName('CIADES').AsString;
	      end;
	   end
	   else
	   begin
	     if not dblcCia.LookupTable.Locate('CIAID', dblcCia.Text,[]) then
	     begin
	          edtCia.text:='';
	     end
	     else
	     begin
	          edtCia.text:=dblcCia.LookupTable.fieldbyname('CIADES').AsString;
	     end;
	   end;
   end
   else
   begin
           edtCia.text:='';
   end;
end;


procedure TFArqueoCajaP.dblcCiaExit(Sender: TObject);
begin
if edtCia.Text='' then
begin
    if dblcCia.Text='' then
      ShowMessage('Ingrese Compañía')
    else
      ShowMessage('El Código de Compañía que ha Ingresado'+#13 +
                  'No está registrado');
    (Sender as twincontrol).SetFocus;
end
end;
procedure TFArqueoCajaP.FormShow(Sender: TObject);
begin
    RecuperarCiaUnica(dblcCia,edtCia) ;
    dbdtpInicio.Date := DateS ;
    dbdtpFin.Date := DateS ;
end;

procedure TFArqueoCajaP.z2bbtnSalirClick(Sender: TObject);
begin
   Close ;
end;

procedure TFArqueoCajaP.z2bbtnOkClick(Sender: TObject);
var
  FInicio, FFin : string ;
  sfecha, ssql : string;
begin
  FInicio :=  FechaDB2 (dbdtpINicio.Date) ;
  FFin := FechaDB2 (dbdtpInicio.Date) ;
  AsignaSQLArqueoCajap ( dblcCia.Text , FInicio , FFin ) ;
  sFecha := formatdatetime(DMTE.wFormatFecha,dbdtpInicio.Date);
  ssql := 'SELECT * FROM CAJA310 WHERE BANCOID=' + quotedstr(dblcCaja.text) +
  					' AND STFECHA='+quotedstr(sfecha);
  DMTE.cdsQry.Close;
  DMTE.cdsQry.DataRequest(ssql);
  DMTE.cdsQry.Open;
  ppDBIE.DataSource := DMTE.dsRec ;
  ppDBIE1.DataSource := DMTE.dsDescrip ;
  if DMTE.cdsRec.RecordCount = 0 then
  		Raise Exception.create('No hay datos por Mostrar para el rango seleccionado') ;
  ppRCuadre.TEMPLATE.FileName := wRutaRpt + '\ArqueoCajaP.rtm';
  ppRCuadre.template.LoadFromFile ;
  pplblCia.text:=edtCia.text;
  pplblDel.text:='Del: '+sFecha;
  ppRCuadre.Print ;
  //ppDesigner1.Show;
  xvez := false; xvez1 := false;
  ppDBIE.DataSource       := nil ;
End;

procedure TFArqueoCajaP.FormCreate(Sender: TObject);
begin
    xvez := False; xvez1 := false;
    xTotEgresosS   := 0 ;
    xTotEgresosD   := 0 ;
    xTotIngresosS  := 0 ;
    xTotIngresosD  := 0 ;
end ;

procedure TFArqueoCajaP.ppdbSumaIngCalc(Sender: TObject;
  var Value: Variant);
begin
  if xvez = false then
   begin
    Value := value + ppvSaldoASol.value + strtocurr (ppdbMonIngLoc.fIELDVALUE) - strtocurr (ppdbMonEgrLoc.FieldValue);
    xvez := true;
   end
  else
   Value := Value + strtocurr ( ppdbMonIngLoc.fIELDVALUE ) - strtocurr ( ppdbMonEgrLoc.FieldValue );
end;

procedure TFArqueoCajaP.ppdbSumaEgrCalc(Sender: TObject;
  var Value: Variant);
begin
  if xvez1 = false then
   begin
    Value := value + ppvSaldoADol.Value + strtocurr ( ppdbMonIngExt.fIELDVALUE ) - strtocurr (ppdbMonEgrExt.FieldValue );
    xvez1 := true;
   end
  else
   Value := Value + strtocurr ( ppdbMonIngExt.fIELDVALUE ) - strtocurr (ppdbMonEgrExt.FieldValue );
end;

procedure TFArqueoCajaP.ppvtotIngCalc(Sender: TObject; var Value: Variant);
begin
  Value := ppdbSumaIng.Value;
end;


procedure TFArqueoCajaP.ppRCuadrePreviewFormCreate(Sender: TObject);
begin
    pplblTitulo.Left := (ppRCuadre.PrinterSetup.PaperWidth / 2) - (pplblTitulo.Width/2);
    pplblDel.Text := 'Del :'+ dbdtpInicio.Text;
    pplblDel.Left := (ppRCuadre.PrinterSetup.PaperWidth / 2) - (pplblDel.Width/2);
end;

procedure TFArqueoCajaP.ppRCuadreStartPage(Sender: TObject);
begin
   if ppRCuadre.PageNo > 1 then
    begin
     pplblSaldoIng.Visible := False;
     ppvSaldoASol.Visible := False;
     ppvSaldoADol.Visible := False;
    end
   else
    begin
     pplblSaldoIng.Visible := true;
     ppvSaldoASol.Visible := true;
     ppvSaldoADol.Visible := true;
    end;
   if ppRCuadre.PageNo = 1 then
    begin
     pplblSaldoIng.caption := 'Saldo Inicial ----------->';
     if (DMTE.cdsQry.FieldByName('STSALDOINIC').AsString = '') or (DMTE.cdsQry.FieldByName('STSALDOFIN').AsString = null) then
      xsalingloc := 0
     else
      xsalingloc := DMTE.cdsQry.FieldByName('STSALDOINIC').value;

     if (DMTE.cdsQry.FieldByName('STSDOFINEXT').AsString = '') or (DMTE.cdsQry.FieldByName('STSDOFINEXT').AsString = null) then
      xsalingext := 0
     else
      xsalingext := DMTE.cdsQry.FieldByName('STSDOFINEXT').value;
     if xsalingloc > 0 then ppvSaldoASol.Left := ppdbMonEgrLoc.Left
     else ppvSaldoASol.Left := ppdbMonIngLoc.Left;
     if xsalingext > 0 then ppvSaldoADol.Left := ppdbMonIngExt.Left
     else ppvSaldoADol.Left := ppdbMonEgrExt.Left;
     ppvSaldoASol.Value := xsalingloc;
     ppvSaldoADol.Value := xsalingext;
    end;
end;

procedure TFArqueoCajaP.ppTitleBand1BeforePrint(Sender: TObject);
begin
     ppvSaldoAS.Value := xsalingloc;
     ppvSaldoAD.Value := xsalingext;
     pplblDel2.Text := 'Del :'+ dbdtpInicio.Text;
end;

procedure TFArqueoCajaP.ppvSaldoAS1Calc(Sender: TObject;
  var Value: Variant);
begin
   value := ppvSaldoAS.Value;
end;

procedure TFArqueoCajaP.ppvSaldoAD1Calc(Sender: TObject;
  var Value: Variant);
begin
    value := ppvSaldoAD.Value;
end;

procedure TFArqueoCajaP.ppvegrCalc(Sender: TObject; var Value: Variant);
begin
    value := ppvSaldoAD.value + ppdbcegrS.Value - ppdbcegrD.Value;
end;

procedure TFArqueoCajaP.ppvIngCalc(Sender: TObject; var Value: Variant);
begin
    value := ppvSaldoAS.value + ppdbcingS.Value - ppdbcingD.Value;
end;

procedure TFArqueoCajaP.dblcCajaExit(Sender: TObject);
begin
	 edtCaja.Text := DMTE.cdsBancoEgr.fieldbyname('BANCONOM').AsString;
end;


procedure TFArqueoCajaP.AsignaSQLArqueoCajaP(xCIAID, xFECHAINICIO, xFECHAFIN: String);
var
	 xSQL : String ;
begin
	 //ASIGNA DATOS DEL 1ER CLIENTDATASET DEL REPORTE
		//EGRESOS
		if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
			xSQL  := 'SELECT CAJA302.CUENTAID,CTADES,'
							+'CASE WHEN EC_PROCE = ''1'' THEN ''Egresos'' '
							+    ' WHEN EC_PROCE = ''3'' THEN ''Pago a Varios''  '
							+    ' WHEN EC_PROCE = ''4'' THEN ''Transferencias''  '
                                                        +    ' WHEN EC_PROCE = ''R'' THEN ''Rendicion Ctas.'' '
                                                        +    ' WHEN EC_PROCE = ''0'' THEN ''Compra/Venta ME.'' '
							+    ' WHEN EC_PROCE = ''7'' THEN ''Transferencias''  '
							+    ' WHEN EC_PROCE = ''B'' THEN ''Pago a Prov.'' END DOCABR , '
							+  ' TDIARID||''-''||ECNOCOMP ECFCOMP, TGE103.TMONABR, '
							+  ' CAJA302.ECGLOSA , '
							+  ' CASE WHEN CAJA302.TMONID = '''+DMTE.wTMonLoc+''' THEN DEC( CAJA302.ECMTOLOC,15,2 ) ELSE 0 END ECMTOLOC , '
							+  ' CASE WHEN CAJA302.TMONID = '''+DMTE.wTMonExt+''' THEN DEC( CAJA302.ECMTOEXT,15,2 ) ELSE 0 END ECMTOEXT , '
							+  ' DEC( 0,15,2 ) ECMTOLOCI , '
							+  ' DEC( 0,15,2 ) ECMTOEXTI , '
							+  ' DEC( CAJA302.ECTCAMB,15,2 ) ECTCAMB ,  '
							+  ' CAJA302.CLAUXID, CAJA302.PROV, CNT201.AUXNOMB, '
							+  ' ''Egresos''  EC_IE '
							+' FROM CAJA302 '
							+   ' LEFT OUTER JOIN TGE103 ON (CAJA302.TMONID = TGE103.TMONID) '
							+   ' LEFT OUTER JOIN CNT201 ON (CAJA302.PROV = CNT201.AUXID AND CAJA302.CLAUXID = CNT201.CLAUXID )'
							+   ' LEFT JOIN TGE202 CTA ON CTA.CIAID=CAJA302.CIAID AND CTA.CUENTAID=CAJA302.CUENTAID '
//              +   ' INNER JOIN TGE112 ON (CAJA302.FPAGOID = TGE112.FPAGOID AND TGE112.F_MOVDIARIO = ''S'' )'
							+' WHERE ECFCOMP >= DATE('''+ xFECHAINICIO   +''') '
							+   ' AND ECFCOMP <= DATE('''+ xFECHAFIN   +''') '
							+   ' AND CAJA302.CIAID = ''' + xCIAID   +''' '
							+   ' AND EC_IE = ''E'' '
							+   ' AND (CCBCOID IS NULL OR LENGTH(RTRIM(CCBCOID))=0) '
							+   ' AND CASE WHEN (RTRIM(CCBCOID) = '''' OR (CCBCOID IS NULL)) THEN ''E'' ELSE COALESCE(ECCHKEST,''P'') END = ''E'' AND'
							+   ' ECESTADO = ''C'' '

							+' UNION ALL '

							+'SELECT CXC303.CUENTAID,CTADES,TGE110VW.DOCABR , '
							+'  CASE WHEN COALESCE(RTRIM(CXC303.CCSERIE),'''')<> '''' THEN ''-'' ELSE '''' END|| CXC303.CCNODOC ECFCOMP, TGE103.TMONABR, '
							+'  CXC303.CCGLOSA ECGLOSA, '
							+'  DEC( 0,15,2 ) ECMTOLOC, '
							+'  DEC( 0,15,2 ) ECMTOEXT, '
							+'  ECCOBLOC ECMTOLOCI, '
							+'  ECCOBEXT ECMTOEXTI, '
							+'  DEC( CXC303.NCOTCAMB,15,2 ) ECTCAMB, '
							+'  CXC303.CLAUXID, CXC303.CLIEID PROV, CNT201.AUXNOMB, '
							+'  ''Ingresos''  EC_IE '
							+' FROM CXC303 '
							+'  LEFT OUTER JOIN TGE110VW ON (CXC303.DOCID = TGE110VW.DOCID)                                           '
							+'  LEFT OUTER JOIN TGE103 ON (CXC303.TMONID = TGE103.TMONID)                                           '
							+'  LEFT OUTER JOIN CNT201 ON (CXC303.CLIEID = CNT201.AUXID AND CXC303.CLAUXID = CNT201.CLAUXID )       '
							+'  LEFT JOIN TGE202 CTA ON CTA.CIAID=CXC303.CIAID AND CTA.CUENTAID=CXC303.CUENTAID '
							+' WHERE CCFEMIS >= DATE('''+ xFECHAINICIO   +''') AND '
							+'  CCFEMIS <= DATE('''+ xFECHAFIN   +''') AND '
							+'  CXC303.CIAID = ''' + xCIAID   +''' AND '
							+'  NCOESTADO = ''C'' AND '
							+'  CCTREC IN (''NP'',''RC'',''LI'') '
							+' ORDER BY 11,2,1 '
	 else
		if DMTE.SRV_D = 'ORACLE' then
				xSQL  := 'SELECT '
								 +  'DECODE( EC_PROCE , ''1'' , ''Egresos'' '
								 +      ' , EC_PROCE , ''3'' , ''Pago a Varios''  '
								 +      ' , EC_PROCE , ''B'' , ''Pago a Prov.'' ) DOCABR , '
								 +  ' TDIARID||''-''||ECNOCOMP ECFCOMP, TGE103.TMONABR, '
								 +  ' CAJA302.ECGLOSA , '
								 +  ' DECODE(CAJA302.TMONID,'''+DMTE.wTMonLoc+''',CAJA302.ECMTOLOC,0) ECMTOLOC , '
								 +  ' DECODE(CAJA302.TMONID,'''+DMTE.wTMonExt+''',CAJA302.ECMTOEXT,0) ECMTOEXT , '
								 +  ' 0 ECMTOLOCI , '
								 +  ' 0 ECMTOEXTI , '
								 +  ' CAJA302.ECTCAMB ECTCAMB ,  '
								 +  ' CAJA302.CLAUXID, CAJA302.PROV, CNT201.AUXNOMB, '
								 +  ' ''Egresos''  EC_IE '
								 +' FROM CAJA302, TGE103, CNT201, TGE112 '
								 +' WHERE ECFCOMP >= TO_DATE('''+ xFECHAINICIO   +''') '
								 +  ' AND ECFCOMP <= TO_DATE('''+ xFECHAFIN   +''') '
								 +  ' AND CIAID = ''' + xCIAID   +''' '
								 +  ' AND EC_IE = ''E'' '
								 +  ' AND (CCBCOID IS NULL OR LENGTH(TRIM(CCBCOID))=0) '
								 +  ' AND DECODE(TRIM(CCBCOID),null,''E'',NVL(ECCHKEST,''P'')) = ''E'' AND '
								 +  ' ECESTADO = ''C'' '
								 +  ' AND (CAJA302.TMONID = TGE103.TMONID (+) ) '
								 +  ' AND (CAJA302.PROV = CNT201.AUXID (+) '
								 +  ' AND CAJA302.CLAUXID = CNT201.CLAUXID (+) )'
								 +  ' AND (CAJA302.FPAGOID = TGE112.FPAGOID '
								 +  '  AND TGE112.F_MOVDIARIO = ''S'' )'

								 +' UNION ALL '

								 +'SELECT TGE110VW.DOCABR , '
								 +  ' DECODE(NVL(CXC303.CCSERIE,null),null,null,''-'')||CXC303.CCNODOC ECFCOMP, TGE103.TMONABR, '
								 +  ' CXC303.CCGLOSA ECGLOSA, '
								 +  ' 0 ECMTOLOC, '
								 +  ' 0 ECMTOEXT, '
								 +  ' ECCOBLOC ECMTOLOCI, '
								 +  ' ECCOBEXT ECMTOEXTI, '
								 +  ' TRUNC(CXC303.NCOTCAMB,2) ECTCAMB, '
								 +  ' CXC303.CLAUXID, CXC303.CLIEID PROV, CNT201.AUXNOMB, '
								 +  ' ''Ingresos''  EC_IE '
								 +' FROM CXC303, TGE110VW, TGE103, CNT201 '
								 +' WHERE CCFEMIS >= TO_DATE('''+ xFECHAINICIO   +''') '
								 +  ' AND CCFEMIS <= TO_DATE('''+ xFECHAFIN   +''') '
								 +  ' AND CIAID = ''' + xCIAID   +''' '
								 +  ' AND NCOESTADO = ''C'' '
								 +  ' AND CCTREC IN (''NP'',''RC'',''LI'') '
								 +  ' AND (CXC303.DOCID = TGE110VW.DOCID (+)) '
								 +  ' AND (CXC303.TMONID = TGE103.TMONID (+)) '
								 +  ' AND (CXC303.CLIEID = CNT201.AUXID (+) AND CXC303.CLAUXID = CNT201.CLAUXID (+) ) '
								 +' ORDER BY 11,2,1 ';
	 DMTE.cdsRec.Close;
	 DMTE.cdsRec.dataRequest(xSQL);
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
		 xSQL := 'INSERT INTO CAJARPT1_2(EC_IE,FPAGOID,MTOLOC,MTOEXT) '
					 +  '(SELECT EC_IE, FPAGOID, '
					 +     ' CASE WHEN TMONID ='''+DMTE.wTMonLoc+''' THEN DEC(SUM( COALESCE(ECMTOLOC,0) ),15,2) END MTOLOC, '
					 +     ' CASE WHEN TMONID ='''+DMTE.wTMonExt+''' THEN DEC(SUM( COALESCE(ECMTOEXT,0) ),15,2) END MTOEXT '
					 +   ' FROM CAJA302 '
					 +   ' WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') AND '
					 +     ' ECFCOMP >= DATE('''+ xFECHAINICIO   +''') AND '
					 +     ' ECFCOMP <= DATE('''+ xFECHAFIN      +''')AND '
					 +     ' CIAID = '''+ xCIAID   +''' AND '
					 +     ' EC_IE = ''E'' AND'
					 +     ' CASE WHEN (RTRIM(CCBCOID) = '''' OR (CCBCOID IS NULL)) THEN ''E'' ELSE COALESCE(ECCHKEST,''P'') END = ''E''   AND '
					 +     ' ECESTADO = ''C'' '
					 +   ' GROUP BY EC_IE, FPAGOID, TMONID ) '
		 else
			if DMTE.SRV_D = 'ORACLE' then
			 xsql := 'SELECT EC_IE, FPAGOID  ,'+
							 ' decode(TMONID,'+quotedstr(DMTE.wTMonLoc)+',SUM(nvl(ECMTOLOC,0))) MTOLOC,'+
							 ' decode(TMONID,'+quotedstr(DMTE.wTMonExt)+',SUM(nvl(ECMTOEXT,0))) MTOEXT'+
							 ' FROM CAJA302'+
							 //** 16/10/2001- pjsv Cambiar el codigo duro, queda pendiente
							 ' WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') AND'+
							 ' ECFCOMP >= TO_DATE('+quotedstr(xFECHAINICIO)+') AND'+
							 ' ECFCOMP <= TO_DATE('+quotedstr(xFECHAFIN)+') AND'  +
							 ' CIAID = '+quotedstr(xCIAID)+' AND  EC_IE = ''E'' AND'+
							 ' decode(TRIM(CCBCOID),null,''E'',nvl(ECCHKEST,''P'')) = ''E''   AND'+
							 '  ECESTADO = ''C'' GROUP BY EC_IE, FPAGOID, TMONID';


	 //** 04/07/2001  - pjsv
	 try
		DMTE.DCOM1.AppServer.EjecutaSQL(xSQL) ;
	 except
	 end;
	 //**

	 if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
	 xSQL := 'INSERT INTO CAJARPT1_2(EC_IE,FPAGOID,MTOLOC,MTOEXT) '
					 +  '(SELECT ''I'' EC_IE, FPAGOID, '
					 +     ' CASE WHEN TMONID = '''+DMTE.wTMonLoc+''' THEN DEC(SUM( COALESCE(FC_MTOLOC,0) ),15,2) END MTOLOC,'
					 +     ' CASE WHEN TMONID = '''+DMTE.wTMonExt+''' THEN DEC(SUM( COALESCE(FC_MTOEXT,0) ),15,2) END MTOEXT '
					 +   ' FROM CAJA314 '
					 +   ' WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') AND '
					 +     ' FC_FCANC >= DATE('''+ xFECHAINICIO +''') AND '
					 +     ' FC_FCANC <= DATE('''+ xFECHAFIN    +''') AND '
					 +     ' CIAID = '''+ xCIAID  +''' AND '
					 +     ' FC_ESTADO = ''C'' '
					 +  ' GROUP BY FPAGOID,TMONID)'
	 else
		if DMTE.SRV_D = 'ORACLE' then
			 xSQL := 'INSERT INTO CAJARPT1_2(EC_IE,FPAGOID,MTOLOC,MTOEXT) '
							 +    '(SELECT ''I'' EC_IE, FPAGOID, '
							 +       ' DECODE( TMONID , '''+DMTE.wTMonLoc+''' , TRUNC(SUM( NVL(FC_MTOLOC,0) ),2)) MTOLOC,'
							 +       ' DECODE( TMONID , '''+DMTE.wTMonLoc+''' , TRUNC(SUM( NVL(FC_MTOEXT,0) ),2)) MTOEXT '
							 +     ' FROM CAJA314 '
							 //** 17/10/2001- pjsv , cambiar codigo duro
							 +     ' WHERE (FPAGOID = ''01'' OR FPAGOID=''02'' OR FPAGOID=''04'') AND '
							 +       ' FC_FCANC >= TO_DATE('''+ xFECHAINICIO   +''') AND '
							 +       ' FC_FCANC <= TO_DATE('''+ xFECHAFIN   +''') AND '
							 +       ' CIAID = '''+ xCIAID   +''' AND '
							 +       ' FC_ESTADO = ''C'' '
							 +    ' GROUP BY FPAGOID,TMONID)' ;
	//** 04/07/2001 - pjsv
	try
	 DMTE.DCOM1.AppServer.EjecutaSQL(xSQL) ;
	except
	end;
	//**

 if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
		 xsql := 'SELECT CAJARPT1_2.FPAGOID, TGE112.FPAGODES,'+
									 ' SUM(CASE WHEN EC_IE = ''I'' THEN CASE WHEN NOT (MTOLOC IS NULL) THEN MTOLOC ELSE 0 END ELSE 0  END) AS MTOLOCI,'+
									 ' SUM(CASE WHEN EC_IE = ''I'' THEN CASE WHEN NOT (MTOEXT IS NULL) THEN MTOEXT ELSE 0 END ELSE 0  END) AS MTOEXTI,'+
									 ' SUM(CASE WHEN EC_IE = ''E'' THEN CASE WHEN NOT (MTOLOC IS NULL) THEN MTOLOC ELSE 0 END ELSE 0  END) AS MTOLOCE,'+
									 ' SUM(CASE WHEN EC_IE = ''E'' THEN CASE WHEN NOT (MTOEXT IS NULL) THEN MTOEXT ELSE 0 END ELSE 0  END) AS MTOEXTE'+
						 ' FROM CAJARPT1_2 '
							+' LEFT JOIN TGE112 ON (CAJARPT1_2.FPAGOID = TGE112.FPAGOID )'
							+' GROUP BY CAJARPT1_2.FPAGOID,TGE112.FPAGODES'
	else
	 if DMTE.SRV_D = 'ORACLE' then
			 xsql := 'SELECT CAJARPT1_2.FPAGOID, TGE112.FPAGODES,'+
										 ' SUM(DECODE(EC_IE , ''I'',NVL(MTOLOC, 0))) MTOLOCI,'+
										 ' SUM(DECODE(EC_IE , ''I'',NVL(MTOEXT, 0))) MTOEXTI,'+
										 ' SUM(DECODE(EC_IE , ''E'',NVL(MTOLOC, 0))) MTOLOCE,'+
										 ' SUM(DECODE(EC_IE , ''E'',NVL(MTOEXT, 0))) MTOEXTE' +
							 ' FROM CAJARPT1_2, TGE112 '
							 +' WHERE (CAJARPT1_2.FPAGOID = TGE112.FPAGOID )'
							 +' GROUP BY CAJARPT1_2.FPAGOID,TGE112.FPAGODES';
	 DMTE.cdsDescrip.Close;
	 DMTE.cdsDescrip.dataRequest(xSQL);
   DMTE.cdsDescrip.Open;
end;


end.

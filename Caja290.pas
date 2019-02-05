unit Caja290;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppComm,
  ppRelatv, ppCache, ppDB, ppDBPipe, StdCtrls, Buttons, ExtCtrls, DB,
  ppviewr, ppTypes, oaTE2000;
type
  TFVoucherImp = class(TForm)
    ppdbCntCaja: TppDBPipeline;
    pprContabilizado: TppReport;
    rgImp: TRadioGroup;
    bbtnVouOk: TBitBtn;
    bbtnVouCa: TBitBtn;
    ppHeaderBand2: TppHeaderBand;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppShape8: TppShape;
    lblCiaDes: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel6: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    lblPeriodo: TppLabel;
    lblDiario: TppLabel;
    lblProveedor: TppLabel;
    lblGlosa: TppLabel;
    lblTipoCamb: TppLabel;
    lblNoComp: TppLabel;
    ppLabel1: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    lblbanco: TppLabel;
    lblcuenta: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    lblnumchq: TppLabel;
    ppLabel21: TppLabel;
    lblmoneda: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel30: TppLabel;
    lblTD: TppLabel;
    ppLabel8: TppLabel;
    ppShape1: TppShape;
    lblImporte: TppLabel;
    ppLabel10: TppLabel;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLabel7: TppLabel;
    ppLabel15: TppLabel;
    pplblAnulado: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppLine4: TppLine;
    ppLine7: TppLine;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppDBText1: TppDBText;
    ppDBText14: TppDBText;
    ppDBText2: TppDBText;
    pptDesc: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    pplblMesDia: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppShape10: TppShape;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLine3: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLabel28: TppLabel;
    lblGiradoA: TppLabel;
    lblForma: TppLabel;
    procedure bbtnVouOkClick(Sender: TObject);
    procedure pprContabilizadoPreviewFormCreate(Sender: TObject);
    procedure bbtnVouCaClick(Sender: TObject);
    procedure ppDetailBand2BeforePrint(Sender: TObject);
    procedure ppVariable1Calc(Sender: TObject; var Value: Variant);
  private
    { Private declarations }
    xVoucherRTM : String;
    Procedure ImprimirComprobante(CabComprobante :RCabComprobante);
    Procedure ImprimirComprobantePreview(CabComprobante :RCabComprobante);    
  public
    { Public declarations }
    wComprobanteI: RCabComprobante;
    wBienedeForma : String;
    wOrigen : string;
  end;

var
  FVoucherImp  : TFVoucherImp;

implementation

uses CAJADM;

{$R *.DFM}

procedure TFVoucherImp.bbtnVouOkClick(Sender: TObject);
begin
  if rgImp.ItemIndex=0 then
     xVoucherRTM:= wRutaRpt + '\VoucherG.RTM'
  else
     xVoucherRTM:=wRutaRpt + '\VoucherD.RTM';
  if wOrigen='P' then
    ImprimirComprobantePreview( wComprobanteI )
  else
    ImprimirComprobante( wComprobanteI );
  wOrigen:='';
end;


Procedure TFVoucherImp.ImprimirComprobante(CabComprobante : RCabComprobante);
var
  xSQL : string;
  ssql,xfech, xliq : string;
  xTablaC : String;
begin

  xTablaC:='CNT301';

  with CabComprobante do
  begin
    if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
    {
      xSQL:='Select '
           +'CASE WHEN CNTDH=''D'' THEN SUBSTR( TGE110.DOCABR,1,5 ) ELSE '+QuotedStr(FPagoDes)+' END DOCMOD2, '
           +'CASE WHEN CNTDH=''D'' THEN '+xTablaC+'.CNTNODOC ELSE '+QuotedStr(Numchq)+' END DCNODOC,'
           +''+xTablaC+'.CIAID, '+xTablaC+'.TDIARID, '+xTablaC+'.CNTANOMM ECANOMM, '+xTablaC+'.CNTCOMPROB ECNOCOMP, '
           +''+xTablaC+'.CNTLOTE DCLOTE, '+xTablaC+'.DOCID, '+xTablaC+'.CNTSERIE DCSERIE, '
           +''+xTablaC+'.CNTFEMIS DCFEMIS, '+xTablaC+'.CNTFVCMTO DCFVCMTO, '+xTablaC+'.CUENTAID, '' '' CPTOID, '
           +''+xTablaC+'.CLAUXID, '+xTablaC+'.AUXID DCAUXID, '+xTablaC+'.CCOSID, '+xTablaC+'.CNTDH DCDH, '
           +''+xTablaC+'.CNTTCAMBIO DCTCAMPR, '+xTablaC+'.CNTTCAMBIO DCTCAMPA, '+xTablaC+'.TMONID, '+xTablaC+'.CNTMTOORI DCMTOORI, '
           +''+xTablaC+'.CNTMTOLOC DCMTOLO, '+xTablaC+'.CNTMTOEXT DCMTOEXT, '+xTablaC+'.CNTESTADO DCESTADO, '+xTablaC+'.CNTCUADRE DCFLACDR, '
           +''+xTablaC+'.CNTFAUTOM DCFLAAUT, '+xTablaC+'.CNTANO DCANO, '+xTablaC+'.CNTDD DCDD, '+xTablaC+'.CNTMM DCMM, '
           +''+xTablaC+'.CNTSS DCSS, '+xTablaC+'.CNTSEM DCSEM, '+xTablaC+'.CNTTRI DCTRI, '+xTablaC+'.CNTAASS DCAASS, '+xTablaC+'.CNTAASEM DCAASEM, '
           +''+xTablaC+'.CNTAATRI DCAATRI, '+xTablaC+'.FLAGVAR, '+xTablaC+'.CNTFCOMP ECFCOMP, '+xTablaC+'.CNTGLOSA DCGLOSA, '
           +'0 ECMTCON, '
           +''+xTablaC+'.CNTUSER DCUSER, '+xTablaC+'.CNTFREG DCFREG, '+xTablaC+'.CNTHREG DCHREG, '
           +''+xTablaC+'.CNTMODDOC, TGE202.CTADES '
           +'From '+xTablaC+' '
           +'LEFT JOIN TGE110 ON ('+xTablaC+'.DOCID=TGE110.DOCID and '+xTablaC+'.CNTMODDOC=TGE110.DOCMOD) '
           +'LEFT JOIN TGE202 ON ('+xTablaC+'.CIAID=TGE202.CIAID and '+xTablaC+'.CUENTAID=TGE202.CUENTAID) '
           +'Where '+xTablaC+'.CIAID='''     +Ciaid    +''' and '
           +      'CNTANOMM='''  +Periodo  +''' and '
           +      ''+xTablaC+'.TDIARID='''   +TDiarid  +''' and '
           +      'CNTCOMPROB='''+NoComp   +''' '
           +'Order By CNTDH'
           }
      xSQL:='Select '
           +'CASE WHEN DCDH=''D'' THEN SUBSTR( TGE110.DOCABR,1,5 ) ELSE '+QuotedStr(FPagoDes)+' END DOCMOD2, '
           +'CASE WHEN DCDH=''D'' THEN CAJA304.DCNODOC ELSE '+QuotedStr(Numchq)+' END DCNODOC,'
           +'CAJA304.CIAID, CAJA304.TDIARID, CAJA304.ECANOMM, CAJA304.ECNOCOMP, '
           +'CAJA304.DCLOTE, CAJA304.DOCID, CAJA304.DCSERIE, '
           +'CAJA304.DCFEMIS, CAJA304.DCFVCMTO, CAJA304.CPTOID, CAJA304.CUENTAID, '
           +'CAJA304.CLAUXID, CAJA304.DCAUXID, CAJA304.CCOSID, CAJA304.DCDH, '
           +'CAJA304.DCTCAMPR, CAJA304.DCTCAMPA, CAJA304.TMONID, CAJA304.DCMTOORI, '
           +'CAJA304.DCMTOLO, CAJA304.DCMTOEXT, CAJA304.DCESTADO, CAJA304.DCFLACDR, '
           +'CAJA304.DCFLAAUT, CAJA304.DCANO, CAJA304.DCDD, CAJA304.DCMM, '
           +'CAJA304.DCSS, CAJA304.DCSEM, CAJA304.DCTRI, CAJA304.DCAASS, CAJA304.DCAASEM, '
           +'CAJA304.DCAATRI, CAJA304.FLAGVAR, CAJA304.ECFCOMP, CAJA304.DCGLOSA, '
           +'CAJA304.ECMTCON, CAJA304.ECMTDIF, CAJA304.FCAB, '
           +'CAJA304.DCUSER, CAJA304.DCFREG, CAJA304.DCHREG, '
           +'CAJA304.DOCMOD, CAJA304.DOCMOD1, CAJA304.DOCMOD2, TGE202.CTADES '
           +'From CAJA304 '
           +'LEFT JOIN TGE110 ON (CAJA304.DOCID=TGE110.DOCID and CAJA304.DOCMOD=TGE110.DOCMOD) '
           +'LEFT JOIN TGE202 ON (CAJA304.CIAID=TGE202.CIAID and CAJA304.CUENTAID=TGE202.CUENTAID) '
           +'Where CAJA304.CIAID='''   +Ciaid    +''' and '
           +      'CAJA304.ECANOMM=''' +Periodo  +''' and '
           +      'CAJA304.TDIARID=''' +TDiarid  +''' and '
           +      'CAJA304.ECNOCOMP='''+NoComp   +''' '
           +'Order By CAJA304.DCDH'
      else
      xSQL:='Select '
            +   'CAJA304.CIAID, CAJA304.TDIARID, CAJA304.ECANOMM, CAJA304.ECNOCOMP, '
            +   'CAJA304.DCLOTE, CAJA304.DOCID, CAJA304.DCSERIE, CAJA304.DCNODOC, '
            +   'CAJA304.DCFEMIS, CAJA304.DCFVCMTO, CAJA304.CPTOID, CAJA304.CUENTAID, '
            +   'CAJA304.CLAUXID, CAJA304.DCAUXID, CAJA304.CCOSID, CAJA304.DCDH, '
            +   'CAJA304.DCTCAMPR, CAJA304.DCTCAMPA, CAJA304.TMONID, CAJA304.DCMTOORI, '
            +   'CAJA304.DCMTOLO, CAJA304.DCMTOEXT, CAJA304.DCESTADO, CAJA304.DCFLACDR, '
            +   'CAJA304.DCFLAAUT, CAJA304.DCANO, CAJA304.DCDD, CAJA304.DCMM, '
            +   'CAJA304.DCSS, CAJA304.DCSEM, CAJA304.DCTRI, CAJA304.DCAASS, CAJA304.DCAASEM, '
            +   'CAJA304.DCAATRI, CAJA304.FLAGVAR, CAJA304.ECFCOMP, CAJA304.DCGLOSA, '
            +   'CAJA304.ECMTCON, CAJA304.ECMTDIF, CAJA304.FCAB, SUBSTR( TGE110.DOCABR,1,5 ) AS DOCMOD2, '
            +   'CAJA304.DCUSER, CAJA304.DCFREG, CAJA304.DCHREG, '
            +   'CAJA304.DOCMOD, CAJA304.DOCMOD1, CAJA304.DOCMOD2, TGE202.CTADES '
           +'From CAJA304, TGE110, TGE202 '
           +'Where CAJA304.CIAID='''   +Ciaid    +''' and '
           +    'CAJA304.ECANOMM=''' +Periodo  +''' and '
           +    'CAJA304.TDIARID=''' +TDiarid  +''' and '
					 +    'CAJA304.ECNOCOMP='''+NoComp   +''' '
					 +    'AND (CAJA304.DOCID=TGE110.DOCID (+) and CAJA304.DOCMOD=TGE110.DOCMOD (+) ) '
					 +    'AND (CAJA304.CIAID=TGE202.CIAID (+) and CAJA304.CUENTAID=TGE202.CUENTAID(+))'
					 +'Order By CAJA304.DCDH';
			DMTE.cdsCNTCaja.Close;
			DMTE.cdsCNTCaja.DataRequest( xSQL );
			DMTE.cdsCNTCaja.Open;
	end;
	ppdbCntCaja.DataSource := DMTE.dsCNTCaja;

	pprContabilizado.Template.FileName := xVoucherRTM;
	pprContabilizado.Template.LoadFromFile;

	with CabComprobante do
	begin
		 lblForma.caption    := Forma;
		 lblCiades.Caption   := CiaDes ;
		 lblDiario.Caption   := Diario  ;
		 lblTD.Caption       := TDiarid ;
		 lblProveedor.Caption:= Proveedor ;
		 lblGiradoA.Caption  := GiradoA;
		 lblGlosa.Caption    := Glosa ;
		 lblTipoCamb.Caption := FloatToStrF(StrToFloat(TipoCamb),ffNumber,10,3);
		 lblPeriodo.Caption  := Periodo ;
		 lblNoComp.Caption   := NoComp ;
		 lblcuenta.caption   := Cuenta ;
		 lblbanco.caption    := Banco ;
		 lblnumchq.caption   := Numchq ;
		 lblmoneda.caption   := Moneda ;
		 lblmoneda.caption:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONABR','TMONID='+quotedstr(TMoneda),'TMONABR');

		 if TMoneda=DMTE.wTMonLoc then
				lblImporte.Caption  := lblmoneda.caption+FloatToStrF(StrToFloat(Importe),ffNumber,15,2)
		 else
				lblImporte.Caption  := lblmoneda.caption+FloatToStrF(StrToFloat(Importe),ffNumber,15,2);

		 If TMoneda = DMTE.wTMonLoc then
			begin
			 ppLabel1.Visible := false;
			 ppDBText1.Visible:= false;
			 ppLabel12.Visible:= false;
			 ppDBText2.Visible:= false;
			end;
	end;
 //** 07/03/2001 - pjsv - para el # de liquidacion
	xfech := formatdatetime(DMTE.wFormatFecha,date);
	ssql := 'SELECT * FROM CAJA310 WHERE BANCOID='+quotedstr('00')+
					' AND STFECHA='+quotedstr(xfech);
	DMTE.cdsQry3.Close;
	DMTE.cdsQry3.DataRequest(ssql);
	DMTE.cdsQry3.Open;
	xliq := DMTE.cdsQry3.fieldbyname('NUMLIQ').AsString;
	//**
//   pplblLiquida.Caption := xliq;
  If wBienedeForma = 'EXTORNO' then
    pplblAnulado.Visible := True;
  pprContabilizado.Print;
  pprContabilizado.Stop;
  ppdbCntCaja.DataSource := nil ;
  DMTE.cdsCNTCaja.Close;
end;

procedure TFVoucherImp.pprContabilizadoPreviewFormCreate(Sender: TObject);
begin
   pprContabilizado.PreviewForm.ClientHeight := 560;
   pprContabilizado.PreviewForm.ClientWidth  := 740;
   TppViewer(pprContabilizado.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
end;


procedure TFVoucherImp.bbtnVouCaClick(Sender: TObject);
begin
   Close;
end;

procedure TFVoucherImp.ppDetailBand2BeforePrint(Sender: TObject);
var
 xMesDia : string;
begin
   xMesDia := Copy(DMTE.cdsCNTCaja.fieldbyname('DCFEMIS').AsString,1,2);
   xMesDia := xMesDia + Copy(DMTE.cdsCNTCaja.fieldbyname('DCFEMIS').AsString,4,2);
   pplblMesDia.Caption := xMesDia;
   if DMTE.cdsCNTCaja.fieldbyname('DCDH').AsString='H' then
     ppDBText3.visible:=False
   else
     ppDBText3.visible:=True;
end;

procedure TFVoucherImp.ppVariable1Calc(Sender: TObject;
  var Value: Variant);
begin
   value:= DMTE.DisplayDescrip('prvTGE','CNT201','AUXNOMB','CLAUXID='+quotedstr(DMTE.cdscntcaja.fieldbyname('CLAUXID').AsString)+' AND AUXID='
           +quotedstr(DMTE.cdscntcaja.fieldbyname('DCAUXID').AsString),'AUXNOMB');
end;

procedure TFVoucherImp.ImprimirComprobantePreview(
  CabComprobante: RCabComprobante);
var
  xSQL : string;
  ssql,xfech, xliq : string;
begin
  with CabComprobante do
  begin
    if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
      xSQL:='Select '
           +'CASE WHEN DCDH=''D'' THEN SUBSTR( TGE110.DOCABR,1,5 ) ELSE '+QuotedStr(FPagoDes)+' END DOCMOD2, '
           +'CASE WHEN DCDH=''D'' THEN CAJA501.DCNODOC ELSE '+QuotedStr(Numchq)+' END DCNODOC,'
           +'CAJA501.CIAID, CAJA501.TDIARID, CAJA501.ECANOMM, CAJA501.ECNOCOMP, '
           +'CAJA501.DCLOTE, CAJA501.DOCID, CAJA501.DCSERIE, '
           +'CAJA501.DCFEMIS, CAJA501.DCFVCMTO, CAJA501.CPTOID, CAJA501.CUENTAID, '
           +'CAJA501.CLAUXID, CAJA501.DCAUXID, CAJA501.CCOSID, CAJA501.DCDH, '
           +'CAJA501.DCTCAMPR, CAJA501.DCTCAMPA, CAJA501.TMONID, CAJA501.DCMTOORI, '
           +'CAJA501.DCMTOLO, CAJA501.DCMTOEXT, CAJA501.DCESTADO, CAJA501.DCFLACDR, '
           +'CAJA501.DCFLAAUT, CAJA501.DCANO, CAJA501.DCDD, CAJA501.DCMM, '
           +'CAJA501.DCSS, CAJA501.DCSEM, CAJA501.DCTRI, CAJA501.DCAASS, CAJA501.DCAASEM, '
           +'CAJA501.DCAATRI, CAJA501.FLAGVAR, CAJA501.ECFCOMP, CAJA501.DCGLOSA, '
           +'CAJA501.ECMTCON, CAJA501.ECMTDIF, CAJA501.FCAB, '
           +'CAJA501.DCUSER, CAJA501.DCFREG, CAJA501.DCHREG, '
           +'CAJA501.DOCMOD, CAJA501.DOCMOD1, CAJA501.DOCMOD2, TGE202.CTADES '
           +'From CAJA501 '
           +'LEFT JOIN TGE110 ON (CAJA501.DOCID=TGE110.DOCID and CAJA501.DOCMOD=TGE110.DOCMOD) '
           +'LEFT JOIN TGE202 ON (CAJA501.CIAID=TGE202.CIAID and CAJA501.CUENTAID=TGE202.CUENTAID) '
           +'Where CAJA501.CIAID='''   +Ciaid    +''' and '
           +      'CAJA501.ECANOMM=''' +Periodo  +''' and '
           +      'CAJA501.TDIARID=''' +TDiarid  +''' and '
           +      'CAJA501.ECNOCOMP='''+NoComp   +''' '
           +'Order By CAJA501.DCDH'
      else
      xSQL:='Select '
            +   'CAJA501.CIAID, CAJA501.TDIARID, CAJA501.ECANOMM, CAJA501.ECNOCOMP, '
            +   'CAJA501.DCLOTE, CAJA501.DOCID, CAJA501.DCSERIE, CAJA501.DCNODOC, '
            +   'CAJA501.DCFEMIS, CAJA501.DCFVCMTO, CAJA501.CPTOID, CAJA501.CUENTAID, '
            +   'CAJA501.CLAUXID, CAJA501.DCAUXID, CAJA501.CCOSID, CAJA501.DCDH, '
            +   'CAJA501.DCTCAMPR, CAJA501.DCTCAMPA, CAJA501.TMONID, CAJA501.DCMTOORI, '
            +   'CAJA501.DCMTOLO, CAJA501.DCMTOEXT, CAJA501.DCESTADO, CAJA501.DCFLACDR, '
            +   'CAJA501.DCFLAAUT, CAJA501.DCANO, CAJA501.DCDD, CAJA501.DCMM, '
            +   'CAJA501.DCSS, CAJA501.DCSEM, CAJA501.DCTRI, CAJA501.DCAASS, CAJA501.DCAASEM, '
            +   'CAJA501.DCAATRI, CAJA501.FLAGVAR, CAJA501.ECFCOMP, CAJA501.DCGLOSA, '
            +   'CAJA501.ECMTCON, CAJA501.ECMTDIF, CAJA501.FCAB, SUBSTR( TGE110.DOCABR,1,5 ) AS DOCMOD2, '
            +   'CAJA501.DCUSER, CAJA501.DCFREG, CAJA501.DCHREG, '
            +   'CAJA501.DOCMOD, CAJA501.DOCMOD1, CAJA501.DOCMOD2, TGE202.CTADES '
           +'From CAJA501, TGE110, TGE202 '
           +'Where CAJA501.CIAID='''   +Ciaid    +''' and '
           +    'CAJA501.ECANOMM=''' +Periodo  +''' and '
           +    'CAJA501.TDIARID=''' +TDiarid  +''' and '
           +    'CAJA501.ECNOCOMP='''+NoComp   +''' '
           +    'AND (CAJA501.DOCID=TGE110.DOCID (+) and CAJA501.DOCMOD=TGE110.DOCMOD (+) ) '
           +    'AND (CAJA501.CIAID=TGE202.CIAID (+) and CAJA501.CUENTAID=TGE202.CUENTAID(+))'
           +'Order By CAJA501.DCDH';

      DMTE.cdsQry3.Close;
      DMTE.cdsQry3.DataRequest( xSQL );
      DMTE.cdsQry3.Open;
  end;
  ppdbCntCaja.DataSource := DMTE.dsQry3;

  pprContabilizado.Template.FileName := xVoucherRTM;
  pprContabilizado.Template.LoadFromFile;

  with CabComprobante do
  begin
     lblForma.caption    := Forma;
     lblCiades.Caption   := CiaDes ;
     lblDiario.Caption   := Diario  ;
     lblTD.Caption       := TDiarid ;
     lblProveedor.Caption:= Proveedor ;
     lblGiradoA.Caption   := GiradoA;
     lblGlosa.Caption    := Glosa ;
     lblTipoCamb.Caption := FloatToStrF(StrToFloat(TipoCamb),ffNumber,10,3);
     lblPeriodo.Caption  := Periodo ;
     lblNoComp.Caption   := NoComp ;
     lblcuenta.caption   := Cuenta ;
     lblbanco.caption    := Banco ;
     lblnumchq.caption   := Numchq ;
     lblmoneda.caption   := Moneda ;
     lblmoneda.caption:=DMTE.DisplayDescrip('prvTGE','TGE103','TMONABR','TMONID='+quotedstr(TMoneda),'TMONABR');

     if TMoneda=DMTE.wTMonLoc then
        lblImporte.Caption  := lblmoneda.caption+FloatToStrF(StrToFloat(Importe),ffNumber,15,2)
     else
        lblImporte.Caption  := lblmoneda.caption+FloatToStrF(StrToFloat(Importe),ffNumber,15,2);

     If TMoneda = DMTE.wTMonLoc then
      begin
       ppLabel1.Visible := false;
       ppDBText1.Visible:= false;
       ppLabel12.Visible:= false;
       ppDBText2.Visible:= false;
      end;
  end;
 //** 07/03/2001 - pjsv - para el # de liquidacion
  xfech := formatdatetime(DMTE.wFormatFecha,date);
  ssql := 'SELECT * FROM CAJA310 WHERE BANCOID='+quotedstr('00')+
          ' AND STFECHA='+quotedstr(xfech);
  DMTE.cdsQry3.Close;
  DMTE.cdsQry3.DataRequest(ssql);
  DMTE.cdsQry3.Open;
  xliq := DMTE.cdsQry3.fieldbyname('NUMLIQ').AsString;
  //**
//   pplblLiquida.Caption := xliq;
  If wBienedeForma = 'EXTORNO' then
    pplblAnulado.Visible := True;
  pprContabilizado.Print;
  pprContabilizado.Stop;
  ppdbCntCaja.DataSource := nil ;
  DMTE.cdsQry3.Close;

end;

end.

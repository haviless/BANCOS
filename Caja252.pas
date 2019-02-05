unit Caja252;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, wwdbedit, wwdblook, ExtCtrls, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppCache, ppDBPipe, Spin;

type
  TFImpBloComp = class(TForm)
    Label1: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    dblctdiario: TwwDBLookupCombo;
    Label24: TLabel;
    dbetdiario: TwwDBEdit;
    edtCompFin: TEdit;
    Label2: TLabel;
    edtCompIni: TEdit;
    Label26: TLabel;
    Label25: TLabel;
    Z2bbtnCanc3: TBitBtn;
    ppdbComprob: TppDBPipeline;
    pprComprob: TppReport;
    gbPer: TGroupBox;
    speAno: TSpinEdit;
    speMM: TSpinEdit;
    ppHeaderBand2: TppHeaderBand;
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
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    pplblFecha: TppLabel;
    pplblPeriodo: TppLabel;
    pplblTcam: TppLabel;
    pplblDiario: TppLabel;
    pplblComp: TppLabel;
    pplblLote: TppLabel;
    pplblTmon: TppLabel;
    ppLabel12: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
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
    ppDBText5: TppDBText;
    ppDetailBand2: TppDetailBand;
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
    ppSummaryBand2: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
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
    ppDBText11: TppDBText;
    pplblestadoC: TppLabel;
    pplblbancoC: TppLabel;
    pplblPeriodoD: TppLabel;
    pplblimporte: TppLabel;
    pplblletras: TppLabel;
    Z2bbtnImp: TBitBtn;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText26: TppDBText;
    pplblProv: TppLabel;
    pplblgirado: TppLabel;
    BBtnAsientoComp: TBitBtn;
    procedure dblcCiaExit(Sender: TObject);
    procedure dblctdiarioExit(Sender: TObject);
    procedure Z2bbtnRegistra3Click(Sender: TObject);
    procedure ppHeaderBand2BeforePrint(Sender: TObject);
    procedure edtCompIniExit(Sender: TObject);
    procedure edtCompFinExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z1sbInformesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure speMMExit(Sender: TObject);
    procedure Z2bbtnImpClick(Sender: TObject);
    procedure BBtnAsientoCompClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    xperiodo:string;
  public
    { Public declarations }
  end;

var
  FImpBloComp: TFImpBloComp;

implementation

uses CajaDM, CAJAUTIL, oaTE2000;
{$R *.DFM}

procedure TFImpBloComp.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text:='';
   if dblcCia.Text<>'' then edtCia.Text:=DMTE.cdsCia.FieldByName('CIADES').AsString;
   if length(edtCia.Text)=0 then
   begin
      dblcCia.setfocus;

      raise exception.Create('Falta registrar la Compañía');
   end;

end;

procedure TFImpBloComp.dblctdiarioExit(Sender: TObject);
begin
   if dblctdiario.Text<>'' then dbetdiario.Text:=DMTE.cdsTDiario.FieldByName('TDIARDES').AsString;

   if length(dbetdiario.Text)=0 then
   begin
      dblctdiario.setfocus;
      raise exception.Create('Falta registrar el Tipo de Diario');
   end;

end;

procedure TFImpBloComp.Z2bbtnRegistra3Click(Sender: TObject);
var
xsql:string;
x10:integer;
begin
{      if length(dblcCia.text)=0 then
      begin
        dblcCia.setfocus;
        raise exception.Create('Falta registrar la Compañía');
      end;

      if length(dblctdiario.text)=0 then
      begin
        dblctdiario.setfocus;
        raise exception.Create('Falta registrar el tipo de Diario');
      end;

      if length(edtCompIni.text)=0 then
      begin
        edtCompIni.setfocus;
        raise exception.Create('Falta registrar el Comprobante Inicial');
      end;

      if length(edtCompFin.text)=0 then
      begin
        edtCompFin.setfocus;
        raise exception.Create('Falta registrar el Comprobante Final');
      end;
{      if (length(edtperiodo.text)<7)  or (length(edtperiodo.text)>7) then
      begin
        edtCompFin.setfocus;

        raise exception.Create('Debe registar corectamente el Periodo');
      end;}


  {   xSQL:= 'SELECT CNTREG,CIAID,CUENTAID,CNTMTOORI,CNTFVCMTO,CNTFEMIS,CNTGLOSA,CNTDH, '
           + 'AUXID,CLAUXID,DOCID,CNTSERIE,CNTNODOC,CCOSID,CNTDEBEMN,CNTDEBEME, '
           + 'CNTHABEMN,CNTHABEME,TDIARID,CNTCUADRE,CNTESTADO,CNTCOMPROB,CNTMTOLOC, '
           + 'CNTMTOEXT,CTADES,AUXDES,DOCDES,CCOSDES,TDIARDES,CNTANO,CNTANOMM, '
           + 'CNTLOTE,CNT301.TMONID,CNTTCAMBIO,CNTTS,CNTMODDOC,CNTFCOMP,CNTUSER,CNTFREG, '
           + 'CNTHREG,CNTMM,CNTDD,CNTTRI,CNTSEM,CNTSS,CNTLOTE,CNTAATRI,CNTAASEM,CNTAASS, CNTFAUTOM,TMONDES '
           + 'FROM CNT301, TGE103 WHERE '
           + 'CNT301.TMONID=TGE103.TMONID AND '
           + ' CIAID='''+dblcCia.text+''' AND TDIARID='''+dblctdiario.text
           + ''' AND CNTANOMM='''+periodo+''' AND CNTCOMPROB >='+''''+edtCompIni.Text+''''
           + ' and CNTCOMPROB <='+''''+edtCompFin.Text+''''
           +' ORDER BY CNTCOMPROB' ;

      DMTE.cdsMovCnt1.Close;
      DMTE.cdsMovCnt1.DataRequest(xSQL);
      DMTE.cdsMovCnt1.Open;

      if DMTE.cdsMovCnt1.recordcount=0 then
         raise exception.Create('No existen registros para la consulta');

      pprComprob.TEMPLATE.FileName := ExtractFilePath( application.ExeName ) + wRutaRpt + '\Comprobante.rtm';
      pprComprob.template.LoadFromFile ;

      DMTE.cdsMovCnt1.indexfieldnames:='CNTCOMPROB';
      pprComprob.Print;
      pprComprob.Stop;

      x10:=self.componentCount-1;
      while x10>0 do begin
        if self.components[x10].classname='TppGroup' then begin
           self.components[x10].free;
        end;
        x10:=x10-1;
      end;

      DMTE.cdsMovCnt1.indexfieldnames:='';

 }

 {   xSQL:='Select * From TGE202 where CIAID ='+''''+dblcCIA.Text+''''+
          ' and CTANIV <='+''''+dblcNivel.Text+''''+
          ' and CUENTAID >='+''''+dblcdCtaInic.Text+''''+
          ' and CUENTAID <='+''''+dblcdCtaFinal.Text+''''+
          ' order By CUENTAID';
    DMTE.cdsCuenta3.Close;
    DMTE.cdsCuenta3.DataRequest(xSQL);
    DMTE.cdsCuenta3.Open;

    pplblCia.Caption  :=edtCia.Text;
    pplblNivel.Caption:=dblcNivel.Text;
    pprPlanCtas.Print;
}
end;

procedure TFImpBloComp.ppHeaderBand2BeforePrint(Sender: TObject);
var
 xwhere,XSQL:String;
begin

      pplblimporte.caption:=     DMTE.cdsCNT311.FieldByName('TMONABR').AsString+' '+FloatToStrF( DMTE.cdsCNT311.FieldByName('ECMTOORI').AsFloat, ffnumber, 15,2 );
      pplblletras.caption     := '** '+Trim( strNum( DMTE.cdsCNT311.FieldByName('ECMTOORI').AsFloat ) )+' '+DMTE.cdsCNT311.FieldByName('TMONDES').AsString+' **';
      pplblbancoC.caption:=DMTE.cdsCNT311.FieldByName('BANCOID').AsString+' '+DMTE.cdsCNT311.FieldByName('BANCONOM').AsString;
      pplblprov.caption:=DMTE.cdsCNT311.FieldByName('AUXID').AsString+' '+DMTE.cdsCNT311.FieldByName('ECGIRA').AsString;
      pplblgirado.caption:=DMTE.cdsCNT311.FieldByName('ECGIRA').AsString;
end;

procedure TFImpBloComp.edtCompIniExit(Sender: TObject);
begin
  edtCompIni.text:=DMTE.StrZero(edtCompIni.text,10);

end;

procedure TFImpBloComp.edtCompFinExit(Sender: TObject);
begin
  edtCompFin.text:=DMTE.StrZero(edtCompFin.text,10);

end;

procedure TFImpBloComp.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;

end;

procedure TFImpBloComp.Z1sbInformesClick(Sender: TObject);
var
  xsql,periodo,xwhere,mesdes,mes,ano:string;
  CNTDet , xWA, xWA1 : String;
  x10:integer;
begin
      if length(dblcCia.text)=0 then
      begin
        dblcCia.setfocus;
        raise exception.Create('Falta registrar la Compañía');
      end;

      if length(dblctdiario.text)=0 then
      begin
        dblctdiario.setfocus;
        raise exception.Create('Falta registrar el tipo de Diario');
      end;

      if length(edtCompIni.text)=0 then
      begin
        edtCompIni.setfocus;
        raise exception.Create('Falta registrar el Comprobante Inicial');
      end;

      if length(edtCompFin.text)=0 then
      begin
        edtCompFin.setfocus;
        raise exception.Create('Falta registrar el Comprobante Final');
      end;
      if length(speano.text)=0  then
      begin
        speano.setfocus;
        raise exception.Create('Debe registar el Año');
      end;

      if length(speMM.text)=0  then
      begin
        speMM.setfocus;
        raise exception.Create('Debe registar el Mes');
      end;

      xperiodo:=trim(speano.text)+trim( DMTE.StrZero( spemm.text,2) );

      try

//			DMTE.ppdbVoucher.DataSource:=DMTE.dsCNT311;

			CNTDet:='CNT301';

         pprComprob.TEMPLATE.FileName:=wRutaRpt + '\ComprobanteBloque.rtm';
         pprComprob.template.LoadFromFile ;

         xsql:='SELECT * FROM CAJA302 WHERE EC_PROCE=''B'' AND ECCONTA=''S'''
             +' AND  CIAID='''+dblcCia.Text+''' AND TDIARID='''
             +dblctdiario.Text+''' AND ECANOMM='''+speAno.Text+speMM.text
             +''' AND (ECNOCOMP>='''+edtCompIni.Text
             +''' AND ECNOCOMP<='''+edtCompFin.Text+''') ORDER BY ECNOCOMP';
         DMTE.cdsQry.Close;
         DMTE.cdsQry.DataRequest(XSQL);
         DMTE.cdsQry.Open;
         DMTE.cdsQry.first;


			xWA:='';
         xWA1:='';

			if CNTDet='CNT301' then begin

		   if DMTE.cdsQry.Active then
         begin
          while not DMTE.cdsQry.Eof do
          begin

                if Copy( DMTE.cdsQry.FieldByName('ECPERREC').AsString,1,2)='1.' then
                begin
                     xWA:='or '
                         +'( A.CIAID='     +quotedstr(Copy(DMTE.cdsQry.FieldByName('ECPERREC').AsString, 4, 2))+' AND '
                         +  'A.CNTANOMM='  +quotedstr( speAno.Text+speMM.text  )            +' AND '
                         +  'A.TDIARID='   +quotedstr(Copy(DMTE.cdsQry.FieldByName('ECPERREC').AsString, 7, 2))+' AND '
                         +  'A.CNTCOMPROB='+quotedstr(Copy(DMTE.cdsQry.FieldByName('ECPERREC').AsString,10,10))+' AND '
                         +  'A.CIAID=B.CIAID ) '
                         +'or '
                         +'( A.CIAID='     +quotedstr(Copy(DMTE.cdsQry.FieldByName('ECPERREC').AsString,25, 2))+' AND '
                         +  'A.CNTANOMM='  +quotedstr( speAno.Text+speMM.text  )            +' AND '
                         +  'A.TDIARID='   +quotedstr(Copy(DMTE.cdsQry.FieldByName('ECPERREC').AsString,28, 2))+' AND '
                         +  'A.CNTCOMPROB='+quotedstr(Copy(DMTE.cdsQry.FieldByName('ECPERREC').AsString,31,10))+' AND '
                         +  'A.CIAID=B.CIAID ) '+xwa1 ;

                    XWA1:=xWA;
                end;
                DMTE.cdsQry.next;
          End;
		   end;


			xsql:='SELECT A.*, B.CIADES FROM CNT301 A, TGE101 B  '
							+'WHERE ( A.CIAID='     +quotedstr( dblcCia.text  ) +' AND '
							+        'A.CNTANOMM='  +quotedstr( speAno.text+speMM.text ) +' AND '
							+        'A.TDIARID='   +quotedstr( dblctdiario.text   ) +' AND '
							+        '(A.CNTCOMPROB>='+quotedstr( edtCompIni.text  ) +' AND A.CNTCOMPROB<='
                     +                         quotedstr( edtCompFin.text  )
                     +') AND '
							+        'A.CIAID=B.CIAID ) '
							+        xWA
							+'ORDER BY A.CNTCOMPROB,A.CIAID, A.CNTANOMM, A.TDIARID, A.CNTREG';

                     //							+'ORDER BY A.CIAID, A.CNTANOMM, A.TDIARID, A.CNTREG';
			DMTE.cdsCNT311.Close;
			DMTE.cdsCNT311.DataRequest(xSQL);
			DMTE.cdsCNT311.Open;

			if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
			begin
						xSQL:=      'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, ';
						xSQL:=xSQL+   'A.CNTGLOSA, A.CNTTCAMBIO, CNTESTADO, A.CNTFCOMP, C.TMONDES, ';
						xSQL:=xSQL+   'A.TMONID, B.CCBCOID, B.ECNOCHQ, B.ECGIRA, ECMTOORI, ';
						xSQL:=xSQL+   'C.TMONDES, C.TMONABR, B.PROV||''  ''||D.AUXNOMB PROV, B.BANCOID||'' ''||E.BANCONOM BANCOID ';
						xSQL:=xSQL+ 'FROM '+CNTDet+' A, CAJA302 B ';
						xSQL:=xSQL+   'LEFT JOIN CNT201 D ON ( D.CLAUXID=B.CLAUXID AND D.AUXID=B.PROV ), ';
						xSQl:=xSQL+   ' TGE103 C, TGE105 E ';
						xSQL:=xSQL+ 'WHERE ( A.CIAID='''     + dblcCia.text  +''' AND ';
						xSQL:=xSQL+         'A.TDIARID='''   + dblctdiario.text   +''' AND ';
						xSQL:=xSQL+         'A.CNTANOMM='''  + speAno.text+speMM.text +''' AND ';
						xSQL:=xSQL+         '(A.CNTCOMPROB>='''+ edtCompIni.text  +''' AND A.CNTCOMPROB<='''+edtCompFin.Text+''') ) ';
						xSQL:=xSQL+  ' AND   A.CNTREG=1 AND ';
						xSQL:=xSQL+         'B.CIAID='''    + dblcCia.text  +''' AND ';
						xSQL:=xSQL+         'B.TDIARID='''  + dblctdiario.text   +''' AND ';
						xSQL:=xSQL+         'B.ECANOMM='''  + speAno.text+speMM.text +''' AND ';
						xSQL:=xSQL+         'B.ECNOCOMP=A.CNTCOMPROB ';
						xSQL:=xSQL+  ' and   C.TMONID=A.TMONID ';
						xSQL:=xSQL+  ' and   E.BANCOID=B.BANCOID ';
			end;
			if DMTE.SRV_D = 'ORACLE' then
			begin
						xSQL:=      'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, ';
						xSQL:=xSQL+   'A.CNTGLOSA, A.CNTTCAMBIO, CNTESTADO, A.CNTFCOMP, ';
						xSQL:=xSQL+   'A.TMONID, B.CCBCOID, B.ECNOCHQ, B.ECGIRA, ECMTOORI, ';
						xSQL:=xSQL+   'C.TMONDES, C.TMONABR, B.PROV||''  ''||D.AUXNOMB PROV, B.BANCOID||'' ''||E.BANCONOM BANCOID ';
						xSQL:=xSQL+ 'FROM '+CNTDet+' A, CAJA302 B, CNT201 D, TGE103 C, TGE105 E ';
						xSQL:=xSQL+ 'WHERE ( A.CIAID='''     + dblcCia.text  +''' AND ';
						xSQL:=xSQL+         'A.TDIARID='''   + dblctdiario.text   +''' AND ';
						xSQL:=xSQL+         'A.CNTANOMM='''  + speAno.text+speMM.text +''' AND ';
						xSQL:=xSQL+         '(A.CNTCOMPROB>='''+ edtCompIni.text   +'''  AND A.CNTCOMPROB<='''+edtCompFin.TEXT+''') ) ';
						xSQL:=xSQL+  ' AND   A.CNTREG=1 AND ';
						xSQL:=xSQL+         'B.CIAID='''    + dblcCia.text  +''' AND ';
						xSQL:=xSQL+         'B.TDIARID='''  + dblctdiario.text   +''' AND ';
						xSQL:=xSQL+         'B.ECANOMM='''  + speAno.text+speMM.text +''' AND ';
						xSQL:=xSQL+         'B.ECNOCOMP=A.CNTCOMPROB ';
						xSQL:=xSQL+  ' and   C.TMONID=A.TMONID ';
						xSQL:=xSQL+  ' and   D.CLAUXID(+)=A.CLAUXID AND D.AUXID(+)=A.AUXID ';
						xSQL:=xSQL+  ' and   E.BANCOID=B.BANCOID ';
			end;

			DMTE.cdsQry3.Close;
			DMTE.cdsQry3.DataRequest( xSQL );
			DMTE.cdsQry3.Open;
			end;
			DMTE.cdsQry3.Edit;
			DMTE.cdsQry3.Post;


			if CNTDet='CNT301' then
         bEGIN
				 DMTE.pplblEstado.Caption:= DMTE.pplblEstado.Caption + ' Contabilizado';
             pplblestadoC.CAPTION:=pplblestadoC.CAPTION+' Contabilizado';
         END
			else begin
				 DMTE.pplblEstado.Caption:=DMTE.pplblEstado.Caption +' Preliminar';
      end;

      mes:=copy(DMTE.cdsCNT311.FieldByName('CNTANOMM').AsString,5,2);
      ano:=copy(DMTE.cdsCNT311.FieldByName('CNTANOMM').AsString,1,4);

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

      DMTE.pplblPeriodo.caption := 'Periodo   : ';
      pplblPeriodoD.caption:=mesdes+' '+ano;

//      DMTE.pplblTMon.Caption    := DMTE.pplblTMon.Caption+' '+DMTE.cdsQry3.FieldByName('TMONDES').AsString;

//      DMTE.pplModulo.Caption     := 'Modulo: CAJA';
//      DMTE.pplLetras.Caption     := '** '+Trim( strNum( DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat ) )+' '+DMTE.cdsQry3.FieldByName('TMONDES').AsString+' **';



     pprComprob.print;
     pprComprob.stop;

      x10:=DMTE.ComponentCount-1;
      while x10>0 do begin
        if DMTE.components[x10].classname='TppGroup' then begin
           DMTE.components[x10].free;
        end;
        x10:=x10-1;
      end;
   finally
//      FSOLConta.Free;
   end;




end;

procedure TFImpBloComp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMTE.cdsQry.IndexFieldNames := '';
  DMTE.cdsQry.Filter := '';
  DMTE.cdsQry.Filtered := False;
  DMTE.cdsQry.close;

  DMTE.cdsQry3.IndexFieldNames := '';
  DMTE.cdsQry3.Filter := '';
  DMTE.cdsQry3.Filtered := False;
  DMTE.cdsQry3.close;

  DMTE.cdsCNT311.IndexFieldNames := '';
  DMTE.cdsCNT311.Filter := '';
  DMTE.cdsCNT311.Filtered := False;
  DMTE.cdsCNT311.close;


{      DMTE.cdsMovCNT2.close;
      DMTE.cdsMovCNT2.DataRequest('SELECT * FROM CNT301 WHERE CIAID=''99''');
      DMTE.cdsmovcnt2.Open;
      }
      end;

procedure TFImpBloComp.speMMExit(Sender: TObject);
var
  XSQL:String;
begin
   if length(dblcCia.text)=0 then
   begin
     dblcCia.setfocus;
     raise exception.Create('Falta registrar la Compañía');
   end;

   if length(dblctdiario.text)=0 then
   begin
     dblctdiario.setfocus;
     raise exception.Create('Falta registrar el tipo de Diario');
   end;

   if length(speano.text)=0  then
   begin
     speano.setfocus;
     raise exception.Create('Debe registar el Año');
   end;

   if length(speMM.text)=0  then
   begin
     speMM.setfocus;
     raise exception.Create('Debe registar el Mes');
   end;
   if length(speMM.text)=1 then
     speMM.text:='0'+speMM.text;



   if FRegistro.xForname='PAGOPROV' then
   Begin
      xsql:='SELECT * FROM CAJA302 WHERE EC_PROCE=''B'' AND ECCONTA=''S'''
          +' AND  CIAID='''+dblcCia.Text+''' AND TDIARID='''
          +dblctdiario.Text+''' AND ECANOMM='''+speAno.Text+speMM.text
          +''' ORDER BY ECNOCOMP';
   End;
   if FRegistro.xForname='PAGONOPROV' then
   Begin
      xsql:='SELECT * FROM CAJA302 WHERE EC_PROCE=''1'' AND ECCONTA=''S'''
          +' AND  CIAID='''+dblcCia.Text+''' AND TDIARID='''
          +dblctdiario.Text+''' AND ECANOMM='''+speAno.Text+speMM.text
          +''' ORDER BY ECNOCOMP';
   End;

   if FRegistro.xForname='PAGOPROVBANCO' then
   Begin
      xsql:='SELECT * FROM CAJA302 WHERE EC_PROCE=''3'' AND ECCONTA=''S'''
          +' AND  CIAID='''+dblcCia.Text+''' AND TDIARID='''
          +dblctdiario.Text+''' AND ECANOMM='''+speAno.Text+speMM.text
          +''' ORDER BY ECNOCOMP';
   End;

   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(XSQL);
   DMTE.cdsQry.Open;

   IF DMTE.cdsQry.RecordCount=0 then
   Begin
     Showmessage('No Existen Datos para la Consulta');
     edtCompIni.text:='';
     edtCompFin.text:='';
     Z2bbtnImp.Enabled:=False;
     Exit;
   End;

   DMTE.cdsQry.First;
   edtCompIni.text:=DMTE.cdsQry.fieldbyname('ECNOCOMP').asstring;
   DMTE.cdsQry.Last;
   edtCompFin.text:=DMTE.cdsQry.fieldbyname('ECNOCOMP').asstring;
   Z2bbtnImp.Enabled:=True;
   if LENGTH(DMTE.cdsQry.fieldbyname('ECPERREC').asstring)>0 Then
      BBtnAsientoComp.visible:=True
   else
      BBtnAsientoComp.visible:=False;


end;

procedure TFImpBloComp.Z2bbtnImpClick(Sender: TObject);
var
  xsql,periodo,xwhere,mesdes,mes,ano:string;
  CNTDet , xWA, xWA1 : String;
  x10:integer;
begin
      if length(dblcCia.text)=0 then
      begin
        dblcCia.setfocus;
        raise exception.Create('Falta registrar la Compañía');
      end;

      if length(dblctdiario.text)=0 then
      begin
        dblctdiario.setfocus;
        raise exception.Create('Falta registrar el tipo de Diario');
      end;

      if length(edtCompIni.text)=0 then
      begin
        edtCompIni.setfocus;
        raise exception.Create('Falta registrar el Comprobante Inicial');
      end;

      if length(edtCompFin.text)=0 then
      begin
        edtCompFin.setfocus;
        raise exception.Create('Falta registrar el Comprobante Final');
      end;
      if length(speano.text)=0  then
      begin
        speano.setfocus;
        raise exception.Create('Debe registar el Año');
      end;

      if length(speMM.text)=0  then
      begin
        speMM.setfocus;
        raise exception.Create('Debe registar el Mes');
      end;
      xperiodo:=trim(speano.text)+trim( DMTE.StrZero( spemm.text,2) );

      try

			CNTDet:='CNT301';

         pprComprob.TEMPLATE.FileName:=wRutaRpt + '\ComprobanteBloque.rtm';
         pprComprob.template.LoadFromFile ;

         if FRegistro.xForname='PAGOPROV' then
         Begin
            xsql:='SELECT * FROM CAJA302 WHERE EC_PROCE=''B'' AND ECCONTA=''S'''
                +' AND  CIAID='''+dblcCia.Text+''' AND TDIARID='''
                +dblctdiario.Text+''' AND ECANOMM='''+speAno.Text+speMM.text
                +''' AND (ECNOCOMP>='''+edtCompIni.Text
                +''' AND ECNOCOMP<='''+edtCompFin.Text+''') ORDER BY ECNOCOMP';
          End;
         if FRegistro.xForname='PAGONOPROV' then
         Begin
            xsql:='SELECT * FROM CAJA302 WHERE EC_PROCE=''1'' AND ECCONTA=''S'''
                +' AND  CIAID='''+dblcCia.Text+''' AND TDIARID='''
                +dblctdiario.Text+''' AND ECANOMM='''+speAno.Text+speMM.text
                +''' AND (ECNOCOMP>='''+edtCompIni.Text
                +''' AND ECNOCOMP<='''+edtCompFin.Text+''') ORDER BY ECNOCOMP';
          End;

         if FRegistro.xForname='PAGOPROVBANCO' then
         Begin
            xsql:='SELECT * FROM CAJA302 WHERE EC_PROCE=''3'' AND ECCONTA=''S'''
                +' AND  CIAID='''+dblcCia.Text+''' AND TDIARID='''
                +dblctdiario.Text+''' AND ECANOMM='''+speAno.Text+speMM.text
                +''' AND (ECNOCOMP>='''+edtCompIni.Text
                +''' AND ECNOCOMP<='''+edtCompFin.Text+''') ORDER BY ECNOCOMP';
          End;


         DMTE.cdsQry.Close;
         DMTE.cdsQry.DataRequest(XSQL);
         DMTE.cdsQry.Open;
         DMTE.cdsQry.first;

			xWA:='';
         xWA1:='';

			if CNTDet='CNT301' then begin

		   if DMTE.cdsQry.Active then
         begin
          while not DMTE.cdsQry.Eof do
          begin

                if Copy( DMTE.cdsQry.FieldByName('ECPERREC').AsString,1,2)='1.' then
                begin
                     xWA:='or '
                         +'( A.CIAID='     +quotedstr(Copy(DMTE.cdsQry.FieldByName('ECPERREC').AsString, 4, 2))+' AND '
                         +  'A.CNTANOMM='  +quotedstr( speAno.Text+speMM.text  )            +' AND '
                         +  'A.TDIARID='   +quotedstr(Copy(DMTE.cdsQry.FieldByName('ECPERREC').AsString, 7, 2))+' AND '
                         +  'A.CNTCOMPROB='+quotedstr(Copy(DMTE.cdsQry.FieldByName('ECPERREC').AsString,10,10))+' AND '
                         +  'A.CIAID=B.CIAID ) '
                         +'or '
                         +'( A.CIAID='     +quotedstr(Copy(DMTE.cdsQry.FieldByName('ECPERREC').AsString,25, 2))+' AND '
                         +  'A.CNTANOMM='  +quotedstr( speAno.Text+speMM.text  )            +' AND '
                         +  'A.TDIARID='   +quotedstr(Copy(DMTE.cdsQry.FieldByName('ECPERREC').AsString,28, 2))+' AND '
                         +  'A.CNTCOMPROB='+quotedstr(Copy(DMTE.cdsQry.FieldByName('ECPERREC').AsString,31,10))+' AND '
                         +  'A.CIAID=B.CIAID ) '+xwa1 ;

                    XWA1:=xWA;
                end;
                DMTE.cdsQry.next;
          End;
		   end;

         IF  LENGTH(DMTE.cdsQry.FieldByName('ECPERREC').AsString)=0 THEN
         Begin
//			 xsql:='SELECT A.*, B.CIADES,C.PROV AS AUXID1,C.ECGIRA AS GIRADO,C.CCBCOID AS CTACTE,'
//                     +' C.ECNOCHQ AS CHEQUE,D.TMONDES AS TMONDES, E.BANCONOM,'
			 xsql:='SELECT A.*, A.CNTCOMPROB COMPROBANTE, B.CIADES,C.PROV AS AUXID1,C.ECGIRA AS GIRADO,C.CCBCOID AS CTACTE,'
                     +' C.ECNOCHQ AS CHEQUE,D.TMONDES AS TMONDES, E.BANCONOM, C.ECGLOSA, C.ECGIRA, '
                     +' C.ECMTOORI AS ECMTOORI, D.TMONABR,C.BANCOID BANCOID,C.ECGLOSA AS CNTGLOSA  '
                     +' FROM CNT301 A, TGE101 B  , CAJA302 C, TGE103 D, TGE105 E '
							+'WHERE ( ( A.CIAID='     +quotedstr( dblcCia.text  ) +' AND '
							+        'A.CNTANOMM='  +quotedstr( speAno.text+speMM.text ) +' AND '
							+        'A.TDIARID='   +quotedstr( dblctdiario.text   ) +' AND '
							+        '(A.CNTCOMPROB>='+quotedstr( edtCompIni.text  ) +' AND A.CNTCOMPROB<='
                     +                         quotedstr( edtCompFin.text  )
                     +') AND '
							+        'A.CIAID=B.CIAID ) '
							+        xWA
                     +' ) AND ('
                     +'  C.CIAID='''+dblcCia.text+''' AND C.ECANOMM='''+speAno.text+speMM.text
                     +''' AND C.TDIARID='''+dblctdiario.text
                     +''' AND (C.ECNOCOMP=A.CNTCOMPROB '
                     +') AND  C.TMONID=D.TMONID AND C.BANCOID=E.BANCOID)'

							+'ORDER BY A.CNTCOMPROB,A.CIAID, A.CNTANOMM, A.TDIARID, A.CNTREG';
         End;

         IF  LENGTH(DMTE.cdsQry.FieldByName('ECPERREC').AsString)>0 THEN
         Begin
         XSQL:=' SELECT A.CIAID,A.TDIARID,A.CNTANOMM,A.COMPROBANTE ,A.CNNTREG  , '
               +' A.PROV AS AUXID,A.ECGIRA,A.ECGLOSA, '
               +' A.CCBCOID AS CTACTE,A.ECNOCHQ AS CHEQUE , '
               +' A.CNTGLOSA AS CNTGLOSA, A.BANCOID,C.BANCONOM,A.ECMTOORI,E.CIADES,A.TMONID, '
               +' A.TMONDES,A.TMONABR,A.CUENTAID,A.CNTFCOMP '
               +' ,A.CNTDEBEMN,A.CNTHABEMN,A.CNTDEBEME,A.CNTHABEME,A.CNTMTOORI, '
               +' A.CNTSERIE,A.CNTUSER,A.CNTNODOC,A.CNTLOTE,A.TDIARDES,A.CNTTCAMBIO '
               +' ,A.CNTFEMIS,A.CNTREG,A.CCOSID '
               +'   FROM '
               +'( SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, B.ECPERREC, '
               +' A.CNTCOMPROB  AS COMPROBANTE, 1 CNNTREG,B.PROV ,B.ECGIRA,B.ECGLOSA, '
               +' B.CCBCOID,B.ECNOCHQ,B.BANCOID,B.ECMTOORI,A.TMONID,C.TMONDES,C.TMONABR, '
               +' A.CUENTAID,A.CNTFCOMP,A.CNTDEBEMN,A.CNTHABEMN,A.CNTDEBEME,A.CNTHABEME, '
               +' A.CNTMTOORI,A.CNTSERIE,A.CNTUSER,A.CNTNODOC,A.CNTLOTE,A.TDIARDES, '
               +' A.CNTTCAMBIO,A.CNTFEMIS,A.CNTREG,A.CCOSID,A.CNTGLOSA '
               +' FROM '
               +' (  SELECT CIAID, CNTANOMM, TDIARID, CNTCOMPROB,TMONID,CUENTAID, '
               +'  CNTFCOMP,CNTDEBEMN,CNTHABEMN,CNTDEBEME,CNTHABEME,CNTMTOORI, '
               +'  CNTSERIE,CNTUSER,CNTNODOC,CNTLOTE,TDIARDES,CNTTCAMBIO, '
               +'  CNTFEMIS,CNTREG,CCOSID,CNTGLOSA '
               +'  FROM CNT301 A '
               +'  WHERE A.CIAID='''+dblcCia.TEXT+''' AND A.CNTANOMM='''+speAno.TEXT+speMM.TEXT
               +''' AND A.TDIARID='''+dblctdiario.text+''''
               +' AND  ( A.CNTCOMPROB>='''+edtCompIni.text+''' AND A.CNTCOMPROB<='''
               +edtCompFin.text+''') '
               +'  ) A, CAJA302 B,TGE103 C '
               +'  WHERE A.CIAID=B.CIAID AND A.TDIARID=B.TDIARID AND '
               +' A.CNTANOMM=B.ECANOMM AND A.CNTCOMPROB=B.ECNOCOMP '
               +'  AND A.TMONID=C.TMONID '
               +' )A, TGE105 C, TGE101 E '
               +' WHERE  A.CIAID=E.CIAID '
               +' AND A.BANCOID=C.BANCOID '
               +'ORDER BY CIAID,TDIARID,CNTANOMM,COMPROBANTE,CNTREG ';

      {   XSQL:=' SELECT A.CIAID,A.TDIARID,A.CNTANOMM,A.COMPROBANTE ,A.CNNTREG '
             +' ,A.PROV AS AUXID,A.ECGIRA,A.ECGLOSA,B.CUENTAID,B.CNTFCOMP,B.CNTDEBEMN,B.CNTHABEMN, '
             +' B.CNTDEBEME,B.CNTHABEME,B.CNTMTOORI,B.CNTUSER,A.CCBCOID AS CTACTE,A.ECNOCHQ AS CHEQUE'
             +' ,B.CNTSERIE,B.CNTNODOC,A.ECGLOSA AS CNTGLOSA,B.CNTLOTE,B.TDIARDES,B.CNTTCAMBIO, '
             +' A.BANCOID,C.BANCONOM,D.TMONDES,D.TMONABR,A.ECMTOORI,E.CIADES,B.CNTFEMIS'
             +',B.CNTREG,B.CCOSID  '
             +' FROM '
             +' ( SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, B.ECPERREC,'
             +' A.CNTCOMPROB  AS COMPROBANTE, 1 CNNTREG,B.PROV ,B.ECGIRA,B.ECGLOSA, '
             +' B.CCBCOID,B.ECNOCHQ,B.BANCOID,B.ECMTOORI '
             +' FROM   ( '
             +' SELECT CIAID, CNTANOMM, TDIARID, CNTCOMPROB FROM CNT301 A '
             +'  WHERE A.CIAID='''+dblcCia.text+''' AND A.CNTANOMM='''+speAno.text+speMM.text
             +''' AND A.TDIARID='''+dblctdiario.text+''' AND '
             +' ( A.CNTCOMPROB>='''+edtCompIni.Text+''' AND A.CNTCOMPROB<='''+edtCompFin.text+''') '
             +' ) A, CAJA302 B '
             +' WHERE A.CIAID=B.CIAID AND A.TDIARID=B.TDIARID AND A.CNTANOMM=B.ECANOMM AND A.CNTCOMPROB=B.ECNOCOMP '
             +' UNION '
             +' SELECT SUBSTR(ECPERREC,4,2) CIAID, SUBSTR(ECPERREC,7,2) TDIARID, A.CNTANOMM, '
             +' SUBSTR(ECPERREC,10,10) CNTCOMPROB, '' '',A.CNTCOMPROB AS COMPROBANTE, 2 CNNTREG, '
             +' B.PROV ,B.ECGIRA,B.ECGLOSA,B.CCBCOID,B.ECNOCHQ,B.BANCOID,B.ECMTOORI '
             +'   FROM '
             +' (  SELECT CIAID, CNTANOMM, TDIARID, CNTCOMPROB FROM CNT301 A '
             +'  WHERE A.CIAID='''+dblcCia.text+''' AND A.CNTANOMM='''+speAno.text+speMM.text
             +''' AND A.TDIARID='''+dblctdiario.text+''' AND '
             +' ( A.CNTCOMPROB>='''+edtCompIni.Text+''' AND A.CNTCOMPROB<='''+edtCompFin.text+''') '
             +'  ) A, CAJA302 B '
             +' WHERE A.CIAID=B.CIAID AND A.TDIARID=B.TDIARID '
             +' AND A.CNTANOMM=B.ECANOMM AND A.CNTCOMPROB=B.ECNOCOMP '
             +' UNION '
             +' SELECT SUBSTR(ECPERREC,25,2) CIAID, SUBSTR(ECPERREC,28,2) TDIARID, A.CNTANOMM, '
             +' SUBSTR(ECPERREC,31,10) CNTCOMPROB, '' '', A.CNTCOMPROB AS COMPROBANTE,3 CNNTREG, '
             +' B.PROV,B.ECGIRA,B.ECGLOSA,B.CCBCOID,B.ECNOCHq,B.BANCOID, B.ECMTOORI '
             +' FROM '
             +' ( SELECT CIAID, CNTANOMM, TDIARID, CNTCOMPROB FROM CNT301 A '
             +'  WHERE A.CIAID='''+dblcCia.text+''' AND A.CNTANOMM='''+speAno.text+speMM.text
             +''' AND A.TDIARID='''+dblctdiario.text+''' AND '
             +' ( A.CNTCOMPROB>='''+edtCompIni.Text+''' AND A.CNTCOMPROB<='''+edtCompFin.text+''') '
             +'  ) A, CAJA302 B '
             +' WHERE A.CIAID=B.CIAID '
             +' AND A.TDIARID=B.TDIARID '
             +' AND A.CNTANOMM=B.ECANOMM '
             +' AND A.CNTCOMPROB=B.ECNOCOMP '
             +' )A,CNT301 B, TGE105 C,TGE103 D, TGE101 E '
             +' WHERE '
             +' A.CIAID=B.CIAID '
             +' AND A.CIAID=E.CIAID '
             +' AND A.TDIARID=B.TDIARID '
             +' AND A.CNTANOMM=B.CNTANOMM '
             +' AND A.COMPROBANTE=B.CNTCOMPROB '
             +' AND A.BANCOID=C.BANCOID '
             +' AND D.TMONID=B.TMONID '
             +' ORDER BY A.CIAID,A.COMPROBANTE,A.CNNTREG,B.CNTREG ';
       }


         End;

			DMTE.cdsCNT311.Close;
			DMTE.cdsCNT311.DataRequest(xSQL);
			DMTE.cdsCNT311.Open;

			if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
			begin
						xSQL:=      'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, ';
						xSQL:=xSQL+   'A.CNTGLOSA, A.CNTTCAMBIO, CNTESTADO, A.CNTFCOMP, C.TMONDES, ';
						xSQL:=xSQL+   'A.TMONID, B.CCBCOID, B.ECNOCHQ, B.ECGIRA, ECMTOORI, ';
						xSQL:=xSQL+   'C.TMONDES, C.TMONABR, B.PROV||''  ''||D.AUXNOMB PROV, B.BANCOID||'' ''||E.BANCONOM BANCOID ';
						xSQL:=xSQL+ 'FROM '+CNTDet+' A, CAJA302 B ';
						xSQL:=xSQL+   'LEFT JOIN CNT201 D ON ( D.CLAUXID=B.CLAUXID AND D.AUXID=B.PROV ), ';
						xSQl:=xSQL+   ' TGE103 C, TGE105 E ';
						xSQL:=xSQL+ 'WHERE ( A.CIAID='''     + dblcCia.text  +''' AND ';
						xSQL:=xSQL+         'A.TDIARID='''   + dblctdiario.text   +''' AND ';
						xSQL:=xSQL+         'A.CNTANOMM='''  + speAno.text+speMM.text +''' AND ';
						xSQL:=xSQL+         '(A.CNTCOMPROB>='''+ edtCompIni.text  +''' AND A.CNTCOMPROB<='''+edtCompFin.Text+''') ) ';
						xSQL:=xSQL+  ' AND   A.CNTREG=1 AND ';
						xSQL:=xSQL+         'B.CIAID='''    + dblcCia.text  +''' AND ';
						xSQL:=xSQL+         'B.TDIARID='''  + dblctdiario.text   +''' AND ';
						xSQL:=xSQL+         'B.ECANOMM='''  + speAno.text+speMM.text +''' AND ';
						xSQL:=xSQL+         'B.ECNOCOMP=A.CNTCOMPROB ';
						xSQL:=xSQL+  ' and   C.TMONID=A.TMONID ';
						xSQL:=xSQL+  ' and   E.BANCOID=B.BANCOID ';
			end;
			if DMTE.SRV_D = 'ORACLE' then
			begin
						xSQL:=      'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, ';
						xSQL:=xSQL+   'A.CNTGLOSA, A.CNTTCAMBIO, CNTESTADO, A.CNTFCOMP, ';
						xSQL:=xSQL+   'A.TMONID, B.CCBCOID, B.ECNOCHQ, B.ECGIRA, ECMTOORI, ';
						xSQL:=xSQL+   'C.TMONDES, C.TMONABR, B.PROV||''  ''||D.AUXNOMB PROV, B.BANCOID||'' ''||E.BANCONOM BANCOID ';
						xSQL:=xSQL+ 'FROM '+CNTDet+' A, CAJA302 B, CNT201 D, TGE103 C, TGE105 E ';
						xSQL:=xSQL+ 'WHERE ( A.CIAID='''     + dblcCia.text  +''' AND ';
						xSQL:=xSQL+         'A.TDIARID='''   + dblctdiario.text   +''' AND ';
						xSQL:=xSQL+         'A.CNTANOMM='''  + speAno.text+speMM.text +''' AND ';
						xSQL:=xSQL+         '(A.CNTCOMPROB>='''+ edtCompIni.text   +'''  AND A.CNTCOMPROB<='''+edtCompFin.TEXT+''') ) ';
						xSQL:=xSQL+  ' AND   A.CNTREG=1 AND ';
						xSQL:=xSQL+         'B.CIAID='''    + dblcCia.text  +''' AND ';
						xSQL:=xSQL+         'B.TDIARID='''  + dblctdiario.text   +''' AND ';
						xSQL:=xSQL+         'B.ECANOMM='''  + speAno.text+speMM.text +''' AND ';
						xSQL:=xSQL+         'B.ECNOCOMP=A.CNTCOMPROB ';
						xSQL:=xSQL+  ' and   C.TMONID=A.TMONID ';
						xSQL:=xSQL+  ' and   D.CLAUXID(+)=A.CLAUXID AND D.AUXID(+)=A.AUXID ';
						xSQL:=xSQL+  ' and   E.BANCOID=B.BANCOID ';
			end;

			DMTE.cdsQry3.Close;
			DMTE.cdsQry3.DataRequest( xSQL );
			DMTE.cdsQry3.Open;
			end;
			DMTE.cdsQry3.Edit;
			DMTE.cdsQry3.Post;

			if CNTDet='CNT301' then
         bEGIN
				 DMTE.pplblEstado.Caption:= DMTE.pplblEstado.Caption + ' Contabilizado';
             pplblestadoC.CAPTION:=pplblestadoC.CAPTION+' Contabilizado';
         END
			else begin
				 DMTE.pplblEstado.Caption:=DMTE.pplblEstado.Caption +' Preliminar';
      end;

      mes:=copy(DMTE.cdsCNT311.FieldByName('CNTANOMM').AsString,5,2);
      ano:=copy(DMTE.cdsCNT311.FieldByName('CNTANOMM').AsString,1,4);

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

      DMTE.pplblPeriodo.caption := 'Periodo   : ';
      pplblPeriodoD.caption:=mesdes+' '+ano;
      pprComprob.print;
      pprComprob.stop;

      x10:=DMTE.ComponentCount-1;
      while x10>0 do begin
        if DMTE.components[x10].classname='TppGroup' then begin
           DMTE.components[x10].free;
        end;
        x10:=x10-1;
      end;
   finally
   end;
end;


procedure TFImpBloComp.BBtnAsientoCompClick(Sender: TObject);
var
  xsql,periodo,xwhere,mesdes,mes,ano:string;
  CNTDet , xWA, xWA1 : String;
  x10:integer;

begin
      if length(dblcCia.text)=0 then
      begin
        dblcCia.setfocus;
        raise exception.Create('Falta registrar la Compañía');
      end;

      if length(dblctdiario.text)=0 then
      begin
        dblctdiario.setfocus;
        raise exception.Create('Falta registrar el tipo de Diario');
      end;

      if length(edtCompIni.text)=0 then
      begin
        edtCompIni.setfocus;
        raise exception.Create('Falta registrar el Comprobante Inicial');
      end;

      if length(edtCompFin.text)=0 then
      begin
        edtCompFin.setfocus;
        raise exception.Create('Falta registrar el Comprobante Final');
      end;
      if length(speano.text)=0  then
      begin
        speano.setfocus;
        raise exception.Create('Debe registar el Año');
      end;

      if length(speMM.text)=0  then
      begin
        speMM.setfocus;
        raise exception.Create('Debe registar el Mes');
      end;
      xperiodo:=trim(speano.text)+trim( DMTE.StrZero( spemm.text,2) );

    try
         pprComprob.TEMPLATE.FileName:=wRutaRpt + '\ComprobanteBloque.rtm';
         pprComprob.template.LoadFromFile ;

    XSQL:='SELECT A.CIAID AS CIAIDX, SUBSTR(A.ECPERREC,4,2) AS CIAID,'
      +' SUBSTR(A.ECPERREC,7,2) TDIARID, A.TDIARID AS TDIARIDX, '
      +' A.ECANOMM,A.ECNOCOMP,A.ECPERREC,B.CNTANOMM,SUBSTR(A.ECPERREC,10,10) COMPROBANTE, '
      +' 2 CNTNREG,A.PROV AS AUXID, A.ECGIRA,A.ECGLOSA,A.CCBCOID AS CTACTE,A.ECNOCHQ AS CHEQUE, '
      +' B.CNTGLOSA,A.BANCOID,C.BANCONOM,A.ECMTOORI,B.CNTMTOORI, '
      +' D.CIADES,A.TMONID, '
      +' E.TMONDES,E.TMONABR,B.CUENTAID,B.CNTFCOMP,B.CNTDEBEMN,B.CNTHABEMN,B.CNTDEBEME '
      +' ,B.CNTHABEME,B.CNTMTOORI,B.CNTSERIE,B.CNTUSER,B.CNTNODOC,B.CNTLOTE,B.TDIARDES, '
      +' B.CNTTCAMBIO,B.CNTFEMIS,B.CNTREG,B.CCOSID '
      +' FROM '
      +' (SELECT CIAID,TDIARID,ECANOMM,ECNOCOMP,ECPERREC,PROV,ECGIRA,ECGLOSA, '
      +'   CCBCOID,ECNOCHQ,BANCOID,ECMTOORI,TMONID '
      +' FROM CAJA302 WHERE CIAID='''+dblcCia.text+''' AND TDIARID='''+dblctdiario.text
      +''' AND ECANOMM='''+speAno.text+speMM.text+''''
      +' AND ECNOCOMP>='''+edtCompIni.text+''' AND ECNOCOMP<='''+edtCompFin.text+''') A, '
      +' CNT301 B,TGE105 C, TGE101 D, TGE103 E '
      +' WHERE  SUBSTR(A.ECPERREC,4,2)=B.CIAID '
      +' AND SUBSTR(A.ECPERREC,7,2)=B.TDIARID '
      +' AND SUBSTR(A.ECPERREC,10,10)=B.CNTCOMPROB '
      +' AND B.CNTANOMM='''+speAno.text+speMM.text+''' AND A.BANCOID=C.BANCOID '
      +' AND A.TMONID=E.TMONID '
      +' AND SUBSTR(A.ECPERREC,4,2)=D.CIAID '
      +' UNION ALL '
      +'SELECT A.CIAID AS CIAIDX, SUBSTR(A.ECPERREC,25,2) AS CIAID,'
      +' SUBSTR(A.ECPERREC,28,2) TDIARID, A.TDIARID AS TDIARIDX, '
      +' A.ECANOMM,A.ECNOCOMP,A.ECPERREC,B.CNTANOMM,SUBSTR(A.ECPERREC,31,10) COMPROBANTE, '
      +' 2 CNTNREG,A.PROV AS AUXID, A.ECGIRA,A.ECGLOSA,A.CCBCOID AS CTACTE,A.ECNOCHQ AS CHEQUE, '
      +' B.CNTGLOSA,A.BANCOID,C.BANCONOM,A.ECMTOORI,B.CNTMTOORI, '
      +' D.CIADES,A.TMONID, '
      +' E.TMONDES,E.TMONABR,B.CUENTAID,B.CNTFCOMP,B.CNTDEBEMN,B.CNTHABEMN,B.CNTDEBEME '
      +' ,B.CNTHABEME,B.CNTMTOORI,B.CNTSERIE,B.CNTUSER,B.CNTNODOC,B.CNTLOTE,B.TDIARDES, '
      +' B.CNTTCAMBIO,B.CNTFEMIS,B.CNTREG,B.CCOSID '
      +' FROM '
      +' (SELECT CIAID,TDIARID,ECANOMM,ECNOCOMP,ECPERREC,PROV,ECGIRA,ECGLOSA, '
      +'   CCBCOID,ECNOCHQ,BANCOID,ECMTOORI,TMONID '
      +' FROM CAJA302 WHERE CIAID='''+dblcCia.text+''' AND TDIARID='''+dblctdiario.text
      +''' AND ECANOMM='''+speAno.text+speMM.text+''''
      +' AND ECNOCOMP>='''+edtCompIni.text+''' AND ECNOCOMP<='''+edtCompFin.text+''') A, '
      +' CNT301 B,TGE105 C, TGE101 D, TGE103 E '
      +' WHERE  SUBSTR(A.ECPERREC,25,2)=B.CIAID '
      +' AND SUBSTR(A.ECPERREC,28,2)=B.TDIARID '
      +' AND SUBSTR(A.ECPERREC,31,10)=B.CNTCOMPROB '
      +' AND B.CNTANOMM='''+speAno.text+speMM.text+''' AND A.BANCOID=C.BANCOID '
      +' AND A.TMONID=E.TMONID '
      +' AND SUBSTR(A.ECPERREC,25,2)=D.CIAID '
      +' ORDER BY CIAID,TDIARID,COMPROBANTE,CNTREG';


		DMTE.cdsCNT311.Close;
		DMTE.cdsCNT311.DataRequest(xSQL);
		DMTE.cdsCNT311.Open;

      DMTE.pplblEstado.Caption:= DMTE.pplblEstado.Caption + ' Contabilizado';
      pplblestadoC.CAPTION:=pplblestadoC.CAPTION+' Contabilizado';
      mes:=copy(DMTE.cdsCNT311.FieldByName('CNTANOMM').AsString,5,2);
      ano:=copy(DMTE.cdsCNT311.FieldByName('CNTANOMM').AsString,1,4);

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

      DMTE.pplblPeriodo.caption := 'Periodo   : ';
      pplblPeriodoD.caption:=mesdes+' '+ano;
      pprComprob.print;
      pprComprob.stop;

      x10:=DMTE.ComponentCount-1;
      while x10>0 do begin
        if DMTE.components[x10].classname='TppGroup' then begin
           DMTE.components[x10].free;
        end;
        x10:=x10-1;
      end;
   finally
//      FSOLConta.Free;
   end;



end;

procedure TFImpBloComp.FormCreate(Sender: TObject);
begin
BBtnAsientoComp.visible:=False;
end;

end.

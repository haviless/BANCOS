unit Caja284;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, wwdbedit, wwdbdatetimepicker, wwdblook,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid;

type
  TFContabTarCre = class(TForm)
    wwDBGrid1: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    lblTDiario: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    Label15: TLabel;
    dtpFComp: TwwDBDateTimePicker;
    Label20: TLabel;
    edtPeriodo: TEdit;
    lblNoReg: TLabel;
    dbeNoComp: TwwDBEdit;
    edtCia: TEdit;
    edtTDiario: TEdit;
    bbtnGraba: TBitBtn;
    bbtnContab: TBitBtn;
    bbtnImprime: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure dtpFCompExit(Sender: TObject);
    procedure bbtnGrabaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnContabClick(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContabTarCre: TFContabTarCre;

implementation

{$R *.dfm}

USES CAJADM, DB;

procedure TFContabTarCre.BitBtn1Click(Sender: TObject);
var
   dFecIni, dFecFin : TDate;
   xSQL, cMes : String;
   nMes : Integer;
begin
   dFecIni:=StrTodate('01/'+Copy(edtPeriodo.Text,5,2)+'/'+Copy(edtPeriodo.Text,1,4));
   cMes:=Copy(edtPeriodo.Text,5,2);
   if cMes='12' then
      dFecFin:=StrTodate('31/'+Copy(edtPeriodo.Text,5,2)+'/'+Copy(edtPeriodo.Text,1,4))
   else
   begin
      nMes:=StrToInt(Copy(edtPeriodo.Text,5,2))+1;
      dFecFin:=StrTodate('01/'+ DMTE.StrZero(IntToStr(nMes),2) +'/'+Copy(edtPeriodo.Text,1,4))-1;
   end;
   xSQL:='Select * from CAJ_TAR_CRE_DET '
        +'where CIAID='''+dblcCia.text+''' and FECHA>='''+DateToStr(dFecIni)+''' and FECHA<='''+DateToStr(dFecFin)+'''';
   DMTE.cdsTarCreTransf.Close;
   DMTE.cdsTarCreTransf.DataRequest( xSQL );
   DMTE.cdsTarCreTransf.Open;
end;

procedure TFContabTarCre.dtpFCompExit(Sender: TObject);
var
  xWhere : String;
begin
   edtPeriodo.Text:=Copy(DateToStr(dtpFComp.Date), 7, 4)
                   +Copy(DateToStr(dtpFComp.Date), 4, 2);

   if Trim( dblcTDiario.Text) <> '' then
   begin
       xWhere:='CIAID='+QuotedStr(dblcCia.Text)+' AND CNTCOMPROB='+QuotedStr(edtPeriodo.Text)
              +' AND TDIARID='+ QuotedStr(dblcTDiario.Text);
      dbeNoComp.Text := DMTE.UltimoNum('prvCaja', 'CNT300', 'CNTCOMPROB', xWhere);
      dbeNoComp.Text := DMTE.StrZero(dbeNoComp.Text, 10);
   end;
end;

procedure TFContabTarCre.bbtnGrabaClick(Sender: TObject);
var
  nTotAbono : Double;
begin
  if DMTE.wModo='A' then
  begin
     DMTE.cdsCreCNT.Insert;
     DMTE.cdsCreCNT.FieldByName('CIAID').AsString   := dblcCia.Text;
     DMTE.cdsCreCNT.FieldByName('TDIARID').AsString := dblcTDiario.text;
     DMTE.cdsCreCNT.FieldByName('ECANOMM').AsString := edtPeriodo.text;
     DMTE.cdsCreCNT.FieldByName('ECNOCOMP').AsString:= dbeNoComp.Text;
     DMTE.cdsCreCNT.FieldByName('FECHA').AsString   := dtpFComp.text;
     DMTE.cdsCreCNT.FieldByName('CNTANOMM').AsString:= edtPeriodo.text;
     DMTE.wModo:='M';
  end;
  DMTE.cdsCreCNT.Edit;
  DMTE.cdsCreCNT.FieldByName('USUARIO').AsString := DMTE.wUsuario;
  DMTE.cdsCreCNT.FieldByName('FREG').AsDateTime  := Date;

  nTotAbono:=0;
  DMTE.cdsTarCreTransf.First;
  while not DMTE.cdsTarCreTransf.Eof do
  begin
     DMTE.cdsTarCreTransf.Edit;
     DMTE.cdsTarCreTransf.FieldByName('TDIARID').AsString :=DMTE.cdsCreCNT.FieldByName('TDIARID').AsString;
     DMTE.cdsTarCreTransf.FieldByName('ECANOMM').AsString :=DMTE.cdsCreCNT.FieldByName('ECANOMM').AsString;
     DMTE.cdsTarCreTransf.FieldByName('ECNOCOMP').AsString:=DMTE.cdsCreCNT.FieldByName('ECNOCOMP').AsString;
     nTotAbono:=nTotAbono+DMTE.cdsTarCreTransf.FieldByName('ABONO').AsFloat;
     DMTE.cdsTarCreTransf.Post;
     DMTE.cdsTarCreTransf.Next;
  end;

  DMTE.cdsCreCNT.FieldByName('TOTABONO').AsFloat  := nTotAbono;
  DMTE.cdsCreCNT.Post;
  DMTE.cdsCreCNT.ApplyUpdates(0);
  DMTE.cdsTarCreTransf.ApplyUpdates(0);
end;

procedure TFContabTarCre.FormActivate(Sender: TObject);
begin
  if DMTE.wModo='M' then
  begin
      dblcCia.Text       :=DMTE.cdsCreCNT.FieldByName('CIAID').AsString;
      dblcTDiario.text   :=DMTE.cdsCreCNT.FieldByName('TDIARID').AsString;
      edtPeriodo.text    :=DMTE.cdsCreCNT.FieldByName('ECANOMM').AsString;
      dbeNoComp.Text     :=DMTE.cdsCreCNT.FieldByName('ECNOCOMP').AsString;
      dtpFComp.Date      :=DMTE.cdsCreCNT.FieldByName('FECHA').AsDateTime;
  end;
end;

procedure TFContabTarCre.bbtnContabClick(Sender: TObject);
var
   xSQL, xTCambio, xPeriodo, xOrigen, xLote, xWhere : String;
   xCta166, xCta466, xNoComp, xCtaBan : String;

begin
   if MessageDlg('¿Contabilizar y Generar Asientos Automaticos?',mtConfirmation,
									[mbYes, mbNo], 0)=mrNo then Exit;

   xOrigen :='46';
   xPeriodo:=Copy(dtpFComp.text,7,4)+Copy(dtpFComp.text,4,2);
   xLote :='TARJ';
   xCtaBan:='104010305';

   xTCambio:='0';
   xWhere:='TMONID='+QuotedStr(DMTE.wTMonExt)
          +' and FECHA='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dtpFComp.Date)+''')';
   xTCambio:=DMTE.DisplayDescrip('prvTGE','TGE107','TMONID, TCAMVOV',xWhere,'TCAMVOV');
   if xTCambio='' then xTCambio:='0';
   if StrToFloat(xTCambio)<=0 then
   begin
      ShowMessage('Falta ingresar el Tipo de Cambio');
      Exit;
   end;

   xSQL:='Select CTADEBE, B.CTA_AUX AUX_D, B.CTA_CCOS CCOS_D, CTAHABER, C.CTA_AUX AUX_H, C.CTA_CCOS CCOS_H, TDIARID, CIAORIGEN, TDIARID2 '
        +'From CAJA103 A, TGE202 B, TGE202 C '
        +'Where A.CIAID='''+dblcCia.Text+''' '
        + ' AND B.CIAID=A.CIAID AND A.CTADEBE=B.CUENTAID '
        + ' AND C.CIAID=A.CIAID AND A.CTAHABER=C.CUENTAID ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   xCta166:=DMTE.cdsQry.FieldByName('CTADEBE').AsString;
   xCta466:=DMTE.cdsQry.FieldByName('CTAHABER').AsString;

   xSQL:='SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
        +'WHERE CIAID='''+dblcCia.Text+''' AND CNTANOMM='''+xPeriodo+''' AND TDIARID='''+xOrigen+'''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.indexfieldnames:='';
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   xNoComp:=DMCXP.cdsQry.FieldByName('NOCOMP').AsString;


   xNoComp:=dbeNoComp.Text;


   // cabecera
   xSQL:='INSERT INTO CNT300 (CIAID, TDIARID, CNTCOMPROB, '
        +  'CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
        +  'CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
        +  'CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
        +  'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
        +'Select CIAID, A.TDIARID, ECNOCOMP, ECANOMM, '''+xOrigen+''', ''COBRO DE CREDITO DE HOTELES'' GLOSA, '
        +  xTCambio+', '''+dtpFComp.text+''', ''I'', ''N'', NULL, '''+DMTE.wUsuario+''', SYSDATE, SYSDATE, '
        +  'b.fecano , b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem, b.fecaass, '
        +  'A.TMONID,  NULL, NULL, NULL, TDIARABR, '
        +  'CASE WHEN A.TMONID=''N'' THEN A.TOTABONO ELSE round(A.TOTABONO*'+xTCambio+',2) END DMN, '
        +  'CASE WHEN A.TMONID=''D'' THEN A.TOTABONO ELSE round(A.TOTABONO/'+xTCambio+',2) END DME, '
        +  'CASE WHEN A.TMONID=''N'' THEN A.TOTABONO ELSE round(A.TOTABONO*'+xTCambio+',2) END HMN, '
        +  'CASE WHEN A.TMONID=''D'' THEN A.TOTABONO ELSE round(A.TOTABONO/'+xTCambio+',2) END HME, '
        +  '0, 0, NULL, ''CAJA'', ''CAJA'' '
        +'FROM CAJ_TAR_CRE_CNT A, TGE114 B, TGE104 C '
        +'where CIAID   ='''+DMTE.cdsCreCNT.FieldByName('CIAID').AsString   +''' '
        +  'and A.TDIARID ='''+DMTE.cdsCreCNT.FieldByName('TDIARID').AsString +''' '
        +  'and ECANOMM ='''+DMTE.cdsCreCNT.FieldByName('ECANOMM').AsString +''' '
        +  'and ECNOCOMP='''+DMTE.cdsCreCNT.FieldByName('ECNOCOMP').AsString+''' '
        +  'AND A.FECHA=B.FECHA '
        +  'AND C.TDIARID='''+xOrigen+'''';

  DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 1 VISANET
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select A.CIAID, '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , b.fecano, '''+xPeriodo+''', '''+xLote+''', '''+xCtaBan+''', NULL, NULL, '
        +  '''20'', ''OP'', OPERACION, SUBSTR(CASE WHEN REFER like ''%VISANET%'' THEN ''VISANET'' WHEN REFER like ''%DINERS%''  THEN ''DINERS'' WHEN REFER like ''%EXPRESSNET%'' THEN ''EXPRESSNET'' WHEN REFER like ''%PROCESOS%''   THEN ''MCARD''  END ||'''+xPeriodo+' '+edtCia.Text+''',1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
        +  'A.ABONO, CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END TMN, '
        +  'CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END TME, '
        +  'A.FECHA, A.FECHA, '''+dtpFComp.text+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
        +  'SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem, b.fecaass, '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  'CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END HMN, '
        +  'CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END HME, 0, 0, 0, 0, NULL, NULL, '
        +  'NULL, ''CAJA'', ROWNUM, ''CAJA'', NULL '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E '
        +'where A.CIAID   ='''+DMTE.cdsCreCNT.FieldByName('CIAID').AsString   +''' '
        +  'and A.TDIARID ='''+DMTE.cdsCreCNT.FieldByName('TDIARID').AsString +''' '
        +  'and A.ECANOMM ='''+DMTE.cdsCreCNT.FieldByName('ECANOMM').AsString +''' '
        +  'and A.ECNOCOMP='''+DMTE.cdsCreCNT.FieldByName('ECNOCOMP').AsString+''' '
        +  'AND B.FECHA(+)='''+dtpFComp.text+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=E.CIAID AND '''+xCtaBan+'''=E.CUENTAID '
        +'ORDER BY CASE WHEN REFER like ''%VISANET%''    THEN ''VISANET'' '
        +              'WHEN REFER like ''%EXPRESSNET%'' THEN ''EXPRESSNET'' '
        +              'WHEN REFER like ''%PROCESOS%''   THEN ''MCARD'' '
        +              'WHEN REFER like ''%DINERS%''     THEN ''DINERS'' END';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 2 VISANET
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select A.CIAID, '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', '''+xCta466+''', NULL, NULL, '
        +  '''21'', ''ABO'', '''+xPeriodo+''', SUBSTR(''VISANET '+xPeriodo+' '+edtCia.Text+''',1,40) GLOSA, ''H'', NULL, '+xTCambio+', '
        +  'SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
        +  ''''+dtpFComp.text+''', '''+dtpFComp.text+''', '''+dtpFComp.text+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
        +  'SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  '0, 0, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
        +  'SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, NULL, NULL, '
        +  'NULL, ''CAJA'', '+IntToStr(DMTE.cdsTarCreTransf.RecordCount+1)+', ''CAJA'', NULL '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E '
        +'where A.CIAID   ='''+DMTE.cdsCreCNT.FieldByName('CIAID').AsString   +''' '
        +  'and A.TDIARID ='''+DMTE.cdsCreCNT.FieldByName('TDIARID').AsString +''' '
        +  'and A.ECANOMM ='''+DMTE.cdsCreCNT.FieldByName('ECANOMM').AsString +''' '
        +  'and A.ECNOCOMP='''+DMTE.cdsCreCNT.FieldByName('ECNOCOMP').AsString+''' '
        +  'and A.REFER LIKE ''%VISANET%'' '
        +  'AND B.FECHA(+)='''+dtpFComp.text+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=E.CIAID AND '''+xCta466+'''=E.CUENTAID '
        +'GROUP BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 2 EXPRESSNET
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select A.CIAID, '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', '''+xCta466+''', NULL, NULL, '
        +  '''21'', ''ABO'', '''+xPeriodo+''', SUBSTR(''EXPRESSNET '+xPeriodo+' '+edtCia.Text+''',1,40) GLOSA, ''H'', NULL, '+xTCambio+', '
        +  'SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
        +  ''''+dtpFComp.text+''', '''+dtpFComp.text+''', '''+dtpFComp.text+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
        +  'SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  '0, 0, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
        +  'SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, NULL, NULL, '
        +  'NULL, ''CAJA'', '+IntToStr(DMTE.cdsTarCreTransf.RecordCount+2)+', ''CAJA'', NULL '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E '
        +'where A.CIAID   ='''+DMTE.cdsCreCNT.FieldByName('CIAID').AsString   +''' '
        +  'and A.TDIARID ='''+DMTE.cdsCreCNT.FieldByName('TDIARID').AsString +''' '
        +  'and A.ECANOMM ='''+DMTE.cdsCreCNT.FieldByName('ECANOMM').AsString +''' '
        +  'and A.ECNOCOMP='''+DMTE.cdsCreCNT.FieldByName('ECNOCOMP').AsString+''' '
        +  'and A.REFER LIKE ''%EXPRESSNET%'' '
        +  'AND B.FECHA(+)='''+dtpFComp.text+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=E.CIAID AND '''+xCta466+'''=E.CUENTAID '
        +'GROUP BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 2 DINERS CLUB
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select A.CIAID, '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', '''+xCta466+''', NULL, NULL, '
        +  '''21'', ''ABO'', '''+xPeriodo+''', SUBSTR(''DINERS '+xPeriodo+' '+edtCia.Text+''',1,40) GLOSA, ''H'', NULL, '+xTCambio+', '
        +  'SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
        +  ''''+dtpFComp.text+''', '''+dtpFComp.text+''', '''+dtpFComp.text+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
        +  'SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  '0, 0, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
        +  'SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, NULL, NULL, '
        +  'NULL, ''CAJA'', '+IntToStr(DMTE.cdsTarCreTransf.RecordCount+3)+', ''CAJA'', NULL '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E '
        +'where A.CIAID   ='''+DMTE.cdsCreCNT.FieldByName('CIAID').AsString   +''' '
        +  'and A.TDIARID ='''+DMTE.cdsCreCNT.FieldByName('TDIARID').AsString +''' '
        +  'and A.ECANOMM ='''+DMTE.cdsCreCNT.FieldByName('ECANOMM').AsString +''' '
        +  'and A.ECNOCOMP='''+DMTE.cdsCreCNT.FieldByName('ECNOCOMP').AsString+''' '
        +  'and A.REFER LIKE ''%DINERS CLUB%'' '
        +  'AND B.FECHA(+)='''+dtpFComp.text+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=E.CIAID AND '''+xCta466+'''=E.CUENTAID '
        +'GROUP BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 2 PROCESOS
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select A.CIAID, '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', '''+xCta466+''', NULL, NULL, '
        +  '''21'', ''ABO'', '''+xPeriodo+''', SUBSTR(''MCARD '+xPeriodo+' '+edtCia.Text+''',1,40) GLOSA, ''H'', NULL, '+xTCambio+', '
        +  'SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
        +  ''''+dtpFComp.text+''', '''+dtpFComp.text+''', '''+dtpFComp.text+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
        +  'SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  '0, 0, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
        +  'SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, NULL, NULL, '
        +  'NULL, ''CAJA'', '+IntToStr(DMTE.cdsTarCreTransf.RecordCount+4)+', ''CAJA'', NULL '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E '
        +'where A.CIAID   ='''+DMTE.cdsCreCNT.FieldByName('CIAID').AsString   +''' '
        +  'and A.TDIARID ='''+DMTE.cdsCreCNT.FieldByName('TDIARID').AsString +''' '
        +  'and A.ECANOMM ='''+DMTE.cdsCreCNT.FieldByName('ECANOMM').AsString +''' '
        +  'and A.ECNOCOMP='''+DMTE.cdsCreCNT.FieldByName('ECNOCOMP').AsString+''' '
        +  'and A.REFER LIKE ''%PROCESOS%'' '
        +  'AND B.FECHA(+)='''+dtpFComp.text+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=E.CIAID AND '''+xCta466+'''=E.CUENTAID '
        +'GROUP BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);






  DMTE.cdsTarCreTransf.First;
  while not DMTE.cdsTarCreTransf.Eof do
  begin
     DMTE.cdsTarCreTransf.Edit;
     DMTE.cdsTarCreTransf.FieldByName('TDIARID').AsString :=DMTE.cdsCreCNT.FieldByName('TDIARID').AsString;
     DMTE.cdsTarCreTransf.FieldByName('ECANOMM').AsString :=DMTE.cdsCreCNT.FieldByName('ECANOMM').AsString;
     DMTE.cdsTarCreTransf.FieldByName('ECNOCOMP').AsString:=DMTE.cdsCreCNT.FieldByName('ECNOCOMP').AsString;
     DMTE.cdsTarCreTransf.Post;
     DMTE.cdsTarCreTransf.Next;
  end;

end;

procedure TFContabTarCre.dblcCiaExit(Sender: TObject);
var
   xWhere : String;
begin
   xWhere:='CIAID='+quotedstr(dblcCia.Text);
   edtCia.Text:=DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIAABR') ;
   if length(edtCia.Text)=0 then
   begin
      ShowMessage('Error en código de Compañía');
      dblcCia.SetFocus;
   end;
end;

end.

unit Caja256;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcButton, fcImgBtn, fcShapeBtn, ExtCtrls, oaContabiliza,db, Variants;

type
  TFToolConta = class(TForm)
    pnlConta: TPanel;
    z2bbtnConta: TfcShapeBtn;
    z2bbtnCre: TfcShapeBtn;
    z2bbtnCob: TfcShapeBtn;
    z2bbtnApo: TfcShapeBtn;
    z2bbtnPre: TfcShapeBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure z2bbtnContaClick(Sender: TObject);
    procedure z2bbtnCreClick(Sender: TObject);
    procedure z2bbtnCobClick(Sender: TObject);
    procedure z2bbtnApoClick(Sender: TObject);
    procedure z2bbtnPreClick(Sender: TObject);
  private
    { Private declarations }
    xFechaCom : TDate;
    xCcBcoid,xTmonid,xBancoid,xFPagoid,xAuxid,xClauxid,xMaxNumComp,xcCuadre,xCiaid : String;
    xNReg : Integer;
    xRetLoc,xRetExt,xHabeTD,xDebeTD,xHabeT,xDebeT : Double;
    wCCosDif,wCptoGan,wCptoPer,wCtaGan,wCtaPer   : String ;
    xECTCAMB,cPgoOri,cPgoLoc,cPgoExt : Double;
    procedure LevantaMant(pSql : String);
    Function MesCerrado(xMes,xAno,xCiaid : String) : Boolean;
    procedure GrabaCaja302;
    procedure ActuCaja301;
    procedure ActualizaCNT311(pCiaid,pTdiarid,pComprob,pperiodo : String);
    procedure Contabiliza;
    procedure z2bbtnSumatClick;
    procedure Contab_RegCxP;
    procedure Contab_DifCambio;
    procedure Contab_EgrCaja;
    procedure AsientoDifTotal;
    procedure RecCptosDifC;
    function  RecuperarDatos(xTabla,xCampos,xWhere : String): Boolean ;
    procedure SQLSelect(const xTabla, xCampos, xWhere: WideString);
    procedure ActSdoAuxiliar(const xCIAID, xANO, xMES, xCLAUXID, xAUXID, MONTOMN, MONTOME, MTOSLOC, MTOSEXT, xOper: String);
    procedure ActualizaSaldosTGE401(ccPgoOri,ccPgoLoc,ccPgoExt: double; sSigno : String);
    procedure SaldosCaja310;
  public
    { Public declarations }
    wViene,wAno,wMes : String;
  end;

var
  FToolConta: TFToolConta;

implementation

uses CAJADM, CAJA001;

{$R *.DFM}

procedure TFToolConta.ActualizaCNT311(pCiaid, pTdiarid, pComprob,  pperiodo: String);
var
	 xValores, xSQL : String;
begin
  xSql:='INSERT INTO CNT311 ( '
   +  'CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, '
   +  'AUXID, DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, '
   +  'CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTCUADRE, CNTUSER, CCOSID, '
   +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTSS, CNTSEM, CNTTRI, CNTAASS, CNTAASEM, '
   +  'CNTAATRI, TMONID, CNTMODDOC, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
   +  'TDIARDES, CTADES, DOCDES, MODULO, CNTREG ) '
   +'SELECT '
   +  'A.CIAID, A.TDIARID, ECNOCOMP, DCANO, ECANOMM, DCLOTE, A.CUENTAID, CLAUXID, '
   +  'DCAUXID, A.DOCID, DCSERIE, DCNODOC, DCGLOSA, DCDH, DCTCAMPA, DCMTOORI, DCMTOLO, '
   +  'DCMTOEXT, DCFEMIS, DCFVCMTO, ECFCOMP, DCFLACDR, '''+DM1.wUsuario+''', A.CCOSID, '
   +  dm1.wRepFecServi+', '+dm1.wRepHorServi+', DCMM, DCDD, DCSS, DCSEM, DCTRI, '
   +  'DCAASS, DCAASEM, DCAATRI, TMONID, A.DOCMOD, '
   +  'DECODE( DCDH, ''D'', DCMTOLO, 0 ), DECODE( DCDH, ''D'', DCMTOEXT, 0 ), '
   +  'DECODE( DCDH, ''H'', DCMTOLO, 0 ), DECODE( DCDH, ''H'', DCMTOEXT, 0 ), '
   +  'D.TDIARABR , C.CTAABR, B.DOCABR, '''+dm1.wModulo+''', NREG '
   +'FROM CAJA304 A, TGE110 B, TGE202 C, TGE104 D '
   +'WHERE A.CIAID='''   + pCiaid    +''' and '
   +      'A.TDIARID=''' + pTdiarid  +''' and '
   +      'A.ECANOMM=''' + pPeriodo  +''' and '
   +      'A.ECNOCOMP='''+ pComprob  +''' and '
   +      'B.DOCID(+)=A.DOCID and B.DOCMOD(+)=''CAJA'' and '
   +      'C.CIAID(+)=A.CIAID and C.CUENTAID(+)=A.CUENTAID and '
   +      'D.TDIARID(+)=A.TDIARID ';
 try
  dm1.DCOM1.AppServer.EjecutaSQL(xSQL);
 except
 end;
 xsql:='SELECT * FROM CNT311 A '
     +'WHERE A.CIAID='     +quotedstr( pCiaid   ) +' AND '
     +      'A.CNTANOMM='  +quotedstr( pPeriodo ) +' AND '
     +      'A.TDIARID='   +quotedstr( pTdiarid ) +' AND '
     +      'A.CNTCOMPROB='+quotedstr( pComprob ) +' '
     +'ORDER BY A.CNTREG';
 DM1.cdsQry2.Close;
 DM1.cdsQry2.DataRequest(xSQL);
 DM1.cdsQry2.Open;

 xSQL:=      'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, ';
 xSQL:=xSQL+' A.CNTGLOSA, A.CNTTCAMBIO, CNTESTADO, A.CNTFCOMP, C.TMONDES, ';
 xSQL:=xSQL+' A.TMONID, B.CCBCOID, B.ECNOCHQ, B.ECGIRA, ECMTOORI, ';
 xSQL:=xSQL+' C.TMONDES, C.TMONABR, B.PROV||''  ''||D.AUXNOMB PROV, B.BANCOID||'' ''||E.BANCONOM BANCOID ';
 xSQL:=xSQL+' FROM CNT311 A, CAJA302 B, TGE103 C, CNT201 D, TGE105 E ';
 xSQL:=xSQL+' WHERE ( A.CIAID='''+DM1.cdsQry2.FieldByName('CIAID').AsString     +''' AND ';
 xSQL:=xSQL+' A.TDIARID='''   +DM1.cdsQry2.FieldByName('TDIARID').AsString   +''' AND ';
 xSQL:=xSQL+' A.CNTANOMM='''  +DM1.cdsQry2.FieldByName('CNTANOMM').AsString  +''' AND ';
 xSQL:=xSQL+' A.CNTCOMPROB='''+DM1.cdsQry2.FieldByName('CNTCOMPROB').AsString+''' ) ';
 xSQL:=xSQL+' AND   A.CNTREG=1 AND ';
 xSQL:=xSQL+' B.CIAID='''    +DM1.cdsQry2.FieldByName('CIAID').AsString     +''' AND ';
 xSQL:=xSQL+' B.TDIARID='''  +DM1.cdsQry2.FieldByName('TDIARID').AsString   +''' AND ';
 xSQL:=xSQL+' B.ECANOMM='''  +DM1.cdsQry2.FieldByName('CNTANOMM').AsString  +''' AND ';
 xSQL:=xSQL+' B.ECNOCOMP=''' +DM1.cdsQry2.FieldByName('CNTCOMPROB').AsString+''' AND ';
 xSQL:=xSQL+' B.ECESTADO<>''A'' ';
 xSQL:=xSQL+' and   C.TMONID=A.TMONID ';
 xSQL:=xSQL+' and   D.CLAUXID(+)=B.CLAUXID AND D.AUXID(+)=B.PROV ';
 xSQL:=xSQL+' and   E.BANCOID=B.BANCOID ';
 DM1.cdsQry3.Close;
 DM1.cdsQry3.DataRequest(xSQL);
 DM1.cdsQry3.Open;
end;


procedure TFToolConta.ActuCaja301;
Const
 xCaja301 : String = 'CIAID,TDIARID,ECANOMM,ECNOCOMP,DOCID2,DOCMOD,CPTOID,TDIARID2,'+
                     'CUENTAID,CLAUXID,PROV,PROVRUC,TMONID,DEMTOORI,CPNODOC,DEFCOMP,CPFEMIS,'+
                     'CPFVCMTO,CPANOMM,DETCPAG,DEDH,DETCDOC,CPSERIE,DEMTOLOC,DEMTOEXT,'+
                     'DEUSER,DEFREG,DEHREG,DEANO,DEMM,DEDD,DESS,DESEM,DETRI,DEAASS,'+
                     'DEAASEM,DEAATRI,DEESTADO,DEGLOSA,ECGLOSA';
var
 xSql,xCampo,aux,xWhere : String;
begin
      //** CIAID
      xCampo := quotedstr(Dm1.cdsQry1.FieldByName('CIAID').AsString)+',';
      //** TDIARID
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('TDIARID').AsString)+',';
      //** ECANOMM
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('ECANOMM').AsString)+',';
      //** ECNOCOMP
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('ECNOCOMP').AsString)+',';
      //** DOCID2
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('DOCID2').AsString)+',';
      //** DOCMOD
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('DOCMOD').AsString)+',';
      //** CPTOID
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('CPTOID').AsString)+',';
      //** TDIARID2
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('TDIARID2').AsString)+',';
      //** CUENTAID
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('CUENTAID').AsString)+',';

       //** CLAUXID
       xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('CLAUXID').AsString)+',';
       //** PROV
       xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('PROV').AsString)+',';
       //** PROVRUC
       xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('PROVRUC').AsString)+',';
      //** TMONID
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('TMONID').AsString)+',';
      //** DEMTOORI
      xCampo := xCampo + Dm1.cdsQry1.Fieldbyname('DEMTOORI').AsString +',';
      //** CPNODOC
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('CPNODOC').AsString)+',';
      //** DEFCOMP
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('DEFCOMP').AsString)+',';
      //** CPFEMIS
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('CPFEMIS').AsString)+',';
      //** CPFVCMTO
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('CPFVCMTO').AsString)+',';
      //** CPANOMM
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('CPANOMM').AsString)+',';
      //** DETCPAG
      xCampo := xCampo + Dm1.cdsQry1.Fieldbyname('DETCPAG').AsString+',';
      //** DEDH
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('DEDH').AsString)+',';
      //** DETCDOC
      xCampo := xCampo + Dm1.cdsQry1.Fieldbyname('DETCDOC').AsString+',';
      //** CPSERIE
      xCampo := xCampo + quotedstr(Dm1.cdsQry1.Fieldbyname('CPSERIE').AsString)+',';
      //** DEMTOLOC
      xCampo := xCampo + Dm1.cdsQry1.FieldByName('DEMTOLOC').AsString+',';
      //** DEMTOEXT
      xCampo := xCampo + Dm1.cdsQry1.FieldByName('DEMTOEXT').AsString+',';
      //** DEUSER
      xCampo := xCampo +  quotedStr(Dm1.cdsQry1.FieldByName('DEUSER').AsString)+', ';
      //** ECFREG
      xCampo := xCampo +  dm1.wRepFecServi+', ';
      //** ECHREG
      xCampo := xCampo +  dm1.wRepHorServi+', ';
      //** DEANO
      xCampo := xCampo +  quotedStr(DM1.cdsQry1.fieldByName('DEANO').AsString)+', ';
      //** DEMM
      xCampo := xCampo +  quotedStr(DM1.cdsQry1.fieldByName('DEMM').AsString)+', ';
      //** DEDD
      xCampo := xCampo +  quotedStr(DM1.cdsQry1.fieldByName('DEDD').AsString)+', ';
      //** DESS
      xCampo := xCampo +  quotedStr(DM1.cdsQry1.fieldByName('DESS').AsString)+', ';
      //** DESEM
      xCampo := xCampo +  quotedStr(DM1.cdsQry1.fieldByName('DESEM').AsString)+', ';
      //** DETRI
      xCampo := xCampo +  quotedStr(DM1.cdsQry1.fieldByName('DETRI').AsString)+', ';
      //** DEAASS
      xCampo := xCampo +  quotedStr(DM1.cdsQry1.fieldByName('DEAASS').AsString)+', ';
      //** DEAASEM
      xCampo := xCampo +  quotedStr(DM1.cdsQry1.fieldByName('DEAASEM').AsString)+', ';
      //** DEAATRI
      xCampo := xCampo +  quotedStr(DM1.cdsQry1.fieldByName('DEAATRI').AsString)+', ';
       //** DEESTADO
      xCampo := xCampo +  quotedStr(Dm1.cdsQry1.FieldByName('DEESTADO').AsString)+',';
      //** DEGLOSA
      xCampo := xCampo +  quotedStr(Dm1.cdsQry1.FieldByName('DEGLOSA').AsString)+', ';
      //** ECGLOSA
      xCampo := xCampo +  quotedStr(Dm1.cdsQry1.FieldByName('ECGLOSA').AsString);
      xSql := 'INSERT INTO CAJA301 ('+xCaja301+') VALUES ('+xCampo+')';
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
end;


procedure TFToolConta.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFToolConta.GrabaCaja302;
Const
 xCaja302 : String = 'CIAID,TDIARID,ECANOMM,ECNOCOMP,CLAUXID,PROV,PROVRUC,ECFCOMP,'+
                     'ECFEMICH,ECFPAGOP,FPAGOID,DOCID,ECNODOC,TMONID,ECTCAMB,ECMTOORI,'+
                     'ECMTOLOC,ECMTOEXT,BANCOID,CCBCOID,CPTOID,CUENTAID,ECGLOSA,ECLOTE,'+
                     'ECELABO,ECESTADO,ECCONTA,ECUSER,ECFREG,ECHREG,ECANO,ECMM,ECDD,'+
                     'ECSS,ECSEM,ECTRI,ECAASS,ECAASEM,ECAATRI,EC_IE,CAJARETIGV,'+
                     'AUXID,CCBCOVOUCH,EC_PROCE';
var
  xFecha,xNumComp1,xNumComp2,xCampo,xSql : String;
begin
 xSql := 'select MAX(CNTCOMPROB) +1 TOTAL from cnt301'+
         ' where CIAID='+quotedstr(xCiaid)+
         ' and TDIARID='+quotedstr(DM1.cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString)+
         ' AND CNTANOMM='+quotedstr(wano+wMes);
 dm1.cdsQry.Close;
 dm1.cdsQry.DataRequest(xSql);
 dm1.cdsQry.Open;
 If dm1.cdsQry.fieldByName('TOTAL').AsString = '' then xNumComp1 := '1';
 xNumComp1 := Dm1.StrZero(dm1.cdsQry.fieldByName('TOTAL').AsString,10);

 xSql := 'select MAX(ECNOCOMP) +1 TOTAL from CAJA302'+
         ' where CIAID='+quotedstr(xCiaid)+
         ' and TDIARID='+quotedstr(DM1.cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString)+
         ' AND ECANOMM='+quotedstr(wano+wMes);
 dm1.cdsQry.Close;
 dm1.cdsQry.DataRequest(xSql);
 dm1.cdsQry.Open;
 If dm1.cdsQry.fieldByName('TOTAL').AsString = '' then xNumComp2 := '1';
 xNumComp2 := Dm1.StrZero(dm1.cdsQry.fieldByName('TOTAL').AsString,10);

 If xNumComp1 < xNumComp2 then
  xMaxNumComp := xNumComp2
 else
  xMaxNumComp := xNumComp1;
 //** ACTUALIZO CAJA302
 //** CIAID
 xCampo := quotedstr(DM1.cdsEgrCaja.FieldByName('CIAID').AsString)+',';
 //** TDIARID
 xCampo := xCampo + quotedstr(DM1.cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString)+',';
 //** ECANOMM
 xCampo := xCampo + quotedstr(wano+wMes)+',';
 //** ECNOCOMP
 xCampo := xCampo + quotedstr(xMaxNumComp)+',';
 //**CLAUXID
 xCampo := xCampo + quotedstr(DM1.cdsEgrCaja.FieldByName('CLAUXID').AsString)+',';
 //** PROV
 xCampo := xCampo + quotedstr(DM1.cdsEgrCaja.FieldByName('PROV').AsString)+',';
 //** PROVRUC
 xCampo := xCampo + quotedstr(DM1.cdsEgrCaja.FieldByName('PROVRUC').AsString)+',';
 //** ECFCOMP
 xCampo := xCampo + quotedstr(DateToStr(DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime))+',';
 //** ECFEMICH
 xCampo := xCampo + quotedstr(DateToStr(DM1.cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime))+',';
 //** ECFPAGOP
 xCampo := xCampo + quotedstr(DateToStr(DM1.cdsEgrCaja.FieldByName('ECFPAGOP').AsDateTime))+',';
 //** FPAGOID
 xCampo := xCampo + quotedstr(DM1.cdsEgrCaja.FieldByName('FPAGOID').AsString)+',';
 //** DOCID
 xCampo := xCampo + quotedstr(DM1.cdsEgrCaja.FieldByName('DOCID').AsString)+',';
 //** ECNODOC
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECNODOC').AsString)+', ';
 //** TMONID
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('TMONID').AsString)+', ';
 //** ECTCAMB
 xCampo := xCampo + DM1.cdsEgrCaja.FieldByName('ECTCAMB').AsString +', ';
 //** ECMTOORI
 xCampo := xCampo + DM1.cdsEgrCaja.FieldByName('ECMTOORI').AsString +', ';
 //** ECMTOLOC
 xCampo := xCampo + DM1.cdsEgrCaja.FieldByName('ECMTOLOC').AsString +',';
 //** ECMTOEXT
 xCampo := xCampo + DM1.cdsEgrCaja.FieldByName('ECMTOEXT').AsString+',';
 //** BANCOID
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('BANCOID').AsString)+', ';
 //** CCBCOID
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('CCBCOID').AsString)+', ';
 //** CPTOID
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('CPTOID').AsString)+', ';
 //** CUENTAID
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('CUENTAID').AsString)+', ';
 //** ECGLOSA
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECGLOSA').AsString)+', ';
 //** ECLOTE
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECLOTE').AsString)+', ';
 //** ECELABO
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECELABO').AsString)+', ';
 //** ECESTADO
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECESTADO').AsString)+', ';
 //** ECCONTA
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECCONTA').AsString)+', ';
 //** ECUSER
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECUSER').AsString)+', ';
 //** ECFREG
 xCampo := xCampo +  dm1.wRepFecServi+', ';
 //** ECHREG
 xCampo := xCampo +  dm1.wRepHorServi+', ';
 //** ECANO
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECANO').AsString)+', ';
 //** ECMM
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECMM').AsString)+', ';
 //** ECDD
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECDD').AsString)+', ';
 //** ECSS
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECSS').AsString)+', ';
 //** ECSEM
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECSEM').AsString)+', ';
 //** ECTRI
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECTRI').AsString)+', ';
 //** ECAASS
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECAASS').AsString)+', ';
 //** ECAASEM
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECAASEM').AsString)+', ';
 //** ECAATRI
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('ECAATRI').AsString)+', ';
 //** EC_IE
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('EC_IE').AsString)+', ';
 //** CAJARETIGV
 xCampo := xCampo +  quotedStr(DM1.cdsEgrCaja.FieldByName('CAJARETIGV').AsString)+', ';
 //** AUXID
 xCampo := xCampo + quotedstr(DM1.cdsEgrCaja.FieldByName('AUXID').AsString)+',';
 //** CCBCOVOUCH
 xCampo := xCampo + quotedstr(DM1.cdsEgrCaja.FieldByName('CCBCOVOUCH').AsString)+',';
 //** EC_PROCE
 xCampo := xCampo + quotedstr(DM1.cdsEgrCaja.FieldByName('EC_PROCE').AsString);
 xSql := 'INSERT INTO CAJA302 ('+xCaja302+') VALUES ('+xCampo+')';
 DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
 //** Actualiza Caja301
 ActuCaja301;
end;

function TFToolConta.MesCerrado(xMes, xAno, xCiaid: String): Boolean;
var
 xSql : String;
begin
  if xMes='00' then
     xMes:='01';

  xSql := 'SELECT PER'+xMes+' FROM TGE154 WHERE CIAID='+quotedstr(xCiaid)+
          ' AND ANO='+quotedstr(xAno);
  dm1.cdsQry.IndexFieldNames:='';
  dm1.cdsQry.Close;
  dm1.cdsQry.DataRequest(xSql);
  dm1.cdsQry.Open;
  If dm1.cdsQry.FieldByName('PER'+xMes).AsString = 'S' then
   result := True
  else result := False;
end;

procedure TFToolConta.z2bbtnContaClick(Sender: TObject);
var
 xSql : String;
begin
   If DM1.cdsEgrCaja.RecordCount > 0 then
    begin
       xcCuadre := 'S';
       dm1.cdsCia.Close;
       dm1.cdsCia.DataRequest('SELECT * FROM TGE101 WHERE CIARETIGV=''N''');
       dm1.cdsCia.Open;

       xCiaid := dm1.cdsCia.FieldByName('CIAID').AsString;
       xSql := 'SELECT * FROM CNT202 ';
       DM1.cdsNivel.close;
       DM1.cdsNivel.datarequest(xSql);
       DM1.cdsNivel.open;
       If MesCerrado(wMes,wAno,xCiaid) then
        begin
          ShowMessage(' Mes cerrado, no se puede contabilizar');
          exit;
        end;

       //// Contabilización en Linea: requiere que en el DM del módulo exista cdsMOVCNT2 (mismo nombre)
       //// cds1 y cds2 deben hacer referencia a la tabla CNT301
       if MessageDlg(' Contabilizar Comprobante'+chr(13)+chr(13)+
                     '     ¿ Esta Seguro ?     ',mtConfirmation,[mbYes, mbNo],0)=mrNo
       then exit;

       //** 15/04/2003 - PJSV - actualizo caja301 y caja302
       try
        DM1.cdsEgrCaja.DisableControls;
        DM1.cdsEgrCaja.First;
        While not DM1.cdsEgrCaja.eof do
         begin
          If DM1.cdsEgrCaja.FieldByName('ECConta').AsString = 'N' then
           begin
            xSql := 'SELECT * FROM CAJA322 WHERE '+
                    ' CIAID='+quotedstr(DM1.cdsEgrCaja.FieldByName('CIAID').AsString)+
                    ' AND TDIARID ='+quotedstr(DM1.cdsEgrCaja.FieldByName('TDIARID').AsString)+
                    ' AND ECANOMM ='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString)+
                    ' AND ECNOCOMP ='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
            dm1.cdsQry1.close;
            dm1.cdsQry1.datarequest(xSql);
            dm1.cdsQry1.open;
            GrabaCaja302;
            xSQL:='Select * from CAJA302 WHERE'+
                    ' CIAID='+quotedstr(DM1.cdsEgrCaja.FieldByName('CIAID').AsString)+
                    ' AND TDIARID ='+quotedstr(DM1.cdsEgrCaja.FieldByName('TDIARID').AsString)+
                    ' AND ECANOMM ='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString)+
                    ' AND ECNOCOMP ='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
            DM1.cdsEgrCaja.close;
            DM1.cdsEgrCaja.datarequest(xSql);
            DM1.cdsEgrCaja.open;
            xSQL:='Select * from CAJA301 WHERE '+
                    ' CIAID='+quotedstr(DM1.cdsEgrCaja.FieldByName('CIAID').AsString)+
                    ' AND TDIARID ='+quotedstr(DM1.cdsEgrCaja.FieldByName('TDIARID').AsString)+
                    ' AND ECANOMM ='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString)+
                    ' AND ECNOCOMP ='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
            DM1.cdsRegCxP.close;
            DM1.cdsRegCxP.datarequest(xSql);
            DM1.cdsRegCxP.open;
            Contabiliza;

            cPgoOri := DM1.cdsEgrCaja.FieldByName('ECMTOORI').AsFloat;
            cPgoLoc := DM1.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat;
            cPgoExt := DM1.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat;
            xClauxid:= DM1.cdsEgrCaja.FieldByName('CLAUXID').AsString;
            xAuxid  := DM1.cdsEgrCaja.FieldByName('AUXID').AsString;
            xFechaCom := DM1.cdsEgrCaja.FieldByName('ECFREG').AsDateTime;
            xFPagoid := DM1.cdsEgrCaja.FieldByName('FPAGOID').AsString;
            xBancoid:= DM1.cdsEgrCaja.FieldByName('BANCOID').AsString;
            xTmonid:= DM1.cdsEgrCaja.FieldByName('TMONID').AsString;
            xCcBcoid := DM1.cdsEgrCaja.FieldByName('CCBCOID').AsString;

            //** Actualiza Saldo TGE401
            ActualizaSaldosTGE401(cPgoOri,cPgoLoc,cPgoExt, '-');

            //** Actualiza Saldo CAJA310
            SaldosCaja310;

            ActualizaCNT311(DM1.cdsEgrCaja.FieldByName('CIAID').AsString,
                            DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
                            DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                            DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString);

            if SOLConta(DM1.cdsEgrCaja.FieldByName('CIAID').AsString,
                        DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
                        DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                        DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                        dm1.SRV_D, 'C', DM1.wModulo, DM1.cdsQry2, DM1.cdsNivel,
                        DM1.cdsResultSet, DM1.DCOM1, Self ) then
              begin
               xSql := 'UPDATE CAJA321 SET '+
                       ' ECConta = '+ quotedstr('S')+
                       ' ,ECESTADO = '+ quotedstr('C')+
                       ' ,ECUSER = '+ quotedstr(DM1.wUsuario)+
                       ' ,ECFREG = '+ dm1.wRepFecServi+
                       ' ,ECHREG =' + dm1.wRepHorServi;
               if Copy(xRegAdicional,1,2)='1.' then
                xSql := xSql + ',ECPERREC ='+quotedstr(xRegAdicional);

               xSql := xSql + ' WHERE '+
                    ' CIAID='+quotedstr(DM1.cdsEgrCaja.FieldByName('CIAID').AsString)+
                    ' AND TDIARID ='+quotedstr(DM1.cdsEgrCaja.FieldByName('TDIARID').AsString)+
                    ' AND ECANOMM ='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString)+
                    ' AND ECNOCOMP ='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
              dm1.DCOM1.AppServer.EjecutaSQL(xSQL);
                //  DM1.cdsEgrCaja.FieldByName('ECPERREC').AsString:=xRegAdicional;
               {DM1.cdsEgrCaja.Edit ;
               DM1.cdsEgrCaja.FieldByName('ECConta').AsString:='S';   //Establece como Contabilizado el flag
               DM1.cdsEgrCaja.FieldByName('ECESTADO').AsString    := 'C';
               DM1.cdsEgrCaja.FieldByName('ECUSER').AsString      := DM1.wUsuario;
               DM1.cdsEgrCaja.FieldByName('ECFREG').AsDateTime    := Date;
               if dm1.SRV_D = 'ORACLE' then
                DM1.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Date+Time
               else
                DM1.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;
               if Copy(xRegAdicional,1,2)='1.' then
                DM1.cdsEgrCaja.FieldByName('ECPERREC').AsString:=xRegAdicional;
                //DM1.AplicaDatos(DM1.cdsEgrCaja, 'EGRCAJA');
               }
              end
            else
             ShowMessage('Imposible Contabilizar');
           end;
            DM1.cdsEgrCaja.Next;
         end;
       Finally
        DM1.cdsEgrCaja.enableControls;
       end;
    end
   else
    ShowMessage('No existen registros para Contabilizar');
end;

procedure TFToolConta.Contabiliza;
var
   xRegAct : TBookMark;
   xSQL    : String;
begin
   xsql:='DELETE FROM CAJA304 '
        +'WHERE CIAID='   +quotedstr(DM1.cdsEgrCaja.FieldByName('CIAID').AsString)   +' AND '
        +      'ECANOMM=' +quotedstr(DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString) +' AND '
        +      'TDIARID=' +quotedstr(DM1.cdsEgrCaja.FieldByName('TDIARID').AsString) +' AND '
        +      'ECNOCOMP='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   try
      DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;

   // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera
   xSQL:='Select * from CAJA304 Where CIAID='''' and '
        +  'ECANOMM='''' and TDIARID='''' and ECNOCOMP='''' ';
   DM1.cdsCNTCaja.Close;
   DM1.cdsCNTCaja.DataRequest( xSQL );
   DM1.cdsCNTCaja.Open;
   //
   z2bbtnSumatClick;
   xNReg:=0;
   DM1.cdsRegCxP.DisableControls;
   xRegAct := DM1.cdsRegCxP.GetBookmark;

   // GENERA LOS REGISTROS DE "DEBE/HABER" Y LOS REGISTROS POR DIF. DE CAMBIO desde el Detalle
   DM1.cdsRegCxP.First ;
   While not DM1.cdsRegCxP.Eof do Begin
      DM1.cdsCNTCaja.Insert;
      Contab_RegCxP;
      Contab_DifCambio;
      DM1.cdsRegCxP.Next;
   end;
   DM1.cdsRegCxP.GotoBookmark(xRegAct);
   DM1.cdsRegCxP.FreeBookmark(xRegAct);
   DM1.cdsRegCxP.EnableControls;

   DM1.cdsCNTCaja.Insert;
   Contab_EgrCaja;
   // Cuadra Asiento por Redondeos
   xDebeT :=0;  xHabeT :=0;
   xDebeTD:=0;  xHabeTD:=0;
   DM1.cdsCNTCaja.First;
   while not DM1.cdsCNTCaja.Eof do
    begin
     if DM1.cdsCNTCaja.FieldByname('DCDH').AsString='D' then
      if DM1.cdsCNTCaja.FieldByname('DCMTOLO').AsFloat <> null then
       begin
	xDebeT :=xDebeT +dm1.FRound(DM1.cdsCNTCaja.FieldByname('DCMTOLO').AsFloat,15,2);
	xDebeTD:=xDebeTD+dm1.FRound(DM1.cdsCNTCaja.FieldByname('DCMTOEXT').AsFloat,15,2);
       end
      else
       begin
	xDebeT:=xDebeT
       end
     else
      begin
       if DM1.cdsCNTCaja.FieldByname('DCMTOLO').AsFloat <> null then
        begin
	 xHabeT :=xHabeT +dm1.FRound(DM1.cdsCNTCaja.FieldByname('DCMTOLO').AsFloat,15,2);
	 xHabeTD:=xHabeTD+dm1.FRound(DM1.cdsCNTCaja.FieldByname('DCMTOEXT').AsFloat,15,2);
	end
       else
        begin
	 xHabeT:=xHabeT;
	end;
      end;
     DM1.cdsCNTCaja.Next;
    end;

   if (dm1.FRound(xDebeT,15,2) <>dm1.FRound(xHabeT,15,2 ) ) then
    begin
     AsientoDifTotal;
    end;
  DM1.cdsCNTCaja.ApplyUpdates(-1);
//   dm1.AplicaDatos(DM1.cdsCNTCaja, 'CNTCAJA');
end;


procedure TFToolConta.z2bbtnSumatClick;
Var
   xRegAct : TBookMark;
   xMtoLoc, xMtoExt: Double ;
   xWhere : String;
begin
   With DM1 do
    begin
      cdsRegCxP.DisableControls;
      xRegAct := cdsRegCxP.GetBookmark;
      xMtoLoc := 0;
      xMtoExt := 0;
      xRetLoc := 0;
      xRetExt := 0;
      cdsRegCxP.First ;
      While not cdsRegCxP.Eof do
      Begin
        if cdsRegCxP.FieldByName('DEDH').AsString='D' then
        begin
          xMtoLoc := xMtoLoc + StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) ) ;
          xMtoExt := xMtoExt + StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) ) ;
        end
        else begin
          xMtoLoc := xMtoLoc - StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOLOC').DisplayText,',','',[rfReplaceAll]) ) ;
          xMtoExt := xMtoExt - StrToFloat( stringReplace(cdsRegCxP.FieldByName('DEMTOEXT').DisplayText,',','',[rfReplaceAll]) ) ;
        end;
        cdsRegCxP.Next;
      end;
      cdsRegCxP.GotoBookmark(xRegAct);
      cdsRegCxP.FreeBookmark(xRegAct);
      cdsRegCxP.EnableControls;
   end;
//   xRetLoc:=DM1.FRound(xRetLoc*DM1.xTasaPorce/100,15,2);
//   xRetExt:=DM1.FRound(xRetExt*DM1.xTasaPorce/100,15,2);
end;

procedure TFToolConta.Contab_RegCxP;
begin
   DM1.cdsCNTCaja.fieldbyname('CIAID').AsString   := DM1.cdsRegCxP.FieldByName('CIAID').AsString;
   DM1.cdsCNTCaja.fieldbyname('TDIARID').AsString := DM1.cdsRegCxP.FieldByName('TDIARID').AsString;
   DM1.cdsCNTCaja.fieldbyname('ECANOMM').AsString := DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DM1.cdsCNTCaja.fieldbyname('ECNOCOMP').AsString:= DM1.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
   DM1.cdsCNTCaja.fieldbyname('DCLOTE').AsString  := DM1.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   DM1.cdsCNTCaja.fieldbyname('DOCID').AsString   := DM1.cdsRegCxP.FieldByName('DOCID2').AsString;
   DM1.cdsCNTCaja.fieldbyname('DOCMOD').AsString  := DM1.cdsRegCxP.FieldByName('DOCMOD').AsString;
   DM1.cdsCNTCaja.fieldbyname('DCSERIE').AsString := DM1.cdsRegCxP.FieldByName('CPSERIE').AsString;
   DM1.cdsCNTCaja.fieldbyname('DCNODOC').AsString := DM1.cdsRegCxP.FieldByName('CPNODOC').AsString;
   DM1.cdsCNTCaja.fieldbyname('ECFCOMP').AsDateTime := DM1.cdsRegCxP.FieldByName('DEFCOMP').AsDateTime;
   DM1.cdsCNTCaja.fieldbyname('DCFEMIS').AsDateTime := DM1.cdsRegCxP.FieldByName('CPFEMIS').AsDateTime;
   DM1.cdsCNTCaja.fieldbyname('DCFVCMTO').AsDateTime:= DM1.cdsRegCxP.FieldByName('CPFVCMTO').AsDateTime;
   DM1.cdsCNTCaja.fieldbyname('CPTOID').AsString  := DM1.cdsRegCxP.FieldByName('CPTOID').AsString;
   DM1.cdsCNTCaja.fieldbyname('CUENTAID').AsString:= DM1.cdsRegCxP.FieldByName('CUENTAID').AsString;
   DM1.cdsCNTCaja.fieldbyname('CLAUXID').AsString := DM1.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
   DM1.cdsCNTCaja.fieldbyname('DCAUXID').AsString := DM1.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
   DM1.cdsCNTCaja.fieldbyname('CCOSID').AsString  := DM1.cdsRegCxP.FieldByName('CCOSID').AsString;
   DM1.cdsCNTCaja.fieldbyname('DCDH').AsString    := DM1.cdsRegCxP.FieldByName('DEDH').AsString;
   DM1.cdsCNTCaja.fieldbyname('DCTCAMPA').AsFloat := DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
   DM1.cdsCNTCaja.fieldbyname('DCTCAMPR').AsFloat := DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
   DM1.cdsCNTCaja.fieldbyname('TMONID').AsString  := DM1.cdsRegCxP.FieldByName('TMONID').AsString;
   DM1.cdsCNTCaja.fieldbyname('DCMTOORI').AsFloat:= DM1.cdsRegCxP.FieldByName('DEMTOORI').AsFloat;

   if DM1.cdsRegCxP.FieldByName('DEGLOSA').AsString<>'' then
    DM1.cdsCNTCaja.FieldByName('DCGLOSA').AsString:=DM1.cdsRegCxP.FieldByName('DEGLOSA').AsString
   else
    DM1.cdsCNTCaja.FieldByName('DCGLOSA').AsString:=DM1.cdsEgrCaja.FieldByName('ECGLOSA').AsString;

   if DM1.cdsRegCxP.fieldbyname('TMONID').AsString=DM1.wtMonLoc then
    begin
     DM1.cdsCNTCaja.fieldbyname('DCMTOLO').AsFloat := dm1.FRound(DM1.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat,15,2);
     DM1.cdsCNTCaja.fieldbyname('DCMTOEXT').AsFloat:= dm1.FRound(DM1.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat,15,2);
    end
   else
    begin
     DM1.cdsCNTCaja.fieldbyname('DCMTOEXT').AsFloat:= dm1.FRound(DM1.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat,15,2);
     DM1.cdsCNTCaja.fieldbyname('DCMTOLO').AsFloat := dm1.FRound(DM1.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat,15,2);
    end;

   DM1.cdsCNTCaja.fieldbyname('DCFLACDR').AsString:= 'S';   //Registro ya cuadrado
   DM1.cdsCNTCaja.fieldbyname('DCUSER').AsString  := DM1.wUsuario;
   DM1.cdsCNTCaja.fieldbyname('DCFREG').AsDateTime  := DateS;
   DM1.cdsCNTCaja.fieldbyname('DCHREG').AsDateTime  := dateS+time;
   DM1.cdsCNTCaja.fieldbyname('DCANO').AsString   := DM1.cdsEgrCaja.FieldByName('ECANO').AsString;
   DM1.cdsCNTCaja.fieldbyname('DCMM').AsString    := DM1.cdsEgrCaja.FieldByName('ECMM').AsString;
   DM1.cdsCNTCaja.fieldbyname('DCDD').AsString    := DM1.cdsEgrCaja.FieldByName('ECDD').AsString;
   DM1.cdsCNTCaja.fieldbyname('DCSS').AsString    := DM1.cdsEgrCaja.FieldByName('ECSS').AsString;
   DM1.cdsCNTCaja.fieldbyname('DCSEM').AsString   := DM1.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DM1.cdsCNTCaja.fieldbyname('DCTRI').AsString   := DM1.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DM1.cdsCNTCaja.fieldbyname('DCAASS').AsString  := DM1.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DM1.cdsCNTCaja.fieldbyname('DCAASEM').AsString := DM1.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DM1.cdsCNTCaja.fieldbyname('DCAATRI').AsString := DM1.cdsEgrCaja.FieldByName('ECAATRI').AsString;
   xNReg:=xNReg+1;
   DM1.cdsCNTCaja.fieldbyName('NREG').AsInteger  := xNReg;
   DM1.cdsCNTCaja.post;
end;

procedure TFToolConta.Contab_DifCambio;
var
   xDif_Camb : real;
   xsql1,xsql : string;
begin
  // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
  //08/05/2001 - pjsv
  // se valida por sugerencia de Jorge y Jose, me confirmaron que por el tipo
  // de moneda de la cabecera, para que no genere <> de cambio cuando es local
  xsql := 'TMONID='+quotedstr('N'); // si es necesario cambiarlo por variable
  xsql1 := 'TMONID='+quotedstr(DM1.cdsRegCxP.FieldByName('TMONID').AsString);
  If (dm1.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql,'TMON_LOC') <> 'L') or
    (dm1.DisplayDescrip('prvTGE','TGE103','TMON_LOC',xsql1,'TMON_LOC') <> 'L') then
   begin
    if DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat <> DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat then
     begin
      DM1.cdsCNTCaja.Insert;
      DM1.cdsCNTCaja.FieldByName('DCGLOSA').AsString  := 'Diferencia de Cambio';
      DM1.cdsCNTCaja.FieldByName('CIAID').AsString   :=  DM1.cdsRegCxP.FieldByName('CIAID').AsString;
      DM1.cdsCNTCaja.FieldByName('TDIARID').AsString :=  DM1.cdsRegCxP.FieldByName('TDIARID').AsString;
      DM1.cdsCNTCaja.FieldByName('ECANOMM').AsString :=  DM1.cdsRegCxP.FieldByName('ECANOMM').AsString;
      DM1.cdsCNTCaja.FieldByName('ECNOCOMP').AsString:=  DM1.cdsRegCxP.FieldByName('ECNOCOMP').AsString;
      DM1.cdsCNTCaja.FieldByName('DCLOTE').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECLOTE').AsString;
      DM1.cdsCNTCaja.FieldByName('DOCID').AsString   :=  DM1.cdsRegCxP.FieldByName('DOCID2').AsString;
      DM1.cdsCNTCaja.FieldByName('DCSERIE').AsString :=  DM1.cdsRegCxP.FieldByName('CPSERIE').AsString;
      DM1.cdsCNTCaja.FieldByName('DCNODOC').AsString :=  DM1.cdsRegCxP.FieldByName('CPNODOC').AsString;
      DM1.cdsCNTCaja.FieldByName('ECFCOMP').AsDateTime :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
      DM1.cdsCNTCaja.FieldByName('DCFEMIS').AsDateTime :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
      DM1.cdsCNTCaja.FieldByName('DCFVCMTO').AsDateTime:=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
      DM1.cdsCNTCaja.FieldByName('CLAUXID').AsString :=  DM1.cdsEgrCaja.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
      DM1.cdsCNTCaja.FieldByName('DCAUXID').AsString :=  DM1.cdsEgrCaja.FieldByName('PROV').AsString;    //Aqui se toma de la cabecera
      DM1.cdsCNTCaja.FieldByName('CCOSID').AsString  :=  DM1.cdsRegCxP.FieldByName('CCOSID').AsString;
      DM1.cdsCNTCaja.FieldByName('DCTCAMPA').AsFloat:=  DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat;
      DM1.cdsCNTCaja.FieldByName('DCTCAMPR').AsFloat:=  DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat;
      DM1.cdsCNTCaja.FieldByName('DCFLACDR').AsString:=  'S';   //Registro ya cuadrado
      DM1.cdsCNTCaja.FieldByName('DCUSER').AsString  :=  DM1.wUsuario;
      DM1.cdsCNTCaja.FieldByName('DCFREG').AsDateTime  :=  Date;
      DM1.cdsCNTCaja.FieldByName('DCHREG').AsDateTime  :=  date+Time;
      DM1.cdsCNTCaja.FieldByName('DCANO').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECANO').AsString;
      DM1.cdsCNTCaja.FieldByName('DCMM').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECMM').AsString;
      DM1.cdsCNTCaja.FieldByName('DCDD').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECDD').AsString;
      DM1.cdsCNTCaja.FieldByName('DCSS').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECSS').AsString;
      DM1.cdsCNTCaja.FieldByName('DCSEM').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECSEM').AsString;
      DM1.cdsCNTCaja.FieldByName('DCTRI').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECTRI').AsString;
      DM1.cdsCNTCaja.FieldByName('DCAASS').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECAASS').AsString;
      DM1.cdsCNTCaja.FieldByName('DCAASEM').AsString :=  DM1.cdsEgrCaja.FieldByName('ECAASEM').AsString;
      DM1.cdsCNTCaja.FieldByName('DCAATRI').AsString :=  DM1.cdsEgrCaja.FieldByName('ECAATRI').AsString;
      DM1.cdsCNTCaja.fieldbyname('DOCMOD').AsString := DM1.cdsRegCxP.FieldByName('DOCMOD').AsString;
      xNReg:=xNReg+1;
      DM1.cdsCNTCaja.fieldbyName('NREG').AsInteger  := xNReg;

      DM1.cdsCNTCaja.FieldByName('TMONID').AsString  :=  DM1.cdsEgrCaja.FieldByName('TMONID').AsString;
      if DM1.cdsRegCxP.FieldByName('TMONID').AsString=DM1.wtMonLoc then
       begin   //Provision en Mon.Local
        xDif_Camb:= abs(DM1.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat -
                         DM1.cdsRegCxP.FieldByName('DEMTOLOC').AsFloat / DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat);//En Mon.Ext.
        DM1.cdsCNTCaja.FieldByName('DCMTOEXT').AsFloat := xDif_Camb;

        if DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat > DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat then
           DM1.cdsCNTCaja.FieldByName('DCDH').AsString := 'D'
        else
         DM1.cdsCNTCaja.FieldByName('DCDH').AsString := 'H';
       end
      else
       begin                                            //Provision en Mon.Ext.
        xDif_Camb:= abs(DM1.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat -
                        DM1.cdsRegCxP.FieldByName('DEMTOEXT').AsFloat * DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat);//En Mon.Local
        DM1.cdsCNTCaja.FieldByName('DCMTOLO').AsFloat := xDif_Camb;
        if DM1.cdsRegCxP.FieldByName('DETCDOC').AsFloat > DM1.cdsRegCxP.FieldByName('DETCPAG').AsFloat then
         DM1.cdsCNTCaja.FieldByName('DCDH').AsString := 'H'
        else
         DM1.cdsCNTCaja.FieldByName('DCDH').AsString := 'D';
       end;

      if DM1.cdsCNTCaja.FieldByName('DCDH').AsString = 'D' then
       begin
        DM1.cdsCNTCaja.FieldByName('CPTOID').AsString  :=  wCptoPer;
        DM1.cdsCNTCaja.FieldByName('CUENTAID').AsString:=  wCtaPer;
       end
      else
       begin
        DM1.cdsCNTCaja.FieldByName('CPTOID').AsString  :=  wCptoGan;
        DM1.cdsCNTCaja.FieldByName('CUENTAID').AsString:=  wCtaGan;
       end;
       DM1.cdsCNTCaja.post;
     end;
   end;
end;

procedure TFToolConta.Contab_EgrCaja;
begin
   DM1.cdsCNTCaja.FieldByName('CIAID').AsString   := DM1.cdsEgrcaja.FieldByName('CIAID').AsString;
   DM1.cdsCNTCaja.FieldByName('TDIARID').AsString := DM1.cdsEgrCaja.FieldByName('TDIARID').AsString;
   DM1.cdsCNTCaja.FieldByName('ECANOMM').AsString := DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString;
   DM1.cdsCNTCaja.FieldByName('ECNOCOMP').AsString:= DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
   DM1.cdsCNTCaja.FieldByName('DCLOTE').AsString  := DM1.cdsEgrCaja.FieldByName('ECLOTE').AsString;
   DM1.cdsCNTCaja.FieldByName('DOCID').AsString   := DM1.cdsEgrCaja.FieldByName('DOCID').AsString;
   //a pedido de jlc 20/12/2002
   DM1.DisplayDescrip('prvTGE','TGE112','FCHQ,FCBCO','FPAGOID='+quotedstr(DM1.cdsEgrCaja.FieldByName('FPAGOID').AsString),'FCHQ');
   if ((DM1.cdsQry.fieldbyname('FCHQ').AsString='1') or (DM1.cdsQry.fieldbyname('FCHQ').AsString='S'))
      and (DM1.cdsQry.fieldbyname('FCBCO').AsString='S')
       then
      DM1.cdsCNTCaja.FieldByName('DCNODOC').AsString := DM1.cdsEgrCaja.FieldByName('ECNOCHQ').AsString
   else
      DM1.cdsCNTCaja.FieldByName('DCNODOC').AsString := DM1.cdsEgrCaja.FieldByName('ECNODOC').AsString;

   DM1.cdsCNTCaja.FieldByName('ECFCOMP').AsDateTime := DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
   DM1.cdsCNTCaja.FieldByName('CPTOID').AsString  := DM1.cdsEgrCaja.FieldByName('CPTOID').AsString;
   DM1.cdsCNTCaja.FieldByName('CUENTAID').AsString:= DM1.cdsEgrCaja.FieldByName('CUENTAID').AsString;
   DM1.cdsCNTCaja.FieldByName('DCDH').AsString    := 'H';
   DM1.cdsCNTCaja.FieldByName('DCTCAMPA').AsFloat:= DM1.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DM1.cdsCNTCaja.FieldByName('DCTCAMPR').AsFloat:= DM1.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat;
   DM1.cdsCNTCaja.FieldByName('TMONID').AsString  := DM1.cdsEgrCaja.FieldByName('TMONID').AsString;
   DM1.cdsCNTCaja.FieldByName('DCMTOLO').AsFloat := dm1.FRound(DM1.cdsEgrCaja.FieldByName('ECMTOLOC').AsFloat-xRetLoc,15,2);
   DM1.cdsCNTCaja.FieldByName('DCMTOEXT').AsFloat:= dm1.FRound(DM1.cdsEgrCaja.FieldByName('ECMTOEXT').AsFloat-xRetExt,15,2);
   if DM1.cdsCNTCaja.FieldByName('TMONID').AsString=DM1.wTMonLoc then
   begin
     DM1.cdsCNTCaja.FieldByName('DCMTOORI').AsFloat:= DM1.cdsCNTCaja.FieldByName('DCMTOLO').AsFloat;
   end
   else
   begin
     DM1.cdsCNTCaja.FieldByName('DCMTOORI').AsFloat:= DM1.cdsCNTCaja.FieldByName('DCMTOEXT').AsFloat;
   end;

   DM1.cdsCNTCaja.FieldByName('DCFLACDR').AsString:= 'S';   //Registro ya cuadrado
   DM1.cdsCNTCaja.FieldByName('DCUSER').AsString  := DM1.wUsuario;
   DM1.cdsCNTCaja.FieldByName('DCFREG').AsDateTime  := DateS;
  DM1.cdsCNTCaja.FieldByName('DCHREG').AsDateTime  := DateS+Time;
   DM1.cdsCNTCaja.FieldByName('DCANO').AsString   := DM1.cdsEgrCaja.FieldByName('ECANO').AsString;
   DM1.cdsCNTCaja.FieldByName('DCMM').AsString    := DM1.cdsEgrCaja.FieldByName('ECMM').AsString;
   DM1.cdsCNTCaja.FieldByName('DCDD').AsString    := DM1.cdsEgrCaja.FieldByName('ECDD').AsString;
   DM1.cdsCNTCaja.FieldByName('DCSS').AsString    := DM1.cdsEgrCaja.FieldByName('ECSS').AsString;
   DM1.cdsCNTCaja.FieldByName('DCSEM').AsString   := DM1.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DM1.cdsCNTCaja.FieldByName('DCTRI').AsString   := DM1.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DM1.cdsCNTCaja.FieldByName('DCAASS').AsString  := DM1.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DM1.cdsCNTCaja.FieldByName('DCAASEM').AsString := DM1.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DM1.cdsCNTCaja.FieldByName('DCAATRI').AsString := DM1.cdsEgrCaja.FieldByName('ECAATRI').AsString;
   DM1.cdsCNTCaja.FieldByName('DCGLOSA').AsString := DM1.cdsEgrCaja.FieldByName('ECGIRA').AsString;
   DM1.cdsCNTCaja.FieldByName('FCAB').AsString := '1' ;
   DM1.cdsCNTCaja.fieldbyname('DOCMOD').AsString  := DM1.cdsRegCxP.FieldByName('DOCMOD').AsString;
   DM1.cdsCNTCaja.fieldbyname('DCFEMIS').AsDateTime := DM1.cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime;
   DM1.cdsCNTCaja.fieldbyname('DCFVCMTO').AsDateTime:= DM1.cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime;
   xNReg:=xNReg+1;
   DM1.cdsCNTCaja.fieldbyName('NREG').AsInteger  := xNReg;
   DM1.cdsCNTCaja.post;
end;

procedure TFToolConta.AsientoDifTotal;
begin
   // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO
     DM1.cdsCNTCaja.Insert;
     DM1.cdsCNTCaja.FieldByName('CIAID').AsString   :=  DM1.cdsEgrCaja.FieldByName('CIAID').AsString;
     DM1.cdsCNTCaja.FieldByName('TDIARID').AsString :=  DM1.cdsEgrCaja.FieldByName('TDIARID').AsString;
     DM1.cdsCNTCaja.FieldByName('ECANOMM').AsString :=  DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString;
     DM1.cdsCNTCaja.FieldByName('ECNOCOMP').AsString:=  DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
     DM1.cdsCNTCaja.FieldByName('DCLOTE').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECLOTE').AsString;
     DM1.cdsCNTCaja.FieldByName('ECFCOMP').AsDateTime :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
     DM1.cdsCNTCaja.FieldByName('DCFEMIS').AsDateTime :=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
     DM1.cdsCNTCaja.FieldByName('DCFVCMTO').AsDateTime:=  DM1.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime;
     DM1.cdsCNTCaja.FieldByName('DCTCAMPA').AsFloat := DM1.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat ;
     DM1.cdsCNTCaja.FieldByName('DCTCAMPR').AsFloat := DM1.cdsEgrCaja.FieldByName('ECTCAMB').AsFloat ;
     DM1.cdsCNTCaja.FieldByName('DCANO').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECANO').AsString;
     DM1.cdsCNTCaja.FieldByName('DCMM').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECMM').AsString;
     DM1.cdsCNTCaja.FieldByName('DCDD').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECDD').AsString;
     DM1.cdsCNTCaja.FieldByName('DCSS').AsString    :=  DM1.cdsEgrCaja.FieldByName('ECSS').AsString;
     DM1.cdsCNTCaja.FieldByName('DCSEM').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECSEM').AsString;
     DM1.cdsCNTCaja.FieldByName('DCTRI').AsString   :=  DM1.cdsEgrCaja.FieldByName('ECTRI').AsString;
     DM1.cdsCNTCaja.FieldByName('DCAASS').AsString  :=  DM1.cdsEgrCaja.FieldByName('ECAASS').AsString;
     DM1.cdsCNTCaja.FieldByName('DCAASEM').AsString :=  DM1.cdsEgrCaja.FieldByName('ECAASEM').AsString;
     DM1.cdsCNTCaja.FieldByName('DCAATRI').AsString :=  DM1.cdsEgrCaja.FieldByName('ECAATRI').AsString;

     DM1.cdsCNTCaja.FieldByName('DCFLACDR').AsString:=  'S';   //Registro ya cuadrado
     DM1.cdsCNTCaja.FieldByName('DCUSER').AsString  :=  DM1.wUsuario;
     DM1.cdsCNTCaja.FieldByName('DCFREG').AsDateTime  :=  Date;
     DM1.cdsCNTCaja.FieldByName('DCHREG').AsDateTime  :=  date+time;
     DM1.cdsCNTCaja.FieldByName('TMONID').AsString  :=  DM1.cdsEgrCaja.FieldByName('TMONID').AsString;
     xNReg:=xNReg+1;
     DM1.cdsCNTCaja.fieldbyName('NREG').AsInteger  := xNReg;

   if (dm1.FRound(xDebeT,15,2)<>dm1.FRound(xHabeT,15,2) ) then
    begin
     if xDebeT>xHabeT then
      begin
       DM1.cdsCNTCaja.FieldByName('DCMTOLO').AsFloat   := abs(dm1.FRound(xDebeT-xHabeT,15,2));
       DM1.cdsCNTCaja.FieldByName('DCMTOEXT').AsFloat  := 0;
       DM1.cdsCNTCaja.FieldByName('DCDH').AsString     := 'H';
       DM1.cdsCNTCaja.FieldByName('CPTOID').AsString   :=  wCptoGan;
       DM1.cdsCNTCaja.FieldByName('CUENTAID').AsString :=  wCtaGan;
       DM1.cdsCNTCaja.FieldByName('DCGLOSA').AsString  := 'Diferencia de Cambio';
      end
     else
      begin
       DM1.cdsCNTCaja.FieldByName('DCMTOLO').AsFloat   := abs(dm1.FRound(xHabeT-xDebeT,15,2));
       DM1.cdsCNTCaja.FieldByName('DCMTOEXT').AsFloat  := 0;
       DM1.cdsCNTCaja.FieldByName('DCDH').AsString     := 'D';
       DM1.cdsCNTCaja.FieldByName('CPTOID').AsString   :=  wCptoPer;
       DM1.cdsCNTCaja.FieldByName('CUENTAID').AsString :=  wCtaPer;
       DM1.cdsCNTCaja.FieldByName('DCGLOSA').AsString  := 'Diferencia de Cambio';
      end;
    end;

   if (dm1.FRound(xDebeTD,15,2)<>dm1.FRound(xHabeTD,15,2) ) then
    begin
     if xDebeTD>xHabeTD then
      begin
       DM1.cdsCNTCaja.FieldByName('DCMTOLO').AsFloat   := 0;
       DM1.cdsCNTCaja.FieldByName('DCMTOEXT').AsFloat  := abs(dm1.FRound(xDebeTD-xHabeTD,15,2));
       DM1.cdsCNTCaja.FieldByName('DCDH').AsString     := 'H';
       DM1.cdsCNTCaja.FieldByName('CPTOID').AsString   := wCptoGan;
       DM1.cdsCNTCaja.FieldByName('CUENTAID').AsString := wCtaGan;
       DM1.cdsCNTCaja.FieldByName('DCGLOSA').AsString  := 'Diferencia de Cambio';
      end
     else
      begin
       DM1.cdsCNTCaja.FieldByName('DCMTOLO').AsFloat   := 0;
       DM1.cdsCNTCaja.FieldByName('DCMTOEXT').AsFloat  := abs(dm1.FRound(xHabeTD-xDebeTD,15,2));
       DM1.cdsCNTCaja.FieldByName('DCDH').AsString     := 'D';
       DM1.cdsCNTCaja.FieldByName('CPTOID').AsString   :=  wCptoPer;
       DM1.cdsCNTCaja.FieldByName('CUENTAID').AsString :=  wCtaPer;
       DM1.cdsCNTCaja.FieldByName('DCGLOSA').AsString  := 'Diferencia de Cambio';
      end;
   end;
   DM1.cdsCNTCaja.post;
end;

procedure TFToolConta.RecCptosDifC;
begin
 if not RecuperarDatos('TGE106','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP,CCOSDIF','BANCOID='+
                       quotedstr(DM1.cdsEgrCaja.FieldByName('BANCOID').AsString)+
                      ' AND CCBCOID='+
                      quotedstr(DM1.cdsEgrCaja.FieldByName('CCBCOID').AsString))  then
  Raise exception.create('No se puede Contabilizar '+#13+'Falta Definir las Cuentas de Dif. de Cambio') ;
 wCptoGan  := DM1.cdsRec.fieldbyname('CPTODIFG').AsString ;
 wCptoPer  := DM1.cdsRec.fieldbyname('CPTODIFP').AsString ;
 wCtaGan   := DM1.cdsRec.fieldbyname('CTADIFG').AsString ;
 wCtaPer   := DM1.cdsRec.fieldbyname('CTADIFP').AsString ;
 wCCosDif  := DM1.cdsRec.fieldbyname('CCOSDIF').AsString ;
end;

function TFToolConta.RecuperarDatos(xTabla, xCampos,
  xWhere: String): Boolean;
begin
 SQLSelect(xTabla,xCampos,xWhere);
 DM1.cdsRec.active := False ;
 DM1.cdsRec.active := True ;

 if DM1.cdsRec.RecordCount=0 then
   Result := False
 else
  Result := True ;
end;

procedure TFToolConta.SQLSelect(const xTabla, xCampos, xWhere: WideString);
var   xSQL : String ;
begin
  if xWhere = '' then
     xSQL := 'SELECT '+xCampos+ ' FROM '+ xTabla
   else
     xSQL := 'SELECT '+xCampos+ ' FROM '+ xTabla +' WHERE '+xWhere ;
   DM1.cdsRec.close;
   DM1.cdsRec.dataRequest(xSQL);
end;

procedure TFToolConta.z2bbtnCreClick(Sender: TObject);
var
 xSql : String;
begin
 xSql := 'SELECT * FROM CAJA321 WHERE ECANOMM='+quotedstr(wAno+wMes)+
         ' AND EC_PROCE='+quotedstr('W');
 wViene := 'W';
 LevantaMant(xSql);
end;

procedure TFToolConta.z2bbtnCobClick(Sender: TObject);
var
 xSql : String;
begin
 xSql := 'SELECT * FROM CAJA321 WHERE ECANOMM='+quotedstr(wAno+wMes)+
         ' AND EC_PROCE='+quotedstr('Y');
 wViene := 'Y';
 LevantaMant(xSql);
end;

procedure TFToolConta.z2bbtnApoClick(Sender: TObject);
var
 xSql : String;
begin
 xSql := 'SELECT * FROM CAJA321 WHERE ECANOMM='+quotedstr(wAno+wMes)+
         ' AND EC_PROCE='+quotedstr('X');
 wViene := 'X';
 LevantaMant(xSql);
end;

procedure TFToolConta.z2bbtnPreClick(Sender: TObject);
var
 xSql : String;
begin
 xSql := 'SELECT * FROM CAJA321 WHERE ECANOMM='+quotedstr(wAno+wMes)+
         ' AND EC_PROCE='+quotedstr('Z');
 wViene := 'Z';
 LevantaMant(xSql);
end;

procedure TFToolConta.LevantaMant(pSql : String);
begin
 Fprincipal.mtxContab.UsuarioSQL.Clear;
 Fprincipal.mtxContab.UsuarioSQL.Add(pSql);
 Fprincipal.mtxContab.NewQuery;
end;

procedure TFToolConta.ActualizaSaldosTGE401(ccPgoOri, ccPgoLoc, ccPgoExt: double; sSigno: String);
var
  xDia,xAno,xMes : word;
  xDatAux : StructSaldosAux;
begin
   with  xDatAux do
    begin
     CIAID     :=  xCiaid;
     CLAUXID   :=  xClauxid;
     AUXID     :=  xAuxid;
     MONTOMN   :=  floattostr(ccPgoLoc);
     if trim(MONTOMN) = '' then
      MONTOMN := '0';

     MONTOME   :=  floattostr(ccPgoExt);
     if trim(MONTOME) = '' then
      MONTOME := '0';

     FECHA     :=  xFechaCom;
     if trim(MTOSLOC) = '' then
      MTOSLOC := '0';

     if trim(MTOSEXT) = '' then
      MTOSEXT := '0';

     DecodeDate(xDatAux.FECHA,xAno,xMes,xDia);
     ActSdoAuxiliar(xDatAux.CIAID,FloatToStr(xANO),Dm1.StrZero(FloatToStr(xMES),2),
                        xDatAux.CLAUXID,xDatAux.AUXID ,xDatAux.MONTOMN,
                        xDatAux.MONTOME,xDatAux.MTOSLOC,xDatAux.MTOSEXT,sSigno);
     end;
end;

procedure TFToolConta.ActSdoAuxiliar(const xCIAID, xANO, xMES, xCLAUXID,
  xAUXID, MONTOMN, MONTOME, MTOSLOC, MTOSEXT, xOper: String);
var
   xWhere,xParte1,xParte2,xParte11,xParte22 : String;
   xSQL : String;
   xxSaldo13 : String;
   xxSaldo01, xxSaldo02, xxSaldo03, xxSaldo04, xxSaldo05, xxSaldo06 : String;
   xxSaldo07, xxSaldo08, xxSaldo09, xxSaldo10, xxSaldo11, xxSaldo12 : String;
begin
   xSQL := 'SELECT * FROM TGE401 WHERE CIAID = '+quotedstr(xCIAID)+
           ' AND ANO = '+quotedstr(xANO)+
           ' AND CLAUXID = '+quotedstr(xCLAUXID)+
           ' AND AUXID = '+quotedstr(xAUXID);
   DM1.cdsQry.close;
//   DM1.cdsQry.ProviderName := 'prvTGE';
   DM1.Filtracds(DM1.cdsQry,xSQL);

   if DM1.cdsQry.recordcount > 0 then
   begin
      if xOper = '+' then
       XSQL:='UPDATE TGE401 '
            + 'SET HABETMN'+XMES+'='+Dm1.wReplacCeros+'(HABETMN'+xMES+' ,0)+ '+MONTOMN+', '
            +      'HABETME'+XMES+'='+Dm1.wReplacCeros+'(HABETME'+xMES+' ,0)+ '+MONTOME+', '
            +      'HABESMN'+XMES+'='+Dm1.wReplacCeros+'(HABESMN'+xMES+' ,0)+ '+MTOSLOC+', '
            +      'HABESME'+XMES+'='+Dm1.wReplacCeros+'(HABESME'+xMES+' ,0)+ '+MTOSEXT
            + ' WHERE CIAID ='+quotedstr(xCIAID)+' AND ANO ='+quotedstr(xANO)
            +      ' AND CLAUXID='+quotedstr(xCLAUXID)+' AND AUXID  ='+quotedstr(xAUXID)
      else
       XSQL:='UPDATE TGE401 '
            + 'SET HABETMN'+XMES+'='+Dm1.wReplacCeros+'(HABETMN'+xMES+',0) + '+MONTOMN+', '
            +      'HABETME'+XMES+'='+Dm1.wReplacCeros+'(HABETME'+xMES+',0) + '+MONTOME+', '
            +      'HABESMN'+XMES+'='+Dm1.wReplacCeros+'(HABESMN'+xMES+',0) + '+MTOSLOC+', '
            +      'HABESME'+XMES+'='+Dm1.wReplacCeros+'(HABESME'+xMES+',0) + '+MTOSEXT
            +' WHERE CIAID ='+quotedstr(xCIAID)+' AND ANO ='+quotedstr(xANO)
            +      ' AND CLAUXID='+quotedstr(xCLAUXID)+' AND AUXID  ='+quotedstr(xAUXID)
   end
   else
   begin
      XSQL:='INSERT INTO TGE401 (CIAID,ANO,CLAUXID,AUXID,HABETMN'+XMES+',HABETME'+XMES +
                       ', HABESMN'+XMES+',HABESME'+XMES+')   ' +
                       ' VALUES('+quotedstr(XCIAID)+','+quotedstr(XANO)+','+
                       quotedstr(xCLAUXID)+','+quotedstr(xAUXID)+','+
                       MONTOMN + ','+MONTOME+','+MTOSLOC+','+MTOSEXT +')' ;
   end                                                                                           ;

   DM1.DCOM1.AppServer.EjecutaSQL(xSQL);

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
  xSQL := 'UPDATE TGE401 SET ';
  xxSaldo01:='( '+Dm1.wReplacCeros+'(SALDTMN00,0)+'+Dm1.wReplacCeros+'(DEBETMN01,0)-'+Dm1.wReplacCeros+'(HABETMN01,0))';
  xxSaldo02:='( '+Dm1.wReplacCeros+'(SALDTMN00,0)+'+Dm1.wReplacCeros+'(DEBETMN01,0)-'+Dm1.wReplacCeros+'(HABETMN01,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN02,0)-'+Dm1.wReplacCeros+'(HABETMN02,0) )';
  xxSaldo03:='( '+Dm1.wReplacCeros+'(SALDTMN00,0)+'+Dm1.wReplacCeros+'(DEBETMN01,0)-'+Dm1.wReplacCeros+'(HABETMN01,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN02,0)-'+Dm1.wReplacCeros+'(HABETMN02,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN03,0)-'+Dm1.wReplacCeros+'(HABETMN03,0) )';
  xxSaldo04:='( '+Dm1.wReplacCeros+'(SALDTMN00,0)+'+Dm1.wReplacCeros+'(DEBETMN01,0)-'+Dm1.wReplacCeros+'(HABETMN01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETMN02,0)-'+Dm1.wReplacCeros+'(HABETMN02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETMN03,0)-'+Dm1.wReplacCeros+'(HABETMN03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETMN04,0)-'+Dm1.wReplacCeros+'(HABETMN04,0) )';
  xxSaldo05:='( '+Dm1.wReplacCeros+'(SALDTMN00,0)+'+Dm1.wReplacCeros+'(DEBETMN01,0)-'+Dm1.wReplacCeros+'(HABETMN01,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN02,0)-'+Dm1.wReplacCeros+'(HABETMN02,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN03,0)-'+Dm1.wReplacCeros+'(HABETMN03,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN04,0)-'+Dm1.wReplacCeros+'(HABETMN04,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN05,0)-'+Dm1.wReplacCeros+'(HABETMN05,0) )';
  xxSaldo06:='( '+Dm1.wReplacCeros+'(SALDTMN00,0)+'+Dm1.wReplacCeros+'(DEBETMN01,0)-'+Dm1.wReplacCeros+'(HABETMN01,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN02,0)-'+Dm1.wReplacCeros+'(HABETMN02,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN03,0)-'+Dm1.wReplacCeros+'(HABETMN03,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN04,0)-'+Dm1.wReplacCeros+'(HABETMN04,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN05,0)-'+Dm1.wReplacCeros+'(HABETMN05,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN06,0)-'+Dm1.wReplacCeros+'(HABETMN06,0) )';
  xxSaldo07:='( '+Dm1.wReplacCeros+'(SALDTMN00,0)+'+Dm1.wReplacCeros+'(DEBETMN01,0)-'+Dm1.wReplacCeros+'(HABETMN01,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN02,0)-'+Dm1.wReplacCeros+'(HABETMN02,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN03,0)-'+Dm1.wReplacCeros+'(HABETMN03,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN04,0)-'+Dm1.wReplacCeros+'(HABETMN04,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN05,0)-'+Dm1.wReplacCeros+'(HABETMN05,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN06,0)-'+Dm1.wReplacCeros+'(HABETMN06,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN07,0)-'+Dm1.wReplacCeros+'(HABETMN07,0) )';
  xxSaldo08:='( '+Dm1.wReplacCeros+'(SALDTMN00,0)+'+Dm1.wReplacCeros+'(DEBETMN01,0)-'+Dm1.wReplacCeros+'(HABETMN01,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN02,0)-'+Dm1.wReplacCeros+'(HABETMN02,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN03,0)-'+Dm1.wReplacCeros+'(HABETMN03,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN04,0)-'+Dm1.wReplacCeros+'(HABETMN04,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN05,0)-'+Dm1.wReplacCeros+'(HABETMN05,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN06,0)-'+Dm1.wReplacCeros+'(HABETMN06,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN07,0)-'+Dm1.wReplacCeros+'(HABETMN07,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN08,0)-'+Dm1.wReplacCeros+'(HABETMN08,0) )';
  xxSaldo09:='( '+Dm1.wReplacCeros+'(SALDTMN00,0)+'+Dm1.wReplacCeros+'(DEBETMN01,0)-'+Dm1.wReplacCeros+'(HABETMN01,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN02,0)-'+Dm1.wReplacCeros+'(HABETMN02,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN03,0)-'+Dm1.wReplacCeros+'(HABETMN03,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN04,0)-'+Dm1.wReplacCeros+'(HABETMN04,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN05,0)-'+Dm1.wReplacCeros+'(HABETMN05,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN06,0)-'+Dm1.wReplacCeros+'(HABETMN06,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN07,0)-'+Dm1.wReplacCeros+'(HABETMN07,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN08,0)-'+Dm1.wReplacCeros+'(HABETMN08,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN09,0)-'+Dm1.wReplacCeros+'(HABETMN09,0) )';
  xxSaldo10:='( '+Dm1.wReplacCeros+'(SALDTMN00,0)+'+Dm1.wReplacCeros+'(DEBETMN01,0)-'+Dm1.wReplacCeros+'(HABETMN01,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN02,0)-'+Dm1.wReplacCeros+'(HABETMN02,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN03,0)-'+Dm1.wReplacCeros+'(HABETMN03,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN04,0)-'+Dm1.wReplacCeros+'(HABETMN04,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN05,0)-'+Dm1.wReplacCeros+'(HABETMN05,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN06,0)-'+Dm1.wReplacCeros+'(HABETMN06,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN07,0)-'+Dm1.wReplacCeros+'(HABETMN07,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN08,0)-'+Dm1.wReplacCeros+'(HABETMN08,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN09,0)-'+Dm1.wReplacCeros+'(HABETMN09,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN10,0)-'+Dm1.wReplacCeros+'(HABETMN10,0) )';
  xxSaldo11:='( '+Dm1.wReplacCeros+'(SALDTMN00,0)+'+Dm1.wReplacCeros+'(DEBETMN01,0)-'+Dm1.wReplacCeros+'(HABETMN01,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN02,0)-'+Dm1.wReplacCeros+'(HABETMN02,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN03,0)-'+Dm1.wReplacCeros+'(HABETMN03,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN04,0)-'+Dm1.wReplacCeros+'(HABETMN04,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN05,0)-'+Dm1.wReplacCeros+'(HABETMN05,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN06,0)-'+Dm1.wReplacCeros+'(HABETMN06,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN07,0)-'+Dm1.wReplacCeros+'(HABETMN07,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN08,0)-'+Dm1.wReplacCeros+'(HABETMN08,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN09,0)-'+Dm1.wReplacCeros+'(HABETMN09,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN10,0)-'+Dm1.wReplacCeros+'(HABETMN10,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN11,0)-'+Dm1.wReplacCeros+'(HABETMN11,0) )';
  xxSaldo12:='( '+Dm1.wReplacCeros+'(SALDTMN00,0)+'+Dm1.wReplacCeros+'(DEBETMN01,0)-'+Dm1.wReplacCeros+'(HABETMN01,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN02,0)-'+Dm1.wReplacCeros+'(HABETMN02,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN03,0)-'+Dm1.wReplacCeros+'(HABETMN03,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN04,0)-'+Dm1.wReplacCeros+'(HABETMN04,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN05,0)-'+Dm1.wReplacCeros+'(HABETMN05,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN06,0)-'+Dm1.wReplacCeros+'(HABETMN06,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN07,0)-'+Dm1.wReplacCeros+'(HABETMN07,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN08,0)-'+Dm1.wReplacCeros+'(HABETMN08,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN09,0)-'+Dm1.wReplacCeros+'(HABETMN09,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN10,0)-'+Dm1.wReplacCeros+'(HABETMN10,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN11,0)-'+Dm1.wReplacCeros+'(HABETMN11,0) '
                               +'+'+Dm1.wReplacCeros+'(DEBETMN12,0)-'+Dm1.wReplacCeros+'(HABETMN12,0) )';
  xxSaldo13:='( '+Dm1.wReplacCeros+'(SALDTMN00,0)+'+Dm1.wReplacCeros+'(DEBETMN01,0)-'+Dm1.wReplacCeros+'(HABETMN01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETMN02,0)-'+Dm1.wReplacCeros+'(HABETMN02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETMN03,0)-'+Dm1.wReplacCeros+'(HABETMN03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETMN04,0)-'+Dm1.wReplacCeros+'(HABETMN04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETMN05,0)-'+Dm1.wReplacCeros+'(HABETMN05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETMN06,0)-'+Dm1.wReplacCeros+'(HABETMN06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETMN07,0)-'+Dm1.wReplacCeros+'(HABETMN07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETMN08,0)-'+Dm1.wReplacCeros+'(HABETMN08,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETMN09,0)-'+Dm1.wReplacCeros+'(HABETMN09,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETMN10,0)-'+Dm1.wReplacCeros+'(HABETMN10,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETMN11,0)-'+Dm1.wReplacCeros+'(HABETMN11,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETMN12,0)-'+Dm1.wReplacCeros+'(HABETMN12,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETMN13,0)-'+Dm1.wReplacCeros+'(HABETMN13,0) )';
  xParte1 := 'SALDTMN01='+xxSaldo01
             +',SALDTMN02='+xxSaldo02
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

  xxSaldo01:='( '+Dm1.wReplacCeros+'(SALDTME00,0)+'+Dm1.wReplacCeros+'(DEBETME01,0)-'+Dm1.wReplacCeros+'(HABETME01,0) )';
  xxSaldo02:='( '+Dm1.wReplacCeros+'(SALDTME00,0)+'+Dm1.wReplacCeros+'(DEBETME01,0)-'+Dm1.wReplacCeros+'(HABETME01,0) '
                                    +'+'+Dm1.wReplacCeros+'(DEBETME02,0)-'+Dm1.wReplacCeros+'(HABETME02,0) )';
  xxSaldo03:='( '+Dm1.wReplacCeros+'(SALDTME00,0)+'+Dm1.wReplacCeros+'(DEBETME01,0)-'+Dm1.wReplacCeros+'(HABETME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME02,0)-'+Dm1.wReplacCeros+'(HABETME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME03,0)-'+Dm1.wReplacCeros+'(HABETME03,0) )';
  xxSaldo04:='( '+Dm1.wReplacCeros+'(SALDTME00,0)+'+Dm1.wReplacCeros+'(DEBETME01,0)-'+Dm1.wReplacCeros+'(HABETME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME02,0)-'+Dm1.wReplacCeros+'(HABETME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME03,0)-'+Dm1.wReplacCeros+'(HABETME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME04,0)-'+Dm1.wReplacCeros+'(HABETME04,0) )';
  xxSaldo05:='( '+Dm1.wReplacCeros+'(SALDTME00,0)+'+Dm1.wReplacCeros+'(DEBETME01,0)-'+Dm1.wReplacCeros+'(HABETME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME02,0)-'+Dm1.wReplacCeros+'(HABETME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME03,0)-'+Dm1.wReplacCeros+'(HABETME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME04,0)-'+Dm1.wReplacCeros+'(HABETME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME05,0)-'+Dm1.wReplacCeros+'(HABETME05,0) )';
  xxSaldo06:='( '+Dm1.wReplacCeros+'(SALDTME00,0)+'+Dm1.wReplacCeros+'(DEBETME01,0)-'+Dm1.wReplacCeros+'(HABETME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME02,0)-'+Dm1.wReplacCeros+'(HABETME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME03,0)-'+Dm1.wReplacCeros+'(HABETME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME04,0)-'+Dm1.wReplacCeros+'(HABETME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME05,0)-'+Dm1.wReplacCeros+'(HABETME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME06,0)-'+Dm1.wReplacCeros+'(HABETME06,0) )';
  xxSaldo07:='( '+Dm1.wReplacCeros+'(SALDTME00,0)+'+Dm1.wReplacCeros+'(DEBETME01,0)-'+Dm1.wReplacCeros+'(HABETME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME02,0)-'+Dm1.wReplacCeros+'(HABETME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME03,0)-'+Dm1.wReplacCeros+'(HABETME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME04,0)-'+Dm1.wReplacCeros+'(HABETME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME05,0)-'+Dm1.wReplacCeros+'(HABETME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME06,0)-'+Dm1.wReplacCeros+'(HABETME06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME07,0)-'+Dm1.wReplacCeros+'(HABETME07,0) )';
  xxSaldo08:='( '+Dm1.wReplacCeros+'(SALDTME00,0)+'+Dm1.wReplacCeros+'(DEBETME01,0)-'+Dm1.wReplacCeros+'(HABETME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME02,0)-'+Dm1.wReplacCeros+'(HABETME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME03,0)-'+Dm1.wReplacCeros+'(HABETME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME04,0)-'+Dm1.wReplacCeros+'(HABETME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME05,0)-'+Dm1.wReplacCeros+'(HABETME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME06,0)-'+Dm1.wReplacCeros+'(HABETME06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME07,0)-'+Dm1.wReplacCeros+'(HABETME07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME08,0)-'+Dm1.wReplacCeros+'(HABETME08,0) )';
  xxSaldo09:='( '+Dm1.wReplacCeros+'(SALDTME00,0)+'+Dm1.wReplacCeros+'(DEBETME01,0)-'+Dm1.wReplacCeros+'(HABETME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME02,0)-'+Dm1.wReplacCeros+'(HABETME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME03,0)-'+Dm1.wReplacCeros+'(HABETME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME04,0)-'+Dm1.wReplacCeros+'(HABETME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME05,0)-'+Dm1.wReplacCeros+'(HABETME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME06,0)-'+Dm1.wReplacCeros+'(HABETME06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME07,0)-'+Dm1.wReplacCeros+'(HABETME07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME08,0)-'+Dm1.wReplacCeros+'(HABETME08,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME09,0)-'+Dm1.wReplacCeros+'(HABETME09,0) )';
  xxSaldo10:='( '+Dm1.wReplacCeros+'(SALDTME00,0)+'+Dm1.wReplacCeros+'(DEBETME01,0)-'+Dm1.wReplacCeros+'(HABETME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME02,0)-'+Dm1.wReplacCeros+'(HABETME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME03,0)-'+Dm1.wReplacCeros+'(HABETME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME04,0)-'+Dm1.wReplacCeros+'(HABETME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME05,0)-'+Dm1.wReplacCeros+'(HABETME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME06,0)-'+Dm1.wReplacCeros+'(HABETME06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME07,0)-'+Dm1.wReplacCeros+'(HABETME07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME08,0)-'+Dm1.wReplacCeros+'(HABETME08,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME09,0)-'+Dm1.wReplacCeros+'(HABETME09,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME10,0)-'+Dm1.wReplacCeros+'(HABETME10,0) )';
  xxSaldo11:='( '+Dm1.wReplacCeros+'(SALDTME00,0)+'+Dm1.wReplacCeros+'(DEBETME01,0)-'+Dm1.wReplacCeros+'(HABETME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME02,0)-'+Dm1.wReplacCeros+'(HABETME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME03,0)-'+Dm1.wReplacCeros+'(HABETME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME04,0)-'+Dm1.wReplacCeros+'(HABETME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME05,0)-'+Dm1.wReplacCeros+'(HABETME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME06,0)-'+Dm1.wReplacCeros+'(HABETME06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME07,0)-'+Dm1.wReplacCeros+'(HABETME07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME08,0)-'+Dm1.wReplacCeros+'(HABETME08,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME09,0)-'+Dm1.wReplacCeros+'(HABETME09,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME10,0)-'+Dm1.wReplacCeros+'(HABETME10,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME11,0)-'+Dm1.wReplacCeros+'(HABETME11,0) )';
  xxSaldo12:='( '+Dm1.wReplacCeros+'(SALDTME00,0)+'+Dm1.wReplacCeros+'(DEBETME01,0)-'+Dm1.wReplacCeros+'(HABETME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME02,0)-'+Dm1.wReplacCeros+'(HABETME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME03,0)-'+Dm1.wReplacCeros+'(HABETME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME04,0)-'+Dm1.wReplacCeros+'(HABETME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME05,0)-'+Dm1.wReplacCeros+'(HABETME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME06,0)-'+Dm1.wReplacCeros+'(HABETME06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME07,0)-'+Dm1.wReplacCeros+'(HABETME07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME08,0)-'+Dm1.wReplacCeros+'(HABETME08,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME09,0)-'+Dm1.wReplacCeros+'(HABETME09,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME10,0)-'+Dm1.wReplacCeros+'(HABETME10,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME11,0)-'+Dm1.wReplacCeros+'(HABETME11,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME12,0)-'+Dm1.wReplacCeros+'(HABETME12,0) )';
  xxSaldo13:='( '+Dm1.wReplacCeros+'(SALDTME00,0)+'+Dm1.wReplacCeros+'(DEBETME01,0)-'+Dm1.wReplacCeros+'(HABETME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME02,0)-'+Dm1.wReplacCeros+'(HABETME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME03,0)-'+Dm1.wReplacCeros+'(HABETME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME04,0)-'+Dm1.wReplacCeros+'(HABETME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME05,0)-'+Dm1.wReplacCeros+'(HABETME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME06,0)-'+Dm1.wReplacCeros+'(HABETME06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME07,0)-'+Dm1.wReplacCeros+'(HABETME07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME08,0)-'+Dm1.wReplacCeros+'(HABETME08,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME09,0)-'+Dm1.wReplacCeros+'(HABETME09,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME10,0)-'+Dm1.wReplacCeros+'(HABETME10,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME11,0)-'+Dm1.wReplacCeros+'(HABETME11,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME12,0)-'+Dm1.wReplacCeros+'(HABETME12,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBETME13,0)-'+Dm1.wReplacCeros+'(HABETME13,0) ) ';
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
  Dm1.DCOM1.AppServer.EjecutaSQL(xSQL);

//////////////////////////////////////
//                                  //
//   Actualiza DebeSMN y HaberSME   //
//                                  //
//////////////////////////////////////
  xSQL := 'UPDATE TGE401 SET ';
  xxSaldo01:='( '+Dm1.wReplacCeros+'(SALDSMN00,0)+'+Dm1.wReplacCeros+'(DEBESMN01,0)-'+Dm1.wReplacCeros+'(HABESMN01,0) )';
  xxSaldo02:='( '+Dm1.wReplacCeros+'(SALDSMN00,0)+'+Dm1.wReplacCeros+'(DEBESMN01,0)-'+Dm1.wReplacCeros+'(HABESMN01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN02,0)-'+Dm1.wReplacCeros+'(HABESMN02,0) )';
  xxSaldo03:='( '+Dm1.wReplacCeros+'(SALDSMN00,0)+'+Dm1.wReplacCeros+'(DEBESMN01,0)-'+Dm1.wReplacCeros+'(HABESMN01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN02,0)-'+Dm1.wReplacCeros+'(HABESMN02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN03,0)-'+Dm1.wReplacCeros+'(HABESMN03,0) )';
  xxSaldo04:='( '+Dm1.wReplacCeros+'(SALDSMN00,0)+'+Dm1.wReplacCeros+'(DEBESMN01,0)-'+Dm1.wReplacCeros+'(HABESMN01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN02,0)-'+Dm1.wReplacCeros+'(HABESMN02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN03,0)-'+Dm1.wReplacCeros+'(HABESMN03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN04,0)-'+Dm1.wReplacCeros+'(HABESMN04,0) )';
  xxSaldo05:='( '+Dm1.wReplacCeros+'(SALDSMN00,0)+'+Dm1.wReplacCeros+'(DEBESMN01,0)-'+Dm1.wReplacCeros+'(HABESMN01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN02,0)-'+Dm1.wReplacCeros+'(HABESMN02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN03,0)-'+Dm1.wReplacCeros+'(HABESMN03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN04,0)-'+Dm1.wReplacCeros+'(HABESMN04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN05,0)-'+Dm1.wReplacCeros+'(HABESMN05,0) )';
  xxSaldo06:='( '+Dm1.wReplacCeros+'(SALDSMN00,0)+'+Dm1.wReplacCeros+'(DEBESMN01,0)-'+Dm1.wReplacCeros+'(HABESMN01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN02,0)-'+Dm1.wReplacCeros+'(HABESMN02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN03,0)-'+Dm1.wReplacCeros+'(HABESMN03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN04,0)-'+Dm1.wReplacCeros+'(HABESMN04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN05,0)-'+Dm1.wReplacCeros+'(HABESMN05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN06,0)-'+Dm1.wReplacCeros+'(HABESMN06,0) )';
  xxSaldo07:='( '+Dm1.wReplacCeros+'(SALDSMN00,0)+'+Dm1.wReplacCeros+'(DEBESMN01,0)-'+Dm1.wReplacCeros+'(HABESMN01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN02,0)-'+Dm1.wReplacCeros+'(HABESMN02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN03,0)-'+Dm1.wReplacCeros+'(HABESMN03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN04,0)-'+Dm1.wReplacCeros+'(HABESMN04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN05,0)-'+Dm1.wReplacCeros+'(HABESMN05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN06,0)-'+Dm1.wReplacCeros+'(HABESMN06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN07,0)-'+Dm1.wReplacCeros+'(HABESMN07,0) )';
  xxSaldo08:='( '+Dm1.wReplacCeros+'(SALDSMN00,0)+'+Dm1.wReplacCeros+'(DEBESMN01,0)-'+Dm1.wReplacCeros+'(HABESMN01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN02,0)-'+Dm1.wReplacCeros+'(HABESMN02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN03,0)-'+Dm1.wReplacCeros+'(HABESMN03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN04,0)-'+Dm1.wReplacCeros+'(HABESMN04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN05,0)-'+Dm1.wReplacCeros+'(HABESMN05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN06,0)-'+Dm1.wReplacCeros+'(HABESMN06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN07,0)-'+Dm1.wReplacCeros+'(HABESMN07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN08,0)-'+Dm1.wReplacCeros+'(HABESMN08,0) )';
  xxSaldo09:='( '+Dm1.wReplacCeros+'(SALDSMN00,0)+'+Dm1.wReplacCeros+'(DEBESMN01,0)-'+Dm1.wReplacCeros+'(HABESMN01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN02,0)-'+Dm1.wReplacCeros+'(HABESMN02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN03,0)-'+Dm1.wReplacCeros+'(HABESMN03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN04,0)-'+Dm1.wReplacCeros+'(HABESMN04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN05,0)-'+Dm1.wReplacCeros+'(HABESMN05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN06,0)-'+Dm1.wReplacCeros+'(HABESMN06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN07,0)-'+Dm1.wReplacCeros+'(HABESMN07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN08,0)-'+Dm1.wReplacCeros+'(HABESMN08,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN09,0)-'+Dm1.wReplacCeros+'(HABESMN09,0) )';
  xxSaldo10:='( '+Dm1.wReplacCeros+'(SALDSMN00,0)+'+Dm1.wReplacCeros+'(DEBESMN01,0)-'+Dm1.wReplacCeros+'(HABESMN01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN02,0)-'+Dm1.wReplacCeros+'(HABESMN02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN03,0)-'+Dm1.wReplacCeros+'(HABESMN03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN04,0)-'+Dm1.wReplacCeros+'(HABESMN04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN05,0)-'+Dm1.wReplacCeros+'(HABESMN05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN06,0)-'+Dm1.wReplacCeros+'(HABESMN06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN07,0)-'+Dm1.wReplacCeros+'(HABESMN07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN08,0)-'+Dm1.wReplacCeros+'(HABESMN08,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN09,0)-'+Dm1.wReplacCeros+'(HABESMN09,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN10,0)-'+Dm1.wReplacCeros+'(HABESMN10,0) )';
  xxSaldo11:='( '+Dm1.wReplacCeros+'(SALDSMN00,0)+'+Dm1.wReplacCeros+'(DEBESMN01,0)-'+Dm1.wReplacCeros+'(HABESMN01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN02,0)-'+Dm1.wReplacCeros+'(HABESMN02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN03,0)-'+Dm1.wReplacCeros+'(HABESMN03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN04,0)-'+Dm1.wReplacCeros+'(HABESMN04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN05,0)-'+Dm1.wReplacCeros+'(HABESMN05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN06,0)-'+Dm1.wReplacCeros+'(HABESMN06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN07,0)-'+Dm1.wReplacCeros+'(HABESMN07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN08,0)-'+Dm1.wReplacCeros+'(HABESMN08,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN09,0)-'+Dm1.wReplacCeros+'(HABESMN09,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN10,0)-'+Dm1.wReplacCeros+'(HABESMN10,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN11,0)-'+Dm1.wReplacCeros+'(HABESMN11,0) )';
  xxSaldo12:='( '+Dm1.wReplacCeros+'(SALDSMN00,0)+'+Dm1.wReplacCeros+'(DEBESMN01,0)-'+Dm1.wReplacCeros+'(HABESMN01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN02,0)-'+Dm1.wReplacCeros+'(HABESMN02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN03,0)-'+Dm1.wReplacCeros+'(HABESMN03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN04,0)-'+Dm1.wReplacCeros+'(HABESMN04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN05,0)-'+Dm1.wReplacCeros+'(HABESMN05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN06,0)-'+Dm1.wReplacCeros+'(HABESMN06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN07,0)-'+Dm1.wReplacCeros+'(HABESMN07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN08,0)-'+Dm1.wReplacCeros+'(HABESMN08,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN09,0)-'+Dm1.wReplacCeros+'(HABESMN09,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN10,0)-'+Dm1.wReplacCeros+'(HABESMN10,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN11,0)-'+Dm1.wReplacCeros+'(HABESMN11,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN12,0)-'+Dm1.wReplacCeros+'(HABESMN12,0) )';
  xxSaldo13:='( '+Dm1.wReplacCeros+'(SALDSMN00,0)+'+Dm1.wReplacCeros+'(DEBESMN01,0)-'+Dm1.wReplacCeros+'(HABESMN01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN02,0)-'+Dm1.wReplacCeros+'(HABESMN02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN03,0)-'+Dm1.wReplacCeros+'(HABESMN03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN04,0)-'+Dm1.wReplacCeros+'(HABESMN04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN05,0)-'+Dm1.wReplacCeros+'(HABESMN05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN06,0)-'+Dm1.wReplacCeros+'(HABESMN06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN07,0)-'+Dm1.wReplacCeros+'(HABESMN07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN08,0)-'+Dm1.wReplacCeros+'(HABESMN08,0) '
																	 +'+'+Dm1.wReplacCeros+'(DEBESMN09,0)-'+Dm1.wReplacCeros+'(HABESMN09,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN10,0)-'+Dm1.wReplacCeros+'(HABESMN10,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN11,0)-'+Dm1.wReplacCeros+'(HABESMN11,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN12,0)-'+Dm1.wReplacCeros+'(HABESMN12,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESMN13,0)-'+Dm1.wReplacCeros+'(HABESMN13,0) )';
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

  xxSaldo01:='( '+Dm1.wReplacCeros+'(SALDSME00,0)+'+Dm1.wReplacCeros+'(DEBESME01,0)-'+Dm1.wReplacCeros+'(HABESME01,0) )';
  xxSaldo02:='( '+Dm1.wReplacCeros+'(SALDSME00,0)+'+Dm1.wReplacCeros+'(DEBESME01,0)-'+Dm1.wReplacCeros+'(HABESME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME02,0)-'+Dm1.wReplacCeros+'(HABESME02,0) )';
  xxSaldo03:='( '+Dm1.wReplacCeros+'(SALDSME00,0)+'+Dm1.wReplacCeros+'(DEBESME01,0)-'+Dm1.wReplacCeros+'(HABESME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME02,0)-'+Dm1.wReplacCeros+'(HABESME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME03,0)-'+Dm1.wReplacCeros+'(HABESME03,0) )';
  xxSaldo04:='( '+Dm1.wReplacCeros+'(SALDSME00,0)+'+Dm1.wReplacCeros+'(DEBESME01,0)-'+Dm1.wReplacCeros+'(HABESME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME02,0)-'+Dm1.wReplacCeros+'(HABESME02,0) '
																	 +'+'+Dm1.wReplacCeros+'(DEBESME03,0)-'+Dm1.wReplacCeros+'(HABESME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME04,0)-'+Dm1.wReplacCeros+'(HABESME04,0) )';
  xxSaldo05:='( '+Dm1.wReplacCeros+'(SALDSME00,0)+'+Dm1.wReplacCeros+'(DEBESME01,0)-'+Dm1.wReplacCeros+'(HABESME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME02,0)-'+Dm1.wReplacCeros+'(HABESME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME03,0)-'+Dm1.wReplacCeros+'(HABESME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME04,0)-'+Dm1.wReplacCeros+'(HABESME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME05,0)-'+Dm1.wReplacCeros+'(HABESME05,0) )';
  xxSaldo06:='( '+Dm1.wReplacCeros+'(SALDSME00,0)+'+Dm1.wReplacCeros+'(DEBESME01,0)-'+Dm1.wReplacCeros+'(HABESME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME02,0)-'+Dm1.wReplacCeros+'(HABESME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME03,0)-'+Dm1.wReplacCeros+'(HABESME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME04,0)-'+Dm1.wReplacCeros+'(HABESME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME05,0)-'+Dm1.wReplacCeros+'(HABESME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME06,0)-'+Dm1.wReplacCeros+'(HABESME06,0) )';
  xxSaldo07:='( '+Dm1.wReplacCeros+'(SALDSME00,0)+'+Dm1.wReplacCeros+'(DEBESME01,0)-'+Dm1.wReplacCeros+'(HABESME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME02,0)-'+Dm1.wReplacCeros+'(HABESME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME03,0)-'+Dm1.wReplacCeros+'(HABESME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME04,0)-'+Dm1.wReplacCeros+'(HABESME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME05,0)-'+Dm1.wReplacCeros+'(HABESME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME06,0)-'+Dm1.wReplacCeros+'(HABESME06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME07,0)-'+Dm1.wReplacCeros+'(HABESME07,0) )';
  xxSaldo08:='( '+Dm1.wReplacCeros+'(SALDSME00,0)+'+Dm1.wReplacCeros+'(DEBESME01,0)-'+Dm1.wReplacCeros+'(HABESME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME02,0)-'+Dm1.wReplacCeros+'(HABESME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME03,0)-'+Dm1.wReplacCeros+'(HABESME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME04,0)-'+Dm1.wReplacCeros+'(HABESME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME05,0)-'+Dm1.wReplacCeros+'(HABESME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME06,0)-'+Dm1.wReplacCeros+'(HABESME06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME07,0)-'+Dm1.wReplacCeros+'(HABESME07,0) '
																	 +'+'+Dm1.wReplacCeros+'(DEBESME08,0)-'+Dm1.wReplacCeros+'(HABESME08,0) )';
  xxSaldo09:='( '+Dm1.wReplacCeros+'(SALDSME00,0)+'+Dm1.wReplacCeros+'(DEBESME01,0)-'+Dm1.wReplacCeros+'(HABESME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME02,0)-'+Dm1.wReplacCeros+'(HABESME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME03,0)-'+Dm1.wReplacCeros+'(HABESME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME04,0)-'+Dm1.wReplacCeros+'(HABESME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME05,0)-'+Dm1.wReplacCeros+'(HABESME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME06,0)-'+Dm1.wReplacCeros+'(HABESME06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME07,0)-'+Dm1.wReplacCeros+'(HABESME07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME08,0)-'+Dm1.wReplacCeros+'(HABESME08,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME09,0)-'+Dm1.wReplacCeros+'(HABESME09,0) )';
  xxSaldo10:='( '+Dm1.wReplacCeros+'(SALDSME00,0)+'+Dm1.wReplacCeros+'(DEBESME01,0)-'+Dm1.wReplacCeros+'(HABESME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME02,0)-'+Dm1.wReplacCeros+'(HABESME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME03,0)-'+Dm1.wReplacCeros+'(HABESME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME04,0)-'+Dm1.wReplacCeros+'(HABESME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME05,0)-'+Dm1.wReplacCeros+'(HABESME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME06,0)-'+Dm1.wReplacCeros+'(HABESME06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME07,0)-'+Dm1.wReplacCeros+'(HABESME07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME08,0)-'+Dm1.wReplacCeros+'(HABESME08,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME09,0)-'+Dm1.wReplacCeros+'(HABESME09,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME10,0)-'+Dm1.wReplacCeros+'(HABESME10,0) )';
  xxSaldo11:='( '+Dm1.wReplacCeros+'(SALDSME00,0)+'+Dm1.wReplacCeros+'(DEBESME01,0)-'+Dm1.wReplacCeros+'(HABESME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME02,0)-'+Dm1.wReplacCeros+'(HABESME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME03,0)-'+Dm1.wReplacCeros+'(HABESME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME04,0)-'+Dm1.wReplacCeros+'(HABESME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME05,0)-'+Dm1.wReplacCeros+'(HABESME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME06,0)-'+Dm1.wReplacCeros+'(HABESME06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME07,0)-'+Dm1.wReplacCeros+'(HABESME07,0) '
																	 +'+'+Dm1.wReplacCeros+'(DEBESME08,0)-'+Dm1.wReplacCeros+'(HABESME08,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME09,0)-'+Dm1.wReplacCeros+'(HABESME09,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME10,0)-'+Dm1.wReplacCeros+'(HABESME10,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME11,0)-'+Dm1.wReplacCeros+'(HABESME11,0) )';
  xxSaldo12:='( '+Dm1.wReplacCeros+'(SALDSME00,0)+'+Dm1.wReplacCeros+'(DEBESME01,0)-'+Dm1.wReplacCeros+'(HABESME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME02,0)-'+Dm1.wReplacCeros+'(HABESME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME03,0)-'+Dm1.wReplacCeros+'(HABESME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME04,0)-'+Dm1.wReplacCeros+'(HABESME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME05,0)-'+Dm1.wReplacCeros+'(HABESME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME06,0)-'+Dm1.wReplacCeros+'(HABESME06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME07,0)-'+Dm1.wReplacCeros+'(HABESME07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME08,0)-'+Dm1.wReplacCeros+'(HABESME08,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME09,0)-'+Dm1.wReplacCeros+'(HABESME09,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME10,0)-'+Dm1.wReplacCeros+'(HABESME10,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME11,0)-'+Dm1.wReplacCeros+'(HABESME11,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME12,0)-'+Dm1.wReplacCeros+'(HABESME12,0) )';
  xxSaldo13:='( '+Dm1.wReplacCeros+'(SALDSME00,0)+'+Dm1.wReplacCeros+'(DEBESME01,0)-'+Dm1.wReplacCeros+'(HABESME01,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME02,0)-'+Dm1.wReplacCeros+'(HABESME02,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME03,0)-'+Dm1.wReplacCeros+'(HABESME03,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME04,0)-'+Dm1.wReplacCeros+'(HABESME04,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME05,0)-'+Dm1.wReplacCeros+'(HABESME05,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME06,0)-'+Dm1.wReplacCeros+'(HABESME06,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME07,0)-'+Dm1.wReplacCeros+'(HABESME07,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME08,0)-'+Dm1.wReplacCeros+'(HABESME08,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME09,0)-'+Dm1.wReplacCeros+'(HABESME09,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME10,0)-'+Dm1.wReplacCeros+'(HABESME10,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME11,0)-'+Dm1.wReplacCeros+'(HABESME11,0) '
																	 +'+'+Dm1.wReplacCeros+'(DEBESME12,0)-'+Dm1.wReplacCeros+'(HABESME12,0) '
                                   +'+'+Dm1.wReplacCeros+'(DEBESME13,0)-'+Dm1.wReplacCeros+'(HABESME13,0) ) ';
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
  Dm1.DCOM1.AppServer.EjecutaSQL(xSQL);
end;

procedure TFToolConta.SaldosCaja310;
var
 sFecha,ssql : String;
begin
  //** 05/12/2000 - pjsv - para la actualizacion de caja310
  ssql := 'FPAGOID='+quotedstr(xFPagoid);
  // solo si la forma de pago es <> a Canje se debe actualizar CAJA310
  if Dm1.DisplayDescrip('prvSQL','TGE112','FCANJE',ssql,'FCANJE') <> 'S' then
   begin
    sFecha := formatdatetime(dm1.wFormatFecha,xFechaCom);
    ssql := 'BANCOID='+quotedstr(xBancoid);
    // Si es Caja, solo se hace un apdate
    if Dm1.DisplayDescrip('prvSQL','TGE105','BCOTIPCTA',ssql,'BCOTIPCTA') = 'C' then
      begin
       ssql := 'SELECT COUNT(CIAID) TOTAL FROM CAJA310 '+
                ' WHERE STFECHA='+quotedstr(sfecha)+
                ' AND BANCOID='+quotedstr(xBancoid);
       dm1.cdsQry.Close;
       dm1.cdsQry.DataRequest(ssql);
       dm1.cdsQry.Open;
       If dm1.cdsQry.FieldByName('TOTAL').AsFloat > 0 then
        begin
         If xTmonid = Dm1.wTMonLoc then
          ssql := 'UPDATE CAJA310 SET STTOTEGR= '+Dm1.wReplacCeros+'(STTOTEGR,0) + '+FloatToStr(cPgoOri)+
                ' , STSALDOFIN= '+Dm1.wReplacCeros+'(STSALDOINIC,0) + '+
                Dm1.wReplacCeros+'(STTOTING,0) -('+Dm1.wReplacCeros+'(STTOTEGR,0) +'+FloatToStr(cPgoOri)+')'+
                ' , TMONID='+quotedstr(xTmonid)+
                ' WHERE STFECHA='+quotedstr(sfecha)+
                ' AND BANCOID='+quotedstr(xBancoid)
         else
          ssql := 'UPDATE CAJA310 SET STEGREXT= '+Dm1.wReplacCeros+'(STEGREXT,0) + '+FloatToStr(cPgoOri)+
                ' , STSDOFINEXT= '+Dm1.wReplacCeros+'(STSDOINIEXT,0) + '+
                Dm1.wReplacCeros+'(STINGEXT,0) - ('+Dm1.wReplacCeros+'(STEGREXT,0) +'+FloatToStr(cPgoOri)+')'+
                ' , TMONID='+quotedstr(xTmonid)+
                ' WHERE STFECHA='+quotedstr(sfecha)+
                ' AND BANCOID='+quotedstr(xBancoid);
        end
       else
        begin
         If xTMonid = Dm1.wtmonLoc then
          ssql := 'INSERT INTO CAJA310 (STFECHA,BANCOID,STTOTEGR,STSALDOFIN,TMONID,CCBCOID) VALUES'+
                  ' ('+quotedstr(sfecha)+','+quotedstr(xBancoid)+','+FloatToStr(cPgoOri)+
                  ' ,-'+FloatToStr(cPgoOri)+','+quotedstr(xTMonid)+','+quotedstr(xCcBcoid)+')'
         else
          ssql := 'INSERT INTO CAJA310 (STFECHA,BANCOID,STEGREXT,STSDOFINEXT,TMONID,CCBCOID) VALUES'+
                  ' ('+quotedstr(sfecha)+','+quotedstr(xBancoid)+','+FloatToStr(cPgoOri)+
                  ' ,-'+FloatToStr(cPgoOri)+','+quotedstr(xTMonid)+','+quotedstr(xCcBcoid)+')';
        end;
      end
    else
     //** si es Banco se comprueba si existe para hacer un update
     //** si no un INSERT INTO
     if Dm1.DisplayDescrip('prvSQL','TGE105','BCOTIPCTA',ssql,'BCOTIPCTA') = 'B' then
      begin
       Dm1.cdsSaldoTlfnGrab.SetKey;
       Dm1.cdsSaldoTlfnGrab.FieldByName('STFECHA').AsString := DateToStr(xFechaCom);
       Dm1.cdsSaldoTlfnGrab.FieldByName('BANCOID').AsString := xBancoid;
       Dm1.cdsSaldoTlfnGrab.FieldByName('CCBCOID').AsString := xCcBcoid;
       If Dm1.cdsSaldoTlfnGrab.GotoKey then
        begin
         If xTmonid = Dm1.wTMonLoc then
          ssql := 'UPDATE CAJA310 SET STTOTEGR= '+Dm1.wReplacCeros+'(STTOTEGR,0) + '+FloatToStr(cPgoOri)+
                  ' ,STSALDOFIN= '+Dm1.wReplacCeros+'(STSALDOINIC,0) + '+Dm1.wReplacCeros+
                  '(STTOTING,0) - ('+Dm1.wReplacCeros+'(STTOTEGR,0) +'+FloatToStr(cPgoOri)+')'+
                  ' ,TMONID='+quotedstr(xTmonid)+
                  ' WHERE STFECHA='+quotedstr(sfecha)+
                  ' AND BANCOID='+quotedstr(xBancoid)+
                  ' AND CCBCOID='+quotedstr(xCcBcoid)
         else
          ssql := 'UPDATE CAJA310 SET STEGREXT= '+Dm1.wReplacCeros+'(STEGREXT,0) + '+FloatToStr(cPgoOri)+
                  ' ,STSDOFINEXT= '+Dm1.wReplacCeros+'(STSDOINIEXT,0) + '+Dm1.wReplacCeros+
                  '(STINGEXT,0) - ('+Dm1.wReplacCeros+'(STEGREXT,0) +'+FloatToStr(cPgoOri)+')'+
                  ' ,TMONID='+quotedstr(xTmonid)+
                  ' WHERE STFECHA='+quotedstr(sfecha)+
                  ' AND BANCOID='+quotedstr(xBancoid)+
                  ' AND CCBCOID='+quotedstr(xCcBcoid)
        end
       else
        begin
         If xTMonid = Dm1.wtmonLoc then
          ssql := 'INSERT INTO CAJA310 (STFECHA,BANCOID,STTOTEGR,STSALDOFIN,TMONID,CCBCOID) VALUES'+
                  ' ('+quotedstr(sfecha)+','+quotedstr(xBancoid)+','+FloatToStr(cPgoOri)+
                  ' ,-'+FloatToStr(cPgoOri)+','+quotedstr(xTMonid)+','+quotedstr(xCcBcoid)+')'
         else
          ssql := 'INSERT INTO CAJA310 (STFECHA,BANCOID,STEGREXT,STSDOFINEXT,TMONID,CCBCOID) VALUES'+
                  ' ('+quotedstr(sfecha)+','+quotedstr(xBancoid)+','+FloatToStr(cPgoOri)+
                  ' ,-'+FloatToStr(cPgoOri)+','+quotedstr(xTMonid)+','+quotedstr(xCcBcoid)+')';
        end;
      end;
      Dm1.DCOM1.AppServer.EjecutaSQL(ssql);
   end;
end;

end.

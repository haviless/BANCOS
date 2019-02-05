unit Caja245;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, wwdbedit, wwdbdatetimepicker, wwdblook, ExtCtrls,
  Wwdbdlg, Grids, Wwdbigrd, Wwdbgrid,db, Wwkeycb, Variants;

type
  TFConcesion = class(TForm)
    pnlCabecera1: TPanel;
    lblCia: TLabel;
    lblFComp: TLabel;
    lblTDiario: TLabel;
    lblPeriodo: TLabel;
    lblNoComp: TLabel;
    lblBanco: TLabel;
    lblCCBco: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    dbdtpFComp: TwwDBDateTimePicker;
    edtPeriodo: TEdit;
    dbeNoComp: TwwDBEdit;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TEdit;
    dblcCCBco: TwwDBLookupCombo;
    edtCuenta: TEdit;
    Label1: TLabel;
    lblConcepto: TLabel;
    dblcdCnp: TwwDBLookupComboDlg;
    lblGlosa: TLabel;
    dbeGlosa: TwwDBEdit;
    lblTMon: TLabel;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    lblTCambio: TLabel;
    dbeTCambio: TwwDBEdit;
    lblTDoc: TLabel;
    dblcTDoc: TwwDBLookupCombo;
    edtTDoc: TEdit;
    lblNoDoc: TLabel;
    dbeNoDoc: TwwDBEdit;
    Label23: TLabel;
    dblcClAux: TwwDBLookupCombo;
    edtClAux: TEdit;
    dblcdAux: TwwDBLookupComboDlg;
    lblProvRuc: TLabel;
    edtAuxRuc: TEdit;
    lblProvDes: TLabel;
    dbeGiradoA: TwwDBEdit;
    Label2: TLabel;
    Label12: TLabel;
    dbeImporte2: TwwDBEdit;
    edtMtoLoc: TwwDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    edtMtoExt: TwwDBEdit;
    z2bbtnGraba: TBitBtn;
    pnlClone: TPanel;
    dbgClone: TwwDBGrid;
    Label3: TLabel;
    lblFormPago: TLabel;
    dblcFormPago: TwwDBLookupCombo;
    edtFormPago: TEdit;
    lblBusca: TLabel;
    isClone: TwwIncrementalSearch;
    lblEstado: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure dblcCCBcoExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcdCnpExit(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure dblcClAuxExit(Sender: TObject);
    procedure dblcdAuxExit(Sender: TObject);
    procedure dbeImporte2Exit(Sender: TObject);
    procedure z2bbtnGrabaClick(Sender: TObject);
    procedure dblcFormPagoExit(Sender: TObject);
    procedure dbeTCambioExit(Sender: TObject);
    procedure dbgCloneTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure isCloneExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgCloneDblClick(Sender: TObject);
  private
    { Private declarations }
    xNreg,xItem,xTipoMov,xTDiarid : String;
    procedure BuscaDiario(pDiario : String);
    procedure ActualizaSaldosCaja;
    procedure CargaNuevo;
  public
    { Public declarations }
  end;

var
  FConcesion: TFConcesion;
   function AlineaDcha(S: String; N: Integer): String;

implementation
uses CajaDM,CajaUtil,Caja246, Caja001;
{$R *.DFM}

procedure TFConcesion.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFConcesion.FormActivate(Sender: TObject);
begin
  pnlClone.enabled := False;
  FConcesion.Height := 241;
  If dm1.wModo = 'A' then
   begin
    FConcesion.Height := 483;
    dbgClone.Selected.Add('DEPFECHA'#9'10'#9'Fecha');
    dbgClone.Selected.Add('CONCESID'#9'10'#9'Id Conc.');
    dbgClone.Selected.Add('CONCESNOM'#9'20'#9'Concesión');
    dbgClone.Selected.Add('DEPMONTO'#9'15'#9'Monto');
    dm1.cdsRec.close;
    dm1.cdsRec.DataRequest('SELECT LIQ204.CONCESNOM,LIQ305.* FROM LIQ305 inner join liq204 on (liq204.concesid=liq305.concesid) WHERE '+ wSql);
    dm1.cdsRec.open;
    dm1.cdsRec.indexFieldNames := 'DEPFECHA;CONCESID;DEPMONTO';
    dm1.cdsRec.Filter := 'DEPCHECK<>'+quotedstr('S')+ ' or DEPCHECK = NULL' ;
    dm1.cdsRec.Filtered := True;
    TNumericField(dm1.cdsRec.FieldByName('DEPMONTO')).DisplayFormat := '###,###,##0.00';
    CargaNuevo;
   end;
end;

procedure TFConcesion.dblcCCBcoExit(Sender: TObject);
begin
 if trim(dblcccbco.Text)<>'' then
  begin
   if DM1.cdsCCBco.Locate('BANCOID;CCBCOID',VararrayOf([dblcbanco.text,dblcccbco.text]),[]) then
    begin
      edtCuenta.Text := DM1.cdsCCBco.fieldbyname('CTAPRINC').AsString ;
      dblcdCnp.Text  := dm1.DisplayDescrip('prvTGE','CAJA201','CPTOID','CPTOID='+quotedstr(DM1.cdsCCBco.fieldbyname('CPTOID').AsString),'CPTOID');
      dblcdCnp.OnExit(dblcdCnp);
      xTDiarid := DM1.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH','BANCOID='+quotedstr(dblcBanco.text)+' AND CCBCOID='+quotedstr(dblcCCBco.text),'CCBCOVOUCH');
      BuscaDiario(xTDiarid);
    end;
  end;
end;

procedure TFConcesion.BuscaDiario(pDiario : String);
var
 xWhere,xTextoDiario : String;
begin
   xTextoDiario := DM1.DisplayDescrip('prvTGE','TGE104','TDIARDES','TDIARID='+quotedstr(pDiario),'TDIARDES');
   if xTextoDiario <>'' then
   begin
      xWhere:='CIAID='+quotedstr(dblcCia.Text)+' AND ECANOMM='+quotedstr(edtPeriodo.Text)
             +' AND TDIARID='+ quotedstr(pDiario) + ' AND EC_PROCE='+quotedstr('LIQ');
      dbeNoComp.text:=DM1.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      dbeNoComp.text:=DM1.StrZero(dbeNoComp.text, DM1.cdsEgrCaja.FieldByName('ECNOCOMP').Size );
   end;
end;

procedure TFConcesion.dblcBancoExit(Sender: TObject);
begin
 edtBanco.Text := DM1.DisplayDescrip('prvTGE','TGE105','BANCOABR','BANCOID='+quotedstr(dblcBanco.text),'BANCOABR');
 if DM1.cdsbancoegr.FieldByName('BCOTIPCTA').Value='B' then
   begin  //Si es BANCO
     DM1.cdsCCBco.Filter:='';   //Filtrar la lista de CtaCte por Banco
     DM1.cdsCCBco.Filter:='BANCOID='+''''+dblcBanco.Text+''''+' AND CIAID='+quotedstr(dblcCia.text);
     DM1.cdsCCBco.Filtered:=True;
   end;
end;

procedure TFConcesion.dblcdCnpExit(Sender: TObject);
begin
   dbeGlosa.Text := dm1.DisplayDescrip('prvTGE','CAJA201','CPTODES','CPTOID='+quotedstr(dblcdCnp.text),'CPTODES');
end;

procedure TFConcesion.dblcTMonExit(Sender: TObject);
var
 xWhere : String;
begin
  xWhere:='TMONID='+quotedstr(dblcTMon.Text);
  edtTMon.Text:= DM1.DisplayDescrip('prvTGE','TGE103','TMONDES',xWhere,'TMONDES');
end;

procedure TFConcesion.dblcTDocExit(Sender: TObject);
begin
  EDTtdOC.Text := dm1.displaydescrip('prvTGE','TGE110','DOCABR','DOCID='+quotedstr(dblcTDoc.text),'DOCABR');
end;

procedure TFConcesion.dblcClAuxExit(Sender: TObject);
begin
  edtClAux.text := dm1.cdsqry.FieldByName('CLAUXDES').AsString;
end;

procedure TFConcesion.dblcdAuxExit(Sender: TObject);
begin
   edtAuxRuc.TEXT  := dm1.displaydescrip('prvTGE','TGE204','*','CLIEID='+quotedstr(dblcdAux.text),'CLIERUC');
   dbeGiradoA.TEXT := dm1.cdsQry.FieldByName('CLIEDES').AsString;
end;

procedure TFConcesion.dbeImporte2Exit(Sender: TObject);
begin
  dbeTCambio.Color := clBtnFace;
  dbeTCambio.enabled := False;
  edtMtoLoc.text :=  AlineaDcha(dbeImporte2.text,15);
  If StrToFloat(dbeTCambio.text) > 0 then
   edtMtoExt.text :=  AlineaDcha(FloatToStrF(StrToFloat(dbeImporte2.text)/StrToFloat(dbeTCambio.text),ffFixed,15,2),28)
  else
   begin
    dbeTCambio.enabled := true;
    dbeTCambio.Color := clWindow;
   end;
end;

procedure TFConcesion.dblcFormPagoExit(Sender: TObject);
begin
   edtFormPago.text := dm1.displaydescrip('prvTGE','TGE112','*','FPAGOID='+quotedstr(dblcFormPago.text),'FPAGOABR');
end;

procedure TFConcesion.z2bbtnGrabaClick(Sender: TObject);
var
 xDataFija301,xCampo301,xCampo302,sFecha,xOtrosDatos,xDataFija302,xSql : String;
begin
  If dbeTCambio.text = '0' then
   begin
    showmessage('Ingrese Tipo de Cambio');
    exit;
   end;
  sFecha := formatdatetime('YYYY-MM-DD',dbdtpFComp.DateTime);
  xCampo301 := 'CIAID,ECANOMM,CUENTAID,CPTOID,TDIARID,ECNOCOMP,TMONID,'+
               'DETCDOC,DETCPAG,CPNODOC,CLAUXID,DEFCOMP,CPFEMIS,CPFVCMTO,'+
               'PROV,PROVRUC,DEMTOORI,DEMTOLOC,DEMTOEXT,DEDH,CPNOREG,'+
               'DOCMOD,DENUMREG,DEESTADO,DEUSER,DEFREG,DEHREG,DEANO,'+
               'DEMM,DEDD,DESS,DESEM,DETRI,DEAASS,DEAASEM,DEAATRI';


  xCampo302 := 'CIAID,ECANOMM,BANCOID,CCBCOID,CUENTAID,CPTOID,ECGLOSA,TDIARID,ECNOCOMP,TMONID,'+
               'ECTCAMB,DOCID,ECNODOC,CLAUXID,ECFCOMP,ECFEMICH,PROV,PROVRUC,ECMTOORI,ECMTOLOC,ECMTOEXT,'+
               'ECGIRA,FPAGOID,ECLOTE,ECESTADO,EC_PROCE,EC_IE,ECUSER,ECFREG,ECHREG,ECANO,ECMM,ECDD,ECSS,ECSEM,ECTRI,'+
               'ECAASS,ECAASEM,ECAATRI';

  xDataFija301 := quotedstr(dblcCia.Text)+','+quotedstr(edtPeriodo.text)+','+quotedstr(edtCuenta.Text)+','+
                  quotedstr(dblcdCnp.Text)+','+quotedstr(xTDiarid)+','+quotedstr(dbeNoComp.text)+','+
                  quotedstr(dblcTMon.TEXT)+','+dbeTCambio.Text+','+dbeTCambio.Text+','+
                  quotedstr(dbeNoDoc.text)+','+quotedstr(dblcClAux.text)+','+quotedstr(sFecha)+','+
                  quotedstr(sFecha)+','+quotedstr(sFecha)+','+quotedstr(dblcdAux.Text)+','+
                  quotedstr(edtAuxRuc.TEXT)+','+dbeImporte2.text+','+edtMtoLoc.text+','+
                  edtMtoExt.text+','+quotedstr(xTipoMov)+','+quotedstr(xNreg)+','+
                  quotedstr('LIQ')+','+quotedstr(xItem)+','+quotedstr('C')+',';

  xDataFija302 := quotedstr(dblcCia.Text)+','+quotedstr(edtPeriodo.text)
              +','+quotedstr(dblcBanco.text)+','+quotedstr(dblcCCBco.text)+','+quotedstr(edtCuenta.Text)
              +','+quotedstr(dblcdCnp.Text)+','+quotedstr(dbeGlosa.Text)+','+quotedstr(xTDiarid)
              +','+quotedstr(dbeNoComp.text)+','+quotedstr(dblcTMon.TEXT)+','+dbeTCambio.Text
              +','+quotedstr(dblcTDoc.Text)+','+quotedstr(dbeNoDoc.text)+','+quotedstr(dblcClAux.text)
              +','+quotedstr(sFecha)+','+quotedstr(sFecha)+','+quotedstr(dblcdAux.Text)+','+quotedstr(edtAuxRuc.TEXT)
              +','+dbeImporte2.text+','+edtMtoLoc.text+','+edtMtoExt.text+','+quotedstr(dbeGiradoA.TEXT)
              +','+quotedstr(dblcFormPago.TEXT)+','+quotedstr('000')+','+quotedstr('C')
              +','+ quotedstr('LIQ')+','+quotedstr('I')+',';

  // cargo el usuario, semestre, etc.
  DM1.Filtracds(DM1.cdsQry, 'SELECT * FROM TGE114 WHERE FECHA='+quotedStr(sFecha));
  xOtrosDatos :=     quotedStr(DM1.wUsuario) +', '
                   + quotedStr(formatdatetime('YYYY-MM-DD',Date())) +', '
                   + quotedStr(formatdatetime('HH:NN:SS',time())) +', '
                   + quotedStr(DM1.cdsQry.fieldbyName('FECANO').asString) +', '
                   + quotedStr(DM1.cdsQry.fieldbyName('FECMES').asString) +', '
                   + quotedStr(DM1.cdsQry.fieldbyName('FECDIA').asString) +', '
                   + quotedStr(DM1.cdsQry.fieldbyName('FECSS').asString) +', '
                   + quotedStr(DM1.cdsQry.fieldbyName('FECSEM').asString) +', '
                   + quotedStr(DM1.cdsQry.fieldbyName('FECTRIM').asString) +', '
                   + quotedStr(DM1.cdsQry.fieldbyName('FECAASS').asString) +', '
                   + quotedStr(DM1.cdsQry.fieldbyName('FECAASEM').asString) +', '
                   + quotedStr(DM1.cdsQry.fieldbyName('FECAATRI').asString);
  If dm1.wModo = 'A' then
   begin
     xSql := 'INSERT INTO CAJA302 ('+xCampo302+') values ('+xDataFija302+xOtrosDatos+')';
     DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
     xSql := 'INSERT INTO CAJA301 ('+xCampo301+') values ('+xDataFija301+xOtrosDatos+')';
     DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
   end;

 ActualizaSaldosCaja;

{  xSql := 'UPDATE LIQ305 SET (DEPCHECK,USERCAMB,FREGCAMB,HREGCAMB)=('+
          quotedstr('S')+','+quotedStr(DM1.wUsuario) +', '+
          quotedStr(formatdatetime('YYYY-MM-DD',Date())) +', '+
          quotedStr(formatdatetime('HH:NN:SS',time()))+ ') WHERE CONCESID='+
          quotedstr(MantConcesion.ClientDataSet.FieldByName('CONCESID').AsString)+
          ' AND DEPFECHA='+quotedstr(sFecha)+' and DEPSEMANA='+
          quotedstr(MantConcesion.ClientDataSet.FieldByName('DEPSEMANA').AsString)+
          ' AND DEPNUMDOC='+quotedstr(MantConcesion.ClientDataSet.FieldByName('DEPNUMDOC').AsString)+
          ' AND DEPITEMS='+quotedstr(MantConcesion.ClientDataSet.FieldByName('DEPITEMS').AsString);
  DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
}
  dm1.cdsRec.Edit;
  dm1.cdsRec.FieldbyName('DEPCHECK').AsString := 'S';
  dm1.cdsRec.Post;

  lblEstado.Caption := 'A C T U A L I Z A D O';
  lblEstado.Font.Color := clLime;
  lblEstado.REFRESH;

  dm1.cdsLiq305.Edit;
  dm1.cdsLiq305.FieldByName('DEPCHECK').AsString := 'S';
  dm1.cdsLiq305.FieldByName('USERCAMB').AsString := DM1.wUsuario;
  dm1.cdsLiq305.FieldByName('FREGCAMB').AsDateTime := DateS;
  dm1.cdsLiq305.FieldByName('HREGCAMB').AsDateTime := Time();
  DM1.AplicaDatos(dm1.cdsLiq305,'EGRCAJA');
  If dm1.cdsRec.RecordCount = 0 then
   begin
    FToolDeposito.z2bbtnOK.OnClick(FToolDeposito.z2bbtnOK);
    Close;
   end;
  pnlClone.enabled := True;
end;

procedure TFConcesion.dbeTCambioExit(Sender: TObject);
begin
   edtMtoExt.text :=  AlineaDcha(FloatToStrF(StrToFloat(dbeImporte2.text)/StrToFloat(dbeTCambio.text),ffFixed,15,2),28);
end;

function AlineaDcha(S: String; N: Integer): String;
begin
  Result:=StringOfChar(' ',N-Length(S))+S;
end;

procedure TFConcesion.dbgCloneTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   isClone.visible := True;
   lblBusca.visible := True;
   isClone.SetSearchField(AFieldName);
   If AFieldName = 'CONCESNOM' then
    lblBusca.Caption := 'Buscar por : Nombre de Concesión';
   If AFieldName = 'DEPFECHA' then
    lblBusca.Caption := 'Buscar por : Fecha';
   If AFieldName = 'CONCESID' then
    lblBusca.Caption := 'Buscar por : Id de Concesión';
   If AFieldName = 'DEPMONTO' then
    lblBusca.Caption := 'Buscar por : Monto del Déposito';
   lblBusca.refresh;
end;

procedure TFConcesion.isCloneExit(Sender: TObject);
begin
   isClone.visible := False;
   lblBusca.visible := False;
end;

procedure TFConcesion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm1.cdsRec.IndexFieldNames := '';
  dm1.cdsRec.Filter := '';
  dm1.cdsRec.Filtered := False;
  dm1.cdsRec.close;
end;

procedure TFConcesion.ActualizaSaldosCaja;
begin
    if trim(dblcCCBco.TEXT) <> '' then
    begin
       DM1.ActSdoTlfn(dblcCia.text,dblcBanco.text,dblcCCBCo.Text, dbeImporte2.text, dbdtpFComp.DATE);
       DM1.ActSdoMen(dblcBanco.text,dblcCCBCo.Text, dbeImporte2.text, dbdtpFComp.DATE);
    end;
end;

procedure TFConcesion.CargaNuevo;
var
 xSql : String;
begin
    RecuperarCiaUnica(dblcCia,edtCia);
    dbdtpFComp.Date := MantConcesion.ClientDataSet.FieldByName('DEPFECHA').AsDateTime; //FToolDeposito.dtpFecha.DateTime;
    edtPeriodo.text := MantConcesion.ClientDataSet.FieldByName('DEPSEMANA').AsString;
    dblcBanco.text := MantConcesion.ClientDataSet.FieldByName('BANCOID').AsString;
    dblcBanco.OnExit(dblcBanco);
    dblcCCBco.text := MantConcesion.ClientDataSet.FieldByName('CCBCOID').AsString;
    dblcCCBco.OnExit(dblcCCBco);
    dblcTMon.TEXT :=  MantConcesion.ClientDataSet.FieldByName('TMONID').AsString;
    dblcTMon.OnExit(dblcTMon);
    dbeTCambio.Text:= MantConcesion.ClientDataSet.FieldByName('DEPTCAM').AsString;
    dblcTDoc.Text:= MantConcesion.ClientDataSet.FieldByName('DOCID').AsString;
    dblcTDoc.OnExit(dblcTDoc);
    dbeNoDoc.text := MantConcesion.ClientDataSet.FieldByName('DEPNUMDOC').AsString;
    dblcFormPago.text := MantConcesion.ClientDataSet.FieldByName('FPAGOID').AsString;
    dblcFormPago.OnExit(dblcFormPago);
    xTipoMov := 'H';
    dblcClAux.text :=  dm1.DisplayDescrip('prvTGE','TGE102','*','MODULO LIKE'+quotedStr('%LIQ'),'CLAUXID');
    dblcClAux.OnExit(dblcClAux);
    dblcdAux.Text:= '120'+MantConcesion.ClientDataSet.FieldByName('CONCESID').AsString;
    dblcdAux.OnExit(dblcdAux);
    dbeImporte2.text := AlineaDcha(FloatToStrF(MantConcesion.ClientDataSet.FieldByName('DEPMONTO').AsFloat,ffFixed,15,2),28);
    dbeImporte2.OnExit(dbeImporte2);
    xItem := MantConcesion.ClientDataSet.FieldByName('DEPITEMS').AsString;
    xSQL:='Select * from CAJA301 '
         +'Where CIAID='+quotedstr(dblcCia.Text)+' and '
         +      'ECANOMM='+quotedstr(edtPeriodo.Text)+' and '
         +      'TDIARID='+quotedstr(xTDiarid)+' and '
         +      'ECNOCOMP='+quotedstr(dbeNoComp.Text)+' ';
    DM1.cdsRegCxP.Close;
    DM1.cdsRegCxP.DataRequest( xSQL );
    DM1.cdsRegCxP.Open;
    xNreg := GeneraCorrelativo(DM1.cdsRegCxP , 'CPNOREG' );
    xNreg := DM1.StrZero(xNreg, DM1.cdsRegCxP.FieldByName('CPNOREG').Size );
    lblEstado.Caption := 'S I N     A C T U A L I Z A R';
    lblEstado.Font.Color := clRed;
    lblEstado.REFRESH;
end;

procedure TFConcesion.dbgCloneDblClick(Sender: TObject);
begin
  If dm1.cdsRec.RecordCount > 0 then
   begin
    MantConcesion.ClientDataSet.SetKey;
    MantConcesion.ClientDataSet.FieldByname('DEPFECHA').Asstring := dm1.cdsRec.FieldByName('DEPFECHA').Asstring;
    MantConcesion.ClientDataSet.FieldByname('CONCESID').Asstring := dm1.cdsRec.FieldByName('CONCESID').Asstring;
    MantConcesion.ClientDataSet.FieldByname('DEPMONTO').Asstring := dm1.cdsRec.FieldByName('DEPMONTO').Asstring;
    MantConcesion.ClientDataSet.GotoKey;
    CargaNuevo;
   end;
end;

end.

unit Caja706;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Mask, wwdbedit, StdCtrls, wwdblook, Buttons, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppEndUsr, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe,DB,ppViewr, wwdbdatetimepicker, ppTypes;

type
  TFToolLibBanco = class(TForm)
    pnl: TPanel;
    Z2bbtnPrint: TBitBtn;
    dbpplEgrCaja: TppDBPipeline;
    ppDesigner1: TppDesigner;
    ppLibCaja: TppReport;
    grbBCO: TGroupBox;
    dblcBanco: TwwDBLookupCombo;
    dbeBanco: TwwDBEdit;
    gbCtaCte: TGroupBox;
    dblcCtaCte: TwwDBLookupCombo;
    dbeCtaCte: TwwDBEdit;
    Label2: TLabel;
    dbeMonCTACTE: TwwDBEdit;
    gbCia: TGroupBox;
    Label11: TLabel;
    dblcCIA: TwwDBLookupCombo;
    dbeCIA: TwwDBEdit;
    Label3: TLabel;
    dbePeriodo: TwwDBLookupCombo;
    rgBanco: TRadioGroup;
    rgCta: TRadioGroup;
    z2bbtnOK: TBitBtn;
    Label1: TLabel;
    dbclMoneda: TwwDBLookupCombo;
    dbeMoneda: TwwDBEdit;
    ppHeaderBand2: TppHeaderBand;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppSystemVariable7: TppSystemVariable;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppSystemVariable8: TppSystemVariable;
    pplblCIA: TppLabel;
    pplblPeriodo: TppLabel;
    pplblBCO: TppLabel;
    ppLabel1: TppLabel;
    pplblCuenta: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel26: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel41: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText15: TppDBText;
    ppDBText17: TppDBText;
    ppDBText22: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppLine6: TppLine;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    pplblSaldoF: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    procedure Z2bbtnPrintClick(Sender: TObject);
    procedure dblcCIAExit(Sender: TObject);
    procedure dblcCIANotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcBancoExit(Sender: TObject);
    procedure dbePeriodoExit(Sender: TObject);
    procedure dblcBancoNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcCtaCteExit(Sender: TObject);
    procedure dblcCtaCteNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dbclMonedaChange(Sender: TObject);
    procedure dbclMonedaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure rgBancoClick(Sender: TObject);
    procedure rgCtaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure ppLibCajaPreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
     sCIA,
     sBCO,
     sCTAB,
     sMON : string;
     sCTABMON     : String;
     TfSaldoAnt,fSaldo,fDebe : double;
     sBancos,sCtas : string;
     procedure ValidaComponente(Componente:TObject);
     procedure dcCTAB;
     function MonedaCTACTE: String;
     procedure InicializaCtaCte;     
  public
    { Public declarations }
  end;

var
  FToolLibBanco: TFToolLibBanco;

implementation

uses CajaDM, oaTE4000;

{$R *.DFM}

procedure TFToolLibBanco.Z2bbtnPrintClick(Sender: TObject);
var
  fsBCO, fsCIA, fsCTAB,
  sPeriodoAnt,sano,smes,sSQL,xAnio,xMes : String;
  sCiaId,sBcoId,sCCBcoId : string;
  xSaldo,xsaldoIniMO,xsaldoIniMN,xSaldoIniME : Double;
  xInsertaSaldo : boolean;
begin

   if FConsulta.xFiltroRep.FMant.cds2.RecordCount=0 then
      raise exception.Create('No existe informacion a mostrar');

   TfSaldoAnt := 0;
   fSaldo     := 0;
   fDebe      := 0;
   fSaldo     := 0;

   dbpplEgrCaja.DataSource := DMTE.dsSQL;

   xInsertaSaldo := False;

   DMTE.cdsQry.Data:=FConsulta.xFiltroRep.FMant.cds2.Data;
   DMTE.cdsQry.IndexFieldNames:='BANCOID;CCBCOID;ECNOCOMP;ECFCOMP';
   
   sano  :=copy(dbePeriodo.text,1,4);
   xAnio :=copy(dbePeriodo.text,1,4);
   smes  :=copy(dbePeriodo.text,5,2);
   xMes  :=copy(dbePeriodo.text,5,2);
   if sMes='01' then
   begin
     sPeriodoAnt:=DMTE.StrZero(IntToStr(StrToInt(sano)-1),4)+'12';
     xAnio:=IntToStr(StrToInt(sano)-1);
     xMes :='12'
   end
   else
   begin
     sPeriodoAnt:=sano+DMTE.StrZero(IntToStr(StrToInt(smes)-1),2);
     xAnio:=sano;
     xMes :=DMTE.StrZero(IntToStr(StrToInt(smes)-1),2);

   end;

   sSQL:= ' SELECT ''                                 '' ECNOCOMP, ''01'' BANCOID, '+
          ' ''                    '' CCBCOID,'+
        DMTE.wRepFecServi+' ECFCOMP, ''                       '' FPAGODES,''XYZ'' CIAID, '+
        '''                         '' ECNOCHQ, ''                                            '' ECGIRA,'+
        '''BANCO FINANCIERO DEL PERU        '' BANCONOM, '+
        '0.0000 INGRESO, 0.0000 EGRESO, 0.0000 SALDO FROM TGE901';

   DMTE.cdsSQL.Close;
   DMTE.cdsSQL.DataRequest(ssql);
   DMTE.cdsSQL.open;
   DMTE.cdsSQL.EmptyDataSet;

   //LLENAR EL SALDO INICIAL
   DMTE.cdsQry.First;

   xsaldoIniMO :=0;
   sSQL:=' SELECT SALDOACUM'+xMes+' SALDOFINMO'+
         ' FROM CAJA401 '+
         ' WHERE CIAID='+QuotedStr(dblcCIA.text)+' AND SBBANCO='+QuotedStr(DMTE.cdsQry.FieldByName('BANCOID').AsString)+
         ' AND CTACTE='+QuotedStr(DMTE.cdsQry.FieldByName('CCBCOID').AsString)+' AND SBANO='+QuotedStr(xAnio);

   DMTE.Cds1.Close;
   DMTE.cds1.DataRequest(ssql);
   DMTE.cds1.open;

   xsaldoIniMO:=DMTE.cds1.FieldByName('SALDOFINMO').asFloat;

   DMTE.cdsSQL.Insert;
   DMTE.cdsSQL.FieldByName('CIAID').AsString    := dblcCIA.text ;
   DMTE.cdsSQL.FieldByName('BANCOID').AsString  := DMTE.cdsQry.FieldByName('BANCOID').AsString;
   DMTE.cdsSQL.FieldByName('BANCONOM').AsString := DMTE.cdsQry.FieldByName('BANCONOM').AsString;

   DMTE.cdsSQL.FieldByName('CCBCOID').AsString  := DMTE.cdsQry.FieldByName('CCBCOID').AsString;

   DMTE.cdsSQL.FieldByName('ECNOCOMP').AsString := '0000000000';
   DMTE.cdsSQL.FieldByName('FPAGODES').AsString := 'SALDO INICIAL';
//   DMTE.cdsSQL.FieldByName('ECFCOMP').AsDateTime:=DMTE.cdsQry.FieldByName('ECFCOMP').AsDateTime;

   DMTE.cdsSQL.FieldByName('SALDO').AsFloat := xsaldoIniMO;
   xSaldo     := xsaldoIniMO;   

   sBcoId   := DMTE.cdsQry.FieldByName('BANCOID').AsString;
   sCCBcoId := DMTE.cdsQry.FieldByName('CCBCOID').AsString;


   DMTE.cdsQry.first;
   while not DMTE.cdsQry.Eof do
   begin
     if xInsertaSaldo then
     begin
        DMTE.cdsSQL.Insert;
        DMTE.cdsSQL.FieldByName('CIAID').AsString    := dblcCIA.text ;
        DMTE.cdsSQL.FieldByName('BANCOID').AsString  := DMTE.cdsQry.FieldByName('BANCOID').AsString;
        DMTE.cdsSQL.FieldByName('BANCONOM').AsString := DMTE.cdsQry.FieldByName('BANCONOM').AsString;

        DMTE.cdsSQL.FieldByName('CCBCOID').AsString  := DMTE.cdsQry.FieldByName('CCBCOID').AsString;

        DMTE.cdsSQL.FieldByName('ECNOCOMP').AsString := '0000000000';
        DMTE.cdsSQL.FieldByName('FPAGODES').AsString := 'SALDO INICIAL';
//        DMTE.cdsSQL.FieldByName('ECFCOMP').AsDateTime:= DMTE.cdsQry.FieldByName('ECFCOMP').AsDateTime;
        DMTE.cdsSQL.FieldByName('SALDO').AsFloat     := xsaldoIniMO;
        xSaldo     := xsaldoIniMO;

        xInsertaSaldo := False;

     end;

     DMTE.cdsSQL.Insert;
     DMTE.cdsSQL.FieldByName('BANCOID').AsString := DMTE.cdsQry.FieldByName('BANCOID').AsString;
     DMTE.cdsSQL.FieldByName('CCBCOID').AsString := DMTE.cdsQry.FieldByName('CCBCOID').AsString;

     DMTE.cdsSQL.FieldByName('ECNOCOMP').AsString := DMTE.cdsQry.FieldByName('ECNOCOMP').AsString;
     DMTE.cdsSQL.FieldByName('FPAGODES').AsString := DMTE.cdsQry.FieldByName('FPAGODES').AsString;
     DMTE.cdsSQL.FieldByName('ECFCOMP').AsDateTime:= DMTE.cdsQry.FieldByName('ECFCOMP').AsDateTime;
     DMTE.cdsSQL.FieldByName('ECNOCHQ').AsString  := DMTE.cdsQry.FieldByName('ECNOCHQ').AsString;
     DMTE.cdsSQL.FieldByName('ECGIRA').AsString   := DMTE.cdsQry.FieldByName('ECGIRA').AsString;
     if DMTE.cdsQry.FieldByName('EC_IE').AsString='I' then
     begin
       DMTE.cdsSQL.FieldByName('INGRESO').AsFloat := DMTE.cdsQry.FieldByName('ECMTOORI').AsFloat;
     end;

     if DMTE.cdsQry.FieldByName('EC_IE').AsString='E' then
     begin
       DMTE.cdsSQL.FieldByName('EGRESO').AsFloat := DMTE.cdsQry.FieldByName('ECMTOORI').AsFloat;
     end;
     xSaldo:=xSaldo+DMTE.cdsSQL.FieldByName('INGRESO').AsFloat-DMTE.cdsSQL.FieldByName('EGRESO').AsFloat;
     DMTE.cdsSQL.FieldByName('SALDO').AsFloat:=xSaldo;
     DMTE.cdsQry.next;
     if ((sBcoId<>DMTE.cdsQry.FieldByName('BANCOID').AsString) or (sCCBcoId<>DMTE.cdsQry.FieldByName('CCBCOID').AsString)) then
     begin
        xsaldoIniMO :=0;
        sSQL:=' SELECT SALDOACUM'+xMes+' SALDOFINMO'+
              ' FROM CAJA401 '+
              ' WHERE CIAID='+QuotedStr(dblcCIA.text)+' AND SBBANCO='+QuotedStr(DMTE.cdsQry.FieldByName('BANCOID').AsString)+
              ' AND CTACTE='+QuotedStr(DMTE.cdsQry.FieldByName('CCBCOID').AsString)+' AND SBANO='+QuotedStr(xAnio);

        DMTE.Cds1.Close;
        DMTE.cds1.DataRequest(ssql);
        DMTE.cds1.open;
        xInsertaSaldo := True;
        xSaldo:=0;

        xsaldoIniMO:=DMTE.cds1.FieldByName('SALDOFINMO').asFloat;

        sBcoId   := DMTE.cdsQry.FieldByName('BANCOID').AsString;
        sCCBcoId := DMTE.cdsQry.FieldByName('CCBCOID').AsString;


     end;


   End;
//   DMTE.cdsSQL.IndexFieldNames := 'ECNOCOMP;ECFCOMP';
   DMTE.cdsSQL.IndexFieldNames := 'BANCOID;CCBCOID;ECNOCOMP;ECFCOMP';

	 //JCC: 24/06/2002
	ppLibCaja.TEMPLATE.FileName := wRutaRpt + '\LibroBancoNw.Rtm';
   ppLibCaja.template.LoadFromFile ;
   pplblCIA.Caption    := dbeCIA.text;
   if rgCta.ItemIndex=0 then
       pplblCuenta.caption := 'Todas'
   else
       pplblCuenta.caption := dblcCtaCte.text+'('+dbeCtaCte.text+')';

   if rgBanco.ItemIndex=0 then
      pplblBco.caption    := 'BANCO: Todos'
   else
      pplblBco.caption    := dblcBanco.text+ ' '+dbeBanco.text;

   pplblPeriodo.caption:= DMTE.NombreAnoMes(dbePeriodo.text);
//   pplblSaldoF.caption:=FloatToStrF(xSaldo,ffNumber,15,2);
//   ppDesigner1.Show;
   ppLibCaja.Print;

end;

procedure TFToolLibBanco.dblcCIAExit(Sender: TObject);
begin
  ValidaComponente(Sender);
  if dblcCIA.text<>'' then
    dbeCIA.text:=DMTE.cdsCia.FieldByName('CIADES').AsString;

end;

procedure TFToolLibBanco.dblcCIANotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;

end;

procedure TFToolLibBanco.dblcBancoExit(Sender: TObject);
begin
  ValidaComponente(Sender);
  if dblcBanco.text<>'' then
    dbeBanco.Text := DMTE.cdsBanco.FieldByName('BANCONOM').AsString;
  if dbeBanco.Text='' then
  begin
     DMTE.cdsCCBco.Filtered := False;
     dblcCtaCte.Enabled    := False;
     dbeBanco.Text := '';
     dblcCtaCte.Text := '';
     dbeCtaCte.Text := '';
     Exit;
  end;

  DMTE.cdsCCBco.Filtered := False;
  DMTE.cdsCCBco.Filter   := '';
  DMTE.cdsCCBco.Filter   := 'CIAID='''+dblcCia.text+''' and BANCOID='''+dblcBanco.Text+'''';
  DMTE.cdsCCBco.Filtered := True;

//  dcCTAB;

end;

procedure TFToolLibBanco.dbePeriodoExit(Sender: TObject);
begin
  ValidaComponente(Sender);
  gbCtaCte.Enabled := False;  
end;

procedure TFToolLibBanco.dblcBancoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;

end;

procedure TFToolLibBanco.dblcCtaCteExit(Sender: TObject);
var
 xvartmoneda : String;
begin
  ValidaComponente(Sender);
  sCTAB := dblcCtaCte.Text;
  if sCTAB = '' then
  begin
   dbeCtaCte.Text := '';
   Exit;
  end;
  // buscar moneda y cargcar a una variable
  dbeMonCTACTE.Text := MonedaCTACTE;
  dbeCtaCte.Text := DMTE.cdsCCBco.FieldByName('CCBCODES').AsString;
  xvartmoneda:=DMTE.cdsCCBco.FieldByName('TMONID').AsString;
  dbclMoneda.Text:=xvartmoneda;

end;

procedure TFToolLibBanco.dblcCtaCteNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;

end;

procedure TFToolLibBanco.dbclMonedaChange(Sender: TObject);
begin
  sMON := dbclMoneda.Text;
  dbeMoneda.Text := DMTE.cdsTMon.FieldByName('TMONDES').AsString;

end;

procedure TFToolLibBanco.dbclMonedaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;

end;

procedure TFToolLibBanco.ValidaComponente(Componente:TObject);
begin
   if ((Screen.ActiveControl).Parent.TabOrder+1)*10+((Screen.ActiveControl).TabOrder)< (((Componente as TWinControl).Parent.TabOrder+1)*10)+((Componente as TWinControl).TabOrder) then Exit;
   if (Componente as TCustomEdit).text = '' then

   if (Componente as TWinControl).enabled then
   begin
     (Componente as TWinControl).Setfocus;
      Raise Exception.Create('Ingrese '+(Componente as TWinControl).hint);
   end;
end;

procedure TFToolLibBanco.dcCTAB;
begin
  DMTE.cdsCCBco.First;
  sCTAB := trim(DMTE.cdsCCBco.FieldByName('CCBCOID').AsString);
  dblcCtaCte.Text := sCTAB;
  dblcCtaCte.Enabled := DMTE.cdsCCBco.RecordCount > 1;
  if dblcCtaCte.Enabled then
    dblcCtaCte.Setfocus;
end;

function TFToolLibBanco.MonedaCTACTE: String;
var
  bmk   : TBookMark;
begin
  bmk := DMTE.cdsTMon.GetBookmark;
  if DMTE.cdsTMon.Locate('TMONID',DMTE.cdsCCBco.FieldByName('TMONID').AsString,[]) then
  begin
     result := DMTE.cdsTMon.FieldByName('TMONDES').AsString;

     sCTABMON := DMTE.cdsTMon.FieldByName('TMONDES').AsString;
  end
  else begin
     result := '';
     sCTABMON := '';
  end;
  DMTE.cdsTMon.FreeBookmark(bmk);
end;




procedure TFToolLibBanco.rgBancoClick(Sender: TObject);
var
  xSQL : string;
begin
  if rgBanco.ItemIndex=0 then
  begin
     gbCtaCte.Enabled  := False;
     dblcBanco.Text    := '';
     dblcBanco.Enabled := False;
     dbeBanco.Enabled  := False;
     dbeBanco.Text     := '';
     InicializaCtaCte;

     xSQL := ' SELECT A.BANCOID '+
             ' FROM TGE105 A ,TGE106 B  '+
             ' WHERE A.BANCOID=B.BANCOID AND A.BCOTIPCTA=''B'' '+
             ' AND B.CIAID='+Quotedstr(dblcCIA.Text)+
             ' GROUP BY A.BANCOID ';

     DMTE.cdsQry2.IndexFieldNames;
     DMTE.cdsQry2.Filter:='';
     DMTE.cdsQry2.Filtered :=False;
     DMTE.cdsQry2.Close;
     DMTE.cdsQry2.DataRequest(xSQL);
     DMTE.cdsQry2.Open;
     sBancos:='';
     DMTE.cdsQry2.First;
     while not DMTE.cdsQry2.Eof do
     begin
        if length(sBancos)=0 then
           sBancos:= 'IN('+''''+DMTE.cdsQry2.fieldbyname('BANCOID').AsString+''
        else
           sBancos:= sBancos+''' ,'+''''+DMTE.cdsQry2.fieldbyname('BANCOID').AsString+'';

        DMTE.cdsQry2.Next;
        if DMTE.cdsQry2.Eof then
           sBancos:= sBancos+''') ';

     end;

  end
  else
     if rgBanco.ItemIndex=1 then
     begin
        gbCtaCte.Enabled  := True;
        dblcBanco.Text    := '';
        dblcBanco.Enabled := True;
        dbeBanco.Enabled  := False;
        dbeBanco.Text     := '';
     end;


end;

procedure TFToolLibBanco.rgCtaClick(Sender: TObject);
var
   xSQL: string;
begin
   if rgCta.ItemIndex=0 then
   begin
     if (rgBanco.ItemIndex=1) and  (length(Trim(dblcBanco.text))=0) then
        raise exception.Create('Seleccione Banco');

     dblcCtaCte.Text := '';
     dblcCtaCte.Enabled := False;
     dbeCtaCte.Text  := '';
     dbeCtaCte.Enabled := False;

     if rgBanco.ItemIndex=1 then
     begin
        xSQL := ' SELECT B.BANCOID,B.CCBCOID '+
                ' FROM TGE105 A ,TGE106 B  '+
                ' WHERE A.BANCOID=B.BANCOID AND A.BCOTIPCTA=''B'' '+
                ' AND B.CIAID='+Quotedstr(dblcCIA.Text)+
                ' AND B.BANCOID='+Quotedstr(dblcBanco.text);

        DMTE.cdsQry2.IndexFieldNames;
        DMTE.cdsQry2.Filter:='';
        DMTE.cdsQry2.Filtered :=False;
        DMTE.cdsQry2.Close;
        DMTE.cdsQry2.DataRequest(xSQL);
        DMTE.cdsQry2.Open;
        sCtas:='';
        DMTE.cdsQry2.First;
        while not DMTE.cdsQry2.Eof do
        begin
           if length(sCtas)=0 then
              sCtas:= 'IN('+''''+DMTE.cdsQry2.fieldbyname('CCBCOID').AsString+''
           else
              sCtas:= sCtas+''' ,'+''''+DMTE.cdsQry2.fieldbyname('CCBCOID').AsString+'';

           DMTE.cdsQry2.Next;
           if DMTE.cdsQry2.Eof then
              sCtas:= sCtas+''') ';

        end;

     end;


   end
   else
      if rgCta.ItemIndex=1 then
      begin
         dblcCtaCte.Text := '';
         dblcCtaCte.Enabled := True;
         dbeCtaCte.Text  := '';
         dbeCtaCte.Enabled := False;

      end


end;

procedure TFToolLibBanco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
   key:=#0;
   perform(CM_DialogKey,VK_TAB,0);
  end;

end;

procedure TFToolLibBanco.z2bbtnOKClick(Sender: TObject);
var
  fsBCO, fsCIA, fsCTAB,xSQL,
  sPeriodoAnt,sano,smes,sSQL : String;
  xSaldo,xsaldoIniMN,xSaldoIniME : Double;
begin
   if Length(Trim(dblcCIA.text))=0 then
      raise exception.Create('Ingrese Compañia');

   if Length(Trim(dbePeriodo.text))=0 then
      raise exception.Create('Ingrese Periodo');

   if (rgBanco.ItemIndex=1) and  (length(Trim(dblcBanco.text))=0) then
       raise exception.Create('Seleccione Banco');

   //Filtrar Bancos
   if (Length(Trim(sBancos))=0) and (rgBanco.ItemIndex=0) then
   begin
      xSQL := ' SELECT A.BANCOID '+
              ' FROM TGE105 A ,TGE106 B  '+
              ' WHERE A.BANCOID=B.BANCOID AND A.BCOTIPCTA=''B'' '+
              ' AND B.CIAID='+Quotedstr(dblcCIA.Text)+
              ' GROUP BY A.BANCOID ';

      DMTE.cdsQry2.IndexFieldNames;
      DMTE.cdsQry2.Filter:='';
      DMTE.cdsQry2.Filtered :=False;
      DMTE.cdsQry2.Close;
      DMTE.cdsQry2.DataRequest(xSQL);
      DMTE.cdsQry2.Open;
      sBancos:='';
      DMTE.cdsQry2.First;
      while not DMTE.cdsQry2.Eof do
      begin
         if length(sBancos)=0 then
            sBancos:= 'IN('+''''+DMTE.cdsQry2.fieldbyname('BANCOID').AsString+''
         else
            sBancos:= sBancos+''' ,'+''''+DMTE.cdsQry2.fieldbyname('BANCOID').AsString+'';

         DMTE.cdsQry2.Next;
         if DMTE.cdsQry2.Eof then
            sBancos:= sBancos+''') ';

      end;
   end;

   if (rgBanco.ItemIndex=1) and (rgCta.ItemIndex=0) then
   begin
        xSQL := ' SELECT B.BANCOID,B.CCBCOID '+
                ' FROM TGE105 A ,TGE106 B  '+
                ' WHERE A.BANCOID=B.BANCOID AND A.BCOTIPCTA=''B'' '+
                ' AND B.CIAID='+Quotedstr(dblcCIA.Text)+
                ' AND B.BANCOID='+Quotedstr(dblcBanco.text);

      DMTE.cdsQry2.IndexFieldNames;
      DMTE.cdsQry2.Filter:='';
      DMTE.cdsQry2.Filtered :=False;
      DMTE.cdsQry2.Close;
      DMTE.cdsQry2.DataRequest(xSQL);
      DMTE.cdsQry2.Open;
      sCtas:='';
      DMTE.cdsQry2.First;
      while not DMTE.cdsQry2.Eof do
      begin
         if length(sCtas)=0 then
            sCtas:= 'IN('+''''+DMTE.cdsQry2.fieldbyname('CCBCOID').AsString+''
         else
            sCtas:= sCtas+''' ,'+''''+DMTE.cdsQry2.fieldbyname('CCBCOID').AsString+'';

         DMTE.cdsQry2.Next;
         if DMTE.cdsQry2.Eof then
            sCtas:= sCtas+''') ';

      end;

   end;

   TfSaldoAnt := 0;
   fSaldo     := 0;
   fDebe      := 0;
   fSaldo     := 0;

	if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
   begin
      sSQL := 'SELECT CAJA.ECNOCOMP,CAJA.ECFCOMP,CAJA.ECNOCHQ,CAJA.ECGIRA,0.00 SALDO ,CAJA.BANCOID,CAJA.CCBCOID'
           +', CIA.CIADES,BANK.BANCONOM,CTAE.CCBCODES,MON.TMONDES,EC_IE,ECMTOORI,'
           +' MON.TMONABR, CASE WHEN CAJA.EC_PROCE=''4'' OR CAJA.EC_PROCE=''7'' THEN ''TRANSFERENCIA'' ELSE FPA.FPAGODES END FPAGODES, '
           +' (CASE WHEN EC_IE= ''I'' THEN COALESCE(ECMTOORI,0) END ) AS INGRESO,'
           +' (CASE WHEN EC_IE= ''E'' THEN COALESCE(ECMTOORI,0) END ) AS EGRESO'
           +' FROM CAJA302  CAJA'
           +' LEFT JOIN TGE101 CIA ON(CIA.CIAID= CAJA.CIAID )'
           +' LEFT JOIN TGE105 BANK ON(BANK.BANCOID=CAJA.BANCOID)'
           +' LEFT JOIN TGE106 CTAE ON( CTAE.CIAID=CAJA.CIAID AND  CTAE.CCBCOID=CAJA.CCBCOID AND CTAE.BANCOID = CAJA.BANCOID  )'
           +' LEFT JOIN TGE103 MON ON(MON.TMONID=CAJA.TMONID)'
           +' LEFT JOIN TGE112 FPA ON (FPA.FPAGOID=CAJA.FPAGOID)'
           +' WHERE CAJA.CIAID='+QuotedStr(dblcCIA.text);

           if rgBanco.ItemIndex=0 then//Todos
             sSQL:= sSQL +' AND CAJA.BANCOID '+sBancos
           else
             sSQL:= sSQL +' AND CAJA.BANCOID='+QuotedStr(dblcBanco.TEXT);

           if rgCta.ItemIndex=0 then//Todos
           begin
              if rgBanco.ItemIndex=1 then//Uno
                 sSQL:= sSQL +' AND CAJA.CCBCOID '+sCtas;
           end
           else
             sSQL:= sSQL +' AND CAJA.CCBCOID='+QuotedStr(dblcCtaCte.text);

           sSQL:= sSQL +' AND CAJA.ECANOMM='+QuotedStr(dbePeriodo.text)
   end
   else
   if DMTE.SRV_D = 'ORACLE' then
   begin
      sSQL := 'SELECT CAJA.ECNOCOMP,CAJA.ECFCOMP,CAJA.ECNOCHQ,CAJA.ECGIRA,0.00 SALDO ,CAJA.BANCOID,CAJA.CCBCOID'
           +', CIA.CIADES,BANK.BANCONOM,CTAE.CCBCODES,MON.TMONDES,EC_IE,ECMTOORI,'
             +' MON.TMONDES,MON.TMONABR,CASE WHEN CAJA.EC_PROCE=''4'' OR CAJA.EC_PROCE=''7'' THEN ''TRANSFERENCIA'' ELSE FPA.FPAGODES END FPAGODES, '
{             +' DECODE(EC_IE, ''I'', NVL(ECMTOLOC,0)) INGRESO,'
             +' DECODE(EC_IE, ''E'', NVL(ECMTOLOC,0)) EGRESO'  }
             +' DECODE(EC_IE, ''I'', NVL(ECMTOORI,0)) INGRESO,'
             +' DECODE(EC_IE, ''E'', NVL(ECMTOORI,0)) EGRESO'

             +' FROM CAJA302 CAJA, TGE101 CIA, TGE105 BANK, TGE106 CTAE, TGE103 MON, TGE112 FPA'
             +' WHERE  CAJA.CIAID='+QuotedStr(dblcCIA.text);
{             +' AND CAJA.BANCOID='+QuotedStr(dblcBanco.TEXT)
             +' AND CAJA.CCBCOID='+QuotedStr(dblcCtaCte.text)}
             if rgBanco.ItemIndex=0 then//Todos
               sSQL:= sSQL +' AND CAJA.BANCOID '+sBancos
             else
               sSQL:= sSQL +' AND CAJA.BANCOID='+QuotedStr(dblcBanco.TEXT);

             if rgCta.ItemIndex=0 then//Todos
             begin
                if rgBanco.ItemIndex=1 then//Uno
                   sSQL:= sSQL +' AND CAJA.CCBCOID '+sCtas;
             end
             else
               sSQL:= sSQL +' AND CAJA.CCBCOID='+QuotedStr(dblcCtaCte.text);

             sSQL:= sSQL +' AND CAJA.ECANOMM='+QuotedStr(dbePeriodo.text)

             +' and CAJA.CIAID = CIA.CIAID(+)'
             +'  AND CAJA.BANCOID=BANK.BANCOID(+)'
             +'  AND CAJA.CIAID=CTAE.CIAID(+) AND CAJA.CCBCOID =CTAE.CCBCOID(+) AND CAJA.BANCOID=CTAE.BANCOID(+)'
             +'  AND CAJA.TMONID=MON.TMONID(+)'
             +'  AND CAJA.FPAGOID=FPA.FPAGOID(+) ';
   end;
   FConsulta.xFiltroRep.UsuarioSQL.Clear;
   FConsulta.xFiltroRep.UsuarioSQL.Add(sSQL) ;
   FConsulta.xFiltroRep.NewQuery;

   FConsulta.xFiltroRep.FMant.cds2.IndexFieldNames:='BANCOID;CCBCOID;ECNOCOMP;ECFCOMP';

end;

procedure TFToolLibBanco.ppLibCajaPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;

end;

procedure TFToolLibBanco.InicializaCtaCte;
begin
   rgCta.ItemIndex   := 0;
   dblcCtaCte.Text   := '';
   dbeCtaCte.Text    := '';
   dbeMonCTACTE.Text := '';
end;

end.

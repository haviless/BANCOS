unit Caja707;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Mask, wwdbedit, StdCtrls, wwdblook, Buttons, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppProd, ppReport, ppEndUsr, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe,DB,ppViewr, wwdbdatetimepicker, ppTypes;

type
  TFToolSalBanco = class(TForm)
    pnl: TPanel;
    Z2bbtnPrint: TBitBtn;
    dbpplEgrCaja: TppDBPipeline;
    ppDesigner1: TppDesigner;
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
    dbclMoneda: TwwDBLookupCombo;
    dbeMoneda: TwwDBEdit;
    dbdtpFHasta: TwwDBDateTimePicker;
    pprSaldoBco: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    pplblCiaDes: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    pplblFecha: TppLabel;
    ppLabel6: TppLabel;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    procedure Z2bbtnPrintClick(Sender: TObject);
    procedure dblcCIAExit(Sender: TObject);
    procedure dblcCIANotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcBancoExit(Sender: TObject);
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
    procedure dbdtpFHastaExit(Sender: TObject);
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
     procedure Calculo;          
  public
    { Public declarations }
  end;

var
  FToolSalBanco: TFToolSalBanco;

implementation

uses CajaDM, oaTE4000;

{$R *.DFM}

procedure TFToolSalBanco.Z2bbtnPrintClick(Sender: TObject);
begin

   if DMTE.cdsQry.RecordCount=0 then
      raise exception.Create('No existe informacion a mostrar');

   dbpplEgrCaja.DataSource := FConsulta.xFiltroRep1.FMant.ds2;
   pprSaldoBco.TEMPLATE.FileName := wRutaRpt + '\SaldoBanco.Rtm';
   pprSaldoBco.template.LoadFromFile ;
   pplblFecha.Caption  := Datetostr(dbdtpFHasta.Date);
   pplblCiaDEs.Caption := dbeCIA.Text;
   pprSaldoBco.Print;
end;

procedure TFToolSalBanco.dblcCIAExit(Sender: TObject);
begin
  ValidaComponente(Sender);
  if dblcCIA.text<>'' then
    dbeCIA.text:=DMTE.cdsCia.FieldByName('CIADES').AsString;

end;

procedure TFToolSalBanco.dblcCIANotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;

end;

procedure TFToolSalBanco.dblcBancoExit(Sender: TObject);
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

procedure TFToolSalBanco.dblcBancoNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;

end;

procedure TFToolSalBanco.dblcCtaCteExit(Sender: TObject);
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

procedure TFToolSalBanco.dblcCtaCteNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;

end;

procedure TFToolSalBanco.dbclMonedaChange(Sender: TObject);
begin
  sMON := dbclMoneda.Text;
  dbeMoneda.Text := DMTE.cdsTMon.FieldByName('TMONDES').AsString;

end;

procedure TFToolSalBanco.dbclMonedaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookUpField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;

end;

procedure TFToolSalBanco.ValidaComponente(Componente:TObject);
begin
   if ((Screen.ActiveControl).Parent.TabOrder+1)*10+((Screen.ActiveControl).TabOrder)< (((Componente as TWinControl).Parent.TabOrder+1)*10)+((Componente as TWinControl).TabOrder) then Exit;
   if (Componente as TCustomEdit).text = '' then

   if (Componente as TWinControl).enabled then
   begin
     (Componente as TWinControl).Setfocus;
      Raise Exception.Create('Ingrese '+(Componente as TWinControl).hint);
   end;
end;

procedure TFToolSalBanco.dcCTAB;
begin
  DMTE.cdsCCBco.First;
  sCTAB := trim(DMTE.cdsCCBco.FieldByName('CCBCOID').AsString);
  dblcCtaCte.Text := sCTAB;
  dblcCtaCte.Enabled := DMTE.cdsCCBco.RecordCount > 1;
  if dblcCtaCte.Enabled then
    dblcCtaCte.Setfocus;
end;

function TFToolSalBanco.MonedaCTACTE: String;
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




procedure TFToolSalBanco.rgBancoClick(Sender: TObject);
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

procedure TFToolSalBanco.rgCtaClick(Sender: TObject);
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

procedure TFToolSalBanco.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
   key:=#0;
   perform(CM_DialogKey,VK_TAB,0);
  end;

end;

procedure TFToolSalBanco.z2bbtnOKClick(Sender: TObject);
var
  fsBCO, fsCIA, fsCTAB,xSQL, xMes,
  sPeriodoAnt,sano,smes,sSQL : String;
  xSaldo,xsaldoIniMN,xSaldoIniME : Double;
  Y,M,D :word;
begin
   if Length(Trim(dblcCIA.text))=0 then
      raise exception.Create('Ingrese Compañia');

   if (rgBanco.ItemIndex=1) and  (length(Trim(dblcBanco.text))=0) then
       raise exception.Create('Seleccione Banco');

   if dbdtpFHasta.Date= 0 then
      raise exception.Create('Ingrese Fecha');       

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

   DecodeDate(dbdtpFHasta.Date,Y,M,D);
   xMes:=  DMTE.StrZero(inttostr(M),2);

   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
   begin
      sSQL := 'SELECT CAJA.CIAID,CAJA.ECNOCOMP,CAJA.ECFCOMP,CAJA.ECNOCHQ,CAJA.ECGIRA,0.00 SALDO ,CAJA.BANCOID,CAJA.CCBCOID'
           +', CIA.CIADES,BANK.BANCONOM,CTAE.CCBCODES,MON.TMONDES,EC_IE,ECMTOORI,'
           +' MON.TMONABR, CASE WHEN CAJA.EC_PROCE=''4'' OR CAJA.EC_PROCE=''7'' THEN ''TRANSFERENCIA'' ELSE FPA.FPAGODES END FPAGODES, '
           +' (CASE WHEN EC_IE= ''I'' THEN ECMTOORI END ) AS INGRESO,'
           +' (CASE WHEN EC_IE= ''E'' THEN ECMTOORI END ) AS EGRESO'
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
                       +' AND CAJA.ECFCOMP<='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFHasta.Date)+''')';
   end
   else
   if DMTE.SRV_D = 'ORACLE' then
   begin
      sSQL := 'SELECT CAJA.CIAID,CAJA.ECNOCOMP,CAJA.ECFCOMP,CAJA.ECNOCHQ,CAJA.ECGIRA,0.00 SALDO ,CAJA.BANCOID,CAJA.CCBCOID'
             +', CIA.CIADES,BANK.BANCONOM,CTAE.CCBCODES,MON.TMONDES,EC_IE,ECMTOORI,'
             +' MON.TMONDES,MON.TMONABR,CASE WHEN CAJA.EC_PROCE=''4'' OR CAJA.EC_PROCE=''7'' THEN ''TRANSFERENCIA'' ELSE FPA.FPAGODES END FPAGODES, '
             +' DECODE(EC_IE, ''I'', ECMTOORI) INGRESO,'
             +' DECODE(EC_IE, ''E'', ECMTOORI) EGRESO'
             +' FROM CAJA302 CAJA, TGE101 CIA, TGE105 BANK, TGE106 CTAE, TGE103 MON, TGE112 FPA'
             +' WHERE  CAJA.CIAID='+QuotedStr(dblcCIA.text);
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
                       +' AND CAJA.ECFCOMP<='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFHasta.Date)+''')'

             +' and CAJA.CIAID = CIA.CIAID(+)'
             +'  AND CAJA.BANCOID=BANK.BANCOID(+)'
             +'  AND CAJA.CIAID=CTAE.CIAID(+) AND CAJA.CCBCOID =CTAE.CCBCOID(+) AND CAJA.BANCOID=CTAE.BANCOID(+)'
             +'  AND CAJA.TMONID=MON.TMONID(+)'
             +'  AND CAJA.FPAGOID=FPA.FPAGOID(+) ';
   end;

   DMTE.cdsConsulta.Close;
   DMTE.cdsConsulta.IndexFieldNames :='';
   DMTE.cdsConsulta.Filter:='';
   DMTE.cdsConsulta.Filtered := False;
   DMTE.cdsConsulta.DataRequest(sSQL);
   DMTE.cdsConsulta.Open;
   DMTE.cdsConsulta.IndexFieldNames := 'BANCOID;CCBCOID;ECNOCOMP;ECFCOMP';

   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
   begin
      sSQL := ' SELECT A.CIAID,A.SBBANCO,D.BANCONOM,A.SBANO,A.CTACTE,D.TMONID,0.00 SALDO '+
              ' FROM CAJA401 A '+
              ' LEFT JOIN (SELECT B.CIAID,B.BANCOID,C.BANCONOM,B.CCBCOID,B.TMONID '+
              ' FROM TGE106 B LEFT JOIN TGE105 C ON (B.BANCOID=C.BANCOID)) D ON   '+
              ' (D.CIAID=A.CIAID AND D.BANCOID=A.SBBANCO AND D.CCBCOID=A.CTACTE)  '+
              ' WHERE A.CIAID='+QuotedStr(dblcCIA.text);

              if rgBanco.ItemIndex=0 then//Todos
                sSQL:= sSQL +' AND A.SBBANCO '+sBancos
              else
                sSQL:= sSQL +' AND A.SBBANCO='+QuotedStr(dblcBanco.TEXT);

              if rgCta.ItemIndex=0 then//Todos
              begin
                 if rgBanco.ItemIndex=1 then//Uno
                    sSQL:= sSQL +' AND A.CTACTE '+sCtas;
              end
              else
                sSQL:= sSQL +' AND A.CTACTE='+QuotedStr(dblcCtaCte.text);

              sSQL:= sSQL +' AND A.SBANO='+QuotedStr(inttostr(Y));
   end
   else
      if (DMTE.SRV_D = 'ORACLE')  then
      begin

         sSQL  := '  SELECT A.CIAID,A.SBBANCO,D.BANCONOM,A.SBANO,A.CTACTE, '+
                  '  D.TMONID,0.00 SALDO '+
                  '  FROM CAJA401 A ,(SELECT B.CIAID,B.BANCOID,C.BANCONOM,B.CCBCOID, B.TMONID '+
                                    ' FROM TGE106 B ,TGE105 C  WHERE B.BANCOID=C.BANCOID(+) ) D '+
                 ' WHERE A.CIAID='+QuotedStr(dblcCIA.text);
{         sSQL := ' SELECT A.CIAID,A.SBBANCO,D.BANCONOM,A.SBANO,A.CTACTE,D.TMONID,0.00 SALDO '+
                 ' FROM CAJA401 A '+
                 ' LEFT JOIN (SELECT B.CIAID,B.BANCOID,C.BANCONOM,B.CCBCOID,B.TMONID '+
                 ' FROM TGE106 B LEFT JOIN TGE105 C ON (B.BANCOID=C.BANCOID)) D ON   '+
                 ' (D.CIAID=A.CIAID AND D.BANCOID=A.SBBANCO AND D.CCBCOID=A.CTACTE)  '+
                 ' WHERE A.CIAID='+QuotedStr(dblcCIA.text);}
                 if rgBanco.ItemIndex=0 then//Todos
                   sSQL:= sSQL +' AND A.SBBANCO '+sBancos
                 else
                   sSQL:= sSQL +' AND A.SBBANCO='+QuotedStr(dblcBanco.TEXT);

                 if rgCta.ItemIndex=0 then//Todos
                 begin
                    if rgBanco.ItemIndex=1 then//Uno
                       sSQL:= sSQL +' AND A.CTACTE '+sCtas;
                 end
                 else
                   sSQL:= sSQL +' AND A.CTACTE='+QuotedStr(dblcCtaCte.text);

                 sSQL:= sSQL +' AND A.SBANO='+QuotedStr(inttostr(Y));
                 sSQL:= sSQL +'  AND  (D.CIAID=A.CIAID(+) AND D.BANCOID=A.SBBANCO(+) AND D.CCBCOID=A.CTACTE(+))';
      end;

   FConsulta.xFiltroRep1.UsuarioSQL.Clear;
   FConsulta.xFiltroRep1.UsuarioSQL.Add(sSQL) ;
   FConsulta.xFiltroRep1.NewQuery;

   FConsulta.xFiltroRep1.FMant.cds2.IndexFieldNames:='CIAID;SBANO;SBBANCO;CTACTE';
   Calculo;

end;

procedure TFToolSalBanco.ppLibCajaPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;

end;

procedure TFToolSalBanco.InicializaCtaCte;
begin
   rgCta.ItemIndex   := 0;
   dblcCtaCte.Text   := '';
   dbeCtaCte.Text    := '';
   dbeMonCTACTE.Text := '';
end;

procedure TFToolSalBanco.Calculo;
var
  fsBCO, fsCIA, fsCTAB,
  sPeriodoAnt,sano,smes,sSQL,xAnio,xMes : String;
  sCiaId,sBcoId,sCCBcoId : string;
  xSaldo,xsaldoIniMO,xsaldoIniMN,xSaldoIniME : Double;
  xInsertaSaldo : boolean;

  xTotIng,xTotEg : double;
begin

   if FConsulta.xFiltroRep1.FMant.cds2.RecordCount=0 then
      raise exception.Create('No existe informacion a mostrar');

   TfSaldoAnt := 0;
   fSaldo     := 0;
   fDebe      := 0;
   fSaldo     := 0;

   xTotIng := 0;
   xTotEg  := 0;

   dbpplEgrCaja.DataSource := DMTE.dsSQL;

   xInsertaSaldo := False;

   FConsulta.xFiltroRep1.FMant.cds2.IndexFieldNames:='CIAID;SBANO;SBBANCO;CTACTE';

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

   //LLENAR EL SALDO INICIAL

   xSaldo :=0;
   DMTE.cdsQry.first;
   while not DMTE.cdsQry.Eof do
   begin

        xsaldoIniMO :=0;
        sSQL:=' SELECT SALDOACUM'+xMes+' SALDOFINMO'+
              ' FROM CAJA401 '+
              ' WHERE CIAID='+QuotedStr(dblcCIA.text)+' AND SBBANCO='+QuotedStr(DMTE.cdsQry.FieldByName('SBBANCO').AsString)+
              ' AND CTACTE='+QuotedStr(DMTE.cdsQry.FieldByName('CTACTE').AsString)+' AND SBANO='+QuotedStr(xAnio);

        DMTE.Cds1.Close;
        DMTE.cds1.DataRequest(ssql);
        DMTE.cds1.open;
        xSaldo:=0;

        xTotIng := DMTE.OperClientDataSet(DMTE.cdsConsulta,'SUM(INGRESO)','CIAID='+Quotedstr(dblcCIA.text)
                                    +' AND BANCOID='+QuotedStr(DMTE.cdsQry.FieldByName('SBBANCO').AsString)
                                    +' AND CCBCOID='+QuotedStr(DMTE.cdsQry.FieldByName('CTACTE').AsString));

        xTotEg := DMTE.OperClientDataSet(DMTE.cdsConsulta,'SUM(EGRESO)','CIAID='+Quotedstr(dblcCIA.text)
                                    +' AND BANCOID='+QuotedStr(DMTE.cdsQry.FieldByName('SBBANCO').AsString)
                                    +' AND CCBCOID='+QuotedStr(DMTE.cdsQry.FieldByName('CTACTE').AsString));


        xsaldoIniMO:=DMTE.cds1.FieldByName('SALDOFINMO').asFloat;


        xSaldo:=xsaldoIniMO+xTotIng-xTotEg;
        DMTE.cdsQry.Edit;
        DMTE.cdsQry.FieldByName('SALDO').AsFloat:=xSaldo;
        DMTE.cdsQry.Post;

        DMTE.cdsQry.next;

   End;

end;





procedure TFToolSalBanco.dbdtpFHastaExit(Sender: TObject);
var
  Y,M,D :word;
begin
   ValidaComponente(Sender);
   gbCtaCte.Enabled := False;
   DecodeDate(dbdtpFHasta.Date,Y,M,D);
   dbePeriodo.Text:=  inttostr(Y)+DMTE.StrZero(inttostr(M),2);

end;



end.

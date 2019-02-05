
unit Caja221;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  wwdbdatetimepicker, Mask, wwdbedit, StdCtrls, wwdblook, db, dbtables,
  Buttons, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, dbclient, ppTypes,
  wwclient, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB,
  ppDBPipe, ppBands, ppViewr, ppCtrls, ppPrnabl, ppVar, myChkBox, Variants, oaVariables;

type
  TFConBank = class(TForm)
    pnlHead: TPanel;
    gbBco: TGroupBox;
    Label10: TLabel;
    Label9: TLabel;
    dblcCtaCte: TwwDBLookupCombo;
    dbeCtaCte: TwwDBEdit;
    dblcBanco: TwwDBLookupCombo;
    dbeBanco: TwwDBEdit;
    dbeMoneda: TwwDBEdit;
    gbCia: TGroupBox;
    Label11: TLabel;
    dblcCIA: TwwDBLookupCombo;
    dbeCIA: TwwDBEdit;
    gbRango: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    dbdpFIni: TwwDBDateTimePicker;
    dbdpFFin: TwwDBDateTimePicker;
    Z2bbtnOk: TBitBtn;
    pnlFoot: TPanel;
    dbeSALANT: TwwDBEdit;
    dbeTOTACU: TwwDBEdit;
    dbeTOTPEN: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbeSALACT: TwwDBEdit;
    dbeTOTCON: TwwDBEdit;
    dbrDIF: TwwDBEdit;
    Label4: TLabel;
    lblTotCON: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    lblTime: TLabel;
    Bevel3: TBevel;
    dbgEgrCaja: TwwDBGrid;
    pnlActImp: TPanel;
    Panel4: TPanel;
    Bevel4: TBevel;
    Label5: TLabel;
    dbeIMP: TwwDBEdit;
    z2bbtnOkCono: TBitBtn;
    z2bbtnCancelCono: TBitBtn;
    Bevel5: TBevel;
    pnlPrint: TPanel;
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ppReport: TppReport;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    Bevel6: TBevel;
    ppDBPipeline: TppDBPipeline;
    Label14: TLabel;
    dbeTOTDCON: TwwDBEdit;
    dbeNreg: TwwDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    dbdtpFecOper: TwwDBDateTimePicker;
    dbgExtractoBanco: TwwDBGrid;
    StaticText2: TStaticText;
    StaticText1: TStaticText;
    Z2bbtnProcesar: TBitBtn;
    pnlBotones: TPanel;
    Z2bbtnRegresa: TBitBtn;
    Z2bbtnGraba: TBitBtn;
    z2bbtnCancelado: TBitBtn;
    bbtnCancel: TBitBtn;
    Z2bbtnPrint: TBitBtn;
    BitBtn2: TBitBtn;
    Label17: TLabel;
    dbeNCheque: TwwDBEdit;
    bbtnTransferir: TBitBtn;
    chkMarca: TCheckBox;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel2: TppLabel;
    ppDBText12: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel15: TppLabel;
    ppLine2: TppLine;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel6: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText10: TppDBText;
    ppDBText17: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppLine3: TppLine;
    ppDBCalc2: TppDBCalc;
    ppDBText18: TppDBText;
    ppLabel13: TppLabel;
    pnlInserta: TPanel;
    Bevel2: TBevel;
    Label18: TLabel;
    Label21: TLabel;
    Panel3: TPanel;
    dbeImporte: TwwDBEdit;
    bbtnOkMov: TBitBtn;
    bbtnCancelMov: TBitBtn;
    dbeNoChq: TwwDBEdit;
    Label22: TLabel;
    dbdtpFecComp: TwwDBDateTimePicker;
    Label19: TLabel;
    dbeTiOp: TwwDBEdit;
    dblcTipoOp: TwwDBLookupCombo;
    dbgExtractoBancoIButton: TwwIButton;
    chkMarca1: TCheckBox;
    bbtnConcilSOL: TBitBtn;
    rgMov: TRadioGroup;
    Label12: TLabel;
    dblcTipoOp2: TwwDBLookupCombo;
    dbeTiOp2: TwwDBEdit;
    procedure dbdpFFinChange(Sender: TObject);
    procedure dbdpFIniChange(Sender: TObject);
    procedure dblcBancoChange(Sender: TObject);
//** 27/03/2001 - pjsv
//   procedure dblcExist(Sender: TObject);
//**
    procedure dblcNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure Z2bbtnPrintClick(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dbgEgrCajaCheckValue(Sender: TObject;
      PassesPictureTest: Boolean);
    procedure z2bbtnOkConoClick(Sender: TObject);
    procedure dbgEgrCajaCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bbtnCancelClick(Sender: TObject);
    procedure Z2bbtnRegresaClick(Sender: TObject);
    procedure z2bbtnCancelConoClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ppReportPreviewFormCreate(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgExtractoBancoDblClick(Sender: TObject);
    procedure dbgEgrCajaDblClick(Sender: TObject);
    procedure Z2bbtnProcesarClick(Sender: TObject);
    procedure z2bbtnCanceladoClick(Sender: TObject);
    procedure dblcCIAExit(Sender: TObject);
    procedure dblcCtaCteExit(Sender: TObject);
    procedure bbtnTransferirClick(Sender: TObject);
    procedure dbgExtractoBancoIButtonClick(Sender: TObject);
    procedure bbtnOkMovClick(Sender: TObject);
    procedure bbtnCancelMovClick(Sender: TObject);
    procedure dblcTipoOpExit(Sender: TObject);
    procedure bbtnConcilSOLClick(Sender: TObject);
    procedure dbeImporteExit(Sender: TObject);
    procedure dbeNIMPExit(Sender: TObject);
    procedure dbeIMPExit(Sender: TObject);
    procedure dbdtpFecOperExit(Sender: TObject);
    procedure dbeNChequeExit(Sender: TObject);
    procedure dbeNoChqExit(Sender: TObject);
    procedure dbgExtractoBancoCheckValue(Sender: TObject;
      PassesPictureTest: Boolean);
    procedure dbgExtractoBancoTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    sCIA, sBCO, sCTAB,
    sFiltro, sPFiltro , sSQL : String;
    dFEI , dFEF              : TDateTime;
    fSaldoAnt                : Double;
    xInsert,xbConcAuto       : boolean;


    procedure dcCIA;
    procedure dcBCO;
    procedure dcCTAB;
    procedure pFooter;
    function SaldoAnt: Double;
    procedure GrabaCabecera;
    procedure CambiaEstado(xxEstado : string);
    procedure Graba;
    procedure RelacionaMov;
    procedure FiltraConciliacion(xxEstado : string);
    procedure InicializaDatos;
    procedure ValidaCabecera;
    procedure AsignaVariables;
    procedure GeneraReporte(xxEstado : string);
    procedure InicializaInsercion;                    
  public
    { Public declarations }
  end;

var
  FConBank: TFConBank;

implementation

uses CajaDM;

{$R *.DFM}



function OperClientDataSet( ClientDataSet : TwwClientDataSet;
                            Expression, Condicion : String  ) : Double;
var
  cdsClone    : TwwClientDataSet;
  bmk         : TBookmark;
  Agg         : TAggregate;
begin
  result := 0;
  
  if trim(Expression)= '' then Exit;

  bmk:=ClientDataSet.GetBookmark;
  cdsClone    := TwwClientDataSet.Create(nil);
  try

    with cdsClone do
    begin
      CloneCursor(ClientDataSet,True);

      Agg := Aggregates.Add;
      Agg.AggregateName := 'OPER';
      Agg.Expression := Expression;
      Agg.Active := True;

      if Trim(Condicion)<>'' then
      begin
        Filtered     := False;
        Filter       := Condicion;
        Filtered     := True;
      end;
      
      if Aggregates.Items[Aggregates.IndexOf('OPER')].Value<>NULL then
         result := Aggregates.Items[Aggregates.IndexOf('OPER')].Value;

      Aggregates.Clear;

    end;

    ClientDataSet.GotoBookmark(bmk);
    ClientDataSet.FreeBookmark(bmk);

  finally
    cdsClone.Free;
  end;
end;



procedure TFConBank.dcBCO;
begin
  DMTE.cdsBanco.First;
  sBCO := trim(DMTE.cdsBanco.FieldByName('BANCOID').AsString);
  dblcBanco.Text := sBCO;
  dblcBanco.Enabled := DMTE.cdsBanco.RecordCount > 1;
end;

procedure TFConBank.dcCIA;
begin
  DMTE.cdsCIA.First;
  sCIA := trim(DMTE.cdsCIA.FieldByName('CIAID').AsString);
  dblcCIA.Text := sCIA;
  dblcCIA.Enabled := DMTE.cdsCIA.RecordCount > 1;
end;

procedure TFConBank.dcCTAB;
begin
  DMTE.cdsCCBco.First;
  sCTAB := trim(DMTE.cdsCCBco.FieldByName('CCBCOID').AsString);
  dblcCtaCte.Text := sCTAB;
//** 27/03/2001 - pjsv
//  dblcCtaCte.Enabled := DMTE.cdsCCBco.RecordCount > 1;
//**
end;


procedure TFConBank.dbdpFFinChange(Sender: TObject);
begin
 if dbdpFIni.Date = 0 then
 begin
   Application.MessageBox('Debe ingresar la fecha de inicio','Error',MB_OK+MB_ICONERROR);
   Exit;
 end;
 if dbdpFIni.Date > dbdpFFin.Date then
 begin
   Application.MessageBox('La fecha de inicio debe ser menor la fecha final','Error',MB_OK+MB_ICONERROR);
   Exit;
 end;
 dFEF := dbdpFFin.Date;
end;

procedure TFConBank.dbdpFIniChange(Sender: TObject);
begin
 dFEI := dbdpFIni.Date;
end;

procedure TFConBank.dblcBancoChange(Sender: TObject);
begin
// sBCO := dblcBanco.Text;
// dbeBanco.Text := DMTE.cdsBanco.FieldByName('BANCONOM').AsString;
{ if sBCO = '' then
 begin
 //** 27/03/2001 - pjsv
 //   DMTE.cdsCCBco.Filtered := False;
 //**
   dblcCtaCte.Enabled    := False;
   dbeBanco.Text := '';
   dblcCtaCte.Text := '';
   dbeCtaCte.Text := '';
   Exit;
 end;}
 //** 27/03/2001 - pjsv
 //DMTE.cdsCCBco.Filtered := False;
 //DMTE.cdsCCBco.Filter   := 'BANCOID='''+sBCO+'''';
 //DMTE.cdsCCBco.Filtered := True;
 //**
 //dcCTAB;
end;

procedure TFConBank.dblcNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;
  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFConBank.z2bbtnOKCabClick(Sender: TObject);
var
  fsBCO, fsCIA, fsCTAB, fSQL : String;
begin
   if DMTE.wModo='A' then
      ValidaCabecera;
   if DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString='C' then Exit;

   GrabaCabecera;

   FiltraConciliacion(DMTE.cdsEgrCaja.fieldbyname('GCONESTADO').AsString);

   dbgExtractoBanco.DataSource := DMTE.dsQry3;

   if DMTE.cdsQRY2.RecordCount>0 then
   begin
     // obtener el saldo anterior a las fechas seleccionadas
     fSaldoAnt  := SaldoAnt;
     pFooter;

     dbgEgrCaja.SetFocus;
     pnlHead.Enabled      := False;
     Z2bbtnPrint.Enabled  := False;
   end;

   RelacionaMov;

   DMTE.cdsQry2.IndexFieldNames :='';
//   DMTE.cdsQry2.IndexFieldNames :='FLAGVAR;CIAID;BANCOID;CCBCOID;ECFCOMP;FPAGOID;ECNOCHQ;ECCONSOLID';
   DMTE.cdsQry2.IndexFieldNames :='ECFCOMP;ECNOCHQ;ECMTOORI';

   DMTE.cdsQry3.IndexFieldNames :='';
//   DMTE.cdsQry3.IndexFieldNames :='FLAGVAR;CIAID;BANCOID;CCBCOID;ECFCOMP;FPAGOID;ECNOCHQ;ECCONSOLID';
   DMTE.cdsQry3.IndexFieldNames :='ECFCOMP;ECNOCHQ;ECMTOORI';
   Z2bbtnOk.Enabled := False;
end;

procedure TFConBank.Z2bbtnPrintClick(Sender: TObject);
begin
  if DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString='X' then
  begin
   Application.MessageBox('Debe guardar los datos actualizados ántes de imprimir...','Error',MB_OK+MB_ICONERROR);
   Exit;
  end;
  pnlPrint.Visible := True;
  pnlPrint.BringToFront;
  pnlPrint.Top := 245;
end;

procedure TFConBank.Z2bbtnGrabaClick(Sender: TObject);
var
  UpSQL : String;
begin
    if (DMTE.cdsQRY2.RecordCount=0) and (DMTE.cdsQRY3.RecordCount=0) then
       raise exception.Create('No Existe Detalle a Grabar');

    if DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString='C' then Exit;

    Graba;

    DMTE.cdsQRY2.IndexFieldNames:='';
    DMTE.cdsQRY3.IndexFieldNames:='';

    DMTE.cdsQRY3.DisableControls;
    DMTE.cdsQRY3.First;
    // aqui comienza lo bueno es grabar los datos seleccionados.
    //  sFiltro
    with DMTE, DMTE.cdsQRY3 do
    begin
      while not Eof do
      begin

         if DMTE.cdsQry3.FieldByName('FLAGINSERT').AsString <> 'S' then
         begin

            UpSQL := ' UPDATE CAJA313 SET ';
            if (FieldByName('ECCONSOLID').AsString = 'S') then
                 UpSQL :=UpSQL +'  ECMTCON='+FieldByName('ECMTCON').AsString+','+
                                '  ECMTDIF='+FieldByName('ECMTDIF').AsString+',';

            UpSQL :=UpSQL +'  TDIARID='+Quotedstr(FieldByName('TDIARID').AsString)+','+
                      '  ECANOMM='+Quotedstr(FieldByName('ECANOMM').AsString)+','+
                      '  ECNOCOMP='+Quotedstr(FieldByName('ECNOCOMP').AsString)+','+
                      '  GCONCID='+Quotedstr(dbeNreg.text)+',';

            if Length(DMTE.cdsQry3.FieldByName('FLAGTRANSF').AsString)>0 then
                UpSQL :=UpSQL +'  FLAGTRANSF='+Quotedstr(FieldByName('FLAGTRANSF').AsString)+',';

            UpSQL :=UpSQL +'  FLAGVAR='+Quotedstr(FieldByName('FLAGVAR').AsString)+','+
                      '  ECCONSOLID='''+FieldByName('ECCONSOLID').AsString+''''+
                      ' WHERE         '+
                      '     CIAID    ='''+FieldByName('CIAID').AsString+''''+
                      ' AND BANCOID  ='''+FieldByName('BANCOID').AsString+''''+
                      ' AND CCBCOID  ='''+FieldByName('CCBCOID').AsString+'''';
            if DMTE.cdsQry3.FieldByName('ECFCOMP').AsDateTime>0 then
               UpSQL :=UpSQL+' AND ECFCOMP='+quotedstr( Formatdatetime(DMTE.wFormatFecha,FieldByName('ECFCOMP').AsDatetime ));

            if Length(DMTE.cdsQry3.FieldByName('ECNOCHQ').AsString)>0 then
               UpSQL :=UpSQL+' AND ECNOCHQ ='+Quotedstr(FieldByName('ECNOCHQ').AsString);

            if DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat>0 then
               UpSQL :=UpSQL+' AND ECMTOORI ='+FieldByName('ECMTOORI').AsString;


         end
         else
           if DMTE.cdsQry3.FieldByName('FLAGINSERT').AsString = 'S' then
           begin
              DMTE.cdsQRY3.Edit;
              DMTE.cdsQry3.FieldByName('FLAGINSERT').AsString := 'N';
              DMTE.cdsQRY3.Post;

              UpSQL := ' INSERT INTO  CAJA313 (CIAID,BANCOID,CCBCOID,GCONCID,TDIARID,ECANOMM,ECNOCOMP, '+
                       ' FPAGOID,ECFCOMP,ECNOCHQ, EC_IE,ECMTOORI,ECMTCON,ECMTDIF,FLAGVAR,ECCONSOLID,   '+
                       ' FLAGINSERT ) VALUES ('+
                       Quotedstr(DMTE.cdsQry3.FieldByName('CIAID').AsString)+','+Quotedstr(DMTE.cdsQry3.FieldByName('BANCOID').AsString)+','+
                       Quotedstr(DMTE.cdsQry3.FieldByName('CCBCOID').AsString)+','+Quotedstr(DMTE.cdsQry3.FieldByName('GCONCID').AsString)+','+
                       Quotedstr(DMTE.cdsQry3.FieldByName('TDIARID').AsString)+','+Quotedstr(DMTE.cdsQry3.FieldByName('ECANOMM').AsString)+','+
                       Quotedstr(DMTE.cdsQry3.FieldByName('ECNOCOMP').AsString)+','+Quotedstr(DMTE.cdsQry3.FieldByName('FPAGOID').AsString)+','+
                       Quotedstr(Formatdatetime(DMTE.wFormatFecha,DMTE.cdsQry3.FieldByName('ECFCOMP').AsDatetime ))+','+
                       Quotedstr(DMTE.cdsQry3.FieldByName('ECNOCHQ').AsString)+','+Quotedstr(DMTE.cdsQry3.FieldByName('EC_IE').AsString)+','+
                       ''+Floattostr(DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat)+''+','+''+Floattostr(DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat)+''+
                       ','+''+Floattostr(DMTE.cdsQry3.FieldByName('ECMTDIF').AsFloat)+''+','+
                       Quotedstr(DMTE.cdsQry3.FieldByName('FLAGVAR').AsString)+','+Quotedstr(DMTE.cdsQry3.FieldByName('ECCONSOLID').AsString)+','+
                       Quotedstr(DMTE.cdsQry3.FieldByName('FLAGINSERT').AsString)+')';
           end;
         try
           DCOM1.AppServer.EjecutaSQL(UpSQL);
         except
         end;

         Next;
      end;

    end;

    DMTE.cdsQRY2.DisableControls;
    DMTE.cdsQRY2.First;
    with DMTE, DMTE.cdsQRY2 do
    begin
       while not Eof do
       begin
          UpSQL := ' UPDATE CAJA302 SET ';

          if (FieldByName('ECCONSOLID').AsString = 'S') then
             UpSQL :=UpSQL+'  ECMTCON='+FieldByName('ECMTCON').AsString+','+
                           '  ECMTDIF='+FieldByName('ECMTDIF').AsString+',';

          UpSQL :=UpSQL+' FLAGVAR='''+FieldByName('FLAGVAR').AsString+''''+','+
                        ' GCONCID='+Quotedstr(dbeNreg.text)+','+
                        ' ECCONSOLID='''+FieldByName('ECCONSOLID').AsString+''''+
                        ' WHERE '+
                        ' CIAID ='''+FieldByName('CIAID').AsString+''''+
                        ' AND TDIARID  ='''+FieldByName('TDIARID').AsString+''''+
                        ' AND ECANOMM  ='''+FieldByName('ECANOMM').AsString+''''+
                        ' AND ECNOCOMP ='''+FieldByName('ECNOCOMP').AsString+'''';
          try
            DCOM1.AppServer.EjecutaSQL(UpSQL);
          except
          end;

          Next;
       end;
    end;
//    DMTE.cdsQry2.IndexFieldNames :='FLAGVAR;CIAID;BANCOID;CCBCOID;ECFCOMP;ECNOCHQ;ECCONSOLID';
    DMTE.cdsQry2.IndexFieldNames :='ECFCOMP;ECNOCHQ;ECMTOORI';
//    DMTE.cdsQry3.IndexFieldNames :='FLAGVAR;CIAID;BANCOID;CCBCOID;ECFCOMP;ECNOCHQ;ECCONSOLID';
    DMTE.cdsQry3.IndexFieldNames :='ECFCOMP;ECNOCHQ;ECMTOORI';

    DMTE.cdsQRY2.EnableControls;
    DMTE.cdsQRY3.EnableControls;

    Z2bbtnGraba.Enabled := False;
    z2bbtnCancelado.Enabled := True;
    Z2bbtnOk.Enabled    := True;
end;

procedure TFConBank.FormCreate(Sender: TObject);
var
 xsql : string;
begin
  //** 27/03/2001 - pjsv
  // activar cabecera
//  xsql := 'SELECT * FROM TGE105 WHERE (BCOTIPCTA=''B'') ORDER BY BANCOID';

  dblcCtaCte.Selected.Clear;
  dblcCtaCte.Selected.Add('CCBCOID'#9'25'#9'Cuenta Corriente del Banco'#9'F');
  dblcCtaCte.Selected.Add('CCBCODES'#9'30'#9'Descripción'#9'F');
  dblcCtaCte.Selected.Add('TMONID'#9'03'#9'Moneda'#9'F');

end;

procedure TFConBank.BitBtn2Click(Sender: TObject);
begin
 Close;
end;

procedure TFConBank.dbgEgrCajaCheckValue(Sender: TObject;
  PassesPictureTest: Boolean);
begin
 with Sender as TwwInplaceEdit do
 begin
		if not PassesPictureTest then color:= clYellow
		else color:= clWhite
	end
end;

procedure TFConBank.z2bbtnOkConoClick(Sender: TObject);
begin
 with DMTE.cdsQry3 do
 begin
  pnlFoot.Enabled   := True;
  pnlActImp.Visible := False;
  dbgEgrCaja.Enabled   := True;

  Edit;

  FieldByName('FPAGOID').AsString := dblcTipoOp2.text;
  FieldByName('ECNOCHQ').AsString := dbeNCheque.text;
  FieldByName('ECMTOORI').AsFloat := StrToFloat(dbeIMP.Text);
  FieldByName('ECMTCON').AsFloat  := StrToFloat(dbeIMP.Text);
  FieldByName('ECMTDIF').AsFloat  := 0;
  if chkMarca.Checked then
     FieldByName('FLAGVAR').AsString := 'S'
  else
     FieldByName('FLAGVAR').AsString := 'X';
  FieldByName('ECCONSOLID').AsString := 'X';

  Z2bbtnGraba.Enabled := True;

  post;

  pFooter;
 end;
end;

procedure TFConBank.dbgEgrCajaCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
	if (DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString <> '') then
	if (DMTE.cdsQry2.FieldByName('ECCONSOLID').AsString = 'S') then
   begin
     if Highlight then
     begin
       AFont.Color := clInfoText;
       ABrush.Color := clHighlight
     end
     else begin
        AFont.Color := clInfoText;
        ABrush.Color := clInfoBk;
     end;
 	end;
end;

procedure TFConBank.bbtnCancelClick(Sender: TObject);
begin
   if (DMTE.cdsQry2.ChangeCount>0) or (DMTE.cdsQry2.Modified) then
   begin
      DMTE.cdsQry2.CancelUpdates;
      pFooter;
   end;
end;


function TFConBank.SaldoAnt: Double;
var
  fcSaldo  : TDateTime;
  sfcSaldo : String;
begin
 result := 0;
 fcSaldo := dbdpFIni.Date - 1;  // un dia a la fecha
 sfcSaldo := FormatDateTime('dd/mm/yyyy',fcSaldo);
 if DMTE.cdsSaldoTlfnGrab.Locate('BANCOID;CCBCOID;STFECHA',
    VarArrayOf([sCIA,sCTAB,sfcSaldo]),[]) then
 result := DMTE.cdsSaldoTlfnGrab.FieldByName('STSALDOFIN').AsFloat;
end;


procedure TFConBank.pFooter;
var
  fTotalAcu, fTotalPen, fSalAct, fTotalCon : Double;

begin
  dbeSALANT.Text := FormatFloat('########0.0',fSaldoAnt);

  fTotalAcu := OperClientDataSet(DMTE.cdsQry2,'SUM(ECMTOORI)','ECCONSOLID=''S''');
  fTotalPen := OperClientDataSet(DMTE.cdsQry2,'SUM(ECMTOORI)',' (ECCONSOLID<>''S'') OR (ECCONSOLID='' '' )');
  fSalAct   := OperClientDataSet(DMTE.cdsQry2,'SUM(ECMTOORI)','') + fSaldoAnt;

  fTotalCon := OperClientDataSet(DMTE.cdsQry2,'SUM(ECMTDIF)','ECCONSOLID=''S''');

  dbeSALACT.Text := FormatFloat('########0.0',fSalAct);
  dbeTOTCON.Text := FormatFloat('########0.0',fSaldoAnt+fTotalAcu);
  dbeTOTACU.Text := FormatFloat('########0.0',fTotalAcu);
  dbeTOTPEN.Text := FormatFloat('########0.0',fTotalPen);
  dbrDIF.Text    := FormatFloat('########0.0',fSalAct-(fSaldoAnt+fTotalAcu));
  dbeTOTDCON.Text:= FormatFloat('########0.0',fTotalCon);
end;

procedure TFConBank.Z2bbtnRegresaClick(Sender: TObject);
begin
  if DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString='C' then Exit; 

  Z2bbtnOk.Enabled := True;
  pnlHead.Enabled   := True;
  Z2bbtnPrint.Enabled   := True;
  Z2bbtnPrint.SetFocus;
end;

procedure TFConBank.z2bbtnCancelConoClick(Sender: TObject);
begin
//  DMTE.cdsQry3.CancelUpdates;
  pnlActImp.Visible :=False;
  pnlFoot.Enabled   := True;
  dbgEgrCaja.Enabled   := True;

end;

procedure TFConBank.BitBtn4Click(Sender: TObject);
begin
  DMTE.cdsQry2.Filtered := False;
  pnlPrint.Visible := False;
end;

procedure TFConBank.BitBtn3Click(Sender: TObject);
var
  sFlt : String;
begin

//  GeneraReporte(DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString);
//  DMTE.cdsQry2.IndexFieldNames :='ECCONSOLID;CIAID;BANCOID;CCBCOID;ECFCOMP;ECNOCHQ;FLAGVAR;';
  ppDBPipeline.DataSource := DMTE.dsQry2;
  DMTE.cdsQry2.Filtered := False;

  if rb1.Checked then
    sFlt := 'ECCONSOLID=''S''';

  if rb2.Checked then
    sFlt := '(ECMTOORI<>ECMTCON) AND (TRIM(ECCONSOLID)=''S'')';

  if not rb3.Checked then
  begin
     DMTE.cdsQry2.Filtered := False;
     DMTE.cdsQry2.Filter   := sFlt;
     DMTE.cdsQry2.Filtered := True;
  end
  else
     DMTE.cdsQry2.Filtered := False;

  pnlPrint.Visible   := False;
  dbgEgrCaja.Enabled := False;
  pnlHead.Enabled    := False;
  pnlFoot.Enabled    := False;

  ppReport.Print;

  DMTE.cdsQry2.Filtered := False;
  DMTE.cdsQry2.Filter := '';

  dbgEgrCaja.Refresh;

  pnlPrint.Visible   := False;
  dbgEgrCaja.Enabled := True;
  pnlHead.Enabled    := True;
  pnlFoot.Enabled    := True;
end;

procedure TFConBank.ppReportPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;
end;

procedure TFConBank.dblcBancoExit(Sender: TObject);
 var
  xsql : string;
begin
  sBCO := dblcBanco.Text;
  if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then begin
  xsql := 'SELECT TGE106.*, TGE103.TMONDES, TGE103.TMONABR'+
          ' FROM TGE106 Inner Join TGE103 on TGE106.TMONID=TGE103.TMONID'+
          ' WHERE BANCOID='+quotedstr(sBCO)+
          ' AND CIAID='+Quotedstr(dblcCIA.text)+
          ' ORDER BY BANCOID';
  end;
	if DMTE.SRV_D = 'ORACLE' then begin
  xsql := 'SELECT TGE106.*, TGE103.TMONDES, TGE103.TMONABR'+
          ' FROM TGE106, TGE103 '+
          ' WHERE BANCOID='+quotedstr(sBCO)  +
          ' AND CIAID='+Quotedstr(dblcCIA.text)+          
          '  and TGE106.TMONID=TGE103.TMONID'+
          ' ORDER BY BANCOID';
  end;
  DMTE.cdsCCBCO.Close;
  DMTE.cdsCCBCO.DataRequest(xSql);
  DMTE.cdsCCBCO.Open;
  dbeBanco.text:=DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr,'BANCOID',dblcBanco.Text,'BANCOABR') ;

end;

procedure TFConBank.GrabaCabecera;
var
  xAnoMM,xWhere,xSQL,xMes : string;
  Y,M,D : word;
begin
   DecodeDate(dbdtpFecOper.Date,Y,M,D);
   if (DMTE.wModo='A') and (xInsert= False) then
   begin
      xWhere :=  ' CIAID='''   +dblcCia.Text    +''' and '
               + ' BANCOID=''' +dblcBanco.Text  +''' and '
               + ' CCBCOID='''+dblcCtaCte.Text  +''' ';
      dbeNreg.text:=DMTE.UltimoNum('prvCaja','CAJA316','GCONCID',xWhere);
      dbeNreg.text:=DMTE.StrZero(dbeNreg.text,DMTE.cdsEgrCaja.FieldByName('GCONCID').Size);
   end;

   DMTE.cdsEgrCaja.CancelUpdates;
   if (DMTE.wModo='A') and (xInsert= False) then
   begin
      DMTE.cdsEgrCaja.Insert;
      xInsert := True;
   end
   else
      DMTE.cdsEgrCaja.Edit;

   xMes:= DMTE.StrZero(floattostr(M),2);
   if DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString='' then
      DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString :='X';
   DMTE.cdsEgrCaja.FieldByName('CIAID').AsString      :=dblcCia.Text;
   DMTE.cdsEgrCaja.FieldByName('GCONANOMM').AsString  :=Floattostr(Y)+xMes;
   DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString    := dblcBanco.Text;
   DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString    := dblcCtaCte.Text;
   DMTE.cdsEgrCaja.FieldByName('GCONCID').AsString    := dbeNreg.text;
   DMTE.cdsEgrCaja.FieldByName('GCONFDESDE').AsDateTime := dbdpFIni.Date;
   DMTE.cdsEgrCaja.FieldByName('GCONFHASTA').AsDateTime := dbdpFFin.Date;
   DMTE.cdsEgrCaja.FieldByName('GCONFEMOV').AsDateTime  := dbdtpFecOper.Date;
   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
       DMTE.cdsEgrCaja.FieldByName('GCONHREG').AsDateTime   := Time
   else
      if (DMTE.SRV_D = 'ORACLE') then
          DMTE.cdsEgrCaja.FieldByName('GCONHREG').AsDateTime   := DateS+Time;




   xSQL:='Select * from CAJA316 '
            +'Where CIAID='''   +dblcCia.Text    +''' and '
            +      'BANCOID=''' +dblcBanco.Text+''' and '
            +      'CCBCOID='''+dblcCtaCte.Text  +''' ';
   DMTE.cdsEgrCaja.DataRequest( xSQL );
   DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');
   CambiaEstado(DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString);


end;
procedure TFConBank.CambiaEstado(xxEstado : string);
begin
   if xxEstado='X' then
   begin
{     gbCia.Enabled   := True;
     gbRango.Enabled := True;
     gbBco.Enabled   := True;}
     gbCia.Enabled   := False;
     gbRango.Enabled := False;
     gbBco.Enabled   := False;

     pnlHead.Enabled := True;
     dbgEgrCaja.Enabled := True;
     dbgExtractoBanco.Enabled := True;
     Z2bbtnGraba.Enabled := True;
     z2bbtnCancelado.Enabled := False;
     Z2bbtnPrint.Enabled     := False;
     bbtnTransferir.Enabled  := True;
     Z2bbtnOk.Enabled        := True;
     Z2bbtnProcesar.Enabled  := True;
     bbtnConcilSOL.Enabled   := True;
     Z2bbtnRegresa.Enabled   := True

   end;

   if xxEstado='I' then
   begin
     gbCia.Enabled   := False;
     gbRango.Enabled := False;
     gbBco.Enabled   := False;
     pnlHead.Enabled := True;
     bbtnTransferir.Enabled := True;
     dbgEgrCaja.Enabled := True;
     dbgExtractoBanco.Enabled := True;
     Z2bbtnOk.Enabled    := True;
     Z2bbtnGraba.Enabled := True;
     z2bbtnCancelado.Enabled := False;
     Z2bbtnPrint.Enabled     :=True;
     Z2bbtnProcesar.Enabled  := True;
     bbtnConcilSOL.Enabled   := True;
     
   end;

   if xxEstado='C' then
   begin
     gbCia.Enabled   := False;
     gbRango.Enabled := False;
     gbBco.Enabled   := False;
     pnlHead.Enabled := False;
     pnlFoot.Enabled := False;
     dbgEgrCaja.Enabled := True;
     dbgExtractoBanco.Enabled := True;
     bbtnTransferir.Enabled := False;
     Z2bbtnOk.Enabled       := False;
     Z2bbtnGraba.Enabled    := False;
     z2bbtnCancelado.Enabled := False;
     Z2bbtnPrint.Enabled     := True;
     Z2bbtnRegresa.Enabled   := False;
     Z2bbtnProcesar.Enabled  := False;
     bbtnConcilSOL.Enabled   := False;
   end


end;

procedure TFConBank.FormClose(Sender: TObject; var Action: TCloseAction);
var
   xSQL : string;
begin
  xInsert := False;
  if DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString='X' then
  begin
    DMTE.cdsEgrCaja.Delete;
    xSQL:='Select * from CAJA316 '
    			+'Where CIAID='''   +dblcCia.Text    +''' and '
    			+      'BANCOID=''' +dblcBanco.Text +''' and '
    			+      'CCBCOID=''' +dblcCtaCte.Text+''' and '
    			+      'GCONCID='''+dbeNreg.Text  +''' ';
    DMTE.cdsEgrCaja.DataRequest( xSQL );
    DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');
  end;
  DMTE.cdsEgrCaja.IndexFieldNames:='';
  DMTE.cdsBanco.Filter   := '';
  DMTE.cdsBanco.Filtered := False;

//  DMTE.cdsBanco.Close;
  DMTE.cdsCCBCO.Close;
  DMTE.cdsQRY2.Close;
  DMTE.cdsQry3.Close;
  DMTE.cdsQry4.Close;

   FVariables.w_Num_Formas:=FVariables.w_Num_Formas-1;
   Action:=caFree;

end;
procedure TFConBank.Graba;
var
  xAnoMM,xWhere,xSQL,xMes,xNReg : string;
  Y,M,D : word;
begin
   DMTE.cdsEgrCaja.Edit;

   xMes:= DMTE.StrZero(floattostr(M),2);
   DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString := 'I';
   DMTE.cdsEgrCaja.FieldByName('CIAID').AsString      := dblcCia.Text;
   DMTE.cdsEgrCaja.FieldByName('GCONANOMM').AsString  := Floattostr(Y)+xMes;
   DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString    := dblcBanco.Text;
   DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString    := dblcCtaCte.Text;
   DMTE.cdsEgrCaja.FieldByName('GCONCID').AsString    := dbeNreg.text;
   DMTE.cdsEgrCaja.FieldByName('GCONFDESDE').AsDateTime := dbdpFIni.Date;
   DMTE.cdsEgrCaja.FieldByName('GCONFHASTA').AsDateTime := dbdpFFin.Date;
   DMTE.cdsEgrCaja.FieldByName('GCONFEMOV').AsDateTime  := dbdtpFecOper.Date;

   DMTE.cdsEgrCaja.FieldByName('GCONFREG').Value   := DateS;
   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
       DMTE.cdsEgrCaja.FieldByName('GCONHREG').Value   := Time
   else
       if (DMTE.SRV_D = 'ORACLE')  then
           DMTE.cdsEgrCaja.FieldByName('GCONHREG').Value   := DateS+Time;

   DMTE.cdsEgrCaja.FieldByName('GCONUSER').Value   := DMTE.wUsuario;

   xSQL:='Select * from CAJA316 '
            +'Where CIAID='''   +dblcCia.Text   +''' and '
            +      'BANCOID=''' +dblcBanco.Text +''' and '
            +      'CCBCOID='''+dblcCtaCte.Text +''' and '
            +      'GCONCID='''+dbeNreg.Text +''' ';
   DMTE.cdsEgrCaja.DataRequest( xSQL );
   DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');
   CambiaEstado('I');
end;

procedure TFConBank.RelacionaMov;
var
  xNCompSOL,xNCompBCO : double;
begin
   // qry2 SOL
   // qry3 BANCOS
   DMTE.cdsQry2.DisableControls;
   DMTE.cdsQry2.First;
   DMTE.cdsQry3.DisableControls;

   DMTE.cdsQry3.First;
   DMTE.cdsQry3.IndexFieldNames :='';
   DMTE.cdsQry3.IndexFieldNames :='ECFCOMP;ECNOCHQ;ECMTOORI';

   while not DMTE.cdsQry2.Eof do
   begin
      if DMTE.cdsQry2.FieldByName('ECCONSOLID').AsString<>'S' then
      begin
         DMTE.cdsQry3.SetKey;
         DMTE.cdsQry3.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsQry2.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsQry3.FieldByName('ECNOCHQ').AsString   := DMTE.cdsQry2.FieldByName('ECNOCHQ').AsString;
         DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat   := DMTE.cdsQry2.FieldByName('ECMTOORI').AsFloat;
         DMTE.cdsQry2.Edit;
         if DMTE.cdsQry3.GotoKey then
         begin
            DMTE.cdsQry3.Edit;
            DMTE.cdsQry3.FieldByName('TDIARID').AsString  := DMTE.cdsQry2.FieldByName('TDIARID').AsString;
            DMTE.cdsQry3.FieldByName('ECANOMM').AsString  := DMTE.cdsQry2.FieldByName('ECANOMM').AsString;
            DMTE.cdsQry3.FieldByName('ECNOCOMP').AsString := DMTE.cdsQry2.FieldByName('ECNOCOMP').AsString;
            DMTE.cdsQry3.FieldByName('EC_IE').AsString    := DMTE.cdsQry2.FieldByName('EC_IE').AsString;
            DMTE.cdsQry3.FieldByName('FLAGVAR').AsString  := 'S';
            DMTE.cdsQry3.FieldByName('GCONCID').AsString  := dbeNreg.text;

            DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat   := DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat;
            DMTE.cdsQry3.FieldByName('ECMTDIF').AsFloat   := DMTE.FRound(DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat-DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat,15,2);
            DMTE.cdsQry3.FieldByName('ECCONSOLID').AsString := 'S';
            DMTE.cdsQry3.Post;

            DMTE.cdsQry2.FieldByName('FLAGVAR').AsString  := 'S';
            DMTE.cdsQry2.FieldByName('ECCONSOLID').AsString := 'S';
            DMTE.cdsQry2.FieldByName('ECMTCON').AsFloat  := DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat;
            DMTE.cdsQry2.FieldByName('ECMTDIF').AsFloat  := DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat-DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat;

         end
         else
            DMTE.cdsQry2.FieldByName('FLAGVAR').AsString  := 'X';

         DMTE.cdsQry2.FieldByName('GCONCID').AsString := dbeNreg.text;
         DMTE.cdsQry2.Post;
      end
      else
      begin
         if DMTE.cdsQry2.FieldByName('FLAGVAR').AsString <> 'S' then
         begin
            DMTE.cdsQry2.Edit;
            DMTE.cdsQry2.FieldByName('FLAGVAR').AsString := 'X';
            DMTE.cdsQry2.Post;
         end
      end;

      DMTE.cdsQry2.Next;
   end;
   DMTE.cdsQry2.EnableControls;
   DMTE.cdsQry3.EnableControls;

   dbgExtractoBanco.RefreshDisplay;

end;


procedure TFConBank.dbgExtractoBancoDblClick(Sender: TObject);
var
  imp : Double;
  sNCheque : string;
begin
  if DMTE.cdsQry3.recordcount=0 then begin
     ShowMessage('No existen Moviemientos a Editar');
     Exit;
  end;

  if DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString='C' then Exit;

  if DMTE.cdsQry3.FieldByName('ECCONSOLID').AsString = 'S' then begin
     showmessage('El Movimiento se encuentra Conciliado');
     Exit;
  end;

//  dbgExtractoBanco.SetActiveField(1);
  // vhn ult
  if dbgExtractoBanco.Columns[ dbgExtractoBanco.GetActiveCol-1 ].FieldName='FLAGVAR' then begin

     DMTE.cdsQry3.Edit;
     if DMTE.cdsQry3.FieldByName('FLAGVAR').AsString='S' then
        DMTE.cdsQry3.FieldByName('FLAGVAR').AsString:='N'
     else
        DMTE.cdsQry3.FieldByName('FLAGVAR').AsString:='S';
     DMTE.cdsQry3.Post;
     Exit;
  end;

  if DMTE.cdsQry3.FieldByName('FLAGVAR').AsString = 'S' then
     chkMarca.Checked:= True
  else
     chkMarca.Checked:= False;


  pnlFoot.Enabled    := False;
  pnlHead.Enabled    := False;
  pnlActImp.Top      := 212;
  pnlActImp.Visible  := True;
  pnlActImp.BringToFront;
  dbgEgrCaja.Enabled := False;
  Z2bbtnPrint.Enabled:= False;

  sNCheque := DMTE.cdsQry3.FieldByName('ECNOCHQ').AsString;
  imp  := DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat;

  dblcTipoOp2.Text := DMTE.cdsQry3.FieldByName('FPAGOID').AsString;
  dbeTiOp2.text:=DMTE.DisplayDescrip('prvTGE','TGE160','EQUIDES','EQUIID='+Quotedstr(dblcTipoOp2.text)
                                    + ' AND BANCOID='+Quotedstr(dblcBanco.Text),'EQUIDES');
  dbeNCheque.text := sNCheque;
  dbeIMP.Text  := FormatFloat('########0.0',imp);

end;

procedure TFConBank.dbgEgrCajaDblClick(Sender: TObject);
begin
  if DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString='C' then Exit;

  if DMTE.cdsQry2.FieldByName('ECCONSOLID').AsString='S' then begin
     showmessage('El Movimiento esta Conciliado');
     Exit;
  end;

  DMTE.cdsQry2.Edit;
  if DMTE.cdsQry2.FieldByName('FLAGVAR').AsString='S' then
     DMTE.cdsQry2.FieldByName('FLAGVAR').AsString:='N'
  else
     DMTE.cdsQry2.FieldByName('FLAGVAR').AsString:='S';

  Z2bbtnGraba.Enabled := True;
  DMTE.cdsQry2.Post;

end;

procedure TFConBank.FiltraConciliacion(xxEstado : string);
var
  xSQL,xTemp : string;
  fsBCO, fsCIA, fsCTAB, fSQL : String;
begin
     if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
     begin
        xSQL:= ' SELECT XX.*,EQUI.EQUIID,EQUI.EQUIDES,EQUI.FPAGODES FROM '
             +   '(SELECT CAJA.CIAID,CAJA.BANCOID,CAJA.CCBCOID, '
             +   'CAJA.EC_IE,CAJA.ECGIRA,CAJA.ECTCAMB,CAJA.GCONCID, CAJA.ECFEMICH,'
             +   'CAJA.ECCONSOLID,CAJA.ECFCOMP,CAJA.ECMTOORI,CAJA.TDIARID,CAJA.ECANOMM, '
             +   'CASE WHEN COALESCE(CAJA.ECNOCHQ,'''')<>'''' THEN CAJA.ECNOCHQ ELSE CAJA.ECNODOC END ECNOCHQ , '
             +   'CAJA.ECNOCOMP,CAJA.FLAGVAR,CAJA.ECMTCON,CAJA.ECMTDIF, '
             +   'CASE WHEN CAJA.ECCONSOLID=''S'' THEN ''CONCILIADOS'' ELSE ''NO CONCILIADOS'' END CONCILIADES ,'
             +   'CASE WHEN COALESCE(CAJA.FPAGOID,'''')<>'''' THEN CAJA.FPAGOID ELSE CAJA.DOCID END FPAGOID , '
             +   'CASE WHEN CAJA.ECCONSOLID=''S'' THEN '
             +       ' CASE WHEN CAJA.EC_IE=''E'' THEN  COALESCE(CAJA.ECMTCON,0) '
             +       ' ELSE 0 '
             +       ' END '
             +   'ELSE  '
             +       ' CASE WHEN CAJA.EC_IE=''E'' THEN  COALESCE(CAJA.ECMTOORI,0) '
             +       ' ELSE 0 '
             +       ' END '
             +   'END EGRESO, '

             +   'CASE WHEN CAJA.ECCONSOLID=''S'' THEN '
             +       ' CASE WHEN CAJA.EC_IE=''I'' THEN  COALESCE(CAJA.ECMTCON,0) '
             +       ' ELSE 0 '
             +       ' END '
             +   'ELSE '
             +       ' CASE WHEN CAJA.EC_IE=''I'' THEN  COALESCE(CAJA.ECMTOORI,0) '
             +       ' ELSE 0 '
             +       ' END '
             +    'END INGRESO, '

             +   'CIA.CIADES, BANK.BANCONOM, CTAE.CCBCODES, '
             +   'MON.TMONDES, MON.TMONABR '

             +'FROM CAJA302 CAJA '
             +  'LEFT JOIN TGE101 CIA  ON (CIA.CIAID=CAJA.CIAID) '
             +  'LEFT JOIN TGE105 BANK ON (BANK.BANCOID=CAJA.BANCOID) '
             +  'LEFT JOIN TGE106 CTAE ON (CTAE.CIAID=CAJA.CIAID AND CTAE.BANCOID=CAJA.BANCOID '
             +                             'AND CTAE.CCBCOID=CAJA.CCBCOID) '
             +  'LEFT JOIN TGE103 MON  ON (MON.TMONID=CAJA.TMONID) '
//             +  'LEFT JOIN TGE160 EQU  ON (CAJA.FPAGOID=EQU.FPAGOID) '
             +'Where ( CAJA.EC_PROCE=''1'' or CAJA.EC_PROCE=''B'' or '
             +       ' CAJA.EC_PROCE=''3'' OR CAJA.EC_PROCE=''4'' or '
             +       ' CAJA.EC_PROCE=''5'' OR CAJA.EC_PROCE=''7'' or '
             +       ' CAJA.EC_PROCE=''8'' OR CAJA.EC_PROCE=''D'') ';

//        xTemp:=' )XX LEFT JOIN TGE160 EQUI ON EQUI.FPAGOID=XX.FPAGOID '
        xTemp:=' )XX LEFT JOIN TGE160 EQUI ON EQUI.FPAGOID=XX.FPAGOID AND EQUI.BANCOID=XX.BANCOID '
     end;

{     if DMTE.SRV_D = 'ORACLE' then
     begin
        xSQL:='SELECT CAJA.*, CIA.CIADES, BANK.BANCONOM, CTAE.CCBCODES, '
             +   'MON.TMONDES, MON.TMONABR, FPA.FPAGODES, EQU.EQUIDES, '
             +   'CASE WHEN CAJA.ECCONSOLID=''S'' THEN ''CONCILIADOS'' ELSE ''NO CONCILIADOS'' END CONCILIADES ,'
             +   'CASE WHEN CAJA.ECCONSOLID=''S'' THEN '
             +       ' CASE WHEN CAJA.EC_IE=''E'' THEN  NVL(CAJA.ECMTCON,0) '
             +       ' ELSE 0 '
             +       ' END '
             +   'ELSE  '
             +       ' CASE WHEN CAJA.EC_IE=''E'' THEN  NVL(CAJA.ECMTOORI,0) '
             +       ' ELSE 0 '
             +       ' END '
             +   'END EGRESO, '

             +   'CASE WHEN CAJA.ECCONSOLID=''S'' THEN '
             +       ' CASE WHEN CAJA.EC_IE=''I'' THEN  NVL(CAJA.ECMTCON,0) '
             +       ' ELSE 0 '
             +       ' END '
             +   'ELSE '
             +       ' CASE WHEN CAJA.EC_IE=''I'' THEN  NVL(CAJA.ECMTOORI,0) '
             +       ' ELSE 0 '
             +       ' END '
             +    'END INGRESO, '

             +   'CIA.CIADES, BANK.BANCONOM, CTAE.CCBCODES, '
             +   'MON.TMONDES, MON.TMONABR '

             +'FROM CAJA302 CAJA, TGE101 CIA, TGE103 MON, TGE105 BANK, TGE106 CTAE, TGE112 FPA, TGE160 EQU '
             +'WHERE ( CAJA.EC_PROCE=''1'' or CAJA.EC_PROCE=''B'' or '
             +       ' CAJA.EC_PROCE=''3'' or CAJA.EC_PROCE=''4'' or '
             +       ' CAJA.EC_PROCE=''5'' or CAJA.EC_PROCE=''7'' or '
             +       ' CAJA.EC_PROCE=''8'' or CAJA.EC_PROCE=''D'') '
             +  'AND ( CIA.CIAID(+)   =CAJA.CIAID   ) and '
             +     ' ( MON.TMONID(+)  =CAJA.TMONID  ) and '
             +     ' ( BANK.BANCOID(+)=CAJA.BANCOID ) and '
             +     ' ( CTAE.CIAID(+)=CAJA.CIAID AND CTAE.BANCOID(+)=CAJA.BANCOID '
             +                             'AND CTAE.CCBCOID(+)=CAJA.CCBCOID ) and '
             +     ' ( FPA.FPAGOID(+) =CAJA.FPAGOID ) and '
             +     ' ( EQU.FPAGOID(+) =CAJA.FPAGOID )';
     end;}
     if (DMTE.SRV_D = 'ORACLE') then
     begin
        xSQL:= ' SELECT XX.*,EQUI.EQUIID,EQUI.EQUIDES,EQUI.FPAGODES FROM '
             +   '(SELECT CAJA.CIAID,CAJA.BANCOID,CAJA.CCBCOID, '
             +   'CAJA.EC_IE,CAJA.ECGIRA,CAJA.ECTCAMB,CAJA.GCONCID, CAJA.ECFEMICH,'
             +   'CAJA.ECCONSOLID,CAJA.ECFCOMP,CAJA.ECMTOORI,CAJA.TDIARID,CAJA.ECANOMM, '
             +   'CASE WHEN NVL(CAJA.ECNOCHQ,''XX'')<>''XX'' THEN CAJA.ECNOCHQ ELSE CAJA.ECNODOC END ECNOCHQ , '
             +   'CAJA.ECNOCOMP,CAJA.FLAGVAR,CAJA.ECMTCON,CAJA.ECMTDIF, '
             +   'CASE WHEN CAJA.ECCONSOLID=''S'' THEN ''CONCILIADOS'' ELSE ''NO CONCILIADOS'' END CONCILIADES ,'
             +   'CASE WHEN NVL(CAJA.FPAGOID,''XX'')<>''XX'' THEN CAJA.FPAGOID ELSE CAJA.DOCID END FPAGOID , '
             +   'CASE WHEN CAJA.ECCONSOLID=''S'' THEN '
             +       ' CASE WHEN CAJA.EC_IE=''E'' THEN  NVL(CAJA.ECMTCON,0) '
             +       ' ELSE 0 '
             +       ' END '
             +   'ELSE  '
             +       ' CASE WHEN CAJA.EC_IE=''E'' THEN  NVL(CAJA.ECMTOORI,0) '
             +       ' ELSE 0 '
             +       ' END '
             +   'END EGRESO, '

             +   'CASE WHEN CAJA.ECCONSOLID=''S'' THEN '
             +       ' CASE WHEN CAJA.EC_IE=''I'' THEN  NVL(CAJA.ECMTCON,0) '
             +       ' ELSE 0 '
             +       ' END '
             +   'ELSE '
             +       ' CASE WHEN CAJA.EC_IE=''I'' THEN  NVL(CAJA.ECMTOORI,0) '
             +       ' ELSE 0 '
             +       ' END '
             +    'END INGRESO, '

             +   'CIA.CIADES, BANK.BANCONOM, CTAE.CCBCODES, '
             +   'MON.TMONDES, MON.TMONABR '

             +'FROM CAJA302 CAJA, TGE101 CIA, TGE105 BANK, TGE106 CTAE, TGE103 MON '
             +'Where ( CAJA.EC_PROCE=''1'' or CAJA.EC_PROCE=''B'' or '
             +       ' CAJA.EC_PROCE=''3'' OR CAJA.EC_PROCE=''4'' or '
             +       ' CAJA.EC_PROCE=''5'' OR CAJA.EC_PROCE=''7'' or '
             +       ' CAJA.EC_PROCE=''8'' OR CAJA.EC_PROCE=''D'') ';

             //+  'And (CAJA.CIAID=CIA.CIAID(+)) '
             //+  'And (CAJA.BANCOID=BANK.BANCOID(+)) '
             //+  'And (CAJA.CIAID=CTAE.CIAID(+) AND CAJA.BANCOID=CTAE.BANCOID(+) '
             //+                             'AND CAJA.CCBCOID=CTAE.CCBCOID(+)) '
             //+  'And (CAJA.TMONID=MON.TMONID(+) ) ';

        xTemp:=' ) XX ,TGE160 EQUI Where XX.FPAGOID=EQUI.FPAGOID(+) AND XX.BANCOID=EQUI.BANCOID(+) '
     end;

     fSQL := xSQL;

     if length(sCIA) >0   then
        fsCIA   := 'CAJA.CIAID='''+sCIA
     else
        fsCIA   := '';

     if length(sBCO) >0   then
        fsBCO   := ''' AND CAJA.BANCOID='''+sBCO
     else
        fsBCO   := '';

     if length(sCTAB) >0   then
        fsCTAB  := ''' AND CAJA.CCBCOID='''+sCTAB
     else
        fsCTAB := '';

     sFiltro := '('+fsCIA+fsBCO+fsCTAB+''')';

     if length(sFiltro)=0 then
        sFiltro:=sFiltro+' (CAJA.ECFCOMP >=' +DMTE.wRepFuncDate + ''''+FormatDateTime(DMTE.wFormatFecha,dFEI)+''') AND CAJA.ECFCOMP <=' +DMTE.wRepFuncDate + ''''+FormatDateTime(DMTE.wFormatFecha,dFEF)+'''))'
     else
        sFiltro:=sFiltro+' AND (CAJA.ECFCOMP >=' +DMTE.wRepFuncDate + ''''+FormatDateTime(DMTE.wFormatFecha,dFEI)+''') AND CAJA.ECFCOMP <=' +DMTE.wRepFuncDate + ''''+FormatDateTime(DMTE.wFormatFecha,dFEF)+'''))';

     if (DMTE.wModo='M')  then
        sFiltro :=' ( '+sFiltro;

     if (DMTE.wModo='A') and (DMTE.cdsEgrCaja.Fieldbyname('GCONESTADO').AsString='X') then
        if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
            sFiltro:= sFiltro+' AND COALESCE(GCONCID,'''')='''' '
        else
          if (DMTE.SRV_D = 'ORACLE') then
              sFiltro:= sFiltro+' AND NVL(GCONCID,''XX'')=''XX'' ';

     if (DMTE.wModo='M') and (DMTE.cdsEgrCaja.Fieldbyname('GCONESTADO').AsString='I') then
        sFiltro:= sFiltro+' OR ( CAJA.CIAID='''+sCIA+''' and CAJA.GCONCID='+Quotedstr(dbeNreg.text)+ ' ) ) ';

     if (DMTE.wModo='M') and (DMTE.cdsEgrCaja.Fieldbyname('GCONESTADO').AsString='C') then
         sFiltro:= sFiltro+' AND CAJA.GCONCID='+Quotedstr(dbeNreg.text)+' ) ';

//     fSQL :=  xSQL + ' AND ' + sFiltro +xTemp +' ORDER BY CAJA.CIAID, CAJA.BANCOID, CAJA.CCBCOID, CAJA.ECFCOMP,CAJA.ECNOCOMP ';

     if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
          sFiltro:= sFiltro
             +  'And (CAJA.CIAID=CIA.CIAID) '
             +  'And (CAJA.BANCOID=BANK.BANCOID) '
             +  'And (CAJA.CIAID=CTAE.CIAID AND CAJA.BANCOID=CTAE.BANCOID '
             +                             'AND CAJA.CCBCOID=CTAE.CCBCOID) '
             +  'And (CAJA.TMONID=MON.TMONID ) '
     else
       if (DMTE.SRV_D = 'ORACLE') then
          sFiltro:= sFiltro
             +  'And (CAJA.CIAID=CIA.CIAID(+)) '
             +  'And (CAJA.BANCOID=BANK.BANCOID(+)) '
             +  'And (CAJA.CIAID=CTAE.CIAID(+) AND CAJA.BANCOID=CTAE.BANCOID(+) '
             +                             'AND CAJA.CCBCOID=CTAE.CCBCOID(+)) '
             +  'And (CAJA.TMONID=MON.TMONID(+) ) ';


     fSQL:= xSQL + ' AND ' + sFiltro +xTemp
          +' ORDER BY XX.CIAID, XX.BANCOID, XX.CCBCOID, XX.ECFCOMP,XX.ECNOCOMP,XX.ECCONSOLID ';


     if (xxEstado='X') then
     begin
        xSQL:= 'SELECT CAJA.* FROM CAJA313 CAJA '+
               ' WHERE '+fsCIA+fsBCO+fsCTAB+''''+
               ' AND (CAJA.ECFCOMP >=' +DMTE.wRepFuncDate + ''''+FormatDateTime(DMTE.wFormatFecha,dFEI)+''') '+
               ' AND CAJA.ECFCOMP <=' +DMTE.wRepFuncDate + ''''+FormatDateTime(DMTE.wFormatFecha,dFEF)+'''))';

        if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
            xSQL := xSQL+' AND COALESCE(GCONCID,'''')='''' '
        else
          if (DMTE.SRV_D = 'ORACLE') then
              xSQL := xSQL+' AND NVL(GCONCID,''XX'')=''XX'' ';

     end;

     if (xxEstado='I') then
     begin
        xSQL:='SELECT CAJA.* FROM CAJA313 CAJA '+
              ' WHERE ('+fsCIA+fsBCO+fsCTAB+''''+' ) and '+
              ' ( '+
              ' ( CAJA.ECFCOMP>='+DMTE.wRepFuncDate+''''+FormatDateTime(DMTE.wFormatFecha,dFEI)+''' ) '+
              ' AND CAJA.ECFCOMP<=' +DMTE.wRepFuncDate + ''''+FormatDateTime(DMTE.wFormatFecha,dFEF)+''' ) ) '+
              ' OR ( CAJA.CIAID='''+sCIA+''' and GCONCID='+Quotedstr(DMTE.cdsEgrCaja.fieldbyname('GCONCID').AsString)+' ) ) ';
     end;

     if (xxEstado='C') then
     begin
        xSQL:='SELECT CAJA.* FROM CAJA313 CAJA '+
              'WHERE ('+fsCIA+fsBCO+fsCTAB+''' '+
                'AND GCONCID='+Quotedstr(DMTE.cdsEgrCaja.fieldbyname('GCONCID').AsString)+' ) ';
     end;

     DMTE.cdsQRY2.Close;
     DMTE.cdsQRY2.DataRequest(fSQL);
     DMTE.cdsQRY2.Open;

     DMTE.cdsQry3.Close;
     DMTE.cdsQry3.DataRequest(xSQL);
     DMTE.cdsQry3.Open;

     if (xxEstado<>'C') then
     begin
        DMTE.cdsQRY3.DisableControls;
        DMTE.cdsQRY3.First;
        while not DMTE.cdsQRY3.Eof do
        begin
           if DMTE.cdsQRY3.FieldByName('FLAGVAR').AsString<>'S' then
           begin
              DMTE.cdsQRY3.Edit;
              DMTE.cdsQRY3.FieldByName('FLAGVAR').AsString:='X';
              DMTE.cdsQRY3.Post;
           end;
           DMTE.cdsQRY3.Next;
        end;
        DMTE.cdsQRY3.EnableControls;
     end;

     dbgExtractoBanco.DataSource := DMTE.dsQry3;
     dbgEgrCaja.DataSource       := DMTE.dsQry2;

     dbgEgrCaja.Selected.Clear;
     dbgEgrCaja.Selected.Add('FLAGVAR'#9'1'#9'(X)'#9'F');
     dbgEgrCaja.Selected.Add('FPAGOID'#9'2'#9'Código~Op.Banco'#9'F');
     dbgEgrCaja.Selected.Add('FPAGODES'#9'12'#9'Operación~Banco'#9'F');
     dbgEgrCaja.Selected.Add('ECNOCHQ'#9'10'#9'Nro.~Cheque/Doc'#9'F');
     dbgEgrCaja.Selected.Add('ECFCOMP'#9'10'#9'Fecha~Comp.'#9'F');
     dbgEgrCaja.Selected.Add('ECMTOORI'#9'11'#9'Monto~Origen'#9'F');
     dbgEgrCaja.Selected.Add('ECCONSOLID'#9'1'#9'Conci_~liado'#9'F');
     dbgEgrCaja.SetControlType('ECCONSOLID', fctCheckBox, 'S;N');
     dbgEgrCaja.SetControlType('FLAGVAR', fctCheckBox, 'S;X');
     dbgEgrCaja.ApplySelected;

     dbgExtractoBanco.Selected.Clear;
     dbgExtractoBanco.Selected.Add('FLAGVAR'#9'1'#9'(X)'#9'F');
     dbgExtractoBanco.Selected.Add('FPAGOID'#9'2'#9'Código~Op.Banco'#9'F');
     dbgExtractoBanco.Selected.Add('ECNOCHQ'#9'10'#9'Nro.~Cheque/Doc'#9'F');
//     dbgExtractoBanco.Selected.Add('ECNOCOMP'#9'12'#9'Nro.~Cheque/Doc'#9'F');
     dbgExtractoBanco.Selected.Add('ECFCOMP'#9'10'#9'Fecha~Comp.'#9'F');
     dbgExtractoBanco.Selected.Add('ECMTOORI'#9'11'#9'Monto~Origen'#9'F');
     dbgExtractoBanco.Selected.Add('ECCONSOLID'#9'1'#9'Conci_~liado'#9'F');
     dbgExtractoBanco.SetControlType('ECCONSOLID', fctCheckBox, 'S;X');
     dbgExtractoBanco.SetControlType('FLAGVAR', fctCheckBox, 'S;X');
     dbgExtractoBanco.ApplySelected;

     dbgExtractoBanco.RefreshDisplay;
     dbgEgrCaja.RefreshDisplay;

end;

procedure TFConBank.InicializaDatos;
begin
   dblcCIA.text   :='';
   dbeCIA.text    :='';
   dblcBanco.Text :='';
   dbeBanco.Text  :='';
   dblcCtaCte.text :='';
   dbeCtaCte.text :='';
   dbeMoneda.text :='';
   dbeNreg.text   :='';
   DMTE.cdsQry2.Close;
   DMTE.cdsQry3.Close;

end;

procedure TFConBank.Z2bbtnProcesarClick(Sender: TObject);
var
   xContMSOL,xContMBco : double;
begin
   if DMTE.cdsQry2.RecordCount=0 then Exit;
   if DMTE.cdsQry3.RecordCount=0 then Exit;

   xContMSOL :=0;
   xContMBco :=0;
   //   ValidaMarca;
   DMTE.cdsQry2.DisableControls;
   DMTE.cdsQry3.DisableControls;

   DMTE.cdsQry3.First;
   while not DMTE.cdsQry3.Eof do
   begin
      if DMTE.cdsQry3.FieldByName('FLAGVAR').AsString='S' then
         xContMBco:=xContMBco+1;

      DMTE.cdsQry3.Next;
   end;

   if xContMBco=0 then
   begin
      DMTE.cdsQry2.EnableControls;
      DMTE.cdsQry3.EnableControls;

      raise exception.Create('Debe Marcar un Movimiento en Banco');
   end;

   DMTE.cdsQry2.IndexFieldNames :='ECFCOMP;ECNOCHQ;ECMTOORI';
   DMTE.cdsQry3.First;
   DMTE.cdsQry2.First;

   while not DMTE.cdsQry3.Eof do
   begin
      if DMTE.cdsQry3.FieldByName('FLAGVAR').AsString='S' then
      begin
         DMTE.cdsQry2.SetKey;
         DMTE.cdsQry2.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsQry3.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsQry2.FieldByName('ECNOCHQ').AsString   := DMTE.cdsQry3.FieldByName('ECNOCHQ').AsString;
         DMTE.cdsQry2.FieldByName('ECMTOORI').AsFloat   := DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat;
         if DMTE.cdsQry2.GotoKey then
         begin
            DMTE.cdsQry3.Edit;
            DMTE.cdsQry3.FieldByName('TDIARID').AsString  := DMTE.cdsQry2.FieldByName('TDIARID').AsString;
            DMTE.cdsQry3.FieldByName('ECANOMM').AsString  := DMTE.cdsQry2.FieldByName('ECANOMM').AsString;
            DMTE.cdsQry3.FieldByName('ECNOCOMP').AsString := DMTE.cdsQry2.FieldByName('ECNOCOMP').AsString;
            DMTE.cdsQry3.FieldByName('EC_IE').AsString    := DMTE.cdsQry2.FieldByName('EC_IE').AsString;
            DMTE.cdsQry3.FieldByName('FLAGVAR').AsString  := 'X';
            DMTE.cdsQry3.FieldByName('GCONCID').AsString  := dbeNreg.text;

            if DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat=0 then
               DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat := DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat;

            DMTE.cdsQry3.FieldByName('ECMTDIF').AsFloat  := DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat-DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat;

            DMTE.cdsQry3.FieldByName('ECCONSOLID').AsString := 'S';
            DMTE.cdsQry3.Post;

            DMTE.cdsQry2.Edit;
            DMTE.cdsQry2.FieldByName('FLAGVAR').AsString := 'X';
            DMTE.cdsQry2.FieldByName('ECCONSOLID').AsString := 'S';
            DMTE.cdsQry2.FieldByName('GCONCID').AsString := dbeNreg.text;
            DMTE.cdsQry2.FieldByName('ECMTCON').AsFloat  := DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat;
            DMTE.cdsQry2.FieldByName('ECMTDIF').AsFloat  := DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat-DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat;
            DMTE.cdsQry2.Post;
         end;
      end;
      DMTE.cdsQry3.Next;
   end;
   DMTE.cdsQry2.EnableControls;
   DMTE.cdsQry3.EnableControls;
   DMTE.cdsQry2.IndexFieldNames :='';
//   DMTE.cdsQry2.IndexFieldNames :='FLAGVAR;CIAID;BANCOID;CCBCOID;ECFCOMP;ECNOCHQ;ECCONSOLID';
   DMTE.cdsQry2.IndexFieldNames :='ECFCOMP;ECNOCHQ;ECMTOORI';
   DMTE.cdsQry3.IndexFieldNames :='';
//   DMTE.cdsQry3.IndexFieldNames :='FLAGVAR;CIAID;BANCOID;CCBCOID;ECFCOMP;ECNOCHQ;ECCONSOLID';
   DMTE.cdsQry3.IndexFieldNames :='ECFCOMP;ECNOCHQ;ECMTOORI';
   dbgExtractoBanco.RefreshDisplay;

end;

procedure TFConBank.z2bbtnCanceladoClick(Sender: TObject);
var
  UpSQL,xSQL : string;
begin
    // aqui comienza lo bueno es grabar los datos seleccionados.
    //  sFiltro
    DMTE.cdsQRY2.DisableControls;
    with DMTE, DMTE.cdsQRY2 do
    begin

      while not Eof do
      begin
         UpSQL := ' UPDATE CAJA302 SET '+
                     '  ECMTCON='+FieldByName('ECMTCON').AsString+','+
                     '  ECMTDIF='+FieldByName('ECMTDIF').AsString+','+
                     '  ECCONSOLID='''+FieldByName('ECCONSOLID').AsString+''''+
                     ' WHERE           '+
                     '     CIAID    ='''+FieldByName('CIAID').AsString+''''+
                     ' AND TDIARID  ='''+FieldByName('TDIARID').AsString+''''+
                     ' AND ECANOMM  ='''+FieldByName('ECANOMM').AsString+''''+
                     ' AND ECNOCOMP ='''+FieldByName('ECNOCOMP').AsString+'''';
         try
           DCOM1.AppServer.EjecutaSQL(UpSQL);
         except
         end;
         Next;
      end;

    end;
    DMTE.cdsEgrCaja.Edit;
    DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString:='C';
    DMTE.cdsEgrCaja.Post;
    xSQL:='Select * from CAJA316 '
            +'Where CIAID='''   +dblcCia.Text    +''' and '
            +      'BANCOID=''' +dblcBanco.Text  +''' and '
            +      'CCBCOID=''' +dblcCtaCte.Text +''' and '
            +      'GCONCID=''' +dbeNreg.Text    +''' ';
    DMTE.cdsEgrCaja.DataRequest( xSQL );
    DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

    CambiaEstado(DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString);
    DMTE.cdsQRY3.EnableControls;

end;

procedure TFConBank.ValidaCabecera;
begin
   if length(dblcCIA.text)=0    then raise exception.Create('Ingrese Compañia');
   if length(dblcBanco.text)=0  then raise exception.Create('Ingrese Banco');
   if length(dblcCtaCte.text)=0 then raise exception.Create('Ingrese Cta.Cte.');

   if dbdpFIni.Date = 0 then
      raise exception.Create('Debe ingresar la fecha de inicio');
      
   if dbdpFIni.Date > dbdpFFin.Date then
      raise exception.Create('La fecha de inicio debe ser menor la fecha final');

end;

procedure TFConBank.AsignaVariables;
begin
   dblcCIA.text    := DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
   dblcCIA.OnExit(Self);

   dblcBanco.text  := DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString;
   dblcBanco.OnExit(Self);

   dblcCtaCte.text := DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString;
   dblcCtaCte.OnExit(Self);

   dbdpFIni.Date   := DMTE.cdsEgrCaja.FieldByName('GCONFDESDE').AsDatetime;
   dbdpFFin.Date   := DMTE.cdsEgrCaja.FieldByName('GCONFHASTA').AsDatetime;
   dbdtpFecOper.Date := DMTE.cdsEgrCaja.FieldByName('GCONFEMOV').AsDatetime;
   dbeNreg.Text      := DMTE.cdsEgrCaja.FieldByName('GCONCID').AsString;
end;


procedure TFConBank.dblcCIAExit(Sender: TObject);
var
   xSQL : String;
begin
   sCIA := dblcCIA.Text;
   dbeCia.text:= DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIADES') ;

   xSQL := ' SELECT A.CIAID,A.BANCOID,B.BANCONOM ,B.BANCOABR '
          +' FROM TGE106 A ,TGE105 B '
          +' WHERE A.CIAID='+quotedstr(dblcCIA.Text)
          +'   and B.BANCOID=A.BANCOID '
          +'   and B.BCOTIPCTA=''B'' '
          +' group by A.CIAID,A.BANCOID,B.BANCONOM ,B.BANCOABR ';
   DMTE.cdsBanco.Filter   := '';
   DMTE.cdsBanco.Filtered := False;
   DMTE.cdsBanco.Close;
   DMTE.cdsBanco.DataRequest(xSql);
   DMTE.cdsBanco.Open;
   DMTE.cdsBanco.IndexFieldNames := 'BANCOID';
   DMTE.cdsBanco.First;
end;

procedure TFConBank.dblcCtaCteExit(Sender: TObject);
var
   sMonDes, sMonID : String;
begin
   sCTAB := dblcCtaCte.Text;
   dbeCtaCte.Text:=DMTE.DisplayDescripLocal(DMTE.cdsCCBco,'CCBCOID',dblcCtaCte.Text,'CCBCODES') ;
   sMonID := DMTE.cdsCCBco.FieldByName('TMONID').AsString;
   sMonDes :=DMTE.DisplayDescrip('prvTGE','TGE103','TMONDES','TMONID='''+sMonID+'''','TMONDES');
   dbeMoneda.Text := sMonDes;

end;
  {-------------------------------------------------------------------------
            EC_PROCE = 1 -> Egresos
            EC_PROCE = 2 -> Pago Proveedores // se cambia por B
            EC_PROCE = 3 -> Pago a Varios Proveedores
            EC_PROCE = 4 -> Transferencia Egresos
            EC_PROCE = 5 -> Ingresos
            EC_PROCE = 7 -> TRansfreencia Ingreso
            EC_PROCE = 8 -> Extorno
  -------------------------------------------------------------------------}
{  if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
  begin
     sSQL:='SELECT CAJA.*, CIA.CIADES, BANK.BANCONOM, CTAE.CCBCODES, '
          +   'MON.TMONDES, MON.TMONABR, FPA.FPAGODES, EQU.EQUIDES '
          +'FROM CAJA302 CAJA '
          +  'LEFT JOIN TGE101 CIA  ON (CIA.CIAID=CAJA.CIAID) '
          +  'LEFT JOIN TGE105 BANK ON (BANK.BANCOID=CAJA.BANCOID) '
          +  'LEFT JOIN TGE106 CTAE ON (CTAE.CIAID=CAJA.CIAID AND CTAE.BANCOID=CAJA.BANCOID '
          +                             'AND CTAE.CCBCOID=CAJA.CCBCOID) '
          +  'LEFT JOIN TGE103 MON  ON (MON.TMONID=CAJA.TMONID) '
          +  'LEFT JOIN TGE112 FPA  ON (FPA.FPAGOID=CAJA.FPAGOID) '
          +  'LEFT JOIN TGE160 EQU  ON (CAJA.FPAGOID=EQU.FPAGOID) '
          +'Where ( CAJA.EC_PROCE=''1'' or CAJA.EC_PROCE=''B'' or '
          +       ' CAJA.EC_PROCE=''3'' OR CAJA.EC_PROCE=''4'' or '
          +       ' CAJA.EC_PROCE=''5'' OR CAJA.EC_PROCE=''7'' or '
          +       ' CAJA.EC_PROCE=''8'' OR CAJA.EC_PROCE=''D'') '
  end;
  if DMTE.SRV_D = 'ORACLE' then
  begin
     sSQL:='SELECT CAJA.*, CIA.CIADES, BANK.BANCONOM, CTAE.CCBCODES, '
          +   'MON.TMONDES, MON.TMONABR, FPA.FPAGODES, EQU.EQUIDES '
          +'FROM CAJA302 CAJA, TGE101 CIA, TGE103 MON, TGE105 BANK, TGE106 CTAE, TGE112 FPA, TGE160 EQU '
          +'WHERE ( CAJA.EC_PROCE=''1'' or CAJA.EC_PROCE=''B'' or '
          +       ' CAJA.EC_PROCE=''3'' or CAJA.EC_PROCE=''4'' or '
          +       ' CAJA.EC_PROCE=''5'' or CAJA.EC_PROCE=''7'' or '
          +       ' CAJA.EC_PROCE=''8'' or CAJA.EC_PROCE=''D'') '
          +  'AND ( CIA.CIAID(+)   =CAJA.CIAID   ) and '
          +     ' ( MON.TMONID(+)  =CAJA.TMONID  ) and '
          +     ' ( BANK.BANCOID(+)=CAJA.BANCOID ) and '
          +     ' ( CTAE.CIAID(+)=CAJA.CIAID AND CTAE.BANCOID(+)=CAJA.BANCOID '
          +                             'AND CTAE.CCBCOID(+)=CAJA.CCBCOID ) and '
          +     ' ( FPA.FPAGOID(+) =CAJA.FPAGOID ) and '
          +     ' ( EQU.FPAGOID(+) =CAJA.FPAGOID )';
  end;
  fSQL := sSQL;
  if length(sCIA) >0   then
     fsCIA   := 'CAJA.CIAID='''+sCIA
  else
     fsCIA   := '';

  if length(sBCO) >0   then
     fsBCO   := ''' AND CAJA.BANCOID='''+sBCO
  else
     fsBCO   := '';

  if length(sCTAB) >0   then
     fsCTAB  := ''' AND CAJA.CCBCOID='''+sCTAB
  else
     fsCTAB := '';

  sFiltro := fsCIA+fsBCO+fsCTAB;

  if length(sFiltro)=0 then
     sFiltro := sFiltro+''' (CAJA.ECFCOMP >=' +DMTE.wRepFuncDate + ''''+FormatDateTime(DMTE.wFormatFecha,dFEI)+''') AND CAJA.ECFCOMP <=' +DMTE.wRepFuncDate + ''''+FormatDateTime(DMTE.wFormatFecha,dFEF)+'''))'
  else
     sFiltro := sFiltro+''' AND (CAJA.ECFCOMP >=' +DMTE.wRepFuncDate + ''''+FormatDateTime(DMTE.wFormatFecha,dFEI)+''') AND CAJA.ECFCOMP <=' +DMTE.wRepFuncDate + ''''+FormatDateTime(DMTE.wFormatFecha,dFEF)+'''))';

  sFiltro := sFiltro;  // + ' AND '+ sPFiltro;

  fSQL :=  sSQL + ' AND ' + sFiltro + ' ORDER BY CAJA.CIAID, CAJA.BANCOID, CAJA.CCBCOID, CAJA.ECFCOMP,CAJA.ECNOCOMP ';

  DMTE.cdsQRY2.Close;
  DMTE.cdsQRY2.DataRequest(fSQL);
  DMTE.cdsQRY2.Open;

  xSQL := 'SELECT CAJA.* FROM CAJA313 CAJA WHERE '+fsCIA+fsBCO+fsCTAB+'''';
  DMTE.cdsQry3.Close;
  DMTE.cdsQry3.DataRequest(xSQL);
  DMTE.cdsQry3.Open;}



procedure TFConBank.bbtnTransferirClick(Sender: TObject);
var
  xSQL,xFPago,xFlagTranf,xDocId,xNDoc,xGlosa,
  xFlagFPDOC,xFPagoId,xTDiar,xMonId,xCuenta,
  xAnoMM,xNoComp,xWhere : string;
  xContMBco,xTCamb,dRegTrans : double;
  Y,M,D : word;
begin

   // JCC - 07/05/2003
   // Se elimino la opcion porqur se pierde el sentido de la concilicion
   // se debe comparar lo regitrado con lo que viene del banco
   // No se puede crear el detalle del movimiento de bancos porque
   // faltaria perdir concepto, auxiliar y centro de costo
   // se tendria que generar una opcion similar a registrar movimiento en bancos.



   if DMTE.cdsQry3.RecordCount=0 then Exit;
   if DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString='X' then
      raise exception.Create('Es necesario Grabar las Actualizaciones');

   if DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString='C' then Exit;      

   DMTE.cdsQry3.DisableControls;
   DMTE.cdsQry3.indexFieldnames:='';
   DMTE.cdsQry3.First;
   while not DMTE.cdsQry3.Eof do
   begin
      if DMTE.cdsQry3.FieldByName('FLAGVAR').AsString='S' then
         xContMBco:=xContMBco+1;

      DMTE.cdsQry3.Next;
   end;

   if xContMBco=0 then
   begin
      DMTE.cdsQry3.EnableControls;   
      raise exception.Create('Debe Marcar un Movimiento en Banco');
   end;

   dRegTrans :=0;
   DMTE.cdsQry3.First;
   while not DMTE.cdsQry3.Eof do
   begin
      if (DMTE.cdsQry3.FieldByName('FLAGVAR').AsString='S') and (DMTE.cdsQry3.FieldByName('FLAGTRANSF').AsString<>'S') then
      begin
//         DMTE.DisplayDescrip('prvQry2','TGE160','*','EQUIID='+Quotedstr(DMTE.cdsQry3.FieldByName('FPAGOID').AsString),'FPAGOID');
         DMTE.DisplayDescrip('prvQry2','TGE160','*','FPAGOID='+Quotedstr(DMTE.cdsQry3.FieldByName('FPAGOID').AsString)+
                             ' AND BANCOID='+Quotedstr(dblcBanco.Text),'FPAGOID');
         xFlagTranf := DMTE.cdsQry.FieldByName('FLAGTRANSF').AsString;
//         xGlosa := DMTE.cdsQry.FieldByName('EQUIDES').AsString;
         xGlosa := 'TRANSFERIDO DESDE CONCILIACION'+Quotedstr(dbeNreg.text);

         if xFlagTranf='S' then
         begin
            DMTE.cdsQry3.Edit;
            DMTE.cdsQry3.FieldByName('ECCONSOLID').AsString :='S';
            DMTE.cdsQry3.FieldByName('FLAGVAR').AsString :='X';
            DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat  := DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat;
            DMTE.cdsQry3.FieldByName('ECMTDIF').AsFloat  := 0;
            DMTE.cdsQry3.FieldByName('FLAGTRANSF').AsString :='S';
            DMTE.cdsQry3.Post;

            xFlagFPDOC := DMTE.cdsQry.FieldByName('FLAGFPDOC').AsString;
            xFPagoId   := DMTE.cdsQry.FieldByName('FPAGOID').AsString;
            if xFlagFPDOC='N' then
            begin
               xDocId := DMTE.cdsQry.FieldByName('FPAGOID').AsString;
               xNDoc  := DMTE.cdsQry3.FieldByName('ECNOCHQ').AsString;
            end;

            if DMTE.cdsQry3.FieldByName('ECFCOMP').AsDateTime>0 then
            begin
               DecodeDate(DMTE.cdsQry3.FieldByName('ECFCOMP').AsDateTime,Y,M,D);
               xWhere := 'TMONID='+''''+DMTE.wTMonExt+''''
                        +' AND FECHA='+DMTE.wRepFuncDate +''''+formatdatetime(DMTE.wFormatFecha,DMTE.cdsQry3.FieldByName('ECFCOMP').AsDateTime) +''')';
               if length(DMTE.DisplayDescrip('prvTGE','TGE107','TMONID, TCAMVOV',xWhere,'TMONID'))>0 then
                   xTCamb:=DMTE.cdsqry.fieldbyname('TCAMVOV').AsFloat
               else
                  xTCamb:=0;

            end
            else
            begin
               DecodeDate(DMTE.cdsQry3.FieldByName('ECFEMICH').AsDateTime,Y,M,D);
               xWhere := 'TMONID='+''''+DMTE.wTMonExt+''''
                        +' AND FECHA='+DMTE.wRepFuncDate +''''+formatdatetime(DMTE.wFormatFecha,DMTE.cdsQry3.FieldByName('ECFEMICH').AsDateTime) +''')';
               if length(DMTE.DisplayDescrip('prvTGE','TGE107','TMONID, TCAMVOV',xWhere,'TMONID'))>0 then
                   xTCamb:=DMTE.cdsqry.fieldbyname('TCAMVOV').AsFloat
               else
                  xTCamb:=0;

            end;

            xAnoMM:= Floattostr(Y)+DMTE.StrZero(Floattostr(M),2);

            xTDiar := DMTE.DisplayDescrip('prvTGE','TGE106','CCBCOVOUCH,TMONID,CTAPRINC','BANCOID='+quotedstr(dblcBanco.text)+' AND CCBCOID='+quotedstr(dblcCtaCte.text),'CCBCOVOUCH');
            xMonId := DMTE.cdsQry.fieldbyname('TMONID').AsString;
            xCuenta := DMTE.cdsQry.fieldbyname('CTAPRINC').AsString ;

            xWhere:='CIAID='+quotedstr(dblcCia.Text)+' AND ECANOMM='+quotedstr(xAnoMM)
                   +' AND TDIARID='+ quotedstr(xTDiar);
            xNoComp:=DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
            xNoComp:=DMTE.StrZero(xNoComp, 10 );

            xSQL := ' INSERT INTO CAJA302(CIAID,TDIARID,ECANOMM,ECNOCOMP,CUENTAID,ECLOTE,ECGLOSA,ECCONSOLID,GCONCID,'+
                    ' ECMTCON,ECMTDIF,ECFCOMP,DOCID,ECNODOC,TMONID,ECTCAMB,ECMTOORI,ECMTOLOC,ECMTOEXT,BANCOID,CCBCOID,'+
                    ' ECESTADO,ECUSER,ECFREG,EC_PROCE,EC_IE) '+
                    ' VALUES( '
                    +Quotedstr(dblcCIA.text)+','+Quotedstr(xTDiar)+','+Quotedstr(xAnoMM)
                    +','+Quotedstr(xNoComp)+','+Quotedstr(xCuenta)+','+Quotedstr('0000')+','+Quotedstr(xGlosa)+','+Quotedstr('S')
                    +','+Quotedstr(dbeNreg.text)
                    +','+''+Floattostr(DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat)+''+','+''+Floattostr(DMTE.cdsQry3.FieldByName('ECMTDIF').AsFloat)+'';


            if DMTE.cdsQry3.FieldByName('ECFCOMP').AsDateTime>0 then
               xSQL :=xSQL+','+quotedstr( Formatdatetime(DMTE.wFormatFecha,DMTE.cdsQry3.FieldByName('ECFCOMP').AsDatetime ))
            else
               xSQL :=xSQL+','+quotedstr( Formatdatetime(DMTE.wFormatFecha,DMTE.cdsQry3.FieldByName('ECFEMICH').AsDatetime ));

            xSQL := xSQL+','+Quotedstr(xDocId)+','+Quotedstr(xNDoc)+','+Quotedstr(xMonId)+','+''+Floattostr(xTCamb)+'';
            if xMonId = DMTE.wTMonLoc then
               xSQL:= xSQL+','+''+Floattostr(DMTE.cdsQry3.fieldbyname('ECMTOORI').AsFloat)+''+','
                              +''+Floattostr(DMTE.cdsQry3.fieldbyname('ECMTOORI').AsFloat)+''+','
                              +''+Floattostr(DMTE.FRound(DMTE.cdsQry3.fieldbyname('ECMTOORI').AsFloat/xTCamb,15,2))+''+','
            else
               xSQL:= xSQL+','+''+Floattostr(DMTE.cdsQry3.fieldbyname('ECMTOORI').AsFloat)+''+','
                              +''+Floattostr(DMTE.FRound(DMTE.cdsQry3.fieldbyname('ECMTOORI').AsFloat*xTCamb,15,2))+''+','
                              +''+Floattostr(DMTE.cdsQry3.fieldbyname('ECMTOORI').AsFloat)+''+',';
            xSQL:= xSQL + Quotedstr(dblcBanco.text)+','+Quotedstr(dblcCtaCte.text)+',''C'', '+Quotedstr(DMTE.wUsuario)+','
                        + Quotedstr( Formatdatetime(DMTE.wFormatFecha,Date ))+',''D'',''E'') ';

            try
                DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            except
              Showmessage('Avise a su  Proveedor');
            end;

            // DETALLE DE CAJA
            xSQL := ' INSERT INTO CAJA301(CIAID,TDIARID,ECANOMM,ECNOCOMP,CUENTAID,ECGLOSA,GCONCID,'+
                    ' ECMTCON,ECMTDIF,ECFCOMP,DOCID,ECNODOC,TMONID,ECTCAMB,ECMTOORI,ECMTOLOC,ECMTOEXT,BANCOID,CCBCOID,'+
                    ' ECESTADO, ECUSER, ECFREG, EC_PROCE, EC_IE ) '+
                    ' VALUES( '
                    +Quotedstr(dblcCIA.text)+','+Quotedstr(xTDiar)+','+Quotedstr(xAnoMM)
                    +','+Quotedstr(xNoComp)+','+Quotedstr(xCuenta)+','+Quotedstr(xGlosa)
                    +','+Quotedstr(dbeNreg.text)
                    +','+''+Floattostr(DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat)+''+','
                    +''+Floattostr(DMTE.cdsQry3.FieldByName('ECMTDIF').AsFloat)+'';

            if DMTE.cdsQry3.FieldByName('ECFCOMP').AsDateTime>0 then
               xSQL :=xSQL+','+quotedstr( Formatdatetime(DMTE.wFormatFecha,DMTE.cdsQry3.FieldByName('ECFCOMP').AsDatetime ))
            else
               xSQL :=xSQL+','+quotedstr( Formatdatetime(DMTE.wFormatFecha,DMTE.cdsQry3.FieldByName('ECFEMICH').AsDatetime ));

            xSQL := xSQL+','+Quotedstr(xDocId)+','+Quotedstr(xNDoc)+','+Quotedstr(xMonId)+','+''+Floattostr(xTCamb)+'';
            if xMonId = DMTE.wTMonLoc then
               xSQL:= xSQL+','+''+Floattostr(DMTE.cdsQry3.fieldbyname('ECMTOORI').AsFloat)+''+','
                              +''+Floattostr(DMTE.cdsQry3.fieldbyname('ECMTOORI').AsFloat)+''+','
                              +''+Floattostr(DMTE.FRound(DMTE.cdsQry3.fieldbyname('ECMTOORI').AsFloat/xTCamb,15,2))+''+','
            else
               xSQL:= xSQL+','+''+Floattostr(DMTE.cdsQry3.fieldbyname('ECMTOORI').AsFloat)+''+','
                              +''+Floattostr(DMTE.FRound(DMTE.cdsQry3.fieldbyname('ECMTOORI').AsFloat*xTCamb,15,2))+''+','
                              +''+Floattostr(DMTE.cdsQry3.fieldbyname('ECMTOORI').AsFloat)+''+',';
            xSQL:= xSQL + Quotedstr(dblcBanco.text)+','+Quotedstr(dblcCtaCte.text)+',''C'', '+Quotedstr(DMTE.wUsuario)+','
                        + Quotedstr( Formatdatetime(DMTE.wFormatFecha,Date ))+',''D'',''E'') ';

            try
                DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
            except
              Showmessage('Avise a su  Proveedor');
            end;



            dRegTrans := dRegTrans+1;
            Z2bbtnGraba.Enabled := True;
         end;
      end;

      DMTE.cdsQry3.Next;

   end;
//   DMTE.cdsQry3.IndexFieldNames :='FLAGVAR;CIAID;BANCOID;CCBCOID;ECFCOMP;ECNOCHQ;ECCONSOLID';
   DMTE.cdsQry3.IndexFieldNames :='ECFCOMP;ECNOCHQ;ECMTOORI';
   DMTE.cdsQry3.EnableControls;      
   Showmessage('Registros Transferidos: '+Floattostr(dRegTrans));

end;

procedure TFConBank.GeneraReporte(xxEstado : string);
var
  xSQL : string;
begin
end;

procedure TFConBank.dbgExtractoBancoIButtonClick(Sender: TObject);
var
   xSQL : string;
begin
   xSQL := ' SELECT * FROM TGE160 '+
           ' WHERE BANCOID='+Quotedstr(dblcBanco.Text);
   DMTE.cdsQry4.IndexFieldNames := '';
   DMTE.cdsQry4.Filter   :='';
   DMTE.cdsQry4.Filtered := False;
   DMTE.cdsQry4.Close;
   DMTE.cdsQry4.DataRequest(xSQL);
   DMTE.cdsQry4.Open;
   if DMTE.cdsQry4.RecordCount= 0 then
      raise exception.Create('No Existen tipo de Operaciones para este Banco'+#13+'Ingreselos por Referencias'); 
   dblcTipoOp.LookupTable := DMTE.cdsQry4;
   dblcTipoOp.LookupField := 'EQUIID';
//   dblcTipoOp.LookupField := 'FPAGOID';

   dblcTipoOp.Selected.Clear;
//   dblcTipoOp.Selected.Add('EQUIID'#9'3'#9'Código Op Bco'#9'F');
   dblcTipoOp.Selected.Add('EQUIID'#9'3'#9'Código Op Bco'#9'F');
   dblcTipoOp.Selected.Add('EQUIDES'#9'25'#9'Operación Banco'#9'F');
   dblcTipoOp.Selected.Add('FPAGODES'#9'25'#9'Operación SOL'#9'F');

   pnlInserta.Visible := True;
   pnlInserta.BringToFront;
   InicializaInsercion;
   if dblcTipoOp.Enabled =True then
      dblcTipoOp.SetFocus;

end;

procedure TFConBank.bbtnOkMovClick(Sender: TObject);
begin
  if bbtnCancelMov.Focused then Exit;
  if Length(Trim(dblcTipoOp.text))=0 then
  begin
     dblcTipoOp.SetFocus;
     raise Exception.Create('Ingrese Tipo de Operacion')
  end;

  if Length(Trim(dbeNoChq.text))=0 then
  begin
     dbeNoChq.SetFocus;
     raise Exception.Create('Ingrese Nro. Cheque/Doc')
  end;

  if dbdtpFecComp.Date=0 then
  begin
     dbdtpFecComp.SetFocus;
     raise Exception.Create('Ingrese Fecha de Cheque/Doc')
  end;

  if Length(Trim(dbeImporte.text))=0 then
  begin
     dbeImporte.SetFocus;
     raise Exception.Create('Ingrese Importe')
  end;

  if rgMov.ItemIndex=-1 then
     raise exception.Create('Seleccione Tipo Movimiento');  

  with DMTE.cdsQry3 do
  begin
  pnlFoot.Enabled   := True;
  pnlActImp.Visible := False;
  dbgEgrCaja.Enabled   := True;

  Insert;

  FieldByName('CIAID').AsString   := dblcCIA.text;
  FieldByName('BANCOID').AsString := dblcBanco.text;
  FieldByName('CCBCOID').AsString := dblcCtaCte.text;
  FieldByName('GCONCID').AsString := dbeNreg.text;

{  FieldByName('EQUIID').AsString   := dblcTipoOp.text;
  sMonDes :=DMTE.DisplayDescrip('prvTGE','TGE160','FPAGOID','EQUIID='+Quotedstr(dblcTipoOp.text)+' AND BANCOID='
                                +','FPAGOID');}

  FieldByName('FPAGOID').AsString   := dblcTipoOp.text;
  FieldByName('ECFCOMP').AsDatetime := dbdtpFecComp.Date;

  FieldByName('ECNOCHQ').AsString := dbeNoChq.text;

  if rgMov.ItemIndex=0 then
     FieldByName('EC_IE').AsString := 'I'
  else
     if rgMov.ItemIndex=1 then
        FieldByName('EC_IE').AsString := 'E';

  FieldByName('ECMTOORI').AsFloat := StrToFloat(dbeImporte.Text);
  FieldByName('ECMTCON').AsFloat  := StrToFloat(dbeImporte.Text);
  FieldByName('ECMTDIF').AsFloat  := 0;

  if chkMarca1.Checked then
     FieldByName('FLAGVAR').AsString := 'S'
  else
     FieldByName('FLAGVAR').AsString := 'X';


  FieldByName('ECCONSOLID').AsString := 'X';
  FieldByName('FLAGINSERT').AsString := 'S';

  Z2bbtnGraba.Enabled := True;

  post;

  pFooter;
  InicializaInsercion;
  dblcTipoOp.SetFocus;
  end;

end;

procedure TFConBank.bbtnCancelMovClick(Sender: TObject);
begin
   pnlInserta.Visible := False;
end;

procedure TFConBank.dblcTipoOpExit(Sender: TObject);
begin
  dbeTiOp.text:=DMTE.DisplayDescrip('prvTGE','TGE160','EQUIDES','EQUIID='+Quotedstr(dblcTipoOp.text)
                                    + ' AND BANCOID='+Quotedstr(dblcBanco.Text),'EQUIDES');
end;

procedure TFConBank.InicializaInsercion;
begin
   dblcTipoOp.Text   := '';
   dbeTiOp.Text      := '';
   dbeNoChq.Text     := '';
   dbdtpFecComp.Date := dbdtpFecOper.Date;
   dbeImporte.text   := '';
   chkMarca1.Checked := False;
end;

procedure TFConBank.bbtnConcilSOLClick(Sender: TObject);
var
   xContMov : double;
   xSQL : string;
begin

    if DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString='C' then Exit;

    if DMTE.cdsQry2.RecordCount=0 then
       raise exception.Create('No existen Movimientos en SOL');

    xSQL := ' SELECT * FROM TGE160 '+
           ' WHERE BANCOID='+Quotedstr(dblcBanco.Text);
    DMTE.cdsQry4.IndexFieldNames := '';
    DMTE.cdsQry4.Filter   :='';
    DMTE.cdsQry4.Filtered := False;
    DMTE.cdsQry4.Close;
    DMTE.cdsQry4.DataRequest(xSQL);
    DMTE.cdsQry4.Open;
    if DMTE.cdsQry4.RecordCount= 0 then
       raise exception.Create('No Existen tipo de Operaciones para este Banco'+#13+'Ingreselos por Referencias');


    DMTE.cdsQry2.IndexFieldNames :='';

    DMTE.cdsQry2.DisableControls;
    xContMov :=0;
    DMTE.cdsQry2.First;
    while not DMTE.cdsQry2.Eof do
    begin
       if DMTE.cdsQry2.FieldByName('FLAGVAR').AsString = 'S' then
          xContMov := xContMov+1;
       DMTE.cdsQry2.Next;
    end;
    DMTE.cdsQry2.EnableControls;

    if xContMov=0 then
    begin
       raise exception.Create('No existen Movimientos marcados....')
    end;

    DMTE.cdsQry2.DisableControls;
    DMTE.cdsQry2.First;
    while not DMTE.cdsQry2.Eof do
    begin
       if DMTE.cdsQry2.FieldByName('FLAGVAR').AsString='S' then
       begin
          DMTE.cdsQry2.Edit;
          DMTE.cdsQry2.FieldByName('FLAGVAR').AsString := 'X';
          DMTE.cdsQry2.FieldByName('ECCONSOLID').AsString := 'S';
          DMTE.cdsQry2.FieldByName('GCONCID').AsString := dbeNreg.text;
          DMTE.cdsQry2.FieldByName('ECMTCON').AsFloat  := DMTE.cdsQry2.FieldByName('ECMTOORI').AsFloat;
          DMTE.cdsQry2.FieldByName('ECMTDIF').AsFloat  := DMTE.cdsQry2.FieldByName('ECMTOORI').AsFloat-DMTE.cdsQry2.FieldByName('ECMTCON').AsFloat;
          DMTE.cdsQry2.Post;

          DMTE.cdsQry3.Insert;

          DMTE.cdsQry3.FieldByName('CIAID').AsString   := dblcCIA.text;
          DMTE.cdsQry3.FieldByName('BANCOID').AsString := dblcBanco.text;
          DMTE.cdsQry3.FieldByName('CCBCOID').AsString := dblcCtaCte.text;
          DMTE.cdsQry3.FieldByName('GCONCID').AsString := Trim(dbeNreg.text);
          DMTE.cdsQry3.FieldByName('TDIARID').AsString  := DMTE.cdsQry2.FieldByName('TDIARID').AsString;
          DMTE.cdsQry3.FieldByName('ECANOMM').AsString  := DMTE.cdsQry2.FieldByName('ECANOMM').AsString;
          DMTE.cdsQry3.FieldByName('ECNOCOMP').AsString := DMTE.cdsQry2.FieldByName('ECNOCOMP').AsString;

          if DMTE.cdsQry2.FieldByName('FPAGOID').AsString<>'' then
          begin
             DMTE.cdsQry3.FieldByName('FPAGOID').AsString   := DMTE.cdsQry2.FieldByName('FPAGOID').AsString;
             if DMTE.cdsQry2.FieldByName('ECFEMICH').AsDatetime=0 then
                DMTE.cdsQry3.FieldByName('ECFCOMP').AsDatetime := DMTE.cdsQry2.FieldByName('ECFCOMP').AsDatetime
             else
                DMTE.cdsQry3.FieldByName('ECFCOMP').AsDatetime := DMTE.cdsQry2.FieldByName('ECFEMICH').AsDatetime;

             DMTE.cdsQry3.FieldByName('ECNOCHQ').AsString   := DMTE.cdsQry2.FieldByName('ECNOCHQ').AsString;
          end
          else
          begin
             DMTE.cdsQry3.FieldByName('FPAGOID').AsString   := DMTE.cdsQry2.FieldByName('DOCID').AsString;
             DMTE.cdsQry3.FieldByName('ECFCOMP').AsDatetime := DMTE.cdsQry2.FieldByName('ECFCOMP').AsDatetime;
             DMTE.cdsQry3.FieldByName('ECNOCHQ').AsString   := DMTE.cdsQry2.FieldByName('ECNODOC').AsString;
          end;

          DMTE.cdsQry3.FieldByName('EC_IE').AsString   := DMTE.cdsQry2.FieldByName('EC_IE').AsString;
          DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat := DMTE.cdsQry2.FieldByName('ECMTOORI').AsFloat;;
          DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat  := DMTE.cdsQry2.FieldByName('ECMTOORI').AsFloat;;
          DMTE.cdsQry3.FieldByName('ECMTDIF').AsFloat  := DMTE.cdsQry2.FieldByName('ECMTDIF').AsFloat;// StrToFloat(dbeIMP.Text) - StrToFloat(dbeNIMP.Text);

          DMTE.cdsQry3.FieldByName('FLAGVAR').AsString    := 'X';
          DMTE.cdsQry3.FieldByName('ECCONSOLID').AsString := 'S';
          DMTE.cdsQry3.FieldByName('FLAGINSERT').AsString := 'S';

          DMTE.cdsQry3.post;

       end;

       DMTE.cdsQry2.Next;
    end;
//    DMTE.cdsQry2.Post;
//    DMTE.cdsQry2.IndexFieldNames :='FLAGVAR;CIAID;BANCOID;CCBCOID;ECFCOMP;ECNOCHQ;ECCONSOLID';
    DMTE.cdsQry2.IndexFieldNames :='ECFCOMP;ECNOCHQ;ECMTOORI';
    DMTE.cdsQry2.EnableControls;


end;


{procedure TFConBank.Z2bbtnProcesarClick(Sender: TObject);
var
   xContMSOL,xContMBco : double;
begin
   if DMTE.cdsQry2.RecordCount=0 then Exit;
   if DMTE.cdsQry3.RecordCount=0 then Exit;

   xContMSOL :=0;
   xContMBco :=0;
   //   ValidaMarca;
   DMTE.cdsQry2.DisableControls;
   DMTE.cdsQry3.DisableControls;
   DMTE.cdsQry2.First;
   while not DMTE.cdsQry2.Eof do
   begin
      if DMTE.cdsQry2.FieldByName('FLAGVAR').AsString='S' then
         xContMSOL:=xContMSOL+1;

      DMTE.cdsQry2.Next;
   end;

   DMTE.cdsQry3.First;
   while not DMTE.cdsQry3.Eof do
   begin
      if DMTE.cdsQry3.FieldByName('FLAGVAR').AsString='S' then
         xContMBco:=xContMBco+1;

      DMTE.cdsQry3.Next;
   end;

   if xContMBco=0 then
   begin
      DMTE.cdsQry2.EnableControls;
      DMTE.cdsQry3.EnableControls;

      raise exception.Create('Debe Marcar un Movimiento en Banco');
   end;

   if xContMSOL=0 then
   begin
      DMTE.cdsQry2.EnableControls;
      DMTE.cdsQry3.EnableControls;
      raise exception.Create('Debe Marcar un Movimiento en SOL');
   end;

   if xContMBco>1 then
   begin
      DMTE.cdsQry2.EnableControls;
      DMTE.cdsQry3.EnableControls;
      raise exception.Create('Debe Marcar solo un Mov. de Banco!!!');
   end;

   if xContMSOL>1 then
   begin
      DMTE.cdsQry2.EnableControls;
      DMTE.cdsQry3.EnableControls;
      raise exception.Create('Debe Marcar solo un Mov. de SOL!!!');
   end;



   DMTE.cdsQry3.First;
   DMTE.cdsQry2.First;
   DMTE.cdsQry3.IndexFieldNames :='';
   DMTE.cdsQry3.IndexFieldNames :='FLAGVAR';
//   DMTE.cdsQry3.IndexFieldNames :='ECFCOMP;ECNOCHQ;ECMTOORI';


   while not DMTE.cdsQry2.Eof do
   begin
      if DMTE.cdsQry2.FieldByName('FLAGVAR').AsString='S' then
      begin
         DMTE.cdsQry3.SetKey;
         DMTE.cdsQry3.FieldByName('ECFCOMP').AsDateTime := DMTE.cdsQry2.FieldByName('ECFCOMP').AsDateTime;
         DMTE.cdsQry3.FieldByName('ECNOCHQ').AsString   := DMTE.cdsQry2.FieldByName('ECNOCHQ').AsString;
         DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat   := DMTE.cdsQry2.FieldByName('ECMTOORI').AsFloat;

         DMTE.cdsQry3.FieldByName('FLAGVAR').AsString   := DMTE.cdsQry2.FieldByName('FLAGVAR').AsString;
         if DMTE.cdsQry3.GotoKey then
         begin
            DMTE.cdsQry3.Edit;
            DMTE.cdsQry3.FieldByName('TDIARID').AsString  := DMTE.cdsQry2.FieldByName('TDIARID').AsString;
            DMTE.cdsQry3.FieldByName('ECANOMM').AsString  := DMTE.cdsQry2.FieldByName('ECANOMM').AsString;
            DMTE.cdsQry3.FieldByName('ECNOCOMP').AsString := DMTE.cdsQry2.FieldByName('ECNOCOMP').AsString;
            DMTE.cdsQry3.FieldByName('EC_IE').AsString    := DMTE.cdsQry2.FieldByName('EC_IE').AsString;
            DMTE.cdsQry3.FieldByName('FLAGVAR').AsString  := 'X';
            DMTE.cdsQry3.FieldByName('GCONCID').AsString  := dbeNreg.text;

            if DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat=0 then
               DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat := DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat;

            DMTE.cdsQry3.FieldByName('ECMTDIF').AsFloat  := DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat-DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat;

            DMTE.cdsQry3.FieldByName('ECCONSOLID').AsString := 'S';
            DMTE.cdsQry3.Post;
            DMTE.cdsQry2.Edit;
            DMTE.cdsQry2.FieldByName('FLAGVAR').AsString := 'X';
            DMTE.cdsQry2.FieldByName('ECCONSOLID').AsString := 'S';
            DMTE.cdsQry2.FieldByName('GCONCID').AsString := dbeNreg.text;
            DMTE.cdsQry2.FieldByName('ECMTCON').AsFloat  := DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat;
            DMTE.cdsQry2.FieldByName('ECMTDIF').AsFloat  := DMTE.cdsQry3.FieldByName('ECMTOORI').AsFloat-DMTE.cdsQry3.FieldByName('ECMTCON').AsFloat;
            DMTE.cdsQry2.Post;
         end;
      end;
      DMTE.cdsQry2.Next;
   end;
   DMTE.cdsQry2.EnableControls;
   DMTE.cdsQry3.EnableControls;
   DMTE.cdsQry2.IndexFieldNames :='';
   DMTE.cdsQry2.IndexFieldNames :='FLAGVAR;CIAID;BANCOID;CCBCOID;ECFCOMP;ECNOCHQ;ECCONSOLID';
   DMTE.cdsQry3.IndexFieldNames :='';
   DMTE.cdsQry3.IndexFieldNames :='FLAGVAR;CIAID;BANCOID;CCBCOID;ECFCOMP;ECNOCHQ;ECCONSOLID';
   dbgExtractoBanco.RefreshDisplay;

end;}




procedure TFConBank.dbeImporteExit(Sender: TObject);
begin
   if Length(Trim(dbeImporte.Text))=0 then
      dbeImporte.Text:='0' ;
  if strtoFloat(dbeImporte.Text)<0 then
  begin
     dbeImporte.Text :='';
     dbeImporte.setFocus;
     raise Exception.Create('Ingrese un monto mayor/igual a cero ');
  end;


end;

procedure TFConBank.dbeNIMPExit(Sender: TObject);
begin
{   if Length(Trim(dbeNIMP.Text))=0 then
      dbeNIMP.Text:='0'
  if strtoFloat(dbeNIMP.Text)<0 then
  begin
     dbeNIMP.Text :='';
     dbeNIMP.setFocus;
     raise Exception.Create(Ingrese un monto mayor/igual a cero ');
  end;}

end;

procedure TFConBank.dbeIMPExit(Sender: TObject);
begin
  if Length(Trim(dbeIMP.Text))=0 then
      dbeIMP.Text:='0' ;
  if strtoFloat(dbeIMP.Text)<0 then
  begin
     dbeIMP.Text :='';
     dbeIMP.setFocus;
     raise Exception.Create('Ingrese un monto mayor/igual a cero ');
  end;

end;

procedure TFConBank.dbdtpFecOperExit(Sender: TObject);
var
   xWhere : string;
begin
  if DMTE.BuscaFechaCierre( dblcCia.Text, dblcBanco.Text, dblcCtaCte.text, dbdtpFecOper.Date ) then
  begin
     Showmessage('Error : Mes de Fecha Fue Cerrado. Verificar...');
     dbdtpFecOper.SetFocus;
     Exit;
  end;
  xWhere:='TMONID='+quotedstr(DMTE.wTMonExt)
          +' and FECHA='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFecOper.Date)+''')';
  if length(DMTE.DisplayDescrip('prvTGE','TGE107','TMONID, '+DMTE.wTipoCambioUsar,xWhere,'TMONID'))=0 then
  begin
     dbdtpFecOper.SetFocus;
     ShowMessage('Tipo de Cambio No Registrado');
     exit;
  end;

end;

procedure TFConBank.dbeNChequeExit(Sender: TObject);
begin
   if DMTE.cdsQry3.Locate('FPAGOID;ECNOCHQ',
                    VarArrayOf([dblcTipoOp2.Text,dbeNCheque.Text]),[]) then
   begin
      dbeNCheque.Text :='';
      dbeNCheque.SetFocus;
      raise exception.Create('El Nro de Cheque/Doc esta ingresado');
   end;

end;

procedure TFConBank.dbeNoChqExit(Sender: TObject);
begin
   if DMTE.cdsQry3.Locate('FPAGOID;ECNOCHQ',
                    VarArrayOf([dblcTipoOp.Text,dbeNoChq.Text]),[]) then
   begin
      dbeNoChq.Text :='';
      dbeNoChq.SetFocus;
      raise exception.Create('El Nro de Cheque/Doc esta ingresado');
   end;
end;



procedure TFConBank.dbgExtractoBancoCheckValue(Sender: TObject;
  PassesPictureTest: Boolean);
begin
   ShowMessage('ch');
end;

procedure TFConBank.dbgExtractoBancoTitleButtonClick(Sender: TObject;
  AFieldName: String);
var
   xFlag : String;
begin
   if AFieldName='FLAGVAR' then begin

      DMTE.cdsQry3.First;

      if DMTE.cdsQry3.FieldByName('FLAGVAR').AsString='S' then
         xFlag:='N'
      else
         xFlag:='S';

      while not DMTE.cdsQry3.Eof do begin
         DMTE.cdsQry3.Edit;
         DMTE.cdsQry3.FieldByName('FLAGVAR').AsString:=xFlag;
         DMTE.cdsQry3.Next;
      end;
   end;
end;

procedure TFConBank.FormShow(Sender: TObject);
begin
  sBCO := DMTE.cdsBanco.fieldbyname('BANCOID').AsString;
  dblcBanco.OnExit(self);

  if DMTE.wModo='A' then
  begin
    dbdpFIni.Date := DateS - 30;
    dbdpFFin.Date := DateS;
    dbdtpFecOper.Date := DateS;
//    CambiaEstado('X');
    gbCia.Enabled   := True;
    gbRango.Enabled := True;
    gbBco.Enabled   := True;
    pnlHead.Enabled := True;
    dbgEgrCaja.Enabled := True;
    dbgExtractoBanco.Enabled := True;
    Z2bbtnGraba.Enabled := True;
    z2bbtnCancelado.Enabled := False;
    Z2bbtnPrint.Enabled     := False;
    bbtnTransferir.Enabled  := True;
    Z2bbtnOk.Enabled        := True;
    Z2bbtnProcesar.Enabled  := True;
    bbtnConcilSOL.Enabled   := True;
    Z2bbtnRegresa.Enabled   := True;

    InicializaDatos;
  end
  else
     if DMTE.wModo='M' then
     begin
        AsignaVariables;
        CambiaEstado(DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString);
        FiltraConciliacion(DMTE.cdsEgrCaja.FieldByName('GCONESTADO').AsString);
        dblcBanco.text  := DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString;
        dblcBanco.OnExit(Self);
        dblcCtaCte.text := DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString;
        dblcCtaCte.OnExit(Self);
     end ;

  xInsert:= False;


  dbgEgrCaja.Selected.Clear;
//  dbgEgrCaja.Selected.Add('FLAGVAR'#9'1'#9'Marca~para Conciliar'#9'F');
  dbgEgrCaja.Selected.Add('FLAGVAR'#9'1'#9'(X)'#9'F');    
  dbgEgrCaja.Selected.Add('FPAGOID'#9'2'#9'Código~Op.Banco'#9'F');
  dbgEgrCaja.Selected.Add('FPAGODES'#9'12'#9'Operación~Banco'#9'F');
//  dbgEgrCaja.Selected.Add('EQUIID'#9'10'#9'Código~Operación~Sistema'#9'F');
//  dbgEgrCaja.Selected.Add('EQUIDES'#9'20'#9'Operación~Sistema'#9'F');
  dbgEgrCaja.Selected.Add('ECNOCHQ'#9'12'#9'Nro.~Cheque'#9'F');
//  dbgEgrCaja.Selected.Add('ECGIRA'#9'30'#9'Girado a'#9'F');
  dbgEgrCaja.Selected.Add('ECFCOMP'#9'10'#9'Fecha~Comp.'#9'F');
//  dbgEgrCaja.Selected.Add('ECCHKEST'#9'8'#9'Estado~Actual'#9'F');
//  dbgEgrCaja.Selected.Add('ECFENTR'#9'10'#9'Fecha~de Entrega'#9'F');
//  dbgEgrCaja.Selected.Add('ECPERNDOC'#9'15'#9'Nº de Documento'#9'F');
  dbgEgrCaja.Selected.Add('ECMTOORI'#9'11'#9'Monto~Origen'#9'F');
//  dbgEgrCaja.Selected.Add('ECMTCON'#9'13'#9'Monto~Conciliado'#9'F');
//  dbgEgrCaja.Selected.Add('ECMTDIF'#9'13'#9'Diferencia~Conciliatoria'#9'F');
  dbgEgrCaja.Selected.Add('ECCONSOLID'#9'1'#9'Conci_~liado'#9'F');
  dbgEgrCaja.SetControlType('ECCONSOLID', fctCheckBox, 'S;N');
  dbgEgrCaja.SetControlType('FLAGVAR', fctCheckBox, 'S;X');
  dbgEgrCaja.RefreshDisplay;

  if DMTE.wModo= 'A' then
     dblcCIA.SetFocus;

end;

procedure TFConBank.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

end.








unit Caja219;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, DBCtrls, Mask, wwdbedit,
  wwdblook, wwdbdatetimepicker, Buttons, Db, ppBands, ppClass, ppDB,
  ppProd, ppReport, ppComm, ppRelatv, ppCache, ppDBPipe, ppCtrls, ppModule,
  daDatMod, ppPrnabl, ppViewr, ppVar, CajaUtil, ppTypes;

type
  cabecera = record
    CIAID,
    CIADES,
    BANCOID,
    BANCODES,
    CCBCOID,
    CCBCODES  : String  ;
    ESTADO    : Integer ;
    FECHAINI ,
    FECHAFIN  : TDate   ;
  end ;
  TFEntrChqs = class(TForm)
    dbgEgrCaja: TwwDBGrid;
    plnFiltro: TPanel;
    pnlEntrega: TPanel;
    dbdECFCOMP: TwwDBDateTimePicker;
    dblcPERID: TwwDBLookupCombo;
    dbePERID: TwwDBEdit;
    dbeECPERREC: TwwDBEdit;
    dblcTIPDOCCOD: TwwDBLookupCombo;
    dbeTDOCIDEN: TwwDBEdit;
    dbeOBS: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    z2bbtnOkCono: TBitBtn;
    z2bbtnCancelCono: TBitBtn;
    dbeECPERNDOC: TwwDBEdit;
    Label6: TLabel;
    pnlBotones: TPanel;
    rgEstado: TRadioGroup;
    Panel4: TPanel;
    Bevel1: TBevel;
    Button1: TButton;
    Bevel2: TBevel;
    chkbtnPend: TRadioButton;
    chkbtnEntre: TRadioButton;
    dbpplEgrCaja: TppDBPipeline;
    pprEgrCaja: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    pplFDesde: TppLabel;
    pplFHasta: TppLabel;
    pplEstado: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGFBanco: TppGroupFooterBand;
    ppDBText2: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGFCTA: TppGroupFooterBand;
    ppDBText4: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLine4: TppLine;
    ppShape1: TppShape;
    ppLabel13: TppLabel;
    ppLine3: TppLine;
    TotalCTACTES: TppVariable;
    TotalCTACTEU: TppVariable;
    TotalBCOS: TppVariable;
    TotalBCOU: TppVariable;
    vMntLOC: TppVariable;
    vMntExt: TppVariable;
    TotalGL: TppVariable;
    TotalGE: TppVariable;
    z2bbtnSalir: TBitBtn;
    Z2bbtnPrint: TBitBtn;
    Z2bbtnRegresa: TBitBtn;
    Z2bbtnGraba: TBitBtn;
    Bevel3: TBevel;
    Label11: TLabel;
    dblcCIA: TwwDBLookupCombo;
    dbeCIA: TwwDBEdit;
    Bevel4: TBevel;
    Label12: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    dblcCtaCte: TwwDBLookupCombo;
    dbeCtaCte: TwwDBEdit;
    dblcBanco: TwwDBLookupCombo;
    dbeBanco: TwwDBEdit;
    Bevel5: TBevel;
    Label13: TLabel;
    Label7: TLabel;
    dbdpFIni: TwwDBDateTimePicker;
    Label8: TLabel;
    dbdpFFin: TwwDBDateTimePicker;
    Bevel6: TBevel;
    z2bbtnOKCab: TBitBtn;
    pplblBcoDes: TppLabel;
    pplblMoneda: TppLabel;
    procedure dbgEgrCajaDblClick(Sender: TObject);
    procedure rgEstadoClick(Sender: TObject);
    procedure z2bbtnOKCabClick(Sender: TObject);
    procedure dbdpFIniChange(Sender: TObject);
    procedure dbdpFFinChange(Sender: TObject);
    procedure z2bbtnOkConoClick(Sender: TObject);
    procedure z2bbtnCancelConoClick(Sender: TObject);
    procedure Z2bbtnRegresaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcExist(Sender: TObject);
    procedure chkbtnPendClick(Sender: TObject);
    procedure chkEntreClick(Sender: TObject);
    procedure Z2bbtnGrabaClick(Sender: TObject);
    procedure z2bbtnSalirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Z2bbtnPrintClick(Sender: TObject);
    procedure pprEgrCajaBeforePrint(Sender: TObject);
    procedure pprEgrCajaPreviewFormCreate(Sender: TObject);
    procedure vMntLOCCalc(Sender: TObject; var Value: Variant);
    procedure vMntExtCalc(Sender: TObject; var Value: Variant);
    procedure TotalCTACTESCalc(Sender: TObject; var Value: Variant);
    procedure TotalCTACTEUCalc(Sender: TObject; var Value: Variant);
    procedure ppGFCTABeforePrint(Sender: TObject);
    procedure ppGFBancoBeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure ppSummaryBand1BeforePrint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dblcCIAExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure dblcCtaCteExit(Sender: TObject);
    procedure dblcPERIDExit(Sender: TObject);
    procedure dblcTIPDOCCODExit(Sender: TObject);
    procedure dbdpFIniEnter(Sender: TObject);
    procedure dbdpFFinEnter(Sender: TObject);
    procedure dbdECFCOMPExit(Sender: TObject);
    procedure dbeECPERRECExit(Sender: TObject);
    procedure dbeECPERNDOCExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ppGroupHeaderBand2BeforePrint(Sender: TObject);
  private
    { Private declarations }
    sCIA, sEST, sBCO, sCTAB,
    sFiltro, sPFiltro, sSQL: String;
    dFEI , dFEF            : TDateTime;
    strTmp: String  ;
    xCab : cabecera ;
    procedure dcCIA;
    procedure dcBCO;
    procedure dcCTAB;
  public
    { Public declarations }
    fMonto,
    TotalSolesG, TotalUSDG,
    TotalSolesBCO, TotalUSDBCO,
    TotalSolesCTA, TotalUSDCTA : Double;
  end;

var
  FEntrChqs: TFEntrChqs;

implementation

uses CajaDM;

{$R *.DFM}


procedure TFEntrChqs.dbgEgrCajaDblClick(Sender: TObject);
begin

  if not (DM1.cdsEgrCaja2.State in [dsInsert]) then
    DM1.cdsEgrCaja2.Edit          ;

  if DM1.cdsEgrCaja2.State in [dsEdit] then
  begin
{
    dbeTDOCIDEN.Text := ''        ;
    dblcPERID.Text   := ''        ;
}
{    if (TDate(DM1.cdsEgrCaja2.FieldByName('ECCHKEST').asdatetime )= 0) then
       DM1.cdsEgrCaja2.FieldByName('ECCHKEST').asdatetime := dateS ;
}
    if DM1.cdsEgrCaja2.FieldByName('ECCHKEST').AsString = 'E' then
    begin
      chkbtnEntre.Checked := True ;
    end
    else
    begin
      chkbtnPend.Checked  := True ;
    end ;
    //deshabilitación de resto de paneles
    pnlbotones.enabled   := False ;
    dbgEgrCaja.Enabled   := false ;
    //
    pnlEntrega.Visible    := True ;
    pnlEntrega.BringToFront       ;
    dbdECFCOMP.SetFocus           ;
  end ;

end;

procedure TFEntrChqs.rgEstadoClick(Sender: TObject);
begin
  case rgEstado.ItemIndex of
   0: sEST := 'P';
   1: sEST := 'E';
   2: sEST := '';
  end;
end;

procedure TFEntrChqs.z2bbtnOKCabClick(Sender: TObject);
var
  fsBCO, fsCIA, fsCTAB : String  ;
  xFlag                : Boolean ;
begin
  xFlag := False ;
  if length(sCIA) > 0   then
     fsCIA   := 'CIAID = ''' + sCIA
  else
     fsCIA   := '' ;

  if length(sBCO) > 0   then
     fsBCO   := ''' AND BANCOID='''+sBCO
  else
     fsBCO   := '';

  if length(sCTAB) > 0   then
     fsCTAB  := ''' AND CCBCOID='''+sCTAB
  else
     fsCTAB := '';

  sFiltro := fsCIA+fsBCO+fsCTAB;

  if length(sFiltro) = 0 then
     sFiltro := sFiltro+''' (ECFCOMP >=' +DM1.wRepFuncDate + ''''+FormatDateTime(DM1.wFormatFecha,dFEI)+''') AND ECFCOMP <=' +DM1.wRepFuncDate + ''''+FormatDateTime(DM1.wFormatFecha,dFEF)+'''))'
  else
     sFiltro := sFiltro+''' AND (ECFCOMP >=' +DM1.wRepFuncDate + ''''+FormatDateTime(DM1.wFormatFecha,dFEI)+''') AND ECFCOMP <=' +DM1.wRepFuncDate + ''''+FormatDateTime(DM1.wFormatFecha,dFEF)+'''))'; // fecha de comprobante

  if length(sEST) > 0 then
    if sEST= 'P' then
       sFiltro := sFiltro + ' AND (ECCHKEST='''+sEST+''' OR  ECCHKEST IS NULL)'
    else
       sFiltro := sFiltro + ' AND ECCHKEST='''+sEST+'''';

  sFiltro := sFiltro+ ' AND '+ sPFiltro;

  ////
  if trim(xCab.CIAID) <> '' then
    with xCab do
    begin
       if ( dblcCIA.Text <> CIAID ) or (dblcBanco.Text <> BANCOID) or (dblcCtaCte.Text <> CCBCOID)
          or (rgEstado.ItemIndex <> ESTADO) or (dbdpFIni.date <> FECHAINI ) or ( dbdpFFin.Date <> FECHAFIN ) then
       begin
          if dm1.cdsegrcaja2.RecordCount <> 0 then
          begin
             if (dm1.cdsegrcaja2.ChangeCount>0) or (dm1.cdsEgrCaja2.Modified) then
             begin
                 if MessageDlg('Ha Cambiado los Datos de La Cabecera '+#13+
                            'Y Tiene Detalles no Grabados ' + #13 +
                            '¿Desea Proseguir?',
                             mtConfirmation ,[mbYes,mbNo], 0) = mrNo then
                 begin
                   // Regresar Cabecera Antigua
                    with xCab do
                    begin
                      dblcCIA.Text       := CIAID     ;
                      dbeCIA.Text        := CIADES    ;
                      dblcBanco.Text     := BANCOID   ;
                      dbeBanco.Text      := BANCODES  ;
                      dblcCtaCte.Text    := CCBCOID   ;
                      dbeCtaCte.Text     := CCBCODES  ;
                      rgEstado.ItemIndex := ESTADO    ;
                      dbdpFIni.Date      := FECHAINI  ;
                      dbdpFFin.Date      := FECHAFIN  ;
                    end ;
                 end
                 else
                    xFlag := True ;
             end
             else
                xFlag := True ;
          end
          else
            xFlag := True ;
       end ;
    end
   else
    xFlag := true ;
  ////

  if xFlag then
  begin
     DM1.cdsEgrCaja2.Close ;
     DM1.cdsEgrCaja2.DataRequest(sSQL+' WHERE '+sFiltro) ;
     DM1.cdsEgrCaja2.Open  ;
  end ;

  if DM1.cdsEgrCaja2.RecordCount>0 then
  begin
     plnFiltro.Enabled   := True;
     z2bbtnOKCab.Enabled := True;
     //
     with xCab do
     begin
       CIAID      := dblcCIA.Text        ;
       CIADES     := dbeCIA.Text         ;
       BANCOID    := dblcBanco.Text      ;
       BANCODES   := dbeBanco.Text       ;
       CCBCOID    := dblcCtaCte.Text     ;
       CCBCODES   := dbeCtaCte.Text      ;
       ESTADO     := rgEstado.ItemIndex  ;
       FECHAINI   := dbdpFIni.Date       ;
       FECHAFIN   := dbdpFFin.Date       ;
     end ;
     //
     plnFiltro.Enabled  := False ;
     pnlBotones.Enabled := True  ;
     dbgEgrCaja.Enabled := true  ;
     ActivaBotones(pnlBotones , true) ;
     ActivaBotones(plnFiltro , False) ;     
  end
  else
     Application.MessageBox('No existen registros para los datos seleccionados','Error',MB_OK+MB_ICONWARNING);
end;

procedure TFEntrChqs.dbdpFIniChange(Sender: TObject);
begin
 dFEI := dbdpFIni.Date;
end;

procedure TFEntrChqs.dbdpFFinChange(Sender: TObject);
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

procedure TFEntrChqs.z2bbtnOkConoClick(Sender: TObject);
begin
 //dbgEgrCaja.Enabled := False;

 if dbdECFCOMP.Text='' then
 begin
   Application.MessageBox('Debe ingresar la fecha','Error',MB_OK+MB_ICONERROR);
   Exit;
 end;

 if dblcPERID.Text='' then
 begin
   Application.MessageBox('Debe ingresar la persona responsable','Error',MB_OK+MB_ICONERROR);
   Exit;
 end;

 if dbeECPERREC.Text='' then
 begin
   Application.MessageBox('Debe ingresar la persona receptora','Error',MB_OK+MB_ICONERROR);
   Exit;
 end;

 if dblcTIPDOCCOD.Text='' then
 begin
   Application.MessageBox('Debe ingresar el documento de identidad','Error',MB_OK+MB_ICONERROR);
   Exit;
 end;

 if dbeECPERNDOC.Text='' then
 begin
   Application.MessageBox('Debe ingresar el número de documento','Error',MB_OK+MB_ICONERROR);
   Exit;
 end;

// DM1.cdsEgrCaja2.FieldByName('ECOBS').AsString := dbeOBS.Text;

 pnlEntrega.Visible := False;

 if chkbtnPend.Checked then
    dm1.cdsEgrCaja2.FieldByName('ECCHKEST').AsString := 'P'
 else
    dm1.cdsEgrCaja2.FieldByName('ECCHKEST').AsString := 'E'  ;

 DM1.cdsEgrCaja2.Post;
 Z2bbtnGraba.Enabled := (DM1.cdsEgrCaja2.Modified) or (DM1.cdsEgrCaja2.ChangeCount>0);
 //habilitación de resto de paneles
// plnfiltro.Enabled    := True ;
 pnlbotones.enabled   := True ;
 dbgEgrCaja.Enabled   := True ;
 //

end;

procedure TFEntrChqs.z2bbtnCancelConoClick(Sender: TObject);
begin
 dbePERID.Clear;
 dbeTDOCIDEN.Clear;
 DM1.cdsEgrCaja2.Cancel;
 pnlEntrega.Visible := False;
 //habilitación de resto de paneles
// plnfiltro.Enabled    := True ;
 pnlbotones.enabled   := True ;
 dbgEgrCaja.Enabled   := True ;
 //
 
end;

procedure TFEntrChqs.Z2bbtnRegresaClick( Sender : TObject ) ;
begin
   plnFiltro.Enabled  := True        ;
   pnlBotones.Enabled := False       ;
   dbgEgrCaja.Enabled := False       ;
   ActivaBotones(pnlBotones , False) ;
   ActivaBotones(plnFiltro , true )  ;
end;

procedure TFEntrChqs.dcBCO;
begin
  DM1.cdsBanco.First;
  sBCO := trim(DM1.cdsBanco.FieldByName('BANCOID').AsString);
  dblcBanco.Text := sBCO;
  dblcBanco.Enabled := DM1.cdsBanco.RecordCount > 1;
end;

procedure TFEntrChqs.dcCIA;
begin
  DM1.cdsCIA.First;
  sCIA := trim(DM1.cdsCIA.FieldByName('CIAID').AsString);
  dblcCIA.Text := sCIA;
  dblcCIA.Enabled := DM1.cdsCIA.RecordCount > 1;
end;

procedure TFEntrChqs.dcCTAB;
begin
  DM1.cdsCCBco.First;
  sCTAB := trim(DM1.cdsCCBco.FieldByName('CCBCOID').AsString);
  dblcCtaCte.Text := sCTAB;
  dblcCtaCte.Enabled := DM1.cdsCCBco.RecordCount > 1;
end;

procedure TFEntrChqs.FormCreate(Sender: TObject);
begin
   with xCab do
   begin
     CIAID      := '' ;
     CIADES     := '' ;
     BANCOID    := '' ;
     BANCODES   := '' ;
     CCBCOID    := '' ;
     CCBCODES   := '' ;
     ESTADO     := 0  ;
     FECHAINI   := 0  ;
     FECHAFIN   := 0  ;
   end;

   sSQL := 'SELECT * FROM CAJA302';

   fMonto :=0;
   DM1.cdsBanco.Open;
//   DM1.cdsBanco.IndexFieldNames := 'BANCOID';
   DM1.cdsCCBco.Open;
//   DM1.cdsCCBco.IndexFieldNames := 'CCBCOID';
   DM1.cdsCia.Open;

   dbgEgrCaja.Selected.Add('ECFCOMP'#9'10'#9'Fecha Comp.'#9'F');
   dbgEgrCaja.Selected.Add('ECCHKEST'#9'8'#9'Estado ~Actual'#9'F');
   dbgEgrCaja.Selected.Add('ECNOCHQ'#9'16'#9'Nro. Cheque'#9'F');
   dbgEgrCaja.Selected.Add('ECGIRA'#9'40'#9'Girado a'#9'F');
   dbgEgrCaja.Selected.Add('ECGLOSA'#9'40'#9'Glosa'#9'F');
   dbgEgrCaja.Selected.Add('ECFENTR'#9'10'#9'Fecha~de Entrega'#9'F');
//   dbgEgrCaja.Selected.Add('LK_RESPDES'#9'28'#9'Persona Responsable'#9'F');
   dbgEgrCaja.Selected.Add('ECPERREC'#9'40'#9'Persona Receptora'#9'F');
//   dbgEgrCaja.Selected.Add('LK_TIPDOCDES'#9'20'#9'Documento~de Identidad'#9'F');
   dbgEgrCaja.Selected.Add('ECPERNDOC'#9'15'#9'Nº de Documento'#9'F');
   dbgEgrCaja.Selected.Add('ECMTOORI'#9'13'#9'Monto Origen'#9'F');

   DM1.cdsResponsable.Open;

   DM1.cdsEgrCaja2.Close;
   DM1.cdsEgrCaja2.DataRequest (sSQL+' WHERE CIAID=''''');
   DM1.cdsEgrCaja2.Open;

   DM1.cdsEgrCaja2.IndexFieldNames := 'BANCOID;CCBCOID;ECFCOMP';

   dbdpFIni.Date := DateS - 30;
   dbdpFFin.Date := DateS;

//  sPFiltro := ''+DM1.wReplacCeros+'(ECNOCHQ,'''')<>'''' '; // 12345  caja bancos
//CIM 29/10
// sPFiltro := ''+DM1.wReplacCeros+'(ECNOCHQ,null) is not null '; // 12345  caja bancos
   sPFiltro := ''+DM1.wReplacCeros+'(ECNOCHQ,'''') is not null '; // 12345  caja bancos


   dcCIA;
   dcBCO;
   dcCTAB;
   rgEstadoClick(nil);
end;

procedure TFEntrChqs.dblcNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
  if TwwDBCustomLookupCombo(Sender).Text = '' then Accept := True;

  Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).DataField,NewValue,[]);
  if not Accept then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFEntrChqs.dblcExist(Sender: TObject);
var
 bRq : Boolean;
begin
  if TwwDBCustomLookupCombo(Sender).DataSource <> nil then
    bRq := TwwDBCustomLookupCombo(Sender).DataSource.DataSet.FieldByName(TwwDBCustomLookupCombo(Sender).DataField).Required;

{  if (bRq)  then // and (trim(TwwDBCustomLookupCombo(Sender).Text)='')
    TwwDBCustomLookupCombo(Sender).DropDown;}
end;

procedure TFEntrChqs.chkbtnPendClick(Sender: TObject);
begin
  if DM1.cdsEgrCaja2.State in [dsEdit] then
     DM1.cdsEgrCaja2.FieldByName('ECCHKEST').AsString := 'P';
end;

procedure TFEntrChqs.chkEntreClick(Sender: TObject);
begin
  if DM1.cdsEgrCaja2.State in [dsEdit] then
     DM1.cdsEgrCaja2.FieldByName('ECCHKEST').AsString := 'E';
end;

procedure TFEntrChqs.Z2bbtnGrabaClick(Sender: TObject);
begin
  if (DM1.cdsEgrCaja2.Modified) or (DM1.cdsEgrCaja2.ChangeCount>0) then
     DM1.cdsEgrCaja2.ApplyUpdates(0);
 Z2bbtnGraba.Enabled := (DM1.cdsEgrCaja2.Modified) or (DM1.cdsEgrCaja2.ChangeCount>0);
 z2bbtnOKCabClick(nil);
end;

procedure TFEntrChqs.z2bbtnSalirClick(Sender: TObject);
begin
  if (DM1.cdsEgrCaja2.Modified) or (DM1.cdsEgrCaja2.ChangeCount>0) then
  begin
   if Application.MessageBox('Desea guardar los datos actualizados ?','Error',MB_YESNO+MB_ICONERROR)=IDNO	 then
      Exit;
  end;
  Close;
end;

procedure TFEntrChqs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFEntrChqs.Z2bbtnPrintClick(Sender: TObject);
begin
  if (DM1.cdsEgrCaja2.Modified) or (DM1.cdsEgrCaja2.ChangeCount>0) then
  begin
   if Application.MessageBox('Desea guardar los datos actualizados ántes de imprimir?','Error',MB_YESNO+MB_ICONERROR)=IDNO	 then
      Exit;
  end;
  dbpplEgrCaja.DataSource := dm1.dsEgrCaja2 ;
	 //JCC: 24/06/2002
	pprEgrCaja.TEMPLATE.FileName := wRutaRpt + '\ChqEntregado.Rtm';
  pprEgrCaja.template.LoadFromFile ;
  pprEgrCaja.Print                          ;
  dbpplEgrCaja.DataSource := nil            ;
end;

procedure TFEntrChqs.pprEgrCajaBeforePrint(Sender: TObject);
begin
  pplFDesde.Caption := FormatDateTime('dd/mm/yyyy',dFEI );
  pplFHasta.Caption := FormatDateTime('dd/mm/yyyy',dFEF );
  pplEstado.Caption := rgEstado.Items[rgEstado.ItemIndex];
  TotalSolesG   := 0;
  TotalUSDG     := 0;

  TotalSolesBCO := 0;
  TotalUSDBCO   := 0;

  TotalSolesCTA := 0;
  TotalUSDCTA   := 0;

end;

procedure TFEntrChqs.pprEgrCajaPreviewFormCreate(Sender: TObject);
begin
  TppReport(Sender).PreviewForm.WindowState:=WsMaximized;
  TppViewer(TppReport(Sender).PreviewForm.Viewer).ZoomSetting:=zsPageWidth;
end;

procedure TFEntrChqs.vMntLOCCalc(Sender: TObject; var Value: Variant);
begin
  if DM1.cdsEgrCaja2.FieldByName('TMONID').AsString = DM1.wTMonLoc  then
  begin
    Value := DM1.cdsEgrCaja2.FieldByName('ECMTOLOC').AsFloat;
    TotalSolesCTA  := TotalSolesCTA + Value;
    TotalSolesG   := TotalSolesG + Value;
  end
  else
    Value := 0;
end;

procedure TFEntrChqs.vMntExtCalc(Sender: TObject; var Value: Variant);
begin
 if DM1.cdsEgrCaja2.FieldByName('TMONID').AsString = DM1.wTMonExt then
 begin
   Value       := DM1.cdsEgrCaja2.FieldByName('ECMTOEXT').AsFloat;
   TotalUSDCTA := TotalUSDCTA + Value;
   TotalUSDG    := TotalUSDG + Value;
 end
 else
   Value := 0;
end;

procedure TFEntrChqs.TotalCTACTESCalc(Sender: TObject; var Value: Variant);
begin
if DM1.cdsEgrCaja2.FieldByName('TMONID').AsString = DM1.wTMonLoc  then
begin
   Value         :=  TotalSolesCTA;
   TotalSolesBCO := TotalSolesBCO + TotalSolesCTA;
 end
 else
   Value := 0;
end;

procedure TFEntrChqs.TotalCTACTEUCalc(Sender: TObject; var Value: Variant);
begin
if DM1.cdsEgrCaja2.FieldByName('TMONID').AsString = DM1.wTMonExt  then
begin
   Value        := TotalUSDCTA;
   TotalUSDBCO  := TotalUSDBCO + Value;
 end
 else
   Value := 0;
end;

procedure TFEntrChqs.ppGFBancoBeforePrint(Sender: TObject);
begin
  TotalBCOS.Value := TotalSolesBCO;
  TotalBCOU.Value := TotalUSDBCO;
end;

procedure TFEntrChqs.ppGroupHeaderBand1BeforePrint(Sender: TObject);
var
 xDescrip : String;
begin
  TotalSolesBCO := 0;
  TotalUSDBCO   := 0;
  xDescrip := 'BANCOID='+quotedstr(ppDBText2.text);
  pplblBcoDes.Caption := dm1.DisplayDescrip('prvTGE','TGE105','BANCONOM',xDescrip,'BANCONOM');
end;

procedure TFEntrChqs.ppGFCTABeforePrint(Sender: TObject);
begin
  TotalUSDCTA    := 0;
  TotalSolesCTA  := 0;
end;


procedure TFEntrChqs.ppSummaryBand1BeforePrint(Sender: TObject);
begin
  TotalGL.Value := TotalSolesG;
  TotalGE.Value := TotalUSDG;

  TotalSolesG   := 0;
  TotalUSDG     := 0;
end;

procedure TFEntrChqs.FormDestroy(Sender: TObject);
begin
  dm1.cdsBanco.Filter   := ''    ;
  DM1.cdsBanco.Filtered := False ;
end;

procedure TFEntrChqs.dblcCIAExit(Sender: TObject);
begin
  sCIA := dblcCIA.Text;
  dbeCIA.Text := DM1.cdsCia.FieldByName('CIADES').AsString;
end;

procedure TFEntrChqs.dblcBancoExit(Sender: TObject);
begin
 sBCO := dblcBanco.Text;
 dbeBanco.Text := DM1.cdsBanco.FieldByName('BANCONOM').AsString;

 if sBCO = '' then
 begin
   DM1.cdsCCBco.Filtered := False;
   dblcCtaCte.Enabled    := False;
   dbeBanco.Text := '';
   dblcCtaCte.Text := '';
   dbeCtaCte.Text := '';
   Exit;
 end;

 DM1.cdsCCBco.Filtered := False;
 DM1.cdsCCBco.Filter   := 'BANCOID='''+sBCO+'''';
 DM1.cdsCCBco.Filtered := True;
 dcCTAB;
end;

procedure TFEntrChqs.dblcCtaCteExit(Sender: TObject);
begin
  sCTAB := dblcCtaCte.Text;
  if sCTAB = '' then
  begin
   dbeCtaCte.Text := '';
   Exit;
  end;
  dbeCtaCte.Text := DM1.cdsCCBco.FieldByName('CCBCODES').AsString;
end;

procedure TFEntrChqs.dblcPERIDExit(Sender: TObject);
begin
   dm1.xxExit(dblcPERID,dbePERID,[] ,'Persona Responsable');
  dbePERID.Text := DM1.cdsResponsable.FieldByName('PERDES').AsString;
end;

procedure TFEntrChqs.dblcTIPDOCCODExit(Sender: TObject);
begin
   dbeTDOCIDEN.Text:= DM1.DisplayDescripLocal(DM1.cdsQry3,'TIPDOCCOD',dblcTIPDOCCOD.Text,'TIPDOCDES') ;
end;

procedure TFEntrChqs.dbdpFIniEnter(Sender: TObject);
begin
  strtmp := trim(dbdpFIni.text)
end;

procedure TFEntrChqs.dbdpFFinEnter(Sender: TObject);
begin
   strtmp := trim(dbdpFIni.Text) ;
end;

procedure TFEntrChqs.dbdECFCOMPExit(Sender: TObject);
begin
   If Button1.Focused Then Exit;
   If z2bbtnCancelCono.Focused Then Exit;
   If dbdECFCOMP.text = '' then
//   if TwwDBDateTimePicker(Sender).date = 0 then
    begin
      ShowMessage('Ingrese Fecha de entrega a Proveedor') ;
      TwwDBDateTimePicker(Sender).SetFocus ;
    end ;
end;

procedure TFEntrChqs.dbeECPERRECExit(Sender: TObject);
begin
    if trim(TCustomEdit(Sender).text) = '' then
    begin
       Showmessage('Ingrese Persona Receptora') ;
       TCustomEdit(Sender).SetFocus             ;
    end ;
end;

procedure TFEntrChqs.dbeECPERNDOCExit(Sender: TObject);
begin
    if trim(TCustomEdit(Sender).text) = '' then
    begin
       Showmessage('Ingrese Numero de Documento') ;
       TCustomEdit(Sender).SetFocus               ;
    end ;
end;

procedure TFEntrChqs.FormActivate(Sender: TObject);
var
   xSQL : String;
begin
    dblcCIA.OnExit(dblcCIA);
    dblcBanco.OnExit(dblcBanco);
    dblcCtaCte.OnExit(dblcCtaCte);

    xSQL:='Select * from TGE159';
    DM1.cdsQry3.Close;
    DM1.cdsQry3.DataRequest( xSQL );
    DM1.cdsQry3.open;
end;

procedure TFEntrChqs.ppGroupHeaderBand2BeforePrint(Sender: TObject);
var
 xDescrip : String;
begin
   xDescrip := 'TMONID='+quotedstr(dm1.cdsEgrCaja2.fieldbyname('TMONID').AsString);
   pplblMoneda.Caption := dm1.DisplayDescrip('prvTGE','TGE103','TMONABR',xDescrip,'TMONABR');
end;

end.

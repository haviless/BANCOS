unit Caja708;

// Actualizaciones
// HPC_201403_CAJA cambia control de diseño de reporte

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Mask, wwdbedit, wwdblook, Buttons, wwdbdatetimepicker,
  Wwdbdlg, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppCache, ppDB, ppTypes,
  ppBands, ppCtrls, ppVar, ppPrnabl, ppParameter, ppEndUsr, ppDBPipe, ppviewr, db;

type
  TFToolPagoProv = class(TForm)
    pnl: TPanel;
    Z2bbtnPrint: TBitBtn;
    grbBCO: TGroupBox;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TwwDBEdit;
    gbCia: TGroupBox;
    dblcCIA: TwwDBLookupCombo;
    dbeCIA: TwwDBEdit;
    z2bbtnOK: TBitBtn;
    gbFecha: TGroupBox;
    dbdtpFIni: TwwDBDateTimePicker;
    dbdtpFFin: TwwDBDateTimePicker;
    gbProveedor: TGroupBox;
    dblcCCBco: TwwDBLookupCombo;
    dbeCtaCte: TwwDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    lblAux: TLabel;
    dblcClase: TwwDBLookupCombo;
    dblcdAux: TwwDBLookupComboDlg;
    edtClase: TEdit;
    Label3: TLabel;
    ppdbPagoProv: TppDBPipeline;
    pprPagoProv: TppReport;
    lblProvRuc: TLabel;
    edtAuxRuc: TEdit;
    lblProvDes: TLabel;
    dbeGiradoA: TwwDBEdit;
    chkTodos: TCheckBox;
    ppd1: TppDesigner;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    pplblCiaDes: TppLabel;
    pplblProv: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel11: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLabel13: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLine4: TppLine;
    ppLabel21: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand1: TppFooterBand;
    cbDisenoRep: TCheckBox;
    sbDisenoRep: TSpeedButton;
    procedure z2bbtnOKClick(Sender: TObject);
    procedure dblcClaseExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure Z2bbtnPrintClick(Sender: TObject);
    procedure dblcCIAExit(Sender: TObject);
    procedure dblcdAuxExit(Sender: TObject);
    procedure chkTodosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure pprPagoProvPreviewFormCreate(Sender: TObject);
    procedure dblcCIANotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure sbDisenoRepClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FToolPagoProv: TFToolPagoProv;

implementation

uses CajaDM, oaTE4000;

{$R *.DFM}

procedure TFToolPagoProv.z2bbtnOKClick(Sender: TObject);
var
  sSQL : string;
begin
   if Length(Trim(dblcCIA.text))=0 then
      raise exception.Create('Ingrese Compañia');

   if chkTodos.Checked= False then
   begin
       if Length(Trim(dblcClase.text))=0 then
          raise exception.Create('Ingrese Clase de Auxiliar');

       if Length(Trim(dblcdAux.text))=0 then
          raise exception.Create('Ingrese Proveedor');
   end;

   if dbdtpFIni.Date=0 then
      raise exception.Create('Ingrese Fecha Inicial');

   if dbdtpFFin.Date=0 then
      raise exception.Create('Ingrese Fecha Final');


   if (dbdtpFIni.Date>dbdtpFFin.Date) then
      raise exception.Create('La Fecha Inicial no puede ser mayor a la Inicial');


   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
   begin
   sSQL := ' SELECT A.CPNOREG,A.TDIARID,A.ECANOMM,A.ECNOCOMP,A.CLAUXID,A.PROV,B.ECFCOMP,A.DOCID2,A.CPSERIE,A.CPNODOC,'+
           ' A.CPFEMIS,B.FPAGOID,B.BANCOID,B.ECNOCHQ,B.ECFEMICH,A.TMONID,A.DETCPAG,A.DEMTOORI ,            '+
           ' C.BANCOABR, D.FPAGOABR, E.TMONABR, F.DOCABR '+
           ' FROM CAJA303 A INNER  JOIN CAJA302 B ON (B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID    '+
                                              '  AND B.ECANOMM=A.ECANOMM AND B.ECNOCOMP=A.ECNOCOMP)'+
           ' LEFT JOIN TGE105 C ON (C.BANCOID=B.BANCOID) '+
           ' LEFT JOIN TGE112 D ON (D.FPAGOID=B.FPAGOID) '+
           ' LEFT JOIN TGE103 E ON (E.TMONID=A.TMONID)   '+
           ' LEFT JOIN TGE110 F ON (F.DOCID=A.DOCID2 AND F.DOCMOD=''CXP'' '+
           ' WHERE (A.CIAID='+Quotedstr(dblcCIA.text);
           if chkTodos.Checked= False then
              sSQL:= sSQL+ ' AND A.CLAUXID='+Quotedstr(dblcClase.Text)
                         + ' AND A.PROV='+Quotedstr(dblcdAux.Text);
           sSQL:= sSQL+')'+
                       ' AND (B.CIAID='+Quotedstr(dblcCIA.text)+

                       ' AND B.ECFCOMP>='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFIni.date)+''')'+
                       ' AND B.ECFCOMP<='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFFin.date)+''')'+
                       ' AND B.ECESTADO=''C'')';
           if Length(Trim(dblcBanco.Text))>0 then
              sSQL := sSQL+ 'AND BANCOID='+Quotedstr(dblcBanco.Text);

           sSQL := sSQL+' UNION ALL '+
           ' SELECT A.CPNOREG,A.TDIARID,A.ECANOMM,A.ECNOCOMP,A.CLAUXID,A.PROV,B.ECFCOMP,A.DOCID2,A.CPSERIE,A.CPNODOC,'+
           ' A.CPFEMIS,B.FPAGOID,B.BANCOID,B.ECNOCHQ,B.ECFEMICH, A.TMONID,A.DETCPAG,A.DEMTOORI ,        '+
           ' C.BANCOABR, D.FPAGOABR, E.TMONABR, F.DOCABR '+           
           ' FROM CAJA301 A INNER  JOIN CAJA302 B ON (B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID    '+
                                            '  AND B.ECANOMM=A.ECANOMM AND B.ECNOCOMP=A.ECNOCOMP)'+
           ' LEFT JOIN TGE105 C ON (C.BANCOID=B.BANCOID) '+
           ' LEFT JOIN TGE112 D ON (D.FPAGOID=B.FPAGOID) '+
           ' LEFT JOIN TGE103 E ON (E.TMONID=A.TMONID)   '+
           ' LEFT JOIN TGE110 F ON (F.DOCID=A.DOCID2 AND F.DOCMOD=''CXP'' '+
           ' WHERE (A.CIAID='+Quotedstr(dblcCIA.text);
           if chkTodos.Checked= False then
              sSQL := sSQL+' AND A.CLAUXID='+Quotedstr(dblcClase.Text)+
                           ' AND A.PROV='+Quotedstr(dblcdAux.Text);

           sSQL:= sSQL+')'+
                       ' AND (B.CIAID='+Quotedstr(dblcCIA.text)+
                       ' AND B.ECFCOMP>='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFIni.date)+''')'+
                       ' AND B.ECFCOMP<='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFFin.date)+''')'+
                       ' AND B.ECESTADO=''C'')';
           if Length(Trim(dblcBanco.Text))>0 then
              sSQL := sSQL+ 'AND BANCOID='+Quotedstr(dblcBanco.Text);
   end
   else
      if (DMTE.SRV_D = 'ORACLE')then
      begin
         {
         sSQL:='SELECT A.CPNOREG, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, B.ECFCOMP, A.DOCID2, '
              +  'A.CPSERIE, A.CPNODOC, A.CPFEMIS, B.FPAGOID, B.BANCOID, B.ECNOCHQ, B.ECFEMICH, A.TMONID, '
              +  'A.DETCPAG, A.DEMTOORI, C.BANCOABR, D.FPAGOABR, E.TMONABR, F.DOCABR '
              +'FROM CAJA303 A ,CAJA302 B, TGE105 C , TGE112 D, TGE103 E, TGE110 F '
              +'WHERE ( B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID AND B.ECANOMM=A.ECANOMM AND B.ECNOCOMP=A.ECNOCOMP ) '
              + ' AND (A.CIAID='+Quotedstr(dblcCIA.text);

         if chkTodos.Checked= False then
            sSQL:=sSQL+' AND A.CLAUXID='+Quotedstr(dblcClase.Text)+' AND A.PROV='+Quotedstr(dblcdAux.Text);

         sSQL:=sSQL+')'
              +' AND (B.CIAID='+Quotedstr(dblcCIA.text)
              +' AND B.ECFCOMP>='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFIni.date)+''')'
              +' AND B.ECFCOMP<='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFFin.date)+''')'
              +' AND B.ECESTADO=''C'')';

         if Length(Trim(dblcBanco.Text))>0 then
            sSQL := sSQL+ 'AND BANCOID='+Quotedstr(dblcBanco.Text);

         sSQL:=sSQL+' AND (B.BANCOID=C.BANCOID(+)) AND (B.FPAGOID=D.FPAGOID(+) ) AND (A.TMONID=E.TMONID(+) ) AND (A.DOCID2=F.DOCID(+) AND F.DOCMOD=''CXP'') ';

         sSQL:=sSQL+' UNION ALL '
              +'SELECT A.CPNOREG, A.TDIARID, A.ECANOMM, A.ECNOCOMP, A.CLAUXID, A.PROV, B.ECFCOMP, '
              +  'A.DOCID2, A.CPSERIE, A.CPNODOC, A.CPFEMIS, B.FPAGOID, B.BANCOID, B.ECNOCHQ, B.ECFEMICH, '
              +  'A.TMONID, A.DETCPAG, A.DEMTOORI, C.BANCOABR, D.FPAGOABR, ETMONABR, F.DOCABR '
              +'FROM CAJA301 A ,CAJA302 B ,TGE105 C, TGE112 D ,TGE103 E, TGE110 F'
              +'WHERE (B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID AND B.ECANOMM=A.ECANOMM AND B.ECNOCOMP=A.ECNOCOMP)'
              +  'AND (A.CIAID='+Quotedstr(dblcCIA.text);
         if chkTodos.Checked= False then
            sSQL:=sSQL+' AND A.CLAUXID='+Quotedstr(dblcClase.Text)+' AND A.PROV='+Quotedstr(dblcdAux.Text);

         sSQL:=sSQL+')'
              +' AND (B.CIAID='+Quotedstr(dblcCIA.text)
              +' AND B.ECFCOMP>='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFIni.date)+''')'
              +' AND B.ECFCOMP<='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFFin.date)+''')'
              +' AND B.ECESTADO=''C'')';

         if Length(Trim(dblcBanco.Text))>0 then
            sSQL := sSQL+ 'AND BANCOID='+Quotedstr(dblcBanco.Text);

         sSQL:=sSQL+' AND (B.BANCOID=C.BANCOID(+)) AND (B.FPAGOID=D.FPAGOID(+) ) AND (A.TMONID=E.TMONID(+) ) AND (A.DOCID2=F.DOCID(+) AND F.DOCMOD=''CXP'')';
         }
         sSQL:='SELECT ''PROVISIONADOS'' TIPO, A.CPNOREG, A.TDIARID, A.ECANOMM, A.ECNOCOMP, B.CLAUXID, B.PROV, B.ECFCOMP, A.DOCID2, '
              +  'A.CPSERIE, A.CPNODOC, A.CPFEMIS, B.FPAGOID, B.BANCOID, B.ECNOCHQ, B.ECFEMICH, A.TMONID, '
              +  'A.DETCPAG, A.DEMTOORI, C.BANCOABR, D.FPAGOABR, E.TMONABR, F.DOCABR, B.ECGLOSA, '' '' DEGLOSA '
              +'FROM CAJA302 B, CAJA303 A ,TGE105 C , TGE112 D, TGE103 E, TGE110 F '
              +'WHERE B.CIAID='   +Quotedstr(dblcCIA.text)+' AND B.ECESTADO=''C'' '
              +  'AND B.ECFCOMP>='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFIni.date)+''') '
              +  'AND B.ECFCOMP<='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFFin.date)+''') ';

         if chkTodos.Checked= False then
            sSQL:=sSQL+' AND B.CLAUXID='+Quotedstr(dblcClase.Text)+' AND B.PROV='+Quotedstr(dblcdAux.Text);

         sSQL:=sSQL+' AND ( B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID AND B.ECANOMM=A.ECANOMM AND B.ECNOCOMP=A.ECNOCOMP ) ';

         if Length(Trim(dblcBanco.Text))>0 then
            sSQL := sSQL+ 'AND B.BANCOID='+Quotedstr(dblcBanco.Text);

         sSQL:=sSQL+' AND B.BANCOID=C.BANCOID(+) AND B.FPAGOID=D.FPAGOID(+) AND A.TMONID=E.TMONID(+) AND A.DOCID2=F.DOCID(+) AND F.DOCMOD(+)=''CXP''';

         sSQL:=sSQL+' UNION ALL '
              +'SELECT ''NO PROVISIONADOS'' TIPO, A.CPNOREG, A.TDIARID, A.ECANOMM, A.ECNOCOMP, B.CLAUXID, B.PROV, B.ECFCOMP, '
              +  'A.DOCID2, A.CPSERIE, A.CPNODOC, A.CPFEMIS, B.FPAGOID, B.BANCOID, B.ECNOCHQ, B.ECFEMICH, '
              +  'A.TMONID, A.DETCPAG, A.DEMTOORI, C.BANCOABR, D.FPAGOABR, E.TMONABR, F.DOCABR, B.ECGLOSA, A.DEGLOSA '
              +'FROM CAJA302 B, CAJA301 A, TGE105 C, TGE112 D, TGE103 E, TGE110 F '
              +'WHERE B.CIAID='   +Quotedstr(dblcCIA.text)+' AND B.ECESTADO=''C'' '
              +  'AND B.ECFCOMP>='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFIni.date)+''') '
              +  'AND B.ECFCOMP<='+DMTE.wRepFuncDate+''''+formatdatetime(DMTE.wFormatFecha,dbdtpFFin.date)+''') ';

         if chkTodos.Checked= False then
            sSQL:=sSQL+' AND B.CLAUXID='+Quotedstr(dblcClase.Text)+' AND B.PROV='+Quotedstr(dblcdAux.Text);

         sSQL:=sSQL+' AND ( B.CIAID=A.CIAID AND B.TDIARID=A.TDIARID AND B.ECANOMM=A.ECANOMM AND B.ECNOCOMP=A.ECNOCOMP ) ';

         if Length(Trim(dblcBanco.Text))>0 then
            sSQL := sSQL+ 'AND B.BANCOID='+Quotedstr(dblcBanco.Text);

         sSQL:=sSQL+' AND B.BANCOID=C.BANCOID(+) AND B.FPAGOID=D.FPAGOID(+) AND A.TMONID=E.TMONID(+) AND A.DOCID2=F.DOCID(+) AND F.DOCMOD(+)=''CXP''';
      end;
                                    
   FConsulta.xFiltroRep.UsuarioSQL.Clear;
   FConsulta.xFiltroRep.UsuarioSQL.Add(sSQL) ;
   FConsulta.xFiltroRep.NewQuery;
end;

procedure TFToolPagoProv.dblcClaseExit(Sender: TObject);
var
   xSQL : string;
begin
//   if chkTodos.Focused then Exit;
   edtClase.text:= DMTE.DisplayDescripLocal(DMTE.cdsClaseAux,'CLAUXID',dblcClase.Text,'CLAUXDES') ;

   if edtClase.Text='' then begin
      dblcdAux.Text  := '' ;
      ShowMessage('Error : Clase de Auxiliar');
      dblcClase.SetFocus;
      Exit;
   end;

   xSQL:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+'''';
   DMTE.cdsAux.IndexFieldnames := '';
   DMTE.cdsAux.Filter :='';
   DMTE.cdsAux.Filtered := False;
   DMTE.cdsAux.Close;
   DMTE.cdsAux.DataRequest( xSQL ) ;
   DMTE.cdsAux.Open;

   dblcdAux.Enabled := tRUE;
   dblcdAux.setfocus;


   dblcdAux.Selected.Clear;
   dblcdAux.Selected.Add('AUXID'#9'12'#9'Auxiliar'#9'F');
   dblcdAux.Selected.Add('AUXRUC'#9'12'#9'R.U.C'#9'F');
   dblcdAux.Selected.Add('AUXABR'#9'15'#9'Abreviatura'#9'F');
   dblcdAux.Selected.Add('AUXNOMB'#9'40'#9'Nombre Auxiliar'#9'F');
//   dblcdAux.LookupTable := DMTE.cdsAux;
//   dblcdAux.LookupField := 'AUXID';
end;

procedure TFToolPagoProv.dblcBancoExit(Sender: TObject);
begin
  if dblcCia.Focused then Exit;

  edtBanco.text:=DMTE.DisplayDescripLocal(DMTE.cdsBancoEgr,'BANCOID',dblcBanco.Text,'BANCOABR') ;

{  if edtBanco.Text='' then begin
     dblcBanco.Value:= '';
     edtBanco.Text  := '';
     ShowMessage('Error : Banco no Valido');
     dblcBanco.SetFocus;
     Exit;
  end;}

  dblcCCBco.Text:= '' ;
  if DMTE.cdsbancoegr.FieldByName('BCOTIPCTA').Value='C' then
  begin //Si es CAJA
     dblcCCBco.Enabled:=False;
  end
  else begin  //Si es BANCO
     dblcCCBco.Enabled:=True;
     DMTE.cdsCCBco.Filtered:=False;
     DMTE.cdsCCBco.Filter:='';   //Filtrar la lista de CtaCte por Banco
     DMTE.cdsCCBco.Filter:='BANCOID='+''''+dblcBanco.Text+''''+' AND CIAID='+quotedstr(dblcCia.text);
     DMTE.cdsCCBco.Filtered:=True;
     //filtrar los tipos de pago
     dblcCCBco.setfocus;
  end;

end;

procedure TFToolPagoProv.Z2bbtnPrintClick(Sender: TObject);
begin
   FConsulta.xFiltroRep.FMant.cds2.Last;
   DMTE.cdsQry.Data:=FConsulta.xFiltroRep.FMant.cds2.Data;

   if DMTE.cdsQry.RecordCount= 0 then
      raise exception.Create('No existe Información a Mostrar');

   ppdbPagoProv.DataSource := DMTE.dsQry;

   pprPagoProv.TEMPLATE.FileName := wRutaRpt + '\PagoxProv.Rtm';
   pprPagoProv.TEMPLATE.LoadFromFile;
   pplblCiaDes.Caption := dbeCIA.Text;
   pplblProv.Caption   := dblcdAux.Text+ ' '+dbeGiradoA.Text;

// Inicio HPC_201403_CAJA
// cambia control de diseño de reporte
   if cbDisenoRep.Checked then
   begin
      ppd1.ShowModal;
   end
   else
   begin
      pprPagoProv.Print;
      pprPagoProv.Stop;
   end;
// Fin HPC_201403_CAJA
end;

procedure TFToolPagoProv.dblcCIAExit(Sender: TObject);
begin
  if dblcCIA.text<>'' then
    dbeCIA.text:=DMTE.cdsCia.FieldByName('CIADES').AsString;

end;

procedure TFToolPagoProv.dblcdAuxExit(Sender: TObject);
var
  xAuxt : string;
begin
   if dblcClase.Focused    then Exit ;

   xAuxt:= DMTE.DisplayDescripLocal(DMTE.cdsAux,'AUXID',dblcdAux.Text,'AUXID') ;

   if xAuxt='' then begin
                  dblcdAux.Text  := '' ;
                  edtAuxRUC.Text := '' ;
                  dbeGiradoA.Text:= '' ;
                  ShowMessage('Error : Auxiliar No Valido');
                  dblcdAux.SetFocus;
                  Exit;
   end;

   edtAuxRUC.Text := DMTE.cdsAux.FieldByName('AUXRUC').AsString;
   if DMTE.cdsAux.FieldByName('AUXGIRA').AsString='' then
                  dbeGiradoA.Text := DMTE.cdsAux.FieldByName('AUXNOMB').Asstring
   else
                  dbeGiradoA.Text := DMTE.cdsAux.FieldByName('AUXGIRA').Asstring ;
   if dbdtpFIni.Enabled then
      dbdtpFIni.SetFocus;               

end;

procedure TFToolPagoProv.chkTodosClick(Sender: TObject);
begin
  if chkTodos.Checked then
  begin
     dblcClase.Enabled  := False;
     dblcdAux.Enabled   := False;
     lblAux.Enabled     := False;
     lblProvRuc.Enabled := False;
     lblProvDes.Enabled := False;
     dblcClase.Text     := '';
     dblcdAux.Text      := '';
     edtClase.Text      := '';
     edtAuxRuc.Text     := '';
     dbeGiradoA.Text    := '';

  end
  else
  begin
     dblcClase.Enabled  := True;
     dblcdAux.Enabled   := True;
     lblAux.Enabled     := True;
     lblProvRuc.Enabled := True;
     lblProvDes.Enabled := True;

  end;
end;

procedure TFToolPagoProv.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

procedure TFToolPagoProv.pprPagoProvPreviewFormCreate(Sender: TObject);
begin
  pprPagoProv.PreviewForm.ClientHeight := 580;
  pprPagoProv.PreviewForm.ClientWidth := 780;			// ppViewr
  tppviewer(pprPagoProv.PreviewForm.Viewer).zoomSetting := zspageWidth;
end;

procedure TFToolPagoProv.dblcCIANotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFToolPagoProv.sbDisenoRepClick(Sender: TObject);
begin
// Inicio HPC_201403_CAJA
   cbDisenoRep.Checked := not cbDisenoRep.Checked;
// Fin HPC_201403_CAJA
end;

end.

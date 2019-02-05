Unit CAJA704A;
// INICIO USO DE ESTANDARES : 01/08/2011
// UNIDAD                   : Caja704A
// FORMULARIO               : FSaldoCaja
// FECHA DE CREACION        :
// AUTOR                    : Ricardo Medina Zavaleta
// OBJETIVO                 : Reporte de Saldo de Caja
//
// HPC_201401_CAJA  14/04/2014  - Creación de Formulario

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, StdCtrls, Mask, wwdbedit, Buttons, ExtCtrls, ComCtrls, wwdblook, DB,
   Grids, Wwdbigrd, Wwdbgrid, ppEndUsr, ppDB, ppDBPipe, ppComm, ppRelatv,
   ppProd, ppClass, ppReport, ppCtrls, ppBands, ppVar, ppPrnabl, ppCache,
   ppParameter;

Type
   TFSaldoCaja = Class(TForm)
      dblcCia: TwwDBLookupCombo;
      edtCia: TEdit;
      Label1: TLabel;
      dblcCaja: TwwDBLookupCombo;
      edtCaja: TEdit;
      Label6: TLabel;
      Label7: TLabel;
      edtFecha: TDateTimePicker;
      bbtnOk: TBitBtn;
      GroupBox1: TGroupBox;
      dbgEgresosNoProvisionados: TwwDBGrid;
      pnlRendicion: TPanel;
      lblTitulo: TLabel;
      dbgRendicion: TwwDBGrid;
      BitBtn1: TBitBtn;
      BitBtn2: TBitBtn;
      SpeedButton1: TSpeedButton;
      RepSaldFondFijo: TppReport;
      dbp1: TppDBPipeline;
      pd1: TppDesigner;
      cbDisenoRep: TCheckBox;
      ppParameterList1: TppParameterList;
      ppHeaderBand1: TppHeaderBand;
      ppShape1: TppShape;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppImage1: TppImage;
      ppLabel11: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel12: TppLabel;
      ppLabel13: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      pplblFecha: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppDBText2: TppDBText;
      ppDBText1: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText9: TppDBText;
      ppLine1: TppLine;
      ppLine2: TppLine;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppDBText11: TppDBText;
      ppLabel14: TppLabel;
      ppFooterBand1: TppFooterBand;
      ppSummaryBand1: TppSummaryBand;
      ppShape2: TppShape;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppShape3: TppShape;
      ppShape4: TppShape;
      ppLabel15: TppLabel;
      ppLabel16: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      pplblMontoBase: TppLabel;
      pplblSaldo: TppLabel;
      pplblMontoReponer: TppLabel;
      pplblFechaAl: TppLabel;
      Procedure FormShow(Sender: TObject);
      Procedure bbtnOkClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormActivate(Sender: TObject);
      Procedure dbgEgresosNoProvisionadosDrawDataCell(Sender: TObject;
         Const Rect: TRect; Field: TField; State: TGridDrawState);
      Procedure dbgEgresosNoProvisionadosCalcCellColors(Sender: TObject;
         Field: TField; State: TGridDrawState; Highlight: Boolean;
         AFont: TFont; ABrush: TBrush);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure dblcCajaExit(Sender: TObject);
      Procedure FormKeyPress(Sender: TObject; Var Key: Char);
      Procedure dbgEgresosNoProvisionadosDblClick(Sender: TObject);
      Procedure BitBtn1Click(Sender: TObject);
      Procedure dbgEgresosNoProvisionadosDrawFooterCell(Sender: TObject;
         Canvas: TCanvas; FooterCellRect: TRect; Field: TField;
         FooterText: String; Var DefaultDrawing: Boolean);
      Procedure dbgRendicionDrawFooterCell(Sender: TObject; Canvas: TCanvas;
         FooterCellRect: TRect; Field: TField; FooterText: String;
         Var DefaultDrawing: Boolean);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure SpeedButton1Click(Sender: TObject);
   Private
    { Private declarations }
      Procedure actualizafoot;
      Procedure actualizafoot2;
   Public
      sCuentaCajaChica: String;
    { Public declarations }
   End;

Var
   FSaldoCaja: TFSaldoCaja;

Implementation
Uses CajaDM;
{$R *.dfm}

Procedure TFSaldoCaja.FormShow(Sender: TObject);
Var
   xSql, sSql, xWhere: String;
Begin

   sSQL := 'Select * from TGE105 where BCOTIPCTA =' + QuotedStr('C');
   DMTE.cds1.Close;
   DMTE.cds1.ProviderName := 'prvQry2';
   DMTE.cds1.DataRequest(sSQL);
   DMTE.cds1.Open;

   edtFecha.Date := DateS;
   dblcCia.LookupTable := DMTE.cdsCia;
   dblcCia.Text := '02';
   edtCia.text := DMTE.DisplayDescripLocal(DMTE.cdsCia, 'CIAID', dblcCia.Text, 'CIADES');

   sSQL := 'Select BANCOID, BANCONOM, CUENTAID from TGE105 where FLACAJCHI=''S''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(sSQL);
   DMTE.cdsQry.Open;

   dblcCaja.LookupTable := DMTE.cds1;
   dblcCaja.Text := DMTE.cdsQry.FieldByname('BANCOID').AsString;
   edtCaja.Text := DMTE.DisplayDescripLocal(DMTE.cds1, 'BANCOID', dblcCaja.Text, 'BANCONOM');
   edtFecha.SetFocus;

End;

Procedure TFSaldoCaja.bbtnOkClick(Sender: TObject);
Var
   vSQL, xSQL, xWhere: String;
   sMonBase, sMonSaldo: double;
Begin

   If dblcCia.Text = '' Then
   Begin
      ShowMessage('Debe Ingresar Compañía');
      dblcCia.SetFocus;
      Exit;
   End;

   If dblcCaja.Text = '' Then
   Begin
      ShowMessage('Debe Ingresar la Caja');
      dblcCaja.SetFocus;
      Exit;
   End;

   vSQL := ' SELECT A.CIAID, NULL CPTOID, NULL CPTODES, NULL TDIARID,NULL TDIARDES,NULL ECANOMM, '
          +'        ''0000000000''ECNOCOMP,null comprobante, NULL CLAUXID, NULL PROV,NULL ECFCOMP, '
          +'        NULL FPAGOID, NULL FPAGODES, NULL DOCID,  NULL DOCDES, NULL ECNODOC, NULL TMONID,0 ECMTOORI, '
          +'        NULL BANCOID, NULL BANCONOM, NULL CCBCOID,NULL ECNOCHQ,NULL ECGIRA,  NULL ECGLOSA, NULL ECNOREPO,'
          +'        STSALDOINIC SALINI, null INGRESO,null EGRESO, null SALFIN '
          +'   FROM CAJA310 A '
          +'  WHERE A.STFECHA=' + QuotedStr(DateToStr(edtFecha.Date))
          +'    AND A.CIAID=' + QuotedStr(dblcCia.Text)
          +'    AND BANCOID=' + QuotedStr(dblcCaja.Text)
          +' UNION ALL '
          +' SELECT A.CIAID,A.CPTOID,B.CPTODES,A.TDIARID,C.TDIARDES,A.ECANOMM,'
          +'        A.ECNOCOMP,A.ECNOCOMP comprobante ,A.CLAUXID,A.PROV,A.ECFCOMP, '
          +'        A.FPAGOID,F.FPAGODES,A.DOCID,'
          +'        case when (A.EC_PROCE=''1'' and A.BANCOID<>' + QuotedStr(dblcCaja.Text)+' and A.DOCID=''38'' and A.CPTOID=''EG0001'') '
          +'             then ''Reposición de Fondo Fijo '' '
          +'             else D.DOCDES END DOCDES, '
          +'        A.ECNODOC,A.TMONID,A.ECMTOORI, '
          +'        A.BANCOID,E.BANCONOM,A.CCBCOID,A.ECNOCHQ,A.ECGIRA,A.ECGLOSA,A.ECNOREPO,'
          +'        null SALINI, '
          +'        CASE WHEN (A.ECFPAGOP IS NOT NULL AND A.EC_PROCE=''1'' AND A.BANCOID<>' + QuotedStr(dblcCaja.Text) + ' AND A.DOCID=''38'' AND A.CPTOID=''EG0001'') OR (A.EC_PROCE=''I'' AND A.BANCOID=' + QuotedStr(dblcCaja.Text) + ' AND  A.CPTOID=''EG0001'' )  '
          +'             THEN ECMTOORI END INGRESO,'
          +'        CASE WHEN (A.EC_PROCE=''1'' AND A.BANCOID=' + QuotedStr(dblcCaja.Text) + ')  '
          +'             THEN A.ECMTOORI END EGRESOS, null SALFIN '
          +'  FROM CAJA302 A, CAJA201 B, TGE104 C, TGE110 D, TGE105 E, TGE112 F '
          +' WHERE A.CIAID=' + QuotedStr(dblcCia.Text)
          +'   AND ((A.ECFCOMP=' + QuotedStr(DateToStr(edtFecha.Date))
          +'         AND NOT (A.EC_PROCE=''1'' AND A.BANCOID<>' + QuotedStr(dblcCaja.Text)
                           +' AND A.DOCID=''38'' AND A.CPTOID=''EG0001'')) '
          +'         or A.ECFPAGOP=' + QuotedStr(DateToStr(edtFecha.Date)) + ') '
          +'   AND A.ECESTADO=''C'' '
          +'   AND A.FPAGOID<>''03'' '
          +'   AND ((A.BANCOID=' + QuotedStr(dblcCaja.Text) + ') OR '
          +'        ( (A.EC_PROCE=''1'' AND A.BANCOID<>' + QuotedStr(dblcCaja.Text)
          +'                            AND A.DOCID=''38'' AND A.CPTOID=''EG0001'') OR '
          +'          (A.EC_PROCE=''I'' AND A.BANCOID=' + QuotedStr(dblcCaja.Text) + ' AND  A.CPTOID=''EG0001'' ) ) ) '
          +'   AND A.CPTOID=B.CPTOID(+) '
          +'   AND A.TDIARID=C.TDIARID(+) '
          +'   AND A.DOCID=D.DOCID(+) '
          +'   AND (DOCMOD=''CAJA'' OR DOCMOD=''CXP'') '
          +'   AND A.BANCOID=E.BANCOID(+) '
          +'   AND A.FPAGOID=F.FPAGOID(+) '
          +' UNION ALL '
          +' SELECT A.CIAID,A.CPTOID,B.CPTODES,A.TDIARID,C.TDIARDES,A.ECANOMM,'
          +'        A.ECNOCOMP,A.ECNOCOMP comprobante ,A.CLAUXID,A.PROV,A.DEFCOMP  ECFCOMP,'
          +'        NULL FPAGOID,''Rendición en EFECTIVO'' FPAGODES,A.DOCID2 DOCID,D.DOCDES, '
          +'        CPNODOC ECNODOC,A.TMONID,A.DEMTOORI ECMTOORI,'
          +'        NULL BANCOID, NULL BANCONOM,NULL CCBCOID,NULL ECNOCHQ, null ECGIRA, DEGLOSA,A.ECNOREPO,'
          +'        NULL SALINI,DEMTOORI INGRESO,NULL EGRESOS, NULL SALFIN '
          +'   FROM CAJA301 A, CAJA201 B, TGE104 C, TGE110 D '
          +'  WHERE A.CIAID=' + QuotedStr(dblcCia.Text)
          +'    AND A.TDIARID=''07'' '
          +'    AND A.DEFCOMP=' + QuotedStr(DateToStr(edtFecha.Date))
          +'    AND A.CUENTAID=''10202'' '
          +'    AND NVL(A.DEESTADO,''C'')<>''A'' '
          +'    AND A.CPTOID=B.CPTOID(+) '
          +'    AND A.TDIARID=C.TDIARID(+) '
          +'    AND (A.DOCID2=D.DOCID(+) AND D.DOCMOD(+)=''CAJA'') '
          +' UNION ALL '
          +' SELECT A.CIAID, NULL CPTOID, NULL CPTODES, '
          +'        NULL TDIARID, NULL TDIARDES,NULL ECANOMM,''9999999999'' ECNOCOMP, null COMPROBANTE, '
          +'        NULL CLAUXID, NULL PROV, NULL ECFCOMP, NULL FPAGOID, NULL FPAGODES, '
          +'        NULL DOCID, NULL DOCDES, NULL ECNODOC, NULL TMONID, 0ECMTOORI, '
          +'        NULL BANCOID, NULL BANCONOM, NULL CCBCOID, NULL ECNOCHQ, NULL ECGIRA, NULL ECGLOSA, NULL ECNOREPO, '
          +'        null SALINI, null INGRESO, null EGRESO, STSALDOFIN SALFIN '
          +'   FROM CAJA310 A '
          +'  WHERE A.STFECHA=' + QuotedStr(DateToStr(edtFecha.Date))
          +'    AND A.CIAID=' + QuotedStr(dblcCia.Text)
          +'    AND A.BANCOID=' + QuotedStr(dblcCaja.Text)
          +'  ORDER BY ECNOCOMP ';
   DMTE.cdsOPago.Close;
   DMTE.cdsOPago.DataRequest(vSQL);
   DMTE.cdsOPago.Open;
   TNumericField(DMTE.cdsOPago.FieldByName('SALINI')).DisplayFormat := '#,##0.00';
   TNumericField(DMTE.cdsOPago.FieldByName('INGRESO')).DisplayFormat := '#,##0.00';
   TNumericField(DMTE.cdsOPago.FieldByName('EGRESO')).DisplayFormat := '#,##0.00';
   TNumericField(DMTE.cdsOPago.FieldByName('SALFIN')).DisplayFormat := '#,##0.00';
   actualizafoot;

   //aqui recupero el monto base del fondo fijo y el ultimo saldo
   xSQL := 'Select MONBASE From TGE106 where Bancoid=''' + dblcCaja.Text + ''' AND CIAID=''' + dblcCia.Text + ''' ';
   DMTE.cdsQry1.Close;
   DMTE.cdsQry1.DataRequest(xSql);
   DMTE.cdsQry1.Open;
   If DMTE.cdsQry1.RecordCount > 0 Then
      sMonBase := DMTE.cdsQry1.fieldbyname('MONBASE').AsFloat
   Else
      sMonBase := 0.00;

   xSql := 'SELECT A.STFECHA, A.STSALDOFIN '
          +'  FROM (SELECT STFECHA,STSALDOFIN '
          +'          FROM CAJA310 A '
          +'         WHERE CIAID='+quotedstr(dblcCia.Text)
          +'           AND BANCOID='+quotedstr(dblcCaja.Text)
          +'           AND STFECHA<=TRUNC(SYSDATE) '
          +'         order by STFECHA DESC ) A '
          +' WHERE ROWNUM=1 ';
   DMTE.cdsQry1.Close;
   DMTE.cdsQry1.DataRequest(xSql);
   DMTE.cdsQry1.Open;
   If DMTE.cdsQry1.RecordCount > 0 Then
      sMonSaldo := DMTE.cdsQry1.fieldbyname('STSALDOFIN').AsFloat
   Else
      sMonSaldo := 0.00;

   RepSaldFondFijo.Template.FileName := wRutaRpt + '\ReporteFondoFijo.rtm';
   RepSaldFondFijo.Template.LoadFromFile;

   If (sMonBase - sMonSaldo) >= (sMonBase / 2) Then
   Begin
      RepSaldFondFijo.Footer.Visible := True;
      pplblSaldo.Caption := FormatFloat('###,###.00', sMonSaldo);
      pplblMontoBase.Caption := FormatFloat('###,###.00', sMonBase);
      pplblMontoReponer.Caption := FormatFloat('###,###.00', sMonBase - sMonSaldo);
      pplblFechaAl.Caption := 'AL ' + DMTE.cdsQry1.fieldbyname('STFECHA').AsString;

   End
   Else
      RepSaldFondFijo.Footer.Visible := False;

  { xWhere:='STFECHA ='+QuotedStr(DateToStr(edtFecha.Date))
          +' And CIAID ='+QuotedStr(dblcCia.Text)
          +' And BANCOID ='+QuotedStr(dblcCaja.Text);

      xSQL:='Select STSALDOINIC, STTOTING, STTOTEGR, STSALDOFIN from CAJA310 where '+xWhere;
      DMTE.cdsOPago.Close;
      DMTE.cdsOPago.DataRequest( xSQL );
      DMTE.cdsOPago.Open;
      Beep;
      TNumericField( DMTE.cdsOPago.FieldByName( 'STSALDOINIC'  ) ).DisplayFormat:='#,##0.00';
      TNumericField( DMTE.cdsOPago.FieldByName( 'STTOTING'  ) ).DisplayFormat:='#,##0.00';
      TNumericField( DMTE.cdsOPago.FieldByName( 'STTOTEGR'  ) ).DisplayFormat:='#,##0.00';

      TNumericField( DMTE.cdsOPago.FieldByName( 'STSALDOFIN'  ) ).DisplayFormat:='#,##0.00';
      pnlCierre.Visible:=True; }

End;

Procedure TFSaldoCaja.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin

   DMTE.cdsOPago.Close;
   DMTE.cdsOPago.IndexFieldNames := '';
   dblcCia.LookupTable := Nil;
   dblcCaja.LookupTable := Nil;

End;

Procedure TFSaldoCaja.FormActivate(Sender: TObject);
Begin
   dbgEgresosNoProvisionados.Selected.Add('DOCDES'#9'20'#9'Documento');
   dbgEgresosNoProvisionados.Selected.Add('ECNODOC'#9'06'#9'N°.Doc.');
   dbgEgresosNoProvisionados.Selected.Add('FPAGODES'#9'9'#9'Forma~Pago');
   dbgEgresosNoProvisionados.Selected.Add('ECGLOSA'#9'20'#9'Glosa');
   dbgEgresosNoProvisionados.Selected.Add('SALINI'#9'8'#9'Saldo~Inicial');
   dbgEgresosNoProvisionados.Selected.Add('INGRESO'#9'8'#9'Ingreso');
   dbgEgresosNoProvisionados.Selected.Add('EGRESO'#9'8'#9'Egreso');
   dbgEgresosNoProvisionados.Selected.Add('SALFIN'#9'8'#9'Saldo~Final');
   dbgEgresosNoProvisionados.Selected.Add('ECGIRA'#9'20'#9'Girado');
   dbgEgresosNoProvisionados.Selected.Add('comprobante'#9'8'#9'Comprobante');
   dbgEgresosNoProvisionados.DataSource := DMTE.dsOPago;

   dbgRendicion.Selected.Add('CPNOREG'#9'10'#9'Registro');
   dbgRendicion.Selected.Add('CPSERIE'#9'04'#9'Serie');
   dbgRendicion.Selected.Add('CPNODOC'#9'8'#9'N°.Doc.');
   dbgRendicion.Selected.Add('DEFCOMP'#9'10'#9'Fec.Doc.');
   dbgRendicion.Selected.Add('DEMTOORI'#9'8'#9'Importe');
   dbgRendicion.Selected.Add('DEGLOSA'#9'20'#9'Glosa');
   dbgRendicion.Selected.Add('ECGLOSA'#9'20'#9'Glosa2');
   dbgRendicion.DataSource := DMTE.dsQry4;
End;

Procedure TFSaldoCaja.dbgEgresosNoProvisionadosDrawDataCell(
   Sender: TObject; Const Rect: TRect; Field: TField;
   State: TGridDrawState);
Begin

   If (Field.DisplayName = 'Saldo~Inicial') Or (Field.DisplayName = 'Saldo~Final') Then
   Begin
      dbgEgresosNoProvisionados.Canvas.Brush.Color := $00D2FFFF;
      dbgEgresosNoProvisionados.DefaultDrawDataCell(Rect, Field, State);
   End;

   If (Field.DisplayName = 'Ingreso') Then
   Begin
      dbgEgresosNoProvisionados.Canvas.Brush.Color := $00BBFFBB;
      dbgEgresosNoProvisionados.DefaultDrawDataCell(Rect, Field, State);
   End;

   If (Field.DisplayName = 'Egreso') Then
   Begin
      dbgEgresosNoProvisionados.Canvas.Brush.Color := $00C6C6FF;
      dbgEgresosNoProvisionados.DefaultDrawDataCell(Rect, Field, State);
   End;

End;

Procedure TFSaldoCaja.dbgEgresosNoProvisionadosCalcCellColors(
   Sender: TObject; Field: TField; State: TGridDrawState;
   Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin

   If Highlight Then
   Begin
      If (Field.DisplayName = 'Saldo~Inicial') Or
         (Field.DisplayName = 'Saldo~Final') Or
         (Field.DisplayName = 'Ingreso') Or
         (Field.DisplayName = 'Egreso') Then
         AFont.Color := clBlack;
   End;

End;

Procedure TFSaldoCaja.actualizafoot;
Var
   VIngresos, VEgrasos, VSalIni, VSalFin: Currency;
   B: TBookmark;
Begin
 //Guardo la posicion
   B := DMTE.cdsOPago.GetBookmark;
   DMTE.cdsOPago.DisableControls;
   DMTE.cdsOPago.First;
   VIngresos := 0;
   VEgrasos := 0;
   VSalIni := 0;
   VSalFin := 0;
   While Not DMTE.cdsOPago.Eof Do
   Begin
      VIngresos := VIngresos + DMTE.cdsOPago.FIELDBYNAME('Ingreso').ASCURRENCY;
      VEgrasos := VEgrasos + DMTE.cdsOPago.FIELDBYNAME('Egreso').ASCURRENCY;
      VSalIni := VSalIni + DMTE.cdsOPago.FIELDBYNAME('SalIni').ASCURRENCY;
      VSalFin := VSalFin + DMTE.cdsOPago.FIELDBYNAME('SalFin').ASCURRENCY;
      DMTE.cdsOPago.Next;
   End;

   dbgEgresosNoProvisionados.ColumnByName('Ingreso').FooterValue := FormatCurr('##,###,##0.#0', VIngresos);
   dbgEgresosNoProvisionados.ColumnByName('Egreso').FooterValue := FormatCurr('##,###,##0.#0', VEgrasos);
   dbgEgresosNoProvisionados.ColumnByName('SalIni').FooterValue := FormatCurr('##,###,##0.#0', VSalIni);
   dbgEgresosNoProvisionados.ColumnByName('SalFin').FooterValue := FormatCurr('##,###,##0.#0', VSalFin);

  //Me posiciono nuevamente en el posicion marcada
   DMTE.cdsOPago.GotoBookmark(B);
   DMTE.cdsOPago.EnableControls;
   DMTE.cdsOPago.FreeBookmark(B);
End;

Procedure TFSaldoCaja.dblcCiaExit(Sender: TObject);
Begin
   edtCia.Text := DMTE.cdsCia.FieldByName('CIADES').AsString;
End;

Procedure TFSaldoCaja.dblcCajaExit(Sender: TObject);
Begin
   edtCaja.Text := DMTE.cds1.FieldByName('BANCONOM').AsString;
End;

Procedure TFSaldoCaja.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
   If key = #13 Then
   Begin
      key := #0;
      perform(CM_DialogKey, VK_TAB, 0);
   End;
End;

Procedure TFSaldoCaja.dbgEgresosNoProvisionadosDblClick(Sender: TObject);
Var
   xSql: String;
Begin
   xSql := 'Select * '
          +'  From CAJA302 '
          +' Where CIAID=''' + DMTE.cdsOPago.Fieldbyname('CIAID').AsString + ''' '
          +'   AND TDIARID=''' + DMTE.cdsOPago.Fieldbyname('TDIARID').AsString + ''' '
          +'   AND PROV=''' + DMTE.cdsOPago.Fieldbyname('PROV').AsString + ''' '
          +'   AND DOCID=''' + DMTE.cdsOPago.Fieldbyname('DOCID').AsString + ''' '
          +'   AND ECNODOC=''' + DMTE.cdsOPago.Fieldbyname('ECNODOC').AsString + ''' '
          +'   AND ECFCOMP>=to_date(sysdate)-30 '
          +'   AND EC_PROCE = ''I'' and ECESTADO = ''C'' ';
   DMTE.cdsQry4.Close;
   DMTE.cdsQry4.DataRequest(xSql);
   DMTE.cdsQry4.Open;

   If DMTE.cdsQry4.RecordCount > 0 Then
   Begin
      xSql := ' SELECT CPNOREG, CPSERIE, CPNODOC, DEFCOMP, DEMTOORI, ECGLOSA, DEGLOSA '
             +'   FROM CAJA301 '
             +'  WHERE CIAID=''' + DMTE.cdsQry4.Fieldbyname('CIAID').AsString + ''' '
             +'    AND TDIARID=''' + DMTE.cdsQry4.Fieldbyname('TDIARID').AsString + ''' '
             +'    AND ECNOCOMP=''' + DMTE.cdsQry4.Fieldbyname('ECNOCOMP').AsString + ''' '
             +'    AND ECANOMM=''' + DMTE.cdsQry4.Fieldbyname('ECANOMM').AsString + ''' '
             +'  ORDER BY CPNOREG ';
      DMTE.cdsQry4.Close;
      DMTE.cdsQry4.DataRequest(xSql);
      DMTE.cdsQry4.Open;
      TNumericField(DMTE.cdsQry4.FieldByName('DEMTOORI')).DisplayFormat := '#,##0.00';

      If DMTE.cdsQry4.RecordCount > 0 Then
      Begin
         dbgRendicion.DataSource := DMTE.dsQry4;
         pnlRendicion.Visible := True;
      End;
      actualizafoot2;
   End;

End;

Procedure TFSaldoCaja.BitBtn1Click(Sender: TObject);
Begin
   pnlRendicion.Visible := False;
End;

Procedure TFSaldoCaja.actualizafoot2;
Var
   VIngresos: Currency;
   B: TBookmark;
Begin
 //Guardo la posicion
   B := DMTE.cdsQry4.GetBookmark;
   DMTE.cdsQry4.DisableControls;
   DMTE.cdsQry4.First;
   VIngresos := 0;

   While Not DMTE.cdsQry4.Eof Do
   Begin
      VIngresos := VIngresos + DMTE.cdsQry4.FIELDBYNAME('DEMTOORI').ASCURRENCY;
      DMTE.cdsQry4.Next;
   End;

   dbgRendicion.ColumnByName('DEMTOORI').FooterValue := FormatCurr('##,###,##0.#0', VIngresos);
  //Me posiciono nuevamente en el posicion marcada
   DMTE.cdsQry4.GotoBookmark(B);
   DMTE.cdsQry4.EnableControls;
   DMTE.cdsQry4.FreeBookmark(B);
End;

Procedure TFSaldoCaja.dbgEgresosNoProvisionadosDrawFooterCell(
   Sender: TObject; Canvas: TCanvas; FooterCellRect: TRect; Field: TField;
   FooterText: String; Var DefaultDrawing: Boolean);
Begin

   If (Field.DisplayName = 'Ingreso') Then
   Begin
      dbgEgresosNoProvisionados.Canvas.Brush.Color := $00BBFFBB;
   End;

   If (Field.DisplayName = 'Egreso') Then
   Begin
      dbgEgresosNoProvisionados.Canvas.Brush.Color := $00C6C6FF;
   End;

   If (Field.DisplayName = 'Saldo~Inicial') Or (Field.DisplayName = 'Saldo~Final') Then
   Begin
      dbgEgresosNoProvisionados.Canvas.Brush.Color := $00D2FFFF;
   End;

End;

Procedure TFSaldoCaja.dbgRendicionDrawFooterCell(Sender: TObject;
   Canvas: TCanvas; FooterCellRect: TRect; Field: TField;
   FooterText: String; Var DefaultDrawing: Boolean);
Begin
   If (Field.DisplayName = 'Importe') Then
   Begin
      dbgRendicion.Canvas.Brush.Color := $00C6C6FF;
   End;
End;

Procedure TFSaldoCaja.BitBtn2Click(Sender: TObject);
Var
   xsql: String;
   xSaldoFinal, xEgresos, xIngresos: Double;

Begin

   If Not DiaAperturado(dblcCia.Text, edtFecha.Date, dblcCaja.Text) Then
   Begin
      exit;
   End;

   DMTE.cdsOPago.DisableControls;
   DMTE.cdsOPago.First;
   xSaldoFinal := 0;
   xEgresos := 0;
   xIngresos := 0;
   While Not DMTE.cdsOPago.Eof Do
   Begin
      xSaldoFinal := xSaldoFinal + DMTE.cdsOPago.Fieldbyname('SALINI').AsFloat + DMTE.cdsOPago.Fieldbyname('INGRESO').AsFloat - DMTE.cdsOPago.Fieldbyname('EGRESO').AsFloat;
      xEgresos := xEgresos + DMTE.cdsOPago.Fieldbyname('EGRESO').AsFloat;
      xIngresos := xIngresos + DMTE.cdsOPago.Fieldbyname('INGRESO').AsFloat;
      DMTE.cdsOPago.Next;
   End;
   DMTE.cdsOPago.EnableControls;

   DMTE.DCOM1.AppServer.IniciaTransaccion;
   XSQL := 'UPDATE CAJA310 A SET STSALDOFIN=' + FloatToStr(xSaldoFinal) + ',STTOTING=' + FloatToStr(xIngresos) + ',STTOTEGR=' + FloatToStr(xEgresos) +
      ' WHERE A.STFECHA=' + QuotedStr(DateToStr(edtFecha.Date)) + ' AND A.CIAID=' + QuotedStr(dblcCia.Text) + ' AND BANCOID=' + QuotedStr(dblcCaja.Text);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      bbtnOkClick(Self);
   Except
      ShowMessage('Error al intentar grabar los Saldos');
      DMTE.DCOM1.AppServer.RetornaTransaccion;
      Exit;
   End;

End;

Procedure TFSaldoCaja.SpeedButton1Click(Sender: TObject);
Begin
   pplblFecha.Caption := 'Fecha ' + DateToStr(edtFecha.DateTime);
   If cbDisenoRep.Checked Then
      pd1.ShowModal
   Else
   Begin
//      RepSaldFondFijo.Template.FileName := wRutaRpt + '\ReporteFondoFijo.rtm';
//      RepSaldFondFijo.Template.LoadFromFile;
      RepSaldFondFijo.Print;
      RepSaldFondFijo.Stop;
   End;
End;

End.


Unit CAJA710;

// Actualizaciones
// HPC_201312_CAJA   23/12/2013    Automatización de los recibos de Ingresos en las filiales por las ventas y por devoluciones de cuenta a rendir.
// HPC_201404_CAJA   23/09/2014    Modificación cuenta contable en los abonos automáticos de cadena de hoteles cuando
//                                 los cobros son realizados en caja Central.

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Mask, wwdbedit, StdCtrls, wwdblook, Buttons, ComCtrls, ExtCtrls,
   ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
   ppBands, ppCache, wwdbdatetimepicker, db, DBClient, wwclient, oaContabiliza;

Type
   TFToolIngresos = Class(TForm)
      pnl: TPanel;
      gbPeriodo: TGroupBox;
      Label3: TLabel;
      lblCIA: TLabel;
      bbtnPrevio: TBitBtn;
      dbeCIA: TEdit;
      dbeUsuario: TwwDBEdit;
      Label1: TLabel;
      bbtnCierre: TBitBtn;
      bbtnCuadre: TBitBtn;
      ppdb1: TppDBPipeline;
      ppr1: TppReport;
      ppd1: TppDesigner;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      dtpFecha: TwwDBDateTimePicker;
      bbtnApertura: TBitBtn;
      dblcCia: TwwDBLookupCombo;
      BitBtn2: TBitBtn;
      Z2bbtnCont: TBitBtn;
      bbtnImprimeConta: TBitBtn;
      ppdb2: TppDBPipeline;
      cbDiseno: TCheckBox;
      SpeedButton1: TSpeedButton;
      Procedure bbtnPrevioClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnCuadreClick(Sender: TObject);
      Procedure bbtnCierreClick(Sender: TObject);
      Procedure bbtnAperturaClick(Sender: TObject);
      Procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
         NewValue: String; Var Accept: Boolean);
      Procedure dblcCiaExit(Sender: TObject);
      Procedure BitBtn2Click(Sender: TObject);
      Procedure Z2bbtnContClick(Sender: TObject);
      Procedure bbtnImprimeContaClick(Sender: TObject);
      Procedure SpeedButton1Click(Sender: TObject);

   Private
    { Private declarations }
      cdsCIAID: TwwClientDataset;
      wCptoGan,
         wCptoPer,
         wCtaGan,
         wCtaPer: String;
      xNReg: Integer;
      cAnoMM: String;
      Procedure GeneraComp;
      Procedure GeneraComp2;
      Procedure GeneraComp3;
      Procedure AsignaCompaDocs;
      Procedure RecCptosDifC;
      Procedure Contabiliza;
      Procedure Contabiliza2;
      Procedure Contabiliza3;
      Procedure Contab_IngCaja(cDH, cCuenta, cGlosa: String);
      Procedure Contab_IngCaja_3(cCia, cDH, cCuenta, cGlosa: String);
      Procedure Contab_Doc;
      Procedure Contab_Doc3;
      Procedure AnulaComprobante(cCia, cTD, cAM, cNC: String);

   Public
    { Public declarations }

   End;

Var
   FToolIngresos: TFToolIngresos;
   xCtaCliFilial : String; // HPC_201404_CAJA

Implementation

{$R *.dfm}

Uses CajaDM, oaTE2000;

Procedure TFToolIngresos.bbtnPrevioClick(Sender: TObject);
Var
   xSQL, cSQL: String;
Begin

   xSQL := 'Select * From CAJ_USU_SUP where USUSUP=''' + DMTE.wUsuario + ''' or USUCAJ=''' + DMTE.wUsuario + '''';

   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.RecordCount = 0 Then
   Begin
      ShowMessage('Usuario No Registrado para Esta Opcion');
      Exit;
   End;

   If DMTE.wAdmin = 'U' Then
   Begin
      xSQL := 'Select A.CIAID, B.CIADES, A.BANCOID, C.BANCONOM, DOCID, CCSERIE, CCNODOC, '
            + '       CCFEMIS, A.TMONID, NCOMTOORI, NCOMTOLOC, NCOMTOEXT, CLIEID, A.CLAUXID, '
            + '       CCNOMB, A.CPTOID, A.CCGLOSA, A.NCOUSER, A.NCOUSER||'' - ''||D.USERNOM USUARIO, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonLoc + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTMN, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonExt + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTME, '
            + '       NCOHREG, NCOFREG, D.USERNOM,  ''Cajero(a) : ''||D.USERNOM CAJERO, FECANU, '
            + '       CASE WHEN NCOESTADO=''A'' THEN ''ANULADO'' ELSE '''' END ESTADO, OBSANU '
            + '  from CXC303 A, TGE101 B, TGE105 C, TGE006 D '
            + ' where A.CIAID=''' + dblcCIA.text + ''' '
            + '   and CCFEMIS=''' + DateToStr(dtpFecha.date) + ''' '
            + '   and NCOUSER=''' + DMTE.wUsuario + ''' '
            + '   and A.CIAID=B.CIAID(+) AND A.BANCOID=C.BANCOID(+) '
            + '   and A.NCOUSER=D.USERID(+) '
            + ' order by CCNODOC';

      cSQL := 'Select A.CIAID, B.CIADES, A.BANCOID, C.BANCONOM, DOCID, CCSERIE, CCNODOC, '
            + '       CCFEMIS, A.TMONID, NCOMTOORI, NCOMTOLOC, NCOMTOEXT, CLIEID, A.CLAUXID, '
            + '       CCNOMB, A.CPTOID, A.CCGLOSA, A.NCOUSER, A.NCOUSER||'' - ''||D.USERNOM USUARIO, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonLoc + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTMN, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonExt + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTME, '
            + '       NCOHREG, NCOFREG, D.USERNOM,  ''Cajero(a) : ''||D.USERNOM CAJERO, A.USUANU, FECANU, '
            + '       CASE WHEN NCOESTADO=''A'' THEN ''ANULADO'' ELSE '''' END ESTADO, OBSANU '
            + '  from CXC303 A, TGE101 B, TGE105 C, TGE006 D '
            + ' where A.CIAID=''' + dblcCIA.text + ''' '
            + '   and CCFEMIS=''' + DateToStr(dtpFecha.date) + ''' '
            + '   and NCOUSER=''' + DMTE.wUsuario + ''' AND NCOESTADO=''A'' '
            + '   and A.CIAID=B.CIAID(+) AND A.BANCOID=C.BANCOID(+) '
            + '   and A.USUANU=D.USERID(+) '
            + ' order by CCNODOC';
   End
   Else
   Begin
      xSQL := 'Select A.CIAID, B.CIADES, A.BANCOID, C.BANCONOM, DOCID, CCSERIE, CCNODOC, '
            + '       CCFEMIS, A.TMONID, NCOMTOORI, NCOMTOLOC, NCOMTOEXT, CLIEID, A.CLAUXID, '
            + '       CCNOMB, A.CPTOID, A.CCGLOSA, A.NCOUSER, A.NCOUSER||'' - ''||D.USERNOM USUARIO, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonLoc + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTMN, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonExt + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTME, '
            + '       NCOHREG, NCOFREG, D.USERNOM, '
            + '       CASE WHEN NCOESTADO=''A'' THEN ''ANULADO'' ELSE '''' END ESTADO, OBSANU '
            + '  from CXC303 A, TGE101 B, TGE105 C, TGE006 D, CAJ_USU_SUP E '
            + ' where A.CIAID=''' + dblcCIA.text + ''' '
            + '   and CCFEMIS=''' + DateToStr(dtpFecha.date) + ''' '
            + '   and A.CIAID=B.CIAID(+) AND A.BANCOID=C.BANCOID(+) '
            + '   and A.NCOUSER=D.USERID(+) '
            + '   and E.USUSUP=''' + DMTE.wUsuario + ''' AND A.NCOUSER=E.USUCAJ '
            + ' order by CCNODOC';

      cSQL := 'Select A.CIAID, B.CIADES, A.BANCOID, C.BANCONOM, DOCID, CCSERIE, CCNODOC, '
            + '       CCFEMIS, A.TMONID, NCOMTOORI, NCOMTOLOC, NCOMTOEXT, CLIEID, A.CLAUXID, '
            + '       CCNOMB, A.CPTOID, A.CCGLOSA, A.NCOUSER, A.NCOUSER||'' - ''||D.USERNOM USUARIO, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonLoc + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTMN, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonExt + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTME, '
            + '       NCOHREG, NCOFREG, D.USERNOM, A.USUANU, FECANU, '
            + '       CASE WHEN NCOESTADO=''A'' THEN ''ANULADO'' ELSE '''' END ESTADO, OBSANU '
            + '  from CXC303 A, TGE101 B, TGE105 C, TGE006 D, CAJ_USU_SUP E '
            + ' where A.CIAID=''' + dblcCIA.text + ''' '
            + '   and CCFEMIS=''' + DateToStr(dtpFecha.date) + ''' AND NCOESTADO=''A''  '
            + '   and A.CIAID=B.CIAID(+) AND A.BANCOID=C.BANCOID(+) '
            + '   and A.USUANU=D.USERID(+) '
            + '   and E.USUSUP=''' + DMTE.wUsuario + ''' AND A.NCOUSER=E.USUCAJ '
            + ' order by CCNODOC';
   End;

   DMTE.cdsQry4.Close;
   DMTE.cdsQry4.DataRequest(cSQL);
   DMTE.cdsQry4.Open;

   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   ppdb1.DataSource := DMTE.dsReporte;
   ppdb2.DataSource := DMTE.dsQry4;

   If DMTE.wAdmin = 'U' Then
      ppr1.TEMPLATE.FileName := wRutaRpt + '\IngresosPrevio.Rtm'
   Else
      ppr1.TEMPLATE.FileName := wRutaRpt + '\IngresosPrevioADM.Rtm';

   ppr1.template.LoadFromFile;

   ppd1.Report := ppr1;

   If cbDiseno.Checked Then
      ppd1.ShowModal
   Else
      ppr1.Print;

   ppr1.Stop;
   ppd1.Report := Nil;
   ppdb1.DataSource := Nil;
   ppdb2.DataSource := Nil;
End;

Procedure TFToolIngresos.FormCreate(Sender: TObject);
Begin
   cdsCIAID := TwwClientdataset.Create(Self);
   cdsCIAID.CloneCursor(DMTE.cdsCia, True);
   dblcCia.LookUpTable := cdsCIAID;
   cdsCIAID.SetKey;
   cdsCIAID.FieldByname('CIAID').AsString := '02';
   cdsCIAID.GotoKey;
   dblcCia.Text := '02';
   dbeCia.Text := DMTE.DisplayDescrip('prvTGE', 'TGE101', 'CIAID, CIADES', 'CIAID=' + quotedstr(dblcCia.Text), 'CIADES');
   dtpFecha.Date := Date;
   dbeUsuario.Text := DMTE.wUsuario;
End;

Procedure TFToolIngresos.bbtnCuadreClick(Sender: TObject);
Var
   xSQL, cUsers, cSQL, cUsuarios, cCaja: String;
Begin

   xSQL := 'Select * From CAJ_USU_SUP where USUSUP=''' + DMTE.wUsuario + '''';

   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.RecordCount > 0 Then
   Begin

      cCaja := DMTE.cdsReporte.FieldByName('USUARIO').AsString;

    // para Saber cuales son los Usuario
      xSQL := 'SELECT USUCAJ FROM CAJ_USU_SUP A WHERE USUARIO=''' + cCaja + ''' group by USUCAJ';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      cUsuarios := '';
      While Not DMTE.cdsReporte.Eof Do
      Begin
         cUsuarios := cUsuarios + '''' + DMTE.cdsReporte.FieldByname('USUCAJ').AsString + ''', ';
         DMTE.cdsReporte.Next;
      End;
      If cUsuarios = '' Then
      Begin
         ShowMessage('Supervisor no Tiene Usuario Asignados');
         Exit;
      End;

      cUsuarios := Copy(cUsuarios, 1, length(cUsuarios) - 2);

      xSQL := 'Select USUCAJ from CAJ_LOG_ING '
            + ' Where CIAID=''' + dblcCia.Text + ''' '
            + '   and FECOPE=''' + DateToStr(dtpFecha.Date) + ''' '
            + '   and USUCAJ in ( ' + cUsuarios + ' ) '
            + '   and ESTADO=''I'' '
            + ' group by USUCAJ';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If DMTE.cdsReporte.RecordCount > 0 Then
      Begin
         cUsers := '';
         While Not DMTE.cdsReporte.Eof Do
         Begin
            cUsers := cUsers + DMTE.cdsReporte.FieldByName('USUCAJ').AsString + #13 + '';
            DMTE.cdsReporte.Next;
         End;
         ShowMessage('Cajeros que no han cerrado Caja' + #13 + #13 + cUsers);
         Exit;
      End;
      xSQL := 'Select A.CIAID, B.CIADES, A.BANCOID, C.BANCONOM, DOCID, CCSERIE, CCNODOC, '
            + '       CCFEMIS, A.TMONID, NCOMTOORI, NCOMTOLOC, NCOMTOEXT, CLIEID, A.CLAUXID, '
            + '       CCNOMB, A.CPTOID, A.CCGLOSA, A.NCOUSER, A.NCOUSER||'' - ''||D.USERNOM USUARIO, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonLoc + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTMN, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonExt + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTME, '
            + '       NCOHREG, NCOFREG, D.USERNOM, '
            + '       CASE WHEN NCOESTADO=''A'' THEN ''ANULADO'' ELSE '''' END ESTADO '
            + '  from CXC303 A, TGE101 B, TGE105 C, TGE006 D '
            + ' where A.CIAID=''' + dblcCIA.text + ''' '
            + '   and CCFEMIS=''' + DateToStr(dtpFecha.date) + ''' AND NCOESTADO in (''C'',''A'') '
            + '   and A.NCOUSER in ( ' + cUsuarios + ' ) '
            + '   and A.CIAID=B.CIAID(+) AND A.BANCOID=C.BANCOID(+) '
            + '   and A.NCOUSER=D.USERID(+) '
            + ' Order by CCNODOC';

      cSQL := 'Select A.CIAID, B.CIADES, A.BANCOID, C.BANCONOM, DOCID, CCSERIE, CCNODOC, '
            + '       CCFEMIS, A.TMONID, NCOMTOORI, NCOMTOLOC, NCOMTOEXT, CLIEID, A.CLAUXID, '
            + '       CCNOMB, A.CPTOID, A.CCGLOSA, A.NCOUSER, A.NCOUSER||'' - ''||D.USERNOM USUARIO, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonLoc + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTMN, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonExt + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTME, '
            + '       NCOHREG, NCOFREG, D.USERNOM, A.USUANU, FECANU, '
            + '       CASE WHEN NCOESTADO=''A'' THEN ''ANULADO'' ELSE '''' END ESTADO, OBSANU  '
            + '  from CXC303 A, TGE101 B, TGE105 C, TGE006 D '
            + ' where A.CIAID=''' + dblcCIA.text + ''' '
            + '   and CCFEMIS=''' + DateToStr(dtpFecha.date) + ''' AND NCOESTADO in (''A'') '
            + '   and A.NCOUSER in ( ' + cUsuarios + ' ) '
            + '   and A.CIAID=B.CIAID(+) AND A.BANCOID=C.BANCOID(+) '
            + '   and A.USUANU=D.USERID(+) '
            + ' order by CCNODOC';
   End
   Else
   Begin
      xSQL := 'Select * from CAJ_LOG_ING '
            + ' Where CIAID=''' + dblcCia.Text + ''' '
            + '   and FECOPE=''' + DateToStr(dtpFecha.Date) + ''' '
            + '   and USUCAJ=''' + dbeUsuario.Text + '''';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If DMTE.cdsReporte.RecordCount = 0 Then
      Begin
         ShowMessage('Dia No Fue Aperturado');
         Exit;
      End;

      If DMTE.cdsReporte.FieldByName('ESTADO').AsString = 'I' Then
      Begin
         ShowMessage('Usuario NO ha Cerrado Caja');
         Exit;
      End;
      xSQL := 'select A.CIAID, B.CIADES, A.BANCOID, C.BANCONOM, DOCID, CCSERIE, CCNODOC, '
            + '       CCFEMIS, A.TMONID, NCOMTOORI, NCOMTOLOC, NCOMTOEXT, CLIEID, A.CLAUXID, '
            + '       CCNOMB, A.CPTOID, A.CCGLOSA, A.NCOUSER, A.NCOUSER||'' - ''||D.USERNOM USUARIO, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonLoc + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTMN, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonExt + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTME, '
            + '       NCOHREG, NCOFREG, D.USERNOM, ''Cajero(a) : ''||D.USERNOM CAJERO, '
            + '       CASE WHEN NCOESTADO=''A'' THEN ''ANULADO'' ELSE '''' END ESTADO '
            + '  from CXC303 A, TGE101 B, TGE105 C, TGE006 D '
            + ' where A.CIAID=''' + dblcCIA.text + ''' '
            + '   and CCFEMIS=''' + DateToStr(dtpFecha.date) + ''' AND NCOESTADO in (''C'',''A'') '
            + '   and NCOUSER=''' + DMTE.wUsuario + ''' '
            + '   and A.CIAID=B.CIAID(+) AND A.BANCOID=C.BANCOID(+) '
            + '   and A.NCOUSER=D.USERID(+) '
            + ' order by CCNODOC';

      cSQL := 'Select A.CIAID, B.CIADES, A.BANCOID, C.BANCONOM, DOCID, CCSERIE, CCNODOC, '
            + '       CCFEMIS, A.TMONID, NCOMTOORI, NCOMTOLOC, NCOMTOEXT, CLIEID, A.CLAUXID, '
            + '       CCNOMB, A.CPTOID, A.CCGLOSA, A.NCOUSER, A.NCOUSER||'' - ''||D.USERNOM USUARIO, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonLoc + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTMN, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonExt + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTME, '
            + '       NCOHREG, NCOFREG, D.USERNOM,  ''Cajero(a) : ''||D.USERNOM CAJERO, A.USUANU, FECANU, '
            + '       CASE WHEN NCOESTADO=''A'' THEN ''ANULADO'' ELSE '''' END ESTADO, OBSANU '
            + '  from CXC303 A, TGE101 B, TGE105 C, TGE006 D '
            + ' where A.CIAID=''' + dblcCIA.text + ''' '
            + '   and CCFEMIS=''' + DateToStr(dtpFecha.date) + ''' '
            + '   and NCOUSER=''' + DMTE.wUsuario + ''' AND NCOESTADO=''A'' '
            + '   and A.CIAID=B.CIAID(+) AND A.BANCOID=C.BANCOID(+) '
            + '   and A.USUANU=D.USERID(+) '
            + ' order by CCNODOC';
   End;

   DMTE.cdsQry4.Close;
   DMTE.cdsQry4.DataRequest(cSQL);
   DMTE.cdsQry4.Open;

   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   ppdb1.DataSource := DMTE.dsReporte;
   ppdb2.DataSource := DMTE.dsQry4;

   If DMTE.wAdmin = 'U' Then
      ppr1.TEMPLATE.FileName := wRutaRpt + '\IngresosCierre.Rtm'
   Else
      ppr1.TEMPLATE.FileName := wRutaRpt + '\IngresosCierreADM.Rtm';

   ppr1.template.LoadFromFile;

   ppd1.Report := ppr1;

   If cbDiseno.Checked Then
      ppd1.ShowModal
   Else
      ppr1.Print;

   ppr1.Stop;
   ppd1.Report := Nil;
   ppdb1.DataSource := Nil;
   ppdb2.DataSource := Nil;
End;

Procedure TFToolIngresos.bbtnCierreClick(Sender: TObject);
Var
   xSQL, cUsers, cSoles, cDolares, cConta, cCaja, cUsuarios: String;
Begin
   xSQL := 'Select * From CAJ_USU_SUP where USUSUP=''' + DMTE.wUsuario + '''';

   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.RecordCount > 0 Then
   Begin

      cCaja := DMTE.cdsReporte.FieldByName('USUARIO').AsString;

      xSQL := 'Select * '
            + '  from CAJ_LOG_ING '
            + ' where CIAID=''' + dblcCia.Text + ''' '
            + '   and FECOPE=''' + DateToStr(dtpFecha.Date) + ''' '
            + '   and USUCAJ=''' + cCaja + '''';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If DMTE.cdsReporte.RecordCount = 0 Then
      Begin
         ShowMessage('Dia No Fue Aperturado');
         Exit;
      End;

      If DMTE.cdsReporte.FieldByName('ESTADO').AsString = 'C' Then
      Begin
         ShowMessage('Dia ya fue Cerrado');
         Exit;
      End;

    // para Saber cuales son los Usuario
      xSQL := 'SELECT USUCAJ FROM CAJ_USU_SUP A WHERE USUARIO=''' + cCaja + ''' group by USUCAJ';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      cUsuarios := '';
      While Not DMTE.cdsReporte.Eof Do
      Begin
         cUsuarios := cUsuarios + '''' + DMTE.cdsReporte.FieldByname('USUCAJ').AsString + ''', ';
         DMTE.cdsReporte.Next;
      End;
      If cUsuarios = '' Then
      Begin
         ShowMessage('Supervisor no Tiene Usuario Asignados');
         Exit;
      End;

      cUsuarios := Copy(cUsuarios, 1, length(cUsuarios) - 2);

      xSQL := 'Select USUCAJ from CAJ_LOG_ING '
            + ' Where CIAID=''' + dblcCia.Text + ''' '
            + '   and FECOPE=''' + DateToStr(dtpFecha.Date) + ''' '
            + '   and USUCAJ in ( ' + cUsuarios + ' ) '
            + '   and USUCAJ<>''' + DMTE.wUsuario + ''' '
            + '   and ESTADO=''I'' '
            + ' group by USUCAJ';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If DMTE.cdsReporte.RecordCount > 0 Then
      Begin
         cUsers := '';
         While Not DMTE.cdsReporte.Eof Do
         Begin
            cUsers := cUsers + DMTE.cdsReporte.FieldByName('USUCAJ').AsString + #13 + '';
            DMTE.cdsReporte.Next;
         End;
         ShowMessage('Cajeros que no han cerrado Caja' + #13 + #13 + cUsers);
         Exit;
      End;

      xSQL := 'Select USUCAJ from CAJ_LOG_ING '
            + ' Where CIAID=''' + dblcCia.Text + ''' '
            + '   and FECOPE=''' + DateToStr(dtpFecha.Date) + ''' '
            + '   and USUCAJ in ( ' + cUsuarios + ' ) '
            + '   and USUCAJ<>''' + DMTE.wUsuario + ''' '
            + '   and NVL(ESTCONTA,''N'')<>''S'' '
            + ' Group by USUCAJ';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If DMTE.cdsReporte.RecordCount > 0 Then
      Begin
         cUsers := '';
         While Not DMTE.cdsReporte.Eof Do
         Begin
            cUsers := cUsers + DMTE.cdsReporte.FieldByName('USUCAJ').AsString + #13 + '';
            DMTE.cdsReporte.Next;
         End;
         ShowMessage('Cajeros que no han Contabilizado Ingresos de Caja' + #13 + #13 + cUsers);
         Exit;
      End;

      xSQL := 'Select sum( CASE WHEN A.TMONID=''' + DMTE.wTMonLoc + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END ) TOTMN, '
            + '       sum( CASE WHEN A.TMONID=''' + DMTE.wTMonExt + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END ) TOTME '
            + '  from CXC303 A '
            + ' where A.CIAID=''' + dblcCIA.text + ''' '
            + '   and CCFEMIS=''' + DateToStr(dtpFecha.date) + ''' AND NCOESTADO in (''C'',''A'') '
            + '   and NCOUSER in ( ' + cUsuarios + ' ) ';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If MessageDlg(' ¿ Esta seguro(a) de Cerrar Caja ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         cSoles := DMTE.cdsReporte.FieldByName('TOTMN').AsString;
         cDolares := DMTE.cdsReporte.FieldByName('TOTME').AsString;
         If cSoles = '' Then
            cSoles := '0.00';
         If cDolares = '' Then
            cDolares := '0.00';

         cConta := '';
         If (cSoles = '0.00') And (cDolares = '0.00') Then
            cConta := ', ESTCONTA=''S'', FECCONTA=SYSDATE ';

         xSQL := 'Update CAJ_LOG_ING '
                +'   set ESTADO=''C'', FECCIERRE=SYSDATE, USUCIE=''' + DMTE.wUsuario + ''', '
                +'       IMPSOL=' + cSoles + ', '
                +'       IMPDOL=' + cDolares + ' ' + cConta
                +' Where CIAID=''' + dblcCia.Text + ''' '
                +'   and FECOPE=''' + DateToStr(dtpFecha.Date) + ''' '
                +'   and USUCAJ=''' + cCaja + '''';
         DMTE.cdsReporte.Close;
         DMTE.cdsReporte.DataRequest(xSQL);
         DMTE.cdsReporte.Execute;

         ShowMessage('Caja Cerrada');
      End;
   End
   Else
   Begin

      xSQL := 'Select * From CAJ_USU_SUP where USUCAJ=''' + DMTE.wUsuario + '''';

      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If DMTE.cdsReporte.RecordCount = 0 Then
      Begin
         ShowMessage('Usuario No Registrado para Cobrar');
         Exit;
      End;

      xSQL := 'Select * '
            + '  from CAJ_LOG_ING '
            + ' Where CIAID=''' + dblcCia.Text + ''' '
            + '   and FECOPE=''' + DateToStr(dtpFecha.Date) + ''' '
            + '   and USUCAJ=''' + dbeUsuario.Text + '''';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If DMTE.cdsReporte.RecordCount = 0 Then
      Begin
         ShowMessage('Dia No Fue Aperturado');
         Exit;
      End;

      If DMTE.cdsReporte.FieldByName('ESTADO').AsString = 'C' Then
      Begin
         ShowMessage('Dia ya fue Cerrado');
         Exit;
      End;

      xSQL := 'Select A.CIAID, B.CIADES, A.BANCOID, C.BANCONOM, DOCID, CCSERIE, CCNODOC, '
            + '       CCFEMIS, A.TMONID, NCOMTOORI, NCOMTOLOC, NCOMTOEXT, CLIEID, A.CLAUXID, '
            + '       CCNOMB, A.CPTOID, A.CCGLOSA, A.NCOUSER, A.NCOUSER||'' - ''||D.USERNOM USUARIO, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonLoc + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTMN, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonExt + ''' AND NCOESTADO=''C'' THEN NCOMTOORI ELSE 0 END TOTME, '
            + '       NCOHREG, NCOFREG, D.USERNOM '
            + '  from CXC303 A, TGE101 B, TGE105 C, TGE006 D '
            + ' where A.CIAID=''' + dblcCIA.text + ''' '
            + '   and CCFEMIS=''' + DateToStr(dtpFecha.date) + ''' AND not NCOESTADO in (''C'',''A'') '
            + '   and NCOUSER=''' + DMTE.wUsuario + ''' '
            + '   and A.CIAID=B.CIAID(+) AND A.BANCOID=C.BANCOID(+) '
            + '   and A.NCOUSER=D.USERID(+) '
            + ' Order by CCNODOC';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If DMTE.cdsReporte.RecordCount > 0 Then
      Begin
         ShowMessage('Existen Recibos en Estado INICIAL');
         Exit;
      End;

      xSQL := 'select sum(case when A.TMONID=''' + DMTE.wTMonLoc + ''' and NCOESTADO=''C'' then nvl(NCOMTOORI,0) else 0 end) TOTMN, '
            + '       sum(case when A.TMONID=''' + DMTE.wTMonExt + ''' and NCOESTADO=''C'' then nvl(NCOMTOORI,0) else 0 end) TOTME '
            + '  from CXC303 A '
            + ' where A.CIAID=''' + dblcCIA.text + ''' '
            + '   and CCFEMIS=''' + DateToStr(dtpFecha.date) + ''' AND NCOESTADO in (''C'',''A'') '
            + '   and NCOUSER=''' + DMTE.wUsuario + ''' ';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If MessageDlg(' ¿ Esta seguro(a) de Cerrar Caja ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         cSoles := DMTE.cdsReporte.FieldByName('TOTMN').AsString;
         cDolares := DMTE.cdsReporte.FieldByName('TOTME').AsString;
         If cSoles = '' Then
            cSoles := '0.00';
         If cDolares = '' Then
            cDolares := '0.00';

         cConta := '';
         If (cSoles = '0.00') And (cDolares = '0.00') Then
            cConta := ', ESTCONTA=''S'', FECCONTA=SYSDATE ';

         xSQL := 'Update CAJ_LOG_ING '
               + '   set ESTADO=''C'', FECCIERRE=SYSDATE, USUCIE=''' + DMTE.wUsuario + ''', '
               + '       IMPSOL=' + cSoles + ', '
               + '       IMPDOL=' + cDolares + ' ' + cConta
               + ' Where CIAID=''' + dblcCia.Text + ''' '
               + '   and FECOPE=''' + DateToStr(dtpFecha.Date) + ''' '
               + '   and USUCAJ=''' + dbeUsuario.Text + '''';
         DMTE.cdsReporte.Close;
         DMTE.cdsReporte.DataRequest(xSQL);
         DMTE.cdsReporte.Execute;

         ShowMessage('Caja Cerrada');
      End;

   End;

End;

Procedure TFToolIngresos.bbtnAperturaClick(Sender: TObject);
Var
   xSQL, cCaja: String;
Begin

   dtpFecha.Date := DateS;

   xSQL := 'Select * From CAJ_USU_SUP where USUSUP=''' + DMTE.wUsuario + '''';

   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.RecordCount > 0 Then
   Begin

      cCaja := DMTE.cdsReporte.FieldByname('USUARIO').AsString;

      xSQL := 'Select * '
            + '  from CAJ_LOG_ING '
            + ' Where CIAID=''' + dblcCia.Text + ''' '
            + '   and FECOPE=''' + DateToStr(dtpFecha.Date) + ''' '
            + '   and USUCAJ=''' + cCaja + '''';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If DMTE.cdsReporte.RecordCount > 0 Then
      Begin
         ShowMessage('Supervisor Ya Aperturó el Dia');
         Exit;
      End;

      xSQL := 'Select * '
             +'  from CAJ_LOG_ING '
             +' Where CIAID=''' + dblcCia.Text + ''' '
             +'   and FECOPE<''' + DateToStr(dtpFecha.Date) + ''' '
             +'   and USUCAJ=''' + cCaja + ''' and ESTADO=''I'' ';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If DMTE.cdsReporte.RecordCount > 0 Then
      Begin
         ShowMessage('Supervisor NO ha Cerrado el Día ' + DMTE.cdsReporte.FieldByName('FECOPE').AsString);
         Exit;
      End;

      xSQL := 'Select * '
            + '  from CAJ_LOG_ING '
            + ' Where CIAID=''' + dblcCia.Text + ''' '
            + '   and FECOPE<''' + DateToStr(dtpFecha.Date) + ''' '
            + '   and USUCAJ=''' + cCaja + ''' and USUAPE=''' + cCaja + ''' and NVL(ESTCONTA,''N'')=''N''';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If DMTE.cdsReporte.RecordCount > 0 Then
      Begin
         ShowMessage('Supervisor NO a Contabilizado el Dia ' + DMTE.cdsReporte.FieldByName('FECOPE').AsString);
         Exit;
      End;

      If MessageDlg(' ¿ Está seguro(a) de Aperturar Caja ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         xSQL := 'Insert into CAJ_LOG_ING( CIAID, FECOPE, USUAPE, ESTADO, IMPSOL, IMPDOL, FECREG, USUCAJ ) '
               + 'Values( ''' + dblcCia.Text + ''', ''' + DateToStr(dtpFecha.Date) + ''', '
                       + '''' + dbeUsuario.Text + ''', ''I'', 0, 0, SYSDATE, ''' + cCaja + ''' )';
         DMTE.cdsReporte.Close;
         DMTE.cdsReporte.DataRequest(xSQL);
         DMTE.cdsReporte.Execute;

         ShowMessage('Caja Aperturada');
      End;
   End
   Else
   Begin

    // revisa si Usuario esta Inscrito para Caja
      xSQL := 'Select * From CAJ_USU_SUP where USUCAJ=''' + DMTE.wUsuario + '''';

      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If DMTE.cdsReporte.RecordCount = 0 Then
      Begin
         ShowMessage('Usuario No Registrado para Cobrar');
         Exit;
      End;

    // Verifica si Supervisor a Aperturado el Dia
      xSQL := 'Select * '
            + '  from CAJ_LOG_ING '
            + ' Where CIAID=''' + dblcCia.Text + ''' '
            + '   and FECOPE=''' + DateToStr(dtpFecha.Date) + ''' '
            + '   and USUCAJ=''' + DMTE.cdsReporte.FieldByName('USUARIO').AsString + '''';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If DMTE.cdsReporte.RecordCount = 0 Then
      Begin
         ShowMessage('Supervisor No ha Aperturado el Dia');
         Exit;
      End;

      If DMTE.cdsReporte.FieldByName('ESTADO').AsString = 'C' Then
      Begin
         ShowMessage('Dia ya fue Cerrado por Supervisor');
         Exit;
      End;

    {
    xSQL:='Select * From CAJA310 '
         +'where CIAID ='+QuotedStr(dblcCia.Text)
         + ' and BANCOID ='+QuotedStr('15')
         + ' and STFECHA ='+QuotedStr(DateToStr(dtpFecha.Date));

    DMTE.cdsReporte.Close;
    DMTE.cdsReporte.DataRequest( xSQL );
    DMTE.cdsReporte.Open;

    if DMTE.cdsReporte.RecordCount=0 then
    begin
       ShowMessage('Dia No Fue Aperturado por el Supervisor');
       Exit;
    end;

    if DMTE.cdsReporte.FieldByName('FLGCIERRE').AsString='S' then
    begin
       ShowMessage('No se puede Aperturar. Dia ya fue Cerrado.');
       Exit;
    end;
    }
      xSQL := 'Select * '
            + '  from CAJ_LOG_ING '
            + ' Where CIAID=''' + dblcCia.Text + ''' '
            + '   and FECOPE=''' + DateToStr(dtpFecha.Date) + ''' '
            + '   and USUCAJ=''' + dbeUsuario.Text + '''';
      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

      If DMTE.cdsReporte.FieldByName('ESTADO').AsString = 'C' Then
      Begin
         ShowMessage('Cajero(a) ya hizo Cierre del Día');
         Exit;
      End;

      If DMTE.cdsReporte.RecordCount > 0 Then
      Begin
         ShowMessage('Cajero(a) ya realizo la Apertura del Día');
         Exit;
      End;

      If MessageDlg(' ¿ Esta seguro(a) de Aperturar Caja ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
      Begin
         xSQL := 'Insert into CAJ_LOG_ING( CIAID, FECOPE, USUCAJ, ESTADO, IMPSOL, IMPDOL, FECREG, USUAPE ) '
               + 'Values( ''' + dblcCia.Text + ''', ''' + DateToStr(dtpFecha.Date) + ''', '
               + '''' + dbeUsuario.Text + ''', ''I'', 0, 0, SYSDATE, ''' + dbeUsuario.Text + ''' )';
         DMTE.cdsReporte.Close;
         DMTE.cdsReporte.DataRequest(xSQL);
         DMTE.cdsReporte.Execute;

         ShowMessage('Caja Aperturada');
      End;
   End;

End;

Procedure TFToolIngresos.dblcCiaNotInList(Sender: TObject;
   LookupTable: TDataSet; NewValue: String; Var Accept: Boolean);
Begin
   If TwwDBCustomLookupCombo(Sender).Text = '' Then Accept := True;
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If Not Accept Then
      TwwDBCustomLookupCombo(Sender).DropDown;
End;

Procedure TFToolIngresos.dblcCiaExit(Sender: TObject);
Begin
   dbeCia.Text := DMTE.DisplayDescrip('prvTGE', 'TGE101', 'CIAID,CIADES', 'CIAID=' + quotedstr(dblcCia.Text), 'CIADES');
End;

Procedure TFToolIngresos.BitBtn2Click(Sender: TObject);
Begin
   FRegistro.xFiltroIng.SetFilter('CIAID=''' + dblcCia.Text + ''' AND CCFEMIS=''' + DateToStr(dtpFecha.Date) + ''' and ' + DMTE.cFilterUsuarioUser);

   If FRegistro.xFiltroIng.FMANT.dbgFiltro.DataSource = Nil Then
      FRegistro.xFiltroIng.RefreshFilter;

End;

Procedure TFToolIngresos.Z2bbtnContClick(Sender: TObject);
Var
   xSQL, cWhere: String;
Begin

   xSQL := 'Select * From CAJ_USU_SUP where USUCAJ=''' + DMTE.wUsuario + '''';

   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.RecordCount = 0 Then
   Begin
      ShowMessage('Usuario No Registrado Para Contabilizar');
      Exit;
   End;

   xSQL := ' Select * from CAJ_LOG_ING '
         + ' Where CIAID=''' + dblcCia.Text + ''' '
         + '   and FECOPE=''' + DateToStr(dtpFecha.Date) + ''' '
         + '   and USUCAJ=''' + dbeUsuario.Text + '''';
   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.FieldByName('ESTCONTA').AsString = 'S' Then
   Begin
      ShowMessage('Dia ' + DateToStr(dtpFecha.date) + ' ya fue Contabilizado');
      Exit;
   End;

   If DMTE.cdsReporte.FieldByName('ESTADO').AsString <> 'C' Then
   Begin
      ShowMessage('Para Contabilizar el Dia ' + DateToStr(dtpFecha.date) + ', Caja tiene que estar Cerrada');
      Exit;
   End;

   If MessageDlg(' ¿ Esta seguro(a) de Contabilizar Caja ? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
   Begin
      screen.Cursor := crHourGlass;

      cWhere := 'FECHA =' + DMTE.wRepFuncDate + '''' + FormatDateTime(DMTE.wFormatFecha, dtpFecha.date) + ''')';
      cAnoMM := DMTE.DisplayDescrip('prvTGE', 'TGE114', '*', cWhere, 'FECANO');
      cAnoMM := DMTE.cdsQry.FieldByName('FECANO').AsString + DMTE.cdsQry.FieldByName('FECMES').AsString;

      If DMTE.wAdmin = 'U' Then
         xSQL := ' Select * From CXC303 '
               + ' where CIAID=''' + dblcCIA.text + ''' '
               + '   and CCFEMIS=''' + DateToStr(dtpFecha.date) + ''' '
               + '   and NCOUSER=''' + DMTE.wUsuario + ''''
      Else
         xSQL := ' Select A.* From CXC303 A, CAJ_USU_SUP B '
               + ' where A.CIAID=''' + dblcCIA.text + ''' '
               + '   and A.CCFEMIS=''' + DateToStr(dtpFecha.date) + ''' '
               + '   and B.USUSUP=''' + DMTE.wUsuario + ''' AND A.NCOUSER=B.USUCAJ ';

      DMTE.cdsReporte.Close;
      DMTE.cdsReporte.DataRequest(xSQL);
      DMTE.cdsReporte.Open;

// Inicia HPC_201404_CAJA
// inicia transaccion

     DMTE.DCOM1.AppServer.IniciaTransaccion;
     xSigueGrab := True;

     While Not DMTE.cdsReporte.Eof Do
     Begin

         xSQL := 'Select * '
               + '  from CXC303 '
               + ' where CIAID=''' + DMTE.cdsReporte.FieldByName('CIAID').AsString + ''' '
               + '   and CCFEMIS=''' + DMTE.cdsReporte.FieldByName('CCFEMIS').AsString + ''' '
               + '   and NCOUSER=''' + DMTE.cdsReporte.FieldByName('NCOUSER').AsString + ''' '
               + '   and CCNODOC=''' + DMTE.cdsReporte.FieldByName('CCNODOC').AsString + '''';
         DMTE.cdsDocsContWork.Close;
         DMTE.cdsDocsContWork.DataRequest(xSQL);
         DMTE.cdsDocsContWork.Open;

     // INGRESO DE RECIBOS A CAJA
         GeneraComp;

         AsignaCompaDocs;

         //DMTE.AplicaDatos(DMTE.cdsEgrCaja, 'EGRCAJA');
         if DMTE.cdsEgrCaja.ApplyUpdates(0)>0 then
         begin
            screen.Cursor := crDefault;
            ShowMessage(' (DMTE.cdsEgrCaja) ');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         end;

         //DMTE.AplicaDatos(DMTE.cdsDocsContWork, 'DOCSCONT');
         if DMTE.cdsDocsContWork.ApplyUpdates(0)>0 then
         begin
            screen.Cursor := crDefault;
            ShowMessage(' (DMTE.cdsDocsContWork) ');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         end;

         RecCptosDifC;

         Contabiliza;

         if DMTE.cdsCntCaja.ApplyUpdates(0)>0 then
         begin
            screen.Cursor := crDefault;
            ShowMessage(' (DMTE.cdsCntCaja) ');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         end;

         ActualizaCNT311(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
            DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString);
         if not xSigueGrab then
         begin
            screen.Cursor := crDefault;
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         end;

         If DMTE.cdsReporte.FieldByName('NCOESTADO').AsString = 'A' Then
            AnulaComprobante(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
            DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
         Else
            SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
            DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
            DMTE.SRV_D, 'CCNA', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
            DMTE.cdsResultSet, DMTE.DCOM1, Self);
         if not xSigueGrab then
         begin
            screen.Cursor := crDefault;
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         end;

     // TRANSFERENCIA DE CAJA A BOVEDA

         GeneraComp2;
         //DMTE.AplicaDatos(DMTE.cdsEgrCaja, 'EGRCAJA');
         if DMTE.cdsEgrCaja.ApplyUpdates(0)>0 then
         begin
            screen.Cursor := crDefault;
            ShowMessage(' (DMTE.cdsEgrCaja)-2 ');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         end;

         Contabiliza2;
         //DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
         if DMTE.cdsCntCaja.ApplyUpdates(0)>0 then
         begin
            screen.Cursor := crDefault;
            ShowMessage(' (DMTE.cdsCntCaja)-2 ');
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         end;

         ActualizaCNT311(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
            DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
            DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString);
         if not xSigueGrab then
         begin
            screen.Cursor := crDefault;
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         end;

         If DMTE.cdsReporte.FieldByName('NCOESTADO').AsString = 'A' Then
            AnulaComprobante(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
               DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
               DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
               DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
         Else
            SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
               DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
               DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
               DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
               DMTE.SRV_D, 'CCNA', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
               DMTE.cdsResultSet, DMTE.DCOM1, Self);
         if not xSigueGrab then
         begin
            screen.Cursor := crDefault;
            DMTE.DCOM1.AppServer.RetornaTransaccion;
            exit;
         end;

      // Modificación cuenta contable en los abonos automáticos de cadena de hoteles cuando los
      // cobros son realizados en caja central.
         xSQL := 'Select CUENTAID,CUENTAID2 '
                +'  from CAJA201 '
                +' where CPTOID='+quotedstr(DMTE.cdsDocsContWork.FieldByName('CPTOID').AsString)
                +'   and CPTOIS=''I'' '
                +'   and TMONID='+quotedstr(DMTE.cdsDocsContWork.FieldByName('TMONID').AsString) +'  ';
         DMTE.cdsQry.Close;
         DMTE.cdsQry.DataRequest(xSQL);
         DMTE.cdsQry.Open;
         if DMTE.cdsQry.Recordcount>0 then
         begin
            if copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,1,3)='166' then
            begin
               xCtaCliFilial := DMTE.cdsQry.FieldByName('CUENTAID2').AsString;
               {
               if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
               begin
                  xCtaCliFilial := '12101';
                  if (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='07') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='09') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='10') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='11') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='12') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='13') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='14') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='17') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='18') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='19') then
                     xCtaCliFilial := '121030101';
               end
               else
               begin
                  xCtaCliFilial := '12102';
                  if (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='07') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='09') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='10') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='11') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='12') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='13') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='14') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='17') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='18') or
                        (copy(DMTE.cdsQry.FieldByName('CUENTAID').AsString,4,2)='19') then
                     xCtaCliFilial := '121030102';
               end;
               }

               GeneraComp3;
               //DMTE.AplicaDatos(DMTE.cdsEgrCaja, 'EGRCAJA');
               if DMTE.cdsEgrCaja.ApplyUpdates(0)>0 then
               begin
                  screen.Cursor := crDefault;
                  ShowMessage(' (DMTE.cdsEgrCaja)-3 ');
                  DMTE.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               end;

               Contabiliza3;
               //DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');
               if DMTE.cdsCntCaja.ApplyUpdates(0)>0 then
               begin
                  screen.Cursor := crDefault;
                  ShowMessage(' (DMTE.cdsCntCaja)-3 ');
                  DMTE.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               end;

               ActualizaCNT311(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                  DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                  DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString);
               if not xSigueGrab then
               begin
                  screen.Cursor := crDefault;
                  DMTE.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               end;

               If DMTE.cdsReporte.FieldByName('NCOESTADO').AsString = 'A' Then
                  AnulaComprobante(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
                     DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                     DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                     DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString)
               Else
                  SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
                     DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                     DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                     DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                     DMTE.SRV_D, 'C', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                     DMTE.cdsResultSet, DMTE.DCOM1, Self);
               if not xSigueGrab then
               begin
                  screen.Cursor := crDefault;
                  DMTE.DCOM1.AppServer.RetornaTransaccion;
                  exit;
               end;
            end;
         end;
      // Fin HPC_201312_CAJA

         DMTE.cdsReporte.Next;

      End;

      screen.Cursor := crDefault;

      xSQL := 'Update CAJ_LOG_ING '
            + '   set ESTCONTA=''S'', FECCONTA=SYSDATE '
            + ' Where CIAID=''' + dblcCia.Text + ''' '
            + '   and FECOPE=''' + DateToStr(dtpFecha.Date) + ''' '
            + '   and USUCAJ=''' + dbeUsuario.Text + '''';
      Try
         DMTE.DCOM1.AppServer.EjecutaSql(xSQL);
      Except
         screen.Cursor := crDefault;
         ShowMessage('No se actualizó CAJ_LOG_ING');
         DMTE.DCOM1.AppServer.RetornaTransaccion;
         exit;
      End;

     // finaliza transaccion

      screen.Cursor := crDefault;
      DMTE.DCOM1.AppServer.GrabaTransaccion;
      ShowMessage('Contabilización OK');
// Finaliza HPC_201404_BAN

   End;
End;

Procedure TFToolIngresos.AnulaComprobante(cCia, cTD, cAM, cNC: String);
Var
   xSQL: String;
Begin
   xSQL := 'Update CNT300 '
         + '   set CNTESTADO=''A'', CNTCUADRE=''N'' '
         + ' Where CIAID=''' + cCia + ''' and TDIARID=''' + cTD + ''' '
         + '   and CNTANOMM=''' + cAM + ''' and CNTCOMPROB=''' + cNC + '''';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xSQL := 'Update CNT311 '
         + '   set CNTESTADO=''A'', CNTCUADRE=''N'' '
         + ' Where CIAID=''' + cCia + ''' and TDIARID=''' + cTD + ''' '
         + '   and CNTANOMM=''' + cAM + ''' and CNTCOMPROB=''' + cNC + '''';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xSQL := 'INSERT INTO CNT300';
   xSQL := xSQL + '( CIAID, TDIARID, CNTANOMM, CNTCOMPROB, CNTLOTE, ';
   xSQL := xSQL + 'CNTGLOSA, CNTTCAMBIO, CNTFCOMP, CNTESTADO, CNTCUADRE, ';
   xSQL := xSQL + 'CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, ';
   xSQL := xSQL + 'CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, ';
   xSQL := xSQL + 'FLAGVAR, TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, ';
   xSQL := xSQL + 'CNTTS, DOCMOD, MODULO ) ';
   xSQL := xSQL + 'SELECT A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB,  A.CNTLOTE, ';
   xSQL := xSQL + 'DECODE( MIN(A.CNTREG), 1, MAX( A.CNTGLOSA ), ''COMPROBANTE DE ''||MAX(MODULO) ), ';
   xSQL := xSQL + 'MAX( NVL( A.CNTTCAMBIO, 0 ) ), ';
   xSQL := xSQL + 'A.CNTFCOMP, ''A'', ''N'', ';
   xSQL := xSQL + 'MAX( CNTUSER ), MAX( CNTFREG ), MAX( CNTHREG ), A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI, ';
   xSQL := xSQL + 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
   xSQL := xSQL + 'CASE WHEN SUM( CASE WHEN TMONID=''' + DMTE.wTMonExt + ''' THEN 1 ELSE 0 END )>'
                + ' SUM( CASE WHEN TMONID=''' + DMTE.wTMonLoc + ''' THEN 1 ELSE 0 END ) '
                + ' THEN ''' + DMTE.wTMonExt + ''' ELSE ''' + DMTE.wTMonLoc + ''' END, ';
   xSQL := xSQL + ''' '', A.TDIARDES, ';
   xSQL := xSQL + 'SUM(A.CNTDEBEMN), SUM(A.CNTDEBEME), SUM(A.CNTHABEMN), SUM(A.CNTHABEME), ';
   xSQL := xSQL + 'MAX( CNTTS ), MAX( CNTMODDOC), MAX( MODULO ) ';
   xSQL := xSQL + 'FROM CNT311 A ';
   xSQL := xSQL + 'WHERE A.CIAID=' + '''' + cCia + '''' + ' AND ';
   xSQL := xSQL + 'A.TDIARID=' + '''' + cTD + '''' + ' AND ';
   xSQL := xSQL + 'A.CNTANOMM=' + '''' + cAM + ''' ';
   xSQL := xSQL + 'AND A.CNTCOMPROB=' + '''' + cNC + '''' + ' ';
   xSQL := xSQL + 'GROUP BY A.CIAID, A.TDIARID, A.CNTANOMM, A.CNTCOMPROB, A.CNTLOTE, ';
   xSQL := xSQL + 'A.CNTFCOMP, A.CNTANO, A.CNTMM, A.CNTDD, A.CNTTRI,  ';
   xSQL := xSQL + 'A.CNTSEM, A.CNTSS, A.CNTAATRI, A.CNTAASEM, A.CNTAASS, ';
   xSQL := xSQL + 'A.TDIARDES';
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

End;

Procedure TFToolIngresos.GeneraComp;
Var
   xSQL, cWhere, Aux, cOrigen: String;
Begin

   cWhere := 'CIAID=''' + dblcCia.Text + ''' AND BANCOID =' + QuotedStr(DMTE.cdsDocsContWork.FieldByName('BANCOID').AsString);

   cOrigen := DMTE.DisplayDescrip('prvTGE', 'TGE106', 'CCBVOUING', cWhere, 'CCBVOUING');

   xSQL := 'Select * '
         + '  from CAJA302 '
         + ' where CIAID=''' + DMTE.cdsDocsContWork.FieldByName('CIAID').AsString + ''' '
         + '   and TDIARID=''' + cOrigen + ''' '
         + '   and ECANOMM=''' + cAnoMM + ''' '
         + '   and ECNOCOMP=''' + '000000' + Copy(DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString, 7, 4) + '''';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest(xSQL);
   DMTE.cdsEgrCaja.Open;

   If DMTE.cdsEgrCaja.Recordcount > 0 Then
      DMTE.cdsEgrCaja.Delete;

   DMTE.cdsEgrCaja.Insert;
   DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString := '';
   DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value := DMTE.cdsDocsContWork.FieldByName('NCOTCAMB').AsString;
   DMTE.cdsEgrCaja.FieldByName('PROV').AsString := '';
   DMTE.cdsEgrCaja.FieldByName('DOCID').Value := DMTE.cdsDocsContWork.FieldByName('DOCID').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECNODOC').Value := DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString;
   DMTE.cdsEgrCaja.FieldByName('CIAID').Value := DMTE.cdsDocsContWork.FieldByName('CIAID').AsString;
   DMTE.cdsEgrCaja.FieldByName('TDIARID').Value := cOrigen;
   DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value := cAnoMM;
   DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value := '000000' + Copy(DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString, 7, 4);

   DMTE.cdsEgrCaja.FieldByName('ECFEMICH').Value := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').AsDateTime;
   DMTE.cdsEgrCaja.FieldByName('ECFCOBCH').Value := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').AsDateTime;
   DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').AsDateTime;
   DMTE.cdsEgrCaja.FieldByName('TMONID').AsString := DMTE.cdsDocsContWork.FieldByName('TMONID').AsString;

   If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC').AsString;
      DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC').AsString;
      DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT').AsString;
   End
   Else
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT').AsString;
      DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC').AsString;
      DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT').AsString;
   End;

   DMTE.cdsEgrCaja.FieldByName('BANCOID').Value := DMTE.cdsDocsContWork.FieldByName('BANCOID').AsString;
   DMTE.cdsEgrCaja.FieldByName('CUENTAID').Value := DMTE.DisplayDescrip('prvTGE', 'TGE105', 'CUENTAID, CPTOID', 'BANCOID =' + QuotedStr(DMTE.cdsDocsContWork.FieldByName('BANCOID').AsString), 'CUENTAID');
   DMTE.cdsEgrCaja.FieldByName('ECGLOSA').Value := Copy(DMTE.cdsDocsContWork.FieldByName('CCGLOSA').AsString, 1, 60);
   DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value := 'ICBO';

   If DMTE.cdsReporte.FieldByName('NCOESTADO').AsString = 'A' Then
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'A';
      DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString := 'N';
   End
   Else
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'P';
      DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString := 'S';
   End;

   cWhere := 'FECHA =' + DMTE.wRepFuncDate + '''' + FormatDateTime(DMTE.wFormatFecha, DMTE.cdsDocsContWork.FieldByName('CCFEMIS').AsDateTime) + ''')';
   aux := DMTE.DisplayDescrip('prvTGE', 'TGE114', '*', cWhere, 'FECANO');
   DMTE.cdsEgrCaja.FieldByName('ECANO').AsString := DMTE.cdsQry.FieldByName('FECANO').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECMM').AsString := DMTE.cdsQry.FieldByName('FECMES').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECDD').AsString := DMTE.cdsQry.FieldByName('FECDIA').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECSS').AsString := DMTE.cdsQry.FieldByName('FECSS').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString := DMTE.cdsQry.FieldByName('FECSEM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString := DMTE.cdsQry.FieldByName('FECTRIM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString := DMTE.cdsQry.FieldByName('FECAASS').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAASem').AsString := DMTE.cdsQry.FieldByName('FECAASEM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString := DMTE.cdsQry.FieldByName('FECAATRI').AsString;
   DMTE.cdsEgrCaja.FieldByName('EC_PROCE').Value := 'C';
   DMTE.cdsEgrCaja.FieldByName('EC_IE').Value := 'I';

   DMTE.cdsEgrCaja.FieldByName('ECUSER').Value := DMTE.wUsuario;
   DMTE.cdsEgrCaja.FieldByName('ECFREG').Value := DATE;
   DMTE.cdsEgrCaja.FieldByName('ECHREG').Value := DATE;

   DMTE.cdsEgrCaja.Post;

End;

Procedure TFToolIngresos.AsignaCompaDocs;
Begin
   DMTE.cdsDocsContWork.First;
   While Not DMTE.cdsDocsContWork.EOF Do
   Begin
      DMTE.cdsDocsContWork.Edit;
      DMTE.cdsDocsContWork.FieldByName('CIAID').AsString := DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
      DMTE.cdsDocsContWork.FieldByName('ECANOMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
      DMTE.cdsDocsContWork.FieldByName('TDIARID').AsString := DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
      DMTE.cdsDocsContWork.FieldByName('ECNOCOMP').AsString := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
      DMTE.cdsDocsContWork.Post;
      DMTE.cdsDocsContWork.Next;
   End;

End;

Procedure TFToolIngresos.GeneraComp2;
Var
   xSQL, cWhere, Aux, cOrigen: String;
Begin

   cWhere := 'CIAID=''' + dblcCia.Text + ''' AND BANCOID =' + QuotedStr(DMTE.cdsDocsContWork.FieldByName('BANCOID').AsString);

   cOrigen := DMTE.DisplayDescrip('prvTGE', 'TGE106', 'CCBCOVOUCH', cWhere, 'CCBCOVOUCH');

   xSQL := 'Select * '
         + '  from CAJA302 '
         + ' Where CIAID=''' + DMTE.cdsDocsContWork.FieldByName('CIAID').AsString + ''' '
         + '   and TDIARID=''' + cOrigen + ''' '
         + '   and ECANOMM=''' + cAnoMM + ''' '
         + '   and ECNOCOMP=''' + '000000' + Copy(DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString, 7, 4) + '''';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest(xSQL);
   DMTE.cdsEgrCaja.Open;

   If DMTE.cdsEgrCaja.Recordcount > 0 Then
      DMTE.cdsEgrCaja.Delete;

   DMTE.cdsEgrCaja.Insert;
   DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString := '';
   DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value := DMTE.cdsDocsContWork.FieldByName('NCOTCAMB').AsString;
   DMTE.cdsEgrCaja.FieldByName('PROV').AsString := '';
   DMTE.cdsEgrCaja.FieldByName('DOCID').Value := DMTE.cdsDocsContWork.FieldByName('DOCID').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECNODOC').Value := DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString;

   DMTE.cdsEgrCaja.FieldByName('CIAID').Value := DMTE.cdsDocsContWork.FieldByName('CIAID').AsString;
   DMTE.cdsEgrCaja.FieldByName('TDIARID').Value := cOrigen;
   DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value := cAnoMM;
   DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value := '000000' + Copy(DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString, 7, 4);

   DMTE.cdsEgrCaja.FieldByName('ECFEMICH').Value := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').AsDateTime;
   DMTE.cdsEgrCaja.FieldByName('ECFCOBCH').Value := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').AsDateTime;
   DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').AsDateTime;
   DMTE.cdsEgrCaja.FieldByName('TMONID').AsString := DMTE.cdsDocsContWork.FieldByName('TMONID').AsString;

   If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC').AsString;
      DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC').AsString;
      DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT').AsString;
   End
   Else
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT').AsString;
      DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC').AsString;
      DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT').AsString;
   End;

   DMTE.cdsEgrCaja.FieldByName('BANCOID').Value := DMTE.cdsDocsContWork.FieldByName('BANCOID').AsString;
   DMTE.cdsEgrCaja.FieldByName('CUENTAID').Value := DMTE.DisplayDescrip('prvTGE', 'TGE105', 'CUENTAID, CPTOID', 'BANCOID =' + QuotedStr(DMTE.cdsDocsContWork.FieldByName('BANCOID').AsString), 'CUENTAID');
   DMTE.cdsEgrCaja.FieldByName('ECGLOSA').Value := Copy(DMTE.cdsDocsContWork.FieldByName('CCGLOSA').AsString, 1, 60);
   DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value := 'TCBO';

   If DMTE.cdsReporte.FieldByName('NCOESTADO').AsString = 'A' Then
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'A';
      DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString := 'N';
   End
   Else
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'P';
      DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString := 'S';
   End;

   cWhere := 'FECHA =' + DMTE.wRepFuncDate + '''' + FormatDateTime(DMTE.wFormatFecha, DMTE.cdsDocsContWork.FieldByName('CCFEMIS').AsDateTime) + ''')';
   aux := DMTE.DisplayDescrip('prvTGE', 'TGE114', '*', cWhere, 'FECANO');
   DMTE.cdsEgrCaja.FieldByName('ECANO').AsString := DMTE.cdsQry.FieldByName('FECANO').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECMM').AsString := DMTE.cdsQry.FieldByName('FECMES').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECDD').AsString := DMTE.cdsQry.FieldByName('FECDIA').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECSS').AsString := DMTE.cdsQry.FieldByName('FECSS').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString := DMTE.cdsQry.FieldByName('FECSEM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString := DMTE.cdsQry.FieldByName('FECTRIM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString := DMTE.cdsQry.FieldByName('FECAASS').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAASem').AsString := DMTE.cdsQry.FieldByName('FECAASEM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString := DMTE.cdsQry.FieldByName('FECAATRI').AsString;
   DMTE.cdsEgrCaja.FieldByName('EC_PROCE').Value := 'C';
   DMTE.cdsEgrCaja.FieldByName('EC_IE').Value := 'I';

   DMTE.cdsEgrCaja.FieldByName('ECUSER').Value := DMTE.wUsuario;
   DMTE.cdsEgrCaja.FieldByName('ECFREG').Value := DATE;
   DMTE.cdsEgrCaja.FieldByName('ECHREG').Value := DATE;

   DMTE.cdsEgrCaja.Post;
End;

// Inicio HPC_201312_CAJA
Procedure TFToolIngresos.GeneraComp3;
Var
   xSQL, cWhere, Aux, cOrigen, aSorig, xciafilial: String;
Begin
   aSorig := '46602';
   cWhere := 'CIAID=''' + dblcCia.Text + ''' AND BANCOID =' + QuotedStr(DMTE.cdsDocsContWork.FieldByName('BANCOID').AsString);

   cOrigen := DMTE.DisplayDescrip('prvTGE', 'TGE106', 'CCBVOUING', cWhere, 'CCBVOUING');

   xSQL := 'Select * From CAJA301 '
         + ' Where CIAID=''' + dblcCia.Text + ''' and '
         + '       DOCID2=''' + DMTE.cdsDocsContWork.FieldByName('DOCID').AsString + ''' and '
         + '       CPSERIE=''' + DMTE.cdsDocsContWork.FieldByName('CCSERIE').AsString + ''' and '
         + '       CPNODOC=''' + DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString + ''' ';
   DMTE.cdsSQL.Close;
   DMTE.cdsSQL.DataRequest(xSQL);
   DMTE.cdsSQL.Open;

   xciafilial:= Copy(DMTE.cdsSQL.FieldByName('CUENTAID').AsString, Length (DMTE.cdsSQL.FieldByName('CUENTAID').AsString) - 1, 2);

   xSQL := 'Select * '
         + '  from CAJA302 '
         + ' Where CIAID=''' + xciafilial + ''' '
         + '   and TDIARID=''' + cOrigen + ''' '
         + '   and ECANOMM=''' + cAnoMM + ''' '
         + '   and ECNOCOMP=''' + '000000' + Copy(DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString, 7, 4) + '''';
   DMTE.cdsEgrCaja.Close;
   DMTE.cdsEgrCaja.DataRequest(xSQL);
   DMTE.cdsEgrCaja.Open;

   If DMTE.cdsEgrCaja.Recordcount > 0 Then
      DMTE.cdsEgrCaja.Delete;

   DMTE.cdsEgrCaja.Insert;
   DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString := '';
   DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value := DMTE.cdsDocsContWork.FieldByName('NCOTCAMB').AsString;
   DMTE.cdsEgrCaja.FieldByName('PROV').AsString := '';
   DMTE.cdsEgrCaja.FieldByName('DOCID').Value := DMTE.cdsDocsContWork.FieldByName('DOCID').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECNODOC').Value := DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString;

   DMTE.cdsEgrCaja.FieldByName('CIAID').Value := xciafilial;
   DMTE.cdsEgrCaja.FieldByName('TDIARID').Value := cOrigen;
   DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value := cAnoMM;
   DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value := '000000' + Copy(DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString, 7, 4);

   DMTE.cdsEgrCaja.FieldByName('ECFEMICH').Value := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').AsDateTime;
   DMTE.cdsEgrCaja.FieldByName('ECFCOBCH').Value := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').AsDateTime;
   DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').AsDateTime;
   DMTE.cdsEgrCaja.FieldByName('TMONID').AsString := DMTE.cdsDocsContWork.FieldByName('TMONID').AsString;

   If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC').AsString;
      DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC').AsString;
      DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT').AsString;
   End
   Else
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT').AsString;
      DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC').AsString;
      DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsString := DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT').AsString;
   End;

   DMTE.cdsEgrCaja.FieldByName('BANCOID').Value := DMTE.cdsDocsContWork.FieldByName('BANCOID').AsString;
   DMTE.cdsEgrCaja.FieldByName('CUENTAID').Value := aSorig;
   DMTE.cdsEgrCaja.FieldByName('ECGLOSA').Value := Copy(DMTE.cdsDocsContWork.FieldByName('CCGLOSA').AsString, 1, 60) + '000000' + Copy(DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString, 7, 4);
   DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value := 'ICBO';

   If DMTE.cdsReporte.FieldByName('NCOESTADO').AsString = 'A' Then
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'A';
      DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString := 'N';
   End
   Else
   Begin
      DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'P';
      DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString := 'S';
   End;

   cWhere := 'FECHA =' + DMTE.wRepFuncDate + '''' + FormatDateTime(DMTE.wFormatFecha, DMTE.cdsDocsContWork.FieldByName('CCFEMIS').AsDateTime) + ''')';
   aux := DMTE.DisplayDescrip('prvTGE', 'TGE114', '*', cWhere, 'FECANO');
   DMTE.cdsEgrCaja.FieldByName('ECANO').AsString := DMTE.cdsQry.FieldByName('FECANO').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECMM').AsString := DMTE.cdsQry.FieldByName('FECMES').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECDD').AsString := DMTE.cdsQry.FieldByName('FECDIA').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECSS').AsString := DMTE.cdsQry.FieldByName('FECSS').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString := DMTE.cdsQry.FieldByName('FECSEM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString := DMTE.cdsQry.FieldByName('FECTRIM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString := DMTE.cdsQry.FieldByName('FECAASS').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAASem').AsString := DMTE.cdsQry.FieldByName('FECAASEM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString := DMTE.cdsQry.FieldByName('FECAATRI').AsString;
   DMTE.cdsEgrCaja.FieldByName('EC_PROCE').Value := 'C';
   DMTE.cdsEgrCaja.FieldByName('EC_IE').Value := 'I';

   DMTE.cdsEgrCaja.FieldByName('ECUSER').Value := DMTE.wUsuario;
   DMTE.cdsEgrCaja.FieldByName('ECFREG').Value := DATE;
   DMTE.cdsEgrCaja.FieldByName('ECHREG').Value := DATE;

   DMTE.cdsEgrCaja.Post;
   DMTE.cdsSQL.Close;
End;
// Fin HPC_201312_CAJA

Procedure TFToolIngresos.RecCptosDifC;
Var
   cWhere: String;
Begin
   cWhere := 'BANCOID =' + QuotedStr(DMTE.cdsDocsContWork.FieldByName('BANCOID').AsString);

   If Not DMTE.RecuperarDatos('TGE105', 'CPTODIFG, CPTODIFP, CTADIFG, CTADIFP', cWhere) Then
      Raise Exception.create('No se puede Contabilizar ' + #13 +
         'Falta Definir las Cuentas de Dif. de Cambio');
   wCptoGan := DMTE.cdsRec.FieldByName('CPTODIFG').AsString;
   wCptoPer := DMTE.cdsRec.FieldByName('CPTODIFP').AsString;
   wCtaGan := DMTE.cdsRec.FieldByName('CTADIFG').AsString;
   wCtaPer := DMTE.cdsRec.FieldByName('CTADIFP').AsString;
End;

Procedure TFToolIngresos.Contabiliza;
Var
   xSQL: String;
Begin
   xSQL := 'DELETE FROM CAJA304 '
         + ' WHERE CIAID =' + QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString) + ' AND '
         + '       ECANOMM =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND '
         + '       TDIARID =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND '
         + '       ECNOCOMP =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   // vhn 23/01/2001
   xSQL := 'Select * From CAJA304 '
         + ' WHERE CIAID =' + QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString) + ' AND '
         + '       ECANOMM =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND '
         + '       TDIARID =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND '
         + '       ECNOCOMP =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   DMTE.cdsCNTCaja.Close;
   DMTE.cdsCNTCaja.DataRequest(xSQL);
   DMTE.cdsCNTCaja.Open;

   xNReg := 0;

   Contab_IngCaja('D', '', 'INGRESO A CAJA');

   DMTE.cdsDocsContWork.First;
   While Not DMTE.cdsDocsContWork.Eof Do
   Begin
      Contab_Doc;
      DMTE.cdsDocsContWork.Next;
   End;
End;

Procedure TFToolIngresos.Contab_IngCaja(cDH, cCuenta, cGlosa: String);
Begin
   DMTE.cdsCntCaja.Insert;
   DMTE.cdsCntCaja.FieldByName('CIAID').Value := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
   DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;

   If cCuenta <> '' Then
      DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := cCuenta
   Else
      DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := DMTE.cdsEgrCaja.FieldByName('CUENTAID').Value;

   DMTE.cdsCntCaja.FieldByName('DOCID').Value := DMTE.cdsDocsContWork.FieldByName('DOCID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsDocsContWork.FieldByName('CCSERIE').AsString;
   DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString;

   //DMTE.cdsCntCaja.FieldByName('DCDH').Value        := 'D';
   DMTE.cdsCntCaja.FieldByName('DCDH').Value := cDH;
   DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value := DMTE.cdsEgrCaja.FieldByName('ECMTOORI').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').Value;
   DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value := 'S'; //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').Value := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
   DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := cGlosa;
   DMTE.cdsCntCaja.FieldByName('FCAB').AsString := '1';
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsString := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsString := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsString;
   xNReg := xNReg + 1;
   DMTE.cdsCntCaja.FieldByName('NREG').AsInteger := xNReg;
   DMTE.cdsCntCaja.Post;

End;

Procedure TFToolIngresos.Contab_Doc;
Var
   xSQL: String;
Begin
   xSQL := 'Select * From CAJA301 '
         + ' Where CIAID=''' + dblcCia.Text + ''' and '
         + '       DOCID2=''' + DMTE.cdsDocsContWork.FieldByName('DOCID').AsString + ''' and '
         + '       CPSERIE=''' + DMTE.cdsDocsContWork.FieldByName('CCSERIE').AsString + ''' and '
         + '       CPNODOC=''' + DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString + ''' ';
   DMTE.cdsSQL.Close;
   DMTE.cdsSQL.DataRequest(xSQL);
   DMTE.cdsSQL.Open;
   DMTE.cdsSQL.First;
   While Not DMTE.cdsSQL.Eof Do
   Begin
      DMTE.cdsCntCaja.Insert;
      DMTE.cdsCntCaja.FieldByName('CIAID').Value := DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
      DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
      DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
      DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
      DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
      DMTE.cdsCntCaja.FieldByName('DOCMOD').Value := 'CAJA';

      DMTE.cdsCntCaja.FieldByName('DOCID').Value := DMTE.cdsDocsContWork.FieldByName('DOCID').AsString;
      DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsDocsContWork.FieldByName('CCSERIE').AsString;
      DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString;

      DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').Value;
      DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').Value;

      If DMTE.cdsSQL.FieldByName('CUENTAID').AsString = '16604' Then
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').Value := DMTE.cdsDocsContWork.FieldByName('CCGLOSA').AsString
      Else
      Begin
         If Copy(DMTE.cdsSQL.FieldByName('CUENTAID').AsString, 1, 2) = '16' Then
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').Value := DMTE.cdsReporte.FieldByName('CCNOMB').AsString
         Else
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').Value := DMTE.cdsDocsContWork.FieldByName('CCGLOSA').AsString;
      End;

      DMTE.cdsCntCaja.FieldByName('CPTOID').Value := DMTE.cdsSQL.FieldByName('CPTOID').AsString;
      DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := DMTE.cdsSQL.FieldByName('CUENTAID').AsString;
      DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsDocsContWork.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
      DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsDocsContWork.FieldByName('CLIEID').AsString; //Aqui se toma de la cabecera
      DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value := DMTE.cdsDocsContWork.FieldByName('NCOTCAMB').Value;
      DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value := DMTE.cdsDocsContWork.FieldByName('NCOTCAMB').Value;
      DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value := DMTE.cdsSQL.FieldByName('DEMTOORI').Value;
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsSQL.FieldByName('DEMTOLOC').Value;
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := DMTE.cdsSQL.FieldByName('DEMTOEXT').Value;
      DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value := 'S'; //Registro ya cuadrado
      DMTE.cdsCntCaja.FieldByName('DCLOTE').Value := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
      DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
      DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
      DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
      DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
      DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
      DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
      DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
      DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
      DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
      xNReg := xNReg + 1;
      DMTE.cdsCntCaja.FieldByName('NREG').AsInteger := xNReg;
      DMTE.cdsCntCaja.Post;
      DMTE.cdsSQL.Next;
   End;
   DMTE.cdsSQL.Close;
End;

Procedure TFToolIngresos.Contabiliza2;
Var
   xSQL: String;
Begin
   xSQL := 'DELETE FROM CAJA304 '
         + ' WHERE CIAID =' + QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString) + ' AND '
         + '       ECANOMM =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND '
         + '       TDIARID =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND '
         + '       ECNOCOMP =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xSQL := 'Select * '
         + '  From CAJA304 '
         + ' where CIAID =' + QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString) + ' AND '
         + '       ECANOMM =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND '
         + '       TDIARID =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND '
         + '       ECNOCOMP =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   DMTE.cdsCNTCaja.Close;
   DMTE.cdsCNTCaja.DataRequest(xSQL);
   DMTE.cdsCNTCaja.Open;

   xNReg := 0;

// Inicio HPC_201312_CAJA
// ya hay un Insert en la rutina Contab_IngCaja, no es necesario en esta línea
//   DMTE.cdsCntCaja.Insert;
// Fin HPC_201312_CAJA

   If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
      Contab_IngCaja('D', '1010104', 'INGRESO A BOVEDA CENTRAL')
   Else
      Contab_IngCaja('D', '1010204', 'INGRESO A BOVEDA CENTRAL');

   Contab_IngCaja('H', '', 'TRANSFERENCIA DE CAJA A BOVEDA CENTRAL');
End;

// Inicio HPC_201312_CAJA
Procedure TFToolIngresos.Contabiliza3;
Var
   xCia, xSQL: String;
Begin
   xSQL := 'DELETE FROM CAJA304 '
         + ' WHERE CIAID =' + QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString) + ' AND '
         + '       ECANOMM =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND '
         + '       TDIARID =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND '
         + '       ECNOCOMP =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   Try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   Except
   End;

   xSQL := 'Select * '
         + '  From CAJA304 '
         + ' where CIAID =' + QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString) + ' AND '
         + '       ECANOMM =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) + ' AND '
         + '       TDIARID =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) + ' AND '
         + '       ECNOCOMP =' + QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   DMTE.cdsCNTCaja.Close;
   DMTE.cdsCNTCaja.DataRequest(xSQL);
   DMTE.cdsCNTCaja.Open;

   xSQL := 'Select * From CAJA301 '
      + ' Where CIAID=''' + dblcCia.Text + ''' and '
      + '       DOCID2=''' + DMTE.cdsDocsContWork.FieldByName('DOCID').AsString + ''' and '
      + '       CPSERIE=''' + DMTE.cdsDocsContWork.FieldByName('CCSERIE').AsString + ''' and '
      + '       CPNODOC=''' + DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString + ''' ';
   DMTE.cdsSQL.Close;
   DMTE.cdsSQL.DataRequest(xSQL);
   DMTE.cdsSQL.Open;

   xCia := Copy(DMTE.cdsSQL.FieldByName('CUENTAID').AsString, Length (DMTE.cdsSQL.FieldByName('CUENTAID').AsString) - 1, 2);
   xNReg := 0;

//   DMTE.cdsCntCaja.Insert;

   Contab_IngCaja_3(xCia,'D', '', 'INGRESO A CAJA');

// Inicio HPC_201404_CAJA
   {
   If DMTE.cdsEgrCaja.FieldByName('TMONID').AsString = DMTE.wTMonLoc Then
      Contab_IngCaja_3(xCia,'H', '12101', 'INGRESO A CAJA')
   Else
      Contab_IngCaja_3(xCia,'H', '12102', 'INGRESO A CAJA');
   }
   Contab_IngCaja_3(xCia,'H', xCtaCliFilial, 'INGRESO A CAJA')
// Fin HPC_201404_CAJA


End;
// Fin HPC_201312_CAJA

// Inicio HPC_201312_CAJA
Procedure TFToolIngresos.Contab_IngCaja_3(cCia, cDH, cCuenta, cGlosa: String);
Begin
   DMTE.cdsCntCaja.Insert;
   DMTE.cdsCntCaja.FieldByName('CIAID').Value := cCia;
   DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;

   If cCuenta <> '' Then
      DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := cCuenta
   Else
      DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := DMTE.cdsEgrCaja.FieldByName('CUENTAID').Value;

   DMTE.cdsCntCaja.FieldByName('DOCID').Value := DMTE.cdsDocsContWork.FieldByName('DOCID').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsDocsContWork.FieldByName('CCSERIE').AsString;
   DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString;

   //DMTE.cdsCntCaja.FieldByName('DCDH').Value        := 'D';
   DMTE.cdsCntCaja.FieldByName('DCDH').Value := cDH;
   DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value := DMTE.cdsEgrCaja.FieldByName('ECMTOORI').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').Value;
   DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value := 'S'; //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').Value := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
   DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString := FRegistro.xModulo;
   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString := cGlosa;
   DMTE.cdsCntCaja.FieldByName('FCAB').AsString := '1';
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsString := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsString := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsString;
   xNReg := xNReg + 1;
   DMTE.cdsCntCaja.FieldByName('NREG').AsInteger := xNReg;
   DMTE.cdsCntCaja.Post;

End;
// Fin HPC_201312_CAJA

// Inicio HPC_201312_CAJA
Procedure TFToolIngresos.Contab_Doc3;
Var
   xSQL: String;
Begin
   xSQL := 'Select * From CAJA301 '
         + ' Where CIAID=''' + dblcCia.Text + ''' and '
         + '       DOCID2=''' + DMTE.cdsDocsContWork.FieldByName('DOCID').AsString + ''' and '
         + '       CPSERIE=''' + DMTE.cdsDocsContWork.FieldByName('CCSERIE').AsString + ''' and '
         + '       CPNODOC=''' + DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString + ''' ';
   DMTE.cdsSQL.Close;
   DMTE.cdsSQL.DataRequest(xSQL);
   DMTE.cdsSQL.Open;
   DMTE.cdsSQL.First;
   While Not DMTE.cdsSQL.Eof Do
   Begin
      DMTE.cdsCntCaja.Insert;
      DMTE.cdsCntCaja.FieldByName('CIAID').Value := DMTE.cdsEgrCaja.FieldByName('CIAID').AsString;
      DMTE.cdsCntCaja.FieldByName('TDIARID').Value := DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString;
      DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString;
      DMTE.cdsCntCaja.FieldByName('ECANOMM').Value := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
      DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';
      DMTE.cdsCntCaja.FieldByName('DOCMOD').Value := 'CAJA';

      DMTE.cdsCntCaja.FieldByName('DOCID').Value := DMTE.cdsDocsContWork.FieldByName('DOCID').AsString;
      DMTE.cdsCntCaja.FieldByName('DCSERIE').Value := DMTE.cdsDocsContWork.FieldByName('CCSERIE').AsString;
      DMTE.cdsCntCaja.FieldByName('DCNODOC').Value := DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString;

      DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value := DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value;
      DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').Value;
      DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').Value;

      If DMTE.cdsSQL.FieldByName('CUENTAID').AsString = '16604' Then
         DMTE.cdsCntCaja.FieldByName('DCGLOSA').Value := DMTE.cdsDocsContWork.FieldByName('CCGLOSA').AsString
      Else
      Begin
         If Copy(DMTE.cdsSQL.FieldByName('CUENTAID').AsString, 1, 2) = '16' Then
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').Value := DMTE.cdsReporte.FieldByName('CCNOMB').AsString
         Else
            DMTE.cdsCntCaja.FieldByName('DCGLOSA').Value := DMTE.cdsDocsContWork.FieldByName('CCGLOSA').AsString;
      End;

      DMTE.cdsCntCaja.FieldByName('CPTOID').Value := DMTE.cdsSQL.FieldByName('CPTOID').AsString;
      DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := DMTE.cdsSQL.FieldByName('CUENTAID').AsString;
      DMTE.cdsCntCaja.FieldByName('CLAUXID').Value := DMTE.cdsDocsContWork.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
      DMTE.cdsCntCaja.FieldByName('DCAUXID').Value := DMTE.cdsDocsContWork.FieldByName('CLIEID').AsString; //Aqui se toma de la cabecera
      DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value := DMTE.cdsDocsContWork.FieldByName('NCOTCAMB').Value;
      DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value := DMTE.cdsDocsContWork.FieldByName('NCOTCAMB').Value;
      DMTE.cdsCntCaja.FieldByName('TMONID').Value := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
      DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value := DMTE.cdsSQL.FieldByName('DEMTOORI').Value;
      DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := DMTE.cdsSQL.FieldByName('DEMTOLOC').Value;
      DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := DMTE.cdsSQL.FieldByName('DEMTOEXT').Value;
      DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value := 'S'; //Registro ya cuadrado
      DMTE.cdsCntCaja.FieldByName('DCLOTE').Value := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
      DMTE.cdsCntCaja.FieldByName('DCANO').AsString := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
      DMTE.cdsCntCaja.FieldByName('DCMM').AsString := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
      DMTE.cdsCntCaja.FieldByName('DCDD').AsString := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
      DMTE.cdsCntCaja.FieldByName('DCSS').AsString := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
      DMTE.cdsCntCaja.FieldByName('DCSEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
      DMTE.cdsCntCaja.FieldByName('DCTRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
      DMTE.cdsCntCaja.FieldByName('DCAASS').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
      DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
      DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
      xNReg := xNReg + 1;
      DMTE.cdsCntCaja.FieldByName('NREG').AsInteger := xNReg;
      DMTE.cdsCntCaja.Post;
      DMTE.cdsSQL.Next;
   End;
   DMTE.cdsSQL.Close;
End;
// Fin HPC_201312_CAJA

Procedure TFToolIngresos.bbtnImprimeContaClick(Sender: TObject);
Var
   xSQL, cMes, cUsers: String;
Begin

   xSQL := 'Select * From CAJ_USU_SUP where USUSUP=''' + DMTE.wUsuario + ''' or USUCAJ=''' + DMTE.wUsuario + '''';

   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.RecordCount = 0 Then
   Begin
      ShowMessage('Usuario No Registrado para Esta Opcion');
      Exit;
   End;

   If DMTE.wAdmin = 'U' Then
      xSQL := 'Select NCOUSER From CXC303 '
            + ' where CIAID=''' + dblcCIA.text + ''' '
            + '   and CCFEMIS=''' + DateToStr(dtpFecha.date) + ''' '
            + '   and NCOUSER=''' + DMTE.wUsuario + ''' AND ECNOCOMP IS NULL'
   Else
      xSQL := 'Select NCOUSER From CXC303 A, CAJ_USU_SUP B '
            + ' where A.CIAID=''' + dblcCIA.text + ''' '
            + '   and A.CCFEMIS=''' + DateToStr(dtpFecha.date) + ''' AND ECNOCOMP IS NULL '
            + '   and B.USUSUP=''' + DMTE.wUsuario + ''' AND A.NCOUSER=B.USUCAJ '
            + ' group by NCOUSER';

   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   If DMTE.cdsReporte.RecordCount > 0 Then
   Begin
      cUsers := '';
      While Not DMTE.cdsReporte.Eof Do
      Begin
         cUsers := cUsers + DMTE.cdsReporte.FieldByName('NCOUSER').AsString + #13 + '';
         DMTE.cdsReporte.Next;
      End;
      ShowMessage('Usuario(s) que NO han Contabilizado sus Ingresos a Caja ' + #13 + #13 + cUsers);
      Exit;
   End;

   cMes := Copy(DateToStr(dtpFecha.Date), 7, 4) + Copy(DateToStr(dtpFecha.Date), 4, 2);

   If DMTE.wAdmin = 'U' Then
      xSQL := 'select A.CIAID, C.CIADES, A.TDIARID, A.ECANOMM, A.ECNOCOMP, B.CUENTAID, NVL(B.CNTNODOC, X.CNTNODOC) CNTNODOC, '
            + '       NVL(B.CNTGLOSA,''A N U L A D O'') CNTGLOSA, NVL(B.CNTDEBEMN,0) CNTDEBEMN, NVL(B.CNTHABEMN,0) CNTHABEMN, '
            + '       A.ECFCOMP, D.TDIARDES, B.CNTDH, ECUSER, USERNOM, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonLoc + ''' AND B.CNTDH=''D'' THEN ECMTOORI ELSE 0 END SOLES, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonExt + ''' AND B.CNTDH=''D'' THEN ECMTOORI ELSE 0 END DOLARES '
            + '  from CAJA302 A, CNT301 B, CNT311 X, TGE101 C, TGE104 D, TGE006 E '
            + ' Where A.CIAID=''' + dblcCia.Text + ''' AND A.ECANOMM=''' + cMes + ''' '
            + '   and A.TDIARID=''05'' AND A.ECFCOMP=''' + DateToStr(dtpFecha.Date) + ''' '
            + '   and ECUSER=''' + DMTE.wUsuario + ''' '
            + '   and A.CIAID=B.CIAID(+) AND A.TDIARID=B.TDIARID(+) AND A.ECANOMM=B.CNTANOMM(+) AND A.ECNOCOMP=B.CNTCOMPROB(+) '
            + '   and A.CIAID=X.CIAID(+) AND A.TDIARID=X.TDIARID(+) AND A.ECANOMM=X.CNTANOMM(+) AND A.ECNOCOMP=X.CNTCOMPROB(+) '
            + '   and A.CIAID=C.CIAID AND A.TDIARID=D.TDIARID AND A.ECUSER=E.USERID(+) '
   Else
      xSQL := 'select A.CIAID, C.CIADES, A.TDIARID, A.ECANOMM, A.ECNOCOMP, B.CUENTAID, B.CNTNODOC, '
            + '       B.CNTGLOSA, B.CNTDEBEMN, B.CNTHABEMN, A.ECFCOMP, D.TDIARDES, B.CNTDH, ECUSER, USERNOM, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonLoc + ''' AND B.CNTDH=''D'' THEN ECMTOORI ELSE 0 END SOLES, '
            + '       CASE WHEN A.TMONID=''' + DMTE.wTMonExt + ''' AND B.CNTDH=''D'' THEN ECMTOORI ELSE 0 END DOLARES '
            + '  from CAJA302 A, CNT301 B, CNT311 X, TGE101 C, TGE104 D, TGE006 E, CAJ_USU_SUP F   '
            + ' where A.CIAID=''' + dblcCia.Text + ''' AND A.ECANOMM=''' + cMes + ''' '
            + '   and A.TDIARID=''05'' AND A.ECFCOMP=''' + DateToStr(dtpFecha.Date) + ''' '
            + '   and A.CIAID=B.CIAID(+) AND A.TDIARID=B.TDIARID(+) AND A.ECANOMM=B.CNTANOMM(+) AND A.ECNOCOMP=B.CNTCOMPROB(+) '
            + '   and A.CIAID=X.CIAID(+) AND A.TDIARID=X.TDIARID(+) AND A.ECANOMM=X.CNTANOMM(+) AND A.ECNOCOMP=X.CNTCOMPROB(+) '
            + '   and A.CIAID=C.CIAID AND A.TDIARID=D.TDIARID AND A.ECUSER=E.USERID(+) '
            + '   and F.USUSUP=''' + DMTE.wUsuario + ''' AND A.ECUSER=F.USUCAJ ';

   xSQL := xSQL
         + 'UNION ALL '
         + 'select A.CIAID, C.CIADES, A.TDIARID, A.ECANOMM, A.ECNOCOMP, B.CUENTAID, NVL(B.CNTNODOC, X.CNTNODOC) CNTNODOC, '
         + '       NVL(B.CNTGLOSA,''A N U L A D O'') CNTGLOSA, NVL(B.CNTDEBEMN,0) CNTDEBEMN, NVL(B.CNTHABEMN,0) CNTHABEMN, '
         + '       A.ECFCOMP, D.TDIARDES, B.CNTDH, ECUSER, USERNOM, '
         + '       CASE WHEN A.TMONID=''' + DMTE.wTMonLoc + ''' AND B.CNTDH=''D'' THEN ECMTOORI ELSE 0 END SOLES, '
         + '       CASE WHEN A.TMONID=''' + DMTE.wTMonExt + ''' AND B.CNTDH=''D'' THEN ECMTOORI ELSE 0 END DOLARES '
         + '  from CAJA302 A, CNT301 B, CNT311 X, TGE101 C, TGE104 D, TGE006 E '
         + ' WHERE A.CIAID=''' + dblcCia.Text + ''' AND A.ECANOMM=''' + cMes + ''' '
         + '   AND A.TDIARID=''04'' AND A.ECFCOMP=''' + DateToStr(dtpFecha.Date) + ''' ';

   If DMTE.wAdmin = 'U' Then
      xSQL := xSQL
         + '   AND ECUSER=''' + DMTE.wUsuario + ''' ';

   xSQL := xSQL
         + '   AND A.CIAID=B.CIAID(+) AND A.TDIARID=B.TDIARID(+) AND A.ECANOMM=B.CNTANOMM(+) AND A.ECNOCOMP=B.CNTCOMPROB(+) '
         + '   AND A.CIAID=X.CIAID(+) AND A.TDIARID=X.TDIARID(+) AND A.ECANOMM=X.CNTANOMM(+) AND A.ECNOCOMP=X.CNTCOMPROB(+) '
         + '   AND A.CIAID=C.CIAID AND A.TDIARID=D.TDIARID AND A.ECUSER=E.USERID(+) '
         + ' ORDER BY CIAID, TDIARID DESC, ECNOCOMP, CNTDH';

   DMTE.cdsReporte.Close;
   DMTE.cdsReporte.DataRequest(xSQL);
   DMTE.cdsReporte.Open;

   ppdb1.DataSource := DMTE.dsReporte;

   If DMTE.wAdmin = 'U' Then
      ppr1.TEMPLATE.FileName := wRutaRpt + '\IngresosConta.Rtm'
   Else
      ppr1.TEMPLATE.FileName := wRutaRpt + '\IngresosContaADM.Rtm';

   ppr1.template.LoadFromFile;

   ppd1.Report := ppr1;

   If cbDiseno.Checked Then
      ppd1.ShowModal
   Else
      ppr1.Print;

   ppr1.Stop;
   ppd1.Report := Nil;
   ppdb1.DataSource := Nil;
End;

Procedure TFToolIngresos.SpeedButton1Click(Sender: TObject);
Begin
   cbDiseno.Checked := Not cbDiseno.Checked;
End;

function Left(Source: string; Length: integer): string;
begin
	Result := copy(Source,1,Length);
end;

function Right(Source: string; Lengths: integer): string;
begin
Result := copy(source,Length(Source) - Lengths,Lengths);
end;

function Mid(Source: string; Start: integer; Length: integer): string;
begin
	Result := copy(Source,Start,Length);
end;

End.


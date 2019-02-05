Unit CAJA288;

// Inicio Uso Estándares:   01/08/2011
// Unidad               :   CxP262
// Formulario           :   FOrdenSelec
// Fecha de Creación    :   14/04/2010
// Autor                :   Hugo Noriega
// Objetivo             :   Seleccionar documentos para su cancelación por orden de pago.
//
// Actualizaciones      :
// HPP_201104_CXP  09/08/2011  Validar que no se seleccione un documento cancelado.
// HPC_201107_CXP  10/10/2011  Se implementa la función fg_Valida_Provision que se
//                             encarga de validar si el registro de la provisión
//                             se realizó correctamente.
// HPC_201310_CAJA  14/11/2013 Automatizacion de detracciones y autodetracciones pago manual
// HPC_201401_CAJA  08/05/2014 Se incluye la Fecha de Emisión del Documento
// HPC_201501_CAJA  12/01/2015  Automatización en el Pago de Detracciones de Proveedores generada por
//                             Orden de Pago en el Módulo de Tesorería.
// HPC_201601_CAJA  06/01/2016 Se cambió valor máximo del año con fecha del sistema.
// HPC_201603_CAJA  01/06/2016 Se incluye estado C (Cancelado) a Filtro
// CAJA-201804      27/09/2018 Se implementa el descuento de la Nota de Crédito

Interface

Uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Buttons, Wwkeycb, ExtCtrls,
   Spin;

Type
   TFOrdenSelec = Class(TForm)
      dbgSelec: TwwDBGrid;
      bbtnTranferir: TBitBtn;
      pnlBusca: TPanel;
      lblBusca1: TLabel;
      lblBusca2: TLabel;
      isBusca: TwwIncrementalSearch;
      seMes: TSpinEdit;
      seAno: TSpinEdit;
      Label1: TLabel;
      bbtnBuscar: TBitBtn;
      bbtnTlb: TBitBtn;
      Procedure FormActivate(Sender: TObject);
      Procedure bbtnTranferirClick(Sender: TObject);
      Procedure dbgSelecTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure isBuscaExit(Sender: TObject);
      Procedure bbtnBuscarClick(Sender: TObject);
      Procedure dbgSelecDblClick(Sender: TObject);
      Procedure bbtnTlbClick(Sender: TObject);
   Private
    { Private declarations }  
// Inicio CAJA-201804
// Se adiciona nuevas variables al formulario
      xTotalprv, nPago: double;					  
// Fin CAJA-201804
      Function fg_Valida_Provision(wgCiaid, wgClauxId, wgProv, wgDocId, wgCpSerie, wgCpNodoc: String): Boolean;
   Public
    { Public declarations }
   End;

Var
   FOrdenSelec: TFOrdenSelec;

Implementation

{$R *.dfm}

Uses CAJADM, CAJA287;

Procedure TFOrdenSelec.FormActivate(Sender: TObject);
Var
   ano, mes, dia: Word;
Begin
   dbgSelec.Selected.Clear;
   dbgSelec.Selected.Add('MARCA'#9'3'#9'(x)'#9'F');
   dbgSelec.Selected.Add('CIAID'#9'3'#9'Cía'#9'F');
   dbgSelec.Selected.Add('CPANOMES'#9'6'#9'Periodo'#9'F');
   dbgSelec.Selected.Add('TDIARID'#9'3'#9'TD'#9'F');
   dbgSelec.Selected.Add('CPNOREG'#9'11'#9'No.Reg'#9'F');
   dbgSelec.Selected.Add('CLAUXID'#9'3'#9'Cl.~Aux'#9'F');
   dbgSelec.Selected.Add('PROV'#9'8'#9'Id'#9'F');
   dbgSelec.Selected.Add('PROVDES'#9'22'#9'Razón Social/Nombres'#9'F');
   dbgSelec.Selected.Add('DOCID'#9'3'#9'Doc'#9'F');
   dbgSelec.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
   dbgSelec.Selected.Add('CPNODOC'#9'12'#9'No.~Documento'#9'F');
   dbgSelec.Selected.Add('TMONID'#9'3'#9'TM'#9'F');
   dbgSelec.Selected.Add('CPMTOORI'#9'10'#9'Importe'#9'F');
   dbgSelec.Selected.Add('CPSALORI'#9'10'#9'Saldo'#9'F');
   dbgSelec.Selected.Add('PROVRETIGV'#9'3'#9'Ret'#9'F');
   dbgSelec.SetControlType('MARCA', fctCheckBox, 'S;N');

   DecodeDate(date, ano, mes, dia);

// Inicio HPC_201601_CAJA
//  06/01/2016 Se cambió valor máximo del año con fecha del sistema
   seAno.MaxValue := Ano;
// Fin HPC_201601_CAJA

   seAno.Value := Ano;
   seMes.Value := Mes;

   bbtnBuscarClick(Self);
End;
// Inicio CAJA-201804
// Se implementa el descuento de la Nota de Crédito
Procedure TFOrdenSelec.bbtnTranferirClick(Sender: TObject);
Var
   xx : Currency;
   xSQL: String;
   nRete, xTasaRet, nDetra: Double;
   xnporc : Double;
   nReg: Integer;
Begin
   xSQL := 'Select TASAMTO, TASACAN, TASADES,TASAFEC from TGE108 Where TASAFLG=''R''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.Datarequest(xSQL);
   DMTE.cdsQry.Open;
   xTasaRet := (DMTE.cdsQry.FieldByname('TASACAN').AsFloat / 100);
   xnporc := 0;
   xSQL := 'Select NVL(max( ITEM ),''000'') MAXITEM from CXP_ORD_PAG_DET '
          + 'where CIAID =''' + DMTE.cdsOPago.FieldByname('CIAID').AsString + ''' '
          + ' and NUMERO=''' + DMTE.cdsOPago.FieldByname('NUMERO').AsString + ''' ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.Datarequest(xSQL);
   DMTE.cdsQry.Open;

   nReg := StrToInt(DMTE.cdsQry.FieldByname('MAXITEM').AsString);
   FPagoDetCab.xModu := DMTE.cdsMovCxP.FieldByName('MOD').AsString;
   DMTE.cdsMovCxP.First;
   While Not DMTE.cdsMovCxP.Eof Do
   Begin
      If DMTE.cdsMovCxP.FieldByName('MOD').AsString = 'CAJA' Then
      Begin
         If DMTE.cdsMovCxP.FieldByName('MARCA').AsString = 'S' Then
         Begin
            nRete := 0;
            nDetra := 0;
            xTotalprv := 0;
            If DMTE.cdsMovCxP.FieldByName('PROVRETIGV').AsString = 'S' Then
               nRete := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat * xTasaRet, 15, 2);

            If DMTE.cdsMovCxP.FieldByName('DTRPORC').AsFloat > 0 Then
            Begin
               xSQL := 'Select * from CXP302 '
                     + 'where CIAID=''' + DMTE.cdsMovCxP.FieldByname('CIAID').AsString + ''' '
                     + 'and TDIARID=''' + DMTE.cdsMovCxP.FieldByName('TDIARID').AsString + ''' '
                     + 'and DCPANOMM=''' + DMTE.cdsMovCxP.FieldByName('CPANOMES').AsString + ''' '
                     + 'and CPNOREG=''' + DMTE.cdsMovCxP.FieldByName('CPNOREG').AsString + ''' '
                     + 'and TREGID=''13''';
               DMTE.cdsQry.Close;
               DMTE.cdsQry.Datarequest(xSQL);
               DMTE.cdsQry.Open;
               nDetra := DMTE.cdsQry.FieldByname('DCPMOORI').AsFloat;
               xSQL := ' Select * from CXP302 '
                     + ' where CIAID=''' + DMTE.cdsMovCxP.FieldByname('CIAID').AsString + ''' '
                     + ' and TDIARID=''' + DMTE.cdsMovCxP.FieldByName('TDIARID').AsString + ''' '
                     + ' and DCPANOMM=''' + DMTE.cdsMovCxP.FieldByName('CPANOMES').AsString + ''' '
                     + ' and CPNOREG=''' + DMTE.cdsMovCxP.FieldByName('CPNOREG').AsString + ''' '
                     + ' and TREGID=''07''';
               DMTE.cdsQry.Close;
               DMTE.cdsQry.Datarequest(xSQL);
               DMTE.cdsQry.Open;
               xTotalprv := DMTE.cdsQry.FieldByname('DCPMOORI').AsFloat;
            End;

            If nRete > 0 Then
               nPago := DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat - nRete
            Else
               If DMTE.cdsMovCxP.FieldByName('DTRPORC').AsFloat > 0 Then
                  nPago := xTotalprv
               Else
                  nPago := DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat;

            xSQL := 'Select to_char(b.cpfemis,''yyyymm'') PERIODO_DOC, b.CPTODETRSUNATID, b.TIPOOPERSUNATID, A.PROVRUC, '
                  + ' nvl(DEMTOLOC,0) DEMTOLOC, B.DOCID,  B.CPSERIE, B.CPNODOC, '
                  + ' b.cpfemis, c.tcamvbv, b.tmonid, '
                  + ' Case when B.TMonId=''D'' then ROUND(nvl(DEMTOORI,0)*C.TCamVBV,2) else nvl(DEMTOLOC, 0) end IMPPAGO '
                  + ' From CAJA303 a, CXP301 b, tge107 c '
                  + ' Where a.ciaid=''' + DMTE.cdsMovCxP.FieldByName('CIAID').AsString + ''' '
                  + ' and a.ecanomm=''' + DMTE.cdsMovCxP.FieldByName('CPANOMES').AsString + ''' '
                  + ' and a.tdiarid=''' + DMTE.cdsMovCxP.FieldByName('TDIARID').AsString + ''' '
                  + ' and a.ecnocomp=''' + DMTE.cdsMovCxP.FieldByName('CPNOREG').AsString + ''' '
                  + ' and a.ciaid2=b.ciaid and tdiarid2=b.tdiarid and a.cpanomm=b.cpanomes and a.cpnoreg=b.cpnoreg '
                  + ' and b.cpfemis = c.fecha(+) '
                  + ' order by ecnocomp';
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest(xSQL);
            DMTE.cdsQry.Open;

            While Not DMTE.cdsQry.Eof Do
            Begin
               nReg := nReg + 1;
               nPago := DMTE.FRound(DMTE.cdsQry.FieldByName('IMPPAGO').AsFloat, 15, 0);
            // Inicio HPC_201501_CAJA
               xSQL := ' Insert into CXP_ORD_PAG_DET( CIAID, NUMERO, ITEM, CLAUXID, AUXID, DOCID, CPSERIE, CPNODOC, '
                     + ' TMONID, CPMTOORI, CPPAGORI, CPSALORI, IMPPAGO, IMPRETE, FREG, HREG, USUARIO, ESTADO, NUMDETRAC, MOD_DETR ) '
                     + ' Values( ''' + DMTE.cdsOPago.FieldByName('CIAID').AsString + ''', '
                     + '''' + DMTE.cdsOPago.FieldByName('NUMERO').AsString + ''', '
                     + '''' + DMTE.strzero(IntToStr(nReg), 3) + ''', '
                     + '''' + DMTE.cdsMovCxP.FieldByName('CLAUXID').AsString + ''', '
                     + '''' + DMTE.cdsMovCxP.FieldByName('PROV').AsString + ''', '
                     + '''' + DMTE.cdsQry.FieldByName('DOCID').AsString + ''', '
                     + '''' + DMTE.cdsQry.FieldByName('CPSERIE').AsString + ''', '
                     + '''' + DMTE.cdsQry.FieldByName('CPNODOC').AsString + ''', '
                     + '''' + DMTE.cdsMovCxP.FieldByName('TMONID').AsString + ''', '
                     + FloatToStr(DMTE.cdsQry.FieldByName('IMPPAGO').AsFloat) + ', '
                     + FloatToStr(DMTE.cdsQry.FieldByName('IMPPAGO').AsFloat - nPago) + ', '
                     + FloatToStr(DMTE.cdsQry.FieldByName('IMPPAGO').AsFloat) + ', '
                     + FloatToStr(nPago) + ', '
                     + FloatToStr(nRete + nDetra) + ', '
                     + 'SYSDATE, SYSDATE, '
                     + '''' + DMTE.wUsuario + ''', '
                     + '''P'', '
                     + '''' + DMTE.cdsMovCxP.FieldByName('CPNODOC').AsString + ''', '
                     + '''CAJA'' '
                     + ' )';
            // Fin HPC_201501_CAJA
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
               DMTE.cdsQry.Next;
            End;

            xSQL := 'Update CAJA302 SET ECOPAGO=''' + DMTE.cdsOPago.FieldByName('NUMERO').AsString + ''' '
                  + ' WHERE CIAID=''' + DMTE.cdsOPago.FieldByname('CIAID').AsString + ''' '
                  + ' AND ECNOCHQ=''' + DMTE.cdsMovCxP.FieldByName('CPNODOC').AsString + ''' '
                  + ' AND ECNOCOMP = ' + QuotedStr(DMTE.cdsMovCxP.FieldByName('CPNOREG').AsString)
                  + ' AND PROV=''' + DMTE.cdsMovCxP.FieldByName('PROV').AsString + ''' '
                  + ' AND CLAUXID=''' + DMTE.cdsMovCxP.FieldByName('CLAUXID').AsString + ''' ';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         End;
      End
      Else
      Begin
         If DMTE.cdsMovCxP.FieldByName('MARCA').AsString = 'S' Then
         Begin
            nRete := 0;
            nDetra := 0;
            xTotalprv := 0;
            If DMTE.cdsMovCxP.FieldByName('PROVRETIGV').AsString = 'S' Then
               nRete := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat * xTasaRet, 15, 2);

(*
            If DMTE.cdsMovCxP.FieldByName('DTRPORC').AsFloat > 0 Then
            Begin
               xSQL := 'Select * from CXP302 '
                     + 'where CIAID=''' + DMTE.cdsMovCxP.FieldByname('CIAID').AsString + ''' '
                     + 'and TDIARID=''' + DMTE.cdsMovCxP.FieldByName('TDIARID').AsString + ''' '
                     + 'and DCPANOMM=''' + DMTE.cdsMovCxP.FieldByName('CPANOMES').AsString + ''' '
                     + 'and CPNOREG=''' + DMTE.cdsMovCxP.FieldByName('CPNOREG').AsString + ''' '
                     + 'and TREGID=''13''';
               DMTE.cdsQry.Close;
               DMTE.cdsQry.Datarequest(xSQL);
               DMTE.cdsQry.Open;
               nDetra := DMTE.cdsQry.FieldByname('DCPMOORI').AsFloat;
               xSQL := ' Select * from CXP302 '
                     + ' where CIAID=''' + DMTE.cdsMovCxP.FieldByname('CIAID').AsString + ''' '
                     + ' and TDIARID=''' + DMTE.cdsMovCxP.FieldByName('TDIARID').AsString + ''' '
                     + ' and DCPANOMM=''' + DMTE.cdsMovCxP.FieldByName('CPANOMES').AsString + ''' '
                     + ' and CPNOREG=''' + DMTE.cdsMovCxP.FieldByName('CPNOREG').AsString + ''' '
                     + ' and TREGID=''07''';
               DMTE.cdsQry.Close;
               DMTE.cdsQry.Datarequest(xSQL);
               DMTE.cdsQry.Open;
               nTotal := DMTE.cdsQry.FieldByname('DCPMOORI').AsFloat;
            End;
*)
            If DMTE.cdsMovCxP.FieldByName('DTRPORC').AsFloat > 0 Then
            Begin
               xSQL := 'Select A.ciaid, A.tdiarid, A.cpnoreg, A.dcpanoc, A.dcpanomm, A.dcplote, A.dcpcomp, A.transid, A.cptoid, A.cuentaid, A.clauxid, A.dcpauxid, A.docid, A.cpserie, A.cpnodoc, '
                     + ' A.dcpglosa, A.dcpdh, A.ccosid, A.cptcampr, A.cptcampa, CASE WHEN G.CPNOREG IS NULL THEN A.DCPMOORI ELSE (A.DCPMOORI - G.DCPMOORI) END  DCPMTOORI, '
                     + ' CASE WHEN G.CPNOREG IS NULL THEN A.DCPMOLOC ELSE (A.DCPMOLOC - G.DCPMOLOC) END  DCPMTOLOC, CASE WHEN G.CPNOREG IS NULL THEN A.DCPMOEXT ELSE (A.DCPMOEXT - G.DCPMOEXT) END  DCPMTOEXT, '
                     + ' A.cpfemis, A.cpfvcmto, A.dcpfcom, A.dcpestdo, A.dcpflcdr, A.dcpflaut, A.dcpuser, '
                     + ' A.dcpfreg, A.dcphreg, A.dcpmm, A.dcpdd, A.dcptri, A.dcpsem, A.dcpss, A.dcpaatri, A.dcpaasem, A.dcpaass, A.tregid, A.tmonid, A.flagvar, A.tipdet, '
                     + ' G.CPNOREG, G.DOCID, G.CPSERIE, G.CPNODOC, G.TDIARID, G.CPANOMES, G.CIAID, G.DCPDH, G.CPTCAMPR, G.CPTCAMPA, G.DCPMOORI, G.DCPMOLOC, G.DCPMOEXT '
                     + ' from CXP302 A, CXP301 B, CXP305 F, '
                     + ' (SELECT X.CIAID, X.CPANOMES, X.TDIARID, X.CPNOREG, X.CLAUXID, X.PROV, X.TCANJEID, X.CPCANJE, Z.CUENTAID, Z.DCPDH, Z.DOCID, Z.CPSERIE, Z.CPNODOC, Z.CPTCAMPR, Z.CPTCAMPA, Z.DCPMOORI, Z.DCPMOLOC, Z.DCPMOEXT '
                     + ' FROM CXP301 X,CXP302 Z WHERE X.CIAID=Z.CIAID and X.TDIARID=Z.TDIARID and X.CPANOMES=Z.DCPANOMM and X.CPNOREG=Z.CPNOREG AND Z.TIPDET=''I4'') G '
                     + ' where B.CIAID=A.CIAID and B.TDIARID=A.TDIARID and B.CPANOMES=A.DCPANOMM and B.CPNOREG=A.CPNOREG '
                     + ' and A.CIAID=''' + DMTE.cdsMovCxP.FieldByname('CIAID').AsString + ''' '
                     + ' and A.TDIARID=''' + DMTE.cdsMovCxP.FieldByName('TDIARID').AsString + ''' '
                     + ' and A.DCPANOMM=''' + DMTE.cdsMovCxP.FieldByName('CPANOMES').AsString + ''' '
                     + ' and A.CPNOREG=''' + DMTE.cdsMovCxP.FieldByName('CPNOREG').AsString + ''' '
                     + ' and A.TIPDET=''I4'' '
                     + ' AND B.CIAID = F.CIAID(+) AND B.CLAUXID = F.CLAUXID(+) AND B.PROV= F.PROV(+) AND B.DOCID = F.DOCID(+) AND B.CPSERIE = F.CPSERIE(+) AND B.CPNODOC = F.CPNODOC(+) '
                     + ' AND F.CIAID = G.CIAID(+) AND F.CLAUXID = G.CLAUXID(+) AND F.PROV = G.PROV(+) AND F.TCANJEID = G.TCANJEID(+) AND F.CCPCANJE = G.CPCANJE(+) ';
               DMTE.cdsQry.Close;
               DMTE.cdsQry.Datarequest(xSQL);
               DMTE.cdsQry.Open;
               nDetra := DMTE.cdsQry.FieldByname('DCPMTOORI').AsFloat;
               xSQL := 'Select A.ciaid, A.tdiarid, A.cpnoreg, A.dcpanoc, A.dcpanomm, A.dcplote, A.dcpcomp, A.transid, A.cptoid, A.cuentaid, A.clauxid, A.dcpauxid, A.docid, A.cpserie, A.cpnodoc, '
                     + ' A.dcpglosa, A.dcpdh, A.ccosid, A.cptcampr, A.cptcampa, CASE WHEN G.CPNOREG IS NULL THEN A.DCPMOORI ELSE (A.DCPMOORI - G.DCPMOORI) END  DCPMTOORI, '
                     + ' CASE WHEN G.CPNOREG IS NULL THEN A.DCPMOLOC ELSE (A.DCPMOLOC - G.DCPMOLOC) END  DCPMTOLOC, CASE WHEN G.CPNOREG IS NULL THEN A.DCPMOEXT ELSE (A.DCPMOEXT - G.DCPMOEXT) END  DCPMTOEXT, '
                     + ' A.cpfemis, A.cpfvcmto, A.dcpfcom, A.dcpestdo, A.dcpflcdr, A.dcpflaut, A.dcpuser, '
                     + ' A.dcpfreg, A.dcphreg, A.dcpmm, A.dcpdd, A.dcptri, A.dcpsem, A.dcpss, A.dcpaatri, A.dcpaasem, A.dcpaass, A.tregid, A.tmonid, A.flagvar, A.tipdet, '
                     + ' G.CPNOREG, G.DOCID, G.CPSERIE, G.CPNODOC, G.TDIARID, G.CPANOMES, G.CIAID, G.DCPDH, G.CPTCAMPR, G.CPTCAMPA, G.DCPMOORI, G.DCPMOLOC, G.DCPMOEXT '
                     + ' from CXP302 A, CXP301 B, CXP305 F, '
                     + ' (SELECT X.CIAID, X.CPANOMES, X.TDIARID, X.CPNOREG, X.CLAUXID, X.PROV, X.TCANJEID, X.CPCANJE, Z.CUENTAID, Z.DCPDH, Z.DOCID, Z.CPSERIE, Z.CPNODOC, Z.CPTCAMPR, Z.CPTCAMPA, Z.DCPMOORI, Z.DCPMOLOC, Z.DCPMOEXT '
                     + ' FROM CXP301 X,CXP302 Z WHERE X.CIAID=Z.CIAID and X.TDIARID=Z.TDIARID and X.CPANOMES=Z.DCPANOMM and X.CPNOREG=Z.CPNOREG AND Z.TIPDET=''TO'') G '
                     + ' where B.CIAID=A.CIAID and B.TDIARID=A.TDIARID and B.CPANOMES=A.DCPANOMM and B.CPNOREG=A.CPNOREG '
                     + ' and A.CIAID=''' + DMTE.cdsMovCxP.FieldByname('CIAID').AsString + ''' '
                     + ' and A.TDIARID=''' + DMTE.cdsMovCxP.FieldByName('TDIARID').AsString + ''' '
                     + ' and A.DCPANOMM=''' + DMTE.cdsMovCxP.FieldByName('CPANOMES').AsString + ''' '
                     + ' and A.CPNOREG=''' + DMTE.cdsMovCxP.FieldByName('CPNOREG').AsString + ''' '
                     + ' and A.TIPDET=''TO'' '
                     + ' AND B.CIAID = F.CIAID(+) AND B.CLAUXID = F.CLAUXID(+) AND B.PROV= F.PROV(+) AND B.DOCID = F.DOCID(+) AND B.CPSERIE = F.CPSERIE(+) AND B.CPNODOC = F.CPNODOC(+) '
                     + ' AND F.CIAID = G.CIAID(+) AND F.CLAUXID = G.CLAUXID(+) AND F.PROV = G.PROV(+) AND F.TCANJEID = G.TCANJEID(+) AND F.CCPCANJE = G.CPCANJE(+) ';
               DMTE.cdsQry.Close;
               DMTE.cdsQry.Datarequest(xSQL);
               DMTE.cdsQry.Open;
               xTotalprv :=  StrToFloat(DMTE.cdsQry.FieldByname('DCPMTOORI').AsString);
            End;

            If (nRete > 0) Then
            begin
               nPago := DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat - nRete;
            end
            Else
            begin
               xnporc := strtoFloat(DMTE.cdsMovCxP.FieldByName('DTRPORC').AsString);
               If (xnporc = 0) Then
                  nPago := 0;
               If (xnporc > 0) Then
                  nPago := xTotalprv;

            end;
            xSQL := 'Select to_char(b.cpfemis,''yyyymm'') PERIODO_DOC, b.CPTODETRSUNATID, b.TIPOOPERSUNATID, B.PROVRUC, '
                  + ' nvl(CPMTOORI,0) CPMTOORI, B.DOCID,  B.CPSERIE, B.CPNODOC, '
                  + ' b.cpfemis, c.tcamvbv, b.tmonid, '
                  + ' Case when B.TMonId=''D'' then CASE WHEN G.CPNOREG IS NULL THEN ROUND(nvl(A.DCPMOORI,0)*C.TCamVBV,2) '
                  + ' ELSE ROUND((nvl(A.DCPMOORI,0) - nvl(G.DCPMOORI,0))*C.TCamVBV,2) END else CASE WHEN G.CPNOREG IS NULL THEN ROUND(nvl(A.DCPMOLOC,0),2) ELSE ROUND((nvl(A.DCPMOLOC,0) - nvl(G.DCPMOLOC,0)),2) END end IMPPAGO, '
                  + ' G.CPNOREG, G.DOCID, G.CPSERIE, G.CPNODOC, G.TDIARID, G.CPANOMES, G.CIAID, G.DCPDH, G.CPTCAMPR, G.CPTCAMPA, G.DCPMOORI, G.DCPMOLOC, G.DCPMOEXT '
                  + ' From CXP302 a, CXP301 b, tge107 c, CXP305 F, '
                  + ' (SELECT X.CIAID, X.CPANOMES, X.TDIARID, X.CPNOREG, X.CLAUXID, X.PROV, X.TCANJEID, X.CPCANJE, Z.CUENTAID, Z.DCPDH, Z.DOCID, Z.CPSERIE, Z.CPNODOC, Z.CPTCAMPR, Z.CPTCAMPA, Z.DCPMOORI, Z.DCPMOLOC, Z.DCPMOEXT '
                  + ' FROM CXP301 X,CXP302 Z WHERE X.CIAID=Z.CIAID and X.TDIARID=Z.TDIARID and X.CPANOMES=Z.DCPANOMM and X.CPNOREG=Z.CPNOREG AND Z.TIPDET=''I4'') G '
                  + ' Where a.ciaid=''' + DMTE.cdsMovCxP.FieldByName('CIAID').AsString + ''' '
                  + ' and B.CPANOMES=''' + DMTE.cdsMovCxP.FieldByName('CPANOMES').AsString + ''' '
                  + ' and a.tdiarid=''' + DMTE.cdsMovCxP.FieldByName('TDIARID').AsString + ''' '
                  + ' and B.CPNOREG=''' + DMTE.cdsMovCxP.FieldByName('CPNOREG').AsString + ''' '
                  + ' and B.PROV=''' + DMTE.cdsMovCxP.FieldByName('PROV').AsString + ''' '
                  + ' and A.tipdet=''I4'' '
                  + ' and a.ciaid=b.ciaid and a.tdiarid=b.tdiarid and a.Dcpanomm=b.cpanomes and a.cpnoreg=b.cpnoreg '
                  + ' and b.cpfemis = c.fecha(+) '
                  + ' AND B.CIAID = F.CIAID(+) AND B.CLAUXID = F.CLAUXID(+) AND B.PROV= F.PROV(+) AND B.DOCID = F.DOCID(+) AND B.CPSERIE = F.CPSERIE(+) AND B.CPNODOC = F.CPNODOC(+) '
                  + ' AND F.CIAID = G.CIAID(+) AND F.CLAUXID = G.CLAUXID(+) AND F.PROV = G.PROV(+) AND F.TCANJEID = G.TCANJEID(+) AND F.CCPCANJE = G.CPCANJE(+) '
                  + ' order by B.CPNOREG';
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest(xSQL);
            DMTE.cdsQry.Open;

            While Not DMTE.cdsQry.Eof Do
            Begin
               nReg := nReg + 1;
               nPago := DMTE.FRound(DMTE.cdsQry.FieldByName('IMPPAGO').AsFloat, 15, 0);
            // Inicio HPC_201501_CAJA
               xSQL := ' Insert into CXP_ORD_PAG_DET( CIAID, NUMERO, ITEM, CLAUXID, AUXID, DOCID, CPSERIE, CPNODOC, '
                     + ' TMONID, CPMTOORI, CPPAGORI, CPSALORI, IMPPAGO, IMPRETE, FREG, HREG, USUARIO, ESTADO, NUMDETRAC,MOD_DETR ) '
                     + ' Values( ''' + DMTE.cdsOPago.FieldByName('CIAID').AsString + ''', '
                     + '''' + DMTE.cdsOPago.FieldByName('NUMERO').AsString + ''', '
                     + '''' + DMTE.strzero(IntToStr(nReg), 3) + ''', '
                     + '''' + DMTE.cdsMovCxP.FieldByName('CLAUXID').AsString + ''', '
                     + '''' + DMTE.cdsMovCxP.FieldByName('PROV').AsString + ''', '
                     + '''' + DMTE.cdsQry.FieldByName('DOCID').AsString + ''', '
                     + '''' + DMTE.cdsQry.FieldByName('CPSERIE').AsString + ''', '
                     + '''' + DMTE.cdsQry.FieldByName('CPNODOC').AsString + ''', '
                     + '''' + DMTE.cdsMovCxP.FieldByName('TMONID').AsString + ''', '
                     + FloatToStr(DMTE.cdsQry.FieldByName('IMPPAGO').AsFloat) + ', '
                     + FloatToStr(DMTE.cdsQry.FieldByName('IMPPAGO').AsFloat - nPago) + ', '
                     + FloatToStr(DMTE.cdsQry.FieldByName('IMPPAGO').AsFloat) + ', '
                     + FloatToStr(nPago) + ', '
                     + FloatToStr(nRete + nDetra) + ', '
                     + 'SYSDATE, SYSDATE, '
                     + '''' + DMTE.wUsuario + ''', '
                     + '''P'', '
                     + '''' + DMTE.cdsMovCxP.FieldByName('CPNODOC').AsString + ''', '
                     + '''TLB'' '
                     + ' )';
            // Fin HPC_201501_CAJA
               DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
               DMTE.cdsQry.Next;
            End;

            xSQL := 'Update CXP302 SET FLAGVAR =''S'' '
                  + ' WHERE CIAID=''' + DMTE.cdsMovCxP.FieldByname('CIAID').AsString + ''' '
                  + ' AND DCPANOMM=''' + DMTE.cdsMovCxP.FieldByName('CPANOMES').AsString + ''' '
                  + ' AND CPNOREG = ''' + DMTE.cdsMovCxP.FieldByName('CPNOREG').AsString + ''' '
                  + '  and tipdet=''I4'' '
                  + ' AND CPSERIE = ''' + DMTE.cdsMovCxP.FieldByName('CPSERIE').AsString + ''' '
                  + ' AND CPNODOC = ''' + DMTE.cdsMovCxP.FieldByName('CPNODOC').AsString + ''' '
                  + ' AND CLAUXID=''' + DMTE.cdsMovCxP.FieldByName('CLAUXID').AsString + ''' ';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         End;
      End;
      DMTE.cdsMovCxP.Next;
   End;
   DMTE.cdsMovCxP.Close;
   DMTE.cdsMovCxP.Open;

   ShowMessage('Ok.'); 
End;
// Fin CAJA-201804 

Procedure TFOrdenSelec.dbgSelecTitleButtonClick(Sender: TObject;
   AFieldName: String);
Var
   xTitLabel: String;
Begin
   pnlBusca.Visible := True;
   isBusca.SearchField := AFieldName;
   dbgSelec.SetActiveField(AFieldName);
   DMTE.cdsMovCxP.IndexFieldNames := AFieldName;
   xTitLabel := dbgSelec.SelectedField.DisplayLabel;
   xTitLabel[Pos('~', xTitLabel)] := ' ';
   lblBusca2.caption := xTitLabel;
   isBusca.SetFocus;
End;

Procedure TFOrdenSelec.isBuscaExit(Sender: TObject);
Begin
   pnlBusca.Visible := False;
   dbgSelec.Setfocus;
End;

Procedure TFOrdenSelec.bbtnBuscarClick(Sender: TObject);
Var
   xSQL, xPeriodo: String;
Begin
   dbgSelec.Selected.Clear;
   dbgSelec.Selected.Add('MARCA'#9'3'#9'(x)'#9'F');
   dbgSelec.Selected.Add('CIAID'#9'3'#9'Cía'#9'F');
   dbgSelec.Selected.Add('CPANOMES'#9'6'#9'Periodo'#9'F');
   dbgSelec.Selected.Add('TDIARID'#9'3'#9'TD'#9'F');
   dbgSelec.Selected.Add('CPNOREG'#9'10'#9'No.Reg'#9'F');
   dbgSelec.Selected.Add('CLAUXID'#9'3'#9'Cl.~Aux'#9'F');
   dbgSelec.Selected.Add('PROV'#9'8'#9'Id'#9'F');
   dbgSelec.Selected.Add('PROVDES'#9'22'#9'Razón Social/Nombres'#9'F');
   dbgSelec.Selected.Add('DOCID'#9'3'#9'Doc'#9'F');
   dbgSelec.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
   dbgSelec.Selected.Add('CPNODOC'#9'12'#9'No.~Documento'#9'F');
   dbgSelec.Selected.Add('TMONID'#9'3'#9'TM'#9'F');
   dbgSelec.Selected.Add('CPMTOORI'#9'10'#9'Importe'#9'F');
   dbgSelec.Selected.Add('ECNOCOMPR'#9'10'#9'Comprobante~Original'#9'F');
   dbgSelec.Selected.Add('CPMTOORI2'#9'10'#9'Importe~Original'#9'F');

   xPeriodo := DMTE.StrZero(IntToStr(seAno.Value), 4) + DMTE.StrZero(IntToStr(seMes.Value), 2);

// Inicio HPC_201501_CAJA
   xSQL := 'Select ''CAJA'' MOD,''CAJA'' MODULO,''N'' MARCA, A.CIAID, A.ECANOMM CPANOMES, A.TDIARID, A.ECNOCOMP CPNOREG, '
         + '       A.CLAUXID, A.PROV, B.PROVDES, ''68'' DOCID, '' '' CPSERIE, A.ECNOCHQ CPNODOC, ''N'' TMONID, '
         + '       A.ECMTOLOC CPMTOORI, 0 CPPAGORI, A.ECMTOLOC CPSALORI, ''N'' PROVRETIGV, 0 DTRPORC, SYSDATE CPFVCMTO, '
         + '       A.ECNOCOMPR, C.ECMTOLOC CPMTOORI2 '
         + '  from CAJA302 A, TGE201 B, CAJA302 C '
         + ' where A.ECANOMM>='+quotedstr(xPeriodo)
         + '   and A.TIPDET=''I4'' '
         + '   and A.ECESTADO=''C'' '
         + '   and A.ECOPAGO is null '
         + '   and B.CLAUXID(+)=A.CLAUXID '
         + '   and B.PROV(+) = A.PROV '
         + '   and C.CIAID(+)=A.CIAID and C.TDIARID(+)=A.TDIARID and C.ECANOMM(+)=A.ECANOMM and C.ECNOCOMP(+)=A.ECNOCOMPR '
         + ' order by A.ECNOCOMP';
// Fin HPC_201501_CAJA

   DMTE.cdsMovCxP.Close;
   DMTE.cdsMovCxP.Datarequest(xSQL);
   DMTE.cdsMovCxP.Open;
   dbgSelec.SetControlType('MARCA', fctCheckBox, 'S;N');
End;

Procedure TFOrdenSelec.dbgSelecDblClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If DMTE.cdsMovCxP.FieldByname('MARCA').AsString = 'N' Then
   Begin
      DMTE.cdsMovCxP.Edit;
      DMTE.cdsMovCxP.FieldByname('MARCA').AsString := 'S'
   End
   Else
   Begin
      DMTE.cdsMovCxP.Edit;
      DMTE.cdsMovCxP.FieldByname('MARCA').AsString := 'N';
   End;

   DMTE.cdsMovCxP.Post;
End;

//Función que valida si la provisión fue registrada correctamente
Function TFOrdenSelec.fg_Valida_Provision(wgCiaid, wgClauxId, wgProv, wgDocId, wgCpSerie, wgCpNodoc: String): Boolean;
Var
   xsMensaje, xsSql: String;
Begin
   xsSql := ' SELECT * FROM CXP301 WHERE CIAID = ' + QuotedStr(wgCiaid) +
            ' AND CLAUXID = ' + Quotedstr(wgClauxId) +
            ' AND PROV = ' + QuotedStr(wgProv) +
            ' AND DOCID = ' + QuotedStr(wgDocId) +
            ' AND NVL(CPSERIE,' + QuotedStr('x') + ') = NVL(' + QuotedStr(wgCpSerie) + ', ' + QuotedStr('x') + ')' +
            ' AND CPESTADO = ' + QuotedStr('P') +
            ' AND CPNODOC = ' + QuotedStr(wgCpNodoc);
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest(xsSql);
   DMTE.cdsQry.Open;
   If (DMTE.cdsQry.FieldByName('CTATOTAL').AsString = '') Or (DMTE.cdsQry.FieldByName('CPTOTOT').AsString = '') Then
   Begin
      xsMensaje := 'La Provisión del Documento :' + #13 +
                   ' Serie: ' + QuotedStr(wgCpSerie) + #13 +
                   ' Número: ' + QuotedStr(wgCpNodoc) + #13 +
                   ' No grabó el número de Cuenta Contable ';
      ShowMessage(xsMensaje);
      Result := False;
      Exit;
   End;
   Result := True;
End;

Procedure TFOrdenSelec.bbtnTlbClick(Sender: TObject);
Var
   xSQL, xPeriodo: String;
Begin
   dbgSelec.Selected.Clear;
   dbgSelec.Selected.Add('MARCA'#9'3'#9'(x)'#9'F');
   dbgSelec.Selected.Add('CIAID'#9'3'#9'Cía'#9'F');
   dbgSelec.Selected.Add('CPANOMES'#9'6'#9'Periodo'#9'F');
   dbgSelec.Selected.Add('TDIARID'#9'3'#9'TD'#9'F');
   dbgSelec.Selected.Add('CPNOREG'#9'10'#9'No.Reg'#9'F');
   dbgSelec.Selected.Add('CLAUXID'#9'3'#9'Cl.~Aux'#9'F');
   dbgSelec.Selected.Add('PROV'#9'8'#9'Id'#9'F');
   dbgSelec.Selected.Add('PROVDES'#9'22'#9'Razón Social/Nombres'#9'F');
   dbgSelec.Selected.Add('DOCID'#9'3'#9'Doc'#9'F');
   dbgSelec.Selected.Add('CPSERIE'#9'5'#9'Serie'#9'F');
   dbgSelec.Selected.Add('CPNODOC'#9'12'#9'No.~Documento'#9'F');
   dbgSelec.Selected.Add('CPFEMIS'#9'10'#9'Fecha~Emisión'#9'F');
   dbgSelec.Selected.Add('TMONID'#9'3'#9'TM'#9'F');
   dbgSelec.Selected.Add('CPMTOORI'#9'10'#9'Importe'#9'F');
   dbgSelec.Selected.Add('CPPAGORI'#9'10'#9'Comprobante~Original'#9'F');
   dbgSelec.Selected.Add('CPSALORI'#9'10'#9'Importe~Original'#9'F');
   xPeriodo := DMTE.StrZero(IntToStr(seAno.Value), 4) + DMTE.StrZero(IntToStr(seMes.Value), 2);
// Inicio CAJA-201804
// Se cambia el Estado de la Cabecera a CONFIRMADO
(*
// Inicio HPC_201601_CAJA
// Se cambia el Estado de la Cabecera a CONFIRMADO
   xSQL := ' Select ''TLB'' MOD,''TLB'' MODULO,''N'' MARCA, A.CIAID, C.CPANOMES, A.TDIARID, A.CPNOREG, A.CLAUXID, '
         + '        B.PROV, B.PROVDES, ''68'' DOCID, A.CPSERIE, A.CPNODOC, ''N'' TMONID, '
         + '        A.DCPMOORI CPMTOORI, 0 CPPAGORI, C.CPSALORI, ''N'' PROVRETIGV, C.DTRPORC, SYSDATE CPFVCMTO, '''' ECNOCOMPR, '
         + '        '''' CPMTOORI2, A.FLAGVAR, C.CPFEMIS '
         + '   from CXP302 A, TGE201 B, CXP301 C, CXP_ORD_PAG_DET D, CXP_ORD_PAG_CAB E '
         + '  where A.DCPANOMM>='+quotedstr(xPeriodo)
         + '    and A.TIPDET=''I4'' '
         + '    and A.FLAGVAR=''N'' '
         + '    and B.CLAUXID = A.CLAUXID and C.PROV = B.PROV '
         + '    and C.CIAID=A.CIAID and C.TDIARID=A.TDIARID and C.CPANOMES=A.DCPANOMM and C.CPNOREG=A.CPNOREG '
   // Inicio HPC_201603_CAJA
   // Se incluye estado C (Cancelado) a Filtro
         + '    and C.CPESTADO  in (''P'',''C'') '
   // Fin HPC_201603_CAJA
         + '    and D.CIAID=A.CIAID and D.CLAUXID=A.CLAUXID and D.AUXID=C.PROV and D.DOCID=C.DOCID '
         + '        and D.CPSERIE=C.CPSERIE and D.CPNODOC=C.CPNODOC '
         + '    and E.CIAID = A.CIAID  and E.NUMERO = D.NUMERO  and E.ESTADO = ''C'' ';
// Fin HPC_201601_CAJA
*)
   xSQL := ' Select ''TLB'' MOD,''TLB'' MODULO,''N'' MARCA, A.CIAID, C.CPANOMES, A.TDIARID, A.CPNOREG, A.CLAUXID, '
         + '        B.PROV, B.PROVDES, ''68'' DOCID, A.CPSERIE, A.CPNODOC, ''N'' TMONID, '
         + '        CASE WHEN G.CPNOREG IS NULL THEN A.DCPMOORI ELSE (A.DCPMOORI - G.DCPMOORI) END  CPMTOORI, 0 CPPAGORI, C.CPSALORI, ''N'' PROVRETIGV, C.DTRPORC, SYSDATE CPFVCMTO, '''' ECNOCOMPR, '
         + '        '''' CPMTOORI2, A.FLAGVAR, C.CPFEMIS '
         + '        , G.CPNOREG, G.DOCID, G.CPSERIE, G.CPNODOC, G.TDIARID, G.CPANOMES, G.CIAID, G.DCPDH, G.CPTCAMPR, G.CPTCAMPA, G.DCPMOORI, G.DCPMOLOC, G.DCPMOEXT '
         + '   from CXP302 A, TGE201 B, CXP301 C, CXP_ORD_PAG_DET D, CXP_ORD_PAG_CAB E , CXP305 F, '
         + ' (SELECT X.CIAID, X.CPANOMES, X.TDIARID, X.CPNOREG, X.CLAUXID, X.PROV, X.TCANJEID, X.CPCANJE, Z.CUENTAID, Z.DCPDH, Z.DOCID, Z.CPSERIE, Z.CPNODOC, Z.CPTCAMPR, Z.CPTCAMPA, Z.DCPMOORI, Z.DCPMOLOC, Z.DCPMOEXT '
         + ' FROM CXP301 X,CXP302 Z WHERE X.CIAID=Z.CIAID and X.TDIARID=Z.TDIARID and X.CPANOMES=Z.DCPANOMM and X.CPNOREG=Z.CPNOREG AND Z.TIPDET=''I4'') G '
         + '  where A.DCPANOMM>='+quotedstr(xPeriodo)
         + '    and A.TIPDET=''I4'' '
         + '    and A.FLAGVAR=''N'' '
         + '    and B.CLAUXID = A.CLAUXID and C.PROV = B.PROV '
         + '    and C.CIAID=A.CIAID and C.TDIARID=A.TDIARID and C.CPANOMES=A.DCPANOMM and C.CPNOREG=A.CPNOREG '
         + '    and C.CPESTADO  in (''P'',''C'') '
         + '    and D.CIAID=A.CIAID and D.CLAUXID=A.CLAUXID and D.AUXID=C.PROV and D.DOCID=C.DOCID '
         + '        and D.CPSERIE=C.CPSERIE and D.CPNODOC=C.CPNODOC '
         + '    and E.CIAID = A.CIAID  and E.NUMERO = D.NUMERO  and E.ESTADO = ''C'' '
         + ' AND C.CIAID = F.CIAID(+) AND C.CLAUXID = F.CLAUXID(+) AND C.PROV= F.PROV(+) AND C.DOCID = F.DOCID(+) AND C.CPSERIE = F.CPSERIE(+) AND C.CPNODOC = F.CPNODOC(+) '
         + ' AND F.CIAID = G.CIAID(+) AND F.CLAUXID = G.CLAUXID(+) AND F.PROV = G.PROV(+) AND F.TCANJEID = G.TCANJEID(+) AND F.CCPCANJE = G.CPCANJE(+) ';
// Fin CAJA-201804
   DMTE.cdsMovCxP.Close;
   DMTE.cdsMovCxP.Datarequest(xSQL);
   DMTE.cdsMovCxP.Open;
   dbgSelec.SetControlType('MARCA', fctCheckBox, 'S;N');

End;

End.


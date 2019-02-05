unit Caja233;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogos, //Dialogs,
  StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Wwdbdlg, Buttons, Mask, wwdbedit,
  wwdbdatetimepicker, wwdblook, ExtCtrls,Db, Wwdatsrc, DBClient, wwclient, CAJADM,
  oaContabiliza,  Wwkeycb, Variants;

type
  TFContabIng = class(TForm)
    pnlCabecera1: TPanel;
    pnlBotones: TPanel;
    Z2bbtnSumat: TBitBtn;
    Z2bbtnSalir: TBitBtn;
    Z2bbtnCont: TBitBtn;
    lblGlosa: TLabel;
    dbeGlosa: TwwDBEdit;
    lblCia: TLabel;
    lblFComp: TLabel;
    lblTDiario: TLabel;
    lblPeriodo: TLabel;
    lblNoComp: TLabel;
    edtCia: TEdit;
    dblcCia: TwwDBLookupCombo;
    dbdtpFComp: TwwDBDateTimePicker;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    edtPeriodo: TEdit;
    dbeNoComp: TwwDBEdit;
    dbeLote: TwwDBEdit;
    lblLote: TLabel;
    lblBanco: TLabel;
    dblcBanco: TwwDBLookupCombo;
    edtBanco: TEdit;
    lblCuenta: TLabel;
    edtCuenta: TEdit;
    z2bbtnImprime: TBitBtn;
    pnlDetalle: TPanel;
    pnlPendientes: TPanel;
    Label16: TLabel;
    pnlDocCanje: TPanel;
    Label17: TLabel;
    Z2bbtnOKCab: TBitBtn;
    z2bbtnGraba: TBitBtn;
    pnlBusca: TPanel;
    lblBusca: TLabel;
    isBusca: TwwIncrementalSearch;
    Label1: TLabel;
    dbdtpFecIni: TwwDBDateTimePicker;
    Label2: TLabel;
    dbdtpFecFin: TwwDBDateTimePicker;
    Z2bbtnCalc: TBitBtn;
    dbgPendientes: TwwDBGrid;
    dbgDocCanje: TwwDBGrid;
    Label3: TLabel;
    edtMoneda: TEdit;
    Label4: TLabel;
    procedure Z2bbtnCalcClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Z2bbtnSumatClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z2bbtnContClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbeGlosaChange(Sender: TObject);
    procedure dbgDocCanjeCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
    procedure dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
    procedure dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbdtpFCompExit(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure dbeLoteChange(Sender: TObject);
    procedure dbeLoteExit(Sender: TObject);
    procedure dblcBancoExit(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);
    procedure dbgDocCanjeCalcTitleAttributes2(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
    procedure dbgDocCanjeDragOver2(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgDocCanjeEndDrag2(Sender, Target: TObject; X,
  Y: Integer);
    procedure dbgDocCanjeMouseDown2(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgPendientesDragOver2(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgPendientesEndDrag2(Sender, Target: TObject; X, Y: Integer);
    procedure dbgPendientesMouseDown2(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Z2bbtnSalirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Z2bbtnOKCabClick(Sender: TObject);
    procedure z2bbtnGrabaClick(Sender: TObject);
    procedure dbgPendientesTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dbgDocCanjeColExit(Sender: TObject);
    procedure isBuscaKeyPress(Sender: TObject; var Key: Char);
    procedure isBuscaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    cf1: TControlFoco;
    xMtoCta : Real;
    xMtoLoc, xMtoExt: Real;
    A1 : Array of Integer ;
    A2 : Array Of TNotifyEvent ;
    A2digitos ,A4digitos : Array of TWinControl ;
    //
    wCptoGan  ,
    wCptoPer  ,
    wCtaGan   ,
    wCtaPer   : String ;
    cdsFiltro: TwwClientDataset;
    xGraboNuevo : Boolean ;
    xNReg : Integer;
    cTMonId : String;
    //

    procedure Contabiliza;
    procedure Contab_IngCaja;
    procedure Contab_Canje ;
    procedure Contab_DifCambio;
    procedure Contab_Doc ;
    procedure SetMtosCab ;
    procedure IniciaDatos;
    procedure ConfiguraAccesos;
    procedure Proc_Admin;
    procedure Proc_Consul;
    procedure Libera_Admin;
    procedure Libera_Consul;
    procedure LibConfigAccesos;
    procedure ActivaBotones(pnl: TPanel;xFlag : Boolean);
    procedure FocoInicial ;
    procedure GrabaMontoTotal  ;
    procedure ActualizaSaldosCaja;
    procedure RecCptosDifC ;
    procedure RecuperaDescrip ;
    procedure AsignaClaveDetalle ;
    procedure AsignaParametros ;
    procedure ActualizaDetalle ;
    procedure ActualizaSaldos ;
    procedure Valida ;
    procedure AsignaCompaDocs ;
    procedure GeneraComp ;
    procedure RecuperaDetalles ;
    procedure ActualizaFiltro ;
    procedure Suma;
  public
    { Public declarations }
    procedure Adiciona ;
    procedure Edita (Doc : structComprobante;cds : Twwclientdataset);
  end;

var
  FContabIng: TFContabIng;
  wbSumat, wbCont, wbAnula, wbNuevo, wbImprime, wbSube, wbGraba, wbCancelado,
  wbcancel2: Boolean;
  wModifica: Boolean;

implementation

uses CAJAUTIL, oaTE2000, Caja290;
{$R *.DFM}

{*******************************************************
INICIO DE FORMA
*******************************************************}

procedure TFContabIng.IniciaDatos;
begin
   BlanqueaEdits ( pnlCabecera1 ) ;
   RecuperarCiaUnica(dblcCia, edtCia);
end;

procedure TFContabIng.Z2bbtnCalcClick(Sender: TObject);
begin
   WinExec('calc.exe',1);  //Activa la calculadora del Windows
end;

{*******************************************************
CUARTO PANEL - BOTONES
*******************************************************}
procedure TFContabIng.Z2bbtnSumatClick(Sender: TObject);
Var
   xRegAct : TBookMark;
begin
   With DMTE do
    begin
     cdsRegCxC.DisableControls ;
     xRegAct := cdsRegCxC.GetBookmark;
     xMtoLoc := 0;
     xMtoExt := 0;
     xMtoCta := 0;
     cdsRegCxC.First ;
     While not cdsRegCxC.Eof do
      begin
       if cdsRegCxC.FieldByName('DEDH').Value = 'H' then
        begin
         xMtoLoc := xMtoLoc + cdsRegCxC.FieldByName('DEMTOLOC').Value;
         xMtoExt := xMtoExt + cdsRegCxC.FieldByName('DEMTOEXT').Value;
        end
       else
        begin
         xMtoLoc := xMtoLoc - cdsRegCxC.FieldByName('DEMTOLOC').Value;
         xMtoExt := xMtoExt - cdsRegCxC.FieldByName('DEMTOEXT').Value;
        end;
       cdsRegCxC.Next;
      end;

     cdsRegCxC.GotoBookmark(xRegAct);
     cdsRegCxC.FreeBookmark(xRegAct);
     cdsRegCxC.EnableControls;
    end;
end;

procedure TFContabIng.FormClose(Sender: TObject; var Action: TCloseAction);
var
   xSQL : String;
begin
   dbgDocCanje.DataSource := DMTE.dsDocsContWork ;

   DMTE.cdsEgrCaja.CancelUpdates;

   if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='X' then
    begin
     DMTE.cdsEgrCaja.Delete;
     if DMTE.cdsEgrCaja.ApplyUpdates(0)>0 then
      begin
         try
            xSQL := 'Delete From CAJA302'
                   +' Where CIAID ='+QuotedStr(dblcCia.Text)
                   +' and ECANOMM ='+QuotedStr(edtPeriodo.Text)
                   +' and TDIARID ='+QuotedStr(dblcTDiario.Text)
                   +' and ECNOCOMP ='+QuotedStr(dbeNoComp.Text);
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         except
         end;
      end;
    end;
   cf1.QuitarExits(Self) ;
   Action:=caFree;
end;

procedure TFContabIng.FormKeyPress(Sender: TObject; var Key: Char);
var
   xStr : String ;
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
   if not AplicaKeyPress(Self ,A2digitos , A4digitos) then
    Exit ;
   if not( Key in [ '0'..'9' , '.' , #8 ]) then
    begin
     Key := #0 ;
    end ;
    xStr := TCustomEdit(Self.ActiveControl).Text ;
    if Key = '.' then
       if Pos('.',xStr) <> 0 then
          Key := #0 ;
end;

procedure TFContabIng.Z2bbtnContClick(Sender: TObject);
var
   xSQL  : String;
begin
   Valida;

   if MessageDlg('¿Desea Contabilizar y Generar Asientos Automáticos?' , mtConfirmation ,
                 [mbYes, mbNo], 0) = mrYes then
    begin
     Screen.Cursor := crHourGlass ;
     DMTE.cdsDocsCont.DisableControls ;
     DMTE.cdsDocsContWork.DisableControls ;

     RecCptosDifC;

     Contabiliza;

     DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');

     ActualizaCNT311( DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
                      DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                      DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                      DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString );

     if SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
                 DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                 DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                 DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                 DMTE.SRV_D, 'CCNA', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                 DMTE.cdsResultSet, DMTE.DCOM1, Self ) then
      begin

      end;
     DMTE.cdsDocsCont.EnableControls ;
     DMTE.cdsDocsContWork.EnableControls ;

     xSQL := 'Select * From CAJA302 '
            +'Where CIAID ='''   +dblcCia.Text    +''' and '
            +      'ECANOMM =''' +edtPeriodo.Text +''' and '
            +      'TDIARID =''' +dblcTDiario.Text+''' and '
            +      'ECNOCOMP ='''+dbeNoComp.Text  +''' ';

     DMTE.cdsEgrCaja.Close;
     DMTE.cdsEgrCaja.DataRequest(xSQL);
     DMTE.cdsEgrCaja.Open;

     DMTE.cdsEgrCaja.Edit;
     DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'P';
     DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString  := 'S';

     DMTE.AplicaDatos(DMTE.cdsEgrCaja, 'EGRCAJA');

     Screen.Cursor := crDefault ;
     Z2bbtnGraba.Enabled   := False;
     Z2bbtnCont.Enabled    := False;
     z2bbtnImprime.Enabled := True ;
     pnlCabecera1.Enabled  := False ;
     pnlDetalle.Enabled    := True ;
     pnlPendientes.Enabled := False;
     FRegistro.xFiltroContab.RefreshFilter;
     MessageDlg( 'Documentos Contabilizados', mtCustom, [mbOk], 0);
    end;
end;

procedure TFContabIng.Contabiliza;
var
   xFiltro : String;
   xSQL    : String;
begin
   xFiltro := DMTE.cdsDocsContWork.Filter ;

   xSQL := 'DELETE FROM CAJA304 '
          +'WHERE CIAID ='   +QuotedStr(DMTE.cdsEgrcaja.FieldByName('CIAID').AsString)   +' AND '
          +      'ECANOMM =' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString) +' AND '
          +      'TDIARID =' +QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString) +' AND '
          +      'ECNOCOMP ='+QuotedStr(DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
   try
			DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   except
   end;

   // vhn 23/01/2001
   xSQL := 'Select * From CAJA304 '
          +'Where CIAID ='''   +dblcCia.Text    +''' and '
          +      'ECANOMM =''' +edtPeriodo.Text +''' and '
          +      'TDIARID =''' +dblcTDiario.Text+''' and '
          +      'ECNOCOMP ='''+dbeNoComp.Text   +''' ';
   DMTE.cdsCNTCaja.Close;
   DMTE.cdsCNTCaja.DataRequest( xSQL );
   DMTE.cdsCNTCaja.Open;

   xNReg := 0;

   DMTE.cdsCntCaja.Insert ;
   Contab_IngCaja;

   DMTE.cdsDocsContWork.Filter := DMTE.cdsDocsContWork.Filter
                            +' AND CCTREC=''NP'' ' ;
   DMTE.cdsDocsContWork.Filtered := True ;

   DMTE.cdsDocsContWork.First ;
   While not DMTE.cdsDocsContWork.Eof do
    begin
     Contab_Doc ;
     DMTE.cdsDocsContWork.Next;
    end;

   //filtrar x LOS DEMAS
   DMTE.cdsDocsContWork.Filter := xFiltro +
                    ' AND ( CCTREC <> ''NP'' OR CCTREC IS NULL ) ' ;
   DMTE.cdsDocsContWork.Filtered := True ;

   DMTE.cdsDocsContWork.First ;
   While not DMTE.cdsDocsContWork.Eof do
    begin
      //Recupero detalles del documento
      // vhn 23/01/2001
     xSQL := 'Select A.*, B.CTATOTAL AS CTACON From CXC304 A, CXC301 B '
            +'Where A.CIAID ='''    +dblcCia.Text                                     +''' and '
            +      'A.CJEDOCID =''' +DMTE.cdsDocsContWork.FieldByName('DOCID').AsString   +''' and '
            +      'A.CJESERIE =''' +DMTE.cdsDocsContWork.FieldByName('CCSERIE').AsString +''' and '
            +      'A.CJENODOC =''' +DMTE.cdsDocsContWork .FieldByName('CCNODOC').AsString +''' and '
            +      'B.CIAID = A.CIAID and '
            +      'B.DOCID = A.DOCID and '
            +      'B.CCSERIE = A.CCSERIE and '
            +      'B.CCNODOC = A.CCNODOC ';
     DMTE.cdsCanjeCxCDOC.Close;
     DMTE.cdsCanjeCxCDOC.DataRequest( xSQL );
     DMTE.cdsCanjeCxCDOC.Open;

     //Contabilizo detalles de los movimientos Cancelados
     DMTE.cdsCanjeCxCDOC.First ;
     while not DMTE.cdsCanjeCxCDOC.Eof do
      begin
       DMTE.cdsCntCaja.Insert   ;
       Contab_Canje            ;
       Contab_DifCambio        ;
       DMTE.cdsCanjeCxCDOC.Next ;
      end;

     DMTE.cdsDocsContWork.Next;
    end;

   //Retornar el clone a su filtro Original
   DMTE.cdsDocsContWork.Filter   := xFiltro ;
   DMTE.cdsDocsContWork.Filtered := True ;
end;

procedure TFContabIng.Contab_IngCaja;
begin
   DMTE.cdsCntCaja.FieldByName('CIAID').Value       := DMTE.cdsEgrCaja.FieldByName('CIAID').Value;
   DMTE.cdsCntCaja.FieldByName('TDIARID').Value     := DMTE.cdsEgrCaja.FieldByName('TDIARID').Value;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value    := DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value     := dbdtpFComp.Date ;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value     := dbdtpFComp.Date ;
   DMTE.cdsCntCaja.FieldByName('CUENTAID').Value    := edtCuenta.Text;
   DMTE.cdsCntCaja.FieldByName('DCDH').Value        := 'D';
   DMTE.cdsCntCaja.FieldByName('TMONID').Value      := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value    := DMTE.cdsEgrCaja.FieldByName('ECMTOORI').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value     := DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value    := DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').Value;
   DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value    := 'S';   //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value     := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
   DMTE.cdsCntCaja.FieldByName('DCLOTE').Value      := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
   DMTE.cdsCntCaja.FieldByName('DCANO').AsString    := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMM').AsString     := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDD').AsString     := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSS').AsString     := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSEM').AsString    := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTRI').AsString    := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASS').AsString   := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString   := FRegistro.xModulo;
   DMTE.cdsCntCaja.FieldByName('DCGLOSA').AsString  := DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString ;
   DMTE.cdsCntCaja.FieldByName('FCAB').AsString     := '1' ;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').AsString := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').AsString := DMTE.cdsEgrCaja.FieldByName('ECTCAMB').AsString;
   xNReg := xNReg+1;
   DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;

   DMTE.cdsCntCaja.Post ;
end;

procedure TFContabIng.Contab_Canje;
begin
   DMTE.cdsCntCaja.FieldByName('CIAID').Value      := dblcCia.Text      ;
   DMTE.cdsCntCaja.FieldByName('TDIARID').Value    := dblcTDiario.Text  ;
   DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value   := dbeNoComp.Text    ;
   DMTE.cdsCntCaja.FieldByName('ECANOMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value;
   DMTE.cdsCntCaja.FieldByName('DOCID').Value      := DMTE.cdsCanjeCxCDoc.FieldByName('DOCID').Value;
   DMTE.cdsCntCaja.FieldByName('DCSERIE').Value    := DMTE.cdsCanjeCxCDoc.FieldByName('CCSERIE').Value;
   DMTE.cdsCntCaja.FieldByName('DCNODOC').Value    := DMTE.cdsCanjeCxCDoc.FieldByName('CCNODOC').Value;
   DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value    := dbdtpFComp.Date ;
   DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value    := DMTE.cdsCanjeCxCDoc.FieldByName('CCFEMIS').AsDateTime ;
   DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value   := DMTE.cdsCanjeCxCDoc.FieldByName('CCFVCMTO').AsDateTime ;
   DMTE.cdsCntCaja.FieldByName('CPTOID').Value     := DMTE.cdsCanjeCxCDoc.FieldByName('CPTOTOT').Value;
   DMTE.cdsCntCaja.FieldByName('CUENTAID').Value   := DMTE.cdsCanjeCxCDoc.FieldByName('CTATOTAL').AsString;

   DMTE.cdsCntCaja.FieldByName('CLAUXID').Value    := DMTE.cdsDocsContWork.FieldbyName('CLAUXID').Value; //Aqui se toma de la cabecera
   DMTE.cdsCntCaja.FieldByName('DCAUXID').Value    := DMTE.cdsDocsContWork.FieldbyName('CLIEID').Value;    //Aqui se toma de la cabecera
   DMTE.cdsCntCaja.FieldByName('DCDH').Value       := 'H';
   DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value   := DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').Value;
   DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value   := DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMDOC').Value;
   DMTE.cdsCntCaja.FieldByName('TMONID').Value     := DMTE.cdsEgrCaja.FieldByName('TMONID').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value   := DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOORI').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value    := DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').Value;
   DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value   := DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').Value;
   DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value   := 'S';   //Registro ya cuadrado
   DMTE.cdsCntCaja.FieldByName('DCLOTE').Value     := DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value;
   DMTE.cdsCntCaja.FieldByName('DCANO').AsString   := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
   DMTE.cdsCntCaja.FieldByName('DCMM').AsString    := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCDD').AsString    := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSS').AsString    := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
   DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
   DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString  := FRegistro.xModulo;
   xNReg := xNReg+1;
   DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;
   DMTE.cdsCntCaja.Post ;
end;

procedure TFContabIng.Contab_DifCambio;
var
   xDif_Camb : Real;
begin
//     if DMTE.cdsCanjeCxCDoc.FieldByName('DETCDOC').Value <> DMTE.cdsCanjeCxCDoc.FieldByName('DETCPAG').Value then
   if DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMDOC').AsFloat <> DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').AsFloat then
    begin
     DMTE.cdsCntCaja.Insert;
     DMTE.cdsCntCaja.FieldByName('CIAID').Value      := dblcCia.Text;
     DMTE.cdsCntCaja.FieldByName('TDIARID').Value    := dblcTDiario.Text;
     DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value   := dbeNoComp.Text;
     DMTE.cdsCntCaja.FieldByName('ECANOMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
     DMTE.cdsCntCaja.FieldByName('DOCID').Value      := DMTE.cdsCanjeCxCDoc.FieldByName('DOCID').AsString;
     DMTE.cdsCntCaja.FieldByName('DCSERIE').Value    := DMTE.cdsCanjeCxCDoc.FieldByName('CCSERIE').AsString;
     DMTE.cdsCntCaja.FieldByName('DCNODOC').Value    := DMTE.cdsCanjeCxCDoc.FieldByName('CCNODOC').AsString;
     DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value    := dbdtpFComp.Date;
     DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value    := DMTE.cdsCanjeCxCDoc.FieldByName('CCFEMIS').AsDateTime;
     DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value   := DMTE.cdsCanjeCxCDoc.FieldByName('CCFVCMTO').AsDateTime;
     DMTE.cdsCntCaja.FieldByName('CLAUXID').Value    := DMTE.cdsDocsContWork.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
     DMTE.cdsCntCaja.FieldByName('DCAUXID').Value    := DMTE.cdsDocsContWork.FieldByName('CLIEID').AsString;    //Aqui se toma de la cabecera
     DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value   := DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').AsFloat;
     DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value   := DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMDOC').AsFloat;
     DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value   := 'S';   //Registro ya cuadrado
     DMTE.cdsCntCaja.FieldByName('DCLOTE').Value     := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
     DMTE.cdsCntCaja.FieldByName('DCANO').AsString   := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
     DMTE.cdsCntCaja.FieldByName('DCMM').AsString    := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCDD').AsString    := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
     DMTE.cdsCntCaja.FieldByName('DCSS').AsString    := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
     DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
     DMTE.cdsCntCaja.FieldByName('TMONID').Value     := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
     DMTE.cdsCntCaja.FieldByName('DOCMOD').AsString  := FRegistro.xModulo;

     xNReg := xNReg+1;
     DMTE.cdsCntCaja.FieldByName('NREG').AsInteger   := xNReg;

     if DMTE.cdsCanjeCxCDoc.FieldByName('TMONID').Value = DMTE.wtMonLoc then
      begin   //Provision en Mon.Local
       xDif_Camb := abs(DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').Value / DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMDOC').Value -
                       DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').Value / DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').Value);//En Mon.Ext.
       DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value := xDif_Camb;

       if DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMDOC').Value > DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').Value then
        DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D'
       else
        DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H';

      end
     else
      begin                                            //Provision en Mon.Ext.
       xDif_Camb := abs(DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').Value * DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMDOC').Value -
                        DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').Value * DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').Value);//En Mon.Local
       DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value := xDif_Camb;

       if DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMDOC').Value > DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').Value then
        DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'H'
       else
        DMTE.cdsCntCaja.FieldByName('DCDH').Value := 'D';
      end;
     if DMTE.cdsCntCaja.FieldByName('DCDH').Value = 'D' then
      begin
       DMTE.cdsCntCaja.FieldByName('CPTOID').Value   := wCptoPer;
       DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaPer;
      end
     else
      begin
       DMTE.cdsCntCaja.FieldByName('CPTOID').Value   := wCptoGan;
       DMTE.cdsCntCaja.FieldByName('CUENTAID').Value := wCtaGan;
      end;
    end
end;

procedure TFContabIng.Adiciona;
var
   xSQL : String;
begin
   IniciaDatos ;
   xGraboNuevo := False ;
   pnlCabecera1.Enabled  := True;
   pnlDetalle.Enabled    := True;
   pnlBotones.Enabled    := True;
   pnlPendientes.Enabled := True;
   dblcCia.Enabled       := True;
   dbdtpFComp.Enabled    := True;
   dblcBanco.Enabled     := True;
   dbeNoComp.Enabled     := True;

   DMTE.cdsDocsCont.close;
   xSQL := 'SELECT * FROM CXC303 WHERE 1<>1';

   DMTE.cdsDocsCont.DataRequest(xSQL);
   DMTE.cdsDocsCont.Open;

   DMTE.cdsDocsContWork.IndexFieldNames := '';
   DMTE.cdsDocsContWork.Close ;
   DMTE.cdsDocsContWork.DataRequest(xSQL);
   DMTE.cdsDocsContWork.Open;
   DMTE.cdsDocsContWork.Filter   := 'CCCONTA = ''S''' ;
   DMTE.cdsDocsContWork.Filtered := True ;

   DMTE.cdsDocsCont.Filter    := ' CIAID ='''' ' ;
   DMTE.cdsDocsCont.Filtered  := True ;

   ActivaBotones( pnlBotones , True ) ;
   z2bbtnImprime.Enabled := True;
   DMTE.wModo := 'A';

   DMTE.cdsEgrCaja.Insert;
end;

procedure TFContabIng.Edita(Doc : structComprobante;cds : Twwclientdataset);
begin
   IniciaDatos ;

   dblcCia.Text     := DMTE.cdsEgrCaja.FieldbyName('CIAID').AsString;
   dbdtpFComp.Date  := DMTE.cdsEgrCaja.FieldbyName('ECFCOMP').AsDateTime;
   dblcTDiario.Text := DMTE.cdsEgrCaja.FieldbyName('TDIARID').AsString;
   dbeNoComp.Text   := DMTE.cdsEgrCaja.FieldbyName('ECNOCOMP').AsString;
   edtPeriodo.Text  := DMTE.cdsEgrCaja.FieldbyName('ECANOMM').AsString;
   dblcBanco.Text   := DMTE.cdsEgrCaja.FieldbyName('BANCOID').AsString;
   edtCuenta.Text   := DMTE.cdsEgrCaja.FieldbyName('CUENTAID').AsString;
   dbeGlosa.Text    := DMTE.cdsEgrCaja.FieldbyName('ECGLOSA').AsString;
   dbeLote.Text     := DMTE.cdsEgrCaja.Fieldbyname('ECLOTE').ASString;

   // vhndema
   dbdtpFecIni.Date:=DMTE.cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime;
   dbdtpFecFin.Date:=DMTE.cdsEgrCaja.FieldByName('ECFCOBCH').AsDateTime;
   // end vhndema

   RecuperaDescrip ;
   RecuperaDetalles ;

   dblcCia.Enabled      := False;
   dbdtpFComp.Enabled   := False;
   dblcBanco.Enabled    := False;
   dbeNoComp.Enabled    := False;
   if DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString = 'I' then
    begin
     pnlCabecera1.Enabled  := True;
     pnlCabecera1.Enabled  := True;
     pnlDetalle.Enabled    := True;
     pnlPendientes.Enabled := True;

     Z2bbtnGraba.Enabled := True;
    end
   else
    begin
     DMTE.cdsDocsCont.Filter   := ' CIAID='''' ' ;
     DMTE.cdsDocsCont.Filtered := True ;
     pnlCabecera1.Enabled  := False ;
     pnlDetalle.Enabled    := True ;
     pnlPendientes.Enabled := False;

     Z2bbtnGraba.Enabled   := False;
    end;

   ActivaBotones( pnlBotones , False ) ;
   Z2bbtnImprime.Enabled := True ;
   Z2bbtnSalir.Enabled   := True ;
   DMTE.wModo := 'M';
end;

procedure TFContabIng.FormCreate(Sender: TObject);
begin
   DMTE.ASignaTipoDiario(dblcTDiario,self) ;
   RecuperarCiaUnica(dblcCia,edtCia);
   DMTE.cdsBancoEgr.Filter := ' BCOTIPCTA=''C'' ' ;
   DMTE.cdsBancoEgr.Filtered := True ;
   cf1 := TControlFoco.Create ;
end;

procedure TFContabIng.ConfiguraAccesos;
begin
   if DMTE.wAdmin = 'G' then
    Proc_Admin
   else
    begin
     if DMTE.wModo = 'C' then
      Proc_Consul
     else
      DMTE.AccesosUsuarios( DMTE.wModulo, DMTE.wUsuario, '2', Screen.ActiveForm.Name ) ;
    end ;
end;

procedure TFContabIng.Libera_Admin;
begin
    Pon( A1 , A2 , pnlBotones ) ;
end;

procedure TFContabIng.Libera_Consul;
begin

end;

procedure TFContabIng.Proc_Admin;
var
   Contador : Integer ;
begin
   pnlCabecera1.Enabled := False ;
   pnlDeTalle.Enabled := False ;
   //Array de controles y eventos
   Contador := BotonesEnPanel( pnlBotones ) ;
   SetLength( A1 , Contador) ;
   SetLength( A2 , Contador) ;
   Quita(A1,A2,pnlBotones) ;
    //
   pnlBotones.Enabled := True ;
end;

procedure TFContabIng.Proc_Consul;
begin
   pnlCabecera1.Enabled := False ;
   pnlDeTalle.Enabled := True ;
   pnlBotones.Enabled := False ;
end;

procedure TFContabIng.LibConfigAccesos;
begin
   if DMTE.wAdmin = 'G' then
    Libera_Admin
   else
    begin
     if DMTE.wModo = 'C' then
      Libera_Consul ;
    end ;
end;

procedure TFContabIng.ActivaBotones(pnl: TPanel;xFlag : Boolean);
var
   i : Integer ;
begin
   for i := 0 to pnl.ControlCount-1 do
    begin
     if pnl.controls[i] is tbitbtn then
        TBitBtn(pnl.controls[i]).enabled := xFlag ;
    end;
end;

procedure TFContabIng.SetMtosCab;
begin
   DMTE.cdsRegCxC.First ;
   While not DMTE.cdsRegCxC.Eof do
    begin
     if DMTE.cdsRegCxC.FieldByName('DEESTADO').AsString <> 'A' then
      begin
       if DMTE.cdsRegCxC.FieldByName('DEESTADO').AsString <> 'C' then
        begin
         //////
         ActualizaSaldosCaja;
         //////
        end ;
       DMTE.cdsRegCxC.Edit;
       DMTE.cdsRegCxC.FieldByName('DEEstado').AsString := 'C';
       DMTE.cdsRegCxC.Post;
      end ;
     DMTE.cdsRegCxC.Next ;
    end;
   DMTE.cdsRegCxC.ApplyUpdates(0) ;
   DMTE.cdsRegCxC.Refresh ;
   DMTE.cdsRegCxC.First ;
end;

procedure TFContabIng.FocoInicial;
begin
     if pnlCabecera1.Enabled then
        pnlCabecera1.SetFocus
          else if pnlDetalle.Enabled then
                  pnlDeTalle.SetFocus
               else if pnlBotones.Enabled then
                       pnlBotones.SetFocus
                    else
                       Self.SetFocus ;
     Perform(CM_DialogKey, VK_TAB, 0);
end;

procedure TFContabIng.GrabaMontoTotal;
begin
   DMTE.cdsIngDocs.Edit;
   DMTE.cdsIngDocs.FieldByName('NCOMTOLOC').AsFloat := OperClientDataSet(DMTE.cdsCanjeCxCDoc, 'SUM(CCMTOLOC)', '') ;
   DMTE.cdsIngDocs.FieldByName('NCOMTOEXT').AsFloat := OperClientDataSet(DMTE.cdsCanjeCxCDoc, 'SUM(CCMTOEXT)', '') ;
{1107
  if dblcTMonCab.Text = DMTE.wTMonLoc then
     DMTE.cdsIngDocs.FieldByName('NCOMTOORI').AsFloat := DMTE.cdsIngDocs.FieldByName('NCOMTOLOC').AsFloat
  else
     DMTE.cdsIngDocs.FieldByName('NCOMTOORI').AsFloat := DMTE.cdsIngDocs.FieldByName('NCOMTOEXT').AsFloat ;
}
end;

procedure TFContabIng.ActualizaSaldosCaja;
//var   Campo : String ;
begin
{1107
    if trim(dblcCCBco.TEXT) <> '' then
    begin
      if DMTE.wTMonLoc = DMTE.cdsIngDocs.FieldByName('TMONID').AsString then
         Campo := 'ECMTOLOC'
      else
         Campo := 'ECMTOEXT'  ;
    end ;
}
end;

procedure TFContabIng.RecCptosDifC;
begin
   if not DMTE.RecuperarDatos('TGE105', 'CPTODIFG, CPTODIFP, CTADIFG, CTADIFP', 'BANCOID=''' + dblcBanco.Text + '''' )  then
       Raise Exception.create('No se puede Contabilizar '+#13+
             'Falta Definir las Cuentas de Dif. de Cambio')  ;
    wCptoGan  := DMTE.cdsRec.FieldByName('CPTODIFG').AsString ;
    wCptoPer  := DMTE.cdsRec.FieldByName('CPTODIFP').AsString ;
    wCtaGan   := DMTE.cdsRec.FieldByName('CTADIFG').AsString ;
    wCtaPer   := DMTE.cdsRec.FieldByName('CTADIFP').AsString ;
end;

procedure TFContabIng.RecuperaDescrip;
begin
{1307
    DMTE.DescripIngDocs(
                                        dblcCia.text,
                                        DMTE.cdsIngDocs.FieldByName('CCTREC').AsString ,
                                        DMTE.cdsIngDocs.FieldByName('DOCID').AsString ,
                                        DMTE.cdsIngDocs.FieldByName('CCSERIE').AsString ,
                                        DMTE.cdsIngDocs.FieldByName('CCNODOC').AsString
                                         ) ;
    DMTE.cdsDescrip.Active := False ;
    DMTE.cdsDescrip.Active := True ;
    with DMTE.cdsDescrip do
    begin
       edtCia.Text     := FieldbyName('CIAABR').AsString ;
//1107       edtTDoc.Text    := FieldbyName('DOCABR').AsString ;
       edtBanco.Text   := FieldbyName('BANCOABR').AsString ;
//1107       edtCCBco.Text   := FieldbyName('CCBCOABR').AsString ;
//1107       edtTMonCab.Text := FieldbyName('TMONABR').AsString ;
//1107       edtClase.Text   := FieldbyName('CLAUXABR').AsString ;
    end ;
}
end;

procedure TFContabIng.AsignaClaveDetalle;
var
   BMK : TBookmark ;
begin
   With DMTE.cdsCanjeCxCDoc do
    begin
     BMK := GetBookmark ;
     DisableControls ;
     First ;
     While not eof do
      begin
       Edit ;
       FieldByName('CIAID').AsString    := dblcCia.Text ;
       FieldByName('TCANJEID').AsString := 'RC' ;
       Next ;
      end;
     GotoBookmark(BMK) ;
     FreeBookmark(BMK) ;
     EnableControls ;
    end ;
end;

procedure TFContabIng.dbeGlosaChange(Sender: TObject);
begin
   if not TCustomEdit(Sender).Focused then
     Exit ;
   wModifica := True ;
end;

procedure TFContabIng.AsignaParametros;
var
   xSQL : String ;
begin
   // vhn 23/01/2001
   xSQL := 'Select * From CXC303'
          +' Where CIAID='''  +dblcCia.Text +''' and '
          +      'CCTREC=''RC'' ';
   DMTE.cdsIngDocs.Close;
   DMTE.cdsIngDocs.DataRequest( xSQL );
   DMTE.cdsIngDocs.Open;

  // vhn 22/01/2001
   xSQL := 'Select * From CXC304'
          +' Where CIAID='''+dblcCia.Text +''' ';
   DMTE.cdsCanjeCxCDOC.DisableControls ;
   DMTE.cdsCanjeCxCDOC.Close;
   DMTE.cdsCanjeCxCDOC.DataRequest( xSQL );
   DMTE.cdsCanjeCxCDOC.Open;
   DMTE.cdsCanjeCxCDOC.EnableControls ;
end;

procedure TFContabIng.ActualizaDetalle;
//var   BMK            : TBookmark ;
begin
{1107
   Showmessage('Actualizando detalle') ;
   BMK := DMTE.cdsRegCxC.GetBookmark ;
   DMTE.cdsregcxc.DisableControls ;
   DMTE.cdsRegCxC.First ;
   while not DMTE.cdsRegCxC.eof do
   begin
      DMTE.cdsRegCxC.Edit ;

      DMTE.cdsRegCxC.FieldByName('TMONID').AsString    := dblcTMonCab.Text ;
      DMTE.cdsRegCxC.FieldByName('DETCDOC').AsString   := dbeTCambio.Text ;
      if dblcTMonCab.Text = DMTE.wTMonLoc then
      begin
         DMTE.cdsregcxcDEMTOLOC.AsString := Cajadec(CurrtoStr(DMTE.cdsregcxcDEMTOORI.AsFloat)) ;
         DMTE.cdsregcxcDEMTOEXT.AsString := Cajadec(Currtostr(DMTE.cdsregcxcDEMTOORI.AsFloat / strtocurr( dbeTCambio.text ))) ;
      end
      else
      begin
         DMTE.cdsregcxcDEMTOLOC.AsString := Cajadec(CurrtoStr(DMTE.cdsregcxcDEMtoOri.AsFloat * strtocurr( dbeTCambio.text ))) ;
         DMTE.cdsregcxcDEMTOEXT.AsString := Cajadec(CurrtoStr(DMTE.cdsregcxcDEMtoOri.AsFloat )) ;
      end;
      DMTE.cdsRegCxC.Next ;
   end;
   DMTE.cdsregcxc.GotoBookmark(BMK) ;
   DMTE.cdsRegCxC.FreeBookmark(BMK) ;
   DMTE.cdsregcxc.EnableControls ;
}
end;

procedure TFContabIng.dbgDocCanjeCalcTitleAttributes(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
   if (AFieldName = 'CCMTOLOC') or (AFieldName = 'CCMTOEXT') then
    begin
     ABrush.Color := clNone;
    end;
end;

procedure TFContabIng.dbgDocCanjeDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := True;
end;

procedure TFContabIng.dbgDocCanjeEndDrag(Sender, Target: TObject; X,
  Y: Integer);
begin
   If Target = dbgPendientes Then
    begin
     With DMTE do
      begin
       cdsMovCxC.Filtered := False;
       if cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG' ,
                                    VarArrayOf([
                                                DMTE.cdsCanjeCxCDoc.FieldByName('CIAID').AsString ,
                                                DMTE.cdsCanjeCxCDoc.FieldByName('TDIARID').AsString ,
                                                DMTE.cdsCanjeCxCDoc.FieldByName('CCANOMM').AsString ,
                                                DMTE.cdsCanjeCxCDoc.FieldByName('CCNOREG').AsString
                                                ]),[]) then
        begin
         cdsMovCxC.Edit;
         DMTE.cdsMovCxC.FieldByName('TCANJEID').Value := '';
         DMTE.cdsMovCxC.FieldByName('CCCANJE').Value  := '';
         DMTE.cdsMovCxC.FieldByName('CCSALEXT').Value := DMTE.cdsMovCxC.FieldByName('CCMTOEXT').Value - DMTE.cdsMovCxC.FieldByName('CCPAGEXT').Value;
         DMTE.cdsMovCxC.FieldByName('CCSALLOC').Value := DMTE.cdsMovCxC.FieldByName('CCMTOLOC').Value - DMTE.cdsMovCxC.FieldByName('CCPAGLOC').Value;

         DMTE.cdsMovCxC.Post;
         cdsCanjeCxCDoc.Delete;
        end;
       cdsMovCxC.Filtered := True;
      end;
     wModifica := True;
    end;
end;

procedure TFContabIng.dbgDocCanjeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocCanje.BeginDrag(False);
end;

procedure TFContabIng.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := True;
end;

procedure TFContabIng.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgPendientes.BeginDrag(False);
end;

procedure TFContabIng.ActualizaSaldos;
var
   xRegAct : TBookmark ;
   xPagLoc ,
   xPagExt : Currency ;
begin
   DMTE.cdsMovCxC.DisableControls;
   DMTE.cdsMovCxC.Filtered := False;
   DMTE.cdsCanjeCxCDoc.DisableControls;
   xRegAct := DMTE.cdsCanjeCxCDoc.GetBookmark;
   DMTE.cdsCanjeCxCDoc.First;
   While not DMTE.cdsCanjeCxCDoc.Eof do
    begin
     DMTE.cdsCanjeCxCDoc.Edit ;
     if DMTE.cdsMovCxC.Locate('CIAID;TDIARID;CCANOMES;CCNOREG',
                             VarArrayOf([DMTE.cdsCanjeCxCDoc.FieldByName('CIAID').AsString,
                                         DMTE.cdsCanjeCxCDoc.FieldByName('TDIARID').AsString,
                                         DMTE.cdsCanjeCxCDoc.FieldByName('CCANOMM').AsString,
                                         DMTE.cdsCanjeCxCDoc.FieldByName('CCNOREG').AsString]),
                              []) then
      begin
       DMTE.cdsMovCxC.Edit;
       If DMTE.cdsMovCxC.FieldByName('TMONID').Value = DMTE.wTMonLoc then
        begin
         xPagLoc := DMTE.FRound(DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOLOC').Value-DMTE.cdsCanjeCxCDoc.FieldByName('CJEANTMN').Value,15,2);
         DMTE.cdsMovCxC.FieldByName('CCSALLOC').Value := DMTE.FRound(DMTE.cdsMovCxC.FieldByName('CCSALLOC').Value-xPagLoc,15,2);
         DMTE.cdsMovCxC.FieldByName('CCSALEXT').Value := DMTE.FRound(DMTE.cdsMovCxC.FieldByName('CCSALLOC').Value/DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').Value,15,2);
        end
       else
        begin
         xPagExt := DMTE.FRound(DMTE.cdsCanjeCxCDoc.FieldByName('CCMTOEXT').Value-DMTE.cdsCanjeCxCDoc.FieldByName('CJEANTME').Value,15,2);
         DMTE.cdsMovCxC.FieldByName('CCSALEXT').Value := DMTE.FRound(DMTE.cdsMovCxC.FieldByName('CCSALEXT').Value-xPagExt,15,2);
         DMTE.cdsMovCxC.FieldByName('CCSALLOC').Value := DMTE.FRound(DMTE.cdsMovCxC.FieldByName('CCSALEXT').Value*DMTE.cdsCanjeCxCDoc.FieldByName('CCTCAMCJE').Value,15,2);
        end;
       DMTE.cdsMovCxC.post;
      end;
     DMTE.cdsCanjeCxCDoc.Next;
    end;
   DMTE.cdsCanjeCxCDoc.GotoBookmark(xRegAct);
   DMTE.cdsCanjeCxCDoc.FreeBookmark(xRegAct);
   DMTE.cdsCanjeCxCDoc.EnableControls;
   DMTE.cdsMovCxC.Filtered := True;
   DMTE.cdsMovCxC.EnableControls;
end;

procedure TFContabIng.dbdtpFCompExit(Sender: TObject);
begin
   if dbdtpFComp.Date = 0 then
    begin
     ShowMessage('Fecha de Comprobante Errada');
     dbdtpFComp.SetFocus;
    end
   else
    begin
     edtPeriodo.Text := copy(DateToStr(dbdtpFComp.Date), 7, 4)
                       +copy(DateToStr(dbdtpFComp.Date), 4, 2);
     dblcBanco.SetFocus;
    end;
end;

procedure TFContabIng.dbeNoCompExit(Sender: TObject);
var
   xSQL : String;
begin
   if dblcCia.Focused    then Exit;
   if dbdtpFComp.Focused then Exit;
   if dblcBanco.Focused  then Exit;

   dblcCia.Enabled       := False;
   dbdtpFComp.Enabled    := False;
   dblcBanco.Enabled     := False;
   dbeNoComp.Enabled     := False;

   dbeNoComp.Text := DMTE.StrZero(dbeNoComp.Text, DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size);

   DMTE.cdsEgrCaja.FieldByName('CIAID').Value    := dblcCia.Text;
   DMTE.cdsEgrCaja.FieldByName('TDIARID').Value  := dblcTDiario.Text;
   DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value  := edtPeriodo.Text;
   DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value := dbeNoComp.Text;
   DMTE.cdsEgrCaja.FieldByName('ECFEMICH').Value := dbdtpFComp.Date;
   DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value  := dbdtpFComp.Date;
   // VHNDEMA
   DMTE.cdsEgrCaja.FieldByName('TMONID').Value   := DMTE.wTMonLoc;
   DMTE.cdsEgrCaja.FieldByName('TMONID').Value   := cTMonId;
   // END VHNDEMA
   DMTE.cdsEgrCaja.FieldByName('ECESTADO').Value := 'X';

   xSQL:='Select * From CAJA302 '
        +'Where CIAID='''   +dblcCia.Text    +''' and '
        +      'ECANOMM=''' +edtPeriodo.Text +''' and '
        +      'TDIARID=''' +dblcTDiario.Text+''' and '
        +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
   DMTE.cdsEgrCaja.DataRequest( xSQL );
   DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');
end;

procedure TFContabIng.dblcCiaExit(Sender: TObject);
begin
   edtCia.Text := DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID', dblcCia.Text, 'CIADES') ;

   if edtCia.Text = '' then begin
      ShowMessage('Error : Compañía no Valida');
      dblcCia.SetFocus;
      Exit;
   end;
end;

procedure TFContabIng.dblcTDiarioExit(Sender: TObject);
var
   xWhere : string;
begin
   edtTDiario.Text := DMTE.DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', 'TDIARID ='+QuotedStr(dblcTDiario.Text),'TDIARDES');

   if edtTDiario.Text<>'' then
    begin
     xWhere := 'CIAID='+''''+dblcCia.Text+''''+' AND ECANOMM='+
             ''''+edtPeriodo.Text+''''+' AND TDIARID='+''''+
             dblcTDiario.Text+'''';
     dbeNoComp.Text := DMTE.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
     dbeNoComp.Text := DMTE.StrZero(dbeNoComp.Text, DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Size );
    end;
end;

procedure TFContabIng.dbeLoteChange(Sender: TObject);
begin
    wModifica := True;
end;

procedure TFContabIng.dbeLoteExit(Sender: TObject);
begin
   if Trim(dbeLote.Text) <> '' then
    dbeLote.Text := DMTE.StrZero(dbeLote.Text, DMTE.cdsEgrCaja.FieldByName('ECLOTE').Size)
   else
    dbeLote.Text := '' ;
end;

procedure TFContabIng.dblcBancoExit(Sender: TObject);
var
   xCptoid, xSQL : String ;
begin

  // vhndema
  // Valida Periodo
  xSql := 'SELECT * FROM TGE154 WHERE CIAID='+quotedstr(dblcCia.text)+
          ' AND ANO='+quotedstr(Copy(DateToStr(dbdtpFComp.Date),7,4));
  DMTE.cdsQry.close;
  DMTE.cdsQry.datarequest(xsql);
  DMTE.cdsQry.open;
  if DMTE.cdsQry.FieldByName('PER'+Copy(DateToStr(dbdtpFComp.Date),4,2)).AsString = 'S' then
  begin
  	 Showmessage('El periodo se encuentra Cerrado');
     dbdtpFComp.setfocus;
     exit;
  end;

   if True then
   //if DiaAperturado(dblcCia.Text, dbdtpFComp.Date, dblcBanco.Text) then
  // end vhndema
    begin
     edtBanco.Text := DMTE.DisplayDescrip('prvTGE', 'TGE105', 'BANCOABR, BCOTIPCTA', 'BANCOID ='+QuotedStr(dblcBanco.Text), 'BANCOABR');

     if ( edtBanco.Text = '' ) or ( DMTE.cdsQry.FieldByName('BCOTIPCTA').AsString <> 'C' ) then
      begin
       ShowMessage('Error : Sólo debe ser Caja');
       dblcBanco.Value := '';
       edtBanco.Text := '';
       dblcBanco.SetFocus;
       Exit;
      end
     else
      begin
       edtCuenta.Text := '' ;
       dbeGlosa.Text := '' ;

       DMTE.cdsDocsCont.CancelUpdates ;
       DMTE.cdsDocsCont.Filter   := 'CCCONTA IS NULL AND BANCOID = ''' + dblcBanco.Text + '''';// +
       DMTE.cdsDocsCont.Filtered := True ;

       // SE CAMBIA EL DIARIO A INGRESOS
       dblcTDiario.Text := DMTE.DisplayDescrip('prvTGE','TGE106', 'CCBVOUING, TMONID', 'BANCOID ='+QuotedStr(dblcBanco.Text), 'CCBVOUING');
       cTMonId := DMTE.cdsQry.FieldByName('TMONID').AsString;
       edtMoneda.Text:=cTMonId;
       dbeLote.Text:='ICA'+cTMonId;
       dblcTDiario.OnExit(dblcTDiario);
       edtCuenta.Text := DMTE.DisplayDescrip('prvTGE', 'TGE105', 'CUENTAID, CPTOID', 'BANCOID ='+QuotedStr(dblcBanco.Text), 'CUENTAID');
       xCptoid        := DMTE.cdsQry.FieldByName('CPTOID').AsString;
       dbeGlosa.Text  := DMTE.DisplayDescrip('prvTGE', 'CAJA201', 'CPTODES', 'CPTOID ='+QuotedStr(xCptoid), 'CPTODES');
       wModifica := True;
      end;
    end;
end;

procedure TFContabIng.z2bbtnImprimeClick(Sender: TObject);
var
   Comprobante : RCabComprobante;
begin
	 if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' then
    begin
     RecCptosDifC;

     Contabiliza;
     DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');

     ActualizaCNT311( DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
                      DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                      DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                      DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString );

     if SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
                 DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                 DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                 DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                 DMTE.SRV_D, 'PCNA', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                 DMTE.cdsResultSet, DMTE.DCOM1, Self ) then

      ImprimeVoucher( 'CNT311', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
 	  end;

   if DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' then
    begin
     ImprimeVoucher( 'CNT301', dblcCia.Text, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
    end;

   {

      DMTE.AplicaDatos(DMTE.cdsCntCaja,'CNTCAJA');

      xSQL:='Select * From CAJA302 '
            +'Where CIAID='''   +dblcCia.Text    +''' and '
            +      'ECANOMM=''' +edtPeriodo.Text +''' and '
            +      'TDIARID=''' +dblcTDiario.Text+''' and '
            +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
      DMTE.cdsEgrCaja.DataRequest( xSQL );

      DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');
  end;

  with Comprobante do
  begin
    CIAID    := dblcCia.Text ;
    TDIARID  := dblcTDiario.Text ;
    CiaDes   := edtCia.Text ;
    Diario   := edtTDiario.Text ;
    Proveedor:= '';
    Glosa    := dbeGlosa.Text ;
    Lote     := dbeLote.Text ;
    Periodo  := edtPeriodo.Text ;
    NoComp   := dbeNoComp.Text ;
    Cuenta   := '';
    Banco    := edtBanco.text ;
    Importe  := DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString;

    If DMTE.wModo = 'A' then
       TipoCamb := DMTE.cdsDocsContWork.FieldByName('NCOTCAMB').AsString
    else
       TipoCamb := DMTE.cdsDocsContWork.FieldByName('NCOTCAMB').AsString;

    TipoCamb := '3.5';
  end;

   FVoucherImp:=TFVoucherImp.Create(Self);
   FVoucherImp.wComprobanteI:=Comprobante;
   with FVoucherImp do
   Try
      ShowModal;
   Finally
    	 if xConta<>'S' then begin
         xSql:='Delete FROM CAJA302 '+
               'WHERE CIAID='   +QuotedStr( dblcCia.Text     )+
                ' and TDIARID=' +QuotedStr( dblcTDiario.Text )+
                ' and ECANOMM=' +QuotedStr( edtPeriodo.Text  )+
                ' and ECNOCOMP='+QuotedStr( dbeNoComp.Text   );
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         xSql:='Delete FROM CAJA304 '+
               'WHERE CIAID='   +QuotedStr( dblcCia.Text     )+
                ' and TDIARID=' +QuotedStr( dblcTDiario.Text )+
                ' and ECANOMM=' +QuotedStr( edtPeriodo.Text  )+
                ' and ECNOCOMP='+QuotedStr( dbeNoComp.Text   );
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
      end;
      Free;
   End;}
end;

procedure TFContabIng.dbgDocCanjeCalcTitleAttributes2(Sender: TObject;
  AFieldName: String; AFont: TFont; ABrush: TBrush;
  var ATitleAlignment: TAlignment);
begin
   if (AFieldName = 'CCMTOLOC') or (AFieldName = 'CCMTOEXT') then
    begin
     ABrush.Color := clNone;
    end;
end;

procedure TFContabIng.dbgDocCanjeDragOver2(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := True;
end;

procedure TFContabIng.dbgDocCanjeEndDrag2(Sender, Target: TObject; X,
  Y: Integer);
var
   I : Integer ;
begin
{   If (Target = dbgPendientes) And (DMTE.cdsDocsContWork.RecordCount <> 0 )
      and ( dbgDocCanje.SelectedList.Count > 0 ) Then
    begin
     for i:= 0 to dbgDocCanje.SelectedList.Count-1 do
      begin
         dbgDocCanje.DataSource.DataSet.GotoBookmark(dbgDocCanje.SelectedList.Items[i]);
         DMTE.cdsDocsContWork.edit ;
         DMTE.cdsDocsContWork.FieldByName('CCCONTA').Clear;
         DMTE.cdsDocsContWork.FieldByName('TDIARID').Clear;
         DMTE.cdsDocsContWork.FieldByName('ECNOCOMP').Clear;
         DMTE.cdsDocsContWork.Post ;
         dbgDocCanje.DataSource.DataSet.FreeBookmark(dbgDocCanje.SelectedList.Items[i]);
      end; // for
      dbgDocCanje.SelectedList.clear;  //Clear selected record list since they are all deleted
      dbgDocCanje.ColumnByName('NCOMTOLOC').FooterValue :=
                  CurrToStr( OperClientDataSet(DMTE.cdsDocsCont , 'SUM(NCOMTOLOC)' ,'CCCONTA=''S''')) ;
      dbgDocCanje.ColumnByName('NCOMTOEXT').FooterValue :=
                  CurrToStr( OperClientDataSet(DMTE.cdsDocsCont , 'SUM(NCOMTOEXT)' ,'CCCONTA=''S''')) ;
    end;}

//GAR***************************************************************************
//   If (not dbgDocCanje.Readonly) and (Target = dbgPendientes) Then
   If (DMTE.cdsDocsContWork.RecordCount <> 0) And (Target = dbgPendientes) Then
    begin
     for i := 0 to dbgDocCanje.SelectedList.Count-1 do
      begin
       DMTE.cdsDocsCont.Filtered := False;
       If DMTE.cdsDocsCont.Locate('DOCID; CCNODOC',
                         VarArrayOf([DMTE.cdsDocsContWork.FieldByName('DOCID').AsString,
                                    DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString]),[]) Then
        begin
         DMTE.cdsDocsCont.Edit;
         DMTE.cdsDocsCont.FieldByName('CCCONTA').Clear;
         DMTE.cdsDocsCont.FieldByName('TDIARID').Clear;
         DMTE.cdsDocsCont.FieldByName('ECNOCOMP').Clear;
         DMTE.cdsDocsCont.Post ;

         DMTE.cdsDocsContWork.Delete;

         dbgPendientes.RefreshDisplay;
         dbgDocCanje.RefreshDisplay;
        end;
      end;
     dbgDocCanje.SelectedList.Clear;

     DMTE.cdsDocsCont.Filtered := True;
     wModifica := True;
     Suma;
   end;
//GAR***************************************************************************
end;

procedure TFContabIng.dbgDocCanjeMouseDown2(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgDocCanje.BeginDrag(False);
end;

procedure TFContabIng.dbgPendientesDragOver2(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := True;
end;

procedure TFContabIng.dbgPendientesEndDrag2(Sender, Target: TObject; X, Y: Integer);
var
   i: integer;
begin
   if (Target = dbgDocCanje) AND (DMTE.cdsDocsCont.RecordCount <> 0 )
       and (dbgPendientes.SelectedList.Count > 0 )Then
    begin
     for i := 0 to dbgPendientes.SelectedList.Count-1 do
      begin
       dbgPendientes.DataSource.DataSet.GotoBookmark(dbgPendientes.SelectedList.Items[i]);

       DMTE.cdsDocsCont.Edit;
       DMTE.cdsDocsCont.FieldByName('CCCONTA').AsString  := 'S';
       DMTE.cdsDocsCont.FieldByName('TDIARID').AsString  := dblcTDiario.Text;
       DMTE.cdsDocsCont.FieldByName('ECNOCOMP').AsString := dbeNoComp.Text;
//         cdsPost( DMTE.cdsDocsCont );
//         DMTE.cdsDocsCont.Post ;
       ///
       DMTE.cdsDocsContWork.Append ;
       DMTE.cdsDocsContWork.FieldByName('CIAID').AsString      := DMTE.cdsDocsCont.FieldByName('CIAID').AsString;
       DMTE.cdsDocsContWork.FieldByName('CLIEID').AsString     := DMTE.cdsDocsCont.FieldByName('CLIEID').AsString;
       DMTE.cdsDocsContWork.FieldByName('CLIERUC').AsString    := DMTE.cdsDocsCont.FieldByName('CLIERUC').AsString;
       DMTE.cdsDocsContWork.FieldByName('FPAGOID').AsString    := DMTE.cdsDocsCont.FieldByName('FPAGOID').AsString;
       DMTE.cdsDocsContWork.FieldByName('TMONID').AsString     := DMTE.cdsDocsCont.FieldByName('TMONID').AsString;
       DMTE.cdsDocsContWork.FieldByName('NCOTCAMB').AsFloat    := DMTE.cdsDocsCont.FieldByName('NCOTCAMB').AsFloat;
       DMTE.cdsDocsContWork.FieldByName('NCOMTOORI').AsFloat   := DMTE.cdsDocsCont.FieldByName('NCOMTOORI').AsFloat;
       DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC').AsFloat   := DMTE.cdsDocsCont.FieldByName('NCOMTOLOC').AsFloat;
       DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT').AsFloat   := DMTE.cdsDocsCont.FieldByName('NCOMTOEXT').AsFloat;
       DMTE.cdsDocsContWork.FieldByName('NCOFCOB').AsDateTime  := DMTE.cdsDocsCont.FieldByName('NCOFCOB').AsDateTime;
       DMTE.cdsDocsContWork.FieldByName('BANCOID').AsString    := DMTE.cdsDocsCont.FieldByName('BANCOID').AsString;
       DMTE.cdsDocsContWork.FieldByName('CCBCOID').AsString    := DMTE.cdsDocsCont.FieldByName('CCBCOID').AsString;
       DMTE.cdsDocsContWork.FieldByName('NCONOCHQ').AsString   := DMTE.cdsDocsCont.FieldByName('NCONOCHQ').AsString;
       DMTE.cdsDocsContWork.FieldByName('NCOELABO').AsString   := DMTE.cdsDocsCont.FieldByName('NCOELABO').AsString;
       DMTE.cdsDocsContWork.FieldByName('NCOAPROB').AsString   := DMTE.cdsDocsCont.FieldByName('NCOAPROB').AsString;
       DMTE.cdsDocsContWork.FieldByName('NCOESTADO').AsString  := DMTE.cdsDocsCont.FieldByName('NCOESTADO').AsString;
       DMTE.cdsDocsContWork.FieldByName('NCOUSER').AsString    := DMTE.cdsDocsCont.FieldByName('NCOUSER').AsString;
       DMTE.cdsDocsContWork.FieldByName('NCOFREG').AsDateTime  := DMTE.cdsDocsCont.FieldByName('NCOFREG').AsDateTime;
       DMTE.cdsDocsContWork.FieldByName('NCOHREG').AsDateTime  := DMTE.cdsDocsCont.FieldByName('NCOHREG').AsDateTime;
       DMTE.cdsDocsContWork.FieldByName('CUENTAID').AsString   := DMTE.cdsDocsCont.FieldByName('CUENTAID').AsString;
       DMTE.cdsDocsContWork.FieldByName('DOCID').AsString      := DMTE.cdsDocsCont.FieldByName('DOCID').AsString;
       DMTE.cdsDocsContWork.FieldByName('CCSERIE').AsString    := DMTE.cdsDocsCont.FieldByName('CCSERIE').AsString;
       DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString    := DMTE.cdsDocsCont.FieldByName('CCNODOC').AsString;
       DMTE.cdsDocsContWork.FieldByName('CCFEMIS').AsDatetime  := DMTE.cdsDocsCont.FieldByName('CCFEMIS').AsDatetime;
       DMTE.cdsDocsContWork.FieldByName('CLAUXID').AsString    := DMTE.cdsDocsCont.FieldByName('CLAUXID').AsString;
       DMTE.cdsDocsContWork.FieldByName('CCNOMB').AsString     := DMTE.cdsDocsCont.FieldByName('CCNOMB').AsString;
       DMTE.cdsDocsContWork.FieldByName('CCLOTE').AsString     := DMTE.cdsDocsCont.FieldByName('CCLOTE').AsString;
       DMTE.cdsDocsContWork.FieldByName('CPTOID').AsString     := DMTE.cdsDocsCont.FieldByName('CPTOID').AsString;
       DMTE.cdsDocsContWork.FieldByName('CCGLOSA').AsString    := DMTE.cdsDocsCont.FieldByName('CCGLOSA').AsString;
       DMTE.cdsDocsContWork.FieldByName('CCTREC').AsString     := DMTE.cdsDocsCont.FieldByName('CCTREC').AsString;
       DMTE.cdsDocsContWork.FieldByName('CUENTAID').AsString   := DMTE.cdsDocsCont.FieldByName('CUENTAID').AsString;
       DMTE.cdsDocsContWork.FieldByName('ECCOBLOC').AsFloat    := DMTE.cdsDocsCont.FieldByName('ECCOBLOC').AsFloat;
       DMTE.cdsDocsContWork.FieldByName('ECCOBEXT').AsFloat    := DMTE.cdsDocsCont.FieldByName('ECCOBEXT').AsFloat;
       DMTE.cdsDocsContWork.FieldByName('ECDEVLOC').AsFloat    := DMTE.cdsDocsCont.FieldByName('ECDEVLOC').AsFloat;
       DMTE.cdsDocsContWork.FieldByName('ECDEVEXT').AsFloat    := DMTE.cdsDocsCont.FieldByName('ECDEVEXT').AsFloat;
       DMTE.cdsDocsContWork.FieldByName('CCCONTA').AsString    := 'S' ; //
       DMTE.cdsDocsContWork.FieldByName('ECANOMM').AsString    := DMTE.cdsDocsCont.FieldByName('ECANOMM').AsString;
       DMTE.cdsDocsContWork.FieldByName('TDIARID').AsString    := dblcTDiario.Text; //
       DMTE.cdsDocsContWork.FieldByName('ECNOCOMP').AsString   := dbeNoComp.Text; //
       DMTE.cdsDocsContWork.FieldByName('ECFEMICH').AsDatetime := DMTE.cdsDocsCont.FieldByName('ECFEMICH').AsDatetime;
       DMTE.cdsDocsContWork.FieldByName('ECNOCOMP2').AsString  := DMTE.cdsDocsCont.FieldByName('ECNOCOMP2').AsString;

       cdsPost( DMTE.cdsDocsContWork );
       DMTE.cdsDocsContWork.Post ;

       cdsPost( DMTE.cdsDocsCont );
       DMTE.cdsDocsCont.Post ;

       dbgPendientes.DataSource.DataSet.Freebookmark(dbgPendientes.SelectedList.Items[i]);

      end; // for
     dbgPendientes.SelectedList.clear;  { Clear selected record list since they are all deleted}
      //Calcula las sumas
     dbgDocCanje.ColumnByName('NCOMTOLOC').FooterValue := FloatToStrF( OperClientDataSet(DMTE.cdsDocsCont , 'SUM(NCOMTOLOC)' , 'CCCONTA = ''S'''), ffNumber, 15, 2);
     dbgDocCanje.ColumnByName('NCOMTOEXT').FooterValue := FloatToStrF( OperClientDataSet(DMTE.cdsDocsCont , 'SUM(NCOMTOEXT)' , 'CCCONTA = ''S'''), ffNumber, 15, 2);
     dbgPendientes.RefreshDisplay;
     dbgDocCanje.RefreshDisplay;
     Suma;
    end;
end;

procedure TFContabIng.dbgPendientesMouseDown2(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   dbgPendientes.BeginDrag(False);
end;

procedure TFContabIng.Z2bbtnSalirClick(Sender: TObject);
begin
   Close ;
end;

procedure TFContabIng.Valida;
begin
   ValidaEdit(dblcCia ,'Ingrese Compañía') ;
   ValidaEdit(dbdtpFComp ,'Ingrese Fecha de Comprobante') ;
   ValidaEdit(dblcBanco ,'Ingrese Caja') ;
   ValidaEdit(dbeGlosa ,'Ingrese Glosa') ;
   ValidaEdit(dblcTDiario ,'Ingrese Diario') ;
   ValidaEdit(dbeNoComp ,'Ingrese Comprobante') ;
{
    //validar la existencia del comprobante en la base de datos
    xWhere :=  'CIAID ='+''''+dblcCia.Text+''''
             + ' AND TDIARID =' + '''' + dblcTDiario.Text + ''''
             + ' AND ECANOMM =' + '''' + edtPeriodo.Text + ''''
             + ' AND ECNOCOMP =' + '''' + dbeNoComp.Text + '''';

    if DMTE.cdsDocsContWork.RecordCount = 0 then
    begin
       Raise Exception.create ( 'Ingrese Documentos a contabilizar' ) ;
    end   ;

    if DMTE.DisplayDescrip('prvTGE','CAJA302','COUNT(*) TOTREG',xWhere,'TOTREG')>'0' then
       Raise exception.create ('Comprobante ya Está Registrado') ;
}       
end;

procedure TFContabIng.AsignaCompaDocs;
begin
   DMTE.cdsDocsContWork.First;
   While Not DMTE.cdsDocsContWork.EOF do
    begin
     DMTE.cdsDocsContWork.Edit;
     DMTE.cdsDocsContWork.FieldByName('CIAID').AsString     := dblcCia.Text;
     DMTE.cdsDocsContWork.FieldByName('ECANOMM').AsString   := edtPeriodo.Text;
     DMTE.cdsDocsContWork.FieldByName('TDIARID').AsString   := dblcTDiario.Text;
     DMTE.cdsDocsContWork.FieldByName('ECNOCOMP').AsString  := dbeNoComp.Text;
     DMTE.cdsDocsContWork.Post;
     DMTE.cdsDocsContWork.Next;
    end;
end;

procedure TFContabIng.GeneraComp;
var
   xWhere, Aux : String;
begin
   DMTE.cdsEgrCaja.Edit;
   DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString:= '';
   DMTE.cdsEgrCaja.FieldByName('ECTCAMB').Value   := DMTE.cdsDocsContWork.FieldByName('NCOTCAMB').AsString;
   DMTE.cdsEgrCaja.FieldByName('PROV').AsString   := '';
   DMTE.cdsEgrCaja.FieldByName('DOCID').Value     := DMTE.cdsDocsContWork.FieldByName('DOCID').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECNODOC').Value   := DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString;

   DMTE.cdsEgrCaja.FieldByName('CIAID').Value       := dblcCia.Text;
   DMTE.cdsEgrCaja.FieldByName('TDIARID').Value     := dblcTDiario.Text;
   DMTE.cdsEgrCaja.FieldByName('ECANOMM').Value     := edtPeriodo.Text;
   DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').Value    := dbeNoComp.Text;

   // vhndema
   DMTE.cdsEgrCaja.FieldByName('ECFEMICH').Value    := dbdtpFecIni.Date;
   DMTE.cdsEgrCaja.FieldByName('ECFCOBCH').Value    := dbdtpFecFin.Date;
   // end vhndema

   DMTE.cdsEgrCaja.FieldByName('ECFCOMP').Value     := dbdtpFComp.Date;

   if DMTE.cdsEgrCaja.FieldByName('TMONID').AsString=DMTE.wTMonLoc then
   begin
     DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString := dbgDocCanje.ColumnByName('NCOMTOLOC').FooterValue ;
     DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString := dbgDocCanje.ColumnByName('NCOMTOLOC').FooterValue ;
     DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsString := dbgDocCanje.ColumnByName('NCOMTOEXT').FooterValue ;
   end
   else
   begin
     DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString := dbgDocCanje.ColumnByName('NCOMTOEXT').FooterValue ;
     DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString := dbgDocCanje.ColumnByName('NCOMTOLOC').FooterValue ;
     DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsString := dbgDocCanje.ColumnByName('NCOMTOEXT').FooterValue ;
   end;

   DMTE.cdsEgrCaja.FieldByName('BANCOID').Value     := dblcBanco.Text;
   DMTE.cdsEgrCaja.FieldByName('CUENTAID').Value    := edtCuenta.Text;
   DMTE.cdsEgrCaja.FieldByName('ECGLOSA').Value     := dbeGlosa.Text;
   DMTE.cdsEgrCaja.FieldByName('ECLOTE').Value      := dbeLote.Text;
   DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString := 'I';

   xWhere := 'FECHA ='+DMTE.wRepFuncDate+''''+ FormatDateTime(DMTE.wFormatFecha, dbdtpFComp.Date)+''')';
   aux    := DMTE.DisplayDescrip('prvTGE', 'TGE114', '*', xWhere, 'FECANO');
   DMTE.cdsEgrCaja.FieldByName('ECANO').AsString   := DMTE.cdsQry.FieldByName('FECANO').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECMM').AsString    := DMTE.cdsQry.FieldByName('FECMES').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECDD').AsString    := DMTE.cdsQry.FieldByName('FECDIA').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECSS').AsString    := DMTE.cdsQry.FieldByName('FECSS').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString   := DMTE.cdsQry.FieldByName('FECSEM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString   := DMTE.cdsQry.FieldByName('FECTRIM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString  := DMTE.cdsQry.FieldByName('FECAASS').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAASem').AsString := DMTE.cdsQry.FieldByName('FECAASEM').AsString;
   DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString := DMTE.cdsQry.FieldByName('FECAATRI').AsString;
   DMTE.cdsEgrCaja.FieldByName('EC_PROCE').Value   := 'C';
   DMTE.cdsEgrCaja.FieldByName('EC_IE').Value      := 'I';
   DMTE.cdsEgrCaja.Post ;
end;

procedure TFContabIng.Contab_Doc;
var
   xSQL : String;
begin
   xSQL := 'Select * From CAJA301 '
          +'Where CIAID='''  +dblcCia.Text                                    +''' and '
          +      'DOCID2=''' +DMTE.cdsDocsContWork.FieldByName('DOCID').AsString  +''' and '
          +      'CPSERIE='''+DMTE.cdsDocsContWork.FieldByName('CCSERIE').AsString+''' and '
          +      'CPNODOC='''+DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString+''' ';
   DMTE.cdsSQL.Close;
   DMTE.cdsSQL.DataRequest( xSQL );
   DMTE.cdsSQL.Open;
   DMTE.cdsSQL.First;
   While not DMTE.cdsSQL.Eof do
    begin
     // VHNDEMA
     DMTE.cdsCntCaja.Insert;
     //DMTE.cdsCntCaja.Edit;
     // END VHNDEMA
     DMTE.cdsCntCaja.FieldByName('CIAID').Value      := dblcCia.Text      ;
     DMTE.cdsCntCaja.FieldByName('TDIARID').Value    := dblcTDiario.Text  ;
     DMTE.cdsCntCaja.FieldByName('ECNOCOMP').Value   := dbeNoComp.Text    ;
     DMTE.cdsCntCaja.FieldByName('ECANOMM').Value    := DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCDH').Value       := 'H';
     DMTE.cdsCntCaja.FieldByName('DOCMOD').Value     := 'CAJA';
     DMTE.cdsCntCaja.FieldByName('DOCID').Value      := DMTE.cdsDocsContWork.FieldByName('DOCID').AsString;
     DMTE.cdsCntCaja.FieldByName('DCSERIE').Value    := DMTE.cdsDocsContWork.FieldByName('CCSERIE').AsString;
     DMTE.cdsCntCaja.FieldByName('DCNODOC').Value    := DMTE.cdsDocsContWork.FieldByName('CCNODOC').AsString;
     DMTE.cdsCntCaja.FieldByName('ECFCOMP').Value    := dbdtpFComp.Date;
     DMTE.cdsCntCaja.FieldByName('DCFEMIS').Value    := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').Value;

     // VHNDEMA
     DMTE.cdsCntCaja.FieldByName('DCFVCMTO').Value   := DMTE.cdsDocsContWork.FieldByName('CCFEMIS').Value;
     DMTE.cdsCntCaja.FieldByName('DCGLOSA').Value   := DMTE.cdsDocsContWork.FieldByName('CCGLOSA').AsString;
     // END VHNDEMA

     DMTE.cdsCntCaja.FieldByName('CPTOID').Value     := DMTE.cdsSQL.FieldByName('CPTOID').AsString;
     DMTE.cdsCntCaja.FieldByName('CUENTAID').Value   := DMTE.cdsSQL.FieldByName('CUENTAID').AsString;
     DMTE.cdsCntCaja.FieldByName('CLAUXID').Value    := DMTE.cdsDocsContWork.FieldByName('CLAUXID').AsString; //Aqui se toma de la cabecera
     DMTE.cdsCntCaja.FieldByName('DCAUXID').Value    := DMTE.cdsDocsContWork.FieldByName('CLIEID').AsString;    //Aqui se toma de la cabecera
     DMTE.cdsCntCaja.FieldByName('DCTCAMPA').Value   := DMTE.cdsDocsContWork.FieldByName('NCOTCAMB').Value ;
     DMTE.cdsCntCaja.FieldByName('DCTCAMPR').Value   := DMTE.cdsDocsContWork.FieldByName('NCOTCAMB').Value ;
     DMTE.cdsCntCaja.FieldByName('TMONID').Value     := DMTE.cdsEgrCaja.FieldByName('TMONID').AsString;
     DMTE.cdsCntCaja.FieldByName('DCMTOORI').Value   := DMTE.cdsSQL.FieldByName('DEMTOORI').Value;
     DMTE.cdsCntCaja.FieldByName('DCMTOLO').Value    := DMTE.cdsSQL.FieldByName('DEMTOLOC').Value;
     DMTE.cdsCntCaja.FieldByName('DCMTOEXT').Value   := DMTE.cdsSQL.FieldByName('DEMTOEXT').Value;
     DMTE.cdsCntCaja.FieldByName('DCFLACDR').Value   := 'S';   //Registro ya cuadrado
     DMTE.cdsCntCaja.FieldByName('DCLOTE').Value     := DMTE.cdsEgrCaja.FieldByName('ECLOTE').AsString;
     DMTE.cdsCntCaja.FieldByName('DCANO').AsString   := DMTE.cdsEgrCaja.FieldByName('ECANO').AsString;
     DMTE.cdsCntCaja.FieldByName('DCMM').AsString    := DMTE.cdsEgrCaja.FieldByName('ECMM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCDD').AsString    := DMTE.cdsEgrCaja.FieldByName('ECDD').AsString;
     DMTE.cdsCntCaja.FieldByName('DCSS').AsString    := DMTE.cdsEgrCaja.FieldByName('ECSS').AsString;
     DMTE.cdsCntCaja.FieldByName('DCSEM').AsString   := DMTE.cdsEgrCaja.FieldByName('ECSEM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCTRI').AsString   := DMTE.cdsEgrCaja.FieldByName('ECTRI').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAASS').AsString  := DMTE.cdsEgrCaja.FieldByName('ECAASS').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAASEM').AsString := DMTE.cdsEgrCaja.FieldByName('ECAASEM').AsString;
     DMTE.cdsCntCaja.FieldByName('DCAATRI').AsString := DMTE.cdsEgrCaja.FieldByName('ECAATRI').AsString;
     xNReg := xNReg+1;
     DMTE.cdsCntCaja.FieldByName('NREG').AsInteger  := xNReg;
     DMTE.cdsCntCaja.Post ;
     DMTE.cdsSQL.Next;
    end;
   DMTE.cdsSQL.Close;
end;

procedure TFContabIng.RecuperaDetalles;
var
   xSQL : String ;
begin
   DMTE.cdsDocsCont.Close;

   // vhndema
   {
   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
    xSQL := 'SELECT * FROM CXC303 WHERE CIAID='''+dblcCia.Text+''' AND '
           +'NCOESTADO=''C'' AND '
           +'( ( COALESCE(CCCONTA,''N'')=''N'' ) OR '
           +' ( TDIARID='''+dblcTDiario.Text+''' and ECNOCOMP='''+dbeNoComp.Text+''') )'
   else
    if DMTE.SRV_D = 'ORACLE' then
     xSQL := 'SELECT * FROM CXC303 WHERE CIAID='''+dblcCia.Text+''' AND '
            +'NCOESTADO=''C'' AND '
            +'( ( NVL(CCCONTA,''N'')=''N'' ) OR '
            + ' ( TDIARID='''+dblcTDiario.Text+''' and ECNOCOMP='''+dbeNoComp.Text+''') )';
    }
   if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
      xSQL := 'SELECT * FROM CXC303 WHERE CIAID ='''+dblcCia.Text+''' AND '
             +'NCOESTADO=''C'' AND '
             +'( ( COALESCE(CCCONTA,''N'')=''N'' ) OR '
             + ' ( TDIARID='''+dblcTDiario.Text+''' and ECNOCOMP='''+dbeNoComp.Text+''') )'
             +' and CCFEMIS >=DATE('+QuotedStr(DateToStr(dbdtpFecIni.Date))+') '
             +' and CCFEMIS <=DATE('+QuotedStr(DateToStr(+dbdtpFecFin.Date))+') '
             +'ORDER BY DOCID, CCNODOC'
   else
      if DMTE.SRV_D = 'ORACLE' then
         xSQL := 'SELECT * FROM CXC303 WHERE CIAID='''+dblcCia.Text+''' AND '
                +'NCOESTADO=''C'' AND '
                +'( ( NVL(CCCONTA,''N'')=''N'' ) OR '
                + ' ( TDIARID='''+dblcTDiario.Text+''' and ECNOCOMP='''+dbeNoComp.Text+''') )'
                +' and CCFEMIS >= TO_DATE('+QuotedStr(DateToStr(dbdtpFecIni.Date))+') '
                +' and CCFEMIS <= TO_DATE('+QuotedStr(DateToStr(dbdtpFecFin.Date))+') '
                +'ORDER BY DOCID, CCNODOC';
   // end vhndema

   DMTE.cdsDocsCont.DataRequest(xSQL);
   DMTE.cdsDocsCont.FetchOnDemand := False;
   DMTE.cdsDocsCont.PacketRecords := 500;
   DMTE.cdsDocsCont.Open;
   DMTE.cdsDocsCont.FetchOnDemand := True;
   DMTE.cdsDocsCont.Filtered := False;
   DMTE.cdsDocsCont.Filter   := '' ;
   DMTE.cdsDocsCont.Filter   := 'ECNOCOMP IS NULL';
   DMTE.cdsDocsCont.Filtered := True ;

   dbgPendientes.Selected.Clear;
   dbgPendientes.Selected.Add('DOCID'#9'3'#9'Doc'#9'F');
   dbgPendientes.Selected.Add('CCSERIE'#9'5'#9'Serie'#9'F');
   dbgPendientes.Selected.Add('CCNODOC'#9'12'#9'No.Documento'#9'F');
   dbgPendientes.Selected.Add('CCFEMIS'#9'10'#9'Fecha~Emisión'#9'F');
   dbgPendientes.Selected.Add('CLAUXID'#9'5'#9'Clase'#9'F');
   dbgPendientes.Selected.Add('CLIEID'#9'12'#9'Auxiliar'#9'F');
   dbgPendientes.Selected.Add('CCNOMB'#9'25'#9'Nombre'#9'F');
   dbgPendientes.Selected.Add('TMONID'#9'7'#9'Moneda'#9'F');
   dbgPendientes.Selected.Add('NCOTCAMB'#9'7'#9'Tipo de~Cambio'#9'F');
   dbgPendientes.Selected.Add('NCOMTOEXT'#9'12'#9'Monto~Externo'#9'F');
   dbgPendientes.Selected.Add('NCOMTOLOC'#9'12'#9'Monto~Local'#9'F');
   dbgPendientes.ApplySelected;

   TNumericField(DMTE.cdsDocsCont.FieldByName('NCOMTOEXT')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMTE.cdsDocsCont.FieldByName('NCOMTOEXT')).EditFormat    := '########0.00';
   TNumericField(DMTE.cdsDocsCont.FieldByName('NCOMTOLOC')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMTE.cdsDocsCont.FieldByName('NCOMTOLOC')).EditFormat    := '########0.00';

   DMTE.cdsDocsContWork.IndexFieldNames := '';
   DMTE.cdsDocsContWork.Close;
   DMTE.cdsDocsContWork.DataRequest(xSQL);
   DMTE.cdsDocsContWork.Open;
   DMTE.cdsDocsContWork.Filter   := 'CCCONTA =''S'' ' ;
   DMTE.cdsDocsContWork.Filtered := True ;

   dbgDocCanje.Selected.Clear;
   dbgDocCanje.Selected.Add('DOCID'#9'3'#9'Doc'#9'F');
   dbgDocCanje.Selected.Add('CCSERIE'#9'5'#9'Serie'#9'F');
   dbgDocCanje.Selected.Add('CCNODOC'#9'12'#9'No.Documento'#9'F');
   dbgDocCanje.Selected.Add('CCFEMIS'#9'10'#9'Fecha~Emisión'#9'F');
   dbgDocCanje.Selected.Add('CLAUXID'#9'5'#9'Clase'#9'F');
   dbgDocCanje.Selected.Add('CLIEID'#9'12'#9'Auxiliar'#9'F');
   dbgDocCanje.Selected.Add('CCNOMB'#9'25'#9'Nombre'#9'F');
   dbgDocCanje.Selected.Add('TMONID'#9'7'#9'Moneda'#9'F');
   dbgDocCanje.Selected.Add('NCOTCAMB'#9'7'#9'Tipo de~Cambio'#9'F');
   dbgDocCanje.Selected.Add('NCOMTOEXT'#9'12'#9'Monto~Externo'#9'F');
   dbgDocCanje.Selected.Add('NCOMTOLOC'#9'12'#9'Monto~Local'#9'F');
   dbgDocCanje.ApplySelected;

   TNumericField(DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT')).EditFormat    := '########0.00';
   TNumericField(DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC')).DisplayFormat := '###,###,##0.00';
   TNumericField(DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC')).EditFormat    := '########0.00';
   dbgDocCanje.ColumnByName('NCOMTOEXT').FooterValue := FloatToStrF(OperClientDataSet(DMTE.cdsDocsContWork, 'SUM(NCOMTOEXT)', ''), ffNumber, 15, 2);
   dbgDocCanje.ColumnByName('NCOMTOLOC').FooterValue := FloatToStrF(OperClientDataSet(DMTE.cdsDocsContWork, 'SUM(NCOMTOLOC)', ''), ffNumber, 15, 2);
end;

procedure TFContabIng.FormDestroy(Sender: TObject);
begin
   cf1.Free ;
end;

procedure TFContabIng.ActualizaFiltro;
begin
   if Z2bbtnCont.Visible then
    begin
     if not xGraboNuevo then
      cdsFiltro.Append ;
      DMTE.ActualizaCDS(DMTE.cdsEgrCaja, cdsFiltro) ;
    end
   else
    begin
//       DMTE.ActualizaCDS(DMTE.cdsEgrCaja,cdsFiltro) ;
    end ;
end;

procedure TFContabIng.Z2bbtnOKCabClick(Sender: TObject);
var
   xSQL : String;
begin
   If Length(dbdtpFecIni.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Fecha de Inicio', mtInformation, [mbOk], 0);
     dbdtpFecIni.SetFocus;
     Exit;
    end;

   If Length(dbdtpFecFin.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Fecha Final', mtInformation, [mbOk], 0);
     dbdtpFecFin.SetFocus;
     Exit;
    end;

   If (dbdtpFecIni.DateTime) > (dbdtpFecFin.DateTime) Then
    begin
     Beep;
     MessageDlg('La Fecha de Inicio es Mayor a la Fecha de Fin', mtInformation, [mbOk], 0);
     dbdtpFecIni.SetFocus;
     Exit;
    end;

   //if DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString='' then begin
   if not dbeNoComp.Enabled then
   begin
      DMTE.cdsDocsCont.Close;
      if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
         xSQL := 'SELECT * FROM CXC303 WHERE CIAID ='''+dblcCia.Text+''' AND '
                +'NCOESTADO=''C'' AND '
                +'( ( COALESCE(CCCONTA,''N'')=''N'' ) OR '
                + ' ( TDIARID='''+dblcTDiario.Text+''' and ECNOCOMP='''+dbeNoComp.Text+''') )'
                +' and CCFEMIS >=DATE('+QuotedStr(DateToStr(dbdtpFecIni.Date))+') '
                +' and CCFEMIS <=DATE('+QuotedStr(DateToStr(+dbdtpFecFin.Date))+') '
                +'ORDER BY DOCID, CCNODOC'

      else
         if DMTE.SRV_D = 'ORACLE' then
            xSQL := 'SELECT * FROM CXC303 WHERE CIAID='''+dblcCia.Text+''' AND '
                   +'NCOESTADO=''C'' AND TMONID='''+edtMoneda.Text+''' AND '
                   +'( ( NVL(CCCONTA,''N'')=''N'' ) OR '
                   + ' ( TDIARID='''+dblcTDiario.Text+''' and ECNOCOMP='''+dbeNoComp.Text+''') )'
                   +' and CCFEMIS >= TO_DATE('+QuotedStr(DateToStr(dbdtpFecIni.Date))+') '
                   +' and CCFEMIS <= TO_DATE('+QuotedStr(DateToStr(dbdtpFecFin.Date))+') '
                   +'ORDER BY DOCID, CCNODOC';

      DMTE.cdsDocsCont.IndexFieldNames := 'CCFEMIS;DOCID;CCNODOC';
      DMTE.cdsDocsCont.DataRequest(xSQL);
      DMTE.cdsDocsCont.Open;
      DMTE.cdsDocsCont.Filter   := 'ECNOCOMP IS NULL' ;
      DMTE.cdsDocsCont.Filtered := True ;
      dbgPendientes.DataSource := DMTE.dsDocsCont;

      dbgPendientes.Selected.Clear;
      dbgPendientes.Selected.Add('DOCID'#9'3'#9'Doc'#9'F');
      dbgPendientes.Selected.Add('CCSERIE'#9'5'#9'Serie'#9'F');
      dbgPendientes.Selected.Add('CCNODOC'#9'12'#9'No.Documento'#9'F');
      dbgPendientes.Selected.Add('CCFEMIS'#9'10'#9'Fecha~Emisión'#9'F');
      dbgPendientes.Selected.Add('CLAUXID'#9'5'#9'Clase'#9'F');
      dbgPendientes.Selected.Add('CLIEID'#9'12'#9'Auxiliar'#9'F');
      dbgPendientes.Selected.Add('CCNOMB'#9'25'#9'Nombre'#9'F');
      dbgPendientes.Selected.Add('TMONID'#9'7'#9'Moneda'#9'F');
      dbgPendientes.Selected.Add('NCOTCAMB'#9'7'#9'Tipo de~Cambio'#9'F');
      dbgPendientes.Selected.Add('NCOMTOEXT'#9'12'#9'Monto~Externo'#9'F');
      dbgPendientes.Selected.Add('NCOMTOLOC'#9'12'#9'Monto~Local'#9'F');
      dbgPendientes.ApplySelected;
//      dbgPendientes.RedrawGrid;           dd
           
      TNumericField(DMTE.cdsDocsCont.FieldByName('NCOMTOEXT')).DisplayFormat := '###,###,##0.00';
      TNumericField(DMTE.cdsDocsCont.FieldByName('NCOMTOEXT')).EditFormat    := '########0.00';
      TNumericField(DMTE.cdsDocsCont.FieldByName('NCOMTOLOC')).DisplayFormat := '###,###,##0.00';
      TNumericField(DMTE.cdsDocsCont.FieldByName('NCOMTOLOC')).EditFormat    := '########0.00';

      DMTE.cdsDocsContWork.IndexFieldNames := 'CCFEMIS;DOCID;CCNODOC';
      DMTE.cdsDocsContWork.Close;
      DMTE.cdsDocsContWork.DataRequest(xSQL);
      DMTE.cdsDocsContWork.Open;
      DMTE.cdsDocsContWork.Filter   := 'CCCONTA = ''S'' ' ;
      DMTE.cdsDocsContWork.Filtered := True ;
//      dbgDocCanje.DataSource := DMTE.dsDocsContWork;

      dbgDocCanje.Selected.Clear;
      dbgDocCanje.Selected.Add('DOCID'#9'3'#9'Doc'#9'F');
      dbgDocCanje.Selected.Add('CCSERIE'#9'5'#9'Serie'#9'F');
      dbgDocCanje.Selected.Add('CCNODOC'#9'12'#9'No.Documento'#9'F');
      dbgDocCanje.Selected.Add('CCFEMIS'#9'10'#9'Fecha~Emisión'#9'F');
      dbgDocCanje.Selected.Add('CLAUXID'#9'5'#9'Clase'#9'F');
      dbgDocCanje.Selected.Add('CLIEID'#9'12'#9'Auxiliar'#9'F');
      dbgDocCanje.Selected.Add('CCNOMB'#9'25'#9'Nombre'#9'F');
      dbgDocCanje.Selected.Add('TMONID'#9'7'#9'Moneda'#9'F');
      dbgDocCanje.Selected.Add('NCOTCAMB'#9'7'#9'Tipo de~Cambio'#9'F');
      dbgDocCanje.Selected.Add('NCOMTOEXT'#9'12'#9'Monto~Externo'#9'F');
      dbgDocCanje.Selected.Add('NCOMTOLOC'#9'12'#9'Monto~Local'#9'F');
      dbgDocCanje.ApplySelected;

      TNumericField(DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT')).DisplayFormat := '###,###,##0.00';
      TNumericField(DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT')).EditFormat    := '########0.00';
      TNumericField(DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC')).DisplayFormat := '###,###,##0.00';
      TNumericField(DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC')).EditFormat    := '########0.00';
   end;

   dblcCia.Enabled       := False;
   dbdtpFComp.Enabled    := False;
   dblcBanco.Enabled     := False;
   dbeNoComp.Enabled     := False;

   Z2bbtnGraba.Enabled := True;
end;

procedure TFContabIng.z2bbtnGrabaClick(Sender: TObject);
var
   xSQL : String;
begin
   If DMTE.cdsDocsContWork.RecordCount = 0 Then
    begin
     Beep;
     MessageDlg('No Existen Documentos a Contabilizar', mtInformation, [mbOk], 0);
     dbgPendientes.SetFocus;
     Exit;
    end;

   If Length(dbeGlosa.Text) = 0 Then
    begin
     Beep;
     MessageDlg('Ingrese la Glosa', mtInformation, [mbOk], 0);
     dbeGlosa.SetFocus;
     Exit;
    end;

   Screen.Cursor := crHourGlass ;

   GeneraComp;

   AsignaCompaDocs;

   DMTE.AplicaDatos(DMTE.cdsCntCaja, 'CNTCAJA');

   xSQL := 'Select * From CAJA302 '
          +'Where CIAID ='''   +dblcCia.Text    +''' and '
          +      'ECANOMM =''' +edtPeriodo.Text +''' and '
          +      'TDIARID =''' +dblcTDiario.Text+''' and '
          +      'ECNOCOMP ='''+dbeNoComp.Text  +''' ';
   DMTE.cdsEgrCaja.DataRequest( xSQL );

   DMTE.AplicaDatos(DMTE.cdsEgrCaja,'EGRCAJA');

   DMTE.AplicaDatos(DMTE.cdsDocsCont, 'DOCSCONT');

   Screen.Cursor := crDefault;
   Z2bbtnCont.Enabled    := True;
   z2bbtnImprime.Enabled := True;
   pnlCabecera1.Enabled  := False;
   pnlDetalle.Enabled    := True;
   Beep;
   MessageDlg('Datos Actualizados', mtCustom, [mbOk], 0);
end;

procedure TFContabIng.dbgPendientesTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
   isBusca.Clear;
   lblBusca.Caption := 'Buscar por : '+StringReplace(dbgPendientes.ColumnByName(AFieldName).DisplayLabel, '~', ' ', [rfReplaceAll]); //Para Colocar el Nombre de la Cabecera
   pnlBusca.Visible := True;
   isBusca.SearchField := AFieldName;
   isBusca.SetFocus;
end;

procedure TFContabIng.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFContabIng.Suma;
var
   xRegAct : TBookMark;
   xMtoLoc, xMtoExt: Currency;
begin
   With DMTE do
    begin
     cdsDocsContWork.DisableControls ;
     xRegAct := cdsDocsContWork.GetBookmark;
     xMtoLoc := 0;
     xMtoExt := 0;
     cdsDocsContWork.First ;
     While not cdsDocsContWork.Eof do
      begin
       xMtoLoc := xMtoLoc + StrToCurr( StringReplace(cdsDocsContWork.FieldByName('NCOMTOLOC').DisplayText, ',', '', [rfReplaceAll]) ) ;
       xMtoExt := xMtoExt + StrToCurr( StringReplace(cdsDocsContWork.FieldByName('NCOMTOEXT').DisplayText, ',', '', [rfReplaceAll]) ) ;
       cdsDocsContWork.Next;
      end;

     cdsDocsContWork.GotoBookmark(xRegAct);
     cdsDocsContWork.FreeBookmark(xRegAct);
     cdsDocsContWork.EnableControls;

     dbgDocCanje.ColumnByName('NCOMTOEXT').FooterValue := FloatToStrF(xMtoExt, ffFixed, 10, 2);
     dbgDocCanje.ColumnByName('NCOMTOLOC').FooterValue := FloatToStrF(xMtoLoc, ffFixed, 10, 2);
    end;
end;

procedure TFContabIng.dbgDocCanjeColExit(Sender: TObject);
begin
   Suma;
   dbgDocCanje.RefreshDisplay;
end;

procedure TFContabIng.isBuscaKeyPress(Sender: TObject; var Key: Char);
begin
   If Key = #27 Then
    pnlBusca.Visible := False;
end;

procedure TFContabIng.isBuscaExit(Sender: TObject);
begin
   dbgPendientes.SetFocus;
   pnlBusca.Visible := False;
end;

procedure TFContabIng.FormShow(Sender: TObject);
var
   TransComp : structComprobante ;
   xSQL, xWhere : String;
begin
   //**
   if DMTE.wModo = 'A' then
   begin
      Adiciona;
   end
   else
   begin
      Edita( TransComp , DMTE.cdsEgrCaja ) ;
   end;

   FocoInicial;
   if Z2bbtnCont.Enabled then
    begin
     dbgDocCanje.ColumnByName('NCOMTOLOC').FooterValue := '0.00'  ;
     dbgDocCanje.ColumnByName('NCOMTOEXT').FooterValue := '0.00'  ;
    end
   else
    begin
     dbgDocCanje.ColumnByName('NCOMTOLOC').FooterValue :=
               DMTE.cdsEgrCaja.FieldByName('ECMTOLOC').AsString  ;
     dbgDocCanje.ColumnByName('NCOMTOEXT').FooterValue :=
               DMTE.cdsEgrCaja.FieldByName('ECMTOEXT').AsString  ;
    end ;
   cf1.PonerExits ;
   If DMTE.wModo = 'M' Then
    begin
     xWhere := 'BANCOID ='+QuotedStr(DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString);
     edtBanco.Text := DMTE.DisplayDescrip('prvSQL', 'TGE105', 'BANCONOM', xWhere, 'BANCONOM');
     edtTDiario.Text := DMTE.DisplayDescrip('prvTGE', 'TGE104', 'TDIARDES', 'TDIARID ='+QuotedStr(DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString), 'TDIARDES');
    end
   Else
    begin
     xSQL := 'Select * From CXC303'
            +' Where CIAID ='+QuotedStr('XX');

     DMTE.cdsDocsCont.Close;
     DMTE.cdsDocsCont.DataRequest(xSQL);
     DMTE.cdsDocsCont.Open;

     dbgPendientes.Selected.Clear;
     dbgPendientes.Selected.Add('DOCID'#9'3'#9'Doc'#9'F');
     dbgPendientes.Selected.Add('CCSERIE'#9'5'#9'Serie'#9'F');
     dbgPendientes.Selected.Add('CCNODOC'#9'12'#9'No.Documento'#9'F');
     dbgPendientes.Selected.Add('CCFEMIS'#9'10'#9'Fecha~Emisión'#9'F');
     dbgPendientes.Selected.Add('CLAUXID'#9'5'#9'Clase'#9'F');
     dbgPendientes.Selected.Add('CLIEID'#9'12'#9'Auxiliar'#9'F');
     dbgPendientes.Selected.Add('CCNOMB'#9'25'#9'Nombre'#9'F');
     dbgPendientes.Selected.Add('TMONID'#9'7'#9'Moneda'#9'F');
     dbgPendientes.Selected.Add('NCOTCAMB'#9'7'#9'Tipo de~Cambio'#9'F');
     dbgPendientes.Selected.Add('NCOMTOEXT'#9'12'#9'Monto~Externo'#9'F');
     dbgPendientes.Selected.Add('NCOMTOLOC'#9'12'#9'Monto~Local'#9'F');
     dbgPendientes.ApplySelected;

     TNumericField(DMTE.cdsDocsCont.FieldByName('NCOMTOEXT')).DisplayFormat := '###,###,##0.00';
     TNumericField(DMTE.cdsDocsCont.FieldByName('NCOMTOEXT')).EditFormat    := '########0.00';
     TNumericField(DMTE.cdsDocsCont.FieldByName('NCOMTOLOC')).DisplayFormat := '###,###,##0.00';
     TNumericField(DMTE.cdsDocsCont.FieldByName('NCOMTOLOC')).EditFormat    := '########0.00';

     DMTE.cdsDocsContWork.Close;
     DMTE.cdsDocsContWork.DataRequest(xSQL);
     DMTE.cdsDocsContWork.Open;

     dbgDocCanje.Selected.Clear;
     dbgDocCanje.Selected.Add('DOCID'#9'3'#9'Doc'#9'F');
     dbgDocCanje.Selected.Add('CCSERIE'#9'5'#9'Serie'#9'F');
     dbgDocCanje.Selected.Add('CCNODOC'#9'12'#9'No.Documento'#9'F');
     dbgDocCanje.Selected.Add('CCFEMIS'#9'10'#9'Fecha~Emisión'#9'F');
     dbgDocCanje.Selected.Add('CLAUXID'#9'5'#9'Clase'#9'F');
     dbgDocCanje.Selected.Add('CLIEID'#9'12'#9'Auxiliar'#9'F');
     dbgDocCanje.Selected.Add('CCNOMB'#9'25'#9'Nombre'#9'F');
     dbgDocCanje.Selected.Add('TMONID'#9'7'#9'Moneda'#9'F');
     dbgDocCanje.Selected.Add('NCOTCAMB'#9'7'#9'Tipo de~Cambio'#9'F');
     dbgDocCanje.Selected.Add('NCOMTOEXT'#9'12'#9'Monto~Externo'#9'F');
     dbgDocCanje.Selected.Add('NCOMTOLOC'#9'12'#9'Monto~Local'#9'F');
     dbgDocCanje.ApplySelected;

     TNumericField(DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT')).DisplayFormat := '###,###,##0.00';
     TNumericField(DMTE.cdsDocsContWork.FieldByName('NCOMTOEXT')).EditFormat    := '########0.00';
     TNumericField(DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC')).DisplayFormat := '###,###,##0.00';
     TNumericField(DMTE.cdsDocsContWork.FieldByName('NCOMTOLOC')).EditFormat    := '########0.00';
     dbgDocCanje.ColumnByName('NCOMTOEXT').FooterValue := FloatToStrF(OperClientDataSet(DMTE.cdsDocsContWork, 'SUM(NCOMTOEXT)', ''), ffNumber, 15, 2);
     dbgDocCanje.ColumnByName('NCOMTOLOC').FooterValue := FloatToStrF(OperClientDataSet(DMTE.cdsDocsContWork, 'SUM(NCOMTOLOC)', ''), ffNumber, 15, 2);
    end;
end;

end.



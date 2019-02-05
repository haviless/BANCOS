unit Caja225;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdbdlg, StdCtrls, Buttons, wwdbdatetimepicker, Mask, wwdbedit, wwdblook,
  ExtCtrls, CajaUtil , Db, oaContabiliza, Variants;

type
  TSpdDatPago = Record
    TMONID     ,
    TMONDES    ,
    FECHATC    ,
    ECTCAMB    ,
    ECMTOORI   ,
    ECLOTE     ,
    CPTOID     ,
    ECGLOSA    ,
    CIAID      ,
    CIADES     ,
    ECANOMM    ,
    ECNOCOMP   ,
    TDIARID    ,
    PROV       ,
    PROVRUC    ,
    CLAUXID    ,
    ECOPAGO    ,
    BANCOID    ,
    CCBCO      ,
    ECFPAGOP   ,
    FPAGOID    ,
    ECNOCHQ    ,
    ECGIRA     ,
    CUENTAID ,
    TDIARDES   : String ;
  end ;


  TFpagoProvX = class(TForm)
    pnlCabecera1: TPanel;
    pnlBotones: TPanel;
    lblEstado: TLabel;
    z2bbtnImprime: TBitBtn;
    z2bbtnCancelado: TBitBtn;
    z2bbtnCancel2: TBitBtn;
    z2bbtnCont: TBitBtn;
    pnlDetalle: TPanel;
    lblTMon: TLabel;
    lblTCambio: TLabel;
    lblImporte: TLabel;
    lblLote: TLabel;
    lblGlosa: TLabel;
    lblConcepto: TLabel;
    lblTDoc: TLabel;
    lblNoDoc: TLabel;
    dblcdCnp: TwwDBLookupComboDlg;
    edtTMon: TEdit;
    dbeTCambio: TwwDBEdit;
    dblcTMon: TwwDBLookupCombo;
    dbeImporte: TwwDBEdit;
    dbeLote: TwwDBEdit;
    dbeGlosa: TwwDBEdit;
    dblcTDoc: TwwDBLookupCombo;
    edtTDoc: TEdit;
    dbeNoDoc: TwwDBEdit;
    lblTDiario: TLabel;
    lblNoComp: TLabel;
    lblPeriodo: TLabel;
    dblcTDiario: TwwDBLookupCombo;
    edtTDiario: TEdit;
    dbeNoComp: TwwDBEdit;
    edtPeriodo: TEdit;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbeImporteEnter(Sender: TObject);
    procedure dbeImporteExit(Sender: TObject);
    procedure z2bbtnCancel2Click(Sender: TObject);
    procedure z2bbtnCanceladoClick(Sender: TObject);
    procedure dbeNoCompExit(Sender: TObject);
    procedure dblcTDiarioExit(Sender: TObject);
    procedure z2bbtnContClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcTDocExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcdCnpExit(Sender: TObject);
    procedure z2bbtnImprimeClick(Sender: TObject);

  private
    { Private declarations }
    A2digitos ,A4digitos : Array of TWinControl ;
    strTmp: string;
    xDat: TSpdDatPago;
    xOK: Boolean;
    //
    wCptoGan  ,
    wCptoPer  ,
    wCtaGan   ,
    wCtaPer   : String ;
    xNReg : Integer;
    //
    procedure ActualizaSaldos;
    procedure ActualizaSaldosCaja;
    procedure Configura ;
    procedure Contabiliza;
    procedure Contab_EgrCaja;
    procedure Contab_CanjeCxP;
    procedure Contab_DifCamCanje  ;
    procedure RecCptosDifC ;
  public
    { Public declarations }
    procedure RecibirDatos (Datos : TspdDatPago ) ;
    function  FinalizadoOK : Boolean ;
    function MuestraCancelacion (xCIAID , xECOPAGO : String ): Boolean;
  end;

var
  FpagoProvX: TFpagoProvX;

implementation

uses CajaDM,Caja202;

{$R *.DFM}

procedure TFpagoProvX.FormKeyPress(Sender: TObject; var Key: Char);
var
   xStr : String ;
begin
    if not aplicaKeyPress(self ,A2digitos , A4digitos) then
       Exit ;
    if not( Key in [ '0'..'9' , '.' , #8 ]) then
    begin
       Key := #0 ;
    end ;
    xStr := TCustomEdit(self.ActiveControl).text ;
    if key = '.' then
       if pos('.',xSTR) <> 0 then
          Key := #0 ;
end;

procedure TFpagoProvX.dbeImporteEnter(Sender: TObject);
begin
    strTmp := TCustomEdit(Sender).Text ;
end;

procedure TFpagoProvX.dbeImporteExit(Sender: TObject);
begin
    if strTmp <> TCustomEdit(Sender).text then
    begin
       TCustomEdit(Sender).text := CajaDec(TCustomEdit(Sender).text) ;
    end ;

end;

procedure TFpagoProvX.z2bbtnCancel2Click(Sender: TObject);
begin
   Close ;
end;

procedure TFpagoProvX.z2bbtnCanceladoClick(Sender: TObject);
var
   xDatAux : StructSaldosAux ;
   xWhere  : String ;
   Aux     : string ;
   xSQL : string;
   xLoc,xExt : double;
   xLoc1,xExt1 : String;
begin
   if MessageDlg('¿Grabar?',mtConfirmation,[mbYes, mbNo], 0)=mrYes then
   begin

      xSQL:='Select * from CAJA302 '
           +'Where CIAID='''   +xDat.CIAID    +''' and '
           +      'ECANOMM=''' +edtPeriodo.Text +''' and '
           +      'TDIARID=''' +dblcTDiario.Text+''' and '
           +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
      DM1.cdsEgrCaja.Close;
      DM1.cdsEgrCaja.DataRequest( xSQL );
      DM1.cdsEgrCaja.Open;

      DM1.cdsEgrCaja.Insert ;
      DM1.cdsEgrCaja.FieldByName('CIAID').Value      :=xDat.CIAID;
      DM1.cdsEgrCaja.FieldByName('TDIARID').Value    :=dblcTDiario.Text;
      DM1.cdsEgrCaja.FieldByName('ECANOMM').Value    :=edtPeriodo.Text;
      DM1.cdsEgrCaja.FieldByName('ECNOCOMP').Value   :=dbeNoComp.Text;
      DM1.cdsEgrCaja.FieldByName('ECOPAGO').Value    := xDat.ECOPAGO;
      DM1.cdsEgrCaja.FieldByName('CLAUXID').Value    :=xDat.CLAUXID;
      DM1.cdsEgrCaja.FieldByName('PROV').Value       :=xDat.PROV;
      DM1.cdsEgrCaja.FieldByName('PROVRUC').Value    :=xDat.PROVRUC ;
      DM1.cdsEgrCaja.FieldByName('ECFCOMP').aSsTRING :=xDat.FECHATC ;
      DM1.cdsEgrCaja.FieldByName('ECFPAGOP').AsString:=xdat.ECFPAGOP ;
      DM1.cdsEgrCaja.FieldByName('FPAGOID').Value    :=xDat.FPAGOID;
      DM1.cdsEgrCaja.FieldByName('EQUIID').AsString  :=dm1.EquivFPago( xDat.FPAGOID ,xdat.BANCOID) ;
      DM1.cdsEgrCaja.FieldByName('DOCID').Value      :=dblcTDoc.Text;
      DM1.cdsEgrCaja.FieldByName('ECNODOC').Value    :=dbeNoDoc.Text;
      DM1.cdsEgrCaja.FieldByName('TMONID').Value     :=dblcTMon.Text;
      DM1.cdsEgrCaja.FieldByName('ECTCAMB').Value    :=strtofloat(dbeTCambio.Text);
      DM1.cdsEgrCaja.FieldByName('ECMTOORI').Value   :=strtofloat(dbeImporte.Text);
      if DM1.cdsEgrCaja.FieldByName('TMONID').Value=dm1.wTMonLoc then
      begin
         DM1.cdsEgrCaja.FieldByName('ECMTOLOC').Value:=strtofloat(dbeImporte.Text);
         DM1.cdsEgrCaja.FieldByName('ECMTOEXT').Value:=strtofloat(dbeImporte.Text)/strtofloat(dbeTCambio.Text);
      end
      else
      begin
         DM1.cdsEgrCaja.FieldByName('ECMTOLOC').Value:=strtofloat(dbeImporte.Text)*strtofloat(dbeTCambio.Text);
         DM1.cdsEgrCaja.FieldByName('ECMTOEXT').Value:=strtofloat(dbeImporte.Text);
      end;
      DM1.cdsEgrCaja.FieldByName('BANCOID').Value :=  xDat.BANCOID ;
      DM1.cdsEgrCaja.FieldByName('CCBCOID').Value :=  xdat.CCBCO ;
      DM1.cdsEgrCaja.FieldByName('ECNOCHQ').Value :=  xDat.ECNOCHQ ;//dbeNoChq.Text;
      DM1.cdsEgrCaja.FieldByName('ECGIRA').Value  :=  xDat.ecGira ;  //dbeGiradoA.Text;
      DM1.cdsEgrCaja.FieldByName('CPTOID').Value  :=  dblcdCnp.Text;
      DM1.cdsEgrCaja.FieldByName('CUENTAID').Value:=  xDat.cuentaid;
      DM1.cdsEgrCaja.FieldByName('ECGLOSA').Value :=  dbeGlosa.Text;
      DM1.cdsEgrCaja.FieldByName('ECLOTE').Value  :=  dbeLote.Text;
      DM1.cdsEgrCaja.FieldByName('ECESTADO').Value:= 'I';
      xWhere:='FECHA=' +DM1.wRepFuncDate + '''' + formatdatetime(DM1.wFormatFecha,strtodatetime(xDat.FECHATC))+''')' ;
      aux   :=DM1.DisplayDescrip('prvTGE','TGE114','*',xWhere,'FECANO');
      DM1.cdsEgrCaja.FieldByName('ECANO').Value  := DM1.cdsqry.FieldByName('FecAno').Value;
      DM1.cdsEgrCaja.FieldByName('ECMM').Value   := DM1.cdsqry.FieldByName('FecMes').Value;
      DM1.cdsEgrCaja.FieldByName('ECDD').Value   := DM1.cdsqry.FieldByName('FecDia').Value;
      DM1.cdsEgrCaja.FieldByName('ECSS').Value   := DM1.cdsqry.FieldByName('FecSS').Value;
      DM1.cdsEgrCaja.FieldByName('ECSEM').Value  := DM1.cdsqry.FieldByName('FecSem').Value;
      DM1.cdsEgrCaja.FieldByName('ECTRI').Value  := DM1.cdsqry.FieldByName('FecTrim').Value;
      DM1.cdsEgrCaja.FieldByName('ECAASS').Value := DM1.cdsqry.FieldByName('FecAASS').Value;
      DM1.cdsEgrCaja.FieldByName('ECAASem').Value:= DM1.cdsqry.FieldByName('FecAASem').Value;
      DM1.cdsEgrCaja.FieldByName('ECAATri').Value:= DM1.cdsqry.FieldByName('FecAATri').Value;
      DM1.cdsEgrCaja.FieldByName('EC_PROCE').Value:='2';
      DM1.cdsEgrCaja.FieldByName('EC_IE').Value   :='E';

      ActualizaSaldos;
      DM1.cdsEgrCaja.FieldByName('ECEstado').AsString :='C';
      DM1.cdsEgrCaja.Post ;
      DM1.cdsEgrCaja.ApplyUpdates(0);

      DM1.cdsPagoCxP.Edit;
      DM1.cdsPagoCxP.FieldByName('ECNOCOMP').AsString :=dbeNoComp.Text;
      DM1.cdsPagoCxP.FieldByName('OPESTADO').AsString :='C';
      DM1.cdsPagoCxP.Post ;
      DM1.cdsPagoCxP.ApplyUpdates(0);

      xLoc1 := DM1.cdsCanjeCxP.FieldByName('CPSalLoc').AsString;
      xExt1 := DM1.cdsCanjeCxP.FieldByName('CPSalExt').AsString;
      with xDatAux , DM1.cdsEgrcaja do
      begin
        CIAID     :=  xdat.CIAID ;
        CLAUXID   :=  xdat.CLAUXID ;
        AUXID     :=  xDat.PROV ;
        MONTOMN   :=  fieldbyName('ECMTOLOC').AsString ;
        MONTOME   :=  fieldbyName('ECMTOEXT').AsString ;
        xLoc :=  StrToFloat(xLoc1) -  StrToFloat(MONTOMN);
        xExt := StrToFloat(xExt1) - StrToFloat(MONTOME);
        MTOSLOC   :=  FloatToStrF(xLoc,ffFixed,15,2) ;
        MTOSEXT   :=  FloatToStrF(xExt,ffFixed,15,2) ;
        FECHA     :=  strtodatetime(xdat.FECHATC) ;
        dm1.ActSaldosAux ( xDatAux ) ;
      end ;
      z2bbtnCont.Enabled     := True;
      z2bbtnCancelado.Enabled:= False;
      z2bbtnCancel2.Enabled  := False;

      pnlCabecera1.Enabled:=False;
      pnlDetalle.Enabled  :=False;

      lblEstado.Caption    :='Cancelado          ';
      ActualizaSaldosCaja ;
      ShowMessage('¡Grabación OK!') ;
      xOK := True;
      FinalizadoOK;
   end ;
end;
procedure TFPagoProvX.ActualizaSaldos;
{ mucho ojo :
  wmc fijate como recuperar los datos del cdsMovCxP
}
var
   xSQL : String ;
   xWhere : String ;
begin
   DM1.cdsMovCxP.Filtered:=False;

   DM1.cdsMovCxP.active := False ;
   xWhere:=' CIAID||CPANOMES||TDIARID||CPNOREG IN '
          +'       ( SELECT CIAID||CCPANOMM||TDIARID||CPNOREG '
          +'         FROM CXP304                              '
          +'         WHERE CIAID = '''+ xdat.CIAID + '''      '
          +'           AND TCANJEID = ''OP''                  '
          +'           AND CCPCANJE = '''+ xdat.ECOPAGO + ''' ) ';

   DM1.cdsMovCxP.Datarequest( 'SELECT * FROM CXP301 WHERE ' + xWhere ) ;
   DM1.cdsMovCxP.Active := True ;

   DM1.cdsCanjeCxP.DisableControls;
   DM1.cdsCanjeCxP.First;
   while not DM1.cdsCanjeCxP.Eof do
   begin
      if DM1.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                             VarArrayOf([DM1.cdsCanjeCxP.FieldByName('CiaId').AsString,
                                         DM1.cdsCanjeCxP.FieldByName('TDiarID').AsString,
                                         DM1.cdsCanjeCxP.FieldByName('CCPAnoMM').AsString,
                                         DM1.cdsCanjeCxP.FieldByName('CPNoReg').AsString]),
                             []) then
      begin
         DM1.cdsMovCxP.edit;
         If DM1.cdsMovCxP.FieldByName('TMonID').Value=DM1.wTMonLoc then
         begin
            DM1.cdsMovCxP.FieldByName('CPPagLoc').Value:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPPAGLOC').AsFloat+DM1.cdsCanjeCxP.FieldByName('CCPMoLoc').AsFloat,15,2);
            DM1.cdsMovCxP.FieldByName('CPPagExt').Value:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPPagLoc').AsFloat/DM1.cdsCanjeCxP.FieldByName('CCPTCCje').AsFloat,15,2);
            If DM1.cdsMovCxP.FieldByName('CPSalLoc').Value<=0 then
               DM1.cdsMovCxP.FieldByName('CPEstado').Value:='C';
         end
         else
         begin
            DM1.cdsMovCxP.FieldByName('CPPagExt').Value:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPPagExt').AsFloat+DM1.cdsCanjeCxP.FieldByName('CCPMoExt').AsFloat,15,2);
            DM1.cdsMovCxP.FieldByName('CPPagLoc').Value:=DM1.FRound(DM1.cdsMovCxP.FieldByName('CPPagExt').AsFloat*DM1.cdsCanjeCxP.FieldByName('CCPTCCje').AsFloat,15,2);
            If DM1.cdsMovCxP.FieldByName('CPSalExt').Value<=0 then
               DM1.cdsMovCxP.FieldByName('CPEstado').Value:='C';
         end;
         DM1.cdsMovCxP.FieldByName('CPTCamPa').AsFloat:=DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPTCCje').AsFloat,15,2);
         DM1.cdsMovCxP.post;
      end
      else
      begin
         ShowMessage('Error en la Actualización de Saldos WMC') ;
      end ;
      DM1.cdsCanjeCxP.Next;
   end;
   DM1.cdsMovCxP.Filtered:=True;
   DM1.cdsMovCxP.First;
   DM1.cdsCanjeCxP.EnableControls;

   // Actualizacion..

   xSQL:='Select * from CXP305 '
        +'Where CIAID='''   +xDat.CIAID   +''' and '
        +      'CCPCANJE='''+xDat.ECOPAGO +''' ';
   DM1.cdsDetCanjeCxP.Close;
   DM1.cdsDetCanjeCxP.DataRequest( xSQL );
   DM1.cdsDetCanjeCxP.Open;

   DM1.cdsDetCanjeCxP.First;
   While (not DM1.cdsDetCanjeCxP.Eof) and (DM1.cdsDetCanjeCxP.RecordCount>0) do
      DM1.cdsDetCanjeCxP.Delete;

   DM1.cdsCanjeCxP.DisableControls;
   DM1.cdsCanjeCxP.First;

   While not DM1.cdsCanjeCxP.Eof do
   begin
      DM1.cdsDetCanjeCxP.Insert;
      DM1.cdsDetCanjeCxP.FieldByName('CiaID').Value    := DM1.cdsCanjeCxP.FieldByName('CiaID').Value;
      DM1.cdsDetCanjeCxP.FieldByName('Prov').Value     := DM1.cdsCanjeCxP.FieldByName('Prov').Value;
      DM1.cdsDetCanjeCxP.FieldByName('ProvRuc').Value  := DM1.cdsCanjeCxP.FieldByName('ProvRuc').Value;
      DM1.cdsDetCanjeCxP.FieldByName('DocID').Value    := DM1.cdsCanjeCxP.FieldByName('DocID').Value;
      DM1.cdsDetCanjeCxP.FieldByName('CPserie').Value  := DM1.cdsCanjeCxP.FieldByName('CPSerie').Value;
      DM1.cdsDetCanjeCxP.FieldByName('CPNoDoc').Value  := DM1.cdsCanjeCxP.FieldByName('CPNoDoc').Value;
      DM1.cdsDetCanjeCxP.FieldByName('CPNoReg').Value  := DM1.cdsCanjeCxP.FieldByName('CPNoReg').Value;
      DM1.cdsDetCanjeCxP.FieldByName('TCanjeID').Value := DM1.cdsCanjeCxP.FieldByName('TCanjeID').Value;
      DM1.cdsDetCanjeCxP.FieldByName('CCPCanje').Value := DM1.cdsCanjeCxP.FieldByName('CCPCanje').Value;
      DM1.cdsDetCanjeCxP.FieldByName('CCPFCje').Value  := DM1.cdsCanjeCxP.FieldByName('CCPFCje').Value;
      DM1.cdsDetCanjeCxP.FieldByName('DocID2').Value   := '05';  // Orden de Pago
      DM1.cdsDetCanjeCxP.FieldByName('CPSerie2').Value := '000';
      DM1.cdsDetCanjeCxP.FieldByName('CPNoDoc2').Value := xDat.ECOPAGO ;
      DM1.cdsDetCanjeCxP.FieldByName('TMonID').Value   := DM1.cdsCanjeCxP.FieldByName('TMonID').Value;

      If DM1.cdsCanjeCxP.FieldByName('TMonID').Value=DM1.wTMonLoc then
      begin
         DM1.cdsDetCanjeCxP.FieldByName('DCDMoLoc').Value := DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPMoLoc').AsFloat,15,2);
         DM1.cdsDetCanjeCxP.FieldByName('DCDMoExt').Value := DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPMoLoc').AsFloat/DM1.cdsCanjeCxP.FieldByName('CCPTCDoc').AsFloat,15,2);
         end
      else
      begin
         DM1.cdsDetCanjeCxP.FieldByName('DCDMoExt').Value := DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPMoExt').AsFloat,15,2);
         DM1.cdsDetCanjeCxP.FieldByName('DCDMoLoc').Value := DM1.FRound(DM1.cdsCanjeCxP.FieldByName('CCPMoExt').AsFloat*DM1.cdsCanjeCxP.FieldByName('CCPTCDoc').AsFloat,15,2);
      end;

      DM1.cdsDetCanjeCxP.FieldByName('DCDUser').Value  := DM1.cdsCanjeCxP.FieldByName('CCPUser').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDFReg').Value  := DM1.cdsCanjeCxP.FieldByName('CCPFReg').Value;
      DM1.cdsDetCanjeCxP.FieldByName('DCDHReg').Value  := DM1.cdsCanjeCxP.FieldByName('CCPHReg').Value;
      DM1.cdsDetCanjeCxP.FieldByName('DCDAAAA').Value  := DM1.cdsCanjeCxP.FieldByName('CCPAnoC').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDMM').Value    := DM1.cdsCanjeCxP.FieldByName('CCPMM').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDDD').Value    := DM1.cdsCanjeCxP.FieldByName('CCPDD').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDTri').Value   := DM1.cdsCanjeCxP.FieldByName('CCPTri').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDSem').Value   := DM1.cdsCanjeCxP.FieldByName('CCPSem').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDSS').Value    := DM1.cdsCanjeCxP.FieldByName('CCPSS').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDAnoMM').Value := DM1.cdsCanjeCxP.FieldByName('CCPAnoMM').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDAATri').Value := DM1.cdsCanjeCxP.FieldByName('CCPAATri').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDAASem').Value := DM1.cdsCanjeCxP.FieldByName('CCPAASem').AsString;
      DM1.cdsDetCanjeCxP.FieldByName('DCDAASS').Value  := DM1.cdsCanjeCxP.FieldByName('CCPAASS').AsString;
      DM1.cdsCanjeCxP.Next;
   end;

   DM1.cdsDetCanjeCxP.First;
   DM1.cdsCanjeCxP.First;
   DM1.cdsCanjeCxP.EnableControls;

   DM1.cdsDetCanjeCxP.ApplyUpdates(0);
   DM1.cdsMovCxP.ApplyUpdates(0);
end;

procedure TFPagoProvX.ActualizaSaldosCaja;
begin
    if trim(xDat.CCBCO) <> '' then
    begin
       dm1.ActSdoTlfn( xDat.CIAID,xDat.BANCOID,xDat.CCBCO,
                      dm1.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                      StrtoDate(xDat.FECHATC) ) ;
       dm1.ActSdoMen( xDat.BANCOID,xDat.CCBCO,
                      dm1.cdsEgrCaja.fieldBYname('ECMTOORI').AsString,
                      StrtoDate(xDat.FECHATC) ) ;
    end ;
end;

function TFPagoProvX.FinalizadoOK: Boolean;
begin
    Result := xOK ;
end;

function TFpagoProvX.MuestraCancelacion(xCIAID, xECOPAGO: String): Boolean;
var
   xSQL : String ;
   xWhere : String ;
begin
      Result := False ;
      xWhere := 'ECOPAGO = '''+ xECOPAGO + ''' AND CIAID = ''' + xCIAID + '''' ;
      if dm1.RecuperarDatos('CAJA302','*',xWhere) then
      begin
         with dm1.cdsREc do
         begin
            xDat.CIAID      :=  FieldBYname('CIAID').AsString ;
            edtPeriodo.text :=  FieldBYname('ECANOMM').AsString ;
            dblcTDiario.text := FieldBYname('TDIARID').AsString ;
            dbeNOComp.text :=   FieldBYname('ECNOCOMP').AsString ;
            dblcTMon.Text :=    FieldBYname('TMONID').AsString ;
            //2305dbdtpFCanc.Text :=  FieldBYname('ECFCOMP').AsString ;
            dbeTCambio.Text :=    FieldBYname('ECTCAMB').AsString ;
            dbeLOte.text :=     FieldBYname('ECLOTE').AsString  ;
            dblcdCnp.text :=    FieldBYname('CPTOID').AsString  ;
            dbeGlosa.text :=    FieldBYname('ECGLOSA').AsString  ;
            DM1.RecuperarDatos('TGE104','TDIARDES','TDIARID = '''+dblcTDiario.text+'''') ;
            edtTDiario.text := FieldBYname('TDIARDES').AsString ;
            DM1.RecuperarDatos('TGE103','TMONABR','TMONID='''+ dblcTMon.Text + '''' ) ;
            edtTMon.text   := FieldBYname('TMONABR').AsString ;
         end ;
         ActivaBotones(pnlBotones,False ) ;
         pnlCabecera1.Enabled := False ;
         pnlDetalle.Enabled   := False ;
         pnlBotones.Enabled   := False ;
      end
      else
      begin
        ShowMessage('ERRor') ;
        Exit ;
      end ;

     // vhn 22/01/2001
     xSQL:='Select * from CAJA314 '
          +'Where CIAID='''   +xDat.CIAID      +''' and '
          +      'TDIARID=''' +dblcTDiario.Text+''' and '
          +      'ECANOMM=''' +edtPeriodo.Text +''' and '
          +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
     DM1.cdsDetFPago.Close;
     DM1.cdsDetFPago.DataRequest( xSQL );
     DM1.cdsDetFPago.Open;

      Result := true ;
end;

procedure TFpagoProvX.RecibirDatos(Datos: TspdDatPago);
begin
{
     with xDat do
     begin
         TMONID     :=  Datos.TMONID    ;
         TMONDES    :=  Datos.TMONDES   ;
         FECHATC    :=  Datos.FECHATC   ;
         ECTCAMB    :=  Datos.ECTCAMB   ;
         ECMTOORI   :=  Datos.ECMTOORI  ;
         ECLOTE     :=  Datos.ECLOTE    ;
         CPTOID     :=  Datos.CPTOID    ;
         ECGLOSA    :=  Datos.ECGLOSA   ;
         CIAID      :=  Datos.CIAID     ;
         CIADES     :=  Datos.CIADES    ;
         ECANOMM    :=  Datos.ECANOMM   ;
         ECNOCOMP   :=  Datos.ECNOCOMP  ;
         TDIARID    :=  Datos.TDIARID   ;
         TDIARDES   :=  Datos.TDIARDES  ;
         PROV       :=  Datos.PROV      ;
         PROVRUC    :=  Datos.PROVRUC   ;
         CLAUXID    :=  Datos.CLAUXID   ;
         ECOPAGO    :=  Datos.ECOPAGO   ;
         BANCOID    :=  Datos.BANCOID   ;
         CCBCO      :=  Datos.CCBCO     ;
     end ;
}     
     xDat := Datos ;
     Configura ;
end;

procedure TFpagoProvX.Configura;
begin
     Blanqueaeditsenform(self) ;
     dblcTMon.Text    := xDat.TMONID    ;
     edtTMon.Text     := xDat.TMONDES   ;
     dbeTCambio.Text  := xDat.ECTCAMB   ;
     edtPeriodo.text  := xDat.ECANOMM   ;
     dbeImporte.Text  := xDat.ECMTOORI  ;

     pnlCabecera1.enabled := True ;
     pnlDetalle.Enabled := True ;
     dbeImporte.Text := xDat.ECMTOORI ;
end;

procedure TFpagoProvX.dbeNoCompExit(Sender: TObject);
var
   xSQL : String ;
   xWhere : string ;
begin
    //** 04/07/2001 - pjsv
      xSQL:='Select * from CAJA302 '
           +'Where CIAID='''   +xDat.CIAID    +''' and '
           +      'ECANOMM=''' +edtPeriodo.Text +''' and '
           +      'TDIARID=''' +dblcTDiario.Text+''' and '
           +      'ECNOCOMP='''+dbeNoComp.Text  +''' ';
        DM1.cdsEgrCaja.Close;
        DM1.cdsEgrCaja.DataRequest( xSQL );
        DM1.cdsEgrCaja.Open;
    //**    

   dbeNoComp.text:=DM1.StrZero(dbeNoComp.text,DM1.cdsEgrCaja.FieldByName('ECNOCOMP').DisplayWidth);
   xWhere :=   ' CIAID ='          + ''''             + xDat.CIAID           +  ''''
             + ' AND TDIARID  =''' + dblcTDiario.Text + ''''
             + ' AND ECANOMM  =''' + xDat.ECANOMM     + ''''
             + ' AND ECNOCOMP =''' + dbeNoComp.Text   + '''' ;
   if DM1.DisplayDescrip('prvTGE','CAJA302','COUNT(*) TOTREG',xWhere,'TOTREG')>'0' then
   begin
      ShowMessage('El Comprobante Ya Existe') ;
      dbeNOComp.setfocus ;
   end
   else
   begin
      //Recuperar Datos de la forma de cobranza
      // vhn 23/01/2001
      xSQL:='Select * from CAJA314 '
           +'Where CIAID='''' and TDIARID='''' and '
           +      'ECANOMM='''' and ECNOCOMP='''' ';
      DM1.cdsDetFPago.Close;
      DM1.cdsDetFPago.DataRequest( xSQL );
      DM1.cdsDetFPago.Open;
   end ;

end;

procedure TFpagoProvX.dblcTDiarioExit(Sender: TObject);
var
   xWhere ,
   Tmp : String ;
begin
   xWhere:='TDIARID='''+dblcTDiario.text+'''';
   edtTDiario.Text:=DM1.DisplayDescrip('prvTGE','TGE104','TDIARDES', xWhere, 'TDIARDES' );

   if edtTDiario.Text<>'' then
   begin
      xWhere:='CIAID='''  +xDat.CIAID+''' AND ECANOMM='''+xDat.ECANOMM+''' AND '
             +'TDIARID='''+dblcTDiario.Text+'''';
      dbeNoComp.text:=DM1.UltimoNum('prvCaja','CAJA302','ECNOCOMP',xWhere);
      dbeNoComp.text:=DM1.StrZero( dbeNoComp.text,10 );
   end;
   
end;

procedure TFpagoProvX.z2bbtnContClick(Sender: TObject);
begin
   if DM1.cdsEgrCaja.FieldByName('ECEstado').Value='C' then
   begin
     if DM1.cdsEgrCaja.fieldbyname('FEXTCHQ').AsString = '1' then
     begin
        ShowMessage('No Puede Contabilizar este Movimiento ' + #13 +
                    'Pues se encuentra extornado') ;
        Exit ;
     end ;
     if MessageDlg('¿Contabilizar y Generar Asientos Automaticos?',mtConfirmation,
                  [mbYes, mbNo], 0)=mrYes then
     begin
       screen.Cursor := crHourGlass ;
       RecCptosDifC ;
       Contabiliza ;             // Realiza la generacion del Asiento

  		  ActualizaCNT311 (DM1.cdsEgrcaja.FieldByName('CIAID').AsString,
												 DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
												 DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
												 DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString);

        if SOLConta(DM1.cdsEgrCaja.FieldByName('CIAID').AsString,
                    DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
                    DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                    DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                    dm1.SRV_D, 'CCNA', DM1.wModulo, DM1.cdsCNT311, DM1.cdsNivel,
                    DM1.cdsResultSet, DM1.DCOM1, Self ) then
				begin

					 DM1.cdsEgrCaja.Edit ;
					 DM1.cdsEgrCaja.FieldByName('ECConta').AsString:='S';   //Establece como Contabilizado el flag
           DM1.cdsEgrCaja.FieldByName('ECESTADO').AsString:= 'C';
           DM1.cdsEgrCaja.FieldByName('ECUSER').Value     := DM1.wUsuario;
           DM1.cdsEgrCaja.FieldByName('ECFREG').Value     := DateS;
           DM1.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:= Time;
           if Copy(xRegAdicional,1,2)='1.' then
              DM1.cdsEgrCaja.FieldByName('ECPERREC').AsString:=xRegAdicional;

           xSQL:='Select * from CAJA302 '
                +'Where CIAID='''   +DM1.cdsEgrcaja.FieldByName('CIAID').AsString+''' and '
                +      'ECANOMM=''' +edtPeriodo.Text +''' and '
                +      'TDIARID=''' +dblcTDiario.Text+''' and '
                +      'ECNOCOMP='''+DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString+''' ';
					 DM1.cdsEgrCaja.DataRequest( xSQL );
					 dm1.AplicaDatos(DM1.cdsEgrCaja, 'EGRCAJA');

				end;

{       dm1.GeneraContabilidad(xDat.CIAID , dblcTDiario.Text ,edtPeriodo.Text , dbeNoComp.Text ,self, 'CXP' ) ;
       DM1.cdsEgrCaja.Edit ;
       DM1.cdsEgrCaja.FieldByName('ECConta').Value:='S';   //Establece como Contabilizado el flag
       DM1.cdsEgrCaja.ApplyUpdates(0);
       //0805
       DM1.cdsEgrCaja.Refresh ;
}       //
       z2bbtnCont.Enabled := False;
       lblEstado.Caption  :='Cancelado y Contab.' ;
       screen.Cursor := crDefault ;
     end;
   end
   else
   begin
       ShowMessage('Imposible Contabilizar');
   end;
end;

procedure TFPagoProvX.Contabiliza;
var
   xRegAct : TBookMark;
   xSQL    : String;
begin
    // GENERA EL REGISTRO "HABER"  desde datos de la tabla de cabecera
    // vhn 23/01/2001
    xsql:='DELETE FROM CAJA304 '
         +'WHERE CIAID='   +quotedstr(DM1.cdsEgrcaja.FieldByName('CIAID').AsString)   +' AND '
         +      'ECANOMM=' +quotedstr(DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString) +' AND '
         +      'TDIARID=' +quotedstr(DM1.cdsEgrCaja.FieldByName('TDIARID').AsString) +' AND '
         +      'ECNOCOMP='+quotedstr(DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString);
    try
       DM1.DCOM1.AppServer.EjecutaSQL(xSQL);
    except
    end;

    xSQL:='Select * from CAJA304 Where CIAID='''' and '
         +  'ECANOMM='''' and TDIARID='''' and ECNOCOMP='''' ';
    dm1.cdsCNTCaja.Close;
    dm1.cdsCNTCaja.DataRequest( xSQL );
    dm1.cdsCNTCaja.Open;

    xNReg:=0;

    DM1.cdsCntCaja.Insert;
    Contab_EgrCaja;

   // GENERA LOS REGISTROS DE "DEBE" Y LOS REGISTROS POR DIF. DE CAMBIO desde Docs Canje
    dm1.cdsCanjeCxP.DisableControls;
    xRegAct := dm1.cdsCanjeCxP.GetBookmark;
    dm1.cdsCanjeCxP.First ;
    While not dm1.cdsCanjeCxP.Eof do
    Begin
       DM1.cdsCntCaja.Insert;
       Contab_CanjeCxP;         // Aqui hay solo DEBE
       Contab_DifCamCanje;
       dm1.cdsCanjeCxP.Next;
    end;
    dm1.cdsCanjeCxP.GotoBookmark(xRegAct);
    dm1.cdsCanjeCxP.FreeBookmark(xRegAct);
    dm1.cdsCanjeCxP.EnableControls;

    //Actualizamos en la tabla de Contabilidad
    DM1.cdsCntCaja.ApplyUpdates(0);
end;


procedure TFpagoProvX.Contab_DifCamCanje;
var
    xDif_Camb : real;
begin
    // GENERA EL REGISTRO POR DIFERENCIA DE CAMBIO

    if dm1.cdsCanjeCxP.FieldByName('CCPTCDOC').Value <> dm1.cdsCanjeCxP.FieldByName('CCPTCCJE').Value then begin

       DM1.cdsCntCaja.Insert;

       dm1.cdsCntCaja.FieldByName('CIAID').Value   :=  dm1.cdsEgrCaja.FieldByName('CIAID').Value;
       dm1.cdsCntCaja.FieldByName('TDIARID').Value :=  dm1.cdsEgrCaja.FieldByName('TDIARID').Value;
       dm1.cdsCntCaja.FieldByName('ECANOMM').Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
       dm1.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  dm1.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
       dm1.cdsCntCaja.FieldByName('DOCID').Value   :=  dm1.cdsCanjeCxP.FieldByName('DOCID').Value;
       dm1.cdsCntCaja.FieldByName('DCSERIE').Value :=  dm1.cdsCanjeCxP.FieldByName('CPSERIE').Value;
       dm1.cdsCntCaja.FieldByName('DCNODOC').Value :=  dm1.cdsCanjeCxP.FieldByName('CPNODOC').Value;
       dm1.cdsCntCaja.FieldByName('ECFCOMP').Value :=  dm1.cdsEgrCaja.FieldByName('ECFCOMP').Value;
       dm1.cdsCntCaja.FieldByName('DCFEMIS').Value :=  dm1.cdsCanjeCxP.FieldByName('CPFEMIS').Value;
       dm1.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  dm1.cdsCanjeCxP.FieldByName('CPFVCMTO').Value;
       dm1.cdsCntCaja.FieldByName('CPTOID').Value  :=  dm1.cdsCanjeCxP.FieldByName('CPTOTOT').Value;
       dm1.cdsCntCaja.FieldByName('CUENTAID').Value:=  dm1.cdsCanjeCxP.FieldByName('CTATOTAL').Value;
       dm1.cdsCntCaja.FieldByName('CLAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
       dm1.cdsCntCaja.FieldByName('DCAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
       dm1.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  dm1.cdsCanjeCxP.FieldByName('CCPTCCJE').Value;
       dm1.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  dm1.cdsCanjeCxP.FieldByName('CCPTCDOC').Value;
       dm1.cdsCntCaja.FieldByName('DCMM').Value    :=  dm1.cdsCanjeCxP.FieldByName('CCPMM').Value;
       dm1.cdsCntCaja.FieldByName('DCDD').Value    :=  dm1.cdsCanjeCxP.FieldByName('CCPDD').Value;
       dm1.cdsCntCaja.FieldByName('DCSS').Value    :=  dm1.cdsCanjeCxP.FieldByName('CCPSS').Value;
       dm1.cdsCntCaja.FieldByName('DCSEM').Value   :=  dm1.cdsCanjeCxP.FieldByName('CCPSEM').Value;
       dm1.cdsCntCaja.FieldByName('DCTRI').Value   :=  dm1.cdsCanjeCxP.FieldByName('CCPTRI').Value;
       dm1.cdsCntCaja.FieldByName('DCAASS').Value  :=  dm1.cdsCanjeCxP.FieldByName('CCPAASS').Value;
       dm1.cdsCntCaja.FieldByName('DCAASEM').Value :=  dm1.cdsCanjeCxP.FieldByName('CCPAASEM').Value;
       dm1.cdsCntCaja.FieldByName('DCAATRI').Value :=  dm1.cdsCanjeCxP.FieldByName('CCPAATRI').Value;

       dm1.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
       dm1.cdsCntCaja.FieldByName('DCANO').Value   :=  dm1.cdsCanjeCxP.FieldByName('CCPANOC').Value;
       xNReg:=xNReg+1;
       DM1.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

       if dm1.cdsCanjeCxP.FieldByName('TMONID').Value=dm1.wtMonLoc then
       begin   //Provision en Mon.Local
             xDif_Camb:= abs(dm1.cdsCanjeCxP.FieldByName('CCPMOLOC').Value / dm1.cdsCanjeCxP.FieldByName('CCPTCDOC').Value -
                             dm1.cdsCanjeCxP.FieldByName('CCPMOLOC').Value / dm1.cdsCanjeCxP.FieldByName('CCPTCCJE').Value);//En Mon.Ext.
             dm1.cdsCntCaja.FieldByName('DCMTOEXT').Value := xDif_Camb;
             dm1.cdsCntCaja.FieldByName('TMONID').Value   :=  dm1.wtMonExt;

             if dm1.cdsCanjeCxP.FieldByName('CCPTCDOC').Value > dm1.cdsCanjeCxP.FieldByName('CCPTCCJE').Value then
                dm1.cdsCntCaja.FieldByName('DCDH').Value := 'D'
             else
                dm1.cdsCntCaja.FieldByName('DCDH').Value := 'H';
       end
       else
       begin                                            //Provision en Mon.Ext.
             xDif_Camb:= abs(dm1.cdsCanjeCxP.FieldByName('CCPMOEXT').Value * dm1.cdsCanjeCxP.FieldByName('CCPTCDOC').Value -
                             dm1.cdsCanjeCxP.FieldByName('CCPMOEXT').Value * dm1.cdsCanjeCxP.FieldByName('CCPTCCJE').Value);//En Mon.Local
             dm1.cdsCntCaja.FieldByName('DCMTOLO').Value := xDif_Camb;
             dm1.cdsCntCaja.FieldByName('TMONID').Value  := dm1.wtMonLoc;

             if dm1.cdsRegCxP.FieldByName('DETCDOC').Value > dm1.cdsCanjeCxP.FieldByName('CCPTCCJE').Value then
                dm1.cdsCntCaja.FieldByName('DCDH').Value := 'H'
             else
                dm1.cdsCntCaja.FieldByName('DCDH').Value := 'D';
       end;
       //0706
       if dm1.cdsCntCaja.FieldByName('DCDH').Value = 'D' then
       begin
          dm1.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoPer;
          dm1.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaPer;
       end
       else
       begin
          dm1.cdsCntCaja.FieldByName('CPTOID').Value  :=  wCptoGan;
          dm1.cdsCntCaja.FieldByName('CUENTAID').Value:=  wCtaGan;
       end;
    end
end;

procedure TFpagoProvX.Contab_EgrCaja;
begin
    dm1.cdsCntCaja.FieldByName('CIAID').Value   :=  dm1.cdsEgrcaja.FieldByName('CIAID').Value;
    dm1.cdsCntCaja.FieldByName('TDIARID').Value :=  dm1.cdsEgrCaja.FieldByName('TDIARID').Value;
    dm1.cdsCntCaja.FieldByName('ECANOMM').Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
    dm1.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  dm1.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
    dm1.cdsCntCaja.FieldByName('DCLOTE').Value  :=  dm1.cdsEgrCaja.FieldByName('ECLOTE').Value;
    dm1.cdsCntCaja.FieldByName('DOCID').Value   :=  dm1.cdsEgrCaja.FieldByName('DOCID').Value;
    dm1.cdsCntCaja.FieldByName('DCNODOC').Value :=  dm1.cdsEgrCaja.FieldByName('ECNODOC').Value;
    dm1.cdsCntCaja.FieldByName('ECFCOMP').Value :=  dm1.cdsEgrCaja.FieldByName('ECFCOMP').Value;
    dm1.cdsCntCaja.FieldByName('CPTOID').Value  :=  dm1.cdsEgrCaja.FieldByName('CPTOID').Value;
    dm1.cdsCntCaja.FieldByName('CUENTAID').Value:=  dm1.cdsEgrCaja.FieldByName('CUENTAID').Value;
    dm1.cdsCntCaja.FieldByName('DCDH').Value    :=  'H';
    dm1.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  dm1.cdsEgrCaja.FieldByName('ECTCAMB').Value;
    dm1.cdsCntCaja.FieldByName('TMONID').Value  :=  dm1.cdsEgrCaja.FieldByName('TMONID').Value;
    dm1.cdsCntCaja.FieldByName('DCMTOORI').Value:=  dm1.cdsEgrCaja.FieldByName('ECMTOORI').Value;
    dm1.cdsCntCaja.FieldByName('DCMTOLO').Value :=  dm1.cdsEgrCaja.FieldByName('ECMTOLOC').Value;
    dm1.cdsCntCaja.FieldByName('DCMTOEXT').Value:=  dm1.cdsEgrCaja.FieldByName('ECMTOEXT').Value;
    dm1.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
    dm1.cdsCntCaja.FieldByName('DCUSER').Value  :=  DM1.wUsuario;
    dm1.cdsCntCaja.FieldByName('DCFREG').Value  :=  Date;
    dm1.cdsCntCaja.FieldByName('DCHREG').Value  :=  Time;
    dm1.cdsCntCaja.FieldByName('DCANO').Value   :=  dm1.cdsEgrCaja.FieldByName('ECANO').Value;
    dm1.cdsCntCaja.FieldByName('DCMM').Value    :=  dm1.cdsEgrCaja.FieldByName('ECMM').Value;
    dm1.cdsCntCaja.FieldByName('DCDD').Value    :=  dm1.cdsEgrCaja.FieldByName('ECDD').Value;
    dm1.cdsCntCaja.FieldByName('DCSS').Value    :=  dm1.cdsEgrCaja.FieldByName('ECSS').Value;
    dm1.cdsCntCaja.FieldByName('DCSEM').Value   :=  dm1.cdsEgrCaja.FieldByName('ECSEM').Value;
    dm1.cdsCntCaja.FieldByName('DCTRI').Value   :=  dm1.cdsEgrCaja.FieldByName('ECTRI').Value;
    dm1.cdsCntCaja.FieldByName('DCAASS').Value  :=  dm1.cdsEgrCaja.FieldByName('ECAASS').Value;
    dm1.cdsCntCaja.FieldByName('DCAASEM').Value :=  dm1.cdsEgrCaja.FieldByName('ECAASEM').Value;
    dm1.cdsCntCaja.FieldByName('DCAATRI').Value :=  dm1.cdsEgrCaja.FieldByName('ECAATRI').Value;
    dm1.cdsCntCaja.FieldByName('DCGLOSA').AsString := dm1.cdsEgrCaja.fieldBYName('ECGLOSA').AsString ;
    dm1.cdsCntCaja.FieldByName('DCTCAMPA').AsString := dbeTCambio.Text ;
    dm1.cdsCntCaja.FieldByName('FCAB').AsString := '1' ;
    xNReg:=xNReg+1;
    DM1.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;

end;

procedure TFpagoProvX.Contab_CanjeCxP;
begin
    dm1.cdsCntCaja.FieldByName('CIAID').Value   :=  dm1.cdsEgrCaja.FieldByName('CIAID').Value;
    dm1.cdsCntCaja.FieldByName('TDIARID').Value :=  dm1.cdsEgrCaja.FieldByName('TDIARID').Value;
    dm1.cdsCntCaja.FieldByName('ECANOMM').Value :=  dm1.cdsEgrCaja.FieldByName('ECANOMM').Value;
    dm1.cdsCntCaja.FieldByName('ECNOCOMP').Value:=  dm1.cdsEgrCaja.FieldByName('ECNOCOMP').Value;
    dm1.cdsCntCaja.FieldByName('DOCID').Value   :=  dm1.cdsCanjeCxP.FieldByName('DOCID').Value;
    dm1.cdsCntCaja.FieldByName('DCSERIE').Value :=  dm1.cdsCanjeCxP.FieldByName('CPSERIE').Value;
    dm1.cdsCntCaja.FieldByName('DCNODOC').Value :=  dm1.cdsCanjeCxP.FieldByName('CPNODOC').Value;
    dm1.cdsCntCaja.FieldByName('ECFCOMP').Value :=  dm1.cdsEgrCaja.FieldByName('ECFCOMP').Value;
    dm1.cdsCntCaja.FieldByName('DCFEMIS').Value :=  dm1.cdsCanjeCxP.FieldByName('CPFEMIS').Value;
    dm1.cdsCntCaja.FieldByName('DCFVCMTO').Value:=  dm1.cdsCanjeCxP.FieldByName('CPFVCMTO').Value;
    dm1.cdsCntCaja.FieldByName('CPTOID').Value  :=  dm1.cdsCanjeCxP.FieldByName('CPTOTOT').Value;
    dm1.cdsCntCaja.FieldByName('CUENTAID').Value:=  dm1.cdsCanjeCxP.FieldByName('CTATOTAL').Value;
    dm1.cdsCntCaja.FieldByName('CLAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('CLAUXID').Value; //Aqui se toma de la cabecera
    dm1.cdsCntCaja.FieldByName('DCAUXID').Value :=  dm1.cdsEgrCaja.FieldByName('PROV').Value;    //Aqui se toma de la cabecera
    //dm1.cdsCntCajaCCOSID.Value  :=  dm1.cdsCanjeCxP.FieldByName('CCOSID.Value;
    dm1.cdsCntCaja.FieldByName('DCDH').Value    :=  'D';
    dm1.cdsCntCaja.FieldByName('DCTCAMPA').Value:=  dm1.cdsCanjeCxP.FieldByName('CCPTCCJE').Value;
    dm1.cdsCntCaja.FieldByName('DCTCAMPR').Value:=  dm1.cdsCanjeCxP.FieldByName('CCPTCDOC').Value;
    dm1.cdsCntCaja.FieldByName('TMONID').Value  :=  dm1.cdsCanjeCxP.FieldByName('TMONID').Value;
    dm1.cdsCntCaja.FieldByName('DCMTOORI').Value:=  dm1.cdsCanjeCxP.FieldByName('CCPMOORI').Value;
    if dm1.cdsCanjeCxP.FieldByName('TMONID').Value = dm1.wtMonLoc then
    begin
       dm1.cdsCntCaja.FieldByName('DCMTOLO').Value := dm1.cdsCanjeCxP.FieldByName('CCPMOLOC').Value;
       dm1.cdsCntCaja.FieldByName('DCMTOEXT').Value:= dm1.cdsCanjeCxP.FieldByName('CCPMOLOC').Value / dm1.cdsCanjeCxP.FieldByName('CCPTCCJE').Value;
    end
    else
    begin
       dm1.cdsCntCaja.FieldByName('DCMTOEXT').Value:= dm1.cdsCanjeCxP.FieldByName('CCPMOEXT').Value;
       dm1.cdsCntCaja.FieldByName('DCMTOLO').Value := dm1.cdsCanjeCxP.FieldByName('CCPMOEXT').Value * dm1.cdsCanjeCxP.FieldByName('CCPTCCJE').Value;
    end;

    dm1.cdsCntCaja.FieldByName('DCFLACDR').Value:=  'S';   //Registro ya cuadrado
    dm1.cdsCntCaja.FieldByName('DCANO').Value   :=  dm1.cdsCanjeCxP.FieldByName('CCPANOC').Value;
    dm1.cdsCntCaja.FieldByName('DCMM').Value    :=  dm1.cdsCanjeCxP.FieldByName('CCPMM').Value;
    dm1.cdsCntCaja.FieldByName('DCDD').Value    :=  dm1.cdsCanjeCxP.FieldByName('CCPDD').Value;
    dm1.cdsCntCaja.FieldByName('DCSS').Value    :=  dm1.cdsCanjeCxP.FieldByName('CCPSS').Value;
    dm1.cdsCntCaja.FieldByName('DCSEM').Value   :=  dm1.cdsCanjeCxP.FieldByName('CCPSEM').Value;
    dm1.cdsCntCaja.FieldByName('DCTRI').Value   :=  dm1.cdsCanjeCxP.FieldByName('CCPTRI').Value;
    dm1.cdsCntCaja.FieldByName('DCAASS').Value  :=  dm1.cdsCanjeCxP.FieldByName('CCPAASS').Value;
    dm1.cdsCntCaja.FieldByName('DCAASEM').Value :=  dm1.cdsCanjeCxP.FieldByName('CCPAASEM').Value;
    dm1.cdsCntCaja.FieldByName('DCAATRI').Value :=  dm1.cdsCanjeCxP.FieldByName('CCPAATRI').Value;
    xNReg:=xNReg+1;
    DM1.cdsCntCaja.fieldbyName('NREG').AsInteger  := xNReg;
end;

procedure TFpagoProvX.FormCreate(Sender: TObject);
begin
    dm1.ASignaTipoDiario(dblcTDiario,self) ;
end;

procedure TFpagoProvX.RecCptosDifC;
begin

    if trim(xDat.CCBCO) = '' then
    begin
       if not dm1.RecuperarDatos('TGE105','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP','BANCOID=''' + FPagosCaja.dblcBANCO.Text + '''' )  then
          Raise exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio') ;
    end
    else
    begin
       if not dm1.RecuperarDatos('TGE106','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP','BANCOID=''' + FPagosCaja.dblcBANCO.Text +
                                 ''' AND CCBCOID=''' + FPagosCaja.dblcCCBCO.Text + '''' )  then
          Raise exception.create('No se puede Contabilizar '+#13+
                'Falta Definir las Cuentas de Dif. de Cambio') ;
    end ;
    wCptoGan  := dm1.cdsRec.fieldbyname('CPTODIFG').AsString ;
    wCptoPer  := dm1.cdsRec.fieldbyname('CPTODIFP').AsString ;
    wCtaGan   := dm1.cdsRec.fieldbyname('CTADIFG').AsString ;
    wCtaPer   := dm1.cdsRec.fieldbyname('CTADIFP').AsString ;
end;

procedure TFpagoProvX.dblcTDocExit(Sender: TObject);
begin
  edtTDoc.text := dm1.DisplayDescrip('prvTGE','TGE110','DOCDES','DOCID='+quotedstr(dblcTDoc.text),'DOCDES');
end;

procedure TFpagoProvX.FormActivate(Sender: TObject);
begin
   dbeLote.Text    :='0000';
   dblcTDiario.Text:=DM1.cdsPagoCxP.FieldByName('CCBCOVOUCH').AsString;
   dblcTDiarioExit( Sender );
end;

procedure TFpagoProvX.dblcdCnpExit(Sender: TObject);
var
 xSql : string;
begin
   xSql := 'CPTOID='+quotedstr(dblcdCnp.Text);
   dbeGlosa.text := DM1.DisplayDescrip('prvCnpEgr','CAJA201','CPTODES',xSql,'CPTODES');
end;

procedure TFpagoProvX.z2bbtnImprimeClick(Sender: TObject);
begin
   if DM1.cdsEgrCaja.FieldByName('ECCONTA').AsString <> 'S' THEN
	 begin
   		RecCptosDifC ;
		  Contabiliza;

      ActualizaCNT311( DM1.cdsEgrcaja.FieldByName('CIAID').AsString,
                       DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
                       DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                       DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString );

      if SOLConta(DM1.cdsEgrCaja.FieldByName('CIAID').AsString,
                  DM1.cdsEgrCaja.FieldByName('TDIARID').AsString,
                  DM1.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                  DM1.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                  dm1.SRV_D, 'PCNA', DM1.wModulo, DM1.cdsCNT311, DM1.cdsNivel,
                  DM1.cdsResultSet, DM1.DCOM1, Self ) then
         ImprimeVoucher( 'CNT311', DM1.cdsEgrCaja.FieldByName('CIAID').AsString, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
 	 end;

   if DM1.cdsEgrCaja.FieldByName('ECCONTA').AsString = 'S' THEN
	 begin
      ImprimeVoucher( 'CNT301', DM1.cdsEgrCaja.FieldByName('CIAID').AsString, edtPeriodo.Text, dblcTDiario.Text, dbeNoComp.Text, dbeGlosa.Text );
   end;

end;

end.



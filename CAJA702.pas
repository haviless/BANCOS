
unit Caja702;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls,db, DBClient, wwclient,Mant, StdCtrls, Mask, oaContabiliza;

type
  TFToolDocProv = class(TForm)
    PnlComprobante: TPanel;
    sbtABl: TSpeedButton;
    SpeedButton3: TSpeedButton;
    sbtCBl: TSpeedButton;
    bbtnAsiento: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbtABlClick(Sender: TObject);
    Function AsientoCuadra: Boolean;
    procedure sbtCBlClick(Sender: TObject);
    procedure bbtnAsientoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    MProv    : TMant;

    //Agregado por Ana
    xCont : String;
    cdsGComprobante :  TwwClientDataSet;
    procedure AsientosAdicionales( cRegAdicional : String );

  public
    { Public declarations }
    xToolCia,xTooldiario,xToolAnomm,xToolPeriodo,xToolEstado : String;
    Function  PeriodoCuadra:Boolean;
  end;

var
  FToolDocProv: TFToolDocProv;
   xSqlMant: STring;

implementation

uses CajaDM, Caja252, Caja201, Caja228, Caja247, oaTE2000;

{$R *.DFM}

procedure TFToolDocProv.SpeedButton1Click(Sender: TObject);
begin
  FImpBloComp:=TFImpBloComp.Create(Self);
  try
    FImpBloComp.ShowModal;
  finally
    FImpBloComp.free;
  end;

end;

procedure TFToolDocProv.SpeedButton2Click(Sender: TObject);
begin

  FImpBloComp:=TFImpBloComp.Create(Self);
  try
    FImpBloComp.ShowModal;
  finally
    FImpBloComp.free;
  end;

end;

Function TFToolDocProv.PeriodoCuadra:Boolean;
var
  xA,xR,xI  : integer;
  P,E,T  : string;
begin
    result := False;

    xA:=0 ;  xR:=0 ;  xI:=0 ;
    cdsGComprobante.First ;
    P:= cdsGComprobante.FieldByName('CNTANOMM').AsString ;
    E:= cdsGComprobante.FieldByName('CNTESTADO').AsString ;
    while not  cdsGComprobante.EOF do
    begin
      T := cdsGComprobante.FieldByName('CNTANOMM').AsString;

      if (P = T) and (E = 'I') then //Si periodos son iguales
         xA := xA+1
      else
        if P <> T  then  //  Compara si los periodos son iguales
        begin
           Showmessage(' Debe Aceptar solo Registros con periodos iguales');
           xR := xR+1;
           result := False;
           Exit;
        end ;

        // validación de  los estados
        if  (E ='P') or (E ='C') then //Pendiente  o Contabilizado
        begin
           Showmessage(' Debe Aceptar solo Incompletos');
           xI := xI+1;
           result := False;
           Exit;
        end;

    cdsGComprobante.Next;
    end;
    if (xR =0) or(xI=0) then
       result := true;
 end;

Function TFToolDocProv.AsientoCuadra:Boolean;
var
   xTotDebe, xTotHaber : DOUBLE;
begin
   Result    := False;
   xTotDebe  := 0;
   xTotHaber := 0;
   DMTE.cdsMovCnt1.DisableControls;
   DMTE.cdsMovCnt1.First ;
   while not DMTE.cdsMovCnt1.eof do begin
      if DMTE.cdsMovCnt1.FieldByName('CNTDH').AsString='D' then
         xTotDebe  := xTotDebe  + DMTE.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat
      else begin
         xTotHaber := xTotHaber + DMTE.cdsMovCnt1.FieldByName('CNTMTOORI').AsFloat;
      end;
      DMTE.cdsMovCnt1.Next;
   end;
   DMTE.cdsMovCnt1.First;
   DMTE.cdsMovCnt1.EnableControls;
   if DMTE.FRound(xTotDebe,15,2)=DMTE.FRound(xTotHaber,15,2) then Result := True;
end;


procedure TFToolDocProv.sbtABlClick(Sender: TObject);
var
    P,E,T ,xFiltro, xtmonid:  string ;
    xClAuxId, xProv        :  string ;
    xCPMtoLoc,xCPMtoExt    :  double ;
    xCia,xPer,xDiar,xNReg,xcompro  :  String ;
    xSqlMant : STRING;

begin
{   if MessageDlg('Aceptar Comprobantes'+chr(13)+chr(13)+
                 '  ¿ Esta Seguro ?  ',mtConfirmation, [mbYes, mbNo], 0)=mrNo then exit;
   xSqlMant := FPrincipal.GComprobante.FMant.SQL;

   If pos('CIAID=',xSqlMant) > 0 then
    xToolCia     := copy(xSqlMant,pos('CIAID=',xSqlMant)+7,2);
   If pos('TDIARID=',xSqlMant) > 0 then
    xTooldiario := copy(xSqlMant,pos('TDIARID=',xSqlMant)+9,2);
   If pos('CNTANOMM=',xSqlMant) > 0 then
    xToolPeriodo := copy(xSqlMant,pos('CNTANOMM=',xSqlMant)+10,6);
   If pos('CNTESTADO=',xSqlMant) > 0 then
    xToolEstado := copy(xSqlMant,pos('CNTESTADO=',xSqlMant)+9,2);

   If (xToolCIa = '') then
    begin
     raise exception.Create('Debe de Filtrar también por Compañia');
    end;

   If (xTooldiario = '') then
    begin
     raise exception.Create('Debe de Filtrar también por Tipo de Diario');
    end;

   If (xToolPeriodo = '') then
    begin
     raise exception.Create('Debe de Filtrar también por Periodo');
    end;

   If (xToolEstado = '') then
    begin
     raise exception.Create('Debe de Filtrar también por Estado');
    end;


   try
      screen.Cursor := crHOURGLASS;
      if FPrincipal.xTipocomprobante='P' then
      begin
         cdsGComprobante:=  FPrincipal.GComprobante.FMant.cds2 ; //Provisiones
         MProv   :=  FPrincipal.GComprobante;
      end;

      If not PeriodoCuadra then

      If MessageDlg( 'Aceptara Registros Diferentes e Incompletos' + chr(13)+
                  '          ¿Esta Seguro?  ',mtConfirmation,[mbYes, mbNo],0)=mrNo
      then exit;

//      cdsGComprobante.disablecontrols;
      cdsGComprobante.Close;
      cdsGComprobante.Open;

      if cdsGComprobante.RecordCount=0 then
      begin
        cdsGComprobante.EnableControls;
        showmessage('No existen Registros');
        Exit;
      end;

      cdsGComprobante.First;

      P:= cdsGComprobante.FieldByName('CNTANOMM').AsString;

      while not  cdsGComprobante.EOF do
      begin
         T:= cdsGComprobante.FieldByName('CNTANOMM').AsString;
         if not(cdsGComprobante.FieldByName('CNTDEBEMN').asfloat=cdsGComprobante.FieldByName('CNTDEBEMN').asfloat) then
         begin
            ShowMessage(
              'Error:  Asiento NO Cuadra' + #13 +
              'Compañía  : ' +  cdsGComprobante.FieldByName('CIAID').asstring   +#13+
              'T. Diario : ' +  cdsGComprobante.FieldByName('TDIARID').asstring +#13+
              'Periodo   : ' +  cdsGComprobante.FieldByName('CPANOMES').asstring+#13+
              'Registro  : ' +  cdsGComprobante.FieldByName('CPNOREG').asstring ) ;
            cdsGComprobante.Next ;
            continue      ;
         end;

         E:= cdsGComprobante.FieldByName('CNTESTADO').AsString;

         if (P = T) and (E = 'I') then
         begin
            xCont     := 'S';
            xCia      := cdsGComprobante.FieldByName('CIAID').value;
            xPer      := cdsGComprobante.FieldByName('CNTANOMM').value;
            xDiar     := cdsGComprobante.FieldByName('TDIARID').value;
            xCompro     := cdsGComprobante.FieldByName('CNTCOMPROB').asstring;

            xtmonid   := cdsGComprobante.FieldByName('TMONID').value;
            //
            xFiltro := 'CIAID='   +''''+xCia    +''''+' and '+
                       'TDIARID=' +''''+xDiar+''''+' and '+
                       'CNTANOMM='+''''+xPer+''''+' and '+
                       'CNTESTADO=''I'' AND CNTCOMPROB='''+xcompro+'''';


            DMTE.Filtracds( DMTE.CdsMovCNT1, 'Select * from CNT301 Where '+xFiltro );
            //
            cdsGComprobante.Edit;
            cdsGComprobante.FieldByname('CNTESTADO').Value:='P';
            DMTE.cdsMovCnt1.First;
            while not DMTE.cdsMovCnt1.EOF do begin
               DMTE.cdsMovCnt1.Edit;
               DMTE.cdsMovCnt1.FieldByName('CNTESTADO').AsString:= 'P';
               cdsPost( DMTE.cdsMovCnt1 );
               DMTE.cdsMovCnt1.Next;
            end;
            //DMTE.AplicaDatos(DMTE.cdsMovCnt1,'MOVCNT1');
            DMTE.ControlTran(0);
            cdsGComprobante.NEXT;

         END;
      end;
   finally
      DMTE.controltran(0);
      ShowMessage('Proceso Finalizado') ;
      FPrincipal.GComprobante.RefreshFilter;
      cdsGComprobante.enablecontrols;
      screen.Cursor := crDEFAULT;
  end;}
end;

procedure TFToolDocProv.sbtCBlClick(Sender: TObject);
var
 xRegistros, xTotReg, xTotCon : Integer;
 xZ : Integer;
 xSql, xMest : String;
begin
   if MessageDlg('Contabilizar Comprobantes'+chr(13)+chr(13)+
                 '  ¿ Esta Seguro ?  ',mtConfirmation, [mbYes, mbNo], 0)=mrNo then exit;

   if DMTE.cdsEgrcaja.FieldByName('EC_PROCE').AsString='1' then
      xSqlMant := FRegistro.xFiltroEgr.FMant.SQL;
   if DMTE.cdsEgrcaja.FieldByName('EC_PROCE').AsString='B' then
      xSqlMant := FRegistro.xFiltroPProv.FMant.SQL;
   if DMTE.cdsEgrcaja.FieldByName('EC_PROCE').AsString='3' then
      xSqlMant := FRegistro.xFiltroPagoProvBco.FMant.SQL;


   If pos('CIAID=',xSqlMant) > 0 then
      xToolCia     := copy(xSqlMant,pos('CIAID=',xSqlMant)+7,2);

   If pos('ECANOMM=',xSqlMant) > 0 then
      xToolAnomm   := copy(xSqlMant,pos('CNTANOMM=',xSqlMant)+10,6);

   If pos('TDIARID=',xSqlMant) > 0 then
      xTooldiario  := copy(xSqlMant,pos('TDIARID=',xSqlMant)+9,2);

   If (xToolCIa = '') then
   begin
      showMessage('Debe de Filtrar también por Compañia');
      exit;
   end;
   If (xToolAnomm = '') then
   begin
      showMessage('Debe de Filtrar también por Periodo');
      exit;
   end;

   if DMTE.cdsEgrcaja.FieldByName('CCBCOID').AsString = '' then
   begin
      if not DMTE.RecuperarDatos('TGE105','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP','BANCOID='''+DMTE.cdsEgrcaja.FieldByName('BANCOID').AsString+'''') then
         Raise exception.create('No se puede Contabilizar '+#13+'Falta Definir las Cuentas de Dif. de Cambio') ;
   end
   else begin
      if not DMTE.RecuperarDatos('TGE106','CPTODIFG,CPTODIFP,CTADIFG,CTADIFP','BANCOID='''+DMTE.cdsEgrcaja.FieldByName('BANCOID').AsString+
                                 ''' AND CCBCOID='''+ DMTE.cdsEgrcaja.FieldByName('CCBCOID').AsString+'''' )  then
         Raise exception.create('No se puede Contabilizar '+#13+'Falta Definir las Cuentas de Dif. de Cambio') ;
   end ;

   if DMTE.cdsEgrcaja.FieldByName('EC_PROCE').AsString='1' then begin
      FEgresoCaja.wCptoGan:= DMTE.cdsRec.fieldbyname('CPTODIFG').AsString ;
      FEgresoCaja.wCptoPer:= DMTE.cdsRec.fieldbyname('CPTODIFP').AsString ;
      FEgresoCaja.wCtaGan := DMTE.cdsRec.fieldbyname('CTADIFG').AsString ;
      FEgresoCaja.wCtaPer := DMTE.cdsRec.fieldbyname('CTADIFP').AsString ;
   end;
   if DMTE.cdsEgrcaja.FieldByName('EC_PROCE').AsString='B' then begin
      FPagoFacturas.wCptoGan:= DMTE.cdsRec.fieldbyname('CPTODIFG').AsString ;
      FPagoFacturas.wCptoPer:= DMTE.cdsRec.fieldbyname('CPTODIFP').AsString ;
      FPagoFacturas.wCtaGan := DMTE.cdsRec.fieldbyname('CTADIFG').AsString ;
      FPagoFacturas.wCtaPer := DMTE.cdsRec.fieldbyname('CTADIFP').AsString ;
   end;
   if DMTE.cdsEgrcaja.FieldByName('EC_PROCE').AsString='3' then begin
      FPagoProvBco.wCptoGan:= DMTE.cdsRec.fieldbyname('CPTODIFG').AsString ;
      FPagoProvBco.wCptoPer:= DMTE.cdsRec.fieldbyname('CPTODIFP').AsString ;
      FPagoProvBco.wCtaGan := DMTE.cdsRec.fieldbyname('CTADIFG').AsString ;
      FPagoProvBco.wCtaPer := DMTE.cdsRec.fieldbyname('CTADIFP').AsString ;
   end;

   Screen.Cursor := crHourglass ;

   xTotReg:=0;
   xTotCon:=0;
   DMTE.cdsEgrCaja.First;
   while not DMTE.cdsEgrCaja.Eof do begin

      xTotReg:=xTotReg+1;
   	if ( DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString<>'S' ) and
   	   ( DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString='C' ) and
    	   ( DMTE.cdsEgrCaja.fieldbyname('FEXTCHQ').AsString =''  ) then
   	begin

         xSQL:='Select * from CAJA301 '
              +'Where CIAID='''   +DMTE.cdsEgrcaja.FieldByName('CIAID').AsString   +''' and '
              +      'TDIARID=''' +DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString +''' and '
              +      'ECANOMM=''' +DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString +''' and '
              +      'ECNOCOMP='''+DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' ';
         DMTE.cdsRegCxP.Close;
         DMTE.cdsRegCxP.DataRequest( xSQL );
         DMTE.cdsRegCxP.Open;

         xSQL:='Select * from CAJA303 '
              +'Where CIAID='''   +DMTE.cdsEgrcaja.FieldByName('CIAID').AsString   +''' and '
              +      'TDIARID=''' +DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString +''' and '
              +      'ECANOMM=''' +DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString +''' and '
              +      'ECNOCOMP='''+DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' ';
         DMTE.cdsDocPago.Close;
         DMTE.cdsDocPago.DataRequest( xSQL );
         DMTE.cdsDocPago.Open;

         if DMTE.cdsEgrcaja.FieldByName('EC_PROCE').AsString='1' then
            FEgresoCaja.Contabiliza;
         if DMTE.cdsEgrcaja.FieldByName('EC_PROCE').AsString='B' then
            FPagoFacturas.Contabiliza;
         if DMTE.cdsEgrcaja.FieldByName('EC_PROCE').AsString='3' then
            FPagoProvBco.Contabiliza;


         ActualizaCNT311 (DMTE.cdsEgrcaja.FieldByName('CIAID').AsString,
                          DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                          DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                          DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString);

         if SOLConta(DMTE.cdsEgrCaja.FieldByName('CIAID').AsString,
                     DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString,
                     DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString,
                     DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString,
                     DMTE.SRV_D, 'CCNA', DMTE.wModulo, DMTE.cdsCNT311, DMTE.cdsNivel,
                     DMTE.cdsResultSet, DMTE.DCOM1, Self ) then
         begin
				DMTE.cdsEgrCaja.Edit ;
				DMTE.cdsEgrCaja.FieldByName('ECConta').AsString :='S';   //Establece como Contabilizado el flag
            DMTE.cdsEgrCaja.FieldByName('ECESTADO').AsString:='C';
            DMTE.cdsEgrCaja.FieldByName('ECUSER').Value     :=DMTE.wUsuario;
            DMTE.cdsEgrCaja.FieldByName('ECFREG').Value     :=DateS;
            DMTE.cdsEgrCaja.FieldByName('ECHREG').AsDateTime:=Time;
            if Copy(xRegAdicional,1,2)='1.' then
               DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString:=xRegAdicional;

            xSQL:='Select * from CAJA302 '
                 +'Where CIAID='''   +DMTE.cdsEgrCaja.FieldByName('CIAID').AsString   +''' and '
                 +      'TDIARID=''' +DMTE.cdsEgrCaja.FieldByName('TDIARID').AsString +''' and '
                 +      'ECANOMM=''' +DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString +''' and '
                 +      'ECNOCOMP='''+DMTE.cdsEgrCaja.FieldByName('ECNOCOMP').AsString+''' ';
				DMTE.cdsEgrCaja.DataRequest( xSQL );
				DMTE.AplicaDatos(DMTE.cdsEgrCaja, 'EGRCAJA');

            if Copy(xRegAdicional,1,2)='1.' then
               DMTE.AsientosAdicionales( xRegAdicional );

            xTotCon:=xTotCon+1;
			end;
    	end;

      DMTE.cdsEgrCaja.Next;

   end;

   screen.Cursor := crDEFAULT;
   ShowMessage( 'Contabilización Terminada'+#13+#13+
                'Total Registros Leidos    : '+IntToStr( xTotReg)+#13+
                'Registros Contabilizados : ' +IntToStr( xTotCon) );
end;


procedure TFToolDocProv.bbtnAsientoClick(Sender: TObject);
var
 xRegistros, xTotReg, xTotCon : Integer;
 xZ : Integer;
 xSql, xMest : String;
begin
   if MessageDlg('Contabilizar Comprobantes'+chr(13)+chr(13)+
                 '  ¿ Esta Seguro ?  ',mtConfirmation, [mbYes, mbNo], 0)=mrNo then exit;

   if DMTE.cdsEgrcaja.FieldByName('EC_PROCE').AsString='1' then
      xSqlMant := FRegistro.xFiltroEgr.FMant.SQL;
   if DMTE.cdsEgrcaja.FieldByName('EC_PROCE').AsString='B' then
      xSqlMant := FRegistro.xFiltroPProv.FMant.SQL;
   if DMTE.cdsEgrcaja.FieldByName('EC_PROCE').AsString='3' then
      xSqlMant := FRegistro.xFiltroPagoProvBco.FMant.SQL;


   If pos('CIAID=',xSqlMant) > 0 then
      xToolCia     := copy(xSqlMant,pos('CIAID=',xSqlMant)+7,2);

   If pos('ECANOMM=',xSqlMant) > 0 then
      xToolAnomm   := copy(xSqlMant,pos('CNTANOMM=',xSqlMant)+10,6);

   If pos('TDIARID=',xSqlMant) > 0 then
      xTooldiario  := copy(xSqlMant,pos('TDIARID=',xSqlMant)+9,2);

   If (xToolCIa = '') then
   begin
      showMessage('Debe de Filtrar también por Compañia');
      exit;
   end;
   If (xToolAnomm = '') then
   begin
      showMessage('Debe de Filtrar también por Periodo');
      exit;
   end;

   Screen.Cursor := crHourglass ;

   xTotReg:=0;
   xTotCon:=0;
   DMTE.cdsEgrCaja.First;
   while not DMTE.cdsEgrCaja.Eof do begin

      xTotReg:=xTotReg+1;

      if ( DMTE.cdsEgrCaja.FieldByName('ECCONTA').AsString='S' ) then
      begin

         if Copy(DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString,1,2)='1.' then
            xRegAdicional:=DMTE.cdsEgrCaja.FieldByName('ECPERREC').AsString;

         // vhn Para Grabar Registros Adicionales
         if Copy(xRegAdicional,1,2)='1.' then
            AsientosAdicionales( xRegAdicional );

         xTotCon:=xTotCon+1;
		end;

      DMTE.cdsEgrCaja.Next;

   end;

   screen.Cursor := crDEFAULT;
   ShowMessage( 'Contabilización Terminada'+#13+#13+
                'Total Registros Leidos    : '+IntToStr( xTotReg)+#13+
                'Registros Contabilizados : ' +IntToStr( xTotCon) );
end;


procedure TFToolDocProv.AsientosAdicionales( cRegAdicional : String );
var
   xInsert, xSQL : String;
begin
   // PRIMER ASIENTO

   xSQL:='Select * from CAJA302 '
	     +'Where CIAID='   +quotedstr( Copy( cRegAdicional, 4, 2) )+' and '
	     +      'TDIARID=' +quotedstr( Copy( cRegAdicional, 7, 2) )+' and '
	     +      'ECANOMM=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString )+' and '
	     +      'ECNOCOMP='+quotedstr( Copy( cRegAdicional,10,10) )+' ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.Datarequest( xSQL );
   try
     DMTE.cdsQry.Open;
   except
   end;

   if DMTE.cdsQry.Recordcount<=0 then begin

      xInsert:='Insert Into CAJA302 ( CIAID, TDIARID, ECANOMM, ECNOCOMP, '
         +          ' BANCOID, CCBCOID, ECNOCHQ, ECFCOMP, FPAGOID, '
         +          ' TMONID, ECMTOORI, CLAUXID, PROV, PROVRUC, ECGIRA, ECGLOSA, ECFEMICH,'
         +          ' EC_IE, ECESTADO, ECCONTA, ECUSER ) '
         +'VALUES( '+quotedstr( Copy( cRegAdicional, 4, 2) )                    +', '
         +           quotedstr( Copy( cRegAdicional, 7, 2) )                    +', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString )+', '
         +           quotedstr( Copy( cRegAdicional,10,10) )                    +', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString )+', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString )+', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString )+', '
         +           quotedstr( Formatdatetime(DMTE.wFormatFecha,DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime ))+', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString )+', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('TMONID').AsString ) +', '
         +                      DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString  +', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString )+', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('PROV').AsString )   +', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('PROVRUC').AsString )+', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString )+', '         
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString )+', '
         +           quotedstr( Formatdatetime(DMTE.wFormatFecha,DMTE.cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime ))+', '
         +           '''E'', ''C'', ''S'', '''+DMTE.wUsuario+''' ) ';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.Datarequest( xInsert );
      try
        DMTE.cdsQry.Execute;
      except
        sHOWMESSAGE('Error');
      end;
   end
   else begin
      xSQL:='Update CAJA302 '
           +  'Set BANCOID=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString ) +', '
           +      'CCBCOID=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString ) +', '
           +      'ECNOCHQ=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString ) +', '
           +      'FPAGOID=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString ) +', '
           +      'TMONID='  +quotedstr( DMTE.cdsEgrCaja.FieldByName('TMONID').AsString )  +', '
           +      'ECMTOORI='+           DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString  +', '
           +      'CLAUXID=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString ) +', '
           +      'PROV='    +quotedstr( DMTE.cdsEgrCaja.FieldByName('PROV').AsString )    +', '
           +      'PROVRUC=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('PROVRUC').AsString ) +', '
           +      'ECGIRA='  +quotedstr( DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString )  +', '
           +      'ECGLOSA=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString ) +', '
           +      'ECFEMICH='+quotedstr( DMTE.cdsEgrCaja.FieldByName('ECFEMICH').AsString )+', '
           +      'EC_IE=''E'', '
           +      'ECFCOMP=' +quotedstr( Formatdatetime(DMTE.wFormatFecha,DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime ))+' '
	        +'Where CIAID='   +quotedstr( Copy( cRegAdicional, 4, 2) )+' and '
	        +      'TDIARID=' +quotedstr( Copy( cRegAdicional, 7, 2) )+' and '
    	     +      'ECANOMM=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString )+' and '
	        +      'ECNOCOMP='+quotedstr( Copy( cRegAdicional,10,10) )+' and '
           +      '( ECNOCHQ is null or ECNOCHQ='''' or ECNOCHQ='+quotedstr( DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString )+') ';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.Datarequest( xSQL );
      try
        DMTE.cdsQry.Execute;
      except
        sHOWMESSAGE('Error');      
      end;
   end;


   // SEGUNDO ASIENTO

   xSQL:='Select * from CAJA302 '
	     +'Where CIAID='   +quotedstr( Copy( cRegAdicional,25, 2) )+' and '
	     +      'TDIARID=' +quotedstr( Copy( cRegAdicional,28, 2) )+' and '
	     +      'ECANOMM=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString )+' and '
	     +      'ECNOCOMP='+quotedstr( Copy( cRegAdicional,31,10) )+' ';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.Datarequest( xSQL );
   try
     DMTE.cdsQry.Open;
   except
   end;

   if DMTE.cdsQry.Recordcount<=0 then begin

      xInsert:='Insert Into CAJA302 ( CIAID, TDIARID, ECANOMM, ECNOCOMP, '
         +          ' BANCOID, CCBCOID, ECNOCHQ, ECFCOMP, FPAGOID'
         +          ' TMONID, ECMTOORI, CLAUXID, PROV, PROVRUC, ECGIRA, ECGLOSA, ECFEMICH,'
         +          ' EC_IE, ECESTADO, ECCONTA, ECUSER ) '
         +'VALUES( '+quotedstr( Copy( cRegAdicional,25, 2) )                    +', '
         +           quotedstr( Copy( cRegAdicional,28, 2) )                    +', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString )+', '
         +           quotedstr( Copy( cRegAdicional,31,10) )                    +', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString )+', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString )+', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString )+', '
         +           quotedstr( Formatdatetime(DMTE.wFormatFecha,DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime ))+', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString )+', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('TMONID').AsString ) +', '
         +                      DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString  +', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString )+', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('PROV').AsString )   +', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('PROVRUC').AsString )+', '
         +           quotedstr( DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString )+', '
         +           quotedstr( Formatdatetime(DMTE.wFormatFecha,DMTE.cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime ))+', '
         +           '''E'', ''C'', ''S'', '''+DMTE.wUsuario+''' ) ';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.Datarequest( xInsert );
      try
        DMTE.cdsQry.Execute;
      except
      end;
   end
   else begin
      xSQL:='Update CAJA302 '
           +  'Set BANCOID=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('BANCOID').AsString ) +', '
           +      'CCBCOID=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('CCBCOID').AsString ) +', '
           +      'ECNOCHQ=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString ) +', '
           +      'FPAGOID=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('FPAGOID').AsString ) +', '
           +      'TMONID='  +quotedstr( DMTE.cdsEgrCaja.FieldByName('TMONID').AsString )  +', '
           +      'ECMTOORI='+           DMTE.cdsEgrCaja.FieldByName('ECMTOORI').AsString  +', '
           +      'CLAUXID=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('CLAUXID').AsString ) +', '
           +      'PROV='    +quotedstr( DMTE.cdsEgrCaja.FieldByName('PROV').AsString )    +', '
           +      'PROVRUC=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('PROVRUC').AsString ) +', '
           +      'ECGIRA='  +quotedstr( DMTE.cdsEgrCaja.FieldByName('ECGIRA').AsString )  +', '
           +      'ECGLOSA=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('ECGLOSA').AsString ) +', '
           +      'ECFEMICH='+quotedstr( Formatdatetime(DMTE.wFormatFecha,DMTE.cdsEgrCaja.FieldByName('ECFEMICH').AsDateTime ))+', '
           +      'EC_IE=''E'', '
           +      'ECFCOMP=' +quotedstr( Formatdatetime(DMTE.wFormatFecha,DMTE.cdsEgrCaja.FieldByName('ECFCOMP').AsDateTime ))+' '
	        +'Where CIAID='   +quotedstr( Copy( cRegAdicional,25, 2) )+' and '
	        +      'TDIARID=' +quotedstr( Copy( cRegAdicional,28, 2) )+' and '
    	     +      'ECANOMM=' +quotedstr( DMTE.cdsEgrCaja.FieldByName('ECANOMM').AsString )+' and '
	        +      'ECNOCOMP='+quotedstr( Copy( cRegAdicional,31,10) )+' and '
           +      '( ECNOCHQ is null or ECNOCHQ='''' or ECNOCHQ='+quotedstr( DMTE.cdsEgrCaja.FieldByName('ECNOCHQ').AsString )+') ';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.Datarequest( xSQL );
      try
        DMTE.cdsQry.Execute;
      except
      end;
   end;
end;


procedure TFToolDocProv.FormActivate(Sender: TObject);
begin

   bbtnAsiento.Visible:=False;

   if DMTE.wUsuario='SACSA' then begin
      bbtnAsiento.Visible:=True;
   end;
end;

procedure TFToolDocProv.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;

end;

end.

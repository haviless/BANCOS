unit Caja282;
//------------------------------------------------------------------------------------
// Unidad                   : Caja282
// Formulario               : FTarjetaImportar
// Fecha de Creación        : 15/12/2003
// Autor                    : Equipo de Desarrollo.
// Objetivo                 : Movimientos de Bancos
// Fecha de Actualización   : 15/07/2015
//------------------------------------------------------------------------------------
// Actualizaciones      :
// HPC_201310_CAJA  25/11/2013  Cambio en la Fecha de registro en la contabilización
//                              de bancos por cobro tarjeta de crédito.
// HPC_201311_CAJA  09/12/2013  Se amplia el cambio de fecha a la Contabilización
//                              e Importación de otras tarjetas.
// HPC_201404_CAJA      25/09/2014  Se esta agregando la condicion de para Express net
//                                  ya que actualmente no esta contabilizandose correctamente.
// HPC_201501_CAJA  29/05/2015
// HPC_201502_CAJA  02/10/2015  Se realizó el cambio para que se puedan generar las cuentas correctamente
//                              para las unidades diferentes a la cadena Hotelera y a la vez ajustar la codificación para que cuando se realice desde
//                              la Sede Genere bien las cuentas con el Origen 28.
//                              Se Modifica preparación de Glosa
//                              Se cambia modo de abrir detalle, se incluye filtro para que no demore
// HPC_201702_CAJA  09/05/2017 1. Se modificó la cuenta contable al valor de 121030101 (Contado MN)
//                                y al valor de 121030102 (Contado ME) para las transacciones de la compañia 18
//                             2. Se modificó el valor Origen a 31 para las compañias del tipo Hoteles y Centros
//                                Recreacionales.
//                             3. Se modificó el proceso de importar Tarjetas de Crédito para que se puedan
//                                contabilizar transacciones en Dólares.
//                             4. Se agrego nueva opcion para importar y contabilizar transacciones por Pago de
//                                Servicios.
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrContainer, StdCtrls, Buttons, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, wwdblook, Spin, wwdbdatetimepicker;

type
  TFTarjetaImportar = class(TForm)
    dbgDescago: TwwDBGrid;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    sdGraba: TSaveDialog;
    scData: TStrContainer;
    bbtnContab: TBitBtn;
    Panel1: TPanel;
    bbtnBuscar: TBitBtn;
    seAno: TSpinEdit;
    seMes: TSpinEdit;
    dtpFecBus: TwwDBDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Z2bbtnSalir: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
//Inicio HPC_201702_CAJA  Pago de servicios
    bbtnPagoServ: TBitBtn;
//Fin  HPC_201702_CAJA
    procedure BitBtn1Click(Sender: TObject);
    procedure dbgDescagoDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbtnBuscarClick(Sender: TObject);
    procedure bbtnContabClick(Sender: TObject);
    procedure Z2bbtnSalirClick(Sender: TObject);
    procedure dbgDescagoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
//Inicio_HPC_201702_CAJA  Pago de servicios
    procedure bbtnPagoServClick(Sender: TObject);
//Fin   HPC_201702_CAJA
  private
    { Private declarations }

  public
    { Public declarations }
    function MesCerrado(xMes, xAno, xCiaid: String): Boolean;
    //inicio SAR2010-0213   DAD-AS-2010-0010
    procedure ContabTarjeta();
    //fin SAR2010-0213
//Inicio_HPC_201702_CAJA  Pago de servicios
    procedure ContabPagoServicio();
//Fin   HPC_201702_CAJA
  end;

var
  FTarjetaImportar: TFTarjetaImportar;

implementation

{$R *.dfm}

USES CAJADM, CAJA283;

procedure TFTarjetaImportar.BitBtn1Click(Sender: TObject);
var
   dFecIni, dFecFin : TDate;
   i : Integer;
   xSQL, sLine, sDato, sBus, cMes, cSepara : String;
   nPosI, nPosF, nMes : Integer;
// Inicio: HPC_201311_CAJA
   xwAno, xwMes, xwDia : word;
   xPeriodo : String;
// Fin: HPC_201311_CAJA

//Inicio_HPC_201702_CAJA  Depositos de Tarjetas en Moneda Extranjera
   xMoneda : String;
//Fin_HPC_201702_CAJA
begin
   if not sdGraba.Execute then Exit;

   try
      cMes:=DMTE.StrZero(IntToStr(seMes.value),2);
   // Inicio: HPC_201311_CAJA
      xPeriodo := seAno.Text + cMes;
      dFecIni:=StrTodate('01/'+cMes+'/'+Copy(seAno.Text,1,4));

      decodedate(dateS, xwAno, xwMes, xwDia);
      if seMes.Value = xwMes then
         dFecFin:=dateS
      else
      begin
         if cMes='12' then
            dFecFin:=StrTodate('31/'+Copy(xPeriodo,5,2)+'/'+Copy(xPeriodo,1,4))
         else
         begin
            nMes:=StrToInt(Copy(xPeriodo,5,2))+1;
            dFecFin:=StrTodate('01/'+ DMTE.StrZero(IntToStr(nMes),2) +'/'+Copy(xPeriodo,1,4))-1;
         end;
      end;
   // Fin HPC_201311_BAN

      try
          scData.Lines.LoadFromFile( sdGraba.FileName);
      except
         ShowMessage('Error : Al Leer Archivo (1)');
         Exit;
      end;

      xSQL:='Select LPAD(TO_CHAR(NVL(TO_NUMBER(MAX(NUMERO)),0)+1),6,''0'') NUMMAX from CAJ_TAR_CRE_CAB';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest( xSQL );
      DMTE.cdsQry.Open;

      sLine:=Copy(scData.Lines.Strings[0],2,Length(scData.Lines.Strings[0]));
      sLine:=Copy(sLine,1,Length(sLine));
      if pos('","',sLine)>0 then
         cSepara:='","'
      else
         cSepara:='";"';

      nPosF:=Pos( cSepara, sLine );
      sLine:=Copy(sLine,nPosF+3,Length(sLine));

      nPosF:=Pos( ' ', sLine );
      sDato:=TRIM(Copy(sLine,1,nPosF));

      //Inicio_HPC_201702_CAJA tomar tipo de moneda
      sLine:=Copy(scData.Lines.Strings[1],11,5);
      if Copy(scData.Lines.Strings[1],11,1) = 'D' then
         xMoneda := 'D'
      else
         xMoneda := 'N';
      //Fin_HPC_201702_CAJA

      try
      DMTE.cdsCabTranf.Insert;
      DMTE.cdsCabTranf.FieldByname('NUMERO').AsString  :=DMTE.cdsQry.FieldByname('NUMMAX').AsString;
      DMTE.cdsCabTranf.FieldByname('FECHA').AsDateTime :=dFecFin;
      DMTE.cdsCabTranf.FieldByname('CNTANOMM').AsString:=Copy(dateToStr(dFecFin),7,4)+Copy(dateToStr(dFecFin),4,2);
      DMTE.cdsCabTranf.FieldByname('USUARIO').AsString :=DMTE.wUsuario;
      DMTE.cdsCabTranf.FieldByname('FREG').AsDateTime  :=Date;

      //Inicio_HPC_201702_CAJA  Depositos de Tarjetas en Moneda Extranjera
      //DMTE.cdsCabTranf.FieldByname('TMONID').AsString  :='N';
      DMTE.cdsCabTranf.FieldByname('TMONID').AsString  :=xMoneda;
      DMTE.cdsCabTranf.FieldByname('LOTE').AsString  :='TARJ';
      //Fin_HPC_201702_CAJA

      DMTE.cdsCabTranf.FieldByname('CCBCOID').AsString :=sDato;
      DMTE.cdsCabTranf.Post;
      except
         ShowMessage('Error : al Insertar datos de Cabecera');
         Exit;
      end;
      try
         DMTE.cdsCabTranf.ApplyUpdates(0);
      except
         ShowMessage('Error : Al Grabar Cabecera');
         Exit;
      end;

   // Inicio HPC_201502_CAJA
   //   xSQL:='Select * from CAJ_TAR_CRE_DET where NUMERO='''+DMTE.cdsQry.FieldByname('NUMMAX').AsString+'''';
      xSQL:='Select NUMERO, ITEM, FECHA, REFER, CARGO, ABONO, AGENCIA, OPERACION, '
          + '       MARCA, CIAID, TDIARID, ECANOMM, ECNOCOMP, USUARIO, FREG, '
          + '       TMONID, USUMAR '
          + '  from CAJ_TAR_CRE_DET '
          + ' where NUMERO='+quotedstr(DMTE.cdsQry.FieldByname('NUMMAX').AsString);
   // Fin HPC_201502_CAJA
      DMTE.cdsTarCreTransf.Close;
      DMTE.cdsTarCreTransf.DataRequest( xSQL );
      DMTE.cdsTarCreTransf.Open;
      sBus:= ';';

      For i:=1 to scData.Lines.Count-1 do
      begin
          sLine:=Copy(scData.Lines.Strings[i],2,Length(scData.Lines.Strings[i]));
          nPosF:=Pos( ';', sLine );
          sDato:=Copy(sLine,1,nPosF-2);

          if (pos('VISANET',sLine)>0) or (pos('EXPRESSNET',sLine)>0) or (pos('CIA DE SERV',sLine)>0) or (pos('DINERS CLUB',sLine)>0) or (pos('PROCESOS',sLine)>0) then
          begin
            if pos('/',Copy(sLine,1,5))>0 then
            begin
               sLine:=Copy(sLine,1,Length(sLine));
               if pos('","',sLine)>0 then
                  cSepara:='","'
               else
                  cSepara:='";"';
            end
            else
            begin
               sLine:=Copy(sLine,nPosF+2,Length(sLine));
               cSepara:='";"';
            end;

            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,1,nPosF-1);

            DMTE.cdsTarCreTransf.Insert;
            DMTE.cdsTarCreTransf.FieldByname('NUMERO').AsString :=DMTE.cdsCabTranf.FieldByname('NUMERO').AsString;
            DMTE.cdsTarCreTransf.FieldByName('ITEM').AsString   :=DMTE.StrZero(IntToStr(i),4);
            DMTE.cdsTarCreTransf.FieldByName('FECHA').AsString  :=sDato;

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,1,nPosF-1);

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,2,nPosF-2);
            DMTE.cdsTarCreTransf.FieldByName('REFER').AsString    :=sDato;

            //Inicio_HPC_201702_CAJA mostrar cargo y abono
            (*
            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            if cSepara='";"' then
            begin
               nPosF:=Pos( cSepara, sLine );
               sDato:=Copy(sLine,2,nPosF-2);
               DMTE.cdsTarCreTransf.FieldByName('CARGO').AsString    :=StringReplace(StringReplace(StringReplace(sDato,',','',[rfReplaceAll]),'(','',[rfReplaceAll]),')','',[rfReplaceAll]);
               sLine:=Copy(sLine,nPosF+2,Length(sLine));
            end;*)

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,2,nPosF-2);
            if  (strtofloat(StringReplace(sDato,',','',[rfReplaceAll])) < 0) then
               DMTE.cdsTarCreTransf.FieldByName('CARGO').AsString    :=StringReplace(StringReplace(sDato,'-','',[rfReplaceAll]),',','',[rfReplaceAll])
            else
               DMTE.cdsTarCreTransf.FieldByName('ABONO').AsString    :=StringReplace(sDato,',','',[rfReplaceAll]);
            //Fin_HPC_201702_CAJA

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,2,nPosF-2);

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,2,nPosF-2);
            DMTE.cdsTarCreTransf.FieldByName('AGENCIA').AsString  :=sDato;

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,2,nPosF-2);
            DMTE.cdsTarCreTransf.FieldByName('OPERACION').AsString:=sDato;

           {
            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            sDato:=Copy(sLine,1,nPosF-2);
//            sDato:=Copy(sLine,1,Length(sLine)-1);
            DMTE.cdsTarCreTransf.FieldByName('OPERACION').AsString:=sDato;
            }

            //Inicio_HPC_201702_CAJA  tipo de moneda
            //DMTE.cdsTarCreTransf.FieldByName('TMONID').AsString   :='N';
            DMTE.cdsTarCreTransf.FieldByName('TMONID').AsString   :=xMoneda;
            //Fin_HPC_201702_CAJA
            DMTE.cdsTarCreTransf.FieldByName('USUARIO').AsString  :=DMTE.wUsuario;
            DMTE.cdsTarCreTransf.FieldByName('FREG').Asdatetime   :=date;
            DMTE.cdsTarCreTransf.Post;
         end;
      end;
      try
         if DMTE.cdsTarCreTransf.ApplyUpdates(0)>0 then
            ShowMessage('Error al grabar');
      except
         ShowMessage('Error : Al Grabar Detalle');
         Exit;
      end;
   except
      ShowMessage('Error : Al Leer Archivo, Verificar si es el Correcto');
      Exit;
   end;
end;

procedure TFTarjetaImportar.dbgDescagoDblClick(Sender: TObject);
VAR
   xSQL : String;
begin
   if DMTE.cdsCabTranf.FieldByname('USUARIO').AsString<>DMTE.wUsuario then
   begin
      ShowMessage('Solo el Usuario '+DMTE.cdsCabTranf.FieldByname('USUARIO').AsString+' puede registrar en esta Transacción.'+chr(13)+chr(13)
                 +'Cada usuario debe descargar su movimiento del Telecrédito.');
      Exit;
   end;
// Inicio_HPC_201702_CAJA, se adiciono nuevas campos a retornar en el select: DOCID, CPSERIE, CPNODOC, CTATOTAL
// Inicio HPC_201502_CAJA
//   xSQL:='Select * from CAJ_TAR_CRE_DET where NUMERO='''+DMTE.cdsCabTranf.FieldByname('NUMERO').AsString+''' order by ITEM';
   xSQL:='Select NUMERO, ITEM, FECHA, REFER, CARGO, ABONO, AGENCIA, OPERACION, '
       + '       MARCA, CIAID, TDIARID, ECANOMM, ECNOCOMP, USUARIO, FREG, '
       + '       TMONID, USUMAR, DOCID, CPSERIE, CPNODOC, CTATOTAL '
       + '  from CAJ_TAR_CRE_DET '
       + ' where NUMERO='+quotedstr(DMTE.cdsCabTranf.FieldByname('NUMERO').AsString)
       + ' order by ITEM';
// Fin HPC_201502_CAJA
// Fin_HPC_201702_CAJA
   DMTE.cdsTarCreTransf.Close;
   DMTE.cdsTarCreTransf.DataRequest( xSQL );
   DMTE.cdsTarCreTransf.Open;

   FTarjetaImportarDet:=TFTarjetaImportarDet.Create(Self);
   FTarjetaImportarDet.ShowModal;
   FTarjetaImportarDet.Free;
end;

procedure TFTarjetaImportar.FormActivate(Sender: TObject);
begin
   seMes.Value:=StrToInt(Copy(DateToStr(Date-12),4,2));
   seAno.Value:=StrToInt(Copy(DateToStr(Date-12),7,4));
   bbtnBuscarClick(SELF);
end;

procedure TFTarjetaImportar.bbtnBuscarClick(Sender: TObject);
var
   xSQL : String;
begin
   xSQL:='Select * from CAJ_TAR_CRE_CAB ';
   if dtpFecBus.Date>0 then
      xSQL:=xSQL+'Where FECHA>='''+dtpFecBus.TEXT+''' ';
   xSQL:=xSQL+'Order by NUMERO DESC';
   DMTE.cdsCabTranf.Close;
   DMTE.cdsCabTranf.DataRequest( xSQL );
   DMTE.cdsCabTranf.Open;

   dbgDescago.Selected.Clear;
   dbgDescago.Selected.Add('NUMERO'#9'10'#9'Número~Descargo'#9'F');
//Inicio HPC_201702_CAJA  Tipo de Lote de Pago de Servicios
   dbgDescago.Selected.Add('LOTE'#9'10'#9'Lote'#9'F');
//Fin  HPC_201702_CAJA
   dbgDescago.Selected.Add('FECHA'#9'11'#9'Fecha'#9'F');
   dbgDescago.Selected.Add('CNTANOMM'#9'9'#9'Periodo~Contable'#9'F');
   dbgDescago.Selected.Add('USUARIO'#9'16'#9'Usuario'#9'F');
   dbgDescago.Selected.Add('FREG'#9'11'#9'Fecha~Registro'#9'F');
   dbgDescago.Selected.Add('TMONID'#9'8'#9'Tipo~Moneda'#9'F');
   dbgDescago.Selected.Add('CCBCOID'#9'18'#9'Cuenta~Corriente'#9'F');
   dbgDescago.Selected.Add('CONTAB'#9'11'#9'Contabilizado~S/N'#9'F');
   dbgDescago.Selected.Add('FECCNT'#9'12'#9'Fecha~Contabilizado'#9'F');
   dbgDescago.DataSource:=DMTE.dsCabTranf;

end;

// Inicio HPC_201501_CAJA
// Reordena rutina de Contabilización
// reasigna Cuentas Contables y Tipo de Diario a Otras Cuentas de Banco
procedure TFTarjetaImportar.bbtnContabClick(Sender: TObject);
var
   xSQL, xSQL1, xSQL2, xSQL3, xTCambio, xPeriodo, xOrigen, xLote, xWhere : String;
   cMes, xCia, xCta166, xCta466, sCta421, xNoComp, xCtaBan, xMesDes, sFecReg : String;
   sCtaTarjeta, sProv, sNomProv, sNomBusq, sTipoCNT : String;
   sNomBusq1 : String;
   dFecFin : tDATE;
   nmes, nVeces : Integer;
   xGlosa, xGlosa_d, xGlosa_total, xMoneda :String;
   xCiaId_Mov :String;
   xPeriodotransf,xCtaOpexLiq : String;    // HPC_201501_BAN
   xRespuesta :Integer;
   xBanco: String;
   xwAno, xwMes, xwDia : word;
   //Inicio_HPC_201702_CAJA  Depositos de Tarjetas en Moneda Extranjera
   sCtaTarjeta_Mov : String;
   //Fin_HPC_201702_CAJA
begin
   xWhere  := 'CJAAUTONOM=''S'' and CNTCONSOL=''N'' ';
   xCia    := DMTE.DisplayDescrip('prvTGE','TGE101','CIAID',xWhere,'CIAID'); // CIAID='02'
   xOrigen := '46';
   //Inicio HPC_201702_CAJA  Depositos de Tarjetas en Moneda Extranjera
   sCtaTarjeta_Mov := '';
   //Fin  HPC_201702_CAJA
   xPeriodo:=DMTE.cdsCabTranf.FieldByname('CNTANOMM').AsString;

   If MesCerrado(copy(xPeriodo,5,2),copy(xPeriodo,1,4),xCia) then
   begin
      ShowMessage(' Mes cerrado, no se puede contabilizar');
      exit;
   end;

   //Inicio_HPC_201702_CAJA origen de pago
   xLote:=DMTE.cdsCabTranf.FieldByname('LOTE').AsString;
   if (xLote = 'TARJ') then
   begin
      sTipoCNT:='T';
      xOrigen :='46';
      ContabTarjeta();
      exit;
   end
   else if (xLote = 'PSER') then
   begin
      xOrigen :='29';
      ContabPagoServicio();
      exit;
   end
   else
   begin
      sTipoCNT:='O';
      xOrigen :='28';
   end;
   //Fin_HPC_201702_CAJA

//Inicio_HPC_201702_CAJA, se comento porque ahora se discrimina por el campo LOTE
(*
// identificando si es por pagos con tarjeta de crédito o por depósito en banco
   xSQL:= ' Select NUMERO, FECHA, CNTANOMM, USUARIO, FREG, TMONID, CONTAB, '
        + '        FECCNT, CCBCOID '
        + '   from DB2ADMIN.CAJ_TAR_CRE_CAB CAB '
        + '  where NUMERO = '+QuotedStr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString )
        + '    and Exists (Select 1 '
        + '                  from DB2ADMIN.CAJ_TAR_CRE_DET DET '
        + '                 where CAB.NUMERO = DET.NUMERO '
        + '                   and NOT DET.CIAID IS NULL   '
        + '                   and (DET.REFER like ' + QuotedStr('%VISANET%')
        + '                     or DET.REFER like ' + QuotedStr('%EXPRESSNET%')
        + '                     or DET.REFER like ' + QuotedStr('%CIA DE SERV%')
        + '                     or DET.REFER like ' + QuotedStr('%DINERS CLUB%')
        + '                     or DET.REFER like ' + QuotedStr('%PROCESOS%')+')) ';
   sTipoCNT:='O';
   DMTE.cdsTarCreTransf.Close;
   DMTE.cdsTarCreTransf.IndexFieldNames:='';
   DMTE.cdsTarCreTransf.DataRequest( xSQL );
   DMTE.cdsTarCreTransf.Open;
   if DMTE.cdsTarCreTransf.RecordCount=0 then
   begin
      xOrigen :='28';
      xLote  :='DBAN';
   end
   else
   begin
      sTipoCNT:='T';
      xOrigen :='46';
      xLote  :='TARJ';
   // se ejecutará sólo para las tarjetas de crédito
      ContabTarjeta();
      exit;
   end;
*)
//Fin_HPC_201702_CAJA

// identificando las compañias que tienen movimientos identificados por contabilizar
   xSQL := ' Select DISTINCT CIAID,FECHA '
         + '   from CAJ_TAR_CRE_DET '
         + '  where NUMERO = ' + QuotedStr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString)
         + '    and ECNOCOMP IS NULL '
         + '    and NOT CIAID IS NULL ';
   DMTE.cdsQry7.Close;
   DMTE.cdsQry7.indexfieldnames:='';
   DMTE.cdsQry7.DataRequest( xSQL );
   DMTE.cdsQry7.Open;
   if DMTE.cdsQry7.RecordCount = 0 then
   begin
      ShowMessage('No existe ningún registro marcado para Contabilizar');
      Exit;
   end;

   //Inicio_HPC_201702_CAJA  Contabilidad pago de Servicios
   (*xSQL := ' Select CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, '
         + '        CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, '
         + '        CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         + '        TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, '
         + '        CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO '
         + '   from CNT300 '
         + '  where CIAID='+quotedstr(xCia)
         + '    and TDIARID='+quotedstr(xOrigen)
         + '    and CNTANOMM='+quotedstr(xPeriodo)
         + '    and CNTUSER='+quotedstr(DMTE.wUsuario)
         + '    and DOCMOD='+quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString);*)

   xSQL := ' Select CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, '
         + '        CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, '
         + '        CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         + '        TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, '
         + '        CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO '
         + '   from CNT300 '
         + '  where CNTANOMM='+quotedstr(xPeriodo)
         + '    and CNTUSER='+quotedstr(DMTE.wUsuario)
         + '    and DOCMOD='+quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString);
   //Fin_HPC_201702_CAJA

   DMTE.cdsQry.Close;
   DMTE.cdsQry.indexfieldnames:='';
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   if DMTE.cdsQry.RecordCount>0 then
   begin
      xRespuesta := MessageDlg('Existen Movimientos en Bancos que ya fueron contabilizados.'+#13
                     +'Desea Eliminar y volver a generar los Asientos Contables para esta transacción? '+#13  + #13
                     + '[YES] Elimina y genera nuevamente los Asientos Contables'+#13
                     + '[NO] Sólo genera Asientos contables por Movimientos Identificados sin Contabilizar'+ #13 ,mtConfirmation, [mbYes, mbNo], 0);
      if (xRespuesta <> 6) and (xRespuesta <> 7) then
      begin
         Exit;
      end;

      if xRespuesta = 6 then
      begin
      // verificando que no existan asientos aceptados en contabilidad

         //Inicio_HPC_201702_CAJA  Depositos de Tarjetas en Moneda Extranjera
         (*xSQL := ' Select CNT300.CIAID '
               + '   from CNT300, CAJ_TAR_CRE_DET '
               + '  where CNT300.CIAID           = '+Quotedstr(xCia)
               + '    and CAJ_TAR_CRE_DET.TDIARID  = CNT300.TDIARID '
               + '    and CAJ_TAR_CRE_DET.ECNOCOMP = CNT300.CNTCOMPROB '
               + '    and CAJ_TAR_CRE_DET.ECANOMM  = CNT300.CNTANOMM '
               + '    and CNT300.CNTANOMM          = '+ Quotedstr(xPeriodo)
               + '    and CNT300.CNTESTADO         = '+ Quotedstr('P')
               + '    and CAJ_TAR_CRE_DET.USUMAR   = '+ Quotedstr(DMTE.wUsuario)
               + '    and CAJ_TAR_CRE_DET.NUMERO   = '+ Quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString) ;*)
         
         xSQL := ' Select CIAID '
               + '   from CNT300 '
               + '  where CNTANOMM='+quotedstr(xPeriodo)
               + '    and CNTESTADO= '+ Quotedstr('P')
               + '    and CNTUSER='+quotedstr(DMTE.wUsuario)
               + '    and DOCMOD='+quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString);
         //Fin_HPC_201702_CAJA

         DMTE.cdsQry.Close;
         DMTE.cdsQry.DataRequest( xSQL );
         DMTE.cdsQry.Open;
         if DMTE.cdsQry.RecordCount>0 then
         begin
            Showmessage('Usuario NO se puede contabilizar. Existen asientos aceptados en Contabilidad, Verificar....');
            Exit;
         end;

         xSQL := ' Update CAJ_TAR_CRE_DET '
               + '    set CAJ_TAR_CRE_DET.TDIARID = ' + Quotedstr('')+', '
               + '        CAJ_TAR_CRE_DET.ECNOCOMP = ' +Quotedstr('')+', '
               + '        CAJ_TAR_CRE_DET.ECANOMM = '+ Quotedstr('')
               + '  where exists (select 1 '
               + '                  from CNT300 '
               + '                 where CNT300.CIAID = '+Quotedstr(xCia)
               + '                   and CAJ_TAR_CRE_DET.TDIARID  = CNT300.TDIARID '
               + '                   and CAJ_TAR_CRE_DET.ECNOCOMP = CNT300.CNTCOMPROB '
               + '                   and CAJ_TAR_CRE_DET.ECANOMM  =  CNT300.CNTANOMM '
               + '                   and CAJ_TAR_CRE_DET.NUMERO   = CNT300.DOCMOD '
               + '                   and CAJ_TAR_CRE_DET.USUMAR   = '+ Quotedstr(DMTE.wUsuario)
               + '                   and CAJ_TAR_CRE_DET.NUMERO   = '+ Quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString)+')' ;
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         //Inicio_HPC_201702_CAJA  Contabilidad pago de Servicios
         (*xSQL := ' Delete from CNT300 '
               + '  where CIAID='+quotedstr(xCia)
               + '    and TDIARID='+quotedstr(xOrigen)
               + '    and CNTANOMM='+quotedstr(xPeriodo)
               + '    and CNTUSER='+quotedstr(DMTE.wUsuario)
               + '    and DOCMOD='+quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString);*)

         xSQL := ' Delete from CNT300 '
               + '  where CNTANOMM='+quotedstr(xPeriodo)
               + '    and CNTUSER='+quotedstr(DMTE.wUsuario)
               + '    and DOCMOD='+quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString);

         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         //Fin_HPC_201702_CAJA

         //Inicio_HPC_201702_CAJA  Contabilidad pago de Servicios
         (*xSQL := ' Delete from CNT311 '
               + '  where CIAID='+quotedstr(xCia)
               + '    and TDIARID='+quotedstr(xOrigen)
               + '    and CNTANOMM='+quotedstr(xPeriodo)
               + '    and CNTUSER='+quotedstr(DMTE.wUsuario)
               + '    and CAMPOVAR='+quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString);*)

         xSQL := ' Delete from CNT311 '
               + '  where CNTANOMM='+quotedstr(xPeriodo)
               + '    and CNTUSER='+quotedstr(DMTE.wUsuario)
               + '    and CAMPOVAR='+quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString);
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         //Fin_HPC_201702_CAJA

         //Inicio_HPC_201702_CAJA  Contabilidad pago de Servicios
         (*xSQL := ' Delete from CNT301 '
               + '  where CIAID='+quotedstr(xCia)
               + '    and TDIARID='+quotedstr(xOrigen)
               + '    and CNTANOMM='+quotedstr(xPeriodo)
               + '    and CNTUSER='+quotedstr(DMTE.wUsuario)
               + '    and CAMPOVAR='+quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString);*)

         xSQL := ' Delete from CNT301 '
               + '  where CNTANOMM='+quotedstr(xPeriodo)
               + '    and CNTUSER='+quotedstr(DMTE.wUsuario)
               + '    and CAMPOVAR='+quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString);
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         //Fin_HPC_201702_CAJA

      // identificando las compañias que tienen movimientos identificados por contabilizar
         xSQL := ' Select DISTINCT CIAID,FECHA '
               + '   from CAJ_TAR_CRE_DET '
               + '  where NUMERO = ' + QuotedStr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString)
               + '    and ECNOCOMP IS NULL '
               + '    and NOT CIAID IS NULL ';
         DMTE.cdsQry7.Close;
         DMTE.cdsQry7.indexfieldnames:='';
         DMTE.cdsQry7.DataRequest( xSQL );
         DMTE.cdsQry7.Open;
      end;
   end;

   xSQL := 'Select BANCOID, CCBCOID, CCBCODES, CTAPRINC, CTAREMES, TMONID, CCFMTCHQ, '
         + '       CORRELATIVO, LONGITUD, CTADIFG, CTADIFP, CPTODIFG, CPTODIFP, CCBCOABR, '
         + '       CPTOID, CCBCOVOUCH, CIAID, CCOSDIF, COBCONS, CHQVOUCH, CCBVOUING, '
         + '       RELBAN, GENOFI, ACTIVO, CTAOPEXLIQ, DESCUEBAN, CUEEMICHE, CUEEXT, '
         + '       TDIARID_BAN, CTACOBR, MONBASE '
         + '  from TGE106 '
         + ' where CIAID=''02'' AND BANCOID=''03'' '
         + '   and CCBCOID='''+DMTE.cdsCabTranf.FieldByName('CCBCOID').AsString+'''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.indexfieldnames:='';
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   xCtaBan:=DMTE.cdsQry.FieldByName('CTAPRINC').AsString;
   if sTipoCNT='O' then
   begin
      if DMTE.cdsQry7.recordcount = 0 then
         exit;
      xPeriodotransf := copy(datetostr(DMTE.cdsQry7.FieldByName('FECHA').AsDateTime),7,4)+ copy(datetostr(DMTE.cdsQry7.FieldByName('FECHA').AsDateTime),4,2);
      if xPeriodotransf=xPeriodo then
      begin
         xCtaOpexLiq:=DMTE.cdsQry.FieldByName('CTAPRINC').AsString;
      end
      else
      begin
         xCtaOpexLiq:=DMTE.cdsQry.FieldByName('CTAOPEXLIQ').AsString;
      End;
   End;
   xCta466:='46602';
//Inicio HPC_201702_CAJA  Tipo de Moneda del Movimiento
   if DMTE.cdsCabTranf.FieldByName('TMONID').AsString='N' then
      sCta421:='42101'
   else
      sCta421:='42102';
//Fin_HPC_201702_CAJA

   decodedate(dateS, xwAno, xwMes, xwDia);
   if seMes.Value = xwMes then
      dFecFin:=dateS
   else
   begin
      cMes:=Copy(xPeriodo,5,2);
      if cMes='12' then
         dFecFin:=StrTodate('31/'+Copy(xPeriodo,5,2)+'/'+Copy(xPeriodo,1,4))
      else
      begin
         nMes:=StrToInt(Copy(xPeriodo,5,2))+1;
         dFecFin:=StrTodate('01/'+ DMTE.StrZero(IntToStr(nMes),2) +'/'+Copy(xPeriodo,1,4))-1;
      end;
   end;
   sFecReg:=DateToStr(dFecFin);

   try
   // Inicio HPC_201502_CAJA
   // Se cambia vairable de xPeriodo a xPeriodotransf
      xSQL := ' Select MESDESL '
            + '   from TGE181 '
            + '  where MESIDR='''+Copy(xPeriodotransf,5,2)+'''';
   // Fin HPC_201502_CAJA
      DMTE.cdsQry.Close;
      DMTE.cdsQry.indexfieldnames:='';
      DMTE.cdsQry.DataRequest( xSQL );
      DMTE.cdsQry.Open;
      xMesDes:=DMTE.cdsQry.FieldByName('MESDESL').AsString;

      xTCambio:='0';
      xWhere:='TMONID='+QuotedStr(DMTE.wTMonExt)+' and FECHA='''+sFecReg+'''';
      xTCambio:=DMTE.DisplayDescrip('prvTGE','TGE107','TMONID, TCAMVOV',xWhere,'TCAMVOV');
      if xTCambio='' then xTCambio:='0';
      if StrToFloat(xTCambio)<=0 then
      begin
         ShowMessage('Falta ingresar el Tipo de Cambio');
         Exit;
      end;

   // verificando que todas las compañías seleccionadas tengan la cuenta
      xBanco := '03'; // por  el momento todo es con el banco de crédito
      xSQL:= ' Select TDIARID_BAN, CIAID '
           + '   from TGE106 '
           + '  where CCBCOID =' +  QuotedStr(DMTE.cdsCabTranf.FieldByName('CCBCOID').AsString)
           + '    and BANCOID =' +  QuotedStr(xBanco)
           + '    and ACTIVO  ='+QuotedStr('S');
      DMTE.cdsQry1.Close;
      DMTE.cdsQry1.DataRequest(xSQL);
      DMTE.cdsQry1.Open;

      DMTE.cdsQry7.first;
      while not DMTE.cdsQry7.Eof do
      begin
         if not DMTE.cdsQry1.Locate('CIAID',DMTE.cdsQry7.FieldByName('CIAID').AsString,[]) then
         begin
            showmessage ('La Cuenta: ' + DMTE.cdsCabTranf.FieldByName('CCBCOID').AsString +
                          ' no existe en la compañia '+ DMTE.cdsQry7.FieldByName('CIAID').AsString+'.'
                          +chr(13) +chr(13)+ ' Primero debe crear la cuenta bancaria ' );
            exit;
         end
         else
         begin
            if Length(DMTE.cdsQry1.FieldByName('TDIARID_BAN').AsString) = 0 then
            begin
               showmessage ('La Cuenta: ' + DMTE.cdsCabTranf.FieldByName('CCBCOID').AsString
                 +chr(13) + ' no tiene Tipo de Diario asignado en la compañia '+ DMTE.cdsQry7.FieldByName('CIAID').AsString +'.'
                 +chr(13) +chr(13)+ ' Debe asignar un tipo de diario ' );
               exit;
            end;
         end;
         DMTE.cdsQry7.next;
      end;
      DMTE.cdsQry7.first;

   // generando un asiento por cada compañía
      while not DMTE.cdsQry7.Eof do
      begin
         xCiaId_Mov := DMTE.cdsQry7.FieldByName('CIAID').AsString;

         //Inicio_HPC_201702_CAJA  Contabilidad pago de Servicios
         //xSQL:= ' Select CODIGO '
         //     + '   from TGE004 '
         //     + '  where MODULOID =''CAJA'' '
         //     + '    and NTABLA =''TGE104'' '
         //     + '    and USERID  ='''+DMTE.wUsuario+''' ';
         //DMTE.cdsQry.Close;
         //DMTE.cdsQry.DataRequest(xSQL);
         //DMTE.cdsQry.Open;
         //If DMTE.cdsQry.RecordCount > 0 then
         //   xOrigen    := DMTE.cdsQry.FieldByName('CODIGO').AsString
         //else
         //   xOrigen    := '28' ;

         //Nueva parametria en la tabl CAJA103
         xSQL:= ' Select ORIGEN_DEPB, CUENTAMN_DEPB, CUENTAME_DEPB '
              + ' From CAJA103 '
              + ' Where CIAID =' +  QuotedStr(xCiaId_Mov);
         DMTE.cdsQry.Close;
         DMTE.cdsQry.DataRequest(xSQL);
         DMTE.cdsQry.Open;
         If DMTE.cdsQry.RecordCount > 0 then
         begin
            xOrigen    := DMTE.cdsQry.FieldByName('ORIGEN_DEPB').AsString;
            if DMTE.cdsCabTranf.FieldByName('TMONID').AsString = 'N' then
               sCtaTarjeta_Mov := DMTE.cdsQry.FieldByName('CUENTAMN_DEPB').AsString
            else
               sCtaTarjeta_Mov := DMTE.cdsQry.FieldByName('CUENTAME_DEPB').AsString;
         end;
         //Fin_HPC_201702_CAJA


         if sTipoCNT='O' then
         begin
         /////////////////////
         //      OTRAS      //
         /////////////////////
            if DMTE.cdsCabTranf.FieldByName('TMONID').AsString = 'N' then
               xMoneda := 'MN'
            else
               xMoneda := 'ME' ;
//'''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+'''
//          xGlosa := '(CASE WHEN A.CIAID = '+Quotedstr('15')+' THEN '+Quotedstr('INMOB '+xMesDes+ ' DEPOSITO '+xMoneda )+' ELSE F.CIAABR ||'+Quotedstr(' '+xMesDes+' DEPOSITO ' + xMoneda)+' END ) ' ;
// Inicio HPC_201502_CAJA
//          xGlosa := '(CASE WHEN A.CIAID = '+Quotedstr('15')+' THEN '+Quotedstr('INMOB '+xMesDes+' DEPOSITO ' +xMoneda )+' ELSE F.CIAABR ||'+Quotedstr('DEPOSITO '+xMesDes+' '+DMTE.cdsCabTranf.FieldByName('CCBCOID').AsString+' '+ xMoneda)+' END ) ' ;
            xGlosa := '(CASE WHEN A.CIAID = '+Quotedstr('15')+' THEN '+Quotedstr('INMOB '+xMesDes+' DEPOSITO ' +xMoneda )+' ELSE '+Quotedstr('DEPOSITO '+ xMoneda +' '+DMTE.cdsCabTranf.FieldByName('CCBCOID').AsString+' '+xMesDes+' ')+' END ) ' ;
            xGlosa_d := 'SUBSTR((CASE WHEN A.CIAID = '+Quotedstr('15')+' THEN '+Quotedstr('INMOB '+xMesDes+' DEPOSITO ' +xMoneda)+' ELSE  F.CIAABR ||'+ Quotedstr(' '+xMesDes+' DEPOSITO ' + xMoneda)+' END ),1,40 ) ';
         //Inicio_HPC_201702_CAJA  Contabilidad Ventas
            IF xOrigen='28' THEN
               xGlosa_total := 'SUBSTR(('+Quotedstr('COBRANZA '+xMesDes)+' ),1,40 ) '
            ELSE
               xGlosa_total := 'SUBSTR(('+Quotedstr('DEPOSITO VENTA '+xMesDes)+' ),1,40 ) ';
         //Fin  HPC_201702_CAJA
// Fin HPC_201502_CAJA
            xSQL := ' Select lpad(to_char(nvl(max(CNTCOMPROB),0)+1),10,''0'') NOCOMP '
                  + '   from CNT300 '
                  + '  where CIAID='+quotedstr(xCia)
                  + '    and CNTANOMM='+quotedstr(xPeriodo)
                  + '    and TDIARID='+quotedstr(xOrigen);
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest( xSQL );
            DMTE.cdsQry.Open;
            xNoComp:=DMTE.cdsQry.FieldByName('NOCOMP').AsString;

            xSQL := ' Select CIAID '
                  + '   from CAJ_TAR_CRE_DET A '
                  + '  where NUMERO='+quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString)
                  + '    and CIAID ='+quotedstr(xCiaId_Mov)
                  + '    and ECNOCOMP IS NULL '
                  + '    and CIAID IS NOT NULL';
         //Inicio HPC_201702_CAJA  Contabilidad pago de Servicios
            DMTE.cdsQry6.Close;
            DMTE.cdsQry6.DataRequest( xSQL );
            DMTE.cdsQry6.Open;
         //Fin    HPC_201702_CAJA

         // cabecera
            xSQL := ' Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
                  + '                     CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
                  + '                     CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, '
                  + '                     CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
                  + '                     CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, '
                  + '                     CNTFMEC, TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, '
                  + '                     CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO) '
                  + ' Select '+quotedstr(xCia)+', '+quotedstr(xOrigen)
                  + '        TDIARID, '+quotedstr(xNoComp)+', '
                  +          quotedstr(xPeriodo)+', '+quotedstr(xLote)+', '
                  +          xGlosa +' GLOSA, '
                  +          xTCambio+', '+quotedstr(sFecReg)+', '
                  +          quotedstr('I')+', '+quotedstr('N')+', '
                  + '        NULL, '+quotedstr(DMTE.wUsuario)+', SYSDATE, SYSDATE, '
                  + '        max(b.fecano), max(b.fecmes), max(b.fecdia), '
                  + '        Max(b.fectrim), max(b.fecsem), max(b.fecss), '
                  + '        max(b.fecaatri), max(b.fecaasem), max(b.fecaass), '
                  + '        A.TMONID, NULL, NULL, NULL, TDIARABR, '
                  + '        sum(case when A.TMONID=''N'' then A.ABONO else round(A.ABONO*'+xTCambio+',2) end ) DMN, '
                  + '        sum(case when A.TMONID=''D'' then A.ABONO else round(A.ABONO/'+xTCambio+',2) end ) DME, '
                  + '        sum(case when A.TMONID=''N'' then A.ABONO else round(A.ABONO*'+xTCambio+',2) end ) HMN, '
                  + '        sum(case when A.TMONID=''D'' then A.ABONO else round(A.ABONO/'+xTCambio+',2) end ) HME, '
                  + '        0, 0, NULL, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+''', ''CAJA'' '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C , TGE101 F '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.CIAID is not null '
                  + '    and A.CIAID = ' +QuotedStr(xCiaId_Mov)+ ' '
                  + '    and A.ECNOCOMP is null '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg      +''' '
                  + '    and C.TDIARID(+)='''+xOrigen      +''' '
                  + '    and A.CIAID=F.CIAID(+) '
                  + '  group by A.TMONID, C.TDIARABR, A.CIAID, F.CIAABR ' ;
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 1 VISANET
            xSQL := ' Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, '
                  + '                    CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, '
                  + '                    CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, '
                  + '                    CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTMM, CNTDD, '
                  + '                    CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, '
                  + '                    AUXDES, DOCDES, CCOSDES, CNTDEBEMN, CNTDEBEME, '
                  + '                    CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, '
                  + '                    CNTTS, CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB, '
                  + '        b.fecano, '''+xPeriodo+''', '''+xLote+''', '''+xCtaOpexLiq+''', NULL, '
                  + '        NULL, '
                  + '        ''20'', ''OP'', OPERACION, '+ xGlosa_d +' GLOSA, ''D'', NULL, '+xTCambio+', '
                  + '        A.ABONO, CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END TMN, '
                  + '        CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END TME, '
                  + '        A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem, b.fecaass, '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END HMN, '
                  + '        CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END HME, 0, 0, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', ROWNUM, ''CAJA'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and A.CIAID=E.CIAID AND '''+xCtaBan+'''=E.CUENTAID '
                  + '    and A.CIAID=F.CIAID(+)';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 2 VISANET
//Inicio_HPC_201702_CAJA   Contabilidad Ventas
            xSQL := ' Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                    CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                    CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', G.CTADEBE, NULL, NULL, '
                  + '        ''20'', ''OP'', ''VARIOS'', '+xGlosa_total +' GLOSA, ''H'', NULL, '+xTCambio+', '
                  + '        SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
                  + '        '''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        0, 0, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
                  + '        SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', '+IntToStr(DMTE.cdsQry6.RecordCount+1)+', ''CAJA'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, CAJA103 G, TGE202 E, TGE101 F  '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '    and A.CIAID=G.CIAID '
                  + '    and A.CIAID=E.CIAID AND G.CTADEBE=E.CUENTAID '
                  + '    and A.CIAID=F.CIAID(+) '
                  + '    and ' + QuotedStr(xCiaId_Mov) + ' <> ''02'' '
                  + '  group by A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR,  G.CTADEBE, CIAABR';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
//Fin HPC_201702_CAJA_Fin

         // Grabar en los registros marcados el asiento contable al que pertenecen
            xSQL := ' Update CAJ_TAR_CRE_DET SET TDIARID='''+xOrigen+''', ECNOCOMP='''+xNoComp+''', ECANOMM='''+xPeriodo+''' '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and ECNOCOMP  IS NULL '
                  +  '   and USUMAR='''+DMTE.wUsuario+'''';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // Enumerando nuevamente el detalle del comprobante
            xSQL:= 'Update CNT311 SET CNTREG  =  ROWNUM '
                 + ' where CIAID    = ' + QuotedStr(xCia)
                 + '   and TDIARID    = ' + QuotedStr(xOrigen)
                 + '   and CNTANOMM   = ' + QuotedStr(xPeriodo)
                 + '   and CNTCOMPROB = ' + QuotedStr(xNoComp) ;
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         end;
         (*
         else
         begin

            /////////////////////
            //     VISANET     //
            /////////////////////
            xSQL := ' Select lpad(to_char(nvl(max(CNTCOMPROB),0)+1),10,''0'') NOCOMP '
                  + '   from CNT300 '
                  + '  where CIAID='''+xCia+''' '
                  + '    and CNTANOMM='''+xPeriodo+''' '
                  + '    and TDIARID='''+xOrigen+'''';
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest( xSQL );
            DMTE.cdsQry.Open;
            xNoComp:=DMTE.cdsQry.FieldByName('NOCOMP').AsString;

            xSQL := ' Select CIAID '
                  + '   from CAJ_TAR_CRE_DET A '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '    and A.REFER LIKE ''%VISANET%'' AND CIAID IS NOT NULL';
            DMTE.cdsTarCreTransf.Close;
            DMTE.cdsTarCreTransf.DataRequest( xSQL );
            DMTE.cdsTarCreTransf.Open;

         // cabecera
            xSQL := ' Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
                  + '                     CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
                  + '                     CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
                  + '                     CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
                  + '                     TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''', '
                  + '        '''+xPeriodo+''', '''+xLote+''', ''VISANET '+xMesDes+' HOTELES'' GLOSA, '+xTCambio+', '''+sFecReg+''', '
                  + '        ''I'', ''N'', NULL, '''+DMTE.wUsuario+''', SYSDATE, SYSDATE, max(b.fecano), max(b.fecmes), max(b.fecdia), '
                  + '        Max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), A.TMONID, NULL, NULL, NULL, '
                  + '        TDIARABR, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) DMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) DME, '
                  + '        SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) HMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) HME, '
                  + '        0, 0, NULL, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+''', ''CAJA'' '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.REFER LIKE ''%VISANET%'' AND CIAID IS NOT NULL '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg      +''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '    and C.TDIARID(+)='''+xOrigen      +''' '
                  + '  group BY A.TMONID, C.TDIARABR';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 1 VISANET
            xSQL := ' INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                    CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                    CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , b.fecano, '''+xPeriodo+''', '''+xLote+''', '''+xCtaBan+''', NULL, NULL, '
                  + '        ''20'', ''OP'', OPERACION, SUBSTR(''VISANET '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
                  + '        A.ABONO, CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END TMN, '
                  + '        CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END TME, '
                  + '        A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem, b.fecaass, '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END HMN, '
                  + '        CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END HME, 0, 0, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', ROWNUM, ''CAJA'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.REFER LIKE ''%VISANET%'' '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and A.CIAID=E.CIAID AND '''+xCtaBan+'''=E.CUENTAID '
                  + '    and A.CIAID=F.CIAID(+)';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 2 VISANET
            xSQL := ' INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                    CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                    CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', G.CTADEBE, NULL, NULL, '
                  + '        ''20'', ''OP'', ''VARIOS'', SUBSTR(''VISANET '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''H'', NULL, '+xTCambio+', '
                  + '        SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
                  + '        '''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        0, 0, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
                  + '        SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', '+IntToStr(DMTE.cdsTarCreTransf.RecordCount+1)+', ''CAJA'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, CAJA103 G, TGE202 E, TGE101 F  '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.REFER LIKE ''%VISANET%'' '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '    and A.CIAID=G.CIAID '
                  + '    and A.CIAID=E.CIAID AND G.CTADEBE=E.CUENTAID '
                  + '    and A.CIAID=F.CIAID(+) '
                  + '  group BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR,  G.CTADEBE, CIAABR';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // Grabar en los registros marcados el asiento contable al que pertenecen
            xSQL := 'Update CAJ_TAR_CRE_DET '
                  + '   set TDIARID='''+xOrigen+''', '
                  + '       ECNOCOMP='''+xNoComp+''', '
                  + '       ECANOMM='''+xPeriodo+''' '
                  + ' where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '   and CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '   and ECNOCOMP  IS NULL '
                  + '   and REFER LIKE ''%VISANET%'' and USUMAR='''+DMTE.wUsuario+'''';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // Enumerando nuevamente el detalle del comprobante
            xSQL := 'Update CNT311 '
                  + '   set CNTREG     =  ROWNUM '
                  + ' where CIAID      = ' + QuotedStr(xCia)
                  + '   and TDIARID    = ' + QuotedStr(xOrigen)
                  + '   and CNTANOMM   = ' + QuotedStr(xPeriodo)
                  + '   and CNTCOMPROB = ' + QuotedStr(xNoComp) ;
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

            /////////////////////
            //    EXPRESSNET   //
            /////////////////////
            xSQL := ' Select lpad(to_char(nvl(max(CNTCOMPROB),0)+1),10,''0'') NOCOMP '
                  + '   from CNT300 '
                  + '  where CIAID='''+xCia+''' '
                  + '    and CNTANOMM='''+xPeriodo+''' '
                  + '    and TDIARID='''+xOrigen+'''';
            DMTE.cdsQry.Close;
            DMTE.cdsQry.indexfieldnames:='';
            DMTE.cdsQry.DataRequest( xSQL );
            DMTE.cdsQry.Open;
            xNoComp:=DMTE.cdsQry.FieldByName('NOCOMP').AsString;

            xSQL := ' Select CIAID '
                  + '   from CAJ_TAR_CRE_DET A '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '    and (A.REFER LIKE ''%EXPRESSNET%'' OR A.REFER LIKE ''%CIA DE SERV%'') AND CIAID IS NOT NULL';
            DMTE.cdsTarCreTransf.Close;
            DMTE.cdsTarCreTransf.DataRequest( xSQL );
            DMTE.cdsTarCreTransf.Open;

         // cabecera
            xSQL := ' Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
                  + '                     CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
                  + '                     CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
                  + '                     CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
                  + '                     TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''', '
                  + '        '''+xPeriodo+''', '''+xLote+''', ''EXPRESSNET '+xMesDes+' HOTELES'' GLOSA, '+xTCambio+', '''+sFecReg+''', '
                  + '        ''I'', ''N'', NULL, '''+DMTE.wUsuario+''', SYSDATE, SYSDATE, max(b.fecano), max(b.fecmes), max(b.fecdia), '
                  + '        Max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), A.TMONID, NULL, NULL, NULL, '
                  + '        TDIARABR, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) DMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) DME, '
                  + '        SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) HMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) HME, '
                  + '        0, 0, NULL, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+''', ''CAJA'' '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and (A.REFER LIKE ''%EXPRESSNET%'' OR A.REFER LIKE ''%CIA DE SERV%'') AND CIAID IS NOT NULL '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '  group BY A.TMONID, C.TDIARABR';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 1 EXPRESSNET
            xSQL := ' INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                    CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                    CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , b.fecano, '''+xPeriodo+''', '''+xLote+''', '''+xCtaBan+''', NULL, NULL, '
                  + '        ''20'', ''OP'', OPERACION, SUBSTR(''EXPRESSNET '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
                  + '        A.ABONO, CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END TMN, '
                  + '        CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END TME, '
                  + '        A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem, b.fecaass, '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END HMN, '
                  + '        CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END HME, 0, 0, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', ROWNUM, ''CAJA'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and (A.REFER LIKE ''%EXPRESSNET%'' OR A.REFER LIKE ''%CIA DE SERV%'') '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and A.CIAID=E.CIAID AND '''+xCtaBan+'''=E.CUENTAID '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '    and A.CIAID=F.CIAID(+)';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 2 EXPRESSNET
            xSQL := ' INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                    CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                    CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', G.CTADEBE, NULL, NULL, '
                  + '        ''20'', ''OP'', ''VARIOS'', SUBSTR(''EXPRESSNET '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''H'', NULL, '+xTCambio+', '
                  + '        SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
                  + '        '''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        0, 0, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
                  + '        SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', '+IntToStr(DMTE.cdsTarCreTransf.RecordCount+1)+', ''CAJA'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, CAJA103 G, TGE202 E, TGE101 F  '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and (A.REFER LIKE ''%EXPRESSNET%'' OR A.REFER LIKE ''%CIA DE SERV%'') '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and A.CIAID=G.CIAID '
                  + '    and A.CIAID=E.CIAID AND G.CTADEBE=E.CUENTAID '
                  + '    and A.CIAID=F.CIAID(+) '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '  group by A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR,  G.CTADEBE, CIAABR';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // Grabar en los registros marcados el asiento contable al que pertenecen
            xSQL := ' Update CAJ_TAR_CRE_DET '
                  + '    SET TDIARID='''+xOrigen+''', '
                  + '        ECNOCOMP='''+xNoComp+''', '
                  + '        ECANOMM='''+xPeriodo+''' '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    AND CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    AND ECNOCOMP  IS NULL '
                  + '    and (REFER LIKE ''%EXPRESSNET%'' OR REFER LIKE ''%CIA DE SERV%'') '
                  + '    and USUMAR='''+DMTE.wUsuario+'''';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // Enumerando nuevamente el detalle del comprobante
            xSQL := ' Update CNT311 '
                  + '    set CNTREG  =  ROWNUM '
                  + '  where CIAID    = ' + QuotedStr(xCia)
                  + '    and TDIARID    = ' + QuotedStr(xOrigen)
                  + '    and CNTANOMM   = ' + QuotedStr(xPeriodo)
                  + '    and CNTCOMPROB = ' + QuotedStr(xNoComp) ;
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

            /////////////////////
            //   DINERS CLUB   //
            /////////////////////
            xSQL := 'Select lpad(to_char(nvl(max(CNTCOMPROB),0)+1),10,''0'') NOCOMP '
                  + '  from CNT300 '
                  + ' where CIAID='''+xCia+''' '
                  + '   and CNTANOMM='''+xPeriodo+''' '
                  + '   and TDIARID='''+xOrigen+'''';
            DMTE.cdsQry.Close;
            DMTE.cdsQry.indexfieldnames:='';
            DMTE.cdsQry.DataRequest( xSQL );
            DMTE.cdsQry.Open;
            xNoComp:=DMTE.cdsQry.FieldByName('NOCOMP').AsString;

            xSQL := ' Select CIAID '
                  + '   from CAJ_TAR_CRE_DET A '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '    and A.REFER LIKE ''%DINERS CLUB%'' '
                  + '    and CIAID IS NOT NULL';
            DMTE.cdsTarCreTransf.Close;
            DMTE.cdsTarCreTransf.DataRequest( xSQL );
            DMTE.cdsTarCreTransf.Open;

        // cabecera
            xSQL := ' Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
                  + '                     CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
                  + '                     CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
                  + '                     CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
                  + '                     TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''', '
                  + '        '''+xPeriodo+''', '''+xLote+''', ''DINERS '+xMesDes+' HOTELES'' GLOSA, '+xTCambio+', '''+sFecReg+''', '
                  + '        ''I'', ''N'', NULL, '''+DMTE.wUsuario+''', SYSDATE, SYSDATE, max(b.fecano), max(b.fecmes), max(b.fecdia), '
                  + '        Max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), A.TMONID, NULL, NULL, NULL, '
                  + '        TDIARABR, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) DMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) DME, '
                  + '        SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) HMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) HME, '
                  + '        0, 0, NULL, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+''', ''CAJA'' '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.REFER LIKE ''%DINERS CLUB%'' AND CIAID IS NOT NULL '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '  group BY A.TMONID, C.TDIARABR';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 1 DINERS CLUB
            xSQL := 'INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , b.fecano, '''+xPeriodo+''', '''+xLote+''', '''+xCtaBan+''', NULL, NULL, '
                  + '        ''20'', ''OP'', OPERACION, SUBSTR(''DINERS '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
                  + '        A.ABONO, CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END TMN, '
                  + '        CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END TME, '
                  + '        A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem, b.fecaass, '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END HMN, '
                  + '        CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END HME, 0, 0, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', ROWNUM, ''CAJA'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.REFER LIKE ''%DINERS CLUB%'' '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and A.CIAID=E.CIAID AND '''+xCtaBan+'''=E.CUENTAID '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '    and A.CIAID=F.CIAID(+)';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

            // DETALLE 2 DINERS CLUB
            xSQL := 'INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                   DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                   CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                   TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', G.CTADEBE, NULL, NULL, '
                  + '        ''20'', ''OP'', ''VARIOS'', SUBSTR(''DINERS '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''H'', NULL, '+xTCambio+', '
                  + '        SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
                  + '        '''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        0, 0, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
                  + '        SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', '+IntToStr(DMTE.cdsTarCreTransf.RecordCount+1)+', ''CAJA'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, CAJA103 G, TGE202 E, TGE101 F  '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.REFER LIKE ''%DINERS CLUB%'' '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and A.CIAID=G.CIAID '
                  + '    and A.CIAID=E.CIAID AND G.CTADEBE=E.CUENTAID '
                  + '    and A.CIAID=F.CIAID(+) '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '  group BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR,  G.CTADEBE, CIAABR';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // Grabar en los registros marcados el asiento contable al que pertenecen
            xSQL := ' Update CAJ_TAR_CRE_DET '
                  + '    set TDIARID='''+xOrigen+''', '
                  + '        ECNOCOMP='''+xNoComp+''', '
                  + '        ECANOMM='''+xPeriodo+''' '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and ECNOCOMP  IS NULL '
                  + '    and REFER LIKE ''%DINERS CLUB%'' and USUMAR='''+DMTE.wUsuario+'''';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // Enumerando nuevamente el detalle del comprobante
            xSQL := ' Update CNT311 '
                  + '    set CNTREG  =  ROWNUM '
                  + '  where CIAID    = ' + QuotedStr(xCia)
                  + '    and TDIARID    = ' + QuotedStr(xOrigen)
                  + '    and CNTANOMM   = ' + QuotedStr(xPeriodo)
                  + '    and CNTCOMPROB = ' + QuotedStr(xNoComp) ;
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

            /////////////////////
            //    PROCESOS     //
            /////////////////////
            xSQL := 'Select lpad(to_char(nvl(max(CNTCOMPROB),0)+1),10,''0'') NOCOMP '
                  + '  from CNT300 '
                  + ' where CIAID='''+xCia+''' '
                  + '   and CNTANOMM='''+xPeriodo+''' '
                  + '   and TDIARID='''+xOrigen+'''';
            DMTE.cdsQry.Close;
            DMTE.cdsQry.indexfieldnames:='';
            DMTE.cdsQry.DataRequest( xSQL );
            DMTE.cdsQry.Open;
            xNoComp:=DMTE.cdsQry.FieldByName('NOCOMP').AsString;

            xSQL := ' Select CIAID '
                  + '   from CAJ_TAR_CRE_DET A '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP IS NULL '
                  + '    and A.REFER LIKE ''%PROCESOS%'' '
                  + '    and CIAID IS NOT NULL';
            DMTE.cdsTarCreTransf.Close;
            DMTE.cdsTarCreTransf.DataRequest( xSQL );
            DMTE.cdsTarCreTransf.Open;

         // cabecera
            xSQL := ' INSERT INTO CNT300 (CIAID, TDIARID, CNTCOMPROB, '
                  + '                     CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
                  + '                     CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
                  + '                     CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
                  + '                     TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''', '
                  + '        '''+xPeriodo+''', '''+xLote+''', ''MCARD '+xMesDes+' HOTELES'' GLOSA, '+xTCambio+', '''+sFecReg+''', '
                  + '        ''I'', ''N'', NULL, '''+DMTE.wUsuario+''', SYSDATE, SYSDATE, max(b.fecano), max(b.fecmes), max(b.fecdia), '
                  + '        Max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), A.TMONID, NULL, NULL, NULL, '
                  + '        TDIARABR, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) DMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) DME, '
                  + '        SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) HMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) HME, '
                  + '        0, 0, NULL, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+''', ''CAJA'' '
                  + '   FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.REFER LIKE ''%PROCESOS%'' AND CIAID IS NOT NULL '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    AND B.FECHA(+)='''  +sFecReg+''' '
                  + '    AND C.TDIARID(+)='''+xOrigen+''' '
                  + '    AND A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    AND A.ECNOCOMP  IS NULL '
                  + '  GROUP BY A.TMONID, C.TDIARABR';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

        // DETALLE 1 PROCESOS
            xSQL := ' Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                    CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                    CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , b.fecano, '''+xPeriodo+''', '''+xLote+''', '''+xCtaBan+''', NULL, NULL, '
                  + '        ''20'', ''OP'', OPERACION, SUBSTR(''MCARD '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
                  + '        A.ABONO, CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END TMN, '
                  + '        CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END TME, '
                  + '        A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem, b.fecaass, '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END HMN, '
                  + '        CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END HME, 0, 0, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', ROWNUM, ''CAJA'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.REFER LIKE ''%PROCESOS%'' '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and A.CIAID=E.CIAID AND '''+xCtaBan+'''=E.CUENTAID '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '    and A.CIAID=F.CIAID(+)';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 2 PROCESOS
            xSQL := ' Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                    CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                    CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', G.CTADEBE, NULL, NULL, '
                  + '        ''20'', ''OP'', ''VARIOS'', SUBSTR(''MCARD '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''H'', NULL, '+xTCambio+', '
                  + '        SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
                  + '        '''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        0, 0, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
                  + '        SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', '+IntToStr(DMTE.cdsTarCreTransf.RecordCount+1)+', ''CAJA'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, CAJA103 G, TGE202 E, TGE101 F  '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.REFER LIKE ''%PROCESOS%'' '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and A.CIAID=G.CIAID '
                  + '    and A.CIAID=E.CIAID AND G.CTADEBE=E.CUENTAID '
                  + '    and A.CIAID=F.CIAID(+) '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '  group BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR,  G.CTADEBE, CIAABR';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // Grabar en los registros marcados el asiento contable al que pertenecen
            xSQL := ' Update CAJ_TAR_CRE_DET '
                  + '    set TDIARID='''+xOrigen+''','
                  + '        ECNOCOMP='''+xNoComp+''','
                  + '        ECANOMM='''+xPeriodo+''' '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and REFER LIKE ''%PROCESOS%'' and USUMAR='''+DMTE.wUsuario+'''';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // Enumerando nuevamente el detalle del comprobante
            xSQL := 'Update CNT311 '
                  + '   set CNTREG  =  ROWNUM '
                  + ' where CIAID    = ' + QuotedStr(xCia)
                  + '   and TDIARID    = ' + QuotedStr(xOrigen)
                  + '   and CNTANOMM   = ' + QuotedStr(xPeriodo)
                  + '   and CNTCOMPROB = ' + QuotedStr(xNoComp) ;
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         end;
         *)


         //////////////////////////////////////
         //////////////////////////////////////
         //////////////////////////////////////
         ///                                ///
         ///      ASIENTOS EN FILIALES      ///
         ///                                ///
         //////////////////////////////////////
         //////////////////////////////////////
         //////////////////////////////////////


         For nVeces:=1 to 4 do
         begin
            if nVeces=1 then
            begin
               sCtaTarjeta:='121030203';  sProv:='P1541';  sNomProv:='VISANET';     sNomBusq:='VISANET'; sNomBusq1:='VISANET';
            end;
            if nVeces=2 then
            begin
               sCtaTarjeta:='121030205';  sProv:='P1554';  sNomProv:='EXPRESSNET';  sNomBusq:='EXPRESSNET';  sNomBusq1:='CIA DE SERV';
            end;
            if nVeces=3 then
            begin
               sCtaTarjeta:='121030202';  sProv:='P1553';  sNomProv:='DINERS';      sNomBusq:='DINERS CLUB'; sNomBusq1:='DINERS CLUB';
            end;
            if nVeces=4 then
            begin
               sCtaTarjeta:='121030204';  sProv:='P1552';  sNomProv:='MCARD';       sNomBusq:='PROCESOS'; sNomBusq1:='PROCESOS';
            end;

            xGlosa := ' '+Quotedstr( sNomProv + ' '+xMesDes+' ')+'||CIAABR  ' ;
            xGlosa_total := ' '+Quotedstr( sNomProv + ' '+xMesDes+' ')+'||CIAABR  ' ;

            if (sTipoCNT='O') and (nVeces = 4) then
            begin
               sNomBusq := '';
               sProv := '';
               sNomProv:='';

               if DMTE.cdsCabTranf.FieldByName('TMONID').AsString = 'N' then
                  sCtaTarjeta := '12101'
               else
                  sCtaTarjeta := '12102';

               //Inicio_HPC_201702_CAJA   Contabilidad Depositos
               if sCtaTarjeta_Mov <>  '' then
                  sCtaTarjeta := sCtaTarjeta_Mov;

               IF xOrigen='28' THEN
               BEGIN
                  xGlosa := ' '+Quotedstr('DEPOSITO ' +xMoneda+' '+xMesDes)+ ' ';
                  xGlosa_total := ' '+Quotedstr('COBRANZA '+xMesDes)+ ' ' ;
               END
               ELSE
               BEGIN
                  xGlosa := ' '+Quotedstr('DEPOSITO VENTA ' +xMoneda+' '+xMesDes)+ ' ';
                  xGlosa_total := ' '+Quotedstr('DEPOSITO VENTA '+xMoneda+' '+xMesDes)+ ' ' ;
               END;
               //Fin_HPC_201702_CAJA


             //-------si el tipo de diario es 31 entonces usamos la cuenta de caja------//
// Inicio HPC_201502_CAJA
//               if xOrigen = '31' then
//               begin

                  //Inicio_HPC_201702_CAJA  Modificar los parametros de Contabilidad Depositos
                  (*if xCiaId_Mov = '07' then
                  begin
                     if xOrigen = '31' then
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '1010107'
                        else
                           sCtaTarjeta:= '1010207';
                     end
                     else
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '121030301'
                        else
                           sCtaTarjeta:= '121030302';
                     end;
                  end;
                  if xCiaId_Mov = '09' then
                  begin
                     if xOrigen = '31' then
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '1010110'
                        else
                           sCtaTarjeta:= '1010210';
                     end
                     else
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '121030301'
                        else
                           sCtaTarjeta:= '121030302';
                     end;
                  end;
                  if xCiaId_Mov = '10' then
                  begin
                     if xOrigen = '31' then
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '1010111'
                        else
                           sCtaTarjeta:= '1010211';
                     end
                     else
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '121030301'
                        else
                           sCtaTarjeta:= '121030302';
                     end;
                  end;
                  if xCiaId_Mov = '11' then
                  begin
                     if xOrigen = '31' then
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '1010112'
                        else
                           sCtaTarjeta:= '1010212';
                     end
                     else
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '121030301'
                        else
                           sCtaTarjeta:= '121030302';
                     end;
                  end;
                  if xCiaId_Mov = '12' then
                  begin
                     if xOrigen = '31' then
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '1010113'
                        else
                           sCtaTarjeta:= '1010213';
                     end
                     else
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '121030301'
                        else
                           sCtaTarjeta:= '121030302';
                     end;
                  end;
                  if xCiaId_Mov = '13' then
                  begin
                     if xOrigen = '31' then
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '1010114'
                        else
                           sCtaTarjeta:= '1010214';
                     end
                     else
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '121030301'
                        else
                           sCtaTarjeta:= '121030302';
                     end;
                  end;
                  if xCiaId_Mov = '14' then
                  begin
                     if xOrigen = '31' then
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:=  '1010115'
                        else
                           sCtaTarjeta:=  '1010215';
                     end
                     else
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '121030301'
                        else
                           sCtaTarjeta:= '121030302';
                     end;
                  end;
                  if xCiaId_Mov = '17' then
                  begin
                     if xOrigen = '31' then
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '1010117'
                        else
                           sCtaTarjeta:= '1010217';
                     end
                     else
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '121030301'
                        else
                           sCtaTarjeta:= '121030302';
                     end;
                  end;
                  if xCiaId_Mov = '18' then
                  begin
                     if xOrigen = '31' then
                     begin
                        if xMoneda = 'MN' then
   //                      sCtaTarjeta:= '121030101'
                           sCtaTarjeta:= '1010152'
                        else
   //                      sCtaTarjeta:= '121030102';
                           sCtaTarjeta:= '1010218';
                     end
                     else
                     begin
                        if xMoneda = 'MN' then
//                           sCtaTarjeta:= '121030301'
                           sCtaTarjeta:= '121030101'
                        else
//                           sCtaTarjeta:= '121030302';
                           sCtaTarjeta:= '121030102';
                     end;
                  end;
                  if xCiaId_Mov = '19' then
                  begin
                     if xOrigen = '31' then
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '1010155'
                        else
                           sCtaTarjeta:= '1010219';
                     end
                     else
                     begin
                        if xMoneda = 'MN' then
                           sCtaTarjeta:= '121030301'
                        else
                           sCtaTarjeta:= '121030302';
                     end;
                  end;*)
                  //Fin_HPC_201702_CAJA
                  
//               end;
//               else
//               begin
//                 if xMoneda = 'MN' then
//                     sCtaTarjeta:= '121030301'
//                  else
//                     sCtaTarjeta:= '121030302';
//               end;
// Fin HPC_201502_CAJA


            end;
         /////////////////////
         //     VISANET     //
         /////////////////////
         // cabecera
            xSQL := ' Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
                  + '                     CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
                  + '                     CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
                  + '                     CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
                  + '                     TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
                  + ' Select A.CIAID, '''+xOrigen+''' TDIARID, MAX((SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') FROM CNT300 Z WHERE A.CIAID=Z.CIAID AND A.ECANOMM=Z.CNTANOMM AND A.TDIARID=Z.TDIARID )) CNTCOMPROB, '
                  + '        '''+xPeriodo+''', '''+xLote+''', '+ xGlosa +' GLOSA, '+xTCambio+', '''+sFecReg+''', '
                  + '        ''I'', ''N'', NULL, '''+DMTE.wUsuario+''', SYSDATE, SYSDATE, max(b.fecano), max(b.fecmes), max(b.fecdia), '
                  + '        Max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), A.TMONID, NULL, NULL, NULL, TDIARABR, '
                  + '        SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) DMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) DME, '
                  + '        SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) HMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) HME, '
                  + '        0, 0, NULL, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+''', ''CNT'' '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE101 F '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and (A.REFER LIKE ''%'+sNomBusq+'%'' or A.REFER LIKE ''%'+sNomBusq1+'%'') AND A.CIAID IS NOT NULL '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg      +''' '
                  + '    and C.TDIARID(+)='''+xOrigen      +''' '
                  + '    and A.CIAID=F.CIAID(+) '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP = '+ QuotedStr(xNoComp)+' '
 //Inicio_HPC_201702_CAJA  Contabilidad de Filiales 
                  + '    and ' + QuotedStr(xCiaId_Mov) + ' <> ''02'' '   
 //Fin_HPC_201702_CAJA_Fin
                  + '  group by A.CIAID, A.TMONID, C.TDIARABR, CIAABR';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 1 VISANET
            xSQL := ' INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                    CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                    CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select A.CIAID, '''+xOrigen+''' TDIARID, MAX((SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)),10,''0'') FROM CNT300 Z WHERE A.CIAID=Z.CIAID AND A.ECANOMM=Z.CNTANOMM AND A.TDIARID=Z.TDIARID AND CNTESTADO=''I'' AND CNTUSER=USUMAR )) CNTCOMPROB, '
                  + '        MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', '''+xCta466+''', NULL, NULL, '
                  + '        ''20'', ''OP'', ''VARIOS'', SUBSTR(('+ xGlosa + '),1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
                  + '        SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
                  + '        SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
                  + '        '''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        SUM( CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
                  + '        SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', ''1'', ''CNT'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and (A.REFER LIKE ''%'+sNomBusq+'%'' or A.REFER LIKE ''%'+sNomBusq1+'%'') '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and A.CIAID=E.CIAID AND '''+xCta466+'''=E.CUENTAID '
                  + '    and A.CIAID=F.CIAID(+) '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP = '+ QuotedStr(xNoComp)+' '
//Inicio_HPC_201702_CAJA  Contabilidad de Filiales
                   + '    and ' + QuotedStr(xCiaId_Mov) + ' <> ''02'' '     
//Fin_HPC_201702_CAJA_Fin
                   + ' group by A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR, CIAABR';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 2 VISANET
            xSQL := ' Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                    CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                    CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select A.CIAID, '''+xOrigen+''' TDIARID, MAX((SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)),10,''0'') FROM CNT300 Z WHERE A.CIAID=Z.CIAID AND A.ECANOMM=Z.CNTANOMM AND A.TDIARID=Z.TDIARID AND CNTESTADO=''I'' AND CNTUSER=USUMAR )) CNTCOMPROB, '
                  + '        MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', '''+sCta421+''', P.CLAUXID, P.DCPAUXID, '
                  + '        P.DOCID, P.CPSERIE, P.CPNODOC, SUBSTR(('+ xGlosa + '),1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
                  + '        MAX(P.DCPMOORI) TMO, MAX(CASE WHEN A.TMONID=''N'' THEN P.DCPMOORI ELSE round(P.DCPMOORI*'+xTCambio+',2) END ) TMN, '
                  + '        MAX(CASE WHEN A.TMONID=''D'' THEN P.DCPMOORI ELSE round(P.DCPMOORI/'+xTCambio+',2) END ) TME, '
                  + '        '''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        MAX(CASE WHEN A.TMONID=''N'' THEN P.DCPMOORI ELSE round(P.DCPMOORI*'+xTCambio+',2) END) HMN, '
                  + '        MAX(CASE WHEN A.TMONID=''D'' THEN P.DCPMOORI ELSE round(P.DCPMOORI/'+xTCambio+',2) END) HME, 0, 0, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', ''2'', ''CNT'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F, CXP302 P  '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and (A.REFER LIKE ''%'+sNomBusq+'%'' or A.REFER LIKE ''%'+sNomBusq1+'%'') '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and A.CIAID=E.CIAID AND '''+sCta421+'''=E.CUENTAID '
                  + '    and A.CIAID=F.CIAID(+) '
                  + '    and A.CIAID=P.CIAID AND A.ECANOMM=P.DCPANOMM AND P.CUENTAID='''+sCta421+''' AND DCPAUXID IN ('''+sProv+''') '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP = '+ QuotedStr(xNoComp)+' '
//Inicio_HPC_201702_CAJA  Contabilidad de Filiales
                   + '    and ' + QuotedStr(xCiaId_Mov) + ' <> ''02'' '
//Fin _HPC_201702_CAJA
                   + '  group by A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR, CIAABR, P.CPNOREG, P.CLAUXID, P.DCPAUXID, P.DOCID, P.CPSERIE, P.CPNODOC';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         // DETALLE 3 VISANET
            xSQL1 :='INSERT INTO CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, '
                  + '                   CNTLOTE, CUENTAID, CLAUXID, AUXID, DOCID, CNTSERIE, '
                  + '                   CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, '
                  + '                   CNTMTOLOC, CNTMTOEXT, CNTFEMIS, CNTFVCMTO, CNTFCOMP, '
                  + '                   CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                   CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
                  + '                   CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, '
                  + '                   CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                   CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, '
                  + '                   CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                   CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) ';

         // para el tipo de diario 28 debe salir desagregado por depósito
            if (sTipoCNT='O') and (nVeces = 4) then
            begin
               xSQL2 :=
                    ' Select CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, '''+sCtaTarjeta+''' CNTCUENTA, NULL CLAUXID, NULL AUXID, '
                  + '        ''20'', ''OP'', OPERACION, (CNTGLOSA), ''H'' CNTDH, (CCOSID), (CNTTCAMBIO), (TMO), (TMN), (TME), CNTFEMIS , CNTFVCMTO, '''+sFecReg+''', (CNTESTADO), (CNTCUADRE), (CNTFAUTOM), (CNTUSER), '
                  + '        (CNTFREG), (CNTHREG), (CNTMM), (CNTDD), (CNTTRI), (CNTSEM), (CNTSS), (CNTAATRI), (CNTAASEM), (CNTAASS), '
                  + '        (TMONID), (FLAGVAR), (FCONS), (CNTFMEC), (TDIARABR), (CTAABR), (AUXDES), (DOCDES), (CCOSDES), '
                  + '        (HMN), (HME), (DMN), (DME), (S1), (S2), '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', (VAR2), (CNTPAGADO), (CNTMODDOC), ROWNUM + 1, (MODULO), (CTA_SECU) '
                  + '   From ( '
                  + '         Select A.CIAID, '''+xOrigen+''' TDIARID, '
//Inicio_HPC_201702_CAJA  Contabilidad de Filiales
                  + '                ( case when ' + QuotedStr(xCiaId_Mov) + ' <> ''02'' then (select lpad(to_char(nvl(max(CNTCOMPROB),0)),10,''0'') from CNT300 Z '        
                  + '                       where A.CIAID=Z.CIAID AND A.ECANOMM=Z.CNTANOMM AND A.TDIARID=Z.TDIARID AND CNTESTADO=''I'' AND CNTUSER=USUMAR ) '
                  + '                  else ' + QuotedStr(xNoComp) + ' end ) CNTCOMPROB, '                                                                                  
//Fin_HPC_201702_CAJA
                  + '                (b.fecano) CNTANO, '''+xPeriodo+''' CNTANOMM, '''+xLote+''' CNTLOTE, '''+xCta466+''' CNTCUENTA, NULL CLAUXID, NULL AUXID, '
                  + '                ''20'' DOCID, ''OP'' CNTSERIE, ''VARIOS'' CNTNODOC, SUBSTR(('+ xGlosa_total + '),1,40) CNTGLOSA, ''D'' CNTDH, NULL CCOSID, '+xTCambio+' CNTTCAMBIO, '
                  + '                (A.ABONO) TMO, (CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
                  + '                (CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
                  + '                A.FECHA CNTFEMIS, A.FECHA CNTFVCMTO, '''+sFecReg+''' CNTFCOMP, ''I'' CNTESTADO, ''N'' CNTCUADRE, ''N'' CNTFAUTOM, '''+DMTE.wUsuario+''' CNTUSER, '
                  + '                SYSDATE CNTFREG, SYSDATE CNTHREG, (b.fecmes) CNTMM, (b.fecdia) CNTDD, (b.fectrim) CNTTRI, (b.fecsem) CNTSEM, (b.fecss) CNTSS, (b.fecaatri) CNTAATRI, (b.fecaasem) CNTAASEM, (b.fecaass) CNTAASS, '
                  + '                A.TMONID, NULL FLAGVAR, NULL FCONS, NULL CNTFMEC, C.TDIARABR, E.CTAABR, NULL AUXDES, ''A Cuenta'' DOCDES, NULL CCOSDES, '
                  + '                (CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) DMN, '
                  + '                (CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) DME, 0 HMN, 0 HME, 0 S1, 0 S2, NULL VAR1, NULL VAR2, '
                  + '                NULL CNTPAGADO, ''CAJA'' CNTMODDOC, ''3'' CNTREG, ''CNT'' MODULO, NULL CTA_SECU, '
                  + '                A.OPERACION '
                  + '           from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
                  + '          where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '            and (A.REFER LIKE ''%'+sNomBusq+'%'' or A.REFER LIKE ''%'+sNomBusq1+'%'') '
                  + '            and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '            and B.FECHA(+)='''  +sFecReg+''' '
                  + '            and C.TDIARID(+)='''+xOrigen+''' '
                  + '            and A.CIAID=E.CIAID AND '''+xCta466+'''=E.CUENTAID '
                  + '            and A.CIAID=F.CIAID(+) '
                  + '            and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '            and A.ECNOCOMP = '+ QuotedStr(xNoComp)+' '
                  + '         union all '
//Inicio HPC_201702_CAJA  Contabilidad de Filiales
                  + '         Select A.CIAID, '''+xOrigen+''' TDIARID, '
                  + '                ( case when ' + QuotedStr(xCiaId_Mov) + ' <> ''02'' then (SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)),10,''0'') FROM CNT300 Z '
                  + '                       WHERE A.CIAID=Z.CIAID AND A.ECANOMM=Z.CNTANOMM AND A.TDIARID=Z.TDIARID AND CNTESTADO=''I'' AND CNTUSER=USUMAR ) '
                  + '                  else ' + QuotedStr(xNoComp) + ' end ) CNTCOMPROB, '
//Fin_HPC_201702_CAJA
                  + '                (b.fecano), '''+xPeriodo+''', '''+xLote+''', ''42101'', P.CLAUXID, P.DCPAUXID, '
                  + '                P.DOCID, P.CPSERIE, P.CPNODOC, SUBSTR(('+ xGlosa_total + '),1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
                  + '                (P.DCPMOORI) TMO, (CASE WHEN A.TMONID=''N'' THEN P.DCPMOORI ELSE round(P.DCPMOORI*'+xTCambio+',2) END ) TMN, '
                  + '                (CASE WHEN A.TMONID=''D'' THEN P.DCPMOORI ELSE round(P.DCPMOORI/'+xTCambio+',2) END ) TME, '
                  + '                A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '                SYSDATE, SYSDATE, (b.fecmes), (b.fecdia), (b.fectrim), (b.fecsem), (b.fecss), (b.fecaatri), (b.fecaasem), (b.fecaass), '
                  + '                A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '                (CASE WHEN A.TMONID=''N'' THEN P.DCPMOORI ELSE round(P.DCPMOORI*'+xTCambio+',2) END) HMN, '
                  + '                (CASE WHEN A.TMONID=''D'' THEN P.DCPMOORI ELSE round(P.DCPMOORI/'+xTCambio+',2) END) HME, 0, 0, 0, 0, NULL, NULL, '
                  + '                NULL, ''CAJA'', ''3'', ''CNT'', NULL, '
                  + '                A.OPERACION '
                  + '           from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F, CXP302 P  '
                  + '          where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '            and (A.REFER LIKE ''%'+sNomBusq+'%'' or A.REFER LIKE ''%'+sNomBusq1+'%'') '
                  + '            and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '            and B.FECHA(+)='''  +sFecReg+''' '
                  + '            and C.TDIARID(+)='''+xOrigen+''' '
                  + '            and A.CIAID=E.CIAID AND '''+xCta466+'''=E.CUENTAID '
                  + '            and A.CIAID=F.CIAID(+) '
                  + '            and A.CIAID=P.CIAID AND A.ECANOMM=P.DCPANOMM AND P.CUENTAID='''+sCta421+''' AND DCPAUXID IN ('''+sProv+''') '
                  + '            and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '            and A.ECNOCOMP = '+ QuotedStr(xNoComp)+' '
                  + '           ) ';
            end
            else
            begin
               xSQL2 :=
                    ' Select CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, '''+sCtaTarjeta+''' CNTCUENTA, NULL CLAUXID, NULL AUXID, '
                  + '            ''20'', ''OP'', ''VARIOS'', MAX(CNTGLOSA), ''H'' CNTDH, MAX(CCOSID), max(CNTTCAMBIO), sum(TMO), sum(TMN), sum(TME), '            +  ''''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', MAX(CNTESTADO), MAX(CNTCUADRE), MAX(CNTFAUTOM), MAX(CNTUSER), '
                  + '            max(CNTFREG), max(CNTHREG), max(CNTMM), max(CNTDD), max(CNTTRI), max(CNTSEM), max(CNTSS), max(CNTAATRI), max(CNTAASEM), max(CNTAASS), '
                  + '            MAX(TMONID), max(FLAGVAR), max(FCONS), max(CNTFMEC), max(TDIARABR), max(CTAABR), max(AUXDES), max(DOCDES), max(CCOSDES), '
                  + '            SUM(HMN), SUM(HME), SUM(DMN), SUM(DME), SUM(S1), SUM(S2), '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', max(VAR2), max(CNTPAGADO), max(CNTMODDOC), max(CNTREG), max(MODULO), max(CTA_SECU) '
                  + '   From ( '
                  + '         Select A.CIAID, '''+xOrigen+''' TDIARID, MAX((SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)),10,''0'') FROM CNT300 Z WHERE A.CIAID=Z.CIAID AND A.ECANOMM=Z.CNTANOMM AND A.TDIARID=Z.TDIARID AND CNTESTADO=''I'' AND CNTUSER=USUMAR )) CNTCOMPROB, '
                  + '                MAX(b.fecano) CNTANO, '''+xPeriodo+''' CNTANOMM, '''+xLote+''' CNTLOTE, '''+xCta466+''' CNTCUENTA, NULL CLAUXID, NULL AUXID, '
                  + '                ''20'' DOCID, ''OP'' CNTSERIE, ''VARIOS'' CNTNODOC, SUBSTR(('+ xGlosa_total + '),1,40) CNTGLOSA, ''D'' CNTDH, NULL CCOSID, '+xTCambio+' CNTTCAMBIO, '
                  + '                SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
                  + '                SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
                  + '                '''+sFecReg+''' CNTFEMIS, '''+sFecReg+''' CNTFVCMTO, '''+sFecReg+''' CNTFCOMP, ''I'' CNTESTADO, ''N'' CNTCUADRE, ''N'' CNTFAUTOM, '''+DMTE.wUsuario+''' CNTUSER, '
                  + '                SYSDATE CNTFREG, SYSDATE CNTHREG, MAX(b.fecmes) CNTMM, MAX(b.fecdia) CNTDD, MAX(b.fectrim) CNTTRI, MAX(b.fecsem) CNTSEM, MAX(b.fecss) CNTSS, MAX(b.fecaatri) CNTAATRI, MAX(b.fecaasem) CNTAASEM, MAX(b.fecaass) CNTAASS, '
                  + '                A.TMONID, NULL FLAGVAR, NULL FCONS, NULL CNTFMEC, C.TDIARABR, E.CTAABR, NULL AUXDES, ''A Cuenta'' DOCDES, NULL CCOSDES, '
                  + '                SUM( CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) DMN, '
                  + '                SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) DME, 0 HMN, 0 HME, 0 S1, 0 S2, NULL VAR1, NULL VAR2, '
                  + '                NULL CNTPAGADO, ''CAJA'' CNTMODDOC, ''3'' CNTREG, ''CNT'' MODULO, NULL CTA_SECU '
                  + '           from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
                  + '          where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '            and (A.REFER LIKE ''%'+sNomBusq+'%'' or A.REFER LIKE ''%'+sNomBusq1+'%'') '
                  + '            and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '            and B.FECHA(+)='''  +sFecReg+''' '
                  + '            and C.TDIARID(+)='''+xOrigen+''' '
                  + '            and A.CIAID=E.CIAID AND '''+xCta466+'''=E.CUENTAID '
                  + '            and A.CIAID=F.CIAID(+) '
                  + '            and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '            and A.ECNOCOMP = '+ QuotedStr(xNoComp)+' '
                  + '          group by A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR, CIAABR '
                  + '         union all '
                  + '         Select A.CIAID, '''+xOrigen+''' TDIARID, MAX((SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)),10,''0'') FROM CNT300 Z WHERE A.CIAID=Z.CIAID AND A.ECANOMM=Z.CNTANOMM AND A.TDIARID=Z.TDIARID AND CNTESTADO=''I'' AND CNTUSER=USUMAR )) CNTCOMPROB, '
                  + '                MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', ''42101'', P.CLAUXID, P.DCPAUXID, '
                  + '                P.DOCID, P.CPSERIE, P.CPNODOC, SUBSTR(('+ xGlosa_total + '),1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
                  + '                MAX(P.DCPMOORI) TMO, MAX(CASE WHEN A.TMONID=''N'' THEN P.DCPMOORI ELSE round(P.DCPMOORI*'+xTCambio+',2) END ) TMN, '
                  + '                MAX(CASE WHEN A.TMONID=''D'' THEN P.DCPMOORI ELSE round(P.DCPMOORI/'+xTCambio+',2) END ) TME, '
                  + '                '''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '                SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
                  + '                A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '                MAX(CASE WHEN A.TMONID=''N'' THEN P.DCPMOORI ELSE round(P.DCPMOORI*'+xTCambio+',2) END) HMN, '
                  + '                MAX(CASE WHEN A.TMONID=''D'' THEN P.DCPMOORI ELSE round(P.DCPMOORI/'+xTCambio+',2) END) HME, 0, 0, 0, 0, NULL, NULL, '
                  + '                NULL, ''CAJA'', ''3'', ''CNT'', NULL '
                  + '           from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F, CXP302 P  '
                  + '          where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '            and (A.REFER LIKE ''%'+sNomBusq+'%'' or A.REFER LIKE ''%'+sNomBusq1+'%'') '
                  + '            and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '            and B.FECHA(+)='''  +sFecReg+''' '
                  + '            and C.TDIARID(+)='''+xOrigen+''' '
                  + '            and A.CIAID=E.CIAID AND '''+xCta466+'''=E.CUENTAID '
                  + '            and A.CIAID=F.CIAID(+) '
                  + '            and A.CIAID=P.CIAID AND A.ECANOMM=P.DCPANOMM AND P.CUENTAID='''+sCta421+''' AND DCPAUXID IN ('''+sProv+''') '
                  + '            and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '            and A.ECNOCOMP = '+ QuotedStr(xNoComp)+' '
                  + '          group by A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR, CIAABR, P.CPNOREG, P.CLAUXID, P.DCPAUXID, P.DOCID, P.CPSERIE, P.CPNODOC '
                  + '           ) '
                  + ' group by CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE';
            end;
            xSQL:=xSQL1+xSQL2;
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
         end;
         DMTE.cdsQry7.Next;
      end;
      ShowMessage('Contabización OK');
   except
      ShowMessage('Error al Contabilizar');
   end;
end;
// Fin HPC_201501_CAJA

procedure TFTarjetaImportar.Z2bbtnSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFTarjetaImportar.dbgDescagoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  xSQL : String;
begin
	if (Key=VK_DELETE) and (ssCtrl in Shift)  then  //^Del
	begin
     if MessageDlg('¿ Seguro de Eliminar Detalle ?',mtConfirmation,
									[mbYes, mbNo], 0)=mrYes then
     begin
        try
           xSQL:='delete from CAJ_TAR_CRE_DET where NUMERO='''+DMTE.cdsCabTranf.FieldByname('NUMERO').AsString+'''';
           DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
           xSQL:='delete from CAJ_TAR_CRE_CAB where NUMERO='''+DMTE.cdsCabTranf.FieldByname('NUMERO').AsString+'''';
           DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
           bbtnBuscarClick(Self);
           ShowMessage('Elimación OK');
        except
           ShowMessage('Error al Eliminar');
        end;
     end;
  end;
end;


function TFTarjetaImportar.MesCerrado(xMes, xAno, xCiaid: String): Boolean;
var
 xSql : String;
begin

  if xMes='00' then
     xMes:='01';

  xSql := 'SELECT PER'+DMte.strzero(xMes,2)+' FROM TGE154 WHERE CIAID='+quotedstr(xCiaid)+
          ' AND ANO='+quotedstr(xAno);
  DMTE.cdsQry.IndexFieldNames:='';
  DMTE.cdsQry.Close;
  DMTE.cdsQry.DataRequest(xSql);
  DMTE.cdsQry.Open;
  If DMTE.cdsQry.FieldByName('PER'+dmte.strzero(xMes,2)).AsString = 'S' then
   result := True
  else result := False;
end;

procedure TFTarjetaImportar.BitBtn2Click(Sender: TObject);
var
   dFecIni, dFecFin : TDate;
   i : Integer;
   xSQL, sLine, sDato, sBus, cMes, cSepara : String;
   nPosI, nPosF, nMes : Integer;
   //inicio SAR2010-0213   DAD-AS-2010-0010
   xMoneda : String;
   //fin SAR2010-0213
// Inicio: HPC_201311_BAN
   xwAno, xwMes, xwDia : word;
   xPeriodo : String;
// Fin: HPC_201311_BAN
begin
   if not sdGraba.Execute then Exit;

   try
      cMes:=DMTE.StrZero(IntToStr(seMes.value),2);

   // Inicio: HPC_201311_BAN
      xPeriodo := seAno.Text + cMes;
      dFecIni:=StrTodate('01/'+cMes+'/'+Copy(seAno.Text,1,4));

      decodedate(dateS, xwAno, xwMes, xwDia);
      if seMes.Value = xwMes then
         dFecFin:=dateS
      else
      begin
         if cMes='12' then
            dFecFin:=StrTodate('31/'+Copy(xPeriodo,5,2)+'/'+Copy(xPeriodo,1,4))
         else
         begin
            nMes:=StrToInt(Copy(xPeriodo,5,2))+1;
            dFecFin:=StrTodate('01/'+ DMTE.StrZero(IntToStr(nMes),2) +'/'+Copy(xPeriodo,1,4))-1;
         end;
      end;
   // Fin HPC_201311_BAN

      scData.Lines.LoadFromFile( sdGraba.FileName);

      xSQL:='Select LPAD(TO_CHAR(NVL(TO_NUMBER(MAX(NUMERO)),0)+1),6,''0'') NUMMAX from CAJ_TAR_CRE_CAB';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest( xSQL );
      DMTE.cdsQry.Open;

      sLine:=Copy(scData.Lines.Strings[0],2,Length(scData.Lines.Strings[0]));
      sLine:=Copy(sLine,1,Length(sLine));
      if pos('","',sLine)>0 then
         cSepara:='","'
      else
         cSepara:='";"';

      nPosF:=Pos( cSepara, sLine );
      sLine:=Copy(sLine,nPosF+3,Length(sLine));

      nPosF:=Pos( ' ', sLine );
      sDato:=TRIM(Copy(sLine,1,nPosF));
      //inicio SAR2010-0213   DAD-AS-2010-0010
      sLine:=Copy(scData.Lines.Strings[1],11,5);
      if Copy(scData.Lines.Strings[1],11,1) = 'D' then
         xMoneda := 'D'
      else
         xMoneda := 'N';
      //fin SAR2010-0213

      DMTE.cdsCabTranf.Insert;
      DMTE.cdsCabTranf.FieldByname('NUMERO').AsString  :=DMTE.cdsQry.FieldByname('NUMMAX').AsString;
      DMTE.cdsCabTranf.FieldByname('FECHA').AsDateTime :=dFecFin;
      DMTE.cdsCabTranf.FieldByname('CNTANOMM').AsString:=Copy(dateToStr(dFecFin),7,4)+Copy(dateToStr(dFecFin),4,2);
      DMTE.cdsCabTranf.FieldByname('USUARIO').AsString :=DMTE.wUsuario;
      DMTE.cdsCabTranf.FieldByname('FREG').AsDateTime  :=Date;
      //inicio SAR2010-0213   DAD-AS-2010-0010
      //DMTE.cdsCabTranf.FieldByname('TMONID').AsString  :='N';
      DMTE.cdsCabTranf.FieldByname('TMONID').AsString  :=xMoneda;
      ////fin SAR2010-0213

      //Inicio_HPC_201702_CAJA   Asignar lote
      DMTE.cdsCabTranf.FieldByname('LOTE').AsString  :='DBAN';
      //Fin_HPC_201702_CAJA

      DMTE.cdsCabTranf.FieldByname('CCBCOID').AsString :=sDato;
      DMTE.cdsCabTranf.Post;
      DMTE.cdsCabTranf.ApplyUpdates(0);

   // Inicio HPC_201502_CAJA
      xSQL:='Select NUMERO, ITEM, FECHA, REFER, CARGO, ABONO, AGENCIA, OPERACION, '
          + '       MARCA, CIAID, TDIARID, ECANOMM, ECNOCOMP, USUARIO, FREG, '
          + '       TMONID, USUMAR '
          + '  from CAJ_TAR_CRE_DET '
          + ' where NUMERO='+quotedstr(DMTE.cdsCabTranf.FieldByname('NUMERO').AsString);
   // Fin HPC_201502_CAJA
      DMTE.cdsTarCreTransf.Close;
      DMTE.cdsTarCreTransf.DataRequest( xSQL );
      DMTE.cdsTarCreTransf.Open;
      sBus:= ';';

      For i:=1 to scData.Lines.Count-1 do
      begin
          sLine:=Copy(scData.Lines.Strings[i],2,Length(scData.Lines.Strings[i]));
          nPosF:=Pos( ';', sLine );
          sDato:=Copy(sLine,1,nPosF-2);

          if pos('/',Copy(sLine,1,5))>0 then
          begin
             sLine:=Copy(sLine,1,Length(sLine));
             if pos('","',sLine)>0 then
                cSepara:='","'
             else
                cSepara:='";"';
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,1,nPosF-1);

            DMTE.cdsTarCreTransf.Insert;
            DMTE.cdsTarCreTransf.FieldByname('NUMERO').AsString :=DMTE.cdsCabTranf.FieldByname('NUMERO').AsString;
            DMTE.cdsTarCreTransf.FieldByName('ITEM').AsString   :=DMTE.StrZero(IntToStr(i),4);
            DMTE.cdsTarCreTransf.FieldByName('FECHA').AsString  :=sDato;

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,1,nPosF-1);

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,2,nPosF-2);
            DMTE.cdsTarCreTransf.FieldByName('REFER').AsString    :=sDato;

            //Inicio_HPC_201702_CAJA  Modificar cargo o abono en grid
            (*if cSepara='";"' then
            begin
               nPosF:=Pos( cSepara, sLine );
               sDato:=Copy(sLine,2,nPosF-2);
               DMTE.cdsTarCreTransf.FieldByName('CARGO').AsString    :=StringReplace(StringReplace(StringReplace(sDato,',','',[rfReplaceAll]),'(','',[rfReplaceAll]),')','',[rfReplaceAll]);
               sLine:=Copy(sLine,nPosF+2,Length(sLine));
            end;*)

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,2,nPosF-2);
            if  (strtofloat(StringReplace(sDato,',','',[rfReplaceAll])) < 0) then
               DMTE.cdsTarCreTransf.FieldByName('CARGO').AsString    :=StringReplace(StringReplace(sDato,'-','',[rfReplaceAll]),',','',[rfReplaceAll])
            else
               DMTE.cdsTarCreTransf.FieldByName('ABONO').AsString    :=StringReplace(sDato,',','',[rfReplaceAll]);
            //Fin_HPC_201702_CAJA

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,2,nPosF-2);

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,2,nPosF-2);
            DMTE.cdsTarCreTransf.FieldByName('AGENCIA').AsString  :=sDato;

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,2,nPosF-2);
            DMTE.cdsTarCreTransf.FieldByName('OPERACION').AsString:=sDato;
            //inicio SAR2010-0213   DAD-AS-2010-0010
            //DMTE.cdsTarCreTransf.FieldByName('TMONID').AsString   :='N';
            DMTE.cdsTarCreTransf.FieldByName('TMONID').AsString   :=xMoneda;
            //fin SAR2010-0213
            DMTE.cdsTarCreTransf.FieldByName('USUARIO').AsString  :=DMTE.wUsuario;
            DMTE.cdsTarCreTransf.FieldByName('FREG').Asdatetime   :=date;
            DMTE.cdsTarCreTransf.Post;
          end;
      end;
      //inicio SAR2010-0213   DAD-AS-2010-0010
      //DMTE.cdsTarCreTransf.ApplyUpdates(0);
      try
         if DMTE.cdsTarCreTransf.ApplyUpdates(0)>0 then
            ShowMessage('Error al grabar');
      except
         ShowMessage('Error : Al Grabar Detalle');
         Exit;
      end;
      //fin SAR2010-0213
   except
      ShowMessage('Error : Al Leer Archivo, Verificar si es el Correcto');
      Exit;
   end;
end;
//inicio SAR2010-0213   DAD-AS-2010-0010
//invocamos a la funcionalidad original de que contabiliza
//las tarjetas de crédito debido al error en los asientos de las filiales.
procedure TFTarjetaImportar.ContabTarjeta();

var
   xSQL, xSQL1, xSQL2, xSQL3, xTCambio, xPeriodo, xOrigen, xLote, xWhere : String;
   cMes, xCia, xCta166, xCta466, sCta421, xNoComp, xCtaBan, xCtaBan1, xMesDes, xMesMM, xMesGlosa, sFecReg : String;
   sCtaTarjeta, sProv, sNomProv, sNomBusq, sNomBusq1, sTipoCNT : String;
   dFecFin : tDATE;
   nmes, nVeces : Integer;
   xwAno, xwMes, xwDia : word; // HPC_201311_BAN
//Inicio HPC_201702_CAJA
   sTipMon : String;
//Fin_HPC_201702_CAJA
begin
   xCia    :='02';
   xOrigen :='46';
   xPeriodo:=DMTE.cdsCabTranf.FieldByname('CNTANOMM').AsString;

   If MesCerrado(copy(xPeriodo,5,2),copy(xPeriodo,1,4),xCia) then
   begin
      ShowMessage(' Mes cerrado, no se puede contabilizar');
      exit;
   end;


   xSQL:='select * FROM CNT300 WHERE CIAID='''+xCia+''' AND TDIARID='''+xOrigen+''' and CNTANOMM='''+xPeriodo+''' and CNTUSER='''+DMTE.wUsuario+''' and DOCMOD='''  +DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+'''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.indexfieldnames:='';
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   if DMTE.cdsQry.RecordCount>0 then
   begin
      if MessageDlg('Existen Asientos Contables Generados por esta transacción.'+
                    '   ¿ Desea Eliminar y volver a generar los Asientos ?   ',mtConfirmation,
	  								[mbYes, mbNo], 0)=mrNo then Exit;
   end
   else
   begin
      xSQL:='select * FROM CNT311 WHERE CIAID='''+xCia+''' AND TDIARID='''+xOrigen+''' and CNTANOMM='''+xPeriodo+''' and CNTUSER='''+DMTE.wUsuario+''' and CAMPOVAR='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+'''';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest( xSQL );
      DMTE.cdsQry.Open;
      if DMTE.cdsQry.RecordCount>0 then
      begin
         if MessageDlg('Existen Asientos Contables Generados por esta transacción.'+
                       '   ¿ Desea Eliminar y volver a generar los Asientos ?   ',mtConfirmation,
                       [mbYes, mbNo], 0)=mrNo then Exit;
      end
      else
      begin
         xSQL:='select * FROM CNT311 WHERE CIAID='''+xCia+''' AND TDIARID='''+xOrigen+''' and CNTANOMM='''+xPeriodo+''' and CNTUSER='''+DMTE.wUsuario+''' and CAMPOVAR='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+'''';
         DMTE.cdsQry.Close;
         DMTE.cdsQry.DataRequest( xSQL );
         DMTE.cdsQry.Open;
         if DMTE.cdsQry.RecordCount>0 then
         begin
            if MessageDlg('Existen Asientos Contables Generados por esta transacción.'+
                          '   ¿ Desea Eliminar y volver a generar los Asientos ?   ',mtConfirmation,
                          [mbYes, mbNo], 0)=mrNo then Exit;
         end;
      end;
   end;

   if MessageDlg('Para Contabilizar debe haber registrado los movimientos '+
                 'de todas las Tarjetas de credito'+chr(13)+chr(13)+
                 '     ¿ Esta seguro de Contabilizar ?   ',mtConfirmation,
									[mbYes, mbNo], 0)=mrNo then Exit;


   xSQL:='SELECT TO_CHAR(max(FECHA),''MM'') MM, TO_CHAR(max(FECHA),''MONTH'') Fecha FROM CAJ_TAR_CRE_DET A '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +'and CIAID IS NOT NULL';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   xMesGlosa:=DMTE.cdsQry.FieldByName('FECHA').AsString;
   xMesMM:=DMTE.cdsQry.FieldByName('MM').AsString;


   xSQL:='SELECT * FROM TGE106 WHERE CIAID=''02'' AND BANCOID=''03'' '
        +'and CCBCOID='''+DMTE.cdsCabTranf.FieldByName('CCBCOID').AsString+'''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.indexfieldnames:='';
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   xCtaBan:=DMTE.cdsQry.FieldByName('CTAPRINC').AsString;
   IF xMesMM = copy(xPeriodo,5,2) THEN
   BEGIN
      xCtaBan1:=DMTE.cdsQry.FieldByName('CTAPRINC').AsString;
   END
   ELSE
   BEGIN
      xCtaBan1:=DMTE.cdsQry.FieldByName('CTAOPEXLIQ').AsString;
   END;

   xLote  :='TARJ';
   //xCtaBan:='104010305';
   xCta466:='46602';

//Inicio HPC_201702_CAJA  Tipo de Moneda del Movimiento
   if DMTE.cdsCabTranf.FieldByName('TMONID').AsString='N' then
      sCta421:='42101'
   else
      sCta421:='42102';
//Fin_HPC_201702_CAJA

// Inicio HPC_201311_BAN
   decodedate(dateS, xwAno, xwMes, xwDia);
   if seMes.Value = xwMes then
      dFecFin:=dateS
   else
   begin
      cMes:=Copy(xPeriodo,5,2);
      if cMes='12' then
         dFecFin:=StrTodate('31/'+Copy(xPeriodo,5,2)+'/'+Copy(xPeriodo,1,4))
      else
      begin
         nMes:=StrToInt(Copy(xPeriodo,5,2))+1;
         dFecFin:=StrTodate('01/'+ DMTE.StrZero(IntToStr(nMes),2) +'/'+Copy(xPeriodo,1,4))-1;
      end;
   end;
// Fin HPC_201311_BAN
   sFecReg:=DateToStr(dFecFin);

 try
   xSQL:='SELECT MESDESL FROM TGE181 WHERE MESIDR='''+xMesMM+'''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.indexfieldnames:='';
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   xMesDes:=DMTE.cdsQry.FieldByName('MESDESL').AsString;
   xTCambio:='0';
   xWhere:='TMONID='+QuotedStr(DMTE.wTMonExt)+' and FECHA='''+sFecReg+'''';
   xTCambio:=DMTE.DisplayDescrip('prvTGE','TGE107','TMONID, TCAMVOV',xWhere,'TCAMVOV');
   if xTCambio='' then xTCambio:='0';
   if StrToFloat(xTCambio)<=0 then
   begin
      ShowMessage('Falta ingresar el Tipo de Cambio');
      Exit;
   end;

   xSQL:='SELECT CIAID FROM CNT300 '
        +'WHERE CIAID>='''+xCia+''' AND TDIARID='''+xOrigen+''' and CNTANOMM='''+xPeriodo+''' '
        + ' and CNTUSER='''+DMTE.wUsuario+''' and CNTESTADO=''P'' '
        + ' and DOCMOD='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+'''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   if DMTE.cdsQry.RecordCount>0 then
   begin
      Showmessage('Usuario NO se puede contabilizar. Existen asientos aceptados en Contabilidad, Verificar....');
      Exit;
   end;

   xSQL:='DELETE FROM CNT300 WHERE CIAID='''+xCia+''' AND TDIARID='''+xOrigen+''' and CNTANOMM='''+xPeriodo+''' and CNTUSER='''+DMTE.wUsuario+''' and DOCMOD='''  +DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+'''';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   xSQL:='DELETE FROM CNT311 WHERE CIAID='''+xCia+''' AND TDIARID='''+xOrigen+''' and CNTANOMM='''+xPeriodo+''' and CNTUSER='''+DMTE.wUsuario+''' and CAMPOVAR='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+'''';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   xSQL:='DELETE FROM CNT301 WHERE CIAID='''+xCia+''' AND TDIARID='''+xOrigen+''' and CNTANOMM='''+xPeriodo+''' and CNTUSER='''+DMTE.wUsuario+''' and CAMPOVAR='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+'''';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   xSQL:='DELETE FROM CNT300 WHERE CIAID>'''+xCia+''' AND TDIARID='''+xOrigen+''' and CNTANOMM='''+xPeriodo+''' and CNTUSER='''+DMTE.wUsuario+''' and DOCMOD='''  +DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+'''';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   xSQL:='DELETE FROM CNT311 WHERE CIAID>'''+xCia+''' AND TDIARID='''+xOrigen+''' and CNTANOMM='''+xPeriodo+''' and CNTUSER='''+DMTE.wUsuario+''' and CAMPOVAR='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+'''';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
   xSQL:='DELETE FROM CNT301 WHERE CIAID>'''+xCia+''' AND TDIARID='''+xOrigen+''' and CNTANOMM='''+xPeriodo+''' and CNTUSER='''+DMTE.wUsuario+''' and CAMPOVAR='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+'''';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   /// verifica si contabilizacion es de tarjetas de credito

   sTipoCNT:='O';

   xSQL:='SELECT CIAID FROM CAJ_TAR_CRE_DET A '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and A.REFER LIKE ''%VISANET%'' AND CIAID IS NOT NULL';
   DMTE.cdsTarCreTransf.Close;
   DMTE.cdsTarCreTransf.IndexFieldNames:='';
   DMTE.cdsTarCreTransf.DataRequest( xSQL );
   DMTE.cdsTarCreTransf.Open;

   if DMTE.cdsTarCreTransf.RecordCount>0 then
      sTipoCNT:='T';

   if sTipoCNT='O' then
   begin

       xSQL:='SELECT CIAID FROM CAJ_TAR_CRE_DET A '
            +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
            +  'and (A.REFER LIKE ''%EXPRESSNET%'' or A.REFER LIKE ''%CIA DE SERV%'') AND CIAID IS NOT NULL';
       DMTE.cdsTarCreTransf.Close;
       DMTE.cdsTarCreTransf.DataRequest( xSQL );
       DMTE.cdsTarCreTransf.Open;

       if DMTE.cdsTarCreTransf.RecordCount>0 then
          sTipoCNT:='T';
   end;

   if sTipoCNT='O' then
   begin
       xSQL:='SELECT CIAID FROM CAJ_TAR_CRE_DET A '
            +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
            +  'and A.REFER LIKE ''%DINERS CLUB%'' AND CIAID IS NOT NULL';
       DMTE.cdsTarCreTransf.Close;
       DMTE.cdsTarCreTransf.DataRequest( xSQL );
       DMTE.cdsTarCreTransf.Open;

       if DMTE.cdsTarCreTransf.RecordCount>0 then
          sTipoCNT:='T';
   end;

   if sTipoCNT='O' then
   begin
       xSQL:='SELECT CIAID FROM CAJ_TAR_CRE_DET A '
            +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
            +  'and A.REFER LIKE ''%PROCESOS%'' AND CIAID IS NOT NULL';
       DMTE.cdsTarCreTransf.Close;
       DMTE.cdsTarCreTransf.DataRequest( xSQL );
       DMTE.cdsTarCreTransf.Open;

       if DMTE.cdsTarCreTransf.RecordCount>0 then
          sTipoCNT:='T';
   end;

   ////////////////////////////////////////
   ////////////////////////////////////////

   //if DMTE.cdsCabTranf.FieldByname('CCBCOID').AsString<>'' then
   if sTipoCNT='O' then
   begin

   /////////////////////
   //      OTRAS      //
   /////////////////////
   xSQL:='SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
        +'WHERE CIAID='''+xCia+''' AND CNTANOMM='''+xPeriodo+''' AND TDIARID='''+xOrigen+'''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   xNoComp:=DMTE.cdsQry.FieldByName('NOCOMP').AsString;

   xSQL:='SELECT CIAID FROM CAJ_TAR_CRE_DET A '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'AND CIAID IS NOT NULL';
   DMTE.cdsTarCreTransf.Close;
   DMTE.cdsTarCreTransf.DataRequest( xSQL );
   DMTE.cdsTarCreTransf.Open;

//Inicio HPC_201702_CAJA  Tipo de Moneda del Movimiento
   if DMTE.cdsCabTranf.FieldByName('TMONID').AsString='N' then
      sTipMon:='MN'
   else
      sTipMon:='ME';
//Fin_HPC_201702_CAJA


//Inicio HPC_201702_CAJA  Grabar Asiento
   // cabecera
   xSQL:='INSERT INTO CNT300 (CIAID, TDIARID, CNTCOMPROB, '
        +  'CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
        +  'CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
        +  'CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
        +  'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
        +'Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''', '
        +  ''''+xPeriodo+''', '''+xLote+''', ''VISANET '+sTipMon+' '+xMesDes+' HOTELES'' GLOSA, '+xTCambio+', '''+sFecReg+''', '
        +  '''I'', ''N'', NULL, '''+DMTE.wUsuario+''', SYSDATE, SYSDATE, max(b.fecano), max(b.fecmes), max(b.fecdia), '
        +  'Max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), A.TMONID, NULL, NULL, NULL, '
        +  'TDIARABR, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) DMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) DME, '
        +  'SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) HMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) HME, '
        +  '0, 0, NULL, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+''', ''CAJA'' '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'AND CIAID IS NOT NULL '
        +  'and A.USUMAR='''    +DMTE.wUsuario+''' '
        +  'AND B.FECHA(+)='''  +sFecReg      +''' '
        +  'AND C.TDIARID(+)='''+xOrigen      +''' '
        +'GROUP BY A.TMONID, C.TDIARABR';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 1 VISANET
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , b.fecano, '''+xPeriodo+''', '''+xLote+''', '''+xCtaBan1+''', NULL, NULL, '
        +  '''20'', ''OP'', OPERACION, SUBSTR(''VISANET '+sTipMon+' '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
        +  'A.ABONO, CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END TMN, '
        +  'CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END TME, '
        +  'A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
        +  'SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem, b.fecaass, '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  'CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END HMN, '
        +  'CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END HME, 0, 0, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
        +  'NULL, ''CAJA'', ROWNUM, ''CAJA'', NULL '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and A.USUMAR='''    +DMTE.wUsuario+''' '
        +  'AND B.FECHA(+)='''  +sFecReg+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=E.CIAID AND '''+xCtaBan+'''=E.CUENTAID '
        +  'AND A.CIAID=F.CIAID(+)';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 2 VISANET
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', G.CTADEBE, NULL, NULL, '
        +  '''20'', ''OP'', ''VARIOS'', SUBSTR(''VISANET '+sTipMon+' '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''H'', NULL, '+xTCambio+', '
        +  'SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
        +  ''''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
        +  'SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  '0, 0, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
        +  'SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
        +  'NULL, ''CAJA'', '+IntToStr(DMTE.cdsTarCreTransf.RecordCount+1)+', ''CAJA'', NULL '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, CAJA103 G, TGE202 E, TGE101 F  '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and A.USUMAR='''    +DMTE.wUsuario+''' '
        +  'AND B.FECHA(+)='''  +sFecReg+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=G.CIAID '
        +  'AND A.CIAID=E.CIAID AND G.CTADEBE=E.CUENTAID '
        +  'AND A.CIAID=F.CIAID(+) '
        +'GROUP BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR,  G.CTADEBE, CIAABR';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // Grabar en los registros marcados el asiento contable al que pertenecen
   xSQL:='Update CAJ_TAR_CRE_DET SET TDIARID='''+xOrigen+''', ECNOCOMP='''+xNoComp+''', ECANOMM='''+xPeriodo+''' '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and USUMAR='''+DMTE.wUsuario+'''';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
//Fin HPC_201702_CAJA


   end
   else
   begin

   ////////////////////////////////////////
   ////////////////////////////////////////


   /////////////////////
   //     VISANET     //
   /////////////////////
   xSQL:='SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
        +'WHERE CIAID='''+xCia+''' AND CNTANOMM='''+xPeriodo+''' AND TDIARID='''+xOrigen+'''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   xNoComp:=DMTE.cdsQry.FieldByName('NOCOMP').AsString;

   xSQL:='SELECT CIAID FROM CAJ_TAR_CRE_DET A '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and A.REFER LIKE ''%VISANET%'' AND CIAID IS NOT NULL';
   DMTE.cdsTarCreTransf.Close;
   DMTE.cdsTarCreTransf.DataRequest( xSQL );
   DMTE.cdsTarCreTransf.Open;

//Inicio HPC_201702_CAJA Tipo de Moneda
   if DMTE.cdsCabTranf.FieldByName('TMONID').AsString='N' then
      sTipMon:='MN'
   else
      sTipMon:='ME';
//Fin   HPC_201702_CAJA
   

//Inicio HPC_201702_CAJA  Grabar Asiento
   // cabecera
   xSQL:='INSERT INTO CNT300 (CIAID, TDIARID, CNTCOMPROB, '
        +  'CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
        +  'CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
        +  'CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
        +  'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
        +'Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''', '
        +  ''''+xPeriodo+''', '''+xLote+''', ''VISANET '+sTipMon+' '+xMesDes+' HOTELES'' GLOSA, '+xTCambio+', '''+sFecReg+''', '
        +  '''I'', ''N'', NULL, '''+DMTE.wUsuario+''', SYSDATE, SYSDATE, max(b.fecano), max(b.fecmes), max(b.fecdia), '
        +  'Max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), A.TMONID, NULL, NULL, NULL, '
        +  'TDIARABR, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) DMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) DME, '
        +  'SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) HMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) HME, '
        +  '0, 0, NULL, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+''', ''CAJA'' '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and A.REFER LIKE ''%VISANET%'' AND CIAID IS NOT NULL '
        +  'and A.USUMAR='''    +DMTE.wUsuario+''' '
        +  'AND B.FECHA(+)='''  +sFecReg      +''' '
        +  'AND C.TDIARID(+)='''+xOrigen      +''' '
        +'GROUP BY A.TMONID, C.TDIARABR';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 1 VISANET
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , b.fecano, '''+xPeriodo+''', '''+xLote+''', '''+xCtaBan1+''', NULL, NULL, '
        +  '''20'', ''OP'', OPERACION, SUBSTR('' VISANET '+sTipMon+' '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
        +  'A.ABONO, CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END TMN, '
        +  'CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END TME, '
        +  'A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
        +  'SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem, b.fecaass, '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  'CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END HMN, '
        +  'CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END HME, 0, 0, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
        +  'NULL, ''CAJA'', ROWNUM, ''CAJA'', NULL '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and A.REFER LIKE ''%VISANET%'' '
        +  'and A.USUMAR='''    +DMTE.wUsuario+''' '
        +  'AND B.FECHA(+)='''  +sFecReg+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=E.CIAID AND '''+xCtaBan+'''=E.CUENTAID '
        +  'AND A.CIAID=F.CIAID(+)';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 2 VISANET
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', G.CTADEBE, NULL, NULL, '
        +  '''20'', ''OP'', ''VARIOS'', SUBSTR('' VISANET '+sTipMon+' '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''H'', NULL, '+xTCambio+', '
        +  'SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
        +  ''''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
        +  'SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  '0, 0, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
        +  'SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
        +  'NULL, ''CAJA'', '+IntToStr(DMTE.cdsTarCreTransf.RecordCount+1)+', ''CAJA'', NULL '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, CAJA103 G, TGE202 E, TGE101 F  '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and A.REFER LIKE ''%VISANET%'' '
        +  'and A.USUMAR='''    +DMTE.wUsuario+''' '
        +  'AND B.FECHA(+)='''  +sFecReg+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=G.CIAID '
        +  'AND A.CIAID=E.CIAID AND G.CTADEBE=E.CUENTAID '
        +  'AND A.CIAID=F.CIAID(+) '
        +'GROUP BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR,  G.CTADEBE, CIAABR';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // Grabar en los registros marcados el asiento contable al que pertenecen
   xSQL:='Update CAJ_TAR_CRE_DET SET TDIARID='''+xOrigen+''', ECNOCOMP='''+xNoComp+''', ECANOMM='''+xPeriodo+''' '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and REFER LIKE ''%VISANET%'' and USUMAR='''+DMTE.wUsuario+'''';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);



   /////////////////////
   //    EXPRESSNET   //
   /////////////////////
   xSQL:='SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
        +'WHERE CIAID='''+xCia+''' AND CNTANOMM='''+xPeriodo+''' AND TDIARID='''+xOrigen+'''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.indexfieldnames:='';
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   xNoComp:=DMTE.cdsQry.FieldByName('NOCOMP').AsString;

   xSQL:='SELECT CIAID FROM CAJ_TAR_CRE_DET A '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and (A.REFER LIKE ''%EXPRESSNET%'' or A.REFER LIKE ''%CIA DE SERV%'') AND CIAID IS NOT NULL';
   DMTE.cdsTarCreTransf.Close;
   DMTE.cdsTarCreTransf.DataRequest( xSQL );
   DMTE.cdsTarCreTransf.Open;

   // cabecera
   xSQL:='INSERT INTO CNT300 (CIAID, TDIARID, CNTCOMPROB, '
        +  'CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
        +  'CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
        +  'CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
        +  'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
        +'Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''', '
        +  ''''+xPeriodo+''', '''+xLote+''', ''EXPRESSNET '+sTipMon+' '+xMesDes+' HOTELES'' GLOSA, '+xTCambio+', '''+sFecReg+''', '
        +  '''I'', ''N'', NULL, '''+DMTE.wUsuario+''', SYSDATE, SYSDATE, max(b.fecano), max(b.fecmes), max(b.fecdia), '
        +  'Max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), A.TMONID, NULL, NULL, NULL, '
        +  'TDIARABR, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) DMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) DME, '
        +  'SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) HMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) HME, '
        +  '0, 0, NULL, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+''', ''CAJA'' '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and (A.REFER LIKE ''%EXPRESSNET%'' or A.REFER LIKE ''%CIA DE SERV%'') AND CIAID IS NOT NULL '
        +  'and A.USUMAR='''    +DMTE.wUsuario+''' '
        +  'AND B.FECHA(+)='''  +sFecReg+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +'GROUP BY A.TMONID, C.TDIARABR';
  DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 1 EXPRESSNET
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , b.fecano, '''+xPeriodo+''', '''+xLote+''', '''+xCtaBan1+''', NULL, NULL, '
        +  '''20'', ''OP'', OPERACION, SUBSTR(''EXPRESSNET '+sTipMon+' '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
        +  'A.ABONO, CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END TMN, '
        +  'CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END TME, '
        +  'A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
        +  'SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem, b.fecaass, '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  'CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END HMN, '
        +  'CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END HME, 0, 0, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
        +  'NULL, ''CAJA'', ROWNUM, ''CAJA'', NULL '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and (A.REFER LIKE ''%EXPRESSNET%'' or A.REFER LIKE ''%CIA DE SERV%'') '
        +  'and A.USUMAR='''    +DMTE.wUsuario+''' '
        +  'AND B.FECHA(+)='''  +sFecReg+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=E.CIAID AND '''+xCtaBan+'''=E.CUENTAID '
        +  'AND A.CIAID=F.CIAID(+)';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 2 EXPRESSNET
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', G.CTADEBE, NULL, NULL, '
        +  '''20'', ''OP'', ''VARIOS'', SUBSTR(''EXPRESSNET '+sTipMon+' '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''H'', NULL, '+xTCambio+', '
        +  'SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
        +  ''''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
        +  'SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  '0, 0, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
        +  'SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
        +  'NULL, ''CAJA'', '+IntToStr(DMTE.cdsTarCreTransf.RecordCount+1)+', ''CAJA'', NULL '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, CAJA103 G, TGE202 E, TGE101 F  '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and (A.REFER LIKE ''%EXPRESSNET%'' or A.REFER LIKE ''%CIA DE SERV%'') '
        +  'and A.USUMAR='''    +DMTE.wUsuario+''' '
        +  'AND B.FECHA(+)='''  +sFecReg+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=G.CIAID '
        +  'AND A.CIAID=E.CIAID AND G.CTADEBE=E.CUENTAID '
        +  'AND A.CIAID=F.CIAID(+) '
        +'GROUP BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR,  G.CTADEBE, CIAABR';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // Grabar en los registros marcados el asiento contable al que pertenecen
   xSQL:='Update CAJ_TAR_CRE_DET SET TDIARID='''+xOrigen+''', ECNOCOMP='''+xNoComp+''', ECANOMM='''+xPeriodo+''' '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and (REFER LIKE ''%EXPRESSNET%'' or REFER LIKE ''%CIA DE SERV%'') and USUMAR='''+DMTE.wUsuario+'''';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);




   /////////////////////
   //   DINERS CLUB   //
   /////////////////////
   xSQL:='SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
        +'WHERE CIAID='''+xCia+''' AND CNTANOMM='''+xPeriodo+''' AND TDIARID='''+xOrigen+'''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.indexfieldnames:='';
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   xNoComp:=DMTE.cdsQry.FieldByName('NOCOMP').AsString;

   xSQL:='SELECT CIAID FROM CAJ_TAR_CRE_DET A '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and A.REFER LIKE ''%DINERS CLUB%'' AND CIAID IS NOT NULL';
   DMTE.cdsTarCreTransf.Close;
   DMTE.cdsTarCreTransf.DataRequest( xSQL );
   DMTE.cdsTarCreTransf.Open;

   // cabecera
   xSQL:='INSERT INTO CNT300 (CIAID, TDIARID, CNTCOMPROB, '
        +  'CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
        +  'CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
        +  'CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
        +  'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
        +'Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''', '
        +  ''''+xPeriodo+''', '''+xLote+''', ''DINERS '+sTipMon+' '+xMesDes+' HOTELES'' GLOSA, '+xTCambio+', '''+sFecReg+''', '
        +  '''I'', ''N'', NULL, '''+DMTE.wUsuario+''', SYSDATE, SYSDATE, max(b.fecano), max(b.fecmes), max(b.fecdia), '
        +  'Max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), A.TMONID, NULL, NULL, NULL, '
        +  'TDIARABR, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) DMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) DME, '
        +  'SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) HMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) HME, '
        +  '0, 0, NULL, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+''', ''CAJA'' '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and A.REFER LIKE ''%DINERS CLUB%'' AND CIAID IS NOT NULL '
        +  'and A.USUMAR='''    +DMTE.wUsuario+''' '
        +  'AND B.FECHA(+)='''  +sFecReg+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +'GROUP BY A.TMONID, C.TDIARABR';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 1 DINERS CLUB
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , b.fecano, '''+xPeriodo+''', '''+xLote+''', '''+xCtaBan1+''', NULL, NULL, '
        +  '''20'', ''OP'', OPERACION, SUBSTR(''DINERS '+sTipMon+' '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
        +  'A.ABONO, CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END TMN, '
        +  'CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END TME, '
        +  'A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
        +  'SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem, b.fecaass, '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  'CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END HMN, '
        +  'CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END HME, 0, 0, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
        +  'NULL, ''CAJA'', ROWNUM, ''CAJA'', NULL '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and A.REFER LIKE ''%DINERS CLUB%'' '
        +  'and A.USUMAR='''    +DMTE.wUsuario+''' '
        +  'AND B.FECHA(+)='''  +sFecReg+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=E.CIAID AND '''+xCtaBan+'''=E.CUENTAID '
        +  'AND A.CIAID=F.CIAID(+)';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 2 DINERS CLUB
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', G.CTADEBE, NULL, NULL, '
        +  '''20'', ''OP'', ''VARIOS'', SUBSTR(''DINERS '+sTipMon+' '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''H'', NULL, '+xTCambio+', '
        +  'SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
        +  ''''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
        +  'SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  '0, 0, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
        +  'SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
        +  'NULL, ''CAJA'', '+IntToStr(DMTE.cdsTarCreTransf.RecordCount+1)+', ''CAJA'', NULL '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, CAJA103 G, TGE202 E, TGE101 F  '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and A.REFER LIKE ''%DINERS CLUB%'' '
        +  'and A.USUMAR='''    +DMTE.wUsuario+''' '
        +  'AND B.FECHA(+)='''  +sFecReg+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=G.CIAID '
        +  'AND A.CIAID=E.CIAID AND G.CTADEBE=E.CUENTAID '
        +  'AND A.CIAID=F.CIAID(+) '
        +'GROUP BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR,  G.CTADEBE, CIAABR';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // Grabar en los registros marcados el asiento contable al que pertenecen
   xSQL:='Update CAJ_TAR_CRE_DET SET TDIARID='''+xOrigen+''', ECNOCOMP='''+xNoComp+''', ECANOMM='''+xPeriodo+''' '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and REFER LIKE ''%DINERS CLUB%'' and USUMAR='''+DMTE.wUsuario+'''';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);




   /////////////////////
   //    PROCESOS     //
   /////////////////////
   xSQL:='SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') NOCOMP FROM CNT300 '
        +'WHERE CIAID='''+xCia+''' AND CNTANOMM='''+xPeriodo+''' AND TDIARID='''+xOrigen+'''';
   DMTE.cdsQry.Close;
   DMTE.cdsQry.indexfieldnames:='';
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   xNoComp:=DMTE.cdsQry.FieldByName('NOCOMP').AsString;

   xSQL:='SELECT CIAID FROM CAJ_TAR_CRE_DET A '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and A.REFER LIKE ''%PROCESOS%'' AND CIAID IS NOT NULL';
   DMTE.cdsTarCreTransf.Close;
   DMTE.cdsTarCreTransf.DataRequest( xSQL );
   DMTE.cdsTarCreTransf.Open;

   // cabecera
   xSQL:='INSERT INTO CNT300 (CIAID, TDIARID, CNTCOMPROB, '
        +  'CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
        +  'CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
        +  'CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
        +  'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
        +'Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''', '
        +  ''''+xPeriodo+''', '''+xLote+''', ''MCARD '+sTipMon+' '+xMesDes+' HOTELES'' GLOSA, '+xTCambio+', '''+sFecReg+''', '
        +  '''I'', ''N'', NULL, '''+DMTE.wUsuario+''', SYSDATE, SYSDATE, max(b.fecano), max(b.fecmes), max(b.fecdia), '
        +  'Max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), A.TMONID, NULL, NULL, NULL, '
        +  'TDIARABR, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) DMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) DME, '
        +  'SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) HMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) HME, '
        +  '0, 0, NULL, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+''', ''CAJA'' '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and A.REFER LIKE ''%PROCESOS%'' AND CIAID IS NOT NULL '
        +  'and A.USUMAR='''    +DMTE.wUsuario+''' '
        +  'AND B.FECHA(+)='''  +sFecReg+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +'GROUP BY A.TMONID, C.TDIARABR';
  DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 1 DINERS CLUB
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , b.fecano, '''+xPeriodo+''', '''+xLote+''', '''+xCtaBan1+''', NULL, NULL, '
        +  '''20'', ''OP'', OPERACION, SUBSTR(''MCARD '+sTipMon+' '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
        +  'A.ABONO, CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END TMN, '
        +  'CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END TME, '
        +  'A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
        +  'SYSDATE, SYSDATE, b.fecmes, b.fecdia, b.fectrim, b.fecsem, b.fecss, b.fecaatri, b.fecaasem, b.fecaass, '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  'CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END HMN, '
        +  'CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END HME, 0, 0, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
        +  'NULL, ''CAJA'', ROWNUM, ''CAJA'', NULL '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and A.REFER LIKE ''%PROCESOS%'' '
        +  'and A.USUMAR=''' +DMTE.wUsuario+''' '
        +  'AND B.FECHA(+)=''' +sFecReg+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=E.CIAID AND '''+xCtaBan+'''=E.CUENTAID '
        +  'AND A.CIAID=F.CIAID(+)';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // DETALLE 2 DINERS CLUB
   xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
        +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
        +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
        +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
        +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
        +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
        +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
        +'Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', G.CTADEBE, NULL, NULL, '
        +  '''20'', ''OP'', ''VARIOS'', SUBSTR(''MCARD '+sTipMon+' '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''H'', NULL, '+xTCambio+', '
        +  'SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
        +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
        +  ''''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
        +  'SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
        +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
        +  '0, 0, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
        +  'SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
        +  'NULL, ''CAJA'', '+IntToStr(DMTE.cdsTarCreTransf.RecordCount+1)+', ''CAJA'', NULL '
        +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, CAJA103 G, TGE202 E, TGE101 F  '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and A.REFER LIKE ''%PROCESOS%'' '
        +  'and A.USUMAR='''    +DMTE.wUsuario+''' '
        +  'AND B.FECHA(+)='''  +sFecReg+''' '
        +  'AND C.TDIARID(+)='''+xOrigen+''' '
        +  'AND A.CIAID=G.CIAID '
        +  'AND A.CIAID=E.CIAID AND G.CTADEBE=E.CUENTAID '
        +  'AND A.CIAID=F.CIAID(+) '
        +'GROUP BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR,  G.CTADEBE, CIAABR';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   // Grabar en los registros marcados el asiento contable al que pertenecen
   xSQL:='Update CAJ_TAR_CRE_DET SET TDIARID='''+xOrigen+''', ECNOCOMP='''+xNoComp+''', ECANOMM='''+xPeriodo+''' '
        +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
        +  'and REFER LIKE ''%PROCESOS%'' and USUMAR='''+DMTE.wUsuario+'''';
   DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
//Fin  HPC_201702_CAJA

   end;

   ///////////////////////////////////////
   ///////////////////////////////////////
   ///////////////////////////////////////
   ///                                ///
   ///      ASIENTOS EN FILIALES      ///
   ///                                ///
   //////////////////////////////////////
   //////////////////////////////////////
   //////////////////////////////////////

   sNomBusq1 := '';
   For nVeces:=1 to 4 do
   begin
       // Inicio HPC_201702_CAJA  MODFICAR CUENTAS EN DOLARES
       if nVeces=1 then
       begin
          if DMTE.cdsCabTranf.FieldByName('TMONID').AsString='N' then
             sCtaTarjeta:='121030203'
          else
             sCtaTarjeta:='121030207';
          sProv:='P1541';  sNomProv:='VISANET';     sNomBusq:='VISANET';
       end;
       if nVeces=2 then
       begin
          if DMTE.cdsCabTranf.FieldByName('TMONID').AsString='N' then
             sCtaTarjeta:='121030205'
          else
             sCtaTarjeta:='121030210';
          sProv:='P1554';  sNomProv:='EXPRESSNET';  sNomBusq:='EXPRESSNET'; sNomBusq1:='CIA DE SERV';
       end;
       if nVeces=3 then
       begin
          if DMTE.cdsCabTranf.FieldByName('TMONID').AsString='N' then
             sCtaTarjeta:='121030202'
          else
             sCtaTarjeta:='121030209';
          sProv:='P1553';  sNomProv:='DINERS';      sNomBusq:='DINERS CLUB';
       end;
       if nVeces=4 then
       begin
          if DMTE.cdsCabTranf.FieldByName('TMONID').AsString='N' then
             sCtaTarjeta:='121030204'
          else
             sCtaTarjeta:='121030208';
          sProv:='P1552';  sNomProv:='MCARD';       sNomBusq:='PROCESOS';
       end;
       // Fin  HPC_201702_CAJA  MODFICAR CUENTAS EN DOLARES


       /////////////////////
       //     VISANET     //
       /////////////////////

       // cabecera
       xSQL:='INSERT INTO CNT300 (CIAID, TDIARID, CNTCOMPROB, '
            +  'CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
            +  'CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, CNTANO, CNTMM, CNTDD, '
            +  'CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, '
            +  'TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
            +'Select A.CIAID, '''+xOrigen+''' TDIARID, MAX((SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)+1),10,''0'') FROM CNT300 Z WHERE A.CIAID=Z.CIAID AND A.ECANOMM=Z.CNTANOMM AND A.TDIARID=Z.TDIARID )) CNTCOMPROB, '
            +  ''''+xPeriodo+''', '''+xLote+''', '''+sNomProv+' '+xMesDes+' ''||CIAABR GLOSA, '+xTCambio+', '''+sFecReg+''', '
            +  '''I'', ''N'', NULL, '''+DMTE.wUsuario+''', SYSDATE, SYSDATE, max(b.fecano), max(b.fecmes), max(b.fecdia), '
            +  'Max(b.fectrim), max(b.fecsem), max(b.fecss), max(b.fecaatri), max(b.fecaasem), max(b.fecaass), A.TMONID, NULL, NULL, NULL, TDIARABR, '
            +  'SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) DMN, '
            +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) DME, '
            +  'SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) HMN, '
            +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) HME, '
            +  '0, 0, NULL, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+''', ''CNT'' '
            +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE101 F '
            +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
            +  'and (A.REFER LIKE ''%'+sNomBusq+'%'' ';
            if sNomProv='EXPRESSNET' THEN
               xSQL := xSQL + ' OR A.REFER LIKE ''%'+sNomBusq1+'%''';
            xSQL := xSQL +  ') AND A.CIAID IS NOT NULL '
            +  'and A.USUMAR='''+DMTE.wUsuario+''' '
            +  'AND B.FECHA(+)='''+sFecReg +''' '
            +  'AND C.TDIARID(+)='''+xOrigen +''' '
            +  'AND A.CIAID=F.CIAID(+) '
            +'GROUP BY A.CIAID, A.TMONID, C.TDIARABR, CIAABR';
       DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);


       // DETALLE 1 VISANET
       xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
            +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
            +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
            +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
            +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
            +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
            +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
            +'Select A.CIAID, '''+xOrigen+''' TDIARID, MAX((SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)),10,''0'') FROM CNT300 Z WHERE A.CIAID=Z.CIAID AND A.ECANOMM=Z.CNTANOMM AND A.TDIARID=Z.TDIARID AND CNTESTADO=''I'' AND CNTUSER=USUMAR )) CNTCOMPROB, '
            +  'MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', '''+xCta466+''', NULL, NULL, '
            +  '''20'', ''OP'', ''VARIOS'', SUBSTR('''+sNomProv+' '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
            +  'SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
            +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
            +  ''''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
            +  'SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
            +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
            +  'SUM( CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) HMN, '
            +  'SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) HME, 0, 0, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
            +  'NULL, ''CAJA'', ''1'', ''CNT'', NULL '
            +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
            +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
            +  'and (A.REFER LIKE ''%'+sNomBusq+'%'' ';
            if sNomProv='EXPRESSNET' THEN
               xSQL := xSQL + ' OR A.REFER LIKE ''%'+sNomBusq1+'%''';
            xSQL := xSQL + ') and A.USUMAR='''    +DMTE.wUsuario+''' '
            +  'AND B.FECHA(+)='''  +sFecReg+''' '
            +  'AND C.TDIARID(+)='''+xOrigen+''' '
            +  'AND A.CIAID=E.CIAID AND '''+xCta466+'''=E.CUENTAID '
            +  'AND A.CIAID=F.CIAID(+) '
            +'GROUP BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR, CIAABR';
       DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

       // DETALLE 2 VISANET
       xSQL:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
            +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
            +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
            +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
            +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
            +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
            +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
            +'Select A.CIAID, '''+xOrigen+''' TDIARID, MAX((SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)),10,''0'') FROM CNT300 Z WHERE A.CIAID=Z.CIAID AND A.ECANOMM=Z.CNTANOMM AND A.TDIARID=Z.TDIARID AND CNTESTADO=''I'' AND CNTUSER=USUMAR )) CNTCOMPROB, '
            +  'MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', '''+sCta421+''', P.CLAUXID, P.DCPAUXID, '
            +  'P.DOCID, P.CPSERIE, P.CPNODOC, SUBSTR('''+sNomProv+' '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
            +  'MAX(P.DCPMOORI) TMO, MAX(CASE WHEN A.TMONID=''N'' THEN P.DCPMOORI ELSE round(P.DCPMOORI*'+xTCambio+',2) END ) TMN, '
            +  'MAX(CASE WHEN A.TMONID=''D'' THEN P.DCPMOORI ELSE round(P.DCPMOORI/'+xTCambio+',2) END ) TME, '
            +  ''''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
            +  'SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
            +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
            +  'MAX(CASE WHEN A.TMONID=''N'' THEN P.DCPMOORI ELSE round(P.DCPMOORI*'+xTCambio+',2) END) HMN, '
            +  'MAX(CASE WHEN A.TMONID=''D'' THEN P.DCPMOORI ELSE round(P.DCPMOORI/'+xTCambio+',2) END) HME, 0, 0, 0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
            +  'NULL, ''CAJA'', ''2'', ''CNT'', NULL '
            +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F, CXP302 P  '
            +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
            +  'and (A.REFER LIKE ''%'+sNomBusq+'%'' ';
            if sNomProv='EXPRESSNET' THEN
               xSQL := xSQL + ' OR A.REFER LIKE ''%'+sNomBusq1+'%''';
            xSQL := xSQL + ' ) and A.USUMAR='''    +DMTE.wUsuario+''' '
            +  'AND B.FECHA(+)='''  +sFecReg+''' '
            +  'AND C.TDIARID(+)='''+xOrigen+''' '
            +  'AND A.CIAID=E.CIAID AND '''+sCta421+'''=E.CUENTAID '
            +  'AND A.CIAID=F.CIAID(+) '
            +  'AND A.CIAID=P.CIAID AND A.ECANOMM=P.DCPANOMM AND P.CUENTAID='''+sCta421+''' AND DCPAUXID IN ('''+sProv+''') '
            +'GROUP BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR, CIAABR, P.CPNOREG, P.CLAUXID, P.DCPAUXID, P.DOCID, P.CPSERIE, P.CPNODOC';
       DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

       // DETALLE 3 VISANET

       xSQL1:='INSERT INTO CNT311( CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
            +  'DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
            +  'CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
            +  'CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
            +  'TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
            +  'CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
            +  'CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) ';
       xSQL2:=
             'Select CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, '''+sCtaTarjeta+''' CNTCUENTA, NULL CLAUXID, NULL AUXID, '
            +  '''20'', ''OP'', ''VARIOS'', MAX(CNTGLOSA), ''H'' CNTDH, MAX(CCOSID), max(CNTTCAMBIO), sum(TMO), sum(TMN), sum(TME), '            +  ''''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', MAX(CNTESTADO), MAX(CNTCUADRE), MAX(CNTFAUTOM), MAX(CNTUSER), '
            +  'max(CNTFREG), max(CNTHREG), max(CNTMM), max(CNTDD), max(CNTTRI), max(CNTSEM), max(CNTSS), max(CNTAATRI), max(CNTAASEM), max(CNTAASS), '
            +  'MAX(TMONID), max(FLAGVAR), max(FCONS), max(CNTFMEC), max(TDIARABR), max(CTAABR), max(AUXDES), max(DOCDES), max(CCOSDES), '
            +  'SUM(HMN), SUM(HME), SUM(DMN), SUM(DME), SUM(S1), SUM(S2), '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', max(VAR2), max(CNTPAGADO), max(CNTMODDOC), max(CNTREG), max(MODULO), max(CTA_SECU) '
            +'From ( '
            +'Select A.CIAID, '''+xOrigen+''' TDIARID, MAX((SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)),10,''0'') FROM CNT300 Z WHERE A.CIAID=Z.CIAID AND A.ECANOMM=Z.CNTANOMM AND A.TDIARID=Z.TDIARID AND CNTESTADO=''I'' AND CNTUSER=USUMAR )) CNTCOMPROB, '
            +  'MAX(b.fecano) CNTANO, '''+xPeriodo+''' CNTANOMM, '''+xLote+''' CNTLOTE, '''+xCta466+''' CNTCUENTA, NULL CLAUXID, NULL AUXID, '
            +  '''20'' DOCID, ''OP'' CNTSERIE, ''VARIOS'' CNTNODOC, SUBSTR('''+sNomProv+' '+xMesDes+' ''||CIAABR,1,40) CNTGLOSA, ''D'' CNTDH, NULL CCOSID, '+xTCambio+' CNTTCAMBIO, '
            +  'SUM(A.ABONO) TMO, SUM(CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END ) TMN, '
            +  'SUM(CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END ) TME, '
            +  ''''+sFecReg+''' CNTFEMIS, '''+sFecReg+''' CNTFVCMTO, '''+sFecReg+''' CNTFCOMP, ''I'' CNTESTADO, ''N'' CNTCUADRE, ''N'' CNTFAUTOM, '''+DMTE.wUsuario+''' CNTUSER, '
            +  'SYSDATE CNTFREG, SYSDATE CNTHREG, MAX(b.fecmes) CNTMM, MAX(b.fecdia) CNTDD, MAX(b.fectrim) CNTTRI, MAX(b.fecsem) CNTSEM, MAX(b.fecss) CNTSS, MAX(b.fecaatri) CNTAATRI, MAX(b.fecaasem) CNTAASEM, MAX(b.fecaass) CNTAASS, '
            +  'A.TMONID, NULL FLAGVAR, NULL FCONS, NULL CNTFMEC, C.TDIARABR, E.CTAABR, NULL AUXDES, ''A Cuenta'' DOCDES, NULL CCOSDES, '
            +  'SUM( CASE WHEN A.TMONID=''N'' THEN A.ABONO ELSE round(A.ABONO*'+xTCambio+',2) END) DMN, '
            +  'SUM( CASE WHEN A.TMONID=''D'' THEN A.ABONO ELSE round(A.ABONO/'+xTCambio+',2) END) DME, 0 HMN, 0 HME, 0 S1, 0 S2, NULL VAR1, NULL VAR2, '
            +  'NULL CNTPAGADO, ''CAJA'' CNTMODDOC, ''3'' CNTREG, ''CNT'' MODULO, NULL CTA_SECU '
            +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
            +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
            +  'and (A.REFER LIKE ''%'+sNomBusq+'%'' ';
            if sNomProv='EXPRESSNET' THEN
               xSQL2 := xSQL2 + ' OR A.REFER LIKE ''%'+sNomBusq1+'%''';
            xSQL2 := xSQL2 + ' ) and A.USUMAR='''    +DMTE.wUsuario+''' '
            +  'AND B.FECHA(+)='''  +sFecReg+''' '
            +  'AND C.TDIARID(+)='''+xOrigen+''' '
            +  'AND A.CIAID=E.CIAID AND '''+xCta466+'''=E.CUENTAID '
            +  'AND A.CIAID=F.CIAID(+) '
            +'GROUP BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR, CIAABR '
            +'union all '
            +'Select A.CIAID, '''+xOrigen+''' TDIARID, MAX((SELECT LPAD(TO_CHAR(NVL(MAX(CNTCOMPROB),0)),10,''0'') FROM CNT300 Z WHERE A.CIAID=Z.CIAID AND A.ECANOMM=Z.CNTANOMM AND A.TDIARID=Z.TDIARID AND CNTESTADO=''I'' AND CNTUSER=USUMAR )) CNTCOMPROB, '
            +  'MAX(b.fecano), '''+xPeriodo+''', '''+xLote+''', ''42101'', P.CLAUXID, P.DCPAUXID, '
            +  'P.DOCID, P.CPSERIE, P.CPNODOC, SUBSTR('''+sNomProv+' '+xMesDes+' ''||CIAABR,1,40) GLOSA, ''D'', NULL, '+xTCambio+', '
            +  'MAX(P.DCPMOORI) TMO, MAX(CASE WHEN A.TMONID=''N'' THEN P.DCPMOORI ELSE round(P.DCPMOORI*'+xTCambio+',2) END ) TMN, '
            +  'MAX(CASE WHEN A.TMONID=''D'' THEN P.DCPMOORI ELSE round(P.DCPMOORI/'+xTCambio+',2) END ) TME, '
            +  ''''+sFecReg+''', '''+sFecReg+''', '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
            +  'SYSDATE, SYSDATE, MAX(b.fecmes), MAX(b.fecdia), MAX(b.fectrim), MAX(b.fecsem), MAX(b.fecss), MAX(b.fecaatri), MAX(b.fecaasem), MAX(b.fecaass), '
            +  'A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
            +  'MAX(CASE WHEN A.TMONID=''N'' THEN P.DCPMOORI ELSE round(P.DCPMOORI*'+xTCambio+',2) END) HMN, '
            +  'MAX(CASE WHEN A.TMONID=''D'' THEN P.DCPMOORI ELSE round(P.DCPMOORI/'+xTCambio+',2) END) HME, 0, 0, 0, 0, NULL, NULL, '
            +  'NULL, ''CAJA'', ''3'', ''CNT'', NULL '
            +'FROM CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F, CXP302 P  '
            +'where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
            +  'and (A.REFER LIKE ''%'+sNomBusq+'%'' ';
            if sNomProv='EXPRESSNET' THEN
            xSQL2 := xSQL2 + ' OR A.REFER LIKE ''%'+sNomBusq1+'%''';
            xSQL2 := xSQL2 + ' ) and A.USUMAR='''    +DMTE.wUsuario+''' '
            +  'AND B.FECHA(+)='''  +sFecReg+''' '
            +  'AND C.TDIARID(+)='''+xOrigen+''' '
            +  'AND A.CIAID=E.CIAID AND '''+xCta466+'''=E.CUENTAID '
            +  'AND A.CIAID=F.CIAID(+) '
            +  'AND A.CIAID=P.CIAID AND A.ECANOMM=P.DCPANOMM AND P.CUENTAID='''+sCta421+''' AND DCPAUXID IN ('''+sProv+''') '
            +'GROUP BY A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR, CIAABR, P.CPNOREG, P.CLAUXID, P.DCPAUXID, P.DOCID, P.CPSERIE, P.CPNODOC '
            +' ) GROUP BY CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE';

       xSQL:=xSQL1+xSQL2;

       DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

   end;

   ShowMessage('Contabización OK');
 except
   ShowMessage('Error al Contabilizar');
end;

end;


//fin SAR2010-0213

//Inicio_HPC_201702_CAJA, nueva rutina para importar transacciones por pago automatico de servicios
procedure TFTarjetaImportar.bbtnPagoServClick(Sender: TObject);
var
   dFecIni, dFecFin : TDate;
   i : Integer;
   xSQL, sLine, sDato, sBus, cMes, cSepara : String;
   nPosI, nPosF, nMes : Integer;
   xMoneda : String;
   xwAno, xwMes, xwDia : word;
   xPeriodo : String;

begin
   if not sdGraba.Execute then Exit;

   try
      cMes:=DMTE.StrZero(IntToStr(seMes.value),2);

      xPeriodo := seAno.Text + cMes;
      dFecIni:=StrTodate('01/'+cMes+'/'+Copy(seAno.Text,1,4));

      decodedate(dateS, xwAno, xwMes, xwDia);
      if seMes.Value = xwMes then
         dFecFin:=dateS
      else
      begin
         if cMes='12' then
            dFecFin:=StrTodate('31/'+Copy(xPeriodo,5,2)+'/'+Copy(xPeriodo,1,4))
         else
         begin
            nMes:=StrToInt(Copy(xPeriodo,5,2))+1;
            dFecFin:=StrTodate('01/'+ DMTE.StrZero(IntToStr(nMes),2) +'/'+Copy(xPeriodo,1,4))-1;
         end;
      end;

      scData.Lines.LoadFromFile( sdGraba.FileName);

      xSQL:='Select LPAD(TO_CHAR(NVL(TO_NUMBER(MAX(NUMERO)),0)+1),6,''0'') NUMMAX from CAJ_TAR_CRE_CAB';
      DMTE.cdsQry.Close;
      DMTE.cdsQry.DataRequest( xSQL );
      DMTE.cdsQry.Open;

      sLine:=Copy(scData.Lines.Strings[0],2,Length(scData.Lines.Strings[0]));
      sLine:=Copy(sLine,1,Length(sLine));
      if pos('","',sLine)>0 then
         cSepara:='","'
      else
         cSepara:='";"';

      nPosF:=Pos( cSepara, sLine );
      sLine:=Copy(sLine,nPosF+3,Length(sLine));

      nPosF:=Pos( ' ', sLine );
      sDato:=TRIM(Copy(sLine,1,nPosF));
      sLine:=Copy(scData.Lines.Strings[1],11,5);
      if Copy(scData.Lines.Strings[1],11,1) = 'D' then
         xMoneda := 'D'
      else
         xMoneda := 'N';

      DMTE.cdsCabTranf.Insert;
      DMTE.cdsCabTranf.FieldByname('NUMERO').AsString  :=DMTE.cdsQry.FieldByname('NUMMAX').AsString;
      DMTE.cdsCabTranf.FieldByname('FECHA').AsDateTime :=dFecFin;
      DMTE.cdsCabTranf.FieldByname('CNTANOMM').AsString:=Copy(dateToStr(dFecFin),7,4)+Copy(dateToStr(dFecFin),4,2);
      DMTE.cdsCabTranf.FieldByname('USUARIO').AsString :=DMTE.wUsuario;
      DMTE.cdsCabTranf.FieldByname('FREG').AsDateTime  :=Date;
      DMTE.cdsCabTranf.FieldByname('TMONID').AsString  :=xMoneda;
      DMTE.cdsCabTranf.FieldByname('CCBCOID').AsString :=sDato;
      DMTE.cdsCabTranf.FieldByname('LOTE').AsString  :='PSER';
      DMTE.cdsCabTranf.Post;
      DMTE.cdsCabTranf.ApplyUpdates(0);

      xSQL:='Select NUMERO, ITEM, FECHA, REFER, CARGO, ABONO, AGENCIA, OPERACION, '
          + '       MARCA, CIAID, TDIARID, ECANOMM, ECNOCOMP, USUARIO, FREG, '
          + '       TMONID, USUMAR '
          + '  from CAJ_TAR_CRE_DET '
          + ' where NUMERO='+quotedstr(DMTE.cdsCabTranf.FieldByname('NUMERO').AsString);
      DMTE.cdsTarCreTransf.Close;
      DMTE.cdsTarCreTransf.DataRequest( xSQL );
      DMTE.cdsTarCreTransf.Open;
      sBus:= ';';

      For i:=1 to scData.Lines.Count-1 do
      begin
          sLine:=Copy(scData.Lines.Strings[i],2,Length(scData.Lines.Strings[i]));
          nPosF:=Pos( ';', sLine );
          sDato:=Copy(sLine,1,nPosF-2);

          if pos('/',Copy(sLine,1,5))>0 then
          begin
             sLine:=Copy(sLine,1,Length(sLine));
             if pos('","',sLine)>0 then
                cSepara:='","'
             else
                cSepara:='";"';
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,1,nPosF-1);

            DMTE.cdsTarCreTransf.Insert;
            DMTE.cdsTarCreTransf.FieldByname('NUMERO').AsString :=DMTE.cdsCabTranf.FieldByname('NUMERO').AsString;
            DMTE.cdsTarCreTransf.FieldByName('ITEM').AsString   :=DMTE.StrZero(IntToStr(i),4);
            DMTE.cdsTarCreTransf.FieldByName('FECHA').AsString  :=sDato;

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,1,nPosF-1);

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,2,nPosF-2);
            DMTE.cdsTarCreTransf.FieldByName('REFER').AsString    :=sDato;

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,2,nPosF-2);
            if  (strtofloat(StringReplace(sDato,',','',[rfReplaceAll])) < 0) then
               DMTE.cdsTarCreTransf.FieldByName('CARGO').AsString    :=StringReplace(StringReplace(sDato,'-','',[rfReplaceAll]),',','',[rfReplaceAll])
            else
            begin
               DMTE.cdsTarCreTransf.Delete;
               continue;
            end;

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,2,nPosF-2);

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,2,nPosF-2);
            DMTE.cdsTarCreTransf.FieldByName('AGENCIA').AsString  :=sDato;

            sLine:=Copy(sLine,nPosF+2,Length(sLine));
            nPosF:=Pos( cSepara, sLine );
            sDato:=Copy(sLine,2,nPosF-2);
            DMTE.cdsTarCreTransf.FieldByName('OPERACION').AsString:=sDato;
            DMTE.cdsTarCreTransf.FieldByName('TMONID').AsString   :=xMoneda;
            DMTE.cdsTarCreTransf.FieldByName('USUARIO').AsString  :=DMTE.wUsuario;
            DMTE.cdsTarCreTransf.FieldByName('FREG').Asdatetime   :=date;
            DMTE.cdsTarCreTransf.Post;
          end;
      end;

      try
         if DMTE.cdsTarCreTransf.ApplyUpdates(0)>0 then
            ShowMessage('Error al grabar');
      except
         ShowMessage('Error : Al Grabar Detalle');
         Exit;
      end;
   except
      ShowMessage('Error : Al Leer Archivo, Verificar si es el Correcto');
      Exit;
   end;
end;
//Fin_HPC_201702_CAJA


//Inicio_HPC_201702_CAJA, nueva rutina para contabilizar las transacciones
//por pago automatico de servicios
procedure TFTarjetaImportar.ContabPagoServicio();
var
   xSQL, xSQL1, xSQL2, xSQL3, xWhere : String;
   xCia, xOrigen, xNoComp, xMoneda , xTCambio, xLote: String;
   xGlosa, xGlosa_d1, xGlosa_d2:String;
   xRespuesta :Integer;
   xBanco: String;
   dFecFin : tDATE;
   nmes : Integer;
   cMes, xPeriodo, sFecReg , xPeriodotransf, xCtaOpexLiq : String;
   xwAno, xwMes, xwDia : word;
   xCiaId_Mov, xOrigen_Mov, xNoComp_Mov : String;

begin
   xWhere  := 'CJAAUTONOM=''S'' and CNTCONSOL=''N'' ';
   xCia    := DMTE.DisplayDescrip('prvTGE','TGE101','CIAID',xWhere,'CIAID'); // CIAID='02'
   xOrigen := '29';
   xPeriodo:=DMTE.cdsCabTranf.FieldByname('CNTANOMM').AsString;

   If MesCerrado(copy(xPeriodo,5,2),copy(xPeriodo,1,4),xCia) then
   begin
      ShowMessage(' Mes cerrado, no se puede contabilizar');
      exit;
   end;

   xLote:=DMTE.cdsCabTranf.FieldByname('LOTE').AsString;

// identificando las compañias que tienen movimientos identificados por contabilizar
   xSQL := ' Select DISTINCT CIAID,FECHA '
         + '   from CAJ_TAR_CRE_DET '
         + '  where NUMERO = ' + QuotedStr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString)
         + '    and ECNOCOMP IS NULL '
         + '    and NOT CIAID IS NULL ';
   DMTE.cdsQry7.Close;
   DMTE.cdsQry7.indexfieldnames:='';
   DMTE.cdsQry7.DataRequest( xSQL );
   DMTE.cdsQry7.Open;
   if DMTE.cdsQry7.RecordCount = 0 then
   begin
      ShowMessage('No existe ningún registro marcado para Contabilizar');
      Exit;
   end;

   xSQL := ' Select CIAID, TDIARID, CNTCOMPROB, CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, '
         + '        CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, CNTHREG, '
         + '        CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
         + '        TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CNTDEBEMN, CNTDEBEME, CNTHABEMN, '
         + '        CNTHABEME, CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO '
         + '   from CNT300 '
         + '  where CNTANOMM='+quotedstr(xPeriodo)
         + '    and CNTUSER='+quotedstr(DMTE.wUsuario)
         + '    and DOCMOD='+quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString);
   DMTE.cdsQry.Close;
   DMTE.cdsQry.indexfieldnames:='';
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;
   if DMTE.cdsQry.RecordCount>0 then
   begin
      xRespuesta := MessageDlg('Existen Movimientos en Bancos que ya fueron contabilizados.'+#13
                     +'Desea Eliminar y volver a generar los Asientos Contables para esta transacción? '+#13  + #13
                     + '[YES] Elimina y genera nuevamente los Asientos Contables'+#13
                     + '[NO] Sólo genera Asientos contables por Movimientos Identificados sin Contabilizar'+ #13 ,mtConfirmation, [mbYes, mbNo], 0);
      if (xRespuesta <> 6) and (xRespuesta <> 7) then
      begin
         Exit;
      end;

      if xRespuesta = 6 then
      begin
      // verificando que no existan asientos aceptados en contabilidad
         xSQL := ' Select CIAID '
               + '   from CNT300 '
               + '  where CNTANOMM='+quotedstr(xPeriodo)
               + '    and CNTESTADO= '+ Quotedstr('P')
               + '    and CNTUSER='+quotedstr(DMTE.wUsuario)
               + '    and DOCMOD='+quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString);

         DMTE.cdsQry.Close;
         DMTE.cdsQry.DataRequest( xSQL );
         DMTE.cdsQry.Open;
         if DMTE.cdsQry.RecordCount>0 then
         begin
            Showmessage('Usuario NO se puede contabilizar. Existen asientos aceptados en Contabilidad, Verificar....');
            Exit;
         end;

         xSQL := ' Update CAJ_TAR_CRE_DET '
               + '    set CAJ_TAR_CRE_DET.TDIARID = ' + Quotedstr('')+', '
               + '        CAJ_TAR_CRE_DET.ECNOCOMP = ' +Quotedstr('')+', '
               + '        CAJ_TAR_CRE_DET.ECANOMM = '+ Quotedstr('')
               + '  where exists (select 1 '
               + '                  from CNT300 '
               + '                 where CAJ_TAR_CRE_DET.CIAID = CNT300.CIAID '
               + '                   and CAJ_TAR_CRE_DET.TDIARID  = CNT300.TDIARID '
               + '                   and CAJ_TAR_CRE_DET.ECNOCOMP = CNT300.CNTCOMPROB '
               + '                   and CAJ_TAR_CRE_DET.ECANOMM  =  CNT300.CNTANOMM '
               + '                   and CAJ_TAR_CRE_DET.NUMERO   = CNT300.DOCMOD '
               + '                   and CAJ_TAR_CRE_DET.USUMAR   = '+ Quotedstr(DMTE.wUsuario)
               + '                   and CAJ_TAR_CRE_DET.NUMERO   = '+ Quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString)+')' ;
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         xSQL := ' Delete from CNT300 '
               + '  where CNTANOMM='+quotedstr(xPeriodo)
               + '    and CNTUSER='+quotedstr(DMTE.wUsuario)
               + '    and DOCMOD='+quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString);

         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         xSQL := ' Delete from CNT311 '
               + '  where CNTANOMM='+quotedstr(xPeriodo)
               + '    and CNTUSER='+quotedstr(DMTE.wUsuario)
               + '    and CAMPOVAR='+quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString);
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         xSQL := ' Delete from CNT301 '
               + '  where CNTANOMM='+quotedstr(xPeriodo)
               + '    and CNTUSER='+quotedstr(DMTE.wUsuario)
               + '    and CAMPOVAR='+quotedstr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString);
         DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         //identificando las compañias que tienen movimientos identificados por contabilizar
         xSQL := ' Select DISTINCT CIAID,FECHA '
               + '   from CAJ_TAR_CRE_DET '
               + '  where NUMERO = ' + QuotedStr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString)
               + '    and ECNOCOMP IS NULL '
               + '    and NOT CIAID IS NULL ';
         DMTE.cdsQry7.Close;
         DMTE.cdsQry7.indexfieldnames:='';
         DMTE.cdsQry7.DataRequest( xSQL );
         DMTE.cdsQry7.Open;
      end;
   end;

   if DMTE.cdsQry7.recordcount = 0 then
      exit;

   xSQL := 'Select BANCOID, CCBCOID, CCBCODES, CTAPRINC, CTAREMES, TMONID, CCFMTCHQ, '
         + '       CORRELATIVO, LONGITUD, CTADIFG, CTADIFP, CPTODIFG, CPTODIFP, CCBCOABR, '
         + '       CPTOID, CCBCOVOUCH, CIAID, CCOSDIF, COBCONS, CHQVOUCH, CCBVOUING, '
         + '       RELBAN, GENOFI, ACTIVO, CTAOPEXLIQ, DESCUEBAN, CUEEMICHE, CUEEXT, '
         + '       TDIARID_BAN, CTACOBR, MONBASE '
         + '  from TGE106 '
         + ' where CIAID=''02'' AND BANCOID=''03'' '
         + '   and CCBCOID='''+DMTE.cdsCabTranf.FieldByName('CCBCOID').AsString+'''';

   DMTE.cdsQry.Close;
   DMTE.cdsQry.indexfieldnames:='';
   DMTE.cdsQry.DataRequest( xSQL );
   DMTE.cdsQry.Open;

   xPeriodotransf := copy(datetostr(DMTE.cdsQry7.FieldByName('FECHA').AsDateTime),7,4)+ copy(datetostr(DMTE.cdsQry7.FieldByName('FECHA').AsDateTime),4,2);

   xCtaOpexLiq:=DMTE.cdsQry.FieldByName('CTAPRINC').AsString;

   decodedate(dateS, xwAno, xwMes, xwDia);
   if seMes.Value = xwMes then
      dFecFin:=dateS
   else
   begin
      cMes:=Copy(xPeriodo,5,2);
      if cMes='12' then
         dFecFin:=StrTodate('31/'+Copy(xPeriodo,5,2)+'/'+Copy(xPeriodo,1,4))
      else
      begin
         nMes:=StrToInt(Copy(xPeriodo,5,2))+1;
         dFecFin:=StrTodate('01/'+ DMTE.StrZero(IntToStr(nMes),2) +'/'+Copy(xPeriodo,1,4))-1;
      end;
   end;
   sFecReg:=DateToStr(dFecFin);

   try

      xTCambio:='0';
      xWhere:='TMONID='+QuotedStr(DMTE.wTMonExt)+' and FECHA='''+sFecReg+'''';
      xTCambio:=DMTE.DisplayDescrip('prvTGE','TGE107','TMONID, TCAMVOV',xWhere,'TCAMVOV');
      if xTCambio='' then xTCambio:='0';
      if StrToFloat(xTCambio)<=0 then
      begin
         ShowMessage('Falta ingresar el Tipo de Cambio');
         Exit;
      end;

   // verificando que todas las compañías seleccionadas tengan la cuenta
      xBanco := '03'; // por  el momento todo es con el banco de crédito
      xSQL:= ' Select TDIARID_BAN, CIAID '
           + '   from TGE106 '
           + '  where CCBCOID =' +  QuotedStr(DMTE.cdsCabTranf.FieldByName('CCBCOID').AsString)
           + '    and BANCOID =' +  QuotedStr(xBanco)
           + '    and ACTIVO  ='+QuotedStr('S');
      DMTE.cdsQry1.Close;
      DMTE.cdsQry1.DataRequest(xSQL);
      DMTE.cdsQry1.Open;

      DMTE.cdsQry7.first;
      while not DMTE.cdsQry7.Eof do
      begin
         if not DMTE.cdsQry1.Locate('CIAID',DMTE.cdsQry7.FieldByName('CIAID').AsString,[]) then
         begin
            showmessage ('La Cuenta: ' + DMTE.cdsCabTranf.FieldByName('CCBCOID').AsString +
                          ' no existe en la compañia '+ DMTE.cdsQry7.FieldByName('CIAID').AsString+'.'
                          +chr(13) +chr(13)+ ' Primero debe crear la cuenta bancaria ' );
            exit;
         end
         else
         begin
            if Length(DMTE.cdsQry1.FieldByName('TDIARID_BAN').AsString) = 0 then
            begin
               showmessage ('La Cuenta: ' + DMTE.cdsCabTranf.FieldByName('CCBCOID').AsString
                 +chr(13) + ' no tiene Tipo de Diario asignado en la compañia '+ DMTE.cdsQry7.FieldByName('CIAID').AsString +'.'
                 +chr(13) +chr(13)+ ' Debe asignar un tipo de diario ' );
               exit;
            end;
         end;
         DMTE.cdsQry7.next;
      end;


   // generando un asiento por cada compañía
      xSQL := ' Select CIAID,FECHA, ITEM '
               + '   from CAJ_TAR_CRE_DET '
               + '  where NUMERO = ' + QuotedStr(DMTE.cdsCabTranf.FieldByName('NUMERO').AsString)
               + '    and ECNOCOMP IS NULL '
               + '    and NOT CIAID IS NULL '
               + ' order by 1,3 ';
      DMTE.cdsQry7.Close;
      DMTE.cdsQry7.indexfieldnames:='';
      DMTE.cdsQry7.DataRequest( xSQL );
      DMTE.cdsQry7.Open;


      DMTE.cdsQry7.first;
      while not DMTE.cdsQry7.Eof do
      begin

         xCiaId_Mov := DMTE.cdsQry7.FieldByName('CIAID').AsString;

         xSQL:= ' Select ORIGEN_PSER '
              + ' From CAJA103 '
              + ' Where CIAID =' +  QuotedStr(xCiaId_Mov);
         DMTE.cdsQry.Close;
         DMTE.cdsQry.DataRequest(xSQL);
         DMTE.cdsQry.Open;
         xOrigen_Mov    := xOrigen;

         if DMTE.cdsCabTranf.FieldByName('TMONID').AsString = 'N' then
            xMoneda := 'MN'
         else
            xMoneda := 'ME';

         xGlosa := ' A.REFER || '+ Quotedstr( ' ' + DMTE.cdsCabTranf.FieldByName('CCBCOID').AsString);
         xGlosa_d1 := ' A.REFER ';

         if xCiaId_Mov<>'02' then
            xGlosa_d2 := ' A.REFER || '+ Quotedstr( ' CIA ' + xCiaId_Mov )
         else
            xGlosa_d2 := ' A.REFER ';

         If  xCia <> xCiaId_Mov Then
         begin

            //xCia=02, xPeriod = CAJ_TAR_CRE_CAB.CNTANOMM , xOrigen = 29
            xSQL := ' Select lpad(to_char(nvl(max(CNTCOMPROB),0)+1),10,''0'') NOCOMP '
               + '   from CNT300 '
               + '  where CIAID='+quotedstr(xCia)
               + '    and CNTANOMM='+quotedstr(xPeriodo)
               + '    and TDIARID='+quotedstr(xOrigen);
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest( xSQL );
            DMTE.cdsQry.Open;
            xNoComp:=DMTE.cdsQry.FieldByName('NOCOMP').AsString;

            // CABECERA - Inserta para xCia = '02'
            //  xGlosa, CAJA
            xSQL := ' Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
                  + '                     CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
                  + '                     CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, '
                  + '                     CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
                  + '                     CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, '
                  + '                     CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
                  + '                     CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO) '
                  + ' Select '+quotedstr(xCia)+', '+quotedstr(xOrigen) + ', ' + quotedstr(xNoComp)+', '
                  +          quotedstr(xPeriodo)+', '+quotedstr(xLote)+', ' + xGlosa +', ' + xTCambio+', '+quotedstr(sFecReg)+', '
                  +          quotedstr('I')+', '+quotedstr('N')+', NULL, ' + quotedstr(DMTE.wUsuario)+', TRUNC(SYSDATE,''DD''), '
                  + '        SYSDATE, B.FECANO, B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, '
                  + '        B.FECAATRI, B.FECAASEM, B.FECAASS, A.TMONID, NULL, NULL, NULL, C.TDIARABR, '
                  + '        case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) end  DMN, '
                  + '        case when A.TMONID=''D'' then A.CARGO else round(A.CARGO/'+xTCambio+',2) end  DME, '
                  + '        case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) end  HMN, '
                  + '        case when A.TMONID=''D'' then A.CARGO else round(A.CARGO/'+xTCambio+',2) end  HME, '
                  + '        0, 0, NULL, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+''', ''CAJA'' '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C , TGE101 F '
                  + '  where A.NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.CIAID = ' +QuotedStr(xCiaId_Mov)+ ' '
                  + '    and A.ECNOCOMP is null '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and A.ITEM ='''    +DMTE.cdsQry7.FieldByName('ITEM').AsString +''' '
                  + '    and B.FECHA(+)='''  +sFecReg      +''' '
                  + '    and C.TDIARID(+)='''+xOrigen      +''' '
                  + '    and F.CIAID(+) = A.CIAID ';
                  //+ '  group by A.TMONID, C.TDIARABR, A.CIAID, F.CIAABR ' ;
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

            // DETALLE 1 - Inserta en el Debe para xCia = '02' - 16607
            //xGlosa_total, CAJA, CAJA, A Cuenta
            xSQL := ' Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, '
                  + '                    CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                    CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
                  + '                    CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                    CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB , b.FECANO, '''+xPeriodo+''', '''+xLote+''', G.CTADEBE, NULL, NULL, '
                  + '        ''14'', A.CPSERIE, A.CPNODOC, '+xGlosa_d1 +' GLOSA, ''D'', NULL, '+xTCambio+', '
                  + '        A.CARGO MTOORI, case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) end MTOLOC, case when A.TMONID=''D'' then A.CARGO else round(A.CARGO/'+xTCambio+',2) end MTOEXT, '
                  + '        A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        TRUNC(SYSDATE,''DD''), SYSDATE, B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, B.FECAATRI, B.FECAASEM, B.FECAASS, '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) end DMN, case when A.TMONID=''D'' then A.CARGO else round(A.CARGO/'+xTCambio+',2) end DME, 0 HMN, 0 HME, '
                  + '        0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', ROWNUM, ''CAJA'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, CAJA103 G, TGE202 E, TGE101 F '
                  + '  where A.NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP IS NULL '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and A.ITEM ='''    +DMTE.cdsQry7.FieldByName('ITEM').AsString +''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and G.CIAID = A.CIAID '
                  + '    and E.CIAID = A.CIAID '
                  + '    and E.CUENTAID = G.CTADEBE '
                  + '    and F.CIAID(+) = A.CIAID ';
            //      + '  group by A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR,  G.CTADEBE, CIAABR';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);


            // DETALLE 2(B) - Inserta en el Haber para xCia = '02'  - 104...
            //xGlosa_d, CAJA, CAJA, A Cuenta
            xSQL := ' Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, '
                  + '                    CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                    CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
                  + '                    CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                    CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select '''+xCia+''', '''+xOrigen+''' TDIARID, '''+xNoComp+''' CNTCOMPROB, b.fecano, '''+xPeriodo+''', '''+xLote+''', '''+xCtaOpexLiq+''', NULL, NULL, '
                  + '        ''14'', ''OP'', A.OPERACION, '+ xGlosa_d2 +' GLOSA, ''H'', NULL, '+xTCambio+', '
                  + '        A.CARGO MTOORI, case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) end MTOLOC, case when A.TMONID=''D'' then A.CARGO else round(A.CARGO/'+xTCambio+',2) end MTOEXT, '
                  + '        A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        TRUNC(SYSDATE,''DD''), SYSDATE, B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, B.FECAATRI, B.FECAASEM, B.FECAASS, '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        0 DMN, 0 DME, case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) end HMN, case when A.TMONID=''D'' then A.CARGO ELSE round(A.CARGO/'+xTCambio+',2) end HME, '
                  + '        0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', ROWNUM, ''CAJA'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
                  + '  where A.NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and A.ITEM ='''    +DMTE.cdsQry7.FieldByName('ITEM').AsString +''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen+''' '
                  + '    and E.CIAID = '''+xCia+'''  '
                  + '    and E.CUENTAID =  '''+xCtaOpexLiq+''' '
                  + '    and F.CIAID(+) = A.CIAID ';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

            // Enumerando nuevamente el detalle del comprobante
            xSQL:= 'Update CNT311 SET CNTREG  =  ROWNUM '
                 + ' where CIAID    = ' + QuotedStr(xCia)
                 + '   and TDIARID    = ' + QuotedStr(xOrigen)
                 + '   and CNTANOMM   = ' + QuotedStr(xPeriodo)
                 + '   and CNTCOMPROB = ' + QuotedStr(xNoComp) ;
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

            //xCiaId_Mov<>02, xPeriod = CAJ_TAR_CRE_CAB.CNTANOMM , xOrigen_Mov = 50
            xSQL := ' Select lpad(to_char(nvl(max(CNTCOMPROB),0)+1),10,''0'') NOCOMP '
                  + '   from CNT300 '
                  + '  where CIAID='+quotedstr(xCiaId_Mov)
                  + '    and CNTANOMM='+quotedstr(xPeriodo)
                  + '    and TDIARID='+quotedstr(xOrigen_Mov);
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest( xSQL );
            DMTE.cdsQry.Open;
            xNoComp_Mov:=DMTE.cdsQry.FieldByName('NOCOMP').AsString;

            // CABECERA FILIAL - xCia <> '02'
            // xGlosa, CNT
            xSQL := ' insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
                  + '                     CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
                  + '                     CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, '
                  + '                     CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
                  + '                     CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, '
                  + '                     CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
                  + '                     CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO ) '
                  + ' select A.CIAID, '+quotedstr(xOrigen_Mov) + ', ' + quotedstr(xNoComp_Mov) + ', '
                  +          quotedstr(xPeriodo)+', '+quotedstr(xLote)+', ' + xGlosa +', ' + xTCambio+', '+quotedstr(sFecReg)+', '
                  +          quotedstr('I')+', '+quotedstr('N')+', NULL, ' + quotedstr(DMTE.wUsuario)+', TRUNC(SYSDATE,''DD''), '
                  + '        SYSDATE, B.FECANO, B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, '
                  + '        B.FECAATRI, B.FECAASEM, B.FECAASS, A.TMONID, NULL, NULL, NULL, C.TDIARABR, '
                  + '        case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) end  DMN, '
                  + '        case when A.TMONID=''D'' then A.CARGO else round(A.CARGO/'+xTCambio+',2) end  DME, '
                  + '        case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) end  HMN, '
                  + '        case when A.TMONID=''D'' then A.CARGO else round(A.CARGO/'+xTCambio+',2) end  HME, '
                  + '        0, 0, NULL, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+''', ''CNT'' '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE101 F '
                  + '  where A.NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP IS NULL '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and A.ITEM ='''    +DMTE.cdsQry7.FieldByName('ITEM').AsString +''' '
                  + '    and B.FECHA(+)='''  +sFecReg      +''' '
                  + '    and C.TDIARID(+)='''+xOrigen_Mov      +''' '
                  + '    and F.CIAID(+) = A.CIAID ';
            //         + '  group by A.CIAID, A.TMONID, C.TDIARABR, F.CIAABR';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

            // DETALLE 1 FILIAL(A)- Inserta en el Debe para xCia <> '02' - 42101
            // xGlosa_total, CAJA, CNT, A Cuenta
            xSQL := ' Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, '
                  + '                    CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                    CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
                  + '                    CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                    CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select A.CIAID, '+quotedstr(xOrigen_Mov) + ', '''+xNoComp_Mov+''' CNTCOMPROB , B.fecano, '''+xPeriodo+''', '''+xLote+''', A.CTATOTAL, G.CLAUXID, G.PROV, '
                  + '        ''14'', A.CPSERIE, A.CPNODOC, '+xGlosa_d1 +' GLOSA, ''D'', NULL, '+xTCambio+', '
                  + '        A.CARGO MTOORI, CASE WHEN A.TMONID=''N'' THEN A.CARGO ELSE round(A.CARGO*'+xTCambio+',2) END MTOLOC, CASE WHEN A.TMONID=''D'' THEN A.CARGO ELSE round(A.CARGO/'+xTCambio+',2) END MTOEXT, '
                  + '        A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        TRUNC(SYSDATE,''DD''), SYSDATE, B.fecmes, B.fecdia, B.fectrim, B.fecsem, B.fecss, B.fecaatri, B.fecaasem, B.fecaass, '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        CASE WHEN A.TMONID=''N'' THEN A.CARGO ELSE round(A.CARGO*'+xTCambio+',2) END DMN, CASE WHEN A.TMONID=''D'' THEN A.CARGO ELSE round(A.CARGO/'+xTCambio+',2) END DME, 0 HMN, 0 HME, '
                  + '        0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', ROWNUM, ''CNT'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F, CXP301 G '
                  + '  where A.NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP IS NULL '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and A.ITEM ='''    +DMTE.cdsQry7.FieldByName('ITEM').AsString +''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen_Mov+''' '
                  + '    and E.CIAID = A.CIAID '
                  + '    and E.CUENTAID = A.CTATOTAL '
                  + '    and F.CIAID(+) = A.CIAID '
                  + '    and A.DOCID =  G.DOCID '
                  + '    and A.CPSERIE =  G.CPSERIE '
                  + '    and A.CPNODOC =  G.CPNODOC ';
            //      + '  group by A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR,  G.CTADEBE, CIAABR';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

            // DETALLE 2 - Inserta en el Haber para xCia <> '02'  - 46602
            //xGlosa, CAJA, CNT, A Cuenta
            xSQL := ' Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, '
                  + '                    CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                    CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
                  + '                    CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                    CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select A.CIAID, '''+xOrigen_Mov+''' TDIARID, '''+xNoComp_Mov+''' CNTCOMPROB, B.FECANO, '''+xPeriodo+''', '''+xLote+''', G.CTAHABER, NULL, NULL, '
                  + '        ''14'', ''OP'', A.OPERACION, '+ xGlosa_d1 +' GLOSA, ''H'', NULL, '+xTCambio+', '
                  + '        A.CARGO MTOORI, case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) END MTOLOC, case when A.TMONID=''D'' then A.CARGO else round(A.CARGO/'+xTCambio+',2) end MTOEXT, '
                  + '        A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        TRUNC(SYSDATE,''DD''), SYSDATE, B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, B.FECAATRI, B.FECAASEM, B.FECAASS, '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        0 DMN, 0 DME, case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) END HMN, case when A.TMONID=''D'' then A.CARGO else round(A.CARGO/'+xTCambio+',2) end HME, '
                  + '        0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', ROWNUM, ''CNT'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, CAJA103 G, TGE202 E, TGE101 F '
                  + '  where A.NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP IS NULL '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and A.ITEM ='''    +DMTE.cdsQry7.FieldByName('ITEM').AsString +''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen_Mov+''' '
                  + '    and G.CIAID = A.CIAID '
                  + '    and E.CIAID = A.CIAID '
                  + '    and E.CUENTAID = G.CTAHABER '
                  + '    and F.CIAID(+) = A.CIAID ';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

            // Grabar en los registros marcados el asiento contable al que pertenecen
            xSQL := ' Update CAJ_TAR_CRE_DET SET TDIARID='''+xOrigen_Mov+''', ECNOCOMP='''+xNoComp_Mov+''', ECANOMM='''+xPeriodo+''' '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and ECNOCOMP  IS NULL '
                  + '    and USUMAR='''+DMTE.wUsuario+''''
                  + '    and ITEM ='''    +DMTE.cdsQry7.FieldByName('ITEM').AsString +''' ';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

            // Enumerando nuevamente el detalle del comprobante
            xSQL:= 'Update CNT311 SET CNTREG  =  ROWNUM '
                 + ' where CIAID    = ' + QuotedStr(xCiaId_Mov)
                 + '   and TDIARID    = ' + QuotedStr(xOrigen_Mov)
                 + '   and CNTANOMM   = ' + QuotedStr(xPeriodo)
                 + '   and CNTCOMPROB = ' + QuotedStr(xNoComp_Mov) ;
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         end
         Else
         begin

            //xCiaId_Mov=02, xPeriod = CAJ_TAR_CRE_CAB.CNTANOMM , xOrigen_Mov = 29
            xSQL := ' Select lpad(to_char(nvl(max(CNTCOMPROB),0)+1),10,''0'') NOCOMP '
                  + '   from CNT300 '
                  + '  where CIAID='+quotedstr(xCiaId_Mov)
                  + '    and CNTANOMM='+quotedstr(xPeriodo)
                  + '    and TDIARID='+quotedstr(xOrigen_Mov);
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest( xSQL );
            DMTE.cdsQry.Open;
            xNoComp_Mov:=DMTE.cdsQry.FieldByName('NOCOMP').AsString;

            // CABECERA - Inserta para xCia = xCiaId_Mov = '02'
            //  xGlosa, CAJA
            xSQL := ' Insert into CNT300 (CIAID, TDIARID, CNTCOMPROB, '
                  + '                     CNTANOMM, CNTLOTE, CNTGLOSA, CNTTCAMBIO, CNTFCOMP, '
                  + '                     CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, CNTFREG, '
                  + '                     CNTHREG, CNTANO, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, '
                  + '                     CNTAATRI, CNTAASEM, CNTAASS, TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, '
                  + '                     CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
                  + '                     CNTSALDMN, CNTSALDME, CNTTS, DOCMOD, MODULO) '
                  + ' Select A.CIAID, '+quotedstr(xOrigen_Mov) + ', ' + quotedstr(xNoComp_Mov)+', '
                  +          quotedstr(xPeriodo)+', '+quotedstr(xLote)+', ' + xGlosa +', ' + xTCambio+', '+quotedstr(sFecReg)+', '
                  +          quotedstr('I')+', '+quotedstr('N')+', NULL, ' + quotedstr(DMTE.wUsuario)+', TRUNC(SYSDATE,''DD''), '
                  + '        SYSDATE, B.FECANO, B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, '
                  + '        B.FECAATRI, B.FECAASEM, B.FECAASS, A.TMONID, NULL, NULL, NULL, C.TDIARABR, '
                  + '        case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) end  DMN, '
                  + '        case when A.TMONID=''D'' then A.CARGO else round(A.CARGO/'+xTCambio+',2) end  DME, '
                  + '        case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) end  HMN, '
                  + '        case when A.TMONID=''D'' then A.CARGO else round(A.CARGO/'+xTCambio+',2) end  HME, '
                  + '        0, 0, NULL, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString+''', ''CAJA'' '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C , TGE101 F '
                  + '  where A.NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.CIAID = ' +QuotedStr(xCiaId_Mov)+ ' '
                  + '    and A.ECNOCOMP is null '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and A.ITEM ='''    +DMTE.cdsQry7.FieldByName('ITEM').AsString +''' '
                  + '    and B.FECHA(+)='''  +sFecReg      +''' '   
                  + '    and C.TDIARID(+)='''+xOrigen_Mov      +''' '
                  + '    and F.CIAID(+) = A.CIAID ';
                  //+ '  group by A.TMONID, C.TDIARABR, A.CIAID, F.CIAABR ' ;
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);


            // DETALLE 1 FILIAL(A)- Inserta en el Debe para xCia <> '02' - 42101
            // xGlosa_total, CAJA, CNT, A Cuenta
            xSQL := ' Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, '
                  + '                    CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                    CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
                  + '                    CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                    CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select A.CIAID, '+quotedstr(xOrigen_Mov) + ', '''+xNoComp_Mov+''' CNTCOMPROB , B.fecano, '''+xPeriodo+''', '''+xLote+''', A.CTATOTAL, G.CLAUXID, G.PROV, '
                  + '        ''14'', A.CPSERIE, A.CPNODOC, '+xGlosa_d1 +' GLOSA, ''D'', NULL, '+xTCambio+', '
                  + '        A.CARGO MTOORI, case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) end MTOLOC, case when A.TMONID=''D'' then A.CARGO else round(A.CARGO/'+xTCambio+',2) end MTOEXT, '
                  + '        A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        TRUNC(SYSDATE,''DD''), SYSDATE, B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, B.FECAATRI, B.FECAASEM, B.FECAASS, '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) end DMN, case when A.TMONID=''D'' then A.CARGO else round(A.CARGO/'+xTCambio+',2) end DME, 0 HMN, 0 HME, '
                  + '        0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', ROWNUM, ''CAJA'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F, CXP301 G '
                  + '  where A.NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and A.ITEM ='''    +DMTE.cdsQry7.FieldByName('ITEM').AsString +''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen_Mov+''' '
                  + '    and E.CIAID = A.CIAID '
                  + '    and E.CUENTAID = A.CTATOTAL '
                  + '    and F.CIAID(+) = A.CIAID '
                  + '    and A.DOCID =  G.DOCID '
                  + '    and A.CPSERIE =  G.CPSERIE '
                  + '    and A.CPNODOC =  G.CPNODOC ';
            //      + '  group by A.CIAID, A.TMONID, C.TDIARABR, E.CTAABR,  G.CTADEBE, CIAABR';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

            // DETALLE 2(B) - Inserta en el Haber para xCia = '02'  - 104...
            //xGlosa_d, CAJA, CAJA, A Cuenta
            xSQL := ' Insert into CNT311(CIAID, TDIARID, CNTCOMPROB, CNTANO, CNTANOMM, CNTLOTE, CUENTAID, CLAUXID, AUXID, '
                  + '                    DOCID, CNTSERIE, CNTNODOC, CNTGLOSA, CNTDH, CCOSID, CNTTCAMBIO, '
                  + '                    CNTMTOORI, CNTMTOLOC, CNTMTOEXT, '
                  + '                    CNTFEMIS, CNTFVCMTO, CNTFCOMP, CNTESTADO, CNTCUADRE, CNTFAUTOM, CNTUSER, '
                  + '                    CNTFREG, CNTHREG, CNTMM, CNTDD, CNTTRI, CNTSEM, CNTSS, CNTAATRI, CNTAASEM, CNTAASS, '
                  + '                    TMONID, FLAGVAR, FCONS, CNTFMEC, TDIARDES, CTADES, AUXDES, DOCDES, CCOSDES, '
                  + '                    CNTDEBEMN, CNTDEBEME, CNTHABEMN, CNTHABEME, '
                  + '                    CNTSALDMN, CNTSALDME, CAMPOVAR, CNTTS, '
                  + '                    CNTPAGADO, CNTMODDOC, CNTREG, MODULO, CTA_SECU ) '
                  + ' Select A.CIAID, '''+xOrigen_Mov+''' TDIARID, '''+xNoComp_Mov+''' CNTCOMPROB, b.fecano, '''+xPeriodo+''', '''+xLote+''', '''+xCtaOpexLiq+''', NULL, NULL, '
                  + '        ''14'', ''OP'', A.OPERACION, '+ xGlosa_d2 +' GLOSA, ''H'', NULL, '+xTCambio+', '
                  + '        A.CARGO MTOORI, case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) end MTOLOC, case when A.TMONID=''D'' then A.CARGO else round(A.CARGO/'+xTCambio+',2) end MTOEXT, '
                  + '        A.FECHA, A.FECHA, '''+sFecReg+''', ''I'', ''N'', ''N'', '''+DMTE.wUsuario+''', '
                  + '        TRUNC(SYSDATE,''DD''), SYSDATE, B.FECMES, B.FECDIA, B.FECTRIM, B.FECSEM, B.FECSS, B.FECAATRI, B.FECAASEM, B.FECAASS, '
                  + '        A.TMONID, NULL, NULL, NULL, C.TDIARABR, E.CTAABR, NULL, ''A Cuenta'', NULL, '
                  + '        0 DMN, 0 DME, case when A.TMONID=''N'' then A.CARGO else round(A.CARGO*'+xTCambio+',2) end HMN, case when A.TMONID=''D'' then A.CARGO ELSE round(A.CARGO/'+xTCambio+',2) end HME, '
                  + '        0, 0, '''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''', NULL, '
                  + '        NULL, ''CAJA'', ROWNUM, ''CAJA'', NULL '
                  + '   from CAJ_TAR_CRE_DET A, TGE114 B, TGE104 C, TGE202 E, TGE101 F '
                  + '  where A.NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and A.CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and A.ECNOCOMP  IS NULL '
                  + '    and A.USUMAR='''    +DMTE.wUsuario+''' '
                  + '    and A.ITEM ='''    +DMTE.cdsQry7.FieldByName('ITEM').AsString +''' '
                  + '    and B.FECHA(+)='''  +sFecReg+''' '
                  + '    and C.TDIARID(+)='''+xOrigen_Mov+''' '
                  + '    and E.CIAID = A.CIAID '
                  + '    and E.CUENTAID =  '''+xCtaOpexLiq+''' '
                  + '    and F.CIAID(+) = A.CIAID ';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

            // Grabar en los registros marcados el asiento contable al que pertenecen
            xSQL := ' Update CAJ_TAR_CRE_DET SET TDIARID='''+xOrigen_Mov+''', ECNOCOMP='''+xNoComp_Mov+''', ECANOMM='''+xPeriodo+''' '
                  + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                  + '    and CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                  + '    and ECNOCOMP  IS NULL '
                  + '    and USUMAR='''+DMTE.wUsuario+''''
                  + '    and ITEM ='''    +DMTE.cdsQry7.FieldByName('ITEM').AsString +''' ';
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

            // Enumerando nuevamente el detalle del comprobante
            xSQL:= 'Update CNT311 SET CNTREG  =  ROWNUM '
                 + ' where CIAID    = ' + QuotedStr(xCiaId_Mov)
                 + '   and TDIARID    = ' + QuotedStr(xOrigen_Mov)
                 + '   and CNTANOMM   = ' + QuotedStr(xPeriodo)
                 + '   and CNTCOMPROB = ' + QuotedStr(xNoComp_Mov) ;
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);


            xSQL:='Select CIAID, DOCID, CPSERIE, CPNODOC, CARGO CPMTOORI '
                 +  'from CAJ_TAR_CRE_DET '
                 + '  where NUMERO='''+DMTE.cdsCabTranf.FieldByName('NUMERO').AsString +''' '
                 + '    and CIAID = ' + QuotedStr(xCiaId_Mov)+' '
                 + '    and ITEM ='''    +DMTE.cdsQry7.FieldByName('ITEM').AsString +''' ';
            DMTE.cdsQry.Close;
            DMTE.cdsQry.DataRequest( xSQL );
            DMTE.cdsQry.Open;
            xSQL:='update CXP301 '
                 +  ' set cppagori=cpmtoori, cppagloc=cpmtoloc, cppagext=cpmtoext, '
                 +      ' cpsalori=0, cpsalloc=0, cpsalext=0, '
                 +      ' cpestado=''C'' '
                 + 'where CIAID='''   + DMTE.cdsQry.FieldByName('CIAID').AsString +''' '
                 +  ' and DOCID='''+ DMTE.cdsQry.FieldByName('DOCID').AsString +''' '
                 +  ' and CPSERIE=''' + DMTE.cdsQry.FieldByName('CPSERIE').AsString +''' '
                 +  ' and CPNODOC=''' + DMTE.cdsQry.FieldByName('CPNODOC').AsString +''' '
                 +  ' and CPMTOORI='  + DMTE.cdsQry.FieldByName('CPMTOORI').AsString;
            DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);

         end;

         DMTE.cdsQry7.Next;
      end;
      ShowMessage('Contabización OK');
   except
      ShowMessage('Error al Contabilizar');
   end;
end;
//Fin_HPC_201702_CAJA

end.


unit Caja283;
//------------------------------------------------------------------------------------
// Unidad                   : Caja283
// Formulario               : FTarjetaImportarDet
// Fecha de Creación        : 15/12/2003
// Autor                    : Equipo de Desarrollo.
// Objetivo                 : Detalle de Movimientos
// Fecha de Actualización   : 15/07/2015
//------------------------------------------------------------------------------------
// HPC_201404_CAJA      25/09/2014  Se está agregando la condición para Express net
//                                  ya que actualmente el nombre se inicia con CIA DE SERV
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
  Dialogs, Grids, Wwdbigrd, Wwdbgrid, StdCtrls, wwdbdatetimepicker, Mask,
  wwdbedit, ExtCtrls, wwdblook, Buttons, ComCtrls, db, DBGrids;

type
  TFTarjetaImportarDet = class(TForm)
    dbgConta: TwwDBGrid;
    Panel1: TPanel;
    dbeNumero: TwwDBEdit;
    dtpFecha: TwwDBDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Panel2: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    bbtnBusca: TBitBtn;
    dtpFecBus: TwwDBDateTimePicker;
    meImporte: TMaskEdit;
    Z2bbtnSalir: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    bbtnMarcar: TBitBtn;
    BitBtn1: TBitBtn;
    meTOT: TMaskEdit;
    Edit_operacion: TEdit;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Rb_Todos: TRadioButton;
    Rb_NoIdentificados: TRadioButton;
    Panel_resumen: TPanel;
    Label6: TLabel;
    Aceptar: TButton;
    dbgResumen: TwwDBGrid;
    Btn_resumen: TButton;
    Rb_PorEntidad: TRadioButton;
    Rb_PorCompania: TRadioButton;
    procedure FormActivate(Sender: TObject);
    procedure dbgContaDblClick(Sender: TObject);
    procedure bbtnBuscaClick(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcCiaExit(Sender: TObject);
    procedure bbtnMarcarClick(Sender: TObject);
    procedure Z2bbtnSalirClick(Sender: TObject);
    procedure dbgContaTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure BitBtn1Click(Sender: TObject);
    procedure Rb_NoIdentificadosClick(Sender: TObject);
    procedure Rb_todosClick(Sender: TObject);
    procedure Btn_resumenClick(Sender: TObject);
    procedure Rb_PorEntidadClick(Sender: TObject);
    procedure Rb_PorCompaniaClick(Sender: TObject);
    procedure AceptarClick(Sender: TObject);
    //Inicio_HPC_201702_CAJA  Pago de Servicios
    Procedure MarcarItem;
    Procedure MarcarItemPagoServicio;
    //Fin_HPC_201702_CAJA
  private
    { Private declarations }

  public
    { Public declarations }
    
  end;

var
  FTarjetaImportarDet: TFTarjetaImportarDet;

implementation

{$R *.dfm}
//Inicio_HPC_201702_CAJA  Pago de Servicios
USES CAJADM, CAJA283A;
//Fin_HPC_201702_CAJA

procedure TFTarjetaImportarDet.FormActivate(Sender: TObject);
begin
  dbgConta.Selected.Clear;
  dbgConta.Selected.Add('ITEM'#9'5'#9'Item'#9'F');
  dbgConta.Selected.Add('FECHA'#9'11'#9'Fecha'#9'F');
  //inicio SAR2010-0213   DAD-AS-2010-0010
  //dbgConta.Selected.Add('REFER'#9'25'#9'Referencia'#9'F');
  dbgConta.Selected.Add('REFER'#9'20'#9'Referencia'#9'F');
  //fin SAR2010-0213
  dbgConta.Selected.Add('CARGO'#9'10'#9'Cargo'#9'F');
  dbgConta.Selected.Add('ABONO'#9'10'#9'Abono'#9'F');
  dbgConta.Selected.Add('AGENCIA'#9'10'#9'Agencia'#9'F');
  dbgConta.Selected.Add('OPERACION'#9'8'#9'Operación'#9'F');
  //inicio SAR2010-0213   DAD-AS-2010-0010
  //dbgConta.Selected.Add('CIAID'#9'5'#9'Cía'#9'F');
  dbgConta.Selected.Add('CIAID'#9'4'#9'Cía'#9'F');
  //fin SAR2010-0213
  dbgConta.Selected.Add('USUMAR'#9'12'#9'Usuario'#9'F');
  //inicio SAR2010-0213   DAD-AS-2010-0010
  dbgConta.Selected.Add('ECANOMM'#9'7'#9'Periodo'#9'F');
  dbgConta.Selected.Add('ECNOCOMP'#9'12'#9'Nº Comprob'#9'F');
  //fin SAR2010-0213
  //inicio SAR2010-0268   DAD-AS-2010-0014
  dbgConta.Selected.Add('TDIARID'#9'12'#9'T. Diario'#9'F');
  //fin SAR2010-0268

  //Inicio_HPC_201702_CAJA  Pago de Servicios
  dbgConta.Selected.Add('DOCID'#9'10'#9'Documento'#9'F');
  dbgConta.Selected.Add('CPSERIE'#9'8'#9'Serie'#9'F');
  dbgConta.Selected.Add('CPNODOC'#9'12'#9'Número'#9'F');
  dbgConta.Selected.Add('CTATOTAL'#9'12'#9'Cuenta'#9'F');
  dbgConta.DataSource:=DMTE.dsTarCreTransf;

  TNumericField(DMTE.cdsTarCreTransf.FieldbyName('CARGO')).displayFormat:= '#######0.00';
  TNumericField(DMTE.cdsTarCreTransf.FieldbyName('ABONO')).displayFormat:= '#######0.00';
  //Fin_HPC_201702_CAJA
end;

//Inicio_HPC_201702_CAJA
// nuevo procedimiento ejecutado en el evento docle clic de un item de la bandeja de transancciones
// si item en proceso pertenece a Pago de Servicio (PSER) se ejecuta un procedimiento  MarcarItemPagoServicio
// caso contrario sejecuta el procedimiento MarcarItem()
procedure TFTarjetaImportarDet.dbgContaDblClick(Sender: TObject);
begin

   if (DMTE.cdsCabTranf.FieldByname('LOTE').AsString = 'PSER') then
      MarcarItemPagoServicio()
   else
      MarcarItem();
end;
//Fin_HPC_201702_CAJA

//Inicio_HPC_201702_CAJA
//Se comento el procedimiento dbgContaDblClick() y se copio su contenido en el nuevo procedimiento MarcarItem()
(*procedure TFTarjetaImportarDet.dbgContaDblClick(Sender: TObject);
var
  i : Integer;
  X: Word;
  TempBookmark: TBookMark;
begin

   //inicio SAR2010-0213   DAD-AS-2010-0010
   if length(DMTE.cdsTarCreTransf.FieldByName('ECNOCOMP').AsString) > 0 then
   begin
      ShowMessage('Este registro ya fue contabilizado. No puede marcarlo nuevamente');
      Exit;
   end;
   If (DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString = '') And (LENGTH(dblcCia.Text) = 0) Then
   Begin
      EXIT;
   End;
   //fin SAR2010-0213
   if (DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString=DMTE.wUsuario) or (DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString='') then
   begin
      if dblcCia.Text<>'' then
      begin
         DMTE.cdsTarCreTransf.Edit;
         DMTE.cdsTarCreTransf.FieldByName('CIAID').AsString :=dblcCia.Text;
         DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString:=DMTE.wUsuario;

      end
      else
      begin
         DMTE.cdsTarCreTransf.Edit;
         DMTE.cdsTarCreTransf.FieldByName('CIAID').AsString :='';
         DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString:='';

      end;

        {if dbgConta.dgRowSelect.Count > 0 then
        begin
          with dbgConta.DataSource.DataSet do
          begin
            for i := 0 to dbgConta.dgRowSelect.Count-1 do
            begin
              GotoBookmark(Pointer(dbgConta.dgRowSelect.Items[i]));
            end;
          end;
        end
         }


   end
   else
   begin
      ShowMessage('No se puede Marcar Registro. Fue marcado por '+DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString);
      Exit;
   end;
   DMTE.cdsTarCreTransf.Post;
   DMTE.cdsTarCreTransf.ApplyUpdates(0);
end; *)
//Fin_HPC_201702_CAJA

procedure TFTarjetaImportarDet.bbtnBuscaClick(Sender: TObject);
var
   xSQL : String;
begin
// Inicio HPC_201702_CAJA  Busqueda de Cargo y Abono
   xSQL:='Select NUMERO, ITEM, FECHA, REFER, CARGO, ABONO, AGENCIA, OPERACION, '
       + '       MARCA, CIAID, TDIARID, ECANOMM, ECNOCOMP, USUARIO, FREG, '
       + '       TMONID, USUMAR, DOCID, CPSERIE, CPNODOC, CTATOTAL '
       + ' from CAJ_TAR_CRE_DET where NUMERO='''+DMTE.cdsCabTranf.FieldByname('NUMERO').AsString+''' ';

   if dtpFecBus.date>0 then
        xSQL:=xSQL+' and FECHA ='''+dateToStr(dtpFecBus.date)+'''';

   if Length(meImporte.text)>0 then
        xSQL:=xSQL+' and ( ABONO='+meImporte.text+' OR CARGO='+meImporte.text+ ' ) ';
// Fin    HPC_201702_CAJA

   //inicio SAR2010-0213   DAD-AS-2010-0010
   if Length(Edit_operacion.text)>0 then
        xSQL:=xSQL+' and OPERACION like '+ Quotedstr('%'+Edit_operacion.text )+' ';
   if Rb_NoIdentificados.checked then
        xSQL:=xSQL+' and ECNOCOMP IS NULL ';
   //fin SAR2010-0213
   xSQL:=xSQL+' order by ITEM';
   DMTE.cdsTarCreTransf.Close;
   DMTE.cdsTarCreTransf.DataRequest( xSQL );
   DMTE.cdsTarCreTransf.Open;

  // Inicio HPC_201702_CAJA  Cargo y Abono
  TNumericField(DMTE.cdsTarCreTransf.FieldbyName('CARGO')).displayFormat:= '#######0.00';
  TNumericField(DMTE.cdsTarCreTransf.FieldbyName('ABONO')).displayFormat:= '#######0.00';
  //Fin_HPC_201702_CAJA
end;

procedure TFTarjetaImportarDet.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFTarjetaImportarDet.dblcCiaExit(Sender: TObject);
begin
   edtCia.text:= DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIADES') ;
end;

procedure TFTarjetaImportarDet.bbtnMarcarClick(Sender: TObject);
begin

   //Inicio_HPC_201702_CAJA   Pago de Servicios
   if (DMTE.cdsCabTranf.FieldByname('LOTE').AsString = 'PSER') then
      MarcarItemPagoServicio()
   else
      MarcarItem();

   //dbgContaDblClick(self);
   //Fin_HPC_201702_CAJA
end;

procedure TFTarjetaImportarDet.Z2bbtnSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TFTarjetaImportarDet.dbgContaTitleButtonClick(Sender: TObject;
  AFieldName: String);
var
   xTitLabel : String;
begin
   //pnlBusca.Visible := True;
   //isBusca.SearchField := AFieldName;
   dbgConta.SetActiveField( AFieldName );
   DMTE.CdsTarCreTransf.IndexFieldNames:=AFieldName;
//   xTitLabel := dbgFiltro.SelectedField.DisplayLabel;
//   xTitLabel[ Pos('~',xTitLabel)] := ' ';
//   lblBusca2.caption := xTitLabel;
//   isBusca.SetFocus;
end;

procedure TFTarjetaImportarDet.BitBtn1Click(Sender: TObject);
var
   nTot : Double;
begin
   DMTE.cdsTarCreTransf.First;
   nTot:=0;
   while not DMTE.cdsTarCreTransf.Eof do
   begin
      if DMTE.cdsTarCreTransf.FieldByname('CIAID').AsString=dblcCia.text then
         nTot:=nTot+DMTE.cdsTarCreTransf.FieldByname('ABONO').AsFloat;
      DMTE.cdsTarCreTransf.next;
   end;
   meTot.text:= FloatToStr(ntot);
end;

procedure TFTarjetaImportarDet.Rb_NoIdentificadosClick(Sender: TObject);
begin
   Rb_NoIdentificados.checked := true;
   Rb_todos.checked:= false;
   bbtnBuscaClick(self);
end;

procedure TFTarjetaImportarDet.Rb_todosClick(Sender: TObject);
begin
   bbtnBuscaClick(self);
   Rb_NoIdentificados.checked := false;
   Rb_todos.checked:= true;   
end;

procedure TFTarjetaImportarDet.Btn_resumenClick(Sender: TObject);
var
xSQL: String;
begin
   if not Rb_PorCompania.Checked and Rb_PorEntidad.Checked then
   begin
      Rb_PorEntidad.Checked := true;
   end;

   if Rb_PorCompania.Checked then
   begin
      dbgResumen.Selected.Clear;
      dbgResumen.Selected.Add('COMPAÑIA'#9'15'#9'Compañia'#9'F');
      dbgResumen.Selected.Add('CARGO_CONTA'#9'8'#9'Contab~Cargo'#9'F');
      dbgResumen.Selected.Add('ABONO_CONTA'#9'8'#9'Contab~Abono'#9'F');
      dbgResumen.Selected.Add('CARGO_IDENTIF'#9'8'#9'Identif~Cargo'#9'F');
      dbgResumen.Selected.Add('ABONO_IDENTIF'#9'8'#9'Identif~Abono'#9'F');
      dbgResumen.Selected.Add('TOTAL_CARGO'#9'8'#9'Total~Cargo'#9'F');
      dbgResumen.Selected.Add('TOTAL_ABONO'#9'8'#9'Total~Abono'#9'F');

      xSQL := ' Select a.CIAID||'+QuotedStr(' ')+ '||b.CIAABR COMPAÑIA, '
                  + ' SUM(case when not a.TDIARID is null then nvl(a.CARGO,0) else 0 end) CARGO_CONTA,'
                  + ' SUM(case when not a.TDIARID is null then nvl(a.ABONO,0) else 0 end) ABONO_CONTA,'
                  + ' SUM(case when (a.TDIARID is null and not a.CIAID is null) then nvl(a.CARGO,0) else 0 end) CARGO_IDENTIF,'
                  + ' SUM(case when (a.TDIARID is null and not a.CIAID is null) then nvl(a.ABONO,0) else 0 end) ABONO_IDENTIF,'
                  + ' SUM(nvl(a.CARGO,0)) TOTAL_CARGO,'
                  + ' SUM(nvl(a.ABONO,0)) TOTAL_ABONO'
                  + ' from CAJ_TAR_CRE_DET a, TGE101 b where a.CIAID = b.CIAID(+) and a.NUMERO='+QuotedStr(DMTE.cdsCabTranf.FieldByname('NUMERO').AsString)
                  + ' GROUP BY a.CIAID,b.CIAABR ';
   end;
   if Rb_PorEntidad.Checked then
   begin
      dbgResumen.Selected.Clear;
      dbgResumen.Selected.Add('ENTIDAD'#9'15'#9'Entidad'#9'F');
      dbgResumen.Selected.Add('CARGO_CONTA'#9'8'#9'Contab~Cargo'#9'F');
      dbgResumen.Selected.Add('ABONO_CONTA'#9'8'#9'Contab~Abono'#9'F');
      dbgResumen.Selected.Add('CARGO_IDENTIF'#9'8'#9'Identif~Cargo'#9'F');
      dbgResumen.Selected.Add('ABONO_IDENTIF'#9'8'#9'Identif~Abono'#9'F');
      dbgResumen.Selected.Add('CARGO_NOIDENTIF'#9'8'#9'NoIden~Cargo'#9'F');
      dbgResumen.Selected.Add('ABONO_NOIDENTIF'#9'8'#9'NoIden~Abono'#9'F');
      dbgResumen.Selected.Add('CARGO_TOTAL'#9'8'#9'Total~Cargo'#9'F');
      dbgResumen.Selected.Add('ABONO_TOTAL'#9'8'#9'Total~Abono'#9'F');

      xSQL:= ' Select (case when instr(REFER,' + QuotedStr('VISANET')+')>0 then '+QuotedStr('VISANET')
                  + ' else( case when instr(REFER,'+ QuotedStr('EXPRESSNET')+')>0 then '+QuotedStr('EXPRESSNET')
// Inicio HPC_201404_CAJA
                  + ' else( case when instr(REFER,'+ QuotedStr('CIA DE SERV')+')>0 then '+QuotedStr('CIA DE SERV')
                  + ' else( case when instr(REFER,'+ QuotedStr('DINERS')+ ')>0 then '+ QuotedStr('DINERS CLUB')
                  + ' else( case when instr(REFER,'+ QuotedStr('PROCESOS')+')>0 then '+QuotedStr('PROCESOS')+' else '+QuotedStr('OTROS')+' end) end) end) end) end) ENTIDAD ,'
// Fin HPC_201404_CAJA                  
                  + ' SUM(case when not TDIARID is null then nvl(CARGO,0) else 0 end) CARGO_CONTA,'
                  + ' SUM(case when not TDIARID is null then nvl(ABONO,0) else 0 end) ABONO_CONTA,'
                  + ' SUM(case when (TDIARID is null and not CIAID is null) then nvl(CARGO,0) else 0 end) CARGO_IDENTIF,'
                  + ' SUM(case when (TDIARID is null and not CIAID is null) then nvl(ABONO,0) else 0 end) ABONO_IDENTIF,'
                  + ' SUM(case when  CIAID is null then nvl(CARGO,0) else 0 end) CARGO_NOIDENTIF,'
                  + ' SUM(case when  CIAID is null then nvl(ABONO,0) else 0 end) ABONO_NOIDENTIF,'
                  + ' SUM(nvl(CARGO,0)) CARGO_TOTAL,'
                  + ' SUM(nvl(ABONO,0)) ABONO_TOTAL'
                  + ' from CAJ_TAR_CRE_DET where NUMERO='+QuotedStr(DMTE.cdsCabTranf.FieldByname('NUMERO').AsString)
                  + ' GROUP BY (case when instr(REFER,' + QuotedStr('VISANET')+')>0 then '+QuotedStr('VISANET')
                  + ' else( case when instr(REFER,'+ QuotedStr('EXPRESSNET')+')>0 then '+QuotedStr('EXPRESSNET')
// Inicio HPC_201404_CAJA
                  + ' else( case when instr(REFER,'+ QuotedStr('CIA DE SERV')+')>0 then '+QuotedStr('CIA DE SERV')
                  + ' else( case when instr(REFER,'+ QuotedStr('DINERS')+ ')>0 then '+ QuotedStr('DINERS CLUB')
                  + ' else( case when instr(REFER,'+ QuotedStr('PROCESOS')+')>0 then '+QuotedStr('PROCESOS')+' else '+QuotedStr('OTROS')+' end) end) end) end) end) ';
// Fin HPC_201404_CAJA
   end;
   dbgResumen.Datasource := DMTE.dsQry6;
   DMTE.cdsQry6.Close;
   DMTE.cdsQry6.DataRequest( xSQL );
   DMTE.cdsQry6.Open;

   Panel_resumen.visible := true;


end;

procedure TFTarjetaImportarDet.Rb_PorEntidadClick(Sender: TObject);
begin
   Rb_PorEntidad.Checked := true;
   Rb_PorCompania.Checked := false;
   Btn_resumenClick(self);
end;

procedure TFTarjetaImportarDet.Rb_PorCompaniaClick(Sender: TObject);
begin
   Rb_PorEntidad.Checked := false;
   Rb_PorCompania.Checked := true;
   Btn_resumenClick(self);   
end;

procedure TFTarjetaImportarDet.AceptarClick(Sender: TObject);
begin
   Panel_resumen.visible := false;
end;

//Inicio_HPC_201702_CAJA, nuevo proceso de marcar item para pagos automaticos de servicios
procedure TFTarjetaImportarDet.MarcarItemPagoServicio();
var
   xSQL: String;
begin
   If DMTE.cdsCabTranf.FieldByname('LOTE').AsString <> 'PSER' Then
   Begin
      EXIT;
   End;

   If (DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString = '') And (LENGTH(dblcCia.Text) = 0) Then
   Begin
      EXIT;
   End;
   If length(DMTE.cdsTarCreTransf.FieldByName('ABONO').AsString) > 0 then
   Begin
      ShowMessage('No se puede Marcar Registro. Solo se contabiliza CARGOS');
      Exit;
   End;

   If (DMTE.cdsTarCreTransf.FieldByName('ECNOCOMP').AsString <> '') Then
   Begin
      ShowMessage('No se puede Marcar Registro. Porque ya esta contabilizado');
      Exit;
   End;

   If (DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString <> '') And (LENGTH(dblcCia.Text) = 0) Then
   Begin
      DMTE.cdsTarCreTransf.Edit;
      DMTE.cdsTarCreTransf.FieldByName('CIAID').AsString :='';
      DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString:='';
      DMTE.cdsTarCreTransf.FieldByName('DOCID').AsString :='';
      DMTE.cdsTarCreTransf.FieldByName('CPSERIE').AsString :='';
      DMTE.cdsTarCreTransf.FieldByName('CPNODOC').AsString:='';
      DMTE.cdsTarCreTransf.FieldByName('CTATOTAL').AsString:='';

      DMTE.cdsTarCreTransf.Post;
      DMTE.cdsTarCreTransf.ApplyUpdates(0);
      EXIT;
   End;

   FSelDocPagoServicio:=TFSelDocPagoServicio.Create(Self);
   FSelDocPagoServicio.sCiaId :=  dblcCia.Text;
   FSelDocPagoServicio.ShowModal;
   FSelDocPagoServicio.Free;

end;
//Fin_HPC_201702_CAJA

//Inicio_HPC_201702_CAJA  Pago de Servicios
procedure TFTarjetaImportarDet.MarcarItem();
begin

   if length(DMTE.cdsTarCreTransf.FieldByName('CARGO').AsString) > 0 then
   begin
      ShowMessage('No se puede Marcar Registro. Solo se contabiliza ABONOS');
      Exit;
   end;

   if length(DMTE.cdsTarCreTransf.FieldByName('ECNOCOMP').AsString) > 0 then
   begin
      ShowMessage('Este registro ya fue contabilizado. No puede marcarlo nuevamente');
      Exit;
   end;
   If (DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString = '') And (LENGTH(dblcCia.Text) = 0) Then
   Begin
      EXIT;
   End;
   if (DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString=DMTE.wUsuario) or (DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString='') then
   begin
      if dblcCia.Text<>'' then
      begin
         DMTE.cdsTarCreTransf.Edit;
         DMTE.cdsTarCreTransf.FieldByName('CIAID').AsString :=dblcCia.Text;
         DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString:=DMTE.wUsuario;
         DMTE.cdsTarCreTransf.FieldByName('DOCID').AsString :='';
         DMTE.cdsTarCreTransf.FieldByName('CPSERIE').AsString :='';
         DMTE.cdsTarCreTransf.FieldByName('CPNODOC').AsString:='';
         DMTE.cdsTarCreTransf.FieldByName('CTATOTAL').AsString:='';
      end
      else
      begin
         DMTE.cdsTarCreTransf.Edit;
         DMTE.cdsTarCreTransf.FieldByName('CIAID').AsString :='';
         DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString:='';
         DMTE.cdsTarCreTransf.FieldByName('DOCID').AsString :='';
         DMTE.cdsTarCreTransf.FieldByName('CPSERIE').AsString :='';
         DMTE.cdsTarCreTransf.FieldByName('CPNODOC').AsString:='';
         DMTE.cdsTarCreTransf.FieldByName('CTATOTAL').AsString:='';
      end;

   end
   else
   begin
      ShowMessage('No se puede Marcar Registro. Fue marcado por '+DMTE.cdsTarCreTransf.FieldByName('USUMAR').AsString);
      Exit;
   end;
   DMTE.cdsTarCreTransf.Post;
   DMTE.cdsTarCreTransf.ApplyUpdates(0);
end;
//Fin_HPC_201702_CAJA

end.

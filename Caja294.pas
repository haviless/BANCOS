unit Caja294;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, wwdbdatetimepicker, Mask, wwdbedit, Wwdbdlg, StdCtrls, wwdblook,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Buttons, DB;

type
  TFPagoGlobalSel = class(TForm)
    Panel1: TPanel;
    dbgPendientes: TwwDBGrid;
    Panel2: TPanel;
    dbgDocPago: TwwDBGrid;
    Panel3: TPanel;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Label23: TLabel;
    dblcClase: TwwDBLookupCombo;
    dblcdAux: TwwDBLookupComboDlg;
    dbeGiradoA: TwwDBEdit;
    Label1: TLabel;
    lblTMon: TLabel;
    dblcTMon: TwwDBLookupCombo;
    edtTMon: TEdit;
    lblFComp: TLabel;
    dtpFInicio: TwwDBDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    dtpFFin: TwwDBDateTimePicker;
    BitBtn1: TBitBtn;
    edtClase: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    procedure BitBtn1Click(Sender: TObject);
    procedure dblcClaseExit(Sender: TObject);
    procedure dblcdAuxEnter(Sender: TObject);
    procedure dblcTMonExit(Sender: TObject);
    procedure dblcTMonNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcdAuxExit(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure dblcCiaNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dblcClaseNotInList(Sender: TObject; LookupTable: TDataSet;
      NewValue: String; var Accept: Boolean);
    procedure dbgPendientesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbgDocPagoEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dbgPendientesDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgDocPagoDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure dbgPendientesEndDrag(Sender, Target: TObject; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPagoGlobalSel: TFPagoGlobalSel;

implementation

{$R *.dfm}

uses CAJADM;

procedure TFPagoGlobalSel.BitBtn1Click(Sender: TObject);
var
   xSQL : String;
begin
   xSQL:='SELECT * FROM CXP301 WHERE CPESTADO IN (''P'',''C'') ';
   if edtCia.Text<>'' then
   	  xSQL:=xSQL+' and CIAID='''  +dblcCia.Text  +'''';
   if edtClase.Text<>'' then
	 		xSQL:=xSQL+' and CLAUXID='''+dblcClase.Text+'''';
   if dbeGiradoA.Text<>'' then
      xSQL:=xSQL+' and PROV='''   +dblcdAux.Text +'''';
   if edtTMon.Text<>'' then
      xSQL:=xSQL+' and TMONID=''' +dblcTMon.Text +'''';
   if dtpFInicio.Date<>0 then
      xSQL:=xSQL+' and CPFCMPRB>='''+dtpFInicio.Text+'''';
   if dtpFFin.Date<>0 then
      xSQL:=xSQL+' and CPFCMPRB<='''+dtpFFin.Text   +'''';

	 DMTE.cdsMovCxP.Close;
	 DMTE.cdsMovCxP.Datarequest(xSQL);
	 DMTE.cdsMovCxP.Open;
   DMTE.cdsMovCxP.IndexFieldNames:='CLAUXID;PROV;CPNODOC';

   // vhn 22/01/2001
   xSQL:='Select * from CAJA303 '
        +'Where CIAID='''' and ECANOMM='''' and '
        +      'TDIARID='''' and ECNOCOMP='''' ';
   DMTE.cdsDocPago.Close;
   DMTE.cdsDocPago.DataRequest( xSQL );
   DMTE.cdsDocPago.Open;

end;

procedure TFPagoGlobalSel.dblcClaseExit(Sender: TObject);
var
   xSQLx : string ;
begin

   edtClase.text:= DMTE.DisplayDescripLocal(DMTE.cdsClaseAux,'CLAUXID',dblcClase.Text,'CLAUXDES') ;

   if edtClase.Text='' then begin
      dblcdAux.Text  := '' ;
      dbeGiradoA.Text:= '' ;
      ShowMessage('Error : Clase de Auxiliar');
      dblcClase.SetFocus;
      Exit;
   end;

   xSQLx:='Select * from CNT201 Where CLAUXID='''+dblcClase.Text+'''';
   DMTE.cdsAux.Close;
   DMTE.cdsAux.DataRequest( xSQLx ) ;
   DMTE.cdsAux.Open;

   dblcdAux.Selected.Clear;
   dblcdAux.Selected.Add('AUXID'#9'10'#9'Auxiliar'#9'F');
   dblcdAux.Selected.Add('AUXRUC'#9'15'#9'R.U.C'#9'F');
   dblcdAux.Selected.Add('AUXNOMB'#9'40'#9'Nombre Auxiliar'#9'F');
end;

procedure TFPagoGlobalSel.dblcdAuxEnter(Sender: TObject);
begin
   if dblcClase.Text='' then
      dblcdAux.SetFocus;
end;

procedure TFPagoGlobalSel.dblcTMonExit(Sender: TObject);
var
   xWhere :String;
begin
   edtTMon.text:= DMTE.DisplayDescripLocal(DMTE.cdsTMon,'TMONID',dblcTMon.Text,'TMONDES') ;

   if edtTMon.Text='' then begin
      edtTmon.text   :='';
      dblcTMon.Text  :='';
      ShowMessage('Error : Moneda no Valida');
   end;
end;

procedure TFPagoGlobalSel.dblcTMonNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFPagoGlobalSel.dblcdAuxExit(Sender: TObject);
var
  xAuxt: string ;
begin
	 xAuxt:= DMTE.DisplayDescripLocal(DMTE.cdsAux,'AUXID',dblcdAux.Text,'AUXID') ;

	 if DMTE.cdsAux.FieldByName('AUXGIRA').AsString='' then
			dbeGiradoA.Text := DMTE.cdsAux.FieldByName('AUXNOMB').Asstring
	 else
			dbeGiradoA.Text := DMTE.cdsAux.FieldByName('AUXGIRA').Asstring ;
end;

procedure TFPagoGlobalSel.dblcCiaExit(Sender: TObject);
var
   xSQL : String;
begin
   edtCia.text:= DMTE.DisplayDescripLocal(DMTE.cdsCia,'CIAID',dblcCia.Text,'CIADES') ;
end;

procedure TFPagoGlobalSel.dblcCiaNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFPagoGlobalSel.dblcClaseNotInList(Sender: TObject;
  LookupTable: TDataSet; NewValue: String; var Accept: Boolean);
begin
   Accept := LookupTable.Locate(TwwDBCustomLookupCombo(Sender).LookupField, NewValue, []);
   If not Accept Then
    TwwDBCustomLookupCombo(Sender).DropDown;
end;

procedure TFPagoGlobalSel.dbgPendientesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   if (dbgPendientes.Readonly = False) then
      dbgPendientes.BeginDrag(False)  ;
end;

procedure TFPagoGlobalSel.dbgDocPagoEndDrag(Sender, Target: TObject; X,
  Y: Integer);
var
  wSql, WECNOCOMPR, WTDIARID : string;
begin
   If (not dbgDocPago.Readonly) and (Target=dbgpendientes) Then
   begin
      DMTE.cdsMovCxP.Filtered:=False;

      if DMTE.cdsMovCxP.Locate('CIAID;TDIARID;CPANOMES;CPNOREG',
                       VarArrayOf([DMTE.cdsDocPago.FieldByName('CIAID').AsString,
                                   DMTE.cdsDocPago.FieldByName('TDIARID2').AsString,
                                   DMTE.cdsDocPago.FieldByName('CPANOMM').AsString,
                                   DMTE.cdsDocPago.FieldByName('CPNOREG').AsString]),[]) then
      begin
         {
         ////////////////////////////////////////////////////////////////////////////////////
         // variable que decide si se aplica DETRACCION y por lo tanto se anula la RETENCION
         xDTRPorc:=DMTE.cdsMovCxP.FieldByName('DTRPORC').AsFloat;
         if xDTRPorc>0 then
         begin
            lblSujetoRetencion.Visible:=False;
            WECNOCOMPR:=DMTE.cdsDocPago.FieldByName('ECNOCOMPR').AsString;
            WTDIARID:=DMTE.cdsDocPago.FieldByName('TDIARID').AsString;
            //////////////////////////////////////////////////////////////////////////////////
             // se eliminan los registros, por si se grabaron anterormente
             wSql:='DELETE FROM CAJA303 WHERE '+
                   'CIAID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CIAID').AsString)+' AND '+
                   'TDIARID='+quotedstr(WTDIARID)+' AND '+
                   'ECANOMM='+quotedstr(DMTE.cdsMovCxp.FieldByName('CPANOMES').AsString)+' AND '+
                   'ECNOCOMPR='+quotedstr(WECNOCOMPR)+' AND '+
                   'CLAUXID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CLAUXID').AsString)+' AND '+
                   'PROV='+quotedstr(DMTE.cdsMovCxp.FieldByName('PROV').AsString);
             DMTE.DCOM1.AppServer.EjecutaSQL(wSQL);

             wSql:='DELETE FROM CAJA302 WHERE '+
                   'CIAID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CIAID').AsString)+' AND '+
                   'TDIARID='+quotedstr(WTDIARID)+' AND '+
                   'ECANOMM='+quotedstr(DMTE.cdsMovCxp.FieldByName('CPANOMES').AsString)+' AND '+
                   'ECNOCOMPR='+quotedstr(WECNOCOMPR)+' AND '+
                   'CLAUXID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CLAUXID').AsString)+' AND '+
                   'PROV='+quotedstr(DMTE.cdsMovCxp.FieldByName('PROV').AsString);
                   //'TIPDET='+quotedstr('I4');
             DMTE.DCOM1.AppServer.EjecutaSQL(wSQL);

             //////////////////////////////////////////////////////////////////////////////////
             // se carga nuevamente cdsDocPago y cdsEgrCaja, con los registros que quedaron
             wSql:='SELECT * FROM CAJA303 WHERE '+
                   'CIAID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CIAID').AsString)+' AND '+
                   'TDIARID='+quotedstr(WTDIARID)+' AND '+
                   'ECANOMM='+quotedstr(DMTE.cdsMovCxp.FieldByName('CPANOMES').AsString)+' AND '+
                   'ECNOCOMPR='+quotedstr(WECNOCOMPR)+' AND '+
                   'CLAUXID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CLAUXID').AsString)+' AND '+
                   'PROV='+quotedstr(DMTE.cdsMovCxp.FieldByName('PROV').AsString);
     				 DMTE.cdsDocPago.Close;
    				 DMTE.cdsDocPago.DataRequest(wSql);
		    		 DMTE.cdsDocPago.Open;

             wSql:='SELECT * FROM  CAJA302 WHERE '+
                   'CIAID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CIAID').AsString)+' AND '+
                   'TDIARID='+quotedstr(WTDIARID)+' AND '+
                   'ECANOMM='+quotedstr(DMTE.cdsMovCxp.FieldByName('CPANOMES').AsString)+' AND '+
                   'ECNOCOMPR='+quotedstr(WECNOCOMPR)+' AND '+
                   'CLAUXID='+quotedstr(DMTE.cdsMovCxp.FieldByName('CLAUXID').AsString)+' AND '+
                   'PROV='+quotedstr(DMTE.cdsMovCxp.FieldByName('PROV').AsString);
     				 DMTE.cdsEgrCaja.Close;
    				 DMTE.cdsEgrCaja.DataRequest(wSql);
		    		 DMTE.cdsEgrCaja.Open;

             // esto se realiza para mantener la logica del programa, cuando se presiona z2bbtnOKCab
             GrabaCabeceraDeComprobante;
             ////////////////////////////////////////////////////////////////////////////////////
         end
         else
            DMTE.cdsDocPago.Delete;
         }
         ////////////////////////////////////////////////////////////////////////////////////
         DMTE.cdsMovCxP.Edit ;
         DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value := DMTE.cdsMovCxP.FieldByName('CPMTOEXT').Value - DMTE.NumeroNoNulo( DMTE.cdsMovCxP.FieldByName('CPPAGEXT') ) ;
         DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value := DMTE.cdsMovCxP.FieldByName('CPMTOLOC').Value - DMTE.NumeroNoNulo( DMTE.cdsMovCxP.FieldByName('CPPAGLOC') ) ;
         DMTE.cdsMovCxP.FieldByName('CPHREG').Value   := time;
         if DMTE.cdsMovCxP.FieldByName('TMONID').Value=DMTE.wTMonLoc then
            DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALLOC').AsFloat
         else
            DMTE.cdsMovCxP.FieldByName('CPSALORI').AsFloat := DMTE.cdsMovCxP.FieldByName('CPSALEXT').AsFloat ;

         {
         ////////////////////////////////////////////////////////////////////////////////////
         // esto se realiza para mantener la logica del programa, cuando se presiona z2bbtnOK
         if xDTRPorc>0 then
         begin
             DMTE.AplicaDatos(DMTE.cdsMovCxp,'');
             z2bbtnOKClick(Self);
         end;
         }
         ////////////////////////////////////////////////////////////////////////////////////
         dbgPendientes.RefreshDisplay;
         dbgDocPago.RefreshDisplay;
      end;
      DMTE.cdsMovCxP.Filtered:=True;
{      wmodifica:=True;}
{      z2bbtnSumatDocPagoClick(nil) ;}
   end;
end;

procedure TFPagoGlobalSel.dbgPendientesDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   if (dbgPendientes.Readonly = False) then
       Accept:=True;
end;

procedure TFPagoGlobalSel.dbgDocPagoDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   If (not dbgDocPago.Readonly) then
      Accept:=True;
end;

procedure TFPagoGlobalSel.dbgPendientesEndDrag(Sender, Target: TObject; X,
  Y: Integer);
var
  i : Integer;
begin
   if (not dbgPendientes.Readonly) and (Target=dbgDocPago) Then
   begin

      DMTE.cdsMovCxP.DisableControls;
      // Añade los Nuevos Registros
      DMTE.cdsDocPago.DisableControls;
      for i:= 0 to dbgPendientes.SelectedList.Count-1 do
      begin
          dbgPendientes.datasource.dataset.GotoBookmark(dbgPendientes.SelectedList.items[i]);

          DMTE.cdsDocPago.Insert;
//          DMTE.cdsDocPago.FieldByName('CIAID').Value    := dblcCia.Text;
//          DMTE.cdsDocPago.FieldByName('TDIARID').Value  := dblcTDiario.Text;
//          DMTE.cdsDocPago.FieldByName('ECANOMM').Value  := edtPeriodo.Text;
//          DMTE.cdsDocPago.FieldByName('ECNOCOMP').Value := dbeNoComp.Text;

          DMTE.cdsDocPago.FieldByName('CIAID2').Value   := DMTE.cdsMovCxP.FieldByName('CIAID').Value;
          DMTE.cdsDocPago.FieldByName('TDIARID2').Value := DMTE.cdsMovCxP.FieldByName('TDIARID').Value;
          DMTE.cdsDocPago.FieldByName('CPANOMM').Value  := DMTE.cdsMovCxP.FieldByName('CPANOMES').Value;
          DMTE.cdsDocPago.FieldByName('CPNOREG').Value  := DMTE.cdsMovCxP.FieldByName('CPNOREG').Value;
          DMTE.cdsDocPago.FieldByName('DOCID2').Value   := DMTE.cdsMovCxP.FieldByName('DOCID').Value;
          DMTE.cdsDocPago.FieldByName('CPSERIE').Value  := DMTE.cdsMovCxP.FieldByName('CPSERIE').Value;
          DMTE.cdsDocPago.FieldByName('CPNODOC').Value  := DMTE.cdsMovCxP.FieldByName('CPNODOC').Value;
          DMTE.cdsDocPago.FieldByName('TMONID').Value   := DMTE.cdsMovCxP.FieldByName('TMONID').Value;
          DMTE.cdsDocPago.FieldByName('DETCDOC').Value  := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPTCAMAJ').Value,8,3);
          //DMTE.cdsDocPago.FieldByName('DETCPAG').Value  := DMTE.FRound(strtofloat(dbeTCambio.Text),5,3);
          DMTE.cdsDocPago.FieldByName('CPTOID').Value   := DMTE.cdsMovCxP.FieldByName('CPTOTOT').Value;
          DMTE.cdsDocPago.FieldByName('CUENTAID').Value := DMTE.cdsMovCxP.FieldByName('CTATOTAL').Value;
          DMTE.cdsDocPago.FieldByName('CPFEMIS').Value  := DMTE.cdsMovCxP.FieldByName('CPFEMIS').Value;
          DMTE.cdsDocPago.FieldByName('CPFVCMTO').Value := DMTE.cdsMovCxP.FieldByName('CPFVCMTO').Value;
          DMTE.cdsDocPago.FieldByName('DEANO').Value    := DMTE.cdsMovCxP.FieldByName('CPAAAA').Value;
          DMTE.cdsDocPago.FieldByName('DEMM').Value     := DMTE.cdsMovCxP.FieldByName('CPMM').Value;
          DMTE.cdsDocPago.FieldByName('DEDD').Value     := DMTE.cdsMovCxP.FieldByName('CPDD').Value;
          DMTE.cdsDocPago.FieldByName('DESS').Value     := DMTE.cdsMovCxP.FieldByName('CPSS').Value;
          DMTE.cdsDocPago.FieldByName('DESEM').Value    := DMTE.cdsMovCxP.FieldByName('CPSem').Value;
          DMTE.cdsDocPago.FieldByName('DETRI').Value    := DMTE.cdsMovCxP.FieldByName('CPTri').Value;
          DMTE.cdsDocPago.FieldByName('DEAASS').Value   := DMTE.cdsMovCxP.FieldByName('CPAASS').Value;
          DMTE.cdsDocPago.FieldByName('DEAASEM').Value  := DMTE.cdsMovCxP.FieldByName('CPAASem').Value;
          DMTE.cdsDocPago.FieldByName('DEAATRI').Value  := DMTE.cdsMovCxP.FieldByName('CPAATri').Value;
          DMTE.cdsDocPago.FieldByName('PROV').Value     := DMTE.cdsMovCxP.FieldByName('PROV').Value;
          DMTE.cdsDocPago.FieldByName('PROVDES').AsString  := DMTE.cdsMovCxP.FieldByName('PROVDES').AsString;
          DMTE.cdsDocPago.FieldByName('PROVRUC').Value  := DMTE.cdsMovCxP.FieldByName('PROVRUC').Value;
          {
          if DMTE.cdsDocPago.FieldByName('TMONID').Value=DMTE.wtMonLoc then
          begin
             DMTE.cdsDocPago.FieldByName('DESALLOC').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value*xFactor,15,2);
             DMTE.cdsDocPago.FieldByName('DESALEXT').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALLOC').Value
                                          /DMTE.cdsDocPago.FieldByName('DETCPAG').Value*xFactor,15,2);
          end
          else
          begin
             DMTE.cdsDocPago.FieldByName('DESALEXT').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value*xFactor,15,2);
             DMTE.cdsDocPago.FieldByName('DESALLOC').Value:=DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPSALEXT').Value
                                          *DMTE.cdsDocPago.FieldByName('DETCPAG').Value*xFactor,15,2);
          end;
          }
          DMTE.cdsDocPago.FieldByName('DEANTMN').Value  := 0;
          DMTE.cdsDocPago.FieldByName('DEANTME').Value  := 0;
          DMTE.cdsDocPago.FieldByName('DEMTOORI').Value := DMTE.FRound(DMTE.cdsMovCxP.FieldByName('CPMTOORI').AsFloat,15,2);
          DMTE.cdsDocPago.FieldByName('DEMTOLOC').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALLOC').AsFloat,15,2);
          DMTE.cdsDocPago.FieldByName('DEMTOEXT').Value := DMTE.FRound(DMTE.cdsDocPago.FieldByName('DESALEXT').AsFloat,15,2);
          DMTE.cdsDocPago.FieldByName('DEUSER').Value   := DMTE.wUsuario;
          DMTE.cdsDocPago.FieldByName('DEFREG').Value   := dateS;
          DMTE.cdsDocPago.FieldByName('DEHREG').Value   := time;
          DMTE.cdsDocPago.fieldbyname('CLAUXID').AsString := DMTE.cdsMovCxP.FieldByName('CLAUXID').AsString ;
          DMTE.cdsDocPago.Post;

          DMTE.cdsMovCxP.Edit ;
          DMTE.cdsMovCxP.FieldByName('CPSALORI').Value := 0  ;
          DMTE.cdsMovCxP.Post ;

          dbgPendientes.datasource.dataset.Freebookmark(dbgPendientes.SelectedList.items[i]) ;
      end;

      DMTE.cdsMovCxP.EnableControls  ;
      dbgPendientes.SelectedList.clear ;  { Clear selected record list since they are all deleted}
      dbgPendientes.RefreshDisplay  ;
      dbgDocPago.RefreshDisplay     ;
      DMTE.cdsDocPago.EnableControls ;
   end;
end;

end.

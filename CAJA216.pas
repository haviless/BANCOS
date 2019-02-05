unit Caja216;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, wwdbdatetimepicker,CAJADM, ExtCtrls, CajaUtil,
  wwdblook, Mask, wwdbedit;

type
  TFCierreDiario = class(TForm)
    dbdtpFecCierre: TwwDBDateTimePicker;
    z2bbtnOK: TBitBtn;
    z2bbtnCancel: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    BitBtn1: TBitBtn;
    stUltCierre: TStaticText;
    dbeFrecu: TwwDBEdit;
    lblCia: TLabel;
    dblcCia: TwwDBLookupCombo;
    edtCia: TEdit;
    Bevel3: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel4: TBevel;
    procedure z2bbtnCancelClick(Sender: TObject);
    procedure z2bbtnOKClick(Sender: TObject);
    procedure dbdtpFecCierreExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dblcCiaChange(Sender: TObject);
    procedure dblcCiaExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCierreDiario: TFCierreDiario;

implementation

uses Caja229;


{$R *.DFM}

procedure TFCierreDiario.z2bbtnCancelClick(Sender: TObject);
begin
   Self.Close ;
end;

procedure TFCierreDiario.z2bbtnOKClick(Sender: TObject) ;
var
    xWhere       ,
    xSQL         ,
    xFecha       ,
    xFechaMax    ,
    xFechaMaxSQL ,
    xMensaje     : String ;
begin
     xFecha := FechaDB2(dbdtpFecCierre.date );
     ////////////validacion inicial///////////////////////////
     if trim( stUltCierre.Caption ) = 'Inicio de Operaciones' then
        xFechaMaxSQL := '1900-01-01'
     else
        xFechaMaxSQL := fechadb2(dbdtpFecCierre.date) ;

     //comprobar la existencia de movimientos

     xWhere := ' ECFCOMP > ' +DMTE.wRepFuncDate + '''' + xFechaMaxSQL + ''')' +
                 ' AND ECFCOMP<=' +DMTE.wRepFuncDate + ''''+xFecha+''')' +
                 ' AND ECESTADO = ''I''' ;
     DMTE.RecuperarDatos('CAJA302','COUNT(*) NUMROWS',xWhere) ;
     if DMTE.cdsRec.fieldbyname('NUMROWS').AsInteger = 0 then
     begin
        xWhere := ' CCFEMIS > ''' + xFechaMaxSQL + '''' +
                  ' AND CCFEMIS <= '''+xFecha+''''      +
                  ' AND CCTREC IN (''NP'',''RC'') '     +
                  ' AND NCOESTADO = ''I''' ;

        DMTE.RecuperarDatos('CXC303','COUNT(*) NUMROWS',xWhere) ;
        if DMTE.cdsRec.fieldbyname('NUMROWS').AsInteger <> 0 then
          Raise Exception.Create('Hay Ingresos pendientes de Cancelación'+ #13 +
                                 'No se puede Efectuar el Cierre Hasta la fecha especificada') ;
     end
     else
       Raise Exception.Create('Hay Movimientos pendientes de Cancelación'+ #13 +
                              'No se puede Efectuar el Cierre Hasta la fecha especificada') ;

     xMensaje := 'Confirme el Cierre '+
                 'del '+xFechaMax +' al '+dbdtpFecCierre.Text ;

     if MessageDlg(xMensaje, mtConfirmation,[mbYes,mbNo], 0)=mrNo then
     begin
       Exit;
     end;
      if Application.MessageBox('Confirme Cierre Operativo' ,
                                'Cierre Operativo',
                                 MB_OKCANCEL + MB_DEFBUTTON1) <> IDOK THEN
         Exit ;

     xSQL := 'UPDATE CAJA309 SET FACTIVO = ''N'''+
             ' WHERE FACTIVO = ''S'' ' ;
     try
      DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
     except
     end ; 

     xSQL := ' INSERT INTO CAJA309 (FECCIERRE,USERID,FRECUCIERRE,FACTIVO)'+
             ' VALUES('''+xFecha+''','''+DMTE.wUsuario+ ''','+dbeFrecu.Text+',''S'' )' ;

     DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
     ShowMessage('Cierre de Fecha se efectuó Satisfactoriamente');
     SELF.OnShow(NIL) ;

{
     xFecha := formatdatetime(DMTE.wFormatFecha,dbdtpFecCierre.date );
     ////////////validacion inicial///////////////////////////
     DMTE.RecuperarDatos('CAJA309',' COUNT(*) NUMROWS , MAX(FECCIERRE) FECHAMAX ','') ;
     xNumRows := DMTE.cdsRec.FieldByName('NUMROWS').AsInteger ;
     if DMTE.cdsRec.FieldByName('NUMROWS').AsInteger <> 0 then
     begin
         xfechamax := DMTE.cdsRec.fieldbyname('FECHAMAX').AsString ;
         DMTE.RecuperarDatos('CAJA309','COUNT(*) NUMROWS',
                            'FECCIERRE >= ' +DMTE.wRepFuncDate + ''''+xFecha + ''')')  ;
         if DMTE.cdsRec.FieldByName('NUMROWS').AsInteger <> 0 then
            Raise Exception.create('Esta fecha se Encuentra Cerrada') ;
     end
     else
         xfechamax := 'Inicio de Operaciones' ;

     if xNumRows = 0 then
        xFechaMaxSQL := '1900-01-01'
     else
        xFechaMaxSQL := fechadb2(strtodate(xFechaMax)) ;

     //comprobar la existencia de movimientos

     xWhere := ' ECFCOMP > ' +DMTE.wRepFuncDate + '''' + xFechaMaxSQL + ''')' +
               ' AND ECFCOMP<=' +DMTE.wRepFuncDate + ''''+xFecha+''')' +
               ' AND ECESTADO = ''I''' ;

     DMTE.RecuperarDatos('CAJA302','COUNT(*) NUMROWS',xWhere) ;
     if DMTE.cdsRec.fieldbyname('NUMROWS').AsInteger = 0 then
     begin
        //Comprobar la existencia de ordenes de pago
        xWhere := ' OPFPAGO > ' +DMTE.wRepFuncDate + '''' + xFechaMaxSQL + ''')' +
                  '  AND OPFPAGO<=' +DMTE.wRepFuncDate + ''''+xFecha+''')' +
                  '  AND OPESTADO = ''I''' ;

        DMTE.RecuperarDatos('CXP303','COUNT(*) NUMROWS',xWhere) ;
        if DMTE.cdsRec.fieldbyname('NUMROWS').AsInteger = 0 then
        begin
           //Comprobar la existencia de Notas de Cobranza
           xWhere := ' NCOFCOB > ' +DMTE.wRepFuncDate + '''' + xFechaMaxSQL + ''')' +
                     ' AND NCOFCOB<=' +DMTE.wRepFuncDate + ''''+xFecha+''')' +
                     ' AND NCOESTADO = ''I''' ;

           DMTE.RecuperarDatos('CXC303','COUNT(*) NUMROWS',xWhere) ;
           if DMTE.cdsRec.fieldbyname('NUMROWS').AsInteger <> 0 then
             Raise Exception.Create('Hay Notas de Cobranza pendientes de Cancelación'+ #13 +
                                    'No se puede Efectuar el Cierre Hasta la fecha especificada') ;

        end
        else
          Raise Exception.Create('Hay Ordenes de Pago pendientes de Cancelación'+ #13 +
                                 'No se puede Efectuar el Cierre Hasta la fecha especificada') ;
     end
     else
       Raise Exception.Create('Hay Movimientos pendientes de Cancelación'+ #13 +
                              'No se puede Efectuar el Cierre Hasta la fecha especificada') ;

     xMensaje := 'Confirme el Cierre '+
                 'del '+xFechaMax +' al '+dbdtpFecCierre.Text ;

     if MessageDlg(xMensaje, mtConfirmation,[mbYes,mbNo], 0)=mrNo then
     begin
       Exit;
     end;
     xSQL := 'INSERT INTO CAJA309 (FECCIERRE,USERID)'+
             ' VALUES(' +DMTE.wRepFuncDate + ''''+xFecha+'''),''XXX'')' ;

     DMTE.DCOM1.AppServer.EjecutaSQL(xSQL);
     ShowMessage('Cierre de Fecha se efectuó Satisfactoriamente');
}
end;

procedure TFCierreDiario.dbdtpFecCierreExit(Sender: TObject);
begin
     if dbdtpFecCierre.Date=0 then
     begin
          ShowMessage('Ingrese la Fecha de Cierre');
          dbdtpFecCierre.SetFocus ;
          exit;
     end
     else
          if dbdtpFecCierre.Date>Date then
             dbdtpFecCierre.Date := DateS;
end;

procedure TFCierreDiario.FormShow(Sender: TObject);
var
   xFechaMax : String ;
   xWhere    : String ;
begin
     RecuperarCiaUnica(dblcCia,edtCia) ;

     xWhere := 'FACTIVO = ''S'' ' ;
     if DMTE.RecuperarDatos('CAJA309','FECCIERRE,FRECUCIERRE',xWhere) then
     begin
         xFechaMax := DMTE.cdsrec.fieldbyname('FECCIERRE').AsString ;
         stUltCierre.Caption := xFechaMax ;
         dbeFrecu.Text := DMTE.cdsrec.fieldbyname('FRECUCIERRE').AsString ;
         dbdtpFecCierre.date := dbdtpFecCierre.date + DMTE.cdsrec.fieldbyname('FRECUCIERRE').AsInteger ;
     end
     else
     begin
         xFechaMax := 'Inicio de Operaciones' ;
         stUltCierre.Caption := xFechaMax     ;
         dbdtpFecCierre.date := dateS         ;
         dbeFrecu.Text       := '1'           ;
     end ;

end;

procedure TFCierreDiario.BitBtn1Click(Sender: TObject);
var
    xWhere       ,
    xFecha       ,
    xFechaMaxSQL : String  ;
begin
     //comprobar la existencia de movimientos
  try
    xFechaMaxSQL := FechaDB2(strtodatetime(stUltCierre.Caption)) ;
  except
    xFechaMaxSQL := '1900-01-01' ;
  end ;
  xFecha := formatdatetime(DMTE.wFormatFecha,dbdtpFecCierre.date );
  try
     xWhere := ' ECFCOMP > ' +DMTE.wRepFuncDate + '''' + xFechaMaxSQL + ''')' +
               ' AND ECFCOMP<=' +DMTE.wRepFuncDate + ''''+xFecha+''')' +
               ' AND ECESTADO = ''I''' ;

     DMTE.RecuperarDatos('CAJA302','COUNT(*) NUMROWS',xWhere) ;
     if DMTE.cdsRec.fieldbyname('NUMROWS').AsInteger = 0 then
     begin
        //Comprobar la existencia de ordenes de pago
        xWhere := ' OPFPAGO > ' +DMTE.wRepFuncDate + '''' + xFechaMaxSQL + ''')' +
                  '  AND OPFPAGO<=' +DMTE.wRepFuncDate + '''' + xFecha + ''')' +
                  '  AND OPESTADO = ''I''' ;

        DMTE.RecuperarDatos('CXP303','COUNT(*) NUMROWS',xWhere) ;
        if DMTE.cdsRec.fieldbyname('NUMROWS').AsInteger = 0 then
        begin
           //Comprobar la existencia de Notas de Cobranza
           xWhere := ' NCOFCOB > ' +DMTE.wRepFuncDate + '''' + xFechaMaxSQL + ''')' +
                     ' AND NCOFCOB<=' +DMTE.wRepFuncDate + ''''+xFecha+''')' +
                     ' AND NCOESTADO = ''I''' ;

           DMTE.RecuperarDatos('CXC303','COUNT(*) NUMROWS',xWhere) ;
           if DMTE.cdsRec.fieldbyname('NUMROWS').AsInteger <> 0 then
             Raise Exception.Create('Hay Notas de Cobranza pendientes de Cancelación'+ #13 +
                                    'No se puede Efectuar el Cierre Hasta la fecha especificada') ;

        end
        else
          Raise Exception.Create('Hay Ordenes de Pago pendientes de Cancelación'+ #13 +
                                 'No se puede Efectuar el Cierre Hasta la fecha especificada') ;
     end
     else
       Raise Exception.Create('Hay Movimientos pendientes de Cancelación'+ #13 +
                              'No se puede Efectuar el Cierre Hasta la fecha especificada') ;
   except
     FMovPendientes := TFMovPendientes.Create(self) ;
     try
       FMovPendientes.Recupera( xFechaMaxSQL , xFecha ) ;
       FMovPendientes.ShowModal ;
     finally
       FMovPendientes.free ;
     end ;
   end ;

end;

procedure TFCierreDiario.dblcCiaChange(Sender: TObject);
begin
   if  length(dblcCia.Text)=dblcCia.LookupTable.FieldByName('CIAID').Size then
   begin
	   if dblcCia.Text=dblcCia.LookupTable.FieldByName('CIAID').AsString then
	   begin
	      if edtCia.Text<>dblcCia.LookupTable.FieldByName('CIADES').AsString then
	      begin
	            edtCia.Text:=dblcCia.LookupTable.FieldByName('CIADES').AsString;
	      end;
	   end
	   else
	   begin
	     if not dblcCia.LookupTable.Locate('CIAID', dblcCia.Text,[]) then
	     begin
	          edtCia.text:='';
	     end
	     else
	     begin
	          edtCia.text:=dblcCia.LookupTable.fieldbyname('CIADES').AsString;
	     end;
	   end;
   end
   else
   begin
           edtCia.text:='';
   end;
end;


procedure TFCierreDiario.dblcCiaExit(Sender: TObject);
begin
if edtCia.Text='' then
begin
    if dblcCia.Text='' then
      ShowMessage('Ingrese Compañía')
    else
      ShowMessage('El Código de Compañía que ha Ingresado'+#13 +
                  'No está registrado');
    (Sender as twincontrol).SetFocus;
end
end;
procedure TFCierreDiario.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

end.

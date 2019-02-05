unit Caja229;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, ExtCtrls, Buttons , wwclient , wwdatsrc ;

type
  TFMovPendientes = class(TForm)
    dbgMov: TwwDBGrid;
    Bevel1: TBevel;
    StaticText1: TStaticText;
    dbgOPago: TwwDBGrid;
    Bevel2: TBevel;
    StaticText2: TStaticText;
    dbgNotaCob: TwwDBGrid;
    Bevel3: TBevel;
    StaticText3: TStaticText;
    Bevel4: TBevel;
    Z2bbtnOK: TBitBtn;
    Z2bbtnCancel: TBitBtn;
    procedure Z2bbtnCancelClick(Sender: TObject);
    procedure Z2bbtnOKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    cdsMov   ,
    cdsOPago ,
    cdsNCob  : TwwClientDataset ;
    dsMov    ,
    dsOPago  ,
    dsNCob   : TwwDataSource ;
  public
    { Public declarations }
    procedure Recupera(FechaInicio,FechaFin : string ) ;
  end;

var
  FMovPendientes: TFMovPendientes;

implementation

uses CajaDM;

{$R *.DFM}

procedure TFMovPendientes.Recupera(FechaInicio, FechaFin: string);
var
    xSQL         : String ;
begin
     //comprobar la existencia de movimientos
     if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
       xsql := 'SELECT CAJA302.CIAID, CAJA302.TDIARID, CAJA302.ECANOMM,'  +
               ' CAJA302.ECNOCOMP, CAJA302.ECFCOMP, CAJA302.ECMTOORI,'  +
               ' CAJA302.EC_PROCE, TGE103.TMONABR, TGE101.CIAABR, TGE104.TDIARABR'+
               'FROM CAJA302 '+
               ' LEFT JOIN TGE103 ON (CAJA302.TMONID = TGE103.TMONID)'  +
               ' LEFT JOIN TGE101 ON (CAJA302.CIAID = TGE101.CIAID)'  +
               ' LEFT JOIN TGE104 ON (CAJA302.TDIARID = TGE104.TDIARID)'  +
               ' WHERE ECFCOMP > DATE( ''' + FechaInicio + ''')' +
               ' AND ECFCOMP<=DATE( ''' + FechaFin + ''')' +
               ' AND ECESTADO = ''I'''
     else
     	 if DMTE.SRV_D = 'ORACLE' then
         xsql := 'SELECT CAJA302.CIAID, CAJA302.TDIARID, CAJA302.ECANOMM,'  +
                 ' CAJA302.ECNOCOMP, CAJA302.ECFCOMP, CAJA302.ECMTOORI,'  +
                 ' CAJA302.EC_PROCE, TGE103.TMONABR, TGE101.CIAABR, TGE104.TDIARABR'+
                 'FROM CAJA302, TGE103, TGE101, TGE104 '+
                 ' WHERE ECFCOMP > TO_DATE( ''' + FechaInicio + ''')' +
                 ' AND ECFCOMP<=TO_DATE( ''' + FechaFin + ''')' +
                 ' AND ECESTADO = ''I''' +
                 ' AND CAJA302.TMONID = TGE103.TMONID(+)'  +
                 ' AND CAJA302.CIAID = TGE101.CIAID(+)'  +
                 ' AND CAJA302.TDIARID = TGE104.TDIARID(+)'  ;


     cdsMov :=  TwwClientDataSet.Create(self)  ;
     dsMOv  :=  TwwDaTaSource.create(self) ;
     cdsMov.RemoteServer := DMTE.DCOM1 ;
     cdsMov.ProviderName := 'prvQry2' ;
     cdsMOv.DataRequest(xSQL) ;
     cdsMov.Active := False ;
     cdsMov.Active := True ;
     dsMov.DataSet := cdsMov ;
     dbgMov.DataSource := dsMov ;

     if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
       xsql :='SELECT TGE103.TMONABR, TGE101.CIAABR, CXP303.CIAID, '  +
              ' CXP303.OPAGO, CXP303.OPFPAGO, CXP303.TMONID,'  +
              ' CXP303.OPMTOORI '  +
              'FROM  CXP303           '  +
              ' LEFT JOIN TGE103 ON (CXP303.TMONID = TGE103.TMONID) '  +
              ' LEFT JOIN TGE101 ON (CXP303.CIAID = TGE101.CIAID)   ' +
              'WHERE OPFPAGO > DATE(''' + FechaInicio + ''')' +
              ' AND OPFPAGO<=DATE(''' + FechaFin + ''')' +
              ' AND OPESTADO = ''P'''
     else
	     if DMTE.SRV_D = 'ORACLE' then
         xsql :='SELECT TGE103.TMONABR, TGE101.CIAABR, CXP303.CIAID, '  +
                ' CXP303.OPAGO, CXP303.OPFPAGO, CXP303.TMONID,'  +
                ' CXP303.OPMTOORI '  +
                'FROM CXP303, TGE103, TGE101 '  +
                'WHERE OPFPAGO > TO_DATE(''' + FechaInicio + ''')' +
                ' AND OPFPAGO<=TO_DATE(''' + FechaFin + ''')' +
                ' AND OPESTADO = ''P''' +
                ' AND CXP303.TMONID = TGE103.TMONID (+) '  +
                ' AND CXP303.CIAID = TGE101.CIAID (+) ' ;

     cdsOPago :=  TwwClientDataSet.Create(self)  ;
     dsOPago  :=  TwwDaTaSource.create(self) ;
     cdsOPago.RemoteServer := DMTE.DCOM1 ;
     cdsOPago.ProviderName := 'prvQry2' ;
     cdsOPago.DataRequest(xSQL) ;
     cdsOPago.Active := False ;
     cdsOPago.Active := True ;
     dsOPago.DataSet := cdsOPago ;
     dbgOPago.DataSource := dsOpago ;

     if (DMTE.SRV_D = 'DB2NT') or (DMTE.SRV_D = 'DB2400') then
	     xsql := 'SELECT TGE103.TMONABR, TGE101.CIAABR, CXC303.CIAID, CXC303.NOTACOB,  ' +
               'CXC303.NCOFCOB, CXC303.TMONID, CXC303.NCOMTOORI' +
               'FROM CXC303'+
               ' LEFT JOIN TGE101 ON (CXC303.CIAID = TGE101.CIAID)'+
               ' LEFT JOIN TGE103 ON (CXC303.TMONID = TGE103.TMONID) '+
               'WHERE NCOFCOB > DATE(''' + FechaInicio + ''')' +
               ' AND NCOFCOB<=DATE('''+ FechaFin +''')' +
               ' AND NCOESTADO = ''P'''
      else
	      if DMTE.SRV_D = 'ORACLE' then
           xsql := 'SELECT TGE103.TMONABR, TGE101.CIAABR, CXC303.CIAID, CXC303.NOTACOB, ' +
                   ' CXC303.NCOFCOB, CXC303.TMONID, CXC303.NCOMTOORI' +
                   'FROM CXC303, TGE101, TGE103 '+
                   'WHERE NCOFCOB > TO_DATE(''' + FechaInicio + ''')' +
                   ' AND NCOFCOB<=TO_DATE('''+ FechaFin +''')' +
                   ' AND NCOESTADO = ''P''' +
                   ' AND CXC303.CIAID = TGE101.CIAID (+)'+
                   ' AND CXC303.TMONID = TGE103.TMONID (+)';

     cdsncob :=  TwwClientDataSet.Create(self)  ;
     dsNCob  :=  TwwDaTaSource.create(self) ;
     cdsncob.RemoteServer := DMTE.DCOM1 ;
     cdsncob.ProviderName := 'prvQry2' ;
     cdsncob.DataRequest(xSQL) ;
     cdsncob.Active := False ;
     cdsncob.Active := True ;
     dsNCob.DataSet := cdsncob ;
     dbgNotaCob.DataSource := dsNCob ;

end;

procedure TFMovPendientes.Z2bbtnCancelClick(Sender: TObject);
begin
    close ;
end;

procedure TFMovPendientes.Z2bbtnOKClick(Sender: TObject);
begin
   close ;
end;

procedure TFMovPendientes.FormKeyPress(Sender: TObject; var Key: Char);
begin
	if key=#13 then
   begin
    	key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;

end.

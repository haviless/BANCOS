Unit CLIE771CAJA;
// Actualizaciones:
// HPC_201802_CAJA 26/03/2018  Creación del Formulario
//

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, Buttons, Mant, Db, Wwdatsrc, DBClient, wwclient, ppDB,
   ppDBPipe, ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppComm, ppRelatv,
   ppProd, ppReport, Wwdbigrd, Wwdbgrid, ExtCtrls, StdCtrls, fcButton,
   fcImgBtn, MsgDlgs, fcShapeBtn;

Type
   TFToolBuscaCli = Class(TForm)
      pnlBot: TPanel;
      bbtnAceptar: TfcShapeBtn;
      edtCriterioBusca: TEdit;
      lblCriterioBusca: TLabel;
      Timer1: TTimer;
      Procedure bbtnAceptarClick(Sender: TObject);
      Procedure Timer1Timer(Sender: TObject);
   Private
    { Private declarations }
      grid: TwwDBGrid;
   Public
    { Public declarations }
      Procedure OnNoDelete(Sender: TObject; MantFields: TFields);
   End;

Var
   FToolBuscaCli: TFToolBuscaCli;
   xAccesoBotones: Boolean;

Implementation

Uses Caja206;

{$R *.DFM}

Procedure TFToolBuscaCli.OnNoDelete(Sender: TObject; MantFields: TFields);
Begin
   Errormsg(Caption, ' No se Puede Eliminar este Registro ');
End;

Procedure TFToolBuscaCli.bbtnAceptarClick(Sender: TObject);
Var
   xSQL: String;
Begin
   If length(Trim(edtCriterioBusca.Text)) > 0 Then
   Begin
      xSQL := 'Select TDOC_ID_SUNAT, NUMDOCID, TIPPERID, CLAUXID, CLIEID, CLIEDNI, CLIERUC, CLIEAPEPAT, CLIEAPEMAT, CLIENOMBRE, '
         + '          CLIENOMBRE1, CLIEDES, CLIEABR, CLIEDIR, PAISID, DPTOID, CIUDID, CLIECZIP, CLIETELF, CLIEFAX, CLIEEMAI, '
         + '          CLIEDIRLEG, CIAID, CLIESALL, CLIEREPR, CLIESALE, CLIEGARAN, CLASIFID, CLIECONTAC, CLIEGIRA, VEID, GIROID, '
         + '          CLIECOND, CLIELISPRE, VINCID, CLIECAPSOC, CLIEDIREC, CLIEGGRAL, CLIEGADM, CLIECGRAL, CLIESECECO, SECECOID, '
         + '          CONDPID, CLIECANTAT, CLIECANTPE, CLIEMPEDME, CLIEMPEDMN, CLIEMATEMN, CLIEMATEME, CLIECANTFA, CLIEMFACMN, '
         + '          CLIEMFACME, TMONID, ZONVTAID, CLIEFLAGCR, SITCLIEID, DESCLIEID, CLIECREUTI, GRUPOID, CLIECONDFE, TVTAID, '
         + '          USERID, FREG, HREG, TLISTAID, CLIEINTER, AVALNOMB, AVALDIR, AVALTEL, AVALDOC, AVALTELF, CLIECREMIN, CLIECREMAX, '
         + '          CLIECREDISP, VEIDNW, ZONVTANW, FLAGMOV, CLIECODMOD, USEID, CLIECODAUX, CIUUID, FLAGVAR, ACTIVO, FECCREA, USUCREA '
         + '     from TGE204 '
         + '    where (CLIEDES like ' + QuotedStr('%' + Trim(edtCriterioBusca.Text) + '%')
         + '       or CLIEDNI like ' + QuotedStr('%' + Trim(edtCriterioBusca.Text) + '%')
         + '       or CLIERUC like ' + QuotedStr('%' + Trim(edtCriterioBusca.Text) + '%')
         + '       or NUMDOCID like ' + QuotedStr('%' + Trim(edtCriterioBusca.Text) + '%')+')'
         + '      and ACTIVO=''S'' ';
      xSQL := 'Select TDOC_ID_SUNAT, NUMDOCID, TIPPERID, CLAUXID, CLIEID, CLIEDNI, CLIERUC, CLIEAPEPAT, CLIEAPEMAT, CLIENOMBRE, '
         + '          CLIENOMBRE1, CLIEDES, CLIEABR, CLIEDIR, PAISID, DPTOID, CIUDID, CLIECZIP, CLIETELF, CLIEFAX, CLIEEMAI, '
         + '          CLIEDIRLEG, CIAID, CLIESALL, CLIEREPR, CLIESALE, CLIEGARAN, CLASIFID, CLIECONTAC, CLIEGIRA, VEID, GIROID, '
         + '          CLIECOND, CLIELISPRE, VINCID, CLIECAPSOC, CLIEDIREC, CLIEGGRAL, CLIEGADM, CLIECGRAL, CLIESECECO, SECECOID, '
         + '          CONDPID, CLIECANTAT, CLIECANTPE, CLIEMPEDME, CLIEMPEDMN, CLIEMATEMN, CLIEMATEME, CLIECANTFA, CLIEMFACMN, '
         + '          CLIEMFACME, TMONID, ZONVTAID, CLIEFLAGCR, SITCLIEID, DESCLIEID, CLIECREUTI, GRUPOID, CLIECONDFE, TVTAID, '
         + '          USERID, FREG, HREG, TLISTAID, CLIEINTER, AVALNOMB, AVALDIR, AVALTEL, AVALDOC, AVALTELF, CLIECREMIN, CLIECREMAX, '
         + '          CLIECREDISP, VEIDNW, ZONVTANW, FLAGMOV, CLIECODMOD, USEID, CLIECODAUX, CIUUID, FLAGVAR, ACTIVO, FECCREA, USUCREA '
         + '     from ('+xSQL+') SOLVISTA';
      FIngresoCaja.MtxBuscaCli.UsuarioSQL.Clear;
      FIngresoCaja.MtxBuscaCli.FMant.wTabla := 'TGE204';
      FIngresoCaja.MtxBuscaCli.UsuarioSQL.Add(xSQL);
      FIngresoCaja.MtxBuscaCli.NewQuery;
   End;
   Screen.Cursor := crDefault;
End;

Procedure TFToolBuscaCli.Timer1Timer(Sender: TObject);
var
   xSQL : String;
Begin
   edtCriterioBusca.Text := '';
   {
   xSQL := 'Select TGE204.* '
      + '     from TGE204 '
      + '    where 1<>1';
   FIngresoCaja.MtxBuscaCli.FMant.wTabla := 'TGE204';
   FIngresoCaja.MtxBuscaCli.UsuarioSQL.Add(xSQL);
   FIngresoCaja.MtxBuscaCli.NewQuery;
   }
   Timer1.Destroy;
End;

End.


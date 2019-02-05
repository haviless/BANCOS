object DMTE: TDMTE
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 358
  Top = 90
  Height = 597
  Width = 913
  object cdsCia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCia'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 81
    Top = 3
  end
  object dsCia: TwwDataSource
    DataSet = cdsCia
    Left = 87
    Top = 12
  end
  object cdsTDiario: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTDiario'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 153
    Top = 4
  end
  object dsTDiario: TwwDataSource
    DataSet = cdsTDiario
    Left = 157
    Top = 12
  end
  object cdsTDoc: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTDoc'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 222
    Top = 4
  end
  object dsTDoc: TwwDataSource
    DataSet = cdsTDoc
    Left = 225
    Top = 12
  end
  object cdsTMon: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTMon'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 365
    Top = 4
  end
  object cdsFormPago: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFormPago'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 513
    Top = 4
  end
  object cdsBanco: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvBanco'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 592
    Top = 4
  end
  object dsTMon: TwwDataSource
    DataSet = cdsTMon
    Left = 368
    Top = 12
  end
  object dsFormPago: TwwDataSource
    DataSet = cdsFormPago
    Left = 516
    Top = 12
  end
  object dsBanco: TwwDataSource
    DataSet = cdsBanco
    Left = 592
    Top = 12
  end
  object cdsCCBco: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCCBco'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 666
    Top = 325
  end
  object dsCCBco: TwwDataSource
    DataSet = cdsCCBco
    Left = 666
    Top = 333
  end
  object dsEgrCaja: TwwDataSource
    Left = 22
    Top = 161
  end
  object cdsRegCxP: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRegCxP'
    RemoteServer = DCOM1
    AfterOpen = cdsRegCxPAfterOpen
    PictureMasks.Strings = (
      
        'DEMTOORI'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][' +
        '#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#]]]' +
        '),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#]]]}' +
        #9'T'#9'F'
      
        'DETCDOC'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#' +
        ']]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#]]])' +
        ',[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#][#]]]}'#9 +
        'T'#9'F')
    ValidateWithMask = True
    Left = 515
    Top = 152
  end
  object dsRegCxP: TwwDataSource
    DataSet = cdsRegCxP
    Left = 515
    Top = 161
  end
  object cdsQry: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 22
    Top = 268
  end
  object dsQry: TwwDataSource
    DataSet = cdsQry
    Left = 22
    Top = 280
  end
  object cdsCnpEgr: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CPTOID'
    Params = <>
    ProviderName = 'prvCnpEgr'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 22
    Top = 52
  end
  object dsCnpEgr: TwwDataSource
    DataSet = cdsCnpEgr
    Left = 22
    Top = 62
  end
  object cdsCCosto: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 25
    Params = <>
    ProviderName = 'dspCCosto'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 85
    Top = 52
  end
  object dsCCosto: TwwDataSource
    DataSet = cdsCCosto
    Left = 85
    Top = 62
  end
  object cdsCntCaja: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCntCaja'
    RemoteServer = DCOM1
    OnCalcFields = cdsCntCajaCalcFields
    ValidateWithMask = True
    Left = 85
    Top = 212
  end
  object dsCntCaja: TwwDataSource
    DataSet = cdsCntCaja
    Left = 85
    Top = 224
  end
  object cdsMovCxP: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'PROV;CPFVCMTO'
    Params = <>
    ProviderName = 'prvMovCxP'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 297
    Top = 102
  end
  object dsMovCxP: TwwDataSource
    DataSet = cdsMovCxP
    Left = 297
    Top = 109
  end
  object cdsCanjeCxP: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCanjeCxP'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'CCPTCCJE;CustomEdit;dbeTC'
      'CCPMOLOC;CustomEdit;dbeMPL'
      'CCPMOEXT;CustomEdit;dbeMPE')
    ValidateWithMask = True
    Left = 438
    Top = 102
  end
  object dsCanjeCxP: TwwDataSource
    DataSet = cdsCanjeCxP
    Left = 438
    Top = 109
  end
  object cdsDetCanjeCxP: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetCanjeCxP'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 515
    Top = 102
  end
  object dsDetCanjeCxP: TwwDataSource
    DataSet = cdsDetCanjeCxP
    Left = 515
    Top = 109
  end
  object dsPagoCxP: TwwDataSource
    DataSet = cdsPagoCxP
    Left = 367
    Top = 110
  end
  object cdsDocPago: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDocPago'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'TMONID;CustomEdit;dblcMoneda'
      'DETCPAG;CustomEdit;dbeTC'
      'DEMTOLOC;CustomEdit;dbeMPL'
      'DEMTOEXT;CustomEdit;dbeMPE')
    ValidateWithMask = True
    Left = 591
    Top = 102
  end
  object dsDocPago: TwwDataSource
    DataSet = cdsDocPago
    Left = 591
    Top = 109
  end
  object cdsCCBco2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCCBco'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 156
    Top = 52
  end
  object dsCCBco2: TwwDataSource
    DataSet = cdsCCBco2
    Left = 156
    Top = 62
  end
  object cdsClase: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvClase'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 224
    Top = 52
  end
  object dsClase: TwwDataSource
    DataSet = cdsClase
    Left = 224
    Top = 62
  end
  object cdsMovCxC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvMovCxC'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 156
    Top = 102
  end
  object dsMovCxC: TwwDataSource
    DataSet = cdsMovCxC
    Left = 156
    Top = 109
  end
  object cdsCobraCxC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCobraCxC'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 297
    Top = 212
  end
  object cdsCanjeCxC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCanjeCxC'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 85
    Top = 102
  end
  object dsCobraCxC: TwwDataSource
    DataSet = cdsCobraCxC
    Left = 297
    Top = 224
  end
  object dsCanjeCxC: TwwDataSource
    DataSet = cdsCanjeCxC
    Left = 85
    Top = 109
  end
  object cdsDetCanjeCxC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetCanjeCxC'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 224
    Top = 102
  end
  object dsDetCanjeCxC: TwwDataSource
    DataSet = cdsDetCanjeCxC
    Left = 224
    Top = 109
  end
  object cdsTranCob: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTranCob'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 515
    Top = 52
  end
  object dsTranCob: TwwDataSource
    DataSet = cdsTranCob
    Left = 515
    Top = 62
  end
  object cdsEmpleado: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEmpleado'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 295
    Top = 4
  end
  object dsEmpleado: TwwDataSource
    DataSet = cdsEmpleado
    Left = 298
    Top = 12
  end
  object cdsNivel: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvNivel'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 515
    Top = 212
  end
  object dsNivel: TwwDataSource
    DataSet = cdsNivel
    Left = 515
    Top = 224
  end
  object dsMovCNT1: TwwDataSource
    DataSet = cdsMovCNT1
    Left = 156
    Top = 224
  end
  object cdsSaldoTlfnGrab: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSaldoTlfnGrab'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 224
    Top = 212
  end
  object dsSaldoTlfnGrab: TwwDataSource
    DataSet = cdsSaldoTlfnGrab
    Left = 224
    Top = 224
  end
  object cdsRec: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRec'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 367
    Top = 52
  end
  object cdsBancoEgr: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvBancoEgr'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 516
    Top = 324
  end
  object cdsEgrCajaX: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEgrCajaX'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 156
    Top = 152
  end
  object dsEgrcajaX: TwwDataSource
    DataSet = cdsEgrCajaX
    Left = 156
    Top = 161
  end
  object cdsDescrip: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDescrip'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 367
    Top = 212
  end
  object dsDescrip: TwwDataSource
    DataSet = cdsDescrip
    Left = 367
    Top = 224
  end
  object cdsEquiv: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEquiv'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 438
    Top = 212
  end
  object dsEquiv: TwwDataSource
    DataSet = cdsEquiv
    Left = 438
    Top = 224
  end
  object cdsResponsable: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvResponsable'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 591
    Top = 52
  end
  object dsResponsable: TwwDataSource
    DataSet = cdsResponsable
    Left = 591
    Top = 62
  end
  object cdsClaseAux: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvClaseAux'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 666
    Top = 268
  end
  object cdsAux: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 25
    Params = <>
    ProviderName = 'prvAux'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 515
    Top = 266
  end
  object cdsQry2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 85
    Top = 268
  end
  object dsQry2: TwwDataSource
    DataSet = cdsQry2
    Left = 117
    Top = 280
  end
  object cdsUsuarios: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'USERID'
    Params = <>
    ProviderName = 'prvUsuario'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 22
    Top = 323
  end
  object cdsMGrupo: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'GRUPOID'
    Params = <>
    ProviderName = 'dspMGrupo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 85
    Top = 323
  end
  object cdsGrupos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 156
    Top = 323
  end
  object cdsAcceso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAcceso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 224
    Top = 323
  end
  object dsUsuarios: TwwDataSource
    DataSet = cdsUsuarios
    Left = 22
    Top = 333
  end
  object dsMGrupo: TwwDataSource
    DataSet = cdsMGrupo
    Left = 85
    Top = 333
  end
  object dsGrupos: TwwDataSource
    DataSet = cdsGrupos
    Left = 156
    Top = 333
  end
  object dsAcceso: TwwDataSource
    DataSet = cdsAcceso
    Left = 224
    Top = 333
  end
  object cdsPagoCxP: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPagoCxP'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 367
    Top = 102
  end
  object cdsTransBCO: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTransBCO'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 664
    Top = 4
  end
  object dsTransBCO: TwwDataSource
    DataSet = cdsTransBCO
    Left = 668
    Top = 12
  end
  object cdsExtracBCO: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvExtracBCO'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 22
    Top = 212
  end
  object dsExtracBCO: TwwDataSource
    DataSet = cdsExtracBCO
    Left = 22
    Top = 224
  end
  object dsDetFPago: TwwDataSource
    DataSet = cdsDetFPago
    Left = 367
    Top = 161
  end
  object dsRec: TwwDataSource
    DataSet = cdsRec
    Left = 367
    Top = 62
  end
  object cdsEgrCaja2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEgrCaja2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 297
    Top = 152
  end
  object dsEgrCaja2: TwwDataSource
    DataSet = cdsEgrCaja2
    Left = 297
    Top = 161
  end
  object cdsRegCxC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRegCxC'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 438
    Top = 152
  end
  object dsRegCxC: TwwDataSource
    DataSet = cdsRegCxC
    Left = 438
    Top = 161
  end
  object cdsDetFPago: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetFPago'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 367
    Top = 152
  end
  object cdsCanjeCxCDoc: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCanjeCxCDoc'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'CCTCAMCJE;CustomEdit;dbeTCC'
      'CCMTOLOC;CustomEdit;dbeCML'
      'CCMTOEXT;CustomEdit;dbeCME')
    ValidateWithMask = True
    Left = 224
    Top = 152
  end
  object dsCanjeCxCDoc: TwwDataSource
    DataSet = cdsCanjeCxCDoc
    Left = 224
    Top = 161
  end
  object cdsFEfec: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFEfec'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 591
    Top = 268
  end
  object cdsIngDocs: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvIngDocs'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 22
    Top = 102
  end
  object dsIngDocs: TwwDataSource
    DataSet = cdsIngDocs
    Left = 22
    Top = 109
  end
  object cdsTrans: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTrans'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 591
    Top = 152
  end
  object dsTrans: TwwDataSource
    DataSet = cdsTrans
    Left = 591
    Top = 161
  end
  object cds1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 666
    Top = 176
  end
  object cdsCuentas: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 437
    Top = 4
  end
  object dsCuentas: TwwDataSource
    DataSet = cdsCuentas
    Left = 440
    Top = 12
  end
  object cdsECRepo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvECRepo'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'FLAGVAR;CheckBox;S;N')
    ValidateWithMask = True
    Left = 85
    Top = 152
  end
  object dsECRepo: TwwDataSource
    DataSet = cdsECRepo
    Left = 85
    Top = 161
  end
  object cdsMovCNT1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvMovCNT'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 156
    Top = 212
  end
  object cdsSQL: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSQL'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 591
    Top = 212
  end
  object cdsEgrCaja: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvEgrCaja'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 22
    Top = 152
  end
  object cdsTdiario1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTdiario1'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 297
    Top = 323
  end
  object dsTdiario1: TwwDataSource
    DataSet = cdsTdiario1
    Left = 297
    Top = 333
  end
  object cdsProv: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvProv'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 367
    Top = 268
  end
  object dsProv: TwwDataSource
    DataSet = cdsProv
    Left = 367
    Top = 280
  end
  object dsSQL: TwwDataSource
    DataSet = cdsSQL
    Left = 591
    Top = 224
  end
  object cdsSaldos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSALDOS'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 297
    Top = 52
  end
  object dsSaldos: TwwDataSource
    DataSet = cdsSaldos
    Left = 297
    Top = 62
  end
  object cdsQry3: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry2'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 156
    Top = 268
  end
  object dsQry3: TwwDataSource
    DataSet = cdsQry3
    Left = 156
    Top = 280
  end
  object cdsProvCta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvProvCta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 297
    Top = 268
  end
  object dsProvCta: TwwDataSource
    DataSet = cdsProvCta
    Left = 297
    Top = 280
  end
  object cdsCLiqCob1: TwwClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'prvCLiqCob1'
    RemoteServer = DCOM1
    StoreDefs = True
    ValidateWithMask = True
    Left = 438
    Top = 52
  end
  object dsCLiqCob1: TwwDataSource
    DataSet = cdsCLiqCob1
    Left = 438
    Top = 62
  end
  object dsCNT311: TwwDataSource
    DataSet = cdsCNT311
    Left = 666
    Top = 62
  end
  object cdsCNT311: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCNT311'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 666
    Top = 52
  end
  object cdsResultSet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 438
    Top = 323
  end
  object cdsLiq305: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvLiq305'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 666
    Top = 212
  end
  object dsLiq305: TwwDataSource
    DataSet = cdsLiq305
    Left = 666
    Top = 224
  end
  object ppdbVoucher: TppDBPipeline
    UserName = 'dbVoucher'
    Left = 617
    Top = 427
  end
  object cdsSocRec: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSocRec'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 156
    Top = 378
  end
  object dsSocRec: TwwDataSource
    DataSet = cdsSocRec
    Left = 156
    Top = 390
  end
  object cdsMovSocRec: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSocRec'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 22
    Top = 378
  end
  object dsMovSocRec: TwwDataSource
    DataSet = cdsMovSocRec
    Left = 22
    Top = 390
  end
  object cdsSocDocPag: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSocDocPag'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 85
    Top = 378
  end
  object dsSocDocPag: TwwDataSource
    DataSet = cdsSocDocPag
    Left = 85
    Top = 390
  end
  object cdsCASocio: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCASocio'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 224
    Top = 378
  end
  object dsCASocio: TwwDataSource
    DataSet = cdsCASocio
    Left = 224
    Top = 390
  end
  object cdsRetencion: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRetencion'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 367
    Top = 322
  end
  object dsRetencion: TwwDataSource
    DataSet = cdsRetencion
    Left = 367
    Top = 333
  end
  object cdsConsulta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 297
    Top = 378
  end
  object ppd1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = pprVoucher
    IniStorageType = 'IniFile'
    IniStorageName = 'C:\DemaExes\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 544
    Top = 382
  end
  object cdsSaldo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSaldo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 367
    Top = 378
  end
  object dsSaldo: TwwDataSource
    DataSet = cdsSaldo
    Left = 367
    Top = 390
  end
  object cdsReporte: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCxP'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 438
    Top = 378
  end
  object dsReporte: TwwDataSource
    DataSet = cdsReporte
    Left = 438
    Top = 390
  end
  object cdsQry4: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 224
    Top = 268
  end
  object dsQry4: TwwDataSource
    DataSet = cdsQry4
    Left = 208
    Top = 268
  end
  object cdsReglas: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCanjeCxC'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 666
    Top = 116
  end
  object dsReglas: TwwDataSource
    DataSet = cdsReglas
    Left = 666
    Top = 126
  end
  object cdsQry1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 22
    Top = 437
  end
  object dsQry1: TwwDataSource
    DataSet = cdsQry1
    Left = 22
    Top = 448
  end
  object cdsQry5: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 85
    Top = 437
  end
  object dsQry5: TwwDataSource
    DataSet = cdsQry5
    Left = 85
    Top = 448
  end
  object cdsDocsCont: TwwClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'prvDocsCont'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 590
    Top = 323
  end
  object dsDocsCont: TwwDataSource
    DataSet = cdsDocsCont
    Left = 590
    Top = 333
  end
  object cdsDocsContWork: TwwClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    Params = <>
    ProviderName = 'prvDocsCont'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 297
    Top = 437
  end
  object dsDocsContWork: TwwDataSource
    DataSet = cdsDocsContWork
    Left = 297
    Top = 448
  end
  object cdsUser: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUser'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 367
    Top = 437
  end
  object dsUser: TwwDataSource
    DataSet = cdsUser
    Left = 367
    Top = 448
  end
  object cdsAsocia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRetencion'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 156
    Top = 437
  end
  object dsAsocia: TwwDataSource
    DataSet = cdsAsocia
    Left = 164
    Top = 448
  end
  object cdsCptos: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'CPTOID'
    Params = <>
    ProviderName = 'prvCnpEgr'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 224
    Top = 437
  end
  object dsCptos: TwwDataSource
    DataSet = cdsCptos
    Left = 224
    Top = 448
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 674
    Top = 403
  end
  object ExcelBook: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 721
    Top = 409
  end
  object WS: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 722
    Top = 434
  end
  object cdsTarjeta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTarjeta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 438
    Top = 268
  end
  object cdsQry6: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 85
    Top = 492
  end
  object dsQry6: TwwDataSource
    DataSet = cdsQry6
    Left = 85
    Top = 503
  end
  object cdsQry7: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 156
    Top = 492
  end
  object dsQry7: TwwDataSource
    DataSet = cdsQry7
    Left = 156
    Top = 503
  end
  object cdsReporteDet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 224
    Top = 492
  end
  object dsReporteDet: TwwDataSource
    DataSet = cdsReporteDet
    Left = 224
    Top = 503
  end
  object ppdbDet: TppDBPipeline
    UserName = 'dbDet'
    Left = 544
    Top = 416
    MasterDataPipelineName = 'ppdbVoucher'
  end
  object pprVoucher: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'rVoucher'
    PrinterSetup.PaperName = 'Carta'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 12700
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\DemaExes\RTMS\CNT\Dema\ComprobanteCajaGlobal.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = pprVoucherPreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 618
    Top = 386
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand2: TppHeaderBand
      PrintOnFirstPage = False
      PrintOnLastPage = False
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      Save = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        TraverseAllData = False
        DataPipelineName = 'ppdbVoucher'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 203300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppdbVoucher
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'rVoucher'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 12700
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279000
          PrinterSetup.mmPaperWidth = 216000
          PrinterSetup.PaperSize = 1
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppdbVoucher'
          object ppTitleBand2: TppTitleBand
            BeforePrint = ppTitleBand2BeforePrint
            mmBottomOffset = 0
            mmHeight = 57415
            mmPrintPosition = 0
            object ppShape1: TppShape
              UserName = 'Shape1'
              mmHeight = 28310
              mmLeft = 1323
              mmTop = 14023
              mmWidth = 193940
              BandType = 1
            end
            object ppShape5: TppShape
              UserName = 'Shape5'
              mmHeight = 6879
              mmLeft = 150813
              mmTop = 32279
              mmWidth = 40746
              BandType = 1
            end
            object ppShape3: TppShape
              UserName = 'Shape3'
              mmHeight = 13229
              mmLeft = 1323
              mmTop = 44186
              mmWidth = 193940
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Cuenta'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 9260
              mmTop = 46567
              mmWidth = 7620
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label23'
              AutoSize = False
              Caption = 'Auxiliar'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 19315
              mmTop = 46567
              mmWidth = 13229
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              AutoSize = False
              Caption = 'C'#243'd.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 21431
              mmTop = 51329
              mmWidth = 7673
              BandType = 1
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              AutoSize = False
              Caption = 'D o c u m e n t o'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 34396
              mmTop = 46567
              mmWidth = 49742
              BandType = 1
            end
            object ppLabel27: TppLabel
              UserName = 'Label27'
              Caption = 'Serie'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 32279
              mmTop = 51329
              mmWidth = 6350
              BandType = 1
            end
            object ppLabel38: TppLabel
              UserName = 'Label38'
              Caption = 'N'#250'mero'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 41804
              mmTop = 51329
              mmWidth = 7620
              BandType = 1
            end
            object ppLabel28: TppLabel
              UserName = 'Label28'
              Caption = 'Glosa'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 70908
              mmTop = 51329
              mmWidth = 6350
              BandType = 1
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              Caption = 'Centro'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 104511
              mmTop = 46567
              mmWidth = 7620
              BandType = 1
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              Caption = 'de Costo'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 103452
              mmTop = 51329
              mmWidth = 10160
              BandType = 1
            end
            object ppLabel43: TppLabel
              UserName = 'Label43'
              AutoSize = False
              Caption = 'Moneda Local'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 127000
              mmTop = 46567
              mmWidth = 23813
              BandType = 1
            end
            object ppLabel31: TppLabel
              UserName = 'Label31'
              Caption = 'Debe'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 127000
              mmTop = 51329
              mmWidth = 5080
              BandType = 1
            end
            object ppLabel32: TppLabel
              UserName = 'Label32'
              Caption = 'Haber'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 145521
              mmTop = 51329
              mmWidth = 6350
              BandType = 1
            end
            object ppLabel44: TppLabel
              UserName = 'Label44'
              AutoSize = False
              Caption = 'Moneda Extranjera'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 161396
              mmTop = 46567
              mmWidth = 32015
              BandType = 1
            end
            object ppLabel25: TppLabel
              UserName = 'Label25'
              Caption = 'Debe'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 165894
              mmTop = 51329
              mmWidth = 5080
              BandType = 1
            end
            object ppLabel41: TppLabel
              UserName = 'Label41'
              Caption = 'Haber'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 184150
              mmTop = 51329
              mmWidth = 6350
              BandType = 1
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'P'#225'gina:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 163777
              mmTop = 0
              mmWidth = 8890
              BandType = 1
            end
            object ppSystemVariable4: TppSystemVariable
              UserName = 'SystemVariable4'
              VarType = vtPageNo
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 175155
              mmTop = 0
              mmWidth = 1270
              BandType = 1
            end
            object ppSystemVariable5: TppSystemVariable
              UserName = 'SystemVariable5'
              VarType = vtTime
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 175155
              mmTop = 4233
              mmWidth = 15346
              BandType = 1
            end
            object ppLabel21: TppLabel
              UserName = 'Label21'
              Caption = 'Hora  :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 163777
              mmTop = 4233
              mmWidth = 8890
              BandType = 1
            end
            object ppSystemVariable6: TppSystemVariable
              UserName = 'SystemVariable6'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 175155
              mmTop = 8467
              mmWidth = 12700
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label1'
              Caption = 'Contabilidad'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 2646
              mmTop = 8467
              mmWidth = 15240
              BandType = 1
            end
            object pplblFecha: TppLabel
              UserName = 'lblFecha'
              Caption = 'Fecha    :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 3969
              mmTop = 15610
              mmWidth = 12700
              BandType = 1
            end
            object pplblPeriodo: TppLabel
              UserName = 'lblPeriodo'
              Caption = 'Periodo  :  '
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 3969
              mmTop = 19579
              mmWidth = 15240
              BandType = 1
            end
            object pplblTcam: TppLabel
              UserName = 'lblTcam'
              Caption = 'T.Cambio:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 154782
              mmTop = 23548
              mmWidth = 11377
              BandType = 1
            end
            object pplblDiario: TppLabel
              UserName = 'lblDiario'
              Caption = 'Origen        :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 66146
              mmTop = 15610
              mmWidth = 19050
              BandType = 1
            end
            object pplblComp: TppLabel
              UserName = 'lblComp'
              Caption = 'Comprobante   :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 66146
              mmTop = 19579
              mmWidth = 19050
              BandType = 1
            end
            object pplblLote: TppLabel
              UserName = 'lblLote'
              Caption = 'No.Lote  :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 3969
              mmTop = 23548
              mmWidth = 12700
              BandType = 1
            end
            object pplblTmon: TppLabel
              UserName = 'lblTmon'
              Caption = 'Moneda  :  Nuevos Soles'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 154782
              mmTop = 19579
              mmWidth = 29210
              BandType = 1
            end
            object pplblEstado: TppLabel
              UserName = 'lblEstado'
              Caption = 'Estado  :  Contabilizado'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 154782
              mmTop = 15610
              mmWidth = 30480
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'It.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 3704
              mmTop = 51329
              mmWidth = 3810
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'Fecha'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 57679
              mmTop = 51329
              mmWidth = 6350
              BandType = 1
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = 'Glosa         :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 66146
              mmTop = 23548
              mmWidth = 19050
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = 'Fecha :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 163777
              mmTop = 8467
              mmWidth = 8890
              BandType = 1
            end
            object pplblglosa: TppLabel
              UserName = 'lblglosa'
              Caption = 'EMBALAJE Y DISTRIB.CORRESPONDENCIA/OFICI'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 87842
              mmTop = 23548
              mmWidth = 50800
              BandType = 1
            end
            object lblperiodo: TppLabel
              UserName = 'lblperiodo1'
              Caption = 'JUNIO 2010'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 20638
              mmTop = 19579
              mmWidth = 12700
              BandType = 1
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              AutoSize = True
              DataField = 'CNTFCOMP'
              DataPipeline = ppdbVoucher
              DisplayFormat = 'DD/MM/YYYY'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 4233
              mmLeft = 20638
              mmTop = 15610
              mmWidth = 12700
              BandType = 1
            end
            object ppdbtComp: TppDBText
              UserName = 'dbtComp'
              AutoSize = True
              DataField = 'CNTCOMPROB'
              DataPipeline = ppdbVoucher
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 4233
              mmLeft = 87842
              mmTop = 19579
              mmWidth = 12700
              BandType = 1
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              AutoSize = True
              DataField = 'TDIARID'
              DataPipeline = ppdbVoucher
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 4233
              mmLeft = 87842
              mmTop = 15610
              mmWidth = 2540
              BandType = 1
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              AutoSize = True
              DataField = 'TDIARDES'
              DataPipeline = ppdbVoucher
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 4233
              mmLeft = 92869
              mmTop = 15610
              mmWidth = 19050
              BandType = 1
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'CIADES'
              DataPipeline = ppdbVoucher
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 4233
              mmLeft = 8202
              mmTop = 0
              mmWidth = 108479
              BandType = 1
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              AutoSize = True
              DataField = 'CNTLOTE'
              DataPipeline = ppdbVoucher
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 4233
              mmLeft = 20638
              mmTop = 23548
              mmWidth = 5080
              BandType = 1
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              AutoSize = True
              DataField = 'CNTTCAMBIO'
              DataPipeline = ppdbVoucher
              DisplayFormat = '#,##0.000'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 4233
              mmLeft = 169598
              mmTop = 23548
              mmWidth = 6350
              BandType = 1
            end
            object ppLabel33: TppLabel
              UserName = 'lblLote1'
              Caption = 'Banco    :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 3969
              mmTop = 27517
              mmWidth = 12700
              BandType = 1
            end
            object ppLabel34: TppLabel
              UserName = 'Label34'
              Caption = 'Cta.Corriente :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 66146
              mmTop = 27517
              mmWidth = 19050
              BandType = 1
            end
            object ppLabel35: TppLabel
              UserName = 'lblTcam1'
              Caption = 'Cheque  :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 154782
              mmTop = 27517
              mmWidth = 11377
              BandType = 1
            end
            object ppLabel36: TppLabel
              UserName = 'Label36'
              Caption = 'Proveedor:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 3969
              mmTop = 31485
              mmWidth = 12700
              BandType = 1
            end
            object ppLabel37: TppLabel
              UserName = 'Label33'
              Caption = 'Girado a :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 3969
              mmTop = 35454
              mmWidth = 12700
              BandType = 1
            end
            object pplBanco: TppLabel
              UserName = 'Label37'
              AutoSize = False
              Caption = '03 BANCO DE CREDITO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 20638
              mmTop = 27517
              mmWidth = 31750
              BandType = 1
            end
            object pplProv: TppLabel
              UserName = 'Label39'
              AutoSize = False
              Caption = 'P4511  UNIVERSAL SUPPORT & SERVICES SAC.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 20638
              mmTop = 31485
              mmWidth = 94721
              BandType = 1
            end
            object pplGirado: TppLabel
              UserName = 'Label46'
              AutoSize = False
              Caption = 'UNIVERSAL SUPPORT & SERVICES SAC.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 20638
              mmTop = 35454
              mmWidth = 94721
              BandType = 1
            end
            object pplCtaCte: TppLabel
              UserName = 'Label47'
              Caption = '625508-0-61'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 87842
              mmTop = 27517
              mmWidth = 14023
              BandType = 1
            end
            object pplChq: TppLabel
              UserName = 'Label48'
              Caption = '09943639'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 169598
              mmTop = 27781
              mmWidth = 15240
              BandType = 1
            end
            object pplImporte: TppLabel
              UserName = 'Label49'
              AutoSize = False
              Caption = 'S/. 2,812.78'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Pitch = fpFixed
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 152400
              mmTop = 34131
              mmWidth = 37571
              BandType = 1
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              AutoSize = True
              DataField = 'CIAID'
              DataPipeline = ppdbVoucher
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 4586
              mmLeft = 2646
              mmTop = 0
              mmWidth = 3810
              BandType = 1
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              AutoSize = True
              DataField = 'CNTCOMPROB'
              DataPipeline = ppdbVoucher
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 4233
              mmLeft = 101336
              mmTop = 8467
              mmWidth = 12700
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label2'
              Caption = 'Comprobante'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 84667
              mmTop = 8467
              mmWidth = 13970
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              SaveOrder = 0
              Save = True
              SaveLength = 5
              DataField = 'AUXID'
              DataPipeline = ppdbVoucher
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 2910
              mmLeft = 23283
              mmTop = 1852
              mmWidth = 10054
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              SaveOrder = 1
              Save = True
              SaveLength = 3
              DataField = 'CNTSERIE'
              DataPipeline = ppdbVoucher
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 2910
              mmLeft = 33867
              mmTop = 1852
              mmWidth = 6350
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              SaveOrder = 2
              Save = True
              SaveLength = 10
              DataField = 'CNTNODOC'
              DataPipeline = ppdbVoucher
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 2910
              mmLeft = 41010
              mmTop = 1852
              mmWidth = 14817
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              SaveLength = 25
              DataField = 'CNTGLOSA'
              DataPipeline = ppdbVoucher
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 2910
              mmLeft = 69321
              mmTop = 1852
              mmWidth = 34131
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              SaveOrder = 3
              Save = True
              SaveLength = 8
              DataField = 'CCOSID'
              DataPipeline = ppdbVoucher
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 2910
              mmLeft = 104511
              mmTop = 1852
              mmWidth = 11642
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              SaveOrder = 4
              Save = True
              SaveLength = 14
              DataField = 'CNTDEBEMN'
              DataPipeline = ppdbVoucher
              DisplayFormat = '#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 2910
              mmLeft = 116946
              mmTop = 1852
              mmWidth = 19050
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              SaveOrder = 5
              Save = True
              SaveLength = 14
              DataField = 'CNTHABEMN'
              DataPipeline = ppdbVoucher
              DisplayFormat = '#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 2910
              mmLeft = 136261
              mmTop = 1852
              mmWidth = 19050
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              SaveOrder = 6
              Save = True
              SaveLength = 14
              DataField = 'CNTDEBEME'
              DataPipeline = ppdbVoucher
              DisplayFormat = '#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 2910
              mmLeft = 155575
              mmTop = 1852
              mmWidth = 19050
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'DBText25'
              SaveOrder = 7
              Save = True
              SaveLength = 14
              DataField = 'CNTHABEME'
              DataPipeline = ppdbVoucher
              DisplayFormat = '#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 2910
              mmLeft = 174890
              mmTop = 1852
              mmWidth = 19050
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              SaveOrder = 8
              Save = True
              SaveLength = 8
              DataField = 'CUENTAID'
              DataPipeline = ppdbVoucher
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 2910
              mmLeft = 7408
              mmTop = 1852
              mmWidth = 15875
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              SaveOrder = 9
              Save = True
              SaveLength = 8
              DataField = 'CNTFVCMTO'
              DataPipeline = ppdbVoucher
              DisplayFormat = 'DD/MM/YY'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 2910
              mmLeft = 56356
              mmTop = 1852
              mmWidth = 12435
              BandType = 4
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5821
              mmLeft = 191823
              mmTop = 0
              mmWidth = 3440
              BandType = 4
            end
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              DataField = 'CNTREG'
              DataPipeline = ppdbVoucher
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 2910
              mmLeft = 1588
              mmTop = 1852
              mmWidth = 3969
              BandType = 4
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 5821
              mmLeft = 1323
              mmTop = 0
              mmWidth = 1058
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup7: TppGroup
            BreakName = 'CNTCOMPROB'
            DataPipeline = ppdbVoucher
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group7'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppdbVoucher'
            object ppGroupHeaderBand7: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand7: TppGroupFooterBand
              BeforePrint = ppGroupFooterBand7BeforePrint
              mmBottomOffset = 0
              mmHeight = 79904
              mmPrintPosition = 0
              object ppShape2: TppShape
                UserName = 'Shape2'
                mmHeight = 10848
                mmLeft = 64558
                mmTop = 2646
                mmWidth = 130704
                BandType = 5
                GroupNo = 0
              end
              object ppLabel18: TppLabel
                UserName = 'Label18'
                AutoSize = False
                Caption = 'Total Comprobante.............'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 70379
                mmTop = 6085
                mmWidth = 38100
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc5: TppDBCalc
                UserName = 'DBCalc5'
                DataField = 'CNTDEBEMN'
                DataPipeline = ppdbVoucher
                DisplayFormat = '###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 7
                Font.Style = []
                ResetGroup = ppGroup7
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdbVoucher'
                mmHeight = 2910
                mmLeft = 116946
                mmTop = 6085
                mmWidth = 19050
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc6: TppDBCalc
                UserName = 'DBCalc6'
                DataField = 'CNTHABEMN'
                DataPipeline = ppdbVoucher
                DisplayFormat = '###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 7
                Font.Style = []
                ResetGroup = ppGroup7
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdbVoucher'
                mmHeight = 2910
                mmLeft = 136261
                mmTop = 6085
                mmWidth = 19050
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc7: TppDBCalc
                UserName = 'DBCalc7'
                DataField = 'CNTDEBEME'
                DataPipeline = ppdbVoucher
                DisplayFormat = '###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 7
                Font.Style = []
                ResetGroup = ppGroup7
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdbVoucher'
                mmHeight = 2910
                mmLeft = 155575
                mmTop = 6085
                mmWidth = 19050
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc8: TppDBCalc
                UserName = 'DBCalc8'
                DataField = 'CNTHABEME'
                DataPipeline = ppdbVoucher
                DisplayFormat = '###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 7
                Font.Style = []
                ResetGroup = ppGroup7
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdbVoucher'
                mmHeight = 2910
                mmLeft = 174890
                mmTop = 6085
                mmWidth = 19050
                BandType = 5
                GroupNo = 0
              end
              object ppLabel5: TppLabel
                UserName = 'Label3'
                AutoSize = False
                Caption = 'Preparado por:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 10319
                mmTop = 47625
                mmWidth = 20373
                BandType = 5
                GroupNo = 0
              end
              object ppDBText99: TppDBText
                UserName = 'DBText99'
                DataField = 'CNTUSER'
                DataPipeline = ppdbVoucher
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppdbVoucher'
                mmHeight = 3704
                mmLeft = 12435
                mmTop = 40746
                mmWidth = 19844
                BandType = 5
                GroupNo = 0
              end
              object pplCmp: TppLabel
                UserName = 'lCmp'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 1323
                mmTop = 16140
                mmWidth = 194998
                BandType = 5
                GroupNo = 0
              end
              object ppLabel3: TppLabel
                UserName = 'Label4'
                AutoSize = False
                Caption = 'Contador'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 50006
                mmTop = 47625
                mmWidth = 17727
                BandType = 5
                GroupNo = 0
              end
              object ppLabel22: TppLabel
                UserName = 'Label22'
                AutoSize = False
                Caption = 'Autorizado'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 88106
                mmTop = 47625
                mmWidth = 20638
                BandType = 5
                GroupNo = 0
              end
              object ppLabel13: TppLabel
                UserName = 'Label13'
                AutoSize = False
                Caption = 'Rev.Contab.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 127265
                mmTop = 47625
                mmWidth = 23019
                BandType = 5
                GroupNo = 0
              end
              object ppLabel42: TppLabel
                UserName = 'Label42'
                AutoSize = False
                Caption = 'Recibido'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 172509
                mmTop = 69321
                mmWidth = 13494
                BandType = 5
                GroupNo = 0
              end
              object ppLabel45: TppLabel
                UserName = 'Label45'
                AutoSize = False
                Caption = 'D.N.I.:................................'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 162190
                mmTop = 74877
                mmWidth = 34925
                BandType = 5
                GroupNo = 0
              end
              object pplModulo: TppLabel
                UserName = 'Label50'
                AutoSize = False
                Caption = 'Modulo: CAJA'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 10319
                mmTop = 51594
                mmWidth = 20373
                BandType = 5
                GroupNo = 0
              end
              object pplLetras: TppLabel
                UserName = 'Label51'
                Caption = '** DOS MIL OCHOCIENTOS DOCE y 78/100 Nuevos Soles **'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Pitch = fpFixed
                Font.Size = 9
                Font.Style = []
                Transparent = True
                mmHeight = 4233
                mmLeft = 12171
                mmTop = 23548
                mmWidth = 87630
                BandType = 5
                GroupNo = 0
              end
              object ppLine1: TppLine
                UserName = 'Line1'
                Weight = 0.750000000000000000
                mmHeight = 1588
                mmLeft = 1323
                mmTop = 0
                mmWidth = 193940
                BandType = 5
                GroupNo = 0
              end
              object ppLabel2: TppLabel
                UserName = 'Label5'
                Caption = 'Son :'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Pitch = fpFixed
                Font.Size = 9
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 1852
                mmTop = 23548
                mmWidth = 7408
                BandType = 5
                GroupNo = 0
              end
              object ppLine5: TppLine
                UserName = 'Line5'
                Weight = 0.750000000000000000
                mmHeight = 3969
                mmLeft = 6085
                mmTop = 44979
                mmWidth = 32015
                BandType = 5
                GroupNo = 0
              end
              object ppLine6: TppLine
                UserName = 'Line6'
                Weight = 0.750000000000000000
                mmHeight = 3969
                mmLeft = 41804
                mmTop = 44979
                mmWidth = 32015
                BandType = 5
                GroupNo = 0
              end
              object ppLine7: TppLine
                UserName = 'Line7'
                Weight = 0.750000000000000000
                mmHeight = 3969
                mmLeft = 82021
                mmTop = 44979
                mmWidth = 32015
                BandType = 5
                GroupNo = 0
              end
              object ppLine8: TppLine
                UserName = 'Line8'
                Weight = 0.750000000000000000
                mmHeight = 3969
                mmLeft = 121709
                mmTop = 44979
                mmWidth = 32015
                BandType = 5
                GroupNo = 0
              end
              object ppLine9: TppLine
                UserName = 'Line9'
                Weight = 0.750000000000000000
                mmHeight = 3969
                mmLeft = 163248
                mmTop = 66675
                mmWidth = 32015
                BandType = 5
                GroupNo = 0
              end
              object pplDet1: TppLabel
                UserName = 'lDet1'
                Caption = 'OPERACION SUJETA A DETRACCION'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                Visible = False
                mmHeight = 4233
                mmLeft = 44979
                mmTop = 62442
                mmWidth = 63500
                BandType = 5
                GroupNo = 0
              end
              object pplDet2: TppLabel
                UserName = 'lDet2'
                Caption = 
                  '(Verificar su constancia de dep'#243'sito v'#237'a SUNA operaciones en L'#237'n' +
                  'ea)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                Visible = False
                mmHeight = 3704
                mmLeft = 28310
                mmTop = 70644
                mmWidth = 98161
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        ShiftRelativeTo = ppSubReport3
        TraverseAllData = False
        DataPipelineName = 'ppdbDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 11642
        mmWidth = 203300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppdbDet
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'rVoucher'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 12700
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279000
          PrinterSetup.mmPaperWidth = 216000
          PrinterSetup.PaperSize = 1
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppdbDet'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 15081
            mmPrintPosition = 0
            object ppLabel54: TppLabel
              UserName = 'Label201'
              Caption = 'P'#225'gina:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 153459
              mmTop = 265
              mmWidth = 12965
              BandType = 1
            end
            object ppSystemVariable1: TppSystemVariable
              UserName = 'SystemVariable1'
              VarType = vtPageNo
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 167746
              mmTop = 265
              mmWidth = 1852
              BandType = 1
            end
            object ppSystemVariable2: TppSystemVariable
              UserName = 'SystemVariable2'
              VarType = vtTime
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 167746
              mmTop = 4763
              mmWidth = 24077
              BandType = 1
            end
            object ppLabel55: TppLabel
              UserName = 'Label501'
              AutoSize = False
              Caption = 'Hora  :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 153459
              mmTop = 4763
              mmWidth = 13229
              BandType = 1
            end
            object ppSystemVariable3: TppSystemVariable
              UserName = 'SystemVariable3'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 167746
              mmTop = 9525
              mmWidth = 18521
              BandType = 1
            end
            object ppLabel56: TppLabel
              UserName = 'Label56'
              Caption = 'Asientos Automatico de Caja-Bancos'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 60590
              mmTop = 4763
              mmWidth = 72231
              BandType = 1
            end
            object ppLabel57: TppLabel
              UserName = 'Label57'
              AutoSize = False
              Caption = 'Contabilidad'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 265
              mmTop = 4763
              mmWidth = 33867
              BandType = 1
            end
            object ppLabel71: TppLabel
              UserName = 'Label64'
              Caption = 'Fecha :'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 153459
              mmTop = 9525
              mmWidth = 12965
              BandType = 1
            end
            object ppLabel59: TppLabel
              UserName = 'lblPeriodo2'
              AutoSize = False
              Caption = 'Periodo:'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 78052
              mmTop = 9525
              mmWidth = 17198
              BandType = 1
            end
            object ppDBText39: TppDBText
              UserName = 'DBText39'
              DataField = 'CNTANOMM'
              DataPipeline = ppdbDet
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 4233
              mmLeft = 97367
              mmTop = 9525
              mmWidth = 15081
              BandType = 1
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              DataField = 'CIADES'
              DataPipeline = ppdbVoucher
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbVoucher'
              mmHeight = 3704
              mmLeft = 0
              mmTop = 265
              mmWidth = 108479
              BandType = 1
            end
          end
          object ppHeaderBand1: TppHeaderBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              SaveOrder = 0
              Save = True
              SaveLength = 5
              DataField = 'AUXID'
              DataPipeline = ppdbDet
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3704
              mmLeft = 20108
              mmTop = 0
              mmWidth = 10054
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              SaveOrder = 1
              Save = True
              SaveLength = 3
              DataField = 'CNTSERIE'
              DataPipeline = ppdbDet
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3704
              mmLeft = 30956
              mmTop = 0
              mmWidth = 6350
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText29'
              SaveOrder = 2
              Save = True
              SaveLength = 10
              DataField = 'CNTNODOC'
              DataPipeline = ppdbDet
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3704
              mmLeft = 38100
              mmTop = 0
              mmWidth = 14817
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              SaveLength = 25
              DataField = 'CNTGLOSA'
              DataPipeline = ppdbDet
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3704
              mmLeft = 66411
              mmTop = 0
              mmWidth = 36513
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText201'
              SaveOrder = 3
              Save = True
              SaveLength = 8
              DataField = 'CCOSID'
              DataPipeline = ppdbDet
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3704
              mmLeft = 103188
              mmTop = 0
              mmWidth = 12965
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText32'
              SaveOrder = 4
              Save = True
              SaveLength = 14
              DataField = 'CNTDEBEMN'
              DataPipeline = ppdbDet
              DisplayFormat = '#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3704
              mmLeft = 116417
              mmTop = 0
              mmWidth = 19050
              BandType = 4
            end
            object ppDBText33: TppDBText
              UserName = 'DBText33'
              SaveOrder = 5
              Save = True
              SaveLength = 14
              DataField = 'CNTHABEMN'
              DataPipeline = ppdbDet
              DisplayFormat = '#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3704
              mmLeft = 135732
              mmTop = 0
              mmWidth = 19050
              BandType = 4
            end
            object ppDBText34: TppDBText
              UserName = 'DBText34'
              SaveOrder = 6
              Save = True
              SaveLength = 14
              DataField = 'CNTDEBEME'
              DataPipeline = ppdbDet
              DisplayFormat = '#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3704
              mmLeft = 155046
              mmTop = 0
              mmWidth = 19050
              BandType = 4
            end
            object ppDBText35: TppDBText
              UserName = 'DBText35'
              SaveOrder = 7
              Save = True
              SaveLength = 14
              DataField = 'CNTHABEME'
              DataPipeline = ppdbDet
              DisplayFormat = '#,###,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3704
              mmLeft = 174361
              mmTop = 0
              mmWidth = 19050
              BandType = 4
            end
            object ppDBText36: TppDBText
              UserName = 'DBText36'
              SaveOrder = 8
              Save = True
              SaveLength = 8
              DataField = 'CUENTAID'
              DataPipeline = ppdbDet
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3704
              mmLeft = 7144
              mmTop = 0
              mmWidth = 12435
              BandType = 4
            end
            object ppDBText37: TppDBText
              UserName = 'DBText37'
              SaveOrder = 9
              Save = True
              SaveLength = 3
              DataField = 'CNTREG'
              DataPipeline = ppdbDet
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3704
              mmLeft = 2381
              mmTop = 0
              mmWidth = 3969
              BandType = 4
            end
            object ppDBText38: TppDBText
              UserName = 'DBText101'
              SaveOrder = 10
              Save = True
              SaveLength = 8
              DataField = 'CNTFEMIS'
              DataPipeline = ppdbDet
              DisplayFormat = 'DD/MM/YY'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 20cpi'
              Font.Pitch = fpFixed
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppdbDet'
              mmHeight = 3704
              mmLeft = 53446
              mmTop = 0
              mmWidth = 12435
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup6: TppGroup
            BreakName = 'CNTCOMPROB'
            DataPipeline = ppdbDet
            OutlineSettings.CreateNode = True
            UserName = 'Group6'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppdbDet'
            object ppGroupHeaderBand6: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 23548
              mmPrintPosition = 0
              object ppLabel1: TppLabel
                UserName = 'Label101'
                Caption = 'Cuenta'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 8202
                mmTop = 12171
                mmWidth = 9525
                BandType = 3
                GroupNo = 0
              end
              object ppLabel4: TppLabel
                UserName = 'Label4'
                AutoSize = False
                Caption = 'Auxiliar'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 19050
                mmTop = 12171
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object ppLabel11: TppLabel
                UserName = 'Label1'
                AutoSize = False
                Caption = 'C'#243'd.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 21167
                mmTop = 16140
                mmWidth = 7673
                BandType = 3
                GroupNo = 0
              end
              object ppLabel6: TppLabel
                UserName = 'Label6'
                AutoSize = False
                Caption = 'D o c u m e n t o'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 34131
                mmTop = 12435
                mmWidth = 49742
                BandType = 3
                GroupNo = 0
              end
              object ppLabel24: TppLabel
                UserName = 'Label24'
                Caption = 'Serie'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 32015
                mmTop = 16140
                mmWidth = 9260
                BandType = 3
                GroupNo = 0
              end
              object ppLabel7: TppLabel
                UserName = 'Label7'
                Caption = 'N'#250'mero'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 41540
                mmTop = 16140
                mmWidth = 11113
                BandType = 3
                GroupNo = 0
              end
              object ppLabel19: TppLabel
                UserName = 'Label19'
                Caption = 'Glosa'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 68527
                mmTop = 16140
                mmWidth = 9260
                BandType = 3
                GroupNo = 0
              end
              object ppLabel39: TppLabel
                UserName = 'Label35'
                Caption = 'Centro'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 102659
                mmTop = 12171
                mmWidth = 11113
                BandType = 3
                GroupNo = 0
              end
              object ppLabel40: TppLabel
                UserName = 'Label301'
                Caption = 'de Costo'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 102394
                mmTop = 16140
                mmWidth = 14817
                BandType = 3
                GroupNo = 0
              end
              object ppLabel46: TppLabel
                UserName = 'Label2'
                AutoSize = False
                Caption = 'Moneda Local'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 127000
                mmTop = 12171
                mmWidth = 23813
                BandType = 3
                GroupNo = 0
              end
              object ppLabel47: TppLabel
                UserName = 'Label3'
                Caption = 'Debe'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 123825
                mmTop = 16140
                mmWidth = 7408
                BandType = 3
                GroupNo = 0
              end
              object ppLabel48: TppLabel
                UserName = 'Label40'
                Caption = 'Haber'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 144463
                mmTop = 16140
                mmWidth = 9260
                BandType = 3
                GroupNo = 0
              end
              object ppLabel49: TppLabel
                UserName = 'Label5'
                AutoSize = False
                Caption = 'Moneda Extranjera'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 159809
                mmTop = 12171
                mmWidth = 32015
                BandType = 3
                GroupNo = 0
              end
              object ppLabel50: TppLabel
                UserName = 'Label8'
                Caption = 'Debe'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 161396
                mmTop = 16140
                mmWidth = 7408
                BandType = 3
                GroupNo = 0
              end
              object ppLabel51: TppLabel
                UserName = 'Label9'
                Caption = 'Haber'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 183357
                mmTop = 15875
                mmWidth = 9260
                BandType = 3
                GroupNo = 0
              end
              object ppLabel52: TppLabel
                UserName = 'Label52'
                AutoSize = False
                Caption = 
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 529
                mmTop = 8731
                mmWidth = 195263
                BandType = 3
                GroupNo = 0
              end
              object ppLabel53: TppLabel
                UserName = 'Label53'
                AutoSize = False
                Caption = 
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 529
                mmTop = 19579
                mmWidth = 195263
                BandType = 3
                GroupNo = 0
              end
              object ppLabel61: TppLabel
                UserName = 'lblDiario1'
                Caption = 'Origen:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3006
                mmLeft = 82815
                mmTop = 4233
                mmWidth = 11853
                BandType = 3
                GroupNo = 0
              end
              object ppLabel62: TppLabel
                UserName = 'lblComp1'
                Caption = 'Comprobante:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 2910
                mmLeft = 156634
                mmTop = 4233
                mmWidth = 20373
                BandType = 3
                GroupNo = 0
              end
              object ppLabel66: TppLabel
                UserName = 'Label61'
                Caption = 'It.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 3440
                mmTop = 16140
                mmWidth = 2910
                BandType = 3
                GroupNo = 0
              end
              object ppLabel69: TppLabel
                UserName = 'Label62'
                Caption = 'Fecha'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 54240
                mmTop = 16140
                mmWidth = 9260
                BandType = 3
                GroupNo = 0
              end
              object ppDBText18: TppDBText
                UserName = 'DBText18'
                AutoSize = True
                DataField = 'CNTCOMPROB'
                DataPipeline = ppdbDet
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppdbDet'
                mmHeight = 4233
                mmLeft = 178859
                mmTop = 4233
                mmWidth = 12700
                BandType = 3
                GroupNo = 0
              end
              object ppDBText19: TppDBText
                UserName = 'DBText19'
                DataField = 'TDIARID'
                DataPipeline = ppdbDet
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppdbDet'
                mmHeight = 3704
                mmLeft = 96838
                mmTop = 4233
                mmWidth = 6085
                BandType = 3
                GroupNo = 0
              end
              object ppDBText23: TppDBText
                UserName = 'DBText23'
                DataField = 'TDIARDES'
                DataPipeline = ppdbVoucher
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppdbVoucher'
                mmHeight = 3704
                mmLeft = 103981
                mmTop = 4233
                mmWidth = 44186
                BandType = 3
                GroupNo = 0
              end
              object ppDBText26: TppDBText
                UserName = 'DBText26'
                AutoSize = True
                DataField = 'CIAID'
                DataPipeline = ppdbDet
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppdbDet'
                mmHeight = 4233
                mmLeft = 19579
                mmTop = 4233
                mmWidth = 2646
                BandType = 3
                GroupNo = 0
              end
              object ppLabel60: TppLabel
                UserName = 'Label102'
                Caption = 'Compa'#241#237'a:'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 2910
                mmLeft = 2381
                mmTop = 4233
                mmWidth = 15346
                BandType = 3
                GroupNo = 0
              end
              object ppDBText13: TppDBText
                UserName = 'DBText13'
                DataField = 'CIADES'
                DataPipeline = ppdbDet
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppdbDet'
                mmHeight = 2910
                mmLeft = 25400
                mmTop = 4233
                mmWidth = 49213
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand6: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 7408
              mmPrintPosition = 0
              object ppLabel67: TppLabel
                UserName = 'Label67'
                AutoSize = False
                Caption = 'Total Comprobante.............'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 70644
                mmTop = 3175
                mmWidth = 38100
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc1: TppDBCalc
                UserName = 'DBCalc1'
                DataField = 'CNTDEBEMN'
                DataPipeline = ppdbDet
                DisplayFormat = '###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                ResetGroup = ppGroup6
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdbDet'
                mmHeight = 3704
                mmLeft = 116681
                mmTop = 3175
                mmWidth = 19050
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc2: TppDBCalc
                UserName = 'DBCalc2'
                DataField = 'CNTHABEMN'
                DataPipeline = ppdbDet
                DisplayFormat = '###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                ResetGroup = ppGroup6
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdbDet'
                mmHeight = 3704
                mmLeft = 135996
                mmTop = 3175
                mmWidth = 19050
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc3: TppDBCalc
                UserName = 'DBCalc3'
                DataField = 'CNTDEBEME'
                DataPipeline = ppdbDet
                DisplayFormat = '###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                ResetGroup = ppGroup6
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdbDet'
                mmHeight = 3704
                mmLeft = 155311
                mmTop = 3175
                mmWidth = 19050
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc4: TppDBCalc
                UserName = 'DBCalc4'
                DataField = 'CNTHABEME'
                DataPipeline = ppdbDet
                DisplayFormat = '###,###,##0.00'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Pitch = fpFixed
                Font.Size = 8
                Font.Style = []
                ResetGroup = ppGroup6
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppdbDet'
                mmHeight = 3704
                mmLeft = 174625
                mmTop = 3175
                mmWidth = 19050
                BandType = 5
                GroupNo = 0
              end
              object ppLabel68: TppLabel
                UserName = 'Label68'
                AutoSize = False
                Caption = 
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------------------------------------------------' +
                  '----------------------'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Draft 20cpi'
                Font.Size = 6
                Font.Style = []
                Transparent = True
                mmHeight = 2646
                mmLeft = 32544
                mmTop = 265
                mmWidth = 163248
                BandType = 5
                GroupNo = 0
              end
            end
          end
          object ppGroup4: TppGroup
            BreakName = 'CIAID'
            DataPipeline = ppdbDet
            OutlineSettings.CreateNode = True
            UserName = 'Group4'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppdbDet'
            object ppGroupHeaderBand4: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand4: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
          object ppGroup5: TppGroup
            BreakName = 'TDIARID'
            DataPipeline = ppdbDet
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group5'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppdbDet'
            object ppGroupHeaderBand5: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroupFooterBand5: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppSubReport3: TppSubReport
        UserName = 'SubReport3'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport2
        TraverseAllData = False
        DataPipelineName = 'ppdbDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 5821
        mmWidth = 203300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppdbDet
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'rVoucher'
          PrinterSetup.PaperName = 'Carta'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 12700
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279000
          PrinterSetup.mmPaperWidth = 216000
          PrinterSetup.PaperSize = 1
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppdbDet'
          object ppTitleBand3: TppTitleBand
            NewPage = True
            mmBottomOffset = 0
            mmHeight = 2646
            mmPrintPosition = 0
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand4: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppParameterList1: TppParameterList
    end
  end
  object DCOM1: TSocketConnection
    ServerGUID = '{959F3D56-9046-480C-A85C-F30C19FD2AC2}'
    ServerName = 'DMCAJSrv.srvDMBAN'
    Left = 16
    Top = 8
  end
  object cdsTarCreTransf: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSaldoTlfnGrab'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 312
    Top = 496
  end
  object dsTarCreTransf: TwwDataSource
    DataSet = cdsTarCreTransf
    Left = 312
    Top = 504
  end
  object cdsCabTranf: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvExtracBCO'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 400
    Top = 496
  end
  object dsCabTranf: TwwDataSource
    DataSet = cdsCabTranf
    Left = 400
    Top = 504
  end
  object cdsCreCNT: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvLiq305'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 480
    Top = 496
  end
  object dsCreCNT: TwwDataSource
    DataSet = cdsCreCNT
    Left = 480
    Top = 504
  end
  object cdsVerificaOPC: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 550
    Top = 493
  end
  object cdsOPago: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPagoCxP'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 640
    Top = 493
  end
  object dsOPago: TwwDataSource
    DataSet = cdsOPago
    Left = 641
    Top = 503
  end
  object cdsDetallePres: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetCanjeCxC'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 713
    Top = 493
  end
  object dsDetallePres: TwwDataSource
    DataSet = cdsDetallePres
    Left = 713
    Top = 502
  end
  object cdsCiaFilial: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 30
    Top = 485
  end
  object dsCiaFilial: TwwDataSource
    DataSet = cdsCiaFilial
    Left = 30
    Top = 496
  end
  object cdsCaja304: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 454
    Top = 445
  end
  object dsCaja304: TwwDataSource
    DataSet = cdsCaja304
    Left = 454
    Top = 456
  end
  object dsAux: TDataSource
    DataSet = cdsAux
    Left = 516
    Top = 276
  end
  object cdsQry8: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 766
    Top = 244
  end
  object dsQry8: TwwDataSource
    DataSet = cdsQry8
    Left = 766
    Top = 256
  end
end

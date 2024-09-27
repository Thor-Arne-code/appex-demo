object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Appex demo'
  ClientHeight = 816
  ClientWidth = 1215
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1215
    Height = 41
    Align = alTop
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 797
    Width = 1215
    Height = 19
    Panels = <>
    ExplicitTop = 581
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 1215
    Height = 304
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 28
      Height = 15
      Caption = 'Navn'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 768
      Top = 8
      Width = 33
      Height = 15
      Caption = 'OrgNr'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 768
      Top = 67
      Width = 67
      Height = 15
      Caption = 'Hjemmeside'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 768
      Top = 181
      Width = 61
      Height = 15
      Caption = 'Sentralbord'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 768
      Top = 125
      Width = 29
      Height = 15
      Caption = 'Epost'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 1043
      Top = 227
      Width = 34
      Height = 15
      Caption = 'Rabatt'
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 16
      Top = 131
      Width = 54
      Height = 15
      Caption = 'Addresse1'
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 16
      Top = 181
      Width = 47
      Height = 15
      Caption = 'Adresse2'
      FocusControl = DBEdit8
    end
    object Label9: TLabel
      Left = 16
      Top = 232
      Width = 36
      Height = 15
      Caption = 'PostNr'
      FocusControl = DBEdit9
    end
    object Label10: TLabel
      Left = 104
      Top = 232
      Width = 46
      Height = 15
      Caption = 'PostSted'
      FocusControl = DBEdit10
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 29
      Width = 679
      Height = 40
      DataField = 'Navn'
      DataSource = DataSource_Levrandør
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 768
      Top = 29
      Width = 229
      Height = 23
      DataField = 'OrgNr'
      DataSource = DataSource_Levrandør
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 768
      Top = 88
      Width = 429
      Height = 23
      DataField = 'Hjemmeside'
      DataSource = DataSource_Levrandør
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 768
      Top = 197
      Width = 214
      Height = 23
      DataField = 'TlfSentralbord'
      DataSource = DataSource_Levrandør
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 768
      Top = 147
      Width = 429
      Height = 23
      DataField = 'Epost'
      DataSource = DataSource_Levrandør
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 1043
      Top = 248
      Width = 154
      Height = 23
      DataField = 'Rabatt'
      DataSource = DataSource_Levrandør
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 16
      Top = 147
      Width = 679
      Height = 23
      DataField = 'Addresse1'
      DataSource = DataSource_Levrandør
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 16
      Top = 197
      Width = 679
      Height = 23
      DataField = 'Adresse2'
      DataSource = DataSource_Levrandør
      TabOrder = 7
    end
    object DBEdit9: TDBEdit
      Left = 16
      Top = 248
      Width = 64
      Height = 23
      DataField = 'PostNr'
      DataSource = DataSource_Levrandør
      TabOrder = 8
    end
    object DBEdit10: TDBEdit
      Left = 104
      Top = 248
      Width = 591
      Height = 23
      DataField = 'PostSted'
      DataSource = DataSource_Levrandør
      TabOrder = 9
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 816
      Top = 248
      Width = 145
      Height = 23
      TabOrder = 10
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 345
    Width = 1215
    Height = 452
    Align = alClient
    TabOrder = 3
    ExplicitHeight = 236
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 426
      Width = 1213
      Height = 25
      DataSource = DataSource_Levrandør
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 210
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 1213
      Height = 425
      Align = alClient
      DataSource = DataSource_Kontakt
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'Fornavn'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Etternavn'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Rel_Roller'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Epost'
          Width = 480
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Telefon'
          Visible = True
        end>
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 864
      Top = 208
      Width = 145
      Height = 23
      DataField = 'Rel_Roller'
      DataSource = DataSource_Kontakt
      KeyField = 'ID_Roller'
      ListField = 'Rolle'
      ListSource = DataSource_Roller
      TabOrder = 2
    end
  end
  object MySQLDatabase1: TMySQLDatabase
    Connected = True
    DatabaseName = 'appexdemo'
    UserName = 'Demo'
    UserPassword = 'appex'
    Host = 'localhost'
    ConnectOptions = [coCompress]
    Params.Strings = (
      'Port=3306'
      'TIMEOUT=30'
      'UID=Demo'
      'PWD=appex'
      'Host=localhost'
      'DatabaseName=appexdemo')
    SSLProperties.TLSVersion = tlsAuto
    DatasetOptions = []
    Left = 152
    Top = 36
  end
  object MySQLTable_Leverandør: TMySQLTable
    Database = MySQLDatabase1
    Active = True
    TableName = 'leverandor'
    Left = 152
    Top = 168
  end
  object MySQLTable_Kontakt: TMySQLTable
    Database = MySQLDatabase1
    Active = True
    FieldDefs = <
      item
        Name = 'ID_Kontakt'
        DataType = ftAutoInc
      end
      item
        Name = 'Rel_Leverandor'
        Attributes = [faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'Rel_Roller'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'Fornavn'
        DataType = ftWideString
        Size = 45
      end
      item
        Name = 'Etternavn'
        DataType = ftWideString
        Size = 45
      end
      item
        Name = 'Epost'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'Telefon'
        DataType = ftWideString
        Size = 14
      end>
    IndexDefs = <
      item
        Name = 'PRIMARY'
        Fields = 'ID_Kontakt'
        Options = [ixPrimary, ixUnique, ixCaseInsensitive]
      end
      item
        Name = 'ID_UNIQUE'
        Fields = 'ID_Kontakt'
        Options = [ixUnique, ixCaseInsensitive]
      end
      item
        Name = 'fk_Kontakt_Leverandor_idx'
        Fields = 'Rel_Leverandor'
        Options = [ixCaseInsensitive]
      end
      item
        Name = 'fk_Kontakt_Roller1_idx'
        Fields = 'Rel_Roller'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'fk_Kontakt_Leverandor_idx'
    MasterFields = 'ID_Leverandor'
    MasterSource = DataSource_Levrandør
    StoreDefs = True
    TableName = 'kontakt'
    Left = 152
    Top = 300
  end
  object MySQLTable_Roller: TMySQLTable
    Database = MySQLDatabase1
    Active = True
    TableName = 'roller'
    Left = 152
    Top = 432
  end
  object DataSource_Levrandør: TDataSource
    DataSet = MySQLTable_Leverandør
    Left = 488
    Top = 182
  end
  object DataSource_Kontakt: TDataSource
    DataSet = MySQLTable_Kontakt
    Left = 489
    Top = 300
  end
  object DataSource_Roller: TDataSource
    DataSet = MySQLTable_Roller
    Left = 492
    Top = 434
  end
end

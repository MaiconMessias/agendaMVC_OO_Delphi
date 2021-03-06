object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 346
  Width = 507
  object FDConPrincipal: TFDConnection
    Params.Strings = (
      'Database=agenda'
      'User_Name=postgres'
      'Password=n'
      'DriverID=PG')
    LoginPrompt = False
    Left = 56
    Top = 40
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\windows10\Desktop\Projetos Delphi XE 11\Agenda\Packages' +
      '\Model\Win32\Debug\libpq.dll'
    Left = 192
    Top = 40
  end
  object FDQEndereco: TFDQuery
    Connection = FDConPrincipal
    SQL.Strings = (
      'SELECT * FROM ENDERECO')
    Left = 56
    Top = 112
    object FDQEnderecoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQEnderecologradouro: TWideStringField
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 256
    end
    object FDQEndereconumero: TBCDField
      FieldName = 'numero'
      Origin = 'numero'
      Precision = 3
      Size = 0
    end
    object FDQEnderecocep: TBCDField
      FieldName = 'cep'
      Origin = 'cep'
      Precision = 10
      Size = 0
    end
    object FDQEnderecobairro: TWideStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 50
    end
    object FDQEnderecocidade: TWideStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 30
    end
    object FDQEnderecoestado: TWideStringField
      FieldName = 'estado'
      Origin = 'estado'
    end
  end
  object FDQPessoa: TFDQuery
    Connection = FDConPrincipal
    Left = 192
    Top = 112
  end
  object FDQPessoaEndereco: TFDQuery
    Connection = FDConPrincipal
    SQL.Strings = (
      'SELECT * FROM PESSOA WHERE ENDERECO = :IDENDERECO')
    Left = 56
    Top = 176
    ParamData = <
      item
        Name = 'IDENDERECO'
        ParamType = ptInput
      end>
  end
  object FDQTelefoneTipo: TFDQuery
    Connection = FDConPrincipal
    Left = 304
    Top = 112
  end
  object FDQTelefone: TFDQuery
    Connection = FDConPrincipal
    Left = 408
    Top = 112
  end
end

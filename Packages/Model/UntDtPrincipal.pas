unit UntDtPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.ConsoleUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDataModule1 = class(TDataModule)
    FDConPrincipal: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDQEndereco: TFDQuery;
    FDQEnderecoid: TIntegerField;
    FDQEnderecologradouro: TWideStringField;
    FDQEndereconumero: TBCDField;
    FDQEnderecocep: TBCDField;
    FDQEnderecobairro: TWideStringField;
    FDQEnderecocidade: TWideStringField;
    FDQEnderecoestado: TWideStringField;
    FDQPessoa: TFDQuery;
    FDQPessoaEndereco: TFDQuery;
    FDQTelefoneTipo: TFDQuery;
    FDQTelefone: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  FDConPrincipal.Connected := false;
end;

end.

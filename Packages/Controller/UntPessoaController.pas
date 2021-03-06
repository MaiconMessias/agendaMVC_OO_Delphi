unit UntPessoaController;

interface

uses
  FireDAC.Comp.Client, Vcl.StdCtrls, UntIPessoa, UntPessoaDAO;

type
  TPessoaController = class
    class function verificaCampos(pPessoa: IPessoa): boolean;
    class function inserirAlterarPessoa(pId: integer; pPessoa: IPessoa): boolean;
    class procedure pesquisar(FDQuery: TFDQuery; edtPesquisa: TEdit);
  end;

implementation

{ TPessoaController }

class function TPessoaController.inserirAlterarPessoa(pId: integer;
                                                   pPessoa: IPessoa): boolean;
var
  vPessoaDAO: TPessoaDAO;
begin
  vPessoaDAO := TPessoaDAO.Create;
  vPessoaDAO.inserirAlterarPessoa(pId, pPessoa);
end;

class procedure TPessoaController.pesquisar(FDQuery: TFDQuery;
                                                           edtPesquisa: TEdit);
var
  vPessoaDAO: TPessoaDAO;
begin
  vPessoaDAO := TPessoaDAO.Create;
  vPessoaDAO.pesquisar(FDQuery, edtPesquisa);
end;

class function TPessoaController.verificaCampos(pPessoa: IPessoa): boolean;
begin
  result := true;

  if (pPessoa.getId = -1) then
    result := false;
end;

end.

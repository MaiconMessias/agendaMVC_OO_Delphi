unit UntEnderecoController;

interface

uses
  UntIEndereco, UntDtPrincipal, UntEnderecoDAO;

type
  TEnderecoController = class
    class function verificaCampos(Endereco: IEndereco): boolean;
    class function inserirAlterarEndereco(pId: integer; pEndereco: IEndereco): boolean;
  end;

implementation

{ TEnderecoController }

{ TEnderecoController }

class function TEnderecoController.inserirAlterarEndereco(pId: integer;
                                                pEndereco: IEndereco): boolean;
var
  vEnderecoDAO: TEnderecoDAO;
begin
  TEnderecoDAO.Create;
  vEnderecoDAO.inserirAlterarEndereco(pId, pEndereco);
end;

class function TEnderecoController.verificaCampos(Endereco: IEndereco): boolean;
begin
  result := true;

  if (Endereco.getId = -1) then
    result := false;
end;

end.
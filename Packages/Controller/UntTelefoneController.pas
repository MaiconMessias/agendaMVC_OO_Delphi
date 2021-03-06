unit UntTelefoneController;

interface

uses
  UntITelefone, UntTelefoneDAO, FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TTelefoneController = class
    class function inserirAlterarTelefone(pId: integer;
                                    pTelefone: ITelefone): boolean;
    class procedure pesquisar(FDQuery: TFDQuery; edtPesquisa: TEdit);
    class function verificaCampos(pTelefone: ITelefone): boolean;
  end;

implementation

{ TTelefoneController }

class function TTelefoneController.inserirAlterarTelefone(pId: integer;
                                              pTelefone: ITelefone): boolean;
var
  vTelefoneDAO: TTelefoneDAO;
begin
  vTelefoneDAO := TTelefoneDAO.Create;
  vTelefoneDAO.inserirAlterarTelefone(pId, pTelefone);
end;

class procedure TTelefoneController.pesquisar(FDQuery: TFDQuery;
                                                        edtPesquisa: TEdit);
var
  vTelefoneDAO: TTelefoneDAO;
begin
  vTelefoneDAO := TTelefoneDAO.Create;
  vTelefoneDAO.pesquisar(FDQuery, edtPesquisa);
end;

class function TTelefoneController.verificaCampos(pTelefone: ITelefone): boolean;
begin
  result := true;

  if (pTelefone.getId = -1) then
    result := false;

end;

end.

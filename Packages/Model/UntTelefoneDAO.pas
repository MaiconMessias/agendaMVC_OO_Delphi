unit UntTelefoneDAO;

interface

uses
  UntDtPrincipal, FireDAC.Comp.Client, Vcl.StdCtrls, UntITelefone;

type
  TTelefoneDAO = class
    class function inserirAlterarTelefone(pId: integer;
                                    pTelefone: ITelefone): boolean;
    class procedure pesquisar(FDQuery: TFDQuery; edtPesquisa: TEdit);
  end;

implementation

{ TTelefoneDAO }

class function TTelefoneDAO.inserirAlterarTelefone(pId: integer;
                                              pTelefone: ITelefone): boolean;
var
  dtModule: TDataModule1;
begin
  dtModule := UntDtPrincipal.TDataModule1.Create(nil);
  with dtModule do begin
    FDConPrincipal.Connected := true;
    if (pId = -1) then begin
      with FDQTelefone do begin
        SQL.Clear;
        SQL.Text := 'INSERT INTO TELEFONE (NUMERO, DDD, TIPO) ' +
                                  'VALUES (:NUMERO, :DDD, :TIPO)';

        ParamByName('NUMERO').AsInteger := pTelefone.getNumero();
        ParamByName('DDD').AsInteger := pTelefone.getDDD();
        ParamByName('TIPO').AsInteger := pTelefone.getTipo();
        ExecSQL;
      end;
      result := true;
    end else begin
      with FDQTelefone do begin
        SQL.Clear;
        SQL.Text := 'UPDATE TELEFONE SET NUMERO = :NUMERO, DDD = :DDD, TIPO = :TIPO ' +
                                                               'WHERE ID = :ID';
        ParamByName('NUMERO').AsInteger := pTelefone.getNumero();
        ParamByName('DDD').AsInteger := pTelefone.getDDD();
        ParamByName('TIPO').AsInteger := pTelefone.getTipo();
        ParamByName('ID').AsInteger := pId;
        ExecSQL;
        result := true;
      end;
    end;

  end;
end;

class procedure TTelefoneDAO.pesquisar(FDQuery: TFDQuery; edtPesquisa: TEdit);
begin
   with FDQuery do begin
     Close();
     SQL.Clear;
     if (edtPesquisa.Text <> '') then begin
       SQL.Text := 'SELECT * FROM TELEFONE WHERE CAST(NUMERO AS TEXT) LIKE :PPESQUISA';
       ParamByName('PPESQUISA').AsString := '%' + edtPesquisa.Text + '%';
     end else
       SQL.Text := 'SELECT * FROM TELEFONE ORDER BY ID ASC';
     Open();
   end;
end;

end.

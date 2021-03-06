unit UntTelefoneTipoDAO;

interface

uses
  UntITelefoneTipo, UntDtPrincipal, FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TTelefoneTipoDAO = class
    class function inserirAlterarTelefoneTipo(pId: integer;
                                    pTelefoneTipo: ITelefoneTipo): boolean;
    class procedure pesquisar(FDQuery: TFDQuery; edtPesquisa: TEdit);
  end;

implementation

{ TTelefoneTipoDAO }

class function TTelefoneTipoDAO.inserirAlterarTelefoneTipo(pId: integer;
                                         pTelefoneTipo: ITelefoneTipo): boolean;
var
  dtModule: TDataModule1;
begin
  dtModule := UntDtPrincipal.TDataModule1.Create(nil);
  with dtModule do begin
    FDConPrincipal.Connected := true;
    if (pId = -1) then begin
      with FDQTelefoneTipo do begin
        SQL.Clear;
        SQL.Text := 'INSERT INTO TELEFONE_TIPO (TIPO) VALUES (:TIPO)';
        ParamByName('TIPO').AsString := pTelefoneTipo.getTipo();
        ExecSQL;
      end;
      result := true;
    end else begin
      with FDQTelefoneTipo do begin
        SQL.Clear;
        SQL.Text := 'UPDATE TELEFONE_TIPO SET TIPO = :TIPO ' +
                                                    'WHERE ID = :ID';
        ParamByName('TIPO').AsString := pTelefoneTipo.getTipo();
        ParamByName('ID').AsInteger := pId;
        ExecSQL;
        result := true;
      end;
    end;

  end;
end;

class procedure TTelefoneTipoDAO.pesquisar(FDQuery: TFDQuery;
                                              edtPesquisa: TEdit);
begin
   with FDQuery do begin
     Close();
     SQL.Clear;
     if (edtPesquisa.Text <> '') then begin
       SQL.Text := 'SELECT * FROM TELEFONE_TIPO WHERE TIPO LIKE :PPESQUISA';
       ParamByName('PPESQUISA').AsString := '%' + edtPesquisa.Text + '%';
     end else
       SQL.Text := 'SELECT * FROM TELEFONE_TIPO ORDER BY ID ASC';
     Open();
   end;
end;

end.

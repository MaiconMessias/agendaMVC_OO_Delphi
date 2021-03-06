unit UntIEndereco;

interface

type
  IEndereco = interface
  ['{E1F875F8-75A5-4D35-B898-4DE535DB9E05}']
    // setters
    procedure Logradouro(Value: string);
    procedure Numero(Value: integer);
    procedure Cep(Value: integer);
    procedure Bairro(Value: string);
    procedure Cidade(Value: string);
    procedure Estado(Value: string);
    // getters
    function getId(): integer;
    function getLogradouro(): string;
    function getNumero(): integer;
    function getCep(): integer;
    function getBairro(): string;
    function getCidade(): string;
    function getEstado(): string;
  end;

implementation

end.

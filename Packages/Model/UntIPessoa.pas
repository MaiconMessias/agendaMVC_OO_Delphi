unit UntIPessoa;

interface

type
  IPessoa = interface
    ['{956A053B-11D0-404D-9AAD-8DFACE723E25}']
    // setters
    procedure Nome(value: string);
    procedure Cpf(value: string);
    procedure Endereco(value: integer);
    // getters
    function getId(): integer;
    function getNome(): string;
    function getCpf(): string;
    function getEndereco(): integer;

  end;

implementation

end.

unit DelphiFiscal.Base.Interfaces;

interface

type
  iBase = interface
    ['{15AE0E74-C00A-41BC-8D42-ED45CE6D957B}']
    function ValorProduto(aValue : double) : iBase; overload;
    function ValorProduto : double; overload;
    function ValorFrete(aValue : double) : iBase; overload;
    function ValorFrete : double; overload;
    function ValorSeguro(aValue : double) : iBase; overload;
    function ValorSeguro : double; overload;
    function ValorDespesasAcessorias(aValue : double) : iBase; overload;
    function ValorDespesasAcessorias : double; overload;
    function ValorDescontos(aValue : double) : iBase; overload;
    function ValorDescontos : double; overload;
    function Quantidade(aValue : double) : iBase; overload;
    function Quantidade : double; overload;
  end;
implementation

end.

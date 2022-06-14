unit Delphiscal.Attributes.Intf;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

type
  IAttributes<T : IInterface> = interface
    ['{8DAAE826-80F9-4E63-A895-5960E600F02A}']
    function ValorProduto(const AValorProduto : Double)  : IAttributes<T>; overload;
    function ValorProduto : Double; overload;
    function ValorFrete(const AValorFrete : Double)  : IAttributes<T>; overload;
    function ValorFrete : Double; overload;
    function ValorSeguro(const AValorSeguro : Double)  : IAttributes<T>; overload;
    function ValorSeguro : Double; overload;
    function ValorDespesas(const ADespesas: Double) : IAttributes<T>; overload;
    function ValorDespesas: Double; overload;
    function ValorDesconto(const AValorDesconto : Double)  : IAttributes<T>; overload;
    function ValorDesconto : Double; overload;
    function AliquotaPis(const AAliquotaPis : Double)  : IAttributes<T>; overload;
    function AliquotaPis : Double; overload;
    function &End : T;
  end;

implementation

end.

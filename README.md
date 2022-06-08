# Delphiscal
Biblioteca de cálculos fiscais em Delphi

![Badge](https://img.shields.io/static/v1?label=delphi&message=language&color=blue&style=for-the-badge&logo=delphi)
![Badge](https://img.shields.io/static/v1?label=acbr&message=framework&color=blue&style=for-the-badge&logo=acbr)


[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

## Sobre o projeto 
  Este projeto é uma biblioteca que auxilia na implementação de cálculos tributários para emissão de documentos fiscais eletrônicos no Brasil. Cálculo de ICMS, ICMS-ST, IPI, PIS e COFINS.

Este projeto é mantido utilizando a linguagem Delphi com o auxílio do ACBrUtil.Math e tem o projeto visual exibindo os resultados. 

## Recursos

- ICMS
- ICMS-ST
- IPI
- PIS
- COFINS

Recomendamos que os cálculos sejam validados pelo contador da empresa que utilizará a biblioteca.

## Utilização
```sh
procedure TForm1.btIcms00Click(Sender: TObject);
var
  OIcms00: IIcms00;
begin
  OIcms00 := TIcms00.Create(StringToFloatDef(edValorProduto.Text, 0),
                            StringToFloatDef(edValorFrete.Text, 0),
                            StringToFloatDef(edValorSeguro.Text,0),
                            StringToFloatDef(edValorDespesas.Text, 0),
                            StringToFloatDef(edValorDesconto.Text, 0),
                            StringToFloatDef(edAliqIcms.Text,0),
                            StringToFloatDef(edValorIpi.Text, 0));

  lbVBC00.Caption := OIcms00.BaseIcmsProprio.ToString;
  lbVICMS00.Caption := OIcms00.ValorIcmsProprio.ToString;
end;
```

## Suporte
<img src="https://www.sacfiscal.com.br/biosac64.png">
Nossa empresa é especializada em suporte técnico e tributário para software houses.
Acesse: https://www.sacfiscal.com.br

| Tecnologias | Frameworks |
| ------ | ------ |
| C# | ZeusDFe <https://github.com/ZeusAutomacao/DFe.NET> UniNFe <https://github.com/Unimake/DFe> OpenAC <https://github.com/OpenAC-Net> |
| Delphi | ACBr <https://projetoacbr.com.br/> |
| Lazarus | ACBr <https://projetoacbr.com.br/> |
| PHP | SPEDNFe <https://github.com/nfephp-org/sped-nfe> |


## Curso de Arquitetura Fiscal em Software
ARQUITETURA FISCAL EM SOFTWARE <https://arquiteturafiscal.online>
<br>O mais completo treinamento de tributação e regras fiscais para programadores e software houses

## Licença

GPL

## Revisão Técnica
Juliomar Marchetti e Vinícius Sanchez

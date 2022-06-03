# C2 : Esquema conceptual

## Modelo E/A


### Entidades: 

Produto (nome, _código, validade, codFornecedor, quantidade)

Tipodeproduto (gruposAlimentares, _código)

Mercado (nome, contacto, morada, email, _NIF)

Encomenda (codFornecedor, quantidade, _codProduto)

Fornecedor (nome, _NIF, email, morada, contacto)

Alerta (_nome, antecedência)


### Associações:


Recebe (ALERTA, FORNECEDOR)			       N:1 P/P

Categoria (TIPODEPRODUTO, PRODUTO)     1:N P/T

fornece (FORNECEDOR, PRODUTO)		       1:N P/T

compõe (PRODUTO, ENCOMENDA)            N:M P/P

fazA (MERCADO, ENCOMENDA)              1:N P/P

envia (FORNECEDOR, ENCOMENDA)          1:N P/T


### Diagrama: 
![An alternative description](imagens/Diagrama1.png)   

Diagrama do modelo Entidade-Associações  


## Regras de negócio adicionais (Restrições)
_O dono apenas terá acesso à gerencia no caso do gerente não estar presente_

---
[< Previous](rebd01.md) | [^ Main](https://github.com/TCM21-SIBD03/reportSIBD) | [Next >](rebd03.md)
:--- | :---: | ---: 

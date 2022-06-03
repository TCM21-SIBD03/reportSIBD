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


gruposDe (PRODUTO, TIPODEPRODUTO)				       N:1 T/P

gerenciaStock(GERENCIA, STOCK, PRODUTO, TIPODEPRODUTO)     1:N T/T

forneceProduto(FORNECEDOR, MERCADO, PRODUTO)		        1:N T/T



### Diagrama: 
![An alternative description](images/diagrama.png)   

Diagrama do modelo Entidade-Associações  


## Regras de negócio adicionais (Restrições)
_O dono apenas terá acesso à gerencia no caso do gerente não estar presente_

---
[< Previous](rebd01.md) | [^ Main](https://github.com/TCM21-SIBD03/reportSIBD) | [Next >](rebd03.md)
:--- | :---: | ---: 

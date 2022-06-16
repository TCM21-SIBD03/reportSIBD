# C2 : Esquema conceptual

## Modelo E/A


### Entidades: 

PRODUTO (nome, _ código _, validade, quantidade)

TIPODEPRODUTO (gruposAlimentares, _código_)

ENCOMENDA (_codEncomenda_, local)

FORNECEDOR (nome, _NIF_, email, morada, contacto)

ALERTA (_nome_, antecedência)


### Associações:


Recebe (ALERTA, FORNECEDOR)			       N:1 P/P

Categoria (TIPODEPRODUTO, PRODUTO)     1:N P/T

fornece (FORNECEDOR, PRODUTO)		       1:N P/T

compõe (PRODUTO, ENCOMENDA)            N:M P/P

envia (FORNECEDOR, ENCOMENDA)          1:N P/T


### Diagrama: 
![An alternative description](imagens/Diagrama1.png)   

Diagrama do modelo Entidade-Associações  


## Regras de negócio adicionais (Restrições)
_O dono apenas terá acesso à gerencia no caso do gerente não estar presente_

---
[< Previous](rebd01.md) | [^ Main](https://github.com/TCM21-SIBD03/reportSIBD) | [Next >](rebd03.md)
:--- | :---: | ---: 

# C2 : Esquema conceptual

## Modelo E/A


### Entidades: 

PRODUTO (nome, <ins>código</ins>, validade, quantidade)

TIPODEPRODUTO (gruposAlimentares, <ins>código</ins>)

ENCOMENDA (_ codEncomenda _, local)

FORNECEDOR (nome, _ NIF _, email, morada, contacto)

ALERTA (_ nome _, antecedência)


### Associações:


Recebe (ALERTA, FORNECEDOR)			       N:1 P/P

Categoria (TIPODEPRODUTO, PRODUTO)     1:N P/T

fornece (FORNECEDOR, PRODUTO)		       1:N P/T

compõe (PRODUTO, ENCOMENDA)            N:1 P/P

envia (FORNECEDOR, ENCOMENDA)          1:N P/T


### Diagrama: 
![An alternative description](imagens/diagrama.png)   

Diagrama do modelo Entidade-Associações  


## Regras de negócio adicionais (Restrições)
_O dono apenas terá acesso à gerencia no caso do gerente não estar presente_

---
[< Previous](rebd01.md) | [^ Main](https://github.com/TCM21-SIBD03/reportSIBD) | [Next >](rebd03.md)
:--- | :---: | ---: 

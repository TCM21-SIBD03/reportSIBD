# C3 : Normalização

## Conversão do Modelo EA para Modelo Relacional

### Passo 1: Entidade e Atributos 

Produto (nome, _código, validade, cod_fornecedor)

Tipodeproduto (gruposAlimentares, _código)

Mercado (nome, contacto, morada, email, _NIF)

Gerencia (gerente, _dono)

Stock (numeroMinimo, numeroMaximo)

Fornecedor (nome, _NIF, email, morada, contacto)

### Passo 2: Associações 1:1

Não existem associações com cardinalidade 1:1

### Passo 3: Associações 1:N

Produto (nome, _código, validade, cod_fornecedor
#_codigo -> Tipodeproduto

Tipodeproduto (gruposAlimentares, _código)

Mercado (nome, contacto, morada, email, _NIF)

Gerencia (gerente, _dono)

Stock (numeroMinimo, numeroMaximo)

Fornecedor (nome, _NIF, email, morada, contacto)

### Passo 4: Associações N:M

Não existem associações com cardinalidade N:M

### Passo 5: Atributo multivalor

Não existem atributos multivalor

### Passo 6: Associação ternária

Produto (nome, _código, validade, cod_fornecedor
#_codigo -> Tipodeproduto

Tipodeproduto (gruposAlimentares, _código)

Mercado (nome, contacto, morada, email, _NIF)

Gerencia (gerente, _dono)

Stock (numeroMinimo, numeroMaximo)

Fornecedor (nome, _NIF, email, morada, contacto)

GerenciaStock (_dono->Gerencia, #numeroMinimo -> Stock, #numeroMaximo->Stock, _codigo ->Produto, _codigo ->Tipodeproduto)

ForneceProduto (_NIF -> Fornecedor, _NIF-> Mercado, _codigo -> Produto)

### Passo 7: Entidades Fracas


## Relações

|Produto    |       |        |              |                         |
|-----------|------ |--------|--------------|-------------------------|
|nome       |_código|validade|cod_fornecedor|#_codigo -> Tipodeproduto|

## Normalização do Esquema Relacional
_(Apresentar o estudo da normalização das relações obtidas na secção anterior. Desnormalizar se necessário.)_

---
[< Previous](rebd02.md) | [^ Main](https://github.com/TCM21-SIBD03/reportSIBD) | [Next >](rebd04.md)
:--- | :---: | ---: 

# C3 : Normalização

## Conversão do Modelo EA para Modelo Relacional

### Passo 1: Entidade e Atributos 

Produto (nome, _ código _, validade, quantidade)

Tipodeproduto (gruposAlimentares, _ código _)

Encomenda (_ codEncomenda _, local)

Fornecedor (nome, _ NIF _, email, morada, contacto)

Alerta (_ nome _, antecedência)

### Passo 2: Associações 1:1

Não há associações com cardinalidade 1:1

### Passo 3: Associações 1:N

Produto (nome, _ código _, validade, quantidade
#_codigo_ -> Tipodeproduto, #_NIF_ -> Fornecedor, #_codEncomenda_ ->Encomenda)

Tipodeproduto (gruposAlimentares, _ código _)

Encomenda (_ codEncomenda _, local
#_NIF_ -> Fornecedor)

Fornecedor (nome, _ NIF _, email, morada, contacto)

Alerta (_ nome _, antecedência
#_NIF_ -> Fornecedor)

### Passo 4: Associações N:M

Não existe associações de carnalidade N:M

### Passo 5: Atributo multivalor

Não existe Atributos Multivalor

### Passo 6: Associação ternária

Não existem Associações Ternárias

### Passo 7: Entidade fraca

Não existem Entidades Fracas


## Relações

|Produto    |        |        |          |                          |                   |                            |
|-----------|--------|--------|----------|--------------------------|-------------------|----------------------------|
|nome       |_código_|validade|quantidade|#_codigo_ -> Tipodeproduto|#_NIF -> Fornecedor|#_codEncomenda_ -> Encomenda|

|Tipodeproduto    |        |
|-----------------|--------|
|gruposAlimentares|_código_|

|Encomenda     |     |                   |           
|--------------|-----|-------------------|
|_codEncomenda_|local|#_NIF_ ->Fornecedor|

|Alerta|            |                   |
|------|------------|-------------------|
|_nome_|antecedência|#_NIF -> Fornecedor|

|Fornecedor|     |     |      |        |
|----------|-----|-----|------|--------|
|nome      |_NIF_|email|morada|contacto|

## Dependências funcionais

FORNECEDOR (#_ nome _ -> ALERTA, _ NIF  _, nome, email, morada, contacto)

PRODUTO (#_ codigo _ ->TIPODEPRODUTO, _ codigo  _, nome, validade, quantidade)

PRODUTO (#_ NIF  _ ->FORNECEDOR, _ codigo  _, nome, validade, quantidade)

ENCOMENDA (#_ codigo  _ ->PRODUTO, _ codEncomenda  _, local)

ENCOMENDA (#_ NIF  _ ->FORNECEDOR, _ NIF _, nome, email, morada, contacto)


## Normalização do Esquema Relacional

# 1ª Forma Normal (1NF)

Já se encontra na 1NF

# 2ª Forma Normal (2NF)

Já se encontra na 2NF

# 3ª Forma Normal (3NF)

FORNECEDOR (#nome, _NIF)
Identificacaofornecedor (_nome, email, morada, contacto)

# Forma Normal de Boyce-Codd (BCNF)

Já se encontra na BCNF

# 4ª Forma Normal (4NF)

Já se encontra na 4NF

---
[< Previous](rebd02.md) | [^ Main](https://github.com/TCM21-SIBD03/reportSIBD) | [Next >](rebd04.md)
:--- | :---: | ---: 

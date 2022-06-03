# C3 : Normalização

## Conversão do Modelo EA para Modelo Relacional

### Passo 1: Entidade e Atributos 

Produto (nome, _código, validade, codFornecedor)

Tipodeproduto (gruposAlimentares, _código)

Mercado (nome, contacto, morada, email, _NIF)

Gerencia (gerente, _dono)

Stock (numeroMinimo, numeroMaximo)

Fornecedor (nome, _NIF, email, morada, contacto)

### Passo 2: Associações 1:1

Não existem associações com cardinalidade 1:1

### Passo 3: Associações 1:N

Produto (nome, _código, validade, codFornecedor
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

Produto (nome, _código, validade, codFornecedor
#_codigo -> Tipodeproduto

Tipodeproduto (gruposAlimentares, _código)

Mercado (nome, contacto, morada, email, _NIF)

Gerencia (gerente, _dono)

Stock (numeroMinimo, numeroMaximo)

Fornecedor (nome, _NIF, email, morada, contacto)

GerenciaStock (_dono->Gerencia, #numeroMinimo -> Stock, #numeroMaximo->Stock, _codigo ->Produto, _codigo ->Tipodeproduto)

ForneceProduto (_NIF -> Fornecedor, _NIF-> Mercado, _codigo -> Produto)

### Passo 7: Entidades Fracas

Não existem entidades fracas

## Relações

|Produto    |       |        |              |                         |
|-----------|------ |--------|--------------|-------------------------|
|nome       |_código|validade|codFornecedor|#_codigo -> Tipodeproduto|

|Tipodeproduto    |       |
|-----------------|-------|
|gruposAlimentares|_código|

|Mercado|        |      |     |    |
|-------|--------|------|-----|----|
|nome   |contacto|morada|email|_NIF|

|Gerencia|     |
|--------|-----|
|gerente |_dono|

|Stock       |            |
|------------|------------|
|numeroMinimo|numeroMaximo|

|Fornecedor|    |     |      |        |
|----------|----|-----|------|--------|
|nome      |_NIF|email|morada|contacto|

|GerenciaStock  |                      |                    |                 |                        |
|---------------|----------------------|--------------------|-----------------|------------------------|
|_dono->Gerencia|#numeroMinimo -> Stock|#numeroMaximo->Stock|_codigo ->Produto|_codigo -> Tipodeproduto|

|ForneceProduto    |              |                  |
|------------------|--------------|------------------|
|_NIF -> Fornecedor|_NIF-> Mercado|_codigo -> Produto|

## Normalização do Esquema Relacional

# 1ª Forma Normal (1NF)

Produto (nome, _código, validade, codFornecedor, quantidade)


Tipodeproduto (gruposAlimentares, _código)


Mercado (nome, contacto, morada, email, _NIF)


Encomenda (codFornecedor, quantidade, _codProduto)


Fornecedor (nome, _NIF, email, morada, contacto)


Alerta (_nome, antecedência)

# 2ª Forma Normal (2NF)

Produto (nome, _código, validade, codFornecedor, quantidade)


Tipodeproduto (gruposAlimentares, _código)


Mercado (nome, contacto, morada, email, _NIF)


Encomenda (codFornecedor, quantidade, _codProduto)


Fornecedor (nome, _NIF, email, morada, contacto)


Alerta (_nome, antecedência)

# 3ª Forma Normal (3NF)

Produto (nome, _código, validade, codFornecedor, quantidade)


Tipodeproduto (gruposAlimentares, _código)


Mercado (#nome, _NIF) 
MercadoNome(nome, contacto, morada, email)


Encomenda (codFornecedor, quantidade, _codProduto)


Fornecedor (#nome, _NIF)
FornecedorNome (nome, email, morada, contacto)


Alerta (_nome, antecedência)

---
[< Previous](rebd02.md) | [^ Main](https://github.com/TCM21-SIBD03/reportSIBD) | [Next >](rebd04.md)
:--- | :---: | ---: 

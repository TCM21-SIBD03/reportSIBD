# C3 : Normalização

## Conversão do Modelo EA para Modelo Relacional

### Passo 1: Entidade e Atributos 

Produto (nome, _codigo, validade, codFornecedor, quantidade)

Tipodeproduto (gruposAlimentares,_codigo)

Mercado (nome, contacto, morada, email,_NIF)

Encomenda (codFonrecedor, quantidade, _codProduto)

Fornecedor (nome, _NIF, email, morada, contacto)

Alerta (_nome, antecedência)

### Passo 2: Associações 1:1

Não há associações com cardinalidade 1:1

### Passo 3: Associações 1:N

Produto (nome, _codigo, validade, codFornecedor, quantidade,
  #_codigo->Tipodeproduto, #_NIF->Fornecedor)

Tipodeproduto (gruposAlimentares,_codigo)

Mercado (nome, contacto, morada, email,_NIF)

Encomenda (codFonrecedor, quantidade, _codProduto,
  #_NIF->Mercado,#_NIF->Fornecedor)

Fornecedor (nome, _NIF, email, morada, contacto)

Alerta (_nome, antecedência,
  #_NIF->Fornecedor)

### Passo 4: Associações N:M

Produto (nome, _codigo, validade, codFornecedor, quantidade,
  #_codigo->Tipodeproduto, #_NIF->Fornecedor)

Tipodeproduto (gruposAlimentares,_codigo)

Mercado (nome, contacto, morada, email,_NIF)

Encomenda (codFonrecedor, quantidade, _codProduto,
  #_NIF->Mercado,#_NIF->Fornecedor)

Fornecedor (nome, _NIF, email, morada, contacto)

Alerta (_nome, antecedência,
 #_NIF->Fornecedor)

Compoe ( #_codigo->Produto, #_codProduto->Encomenda)

### Passo 5: Atributo multivalor

Não existe Atributos Multivalor

### Passo 6: Associação ternária

Não existem Associações Ternárias

### Passo 7: Entidade fraca

Não existem Entidades Fracas


## Relações

|Produto    |       |        |              |          |                         |                   |
|-----------|------ |--------|--------------|----------|-------------------------|-------------------|
|nome       |_código|validade|codFornecedor |quantidade|#_codigo -> Tipodeproduto|#_NIF -> Fornecedor|

|Tipodeproduto    |       |
|-----------------|-------|
|gruposAlimentares|_código|

|Mercado|        |      |     |    |
|-------|--------|------|-----|----|
|nome   |contacto|morada|email|_NIF|

|Encomenda       |           |           |                |                   |
|----------------|-----------|-----------|----------------|-------------------|
|codFornecedor   |quant-idade|_codProduto|#_NIF -> Mercado|#_NIF -> Fornecedor|

|Alerta|            |                   |
|------|------------|-------------------|
|_nome |antecedência|#_NIF -> Fornecedor|

|Fornecedor|    |     |      |        |
|----------|----|-----|------|--------|
|nome      |_NIF|email|morada|contacto|

|GerenciaStock  |                      |                    |                 |                        |
|---------------|----------------------|--------------------|-----------------|------------------------|
|_dono->Gerencia|#numeroMinimo -> Stock|#numeroMaximo->Stock|_codigo ->Produto|_codigo -> Tipodeproduto|

|Compoe             |                        |
|-------------------|------------------------|
|#_codigo -> Produto|#_codProduto-> Encomenda|

## Normalização do Esquema Relacional

# 1ª Forma Normal (1NF)

Produto (nome, _codigo, validade, codFornecedor, quantidade, #_codigo->Tipodeproduto, #_NIF->Fornecedor)

Tipodeproduto (gruposAlimentares,_codigo)

Mercado (nome, contacto, morada, email,_NIF)

Encomenda (codFonrecedor, quantidade, _codProduto, #_NIF->Mercado,#_NIF->Fornecedor)

Fornecedor (nome, _NIF, email, morada, contacto)

Alerta (_nome, antecedência, #_NIF->Fornecedor)

Compoe ( #_codigo->Produto, #_codProduto->Encomenda)

# 2ª Forma Normal (2NF)

Produto (nome, _codigo, validade, codFornecedor, quantidade, #_codigo->Tipodeproduto, #_NIF->Fornecedor)

Tipodeproduto (gruposAlimentares,_codigo)

Mercado (nome, contacto, morada, email,_NIF)

Encomenda (codFonrecedor, quantidade, _codProduto, #_NIF->Mercado,#_NIF->Fornecedor)

Fornecedor (nome, _NIF, email, morada, contacto)

Alerta (_nome, antecedência, #_NIF->Fornecedor)

Compoe ( #_codigo->Produto, #_codProduto->Encomenda)

# 3ª Forma Normal (3NF)

Produto (nome, _codigo, validade, codFornecedor, quantidade, #_codigo->Tipodeproduto, #_NIF->Fornecedor)

Tipodeproduto (gruposAlimentares,_codigo)

Mercado (#nome,_NIF)

  Identificacaomercado (_nome, contacto, morada, email)

Encomenda (codFonrecedor, quantidade, _codProduto, #_NIF->Mercado,#_NIF->Fornecedor)

Fornecedor (#nome, _NIF)

  Identificacaofornecedor (_nome, email, morada, contacto)

Alerta (_nome, antecedência, #_NIF->Fornecedor)

Compoe ( #_codigo->Produto, #_codProduto->Encomenda)

# Forma Normal de Boyce-Codd (BCNF)

Produto (nome, _codigo, validade, codFornecedor, quantidade, #_codigo->Tipodeproduto, #_NIF->Fornecedor)

Tipodeproduto (gruposAlimentares,_codigo)

Mercado (#nome,_NIF)

  Identificacaomercado (_nome, contacto, morada, email)

Encomenda (codFonrecedor, quantidade, _codProduto, #_NIF->Mercado,#_NIF->Fornecedor)

Fornecedor (#nome, _NIF)

  Identificacaofornecedor (_nome, email, morada, contacto)

Alerta (_nome, antecedência, #_NIF->Fornecedor)

Compoe ( #_codigo->Produto, #_codProduto->Encomenda)

# 4ª Forma Normal (4NF)

Produto (nome, _codigo, validade, codFornecedor, quantidade, #_codigo->Tipodeproduto, #_NIF->Fornecedor)

Tipodeproduto (gruposAlimentares,_codigo)

Mercado (#nome,_NIF)

  Identificacaomercado (_nome, contacto, morada, email)

Encomenda (codFonrecedor, quantidade, _codProduto, #_NIF->Mercado,#_NIF->Fornecedor)

Fornecedor (#nome, _NIF)

  Identificacaofornecedor (_nome, email, morada, contacto)

Alerta (_nome, antecedência, #_NIF->Fornecedor)

Compoe ( #_codigo->Produto, #_codProduto->Encomenda)

---
[< Previous](rebd02.md) | [^ Main](https://github.com/TCM21-SIBD03/reportSIBD) | [Next >](rebd04.md)
:--- | :---: | ---: 

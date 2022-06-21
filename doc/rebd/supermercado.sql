CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;


CREATE TABLE IF NOT EXISTS `mydb`.`produto` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `validade` DATETIME NOT NULL,
  `cod_forncedor` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `mydb`.`Alerta` (
  `nome` INT NOT NULL AUTO_INCREMENT,
  `antecedência` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nome`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `mydb`.`fornecedor` (
  `NIF` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `morada` VARCHAR(45) NOT NULL,
  `contacto` VARCHAR(45) NOT NULL,
  `produto_codigo` INT NOT NULL,
  `Alerta_nome` INT NOT NULL,
  PRIMARY KEY (`NIF`, `produto_codigo`, `Alerta_nome`),
  INDEX `fk_fornecedor_produto1_idx` (`produto_codigo` ASC) VISIBLE,
  INDEX `fk_fornecedor_Alerta1_idx` (`Alerta_nome` ASC) VISIBLE,
  CONSTRAINT `fk_fornecedor_produto1`
    FOREIGN KEY (`produto_codigo`)
    REFERENCES `mydb`.`produto` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fornecedor_Alerta1`
    FOREIGN KEY (`Alerta_nome`)
    REFERENCES `mydb`.`Alerta` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `mydb`.`Tipodeproduto` (
  `código` INT NOT NULL AUTO_INCREMENT,
  `gruposAlimentares` VARCHAR(45) NOT NULL,
  `produto_codigo` INT NOT NULL,
  PRIMARY KEY (`código`, `produto_codigo`),
  INDEX `fk_Tipodeproduto_produto1_idx` (`produto_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_Tipodeproduto_produto1`
    FOREIGN KEY (`produto_codigo`)
    REFERENCES `mydb`.`produto` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `mydb`.`Encomenda` (
  `codProduto` INT NOT NULL AUTO_INCREMENT,
  `quantidade` INT NOT NULL,
  `codFornecedor` INT NOT NULL,
  PRIMARY KEY (`codProduto`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `mydb`.`Quantidade` (
  `quantidade` INT NOT NULL AUTO_INCREMENT,
  `idPorduto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`quantidade`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `mydb`.`compoe` (
  `produto_codigo` INT NOT NULL,
  `Encomenda_codProduto` INT NOT NULL,
  `Quantidade_quantidade` INT NOT NULL,
  PRIMARY KEY (`produto_codigo`, `Encomenda_codProduto`, `Quantidade_quantidade`),
  INDEX `fk_produto_has_Encomenda_Encomenda1_idx` (`Encomenda_codProduto` ASC) VISIBLE,
  INDEX `fk_produto_has_Encomenda_produto1_idx` (`produto_codigo` ASC) VISIBLE,
  INDEX `fk_compoe_Quantidade1_idx` (`Quantidade_quantidade` ASC) VISIBLE,
  CONSTRAINT `fk_produto_has_Encomenda_produto1`
    FOREIGN KEY (`produto_codigo`)
    REFERENCES `mydb`.`produto` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_has_Encomenda_Encomenda1`
    FOREIGN KEY (`Encomenda_codProduto`)
    REFERENCES `mydb`.`Encomenda` (`codProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compoe_Quantidade1`
    FOREIGN KEY (`Quantidade_quantidade`)
    REFERENCES `mydb`.`Quantidade` (`quantidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `mydb`.`envia` (
  `Encomenda_codProduto` INT NOT NULL,
  `fornecedor_NIF` INT NOT NULL,
  `fornecedor_produto_codigo` INT NOT NULL,
  `fornecedor_Alerta_nome` INT NOT NULL,
  PRIMARY KEY (`Encomenda_codProduto`, `fornecedor_NIF`, `fornecedor_produto_codigo`, `fornecedor_Alerta_nome`),
  INDEX `fk_Encomenda_has_fornecedor_fornecedor1_idx` (`fornecedor_NIF` ASC, `fornecedor_produto_codigo` ASC, `fornecedor_Alerta_nome` ASC) VISIBLE,
  INDEX `fk_Encomenda_has_fornecedor_Encomenda1_idx` (`Encomenda_codProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Encomenda_has_fornecedor_Encomenda1`
    FOREIGN KEY (`Encomenda_codProduto`)
    REFERENCES `mydb`.`Encomenda` (`codProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encomenda_has_fornecedor_fornecedor1`
    FOREIGN KEY (`fornecedor_NIF` , `fornecedor_produto_codigo` , `fornecedor_Alerta_nome`)
    REFERENCES `mydb`.`fornecedor` (`NIF` , `produto_codigo` , `Alerta_nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




INSERT INTO `produto` (nome, codigo, validade, quantidade ) VALUES
('maçã', '01' , '22/04/2022' , '50' ),
('banana', '02' , '27/04/2022' ,'62' ),
('uvas', '03' , '28/04/2022','32' ),
('morango', '04' , '27/04/2022' ,'120' ),
('aveia', '05' , '19/08/2022' ,'20' ),
('arroz', '06' , '27/04/2025','50' ),
('cevada', '07' , '03/07/2022' ,'12' ),
('centeio', '08' , '29/05/2022','10'),
('carneVaca', '09' , '29/04/2022' ,'7' ),
('carnePorco', '10' , '30/04/2022' ,'15'),
('feijao', '11' , '30/04/2024' ,'45' ),
('leite', '12' , '14/08/2022' , '22'),
('queijo', '13' , '25/05/2022' ,'25' ),
('azeite', '14' , '14/02/2025' ,'42' ),
('vinagre', '15' , '07/03/2023' , '27' ),
('oleo', '16' , '11/05/2023' ,'20' );

INSERT INTO `tipoProduto` (gruposalimentares, codigo) VALUES
('fruta', ' 210' ),
('vegetais', '240'),
('graosintegrais', '146'),
('carne', '951'),
('feijoes', '542'),
('lacticinios', '234'),
('gorduras', '642'),

('oleos', '149');INSERT INTO `encomenda` (codEncomenda, local) VALUES
('1346', ' local1' ),
('4632', ' local2' ),
('5849', ' local3' ),
('5101', ' local1' ),
('21567', 'local5'),
('1240', 'local6'),

('3563', 'local7');INSERT INTO `Fornecedor` (nome, NIF, email, morada, contacto) VALUES
('nome1', '200000001' , 'nome1@gmail.com' , '256000001' ),
('nome2', '200000002' , 'nome2@gmail.com' , '256000002' ),
('nome3', '200000003' , 'nome3@gmail.com' , '256000003' ),
('nome4', '200000004' , 'nome4@gmail.com' , '256000004' ),
('nome5', '200000005' , 'nome5@gmail.com' , '256000005' );INSERT INTO `alerta` (nome, antecedencia) VALUES
('alerta1', ' 13/05' ),
('alerta2', ' 14/08' ),
('alerta3', ' 21/03' );
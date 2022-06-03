# C5 : SQL

## DDL



```-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produto` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `validade` DATETIME NOT NULL,
  `cod_forncedor` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alerta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alerta` (
  `nome` INT NOT NULL AUTO_INCREMENT,
  `antecedência` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`nome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Encomenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Encomenda` (
  `codProduto` INT NOT NULL AUTO_INCREMENT,
  `quantidade` INT NOT NULL,
  `codFornecedor` INT NOT NULL,
  PRIMARY KEY (`codProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fornecedor` (
  `NIF` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `morada` VARCHAR(45) NOT NULL,
  `contacto` VARCHAR(45) NOT NULL,
  `produto_codigo` INT NOT NULL,
  `Alerta_nome` INT NOT NULL,
  `Encomenda_codProduto` INT NOT NULL,
  PRIMARY KEY (`NIF`, `produto_codigo`, `Alerta_nome`, `Encomenda_codProduto`),
  INDEX `fk_fornecedor_produto1_idx` (`produto_codigo` ASC) VISIBLE,
  INDEX `fk_fornecedor_Alerta1_idx` (`Alerta_nome` ASC) VISIBLE,
  INDEX `fk_fornecedor_Encomenda1_idx` (`Encomenda_codProduto` ASC) VISIBLE,
  CONSTRAINT `fk_fornecedor_produto1`
    FOREIGN KEY (`produto_codigo`)
    REFERENCES `mydb`.`produto` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fornecedor_Alerta1`
    FOREIGN KEY (`Alerta_nome`)
    REFERENCES `mydb`.`Alerta` (`nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fornecedor_Encomenda1`
    FOREIGN KEY (`Encomenda_codProduto`)
    REFERENCES `mydb`.`Encomenda` (`codProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipodeproduto`
-- -----------------------------------------------------
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


-- -----------------------------------------------------
-- Table `mydb`.`Mercado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mercado` (
  `NIF` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `contacto` VARCHAR(45) NOT NULL,
  `morada` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `Encomenda_codProduto` INT NOT NULL,
  PRIMARY KEY (`NIF`, `Encomenda_codProduto`),
  INDEX `fk_Mercado_Encomenda1_idx` (`Encomenda_codProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Mercado_Encomenda1`
    FOREIGN KEY (`Encomenda_codProduto`)
    REFERENCES `mydb`.`Encomenda` (`codProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`produto_has_Encomenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`produto_has_Encomenda` (
  `produto_codigo` INT NOT NULL,
  `Encomenda_codProduto` INT NOT NULL,
  PRIMARY KEY (`produto_codigo`, `Encomenda_codProduto`),
  INDEX `fk_produto_has_Encomenda_Encomenda1_idx` (`Encomenda_codProduto` ASC) VISIBLE,
  INDEX `fk_produto_has_Encomenda_produto1_idx` (`produto_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_produto_has_Encomenda_produto1`
    FOREIGN KEY (`produto_codigo`)
    REFERENCES `mydb`.`produto` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_has_Encomenda_Encomenda1`
    FOREIGN KEY (`Encomenda_codProduto`)
    REFERENCES `mydb`.`Encomenda` (`codProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
```

## DML

_(Apresentar exemplos dos pedidos SQL à base de dados que demonstrem o cumprimento dos requisitos identificados. Para cada query apresentar numa breve descrição do requisito que pretende resolver e do resultado espectável.)_

---
[< Previous](rebd04.md) | [^ Main](https://github.com/TCM21-SIBD03/reportSIBD) | Next >
:--- | :---: | ---: 

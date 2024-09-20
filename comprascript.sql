

-- -----------------------------------------------------
-- Schema vendas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vendas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vendas` DEFAULT CHARACTER SET utf8 ;
USE `vendas` ;

-- -----------------------------------------------------
-- Table `vendas`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`categorias` (
  `idcategorias` INT NOT NULL,
  `dsCategoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategorias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`produtos` (
  `idprodutos` INT NOT NULL,
  `dsProduto` VARCHAR(45) NOT NULL,
  `preco` FLOAT NOT NULL,
  `qtdade` INT NOT NULL,
  `foto` LONGBLOB NULL,
  `categorias_idcategorias` INT NOT NULL,
  PRIMARY KEY (`idprodutos`),
  CONSTRAINT `fk_produtos_categorias`
    FOREIGN KEY (`categorias_idcategorias`)
    REFERENCES `vendas`.`categorias` (`idcategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`clientes` (
  `idclientes` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idclientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`pedidos` (
  `idpedidos` INT NOT NULL,
  `data` DATE NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `sessao` VARCHAR(45) NOT NULL,
  `clientes_idclientes` INT NOT NULL,
  PRIMARY KEY (`idpedidos`),
  CONSTRAINT `fk_pedidos_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `vendas`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas`.`pedidoitens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas`.`pedidoitens` (
  `idpedidoitens` INT NOT NULL,
  `qtade` INT NOT NULL,
  `preco` FLOAT NOT NULL,
  `total` FLOAT NOT NULL,
  `produtos_idprodutos` INT NOT NULL,
  `pedidos_idpedidos` INT NOT NULL,
  PRIMARY KEY (`idpedidoitens`),
  CONSTRAINT `fk_pedidoitens_produtos1`
    FOREIGN KEY (`produtos_idprodutos`)
    REFERENCES `vendas`.`produtos` (`idprodutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidoitens_pedidos1`
    FOREIGN KEY (`pedidos_idpedidos`)
    REFERENCES `vendas`.`pedidos` (`idpedidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

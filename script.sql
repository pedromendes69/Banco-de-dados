-- MySQL Script generated by MySQL Workbench
-- Fri Sep 13 08:10:15 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema capacitacao
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema capacitacao
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `capacitacao` DEFAULT CHARACTER SET utf8 ;
USE `capacitacao` ;

-- -----------------------------------------------------
-- Table `capacitacao`.`instrutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`instrutor` (
	`idinstrutor` INT NOT NULL,
	`nome` VARCHAR(100) NOT NULL,
	`email` VARCHAR(100) NOT NULL,
	`valor_hora` DOUBLE NOT NULL,
	`certificados` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`idinstrutor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capacitacao`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`curso` (
	`idcurso` INT NOT NULL,
	`nome` VARCHAR(100) NOT NULL,
	`requisito` VARCHAR(100) NOT NULL,
	`carga_horaria` DOUBLE NOT NULL,
	`preço` DOUBLE NOT NULL,
	PRIMARY KEY (`idcurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`turma` (
	`idturma` INT NOT NULL,
	`carga_horaria` DOUBLE NOT NULL,
	`data_inicial` DATE NOT NULL,
	`data_final` DATE NOT NULL,
	`instrutor_idinstrutor` INT NOT NULL, -- chave estrangeira
	`curso_idcurso` INT NOT NULL,   -- chave estrangeira
	PRIMARY KEY (`idturma`),
	CONSTRAINT `fk_turma_instrutor`
    FOREIGN KEY (`instrutor_idinstrutor`)
    REFERENCES `capacitacao`.`instrutor` (`idinstrutor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
	CONSTRAINT `fk_turma_curso1`
    FOREIGN KEY (`curso_idcurso`)
    REFERENCES `capacitacao`.`curso` (`idcurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capacitacao`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`aluno` (
	`idaluno` INT NOT NULL,
	`nome` VARCHAR(100) NOT NULL,
	`CPF` VARCHAR(15) NOT NULL,
	`fone` CHAR(14) NOT NULL,
	`EMAIL` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`idaluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capacitacao`.`matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capacitacao`.`matricula` (
	`idmatricula` INT NOT NULL,
	`datamatricula` DATE NOT NULL,
	`turma_idturma` INT NOT NULL, -- chave estrangeira
	`aluno_idaluno` INT NOT NULL, -- chave estrangeira
	PRIMARY KEY (`idmatricula`),
	CONSTRAINT `fk_matricula_turma1`
    FOREIGN KEY (`turma_idturma`)
    REFERENCES `capacitacao`.`turma` (`idturma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
	CONSTRAINT `fk_matricula_aluno1`
    FOREIGN KEY (`aluno_idaluno`)
    REFERENCES `capacitacao`.`aluno` (`idaluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- MySQL Script generated by MySQL Workbench
-- Sat Feb  1 15:57:33 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

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
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `ra` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `telefone` VARCHAR(10) NULL,
  PRIMARY KEY (`ra`, `nome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Colaborador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Colaborador` (
  `cpf` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Livro` (
  `lsbn` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `autor` VARCHAR(45) NOT NULL,
  `paginas` INT NOT NULL,
  PRIMARY KEY (`lsbn`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empréstimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empréstimo` (
  `id` INT NOT NULL,
  `dataEmprestimo` DATE NOT NULL,
  `dataDevolucao` DATE NOT NULL,
  `livrolsbn` VARCHAR(45) NOT NULL,
  `colaboradorCPF` INT NOT NULL,
  `Colaborador_cpf` INT NOT NULL,
  `Livro_lsbn` INT NOT NULL,
  `Aluno_ra` INT NOT NULL,
  `Aluno_nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Empréstimo_Colaborador_idx` (`Colaborador_cpf` ASC) VISIBLE,
  INDEX `fk_Empréstimo_Livro1_idx` (`Livro_lsbn` ASC) VISIBLE,
  INDEX `fk_Empréstimo_Aluno1_idx` (`Aluno_ra` ASC, `Aluno_nome` ASC) VISIBLE,
  CONSTRAINT `fk_Empréstimo_Colaborador`
    FOREIGN KEY (`Colaborador_cpf`)
    REFERENCES `mydb`.`Colaborador` (`cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empréstimo_Livro1`
    FOREIGN KEY (`Livro_lsbn`)
    REFERENCES `mydb`.`Livro` (`lsbn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empréstimo_Aluno1`
    FOREIGN KEY (`Aluno_ra` , `Aluno_nome`)
    REFERENCES `mydb`.`Aluno` (`ra` , `nome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

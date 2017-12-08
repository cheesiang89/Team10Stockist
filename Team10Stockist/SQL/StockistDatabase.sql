-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema stockist
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema stockist
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `stockist` DEFAULT CHARACTER SET utf8 ;
USE `stockist` ;

-- -----------------------------------------------------
-- Table `stockist`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockist`.`customer` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `contact_number` INT(11) NOT NULL,
  `customer_name` VARCHAR(255) NOT NULL,
  `customer_email` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stockist`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockist`.`product` (
  `part_number` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `color` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `dimension` VARCHAR(255) NOT NULL,
  `shelf_location` VARCHAR(255) NOT NULL,
  `unit_price` DOUBLE NOT NULL,
  `manufacturer` VARCHAR(255) NOT NULL,
  `minimum_inventory_quantity` INT(11) NOT NULL,
  `stock_quantity` INT(11) NOT NULL,
  `minimum_reorder_quantity` INT(11) NOT NULL,
  PRIMARY KEY (`part_number`))
ENGINE = InnoDB
AUTO_INCREMENT = 1112
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stockist`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockist`.`supplier` (
  `supplier_id` INT(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` VARCHAR(255) NOT NULL,
  `contact_number` INT(11) NOT NULL,
  PRIMARY KEY (`supplier_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stockist`.`supplier_catalog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockist`.`supplier_catalog` (
  `supplier_id` INT(11) NOT NULL,
  `part_number` INT(11) NOT NULL,
  PRIMARY KEY (`supplier_id`, `part_number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stockist`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockist`.`user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  `contact_number` INT(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stockist`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockist`.`transaction` (
  `trans_id` INT(11) NOT NULL AUTO_INCREMENT,
  `customer_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  `datetime` DATETIME NOT NULL,
  PRIMARY KEY (`trans_id`),
  INDEX `tra_cus_idx` (`customer_id` ASC),
  INDEX `tra_use_idx` (`user_id` ASC),
  CONSTRAINT `trans_cid`
    FOREIGN KEY (`customer_id`)
    REFERENCES `stockist`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `trans_uid`
    FOREIGN KEY (`user_id`)
    REFERENCES `stockist`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stockist`.`transaction_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockist`.`transaction_details` (
  `trans_id` INT(11) NOT NULL,
  `part_number` INT(11) NOT NULL,
  `quantity` INT(11) NOT NULL,
  PRIMARY KEY (`trans_id`, `part_number`),
  INDEX `tde_pro_idx` (`part_number` ASC),
  INDEX `tde_tra_idx` (`trans_id` ASC),
  CONSTRAINT `tde_pro`
    FOREIGN KEY (`part_number`)
    REFERENCES `stockist`.`product` (`part_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `tde_tra`
    FOREIGN KEY (`trans_id`)
    REFERENCES `stockist`.`transaction` (`trans_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

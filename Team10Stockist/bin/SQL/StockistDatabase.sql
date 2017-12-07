-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

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
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `contact_number` INT(11) NULL,
  `customer_name` VARCHAR(255) NULL,
  `customer_email` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stockist`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockist`.`product` (
  `part_number` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `color` VARCHAR(255) NULL,
  `description` VARCHAR(255) NULL,
  `dimension` VARCHAR(255) NULL,
  `shelf_location` VARCHAR(255) NULL,
  `unit_price` DOUBLE NULL,
  `manufacturer` VARCHAR(255) NULL DEFAULT NULL,
  `reorder_quantity` INT NULL,
  `stock_quantity` INT NULL,
  `minimum_reorder_quantity` INT NULL,
  PRIMARY KEY (`part_number`))
ENGINE = InnoDB
AUTO_INCREMENT = 1000
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stockist`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockist`.`supplier` (
  `supplier_id` INT NOT NULL AUTO_INCREMENT,
  `supplier_name` VARCHAR(255) NULL,
  `contact_number` INT NULL,
  PRIMARY KEY (`supplier_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stockist`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockist`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `role` VARCHAR(45) NULL,
  `contact_number` INT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockist`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockist`.`transaction` (
  `trans_id` INT NOT NULL AUTO_INCREMENT,
  `custoemr_id` INT NULL,
  `user_id` INT NULL,
  `datetime` DATETIME NULL,
  PRIMARY KEY (`trans_id`),
  INDEX `tra_cus_idx` (`custoemr_id` ASC),
  INDEX `tra_use_idx` (`user_id` ASC),
  CONSTRAINT `tra_cus`
    FOREIGN KEY (`custoemr_id`)
    REFERENCES `stockist`.`customer` (`customer_id`)
    ON DELETE SET NULL
    ON UPDATE SET NULL,
  CONSTRAINT `tra_use`
    FOREIGN KEY (`user_id`)
    REFERENCES `stockist`.`user` (`user_id`)
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stockist`.`suppier_catalog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockist`.`suppier_catalog` (
  `supplier_id` INT NOT NULL,
  `part_number` INT NOT NULL,
  PRIMARY KEY (`supplier_id`, `part_number`),
  INDEX `sca_pro_idx` (`part_number` ASC),
  CONSTRAINT `sca_sup`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `stockist`.`supplier` (`supplier_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `sca_pro`
    FOREIGN KEY (`part_number`)
    REFERENCES `stockist`.`product` (`part_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `stockist`.`transaction_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stockist`.`transaction_details` (
  `trans_detail_id` INT NOT NULL AUTO_INCREMENT,
  `part_number` INT NOT NULL,
  `quantity` INT NULL,
  `trans_id` INT NULL,
  PRIMARY KEY (`trans_detail_id`, `part_number`),
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
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `stockist`.`customer`
-- -----------------------------------------------------
START TRANSACTION;
USE `stockist`;
INSERT INTO `stockist`.`customer` (`customer_id`, `contact_number`, `customer_name`, `customer_email`) VALUES (1, 1, '1', '1');
INSERT INTO `stockist`.`customer` (`customer_id`, `contact_number`, `customer_name`, `customer_email`) VALUES (2, 2, '2', '2');
INSERT INTO `stockist`.`customer` (`customer_id`, `contact_number`, `customer_name`, `customer_email`) VALUES (3, 3, '3', '3');

COMMIT;


-- -----------------------------------------------------
-- Data for table `stockist`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `stockist`;
INSERT INTO `stockist`.`product` (`part_number`, `name`, `color`, `description`, `dimension`, `shelf_location`, `unit_price`, `manufacturer`, `reorder_quantity`, `stock_quantity`, `minimum_reorder_quantity`) VALUES (1, '1', '1', '1', '1', '1', 1, '1', 1, 1, 1);
INSERT INTO `stockist`.`product` (`part_number`, `name`, `color`, `description`, `dimension`, `shelf_location`, `unit_price`, `manufacturer`, `reorder_quantity`, `stock_quantity`, `minimum_reorder_quantity`) VALUES (2, '1', '2', '2', '2', '2', 2, '2', 2, 2, 2);
INSERT INTO `stockist`.`product` (`part_number`, `name`, `color`, `description`, `dimension`, `shelf_location`, `unit_price`, `manufacturer`, `reorder_quantity`, `stock_quantity`, `minimum_reorder_quantity`) VALUES (3, '1', '3', '3', '3', '3', 3, '3', 3, 3, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `stockist`.`supplier`
-- -----------------------------------------------------
START TRANSACTION;
USE `stockist`;
INSERT INTO `stockist`.`supplier` (`supplier_id`, `supplier_name`, `contact_number`) VALUES (1, '1', 1);
INSERT INTO `stockist`.`supplier` (`supplier_id`, `supplier_name`, `contact_number`) VALUES (2, '2', 2);
INSERT INTO `stockist`.`supplier` (`supplier_id`, `supplier_name`, `contact_number`) VALUES (3, '3', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `stockist`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `stockist`;
INSERT INTO `stockist`.`user` (`user_id`, `name`, `password`, `role`, `contact_number`, `email`) VALUES (1, '1', '1', '1', 1, '1');
INSERT INTO `stockist`.`user` (`user_id`, `name`, `password`, `role`, `contact_number`, `email`) VALUES (2, '2', '2', '2', 2, '2');
INSERT INTO `stockist`.`user` (`user_id`, `name`, `password`, `role`, `contact_number`, `email`) VALUES (3, '3', '3', '3', 3, '3');

COMMIT;


-- -----------------------------------------------------
-- Data for table `stockist`.`transaction`
-- -----------------------------------------------------
START TRANSACTION;
USE `stockist`;
INSERT INTO `stockist`.`transaction` (`trans_id`, `custoemr_id`, `user_id`, `datetime`) VALUES (1, 1, 1, '1970-01-01');
INSERT INTO `stockist`.`transaction` (`trans_id`, `custoemr_id`, `user_id`, `datetime`) VALUES (2, 2, 2, '1970-01-01');
INSERT INTO `stockist`.`transaction` (`trans_id`, `custoemr_id`, `user_id`, `datetime`) VALUES (3, 3, 3, '1970-01-01');

COMMIT;


-- -----------------------------------------------------
-- Data for table `stockist`.`suppier_catalog`
-- -----------------------------------------------------
START TRANSACTION;
USE `stockist`;
INSERT INTO `stockist`.`suppier_catalog` (`supplier_id`, `part_number`) VALUES (1, 1);
INSERT INTO `stockist`.`suppier_catalog` (`supplier_id`, `part_number`) VALUES (2, 2);
INSERT INTO `stockist`.`suppier_catalog` (`supplier_id`, `part_number`) VALUES (3, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `stockist`.`transaction_details`
-- -----------------------------------------------------
START TRANSACTION;
USE `stockist`;
INSERT INTO `stockist`.`transaction_details` (`trans_detail_id`, `part_number`, `quantity`, `trans_id`) VALUES (1, 1, 1, 1);
INSERT INTO `stockist`.`transaction_details` (`trans_detail_id`, `part_number`, `quantity`, `trans_id`) VALUES (2, 2, 2, 2);
INSERT INTO `stockist`.`transaction_details` (`trans_detail_id`, `part_number`, `quantity`, `trans_id`) VALUES (3, 3, 3, 3);

COMMIT;


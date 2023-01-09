create database ecobike;

CREATE TABLE `ecobike`.`User` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `ecobike`.`ParkingLot` (
  `id` INT NOT NULL,
  `location` VARCHAR(255) NULL,
  `name` VARCHAR(255) NULL,
  `total_slots` INT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `ecobike`.`Bike` (
  `id` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `date_of_manufacture` DATETIME NULL,
  `color` VARCHAR(45) NULL,
  `price` INT NULL,
  `battery` INT NULL,
  `maximum_usage_time` INT NULL,
  `license_plate_number` VARCHAR(45) NULL,
  `slot_id` INT NULL,
  `park_id` INT NULL,
  `is_rented` TINYINT NULL,
  PRIMARY KEY (`id`),
  #INDEX `fk_Bike_idx` (`park_id` ASC) VISIBLE,
  CONSTRAINT `fk_Bike`
    FOREIGN KEY (`park_id`)
    REFERENCES `ecobike`.`ParkingLot` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `ecobike`.`Rental` (
  `id` INT NOT NULL,
  `rentee_id` INT NULL,
  `bike_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Rental_User_idx` (`rentee_id` ASC) VISIBLE,
  INDEX `fk_Rental_Bike_idx` (`bike_id` ASC) VISIBLE,
  CONSTRAINT `fk_Rental_User`
    FOREIGN KEY (`rentee_id`)
    REFERENCES `ecobike`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rental_Bike`
    FOREIGN KEY (`bike_id`)
    REFERENCES `ecobike`.`Bike` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `ecobike`.`Event` (
  `id` INT NOT NULL,
  `rental_id` INT NULL,
  `time` DATETIME NULL,
  `type` VARCHAR(10) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Event_Rental_idx` (`rental_id` ASC) VISIBLE,
  CONSTRAINT `fk_Event_Rental`
    FOREIGN KEY (`rental_id`)
    REFERENCES `ecobike`.`Rental` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `ecobike`.`PaymentTransaction` (
  `id` INT NOT NULL,
  `rentail_id` INT NULL,
  `amount` INT NULL,
  `time` DATETIME NULL,
  `type` VARCHAR(10) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_PaymentTransaction_Rental_idx` (`rentail_id` ASC) VISIBLE,
  CONSTRAINT `fk_PaymentTransaction_Rental`
    FOREIGN KEY (`rentail_id`)
    REFERENCES `ecobike`.`Rental` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


INSERT INTO `ecobike`.`User` VALUES (1,'truongvq','12345678');
INSERT INTO `ecobike`.`User` VALUES (2,'hoangnh','98765432');
INSERT INTO `ecobike`.`User` VALUES (3,'tannp','12344321');
INSERT INTO `ecobike`.`User` VALUES (4,'baonn','11111111');

INSERT INTO `ecobike`.`ParkingLot` VALUES (1,NULL,'Huy Hoàng',40);
INSERT INTO `ecobike`.`ParkingLot` VALUES (2,NULL,'Bảo Ngọc',30);
INSERT INTO `ecobike`.`ParkingLot` VALUES (3,NULL,'Trường Vũ',50);
INSERT INTO `ecobike`.`ParkingLot` VALUES (4,NULL,'Hoàng Huy',30);

INSERT INTO `ecobike`.`Bike` VALUES (1,'single','Wave','Japan','2022-01-01 00:00:00','red',3000,100,72,'29X1-01234',3,1,0);
INSERT INTO `ecobike`.`Bike` VALUES (2,'double','Flash','US','2021-10-11 10:00:00','blue',4500,80,60,'30X3-5294',10,4,1);
INSERT INTO `ecobike`.`Bike` VALUES (3,'electric double','Flash','US','2021-10-13 16:00:00','blue',6500,80,60,'30T1-34942',5,2,0);
INSERT INTO `ecobike`.`Bike` VALUES (4,'electric single','Future','Vietnam','2022-03-23 18:30:00','green',5000,40,48,'32Y2-67295',18,2,0);
INSERT INTO `ecobike`.`Bike` VALUES (5,'electric single','Wave','Japan','2021-04-18 09:40:00','white',5800,60,60,'33Y3-9246',20,3,1);
INSERT INTO `ecobike`.`Bike` VALUES (6,'double','Flash','US','2022-09-18 11:20:00','silver',6500,55,48,'31F6-1056',9,4,0);

INSERT INTO `ecobike`.`Rental` VALUES (1,1,2);
INSERT INTO `ecobike`.`Rental` VALUES (2,2,3);
INSERT INTO `ecobike`.`Rental` VALUES (3,1,5);
INSERT INTO `ecobike`.`Rental` VALUES (4,3,3);
INSERT INTO `ecobike`.`Rental` VALUES (5,4,6);
INSERT INTO `ecobike`.`Rental` VALUES (6,2,6);
INSERT INTO `ecobike`.`Rental` VALUES (7,4,6);
INSERT INTO `ecobike`.`Rental` VALUES (8,1,2);
INSERT INTO `ecobike`.`Rental` VALUES (9,3,4);
INSERT INTO `ecobike`.`Rental` VALUES (10,3,1);



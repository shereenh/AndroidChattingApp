-- -----------------------------------------------------
-- Schema cs656chatapp
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cs656chatapp`;
CREATE SCHEMA IF NOT EXISTS `cs656chatapp` DEFAULT CHARACTER SET utf8;
SHOW WARNINGS;
USE `cs656chatapp`;

-- -----------------------------------------------------
-- Table `Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Users` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(30) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `name` VARCHAR(90) NULL ,
  `gender` VARCHAR(45) NULL,
  `birth_date` VARCHAR(45) NULL,
  `profile_pic` VARCHAR(45) NULL,
  `bio` VARCHAR(45) NULL,
  `join_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `user_id_UNIQUE` ON `Users` (`user_id` ASC);
SHOW WARNINGS;

-- -----------------------------------------------------
DROP TABLE IF EXISTS `Friends` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Friends` (
  `user_id` INT NOT NULL,
  `friend_id` INT NOT NULL,
  
  PRIMARY KEY (`user_id`,`friend_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  FOREIGN KEY (`friend_id`) REFERENCES `users` (`user_id`)) 
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
DROP TABLE IF EXISTS `Messages` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Messages` (
  `mes_id` INT NOT NULL AUTO_INCREMENT,
  `from_uid` INT NOT NULL,
  `to_uid` INT NOT NULL,
  `message_type` VARCHAR(45) NOT NULL,
  `content` varchar(100) NULL,
  `sent_dt` timestamp DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (`mes_id`),
  FOREIGN KEY (`from_uid`) REFERENCES `users` (`user_id`),
  FOREIGN KEY (`to_uid`) REFERENCES `users` (`user_id`)) 
ENGINE = InnoDB;

SHOW WARNINGS;
-- -----------------------------------------------------
-- Data Population
-- -----------------------------------------------------
INSERT INTO Users (
   username, password, name, gender, birth_date, bio
) VALUES
   ("Jeremy", "Jeremy", "Jeremy Hochheiser", "Male", "1989-07-07", "I am cool."),
   ("Vipul", "Vipul", "Vipul Shah", "Male", "1990-04-03", "Software Engineer."),
   ("Shereen", "Shereen", "Shereen Hameed", "Female", "1990-11-16", "I am Shereen."),
   ("Andrew", "Andrew", "Andrew Monastero", "Male", "1990-05-26", "I am Andrew.")
;
-- -----------------------------------------------------

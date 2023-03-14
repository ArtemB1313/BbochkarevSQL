DROP DATABASE IF EXISTS `school`;
CREATE DATABASE `school`;
USE `school`;
SHOW TABLES;


CREATE TABLE IF NOT EXISTS `school`.`Teacher` (
  `full name student` VARCHAR(45) NOT NULL,
  `date of birth` DATE NULL,
  `pasport` INT NULL,
  PRIMARY KEY (`full name student`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `school`.`Cabinet` (
  `floor` INT NOT NULL,
  `Responsible teacher` VARCHAR(45) NULL,
  `pasport` INT NULL,
  `Teacher_full name student` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`floor`, `Teacher_full name student`),
  INDEX `fk_Cabinet_Teacher_idx` (`Teacher_full name student` ASC) VISIBLE,
  CONSTRAINT `fk_Cabinet_Teacher`
    FOREIGN KEY (`Teacher_full name student`)
    REFERENCES `school`.`Teacher` (`full name student`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `school`.`classes` (
  `¹ class` INT NOT NULL,
  `number of people` INT NULL,
  `headman` VARCHAR(45) NULL,
  `quality of knowledge` VARCHAR(45) NULL,
  PRIMARY KEY (`¹ class`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `school`.`schedule` (
  `full name students` VARCHAR(45) NOT NULL,
  `¹ class` INT NULL,
  `day of the week` VARCHAR(45) NULL,
  `¹ lesson` INT NULL,
  `Teacher_full name student` VARCHAR(45) NOT NULL,
  `classes_¹ class` INT NOT NULL,
  PRIMARY KEY (`full name students`, `Teacher_full name student`, `classes_¹ class`),
  INDEX `fk_schedule_Teacher1_idx` (`Teacher_full name student` ASC) VISIBLE,
  INDEX `fk_schedule_classes1_idx` (`classes_¹ class` ASC) VISIBLE,
  CONSTRAINT `fk_schedule_Teacher1`
    FOREIGN KEY (`Teacher_full name student`)
    REFERENCES `school`.`Teacher` (`full name student`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_schedule_classes1`
    FOREIGN KEY (`classes_¹ class`)
    REFERENCES `mydb`.`classes` (`¹ class`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `school`.`lessons` (
  `names` VARCHAR(45) NOT NULL,
  `full name students` VARCHAR(45) NULL,
  PRIMARY KEY (`names`))
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `school`.`extracurricular activites` (
  `name` VARCHAR(45) NOT NULL,
  `full name students` VARCHAR(45) NULL,
  `number of students` INT NULL,
  `Teacher_full name student` VARCHAR(45) NOT NULL,
  `lessons_names` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`name`, `Teacher_full name student`, `lessons_names`),
  INDEX `fk_extracurricular activites_Teacher1_idx` (`Teacher_full name student` ASC) VISIBLE,
  INDEX `fk_extracurricular activites_lessons1_idx` (`lessons_names` ASC) VISIBLE,
  CONSTRAINT `fk_extracurricular activites_Teacher1`
    FOREIGN KEY (`Teacher_full name student`)
    REFERENCES `school`.`Teacher` (`full name student`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_extracurricular activites_lessons1`
    FOREIGN KEY (`lessons_names`)
    REFERENCES `school`.`lessons` (`names`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



CREATE TABLE IF NOT EXISTS `school`.`students` (
  `student's full name` VARCHAR(45) NOT NULL,
  `date of birth` DATE NULL,
  `¹ class` INT NULL,
  `lessons_names` VARCHAR(45) NOT NULL,
  `classes_¹ class` INT NOT NULL,
  PRIMARY KEY (`student's full name`, `lessons_names`, `classes_¹ class`),
  INDEX `fk_students_lessons1_idx` (`lessons_names` ASC) VISIBLE,
  INDEX `fk_students_classes1_idx` (`classes_¹ class` ASC) VISIBLE,
  CONSTRAINT `fk_students_lessons1`
    FOREIGN KEY (`lessons_names`)
    REFERENCES `school`.`lessons` (`names`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_classes1`
    FOREIGN KEY (`classes_¹ class`)
    REFERENCES `mydb`.`classes` (`¹ class`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



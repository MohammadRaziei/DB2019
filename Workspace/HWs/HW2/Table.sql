CREATE TABLE `insurance`.`employee` (
  `IDE` INT NOT NULL,
  `EFname` VARCHAR(45) NULL,
  `ELname` VARCHAR(45) NULL,
  `phone` VARCHAR(20) NULL,
  `Address` VARCHAR(45) NULL,
  PRIMARY KEY (`IDE`));

CREATE TABLE `insurance`.`box` (
  `IDE` INT NOT NULL,
  `Password` CHAR(4) NULL,
  PRIMARY KEY (`IDE`),
  CONSTRAINT `IDE`
    FOREIGN KEY (`IDE`)
    REFERENCES `insurance`.`employee` (`IDE`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `insurance`.`branch` (
  `IDB` INT NOT NULL,
  `Bname` VARCHAR(45) NULL,
  `Boss` VARCHAR(45) NULL,
  `Deputy Finance Director` VARCHAR(45) NULL,
  PRIMARY KEY (`IDB`));

CREATE TABLE `insurance`.`insurance offers` (
  `IDIO` INT NOT NULL,
  `IDB` INT NOT NULL,
  `IOname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDIO`, `IDB`, `IOname`),
  INDEX `IDB_idx` (`IDB` ASC),
  CONSTRAINT `IDB`
    FOREIGN KEY (`IDB`)
    REFERENCES `insurance`.`branch` (`IDB`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `insurance`.`issued insurance` (
  `IDII` INT NOT NULL,
  `Price` VARCHAR(45) NULL,
  `Date` DATETIME NULL,
  PRIMARY KEY (`IDII`));

CREATE TABLE `insurance`.`insurer` (
  `IDI` INT NOT NULL,
  `IFname` VARCHAR(45) NULL,
  `ILname` VARCHAR(45) NULL,
  `age` INT NULL,
  `gender` VARCHAR(45) NULL,
  `phone` VARCHAR(20) NULL,
  `Address` VARCHAR(45) NULL,
  `password` VARCHAR(8) NULL,
  PRIMARY KEY (`IDI`));

CREATE TABLE `insurance`.`comments` (
  `IDC` INT NOT NULL,
  `Question` VARCHAR(45) NULL,
  `Reply` VARCHAR(45) NULL,
  PRIMARY KEY (`IDC`));

CREATE TABLE `insurance`.`insured car` (
  `IDIC` INT NOT NULL,
  `CarModel` VARCHAR(45) NULL,
  `CarColor` VARCHAR(45) NULL,
  `productioYear` INT NULL,
  `plateNumber` VARCHAR(45) NULL,
  PRIMARY KEY (`IDIC`),
  CONSTRAINT `ID2`
	  FOREIGN KEY (`IDIC`)
	  REFERENCES `insurance`.`issued insurance` (`IDII`)
	  ON DELETE CASCADE
	  ON UPDATE CASCADE);

CREATE TABLE `insurance`.`insured building` (
  `IDIB` INT NOT NULL,
  `Address` VARCHAR(45) NULL,
  `BuildingArea` INT NULL,
  `yearOfConstruction` INT NULL,
  PRIMARY KEY (`IDIB`),
  CONSTRAINT `ID`
	  FOREIGN KEY (`IDIB`)
	  REFERENCES `insurance`.`issued insurance` (`IDII`)
	  ON DELETE CASCADE
	  ON UPDATE CASCADE);

CREATE TABLE `insurance`.`insured life` (
  `IDIL` INT NOT NULL,
  `ILFname` VARCHAR(45) NULL,
  `ILLname` VARCHAR(45) NULL,
  `BirthDate` DATETIME NULL,
  `NationalCode` INT NULL,
  PRIMARY KEY (`IDIL`),
  CONSTRAINT `ID1`
	  FOREIGN KEY (`IDIL`)
	  REFERENCES `insurance`.`issued insurance` (`IDII`)
	  ON DELETE CASCADE
	  ON UPDATE CASCADE);

CREATE TABLE `insurance`.`employeeofbranch` (
  `IDE` INT NOT NULL,
  `IDB` INT NULL,
  PRIMARY KEY (`IDE`),
  INDEX `IDB_idx` (`IDB` ASC),
  CONSTRAINT `IDE111`
    FOREIGN KEY (`IDE`)
    REFERENCES `insurance`.`employee` (`IDE`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `IDB111`
    FOREIGN KEY (`IDB`)
    REFERENCES `insurance`.`branch` (`IDB`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `insurance`.`issuedinsuranceofabranch` (
  `IDB` INT NULL,
  `IDII` INT NOT NULL,
  PRIMARY KEY (`IDII`),
  INDEX `IDB1_idx` (`IDB` ASC),
  CONSTRAINT `IDB1`
    FOREIGN KEY (`IDB`)
    REFERENCES `insurance`.`branch` (`IDB`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `IDII1`
    FOREIGN KEY (`IDII`)
    REFERENCES `insurance`.`issued insurance` (`IDII`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `insurance`.`insurerissuedinsurance` (
  `IDII` INT NOT NULL,
  `IDI` INT NULL,
  PRIMARY KEY (`IDII`),
  INDEX `IDI_idx` (`IDI` ASC),
  CONSTRAINT `IDII111`
    FOREIGN KEY (`IDII`)
    REFERENCES `insurance`.`issued insurance` (`IDII`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `IDI1`
    FOREIGN KEY (`IDI`)
    REFERENCES `insurance`.`insurer` (`IDI`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `insurance`.`insurercomments` (
  `IDI` INT NOT NULL,
  `IDC` INT NOT NULL,
  PRIMARY KEY (`IDI`, `IDC`),
  INDEX `IDC_idx` (`IDC` ASC),
  CONSTRAINT `IDI111`
    FOREIGN KEY (`IDI`)
    REFERENCES `insurance`.`insurer` (`IDI`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `IDC`
    FOREIGN KEY (`IDC`)
    REFERENCES `insurance`.`comments` (`IDC`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE TABLE `insurance`.`kindofinsurance` (
  `IDII` INT NOT NULL,
  `IDIO` INT NULL,
  `IDIB` INT NULL,
  `IOname` VARCHAR(45) NULL,
  PRIMARY KEY (`IDII`),
  INDEX `IDIo12_idx` (`IDIO` ASC, `IDIB` ASC, `IOname` ASC),
  CONSTRAINT `IDII1221`
    FOREIGN KEY (`IDII`)
    REFERENCES `insurance`.`issued insurance` (`IDII`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `IDIo12`
    FOREIGN KEY (`IDIO` , `IDIB` , `IOname`)
    REFERENCES `insurance`.`insurance offers` (`IDIO` , `IDB` , `IOname`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `insurance`.`branchinsurance` (
  `IDIO` INT NOT NULL,
  `IDB` INT NOT NULL,
  `IOname` VARCHAR(45) NULL,
  `Bname` VARCHAR(45) NULL,
  PRIMARY KEY (`IDIO`, `IDB`),
  INDEX `IDB34_idx` (`IDB` ASC),
 CONSTRAINT `ID123`
 INDEX `ID789_idx` (`IDIO` ASC, `IDB` ASC, `IOname` ASC); 
 CONSTRAINT `ID78912`
  FOREIGN KEY (`IDIO` , `IDB` , `IOname`)
  REFERENCES `insurance`.`insurance offers` (`IDIO` , `IDB` , `IOname`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
 CONSTRAINT `Bname`
  FOREIGN KEY (`Bname`)
  REFERENCES `insurance`.`branch` (`Bname`)
  ON DELETE CASCADE
  ON UPDATE CASCADE);

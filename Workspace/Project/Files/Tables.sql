-- Customer :
CREATE TABLE Customer (
	CID				int,
   NationalCode 	int Unique,
   LastName 		varchar(127),
   FirstName 		varchar(127),
	Hash_Password	varchar(63),		
	CONSTRAINT PK_C PRIMARY KEY (CID)
);
CREATE TABLE  Customer_Address(
	CID 				int,
	Address			varchar(255) NOT NULL,
	CONSTRAINT PK_CAd PRIMARY KEY (CID),
   CONSTRAINT FK_CAd FOREIGN KEY (CID) REFERENCES Customer(CID)
);
CREATE TABLE  Customer_Phone(
	CID 				int,
	Phone				varchar(12) NOT NULL,
	CONSTRAINT PK_CP PRIMARY KEY (CID),
   CONSTRAINT FK_CP FOREIGN KEY (CID) REFERENCES Customer(CID)
);

-- Account :
CREATE TABLE  Account(
	AID			 	int,
	Cash				int DEFAULT(0),
	AType				varchar(15),
	Nsign				int,
	CONSTRAINT PK_A_ID PRIMARY KEY (AID),
	CONSTRAINT CHK_A_type CHECK(AType in ('currnet','charity','saving'))
);
CREATE TABLE  Account_soratHesab(
	AID			 	int,
	STime				timestamp,
	Descriptions	varchar(257),
	amount			int,
	Stype				varchar(15) NOT NULL,
	
	CONSTRAINT PK_AS PRIMARY KEY (AID,STime),
	CONSTRAINT FK_AS_ID FOREIGN KEY (AID) REFERENCES Account(AID),
	CONSTRAINT CHK_AS_type CHECK(Stype in('receive','send'))
);

CREATE TABLE DastorPardakht(
	PNumber 			int,
	CNote				varchar(255),
	CID				int,
	Origin_AID		int Not Null,
	State				numeric(1,0) DEFAULT(0),
	CONSTRAINT PK_D PRIMARY KEY (PNumber),
	CONSTRAINT FK_D_CID FOREIGN KEY (CID) REFERENCES Customer(CID),
	CONSTRAINT FK_D_Origin_AID FOREIGN KEY (Origin_AID) REFERENCES Account(AID),
	CONSTRAINT CHK_AS_type CHECK(State in (0,1))
);
-- Transactions
CREATE TABLE Transactions(
	TID				int NOT NULL AUTO_INCREMENT,
	PNumber 			int,	
	Dest_AID			int,
	amount			int,
	CONSTRAINT PK_T PRIMARY KEY (TID),
	CONSTRAINT FK_T_PNumber FOREIGN KEY (PNumber) REFERENCES DastorPardakht(PNumber),
	CONSTRAINT FK_T_Dest_AID FOREIGN KEY (Dest_AID) REFERENCES Account(AID)
);
-- Customer_Account
CREATE TABLE Customer_Account(
	AID				int,
	CID				int,
	Name				varchar(127),
	Color				varchar(31),
	CONSTRAINT PK_CA PRIMARY KEY (CID,AID),
	CONSTRAINT FK_CA_CID FOREIGN KEY (CID) REFERENCES Customer(CID),
	CONSTRAINT FK_CA_AID FOREIGN KEY (AID) REFERENCES Account(AID)
);
CREATE TABLE Customer_Account_Access(
	AID				int,
	CID				int,
	Access			varchar(7),
	CONSTRAINT PK_CAA PRIMARY KEY (CID,AID,Access),
	CONSTRAINT FK_CAA_CID FOREIGN KEY (CID) REFERENCES Customer(CID),
	CONSTRAINT FK_CAA_AID FOREIGN KEY (AID) REFERENCES Account(AID),
	CONSTRAINT CHK_CAA_Access CHECK(Access in ('pay','visit','sign'))
);

-- Customer_sign
CREATE TABLE Customer_sign(
	CID				int,
	PNumber			int,
	CONSTRAINT PK_CS PRIMARY KEY (CID,PNumber),
	CONSTRAINT FK_CS_CID FOREIGN KEY (CID) REFERENCES Customer(CID),
	CONSTRAINT FK_CS_PNumber FOREIGN KEY (PNumber) REFERENCES DastorPardakht(PNumber)
	
);
-- Customer_sign_deleted
CREATE TABLE Customer_sign_deleted(
	CID				int,
	PNumber			int,
	CONSTRAINT PK_CSD PRIMARY KEY (CID,PNumber),
	CONSTRAINT FK_CSD_CID FOREIGN KEY (CID) REFERENCES Customer(CID),
	CONSTRAINT FK_CSD_PNumber FOREIGN KEY (PNumber) REFERENCES DastorPardakht(PNumber)
	
);


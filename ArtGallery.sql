-- CREATE SCHEMA
CREATE SCHEMA ArtGallerydb ;

-- CREAT TABLE 1 : EXHIBITION
CREATE TABLE artgallerydb.exhibition (
   NameGallery VARCHAR(45) NOT NULL,
   ZIPcode VARCHAR(45) NOT NULL,
   Country VARCHAR(45) NULL,
   City VARCHAR(45) NULL,
   OpenTime VARCHAR(45) NULL,
   CloseTime VARCHAR(45) NULL,
  CONSTRAINT exhibition_PK PRIMARY KEY (NameGallery,ZIPcode));

-- CREAT TABLE 2 : COSTOMER
CREATE TABLE artgallerydb.customer (
CustomerNum INT NOT NULL,
 Name VARCHAR(45) NULL,
 City VARCHAR(45) NULL,
 State VARCHAR(45) NULL,
 Street VARCHAR(45) NULL,
 zipcode  VARCHAR(45) NULL,
  CONSTRAINT customer_PK PRIMARY KEY (CustomerNum));
  
  -- CREAT TABLE 3 : COSTOMERnum
  CREATE TABLE artgallerydb.customerPhoneNnmber(
  CustomerNum INT NOT NULL,
  PhoneNumber INT,
  CONSTRAINT customer_PK PRIMARY KEY (CustomerNum,PhoneNumber),
  CONSTRAINT COSTOMERnum_FK1 FOREIGN KEY (CustomerNum) REFERENCES customer(CustomerNum));
  
  
  
-- CREAT TABLE 4 : ARTIST
CREATE TABLE artgallerydb. artist (
   ArtistID INT NOT NULL,
   Name VARCHAR(45) NULL,
   PhoneNumber INT NULL,
   Birth VARCHAR(45) NULL,
   Address VARCHAR(45) NULL,
  CONSTRAINT artist_PK PRIMARY KEY (ArtistID));


-- CREAT TABLE 5 : DEPRATMENT
CREATE TABLE artgallerydb.department (
   DepartmentNum INT NOT NULL,
    Name VARCHAR(45) NULL,
   Location  VARCHAR(45) NULL,  
   ZIPcode VARCHAR(45),
   NameGallery VARCHAR(45),
  CONSTRAINT department_PK PRIMARY KEY (DepartmentNum),
 CONSTRAINT department_FK1 FOREIGN KEY (NameGallery,ZIPcode) REFERENCES exhibition(NameGallery,ZIPcode));

  
-- CREAT TABLE 6 : EMPLOYEE 
CREATE TABLE artgallerydb.employee (
 EmployeeNumber INT NOT NULL,
 Name VARCHAR(45) NULL,
 PhoneNumber INT NULL,
 Job VARCHAR(45) NULL,
 Address VARCHAR(45) NULL,
 DateBirth VARCHAR(45) NULL,
 DepartmentNum INT ,
CONSTRAINT employee_PK PRIMARY KEY (EmployeeNumber),
CONSTRAINT employee_FK1 FOREIGN KEY (DepartmentNum) REFERENCES department(DepartmentNum));


-- CREAT TABLE 7: artwork 
 CREATE TABLE artgallerydb.artwork (
  ArtworkNO INT NOT NULL,
  Style VARCHAR(45) NOT NULL,
  Name VARCHAR(45) NULL,
  Prices INT NULL,
  Year INT NULL,
  Title VARCHAR(45) NULL,
  ZIPcode VARCHAR(45) NULL,
  NameGallery VARCHAR(45) NULL,
  CustomerNum INT NULL ,
  ArtistID INT NULL,
  PRIMARY KEY (ArtworkNO,Style),
   CONSTRAINT artwork_Fk FOREIGN KEY (NameGallery,ZIPcode) REFERENCES exhibition(NameGallery,ZIPcode),
  CONSTRAINT ArtWork_fk2 FOREIGN KEY (CustomerNum) REFERENCES artgallerydb.customer (CustomerNum),
  CONSTRAINT ArtWork_fk3 FOREIGN KEY (ArtistID)REFERENCES artgallerydb.artist (ArtistID)ON DELETE NO ACTION);
  
  
  
  -- Insert in table 1
INSERT INTO artgallerydb .exhibition VALUES ('Creativity', 'EA2456', 'UK', 'London', '8:00 am', '12:00 pm');
INSERT INTO artgallerydb.exhibition   VALUES ('Arts', 'EA2496', 'SAU', 'Riyadh', '7:00 pm', '11:00 am');
INSERT INTO artgallerydb.exhibition  VALUES ('House Galllery', 'EA2489', 'KWT', 'Ahmadi', '3:00 pm', '7:00 pm');
INSERT INTO artgallerydb.exhibition VALUES ('Cnavas', 'EA2411', 'TUR', 'Bursa', '9:00 am', '1:00 pm');
INSERT INTO artgallerydb.exhibition  VALUES ('Design', 'EA2433', 'CAN', 'Toronto', '10:00 am', '2:00 pm');


-- Insert in table 2
 INSERT INTO artgallerydb.customer VALUES ('11207', 'Mohammed', ' Ahmadi', 'Aljabria', 'Salmiya', '55000');
INSERT INTO artgallerydb.customer VALUES ('11218', 'Burak', 'Izmir', 'Anatolia', 'Meck', 'TR-34');
INSERT INTO artgallerydb.customer VALUES ('11229', ' Sam', 'London', 'Chiswick', '36', 'WR10');
INSERT INTO artgallerydb.customer VALUES ('11230', 'Shaza', 'Makkah', 'Alqanfadah', 'Alzahir', '35412');
INSERT INTO artgallerydb.customer VALUES ('11246', 'Razan', 'Riyadh', 'Althumama', 'Alhaj', '35412');

-- Insert in table 3
 
  INSERT INTO artgallerydb.customerphonennmber VALUES ('11207', '05633245');
INSERT INTO artgallerydb.customerphonennmber VALUES ('11207', '05468949');
INSERT INTO artgallerydb.customerphonennmber VALUES ('11246', '05432678');
INSERT INTO artgallerydb.customerphonennmber VALUES ('11218', '05436578');
INSERT INTO artgallerydb.customerphonennmber VALUES ('11218', '05327849');
INSERT INTO artgallerydb.customerphonennmber VALUES ('11229', '05648794');

  -- Insert in table 4
  INSERT INTO artgallerydb.artist VALUES ('1101', 'Monet', '05634258', '2/11/1978', '3446');
INSERT INTO artgallerydb.artist VALUES ('1102', 'Leonardo', '05263748', '5/7/1990', 'GH');
INSERT INTO artgallerydb.artist VALUES ('1103', ' Sara', '05738463', '6/4/1988', 'Alhaj');
INSERT INTO artgallerydb.artist  VALUES ('1104', 'Ahmad', '05368846', '8/3/1985', 'Alsafa');
INSERT INTO artgallerydb.artist VALUES ('1105', 'Pablo', '05637548', '13/1/1992', 'OTI');

  -- Insert in table 5
INSERT INTO artgallerydb.department VALUES ('2011', ' Design', 'Riyadh', 'EA2496', 'Arts');
INSERT INTO artgallerydb.department  VALUES ('2022', '  Painter', 'Bursa', 'EA2411', 'Cnavas');
INSERT INTO artgallerydb.department VALUES ('2033', ' Digital drawing', 'Ahmadi', 'EA2489', 'House Galllery');
INSERT INTO artgallerydb.department VALUES ('2044', ' Modle Maker', 'Toronta', 'EA2433', 'Design');
INSERT INTO artgallerydb.department VALUES ('2055', 'Draw ', 'Riyadh', 'Ea2496', 'Arts');

  -- Insert in table 6
INSERT INTO artgallerydb.employee VALUES ('2156', 'Shaza', '056745795', 'Paintr', 'Alfahaa', '2/6/1988', '2011');
INSERT INTO artgallerydb.employee VALUES ('2134', 'Razan', '056389579', 'Paintr', 'Alzaher', '2/5/1998', '2011');
INSERT INTO artgallerydb.employee  VALUES ('2167', 'Renad', '056389678', 'Design', 'Alhaj', '8/12/1980', '2033');
INSERT INTO artgallerydb.employee VALUES ('2189', 'Alaa', '056334569', 'Design', '23H', '5/1997', '2044');
INSERT INTO artgallerydb.employee VALUES ('2170', 'Afrah', '056788834', 'Paintr', 'RUT', '3/9/1992', '2055');

 -- Insert in table 7
INSERT INTO artgallerydb.artwork VALUES ('3002', 'Painting', 'ML', '100000', ' 2001', 'Mona Lisa', 'EA2496', 'Arts', '11207', '1101');
INSERT INTO artgallerydb.artwork VALUES ('3003', 'Painting', 'P', '20000', ' 2015', 'Poppies', 'EA2411', 'Cnavas', '11218', '1102');
INSERT INTO artgallerydb.artwork VALUES ('3004', 'Painting', 'G', '90000', '2013', 'Guernica', 'EA2489', 'House Galllery', '11229', '1104');
INSERT INTO artgallerydb.artwork VALUES ('3005', 'Painting', 'TNW', '2000', '2007', 'The Night Watch', 'Ea2496', 'Arts', '11230', '1103');
INSERT INTO artgallerydb.artwork VALUES ('3006', ' Sculpture', 'TS', '5000', '2009', 'Two Sisters', 'EA2433', 'Design', '11246', '1105');



UPDATE artwork 
SET  Prices= Prices*2 
WHERE Prices >=20000;




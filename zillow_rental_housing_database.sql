/* Define data model for entities and identify cardinality */
/* Entities: Complex, Apartment Units, Student, Appointment Relationships:
Complex -> Unit (1:M)
Student -> Unit (M:M) results in associative entity
Design with minimum attributes for each entity */

/* create table DDL statements for all entities in 3rd normal form */
CREATE TABLE IF NOT EXISTS `mydb`.`APARTMENTS` (
`APARTMENTID` INT NOT NULL AUTO_INCREMENT COMMENT 'Rent', `BEDROOMS` INT NOT NULL,
`BATHROOMS` INT NOT NULL,
`RENT` DECIMAL(6,2) NOT NULL COMMENT 'Rent is a decimal value.\n', `DATEPOSTED` DATE NULL DEFAULT NOW(),
`UNITNO` INT NULL,
`APARTMENTCOMPLEX_APARTMENTCOMPLEXID` INT NOT NULL, `SQFT` INT NULL,
`NOTES` VARCHAR(45) NULL DEFAULT 'BIG APARTMENT', `AVAILABLE` VARCHAR(6) NULL DEFAULT 'YES',
PRIMARY KEY (`APARTMENTID`, `APARTMENTCOMPLEX_APARTMENTCOMPLEXID`), INDEX `fk_APARTMENTS_APARTMENTCOMPLEX1_idx` (`APARTMENTCOMPLEX_APARTMENTCOMPLEXID` ASC),
CONSTRAINT `fk_APARTMENTS_APARTMENTCOMPLEX1`
FOREIGN KEY (`APARTMENTCOMPLEX_APARTMENTCOMPLEXID`) REFERENCES `mydb`.`APARTMENTCOMPLEX` (`APARTMENTCOMPLEXID`) ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

/* Loading small portion of Zillow.com data to test use cases. */

/* Sample SQL Queries */


/* 1. Get list of apartments available for rent with apartment community name, 
address, apartment unit, Sq. ft. of unit, rent $, number of bedrooms, number of bath, 
brief notes about the apartment unit. */

select u.unit_number, u.sq_ft, u.rent, u.num_rooms, u.num_baths, u.notes, c.address, c.name 
FROM unit u 
inner join complex c
ON u.complex_ID = c.complex_ID;

/* 2. Get list of apartment community name, apartment unit, rent $, number of bedrooms, 
number of bath with distance from campus, days since it is posted within last 10 days. */
SELECT u.distance, u.unit_number, u.rent, u.num_rooms, u.num_baths, u.sq_ft, u.days_posted, c.name 
FROM unit u, complex c
WHERE u.complex_ID = c.complex_ID
AND u.days_posted <= 10;

/* 3. Get number apartments available for rent in each apartment complex 
ordered by highest count to lowest available rent by complex 
(assuming multiple units are available in each complex) */
SELECT count(u.rental_ID) count, c.name 
FROM units u, complex c 
WHERE u.complex_ID = c.complex_ID
GROUP BY u.complex_ID
ORDER BY 1 DESC;

/* 4. Get number of apartments where rent is between 1000 and 1500 */
SELECT count(*)
FROM apt_listing a
WHERE rent between 1000 AND 1500;

/* 5. Get total number of appointments made by each student (with name) */
 SELECT count(a.Listing_id), s.student_name
 FROM appointment a, SCU_student s
 WHERE a.student_id=s.student_id
 GROUP BY a.student_id;

/* 6. Get list of apartment complexes which do not have any units for rent */
SELECT u.unit_num, u.rental_ID, c.name 
FROM units u 
RIGHT JOIN complex c 
ON u.complex_ID = c.complex_ID;

/* 7. Create view to retrieve appointment schedule for today sorted by time of the day. 
Use this view to retrieve data for one apartment complex, Student name, apartment complex, apartment unit, appointment time. */
 
CREATE VIEW today_appointment AS
SELECT s.student_name, a.apartment_name, a.apartment_unit, ap.appointment_time
FROM scu_student s
INNER JOIN apartment a
INNER JOIN apt_listing l
INNER JOIN appointment ap
ON s.student_id=ap.student_id
AND l.Listing_id=ap.Listing_id
AND a.Apartment_id=l.Apartment_id
AND ap.Appointment_Date= CURDATE()
ORDER BY ap.appointment_time;




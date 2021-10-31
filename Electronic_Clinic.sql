-- Project1 Applied Databases
-- Nikhitha Modugu
-- Student ID - 801201724
-- ***Creation of Database*** ---
-- Database for an Electronic Medical record System -- 

DROP DATABASE IF EXISTS Electronic_Clinic;
CREATE DATABASE Electronic_Clinic;

Use Electronic_Clinic;
SET SQL_SAFE_UPDATES = 0;
-- ***Creation of Tables*** -- 

 
 -- address list both doctors and patients -- 
DROP TABLE IF EXISTS address;
CREATE TABLE address
(
  address_id  INT  PRIMARY KEY,
  address VARCHAR(100) NOT NULL ,
  city VARCHAR(50)  NOT NULL,
  state  VARCHAR(20) NOT NULL,
  zip VARCHAR(20) NOT NULL
);

INSERT INTO address VALUES
(10001, '9551 Apt H University Terrace Drive', 'Charlotte', 'NC', 28262),
(10002,'9551 Apt A University Terrace Drive', 'Charlotte', 'NC', 28262),
(10003,'9551 Apt B University Terrace Drive', 'Charlotte', 'NC', 28262),
(10004,'9535 Apt A University Terrace Drive', 'Charlotte', 'NC', 28262),
(10005,'9535 Apt B University Terrace Drive','Charlotte','NC',28262),
(10006,'9535 Apt C University Terrace Drive','Charlotte','NC',28262),
(10007,'9535 Apt H University Terrace Drive','Charlotte','NC',28262),
(10008,'9535 Apt K University Terrace Drive', 'Charlotte', 'NC', 28262),
(10009,'9519 Apt A University Terrace Drive', 'Charlotte', 'NC', 28262),
(10010, '9519 Apt B University Terrace Drive', 'Charlotte', 'NC', 28262),
(10011,'9519 Apt C University Terrace Drive', 'Charlotte', 'NC', 28262),
(10012,'9519 Apt D University Terrace Drive', 'Charlotte', 'NC', 28262),
(10013,'9519 Apt E University Terrace Drive', 'Charlotte', 'NC', 28262),
(10014,'9519 Apt F University Terrace Drive', 'Charlotte', 'NC', 28262),
(10015,'9519 Apt G University Terrace Drive', 'Charlotte', 'NC', 28262),
(10016,'9519 Apt H University Terrace Drive', 'Charlotte', 'NC', 28262),
(10017,'9519 Apt I University Terrace Drive', 'Charlotte', 'NC', 28262),
(10018,'1000 Apt A University Terrace North','Charlotte', 'NC', 28262),
(10019,'1001 Apt A University Terrace North','Charlotte', 'NC', 28262),
(10020,'1002 Apt A University Terrace North','Charlotte', 'NC', 28262),
(10021,'1003 Apt A University Terrace North','Charlotte', 'NC', 28262),
(10022,'1004 Apt A University Terrace North','Charlotte', 'NC', 28262),
(10023,'1005 Apt A University Terrace North','Charlotte', 'NC', 28262),
(10024,'1006 Apt A University Terrace North','Charlotte', 'NC', 28262),
(10025,'1007 Apt A University Terrace North','Charlotte', 'NC', 28262),
(10026,'1008 Apt A University Terrace North','Charlotte', 'NC', 28262),
(10027,'1009 Apt A University Terrace North','Charlotte', 'NC', 28262),
(10028,'1009 Apt B University Terrace North','Charlotte', 'NC', 28262);

-- insurance providers list -- 
DROP TABLE IF EXISTS insurance_providers;
CREATE TABLE insurance_providers
( ins_comp_id INT PRIMARY KEY,
  ins_name VARCHAR(50) NOT NULL,
  contact VARCHAR(50) NOT NULL
);

INSERT INTO insurance_providers VALUES 
 (101,'United Health',9106276699),
 (102,'Kaiser Foundation',9106276690),
 (103,'Anthem Inc',9106276691),
 (104,'Centene Corporation', 9106276694),
 (105,'Humana',9106276697),
 (106,'CVS', 9106276680),
 (107,'Health Care Service Corporation', 9106276687),
 (108,'CIGNA', 9106276687),
 (109,'Independence Health Group',9106276656),
 (110,'Guidewell Mutual Holding',8553224045),
 (111,'Blue Cross Blue Shield of Michigan',8553224043),
 (112,'Blue Cross of California',8553224028),
 (113,'Caresource',8553424068),
 (114,'UPMC Health System',8553224076),
 (115,'Carefirst Inc.',9016276691),
 (116,'Blue Cross Blue Shield of North Carolina',9016276698);


DROP TABLE IF EXISTS patient;
CREATE TABLE patient
(
  patient_id  INT  PRIMARY KEY,
  first_Name VARCHAR(60) NOT NULL,
  last_Name VARCHAR(55) NOT NULL,
  gender VARCHAR(15) NOT NULL,
  age INT NOT NULL,
  SSN VARCHAR(15),
  address_id  INT NOT NULL, 
  contact VARCHAR(55) NOT NULL,
  date_of_joining DATE NOT NULL,
  CONSTRAINT patient_fk_address
    FOREIGN KEY (address_id)
    REFERENCES address (address_id)
);

INSERT INTO patient VALUES
(501,'Nikhitha','Modugu','F', 23, 12345678,10008, 9106276598, '2021-06-24'),
(502,'Kusuma','Goli','F', 23, 12456789, 10015, 9016576987, '2021-01-18'),
(503,'Nithin','Rupireddy', 'M', 24, 15678927, 10016, 9107556484, '2021-09-09'),
(504,'Vamsi','Yerasu', 'M', 24, 250976793,10017, 9164964672, '2021-08-15'),
(505,'Hitesh','Pereddy','Trans', 29, 519324698, 10018, 19000425155 , '2019-11-29'),
(506,'Lalith','Pannala','M',28,541208277,10019,19099856317,'2019-04-26'),
(507,'Suchitha','Challa','F',16,400525077,10020,19898810298,'2021-03-17'),
(508,'Akhil','Reddy','M',27,252060828,10021,19965219620,'2017-06-01'),
(509,'Keerthana','Kennedy','F',26,751016197, 10022, 19646659815,'2021-05-20'),
(510,'Usha Chandana','Bhupathi','F',29,417143153,10023,19156619725,'2018-09-20'),
(511,'Vandana','Buduri','F',22,445349588,10024,19670545953,'2021-07-09');


-- patient insurance details -- 
DROP TABLE IF EXISTS patient_insurances;
CREATE TABLE patient_insurances
(
 pat_insurance_id INT UNIQUE,
 patient_id INT UNIQUE,
 ins_comp_id INT NOT NULL,
 CONSTRAINT patient_insurances_fk_insurance_providers
    FOREIGN KEY (ins_comp_id)
  REFERENCES insurance_providers (ins_comp_id),
  CONSTRAINT patient_insurances_fk_patient
    FOREIGN KEY (patient_id)
  REFERENCES patient (patient_id)
 );

 INSERT INTO patient_insurances VALUES 
 (123456789, 501, 101),
 (987654321, 502, 103),
 (234567890, 503, 108),
 (345678901, 504, 109),
 (456789012, 505, 105),
 (567890123, 506, 106),
 (678901234, 507, 102),
 (789012345, 508, 104),
 (890123456, 509, 105),
 (901234567, 510, 102),
 (728390472, 511, 109);
 
 
-- doctor specializations  -- 
DROP TABLE IF EXISTS specialization;
CREATE TABLE specialization
(
  specialization_id INT PRIMARY KEY,
  specialization_name VARCHAR(50) NOT NULL
);
 
INSERT INTO specialization VALUES
(700, 'Dentist'),
(701,'Neurology'),
(702,'Dermatology'),
(703,'Surgery'),
(704,'Immunology'),
(705,'Medical Genetics'),
(706,'Opthamology');

 -- Doctors list -- 
DROP TABLE IF EXISTS doctors;
CREATE TABLE doctors
(
  doctor_id  INT  PRIMARY KEY,
  firstName VARCHAR(50)  NOT NULL,
  lastName VARCHAR(50)  NOT NULL,
  specialization_id INT NOT NULL,
  address_id  INT NOT NULL,
  contact VARCHAR(50) NOT NULL,
  CONSTRAINT doctors_fk_address
    FOREIGN KEY (address_id)
    REFERENCES address (address_id),
  CONSTRAINT doctors_fk_specialization
    FOREIGN KEY (specialization_id)
    REFERENCES specialization (specialization_id)
);

INSERT INTO doctors VALUES
(51684820, 'Mayukha', 'Sri', 700, 10003, 19012302071),
(51684821,'Pranavi','Reddy', 702, 10004, 19539610330),
(51684822,'Sindhu', 'Shetty', 703, 10001, 19391145220),
(51684823,'Akash','Shaik',700,10005 ,19194249137),
(51684824,'Rohit','Bulreddy',706,10002 ,19477590247),
(51684825,'Tara','Baks',704,10006 ,19726310604),
(51684826,'Padma','Modugu',705,10007,9562067544),
(51684827,'Akhil','Modugu',705,10008 ,19562067544),
(51684828,'Alwal','Reddy',704,10009,19164120567),
(51684829,'Bindhu','Raj',700,10010,19020125702),
(51684830,'Keerthi','Sanke',703,10011,19979500393),
(51684831,'Seema','Rameez',702,10012 ,19145614606),
(51684832,'Deepthi','D',706,10013 ,19741667435);

-- Appointment list --
DROP TABLE IF EXISTS appointments; 
CREATE TABLE appointments
(
  appointment_id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  Visit DATETIME NOT NULL, 
  Issue VARCHAR(50) NOT NULL,
  CONSTRAINT appointments_fk_patient
    FOREIGN KEY (patient_id)
    REFERENCES patient (patient_id),
  CONSTRAINT appointments_fk_doctors
    FOREIGN KEY (doctor_id)
    REFERENCES doctors (doctor_id)
);

INSERT INTO appointments VALUES
(1,501, 51684820, '2020-01-19 10:15:00', 'General Checkup'),
(2,502, 51684822, '2020-02-9 9:14:00', 'X-Ray'), 
(3,503, 51684821, '2020-02-9 8:15:00', 'MRI Scanning'),
(4,504, 51684820, '2020-03-10 08:30:00', 'Teeth Cleaning'),
(5,505, 51684823, '2021-01-9 08:14:00', 'Root Canal'),
(6,506, 51684824, '2021-01-10 09:14:00', 'Fracture checkup'),
(7,507, 51684825, '2021-01-11 10:14:00', 'Dengue checkup'),
(8,501, 51684821, '2021-01-12 08:30:00', 'Vaccine appointment'),
(9,506, 51684824, '2021-01-17 09:14:00','Re-visit with same doctor'),
(10,508, 51684825, '2021-02-19 09:14:00', 'Hearing aid'),
(11,509, 51684820, '2021-02-19 09:14:00', 'Eye checkup'),
(12,510, 51684831, '2021-02-20 09:14:00', 'Laser treatment'),
(13,508, 51684831, '2021-02-20 11:14:00', 'Fever');
-- pharmacy list (list of medicines) -- 
DROP TABLE IF EXISTS medications;
CREATE TABLE medications
(
  medicine_id  INT  PRIMARY KEY,
  medicine_name VARCHAR(50) NOT NULL ,
  medicine_for VARCHAR(100) NOT NULL,
  med_cost INT NOT NULL
);

INSERT INTO medications VALUES
(100, 'Tylenol', 'Pain Reliever', 2),
(101, 'Ibuprofen', 'Fever', 2),
(102, 'Sudafed', 'Cold', 3),
(103, 'Pamprin', 'Tooth ache', 10),
(104, 'Chlorhexidine', 'After undergoing Root Canal', 10),
(105, ' moxifloxacin', 'Eye drops', 15),
(106, 'azithromycin', 'Irritation in eyes', 10),
(107, 'acetaminophen', 'Eye ache', 40),
(108, 'Hurricaine', 'anesthetic', 70);


-- appointment medications suggested--  
DROP TABLE IF EXISTS appnt_medication;
CREATE TABLE appnt_medication
(
  appointment_id INT NOT NULL,
  medicine_id INT NOT NULL,
  quantity INT NOT NULL,
  PRIMARY KEY(appointment_id,medicine_id),
  CONSTRAINT appnt_medication_fk_appointments
    FOREIGN KEY (appointment_id)
    REFERENCES appointments (appointment_id),
  CONSTRAINT appnt_medication_fk_medications
    FOREIGN KEY (medicine_id)
    REFERENCES medications (medicine_id)
);



-- Treatment procedures details  -- 
 CREATE TABLE procedures
 ( 
  procedure_id INT PRIMARY KEY,
  procedure_name VARCHAR(400) NOT NULL,
  procedure_cost INT NOT NULL
  );
  
INSERT INTO procedures VALUES
(0120 ,'Eye checkup',21.00),
(0150, 'General checkup',33.00),
(0180, 'MRI Scanning',33.00),
(1110, 'X-ray - adult', 45.00),
(1120, 'X-ray - child', 32.00),
(1201, 'Root canal', 49.00),
(1203, 'Vaccination - child', 17.00),
(1510, 'Skin checkup', 159.00),
(1515, 'Tooth cleanup', 260.00),
(1520, 'Eye treatment ', 249.00),
(1525, 'Cancer treatment', 303.00),
(1550, 'Cosmetic surgery', 33.00),
(8210, 'Removable appliance therapy', 239.00),
(8220, 'Fixed appliance therapy', 239.00),
(1351, 'Hearing aid treatment', 25.00),
(0220, 'Flu shot', 12.00),
(0230, 'Malaria treatment', 10.00),
(0210, 'Dengue treatment',68.00),
(0330, 'Chicken pox treatment', 55.00),
(0240, 'Small pox treatment', 17.00),
(0250, 'Facial spots treatment', 22.00),
(0260, 'Dental checkup', 17.00),
(0270, 'Severe accident checkup', 11100.00),
(0272, 'Frature treatment', 19.00),
(0274, 'Appendix treatment', 30.00),
(0277, 'Whole body checkup', 45.00),
(0283, 'Tooth cavity treatment', 500.00);

-- patient procedure details -- 
DROP TABLE IF EXISTS appnt_procedure;
CREATE TABLE appnt_procedure
(
 appointment_id INT NOT NULL,
 procedure_id INT NOT NULL,
 CONSTRAINT appnt_procedure_fk_appointments
    FOREIGN KEY (appointment_id)
    REFERENCES appointments (appointment_id),
CONSTRAINT appnt_procedure_fk_procedures
    FOREIGN KEY (procedure_id)
    REFERENCES procedures (procedure_id)
 );

 -- billing table gives the total billing cost (medicine + procedure)-- 
 CREATE TABLE billing
(
 billing_id INT PRIMARY KEY auto_increment,
 appointment_id INT NOT NULL,
 total_medicine_cost DECIMAL(9,2) DEFAULT 0,
 total_procedure_cost DECIMAL(9,2) DEFAULT 0,
 total_billing_cost DECIMAL(9,2) DEFAULT 0,
 CONSTRAINT billing_fk_appointments
   FOREIGN KEY(appointment_id)
   REFERENCES appointments (appointment_id)
);
 
 -- Trigger for total medication cost --
 DROP TRIGGER IF EXISTS tot_med_cost_trigger;
DELIMITER //

CREATE TRIGGER tot_med_cost_trigger
  AFTER INSERT ON appnt_medication FOR EACH ROW
BEGIN
DECLARE Total_med_cost DECIMAL(9,2);
Declare total_proc_cost decimal(9,2);

SELECT SUM(cost) INTO Total_med_cost FROM 
(select (m.med_cost*apm.quantity) as cost
from  medications m JOIN appnt_medication apm
ON m.medicine_id = apm.medicine_id 
where apm.appointment_id = NEW.Appointment_id) as t;

SELECT TOTAL_PROCEDURE_COST INTO total_proc_cost from billing where appointment_id = new.appointment_id;

IF NEW.appointment_id NOT IN
(select appointment_id From billing where appointment_id = NEW.appointment_id) 
THEN
INSERT INTO billing(appointment_id, total_medicine_cost) values(NEW.appointment_id, Total_med_cost);
ELSE
UPDATE billing SET total_medicine_cost = total_med_cost WHERE appointment_id = NEW.appointment_id;
END IF;

UPDATE billing set total_billing_cost = total_med_cost + total_proc_cost where appointment_id = new.appointment_id;

END//
DELIMITER ;

-- Trigger for total procedure cost --

 DROP TRIGGER IF EXISTS tot_proc_cost_trigger;
DELIMITER //

CREATE TRIGGER tot_proc_cost_trigger
  AFTER INSERT ON appnt_procedure FOR EACH ROW
  
BEGIN
DECLARE Total_proc_cost DECIMAL(9,2);
Declare total_med_cost decimal(9,2);

SELECT SUM(cost) INTO Total_proc_cost FROM 
(select (procedure_cost) as cost
from  procedures pr JOIN appnt_procedure app
ON pr.procedure_id = app.procedure_id 
where app.appointment_id = NEW.Appointment_id) as t;

SELECT total_medicine_cost INTO total_med_cost from billing where appointment_id = new.appointment_id;

IF NEW.appointment_id NOT IN
(select appointment_id From billing where appointment_id = NEW.appointment_id) 
THEN
INSERT INTO billing(appointment_id, total_procedure_cost) values(NEW.appointment_id, Total_proc_cost);
ELSE
UPDATE billing SET total_procedure_cost = total_proc_cost WHERE appointment_id = NEW.appointment_id;
END IF;

UPDATE billing set total_billing_cost = total_med_cost + total_proc_cost where appointment_id = new.appointment_id;
END//
DELIMITER ;


-- insert values to appnt_medication table -- 
INSERT INTO appnt_medication VALUES
(1, 101, 1),
(2, 107, 1),
(3, 107, 1),
(4, 103, 1),
(5, 101, 1),
(6, 102, 1),
(7, 104, 1),
(7, 107, 2),
(8, 107, 1),
(9, 101, 2),
(10, 104, 1),
(10, 107, 1);

-- insert values to appnt_procedure table --
 INSERT INTO appnt_procedure VALUES
 (1,0120),
 (2,0274),
 (3,1120),
 (4,0277),
 (5,1201),
 (6,0150),
 (7,0283),
 (7,0277),
 (8,1351),
 (9,0274),
 (10,0283);
 






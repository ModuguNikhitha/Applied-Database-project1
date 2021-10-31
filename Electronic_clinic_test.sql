-- Nikhitha Modugu
-- Project 1 
-- To test if the created database works
-- List of patients less than or equal to 18 years --
-- This gives results of the patients whose age is less than or equal to 18
select first_Name, last_Name, age, contact
from patient
where age <= 18;

-- List of new patients who joined dental_clinic in 2021.
-- This query gives the results of the patients whose date of joining is greater than or equal to 2021-01-01
select CONCAT(first_Name,',', last_Name) AS New_Patient_Names
from patient 
where date_of_joining >= '2021-01-01';

-- A new branch is opening is NC so clinic wants to message about the new branch to their patients in NC --

select first_Name, last_Name, contact
from patient p JOIN address a
ON p.address_id = a.address_id
where city = "NC";

-- update contact of insurance_company-- 

UPDATE insurance_providers
SET contact = 18886302581
WHERE ins_comp_id = 101;


-- update issue in appointments table -- 
UPDATE appointments 
SET Issue = 'Gum Swell'
WHERE appointment_id = 13;


-- Delete patient record -- 

DELETE FROM patient
where patient_id = 512;

-- Delete doctor record -- 

DELETE FROM doctors
where doctor_id = 51684832;

-- List of patients who visited in short period of time --

select ap1.patient_id, CONCAT(p.first_Name,',',p.last_Name) As patient_name, ap1.appointment_id, ap1.doctor_id, ap1.Issue,
	datediff(date_format(ap1.visit,'%Y-%m-%e'),date_format(ap2.visit,'%Y-%m-%e')) as DATE_DIFF
	from appointments ap1, appointments ap2
	LEFT JOIN patient p ON ap2.patient_id = p.patient_id
	Where ap1.appointment_id <> ap2.appointment_id and ap1.patient_id = ap2.patient_id
	and datediff(date_format(ap1.visit,'%Y-%m-%e'),date_format(ap2.visit,'%Y-%m-%e'))BETWEEN 0 AND 10;
    
-- details of patient on specific appointment date -- 

select p.patient_id, CONCAT(p.first_Name,',',p.last_Name) As patient_name, ap.appointment_id, ap.doctor_id
from patient p RIGHT JOIN appointments ap
ON p.patient_id = ap.patient_id
where date_format(ap.visit,'%Y-%m-%e') = '2021-02-19';

-- patient details who got issue as "Routine Dental Exam" -- 

select CONCAT(first_Name,',',last_Name) As patient_name, gender, Visit
from appointments ap JOIN patient p
ON ap.patient_id = p.patient_id
where Issue = 'Root Canal';

-- patients details who gone through 'Root Canal' procedure --

select CONCAT(first_Name,',',last_Name) As patient_name, gender, Visit, procedure_cost
from appointments ap JOIN appnt_procedure app
ON ap.appointment_id = app.appointment_id
JOIN procedures pr ON pr.procedure_id = app.procedure_id
JOIN patient p ON p.patient_id = ap.patient_id
where procedure_name = 'Root Canal';

-- Total appointment cost for the appointment_id 3 with patient details --

select CONCAT(first_Name,',',last_Name) As patient_name, gender, Visit, total_billing_cost
from patient p JOIN appointments ap
ON p.patient_id = ap.patient_id
JOIN billing b ON b.appointment_id = ap.appointment_id
where ap.appointment_id = 3;

-- List of appointments under certain "General specialization" specialization doctors --

select ap.appointment_id, s.specialization_name, d.doctor_id, d.firstName, ap.Visit
from  appointments ap JOIN doctors d
ON d.doctor_id = ap.doctor_id
JOIN specialization s ON s.specialization_id = d.specialization_id
where d.specialization_id = 700;

-- Total billing amount gained by dental_clinic on specific date "2021-01-11" -- 

select b.billing_id, ap.appointment_id, b.total_billing_cost, ap.Visit
from billing b JOIN appointments ap
ON b.appointment_id = ap.appointment_id
where date_format(ap.visit,'%Y-%m-%e')  = '2021-01-11';

-- patients attended under a doctor 51684820 -- 

select p.patient_id,CONCAT(p.first_Name,',',p.last_Name) as patient_name, ap.appointment_id, ap.Visit, ap.Issue
from patient p JOIN appointments ap
ON p.patient_id = ap.patient_id
where doctor_id = 51684820;

-- Listing all patients who are having insurance company provider as "Molina Healthcare" -- 

select p.patient_id, CONCAT(p.first_Name,',',p.last_Name) as patient_name, pi.ins_comp_id 
from insurance_providers ic JOIN patient_insurances pi
ON ic.ins_comp_id = pi.ins_comp_id
JOIN patient p ON p.patient_id = pi.patient_id
where ins_name = "United Health";

-- List of details of the patient history by patient_id "

select p.patient_id, CONCAT(p.first_Name,',',p.last_Name) as patient_name, pi.pat_insurance_id, 
ap.appointment_id, CONCAT(d.firstName,',',d.lastName) as doctor_name , ap.Visit, bi.total_medicine_cost,bi.total_procedure_cost, 
bi.total_billing_cost
from patient p JOIN patient_insurances pi
ON p.patient_id = pi.patient_id
JOIN appointments ap ON p.patient_id = ap.patient_id
JOIN doctors d ON d.doctor_id = ap.doctor_id
JOIN billing bi ON ap.appointment_id = bi.billing_id
where p.patient_id = 501;

-- Listing all patients with insurance information and billing amount orderby appointment visits -- 

select p.patient_id, CONCAT(p.first_Name,',',p.last_Name) as patient_name,pi.pat_insurance_id,pi.ins_comp_id,ic.ins_name, bi.total_medicine_cost, bi.total_procedure_cost, bi.total_billing_cost, ap.Visit
from insurance_providers ic JOIN patient_insurances pi
ON ic.ins_comp_id = pi.ins_comp_id
JOIN patient p ON p.patient_id = pi.patient_id
JOIN appointments ap ON p.patient_id = ap.patient_id
JOIN billing bi ON ap.appointment_id = bi.appointment_id
ORDER BY ap.Visit;

-- List of all the billing amount 'having' greater than $50 Groupby billing_id -- 

select billing_id, total_billing_cost
FROM billing
GROUP BY billing_id
HAVING total_billing_cost > 70;

-- Whole list of patients with consulting doctor, appointments, insurance_id, billing amount --

select p.patient_id, CONCAT(p.first_Name,',',p.last_Name) as patient_name, pi.pat_insurance_id, 
ap.appointment_id, CONCAT(d.firstName,',',d.lastName) as doctor_name ,ap.Visit, bi.total_medicine_cost,bi.total_procedure_cost, 
bi.total_billing_cost
from patient p JOIN patient_insurances pi
ON p.patient_id = pi.patient_id 
JOIN appointments ap ON p.patient_id = ap.patient_id
JOIN doctors d ON d.doctor_id = ap.doctor_id
JOIN billing bi ON ap.appointment_id = bi.billing_id
ORDER BY p.patient_id;

DESC patient;
DESC doctors;
DESC insurance_providers;
DESC medications;
DESC patient_insurances;
DESC procedures;
DESC address;
DESC appnt_medication;
DESC appnt_procedure;
DESC appointments;
DESC billing;





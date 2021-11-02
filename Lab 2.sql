CREATE TABLE MsCustomer (
	customer_id CHAR(5) NOT NULL PRIMARY KEY CHECK (customer_id LIKE 'CU[0-9][0-9][0-9]'),
	customer_name VARCHAR(50) NOT NULL,
	customer_gender VARCHAR(10) NOT NULL,
	customer_phone VARCHAR(13) NOT NULL,
	customer_address VARCHAR(100) NOT NULL
);

CREATE TABLE MsStaff (
	staff_id CHAR(5) NOT NULL PRIMARY KEY CHECK (staff_id LIKE 'SF[0-9][0-9][0-9]'),
	staff_name VARCHAR(50) NOT NULL,
	staff_gender VARCHAR(10) NOT NULL,
	staff_phone VARCHAR(13) NOT NULL,
	staff_adress VARCHAR(100) NOT NULL,
	staff_salary NUMERIC(11,2) NOT NULL,
	staff_position VARCHAR(20) NOT NULL
);

CREATE TABLE MsTreatmentType (
	treatment_type_id CHAR(5) NOT NULL PRIMARY KEY CHECK (treatment_type_id LIKE 'TT[0-9][0-9][0-9]'),
	treatment_type_name VARCHAR(50) NOT NULL
);


CREATE TABLE MsTreatment (
	treatment_id CHAR(5) NOT NULL PRIMARY KEY CHECK (treatment_id LIKE 'TM[0-9][0-9][0-9]'),
	treatment_type_id CHAR(5) NOT NULL,
	FOREIGN KEY (treatment_type_id) REFERENCES MsTreatmentType (treatment_type_id) ON UPDATE CASCADE ON DELETE CASCADE,
	treatment_name VARCHAR(50) NOT NULL,
	price NUMERIC(11,2) NOT NULL
);

CREATE TABLE HeaderSalonServices (
	transaction_id CHAR(5) NOT NULL PRIMARY KEY CHECK (transaction_id LIKE 'TR[0-9][0-9][0-9]'),
	customer_id CHAR(5) NOT NULL,
	staff_id CHAR(5) NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES MsCustomer (customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (staff_id) REFERENCES MsStaff (staff_id) ON UPDATE CASCADE ON DELETE CASCADE,
	transaction_date DATE NOT NULL,
	payment_type VARCHAR(20) NOT NULL,
);

CREATE TABLE DetailSalonServices (
	transaction_id CHAR(5) NOT NULL,
	treatment_id CHAR(5) NOT NULL,
	CONSTRAINT pk_ds PRIMARY KEY (transaction_id, treatment_id),
	CONSTRAINT fk_ds FOREIGN KEY (transaction_id) REFERENCES HeaderSalonServices (transaction_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT fk_ds1 FOREIGN KEY (treatment_id) REFERENCES MsTreatment (treatment_id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE DetailSalonServices;

CREATE TABLE DetailSalonServices(
transaction_id CHAR(5) NOT NULL,
treatment_id CHAR(5) NOT NULL);

ALTER TABLE DetailSalonServices
    ADD FOREIGN KEY (transaction_id) REFERENCES HeaderSalonServices (transaction_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE DetailSalonServices
    ADD FOREIGN KEY (treatment_id) REFERENCES MsTreatment (treatment_id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE MsStaff 
	ADD CONSTRAINT c_s CHECK (DATALENGTH (staff_name)>5 AND DATALENGTH (staff_name)<20);

ALTER TABLE MsStaff
	DROP CONSTRAINT c_s;

ALTER TABLE MsTreatment
	ADD desc_treatment VARCHAR(100) NULL;

ALTER TABLE MsTreatment
	DROP COLUMN desc_treatment;
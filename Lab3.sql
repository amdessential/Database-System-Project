/*1. a. Insert Table MsStaff*/
INSERT INTO MsStaff (staff_id,staff_name,staff_gender,staff_phone,staff_adress,staff_salary,staff_position)
VALUES ('SF006','Jeklin Harefa','Female','085265433322','Kebon Jeruk Street no 140','3000000','Stylist')

INSERT INTO MsStaff (staff_id,staff_name,staff_gender,staff_phone,staff_adress,staff_salary,staff_position)
VALUES ('SF007','Lavinia','Female','085755500011','Kebon Jeruk Street no 153','3000000','Stylist')

INSERT INTO MsStaff (staff_id,staff_name,staff_gender,staff_phone,staff_adress,staff_salary,staff_position)
VALUES ('SF008','Stephen Adrianto','Male','085564223311','Mandala Street no 14','3000000','Stylist')

INSERT INTO MsStaff (staff_id,staff_name,staff_gender,staff_phone,staff_adress,staff_salary,staff_position)
VALUES ('SF009','Rico Wijaya','Male','085710252525','Keluarga Street no 78','3000000','Stylist')

/*d. Insert MsStaff Full*/
INSERT INTO MsStaff (staff_id,staff_name,staff_gender,staff_phone,staff_adress,staff_salary,staff_position)
VALUES ('SF001','Dian Felita Tanoto','Female','085265442222','Palmerah Street no 56','15000000','Top Stylist')

INSERT INTO MsStaff (staff_id,staff_name,staff_gender,staff_phone,staff_adress,staff_salary,staff_position)
VALUES ('SF002','Melisa Pratiwi','Female','085755552011','Kebon Jeruk Street no 151','10000000','Top Stylist')

INSERT INTO MsStaff (staff_id,staff_name,staff_gender,staff_phone,staff_adress,staff_salary,staff_position)
VALUES ('SF003','Livia Ashianti','Female','085218542222','Kebon Jeruk Street no 9','7000000','Stylist')

INSERT INTO MsStaff (staff_id,staff_name,staff_gender,staff_phone,staff_adress,staff_salary,staff_position)
VALUES ('SF004','Indra Saswita','Male','085564223311','Sunter Street no 91','7000000','Stylist')

INSERT INTO MsStaff (staff_id,staff_name,staff_gender,staff_phone,staff_adress,staff_salary,staff_position)
VALUES ('SF005','Ryan Nixon Salim','Male','08571055522','Kebon Jeruk Street no 123','3000000','Stylist')

INSERT INTO MsStaff (staff_id,staff_name,staff_gender,staff_phone,staff_adress,staff_salary,staff_position)
VALUES ('SF010','Effendy Lesmana','Male','085218587878','Tangerang City Street no 88','3000000','Stylist')

/*b. Insert MsCustomer*/
INSERT INTO MsCustomer (customer_id,customer_name,customer_gender,customer_phone,customer_address)
VALUES ('CU001','Franky','Male','08566543338','Daan mogot baru Street no 6')

INSERT INTO MsCustomer (customer_id,customer_name,customer_gender,customer_phone,customer_address)
VALUES ('CU002','Emala Dewi','Female','085264782135','Tanjung Duren Street no 185')

INSERT INTO MsCustomer (customer_id,customer_name,customer_gender,customer_phone,customer_address)
VALUES ('CU003','Elysia Chen','Female','085754206611','Kebon Jeruk Street no 120')

INSERT INTO MsCustomer (customer_id,customer_name,customer_gender,customer_phone,customer_address)
VALUES ('CU004','Brando Kartawijaya','Male','081170225561','Greencil Street no 88')

INSERT INTO MsCustomer (customer_id,customer_name,customer_gender,customer_phone,customer_address)
VALUES ('CU005','Andy Putra','Male','087751321421','Sunter Street no 42')

-->MsTreatmentType
INSERT INTO MsTreatmentType (treatment_type_id,treatment_type_name)
VALUES ('TT001','Hair Treatment')

INSERT INTO MsTreatmentType (treatment_type_id,treatment_type_name)
VALUES ('TT002','Hair Spa Treatment')

INSERT INTO MsTreatmentType (treatment_type_id,treatment_type_name)
VALUES ('TT003','Make Up and Facial')

INSERT INTO MsTreatmentType (treatment_type_id,treatment_type_name)
VALUES ('TT004','Menicure Pedicure')

INSERT INTO MsTreatmentType (treatment_type_id,treatment_type_name)
VALUES ('TT005','Premium Treatment')

/*f. Insert MsTreatment*/
INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM001','TT001','Cutting by Stylist','150000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM002','TT001','Cutting by Top Stylist','450000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM003','TT001','Cutting Pony','50000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM004','TT001','Blow','90000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM005','TT001','Coloring','480000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM006','TT001','Highlight','320000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM007','TT001','Japanese Perm','700000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM008','TT001','Digital Perm','1100000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM009','TT001','Special Perm','1100000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM010','TT001','Rebonding Treatment','1100000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM011','TT002','Creambath','150000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM012','TT002','Hair Spa','250000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM013','TT002','Hair Mask','250000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM014','TT002','Hair Spa Reflexy','200000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM015','TT002','Reflexy','250000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM016','TT002','Back Therapy Massage','300000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM017','TT003','Make Up','500000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM018','TT003','Make Up Wedding','5000000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM019','TT003','Facial','300000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM020','TT004','Manicure','80000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM021','TT004','Pedicure','100000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM022','TT004','Nail Extension','250000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM023','TT004','Nail Acrylic Infill','340000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM024','TT005','Japanese Treatment','350000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM025','TT005','Scalp Treatment','250000')

INSERT INTO MsTreatment (treatment_id,treatment_type_id,treatment_name,price)
VALUES ('TM026','TT005','Crystal Treatment','400000')

/*c. Insert Header Salon Services*/
INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR010','CU001','SF004','2012/12/23','Credit')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR011','CU002','SF006','2012/12/24','Credit')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR012','CU003','SF007','2012/12/24','Cash')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR013','CU004','SF005','2012/12/25','Debit')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR014','CU005','SF007','2012/12/25','Debit')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR015','CU005','SF005','2012/12/26','Credit')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR016','CU002','SF001','2012/12/26','Cash')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR017','CU003','SF002','2012/12/26','Credit')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR018','CU005','SF001','2012/12/27','Debit')

-->Input tambahan HeaderSalonServices
INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR001','CU001','SF004','2012/12/20','Credit')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR002','CU002','SF005','2012/12/20','Credit')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR003','CU003','SF003','2012/12/20','Cash')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR004','CU004','SF005','2012/12/20','Debit')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR005','CU005','SF003','2012/12/21','Debit')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR006','CU001','SF005','2012/12/21','Credit')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR007','CU002','SF001','2012/12/22','Cash')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR008','CU003','SF002','2012/12/22','Credit')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR009','CU005','SF004','2012/12/22','Debit')

INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR019','CU005','SF004','2012/12/20','Credit')

/*e. Insert Detail Salon Services*/
INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR010','TM003')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR010','TM005')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR010','TM010')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR011','TM015')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR011','TM025')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR012','TM009')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR013','TM003')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR013','TM006')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR013','TM015')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR014','TM016')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR015','TM016')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR015','TM006')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR016','TM015')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR016','TM003')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR016','TM005')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR017','TM003')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR018','TM006')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR018','TM005')

INSERT INTO DetailSalonServices (transaction_id,treatment_id)
VALUES ('TR018','TM007')

/*2. Insert Data to HeaderSalonServices*/
INSERT INTO HeaderSalonServices (transaction_id,customer_id,staff_id,transaction_date,payment_type)
VALUES ('TR019','CU005','SF004',DATEADD(DAY, 3, GETDATE()),'Credit');

/*3. Insert Data Random to MsStaff*/
INSERT INTO MsStaff (staff_id,staff_name,staff_gender,staff_phone,staff_adress,staff_salary,staff_position)
VALUES ('SF010','Effendy Lesmana','Male','085218587878','Tangerang City Street no 88',FLOOR (RAND()*(5000000-3000000)+3000000),'Stylist')

/*4. Update Data in customer_phone*/
UPDATE MsCustomer SET customer_phone=REPLACE(customer_phone,'08','628')

/*5. Update Data in staff_salary*/
UPDATE MsStaff SET staff_salary=FLOOR(RAND()*(5000000-3000000)+10000000) WHERE staff_id='SF010'

/*6. Update Data in MsCustomer*/
UPDATE MsCustomer SET customer_name =LEFT(customer_name,7) SELECT CHARINDEX(' ','Emalia Dewi') SELECT DATEPART(DAY,'2012-12-24')

/*7. Update Data in customer_name*/
UPDATE MsCustomer SET customer_name='Ms.'+customer_name WHERE customer_id IN ('CU002','CU003')

/*8. Update in HeaderSalonServices*/
UPDATE MsCustomer SET customer_address = 'Daan Mogot Baru Street no. 23'
SELECT transaction_id FROM HeaderSalonServices WHERE transaction_id IN('TR010') SELECT DATENAME(WEEKDAY,'2012/12/23') AS Thrusday;

/*9. Delete Data from HeaderSalonServices*/
DELETE FROM HeaderSalonServices
FROM HeaderSalonServices JOIN MsCustomer 
ON HeaderSalonServices.customer_id  = MsCustomer.customer_id
WHERE CHARINDEX(' ',customer_name) = 0;

/*10. Delete Data from MsTreatment*/
DELETE FROM MsTreatment
WHERE (treatment_type_id IN ('TT002','TT003')) 
AND (MsTreatment.treatment_name NOT LIKE '%Treatment%');
/*1. Create a view named ‘ViewBonus’ to display BinusId (obtained from CustomerID by replacing
the first 2 characters with ‘BN ’), and CustomerName for every customer whose name is more
than 10 characters.
(create view, stuff, len)*/
CREATE VIEW ViewBonus
AS
SELECT 
STUFF (customer_id,1,2,'BN') AS BinusID,
customer_name AS CustomerName
FROM MsCustomer
WHERE LEN(customer_name)>10;

/*2. Create a view named ‘ViewCustomerData’ to display Name (obtained from customer’s name from
the first character until a character before space), Address (obtained from CustomerAddress), and
Phone (obtained from CustomerPhone) for every customer whose name contains space.
(create view, substring, charindex)*/
CREATE VIEW ViewCustomerData
AS 
SELECT
SUBSTRING (customer_name,1,CHARINDEX(' ',customer_name,1)) AS Nama,
customer_address AS Alamat,
customer_phone AS Phone
FROM MsCustomer
WHERE customer_name LIKE '% %';

/*3. Create a view named ‘ViewTreatment’ to display TreatmentName, TreatmentTypeName, Price
(obtained from Price by adding ‘Rp. ’ in front of Price) for every treatment which type is ‘Hair
Treatment’ and price is between 450000 and 800000. 
(create view, cast, between)*/
CREATE VIEW ViewTreatment
AS
SELECT
treatment_name AS TreatmentName,
treatment_type_name AS TreatmentTypeName,
'Rp. '+CAST(price AS VARCHAR) AS Price
FROM MsTreatment
INNER JOIN MsTreatmentType ON MsTreatment.treatment_type_id=MsTreatmentType.treatment_type_id
WHERE price BETWEEN 450000 AND 800000
AND treatment_type_name LIKE '%Hair Treatment%';

/*4. Create a view named ‘ViewTransaction’ to display StaffName, CustomerName, TransactionDate
(obtained from TransactionDate in ‘dd mon yyyy’ format), and PaymentType for every transaction
which the transaction is between 21st and 25th day and was paid by ‘Credit’.
(create view, convert, day, between)*/
CREATE VIEW ViewTransaction
AS 
SELECT 
staff_name AS StaffName,
customer_name AS CustomerName, 
CONVERT(DATE,transaction_date,106) AS TransactionDate,
payment_type AS PaymentType
FROM HeaderSalonServices
INNER JOIN MsStaff ON HeaderSalonServices.staff_id=MsStaff.staff_id
INNER JOIN MsCustomer ON HeaderSalonServices.customer_id=MsCustomer.customer_id
WHERE DAY(transaction_date) BETWEEN 21 AND 25
AND payment_type LIKE '%Credit%';

/*5. Create a view named ‘ViewBonusCustomer’ to display BonusId (obtained from CustomerId by
replacing ‘CU’ with ‘BN’), Name (Obtained from CustomerName by taking the next character
after space until the last character in lower case format), Day (obtained from the day when the
transaction happened), and TransactionDate (obtained from TransactionDate in ‘mm/dd/yy’
format) for every transaction which customer’s name contains space and staff’s last name contains
‘a’ character.
(create view, replace, lower, substring, charindex, len, datename, weekday, convert, like)*/
CREATE VIEW ViewBonusCustomer
AS
SELECT DISTINCT
REPLACE(MsCustomer.customer_id,'CU','BN') AS BinusID,
LOWER(SUBSTRING(customer_name,CHARINDEX(' ',customer_name)+1,LEN(customer_name))) AS Nama,
DATENAME(WEEKDAY,transaction_date) AS Hari,
CONVERT(VARCHAR,transaction_date,107) AS TransactionDate
FROM MsCustomer
INNER JOIN HeaderSalonServices ON MsCustomer.customer_id=HeaderSalonServices.customer_id
INNER JOIN MsStaff ON HeaderSalonServices.staff_id=MsStaff.staff_id
WHERE customer_name LIKE '% %'
AND staff_name LIKE '%a';

/*6. Create a view named ‘ViewTransactionByLivia’ to display TransactionId, Date (obtained from
TransactionDate in ‘Mon dd, yyyy’ format), and TreatmentName for every transaction which
occurred on the 21st day and handled by staff whose name is ‘Livia Ashianti’.
(create view, convert, day, like)*/
CREATE VIEW ViewTransactionByIndra
AS
SELECT 
HeaderSalonServices.transaction_id AS TransactionId,
CONVERT(VARCHAR,transaction_date,107) AS Tanggal,
staff_name AS StaffName,
treatment_name AS TreatmentName
FROM HeaderSalonServices
INNER JOIN MsStaff ON HeaderSalonServices.staff_id=MsStaff.staff_id
INNER JOIN DetailSalonServices ON HeaderSalonServices.transaction_id=DetailSalonServices.transaction_id
INNER JOIN MsTreatment ON DetailSalonServices.treatment_id=MsTreatment.treatment_id
WHERE DAY(transaction_date)=23
AND staff_name LIKE 'Indra Saswita';

/*7. Change the view named ‘ViewCustomerData’ to ID (obtained from the last 3 digit characters of
CustomerID), Name (obtained from CustomerName), Address (obtained from CustomerAddress),
and Phone (obtained from CustomerPhone) for every customer whose name contains space.
(alter view, right, charindex)*/
ALTER VIEW ViewCustomerData 
AS
SELECT
RIGHT(customer_id,CHARINDEX('0',customer_id)) AS ID,
customer_name AS Nama,
customer_address AS Alamat,
customer_phone AS Phone
FROM MsCustomer
WHERE customer_name LIKE '% %';

/*8. Create a view named ‘ViewCustomer’ to display CustomerId, CustomerName, CustomerGender
from MsCustomer, then add the data to ViewCustomer with the following specifications.
(create view, insert)*/
CREATE VIEW ViewCustomer
AS
SELECT
customer_id AS CustomerId,
customer_name AS CustomerName, 
customer_gender AS CustomerGender,
customer_phone AS CustomerPhone,
customer_address AS CustomerAddress
FROM MsCustomer

INSERT INTO ViewCustomer
(CustomerId,CustomerName,CustomerGender,CustomerAddress,CustomerPhone)
VALUES
('CU006','Cristian','Male','NULL','NULL');

/*9. Delete data in view ‘ViewCustomerData’ that has ID ‘005’. Then display all data from
ViewCustomerData.
(delete)*/
DELETE FROM ViewCustomerData
WHERE ID LIKE '%005%';

/*10. Delete the view named ‘ViewCustomerData’.
(drop view)*/
DROP VIEW ViewCustomerData;
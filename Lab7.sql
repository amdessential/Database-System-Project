-->1. Display TreatmentId, and TreatmentName for every treatment which id is ‘TM001’ or ‘TM002’
SELECT 
treatment_id AS TreatmentID,
treatment_name AS TreatmentName
FROM MsTreatment
WHERE treatment_id IN ('TM001','TM002');

-->2. Display TreatmentName, and Price for every treatment which type is not ‘Hair Treatment’ and ‘Message / Spa’
SELECT
treatment_name AS TreatmentName,
price AS Price
FROM MsTreatment
INNER JOIN MsTreatmentType ON MsTreatment.treatment_type_id = MsTreatmentType.treatment_type_id
WHERE treatment_type_name NOT IN ('Hair Treatment','Hair Spa Treatment');

-->3. Display CustomerName, CustomerPhone, and CustomerAddress for every customer whose name is more than 8 charactes and did transaction on Friday
SELECT 
customer_name AS CustomerName,
customer_phone AS CustomerPhone, 
customer_address AS CustomerAddress
FROM MsCustomer
INNER JOIN HeaderSalonServices ON MsCustomer.customer_id = HeaderSalonServices.customer_id
WHERE LEN(customer_name)>8
AND DATENAME(WEEKDAY,transaction_date) LIKE 'Friday';

-->4. Display TreatmentTypeName, TreatmentName, and Price for every treatment that taken by customer whose name contains ‘Putra’ and happened on day 22th
SELECT 
treatment_type_name AS TreatmentTypeName,
treatment_name AS TreatmentName,
price AS Price
FROM MsTreatmentType
INNER JOIN MsTreatment ON MsTreatmentType.treatment_type_id = MsTreatment.treatment_type_id
INNER JOIN DetailSalonServices ON MsTreatment.treatment_id = DetailSalonServices.treatment_id
INNER JOIN HeaderSalonServices ON DetailSalonServices.transaction_id = HeaderSalonServices.transaction_id
INNER JOIN MsCustomer ON HeaderSalonServices.customer_id = MsCustomer.customer_id
WHERE customer_name IN ('%Putra%')
AND DAY(transaction_date)=22;

-->5. Display StaffName, CustomerName, and TransactionDate (obtained from TransactionDate in ‘Mon dd,yyyy’ format) for every treatment which the last character of treatmentid is an even number
SELECT 
staff_name AS StaffName,
customer_name AS CustomerName,
transaction_date AS TransactionDate
FROM HeaderSalonServices
INNER JOIN MsStaff ON HeaderSalonServices.staff_id = MsStaff.staff_id
INNER JOIN MsCustomer ON HeaderSalonServices.customer_id = MsCustomer.customer_id
WHERE transaction_date = CONVERT(VARCHAR,transaction_date,107)
AND EXISTS 
(SELECT MsTreatment.treatment_id 
FROM MsTreatment,DetailSalonServices
WHERE MsStaff.staff_id = HeaderSalonServices.staff_id 
AND MsCustomer.customer_id = HeaderSalonServices.staff_id
AND DetailSalonServices.transaction_id = HeaderSalonServices.transaction_id
AND DetailSalonServices.treatment_id = MsTreatment.treatment_id
AND RIGHT (MsTreatment.treatment_id,1)%2 = 0);

-->6. Display CustomerName, CustomerPhone, and CustomerAddress for every customer that was served by staff whose name’s length is an odd number.
SELECT 
customer_name AS CustomerName,
customer_phone AS CustomerPhone,
customer_address AS CustomerAddress
FROM MsCustomer
WHERE EXISTS 
(SELECT staff_name 
FROM MsStaff,HeaderSalonServices
WHERE MsCustomer.customer_id = HeaderSalonServices.customer_id
AND HeaderSalonServices.staff_id = MsStaff.staff_id 
AND LEN (staff_name)%2 = 1);

-->7. Display ID (obtained form last 3 characters of StaffID), and Name (obtained by taking character after the first space until character before second space in StaffName) for every staff whose name contains at least 3 words and hasn’t served male customer .
SELECT 
RIGHT (staff_id,3) AS StaffId,
SUBSTRING (staff_name,
CHARINDEX(' ',staff_name) + 1,
(CHARINDEX(' ',staff_name) + 1)) AS StaffName
FROM MsStaff
WHERE EXISTS 
(SELECT
customer_gender AS CustomerGender
FROM MsCustomer
WHERE customer_gender NOT LIKE 'Male')
AND LEN (staff_name)-LEN (REPLACE(staff_name,' ','')) >= 2;

-->8. Display TreatmentTypeName, TreatmentName, and Price for every treatment which price is higher than average of all treatment’s price.
SELECT 
treatment_type_name AS TreatmentTypeName,
treatment_name AS TreatmentName,
price AS Price
FROM MsTreatment,MsTreatmentType,
(SELECT
AVG(price) AS Avgprice
FROM MsTreatment) AS Ratarata
WHERE MsTreatment.treatment_type_id = MsTreatmentType.treatment_type_id
AND price > Ratarata.Avgprice;

-->9. Display StaffName, StaffPosition, and StaffSalary for every staff with highest salary or lowest salary.
SELECT
staff_name AS StaffName, 
staff_position AS StaffPosition,
staff_salary AS StaffSalary
FROM MsStaff,
(SELECT
MAX(staff_salary) AS Maks,
MIN(staff_salary) AS Minim
FROM MsStaff) AS Gaji
WHERE staff_salary = Gaji.Maks
OR staff_salary = Gaji.Minim;

-->10. Display CustomerName,CustomerPhone,CustomerAddress, and Count Treatment (obtained from the total number of treatment) for every transaction which has the highest total number of treatment.
SELECT 
customer_name AS CustomerName,
customer_phone AS CustomerPhone,
customer_address AS CustomerAddress,
COUNT(HeaderSalonServices.transaction_id) AS CountTreatment 
FROM MsCustomer
INNER JOIN HeaderSalonServices ON MsCustomer.customer_id = HeaderSalonServices.customer_id
GROUP BY customer_name,customer_phone,customer_address
HAVING COUNT(HeaderSalonServices.transaction_id) = (SELECT MAX(Jumlah.Treatment) FROM 
(SELECT MsCustomer.customer_name,
COUNT (HeaderSalonServices.transaction_id) AS Treatment
FROM HeaderSalonServices 
INNER JOIN MsCustomer ON HeaderSalonServices.customer_id = MsCustomer.customer_id 
GROUP BY MsCustomer.customer_name) AS Jumlah);
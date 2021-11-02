-->Display TreatmentTypeName, TreatmentName, and Price for every treatment which name contains 'hair' or start with 'nail' word and has price below 100000
SELECT
treatment_type_name AS TreatmentTypeName,
treatment_name AS TreatmentName,
price AS Price
FROM MsTreatmentType
INNER JOIN MsTreatment ON MsTreatmentType.treatment_type_id = MsTreatment.treatment_type_id
WHERE price<100000 AND treatment_type_name LIKE '%hair%' 
OR price<100000 AND treatment_type_name LIKE '%menicure%';

-->Display StaffName and StaffEmail for every staff who handle transaction on Thursday. The duplicated data must be displayed only once
SELECT DISTINCT
staff_name AS StaffName, 
LOWER (LEFT(staff_name,1)+REVERSE(LEFT(REVERSE(staff_name), 
CHARINDEX(' ',REVERSE(staff_name))-1)))+'@oosalon.com' AS StaffEmail
FROM HeaderSalonServices 
JOIN MsStaff ON HeaderSalonServices.staff_id = MsStaff.staff_id
WHERE DATENAME(WEEKDAY,transaction_date) LIKE 'Thursday';

-->Display New TransactionId, Old Transaction Id, TransactionDate, StaffName, and CustomerName for every transaction which happened 2 days before 24th December 2012
SELECT 
REPLACE(transaction_id,'TR','Trans') AS NewTransactionID,
transaction_id AS OldTransactionID,
transaction_date AS TransactionDate,
staff_name AS StaffName, 
customer_name AS CustomerName
FROM HeaderSalonServices
INNER JOIN MsStaff ON HeaderSalonServices.staff_id = MsStaff.staff_id
INNER JOIN MsCustomer ON HeaderSalonServices.customer_id = MsCustomer.customer_id
WHERE DATEDIFF(DAY,transaction_date,'2012/12/24') = 2;

-->Display New Transaction Date, Old Transaction Date, and CustomerName for every transaction didn't happen on day 20th
SELECT 
TOP 5 DATEADD(DAY,5,transaction_date) AS NewTransactionDate, 
transaction_date AS OldTransactionDate, 
customer_name AS CustomerName 
FROM HeaderSalonServices
JOIN MsCustomer ON MsCustomer.customer_id = HeaderSalonServices.customer_id
WHERE NOT DATEPART(DAY,transaction_date) = 20;

-->Display Day, CustomerName, and TreatmentName for every Customer who was handled by female staff that has position name begin with 'TOP' word. Then order by ascending
SELECT 
DATENAME(WEEKDAY,transaction_date) AS Daydate, 
customer_name AS CustomerName,
treatment_name AS TreatmentName 
FROM MsStaff
JOIN HeaderSalonServices ON HeaderSalonServices.staff_id = MsStaff.staff_id 
JOIN MsCustomer ON MsCustomer.customer_id = HeaderSalonServices.customer_id
JOIN DetailSalonServices ON DetailSalonServices.transaction_id = HeaderSalonServices.transaction_id 
JOIN MsTreatment ON MsTreatment.treatment_id = DetailSalonServices.treatment_id
WHERE staff_gender IN ('FEMALE') AND staff_position LIKE '%TOP%'
ORDER BY CustomerName ASC;

-->Display the first data of CustomerId, CustomerName, TransactionId, Total Treatment. Then sort the data based on Total Treatment in descending
SELECT 
TOP 2 MsCustomer.customer_id, 
customer_name AS CustomerName,
HeaderSalonServices.transaction_id AS TransactionId, 
COUNT(treatment_id) AS TotalTreatment
FROM MsCustomer 
INNER JOIN HeaderSalonServices ON MsCustomer.customer_id = HeaderSalonServices.customer_id
INNER JOIN DetailSalonServices ON HeaderSalonServices.transaction_id = DetailSalonServices.transaction_id
GROUP BY MsCustomer.customer_id, MsCustomer.customer_name, HeaderSalonServices.transaction_id
ORDER BY TotalTreatment DESC;

-->Display CustomerId, TransactionId, CustomerName, and TotalPrice for every transaction with total price is higher than the average value of treatment price from every transaction. Then sort TotalPrice in descending
SELECT
MsCustomer.customer_id AS CustomerId,
HeaderSalonServices.transaction_id AS TransactionId,
customer_name AS CustomerName, 
SUM(MsTreatment.price) AS TotalPrice, 
--AVG(MsTreatment.price) AS AVGE, 
--COUNT(HeaderSalonServices.transaction_id)
FROM MsCustomer
INNER JOIN HeaderSalonServices ON HeaderSalonServices.customer_id= MsCustomer.customer_id
INNER JOIN DetailSalonServices ON DetailSalonServices.transaction_id = HeaderSalonServices.transaction_id
INNER JOIN MsTreatment ON DetailSalonServices.treatment_id = MsTreatment.treatment_id
GROUP BY MsCustomer.customer_id, MsCustomer.customer_name, HeaderSalonServices.transaction_id
HAVING  SUM(MsTreatment.price) > AVG(price) 
ORDER BY TotalPrice DESC;

-->Display Name, StaffPosition, and StaffSalary for every male staff. The combine it with Name, StaffPosition, and StaffSalary for every female staff. Sort data on name in ascending
SELECT 
'Mr. ' + staff_name AS Nama, 
staff_position AS StaffPosition, 
staff_salary AS StaffSalary
FROM MsStaff
WHERE staff_gender='Male'
UNION
SELECT 
'Ms. ' + staff_name AS Nama, 
staff_position AS StaffPosition, 
staff_salary AS StaffSalary
FROM MsStaff 
WHERE staff_gender = 'Female'
ORDER BY Nama,StaffPosition ASC;

-->Display TreatmentName, Price, and Status as 'Maximum Price' for every Treatment which price is the highest treatment's price. Then combine it with TreatmentName, Price, and Status as 'Minimum Price' for every Treatment which price is the lowest treatment's price.
SELECT 
treatment_name AS TreamentName, 
'Rp. ' + CAST(price AS VARCHAR) AS Price, 
'Maximum Price' AS 'Status'
FROM MsTreatment, 
(SELECT Maximum = MAX(price) FROM MsTreatment) Maks
WHERE price = Maks.Maximum
UNION
SELECT 
treatment_name AS TreamentName, 
'Rp. ' + CAST(price AS VARCHAR) AS Price, 
'Minimum Price' AS 'Status'
FROM MsTreatment, 
(SELECT Minimum = MIN(Price) FROM MsTreatment) Maks
WHERE price = Maks.Minimum;

-->Display Longest Name of Staff and Customer, Length of Name, Status as 'Customer' for every customer who has the longest name. Then combine with longest name of Staff and Customer
SELECT
customer_name AS LongestNameOfStaffAndCustomer,
LEN(customer_name) AS LengthOfName, 
'Customer' AS 'Status'
FROM MsCustomer, 
(SELECT Maximum = MAX(LEN(customer_name)) FROM MsCustomer) Maks
WHERE LEN(customer_name) = Maks.Maximum
UNION
SELECT 
staff_name AS LongestNameOfStaffAndCustomer, 
LEN(staff_name) AS LengthOfName, 
'Staff' AS 'Status'
FROM MsStaff, 
(SELECT Maximum = MAX(LEN(staff_name)) FROM MsStaff) Maks
WHERE LEN(staff_name) = Maks.Maximum;
-->Display Maximum Price, Minimum Price, and Average Price
SELECT 
MAX(price) AS MaxPrice,
MIN(price) AS MinPrice,
CAST(ROUND(AVG(price),0) AS DECIMAL(10,2)) AS AveragePrice 
FROM MsTreatment;

-->Display StaffPosition, Gender, and AverageSalary
SELECT
staff_position AS StaffPosition,
LEFT(staff_gender,1) AS Gender,
'Rp. '+CAST(AVG(staff_salary) AS VARCHAR) AS AverageSalary
FROM MsStaff
WHERE staff_salary=ROUND(staff_salary,2,0)
GROUP BY staff_gender,staff_position;

-->Display TransactionDate, and Total Transaction perDay
SELECT
CONVERT(VARCHAR,transaction_date,107) AS TransactionDate,
COUNT(transaction_id) AS TotalTransactionPerDay
FROM HeaderSalonServices
GROUP BY transaction_date;

-->Display CustomerGender, and TotalTransaction
SELECT
UPPER(customer_gender) AS CustomerGender,
COUNT(customer_id) AS TotalTransaction
FROM MsCustomer
GROUP BY customer_gender;

-->!!!Display TreatmentTypeName, and Total Transaction. Then sort the data in descending format based on the total of transaction
SELECT
treatment_type_name AS TreatmentTypeName,
COUNT(HeaderSalonServices.transaction_id) AS TotalTransaction
FROM MsTreatmentType,MsTreatment,HeaderSalonServices,DetailSalonServices
WHERE MsTreatmentType.treatment_type_id = MsTreatment.treatment_type_id
AND MsTreatment.treatment_id = DetailSalonServices.treatment_id
AND DetailSalonServices.transaction_id = HeaderSalonServices.transaction_id
GROUP BY treatment_type_name
ORDER BY TotalTransaction DESC;

-->Display Date, Revenue per Day for every transaction which Revenue Per Day is between 1000000 and 5000000
SELECT
CONVERT(VARCHAR,transaction_date,106) AS TransactionDate,
'Rp. '+CAST(SUM(price) AS VARCHAR) AS RevenuePerDay
FROM HeaderSalonServices,MsTreatment,DetailSalonServices
WHERE MsTreatment.treatment_id = DetailSalonServices.treatment_id
AND DetailSalonServices.transaction_id = HeaderSalonServices.transaction_id
GROUP BY transaction_date
HAVING SUM(price) BETWEEN 1000000 AND 5000000;

-->Display ID, TreatmentTypeName, and Total Treatment per Type for treatment type that consists of more than 5 treatments. Then sort the data in descending format based on Total Treatment per Type.
SELECT
REPLACE(MsTreatmentType.treatment_type_id,'TT0','Treatment Type ') AS ID,
treatment_type_name AS TreatmentTypeName,
CAST(COUNT(treatment_id) AS VARCHAR)+' Treatment' AS TotalTreatmentperType
FROM MsTreatment,MsTreatmentType
WHERE MsTreatment.treatment_type_id = MsTreatmentType.treatment_type_id
GROUP BY MsTreatmentType.treatment_type_id,treatment_type_name
HAVING COUNT(MsTreatment.treatment_id)>5
ORDER BY TotalTreatmentperType DESC;

-->Display StaffName, TransactionID, and TotalTreatmentperTransaction
SELECT
LEFT(staff_name,CHARINDEX(' ',staff_name)) AS StaffName,
transaction_id AS TransactionId,
COUNT(transaction_id) AS TotalTreatmentperTransaction
FROM MsStaff,HeaderSalonServices
WHERE MsStaff.staff_id = HeaderSalonServices.staff_id
GROUP BY staff_name,transaction_id;

-->Display TransactionDate, CustomerName, TreatmentName, and Price for every transaction which happened on ‘Thursday’ and handled by Staff whose name contains the word ‘Ryan’. 
-->Then order the data based on TransactionDate and CustomerName in ascending format.
SELECT 
transaction_date AS TransactionDate, 
customer_name AS CustomerName, 
treatment_name AS TreatmentName, 
price AS Price   
FROM HeaderSalonServices, MsCustomer, MsStaff, DetailSalonServices, MsTreatment
WHERE MsCustomer.customer_id = HeaderSalonServices.customer_id 
AND MsStaff.staff_id = HeaderSalonServices.staff_id 
AND HeaderSalonServices.transaction_id = DetailSalonServices.transaction_id 
AND MsTreatment.treatment_id = DetailSalonServices.treatment_id 
AND DATENAME(WEEKDAY,transaction_date) LIKE 'Wednesday' AND staff_name LIKE '%Ryan%'
ORDER BY TransactionDate,CustomerName ASC;

-->Display TransactionDate, CustomerName, and TotalPrice for every transaction that happened after 20th day. Then order the data based on TransactionDate in ascending format
SELECT
transaction_date AS TransactionDate,
customer_name AS CustomerName,
SUM(price) AS TotalPrice
FROM HeaderSalonServices,DetailSalonServices,MsTreatment,MsCustomer
WHERE HeaderSalonServices.transaction_id = DetailSalonServices.transaction_id
AND DetailSalonServices.treatment_id = MsTreatment.treatment_id
AND HeaderSalonServices.customer_id = MsCustomer.customer_id
GROUP BY transaction_date,customer_name
ORDER BY TransactionDate ASC;

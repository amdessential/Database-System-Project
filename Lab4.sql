/*1. Select female in MsStaff*/
SELECT staff_id,staff_name,staff_gender,staff_phone,staff_adress,staff_salary,staff_position FROM MsStaff 
WHERE staff_gender='Female';

/*2. Select Cast in MsStaff*/
SELECT staff_name,'Rp'+CAST (staff_salary AS VARCHAR) AS staff_salary FROM MsStaff
WHERE staff_name LIKE ('%M%') AND staff_salary >= 10000000;

/*3. Display TreatmentName, and Price for every treatment which type is 'message / spa' or 'beauty
care'*/
SELECT treatment_name,price FROM MsTreatment,MsTreatmentType 
WHERE treatment_type_name IN ('Spa','Make Up and Facial');

/*4. Display StaffName, StaffPosition, and TransactionDate (obtained from TransactionDate in Mon
dd,yyyy format) for every staff who has salary between 7000000 and 10000000*/
SELECT staff_name,staff_position,transaction_date FROM MsStaff,HeaderSalonServices 
WHERE transaction_date=CONVERT (VARCHAR,transaction_date,7) AND staff_salary BETWEEN 7000000 AND 10000000;

/*5. Display Name, Gender, and PaymentType for every transaction that is  paid by 'Debit'.*/
SELECT LEFT (customer_name, CHARINDEX(' ',customer_name)) AS Nama, SUBSTRING(customer_gender, 1,1) AS Gender,payment_type FROM MsCustomer,HeaderSalonServices
WHERE MsCustomer.customer_id = HeaderSalonServices.customer_id AND payment_type = 'Debit';

/*6. Display Initial (obtained from first character of customer’s name and followed by first character of customer’s last name in uppercase format), and Day (obtained from the day when transaction happened ) for every transaction which the day difference with 24th December 2012 is less than 3
days.*/
SELECT UPPER (LEFT(customer_name, 1) + SUBSTRING(customer_name, CHARINDEX(' ',customer_name) +1, 1))[Initial], DATENAME(WEEKDAY, transaction_date)[Day]
FROM MsCustomer,HeaderSalonServices 
WHERE MsCustomer.customer_id = HeaderSalonServices.customer_id AND DATEDIFF(DAY, transaction_date,'2012/12/24') < 3 AND DATEDIFF(DAY, transaction_date, '2012/12/24') > 0

/*7. Display TransactionDate, and CustomerName for every customer whose name contains space and did the transaction on Saturday*/
SELECT CONVERT (VARCHAR,transaction_date) transaction_date,RIGHT (customer_name, CHARINDEX(' ', REVERSE (customer_name)) FROM HeaderSalonServices
INNER JOIN MsCustomer ON MsCustomer.customer_id = HeaderSalonServices.customer_id
WHERE MsCustomer.customer_id = HeaderSalonServices.customer_id AND MsCustomer.customer_name LIKE '% %' AND DATENAME(WEEKDAY, transaction_date) = 'Saturday'

/*8. Display StaffName, CustomerName, CustomerPhone*/
SELECT staff_name,customer_name,REPLACE(customer_phone,'08','+628')[customer_phone],customer_address FROM HeaderSalonServices
INNER JOIN MsCustomer ON MsCustomer.customer_id = HeaderSalonServices.customer_id
INNER JOIN MsStaff ON MsStaff.staff_id = HeaderSalonServices.staff_id
WHERE UPPER (MsCustomer.customer_name) LIKE '%[A,I,U,E,O]%' AND MsStaff.staff_name LIKE '% % %'

/*9. Display StaffName, TreatmentName, and Term of Transaction.*/
SELECT staff_name,treatment_name,DATEDIFF(DAY,'2012-12-24',transaction_date)[Term of Transaction] FROM HeaderSalonServices
INNER JOIN MsStaff ON MsStaff.staff_id = HeaderSalonServices.staff_id
INNER JOIN DetailSalonServices ON DetailSalonServices.transaction_id = HeaderSalonServices.transaction_id
INNER JOIN MsTreatment ON MsTreatment.treatment_id = HeaderSalonSrevices.treatment_id
WHERE LEN(MsTreatment.treatment_name)>20 OR MsTreatment.treatment_name LIKE '% %'

/*10. Display TransactionDate, CustomerName, TreatmentName, Discount (obtainedby changing Price
data type into int and multiply it by 20%), and PaymentType for every transaction which
happened on 22th day.*/
SELECT transaction_date, customer_name, treatment_name, CAST (price AS INT)*0.2[Discount],payment_type FROM HeaderSalonServices
INNER JOIN MsCustomer ON MsCustomer.customer_id = HeaderSalonServices.customer_id
INNER JOIN DetailSalonServices ON DetailSalonServices.transaction_id = HeaderSalonServices.transaction_id
INNER JOIN MsTreatment ON MsTreatment.treatment_id = DetailSalonServices.treatment_id
WHERE DATEPART (DAY, HeaderSalonServices.transaction_date) = 22
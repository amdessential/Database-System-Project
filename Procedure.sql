--/LsTipeBarang/
CREATE PROCEDURE AllTipeBarang
AS BEGIN
SELECT * FROM LsTipeBarang
END 
GO
EXEC AllTipeBarang;

--/LsBarang/
CREATE PROCEDURE AllBarang
AS BEGIN
SELECT * FROM LsBarang
END
GO
EXEC AllBarang;

--/LsDesigner/
CREATE PROCEDURE AllDesigner
AS BEGIN
SELECT * FROM LsDesigner
END
GO;
EXEC AllDesigner;

--/LsDeliverytipe/
CREATE PROCEDURE AllTipeDelivery
AS BEGIN
SELECT * FROM LsDeliverytipe
END
GO;
EXEC AllTipeDelivery;

--/LsDelivery/
CREATE PROCEDURE AllDelivery
AS BEGIN
SELECT * FROM LsDelivery
END
GO;
EXEC AllDelivery;

--/LsDetailOrder/
CREATE PROCEDURE AllOrder
AS BEGIN
SELECT * FROM LsDetailOrder
END
GO;
EXEC AllOrder;

--/LsHistoryTransaksi/
CREATE PROCEDURE AllHistory
AS BEGIN
SELECT * FROM LsHistoryTransaksi
END
GO;
EXEC AllHistory;

--/LsCustomer/
CREATE PROCEDURE AllCustomers
AS BEGIN
SELECT * FROM LsCustomer
END
GO;
EXEC AllCustomers;

--/LsPayment/
CREATE PROCEDURE AllPayment
AS BEGIN
SELECT * FROM LsPayment
END
GO;
EXEC AllPayment;
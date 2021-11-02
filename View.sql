--View Transaksi menampilkan semua transaksi mulai dari customer_id, designer_id, nama customer dan nama designer, jumlah order, payment_id, dan barang_id dengan jumlah order antara 2 sampai 5
CREATE VIEW ViewTransaksi AS
SELECT LsOrder.designer_id AS DesignerID,
designer_nama AS DesignerName,
LsOrder.customer_id AS CustomerID,
customer_nama AS CustomerName,
order_jumlah AS Total,
payment_id AS PaymentID,
barang_id AS BarangID
FROM LsOrder
INNER JOIN LsDesigner ON LsDesigner.designer_id=LsOrder.designer_id
INNER JOIN LsCustomer ON LsCustomer.customer_id=LsOrder.customer_id
WHERE order_jumlah between 2 AND 5;

--ViewDelivery untuk menampilkan daftar delivery dari delivery ID, harga, date, dan nama delivery dari tabel LsDeliveryTipe
CREATE VIEW ViewDelivery AS
SELECT delivery_id AS deliveryID,
tipedelivery_nama AS NamaEkspedisi,
delivery_harga AS Price,
delivery_date AS Tanggal
FROM LsDelivery
INNER JOIN LsDeliveryTipe ON LsDeliveryTipe.tipedelivery_id=LsDelivery.tipedelivery_id
WHERE delivery_harga between 20000 AND 40000;

--ViewOrder untuk menampilkan order barang dan delivery yang dipilih oleh customer atas nama 'Mustikayani'
CREATE VIEW ViewOrder AS
SELECT LsOrder.order_id AS OrderID,
customer_nama AS Nama,
barang_id AS BarangID,
delivery_id AS DeliveryID,
delivery_date AS DeliveryDate
FROM LsDelivery
INNER JOIN LsOrder ON LsDelivery.order_id=LsOrder.order_id
INNER JOIN LsCustomer ON LsCustomer.customer_id=LsOrder.customer_id
WHERE customer_nama LIKE 'Mustikayani';

--ViewEstimasi untuk menampilkan lamanya estimasi barang yang dipesan customer
CREATE VIEW ViewDeliveryProcess AS
SELECT
customer_nama AS Nama,
LsOrder.order_id AS OrderID,
delivery_harga AS Harga,
delivery_status AS DelivStatus
FROM LsDelivery
INNER JOIN LsOrder ON LsOrder.order_id=LsDelivery.order_id
INNER JOIN LsCustomer ON LsCustomer.customer_id=LsOrder.customer_id;
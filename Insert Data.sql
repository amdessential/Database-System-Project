--Customer
INSERT INTO LsCustomer (customer_id, customer_nama, customer_alamat, customer_telepon, customer_email, customer_umur, customer_gender)
VALUES ('CU001','Diandra Meliana','Jalan Soekarno Hatta no 18','081252346518','diandra.meliana@gmail.com','25','Wanita');
INSERT INTO LsCustomer (customer_id, customer_nama, customer_alamat, customer_telepon, customer_email, customer_umur, customer_gender)
VALUES ('CU002','Mustikayani','Jalan Panglima Sudirman no 01','081233331456','moestikayani@gmail.com','36','Wanita');
INSERT INTO LsCustomer (customer_id, customer_nama, customer_alamat, customer_telepon, customer_email, customer_umur, customer_gender)
VALUES ('CU003','Rido Bakrie','Jalan Pattimura no 23','085767123456','bakrierido@gmail.com','28','Pria');
INSERT INTO LsCustomer (customer_id, customer_nama, customer_alamat, customer_telepon, customer_email, customer_umur, customer_gender)
VALUES ('CU004','Ahmad Dhani','Jalan Ahmad Yani no 13','081298765432','ahmaddhani@gmail.com','40','Pria');

--Designer
INSERT INTO LsDesigner (designer_id, designer_nama, designer_alamat, designer_rating, designer_email, designer_spec)
VALUES ('DI001','Melinda Hartono','Jalan Mekarsari no 21','3','mel.har@gmail.com','Design pakaian wanita');
INSERT INTO LsDesigner (designer_id, designer_nama, designer_alamat, designer_rating, designer_email, designer_spec)
VALUES ('DI002','Audrey Pamungkas','Jalan Pulau Tambelan no 17','4','audreyyyyypam@gmail.com','Design baju anak-anak');
INSERT INTO LsDesigner (designer_id, designer_nama, designer_alamat, designer_rating, designer_email, designer_spec)
VALUES ('DI003','Susanti','Jalan Pulau Seribu no 8','5','susanti0000@gmail.com','Design segala pakaian');
INSERT INTO LsDesigner (designer_id, designer_nama, designer_alamat, designer_rating, designer_email, designer_spec)
VALUES ('DI004','Defrico Nichol','Jalan Bhayangkara no 5','5','nicholdef@gmail.com','Design pakaian pria');

--TipeBarang
INSERT INTO LsTipeBarang (tipebarang_id, tipebarang_nama)
VALUES ('TB001','Atasan');
INSERT INTO LsTipeBarang (tipebarang_id, tipebarang_nama)
VALUES ('TB002','Bawahan');

--DeliveryTipe
INSERT INTO LsDeliveryTipe (tipedelivery_id, tipedelivery_nama, tipedelivery_harga, tipedelivery_estimasi)
VALUES ('TD001','J&T','28000','3 hari');
INSERT INTO LsDeliveryTipe (tipedelivery_id, tipedelivery_nama, tipedelivery_harga, tipedelivery_estimasi)
VALUES ('TD002','JNE YES','35000','5 hari');
INSERT INTO LsDeliveryTipe (tipedelivery_id, tipedelivery_nama, tipedelivery_harga, tipedelivery_estimasi)
VALUES ('TD003','JNE OKE','12000','2 hari');
INSERT INTO LsDeliveryTipe (tipedelivery_id, tipedelivery_nama, tipedelivery_harga, tipedelivery_estimasi)
VALUES ('TD004','Si Cepat','20000','2 hari');

--LsPayment
INSERT INTO LsPayment (payment_id, payment_type, payment_status, designer_id, customer_id)
VALUES ('PM001','COD','Not Paid','DI002','CU002');
INSERT INTO LsPayment (payment_id, payment_type, payment_status, designer_id, customer_id)
VALUES ('PM002','Transfer','Paid','DI003','CU004');
INSERT INTO LsPayment (payment_id, payment_type, payment_status, designer_id, customer_id)
VALUES ('PM003','Transfer','Paid','DI004','CU003');
INSERT INTO LsPayment (payment_id, payment_type, payment_status, designer_id, customer_id)
VALUES ('PM004','COD','Not Paid','DI001','CU001');

--Barang
INSERT INTO LsBarang (barang_id, barang_nama, tipebarang_id)
VALUES ('BG001', 'Atasan Wanita', 'TB001');
INSERT INTO LsBarang (barang_id, barang_nama, tipebarang_id)
VALUES ('BG002', 'Atasan Pria', 'TB001');
INSERT INTO LsBarang (barang_id, barang_nama, tipebarang_id)
VALUES ('BG003', 'Atasan Anak', 'TB001');
INSERT INTO LsBarang (barang_id, barang_nama, tipebarang_id)
VALUES ('BG004', 'Bawahan Wanita', 'TB002');
INSERT INTO LsBarang (barang_id, barang_nama, tipebarang_id)
VALUES ('BG005', 'Bawahan Pria', 'TB002');

--LsOrder
INSERT INTO LsOrder (order_id, order_jumlah, order_date, designer_id, customer_id, payment_id, barang_id)
VALUES ('OD001','3','5-12-2020','DI003','CU004','PM002','BG005')
INSERT INTO LsOrder (order_id, order_jumlah, order_date, designer_id, customer_id, payment_id, barang_id)
VALUES ('OD002','1','10-12-2020','DI001','CU001','PM001','BG004')
INSERT INTO LsOrder (order_id, order_jumlah, order_date, designer_id, customer_id, payment_id, barang_id)
VALUES ('OD003','2','8-11-2020','DI004','CU003','PM002','BG002')
INSERT INTO LsOrder (order_id, order_jumlah, order_date, designer_id, customer_id, payment_id, barang_id)
VALUES ('OD004','2','1-12-2020','DI002','CU002','PM001','BG003')

--DetailOrder
INSERT INTO LsDetailOrder (order_id, barang_id)
VALUES ('OD001','BG005');
INSERT INTO LsDetailOrder (order_id, barang_id)
VALUES ('OD002','BG004');
INSERT INTO LsDetailOrder (order_id, barang_id)
VALUES ('OD003','BG002');
INSERT INTO LsDetailOrder (order_id, barang_id)
VALUES ('OD004','BG003');

--Delivery
INSERT INTO LsDelivery (delivery_id, tipedelivery_id, delivery_harga, delivery_status, delivery_date, order_id)
VALUES ('DV001', 'TD001', '28000', 'Accepted', '12-12-2020', 'OD004');
INSERT INTO LsDelivery (delivery_id, tipedelivery_id, delivery_harga, delivery_status, delivery_date, order_id)
VALUES ('DV002', 'TD002', '35000', 'On Process', '2-1-2021', 'OD002');
INSERT INTO LsDelivery (delivery_id, tipedelivery_id, delivery_harga, delivery_status, delivery_date, order_id)
VALUES ('DV003', 'TD003', '12000', 'Accepted', '3-12-2020', 'OD001');
INSERT INTO LsDelivery (delivery_id, tipedelivery_id, delivery_harga, delivery_status, delivery_date, order_id)
VALUES ('DV004', 'TD004', '20000', 'On Process', '8-12-2020', 'OD003');

--LsHistoryTransaksi!!!
INSERT INTO LsHistoryTransaksi (histransaksi_id, barang_id, customer_id, order_id, delivery_id, designer_id, payment_id)
VALUES ('HT001','BG004','CU001','OD002','DV002','DI001','PM001');
INSERT INTO LsHistoryTransaksi (histransaksi_id, barang_id, customer_id, order_id, delivery_id, designer_id, payment_id)
VALUES ('HT002','BG005','CU004','OD001','DV004','DI003','PM002');
INSERT INTO LsHistoryTransaksi (histransaksi_id, barang_id, customer_id, order_id, delivery_id, designer_id, payment_id)
VALUES ('HT003','BG003','CU002','OD004','DV001','DI002','PM001');
INSERT INTO LsHistoryTransaksi (histransaksi_id, barang_id, customer_id, order_id, delivery_id, designer_id, payment_id)
VALUES ('HT004','BG002','CU003','OD003','DV003','DI004','PM002');

--LsAtasanWanita
INSERT INTO LsAtasanWanita (atasanw_id, atasanw_nama,tipebarang_id,atasanw_harga,barang_id)
VALUES ('AW001','Kimono','TB001','175000','BG001')
INSERT INTO LsAtasanWanita (atasanw_id, atasanw_nama,tipebarang_id,atasanw_harga,barang_id)
VALUES ('AW002','Blazer','TB001','250000','BG001')
INSERT INTO LsAtasanWanita (atasanw_id, atasanw_nama,tipebarang_id,atasanw_harga,barang_id)
VALUES ('AW003','Tunik','TB001','350000','BG001')
INSERT INTO LsAtasanWanita (atasanw_id, atasanw_nama,tipebarang_id,atasanw_harga,barang_id)
VALUES ('AW004','Kemeja','TB001','200000','BG001')

--LsBawahanWanita
INSERT INTO LsBawahanWanita (bawahanw_id, bawahanw_nama, tipebarang_id, bawahanw_harga, barang_id)
VAlUES ('BW001','Midi Skirt','TB002','320000','BG004')
INSERT INTO LsBawahanWanita (bawahanw_id, bawahanw_nama, tipebarang_id, bawahanw_harga, barang_id)
VAlUES ('BW002','Wide Pants','TB002','400000','BG004')
INSERT INTO LsBawahanWanita (bawahanw_id, bawahanw_nama, tipebarang_id, bawahanw_harga, barang_id)
VAlUES ('BW003','Cutbray','TB002','450000','BG004')
INSERT INTO LsBawahanWanita (bawahanw_id, bawahanw_nama, tipebarang_id, bawahanw_harga, barang_id)
VAlUES ('BW004','Pants','TB002','300000','BG004')

--Atasan Pria
INSERT INTO LsAtasanPria (atasanp_id, atasanp_nama, tipebarang_id, atasanp_harga, barang_id)
VALUES ('AP001', 'Kemeja', 'TB001', '150000', 'BG002');
INSERT INTO LsAtasanPria (atasanp_id, atasanp_nama, tipebarang_id, atasanp_harga, barang_id)
VALUES ('AP002', 'Jaket', 'TB001', '300000', 'BG002');
INSERT INTO LsAtasanPria (atasanp_id, atasanp_nama, tipebarang_id, atasanp_harga, barang_id)
VALUES ('AP003', 'T-Shirt', 'TB001', '100000', 'BG002');
INSERT INTO LsAtasanPria (atasanp_id, atasanp_nama, tipebarang_id, atasanp_harga, barang_id)
VALUES ('AP004', 'Sweater', 'TB001', '200000', 'BG002');

--Bawahan Pria
INSERT INTO LsBawahanPria (bawahanp_id, bawahanp_nama, tipebarang_id, bawahanp_harga, barang_id)
VALUES ('BP001', 'Jeans', 'TB001', '100000', 'BG005');
INSERT INTO LsBawahanPria (bawahanp_id, bawahanp_nama, tipebarang_id, bawahanp_harga, barang_id)
VALUES ('BP002', 'Sweatpants', 'TB001', '150000', 'BG005');
INSERT INTO LsBawahanPria (bawahanp_id, bawahanp_nama, tipebarang_id, bawahanp_harga, barang_id)
VALUES ('BP003', 'Shorts', 'TB001', '100000', 'BG005');
INSERT INTO LsBawahanPria (bawahanp_id, bawahanp_nama, tipebarang_id, bawahanp_harga, barang_id)
VALUES ('BP004', 'Trousers', 'TB001', '200000', 'BG005');

--Atasan Anak
INSERT INTO LsAtasanAnak (atasana_id, atasana_nama, tipebarang_id, atasana_harga, barang_id)
VALUES ('AA001', 'Kemeja', 'TB001', '75000', 'BG003');
INSERT INTO LsAtasanAnak (atasana_id, atasana_nama, tipebarang_id, atasana_harga, barang_id)
VALUES ('AA002', 'Blazer', 'TB001', '85000', 'BG003');
INSERT INTO LsAtasanAnak (atasana_id, atasana_nama, tipebarang_id, atasana_harga, barang_id)
VALUES ('AA003', 'Overall', 'TB001', '87000', 'BG003');
INSERT INTO LsAtasanAnak (atasana_id, atasana_nama, tipebarang_id, atasana_harga, barang_id)
VALUES ('AA004', 'Dress', 'TB001', '65000', 'BG003');

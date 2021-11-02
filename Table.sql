CREATE TABLE LsCustomer (
customer_id VARCHAR(5) NOT NULL PRIMARY KEY CHECK (customer_id LIKE 'CU[0-9][0-9][0-9]'),
customer_nama CHAR(30) NOT NULL,
customer_alamat VARCHAR(30) NOT NULL,
customer_telepon NUMERIC NOT NULL,
customer_email VARCHAR(30) NOT NULL,
customer_umur NUMERIC NOT NULL,
customer_gender CHAR(6) NOT NULL
);

CREATE TABLE LsDesigner (
designer_id VARCHAR(5) NOT NULL PRIMARY KEY CHECK (designer_id LIKE 'DI[0-9][0-9][0-9]'),
designer_nama CHAR(30) NOT NULL,
designer_alamat VARCHAR(30) NOT NULL,
designer_rating NUMERIC NOT NULL,
designer_email VARCHAR(30) NOT NULL,
designer_spec CHAR(30) NOT NULL
);

CREATE TABLE LsTipeBarang (
tipebarang_id VARCHAR(5) NOT NULL PRIMARY KEY CHECK (tipebarang_id LIKE 'TB[0-9][0-9][0-9]'),
tipebarang_nama CHAR(10) NOT NULL
);

CREATE TABLE LsBarang (
barang_id VARCHAR(5) NOT NULL PRIMARY KEY CHECK (barang_id LIKE 'BG[0-9][0-9][0-9]'),
barang_nama CHAR(30) NOT NULL,
tipebarang_id VARCHAR(5) NOT NULL,
FOREIGN KEY (tipebarang_id) REFERENCES LsTipeBarang (tipebarang_id)
);

CREATE TABLE LsPayment (
payment_id VARCHAR(5) NOT NULL PRIMARY KEY CHECK (payment_id LIKE 'PM[0-9][0-9][0-9]'),
payment_type CHAR(30) NOT NULL,
payment_status CHAR(30) NOT NULL,
designer_id VARCHAR(5) NOT NULL,
customer_id VARCHAR(5) NOT NULL,
FOREIGN KEY (designer_id) REFERENCES LsDesigner (designer_id),
FOREIGN KEY (customer_id) REFERENCES LsCustomer (customer_id)
);

CREATE TABLE LsOrder (
order_id VARCHAR(5) NOT NULL PRIMARY KEY CHECK (order_id LIKE 'OD[0-9][0-9][0-9]'),
order_jumlah INT NOT NULL,
order_date DATE NOT NULL,
designer_id VARCHAR(5) NOT NULL,
customer_id VARCHAR(5) NOT NULL,
payment_id VARCHAR(5) NOT NULL,
barang_id VARCHAR(5) NOT NULL,
FOREIGN KEY (designer_id) REFERENCES LsDesigner (designer_id),
FOREIGN KEY (customer_id) REFERENCES LsCustomer (customer_id),
FOREIGN KEY (payment_id) REFERENCES LsPayment (payment_id),
FOREIGN KEY (barang_id) REFERENCES LsBarang (barang_id)
);

CREATE TABLE LsDeliveryTipe (
tipedelivery_id VARCHAR(5) NOT NULL PRIMARY KEY CHECK (tipedelivery_id LIKE 'TD[0-9][0-9][0-9]'),
tipedelivery_nama VARCHAR(30) NOT NULL,
tipedelivery_harga NUMERIC NOT NULL,
tipedelivery_estimasi VARCHAR(30) NOT NULL
);

CREATE TABLE LsDelivery (
delivery_id VARCHAR(5) NOT NULL PRIMARY KEY CHECK (delivery_id LIKE 'DV[0-9][0-9][0-9]'),
delivery_harga NUMERIC NOT NULL,
delivery_status CHAR(30) NOT NULL,
delivery_date DATE NOT NULL,
tipedelivery_id VARCHAR(5) NOT NULL,
order_id VARCHAR(5) NOT NULL,
FOREIGN KEY (tipedelivery_id) REFERENCES LsDeliveryTipe (tipedelivery_id),
FOREIGN KEY (order_id) REFERENCES LsOrder (order_id)
);

CREATE TABLE LsHistoryTransaksi (
histransaksi_id VARCHAR(5) NOT NULL PRIMARY KEY CHECK (histransaksi_id LIKE 'HT[0-9][0-9][0-9]'),
order_id VARCHAR(5) NOT NULL,
delivery_id VARCHAR(5) NOT NULL,
designer_id VARCHAR(5) NOT NULL,
customer_id VARCHAR(5) NOT NULL,
payment_id VARCHAR(5) NOT NULL,
barang_id VARCHAR(5) NOT NULL,
FOREIGN KEY (designer_id) REFERENCES LsDesigner (designer_id),
FOREIGN KEY (customer_id) REFERENCES LsCustomer (customer_id),
FOREIGN KEY (barang_id) REFERENCES LsBarang (barang_id),
FOREIGN KEY (order_id) REFERENCES LsOrder (order_id),
FOREIGN KEY (delivery_id) REFERENCES LsDelivery (delivery_id),
FOREIGN KEY (payment_id) REFERENCES LsPayment (payment_id)
);

CREATE TABLE LsDetailOrder (
order_id VARCHAR(5) NOT NULL,
barang_id VARCHAR(5) NOT NULL,
PRIMARY KEY (order_id,barang_id),
FOREIGN KEY (order_id) REFERENCES LsOrder (order_id),
FOREIGN KEY (barang_id) REFERENCES LsBarang (barang_id)
);

CREATE TABLE LsAtasanWanita (
atasanw_id VARCHAR(5) NOT NULL PRIMARY KEY CHECK (atasanw_id LIKE 'AW[0-9][0-9][0-9]'),
atasanw_nama CHAR(10) NOT NULL,
atasanw_harga NUMERIC NOT NULL,
tipebarang_id VARCHAR(5) NOT NULL,
barang_id VARCHAR(5) NOT NULL,
FOREIGN KEY (barang_id) REFERENCES LsBarang (barang_id),
FOREIGN KEY (tipebarang_id) REFERENCES LsTipeBarang (tipebarang_id)
);

CREATE TABLE LsAtasanPria (
atasanp_id VARCHAR(5) NOT NULL PRIMARY KEY CHECK (atasanp_id LIKE 'AP[0-9][0-9][0-9]'),
atasanp_nama CHAR(10) NOT NULL,
atasanp_harga NUMERIC NOT NULL,
tipebarang_id VARCHAR(5) NOT NULL,
barang_id VARCHAR(5) NOT NULL,
FOREIGN KEY (barang_id) REFERENCES LsBarang (barang_id),
FOREIGN KEY (tipebarang_id) REFERENCES LsTipeBarang (tipebarang_id)
);

CREATE TABLE LsBawahanWanita (
bawahanw_id VARCHAR(5) NOT NULL PRIMARY KEY CHECK (bawahanw_id LIKE 'BW[0-9][0-9][0-9]'),
bawahanw_nama CHAR(10) NOT NULL,
bawahanw_harga NUMERIC NOT NULL,
tipebarang_id VARCHAR(5) NOT NULL,
barang_id VARCHAR(5) NOT NULL,
FOREIGN KEY (barang_id) REFERENCES LsBarang (barang_id),
FOREIGN KEY (tipebarang_id) REFERENCES LsTipeBarang (tipebarang_id)
);

CREATE TABLE LsBawahanPria (
bawahanp_id VARCHAR(5) NOT NULL PRIMARY KEY CHECK (bawahanp_id LIKE 'BP[0-9][0-9][0-9]'),
bawahanp_nama CHAR(10) NOT NULL,
bawahanp_harga NUMERIC NOT NULL,
tipebarang_id VARCHAR(5) NOT NULL,
barang_id VARCHAR(5) NOT NULL,
FOREIGN KEY (barang_id) REFERENCES LsBarang (barang_id),
FOREIGN KEY (tipebarang_id) REFERENCES LsTipeBarang (tipebarang_id)
);

CREATE TABLE LsAtasanAnak (
atasana_id VARCHAR(5) NOT NULL PRIMARY KEY CHECK (atasana_id LIKE 'AA[0-9][0-9][0-9]'),
atasana_nama CHAR(10) NOT NULL,
atasana_harga NUMERIC NOT NULL,
tipebarang_id VARCHAR(5) NOT NULL,
barang_id VARCHAR(5) NOT NULL,
FOREIGN KEY (barang_id) REFERENCES LsBarang (barang_id),
FOREIGN KEY (tipebarang_id) REFERENCES LsTipeBarang (tipebarang_id)
);

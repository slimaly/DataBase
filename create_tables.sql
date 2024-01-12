CREATE TABLE IF NOT EXISTS customers (
    customer_id TEXT PRIMARY KEY,
    customer_unique_id INTEGER,
    customer_zip_code_prefix INTEGER,
    customer_city TEXT,
    customer_state TEXT
);

INSERT INTO customers SELECT * FROM customer_dataset.csv;


CREATE TABLE IF NOT EXISTS geolocation (
    customer_id INTEGER FOREIGN KEY,
    seller_id INTEGER FOREIGN KEY,
    state_id INTEGER FOREIGN KEY,
    geolocation_lat REAL,
    geolocation_lng REAL,
    geolocation_city TEXT,
    geolocation_state TEXT
);

INSERT INTO geolocation SELECT * FROM geolocation_dataset.csv; 

CREATE TABLE IF NOT EXISTS state_name (
    state_id INTEGER PRIMARY KEY,
    state_name TEXT
);

INSERT INTO sate_name SELECT * FROM state_name.csv

CREATE TABLE IF NOT EXISTS review (
    review_id INTEGER PRIMARY KEY,
    order_id INTEGER FOREIGN KEY,
    review_creation_date TEXT,
    answer_timestamp TEXT,
    review_score INTEGER,
    review_comment_title TEXT,
    review_comment_message TEXT,
    timestamp_field TEXT
);

CREATE TABLE IF NOT EXISTS sellers (
    seller_id INTEGER PRIMARY KEY,
    seller_zip_code_prefix INTEGER,
    seller_city TEXT,
    seller_state TEXT
);

CREATE TABLE IF NOT EXISTS payments (
    order_id INTEGER FOREIGN KEY,
    payment_sequential INTEGER,
    payment_installements INTEGER,
    payment_type TEXT,
    payment_value REAL
);

CREATE TABLE IF NOT EXISTS products (
    product_id INTEGER PRIMARY KEY,
    product_category_name TEXT,
    product_description_length INTEGER,
    product_photo_qty INTEGER,
    product_weight_g INTEGER,
    product_height_cm INTEGER
);

CREATE TABLE IF NOT EXISTS orders (
   order_id INTEGER PRIMARY KEY,
   customer_id INTEGER FOREIGN KEY,
   order_delivered_carrier_date TEXT,
   order_delivered_customer_date TEXT,
   estimated_delivery_date TEXT,
   order_status TEXT,
   order_approved_at TEXT,
   order_purshace_timestamp TEXT
);

CREATE TABLE IF NOT EXISTS ProductCategoryNameTranslation (
    product_id INTEGER PRIMARY KEY,
    product_category_name TEXT,
    product_category_name_english TEXT
);

CREATE TABLE IF NOT EXISTS OrdersItems (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER FOREIGN KEY,
    product_id INTEGER FOREIGN KEY,
    shipping_limit_date TEXT,
    freight_value REAL,
    price REAL
);
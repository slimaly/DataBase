-- create state_name table
CREATE TABLE IF NOT EXISTS state_name (
    state TEXT PRIMARY KEY,
    state_name TEXT

);
--  create customers_dataset table
CREATE TABLE IF NOT EXISTS customers  (
    customer_id TEXT PRIMARY KEY,
    customer_unique_id TEXT,
    customer_zip_prefix INTEGER,
    customer_city TEXT,
    customer_state TEXT
    
    );
    --create geolocation table
    CREATE TABLE IF NOT EXISTS geolocation (
    geolocation_id TEXT PRIMARY KEY,
    geolocation_zip_code_prefixe INTEGER,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city TEXT,
    geolocation_state TEXT


);
    --create orders_items_dataset table
    CREATE TABLE IF NOT EXISTS order_item (
    order_item_id INTEGER PRIMARY KEY,
    order_id TEXT ,
    product_id TEXT ,
    seller_id TEXT ,
    shipping_limit_date TEXT,
    price FLOAT,
    freight_value FLOAT,
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (product_id) REFERENCES products (product_id),
    FOREIGN KEY (seller_id) REFERENCES sellers (seller_id)
);
--create  order_payments_dataset table
CREATE TABLE IF NOT EXISTS order_payment (
    order_payment_id INTEGER PRIMARY KEY,
    order_id TEXT,
    payment_sequential INTEGER,
    payment_type TEXT,
    payment_installments INTEGER,
    payment_value FLOAT,
    FOREIGN KEY (order_id) REFERENCES orders (order_id)
);
--create order_review_dataset_clean table
CREATE TABLE IF NOT EXISTS review (
    review_id TEXT PRIMARY KEY,
    order_id TEXT,
    review_score INTEGER,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TEXT,
    review_answer_timestamp TEXT,
    timestamp_field_7 TEXT,
    FOREIGN KEY (order_id) REFERENCES orders (order_id)
);
--create orders_dataset table
CREATE TABLE IF NOT EXISTS orders (
    order_id TEXT PRIMARY KEY,
    customer_id TEXT,
    order_status TEXT,
    order_purchase_timestamp TEXT,
    order_approved_at TEXT,
    order_delivered_carrier_date TEXT,
    order_delivered_customer_date TEXT,
    order_estimated_delivery_date TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);
--create product_category_name_translation table
CREATE TABLE IF NOT EXISTS product_category_name_translation (
    product_category_name TEXT PRIMARY KEY,
    product_category_name_english TEXT
    
);
--create products_dataset table
CREATE TABLE IF NOT EXISTS product (
    product_id TEXT PRIMARY KEY,
    product_category_name TEXT,
    product_name_lenght INTERGER,
    product_description_lengh INTEGER,
    product_photos_qty INTEGER,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER
    
);
--create sellers_dataset table
CREATE TABLE IF NOT EXISTS sellers (
    seller_id TEXT PRIMARY KEY,
    seller_zip_code_prefix INTEGER,
    seller_city TEXT,
    seller_state TEXT
);








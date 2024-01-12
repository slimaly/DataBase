CREATE TABLE Customers (
    customer_id TEXT PRIMARY KEY,
    customer_unique_id INTEGER,
    customer_zip_code_prefix INTEGER,
    customer_city TEXT,
    customer_state TEXT,
    geolocation_id INTEGER
);

CREATE TABLE geolocation (
    geolocation_id INTEGER PRIMARY KEY AUTOINCREMENT,
    geolocation_lat REAL,
    geolocation_lng REAL,
    geolocation_city TEXT,
    geolocation_state TEXT
);

CREATE TABLE state_name (
    state INTEGER PRIMARY KEY,
    state_name TEXT
);

CREATE TABLE review (
    review_id INTEGER PRIMARY KEY,
    review_creation_date TEXT,
    answer_timestamp TEXT,
    review_score INTEGER,
    review_comment_title TEXT,
    review_comment_message TEXT,
    timestamp_field TEXT,
    order_id INTEGER,
    customer_id TEXT,
    PRIMARY KEY (order_id, customer_id)
);

CREATE TABLE sellers (
    seller_id INTEGER PRIMARY KEY,
    seller_zip_code_prefix INTEGER,
    seller_city TEXT,
    seller_state TEXT,
    geolocation_id INTEGER
);

CREATE TABLE payments (
    payment_sequential INTEGER,
    payment_installements INTEGER,
    payment_type TEXT,
    payment_value REAL,
    order_id INTEGER,
    PRIMARY KEY (order_id)
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_category_name TEXT,
    product_description_length INTEGER,
    product_photo_qty INTEGER,
    product_weight_g INTEGER,
    product_height_cm INTEGER
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    order_delivered_carrier_date TEXT,
    order_delivered_customer_date TEXT,
    estimated_delivery_date TEXT,
    order_status TEXT,
    order_approved_at TEXT,
    order_purshace_timestamp TEXT,
    customer_id TEXT,
    PRIMARY KEY (order_id, customer_id)
);

CREATE TABLE ProductCategoryNameTranslation (
    product_category_name TEXT,
    product_category_name_english TEXT,
    product_id INTEGER,
    PRIMARY KEY (product_id)
);

CREATE TABLE OrdersItems (
    order_item_id INTEGER PRIMARY KEY,
    shipping_limit_date TEXT,
    freight_value REAL,
    price REAL,
    order_id INTEGER,
    product_id INTEGER,
    PRIMARY KEY (order_id, product_id)
);



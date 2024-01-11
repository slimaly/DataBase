CREATE TABLE IF NOT EXISTS customers (
    customer_id INTEGER PRIMARY KEY,
    customer_unique_id INTEGER,
    customer_zip_code_prefix INTEGER,
    customer_city TEXT,
    customer_state TEXT
);


CREATE TABLE IF NOT EXISTS geolocation (
    customer_id INTEGER FOREIGN KEY,
    seller_id INTEGER FOREIGN KEY,
    state_id INTEGER FOREIGN KEY,
    geolocation_lat REAL,
    geolocation_lng REAL,
    geolocation_city TEXT,
    geolocation_state TEXT
);

CREATE TABLE IF NOT EXISTS state_name (
    state_id INTEGER PRIMARY KEY,
    state_name TEXT
);

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


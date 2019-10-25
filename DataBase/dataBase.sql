CREATE TABLE user (
    usr_id INTEGER PRIMARY KEY
    usr_username VARCHAR  NOT NULL,
    password VARCHAR NOT NULL
);

CREATE TABLE apartment (
    id INTEGER PRIMARY KEY,
    title VARCHAR NOT NULL,
    price_per_day REAL NOT NULL,
    location VARCHAR NOT NULL,
);

CREATE TABLE revervation (
    apartment_id INTEGER REFERENCES apartment PRIMARY KEY,
    user_id INTEGER REFERENCES user PRIMARY KEY,
    initial_date VARCHAR NOT NULL,
    final_date VARCHAR NOT NULL
);

CREATE TABLE rental (
    usr_id INTEGER REFERENCES user PRIMARY KEY,
    apartment_id INTEGER REFERENCES apartment NOT NULL
);
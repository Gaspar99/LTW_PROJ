CREATE TABLE user (
    usr_username VARCHAR PRIMARY KEY,
    usr_password VARCHAR NOT NULL
);

CREATE TABLE apartment (
    id INTEGER PRIMARY KEY,
    title VARCHAR NOT NULL,
    price_per_day REAL NOT NULL,
    location VARCHAR NOT NULL,
);
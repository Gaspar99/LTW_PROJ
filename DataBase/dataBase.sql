CREATE TABLE user (
    usr_id INTEGER PRIMARY KEY,
    usr_first_name VARCHAR NOT NULL,
    usr_last_name VARCHAR NOT NULL,
    usr_email VARCHAR  NOT NULL,
    usr_phone_number VARCHAR NOT NULL,
    usr_password VARCHAR NOT NULL,
    country_id  INTEGER REFERENCES country NOT NULL
);

CREATE TABLE place (
    id INTEGER PRIMARY KEY,
    title VARCHAR NOT NULL,
    price_per_night REAL NOT NULL,
    place_address VARCHAR NOT NULL,
);

CREATE TABLE country (
    id INTEGER PRIMARY KEY,
    country_name VARCHAR NOT NULL
);

CREATE TABLE revervation (
    place_id INTEGER REFERENCES place NOT NULL,
    usr_id INTEGER REFERENCES user NOT NULL,
    country_id INTEGER REFERENCES country NOT NULL,
    initial_date VARCHAR NOT NULL,
    final_date VARCHAR NOT NULL,
    PRIMARY KEY(place_id, usr_id)
);

CREATE TABLE rental (
    usr_id INTEGER REFERENCES user PRIMARY KEY,
    apartment_id INTEGER REFERENCES place NOT NULL
);

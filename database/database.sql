CREATE TABLE usr (
    usr_id INTEGER PRIMARY KEY,
    usr_first_name VARCHAR NOT NULL,
    usr_last_name VARCHAR NOT NULL,
    usr_email VARCHAR  NOT NULL,
    usr_password VARCHAR NOT NULL,
    usr_phone_number VARCHAR NOT NULL
    --country_id  INTEGER REFERENCES country NOT NULL,
    --usr_profile_picture VARCHAR DEFAULT 'default.png',
    --num_notifications INTEGER DEFAULT 0,
    --rating REAL DEFAULT 0
);

CREATE TABLE place (
    id INTEGER PRIMARY KEY,
    city_id INTEGER REFERENCES city NOT NULL,
    title VARCHAR NOT NULL,
    price_per_night REAL NOT NULL,
    place_address VARCHAR NOT NULL,
    place_description VARCHAR NOT NULL,
    rating REAL DEFAULT 0,
    num_people INTEGER NOT NULL,
    owner_id INTEGER REFERENCES usr NOT NULL
);

CREATE TABLE reservation (
    id INTEGER PRIMARY KEY,
    place_id INTEGER REFERENCES place NOT NULL,
    usr_id INTEGER REFERENCES usr NOT NULL,
    initial_date DATE NOT NULL,
    final_date DATE NOT NULL,
    price REAL NOT NULL,
    usr_rating REAL DEFAULT 0,
    usr_comment VARCHAR DEFAULT NULL,
    usr_comment_date DATE DEFAULT NULL,
    owner_reply VARCHAR DEFAULT NULL,
    owner_reply_date DATE DEFAULT NULL 
);

CREATE TABLE country (
    id INTEGER PRIMARY KEY,
    country_name VARCHAR NOT NULL
);

CREATE TABLE city (
    id INTEGER PRIMARY KEY,
    city_name VARCHAR NOT NULL,
    country_id INTEGER REFERENCES country NOT NULL
);

CREATE TABLE tag (
    id INTEGER PRIMARY KEY,
    tag_name VARCHAR NOT NULL
);

CREATE TABLE place_tag (
    place INTEGER REFERENCES place NOT NULL,
    tag INTEGER REFERENCES tag NOT NULL,
    PRIMARY KEY (place, tag)
);

CREATE TABLE photo (
    id INTEGER PRIMARY KEY,
    file_path VARCHAR NOT NULL,
    place INTEGER REFERENCES place NOT NULL
);

--INSERTS
INSERT INTO usr VALUES(
    NULL,
    'John',
    'Doe',
    'email@jk.com',
    '9302483108401',
    '919349157'
);

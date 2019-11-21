CREATE TABLE usr (
    usr_id INTEGER PRIMARY KEY,
    usr_first_name VARCHAR NOT NULL,
    usr_last_name VARCHAR NOT NULL,
    usr_email VARCHAR  NOT NULL,
    usr_phone_number VARCHAR NOT NULL,
    usr_password VARCHAR NOT NULL,
    usr_profile_picture VARCHAR DEFAULT 'default.png',
    rating REAL DEFAULT 0,
    country_id  INTEGER REFERENCES country NOT NULL
);

CREATE TABLE place (
    id INTEGER PRIMARY KEY,
    title VARCHAR NOT NULL,
    price_per_night REAL NOT NULL,
    place_address VARCHAR NOT NULL,
    place_description VARCHAR NOT NULL,
    num_people INTEGER NOT NULL,
    available INTEGER NOT NULL,
    rating REAL DEFAULT 0,
    owner_id INTEGER REFERENCES usr NOT NULL,
    city_id INTEGER REFERENCES city NOT NULL
);

CREATE TABLE reservation (
    id INTEGER PRIMARY KEY,
    initial_date DATE NOT NULL,
    final_date DATE NOT NULL,
    price REAL NOT NULL,
    usr_rating REAL DEFAULT 0,
    usr_comment VARCHAR DEFAULT NULL,
    usr_comment_date DATE DEFAULT NULL,
    owner_reply VARCHAR DEFAULT NULL,
    owner_reply_date DATE DEFAULT NULL,
    tourist INTEGER REFERENCES usr NOT NULL,
    place_id INTEGER REFERENCES place NOT NULL
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

CREATE TABLE owner_photo (
    id INTEGER PRIMARY KEY,
    photo_path VARCHAR NOT NULL
);

CREATE TABLE owner_gallery (
    place INTEGER REFERENCES place NOT NULL,
    photo INTEGER REFERENCES owner_photos,
    PRIMARY KEY (place, photo)
);

CREATE TABLE tourist_photo (
    id INTEGER PRIMARY KEY,
    photo_path VARCHAR NOT NULL,
    aprooved INTEGER NOT NULL,
    reservation INTEGER REFERENCES reservation NOT NULL
);

CREATE TABLE usr_notification (
    id INTEGER PRIMARY KEY,
    notification_date DATE NOT NULL,
    is_read INTEGER NOT NULL,
    usr INTEGER REFERENCES usr NOT NULL,
    reservation INTEGER REFERENCES reservation NOT NULL
);

CREATE TABLE usr_message (
    id INTEGER PRIMARY KEY,
    message_txt VARCHAR NOT NULL,
    message_date DATE NOT NULL,
    from_usr INTEGER REFERENCES usr NOT NULL,
    to_usr INTEGER REFERENCES usr NOT NULL
);

--INSERTS
INSERT INTO usr VALUES(
    NULL,
    'John',
    'Doe',
    'email@jk.com',
    '919349157',
    '9302483108401',
    'default.png',
    0,
    0
);

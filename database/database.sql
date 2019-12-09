CREATE TABLE usr
(
   usr_id INTEGER PRIMARY KEY,
   usr_first_name VARCHAR NOT NULL,
   usr_last_name VARCHAR NOT NULL,
   usr_email VARCHAR NOT NULL UNIQUE,
   usr_phone_number VARCHAR NOT NULL,
   usr_password VARCHAR NOT NULL,
   usr_profile_picture VARCHAR DEFAULT "default" NOT NULL,
   rating REAL DEFAULT 0 NOT NULL,
   country_id INTEGER REFERENCES country NOT NULL
);

CREATE TABLE place
(
   id INTEGER PRIMARY KEY,
   title VARCHAR NOT NULL,
   price_per_night REAL NOT NULL,
   place_address VARCHAR NOT NULL,
   place_description VARCHAR NOT NULL,
   num_guests INTEGER NOT NULL,
   rating REAL DEFAULT 0 NOT NULL,
   owner_id INTEGER REFERENCES usr NOT NULL,
   city_id INTEGER REFERENCES city NOT NULL
);

CREATE TABLE reservation
(
   id INTEGER PRIMARY KEY,
   check_in DATE NOT NULL,
   check_out DATE NOT NULL,
   price REAL NOT NULL,
   num_guests INTEGER NOT NULL,
   usr_rating REAL DEFAULT 0 NOT NULL,
   usr_comment VARCHAR DEFAULT NULL,
   usr_comment_date DATE DEFAULT NULL,
   owner_reply VARCHAR DEFAULT NULL,
   owner_reply_date DATE DEFAULT NULL,
   tourist INTEGER REFERENCES usr NOT NULL,
   place_id INTEGER REFERENCES place NOT NULL
);

CREATE TABLE country
(
   id INTEGER PRIMARY KEY,
   country_name VARCHAR NOT NULL
);

CREATE TABLE city
(
   id INTEGER PRIMARY KEY,
   city_name VARCHAR NOT NULL,
   country_id INTEGER REFERENCES country NOT NULL
);

CREATE TABLE tag
(
   id INTEGER PRIMARY KEY,
   tag_name VARCHAR NOT NULL
);

CREATE TABLE place_tag
(
   place INTEGER REFERENCES place NOT NULL,
   tag INTEGER REFERENCES tag NOT NULL,
   PRIMARY KEY (place, tag)
);

CREATE TABLE owner_photo
(
   id INTEGER PRIMARY KEY,
   photo_path VARCHAR NOT NULL
);

CREATE TABLE owner_gallery
(
   place INTEGER REFERENCES place NOT NULL,
   photo INTEGER REFERENCES owner_photo,
   PRIMARY KEY (place, photo)
);

CREATE TABLE tourist_photo
(
   id INTEGER PRIMARY KEY,
   photo_path VARCHAR NOT NULL,
   aprooved INTEGER NOT NULL,
   reservation INTEGER REFERENCES reservation NOT NULL
);

CREATE TABLE usr_notification
(
   id INTEGER PRIMARY KEY,
   notification_date DATE NOT NULL,
   is_read INTEGER NOT NULL,
   usr INTEGER REFERENCES usr NOT NULL,
   reservation INTEGER REFERENCES reservation NOT NULL
);

CREATE TABLE usr_message
(
   id INTEGER PRIMARY KEY,
   message_txt VARCHAR NOT NULL,
   message_date DATE NOT NULL,
   from_usr INTEGER REFERENCES usr NOT NULL,
   to_usr INTEGER REFERENCES usr NOT NULL
);

--INSERTS
INSERT INTO usr
   (usr_id, usr_first_name, usr_last_name, usr_email, usr_phone_number, usr_password, country_id)
VALUES
   (
      1, --usr_id
      "John", --usr_first_name
      "Doe", --usr_last_name
      "johndoe@email.com", --usr_email
      "919349157", --usr_phone_number
      "$2y$10$EpKKrCShHulwh5iaUUSbG.DaXPSpf4nIEnXmRp4BwU/kXBaDiSWmm", --usr_password: 123456789
      34 --country_id
);

INSERT INTO usr
   (usr_id, usr_first_name, usr_last_name, usr_email, usr_phone_number, usr_password, country_id)
VALUES
   (
      2, --usr_id
      "Jane", --usr_first_name
      "Doe", --usr_last_name
      "janedoe@email.com", --usr_email
      "912345678", --usr_phone_number
      "$2y$10$obkm2f3lNnqIGjmybxt6SuwdvcNjrk4.A.yqFTktL2IN9UJu9xue6", --usr_password: password
      10 --country_id
);

INSERT INTO usr
   (usr_id, usr_first_name, usr_last_name, usr_email, usr_phone_number, usr_password, country_id)
VALUES
   (
      3, --usr_id
      "Jorge", --usr_first_name
      "Fransisco", --usr_last_name
      "fchico@email.com", --usr_email
      "919191919", --usr_phone_number
      "$2y$10$xzf4B.Tij5DnMBm4lx/ENOH.ng0fitnmBo2hr1FO7GxxRSTxEZg7.", --usr_password: jorgepass
      64 --country_id
);

INSERT INTO usr
   (usr_id, usr_first_name, usr_last_name, usr_email, usr_phone_number, usr_password, country_id)
VALUES(
      4, --usr_id
      "Antonio", --usr_first_name
      "manuel", --usr_last_name
      "antman@email.com", --usr_email
      "986541123", --usr_phone_number
      "$2y$10$EZTbD2U2MqM8gRF.WZ2nwuDEMvQjkpaWSkr/CJFIY4xDRJvTEEUUC", --usr_password: antman123
      64 --country_id
);

INSERT INTO usr
   (usr_id, usr_first_name, usr_last_name, usr_email, usr_phone_number, usr_password, country_id)
VALUES(
      5, --usr_id
      "Pedro", --usr_first_name
      "Torres", --usr_last_name
      "pemigo@email.com", --usr_email
      "967561781", --usr_phone_number
      "$2y$10$vQUO45NWCDO9U2siFdKQCubk.9MRDzEpsXLE3SAUL.TOq9NtsQ.72", --usr_password: migpedro00
      64 --country_id
);

INSERT INTO usr
   (usr_id, usr_first_name, usr_last_name, usr_email, usr_phone_number, usr_password, country_id)
VALUES(
      6, --usr_id
      "Miguel", --usr_first_name
      "Almeida", --usr_last_name
      "migeida@email.com", --usr_email
      "977456185", --usr_phone_number
      "$2y$10$iAzeY7eOqZcM5a4k0SHy7uIqSwD9cjTsmZZvWE9xEgs0OJjzXtc0e", --usr_password: migueida87
      64 --country_id
);

INSERT INTO place
   (id, title, price_per_night, place_address, place_description, num_guests, owner_id, city_id)
VALUES(
      1, --id
      "The Porto Concierge - Unexpected Journey C", --title
      30, --price_per_night
      "Porto Street 107", --place_address
      "Practical and conveniently located Studio with all amenities for a comfortable stay. Centrally located to enjoy all the city has to offer! In this apartment can sleep up to 4 people comfortably.
      Shared outside garden.
      Free Wifi is available on all areas of the apartment.
      Towels and bed Linen are provided for your stay.", --place_description
      4, --num_guests
      1, --owner_id: John Doe
      1867 --city_id: Porto
);

INSERT INTO place
   (id, title, price_per_night, place_address, place_description, num_guests, owner_id, city_id)
VALUES(
      2, --id
      "Champs-Élysées Golden triangle flat with mezzanine", --title
      80, --price_per_night
      "Awesome street 143", --place_address
      "Newly renovated tiny apartment with mezzanine, compact and design,well-equipped, direct elevator. (The space design is more suitable for young people)
      Located in the center of Paris, surrounded by Avenue Champs Élysées, Avenue George V and Avenue Montaigne, called the Golden Triangle area.
      Arc de Triomphe, LV flagship store, Lido nightclub, Ladurée and Subway station are all within a 1-5 minute walk.", --place_description
      2, --num_guests
      2, --owner_id: John Doe
      6736 --city_id: Paris
);

INSERT INTO place
   (id, title, price_per_night, place_address, place_description, num_guests, owner_id, city_id)
VALUES(
      3, --id
      "Sweet & cosy room next to Canal Saint Martin", --title
      300, --price_per_night
      "Fantastic road 107", --place_address
      "A fantastic house to simply have fun.", --place_description
      2, --num_guests
      3, --owner_id: Jorge
      6736 --city_id: Paris
);

INSERT INTO place
   (id, title, price_per_night, place_address, place_description, num_guests, owner_id, city_id)
VALUES(
      4, --id
      "Fantastic House", --title
      300, --price_per_night
      "Fantastic road 107", --place_address
      "The room is located right in the heart of la République area, in the 10th district of Paris. It’s close to lively streets, transportation and shops, making your stay in Paris easy and enjoyable.
      The room is bright, quiet and comfy, which makes it the perfect place to rest after your long and exciting days exploring the capital city.", --place_description
      7, --num_guests
      3, --owner_id: Jorge
      1411 --city_id: Amsterdam
);

INSERT INTO place
   (id, title, price_per_night, place_address, place_description, num_guests, owner_id, city_id)
VALUES(
      5, --id
      "Fantastic House", --title
      300, --price_per_night
      "Fantastic road 107", --place_address
      "A fantastic house to simply have fun.", --place_description
      7, --num_guests
      3, --owner_id: Jorge
      1411 --city_id: Amsterdam
);

INSERT INTO place
   (id, title, price_per_night, place_address, place_description, num_guests, owner_id, city_id)
VALUES(
      6, --id
      "Fantastic House", --title
      300, --price_per_night
      "Fantastic road 107", --place_address
      "A fantastic house to simply have fun.", --place_description
      9, --num_guests
      3, --owner_id: Jorge
      1411 --city_id: Amsterdam
);

INSERT INTO place
   (id, title, price_per_night, place_address, place_description, num_guests, owner_id, city_id)
VALUES(
      7, --id
      "Fantastic House", --title
      300, --price_per_night
      "Fantastic road 107", --place_address
      "A fantastic house to simply have fun.", --place_description
      7, --num_guests
      3, --owner_id: Jorge
      1411 --city_id: Amsterdam
);

INSERT INTO place
   (id, title, price_per_night, place_address, place_description, num_guests, owner_id, city_id)
VALUES(
      8, --id
      "Fantastic House", --title
      300, --price_per_night
      "Fantastic road 107", --place_address
      "A fantastic house to simply have fun.", --place_description
      4, --num_guests
      3, --owner_id: Jorge
      1411 --city_id: Amsterdam
);

INSERT INTO place
   (id, title, price_per_night, place_address, place_description, num_guests, owner_id, city_id)
VALUES(
      9, --id
      "Fantastic House", --title
      300, --price_per_night
      "Fantastic road 107", --place_address
      "A fantastic house to simply have fun.", --place_description
      3, --num_guests
      3, --owner_id: Jorge
      1411 --city_id: Amsterdam
);

INSERT INTO place
   (id, title, price_per_night, place_address, place_description, num_guests, owner_id, city_id)
VALUES(
      10, --id
      "Fantastic House", --title
      300, --price_per_night
      "Fantastic road 107", --place_address
      "A fantastic house to simply have fun.", --place_description
      6, --num_guests
      3, --owner_id: Jorge
      1411 --city_id: Amsterdam
);

INSERT INTO owner_photo
VALUES(
      1, --ID
      "lakeHouse" --photo_path
);

INSERT INTO owner_photo
VALUES(
      2, --ID
      "beachHouse" --photo_path
);

INSERT INTO owner_gallery
VALUES(
      1, --place id
      1 --owner_photo id
);

INSERT INTO owner_gallery
VALUES(
      2, --place id
      2 --owner_photo id
);

INSERT INTO owner_gallery
VALUES(
      3, --place id
      1 --owner_photo id
);

INSERT INTO owner_gallery
VALUES(
      4, --place id
      2 --owner_photo id
);

INSERT INTO owner_gallery
VALUES(
      5, --place id
      1 --owner_photo id
);

INSERT INTO owner_gallery
VALUES(
      6, --place id
      2 --owner_photo id
);

INSERT INTO owner_gallery
VALUES(
      7, --place id
      1 --owner_photo id
);

INSERT INTO owner_gallery
VALUES(
      8, --place id
      2 --owner_photo id
);

INSERT INTO owner_gallery
VALUES(
      9, --place id
      1 --owner_photo id
);

INSERT INTO owner_gallery
VALUES(
      10, --place id
      1 --owner_photo id
);

-- INSERT TAGS --
INSERT INTO tag
VALUES(
      1,
      "Kitchen"
);

INSERT INTO tag
VALUES(
      2,
      "Bathroom"
);

INSERT INTO tag
VALUES(
      3,
      "Swimming Pool"
);

INSERT INTO tag
VALUES(
      4,
      "Fireplace"
);

INSERT INTO tag
VALUES(
      5,
      "Wi-Fi"
);

INSERT INTO tag
VALUES(
      6,
      "Vegan"
);

INSERT INTO tag
VALUES(
      7,
      "Work desk"
);

INSERT INTO tag
VALUES(
      8,
      "By the Beach"
);

INSERT INTO tag
VALUES(
      9,
      "Air conditioning"
);

-- INSERT ALL COUNTRYS --
INSERT INTO country
VALUES(
      1,
      "Kosovo"
);

INSERT INTO city
VALUES(
      1,
      "Malisheve",
      1
);

INSERT INTO city
VALUES(
      2,
      "Prizren",
      1
);

INSERT INTO city
VALUES(
      3,
      "Zubin Potok",
      1
);

INSERT INTO city
VALUES(
      4,
      "Kamenice",
      1
);

INSERT INTO city
VALUES(
      5,
      "Viti",
      1
);

INSERT INTO city
VALUES(
      6,
      "Shterpce",
      1
);

INSERT INTO city
VALUES(
      7,
      "Shtime",
      1
);

INSERT INTO city
VALUES(
      8,
      "Vushtrri",
      1
);

INSERT INTO city
VALUES(
      9,
      "Dragash",
      1
);

INSERT INTO city
VALUES(
      10,
      "Podujeve",
      1
);

INSERT INTO city
VALUES(
      11,
      "Fushe Kosove",
      1
);

INSERT INTO city
VALUES(
      12,
      "Kacanik",
      1
);

INSERT INTO city
VALUES(
      13,
      "Kline",
      1
);

INSERT INTO city
VALUES(
      14,
      "Leposaviq",
      1
);

INSERT INTO city
VALUES(
      15,
      "Peje",
      1
);

INSERT INTO city
VALUES(
      16,
      "Rahovec",
      1
);

INSERT INTO city
VALUES(
      17,
      "Gjilan",
      1
);

INSERT INTO city
VALUES(
      18,
      "Lipjan",
      1
);

INSERT INTO city
VALUES(
      19,
      "Obiliq",
      1
);

INSERT INTO city
VALUES(
      20,
      "Gjakove",
      1
);

INSERT INTO city
VALUES(
      21,
      "Pristina",
      1
);

INSERT INTO city
VALUES(
      22,
      "Decan",
      1
);

INSERT INTO city
VALUES(
      23,
      "Istog",
      1
);

INSERT INTO city
VALUES(
      24,
      "Hani i Elezit",
      1
);

INSERT INTO city
VALUES(
      25,
      "Junik",
      1
);

INSERT INTO city
VALUES(
      26,
      "Kllokot",
      1
);

INSERT INTO city
VALUES(
      27,
      "Mamushe",
      1
);

INSERT INTO city
VALUES(
      28,
      "Partesh",
      1
);

INSERT INTO city
VALUES(
      29,
      "Ranillug",
      1
);

INSERT INTO city
VALUES(
      30,
      "Ferizaj",
      1
);

INSERT INTO city
VALUES(
      31,
      "Zvecan",
      1
);

INSERT INTO city
VALUES(
      32,
      "Suhareke",
      1
);

INSERT INTO city
VALUES(
      33,
      "Gllogovc",
      1
);

INSERT INTO city
VALUES(
      34,
      "Mitrovice",
      1
);

INSERT INTO city
VALUES(
      35,
      "Skenderaj",
      1
);

INSERT INTO city
VALUES(
      36,
      "Novoberde",
      1
);

INSERT INTO city
VALUES(
      37,
      "Gracanice",
      1
);

INSERT INTO country
VALUES(
      2,
      "Svalbard"
);

INSERT INTO city
VALUES(
      38,
      "Longyearbyen",
      2
);

INSERT INTO country
VALUES(
      3,
      "West Bank"
);

INSERT INTO city
VALUES(
      39,
      "Al Quds",
      3
);

INSERT INTO country
VALUES(
      4,
      "Yemen"
);

INSERT INTO city
VALUES(
      40,
      "Sanaa",
      4
);

INSERT INTO city
VALUES(
      41,
      "Marib",
      4
);

INSERT INTO city
VALUES(
      42,
      "Al Jabin",
      4
);

INSERT INTO city
VALUES(
      43,
      "Hajjah",
      4
);

INSERT INTO city
VALUES(
      44,
      "Ibb",
      4
);

INSERT INTO city
VALUES(
      45,
      "Al Hudaydah",
      4
);

INSERT INTO city
VALUES(
      46,
      "Lahij",
      4
);

INSERT INTO city
VALUES(
      47,
      "Al Mahwit",
      4
);

INSERT INTO city
VALUES(
      48,
      "Taizz",
      4
);

INSERT INTO city
VALUES(
      49,
      "Sadah",
      4
);

INSERT INTO city
VALUES(
      50,
      "Dhamar",
      4
);

INSERT INTO city
VALUES(
      51,
      "`Amran",
      4
);

INSERT INTO city
VALUES(
      52,
      "Ad Dali`",
      4
);

INSERT INTO city
VALUES(
      53,
      "Saywun",
      4
);

INSERT INTO city
VALUES(
      54,
      "Al Bayda",
      4
);

INSERT INTO city
VALUES(
      55,
      "Zinjibar",
      4
);

INSERT INTO city
VALUES(
      56,
      "Rida",
      4
);

INSERT INTO city
VALUES(
      57,
      "aAtaq",
      4
);

INSERT INTO city
VALUES(
      58,
      "Al Ghaydah",
      4
);

INSERT INTO city
VALUES(
      59,
      "Sayhut",
      4
);

INSERT INTO city
VALUES(
      60,
      "Al Mukalla",
      4
);

INSERT INTO city
VALUES(
      61,
      "Al Hazm",
      4
);

INSERT INTO city
VALUES(
      62,
      "Zabid",
      4
);

INSERT INTO city
VALUES(
      63,
      "Aden",
      4
);

INSERT INTO city
VALUES(
      64,
      "Hadiboh",
      4
);

INSERT INTO city
VALUES(
      65,
      "Ash Shihr",
      4
);

INSERT INTO country
VALUES(
      5,
      "Mayotte"
);

INSERT INTO city
VALUES(
      66,
      "Dzaoudzi",
      5
);

INSERT INTO country
VALUES(
      6,
      "South Africa"
);

INSERT INTO city
VALUES(
      67,
      "Lebowakgomo",
      6
);

INSERT INTO city
VALUES(
      68,
      "Potchefstroom",
      6
);

INSERT INTO city
VALUES(
      69,
      "Graaff Reinet",
      6
);

INSERT INTO city
VALUES(
      70,
      "Rustenburg",
      6
);

INSERT INTO city
VALUES(
      71,
      "Brandfort",
      6
);

INSERT INTO city
VALUES(
      72,
      "Vryheid",
      6
);

INSERT INTO city
VALUES(
      73,
      "Vereeniging",
      6
);

INSERT INTO city
VALUES(
      74,
      "Brits",
      6
);

INSERT INTO city
VALUES(
      75,
      "Bethlehem",
      6
);

INSERT INTO city
VALUES(
      76,
      "Ubomba",
      6
);

INSERT INTO city
VALUES(
      77,
      "Polokwane",
      6
);

INSERT INTO city
VALUES(
      78,
      "Springbok",
      6
);

INSERT INTO city
VALUES(
      79,
      "Thohoyandou",
      6
);

INSERT INTO city
VALUES(
      80,
      "Pietermaritzburg",
      6
);

INSERT INTO city
VALUES(
      81,
      "Poffader",
      6
);

INSERT INTO city
VALUES(
      82,
      "Carnarvon",
      6
);

INSERT INTO city
VALUES(
      83,
      "Kroonstad",
      6
);

INSERT INTO city
VALUES(
      84,
      "Alexander Bay",
      6
);

INSERT INTO city
VALUES(
      85,
      "Bloemhof",
      6
);

INSERT INTO city
VALUES(
      86,
      "Hermanus",
      6
);

INSERT INTO city
VALUES(
      87,
      "Bethal",
      6
);

INSERT INTO city
VALUES(
      88,
      "Upington",
      6
);

INSERT INTO city
VALUES(
      89,
      "Tzaneen",
      6
);

INSERT INTO city
VALUES(
      90,
      "Vanhynsdorp",
      6
);

INSERT INTO city
VALUES(
      91,
      "Kimberley",
      6
);

INSERT INTO city
VALUES(
      92,
      "Durban",
      6
);

INSERT INTO city
VALUES(
      93,
      "Klerksdorp",
      6
);

INSERT INTO city
VALUES(
      94,
      "Welkom",
      6
);

INSERT INTO city
VALUES(
      95,
      "De Aar",
      6
);

INSERT INTO city
VALUES(
      96,
      "Prieska",
      6
);

INSERT INTO city
VALUES(
      97,
      "Saldanha",
      6
);

INSERT INTO city
VALUES(
      98,
      "Middelburg",
      6
);

INSERT INTO city
VALUES(
      99,
      "Port St. Johns",
      6
);

INSERT INTO city
VALUES(
      100,
      "Volksrust",
      6
);

INSERT INTO city
VALUES(
      101,
      "Ulundi",
      6
);

INSERT INTO city
VALUES(
      102,
      "Beaufort West",
      6
);

INSERT INTO city
VALUES(
      103,
      "Komatipoort",
      6
);

INSERT INTO city
VALUES(
      104,
      "Nelspruit",
      6
);

INSERT INTO city
VALUES(
      105,
      "Standerton",
      6
);

INSERT INTO city
VALUES(
      106,
      "Johannesburg",
      6
);

INSERT INTO city
VALUES(
      107,
      "Kuruman",
      6
);

INSERT INTO city
VALUES(
      108,
      "Paarl",
      6
);

INSERT INTO city
VALUES(
      109,
      "Worcester",
      6
);

INSERT INTO city
VALUES(
      110,
      "Colesberg",
      6
);

INSERT INTO city
VALUES(
      111,
      "Umtata",
      6
);

INSERT INTO city
VALUES(
      112,
      "Aliwal North",
      6
);

INSERT INTO city
VALUES(
      113,
      "Middelburg",
      6
);

INSERT INTO city
VALUES(
      114,
      "Springs",
      6
);

INSERT INTO city
VALUES(
      115,
      "Benoni",
      6
);

INSERT INTO city
VALUES(
      116,
      "Port Shepstone",
      6
);

INSERT INTO city
VALUES(
      117,
      "Oudtshoorn",
      6
);

INSERT INTO city
VALUES(
      118,
      "Port Elizabeth",
      6
);

INSERT INTO city
VALUES(
      119,
      "Port Alfred",
      6
);

INSERT INTO city
VALUES(
      120,
      "East London",
      6
);

INSERT INTO city
VALUES(
      121,
      "Mossel Bay",
      6
);

INSERT INTO city
VALUES(
      122,
      "Vryburg",
      6
);

INSERT INTO city
VALUES(
      123,
      "Uitenhage",
      6
);

INSERT INTO city
VALUES(
      124,
      "Bhisho",
      6
);

INSERT INTO city
VALUES(
      125,
      "Knysna",
      6
);

INSERT INTO city
VALUES(
      126,
      "Queenstown",
      6
);

INSERT INTO city
VALUES(
      127,
      "Cradock",
      6
);

INSERT INTO city
VALUES(
      128,
      "Bredasdorp",
      6
);

INSERT INTO city
VALUES(
      129,
      "Swellendam",
      6
);

INSERT INTO city
VALUES(
      130,
      "Ladysmith",
      6
);

INSERT INTO city
VALUES(
      131,
      "George",
      6
);

INSERT INTO city
VALUES(
      132,
      "Grahamstown",
      6
);

INSERT INTO city
VALUES(
      133,
      "Mmabatho",
      6
);

INSERT INTO city
VALUES(
      134,
      "Mahikeng",
      6
);

INSERT INTO city
VALUES(
      135,
      "Musina",
      6
);

INSERT INTO city
VALUES(
      136,
      "Pretoria",
      6
);

INSERT INTO city
VALUES(
      137,
      "Bloemfontein",
      6
);

INSERT INTO city
VALUES(
      138,
      "Cape Town",
      6
);

INSERT INTO country
VALUES(
      7,
      "Zambia"
);

INSERT INTO city
VALUES(
      139,
      "Zambezi",
      7
);

INSERT INTO city
VALUES(
      140,
      "Solwezi",
      7
);

INSERT INTO city
VALUES(
      141,
      "Lusaka",
      7
);

INSERT INTO city
VALUES(
      142,
      "Kaoma",
      7
);

INSERT INTO city
VALUES(
      143,
      "Chipata",
      7
);

INSERT INTO city
VALUES(
      144,
      "Senanga",
      7
);

INSERT INTO city
VALUES(
      145,
      "Sesheke",
      7
);

INSERT INTO city
VALUES(
      146,
      "Chililabombwe",
      7
);

INSERT INTO city
VALUES(
      147,
      "Chingola",
      7
);

INSERT INTO city
VALUES(
      148,
      "Kasempa",
      7
);

INSERT INTO city
VALUES(
      149,
      "Kitwe",
      7
);

INSERT INTO city
VALUES(
      150,
      "Mufulira",
      7
);

INSERT INTO city
VALUES(
      151,
      "Nchelenge",
      7
);

INSERT INTO city
VALUES(
      152,
      "Mazabuka",
      7
);

INSERT INTO city
VALUES(
      153,
      "Lukulu",
      7
);

INSERT INTO city
VALUES(
      154,
      "Kafue",
      7
);

INSERT INTO city
VALUES(
      155,
      "Lundazi",
      7
);

INSERT INTO city
VALUES(
      156,
      "Mansa",
      7
);

INSERT INTO city
VALUES(
      157,
      "Mwinilunga",
      7
);

INSERT INTO city
VALUES(
      158,
      "Mumbwa",
      7
);

INSERT INTO city
VALUES(
      159,
      "Kalabo",
      7
);

INSERT INTO city
VALUES(
      160,
      "Nyimba",
      7
);

INSERT INTO city
VALUES(
      161,
      "Kapiri Mposhi",
      7
);

INSERT INTO city
VALUES(
      162,
      "Kabwe",
      7
);

INSERT INTO city
VALUES(
      163,
      "Ndola",
      7
);

INSERT INTO city
VALUES(
      164,
      "Kasama",
      7
);

INSERT INTO city
VALUES(
      165,
      "Mbala",
      7
);

INSERT INTO city
VALUES(
      166,
      "Kawambwa",
      7
);

INSERT INTO city
VALUES(
      167,
      "Luanshya",
      7
);

INSERT INTO city
VALUES(
      168,
      "Mongu",
      7
);

INSERT INTO city
VALUES(
      169,
      "Mpika",
      7
);

INSERT INTO city
VALUES(
      170,
      "Chinsali",
      7
);

INSERT INTO city
VALUES(
      171,
      "Livingstone",
      7
);

INSERT INTO city
VALUES(
      172,
      "Choma",
      7
);

INSERT INTO country
VALUES(
      8,
      "Zimbabwe"
);

INSERT INTO city
VALUES(
      173,
      "Plumtree",
      8
);

INSERT INTO city
VALUES(
      174,
      "Kariba",
      8
);

INSERT INTO city
VALUES(
      175,
      "Hwange",
      8
);

INSERT INTO city
VALUES(
      176,
      "Chiredzi",
      8
);

INSERT INTO city
VALUES(
      177,
      "Mazowe",
      8
);

INSERT INTO city
VALUES(
      178,
      "Zvishavane",
      8
);

INSERT INTO city
VALUES(
      179,
      "Shamva",
      8
);

INSERT INTO city
VALUES(
      180,
      "Harare",
      8
);

INSERT INTO city
VALUES(
      181,
      "Kwekwe",
      8
);

INSERT INTO city
VALUES(
      182,
      "Kadoma",
      8
);

INSERT INTO city
VALUES(
      183,
      "Beitbridge",
      8
);

INSERT INTO city
VALUES(
      184,
      "Karoi",
      8
);

INSERT INTO city
VALUES(
      185,
      "Victoria Falls",
      8
);

INSERT INTO city
VALUES(
      186,
      "Chitungwiza",
      8
);

INSERT INTO city
VALUES(
      187,
      "Bindura",
      8
);

INSERT INTO city
VALUES(
      188,
      "Lupane",
      8
);

INSERT INTO city
VALUES(
      189,
      "Marondera",
      8
);

INSERT INTO city
VALUES(
      190,
      "Masvingo",
      8
);

INSERT INTO city
VALUES(
      191,
      "Mutare",
      8
);

INSERT INTO city
VALUES(
      192,
      "Bulawayo",
      8
);

INSERT INTO city
VALUES(
      193,
      "Chinhoyi",
      8
);

INSERT INTO city
VALUES(
      194,
      "Gwanda",
      8
);

INSERT INTO city
VALUES(
      195,
      "Gweru",
      8
);

INSERT INTO country
VALUES(
      9,
      "Kazakhstan"
);

INSERT INTO city
VALUES(
      196,
      "Maqat",
      9
);

INSERT INTO city
VALUES(
      197,
      "Zhangaozen",
      9
);

INSERT INTO city
VALUES(
      198,
      "Taraz",
      9
);

INSERT INTO city
VALUES(
      199,
      "Oral",
      9
);

INSERT INTO city
VALUES(
      200,
      "Balqash",
      9
);

INSERT INTO city
VALUES(
      201,
      "Zaysan",
      9
);

INSERT INTO city
VALUES(
      202,
      "Oytal",
      9
);

INSERT INTO city
VALUES(
      203,
      "Zholymbet",
      9
);

INSERT INTO city
VALUES(
      204,
      "Serebryansk",
      9
);

INSERT INTO city
VALUES(
      205,
      "Chapaev",
      9
);

INSERT INTO city
VALUES(
      206,
      "Ridder",
      9
);

INSERT INTO city
VALUES(
      207,
      "Zhaltyr",
      9
);

INSERT INTO city
VALUES(
      208,
      "Atbasar",
      9
);

INSERT INTO city
VALUES(
      209,
      "Aqsay",
      9
);

INSERT INTO city
VALUES(
      210,
      "Shemonaikha",
      9
);

INSERT INTO city
VALUES(
      211,
      "Atasu",
      9
);

INSERT INTO city
VALUES(
      212,
      "Rudny",
      9
);

INSERT INTO city
VALUES(
      213,
      "Makhambet",
      9
);

INSERT INTO city
VALUES(
      214,
      "Fort Shevchenko",
      9
);

INSERT INTO city
VALUES(
      215,
      "Qusmuryn",
      9
);

INSERT INTO city
VALUES(
      216,
      "Oktyabrsk",
      9
);

INSERT INTO city
VALUES(
      217,
      "Khromtau",
      9
);

INSERT INTO city
VALUES(
      218,
      "Algha",
      9
);

INSERT INTO city
VALUES(
      219,
      "Embi",
      9
);

INSERT INTO city
VALUES(
      220,
      "Ushtobe",
      9
);

INSERT INTO city
VALUES(
      221,
      "Burylbaytal",
      9
);

INSERT INTO city
VALUES(
      222,
      "Zhanibek",
      9
);

INSERT INTO city
VALUES(
      223,
      "Esil",
      9
);

INSERT INTO city
VALUES(
      224,
      "Derzhavinsk",
      9
);

INSERT INTO city
VALUES(
      225,
      "Saryshaghan",
      9
);

INSERT INTO city
VALUES(
      226,
      "Turgay",
      9
);

INSERT INTO city
VALUES(
      227,
      "Sarqan",
      9
);

INSERT INTO city
VALUES(
      228,
      "Arqalyq",
      9
);

INSERT INTO city
VALUES(
      229,
      "Shalqar",
      9
);

INSERT INTO city
VALUES(
      230,
      "Shieli",
      9
);

INSERT INTO city
VALUES(
      231,
      "Bayghanin",
      9
);

INSERT INTO city
VALUES(
      232,
      "Zhezqazghan",
      9
);

INSERT INTO city
VALUES(
      233,
      "Mangyshlak",
      9
);

INSERT INTO city
VALUES(
      234,
      "Zhosaly",
      9
);

INSERT INTO city
VALUES(
      235,
      "Beyneu",
      9
);

INSERT INTO city
VALUES(
      236,
      "Qazaly",
      9
);

INSERT INTO city
VALUES(
      237,
      "Aral",
      9
);

INSERT INTO city
VALUES(
      238,
      "Ayakoz",
      9
);

INSERT INTO city
VALUES(
      239,
      "Urzhar",
      9
);

INSERT INTO city
VALUES(
      240,
      "Qapshaghay",
      9
);

INSERT INTO city
VALUES(
      241,
      "Esik",
      9
);

INSERT INTO city
VALUES(
      242,
      "Qaratau",
      9
);

INSERT INTO city
VALUES(
      243,
      "Sharbaqty",
      9
);

INSERT INTO city
VALUES(
      244,
      "Oostanay",
      9
);

INSERT INTO city
VALUES(
      245,
      "Kachiry",
      9
);

INSERT INTO city
VALUES(
      246,
      "Kishkenekol",
      9
);

INSERT INTO city
VALUES(
      247,
      "Bulaevo",
      9
);

INSERT INTO city
VALUES(
      248,
      "Shonzhy",
      9
);

INSERT INTO city
VALUES(
      249,
      "Qyzylorda",
      9
);

INSERT INTO city
VALUES(
      250,
      "Qaraghandy",
      9
);

INSERT INTO city
VALUES(
      251,
      "Ertis",
      9
);

INSERT INTO city
VALUES(
      252,
      "Tayynsha",
      9
);

INSERT INTO city
VALUES(
      253,
      "Qulan",
      9
);

INSERT INTO city
VALUES(
      254,
      "Shu",
      9
);

INSERT INTO city
VALUES(
      255,
      "Kentau",
      9
);

INSERT INTO city
VALUES(
      256,
      "Oskemen",
      9
);

INSERT INTO city
VALUES(
      257,
      "Aqtau",
      9
);

INSERT INTO city
VALUES(
      258,
      "Taldyqorghan",
      9
);

INSERT INTO city
VALUES(
      259,
      "Astana",
      9
);

INSERT INTO city
VALUES(
      260,
      "Aqtobe",
      9
);

INSERT INTO city
VALUES(
      261,
      "Kokshetau",
      9
);

INSERT INTO city
VALUES(
      262,
      "Petropavlovsk",
      9
);

INSERT INTO city
VALUES(
      263,
      "Pavlodar",
      9
);

INSERT INTO city
VALUES(
      264,
      "Otar",
      9
);

INSERT INTO city
VALUES(
      265,
      "Almaty",
      9
);

INSERT INTO city
VALUES(
      266,
      "Bestobe",
      9
);

INSERT INTO city
VALUES(
      267,
      "Arys",
      9
);

INSERT INTO city
VALUES(
      268,
      "Lenger",
      9
);

INSERT INTO city
VALUES(
      269,
      "Aqsu",
      9
);

INSERT INTO city
VALUES(
      270,
      "Temirtau",
      9
);

INSERT INTO city
VALUES(
      271,
      "Makinsk",
      9
);

INSERT INTO city
VALUES(
      272,
      "Osakarovka",
      9
);

INSERT INTO city
VALUES(
      273,
      "Qarqaraly",
      9
);

INSERT INTO city
VALUES(
      274,
      "Ekibastuz",
      9
);

INSERT INTO city
VALUES(
      275,
      "Zyryanovsk",
      9
);

INSERT INTO city
VALUES(
      276,
      "Komsomolets",
      9
);

INSERT INTO city
VALUES(
      277,
      "Baykonur",
      9
);

INSERT INTO city
VALUES(
      278,
      "Erymentau",
      9
);

INSERT INTO city
VALUES(
      279,
      "Qarazhal",
      9
);

INSERT INTO city
VALUES(
      280,
      "Tobol",
      9
);

INSERT INTO city
VALUES(
      281,
      "Shar",
      9
);

INSERT INTO city
VALUES(
      282,
      "Semey",
      9
);

INSERT INTO city
VALUES(
      283,
      "Boralday",
      9
);

INSERT INTO city
VALUES(
      284,
      "Zhetiqara",
      9
);

INSERT INTO city
VALUES(
      285,
      "Aqadyr",
      9
);

INSERT INTO city
VALUES(
      286,
      "Zharkent",
      9
);

INSERT INTO city
VALUES(
      287,
      "Qulsary",
      9
);

INSERT INTO city
VALUES(
      288,
      "Balyqshy",
      9
);

INSERT INTO city
VALUES(
      289,
      "Atyrau",
      9
);

INSERT INTO city
VALUES(
      290,
      "Shymkent",
      9
);

INSERT INTO city
VALUES(
      291,
      "Turkistan",
      9
);

INSERT INTO country
VALUES(
      10,
      "Laos"
);

INSERT INTO city
VALUES(
      292,
      "Xiangkhoang",
      10
);

INSERT INTO city
VALUES(
      293,
      "Muang Phonsavan",
      10
);

INSERT INTO city
VALUES(
      294,
      "Vientiane",
      10
);

INSERT INTO city
VALUES(
      295,
      "Ban Houayxay",
      10
);

INSERT INTO city
VALUES(
      296,
      "Muang Phon-Hong",
      10
);

INSERT INTO city
VALUES(
      297,
      "Louang Namtha",
      10
);

INSERT INTO city
VALUES(
      298,
      "Phongsali",
      10
);

INSERT INTO city
VALUES(
      299,
      "Thakhek",
      10
);

INSERT INTO city
VALUES(
      300,
      "Muang Pakxan",
      10
);

INSERT INTO city
VALUES(
      301,
      "Louangphrabang",
      10
);

INSERT INTO city
VALUES(
      302,
      "Xaignabouri",
      10
);

INSERT INTO city
VALUES(
      303,
      "Savannakhet",
      10
);

INSERT INTO city
VALUES(
      304,
      "Lamam",
      10
);

INSERT INTO city
VALUES(
      305,
      "Pakxe",
      10
);

INSERT INTO city
VALUES(
      306,
      "Attapu",
      10
);

INSERT INTO city
VALUES(
      307,
      "Xam Nua",
      10
);

INSERT INTO city
VALUES(
      308,
      "Muang Xai",
      10
);

INSERT INTO city
VALUES(
      309,
      "Saravan",
      10
);

INSERT INTO city
VALUES(
      310,
      "Champasak",
      10
);

INSERT INTO country
VALUES(
      11,
      "Lebanon"
);

INSERT INTO city
VALUES(
      311,
      "Beirut",
      11
);

INSERT INTO city
VALUES(
      312,
      "Zahle",
      11
);

INSERT INTO city
VALUES(
      313,
      "Baalbek",
      11
);

INSERT INTO city
VALUES(
      314,
      "Baabda",
      11
);

INSERT INTO city
VALUES(
      315,
      "Halba",
      11
);

INSERT INTO city
VALUES(
      316,
      "Saida",
      11
);

INSERT INTO city
VALUES(
      317,
      "Nabatiye et Tahta",
      11
);

INSERT INTO city
VALUES(
      318,
      "Trablous",
      11
);

INSERT INTO country
VALUES(
      12,
      "Saint Lucia"
);

INSERT INTO city
VALUES(
      319,
      "Castries",
      12
);

INSERT INTO country
VALUES(
      13,
      "Liechtenstein"
);

INSERT INTO city
VALUES(
      320,
      "Gamprin",
      13
);

INSERT INTO city
VALUES(
      321,
      "Triesenberg",
      13
);

INSERT INTO city
VALUES(
      322,
      "Schaan",
      13
);

INSERT INTO city
VALUES(
      323,
      "Ruggell",
      13
);

INSERT INTO city
VALUES(
      324,
      "Mauren",
      13
);

INSERT INTO city
VALUES(
      325,
      "Eschen",
      13
);

INSERT INTO city
VALUES(
      326,
      "Triesen",
      13
);

INSERT INTO city
VALUES(
      327,
      "Balzers",
      13
);

INSERT INTO city
VALUES(
      328,
      "Vaduz",
      13
);

INSERT INTO city
VALUES(
      329,
      "Planken",
      13
);

INSERT INTO city
VALUES(
      330,
      "Schellenberg",
      13
);

INSERT INTO country
VALUES(
      14,
      "Sri Lanka"
);

INSERT INTO city
VALUES(
      331,
      "Colombo",
      14
);

INSERT INTO city
VALUES(
      332,
      "Ratnapura",
      14
);

INSERT INTO city
VALUES(
      333,
      "Matara",
      14
);

INSERT INTO city
VALUES(
      334,
      "Sri Jawewardenepura Kotte",
      14
);

INSERT INTO city
VALUES(
      335,
      "Moratuwa",
      14
);

INSERT INTO city
VALUES(
      336,
      "Anuradhapura",
      14
);

INSERT INTO city
VALUES(
      337,
      "Galle",
      14
);

INSERT INTO city
VALUES(
      338,
      "Puttalan",
      14
);

INSERT INTO city
VALUES(
      339,
      "Kandy",
      14
);

INSERT INTO city
VALUES(
      340,
      "Badulla",
      14
);

INSERT INTO city
VALUES(
      341,
      "Trincomalee",
      14
);

INSERT INTO city
VALUES(
      342,
      "Kilinochchi",
      14
);

INSERT INTO city
VALUES(
      343,
      "Batticaloa",
      14
);

INSERT INTO city
VALUES(
      344,
      "Jaffna",
      14
);

INSERT INTO country
VALUES(
      15,
      "Liberia"
);

INSERT INTO city
VALUES(
      345,
      "Bopolu",
      15
);

INSERT INTO city
VALUES(
      346,
      "Voinjama",
      15
);

INSERT INTO city
VALUES(
      347,
      "Robertsport",
      15
);

INSERT INTO city
VALUES(
      348,
      "Buchanan",
      15
);

INSERT INTO city
VALUES(
      349,
      "Monrovia",
      15
);

INSERT INTO city
VALUES(
      350,
      "Tubmanburg",
      15
);

INSERT INTO city
VALUES(
      351,
      "Buchanan",
      15
);

INSERT INTO city
VALUES(
      352,
      "Zwedru",
      15
);

INSERT INTO city
VALUES(
      353,
      "Barclayville",
      15
);

INSERT INTO city
VALUES(
      354,
      "Rivercess",
      15
);

INSERT INTO city
VALUES(
      355,
      "Fish Town",
      15
);

INSERT INTO city
VALUES(
      356,
      "Gbarnga",
      15
);

INSERT INTO city
VALUES(
      357,
      "Kakata",
      15
);

INSERT INTO city
VALUES(
      358,
      "Sanniquellie",
      15
);

INSERT INTO city
VALUES(
      359,
      "Greenville",
      15
);

INSERT INTO city
VALUES(
      360,
      "Bensonville",
      15
);

INSERT INTO city
VALUES(
      361,
      "Harper",
      15
);

INSERT INTO country
VALUES(
      16,
      "Lesotho"
);

INSERT INTO city
VALUES(
      362,
      "Maseru",
      16
);

INSERT INTO city
VALUES(
      363,
      "Mokhotlong",
      16
);

INSERT INTO city
VALUES(
      364,
      "Thaba-Tseka",
      16
);

INSERT INTO city
VALUES(
      365,
      "Moyeni",
      16
);

INSERT INTO city
VALUES(
      366,
      "Qachaas Nek",
      16
);

INSERT INTO city
VALUES(
      367,
      "Mafetang",
      16
);

INSERT INTO city
VALUES(
      368,
      "Hlotse",
      16
);

INSERT INTO city
VALUES(
      369,
      "Teyateyaneng",
      16
);

INSERT INTO city
VALUES(
      370,
      "Mohales Hoek",
      16
);

INSERT INTO city
VALUES(
      371,
      "Butha-Buthe",
      16
);

INSERT INTO country
VALUES(
      17,
      "Lithuania"
);

INSERT INTO city
VALUES(
      372,
      "Klaipeda",
      17
);

INSERT INTO city
VALUES(
      373,
      "Palanga",
      17
);

INSERT INTO city
VALUES(
      374,
      "Nida",
      17
);

INSERT INTO city
VALUES(
      375,
      "Kretinga",
      17
);

INSERT INTO city
VALUES(
      376,
      "Taurage",
      17
);

INSERT INTO city
VALUES(
      377,
      "Silute",
      17
);

INSERT INTO city
VALUES(
      378,
      "Rietavas",
      17
);

INSERT INTO city
VALUES(
      379,
      "Plunge",
      17
);

INSERT INTO city
VALUES(
      380,
      "Silale",
      17
);

INSERT INTO city
VALUES(
      381,
      "Visaginas",
      17
);

INSERT INTO city
VALUES(
      382,
      "Zarasai",
      17
);

INSERT INTO city
VALUES(
      383,
      "Ignalina",
      17
);

INSERT INTO city
VALUES(
      384,
      "Utena",
      17
);

INSERT INTO city
VALUES(
      385,
      "Svencionys",
      17
);

INSERT INTO city
VALUES(
      386,
      "Rokiskis",
      17
);

INSERT INTO city
VALUES(
      387,
      "Moletai",
      17
);

INSERT INTO city
VALUES(
      388,
      "Salcininkai",
      17
);

INSERT INTO city
VALUES(
      389,
      "Vilnius",
      17
);

INSERT INTO city
VALUES(
      390,
      "Kupiskis",
      17
);

INSERT INTO city
VALUES(
      391,
      "Trakai",
      17
);

INSERT INTO city
VALUES(
      392,
      "Birzai",
      17
);

INSERT INTO city
VALUES(
      393,
      "Anyksciai",
      17
);

INSERT INTO city
VALUES(
      394,
      "Telsiai",
      17
);

INSERT INTO city
VALUES(
      395,
      "Kelme",
      17
);

INSERT INTO city
VALUES(
      396,
      "Marijampole",
      17
);

INSERT INTO city
VALUES(
      397,
      "Lazdijai",
      17
);

INSERT INTO city
VALUES(
      398,
      "Sakiai",
      17
);

INSERT INTO city
VALUES(
      399,
      "Radviliskis",
      17
);

INSERT INTO city
VALUES(
      400,
      "Siauliai",
      17
);

INSERT INTO city
VALUES(
      401,
      "Birstonas",
      17
);

INSERT INTO city
VALUES(
      402,
      "Druskininkai",
      17
);

INSERT INTO city
VALUES(
      403,
      "Kedainiai",
      17
);

INSERT INTO city
VALUES(
      404,
      "Alytus",
      17
);

INSERT INTO city
VALUES(
      405,
      "Prienai",
      17
);

INSERT INTO city
VALUES(
      406,
      "Elektrenai",
      17
);

INSERT INTO city
VALUES(
      407,
      "Kaunas",
      17
);

INSERT INTO city
VALUES(
      408,
      "Jonava",
      17
);

INSERT INTO city
VALUES(
      409,
      "Kaisiadorys",
      17
);

INSERT INTO city
VALUES(
      410,
      "Panevezys",
      17
);

INSERT INTO city
VALUES(
      411,
      "Joniskis",
      17
);

INSERT INTO city
VALUES(
      412,
      "Kazlu Ruda",
      17
);

INSERT INTO city
VALUES(
      413,
      "Vilkaviskis",
      17
);

INSERT INTO city
VALUES(
      414,
      "Pasvalys",
      17
);

INSERT INTO city
VALUES(
      415,
      "Pakruojis",
      17
);

INSERT INTO city
VALUES(
      416,
      "Raseiniai",
      17
);

INSERT INTO city
VALUES(
      417,
      "Pagegiai",
      17
);

INSERT INTO city
VALUES(
      418,
      "Jurbarkas",
      17
);

INSERT INTO city
VALUES(
      419,
      "Kalvarija",
      17
);

INSERT INTO city
VALUES(
      420,
      "Sirvintos",
      17
);

INSERT INTO city
VALUES(
      421,
      "Skuodas",
      17
);

INSERT INTO city
VALUES(
      422,
      "Mazeikiai",
      17
);

INSERT INTO city
VALUES(
      423,
      "Akmene",
      17
);

INSERT INTO city
VALUES(
      424,
      "Ukmerge",
      17
);

INSERT INTO city
VALUES(
      425,
      "Varena",
      17
);

INSERT INTO country
VALUES(
      18,
      "Luxembourg"
);

INSERT INTO city
VALUES(
      426,
      "Capellen",
      18
);

INSERT INTO city
VALUES(
      427,
      "Esch-sur-Alzette",
      18
);

INSERT INTO city
VALUES(
      428,
      "Remich",
      18
);

INSERT INTO city
VALUES(
      429,
      "Echternach",
      18
);

INSERT INTO city
VALUES(
      430,
      "Mersch",
      18
);

INSERT INTO city
VALUES(
      431,
      "Redange-sur-Attert",
      18
);

INSERT INTO city
VALUES(
      432,
      "Vianden",
      18
);

INSERT INTO city
VALUES(
      433,
      "Wiltz",
      18
);

INSERT INTO city
VALUES(
      434,
      "Clervaux",
      18
);

INSERT INTO city
VALUES(
      435,
      "Diekirch",
      18
);

INSERT INTO city
VALUES(
      436,
      "Grevenmacher",
      18
);

INSERT INTO city
VALUES(
      437,
      "Luxembourg",
      18
);

INSERT INTO country
VALUES(
      19,
      "Latvia"
);

INSERT INTO city
VALUES(
      438,
      "Auce",
      19
);

INSERT INTO city
VALUES(
      439,
      "Daugavpils",
      19
);

INSERT INTO city
VALUES(
      440,
      "Jekabpils",
      19
);

INSERT INTO city
VALUES(
      441,
      "Salacgriva",
      19
);

INSERT INTO city
VALUES(
      442,
      "Ventspils",
      19
);

INSERT INTO city
VALUES(
      443,
      "Dundaga",
      19
);

INSERT INTO city
VALUES(
      444,
      "Jaunjelgava",
      19
);

INSERT INTO city
VALUES(
      445,
      "Nereta",
      19
);

INSERT INTO city
VALUES(
      446,
      "Alsunga",
      19
);

INSERT INTO city
VALUES(
      447,
      "Kuldiga",
      19
);

INSERT INTO city
VALUES(
      448,
      "Pavilosta",
      19
);

INSERT INTO city
VALUES(
      449,
      "Pinki",
      19
);

INSERT INTO city
VALUES(
      450,
      "Adazi",
      19
);

INSERT INTO city
VALUES(
      451,
      "Kandava",
      19
);

INSERT INTO city
VALUES(
      452,
      "Roja",
      19
);

INSERT INTO city
VALUES(
      453,
      "Carnikava",
      19
);

INSERT INTO city
VALUES(
      454,
      "Garkalne",
      19
);

INSERT INTO city
VALUES(
      455,
      "Saulkrasti",
      19
);

INSERT INTO city
VALUES(
      456,
      "Smarde",
      19
);

INSERT INTO city
VALUES(
      457,
      "Mersrags",
      19
);

INSERT INTO city
VALUES(
      458,
      "Talsi",
      19
);

INSERT INTO city
VALUES(
      459,
      "Jurmala",
      19
);

INSERT INTO city
VALUES(
      460,
      "Marupe",
      19
);

INSERT INTO city
VALUES(
      461,
      "Ulbroka",
      19
);

INSERT INTO city
VALUES(
      462,
      "Zilupe",
      19
);

INSERT INTO city
VALUES(
      463,
      "Ludza",
      19
);

INSERT INTO city
VALUES(
      464,
      "Dagda",
      19
);

INSERT INTO city
VALUES(
      465,
      "Baltinava",
      19
);

INSERT INTO city
VALUES(
      466,
      "Cibla",
      19
);

INSERT INTO city
VALUES(
      467,
      "Karsava",
      19
);

INSERT INTO city
VALUES(
      468,
      "Riga",
      19
);

INSERT INTO city
VALUES(
      469,
      "Kraslava",
      19
);

INSERT INTO city
VALUES(
      470,
      "Limbazi",
      19
);

INSERT INTO city
VALUES(
      471,
      "Preili",
      19
);

INSERT INTO city
VALUES(
      472,
      "Vecvarkava",
      19
);

INSERT INTO city
VALUES(
      473,
      "Ilukste",
      19
);

INSERT INTO city
VALUES(
      474,
      "Nica",
      19
);

INSERT INTO city
VALUES(
      475,
      "Bauska",
      19
);

INSERT INTO city
VALUES(
      476,
      "Vilaka",
      19
);

INSERT INTO city
VALUES(
      477,
      "Livani",
      19
);

INSERT INTO city
VALUES(
      478,
      "Aluksne",
      19
);

INSERT INTO city
VALUES(
      479,
      "Jaunpils",
      19
);

INSERT INTO city
VALUES(
      480,
      "Broceni",
      19
);

INSERT INTO city
VALUES(
      481,
      "Rugaji",
      19
);

INSERT INTO city
VALUES(
      482,
      "Riebini",
      19
);

INSERT INTO city
VALUES(
      483,
      "Vilani",
      19
);

INSERT INTO city
VALUES(
      484,
      "Varaklani",
      19
);

INSERT INTO city
VALUES(
      485,
      "Ape",
      19
);

INSERT INTO city
VALUES(
      486,
      "Madona",
      19
);

INSERT INTO city
VALUES(
      487,
      "Jaunpiebalga",
      19
);

INSERT INTO city
VALUES(
      488,
      "Lubana",
      19
);

INSERT INTO city
VALUES(
      489,
      "Gulbene",
      19
);

INSERT INTO city
VALUES(
      490,
      "Balvi",
      19
);

INSERT INTO city
VALUES(
      491,
      "Akniste",
      19
);

INSERT INTO city
VALUES(
      492,
      "Viesite",
      19
);

INSERT INTO city
VALUES(
      493,
      "Cesvaine",
      19
);

INSERT INTO city
VALUES(
      494,
      "Kegums",
      19
);

INSERT INTO city
VALUES(
      495,
      "Vecpiebalga",
      19
);

INSERT INTO city
VALUES(
      496,
      "Smiltene",
      19
);

INSERT INTO city
VALUES(
      497,
      "Drabesi",
      19
);

INSERT INTO city
VALUES(
      498,
      "Cesis",
      19
);

INSERT INTO city
VALUES(
      499,
      "Ergli",
      19
);

INSERT INTO city
VALUES(
      500,
      "Valka",
      19
);

INSERT INTO city
VALUES(
      501,
      "Grobina",
      19
);

INSERT INTO city
VALUES(
      502,
      "Strenci",
      19
);

INSERT INTO city
VALUES(
      503,
      "Murmuiza",
      19
);

INSERT INTO city
VALUES(
      504,
      "Mazsalaca",
      19
);

INSERT INTO city
VALUES(
      505,
      "Aloja",
      19
);

INSERT INTO city
VALUES(
      506,
      "Burtnieki",
      19
);

INSERT INTO city
VALUES(
      507,
      "Koknese",
      19
);

INSERT INTO city
VALUES(
      508,
      "Aizkraukle",
      19
);

INSERT INTO city
VALUES(
      509,
      "Skriveri",
      19
);

INSERT INTO city
VALUES(
      510,
      "Baldone",
      19
);

INSERT INTO city
VALUES(
      511,
      "Vecumnieki",
      19
);

INSERT INTO city
VALUES(
      512,
      "Sala",
      19
);

INSERT INTO city
VALUES(
      513,
      "Plavinas",
      19
);

INSERT INTO city
VALUES(
      514,
      "Liepaga",
      19
);

INSERT INTO city
VALUES(
      515,
      "Rujiena",
      19
);

INSERT INTO city
VALUES(
      516,
      "Naukseni",
      19
);

INSERT INTO city
VALUES(
      517,
      "Liegi",
      19
);

INSERT INTO city
VALUES(
      518,
      "Rauna",
      19
);

INSERT INTO city
VALUES(
      519,
      "Aizpute",
      19
);

INSERT INTO city
VALUES(
      520,
      "Koceni",
      19
);

INSERT INTO city
VALUES(
      521,
      "Valmiera",
      19
);

INSERT INTO city
VALUES(
      522,
      "Sigulda",
      19
);

INSERT INTO city
VALUES(
      523,
      "Priekuli",
      19
);

INSERT INTO city
VALUES(
      524,
      "Ogre",
      19
);

INSERT INTO city
VALUES(
      525,
      "Ragana",
      19
);

INSERT INTO city
VALUES(
      526,
      "Loja",
      19
);

INSERT INTO city
VALUES(
      527,
      "Ropazi",
      19
);

INSERT INTO city
VALUES(
      528,
      "Priekule",
      19
);

INSERT INTO city
VALUES(
      529,
      "Iecava",
      19
);

INSERT INTO city
VALUES(
      530,
      "Rucava",
      19
);

INSERT INTO city
VALUES(
      531,
      "Pilsrundale",
      19
);

INSERT INTO city
VALUES(
      532,
      "Salaspils",
      19
);

INSERT INTO city
VALUES(
      533,
      "Ikskile",
      19
);

INSERT INTO city
VALUES(
      534,
      "Lielvarde",
      19
);

INSERT INTO city
VALUES(
      535,
      "Incukalns",
      19
);

INSERT INTO city
VALUES(
      536,
      "Malpils",
      19
);

INSERT INTO city
VALUES(
      537,
      "Olaine",
      19
);

INSERT INTO city
VALUES(
      538,
      "Kekava",
      19
);

INSERT INTO city
VALUES(
      539,
      "Ligatne",
      19
);

INSERT INTO city
VALUES(
      540,
      "Stalbe",
      19
);

INSERT INTO city
VALUES(
      541,
      "Jelgava",
      19
);

INSERT INTO city
VALUES(
      542,
      "Skrunda",
      19
);

INSERT INTO city
VALUES(
      543,
      "Vainode",
      19
);

INSERT INTO city
VALUES(
      544,
      "Saldus",
      19
);

INSERT INTO city
VALUES(
      545,
      "Tukums",
      19
);

INSERT INTO city
VALUES(
      546,
      "Tervete",
      19
);

INSERT INTO city
VALUES(
      547,
      "Dobele",
      19
);

INSERT INTO city
VALUES(
      548,
      "Rezekne",
      19
);

INSERT INTO city
VALUES(
      549,
      "Aglona",
      19
);

INSERT INTO city
VALUES(
      550,
      "Ozolnieki",
      19
);

INSERT INTO country
VALUES(
      20,
      "Libya"
);

INSERT INTO city
VALUES(
      551,
      "Tripoli",
      20
);

INSERT INTO city
VALUES(
      552,
      "Al `Aziziyah",
      20
);

INSERT INTO city
VALUES(
      553,
      "Zuwarah",
      20
);

INSERT INTO city
VALUES(
      554,
      "Al Khums",
      20
);

INSERT INTO city
VALUES(
      555,
      "As Sidr",
      20
);

INSERT INTO city
VALUES(
      556,
      "Ghadamis",
      20
);

INSERT INTO city
VALUES(
      557,
      "Dirj",
      20
);

INSERT INTO city
VALUES(
      558,
      "Nalut",
      20
);

INSERT INTO city
VALUES(
      559,
      "Umm al Abid",
      20
);

INSERT INTO city
VALUES(
      560,
      "Sabha",
      20
);

INSERT INTO city
VALUES(
      561,
      "Birak",
      20
);

INSERT INTO city
VALUES(
      562,
      "Idri",
      20
);

INSERT INTO city
VALUES(
      563,
      "Zillah",
      20
);

INSERT INTO city
VALUES(
      564,
      "Hun",
      20
);

INSERT INTO city
VALUES(
      565,
      "Az Zawiyah",
      20
);

INSERT INTO city
VALUES(
      566,
      "Awjilah",
      20
);

INSERT INTO city
VALUES(
      567,
      "El Agheila",
      20
);

INSERT INTO city
VALUES(
      568,
      "Maradah",
      20
);

INSERT INTO city
VALUES(
      569,
      "Ajdabiya",
      20
);

INSERT INTO city
VALUES(
      570,
      "Darnah",
      20
);

INSERT INTO city
VALUES(
      571,
      "Al Jaghbub",
      20
);

INSERT INTO city
VALUES(
      572,
      "Mizdah",
      20
);

INSERT INTO city
VALUES(
      573,
      "Gharyan",
      20
);

INSERT INTO city
VALUES(
      574,
      "Tubruq",
      20
);

INSERT INTO city
VALUES(
      575,
      "Shahhat",
      20
);

INSERT INTO city
VALUES(
      576,
      "Tajarhi",
      20
);

INSERT INTO city
VALUES(
      577,
      "Al Bayda",
      20
);

INSERT INTO city
VALUES(
      578,
      "Ghat",
      20
);

INSERT INTO city
VALUES(
      579,
      "Tmassah",
      20
);

INSERT INTO city
VALUES(
      580,
      "Marzuq",
      20
);

INSERT INTO city
VALUES(
      581,
      "Al Marj",
      20
);

INSERT INTO city
VALUES(
      582,
      "Surt",
      20
);

INSERT INTO city
VALUES(
      583,
      "Bani Walid",
      20
);

INSERT INTO city
VALUES(
      584,
      "Awbari",
      20
);

INSERT INTO city
VALUES(
      585,
      "Al Jawf",
      20
);

INSERT INTO city
VALUES(
      586,
      "Al Kufrah",
      20
);

INSERT INTO city
VALUES(
      587,
      "Qaminis",
      20
);

INSERT INTO city
VALUES(
      588,
      "Banghazi",
      20
);

INSERT INTO city
VALUES(
      589,
      "Misratah",
      20
);

INSERT INTO country
VALUES(
      21,
      "Morocco"
);

INSERT INTO city
VALUES(
      590,
      "Kenitra",
      21
);

INSERT INTO city
VALUES(
      591,
      "Goulimine",
      21
);

INSERT INTO city
VALUES(
      592,
      "Fez",
      21
);

INSERT INTO city
VALUES(
      593,
      "Casablanca",
      21
);

INSERT INTO city
VALUES(
      594,
      "Agadir",
      21
);

INSERT INTO city
VALUES(
      595,
      "Beni Mellal",
      21
);

INSERT INTO city
VALUES(
      596,
      "Tangier",
      21
);

INSERT INTO city
VALUES(
      597,
      "Settat",
      21
);

INSERT INTO city
VALUES(
      598,
      "Oujda",
      21
);

INSERT INTO city
VALUES(
      599,
      "Meknes",
      21
);

INSERT INTO city
VALUES(
      600,
      "Rabat",
      21
);

INSERT INTO city
VALUES(
      601,
      "Marrakesh",
      21
);

INSERT INTO city
VALUES(
      602,
      "El Jadida",
      21
);

INSERT INTO city
VALUES(
      603,
      "Er Rachidia",
      21
);

INSERT INTO city
VALUES(
      604,
      "Tan Tan",
      21
);

INSERT INTO city
VALUES(
      605,
      "Taza",
      21
);

INSERT INTO city
VALUES(
      606,
      "Larache",
      21
);

INSERT INTO city
VALUES(
      607,
      "Ksar El Kebir",
      21
);

INSERT INTO city
VALUES(
      608,
      "Safi",
      21
);

INSERT INTO city
VALUES(
      609,
      "Tiznit",
      21
);

INSERT INTO city
VALUES(
      610,
      "Ouezzane",
      21
);

INSERT INTO country
VALUES(
      22,
      "Monaco"
);

INSERT INTO city
VALUES(
      611,
      "Monaco",
      22
);

INSERT INTO country
VALUES(
      23,
      "Moldova"
);

INSERT INTO city
VALUES(
      612,
      "Leova",
      23
);

INSERT INTO city
VALUES(
      613,
      "Rezina",
      23
);

INSERT INTO city
VALUES(
      614,
      "Causeni",
      23
);

INSERT INTO city
VALUES(
      615,
      "Riscani",
      23
);

INSERT INTO city
VALUES(
      616,
      "Singerei",
      23
);

INSERT INTO city
VALUES(
      617,
      "Falesti",
      23
);

INSERT INTO city
VALUES(
      618,
      "Floresti",
      23
);

INSERT INTO city
VALUES(
      619,
      "Soldanesti",
      23
);

INSERT INTO city
VALUES(
      620,
      "Stefan Voda",
      23
);

INSERT INTO city
VALUES(
      621,
      "Orhei",
      23
);

INSERT INTO city
VALUES(
      622,
      "Comrat",
      23
);

INSERT INTO city
VALUES(
      623,
      "Cimislia",
      23
);

INSERT INTO city
VALUES(
      624,
      "Cantemir",
      23
);

INSERT INTO city
VALUES(
      625,
      "Basarabeasca",
      23
);

INSERT INTO city
VALUES(
      626,
      "Edinet",
      23
);

INSERT INTO city
VALUES(
      627,
      "Ocnita",
      23
);

INSERT INTO city
VALUES(
      628,
      "Drochia",
      23
);

INSERT INTO city
VALUES(
      629,
      "Donduseni",
      23
);

INSERT INTO city
VALUES(
      630,
      "Briceni",
      23
);

INSERT INTO city
VALUES(
      631,
      "Ialoveni",
      23
);

INSERT INTO city
VALUES(
      632,
      "Balti",
      23
);

INSERT INTO city
VALUES(
      633,
      "Criuleni",
      23
);

INSERT INTO city
VALUES(
      634,
      "Bender",
      23
);

INSERT INTO city
VALUES(
      635,
      "Anenii Noi",
      23
);

INSERT INTO city
VALUES(
      636,
      "Cahul",
      23
);

INSERT INTO city
VALUES(
      637,
      "Chisinau",
      23
);

INSERT INTO city
VALUES(
      638,
      "Straseni",
      23
);

INSERT INTO city
VALUES(
      639,
      "Tiraspol",
      23
);

INSERT INTO city
VALUES(
      640,
      "Telenesti",
      23
);

INSERT INTO city
VALUES(
      641,
      "Taraclia",
      23
);

INSERT INTO city
VALUES(
      642,
      "Dubasari",
      23
);

INSERT INTO city
VALUES(
      643,
      "Cocieri",
      23
);

INSERT INTO city
VALUES(
      644,
      "Calarasi",
      23
);

INSERT INTO city
VALUES(
      645,
      "Glodeni",
      23
);

INSERT INTO city
VALUES(
      646,
      "Hincesti",
      23
);

INSERT INTO city
VALUES(
      647,
      "Nisporeni",
      23
);

INSERT INTO city
VALUES(
      648,
      "Soroca",
      23
);

INSERT INTO city
VALUES(
      649,
      "Ungheni",
      23
);

INSERT INTO country
VALUES(
      24,
      "Montenegro"
);

INSERT INTO city
VALUES(
      650,
      "Berane",
      24
);

INSERT INTO city
VALUES(
      651,
      "Plav",
      24
);

INSERT INTO city
VALUES(
      652,
      "Andrijevica",
      24
);

INSERT INTO city
VALUES(
      653,
      "Petnjica",
      24
);

INSERT INTO city
VALUES(
      654,
      "Gusinje",
      24
);

INSERT INTO city
VALUES(
      655,
      "Kolasin",
      24
);

INSERT INTO city
VALUES(
      656,
      "Podgorica",
      24
);

INSERT INTO city
VALUES(
      657,
      "Bijelo Polje",
      24
);

INSERT INTO city
VALUES(
      658,
      "Bar",
      24
);

INSERT INTO city
VALUES(
      659,
      "Budva",
      24
);

INSERT INTO city
VALUES(
      660,
      "Cetinje",
      24
);

INSERT INTO city
VALUES(
      661,
      "Danilovgrad",
      24
);

INSERT INTO city
VALUES(
      662,
      "Herceg-Novi",
      24
);

INSERT INTO city
VALUES(
      663,
      "Kotor",
      24
);

INSERT INTO city
VALUES(
      664,
      "Mojkovac",
      24
);

INSERT INTO city
VALUES(
      665,
      "Niksic",
      24
);

INSERT INTO city
VALUES(
      666,
      "Pluzine",
      24
);

INSERT INTO city
VALUES(
      667,
      "Pljevlja",
      24
);

INSERT INTO city
VALUES(
      668,
      "Rozaje",
      24
);

INSERT INTO city
VALUES(
      669,
      "Savnik",
      24
);

INSERT INTO city
VALUES(
      670,
      "Tivat",
      24
);

INSERT INTO city
VALUES(
      671,
      "Ulcinj",
      24
);

INSERT INTO city
VALUES(
      672,
      "Zabljak",
      24
);

INSERT INTO country
VALUES(
      25,
      "Saint Martin"
);

INSERT INTO city
VALUES(
      673,
      "Marigot",
      25
);

INSERT INTO country
VALUES(
      26,
      "Madagascar"
);

INSERT INTO city
VALUES(
      674,
      "Antananarivo",
      26
);

INSERT INTO city
VALUES(
      675,
      "Toamasina",
      26
);

INSERT INTO city
VALUES(
      676,
      "Antalaha",
      26
);

INSERT INTO city
VALUES(
      677,
      "Maroantsetra",
      26
);

INSERT INTO city
VALUES(
      678,
      "Mandritsara",
      26
);

INSERT INTO city
VALUES(
      679,
      "Besalampy",
      26
);

INSERT INTO city
VALUES(
      680,
      "Marovoay",
      26
);

INSERT INTO city
VALUES(
      681,
      "Andoany",
      26
);

INSERT INTO city
VALUES(
      682,
      "Mahajanga",
      26
);

INSERT INTO city
VALUES(
      683,
      "Ambanja",
      26
);

INSERT INTO city
VALUES(
      684,
      "Antsiranana",
      26
);

INSERT INTO city
VALUES(
      685,
      "Miandrivazo",
      26
);

INSERT INTO city
VALUES(
      686,
      "Mananjary",
      26
);

INSERT INTO city
VALUES(
      687,
      "Morombe",
      26
);

INSERT INTO city
VALUES(
      688,
      "Toliara",
      26
);

INSERT INTO city
VALUES(
      689,
      "Manja",
      26
);

INSERT INTO city
VALUES(
      690,
      "Fianarantsoa",
      26
);

INSERT INTO city
VALUES(
      691,
      "Androka",
      26
);

INSERT INTO city
VALUES(
      692,
      "Bekiy",
      26
);

INSERT INTO city
VALUES(
      693,
      "Antsirabe",
      26
);

INSERT INTO city
VALUES(
      694,
      "Antsohihy",
      26
);

INSERT INTO city
VALUES(
      695,
      "Maintirano",
      26
);

INSERT INTO city
VALUES(
      696,
      "Ambatondrazaka",
      26
);

INSERT INTO city
VALUES(
      697,
      "Farafangana",
      26
);

INSERT INTO city
VALUES(
      698,
      "Ihosy",
      26
);

INSERT INTO city
VALUES(
      699,
      "Morondava",
      26
);

INSERT INTO city
VALUES(
      700,
      "Tolanaro",
      26
);

INSERT INTO city
VALUES(
      701,
      "Sambava",
      26
);

INSERT INTO country
VALUES(
      27,
      "Marshall Islands"
);

INSERT INTO city
VALUES(
      702,
      "Majuro",
      27
);

INSERT INTO country
VALUES(
      28,
      "Macedonia"
);

INSERT INTO city
VALUES(
      703,
      "Vevcani",
      28
);

INSERT INTO city
VALUES(
      704,
      "Kocani",
      28
);

INSERT INTO city
VALUES(
      705,
      "Staro Nagoricane",
      28
);

INSERT INTO city
VALUES(
      706,
      "Radovis",
      28
);

INSERT INTO city
VALUES(
      707,
      "Sopiste",
      28
);

INSERT INTO city
VALUES(
      708,
      "Petrovec",
      28
);

INSERT INTO city
VALUES(
      709,
      "Bosilovo",
      28
);

INSERT INTO city
VALUES(
      710,
      "Zrnovci",
      28
);

INSERT INTO city
VALUES(
      711,
      "Gradsko",
      28
);

INSERT INTO city
VALUES(
      712,
      "Lipkovo",
      28
);

INSERT INTO city
VALUES(
      713,
      "Lozovo",
      28
);

INSERT INTO city
VALUES(
      714,
      "Plasnica",
      28
);

INSERT INTO city
VALUES(
      715,
      "Aracinovo",
      28
);

INSERT INTO city
VALUES(
      716,
      "Studenicani",
      28
);

INSERT INTO city
VALUES(
      717,
      "Resen",
      28
);

INSERT INTO city
VALUES(
      718,
      "Bogovinje",
      28
);

INSERT INTO city
VALUES(
      719,
      "Vinica",
      28
);

INSERT INTO city
VALUES(
      720,
      "Belcista",
      28
);

INSERT INTO city
VALUES(
      721,
      "Mogila",
      28
);

INSERT INTO city
VALUES(
      722,
      "Veles",
      28
);

INSERT INTO city
VALUES(
      723,
      "Kavadarci",
      28
);

INSERT INTO city
VALUES(
      724,
      "Kumanovo",
      28
);

INSERT INTO city
VALUES(
      725,
      "Ohrid",
      28
);

INSERT INTO city
VALUES(
      726,
      "Strumica",
      28
);

INSERT INTO city
VALUES(
      727,
      "Makedonski Brod",
      28
);

INSERT INTO city
VALUES(
      728,
      "Rostusa",
      28
);

INSERT INTO city
VALUES(
      729,
      "Struga",
      28
);

INSERT INTO city
VALUES(
      730,
      "Cucer-Sandevo",
      28
);

INSERT INTO city
VALUES(
      731,
      "Novo Selo",
      28
);

INSERT INTO city
VALUES(
      732,
      "Zelenikovo",
      28
);

INSERT INTO city
VALUES(
      733,
      "Star Dojran",
      28
);

INSERT INTO city
VALUES(
      734,
      "Skopje",
      28
);

INSERT INTO city
VALUES(
      735,
      "Stip",
      28
);

INSERT INTO city
VALUES(
      736,
      "Makedonska Kamenica",
      28
);

INSERT INTO city
VALUES(
      737,
      "Ilinden",
      28
);

INSERT INTO city
VALUES(
      738,
      "Demir Hisar",
      28
);

INSERT INTO city
VALUES(
      739,
      "Zelino",
      28
);

INSERT INTO city
VALUES(
      740,
      "Prilep",
      28
);

INSERT INTO city
VALUES(
      741,
      "Bitola",
      28
);

INSERT INTO city
VALUES(
      742,
      "Krivogastani",
      28
);

INSERT INTO city
VALUES(
      743,
      "Krusevo",
      28
);

INSERT INTO city
VALUES(
      744,
      "Vasilevo",
      28
);

INSERT INTO city
VALUES(
      745,
      "Gostivar",
      28
);

INSERT INTO city
VALUES(
      746,
      "Vrapciste",
      28
);

INSERT INTO city
VALUES(
      747,
      "Novaci",
      28
);

INSERT INTO city
VALUES(
      748,
      "Caska",
      28
);

INSERT INTO city
VALUES(
      749,
      "Kratovo",
      28
);

INSERT INTO city
VALUES(
      750,
      "Probistip",
      28
);

INSERT INTO city
VALUES(
      751,
      "Debar",
      28
);

INSERT INTO city
VALUES(
      752,
      "Centar Zupa",
      28
);

INSERT INTO city
VALUES(
      753,
      "Rosoman",
      28
);

INSERT INTO city
VALUES(
      754,
      "Jegunovce",
      28
);

INSERT INTO city
VALUES(
      755,
      "Demir Kapija",
      28
);

INSERT INTO city
VALUES(
      756,
      "Negotino",
      28
);

INSERT INTO city
VALUES(
      757,
      "Konce",
      28
);

INSERT INTO city
VALUES(
      758,
      "Dolneni",
      28
);

INSERT INTO city
VALUES(
      759,
      "Sveti Nikole",
      28
);

INSERT INTO city
VALUES(
      760,
      "Valandovo",
      28
);

INSERT INTO city
VALUES(
      761,
      "Kicevo",
      28
);

INSERT INTO city
VALUES(
      762,
      "Delcevo",
      28
);

INSERT INTO city
VALUES(
      763,
      "Tetovo",
      28
);

INSERT INTO city
VALUES(
      764,
      "Cesinovo",
      28
);

INSERT INTO city
VALUES(
      765,
      "Karbinci",
      28
);

INSERT INTO city
VALUES(
      766,
      "Tearce",
      28
);

INSERT INTO city
VALUES(
      767,
      "Kriva Palanka",
      28
);

INSERT INTO city
VALUES(
      768,
      "Rankovce",
      28
);

INSERT INTO city
VALUES(
      769,
      "Pehcevo",
      28
);

INSERT INTO city
VALUES(
      770,
      "Gevgelija",
      28
);

INSERT INTO city
VALUES(
      771,
      "Bogdanci",
      28
);

INSERT INTO city
VALUES(
      772,
      "Berovo",
      28
);

INSERT INTO city
VALUES(
      773,
      "Brvenica",
      28
);

INSERT INTO country
VALUES(
      29,
      "Mali"
);

INSERT INTO city
VALUES(
      774,
      "Aguelhok",
      29
);

INSERT INTO city
VALUES(
      775,
      "Bamako",
      29
);

INSERT INTO city
VALUES(
      776,
      "Kidal",
      29
);

INSERT INTO city
VALUES(
      777,
      "Bourem",
      29
);

INSERT INTO city
VALUES(
      778,
      "Mopti",
      29
);

INSERT INTO city
VALUES(
      779,
      "Gao",
      29
);

INSERT INTO city
VALUES(
      780,
      "Satadougou",
      29
);

INSERT INTO city
VALUES(
      781,
      "Koulikoro",
      29
);

INSERT INTO city
VALUES(
      782,
      "Sikasso",
      29
);

INSERT INTO city
VALUES(
      783,
      "Araouane",
      29
);

INSERT INTO city
VALUES(
      784,
      "Segou",
      29
);

INSERT INTO city
VALUES(
      785,
      "Timbuktu",
      29
);

INSERT INTO city
VALUES(
      786,
      "Markala",
      29
);

INSERT INTO city
VALUES(
      787,
      "Taoudenni",
      29
);

INSERT INTO city
VALUES(
      788,
      "Kayes",
      29
);

INSERT INTO city
VALUES(
      789,
      "Sokolo",
      29
);

INSERT INTO city
VALUES(
      790,
      "Kita",
      29
);

INSERT INTO city
VALUES(
      791,
      "Nara",
      29
);

INSERT INTO city
VALUES(
      792,
      "Kati",
      29
);

INSERT INTO city
VALUES(
      793,
      "Kangaba",
      29
);

INSERT INTO city
VALUES(
      794,
      "San",
      29
);

INSERT INTO city
VALUES(
      795,
      "Bougouni",
      29
);

INSERT INTO city
VALUES(
      796,
      "Koutiala",
      29
);

INSERT INTO city
VALUES(
      797,
      "Djenne",
      29
);

INSERT INTO city
VALUES(
      798,
      "Yelimane",
      29
);

INSERT INTO city
VALUES(
      799,
      "Bafoulabe",
      29
);

INSERT INTO city
VALUES(
      800,
      "Nioro du Sahel",
      29
);

INSERT INTO city
VALUES(
      801,
      "Goundam",
      29
);

INSERT INTO city
VALUES(
      802,
      "Menaka",
      29
);

INSERT INTO city
VALUES(
      803,
      "Tessalit",
      29
);

INSERT INTO city
VALUES(
      804,
      "Banamba",
      29
);

INSERT INTO country
VALUES(
      30,
      "Burma"
);

INSERT INTO city
VALUES(
      805,
      "Rangoon",
      30
);

INSERT INTO city
VALUES(
      806,
      "Allanmyo",
      30
);

INSERT INTO city
VALUES(
      807,
      "Mudon",
      30
);

INSERT INTO city
VALUES(
      808,
      "Mawlamyine",
      30
);

INSERT INTO city
VALUES(
      809,
      "Phyarpon",
      30
);

INSERT INTO city
VALUES(
      810,
      "Labutta",
      30
);

INSERT INTO city
VALUES(
      811,
      "Dawei",
      30
);

INSERT INTO city
VALUES(
      812,
      "Myeik",
      30
);

INSERT INTO city
VALUES(
      813,
      "Ye",
      30
);

INSERT INTO city
VALUES(
      814,
      "Namtu",
      30
);

INSERT INTO city
VALUES(
      815,
      "Hinthada",
      30
);

INSERT INTO city
VALUES(
      816,
      "Thongwa",
      30
);

INSERT INTO city
VALUES(
      817,
      "Bago",
      30
);

INSERT INTO city
VALUES(
      818,
      "Pathein",
      30
);

INSERT INTO city
VALUES(
      819,
      "Yandoon",
      30
);

INSERT INTO city
VALUES(
      820,
      "Wakema",
      30
);

INSERT INTO city
VALUES(
      821,
      "Pyay",
      30
);

INSERT INTO city
VALUES(
      822,
      "Chauk",
      30
);

INSERT INTO city
VALUES(
      823,
      "Myitkyina",
      30
);

INSERT INTO city
VALUES(
      824,
      "Monywa",
      30
);

INSERT INTO city
VALUES(
      825,
      "Naypyidaw",
      30
);

INSERT INTO city
VALUES(
      826,
      "Loikaw",
      30
);

INSERT INTO city
VALUES(
      827,
      "Yaynangyoung",
      30
);

INSERT INTO city
VALUES(
      828,
      "Kyaukphyu",
      30
);

INSERT INTO city
VALUES(
      829,
      "Magway",
      30
);

INSERT INTO city
VALUES(
      830,
      "Shwebo",
      30
);

INSERT INTO city
VALUES(
      831,
      "Sagaing",
      30
);

INSERT INTO city
VALUES(
      832,
      "Myingyan",
      30
);

INSERT INTO city
VALUES(
      833,
      "Pakokku",
      30
);

INSERT INTO city
VALUES(
      834,
      "Mandalay",
      30
);

INSERT INTO city
VALUES(
      835,
      "Taunggyi",
      30
);

INSERT INTO city
VALUES(
      836,
      "Pyu",
      30
);

INSERT INTO city
VALUES(
      837,
      "Taungoo",
      30
);

INSERT INTO city
VALUES(
      838,
      "Letpadan",
      30
);

INSERT INTO city
VALUES(
      839,
      "Sittwe",
      30
);

INSERT INTO city
VALUES(
      840,
      "Pa-an",
      30
);

INSERT INTO city
VALUES(
      841,
      "Hakha",
      30
);

INSERT INTO country
VALUES(
      31,
      "Mongolia"
);

INSERT INTO city
VALUES(
      842,
      "Olgiy",
      31
);

INSERT INTO city
VALUES(
      843,
      "Mandalgovi",
      31
);

INSERT INTO city
VALUES(
      844,
      "Ulaanbaatar",
      31
);

INSERT INTO city
VALUES(
      845,
      "Moron",
      31
);

INSERT INTO city
VALUES(
      846,
      "Darhan",
      31
);

INSERT INTO city
VALUES(
      847,
      "Erdenet",
      31
);

INSERT INTO city
VALUES(
      848,
      "Uliastay",
      31
);

INSERT INTO city
VALUES(
      849,
      "Choyr",
      31
);

INSERT INTO city
VALUES(
      850,
      "Altay",
      31
);

INSERT INTO city
VALUES(
      851,
      "Buyant-Uhaa",
      31
);

INSERT INTO city
VALUES(
      852,
      "Choybalsan",
      31
);

INSERT INTO city
VALUES(
      853,
      "Ulaangom",
      31
);

INSERT INTO city
VALUES(
      854,
      "Bulgan",
      31
);

INSERT INTO city
VALUES(
      855,
      "Arvayheer",
      31
);

INSERT INTO city
VALUES(
      856,
      "Tsetserleg",
      31
);

INSERT INTO city
VALUES(
      857,
      "Bayankhongor",
      31
);

INSERT INTO city
VALUES(
      858,
      "Darhan",
      31
);

INSERT INTO city
VALUES(
      859,
      "Dzuunharaa",
      31
);

INSERT INTO city
VALUES(
      860,
      "Dzuunmod",
      31
);

INSERT INTO city
VALUES(
      861,
      "Ondorhaan",
      31
);

INSERT INTO city
VALUES(
      862,
      "Dalandzadgad",
      31
);

INSERT INTO city
VALUES(
      863,
      "Ulaan-Uul",
      31
);

INSERT INTO city
VALUES(
      864,
      "Hodrogo",
      31
);

INSERT INTO city
VALUES(
      865,
      "Baruun Urt",
      31
);

INSERT INTO city
VALUES(
      866,
      "Suchboatar",
      31
);

INSERT INTO city
VALUES(
      867,
      "Dund-Us",
      31
);

INSERT INTO city
VALUES(
      868,
      "Dalandzadgad",
      31
);

INSERT INTO country
VALUES(
      32,
      "Macau"
);

INSERT INTO city
VALUES(
      869,
      "Macau",
      32
);

INSERT INTO country
VALUES(
      33,
      "Martinique"
);

INSERT INTO city
VALUES(
      870,
      "Fort-de-France",
      33
);

INSERT INTO country
VALUES(
      34,
      "Mauritania"
);

INSERT INTO city
VALUES(
      871,
      "Bogue",
      34
);

INSERT INTO city
VALUES(
      872,
      "Chegga",
      34
);

INSERT INTO city
VALUES(
      873,
      "Boutilimit",
      34
);

INSERT INTO city
VALUES(
      874,
      "Timbedra",
      34
);

INSERT INTO city
VALUES(
      875,
      "Bir Mogrein",
      34
);

INSERT INTO city
VALUES(
      876,
      "Fderik",
      34
);

INSERT INTO city
VALUES(
      877,
      "Selibaby",
      34
);

INSERT INTO city
VALUES(
      878,
      "Aleg",
      34
);

INSERT INTO city
VALUES(
      879,
      "Akjoujt",
      34
);

INSERT INTO city
VALUES(
      880,
      "Kiffa",
      34
);

INSERT INTO city
VALUES(
      881,
      "Nema",
      34
);

INSERT INTO city
VALUES(
      882,
      "Nouadhibou",
      34
);

INSERT INTO city
VALUES(
      883,
      "Rosso",
      34
);

INSERT INTO city
VALUES(
      884,
      "Tidjikdja",
      34
);

INSERT INTO city
VALUES(
      885,
      "Atar",
      34
);

INSERT INTO city
VALUES(
      886,
      "Kaedi",
      34
);

INSERT INTO city
VALUES(
      887,
      "Zouirat",
      34
);

INSERT INTO city
VALUES(
      888,
      "Arafat",
      34
);

INSERT INTO city
VALUES(
      889,
      "Dar Naim",
      34
);

INSERT INTO city
VALUES(
      890,
      "Tevragh Zeina",
      34
);

INSERT INTO city
VALUES(
      891,
      "Nouakchott",
      34
);

INSERT INTO city
VALUES(
      892,
      "Ayoun el Atrous",
      34
);

INSERT INTO country
VALUES(
      35,
      "Montserrat"
);

INSERT INTO city
VALUES(
      893,
      "Plymouth",
      35
);

INSERT INTO country
VALUES(
      36,
      "Malta"
);

INSERT INTO city
VALUES(
      894,
      "Birzebbuga",
      36
);

INSERT INTO city
VALUES(
      895,
      "Marsaskala",
      36
);

INSERT INTO city
VALUES(
      896,
      "Marsaxlokk",
      36
);

INSERT INTO city
VALUES(
      897,
      "Kirkop",
      36
);

INSERT INTO city
VALUES(
      898,
      "Pieta",
      36
);

INSERT INTO city
VALUES(
      899,
      "Zejtun",
      36
);

INSERT INTO city
VALUES(
      900,
      "Attard",
      36
);

INSERT INTO city
VALUES(
      901,
      "Pembroke",
      36
);

INSERT INTO city
VALUES(
      902,
      "Zebbug",
      36
);

INSERT INTO city
VALUES(
      903,
      "Taa Xbiex",
      36
);

INSERT INTO city
VALUES(
      904,
      "Sliema",
      36
);

INSERT INTO city
VALUES(
      905,
      "San Lawrenz",
      36
);

INSERT INTO city
VALUES(
      906,
      "Imqabba",
      36
);

INSERT INTO city
VALUES(
      907,
      "Imdina",
      36
);

INSERT INTO city
VALUES(
      908,
      "Qala",
      36
);

INSERT INTO city
VALUES(
      909,
      "Imtarfa",
      36
);

INSERT INTO city
VALUES(
      910,
      "Zurrieq",
      36
);

INSERT INTO city
VALUES(
      911,
      "Gudja",
      36
);

INSERT INTO city
VALUES(
      912,
      "Sannat",
      36
);

INSERT INTO city
VALUES(
      913,
      "Valletta",
      36
);

INSERT INTO city
VALUES(
      914,
      "Zabbar",
      36
);

INSERT INTO city
VALUES(
      915,
      "Luqa",
      36
);

INSERT INTO city
VALUES(
      916,
      "Qormi",
      36
);

INSERT INTO city
VALUES(
      917,
      "Imgarr",
      36
);

INSERT INTO city
VALUES(
      918,
      "Saint Paulas Bay",
      36
);

INSERT INTO city
VALUES(
      919,
      "Qrendi",
      36
);

INSERT INTO city
VALUES(
      920,
      "Munxar",
      36
);

INSERT INTO city
VALUES(
      921,
      "Hamrun",
      36
);

INSERT INTO city
VALUES(
      922,
      "Naxxar",
      36
);

INSERT INTO city
VALUES(
      923,
      "Ghaxaq",
      36
);

INSERT INTO city
VALUES(
      924,
      "Ghasri",
      36
);

INSERT INTO city
VALUES(
      925,
      "Victoria",
      36
);

INSERT INTO city
VALUES(
      926,
      "Iklin",
      36
);

INSERT INTO city
VALUES(
      927,
      "Gharghur",
      36
);

INSERT INTO city
VALUES(
      928,
      "Dingli",
      36
);

INSERT INTO city
VALUES(
      929,
      "Siggiewi",
      36
);

INSERT INTO city
VALUES(
      930,
      "Xewkija",
      36
);

INSERT INTO city
VALUES(
      931,
      "Lija",
      36
);

INSERT INTO city
VALUES(
      932,
      "Safi",
      36
);

INSERT INTO city
VALUES(
      933,
      "Senglea",
      36
);

INSERT INTO city
VALUES(
      934,
      "Xaghra",
      36
);

INSERT INTO city
VALUES(
      935,
      "Xghajra",
      36
);

INSERT INTO city
VALUES(
      936,
      "Zebbug",
      36
);

INSERT INTO city
VALUES(
      937,
      "Gzira",
      36
);

INSERT INTO city
VALUES(
      938,
      "Imsida",
      36
);

INSERT INTO city
VALUES(
      939,
      "Kalkara",
      36
);

INSERT INTO city
VALUES(
      940,
      "Kercem",
      36
);

INSERT INTO city
VALUES(
      941,
      "Mellieha",
      36
);

INSERT INTO city
VALUES(
      942,
      "Mosta",
      36
);

INSERT INTO city
VALUES(
      943,
      "Nadur",
      36
);

INSERT INTO city
VALUES(
      944,
      "Paola",
      36
);

INSERT INTO city
VALUES(
      945,
      "Rabat",
      36
);

INSERT INTO city
VALUES(
      946,
      "Marsa",
      36
);

INSERT INTO city
VALUES(
      947,
      "San Giljan",
      36
);

INSERT INTO city
VALUES(
      948,
      "San Gwann",
      36
);

INSERT INTO city
VALUES(
      949,
      "Santa Lucija",
      36
);

INSERT INTO city
VALUES(
      950,
      "Santa Venera",
      36
);

INSERT INTO city
VALUES(
      951,
      "Swieqi",
      36
);

INSERT INTO city
VALUES(
      952,
      "Tarxien",
      36
);

INSERT INTO city
VALUES(
      953,
      "Balzan",
      36
);

INSERT INTO city
VALUES(
      954,
      "Vittoriosa",
      36
);

INSERT INTO city
VALUES(
      955,
      "Birkirkara",
      36
);

INSERT INTO city
VALUES(
      956,
      "Cospicua",
      36
);

INSERT INTO city
VALUES(
      957,
      "Fgura",
      36
);

INSERT INTO city
VALUES(
      958,
      "Floriana",
      36
);

INSERT INTO city
VALUES(
      959,
      "Fontana",
      36
);

INSERT INTO city
VALUES(
      960,
      "Ghajnsielem",
      36
);

INSERT INTO city
VALUES(
      961,
      "Gharb",
      36
);

INSERT INTO country
VALUES(
      37,
      "Mauritius"
);

INSERT INTO city
VALUES(
      962,
      "Port Louis",
      37
);

INSERT INTO city
VALUES(
      963,
      "Curepipe",
      37
);

INSERT INTO country
VALUES(
      38,
      "Maldives"
);

INSERT INTO city
VALUES(
      964,
      "Male",
      38
);

INSERT INTO city
VALUES(
      965,
      "Eydhafushi",
      38
);

INSERT INTO city
VALUES(
      966,
      "Felidhoo",
      38
);

INSERT INTO city
VALUES(
      967,
      "Funadhoo",
      38
);

INSERT INTO city
VALUES(
      968,
      "Hithadhoo",
      38
);

INSERT INTO city
VALUES(
      969,
      "Kudahuvadhoo",
      38
);

INSERT INTO city
VALUES(
      970,
      "Kulhudhuffushi",
      38
);

INSERT INTO city
VALUES(
      971,
      "Mahibadhoo",
      38
);

INSERT INTO city
VALUES(
      972,
      "Manadhoo",
      38
);

INSERT INTO city
VALUES(
      973,
      "Muli",
      38
);

INSERT INTO city
VALUES(
      974,
      "Naifaru",
      38
);

INSERT INTO city
VALUES(
      975,
      "Thinadhoo",
      38
);

INSERT INTO city
VALUES(
      976,
      "Unagoofaaru",
      38
);

INSERT INTO city
VALUES(
      977,
      "Veymandoo",
      38
);

INSERT INTO city
VALUES(
      978,
      "Fonadhoo",
      38
);

INSERT INTO city
VALUES(
      979,
      "Rasdhoo",
      38
);

INSERT INTO city
VALUES(
      980,
      "Thulusdhoo",
      38
);

INSERT INTO city
VALUES(
      981,
      "Dhihdhoo",
      38
);

INSERT INTO city
VALUES(
      982,
      "Foammulah",
      38
);

INSERT INTO city
VALUES(
      983,
      "Viligili",
      38
);

INSERT INTO city
VALUES(
      984,
      "Nilandhoo",
      38
);

INSERT INTO country
VALUES(
      39,
      "Malawi"
);

INSERT INTO city
VALUES(
      985,
      "Thyolo",
      39
);

INSERT INTO city
VALUES(
      986,
      "Mwanza",
      39
);

INSERT INTO city
VALUES(
      987,
      "Chiradzulu",
      39
);

INSERT INTO city
VALUES(
      988,
      "Karonga",
      39
);

INSERT INTO city
VALUES(
      989,
      "Neno",
      39
);

INSERT INTO city
VALUES(
      990,
      "Zomba",
      39
);

INSERT INTO city
VALUES(
      991,
      "Chikwawa",
      39
);

INSERT INTO city
VALUES(
      992,
      "Mulanje",
      39
);

INSERT INTO city
VALUES(
      993,
      "Blantyre",
      39
);

INSERT INTO city
VALUES(
      994,
      "Chiromo",
      39
);

INSERT INTO city
VALUES(
      995,
      "Phalombe",
      39
);

INSERT INTO city
VALUES(
      996,
      "Nsanje",
      39
);

INSERT INTO city
VALUES(
      997,
      "Nkhata Bay",
      39
);

INSERT INTO city
VALUES(
      998,
      "Rumphi",
      39
);

INSERT INTO city
VALUES(
      999,
      "Chitipa",
      39
);

INSERT INTO city
VALUES(
      1000,
      "Mzuzu",
      39
);

INSERT INTO city
VALUES(
      1001,
      "Mzimba",
      39
);

INSERT INTO city
VALUES(
      1002,
      "Ntchisi",
      39
);

INSERT INTO city
VALUES(
      1003,
      "Dowa",
      39
);

INSERT INTO city
VALUES(
      1004,
      "Mchinji",
      39
);

INSERT INTO city
VALUES(
      1005,
      "Nkhotakota",
      39
);

INSERT INTO city
VALUES(
      1006,
      "Kasungu",
      39
);

INSERT INTO city
VALUES(
      1007,
      "Ntcheu",
      39
);

INSERT INTO city
VALUES(
      1008,
      "Dedza",
      39
);

INSERT INTO city
VALUES(
      1009,
      "Salima",
      39
);

INSERT INTO city
VALUES(
      1010,
      "Lilongwe",
      39
);

INSERT INTO city
VALUES(
      1011,
      "Mangochi",
      39
);

INSERT INTO city
VALUES(
      1012,
      "Balaka",
      39
);

INSERT INTO city
VALUES(
      1013,
      "Machinga",
      39
);

INSERT INTO country
VALUES(
      40,
      "Mexico"
);

INSERT INTO city
VALUES(
      1014,
      "Nacozari de Garcia",
      40
);

INSERT INTO city
VALUES(
      1015,
      "Nueva Rosita",
      40
);

INSERT INTO city
VALUES(
      1016,
      "San Felipe",
      40
);

INSERT INTO city
VALUES(
      1017,
      "Zacatecas",
      40
);

INSERT INTO city
VALUES(
      1018,
      "Irapuato",
      40
);

INSERT INTO city
VALUES(
      1019,
      "Vicente Guerrero",
      40
);

INSERT INTO city
VALUES(
      1020,
      "San Quintin",
      40
);

INSERT INTO city
VALUES(
      1021,
      "Chetumal",
      40
);

INSERT INTO city
VALUES(
      1022,
      "Esperanza",
      40
);

INSERT INTO city
VALUES(
      1023,
      "Izamal",
      40
);

INSERT INTO city
VALUES(
      1024,
      "Ticul",
      40
);

INSERT INTO city
VALUES(
      1025,
      "Villahermosa",
      40
);

INSERT INTO city
VALUES(
      1026,
      "Mazatlan",
      40
);

INSERT INTO city
VALUES(
      1027,
      "Ciudad Victoria",
      40
);

INSERT INTO city
VALUES(
      1028,
      "Mexicali",
      40
);

INSERT INTO city
VALUES(
      1029,
      "Aguascalientes",
      40
);

INSERT INTO city
VALUES(
      1030,
      "Chihuahua",
      40
);

INSERT INTO city
VALUES(
      1031,
      "Guanajuato",
      40
);

INSERT INTO city
VALUES(
      1032,
      "Chilpancingo",
      40
);

INSERT INTO city
VALUES(
      1033,
      "Pachuca",
      40
);

INSERT INTO city
VALUES(
      1034,
      "Guadalajara",
      40
);

INSERT INTO city
VALUES(
      1035,
      "Cuernavaca",
      40
);

INSERT INTO city
VALUES(
      1036,
      "Monterrey",
      40
);

INSERT INTO city
VALUES(
      1037,
      "Lazaro Cardenas",
      40
);

INSERT INTO city
VALUES(
      1038,
      "Miahuatlan",
      40
);

INSERT INTO city
VALUES(
      1039,
      "Mitla",
      40
);

INSERT INTO city
VALUES(
      1040,
      "Valladolid",
      40
);

INSERT INTO city
VALUES(
      1041,
      "Ciudad Constitucion",
      40
);

INSERT INTO city
VALUES(
      1042,
      "Villa Union",
      40
);

INSERT INTO city
VALUES(
      1043,
      "Eldorado",
      40
);

INSERT INTO city
VALUES(
      1044,
      "Tekax",
      40
);

INSERT INTO city
VALUES(
      1045,
      "Montemorelos",
      40
);

INSERT INTO city
VALUES(
      1046,
      "Xalapa",
      40
);

INSERT INTO city
VALUES(
      1047,
      "Teziutlan",
      40
);

INSERT INTO city
VALUES(
      1048,
      "Motul",
      40
);

INSERT INTO city
VALUES(
      1049,
      "Merida",
      40
);

INSERT INTO city
VALUES(
      1050,
      "Guerrero Negro",
      40
);

INSERT INTO city
VALUES(
      1051,
      "Saltillo",
      40
);

INSERT INTO city
VALUES(
      1052,
      "Punta Prieta",
      40
);

INSERT INTO city
VALUES(
      1053,
      "Salina Cruz",
      40
);

INSERT INTO city
VALUES(
      1054,
      "Durango",
      40
);

INSERT INTO city
VALUES(
      1055,
      "Acatlan",
      40
);

INSERT INTO city
VALUES(
      1056,
      "Tepic",
      40
);

INSERT INTO city
VALUES(
      1057,
      "Tecuala",
      40
);

INSERT INTO city
VALUES(
      1058,
      "Ayutla",
      40
);

INSERT INTO city
VALUES(
      1059,
      "Huajuapan de Leon",
      40
);

INSERT INTO city
VALUES(
      1060,
      "Pochutla",
      40
);

INSERT INTO city
VALUES(
      1061,
      "Colima",
      40
);

INSERT INTO city
VALUES(
      1062,
      "Autlan",
      40
);

INSERT INTO city
VALUES(
      1063,
      "Coalcoman",
      40
);

INSERT INTO city
VALUES(
      1064,
      "Apatzingan",
      40
);

INSERT INTO city
VALUES(
      1065,
      "Halacho",
      40
);

INSERT INTO city
VALUES(
      1066,
      "Peto",
      40
);

INSERT INTO city
VALUES(
      1067,
      "Papasquiaro",
      40
);

INSERT INTO city
VALUES(
      1068,
      "Puerto Escondido",
      40
);

INSERT INTO city
VALUES(
      1069,
      "Hermosillo",
      40
);

INSERT INTO city
VALUES(
      1070,
      "Juchitan",
      40
);

INSERT INTO city
VALUES(
      1071,
      "San Luis Potosi",
      40
);

INSERT INTO city
VALUES(
      1072,
      "Culiacan",
      40
);

INSERT INTO city
VALUES(
      1073,
      "Uruapan",
      40
);

INSERT INTO city
VALUES(
      1074,
      "Tehuantepec",
      40
);

INSERT INTO city
VALUES(
      1075,
      "Salamanca",
      40
);

INSERT INTO city
VALUES(
      1076,
      "Mexico City",
      40
);

INSERT INTO city
VALUES(
      1077,
      "Zamora",
      40
);

INSERT INTO city
VALUES(
      1078,
      "Tlaxiaco",
      40
);

INSERT INTO city
VALUES(
      1079,
      "Petatlan",
      40
);

INSERT INTO city
VALUES(
      1080,
      "La Cruz",
      40
);

INSERT INTO city
VALUES(
      1081,
      "Allende",
      40
);

INSERT INTO city
VALUES(
      1082,
      "Agua Prieta",
      40
);

INSERT INTO city
VALUES(
      1083,
      "Piedras Negras",
      40
);

INSERT INTO city
VALUES(
      1084,
      "Reynosa",
      40
);

INSERT INTO city
VALUES(
      1085,
      "Ojinaga",
      40
);

INSERT INTO city
VALUES(
      1086,
      "La Paz",
      40
);

INSERT INTO city
VALUES(
      1087,
      "Tapachula",
      40
);

INSERT INTO city
VALUES(
      1088,
      "Escuintla",
      40
);

INSERT INTO city
VALUES(
      1089,
      "Atlixco",
      40
);

INSERT INTO city
VALUES(
      1090,
      "Orizaba",
      40
);

INSERT INTO city
VALUES(
      1091,
      "Taxco",
      40
);

INSERT INTO city
VALUES(
      1092,
      "Iguala",
      40
);

INSERT INTO city
VALUES(
      1093,
      "Cabo San Lucas",
      40
);

INSERT INTO city
VALUES(
      1094,
      "Villanueva",
      40
);

INSERT INTO city
VALUES(
      1095,
      "Tecpan",
      40
);

INSERT INTO city
VALUES(
      1096,
      "Atoyac",
      40
);

INSERT INTO city
VALUES(
      1097,
      "Jaltipan",
      40
);

INSERT INTO city
VALUES(
      1098,
      "La Barca",
      40
);

INSERT INTO city
VALUES(
      1099,
      "Queretaro",
      40
);

INSERT INTO city
VALUES(
      1100,
      "Leon",
      40
);

INSERT INTO city
VALUES(
      1101,
      "Pijijiapan",
      40
);

INSERT INTO city
VALUES(
      1102,
      "Campeche",
      40
);

INSERT INTO city
VALUES(
      1103,
      "Toluca",
      40
);

INSERT INTO city
VALUES(
      1104,
      "Tlaxcala",
      40
);

INSERT INTO city
VALUES(
      1105,
      "Oaxaca",
      40
);

INSERT INTO city
VALUES(
      1106,
      "Puebla",
      40
);

INSERT INTO city
VALUES(
      1107,
      "Tuxtla Gutierrez",
      40
);

INSERT INTO city
VALUES(
      1108,
      "Lagos de Moreno",
      40
);

INSERT INTO city
VALUES(
      1109,
      "Progreso",
      40
);

INSERT INTO city
VALUES(
      1110,
      "Tuxpam",
      40
);

INSERT INTO city
VALUES(
      1111,
      "Balancan",
      40
);

INSERT INTO city
VALUES(
      1112,
      "Tizimin",
      40
);

INSERT INTO city
VALUES(
      1113,
      "Los Mochis",
      40
);

INSERT INTO city
VALUES(
      1114,
      "Altata",
      40
);

INSERT INTO city
VALUES(
      1115,
      "Navajoa",
      40
);

INSERT INTO city
VALUES(
      1116,
      "Santa Barbara",
      40
);

INSERT INTO city
VALUES(
      1117,
      "Ciudad Hidalgo",
      40
);

INSERT INTO city
VALUES(
      1118,
      "Parras",
      40
);

INSERT INTO city
VALUES(
      1119,
      "Hidalgo del Parral",
      40
);

INSERT INTO city
VALUES(
      1120,
      "Delicias",
      40
);

INSERT INTO city
VALUES(
      1121,
      "Ensenada",
      40
);

INSERT INTO city
VALUES(
      1122,
      "Linares",
      40
);

INSERT INTO city
VALUES(
      1123,
      "San Juan del Rio",
      40
);

INSERT INTO city
VALUES(
      1124,
      "Minatitlan",
      40
);

INSERT INTO city
VALUES(
      1125,
      "Villa Ahumada",
      40
);

INSERT INTO city
VALUES(
      1126,
      "Tehuacan",
      40
);

INSERT INTO city
VALUES(
      1127,
      "Ciudad del Carmen",
      40
);

INSERT INTO city
VALUES(
      1128,
      "Morelia",
      40
);

INSERT INTO city
VALUES(
      1129,
      "Escuinapa",
      40
);

INSERT INTO city
VALUES(
      1130,
      "Nezahualcoyotl",
      40
);

INSERT INTO city
VALUES(
      1131,
      "Gomez Palacio",
      40
);

INSERT INTO city
VALUES(
      1132,
      "Paraiso",
      40
);

INSERT INTO city
VALUES(
      1133,
      "Frontera",
      40
);

INSERT INTO city
VALUES(
      1134,
      "Tenosique",
      40
);

INSERT INTO city
VALUES(
      1135,
      "Tecoman",
      40
);

INSERT INTO city
VALUES(
      1136,
      "Aldama",
      40
);

INSERT INTO city
VALUES(
      1137,
      "Loreto",
      40
);

INSERT INTO city
VALUES(
      1138,
      "Santa Rosalia",
      40
);

INSERT INTO city
VALUES(
      1139,
      "El Fuerte",
      40
);

INSERT INTO city
VALUES(
      1140,
      "Guasave",
      40
);

INSERT INTO city
VALUES(
      1141,
      "Manzanillo",
      40
);

INSERT INTO city
VALUES(
      1142,
      "Celaya",
      40
);

INSERT INTO city
VALUES(
      1143,
      "San Pedro de las Colonias",
      40
);

INSERT INTO city
VALUES(
      1144,
      "Monclova",
      40
);

INSERT INTO city
VALUES(
      1145,
      "Torreon",
      40
);

INSERT INTO city
VALUES(
      1146,
      "Nogales",
      40
);

INSERT INTO city
VALUES(
      1147,
      "Rio Verde",
      40
);

INSERT INTO city
VALUES(
      1148,
      "Tamuin",
      40
);

INSERT INTO city
VALUES(
      1149,
      "Tamazunchale",
      40
);

INSERT INTO city
VALUES(
      1150,
      "Ciudad Valles",
      40
);

INSERT INTO city
VALUES(
      1151,
      "Cardenas",
      40
);

INSERT INTO city
VALUES(
      1152,
      "Guamuchil",
      40
);

INSERT INTO city
VALUES(
      1153,
      "Tijuana",
      40
);

INSERT INTO city
VALUES(
      1154,
      "Cozumel",
      40
);

INSERT INTO city
VALUES(
      1155,
      "Isla Mujeres",
      40
);

INSERT INTO city
VALUES(
      1156,
      "Cancun",
      40
);

INSERT INTO city
VALUES(
      1157,
      "Felipe Carrillo Puerto",
      40
);

INSERT INTO city
VALUES(
      1158,
      "Champoton",
      40
);

INSERT INTO city
VALUES(
      1159,
      "Cuencame",
      40
);

INSERT INTO city
VALUES(
      1160,
      "Canatlan",
      40
);

INSERT INTO city
VALUES(
      1161,
      "Compostela",
      40
);

INSERT INTO city
VALUES(
      1162,
      "Santiago Ixcuintla",
      40
);

INSERT INTO city
VALUES(
      1163,
      "Tuxpan",
      40
);

INSERT INTO city
VALUES(
      1164,
      "Matehuala",
      40
);

INSERT INTO city
VALUES(
      1165,
      "Fresnillo",
      40
);

INSERT INTO city
VALUES(
      1166,
      "Valparaiso",
      40
);

INSERT INTO city
VALUES(
      1167,
      "Sabinas Hidalgo",
      40
);

INSERT INTO city
VALUES(
      1168,
      "Ascension",
      40
);

INSERT INTO city
VALUES(
      1169,
      "Ciudad Juarez",
      40
);

INSERT INTO city
VALUES(
      1170,
      "Juan Aldama",
      40
);

INSERT INTO city
VALUES(
      1171,
      "Caborca",
      40
);

INSERT INTO city
VALUES(
      1172,
      "Magdalena",
      40
);

INSERT INTO city
VALUES(
      1173,
      "Mazatlan",
      40
);

INSERT INTO city
VALUES(
      1174,
      "Puerto Vallarta",
      40
);

INSERT INTO city
VALUES(
      1175,
      "Zumpango",
      40
);

INSERT INTO city
VALUES(
      1176,
      "Nuevo Laredo",
      40
);

INSERT INTO city
VALUES(
      1177,
      "Matamoros",
      40
);

INSERT INTO city
VALUES(
      1178,
      "San Fernando",
      40
);

INSERT INTO city
VALUES(
      1179,
      "Ciudad Madero",
      40
);

INSERT INTO city
VALUES(
      1180,
      "Tampico",
      40
);

INSERT INTO city
VALUES(
      1181,
      "Ciudad Mante",
      40
);

INSERT INTO city
VALUES(
      1182,
      "Tula",
      40
);

INSERT INTO city
VALUES(
      1183,
      "Ciudad Guzman",
      40
);

INSERT INTO city
VALUES(
      1184,
      "Ciudad Camargo",
      40
);

INSERT INTO city
VALUES(
      1185,
      "Cuauhtemoc",
      40
);

INSERT INTO city
VALUES(
      1186,
      "Nuevo Casas Grandes",
      40
);

INSERT INTO city
VALUES(
      1187,
      "Poza Rica de Hidalgo",
      40
);

INSERT INTO city
VALUES(
      1188,
      "Ometepec",
      40
);

INSERT INTO city
VALUES(
      1189,
      "Ciudad Altamirano",
      40
);

INSERT INTO city
VALUES(
      1190,
      "Huatabampo",
      40
);

INSERT INTO city
VALUES(
      1191,
      "Ciudad Obregon",
      40
);

INSERT INTO city
VALUES(
      1192,
      "Guaymas",
      40
);

INSERT INTO city
VALUES(
      1193,
      "Panuco",
      40
);

INSERT INTO city
VALUES(
      1194,
      "Cananea",
      40
);

INSERT INTO city
VALUES(
      1195,
      "Acapulco",
      40
);

INSERT INTO city
VALUES(
      1196,
      "San Cristobal de Las Casas",
      40
);

INSERT INTO city
VALUES(
      1197,
      "Veracruz",
      40
);

INSERT INTO city
VALUES(
      1198,
      "Coatzacoalcos",
      40
);

INSERT INTO city
VALUES(
      1199,
      "Santiago Tuxtla",
      40
);

INSERT INTO city
VALUES(
      1200,
      "Cordoba",
      40
);

INSERT INTO city
VALUES(
      1201,
      "Nautla",
      40
);

INSERT INTO country
VALUES(
      41,
      "Malaysia"
);

INSERT INTO city
VALUES(
      1202,
      "Sibu",
      41
);

INSERT INTO city
VALUES(
      1203,
      "Shah Alam",
      41
);

INSERT INTO city
VALUES(
      1204,
      "Bintulu",
      41
);

INSERT INTO city
VALUES(
      1205,
      "Kuching",
      41
);

INSERT INTO city
VALUES(
      1206,
      "Victoria",
      41
);

INSERT INTO city
VALUES(
      1207,
      "Taiping",
      41
);

INSERT INTO city
VALUES(
      1208,
      "Chukai",
      41
);

INSERT INTO city
VALUES(
      1209,
      "Kuala Lumpur",
      41
);

INSERT INTO city
VALUES(
      1210,
      "Kangar",
      41
);

INSERT INTO city
VALUES(
      1211,
      "Alor Setar",
      41
);

INSERT INTO city
VALUES(
      1212,
      "George Town",
      41
);

INSERT INTO city
VALUES(
      1213,
      "Butterworth",
      41
);

INSERT INTO city
VALUES(
      1214,
      "Sungai Petani",
      41
);

INSERT INTO city
VALUES(
      1215,
      "Sandakan",
      41
);

INSERT INTO city
VALUES(
      1216,
      "Lahad Datu",
      41
);

INSERT INTO city
VALUES(
      1217,
      "Kota Baharu",
      41
);

INSERT INTO city
VALUES(
      1218,
      "Johor Bahru",
      41
);

INSERT INTO city
VALUES(
      1219,
      "Keluang",
      41
);

INSERT INTO city
VALUES(
      1220,
      "Kuala Terengganu",
      41
);

INSERT INTO city
VALUES(
      1221,
      "Ipoh",
      41
);

INSERT INTO city
VALUES(
      1222,
      "Kuantan",
      41
);

INSERT INTO city
VALUES(
      1223,
      "Kota Kinabalu",
      41
);

INSERT INTO city
VALUES(
      1224,
      "Tawau",
      41
);

INSERT INTO city
VALUES(
      1225,
      "Kuala Lipis",
      41
);

INSERT INTO city
VALUES(
      1226,
      "Teluk Intan",
      41
);

INSERT INTO city
VALUES(
      1227,
      "Malacca",
      41
);

INSERT INTO city
VALUES(
      1228,
      "Muar",
      41
);

INSERT INTO city
VALUES(
      1229,
      "Miri",
      41
);

INSERT INTO city
VALUES(
      1230,
      "Seremban",
      41
);

INSERT INTO city
VALUES(
      1231,
      "Putrajaya",
      41
);

INSERT INTO city
VALUES(
      1232,
      "Raub",
      41
);

INSERT INTO city
VALUES(
      1233,
      "Batu Pahat",
      41
);

INSERT INTO city
VALUES(
      1234,
      "Kelang",
      41
);

INSERT INTO country
VALUES(
      42,
      "Mozambique"
);

INSERT INTO city
VALUES(
      1235,
      "Espungabera",
      42
);

INSERT INTO city
VALUES(
      1236,
      "Quelimane",
      42
);

INSERT INTO city
VALUES(
      1237,
      "Nicuadala",
      42
);

INSERT INTO city
VALUES(
      1238,
      "Mapai",
      42
);

INSERT INTO city
VALUES(
      1239,
      "Mocimboa",
      42
);

INSERT INTO city
VALUES(
      1240,
      "Maxixe",
      42
);

INSERT INTO city
VALUES(
      1241,
      "Mocambique",
      42
);

INSERT INTO city
VALUES(
      1242,
      "Nampula",
      42
);

INSERT INTO city
VALUES(
      1243,
      "Massangena",
      42
);

INSERT INTO city
VALUES(
      1244,
      "Quissico",
      42
);

INSERT INTO city
VALUES(
      1245,
      "Chiramba",
      42
);

INSERT INTO city
VALUES(
      1246,
      "Xai-Xai",
      42
);

INSERT INTO city
VALUES(
      1247,
      "Ligonha",
      42
);

INSERT INTO city
VALUES(
      1248,
      "Vilanculos",
      42
);

INSERT INTO city
VALUES(
      1249,
      "Dondo",
      42
);

INSERT INTO city
VALUES(
      1250,
      "Macia",
      42
);

INSERT INTO city
VALUES(
      1251,
      "Moatize",
      42
);

INSERT INTO city
VALUES(
      1252,
      "Angoche",
      42
);

INSERT INTO city
VALUES(
      1253,
      "Cuamba",
      42
);

INSERT INTO city
VALUES(
      1254,
      "Inhambane",
      42
);

INSERT INTO city
VALUES(
      1255,
      "Beira",
      42
);

INSERT INTO city
VALUES(
      1256,
      "Lichinga",
      42
);

INSERT INTO city
VALUES(
      1257,
      "Pemba",
      42
);

INSERT INTO city
VALUES(
      1258,
      "Panda",
      42
);

INSERT INTO city
VALUES(
      1259,
      "Manica",
      42
);

INSERT INTO city
VALUES(
      1260,
      "Nacala",
      42
);

INSERT INTO city
VALUES(
      1261,
      "Montepuez",
      42
);

INSERT INTO city
VALUES(
      1262,
      "Maputo",
      42
);

INSERT INTO city
VALUES(
      1263,
      "Mocuba",
      42
);

INSERT INTO city
VALUES(
      1264,
      "Marrupa",
      42
);

INSERT INTO city
VALUES(
      1265,
      "Chimoio",
      42
);

INSERT INTO city
VALUES(
      1266,
      "Tete",
      42
);

INSERT INTO city
VALUES(
      1267,
      "Matola",
      42
);

INSERT INTO country
VALUES(
      43,
      "Namibia"
);

INSERT INTO city
VALUES(
      1268,
      "Oshikango",
      43
);

INSERT INTO city
VALUES(
      1269,
      "Okahandja",
      43
);

INSERT INTO city
VALUES(
      1270,
      "Ongwediva",
      43
);

INSERT INTO city
VALUES(
      1271,
      "Windhoek",
      43
);

INSERT INTO city
VALUES(
      1272,
      "Oranjemund",
      43
);

INSERT INTO city
VALUES(
      1273,
      "Otavi",
      43
);

INSERT INTO city
VALUES(
      1274,
      "Rehoboth",
      43
);

INSERT INTO city
VALUES(
      1275,
      "Bethanie",
      43
);

INSERT INTO city
VALUES(
      1276,
      "Karasburg",
      43
);

INSERT INTO city
VALUES(
      1277,
      "Omaruru",
      43
);

INSERT INTO city
VALUES(
      1278,
      "Walvis Bay",
      43
);

INSERT INTO city
VALUES(
      1279,
      "Karibib",
      43
);

INSERT INTO city
VALUES(
      1280,
      "Luderitz",
      43
);

INSERT INTO city
VALUES(
      1281,
      "Grootfontein",
      43
);

INSERT INTO city
VALUES(
      1282,
      "Usakos",
      43
);

INSERT INTO city
VALUES(
      1283,
      "Outjo",
      43
);

INSERT INTO city
VALUES(
      1284,
      "Katima Mulilo",
      43
);

INSERT INTO city
VALUES(
      1285,
      "Outapi",
      43
);

INSERT INTO city
VALUES(
      1286,
      "Eenhana",
      43
);

INSERT INTO city
VALUES(
      1287,
      "Oshakati",
      43
);

INSERT INTO city
VALUES(
      1288,
      "Gobabis",
      43
);

INSERT INTO city
VALUES(
      1289,
      "Maltahohe",
      43
);

INSERT INTO city
VALUES(
      1290,
      "Opuwo",
      43
);

INSERT INTO city
VALUES(
      1291,
      "Swakopmund",
      43
);

INSERT INTO city
VALUES(
      1292,
      "Keetmanshoop",
      43
);

INSERT INTO city
VALUES(
      1293,
      "Otjiwarongo",
      43
);

INSERT INTO city
VALUES(
      1294,
      "Mariental",
      43
);

INSERT INTO city
VALUES(
      1295,
      "Rundu",
      43
);

INSERT INTO city
VALUES(
      1296,
      "Nkurenkuru",
      43
);

INSERT INTO city
VALUES(
      1297,
      "Tsumeb",
      43
);

INSERT INTO city
VALUES(
      1298,
      "Omuthiya",
      43
);

INSERT INTO country
VALUES(
      44,
      "New Caledonia"
);

INSERT INTO city
VALUES(
      1299,
      "Kone",
      44
);

INSERT INTO city
VALUES(
      1300,
      "We",
      44
);

INSERT INTO city
VALUES(
      1301,
      "Noumea",
      44
);

INSERT INTO country
VALUES(
      45,
      "Niger"
);

INSERT INTO city
VALUES(
      1302,
      "Niamey",
      45
);

INSERT INTO city
VALUES(
      1303,
      "Maradi",
      45
);

INSERT INTO city
VALUES(
      1304,
      "Zinder",
      45
);

INSERT INTO city
VALUES(
      1305,
      "Ayorou",
      45
);

INSERT INTO city
VALUES(
      1306,
      "Gaya",
      45
);

INSERT INTO city
VALUES(
      1307,
      "Arlit",
      45
);

INSERT INTO city
VALUES(
      1308,
      "Birni Nkonni",
      45
);

INSERT INTO city
VALUES(
      1309,
      "Madaoua",
      45
);

INSERT INTO city
VALUES(
      1310,
      "Tahoua",
      45
);

INSERT INTO city
VALUES(
      1311,
      "Nguigmi",
      45
);

INSERT INTO city
VALUES(
      1312,
      "Dosso",
      45
);

INSERT INTO city
VALUES(
      1313,
      "Goure",
      45
);

INSERT INTO city
VALUES(
      1314,
      "Diffa",
      45
);

INSERT INTO city
VALUES(
      1315,
      "Tillaberi",
      45
);

INSERT INTO city
VALUES(
      1316,
      "Djado",
      45
);

INSERT INTO city
VALUES(
      1317,
      "Agadez",
      45
);

INSERT INTO country
VALUES(
      46,
      "Norfolk Island"
);

INSERT INTO city
VALUES(
      1318,
      "Kingston",
      46
);

INSERT INTO country
VALUES(
      47,
      "Nigeria"
);

INSERT INTO city
VALUES(
      1319,
      "Abuja",
      47
);

INSERT INTO city
VALUES(
      1320,
      "Uyo",
      47
);

INSERT INTO city
VALUES(
      1321,
      "Akure",
      47
);

INSERT INTO city
VALUES(
      1322,
      "Koko",
      47
);

INSERT INTO city
VALUES(
      1323,
      "Port Harcourt",
      47
);

INSERT INTO city
VALUES(
      1324,
      "Gombe",
      47
);

INSERT INTO city
VALUES(
      1325,
      "Nsukka",
      47
);

INSERT INTO city
VALUES(
      1326,
      "Potiskum",
      47
);

INSERT INTO city
VALUES(
      1327,
      "Damaturu",
      47
);

INSERT INTO city
VALUES(
      1328,
      "Wukari",
      47
);

INSERT INTO city
VALUES(
      1329,
      "Maiduguri",
      47
);

INSERT INTO city
VALUES(
      1330,
      "Kontagora",
      47
);

INSERT INTO city
VALUES(
      1331,
      "Jos",
      47
);

INSERT INTO city
VALUES(
      1332,
      "Abakaliki",
      47
);

INSERT INTO city
VALUES(
      1333,
      "Ife",
      47
);

INSERT INTO city
VALUES(
      1334,
      "Abeokuta",
      47
);

INSERT INTO city
VALUES(
      1335,
      "Ikeja",
      47
);

INSERT INTO city
VALUES(
      1336,
      "Lagos",
      47
);

INSERT INTO city
VALUES(
      1337,
      "Ijebu Ode",
      47
);

INSERT INTO city
VALUES(
      1338,
      "Iwo",
      47
);

INSERT INTO city
VALUES(
      1339,
      "Oshogbo",
      47
);

INSERT INTO city
VALUES(
      1340,
      "Ilorin",
      47
);

INSERT INTO city
VALUES(
      1341,
      "Gusau",
      47
);

INSERT INTO city
VALUES(
      1342,
      "Yenagoa",
      47
);

INSERT INTO city
VALUES(
      1343,
      "Minna",
      47
);

INSERT INTO city
VALUES(
      1344,
      "Ado Ekiti",
      47
);

INSERT INTO city
VALUES(
      1345,
      "Ibadan",
      47
);

INSERT INTO city
VALUES(
      1346,
      "Iseyin",
      47
);

INSERT INTO city
VALUES(
      1347,
      "Funtua",
      47
);

INSERT INTO city
VALUES(
      1348,
      "Katsina",
      47
);

INSERT INTO city
VALUES(
      1349,
      "Oyo",
      47
);

INSERT INTO city
VALUES(
      1350,
      "Ogbomosho",
      47
);

INSERT INTO city
VALUES(
      1351,
      "Benin City",
      47
);

INSERT INTO city
VALUES(
      1352,
      "Keffi",
      47
);

INSERT INTO city
VALUES(
      1353,
      "Lafia",
      47
);

INSERT INTO city
VALUES(
      1354,
      "Ondo",
      47
);

INSERT INTO city
VALUES(
      1355,
      "Lokoja",
      47
);

INSERT INTO city
VALUES(
      1356,
      "Sokoto",
      47
);

INSERT INTO city
VALUES(
      1357,
      "Kaduna",
      47
);

INSERT INTO city
VALUES(
      1358,
      "Kano",
      47
);

INSERT INTO city
VALUES(
      1359,
      "Zaria",
      47
);

INSERT INTO city
VALUES(
      1360,
      "Ikare",
      47
);

INSERT INTO city
VALUES(
      1361,
      "Owo",
      47
);

INSERT INTO city
VALUES(
      1362,
      "Dutse",
      47
);

INSERT INTO city
VALUES(
      1363,
      "Idah",
      47
);

INSERT INTO city
VALUES(
      1364,
      "Mubi",
      47
);

INSERT INTO city
VALUES(
      1365,
      "Orlu",
      47
);

INSERT INTO city
VALUES(
      1366,
      "Bama",
      47
);

INSERT INTO city
VALUES(
      1367,
      "Bauchi",
      47
);

INSERT INTO city
VALUES(
      1368,
      "Makurdi",
      47
);

INSERT INTO city
VALUES(
      1369,
      "Oturkpo",
      47
);

INSERT INTO city
VALUES(
      1370,
      "Onitsha",
      47
);

INSERT INTO city
VALUES(
      1371,
      "Awka",
      47
);

INSERT INTO city
VALUES(
      1372,
      "Enugu",
      47
);

INSERT INTO city
VALUES(
      1373,
      "Biu",
      47
);

INSERT INTO city
VALUES(
      1374,
      "Owerri",
      47
);

INSERT INTO city
VALUES(
      1375,
      "Calabar",
      47
);

INSERT INTO city
VALUES(
      1376,
      "Sapele",
      47
);

INSERT INTO city
VALUES(
      1377,
      "Opobo",
      47
);

INSERT INTO city
VALUES(
      1378,
      "Aba",
      47
);

INSERT INTO city
VALUES(
      1379,
      "Umuahia",
      47
);

INSERT INTO city
VALUES(
      1380,
      "Warri",
      47
);

INSERT INTO city
VALUES(
      1381,
      "Asaba",
      47
);

INSERT INTO city
VALUES(
      1382,
      "Bida",
      47
);

INSERT INTO city
VALUES(
      1383,
      "Kumo",
      47
);

INSERT INTO city
VALUES(
      1384,
      "Azare",
      47
);

INSERT INTO city
VALUES(
      1385,
      "Gashua",
      47
);

INSERT INTO city
VALUES(
      1386,
      "Yola",
      47
);

INSERT INTO city
VALUES(
      1387,
      "Nguru",
      47
);

INSERT INTO city
VALUES(
      1388,
      "Jalingo",
      47
);

INSERT INTO city
VALUES(
      1389,
      "Numan",
      47
);

INSERT INTO city
VALUES(
      1390,
      "Birnin Kebbi",
      47
);

INSERT INTO country
VALUES(
      48,
      "Nicaragua"
);

INSERT INTO city
VALUES(
      1391,
      "Managua",
      48
);

INSERT INTO city
VALUES(
      1392,
      "San Carlos",
      48
);

INSERT INTO city
VALUES(
      1393,
      "Juigalpa",
      48
);

INSERT INTO city
VALUES(
      1394,
      "Boaco",
      48
);

INSERT INTO city
VALUES(
      1395,
      "Granada",
      48
);

INSERT INTO city
VALUES(
      1396,
      "Puerto Cabezas",
      48
);

INSERT INTO city
VALUES(
      1397,
      "Jinotepe",
      48
);

INSERT INTO city
VALUES(
      1398,
      "Jinotega",
      48
);

INSERT INTO city
VALUES(
      1399,
      "Leon",
      48
);

INSERT INTO city
VALUES(
      1400,
      "Esteli",
      48
);

INSERT INTO city
VALUES(
      1401,
      "Somoto",
      48
);

INSERT INTO city
VALUES(
      1402,
      "Chinandega",
      48
);

INSERT INTO city
VALUES(
      1403,
      "Ocotal",
      48
);

INSERT INTO city
VALUES(
      1404,
      "Masaya",
      48
);

INSERT INTO city
VALUES(
      1405,
      "Bluefields",
      48
);

INSERT INTO city
VALUES(
      1406,
      "Rivas",
      48
);

INSERT INTO city
VALUES(
      1407,
      "Matagalpa",
      48
);

INSERT INTO city
VALUES(
      1408,
      "San Juan de Nicaragua",
      48
);

INSERT INTO city
VALUES(
      1409,
      "San Juan del Sur",
      48
);

INSERT INTO country
VALUES(
      49,
      "Netherlands"
);

INSERT INTO city
VALUES(
      1410,
      "Maastricht",
      49
);

INSERT INTO city
VALUES(
      1411,
      "Amsterdam",
      49
);

INSERT INTO city
VALUES(
      1412,
      "The Hague",
      49
);

INSERT INTO city
VALUES(
      1413,
      "Haarlem",
      49
);

INSERT INTO city
VALUES(
      1414,
      "Groningen",
      49
);

INSERT INTO city
VALUES(
      1415,
      "Middelburg",
      49
);

INSERT INTO city
VALUES(
      1416,
      "Lelystad",
      49
);

INSERT INTO city
VALUES(
      1417,
      "Arnhem",
      49
);

INSERT INTO city
VALUES(
      1418,
      "Assen",
      49
);

INSERT INTO city
VALUES(
      1419,
      "as-Hertogenbosch",
      49
);

INSERT INTO city
VALUES(
      1420,
      "Zwolle",
      49
);

INSERT INTO city
VALUES(
      1421,
      "Utrecht",
      49
);

INSERT INTO city
VALUES(
      1422,
      "Leeuwarden",
      49
);

INSERT INTO city
VALUES(
      1423,
      "Rotterdam",
      49
);

INSERT INTO city
VALUES(
      1424,
      "Eindhoven",
      49
);

INSERT INTO country
VALUES(
      50,
      "Norway"
);

INSERT INTO city
VALUES(
      1425,
      "Tromso",
      50
);

INSERT INTO city
VALUES(
      1426,
      "Molde",
      50
);

INSERT INTO city
VALUES(
      1427,
      "Vossavangen",
      50
);

INSERT INTO city
VALUES(
      1428,
      "Oslo",
      50
);

INSERT INTO city
VALUES(
      1429,
      "Lillehammer",
      50
);

INSERT INTO city
VALUES(
      1430,
      "Baerum",
      50
);

INSERT INTO city
VALUES(
      1431,
      "Stavanger",
      50
);

INSERT INTO city
VALUES(
      1432,
      "Hermansverk",
      50
);

INSERT INTO city
VALUES(
      1433,
      "Leikanger",
      50
);

INSERT INTO city
VALUES(
      1434,
      "Kristiansand",
      50
);

INSERT INTO city
VALUES(
      1435,
      "Bergen",
      50
);

INSERT INTO city
VALUES(
      1436,
      "Skien",
      50
);

INSERT INTO city
VALUES(
      1437,
      "Arendal",
      50
);

INSERT INTO city
VALUES(
      1438,
      "Hamar",
      50
);

INSERT INTO city
VALUES(
      1439,
      "Tonsberg",
      50
);

INSERT INTO city
VALUES(
      1440,
      "Drammen",
      50
);

INSERT INTO city
VALUES(
      1441,
      "Bodo",
      50
);

INSERT INTO city
VALUES(
      1442,
      "Haugesund",
      50
);

INSERT INTO city
VALUES(
      1443,
      "Svolvaer",
      50
);

INSERT INTO city
VALUES(
      1444,
      "Alesund",
      50
);

INSERT INTO city
VALUES(
      1445,
      "Harstad",
      50
);

INSERT INTO city
VALUES(
      1446,
      "Finnsnes",
      50
);

INSERT INTO city
VALUES(
      1447,
      "Alta",
      50
);

INSERT INTO city
VALUES(
      1448,
      "Kirkenes",
      50
);

INSERT INTO city
VALUES(
      1449,
      "Sandnes",
      50
);

INSERT INTO city
VALUES(
      1450,
      "Gjovik",
      50
);

INSERT INTO city
VALUES(
      1451,
      "Mo i Rana",
      50
);

INSERT INTO city
VALUES(
      1452,
      "Sarpsborg",
      50
);

INSERT INTO city
VALUES(
      1453,
      "Moss",
      50
);

INSERT INTO city
VALUES(
      1454,
      "Vadso",
      50
);

INSERT INTO city
VALUES(
      1455,
      "Rorvik",
      50
);

INSERT INTO city
VALUES(
      1456,
      "Namsos",
      50
);

INSERT INTO city
VALUES(
      1457,
      "Trondheim",
      50
);

INSERT INTO city
VALUES(
      1458,
      "Steinkjer",
      50
);

INSERT INTO city
VALUES(
      1459,
      "Narvik",
      50
);

INSERT INTO city
VALUES(
      1460,
      "Hammerfest",
      50
);

INSERT INTO country
VALUES(
      51,
      "Nepal"
);

INSERT INTO city
VALUES(
      1461,
      "Jumla",
      51
);

INSERT INTO city
VALUES(
      1462,
      "Salyan",
      51
);

INSERT INTO city
VALUES(
      1463,
      "Kathmandu",
      51
);

INSERT INTO city
VALUES(
      1464,
      "Bhairawa",
      51
);

INSERT INTO city
VALUES(
      1465,
      "Pokhara",
      51
);

INSERT INTO city
VALUES(
      1466,
      "Hetauda",
      51
);

INSERT INTO city
VALUES(
      1467,
      "Dandeldhura",
      51
);

INSERT INTO city
VALUES(
      1468,
      "Baglung",
      51
);

INSERT INTO city
VALUES(
      1469,
      "Ramechhap",
      51
);

INSERT INTO city
VALUES(
      1470,
      "Lalitpur",
      51
);

INSERT INTO city
VALUES(
      1471,
      "Biratnagar",
      51
);

INSERT INTO city
VALUES(
      1472,
      "Rajbiraj",
      51
);

INSERT INTO city
VALUES(
      1473,
      "Bhimphedi",
      51
);

INSERT INTO city
VALUES(
      1474,
      "Ilam",
      51
);

INSERT INTO city
VALUES(
      1475,
      "Dhangarhi",
      51
);

INSERT INTO city
VALUES(
      1476,
      "Birganj",
      51
);

INSERT INTO city
VALUES(
      1477,
      "Nepalganj",
      51
);

INSERT INTO country
VALUES(
      52,
      "Niue"
);

INSERT INTO city
VALUES(
      1478,
      "Alofi",
      52
);

INSERT INTO country
VALUES(
      53,
      "New Zealand"
);

INSERT INTO city
VALUES(
      1479,
      "Masterton",
      53
);

INSERT INTO city
VALUES(
      1480,
      "Gore",
      53
);

INSERT INTO city
VALUES(
      1481,
      "Te Anau",
      53
);

INSERT INTO city
VALUES(
      1482,
      "Invercargill",
      53
);

INSERT INTO city
VALUES(
      1483,
      "Ashburton",
      53
);

INSERT INTO city
VALUES(
      1484,
      "Timaru",
      53
);

INSERT INTO city
VALUES(
      1485,
      "Kaikoura",
      53
);

INSERT INTO city
VALUES(
      1486,
      "Christchurch",
      53
);

INSERT INTO city
VALUES(
      1487,
      "Queenstown",
      53
);

INSERT INTO city
VALUES(
      1488,
      "Porirua",
      53
);

INSERT INTO city
VALUES(
      1489,
      "Wanaka",
      53
);

INSERT INTO city
VALUES(
      1490,
      "Nelson",
      53
);

INSERT INTO city
VALUES(
      1491,
      "Picton",
      53
);

INSERT INTO city
VALUES(
      1492,
      "Hamilton",
      53
);

INSERT INTO city
VALUES(
      1493,
      "Dunedin",
      53
);

INSERT INTO city
VALUES(
      1494,
      "Thames",
      53
);

INSERT INTO city
VALUES(
      1495,
      "Lower Hutt",
      53
);

INSERT INTO city
VALUES(
      1496,
      "Palmerston North",
      53
);

INSERT INTO city
VALUES(
      1497,
      "Wanganui",
      53
);

INSERT INTO city
VALUES(
      1498,
      "Westport",
      53
);

INSERT INTO city
VALUES(
      1499,
      "Hokitika",
      53
);

INSERT INTO city
VALUES(
      1500,
      "Greymouth",
      53
);

INSERT INTO city
VALUES(
      1501,
      "Paraparaumu",
      53
);

INSERT INTO city
VALUES(
      1502,
      "Wellington",
      53
);

INSERT INTO city
VALUES(
      1503,
      "Upper Hutt",
      53
);

INSERT INTO city
VALUES(
      1504,
      "Levin",
      53
);

INSERT INTO city
VALUES(
      1505,
      "Rotorua",
      53
);

INSERT INTO city
VALUES(
      1506,
      "Tauranga",
      53
);

INSERT INTO city
VALUES(
      1507,
      "Waitangi",
      53
);

INSERT INTO city
VALUES(
      1508,
      "Taupo",
      53
);

INSERT INTO city
VALUES(
      1509,
      "Whakatane",
      53
);

INSERT INTO city
VALUES(
      1510,
      "Kerikeri",
      53
);

INSERT INTO city
VALUES(
      1511,
      "Whangarei",
      53
);

INSERT INTO city
VALUES(
      1512,
      "Pukekohe",
      53
);

INSERT INTO city
VALUES(
      1513,
      "Auckland",
      53
);

INSERT INTO city
VALUES(
      1514,
      "Waitakere",
      53
);

INSERT INTO city
VALUES(
      1515,
      "Cambridge",
      53
);

INSERT INTO city
VALUES(
      1516,
      "Kaitaia",
      53
);

INSERT INTO city
VALUES(
      1517,
      "Gisborne",
      53
);

INSERT INTO city
VALUES(
      1518,
      "Turangi",
      53
);

INSERT INTO city
VALUES(
      1519,
      "Tokoroa",
      53
);

INSERT INTO city
VALUES(
      1520,
      "Manukau",
      53
);

INSERT INTO city
VALUES(
      1521,
      "Napier",
      53
);

INSERT INTO city
VALUES(
      1522,
      "North Shore",
      53
);

INSERT INTO city
VALUES(
      1523,
      "Oban",
      53
);

INSERT INTO city
VALUES(
      1524,
      "New Plymouth",
      53
);

INSERT INTO city
VALUES(
      1525,
      "Hawera",
      53
);

INSERT INTO city
VALUES(
      1526,
      "Kaiapoi",
      53
);

INSERT INTO country
VALUES(
      54,
      "Oman"
);

INSERT INTO city
VALUES(
      1527,
      "Mirbat",
      54
);

INSERT INTO city
VALUES(
      1528,
      "Nizwa",
      54
);

INSERT INTO city
VALUES(
      1529,
      "Ar Rustaq",
      54
);

INSERT INTO city
VALUES(
      1530,
      "Haymaa",
      54
);

INSERT INTO city
VALUES(
      1531,
      "Sur",
      54
);

INSERT INTO city
VALUES(
      1532,
      "Khasab",
      54
);

INSERT INTO city
VALUES(
      1533,
      "Salalah",
      54
);

INSERT INTO city
VALUES(
      1534,
      "Muscat",
      54
);

INSERT INTO city
VALUES(
      1535,
      "Suhar",
      54
);

INSERT INTO city
VALUES(
      1536,
      "Ibraa",
      54
);

INSERT INTO city
VALUES(
      1537,
      "Alayat Samail",
      54
);

INSERT INTO city
VALUES(
      1538,
      "Ibri",
      54
);

INSERT INTO city
VALUES(
      1539,
      "Al Buraymi",
      54
);

INSERT INTO city
VALUES(
      1540,
      "As Sib",
      54
);

INSERT INTO city
VALUES(
      1541,
      "Dawwah",
      54
);

INSERT INTO city
VALUES(
      1542,
      "Suhar",
      54
);

INSERT INTO country
VALUES(
      55,
      "Panama"
);

INSERT INTO city
VALUES(
      1543,
      "Balboa",
      55
);

INSERT INTO city
VALUES(
      1544,
      "Panama City",
      55
);

INSERT INTO city
VALUES(
      1545,
      "La Chorrera",
      55
);

INSERT INTO city
VALUES(
      1546,
      "Colon",
      55
);

INSERT INTO city
VALUES(
      1547,
      "Jaque",
      55
);

INSERT INTO city
VALUES(
      1548,
      "La Palma",
      55
);

INSERT INTO city
VALUES(
      1549,
      "Penonome",
      55
);

INSERT INTO city
VALUES(
      1550,
      "Union Choco",
      55
);

INSERT INTO city
VALUES(
      1551,
      "David",
      55
);

INSERT INTO city
VALUES(
      1552,
      "Puerto Armuelles",
      55
);

INSERT INTO city
VALUES(
      1553,
      "Santiago",
      55
);

INSERT INTO city
VALUES(
      1554,
      "Las Tablas",
      55
);

INSERT INTO city
VALUES(
      1555,
      "Chitre",
      55
);

INSERT INTO city
VALUES(
      1556,
      "Buabidi",
      55
);

INSERT INTO city
VALUES(
      1557,
      "Bocas del Toro",
      55
);

INSERT INTO city
VALUES(
      1558,
      "Almirante",
      55
);

INSERT INTO city
VALUES(
      1559,
      "El Porvenir",
      55
);

INSERT INTO country
VALUES(
      56,
      "Peru"
);

INSERT INTO city
VALUES(
      1560,
      "Trujillo",
      56
);

INSERT INTO city
VALUES(
      1561,
      "Lima",
      56
);

INSERT INTO city
VALUES(
      1562,
      "Abancay",
      56
);

INSERT INTO city
VALUES(
      1563,
      "Nuevo Rocafuerte",
      56
);

INSERT INTO city
VALUES(
      1564,
      "Arequipa",
      56
);

INSERT INTO city
VALUES(
      1565,
      "Huaura",
      56
);

INSERT INTO city
VALUES(
      1566,
      "Tournavista",
      56
);

INSERT INTO city
VALUES(
      1567,
      "Jaen",
      56
);

INSERT INTO city
VALUES(
      1568,
      "Huamachuco",
      56
);

INSERT INTO city
VALUES(
      1569,
      "Chiclayo",
      56
);

INSERT INTO city
VALUES(
      1570,
      "Motupe",
      56
);

INSERT INTO city
VALUES(
      1571,
      "Lamas",
      56
);

INSERT INTO city
VALUES(
      1572,
      "Juanjui",
      56
);

INSERT INTO city
VALUES(
      1573,
      "Olmos",
      56
);

INSERT INTO city
VALUES(
      1574,
      "Moyobamba",
      56
);

INSERT INTO city
VALUES(
      1575,
      "Tarapoto",
      56
);

INSERT INTO city
VALUES(
      1576,
      "Chulucanas",
      56
);

INSERT INTO city
VALUES(
      1577,
      "Huaraz",
      56
);

INSERT INTO city
VALUES(
      1578,
      "Chota",
      56
);

INSERT INTO city
VALUES(
      1579,
      "Callao",
      56
);

INSERT INTO city
VALUES(
      1580,
      "Tarma",
      56
);

INSERT INTO city
VALUES(
      1581,
      "Ilave",
      56
);

INSERT INTO city
VALUES(
      1582,
      "Puno",
      56
);

INSERT INTO city
VALUES(
      1583,
      "Urubamba",
      56
);

INSERT INTO city
VALUES(
      1584,
      "La Oroya",
      56
);

INSERT INTO city
VALUES(
      1585,
      "San Ramon",
      56
);

INSERT INTO city
VALUES(
      1586,
      "Cerro de Pasco",
      56
);

INSERT INTO city
VALUES(
      1587,
      "Jauja",
      56
);

INSERT INTO city
VALUES(
      1588,
      "Cajamarca",
      56
);

INSERT INTO city
VALUES(
      1589,
      "Satipo",
      56
);

INSERT INTO city
VALUES(
      1590,
      "Ilo",
      56
);

INSERT INTO city
VALUES(
      1591,
      "Gueppi",
      56
);

INSERT INTO city
VALUES(
      1592,
      "Otuzco",
      56
);

INSERT INTO city
VALUES(
      1593,
      "Moquegua",
      56
);

INSERT INTO city
VALUES(
      1594,
      "Andoas",
      56
);

INSERT INTO city
VALUES(
      1595,
      "Salaverry",
      56
);

INSERT INTO city
VALUES(
      1596,
      "Pativilca",
      56
);

INSERT INTO city
VALUES(
      1597,
      "Soldado Bartra",
      56
);

INSERT INTO city
VALUES(
      1598,
      "Puca Urco",
      56
);

INSERT INTO city
VALUES(
      1599,
      "Tumbes",
      56
);

INSERT INTO city
VALUES(
      1600,
      "Ica",
      56
);

INSERT INTO city
VALUES(
      1601,
      "Sullana",
      56
);

INSERT INTO city
VALUES(
      1602,
      "Cusco",
      56
);

INSERT INTO city
VALUES(
      1603,
      "Santo Tomas",
      56
);

INSERT INTO city
VALUES(
      1604,
      "Puquio",
      56
);

INSERT INTO city
VALUES(
      1605,
      "Juliaca",
      56
);

INSERT INTO city
VALUES(
      1606,
      "Huancayo",
      56
);

INSERT INTO city
VALUES(
      1607,
      "Piura",
      56
);

INSERT INTO city
VALUES(
      1608,
      "Paita",
      56
);

INSERT INTO city
VALUES(
      1609,
      "Tingo Maria",
      56
);

INSERT INTO city
VALUES(
      1610,
      "Huanuco",
      56
);

INSERT INTO city
VALUES(
      1611,
      "Sicuani",
      56
);

INSERT INTO city
VALUES(
      1612,
      "Desaguadero",
      56
);

INSERT INTO city
VALUES(
      1613,
      "Cajabamba",
      56
);

INSERT INTO city
VALUES(
      1614,
      "Putina",
      56
);

INSERT INTO city
VALUES(
      1615,
      "Pacasmayo",
      56
);

INSERT INTO city
VALUES(
      1616,
      "Caballococha",
      56
);

INSERT INTO city
VALUES(
      1617,
      "Tocache",
      56
);

INSERT INTO city
VALUES(
      1618,
      "Pucallpa",
      56
);

INSERT INTO city
VALUES(
      1619,
      "Junin",
      56
);

INSERT INTO city
VALUES(
      1620,
      "Camana",
      56
);

INSERT INTO city
VALUES(
      1621,
      "Chincha Alta",
      56
);

INSERT INTO city
VALUES(
      1622,
      "Nauta",
      56
);

INSERT INTO city
VALUES(
      1623,
      "Iquitos",
      56
);

INSERT INTO city
VALUES(
      1624,
      "Puerto Maldonado",
      56
);

INSERT INTO city
VALUES(
      1625,
      "Requena",
      56
);

INSERT INTO city
VALUES(
      1626,
      "Casma",
      56
);

INSERT INTO city
VALUES(
      1627,
      "Ayaviri",
      56
);

INSERT INTO city
VALUES(
      1628,
      "Chosica",
      56
);

INSERT INTO city
VALUES(
      1629,
      "Ayacucho",
      56
);

INSERT INTO city
VALUES(
      1630,
      "Huancavelica",
      56
);

INSERT INTO city
VALUES(
      1631,
      "Huanta",
      56
);

INSERT INTO city
VALUES(
      1632,
      "Chilca",
      56
);

INSERT INTO city
VALUES(
      1633,
      "Chancay",
      56
);

INSERT INTO city
VALUES(
      1634,
      "Chimbote",
      56
);

INSERT INTO city
VALUES(
      1635,
      "Nasca",
      56
);

INSERT INTO city
VALUES(
      1636,
      "Mollendo",
      56
);

INSERT INTO city
VALUES(
      1637,
      "Huarmey",
      56
);

INSERT INTO city
VALUES(
      1638,
      "Santiago",
      56
);

INSERT INTO city
VALUES(
      1639,
      "Coracora",
      56
);

INSERT INTO city
VALUES(
      1640,
      "Pimentel",
      56
);

INSERT INTO city
VALUES(
      1641,
      "Ferrenafe",
      56
);

INSERT INTO city
VALUES(
      1642,
      "Talara",
      56
);

INSERT INTO city
VALUES(
      1643,
      "Sechura",
      56
);

INSERT INTO city
VALUES(
      1644,
      "Pisco",
      56
);

INSERT INTO city
VALUES(
      1645,
      "Contamana",
      56
);

INSERT INTO city
VALUES(
      1646,
      "Chachapoyas",
      56
);

INSERT INTO city
VALUES(
      1647,
      "Huacho",
      56
);

INSERT INTO city
VALUES(
      1648,
      "Tacna",
      56
);

INSERT INTO country
VALUES(
      57,
      "French Polynesia"
);

INSERT INTO city
VALUES(
      1649,
      "Papeete",
      57
);

INSERT INTO country
VALUES(
      58,
      "Papua New Guinea"
);

INSERT INTO city
VALUES(
      1650,
      "Port Moresby",
      58
);

INSERT INTO city
VALUES(
      1651,
      "Kieta",
      58
);

INSERT INTO city
VALUES(
      1652,
      "Sohano",
      58
);

INSERT INTO city
VALUES(
      1653,
      "Wewak",
      58
);

INSERT INTO city
VALUES(
      1654,
      "Kavieng",
      58
);

INSERT INTO city
VALUES(
      1655,
      "Lorengau",
      58
);

INSERT INTO city
VALUES(
      1656,
      "Hoskins",
      58
);

INSERT INTO city
VALUES(
      1657,
      "Abau",
      58
);

INSERT INTO city
VALUES(
      1658,
      "Kimbe",
      58
);

INSERT INTO city
VALUES(
      1659,
      "Alotau",
      58
);

INSERT INTO city
VALUES(
      1660,
      "Daru",
      58
);

INSERT INTO city
VALUES(
      1661,
      "Mt. Hagen",
      58
);

INSERT INTO city
VALUES(
      1662,
      "Lae",
      58
);

INSERT INTO city
VALUES(
      1663,
      "Goroka",
      58
);

INSERT INTO city
VALUES(
      1664,
      "Madang",
      58
);

INSERT INTO city
VALUES(
      1665,
      "Arawa",
      58
);

INSERT INTO city
VALUES(
      1666,
      "Kerema",
      58
);

INSERT INTO city
VALUES(
      1667,
      "Vanimo",
      58
);

INSERT INTO city
VALUES(
      1668,
      "Rabaul",
      58
);

INSERT INTO city
VALUES(
      1669,
      "Popondetta",
      58
);

INSERT INTO city
VALUES(
      1670,
      "Wabag",
      58
);

INSERT INTO city
VALUES(
      1671,
      "Mendi",
      58
);

INSERT INTO city
VALUES(
      1672,
      "Kundiawa",
      58
);

INSERT INTO country
VALUES(
      59,
      "Philippines"
);

INSERT INTO city
VALUES(
      1673,
      "Alabel",
      59
);

INSERT INTO city
VALUES(
      1674,
      "Laoag",
      59
);

INSERT INTO city
VALUES(
      1675,
      "Marawi City",
      59
);

INSERT INTO city
VALUES(
      1676,
      "Cadiz",
      59
);

INSERT INTO city
VALUES(
      1677,
      "Malaybalay",
      59
);

INSERT INTO city
VALUES(
      1678,
      "Calbayog",
      59
);

INSERT INTO city
VALUES(
      1679,
      "Gingoog",
      59
);

INSERT INTO city
VALUES(
      1680,
      "Roxas",
      59
);

INSERT INTO city
VALUES(
      1681,
      "San Pablo",
      59
);

INSERT INTO city
VALUES(
      1682,
      "San Carlos",
      59
);

INSERT INTO city
VALUES(
      1683,
      "City of Isabela",
      59
);

INSERT INTO city
VALUES(
      1684,
      "Cabanatuan",
      59
);

INSERT INTO city
VALUES(
      1685,
      "Baguio City",
      59
);

INSERT INTO city
VALUES(
      1686,
      "Manila",
      59
);

INSERT INTO city
VALUES(
      1687,
      "Makati City",
      59
);

INSERT INTO city
VALUES(
      1688,
      "Pasig City",
      59
);

INSERT INTO city
VALUES(
      1689,
      "City of Paranaque",
      59
);

INSERT INTO city
VALUES(
      1690,
      "Baler",
      59
);

INSERT INTO city
VALUES(
      1691,
      "Bangued",
      59
);

INSERT INTO city
VALUES(
      1692,
      "Balanga",
      59
);

INSERT INTO city
VALUES(
      1693,
      "Boac",
      59
);

INSERT INTO city
VALUES(
      1694,
      "Malita",
      59
);

INSERT INTO city
VALUES(
      1695,
      "Malolos",
      59
);

INSERT INTO city
VALUES(
      1696,
      "Mati",
      59
);

INSERT INTO city
VALUES(
      1697,
      "Batangas",
      59
);

INSERT INTO city
VALUES(
      1698,
      "Bayombong",
      59
);

INSERT INTO city
VALUES(
      1699,
      "Angeles",
      59
);

INSERT INTO city
VALUES(
      1700,
      "Bacolod",
      59
);

INSERT INTO city
VALUES(
      1701,
      "Mandaue City",
      59
);

INSERT INTO city
VALUES(
      1702,
      "Bongao",
      59
);

INSERT INTO city
VALUES(
      1703,
      "Bontoc",
      59
);

INSERT INTO city
VALUES(
      1704,
      "Borongan",
      59
);

INSERT INTO city
VALUES(
      1705,
      "Butuan",
      59
);

INSERT INTO city
VALUES(
      1706,
      "Cabadbaran",
      59
);

INSERT INTO city
VALUES(
      1707,
      "Cabarroguis",
      59
);

INSERT INTO city
VALUES(
      1708,
      "Cagayan de Oro",
      59
);

INSERT INTO city
VALUES(
      1709,
      "Calapan",
      59
);

INSERT INTO city
VALUES(
      1710,
      "Caloocan City",
      59
);

INSERT INTO city
VALUES(
      1711,
      "Catarman",
      59
);

INSERT INTO city
VALUES(
      1712,
      "Catbalogan",
      59
);

INSERT INTO city
VALUES(
      1713,
      "Cebu",
      59
);

INSERT INTO city
VALUES(
      1714,
      "Cotabato",
      59
);

INSERT INTO city
VALUES(
      1715,
      "Daet",
      59
);

INSERT INTO city
VALUES(
      1716,
      "Dagupan",
      59
);

INSERT INTO city
VALUES(
      1717,
      "Davao",
      59
);

INSERT INTO city
VALUES(
      1718,
      "Digos",
      59
);

INSERT INTO city
VALUES(
      1719,
      "Dipolog",
      59
);

INSERT INTO city
VALUES(
      1720,
      "Dumaguete City",
      59
);

INSERT INTO city
VALUES(
      1721,
      "General Santos",
      59
);

INSERT INTO city
VALUES(
      1722,
      "Iba",
      59
);

INSERT INTO city
VALUES(
      1723,
      "Ilagan",
      59
);

INSERT INTO city
VALUES(
      1724,
      "Iligan",
      59
);

INSERT INTO city
VALUES(
      1725,
      "Iloilo",
      59
);

INSERT INTO city
VALUES(
      1726,
      "Ipil",
      59
);

INSERT INTO city
VALUES(
      1727,
      "Jolo",
      59
);

INSERT INTO city
VALUES(
      1728,
      "Jordan",
      59
);

INSERT INTO city
VALUES(
      1729,
      "Kabugao",
      59
);

INSERT INTO city
VALUES(
      1730,
      "Kalibo",
      59
);

INSERT INTO city
VALUES(
      1731,
      "Kidapawan",
      59
);

INSERT INTO city
VALUES(
      1732,
      "Lagawe",
      59
);

INSERT INTO city
VALUES(
      1733,
      "La Trinidad",
      59
);

INSERT INTO city
VALUES(
      1734,
      "Lapu-Lapu City",
      59
);

INSERT INTO city
VALUES(
      1735,
      "Legazpi",
      59
);

INSERT INTO city
VALUES(
      1736,
      "Lingayen",
      59
);

INSERT INTO city
VALUES(
      1737,
      "Lucena",
      59
);

INSERT INTO city
VALUES(
      1738,
      "Maasin",
      59
);

INSERT INTO city
VALUES(
      1739,
      "Malabon",
      59
);

INSERT INTO city
VALUES(
      1740,
      "Mambajao",
      59
);

INSERT INTO city
VALUES(
      1741,
      "Mamburao",
      59
);

INSERT INTO city
VALUES(
      1742,
      "Mandaluyong City",
      59
);

INSERT INTO city
VALUES(
      1743,
      "Marikina City",
      59
);

INSERT INTO city
VALUES(
      1744,
      "Masbate",
      59
);

INSERT INTO city
VALUES(
      1745,
      "Muntinlupa City",
      59
);

INSERT INTO city
VALUES(
      1746,
      "Nabunturan",
      59
);

INSERT INTO city
VALUES(
      1747,
      "Naga",
      59
);

INSERT INTO city
VALUES(
      1748,
      "Naval",
      59
);

INSERT INTO city
VALUES(
      1749,
      "Navotas",
      59
);

INSERT INTO city
VALUES(
      1750,
      "Olongapo",
      59
);

INSERT INTO city
VALUES(
      1751,
      "Ormac",
      59
);

INSERT INTO city
VALUES(
      1752,
      "Oroquieta",
      59
);

INSERT INTO city
VALUES(
      1753,
      "Pagadian",
      59
);

INSERT INTO city
VALUES(
      1754,
      "Palayan City",
      59
);

INSERT INTO city
VALUES(
      1755,
      "Pasay City",
      59
);

INSERT INTO city
VALUES(
      1756,
      "Pili",
      59
);

INSERT INTO city
VALUES(
      1757,
      "Prosperidad",
      59
);

INSERT INTO city
VALUES(
      1758,
      "Puerto Princesa",
      59
);

INSERT INTO city
VALUES(
      1759,
      "Quezon City",
      59
);

INSERT INTO city
VALUES(
      1760,
      "Romblon",
      59
);

INSERT INTO city
VALUES(
      1761,
      "San Fernando",
      59
);

INSERT INTO city
VALUES(
      1762,
      "San Fernando",
      59
);

INSERT INTO city
VALUES(
      1763,
      "San Jose",
      59
);

INSERT INTO city
VALUES(
      1764,
      "San Juan",
      59
);

INSERT INTO city
VALUES(
      1765,
      "Santa Cruz",
      59
);

INSERT INTO city
VALUES(
      1766,
      "Santiago",
      59
);

INSERT INTO city
VALUES(
      1767,
      "Shariff Aguak",
      59
);

INSERT INTO city
VALUES(
      1768,
      "Siquijor",
      59
);

INSERT INTO city
VALUES(
      1769,
      "Sorsogon",
      59
);

INSERT INTO city
VALUES(
      1770,
      "Surigao",
      59
);

INSERT INTO city
VALUES(
      1771,
      "Tabuk",
      59
);

INSERT INTO city
VALUES(
      1772,
      "Tacloban",
      59
);

INSERT INTO city
VALUES(
      1773,
      "Taguig City",
      59
);

INSERT INTO city
VALUES(
      1774,
      "Tagum",
      59
);

INSERT INTO city
VALUES(
      1775,
      "Tandag",
      59
);

INSERT INTO city
VALUES(
      1776,
      "Tarlac",
      59
);

INSERT INTO city
VALUES(
      1777,
      "Trece Martires City",
      59
);

INSERT INTO city
VALUES(
      1778,
      "Tubod",
      59
);

INSERT INTO city
VALUES(
      1779,
      "Tuguegarao",
      59
);

INSERT INTO city
VALUES(
      1780,
      "Valenzuela",
      59
);

INSERT INTO city
VALUES(
      1781,
      "Vigan",
      59
);

INSERT INTO city
VALUES(
      1782,
      "Virac",
      59
);

INSERT INTO city
VALUES(
      1783,
      "Zamboanga",
      59
);

INSERT INTO city
VALUES(
      1784,
      "San Jose",
      59
);

INSERT INTO city
VALUES(
      1785,
      "Basco",
      59
);

INSERT INTO city
VALUES(
      1786,
      "Antipolo",
      59
);

INSERT INTO city
VALUES(
      1787,
      "Koronadal",
      59
);

INSERT INTO city
VALUES(
      1788,
      "Isulan",
      59
);

INSERT INTO city
VALUES(
      1789,
      "Ozamis",
      59
);

INSERT INTO city
VALUES(
      1790,
      "Tagum",
      59
);

INSERT INTO country
VALUES(
      60,
      "Pakistan"
);

INSERT INTO city
VALUES(
      1791,
      "Karachi",
      60
);

INSERT INTO city
VALUES(
      1792,
      "Gilgit",
      60
);

INSERT INTO city
VALUES(
      1793,
      "Chaman",
      60
);

INSERT INTO city
VALUES(
      1794,
      "Turbat",
      60
);

INSERT INTO city
VALUES(
      1795,
      "Islamabad",
      60
);

INSERT INTO city
VALUES(
      1796,
      "Zhob",
      60
);

INSERT INTO city
VALUES(
      1797,
      "Quetta",
      60
);

INSERT INTO city
VALUES(
      1798,
      "Hyderabad",
      60
);

INSERT INTO city
VALUES(
      1799,
      "Mardan",
      60
);

INSERT INTO city
VALUES(
      1800,
      "Saidu",
      60
);

INSERT INTO city
VALUES(
      1801,
      "Jhang",
      60
);

INSERT INTO city
VALUES(
      1802,
      "Kasur",
      60
);

INSERT INTO city
VALUES(
      1803,
      "Lahore",
      60
);

INSERT INTO city
VALUES(
      1804,
      "Nawabshah",
      60
);

INSERT INTO city
VALUES(
      1805,
      "Chiniot",
      60
);

INSERT INTO city
VALUES(
      1806,
      "Bannu",
      60
);

INSERT INTO city
VALUES(
      1807,
      "Sadiqabad",
      60
);

INSERT INTO city
VALUES(
      1808,
      "Sukkur",
      60
);

INSERT INTO city
VALUES(
      1809,
      "Peshawar",
      60
);

INSERT INTO city
VALUES(
      1810,
      "Bahawalpur",
      60
);

INSERT INTO city
VALUES(
      1811,
      "Sargodha",
      60
);

INSERT INTO city
VALUES(
      1812,
      "Dera Ismail Khan",
      60
);

INSERT INTO city
VALUES(
      1813,
      "Kundian",
      60
);

INSERT INTO city
VALUES(
      1814,
      "Gwadar",
      60
);

INSERT INTO city
VALUES(
      1815,
      "Parachinar",
      60
);

INSERT INTO city
VALUES(
      1816,
      "Larkana",
      60
);

INSERT INTO city
VALUES(
      1817,
      "Kohat",
      60
);

INSERT INTO city
VALUES(
      1818,
      "Rahim Yar Khan",
      60
);

INSERT INTO city
VALUES(
      1819,
      "Mirput Khas",
      60
);

INSERT INTO city
VALUES(
      1820,
      "Dera Ghazi Khan",
      60
);

INSERT INTO city
VALUES(
      1821,
      "Gujranwala",
      60
);

INSERT INTO city
VALUES(
      1822,
      "Rawalpindi",
      60
);

INSERT INTO city
VALUES(
      1823,
      "Gujrat",
      60
);

INSERT INTO city
VALUES(
      1824,
      "Sialkote",
      60
);

INSERT INTO city
VALUES(
      1825,
      "Mansehra",
      60
);

INSERT INTO city
VALUES(
      1826,
      "Abbottabad",
      60
);

INSERT INTO city
VALUES(
      1827,
      "Multan",
      60
);

INSERT INTO city
VALUES(
      1828,
      "Sheikhu Pura",
      60
);

INSERT INTO city
VALUES(
      1829,
      "Sahiwal",
      60
);

INSERT INTO city
VALUES(
      1830,
      "Okara",
      60
);

INSERT INTO city
VALUES(
      1831,
      "Faisalabad",
      60
);

INSERT INTO country
VALUES(
      61,
      "Poland"
);

INSERT INTO city
VALUES(
      1832,
      "Lodz",
      61
);

INSERT INTO city
VALUES(
      1833,
      "Lublin",
      61
);

INSERT INTO city
VALUES(
      1834,
      "Wroclaw",
      61
);

INSERT INTO city
VALUES(
      1835,
      "Bialystok",
      61
);

INSERT INTO city
VALUES(
      1836,
      "Poznan",
      61
);

INSERT INTO city
VALUES(
      1837,
      "Zielona Gora",
      61
);

INSERT INTO city
VALUES(
      1838,
      "Bydgoszcz",
      61
);

INSERT INTO city
VALUES(
      1839,
      "Szczecin",
      61
);

INSERT INTO city
VALUES(
      1840,
      "Gdansk",
      61
);

INSERT INTO city
VALUES(
      1841,
      "Olsztyn",
      61
);

INSERT INTO city
VALUES(
      1842,
      "Katowice",
      61
);

INSERT INTO city
VALUES(
      1843,
      "Rzeszow",
      61
);

INSERT INTO city
VALUES(
      1844,
      "Krakow",
      61
);

INSERT INTO city
VALUES(
      1845,
      "Opole",
      61
);

INSERT INTO city
VALUES(
      1846,
      "Kielce",
      61
);

INSERT INTO city
VALUES(
      1847,
      "Gorzow Wielkopolski",
      61
);

INSERT INTO city
VALUES(
      1848,
      "Gdynia",
      61
);

INSERT INTO city
VALUES(
      1849,
      "Grudziadz",
      61
);

INSERT INTO city
VALUES(
      1850,
      "Inowroclaw",
      61
);

INSERT INTO city
VALUES(
      1851,
      "Gliwice",
      61
);

INSERT INTO city
VALUES(
      1852,
      "Bytom",
      61
);

INSERT INTO city
VALUES(
      1853,
      "Warsaw",
      61
);

INSERT INTO city
VALUES(
      1854,
      "Elblag",
      61
);

INSERT INTO city
VALUES(
      1855,
      "Elk",
      61
);

INSERT INTO city
VALUES(
      1856,
      "Koszalin",
      61
);

INSERT INTO country
VALUES(
      62,
      "Saint Pierre And Miquelon"
);

INSERT INTO city
VALUES(
      1857,
      "Saint-Pierre",
      62
);

INSERT INTO country
VALUES(
      63,
      "Pitcairn Islands"
);

INSERT INTO city
VALUES(
      1858,
      "Adamstown",
      63
);

INSERT INTO country
VALUES(
      64,
      "Portugal"
);

INSERT INTO city
VALUES(
      1859,
      "Funchal",
      64
);

INSERT INTO city
VALUES(
      1860,
      "Setubal",
      64
);

INSERT INTO city
VALUES(
      1861,
      "Lisbon",
      64
);

INSERT INTO city
VALUES(
      1862,
      "Evora",
      64
);

INSERT INTO city
VALUES(
      1863,
      "Angra do Heroismo",
      64
);

INSERT INTO city
VALUES(
      1864,
      "Santarem",
      64
);

INSERT INTO city
VALUES(
      1865,
      "Horta",
      64
);

INSERT INTO city
VALUES(
      1866,
      "Ponta Delgada",
      64
);

INSERT INTO city
VALUES(
      1867,
      "Porto",
      64
);

INSERT INTO city
VALUES(
      1868,
      "Faro",
      64
);

INSERT INTO city
VALUES(
      1869,
      "Vila Real",
      64
);

INSERT INTO city
VALUES(
      1870,
      "Aveiro",
      64
);

INSERT INTO city
VALUES(
      1871,
      "Guarda",
      64
);

INSERT INTO city
VALUES(
      1872,
      "Viseu",
      64
);

INSERT INTO city
VALUES(
      1873,
      "Braganca",
      64
);

INSERT INTO city
VALUES(
      1874,
      "Viana Do Castelo",
      64
);

INSERT INTO city
VALUES(
      1875,
      "Braga",
      64
);

INSERT INTO city
VALUES(
      1876,
      "Beja",
      64
);

INSERT INTO city
VALUES(
      1877,
      "Castelo Branco",
      64
);

INSERT INTO city
VALUES(
      1878,
      "Portalegre",
      64
);

INSERT INTO city
VALUES(
      1879,
      "Coimbra",
      64
);

INSERT INTO city
VALUES(
      1880,
      "Leiria",
      64
);

INSERT INTO city
VALUES(
      1881,
      "Covilha",
      64
);

INSERT INTO city
VALUES(
      1882,
      "Portimao",
      64
);

INSERT INTO country
VALUES(
      65,
      "Palau"
);

INSERT INTO city
VALUES(
      1883,
      "Koror",
      65
);

INSERT INTO city
VALUES(
      1884,
      "Melekeok",
      65
);

INSERT INTO city
VALUES(
      1885,
      "Ngerulmud",
      65
);

INSERT INTO country
VALUES(
      66,
      "Paraguay"
);

INSERT INTO city
VALUES(
      1886,
      "La Victoria",
      66
);

INSERT INTO city
VALUES(
      1887,
      "General Eugenio Alejandrino Garay",
      66
);

INSERT INTO city
VALUES(
      1888,
      "Bella Vista",
      66
);

INSERT INTO city
VALUES(
      1889,
      "Nacunday",
      66
);

INSERT INTO city
VALUES(
      1890,
      "Mariscal Estigarribia",
      66
);

INSERT INTO city
VALUES(
      1891,
      "Horqueta",
      66
);

INSERT INTO city
VALUES(
      1892,
      "Capitan Pablo Lagerenza",
      66
);

INSERT INTO city
VALUES(
      1893,
      "Pozo Colorado",
      66
);

INSERT INTO city
VALUES(
      1894,
      "Belen",
      66
);

INSERT INTO city
VALUES(
      1895,
      "Fuerte Olimpo",
      66
);

INSERT INTO city
VALUES(
      1896,
      "Abai",
      66
);

INSERT INTO city
VALUES(
      1897,
      "Aregua",
      66
);

INSERT INTO city
VALUES(
      1898,
      "Caazapa",
      66
);

INSERT INTO city
VALUES(
      1899,
      "Concepcion",
      66
);

INSERT INTO city
VALUES(
      1900,
      "Caacupe",
      66
);

INSERT INTO city
VALUES(
      1901,
      "Villarrica",
      66
);

INSERT INTO city
VALUES(
      1902,
      "Pedro Juan Caballero",
      66
);

INSERT INTO city
VALUES(
      1903,
      "Encarnacion",
      66
);

INSERT INTO city
VALUES(
      1904,
      "Coronel Oviedo",
      66
);

INSERT INTO city
VALUES(
      1905,
      "Ciudad del Este",
      66
);

INSERT INTO city
VALUES(
      1906,
      "San Juan Bautista",
      66
);

INSERT INTO city
VALUES(
      1907,
      "Pilar",
      66
);

INSERT INTO city
VALUES(
      1908,
      "Paraguari",
      66
);

INSERT INTO city
VALUES(
      1909,
      "Villa Hayes",
      66
);

INSERT INTO city
VALUES(
      1910,
      "San Pedro",
      66
);

INSERT INTO city
VALUES(
      1911,
      "Ype Jhu",
      66
);

INSERT INTO city
VALUES(
      1912,
      "Filadelfia",
      66
);

INSERT INTO city
VALUES(
      1913,
      "Salto del Guaira",
      66
);

INSERT INTO city
VALUES(
      1914,
      "Asuncion",
      66
);

INSERT INTO city
VALUES(
      1915,
      "Puerto Pinasco",
      66
);

INSERT INTO city
VALUES(
      1916,
      "San Lorenzo",
      66
);

INSERT INTO city
VALUES(
      1917,
      "Ita",
      66
);

INSERT INTO city
VALUES(
      1918,
      "Hohenau",
      66
);

INSERT INTO city
VALUES(
      1919,
      "Ypacarai",
      66
);

INSERT INTO city
VALUES(
      1920,
      "Rosario",
      66
);

INSERT INTO city
VALUES(
      1921,
      "Coronel Bogado",
      66
);

INSERT INTO city
VALUES(
      1922,
      "Ygatimi",
      66
);

INSERT INTO city
VALUES(
      1923,
      "Arroyos y Esteros",
      66
);

INSERT INTO country
VALUES(
      67,
      "Qatar"
);

INSERT INTO city
VALUES(
      1924,
      "Az Za`ayin",
      67
);

INSERT INTO city
VALUES(
      1925,
      "Al Wakrah",
      67
);

INSERT INTO city
VALUES(
      1926,
      "Al Khawr",
      67
);

INSERT INTO city
VALUES(
      1927,
      "Madinat ash Shamal",
      67
);

INSERT INTO city
VALUES(
      1928,
      "Umm Salal `Ali",
      67
);

INSERT INTO city
VALUES(
      1929,
      "Ar Rayyan",
      67
);

INSERT INTO city
VALUES(
      1930,
      "Doha",
      67
);

INSERT INTO city
VALUES(
      1931,
      "Ash Shihaniyah",
      67
);

INSERT INTO country
VALUES(
      68,
      "Reunion"
);

INSERT INTO city
VALUES(
      1932,
      "St.-Denis",
      68
);

INSERT INTO city
VALUES(
      1933,
      "St.-Benoit",
      68
);

INSERT INTO country
VALUES(
      69,
      "Romania"
);

INSERT INTO city
VALUES(
      1934,
      "Drobeta-Turnu Severin",
      69
);

INSERT INTO city
VALUES(
      1935,
      "Braila",
      69
);

INSERT INTO city
VALUES(
      1936,
      "Oradea",
      69
);

INSERT INTO city
VALUES(
      1937,
      "Timisoara",
      69
);

INSERT INTO city
VALUES(
      1938,
      "Resita",
      69
);

INSERT INTO city
VALUES(
      1939,
      "Calarasi",
      69
);

INSERT INTO city
VALUES(
      1940,
      "Arad",
      69
);

INSERT INTO city
VALUES(
      1941,
      "Alexandria",
      69
);

INSERT INTO city
VALUES(
      1942,
      "Slobozia",
      69
);

INSERT INTO city
VALUES(
      1943,
      "Baia Mare",
      69
);

INSERT INTO city
VALUES(
      1944,
      "Tulcea",
      69
);

INSERT INTO city
VALUES(
      1945,
      "Ploiesti",
      69
);

INSERT INTO city
VALUES(
      1946,
      "Piatra-Neamt",
      69
);

INSERT INTO city
VALUES(
      1947,
      "Suceava",
      69
);

INSERT INTO city
VALUES(
      1948,
      "Botosani",
      69
);

INSERT INTO city
VALUES(
      1949,
      "Constanta",
      69
);

INSERT INTO city
VALUES(
      1950,
      "Buzau",
      69
);

INSERT INTO city
VALUES(
      1951,
      "Galati",
      69
);

INSERT INTO city
VALUES(
      1952,
      "Vaslui",
      69
);

INSERT INTO city
VALUES(
      1953,
      "Sfintu-Gheorghe",
      69
);

INSERT INTO city
VALUES(
      1954,
      "Bacau",
      69
);

INSERT INTO city
VALUES(
      1955,
      "Focsani",
      69
);

INSERT INTO city
VALUES(
      1956,
      "Bucharest",
      69
);

INSERT INTO city
VALUES(
      1957,
      "Brasov",
      69
);

INSERT INTO city
VALUES(
      1958,
      "Pitesti",
      69
);

INSERT INTO city
VALUES(
      1959,
      "Tirgu Mures",
      69
);

INSERT INTO city
VALUES(
      1960,
      "Deva",
      69
);

INSERT INTO city
VALUES(
      1961,
      "Cluj-Napoca",
      69
);

INSERT INTO city
VALUES(
      1962,
      "Rimnicu Vilcea",
      69
);

INSERT INTO city
VALUES(
      1963,
      "Sibiu",
      69
);

INSERT INTO city
VALUES(
      1964,
      "Targu Jiu",
      69
);

INSERT INTO city
VALUES(
      1965,
      "Alba Lulia",
      69
);

INSERT INTO city
VALUES(
      1966,
      "Giurgiu",
      69
);

INSERT INTO city
VALUES(
      1967,
      "Zalau",
      69
);

INSERT INTO city
VALUES(
      1968,
      "Craiova",
      69
);

INSERT INTO city
VALUES(
      1969,
      "Hunedoara",
      69
);

INSERT INTO city
VALUES(
      1970,
      "Targoviste",
      69
);

INSERT INTO city
VALUES(
      1971,
      "Bistrita",
      69
);

INSERT INTO city
VALUES(
      1972,
      "Satu Mare",
      69
);

INSERT INTO city
VALUES(
      1973,
      "Slatina",
      69
);

INSERT INTO city
VALUES(
      1974,
      "Miercurea Cuic",
      69
);

INSERT INTO city
VALUES(
      1975,
      "Iasi",
      69
);

INSERT INTO country
VALUES(
      70,
      "Serbia"
);

INSERT INTO city
VALUES(
      1976,
      "Belgrade",
      70
);

INSERT INTO city
VALUES(
      1977,
      "Arandelovac",
      70
);

INSERT INTO city
VALUES(
      1978,
      "Bela Palanka",
      70
);

INSERT INTO city
VALUES(
      1979,
      "Gadzin Han",
      70
);

INSERT INTO city
VALUES(
      1980,
      "Nis",
      70
);

INSERT INTO city
VALUES(
      1981,
      "Svrljig",
      70
);

INSERT INTO city
VALUES(
      1982,
      "Sokobanja",
      70
);

INSERT INTO city
VALUES(
      1983,
      "Boljevac",
      70
);

INSERT INTO city
VALUES(
      1984,
      "Zajecar",
      70
);

INSERT INTO city
VALUES(
      1985,
      "Bor",
      70
);

INSERT INTO city
VALUES(
      1986,
      "Negotin",
      70
);

INSERT INTO city
VALUES(
      1987,
      "Kladovo",
      70
);

INSERT INTO city
VALUES(
      1988,
      "Majdanpek",
      70
);

INSERT INTO city
VALUES(
      1989,
      "Golubac",
      70
);

INSERT INTO city
VALUES(
      1990,
      "Kucevo",
      70
);

INSERT INTO city
VALUES(
      1991,
      "Zagubica",
      70
);

INSERT INTO city
VALUES(
      1992,
      "Petrovac na Mlavi",
      70
);

INSERT INTO city
VALUES(
      1993,
      "Despotovac",
      70
);

INSERT INTO city
VALUES(
      1994,
      "Svilajnac",
      70
);

INSERT INTO city
VALUES(
      1995,
      "Doljevac",
      70
);

INSERT INTO city
VALUES(
      1996,
      "Merosina",
      70
);

INSERT INTO city
VALUES(
      1997,
      "Aleksinac",
      70
);

INSERT INTO city
VALUES(
      1998,
      "Blace",
      70
);

INSERT INTO city
VALUES(
      1999,
      "Brus",
      70
);

INSERT INTO city
VALUES(
      2000,
      "Krusevac",
      70
);

INSERT INTO city
VALUES(
      2001,
      "Aleksandrovac",
      70
);

INSERT INTO city
VALUES(
      2002,
      "Vrnjacka Banja",
      70
);

INSERT INTO city
VALUES(
      2003,
      "Trstenik",
      70
);

INSERT INTO city
VALUES(
      2004,
      "Varvarin",
      70
);

INSERT INTO city
VALUES(
      2005,
      "Cicevac",
      70
);

INSERT INTO city
VALUES(
      2006,
      "Razanj",
      70
);

INSERT INTO city
VALUES(
      2007,
      "Paracin",
      70
);

INSERT INTO city
VALUES(
      2008,
      "Cuprija",
      70
);

INSERT INTO city
VALUES(
      2009,
      "Jagodina",
      70
);

INSERT INTO city
VALUES(
      2010,
      "Rekovac",
      70
);

INSERT INTO city
VALUES(
      2011,
      "Ada",
      70
);

INSERT INTO city
VALUES(
      2012,
      "Alibunar",
      70
);

INSERT INTO city
VALUES(
      2013,
      "Apatin",
      70
);

INSERT INTO city
VALUES(
      2014,
      "Prijepolje",
      70
);

INSERT INTO city
VALUES(
      2015,
      "Raca",
      70
);

INSERT INTO city
VALUES(
      2016,
      "Raska",
      70
);

INSERT INTO city
VALUES(
      2017,
      "Ruma",
      70
);

INSERT INTO city
VALUES(
      2018,
      "Senta",
      70
);

INSERT INTO city
VALUES(
      2019,
      "Secanj",
      70
);

INSERT INTO city
VALUES(
      2020,
      "Sjenica",
      70
);

INSERT INTO city
VALUES(
      2021,
      "Smederevo",
      70
);

INSERT INTO city
VALUES(
      2022,
      "Smederevska Palanka",
      70
);

INSERT INTO city
VALUES(
      2023,
      "Sombor",
      70
);

INSERT INTO city
VALUES(
      2024,
      "Srbobran",
      70
);

INSERT INTO city
VALUES(
      2025,
      "Sremska Mitrovica",
      70
);

INSERT INTO city
VALUES(
      2026,
      "Sremski Karlovci",
      70
);

INSERT INTO city
VALUES(
      2027,
      "Stara Pazova",
      70
);

INSERT INTO city
VALUES(
      2028,
      "Subotica",
      70
);

INSERT INTO city
VALUES(
      2029,
      "Temerin",
      70
);

INSERT INTO city
VALUES(
      2030,
      "Titel",
      70
);

INSERT INTO city
VALUES(
      2031,
      "Topola",
      70
);

INSERT INTO city
VALUES(
      2032,
      "Tutin",
      70
);

INSERT INTO city
VALUES(
      2033,
      "Ub",
      70
);

INSERT INTO city
VALUES(
      2034,
      "Uzice",
      70
);

INSERT INTO city
VALUES(
      2035,
      "Valjevo",
      70
);

INSERT INTO city
VALUES(
      2036,
      "Veliko Gradiste",
      70
);

INSERT INTO city
VALUES(
      2037,
      "Vladimirci",
      70
);

INSERT INTO city
VALUES(
      2038,
      "Vrbas",
      70
);

INSERT INTO city
VALUES(
      2039,
      "Vrsac",
      70
);

INSERT INTO city
VALUES(
      2040,
      "Zrenjanin",
      70
);

INSERT INTO city
VALUES(
      2041,
      "Gornji Milanovac",
      70
);

INSERT INTO city
VALUES(
      2042,
      "Indija",
      70
);

INSERT INTO city
VALUES(
      2043,
      "Irig",
      70
);

INSERT INTO city
VALUES(
      2044,
      "Ivanjica",
      70
);

INSERT INTO city
VALUES(
      2045,
      "Kanjiza",
      70
);

INSERT INTO city
VALUES(
      2046,
      "Kikinda",
      70
);

INSERT INTO city
VALUES(
      2047,
      "Knic",
      70
);

INSERT INTO city
VALUES(
      2048,
      "Koceljeva",
      70
);

INSERT INTO city
VALUES(
      2049,
      "Kosjeric",
      70
);

INSERT INTO city
VALUES(
      2050,
      "Kovacica",
      70
);

INSERT INTO city
VALUES(
      2051,
      "Kovin",
      70
);

INSERT INTO city
VALUES(
      2052,
      "Kragujevac",
      70
);

INSERT INTO city
VALUES(
      2053,
      "Kraljevo",
      70
);

INSERT INTO city
VALUES(
      2054,
      "Krupanj",
      70
);

INSERT INTO city
VALUES(
      2055,
      "Kula",
      70
);

INSERT INTO city
VALUES(
      2056,
      "Lajkovac",
      70
);

INSERT INTO city
VALUES(
      2057,
      "Lapovo",
      70
);

INSERT INTO city
VALUES(
      2058,
      "Ljig",
      70
);

INSERT INTO city
VALUES(
      2059,
      "Ljubovija",
      70
);

INSERT INTO city
VALUES(
      2060,
      "Loznica",
      70
);

INSERT INTO city
VALUES(
      2061,
      "Lucani",
      70
);

INSERT INTO city
VALUES(
      2062,
      "Mali Idos",
      70
);

INSERT INTO city
VALUES(
      2063,
      "Mali Zvornik",
      70
);

INSERT INTO city
VALUES(
      2064,
      "Malo Crnice",
      70
);

INSERT INTO city
VALUES(
      2065,
      "Mionica",
      70
);

INSERT INTO city
VALUES(
      2066,
      "Nova Crnja",
      70
);

INSERT INTO city
VALUES(
      2067,
      "Nova Varos",
      70
);

INSERT INTO city
VALUES(
      2068,
      "Novi Becej",
      70
);

INSERT INTO city
VALUES(
      2069,
      "Novi Knezevac",
      70
);

INSERT INTO city
VALUES(
      2070,
      "Novi Pazar",
      70
);

INSERT INTO city
VALUES(
      2071,
      "Novi Sad",
      70
);

INSERT INTO city
VALUES(
      2072,
      "Odzaci",
      70
);

INSERT INTO city
VALUES(
      2073,
      "Opovo",
      70
);

INSERT INTO city
VALUES(
      2074,
      "Osecina",
      70
);

INSERT INTO city
VALUES(
      2075,
      "Pancevo",
      70
);

INSERT INTO city
VALUES(
      2076,
      "Pecinci",
      70
);

INSERT INTO city
VALUES(
      2077,
      "Plandiste",
      70
);

INSERT INTO city
VALUES(
      2078,
      "Pozarevac",
      70
);

INSERT INTO city
VALUES(
      2079,
      "Pozega",
      70
);

INSERT INTO city
VALUES(
      2080,
      "Priboj",
      70
);

INSERT INTO city
VALUES(
      2081,
      "Sid",
      70
);

INSERT INTO city
VALUES(
      2082,
      "Sabac",
      70
);

INSERT INTO city
VALUES(
      2083,
      "Arilje",
      70
);

INSERT INTO city
VALUES(
      2084,
      "Bajina Basta",
      70
);

INSERT INTO city
VALUES(
      2085,
      "Batocina",
      70
);

INSERT INTO city
VALUES(
      2086,
      "Bac",
      70
);

INSERT INTO city
VALUES(
      2087,
      "Backa Palanka",
      70
);

INSERT INTO city
VALUES(
      2088,
      "Backa Topola",
      70
);

INSERT INTO city
VALUES(
      2089,
      "Backi Petrovac",
      70
);

INSERT INTO city
VALUES(
      2090,
      "Bela Crkva",
      70
);

INSERT INTO city
VALUES(
      2091,
      "Becej",
      70
);

INSERT INTO city
VALUES(
      2092,
      "Bogatic",
      70
);

INSERT INTO city
VALUES(
      2093,
      "Zitiste",
      70
);

INSERT INTO city
VALUES(
      2094,
      "Zabari",
      70
);

INSERT INTO city
VALUES(
      2095,
      "Zabalj",
      70
);

INSERT INTO city
VALUES(
      2096,
      "Coka",
      70
);

INSERT INTO city
VALUES(
      2097,
      "Cacak",
      70
);

INSERT INTO city
VALUES(
      2098,
      "Trgoviste",
      70
);

INSERT INTO city
VALUES(
      2099,
      "Vranje",
      70
);

INSERT INTO city
VALUES(
      2100,
      "Bujanovac",
      70
);

INSERT INTO city
VALUES(
      2101,
      "Presevo",
      70
);

INSERT INTO city
VALUES(
      2102,
      "Bosilegrad",
      70
);

INSERT INTO city
VALUES(
      2103,
      "Surdulica",
      70
);

INSERT INTO city
VALUES(
      2104,
      "Vladicin Han",
      70
);

INSERT INTO city
VALUES(
      2105,
      "Crna Trava",
      70
);

INSERT INTO city
VALUES(
      2106,
      "Vlasotince",
      70
);

INSERT INTO city
VALUES(
      2107,
      "Zitorada",
      70
);

INSERT INTO city
VALUES(
      2108,
      "Prokuplje",
      70
);

INSERT INTO city
VALUES(
      2109,
      "Babusnica",
      70
);

INSERT INTO city
VALUES(
      2110,
      "Dimitrovgrad",
      70
);

INSERT INTO city
VALUES(
      2111,
      "Pirot",
      70
);

INSERT INTO city
VALUES(
      2112,
      "Knjazevac",
      70
);

INSERT INTO city
VALUES(
      2113,
      "Kursumlija",
      70
);

INSERT INTO city
VALUES(
      2114,
      "Medveda",
      70
);

INSERT INTO city
VALUES(
      2115,
      "Bojnik",
      70
);

INSERT INTO city
VALUES(
      2116,
      "Lebane",
      70
);

INSERT INTO city
VALUES(
      2117,
      "Leskovac",
      70
);

INSERT INTO city
VALUES(
      2118,
      "Cajetina",
      70
);

INSERT INTO city
VALUES(
      2119,
      "Velika Plana",
      70
);

INSERT INTO city
VALUES(
      2120,
      "Beocin",
      70
);

INSERT INTO country
VALUES(
      71,
      "Russia"
);

INSERT INTO city
VALUES(
      2121,
      "Volgodonsk",
      71
);

INSERT INTO city
VALUES(
      2122,
      "Saskylakh",
      71
);

INSERT INTO city
VALUES(
      2123,
      "Polevskoy",
      71
);

INSERT INTO city
VALUES(
      2124,
      "Saranpaul",
      71
);

INSERT INTO city
VALUES(
      2125,
      "Severnyy",
      71
);

INSERT INTO city
VALUES(
      2126,
      "Pervouralsk",
      71
);

INSERT INTO city
VALUES(
      2127,
      "Novy Port",
      71
);

INSERT INTO city
VALUES(
      2128,
      "Pugachev",
      71
);

INSERT INTO city
VALUES(
      2129,
      "Numto",
      71
);

INSERT INTO city
VALUES(
      2130,
      "Novy Urengoy",
      71
);

INSERT INTO city
VALUES(
      2131,
      "Novyy Uoyin",
      71
);

INSERT INTO city
VALUES(
      2132,
      "Nizhny Novgorod",
      71
);

INSERT INTO city
VALUES(
      2133,
      "Miass",
      71
);

INSERT INTO city
VALUES(
      2134,
      "Omsk",
      71
);

INSERT INTO city
VALUES(
      2135,
      "Naltchik",
      71
);

INSERT INTO city
VALUES(
      2136,
      "Mirnyy",
      71
);

INSERT INTO city
VALUES(
      2137,
      "Monchegorsk",
      71
);

INSERT INTO city
VALUES(
      2138,
      "Nyagan",
      71
);

INSERT INTO city
VALUES(
      2139,
      "Maykop",
      71
);

INSERT INTO city
VALUES(
      2140,
      "Kirensk",
      71
);

INSERT INTO city
VALUES(
      2141,
      "Kolpino",
      71
);

INSERT INTO city
VALUES(
      2142,
      "Khorgo",
      71
);

INSERT INTO city
VALUES(
      2143,
      "Kislovodsk",
      71
);

INSERT INTO city
VALUES(
      2144,
      "Guryevsk",
      71
);

INSERT INTO city
VALUES(
      2145,
      "Ivdel",
      71
);

INSERT INTO city
VALUES(
      2146,
      "Gusinoozyorsk",
      71
);

INSERT INTO city
VALUES(
      2147,
      "Kamenka",
      71
);

INSERT INTO city
VALUES(
      2148,
      "Kargat",
      71
);

INSERT INTO city
VALUES(
      2149,
      "Kasimov",
      71
);

INSERT INTO city
VALUES(
      2150,
      "Kolomna",
      71
);

INSERT INTO city
VALUES(
      2151,
      "Khanty Mansiysk",
      71
);

INSERT INTO city
VALUES(
      2152,
      "Dimitrovgrad",
      71
);

INSERT INTO city
VALUES(
      2153,
      "Cheremkhovo",
      71
);

INSERT INTO city
VALUES(
      2154,
      "Gornyak",
      71
);

INSERT INTO city
VALUES(
      2155,
      "Blagodarnyy",
      71
);

INSERT INTO city
VALUES(
      2156,
      "Bodaybo",
      71
);

INSERT INTO city
VALUES(
      2157,
      "Biysk",
      71
);

INSERT INTO city
VALUES(
      2158,
      "Abakan",
      71
);

INSERT INTO city
VALUES(
      2159,
      "Angarsk",
      71
);

INSERT INTO city
VALUES(
      2160,
      "Birsk",
      71
);

INSERT INTO city
VALUES(
      2161,
      "Pskov",
      71
);

INSERT INTO city
VALUES(
      2162,
      "Smolensk",
      71
);

INSERT INTO city
VALUES(
      2163,
      "Put Lenina",
      71
);

INSERT INTO city
VALUES(
      2164,
      "Kemerovo",
      71
);

INSERT INTO city
VALUES(
      2165,
      "Kolpashevo",
      71
);

INSERT INTO city
VALUES(
      2166,
      "Polyarnyy",
      71
);

INSERT INTO city
VALUES(
      2167,
      "St. Petersburg",
      71
);

INSERT INTO city
VALUES(
      2168,
      "Pyatigorsk",
      71
);

INSERT INTO city
VALUES(
      2169,
      "Nefteyugansk",
      71
);

INSERT INTO city
VALUES(
      2170,
      "Chernogorsk",
      71
);

INSERT INTO city
VALUES(
      2171,
      "Lensk",
      71
);

INSERT INTO city
VALUES(
      2172,
      "Krasnoarmeysk",
      71
);

INSERT INTO city
VALUES(
      2173,
      "Saratov",
      71
);

INSERT INTO city
VALUES(
      2174,
      "Shira",
      71
);

INSERT INTO city
VALUES(
      2175,
      "Solnechnogorsk",
      71
);

INSERT INTO city
VALUES(
      2176,
      "Irkutsk",
      71
);

INSERT INTO city
VALUES(
      2177,
      "Noyabrsk",
      71
);

INSERT INTO city
VALUES(
      2178,
      "Yurga",
      71
);

INSERT INTO city
VALUES(
      2179,
      "Zelenokumsk",
      71
);

INSERT INTO city
VALUES(
      2180,
      "Olenek",
      71
);

INSERT INTO city
VALUES(
      2181,
      "Salekhard",
      71
);

INSERT INTO city
VALUES(
      2182,
      "Borovichi",
      71
);

INSERT INTO city
VALUES(
      2183,
      "Kaluga",
      71
);

INSERT INTO city
VALUES(
      2184,
      "Izhevsk",
      71
);

INSERT INTO city
VALUES(
      2185,
      "Volsk",
      71
);

INSERT INTO city
VALUES(
      2186,
      "Cherepovets",
      71
);

INSERT INTO city
VALUES(
      2187,
      "Pallasovka",
      71
);

INSERT INTO city
VALUES(
      2188,
      "Peregrebnoye",
      71
);

INSERT INTO city
VALUES(
      2189,
      "Tyumen",
      71
);

INSERT INTO city
VALUES(
      2190,
      "Toguchin",
      71
);

INSERT INTO city
VALUES(
      2191,
      "Nadym",
      71
);

INSERT INTO city
VALUES(
      2192,
      "Matochkin Shar",
      71
);

INSERT INTO city
VALUES(
      2193,
      "Kurtamysh",
      71
);

INSERT INTO city
VALUES(
      2194,
      "Barnaul",
      71
);

INSERT INTO city
VALUES(
      2195,
      "Kimry",
      71
);

INSERT INTO city
VALUES(
      2196,
      "Elista",
      71
);

INSERT INTO city
VALUES(
      2197,
      "Gorno Altaysk",
      71
);

INSERT INTO city
VALUES(
      2198,
      "Surgut",
      71
);

INSERT INTO city
VALUES(
      2199,
      "Cheboksary",
      71
);

INSERT INTO city
VALUES(
      2200,
      "Mariinsk",
      71
);

INSERT INTO city
VALUES(
      2201,
      "Safonovo",
      71
);

INSERT INTO city
VALUES(
      2202,
      "Sayanogorsk",
      71
);

INSERT INTO city
VALUES(
      2203,
      "Roslavl",
      71
);

INSERT INTO city
VALUES(
      2204,
      "Rubtsovsk",
      71
);

INSERT INTO city
VALUES(
      2205,
      "Slyudyanka",
      71
);

INSERT INTO city
VALUES(
      2206,
      "Laryak",
      71
);

INSERT INTO city
VALUES(
      2207,
      "Abaza",
      71
);

INSERT INTO city
VALUES(
      2208,
      "Velikiy Novgorod",
      71
);

INSERT INTO city
VALUES(
      2209,
      "Klin",
      71
);

INSERT INTO city
VALUES(
      2210,
      "Bagdarin",
      71
);

INSERT INTO city
VALUES(
      2211,
      "Kovrov",
      71
);

INSERT INTO city
VALUES(
      2212,
      "Sokol",
      71
);

INSERT INTO city
VALUES(
      2213,
      "Engels",
      71
);

INSERT INTO city
VALUES(
      2214,
      "Gatchina",
      71
);

INSERT INTO city
VALUES(
      2215,
      "Nizhnyaya Tura",
      71
);

INSERT INTO city
VALUES(
      2216,
      "Mundybash",
      71
);

INSERT INTO city
VALUES(
      2217,
      "Prokopyevsk",
      71
);

INSERT INTO city
VALUES(
      2218,
      "Kiselevsk",
      71
);

INSERT INTO city
VALUES(
      2219,
      "Novokuznetsk",
      71
);

INSERT INTO city
VALUES(
      2220,
      "Luga",
      71
);

INSERT INTO city
VALUES(
      2221,
      "Moscow",
      71
);

INSERT INTO city
VALUES(
      2222,
      "Slavgorod",
      71
);

INSERT INTO city
VALUES(
      2223,
      "Kulunda",
      71
);

INSERT INTO city
VALUES(
      2224,
      "Krasnoturinsk",
      71
);

INSERT INTO city
VALUES(
      2225,
      "Vladikavkaz",
      71
);

INSERT INTO city
VALUES(
      2226,
      "Amderma",
      71
);

INSERT INTO city
VALUES(
      2227,
      "Varnek",
      71
);

INSERT INTO city
VALUES(
      2228,
      "Leninsk Kuznetsky",
      71
);

INSERT INTO city
VALUES(
      2229,
      "Mozdok",
      71
);

INSERT INTO city
VALUES(
      2230,
      "Tashtagol",
      71
);

INSERT INTO city
VALUES(
      2231,
      "Megion",
      71
);

INSERT INTO city
VALUES(
      2232,
      "Balashov",
      71
);

INSERT INTO city
VALUES(
      2233,
      "Zima",
      71
);

INSERT INTO city
VALUES(
      2234,
      "Samara",
      71
);

INSERT INTO city
VALUES(
      2235,
      "Vyazma",
      71
);

INSERT INTO city
VALUES(
      2236,
      "Igrim",
      71
);

INSERT INTO city
VALUES(
      2237,
      "Norilsk",
      71
);

INSERT INTO city
VALUES(
      2238,
      "Belebey",
      71
);

INSERT INTO city
VALUES(
      2239,
      "Kalachinsk",
      71
);

INSERT INTO city
VALUES(
      2240,
      "Vologda",
      71
);

INSERT INTO city
VALUES(
      2241,
      "Orenburg",
      71
);

INSERT INTO city
VALUES(
      2242,
      "Vyborg",
      71
);

INSERT INTO city
VALUES(
      2243,
      "Svetogorsk",
      71
);

INSERT INTO city
VALUES(
      2244,
      "Cherlak",
      71
);

INSERT INTO city
VALUES(
      2245,
      "Mezen",
      71
);

INSERT INTO city
VALUES(
      2246,
      "Buzuluk",
      71
);

INSERT INTO city
VALUES(
      2247,
      "Kupina",
      71
);

INSERT INTO city
VALUES(
      2248,
      "Karasuk",
      71
);

INSERT INTO city
VALUES(
      2249,
      "Saransk",
      71
);

INSERT INTO city
VALUES(
      2250,
      "Barabinsk",
      71
);

INSERT INTO city
VALUES(
      2251,
      "Bukachacha",
      71
);

INSERT INTO city
VALUES(
      2252,
      "Alatyr",
      71
);

INSERT INTO city
VALUES(
      2253,
      "Shilka",
      71
);

INSERT INTO city
VALUES(
      2254,
      "Sherlovaya Gora",
      71
);

INSERT INTO city
VALUES(
      2255,
      "Nerchinsk",
      71
);

INSERT INTO city
VALUES(
      2256,
      "Olovyannaya",
      71
);

INSERT INTO city
VALUES(
      2257,
      "Borzya",
      71
);

INSERT INTO city
VALUES(
      2258,
      "Bugulma",
      71
);

INSERT INTO city
VALUES(
      2259,
      "Strezhevoy",
      71
);

INSERT INTO city
VALUES(
      2260,
      "Nizhenvartovsk",
      71
);

INSERT INTO city
VALUES(
      2261,
      "Anzhero Sudzhensk",
      71
);

INSERT INTO city
VALUES(
      2262,
      "Rayevskiy",
      71
);

INSERT INTO city
VALUES(
      2263,
      "Chita",
      71
);

INSERT INTO city
VALUES(
      2264,
      "Artemovskiy",
      71
);

INSERT INTO city
VALUES(
      2265,
      "Ryazan",
      71
);

INSERT INTO city
VALUES(
      2266,
      "Bezhetsk",
      71
);

INSERT INTO city
VALUES(
      2267,
      "Novomoskovsk",
      71
);

INSERT INTO city
VALUES(
      2268,
      "Zheleznogorsk",
      71
);

INSERT INTO city
VALUES(
      2269,
      "Alapayevsk",
      71
);

INSERT INTO city
VALUES(
      2270,
      "Starsy Oskol",
      71
);

INSERT INTO city
VALUES(
      2271,
      "Rostov",
      71
);

INSERT INTO city
VALUES(
      2272,
      "Gubkin",
      71
);

INSERT INTO city
VALUES(
      2273,
      "Kumertau",
      71
);

INSERT INTO city
VALUES(
      2274,
      "Oktyabrskiy",
      71
);

INSERT INTO city
VALUES(
      2275,
      "Zheleznogorsk Ilimskiy",
      71
);

INSERT INTO city
VALUES(
      2276,
      "Noginsk",
      71
);

INSERT INTO city
VALUES(
      2277,
      "Staraya Russa",
      71
);

INSERT INTO city
VALUES(
      2278,
      "Tikhvin",
      71
);

INSERT INTO city
VALUES(
      2279,
      "Asbest",
      71
);

INSERT INTO city
VALUES(
      2280,
      "Yoshkar Ola",
      71
);

INSERT INTO city
VALUES(
      2281,
      "Ufa",
      71
);

INSERT INTO city
VALUES(
      2282,
      "Krasnokamensk",
      71
);

INSERT INTO city
VALUES(
      2283,
      "Orsk",
      71
);

INSERT INTO city
VALUES(
      2284,
      "Novotroitsk",
      71
);

INSERT INTO city
VALUES(
      2285,
      "Bologoye",
      71
);

INSERT INTO city
VALUES(
      2286,
      "Mikhaylovka",
      71
);

INSERT INTO city
VALUES(
      2287,
      "Novozybkov",
      71
);

INSERT INTO city
VALUES(
      2288,
      "Chapayevsk",
      71
);

INSERT INTO city
VALUES(
      2289,
      "Novokuybishevsk",
      71
);

INSERT INTO city
VALUES(
      2290,
      "Tavda",
      71
);

INSERT INTO city
VALUES(
      2291,
      "Michurinsk",
      71
);

INSERT INTO city
VALUES(
      2292,
      "Serov",
      71
);

INSERT INTO city
VALUES(
      2293,
      "Alekseyevka",
      71
);

INSERT INTO city
VALUES(
      2294,
      "Valuyki",
      71
);

INSERT INTO city
VALUES(
      2295,
      "Tuymazy",
      71
);

INSERT INTO city
VALUES(
      2296,
      "Lgov",
      71
);

INSERT INTO city
VALUES(
      2297,
      "Rybinsk",
      71
);

INSERT INTO city
VALUES(
      2298,
      "Uglich",
      71
);

INSERT INTO city
VALUES(
      2299,
      "Slantsy",
      71
);

INSERT INTO city
VALUES(
      2300,
      "Vyska",
      71
);

INSERT INTO city
VALUES(
      2301,
      "Armavir",
      71
);

INSERT INTO city
VALUES(
      2302,
      "Stavropol",
      71
);

INSERT INTO city
VALUES(
      2303,
      "Bryansk",
      71
);

INSERT INTO city
VALUES(
      2304,
      "Kropotkin",
      71
);

INSERT INTO city
VALUES(
      2305,
      "Shchekino",
      71
);

INSERT INTO city
VALUES(
      2306,
      "Derbent",
      71
);

INSERT INTO city
VALUES(
      2307,
      "Nikolayevsk",
      71
);

INSERT INTO city
VALUES(
      2308,
      "Tula",
      71
);

INSERT INTO city
VALUES(
      2309,
      "Murom",
      71
);

INSERT INTO city
VALUES(
      2310,
      "Plast",
      71
);

INSERT INTO city
VALUES(
      2311,
      "Kamyshin",
      71
);

INSERT INTO city
VALUES(
      2312,
      "Syzran",
      71
);

INSERT INTO city
VALUES(
      2313,
      "Kuznetsk",
      71
);

INSERT INTO city
VALUES(
      2314,
      "Gelendzhik",
      71
);

INSERT INTO city
VALUES(
      2315,
      "Sharya",
      71
);

INSERT INTO city
VALUES(
      2316,
      "Murmansk",
      71
);

INSERT INTO city
VALUES(
      2317,
      "Isikul",
      71
);

INSERT INTO city
VALUES(
      2318,
      "Frolovo",
      71
);

INSERT INTO city
VALUES(
      2319,
      "Severomorsk",
      71
);

INSERT INTO city
VALUES(
      2320,
      "Dzerzhinsk",
      71
);

INSERT INTO city
VALUES(
      2321,
      "Yalutorovsk",
      71
);

INSERT INTO city
VALUES(
      2322,
      "Uryupinsk",
      71
);

INSERT INTO city
VALUES(
      2323,
      "Golyshmanovo",
      71
);

INSERT INTO city
VALUES(
      2324,
      "Nazyvayevsk",
      71
);

INSERT INTO city
VALUES(
      2325,
      "Tatarsk",
      71
);

INSERT INTO city
VALUES(
      2326,
      "Sarapul",
      71
);

INSERT INTO city
VALUES(
      2327,
      "Tayshet",
      71
);

INSERT INTO city
VALUES(
      2328,
      "Nevinnomyssk",
      71
);

INSERT INTO city
VALUES(
      2329,
      "Velikiye Luki",
      71
);

INSERT INTO city
VALUES(
      2330,
      "Nizhnekamsk",
      71
);

INSERT INTO city
VALUES(
      2331,
      "Kirov",
      71
);

INSERT INTO city
VALUES(
      2332,
      "Dyatkovo",
      71
);

INSERT INTO city
VALUES(
      2333,
      "Tara",
      71
);

INSERT INTO city
VALUES(
      2334,
      "Borisoglebsk",
      71
);

INSERT INTO city
VALUES(
      2335,
      "Klintsy",
      71
);

INSERT INTO city
VALUES(
      2336,
      "Mozhga",
      71
);

INSERT INTO city
VALUES(
      2337,
      "Rzhev",
      71
);

INSERT INTO city
VALUES(
      2338,
      "Naberezhnyye Chelny",
      71
);

INSERT INTO city
VALUES(
      2339,
      "Vichuga",
      71
);

INSERT INTO city
VALUES(
      2340,
      "Mtsensk",
      71
);

INSERT INTO city
VALUES(
      2341,
      "Kanash",
      71
);

INSERT INTO city
VALUES(
      2342,
      "Topki",
      71
);

INSERT INTO city
VALUES(
      2343,
      "Shuya",
      71
);

INSERT INTO city
VALUES(
      2344,
      "Torzhok",
      71
);

INSERT INTO city
VALUES(
      2345,
      "Biryusinsk",
      71
);

INSERT INTO city
VALUES(
      2346,
      "Otradnyy",
      71
);

INSERT INTO city
VALUES(
      2347,
      "Serpukhov",
      71
);

INSERT INTO city
VALUES(
      2348,
      "Balakovo",
      71
);

INSERT INTO city
VALUES(
      2349,
      "Atkarsk",
      71
);

INSERT INTO city
VALUES(
      2350,
      "Kirovo-Chepetsk",
      71
);

INSERT INTO city
VALUES(
      2351,
      "Kirov",
      71
);

INSERT INTO city
VALUES(
      2352,
      "Serdobsk",
      71
);

INSERT INTO city
VALUES(
      2353,
      "Aleksin",
      71
);

INSERT INTO city
VALUES(
      2354,
      "Shumerlya",
      71
);

INSERT INTO city
VALUES(
      2355,
      "Yefremov",
      71
);

INSERT INTO city
VALUES(
      2356,
      "Buynaksk",
      71
);

INSERT INTO city
VALUES(
      2357,
      "Makhachkala",
      71
);

INSERT INTO city
VALUES(
      2358,
      "Yaroslavl",
      71
);

INSERT INTO city
VALUES(
      2359,
      "Sovetsk",
      71
);

INSERT INTO city
VALUES(
      2360,
      "Salavat",
      71
);

INSERT INTO city
VALUES(
      2361,
      "Sterlitamak",
      71
);

INSERT INTO city
VALUES(
      2362,
      "Bogoroditsk",
      71
);

INSERT INTO city
VALUES(
      2363,
      "Morshansk",
      71
);

INSERT INTO city
VALUES(
      2364,
      "Obninsk",
      71
);

INSERT INTO city
VALUES(
      2365,
      "Georgievsk",
      71
);

INSERT INTO city
VALUES(
      2366,
      "Sol-lletsk",
      71
);

INSERT INTO city
VALUES(
      2367,
      "Vladimir",
      71
);

INSERT INTO city
VALUES(
      2368,
      "Pechora",
      71
);

INSERT INTO city
VALUES(
      2369,
      "Ulyanovsk",
      71
);

INSERT INTO city
VALUES(
      2370,
      "Kirsanov",
      71
);

INSERT INTO city
VALUES(
      2371,
      "Kotovsk",
      71
);

INSERT INTO city
VALUES(
      2372,
      "Tambov",
      71
);

INSERT INTO city
VALUES(
      2373,
      "Volkhov",
      71
);

INSERT INTO city
VALUES(
      2374,
      "Vyshnniy Volochek",
      71
);

INSERT INTO city
VALUES(
      2375,
      "Orel",
      71
);

INSERT INTO city
VALUES(
      2376,
      "Kandalaksha",
      71
);

INSERT INTO city
VALUES(
      2377,
      "Ussuriysk",
      71
);

INSERT INTO city
VALUES(
      2378,
      "Petrozavodsk",
      71
);

INSERT INTO city
VALUES(
      2379,
      "Votkinsk",
      71
);

INSERT INTO city
VALUES(
      2380,
      "Omutninsk",
      71
);

INSERT INTO city
VALUES(
      2381,
      "Novoaltaysk",
      71
);

INSERT INTO city
VALUES(
      2382,
      "Usta Ordynskiy",
      71
);

INSERT INTO city
VALUES(
      2383,
      "Kirs",
      71
);

INSERT INTO city
VALUES(
      2384,
      "Kondopoga",
      71
);

INSERT INTO city
VALUES(
      2385,
      "Ruzayevka",
      71
);

INSERT INTO city
VALUES(
      2386,
      "Tver",
      71
);

INSERT INTO city
VALUES(
      2387,
      "Kotelnich",
      71
);

INSERT INTO city
VALUES(
      2388,
      "Kaliningrad",
      71
);

INSERT INTO city
VALUES(
      2389,
      "Perma",
      71
);

INSERT INTO city
VALUES(
      2390,
      "Penza",
      71
);

INSERT INTO city
VALUES(
      2391,
      "Velikiy Ustyug",
      71
);

INSERT INTO city
VALUES(
      2392,
      "Aleysk",
      71
);

INSERT INTO city
VALUES(
      2393,
      "Balakhna",
      71
);

INSERT INTO city
VALUES(
      2394,
      "Podolsk",
      71
);

INSERT INTO city
VALUES(
      2395,
      "Kineshma",
      71
);

INSERT INTO city
VALUES(
      2396,
      "Yegoryevsk",
      71
);

INSERT INTO city
VALUES(
      2397,
      "Volzhskiy",
      71
);

INSERT INTO city
VALUES(
      2398,
      "Volgograd",
      71
);

INSERT INTO city
VALUES(
      2399,
      "Onega",
      71
);

INSERT INTO city
VALUES(
      2400,
      "Cherepanovo",
      71
);

INSERT INTO city
VALUES(
      2401,
      "Apatity",
      71
);

INSERT INTO city
VALUES(
      2402,
      "Umba",
      71
);

INSERT INTO city
VALUES(
      2403,
      "Kovda",
      71
);

INSERT INTO city
VALUES(
      2404,
      "Kirovsk",
      71
);

INSERT INTO city
VALUES(
      2405,
      "Iskitim",
      71
);

INSERT INTO city
VALUES(
      2406,
      "Belgorod",
      71
);

INSERT INTO city
VALUES(
      2407,
      "Taganrog",
      71
);

INSERT INTO city
VALUES(
      2408,
      "Velsk",
      71
);

INSERT INTO city
VALUES(
      2409,
      "Sasovo",
      71
);

INSERT INTO city
VALUES(
      2410,
      "Voronezh",
      71
);

INSERT INTO city
VALUES(
      2411,
      "Syktyvkar",
      71
);

INSERT INTO city
VALUES(
      2412,
      "Krasnoufimsk",
      71
);

INSERT INTO city
VALUES(
      2413,
      "Lipetsk",
      71
);

INSERT INTO city
VALUES(
      2414,
      "Yelets",
      71
);

INSERT INTO city
VALUES(
      2415,
      "Ust Kut",
      71
);

INSERT INTO city
VALUES(
      2416,
      "Magnitogorsk",
      71
);

INSERT INTO city
VALUES(
      2417,
      "Gryazi",
      71
);

INSERT INTO city
VALUES(
      2418,
      "Kazan",
      71
);

INSERT INTO city
VALUES(
      2419,
      "Arzamas",
      71
);

INSERT INTO city
VALUES(
      2420,
      "Buy",
      71
);

INSERT INTO city
VALUES(
      2421,
      "Kostroma",
      71
);

INSERT INTO city
VALUES(
      2422,
      "Zelenodolsk",
      71
);

INSERT INTO city
VALUES(
      2423,
      "Nizhneudinsk",
      71
);

INSERT INTO city
VALUES(
      2424,
      "Chistopol",
      71
);

INSERT INTO city
VALUES(
      2425,
      "Perm",
      71
);

INSERT INTO city
VALUES(
      2426,
      "Nizhny Tagil",
      71
);

INSERT INTO city
VALUES(
      2427,
      "Kem",
      71
);

INSERT INTO city
VALUES(
      2428,
      "Belomorsk",
      71
);

INSERT INTO city
VALUES(
      2429,
      "Ob",
      71
);

INSERT INTO city
VALUES(
      2430,
      "Novosibirsk",
      71
);

INSERT INTO city
VALUES(
      2431,
      "Cherkessk",
      71
);

INSERT INTO city
VALUES(
      2432,
      "Livny",
      71
);

INSERT INTO city
VALUES(
      2433,
      "Sibay",
      71
);

INSERT INTO city
VALUES(
      2434,
      "Kursk",
      71
);

INSERT INTO city
VALUES(
      2435,
      "Verkhnyaya Salda",
      71
);

INSERT INTO city
VALUES(
      2436,
      "Naryan Mar",
      71
);

INSERT INTO city
VALUES(
      2437,
      "Kyshtym",
      71
);

INSERT INTO city
VALUES(
      2438,
      "Krasnouralsk",
      71
);

INSERT INTO city
VALUES(
      2439,
      "Almetyevsk",
      71
);

INSERT INTO city
VALUES(
      2440,
      "Archangel",
      71
);

INSERT INTO city
VALUES(
      2441,
      "Verkhniy Ufaley",
      71
);

INSERT INTO city
VALUES(
      2442,
      "Chusovoy",
      71
);

INSERT INTO city
VALUES(
      2443,
      "Nikel",
      71
);

INSERT INTO city
VALUES(
      2444,
      "Zlatoust",
      71
);

INSERT INTO city
VALUES(
      2445,
      "Nevyansk",
      71
);

INSERT INTO city
VALUES(
      2446,
      "Sochi",
      71
);

INSERT INTO city
VALUES(
      2447,
      "Novoshakhtinsk",
      71
);

INSERT INTO city
VALUES(
      2448,
      "Bugrino",
      71
);

INSERT INTO city
VALUES(
      2449,
      "Shakhty",
      71
);

INSERT INTO city
VALUES(
      2450,
      "Bataysk",
      71
);

INSERT INTO city
VALUES(
      2451,
      "Astrakhan",
      71
);

INSERT INTO city
VALUES(
      2452,
      "Kotlas",
      71
);

INSERT INTO city
VALUES(
      2453,
      "Indiga",
      71
);

INSERT INTO city
VALUES(
      2454,
      "Severouralsk",
      71
);

INSERT INTO city
VALUES(
      2455,
      "Akhtubinsk",
      71
);

INSERT INTO city
VALUES(
      2456,
      "Shoyna",
      71
);

INSERT INTO city
VALUES(
      2457,
      "Sosnogorsk",
      71
);

INSERT INTO city
VALUES(
      2458,
      "Shebekino",
      71
);

INSERT INTO city
VALUES(
      2459,
      "Ukhta",
      71
);

INSERT INTO city
VALUES(
      2460,
      "Yemanzhelinsk",
      71
);

INSERT INTO city
VALUES(
      2461,
      "Bakal",
      71
);

INSERT INTO city
VALUES(
      2462,
      "Troitsk",
      71
);

INSERT INTO city
VALUES(
      2463,
      "Yekaterinburg",
      71
);

INSERT INTO city
VALUES(
      2464,
      "Segezha",
      71
);

INSERT INTO city
VALUES(
      2465,
      "Kamensk Uralskiy",
      71
);

INSERT INTO city
VALUES(
      2466,
      "Karpinsk",
      71
);

INSERT INTO city
VALUES(
      2467,
      "Usinsk",
      71
);

INSERT INTO city
VALUES(
      2468,
      "Kudymkar",
      71
);

INSERT INTO city
VALUES(
      2469,
      "Vikhorevka",
      71
);

INSERT INTO city
VALUES(
      2470,
      "Bratsk",
      71
);

INSERT INTO city
VALUES(
      2471,
      "Glazov",
      71
);

INSERT INTO city
VALUES(
      2472,
      "Solikamsk",
      71
);

INSERT INTO city
VALUES(
      2473,
      "Severodvinsk",
      71
);

INSERT INTO city
VALUES(
      2474,
      "Mednogorsk",
      71
);

INSERT INTO city
VALUES(
      2475,
      "Gay",
      71
);

INSERT INTO city
VALUES(
      2476,
      "Dombarovskiy",
      71
);

INSERT INTO city
VALUES(
      2477,
      "Kungur",
      71
);

INSERT INTO city
VALUES(
      2478,
      "Gubakha",
      71
);

INSERT INTO city
VALUES(
      2479,
      "Kurgan",
      71
);

INSERT INTO city
VALUES(
      2480,
      "Ust-Ulimsk",
      71
);

INSERT INTO city
VALUES(
      2481,
      "Slobodskoy",
      71
);

INSERT INTO city
VALUES(
      2482,
      "Kizel",
      71
);

INSERT INTO city
VALUES(
      2483,
      "Leninogorsk",
      71
);

INSERT INTO city
VALUES(
      2484,
      "Rostov",
      71
);

INSERT INTO city
VALUES(
      2485,
      "Orekhovo-Zuevo",
      71
);

INSERT INTO city
VALUES(
      2486,
      "Buguruslan",
      71
);

INSERT INTO city
VALUES(
      2487,
      "Turukhansk",
      71
);

INSERT INTO city
VALUES(
      2488,
      "Zmeinogorsk",
      71
);

INSERT INTO city
VALUES(
      2489,
      "Ulan Ude",
      71
);

INSERT INTO city
VALUES(
      2490,
      "Teli",
      71
);

INSERT INTO city
VALUES(
      2491,
      "Asino",
      71
);

INSERT INTO city
VALUES(
      2492,
      "Vladivostok",
      71
);

INSERT INTO city
VALUES(
      2493,
      "Shadrinsk",
      71
);

INSERT INTO city
VALUES(
      2494,
      "Vorontsovo",
      71
);

INSERT INTO city
VALUES(
      2495,
      "Kyzyl",
      71
);

INSERT INTO city
VALUES(
      2496,
      "Tazovskiy",
      71
);

INSERT INTO city
VALUES(
      2497,
      "Magas",
      71
);

INSERT INTO city
VALUES(
      2498,
      "Nazran",
      71
);

INSERT INTO city
VALUES(
      2499,
      "Groznyy",
      71
);

INSERT INTO city
VALUES(
      2500,
      "Krasnokamsk",
      71
);

INSERT INTO city
VALUES(
      2501,
      "Asha",
      71
);

INSERT INTO city
VALUES(
      2502,
      "Berezniki",
      71
);

INSERT INTO city
VALUES(
      2503,
      "Nelidovo",
      71
);

INSERT INTO city
VALUES(
      2504,
      "Ivanovo",
      71
);

INSERT INTO city
VALUES(
      2505,
      "Sergiyev Posad",
      71
);

INSERT INTO city
VALUES(
      2506,
      "Tolyatti",
      71
);

INSERT INTO city
VALUES(
      2507,
      "Uelen",
      71
);

INSERT INTO city
VALUES(
      2508,
      "Skovorodino",
      71
);

INSERT INTO city
VALUES(
      2509,
      "Kyakhta",
      71
);

INSERT INTO city
VALUES(
      2510,
      "Zvezdnyy",
      71
);

INSERT INTO city
VALUES(
      2511,
      "Dalnerechensk",
      71
);

INSERT INTO city
VALUES(
      2512,
      "Bikin",
      71
);

INSERT INTO city
VALUES(
      2513,
      "Magdagachi",
      71
);

INSERT INTO city
VALUES(
      2514,
      "Shimanovsk",
      71
);

INSERT INTO city
VALUES(
      2515,
      "Zeya",
      71
);

INSERT INTO city
VALUES(
      2516,
      "Neftekamsk",
      71
);

INSERT INTO city
VALUES(
      2517,
      "Nordvik",
      71
);

INSERT INTO city
VALUES(
      2518,
      "Khatanga",
      71
);

INSERT INTO city
VALUES(
      2519,
      "Agapa",
      71
);

INSERT INTO city
VALUES(
      2520,
      "Yessey",
      71
);

INSERT INTO city
VALUES(
      2521,
      "Nakhodka",
      71
);

INSERT INTO city
VALUES(
      2522,
      "Partizansk",
      71
);

INSERT INTO city
VALUES(
      2523,
      "Kodinskiy",
      71
);

INSERT INTO city
VALUES(
      2524,
      "Khabarovsk",
      71
);

INSERT INTO city
VALUES(
      2525,
      "Boyarka",
      71
);

INSERT INTO city
VALUES(
      2526,
      "Savetskaya Gavan",
      71
);

INSERT INTO city
VALUES(
      2527,
      "Uyar",
      71
);

INSERT INTO city
VALUES(
      2528,
      "Bogotol",
      71
);

INSERT INTO city
VALUES(
      2529,
      "Lesosibirsk",
      71
);

INSERT INTO city
VALUES(
      2530,
      "Noginsk",
      71
);

INSERT INTO city
VALUES(
      2531,
      "Artemovsk",
      71
);

INSERT INTO city
VALUES(
      2532,
      "Podkamennaya",
      71
);

INSERT INTO city
VALUES(
      2533,
      "Dikson",
      71
);

INSERT INTO city
VALUES(
      2534,
      "Igarka",
      71
);

INSERT INTO city
VALUES(
      2535,
      "Komsa",
      71
);

INSERT INTO city
VALUES(
      2536,
      "Kansk",
      71
);

INSERT INTO city
VALUES(
      2537,
      "Arsenyev",
      71
);

INSERT INTO city
VALUES(
      2538,
      "Starorybnoye",
      71
);

INSERT INTO city
VALUES(
      2539,
      "Zaozernyy",
      71
);

INSERT INTO city
VALUES(
      2540,
      "Achinsk",
      71
);

INSERT INTO city
VALUES(
      2541,
      "Omolon",
      71
);

INSERT INTO city
VALUES(
      2542,
      "Pevek",
      71
);

INSERT INTO city
VALUES(
      2543,
      "Mikhalkino",
      71
);

INSERT INTO city
VALUES(
      2544,
      "Lesozavodsk",
      71
);

INSERT INTO city
VALUES(
      2545,
      "Pokrovsk",
      71
);

INSERT INTO city
VALUES(
      2546,
      "Olyokminsk",
      71
);

INSERT INTO city
VALUES(
      2547,
      "Svobodnyy",
      71
);

INSERT INTO city
VALUES(
      2548,
      "Omsukchan",
      71
);

INSERT INTO city
VALUES(
      2549,
      "Tynda",
      71
);

INSERT INTO city
VALUES(
      2550,
      "Omchak",
      71
);

INSERT INTO city
VALUES(
      2551,
      "Progress",
      71
);

INSERT INTO city
VALUES(
      2552,
      "Belogorsk",
      71
);

INSERT INTO city
VALUES(
      2553,
      "Susuman",
      71
);

INSERT INTO city
VALUES(
      2554,
      "Amursk",
      71
);

INSERT INTO city
VALUES(
      2555,
      "Kavalerovo",
      71
);

INSERT INTO city
VALUES(
      2556,
      "Dalnegorsk",
      71
);

INSERT INTO city
VALUES(
      2557,
      "Ishim",
      71
);

INSERT INTO city
VALUES(
      2558,
      "Yakutsk",
      71
);

INSERT INTO city
VALUES(
      2559,
      "Kamenna Obi",
      71
);

INSERT INTO city
VALUES(
      2560,
      "Severobaykalsk",
      71
);

INSERT INTO city
VALUES(
      2561,
      "Trofimovsk",
      71
);

INSERT INTO city
VALUES(
      2562,
      "Novorossiysk",
      71
);

INSERT INTO city
VALUES(
      2563,
      "Inta",
      71
);

INSERT INTO city
VALUES(
      2564,
      "Gyda",
      71
);

INSERT INTO city
VALUES(
      2565,
      "Uray",
      71
);

INSERT INTO city
VALUES(
      2566,
      "Tobolsk",
      71
);

INSERT INTO city
VALUES(
      2567,
      "Suntar",
      71
);

INSERT INTO city
VALUES(
      2568,
      "Vorkuta",
      71
);

INSERT INTO city
VALUES(
      2569,
      "Uzhur",
      71
);

INSERT INTO city
VALUES(
      2570,
      "Bilibino",
      71
);

INSERT INTO city
VALUES(
      2571,
      "Tiksi",
      71
);

INSERT INTO city
VALUES(
      2572,
      "Beringovskiy",
      71
);

INSERT INTO city
VALUES(
      2573,
      "Okha",
      71
);

INSERT INTO city
VALUES(
      2574,
      "Nogliki",
      71
);

INSERT INTO city
VALUES(
      2575,
      "Ambarchik",
      71
);

INSERT INTO city
VALUES(
      2576,
      "Spassk Dalniy",
      71
);

INSERT INTO city
VALUES(
      2577,
      "Komsomolsk na Amure",
      71
);

INSERT INTO city
VALUES(
      2578,
      "Ust Kamchatsk",
      71
);

INSERT INTO city
VALUES(
      2579,
      "Sagastyr",
      71
);

INSERT INTO city
VALUES(
      2580,
      "Birobidzhan",
      71
);

INSERT INTO city
VALUES(
      2581,
      "Obluchye",
      71
);

INSERT INTO city
VALUES(
      2582,
      "Manily",
      71
);

INSERT INTO city
VALUES(
      2583,
      "Cherskiy",
      71
);

INSERT INTO city
VALUES(
      2584,
      "Bolasheretsk",
      71
);

INSERT INTO city
VALUES(
      2585,
      "Oktyabrskiy",
      71
);

INSERT INTO city
VALUES(
      2586,
      "Chegdomyn",
      71
);

INSERT INTO city
VALUES(
      2587,
      "Evensk",
      71
);

INSERT INTO city
VALUES(
      2588,
      "Utkholok",
      71
);

INSERT INTO city
VALUES(
      2589,
      "Karamken",
      71
);

INSERT INTO city
VALUES(
      2590,
      "Kartaly",
      71
);

INSERT INTO city
VALUES(
      2591,
      "Siglan",
      71
);

INSERT INTO city
VALUES(
      2592,
      "Ust Nera",
      71
);

INSERT INTO city
VALUES(
      2593,
      "Pakhachi",
      71
);

INSERT INTO city
VALUES(
      2594,
      "Nakhodka",
      71
);

INSERT INTO city
VALUES(
      2595,
      "Magadan",
      71
);

INSERT INTO city
VALUES(
      2596,
      "Menkere",
      71
);

INSERT INTO city
VALUES(
      2597,
      "Strelka",
      71
);

INSERT INTO city
VALUES(
      2598,
      "Tunguskhaya",
      71
);

INSERT INTO city
VALUES(
      2599,
      "Sangar",
      71
);

INSERT INTO city
VALUES(
      2600,
      "Terbyas",
      71
);

INSERT INTO city
VALUES(
      2601,
      "Zhigansk",
      71
);

INSERT INTO city
VALUES(
      2602,
      "Vilyuysk",
      71
);

INSERT INTO city
VALUES(
      2603,
      "Verkhnevilyuysk",
      71
);

INSERT INTO city
VALUES(
      2604,
      "Klyuchi",
      71
);

INSERT INTO city
VALUES(
      2605,
      "Palatka",
      71
);

INSERT INTO city
VALUES(
      2606,
      "Krasnoyarsk",
      71
);

INSERT INTO city
VALUES(
      2607,
      "Mukhomornoye",
      71
);

INSERT INTO city
VALUES(
      2608,
      "Anadyr",
      71
);

INSERT INTO city
VALUES(
      2609,
      "Logashkino",
      71
);

INSERT INTO city
VALUES(
      2610,
      "Srednekolymsk",
      71
);

INSERT INTO city
VALUES(
      2611,
      "Zyryanka",
      71
);

INSERT INTO city
VALUES(
      2612,
      "Ayan",
      71
);

INSERT INTO city
VALUES(
      2613,
      "Vyazemskiy",
      71
);

INSERT INTO city
VALUES(
      2614,
      "Chumikan",
      71
);

INSERT INTO city
VALUES(
      2615,
      "Ugolnye Kopi",
      71
);

INSERT INTO city
VALUES(
      2616,
      "Ulkan",
      71
);

INSERT INTO city
VALUES(
      2617,
      "Zhilinda",
      71
);

INSERT INTO city
VALUES(
      2618,
      "Yeniseysk",
      71
);

INSERT INTO city
VALUES(
      2619,
      "Ust Olensk",
      71
);

INSERT INTO city
VALUES(
      2620,
      "Udachnyy",
      71
);

INSERT INTO city
VALUES(
      2621,
      "Chernyshevskiy",
      71
);

INSERT INTO city
VALUES(
      2622,
      "Okhotsk",
      71
);

INSERT INTO city
VALUES(
      2623,
      "Makarov",
      71
);

INSERT INTO city
VALUES(
      2624,
      "Dolinsk",
      71
);

INSERT INTO city
VALUES(
      2625,
      "Lavrentiya",
      71
);

INSERT INTO city
VALUES(
      2626,
      "Korsakov",
      71
);

INSERT INTO city
VALUES(
      2627,
      "Yuzhno Sakhalinsk",
      71
);

INSERT INTO city
VALUES(
      2628,
      "Khilok",
      71
);

INSERT INTO city
VALUES(
      2629,
      "Khandyga",
      71
);

INSERT INTO city
VALUES(
      2630,
      "Nikolayevsk na Amure",
      71
);

INSERT INTO city
VALUES(
      2631,
      "Ust Maya",
      71
);

INSERT INTO city
VALUES(
      2632,
      "Chagda",
      71
);

INSERT INTO city
VALUES(
      2633,
      "Eldikan",
      71
);

INSERT INTO city
VALUES(
      2634,
      "Verkhoyansk",
      71
);

INSERT INTO city
VALUES(
      2635,
      "Ust Kuyga",
      71
);

INSERT INTO city
VALUES(
      2636,
      "Poronaysk",
      71
);

INSERT INTO city
VALUES(
      2637,
      "Aldan",
      71
);

INSERT INTO city
VALUES(
      2638,
      "Uglegorsk",
      71
);

INSERT INTO city
VALUES(
      2639,
      "Nizhneyansk",
      71
);

INSERT INTO city
VALUES(
      2640,
      "Neryungri",
      71
);

INSERT INTO city
VALUES(
      2641,
      "Taksimo",
      71
);

INSERT INTO city
VALUES(
      2642,
      "Vanino",
      71
);

INSERT INTO city
VALUES(
      2643,
      "De Kastri",
      71
);

INSERT INTO city
VALUES(
      2644,
      "Provideniya",
      71
);

INSERT INTO city
VALUES(
      2645,
      "Tukchi",
      71
);

INSERT INTO city
VALUES(
      2646,
      "Nyukzha",
      71
);

INSERT INTO city
VALUES(
      2647,
      "Severo Kurilsk",
      71
);

INSERT INTO city
VALUES(
      2648,
      "Egvekinot",
      71
);

INSERT INTO city
VALUES(
      2649,
      "Khakhar",
      71
);

INSERT INTO city
VALUES(
      2650,
      "Batagay",
      71
);

INSERT INTO city
VALUES(
      2651,
      "Ilapyrskiy",
      71
);

INSERT INTO city
VALUES(
      2652,
      "Enurmino",
      71
);

INSERT INTO city
VALUES(
      2653,
      "Korf",
      71
);

INSERT INTO city
VALUES(
      2654,
      "Vitim",
      71
);

INSERT INTO city
VALUES(
      2655,
      "Timashevsk",
      71
);

INSERT INTO city
VALUES(
      2656,
      "Tikhoretsk",
      71
);

INSERT INTO city
VALUES(
      2657,
      "Tuapse",
      71
);

INSERT INTO city
VALUES(
      2658,
      "Apsheronsk",
      71
);

INSERT INTO city
VALUES(
      2659,
      "Yeysk",
      71
);

INSERT INTO city
VALUES(
      2660,
      "Labinsk",
      71
);

INSERT INTO city
VALUES(
      2661,
      "Yerema",
      71
);

INSERT INTO city
VALUES(
      2662,
      "Tomsk",
      71
);

INSERT INTO city
VALUES(
      2663,
      "Krasnogorsk",
      71
);

INSERT INTO city
VALUES(
      2664,
      "Kholmsk",
      71
);

INSERT INTO city
VALUES(
      2665,
      "Aleksandrovsk Sakhalinskiy",
      71
);

INSERT INTO city
VALUES(
      2666,
      "Nevelsk",
      71
);

INSERT INTO city
VALUES(
      2667,
      "Zemlya Bunge",
      71
);

INSERT INTO city
VALUES(
      2668,
      "Chokurdakh",
      71
);

INSERT INTO city
VALUES(
      2669,
      "Tulun",
      71
);

INSERT INTO city
VALUES(
      2670,
      "Chelyabinsk",
      71
);

INSERT INTO city
VALUES(
      2671,
      "Shalaurova",
      71
);

INSERT INTO city
VALUES(
      2672,
      "Mogocha",
      71
);

INSERT INTO city
VALUES(
      2673,
      "Petrovsk Zabaykalskiy",
      71
);

INSERT INTO city
VALUES(
      2674,
      "Blagoveshchensk",
      71
);

INSERT INTO city
VALUES(
      2675,
      "Usolye Sibirskoye",
      71
);

INSERT INTO city
VALUES(
      2676,
      "Gorod Maykop",
      71
);

INSERT INTO city
VALUES(
      2677,
      "Krasnodar",
      71
);

INSERT INTO city
VALUES(
      2678,
      "Petropavlovsk Kamchatskiy",
      71
);

INSERT INTO city
VALUES(
      2679,
      "Millerovo",
      71
);

INSERT INTO city
VALUES(
      2680,
      "Salsk",
      71
);

INSERT INTO city
VALUES(
      2681,
      "Belaya Kalitva",
      71
);

INSERT INTO city
VALUES(
      2682,
      "Kamensk Shakhtinskiy",
      71
);

INSERT INTO city
VALUES(
      2683,
      "Chernyakhovsk",
      71
);

INSERT INTO city
VALUES(
      2684,
      "Sovetsk",
      71
);

INSERT INTO city
VALUES(
      2685,
      "Aginskoye",
      71
);

INSERT INTO city
VALUES(
      2686,
      "Tura",
      71
);

INSERT INTO city
VALUES(
      2687,
      "Palana",
      71
);

INSERT INTO city
VALUES(
      2688,
      "Dudinka",
      71
);

INSERT INTO city
VALUES(
      2689,
      "Novocherkassk",
      71
);

INSERT INTO city
VALUES(
      2690,
      "Kaspiysk",
      71
);

INSERT INTO country
VALUES(
      72,
      "Rwanda"
);

INSERT INTO city
VALUES(
      2691,
      "Cyangugu",
      72
);

INSERT INTO city
VALUES(
      2692,
      "Kigali",
      72
);

INSERT INTO city
VALUES(
      2693,
      "Ruhengeri",
      72
);

INSERT INTO city
VALUES(
      2694,
      "Nyanza",
      72
);

INSERT INTO city
VALUES(
      2695,
      "Rwamagana",
      72
);

INSERT INTO city
VALUES(
      2696,
      "Butare",
      72
);

INSERT INTO city
VALUES(
      2697,
      "Kibungo",
      72
);

INSERT INTO city
VALUES(
      2698,
      "Byumba",
      72
);

INSERT INTO city
VALUES(
      2699,
      "Gikongoro",
      72
);

INSERT INTO city
VALUES(
      2700,
      "Kibuye",
      72
);

INSERT INTO city
VALUES(
      2701,
      "Gisenyi",
      72
);

INSERT INTO city
VALUES(
      2702,
      "Gitarama",
      72
);

INSERT INTO country
VALUES(
      73,
      "Saudi Arabia"
);

INSERT INTO city
VALUES(
      2703,
      "Al Qunfudhah",
      73
);

INSERT INTO city
VALUES(
      2704,
      "At Taif",
      73
);

INSERT INTO city
VALUES(
      2705,
      "Qal at Bishah",
      73
);

INSERT INTO city
VALUES(
      2706,
      "Al Hillah",
      73
);

INSERT INTO city
VALUES(
      2707,
      "As Sulayyil",
      73
);

INSERT INTO city
VALUES(
      2708,
      "Al Wajh",
      73
);

INSERT INTO city
VALUES(
      2709,
      "An Nabk",
      73
);

INSERT INTO city
VALUES(
      2710,
      "Al Kharj",
      73
);

INSERT INTO city
VALUES(
      2711,
      "Najran",
      73
);

INSERT INTO city
VALUES(
      2712,
      "Al Bahah",
      73
);

INSERT INTO city
VALUES(
      2713,
      "Medina",
      73
);

INSERT INTO city
VALUES(
      2714,
      "Hail",
      73
);

INSERT INTO city
VALUES(
      2715,
      "Jizan",
      73
);

INSERT INTO city
VALUES(
      2716,
      "Makkah",
      73
);

INSERT INTO city
VALUES(
      2717,
      "Tabuk",
      73
);

INSERT INTO city
VALUES(
      2718,
      "Arar",
      73
);

INSERT INTO city
VALUES(
      2719,
      "Abha",
      73
);

INSERT INTO city
VALUES(
      2720,
      "Ad Damman",
      73
);

INSERT INTO city
VALUES(
      2721,
      "Buraydah",
      73
);

INSERT INTO city
VALUES(
      2722,
      "Sakakah",
      73
);

INSERT INTO city
VALUES(
      2723,
      "Riyadh",
      73
);

INSERT INTO city
VALUES(
      2724,
      "Jeddah",
      73
);

INSERT INTO city
VALUES(
      2725,
      "Hafar al Batin",
      73
);

INSERT INTO city
VALUES(
      2726,
      "Az Zahran",
      73
);

INSERT INTO city
VALUES(
      2727,
      "Al Jubayl",
      73
);

INSERT INTO city
VALUES(
      2728,
      "Al-Qatif",
      73
);

INSERT INTO city
VALUES(
      2729,
      "Yanbu al Bahr",
      73
);

INSERT INTO city
VALUES(
      2730,
      "Al Mubarraz",
      73
);

INSERT INTO city
VALUES(
      2731,
      "Al Hufuf",
      73
);

INSERT INTO city
VALUES(
      2732,
      "Al Quwayiyah",
      73
);

INSERT INTO city
VALUES(
      2733,
      "Rafha",
      73
);

INSERT INTO city
VALUES(
      2734,
      "Dawmat al Jandal",
      73
);

INSERT INTO country
VALUES(
      74,
      "Solomon Islands"
);

INSERT INTO city
VALUES(
      2735,
      "Honiara",
      74
);

INSERT INTO city
VALUES(
      2736,
      "Auki",
      74
);

INSERT INTO city
VALUES(
      2737,
      "Buala",
      74
);

INSERT INTO city
VALUES(
      2738,
      "Gizo",
      74
);

INSERT INTO city
VALUES(
      2739,
      "Kirakira",
      74
);

INSERT INTO city
VALUES(
      2740,
      "Tulagi",
      74
);

INSERT INTO city
VALUES(
      2741,
      "Taro",
      74
);

INSERT INTO city
VALUES(
      2742,
      "Tigoa",
      74
);

INSERT INTO city
VALUES(
      2743,
      "Lata",
      74
);

INSERT INTO country
VALUES(
      75,
      "Seychelles"
);

INSERT INTO city
VALUES(
      2744,
      "Victoria",
      75
);

INSERT INTO country
VALUES(
      76,
      "Sudan"
);

INSERT INTO city
VALUES(
      2745,
      "Omdurman",
      76
);

INSERT INTO city
VALUES(
      2746,
      "Shendi",
      76
);

INSERT INTO city
VALUES(
      2747,
      "El Manaqil",
      76
);

INSERT INTO city
VALUES(
      2748,
      "Khartoum",
      76
);

INSERT INTO city
VALUES(
      2749,
      "Atbara",
      76
);

INSERT INTO city
VALUES(
      2750,
      "Ed Dueim",
      76
);

INSERT INTO city
VALUES(
      2751,
      "Haiya",
      76
);

INSERT INTO city
VALUES(
      2752,
      "Tokar",
      76
);

INSERT INTO city
VALUES(
      2753,
      "Merowe",
      76
);

INSERT INTO city
VALUES(
      2754,
      "Kosti",
      76
);

INSERT INTO city
VALUES(
      2755,
      "Wadi Halfa",
      76
);

INSERT INTO city
VALUES(
      2756,
      "Sennar",
      76
);

INSERT INTO city
VALUES(
      2757,
      "Kerma",
      76
);

INSERT INTO city
VALUES(
      2758,
      "Berber",
      76
);

INSERT INTO city
VALUES(
      2759,
      "Umm Ruwaba",
      76
);

INSERT INTO city
VALUES(
      2760,
      "Muglad",
      76
);

INSERT INTO city
VALUES(
      2761,
      "Babanusa",
      76
);

INSERT INTO city
VALUES(
      2762,
      "En Nuhud",
      76
);

INSERT INTO city
VALUES(
      2763,
      "Geneina",
      76
);

INSERT INTO city
VALUES(
      2764,
      "Gedaref",
      76
);

INSERT INTO city
VALUES(
      2765,
      "Ed Daein",
      76
);

INSERT INTO city
VALUES(
      2766,
      "EdDamer",
      76
);

INSERT INTO city
VALUES(
      2767,
      "Ad Damazin",
      76
);

INSERT INTO city
VALUES(
      2768,
      "El Fasher",
      76
);

INSERT INTO city
VALUES(
      2769,
      "Port Sudan",
      76
);

INSERT INTO city
VALUES(
      2770,
      "El Obeid",
      76
);

INSERT INTO city
VALUES(
      2771,
      "Kadugli",
      76
);

INSERT INTO city
VALUES(
      2772,
      "Niyala",
      76
);

INSERT INTO city
VALUES(
      2773,
      "Dongola",
      76
);

INSERT INTO city
VALUES(
      2774,
      "Rabak",
      76
);

INSERT INTO city
VALUES(
      2775,
      "Zalingei",
      76
);

INSERT INTO city
VALUES(
      2776,
      "El Fula",
      76
);

INSERT INTO city
VALUES(
      2777,
      "Singa",
      76
);

INSERT INTO city
VALUES(
      2778,
      "Kassala",
      76
);

INSERT INTO city
VALUES(
      2779,
      "Medani",
      76
);

INSERT INTO country
VALUES(
      77,
      "Sweden"
);

INSERT INTO city
VALUES(
      2780,
      "Vasteraas",
      77
);

INSERT INTO city
VALUES(
      2781,
      "Uppsala",
      77
);

INSERT INTO city
VALUES(
      2782,
      "Orebro",
      77
);

INSERT INTO city
VALUES(
      2783,
      "Ostersund",
      77
);

INSERT INTO city
VALUES(
      2784,
      "Karlstad",
      77
);

INSERT INTO city
VALUES(
      2785,
      "Nykoping",
      77
);

INSERT INTO city
VALUES(
      2786,
      "Goteborg",
      77
);

INSERT INTO city
VALUES(
      2787,
      "Halmstad",
      77
);

INSERT INTO city
VALUES(
      2788,
      "Linkoping",
      77
);

INSERT INTO city
VALUES(
      2789,
      "Jonkoping",
      77
);

INSERT INTO city
VALUES(
      2790,
      "Kalmar",
      77
);

INSERT INTO city
VALUES(
      2791,
      "Gavle",
      77
);

INSERT INTO city
VALUES(
      2792,
      "Malmo",
      77
);

INSERT INTO city
VALUES(
      2793,
      "Vaxjo",
      77
);

INSERT INTO city
VALUES(
      2794,
      "Lulea",
      77
);

INSERT INTO city
VALUES(
      2795,
      "Stockholm",
      77
);

INSERT INTO city
VALUES(
      2796,
      "Karlskrona",
      77
);

INSERT INTO city
VALUES(
      2797,
      "Falun",
      77
);

INSERT INTO city
VALUES(
      2798,
      "Harnosand",
      77
);

INSERT INTO city
VALUES(
      2799,
      "Uppsala",
      77
);

INSERT INTO city
VALUES(
      2800,
      "Umea",
      77
);

INSERT INTO city
VALUES(
      2801,
      "Kiruna",
      77
);

INSERT INTO city
VALUES(
      2802,
      "Helsingborg",
      77
);

INSERT INTO city
VALUES(
      2803,
      "Skelleftea",
      77
);

INSERT INTO city
VALUES(
      2804,
      "Bollnas",
      77
);

INSERT INTO city
VALUES(
      2805,
      "Trollhattan",
      77
);

INSERT INTO city
VALUES(
      2806,
      "Ornskoldsvik",
      77
);

INSERT INTO city
VALUES(
      2807,
      "Sundsvall",
      77
);

INSERT INTO city
VALUES(
      2808,
      "Norrkoping",
      77
);

INSERT INTO city
VALUES(
      2809,
      "Vannersborg",
      77
);

INSERT INTO city
VALUES(
      2810,
      "Boras",
      77
);

INSERT INTO city
VALUES(
      2811,
      "Kristianstad",
      77
);

INSERT INTO city
VALUES(
      2812,
      "Borlange",
      77
);

INSERT INTO city
VALUES(
      2813,
      "Mariestad",
      77
);

INSERT INTO city
VALUES(
      2814,
      "Visby",
      77
);

INSERT INTO country
VALUES(
      78,
      "Singapore"
);

INSERT INTO city
VALUES(
      2815,
      "Singapore",
      78
);

INSERT INTO country
VALUES(
      79,
      "Saint Helen"
);

INSERT INTO city
VALUES(
      2816,
      "Edinburgh of the Seven Seas",
      79
);

INSERT INTO city
VALUES(
      2817,
      "Georgetown",
      79
);

INSERT INTO city
VALUES(
      2818,
      "Jamestown",
      79
);

INSERT INTO country
VALUES(
      80,
      "Slovenia"
);

INSERT INTO city
VALUES(
      2819,
      "Ljubljana",
      80
);

INSERT INTO city
VALUES(
      2820,
      "Recica ob Savinji",
      80
);

INSERT INTO city
VALUES(
      2821,
      "Selnica ob Dravi",
      80
);

INSERT INTO city
VALUES(
      2822,
      "Semic",
      80
);

INSERT INTO city
VALUES(
      2823,
      "Salovci",
      80
);

INSERT INTO city
VALUES(
      2824,
      "Ribnica na Pohorju",
      80
);

INSERT INTO city
VALUES(
      2825,
      "Ribnica",
      80
);

INSERT INTO city
VALUES(
      2826,
      "Rogaska Slatina",
      80
);

INSERT INTO city
VALUES(
      2827,
      "Rogasovci",
      80
);

INSERT INTO city
VALUES(
      2828,
      "Rogatec",
      80
);

INSERT INTO city
VALUES(
      2829,
      "Ruse",
      80
);

INSERT INTO city
VALUES(
      2830,
      "Volcja Draga",
      80
);

INSERT INTO city
VALUES(
      2831,
      "Miklavz na Dravskem Polju",
      80
);

INSERT INTO city
VALUES(
      2832,
      "Miren",
      80
);

INSERT INTO city
VALUES(
      2833,
      "Poljcane",
      80
);

INSERT INTO city
VALUES(
      2834,
      "Prevalje",
      80
);

INSERT INTO city
VALUES(
      2835,
      "Race",
      80
);

INSERT INTO city
VALUES(
      2836,
      "Podlehnik",
      80
);

INSERT INTO city
VALUES(
      2837,
      "Prebold",
      80
);

INSERT INTO city
VALUES(
      2838,
      "Ptuj",
      80
);

INSERT INTO city
VALUES(
      2839,
      "Puconci",
      80
);

INSERT INTO city
VALUES(
      2840,
      "Postojna",
      80
);

INSERT INTO city
VALUES(
      2841,
      "Pivka",
      80
);

INSERT INTO city
VALUES(
      2842,
      "Radece",
      80
);

INSERT INTO city
VALUES(
      2843,
      "Polzela",
      80
);

INSERT INTO city
VALUES(
      2844,
      "Preddvor",
      80
);

INSERT INTO city
VALUES(
      2845,
      "Podvelka",
      80
);

INSERT INTO city
VALUES(
      2846,
      "Podcetrtek",
      80
);

INSERT INTO city
VALUES(
      2847,
      "Ajdovscina",
      80
);

INSERT INTO city
VALUES(
      2848,
      "Bled",
      80
);

INSERT INTO city
VALUES(
      2849,
      "Bistrica ob Sotli",
      80
);

INSERT INTO city
VALUES(
      2850,
      "Benedikt v Slovenskih Goricah",
      80
);

INSERT INTO city
VALUES(
      2851,
      "Beltinci",
      80
);

INSERT INTO city
VALUES(
      2852,
      "Gornji Petrovci",
      80
);

INSERT INTO city
VALUES(
      2853,
      "Grad",
      80
);

INSERT INTO city
VALUES(
      2854,
      "Grosuplje",
      80
);

INSERT INTO city
VALUES(
      2855,
      "Nova Vas",
      80
);

INSERT INTO city
VALUES(
      2856,
      "Spodnja Hajdina",
      80
);

INSERT INTO city
VALUES(
      2857,
      "Bohinjska Bistrica",
      80
);

INSERT INTO city
VALUES(
      2858,
      "Borovnica",
      80
);

INSERT INTO city
VALUES(
      2859,
      "Bovec",
      80
);

INSERT INTO city
VALUES(
      2860,
      "Braslovce",
      80
);

INSERT INTO city
VALUES(
      2861,
      "Brezice",
      80
);

INSERT INTO city
VALUES(
      2862,
      "Brezovica",
      80
);

INSERT INTO city
VALUES(
      2863,
      "Dobrovo",
      80
);

INSERT INTO city
VALUES(
      2864,
      "Cankova",
      80
);

INSERT INTO city
VALUES(
      2865,
      "Celje",
      80
);

INSERT INTO city
VALUES(
      2866,
      "Cerklje na Gorenjskem",
      80
);

INSERT INTO city
VALUES(
      2867,
      "Cerknica",
      80
);

INSERT INTO city
VALUES(
      2868,
      "Cerkno",
      80
);

INSERT INTO city
VALUES(
      2869,
      "Cerkvenjak",
      80
);

INSERT INTO city
VALUES(
      2870,
      "Crensovci",
      80
);

INSERT INTO city
VALUES(
      2871,
      "Crna na Koroskem",
      80
);

INSERT INTO city
VALUES(
      2872,
      "Crnomelj",
      80
);

INSERT INTO city
VALUES(
      2873,
      "Destrnik",
      80
);

INSERT INTO city
VALUES(
      2874,
      "Horjul",
      80
);

INSERT INTO city
VALUES(
      2875,
      "Kranjska Gora",
      80
);

INSERT INTO city
VALUES(
      2876,
      "Krizevci pri Ljutomeru",
      80
);

INSERT INTO city
VALUES(
      2877,
      "Krsko",
      80
);

INSERT INTO city
VALUES(
      2878,
      "Ilirska Bistrica",
      80
);

INSERT INTO city
VALUES(
      2879,
      "Ivancna Gorica",
      80
);

INSERT INTO city
VALUES(
      2880,
      "Izola",
      80
);

INSERT INTO city
VALUES(
      2881,
      "Jesenice",
      80
);

INSERT INTO city
VALUES(
      2882,
      "Koper",
      80
);

INSERT INTO city
VALUES(
      2883,
      "Kostanjevica na Krki",
      80
);

INSERT INTO city
VALUES(
      2884,
      "Kozje",
      80
);

INSERT INTO city
VALUES(
      2885,
      "Kranj",
      80
);

INSERT INTO city
VALUES(
      2886,
      "Lendava",
      80
);

INSERT INTO city
VALUES(
      2887,
      "Litija",
      80
);

INSERT INTO city
VALUES(
      2888,
      "Ljubno",
      80
);

INSERT INTO city
VALUES(
      2889,
      "Ljutomer",
      80
);

INSERT INTO city
VALUES(
      2890,
      "Spodnje Hoce",
      80
);

INSERT INTO city
VALUES(
      2891,
      "Hodos",
      80
);

INSERT INTO city
VALUES(
      2892,
      "Hrastnik",
      80
);

INSERT INTO city
VALUES(
      2893,
      "Kozina",
      80
);

INSERT INTO city
VALUES(
      2894,
      "Idrija",
      80
);

INSERT INTO city
VALUES(
      2895,
      "Ig",
      80
);

INSERT INTO city
VALUES(
      2896,
      "Zgornja Kungota",
      80
);

INSERT INTO city
VALUES(
      2897,
      "Kuzma",
      80
);

INSERT INTO city
VALUES(
      2898,
      "Lasko",
      80
);

INSERT INTO city
VALUES(
      2899,
      "Lenart v Slovenskih Goricah",
      80
);

INSERT INTO city
VALUES(
      2900,
      "Logatec",
      80
);

INSERT INTO city
VALUES(
      2901,
      "Log pri Brezovici",
      80
);

INSERT INTO city
VALUES(
      2902,
      "Stari Trg pri Lozu",
      80
);

INSERT INTO city
VALUES(
      2903,
      "Hrib-Loski Potok",
      80
);

INSERT INTO city
VALUES(
      2904,
      "Zgornje Jezersko",
      80
);

INSERT INTO city
VALUES(
      2905,
      "Jursinci",
      80
);

INSERT INTO city
VALUES(
      2906,
      "Kamnik",
      80
);

INSERT INTO city
VALUES(
      2907,
      "Kanal",
      80
);

INSERT INTO city
VALUES(
      2908,
      "Kidricevo",
      80
);

INSERT INTO city
VALUES(
      2909,
      "Kobarid",
      80
);

INSERT INTO city
VALUES(
      2910,
      "Kobilje",
      80
);

INSERT INTO city
VALUES(
      2911,
      "Kocevje",
      80
);

INSERT INTO city
VALUES(
      2912,
      "Komen",
      80
);

INSERT INTO city
VALUES(
      2913,
      "Sveta Trojica v Slovenskih Goricah",
      80
);

INSERT INTO city
VALUES(
      2914,
      "Pesnica pri Mariboru",
      80
);

INSERT INTO city
VALUES(
      2915,
      "Piran",
      80
);

INSERT INTO city
VALUES(
      2916,
      "Murska Sobota",
      80
);

INSERT INTO city
VALUES(
      2917,
      "Muta",
      80
);

INSERT INTO city
VALUES(
      2918,
      "Moravce",
      80
);

INSERT INTO city
VALUES(
      2919,
      "Novo Mesto",
      80
);

INSERT INTO city
VALUES(
      2920,
      "Odranci",
      80
);

INSERT INTO city
VALUES(
      2921,
      "Oplotnica",
      80
);

INSERT INTO city
VALUES(
      2922,
      "Ormoz",
      80
);

INSERT INTO city
VALUES(
      2923,
      "Moravske-Toplice",
      80
);

INSERT INTO city
VALUES(
      2924,
      "Mozirje",
      80
);

INSERT INTO city
VALUES(
      2925,
      "Mirna",
      80
);

INSERT INTO city
VALUES(
      2926,
      "Mirna Pec",
      80
);

INSERT INTO city
VALUES(
      2927,
      "Mislinja",
      80
);

INSERT INTO city
VALUES(
      2928,
      "Mokronog",
      80
);

INSERT INTO city
VALUES(
      2929,
      "Naklo",
      80
);

INSERT INTO city
VALUES(
      2930,
      "Nova Gorica",
      80
);

INSERT INTO city
VALUES(
      2931,
      "Dol pri Ljubljani",
      80
);

INSERT INTO city
VALUES(
      2932,
      "Dolenjske Toplice",
      80
);

INSERT INTO city
VALUES(
      2933,
      "Domzale",
      80
);

INSERT INTO city
VALUES(
      2934,
      "Dornava",
      80
);

INSERT INTO city
VALUES(
      2935,
      "Dravograd",
      80
);

INSERT INTO city
VALUES(
      2936,
      "Spodnji Duplek",
      80
);

INSERT INTO city
VALUES(
      2937,
      "Gorenja Vas",
      80
);

INSERT INTO city
VALUES(
      2938,
      "Gorisnica",
      80
);

INSERT INTO city
VALUES(
      2939,
      "Gornja Radgona",
      80
);

INSERT INTO city
VALUES(
      2940,
      "Gornji Grad",
      80
);

INSERT INTO city
VALUES(
      2941,
      "Zgornje Gorje",
      80
);

INSERT INTO city
VALUES(
      2942,
      "Divaca",
      80
);

INSERT INTO city
VALUES(
      2943,
      "Dobje pri Planini",
      80
);

INSERT INTO city
VALUES(
      2944,
      "Videm",
      80
);

INSERT INTO city
VALUES(
      2945,
      "Dobrna",
      80
);

INSERT INTO city
VALUES(
      2946,
      "Dobrova",
      80
);

INSERT INTO city
VALUES(
      2947,
      "Dobrovnik",
      80
);

INSERT INTO city
VALUES(
      2948,
      "Radenci",
      80
);

INSERT INTO city
VALUES(
      2949,
      "Radlje ob Dravi",
      80
);

INSERT INTO city
VALUES(
      2950,
      "Radovljica",
      80
);

INSERT INTO city
VALUES(
      2951,
      "Ravne na Koroskem",
      80
);

INSERT INTO city
VALUES(
      2952,
      "Sentjur",
      80
);

INSERT INTO city
VALUES(
      2953,
      "Sentrupert",
      80
);

INSERT INTO city
VALUES(
      2954,
      "Sevnica",
      80
);

INSERT INTO city
VALUES(
      2955,
      "Vitomarci",
      80
);

INSERT INTO city
VALUES(
      2956,
      "Straza",
      80
);

INSERT INTO city
VALUES(
      2957,
      "Sveta Ana v Slovenskih Goricah",
      80
);

INSERT INTO city
VALUES(
      2958,
      "Jurovski Dol",
      80
);

INSERT INTO city
VALUES(
      2959,
      "Sostanj",
      80
);

INSERT INTO city
VALUES(
      2960,
      "Sredisce ob Dravi",
      80
);

INSERT INTO city
VALUES(
      2961,
      "Starse",
      80
);

INSERT INTO city
VALUES(
      2962,
      "Store",
      80
);

INSERT INTO city
VALUES(
      2963,
      "Sveti Jurij ob Scavnici",
      80
);

INSERT INTO city
VALUES(
      2964,
      "Smartno ob Paki",
      80
);

INSERT INTO city
VALUES(
      2965,
      "Smartno pri Litiji",
      80
);

INSERT INTO city
VALUES(
      2966,
      "Sodrazica",
      80
);

INSERT INTO city
VALUES(
      2967,
      "Solcava",
      80
);

INSERT INTO city
VALUES(
      2968,
      "Slovenj Gradec",
      80
);

INSERT INTO city
VALUES(
      2969,
      "Slovenska Bistrica",
      80
);

INSERT INTO city
VALUES(
      2970,
      "Slovenske Konjice",
      80
);

INSERT INTO city
VALUES(
      2971,
      "Smarje pri Jelsah",
      80
);

INSERT INTO city
VALUES(
      2972,
      "Sencur",
      80
);

INSERT INTO city
VALUES(
      2973,
      "Sempeter pri Gorici",
      80
);

INSERT INTO city
VALUES(
      2974,
      "Sentilj",
      80
);

INSERT INTO city
VALUES(
      2975,
      "Sentjernej",
      80
);

INSERT INTO city
VALUES(
      2976,
      "Sezana",
      80
);

INSERT INTO city
VALUES(
      2977,
      "Skocjan",
      80
);

INSERT INTO city
VALUES(
      2978,
      "Skofja Loka",
      80
);

INSERT INTO city
VALUES(
      2979,
      "Skofljica",
      80
);

INSERT INTO city
VALUES(
      2980,
      "Razkrizje",
      80
);

INSERT INTO city
VALUES(
      2981,
      "Markovci",
      80
);

INSERT INTO city
VALUES(
      2982,
      "Medvode",
      80
);

INSERT INTO city
VALUES(
      2983,
      "Menges",
      80
);

INSERT INTO city
VALUES(
      2984,
      "Metlika",
      80
);

INSERT INTO city
VALUES(
      2985,
      "Mezica",
      80
);

INSERT INTO city
VALUES(
      2986,
      "Lovrenc na Pohorju",
      80
);

INSERT INTO city
VALUES(
      2987,
      "Luce",
      80
);

INSERT INTO city
VALUES(
      2988,
      "Lukovica pri Domzalah",
      80
);

INSERT INTO city
VALUES(
      2989,
      "Majsperk",
      80
);

INSERT INTO city
VALUES(
      2990,
      "Makole",
      80
);

INSERT INTO city
VALUES(
      2991,
      "Maribor",
      80
);

INSERT INTO city
VALUES(
      2992,
      "Tomaz pri Ormozu",
      80
);

INSERT INTO city
VALUES(
      2993,
      "Videm pri Ptuju",
      80
);

INSERT INTO city
VALUES(
      2994,
      "Tolmin",
      80
);

INSERT INTO city
VALUES(
      2995,
      "Trbovlje",
      80
);

INSERT INTO city
VALUES(
      2996,
      "Trebnje",
      80
);

INSERT INTO city
VALUES(
      2997,
      "Trzic",
      80
);

INSERT INTO city
VALUES(
      2998,
      "Turnisce",
      80
);

INSERT INTO city
VALUES(
      2999,
      "Velenje",
      80
);

INSERT INTO city
VALUES(
      3000,
      "Velike Lasce",
      80
);

INSERT INTO city
VALUES(
      3001,
      "Vipava",
      80
);

INSERT INTO city
VALUES(
      3002,
      "Vitanje",
      80
);

INSERT INTO city
VALUES(
      3003,
      "Vodice",
      80
);

INSERT INTO city
VALUES(
      3004,
      "Vrhnika",
      80
);

INSERT INTO city
VALUES(
      3005,
      "Vuzenica",
      80
);

INSERT INTO city
VALUES(
      3006,
      "Zagorje ob Savi",
      80
);

INSERT INTO city
VALUES(
      3007,
      "Zavrc",
      80
);

INSERT INTO city
VALUES(
      3008,
      "Zelezniki",
      80
);

INSERT INTO city
VALUES(
      3009,
      "Vojnik",
      80
);

INSERT INTO city
VALUES(
      3010,
      "Vransko",
      80
);

INSERT INTO city
VALUES(
      3011,
      "Zalec",
      80
);

INSERT INTO city
VALUES(
      3012,
      "Zetale",
      80
);

INSERT INTO city
VALUES(
      3013,
      "Zirovnica",
      80
);

INSERT INTO city
VALUES(
      3014,
      "Zuzemberk",
      80
);

INSERT INTO city
VALUES(
      3015,
      "Trnovska Vas",
      80
);

INSERT INTO city
VALUES(
      3016,
      "Trzin",
      80
);

INSERT INTO city
VALUES(
      3017,
      "Velika Polana",
      80
);

INSERT INTO city
VALUES(
      3018,
      "Verzej",
      80
);

INSERT INTO city
VALUES(
      3019,
      "Ziri",
      80
);

INSERT INTO city
VALUES(
      3020,
      "Zrece",
      80
);

INSERT INTO city
VALUES(
      3021,
      "Tabor",
      80
);

INSERT INTO city
VALUES(
      3022,
      "Tisina",
      80
);

INSERT INTO city
VALUES(
      3023,
      "Osilnica",
      80
);

INSERT INTO city
VALUES(
      3024,
      "Kostel",
      80
);

INSERT INTO city
VALUES(
      3025,
      "Cirkulane",
      80
);

INSERT INTO city
VALUES(
      3026,
      "Apace",
      80
);

INSERT INTO city
VALUES(
      3027,
      "Komenda",
      80
);

INSERT INTO city
VALUES(
      3028,
      "Smarjeske Toplice",
      80
);

INSERT INTO city
VALUES(
      3029,
      "Nazarje",
      80
);

INSERT INTO city
VALUES(
      3030,
      "Ankaran",
      80
);

INSERT INTO country
VALUES(
      81,
      "Slovakia"
);

INSERT INTO city
VALUES(
      3031,
      "Zilina",
      81
);

INSERT INTO city
VALUES(
      3032,
      "Bratislava",
      81
);

INSERT INTO city
VALUES(
      3033,
      "Trnava",
      81
);

INSERT INTO city
VALUES(
      3034,
      "Presov",
      81
);

INSERT INTO city
VALUES(
      3035,
      "Kosice",
      81
);

INSERT INTO city
VALUES(
      3036,
      "Trencin",
      81
);

INSERT INTO city
VALUES(
      3037,
      "Nitra",
      81
);

INSERT INTO city
VALUES(
      3038,
      "Banska Bystrica",
      81
);

INSERT INTO city
VALUES(
      3039,
      "Zvolen",
      81
);

INSERT INTO country
VALUES(
      82,
      "Sierra Leone"
);

INSERT INTO city
VALUES(
      3040,
      "Bo",
      82
);

INSERT INTO city
VALUES(
      3041,
      "Makeni",
      82
);

INSERT INTO city
VALUES(
      3042,
      "Koidu",
      82
);

INSERT INTO city
VALUES(
      3043,
      "Freetown",
      82
);

INSERT INTO city
VALUES(
      3044,
      "Kenema",
      82
);

INSERT INTO city
VALUES(
      3045,
      "Port Loko",
      82
);

INSERT INTO country
VALUES(
      83,
      "San Marino"
);

INSERT INTO city
VALUES(
      3046,
      "Serravalle",
      83
);

INSERT INTO city
VALUES(
      3047,
      "Poggio di Chiesanuova",
      83
);

INSERT INTO city
VALUES(
      3048,
      "Acquaviva",
      83
);

INSERT INTO city
VALUES(
      3049,
      "San Marino",
      83
);

INSERT INTO country
VALUES(
      84,
      "Senegal"
);

INSERT INTO city
VALUES(
      3050,
      "Louga",
      84
);

INSERT INTO city
VALUES(
      3051,
      "Sedhiou",
      84
);

INSERT INTO city
VALUES(
      3052,
      "Matam",
      84
);

INSERT INTO city
VALUES(
      3053,
      "Dakar",
      84
);

INSERT INTO city
VALUES(
      3054,
      "Kaedi",
      84
);

INSERT INTO city
VALUES(
      3055,
      "Saint-Louis",
      84
);

INSERT INTO city
VALUES(
      3056,
      "Diourbel",
      84
);

INSERT INTO city
VALUES(
      3057,
      "Tambacounda",
      84
);

INSERT INTO city
VALUES(
      3058,
      "Thies",
      84
);

INSERT INTO city
VALUES(
      3059,
      "Fatick",
      84
);

INSERT INTO city
VALUES(
      3060,
      "Kaolack",
      84
);

INSERT INTO city
VALUES(
      3061,
      "Kolda",
      84
);

INSERT INTO city
VALUES(
      3062,
      "Ziguinchor",
      84
);

INSERT INTO city
VALUES(
      3063,
      "Kaffrine",
      84
);

INSERT INTO city
VALUES(
      3064,
      "Kedougou",
      84
);

INSERT INTO country
VALUES(
      85,
      "Somalia"
);

INSERT INTO city
VALUES(
      3065,
      "Hargeysa",
      85
);

INSERT INTO city
VALUES(
      3066,
      "Mereeg",
      85
);

INSERT INTO city
VALUES(
      3067,
      "Mogadishu",
      85
);

INSERT INTO city
VALUES(
      3068,
      "Qardho",
      85
);

INSERT INTO city
VALUES(
      3069,
      "Garoowe",
      85
);

INSERT INTO city
VALUES(
      3070,
      "Laascaanood",
      85
);

INSERT INTO city
VALUES(
      3071,
      "Luuq",
      85
);

INSERT INTO city
VALUES(
      3072,
      "Jamaame",
      85
);

INSERT INTO city
VALUES(
      3073,
      "Bandarbeyla",
      85
);

INSERT INTO city
VALUES(
      3074,
      "Buurhakaba",
      85
);

INSERT INTO city
VALUES(
      3075,
      "Baki",
      85
);

INSERT INTO city
VALUES(
      3076,
      "Burco",
      85
);

INSERT INTO city
VALUES(
      3077,
      "Dhuusa Mareeb",
      85
);

INSERT INTO city
VALUES(
      3078,
      "Gaalkacyo",
      85
);

INSERT INTO city
VALUES(
      3079,
      "Eyl",
      85
);

INSERT INTO city
VALUES(
      3080,
      "Hurdiyo",
      85
);

INSERT INTO city
VALUES(
      3081,
      "Ceerigaabo",
      85
);

INSERT INTO city
VALUES(
      3082,
      "Buaaale",
      85
);

INSERT INTO city
VALUES(
      3083,
      "Hudur",
      85
);

INSERT INTO city
VALUES(
      3084,
      "Marka",
      85
);

INSERT INTO city
VALUES(
      3085,
      "Jawhar",
      85
);

INSERT INTO city
VALUES(
      3086,
      "Beledweyne",
      85
);

INSERT INTO city
VALUES(
      3087,
      "Kismaayo",
      85
);

INSERT INTO city
VALUES(
      3088,
      "Garbahaarey",
      85
);

INSERT INTO city
VALUES(
      3089,
      "Boosaaso",
      85
);

INSERT INTO city
VALUES(
      3090,
      "Caluula",
      85
);

INSERT INTO city
VALUES(
      3091,
      "Baydhabo",
      85
);

INSERT INTO city
VALUES(
      3092,
      "Buur Gaabo",
      85
);

INSERT INTO country
VALUES(
      86,
      "Suriname"
);

INSERT INTO city
VALUES(
      3093,
      "Cottica",
      86
);

INSERT INTO city
VALUES(
      3094,
      "Paramaribo",
      86
);

INSERT INTO city
VALUES(
      3095,
      "Groningen",
      86
);

INSERT INTO city
VALUES(
      3096,
      "Lelydorp",
      86
);

INSERT INTO city
VALUES(
      3097,
      "Albina",
      86
);

INSERT INTO city
VALUES(
      3098,
      "Totness",
      86
);

INSERT INTO city
VALUES(
      3099,
      "Nieuw Nickerie",
      86
);

INSERT INTO city
VALUES(
      3100,
      "Nieuw Amsterdam",
      86
);

INSERT INTO city
VALUES(
      3101,
      "Onverwacht",
      86
);

INSERT INTO city
VALUES(
      3102,
      "Brownsweg",
      86
);

INSERT INTO city
VALUES(
      3103,
      "Brokopondo",
      86
);

INSERT INTO city
VALUES(
      3104,
      "Moengo",
      86
);

INSERT INTO country
VALUES(
      87,
      "South Sudan"
);

INSERT INTO city
VALUES(
      3105,
      "Juba",
      87
);

INSERT INTO city
VALUES(
      3106,
      "Melut",
      87
);

INSERT INTO city
VALUES(
      3107,
      "Gogrial",
      87
);

INSERT INTO city
VALUES(
      3108,
      "Malakal",
      87
);

INSERT INTO city
VALUES(
      3109,
      "Nimule",
      87
);

INSERT INTO city
VALUES(
      3110,
      "Torit",
      87
);

INSERT INTO city
VALUES(
      3111,
      "Maridi",
      87
);

INSERT INTO city
VALUES(
      3112,
      "Kapoeta",
      87
);

INSERT INTO city
VALUES(
      3113,
      "Nasir",
      87
);

INSERT INTO city
VALUES(
      3114,
      "Yei",
      87
);

INSERT INTO city
VALUES(
      3115,
      "Aweil",
      87
);

INSERT INTO city
VALUES(
      3116,
      "Rumbek",
      87
);

INSERT INTO city
VALUES(
      3117,
      "Yambio",
      87
);

INSERT INTO city
VALUES(
      3118,
      "Bor",
      87
);

INSERT INTO city
VALUES(
      3119,
      "Bentiu",
      87
);

INSERT INTO city
VALUES(
      3120,
      "Kuacjok",
      87
);

INSERT INTO city
VALUES(
      3121,
      "Wau",
      87
);

INSERT INTO country
VALUES(
      88,
      "Sao Tome And Principe"
);

INSERT INTO city
VALUES(
      3122,
      "Santo Antonio",
      88
);

INSERT INTO city
VALUES(
      3123,
      "Sao Tome",
      88
);

INSERT INTO city
VALUES(
      3124,
      "Guadalupe",
      88
);

INSERT INTO city
VALUES(
      3125,
      "Neves",
      88
);

INSERT INTO city
VALUES(
      3126,
      "Santana",
      88
);

INSERT INTO city
VALUES(
      3127,
      "Santo Antonio",
      88
);

INSERT INTO city
VALUES(
      3128,
      "Sao Joao dos Angolares",
      88
);

INSERT INTO city
VALUES(
      3129,
      "Trindade",
      88
);

INSERT INTO country
VALUES(
      89,
      "El Salvador"
);

INSERT INTO city
VALUES(
      3130,
      "San Salvador",
      89
);

INSERT INTO city
VALUES(
      3131,
      "San Miguel",
      89
);

INSERT INTO city
VALUES(
      3132,
      "Nueva San Salvador",
      89
);

INSERT INTO city
VALUES(
      3133,
      "Ahuachapan",
      89
);

INSERT INTO city
VALUES(
      3134,
      "Cojutepeque",
      89
);

INSERT INTO city
VALUES(
      3135,
      "Zacatecoluca",
      89
);

INSERT INTO city
VALUES(
      3136,
      "La Union",
      89
);

INSERT INTO city
VALUES(
      3137,
      "San Francisco Gotera",
      89
);

INSERT INTO city
VALUES(
      3138,
      "Sensuntepeque",
      89
);

INSERT INTO city
VALUES(
      3139,
      "Chalatenango",
      89
);

INSERT INTO city
VALUES(
      3140,
      "Santa Ana",
      89
);

INSERT INTO city
VALUES(
      3141,
      "San Vicente",
      89
);

INSERT INTO city
VALUES(
      3142,
      "Sonsonate",
      89
);

INSERT INTO city
VALUES(
      3143,
      "Usulutan",
      89
);

INSERT INTO country
VALUES(
      90,
      "Sint Maarten"
);

INSERT INTO city
VALUES(
      3144,
      "Philipsburg",
      90
);

INSERT INTO country
VALUES(
      91,
      "Syria"
);

INSERT INTO city
VALUES(
      3145,
      "Ar Raqqah",
      91
);

INSERT INTO city
VALUES(
      3146,
      "Tartus",
      91
);

INSERT INTO city
VALUES(
      3147,
      "Douma",
      91
);

INSERT INTO city
VALUES(
      3148,
      "As Suwayda",
      91
);

INSERT INTO city
VALUES(
      3149,
      "Al Hasakah",
      91
);

INSERT INTO city
VALUES(
      3150,
      "Daraa",
      91
);

INSERT INTO city
VALUES(
      3151,
      "Hamah",
      91
);

INSERT INTO city
VALUES(
      3152,
      "Idlib",
      91
);

INSERT INTO city
VALUES(
      3153,
      "Manbij",
      91
);

INSERT INTO city
VALUES(
      3154,
      "Izaz",
      91
);

INSERT INTO city
VALUES(
      3155,
      "Hims",
      91
);

INSERT INTO city
VALUES(
      3156,
      "Damascus",
      91
);

INSERT INTO city
VALUES(
      3157,
      "Al Ladhiqiyah",
      91
);

INSERT INTO city
VALUES(
      3158,
      "Al Qunaytirah",
      91
);

INSERT INTO city
VALUES(
      3159,
      "Madinat ath Thawrah",
      91
);

INSERT INTO city
VALUES(
      3160,
      "Al Qamishli",
      91
);

INSERT INTO city
VALUES(
      3161,
      "Dayr az Zawr",
      91
);

INSERT INTO city
VALUES(
      3162,
      "Tadmur",
      91
);

INSERT INTO city
VALUES(
      3163,
      "Abu Kamal",
      91
);

INSERT INTO city
VALUES(
      3164,
      "Aleppo",
      91
);

INSERT INTO city
VALUES(
      3165,
      "Ad Nabk",
      91
);

INSERT INTO country
VALUES(
      92,
      "Swaziland"
);

INSERT INTO city
VALUES(
      3166,
      "Mbabane",
      92
);

INSERT INTO city
VALUES(
      3167,
      "Lobamba",
      92
);

INSERT INTO city
VALUES(
      3168,
      "Golela",
      92
);

INSERT INTO city
VALUES(
      3169,
      "Hlatikulu",
      92
);

INSERT INTO city
VALUES(
      3170,
      "Nhlangano",
      92
);

INSERT INTO city
VALUES(
      3171,
      "Piggs Peak",
      92
);

INSERT INTO city
VALUES(
      3172,
      "Siteki",
      92
);

INSERT INTO city
VALUES(
      3173,
      "Manzini",
      92
);

INSERT INTO country
VALUES(
      93,
      "Turks And Caicos Islands"
);

INSERT INTO city
VALUES(
      3174,
      "Grand Turk",
      93
);

INSERT INTO country
VALUES(
      94,
      "Chad"
);

INSERT INTO city
VALUES(
      3175,
      "Doba",
      94
);

INSERT INTO city
VALUES(
      3176,
      "Massakory",
      94
);

INSERT INTO city
VALUES(
      3177,
      "Koumra",
      94
);

INSERT INTO city
VALUES(
      3178,
      "Pala",
      94
);

INSERT INTO city
VALUES(
      3179,
      "Moundou",
      94
);

INSERT INTO city
VALUES(
      3180,
      "Zouar",
      94
);

INSERT INTO city
VALUES(
      3181,
      "Ndjamena",
      94
);

INSERT INTO city
VALUES(
      3182,
      "Bongor",
      94
);

INSERT INTO city
VALUES(
      3183,
      "Oum Hadjer",
      94
);

INSERT INTO city
VALUES(
      3184,
      "Lai",
      94
);

INSERT INTO city
VALUES(
      3185,
      "Kelo",
      94
);

INSERT INTO city
VALUES(
      3186,
      "Ati",
      94
);

INSERT INTO city
VALUES(
      3187,
      "Am Timan",
      94
);

INSERT INTO city
VALUES(
      3188,
      "Pala",
      94
);

INSERT INTO city
VALUES(
      3189,
      "Massenya",
      94
);

INSERT INTO city
VALUES(
      3190,
      "Mongo",
      94
);

INSERT INTO city
VALUES(
      3191,
      "Mao",
      94
);

INSERT INTO city
VALUES(
      3192,
      "Fada",
      94
);

INSERT INTO city
VALUES(
      3193,
      "Bardai",
      94
);

INSERT INTO city
VALUES(
      3194,
      "Moussoro",
      94
);

INSERT INTO city
VALUES(
      3195,
      "Goz Beida",
      94
);

INSERT INTO city
VALUES(
      3196,
      "Am Djarass",
      94
);

INSERT INTO city
VALUES(
      3197,
      "Biltine",
      94
);

INSERT INTO city
VALUES(
      3198,
      "Abeche",
      94
);

INSERT INTO city
VALUES(
      3199,
      "Faya Largeau",
      94
);

INSERT INTO city
VALUES(
      3200,
      "Sarh",
      94
);

INSERT INTO city
VALUES(
      3201,
      "Bol",
      94
);

INSERT INTO country
VALUES(
      95,
      "Togo"
);

INSERT INTO city
VALUES(
      3202,
      "Lome",
      95
);

INSERT INTO city
VALUES(
      3203,
      "Kpalime",
      95
);

INSERT INTO city
VALUES(
      3204,
      "Atakpame",
      95
);

INSERT INTO city
VALUES(
      3205,
      "Mango",
      95
);

INSERT INTO city
VALUES(
      3206,
      "Kara",
      95
);

INSERT INTO city
VALUES(
      3207,
      "Sokode",
      95
);

INSERT INTO city
VALUES(
      3208,
      "Dapaong",
      95
);

INSERT INTO city
VALUES(
      3209,
      "Bassar",
      95
);

INSERT INTO city
VALUES(
      3210,
      "Sotouboua",
      95
);

INSERT INTO country
VALUES(
      96,
      "Thailand"
);

INSERT INTO city
VALUES(
      3211,
      "Amnat Charoen",
      96
);

INSERT INTO city
VALUES(
      3212,
      "Chiang Rai",
      96
);

INSERT INTO city
VALUES(
      3213,
      "Bangkok",
      96
);

INSERT INTO city
VALUES(
      3214,
      "Samut Prakan",
      96
);

INSERT INTO city
VALUES(
      3215,
      "Rayong",
      96
);

INSERT INTO city
VALUES(
      3216,
      "Chon Buri",
      96
);

INSERT INTO city
VALUES(
      3217,
      "Si Racha",
      96
);

INSERT INTO city
VALUES(
      3218,
      "Phitsanulok",
      96
);

INSERT INTO city
VALUES(
      3219,
      "Yala",
      96
);

INSERT INTO city
VALUES(
      3220,
      "Phayao",
      96
);

INSERT INTO city
VALUES(
      3221,
      "Phatthalung",
      96
);

INSERT INTO city
VALUES(
      3222,
      "Nong Khai",
      96
);

INSERT INTO city
VALUES(
      3223,
      "Sukhothai",
      96
);

INSERT INTO city
VALUES(
      3224,
      "Sing Buri",
      96
);

INSERT INTO city
VALUES(
      3225,
      "Satun",
      96
);

INSERT INTO city
VALUES(
      3226,
      "Ranong",
      96
);

INSERT INTO city
VALUES(
      3227,
      "Prachin Buri",
      96
);

INSERT INTO city
VALUES(
      3228,
      "Sa Kaeo",
      96
);

INSERT INTO city
VALUES(
      3229,
      "Roi Et",
      96
);

INSERT INTO city
VALUES(
      3230,
      "Phuket",
      96
);

INSERT INTO city
VALUES(
      3231,
      "Phrae",
      96
);

INSERT INTO city
VALUES(
      3232,
      "Phichit",
      96
);

INSERT INTO city
VALUES(
      3233,
      "Phetchabun",
      96
);

INSERT INTO city
VALUES(
      3234,
      "Chaiyaphum",
      96
);

INSERT INTO city
VALUES(
      3235,
      "Chanthaburi",
      96
);

INSERT INTO city
VALUES(
      3236,
      "Chainat",
      96
);

INSERT INTO city
VALUES(
      3237,
      "Chachoengsao",
      96
);

INSERT INTO city
VALUES(
      3238,
      "Ang Thong",
      96
);

INSERT INTO city
VALUES(
      3239,
      "Surat Thani",
      96
);

INSERT INTO city
VALUES(
      3240,
      "Ayutthaya",
      96
);

INSERT INTO city
VALUES(
      3241,
      "Phangnga",
      96
);

INSERT INTO city
VALUES(
      3242,
      "Lampang",
      96
);

INSERT INTO city
VALUES(
      3243,
      "Kalasin",
      96
);

INSERT INTO city
VALUES(
      3244,
      "Nakhon Sawan",
      96
);

INSERT INTO city
VALUES(
      3245,
      "Nakhon Phanom",
      96
);

INSERT INTO city
VALUES(
      3246,
      "Maha Sarakham",
      96
);

INSERT INTO city
VALUES(
      3247,
      "Lop Buri",
      96
);

INSERT INTO city
VALUES(
      3248,
      "Loei",
      96
);

INSERT INTO city
VALUES(
      3249,
      "Uthai Thani",
      96
);

INSERT INTO city
VALUES(
      3250,
      "Trang",
      96
);

INSERT INTO city
VALUES(
      3251,
      "Phetchaburi",
      96
);

INSERT INTO city
VALUES(
      3252,
      "Yasothon",
      96
);

INSERT INTO city
VALUES(
      3253,
      "Surin",
      96
);

INSERT INTO city
VALUES(
      3254,
      "Uttaradit",
      96
);

INSERT INTO city
VALUES(
      3255,
      "Mae Hong Son",
      96
);

INSERT INTO city
VALUES(
      3256,
      "Samut Songkhram",
      96
);

INSERT INTO city
VALUES(
      3257,
      "Aranyaprathet",
      96
);

INSERT INTO city
VALUES(
      3258,
      "Tak",
      96
);

INSERT INTO city
VALUES(
      3259,
      "Chiang Mai",
      96
);

INSERT INTO city
VALUES(
      3260,
      "Narathiwat",
      96
);

INSERT INTO city
VALUES(
      3261,
      "Songkhla",
      96
);

INSERT INTO city
VALUES(
      3262,
      "Hat Yai",
      96
);

INSERT INTO city
VALUES(
      3263,
      "Ubon Ratchathani",
      96
);

INSERT INTO city
VALUES(
      3264,
      "Trat",
      96
);

INSERT INTO city
VALUES(
      3265,
      "Kanchanaburi",
      96
);

INSERT INTO city
VALUES(
      3266,
      "Bua Yai",
      96
);

INSERT INTO city
VALUES(
      3267,
      "Sakhon Nakhon",
      96
);

INSERT INTO city
VALUES(
      3268,
      "Lamphun",
      96
);

INSERT INTO city
VALUES(
      3269,
      "Nakhon Pathom",
      96
);

INSERT INTO city
VALUES(
      3270,
      "Ratchaburi",
      96
);

INSERT INTO city
VALUES(
      3271,
      "Udon Thani",
      96
);

INSERT INTO city
VALUES(
      3272,
      "Samut Sakhon",
      96
);

INSERT INTO city
VALUES(
      3273,
      "Sisaket",
      96
);

INSERT INTO city
VALUES(
      3274,
      "Supham Buri",
      96
);

INSERT INTO city
VALUES(
      3275,
      "Nakhon Ratchasima",
      96
);

INSERT INTO city
VALUES(
      3276,
      "Nonthaburi",
      96
);

INSERT INTO city
VALUES(
      3277,
      "Mae Sot",
      96
);

INSERT INTO city
VALUES(
      3278,
      "Khon Kaen",
      96
);

INSERT INTO city
VALUES(
      3279,
      "Mukdahan",
      96
);

INSERT INTO city
VALUES(
      3280,
      "Nong Bua Lamphu",
      96
);

INSERT INTO city
VALUES(
      3281,
      "Thung Song",
      96
);

INSERT INTO city
VALUES(
      3282,
      "Nakhon Si Thammarat",
      96
);

INSERT INTO city
VALUES(
      3283,
      "Krabi",
      96
);

INSERT INTO city
VALUES(
      3284,
      "Pathum Thani",
      96
);

INSERT INTO city
VALUES(
      3285,
      "Nakhon Nayok",
      96
);

INSERT INTO city
VALUES(
      3286,
      "Prachuap Khiri Khan",
      96
);

INSERT INTO city
VALUES(
      3287,
      "Nan",
      96
);

INSERT INTO city
VALUES(
      3288,
      "Bueng Kan",
      96
);

INSERT INTO city
VALUES(
      3289,
      "Hua Hin",
      96
);

INSERT INTO city
VALUES(
      3290,
      "Kamphaeng Phet",
      96
);

INSERT INTO city
VALUES(
      3291,
      "Chumphon",
      96
);

INSERT INTO city
VALUES(
      3292,
      "Pattani",
      96
);

INSERT INTO city
VALUES(
      3293,
      "Buriram",
      96
);

INSERT INTO city
VALUES(
      3294,
      "Saraburi",
      96
);

INSERT INTO country
VALUES(
      97,
      "Tajikistan"
);

INSERT INTO city
VALUES(
      3295,
      "Khorugh",
      97
);

INSERT INTO city
VALUES(
      3296,
      "Qurghonteppa",
      97
);

INSERT INTO city
VALUES(
      3297,
      "Kulob",
      97
);

INSERT INTO city
VALUES(
      3298,
      "Konibodom",
      97
);

INSERT INTO city
VALUES(
      3299,
      "Khujand",
      97
);

INSERT INTO city
VALUES(
      3300,
      "Uroteppa",
      97
);

INSERT INTO city
VALUES(
      3301,
      "Dushanbe",
      97
);

INSERT INTO city
VALUES(
      3302,
      "Kuybyshevskiy",
      97
);

INSERT INTO country
VALUES(
      98,
      "Timor-Leste"
);

INSERT INTO city
VALUES(
      3303,
      "Dili",
      98
);

INSERT INTO city
VALUES(
      3304,
      "Aileu",
      98
);

INSERT INTO city
VALUES(
      3305,
      "Ainaro",
      98
);

INSERT INTO city
VALUES(
      3306,
      "Baucau",
      98
);

INSERT INTO city
VALUES(
      3307,
      "Maliana",
      98
);

INSERT INTO city
VALUES(
      3308,
      "Suai",
      98
);

INSERT INTO city
VALUES(
      3309,
      "Gleno",
      98
);

INSERT INTO city
VALUES(
      3310,
      "Lospalos",
      98
);

INSERT INTO city
VALUES(
      3311,
      "Liquica",
      98
);

INSERT INTO city
VALUES(
      3312,
      "Manatuto",
      98
);

INSERT INTO city
VALUES(
      3313,
      "Same",
      98
);

INSERT INTO city
VALUES(
      3314,
      "Pante Macassar",
      98
);

INSERT INTO city
VALUES(
      3315,
      "Viqueque",
      98
);

INSERT INTO country
VALUES(
      99,
      "Turkmenistan"
);

INSERT INTO city
VALUES(
      3316,
      "Turkmenbasy",
      99
);

INSERT INTO city
VALUES(
      3317,
      "Dasoguz",
      99
);

INSERT INTO city
VALUES(
      3318,
      "Koneurgench",
      99
);

INSERT INTO city
VALUES(
      3319,
      "Balkanabat",
      99
);

INSERT INTO city
VALUES(
      3320,
      "Celeken",
      99
);

INSERT INTO city
VALUES(
      3321,
      "Atamyrat",
      99
);

INSERT INTO city
VALUES(
      3322,
      "Mary",
      99
);

INSERT INTO city
VALUES(
      3323,
      "Turkmenabat",
      99
);

INSERT INTO city
VALUES(
      3324,
      "Tejen",
      99
);

INSERT INTO city
VALUES(
      3325,
      "Kaka",
      99
);

INSERT INTO city
VALUES(
      3326,
      "Gyzlarbat",
      99
);

INSERT INTO city
VALUES(
      3327,
      "Buzmeyin",
      99
);

INSERT INTO city
VALUES(
      3328,
      "Ashgabat",
      99
);

INSERT INTO city
VALUES(
      3329,
      "Anew",
      99
);

INSERT INTO country
VALUES(
      100,
      "Tunisia"
);

INSERT INTO city
VALUES(
      3330,
      "Dehibat",
      100
);

INSERT INTO city
VALUES(
      3331,
      "Zarzis",
      100
);

INSERT INTO city
VALUES(
      3332,
      "Gabes",
      100
);

INSERT INTO city
VALUES(
      3333,
      "Gafsa",
      100
);

INSERT INTO city
VALUES(
      3334,
      "Qasserine",
      100
);

INSERT INTO city
VALUES(
      3335,
      "Sdid Bouzid",
      100
);

INSERT INTO city
VALUES(
      3336,
      "Sfax",
      100
);

INSERT INTO city
VALUES(
      3337,
      "Mahdia",
      100
);

INSERT INTO city
VALUES(
      3338,
      "Monastir",
      100
);

INSERT INTO city
VALUES(
      3339,
      "Sousse",
      100
);

INSERT INTO city
VALUES(
      3340,
      "Qairouan",
      100
);

INSERT INTO city
VALUES(
      3341,
      "El Kef",
      100
);

INSERT INTO city
VALUES(
      3342,
      "Jendouba",
      100
);

INSERT INTO city
VALUES(
      3343,
      "Beja",
      100
);

INSERT INTO city
VALUES(
      3344,
      "Bizerte",
      100
);

INSERT INTO city
VALUES(
      3345,
      "Zaghouan",
      100
);

INSERT INTO city
VALUES(
      3346,
      "Siliana",
      100
);

INSERT INTO city
VALUES(
      3347,
      "Nabeul",
      100
);

INSERT INTO city
VALUES(
      3348,
      "Kebili",
      100
);

INSERT INTO city
VALUES(
      3349,
      "Tataouine",
      100
);

INSERT INTO city
VALUES(
      3350,
      "Medenine",
      100
);

INSERT INTO city
VALUES(
      3351,
      "Tozeur",
      100
);

INSERT INTO city
VALUES(
      3352,
      "Tunis",
      100
);

INSERT INTO city
VALUES(
      3353,
      "Ben Gardane",
      100
);

INSERT INTO city
VALUES(
      3354,
      "Ben Arous",
      100
);

INSERT INTO city
VALUES(
      3355,
      "Manouba",
      100
);

INSERT INTO city
VALUES(
      3356,
      "LaAriana",
      100
);

INSERT INTO country
VALUES(
      101,
      "Tonga"
);

INSERT INTO city
VALUES(
      3357,
      "Neiafu",
      101
);

INSERT INTO city
VALUES(
      3358,
      "Nukualofa",
      101
);

INSERT INTO country
VALUES(
      102,
      "Turkey"
);

INSERT INTO city
VALUES(
      3359,
      "Isparta",
      102
);

INSERT INTO city
VALUES(
      3360,
      "Sivas",
      102
);

INSERT INTO city
VALUES(
      3361,
      "Kilis",
      102
);

INSERT INTO city
VALUES(
      3362,
      "Edirne",
      102
);

INSERT INTO city
VALUES(
      3363,
      "Bingol",
      102
);

INSERT INTO city
VALUES(
      3364,
      "Corum",
      102
);

INSERT INTO city
VALUES(
      3365,
      "Igdir",
      102
);

INSERT INTO city
VALUES(
      3366,
      "Batman",
      102
);

INSERT INTO city
VALUES(
      3367,
      "Rize",
      102
);

INSERT INTO city
VALUES(
      3368,
      "Ardahan",
      102
);

INSERT INTO city
VALUES(
      3369,
      "Adiyaman",
      102
);

INSERT INTO city
VALUES(
      3370,
      "Bitlis",
      102
);

INSERT INTO city
VALUES(
      3371,
      "Trabzon",
      102
);

INSERT INTO city
VALUES(
      3372,
      "Mardin",
      102
);

INSERT INTO city
VALUES(
      3373,
      "Gaziantep",
      102
);

INSERT INTO city
VALUES(
      3374,
      "Sinop",
      102
);

INSERT INTO city
VALUES(
      3375,
      "Manisa",
      102
);

INSERT INTO city
VALUES(
      3376,
      "Aydin",
      102
);

INSERT INTO city
VALUES(
      3377,
      "Giresun",
      102
);

INSERT INTO city
VALUES(
      3378,
      "Iskenderun",
      102
);

INSERT INTO city
VALUES(
      3379,
      "Kahramanmaras",
      102
);

INSERT INTO city
VALUES(
      3380,
      "Adana",
      102
);

INSERT INTO city
VALUES(
      3381,
      "Osmaniye",
      102
);

INSERT INTO city
VALUES(
      3382,
      "Kayseri",
      102
);

INSERT INTO city
VALUES(
      3383,
      "Samsun",
      102
);

INSERT INTO city
VALUES(
      3384,
      "Yozgat",
      102
);

INSERT INTO city
VALUES(
      3385,
      "Bafra",
      102
);

INSERT INTO city
VALUES(
      3386,
      "Amasya",
      102
);

INSERT INTO city
VALUES(
      3387,
      "Tokat",
      102
);

INSERT INTO city
VALUES(
      3388,
      "Nigde",
      102
);

INSERT INTO city
VALUES(
      3389,
      "Kirikkale",
      102
);

INSERT INTO city
VALUES(
      3390,
      "Burdur",
      102
);

INSERT INTO city
VALUES(
      3391,
      "Kirsehir",
      102
);

INSERT INTO city
VALUES(
      3392,
      "Karabuk",
      102
);

INSERT INTO city
VALUES(
      3393,
      "Karaman",
      102
);

INSERT INTO city
VALUES(
      3394,
      "Nevsehir",
      102
);

INSERT INTO city
VALUES(
      3395,
      "Aksaray",
      102
);

INSERT INTO city
VALUES(
      3396,
      "Polatli",
      102
);

INSERT INTO city
VALUES(
      3397,
      "Afyon",
      102
);

INSERT INTO city
VALUES(
      3398,
      "Kastamonu",
      102
);

INSERT INTO city
VALUES(
      3399,
      "Bolu",
      102
);

INSERT INTO city
VALUES(
      3400,
      "Antalya",
      102
);

INSERT INTO city
VALUES(
      3401,
      "Konya",
      102
);

INSERT INTO city
VALUES(
      3402,
      "Cankiri",
      102
);

INSERT INTO city
VALUES(
      3403,
      "Ankara",
      102
);

INSERT INTO city
VALUES(
      3404,
      "Balikesir",
      102
);

INSERT INTO city
VALUES(
      3405,
      "Bartin",
      102
);

INSERT INTO city
VALUES(
      3406,
      "Duzce",
      102
);

INSERT INTO city
VALUES(
      3407,
      "Zonguldak",
      102
);

INSERT INTO city
VALUES(
      3408,
      "Eskisehir",
      102
);

INSERT INTO city
VALUES(
      3409,
      "Adapazari",
      102
);

INSERT INTO city
VALUES(
      3410,
      "Izmit",
      102
);

INSERT INTO city
VALUES(
      3411,
      "Yalova",
      102
);

INSERT INTO city
VALUES(
      3412,
      "Bilecik",
      102
);

INSERT INTO city
VALUES(
      3413,
      "Istanbul",
      102
);

INSERT INTO city
VALUES(
      3414,
      "Denizli",
      102
);

INSERT INTO city
VALUES(
      3415,
      "Mugla",
      102
);

INSERT INTO city
VALUES(
      3416,
      "Tekirdag",
      102
);

INSERT INTO city
VALUES(
      3417,
      "Kutahya",
      102
);

INSERT INTO city
VALUES(
      3418,
      "Kirklareli",
      102
);

INSERT INTO city
VALUES(
      3419,
      "Usak",
      102
);

INSERT INTO city
VALUES(
      3420,
      "Soke",
      102
);

INSERT INTO city
VALUES(
      3421,
      "Hatay",
      102
);

INSERT INTO city
VALUES(
      3422,
      "Malatya",
      102
);

INSERT INTO city
VALUES(
      3423,
      "Elazig",
      102
);

INSERT INTO city
VALUES(
      3424,
      "Artvin",
      102
);

INSERT INTO city
VALUES(
      3425,
      "Sirnak",
      102
);

INSERT INTO city
VALUES(
      3426,
      "Hakkari",
      102
);

INSERT INTO city
VALUES(
      3427,
      "Samandagi",
      102
);

INSERT INTO city
VALUES(
      3428,
      "Gumushane",
      102
);

INSERT INTO city
VALUES(
      3429,
      "Tunceli",
      102
);

INSERT INTO city
VALUES(
      3430,
      "Bayburt",
      102
);

INSERT INTO city
VALUES(
      3431,
      "Erzincan",
      102
);

INSERT INTO city
VALUES(
      3432,
      "Agri",
      102
);

INSERT INTO city
VALUES(
      3433,
      "Mus",
      102
);

INSERT INTO city
VALUES(
      3434,
      "Izmir",
      102
);

INSERT INTO city
VALUES(
      3435,
      "Van",
      102
);

INSERT INTO city
VALUES(
      3436,
      "Kars",
      102
);

INSERT INTO city
VALUES(
      3437,
      "Diyarbakir",
      102
);

INSERT INTO city
VALUES(
      3438,
      "Erzurum",
      102
);

INSERT INTO city
VALUES(
      3439,
      "Luleburgaz",
      102
);

INSERT INTO city
VALUES(
      3440,
      "Bursa",
      102
);

INSERT INTO city
VALUES(
      3441,
      "Canakkale",
      102
);

INSERT INTO city
VALUES(
      3442,
      "Mersin",
      102
);

INSERT INTO city
VALUES(
      3443,
      "Tarsus",
      102
);

INSERT INTO city
VALUES(
      3444,
      "Tatvan",
      102
);

INSERT INTO city
VALUES(
      3445,
      "Nusaybin",
      102
);

INSERT INTO city
VALUES(
      3446,
      "Ordu",
      102
);

INSERT INTO city
VALUES(
      3447,
      "Siirt",
      102
);

INSERT INTO city
VALUES(
      3448,
      "Eregli",
      102
);

INSERT INTO city
VALUES(
      3449,
      "Sanliurfa",
      102
);

INSERT INTO country
VALUES(
      103,
      "Trinidad And Tobago"
);

INSERT INTO city
VALUES(
      3450,
      "Port-of-Spain",
      103
);

INSERT INTO city
VALUES(
      3451,
      "Arima",
      103
);

INSERT INTO city
VALUES(
      3452,
      "Aranguez",
      103
);

INSERT INTO city
VALUES(
      3453,
      "Chaguanas",
      103
);

INSERT INTO city
VALUES(
      3454,
      "Couva",
      103
);

INSERT INTO city
VALUES(
      3455,
      "Debe",
      103
);

INSERT INTO city
VALUES(
      3456,
      "Diego Martin",
      103
);

INSERT INTO city
VALUES(
      3457,
      "Point Fortin",
      103
);

INSERT INTO city
VALUES(
      3458,
      "Princes Town",
      103
);

INSERT INTO city
VALUES(
      3459,
      "Rio Claro",
      103
);

INSERT INTO city
VALUES(
      3460,
      "San Fernando",
      103
);

INSERT INTO city
VALUES(
      3461,
      "Sangre Grande",
      103
);

INSERT INTO city
VALUES(
      3462,
      "Scarborough",
      103
);

INSERT INTO city
VALUES(
      3463,
      "Siparia",
      103
);

INSERT INTO city
VALUES(
      3464,
      "Tunapuna",
      103
);

INSERT INTO country
VALUES(
      104,
      "Tuvalu"
);

INSERT INTO city
VALUES(
      3465,
      "Funafuti",
      104
);

INSERT INTO country
VALUES(
      105,
      "Taiwan"
);

INSERT INTO city
VALUES(
      3466,
      "Taipei",
      105
);

INSERT INTO city
VALUES(
      3467,
      "Magong",
      105
);

INSERT INTO city
VALUES(
      3468,
      "Pingtung",
      105
);

INSERT INTO city
VALUES(
      3469,
      "Bade",
      105
);

INSERT INTO city
VALUES(
      3470,
      "Hualien",
      105
);

INSERT INTO city
VALUES(
      3471,
      "Miaoli",
      105
);

INSERT INTO city
VALUES(
      3472,
      "Zhubei",
      105
);

INSERT INTO city
VALUES(
      3473,
      "Yangmei",
      105
);

INSERT INTO city
VALUES(
      3474,
      "Taitung",
      105
);

INSERT INTO city
VALUES(
      3475,
      "Taoyuan",
      105
);

INSERT INTO city
VALUES(
      3476,
      "Pingzhen",
      105
);

INSERT INTO city
VALUES(
      3477,
      "Zhongli",
      105
);

INSERT INTO city
VALUES(
      3478,
      "Taibao",
      105
);

INSERT INTO city
VALUES(
      3479,
      "Yilan",
      105
);

INSERT INTO city
VALUES(
      3480,
      "Changhua",
      105
);

INSERT INTO city
VALUES(
      3481,
      "Nantou",
      105
);

INSERT INTO city
VALUES(
      3482,
      "Douliou",
      105
);

INSERT INTO city
VALUES(
      3483,
      "Puzi",
      105
);

INSERT INTO city
VALUES(
      3484,
      "Hsinchu",
      105
);

INSERT INTO city
VALUES(
      3485,
      "Chiayi",
      105
);

INSERT INTO city
VALUES(
      3486,
      "Banqiao",
      105
);

INSERT INTO city
VALUES(
      3487,
      "Taichung",
      105
);

INSERT INTO city
VALUES(
      3488,
      "Keelung",
      105
);

INSERT INTO city
VALUES(
      3489,
      "Tainan",
      105
);

INSERT INTO city
VALUES(
      3490,
      "Kaohsiung",
      105
);

INSERT INTO city
VALUES(
      3491,
      "Jincheng",
      105
);

INSERT INTO city
VALUES(
      3492,
      "Nangan",
      105
);

INSERT INTO country
VALUES(
      106,
      "Tanzania"
);

INSERT INTO city
VALUES(
      3493,
      "Sumbawanga",
      106
);

INSERT INTO city
VALUES(
      3494,
      "Mtwara",
      106
);

INSERT INTO city
VALUES(
      3495,
      "Koani",
      106
);

INSERT INTO city
VALUES(
      3496,
      "Mbeya",
      106
);

INSERT INTO city
VALUES(
      3497,
      "Zanzibar",
      106
);

INSERT INTO city
VALUES(
      3498,
      "Uvinza",
      106
);

INSERT INTO city
VALUES(
      3499,
      "Musoma",
      106
);

INSERT INTO city
VALUES(
      3500,
      "Tanga",
      106
);

INSERT INTO city
VALUES(
      3501,
      "Kigoma",
      106
);

INSERT INTO city
VALUES(
      3502,
      "Kakonko",
      106
);

INSERT INTO city
VALUES(
      3503,
      "Moshi",
      106
);

INSERT INTO city
VALUES(
      3504,
      "Arusha",
      106
);

INSERT INTO city
VALUES(
      3505,
      "Lindi",
      106
);

INSERT INTO city
VALUES(
      3506,
      "Kilindoni",
      106
);

INSERT INTO city
VALUES(
      3507,
      "Kibiti",
      106
);

INSERT INTO city
VALUES(
      3508,
      "Mikumi",
      106
);

INSERT INTO city
VALUES(
      3509,
      "Chake Chake",
      106
);

INSERT INTO city
VALUES(
      3510,
      "Kasulu",
      106
);

INSERT INTO city
VALUES(
      3511,
      "Biharamulo",
      106
);

INSERT INTO city
VALUES(
      3512,
      "Bukoba",
      106
);

INSERT INTO city
VALUES(
      3513,
      "Iringa",
      106
);

INSERT INTO city
VALUES(
      3514,
      "Songea",
      106
);

INSERT INTO city
VALUES(
      3515,
      "Ngara",
      106
);

INSERT INTO city
VALUES(
      3516,
      "Mwanza",
      106
);

INSERT INTO city
VALUES(
      3517,
      "Wete",
      106
);

INSERT INTO city
VALUES(
      3518,
      "Babati",
      106
);

INSERT INTO city
VALUES(
      3519,
      "Singida",
      106
);

INSERT INTO city
VALUES(
      3520,
      "Morogoro",
      106
);

INSERT INTO city
VALUES(
      3521,
      "Tabora",
      106
);

INSERT INTO city
VALUES(
      3522,
      "Dodoma",
      106
);

INSERT INTO city
VALUES(
      3523,
      "Dar es Salaam",
      106
);

INSERT INTO city
VALUES(
      3524,
      "Ifakara",
      106
);

INSERT INTO city
VALUES(
      3525,
      "Tunduma",
      106
);

INSERT INTO city
VALUES(
      3526,
      "Tunduru",
      106
);

INSERT INTO city
VALUES(
      3527,
      "Itigi",
      106
);

INSERT INTO city
VALUES(
      3528,
      "Masasi",
      106
);

INSERT INTO city
VALUES(
      3529,
      "Kipili",
      106
);

INSERT INTO city
VALUES(
      3530,
      "Tukuyu",
      106
);

INSERT INTO city
VALUES(
      3531,
      "Manyoni",
      106
);

INSERT INTO city
VALUES(
      3532,
      "Mbamba Bay",
      106
);

INSERT INTO city
VALUES(
      3533,
      "Nzega",
      106
);

INSERT INTO city
VALUES(
      3534,
      "Ngorongoro",
      106
);

INSERT INTO city
VALUES(
      3535,
      "Kanyato",
      106
);

INSERT INTO city
VALUES(
      3536,
      "Kilosa",
      106
);

INSERT INTO city
VALUES(
      3537,
      "Same",
      106
);

INSERT INTO city
VALUES(
      3538,
      "Sikonge",
      106
);

INSERT INTO city
VALUES(
      3539,
      "Korogwe",
      106
);

INSERT INTO city
VALUES(
      3540,
      "Bagamoyo",
      106
);

INSERT INTO city
VALUES(
      3541,
      "Kibaha",
      106
);

INSERT INTO city
VALUES(
      3542,
      "Mpwapwa",
      106
);

INSERT INTO city
VALUES(
      3543,
      "Oldeani",
      106
);

INSERT INTO city
VALUES(
      3544,
      "Karema",
      106
);

INSERT INTO city
VALUES(
      3545,
      "Nyahanga",
      106
);

INSERT INTO city
VALUES(
      3546,
      "Mbulu",
      106
);

INSERT INTO city
VALUES(
      3547,
      "Kahama",
      106
);

INSERT INTO city
VALUES(
      3548,
      "Shinyanga",
      106
);

INSERT INTO city
VALUES(
      3549,
      "Vwawa",
      106
);

INSERT INTO city
VALUES(
      3550,
      "Bariadi",
      106
);

INSERT INTO city
VALUES(
      3551,
      "Geita",
      106
);

INSERT INTO city
VALUES(
      3552,
      "Mahonda",
      106
);

INSERT INTO city
VALUES(
      3553,
      "Mkokotoni",
      106
);

INSERT INTO city
VALUES(
      3554,
      "Mpanda",
      106
);

INSERT INTO city
VALUES(
      3555,
      "Njombe",
      106
);

INSERT INTO country
VALUES(
      107,
      "Ukraine"
);

INSERT INTO city
VALUES(
      3556,
      "Uzhgorod",
      107
);

INSERT INTO city
VALUES(
      3557,
      "Kiev",
      107
);

INSERT INTO city
VALUES(
      3558,
      "Ivano-Frankivsk",
      107
);

INSERT INTO city
VALUES(
      3559,
      "Kherson",
      107
);

INSERT INTO city
VALUES(
      3560,
      "Donetsk",
      107
);

INSERT INTO city
VALUES(
      3561,
      "Khmelnytskyy",
      107
);

INSERT INTO city
VALUES(
      3562,
      "Makiyivka",
      107
);

INSERT INTO city
VALUES(
      3563,
      "Mykolayiv",
      107
);

INSERT INTO city
VALUES(
      3564,
      "Lvov",
      107
);

INSERT INTO city
VALUES(
      3565,
      "Odessa",
      107
);

INSERT INTO city
VALUES(
      3566,
      "Kharkiv",
      107
);

INSERT INTO city
VALUES(
      3567,
      "Zaporizhzhya",
      107
);

INSERT INTO city
VALUES(
      3568,
      "Luhansk",
      107
);

INSERT INTO city
VALUES(
      3569,
      "Sumy",
      107
);

INSERT INTO city
VALUES(
      3570,
      "Ternopil",
      107
);

INSERT INTO city
VALUES(
      3571,
      "Poltava",
      107
);

INSERT INTO city
VALUES(
      3572,
      "Vinnytsya",
      107
);

INSERT INTO city
VALUES(
      3573,
      "Simferopola",
      107
);

INSERT INTO city
VALUES(
      3574,
      "Lutsk",
      107
);

INSERT INTO city
VALUES(
      3575,
      "Chernivtsi",
      107
);

INSERT INTO city
VALUES(
      3576,
      "Cherkasy",
      107
);

INSERT INTO city
VALUES(
      3577,
      "Mariupol",
      107
);

INSERT INTO city
VALUES(
      3578,
      "Chernobyl",
      107
);

INSERT INTO city
VALUES(
      3579,
      "Zhytomyr",
      107
);

INSERT INTO city
VALUES(
      3580,
      "Horlivka",
      107
);

INSERT INTO city
VALUES(
      3581,
      "Kramatorsk",
      107
);

INSERT INTO city
VALUES(
      3582,
      "Lysychansk",
      107
);

INSERT INTO city
VALUES(
      3583,
      "Melitopol",
      107
);

INSERT INTO city
VALUES(
      3584,
      "Chernihiv",
      107
);

INSERT INTO city
VALUES(
      3585,
      "Nizhyn",
      107
);

INSERT INTO city
VALUES(
      3586,
      "Berdyansk",
      107
);

INSERT INTO city
VALUES(
      3587,
      "Kovel",
      107
);

INSERT INTO city
VALUES(
      3588,
      "Kupyansk",
      107
);

INSERT INTO city
VALUES(
      3589,
      "Nikopol",
      107
);

INSERT INTO city
VALUES(
      3590,
      "Rivne",
      107
);

INSERT INTO city
VALUES(
      3591,
      "Uman",
      107
);

INSERT INTO city
VALUES(
      3592,
      "Drohobych",
      107
);

INSERT INTO city
VALUES(
      3593,
      "Konotop",
      107
);

INSERT INTO city
VALUES(
      3594,
      "Voznesensk",
      107
);

INSERT INTO city
VALUES(
      3595,
      "Korosten",
      107
);

INSERT INTO city
VALUES(
      3596,
      "Kamyanets-Podilskyy",
      107
);

INSERT INTO city
VALUES(
      3597,
      "Shostka",
      107
);

INSERT INTO city
VALUES(
      3598,
      "Kryvyy Rih",
      107
);

INSERT INTO city
VALUES(
      3599,
      "Izmayil",
      107
);

INSERT INTO city
VALUES(
      3600,
      "Bila Tserkva",
      107
);

INSERT INTO city
VALUES(
      3601,
      "Brovary",
      107
);

INSERT INTO city
VALUES(
      3602,
      "Sevastopola",
      107
);

INSERT INTO city
VALUES(
      3603,
      "Kremenchuk",
      107
);

INSERT INTO city
VALUES(
      3604,
      "Kirovohrad",
      107
);

INSERT INTO city
VALUES(
      3605,
      "Dnipro",
      107
);

INSERT INTO city
VALUES(
      3606,
      "Illichivsk",
      107
);

INSERT INTO country
VALUES(
      108,
      "Uganda"
);

INSERT INTO city
VALUES(
      3607,
      "Rukungiri",
      108
);

INSERT INTO city
VALUES(
      3608,
      "Kanungu",
      108
);

INSERT INTO city
VALUES(
      3609,
      "Katwe",
      108
);

INSERT INTO city
VALUES(
      3610,
      "Kumi",
      108
);

INSERT INTO city
VALUES(
      3611,
      "Bugiri",
      108
);

INSERT INTO city
VALUES(
      3612,
      "Kasese",
      108
);

INSERT INTO city
VALUES(
      3613,
      "Kibale",
      108
);

INSERT INTO city
VALUES(
      3614,
      "Kiboga",
      108
);

INSERT INTO city
VALUES(
      3615,
      "Bushenyi",
      108
);

INSERT INTO city
VALUES(
      3616,
      "Hoima",
      108
);

INSERT INTO city
VALUES(
      3617,
      "Kayunga",
      108
);

INSERT INTO city
VALUES(
      3618,
      "Jinja",
      108
);

INSERT INTO city
VALUES(
      3619,
      "Nakapiripirit",
      108
);

INSERT INTO city
VALUES(
      3620,
      "Kyenjojo",
      108
);

INSERT INTO city
VALUES(
      3621,
      "Kalangala",
      108
);

INSERT INTO city
VALUES(
      3622,
      "Mukono",
      108
);

INSERT INTO city
VALUES(
      3623,
      "Sembabule",
      108
);

INSERT INTO city
VALUES(
      3624,
      "Kamwenge",
      108
);

INSERT INTO city
VALUES(
      3625,
      "Wakiso",
      108
);

INSERT INTO city
VALUES(
      3626,
      "Ntungamo",
      108
);

INSERT INTO city
VALUES(
      3627,
      "Nakasongola",
      108
);

INSERT INTO city
VALUES(
      3628,
      "Kabale",
      108
);

INSERT INTO city
VALUES(
      3629,
      "Masindi",
      108
);

INSERT INTO city
VALUES(
      3630,
      "Kaabong",
      108
);

INSERT INTO city
VALUES(
      3631,
      "Rakai",
      108
);

INSERT INTO city
VALUES(
      3632,
      "Isingiro",
      108
);

INSERT INTO city
VALUES(
      3633,
      "Masindi-Port",
      108
);

INSERT INTO city
VALUES(
      3634,
      "Zombo",
      108
);

INSERT INTO city
VALUES(
      3635,
      "Pallisa",
      108
);

INSERT INTO city
VALUES(
      3636,
      "Luwero",
      108
);

INSERT INTO city
VALUES(
      3637,
      "Kotido",
      108
);

INSERT INTO city
VALUES(
      3638,
      "Lira",
      108
);

INSERT INTO city
VALUES(
      3639,
      "Mubende",
      108
);

INSERT INTO city
VALUES(
      3640,
      "Buikwe",
      108
);

INSERT INTO city
VALUES(
      3641,
      "Lamwo",
      108
);

INSERT INTO city
VALUES(
      3642,
      "Agago",
      108
);

INSERT INTO city
VALUES(
      3643,
      "Napak",
      108
);

INSERT INTO city
VALUES(
      3644,
      "Luuka Town",
      108
);

INSERT INTO city
VALUES(
      3645,
      "Otuke",
      108
);

INSERT INTO city
VALUES(
      3646,
      "Alebtong",
      108
);

INSERT INTO city
VALUES(
      3647,
      "Amuria",
      108
);

INSERT INTO city
VALUES(
      3648,
      "Kole",
      108
);

INSERT INTO city
VALUES(
      3649,
      "Oyam",
      108
);

INSERT INTO city
VALUES(
      3650,
      "Abim",
      108
);

INSERT INTO city
VALUES(
      3651,
      "Binyin",
      108
);

INSERT INTO city
VALUES(
      3652,
      "Bulambuli",
      108
);

INSERT INTO city
VALUES(
      3653,
      "Bududa",
      108
);

INSERT INTO city
VALUES(
      3654,
      "Amudat",
      108
);

INSERT INTO city
VALUES(
      3655,
      "Bukwa",
      108
);

INSERT INTO city
VALUES(
      3656,
      "Kapchorwa",
      108
);

INSERT INTO city
VALUES(
      3657,
      "Masaka",
      108
);

INSERT INTO city
VALUES(
      3658,
      "Mbale",
      108
);

INSERT INTO city
VALUES(
      3659,
      "Mbarara",
      108
);

INSERT INTO city
VALUES(
      3660,
      "Tororo",
      108
);

INSERT INTO city
VALUES(
      3661,
      "Sironko",
      108
);

INSERT INTO city
VALUES(
      3662,
      "Rubirizi",
      108
);

INSERT INTO city
VALUES(
      3663,
      "Mitoma",
      108
);

INSERT INTO city
VALUES(
      3664,
      "Ntoroko",
      108
);

INSERT INTO city
VALUES(
      3665,
      "Kanoni",
      108
);

INSERT INTO city
VALUES(
      3666,
      "Kibingo",
      108
);

INSERT INTO city
VALUES(
      3667,
      "Nakaseke",
      108
);

INSERT INTO city
VALUES(
      3668,
      "Ibanda",
      108
);

INSERT INTO city
VALUES(
      3669,
      "Namayingo",
      108
);

INSERT INTO city
VALUES(
      3670,
      "Kitamilo",
      108
);

INSERT INTO city
VALUES(
      3671,
      "Kyegegwa",
      108
);

INSERT INTO city
VALUES(
      3672,
      "Lwengo",
      108
);

INSERT INTO city
VALUES(
      3673,
      "Bukomansimbi",
      108
);

INSERT INTO city
VALUES(
      3674,
      "Kalungu",
      108
);

INSERT INTO city
VALUES(
      3675,
      "Kiruhura",
      108
);

INSERT INTO city
VALUES(
      3676,
      "Lyantonde",
      108
);

INSERT INTO city
VALUES(
      3677,
      "Buyende",
      108
);

INSERT INTO city
VALUES(
      3678,
      "Ngora",
      108
);

INSERT INTO city
VALUES(
      3679,
      "Kibuku",
      108
);

INSERT INTO city
VALUES(
      3680,
      "Buhweju",
      108
);

INSERT INTO city
VALUES(
      3681,
      "Bukedea",
      108
);

INSERT INTO city
VALUES(
      3682,
      "Kampala",
      108
);

INSERT INTO city
VALUES(
      3683,
      "Nebbi",
      108
);

INSERT INTO city
VALUES(
      3684,
      "Bombo",
      108
);

INSERT INTO city
VALUES(
      3685,
      "Koboko",
      108
);

INSERT INTO city
VALUES(
      3686,
      "Arua",
      108
);

INSERT INTO city
VALUES(
      3687,
      "Maracha",
      108
);

INSERT INTO city
VALUES(
      3688,
      "Yumbe",
      108
);

INSERT INTO city
VALUES(
      3689,
      "Bulisa",
      108
);

INSERT INTO city
VALUES(
      3690,
      "Kiryandongo",
      108
);

INSERT INTO city
VALUES(
      3691,
      "Gulu",
      108
);

INSERT INTO city
VALUES(
      3692,
      "Adjumani",
      108
);

INSERT INTO city
VALUES(
      3693,
      "Moyo",
      108
);

INSERT INTO city
VALUES(
      3694,
      "Nwoya",
      108
);

INSERT INTO city
VALUES(
      3695,
      "Amuru",
      108
);

INSERT INTO city
VALUES(
      3696,
      "Kisoro",
      108
);

INSERT INTO city
VALUES(
      3697,
      "Kitgum",
      108
);

INSERT INTO city
VALUES(
      3698,
      "Pader",
      108
);

INSERT INTO city
VALUES(
      3699,
      "Katakwi",
      108
);

INSERT INTO city
VALUES(
      3700,
      "Entebbe",
      108
);

INSERT INTO city
VALUES(
      3701,
      "Moroto",
      108
);

INSERT INTO city
VALUES(
      3702,
      "Mayuge",
      108
);

INSERT INTO city
VALUES(
      3703,
      "Mityana",
      108
);

INSERT INTO city
VALUES(
      3704,
      "Bundibugyo",
      108
);

INSERT INTO city
VALUES(
      3705,
      "Fort Portal",
      108
);

INSERT INTO city
VALUES(
      3706,
      "Manafwa",
      108
);

INSERT INTO city
VALUES(
      3707,
      "Namutumba",
      108
);

INSERT INTO city
VALUES(
      3708,
      "Butaleja",
      108
);

INSERT INTO city
VALUES(
      3709,
      "Kaliro",
      108
);

INSERT INTO city
VALUES(
      3710,
      "Gombe",
      108
);

INSERT INTO city
VALUES(
      3711,
      "Soroti",
      108
);

INSERT INTO city
VALUES(
      3712,
      "Amolatar",
      108
);

INSERT INTO city
VALUES(
      3713,
      "Apac",
      108
);

INSERT INTO city
VALUES(
      3714,
      "Mpigi",
      108
);

INSERT INTO city
VALUES(
      3715,
      "Kamuli",
      108
);

INSERT INTO city
VALUES(
      3716,
      "Iganga",
      108
);

INSERT INTO city
VALUES(
      3717,
      "Kyankwanzi",
      108
);

INSERT INTO city
VALUES(
      3718,
      "Busia",
      108
);

INSERT INTO city
VALUES(
      3719,
      "Kagadi",
      108
);

INSERT INTO city
VALUES(
      3720,
      "Mparo",
      108
);

INSERT INTO city
VALUES(
      3721,
      "Bupoto",
      108
);

INSERT INTO city
VALUES(
      3722,
      "Butebo",
      108
);

INSERT INTO city
VALUES(
      3723,
      "Kakumiro",
      108
);

INSERT INTO city
VALUES(
      3724,
      "Kibiito",
      108
);

INSERT INTO city
VALUES(
      3725,
      "Pakwach",
      108
);

INSERT INTO city
VALUES(
      3726,
      "Palenga",
      108
);

INSERT INTO city
VALUES(
      3727,
      "Rubanda",
      108
);

INSERT INTO city
VALUES(
      3728,
      "Kasaali",
      108
);

INSERT INTO city
VALUES(
      3729,
      "Dokolo",
      108
);

INSERT INTO city
VALUES(
      3730,
      "Serere",
      108
);

INSERT INTO city
VALUES(
      3731,
      "Kaberamaido",
      108
);

INSERT INTO country
VALUES(
      109,
      "Uruguay"
);

INSERT INTO city
VALUES(
      3732,
      "Trinidad",
      109
);

INSERT INTO city
VALUES(
      3733,
      "Paso de los Toros",
      109
);

INSERT INTO city
VALUES(
      3734,
      "Santa Lucia",
      109
);

INSERT INTO city
VALUES(
      3735,
      "Tranqueras",
      109
);

INSERT INTO city
VALUES(
      3736,
      "Montevideo",
      109
);

INSERT INTO city
VALUES(
      3737,
      "Vergara",
      109
);

INSERT INTO city
VALUES(
      3738,
      "Jose Batlle y Ordonez",
      109
);

INSERT INTO city
VALUES(
      3739,
      "La Paloma",
      109
);

INSERT INTO city
VALUES(
      3740,
      "Castillos",
      109
);

INSERT INTO city
VALUES(
      3741,
      "Lascano",
      109
);

INSERT INTO city
VALUES(
      3742,
      "Punta del Este",
      109
);

INSERT INTO city
VALUES(
      3743,
      "Aigua",
      109
);

INSERT INTO city
VALUES(
      3744,
      "Carmelo",
      109
);

INSERT INTO city
VALUES(
      3745,
      "Artigas",
      109
);

INSERT INTO city
VALUES(
      3746,
      "Canelones",
      109
);

INSERT INTO city
VALUES(
      3747,
      "Durazno",
      109
);

INSERT INTO city
VALUES(
      3748,
      "Florida",
      109
);

INSERT INTO city
VALUES(
      3749,
      "Fray Bentos",
      109
);

INSERT INTO city
VALUES(
      3750,
      "Maldonado",
      109
);

INSERT INTO city
VALUES(
      3751,
      "Melo",
      109
);

INSERT INTO city
VALUES(
      3752,
      "Mercedes",
      109
);

INSERT INTO city
VALUES(
      3753,
      "Minas",
      109
);

INSERT INTO city
VALUES(
      3754,
      "Paysandu",
      109
);

INSERT INTO city
VALUES(
      3755,
      "Rivera",
      109
);

INSERT INTO city
VALUES(
      3756,
      "Rocha",
      109
);

INSERT INTO city
VALUES(
      3757,
      "Salto",
      109
);

INSERT INTO city
VALUES(
      3758,
      "Tacuarembo",
      109
);

INSERT INTO city
VALUES(
      3759,
      "Treinta y Tres",
      109
);

INSERT INTO city
VALUES(
      3760,
      "Trinidad",
      109
);

INSERT INTO city
VALUES(
      3761,
      "Bella Union",
      109
);

INSERT INTO city
VALUES(
      3762,
      "Baltasar Brum",
      109
);

INSERT INTO city
VALUES(
      3763,
      "San Jose de Mayo",
      109
);

INSERT INTO city
VALUES(
      3764,
      "Colonia del Sacramento",
      109
);

INSERT INTO country
VALUES(
      110,
      "Uzbekistan"
);

INSERT INTO city
VALUES(
      3765,
      "Urgut",
      110
);

INSERT INTO city
VALUES(
      3766,
      "Qoqon",
      110
);

INSERT INTO city
VALUES(
      3767,
      "Iskandar",
      110
);

INSERT INTO city
VALUES(
      3768,
      "Shahrisabz",
      110
);

INSERT INTO city
VALUES(
      3769,
      "Olmaliq",
      110
);

INSERT INTO city
VALUES(
      3770,
      "Fargona",
      110
);

INSERT INTO city
VALUES(
      3771,
      "Chirchiq",
      110
);

INSERT INTO city
VALUES(
      3772,
      "Angren",
      110
);

INSERT INTO city
VALUES(
      3773,
      "Guliston",
      110
);

INSERT INTO city
VALUES(
      3774,
      "Qunghirot",
      110
);

INSERT INTO city
VALUES(
      3775,
      "Tashkent",
      110
);

INSERT INTO city
VALUES(
      3776,
      "Muynoq",
      110
);

INSERT INTO city
VALUES(
      3777,
      "Jizzax",
      110
);

INSERT INTO city
VALUES(
      3778,
      "Khiwa",
      110
);

INSERT INTO city
VALUES(
      3779,
      "Nukus",
      110
);

INSERT INTO city
VALUES(
      3780,
      "Kogon",
      110
);

INSERT INTO city
VALUES(
      3781,
      "Khujayli",
      110
);

INSERT INTO city
VALUES(
      3782,
      "Zarafshon",
      110
);

INSERT INTO city
VALUES(
      3783,
      "Navoi",
      110
);

INSERT INTO city
VALUES(
      3784,
      "Chimboy",
      110
);

INSERT INTO city
VALUES(
      3785,
      "Andijon",
      110
);

INSERT INTO city
VALUES(
      3786,
      "Urgentch",
      110
);

INSERT INTO city
VALUES(
      3787,
      "Namangan",
      110
);

INSERT INTO city
VALUES(
      3788,
      "Navoiy",
      110
);

INSERT INTO city
VALUES(
      3789,
      "Qarshi",
      110
);

INSERT INTO city
VALUES(
      3790,
      "Termiz",
      110
);

INSERT INTO city
VALUES(
      3791,
      "Denow",
      110
);

INSERT INTO city
VALUES(
      3792,
      "Kattaqorgon",
      110
);

INSERT INTO city
VALUES(
      3793,
      "Samarqand",
      110
);

INSERT INTO city
VALUES(
      3794,
      "Bukhara",
      110
);

INSERT INTO country
VALUES(
      111,
      "Saint Vincent And The Grenadines"
);

INSERT INTO city
VALUES(
      3795,
      "Kingstown",
      111
);

INSERT INTO country
VALUES(
      112,
      "Venezuela"
);

INSERT INTO city
VALUES(
      3796,
      "Chaguaramas",
      112
);

INSERT INTO city
VALUES(
      3797,
      "El Dorado",
      112
);

INSERT INTO city
VALUES(
      3798,
      "El Manteco",
      112
);

INSERT INTO city
VALUES(
      3799,
      "Caracas",
      112
);

INSERT INTO city
VALUES(
      3800,
      "Barcelona",
      112
);

INSERT INTO city
VALUES(
      3801,
      "Barinas",
      112
);

INSERT INTO city
VALUES(
      3802,
      "Barquisimeto",
      112
);

INSERT INTO city
VALUES(
      3803,
      "Ciudad Bolivar",
      112
);

INSERT INTO city
VALUES(
      3804,
      "Coro",
      112
);

INSERT INTO city
VALUES(
      3805,
      "Cumana",
      112
);

INSERT INTO city
VALUES(
      3806,
      "Guanare",
      112
);

INSERT INTO city
VALUES(
      3807,
      "La Guaira",
      112
);

INSERT INTO city
VALUES(
      3808,
      "Los Teques",
      112
);

INSERT INTO city
VALUES(
      3809,
      "Maracaibo",
      112
);

INSERT INTO city
VALUES(
      3810,
      "Maracay",
      112
);

INSERT INTO city
VALUES(
      3811,
      "Maturin",
      112
);

INSERT INTO city
VALUES(
      3812,
      "Merida",
      112
);

INSERT INTO city
VALUES(
      3813,
      "San Carlos",
      112
);

INSERT INTO city
VALUES(
      3814,
      "San Cristobal",
      112
);

INSERT INTO city
VALUES(
      3815,
      "San Felipe",
      112
);

INSERT INTO city
VALUES(
      3816,
      "San Fernando de Apure",
      112
);

INSERT INTO city
VALUES(
      3817,
      "San Juan De Los Morros",
      112
);

INSERT INTO city
VALUES(
      3818,
      "Trujillo",
      112
);

INSERT INTO city
VALUES(
      3819,
      "Tucupita",
      112
);

INSERT INTO city
VALUES(
      3820,
      "Valencia",
      112
);

INSERT INTO city
VALUES(
      3821,
      "Puerto Ayacucho",
      112
);

INSERT INTO city
VALUES(
      3822,
      "La Asuncion",
      112
);

INSERT INTO city
VALUES(
      3823,
      "El Tigre",
      112
);

INSERT INTO city
VALUES(
      3824,
      "Ciudad Guayana",
      112
);

INSERT INTO city
VALUES(
      3825,
      "Upata",
      112
);

INSERT INTO city
VALUES(
      3826,
      "Puerto la Cruz",
      112
);

INSERT INTO city
VALUES(
      3827,
      "Anaco",
      112
);

INSERT INTO city
VALUES(
      3828,
      "Porlamar",
      112
);

INSERT INTO city
VALUES(
      3829,
      "La Esmeralda",
      112
);

INSERT INTO city
VALUES(
      3830,
      "Guasdualito",
      112
);

INSERT INTO city
VALUES(
      3831,
      "Valle de la Pascua",
      112
);

INSERT INTO city
VALUES(
      3832,
      "Zaraza",
      112
);

INSERT INTO city
VALUES(
      3833,
      "Altagracia de Orituco",
      112
);

INSERT INTO city
VALUES(
      3834,
      "Carora",
      112
);

INSERT INTO city
VALUES(
      3835,
      "Puerto Cabello",
      112
);

INSERT INTO city
VALUES(
      3836,
      "Maiquetia",
      112
);

INSERT INTO city
VALUES(
      3837,
      "Ocumare del Tuy",
      112
);

INSERT INTO city
VALUES(
      3838,
      "Calabozo",
      112
);

INSERT INTO city
VALUES(
      3839,
      "Acarigua",
      112
);

INSERT INTO city
VALUES(
      3840,
      "Cabimas",
      112
);

INSERT INTO city
VALUES(
      3841,
      "Santa Rita",
      112
);

INSERT INTO city
VALUES(
      3842,
      "San Carlos del Zulia",
      112
);

INSERT INTO city
VALUES(
      3843,
      "Machiques",
      112
);

INSERT INTO city
VALUES(
      3844,
      "Valera",
      112
);

INSERT INTO city
VALUES(
      3845,
      "Punto Fijo",
      112
);

INSERT INTO city
VALUES(
      3846,
      "Carupano",
      112
);

INSERT INTO country
VALUES(
      113,
      "Virgin Island"
);

INSERT INTO city
VALUES(
      3847,
      "Road Town",
      113
);

INSERT INTO country
VALUES(
      114,
      "Vietnam"
);

INSERT INTO city
VALUES(
      3848,
      "Quang Tri",
      114
);

INSERT INTO city
VALUES(
      3849,
      "Thanh Hoa",
      114
);

INSERT INTO city
VALUES(
      3850,
      "Vung Tau",
      114
);

INSERT INTO city
VALUES(
      3851,
      "Play Ku",
      114
);

INSERT INTO city
VALUES(
      3852,
      "Cam Ranh",
      114
);

INSERT INTO city
VALUES(
      3853,
      "Dong Ha",
      114
);

INSERT INTO city
VALUES(
      3854,
      "Luan Chau",
      114
);

INSERT INTO city
VALUES(
      3855,
      "My Tho",
      114
);

INSERT INTO city
VALUES(
      3856,
      "Bac Giang",
      114
);

INSERT INTO city
VALUES(
      3857,
      "Bac Ninh",
      114
);

INSERT INTO city
VALUES(
      3858,
      "Quang Ngai",
      114
);

INSERT INTO city
VALUES(
      3859,
      "Long Xuyen",
      114
);

INSERT INTO city
VALUES(
      3860,
      "Bac Kan",
      114
);

INSERT INTO city
VALUES(
      3861,
      "Lao Chi",
      114
);

INSERT INTO city
VALUES(
      3862,
      "Da Nang",
      114
);

INSERT INTO city
VALUES(
      3863,
      "Vinh Yen",
      114
);

INSERT INTO city
VALUES(
      3864,
      "Kon Tum",
      114
);

INSERT INTO city
VALUES(
      3865,
      "Son Tay",
      114
);

INSERT INTO city
VALUES(
      3866,
      "Hanoi",
      114
);

INSERT INTO city
VALUES(
      3867,
      "Da Lat",
      114
);

INSERT INTO city
VALUES(
      3868,
      "Haiphong",
      114
);

INSERT INTO city
VALUES(
      3869,
      "Hung Yen",
      114
);

INSERT INTO city
VALUES(
      3870,
      "Cam Pha",
      114
);

INSERT INTO city
VALUES(
      3871,
      "Buon Me Thuot",
      114
);

INSERT INTO city
VALUES(
      3872,
      "Chau Doc",
      114
);

INSERT INTO city
VALUES(
      3873,
      "Tuy Hoa",
      114
);

INSERT INTO city
VALUES(
      3874,
      "Vinh",
      114
);

INSERT INTO city
VALUES(
      3875,
      "Yen Bai",
      114
);

INSERT INTO city
VALUES(
      3876,
      "Tam Ky",
      114
);

INSERT INTO city
VALUES(
      3877,
      "Gia Nghia",
      114
);

INSERT INTO city
VALUES(
      3878,
      "Da Nang",
      114
);

INSERT INTO city
VALUES(
      3879,
      "Ho Chi Minh City",
      114
);

INSERT INTO city
VALUES(
      3880,
      "Da Lat",
      114
);

INSERT INTO city
VALUES(
      3881,
      "Nha Trang",
      114
);

INSERT INTO city
VALUES(
      3882,
      "Cao Lanh",
      114
);

INSERT INTO city
VALUES(
      3883,
      "Dong Hoi",
      114
);

INSERT INTO city
VALUES(
      3884,
      "Vinh Long",
      114
);

INSERT INTO city
VALUES(
      3885,
      "Truc Giang",
      114
);

INSERT INTO city
VALUES(
      3886,
      "Rach Gia",
      114
);

INSERT INTO city
VALUES(
      3887,
      "Soc Trang",
      114
);

INSERT INTO city
VALUES(
      3888,
      "Can Tho",
      114
);

INSERT INTO city
VALUES(
      3889,
      "Dong Xoai",
      114
);

INSERT INTO city
VALUES(
      3890,
      "Hon Quan",
      114
);

INSERT INTO city
VALUES(
      3891,
      "Hue",
      114
);

INSERT INTO city
VALUES(
      3892,
      "Vi Thanh",
      114
);

INSERT INTO city
VALUES(
      3893,
      "Viet Tri",
      114
);

INSERT INTO city
VALUES(
      3894,
      "Bien Hoa",
      114
);

INSERT INTO city
VALUES(
      3895,
      "Ha Tinh",
      114
);

INSERT INTO city
VALUES(
      3896,
      "Kon Tum",
      114
);

INSERT INTO city
VALUES(
      3897,
      "Phan Rang",
      114
);

INSERT INTO city
VALUES(
      3898,
      "Phan Thiet",
      114
);

INSERT INTO city
VALUES(
      3899,
      "Tan An",
      114
);

INSERT INTO city
VALUES(
      3900,
      "Ca Mau",
      114
);

INSERT INTO city
VALUES(
      3901,
      "Tra Vinh",
      114
);

INSERT INTO city
VALUES(
      3902,
      "Qui Nhon",
      114
);

INSERT INTO city
VALUES(
      3903,
      "Thu Dau Mot",
      114
);

INSERT INTO city
VALUES(
      3904,
      "Tay Ninh",
      114
);

INSERT INTO city
VALUES(
      3905,
      "Lai Chau",
      114
);

INSERT INTO city
VALUES(
      3906,
      "Dien Bien Phu",
      114
);

INSERT INTO city
VALUES(
      3907,
      "Thai Nguyen",
      114
);

INSERT INTO city
VALUES(
      3908,
      "Thai Binh",
      114
);

INSERT INTO city
VALUES(
      3909,
      "Son La",
      114
);

INSERT INTO city
VALUES(
      3910,
      "Phu Ly",
      114
);

INSERT INTO city
VALUES(
      3911,
      "Ninh Binh",
      114
);

INSERT INTO city
VALUES(
      3912,
      "Nam Dinh",
      114
);

INSERT INTO city
VALUES(
      3913,
      "Lang Son",
      114
);

INSERT INTO city
VALUES(
      3914,
      "Hoa Binh",
      114
);

INSERT INTO city
VALUES(
      3915,
      "Hong Gai",
      114
);

INSERT INTO city
VALUES(
      3916,
      "Hai Duong",
      114
);

INSERT INTO city
VALUES(
      3917,
      "Ha Giang",
      114
);

INSERT INTO city
VALUES(
      3918,
      "Cao Bang",
      114
);

INSERT INTO city
VALUES(
      3919,
      "Bac Lieu",
      114
);

INSERT INTO city
VALUES(
      3920,
      "Ba Ria",
      114
);

INSERT INTO city
VALUES(
      3921,
      "Tuyen Quang",
      114
);

INSERT INTO country
VALUES(
      115,
      "Vanuatu"
);

INSERT INTO city
VALUES(
      3922,
      "Port Vila",
      115
);

INSERT INTO city
VALUES(
      3923,
      "Isangel",
      115
);

INSERT INTO city
VALUES(
      3924,
      "Luganville",
      115
);

INSERT INTO city
VALUES(
      3925,
      "Lakatoro",
      115
);

INSERT INTO city
VALUES(
      3926,
      "Saratamata",
      115
);

INSERT INTO city
VALUES(
      3927,
      "Sola",
      115
);

INSERT INTO country
VALUES(
      116,
      "Wallis And Futuna"
);

INSERT INTO city
VALUES(
      3928,
      "Leava",
      116
);

INSERT INTO city
VALUES(
      3929,
      "Mata-Utu",
      116
);

INSERT INTO country
VALUES(
      117,
      "Samoa"
);

INSERT INTO city
VALUES(
      3930,
      "Apia",
      117
);

INSERT INTO city
VALUES(
      3931,
      "Afega",
      117
);

INSERT INTO city
VALUES(
      3932,
      "Asau",
      117
);

INSERT INTO city
VALUES(
      3933,
      "Leulumoega",
      117
);

INSERT INTO city
VALUES(
      3934,
      "Safotu",
      117
);

INSERT INTO city
VALUES(
      3935,
      "Safotulafai",
      117
);

INSERT INTO city
VALUES(
      3936,
      "Lufilufi",
      117
);

INSERT INTO city
VALUES(
      3937,
      "Mulifanua",
      117
);

INSERT INTO city
VALUES(
      3938,
      "Saleaula",
      117
);

INSERT INTO city
VALUES(
      3939,
      "Samamea",
      117
);

INSERT INTO city
VALUES(
      3940,
      "Satupa`itea",
      117
);

INSERT INTO city
VALUES(
      3941,
      "Vailoa",
      117
);

INSERT INTO country
VALUES(
      118,
      "Andorra"
);

INSERT INTO city
VALUES(
      3942,
      "Ordino",
      118
);

INSERT INTO city
VALUES(
      3943,
      "La Massana",
      118
);

INSERT INTO city
VALUES(
      3944,
      "Canillo",
      118
);

INSERT INTO city
VALUES(
      3945,
      "Andorra",
      118
);

INSERT INTO city
VALUES(
      3946,
      "Encamp",
      118
);

INSERT INTO city
VALUES(
      3947,
      "Sant Julia de Loria",
      118
);

INSERT INTO city
VALUES(
      3948,
      "Escaldes-Engordany",
      118
);

INSERT INTO country
VALUES(
      119,
      "United Arab Emirates"
);

INSERT INTO city
VALUES(
      3949,
      "Al Fujayrah",
      119
);

INSERT INTO city
VALUES(
      3950,
      "Dubai",
      119
);

INSERT INTO city
VALUES(
      3951,
      "Ras al Khaymah",
      119
);

INSERT INTO city
VALUES(
      3952,
      "Umm al Qaywayn",
      119
);

INSERT INTO city
VALUES(
      3953,
      "Abu Dhabi",
      119
);

INSERT INTO city
VALUES(
      3954,
      "`Ajman",
      119
);

INSERT INTO city
VALUES(
      3955,
      "Sharjah",
      119
);

INSERT INTO city
VALUES(
      3956,
      "Al Ayn",
      119
);

INSERT INTO country
VALUES(
      120,
      "Afghanistan"
);

INSERT INTO city
VALUES(
      3957,
      "Kabul",
      120
);

INSERT INTO city
VALUES(
      3958,
      "Sharan",
      120
);

INSERT INTO city
VALUES(
      3959,
      "Zaranj",
      120
);

INSERT INTO city
VALUES(
      3960,
      "Lashkar Gah",
      120
);

INSERT INTO city
VALUES(
      3961,
      "Kandahar",
      120
);

INSERT INTO city
VALUES(
      3962,
      "Tarin Kowt",
      120
);

INSERT INTO city
VALUES(
      3963,
      "Herat",
      120
);

INSERT INTO city
VALUES(
      3964,
      "Ghazni",
      120
);

INSERT INTO city
VALUES(
      3965,
      "Maidan Shahr",
      120
);

INSERT INTO city
VALUES(
      3966,
      "Andkhvoy",
      120
);

INSERT INTO city
VALUES(
      3967,
      "Pol-e Khomri",
      120
);

INSERT INTO city
VALUES(
      3968,
      "Mazar-e Sharif",
      120
);

INSERT INTO city
VALUES(
      3969,
      "Sar-e Pul",
      120
);

INSERT INTO city
VALUES(
      3970,
      "Meymaneh",
      120
);

INSERT INTO city
VALUES(
      3971,
      "Gardiz",
      120
);

INSERT INTO city
VALUES(
      3972,
      "Asadabad",
      120
);

INSERT INTO city
VALUES(
      3973,
      "Jalalabad",
      120
);

INSERT INTO city
VALUES(
      3974,
      "Zareh Sharan",
      120
);

INSERT INTO city
VALUES(
      3975,
      "Mehtar Lam",
      120
);

INSERT INTO city
VALUES(
      3976,
      "Aybak",
      120
);

INSERT INTO city
VALUES(
      3977,
      "Sheberghan",
      120
);

INSERT INTO city
VALUES(
      3978,
      "Khost",
      120
);

INSERT INTO city
VALUES(
      3979,
      "Farah",
      120
);

INSERT INTO city
VALUES(
      3980,
      "Mahmud-E Eraqi",
      120
);

INSERT INTO city
VALUES(
      3981,
      "Qala i Naw",
      120
);

INSERT INTO city
VALUES(
      3982,
      "Feyzabad",
      120
);

INSERT INTO city
VALUES(
      3983,
      "Charikar",
      120
);

INSERT INTO city
VALUES(
      3984,
      "Nili",
      120
);

INSERT INTO city
VALUES(
      3985,
      "Bazarak",
      120
);

INSERT INTO city
VALUES(
      3986,
      "Kondoz",
      120
);

INSERT INTO city
VALUES(
      3987,
      "Qalat",
      120
);

INSERT INTO city
VALUES(
      3988,
      "Taloqan",
      120
);

INSERT INTO city
VALUES(
      3989,
      "Mayda Shahr",
      120
);

INSERT INTO city
VALUES(
      3990,
      "Balkh",
      120
);

INSERT INTO city
VALUES(
      3991,
      "Baghlan",
      120
);

INSERT INTO city
VALUES(
      3992,
      "Bamian",
      120
);

INSERT INTO city
VALUES(
      3993,
      "Karokh",
      120
);

INSERT INTO city
VALUES(
      3994,
      "Baraki Barak",
      120
);

INSERT INTO city
VALUES(
      3995,
      "Pul-e `Alam",
      120
);

INSERT INTO city
VALUES(
      3996,
      "Parun",
      120
);

INSERT INTO city
VALUES(
      3997,
      "Chaghcharan",
      120
);

INSERT INTO country
VALUES(
      121,
      "Antigua And Barbuda"
);

INSERT INTO city
VALUES(
      3998,
      "Saint Johnas",
      121
);

INSERT INTO country
VALUES(
      122,
      "Anguilla"
);

INSERT INTO city
VALUES(
      3999,
      "The Valley",
      122
);

INSERT INTO country
VALUES(
      123,
      "Albania"
);

INSERT INTO city
VALUES(
      4000,
      "Berat",
      123
);

INSERT INTO city
VALUES(
      4001,
      "Korce",
      123
);

INSERT INTO city
VALUES(
      4002,
      "Librazhd",
      123
);

INSERT INTO city
VALUES(
      4003,
      "Gjirokaster",
      123
);

INSERT INTO city
VALUES(
      4004,
      "Puke",
      123
);

INSERT INTO city
VALUES(
      4005,
      "Kruje",
      123
);

INSERT INTO city
VALUES(
      4006,
      "Tepelene",
      123
);

INSERT INTO city
VALUES(
      4007,
      "Rreshen",
      123
);

INSERT INTO city
VALUES(
      4008,
      "Corovode",
      123
);

INSERT INTO city
VALUES(
      4009,
      "Shkoder",
      123
);

INSERT INTO city
VALUES(
      4010,
      "Lushnje",
      123
);

INSERT INTO city
VALUES(
      4011,
      "Erseke",
      123
);

INSERT INTO city
VALUES(
      4012,
      "Bajram Curri",
      123
);

INSERT INTO city
VALUES(
      4013,
      "Durres",
      123
);

INSERT INTO city
VALUES(
      4014,
      "Burrel",
      123
);

INSERT INTO city
VALUES(
      4015,
      "Kukes",
      123
);

INSERT INTO city
VALUES(
      4016,
      "Gramsh",
      123
);

INSERT INTO city
VALUES(
      4017,
      "Lezhe",
      123
);

INSERT INTO city
VALUES(
      4018,
      "Sarande",
      123
);

INSERT INTO city
VALUES(
      4019,
      "Permet",
      123
);

INSERT INTO city
VALUES(
      4020,
      "Pogradec",
      123
);

INSERT INTO city
VALUES(
      4021,
      "Elbasan",
      123
);

INSERT INTO city
VALUES(
      4022,
      "Peshkopi",
      123
);

INSERT INTO city
VALUES(
      4023,
      "Fier",
      123
);

INSERT INTO city
VALUES(
      4024,
      "Tirana",
      123
);

INSERT INTO city
VALUES(
      4025,
      "Vlore",
      123
);

INSERT INTO country
VALUES(
      124,
      "Armenia"
);

INSERT INTO city
VALUES(
      4026,
      "Yerevan",
      124
);

INSERT INTO city
VALUES(
      4027,
      "Gyumri",
      124
);

INSERT INTO city
VALUES(
      4028,
      "Gavarr",
      124
);

INSERT INTO city
VALUES(
      4029,
      "Artashat",
      124
);

INSERT INTO city
VALUES(
      4030,
      "Yeghegnadzor",
      124
);

INSERT INTO city
VALUES(
      4031,
      "Armavir",
      124
);

INSERT INTO city
VALUES(
      4032,
      "Ijevan",
      124
);

INSERT INTO city
VALUES(
      4033,
      "Hrazdan",
      124
);

INSERT INTO city
VALUES(
      4034,
      "Vanadzor",
      124
);

INSERT INTO city
VALUES(
      4035,
      "Ashtarak",
      124
);

INSERT INTO city
VALUES(
      4036,
      "Kapan",
      124
);

INSERT INTO city
VALUES(
      4037,
      "Ijevan",
      124
);

INSERT INTO country
VALUES(
      125,
      "Angola"
);

INSERT INTO city
VALUES(
      4038,
      "Luiana",
      125
);

INSERT INTO city
VALUES(
      4039,
      "Mavinga",
      125
);

INSERT INTO city
VALUES(
      4040,
      "Benguela",
      125
);

INSERT INTO city
VALUES(
      4041,
      "Cangamba",
      125
);

INSERT INTO city
VALUES(
      4042,
      "Cabinda",
      125
);

INSERT INTO city
VALUES(
      4043,
      "Xangongo",
      125
);

INSERT INTO city
VALUES(
      4044,
      "Lubango",
      125
);

INSERT INTO city
VALUES(
      4045,
      "Huambo",
      125
);

INSERT INTO city
VALUES(
      4046,
      "Chitado",
      125
);

INSERT INTO city
VALUES(
      4047,
      "Luena",
      125
);

INSERT INTO city
VALUES(
      4048,
      "Mucusso",
      125
);

INSERT INTO city
VALUES(
      4049,
      "Ndalatando",
      125
);

INSERT INTO city
VALUES(
      4050,
      "Ondjiva",
      125
);

INSERT INTO city
VALUES(
      4051,
      "Mbanza-Congo",
      125
);

INSERT INTO city
VALUES(
      4052,
      "Nzeto",
      125
);

INSERT INTO city
VALUES(
      4053,
      "Capenda-Camulemba",
      125
);

INSERT INTO city
VALUES(
      4054,
      "Calulo",
      125
);

INSERT INTO city
VALUES(
      4055,
      "Calucinga",
      125
);

INSERT INTO city
VALUES(
      4056,
      "Lubango",
      125
);

INSERT INTO city
VALUES(
      4057,
      "Songo",
      125
);

INSERT INTO city
VALUES(
      4058,
      "Camabatela",
      125
);

INSERT INTO city
VALUES(
      4059,
      "Cacolo",
      125
);

INSERT INTO city
VALUES(
      4060,
      "Ambriz",
      125
);

INSERT INTO city
VALUES(
      4061,
      "Dondo",
      125
);

INSERT INTO city
VALUES(
      4062,
      "Saurimo",
      125
);

INSERT INTO city
VALUES(
      4063,
      "Luanda",
      125
);

INSERT INTO city
VALUES(
      4064,
      "Waku Kungo",
      125
);

INSERT INTO city
VALUES(
      4065,
      "Muconda",
      125
);

INSERT INTO city
VALUES(
      4066,
      "Quipungo",
      125
);

INSERT INTO city
VALUES(
      4067,
      "Uige",
      125
);

INSERT INTO city
VALUES(
      4068,
      "Quibala",
      125
);

INSERT INTO city
VALUES(
      4069,
      "Menongue",
      125
);

INSERT INTO city
VALUES(
      4070,
      "Sumbe",
      125
);

INSERT INTO city
VALUES(
      4071,
      "Luau",
      125
);

INSERT INTO city
VALUES(
      4072,
      "Caxito",
      125
);

INSERT INTO city
VALUES(
      4073,
      "Cazombo",
      125
);

INSERT INTO city
VALUES(
      4074,
      "Malanje",
      125
);

INSERT INTO city
VALUES(
      4075,
      "Lobito",
      125
);

INSERT INTO city
VALUES(
      4076,
      "Soyo",
      125
);

INSERT INTO city
VALUES(
      4077,
      "Kuito",
      125
);

INSERT INTO city
VALUES(
      4078,
      "Cuito Caunavale",
      125
);

INSERT INTO city
VALUES(
      4079,
      "Chibemba",
      125
);

INSERT INTO city
VALUES(
      4080,
      "Chibia",
      125
);

INSERT INTO city
VALUES(
      4081,
      "Camacupa",
      125
);

INSERT INTO city
VALUES(
      4082,
      "Cubal",
      125
);

INSERT INTO city
VALUES(
      4083,
      "Namibe",
      125
);

INSERT INTO city
VALUES(
      4084,
      "Tombua",
      125
);

INSERT INTO city
VALUES(
      4085,
      "Lucapa",
      125
);

INSERT INTO city
VALUES(
      4086,
      "Dundo",
      125
);

INSERT INTO country
VALUES(
      126,
      "Argentina"
);

INSERT INTO city
VALUES(
      4087,
      "San Juan",
      126
);

INSERT INTO city
VALUES(
      4088,
      "Los Blancos",
      126
);

INSERT INTO city
VALUES(
      4089,
      "General Roca",
      126
);

INSERT INTO city
VALUES(
      4090,
      "Ushuaia",
      126
);

INSERT INTO city
VALUES(
      4091,
      "Santa Rosa",
      126
);

INSERT INTO city
VALUES(
      4092,
      "28 de Noviembre",
      126
);

INSERT INTO city
VALUES(
      4093,
      "Comondante Luis Piedrabuena",
      126
);

INSERT INTO city
VALUES(
      4094,
      "Rio Gallegos",
      126
);

INSERT INTO city
VALUES(
      4095,
      "Santa Fe",
      126
);

INSERT INTO city
VALUES(
      4096,
      "Parana",
      126
);

INSERT INTO city
VALUES(
      4097,
      "San Lorenzo",
      126
);

INSERT INTO city
VALUES(
      4098,
      "Salta",
      126
);

INSERT INTO city
VALUES(
      4099,
      "Darregueira",
      126
);

INSERT INTO city
VALUES(
      4100,
      "Trelew",
      126
);

INSERT INTO city
VALUES(
      4101,
      "Rawson",
      126
);

INSERT INTO city
VALUES(
      4102,
      "La Rioja",
      126
);

INSERT INTO city
VALUES(
      4103,
      "Villalonga",
      126
);

INSERT INTO city
VALUES(
      4104,
      "Viedma",
      126
);

INSERT INTO city
VALUES(
      4105,
      "Sunchales",
      126
);

INSERT INTO city
VALUES(
      4106,
      "Rio Colorado",
      126
);

INSERT INTO city
VALUES(
      4107,
      "Pedro Luro",
      126
);

INSERT INTO city
VALUES(
      4108,
      "San Salvador de Jujuy",
      126
);

INSERT INTO city
VALUES(
      4109,
      "Resistencia",
      126
);

INSERT INTO city
VALUES(
      4110,
      "Posadas",
      126
);

INSERT INTO city
VALUES(
      4111,
      "Paso Rio Mayo",
      126
);

INSERT INTO city
VALUES(
      4112,
      "Venado Tuerto",
      126
);

INSERT INTO city
VALUES(
      4113,
      "Corrientes",
      126
);

INSERT INTO city
VALUES(
      4114,
      "Formosa",
      126
);

INSERT INTO city
VALUES(
      4115,
      "Las Lomitas",
      126
);

INSERT INTO city
VALUES(
      4116,
      "La Plata",
      126
);

INSERT INTO city
VALUES(
      4117,
      "Mar de Ajo",
      126
);

INSERT INTO city
VALUES(
      4118,
      "Cutral Co",
      126
);

INSERT INTO city
VALUES(
      4119,
      "Ingeniero Jacobacci",
      126
);

INSERT INTO city
VALUES(
      4120,
      "Santiago del Estero",
      126
);

INSERT INTO city
VALUES(
      4121,
      "Uspallata",
      126
);

INSERT INTO city
VALUES(
      4122,
      "Tucuman",
      126
);

INSERT INTO city
VALUES(
      4123,
      "Comallo",
      126
);

INSERT INTO city
VALUES(
      4124,
      "El Maiten",
      126
);

INSERT INTO city
VALUES(
      4125,
      "Mendoza",
      126
);

INSERT INTO city
VALUES(
      4126,
      "Neuquen",
      126
);

INSERT INTO city
VALUES(
      4127,
      "Cordoba",
      126
);

INSERT INTO city
VALUES(
      4128,
      "Catamarca",
      126
);

INSERT INTO city
VALUES(
      4129,
      "Villa Rumipal",
      126
);

INSERT INTO city
VALUES(
      4130,
      "San Luis",
      126
);

INSERT INTO city
VALUES(
      4131,
      "Rio Tercero",
      126
);

INSERT INTO city
VALUES(
      4132,
      "Malargue",
      126
);

INSERT INTO city
VALUES(
      4133,
      "Tinogasta",
      126
);

INSERT INTO city
VALUES(
      4134,
      "Rinconada",
      126
);

INSERT INTO city
VALUES(
      4135,
      "Abra Pampa",
      126
);

INSERT INTO city
VALUES(
      4136,
      "Humahuaca",
      126
);

INSERT INTO city
VALUES(
      4137,
      "Libertador General San Martin",
      126
);

INSERT INTO city
VALUES(
      4138,
      "San Pedro",
      126
);

INSERT INTO city
VALUES(
      4139,
      "Susques",
      126
);

INSERT INTO city
VALUES(
      4140,
      "Choele Choel",
      126
);

INSERT INTO city
VALUES(
      4141,
      "General Conesa",
      126
);

INSERT INTO city
VALUES(
      4142,
      "San Antonio Oeste",
      126
);

INSERT INTO city
VALUES(
      4143,
      "Sierra Colorado",
      126
);

INSERT INTO city
VALUES(
      4144,
      "San Carlos de Bariloche",
      126
);

INSERT INTO city
VALUES(
      4145,
      "Puerto Madryn",
      126
);

INSERT INTO city
VALUES(
      4146,
      "Telsen",
      126
);

INSERT INTO city
VALUES(
      4147,
      "Sarmiento",
      126
);

INSERT INTO city
VALUES(
      4148,
      "Alto Rio Sanguer",
      126
);

INSERT INTO city
VALUES(
      4149,
      "Gastre",
      126
);

INSERT INTO city
VALUES(
      4150,
      "Pampa del Infierno",
      126
);

INSERT INTO city
VALUES(
      4151,
      "Charata",
      126
);

INSERT INTO city
VALUES(
      4152,
      "Presidencia Roque Saenz Pena",
      126
);

INSERT INTO city
VALUES(
      4153,
      "Rodeo",
      126
);

INSERT INTO city
VALUES(
      4154,
      "Mercedes",
      126
);

INSERT INTO city
VALUES(
      4155,
      "Villa Maria",
      126
);

INSERT INTO city
VALUES(
      4156,
      "Las Heras",
      126
);

INSERT INTO city
VALUES(
      4157,
      "Chilecito",
      126
);

INSERT INTO city
VALUES(
      4158,
      "Ingeniero Guillermo N. Juarez",
      126
);

INSERT INTO city
VALUES(
      4159,
      "Comandante Fontana",
      126
);

INSERT INTO city
VALUES(
      4160,
      "Belen",
      126
);

INSERT INTO city
VALUES(
      4161,
      "Chumbicha",
      126
);

INSERT INTO city
VALUES(
      4162,
      "Rio Grande",
      126
);

INSERT INTO city
VALUES(
      4163,
      "Puerto Deseado",
      126
);

INSERT INTO city
VALUES(
      4164,
      "Perito Moreno",
      126
);

INSERT INTO city
VALUES(
      4165,
      "Puerto San Julian",
      126
);

INSERT INTO city
VALUES(
      4166,
      "Gobernador Gregores",
      126
);

INSERT INTO city
VALUES(
      4167,
      "San Martin",
      126
);

INSERT INTO city
VALUES(
      4168,
      "La Paz",
      126
);

INSERT INTO city
VALUES(
      4169,
      "Tunuyan",
      126
);

INSERT INTO city
VALUES(
      4170,
      "San Rafael",
      126
);

INSERT INTO city
VALUES(
      4171,
      "General Pico",
      126
);

INSERT INTO city
VALUES(
      4172,
      "25 de Mayo",
      126
);

INSERT INTO city
VALUES(
      4173,
      "Victorica",
      126
);

INSERT INTO city
VALUES(
      4174,
      "Juan Jose Castelli",
      126
);

INSERT INTO city
VALUES(
      4175,
      "Victoria",
      126
);

INSERT INTO city
VALUES(
      4176,
      "Eldorado",
      126
);

INSERT INTO city
VALUES(
      4177,
      "Trancas",
      126
);

INSERT INTO city
VALUES(
      4178,
      "Chepes",
      126
);

INSERT INTO city
VALUES(
      4179,
      "Chamical",
      126
);

INSERT INTO city
VALUES(
      4180,
      "San Francisco",
      126
);

INSERT INTO city
VALUES(
      4181,
      "Concordia",
      126
);

INSERT INTO city
VALUES(
      4182,
      "El Calafate",
      126
);

INSERT INTO city
VALUES(
      4183,
      "Chos Malal",
      126
);

INSERT INTO city
VALUES(
      4184,
      "Las Lajas",
      126
);

INSERT INTO city
VALUES(
      4185,
      "Zapala",
      126
);

INSERT INTO city
VALUES(
      4186,
      "Villa Carlos Paz",
      126
);

INSERT INTO city
VALUES(
      4187,
      "Bell Ville",
      126
);

INSERT INTO city
VALUES(
      4188,
      "Rio Cuarto",
      126
);

INSERT INTO city
VALUES(
      4189,
      "Villa Angela",
      126
);

INSERT INTO city
VALUES(
      4190,
      "Concepcion del Uruguay",
      126
);

INSERT INTO city
VALUES(
      4191,
      "Gualeguaychu",
      126
);

INSERT INTO city
VALUES(
      4192,
      "Gualeguay",
      126
);

INSERT INTO city
VALUES(
      4193,
      "Comodoro Rivadavia",
      126
);

INSERT INTO city
VALUES(
      4194,
      "Esquel",
      126
);

INSERT INTO city
VALUES(
      4195,
      "Anatuya",
      126
);

INSERT INTO city
VALUES(
      4196,
      "Dolores",
      126
);

INSERT INTO city
VALUES(
      4197,
      "Chascomus",
      126
);

INSERT INTO city
VALUES(
      4198,
      "Chivilcoy",
      126
);

INSERT INTO city
VALUES(
      4199,
      "Lincoln",
      126
);

INSERT INTO city
VALUES(
      4200,
      "Goya",
      126
);

INSERT INTO city
VALUES(
      4201,
      "Frias",
      126
);

INSERT INTO city
VALUES(
      4202,
      "Vera",
      126
);

INSERT INTO city
VALUES(
      4203,
      "Reconquista",
      126
);

INSERT INTO city
VALUES(
      4204,
      "Monte Quemado",
      126
);

INSERT INTO city
VALUES(
      4205,
      "Campana",
      126
);

INSERT INTO city
VALUES(
      4206,
      "Zarate",
      126
);

INSERT INTO city
VALUES(
      4207,
      "Lujan",
      126
);

INSERT INTO city
VALUES(
      4208,
      "Mercedes",
      126
);

INSERT INTO city
VALUES(
      4209,
      "San Nicolas",
      126
);

INSERT INTO city
VALUES(
      4210,
      "Pergamino",
      126
);

INSERT INTO city
VALUES(
      4211,
      "Chacabuco",
      126
);

INSERT INTO city
VALUES(
      4212,
      "Junin",
      126
);

INSERT INTO city
VALUES(
      4213,
      "San Ramon de la Nueva Oran",
      126
);

INSERT INTO city
VALUES(
      4214,
      "Tartagal",
      126
);

INSERT INTO city
VALUES(
      4215,
      "Joaquin V. Gonzalez",
      126
);

INSERT INTO city
VALUES(
      4216,
      "General Guemes",
      126
);

INSERT INTO city
VALUES(
      4217,
      "Cerrillos",
      126
);

INSERT INTO city
VALUES(
      4218,
      "Cafayate",
      126
);

INSERT INTO city
VALUES(
      4219,
      "San Antonio de los Cobres",
      126
);

INSERT INTO city
VALUES(
      4220,
      "Alta Gracia",
      126
);

INSERT INTO city
VALUES(
      4221,
      "Azul",
      126
);

INSERT INTO city
VALUES(
      4222,
      "Lobos",
      126
);

INSERT INTO city
VALUES(
      4223,
      "Veinticinco de Mayo",
      126
);

INSERT INTO city
VALUES(
      4224,
      "Nueve de Julio",
      126
);

INSERT INTO city
VALUES(
      4225,
      "Mercedes",
      126
);

INSERT INTO city
VALUES(
      4226,
      "Mar del Plata",
      126
);

INSERT INTO city
VALUES(
      4227,
      "Balcarce",
      126
);

INSERT INTO city
VALUES(
      4228,
      "Juarez",
      126
);

INSERT INTO city
VALUES(
      4229,
      "Coronel Suarez",
      126
);

INSERT INTO city
VALUES(
      4230,
      "Tandil",
      126
);

INSERT INTO city
VALUES(
      4231,
      "Carhue",
      126
);

INSERT INTO city
VALUES(
      4232,
      "Olavarria",
      126
);

INSERT INTO city
VALUES(
      4233,
      "Rafaela",
      126
);

INSERT INTO city
VALUES(
      4234,
      "San Justo",
      126
);

INSERT INTO city
VALUES(
      4235,
      "Rosario",
      126
);

INSERT INTO city
VALUES(
      4236,
      "Villa Constitucion",
      126
);

INSERT INTO city
VALUES(
      4237,
      "Bahia Blanca",
      126
);

INSERT INTO city
VALUES(
      4238,
      "Punta Alta",
      126
);

INSERT INTO city
VALUES(
      4239,
      "Tres Arroyos",
      126
);

INSERT INTO city
VALUES(
      4240,
      "Necochea",
      126
);

INSERT INTO city
VALUES(
      4241,
      "Buenos Aires",
      126
);

INSERT INTO country
VALUES(
      127,
      "Austria"
);

INSERT INTO city
VALUES(
      4242,
      "Eisenstadt",
      127
);

INSERT INTO city
VALUES(
      4243,
      "Innsbruck",
      127
);

INSERT INTO city
VALUES(
      4244,
      "Bregenz",
      127
);

INSERT INTO city
VALUES(
      4245,
      "Salzburg",
      127
);

INSERT INTO city
VALUES(
      4246,
      "Linz",
      127
);

INSERT INTO city
VALUES(
      4247,
      "Wiener Neustadt",
      127
);

INSERT INTO city
VALUES(
      4248,
      "Sankt Polten",
      127
);

INSERT INTO city
VALUES(
      4249,
      "Graz",
      127
);

INSERT INTO city
VALUES(
      4250,
      "Klagenfurt",
      127
);

INSERT INTO city
VALUES(
      4251,
      "Vienna",
      127
);

INSERT INTO country
VALUES(
      128,
      "Australia"
);

INSERT INTO city
VALUES(
      4252,
      "Kingoonya",
      128
);

INSERT INTO city
VALUES(
      4253,
      "Port Denison",
      128
);

INSERT INTO city
VALUES(
      4254,
      "Cairns",
      128
);

INSERT INTO city
VALUES(
      4255,
      "Kwinana",
      128
);

INSERT INTO city
VALUES(
      4256,
      "Cranbourne",
      128
);

INSERT INTO city
VALUES(
      4257,
      "Port Hedland",
      128
);

INSERT INTO city
VALUES(
      4258,
      "Port Lincoln",
      128
);

INSERT INTO city
VALUES(
      4259,
      "Port Macquarie",
      128
);

INSERT INTO city
VALUES(
      4260,
      "Port Pirie",
      128
);

INSERT INTO city
VALUES(
      4261,
      "Portland",
      128
);

INSERT INTO city
VALUES(
      4262,
      "Proserpine",
      128
);

INSERT INTO city
VALUES(
      4263,
      "Busselton",
      128
);

INSERT INTO city
VALUES(
      4264,
      "Caboolture",
      128
);

INSERT INTO city
VALUES(
      4265,
      "Cooma",
      128
);

INSERT INTO city
VALUES(
      4266,
      "Streaky Bay",
      128
);

INSERT INTO city
VALUES(
      4267,
      "Sunbury",
      128
);

INSERT INTO city
VALUES(
      4268,
      "Sydney",
      128
);

INSERT INTO city
VALUES(
      4269,
      "Karumba",
      128
);

INSERT INTO city
VALUES(
      4270,
      "Esperance",
      128
);

INSERT INTO city
VALUES(
      4271,
      "Exmouth",
      128
);

INSERT INTO city
VALUES(
      4272,
      "Forbes",
      128
);

INSERT INTO city
VALUES(
      4273,
      "Morawa",
      128
);

INSERT INTO city
VALUES(
      4274,
      "Moree",
      128
);

INSERT INTO city
VALUES(
      4275,
      "Katherine",
      128
);

INSERT INTO city
VALUES(
      4276,
      "Katoomba",
      128
);

INSERT INTO city
VALUES(
      4277,
      "Launceston",
      128
);

INSERT INTO city
VALUES(
      4278,
      "Laverton",
      128
);

INSERT INTO city
VALUES(
      4279,
      "Leeton",
      128
);

INSERT INTO city
VALUES(
      4280,
      "Leonara",
      128
);

INSERT INTO city
VALUES(
      4281,
      "Seymour",
      128
);

INSERT INTO city
VALUES(
      4282,
      "Singleton",
      128
);

INSERT INTO city
VALUES(
      4283,
      "Newcastle",
      128
);

INSERT INTO city
VALUES(
      4284,
      "Norseman",
      128
);

INSERT INTO city
VALUES(
      4285,
      "Batemans Bay",
      128
);

INSERT INTO city
VALUES(
      4286,
      "Bathurst",
      128
);

INSERT INTO city
VALUES(
      4287,
      "Griffith",
      128
);

INSERT INTO city
VALUES(
      4288,
      "Whyalla",
      128
);

INSERT INTO city
VALUES(
      4289,
      "Wilcannia",
      128
);

INSERT INTO city
VALUES(
      4290,
      "Katanning",
      128
);

INSERT INTO city
VALUES(
      4291,
      "Bongaree",
      128
);

INSERT INTO city
VALUES(
      4292,
      "Bordertown",
      128
);

INSERT INTO city
VALUES(
      4293,
      "Boulia",
      128
);

INSERT INTO city
VALUES(
      4294,
      "Bourke",
      128
);

INSERT INTO city
VALUES(
      4295,
      "Mackay",
      128
);

INSERT INTO city
VALUES(
      4296,
      "Southern Cross",
      128
);

INSERT INTO city
VALUES(
      4297,
      "Ulladulla",
      128
);

INSERT INTO city
VALUES(
      4298,
      "Victor Harbor",
      128
);

INSERT INTO city
VALUES(
      4299,
      "Andamooka",
      128
);

INSERT INTO city
VALUES(
      4300,
      "Hervey Bay",
      128
);

INSERT INTO city
VALUES(
      4301,
      "Gunnedah",
      128
);

INSERT INTO city
VALUES(
      4302,
      "Gympie",
      128
);

INSERT INTO city
VALUES(
      4303,
      "Halls Creek",
      128
);

INSERT INTO city
VALUES(
      4304,
      "Hamilton",
      128
);

INSERT INTO city
VALUES(
      4305,
      "Winton",
      128
);

INSERT INTO city
VALUES(
      4306,
      "Mudgee",
      128
);

INSERT INTO city
VALUES(
      4307,
      "Ivanhoe",
      128
);

INSERT INTO city
VALUES(
      4308,
      "Pannawonica",
      128
);

INSERT INTO city
VALUES(
      4309,
      "Dubbo",
      128
);

INSERT INTO city
VALUES(
      4310,
      "Tom Price",
      128
);

INSERT INTO city
VALUES(
      4311,
      "Parkes",
      128
);

INSERT INTO city
VALUES(
      4312,
      "Sale",
      128
);

INSERT INTO city
VALUES(
      4313,
      "Bendigo",
      128
);

INSERT INTO city
VALUES(
      4314,
      "Berri",
      128
);

INSERT INTO city
VALUES(
      4315,
      "Adelaide",
      128
);

INSERT INTO city
VALUES(
      4316,
      "Adelaide River",
      128
);

INSERT INTO city
VALUES(
      4317,
      "Albany",
      128
);

INSERT INTO city
VALUES(
      4318,
      "Burketown",
      128
);

INSERT INTO city
VALUES(
      4319,
      "Burnie",
      128
);

INSERT INTO city
VALUES(
      4320,
      "Penola",
      128
);

INSERT INTO city
VALUES(
      4321,
      "Perth",
      128
);

INSERT INTO city
VALUES(
      4322,
      "Peterborough",
      128
);

INSERT INTO city
VALUES(
      4323,
      "Scone",
      128
);

INSERT INTO city
VALUES(
      4324,
      "Scottsdale",
      128
);

INSERT INTO city
VALUES(
      4325,
      "Narrabri",
      128
);

INSERT INTO city
VALUES(
      4326,
      "Narrogin",
      128
);

INSERT INTO city
VALUES(
      4327,
      "Townsville",
      128
);

INSERT INTO city
VALUES(
      4328,
      "Traralgon",
      128
);

INSERT INTO city
VALUES(
      4329,
      "Central Coast",
      128
);

INSERT INTO city
VALUES(
      4330,
      "Broome",
      128
);

INSERT INTO city
VALUES(
      4331,
      "Bunbury",
      128
);

INSERT INTO city
VALUES(
      4332,
      "Wyndham",
      128
);

INSERT INTO city
VALUES(
      4333,
      "Yamba",
      128
);

INSERT INTO city
VALUES(
      4334,
      "Tumby Bay",
      128
);

INSERT INTO city
VALUES(
      4335,
      "Forster-Tuncurry",
      128
);

INSERT INTO city
VALUES(
      4336,
      "Bundaberg",
      128
);

INSERT INTO city
VALUES(
      4337,
      "Yulara",
      128
);

INSERT INTO city
VALUES(
      4338,
      "Richmond",
      128
);

INSERT INTO city
VALUES(
      4339,
      "Richmond",
      128
);

INSERT INTO city
VALUES(
      4340,
      "Rockhampton",
      128
);

INSERT INTO city
VALUES(
      4341,
      "Roebourne",
      128
);

INSERT INTO city
VALUES(
      4342,
      "Roma",
      128
);

INSERT INTO city
VALUES(
      4343,
      "Cloncurry",
      128
);

INSERT INTO city
VALUES(
      4344,
      "Cobram",
      128
);

INSERT INTO city
VALUES(
      4345,
      "Coffs Harbour",
      128
);

INSERT INTO city
VALUES(
      4346,
      "Colac",
      128
);

INSERT INTO city
VALUES(
      4347,
      "Alice Springs",
      128
);

INSERT INTO city
VALUES(
      4348,
      "Ararat",
      128
);

INSERT INTO city
VALUES(
      4349,
      "Carnarvon",
      128
);

INSERT INTO city
VALUES(
      4350,
      "Ceduna",
      128
);

INSERT INTO city
VALUES(
      4351,
      "Charleville",
      128
);

INSERT INTO city
VALUES(
      4352,
      "Charters Towers",
      128
);

INSERT INTO city
VALUES(
      4353,
      "Kalbarri",
      128
);

INSERT INTO city
VALUES(
      4354,
      "Kununurra",
      128
);

INSERT INTO city
VALUES(
      4355,
      "Dalby",
      128
);

INSERT INTO city
VALUES(
      4356,
      "Lithgow",
      128
);

INSERT INTO city
VALUES(
      4357,
      "Manjimup",
      128
);

INSERT INTO city
VALUES(
      4358,
      "Maitland",
      128
);

INSERT INTO city
VALUES(
      4359,
      "Mandurah",
      128
);

INSERT INTO city
VALUES(
      4360,
      "Karratha",
      128
);

INSERT INTO city
VALUES(
      4361,
      "Gawler",
      128
);

INSERT INTO city
VALUES(
      4362,
      "Geelong",
      128
);

INSERT INTO city
VALUES(
      4363,
      "Georgetown",
      128
);

INSERT INTO city
VALUES(
      4364,
      "Geraldton",
      128
);

INSERT INTO city
VALUES(
      4365,
      "Maryborough",
      128
);

INSERT INTO city
VALUES(
      4366,
      "Maryborough",
      128
);

INSERT INTO city
VALUES(
      4367,
      "McMinns Lagoon",
      128
);

INSERT INTO city
VALUES(
      4368,
      "Toowoomba",
      128
);

INSERT INTO city
VALUES(
      4369,
      "Onslow",
      128
);

INSERT INTO city
VALUES(
      4370,
      "Orange",
      128
);

INSERT INTO city
VALUES(
      4371,
      "Stawell",
      128
);

INSERT INTO city
VALUES(
      4372,
      "Echuca",
      128
);

INSERT INTO city
VALUES(
      4373,
      "Eidsvold",
      128
);

INSERT INTO city
VALUES(
      4374,
      "Emerald",
      128
);

INSERT INTO city
VALUES(
      4375,
      "Tamworth",
      128
);

INSERT INTO city
VALUES(
      4376,
      "Taree",
      128
);

INSERT INTO city
VALUES(
      4377,
      "Ballarat",
      128
);

INSERT INTO city
VALUES(
      4378,
      "Ballina",
      128
);

INSERT INTO city
VALUES(
      4379,
      "Barcaldine",
      128
);

INSERT INTO city
VALUES(
      4380,
      "Mount Barker",
      128
);

INSERT INTO city
VALUES(
      4381,
      "Mount Gambier",
      128
);

INSERT INTO city
VALUES(
      4382,
      "Mount Isa",
      128
);

INSERT INTO city
VALUES(
      4383,
      "Mount Magnet",
      128
);

INSERT INTO city
VALUES(
      4384,
      "Kempsey",
      128
);

INSERT INTO city
VALUES(
      4385,
      "Queanbeyan",
      128
);

INSERT INTO city
VALUES(
      4386,
      "Queenstown",
      128
);

INSERT INTO city
VALUES(
      4387,
      "Quilpie",
      128
);

INSERT INTO city
VALUES(
      4388,
      "Ravensthorpe",
      128
);

INSERT INTO city
VALUES(
      4389,
      "Warrnambool",
      128
);

INSERT INTO city
VALUES(
      4390,
      "Warwick",
      128
);

INSERT INTO city
VALUES(
      4391,
      "Weipa",
      128
);

INSERT INTO city
VALUES(
      4392,
      "Ouyen",
      128
);

INSERT INTO city
VALUES(
      4393,
      "Wollongong",
      128
);

INSERT INTO city
VALUES(
      4394,
      "Wonthaggi",
      128
);

INSERT INTO city
VALUES(
      4395,
      "Kiama",
      128
);

INSERT INTO city
VALUES(
      4396,
      "Kimba",
      128
);

INSERT INTO city
VALUES(
      4397,
      "Kingaroy",
      128
);

INSERT INTO city
VALUES(
      4398,
      "Pine Creek",
      128
);

INSERT INTO city
VALUES(
      4399,
      "Hobart",
      128
);

INSERT INTO city
VALUES(
      4400,
      "Darwin",
      128
);

INSERT INTO city
VALUES(
      4401,
      "Gingin",
      128
);

INSERT INTO city
VALUES(
      4402,
      "Meekatharra",
      128
);

INSERT INTO city
VALUES(
      4403,
      "Melbourne",
      128
);

INSERT INTO city
VALUES(
      4404,
      "Woomera",
      128
);

INSERT INTO city
VALUES(
      4405,
      "Moranbah",
      128
);

INSERT INTO city
VALUES(
      4406,
      "Port Augusta",
      128
);

INSERT INTO city
VALUES(
      4407,
      "Port Douglas",
      128
);

INSERT INTO city
VALUES(
      4408,
      "Gladstone",
      128
);

INSERT INTO city
VALUES(
      4409,
      "Gold Coast",
      128
);

INSERT INTO city
VALUES(
      4410,
      "Horsham",
      128
);

INSERT INTO city
VALUES(
      4411,
      "Hughenden",
      128
);

INSERT INTO city
VALUES(
      4412,
      "Northam",
      128
);

INSERT INTO city
VALUES(
      4413,
      "Nowra",
      128
);

INSERT INTO city
VALUES(
      4414,
      "Shepparton",
      128
);

INSERT INTO city
VALUES(
      4415,
      "Yeppoon",
      128
);

INSERT INTO city
VALUES(
      4416,
      "Young",
      128
);

INSERT INTO city
VALUES(
      4417,
      "Caloundra",
      128
);

INSERT INTO city
VALUES(
      4418,
      "Ingham",
      128
);

INSERT INTO city
VALUES(
      4419,
      "Innisfail",
      128
);

INSERT INTO city
VALUES(
      4420,
      "Inverell",
      128
);

INSERT INTO city
VALUES(
      4421,
      "Kingston",
      128
);

INSERT INTO city
VALUES(
      4422,
      "Kingston South East",
      128
);

INSERT INTO city
VALUES(
      4423,
      "Clare",
      128
);

INSERT INTO city
VALUES(
      4424,
      "Bowen",
      128
);

INSERT INTO city
VALUES(
      4425,
      "Melton",
      128
);

INSERT INTO city
VALUES(
      4426,
      "Meningie",
      128
);

INSERT INTO city
VALUES(
      4427,
      "Merimbula",
      128
);

INSERT INTO city
VALUES(
      4428,
      "Merredin",
      128
);

INSERT INTO city
VALUES(
      4429,
      "Mildura",
      128
);

INSERT INTO city
VALUES(
      4430,
      "Thargomindah",
      128
);

INSERT INTO city
VALUES(
      4431,
      "Theodore",
      128
);

INSERT INTO city
VALUES(
      4432,
      "Three Springs",
      128
);

INSERT INTO city
VALUES(
      4433,
      "Oatlands",
      128
);

INSERT INTO city
VALUES(
      4434,
      "Wagin",
      128
);

INSERT INTO city
VALUES(
      4435,
      "Armidale",
      128
);

INSERT INTO city
VALUES(
      4436,
      "Atherton",
      128
);

INSERT INTO city
VALUES(
      4437,
      "Ayr",
      128
);

INSERT INTO city
VALUES(
      4438,
      "Bairnsdale",
      128
);

INSERT INTO city
VALUES(
      4439,
      "Camooweal",
      128
);

INSERT INTO city
VALUES(
      4440,
      "Canberra",
      128
);

INSERT INTO city
VALUES(
      4441,
      "Longreach",
      128
);

INSERT INTO city
VALUES(
      4442,
      "Brisbane",
      128
);

INSERT INTO city
VALUES(
      4443,
      "Devonport",
      128
);

INSERT INTO city
VALUES(
      4444,
      "Wallaroo",
      128
);

INSERT INTO city
VALUES(
      4445,
      "Wangaratta",
      128
);

INSERT INTO city
VALUES(
      4446,
      "Cowell",
      128
);

INSERT INTO city
VALUES(
      4447,
      "Cowra",
      128
);

INSERT INTO city
VALUES(
      4448,
      "Goondiwindi",
      128
);

INSERT INTO city
VALUES(
      4449,
      "Goulburn",
      128
);

INSERT INTO city
VALUES(
      4450,
      "Grafton",
      128
);

INSERT INTO city
VALUES(
      4451,
      "Murray Bridge",
      128
);

INSERT INTO city
VALUES(
      4452,
      "Muswellbrook",
      128
);

INSERT INTO city
VALUES(
      4453,
      "Windorah",
      128
);

INSERT INTO city
VALUES(
      4454,
      "Bedourie",
      128
);

INSERT INTO city
VALUES(
      4455,
      "Newman",
      128
);

INSERT INTO city
VALUES(
      4456,
      "Birdsville",
      128
);

INSERT INTO city
VALUES(
      4457,
      "Kalgoorlie",
      128
);

INSERT INTO city
VALUES(
      4458,
      "Biloela",
      128
);

INSERT INTO city
VALUES(
      4459,
      "Smithton",
      128
);

INSERT INTO city
VALUES(
      4460,
      "Bicheno",
      128
);

INSERT INTO city
VALUES(
      4461,
      "Deniliquin",
      128
);

INSERT INTO city
VALUES(
      4462,
      "Broken Hill",
      128
);

INSERT INTO city
VALUES(
      4463,
      "Swan Hill",
      128
);

INSERT INTO city
VALUES(
      4464,
      "Albury",
      128
);

INSERT INTO city
VALUES(
      4465,
      "Wagga Wagga",
      128
);

INSERT INTO city
VALUES(
      4466,
      "Tumut",
      128
);

INSERT INTO city
VALUES(
      4467,
      "Lismore",
      128
);

INSERT INTO city
VALUES(
      4468,
      "Byron Bay",
      128
);

INSERT INTO city
VALUES(
      4469,
      "Tweed Heads",
      128
);

INSERT INTO country
VALUES(
      129,
      "Aruba"
);

INSERT INTO city
VALUES(
      4470,
      "Oranjestad",
      129
);

INSERT INTO country
VALUES(
      130,
      "Azerbaijan"
);

INSERT INTO city
VALUES(
      4471,
      "Baku",
      130
);

INSERT INTO city
VALUES(
      4472,
      "Goranboy",
      130
);

INSERT INTO city
VALUES(
      4473,
      "Saki",
      130
);

INSERT INTO city
VALUES(
      4474,
      "Fuzuli",
      130
);

INSERT INTO city
VALUES(
      4475,
      "Lankaran",
      130
);

INSERT INTO city
VALUES(
      4476,
      "Xocali",
      130
);

INSERT INTO city
VALUES(
      4477,
      "Agdam",
      130
);

INSERT INTO city
VALUES(
      4478,
      "Astara",
      130
);

INSERT INTO city
VALUES(
      4479,
      "Cabrayil",
      130
);

INSERT INTO city
VALUES(
      4480,
      "Beylaqan",
      130
);

INSERT INTO city
VALUES(
      4481,
      "Masalli",
      130
);

INSERT INTO city
VALUES(
      4482,
      "Bilasuvar",
      130
);

INSERT INTO city
VALUES(
      4483,
      "Calilabad",
      130
);

INSERT INTO city
VALUES(
      4484,
      "Davaci",
      130
);

INSERT INTO city
VALUES(
      4485,
      "Agsu",
      130
);

INSERT INTO city
VALUES(
      4486,
      "Yevlax",
      130
);

INSERT INTO city
VALUES(
      4487,
      "Mingacevir",
      130
);

INSERT INTO city
VALUES(
      4488,
      "Ganca",
      130
);

INSERT INTO city
VALUES(
      4489,
      "Sumqayt",
      130
);

INSERT INTO city
VALUES(
      4490,
      "Xacmaz",
      130
);

INSERT INTO city
VALUES(
      4491,
      "Imisli",
      130
);

INSERT INTO city
VALUES(
      4492,
      "Saatli",
      130
);

INSERT INTO city
VALUES(
      4493,
      "Lacin",
      130
);

INSERT INTO city
VALUES(
      4494,
      "Sarur",
      130
);

INSERT INTO city
VALUES(
      4495,
      "Qubadli",
      130
);

INSERT INTO city
VALUES(
      4496,
      "Heydarabad",
      130
);

INSERT INTO city
VALUES(
      4497,
      "Yardimli",
      130
);

INSERT INTO city
VALUES(
      4498,
      "Sahbuz",
      130
);

INSERT INTO city
VALUES(
      4499,
      "Qivraq",
      130
);

INSERT INTO city
VALUES(
      4500,
      "Ordubad",
      130
);

INSERT INTO city
VALUES(
      4501,
      "Goycay",
      130
);

INSERT INTO city
VALUES(
      4502,
      "Agdas",
      130
);

INSERT INTO city
VALUES(
      4503,
      "Naftalan",
      130
);

INSERT INTO city
VALUES(
      4504,
      "Naxcivan",
      130
);

INSERT INTO city
VALUES(
      4505,
      "Goygol",
      130
);

INSERT INTO city
VALUES(
      4506,
      "Haciqabul",
      130
);

INSERT INTO city
VALUES(
      4507,
      "Kurdamir",
      130
);

INSERT INTO city
VALUES(
      4508,
      "Qobustan",
      130
);

INSERT INTO city
VALUES(
      4509,
      "Barda",
      130
);

INSERT INTO city
VALUES(
      4510,
      "Lerik",
      130
);

INSERT INTO city
VALUES(
      4511,
      "Stepanakert",
      130
);

INSERT INTO city
VALUES(
      4512,
      "Susa",
      130
);

INSERT INTO city
VALUES(
      4513,
      "Daskasan",
      130
);

INSERT INTO city
VALUES(
      4514,
      "Salyan",
      130
);

INSERT INTO city
VALUES(
      4515,
      "Qusar",
      130
);

INSERT INTO city
VALUES(
      4516,
      "Ali Bayramli",
      130
);

INSERT INTO city
VALUES(
      4517,
      "Sabirabad",
      130
);

INSERT INTO city
VALUES(
      4518,
      "Quba",
      130
);

INSERT INTO city
VALUES(
      4519,
      "Gadabay",
      130
);

INSERT INTO city
VALUES(
      4520,
      "Oguz",
      130
);

INSERT INTO city
VALUES(
      4521,
      "Balakan",
      130
);

INSERT INTO city
VALUES(
      4522,
      "Qax",
      130
);

INSERT INTO city
VALUES(
      4523,
      "Xirdalan",
      130
);

INSERT INTO city
VALUES(
      4524,
      "Neftcala",
      130
);

INSERT INTO city
VALUES(
      4525,
      "Agcabadi",
      130
);

INSERT INTO city
VALUES(
      4526,
      "Kalbacar",
      130
);

INSERT INTO city
VALUES(
      4527,
      "Qazax",
      130
);

INSERT INTO city
VALUES(
      4528,
      "Agstafa",
      130
);

INSERT INTO city
VALUES(
      4529,
      "Tovuz",
      130
);

INSERT INTO city
VALUES(
      4530,
      "Qabala",
      130
);

INSERT INTO city
VALUES(
      4531,
      "Agdam",
      130
);

INSERT INTO city
VALUES(
      4532,
      "Ismayilli",
      130
);

INSERT INTO city
VALUES(
      4533,
      "Samux",
      130
);

INSERT INTO city
VALUES(
      4534,
      "Samkir",
      130
);

INSERT INTO city
VALUES(
      4535,
      "Zaqatala",
      130
);

INSERT INTO city
VALUES(
      4536,
      "Qabala",
      130
);

INSERT INTO city
VALUES(
      4537,
      "Kapan",
      130
);

INSERT INTO city
VALUES(
      4538,
      "Zangilan",
      130
);

INSERT INTO city
VALUES(
      4539,
      "Tartar",
      130
);

INSERT INTO city
VALUES(
      4540,
      "Siyazan",
      130
);

INSERT INTO city
VALUES(
      4541,
      "Zardab",
      130
);

INSERT INTO city
VALUES(
      4542,
      "Xizi",
      130
);

INSERT INTO city
VALUES(
      4543,
      "Ucar",
      130
);

INSERT INTO city
VALUES(
      4544,
      "Xocavand",
      130
);

INSERT INTO country
VALUES(
      131,
      "Bosnia And Herzegovina"
);

INSERT INTO city
VALUES(
      4545,
      "Sarajevo",
      131
);

INSERT INTO city
VALUES(
      4546,
      "Banja Luka",
      131
);

INSERT INTO city
VALUES(
      4547,
      "Brcko",
      131
);

INSERT INTO city
VALUES(
      4548,
      "Tuzla",
      131
);

INSERT INTO city
VALUES(
      4549,
      "Zenica",
      131
);

INSERT INTO city
VALUES(
      4550,
      "Mostar",
      131
);

INSERT INTO city
VALUES(
      4551,
      "Prijedor",
      131
);

INSERT INTO country
VALUES(
      132,
      "Barbados"
);

INSERT INTO city
VALUES(
      4552,
      "Bridgetown",
      132
);

INSERT INTO country
VALUES(
      133,
      "Bangladesh"
);

INSERT INTO city
VALUES(
      4553,
      "Dhaka",
      133
);

INSERT INTO city
VALUES(
      4554,
      "Narayanganj",
      133
);

INSERT INTO city
VALUES(
      4555,
      "Khulna",
      133
);

INSERT INTO city
VALUES(
      4556,
      "Jessore",
      133
);

INSERT INTO city
VALUES(
      4557,
      "Sylhet",
      133
);

INSERT INTO city
VALUES(
      4558,
      "Chittagong",
      133
);

INSERT INTO city
VALUES(
      4559,
      "Barisal",
      133
);

INSERT INTO city
VALUES(
      4560,
      "Comilla",
      133
);

INSERT INTO city
VALUES(
      4561,
      "Rajshahi",
      133
);

INSERT INTO city
VALUES(
      4562,
      "Pabna",
      133
);

INSERT INTO city
VALUES(
      4563,
      "Saidpur",
      133
);

INSERT INTO city
VALUES(
      4564,
      "Tangail",
      133
);

INSERT INTO city
VALUES(
      4565,
      "Nawabganj",
      133
);

INSERT INTO city
VALUES(
      4566,
      "Jamalpur",
      133
);

INSERT INTO city
VALUES(
      4567,
      "Rangpur",
      133
);

INSERT INTO city
VALUES(
      4568,
      "Mymensingh",
      133
);

INSERT INTO country
VALUES(
      134,
      "Belgium"
);

INSERT INTO city
VALUES(
      4569,
      "Brussels",
      134
);

INSERT INTO city
VALUES(
      4570,
      "Arlon",
      134
);

INSERT INTO city
VALUES(
      4571,
      "Antwerpen",
      134
);

INSERT INTO city
VALUES(
      4572,
      "Liege",
      134
);

INSERT INTO city
VALUES(
      4573,
      "Hasselt",
      134
);

INSERT INTO city
VALUES(
      4574,
      "Mons",
      134
);

INSERT INTO city
VALUES(
      4575,
      "Gent",
      134
);

INSERT INTO city
VALUES(
      4576,
      "Namur",
      134
);

INSERT INTO city
VALUES(
      4577,
      "Charleroi",
      134
);

INSERT INTO city
VALUES(
      4578,
      "Brugge",
      134
);

INSERT INTO country
VALUES(
      135,
      "Burkina Faso"
);

INSERT INTO city
VALUES(
      4579,
      "Banfora",
      135
);

INSERT INTO city
VALUES(
      4580,
      "Tougan",
      135
);

INSERT INTO city
VALUES(
      4581,
      "Po",
      135
);

INSERT INTO city
VALUES(
      4582,
      "Bobo Dioulasso",
      135
);

INSERT INTO city
VALUES(
      4583,
      "Tenkodogo",
      135
);

INSERT INTO city
VALUES(
      4584,
      "Diapaga",
      135
);

INSERT INTO city
VALUES(
      4585,
      "Sebba",
      135
);

INSERT INTO city
VALUES(
      4586,
      "Ouahigouya",
      135
);

INSERT INTO city
VALUES(
      4587,
      "Kaya",
      135
);

INSERT INTO city
VALUES(
      4588,
      "Gaoua",
      135
);

INSERT INTO city
VALUES(
      4589,
      "Manga",
      135
);

INSERT INTO city
VALUES(
      4590,
      "Sapouy",
      135
);

INSERT INTO city
VALUES(
      4591,
      "Ouagadougou",
      135
);

INSERT INTO city
VALUES(
      4592,
      "Orodara",
      135
);

INSERT INTO city
VALUES(
      4593,
      "Bogande",
      135
);

INSERT INTO city
VALUES(
      4594,
      "Ziniare",
      135
);

INSERT INTO city
VALUES(
      4595,
      "Fada Ngourma",
      135
);

INSERT INTO city
VALUES(
      4596,
      "Leo",
      135
);

INSERT INTO city
VALUES(
      4597,
      "Diebougou",
      135
);

INSERT INTO city
VALUES(
      4598,
      "Gaoua",
      135
);

INSERT INTO city
VALUES(
      4599,
      "Dedougou",
      135
);

INSERT INTO city
VALUES(
      4600,
      "Nouna",
      135
);

INSERT INTO city
VALUES(
      4601,
      "Koudougou",
      135
);

INSERT INTO city
VALUES(
      4602,
      "Reo",
      135
);

INSERT INTO city
VALUES(
      4603,
      "Yako",
      135
);

INSERT INTO city
VALUES(
      4604,
      "Solenzo",
      135
);

INSERT INTO city
VALUES(
      4605,
      "Djibo",
      135
);

INSERT INTO city
VALUES(
      4606,
      "Dori",
      135
);

INSERT INTO city
VALUES(
      4607,
      "Gorom Gorom",
      135
);

INSERT INTO city
VALUES(
      4608,
      "Zorgo",
      135
);

INSERT INTO city
VALUES(
      4609,
      "Boulsa",
      135
);

INSERT INTO city
VALUES(
      4610,
      "Koupela",
      135
);

INSERT INTO city
VALUES(
      4611,
      "Kombissiri",
      135
);

INSERT INTO country
VALUES(
      136,
      "Bulgaria"
);

INSERT INTO city
VALUES(
      4612,
      "Ruse",
      136
);

INSERT INTO city
VALUES(
      4613,
      "Varna",
      136
);

INSERT INTO city
VALUES(
      4614,
      "Pazardzhik",
      136
);

INSERT INTO city
VALUES(
      4615,
      "Yambol",
      136
);

INSERT INTO city
VALUES(
      4616,
      "Sliven",
      136
);

INSERT INTO city
VALUES(
      4617,
      "Dobrich",
      136
);

INSERT INTO city
VALUES(
      4618,
      "Lovec",
      136
);

INSERT INTO city
VALUES(
      4619,
      "Plovdiv",
      136
);

INSERT INTO city
VALUES(
      4620,
      "Vidin",
      136
);

INSERT INTO city
VALUES(
      4621,
      "Shumen",
      136
);

INSERT INTO city
VALUES(
      4622,
      "Razgrad",
      136
);

INSERT INTO city
VALUES(
      4623,
      "Silistra",
      136
);

INSERT INTO city
VALUES(
      4624,
      "Blagoevgrad",
      136
);

INSERT INTO city
VALUES(
      4625,
      "Burgas",
      136
);

INSERT INTO city
VALUES(
      4626,
      "Montana",
      136
);

INSERT INTO city
VALUES(
      4627,
      "Gabrovo",
      136
);

INSERT INTO city
VALUES(
      4628,
      "Kyustendil",
      136
);

INSERT INTO city
VALUES(
      4629,
      "Vratsa",
      136
);

INSERT INTO city
VALUES(
      4630,
      "Stara Zagora",
      136
);

INSERT INTO city
VALUES(
      4631,
      "Smolyan",
      136
);

INSERT INTO city
VALUES(
      4632,
      "Pernik",
      136
);

INSERT INTO city
VALUES(
      4633,
      "Pleven",
      136
);

INSERT INTO city
VALUES(
      4634,
      "Sofia",
      136
);

INSERT INTO city
VALUES(
      4635,
      "Khaskovo",
      136
);

INSERT INTO city
VALUES(
      4636,
      "Kardzhali",
      136
);

INSERT INTO city
VALUES(
      4637,
      "Targovishte",
      136
);

INSERT INTO city
VALUES(
      4638,
      "Turnovo",
      136
);

INSERT INTO country
VALUES(
      137,
      "Bahrain"
);

INSERT INTO city
VALUES(
      4639,
      "Manama",
      137
);

INSERT INTO country
VALUES(
      138,
      "Burundi"
);

INSERT INTO city
VALUES(
      4640,
      "Kayanza",
      138
);

INSERT INTO city
VALUES(
      4641,
      "Ruyigi",
      138
);

INSERT INTO city
VALUES(
      4642,
      "Bururi",
      138
);

INSERT INTO city
VALUES(
      4643,
      "Makamba",
      138
);

INSERT INTO city
VALUES(
      4644,
      "Cibitoke",
      138
);

INSERT INTO city
VALUES(
      4645,
      "Rutana",
      138
);

INSERT INTO city
VALUES(
      4646,
      "Cankuzo",
      138
);

INSERT INTO city
VALUES(
      4647,
      "Muramvya",
      138
);

INSERT INTO city
VALUES(
      4648,
      "Gitega",
      138
);

INSERT INTO city
VALUES(
      4649,
      "Gitega",
      138
);

INSERT INTO city
VALUES(
      4650,
      "Kirundo",
      138
);

INSERT INTO city
VALUES(
      4651,
      "Muyinga",
      138
);

INSERT INTO city
VALUES(
      4652,
      "Rumonge",
      138
);

INSERT INTO city
VALUES(
      4653,
      "Bubanza",
      138
);

INSERT INTO city
VALUES(
      4654,
      "Karusi",
      138
);

INSERT INTO city
VALUES(
      4655,
      "Ngozi",
      138
);

INSERT INTO city
VALUES(
      4656,
      "Mwaro",
      138
);

INSERT INTO city
VALUES(
      4657,
      "Isale",
      138
);

INSERT INTO city
VALUES(
      4658,
      "Bujumbura",
      138
);

INSERT INTO country
VALUES(
      139,
      "Benin"
);

INSERT INTO city
VALUES(
      4659,
      "Kandi",
      139
);

INSERT INTO city
VALUES(
      4660,
      "Dogbo",
      139
);

INSERT INTO city
VALUES(
      4661,
      "Savalou",
      139
);

INSERT INTO city
VALUES(
      4662,
      "Ouidah",
      139
);

INSERT INTO city
VALUES(
      4663,
      "Lokossa",
      139
);

INSERT INTO city
VALUES(
      4664,
      "Sakete",
      139
);

INSERT INTO city
VALUES(
      4665,
      "Natitingou",
      139
);

INSERT INTO city
VALUES(
      4666,
      "Abomey",
      139
);

INSERT INTO city
VALUES(
      4667,
      "Djougou",
      139
);

INSERT INTO city
VALUES(
      4668,
      "Parakou",
      139
);

INSERT INTO city
VALUES(
      4669,
      "Porto-Novo",
      139
);

INSERT INTO city
VALUES(
      4670,
      "Cotonou",
      139
);

INSERT INTO country
VALUES(
      140,
      "Saint Barthelemy"
);

INSERT INTO city
VALUES(
      4671,
      "Gustavia",
      140
);

INSERT INTO country
VALUES(
      141,
      "Bermuda"
);

INSERT INTO city
VALUES(
      4672,
      "Hamilton",
      141
);

INSERT INTO country
VALUES(
      142,
      "Brunei"
);

INSERT INTO city
VALUES(
      4673,
      "Bandar Seri Begawan",
      142
);

INSERT INTO country
VALUES(
      143,
      "Bolivia"
);

INSERT INTO city
VALUES(
      4674,
      "Uyuni",
      143
);

INSERT INTO city
VALUES(
      4675,
      "Santa Cruz de la Sierra",
      143
);

INSERT INTO city
VALUES(
      4676,
      "La Paz",
      143
);

INSERT INTO city
VALUES(
      4677,
      "Sica Sica",
      143
);

INSERT INTO city
VALUES(
      4678,
      "Puerto Suarez",
      143
);

INSERT INTO city
VALUES(
      4679,
      "Coroico",
      143
);

INSERT INTO city
VALUES(
      4680,
      "Coro Coro",
      143
);

INSERT INTO city
VALUES(
      4681,
      "San Ignacio",
      143
);

INSERT INTO city
VALUES(
      4682,
      "San Matias",
      143
);

INSERT INTO city
VALUES(
      4683,
      "Santa Ana",
      143
);

INSERT INTO city
VALUES(
      4684,
      "Robore",
      143
);

INSERT INTO city
VALUES(
      4685,
      "Baures",
      143
);

INSERT INTO city
VALUES(
      4686,
      "Ascension",
      143
);

INSERT INTO city
VALUES(
      4687,
      "Oruro",
      143
);

INSERT INTO city
VALUES(
      4688,
      "Apolo",
      143
);

INSERT INTO city
VALUES(
      4689,
      "San Jose",
      143
);

INSERT INTO city
VALUES(
      4690,
      "Viacha",
      143
);

INSERT INTO city
VALUES(
      4691,
      "Charana",
      143
);

INSERT INTO city
VALUES(
      4692,
      "Trinidad",
      143
);

INSERT INTO city
VALUES(
      4693,
      "Potosi",
      143
);

INSERT INTO city
VALUES(
      4694,
      "San Carlos",
      143
);

INSERT INTO city
VALUES(
      4695,
      "Quime",
      143
);

INSERT INTO city
VALUES(
      4696,
      "Reyes",
      143
);

INSERT INTO city
VALUES(
      4697,
      "Rurrenabaque",
      143
);

INSERT INTO city
VALUES(
      4698,
      "San Ramon",
      143
);

INSERT INTO city
VALUES(
      4699,
      "Achacachi",
      143
);

INSERT INTO city
VALUES(
      4700,
      "San Rafael",
      143
);

INSERT INTO city
VALUES(
      4701,
      "Magdalena",
      143
);

INSERT INTO city
VALUES(
      4702,
      "San Borja",
      143
);

INSERT INTO city
VALUES(
      4703,
      "Guayaramerin",
      143
);

INSERT INTO city
VALUES(
      4704,
      "Puerto Quijarro",
      143
);

INSERT INTO city
VALUES(
      4705,
      "Cochabamba",
      143
);

INSERT INTO city
VALUES(
      4706,
      "Santa Cruz",
      143
);

INSERT INTO city
VALUES(
      4707,
      "Sucre",
      143
);

INSERT INTO city
VALUES(
      4708,
      "Tupiza",
      143
);

INSERT INTO city
VALUES(
      4709,
      "San Lorenzo",
      143
);

INSERT INTO city
VALUES(
      4710,
      "Camargo",
      143
);

INSERT INTO city
VALUES(
      4711,
      "Villamontes",
      143
);

INSERT INTO city
VALUES(
      4712,
      "Cobija",
      143
);

INSERT INTO city
VALUES(
      4713,
      "Tarabuco",
      143
);

INSERT INTO city
VALUES(
      4714,
      "Camiri",
      143
);

INSERT INTO city
VALUES(
      4715,
      "Cuevo",
      143
);

INSERT INTO city
VALUES(
      4716,
      "Charagua",
      143
);

INSERT INTO city
VALUES(
      4717,
      "Padilla",
      143
);

INSERT INTO city
VALUES(
      4718,
      "Bermejo",
      143
);

INSERT INTO city
VALUES(
      4719,
      "Entre Rios",
      143
);

INSERT INTO city
VALUES(
      4720,
      "Tarija",
      143
);

INSERT INTO city
VALUES(
      4721,
      "Villazon",
      143
);

INSERT INTO city
VALUES(
      4722,
      "Puerto Heath",
      143
);

INSERT INTO city
VALUES(
      4723,
      "Piso Firme",
      143
);

INSERT INTO city
VALUES(
      4724,
      "Betanzos",
      143
);

INSERT INTO city
VALUES(
      4725,
      "Sabaya",
      143
);

INSERT INTO city
VALUES(
      4726,
      "Vallegrande",
      143
);

INSERT INTO city
VALUES(
      4727,
      "Samaipata",
      143
);

INSERT INTO city
VALUES(
      4728,
      "Llica",
      143
);

INSERT INTO city
VALUES(
      4729,
      "Aiquile",
      143
);

INSERT INTO city
VALUES(
      4730,
      "Villa Martin",
      143
);

INSERT INTO city
VALUES(
      4731,
      "San Javier",
      143
);

INSERT INTO city
VALUES(
      4732,
      "Riberalta",
      143
);

INSERT INTO city
VALUES(
      4733,
      "Llallagua",
      143
);

INSERT INTO city
VALUES(
      4734,
      "Uncia",
      143
);

INSERT INTO city
VALUES(
      4735,
      "Challapata",
      143
);

INSERT INTO city
VALUES(
      4736,
      "Quillacollo",
      143
);

INSERT INTO city
VALUES(
      4737,
      "Punata",
      143
);

INSERT INTO city
VALUES(
      4738,
      "Cliza",
      143
);

INSERT INTO city
VALUES(
      4739,
      "Portachuelo",
      143
);

INSERT INTO city
VALUES(
      4740,
      "Montero",
      143
);

INSERT INTO city
VALUES(
      4741,
      "Puerto Villarroel",
      143
);

INSERT INTO city
VALUES(
      4742,
      "Puerto Acosta",
      143
);

INSERT INTO city
VALUES(
      4743,
      "Sorata",
      143
);

INSERT INTO country
VALUES(
      144,
      "Brazil"
);

INSERT INTO city
VALUES(
      4744,
      "Taua",
      144
);

INSERT INTO city
VALUES(
      4745,
      "Uruguaiana",
      144
);

INSERT INTO city
VALUES(
      4746,
      "Quixada",
      144
);

INSERT INTO city
VALUES(
      4747,
      "Cabo de Santo Agostinho",
      144
);

INSERT INTO city
VALUES(
      4748,
      "Sao Gabriel",
      144
);

INSERT INTO city
VALUES(
      4749,
      "Sao Borja",
      144
);

INSERT INTO city
VALUES(
      4750,
      "Santo Angelo",
      144
);

INSERT INTO city
VALUES(
      4751,
      "Santa Rosa",
      144
);

INSERT INTO city
VALUES(
      4752,
      "Quarai",
      144
);

INSERT INTO city
VALUES(
      4753,
      "Salvador",
      144
);

INSERT INTO city
VALUES(
      4754,
      "Vila Velha",
      144
);

INSERT INTO city
VALUES(
      4755,
      "Santa Cruz do Sul",
      144
);

INSERT INTO city
VALUES(
      4756,
      "Laguna",
      144
);

INSERT INTO city
VALUES(
      4757,
      "Muriae",
      144
);

INSERT INTO city
VALUES(
      4758,
      "Londrina",
      144
);

INSERT INTO city
VALUES(
      4759,
      "Sao Lourenco do Sul",
      144
);

INSERT INTO city
VALUES(
      4760,
      "Porto Uniao",
      144
);

INSERT INTO city
VALUES(
      4761,
      "Itanhaem",
      144
);

INSERT INTO city
VALUES(
      4762,
      "Foz do Iguacu",
      144
);

INSERT INTO city
VALUES(
      4763,
      "Novo Hamburgo",
      144
);

INSERT INTO city
VALUES(
      4764,
      "Viana",
      144
);

INSERT INTO city
VALUES(
      4765,
      "Fernandopolis",
      144
);

INSERT INTO city
VALUES(
      4766,
      "Guarapuava",
      144
);

INSERT INTO city
VALUES(
      4767,
      "Guajara-Miram",
      144
);

INSERT INTO city
VALUES(
      4768,
      "Arcoverde",
      144
);

INSERT INTO city
VALUES(
      4769,
      "Mossoro",
      144
);

INSERT INTO city
VALUES(
      4770,
      "Maringa",
      144
);

INSERT INTO city
VALUES(
      4771,
      "Maracaju",
      144
);

INSERT INTO city
VALUES(
      4772,
      "Estancia",
      144
);

INSERT INTO city
VALUES(
      4773,
      "Crateus",
      144
);

INSERT INTO city
VALUES(
      4774,
      "Ponta Pora",
      144
);

INSERT INTO city
VALUES(
      4775,
      "Penapolis",
      144
);

INSERT INTO city
VALUES(
      4776,
      "Cruzeiro do Sul",
      144
);

INSERT INTO city
VALUES(
      4777,
      "Jacareacanga",
      144
);

INSERT INTO city
VALUES(
      4778,
      "Erechim",
      144
);

INSERT INTO city
VALUES(
      4779,
      "Chapadinha",
      144
);

INSERT INTO city
VALUES(
      4780,
      "Itapipoca",
      144
);

INSERT INTO city
VALUES(
      4781,
      "Bacabal",
      144
);

INSERT INTO city
VALUES(
      4782,
      "Cascavel",
      144
);

INSERT INTO city
VALUES(
      4783,
      "Curitiba",
      144
);

INSERT INTO city
VALUES(
      4784,
      "Aracati",
      144
);

INSERT INTO city
VALUES(
      4785,
      'Jaboatao',
      144
);

INSERT INTO city
VALUES(
      4786,
      'Ijui',
      144
);

INSERT INTO city
VALUES(
      4787,
      'Apucarana',
      144
);

INSERT INTO city
VALUES(
      4788,
      'Formosa',
      144
);

INSERT INTO city
VALUES(
      4789,
      'Ico',
      144
);

INSERT INTO city
VALUES(
      4790,
      'Ararangua',
      144
);

INSERT INTO city
VALUES(
      4791,
      'Xapeco',
      144
);

INSERT INTO city
VALUES(
      4792,
      'Capanema',
      144
);

INSERT INTO city
VALUES(
      4793,
      'Baturite',
      144
);

INSERT INTO city
VALUES(
      4794,
      'Aripuana',
      144
);

INSERT INTO city
VALUES(
      4795,
      'Bom Jesus da Lapa',
      144
);

INSERT INTO city
VALUES(
      4796,
      'Carazinho',
      144
);

INSERT INTO city
VALUES(
      4797,
      'Cameta',
      144
);

INSERT INTO city
VALUES(
      4798,
      'Campo Murao',
      144
);

INSERT INTO city
VALUES(
      4799,
      'Aquidauana',
      144
);

INSERT INTO city
VALUES(
      4800,
      'Brasilia',
      144
);

INSERT INTO city
VALUES(
      4801,
      'Assis',
      144
);

INSERT INTO city
VALUES(
      4802,
      'Paragominas',
      144
);

INSERT INTO city
VALUES(
      4803,
      'Caceres',
      144
);

INSERT INTO city
VALUES(
      4804,
      'Bento Goncalves',
      144
);

INSERT INTO city
VALUES(
      4805,
      'Santo Andre',
      144
);

INSERT INTO city
VALUES(
      4806,
      'Bage',
      144
);

INSERT INTO city
VALUES(
      4807,
      'Caracarai',
      144
);

INSERT INTO city
VALUES(
      4808,
      'Concordia',
      144
);

INSERT INTO city
VALUES(
      4809,
      'Camaqua',
      144
);

INSERT INTO city
VALUES(
      4810,
      'Guaira',
      144
);

INSERT INTO city
VALUES(
      4811,
      'Jaragua do Sul',
      144
);

INSERT INTO city
VALUES(
      4812,
      'Aracatuba',
      144
);

INSERT INTO city
VALUES(
      4813,
      'Olinda',
      144
);

INSERT INTO city
VALUES(
      4814,
      'Recife',
      144
);

INSERT INTO city
VALUES(
      4815,
      'Natal',
      144
);

INSERT INTO city
VALUES(
      4816,
      'Presidente Prudente',
      144
);

INSERT INTO city
VALUES(
      4817,
      'Parnaiba',
      144
);

INSERT INTO city
VALUES(
      4818,
      'Crato',
      144
);

INSERT INTO city
VALUES(
      4819,
      'Santana do Livramento',
      144
);

INSERT INTO city
VALUES(
      4820,
      'Corumba',
      144
);

INSERT INTO city
VALUES(
      4821,
      'Abuna',
      144
);

INSERT INTO city
VALUES(
      4822,
      'Campo Grande',
      144
);

INSERT INTO city
VALUES(
      4823,
      'Itaituba',
      144
);

INSERT INTO city
VALUES(
      4824,
      'Joacaba',
      144
);

INSERT INTO city
VALUES(
      4825,
      'Rio Branco',
      144
);

INSERT INTO city
VALUES(
      4826,
      'Acarau',
      144
);

INSERT INTO city
VALUES(
      4827,
      'Pelotas',
      144
);

INSERT INTO city
VALUES(
      4828,
      'Manaus',
      144
);

INSERT INTO city
VALUES(
      4829,
      'Cachoeira do Sul',
      144
);

INSERT INTO city
VALUES(
      4830,
      'Jardim',
      144
);

INSERT INTO city
VALUES(
      4831,
      'Santa Maria',
      144
);

INSERT INTO city
VALUES(
      4832,
      'Rosario do Sul',
      144
);

INSERT INTO city
VALUES(
      4833,
      'Joinville',
      144
);

INSERT INTO city
VALUES(
      4834,
      'Ji-Parana',
      144
);

INSERT INTO city
VALUES(
      4835,
      'Arapongas',
      144
);

INSERT INTO city
VALUES(
      4836,
      'Dourados',
      144
);

INSERT INTO city
VALUES(
      4837,
      'Cacador',
      144
);

INSERT INTO city
VALUES(
      4838,
      'Jaguarao',
      144
);

INSERT INTO city
VALUES(
      4839,
      'Passo Fundo',
      144
);

INSERT INTO city
VALUES(
      4840,
      'Santa Vitoria do Palmar',
      144
);

INSERT INTO city
VALUES(
      4841,
      'Porto Alegre',
      144
);

INSERT INTO city
VALUES(
      4842,
      'Acu',
      144
);

INSERT INTO city
VALUES(
      4843,
      'Rio Grande',
      144
);

INSERT INTO city
VALUES(
      4844,
      'Sena Madureira',
      144
);

INSERT INTO city
VALUES(
      4845,
      'Sao Luiz Gonzaga',
      144
);

INSERT INTO city
VALUES(
      4846,
      'Tupa',
      144
);

INSERT INTO city
VALUES(
      4847,
      'Ponta Grossa',
      144
);

INSERT INTO city
VALUES(
      4848,
      'Palmas',
      144
);

INSERT INTO city
VALUES(
      4849,
      'Grajau',
      144
);

INSERT INTO city
VALUES(
      4850,
      'Sao Francisco do Sul',
      144
);

INSERT INTO city
VALUES(
      4851,
      'Caxias do Sul',
      144
);

INSERT INTO city
VALUES(
      4852,
      'Sorocaba',
      144
);

INSERT INTO city
VALUES(
      4853,
      'Rio Negro',
      144
);

INSERT INTO city
VALUES(
      4854,
      'Capitao Poco',
      144
);

INSERT INTO city
VALUES(
      4855,
      'Canoas',
      144
);

INSERT INTO city
VALUES(
      4856,
      'Granja',
      144
);

INSERT INTO city
VALUES(
      4857,
      'Sobral',
      144
);

INSERT INTO city
VALUES(
      4858,
      'Camocim',
      144
);

INSERT INTO city
VALUES(
      4859,
      'Almenara',
      144
);

INSERT INTO city
VALUES(
      4860,
      'Aracuai',
      144
);

INSERT INTO city
VALUES(
      4861,
      'Teofilo Otoni',
      144
);

INSERT INTO city
VALUES(
      4862,
      'Floriano',
      144
);

INSERT INTO city
VALUES(
      4863,
      'Colinas',
      144
);

INSERT INTO city
VALUES(
      4864,
      'Caxias',
      144
);

INSERT INTO city
VALUES(
      4865,
      'Pedreiras',
      144
);

INSERT INTO city
VALUES(
      4866,
      'Barra do Corda',
      144
);

INSERT INTO city
VALUES(
      4867,
      'Jacarezinho',
      144
);

INSERT INTO city
VALUES(
      4868,
      'Presidente Dutra',
      144
);

INSERT INTO city
VALUES(
      4869,
      'Coroata',
      144
);

INSERT INTO city
VALUES(
      4870,
      'Codo',
      144
);

INSERT INTO city
VALUES(
      4871,
      'Paulo Afonso',
      144
);

INSERT INTO city
VALUES(
      4872,
      'Palmeira dos Indios',
      144
);

INSERT INTO city
VALUES(
      4873,
      'Cuiaba',
      144
);

INSERT INTO city
VALUES(
      4874,
      'Tubarao',
      144
);

INSERT INTO city
VALUES(
      4875,
      'Vacaria',
      144
);

INSERT INTO city
VALUES(
      4876,
      'Criciuma',
      144
);

INSERT INTO city
VALUES(
      4877,
      'Campo Belo',
      144
);

INSERT INTO city
VALUES(
      4878,
      'Salinopolis',
      144
);

INSERT INTO city
VALUES(
      4879,
      'Guaxupe',
      144
);

INSERT INTO city
VALUES(
      4880,
      'Sete Lagoas',
      144
);

INSERT INTO city
VALUES(
      4881,
      'Itauna',
      144
);

INSERT INTO city
VALUES(
      4882,
      'Novo Airao',
      144
);

INSERT INTO city
VALUES(
      4883,
      'Tucurui',
      144
);

INSERT INTO city
VALUES(
      4884,
      'Varzea Grande',
      144
);

INSERT INTO city
VALUES(
      4885,
      'Formiga',
      144
);

INSERT INTO city
VALUES(
      4886,
      'Santa Ines',
      144
);

INSERT INTO city
VALUES(
      4887,
      'Divinopolis',
      144
);

INSERT INTO city
VALUES(
      4888,
      'Pirapora',
      144
);

INSERT INTO city
VALUES(
      4889,
      'Lavras',
      144
);

INSERT INTO city
VALUES(
      4890,
      'Obidos',
      144
);

INSERT INTO city
VALUES(
      4891,
      'Curvelo',
      144
);

INSERT INTO city
VALUES(
      4892,
      'Conceicao do Araguaia',
      144
);

INSERT INTO city
VALUES(
      4893,
      'Oriximina',
      144
);

INSERT INTO city
VALUES(
      4894,
      'Paracatu',
      144
);

INSERT INTO city
VALUES(
      4895,
      'Itaberai',
      144
);

INSERT INTO city
VALUES(
      4896,
      'Uberlandia',
      144
);

INSERT INTO city
VALUES(
      4897,
      'Araxa',
      144
);

INSERT INTO city
VALUES(
      4898,
      'Iguatu',
      144
);

INSERT INTO city
VALUES(
      4899,
      'Itumbiara',
      144
);

INSERT INTO city
VALUES(
      4900,
      'Lapa',
      144
);

INSERT INTO city
VALUES(
      4901,
      'Cristalina',
      144
);

INSERT INTO city
VALUES(
      4902,
      'Trindade',
      144
);

INSERT INTO city
VALUES(
      4903,
      'Inhumas',
      144
);

INSERT INTO city
VALUES(
      4904,
      'Goiania',
      144
);

INSERT INTO city
VALUES(
      4905,
      'Castro',
      144
);

INSERT INTO city
VALUES(
      4906,
      'Ituiutaba',
      144
);

INSERT INTO city
VALUES(
      4907,
      'Uberaba',
      144
);

INSERT INTO city
VALUES(
      4908,
      'Araguari',
      144
);

INSERT INTO city
VALUES(
      4909,
      'Anapolis',
      144
);

INSERT INTO city
VALUES(
      4910,
      'Pocos de Caldas',
      144
);

INSERT INTO city
VALUES(
      4911,
      'Sao Joao del Rei',
      144
);

INSERT INTO city
VALUES(
      4912,
      'Pires do Rio',
      144
);

INSERT INTO city
VALUES(
      4913,
      'Aracaju',
      144
);

INSERT INTO city
VALUES(
      4914,
      'Manicore',
      144
);

INSERT INTO city
VALUES(
      4915,
      'Pouso Alegre',
      144
);

INSERT INTO city
VALUES(
      4916,
      'Ariquemes',
      144
);

INSERT INTO city
VALUES(
      4917,
      'Morrinhos',
      144
);

INSERT INTO city
VALUES(
      4918,
      'Avare',
      144
);

INSERT INTO city
VALUES(
      4919,
      'Barretos',
      144
);

INSERT INTO city
VALUES(
      4920,
      'Batatais',
      144
);

INSERT INTO city
VALUES(
      4921,
      'Bauru',
      144
);

INSERT INTO city
VALUES(
      4922,
      'Botucatu',
      144
);

INSERT INTO city
VALUES(
      4923,
      'Catalao',
      144
);

INSERT INTO city
VALUES(
      4924,
      'Irati',
      144
);

INSERT INTO city
VALUES(
      4925,
      'Santa Cruz',
      144
);

INSERT INTO city
VALUES(
      4926,
      'Tucano',
      144
);

INSERT INTO city
VALUES(
      4927,
      'Timbauba',
      144
);

INSERT INTO city
VALUES(
      4928,
      'Passos',
      144
);

INSERT INTO city
VALUES(
      4929,
      'Manacapuru',
      144
);

INSERT INTO city
VALUES(
      4930,
      'Barreiros',
      144
);

INSERT INTO city
VALUES(
      4931,
      'Pimenta Bueno',
      144
);

INSERT INTO city
VALUES(
      4932,
      'Vilhena',
      144
);

INSERT INTO city
VALUES(
      4933,
      'Pinheiro',
      144
);

INSERT INTO city
VALUES(
      4934,
      'Belo Horizonte',
      144
);

INSERT INTO city
VALUES(
      4935,
      'Carpina',
      144
);

INSERT INTO city
VALUES(
      4936,
      'Serrinha',
      144
);

INSERT INTO city
VALUES(
      4937,
      'Arapiraca',
      144
);

INSERT INTO city
VALUES(
      4938,
      'Paracuru',
      144
);

INSERT INTO city
VALUES(
      4939,
      'Telemaco Borba',
      144
);

INSERT INTO city
VALUES(
      4940,
      'Penedo',
      144
);

INSERT INTO city
VALUES(
      4941,
      'Xique-Xique',
      144
);

INSERT INTO city
VALUES(
      4942,
      'Barra Mansa',
      144
);

INSERT INTO city
VALUES(
      4943,
      'Alagoinhas',
      144
);

INSERT INTO city
VALUES(
      4944,
      'Remanso',
      144
);

INSERT INTO city
VALUES(
      4945,
      'Maceio',
      144
);

INSERT INTO city
VALUES(
      4946,
      'Frutal',
      144
);

INSERT INTO city
VALUES(
      4947,
      'Irece',
      144
);

INSERT INTO city
VALUES(
      4948,
      'Pontes e Lacerda',
      144
);

INSERT INTO city
VALUES(
      4949,
      'Volta Redonda',
      144
);

INSERT INTO city
VALUES(
      4950,
      'Senhor do Bonfim',
      144
);

INSERT INTO city
VALUES(
      4951,
      'Garanhuns',
      144
);

INSERT INTO city
VALUES(
      4952,
      'Rio Largo',
      144
);

INSERT INTO city
VALUES(
      4953,
      'Caninde',
      144
);

INSERT INTO city
VALUES(
      4954,
      'Feira de Santana',
      144
);

INSERT INTO city
VALUES(
      4955,
      'Paranagua',
      144
);

INSERT INTO city
VALUES(
      4956,
      'Mineiros',
      144
);

INSERT INTO city
VALUES(
      4957,
      'Crato',
      144
);

INSERT INTO city
VALUES(
      4958,
      'Juazeiro do Norte',
      144
);

INSERT INTO city
VALUES(
      4959,
      'Jatai',
      144
);

INSERT INTO city
VALUES(
      4960,
      'Canavieiras',
      144
);

INSERT INTO city
VALUES(
      4961,
      'Rondonopolis',
      144
);

INSERT INTO city
VALUES(
      4962,
      'Paranaiba',
      144
);

INSERT INTO city
VALUES(
      4963,
      'Sao Jose dos Pinhais',
      144
);

INSERT INTO city
VALUES(
      4964,
      'Rio Verde',
      144
);

INSERT INTO city
VALUES(
      4965,
      'Natal',
      144
);

INSERT INTO city
VALUES(
      4966,
      'Joao Pessoa',
      144
);

INSERT INTO city
VALUES(
      4967,
      'Goiana',
      144
);

INSERT INTO city
VALUES(
      4968,
      'Apodi',
      144
);

INSERT INTO city
VALUES(
      4969,
      'Mato Grosso',
      144
);

INSERT INTO city
VALUES(
      4970,
      'Itambe',
      144
);

INSERT INTO city
VALUES(
      4971,
      'Vitoria da Conquista',
      144
);

INSERT INTO city
VALUES(
      4972,
      'Barreiras',
      144
);

INSERT INTO city
VALUES(
      4973,
      'Januaria',
      144
);

INSERT INTO city
VALUES(
      4974,
      'Ubaitaba',
      144
);

INSERT INTO city
VALUES(
      4975,
      'Jaguaquara',
      144
);

INSERT INTO city
VALUES(
      4976,
      'Jequie',
      144
);

INSERT INTO city
VALUES(
      4977,
      'Janauba',
      144
);

INSERT INTO city
VALUES(
      4978,
      'Santa Maria da Vitoria',
      144
);

INSERT INTO city
VALUES(
      4979,
      'Guanambi',
      144
);

INSERT INTO city
VALUES(
      4980,
      'Registro',
      144
);

INSERT INTO city
VALUES(
      4981,
      'Iguape',
      144
);

INSERT INTO city
VALUES(
      4982,
      'Ilheus',
      144
);

INSERT INTO city
VALUES(
      4983,
      'Itabuna',
      144
);

INSERT INTO city
VALUES(
      4984,
      'Ipora',
      144
);

INSERT INTO city
VALUES(
      4985,
      'Iturama',
      144
);

INSERT INTO city
VALUES(
      4986,
      'Caico',
      144
);

INSERT INTO city
VALUES(
      4987,
      'Valenca',
      144
);

INSERT INTO city
VALUES(
      4988,
      'Caruaru',
      144
);

INSERT INTO city
VALUES(
      4989,
      'Campina Grande',
      144
);

INSERT INTO city
VALUES(
      4990,
      'Nova Cruz',
      144
);

INSERT INTO city
VALUES(
      4991,
      'Fortaleza',
      144
);

INSERT INTO city
VALUES(
      4992,
      'Itapetinga',
      144
);

INSERT INTO city
VALUES(
      4993,
      'Russas',
      144
);

INSERT INTO city
VALUES(
      4994,
      'Patos',
      144
);

INSERT INTO city
VALUES(
      4995,
      'Pindamonhangaba',
      144
);

INSERT INTO city
VALUES(
      4996,
      'Ipu',
      144
);

INSERT INTO city
VALUES(
      4997,
      'Itapeva',
      144
);

INSERT INTO city
VALUES(
      4998,
      'Itapetininga',
      144
);

INSERT INTO city
VALUES(
      4999,
      'Itu',
      144
);

INSERT INTO city
VALUES(
      5000,
      'Campo Maior',
      144
);

INSERT INTO city
VALUES(
      5001,
      'Picos',
      144
);

INSERT INTO city
VALUES(
      5002,
      'Piripiri',
      144
);

INSERT INTO city
VALUES(
      5003,
      'Campinas',
      144
);

INSERT INTO city
VALUES(
      5004,
      'Catanduva',
      144
);

INSERT INTO city
VALUES(
      5005,
      'Timon',
      144
);

INSERT INTO city
VALUES(
      5006,
      'Teresina',
      144
);

INSERT INTO city
VALUES(
      5007,
      'Canela',
      144
);

INSERT INTO city
VALUES(
      5008,
      'Barra do Bugres',
      144
);

INSERT INTO city
VALUES(
      5009,
      'Governador Valadares',
      144
);

INSERT INTO city
VALUES(
      5010,
      'Guanhaes',
      144
);

INSERT INTO city
VALUES(
      5011,
      'Salgueiro',
      144
);

INSERT INTO city
VALUES(
      5012,
      'Linhares',
      144
);

INSERT INTO city
VALUES(
      5013,
      'Blumenau',
      144
);

INSERT INTO city
VALUES(
      5014,
      'Santa Cruz Cabralia',
      144
);

INSERT INTO city
VALUES(
      5015,
      'Sao Jose de Ribamar',
      144
);

INSERT INTO city
VALUES(
      5016,
      'Sao Mateus',
      144
);

INSERT INTO city
VALUES(
      5017,
      'Sao Luis',
      144
);

INSERT INTO city
VALUES(
      5018,
      'Rosario',
      144
);

INSERT INTO city
VALUES(
      5019,
      'Porto Seguro',
      144
);

INSERT INTO city
VALUES(
      5020,
      'Nanuque',
      144
);

INSERT INTO city
VALUES(
      5021,
      'Alvorada',
      144
);

INSERT INTO city
VALUES(
      5022,
      'Ipatinga',
      144
);

INSERT INTO city
VALUES(
      5023,
      'Nova Lima',
      144
);

INSERT INTO city
VALUES(
      5024,
      'Diamantina',
      144
);

INSERT INTO city
VALUES(
      5025,
      'Itapecuru Mirim',
      144
);

INSERT INTO city
VALUES(
      5026,
      'Bocaiuva',
      144
);

INSERT INTO city
VALUES(
      5027,
      'Nova Vicosa',
      144
);

INSERT INTO city
VALUES(
      5028,
      'Itamaraju',
      144
);

INSERT INTO city
VALUES(
      5029,
      'Montes Claros',
      144
);

INSERT INTO city
VALUES(
      5030,
      'Caratinga',
      144
);

INSERT INTO city
VALUES(
      5031,
      'Uba',
      144
);

INSERT INTO city
VALUES(
      5032,
      'Alta Floresta',
      144
);

INSERT INTO city
VALUES(
      5033,
      'Ponte Nova',
      144
);

INSERT INTO city
VALUES(
      5034,
      'Castanhal',
      144
);

INSERT INTO city
VALUES(
      5035,
      'Conselheiro Lafaiete',
      144
);

INSERT INTO city
VALUES(
      5036,
      'Juiz de Fora',
      144
);

INSERT INTO city
VALUES(
      5037,
      'Leopoldina',
      144
);

INSERT INTO city
VALUES(
      5038,
      'Cachoeiro de Itapemirim',
      144
);

INSERT INTO city
VALUES(
      5039,
      'Barbacena',
      144
);

INSERT INTO city
VALUES(
      5040,
      'Florianopolis',
      144
);

INSERT INTO city
VALUES(
      5041,
      'Porto Nacional',
      144
);

INSERT INTO city
VALUES(
      5042,
      'Principe da Beira',
      144
);

INSERT INTO city
VALUES(
      5043,
      'Itajai',
      144
);

INSERT INTO city
VALUES(
      5044,
      'Belem',
      144
);

INSERT INTO city
VALUES(
      5045,
      'Palmas',
      144
);

INSERT INTO city
VALUES(
      5046,
      'Xinguara',
      144
);

INSERT INTO city
VALUES(
      5047,
      'Braganca',
      144
);

INSERT INTO city
VALUES(
      5048,
      'Vitoria',
      144
);

INSERT INTO city
VALUES(
      5049,
      'Parintins',
      144
);

INSERT INTO city
VALUES(
      5050,
      'Viseu',
      144
);

INSERT INTO city
VALUES(
      5051,
      'Colider',
      144
);

INSERT INTO city
VALUES(
      5052,
      'Sinop',
      144
);

INSERT INTO city
VALUES(
      5053,
      'Campos',
      144
);

INSERT INTO city
VALUES(
      5054,
      'Petrolina',
      144
);

INSERT INTO city
VALUES(
      5055,
      'Juazeiro',
      144
);

INSERT INTO city
VALUES(
      5056,
      'Brumado',
      144
);

INSERT INTO city
VALUES(
      5057,
      'Osorio',
      144
);

INSERT INTO city
VALUES(
      5058,
      'Rio de Janeiro',
      144
);

INSERT INTO city
VALUES(
      5059,
      'Breves',
      144
);

INSERT INTO city
VALUES(
      5060,
      'Jaboticabal',
      144
);

INSERT INTO city
VALUES(
      5061,
      'Lajes',
      144
);

INSERT INTO city
VALUES(
      5062,
      'Araguaina',
      144
);

INSERT INTO city
VALUES(
      5063,
      'Maraba',
      144
);

INSERT INTO city
VALUES(
      5064,
      'Itupiranga',
      144
);

INSERT INTO city
VALUES(
      5065,
      'Barras',
      144
);

INSERT INTO city
VALUES(
      5066,
      'Rolim de Moura',
      144
);

INSERT INTO city
VALUES(
      5067,
      'Sao Jose dos Campos',
      144
);

INSERT INTO city
VALUES(
      5068,
      'Gurupi',
      144
);

INSERT INTO city
VALUES(
      5069,
      'Itaberaba',
      144
);

INSERT INTO city
VALUES(
      5070,
      'Macae',
      144
);

INSERT INTO city
VALUES(
      5071,
      'Miracema',
      144
);

INSERT INTO city
VALUES(
      5072,
      'Niteroi',
      144
);

INSERT INTO city
VALUES(
      5073,
      'Marilia',
      144
);

INSERT INTO city
VALUES(
      5074,
      'Franca',
      144
);

INSERT INTO city
VALUES(
      5075,
      'Maues',
      144
);

INSERT INTO city
VALUES(
      5076,
      'Guaratingueta',
      144
);

INSERT INTO city
VALUES(
      5077,
      'Santarem',
      144
);

INSERT INTO city
VALUES(
      5078,
      'Garca',
      144
);

INSERT INTO city
VALUES(
      5079,
      'Ourinhos',
      144
);

INSERT INTO city
VALUES(
      5080,
      'Jau',
      144
);

INSERT INTO city
VALUES(
      5081,
      'Tatui',
      144
);

INSERT INTO city
VALUES(
      5082,
      'Taubate',
      144
);

INSERT INTO city
VALUES(
      5083,
      'Santos',
      144
);

INSERT INTO city
VALUES(
      5084,
      'Sao Joao da Boa Vista',
      144
);

INSERT INTO city
VALUES(
      5085,
      'Barra do Garcas',
      144
);

INSERT INTO city
VALUES(
      5086,
      'Sao Jose do Rio Preto',
      144
);

INSERT INTO city
VALUES(
      5087,
      'Jundiai',
      144
);

INSERT INTO city
VALUES(
      5088,
      'Coari',
      144
);

INSERT INTO city
VALUES(
      5089,
      'Ribeirao Preto',
      144
);

INSERT INTO city
VALUES(
      5090,
      'Novo Horizonte',
      144
);

INSERT INTO city
VALUES(
      5091,
      'Abaetetuba',
      144
);

INSERT INTO city
VALUES(
      5092,
      'Tocantinopolis',
      144
);

INSERT INTO city
VALUES(
      5093,
      'Amapa',
      144
);

INSERT INTO city
VALUES(
      5094,
      'Vila Velha',
      144
);

INSERT INTO city
VALUES(
      5095,
      'Sao Cabriel da Cachoeira',
      144
);

INSERT INTO city
VALUES(
      5096,
      'Tefe',
      144
);

INSERT INTO city
VALUES(
      5097,
      'Fonte Boa',
      144
);

INSERT INTO city
VALUES(
      5098,
      'Imperatriz',
      144
);

INSERT INTO city
VALUES(
      5099,
      'Niquelandia',
      144
);

INSERT INTO city
VALUES(
      5100,
      'Goianesia',
      144
);

INSERT INTO city
VALUES(
      5101,
      'Ceres',
      144
);

INSERT INTO city
VALUES(
      5102,
      'Portel',
      144
);

INSERT INTO city
VALUES(
      5103,
      'Canoinhas',
      144
);

INSERT INTO city
VALUES(
      5104,
      'Altamira',
      144
);

INSERT INTO city
VALUES(
      5105,
      'Boa Vista',
      144
);

INSERT INTO city
VALUES(
      5106,
      'Sao Paulo',
      144
);

INSERT INTO city
VALUES(
      5107,
      'Macapa',
      144
);

INSERT INTO city
VALUES(
      5108,
      'Itacoatiara',
      144
);

INSERT INTO city
VALUES(
      5109,
      'Alenquer',
      144
);

INSERT INTO city
VALUES(
      5110,
      'Porto Santana',
      144
);

INSERT INTO city
VALUES(
      5111,
      'Barcelos',
      144
);

INSERT INTO city
VALUES(
      5112,
      'Tonantins',
      144
);

INSERT INTO city
VALUES(
      5113,
      'Imbituba',
      144
);

INSERT INTO city
VALUES(
      5114,
      'Balsas',
      144
);

INSERT INTO city
VALUES(
      5115,
      'Eirunepe',
      144
);

INSERT INTO city
VALUES(
      5116,
      'Porto Velho',
      144
);

INSERT INTO city
VALUES(
      5117,
      'Brusque',
      144
);

INSERT INTO city
VALUES(
      5118,
      'Americana',
      144
);

INSERT INTO city
VALUES(
      5119,
      'Limeira',
      144
);

INSERT INTO city
VALUES(
      5120,
      'Piracicaba',
      144
);

INSERT INTO city
VALUES(
      5121,
      'Pirassununga',
      144
);

INSERT INTO city
VALUES(
      5122,
      'Rio Claro',
      144
);

INSERT INTO city
VALUES(
      5123,
      'Sao Carlos',
      144
);

INSERT INTO city
VALUES(
      5124,
      'Tres Lagoas',
      144
);

INSERT INTO city
VALUES(
      5125,
      'Andradina',
      144
);

INSERT INTO city
VALUES(
      5126,
      'Braganca Paulista',
      144
);

INSERT INTO city
VALUES(
      5127,
      'Nova Friburgo',
      144
);

INSERT INTO city
VALUES(
      5128,
      'Cabo Frio',
      144
);

INSERT INTO city
VALUES(
      5129,
      'Nova Iguacu',
      144
);

INSERT INTO city
VALUES(
      5130,
      'Petropolis',
      144
);

INSERT INTO country
VALUES(
      145,
      'Bahama'
);

INSERT INTO city
VALUES(
      5131,
      'Nassau',
      145
);

INSERT INTO city
VALUES(
      5132,
      'Freeport',
      145
);

INSERT INTO country
VALUES(
      146,
      'Bhutan'
);

INSERT INTO city
VALUES(
      5133,
      'Mongar',
      146
);

INSERT INTO city
VALUES(
      5134,
      'Pemagatshel',
      146
);

INSERT INTO city
VALUES(
      5135,
      'Samdrup Jongkhar',
      146
);

INSERT INTO city
VALUES(
      5136,
      'Gasa',
      146
);

INSERT INTO city
VALUES(
      5137,
      'Thimphu',
      146
);

INSERT INTO city
VALUES(
      5138,
      'Trashigang',
      146
);

INSERT INTO city
VALUES(
      5139,
      'Lhuentse',
      146
);

INSERT INTO city
VALUES(
      5140,
      'Trashi Yangtse',
      146
);

INSERT INTO city
VALUES(
      5141,
      'Wangdue Prodrang',
      146
);

INSERT INTO city
VALUES(
      5142,
      'Punakha',
      146
);

INSERT INTO city
VALUES(
      5143,
      'Haa',
      146
);

INSERT INTO city
VALUES(
      5144,
      'Trongsa',
      146
);

INSERT INTO city
VALUES(
      5145,
      'Zhemgang',
      146
);

INSERT INTO city
VALUES(
      5146,
      'Jakar',
      146
);

INSERT INTO city
VALUES(
      5147,
      'Sarpang',
      146
);

INSERT INTO city
VALUES(
      5148,
      'Tsirang',
      146
);

INSERT INTO city
VALUES(
      5149,
      'Paro',
      146
);

INSERT INTO city
VALUES(
      5150,
      'Samtse',
      146
);

INSERT INTO city
VALUES(
      5151,
      'Daga',
      146
);

INSERT INTO city
VALUES(
      5152,
      'Tsimasham',
      146
);

INSERT INTO country
VALUES(
      147,
      'Botswana'
);

INSERT INTO city
VALUES(
      5153,
      'Mohembo',
      147
);

INSERT INTO city
VALUES(
      5154,
      'Ghanzi',
      147
);

INSERT INTO city
VALUES(
      5155,
      'Nokaneng',
      147
);

INSERT INTO city
VALUES(
      5156,
      'Lokhwabe',
      147
);

INSERT INTO city
VALUES(
      5157,
      'Lehututu',
      147
);

INSERT INTO city
VALUES(
      5158,
      'Tshabong',
      147
);

INSERT INTO city
VALUES(
      5159,
      'Tsau',
      147
);

INSERT INTO city
VALUES(
      5160,
      'Mochudi',
      147
);

INSERT INTO city
VALUES(
      5161,
      'Nata',
      147
);

INSERT INTO city
VALUES(
      5162,
      'Maun',
      147
);

INSERT INTO city
VALUES(
      5163,
      'Serowe',
      147
);

INSERT INTO city
VALUES(
      5164,
      'Kanye',
      147
);

INSERT INTO city
VALUES(
      5165,
      'Mahalapye',
      147
);

INSERT INTO city
VALUES(
      5166,
      'Palapye',
      147
);

INSERT INTO city
VALUES(
      5167,
      'Molepolole',
      147
);

INSERT INTO city
VALUES(
      5168,
      'Mopipi',
      147
);

INSERT INTO city
VALUES(
      5169,
      'Kasane',
      147
);

INSERT INTO city
VALUES(
      5170,
      'Sowa Town',
      147
);

INSERT INTO city
VALUES(
      5171,
      'Ramotswa',
      147
);

INSERT INTO city
VALUES(
      5172,
      'Masunga',
      147
);

INSERT INTO city
VALUES(
      5173,
      'Gaborone',
      147
);

INSERT INTO city
VALUES(
      5174,
      'Jwaneng',
      147
);

INSERT INTO city
VALUES(
      5175,
      'Lobatse',
      147
);

INSERT INTO city
VALUES(
      5176,
      'Selibe Phikwe',
      147
);

INSERT INTO city
VALUES(
      5177,
      'Francistown',
      147
);

INSERT INTO country
VALUES(
      148,
      'Belarus'
);

INSERT INTO city
VALUES(
      5178,
      'Minsk',
      148
);

INSERT INTO city
VALUES(
      5179,
      'Brest',
      148
);

INSERT INTO city
VALUES(
      5180,
      'Lida',
      148
);

INSERT INTO city
VALUES(
      5181,
      'Baranavichy',
      148
);

INSERT INTO city
VALUES(
      5182,
      'Mazyr',
      148
);

INSERT INTO city
VALUES(
      5183,
      'Hrodna',
      148
);

INSERT INTO city
VALUES(
      5184,
      'Pinsk',
      148
);

INSERT INTO city
VALUES(
      5185,
      'Maladzyechna',
      148
);

INSERT INTO city
VALUES(
      5186,
      'Barysaw',
      148
);

INSERT INTO city
VALUES(
      5187,
      'Polatsk',
      148
);

INSERT INTO city
VALUES(
      5188,
      'Orsha',
      148
);

INSERT INTO city
VALUES(
      5189,
      'Babruysk',
      148
);

INSERT INTO city
VALUES(
      5190,
      'Homyel',
      148
);

INSERT INTO city
VALUES(
      5191,
      'Mahilyow',
      148
);

INSERT INTO city
VALUES(
      5192,
      'Vitsyebsk',
      148
);

INSERT INTO country
VALUES(
      149,
      'Belize'
);

INSERT INTO city
VALUES(
      5193,
      'Belmopan',
      149
);

INSERT INTO city
VALUES(
      5194,
      'Corozal',
      149
);

INSERT INTO city
VALUES(
      5195,
      'Belize City',
      149
);

INSERT INTO city
VALUES(
      5196,
      'Dangriga',
      149
);

INSERT INTO city
VALUES(
      5197,
      'Orange Walk',
      149
);

INSERT INTO city
VALUES(
      5198,
      'Punta Gorda',
      149
);

INSERT INTO city
VALUES(
      5199,
      'El Cayo',
      149
);

INSERT INTO country
VALUES(
      150,
      'Canada'
);

INSERT INTO city
VALUES(
      5200,
      'Selkirk',
      150
);

INSERT INTO city
VALUES(
      5201,
      'Trepassey',
      150
);

INSERT INTO city
VALUES(
      5202,
      'Schefferville',
      150
);

INSERT INTO city
VALUES(
      5203,
      'Whitehorse',
      150
);

INSERT INTO city
VALUES(
      5204,
      'Trout River',
      150
);

INSERT INTO city
VALUES(
      5205,
      'Yorkton',
      150
);

INSERT INTO city
VALUES(
      5206,
      'Antigonish',
      150
);

INSERT INTO city
VALUES(
      5207,
      'Gander',
      150
);

INSERT INTO city
VALUES(
      5208,
      'Berens River',
      150
);

INSERT INTO city
VALUES(
      5209,
      'Port-Menier',
      150
);

INSERT INTO city
VALUES(
      5210,
      'Wetaskiwin',
      150
);

INSERT INTO city
VALUES(
      5211,
      'Shamattawa',
      150
);

INSERT INTO city
VALUES(
      5212,
      'Steinbach',
      150
);

INSERT INTO city
VALUES(
      5213,
      'Thunder Bay',
      150
);

INSERT INTO city
VALUES(
      5214,
      'Oshawa',
      150
);

INSERT INTO city
VALUES(
      5215,
      'Chicoutimi',
      150
);

INSERT INTO city
VALUES(
      5216,
      'Melville',
      150
);

INSERT INTO city
VALUES(
      5217,
      'Brooks',
      150
);

INSERT INTO city
VALUES(
      5218,
      'Dauphin',
      150
);

INSERT INTO city
VALUES(
      5219,
      'Smithers',
      150
);

INSERT INTO city
VALUES(
      5220,
      'Terrace',
      150
);

INSERT INTO city
VALUES(
      5221,
      'Lutselke',
      150
);

INSERT INTO city
VALUES(
      5222,
      'Resolute',
      150
);

INSERT INTO city
VALUES(
      5223,
      'Quesnel',
      150
);

INSERT INTO city
VALUES(
      5224,
      'Island Lake',
      150
);

INSERT INTO city
VALUES(
      5225,
      'Halifax',
      150
);

INSERT INTO city
VALUES(
      5226,
      'Watson Lake',
      150
);

INSERT INTO city
VALUES(
      5227,
      'Sydney',
      150
);

INSERT INTO city
VALUES(
      5228,
      'Dawson Creek',
      150
);

INSERT INTO city
VALUES(
      5229,
      'Uranium City',
      150
);

INSERT INTO city
VALUES(
      5230,
      'Timmins',
      150
);

INSERT INTO city
VALUES(
      5231,
      'Saskatoon',
      150
);

INSERT INTO city
VALUES(
      5232,
      'Iqaluit',
      150
);

INSERT INTO city
VALUES(
      5233,
      'Alert',
      150
);

INSERT INTO city
VALUES(
      5234,
      'Thessalon',
      150
);

INSERT INTO city
VALUES(
      5235,
      'Yellowknife',
      150
);

INSERT INTO city
VALUES(
      5236,
      'Camrose',
      150
);

INSERT INTO city
VALUES(
      5237,
      'Campbell River',
      150
);

INSERT INTO city
VALUES(
      5238,
      'Revelstoke',
      150
);

INSERT INTO city
VALUES(
      5239,
      'Meadow Lake',
      150
);

INSERT INTO city
VALUES(
      5240,
      'Atikokan',
      150
);

INSERT INTO city
VALUES(
      5241,
      'Creston',
      150
);

INSERT INTO city
VALUES(
      5242,
      'Gillam',
      150
);

INSERT INTO city
VALUES(
      5243,
      'Cranbrook',
      150
);

INSERT INTO city
VALUES(
      5244,
      'Little Current',
      150
);

INSERT INTO city
VALUES(
      5245,
      'Calgary',
      150
);

INSERT INTO city
VALUES(
      5246,
      'Big Beaver House',
      150
);

INSERT INTO city
VALUES(
      5247,
      'Parry Sound',
      150
);

INSERT INTO city
VALUES(
      5248,
      'Kamloops',
      150
);

INSERT INTO city
VALUES(
      5249,
      'Dolbeau',
      150
);

INSERT INTO city
VALUES(
      5250,
      'St. Johnas',
      150
);

INSERT INTO city
VALUES(
      5251,
      'Lansdowne House',
      150
);

INSERT INTO city
VALUES(
      5252,
      'Paulatuk',
      150
);

INSERT INTO city
VALUES(
      5253,
      'Attawapiskat',
      150
);

INSERT INTO city
VALUES(
      5254,
      'Rimouski',
      150
);

INSERT INTO city
VALUES(
      5255,
      'Grand Prairie',
      150
);

INSERT INTO city
VALUES(
      5256,
      'La Sarre',
      150
);

INSERT INTO city
VALUES(
      5257,
      'Mingan',
      150
);

INSERT INTO city
VALUES(
      5258,
      'Prince Albert',
      150
);

INSERT INTO city
VALUES(
      5259,
      'Moose Jaw',
      150
);

INSERT INTO city
VALUES(
      5260,
      'Powell River',
      150
);

INSERT INTO city
VALUES(
      5261,
      'Pangnirtung',
      150
);

INSERT INTO city
VALUES(
      5262,
      'Nelson',
      150
);

INSERT INTO city
VALUES(
      5263,
      'Peace River',
      150
);

INSERT INTO city
VALUES(
      5264,
      'Cobalt',
      150
);

INSERT INTO city
VALUES(
      5265,
      'New Glasgow',
      150
);

INSERT INTO city
VALUES(
      5266,
      'Arctic Bay',
      150
);

INSERT INTO city
VALUES(
      5267,
      'Burwash Landing',
      150
);

INSERT INTO city
VALUES(
      5268,
      'Saint-Georges',
      150
);

INSERT INTO city
VALUES(
      5269,
      'Vancouver',
      150
);

INSERT INTO city
VALUES(
      5270,
      'Medicine Hat',
      150
);

INSERT INTO city
VALUES(
      5271,
      'Port Hope Simpson',
      150
);

INSERT INTO city
VALUES(
      5272,
      'Deer Lake',
      150
);

INSERT INTO city
VALUES(
      5273,
      'Vegreville',
      150
);

INSERT INTO city
VALUES(
      5274,
      'Bella Bella',
      150
);

INSERT INTO city
VALUES(
      5275,
      'Rankin Inlet',
      150
);

INSERT INTO city
VALUES(
      5276,
      'Owen Sound',
      150
);

INSERT INTO city
VALUES(
      5277,
      'Lac La Biche',
      150
);

INSERT INTO city
VALUES(
      5278,
      'Hopedale',
      150
);

INSERT INTO city
VALUES(
      5279,
      'Norway House',
      150
);

INSERT INTO city
VALUES(
      5280,
      'Coral Harbour',
      150
);

INSERT INTO city
VALUES(
      5281,
      'Kugluktuk',
      150
);

INSERT INTO city
VALUES(
      5282,
      'Norman Wells',
      150
);

INSERT INTO city
VALUES(
      5283,
      'Fort Resolution',
      150
);

INSERT INTO city
VALUES(
      5284,
      'Fort McPherson',
      150
);

INSERT INTO city
VALUES(
      5285,
      'Forteau',
      150
);

INSERT INTO city
VALUES(
      5286,
      'Kuujjuaq',
      150
);

INSERT INTO city
VALUES(
      5287,
      'Cape Dorset',
      150
);

INSERT INTO city
VALUES(
      5288,
      'Cartwright',
      150
);

INSERT INTO city
VALUES(
      5289,
      'Flin Flon',
      150
);

INSERT INTO city
VALUES(
      5290,
      'Holman',
      150
);

INSERT INTO city
VALUES(
      5291,
      'Pembroke',
      150
);

INSERT INTO city
VALUES(
      5292,
      'Baker Lake',
      150
);

INSERT INTO city
VALUES(
      5293,
      'Moosonee',
      150
);

INSERT INTO city
VALUES(
      5294,
      'Dryden',
      150
);

INSERT INTO city
VALUES(
      5295,
      'Corner Brook',
      150
);

INSERT INTO city
VALUES(
      5296,
      'Kelowna',
      150
);

INSERT INTO city
VALUES(
      5297,
      'Fort Smith',
      150
);

INSERT INTO city
VALUES(
      5298,
      'Fort Severn',
      150
);

INSERT INTO city
VALUES(
      5299,
      'Mont-Laurier',
      150
);

INSERT INTO city
VALUES(
      5300,
      'Channel-Port aux Basques',
      150
);

INSERT INTO city
VALUES(
      5301,
      'Kindersley',
      150
);

INSERT INTO city
VALUES(
      5302,
      'Igloolik',
      150
);

INSERT INTO city
VALUES(
      5303,
      'Hudson Bay',
      150
);

INSERT INTO city
VALUES(
      5304,
      'Courtenay',
      150
);

INSERT INTO city
VALUES(
      5305,
      'Mistassini',
      150
);

INSERT INTO city
VALUES(
      5306,
      'Kingston',
      150
);

INSERT INTO city
VALUES(
      5307,
      'Eastmain',
      150
);

INSERT INTO city
VALUES(
      5308,
      'Baie-Comeau',
      150
);

INSERT INTO city
VALUES(
      5309,
      'North Bay',
      150
);

INSERT INTO city
VALUES(
      5310,
      'North Battleford',
      150
);

INSERT INTO city
VALUES(
      5311,
      'Grise Fiord',
      150
);

INSERT INTO city
VALUES(
      5312,
      'Hay River',
      150
);

INSERT INTO city
VALUES(
      5313,
      'Stony Rapids',
      150
);

INSERT INTO city
VALUES(
      5314,
      'Hinton',
      150
);

INSERT INTO city
VALUES(
      5315,
      'Toronto',
      150
);

INSERT INTO city
VALUES(
      5316,
      'Edmonton',
      150
);

INSERT INTO city
VALUES(
      5317,
      'Gjoa Haven',
      150
);

INSERT INTO city
VALUES(
      5318,
      'Fort Simpson',
      150
);

INSERT INTO city
VALUES(
      5319,
      'Repulse Bay',
      150
);

INSERT INTO city
VALUES(
      5320,
      'Lethbridge',
      150
);

INSERT INTO city
VALUES(
      5321,
      'Sudbury',
      150
);

INSERT INTO city
VALUES(
      5322,
      'Swift Current',
      150
);

INSERT INTO city
VALUES(
      5323,
      'Regina',
      150
);

INSERT INTO city
VALUES(
      5324,
      'Cornwall',
      150
);

INSERT INTO city
VALUES(
      5325,
      'Taloyoak',
      150
);

INSERT INTO city
VALUES(
      5326,
      'Tuktoyaktuk',
      150
);

INSERT INTO city
VALUES(
      5327,
      'Deer Lake',
      150
);

INSERT INTO city
VALUES(
      5328,
      'London',
      150
);

INSERT INTO city
VALUES(
      5329,
      'Natashquan',
      150
);

INSERT INTO city
VALUES(
      5330,
      'Cap-Chat',
      150
);

INSERT INTO city
VALUES(
      5331,
      'Orillia',
      150
);

INSERT INTO city
VALUES(
      5332,
      'Kenora',
      150
);

INSERT INTO city
VALUES(
      5333,
      'Barrie',
      150
);

INSERT INTO city
VALUES(
      5334,
      'Sherbrooke',
      150
);

INSERT INTO city
VALUES(
      5335,
      'St. Anthony',
      150
);

INSERT INTO city
VALUES(
      5336,
      'Rigolet',
      150
);

INSERT INTO city
VALUES(
      5337,
      'Fort Good Hope',
      150
);

INSERT INTO city
VALUES(
      5338,
      'La Scie',
      150
);

INSERT INTO city
VALUES(
      5339,
      'Fort St. John',
      150
);

INSERT INTO city
VALUES(
      5340,
      'Marathon',
      150
);

INSERT INTO city
VALUES(
      5341,
      'Gaspe',
      150
);

INSERT INTO city
VALUES(
      5342,
      'Nelson House',
      150
);

INSERT INTO city
VALUES(
      5343,
      'Lillooet',
      150
);

INSERT INTO city
VALUES(
      5344,
      'Fort McMurray',
      150
);

INSERT INTO city
VALUES(
      5345,
      'Jasper',
      150
);

INSERT INTO city
VALUES(
      5346,
      'Buchans',
      150
);

INSERT INTO city
VALUES(
      5347,
      'Stettler',
      150
);

INSERT INTO city
VALUES(
      5348,
      'La Ronge',
      150
);

INSERT INTO city
VALUES(
      5349,
      'Brochet',
      150
);

INSERT INTO city
VALUES(
      5350,
      'Baddeck',
      150
);

INSERT INTO city
VALUES(
      5351,
      'Pond Inlet',
      150
);

INSERT INTO city
VALUES(
      5352,
      'St-Augustin',
      150
);

INSERT INTO city
VALUES(
      5353,
      'Gimli',
      150
);

INSERT INTO city
VALUES(
      5354,
      'Red Lake',
      150
);

INSERT INTO city
VALUES(
      5355,
      'Stephenville',
      150
);

INSERT INTO city
VALUES(
      5356,
      'Ennadai',
      150
);

INSERT INTO city
VALUES(
      5357,
      'Happy Valley - Goose Bay',
      150
);

INSERT INTO city
VALUES(
      5358,
      'Williams Lake',
      150
);

INSERT INTO city
VALUES(
      5359,
      'Prince Rupert',
      150
);

INSERT INTO city
VALUES(
      5360,
      'Chilliwack',
      150
);

INSERT INTO city
VALUES(
      5361,
      'Radisson',
      150
);

INSERT INTO city
VALUES(
      5362,
      'Churchill',
      150
);

INSERT INTO city
VALUES(
      5363,
      'Port Hardy',
      150
);

INSERT INTO city
VALUES(
      5364,
      'Penticton',
      150
);

INSERT INTO city
VALUES(
      5365,
      'Drummondville',
      150
);

INSERT INTO city
VALUES(
      5366,
      'Brandon',
      150
);

INSERT INTO city
VALUES(
      5367,
      'Argentia',
      150
);

INSERT INTO city
VALUES(
      5368,
      'Kimmirut',
      150
);

INSERT INTO city
VALUES(
      5369,
      'Wiarton',
      150
);

INSERT INTO city
VALUES(
      5370,
      'Ottawa',
      150
);

INSERT INTO city
VALUES(
      5371,
      'Fort Chipewyan',
      150
);

INSERT INTO city
VALUES(
      5372,
      'Fort Nelson',
      150
);

INSERT INTO city
VALUES(
      5373,
      'Lynn Lake',
      150
);

INSERT INTO city
VALUES(
      5374,
      'Weyburn',
      150
);

INSERT INTO city
VALUES(
      5375,
      'Burns Lake',
      150
);

INSERT INTO city
VALUES(
      5376,
      'Nain',
      150
);

INSERT INTO city
VALUES(
      5377,
      'Prince George',
      150
);

INSERT INTO city
VALUES(
      5378,
      'Cochrane',
      150
);

INSERT INTO city
VALUES(
      5379,
      'Nipigon',
      150
);

INSERT INTO city
VALUES(
      5380,
      'Riviere-du-Loup',
      150
);

INSERT INTO city
VALUES(
      5381,
      'St.-Jerome',
      150
);

INSERT INTO city
VALUES(
      5382,
      'Geraldton',
      150
);

INSERT INTO city
VALUES(
      5383,
      'New Liskeard',
      150
);

INSERT INTO city
VALUES(
      5384,
      'Cat Lake',
      150
);

INSERT INTO city
VALUES(
      5385,
      'Tofino',
      150
);

INSERT INTO city
VALUES(
      5386,
      'Tsiigehtchic',
      150
);

INSERT INTO city
VALUES(
      5387,
      'Thompson',
      150
);

INSERT INTO city
VALUES(
      5388,
      'Abbotsford',
      150
);

INSERT INTO city
VALUES(
      5389,
      'Trois Rivieres',
      150
);

INSERT INTO city
VALUES(
      5390,
      'Peterborough',
      150
);

INSERT INTO city
VALUES(
      5391,
      'Amos',
      150
);

INSERT INTO city
VALUES(
      5392,
      'Chapleau',
      150
);

INSERT INTO city
VALUES(
      5393,
      'Athabasca',
      150
);

INSERT INTO city
VALUES(
      5394,
      'Red Deer',
      150
);

INSERT INTO city
VALUES(
      5395,
      'Belleville',
      150
);

INSERT INTO city
VALUES(
      5396,
      'Kapuskasing',
      150
);

INSERT INTO city
VALUES(
      5397,
      'Sioux Lookout',
      150
);

INSERT INTO city
VALUES(
      5398,
      'Winnipeg',
      150
);

INSERT INTO city
VALUES(
      5399,
      'Lake Louise',
      150
);

INSERT INTO city
VALUES(
      5400,
      'Banff',
      150
);

INSERT INTO city
VALUES(
      5401,
      'Doline',
      150
);

INSERT INTO city
VALUES(
      5402,
      'Cambridge Bay',
      150
);

INSERT INTO city
VALUES(
      5403,
      'Biggar',
      150
);

INSERT INTO city
VALUES(
      5404,
      'Nanaimo',
      150
);

INSERT INTO city
VALUES(
      5405,
      'Val daOr',
      150
);

INSERT INTO city
VALUES(
      5406,
      'Hall Beach',
      150
);

INSERT INTO city
VALUES(
      5407,
      'Oxford House',
      150
);

INSERT INTO city
VALUES(
      5408,
      'The Pas',
      150
);

INSERT INTO city
VALUES(
      5409,
      'Meander River',
      150
);

INSERT INTO city
VALUES(
      5410,
      'Bathurst',
      150
);

INSERT INTO city
VALUES(
      5411,
      'Windsor',
      150
);

INSERT INTO city
VALUES(
      5412,
      'Victoriaville',
      150
);

INSERT INTO city
VALUES(
      5413,
      'Brockville',
      150
);

INSERT INTO city
VALUES(
      5414,
      'Hamilton',
      150
);

INSERT INTO city
VALUES(
      5415,
      'Kitchener',
      150
);

INSERT INTO city
VALUES(
      5416,
      'Victoria',
      150
);

INSERT INTO city
VALUES(
      5417,
      'Orangeville',
      150
);

INSERT INTO city
VALUES(
      5418,
      'Sandspit',
      150
);

INSERT INTO city
VALUES(
      5419,
      'Wawa',
      150
);

INSERT INTO city
VALUES(
      5420,
      'Kangirsuk',
      150
);

INSERT INTO city
VALUES(
      5421,
      'Shawinigan',
      150
);

INSERT INTO city
VALUES(
      5422,
      'Hearst',
      150
);

INSERT INTO city
VALUES(
      5423,
      'Pukatawagan',
      150
);

INSERT INTO city
VALUES(
      5424,
      'Arviat',
      150
);

INSERT INTO city
VALUES(
      5425,
      'Matagami',
      150
);

INSERT INTO city
VALUES(
      5426,
      'Saint John',
      150
);

INSERT INTO city
VALUES(
      5427,
      'Inuvik',
      150
);

INSERT INTO city
VALUES(
      5428,
      'Chesterfield Inlet',
      150
);

INSERT INTO city
VALUES(
      5429,
      'Rouyn-Noranda',
      150
);

INSERT INTO city
VALUES(
      5430,
      'Liverpool',
      150
);

INSERT INTO city
VALUES(
      5431,
      'Montreal',
      150
);

INSERT INTO city
VALUES(
      5432,
      'Shelburne',
      150
);

INSERT INTO city
VALUES(
      5433,
      'Yarmouth',
      150
);

INSERT INTO city
VALUES(
      5434,
      'Salluit',
      150
);

INSERT INTO city
VALUES(
      5435,
      'Ivugivik',
      150
);

INSERT INTO city
VALUES(
      5436,
      'Quebec',
      150
);

INSERT INTO city
VALUES(
      5437,
      'Dawson City',
      150
);

INSERT INTO city
VALUES(
      5438,
      'Moncton',
      150
);

INSERT INTO city
VALUES(
      5439,
      'Digby',
      150
);

INSERT INTO city
VALUES(
      5440,
      'Fredericton',
      150
);

INSERT INTO city
VALUES(
      5441,
      'Dease Lake',
      150
);

INSERT INTO city
VALUES(
      5442,
      'Charlottetown',
      150
);

INSERT INTO city
VALUES(
      5443,
      'Inukjuak',
      150
);

INSERT INTO city
VALUES(
      5444,
      'Sarnia',
      150
);

INSERT INTO city
VALUES(
      5445,
      'Edmundston',
      150
);

INSERT INTO city
VALUES(
      5446,
      'Windsor',
      150
);

INSERT INTO city
VALUES(
      5447,
      'Joliette',
      150
);

INSERT INTO city
VALUES(
      5448,
      'Amherst',
      150
);

INSERT INTO city
VALUES(
      5449,
      'Sept-Iles',
      150
);

INSERT INTO country
VALUES(
      151,
      'Congo (Kinshasa)'
);

INSERT INTO city
VALUES(
      5450,
      'Kimpese',
      151
);

INSERT INTO city
VALUES(
      5451,
      'Uvira',
      151
);

INSERT INTO city
VALUES(
      5452,
      'Mbandaka',
      151
);

INSERT INTO city
VALUES(
      5453,
      'Boma',
      151
);

INSERT INTO city
VALUES(
      5454,
      'Basankusu',
      151
);

INSERT INTO city
VALUES(
      5455,
      'Moanda',
      151
);

INSERT INTO city
VALUES(
      5456,
      'Lubutu',
      151
);

INSERT INTO city
VALUES(
      5457,
      'Mbanza-Ngungu',
      151
);

INSERT INTO city
VALUES(
      5458,
      'Kasongo',
      151
);

INSERT INTO city
VALUES(
      5459,
      'Tshela',
      151
);

INSERT INTO city
VALUES(
      5460,
      'Buluko',
      151
);

INSERT INTO city
VALUES(
      5461,
      'Beni',
      151
);

INSERT INTO city
VALUES(
      5462,
      'Kampene',
      151
);

INSERT INTO city
VALUES(
      5463,
      'Goma',
      151
);

INSERT INTO city
VALUES(
      5464,
      'Mwenga',
      151
);

INSERT INTO city
VALUES(
      5465,
      'Kalima',
      151
);

INSERT INTO city
VALUES(
      5466,
      'Kindu',
      151
);

INSERT INTO city
VALUES(
      5467,
      'Bukavu',
      151
);

INSERT INTO city
VALUES(
      5468,
      'Butembo',
      151
);

INSERT INTO city
VALUES(
      5469,
      'Mbuji-Mayi',
      151
);

INSERT INTO city
VALUES(
      5470,
      'Kinshasa',
      151
);

INSERT INTO city
VALUES(
      5471,
      'Kasangulu',
      151
);

INSERT INTO city
VALUES(
      5472,
      'Tshikapa',
      151
);

INSERT INTO city
VALUES(
      5473,
      'Aketi',
      151
);

INSERT INTO city
VALUES(
      5474,
      'Dibaya',
      151
);

INSERT INTO city
VALUES(
      5475,
      'Luebo',
      151
);

INSERT INTO city
VALUES(
      5476,
      'Buta',
      151
);

INSERT INTO city
VALUES(
      5477,
      'Ilebo',
      151
);

INSERT INTO city
VALUES(
      5478,
      'Kananga',
      151
);

INSERT INTO city
VALUES(
      5479,
      'Bondo',
      151
);

INSERT INTO city
VALUES(
      5480,
      'Mweka',
      151
);

INSERT INTO city
VALUES(
      5481,
      'Demba',
      151
);

INSERT INTO city
VALUES(
      5482,
      'Isiro',
      151
);

INSERT INTO city
VALUES(
      5483,
      'Wamba',
      151
);

INSERT INTO city
VALUES(
      5484,
      'Kamina',
      151
);

INSERT INTO city
VALUES(
      5485,
      'Bukama',
      151
);

INSERT INTO city
VALUES(
      5486,
      'Watsa',
      151
);

INSERT INTO city
VALUES(
      5487,
      'Kaniama',
      151
);

INSERT INTO city
VALUES(
      5488,
      'Mongbwalu',
      151
);

INSERT INTO city
VALUES(
      5489,
      'Bunia',
      151
);

INSERT INTO city
VALUES(
      5490,
      'Binga',
      151
);

INSERT INTO city
VALUES(
      5491,
      'Bongandanga',
      151
);

INSERT INTO city
VALUES(
      5492,
      'Lubumbashi',
      151
);

INSERT INTO city
VALUES(
      5493,
      'Lisala',
      151
);

INSERT INTO city
VALUES(
      5494,
      'Gbadolite',
      151
);

INSERT INTO city
VALUES(
      5495,
      'Kipushi',
      151
);

INSERT INTO city
VALUES(
      5496,
      'Bumba',
      151
);

INSERT INTO city
VALUES(
      5497,
      'Kasongo-Lunda',
      151
);

INSERT INTO city
VALUES(
      5498,
      'Businga',
      151
);

INSERT INTO city
VALUES(
      5499,
      'Luanza',
      151
);

INSERT INTO city
VALUES(
      5500,
      'Kahemba',
      151
);

INSERT INTO city
VALUES(
      5501,
      'Likasi',
      151
);

INSERT INTO city
VALUES(
      5502,
      'Kambove',
      151
);

INSERT INTO city
VALUES(
      5503,
      'Lusanga',
      151
);

INSERT INTO city
VALUES(
      5504,
      'Bosobolo',
      151
);

INSERT INTO city
VALUES(
      5505,
      'Bafwasende',
      151
);

INSERT INTO city
VALUES(
      5506,
      'Kongolo',
      151
);

INSERT INTO city
VALUES(
      5507,
      'Basoko',
      151
);

INSERT INTO city
VALUES(
      5508,
      'Kisangani',
      151
);

INSERT INTO city
VALUES(
      5509,
      'Manono',
      151
);

INSERT INTO city
VALUES(
      5510,
      'Mushie',
      151
);

INSERT INTO city
VALUES(
      5511,
      'Inongo',
      151
);

INSERT INTO city
VALUES(
      5512,
      'Zongo',
      151
);

INSERT INTO city
VALUES(
      5513,
      'Kenge',
      151
);

INSERT INTO city
VALUES(
      5514,
      'Boende',
      151
);

INSERT INTO city
VALUES(
      5515,
      'Yangambi',
      151
);

INSERT INTO city
VALUES(
      5516,
      'Gemena',
      151
);

INSERT INTO city
VALUES(
      5517,
      'Moba',
      151
);

INSERT INTO city
VALUES(
      5518,
      'Libenge',
      151
);

INSERT INTO city
VALUES(
      5519,
      'Kalemie',
      151
);

INSERT INTO city
VALUES(
      5520,
      'Nyunzu',
      151
);

INSERT INTO city
VALUES(
      5521,
      'Kabalo',
      151
);

INSERT INTO city
VALUES(
      5522,
      'Bolobo',
      151
);

INSERT INTO city
VALUES(
      5523,
      'Ikela',
      151
);

INSERT INTO city
VALUES(
      5524,
      'Kikwit',
      151
);

INSERT INTO city
VALUES(
      5525,
      'Lubao',
      151
);

INSERT INTO city
VALUES(
      5526,
      'Gandajika',
      151
);

INSERT INTO city
VALUES(
      5527,
      'Lusambo',
      151
);

INSERT INTO city
VALUES(
      5528,
      'Kolwezi',
      151
);

INSERT INTO city
VALUES(
      5529,
      'Kasaji',
      151
);

INSERT INTO city
VALUES(
      5530,
      'Kabinda',
      151
);

INSERT INTO city
VALUES(
      5531,
      'Bandundu',
      151
);

INSERT INTO city
VALUES(
      5532,
      'Mwene-Ditu',
      151
);

INSERT INTO city
VALUES(
      5533,
      'Lodja',
      151
);

INSERT INTO city
VALUES(
      5534,
      'Dilolo',
      151
);

INSERT INTO city
VALUES(
      5535,
      'Bulungu',
      151
);

INSERT INTO city
VALUES(
      5536,
      'Mangai',
      151
);

INSERT INTO city
VALUES(
      5537,
      'Matadi',
      151
);

INSERT INTO country
VALUES(
      152,
      'Central African Republic'
);

INSERT INTO city
VALUES(
      5538,
      'Bangui',
      152
);

INSERT INTO city
VALUES(
      5539,
      'Nola',
      152
);

INSERT INTO city
VALUES(
      5540,
      'Bozoum',
      152
);

INSERT INTO city
VALUES(
      5541,
      'Bambari',
      152
);

INSERT INTO city
VALUES(
      5542,
      'Mobaye',
      152
);

INSERT INTO city
VALUES(
      5543,
      'Bimbo',
      152
);

INSERT INTO city
VALUES(
      5544,
      'Kaga Bandoro',
      152
);

INSERT INTO city
VALUES(
      5545,
      'Sibut',
      152
);

INSERT INTO city
VALUES(
      5546,
      'Carnot',
      152
);

INSERT INTO city
VALUES(
      5547,
      'Bouar',
      152
);

INSERT INTO city
VALUES(
      5548,
      'Berberati',
      152
);

INSERT INTO city
VALUES(
      5549,
      'Zemio',
      152
);

INSERT INTO city
VALUES(
      5550,
      'Yakossi',
      152
);

INSERT INTO city
VALUES(
      5551,
      'Ouadda',
      152
);

INSERT INTO city
VALUES(
      5552,
      'Obo',
      152
);

INSERT INTO city
VALUES(
      5553,
      'Bangassou',
      152
);

INSERT INTO city
VALUES(
      5554,
      'Mbaiki',
      152
);

INSERT INTO city
VALUES(
      5555,
      'Bossembele',
      152
);

INSERT INTO city
VALUES(
      5556,
      'Bossangoa',
      152
);

INSERT INTO city
VALUES(
      5557,
      'Ndele',
      152
);

INSERT INTO city
VALUES(
      5558,
      'Bria',
      152
);

INSERT INTO city
VALUES(
      5559,
      'Birao',
      152
);

INSERT INTO country
VALUES(
      153,
      'Congo (Brazzaville)'
);

INSERT INTO city
VALUES(
      5560,
      'Brazzaville',
      153
);

INSERT INTO city
VALUES(
      5561,
      'Sembe',
      153
);

INSERT INTO city
VALUES(
      5562,
      'Kayes',
      153
);

INSERT INTO city
VALUES(
      5563,
      'Impfondo',
      153
);

INSERT INTO city
VALUES(
      5564,
      'Djambala',
      153
);

INSERT INTO city
VALUES(
      5565,
      'Moloundou',
      153
);

INSERT INTO city
VALUES(
      5566,
      'Ouesso',
      153
);

INSERT INTO city
VALUES(
      5567,
      'Sibiti',
      153
);

INSERT INTO city
VALUES(
      5568,
      'Ewo',
      153
);

INSERT INTO city
VALUES(
      5569,
      'Makoua',
      153
);

INSERT INTO city
VALUES(
      5570,
      'Gamboma',
      153
);

INSERT INTO city
VALUES(
      5571,
      'Madingou',
      153
);

INSERT INTO city
VALUES(
      5572,
      'Kinkala',
      153
);

INSERT INTO city
VALUES(
      5573,
      'Mossendjo',
      153
);

INSERT INTO city
VALUES(
      5574,
      'Owando',
      153
);

INSERT INTO city
VALUES(
      5575,
      'Loubomo',
      153
);

INSERT INTO city
VALUES(
      5576,
      'Loango',
      153
);

INSERT INTO city
VALUES(
      5577,
      'Pointe-Noire',
      153
);

INSERT INTO country
VALUES(
      154,
      'Switzerland'
);

INSERT INTO city
VALUES(
      5578,
      'Schaffhausen',
      154
);

INSERT INTO city
VALUES(
      5579,
      'Aarau',
      154
);

INSERT INTO city
VALUES(
      5580,
      'Glarus',
      154
);

INSERT INTO city
VALUES(
      5581,
      'Zurich',
      154
);

INSERT INTO city
VALUES(
      5582,
      'Delemont',
      154
);

INSERT INTO city
VALUES(
      5583,
      'Liestal',
      154
);

INSERT INTO city
VALUES(
      5584,
      'Basel',
      154
);

INSERT INTO city
VALUES(
      5585,
      'Solothurn',
      154
);

INSERT INTO city
VALUES(
      5586,
      'Fribourg',
      154
);

INSERT INTO city
VALUES(
      5587,
      'Zug',
      154
);

INSERT INTO city
VALUES(
      5588,
      'Chur',
      154
);

INSERT INTO city
VALUES(
      5589,
      'Sarnen',
      154
);

INSERT INTO city
VALUES(
      5590,
      'Schwyz',
      154
);

INSERT INTO city
VALUES(
      5591,
      'Luzern',
      154
);

INSERT INTO city
VALUES(
      5592,
      'Neuchatel',
      154
);

INSERT INTO city
VALUES(
      5593,
      'Altdorf',
      154
);

INSERT INTO city
VALUES(
      5594,
      'Biel',
      154
);

INSERT INTO city
VALUES(
      5595,
      'Geneva',
      154
);

INSERT INTO city
VALUES(
      5596,
      'Lausanne',
      154
);

INSERT INTO city
VALUES(
      5597,
      'Bern',
      154
);

INSERT INTO city
VALUES(
      5598,
      'Stans',
      154
);

INSERT INTO city
VALUES(
      5599,
      'Saint Gallen',
      154
);

INSERT INTO city
VALUES(
      5600,
      'Appenzell',
      154
);

INSERT INTO city
VALUES(
      5601,
      'Herisau',
      154
);

INSERT INTO city
VALUES(
      5602,
      'Frauenfeld',
      154
);

INSERT INTO city
VALUES(
      5603,
      'Lugano',
      154
);

INSERT INTO city
VALUES(
      5604,
      'Bellinzona',
      154
);

INSERT INTO city
VALUES(
      5605,
      'Sion',
      154
);

INSERT INTO city
VALUES(
      5606,
      'Schaffhausen',
      154
);

INSERT INTO city
VALUES(
      5607,
      'Aarau',
      154
);

INSERT INTO city
VALUES(
      5608,
      'Delemont',
      154
);

INSERT INTO city
VALUES(
      5609,
      'Solothurn',
      154
);

INSERT INTO country
VALUES(
      155,
      'Côte D’Ivoire'
);

INSERT INTO city
VALUES(
      5610,
      'Soubre',
      155
);

INSERT INTO city
VALUES(
      5611,
      'Bouake',
      155
);

INSERT INTO city
VALUES(
      5612,
      'Man',
      155
);

INSERT INTO city
VALUES(
      5613,
      'San-Pedro',
      155
);

INSERT INTO city
VALUES(
      5614,
      'Korhogo',
      155
);

INSERT INTO city
VALUES(
      5615,
      'Odienne',
      155
);

INSERT INTO city
VALUES(
      5616,
      'Bondoukou',
      155
);

INSERT INTO city
VALUES(
      5617,
      'Agboville',
      155
);

INSERT INTO city
VALUES(
      5618,
      'Dabou',
      155
);

INSERT INTO city
VALUES(
      5619,
      'Abidjan',
      155
);

INSERT INTO city
VALUES(
      5620,
      'Yamoussoukro',
      155
);

INSERT INTO city
VALUES(
      5621,
      'Gagnoa',
      155
);

INSERT INTO city
VALUES(
      5622,
      'Abengourou',
      155
);

INSERT INTO city
VALUES(
      5623,
      'Dimbokro',
      155
);

INSERT INTO city
VALUES(
      5624,
      'Daloa',
      155
);

INSERT INTO city
VALUES(
      5625,
      'Seguela',
      155
);

INSERT INTO city
VALUES(
      5626,
      'Aboisso',
      155
);

INSERT INTO city
VALUES(
      5627,
      'Guiglo',
      155
);

INSERT INTO city
VALUES(
      5628,
      'Toumodi',
      155
);

INSERT INTO city
VALUES(
      5629,
      'Grand Bassam',
      155
);

INSERT INTO city
VALUES(
      5630,
      'Sassandra',
      155
);

INSERT INTO city
VALUES(
      5631,
      'Divo',
      155
);

INSERT INTO city
VALUES(
      5632,
      'Touba',
      155
);

INSERT INTO city
VALUES(
      5633,
      'Ferkessedougou',
      155
);

INSERT INTO city
VALUES(
      5634,
      'Bangolo',
      155
);

INSERT INTO city
VALUES(
      5635,
      'Bouafle',
      155
);

INSERT INTO country
VALUES(
      156,
      'Cook Islands'
);

INSERT INTO city
VALUES(
      5636,
      'Avarua',
      156
);

INSERT INTO country
VALUES(
      157,
      'Chile'
);

INSERT INTO city
VALUES(
      5637,
      'Diego de Almagro',
      157
);

INSERT INTO city
VALUES(
      5638,
      'Santiago',
      157
);

INSERT INTO city
VALUES(
      5639,
      'Chanaral',
      157
);

INSERT INTO city
VALUES(
      5640,
      'Rancagua',
      157
);

INSERT INTO city
VALUES(
      5641,
      'Concepcion',
      157
);

INSERT INTO city
VALUES(
      5642,
      'Victoria',
      157
);

INSERT INTO city
VALUES(
      5643,
      'Talca',
      157
);

INSERT INTO city
VALUES(
      5644,
      'Arica',
      157
);

INSERT INTO city
VALUES(
      5645,
      'Talcahuano',
      157
);

INSERT INTO city
VALUES(
      5646,
      'Curanilahue',
      157
);

INSERT INTO city
VALUES(
      5647,
      'Lota',
      157
);

INSERT INTO city
VALUES(
      5648,
      'Coronel',
      157
);

INSERT INTO city
VALUES(
      5649,
      'Vicuna',
      157
);

INSERT INTO city
VALUES(
      5650,
      'Tolten',
      157
);

INSERT INTO city
VALUES(
      5651,
      'Temuco',
      157
);

INSERT INTO city
VALUES(
      5652,
      'Carahue',
      157
);

INSERT INTO city
VALUES(
      5653,
      'Quirihue',
      157
);

INSERT INTO city
VALUES(
      5654,
      'La Serena',
      157
);

INSERT INTO city
VALUES(
      5655,
      'Loncoche',
      157
);

INSERT INTO city
VALUES(
      5656,
      'Nueva Imperial',
      157
);

INSERT INTO city
VALUES(
      5657,
      'Punta Arenas',
      157
);

INSERT INTO city
VALUES(
      5658,
      'Iquique',
      157
);

INSERT INTO city
VALUES(
      5659,
      'Maria Elena',
      157
);

INSERT INTO city
VALUES(
      5660,
      'Combarbala',
      157
);

INSERT INTO city
VALUES(
      5661,
      'Huasco',
      157
);

INSERT INTO city
VALUES(
      5662,
      'Salamanca',
      157
);

INSERT INTO city
VALUES(
      5663,
      'Caldera',
      157
);

INSERT INTO city
VALUES(
      5664,
      'Taltal',
      157
);

INSERT INTO city
VALUES(
      5665,
      'Constitucion',
      157
);

INSERT INTO city
VALUES(
      5666,
      'Antofagasta',
      157
);

INSERT INTO city
VALUES(
      5667,
      'Chuquicamata',
      157
);

INSERT INTO city
VALUES(
      5668,
      'Toconao',
      157
);

INSERT INTO city
VALUES(
      5669,
      'Valdivia',
      157
);

INSERT INTO city
VALUES(
      5670,
      'Copiapo',
      157
);

INSERT INTO city
VALUES(
      5671,
      'Santa Barbara',
      157
);

INSERT INTO city
VALUES(
      5672,
      'Los Lagos',
      157
);

INSERT INTO city
VALUES(
      5673,
      'Vina del Mar',
      157
);

INSERT INTO city
VALUES(
      5674,
      'Valparaiso',
      157
);

INSERT INTO city
VALUES(
      5675,
      'Collipulli',
      157
);

INSERT INTO city
VALUES(
      5676,
      'Villarica',
      157
);

INSERT INTO city
VALUES(
      5677,
      'Tierra Amarilla',
      157
);

INSERT INTO city
VALUES(
      5678,
      'Lagunas',
      157
);

INSERT INTO city
VALUES(
      5679,
      'Coihaique',
      157
);

INSERT INTO city
VALUES(
      5680,
      'Cuya',
      157
);

INSERT INTO city
VALUES(
      5681,
      'Mejillones',
      157
);

INSERT INTO city
VALUES(
      5682,
      'Rio Verde',
      157
);

INSERT INTO city
VALUES(
      5683,
      'Villa OaHiggins',
      157
);

INSERT INTO city
VALUES(
      5684,
      'Quellon',
      157
);

INSERT INTO city
VALUES(
      5685,
      'La Ligua',
      157
);

INSERT INTO city
VALUES(
      5686,
      'Quillota',
      157
);

INSERT INTO city
VALUES(
      5687,
      'Tocopilla',
      157
);

INSERT INTO city
VALUES(
      5688,
      'Calama',
      157
);

INSERT INTO city
VALUES(
      5689,
      'Vallenar',
      157
);

INSERT INTO city
VALUES(
      5690,
      'San Bernardo',
      157
);

INSERT INTO city
VALUES(
      5691,
      'Pozo Almonte',
      157
);

INSERT INTO city
VALUES(
      5692,
      'Coquimbo',
      157
);

INSERT INTO city
VALUES(
      5693,
      'Ovalle',
      157
);

INSERT INTO city
VALUES(
      5694,
      'Illapel',
      157
);

INSERT INTO city
VALUES(
      5695,
      'San Felipe',
      157
);

INSERT INTO city
VALUES(
      5696,
      'Los Andes',
      157
);

INSERT INTO city
VALUES(
      5697,
      'San Antonio',
      157
);

INSERT INTO city
VALUES(
      5698,
      'Pichilemu',
      157
);

INSERT INTO city
VALUES(
      5699,
      'San Fernando',
      157
);

INSERT INTO city
VALUES(
      5700,
      'Linares',
      157
);

INSERT INTO city
VALUES(
      5701,
      'Cauquenes',
      157
);

INSERT INTO city
VALUES(
      5702,
      'Los Angeles',
      157
);

INSERT INTO city
VALUES(
      5703,
      'Angol',
      157
);

INSERT INTO city
VALUES(
      5704,
      'Lebu',
      157
);

INSERT INTO city
VALUES(
      5705,
      'Osorno',
      157
);

INSERT INTO city
VALUES(
      5706,
      'Castro',
      157
);

INSERT INTO city
VALUES(
      5707,
      'Puerto Aisen',
      157
);

INSERT INTO city
VALUES(
      5708,
      'Cochrane',
      157
);

INSERT INTO city
VALUES(
      5709,
      'Puerto Williams',
      157
);

INSERT INTO city
VALUES(
      5710,
      'Puerto Natales',
      157
);

INSERT INTO city
VALUES(
      5711,
      'Curico',
      157
);

INSERT INTO city
VALUES(
      5712,
      'Ancud',
      157
);

INSERT INTO city
VALUES(
      5713,
      'Puerto Montt',
      157
);

INSERT INTO city
VALUES(
      5714,
      'Puerto Varas',
      157
);

INSERT INTO city
VALUES(
      5715,
      'Calbuco',
      157
);

INSERT INTO city
VALUES(
      5716,
      'Rio Bueno',
      157
);

INSERT INTO city
VALUES(
      5717,
      'La Union',
      157
);

INSERT INTO city
VALUES(
      5718,
      'Chonchi',
      157
);

INSERT INTO city
VALUES(
      5719,
      'Chillan',
      157
);

INSERT INTO city
VALUES(
      5720,
      'Lonquimay',
      157
);

INSERT INTO country
VALUES(
      158,
      'Cameroon'
);

INSERT INTO city
VALUES(
      5721,
      'Yaounde',
      158
);

INSERT INTO city
VALUES(
      5722,
      'Bertoua',
      158
);

INSERT INTO city
VALUES(
      5723,
      'Bafia',
      158
);

INSERT INTO city
VALUES(
      5724,
      'Mbalmayo',
      158
);

INSERT INTO city
VALUES(
      5725,
      'Kontcha',
      158
);

INSERT INTO city
VALUES(
      5726,
      'Mbe',
      158
);

INSERT INTO city
VALUES(
      5727,
      'Kribi',
      158
);

INSERT INTO city
VALUES(
      5728,
      'Edea',
      158
);

INSERT INTO city
VALUES(
      5729,
      'Belabo',
      158
);

INSERT INTO city
VALUES(
      5730,
      'Meiganga',
      158
);

INSERT INTO city
VALUES(
      5731,
      'Maroua',
      158
);

INSERT INTO city
VALUES(
      5732,
      'Eseka',
      158
);

INSERT INTO city
VALUES(
      5733,
      'Ebolowa',
      158
);

INSERT INTO city
VALUES(
      5734,
      'Ngaoundere',
      158
);

INSERT INTO city
VALUES(
      5735,
      'Batouri',
      158
);

INSERT INTO city
VALUES(
      5736,
      'Abong Mbang',
      158
);

INSERT INTO city
VALUES(
      5737,
      'Limbe',
      158
);

INSERT INTO city
VALUES(
      5738,
      'Kumba',
      158
);

INSERT INTO city
VALUES(
      5739,
      'Buea',
      158
);

INSERT INTO city
VALUES(
      5740,
      'Nkongsamba',
      158
);

INSERT INTO city
VALUES(
      5741,
      'Douala',
      158
);

INSERT INTO city
VALUES(
      5742,
      'Kumbo',
      158
);

INSERT INTO city
VALUES(
      5743,
      'Eyumojok',
      158
);

INSERT INTO city
VALUES(
      5744,
      'Wum',
      158
);

INSERT INTO city
VALUES(
      5745,
      'Bafoussam',
      158
);

INSERT INTO city
VALUES(
      5746,
      'Bafang',
      158
);

INSERT INTO city
VALUES(
      5747,
      'Garoua',
      158
);

INSERT INTO city
VALUES(
      5748,
      'Guider',
      158
);

INSERT INTO city
VALUES(
      5749,
      'Tibati',
      158
);

INSERT INTO city
VALUES(
      5750,
      'Foumban',
      158
);

INSERT INTO city
VALUES(
      5751,
      'Bamenda',
      158
);

INSERT INTO country
VALUES(
      159,
      'China'
);

INSERT INTO city
VALUES(
      5752,
      'Lupanshui',
      159
);

INSERT INTO city
VALUES(
      5753,
      'Fengcheng',
      159
);

INSERT INTO city
VALUES(
      5754,
      'Yulin',
      159
);

INSERT INTO city
VALUES(
      5755,
      'Shishou',
      159
);

INSERT INTO city
VALUES(
      5756,
      'Yantai',
      159
);

INSERT INTO city
VALUES(
      5757,
      'Yishui',
      159
);

INSERT INTO city
VALUES(
      5758,
      'Zibo',
      159
);

INSERT INTO city
VALUES(
      5759,
      'Shanghai',
      159
);

INSERT INTO city
VALUES(
      5760,
      'Weifang',
      159
);

INSERT INTO city
VALUES(
      5761,
      'Yongzhou',
      159
);

INSERT INTO city
VALUES(
      5762,
      'Zunyi',
      159
);

INSERT INTO city
VALUES(
      5763,
      'Wuyuan',
      159
);

INSERT INTO city
VALUES(
      5764,
      'Shuangcheng',
      159
);

INSERT INTO city
VALUES(
      5765,
      'Shijianzhuang',
      159
);

INSERT INTO city
VALUES(
      5766,
      'Qinhuangdao',
      159
);

INSERT INTO city
VALUES(
      5767,
      'Guangshui',
      159
);

INSERT INTO city
VALUES(
      5768,
      'Nanchang',
      159
);

INSERT INTO city
VALUES(
      5769,
      'Nehe',
      159
);

INSERT INTO city
VALUES(
      5770,
      'Shangqiu',
      159
);

INSERT INTO city
VALUES(
      5771,
      'Hengshui',
      159
);

INSERT INTO city
VALUES(
      5772,
      'Xiaogan',
      159
);

INSERT INTO city
VALUES(
      5773,
      'Xiangtan',
      159
);

INSERT INTO city
VALUES(
      5774,
      'Xian',
      159
);

INSERT INTO city
VALUES(
      5775,
      'Tianjin',
      159
);

INSERT INTO city
VALUES(
      5776,
      'Daqing',
      159
);

INSERT INTO city
VALUES(
      5777,
      'Taian',
      159
);

INSERT INTO city
VALUES(
      5778,
      'Nangong',
      159
);

INSERT INTO city
VALUES(
      5779,
      'Shizuishan',
      159
);

INSERT INTO city
VALUES(
      5780,
      'Changsha',
      159
);

INSERT INTO city
VALUES(
      5781,
      'Panshi',
      159
);

INSERT INTO city
VALUES(
      5782,
      'Jilin',
      159
);

INSERT INTO city
VALUES(
      5783,
      'Macheng',
      159
);

INSERT INTO city
VALUES(
      5784,
      'Mishan',
      159
);

INSERT INTO city
VALUES(
      5785,
      'Hengyang',
      159
);

INSERT INTO city
VALUES(
      5786,
      'Keshan',
      159
);

INSERT INTO city
VALUES(
      5787,
      'Haikou',
      159
);

INSERT INTO city
VALUES(
      5788,
      'Hohhot',
      159
);

INSERT INTO city
VALUES(
      5789,
      'Xinyang',
      159
);

INSERT INTO city
VALUES(
      5790,
      'Lhasa',
      159
);

INSERT INTO city
VALUES(
      5791,
      'Huinan',
      159
);

INSERT INTO city
VALUES(
      5792,
      'Zaozhuang',
      159
);

INSERT INTO city
VALUES(
      5793,
      'Laiwu',
      159
);

INSERT INTO city
VALUES(
      5794,
      'Suzhou',
      159
);

INSERT INTO city
VALUES(
      5795,
      'Xiantao',
      159
);

INSERT INTO city
VALUES(
      5796,
      'Kunming',
      159
);

INSERT INTO city
VALUES(
      5797,
      'Yiyang',
      159
);

INSERT INTO city
VALUES(
      5798,
      'Bugt',
      159
);

INSERT INTO city
VALUES(
      5799,
      'Fujin',
      159
);

INSERT INTO city
VALUES(
      5800,
      'Chengdu',
      159
);

INSERT INTO city
VALUES(
      5801,
      'Dunhua',
      159
);

INSERT INTO city
VALUES(
      5802,
      'Manzhouli',
      159
);

INSERT INTO city
VALUES(
      5803,
      'Fuyang',
      159
);

INSERT INTO city
VALUES(
      5804,
      'Xingyi',
      159
);

INSERT INTO city
VALUES(
      5805,
      'Harbin',
      159
);

INSERT INTO city
VALUES(
      5806,
      'Danjiangkou',
      159
);

INSERT INTO city
VALUES(
      5807,
      'Cangzhou',
      159
);

INSERT INTO city
VALUES(
      5808,
      'Fuxin',
      159
);

INSERT INTO city
VALUES(
      5809,
      'Anshun',
      159
);

INSERT INTO city
VALUES(
      5810,
      'Minxian',
      159
);

INSERT INTO city
VALUES(
      5811,
      'Nanning',
      159
);

INSERT INTO city
VALUES(
      5812,
      'Zhangjiakou',
      159
);

INSERT INTO city
VALUES(
      5813,
      'Baotou',
      159
);

INSERT INTO city
VALUES(
      5814,
      'Zhengzhou',
      159
);

INSERT INTO city
VALUES(
      5815,
      'Huainan',
      159
);

INSERT INTO city
VALUES(
      5816,
      'Tongren',
      159
);

INSERT INTO city
VALUES(
      5817,
      'Hancheng',
      159
);

INSERT INTO city
VALUES(
      5818,
      'Huaiyin',
      159
);

INSERT INTO city
VALUES(
      5819,
      'Jieshou',
      159
);

INSERT INTO city
VALUES(
      5820,
      'Zicheng',
      159
);

INSERT INTO city
VALUES(
      5821,
      'Beihai',
      159
);

INSERT INTO city
VALUES(
      5822,
      'Shanxian',
      159
);

INSERT INTO city
VALUES(
      5823,
      'Linyi',
      159
);

INSERT INTO city
VALUES(
      5824,
      'Shuangyashan',
      159
);

INSERT INTO city
VALUES(
      5825,
      'Yishan',
      159
);

INSERT INTO city
VALUES(
      5826,
      'Puqi',
      159
);

INSERT INTO city
VALUES(
      5827,
      'Fuyu',
      159
);

INSERT INTO city
VALUES(
      5828,
      'Maoming',
      159
);

INSERT INTO city
VALUES(
      5829,
      'Weinan',
      159
);

INSERT INTO city
VALUES(
      5830,
      'Dali',
      159
);

INSERT INTO city
VALUES(
      5831,
      'Shache',
      159
);

INSERT INTO city
VALUES(
      5832,
      'Tangshan',
      159
);

INSERT INTO city
VALUES(
      5833,
      'Jianmen',
      159
);

INSERT INTO city
VALUES(
      5834,
      'Zhuozhou',
      159
);

INSERT INTO city
VALUES(
      5835,
      'Zhaotang',
      159
);

INSERT INTO city
VALUES(
      5836,
      'Pingxiang',
      159
);

INSERT INTO city
VALUES(
      5837,
      'Linfen',
      159
);

INSERT INTO city
VALUES(
      5838,
      'Jiutai',
      159
);

INSERT INTO city
VALUES(
      5839,
      'Dunhuang',
      159
);

INSERT INTO city
VALUES(
      5840,
      'Laiyang',
      159
);

INSERT INTO city
VALUES(
      5841,
      'Guiyang',
      159
);

INSERT INTO city
VALUES(
      5842,
      'Fuzhou',
      159
);

INSERT INTO city
VALUES(
      5843,
      'Bengbu',
      159
);

INSERT INTO city
VALUES(
      5844,
      'Chuxiong',
      159
);

INSERT INTO city
VALUES(
      5845,
      'Hebi',
      159
);

INSERT INTO city
VALUES(
      5846,
      'Shuyang',
      159
);

INSERT INTO city
VALUES(
      5847,
      'Jining',
      159
);

INSERT INTO city
VALUES(
      5848,
      'Buizhou',
      159
);

INSERT INTO city
VALUES(
      5849,
      'Langfang',
      159
);

INSERT INTO city
VALUES(
      5850,
      'Dingzhou',
      159
);

INSERT INTO city
VALUES(
      5851,
      'Baoding',
      159
);

INSERT INTO city
VALUES(
      5852,
      'Hangu',
      159
);

INSERT INTO city
VALUES(
      5853,
      'Liaoyuan',
      159
);

INSERT INTO city
VALUES(
      5854,
      'Yanji',
      159
);

INSERT INTO city
VALUES(
      5855,
      'Xuanzhou',
      159
);

INSERT INTO city
VALUES(
      5856,
      'Guangyuan',
      159
);

INSERT INTO city
VALUES(
      5857,
      'Tongling',
      159
);

INSERT INTO city
VALUES(
      5858,
      'Changling',
      159
);

INSERT INTO city
VALUES(
      5859,
      'Nongan',
      159
);

INSERT INTO city
VALUES(
      5860,
      'Gejiu',
      159
);

INSERT INTO city
VALUES(
      5861,
      'Mengzi',
      159
);

INSERT INTO city
VALUES(
      5862,
      'Luzhou',
      159
);

INSERT INTO city
VALUES(
      5863,
      'Tengchong',
      159
);

INSERT INTO city
VALUES(
      5864,
      'Huize',
      159
);

INSERT INTO city
VALUES(
      5865,
      'Zhanyi',
      159
);

INSERT INTO city
VALUES(
      5866,
      'Liuhe',
      159
);

INSERT INTO city
VALUES(
      5867,
      'Deyang',
      159
);

INSERT INTO city
VALUES(
      5868,
      'Yibin',
      159
);

INSERT INTO city
VALUES(
      5869,
      'Zhijiang',
      159
);

INSERT INTO city
VALUES(
      5870,
      'Shaoyang',
      159
);

INSERT INTO city
VALUES(
      5871,
      'Yueyang',
      159
);

INSERT INTO city
VALUES(
      5872,
      'Neijiang',
      159
);

INSERT INTO city
VALUES(
      5873,
      'Langzhong',
      159
);

INSERT INTO city
VALUES(
      5874,
      'Xichang',
      159
);

INSERT INTO city
VALUES(
      5875,
      'Wenshan',
      159
);

INSERT INTO city
VALUES(
      5876,
      'Xuzhou',
      159
);

INSERT INTO city
VALUES(
      5877,
      'Zigong',
      159
);

INSERT INTO city
VALUES(
      5878,
      'Mianyang',
      159
);

INSERT INTO city
VALUES(
      5879,
      'Shaowu',
      159
);

INSERT INTO city
VALUES(
      5880,
      'Suining',
      159
);

INSERT INTO city
VALUES(
      5881,
      'Panzhihua',
      159
);

INSERT INTO city
VALUES(
      5882,
      'Nanchong',
      159
);

INSERT INTO city
VALUES(
      5883,
      'Tonghua',
      159
);

INSERT INTO city
VALUES(
      5884,
      'Shaoguan',
      159
);

INSERT INTO city
VALUES(
      5885,
      'Chaozhou',
      159
);

INSERT INTO city
VALUES(
      5886,
      'Meizhou',
      159
);

INSERT INTO city
VALUES(
      5887,
      'Xiamen',
      159
);

INSERT INTO city
VALUES(
      5888,
      'Zhangzhou',
      159
);

INSERT INTO city
VALUES(
      5889,
      'Zhuhai',
      159
);

INSERT INTO city
VALUES(
      5890,
      'Putian',
      159
);

INSERT INTO city
VALUES(
      5891,
      'Foshan',
      159
);

INSERT INTO city
VALUES(
      5892,
      'Dongguan',
      159
);

INSERT INTO city
VALUES(
      5893,
      'Zhanjiang',
      159
);

INSERT INTO city
VALUES(
      5894,
      'Jiangmen',
      159
);

INSERT INTO city
VALUES(
      5895,
      'Huizhou',
      159
);

INSERT INTO city
VALUES(
      5896,
      'Qingyuan',
      159
);

INSERT INTO city
VALUES(
      5897,
      'Heyuan',
      159
);

INSERT INTO city
VALUES(
      5898,
      'Quanzhou',
      159
);

INSERT INTO city
VALUES(
      5899,
      'Longyan',
      159
);

INSERT INTO city
VALUES(
      5900,
      'Sanming',
      159
);

INSERT INTO city
VALUES(
      5901,
      'Wuzhou',
      159
);

INSERT INTO city
VALUES(
      5902,
      'Zhaoqing',
      159
);

INSERT INTO city
VALUES(
      5903,
      'Wangqing',
      159
);

INSERT INTO city
VALUES(
      5904,
      'Shenzhen',
      159
);

INSERT INTO city
VALUES(
      5905,
      'Guilin',
      159
);

INSERT INTO city
VALUES(
      5906,
      'Liuzhou',
      159
);

INSERT INTO city
VALUES(
      5907,
      'Yuxi',
      159
);

INSERT INTO city
VALUES(
      5908,
      'Shantou',
      159
);

INSERT INTO city
VALUES(
      5909,
      'Nanping',
      159
);

INSERT INTO city
VALUES(
      5910,
      'Pingdingshan',
      159
);

INSERT INTO city
VALUES(
      5911,
      'Ningbo',
      159
);

INSERT INTO city
VALUES(
      5912,
      'Nanyang',
      159
);

INSERT INTO city
VALUES(
      5913,
      'Longxi',
      159
);

INSERT INTO city
VALUES(
      5914,
      'Linjiang',
      159
);

INSERT INTO city
VALUES(
      5915,
      'Changting',
      159
);

INSERT INTO city
VALUES(
      5916,
      'Jiujiang',
      159
);

INSERT INTO city
VALUES(
      5917,
      'Helong',
      159
);

INSERT INTO city
VALUES(
      5918,
      'Chifeng',
      159
);

INSERT INTO city
VALUES(
      5919,
      'Yichun',
      159
);

INSERT INTO city
VALUES(
      5920,
      'Jian',
      159
);

INSERT INTO city
VALUES(
      5921,
      'Anlu',
      159
);

INSERT INTO city
VALUES(
      5922,
      'Shaoxing',
      159
);

INSERT INTO city
VALUES(
      5923,
      'Shashi',
      159
);

INSERT INTO city
VALUES(
      5924,
      'Huangshi',
      159
);

INSERT INTO city
VALUES(
      5925,
      'Sanya',
      159
);

INSERT INTO city
VALUES(
      5926,
      'Shangrao',
      159
);

INSERT INTO city
VALUES(
      5927,
      'Bose',
      159
);

INSERT INTO city
VALUES(
      5928,
      'Simao',
      159
);

INSERT INTO city
VALUES(
      5929,
      'Wuhan',
      159
);

INSERT INTO city
VALUES(
      5930,
      'Yichang',
      159
);

INSERT INTO city
VALUES(
      5931,
      'Jingdezhen',
      159
);

INSERT INTO city
VALUES(
      5932,
      'Shiyan',
      159
);

INSERT INTO city
VALUES(
      5933,
      'Lianyungang',
      159
);

INSERT INTO city
VALUES(
      5934,
      'Tongliao',
      159
);

INSERT INTO city
VALUES(
      5935,
      'Kailu',
      159
);

INSERT INTO city
VALUES(
      5936,
      'Xiangfan',
      159
);

INSERT INTO city
VALUES(
      5937,
      'Jinshi',
      159
);

INSERT INTO city
VALUES(
      5938,
      'Xilinhot',
      159
);

INSERT INTO city
VALUES(
      5939,
      'Jincheng',
      159
);

INSERT INTO city
VALUES(
      5940,
      'Jining',
      159
);

INSERT INTO city
VALUES(
      5941,
      'Yangquan',
      159
);

INSERT INTO city
VALUES(
      5942,
      'Ergun Zuoqi',
      159
);

INSERT INTO city
VALUES(
      5943,
      'Shuozhou',
      159
);

INSERT INTO city
VALUES(
      5944,
      'Anxi',
      159
);

INSERT INTO city
VALUES(
      5945,
      'Pingdu',
      159
);

INSERT INTO city
VALUES(
      5946,
      'Jinan',
      159
);

INSERT INTO city
VALUES(
      5947,
      'Yuci',
      159
);

INSERT INTO city
VALUES(
      5948,
      'Pingyi',
      159
);

INSERT INTO city
VALUES(
      5949,
      'Guangzhou',
      159
);

INSERT INTO city
VALUES(
      5950,
      'Xigaze',
      159
);

INSERT INTO city
VALUES(
      5951,
      'Changde',
      159
);

INSERT INTO city
VALUES(
      5952,
      'Datong',
      159
);

INSERT INTO city
VALUES(
      5953,
      'Luoyang',
      159
);

INSERT INTO city
VALUES(
      5954,
      'Shulan',
      159
);

INSERT INTO city
VALUES(
      5955,
      'Changchun',
      159
);

INSERT INTO city
VALUES(
      5956,
      'Daan',
      159
);

INSERT INTO city
VALUES(
      5957,
      'Huanghua',
      159
);

INSERT INTO city
VALUES(
      5958,
      'Handan',
      159
);

INSERT INTO city
VALUES(
      5959,
      'Chengde',
      159
);

INSERT INTO city
VALUES(
      5960,
      'Tumen',
      159
);

INSERT INTO city
VALUES(
      5961,
      'Bayan Obo',
      159
);

INSERT INTO city
VALUES(
      5962,
      'Alxa Zuoqi',
      159
);

INSERT INTO city
VALUES(
      5963,
      'Bairin Zuoqi',
      159
);

INSERT INTO city
VALUES(
      5964,
      'Linxi',
      159
);

INSERT INTO city
VALUES(
      5965,
      'Jiaozuo',
      159
);

INSERT INTO city
VALUES(
      5966,
      'Tianshui',
      159
);

INSERT INTO city
VALUES(
      5967,
      'Taiyuan',
      159
);

INSERT INTO city
VALUES(
      5968,
      'Hulin',
      159
);

INSERT INTO city
VALUES(
      5969,
      'Yunxian',
      159
);

INSERT INTO city
VALUES(
      5970,
      'Chamdo',
      159
);

INSERT INTO city
VALUES(
      5971,
      'Beijing',
      159
);

INSERT INTO city
VALUES(
      5972,
      'Wuxi',
      159
);

INSERT INTO city
VALUES(
      5973,
      'Longjiang',
      159
);

INSERT INTO city
VALUES(
      5974,
      'Maanshan',
      159
);

INSERT INTO city
VALUES(
      5975,
      'Shangdu',
      159
);

INSERT INTO city
VALUES(
      5976,
      'Changping',
      159
);

INSERT INTO city
VALUES(
      5977,
      'Hanggin Houqi',
      159
);

INSERT INTO city
VALUES(
      5978,
      'Changzhou',
      159
);

INSERT INTO city
VALUES(
      5979,
      'Fengjie',
      159
);

INSERT INTO city
VALUES(
      5980,
      'Weihai',
      159
);

INSERT INTO city
VALUES(
      5981,
      'Wuhu',
      159
);

INSERT INTO city
VALUES(
      5982,
      'Gannan',
      159
);

INSERT INTO city
VALUES(
      5983,
      'Jingmen',
      159
);

INSERT INTO city
VALUES(
      5984,
      'Arxan',
      159
);

INSERT INTO city
VALUES(
      5985,
      'Orongen Zizhiqi',
      159
);

INSERT INTO city
VALUES(
      5986,
      'Qingan',
      159
);

INSERT INTO city
VALUES(
      5987,
      'Dali',
      159
);

INSERT INTO city
VALUES(
      5988,
      'Baoshan',
      159
);

INSERT INTO city
VALUES(
      5989,
      'Lijiang',
      159
);

INSERT INTO city
VALUES(
      5990,
      'Yakeshi',
      159
);

INSERT INTO city
VALUES(
      5991,
      'Tailai',
      159
);

INSERT INTO city
VALUES(
      5992,
      'Baiquan',
      159
);

INSERT INTO city
VALUES(
      5993,
      'Hailar',
      159
);

INSERT INTO city
VALUES(
      5994,
      'Guide',
      159
);

INSERT INTO city
VALUES(
      5995,
      'Wanzhou',
      159
);

INSERT INTO city
VALUES(
      5996,
      'Rongzhag',
      159
);

INSERT INTO city
VALUES(
      5997,
      'Baishan',
      159
);

INSERT INTO city
VALUES(
      5998,
      'Jyekundo',
      159
);

INSERT INTO city
VALUES(
      5999,
      'Jixi',
      159
);

INSERT INTO city
VALUES(
      6000,
      'Xinyu',
      159
);

INSERT INTO city
VALUES(
      6001,
      'Boli',
      159
);

INSERT INTO city
VALUES(
      6002,
      'Wuchuan',
      159
);

INSERT INTO city
VALUES(
      6003,
      'Xinqing',
      159
);

INSERT INTO city
VALUES(
      6004,
      'Linxia',
      159
);

INSERT INTO city
VALUES(
      6005,
      'Anda',
      159
);

INSERT INTO city
VALUES(
      6006,
      'Nancha',
      159
);

INSERT INTO city
VALUES(
      6007,
      'Shihezi',
      159
);

INSERT INTO city
VALUES(
      6008,
      'Yichun',
      159
);

INSERT INTO city
VALUES(
      6009,
      'Lanxi',
      159
);

INSERT INTO city
VALUES(
      6010,
      'Jiamusi',
      159
);

INSERT INTO city
VALUES(
      6011,
      'Suileng',
      159
);

INSERT INTO city
VALUES(
      6012,
      'Suihua',
      159
);

INSERT INTO city
VALUES(
      6013,
      'Zhaodong',
      159
);

INSERT INTO city
VALUES(
      6014,
      'Hailun',
      159
);

INSERT INTO city
VALUES(
      6015,
      'Zhuzhou',
      159
);

INSERT INTO city
VALUES(
      6016,
      'Nenjiang',
      159
);

INSERT INTO city
VALUES(
      6017,
      'Qinggang',
      159
);

INSERT INTO city
VALUES(
      6018,
      'Ningan',
      159
);

INSERT INTO city
VALUES(
      6019,
      'Yian',
      159
);

INSERT INTO city
VALUES(
      6020,
      'Mudangiang',
      159
);

INSERT INTO city
VALUES(
      6021,
      'Golmud',
      159
);

INSERT INTO city
VALUES(
      6022,
      'Jiayuguan',
      159
);

INSERT INTO city
VALUES(
      6023,
      'Pingxiang',
      159
);

INSERT INTO city
VALUES(
      6024,
      'Gyangze',
      159
);

INSERT INTO city
VALUES(
      6025,
      'Zhucheng',
      159
);

INSERT INTO city
VALUES(
      6026,
      'Zalantun',
      159
);

INSERT INTO city
VALUES(
      6027,
      'Shangzhi',
      159
);

INSERT INTO city
VALUES(
      6028,
      'Linkou',
      159
);

INSERT INTO city
VALUES(
      6029,
      'Pingliang',
      159
);

INSERT INTO city
VALUES(
      6030,
      'Zhangye',
      159
);

INSERT INTO city
VALUES(
      6031,
      'Angangxi',
      159
);

INSERT INTO city
VALUES(
      6032,
      'Tieli',
      159
);

INSERT INTO city
VALUES(
      6033,
      'Nagchu',
      159
);

INSERT INTO city
VALUES(
      6034,
      'Ganzhou',
      159
);

INSERT INTO city
VALUES(
      6035,
      'Hegang',
      159
);

INSERT INTO city
VALUES(
      6036,
      'Qinzhou',
      159
);

INSERT INTO city
VALUES(
      6037,
      'Beian',
      159
);

INSERT INTO city
VALUES(
      6038,
      'Yangjiang',
      159
);

INSERT INTO city
VALUES(
      6039,
      'Huaibei',
      159
);

INSERT INTO city
VALUES(
      6040,
      'Wuhai',
      159
);

INSERT INTO city
VALUES(
      6041,
      'Zixing',
      159
);

INSERT INTO city
VALUES(
      6042,
      'Anqing',
      159
);

INSERT INTO city
VALUES(
      6043,
      'Yaan',
      159
);

INSERT INTO city
VALUES(
      6044,
      'Urumqi',
      159
);

INSERT INTO city
VALUES(
      6045,
      'Lianxian',
      159
);

INSERT INTO city
VALUES(
      6046,
      'Wuwei',
      159
);

INSERT INTO city
VALUES(
      6047,
      'Luan',
      159
);

INSERT INTO city
VALUES(
      6048,
      'Altay',
      159
);

INSERT INTO city
VALUES(
      6049,
      'Qingdao',
      159
);

INSERT INTO city
VALUES(
      6050,
      'Liaocheng',
      159
);

INSERT INTO city
VALUES(
      6051,
      'Heihe',
      159
);

INSERT INTO city
VALUES(
      6052,
      'Leshan',
      159
);

INSERT INTO city
VALUES(
      6053,
      'Fulin',
      159
);

INSERT INTO city
VALUES(
      6054,
      'Erenhot',
      159
);

INSERT INTO city
VALUES(
      6055,
      'Puyang',
      159
);

INSERT INTO city
VALUES(
      6056,
      'Yancheng',
      159
);

INSERT INTO city
VALUES(
      6057,
      'Kashgar',
      159
);

INSERT INTO city
VALUES(
      6058,
      'Dezhou',
      159
);

INSERT INTO city
VALUES(
      6059,
      'Xiangtai',
      159
);

INSERT INTO city
VALUES(
      6060,
      'Rizhao',
      159
);

INSERT INTO city
VALUES(
      6061,
      'Heze',
      159
);

INSERT INTO city
VALUES(
      6062,
      'Gar',
      159
);

INSERT INTO city
VALUES(
      6063,
      'Jiaohe',
      159
);

INSERT INTO city
VALUES(
      6064,
      'Hechi',
      159
);

INSERT INTO city
VALUES(
      6065,
      'Xuanhua',
      159
);

INSERT INTO city
VALUES(
      6066,
      'Anyang',
      159
);

INSERT INTO city
VALUES(
      6067,
      'Kaifeng',
      159
);

INSERT INTO city
VALUES(
      6068,
      'Dengzhou',
      159
);

INSERT INTO city
VALUES(
      6069,
      'Xuchang',
      159
);

INSERT INTO city
VALUES(
      6070,
      'Xinxiang',
      159
);

INSERT INTO city
VALUES(
      6071,
      'Nyingchi',
      159
);

INSERT INTO city
VALUES(
      6072,
      'Yumen',
      159
);

INSERT INTO city
VALUES(
      6073,
      'Luohe',
      159
);

INSERT INTO city
VALUES(
      6074,
      'Zhoukou',
      159
);

INSERT INTO city
VALUES(
      6075,
      'Jinchang',
      159
);

INSERT INTO city
VALUES(
      6076,
      'Korla',
      159
);

INSERT INTO city
VALUES(
      6077,
      'Aksu',
      159
);

INSERT INTO city
VALUES(
      6078,
      'Hami',
      159
);

INSERT INTO city
VALUES(
      6079,
      'Kuqa',
      159
);

INSERT INTO city
VALUES(
      6080,
      'Turpan',
      159
);

INSERT INTO city
VALUES(
      6081,
      'Quiemo',
      159
);

INSERT INTO city
VALUES(
      6082,
      'Linchuan',
      159
);

INSERT INTO city
VALUES(
      6083,
      'Linqing',
      159
);

INSERT INTO city
VALUES(
      6084,
      'Koktokay',
      159
);

INSERT INTO city
VALUES(
      6085,
      'Jinxi',
      159
);

INSERT INTO city
VALUES(
      6086,
      'Chongqing',
      159
);

INSERT INTO city
VALUES(
      6087,
      'Xining',
      159
);

INSERT INTO city
VALUES(
      6088,
      'Lanzhou',
      159
);

INSERT INTO city
VALUES(
      6089,
      'Yinchuan',
      159
);

INSERT INTO city
VALUES(
      6090,
      'Hefei',
      159
);

INSERT INTO city
VALUES(
      6091,
      'Ankang',
      159
);

INSERT INTO city
VALUES(
      6092,
      'Jiexiu',
      159
);

INSERT INTO city
VALUES(
      6093,
      'Xianyang',
      159
);

INSERT INTO city
VALUES(
      6094,
      'Yulin',
      159
);

INSERT INTO city
VALUES(
      6095,
      'Fengzhen',
      159
);

INSERT INTO city
VALUES(
      6096,
      'Baoji',
      159
);

INSERT INTO city
VALUES(
      6097,
      'Tongchuan',
      159
);

INSERT INTO city
VALUES(
      6098,
      'Hanzhong',
      159
);

INSERT INTO city
VALUES(
      6099,
      'Xinzhou',
      159
);

INSERT INTO city
VALUES(
      6100,
      'Changzhi',
      159
);

INSERT INTO city
VALUES(
      6101,
      'Houma',
      159
);

INSERT INTO city
VALUES(
      6102,
      'Hulan Ergi',
      159
);

INSERT INTO city
VALUES(
      6103,
      'Xinyi',
      159
);

INSERT INTO city
VALUES(
      6104,
      'Qiqihar',
      159
);

INSERT INTO city
VALUES(
      6105,
      'Taonan',
      159
);

INSERT INTO city
VALUES(
      6106,
      'Baicheng',
      159
);

INSERT INTO city
VALUES(
      6107,
      'Ulanhot',
      159
);

INSERT INTO city
VALUES(
      6108,
      'Qitaihe',
      159
);

INSERT INTO city
VALUES(
      6109,
      'Chenzhou',
      159
);

INSERT INTO city
VALUES(
      6110,
      'Nanjing',
      159
);

INSERT INTO city
VALUES(
      6111,
      'Nantong',
      159
);

INSERT INTO city
VALUES(
      6112,
      'Yangzhou',
      159
);

INSERT INTO city
VALUES(
      6113,
      'Zhenjiang',
      159
);

INSERT INTO city
VALUES(
      6114,
      'Taizhou',
      159
);

INSERT INTO city
VALUES(
      6115,
      'Suzhou',
      159
);

INSERT INTO city
VALUES(
      6116,
      'Jiaojing',
      159
);

INSERT INTO city
VALUES(
      6117,
      'Jiaxing',
      159
);

INSERT INTO city
VALUES(
      6118,
      'Hangzhou',
      159
);

INSERT INTO city
VALUES(
      6119,
      'Huzhou',
      159
);

INSERT INTO city
VALUES(
      6120,
      'Huangyan',
      159
);

INSERT INTO city
VALUES(
      6121,
      'Linhai',
      159
);

INSERT INTO city
VALUES(
      6122,
      'Wenzhou',
      159
);

INSERT INTO city
VALUES(
      6123,
      'Jinhua',
      159
);

INSERT INTO city
VALUES(
      6124,
      'Lishui',
      159
);

INSERT INTO city
VALUES(
      6125,
      'Quzhou',
      159
);

INSERT INTO city
VALUES(
      6126,
      'Fuyang',
      159
);

INSERT INTO city
VALUES(
      6127,
      'Wafangdian',
      159
);

INSERT INTO city
VALUES(
      6128,
      'Zhuanghe',
      159
);

INSERT INTO city
VALUES(
      6129,
      'Dalian',
      159
);

INSERT INTO city
VALUES(
      6130,
      'Siping',
      159
);

INSERT INTO city
VALUES(
      6131,
      'Benxi',
      159
);

INSERT INTO city
VALUES(
      6132,
      'Liaoyang',
      159
);

INSERT INTO city
VALUES(
      6133,
      'Yingkow',
      159
);

INSERT INTO city
VALUES(
      6134,
      'Dandong',
      159
);

INSERT INTO city
VALUES(
      6135,
      'Huanren',
      159
);

INSERT INTO city
VALUES(
      6136,
      'Beipiao',
      159
);

INSERT INTO city
VALUES(
      6137,
      'Anshan',
      159
);

INSERT INTO city
VALUES(
      6138,
      'Lingyuan',
      159
);

INSERT INTO city
VALUES(
      6139,
      'Chaoyang',
      159
);

INSERT INTO city
VALUES(
      6140,
      'Jinzhou',
      159
);

INSERT INTO city
VALUES(
      6141,
      'Fushun',
      159
);

INSERT INTO city
VALUES(
      6142,
      'Tieling',
      159
);

INSERT INTO city
VALUES(
      6143,
      'Shenyeng',
      159
);

INSERT INTO city
VALUES(
      6144,
      'Hotan',
      159
);

INSERT INTO city
VALUES(
      6145,
      'Yining',
      159
);

INSERT INTO city
VALUES(
      6146,
      'Karamay',
      159
);

INSERT INTO city
VALUES(
      6147,
      'Tacheng',
      159
);

INSERT INTO city
VALUES(
      6148,
      'Ninde',
      159
);

INSERT INTO city
VALUES(
      6149,
      'Fuan',
      159
);

INSERT INTO country
VALUES(
      160,
      'Colombia'
);

INSERT INTO city
VALUES(
      6150,
      'Sincelejo',
      160
);

INSERT INTO city
VALUES(
      6151,
      'Quibdo',
      160
);

INSERT INTO city
VALUES(
      6152,
      'Leticia',
      160
);

INSERT INTO city
VALUES(
      6153,
      'Inirida',
      160
);

INSERT INTO city
VALUES(
      6154,
      'Pasto',
      160
);

INSERT INTO city
VALUES(
      6155,
      'Ibague',
      160
);

INSERT INTO city
VALUES(
      6156,
      'Cali',
      160
);

INSERT INTO city
VALUES(
      6157,
      'Barranquilla',
      160
);

INSERT INTO city
VALUES(
      6158,
      'Tolu',
      160
);

INSERT INTO city
VALUES(
      6159,
      'Yarumal',
      160
);

INSERT INTO city
VALUES(
      6160,
      'Riohacha',
      160
);

INSERT INTO city
VALUES(
      6161,
      'Pereira',
      160
);

INSERT INTO city
VALUES(
      6162,
      'Armenia',
      160
);

INSERT INTO city
VALUES(
      6163,
      'Cartagena',
      160
);

INSERT INTO city
VALUES(
      6164,
      'Tunja',
      160
);

INSERT INTO city
VALUES(
      6165,
      'Tumaco',
      160
);

INSERT INTO city
VALUES(
      6166,
      'Puerto Carreno',
      160
);

INSERT INTO city
VALUES(
      6167,
      'Arauca',
      160
);

INSERT INTO city
VALUES(
      6168,
      'Neiva',
      160
);

INSERT INTO city
VALUES(
      6169,
      'Villavicencio',
      160
);

INSERT INTO city
VALUES(
      6170,
      'Mocoa',
      160
);

INSERT INTO city
VALUES(
      6171,
      'Medellin',
      160
);

INSERT INTO city
VALUES(
      6172,
      'Yopal',
      160
);

INSERT INTO city
VALUES(
      6173,
      'San Jose del Guaviare',
      160
);

INSERT INTO city
VALUES(
      6174,
      'Valledupar',
      160
);

INSERT INTO city
VALUES(
      6175,
      'Bucaramanga',
      160
);

INSERT INTO city
VALUES(
      6176,
      'Monteria',
      160
);

INSERT INTO city
VALUES(
      6177,
      'Cucuta',
      160
);

INSERT INTO city
VALUES(
      6178,
      'Bogota',
      160
);

INSERT INTO city
VALUES(
      6179,
      'Santa Marta',
      160
);

INSERT INTO city
VALUES(
      6180,
      'Manizales',
      160
);

INSERT INTO city
VALUES(
      6181,
      'Florencia',
      160
);

INSERT INTO city
VALUES(
      6182,
      'Mitu',
      160
);

INSERT INTO city
VALUES(
      6183,
      'Popayan',
      160
);

INSERT INTO city
VALUES(
      6184,
      'Turbo',
      160
);

INSERT INTO city
VALUES(
      6185,
      'Puerto Berrio',
      160
);

INSERT INTO city
VALUES(
      6186,
      'San Vicente del Caguan',
      160
);

INSERT INTO city
VALUES(
      6187,
      'Nuqui',
      160
);

INSERT INTO city
VALUES(
      6188,
      'Jurado',
      160
);

INSERT INTO city
VALUES(
      6189,
      'San Andres',
      160
);

INSERT INTO city
VALUES(
      6190,
      'Bello',
      160
);

INSERT INTO city
VALUES(
      6191,
      'Sonson',
      160
);

INSERT INTO city
VALUES(
      6192,
      'Soledad',
      160
);

INSERT INTO city
VALUES(
      6193,
      'Sabanalarga',
      160
);

INSERT INTO city
VALUES(
      6194,
      'Orocue',
      160
);

INSERT INTO city
VALUES(
      6195,
      'Tame',
      160
);

INSERT INTO city
VALUES(
      6196,
      'Chiquinquira',
      160
);

INSERT INTO city
VALUES(
      6197,
      'Guapi',
      160
);

INSERT INTO city
VALUES(
      6198,
      'Duitama',
      160
);

INSERT INTO city
VALUES(
      6199,
      'Sogamoso',
      160
);

INSERT INTO city
VALUES(
      6200,
      'Cartago',
      160
);

INSERT INTO city
VALUES(
      6201,
      'Arjona',
      160
);

INSERT INTO city
VALUES(
      6202,
      'El Carmen de Bolivar',
      160
);

INSERT INTO city
VALUES(
      6203,
      'Magangue',
      160
);

INSERT INTO city
VALUES(
      6204,
      'Tulua',
      160
);

INSERT INTO city
VALUES(
      6205,
      'Buenaventura',
      160
);

INSERT INTO city
VALUES(
      6206,
      'Barrancabermeja',
      160
);

INSERT INTO city
VALUES(
      6207,
      'Honda',
      160
);

INSERT INTO city
VALUES(
      6208,
      'Lorica',
      160
);

INSERT INTO city
VALUES(
      6209,
      'Ayapel',
      160
);

INSERT INTO city
VALUES(
      6210,
      'Girardot',
      160
);

INSERT INTO city
VALUES(
      6211,
      'Ocana',
      160
);

INSERT INTO city
VALUES(
      6212,
      'Pamplona',
      160
);

INSERT INTO city
VALUES(
      6213,
      'San Martin',
      160
);

INSERT INTO city
VALUES(
      6214,
      'Puerto Lopez',
      160
);

INSERT INTO city
VALUES(
      6215,
      'Garzon',
      160
);

INSERT INTO city
VALUES(
      6216,
      'El Banco',
      160
);

INSERT INTO city
VALUES(
      6217,
      'Campoalegre',
      160
);

INSERT INTO city
VALUES(
      6218,
      'Tuquerres',
      160
);

INSERT INTO city
VALUES(
      6219,
      'Ipiales',
      160
);

INSERT INTO city
VALUES(
      6220,
      'Cienaga',
      160
);

INSERT INTO city
VALUES(
      6221,
      'Socorro',
      160
);

INSERT INTO country
VALUES(
      161,
      'Costa Rica'
);

INSERT INTO city
VALUES(
      6222,
      'San Jose',
      161
);

INSERT INTO city
VALUES(
      6223,
      'Sixaola',
      161
);

INSERT INTO city
VALUES(
      6224,
      'Alajuela',
      161
);

INSERT INTO city
VALUES(
      6225,
      'Canas',
      161
);

INSERT INTO city
VALUES(
      6226,
      'La Cruz',
      161
);

INSERT INTO city
VALUES(
      6227,
      'Cartago',
      161
);

INSERT INTO city
VALUES(
      6228,
      'Liberia',
      161
);

INSERT INTO city
VALUES(
      6229,
      'Heredia',
      161
);

INSERT INTO city
VALUES(
      6230,
      'Puerto Limon',
      161
);

INSERT INTO city
VALUES(
      6231,
      'Ciudad Cortes',
      161
);

INSERT INTO city
VALUES(
      6232,
      'Golfito',
      161
);

INSERT INTO city
VALUES(
      6233,
      'Quesada',
      161
);

INSERT INTO city
VALUES(
      6234,
      'Puntarenas',
      161
);

INSERT INTO country
VALUES(
      162,
      'Cuba'
);

INSERT INTO city
VALUES(
      6235,
      'Havana',
      162
);

INSERT INTO city
VALUES(
      6236,
      'Guines',
      162
);

INSERT INTO city
VALUES(
      6237,
      'San Antonio de los Banos',
      162
);

INSERT INTO city
VALUES(
      6238,
      'Colon',
      162
);

INSERT INTO city
VALUES(
      6239,
      'Placetas',
      162
);

INSERT INTO city
VALUES(
      6240,
      'Sagua la Grande',
      162
);

INSERT INTO city
VALUES(
      6241,
      'Manzanillo',
      162
);

INSERT INTO city
VALUES(
      6242,
      'Moron',
      162
);

INSERT INTO city
VALUES(
      6243,
      'Caibarien',
      162
);

INSERT INTO city
VALUES(
      6244,
      'Artemisa',
      162
);

INSERT INTO city
VALUES(
      6245,
      'Bayamo',
      162
);

INSERT INTO city
VALUES(
      6246,
      'Camaguey',
      162
);

INSERT INTO city
VALUES(
      6247,
      'Ciego de Avila',
      162
);

INSERT INTO city
VALUES(
      6248,
      'Cienfuegos',
      162
);

INSERT INTO city
VALUES(
      6249,
      'Guantanamo',
      162
);

INSERT INTO city
VALUES(
      6250,
      'Holguin',
      162
);

INSERT INTO city
VALUES(
      6251,
      'Matanzas',
      162
);

INSERT INTO city
VALUES(
      6252,
      'Nueva Gerona',
      162
);

INSERT INTO city
VALUES(
      6253,
      'Pinar del Rio',
      162
);

INSERT INTO city
VALUES(
      6254,
      'San Jose de las Lajas',
      162
);

INSERT INTO city
VALUES(
      6255,
      'Sancti Spiritus',
      162
);

INSERT INTO city
VALUES(
      6256,
      'Santa Clara',
      162
);

INSERT INTO city
VALUES(
      6257,
      'Santiago de Cuba',
      162
);

INSERT INTO city
VALUES(
      6258,
      'Las Tunas',
      162
);

INSERT INTO city
VALUES(
      6259,
      'Banes',
      162
);

INSERT INTO city
VALUES(
      6260,
      'Palma Soriano',
      162
);

INSERT INTO city
VALUES(
      6261,
      'Nuevitas',
      162
);

INSERT INTO country
VALUES(
      163,
      'Cabo Verde'
);

INSERT INTO city
VALUES(
      6262,
      'Vila da Ribeira Brava',
      163
);

INSERT INTO city
VALUES(
      6263,
      'Tarrafal',
      163
);

INSERT INTO city
VALUES(
      6264,
      'Vila do Maio',
      163
);

INSERT INTO city
VALUES(
      6265,
      'Vila Nova Sintra',
      163
);

INSERT INTO city
VALUES(
      6266,
      'Porto dos Mosteiros',
      163
);

INSERT INTO city
VALUES(
      6267,
      'Sao Domingos',
      163
);

INSERT INTO city
VALUES(
      6268,
      'Picos',
      163
);

INSERT INTO city
VALUES(
      6269,
      'Santa Maria',
      163
);

INSERT INTO city
VALUES(
      6270,
      'Sao Filipe',
      163
);

INSERT INTO city
VALUES(
      6271,
      'Tarrafal',
      163
);

INSERT INTO city
VALUES(
      6272,
      'Praia',
      163
);

INSERT INTO city
VALUES(
      6273,
      'Assomada',
      163
);

INSERT INTO city
VALUES(
      6274,
      'Cidade Velha',
      163
);

INSERT INTO city
VALUES(
      6275,
      'Cova Figueira',
      163
);

INSERT INTO city
VALUES(
      6276,
      'Mindelo',
      163
);

INSERT INTO city
VALUES(
      6277,
      'Porto Novo',
      163
);

INSERT INTO city
VALUES(
      6278,
      'Ribeira Grande',
      163
);

INSERT INTO city
VALUES(
      6279,
      'Pombas',
      163
);

INSERT INTO city
VALUES(
      6280,
      'Calheta de Sao Miguel',
      163
);

INSERT INTO city
VALUES(
      6281,
      'Vila de Sal Rei',
      163
);

INSERT INTO country
VALUES(
      164,
      'Curaçao'
);

INSERT INTO city
VALUES(
      6282,
      'Willemstad',
      164
);

INSERT INTO country
VALUES(
      165,
      'Christmas Island'
);

INSERT INTO city
VALUES(
      6283,
      'Flying Fish Cove',
      165
);

INSERT INTO country
VALUES(
      166,
      'Cyprus'
);

INSERT INTO city
VALUES(
      6284,
      'Lemosos',
      166
);

INSERT INTO city
VALUES(
      6285,
      'Famagusta',
      166
);

INSERT INTO city
VALUES(
      6286,
      'Larnaka',
      166
);

INSERT INTO city
VALUES(
      6287,
      'Kyrenia',
      166
);

INSERT INTO city
VALUES(
      6288,
      'Paphos',
      166
);

INSERT INTO city
VALUES(
      6289,
      'Nicosia',
      166
);

INSERT INTO country
VALUES(
      167,
      'Czechia'
);

INSERT INTO city
VALUES(
      6290,
      'Usti Nad Labem',
      167
);

INSERT INTO city
VALUES(
      6291,
      'Pardubice',
      167
);

INSERT INTO city
VALUES(
      6292,
      'Jihlava',
      167
);

INSERT INTO city
VALUES(
      6293,
      'Liberec',
      167
);

INSERT INTO city
VALUES(
      6294,
      'Prague',
      167
);

INSERT INTO city
VALUES(
      6295,
      'Brno',
      167
);

INSERT INTO city
VALUES(
      6296,
      'Pizen',
      167
);

INSERT INTO city
VALUES(
      6297,
      'Ceske Budejovice',
      167
);

INSERT INTO city
VALUES(
      6298,
      'Karlovy Vary',
      167
);

INSERT INTO city
VALUES(
      6299,
      'Ostrava',
      167
);

INSERT INTO city
VALUES(
      6300,
      'Olomouc',
      167
);

INSERT INTO city
VALUES(
      6301,
      'Hradec Kralove',
      167
);

INSERT INTO city
VALUES(
      6302,
      'Zlin',
      167
);

INSERT INTO country
VALUES(
      168,
      'Germany'
);

INSERT INTO city
VALUES(
      6303,
      'Berlin',
      168
);

INSERT INTO city
VALUES(
      6304,
      'Cologne',
      168
);

INSERT INTO city
VALUES(
      6305,
      'Munich',
      168
);

INSERT INTO city
VALUES(
      6306,
      'Potsdam',
      168
);

INSERT INTO city
VALUES(
      6307,
      'Kiel',
      168
);

INSERT INTO city
VALUES(
      6308,
      'Wiesbaden',
      168
);

INSERT INTO city
VALUES(
      6309,
      'Magdeburg',
      168
);

INSERT INTO city
VALUES(
      6310,
      'Bremen',
      168
);

INSERT INTO city
VALUES(
      6311,
      'Hannover',
      168
);

INSERT INTO city
VALUES(
      6312,
      'Dusseldorf',
      168
);

INSERT INTO city
VALUES(
      6313,
      'Saarbrucken',
      168
);

INSERT INTO city
VALUES(
      6314,
      'Schwerin',
      168
);

INSERT INTO city
VALUES(
      6315,
      'Hamburg',
      168
);

INSERT INTO city
VALUES(
      6316,
      'Stuttgart',
      168
);

INSERT INTO city
VALUES(
      6317,
      'Dresden',
      168
);

INSERT INTO city
VALUES(
      6318,
      'Erfurt',
      168
);

INSERT INTO city
VALUES(
      6319,
      'Mainz',
      168
);

INSERT INTO city
VALUES(
      6320,
      'Rostock',
      168
);

INSERT INTO city
VALUES(
      6321,
      'Kassel',
      168
);

INSERT INTO city
VALUES(
      6322,
      'Dortmund',
      168
);

INSERT INTO city
VALUES(
      6323,
      'Duisburg',
      168
);

INSERT INTO city
VALUES(
      6324,
      'Essen',
      168
);

INSERT INTO city
VALUES(
      6325,
      'Bonn',
      168
);

INSERT INTO city
VALUES(
      6326,
      'Bielefeld',
      168
);

INSERT INTO city
VALUES(
      6327,
      'Lubeck',
      168
);

INSERT INTO city
VALUES(
      6328,
      'Flensburg',
      168
);

INSERT INTO city
VALUES(
      6329,
      'Emden',
      168
);

INSERT INTO city
VALUES(
      6330,
      'Wuppertal',
      168
);

INSERT INTO city
VALUES(
      6331,
      'Munster',
      168
);

INSERT INTO city
VALUES(
      6332,
      'Osnabruck',
      168
);

INSERT INTO city
VALUES(
      6333,
      'Gottingen',
      168
);

INSERT INTO city
VALUES(
      6334,
      'Oldenburg',
      168
);

INSERT INTO city
VALUES(
      6335,
      'Stralsund',
      168
);

INSERT INTO city
VALUES(
      6336,
      'Braunschweig',
      168
);

INSERT INTO city
VALUES(
      6337,
      'Bremerhaven',
      168
);

INSERT INTO city
VALUES(
      6338,
      'Freiburg',
      168
);

INSERT INTO city
VALUES(
      6339,
      'Karlsruhe',
      168
);

INSERT INTO city
VALUES(
      6340,
      'Heidelberg',
      168
);

INSERT INTO city
VALUES(
      6341,
      'Ingolstadt',
      168
);

INSERT INTO city
VALUES(
      6342,
      'Passau',
      168
);

INSERT INTO city
VALUES(
      6343,
      'Rosenheim',
      168
);

INSERT INTO city
VALUES(
      6344,
      'Augsburg',
      168
);

INSERT INTO city
VALUES(
      6345,
      'Regensburg',
      168
);

INSERT INTO city
VALUES(
      6346,
      'Wurzburg',
      168
);

INSERT INTO city
VALUES(
      6347,
      'Coburg',
      168
);

INSERT INTO city
VALUES(
      6348,
      'Hof',
      168
);

INSERT INTO city
VALUES(
      6349,
      'Ulm',
      168
);

INSERT INTO city
VALUES(
      6350,
      'Nurnberg',
      168
);

INSERT INTO city
VALUES(
      6351,
      'Furth',
      168
);

INSERT INTO city
VALUES(
      6352,
      'Giessen',
      168
);

INSERT INTO city
VALUES(
      6353,
      'Mannheim',
      168
);

INSERT INTO city
VALUES(
      6354,
      'Frankfurt',
      168
);

INSERT INTO city
VALUES(
      6355,
      'Koblenz',
      168
);

INSERT INTO city
VALUES(
      6356,
      'Chemnitz',
      168
);

INSERT INTO city
VALUES(
      6357,
      'Cottbus',
      168
);

INSERT INTO city
VALUES(
      6358,
      'Jena',
      168
);

INSERT INTO city
VALUES(
      6359,
      'Gera',
      168
);

INSERT INTO city
VALUES(
      6360,
      'Leipzig',
      168
);

INSERT INTO country
VALUES(
      169,
      'Djibouti'
);

INSERT INTO city
VALUES(
      6361,
      'Tadjoura',
      169
);

INSERT INTO city
VALUES(
      6362,
      'Arta',
      169
);

INSERT INTO city
VALUES(
      6363,
      'Ali Sabih',
      169
);

INSERT INTO city
VALUES(
      6364,
      'Dikhil',
      169
);

INSERT INTO city
VALUES(
      6365,
      'Djibouti',
      169
);

INSERT INTO city
VALUES(
      6366,
      'Obock',
      169
);

INSERT INTO country
VALUES(
      170,
      'Denmark'
);

INSERT INTO city
VALUES(
      6367,
      'Vejle',
      170
);

INSERT INTO city
VALUES(
      6368,
      'Hillerod',
      170
);

INSERT INTO city
VALUES(
      6369,
      'Kobenhavn',
      170
);

INSERT INTO city
VALUES(
      6370,
      'Viborg',
      170
);

INSERT INTO city
VALUES(
      6371,
      'Soro',
      170
);

INSERT INTO city
VALUES(
      6372,
      'Roskilde',
      170
);

INSERT INTO city
VALUES(
      6373,
      'Odense',
      170
);

INSERT INTO city
VALUES(
      6374,
      'Svendborg',
      170
);

INSERT INTO city
VALUES(
      6375,
      'Esbjerg',
      170
);

INSERT INTO city
VALUES(
      6376,
      'Aarhus',
      170
);

INSERT INTO city
VALUES(
      6377,
      'Aalborg',
      170
);

INSERT INTO city
VALUES(
      6378,
      'Frederikshavn',
      170
);

INSERT INTO country
VALUES(
      171,
      'Dominica'
);

INSERT INTO city
VALUES(
      6379,
      'Roseau',
      171
);

INSERT INTO country
VALUES(
      172,
      'Dominican Republic'
);

INSERT INTO city
VALUES(
      6380,
      'El Seibo',
      172
);

INSERT INTO city
VALUES(
      6381,
      'Cotui',
      172
);

INSERT INTO city
VALUES(
      6382,
      'Pedernales',
      172
);

INSERT INTO city
VALUES(
      6383,
      'Neiba',
      172
);

INSERT INTO city
VALUES(
      6384,
      'Jimani',
      172
);

INSERT INTO city
VALUES(
      6385,
      'Comendador',
      172
);

INSERT INTO city
VALUES(
      6386,
      'Monte Cristi',
      172
);

INSERT INTO city
VALUES(
      6387,
      'Sabaneta',
      172
);

INSERT INTO city
VALUES(
      6388,
      'Dajabon',
      172
);

INSERT INTO city
VALUES(
      6389,
      'Puerto Plata',
      172
);

INSERT INTO city
VALUES(
      6390,
      'Moca',
      172
);

INSERT INTO city
VALUES(
      6391,
      'Samana',
      172
);

INSERT INTO city
VALUES(
      6392,
      'Higuey',
      172
);

INSERT INTO city
VALUES(
      6393,
      'Monte Plata',
      172
);

INSERT INTO city
VALUES(
      6394,
      'Hato Mayor',
      172
);

INSERT INTO city
VALUES(
      6395,
      'Nagua',
      172
);

INSERT INTO city
VALUES(
      6396,
      'Salcedo',
      172
);

INSERT INTO city
VALUES(
      6397,
      'Azua',
      172
);

INSERT INTO city
VALUES(
      6398,
      'Bani',
      172
);

INSERT INTO city
VALUES(
      6399,
      'Bonao',
      172
);

INSERT INTO city
VALUES(
      6400,
      'San Francisco de Macoris',
      172
);

INSERT INTO city
VALUES(
      6401,
      'Mao',
      172
);

INSERT INTO city
VALUES(
      6402,
      'Santo Domingo Este',
      172
);

INSERT INTO city
VALUES(
      6403,
      'San Cristobal',
      172
);

INSERT INTO city
VALUES(
      6404,
      'La Romana',
      172
);

INSERT INTO city
VALUES(
      6405,
      'Santiago',
      172
);

INSERT INTO city
VALUES(
      6406,
      'Santo Domingo',
      172
);

INSERT INTO city
VALUES(
      6407,
      'La Vega',
      172
);

INSERT INTO city
VALUES(
      6408,
      'San Juan',
      172
);

INSERT INTO city
VALUES(
      6409,
      'Barahona',
      172
);

INSERT INTO city
VALUES(
      6410,
      'San Pedro de Macoris',
      172
);

INSERT INTO city
VALUES(
      6411,
      'Bavaro',
      172
);

INSERT INTO country
VALUES(
      173,
      'Algeria'
);

INSERT INTO city
VALUES(
      6412,
      'Beni Ounif',
      173
);

INSERT INTO city
VALUES(
      6413,
      'Algiers',
      173
);

INSERT INTO city
VALUES(
      6414,
      'Hassi Messaoud',
      173
);

INSERT INTO city
VALUES(
      6415,
      'Touggourt',
      173
);

INSERT INTO city
VALUES(
      6416,
      'Djanet',
      173
);

INSERT INTO city
VALUES(
      6417,
      'I-n-Amenas',
      173
);

INSERT INTO city
VALUES(
      6418,
      'El Golea',
      173
);

INSERT INTO city
VALUES(
      6419,
      'In Amguel',
      173
);

INSERT INTO city
VALUES(
      6420,
      'Reggane',
      173
);

INSERT INTO city
VALUES(
      6421,
      'I-n-Salah',
      173
);

INSERT INTO city
VALUES(
      6422,
      'Timimoun',
      173
);

INSERT INTO city
VALUES(
      6423,
      'Sefra',
      173
);

INSERT INTO city
VALUES(
      6424,
      'Abadla',
      173
);

INSERT INTO city
VALUES(
      6425,
      'Oum el Bouaghi',
      173
);

INSERT INTO city
VALUES(
      6426,
      'Souk Ahras',
      173
);

INSERT INTO city
VALUES(
      6427,
      'Illizi',
      173
);

INSERT INTO city
VALUES(
      6428,
      'Tissemsilt',
      173
);

INSERT INTO city
VALUES(
      6429,
      'Tindouf',
      173
);

INSERT INTO city
VALUES(
      6430,
      'Tamanrasset',
      173
);

INSERT INTO city
VALUES(
      6431,
      'Ouargla',
      173
);

INSERT INTO city
VALUES(
      6432,
      'Masila',
      173
);

INSERT INTO city
VALUES(
      6433,
      'Guelma',
      173
);

INSERT INTO city
VALUES(
      6434,
      'El Oued',
      173
);

INSERT INTO city
VALUES(
      6435,
      'Bordj Bou Arreridj',
      173
);

INSERT INTO city
VALUES(
      6436,
      'Annaba',
      173
);

INSERT INTO city
VALUES(
      6437,
      'Ain Temouchent',
      173
);

INSERT INTO city
VALUES(
      6438,
      'Ain Defla',
      173
);

INSERT INTO city
VALUES(
      6439,
      'Adrar',
      173
);

INSERT INTO city
VALUES(
      6440,
      'Batna',
      173
);

INSERT INTO city
VALUES(
      6441,
      'Bechar',
      173
);

INSERT INTO city
VALUES(
      6442,
      'Bejaia',
      173
);

INSERT INTO city
VALUES(
      6443,
      'Biskra',
      173
);

INSERT INTO city
VALUES(
      6444,
      'Blida',
      173
);

INSERT INTO city
VALUES(
      6445,
      'Bouira',
      173
);

INSERT INTO city
VALUES(
      6446,
      'Boumerdes',
      173
);

INSERT INTO city
VALUES(
      6447,
      'Chlef',
      173
);

INSERT INTO city
VALUES(
      6448,
      'Constantine',
      173
);

INSERT INTO city
VALUES(
      6449,
      'Djelfa',
      173
);

INSERT INTO city
VALUES(
      6450,
      'El Bayadh',
      173
);

INSERT INTO city
VALUES(
      6451,
      'El Tarf',
      173
);

INSERT INTO city
VALUES(
      6452,
      'Ghardaia',
      173
);

INSERT INTO city
VALUES(
      6453,
      'Jijel',
      173
);

INSERT INTO city
VALUES(
      6454,
      'Khenchela',
      173
);

INSERT INTO city
VALUES(
      6455,
      'Laghouat',
      173
);

INSERT INTO city
VALUES(
      6456,
      'Mascara',
      173
);

INSERT INTO city
VALUES(
      6457,
      'Medea',
      173
);

INSERT INTO city
VALUES(
      6458,
      'Mila',
      173
);

INSERT INTO city
VALUES(
      6459,
      'Mostaganem',
      173
);

INSERT INTO city
VALUES(
      6460,
      'Naama',
      173
);

INSERT INTO city
VALUES(
      6461,
      'Oran',
      173
);

INSERT INTO city
VALUES(
      6462,
      'Relizane',
      173
);

INSERT INTO city
VALUES(
      6463,
      'Saida',
      173
);

INSERT INTO city
VALUES(
      6464,
      'Setif',
      173
);

INSERT INTO city
VALUES(
      6465,
      'Sidi bel Abbes',
      173
);

INSERT INTO city
VALUES(
      6466,
      'Skikda',
      173
);

INSERT INTO city
VALUES(
      6467,
      'Tebessa',
      173
);

INSERT INTO city
VALUES(
      6468,
      'Tiarat',
      173
);

INSERT INTO city
VALUES(
      6469,
      'Tipasa',
      173
);

INSERT INTO city
VALUES(
      6470,
      'Tizi-Ouzou',
      173
);

INSERT INTO city
VALUES(
      6471,
      'Tlimcen',
      173
);

INSERT INTO country
VALUES(
      174,
      'Ecuador'
);

INSERT INTO city
VALUES(
      6472,
      'Valdez',
      174
);

INSERT INTO city
VALUES(
      6473,
      'Pinas',
      174
);

INSERT INTO city
VALUES(
      6474,
      'Alausi',
      174
);

INSERT INTO city
VALUES(
      6475,
      'Yaupi',
      174
);

INSERT INTO city
VALUES(
      6476,
      'Quito',
      174
);

INSERT INTO city
VALUES(
      6477,
      'San Gabriel',
      174
);

INSERT INTO city
VALUES(
      6478,
      'Jipijapa',
      174
);

INSERT INTO city
VALUES(
      6479,
      'Santa Cruz',
      174
);

INSERT INTO city
VALUES(
      6480,
      'Puerto Villamil',
      174
);

INSERT INTO city
VALUES(
      6481,
      'Cayambe',
      174
);

INSERT INTO city
VALUES(
      6482,
      'Salinas',
      174
);

INSERT INTO city
VALUES(
      6483,
      'San Lorenzo',
      174
);

INSERT INTO city
VALUES(
      6484,
      'Milagro',
      174
);

INSERT INTO city
VALUES(
      6485,
      'Muisne',
      174
);

INSERT INTO city
VALUES(
      6486,
      'Zamora',
      174
);

INSERT INTO city
VALUES(
      6487,
      'Nueva Loja',
      174
);

INSERT INTO city
VALUES(
      6488,
      'Manta',
      174
);

INSERT INTO city
VALUES(
      6489,
      'Chone',
      174
);

INSERT INTO city
VALUES(
      6490,
      'Sangolqui',
      174
);

INSERT INTO city
VALUES(
      6491,
      'Macara',
      174
);

INSERT INTO city
VALUES(
      6492,
      'Guayaquil',
      174
);

INSERT INTO city
VALUES(
      6493,
      'Ibarra',
      174
);

INSERT INTO city
VALUES(
      6494,
      'Loja',
      174
);

INSERT INTO city
VALUES(
      6495,
      'Babahoyo',
      174
);

INSERT INTO city
VALUES(
      6496,
      'Portoviejo',
      174
);

INSERT INTO city
VALUES(
      6497,
      'Macas',
      174
);

INSERT INTO city
VALUES(
      6498,
      'Puyo',
      174
);

INSERT INTO city
VALUES(
      6499,
      'Ambato',
      174
);

INSERT INTO city
VALUES(
      6500,
      'Tena',
      174
);

INSERT INTO city
VALUES(
      6501,
      'Puerto Francisco de Orellana',
      174
);

INSERT INTO city
VALUES(
      6502,
      'Santo Domingo de los Colorados',
      174
);

INSERT INTO city
VALUES(
      6503,
      'Santa Elena',
      174
);

INSERT INTO city
VALUES(
      6504,
      'Puerto Baquerizo Moreno',
      174
);

INSERT INTO city
VALUES(
      6505,
      'Cuenca',
      174
);

INSERT INTO city
VALUES(
      6506,
      'Guaranda',
      174
);

INSERT INTO city
VALUES(
      6507,
      'Azogues',
      174
);

INSERT INTO city
VALUES(
      6508,
      'Tulcan',
      174
);

INSERT INTO city
VALUES(
      6509,
      'Riobamba',
      174
);

INSERT INTO city
VALUES(
      6510,
      'Latacunga',
      174
);

INSERT INTO city
VALUES(
      6511,
      'Machala',
      174
);

INSERT INTO city
VALUES(
      6512,
      'Esmeraldas',
      174
);

INSERT INTO country
VALUES(
      175,
      'Estonia'
);

INSERT INTO city
VALUES(
      6513,
      'Valga',
      175
);

INSERT INTO city
VALUES(
      6514,
      'Viljandi',
      175
);

INSERT INTO city
VALUES(
      6515,
      'Tallinn',
      175
);

INSERT INTO city
VALUES(
      6516,
      'Kardla',
      175
);

INSERT INTO city
VALUES(
      6517,
      'Rakvere',
      175
);

INSERT INTO city
VALUES(
      6518,
      'Parnu',
      175
);

INSERT INTO city
VALUES(
      6519,
      'Paide',
      175
);

INSERT INTO city
VALUES(
      6520,
      'Jogeva',
      175
);

INSERT INTO city
VALUES(
      6521,
      'Polva',
      175
);

INSERT INTO city
VALUES(
      6522,
      'Tartu',
      175
);

INSERT INTO city
VALUES(
      6523,
      'Rapla',
      175
);

INSERT INTO city
VALUES(
      6524,
      'Kuressaare',
      175
);

INSERT INTO city
VALUES(
      6525,
      'Johvi',
      175
);

INSERT INTO city
VALUES(
      6526,
      'Voru',
      175
);

INSERT INTO city
VALUES(
      6527,
      'Haapsalu',
      175
);

INSERT INTO city
VALUES(
      6528,
      'Kohtla-Jarve',
      175
);

INSERT INTO city
VALUES(
      6529,
      'Narva',
      175
);

INSERT INTO country
VALUES(
      176,
      'Egypt'
);

INSERT INTO city
VALUES(
      6530,
      'Berenice',
      176
);

INSERT INTO city
VALUES(
      6531,
      'Beni Mazar',
      176
);

INSERT INTO city
VALUES(
      6532,
      'Samalut',
      176
);

INSERT INTO city
VALUES(
      6533,
      'El Mansura',
      176
);

INSERT INTO city
VALUES(
      6534,
      'Mallawi',
      176
);

INSERT INTO city
VALUES(
      6535,
      'El Minya',
      176
);

INSERT INTO city
VALUES(
      6536,
      'Siwa',
      176
);

INSERT INTO city
VALUES(
      6537,
      'Matruh',
      176
);

INSERT INTO city
VALUES(
      6538,
      'Qena',
      176
);

INSERT INTO city
VALUES(
      6539,
      'Salum',
      176
);

INSERT INTO city
VALUES(
      6540,
      'El Daba',
      176
);

INSERT INTO city
VALUES(
      6541,
      'El Faiyum',
      176
);

INSERT INTO city
VALUES(
      6542,
      'Asyut',
      176
);

INSERT INTO city
VALUES(
      6543,
      'Bur Safaga',
      176
);

INSERT INTO city
VALUES(
      6544,
      'El Alamein',
      176
);

INSERT INTO city
VALUES(
      6545,
      'Kom Ombo',
      176
);

INSERT INTO city
VALUES(
      6546,
      'El Giza',
      176
);

INSERT INTO city
VALUES(
      6547,
      'Isna',
      176
);

INSERT INTO city
VALUES(
      6548,
      'El Kharga',
      176
);

INSERT INTO city
VALUES(
      6549,
      'Qasr Farafra',
      176
);

INSERT INTO city
VALUES(
      6550,
      'Girga',
      176
);

INSERT INTO city
VALUES(
      6551,
      'El Qasr',
      176
);

INSERT INTO city
VALUES(
      6552,
      'Hurghada',
      176
);

INSERT INTO city
VALUES(
      6553,
      'Sohag',
      176
);

INSERT INTO city
VALUES(
      6554,
      'El Tur',
      176
);

INSERT INTO city
VALUES(
      6555,
      'Bur Said',
      176
);

INSERT INTO city
VALUES(
      6556,
      'Tanta',
      176
);

INSERT INTO city
VALUES(
      6557,
      'Ismailia',
      176
);

INSERT INTO city
VALUES(
      6558,
      'Suez',
      176
);

INSERT INTO city
VALUES(
      6559,
      'Beni Suef',
      176
);

INSERT INTO city
VALUES(
      6560,
      'Aswan',
      176
);

INSERT INTO city
VALUES(
      6561,
      'Cairo',
      176
);

INSERT INTO city
VALUES(
      6562,
      'Dumyat',
      176
);

INSERT INTO city
VALUES(
      6563,
      'Zagazig',
      176
);

INSERT INTO city
VALUES(
      6564,
      'Alexandria',
      176
);

INSERT INTO city
VALUES(
      6565,
      'Shibin el Kom',
      176
);

INSERT INTO city
VALUES(
      6566,
      'El Arish',
      176
);

INSERT INTO city
VALUES(
      6567,
      'Damanhur',
      176
);

INSERT INTO city
VALUES(
      6568,
      'Luxor',
      176
);

INSERT INTO city
VALUES(
      6569,
      'Rashid',
      176
);

INSERT INTO city
VALUES(
      6570,
      'Kafr el Sheikh',
      176
);

INSERT INTO city
VALUES(
      6571,
      'Benha',
      176
);

INSERT INTO country
VALUES(
      177,
      'Eritrea'
);

INSERT INTO city
VALUES(
      6572,
      'Tessenei',
      177
);

INSERT INTO city
VALUES(
      6573,
      'Mendefera',
      177
);

INSERT INTO city
VALUES(
      6574,
      'Assab',
      177
);

INSERT INTO city
VALUES(
      6575,
      'Agordat',
      177
);

INSERT INTO city
VALUES(
      6576,
      'Barentu',
      177
);

INSERT INTO city
VALUES(
      6577,
      'Massawa',
      177
);

INSERT INTO city
VALUES(
      6578,
      'Asmara',
      177
);

INSERT INTO city
VALUES(
      6579,
      'Keren',
      177
);

INSERT INTO country
VALUES(
      178,
      'Spain'
);

INSERT INTO city
VALUES(
      6580,
      'Vitoria',
      178
);

INSERT INTO city
VALUES(
      6581,
      'Santander',
      178
);

INSERT INTO city
VALUES(
      6582,
      'Logrono',
      178
);

INSERT INTO city
VALUES(
      6583,
      'Barcelona',
      178
);

INSERT INTO city
VALUES(
      6584,
      'Mataro',
      178
);

INSERT INTO city
VALUES(
      6585,
      'Oviedo',
      178
);

INSERT INTO city
VALUES(
      6586,
      'Arrecife',
      178
);

INSERT INTO city
VALUES(
      6587,
      'Las Palmas',
      178
);

INSERT INTO city
VALUES(
      6588,
      'Toledo',
      178
);

INSERT INTO city
VALUES(
      6589,
      'Lorca',
      178
);

INSERT INTO city
VALUES(
      6590,
      'Zaragoza',
      178
);

INSERT INTO city
VALUES(
      6591,
      'Murcia',
      178
);

INSERT INTO city
VALUES(
      6592,
      'Gijon',
      178
);

INSERT INTO city
VALUES(
      6593,
      'Linares',
      178
);

INSERT INTO city
VALUES(
      6594,
      'Cartagena',
      178
);

INSERT INTO city
VALUES(
      6595,
      'Vigo',
      178
);

INSERT INTO city
VALUES(
      6596,
      'Valladolid',
      178
);

INSERT INTO city
VALUES(
      6597,
      'Santiago de Compostela',
      178
);

INSERT INTO city
VALUES(
      6598,
      'Merida',
      178
);

INSERT INTO city
VALUES(
      6599,
      'Algeciras',
      178
);

INSERT INTO city
VALUES(
      6600,
      'Marbella',
      178
);

INSERT INTO city
VALUES(
      6601,
      'Almeria',
      178
);

INSERT INTO city
VALUES(
      6602,
      'Cordoba',
      178
);

INSERT INTO city
VALUES(
      6603,
      'Granada',
      178
);

INSERT INTO city
VALUES(
      6604,
      'Jaen',
      178
);

INSERT INTO city
VALUES(
      6605,
      'Malaga',
      178
);

INSERT INTO city
VALUES(
      6606,
      'Albacete',
      178
);

INSERT INTO city
VALUES(
      6607,
      'Guadalajara',
      178
);

INSERT INTO city
VALUES(
      6608,
      'Burgos',
      178
);

INSERT INTO city
VALUES(
      6609,
      'Leon',
      178
);

INSERT INTO city
VALUES(
      6610,
      'Salamanca',
      178
);

INSERT INTO city
VALUES(
      6611,
      'Huelva',
      178
);

INSERT INTO city
VALUES(
      6612,
      'Cadiz',
      178
);

INSERT INTO city
VALUES(
      6613,
      'Ceuta',
      178
);

INSERT INTO city
VALUES(
      6614,
      'Melilla',
      178
);

INSERT INTO city
VALUES(
      6615,
      'Tarragona',
      178
);

INSERT INTO city
VALUES(
      6616,
      'Badajoz',
      178
);

INSERT INTO city
VALUES(
      6617,
      'La Coruna',
      178
);

INSERT INTO city
VALUES(
      6618,
      'Ourense',
      178
);

INSERT INTO city
VALUES(
      6619,
      'Bilbao',
      178
);

INSERT INTO city
VALUES(
      6620,
      'Santa Cruz de Tenerife',
      178
);

INSERT INTO city
VALUES(
      6621,
      'Seville',
      178
);

INSERT INTO city
VALUES(
      6622,
      'Pamplona',
      178
);

INSERT INTO city
VALUES(
      6623,
      'Palma',
      178
);

INSERT INTO city
VALUES(
      6624,
      'Valencia',
      178
);

INSERT INTO city
VALUES(
      6625,
      'Madrid',
      178
);

INSERT INTO city
VALUES(
      6626,
      'San Sebastian',
      178
);

INSERT INTO city
VALUES(
      6627,
      'Alicante',
      178
);

INSERT INTO city
VALUES(
      6628,
      'Castello',
      178
);

INSERT INTO country
VALUES(
      179,
      'Ethiopia'
);

INSERT INTO city
VALUES(
      6629,
      'Adigrat',
      179
);

INSERT INTO city
VALUES(
      6630,
      'Aksum',
      179
);

INSERT INTO city
VALUES(
      6631,
      'Gonder',
      179
);

INSERT INTO city
VALUES(
      6632,
      'Nazret',
      179
);

INSERT INTO city
VALUES(
      6633,
      'Sodo',
      179
);

INSERT INTO city
VALUES(
      6634,
      'Asela',
      179
);

INSERT INTO city
VALUES(
      6635,
      'Dila',
      179
);

INSERT INTO city
VALUES(
      6636,
      'Nagele',
      179
);

INSERT INTO city
VALUES(
      6637,
      'Dembi Dolo',
      179
);

INSERT INTO city
VALUES(
      6638,
      'Dese',
      179
);

INSERT INTO city
VALUES(
      6639,
      'Bahir Dar',
      179
);

INSERT INTO city
VALUES(
      6640,
      'Hagere Hiywet',
      179
);

INSERT INTO city
VALUES(
      6641,
      'Gode',
      179
);

INSERT INTO city
VALUES(
      6642,
      'Giyon',
      179
);

INSERT INTO city
VALUES(
      6643,
      'Shashemene',
      179
);

INSERT INTO city
VALUES(
      6644,
      'Hosaina',
      179
);

INSERT INTO city
VALUES(
      6645,
      'Nekemte',
      179
);

INSERT INTO city
VALUES(
      6646,
      'Yirga Alem',
      179
);

INSERT INTO city
VALUES(
      6647,
      'Gore',
      179
);

INSERT INTO city
VALUES(
      6648,
      'Gimbi',
      179
);

INSERT INTO city
VALUES(
      6649,
      'Jima',
      179
);

INSERT INTO city
VALUES(
      6650,
      'Debre Markos',
      179
);

INSERT INTO city
VALUES(
      6651,
      'Dolo Bay',
      179
);

INSERT INTO city
VALUES(
      6652,
      'Arba Minch',
      179
);

INSERT INTO city
VALUES(
      6653,
      'Awasa',
      179
);

INSERT INTO city
VALUES(
      6654,
      'Asosa',
      179
);

INSERT INTO city
VALUES(
      6655,
      'Gambela',
      179
);

INSERT INTO city
VALUES(
      6656,
      'Jijiga',
      179
);

INSERT INTO city
VALUES(
      6657,
      'Goba',
      179
);

INSERT INTO city
VALUES(
      6658,
      'Addis Ababa',
      179
);

INSERT INTO city
VALUES(
      6659,
      'Bati',
      179
);

INSERT INTO city
VALUES(
      6660,
      'Dire Dawa',
      179
);

INSERT INTO city
VALUES(
      6661,
      'Mekele',
      179
);

INSERT INTO city
VALUES(
      6662,
      'Debre Birhan',
      179
);

INSERT INTO city
VALUES(
      6663,
      'Harar',
      179
);

INSERT INTO city
VALUES(
      6664,
      'Semera',
      179
);

INSERT INTO country
VALUES(
      180,
      'Finland'
);

INSERT INTO city
VALUES(
      6665,
      'Pori',
      180
);

INSERT INTO city
VALUES(
      6666,
      'Kuopio',
      180
);

INSERT INTO city
VALUES(
      6667,
      'Jyvaskyla',
      180
);

INSERT INTO city
VALUES(
      6668,
      'Rovaniemi',
      180
);

INSERT INTO city
VALUES(
      6669,
      'Lahti',
      180
);

INSERT INTO city
VALUES(
      6670,
      'Mikkeli',
      180
);

INSERT INTO city
VALUES(
      6671,
      'Oulu',
      180
);

INSERT INTO city
VALUES(
      6672,
      'Hameenlinna',
      180
);

INSERT INTO city
VALUES(
      6673,
      'Seinajoki',
      180
);

INSERT INTO city
VALUES(
      6674,
      'Tampere',
      180
);

INSERT INTO city
VALUES(
      6675,
      'Kajaani',
      180
);

INSERT INTO city
VALUES(
      6676,
      'Lappeenranta',
      180
);

INSERT INTO city
VALUES(
      6677,
      'Joensuu',
      180
);

INSERT INTO city
VALUES(
      6678,
      'Kouvola',
      180
);

INSERT INTO city
VALUES(
      6679,
      'Helsinki',
      180
);

INSERT INTO city
VALUES(
      6680,
      'Kemi',
      180
);

INSERT INTO city
VALUES(
      6681,
      'Mariehamn',
      180
);

INSERT INTO city
VALUES(
      6682,
      'Porvoo',
      180
);

INSERT INTO city
VALUES(
      6683,
      'Turku',
      180
);

INSERT INTO city
VALUES(
      6684,
      'Sodankyla',
      180
);

INSERT INTO city
VALUES(
      6685,
      'Kemijarvi',
      180
);

INSERT INTO city
VALUES(
      6686,
      'Kokkola',
      180
);

INSERT INTO city
VALUES(
      6687,
      'Vaasa',
      180
);

INSERT INTO city
VALUES(
      6688,
      'Savonlinna',
      180
);

INSERT INTO country
VALUES(
      181,
      'Fiji'
);

INSERT INTO city
VALUES(
      6689,
      'Lautoka',
      181
);

INSERT INTO city
VALUES(
      6690,
      'Nandi',
      181
);

INSERT INTO city
VALUES(
      6691,
      'Suva',
      181
);

INSERT INTO city
VALUES(
      6692,
      'Labasa',
      181
);

INSERT INTO country
VALUES(
      182,
      'Falkland Islands (Islas Malvinas)'
);

INSERT INTO city
VALUES(
      6693,
      'Stanley',
      182
);

INSERT INTO country
VALUES(
      183,
      'Micronesi'
);

INSERT INTO city
VALUES(
      6694,
      'Kolonia',
      183
);

INSERT INTO city
VALUES(
      6695,
      'Colonia',
      183
);

INSERT INTO city
VALUES(
      6696,
      'Palikir',
      183
);

INSERT INTO city
VALUES(
      6697,
      'Weno',
      183
);

INSERT INTO city
VALUES(
      6698,
      'Tofol',
      183
);

INSERT INTO country
VALUES(
      184,
      'Faroe Islands'
);

INSERT INTO city
VALUES(
      6699,
      'Porkeri',
      184
);

INSERT INTO city
VALUES(
      6700,
      'Saltangara',
      184
);

INSERT INTO city
VALUES(
      6701,
      'Sandavagur',
      184
);

INSERT INTO city
VALUES(
      6702,
      'Sandur',
      184
);

INSERT INTO city
VALUES(
      6703,
      'Skalavik',
      184
);

INSERT INTO city
VALUES(
      6704,
      'Skopun',
      184
);

INSERT INTO city
VALUES(
      6705,
      'Skuvoy',
      184
);

INSERT INTO city
VALUES(
      6706,
      'Sumba',
      184
);

INSERT INTO city
VALUES(
      6707,
      'Kirkja',
      184
);

INSERT INTO city
VALUES(
      6708,
      'Oyrarbakki',
      184
);

INSERT INTO city
VALUES(
      6709,
      'Hvalba',
      184
);

INSERT INTO city
VALUES(
      6710,
      'Hvannasund',
      184
);

INSERT INTO city
VALUES(
      6711,
      'Eidhi',
      184
);

INSERT INTO city
VALUES(
      6712,
      'Famjin',
      184
);

INSERT INTO city
VALUES(
      6713,
      'Fuglafjordhur',
      184
);

INSERT INTO city
VALUES(
      6714,
      'Hov',
      184
);

INSERT INTO city
VALUES(
      6715,
      'Kunoy',
      184
);

INSERT INTO city
VALUES(
      6716,
      'Kvivik',
      184
);

INSERT INTO city
VALUES(
      6717,
      'Nordhragota',
      184
);

INSERT INTO city
VALUES(
      6718,
      'Klaksvik',
      184
);

INSERT INTO city
VALUES(
      6719,
      'Husavik',
      184
);

INSERT INTO city
VALUES(
      6720,
      'Torshavn',
      184
);

INSERT INTO city
VALUES(
      6721,
      'Toftir',
      184
);

INSERT INTO city
VALUES(
      6722,
      'Sorvagur',
      184
);

INSERT INTO city
VALUES(
      6723,
      'Strendur',
      184
);

INSERT INTO city
VALUES(
      6724,
      'Tvoroyri',
      184
);

INSERT INTO city
VALUES(
      6725,
      'Vagur',
      184
);

INSERT INTO city
VALUES(
      6726,
      'Vestmanna',
      184
);

INSERT INTO city
VALUES(
      6727,
      'Vidhareidhi',
      184
);

INSERT INTO country
VALUES(
      185,
      'France'
);

INSERT INTO city
VALUES(
      6728,
      'Lorient',
      185
);

INSERT INTO city
VALUES(
      6729,
      'Brest',
      185
);

INSERT INTO city
VALUES(
      6730,
      'Aix-en-Provence',
      185
);

INSERT INTO city
VALUES(
      6731,
      'Ajaccio',
      185
);

INSERT INTO city
VALUES(
      6732,
      'Marseille',
      185
);

INSERT INTO city
VALUES(
      6733,
      'Rennes',
      185
);

INSERT INTO city
VALUES(
      6734,
      'Nantes',
      185
);

INSERT INTO city
VALUES(
      6735,
      'Orleans',
      185
);

INSERT INTO city
VALUES(
      6736,
      'Paris',
      185
);

INSERT INTO city
VALUES(
      6737,
      'Clermont-Ferrand',
      185
);

INSERT INTO city
VALUES(
      6738,
      'Montpellier',
      185
);

INSERT INTO city
VALUES(
      6739,
      'Poitier',
      185
);

INSERT INTO city
VALUES(
      6740,
      'Bordeaux',
      185
);

INSERT INTO city
VALUES(
      6741,
      'Limoges',
      185
);

INSERT INTO city
VALUES(
      6742,
      'Dijon',
      185
);

INSERT INTO city
VALUES(
      6743,
      'Lille',
      185
);

INSERT INTO city
VALUES(
      6744,
      'Lyon',
      185
);

INSERT INTO city
VALUES(
      6745,
      'Toulouse',
      185
);

INSERT INTO city
VALUES(
      6746,
      'Rouen',
      185
);

INSERT INTO city
VALUES(
      6747,
      'Amiens',
      185
);

INSERT INTO city
VALUES(
      6748,
      'Besancon',
      185
);

INSERT INTO city
VALUES(
      6749,
      'Caen',
      185
);

INSERT INTO city
VALUES(
      6750,
      'Vichy',
      185
);

INSERT INTO city
VALUES(
      6751,
      'Biarritz',
      185
);

INSERT INTO city
VALUES(
      6752,
      'Cherbourg',
      185
);

INSERT INTO city
VALUES(
      6753,
      'Reims',
      185
);

INSERT INTO city
VALUES(
      6754,
      'Calais',
      185
);

INSERT INTO city
VALUES(
      6755,
      'Roanne',
      185
);

INSERT INTO city
VALUES(
      6756,
      'Dieppe',
      185
);

INSERT INTO city
VALUES(
      6757,
      'Le Havre',
      185
);

INSERT INTO city
VALUES(
      6758,
      'Brive',
      185
);

INSERT INTO city
VALUES(
      6759,
      'Beziers',
      185
);

INSERT INTO city
VALUES(
      6760,
      'St.-Brieuc',
      185
);

INSERT INTO city
VALUES(
      6761,
      'Angers',
      185
);

INSERT INTO city
VALUES(
      6762,
      'Le Mans',
      185
);

INSERT INTO city
VALUES(
      6763,
      'Arras',
      185
);

INSERT INTO city
VALUES(
      6764,
      'Troyes',
      185
);

INSERT INTO city
VALUES(
      6765,
      'Nevers',
      185
);

INSERT INTO city
VALUES(
      6766,
      'Auxerre',
      185
);

INSERT INTO city
VALUES(
      6767,
      'Tours',
      185
);

INSERT INTO city
VALUES(
      6768,
      'Bourges',
      185
);

INSERT INTO city
VALUES(
      6769,
      'Versailles',
      185
);

INSERT INTO city
VALUES(
      6770,
      'Melun',
      185
);

INSERT INTO city
VALUES(
      6771,
      'La Rochelle',
      185
);

INSERT INTO city
VALUES(
      6772,
      'Agen',
      185
);

INSERT INTO city
VALUES(
      6773,
      'Annecy',
      185
);

INSERT INTO city
VALUES(
      6774,
      'Grenoble',
      185
);

INSERT INTO city
VALUES(
      6775,
      'Saint-Etienne',
      185
);

INSERT INTO city
VALUES(
      6776,
      'Toulon',
      185
);

INSERT INTO city
VALUES(
      6777,
      'Nice',
      185
);

INSERT INTO city
VALUES(
      6778,
      'Tarbes',
      185
);

INSERT INTO city
VALUES(
      6779,
      'Perpignan',
      185
);

INSERT INTO city
VALUES(
      6780,
      'Nimes',
      185
);

INSERT INTO city
VALUES(
      6781,
      'Strasbourg',
      185
);

INSERT INTO city
VALUES(
      6782,
      'Metz',
      185
);

INSERT INTO city
VALUES(
      6783,
      'Mulhouse',
      185
);

INSERT INTO city
VALUES(
      6784,
      'Nancy',
      185
);

INSERT INTO city
VALUES(
      6785,
      'Bastia',
      185
);

INSERT INTO country
VALUES(
      186,
      'Gabon'
);

INSERT INTO city
VALUES(
      6786,
      'Tchibanga',
      186
);

INSERT INTO city
VALUES(
      6787,
      'Gamba',
      186
);

INSERT INTO city
VALUES(
      6788,
      'Libreville',
      186
);

INSERT INTO city
VALUES(
      6789,
      'Omboue',
      186
);

INSERT INTO city
VALUES(
      6790,
      'Ndende',
      186
);

INSERT INTO city
VALUES(
      6791,
      'Mayumba',
      186
);

INSERT INTO city
VALUES(
      6792,
      'Moanda',
      186
);

INSERT INTO city
VALUES(
      6793,
      'Mouila',
      186
);

INSERT INTO city
VALUES(
      6794,
      'Okandja',
      186
);

INSERT INTO city
VALUES(
      6795,
      'Franceville',
      186
);

INSERT INTO city
VALUES(
      6796,
      'Oyem',
      186
);

INSERT INTO city
VALUES(
      6797,
      'Makokou',
      186
);

INSERT INTO city
VALUES(
      6798,
      'Mitzik',
      186
);

INSERT INTO city
VALUES(
      6799,
      'Bitam',
      186
);

INSERT INTO city
VALUES(
      6800,
      'Mekambo',
      186
);

INSERT INTO city
VALUES(
      6801,
      'Koulamoutou',
      186
);

INSERT INTO city
VALUES(
      6802,
      'Bifoum',
      186
);

INSERT INTO city
VALUES(
      6803,
      'Port-Gentil',
      186
);

INSERT INTO city
VALUES(
      6804,
      'Lambarene',
      186
);

INSERT INTO country
VALUES(
      187,
      'United Kingdom'
);

INSERT INTO city
VALUES(
      6805,
      'Warrington',
      187
);

INSERT INTO city
VALUES(
      6806,
      'Newbury',
      187
);

INSERT INTO city
VALUES(
      6807,
      'Swindon',
      187
);

INSERT INTO city
VALUES(
      6808,
      'Wick',
      187
);

INSERT INTO city
VALUES(
      6809,
      'Dudley',
      187
);

INSERT INTO city
VALUES(
      6810,
      'Oxford',
      187
);

INSERT INTO city
VALUES(
      6811,
      'Hackney',
      187
);

INSERT INTO city
VALUES(
      6812,
      'Matlock',
      187
);

INSERT INTO city
VALUES(
      6813,
      'Lochgilphead',
      187
);

INSERT INTO city
VALUES(
      6814,
      'Northallerton',
      187
);

INSERT INTO city
VALUES(
      6815,
      'Edinburgh',
      187
);

INSERT INTO city
VALUES(
      6816,
      'Sunderland',
      187
);

INSERT INTO city
VALUES(
      6817,
      'Swansea',
      187
);

INSERT INTO city
VALUES(
      6818,
      'Wokingham',
      187
);

INSERT INTO city
VALUES(
      6819,
      'City of Westminster',
      187
);

INSERT INTO city
VALUES(
      6820,
      'Solihull',
      187
);

INSERT INTO city
VALUES(
      6821,
      'Rochdale',
      187
);

INSERT INTO city
VALUES(
      6822,
      'Nottingham',
      187
);

INSERT INTO city
VALUES(
      6823,
      'Winchester',
      187
);

INSERT INTO city
VALUES(
      6824,
      'Wembley',
      187
);

INSERT INTO city
VALUES(
      6825,
      'Motherwell',
      187
);

INSERT INTO city
VALUES(
      6826,
      'Reading',
      187
);

INSERT INTO city
VALUES(
      6827,
      'Torquay',
      187
);

INSERT INTO city
VALUES(
      6828,
      'Thornbury',
      187
);

INSERT INTO city
VALUES(
      6829,
      'Oldham',
      187
);

INSERT INTO city
VALUES(
      6830,
      'Elgin',
      187
);

INSERT INTO city
VALUES(
      6831,
      'Wallsend',
      187
);

INSERT INTO city
VALUES(
      6832,
      'Weston-super-Mare',
      187
);

INSERT INTO city
VALUES(
      6833,
      'Hounslow',
      187
);

INSERT INTO city
VALUES(
      6834,
      'Irvine',
      187
);

INSERT INTO city
VALUES(
      6835,
      'Barnsley',
      187
);

INSERT INTO city
VALUES(
      6836,
      'Falkirk',
      187
);

INSERT INTO city
VALUES(
      6837,
      'Slough',
      187
);

INSERT INTO city
VALUES(
      6838,
      'Huddersfield',
      187
);

INSERT INTO city
VALUES(
      6839,
      'Kingston upon Hull',
      187
);

INSERT INTO city
VALUES(
      6840,
      'Romford',
      187
);

INSERT INTO city
VALUES(
      6841,
      'Grays',
      187
);

INSERT INTO city
VALUES(
      6842,
      'Hertford',
      187
);

INSERT INTO city
VALUES(
      6843,
      'Coventry',
      187
);

INSERT INTO city
VALUES(
      6844,
      'Leicester',
      187
);

INSERT INTO city
VALUES(
      6845,
      'Beverley',
      187
);

INSERT INTO city
VALUES(
      6846,
      'Stirling',
      187
);

INSERT INTO city
VALUES(
      6847,
      'Norwich',
      187
);

INSERT INTO city
VALUES(
      6848,
      'Darlington',
      187
);

INSERT INTO city
VALUES(
      6849,
      'Hereford',
      187
);

INSERT INTO city
VALUES(
      6850,
      'Grimsby',
      187
);

INSERT INTO city
VALUES(
      6851,
      'Bradford',
      187
);

INSERT INTO city
VALUES(
      6852,
      'Bracknell',
      187
);

INSERT INTO city
VALUES(
      6853,
      'Morpeth',
      187
);

INSERT INTO city
VALUES(
      6854,
      'Gateshead',
      187
);

INSERT INTO city
VALUES(
      6855,
      'Wandsworth',
      187
);

INSERT INTO city
VALUES(
      6856,
      'South Shields',
      187
);

INSERT INTO city
VALUES(
      6857,
      'Sheffield',
      187
);

INSERT INTO city
VALUES(
      6858,
      'Ystrad Mynach',
      187
);

INSERT INTO city
VALUES(
      6859,
      'South Bank',
      187
);

INSERT INTO city
VALUES(
      6860,
      'Haddington',
      187
);

INSERT INTO city
VALUES(
      6861,
      'Aberaeron',
      187
);

INSERT INTO city
VALUES(
      6862,
      'Lerwick',
      187
);

INSERT INTO city
VALUES(
      6863,
      'Cambridge',
      187
);

INSERT INTO city
VALUES(
      6864,
      'Glenrothes',
      187
);

INSERT INTO city
VALUES(
      6865,
      'Pen-y-Bont ar Ogwr',
      187
);

INSERT INTO city
VALUES(
      6866,
      'Barri',
      187
);

INSERT INTO city
VALUES(
      6867,
      'Carlisle',
      187
);

INSERT INTO city
VALUES(
      6868,
      'Aylesbury',
      187
);

INSERT INTO city
VALUES(
      6869,
      'Lincoln',
      187
);

INSERT INTO city
VALUES(
      6870,
      'Bromley',
      187
);

INSERT INTO city
VALUES(
      6871,
      'Kirkwall',
      187
);

INSERT INTO city
VALUES(
      6872,
      'Blackpool',
      187
);

INSERT INTO city
VALUES(
      6873,
      'Croydon',
      187
);

INSERT INTO city
VALUES(
      6874,
      'Dorchester',
      187
);

INSERT INTO city
VALUES(
      6875,
      'Hendon',
      187
);

INSERT INTO city
VALUES(
      6876,
      'Hammersmith',
      187
);

INSERT INTO city
VALUES(
      6877,
      'Bournemouth',
      187
);

INSERT INTO city
VALUES(
      6878,
      'Fort William',
      187
);

INSERT INTO city
VALUES(
      6879,
      'Dumfries',
      187
);

INSERT INTO city
VALUES(
      6880,
      'Dumbarton',
      187
);

INSERT INTO city
VALUES(
      6881,
      'Luton',
      187
);

INSERT INTO city
VALUES(
      6882,
      'Bristol',
      187
);

INSERT INTO city
VALUES(
      6883,
      'Enfield',
      187
);

INSERT INTO city
VALUES(
      6884,
      'Camberwell',
      187
);

INSERT INTO city
VALUES(
      6885,
      'Truro',
      187
);

INSERT INTO city
VALUES(
      6886,
      'Penzance',
      187
);

INSERT INTO city
VALUES(
      6887,
      'Clydach Vale',
      187
);

INSERT INTO city
VALUES(
      6888,
      'Telford',
      187
);

INSERT INTO city
VALUES(
      6889,
      'Stockton-on-Tees',
      187
);

INSERT INTO city
VALUES(
      6890,
      'Maidenhead',
      187
);

INSERT INTO city
VALUES(
      6891,
      'Dalkeith',
      187
);

INSERT INTO city
VALUES(
      6892,
      'Wood Green',
      187
);

INSERT INTO city
VALUES(
      6893,
      'Pont-y-pwl',
      187
);

INSERT INTO city
VALUES(
      6894,
      'Perth',
      187
);

INSERT INTO city
VALUES(
      6895,
      'Milton Keynes',
      187
);

INSERT INTO city
VALUES(
      6896,
      'Hartlepool',
      187
);

INSERT INTO city
VALUES(
      6897,
      'Harrow',
      187
);

INSERT INTO city
VALUES(
      6898,
      'Oldbury',
      187
);

INSERT INTO city
VALUES(
      6899,
      'Ashton-under-Lyne',
      187
);

INSERT INTO city
VALUES(
      6900,
      'Wakefield',
      187
);

INSERT INTO city
VALUES(
      6901,
      'Trowbridge',
      187
);

INSERT INTO city
VALUES(
      6902,
      'Maidstone',
      187
);

INSERT INTO city
VALUES(
      6903,
      'Poole',
      187
);

INSERT INTO city
VALUES(
      6904,
      'Newport',
      187
);

INSERT INTO city
VALUES(
      6905,
      'Walsall',
      187
);

INSERT INTO city
VALUES(
      6906,
      'Woolwich',
      187
);

INSERT INTO city
VALUES(
      6907,
      'Southend-on-Sea',
      187
);

INSERT INTO city
VALUES(
      6908,
      'Scunthorpe',
      187
);

INSERT INTO city
VALUES(
      6909,
      'Caernarfon',
      187
);

INSERT INTO city
VALUES(
      6910,
      'Hamilton',
      187
);

INSERT INTO city
VALUES(
      6911,
      'Durham',
      187
);

INSERT INTO city
VALUES(
      6912,
      'Warwick',
      187
);

INSERT INTO city
VALUES(
      6913,
      'Aberdeen',
      187
);

INSERT INTO city
VALUES(
      6914,
      'Newtown Saint Boswells',
      187
);

INSERT INTO city
VALUES(
      6915,
      'Sutton',
      187
);

INSERT INTO city
VALUES(
      6916,
      'Catford',
      187
);

INSERT INTO city
VALUES(
      6917,
      'Lambeth',
      187
);

INSERT INTO city
VALUES(
      6918,
      'Lewes',
      187
);

INSERT INTO city
VALUES(
      6919,
      'Dundee',
      187
);

INSERT INTO city
VALUES(
      6920,
      'Ipswich',
      187
);

INSERT INTO city
VALUES(
      6921,
      'Birmingham',
      187
);

INSERT INTO city
VALUES(
      6922,
      'Stoke',
      187
);

INSERT INTO city
VALUES(
      6923,
      'Stockport',
      187
);

INSERT INTO city
VALUES(
      6924,
      'Chelmsford',
      187
);

INSERT INTO city
VALUES(
      6925,
      'Leeds',
      187
);

INSERT INTO city
VALUES(
      6926,
      'Bath',
      187
);

INSERT INTO city
VALUES(
      6927,
      'Ayr',
      187
);

INSERT INTO city
VALUES(
      6928,
      'Kirkintilloch',
      187
);

INSERT INTO city
VALUES(
      6929,
      'Wallasey',
      187
);

INSERT INTO city
VALUES(
      6930,
      'Conwy',
      187
);

INSERT INTO city
VALUES(
      6931,
      'Rhuthun',
      187
);

INSERT INTO city
VALUES(
      6932,
      'Walthamstow',
      187
);

INSERT INTO city
VALUES(
      6933,
      'Halifax',
      187
);

INSERT INTO city
VALUES(
      6934,
      'Peterborough',
      187
);

INSERT INTO city
VALUES(
      6935,
      'Rotherham',
      187
);

INSERT INTO city
VALUES(
      6936,
      'Alloa',
      187
);

INSERT INTO city
VALUES(
      6937,
      'Southampton',
      187
);

INSERT INTO city
VALUES(
      6938,
      'Ebbw Vale',
      187
);

INSERT INTO city
VALUES(
      6939,
      'Forfar',
      187
);

INSERT INTO city
VALUES(
      6940,
      'Islington',
      187
);

INSERT INTO city
VALUES(
      6941,
      'Caerfyrddin',
      187
);

INSERT INTO city
VALUES(
      6942,
      'Ealing',
      187
);

INSERT INTO city
VALUES(
      6943,
      'Kilmarnock',
      187
);

INSERT INTO city
VALUES(
      6944,
      'Newport',
      187
);

INSERT INTO city
VALUES(
      6945,
      'Kensington',
      187
);

INSERT INTO city
VALUES(
      6946,
      'Hwlffordd',
      187
);

INSERT INTO city
VALUES(
      6947,
      'Uxbridge',
      187
);

INSERT INTO city
VALUES(
      6948,
      'Twickenham',
      187
);

INSERT INTO city
VALUES(
      6949,
      'Plymouth',
      187
);

INSERT INTO city
VALUES(
      6950,
      'Livingston',
      187
);

INSERT INTO city
VALUES(
      6951,
      'Portsmouth',
      187
);

INSERT INTO city
VALUES(
      6952,
      'Paisley',
      187
);

INSERT INTO city
VALUES(
      6953,
      'Exeter',
      187
);

INSERT INTO city
VALUES(
      6954,
      'Widnes',
      187
);

INSERT INTO city
VALUES(
      6955,
      'Stretford',
      187
);

INSERT INTO city
VALUES(
      6956,
      'Stornoway',
      187
);

INSERT INTO city
VALUES(
      6957,
      'Manchester',
      187
);

INSERT INTO city
VALUES(
      6958,
      'Inverness',
      187
);

INSERT INTO city
VALUES(
      6959,
      'Morden',
      187
);

INSERT INTO city
VALUES(
      6960,
      'London',
      187
);

INSERT INTO city
VALUES(
      6961,
      'Ilford',
      187
);

INSERT INTO city
VALUES(
      6962,
      'Poplar',
      187
);

INSERT INTO city
VALUES(
      6963,
      'Salford',
      187
);

INSERT INTO city
VALUES(
      6964,
      'Derby',
      187
);

INSERT INTO city
VALUES(
      6965,
      'Mold',
      187
);

INSERT INTO city
VALUES(
      6966,
      'Worcester',
      187
);

INSERT INTO city
VALUES(
      6967,
      'Rochester',
      187
);

INSERT INTO city
VALUES(
      6968,
      'Chichester',
      187
);

INSERT INTO city
VALUES(
      6969,
      'East Ham',
      187
);

INSERT INTO city
VALUES(
      6970,
      'Oakham',
      187
);

INSERT INTO city
VALUES(
      6971,
      'Gloucester',
      187
);

INSERT INTO city
VALUES(
      6972,
      'Wrecsam',
      187
);

INSERT INTO city
VALUES(
      6973,
      'Wolverhampton',
      187
);

INSERT INTO city
VALUES(
      6974,
      'Llangefni',
      187
);

INSERT INTO city
VALUES(
      6975,
      'Hove',
      187
);

INSERT INTO city
VALUES(
      6976,
      'Brighton',
      187
);

INSERT INTO city
VALUES(
      6977,
      'Doncaster',
      187
);

INSERT INTO city
VALUES(
      6978,
      'Shrewsbury',
      187
);

INSERT INTO city
VALUES(
      6979,
      'Glasgow',
      187
);

INSERT INTO city
VALUES(
      6980,
      'Camden Town',
      187
);

INSERT INTO city
VALUES(
      6981,
      'Cardiff',
      187
);

INSERT INTO city
VALUES(
      6982,
      'Bexleyheath',
      187
);

INSERT INTO city
VALUES(
      6983,
      'Dover',
      187
);

INSERT INTO city
VALUES(
      6984,
      'Bury',
      187
);

INSERT INTO city
VALUES(
      6985,
      'Greenock',
      187
);

INSERT INTO city
VALUES(
      6986,
      'Middlesbrough',
      187
);

INSERT INTO city
VALUES(
      6987,
      'Scarborough',
      187
);

INSERT INTO city
VALUES(
      6988,
      'Merthyr Tudful',
      187
);

INSERT INTO city
VALUES(
      6989,
      'Taunton',
      187
);

INSERT INTO city
VALUES(
      6990,
      'York',
      187
);

INSERT INTO city
VALUES(
      6991,
      'Port Talbot',
      187
);

INSERT INTO city
VALUES(
      6992,
      'Dagenham',
      187
);

INSERT INTO city
VALUES(
      6993,
      'Liverpool',
      187
);

INSERT INTO city
VALUES(
      6994,
      'Saint Helens',
      187
);

INSERT INTO city
VALUES(
      6995,
      'Knowsley',
      187
);

INSERT INTO city
VALUES(
      6996,
      'Kingston upon Thames',
      187
);

INSERT INTO city
VALUES(
      6997,
      'Wigan',
      187
);

INSERT INTO city
VALUES(
      6998,
      'Southport',
      187
);

INSERT INTO city
VALUES(
      6999,
      'Preston',
      187
);

INSERT INTO city
VALUES(
      7000,
      'Blackburn',
      187
);

INSERT INTO city
VALUES(
      7001,
      'Bolton',
      187
);

INSERT INTO city
VALUES(
      7002,
      'Hugh Town',
      187
);

INSERT INTO city
VALUES(
      7003,
      'Bedford',
      187
);

INSERT INTO city
VALUES(
      7004,
      'Chicksands',
      187
);

INSERT INTO city
VALUES(
      7005,
      'Sandbach',
      187
);

INSERT INTO city
VALUES(
      7006,
      'Chester',
      187
);

INSERT INTO city
VALUES(
      7007,
      'Llandrindod Wells',
      187
);

INSERT INTO city
VALUES(
      7008,
      'Northampton',
      187
);

INSERT INTO city
VALUES(
      7009,
      'Giffnock',
      187
);

INSERT INTO city
VALUES(
      7010,
      'Newcastle',
      187
);

INSERT INTO city
VALUES(
      7011,
      'Downpatrick',
      187
);

INSERT INTO city
VALUES(
      7012,
      'Coleraine',
      187
);

INSERT INTO city
VALUES(
      7013,
      'Magherafelt',
      187
);

INSERT INTO city
VALUES(
      7014,
      'Dungannon',
      187
);

INSERT INTO city
VALUES(
      7015,
      'Cookstown',
      187
);

INSERT INTO city
VALUES(
      7016,
      'Bangor',
      187
);

INSERT INTO city
VALUES(
      7017,
      'Strabane',
      187
);

INSERT INTO city
VALUES(
      7018,
      'Londonderry',
      187
);

INSERT INTO city
VALUES(
      7019,
      'Omagh',
      187
);

INSERT INTO city
VALUES(
      7020,
      'Enniskillen',
      187
);

INSERT INTO city
VALUES(
      7021,
      'Ballymena',
      187
);

INSERT INTO city
VALUES(
      7022,
      'Banbridge',
      187
);

INSERT INTO city
VALUES(
      7023,
      'Armagh',
      187
);

INSERT INTO city
VALUES(
      7024,
      'Newtownabbey',
      187
);

INSERT INTO city
VALUES(
      7025,
      'Craigavon',
      187
);

INSERT INTO city
VALUES(
      7026,
      'Antrim',
      187
);

INSERT INTO city
VALUES(
      7027,
      'Newry',
      187
);

INSERT INTO city
VALUES(
      7028,
      'Lisburn',
      187
);

INSERT INTO city
VALUES(
      7029,
      'Belfast',
      187
);

INSERT INTO city
VALUES(
      7030,
      'Belfast',
      187
);

INSERT INTO city
VALUES(
      7031,
      'Usk',
      187
);

INSERT INTO city
VALUES(
      7032,
      'Stafford',
      187
);

INSERT INTO country
VALUES(
      188,
      'Grenada'
);

INSERT INTO city
VALUES(
      7033,
      'Saint Georgeas',
      188
);

INSERT INTO country
VALUES(
      189,
      'Georgia'
);

INSERT INTO city
VALUES(
      7034,
      'Poti',
      189
);

INSERT INTO city
VALUES(
      7035,
      'Tbilisi',
      189
);

INSERT INTO city
VALUES(
      7036,
      'Rustavi',
      189
);

INSERT INTO city
VALUES(
      7037,
      'Tskhinvali',
      189
);

INSERT INTO city
VALUES(
      7038,
      'Rustavi',
      189
);

INSERT INTO city
VALUES(
      7039,
      'Sukhumi',
      189
);

INSERT INTO city
VALUES(
      7040,
      'Zugdidi',
      189
);

INSERT INTO city
VALUES(
      7041,
      'Gori',
      189
);

INSERT INTO city
VALUES(
      7042,
      'Batumi',
      189
);

INSERT INTO city
VALUES(
      7043,
      'Akhaltsikhe',
      189
);

INSERT INTO city
VALUES(
      7044,
      'Mtskheta',
      189
);

INSERT INTO city
VALUES(
      7045,
      'Telavi',
      189
);

INSERT INTO city
VALUES(
      7046,
      'Ozurgeti',
      189
);

INSERT INTO city
VALUES(
      7047,
      'Kutaisi',
      189
);

INSERT INTO city
VALUES(
      7048,
      'Ambrolauri',
      189
);

INSERT INTO country
VALUES(
      190,
      'French Guiana'
);

INSERT INTO city
VALUES(
      7049,
      'Cayenne',
      190
);

INSERT INTO city
VALUES(
      7050,
      'Kourou',
      190
);

INSERT INTO city
VALUES(
      7051,
      'Sinnamary',
      190
);

INSERT INTO city
VALUES(
      7052,
      'Saint-Georges',
      190
);

INSERT INTO city
VALUES(
      7053,
      'Iracoubo',
      190
);

INSERT INTO city
VALUES(
      7054,
      'Saint-Laurent-du-Maroni',
      190
);

INSERT INTO city
VALUES(
      7055,
      'Roura',
      190
);

INSERT INTO country
VALUES(
      191,
      'Guernsey'
);

INSERT INTO city
VALUES(
      7056,
      'Saint Peter Port',
      191
);

INSERT INTO country
VALUES(
      192,
      'Ghana'
);

INSERT INTO city
VALUES(
      7057,
      'Ho',
      192
);

INSERT INTO city
VALUES(
      7058,
      'Bolgatanga',
      192
);

INSERT INTO city
VALUES(
      7059,
      'Yendi',
      192
);

INSERT INTO city
VALUES(
      7060,
      'Tamale',
      192
);

INSERT INTO city
VALUES(
      7061,
      'Sunyani',
      192
);

INSERT INTO city
VALUES(
      7062,
      'Berekum',
      192
);

INSERT INTO city
VALUES(
      7063,
      'Kumasi',
      192
);

INSERT INTO city
VALUES(
      7064,
      'Wa',
      192
);

INSERT INTO city
VALUES(
      7065,
      'Cape Coast',
      192
);

INSERT INTO city
VALUES(
      7066,
      'Sekondi',
      192
);

INSERT INTO city
VALUES(
      7067,
      'Bawku',
      192
);

INSERT INTO city
VALUES(
      7068,
      'Nkawkaw',
      192
);

INSERT INTO city
VALUES(
      7069,
      'Koforidua',
      192
);

INSERT INTO city
VALUES(
      7070,
      'Winneba',
      192
);

INSERT INTO city
VALUES(
      7071,
      'Accra',
      192
);

INSERT INTO city
VALUES(
      7072,
      'Tema',
      192
);

INSERT INTO city
VALUES(
      7073,
      'Obuasi',
      192
);

INSERT INTO country
VALUES(
      193,
      'Gibraltar'
);

INSERT INTO city
VALUES(
      7074,
      'Gibraltar',
      193
);

INSERT INTO country
VALUES(
      194,
      'Greenland'
);

INSERT INTO city
VALUES(
      7075,
      'Nord',
      194
);

INSERT INTO city
VALUES(
      7076,
      'Sisimiut',
      194
);

INSERT INTO city
VALUES(
      7077,
      'Qaqortoq',
      194
);

INSERT INTO city
VALUES(
      7078,
      'Savissivik',
      194
);

INSERT INTO city
VALUES(
      7079,
      'Tasiilaq',
      194
);

INSERT INTO city
VALUES(
      7080,
      'Qaanaaq',
      194
);

INSERT INTO city
VALUES(
      7081,
      'Ittoqqortoormiit',
      194
);

INSERT INTO city
VALUES(
      7082,
      'Kulusuk',
      194
);

INSERT INTO city
VALUES(
      7083,
      'Timmiarmiut',
      194
);

INSERT INTO city
VALUES(
      7084,
      'Qeqertasuaq',
      194
);

INSERT INTO city
VALUES(
      7085,
      'Narsarsuaq',
      194
);

INSERT INTO city
VALUES(
      7086,
      'Kullorsuaq',
      194
);

INSERT INTO city
VALUES(
      7087,
      'Paamiut',
      194
);

INSERT INTO city
VALUES(
      7088,
      'Tasiusaq',
      194
);

INSERT INTO city
VALUES(
      7089,
      'Upernavik',
      194
);

INSERT INTO city
VALUES(
      7090,
      'Qasigiannguit',
      194
);

INSERT INTO city
VALUES(
      7091,
      'Kangersuatsiaq',
      194
);

INSERT INTO city
VALUES(
      7092,
      'Nuussuaq',
      194
);

INSERT INTO city
VALUES(
      7093,
      'Uummannaq',
      194
);

INSERT INTO city
VALUES(
      7094,
      'Nuuk',
      194
);

INSERT INTO city
VALUES(
      7095,
      'Ilulissat',
      194
);

INSERT INTO city
VALUES(
      7096,
      'Aasiaat',
      194
);

INSERT INTO country
VALUES(
      195,
      'Gambi'
);

INSERT INTO city
VALUES(
      7097,
      'Bansang',
      195
);

INSERT INTO city
VALUES(
      7098,
      'Banjul',
      195
);

INSERT INTO city
VALUES(
      7099,
      'Basse Santa Su',
      195
);

INSERT INTO city
VALUES(
      7100,
      'Brikama',
      195
);

INSERT INTO city
VALUES(
      7101,
      'Georgetown',
      195
);

INSERT INTO city
VALUES(
      7102,
      'Kerewan',
      195
);

INSERT INTO city
VALUES(
      7103,
      'Mansa Konko',
      195
);

INSERT INTO city
VALUES(
      7104,
      'Kanifing',
      195
);

INSERT INTO country
VALUES(
      196,
      'Guinea'
);

INSERT INTO city
VALUES(
      7105,
      'Conakry',
      196
);

INSERT INTO city
VALUES(
      7106,
      'Faranah',
      196
);

INSERT INTO city
VALUES(
      7107,
      'Kankan',
      196
);

INSERT INTO city
VALUES(
      7108,
      'Labe',
      196
);

INSERT INTO city
VALUES(
      7109,
      'Boke',
      196
);

INSERT INTO city
VALUES(
      7110,
      'Mamou',
      196
);

INSERT INTO city
VALUES(
      7111,
      'Kindia',
      196
);

INSERT INTO city
VALUES(
      7112,
      'Kamsar',
      196
);

INSERT INTO city
VALUES(
      7113,
      'Nzerekore',
      196
);

INSERT INTO city
VALUES(
      7114,
      'Fria',
      196
);

INSERT INTO city
VALUES(
      7115,
      'Forecariah',
      196
);

INSERT INTO city
VALUES(
      7116,
      'Yomou',
      196
);

INSERT INTO city
VALUES(
      7117,
      'Tongue',
      196
);

INSERT INTO city
VALUES(
      7118,
      'Telimele',
      196
);

INSERT INTO city
VALUES(
      7119,
      'Siguiri',
      196
);

INSERT INTO city
VALUES(
      7120,
      'Pita',
      196
);

INSERT INTO city
VALUES(
      7121,
      'Mali',
      196
);

INSERT INTO city
VALUES(
      7122,
      'Macenta',
      196
);

INSERT INTO city
VALUES(
      7123,
      'Kouroussa',
      196
);

INSERT INTO city
VALUES(
      7124,
      'Koundara',
      196
);

INSERT INTO city
VALUES(
      7125,
      'Kissidougou',
      196
);

INSERT INTO city
VALUES(
      7126,
      'Kerouane',
      196
);

INSERT INTO city
VALUES(
      7127,
      'Gueckedou',
      196
);

INSERT INTO city
VALUES(
      7128,
      'Gaoual',
      196
);

INSERT INTO city
VALUES(
      7129,
      'Dinguiraye',
      196
);

INSERT INTO city
VALUES(
      7130,
      'Dabola',
      196
);

INSERT INTO city
VALUES(
      7131,
      'Boffa',
      196
);

INSERT INTO city
VALUES(
      7132,
      'Beyla',
      196
);

INSERT INTO city
VALUES(
      7133,
      'Dalaba',
      196
);

INSERT INTO country
VALUES(
      197,
      'Guadeloupe'
);

INSERT INTO city
VALUES(
      7134,
      'Basse-Terre',
      197
);

INSERT INTO city
VALUES(
      7135,
      'Pointe-a-Pitre',
      197
);

INSERT INTO city
VALUES(
      7136,
      'Basse-terre',
      197
);

INSERT INTO country
VALUES(
      198,
      'Equatorial Guinea'
);

INSERT INTO city
VALUES(
      7137,
      'Malabo',
      198
);

INSERT INTO city
VALUES(
      7138,
      'Pale',
      198
);

INSERT INTO city
VALUES(
      7139,
      'Evinayong',
      198
);

INSERT INTO city
VALUES(
      7140,
      'Mongomo',
      198
);

INSERT INTO city
VALUES(
      7141,
      'Bata',
      198
);

INSERT INTO city
VALUES(
      7142,
      'Ebebiyin',
      198
);

INSERT INTO city
VALUES(
      7143,
      'Calatrava',
      198
);

INSERT INTO city
VALUES(
      7144,
      'Luba',
      198
);

INSERT INTO country
VALUES(
      199,
      'Greece'
);

INSERT INTO city
VALUES(
      7145,
      'Komatini',
      199
);

INSERT INTO city
VALUES(
      7146,
      'Athens',
      199
);

INSERT INTO city
VALUES(
      7147,
      'Ermoupoli',
      199
);

INSERT INTO city
VALUES(
      7148,
      'Patra',
      199
);

INSERT INTO city
VALUES(
      7149,
      'Lamia',
      199
);

INSERT INTO city
VALUES(
      7150,
      'Tripoli',
      199
);

INSERT INTO city
VALUES(
      7151,
      'Mitilini',
      199
);

INSERT INTO city
VALUES(
      7152,
      'Hania',
      199
);

INSERT INTO city
VALUES(
      7153,
      'Sitia',
      199
);

INSERT INTO city
VALUES(
      7154,
      'Seres',
      199
);

INSERT INTO city
VALUES(
      7155,
      'Iraklio',
      199
);

INSERT INTO city
VALUES(
      7156,
      'Polygyros',
      199
);

INSERT INTO city
VALUES(
      7157,
      'Thessaloniki',
      199
);

INSERT INTO city
VALUES(
      7158,
      'Xanthi',
      199
);

INSERT INTO city
VALUES(
      7159,
      'Kerkira',
      199
);

INSERT INTO city
VALUES(
      7160,
      'Kavala',
      199
);

INSERT INTO city
VALUES(
      7161,
      'Kozani',
      199
);

INSERT INTO city
VALUES(
      7162,
      'Alexandroupoli',
      199
);

INSERT INTO city
VALUES(
      7163,
      'Katerini',
      199
);

INSERT INTO city
VALUES(
      7164,
      'Ioanina',
      199
);

INSERT INTO city
VALUES(
      7165,
      'Volos',
      199
);

INSERT INTO city
VALUES(
      7166,
      'Larissa',
      199
);

INSERT INTO city
VALUES(
      7167,
      'Piraievs',
      199
);

INSERT INTO city
VALUES(
      7168,
      'Agrinio',
      199
);

INSERT INTO city
VALUES(
      7169,
      'Pirgos',
      199
);

INSERT INTO city
VALUES(
      7170,
      'Chalkida',
      199
);

INSERT INTO city
VALUES(
      7171,
      'Sparti',
      199
);

INSERT INTO city
VALUES(
      7172,
      'Kalamata',
      199
);

INSERT INTO city
VALUES(
      7173,
      'Hios',
      199
);

INSERT INTO city
VALUES(
      7174,
      'Rodos',
      199
);

INSERT INTO city
VALUES(
      7175,
      'Kos',
      199
);

INSERT INTO country
VALUES(
      200,
      'South Georgia And South Sandwich Islands'
);

INSERT INTO city
VALUES(
      7176,
      'Grytviken',
      200
);

INSERT INTO country
VALUES(
      201,
      'Guatemala'
);

INSERT INTO city
VALUES(
      7177,
      'San Jose',
      201
);

INSERT INTO city
VALUES(
      7178,
      'Mazatenango',
      201
);

INSERT INTO city
VALUES(
      7179,
      'Cuilapa',
      201
);

INSERT INTO city
VALUES(
      7180,
      'Coban',
      201
);

INSERT INTO city
VALUES(
      7181,
      'Jutiapa',
      201
);

INSERT INTO city
VALUES(
      7182,
      'Retalhuleu',
      201
);

INSERT INTO city
VALUES(
      7183,
      'Livingston',
      201
);

INSERT INTO city
VALUES(
      7184,
      'San Luis',
      201
);

INSERT INTO city
VALUES(
      7185,
      'San Marcos',
      201
);

INSERT INTO city
VALUES(
      7186,
      'Flores',
      201
);

INSERT INTO city
VALUES(
      7187,
      'Escuintla',
      201
);

INSERT INTO city
VALUES(
      7188,
      'Salama',
      201
);

INSERT INTO city
VALUES(
      7189,
      'Chiquimula',
      201
);

INSERT INTO city
VALUES(
      7190,
      'Chimaltenango',
      201
);

INSERT INTO city
VALUES(
      7191,
      'El Progreso',
      201
);

INSERT INTO city
VALUES(
      7192,
      'Antigua Guatemala',
      201
);

INSERT INTO city
VALUES(
      7193,
      'Jalapa',
      201
);

INSERT INTO city
VALUES(
      7194,
      'Quetzaltenango',
      201
);

INSERT INTO city
VALUES(
      7195,
      'Puerto Barrios',
      201
);

INSERT INTO city
VALUES(
      7196,
      'Totonicapan',
      201
);

INSERT INTO city
VALUES(
      7197,
      'Zacapa',
      201
);

INSERT INTO city
VALUES(
      7198,
      'Solola',
      201
);

INSERT INTO city
VALUES(
      7199,
      'Guatemala',
      201
);

INSERT INTO city
VALUES(
      7200,
      'La Libertad',
      201
);

INSERT INTO city
VALUES(
      7201,
      'Huehuetenango',
      201
);

INSERT INTO city
VALUES(
      7202,
      'Santa Cruz Del Quiche',
      201
);

INSERT INTO country
VALUES(
      202,
      'Guinea-Bissau'
);

INSERT INTO city
VALUES(
      7203,
      'Fulacunda',
      202
);

INSERT INTO city
VALUES(
      7204,
      'Farim',
      202
);

INSERT INTO city
VALUES(
      7205,
      'Bafata',
      202
);

INSERT INTO city
VALUES(
      7206,
      'Bissau',
      202
);

INSERT INTO city
VALUES(
      7207,
      'Bolama',
      202
);

INSERT INTO city
VALUES(
      7208,
      'Buba',
      202
);

INSERT INTO city
VALUES(
      7209,
      'Cacheu',
      202
);

INSERT INTO city
VALUES(
      7210,
      'Catio',
      202
);

INSERT INTO city
VALUES(
      7211,
      'Gabu',
      202
);

INSERT INTO city
VALUES(
      7212,
      'Quinhamel',
      202
);

INSERT INTO country
VALUES(
      203,
      'Guyana'
);

INSERT INTO city
VALUES(
      7213,
      'Corriverton',
      203
);

INSERT INTO city
VALUES(
      7214,
      'Georgetown',
      203
);

INSERT INTO city
VALUES(
      7215,
      'Fort Wellington',
      203
);

INSERT INTO city
VALUES(
      7216,
      'Bartica',
      203
);

INSERT INTO city
VALUES(
      7217,
      'New Amsterdam',
      203
);

INSERT INTO city
VALUES(
      7218,
      'Mabaruma',
      203
);

INSERT INTO city
VALUES(
      7219,
      'Vreed-en-Hoop',
      203
);

INSERT INTO city
VALUES(
      7220,
      'Mahdia',
      203
);

INSERT INTO city
VALUES(
      7221,
      'Linden',
      203
);

INSERT INTO city
VALUES(
      7222,
      'Lethem',
      203
);

INSERT INTO city
VALUES(
      7223,
      'Anna Regina',
      203
);

INSERT INTO city
VALUES(
      7224,
      'Anna Regina',
      203
);

INSERT INTO city
VALUES(
      7225,
      'Ituni',
      203
);

INSERT INTO country
VALUES(
      204,
      'Hong Kong'
);

INSERT INTO city
VALUES(
      7226,
      'Hong Kong',
      204
);

INSERT INTO country
VALUES(
      205,
      'Honduras'
);

INSERT INTO city
VALUES(
      7227,
      'Tegucigalpa',
      205
);

INSERT INTO city
VALUES(
      7228,
      'Yoro',
      205
);

INSERT INTO city
VALUES(
      7229,
      'Brus Laguna',
      205
);

INSERT INTO city
VALUES(
      7230,
      'La Ceiba',
      205
);

INSERT INTO city
VALUES(
      7231,
      'Choluteca',
      205
);

INSERT INTO city
VALUES(
      7232,
      'Trujillo',
      205
);

INSERT INTO city
VALUES(
      7233,
      'Comayagua',
      205
);

INSERT INTO city
VALUES(
      7234,
      'Santa Rosa de Copan',
      205
);

INSERT INTO city
VALUES(
      7235,
      'San Pedro Sula',
      205
);

INSERT INTO city
VALUES(
      7236,
      'Yuscaran',
      205
);

INSERT INTO city
VALUES(
      7237,
      'Puerto Lempira',
      205
);

INSERT INTO city
VALUES(
      7238,
      'La Esperanza',
      205
);

INSERT INTO city
VALUES(
      7239,
      'Roatan',
      205
);

INSERT INTO city
VALUES(
      7240,
      'La Paz',
      205
);

INSERT INTO city
VALUES(
      7241,
      'Gracias',
      205
);

INSERT INTO city
VALUES(
      7242,
      'Nueva Ocotepeque',
      205
);

INSERT INTO city
VALUES(
      7243,
      'Juticalpa',
      205
);

INSERT INTO city
VALUES(
      7244,
      'Santa Barbara',
      205
);

INSERT INTO city
VALUES(
      7245,
      'Nacaome',
      205
);

INSERT INTO city
VALUES(
      7246,
      'Yoro',
      205
);

INSERT INTO country
VALUES(
      206,
      'Croatia'
);

INSERT INTO city
VALUES(
      7247,
      'Sibenik',
      206
);

INSERT INTO city
VALUES(
      7248,
      'Slavonski Brod',
      206
);

INSERT INTO city
VALUES(
      7249,
      'Pozega',
      206
);

INSERT INTO city
VALUES(
      7250,
      'Virovitica',
      206
);

INSERT INTO city
VALUES(
      7251,
      'Rijeka',
      206
);

INSERT INTO city
VALUES(
      7252,
      'Krapina',
      206
);

INSERT INTO city
VALUES(
      7253,
      'Dubrovnik',
      206
);

INSERT INTO city
VALUES(
      7254,
      'Sisak',
      206
);

INSERT INTO city
VALUES(
      7255,
      'Osijek',
      206
);

INSERT INTO city
VALUES(
      7256,
      'Koprivnica',
      206
);

INSERT INTO city
VALUES(
      7257,
      'Cakovec',
      206
);

INSERT INTO city
VALUES(
      7258,
      'Vukovar',
      206
);

INSERT INTO city
VALUES(
      7259,
      'Zadar',
      206
);

INSERT INTO city
VALUES(
      7260,
      'Gospic',
      206
);

INSERT INTO city
VALUES(
      7261,
      'Varazdin',
      206
);

INSERT INTO city
VALUES(
      7262,
      'Split',
      206
);

INSERT INTO city
VALUES(
      7263,
      'Pazin',
      206
);

INSERT INTO city
VALUES(
      7264,
      'Zagreb',
      206
);

INSERT INTO city
VALUES(
      7265,
      'Karlovac',
      206
);

INSERT INTO city
VALUES(
      7266,
      'Bjelovar',
      206
);

INSERT INTO city
VALUES(
      7267,
      'Pula',
      206
);

INSERT INTO country
VALUES(
      207,
      'Haiti'
);

INSERT INTO city
VALUES(
      7268,
      'Port-au-Prince',
      207
);

INSERT INTO city
VALUES(
      7269,
      'Port-De-Paix',
      207
);

INSERT INTO city
VALUES(
      7270,
      'Cap-Haitien',
      207
);

INSERT INTO city
VALUES(
      7271,
      'Gonaives',
      207
);

INSERT INTO city
VALUES(
      7272,
      'Hinche',
      207
);

INSERT INTO city
VALUES(
      7273,
      'Fort-Liberte',
      207
);

INSERT INTO city
VALUES(
      7274,
      'Jacmel',
      207
);

INSERT INTO city
VALUES(
      7275,
      'Miragoane',
      207
);

INSERT INTO city
VALUES(
      7276,
      'Les Cayes',
      207
);

INSERT INTO city
VALUES(
      7277,
      'Jeremie',
      207
);

INSERT INTO country
VALUES(
      208,
      'Hungary'
);

INSERT INTO city
VALUES(
      7278,
      'Szolnok',
      208
);

INSERT INTO city
VALUES(
      7279,
      'Hodmezovasarhely',
      208
);

INSERT INTO city
VALUES(
      7280,
      'Nagykanizsa',
      208
);

INSERT INTO city
VALUES(
      7281,
      'Nyiregyhaza',
      208
);

INSERT INTO city
VALUES(
      7282,
      'Budapest',
      208
);

INSERT INTO city
VALUES(
      7283,
      'Bekescsaba',
      208
);

INSERT INTO city
VALUES(
      7284,
      'Eger',
      208
);

INSERT INTO city
VALUES(
      7285,
      'Zalaegerszeg',
      208
);

INSERT INTO city
VALUES(
      7286,
      'Szeged',
      208
);

INSERT INTO city
VALUES(
      7287,
      'Kaposvar',
      208
);

INSERT INTO city
VALUES(
      7288,
      'Sopron',
      208
);

INSERT INTO city
VALUES(
      7289,
      'Kecskemet',
      208
);

INSERT INTO city
VALUES(
      7290,
      'Debrecen',
      208
);

INSERT INTO city
VALUES(
      7291,
      'Miskolc',
      208
);

INSERT INTO city
VALUES(
      7292,
      'Szombathely',
      208
);

INSERT INTO city
VALUES(
      7293,
      'Dunaujvaros',
      208
);

INSERT INTO city
VALUES(
      7294,
      'Veszprem',
      208
);

INSERT INTO city
VALUES(
      7295,
      'Salgotarjan',
      208
);

INSERT INTO city
VALUES(
      7296,
      'Szekesfehervar',
      208
);

INSERT INTO city
VALUES(
      7297,
      'Gyor',
      208
);

INSERT INTO city
VALUES(
      7298,
      'Tatabanya',
      208
);

INSERT INTO city
VALUES(
      7299,
      'Pecs',
      208
);

INSERT INTO city
VALUES(
      7300,
      'Szekszard',
      208
);

INSERT INTO city
VALUES(
      7301,
      'Eger',
      208
);

INSERT INTO city
VALUES(
      7302,
      'Vac',
      208
);

INSERT INTO country
VALUES(
      209,
      'Indonesia'
);

INSERT INTO city
VALUES(
      7303,
      'Sukabumi',
      209
);

INSERT INTO city
VALUES(
      7304,
      'Surakarta',
      209
);

INSERT INTO city
VALUES(
      7305,
      'Bogor',
      209
);

INSERT INTO city
VALUES(
      7306,
      'Magelang',
      209
);

INSERT INTO city
VALUES(
      7307,
      'Majene',
      209
);

INSERT INTO city
VALUES(
      7308,
      'Ende',
      209
);

INSERT INTO city
VALUES(
      7309,
      'Maumere',
      209
);

INSERT INTO city
VALUES(
      7310,
      'Kediri',
      209
);

INSERT INTO city
VALUES(
      7311,
      'Sibolga',
      209
);

INSERT INTO city
VALUES(
      7312,
      'Binjai',
      209
);

INSERT INTO city
VALUES(
      7313,
      'Tebingtinggi',
      209
);

INSERT INTO city
VALUES(
      7314,
      'Lhokseumawe',
      209
);

INSERT INTO city
VALUES(
      7315,
      'Bekasi',
      209
);

INSERT INTO city
VALUES(
      7316,
      'Malang',
      209
);

INSERT INTO city
VALUES(
      7317,
      'Pakalongan',
      209
);

INSERT INTO city
VALUES(
      7318,
      'Madiun',
      209
);

INSERT INTO city
VALUES(
      7319,
      'Tegal',
      209
);

INSERT INTO city
VALUES(
      7320,
      'Cirebon',
      209
);

INSERT INTO city
VALUES(
      7321,
      'Medan',
      209
);

INSERT INTO city
VALUES(
      7322,
      'Salatiga',
      209
);

INSERT INTO city
VALUES(
      7323,
      'Poso',
      209
);

INSERT INTO city
VALUES(
      7324,
      'Surabaya',
      209
);

INSERT INTO city
VALUES(
      7325,
      'Jakarta',
      209
);

INSERT INTO city
VALUES(
      7326,
      'Pematangsiantar',
      209
);

INSERT INTO city
VALUES(
      7327,
      'Probolinggo',
      209
);

INSERT INTO city
VALUES(
      7328,
      'Pasuruan',
      209
);

INSERT INTO city
VALUES(
      7329,
      'Mojokerto',
      209
);

INSERT INTO city
VALUES(
      7330,
      'Baubau',
      209
);

INSERT INTO city
VALUES(
      7331,
      'Parepare',
      209
);

INSERT INTO city
VALUES(
      7332,
      'Blitar',
      209
);

INSERT INTO city
VALUES(
      7333,
      'Watampone',
      209
);

INSERT INTO city
VALUES(
      7334,
      'Raba',
      209
);

INSERT INTO city
VALUES(
      7335,
      'Tuban',
      209
);

INSERT INTO city
VALUES(
      7336,
      'Pati',
      209
);

INSERT INTO city
VALUES(
      7337,
      'Kotabumi',
      209
);

INSERT INTO city
VALUES(
      7338,
      'Denpasar',
      209
);

INSERT INTO city
VALUES(
      7339,
      'Kuta',
      209
);

INSERT INTO city
VALUES(
      7340,
      'Biak',
      209
);

INSERT INTO city
VALUES(
      7341,
      'Perabumulih',
      209
);

INSERT INTO city
VALUES(
      7342,
      'Sungaipenuh',
      209
);

INSERT INTO city
VALUES(
      7343,
      'Manado',
      209
);

INSERT INTO city
VALUES(
      7344,
      'Timika',
      209
);

INSERT INTO city
VALUES(
      7345,
      'Amahai',
      209
);

INSERT INTO city
VALUES(
      7346,
      'Telukbutun',
      209
);

INSERT INTO city
VALUES(
      7347,
      'Sampit',
      209
);

INSERT INTO city
VALUES(
      7348,
      'Martapura',
      209
);

INSERT INTO city
VALUES(
      7349,
      'Jambi',
      209
);

INSERT INTO city
VALUES(
      7350,
      'Tanjungpandan',
      209
);

INSERT INTO city
VALUES(
      7351,
      'Sumenep',
      209
);

INSERT INTO city
VALUES(
      7352,
      'Tarakan',
      209
);

INSERT INTO city
VALUES(
      7353,
      'Sorong',
      209
);

INSERT INTO city
VALUES(
      7354,
      'Singkawang',
      209
);

INSERT INTO city
VALUES(
      7355,
      'Bukittinggi',
      209
);

INSERT INTO city
VALUES(
      7356,
      'Tasikmalaya',
      209
);

INSERT INTO city
VALUES(
      7357,
      'Sawahlunto',
      209
);

INSERT INTO city
VALUES(
      7358,
      'Langsa',
      209
);

INSERT INTO city
VALUES(
      7359,
      'Ruteng',
      209
);

INSERT INTO city
VALUES(
      7360,
      'Merauke',
      209
);

INSERT INTO city
VALUES(
      7361,
      'Banyuwangi',
      209
);

INSERT INTO city
VALUES(
      7362,
      'Jember',
      209
);

INSERT INTO city
VALUES(
      7363,
      'Nabire',
      209
);

INSERT INTO city
VALUES(
      7364,
      'Lahat',
      209
);

INSERT INTO city
VALUES(
      7365,
      'Cilacap',
      209
);

INSERT INTO city
VALUES(
      7366,
      'Indramayu',
      209
);

INSERT INTO city
VALUES(
      7367,
      'Praya',
      209
);

INSERT INTO city
VALUES(
      7368,
      'Waingapu',
      209
);

INSERT INTO city
VALUES(
      7369,
      'Ternate',
      209
);

INSERT INTO city
VALUES(
      7370,
      'Kualakapuas',
      209
);

INSERT INTO city
VALUES(
      7371,
      'Balikpapan',
      209
);

INSERT INTO city
VALUES(
      7372,
      'Bontang',
      209
);

INSERT INTO city
VALUES(
      7373,
      'Singaraja',
      209
);

INSERT INTO city
VALUES(
      7374,
      'Pinrang',
      209
);

INSERT INTO city
VALUES(
      7375,
      'Makale',
      209
);

INSERT INTO city
VALUES(
      7376,
      'Palopo',
      209
);

INSERT INTO city
VALUES(
      7377,
      'Luwuk',
      209
);

INSERT INTO city
VALUES(
      7378,
      'Tarutung',
      209
);

INSERT INTO city
VALUES(
      7379,
      'Padangsidempuan',
      209
);

INSERT INTO city
VALUES(
      7380,
      'Padangpanjang',
      209
);

INSERT INTO city
VALUES(
      7381,
      'Ambon',
      209
);

INSERT INTO city
VALUES(
      7382,
      'Padang',
      209
);

INSERT INTO city
VALUES(
      7383,
      'Banda Aceh',
      209
);

INSERT INTO city
VALUES(
      7384,
      'Bandar Lampung',
      209
);

INSERT INTO city
VALUES(
      7385,
      'Bandung',
      209
);

INSERT INTO city
VALUES(
      7386,
      'Bandjarmasin',
      209
);

INSERT INTO city
VALUES(
      7387,
      'Bengkulu',
      209
);

INSERT INTO city
VALUES(
      7388,
      'Gorontalo',
      209
);

INSERT INTO city
VALUES(
      7389,
      'Jayapura',
      209
);

INSERT INTO city
VALUES(
      7390,
      'Kendari',
      209
);

INSERT INTO city
VALUES(
      7391,
      'Kupang',
      209
);

INSERT INTO city
VALUES(
      7392,
      'Ujungpandang',
      209
);

INSERT INTO city
VALUES(
      7393,
      'Mamuju',
      209
);

INSERT INTO city
VALUES(
      7394,
      'Manokwari',
      209
);

INSERT INTO city
VALUES(
      7395,
      'Palangkaraya',
      209
);

INSERT INTO city
VALUES(
      7396,
      'Palembang',
      209
);

INSERT INTO city
VALUES(
      7397,
      'Palu',
      209
);

INSERT INTO city
VALUES(
      7398,
      'Pangkalpinang',
      209
);

INSERT INTO city
VALUES(
      7399,
      'Pekanbaru',
      209
);

INSERT INTO city
VALUES(
      7400,
      'Pontianak',
      209
);

INSERT INTO city
VALUES(
      7401,
      'Samarinda',
      209
);

INSERT INTO city
VALUES(
      7402,
      'Semarang',
      209
);

INSERT INTO city
VALUES(
      7403,
      'Serang',
      209
);

INSERT INTO city
VALUES(
      7404,
      'Tanjung Selor',
      209
);

INSERT INTO city
VALUES(
      7405,
      'Tanjungpinang',
      209
);

INSERT INTO city
VALUES(
      7406,
      'Yogyakarta',
      209
);

INSERT INTO city
VALUES(
      7407,
      'Mataram',
      209
);

INSERT INTO city
VALUES(
      7408,
      'Sofifi',
      209
);

INSERT INTO city
VALUES(
      7409,
      'Tidore',
      209
);

INSERT INTO country
VALUES(
      210,
      'Ireland'
);

INSERT INTO city
VALUES(
      7410,
      'Sligo',
      210
);

INSERT INTO city
VALUES(
      7411,
      'Mullingar',
      210
);

INSERT INTO city
VALUES(
      7412,
      'Drogheda',
      210
);

INSERT INTO city
VALUES(
      7413,
      'Dundalk',
      210
);

INSERT INTO city
VALUES(
      7414,
      'Muineachan',
      210
);

INSERT INTO city
VALUES(
      7415,
      'Port Laoise',
      210
);

INSERT INTO city
VALUES(
      7416,
      'Longford',
      210
);

INSERT INTO city
VALUES(
      7417,
      'Shannon',
      210
);

INSERT INTO city
VALUES(
      7418,
      'Tralee',
      210
);

INSERT INTO city
VALUES(
      7419,
      'Lifford',
      210
);

INSERT INTO city
VALUES(
      7420,
      'Wicklow',
      210
);

INSERT INTO city
VALUES(
      7421,
      'Kilkenny',
      210
);

INSERT INTO city
VALUES(
      7422,
      'An Cabhan',
      210
);

INSERT INTO city
VALUES(
      7423,
      'Carrick on Shannon',
      210
);

INSERT INTO city
VALUES(
      7424,
      'Wexford',
      210
);

INSERT INTO city
VALUES(
      7425,
      'Donegal',
      210
);

INSERT INTO city
VALUES(
      7426,
      'Killarney',
      210
);

INSERT INTO city
VALUES(
      7427,
      'Ros Comain',
      210
);

INSERT INTO city
VALUES(
      7428,
      'Galway',
      210
);

INSERT INTO city
VALUES(
      7429,
      'Cork',
      210
);

INSERT INTO city
VALUES(
      7430,
      'Dublin',
      210
);

INSERT INTO city
VALUES(
      7431,
      'Trim',
      210
);

INSERT INTO city
VALUES(
      7432,
      'Waterford',
      210
);

INSERT INTO city
VALUES(
      7433,
      'Limerick',
      210
);

INSERT INTO city
VALUES(
      7434,
      'Clonmel',
      210
);

INSERT INTO city
VALUES(
      7435,
      'Nenagh',
      210
);

INSERT INTO city
VALUES(
      7436,
      'Swords',
      210
);

INSERT INTO city
VALUES(
      7437,
      'Dunleary',
      210
);

INSERT INTO city
VALUES(
      7438,
      'Tallaght',
      210
);

INSERT INTO city
VALUES(
      7439,
      'Castlebar',
      210
);

INSERT INTO city
VALUES(
      7440,
      'Naas',
      210
);

INSERT INTO city
VALUES(
      7441,
      'Carlow',
      210
);

INSERT INTO city
VALUES(
      7442,
      'Ennis',
      210
);

INSERT INTO city
VALUES(
      7443,
      'Tullamore',
      210
);

INSERT INTO country
VALUES(
      211,
      'Israel'
);

INSERT INTO city
VALUES(
      7444,
      'Jerusalem',
      211
);

INSERT INTO city
VALUES(
      7445,
      'Beer Sheva',
      211
);

INSERT INTO city
VALUES(
      7446,
      'Nazareth',
      211
);

INSERT INTO city
VALUES(
      7447,
      'Tel Aviv-Yafo',
      211
);

INSERT INTO city
VALUES(
      7448,
      'Haifa',
      211
);

INSERT INTO city
VALUES(
      7449,
      'Ramla',
      211
);

INSERT INTO country
VALUES(
      212,
      'Isle Of Man'
);

INSERT INTO city
VALUES(
      7450,
      'Douglas',
      212
);

INSERT INTO country
VALUES(
      213,
      'India'
);

INSERT INTO city
VALUES(
      7451,
      'Kavaratti',
      213
);

INSERT INTO city
VALUES(
      7452,
      'New Delhi',
      213
);

INSERT INTO city
VALUES(
      7453,
      'Tezpur',
      213
);

INSERT INTO city
VALUES(
      7454,
      'Jullundur',
      213
);

INSERT INTO city
VALUES(
      7455,
      'Navsari',
      213
);

INSERT INTO city
VALUES(
      7456,
      'Asansol',
      213
);

INSERT INTO city
VALUES(
      7457,
      'Port Blair',
      213
);

INSERT INTO city
VALUES(
      7458,
      'Kota',
      213
);

INSERT INTO city
VALUES(
      7459,
      'Saharanpur',
      213
);

INSERT INTO city
VALUES(
      7460,
      'Bhuj',
      213
);

INSERT INTO city
VALUES(
      7461,
      'Gurgaon',
      213
);

INSERT INTO city
VALUES(
      7462,
      'Simla',
      213
);

INSERT INTO city
VALUES(
      7463,
      'Muzaffarpur',
      213
);

INSERT INTO city
VALUES(
      7464,
      'Gaya',
      213
);

INSERT INTO city
VALUES(
      7465,
      'Ratlam',
      213
);

INSERT INTO city
VALUES(
      7466,
      'Gwalior',
      213
);

INSERT INTO city
VALUES(
      7467,
      'Baramula',
      213
);

INSERT INTO city
VALUES(
      7468,
      'Guwahati',
      213
);

INSERT INTO city
VALUES(
      7469,
      'Dispur',
      213
);

INSERT INTO city
VALUES(
      7470,
      'Bidar',
      213
);

INSERT INTO city
VALUES(
      7471,
      'Pune',
      213
);

INSERT INTO city
VALUES(
      7472,
      'Ahmedabad',
      213
);

INSERT INTO city
VALUES(
      7473,
      'Haldia',
      213
);

INSERT INTO city
VALUES(
      7474,
      'Bhagalpur',
      213
);

INSERT INTO city
VALUES(
      7475,
      'Ujjain',
      213
);

INSERT INTO city
VALUES(
      7476,
      'Tonk',
      213
);

INSERT INTO city
VALUES(
      7477,
      'Agartala',
      213
);

INSERT INTO city
VALUES(
      7478,
      'Silchar',
      213
);

INSERT INTO city
VALUES(
      7479,
      'Vellore',
      213
);

INSERT INTO city
VALUES(
      7480,
      'Bharatpur',
      213
);

INSERT INTO city
VALUES(
      7481,
      'Siliguri',
      213
);

INSERT INTO city
VALUES(
      7482,
      'Gangtok',
      213
);

INSERT INTO city
VALUES(
      7483,
      'Cuttack',
      213
);

INSERT INTO city
VALUES(
      7484,
      'Alipur Duar',
      213
);

INSERT INTO city
VALUES(
      7485,
      'Bhubaneshwar',
      213
);

INSERT INTO city
VALUES(
      7486,
      'Dibrugarh',
      213
);

INSERT INTO city
VALUES(
      7487,
      'Jorhat',
      213
);

INSERT INTO city
VALUES(
      7488,
      'Hospet',
      213
);

INSERT INTO city
VALUES(
      7489,
      'Tuticorin',
      213
);

INSERT INTO city
VALUES(
      7490,
      'Sangli',
      213
);

INSERT INTO city
VALUES(
      7491,
      'Sholapur',
      213
);

INSERT INTO city
VALUES(
      7492,
      'Mumbai',
      213
);

INSERT INTO city
VALUES(
      7493,
      'Diu',
      213
);

INSERT INTO city
VALUES(
      7494,
      'Sirsa',
      213
);

INSERT INTO city
VALUES(
      7495,
      'Mangalore',
      213
);

INSERT INTO city
VALUES(
      7496,
      'Thiruvananthapuram',
      213
);

INSERT INTO city
VALUES(
      7497,
      'Kochi',
      213
);

INSERT INTO city
VALUES(
      7498,
      'Bangalore',
      213
);

INSERT INTO city
VALUES(
      7499,
      'Proddatur',
      213
);

INSERT INTO city
VALUES(
      7500,
      'Tirupati',
      213
);

INSERT INTO city
VALUES(
      7501,
      'Vadodara',
      213
);

INSERT INTO city
VALUES(
      7502,
      'Surat',
      213
);

INSERT INTO city
VALUES(
      7503,
      'Aizawl',
      213
);

INSERT INTO city
VALUES(
      7504,
      'Bhopal',
      213
);

INSERT INTO city
VALUES(
      7505,
      'Hyderabad',
      213
);

INSERT INTO city
VALUES(
      7506,
      'Chandigarh',
      213
);

INSERT INTO city
VALUES(
      7507,
      'Gandhinagar',
      213
);

INSERT INTO city
VALUES(
      7508,
      'Imphal',
      213
);

INSERT INTO city
VALUES(
      7509,
      'Kohima',
      213
);

INSERT INTO city
VALUES(
      7510,
      'Lucknow',
      213
);

INSERT INTO city
VALUES(
      7511,
      'Bijapur',
      213
);

INSERT INTO city
VALUES(
      7512,
      'Chennai',
      213
);

INSERT INTO city
VALUES(
      7513,
      'Guntur',
      213
);

INSERT INTO city
VALUES(
      7514,
      'Rajahmundry',
      213
);

INSERT INTO city
VALUES(
      7515,
      'Haora',
      213
);

INSERT INTO city
VALUES(
      7516,
      'Raurkela',
      213
);

INSERT INTO city
VALUES(
      7517,
      'Dhanbad',
      213
);

INSERT INTO city
VALUES(
      7518,
      'Bhatpara',
      213
);

INSERT INTO city
VALUES(
      7519,
      'Kolkata',
      213
);

INSERT INTO city
VALUES(
      7520,
      'Shillong',
      213
);

INSERT INTO city
VALUES(
      7521,
      'Puri',
      213
);

INSERT INTO city
VALUES(
      7522,
      'Krishnanagar',
      213
);

INSERT INTO city
VALUES(
      7523,
      'Jamshedpur',
      213
);

INSERT INTO city
VALUES(
      7524,
      'Jodhpur',
      213
);

INSERT INTO city
VALUES(
      7525,
      'Sikar',
      213
);

INSERT INTO city
VALUES(
      7526,
      'Barddhaman',
      213
);

INSERT INTO city
VALUES(
      7527,
      'Medinipur',
      213
);

INSERT INTO city
VALUES(
      7528,
      'Vishakhapatnam',
      213
);

INSERT INTO city
VALUES(
      7529,
      'Silvassa',
      213
);

INSERT INTO city
VALUES(
      7530,
      'Kolhapur',
      213
);

INSERT INTO city
VALUES(
      7531,
      'Latur',
      213
);

INSERT INTO city
VALUES(
      7532,
      'Pondicherry',
      213
);

INSERT INTO city
VALUES(
      7533,
      'Brahmapur',
      213
);

INSERT INTO city
VALUES(
      7534,
      'Bhiwandi',
      213
);

INSERT INTO city
VALUES(
      7535,
      'Rajkot',
      213
);

INSERT INTO city
VALUES(
      7536,
      'Kalyan',
      213
);

INSERT INTO city
VALUES(
      7537,
      'Coimbatore',
      213
);

INSERT INTO city
VALUES(
      7538,
      'Nasik',
      213
);

INSERT INTO city
VALUES(
      7539,
      'Porbandar',
      213
);

INSERT INTO city
VALUES(
      7540,
      'Parbhani',
      213
);

INSERT INTO city
VALUES(
      7541,
      'Akola',
      213
);

INSERT INTO city
VALUES(
      7542,
      'Ahmednagar',
      213
);

INSERT INTO city
VALUES(
      7543,
      'Aurangabad',
      213
);

INSERT INTO city
VALUES(
      7544,
      'Daman',
      213
);

INSERT INTO city
VALUES(
      7545,
      'Ranchi',
      213
);

INSERT INTO city
VALUES(
      7546,
      'Itanagar',
      213
);

INSERT INTO city
VALUES(
      7547,
      'Raipur',
      213
);

INSERT INTO city
VALUES(
      7548,
      'Kozhikode',
      213
);

INSERT INTO city
VALUES(
      7549,
      'Machilipatnam',
      213
);

INSERT INTO city
VALUES(
      7550,
      'Khammam',
      213
);

INSERT INTO city
VALUES(
      7551,
      'Kakinada',
      213
);

INSERT INTO city
VALUES(
      7552,
      'Panaji',
      213
);

INSERT INTO city
VALUES(
      7553,
      'Bhavnagar',
      213
);

INSERT INTO city
VALUES(
      7554,
      'Karnal',
      213
);

INSERT INTO city
VALUES(
      7555,
      'Rohtak',
      213
);

INSERT INTO city
VALUES(
      7556,
      'Hisar',
      213
);

INSERT INTO city
VALUES(
      7557,
      'Abohar',
      213
);

INSERT INTO city
VALUES(
      7558,
      'Agra',
      213
);

INSERT INTO city
VALUES(
      7559,
      'Alwar',
      213
);

INSERT INTO city
VALUES(
      7560,
      'Bhilwara',
      213
);

INSERT INTO city
VALUES(
      7561,
      'Udaipur',
      213
);

INSERT INTO city
VALUES(
      7562,
      'Meerut',
      213
);

INSERT INTO city
VALUES(
      7563,
      'Delhi',
      213
);

INSERT INTO city
VALUES(
      7564,
      'Rampur',
      213
);

INSERT INTO city
VALUES(
      7565,
      'Ludhiana',
      213
);

INSERT INTO city
VALUES(
      7566,
      'Sonipat',
      213
);

INSERT INTO city
VALUES(
      7567,
      'Dehra Dun',
      213
);

INSERT INTO city
VALUES(
      7568,
      'Ghaziabad',
      213
);

INSERT INTO city
VALUES(
      7569,
      'Faridabad',
      213
);

INSERT INTO city
VALUES(
      7570,
      'Amravati',
      213
);

INSERT INTO city
VALUES(
      7571,
      'Bhiwani',
      213
);

INSERT INTO city
VALUES(
      7572,
      'Gulbarga',
      213
);

INSERT INTO city
VALUES(
      7573,
      'Mathura',
      213
);

INSERT INTO city
VALUES(
      7574,
      'Hapur',
      213
);

INSERT INTO city
VALUES(
      7575,
      'Bhilai',
      213
);

INSERT INTO city
VALUES(
      7576,
      'Warangal',
      213
);

INSERT INTO city
VALUES(
      7577,
      'Raichur',
      213
);

INSERT INTO city
VALUES(
      7578,
      'Firozabad',
      213
);

INSERT INTO city
VALUES(
      7579,
      'Burhanpur',
      213
);

INSERT INTO city
VALUES(
      7580,
      'Ambala',
      213
);

INSERT INTO city
VALUES(
      7581,
      'Varanasi',
      213
);

INSERT INTO city
VALUES(
      7582,
      'Hathras',
      213
);

INSERT INTO city
VALUES(
      7583,
      'Shahjahanpur',
      213
);

INSERT INTO city
VALUES(
      7584,
      'Jabalpur',
      213
);

INSERT INTO city
VALUES(
      7585,
      'Patiala',
      213
);

INSERT INTO city
VALUES(
      7586,
      'Nagpur',
      213
);

INSERT INTO city
VALUES(
      7587,
      'Bulandshahr',
      213
);

INSERT INTO city
VALUES(
      7588,
      'Nanded',
      213
);

INSERT INTO city
VALUES(
      7589,
      'Hoshiarpur',
      213
);

INSERT INTO city
VALUES(
      7590,
      'Aligarh',
      213
);

INSERT INTO city
VALUES(
      7591,
      'Mirzapur',
      213
);

INSERT INTO city
VALUES(
      7592,
      'Bikaner',
      213
);

INSERT INTO city
VALUES(
      7593,
      'Srinagar',
      213
);

INSERT INTO city
VALUES(
      7594,
      'Jhansi',
      213
);

INSERT INTO city
VALUES(
      7595,
      'Fatehpur',
      213
);

INSERT INTO city
VALUES(
      7596,
      'Sagar',
      213
);

INSERT INTO city
VALUES(
      7597,
      'Bahraich',
      213
);

INSERT INTO city
VALUES(
      7598,
      'Kanpur',
      213
);

INSERT INTO city
VALUES(
      7599,
      'Gorakhpur',
      213
);

INSERT INTO city
VALUES(
      7600,
      'Jammu',
      213
);

INSERT INTO city
VALUES(
      7601,
      'Nizamabad',
      213
);

INSERT INTO city
VALUES(
      7602,
      'Faizabad',
      213
);

INSERT INTO city
VALUES(
      7603,
      'Sopore',
      213
);

INSERT INTO city
VALUES(
      7604,
      'Allahabad',
      213
);

INSERT INTO city
VALUES(
      7605,
      'Sambalpur',
      213
);

INSERT INTO city
VALUES(
      7606,
      'Pathankot',
      213
);

INSERT INTO city
VALUES(
      7607,
      'Bilaspur',
      213
);

INSERT INTO city
VALUES(
      7608,
      'Indore',
      213
);

INSERT INTO city
VALUES(
      7609,
      'Sitapur',
      213
);

INSERT INTO city
VALUES(
      7610,
      'Malegaon',
      213
);

INSERT INTO city
VALUES(
      7611,
      'Dhule',
      213
);

INSERT INTO city
VALUES(
      7612,
      'Panipat',
      213
);

INSERT INTO city
VALUES(
      7613,
      'Muzaffarnagar',
      213
);

INSERT INTO city
VALUES(
      7614,
      'Ongole',
      213
);

INSERT INTO city
VALUES(
      7615,
      'Jaipur',
      213
);

INSERT INTO city
VALUES(
      7616,
      'Moradabad',
      213
);

INSERT INTO city
VALUES(
      7617,
      'Pali',
      213
);

INSERT INTO city
VALUES(
      7618,
      'Vijayawada',
      213
);

INSERT INTO city
VALUES(
      7619,
      'Budaun',
      213
);

INSERT INTO city
VALUES(
      7620,
      'Bareilly',
      213
);

INSERT INTO city
VALUES(
      7621,
      'Aurangabad',
      213
);

INSERT INTO city
VALUES(
      7622,
      'Vizianagaram',
      213
);

INSERT INTO city
VALUES(
      7623,
      'Chirala',
      213
);

INSERT INTO city
VALUES(
      7624,
      'Ajmer',
      213
);

INSERT INTO city
VALUES(
      7625,
      'Pilibhit',
      213
);

INSERT INTO city
VALUES(
      7626,
      'Hindupur',
      213
);

INSERT INTO city
VALUES(
      7627,
      'Mandya',
      213
);

INSERT INTO city
VALUES(
      7628,
      'Karimnagar',
      213
);

INSERT INTO city
VALUES(
      7629,
      'Tumkur',
      213
);

INSERT INTO city
VALUES(
      7630,
      'Mysore',
      213
);

INSERT INTO city
VALUES(
      7631,
      'Hubli',
      213
);

INSERT INTO city
VALUES(
      7632,
      'Shimoga',
      213
);

INSERT INTO city
VALUES(
      7633,
      'Chandrapur',
      213
);

INSERT INTO city
VALUES(
      7634,
      'Bellary',
      213
);

INSERT INTO city
VALUES(
      7635,
      'Davangere',
      213
);

INSERT INTO city
VALUES(
      7636,
      'Amritsar',
      213
);

INSERT INTO city
VALUES(
      7637,
      'Belgaum',
      213
);

INSERT INTO city
VALUES(
      7638,
      'Etawah',
      213
);

INSERT INTO city
VALUES(
      7639,
      'Patna',
      213
);

INSERT INTO city
VALUES(
      7640,
      'Purnia',
      213
);

INSERT INTO city
VALUES(
      7641,
      'Bhusawal',
      213
);

INSERT INTO city
VALUES(
      7642,
      'Nandyal',
      213
);

INSERT INTO city
VALUES(
      7643,
      'Kurnool',
      213
);

INSERT INTO city
VALUES(
      7644,
      'Kolar',
      213
);

INSERT INTO city
VALUES(
      7645,
      'Nellore',
      213
);

INSERT INTO city
VALUES(
      7646,
      'Tiruvannamalai',
      213
);

INSERT INTO city
VALUES(
      7647,
      'Kanchipuram',
      213
);

INSERT INTO city
VALUES(
      7648,
      'Valparai',
      213
);

INSERT INTO city
VALUES(
      7649,
      'Tiruppur',
      213
);

INSERT INTO city
VALUES(
      7650,
      'Alappuzha',
      213
);

INSERT INTO city
VALUES(
      7651,
      'Kollam',
      213
);

INSERT INTO city
VALUES(
      7652,
      'Karur',
      213
);

INSERT INTO city
VALUES(
      7653,
      'Kumbakonam',
      213
);

INSERT INTO city
VALUES(
      7654,
      'Thanjavur',
      213
);

INSERT INTO city
VALUES(
      7655,
      'Nagercoil',
      213
);

INSERT INTO city
VALUES(
      7656,
      'Tirunelveli',
      213
);

INSERT INTO city
VALUES(
      7657,
      'Rajapalaiyam',
      213
);

INSERT INTO city
VALUES(
      7658,
      'Salem',
      213
);

INSERT INTO city
VALUES(
      7659,
      'Tiruchirappalli',
      213
);

INSERT INTO city
VALUES(
      7660,
      'Madurai',
      213
);

INSERT INTO city
VALUES(
      7661,
      'Cuddalore',
      213
);

INSERT INTO city
VALUES(
      7662,
      'Dindigul',
      213
);

INSERT INTO country
VALUES(
      214,
      'Iraq'
);

INSERT INTO city
VALUES(
      7663,
      'Mandali',
      214
);

INSERT INTO city
VALUES(
      7664,
      'Baghdad',
      214
);

INSERT INTO city
VALUES(
      7665,
      'As Sulaymaniyah',
      214
);

INSERT INTO city
VALUES(
      7666,
      'As Samawah',
      214
);

INSERT INTO city
VALUES(
      7667,
      'Ash Shatrah',
      214
);

INSERT INTO city
VALUES(
      7668,
      'Mosul',
      214
);

INSERT INTO city
VALUES(
      7669,
      'Kirkuk',
      214
);

INSERT INTO city
VALUES(
      7670,
      'Tikrit',
      214
);

INSERT INTO city
VALUES(
      7671,
      'Baqubah',
      214
);

INSERT INTO city
VALUES(
      7672,
      'Karbala',
      214
);

INSERT INTO city
VALUES(
      7673,
      'Al Amarah',
      214
);

INSERT INTO city
VALUES(
      7674,
      'Samarra',
      214
);

INSERT INTO city
VALUES(
      7675,
      'Ar Rutbah',
      214
);

INSERT INTO city
VALUES(
      7676,
      'Al Musayyib',
      214
);

INSERT INTO city
VALUES(
      7677,
      'Tall Afar',
      214
);

INSERT INTO city
VALUES(
      7678,
      'Ar Ramadi',
      214
);

INSERT INTO city
VALUES(
      7679,
      'Dahuk',
      214
);

INSERT INTO city
VALUES(
      7680,
      'Al Fallujah',
      214
);

INSERT INTO city
VALUES(
      7681,
      'Az Aubayr',
      214
);

INSERT INTO city
VALUES(
      7682,
      'Al Hillah',
      214
);

INSERT INTO city
VALUES(
      7683,
      'An Najaf',
      214
);

INSERT INTO city
VALUES(
      7684,
      'Ad Diwaniyah',
      214
);

INSERT INTO city
VALUES(
      7685,
      'Al Kut',
      214
);

INSERT INTO city
VALUES(
      7686,
      'An Nasiriyah',
      214
);

INSERT INTO city
VALUES(
      7687,
      'Basra',
      214
);

INSERT INTO city
VALUES(
      7688,
      'Zakho',
      214
);

INSERT INTO city
VALUES(
      7689,
      'Irbil',
      214
);

INSERT INTO country
VALUES(
      215,
      'Iran'
);

INSERT INTO city
VALUES(
      7690,
      'Bojnurd',
      215
);

INSERT INTO city
VALUES(
      7691,
      'Mahabad',
      215
);

INSERT INTO city
VALUES(
      7692,
      'Ardabil',
      215
);

INSERT INTO city
VALUES(
      7693,
      'Isfahan',
      215
);

INSERT INTO city
VALUES(
      7694,
      'Urmia',
      215
);

INSERT INTO city
VALUES(
      7695,
      'Zahedan',
      215
);

INSERT INTO city
VALUES(
      7696,
      'Ilam',
      215
);

INSERT INTO city
VALUES(
      7697,
      'Bandar-e-Abbas',
      215
);

INSERT INTO city
VALUES(
      7698,
      'Kermanshah',
      215
);

INSERT INTO city
VALUES(
      7699,
      'Tabriz',
      215
);

INSERT INTO city
VALUES(
      7700,
      'Khorramabad',
      215
);

INSERT INTO city
VALUES(
      7701,
      'Hamadan',
      215
);

INSERT INTO city
VALUES(
      7702,
      'Yasuj',
      215
);

INSERT INTO city
VALUES(
      7703,
      'Sari',
      215
);

INSERT INTO city
VALUES(
      7704,
      'Birjand',
      215
);

INSERT INTO city
VALUES(
      7705,
      'Kerman',
      215
);

INSERT INTO city
VALUES(
      7706,
      'Sari',
      215
);

INSERT INTO city
VALUES(
      7707,
      'Ilam',
      215
);

INSERT INTO city
VALUES(
      7708,
      'Sanandaj',
      215
);

INSERT INTO city
VALUES(
      7709,
      'Abadan',
      215
);

INSERT INTO city
VALUES(
      7710,
      'Shiraz',
      215
);

INSERT INTO city
VALUES(
      7711,
      'Bandar-e Bushehr',
      215
);

INSERT INTO city
VALUES(
      7712,
      'Mashhad',
      215
);

INSERT INTO city
VALUES(
      7713,
      'Yazd',
      215
);

INSERT INTO city
VALUES(
      7714,
      'Semnan',
      215
);

INSERT INTO city
VALUES(
      7715,
      'Karaj',
      215
);

INSERT INTO city
VALUES(
      7716,
      'Maragheh',
      215
);

INSERT INTO city
VALUES(
      7717,
      'Borujerd',
      215
);

INSERT INTO city
VALUES(
      7718,
      'Amol',
      215
);

INSERT INTO city
VALUES(
      7719,
      'Saveh',
      215
);

INSERT INTO city
VALUES(
      7720,
      'Kashmar',
      215
);

INSERT INTO city
VALUES(
      7721,
      'Torbat-e Jam',
      215
);

INSERT INTO city
VALUES(
      7722,
      'Quchan',
      215
);

INSERT INTO city
VALUES(
      7723,
      'Khomeini Shahr',
      215
);

INSERT INTO city
VALUES(
      7724,
      'Shahrud',
      215
);

INSERT INTO city
VALUES(
      7725,
      'Ahar',
      215
);

INSERT INTO city
VALUES(
      7726,
      'Zabol',
      215
);

INSERT INTO city
VALUES(
      7727,
      'Qazvin',
      215
);

INSERT INTO city
VALUES(
      7728,
      'Sirjan',
      215
);

INSERT INTO city
VALUES(
      7729,
      'Marv Dasht',
      215
);

INSERT INTO city
VALUES(
      7730,
      'Bam',
      215
);

INSERT INTO city
VALUES(
      7731,
      'Qasr-e Shirin',
      215
);

INSERT INTO city
VALUES(
      7732,
      'Gonbad-e Kavus',
      215
);

INSERT INTO city
VALUES(
      7733,
      'Masjed Soleyman',
      215
);

INSERT INTO city
VALUES(
      7734,
      'Behbehan',
      215
);

INSERT INTO city
VALUES(
      7735,
      'Kashan',
      215
);

INSERT INTO city
VALUES(
      7736,
      'Fasa',
      215
);

INSERT INTO city
VALUES(
      7737,
      'Qomsheh',
      215
);

INSERT INTO city
VALUES(
      7738,
      'Varamin',
      215
);

INSERT INTO city
VALUES(
      7739,
      'Chabahar',
      215
);

INSERT INTO city
VALUES(
      7740,
      'Qom',
      215
);

INSERT INTO city
VALUES(
      7741,
      'Dezful',
      215
);

INSERT INTO city
VALUES(
      7742,
      'Gorgan',
      215
);

INSERT INTO city
VALUES(
      7743,
      'Rasht',
      215
);

INSERT INTO city
VALUES(
      7744,
      'Sabzewar',
      215
);

INSERT INTO city
VALUES(
      7745,
      'Tehran',
      215
);

INSERT INTO city
VALUES(
      7746,
      'Ahvaz',
      215
);

INSERT INTO city
VALUES(
      7747,
      'Malayer',
      215
);

INSERT INTO city
VALUES(
      7748,
      'Zanjan',
      215
);

INSERT INTO city
VALUES(
      7749,
      'Bijar',
      215
);

INSERT INTO city
VALUES(
      7750,
      'Neyshabur',
      215
);

INSERT INTO city
VALUES(
      7751,
      'Khvoy',
      215
);

INSERT INTO city
VALUES(
      7752,
      'Arak',
      215
);

INSERT INTO city
VALUES(
      7753,
      'Shar e Kord',
      215
);

INSERT INTO country
VALUES(
      216,
      'Iceland'
);

INSERT INTO city
VALUES(
      7754,
      'Reykjavik',
      216
);

INSERT INTO city
VALUES(
      7755,
      'Hofn',
      216
);

INSERT INTO city
VALUES(
      7756,
      'Akureyi',
      216
);

INSERT INTO city
VALUES(
      7757,
      'Borgarnes',
      216
);

INSERT INTO city
VALUES(
      7758,
      'Egilsstadir',
      216
);

INSERT INTO city
VALUES(
      7759,
      'Isafjordur',
      216
);

INSERT INTO city
VALUES(
      7760,
      'Keflavik',
      216
);

INSERT INTO city
VALUES(
      7761,
      'Saudarkrokur',
      216
);

INSERT INTO city
VALUES(
      7762,
      'Selfoss',
      216
);

INSERT INTO country
VALUES(
      217,
      'Italy'
);

INSERT INTO city
VALUES(
      7763,
      'Venice',
      217
);

INSERT INTO city
VALUES(
      7764,
      'Trento',
      217
);

INSERT INTO city
VALUES(
      7765,
      'Cagliari',
      217
);

INSERT INTO city
VALUES(
      7766,
      'Rome',
      217
);

INSERT INTO city
VALUES(
      7767,
      'Trieste',
      217
);

INSERT INTO city
VALUES(
      7768,
      'Palermo',
      217
);

INSERT INTO city
VALUES(
      7769,
      'Marsala',
      217
);

INSERT INTO city
VALUES(
      7770,
      'Campobasso',
      217
);

INSERT INTO city
VALUES(
      7771,
      'LaAquila',
      217
);

INSERT INTO city
VALUES(
      7772,
      'Civitavecchia',
      217
);

INSERT INTO city
VALUES(
      7773,
      'Catanzaro',
      217
);

INSERT INTO city
VALUES(
      7774,
      'Genoa',
      217
);

INSERT INTO city
VALUES(
      7775,
      'Ancona',
      217
);

INSERT INTO city
VALUES(
      7776,
      'Bologna',
      217
);

INSERT INTO city
VALUES(
      7777,
      'Potenza',
      217
);

INSERT INTO city
VALUES(
      7778,
      'Bari',
      217
);

INSERT INTO city
VALUES(
      7779,
      'Milan',
      217
);

INSERT INTO city
VALUES(
      7780,
      'Turin',
      217
);

INSERT INTO city
VALUES(
      7781,
      'Naples',
      217
);

INSERT INTO city
VALUES(
      7782,
      'Florence',
      217
);

INSERT INTO city
VALUES(
      7783,
      'Aosta',
      217
);

INSERT INTO city
VALUES(
      7784,
      'Perugia',
      217
);

INSERT INTO city
VALUES(
      7785,
      'Como',
      217
);

INSERT INTO city
VALUES(
      7786,
      'Novara',
      217
);

INSERT INTO city
VALUES(
      7787,
      'Asti',
      217
);

INSERT INTO city
VALUES(
      7788,
      'Sassari',
      217
);

INSERT INTO city
VALUES(
      7789,
      'Olbia',
      217
);

INSERT INTO city
VALUES(
      7790,
      'Modena',
      217
);

INSERT INTO city
VALUES(
      7791,
      'Ferrara',
      217
);

INSERT INTO city
VALUES(
      7792,
      'Ravenna',
      217
);

INSERT INTO city
VALUES(
      7793,
      'Treviso',
      217
);

INSERT INTO city
VALUES(
      7794,
      'Verona',
      217
);

INSERT INTO city
VALUES(
      7795,
      'Udine',
      217
);

INSERT INTO city
VALUES(
      7796,
      'Bolzano',
      217
);

INSERT INTO city
VALUES(
      7797,
      'Bergamo',
      217
);

INSERT INTO city
VALUES(
      7798,
      'Salerno',
      217
);

INSERT INTO city
VALUES(
      7799,
      'Pescara',
      217
);

INSERT INTO city
VALUES(
      7800,
      'Arezzo',
      217
);

INSERT INTO city
VALUES(
      7801,
      'Siena',
      217
);

INSERT INTO city
VALUES(
      7802,
      'Livorno',
      217
);

INSERT INTO city
VALUES(
      7803,
      'Pisa',
      217
);

INSERT INTO city
VALUES(
      7804,
      'Parma',
      217
);

INSERT INTO city
VALUES(
      7805,
      'Catania',
      217
);

INSERT INTO city
VALUES(
      7806,
      'Messina',
      217
);

INSERT INTO city
VALUES(
      7807,
      'Ragusa',
      217
);

INSERT INTO city
VALUES(
      7808,
      'Siracusa',
      217
);

INSERT INTO city
VALUES(
      7809,
      'Reggio di Calabria',
      217
);

INSERT INTO city
VALUES(
      7810,
      'Vibo Valentia',
      217
);

INSERT INTO city
VALUES(
      7811,
      'Crotone',
      217
);

INSERT INTO city
VALUES(
      7812,
      'Foggia',
      217
);

INSERT INTO city
VALUES(
      7813,
      'Barletta',
      217
);

INSERT INTO city
VALUES(
      7814,
      'Taranto',
      217
);

INSERT INTO city
VALUES(
      7815,
      'Brindisi',
      217
);

INSERT INTO city
VALUES(
      7816,
      'Lecce',
      217
);

INSERT INTO city
VALUES(
      7817,
      'Benevento',
      217
);

INSERT INTO city
VALUES(
      7818,
      'Caserta',
      217
);

INSERT INTO country
VALUES(
      218,
      'Jersey'
);

INSERT INTO city
VALUES(
      7819,
      'Saint Helier',
      218
);

INSERT INTO country
VALUES(
      219,
      'Jamaica'
);

INSERT INTO city
VALUES(
      7820,
      'Port Morant',
      219
);

INSERT INTO city
VALUES(
      7821,
      'Kingston',
      219
);

INSERT INTO city
VALUES(
      7822,
      'Black River',
      219
);

INSERT INTO city
VALUES(
      7823,
      'Falmouth',
      219
);

INSERT INTO city
VALUES(
      7824,
      'Lucea',
      219
);

INSERT INTO city
VALUES(
      7825,
      'Mandeville',
      219
);

INSERT INTO city
VALUES(
      7826,
      'May Pen',
      219
);

INSERT INTO city
VALUES(
      7827,
      'Montego Bay',
      219
);

INSERT INTO city
VALUES(
      7828,
      'Morant Bay',
      219
);

INSERT INTO city
VALUES(
      7829,
      'Port Antonio',
      219
);

INSERT INTO city
VALUES(
      7830,
      'Port Maria',
      219
);

INSERT INTO city
VALUES(
      7831,
      'St. Annas Bay',
      219
);

INSERT INTO city
VALUES(
      7832,
      'Savanna-la-Mar',
      219
);

INSERT INTO city
VALUES(
      7833,
      'Spanish Town',
      219
);

INSERT INTO city
VALUES(
      7834,
      'Half Way Tree',
      219
);

INSERT INTO country
VALUES(
      220,
      'Jordan'
);

INSERT INTO city
VALUES(
      7835,
      '`Ajlun',
      220
);

INSERT INTO city
VALUES(
      7836,
      'Amman',
      220
);

INSERT INTO city
VALUES(
      7837,
      'Maaan',
      220
);

INSERT INTO city
VALUES(
      7838,
      'Al Aqabah',
      220
);

INSERT INTO city
VALUES(
      7839,
      'Al Mafraq',
      220
);

INSERT INTO city
VALUES(
      7840,
      'Irbid',
      220
);

INSERT INTO city
VALUES(
      7841,
      'As Salt',
      220
);

INSERT INTO city
VALUES(
      7842,
      'Jarash',
      220
);

INSERT INTO city
VALUES(
      7843,
      'Az Zarqa',
      220
);

INSERT INTO city
VALUES(
      7844,
      'Al Karak',
      220
);

INSERT INTO city
VALUES(
      7845,
      'At Tafilah',
      220
);

INSERT INTO city
VALUES(
      7846,
      'Madaba',
      220
);

INSERT INTO country
VALUES(
      221,
      'Japan'
);

INSERT INTO city
VALUES(
      7847,
      'Muroran',
      221
);

INSERT INTO city
VALUES(
      7848,
      'Iwaki',
      221
);

INSERT INTO city
VALUES(
      7849,
      'Sakata',
      221
);

INSERT INTO city
VALUES(
      7850,
      'Tottori',
      221
);

INSERT INTO city
VALUES(
      7851,
      'Maizuru',
      221
);

INSERT INTO city
VALUES(
      7852,
      'Hamamatsu',
      221
);

INSERT INTO city
VALUES(
      7853,
      'Takaoka',
      221
);

INSERT INTO city
VALUES(
      7854,
      'Asahikawa',
      221
);

INSERT INTO city
VALUES(
      7855,
      'Tsuruoka',
      221
);

INSERT INTO city
VALUES(
      7856,
      'Otaru',
      221
);

INSERT INTO city
VALUES(
      7857,
      'Kawagoe',
      221
);

INSERT INTO city
VALUES(
      7858,
      'Hachioji',
      221
);

INSERT INTO city
VALUES(
      7859,
      'Hirosaki',
      221
);

INSERT INTO city
VALUES(
      7860,
      'Kure',
      221
);

INSERT INTO city
VALUES(
      7861,
      'Hachinohe',
      221
);

INSERT INTO city
VALUES(
      7862,
      'Matsumoto',
      221
);

INSERT INTO city
VALUES(
      7863,
      'Tokyo',
      221
);

INSERT INTO city
VALUES(
      7864,
      'Tomakomai',
      221
);

INSERT INTO city
VALUES(
      7865,
      'Obihiro',
      221
);

INSERT INTO city
VALUES(
      7866,
      'Nagaoka',
      221
);

INSERT INTO city
VALUES(
      7867,
      'Koriyama',
      221
);

INSERT INTO city
VALUES(
      7868,
      'Shimonoseki',
      221
);

INSERT INTO city
VALUES(
      7869,
      'Sasebo',
      221
);

INSERT INTO city
VALUES(
      7870,
      'Kanoya',
      221
);

INSERT INTO city
VALUES(
      7871,
      'Kitakyushu',
      221
);

INSERT INTO city
VALUES(
      7872,
      'Akita',
      221
);

INSERT INTO city
VALUES(
      7873,
      'Aomori',
      221
);

INSERT INTO city
VALUES(
      7874,
      'Chiba',
      221
);

INSERT INTO city
VALUES(
      7875,
      'Fukui',
      221
);

INSERT INTO city
VALUES(
      7876,
      'Fukuoka',
      221
);

INSERT INTO city
VALUES(
      7877,
      'Fukushima',
      221
);

INSERT INTO city
VALUES(
      7878,
      'Gifu',
      221
);

INSERT INTO city
VALUES(
      7879,
      'Hiroshima',
      221
);

INSERT INTO city
VALUES(
      7880,
      'Kagoshima',
      221
);

INSERT INTO city
VALUES(
      7881,
      'Kanazawa',
      221
);

INSERT INTO city
VALUES(
      7882,
      'Kobe',
      221
);

INSERT INTO city
VALUES(
      7883,
      'Kochi',
      221
);

INSERT INTO city
VALUES(
      7884,
      'Kofu',
      221
);

INSERT INTO city
VALUES(
      7885,
      'Kumamoto',
      221
);

INSERT INTO city
VALUES(
      7886,
      'Kyoto',
      221
);

INSERT INTO city
VALUES(
      7887,
      'Maebashi',
      221
);

INSERT INTO city
VALUES(
      7888,
      'Matsue',
      221
);

INSERT INTO city
VALUES(
      7889,
      'Matsuyama',
      221
);

INSERT INTO city
VALUES(
      7890,
      'Mito',
      221
);

INSERT INTO city
VALUES(
      7891,
      'Miyazaki',
      221
);

INSERT INTO city
VALUES(
      7892,
      'Morioka',
      221
);

INSERT INTO city
VALUES(
      7893,
      'Nagano',
      221
);

INSERT INTO city
VALUES(
      7894,
      'Nagasaki',
      221
);

INSERT INTO city
VALUES(
      7895,
      'Nagoya',
      221
);

INSERT INTO city
VALUES(
      7896,
      'Naha',
      221
);

INSERT INTO city
VALUES(
      7897,
      'Niigata',
      221
);

INSERT INTO city
VALUES(
      7898,
      'Oita',
      221
);

INSERT INTO city
VALUES(
      7899,
      'Okayama',
      221
);

INSERT INTO city
VALUES(
      7900,
      'Osaka',
      221
);

INSERT INTO city
VALUES(
      7901,
      'Otsu',
      221
);

INSERT INTO city
VALUES(
      7902,
      'Sapporo',
      221
);

INSERT INTO city
VALUES(
      7903,
      'Sendai',
      221
);

INSERT INTO city
VALUES(
      7904,
      'Shizuoka',
      221
);

INSERT INTO city
VALUES(
      7905,
      'Takamatsu',
      221
);

INSERT INTO city
VALUES(
      7906,
      'Tokushima',
      221
);

INSERT INTO city
VALUES(
      7907,
      'Tottori',
      221
);

INSERT INTO city
VALUES(
      7908,
      'Toyama',
      221
);

INSERT INTO city
VALUES(
      7909,
      'Tsu',
      221
);

INSERT INTO city
VALUES(
      7910,
      'Utsunomiya',
      221
);

INSERT INTO city
VALUES(
      7911,
      'Wakayama',
      221
);

INSERT INTO city
VALUES(
      7912,
      'Yamagata',
      221
);

INSERT INTO city
VALUES(
      7913,
      'Yamaguchi',
      221
);

INSERT INTO city
VALUES(
      7914,
      'Yokohama',
      221
);

INSERT INTO city
VALUES(
      7915,
      'Saitama',
      221
);

INSERT INTO city
VALUES(
      7916,
      'Saga',
      221
);

INSERT INTO city
VALUES(
      7917,
      'Kawasaki',
      221
);

INSERT INTO city
VALUES(
      7918,
      'Nara',
      221
);

INSERT INTO city
VALUES(
      7919,
      'Kushiro',
      221
);

INSERT INTO city
VALUES(
      7920,
      'Kitami',
      221
);

INSERT INTO city
VALUES(
      7921,
      'Hakodate',
      221
);

INSERT INTO country
VALUES(
      222,
      'Kenya'
);

INSERT INTO city
VALUES(
      7922,
      'Namanga',
      222
);

INSERT INTO city
VALUES(
      7923,
      'Nairobi',
      222
);

INSERT INTO city
VALUES(
      7924,
      'Moyale',
      222
);

INSERT INTO city
VALUES(
      7925,
      'Kisumu',
      222
);

INSERT INTO city
VALUES(
      7926,
      'Mombasa',
      222
);

INSERT INTO city
VALUES(
      7927,
      'Nyeri',
      222
);

INSERT INTO city
VALUES(
      7928,
      'Garissa',
      222
);

INSERT INTO city
VALUES(
      7929,
      'Kakamega',
      222
);

INSERT INTO city
VALUES(
      7930,
      'Nakuru',
      222
);

INSERT INTO city
VALUES(
      7931,
      'Witu',
      222
);

INSERT INTO city
VALUES(
      7932,
      'Embu',
      222
);

INSERT INTO city
VALUES(
      7933,
      'Homa Bay',
      222
);

INSERT INTO city
VALUES(
      7934,
      'Isiolo',
      222
);

INSERT INTO city
VALUES(
      7935,
      'Iten',
      222
);

INSERT INTO city
VALUES(
      7936,
      'Kabarnet',
      222
);

INSERT INTO city
VALUES(
      7937,
      'Kajiado',
      222
);

INSERT INTO city
VALUES(
      7938,
      'Kapenguria',
      222
);

INSERT INTO city
VALUES(
      7939,
      'Kapsabet',
      222
);

INSERT INTO city
VALUES(
      7940,
      'Kericho',
      222
);

INSERT INTO city
VALUES(
      7941,
      'Kerugoya',
      222
);

INSERT INTO city
VALUES(
      7942,
      'Kiambu',
      222
);

INSERT INTO city
VALUES(
      7943,
      'Kilifi',
      222
);

INSERT INTO city
VALUES(
      7944,
      'Kisii',
      222
);

INSERT INTO city
VALUES(
      7945,
      'Kitale',
      222
);

INSERT INTO city
VALUES(
      7946,
      'Kitui',
      222
);

INSERT INTO city
VALUES(
      7947,
      'Kwale',
      222
);

INSERT INTO city
VALUES(
      7948,
      'Lamu',
      222
);

INSERT INTO city
VALUES(
      7949,
      'Lodwar',
      222
);

INSERT INTO city
VALUES(
      7950,
      'Machakos',
      222
);

INSERT INTO city
VALUES(
      7951,
      'Mandera',
      222
);

INSERT INTO city
VALUES(
      7952,
      'Maralal',
      222
);

INSERT INTO city
VALUES(
      7953,
      'Marsabit',
      222
);

INSERT INTO city
VALUES(
      7954,
      'Meru',
      222
);

INSERT INTO city
VALUES(
      7955,
      'Migori',
      222
);

INSERT INTO city
VALUES(
      7956,
      'Murangaa',
      222
);

INSERT INTO city
VALUES(
      7957,
      'Mwatate',
      222
);

INSERT INTO city
VALUES(
      7958,
      'Narok',
      222
);

INSERT INTO city
VALUES(
      7959,
      'Nyamira',
      222
);

INSERT INTO city
VALUES(
      7960,
      'Ol Kalou',
      222
);

INSERT INTO city
VALUES(
      7961,
      'Rumuruti',
      222
);

INSERT INTO city
VALUES(
      7962,
      'Wajir',
      222
);

INSERT INTO city
VALUES(
      7963,
      'Wote',
      222
);

INSERT INTO city
VALUES(
      7964,
      'Busia',
      222
);

INSERT INTO city
VALUES(
      7965,
      'Kathwana',
      222
);

INSERT INTO city
VALUES(
      7966,
      'Sotik Post',
      222
);

INSERT INTO city
VALUES(
      7967,
      'Bungoma',
      222
);

INSERT INTO city
VALUES(
      7968,
      'Eldoret',
      222
);

INSERT INTO city
VALUES(
      7969,
      'Hola',
      222
);

INSERT INTO city
VALUES(
      7970,
      'Karungu',
      222
);

INSERT INTO city
VALUES(
      7971,
      'Siaya',
      222
);

INSERT INTO city
VALUES(
      7972,
      'Naivasha',
      222
);

INSERT INTO city
VALUES(
      7973,
      'Thika',
      222
);

INSERT INTO city
VALUES(
      7974,
      'Konza',
      222
);

INSERT INTO city
VALUES(
      7975,
      'Eldama Ravine',
      222
);

INSERT INTO city
VALUES(
      7976,
      'Tsavo',
      222
);

INSERT INTO city
VALUES(
      7977,
      'Voi',
      222
);

INSERT INTO city
VALUES(
      7978,
      'Nanyuki',
      222
);

INSERT INTO city
VALUES(
      7979,
      'Malindi',
      222
);

INSERT INTO city
VALUES(
      7980,
      'Kendu Bay',
      222
);

INSERT INTO city
VALUES(
      7981,
      'Mwingi',
      222
);

INSERT INTO city
VALUES(
      7982,
      'Sotik',
      222
);

INSERT INTO country
VALUES(
      223,
      'Kyrgyzstan'
);

INSERT INTO city
VALUES(
      7983,
      'Bishkek',
      223
);

INSERT INTO city
VALUES(
      7984,
      'Kara Balta',
      223
);

INSERT INTO city
VALUES(
      7985,
      'Cholpon Ata',
      223
);

INSERT INTO city
VALUES(
      7986,
      'Tash Komur',
      223
);

INSERT INTO city
VALUES(
      7987,
      'Karakol',
      223
);

INSERT INTO city
VALUES(
      7988,
      'At Bashy',
      223
);

INSERT INTO city
VALUES(
      7989,
      'Naryn',
      223
);

INSERT INTO city
VALUES(
      7990,
      'Jalal Abad',
      223
);

INSERT INTO city
VALUES(
      7991,
      'Kok Yangak',
      223
);

INSERT INTO city
VALUES(
      7992,
      'Toktogul',
      223
);

INSERT INTO city
VALUES(
      7993,
      'Talas',
      223
);

INSERT INTO city
VALUES(
      7994,
      'Osh',
      223
);

INSERT INTO city
VALUES(
      7995,
      'Balykchy',
      223
);

INSERT INTO city
VALUES(
      7996,
      'Tokmak',
      223
);

INSERT INTO city
VALUES(
      7997,
      'Batken',
      223
);

INSERT INTO country
VALUES(
      224,
      'Cambodia'
);

INSERT INTO city
VALUES(
      7998,
      'Phnom Penh',
      224
);

INSERT INTO city
VALUES(
      7999,
      'Ta Khmau',
      224
);

INSERT INTO city
VALUES(
      8000,
      'Sihanoukville',
      224
);

INSERT INTO city
VALUES(
      8001,
      'Pursat',
      224
);

INSERT INTO city
VALUES(
      8002,
      'Prey Veng',
      224
);

INSERT INTO city
VALUES(
      8003,
      'Siem Reap',
      224
);

INSERT INTO city
VALUES(
      8004,
      'Stoeng Treng',
      224
);

INSERT INTO city
VALUES(
      8005,
      'Svay Rieng',
      224
);

INSERT INTO city
VALUES(
      8006,
      'Takeo',
      224
);

INSERT INTO city
VALUES(
      8007,
      'Battambang',
      224
);

INSERT INTO city
VALUES(
      8008,
      'Kampong Cham',
      224
);

INSERT INTO city
VALUES(
      8009,
      'Kompong Chhnang',
      224
);

INSERT INTO city
VALUES(
      8010,
      'Kampong Spoe',
      224
);

INSERT INTO city
VALUES(
      8011,
      'Kampong Thom',
      224
);

INSERT INTO city
VALUES(
      8012,
      'Kampot',
      224
);

INSERT INTO city
VALUES(
      8013,
      'Krong Koh Kong',
      224
);

INSERT INTO city
VALUES(
      8014,
      'Kracheh',
      224
);

INSERT INTO city
VALUES(
      8015,
      'Krong Kep',
      224
);

INSERT INTO city
VALUES(
      8016,
      'Pailin',
      224
);

INSERT INTO city
VALUES(
      8017,
      'Kampong Thum',
      224
);

INSERT INTO city
VALUES(
      8018,
      'Lumphat',
      224
);

INSERT INTO city
VALUES(
      8019,
      'Banlung',
      224
);

INSERT INTO city
VALUES(
      8020,
      'Samraong',
      224
);

INSERT INTO city
VALUES(
      8021,
      'Senmonorom',
      224
);

INSERT INTO city
VALUES(
      8022,
      'Sisophon',
      224
);

INSERT INTO city
VALUES(
      8023,
      'Suong',
      224
);

INSERT INTO city
VALUES(
      8024,
      'Phnum Tbeng Meanchey',
      224
);

INSERT INTO country
VALUES(
      225,
      'Kiribati'
);

INSERT INTO city
VALUES(
      8025,
      'Tarawa',
      225
);

INSERT INTO country
VALUES(
      226,
      'Comoros'
);

INSERT INTO city
VALUES(
      8026,
      'Moroni',
      226
);

INSERT INTO country
VALUES(
      227,
      'Saint Kitts And Nevis'
);

INSERT INTO city
VALUES(
      8027,
      'Basseterre',
      227
);

INSERT INTO country
VALUES(
      228,
      'Kore'
);

INSERT INTO city
VALUES(
      8028,
      'Pyongsan',
      228
);

INSERT INTO city
VALUES(
      8029,
      'Kimhyonggwon',
      228
);

INSERT INTO city
VALUES(
      8030,
      'Chongju',
      228
);

INSERT INTO city
VALUES(
      8031,
      'Ongjin',
      228
);

INSERT INTO city
VALUES(
      8032,
      'Chongjin',
      228
);

INSERT INTO city
VALUES(
      8033,
      'Chosan',
      228
);

INSERT INTO city
VALUES(
      8034,
      'Changyon',
      228
);

INSERT INTO city
VALUES(
      8035,
      'Hamhung',
      228
);

INSERT INTO city
VALUES(
      8036,
      'Sunchon',
      228
);

INSERT INTO city
VALUES(
      8037,
      'Kilchu',
      228
);

INSERT INTO city
VALUES(
      8038,
      'Taedong',
      228
);

INSERT INTO city
VALUES(
      8039,
      'Sariwon',
      228
);

INSERT INTO city
VALUES(
      8040,
      'Payongsong',
      228
);

INSERT INTO city
VALUES(
      8041,
      'Wonsan',
      228
);

INSERT INTO city
VALUES(
      8042,
      'Munchon',
      228
);

INSERT INTO city
VALUES(
      8043,
      'Manpo',
      228
);

INSERT INTO city
VALUES(
      8044,
      'Sinuiju',
      228
);

INSERT INTO city
VALUES(
      8045,
      'Sin-Ni',
      228
);

INSERT INTO city
VALUES(
      8046,
      'Musan',
      228
);

INSERT INTO city
VALUES(
      8047,
      'Kaesong',
      228
);

INSERT INTO city
VALUES(
      8048,
      'Kimchaek',
      228
);

INSERT INTO city
VALUES(
      8049,
      'Hungnam',
      228
);

INSERT INTO city
VALUES(
      8050,
      'Haeju',
      228
);

INSERT INTO city
VALUES(
      8051,
      'Kanggye',
      228
);

INSERT INTO city
VALUES(
      8052,
      'Hyeson',
      228
);

INSERT INTO city
VALUES(
      8053,
      'Rajin',
      228
);

INSERT INTO city
VALUES(
      8054,
      'Sonbong',
      228
);

INSERT INTO city
VALUES(
      8055,
      'Pyongyang',
      228
);

INSERT INTO city
VALUES(
      8056,
      'Nampo',
      228
);

INSERT INTO city
VALUES(
      8057,
      'Gyeongju',
      228
);

INSERT INTO city
VALUES(
      8058,
      'Iksan',
      228
);

INSERT INTO city
VALUES(
      8059,
      'Songnam',
      228
);

INSERT INTO city
VALUES(
      8060,
      'Ulsan',
      228
);

INSERT INTO city
VALUES(
      8061,
      'Wonju',
      228
);

INSERT INTO city
VALUES(
      8062,
      'Seoul',
      228
);

INSERT INTO city
VALUES(
      8063,
      'Ansan',
      228
);

INSERT INTO city
VALUES(
      8064,
      'Gunsan',
      228
);

INSERT INTO city
VALUES(
      8065,
      'Jeju',
      228
);

INSERT INTO city
VALUES(
      8066,
      'Busan',
      228
);

INSERT INTO city
VALUES(
      8067,
      'Incheon',
      228
);

INSERT INTO city
VALUES(
      8068,
      'Daegu',
      228
);

INSERT INTO city
VALUES(
      8069,
      'Gwangju',
      228
);

INSERT INTO city
VALUES(
      8070,
      'Daejeon',
      228
);

INSERT INTO city
VALUES(
      8071,
      'Changwon',
      228
);

INSERT INTO city
VALUES(
      8072,
      'Sokcho',
      228
);

INSERT INTO city
VALUES(
      8073,
      'Eumseong',
      228
);

INSERT INTO city
VALUES(
      8074,
      'Chuncheon',
      228
);

INSERT INTO city
VALUES(
      8075,
      'Goyang',
      228
);

INSERT INTO city
VALUES(
      8076,
      'Pohang',
      228
);

INSERT INTO city
VALUES(
      8077,
      'Puchaon',
      228
);

INSERT INTO city
VALUES(
      8078,
      'Cheongju',
      228
);

INSERT INTO city
VALUES(
      8079,
      'Mokpo',
      228
);

INSERT INTO city
VALUES(
      8080,
      'Yeosu',
      228
);

INSERT INTO city
VALUES(
      8081,
      'Hongseong',
      228
);

INSERT INTO city
VALUES(
      8082,
      'Muan',
      228
);

INSERT INTO city
VALUES(
      8083,
      'Andong',
      228
);

INSERT INTO city
VALUES(
      8084,
      'Suwon',
      228
);

INSERT INTO city
VALUES(
      8085,
      'Sejong',
      228
);

INSERT INTO city
VALUES(
      8086,
      'Gangneung',
      228
);

INSERT INTO city
VALUES(
      8087,
      'Jeonju',
      228
);

INSERT INTO country
VALUES(
      229,
      'Kuwait'
);

INSERT INTO city
VALUES(
      8088,
      'Al Ahmadi',
      229
);

INSERT INTO city
VALUES(
      8089,
      'Al Jahra',
      229
);

INSERT INTO city
VALUES(
      8090,
      'Kuwait',
      229
);

INSERT INTO country
VALUES(
      230,
      'Cayman Islands'
);

INSERT INTO city
VALUES(
      8091,
      'George Town',
      230
);

INSERT INTO country
VALUES(
      231,
      'American Samoa'
);

INSERT INTO city
VALUES(
      8092,
      'Pago Pago',
      231
);

INSERT INTO country
VALUES(
      232,
      'Guam'
);

INSERT INTO city
VALUES(
      8093,
      'Hagta',
      232
);

INSERT INTO city
VALUES(
      8094,
      'Maina',
      232
);

INSERT INTO country
VALUES(
      233,
      'Northern Mariana Islands'
);

INSERT INTO city
VALUES(
      8095,
      'Capitol Hill',
      233
);

INSERT INTO country
VALUES(
      234,
      'United States'
);

INSERT INTO city
VALUES(
      8096,
      'Renton',
      234
);

INSERT INTO city
VALUES(
      8097,
      'Chehalis',
      234
);

INSERT INTO city
VALUES(
      8098,
      'Mercer Island',
      234
);

INSERT INTO city
VALUES(
      8099,
      'Lynnwood',
      234
);

INSERT INTO city
VALUES(
      8100,
      'Centralia',
      234
);

INSERT INTO city
VALUES(
      8101,
      'Mountlake Terrace',
      234
);

INSERT INTO city
VALUES(
      8102,
      'Seattle',
      234
);

INSERT INTO city
VALUES(
      8103,
      'Liberty Lake',
      234
);

INSERT INTO city
VALUES(
      8104,
      'Airway Heights',
      234
);

INSERT INTO city
VALUES(
      8105,
      'Brier',
      234
);

INSERT INTO city
VALUES(
      8106,
      'Port Townsend',
      234
);

INSERT INTO city
VALUES(
      8107,
      'Oak Harbor',
      234
);

INSERT INTO city
VALUES(
      8108,
      'Anacortes',
      234
);

INSERT INTO city
VALUES(
      8109,
      'Grandview',
      234
);

INSERT INTO city
VALUES(
      8110,
      'Quincy',
      234
);

INSERT INTO city
VALUES(
      8111,
      'Kelso',
      234
);

INSERT INTO city
VALUES(
      8112,
      'Cheney',
      234
);

INSERT INTO city
VALUES(
      8113,
      'Lacey',
      234
);

INSERT INTO city
VALUES(
      8114,
      'Sultan',
      234
);

INSERT INTO city
VALUES(
      8115,
      'Edmonds',
      234
);

INSERT INTO city
VALUES(
      8116,
      'Lake Forest Park',
      234
);

INSERT INTO city
VALUES(
      8117,
      'Yakima',
      234
);

INSERT INTO city
VALUES(
      8118,
      'Pacific',
      234
);

INSERT INTO city
VALUES(
      8119,
      'Lynden',
      234
);

INSERT INTO city
VALUES(
      8120,
      'Federal Way',
      234
);

INSERT INTO city
VALUES(
      8121,
      'Mill Creek',
      234
);

INSERT INTO city
VALUES(
      8122,
      'Lakewood',
      234
);

INSERT INTO city
VALUES(
      8123,
      'Port Angeles',
      234
);

INSERT INTO city
VALUES(
      8124,
      'Longview',
      234
);

INSERT INTO city
VALUES(
      8125,
      'Wapato',
      234
);

INSERT INTO city
VALUES(
      8126,
      'Arlington',
      234
);

INSERT INTO city
VALUES(
      8127,
      'Sammamish',
      234
);

INSERT INTO city
VALUES(
      8128,
      'Covington',
      234
);

INSERT INTO city
VALUES(
      8129,
      'Wenatchee',
      234
);

INSERT INTO city
VALUES(
      8130,
      'Mattawa',
      234
);

INSERT INTO city
VALUES(
      8131,
      'Selah',
      234
);

INSERT INTO city
VALUES(
      8132,
      'Omak',
      234
);

INSERT INTO city
VALUES(
      8133,
      'Sedro-Woolley',
      234
);

INSERT INTO city
VALUES(
      8134,
      'Sunnyside',
      234
);

INSERT INTO city
VALUES(
      8135,
      'Normandy Park',
      234
);

INSERT INTO city
VALUES(
      8136,
      'SeaTac',
      234
);

INSERT INTO city
VALUES(
      8137,
      'Steilacoom',
      234
);

INSERT INTO city
VALUES(
      8138,
      'Ridgefield',
      234
);

INSERT INTO city
VALUES(
      8139,
      'Kennewick',
      234
);

INSERT INTO city
VALUES(
      8140,
      'Pullman',
      234
);

INSERT INTO city
VALUES(
      8141,
      'West Richland',
      234
);

INSERT INTO city
VALUES(
      8142,
      'Colville',
      234
);

INSERT INTO city
VALUES(
      8143,
      'Prosser',
      234
);

INSERT INTO city
VALUES(
      8144,
      'Maple Valley',
      234
);

INSERT INTO city
VALUES(
      8145,
      'Auburn',
      234
);

INSERT INTO city
VALUES(
      8146,
      'Connell',
      234
);

INSERT INTO city
VALUES(
      8147,
      'Bainbridge Island',
      234
);

INSERT INTO city
VALUES(
      8148,
      'Edgewood',
      234
);

INSERT INTO city
VALUES(
      8149,
      'Burlington',
      234
);

INSERT INTO city
VALUES(
      8150,
      'Othello',
      234
);

INSERT INTO city
VALUES(
      8151,
      'University Place',
      234
);

INSERT INTO city
VALUES(
      8152,
      'Poulsbo',
      234
);

INSERT INTO city
VALUES(
      8153,
      'Hoquiam',
      234
);

INSERT INTO city
VALUES(
      8154,
      'Ephrata',
      234
);

INSERT INTO city
VALUES(
      8155,
      'Kent',
      234
);

INSERT INTO city
VALUES(
      8156,
      'Mukilteo',
      234
);

INSERT INTO city
VALUES(
      8157,
      'Kirkland',
      234
);

INSERT INTO city
VALUES(
      8158,
      'Redmond',
      234
);

INSERT INTO city
VALUES(
      8159,
      'Tukwila',
      234
);

INSERT INTO city
VALUES(
      8160,
      'Yelm',
      234
);

INSERT INTO city
VALUES(
      8161,
      'Olympia',
      234
);

INSERT INTO city
VALUES(
      8162,
      'Fife',
      234
);

INSERT INTO city
VALUES(
      8163,
      'Port Orchard',
      234
);

INSERT INTO city
VALUES(
      8164,
      'Bremerton',
      234
);

INSERT INTO city
VALUES(
      8165,
      'Lake Stevens',
      234
);

INSERT INTO city
VALUES(
      8166,
      'Montesano',
      234
);

INSERT INTO city
VALUES(
      8167,
      'Tacoma',
      234
);

INSERT INTO city
VALUES(
      8168,
      'Woodinville',
      234
);

INSERT INTO city
VALUES(
      8169,
      'Ocean Shores',
      234
);

INSERT INTO city
VALUES(
      8170,
      'Sequim',
      234
);

INSERT INTO city
VALUES(
      8171,
      'Moses Lake',
      234
);

INSERT INTO city
VALUES(
      8172,
      'Puyallup',
      234
);

INSERT INTO city
VALUES(
      8173,
      'Sumner',
      234
);

INSERT INTO city
VALUES(
      8174,
      'Walla Walla',
      234
);

INSERT INTO city
VALUES(
      8175,
      'Bothell',
      234
);

INSERT INTO city
VALUES(
      8176,
      'Tumwater',
      234
);

INSERT INTO city
VALUES(
      8177,
      'Duvall',
      234
);

INSERT INTO city
VALUES(
      8178,
      'Monroe',
      234
);

INSERT INTO city
VALUES(
      8179,
      'Clarkston',
      234
);

INSERT INTO city
VALUES(
      8180,
      'Gig Harbor',
      234
);

INSERT INTO city
VALUES(
      8181,
      'Des Moines',
      234
);

INSERT INTO city
VALUES(
      8182,
      'Snohomish',
      234
);

INSERT INTO city
VALUES(
      8183,
      'Richland',
      234
);

INSERT INTO city
VALUES(
      8184,
      'Woodland',
      234
);

INSERT INTO city
VALUES(
      8185,
      'Washougal',
      234
);

INSERT INTO city
VALUES(
      8186,
      'Bonney Lake',
      234
);

INSERT INTO city
VALUES(
      8187,
      'Spokane Valley',
      234
);

INSERT INTO city
VALUES(
      8188,
      'Bellevue',
      234
);

INSERT INTO city
VALUES(
      8189,
      'Marysville',
      234
);

INSERT INTO city
VALUES(
      8190,
      'Newcastle',
      234
);

INSERT INTO city
VALUES(
      8191,
      'North Bend',
      234
);

INSERT INTO city
VALUES(
      8192,
      'Snoqualmie',
      234
);

INSERT INTO city
VALUES(
      8193,
      'Enumclaw',
      234
);

INSERT INTO city
VALUES(
      8194,
      'Shelton',
      234
);

INSERT INTO city
VALUES(
      8195,
      'Bellingham',
      234
);

INSERT INTO city
VALUES(
      8196,
      'Kenmore',
      234
);

INSERT INTO city
VALUES(
      8197,
      'Ellensburg',
      234
);

INSERT INTO city
VALUES(
      8198,
      'DuPont',
      234
);

INSERT INTO city
VALUES(
      8199,
      'Granite Falls',
      234
);

INSERT INTO city
VALUES(
      8200,
      'Milton',
      234
);

INSERT INTO city
VALUES(
      8201,
      'Stanwood',
      234
);

INSERT INTO city
VALUES(
      8202,
      'East Wenatchee',
      234
);

INSERT INTO city
VALUES(
      8203,
      'Spokane',
      234
);

INSERT INTO city
VALUES(
      8204,
      'Chelan',
      234
);

INSERT INTO city
VALUES(
      8205,
      'Camas',
      234
);

INSERT INTO city
VALUES(
      8206,
      'Blaine',
      234
);

INSERT INTO city
VALUES(
      8207,
      'Union Gap',
      234
);

INSERT INTO city
VALUES(
      8208,
      'Pasco',
      234
);

INSERT INTO city
VALUES(
      8209,
      'Issaquah',
      234
);

INSERT INTO city
VALUES(
      8210,
      'Toppenish',
      234
);

INSERT INTO city
VALUES(
      8211,
      'Orting',
      234
);

INSERT INTO city
VALUES(
      8212,
      'Fircrest',
      234
);

INSERT INTO city
VALUES(
      8213,
      'Vancouver',
      234
);

INSERT INTO city
VALUES(
      8214,
      'Battle Ground',
      234
);

INSERT INTO city
VALUES(
      8215,
      'College Place',
      234
);

INSERT INTO city
VALUES(
      8216,
      'Mount Vernon',
      234
);

INSERT INTO city
VALUES(
      8217,
      'Ferndale',
      234
);

INSERT INTO city
VALUES(
      8218,
      'Aberdeen',
      234
);

INSERT INTO city
VALUES(
      8219,
      'Shoreline',
      234
);

INSERT INTO city
VALUES(
      8220,
      'Everett',
      234
);

INSERT INTO city
VALUES(
      8221,
      'Burien',
      234
);

INSERT INTO city
VALUES(
      8222,
      'Manassas Park',
      234
);

INSERT INTO city
VALUES(
      8223,
      'Fairfax',
      234
);

INSERT INTO city
VALUES(
      8224,
      'Big Stone Gap',
      234
);

INSERT INTO city
VALUES(
      8225,
      'Waynesboro',
      234
);

INSERT INTO city
VALUES(
      8226,
      'Lexington',
      234
);

INSERT INTO city
VALUES(
      8227,
      'Winchester',
      234
);

INSERT INTO city
VALUES(
      8228,
      'Orange',
      234
);

INSERT INTO city
VALUES(
      8229,
      'Strasburg',
      234
);

INSERT INTO city
VALUES(
      8230,
      'Radford',
      234
);

INSERT INTO city
VALUES(
      8231,
      'Richmond',
      234
);

INSERT INTO city
VALUES(
      8232,
      'Virginia Beach',
      234
);

INSERT INTO city
VALUES(
      8233,
      'Herndon',
      234
);

INSERT INTO city
VALUES(
      8234,
      'Chesapeake',
      234
);

INSERT INTO city
VALUES(
      8235,
      'Purcellville',
      234
);

INSERT INTO city
VALUES(
      8236,
      'Covington',
      234
);

INSERT INTO city
VALUES(
      8237,
      'Charlottesville',
      234
);

INSERT INTO city
VALUES(
      8238,
      'Smithfield',
      234
);

INSERT INTO city
VALUES(
      8239,
      'Norfolk',
      234
);

INSERT INTO city
VALUES(
      8240,
      'Dumfries',
      234
);

INSERT INTO city
VALUES(
      8241,
      'Petersburg',
      234
);

INSERT INTO city
VALUES(
      8242,
      'Falls Church',
      234
);

INSERT INTO city
VALUES(
      8243,
      'Rocky Mount',
      234
);

INSERT INTO city
VALUES(
      8244,
      'Galax',
      234
);

INSERT INTO city
VALUES(
      8245,
      'Farmville',
      234
);

INSERT INTO city
VALUES(
      8246,
      'Martinsville',
      234
);

INSERT INTO city
VALUES(
      8247,
      'Danville',
      234
);

INSERT INTO city
VALUES(
      8248,
      'Manassas',
      234
);

INSERT INTO city
VALUES(
      8249,
      'Suffolk',
      234
);

INSERT INTO city
VALUES(
      8250,
      'Harrisonburg',
      234
);

INSERT INTO city
VALUES(
      8251,
      'Fredericksburg',
      234
);

INSERT INTO city
VALUES(
      8252,
      'Warrenton',
      234
);

INSERT INTO city
VALUES(
      8253,
      'Marion',
      234
);

INSERT INTO city
VALUES(
      8254,
      'Broadway',
      234
);

INSERT INTO city
VALUES(
      8255,
      'Bridgewater',
      234
);

INSERT INTO city
VALUES(
      8256,
      'Culpeper',
      234
);

INSERT INTO city
VALUES(
      8257,
      'Vinton',
      234
);

INSERT INTO city
VALUES(
      8258,
      'Blacksburg',
      234
);

INSERT INTO city
VALUES(
      8259,
      'Portsmouth',
      234
);

INSERT INTO city
VALUES(
      8260,
      'Newport News',
      234
);

INSERT INTO city
VALUES(
      8261,
      'Salem',
      234
);

INSERT INTO city
VALUES(
      8262,
      'Leesburg',
      234
);

INSERT INTO city
VALUES(
      8263,
      'Pulaski',
      234
);

INSERT INTO city
VALUES(
      8264,
      'Staunton',
      234
);

INSERT INTO city
VALUES(
      8265,
      'Wytheville',
      234
);

INSERT INTO city
VALUES(
      8266,
      'Bristol',
      234
);

INSERT INTO city
VALUES(
      8267,
      'Ashland',
      234
);

INSERT INTO city
VALUES(
      8268,
      'Hampton',
      234
);

INSERT INTO city
VALUES(
      8269,
      'Roanoke',
      234
);

INSERT INTO city
VALUES(
      8270,
      'Williamsburg',
      234
);

INSERT INTO city
VALUES(
      8271,
      'Front Royal',
      234
);

INSERT INTO city
VALUES(
      8272,
      'Alexandria',
      234
);

INSERT INTO city
VALUES(
      8273,
      'Norton',
      234
);

INSERT INTO city
VALUES(
      8274,
      'Vienna',
      234
);

INSERT INTO city
VALUES(
      8275,
      'Lynchburg',
      234
);

INSERT INTO city
VALUES(
      8276,
      'Emporia',
      234
);

INSERT INTO city
VALUES(
      8277,
      'Woodstock',
      234
);

INSERT INTO city
VALUES(
      8278,
      'Richlands',
      234
);

INSERT INTO city
VALUES(
      8279,
      'Poquoson',
      234
);

INSERT INTO city
VALUES(
      8280,
      'Bedford',
      234
);

INSERT INTO city
VALUES(
      8281,
      'Abingdon',
      234
);

INSERT INTO city
VALUES(
      8282,
      'Franklin',
      234
);

INSERT INTO city
VALUES(
      8283,
      'Hopewell',
      234
);

INSERT INTO city
VALUES(
      8284,
      'Buena Vista',
      234
);

INSERT INTO city
VALUES(
      8285,
      'South Boston',
      234
);

INSERT INTO city
VALUES(
      8286,
      'Christiansburg',
      234
);

INSERT INTO city
VALUES(
      8287,
      'Colonial Heights',
      234
);

INSERT INTO city
VALUES(
      8288,
      'Newark',
      234
);

INSERT INTO city
VALUES(
      8289,
      'Milford',
      234
);

INSERT INTO city
VALUES(
      8290,
      'Middletown',
      234
);

INSERT INTO city
VALUES(
      8291,
      'Millsboro',
      234
);

INSERT INTO city
VALUES(
      8292,
      'Seaford',
      234
);

INSERT INTO city
VALUES(
      8293,
      'Lewes',
      234
);

INSERT INTO city
VALUES(
      8294,
      'Elsmere',
      234
);

INSERT INTO city
VALUES(
      8295,
      'Georgetown',
      234
);

INSERT INTO city
VALUES(
      8296,
      'Wilmington',
      234
);

INSERT INTO city
VALUES(
      8297,
      'Ocean View',
      234
);

INSERT INTO city
VALUES(
      8298,
      'Dover',
      234
);

INSERT INTO city
VALUES(
      8299,
      'New Castle',
      234
);

INSERT INTO city
VALUES(
      8300,
      'Smyrna',
      234
);

INSERT INTO city
VALUES(
      8301,
      'Washington',
      234
);

INSERT INTO city
VALUES(
      8302,
      'Kaukauna',
      234
);

INSERT INTO city
VALUES(
      8303,
      'Oconomowoc',
      234
);

INSERT INTO city
VALUES(
      8304,
      'Verona',
      234
);

INSERT INTO city
VALUES(
      8305,
      'Platteville',
      234
);

INSERT INTO city
VALUES(
      8306,
      'Rice Lake',
      234
);

INSERT INTO city
VALUES(
      8307,
      'North Fond du Lac',
      234
);

INSERT INTO city
VALUES(
      8308,
      'Windsor',
      234
);

INSERT INTO city
VALUES(
      8309,
      'Howard',
      234
);

INSERT INTO city
VALUES(
      8310,
      'Burlington',
      234
);

INSERT INTO city
VALUES(
      8311,
      'Chippewa Falls',
      234
);

INSERT INTO city
VALUES(
      8312,
      'Waupaca',
      234
);

INSERT INTO city
VALUES(
      8313,
      'Lake Geneva',
      234
);

INSERT INTO city
VALUES(
      8314,
      'Fitchburg',
      234
);

INSERT INTO city
VALUES(
      8315,
      'Merrill',
      234
);

INSERT INTO city
VALUES(
      8316,
      'Monona',
      234
);

INSERT INTO city
VALUES(
      8317,
      'Beaver Dam',
      234
);

INSERT INTO city
VALUES(
      8318,
      'Little Chute',
      234
);

INSERT INTO city
VALUES(
      8319,
      'Baldwin',
      234
);

INSERT INTO city
VALUES(
      8320,
      'Mount Pleasant',
      234
);

INSERT INTO city
VALUES(
      8321,
      'Shorewood',
      234
);

INSERT INTO city
VALUES(
      8322,
      'Columbus',
      234
);

INSERT INTO city
VALUES(
      8323,
      'Fox Crossing',
      234
);

INSERT INTO city
VALUES(
      8324,
      'Beloit',
      234
);

INSERT INTO city
VALUES(
      8325,
      'Greenfield',
      234
);

INSERT INTO city
VALUES(
      8326,
      'Greendale',
      234
);

INSERT INTO city
VALUES(
      8327,
      'Suamico',
      234
);

INSERT INTO city
VALUES(
      8328,
      'Pewaukee',
      234
);

INSERT INTO city
VALUES(
      8329,
      'Fond du Lac',
      234
);

INSERT INTO city
VALUES(
      8330,
      'Hartland',
      234
);

INSERT INTO city
VALUES(
      8331,
      'Edgerton',
      234
);

INSERT INTO city
VALUES(
      8332,
      'Hartford',
      234
);

INSERT INTO city
VALUES(
      8333,
      'Elkhorn',
      234
);

INSERT INTO city
VALUES(
      8334,
      'Rhinelander',
      234
);

INSERT INTO city
VALUES(
      8335,
      'Baraboo',
      234
);

INSERT INTO city
VALUES(
      8336,
      'Plover',
      234
);

INSERT INTO city
VALUES(
      8337,
      'Janesville',
      234
);

INSERT INTO city
VALUES(
      8338,
      'Twin Lakes',
      234
);

INSERT INTO city
VALUES(
      8339,
      'Marinette',
      234
);

INSERT INTO city
VALUES(
      8340,
      'Pleasant Prairie',
      234
);

INSERT INTO city
VALUES(
      8341,
      'Muskego',
      234
);

INSERT INTO city
VALUES(
      8342,
      'Manitowoc',
      234
);

INSERT INTO city
VALUES(
      8343,
      'Kronenwetter',
      234
);

INSERT INTO city
VALUES(
      8344,
      'Lake Hallie',
      234
);

INSERT INTO city
VALUES(
      8345,
      'Kenosha',
      234
);

INSERT INTO city
VALUES(
      8346,
      'Slinger',
      234
);

INSERT INTO city
VALUES(
      8347,
      'Jefferson',
      234
);

INSERT INTO city
VALUES(
      8348,
      'Hales Corners',
      234
);

INSERT INTO city
VALUES(
      8349,
      'Sussex',
      234
);

INSERT INTO city
VALUES(
      8350,
      'Union Grove',
      234
);

INSERT INTO city
VALUES(
      8351,
      'Mukwonago',
      234
);

INSERT INTO city
VALUES(
      8352,
      'Watertown',
      234
);

INSERT INTO city
VALUES(
      8353,
      'Ripon',
      234
);

INSERT INTO city
VALUES(
      8354,
      'Onalaska',
      234
);

INSERT INTO city
VALUES(
      8355,
      'Middleton',
      234
);

INSERT INTO city
VALUES(
      8356,
      'Ashland',
      234
);

INSERT INTO city
VALUES(
      8357,
      'Waterford',
      234
);

INSERT INTO city
VALUES(
      8358,
      'Delavan',
      234
);

INSERT INTO city
VALUES(
      8359,
      'Sparta',
      234
);

INSERT INTO city
VALUES(
      8360,
      'De Forest',
      234
);

INSERT INTO city
VALUES(
      8361,
      'La Crosse',
      234
);

INSERT INTO city
VALUES(
      8362,
      'Hobart',
      234
);

INSERT INTO city
VALUES(
      8363,
      'Whitewater',
      234
);

INSERT INTO city
VALUES(
      8364,
      'Stevens Point',
      234
);

INSERT INTO city
VALUES(
      8365,
      'Prairie du Chien',
      234
);

INSERT INTO city
VALUES(
      8366,
      'Kimberly',
      234
);

INSERT INTO city
VALUES(
      8367,
      'Sun Prairie',
      234
);

INSERT INTO city
VALUES(
      8368,
      'Prairie du Sac',
      234
);

INSERT INTO city
VALUES(
      8369,
      'Oshkosh',
      234
);

INSERT INTO city
VALUES(
      8370,
      'Evansville',
      234
);

INSERT INTO city
VALUES(
      8371,
      'Marshfield',
      234
);

INSERT INTO city
VALUES(
      8372,
      'Grafton',
      234
);

INSERT INTO city
VALUES(
      8373,
      'Cudahy',
      234
);

INSERT INTO city
VALUES(
      8374,
      'Sheboygan',
      234
);

INSERT INTO city
VALUES(
      8375,
      'Caledonia',
      234
);

INSERT INTO city
VALUES(
      8376,
      'Menomonee Falls',
      234
);

INSERT INTO city
VALUES(
      8377,
      'Rothschild',
      234
);

INSERT INTO city
VALUES(
      8378,
      'Weston',
      234
);

INSERT INTO city
VALUES(
      8379,
      'Germantown',
      234
);

INSERT INTO city
VALUES(
      8380,
      'Menominee',
      234
);

INSERT INTO city
VALUES(
      8381,
      'New London',
      234
);

INSERT INTO city
VALUES(
      8382,
      'Reedsburg',
      234
);

INSERT INTO city
VALUES(
      8383,
      'Port Washington',
      234
);

INSERT INTO city
VALUES(
      8384,
      'Kiel',
      234
);

INSERT INTO city
VALUES(
      8385,
      'Mount Horeb',
      234
);

INSERT INTO city
VALUES(
      8386,
      'South Milwaukee',
      234
);

INSERT INTO city
VALUES(
      8387,
      'Elm Grove',
      234
);

INSERT INTO city
VALUES(
      8388,
      'Jackson',
      234
);

INSERT INTO city
VALUES(
      8389,
      'Appleton',
      234
);

INSERT INTO city
VALUES(
      8390,
      'Oregon',
      234
);

INSERT INTO city
VALUES(
      8391,
      'Brookfield',
      234
);

INSERT INTO city
VALUES(
      8392,
      'West Salem',
      234
);

INSERT INTO city
VALUES(
      8393,
      'Cottage Grove',
      234
);

INSERT INTO city
VALUES(
      8394,
      'Saint Francis',
      234
);

INSERT INTO city
VALUES(
      8395,
      'Sheboygan Falls',
      234
);

INSERT INTO city
VALUES(
      8396,
      'Lake Delton',
      234
);

INSERT INTO city
VALUES(
      8397,
      'De Pere',
      234
);

INSERT INTO city
VALUES(
      8398,
      'Stoughton',
      234
);

INSERT INTO city
VALUES(
      8399,
      'West Allis',
      234
);

INSERT INTO city
VALUES(
      8400,
      'Tomah',
      234
);

INSERT INTO city
VALUES(
      8401,
      'Altoona',
      234
);

INSERT INTO city
VALUES(
      8402,
      'Harrison',
      234
);

INSERT INTO city
VALUES(
      8403,
      'Holmen',
      234
);

INSERT INTO city
VALUES(
      8404,
      'Allouez',
      234
);

INSERT INTO city
VALUES(
      8405,
      'Fox Point',
      234
);

INSERT INTO city
VALUES(
      8406,
      'West Bend',
      234
);

INSERT INTO city
VALUES(
      8407,
      'Waukesha',
      234
);

INSERT INTO city
VALUES(
      8408,
      'Bristol',
      234
);

INSERT INTO city
VALUES(
      8409,
      'Glendale',
      234
);

INSERT INTO city
VALUES(
      8410,
      'Monroe',
      234
);

INSERT INTO city
VALUES(
      8411,
      'Two Rivers',
      234
);

INSERT INTO city
VALUES(
      8412,
      'Wisconsin Rapids',
      234
);

INSERT INTO city
VALUES(
      8413,
      'Milwaukee',
      234
);

INSERT INTO city
VALUES(
      8414,
      'Antigo',
      234
);

INSERT INTO city
VALUES(
      8415,
      'Bellevue',
      234
);

INSERT INTO city
VALUES(
      8416,
      'Mequon',
      234
);

INSERT INTO city
VALUES(
      8417,
      'Fort Atkinson',
      234
);

INSERT INTO city
VALUES(
      8418,
      'Black River Falls',
      234
);

INSERT INTO city
VALUES(
      8419,
      'Menasha',
      234
);

INSERT INTO city
VALUES(
      8420,
      'Sturgeon Bay',
      234
);

INSERT INTO city
VALUES(
      8421,
      'Whitefish Bay',
      234
);

INSERT INTO city
VALUES(
      8422,
      'Waunakee',
      234
);

INSERT INTO city
VALUES(
      8423,
      'Madison',
      234
);

INSERT INTO city
VALUES(
      8424,
      'Oak Creek',
      234
);

INSERT INTO city
VALUES(
      8425,
      'Wausau',
      234
);

INSERT INTO city
VALUES(
      8426,
      'Shawano',
      234
);

INSERT INTO city
VALUES(
      8427,
      'Ashwaubenon',
      234
);

INSERT INTO city
VALUES(
      8428,
      'Brown Deer',
      234
);

INSERT INTO city
VALUES(
      8429,
      'Racine',
      234
);

INSERT INTO city
VALUES(
      8430,
      'Richfield',
      234
);

INSERT INTO city
VALUES(
      8431,
      'Waupun',
      234
);

INSERT INTO city
VALUES(
      8432,
      'Lake Mills',
      234
);

INSERT INTO city
VALUES(
      8433,
      'McFarland',
      234
);

INSERT INTO city
VALUES(
      8434,
      'Superior',
      234
);

INSERT INTO city
VALUES(
      8435,
      'Green Bay',
      234
);

INSERT INTO city
VALUES(
      8436,
      'Franklin',
      234
);

INSERT INTO city
VALUES(
      8437,
      'Delafield',
      234
);

INSERT INTO city
VALUES(
      8438,
      'New Richmond',
      234
);

INSERT INTO city
VALUES(
      8439,
      'Portage',
      234
);

INSERT INTO city
VALUES(
      8440,
      'Hudson',
      234
);

INSERT INTO city
VALUES(
      8441,
      'Wauwatosa',
      234
);

INSERT INTO city
VALUES(
      8442,
      'Neenah',
      234
);

INSERT INTO city
VALUES(
      8443,
      'Somers',
      234
);

INSERT INTO city
VALUES(
      8444,
      'River Falls',
      234
);

INSERT INTO city
VALUES(
      8445,
      'Milton',
      234
);

INSERT INTO city
VALUES(
      8446,
      'Sturtevant',
      234
);

INSERT INTO city
VALUES(
      8447,
      'Plymouth',
      234
);

INSERT INTO city
VALUES(
      8448,
      'Eau Claire',
      234
);

INSERT INTO city
VALUES(
      8449,
      'New Berlin',
      234
);

INSERT INTO city
VALUES(
      8450,
      'Cedarburg',
      234
);

INSERT INTO city
VALUES(
      8451,
      'South Charleston',
      234
);

INSERT INTO city
VALUES(
      8452,
      'Buckhannon',
      234
);

INSERT INTO city
VALUES(
      8453,
      'Point Pleasant',
      234
);

INSERT INTO city
VALUES(
      8454,
      'Clarksburg',
      234
);

INSERT INTO city
VALUES(
      8455,
      'Wheeling',
      234
);

INSERT INTO city
VALUES(
      8456,
      'Hurricane',
      234
);

INSERT INTO city
VALUES(
      8457,
      'Martinsburg',
      234
);

INSERT INTO city
VALUES(
      8458,
      'Fairmont',
      234
);

INSERT INTO city
VALUES(
      8459,
      'Logan',
      234
);

INSERT INTO city
VALUES(
      8460,
      'Dunbar',
      234
);

INSERT INTO city
VALUES(
      8461,
      'Beckley',
      234
);

INSERT INTO city
VALUES(
      8462,
      'Saint Albans',
      234
);

INSERT INTO city
VALUES(
      8463,
      'Huntington',
      234
);

INSERT INTO city
VALUES(
      8464,
      'Charleston',
      234
);

INSERT INTO city
VALUES(
      8465,
      'Grafton',
      234
);

INSERT INTO city
VALUES(
      8466,
      'Morgantown',
      234
);

INSERT INTO city
VALUES(
      8467,
      'Parkersburg',
      234
);

INSERT INTO city
VALUES(
      8468,
      'Keyser',
      234
);

INSERT INTO city
VALUES(
      8469,
      'Lewisburg',
      234
);

INSERT INTO city
VALUES(
      8470,
      'Bridgeport',
      234
);

INSERT INTO city
VALUES(
      8471,
      'Ranson',
      234
);

INSERT INTO city
VALUES(
      8472,
      'New Martinsville',
      234
);

INSERT INTO city
VALUES(
      8473,
      'Weirton',
      234
);

INSERT INTO city
VALUES(
      8474,
      'Princeton',
      234
);

INSERT INTO city
VALUES(
      8475,
      'Bluefield',
      234
);

INSERT INTO city
VALUES(
      8476,
      'Oak Hill',
      234
);

INSERT INTO city
VALUES(
      8477,
      'Elkins',
      234
);

INSERT INTO city
VALUES(
      8478,
      'Moundsville',
      234
);

INSERT INTO city
VALUES(
      8479,
      'Charles Town',
      234
);

INSERT INTO city
VALUES(
      8480,
      'Nitro',
      234
);

INSERT INTO city
VALUES(
      8481,
      'Shepherdstown',
      234
);

INSERT INTO city
VALUES(
      8482,
      'Vienna',
      234
);

INSERT INTO city
VALUES(
      8483,
      'Honolulu',
      234
);

INSERT INTO city
VALUES(
      8484,
      'Tequesta',
      234
);

INSERT INTO city
VALUES(
      8485,
      'North Palm Beach',
      234
);

INSERT INTO city
VALUES(
      8486,
      'Keystone Heights',
      234
);

INSERT INTO city
VALUES(
      8487,
      'Miami Springs',
      234
);

INSERT INTO city
VALUES(
      8488,
      'Bradenton',
      234
);

INSERT INTO city
VALUES(
      8489,
      'Lakeland',
      234
);

INSERT INTO city
VALUES(
      8490,
      'Winter Springs',
      234
);

INSERT INTO city
VALUES(
      8491,
      'Mascotte',
      234
);

INSERT INTO city
VALUES(
      8492,
      'Miami Lakes',
      234
);

INSERT INTO city
VALUES(
      8493,
      'Estero',
      234
);

INSERT INTO city
VALUES(
      8494,
      'Ocala',
      234
);

INSERT INTO city
VALUES(
      8495,
      'Ormond Beach',
      234
);

INSERT INTO city
VALUES(
      8496,
      'Dade City',
      234
);

INSERT INTO city
VALUES(
      8497,
      'Lake Placid',
      234
);

INSERT INTO city
VALUES(
      8498,
      'Brooksville',
      234
);

INSERT INTO city
VALUES(
      8499,
      'Daytona Beach',
      234
);

INSERT INTO city
VALUES(
      8500,
      'Pinellas Park',
      234
);

INSERT INTO city
VALUES(
      8501,
      'Wildwood',
      234
);

INSERT INTO city
VALUES(
      8502,
      'Edgewater',
      234
);

INSERT INTO city
VALUES(
      8503,
      'Key Biscayne',
      234
);

INSERT INTO city
VALUES(
      8504,
      'Winter Haven',
      234
);

INSERT INTO city
VALUES(
      8505,
      'Pembroke Pines',
      234
);

INSERT INTO city
VALUES(
      8506,
      'Lighthouse Point',
      234
);

INSERT INTO city
VALUES(
      8507,
      'Seminole',
      234
);

INSERT INTO city
VALUES(
      8508,
      'New Port Richey',
      234
);

INSERT INTO city
VALUES(
      8509,
      'Lake City',
      234
);

INSERT INTO city
VALUES(
      8510,
      'Port Saint Lucie',
      234
);

INSERT INTO city
VALUES(
      8511,
      'Quincy',
      234
);

INSERT INTO city
VALUES(
      8512,
      'Venice',
      234
);

INSERT INTO city
VALUES(
      8513,
      'Clearwater',
      234
);

INSERT INTO city
VALUES(
      8514,
      'Lady Lake',
      234
);

INSERT INTO city
VALUES(
      8515,
      'Panama City',
      234
);

INSERT INTO city
VALUES(
      8516,
      'South Bay',
      234
);

INSERT INTO city
VALUES(
      8517,
      'Sarasota',
      234
);

INSERT INTO city
VALUES(
      8518,
      'South Miami',
      234
);

INSERT INTO city
VALUES(
      8519,
      'Frostproof',
      234
);

INSERT INTO city
VALUES(
      8520,
      'Wauchula',
      234
);

INSERT INTO city
VALUES(
      8521,
      'Oviedo',
      234
);

INSERT INTO city
VALUES(
      8522,
      'Orlando',
      234
);

INSERT INTO city
VALUES(
      8523,
      'Sebring',
      234
);

INSERT INTO city
VALUES(
      8524,
      'Oldsmar',
      234
);

INSERT INTO city
VALUES(
      8525,
      'Saint Cloud',
      234
);

INSERT INTO city
VALUES(
      8526,
      'Aventura',
      234
);

INSERT INTO city
VALUES(
      8527,
      'Cooper City',
      234
);

INSERT INTO city
VALUES(
      8528,
      'Starke',
      234
);

INSERT INTO city
VALUES(
      8529,
      'Wilton Manors',
      234
);

INSERT INTO city
VALUES(
      8530,
      'Bonita Springs',
      234
);

INSERT INTO city
VALUES(
      8531,
      'Ocoee',
      234
);

INSERT INTO city
VALUES(
      8532,
      'Niceville',
      234
);

INSERT INTO city
VALUES(
      8533,
      'Palmetto Bay',
      234
);

INSERT INTO city
VALUES(
      8534,
      'Winter Garden',
      234
);

INSERT INTO city
VALUES(
      8535,
      'Port Orange',
      234
);

INSERT INTO city
VALUES(
      8536,
      'Saint Pete Beach',
      234
);

INSERT INTO city
VALUES(
      8537,
      'Tarpon Springs',
      234
);

INSERT INTO city
VALUES(
      8538,
      'Callaway',
      234
);

INSERT INTO city
VALUES(
      8539,
      'West Miami',
      234
);

INSERT INTO city
VALUES(
      8540,
      'Tallahassee',
      234
);

INSERT INTO city
VALUES(
      8541,
      'Panama City Beach',
      234
);

INSERT INTO city
VALUES(
      8542,
      'Marathon',
      234
);

INSERT INTO city
VALUES(
      8543,
      'Orange City',
      234
);

INSERT INTO city
VALUES(
      8544,
      'Sanford',
      234
);

INSERT INTO city
VALUES(
      8545,
      'Largo',
      234
);

INSERT INTO city
VALUES(
      8546,
      'Lake Mary',
      234
);

INSERT INTO city
VALUES(
      8547,
      'Royal Palm Beach',
      234
);

INSERT INTO city
VALUES(
      8548,
      'Leesburg',
      234
);

INSERT INTO city
VALUES(
      8549,
      'Lauderdale-by-the-Sea',
      234
);

INSERT INTO city
VALUES(
      8550,
      'Miami',
      234
);

INSERT INTO city
VALUES(
      8551,
      'West Park',
      234
);

INSERT INTO city
VALUES(
      8552,
      'Palmetto',
      234
);

INSERT INTO city
VALUES(
      8553,
      'North Port',
      234
);

INSERT INTO city
VALUES(
      8554,
      'West Palm Beach',
      234
);

INSERT INTO city
VALUES(
      8555,
      'Eustis',
      234
);

INSERT INTO city
VALUES(
      8556,
      'Palm Coast',
      234
);

INSERT INTO city
VALUES(
      8557,
      'Boynton Beach',
      234
);

INSERT INTO city
VALUES(
      8558,
      'Fort Walton Beach',
      234
);

INSERT INTO city
VALUES(
      8559,
      'Miramar',
      234
);

INSERT INTO city
VALUES(
      8560,
      'Doral',
      234
);

INSERT INTO city
VALUES(
      8561,
      'Avon Park',
      234
);

INSERT INTO city
VALUES(
      8562,
      'Palm Bay',
      234
);

INSERT INTO city
VALUES(
      8563,
      'Safety Harbor',
      234
);

INSERT INTO city
VALUES(
      8564,
      'Miami Beach',
      234
);

INSERT INTO city
VALUES(
      8565,
      'Lake Wales',
      234
);

INSERT INTO city
VALUES(
      8566,
      'Atlantic Beach',
      234
);

INSERT INTO city
VALUES(
      8567,
      'Delray Beach',
      234
);

INSERT INTO city
VALUES(
      8568,
      'Oakland Park',
      234
);

INSERT INTO city
VALUES(
      8569,
      'Sunny Isles Beach',
      234
);

INSERT INTO city
VALUES(
      8570,
      'DeLand',
      234
);

INSERT INTO city
VALUES(
      8571,
      'Hollywood',
      234
);

INSERT INTO city
VALUES(
      8572,
      'Fort Myers Beach',
      234
);

INSERT INTO city
VALUES(
      8573,
      'Lake Park',
      234
);

INSERT INTO city
VALUES(
      8574,
      'Lantana',
      234
);

INSERT INTO city
VALUES(
      8575,
      'Vero Beach',
      234
);

INSERT INTO city
VALUES(
      8576,
      'Pembroke Park',
      234
);

INSERT INTO city
VALUES(
      8577,
      'DeBary',
      234
);

INSERT INTO city
VALUES(
      8578,
      'Miami Gardens',
      234
);

INSERT INTO city
VALUES(
      8579,
      'Saint Petersburg',
      234
);

INSERT INTO city
VALUES(
      8580,
      'West Melbourne',
      234
);

INSERT INTO city
VALUES(
      8581,
      'Fort Myers',
      234
);

INSERT INTO city
VALUES(
      8582,
      'Naples',
      234
);

INSERT INTO city
VALUES(
      8583,
      'Newberry',
      234
);

INSERT INTO city
VALUES(
      8584,
      'Minneola',
      234
);

INSERT INTO city
VALUES(
      8585,
      'Hallandale Beach',
      234
);

INSERT INTO city
VALUES(
      8586,
      'Sunrise',
      234
);

INSERT INTO city
VALUES(
      8587,
      'Sanibel',
      234
);

INSERT INTO city
VALUES(
      8588,
      'Fernandina Beach',
      234
);

INSERT INTO city
VALUES(
      8589,
      'Groveland',
      234
);

INSERT INTO city
VALUES(
      8590,
      'Coral Gables',
      234
);

INSERT INTO city
VALUES(
      8591,
      'Lauderhill',
      234
);

INSERT INTO city
VALUES(
      8592,
      'Clewiston',
      234
);

INSERT INTO city
VALUES(
      8593,
      'Tavares',
      234
);

INSERT INTO city
VALUES(
      8594,
      'Treasure Island',
      234
);

INSERT INTO city
VALUES(
      8595,
      'Fruitland Park',
      234
);

INSERT INTO city
VALUES(
      8596,
      'Altamonte Springs',
      234
);

INSERT INTO city
VALUES(
      8597,
      'Marianna',
      234
);

INSERT INTO city
VALUES(
      8598,
      'Holly Hill',
      234
);

INSERT INTO city
VALUES(
      8599,
      'Tamarac',
      234
);

INSERT INTO city
VALUES(
      8600,
      'Kenneth City',
      234
);

INSERT INTO city
VALUES(
      8601,
      'Okeechobee',
      234
);

INSERT INTO city
VALUES(
      8602,
      'De Funiak Springs',
      234
);

INSERT INTO city
VALUES(
      8603,
      'Jupiter',
      234
);

INSERT INTO city
VALUES(
      8604,
      'Gulfport',
      234
);

INSERT INTO city
VALUES(
      8605,
      'Lynn Haven',
      234
);

INSERT INTO city
VALUES(
      8606,
      'Key West',
      234
);

INSERT INTO city
VALUES(
      8607,
      'Pinecrest',
      234
);

INSERT INTO city
VALUES(
      8608,
      'Pompano Beach',
      234
);

INSERT INTO city
VALUES(
      8609,
      'Palm Beach',
      234
);

INSERT INTO city
VALUES(
      8610,
      'Rockledge',
      234
);

INSERT INTO city
VALUES(
      8611,
      'Destin',
      234
);

INSERT INTO city
VALUES(
      8612,
      'Riviera Beach',
      234
);

INSERT INTO city
VALUES(
      8613,
      'Palm Springs',
      234
);

INSERT INTO city
VALUES(
      8614,
      'Inverness',
      234
);

INSERT INTO city
VALUES(
      8615,
      'Cape Coral',
      234
);

INSERT INTO city
VALUES(
      8616,
      'Sebastian',
      234
);

INSERT INTO city
VALUES(
      8617,
      'Zephyrhills',
      234
);

INSERT INTO city
VALUES(
      8618,
      'Pensacola',
      234
);

INSERT INTO city
VALUES(
      8619,
      'Clermont',
      234
);

INSERT INTO city
VALUES(
      8620,
      'Temple Terrace',
      234
);

INSERT INTO city
VALUES(
      8621,
      'Belle Glade',
      234
);

INSERT INTO city
VALUES(
      8622,
      'Wellington',
      234
);

INSERT INTO city
VALUES(
      8623,
      'Maitland',
      234
);

INSERT INTO city
VALUES(
      8624,
      'Gulf Breeze',
      234
);

INSERT INTO city
VALUES(
      8625,
      'Stuart',
      234
);

INSERT INTO city
VALUES(
      8626,
      'Deltona',
      234
);

INSERT INTO city
VALUES(
      8627,
      'Tampa',
      234
);

INSERT INTO city
VALUES(
      8628,
      'Saint Augustine',
      234
);

INSERT INTO city
VALUES(
      8629,
      'Mount Dora',
      234
);

INSERT INTO city
VALUES(
      8630,
      'Lauderdale Lakes',
      234
);

INSERT INTO city
VALUES(
      8631,
      'Plantation',
      234
);

INSERT INTO city
VALUES(
      8632,
      'Cutler Bay',
      234
);

INSERT INTO city
VALUES(
      8633,
      'Florida City',
      234
);

INSERT INTO city
VALUES(
      8634,
      'Belle Isle',
      234
);

INSERT INTO city
VALUES(
      8635,
      'North Lauderdale',
      234
);

INSERT INTO city
VALUES(
      8636,
      'Apopka',
      234
);

INSERT INTO city
VALUES(
      8637,
      'Fort Pierce',
      234
);

INSERT INTO city
VALUES(
      8638,
      'Satellite Beach',
      234
);

INSERT INTO city
VALUES(
      8639,
      'Coconut Creek',
      234
);

INSERT INTO city
VALUES(
      8640,
      'Deerfield Beach',
      234
);

INSERT INTO city
VALUES(
      8641,
      'Palm Beach Gardens',
      234
);

INSERT INTO city
VALUES(
      8642,
      'Indian Harbour Beach',
      234
);

INSERT INTO city
VALUES(
      8643,
      'Jacksonville Beach',
      234
);

INSERT INTO city
VALUES(
      8644,
      'Parkland',
      234
);

INSERT INTO city
VALUES(
      8645,
      'Titusville',
      234
);

INSERT INTO city
VALUES(
      8646,
      'Auburndale',
      234
);

INSERT INTO city
VALUES(
      8647,
      'Live Oak',
      234
);

INSERT INTO city
VALUES(
      8648,
      'Opa-locka',
      234
);

INSERT INTO city
VALUES(
      8649,
      'North Miami Beach',
      234
);

INSERT INTO city
VALUES(
      8650,
      'Plant City',
      234
);

INSERT INTO city
VALUES(
      8651,
      'Dunedin',
      234
);

INSERT INTO city
VALUES(
      8652,
      'Miami Shores',
      234
);

INSERT INTO city
VALUES(
      8653,
      'Fort Meade',
      234
);

INSERT INTO city
VALUES(
      8654,
      'Fellsmere',
      234
);

INSERT INTO city
VALUES(
      8655,
      'Lake Alfred',
      234
);

INSERT INTO city
VALUES(
      8656,
      'Milton',
      234
);

INSERT INTO city
VALUES(
      8657,
      'Perry',
      234
);

INSERT INTO city
VALUES(
      8658,
      'Gainesville',
      234
);

INSERT INTO city
VALUES(
      8659,
      'Longboat Key',
      234
);

INSERT INTO city
VALUES(
      8660,
      'LaBelle',
      234
);

INSERT INTO city
VALUES(
      8661,
      'Hialeah',
      234
);

INSERT INTO city
VALUES(
      8662,
      'Pahokee',
      234
);

INSERT INTO city
VALUES(
      8663,
      'Casselberry',
      234
);

INSERT INTO city
VALUES(
      8664,
      'Neptune Beach',
      234
);

INSERT INTO city
VALUES(
      8665,
      'South Pasadena',
      234
);

INSERT INTO city
VALUES(
      8666,
      'Arcadia',
      234
);

INSERT INTO city
VALUES(
      8667,
      'Surfside',
      234
);

INSERT INTO city
VALUES(
      8668,
      'Davie',
      234
);

INSERT INTO city
VALUES(
      8669,
      'Bartow',
      234
);

INSERT INTO city
VALUES(
      8670,
      'Margate',
      234
);

INSERT INTO city
VALUES(
      8671,
      'Cape Canaveral',
      234
);

INSERT INTO city
VALUES(
      8672,
      'Cocoa Beach',
      234
);

INSERT INTO city
VALUES(
      8673,
      'Cocoa',
      234
);

INSERT INTO city
VALUES(
      8674,
      'New Smyrna Beach',
      234
);

INSERT INTO city
VALUES(
      8675,
      'Dania Beach',
      234
);

INSERT INTO city
VALUES(
      8676,
      'Fort Lauderdale',
      234
);

INSERT INTO city
VALUES(
      8677,
      'Green Cove Springs',
      234
);

INSERT INTO city
VALUES(
      8678,
      'Lake Worth',
      234
);

INSERT INTO city
VALUES(
      8679,
      'Saint Augustine Beach',
      234
);

INSERT INTO city
VALUES(
      8680,
      'Kissimmee',
      234
);

INSERT INTO city
VALUES(
      8681,
      'Homestead',
      234
);

INSERT INTO city
VALUES(
      8682,
      'Boca Raton',
      234
);

INSERT INTO city
VALUES(
      8683,
      'Orange Park',
      234
);

INSERT INTO city
VALUES(
      8684,
      'Haines City',
      234
);

INSERT INTO city
VALUES(
      8685,
      'Winter Park',
      234
);

INSERT INTO city
VALUES(
      8686,
      'Punta Gorda',
      234
);

INSERT INTO city
VALUES(
      8687,
      'Hialeah Gardens',
      234
);

INSERT INTO city
VALUES(
      8688,
      'North Miami',
      234
);

INSERT INTO city
VALUES(
      8689,
      'Sweetwater',
      234
);

INSERT INTO city
VALUES(
      8690,
      'North Bay Village',
      234
);

INSERT INTO city
VALUES(
      8691,
      'Flagler Beach',
      234
);

INSERT INTO city
VALUES(
      8692,
      'Springfield',
      234
);

INSERT INTO city
VALUES(
      8693,
      'South Daytona',
      234
);

INSERT INTO city
VALUES(
      8694,
      'Weston',
      234
);

INSERT INTO city
VALUES(
      8695,
      'Coral Springs',
      234
);

INSERT INTO city
VALUES(
      8696,
      'Southwest Ranches',
      234
);

INSERT INTO city
VALUES(
      8697,
      'Jacksonville',
      234
);

INSERT INTO city
VALUES(
      8698,
      'Crestview',
      234
);

INSERT INTO city
VALUES(
      8699,
      'Melbourne',
      234
);

INSERT INTO city
VALUES(
      8700,
      'Longwood',
      234
);

INSERT INTO city
VALUES(
      8701,
      'Macclenny',
      234
);

INSERT INTO city
VALUES(
      8702,
      'Bay Harbor Islands',
      234
);

INSERT INTO city
VALUES(
      8703,
      'Palatka',
      234
);

INSERT INTO city
VALUES(
      8704,
      'Worland',
      234
);

INSERT INTO city
VALUES(
      8705,
      'Powell',
      234
);

INSERT INTO city
VALUES(
      8706,
      'Green River',
      234
);

INSERT INTO city
VALUES(
      8707,
      'Torrington',
      234
);

INSERT INTO city
VALUES(
      8708,
      'Laramie',
      234
);

INSERT INTO city
VALUES(
      8709,
      'Cheyenne',
      234
);

INSERT INTO city
VALUES(
      8710,
      'Jackson',
      234
);

INSERT INTO city
VALUES(
      8711,
      'Rock Springs',
      234
);

INSERT INTO city
VALUES(
      8712,
      'Lander',
      234
);

INSERT INTO city
VALUES(
      8713,
      'Rawlins',
      234
);

INSERT INTO city
VALUES(
      8714,
      'Douglas',
      234
);

INSERT INTO city
VALUES(
      8715,
      'Casper',
      234
);

INSERT INTO city
VALUES(
      8716,
      'Cody',
      234
);

INSERT INTO city
VALUES(
      8717,
      'Gillette',
      234
);

INSERT INTO city
VALUES(
      8718,
      'Evanston',
      234
);

INSERT INTO city
VALUES(
      8719,
      'Sheridan',
      234
);

INSERT INTO city
VALUES(
      8720,
      'Riverton',
      234
);

INSERT INTO city
VALUES(
      8721,
      'Keene',
      234
);

INSERT INTO city
VALUES(
      8722,
      'Concord',
      234
);

INSERT INTO city
VALUES(
      8723,
      'Manchester',
      234
);

INSERT INTO city
VALUES(
      8724,
      'Rochester',
      234
);

INSERT INTO city
VALUES(
      8725,
      'Claremont',
      234
);

INSERT INTO city
VALUES(
      8726,
      'Berlin',
      234
);

INSERT INTO city
VALUES(
      8727,
      'Portsmouth',
      234
);

INSERT INTO city
VALUES(
      8728,
      'Somersworth',
      234
);

INSERT INTO city
VALUES(
      8729,
      'Dover',
      234
);

INSERT INTO city
VALUES(
      8730,
      'Laconia',
      234
);

INSERT INTO city
VALUES(
      8731,
      'Franklin',
      234
);

INSERT INTO city
VALUES(
      8732,
      'Lebanon',
      234
);

INSERT INTO city
VALUES(
      8733,
      'Nashua',
      234
);

INSERT INTO city
VALUES(
      8734,
      'Somers Point',
      234
);

INSERT INTO city
VALUES(
      8735,
      'Bayonne',
      234
);

INSERT INTO city
VALUES(
      8736,
      'Ridgefield Park',
      234
);

INSERT INTO city
VALUES(
      8737,
      'Closter',
      234
);

INSERT INTO city
VALUES(
      8738,
      'Belmar',
      234
);

INSERT INTO city
VALUES(
      8739,
      'Somerdale',
      234
);

INSERT INTO city
VALUES(
      8740,
      'Bloomingdale',
      234
);

INSERT INTO city
VALUES(
      8741,
      'Burlington',
      234
);

INSERT INTO city
VALUES(
      8742,
      'Ocean City',
      234
);

INSERT INTO city
VALUES(
      8743,
      'Metuchen',
      234
);

INSERT INTO city
VALUES(
      8744,
      'Hammonton',
      234
);

INSERT INTO city
VALUES(
      8745,
      'Paramus',
      234
);

INSERT INTO city
VALUES(
      8746,
      'Hoboken',
      234
);

INSERT INTO city
VALUES(
      8747,
      'Woodcliff Lake',
      234
);

INSERT INTO city
VALUES(
      8748,
      'Eatontown',
      234
);

INSERT INTO city
VALUES(
      8749,
      'New Providence',
      234
);

INSERT INTO city
VALUES(
      8750,
      'North Caldwell',
      234
);

INSERT INTO city
VALUES(
      8751,
      'South River',
      234
);

INSERT INTO city
VALUES(
      8752,
      'Hopatcong',
      234
);

INSERT INTO city
VALUES(
      8753,
      'Franklin Lakes',
      234
);

INSERT INTO city
VALUES(
      8754,
      'Manville',
      234
);

INSERT INTO city
VALUES(
      8755,
      'Tinton Falls',
      234
);

INSERT INTO city
VALUES(
      8756,
      'Madison',
      234
);

INSERT INTO city
VALUES(
      8757,
      'Glen Rock',
      234
);

INSERT INTO city
VALUES(
      8758,
      'Emerson',
      234
);

INSERT INTO city
VALUES(
      8759,
      'Guttenberg',
      234
);

INSERT INTO city
VALUES(
      8760,
      'Rockaway',
      234
);

INSERT INTO city
VALUES(
      8761,
      'Totowa',
      234
);

INSERT INTO city
VALUES(
      8762,
      'Gloucester City',
      234
);

INSERT INTO city
VALUES(
      8763,
      'Wanaque',
      234
);

INSERT INTO city
VALUES(
      8764,
      'Montvale',
      234
);

INSERT INTO city
VALUES(
      8765,
      'East Rutherford',
      234
);

INSERT INTO city
VALUES(
      8766,
      'Plainfield',
      234
);

INSERT INTO city
VALUES(
      8767,
      'Spotswood',
      234
);

INSERT INTO city
VALUES(
      8768,
      'Paterson',
      234
);

INSERT INTO city
VALUES(
      8769,
      'Fair Haven',
      234
);

INSERT INTO city
VALUES(
      8770,
      'Clayton',
      234
);

INSERT INTO city
VALUES(
      8771,
      'West New York',
      234
);

INSERT INTO city
VALUES(
      8772,
      'Ringwood',
      234
);

INSERT INTO city
VALUES(
      8773,
      'Keyport',
      234
);

INSERT INTO city
VALUES(
      8774,
      'River Edge',
      234
);

INSERT INTO city
VALUES(
      8775,
      'Kenilworth',
      234
);

INSERT INTO city
VALUES(
      8776,
      'Red Bank',
      234
);

INSERT INTO city
VALUES(
      8777,
      'Perth Amboy',
      234
);

INSERT INTO city
VALUES(
      8778,
      'Milltown',
      234
);

INSERT INTO city
VALUES(
      8779,
      'Ridgewood',
      234
);

INSERT INTO city
VALUES(
      8780,
      'Leonia',
      234
);

INSERT INTO city
VALUES(
      8781,
      'Wildwood',
      234
);

INSERT INTO city
VALUES(
      8782,
      'Kearny',
      234
);

INSERT INTO city
VALUES(
      8783,
      'Hackensack',
      234
);

INSERT INTO city
VALUES(
      8784,
      'Manasquan',
      234
);

INSERT INTO city
VALUES(
      8785,
      'Phillipsburg',
      234
);

INSERT INTO city
VALUES(
      8786,
      'Oceanport',
      234
);

INSERT INTO city
VALUES(
      8787,
      'Bergenfield',
      234
);

INSERT INTO city
VALUES(
      8788,
      'Fanwood',
      234
);

INSERT INTO city
VALUES(
      8789,
      'Little Silver',
      234
);

INSERT INTO city
VALUES(
      8790,
      'Elizabeth',
      234
);

INSERT INTO city
VALUES(
      8791,
      'Hawthorne',
      234
);

INSERT INTO city
VALUES(
      8792,
      'Ridgefield',
      234
);

INSERT INTO city
VALUES(
      8793,
      'New Milford',
      234
);

INSERT INTO city
VALUES(
      8794,
      'Chatham',
      234
);

INSERT INTO city
VALUES(
      8795,
      'Highland Park',
      234
);

INSERT INTO city
VALUES(
      8796,
      'Matawan',
      234
);

INSERT INTO city
VALUES(
      8797,
      'Upper Saddle River',
      234
);

INSERT INTO city
VALUES(
      8798,
      'Pompton Lakes',
      234
);

INSERT INTO city
VALUES(
      8799,
      'Mount Arlington',
      234
);

INSERT INTO city
VALUES(
      8800,
      'Westfield',
      234
);

INSERT INTO city
VALUES(
      8801,
      'Fort Lee',
      234
);

INSERT INTO city
VALUES(
      8802,
      'North Arlington',
      234
);

INSERT INTO city
VALUES(
      8803,
      'Prospect Park',
      234
);

INSERT INTO city
VALUES(
      8804,
      'Pleasantville',
      234
);

INSERT INTO city
VALUES(
      8805,
      'Glen Ridge',
      234
);

INSERT INTO city
VALUES(
      8806,
      'Wharton',
      234
);

INSERT INTO city
VALUES(
      8807,
      'Union Beach',
      234
);

INSERT INTO city
VALUES(
      8808,
      'Audubon',
      234
);

INSERT INTO city
VALUES(
      8809,
      'Haddon Heights',
      234
);

INSERT INTO city
VALUES(
      8810,
      'Oradell',
      234
);

INSERT INTO city
VALUES(
      8811,
      'Bellmawr',
      234
);

INSERT INTO city
VALUES(
      8812,
      'Brigantine',
      234
);

INSERT INTO city
VALUES(
      8813,
      'Demarest',
      234
);

INSERT INTO city
VALUES(
      8814,
      'Dumont',
      234
);

INSERT INTO city
VALUES(
      8815,
      'Vineland',
      234
);

INSERT INTO city
VALUES(
      8816,
      'Boonton',
      234
);

INSERT INTO city
VALUES(
      8817,
      'Summit',
      234
);

INSERT INTO city
VALUES(
      8818,
      'Carteret',
      234
);

INSERT INTO city
VALUES(
      8819,
      'Margate City',
      234
);

INSERT INTO city
VALUES(
      8820,
      'Tenafly',
      234
);

INSERT INTO city
VALUES(
      8821,
      'Runnemede',
      234
);

INSERT INTO city
VALUES(
      8822,
      'Pitman',
      234
);

INSERT INTO city
VALUES(
      8823,
      'Linwood',
      234
);

INSERT INTO city
VALUES(
      8824,
      'Allendale',
      234
);

INSERT INTO city
VALUES(
      8825,
      'South Amboy',
      234
);

INSERT INTO city
VALUES(
      8826,
      'Waldwick',
      234
);

INSERT INTO city
VALUES(
      8827,
      'Jersey City',
      234
);

INSERT INTO city
VALUES(
      8828,
      'South Plainfield',
      234
);

INSERT INTO city
VALUES(
      8829,
      'Hackettstown',
      234
);

INSERT INTO city
VALUES(
      8830,
      'Absecon',
      234
);

INSERT INTO city
VALUES(
      8831,
      'Raritan',
      234
);

INSERT INTO city
VALUES(
      8832,
      'Trenton',
      234
);

INSERT INTO city
VALUES(
      8833,
      'Union City',
      234
);

INSERT INTO city
VALUES(
      8834,
      'Garfield',
      234
);

INSERT INTO city
VALUES(
      8835,
      'Old Tappan',
      234
);

INSERT INTO city
VALUES(
      8836,
      'Morristown',
      234
);

INSERT INTO city
VALUES(
      8837,
      'West Long Branch',
      234
);

INSERT INTO city
VALUES(
      8838,
      'Millville',
      234
);

INSERT INTO city
VALUES(
      8839,
      'Northfield',
      234
);

INSERT INTO city
VALUES(
      8840,
      'Lincoln Park',
      234
);

INSERT INTO city
VALUES(
      8841,
      'Newark',
      234
);

INSERT INTO city
VALUES(
      8842,
      'Bernardsville',
      234
);

INSERT INTO city
VALUES(
      8843,
      'Ventnor City',
      234
);

INSERT INTO city
VALUES(
      8844,
      'Washington',
      234
);

INSERT INTO city
VALUES(
      8845,
      'Camden',
      234
);

INSERT INTO city
VALUES(
      8846,
      'Butler',
      234
);

INSERT INTO city
VALUES(
      8847,
      'Paulsboro',
      234
);

INSERT INTO city
VALUES(
      8848,
      'Linden',
      234
);

INSERT INTO city
VALUES(
      8849,
      'Berlin',
      234
);

INSERT INTO city
VALUES(
      8850,
      'Florham Park',
      234
);

INSERT INTO city
VALUES(
      8851,
      'Long Branch',
      234
);

INSERT INTO city
VALUES(
      8852,
      'Lodi',
      234
);

INSERT INTO city
VALUES(
      8853,
      'Hasbrouck Heights',
      234
);

INSERT INTO city
VALUES(
      8854,
      'Bridgeton',
      234
);

INSERT INTO city
VALUES(
      8855,
      'Dunellen',
      234
);

INSERT INTO city
VALUES(
      8856,
      'Hightstown',
      234
);

INSERT INTO city
VALUES(
      8857,
      'Rahway',
      234
);

INSERT INTO city
VALUES(
      8858,
      'Woodbury',
      234
);

INSERT INTO city
VALUES(
      8859,
      'Princeton',
      234
);

INSERT INTO city
VALUES(
      8860,
      'Roselle Park',
      234
);

INSERT INTO city
VALUES(
      8861,
      'New Brunswick',
      234
);

INSERT INTO city
VALUES(
      8862,
      'Wood-Ridge',
      234
);

INSERT INTO city
VALUES(
      8863,
      'Bound Brook',
      234
);

INSERT INTO city
VALUES(
      8864,
      'Mountainside',
      234
);

INSERT INTO city
VALUES(
      8865,
      'Cliffside Park',
      234
);

INSERT INTO city
VALUES(
      8866,
      'Salem',
      234
);

INSERT INTO city
VALUES(
      8867,
      'Harrison',
      234
);

INSERT INTO city
VALUES(
      8868,
      'Edgewater',
      234
);

INSERT INTO city
VALUES(
      8869,
      'Somerville',
      234
);

INSERT INTO city
VALUES(
      8870,
      'Palmyra',
      234
);

INSERT INTO city
VALUES(
      8871,
      'Middlesex',
      234
);

INSERT INTO city
VALUES(
      8872,
      'North Haledon',
      234
);

INSERT INTO city
VALUES(
      8873,
      'Midland Park',
      234
);

INSERT INTO city
VALUES(
      8874,
      'Fairview',
      234
);

INSERT INTO city
VALUES(
      8875,
      'Stratford',
      234
);

INSERT INTO city
VALUES(
      8876,
      'Sayreville',
      234
);

INSERT INTO city
VALUES(
      8877,
      'Carlstadt',
      234
);

INSERT INTO city
VALUES(
      8878,
      'Bogota',
      234
);

INSERT INTO city
VALUES(
      8879,
      'Pine Hill',
      234
);

INSERT INTO city
VALUES(
      8880,
      'Palisades Park',
      234
);

INSERT INTO city
VALUES(
      8881,
      'North Plainfield',
      234
);

INSERT INTO city
VALUES(
      8882,
      'Cresskill',
      234
);

INSERT INTO city
VALUES(
      8883,
      'Keansburg',
      234
);

INSERT INTO city
VALUES(
      8884,
      'Fair Lawn',
      234
);

INSERT INTO city
VALUES(
      8885,
      'Rumson',
      234
);

INSERT INTO city
VALUES(
      8886,
      'East Orange',
      234
);

INSERT INTO city
VALUES(
      8887,
      'Watchung',
      234
);

INSERT INTO city
VALUES(
      8888,
      'Westwood',
      234
);

INSERT INTO city
VALUES(
      8889,
      'Newton',
      234
);

INSERT INTO city
VALUES(
      8890,
      'Caldwell',
      234
);

INSERT INTO city
VALUES(
      8891,
      'Barrington',
      234
);

INSERT INTO city
VALUES(
      8892,
      'Beachwood',
      234
);

INSERT INTO city
VALUES(
      8893,
      'Freehold',
      234
);

INSERT INTO city
VALUES(
      8894,
      'Roseland',
      234
);

INSERT INTO city
VALUES(
      8895,
      'Passaic',
      234
);

INSERT INTO city
VALUES(
      8896,
      'Rutherford',
      234
);

INSERT INTO city
VALUES(
      8897,
      'Hillsdale',
      234
);

INSERT INTO city
VALUES(
      8898,
      'Point Pleasant',
      234
);

INSERT INTO city
VALUES(
      8899,
      'Little Ferry',
      234
);

INSERT INTO city
VALUES(
      8900,
      'Atlantic City',
      234
);

INSERT INTO city
VALUES(
      8901,
      'Asbury Park',
      234
);

INSERT INTO city
VALUES(
      8902,
      'Glassboro',
      234
);

INSERT INTO city
VALUES(
      8903,
      'Roselle',
      234
);

INSERT INTO city
VALUES(
      8904,
      'Haledon',
      234
);

INSERT INTO city
VALUES(
      8905,
      'Elmwood Park',
      234
);

INSERT INTO city
VALUES(
      8906,
      'Ramsey',
      234
);

INSERT INTO city
VALUES(
      8907,
      'Jamesburg',
      234
);

INSERT INTO city
VALUES(
      8908,
      'Englewood',
      234
);

INSERT INTO city
VALUES(
      8909,
      'Norwood',
      234
);

INSERT INTO city
VALUES(
      8910,
      'Lindenwold',
      234
);

INSERT INTO city
VALUES(
      8911,
      'Englewood Cliffs',
      234
);

INSERT INTO city
VALUES(
      8912,
      'Franklin',
      234
);

INSERT INTO city
VALUES(
      8913,
      'Collingswood',
      234
);

INSERT INTO city
VALUES(
      8914,
      'Maywood',
      234
);

INSERT INTO city
VALUES(
      8915,
      'Haddonfield',
      234
);

INSERT INTO city
VALUES(
      8916,
      'Kinnelon',
      234
);

INSERT INTO city
VALUES(
      8917,
      'Wallington',
      234
);

INSERT INTO city
VALUES(
      8918,
      'Park Ridge',
      234
);

INSERT INTO city
VALUES(
      8919,
      'Morris Plains',
      234
);

INSERT INTO city
VALUES(
      8920,
      'Dover',
      234
);

INSERT INTO city
VALUES(
      8921,
      'Clifton',
      234
);

INSERT INTO city
VALUES(
      8922,
      'Oakland',
      234
);

INSERT INTO city
VALUES(
      8923,
      'Secaucus',
      234
);

INSERT INTO city
VALUES(
      8924,
      'Sunland Park',
      234
);

INSERT INTO city
VALUES(
      8925,
      'Raton',
      234
);

INSERT INTO city
VALUES(
      8926,
      'Las Vegas',
      234
);

INSERT INTO city
VALUES(
      8927,
      'Carlsbad',
      234
);

INSERT INTO city
VALUES(
      8928,
      'Clovis',
      234
);

INSERT INTO city
VALUES(
      8929,
      'Aztec',
      234
);

INSERT INTO city
VALUES(
      8930,
      'Lovington',
      234
);

INSERT INTO city
VALUES(
      8931,
      'Grants',
      234
);

INSERT INTO city
VALUES(
      8932,
      'Los Ranchos de Albuquerque',
      234
);

INSERT INTO city
VALUES(
      8933,
      'Anthony',
      234
);

INSERT INTO city
VALUES(
      8934,
      'Farmington',
      234
);

INSERT INTO city
VALUES(
      8935,
      'Rio Rancho',
      234
);

INSERT INTO city
VALUES(
      8936,
      'Bernalillo',
      234
);

INSERT INTO city
VALUES(
      8937,
      'Portales',
      234
);

INSERT INTO city
VALUES(
      8938,
      'Corrales',
      234
);

INSERT INTO city
VALUES(
      8939,
      'Gallup',
      234
);

INSERT INTO city
VALUES(
      8940,
      'Los Lunas',
      234
);

INSERT INTO city
VALUES(
      8941,
      'Deming',
      234
);

INSERT INTO city
VALUES(
      8942,
      'Truth or Consequences',
      234
);

INSERT INTO city
VALUES(
      8943,
      'Santa Fe',
      234
);

INSERT INTO city
VALUES(
      8944,
      'Belen',
      234
);

INSERT INTO city
VALUES(
      8945,
      'Hobbs',
      234
);

INSERT INTO city
VALUES(
      8946,
      'Socorro',
      234
);

INSERT INTO city
VALUES(
      8947,
      'Alamogordo',
      234
);

INSERT INTO city
VALUES(
      8948,
      'Bloomfield',
      234
);

INSERT INTO city
VALUES(
      8949,
      'Ruidoso',
      234
);

INSERT INTO city
VALUES(
      8950,
      'Albuquerque',
      234
);

INSERT INTO city
VALUES(
      8951,
      'Las Cruces',
      234
);

INSERT INTO city
VALUES(
      8952,
      'Taos',
      234
);

INSERT INTO city
VALUES(
      8953,
      'Artesia',
      234
);

INSERT INTO city
VALUES(
      8954,
      'Silver City',
      234
);

INSERT INTO city
VALUES(
      8955,
      'Espanola',
      234
);

INSERT INTO city
VALUES(
      8956,
      'Roswell',
      234
);

INSERT INTO city
VALUES(
      8957,
      'Burnet',
      234
);

INSERT INTO city
VALUES(
      8958,
      'Roma-Los Saenz',
      234
);

INSERT INTO city
VALUES(
      8959,
      'Hondo',
      234
);

INSERT INTO city
VALUES(
      8960,
      'Frisco',
      234
);

INSERT INTO city
VALUES(
      8961,
      'Onalaska',
      234
);

INSERT INTO city
VALUES(
      8962,
      'Waco',
      234
);

INSERT INTO city
VALUES(
      8963,
      'Pampa',
      234
);

INSERT INTO city
VALUES(
      8964,
      'Sherman',
      234
);

INSERT INTO city
VALUES(
      8965,
      'Cedar Hill',
      234
);

INSERT INTO city
VALUES(
      8966,
      'Pasadena',
      234
);

INSERT INTO city
VALUES(
      8967,
      'Woodway',
      234
);

INSERT INTO city
VALUES(
      8968,
      'Vernon',
      234
);

INSERT INTO city
VALUES(
      8969,
      'Crowley',
      234
);

INSERT INTO city
VALUES(
      8970,
      'Denver City',
      234
);

INSERT INTO city
VALUES(
      8971,
      'Bay City',
      234
);

INSERT INTO city
VALUES(
      8972,
      'Irving',
      234
);

INSERT INTO city
VALUES(
      8973,
      'Coppell',
      234
);

INSERT INTO city
VALUES(
      8974,
      'Lucas',
      234
);

INSERT INTO city
VALUES(
      8975,
      'Marlin',
      234
);

INSERT INTO city
VALUES(
      8976,
      'El Campo',
      234
);

INSERT INTO city
VALUES(
      8977,
      'Arlington',
      234
);

INSERT INTO city
VALUES(
      8978,
      'Addison',
      234
);

INSERT INTO city
VALUES(
      8979,
      'Mexia',
      234
);

INSERT INTO city
VALUES(
      8980,
      'Pharr',
      234
);

INSERT INTO city
VALUES(
      8981,
      'Fort Worth',
      234
);

INSERT INTO city
VALUES(
      8982,
      'White Oak',
      234
);

INSERT INTO city
VALUES(
      8983,
      'Floresville',
      234
);

INSERT INTO city
VALUES(
      8984,
      'Granbury',
      234
);

INSERT INTO city
VALUES(
      8985,
      'Nacogdoches',
      234
);

INSERT INTO city
VALUES(
      8986,
      'Aubrey',
      234
);

INSERT INTO city
VALUES(
      8987,
      'Gun Barrel City',
      234
);

INSERT INTO city
VALUES(
      8988,
      'Brenham',
      234
);

INSERT INTO city
VALUES(
      8989,
      'Rosenberg',
      234
);

INSERT INTO city
VALUES(
      8990,
      'Vidor',
      234
);

INSERT INTO city
VALUES(
      8991,
      'New Braunfels',
      234
);

INSERT INTO city
VALUES(
      8992,
      'Alamo Heights',
      234
);

INSERT INTO city
VALUES(
      8993,
      'Angleton',
      234
);

INSERT INTO city
VALUES(
      8994,
      'Lubbock',
      234
);

INSERT INTO city
VALUES(
      8995,
      'Mathis',
      234
);

INSERT INTO city
VALUES(
      8996,
      'Galveston',
      234
);

INSERT INTO city
VALUES(
      8997,
      'Levelland',
      234
);

INSERT INTO city
VALUES(
      8998,
      'Corpus Christi',
      234
);

INSERT INTO city
VALUES(
      8999,
      'Duncanville',
      234
);

INSERT INTO city
VALUES(
      9000,
      'Anna',
      234
);

INSERT INTO city
VALUES(
      9001,
      'Galena Park',
      234
);

INSERT INTO city
VALUES(
      9002,
      'Lewisville',
      234
);

INSERT INTO city
VALUES(
      9003,
      'DeSoto',
      234
);

INSERT INTO city
VALUES(
      9004,
      'Port Lavaca',
      234
);

INSERT INTO city
VALUES(
      9005,
      'Wichita Falls',
      234
);

INSERT INTO city
VALUES(
      9006,
      'Rockport',
      234
);

INSERT INTO city
VALUES(
      9007,
      'Sanger',
      234
);

INSERT INTO city
VALUES(
      9008,
      'Watauga',
      234
);

INSERT INTO city
VALUES(
      9009,
      'Willow Park',
      234
);

INSERT INTO city
VALUES(
      9010,
      'Canyon',
      234
);

INSERT INTO city
VALUES(
      9011,
      'Mineola',
      234
);

INSERT INTO city
VALUES(
      9012,
      'West University Place',
      234
);

INSERT INTO city
VALUES(
      9013,
      'Kenedy',
      234
);

INSERT INTO city
VALUES(
      9014,
      'Lake Jackson',
      234
);

INSERT INTO city
VALUES(
      9015,
      'McAllen',
      234
);

INSERT INTO city
VALUES(
      9016,
      'Harker Heights',
      234
);

INSERT INTO city
VALUES(
      9017,
      'Elgin',
      234
);

INSERT INTO city
VALUES(
      9018,
      'Little Elm',
      234
);

INSERT INTO city
VALUES(
      9019,
      'Kaufman',
      234
);

INSERT INTO city
VALUES(
      9020,
      'Rhome',
      234
);

INSERT INTO city
VALUES(
      9021,
      'Cleveland',
      234
);

INSERT INTO city
VALUES(
      9022,
      'Athens',
      234
);

INSERT INTO city
VALUES(
      9023,
      'Georgetown',
      234
);

INSERT INTO city
VALUES(
      9024,
      'Rio Grande City',
      234
);

INSERT INTO city
VALUES(
      9025,
      'Fairview',
      234
);

INSERT INTO city
VALUES(
      9026,
      'San Angelo',
      234
);

INSERT INTO city
VALUES(
      9027,
      'Freeport',
      234
);

INSERT INTO city
VALUES(
      9028,
      'Belton',
      234
);

INSERT INTO city
VALUES(
      9029,
      'Portland',
      234
);

INSERT INTO city
VALUES(
      9030,
      'Sinton',
      234
);

INSERT INTO city
VALUES(
      9031,
      'Lumberton',
      234
);

INSERT INTO city
VALUES(
      9032,
      'Alice',
      234
);

INSERT INTO city
VALUES(
      9033,
      'Alamo',
      234
);

INSERT INTO city
VALUES(
      9034,
      'Decatur',
      234
);

INSERT INTO city
VALUES(
      9035,
      'San Marcos',
      234
);

INSERT INTO city
VALUES(
      9036,
      'Perryton',
      234
);

INSERT INTO city
VALUES(
      9037,
      'Haltom City',
      234
);

INSERT INTO city
VALUES(
      9038,
      'Cameron',
      234
);

INSERT INTO city
VALUES(
      9039,
      'Boerne',
      234
);

INSERT INTO city
VALUES(
      9040,
      'La Feria',
      234
);

INSERT INTO city
VALUES(
      9041,
      'Pleasanton',
      234
);

INSERT INTO city
VALUES(
      9042,
      'Weatherford',
      234
);

INSERT INTO city
VALUES(
      9043,
      'Melissa',
      234
);

INSERT INTO city
VALUES(
      9044,
      'Hillsboro',
      234
);

INSERT INTO city
VALUES(
      9045,
      'Waxahachie',
      234
);

INSERT INTO city
VALUES(
      9046,
      'Mission',
      234
);

INSERT INTO city
VALUES(
      9047,
      'Dumas',
      234
);

INSERT INTO city
VALUES(
      9048,
      'Texarkana',
      234
);

INSERT INTO city
VALUES(
      9049,
      'Keller',
      234
);

INSERT INTO city
VALUES(
      9050,
      'Atlanta',
      234
);

INSERT INTO city
VALUES(
      9051,
      'Rio Bravo',
      234
);

INSERT INTO city
VALUES(
      9052,
      'Uvalde',
      234
);

INSERT INTO city
VALUES(
      9053,
      'Lampasas',
      234
);

INSERT INTO city
VALUES(
      9054,
      'Hereford',
      234
);

INSERT INTO city
VALUES(
      9055,
      'Fulshear',
      234
);

INSERT INTO city
VALUES(
      9056,
      'Orange',
      234
);

INSERT INTO city
VALUES(
      9057,
      'Lacy-Lakeview',
      234
);

INSERT INTO city
VALUES(
      9058,
      'Sunnyvale',
      234
);

INSERT INTO city
VALUES(
      9059,
      'Friendswood',
      234
);

INSERT INTO city
VALUES(
      9060,
      'Azle',
      234
);

INSERT INTO city
VALUES(
      9061,
      'Trophy Club',
      234
);

INSERT INTO city
VALUES(
      9062,
      'Taylor',
      234
);

INSERT INTO city
VALUES(
      9063,
      'Roma',
      234
);

INSERT INTO city
VALUES(
      9064,
      'The Colony',
      234
);

INSERT INTO city
VALUES(
      9065,
      'Carrollton',
      234
);

INSERT INTO city
VALUES(
      9066,
      'Lamesa',
      234
);

INSERT INTO city
VALUES(
      9067,
      'Yoakum',
      234
);

INSERT INTO city
VALUES(
      9068,
      'McKinney',
      234
);

INSERT INTO city
VALUES(
      9069,
      'Bowie',
      234
);

INSERT INTO city
VALUES(
      9070,
      'Kirby',
      234
);

INSERT INTO city
VALUES(
      9071,
      'Crystal City',
      234
);

INSERT INTO city
VALUES(
      9072,
      'Forney',
      234
);

INSERT INTO city
VALUES(
      9073,
      'Woodcreek',
      234
);

INSERT INTO city
VALUES(
      9074,
      'Kyle',
      234
);

INSERT INTO city
VALUES(
      9075,
      'Webster',
      234
);

INSERT INTO city
VALUES(
      9076,
      'Terrell Hills',
      234
);

INSERT INTO city
VALUES(
      9077,
      'Deer Park',
      234
);

INSERT INTO city
VALUES(
      9078,
      'Pecos',
      234
);

INSERT INTO city
VALUES(
      9079,
      'Snyder',
      234
);

INSERT INTO city
VALUES(
      9080,
      'Nolanville',
      234
);

INSERT INTO city
VALUES(
      9081,
      'Muleshoe',
      234
);

INSERT INTO city
VALUES(
      9082,
      'Devine',
      234
);

INSERT INTO city
VALUES(
      9083,
      'Laredo',
      234
);

INSERT INTO city
VALUES(
      9084,
      'Euless',
      234
);

INSERT INTO city
VALUES(
      9085,
      'Commerce',
      234
);

INSERT INTO city
VALUES(
      9086,
      'Southlake',
      234
);

INSERT INTO city
VALUES(
      9087,
      'Longview',
      234
);

INSERT INTO city
VALUES(
      9088,
      'Wharton',
      234
);

INSERT INTO city
VALUES(
      9089,
      'Post',
      234
);

INSERT INTO city
VALUES(
      9090,
      'Port Isabel',
      234
);

INSERT INTO city
VALUES(
      9091,
      'Hurst',
      234
);

INSERT INTO city
VALUES(
      9092,
      'Kingsville',
      234
);

INSERT INTO city
VALUES(
      9093,
      'Royse City',
      234
);

INSERT INTO city
VALUES(
      9094,
      'Murphy',
      234
);

INSERT INTO city
VALUES(
      9095,
      'Ingleside',
      234
);

INSERT INTO city
VALUES(
      9096,
      'Pflugerville',
      234
);

INSERT INTO city
VALUES(
      9097,
      'West Tawakoni',
      234
);

INSERT INTO city
VALUES(
      9098,
      'Farmers Branch',
      234
);

INSERT INTO city
VALUES(
      9099,
      'Bellmead',
      234
);

INSERT INTO city
VALUES(
      9100,
      'Del Rio',
      234
);

INSERT INTO city
VALUES(
      9101,
      'Manvel',
      234
);

INSERT INTO city
VALUES(
      9102,
      'Allen',
      234
);

INSERT INTO city
VALUES(
      9103,
      'San Juan',
      234
);

INSERT INTO city
VALUES(
      9104,
      'Highland Village',
      234
);

INSERT INTO city
VALUES(
      9105,
      'Seminole',
      234
);

INSERT INTO city
VALUES(
      9106,
      'Hempstead',
      234
);

INSERT INTO city
VALUES(
      9107,
      'Tomball',
      234
);

INSERT INTO city
VALUES(
      9108,
      'Bonham',
      234
);

INSERT INTO city
VALUES(
      9109,
      'Sugar Land',
      234
);

INSERT INTO city
VALUES(
      9110,
      'Leon Valley',
      234
);

INSERT INTO city
VALUES(
      9111,
      'Sansom Park',
      234
);

INSERT INTO city
VALUES(
      9112,
      'San Elizario',
      234
);

INSERT INTO city
VALUES(
      9113,
      'Port Arthur',
      234
);

INSERT INTO city
VALUES(
      9114,
      'Marshall',
      234
);

INSERT INTO city
VALUES(
      9115,
      'Amarillo',
      234
);

INSERT INTO city
VALUES(
      9116,
      'Plano',
      234
);

INSERT INTO city
VALUES(
      9117,
      'Mesquite',
      234
);

INSERT INTO city
VALUES(
      9118,
      'Prosper',
      234
);

INSERT INTO city
VALUES(
      9119,
      'Hitchcock',
      234
);

INSERT INTO city
VALUES(
      9120,
      'Plainview',
      234
);

INSERT INTO city
VALUES(
      9121,
      'Colorado City',
      234
);

INSERT INTO city
VALUES(
      9122,
      'Baytown',
      234
);

INSERT INTO city
VALUES(
      9123,
      'North Richland Hills',
      234
);

INSERT INTO city
VALUES(
      9124,
      'Eagle Pass',
      234
);

INSERT INTO city
VALUES(
      9125,
      'Giddings',
      234
);

INSERT INTO city
VALUES(
      9126,
      'Seabrook',
      234
);

INSERT INTO city
VALUES(
      9127,
      'Celina',
      234
);

INSERT INTO city
VALUES(
      9128,
      'Bridge City',
      234
);

INSERT INTO city
VALUES(
      9129,
      'Cibolo',
      234
);

INSERT INTO city
VALUES(
      9130,
      'Gladewater',
      234
);

INSERT INTO city
VALUES(
      9131,
      'Lindale',
      234
);

INSERT INTO city
VALUES(
      9132,
      'Balch Springs',
      234
);

INSERT INTO city
VALUES(
      9133,
      'McGregor',
      234
);

INSERT INTO city
VALUES(
      9134,
      'Lancaster',
      234
);

INSERT INTO city
VALUES(
      9135,
      'Gatesville',
      234
);

INSERT INTO city
VALUES(
      9136,
      'Pearsall',
      234
);

INSERT INTO city
VALUES(
      9137,
      'Garland',
      234
);

INSERT INTO city
VALUES(
      9138,
      'Gilmer',
      234
);

INSERT INTO city
VALUES(
      9139,
      'Robstown',
      234
);

INSERT INTO city
VALUES(
      9140,
      'Stephenville',
      234
);

INSERT INTO city
VALUES(
      9141,
      'Wake Village',
      234
);

INSERT INTO city
VALUES(
      9142,
      'La Porte',
      234
);

INSERT INTO city
VALUES(
      9143,
      'Leander',
      234
);

INSERT INTO city
VALUES(
      9144,
      'Nederland',
      234
);

INSERT INTO city
VALUES(
      9145,
      'Rowlett',
      234
);

INSERT INTO city
VALUES(
      9146,
      'Kennedale',
      234
);

INSERT INTO city
VALUES(
      9147,
      'Mineral Wells',
      234
);

INSERT INTO city
VALUES(
      9148,
      'Joshua',
      234
);

INSERT INTO city
VALUES(
      9149,
      'Beaumont',
      234
);

INSERT INTO city
VALUES(
      9150,
      'Buda',
      234
);

INSERT INTO city
VALUES(
      9151,
      'Crockett',
      234
);

INSERT INTO city
VALUES(
      9152,
      'Mount Pleasant',
      234
);

INSERT INTO city
VALUES(
      9153,
      'Krum',
      234
);

INSERT INTO city
VALUES(
      9154,
      'Richmond',
      234
);

INSERT INTO city
VALUES(
      9155,
      'El Paso',
      234
);

INSERT INTO city
VALUES(
      9156,
      'Humble',
      234
);

INSERT INTO city
VALUES(
      9157,
      'Prairie View',
      234
);

INSERT INTO city
VALUES(
      9158,
      'Denton',
      234
);

INSERT INTO city
VALUES(
      9159,
      'Harlingen',
      234
);

INSERT INTO city
VALUES(
      9160,
      'Burkburnett',
      234
);

INSERT INTO city
VALUES(
      9161,
      'Huntsville',
      234
);

INSERT INTO city
VALUES(
      9162,
      'Bulverde',
      234
);

INSERT INTO city
VALUES(
      9163,
      'Silsbee',
      234
);

INSERT INTO city
VALUES(
      9164,
      'Grapevine',
      234
);

INSERT INTO city
VALUES(
      9165,
      'Forest Hill',
      234
);

INSERT INTO city
VALUES(
      9166,
      'Edinburg',
      234
);

INSERT INTO city
VALUES(
      9167,
      'Carrizo Springs',
      234
);

INSERT INTO city
VALUES(
      9168,
      'Hutchins',
      234
);

INSERT INTO city
VALUES(
      9169,
      'Highland Park',
      234
);

INSERT INTO city
VALUES(
      9170,
      'Littlefield',
      234
);

INSERT INTO city
VALUES(
      9171,
      'Hidalgo',
      234
);

INSERT INTO city
VALUES(
      9172,
      'Helotes',
      234
);

INSERT INTO city
VALUES(
      9173,
      'Cuero',
      234
);

INSERT INTO city
VALUES(
      9174,
      'Selma',
      234
);

INSERT INTO city
VALUES(
      9175,
      'Rockwall',
      234
);

INSERT INTO city
VALUES(
      9176,
      'Midlothian',
      234
);

INSERT INTO city
VALUES(
      9177,
      'Odessa',
      234
);

INSERT INTO city
VALUES(
      9178,
      'Heath',
      234
);

INSERT INTO city
VALUES(
      9179,
      'Sweetwater',
      234
);

INSERT INTO city
VALUES(
      9180,
      'Robinson',
      234
);

INSERT INTO city
VALUES(
      9181,
      'Marble Falls',
      234
);

INSERT INTO city
VALUES(
      9182,
      'Jersey Village',
      234
);

INSERT INTO city
VALUES(
      9183,
      'Palestine',
      234
);

INSERT INTO city
VALUES(
      9184,
      'Henderson',
      234
);

INSERT INTO city
VALUES(
      9185,
      'Glenn Heights',
      234
);

INSERT INTO city
VALUES(
      9186,
      'Bedford',
      234
);

INSERT INTO city
VALUES(
      9187,
      'Keene',
      234
);

INSERT INTO city
VALUES(
      9188,
      'Bridgeport',
      234
);

INSERT INTO city
VALUES(
      9189,
      'Round Rock',
      234
);

INSERT INTO city
VALUES(
      9190,
      'Palmview',
      234
);

INSERT INTO city
VALUES(
      9191,
      'Graham',
      234
);

INSERT INTO city
VALUES(
      9192,
      'Willis',
      234
);

INSERT INTO city
VALUES(
      9193,
      'Bellaire',
      234
);

INSERT INTO city
VALUES(
      9194,
      'Dallas',
      234
);

INSERT INTO city
VALUES(
      9195,
      'Lakeway',
      234
);

INSERT INTO city
VALUES(
      9196,
      'Princeton',
      234
);

INSERT INTO city
VALUES(
      9197,
      'Corinth',
      234
);

INSERT INTO city
VALUES(
      9198,
      'Jacinto City',
      234
);

INSERT INTO city
VALUES(
      9199,
      'Donna',
      234
);

INSERT INTO city
VALUES(
      9200,
      'Roanoke',
      234
);

INSERT INTO city
VALUES(
      9201,
      'Tyler',
      234
);

INSERT INTO city
VALUES(
      9202,
      'Live Oak',
      234
);

INSERT INTO city
VALUES(
      9203,
      'University Park',
      234
);

INSERT INTO city
VALUES(
      9204,
      'Corsicana',
      234
);

INSERT INTO city
VALUES(
      9205,
      'Breckenridge',
      234
);

INSERT INTO city
VALUES(
      9206,
      'Cleburne',
      234
);

INSERT INTO city
VALUES(
      9207,
      'Bee Cave',
      234
);

INSERT INTO city
VALUES(
      9208,
      'Seguin',
      234
);

INSERT INTO city
VALUES(
      9209,
      'Brady',
      234
);

INSERT INTO city
VALUES(
      9210,
      'Slaton',
      234
);

INSERT INTO city
VALUES(
      9211,
      'Alvin',
      234
);

INSERT INTO city
VALUES(
      9212,
      'Red Oak',
      234
);

INSERT INTO city
VALUES(
      9213,
      'San Benito',
      234
);

INSERT INTO city
VALUES(
      9214,
      'Midland',
      234
);

INSERT INTO city
VALUES(
      9215,
      'Carthage',
      234
);

INSERT INTO city
VALUES(
      9216,
      'Anthony',
      234
);

INSERT INTO city
VALUES(
      9217,
      'Bryan',
      234
);

INSERT INTO city
VALUES(
      9218,
      'Terrell',
      234
);

INSERT INTO city
VALUES(
      9219,
      'Austin',
      234
);

INSERT INTO city
VALUES(
      9220,
      'Wylie',
      234
);

INSERT INTO city
VALUES(
      9221,
      'Brookshire',
      234
);

INSERT INTO city
VALUES(
      9222,
      'Texas City',
      234
);

INSERT INTO city
VALUES(
      9223,
      'Hewitt',
      234
);

INSERT INTO city
VALUES(
      9224,
      'Manor',
      234
);

INSERT INTO city
VALUES(
      9225,
      'Universal City',
      234
);

INSERT INTO city
VALUES(
      9226,
      'Los Fresnos',
      234
);

INSERT INTO city
VALUES(
      9227,
      'Andrews',
      234
);

INSERT INTO city
VALUES(
      9228,
      'Mont Belvieu',
      234
);

INSERT INTO city
VALUES(
      9229,
      'Edna',
      234
);

INSERT INTO city
VALUES(
      9230,
      'Progreso',
      234
);

INSERT INTO city
VALUES(
      9231,
      'Beeville',
      234
);

INSERT INTO city
VALUES(
      9232,
      'Cedar Park',
      234
);

INSERT INTO city
VALUES(
      9233,
      'Schertz',
      234
);

INSERT INTO city
VALUES(
      9234,
      'Kerrville',
      234
);

INSERT INTO city
VALUES(
      9235,
      'Sachse',
      234
);

INSERT INTO city
VALUES(
      9236,
      'Sealy',
      234
);

INSERT INTO city
VALUES(
      9237,
      'Kermit',
      234
);

INSERT INTO city
VALUES(
      9238,
      'Bastrop',
      234
);

INSERT INTO city
VALUES(
      9239,
      'River Oaks',
      234
);

INSERT INTO city
VALUES(
      9240,
      'Sullivan City',
      234
);

INSERT INTO city
VALUES(
      9241,
      'Everman',
      234
);

INSERT INTO city
VALUES(
      9242,
      'Lago Vista',
      234
);

INSERT INTO city
VALUES(
      9243,
      'Seagoville',
      234
);

INSERT INTO city
VALUES(
      9244,
      'Whitehouse',
      234
);

INSERT INTO city
VALUES(
      9245,
      'Rio Hondo',
      234
);

INSERT INTO city
VALUES(
      9246,
      'Weslaco',
      234
);

INSERT INTO city
VALUES(
      9247,
      'Monahans',
      234
);

INSERT INTO city
VALUES(
      9248,
      'White Settlement',
      234
);

INSERT INTO city
VALUES(
      9249,
      'Missouri City',
      234
);

INSERT INTO city
VALUES(
      9250,
      'Stafford',
      234
);

INSERT INTO city
VALUES(
      9251,
      'Gonzales',
      234
);

INSERT INTO city
VALUES(
      9252,
      'Conroe',
      234
);

INSERT INTO city
VALUES(
      9253,
      'La Marque',
      234
);

INSERT INTO city
VALUES(
      9254,
      'Katy',
      234
);

INSERT INTO city
VALUES(
      9255,
      'Borger',
      234
);

INSERT INTO city
VALUES(
      9256,
      'Liberty',
      234
);

INSERT INTO city
VALUES(
      9257,
      'Aransas Pass',
      234
);

INSERT INTO city
VALUES(
      9258,
      'Alpine',
      234
);

INSERT INTO city
VALUES(
      9259,
      'Raymondville',
      234
);

INSERT INTO city
VALUES(
      9260,
      'Brownfield',
      234
);

INSERT INTO city
VALUES(
      9261,
      'Sulphur Springs',
      234
);

INSERT INTO city
VALUES(
      9262,
      'Lufkin',
      234
);

INSERT INTO city
VALUES(
      9263,
      'Dickinson',
      234
);

INSERT INTO city
VALUES(
      9264,
      'Flower Mound',
      234
);

INSERT INTO city
VALUES(
      9265,
      'Brownwood',
      234
);

INSERT INTO city
VALUES(
      9266,
      'Horizon City',
      234
);

INSERT INTO city
VALUES(
      9267,
      'Abilene',
      234
);

INSERT INTO city
VALUES(
      9268,
      'Alton',
      234
);

INSERT INTO city
VALUES(
      9269,
      'Mercedes',
      234
);

INSERT INTO city
VALUES(
      9270,
      'Paris',
      234
);

INSERT INTO city
VALUES(
      9271,
      'Denison',
      234
);

INSERT INTO city
VALUES(
      9272,
      'Saginaw',
      234
);

INSERT INTO city
VALUES(
      9273,
      'Lockhart',
      234
);

INSERT INTO city
VALUES(
      9274,
      'Fredericksburg',
      234
);

INSERT INTO city
VALUES(
      9275,
      'Benbrook',
      234
);

INSERT INTO city
VALUES(
      9276,
      'Santa Fe',
      234
);

INSERT INTO city
VALUES(
      9277,
      'Rockdale',
      234
);

INSERT INTO city
VALUES(
      9278,
      'Port Neches',
      234
);

INSERT INTO city
VALUES(
      9279,
      'Temple',
      234
);

INSERT INTO city
VALUES(
      9280,
      'Mansfield',
      234
);

INSERT INTO city
VALUES(
      9281,
      'League City',
      234
);

INSERT INTO city
VALUES(
      9282,
      'Center',
      234
);

INSERT INTO city
VALUES(
      9283,
      'South Houston',
      234
);

INSERT INTO city
VALUES(
      9284,
      'Richardson',
      234
);

INSERT INTO city
VALUES(
      9285,
      'Ennis',
      234
);

INSERT INTO city
VALUES(
      9286,
      'Granite Shoals',
      234
);

INSERT INTO city
VALUES(
      9287,
      'Luling',
      234
);

INSERT INTO city
VALUES(
      9288,
      'Clute',
      234
);

INSERT INTO city
VALUES(
      9289,
      'Navasota',
      234
);

INSERT INTO city
VALUES(
      9290,
      'Groves',
      234
);

INSERT INTO city
VALUES(
      9291,
      'Houston',
      234
);

INSERT INTO city
VALUES(
      9292,
      'Windcrest',
      234
);

INSERT INTO city
VALUES(
      9293,
      'La Grange',
      234
);

INSERT INTO city
VALUES(
      9294,
      'Elsa',
      234
);

INSERT INTO city
VALUES(
      9295,
      'Dalhart',
      234
);

INSERT INTO city
VALUES(
      9296,
      'College Station',
      234
);

INSERT INTO city
VALUES(
      9297,
      'Grand Prairie',
      234
);

INSERT INTO city
VALUES(
      9298,
      'Victoria',
      234
);

INSERT INTO city
VALUES(
      9299,
      'Socorro',
      234
);

INSERT INTO city
VALUES(
      9300,
      'Burleson',
      234
);

INSERT INTO city
VALUES(
      9301,
      'Big Spring',
      234
);

INSERT INTO city
VALUES(
      9302,
      'Colleyville',
      234
);

INSERT INTO city
VALUES(
      9303,
      'Jasper',
      234
);

INSERT INTO city
VALUES(
      9304,
      'Gainesville',
      234
);

INSERT INTO city
VALUES(
      9305,
      'Killeen',
      234
);

INSERT INTO city
VALUES(
      9306,
      'Lake Dallas',
      234
);

INSERT INTO city
VALUES(
      9307,
      'Kilgore',
      234
);

INSERT INTO city
VALUES(
      9308,
      'Brownsville',
      234
);

INSERT INTO city
VALUES(
      9309,
      'Aledo',
      234
);

INSERT INTO city
VALUES(
      9310,
      'Greenville',
      234
);

INSERT INTO city
VALUES(
      9311,
      'Dayton',
      234
);

INSERT INTO city
VALUES(
      9312,
      'Pearland',
      234
);

INSERT INTO city
VALUES(
      9313,
      'Fair Oaks Ranch',
      234
);

INSERT INTO city
VALUES(
      9314,
      'San Antonio',
      234
);

INSERT INTO city
VALUES(
      9315,
      'Fort Stockton',
      234
);

INSERT INTO city
VALUES(
      9316,
      'Iowa Park',
      234
);

INSERT INTO city
VALUES(
      9317,
      'Copperas Cove',
      234
);

INSERT INTO city
VALUES(
      9318,
      'Fate',
      234
);

INSERT INTO city
VALUES(
      9319,
      'Converse',
      234
);

INSERT INTO city
VALUES(
      9320,
      'Hutto',
      234
);

INSERT INTO city
VALUES(
      9321,
      'Richland Hills',
      234
);

INSERT INTO city
VALUES(
      9322,
      'Jacksonville',
      234
);

INSERT INTO city
VALUES(
      9323,
      'Jennings',
      234
);

INSERT INTO city
VALUES(
      9324,
      'Breaux Bridge',
      234
);

INSERT INTO city
VALUES(
      9325,
      'Opelousas',
      234
);

INSERT INTO city
VALUES(
      9326,
      'Denham Springs',
      234
);

INSERT INTO city
VALUES(
      9327,
      'Oakdale',
      234
);

INSERT INTO city
VALUES(
      9328,
      'Westwego',
      234
);

INSERT INTO city
VALUES(
      9329,
      'Zachary',
      234
);

INSERT INTO city
VALUES(
      9330,
      'Crowley',
      234
);

INSERT INTO city
VALUES(
      9331,
      'Sulphur',
      234
);

INSERT INTO city
VALUES(
      9332,
      'Youngsville',
      234
);

INSERT INTO city
VALUES(
      9333,
      'Houma',
      234
);

INSERT INTO city
VALUES(
      9334,
      'Ponchatoula',
      234
);

INSERT INTO city
VALUES(
      9335,
      'Monroe',
      234
);

INSERT INTO city
VALUES(
      9336,
      'Carencro',
      234
);

INSERT INTO city
VALUES(
      9337,
      'Gonzales',
      234
);

INSERT INTO city
VALUES(
      9338,
      'Ruston',
      234
);

INSERT INTO city
VALUES(
      9339,
      'Covington',
      234
);

INSERT INTO city
VALUES(
      9340,
      'Jonesboro',
      234
);

INSERT INTO city
VALUES(
      9341,
      'Gretna',
      234
);

INSERT INTO city
VALUES(
      9342,
      'Ferriday',
      234
);

INSERT INTO city
VALUES(
      9343,
      'Pineville',
      234
);

INSERT INTO city
VALUES(
      9344,
      'New Roads',
      234
);

INSERT INTO city
VALUES(
      9345,
      'Shreveport',
      234
);

INSERT INTO city
VALUES(
      9346,
      'Slidell',
      234
);

INSERT INTO city
VALUES(
      9347,
      'New Orleans',
      234
);

INSERT INTO city
VALUES(
      9348,
      'Saint Gabriel',
      234
);

INSERT INTO city
VALUES(
      9349,
      'Patterson',
      234
);

INSERT INTO city
VALUES(
      9350,
      'Natchitoches',
      234
);

INSERT INTO city
VALUES(
      9351,
      'Addis',
      234
);

INSERT INTO city
VALUES(
      9352,
      'Benton',
      234
);

INSERT INTO city
VALUES(
      9353,
      'Lafayette',
      234
);

INSERT INTO city
VALUES(
      9354,
      'West Monroe',
      234
);

INSERT INTO city
VALUES(
      9355,
      'Harahan',
      234
);

INSERT INTO city
VALUES(
      9356,
      'Hammond',
      234
);

INSERT INTO city
VALUES(
      9357,
      'Springhill',
      234
);

INSERT INTO city
VALUES(
      9358,
      'Gramercy',
      234
);

INSERT INTO city
VALUES(
      9359,
      'Grambling',
      234
);

INSERT INTO city
VALUES(
      9360,
      'Rayne',
      234
);

INSERT INTO city
VALUES(
      9361,
      'Minden',
      234
);

INSERT INTO city
VALUES(
      9362,
      'Kenner',
      234
);

INSERT INTO city
VALUES(
      9363,
      'Central',
      234
);

INSERT INTO city
VALUES(
      9364,
      'Saint Martinville',
      234
);

INSERT INTO city
VALUES(
      9365,
      'Marksville',
      234
);

INSERT INTO city
VALUES(
      9366,
      'Eunice',
      234
);

INSERT INTO city
VALUES(
      9367,
      'Bogalusa',
      234
);

INSERT INTO city
VALUES(
      9368,
      'Thibodaux',
      234
);

INSERT INTO city
VALUES(
      9369,
      'Plaquemine',
      234
);

INSERT INTO city
VALUES(
      9370,
      'Ville Platte',
      234
);

INSERT INTO city
VALUES(
      9371,
      'DeRidder',
      234
);

INSERT INTO city
VALUES(
      9372,
      'Bastrop',
      234
);

INSERT INTO city
VALUES(
      9373,
      'Mansfield',
      234
);

INSERT INTO city
VALUES(
      9374,
      'Winnsboro',
      234
);

INSERT INTO city
VALUES(
      9375,
      'Alexandria',
      234
);

INSERT INTO city
VALUES(
      9376,
      'Broussard',
      234
);

INSERT INTO city
VALUES(
      9377,
      'Baker',
      234
);

INSERT INTO city
VALUES(
      9378,
      'Mandeville',
      234
);

INSERT INTO city
VALUES(
      9379,
      'Donaldsonville',
      234
);

INSERT INTO city
VALUES(
      9380,
      'Baton Rouge',
      234
);

INSERT INTO city
VALUES(
      9381,
      'Abbeville',
      234
);

INSERT INTO city
VALUES(
      9382,
      'Walker',
      234
);

INSERT INTO city
VALUES(
      9383,
      'Tallulah',
      234
);

INSERT INTO city
VALUES(
      9384,
      'Morgan City',
      234
);

INSERT INTO city
VALUES(
      9385,
      'Port Allen',
      234
);

INSERT INTO city
VALUES(
      9386,
      'Jeanerette',
      234
);

INSERT INTO city
VALUES(
      9387,
      'Leesville',
      234
);

INSERT INTO city
VALUES(
      9388,
      'Lake Charles',
      234
);

INSERT INTO city
VALUES(
      9389,
      'New Iberia',
      234
);

INSERT INTO city
VALUES(
      9390,
      'Franklin',
      234
);

INSERT INTO city
VALUES(
      9391,
      'Bossier City',
      234
);

INSERT INTO city
VALUES(
      9392,
      'Scott',
      234
);

INSERT INTO city
VALUES(
      9393,
      'Shelby',
      234
);

INSERT INTO city
VALUES(
      9394,
      'Roanoke Rapids',
      234
);

INSERT INTO city
VALUES(
      9395,
      'Marvin',
      234
);

INSERT INTO city
VALUES(
      9396,
      'Wake Forest',
      234
);

INSERT INTO city
VALUES(
      9397,
      'New Bern',
      234
);

INSERT INTO city
VALUES(
      9398,
      'Burlington',
      234
);

INSERT INTO city
VALUES(
      9399,
      'Hamlet',
      234
);

INSERT INTO city
VALUES(
      9400,
      'Black Mountain',
      234
);

INSERT INTO city
VALUES(
      9401,
      'Waynesville',
      234
);

INSERT INTO city
VALUES(
      9402,
      'Swansboro',
      234
);

INSERT INTO city
VALUES(
      9403,
      'Davidson',
      234
);

INSERT INTO city
VALUES(
      9404,
      'Mount Holly',
      234
);

INSERT INTO city
VALUES(
      9405,
      'Forest City',
      234
);

INSERT INTO city
VALUES(
      9406,
      'Elizabeth City',
      234
);

INSERT INTO city
VALUES(
      9407,
      'Roxboro',
      234
);

INSERT INTO city
VALUES(
      9408,
      'Weddington',
      234
);

INSERT INTO city
VALUES(
      9409,
      'Oak Ridge',
      234
);

INSERT INTO city
VALUES(
      9410,
      'Wesley Chapel',
      234
);

INSERT INTO city
VALUES(
      9411,
      'Zebulon',
      234
);

INSERT INTO city
VALUES(
      9412,
      'Williamston',
      234
);

INSERT INTO city
VALUES(
      9413,
      'Laurinburg',
      234
);

INSERT INTO city
VALUES(
      9414,
      'Clayton',
      234
);

INSERT INTO city
VALUES(
      9415,
      'Summerfield',
      234
);

INSERT INTO city
VALUES(
      9416,
      'Whiteville',
      234
);

INSERT INTO city
VALUES(
      9417,
      'King',
      234
);

INSERT INTO city
VALUES(
      9418,
      'Salisbury',
      234
);

INSERT INTO city
VALUES(
      9419,
      'Monroe',
      234
);

INSERT INTO city
VALUES(
      9420,
      'Pinehurst',
      234
);

INSERT INTO city
VALUES(
      9421,
      'Albemarle',
      234
);

INSERT INTO city
VALUES(
      9422,
      'Smithfield',
      234
);

INSERT INTO city
VALUES(
      9423,
      'Trinity',
      234
);

INSERT INTO city
VALUES(
      9424,
      'Conover',
      234
);

INSERT INTO city
VALUES(
      9425,
      'Winterville',
      234
);

INSERT INTO city
VALUES(
      9426,
      'Hickory',
      234
);

INSERT INTO city
VALUES(
      9427,
      'Charlotte',
      234
);

INSERT INTO city
VALUES(
      9428,
      'Mint Hill',
      234
);

INSERT INTO city
VALUES(
      9429,
      'Newton',
      234
);

INSERT INTO city
VALUES(
      9430,
      'Rolesville',
      234
);

INSERT INTO city
VALUES(
      9431,
      'Archer Lodge',
      234
);

INSERT INTO city
VALUES(
      9432,
      'Marion',
      234
);

INSERT INTO city
VALUES(
      9433,
      'Pineville',
      234
);

INSERT INTO city
VALUES(
      9434,
      'Stokesdale',
      234
);

INSERT INTO city
VALUES(
      9435,
      'Tabor City',
      234
);

INSERT INTO city
VALUES(
      9436,
      'Clinton',
      234
);

INSERT INTO city
VALUES(
      9437,
      'Thomasville',
      234
);

INSERT INTO city
VALUES(
      9438,
      'Butner',
      234
);

INSERT INTO city
VALUES(
      9439,
      'Elon',
      234
);

INSERT INTO city
VALUES(
      9440,
      'Raleigh',
      234
);

INSERT INTO city
VALUES(
      9441,
      'Sanford',
      234
);

INSERT INTO city
VALUES(
      9442,
      'Selma',
      234
);

INSERT INTO city
VALUES(
      9443,
      'Carolina Beach',
      234
);

INSERT INTO city
VALUES(
      9444,
      'Asheboro',
      234
);

INSERT INTO city
VALUES(
      9445,
      'Holly Springs',
      234
);

INSERT INTO city
VALUES(
      9446,
      'Matthews',
      234
);

INSERT INTO city
VALUES(
      9447,
      'Havelock',
      234
);

INSERT INTO city
VALUES(
      9448,
      'Manteo',
      234
);

INSERT INTO city
VALUES(
      9449,
      'Woodfin',
      234
);

INSERT INTO city
VALUES(
      9450,
      'Rocky Mount',
      234
);

INSERT INTO city
VALUES(
      9451,
      'Concord',
      234
);

INSERT INTO city
VALUES(
      9452,
      'Kill Devil Hills',
      234
);

INSERT INTO city
VALUES(
      9453,
      'Hendersonville',
      234
);

INSERT INTO city
VALUES(
      9454,
      'Fletcher',
      234
);

INSERT INTO city
VALUES(
      9455,
      'Angier',
      234
);

INSERT INTO city
VALUES(
      9456,
      'Mebane',
      234
);

INSERT INTO city
VALUES(
      9457,
      'Boone',
      234
);

INSERT INTO city
VALUES(
      9458,
      'Kannapolis',
      234
);

INSERT INTO city
VALUES(
      9459,
      'Leland',
      234
);

INSERT INTO city
VALUES(
      9460,
      'Goldsboro',
      234
);

INSERT INTO city
VALUES(
      9461,
      'Chapel Hill',
      234
);

INSERT INTO city
VALUES(
      9462,
      'Wadesboro',
      234
);

INSERT INTO city
VALUES(
      9463,
      'Wilson',
      234
);

INSERT INTO city
VALUES(
      9464,
      'Henderson',
      234
);

INSERT INTO city
VALUES(
      9465,
      'Dunn',
      234
);

INSERT INTO city
VALUES(
      9466,
      'Pembroke',
      234
);

INSERT INTO city
VALUES(
      9467,
      'Lexington',
      234
);

INSERT INTO city
VALUES(
      9468,
      'Washington',
      234
);

INSERT INTO city
VALUES(
      9469,
      'Knightdale',
      234
);

INSERT INTO city
VALUES(
      9470,
      'Brevard',
      234
);

INSERT INTO city
VALUES(
      9471,
      'Mount Airy',
      234
);

INSERT INTO city
VALUES(
      9472,
      'Taylorsville',
      234
);

INSERT INTO city
VALUES(
      9473,
      'Gibsonville',
      234
);

INSERT INTO city
VALUES(
      9474,
      'Statesville',
      234
);

INSERT INTO city
VALUES(
      9475,
      'Cornelius',
      234
);

INSERT INTO city
VALUES(
      9476,
      'Aberdeen',
      234
);

INSERT INTO city
VALUES(
      9477,
      'Lenoir',
      234
);

INSERT INTO city
VALUES(
      9478,
      'Mills River',
      234
);

INSERT INTO city
VALUES(
      9479,
      'Cary',
      234
);

INSERT INTO city
VALUES(
      9480,
      'Stallings',
      234
);

INSERT INTO city
VALUES(
      9481,
      'Fayetteville',
      234
);

INSERT INTO city
VALUES(
      9482,
      'Wendell',
      234
);

INSERT INTO city
VALUES(
      9483,
      'Garner',
      234
);

INSERT INTO city
VALUES(
      9484,
      'Kinston',
      234
);

INSERT INTO city
VALUES(
      9485,
      'Morganton',
      234
);

INSERT INTO city
VALUES(
      9486,
      'Southern Pines',
      234
);

INSERT INTO city
VALUES(
      9487,
      'Nashville',
      234
);

INSERT INTO city
VALUES(
      9488,
      'Harrisburg',
      234
);

INSERT INTO city
VALUES(
      9489,
      'Oxford',
      234
);

INSERT INTO city
VALUES(
      9490,
      'Gastonia',
      234
);

INSERT INTO city
VALUES(
      9491,
      'Reidsville',
      234
);

INSERT INTO city
VALUES(
      9492,
      'Graham',
      234
);

INSERT INTO city
VALUES(
      9493,
      'Unionville',
      234
);

INSERT INTO city
VALUES(
      9494,
      'Mount Olive',
      234
);

INSERT INTO city
VALUES(
      9495,
      'North Wilkesboro',
      234
);

INSERT INTO city
VALUES(
      9496,
      'Fuquay-Varina',
      234
);

INSERT INTO city
VALUES(
      9497,
      'Lumberton',
      234
);

INSERT INTO city
VALUES(
      9498,
      'Indian Trail',
      234
);

INSERT INTO city
VALUES(
      9499,
      'Archdale',
      234
);

INSERT INTO city
VALUES(
      9500,
      'Cherryville',
      234
);

INSERT INTO city
VALUES(
      9501,
      'Winston-Salem',
      234
);

INSERT INTO city
VALUES(
      9502,
      'Waxhaw',
      234
);

INSERT INTO city
VALUES(
      9503,
      'Belmont',
      234
);

INSERT INTO city
VALUES(
      9504,
      'Durham',
      234
);

INSERT INTO city
VALUES(
      9505,
      'Hillsborough',
      234
);

INSERT INTO city
VALUES(
      9506,
      'Clemmons',
      234
);

INSERT INTO city
VALUES(
      9507,
      'Eden',
      234
);

INSERT INTO city
VALUES(
      9508,
      'Mooresville',
      234
);

INSERT INTO city
VALUES(
      9509,
      'Morrisville',
      234
);

INSERT INTO city
VALUES(
      9510,
      'High Point',
      234
);

INSERT INTO city
VALUES(
      9511,
      'Hope Mills',
      234
);

INSERT INTO city
VALUES(
      9512,
      'Tarboro',
      234
);

INSERT INTO city
VALUES(
      9513,
      'Walkertown',
      234
);

INSERT INTO city
VALUES(
      9514,
      'Spring Lake',
      234
);

INSERT INTO city
VALUES(
      9515,
      'Huntersville',
      234
);

INSERT INTO city
VALUES(
      9516,
      'Greenville',
      234
);

INSERT INTO city
VALUES(
      9517,
      'Ayden',
      234
);

INSERT INTO city
VALUES(
      9518,
      'Asheville',
      234
);

INSERT INTO city
VALUES(
      9519,
      'Sawmills',
      234
);

INSERT INTO city
VALUES(
      9520,
      'Franklin',
      234
);

INSERT INTO city
VALUES(
      9521,
      'Greensboro',
      234
);

INSERT INTO city
VALUES(
      9522,
      'Morehead City',
      234
);

INSERT INTO city
VALUES(
      9523,
      'Apex',
      234
);

INSERT INTO city
VALUES(
      9524,
      'Kernersville',
      234
);

INSERT INTO city
VALUES(
      9525,
      'Rockingham',
      234
);

INSERT INTO city
VALUES(
      9526,
      'Kings Mountain',
      234
);

INSERT INTO city
VALUES(
      9527,
      'Lewisville',
      234
);

INSERT INTO city
VALUES(
      9528,
      'Oak Island',
      234
);

INSERT INTO city
VALUES(
      9529,
      'Jacksonville',
      234
);

INSERT INTO city
VALUES(
      9530,
      'Siler City',
      234
);

INSERT INTO city
VALUES(
      9531,
      'Carrboro',
      234
);

INSERT INTO city
VALUES(
      9532,
      'Wilmington',
      234
);

INSERT INTO city
VALUES(
      9533,
      'Mocksville',
      234
);

INSERT INTO city
VALUES(
      9534,
      'Elkin',
      234
);

INSERT INTO city
VALUES(
      9535,
      'Lincolnton',
      234
);

INSERT INTO city
VALUES(
      9536,
      'Bessemer City',
      234
);

INSERT INTO city
VALUES(
      9537,
      'Minot',
      234
);

INSERT INTO city
VALUES(
      9538,
      'Bismarck',
      234
);

INSERT INTO city
VALUES(
      9539,
      'Mandan',
      234
);

INSERT INTO city
VALUES(
      9540,
      'Jamestown',
      234
);

INSERT INTO city
VALUES(
      9541,
      'Watford City',
      234
);

INSERT INTO city
VALUES(
      9542,
      'Dickinson',
      234
);

INSERT INTO city
VALUES(
      9543,
      'Grand Forks',
      234
);

INSERT INTO city
VALUES(
      9544,
      'Valley City',
      234
);

INSERT INTO city
VALUES(
      9545,
      'Williston',
      234
);

INSERT INTO city
VALUES(
      9546,
      'West Fargo',
      234
);

INSERT INTO city
VALUES(
      9547,
      'Fargo',
      234
);

INSERT INTO city
VALUES(
      9548,
      'Wahpeton',
      234
);

INSERT INTO city
VALUES(
      9549,
      'Chadron',
      234
);

INSERT INTO city
VALUES(
      9550,
      'Wayne',
      234
);

INSERT INTO city
VALUES(
      9551,
      'Ralston',
      234
);

INSERT INTO city
VALUES(
      9552,
      'Fremont',
      234
);

INSERT INTO city
VALUES(
      9553,
      'Kearney',
      234
);

INSERT INTO city
VALUES(
      9554,
      'Plattsmouth',
      234
);

INSERT INTO city
VALUES(
      9555,
      'Grand Island',
      234
);

INSERT INTO city
VALUES(
      9556,
      'Beatrice',
      234
);

INSERT INTO city
VALUES(
      9557,
      'McCook',
      234
);

INSERT INTO city
VALUES(
      9558,
      'York',
      234
);

INSERT INTO city
VALUES(
      9559,
      'Columbus',
      234
);

INSERT INTO city
VALUES(
      9560,
      'Scottsbluff',
      234
);

INSERT INTO city
VALUES(
      9561,
      'Seward',
      234
);

INSERT INTO city
VALUES(
      9562,
      'Gretna',
      234
);

INSERT INTO city
VALUES(
      9563,
      'Gering',
      234
);

INSERT INTO city
VALUES(
      9564,
      'North Platte',
      234
);

INSERT INTO city
VALUES(
      9565,
      'Hastings',
      234
);

INSERT INTO city
VALUES(
      9566,
      'Schuyler',
      234
);

INSERT INTO city
VALUES(
      9567,
      'Lincoln',
      234
);

INSERT INTO city
VALUES(
      9568,
      'Lexington',
      234
);

INSERT INTO city
VALUES(
      9569,
      'Alliance',
      234
);

INSERT INTO city
VALUES(
      9570,
      'Blair',
      234
);

INSERT INTO city
VALUES(
      9571,
      'La Vista',
      234
);

INSERT INTO city
VALUES(
      9572,
      'Sidney',
      234
);

INSERT INTO city
VALUES(
      9573,
      'Norfolk',
      234
);

INSERT INTO city
VALUES(
      9574,
      'Nebraska City',
      234
);

INSERT INTO city
VALUES(
      9575,
      'Papillion',
      234
);

INSERT INTO city
VALUES(
      9576,
      'Bellevue',
      234
);

INSERT INTO city
VALUES(
      9577,
      'South Sioux City',
      234
);

INSERT INTO city
VALUES(
      9578,
      'Holdrege',
      234
);

INSERT INTO city
VALUES(
      9579,
      'Omaha',
      234
);

INSERT INTO city
VALUES(
      9580,
      'Crete',
      234
);

INSERT INTO city
VALUES(
      9581,
      'Dyersburg',
      234
);

INSERT INTO city
VALUES(
      9582,
      'Jonesborough',
      234
);

INSERT INTO city
VALUES(
      9583,
      'Fayetteville',
      234
);

INSERT INTO city
VALUES(
      9584,
      'Columbia',
      234
);

INSERT INTO city
VALUES(
      9585,
      'Lakeland',
      234
);

INSERT INTO city
VALUES(
      9586,
      'Dandridge',
      234
);

INSERT INTO city
VALUES(
      9587,
      'Red Bank',
      234
);

INSERT INTO city
VALUES(
      9588,
      'La Vergne',
      234
);

INSERT INTO city
VALUES(
      9589,
      'Winchester',
      234
);

INSERT INTO city
VALUES(
      9590,
      'Oak Ridge',
      234
);

INSERT INTO city
VALUES(
      9591,
      'Elizabethton',
      234
);

INSERT INTO city
VALUES(
      9592,
      'Millersville',
      234
);

INSERT INTO city
VALUES(
      9593,
      'Church Hill',
      234
);

INSERT INTO city
VALUES(
      9594,
      'Memphis',
      234
);

INSERT INTO city
VALUES(
      9595,
      'East Ridge',
      234
);

INSERT INTO city
VALUES(
      9596,
      'Lebanon',
      234
);

INSERT INTO city
VALUES(
      9597,
      'Gallatin',
      234
);

INSERT INTO city
VALUES(
      9598,
      'Loudon',
      234
);

INSERT INTO city
VALUES(
      9599,
      'Chattanooga',
      234
);

INSERT INTO city
VALUES(
      9600,
      'Spring Hill',
      234
);

INSERT INTO city
VALUES(
      9601,
      'Martin',
      234
);

INSERT INTO city
VALUES(
      9602,
      'Sevierville',
      234
);

INSERT INTO city
VALUES(
      9603,
      'Lenoir City',
      234
);

INSERT INTO city
VALUES(
      9604,
      'Jefferson City',
      234
);

INSERT INTO city
VALUES(
      9605,
      'Arlington',
      234
);

INSERT INTO city
VALUES(
      9606,
      'LaFollette',
      234
);

INSERT INTO city
VALUES(
      9607,
      'Covington',
      234
);

INSERT INTO city
VALUES(
      9608,
      'Greeneville',
      234
);

INSERT INTO city
VALUES(
      9609,
      'Fairview',
      234
);

INSERT INTO city
VALUES(
      9610,
      'Savannah',
      234
);

INSERT INTO city
VALUES(
      9611,
      'Milan',
      234
);

INSERT INTO city
VALUES(
      9612,
      'Munford',
      234
);

INSERT INTO city
VALUES(
      9613,
      'Cookeville',
      234
);

INSERT INTO city
VALUES(
      9614,
      'Alcoa',
      234
);

INSERT INTO city
VALUES(
      9615,
      'Clinton',
      234
);

INSERT INTO city
VALUES(
      9616,
      'Crossville',
      234
);

INSERT INTO city
VALUES(
      9617,
      'Bartlett',
      234
);

INSERT INTO city
VALUES(
      9618,
      'Millington',
      234
);

INSERT INTO city
VALUES(
      9619,
      'Hendersonville',
      234
);

INSERT INTO city
VALUES(
      9620,
      'Pigeon Forge',
      234
);

INSERT INTO city
VALUES(
      9621,
      'McMinnville',
      234
);

INSERT INTO city
VALUES(
      9622,
      'Mount Juliet',
      234
);

INSERT INTO city
VALUES(
      9623,
      'Kingston',
      234
);

INSERT INTO city
VALUES(
      9624,
      'Union City',
      234
);

INSERT INTO city
VALUES(
      9625,
      'Paris',
      234
);

INSERT INTO city
VALUES(
      9626,
      'Clarksville',
      234
);

INSERT INTO city
VALUES(
      9627,
      'Morristown',
      234
);

INSERT INTO city
VALUES(
      9628,
      'Henderson',
      234
);

INSERT INTO city
VALUES(
      9629,
      'Dickson',
      234
);

INSERT INTO city
VALUES(
      9630,
      'Atoka',
      234
);

INSERT INTO city
VALUES(
      9631,
      'Lexington',
      234
);

INSERT INTO city
VALUES(
      9632,
      'Newport',
      234
);

INSERT INTO city
VALUES(
      9633,
      'Humboldt',
      234
);

INSERT INTO city
VALUES(
      9634,
      'Manchester',
      234
);

INSERT INTO city
VALUES(
      9635,
      'Shelbyville',
      234
);

INSERT INTO city
VALUES(
      9636,
      'Jackson',
      234
);

INSERT INTO city
VALUES(
      9637,
      'Sparta',
      234
);

INSERT INTO city
VALUES(
      9638,
      'Knoxville',
      234
);

INSERT INTO city
VALUES(
      9639,
      'Tullahoma',
      234
);

INSERT INTO city
VALUES(
      9640,
      'Greenbrier',
      234
);

INSERT INTO city
VALUES(
      9641,
      'Soddy-Daisy',
      234
);

INSERT INTO city
VALUES(
      9642,
      'Mount Carmel',
      234
);

INSERT INTO city
VALUES(
      9643,
      'Erwin',
      234
);

INSERT INTO city
VALUES(
      9644,
      'Thompsonas Station',
      234
);

INSERT INTO city
VALUES(
      9645,
      'Madisonville',
      234
);

INSERT INTO city
VALUES(
      9646,
      'Harriman',
      234
);

INSERT INTO city
VALUES(
      9647,
      'Johnson City',
      234
);

INSERT INTO city
VALUES(
      9648,
      'Germantown',
      234
);

INSERT INTO city
VALUES(
      9649,
      'Farragut',
      234
);

INSERT INTO city
VALUES(
      9650,
      'Cleveland',
      234
);

INSERT INTO city
VALUES(
      9651,
      'Athens',
      234
);

INSERT INTO city
VALUES(
      9652,
      'Pulaski',
      234
);

INSERT INTO city
VALUES(
      9653,
      'Nashville',
      234
);

INSERT INTO city
VALUES(
      9654,
      'Rogersville',
      234
);

INSERT INTO city
VALUES(
      9655,
      'Nolensville',
      234
);

INSERT INTO city
VALUES(
      9656,
      'Bristol',
      234
);

INSERT INTO city
VALUES(
      9657,
      'Smyrna',
      234
);

INSERT INTO city
VALUES(
      9658,
      'Portland',
      234
);

INSERT INTO city
VALUES(
      9659,
      'White House',
      234
);

INSERT INTO city
VALUES(
      9660,
      'Rockwood',
      234
);

INSERT INTO city
VALUES(
      9661,
      'Collierville',
      234
);

INSERT INTO city
VALUES(
      9662,
      'Lawrenceburg',
      234
);

INSERT INTO city
VALUES(
      9663,
      'South Pittsburg',
      234
);

INSERT INTO city
VALUES(
      9664,
      'Kingsport',
      234
);

INSERT INTO city
VALUES(
      9665,
      'Murfreesboro',
      234
);

INSERT INTO city
VALUES(
      9666,
      'Brentwood',
      234
);

INSERT INTO city
VALUES(
      9667,
      'Ripley',
      234
);

INSERT INTO city
VALUES(
      9668,
      'Brownsville',
      234
);

INSERT INTO city
VALUES(
      9669,
      'Lafayette',
      234
);

INSERT INTO city
VALUES(
      9670,
      'Dayton',
      234
);

INSERT INTO city
VALUES(
      9671,
      'Maryville',
      234
);

INSERT INTO city
VALUES(
      9672,
      'Franklin',
      234
);

INSERT INTO city
VALUES(
      9673,
      'Goodlettsville',
      234
);

INSERT INTO city
VALUES(
      9674,
      'Sweetwater',
      234
);

INSERT INTO city
VALUES(
      9675,
      'McKenzie',
      234
);

INSERT INTO city
VALUES(
      9676,
      'Springfield',
      234
);

INSERT INTO city
VALUES(
      9677,
      'Collegedale',
      234
);

INSERT INTO city
VALUES(
      9678,
      'Signal Mountain',
      234
);

INSERT INTO city
VALUES(
      9679,
      'Lewisburg',
      234
);

INSERT INTO city
VALUES(
      9680,
      'Oakland',
      234
);

INSERT INTO city
VALUES(
      9681,
      'Malverne',
      234
);

INSERT INTO city
VALUES(
      9682,
      'Valley Stream',
      234
);

INSERT INTO city
VALUES(
      9683,
      'Great Neck Plaza',
      234
);

INSERT INTO city
VALUES(
      9684,
      'Clifton Springs',
      234
);

INSERT INTO city
VALUES(
      9685,
      'Canton',
      234
);

INSERT INTO city
VALUES(
      9686,
      'Plattsburgh',
      234
);

INSERT INTO city
VALUES(
      9687,
      'Goshen',
      234
);

INSERT INTO city
VALUES(
      9688,
      'Syracuse',
      234
);

INSERT INTO city
VALUES(
      9689,
      'Port Jervis',
      234
);

INSERT INTO city
VALUES(
      9690,
      'Williston Park',
      234
);

INSERT INTO city
VALUES(
      9691,
      'New Hempstead',
      234
);

INSERT INTO city
VALUES(
      9692,
      'Port Chester',
      234
);

INSERT INTO city
VALUES(
      9693,
      'Canandaigua',
      234
);

INSERT INTO city
VALUES(
      9694,
      'Lockport',
      234
);

INSERT INTO city
VALUES(
      9695,
      'Saratoga Springs',
      234
);

INSERT INTO city
VALUES(
      9696,
      'Rome',
      234
);

INSERT INTO city
VALUES(
      9697,
      'Penn Yan',
      234
);

INSERT INTO city
VALUES(
      9698,
      'Mechanicville',
      234
);

INSERT INTO city
VALUES(
      9699,
      'Corning',
      234
);

INSERT INTO city
VALUES(
      9700,
      'Cobleskill',
      234
);

INSERT INTO city
VALUES(
      9701,
      'Wappingers Falls',
      234
);

INSERT INTO city
VALUES(
      9702,
      'Colonie',
      234
);

INSERT INTO city
VALUES(
      9703,
      'Airmont',
      234
);

INSERT INTO city
VALUES(
      9704,
      'North Syracuse',
      234
);

INSERT INTO city
VALUES(
      9705,
      'Ellenville',
      234
);

INSERT INTO city
VALUES(
      9706,
      'Albion',
      234
);

INSERT INTO city
VALUES(
      9707,
      'Fredonia',
      234
);

INSERT INTO city
VALUES(
      9708,
      'Bath',
      234
);

INSERT INTO city
VALUES(
      9709,
      'Pelham Manor',
      234
);

INSERT INTO city
VALUES(
      9710,
      'Utica',
      234
);

INSERT INTO city
VALUES(
      9711,
      'Lake Grove',
      234
);

INSERT INTO city
VALUES(
      9712,
      'North Hills',
      234
);

INSERT INTO city
VALUES(
      9713,
      'Suffern',
      234
);

INSERT INTO city
VALUES(
      9714,
      'New Rochelle',
      234
);

INSERT INTO city
VALUES(
      9715,
      'Newark',
      234
);

INSERT INTO city
VALUES(
      9716,
      'Warwick',
      234
);

INSERT INTO city
VALUES(
      9717,
      'Chestnut Ridge',
      234
);

INSERT INTO city
VALUES(
      9718,
      'Dobbs Ferry',
      234
);

INSERT INTO city
VALUES(
      9719,
      'Monticello',
      234
);

INSERT INTO city
VALUES(
      9720,
      'Ossining',
      234
);

INSERT INTO city
VALUES(
      9721,
      'Hamburg',
      234
);

INSERT INTO city
VALUES(
      9722,
      'Middletown',
      234
);

INSERT INTO city
VALUES(
      9723,
      'Lindenhurst',
      234
);

INSERT INTO city
VALUES(
      9724,
      'Geneseo',
      234
);

INSERT INTO city
VALUES(
      9725,
      'Lynbrook',
      234
);

INSERT INTO city
VALUES(
      9726,
      'Schenectady',
      234
);

INSERT INTO city
VALUES(
      9727,
      'Buffalo',
      234
);

INSERT INTO city
VALUES(
      9728,
      'Walden',
      234
);

INSERT INTO city
VALUES(
      9729,
      'Tarrytown',
      234
);

INSERT INTO city
VALUES(
      9730,
      'Queens',
      234
);

INSERT INTO city
VALUES(
      9731,
      'Wesley Hills',
      234
);

INSERT INTO city
VALUES(
      9732,
      'Glens Falls',
      234
);

INSERT INTO city
VALUES(
      9733,
      'Freeport',
      234
);

INSERT INTO city
VALUES(
      9734,
      'Hastings-on-Hudson',
      234
);

INSERT INTO city
VALUES(
      9735,
      'Mastic Beach',
      234
);

INSERT INTO city
VALUES(
      9736,
      'Horseheads',
      234
);

INSERT INTO city
VALUES(
      9737,
      'Pelham',
      234
);

INSERT INTO city
VALUES(
      9738,
      'Malone',
      234
);

INSERT INTO city
VALUES(
      9739,
      'Red Hook',
      234
);

INSERT INTO city
VALUES(
      9740,
      'Cohoes',
      234
);

INSERT INTO city
VALUES(
      9741,
      'Batavia',
      234
);

INSERT INTO city
VALUES(
      9742,
      'Pleasantville',
      234
);

INSERT INTO city
VALUES(
      9743,
      'White Plains',
      234
);

INSERT INTO city
VALUES(
      9744,
      'Bronxville',
      234
);

INSERT INTO city
VALUES(
      9745,
      'Massapequa Park',
      234
);

INSERT INTO city
VALUES(
      9746,
      'Bayville',
      234
);

INSERT INTO city
VALUES(
      9747,
      'Watertown',
      234
);

INSERT INTO city
VALUES(
      9748,
      'Salamanca',
      234
);

INSERT INTO city
VALUES(
      9749,
      'Mount Kisco',
      234
);

INSERT INTO city
VALUES(
      9750,
      'Medina',
      234
);

INSERT INTO city
VALUES(
      9751,
      'Elmsford',
      234
);

INSERT INTO city
VALUES(
      9752,
      'Rye Brook',
      234
);

INSERT INTO city
VALUES(
      9753,
      'Coxsackie',
      234
);

INSERT INTO city
VALUES(
      9754,
      'Westbury',
      234
);

INSERT INTO city
VALUES(
      9755,
      'Northport',
      234
);

INSERT INTO city
VALUES(
      9756,
      'Catskill',
      234
);

INSERT INTO city
VALUES(
      9757,
      'Auburn',
      234
);

INSERT INTO city
VALUES(
      9758,
      'Saranac Lake',
      234
);

INSERT INTO city
VALUES(
      9759,
      'Newburgh',
      234
);

INSERT INTO city
VALUES(
      9760,
      'New Square',
      234
);

INSERT INTO city
VALUES(
      9761,
      'Potsdam',
      234
);

INSERT INTO city
VALUES(
      9762,
      'Sea Cliff',
      234
);

INSERT INTO city
VALUES(
      9763,
      'Floral Park',
      234
);

INSERT INTO city
VALUES(
      9764,
      'East Hills',
      234
);

INSERT INTO city
VALUES(
      9765,
      'Amityville',
      234
);

INSERT INTO city
VALUES(
      9766,
      'Williamsville',
      234
);

INSERT INTO city
VALUES(
      9767,
      'Rockville Centre',
      234
);

INSERT INTO city
VALUES(
      9768,
      'Croton-on-Hudson',
      234
);

INSERT INTO city
VALUES(
      9769,
      'Kingston',
      234
);

INSERT INTO city
VALUES(
      9770,
      'Elmira',
      234
);

INSERT INTO city
VALUES(
      9771,
      'Monroe',
      234
);

INSERT INTO city
VALUES(
      9772,
      'Amsterdam',
      234
);

INSERT INTO city
VALUES(
      9773,
      'Peekskill',
      234
);

INSERT INTO city
VALUES(
      9774,
      'Ogdensburg',
      234
);

INSERT INTO city
VALUES(
      9775,
      'Hornell',
      234
);

INSERT INTO city
VALUES(
      9776,
      'Herkimer',
      234
);

INSERT INTO city
VALUES(
      9777,
      'New Paltz',
      234
);

INSERT INTO city
VALUES(
      9778,
      'Albany',
      234
);

INSERT INTO city
VALUES(
      9779,
      'Kiryas Joel',
      234
);

INSERT INTO city
VALUES(
      9780,
      'Olean',
      234
);

INSERT INTO city
VALUES(
      9781,
      'Farmingdale',
      234
);

INSERT INTO city
VALUES(
      9782,
      'Niagara Falls',
      234
);

INSERT INTO city
VALUES(
      9783,
      'Lackawanna',
      234
);

INSERT INTO city
VALUES(
      9784,
      'West Haverstraw',
      234
);

INSERT INTO city
VALUES(
      9785,
      'Endicott',
      234
);

INSERT INTO city
VALUES(
      9786,
      'Rochester',
      234
);

INSERT INTO city
VALUES(
      9787,
      'Ilion',
      234
);

INSERT INTO city
VALUES(
      9788,
      'Manorhaven',
      234
);

INSERT INTO city
VALUES(
      9789,
      'Babylon',
      234
);

INSERT INTO city
VALUES(
      9790,
      'Watervliet',
      234
);

INSERT INTO city
VALUES(
      9791,
      'Hempstead',
      234
);

INSERT INTO city
VALUES(
      9792,
      'Ravena',
      234
);

INSERT INTO city
VALUES(
      9793,
      'New York',
      234
);

INSERT INTO city
VALUES(
      9794,
      'Scarsdale',
      234
);

INSERT INTO city
VALUES(
      9795,
      'Bronx',
      234
);

INSERT INTO city
VALUES(
      9796,
      'Fulton',
      234
);

INSERT INTO city
VALUES(
      9797,
      'Briarcliff Manor',
      234
);

INSERT INTO city
VALUES(
      9798,
      'Irvington',
      234
);

INSERT INTO city
VALUES(
      9799,
      'Washingtonville',
      234
);

INSERT INTO city
VALUES(
      9800,
      'Poughkeepsie',
      234
);

INSERT INTO city
VALUES(
      9801,
      'Mineola',
      234
);

INSERT INTO city
VALUES(
      9802,
      'Patchogue',
      234
);

INSERT INTO city
VALUES(
      9803,
      'Johnson City',
      234
);

INSERT INTO city
VALUES(
      9804,
      'Brockport',
      234
);

INSERT INTO city
VALUES(
      9805,
      'Tonawanda',
      234
);

INSERT INTO city
VALUES(
      9806,
      'Mamaroneck',
      234
);

INSERT INTO city
VALUES(
      9807,
      'East Rochester',
      234
);

INSERT INTO city
VALUES(
      9808,
      'Depew',
      234
);

INSERT INTO city
VALUES(
      9809,
      'Rye',
      234
);

INSERT INTO city
VALUES(
      9810,
      'Haverstraw',
      234
);

INSERT INTO city
VALUES(
      9811,
      'Harrison',
      234
);

INSERT INTO city
VALUES(
      9812,
      'Cortland',
      234
);

INSERT INTO city
VALUES(
      9813,
      'Norwich',
      234
);

INSERT INTO city
VALUES(
      9814,
      'Hudson Falls',
      234
);

INSERT INTO city
VALUES(
      9815,
      'Honeoye Falls',
      234
);

INSERT INTO city
VALUES(
      9816,
      'Garden City',
      234
);

INSERT INTO city
VALUES(
      9817,
      'Port Jefferson',
      234
);

INSERT INTO city
VALUES(
      9818,
      'Baldwinsville',
      234
);

INSERT INTO city
VALUES(
      9819,
      'Ballston Spa',
      234
);

INSERT INTO city
VALUES(
      9820,
      'Fairport',
      234
);

INSERT INTO city
VALUES(
      9821,
      'Oswego',
      234
);

INSERT INTO city
VALUES(
      9822,
      'Woodbury',
      234
);

INSERT INTO city
VALUES(
      9823,
      'Hilton',
      234
);

INSERT INTO city
VALUES(
      9824,
      'North Tonawanda',
      234
);

INSERT INTO city
VALUES(
      9825,
      'Jamestown',
      234
);

INSERT INTO city
VALUES(
      9826,
      'Webster',
      234
);

INSERT INTO city
VALUES(
      9827,
      'Sidney',
      234
);

INSERT INTO city
VALUES(
      9828,
      'East Rockaway',
      234
);

INSERT INTO city
VALUES(
      9829,
      'Kaser',
      234
);

INSERT INTO city
VALUES(
      9830,
      'Oneonta',
      234
);

INSERT INTO city
VALUES(
      9831,
      'Owego',
      234
);

INSERT INTO city
VALUES(
      9832,
      'Kenmore',
      234
);

INSERT INTO city
VALUES(
      9833,
      'Long Beach',
      234
);

INSERT INTO city
VALUES(
      9834,
      'Tuckahoe',
      234
);

INSERT INTO city
VALUES(
      9835,
      'Valatie',
      234
);

INSERT INTO city
VALUES(
      9836,
      'Troy',
      234
);

INSERT INTO city
VALUES(
      9837,
      'Nyack',
      234
);

INSERT INTO city
VALUES(
      9838,
      'Great Neck',
      234
);

INSERT INTO city
VALUES(
      9839,
      'Chester',
      234
);

INSERT INTO city
VALUES(
      9840,
      'Attica',
      234
);

INSERT INTO city
VALUES(
      9841,
      'Ithaca',
      234
);

INSERT INTO city
VALUES(
      9842,
      'Larchmont',
      234
);

INSERT INTO city
VALUES(
      9843,
      'Rensselaer',
      234
);

INSERT INTO city
VALUES(
      9844,
      'Cedarhurst',
      234
);

INSERT INTO city
VALUES(
      9845,
      'Yonkers',
      234
);

INSERT INTO city
VALUES(
      9846,
      'Lawrence',
      234
);

INSERT INTO city
VALUES(
      9847,
      'Brooklyn',
      234
);

INSERT INTO city
VALUES(
      9848,
      'East Aurora',
      234
);

INSERT INTO city
VALUES(
      9849,
      'Massena',
      234
);

INSERT INTO city
VALUES(
      9850,
      'Binghamton',
      234
);

INSERT INTO city
VALUES(
      9851,
      'Spring Valley',
      234
);

INSERT INTO city
VALUES(
      9852,
      'Oneida',
      234
);

INSERT INTO city
VALUES(
      9853,
      'Gowanda',
      234
);

INSERT INTO city
VALUES(
      9854,
      'Kings Point',
      234
);

INSERT INTO city
VALUES(
      9855,
      'Lancaster',
      234
);

INSERT INTO city
VALUES(
      9856,
      'Hudson',
      234
);

INSERT INTO city
VALUES(
      9857,
      'Fort Plain',
      234
);

INSERT INTO city
VALUES(
      9858,
      'Sleepy Hollow',
      234
);

INSERT INTO city
VALUES(
      9859,
      'Dunkirk',
      234
);

INSERT INTO city
VALUES(
      9860,
      'Manhattan',
      234
);

INSERT INTO city
VALUES(
      9861,
      'Beacon',
      234
);

INSERT INTO city
VALUES(
      9862,
      'Geneva',
      234
);

INSERT INTO city
VALUES(
      9863,
      'Wellsville',
      234
);

INSERT INTO city
VALUES(
      9864,
      'Mount Vernon',
      234
);

INSERT INTO city
VALUES(
      9865,
      'Johnstown',
      234
);

INSERT INTO city
VALUES(
      9866,
      'Solvay',
      234
);

INSERT INTO city
VALUES(
      9867,
      'Glen Cove',
      234
);

INSERT INTO city
VALUES(
      9868,
      'Scotia',
      234
);

INSERT INTO city
VALUES(
      9869,
      'Gloversville',
      234
);

INSERT INTO city
VALUES(
      9870,
      'Staten Island',
      234
);

INSERT INTO city
VALUES(
      9871,
      'New Hyde Park',
      234
);

INSERT INTO city
VALUES(
      9872,
      'Exeter',
      234
);

INSERT INTO city
VALUES(
      9873,
      'Clarion',
      234
);

INSERT INTO city
VALUES(
      9874,
      'Millersville',
      234
);

INSERT INTO city
VALUES(
      9875,
      'Camp Hill',
      234
);

INSERT INTO city
VALUES(
      9876,
      'Canonsburg',
      234
);

INSERT INTO city
VALUES(
      9877,
      'Grove City',
      234
);

INSERT INTO city
VALUES(
      9878,
      'Cresson',
      234
);

INSERT INTO city
VALUES(
      9879,
      'Quakertown',
      234
);

INSERT INTO city
VALUES(
      9880,
      'Hatboro',
      234
);

INSERT INTO city
VALUES(
      9881,
      'Folcroft',
      234
);

INSERT INTO city
VALUES(
      9882,
      'Connellsville',
      234
);

INSERT INTO city
VALUES(
      9883,
      'State College',
      234
);

INSERT INTO city
VALUES(
      9884,
      'North East',
      234
);

INSERT INTO city
VALUES(
      9885,
      'Montgomery',
      234
);

INSERT INTO city
VALUES(
      9886,
      'Nazareth',
      234
);

INSERT INTO city
VALUES(
      9887,
      'Harrisburg',
      234
);

INSERT INTO city
VALUES(
      9888,
      'Sugarcreek',
      234
);

INSERT INTO city
VALUES(
      9889,
      'White Oak',
      234
);

INSERT INTO city
VALUES(
      9890,
      'Lansdale',
      234
);

INSERT INTO city
VALUES(
      9891,
      'Swarthmore',
      234
);

INSERT INTO city
VALUES(
      9892,
      'Olyphant',
      234
);

INSERT INTO city
VALUES(
      9893,
      'Shamokin',
      234
);

INSERT INTO city
VALUES(
      9894,
      'Murrysville',
      234
);

INSERT INTO city
VALUES(
      9895,
      'West Chester',
      234
);

INSERT INTO city
VALUES(
      9896,
      'Red Lion',
      234
);

INSERT INTO city
VALUES(
      9897,
      'Sayre',
      234
);

INSERT INTO city
VALUES(
      9898,
      'Kittanning',
      234
);

INSERT INTO city
VALUES(
      9899,
      'Nanticoke',
      234
);

INSERT INTO city
VALUES(
      9900,
      'Kingston',
      234
);

INSERT INTO city
VALUES(
      9901,
      'Titusville',
      234
);

INSERT INTO city
VALUES(
      9902,
      'Washington',
      234
);

INSERT INTO city
VALUES(
      9903,
      'Waynesburg',
      234
);

INSERT INTO city
VALUES(
      9904,
      'Downingtown',
      234
);

INSERT INTO city
VALUES(
      9905,
      'Butler',
      234
);

INSERT INTO city
VALUES(
      9906,
      'Munhall',
      234
);

INSERT INTO city
VALUES(
      9907,
      'Mount Carmel',
      234
);

INSERT INTO city
VALUES(
      9908,
      'Wyomissing',
      234
);

INSERT INTO city
VALUES(
      9909,
      'Carlisle',
      234
);

INSERT INTO city
VALUES(
      9910,
      'Dunmore',
      234
);

INSERT INTO city
VALUES(
      9911,
      'Mechanicsburg',
      234
);

INSERT INTO city
VALUES(
      9912,
      'Altoona',
      234
);

INSERT INTO city
VALUES(
      9913,
      'Northampton',
      234
);

INSERT INTO city
VALUES(
      9914,
      'Tyrone',
      234
);

INSERT INTO city
VALUES(
      9915,
      'Corry',
      234
);

INSERT INTO city
VALUES(
      9916,
      'Archbald',
      234
);

INSERT INTO city
VALUES(
      9917,
      'Moosic',
      234
);

INSERT INTO city
VALUES(
      9918,
      'Bristol',
      234
);

INSERT INTO city
VALUES(
      9919,
      'Ashland',
      234
);

INSERT INTO city
VALUES(
      9920,
      'Warren',
      234
);

INSERT INTO city
VALUES(
      9921,
      'Quarryville',
      234
);

INSERT INTO city
VALUES(
      9922,
      'Jefferson Hills',
      234
);

INSERT INTO city
VALUES(
      9923,
      'Duquesne',
      234
);

INSERT INTO city
VALUES(
      9924,
      'Jeannette',
      234
);

INSERT INTO city
VALUES(
      9925,
      'Norwood',
      234
);

INSERT INTO city
VALUES(
      9926,
      'Lansdowne',
      234
);

INSERT INTO city
VALUES(
      9927,
      'Birdsboro',
      234
);

INSERT INTO city
VALUES(
      9928,
      'Steelton',
      234
);

INSERT INTO city
VALUES(
      9929,
      'New Castle',
      234
);

INSERT INTO city
VALUES(
      9930,
      'McKees Rocks',
      234
);

INSERT INTO city
VALUES(
      9931,
      'Glenolden',
      234
);

INSERT INTO city
VALUES(
      9932,
      'Indiana',
      234
);

INSERT INTO city
VALUES(
      9933,
      'Columbia',
      234
);

INSERT INTO city
VALUES(
      9934,
      'Easton',
      234
);

INSERT INTO city
VALUES(
      9935,
      'Plum',
      234
);

INSERT INTO city
VALUES(
      9936,
      'Pottstown',
      234
);

INSERT INTO city
VALUES(
      9937,
      'Baldwin',
      234
);

INSERT INTO city
VALUES(
      9938,
      'York',
      234
);

INSERT INTO city
VALUES(
      9939,
      'Lewistown',
      234
);

INSERT INTO city
VALUES(
      9940,
      'Lebanon',
      234
);

INSERT INTO city
VALUES(
      9941,
      'Media',
      234
);

INSERT INTO city
VALUES(
      9942,
      'Aliquippa',
      234
);

INSERT INTO city
VALUES(
      9943,
      'Chambersburg',
      234
);

INSERT INTO city
VALUES(
      9944,
      'Catasauqua',
      234
);

INSERT INTO city
VALUES(
      9945,
      'New Kensington',
      234
);

INSERT INTO city
VALUES(
      9946,
      'Wilkinsburg',
      234
);

INSERT INTO city
VALUES(
      9947,
      'Williamsport',
      234
);

INSERT INTO city
VALUES(
      9948,
      'Bellefonte',
      234
);

INSERT INTO city
VALUES(
      9949,
      'Hermitage',
      234
);

INSERT INTO city
VALUES(
      9950,
      'Erie',
      234
);

INSERT INTO city
VALUES(
      9951,
      'Shippensburg',
      234
);

INSERT INTO city
VALUES(
      9952,
      'Philadelphia',
      234
);

INSERT INTO city
VALUES(
      9953,
      'Swissvale',
      234
);

INSERT INTO city
VALUES(
      9954,
      'Ridley Park',
      234
);

INSERT INTO city
VALUES(
      9955,
      'Tamaqua',
      234
);

INSERT INTO city
VALUES(
      9956,
      'New Brighton',
      234
);

INSERT INTO city
VALUES(
      9957,
      'Ephrata',
      234
);

INSERT INTO city
VALUES(
      9958,
      'Dover',
      234
);

INSERT INTO city
VALUES(
      9959,
      'Lehighton',
      234
);

INSERT INTO city
VALUES(
      9960,
      'Lititz',
      234
);

INSERT INTO city
VALUES(
      9961,
      'Hazleton',
      234
);

INSERT INTO city
VALUES(
      9962,
      'Castle Shannon',
      234
);

INSERT INTO city
VALUES(
      9963,
      'Palmerton',
      234
);

INSERT INTO city
VALUES(
      9964,
      'Latrobe',
      234
);

INSERT INTO city
VALUES(
      9965,
      'Clairton',
      234
);

INSERT INTO city
VALUES(
      9966,
      'Orwigsburg',
      234
);

INSERT INTO city
VALUES(
      9967,
      'Greensburg',
      234
);

INSERT INTO city
VALUES(
      9968,
      'Brentwood',
      234
);

INSERT INTO city
VALUES(
      9969,
      'Monroeville',
      234
);

INSERT INTO city
VALUES(
      9970,
      'Turtle Creek',
      234
);

INSERT INTO city
VALUES(
      9971,
      'Coatesville',
      234
);

INSERT INTO city
VALUES(
      9972,
      'Middletown',
      234
);

INSERT INTO city
VALUES(
      9973,
      'Carbondale',
      234
);

INSERT INTO city
VALUES(
      9974,
      'Lancaster',
      234
);

INSERT INTO city
VALUES(
      9975,
      'Johnstown',
      234
);

INSERT INTO city
VALUES(
      9976,
      'Plymouth',
      234
);

INSERT INTO city
VALUES(
      9977,
      'Sharon Hill',
      234
);

INSERT INTO city
VALUES(
      9978,
      'Dormont',
      234
);

INSERT INTO city
VALUES(
      9979,
      'Blakely',
      234
);

INSERT INTO city
VALUES(
      9980,
      'Meadville',
      234
);

INSERT INTO city
VALUES(
      9981,
      'Pottsville',
      234
);

INSERT INTO city
VALUES(
      9982,
      'Perkasie',
      234
);

INSERT INTO city
VALUES(
      9983,
      'New Holland',
      234
);

INSERT INTO city
VALUES(
      9984,
      'Bloomsburg',
      234
);

INSERT INTO city
VALUES(
      9985,
      'Scranton',
      234
);

INSERT INTO city
VALUES(
      9986,
      'Hanover',
      234
);

INSERT INTO city
VALUES(
      9987,
      'Carnegie',
      234
);

INSERT INTO city
VALUES(
      9988,
      'Edinboro',
      234
);

INSERT INTO city
VALUES(
      9989,
      'Uniontown',
      234
);

INSERT INTO city
VALUES(
      9990,
      'Reading',
      234
);

INSERT INTO city
VALUES(
      9991,
      'Du Bois',
      234
);

INSERT INTO city
VALUES(
      9992,
      'Selinsgrove',
      234
);

INSERT INTO city
VALUES(
      9993,
      'Sunbury',
      234
);

INSERT INTO city
VALUES(
      9994,
      'Old Forge',
      234
);

INSERT INTO city
VALUES(
      9995,
      'Collegeville',
      234
);

INSERT INTO city
VALUES(
      9996,
      'Somerset',
      234
);

INSERT INTO city
VALUES(
      9997,
      'Conshohocken',
      234
);

INSERT INTO city
VALUES(
      9998,
      'New Cumberland',
      234
);

INSERT INTO city
VALUES(
      9999,
      'Huntingdon',
      234
);

INSERT INTO city
VALUES(
      10000,
      'Bethel Park',
      234
);

INSERT INTO city
VALUES(
      10001,
      'Doylestown',
      234
);

INSERT INTO city
VALUES(
      10002,
      'Prospect Park',
      234
);

INSERT INTO city
VALUES(
      10003,
      'Whitehall',
      234
);

INSERT INTO city
VALUES(
      10004,
      'Kutztown',
      234
);

INSERT INTO city
VALUES(
      10005,
      'Phoenixville',
      234
);

INSERT INTO city
VALUES(
      10006,
      'Slippery Rock',
      234
);

INSERT INTO city
VALUES(
      10007,
      'West Mifflin',
      234
);

INSERT INTO city
VALUES(
      10008,
      'California',
      234
);

INSERT INTO city
VALUES(
      10009,
      'Palmyra',
      234
);

INSERT INTO city
VALUES(
      10010,
      'Emmaus',
      234
);

INSERT INTO city
VALUES(
      10011,
      'South Williamsport',
      234
);

INSERT INTO city
VALUES(
      10012,
      'Pleasant Hills',
      234
);

INSERT INTO city
VALUES(
      10013,
      'Monessen',
      234
);

INSERT INTO city
VALUES(
      10014,
      'Philipsburg',
      234
);

INSERT INTO city
VALUES(
      10015,
      'Norristown',
      234
);

INSERT INTO city
VALUES(
      10016,
      'Pittsburgh',
      234
);

INSERT INTO city
VALUES(
      10017,
      'Ambridge',
      234
);

INSERT INTO city
VALUES(
      10018,
      'Taylor',
      234
);

INSERT INTO city
VALUES(
      10019,
      'Elizabethtown',
      234
);

INSERT INTO city
VALUES(
      10020,
      'Franklin',
      234
);

INSERT INTO city
VALUES(
      10021,
      'Lower Burrell',
      234
);

INSERT INTO city
VALUES(
      10022,
      'Lock Haven',
      234
);

INSERT INTO city
VALUES(
      10023,
      'Yeadon',
      234
);

INSERT INTO city
VALUES(
      10024,
      'Darby',
      234
);

INSERT INTO city
VALUES(
      10025,
      'Waynesboro',
      234
);

INSERT INTO city
VALUES(
      10026,
      'Crafton',
      234
);

INSERT INTO city
VALUES(
      10027,
      'Honesdale',
      234
);

INSERT INTO city
VALUES(
      10028,
      'Fox Chapel',
      234
);

INSERT INTO city
VALUES(
      10029,
      'Hollidaysburg',
      234
);

INSERT INTO city
VALUES(
      10030,
      'Allentown',
      234
);

INSERT INTO city
VALUES(
      10031,
      'Forest Hills',
      234
);

INSERT INTO city
VALUES(
      10032,
      'Kennett Square',
      234
);

INSERT INTO city
VALUES(
      10033,
      'Blairsville',
      234
);

INSERT INTO city
VALUES(
      10034,
      'West View',
      234
);

INSERT INTO city
VALUES(
      10035,
      'Sharon',
      234
);

INSERT INTO city
VALUES(
      10036,
      'Beaver Falls',
      234
);

INSERT INTO city
VALUES(
      10037,
      'Punxsutawney',
      234
);

INSERT INTO city
VALUES(
      10038,
      'Hellertown',
      234
);

INSERT INTO city
VALUES(
      10039,
      'Littlestown',
      234
);

INSERT INTO city
VALUES(
      10040,
      'Dickson City',
      234
);

INSERT INTO city
VALUES(
      10041,
      'Northern Cambria',
      234
);

INSERT INTO city
VALUES(
      10042,
      'Clifton Heights',
      234
);

INSERT INTO city
VALUES(
      10043,
      'Wilson',
      234
);

INSERT INTO city
VALUES(
      10044,
      'Muncy',
      234
);

INSERT INTO city
VALUES(
      10045,
      'Franklin Park',
      234
);

INSERT INTO city
VALUES(
      10046,
      'Jersey Shore',
      234
);

INSERT INTO city
VALUES(
      10047,
      'Stewartstown',
      234
);

INSERT INTO city
VALUES(
      10048,
      'Shenandoah',
      234
);

INSERT INTO city
VALUES(
      10049,
      'Jim Thorpe',
      234
);

INSERT INTO city
VALUES(
      10050,
      'Bangor',
      234
);

INSERT INTO city
VALUES(
      10051,
      'Clearfield',
      234
);

INSERT INTO city
VALUES(
      10052,
      'Mount Joy',
      234
);

INSERT INTO city
VALUES(
      10053,
      'Souderton',
      234
);

INSERT INTO city
VALUES(
      10054,
      'Monaca',
      234
);

INSERT INTO city
VALUES(
      10055,
      'East Stroudsburg',
      234
);

INSERT INTO city
VALUES(
      10056,
      'Portage',
      234
);

INSERT INTO city
VALUES(
      10057,
      'Bethlehem',
      234
);

INSERT INTO city
VALUES(
      10058,
      'Coraopolis',
      234
);

INSERT INTO city
VALUES(
      10059,
      'Oxford',
      234
);

INSERT INTO city
VALUES(
      10060,
      'Pittston',
      234
);

INSERT INTO city
VALUES(
      10061,
      'Saint Marys',
      234
);

INSERT INTO city
VALUES(
      10062,
      'Brookhaven',
      234
);

INSERT INTO city
VALUES(
      10063,
      'Bellevue',
      234
);

INSERT INTO city
VALUES(
      10064,
      'Collingdale',
      234
);

INSERT INTO city
VALUES(
      10065,
      'Bridgeville',
      234
);

INSERT INTO city
VALUES(
      10066,
      'Schuylkill Haven',
      234
);

INSERT INTO city
VALUES(
      10067,
      'Mount Pocono',
      234
);

INSERT INTO city
VALUES(
      10068,
      'Berwick',
      234
);

INSERT INTO city
VALUES(
      10069,
      'Wilkes-Barre',
      234
);

INSERT INTO city
VALUES(
      10070,
      'Milton',
      234
);

INSERT INTO city
VALUES(
      10071,
      'McKeesport',
      234
);

INSERT INTO city
VALUES(
      10072,
      'Oakmont',
      234
);

INSERT INTO city
VALUES(
      10073,
      'New Freedom',
      234
);

INSERT INTO city
VALUES(
      10074,
      'Morrisville',
      234
);

INSERT INTO city
VALUES(
      10075,
      'Chester',
      234
);

INSERT INTO city
VALUES(
      10076,
      'Ellwood City',
      234
);

INSERT INTO city
VALUES(
      10077,
      'Greenville',
      234
);

INSERT INTO city
VALUES(
      10078,
      'Ambler',
      234
);

INSERT INTO city
VALUES(
      10079,
      'Bradford',
      234
);

INSERT INTO city
VALUES(
      10080,
      'Gettysburg',
      234
);

INSERT INTO city
VALUES(
      10081,
      'Stroudsburg',
      234
);

INSERT INTO city
VALUES(
      10082,
      'Roaring Spring',
      234
);

INSERT INTO city
VALUES(
      10083,
      'Shillington',
      234
);

INSERT INTO city
VALUES(
      10084,
      'Oil City',
      234
);

INSERT INTO city
VALUES(
      10085,
      'Lewisburg',
      234
);

INSERT INTO city
VALUES(
      10086,
      'La Quinta',
      234
);

INSERT INTO city
VALUES(
      10087,
      'Saint Helena',
      234
);

INSERT INTO city
VALUES(
      10088,
      'Pleasant Hill',
      234
);

INSERT INTO city
VALUES(
      10089,
      'Pomona',
      234
);

INSERT INTO city
VALUES(
      10090,
      'Oakdale',
      234
);

INSERT INTO city
VALUES(
      10091,
      'Upland',
      234
);

INSERT INTO city
VALUES(
      10092,
      'Riverbank',
      234
);

INSERT INTO city
VALUES(
      10093,
      'Brea',
      234
);

INSERT INTO city
VALUES(
      10094,
      'San Jacinto',
      234
);

INSERT INTO city
VALUES(
      10095,
      'Redding',
      234
);

INSERT INTO city
VALUES(
      10096,
      'Exeter',
      234
);

INSERT INTO city
VALUES(
      10097,
      'Hercules',
      234
);

INSERT INTO city
VALUES(
      10098,
      'Moorpark',
      234
);

INSERT INTO city
VALUES(
      10099,
      'Windsor',
      234
);

INSERT INTO city
VALUES(
      10100,
      'El Monte',
      234
);

INSERT INTO city
VALUES(
      10101,
      'Calistoga',
      234
);

INSERT INTO city
VALUES(
      10102,
      'Sebastopol',
      234
);

INSERT INTO city
VALUES(
      10103,
      'Clearlake',
      234
);

INSERT INTO city
VALUES(
      10104,
      'Burbank',
      234
);

INSERT INTO city
VALUES(
      10105,
      'Rancho Santa Margarita',
      234
);

INSERT INTO city
VALUES(
      10106,
      'Manhattan Beach',
      234
);

INSERT INTO city
VALUES(
      10107,
      'Corning',
      234
);

INSERT INTO city
VALUES(
      10108,
      'Maywood',
      234
);

INSERT INTO city
VALUES(
      10109,
      'La Habra Heights',
      234
);

INSERT INTO city
VALUES(
      10110,
      'East Palo Alto',
      234
);

INSERT INTO city
VALUES(
      10111,
      'Lakewood',
      234
);

INSERT INTO city
VALUES(
      10112,
      'Irvine',
      234
);

INSERT INTO city
VALUES(
      10113,
      'Norco',
      234
);

INSERT INTO city
VALUES(
      10114,
      'Rocklin',
      234
);

INSERT INTO city
VALUES(
      10115,
      'Salinas',
      234
);

INSERT INTO city
VALUES(
      10116,
      'Newark',
      234
);

INSERT INTO city
VALUES(
      10117,
      'Apple Valley',
      234
);

INSERT INTO city
VALUES(
      10118,
      'Bell Gardens',
      234
);

INSERT INTO city
VALUES(
      10119,
      'Lodi',
      234
);

INSERT INTO city
VALUES(
      10120,
      'Foster City',
      234
);

INSERT INTO city
VALUES(
      10121,
      'Vallejo',
      234
);

INSERT INTO city
VALUES(
      10122,
      'Indio',
      234
);

INSERT INTO city
VALUES(
      10123,
      'Tiburon',
      234
);

INSERT INTO city
VALUES(
      10124,
      'Hesperia',
      234
);

INSERT INTO city
VALUES(
      10125,
      'Azusa',
      234
);

INSERT INTO city
VALUES(
      10126,
      'Big Bear Lake',
      234
);

INSERT INTO city
VALUES(
      10127,
      'Emeryville',
      234
);

INSERT INTO city
VALUES(
      10128,
      'Hollister',
      234
);

INSERT INTO city
VALUES(
      10129,
      'Buellton',
      234
);

INSERT INTO city
VALUES(
      10130,
      'Waterford',
      234
);

INSERT INTO city
VALUES(
      10131,
      'Cathedral City',
      234
);

INSERT INTO city
VALUES(
      10132,
      'Buena Park',
      234
);

INSERT INTO city
VALUES(
      10133,
      'Downey',
      234
);

INSERT INTO city
VALUES(
      10134,
      'Williams',
      234
);

INSERT INTO city
VALUES(
      10135,
      'El Segundo',
      234
);

INSERT INTO city
VALUES(
      10136,
      'Los Altos',
      234
);

INSERT INTO city
VALUES(
      10137,
      'Bakersfield',
      234
);

INSERT INTO city
VALUES(
      10138,
      'San Bernardino',
      234
);

INSERT INTO city
VALUES(
      10139,
      'Encinitas',
      234
);

INSERT INTO city
VALUES(
      10140,
      'Loomis',
      234
);

INSERT INTO city
VALUES(
      10141,
      'Santa Fe Springs',
      234
);

INSERT INTO city
VALUES(
      10142,
      'Paradise',
      234
);

INSERT INTO city
VALUES(
      10143,
      'American Canyon',
      234
);

INSERT INTO city
VALUES(
      10144,
      'Palm Desert',
      234
);

INSERT INTO city
VALUES(
      10145,
      'Whittier',
      234
);

INSERT INTO city
VALUES(
      10146,
      'Duarte',
      234
);

INSERT INTO city
VALUES(
      10147,
      'Sanger',
      234
);

INSERT INTO city
VALUES(
      10148,
      'Chula Vista',
      234
);

INSERT INTO city
VALUES(
      10149,
      'Mammoth Lakes',
      234
);

INSERT INTO city
VALUES(
      10150,
      'Jackson',
      234
);

INSERT INTO city
VALUES(
      10151,
      'Adelanto',
      234
);

INSERT INTO city
VALUES(
      10152,
      'Twentynine Palms',
      234
);

INSERT INTO city
VALUES(
      10153,
      'Cupertino',
      234
);

INSERT INTO city
VALUES(
      10154,
      'Palm Springs',
      234
);

INSERT INTO city
VALUES(
      10155,
      'Ukiah',
      234
);

INSERT INTO city
VALUES(
      10156,
      'Fullerton',
      234
);

INSERT INTO city
VALUES(
      10157,
      'Lompoc',
      234
);

INSERT INTO city
VALUES(
      10158,
      'Victorville',
      234
);

INSERT INTO city
VALUES(
      10159,
      'Crescent City',
      234
);

INSERT INTO city
VALUES(
      10160,
      'Anaheim',
      234
);

INSERT INTO city
VALUES(
      10161,
      'Coronado',
      234
);

INSERT INTO city
VALUES(
      10162,
      'Wasco',
      234
);

INSERT INTO city
VALUES(
      10163,
      'Fillmore',
      234
);

INSERT INTO city
VALUES(
      10164,
      'Delano',
      234
);

INSERT INTO city
VALUES(
      10165,
      'Campbell',
      234
);

INSERT INTO city
VALUES(
      10166,
      'Lynwood',
      234
);

INSERT INTO city
VALUES(
      10167,
      'Temecula',
      234
);

INSERT INTO city
VALUES(
      10168,
      'Los Gatos',
      234
);

INSERT INTO city
VALUES(
      10169,
      'Mendota',
      234
);

INSERT INTO city
VALUES(
      10170,
      'Newman',
      234
);

INSERT INTO city
VALUES(
      10171,
      'San Anselmo',
      234
);

INSERT INTO city
VALUES(
      10172,
      'Kerman',
      234
);

INSERT INTO city
VALUES(
      10173,
      'Laguna Woods',
      234
);

INSERT INTO city
VALUES(
      10174,
      'Menlo Park',
      234
);

INSERT INTO city
VALUES(
      10175,
      'Corona',
      234
);

INSERT INTO city
VALUES(
      10176,
      'Walnut Creek',
      234
);

INSERT INTO city
VALUES(
      10177,
      'Fresno',
      234
);

INSERT INTO city
VALUES(
      10178,
      'Pasadena',
      234
);

INSERT INTO city
VALUES(
      10179,
      'San Marcos',
      234
);

INSERT INTO city
VALUES(
      10180,
      'Milpitas',
      234
);

INSERT INTO city
VALUES(
      10181,
      'Hillsborough',
      234
);

INSERT INTO city
VALUES(
      10182,
      'National City',
      234
);

INSERT INTO city
VALUES(
      10183,
      'Piedmont',
      234
);

INSERT INTO city
VALUES(
      10184,
      'Malibu',
      234
);

INSERT INTO city
VALUES(
      10185,
      'Los Alamitos',
      234
);

INSERT INTO city
VALUES(
      10186,
      'Hawaiian Gardens',
      234
);

INSERT INTO city
VALUES(
      10187,
      'Arcadia',
      234
);

INSERT INTO city
VALUES(
      10188,
      'Yreka',
      234
);

INSERT INTO city
VALUES(
      10189,
      'Gustine',
      234
);

INSERT INTO city
VALUES(
      10190,
      'Fairfield',
      234
);

INSERT INTO city
VALUES(
      10191,
      'Firebaugh',
      234
);

INSERT INTO city
VALUES(
      10192,
      'Calexico',
      234
);

INSERT INTO city
VALUES(
      10193,
      'Porterville',
      234
);

INSERT INTO city
VALUES(
      10194,
      'Mission Viejo',
      234
);

INSERT INTO city
VALUES(
      10195,
      'Pleasanton',
      234
);

INSERT INTO city
VALUES(
      10196,
      'Vista',
      234
);

INSERT INTO city
VALUES(
      10197,
      'Mount Shasta',
      234
);

INSERT INTO city
VALUES(
      10198,
      'Carson',
      234
);

INSERT INTO city
VALUES(
      10199,
      'Tracy',
      234
);

INSERT INTO city
VALUES(
      10200,
      'Gardena',
      234
);

INSERT INTO city
VALUES(
      10201,
      'Palo Alto',
      234
);

INSERT INTO city
VALUES(
      10202,
      'Lomita',
      234
);

INSERT INTO city
VALUES(
      10203,
      'Chino Hills',
      234
);

INSERT INTO city
VALUES(
      10204,
      'Pacifica',
      234
);

INSERT INTO city
VALUES(
      10205,
      'Signal Hill',
      234
);

INSERT INTO city
VALUES(
      10206,
      'Santa Maria',
      234
);

INSERT INTO city
VALUES(
      10207,
      'Wildomar',
      234
);

INSERT INTO city
VALUES(
      10208,
      'Laguna Beach',
      234
);

INSERT INTO city
VALUES(
      10209,
      'Santa Barbara',
      234
);

INSERT INTO city
VALUES(
      10210,
      'Fort Bragg',
      234
);

INSERT INTO city
VALUES(
      10211,
      'Temple City',
      234
);

INSERT INTO city
VALUES(
      10212,
      'Orange',
      234
);

INSERT INTO city
VALUES(
      10213,
      'Lake Elsinore',
      234
);

INSERT INTO city
VALUES(
      10214,
      'Sunnyvale',
      234
);

INSERT INTO city
VALUES(
      10215,
      'San Bruno',
      234
);

INSERT INTO city
VALUES(
      10216,
      'Suisun',
      234
);

INSERT INTO city
VALUES(
      10217,
      'Watsonville',
      234
);

INSERT INTO city
VALUES(
      10218,
      'Calabasas',
      234
);

INSERT INTO city
VALUES(
      10219,
      'Monterey Park',
      234
);

INSERT INTO city
VALUES(
      10220,
      'San Rafael',
      234
);

INSERT INTO city
VALUES(
      10221,
      'Costa Mesa',
      234
);

INSERT INTO city
VALUES(
      10222,
      'Roseville',
      234
);

INSERT INTO city
VALUES(
      10223,
      'Livermore',
      234
);

INSERT INTO city
VALUES(
      10224,
      'Desert Hot Springs',
      234
);

INSERT INTO city
VALUES(
      10225,
      'Coachella',
      234
);

INSERT INTO city
VALUES(
      10226,
      'Sierra Madre',
      234
);

INSERT INTO city
VALUES(
      10227,
      'Sausalito',
      234
);

INSERT INTO city
VALUES(
      10228,
      'Hughson',
      234
);

INSERT INTO city
VALUES(
      10229,
      'Ceres',
      234
);

INSERT INTO city
VALUES(
      10230,
      'Holtville',
      234
);

INSERT INTO city
VALUES(
      10231,
      'Turlock',
      234
);

INSERT INTO city
VALUES(
      10232,
      'Cypress',
      234
);

INSERT INTO city
VALUES(
      10233,
      'Blythe',
      234
);

INSERT INTO city
VALUES(
      10234,
      'Eureka',
      234
);

INSERT INTO city
VALUES(
      10235,
      'Pittsburg',
      234
);

INSERT INTO city
VALUES(
      10236,
      'Red Bluff',
      234
);

INSERT INTO city
VALUES(
      10237,
      'Gilroy',
      234
);

INSERT INTO city
VALUES(
      10238,
      'San Marino',
      234
);

INSERT INTO city
VALUES(
      10239,
      'Huntington Park',
      234
);

INSERT INTO city
VALUES(
      10240,
      'Rosemead',
      234
);

INSERT INTO city
VALUES(
      10241,
      'Colusa',
      234
);

INSERT INTO city
VALUES(
      10242,
      'Parlier',
      234
);

INSERT INTO city
VALUES(
      10243,
      'Commerce',
      234
);

INSERT INTO city
VALUES(
      10244,
      'Arcata',
      234
);

INSERT INTO city
VALUES(
      10245,
      'Yucaipa',
      234
);

INSERT INTO city
VALUES(
      10246,
      'Norwalk',
      234
);

INSERT INTO city
VALUES(
      10247,
      'Ontario',
      234
);

INSERT INTO city
VALUES(
      10248,
      'San Carlos',
      234
);

INSERT INTO city
VALUES(
      10249,
      'Burlingame',
      234
);

INSERT INTO city
VALUES(
      10250,
      'Reedley',
      234
);

INSERT INTO city
VALUES(
      10251,
      'Fortuna',
      234
);

INSERT INTO city
VALUES(
      10252,
      'Concord',
      234
);

INSERT INTO city
VALUES(
      10253,
      'Scotts Valley',
      234
);

INSERT INTO city
VALUES(
      10254,
      'Atwater',
      234
);

INSERT INTO city
VALUES(
      10255,
      'Torrance',
      234
);

INSERT INTO city
VALUES(
      10256,
      'Antioch',
      234
);

INSERT INTO city
VALUES(
      10257,
      'Elk Grove',
      234
);

INSERT INTO city
VALUES(
      10258,
      'El Centro',
      234
);

INSERT INTO city
VALUES(
      10259,
      'South Gate',
      234
);

INSERT INTO city
VALUES(
      10260,
      'Moraga',
      234
);

INSERT INTO city
VALUES(
      10261,
      'Glendora',
      234
);

INSERT INTO city
VALUES(
      10262,
      'Ridgecrest',
      234
);

INSERT INTO city
VALUES(
      10263,
      'Laguna Niguel',
      234
);

INSERT INTO city
VALUES(
      10264,
      'Sacramento',
      234
);

INSERT INTO city
VALUES(
      10265,
      'Lemoore',
      234
);

INSERT INTO city
VALUES(
      10266,
      'Seaside',
      234
);

INSERT INTO city
VALUES(
      10267,
      'Los Banos',
      234
);

INSERT INTO city
VALUES(
      10268,
      'Folsom',
      234
);

INSERT INTO city
VALUES(
      10269,
      'Dixon',
      234
);

INSERT INTO city
VALUES(
      10270,
      'Fontana',
      234
);

INSERT INTO city
VALUES(
      10271,
      'Cloverdale',
      234
);

INSERT INTO city
VALUES(
      10272,
      'Imperial Beach',
      234
);

INSERT INTO city
VALUES(
      10273,
      'Lemon Grove',
      234
);

INSERT INTO city
VALUES(
      10274,
      'Daly City',
      234
);

INSERT INTO city
VALUES(
      10275,
      'Orinda',
      234
);

INSERT INTO city
VALUES(
      10276,
      'Riverside',
      234
);

INSERT INTO city
VALUES(
      10277,
      'Brawley',
      234
);

INSERT INTO city
VALUES(
      10278,
      'El Cajon',
      234
);

INSERT INTO city
VALUES(
      10279,
      'Millbrae',
      234
);

INSERT INTO city
VALUES(
      10280,
      'Pacific Grove',
      234
);

INSERT INTO city
VALUES(
      10281,
      'Merced',
      234
);

INSERT INTO city
VALUES(
      10282,
      'Murrieta',
      234
);

INSERT INTO city
VALUES(
      10283,
      'Ojai',
      234
);

INSERT INTO city
VALUES(
      10284,
      'Rialto',
      234
);

INSERT INTO city
VALUES(
      10285,
      'Woodland',
      234
);

INSERT INTO city
VALUES(
      10286,
      'Santa Rosa',
      234
);

INSERT INTO city
VALUES(
      10287,
      'Marysville',
      234
);

INSERT INTO city
VALUES(
      10288,
      'Palmdale',
      234
);

INSERT INTO city
VALUES(
      10289,
      'Saratoga',
      234
);

INSERT INTO city
VALUES(
      10290,
      'West Covina',
      234
);

INSERT INTO city
VALUES(
      10291,
      'Belmont',
      234
);

INSERT INTO city
VALUES(
      10292,
      'Long Beach',
      234
);

INSERT INTO city
VALUES(
      10293,
      'Santee',
      234
);

INSERT INTO city
VALUES(
      10294,
      'Walnut',
      234
);

INSERT INTO city
VALUES(
      10295,
      'Madera',
      234
);

INSERT INTO city
VALUES(
      10296,
      'Benicia',
      234
);

INSERT INTO city
VALUES(
      10297,
      'Atherton',
      234
);

INSERT INTO city
VALUES(
      10298,
      'Brentwood',
      234
);

INSERT INTO city
VALUES(
      10299,
      'South Pasadena',
      234
);

INSERT INTO city
VALUES(
      10300,
      'Sonora',
      234
);

INSERT INTO city
VALUES(
      10301,
      'Monrovia',
      234
);

INSERT INTO city
VALUES(
      10302,
      'Rolling Hills Estates',
      234
);

INSERT INTO city
VALUES(
      10303,
      'Aliso Viejo',
      234
);

INSERT INTO city
VALUES(
      10304,
      'Santa Cruz',
      234
);

INSERT INTO city
VALUES(
      10305,
      'Vacaville',
      234
);

INSERT INTO city
VALUES(
      10306,
      'Artesia',
      234
);

INSERT INTO city
VALUES(
      10307,
      'Stockton',
      234
);

INSERT INTO city
VALUES(
      10308,
      'San Juan Capistrano',
      234
);

INSERT INTO city
VALUES(
      10309,
      'Lancaster',
      234
);

INSERT INTO city
VALUES(
      10310,
      'San Gabriel',
      234
);

INSERT INTO city
VALUES(
      10311,
      'Simi Valley',
      234
);

INSERT INTO city
VALUES(
      10312,
      'San Dimas',
      234
);

INSERT INTO city
VALUES(
      10313,
      'Arvin',
      234
);

INSERT INTO city
VALUES(
      10314,
      'Corte Madera',
      234
);

INSERT INTO city
VALUES(
      10315,
      'Alameda',
      234
);

INSERT INTO city
VALUES(
      10316,
      'Fremont',
      234
);

INSERT INTO city
VALUES(
      10317,
      'Fowler',
      234
);

INSERT INTO city
VALUES(
      10318,
      'Calipatria',
      234
);

INSERT INTO city
VALUES(
      10319,
      'Beaumont',
      234
);

INSERT INTO city
VALUES(
      10320,
      'Santa Monica',
      234
);

INSERT INTO city
VALUES(
      10321,
      'San Fernando',
      234
);

INSERT INTO city
VALUES(
      10322,
      'Camarillo',
      234
);

INSERT INTO city
VALUES(
      10323,
      'Susanville',
      234
);

INSERT INTO city
VALUES(
      10324,
      'Solana Beach',
      234
);

INSERT INTO city
VALUES(
      10325,
      'Fountain Valley',
      234
);

INSERT INTO city
VALUES(
      10326,
      'Rancho Cordova',
      234
);

INSERT INTO city
VALUES(
      10327,
      'South San Francisco',
      234
);

INSERT INTO city
VALUES(
      10328,
      'Richmond',
      234
);

INSERT INTO city
VALUES(
      10329,
      'Guadalupe',
      234
);

INSERT INTO city
VALUES(
      10330,
      'Escalon',
      234
);

INSERT INTO city
VALUES(
      10331,
      'Cotati',
      234
);

INSERT INTO city
VALUES(
      10332,
      'Barstow',
      234
);

INSERT INTO city
VALUES(
      10333,
      'La Palma',
      234
);

INSERT INTO city
VALUES(
      10334,
      'Hermosa Beach',
      234
);

INSERT INTO city
VALUES(
      10335,
      'Shasta Lake',
      234
);

INSERT INTO city
VALUES(
      10336,
      'Willows',
      234
);

INSERT INTO city
VALUES(
      10337,
      'Greenfield',
      234
);

INSERT INTO city
VALUES(
      10338,
      'Paramount',
      234
);

INSERT INTO city
VALUES(
      10339,
      'Compton',
      234
);

INSERT INTO city
VALUES(
      10340,
      'Petaluma',
      234
);

INSERT INTO city
VALUES(
      10341,
      'Chowchilla',
      234
);

INSERT INTO city
VALUES(
      10342,
      'Yorba Linda',
      234
);

INSERT INTO city
VALUES(
      10343,
      'Loma Linda',
      234
);

INSERT INTO city
VALUES(
      10344,
      'Pinole',
      234
);

INSERT INTO city
VALUES(
      10345,
      'Menifee',
      234
);

INSERT INTO city
VALUES(
      10346,
      'Hawthorne',
      234
);

INSERT INTO city
VALUES(
      10347,
      'Carpinteria',
      234
);

INSERT INTO city
VALUES(
      10348,
      'Ripon',
      234
);

INSERT INTO city
VALUES(
      10349,
      'Redwood City',
      234
);

INSERT INTO city
VALUES(
      10350,
      'La Canada Flintridge',
      234
);

INSERT INTO city
VALUES(
      10351,
      'Eastvale',
      234
);

INSERT INTO city
VALUES(
      10352,
      'Rancho Palos Verdes',
      234
);

INSERT INTO city
VALUES(
      10353,
      'Selma',
      234
);

INSERT INTO city
VALUES(
      10354,
      'Alhambra',
      234
);

INSERT INTO city
VALUES(
      10355,
      'Escondido',
      234
);

INSERT INTO city
VALUES(
      10356,
      'Morgan Hill',
      234
);

INSERT INTO city
VALUES(
      10357,
      'Laguna Hills',
      234
);

INSERT INTO city
VALUES(
      10358,
      'Cudahy',
      234
);

INSERT INTO city
VALUES(
      10359,
      'Gridley',
      234
);

INSERT INTO city
VALUES(
      10360,
      'El Cerrito',
      234
);

INSERT INTO city
VALUES(
      10361,
      'Dublin',
      234
);

INSERT INTO city
VALUES(
      10362,
      'Santa Clarita',
      234
);

INSERT INTO city
VALUES(
      10363,
      'Huron',
      234
);

INSERT INTO city
VALUES(
      10364,
      'Manteca',
      234
);

INSERT INTO city
VALUES(
      10365,
      'San Francisco',
      234
);

INSERT INTO city
VALUES(
      10366,
      'Woodside',
      234
);

INSERT INTO city
VALUES(
      10367,
      'Tustin',
      234
);

INSERT INTO city
VALUES(
      10368,
      'Santa Ana',
      234
);

INSERT INTO city
VALUES(
      10369,
      'Fairfax',
      234
);

INSERT INTO city
VALUES(
      10370,
      'Moreno Valley',
      234
);

INSERT INTO city
VALUES(
      10371,
      'Lakeport',
      234
);

INSERT INTO city
VALUES(
      10372,
      'Healdsburg',
      234
);

INSERT INTO city
VALUES(
      10373,
      'Oakley',
      234
);

INSERT INTO city
VALUES(
      10374,
      'San Clemente',
      234
);

INSERT INTO city
VALUES(
      10375,
      'Half Moon Bay',
      234
);

INSERT INTO city
VALUES(
      10376,
      'Mill Valley',
      234
);

INSERT INTO city
VALUES(
      10377,
      'Hemet',
      234
);

INSERT INTO city
VALUES(
      10378,
      'Hanford',
      234
);

INSERT INTO city
VALUES(
      10379,
      'Glendale',
      234
);

INSERT INTO city
VALUES(
      10380,
      'Albany',
      234
);

INSERT INTO city
VALUES(
      10381,
      'West Sacramento',
      234
);

INSERT INTO city
VALUES(
      10382,
      'Live Oak',
      234
);

INSERT INTO city
VALUES(
      10383,
      'Berkeley',
      234
);

INSERT INTO city
VALUES(
      10384,
      'Marina',
      234
);

INSERT INTO city
VALUES(
      10385,
      'Los Altos Hills',
      234
);

INSERT INTO city
VALUES(
      10386,
      'San Luis Obispo',
      234
);

INSERT INTO city
VALUES(
      10387,
      'Napa',
      234
);

INSERT INTO city
VALUES(
      10388,
      'Baldwin Park',
      234
);

INSERT INTO city
VALUES(
      10389,
      'Winters',
      234
);

INSERT INTO city
VALUES(
      10390,
      'Davis',
      234
);

INSERT INTO city
VALUES(
      10391,
      'La Habra',
      234
);

INSERT INTO city
VALUES(
      10392,
      'Lafayette',
      234
);

INSERT INTO city
VALUES(
      10393,
      'Rancho Cucamonga',
      234
);

INSERT INTO city
VALUES(
      10394,
      'Indian Wells',
      234
);

INSERT INTO city
VALUES(
      10395,
      'Newport Beach',
      234
);

INSERT INTO city
VALUES(
      10396,
      'Bell',
      234
);

INSERT INTO city
VALUES(
      10397,
      'Goleta',
      234
);

INSERT INTO city
VALUES(
      10398,
      'Grover Beach',
      234
);

INSERT INTO city
VALUES(
      10399,
      'Willits',
      234
);

INSERT INTO city
VALUES(
      10400,
      'Culver City',
      234
);

INSERT INTO city
VALUES(
      10401,
      'Citrus Heights',
      234
);

INSERT INTO city
VALUES(
      10402,
      'Pismo Beach',
      234
);

INSERT INTO city
VALUES(
      10403,
      'Taft',
      234
);

INSERT INTO city
VALUES(
      10404,
      'Covina',
      234
);

INSERT INTO city
VALUES(
      10405,
      'Oakland',
      234
);

INSERT INTO city
VALUES(
      10406,
      'West Hollywood',
      234
);

INSERT INTO city
VALUES(
      10407,
      'Capitola',
      234
);

INSERT INTO city
VALUES(
      10408,
      'Chico',
      234
);

INSERT INTO city
VALUES(
      10409,
      'Diamond Bar',
      234
);

INSERT INTO city
VALUES(
      10410,
      'Garden Grove',
      234
);

INSERT INTO city
VALUES(
      10411,
      'Bellflower',
      234
);

INSERT INTO city
VALUES(
      10412,
      'San Mateo',
      234
);

INSERT INTO city
VALUES(
      10413,
      'Oceanside',
      234
);

INSERT INTO city
VALUES(
      10414,
      'San Diego',
      234
);

INSERT INTO city
VALUES(
      10415,
      'Palos Verdes Estates',
      234
);

INSERT INTO city
VALUES(
      10416,
      'San Jose',
      234
);

INSERT INTO city
VALUES(
      10417,
      'South Lake Tahoe',
      234
);

INSERT INTO city
VALUES(
      10418,
      'Carlsbad',
      234
);

INSERT INTO city
VALUES(
      10419,
      'Redlands',
      234
);

INSERT INTO city
VALUES(
      10420,
      'Clovis',
      234
);

INSERT INTO city
VALUES(
      10421,
      'Mountain View',
      234
);

INSERT INTO city
VALUES(
      10422,
      'Lathrop',
      234
);

INSERT INTO city
VALUES(
      10423,
      'Truckee',
      234
);

INSERT INTO city
VALUES(
      10424,
      'Monterey',
      234
);

INSERT INTO city
VALUES(
      10425,
      'Oxnard',
      234
);

INSERT INTO city
VALUES(
      10426,
      'Clayton',
      234
);

INSERT INTO city
VALUES(
      10427,
      'Woodlake',
      234
);

INSERT INTO city
VALUES(
      10428,
      'Villa Park',
      234
);

INSERT INTO city
VALUES(
      10429,
      'Redondo Beach',
      234
);

INSERT INTO city
VALUES(
      10430,
      'Gonzales',
      234
);

INSERT INTO city
VALUES(
      10431,
      'Orland',
      234
);

INSERT INTO city
VALUES(
      10432,
      'Pico Rivera',
      234
);

INSERT INTO city
VALUES(
      10433,
      'Stanton',
      234
);

INSERT INTO city
VALUES(
      10434,
      'Thousand Oaks',
      234
);

INSERT INTO city
VALUES(
      10435,
      'Colton',
      234
);

INSERT INTO city
VALUES(
      10436,
      'Shafter',
      234
);

INSERT INTO city
VALUES(
      10437,
      'Cerritos',
      234
);

INSERT INTO city
VALUES(
      10438,
      'Montclair',
      234
);

INSERT INTO city
VALUES(
      10439,
      'Port Hueneme',
      234
);

INSERT INTO city
VALUES(
      10440,
      'Claremont',
      234
);

INSERT INTO city
VALUES(
      10441,
      'Chino',
      234
);

INSERT INTO city
VALUES(
      10442,
      'Orange Cove',
      234
);

INSERT INTO city
VALUES(
      10443,
      'Grass Valley',
      234
);

INSERT INTO city
VALUES(
      10444,
      'Placentia',
      234
);

INSERT INTO city
VALUES(
      10445,
      'Placerville',
      234
);

INSERT INTO city
VALUES(
      10446,
      'Lincoln',
      234
);

INSERT INTO city
VALUES(
      10447,
      'Anderson',
      234
);

INSERT INTO city
VALUES(
      10448,
      'Auburn',
      234
);

INSERT INTO city
VALUES(
      10449,
      'Lawndale',
      234
);

INSERT INTO city
VALUES(
      10450,
      'Westminster',
      234
);

INSERT INTO city
VALUES(
      10451,
      'Patterson',
      234
);

INSERT INTO city
VALUES(
      10452,
      'Grand Terrace',
      234
);

INSERT INTO city
VALUES(
      10453,
      'Lindsay',
      234
);

INSERT INTO city
VALUES(
      10454,
      'Beverly Hills',
      234
);

INSERT INTO city
VALUES(
      10455,
      'Union City',
      234
);

INSERT INTO city
VALUES(
      10456,
      'Bishop',
      234
);

INSERT INTO city
VALUES(
      10457,
      'La Verne',
      234
);

INSERT INTO city
VALUES(
      10458,
      'Yucca Valley',
      234
);

INSERT INTO city
VALUES(
      10459,
      'Needles',
      234
);

INSERT INTO city
VALUES(
      10460,
      'King City',
      234
);

INSERT INTO city
VALUES(
      10461,
      'Visalia',
      234
);

INSERT INTO city
VALUES(
      10462,
      'San Leandro',
      234
);

INSERT INTO city
VALUES(
      10463,
      'Larkspur',
      234
);

INSERT INTO city
VALUES(
      10464,
      'Banning',
      234
);

INSERT INTO city
VALUES(
      10465,
      'Poway',
      234
);

INSERT INTO city
VALUES(
      10466,
      'Los Angeles',
      234
);

INSERT INTO city
VALUES(
      10467,
      'Santa Paula',
      234
);

INSERT INTO city
VALUES(
      10468,
      'Dinuba',
      234
);

INSERT INTO city
VALUES(
      10469,
      'Modesto',
      234
);

INSERT INTO city
VALUES(
      10470,
      'La Mirada',
      234
);

INSERT INTO city
VALUES(
      10471,
      'Ione',
      234
);

INSERT INTO city
VALUES(
      10472,
      'Rio Vista',
      234
);

INSERT INTO city
VALUES(
      10473,
      'Santa Clara',
      234
);

INSERT INTO city
VALUES(
      10474,
      'Dana Point',
      234
);

INSERT INTO city
VALUES(
      10475,
      'Perris',
      234
);

INSERT INTO city
VALUES(
      10476,
      'Rohnert Park',
      234
);

INSERT INTO city
VALUES(
      10477,
      'Livingston',
      234
);

INSERT INTO city
VALUES(
      10478,
      'Martinez',
      234
);

INSERT INTO city
VALUES(
      10479,
      'Inglewood',
      234
);

INSERT INTO city
VALUES(
      10480,
      'Imperial',
      234
);

INSERT INTO city
VALUES(
      10481,
      'San Ramon',
      234
);

INSERT INTO city
VALUES(
      10482,
      'Canyon Lake',
      234
);

INSERT INTO city
VALUES(
      10483,
      'Coalinga',
      234
);

INSERT INTO city
VALUES(
      10484,
      'Tehachapi',
      234
);

INSERT INTO city
VALUES(
      10485,
      'Solvang',
      234
);

INSERT INTO city
VALUES(
      10486,
      'Dos Palos',
      234
);

INSERT INTO city
VALUES(
      10487,
      'La Puente',
      234
);

INSERT INTO city
VALUES(
      10488,
      'Farmersville',
      234
);

INSERT INTO city
VALUES(
      10489,
      'South El Monte',
      234
);

INSERT INTO city
VALUES(
      10490,
      'Corcoran',
      234
);

INSERT INTO city
VALUES(
      10491,
      'Agoura Hills',
      234
);

INSERT INTO city
VALUES(
      10492,
      'Soledad',
      234
);

INSERT INTO city
VALUES(
      10493,
      'Calimesa',
      234
);

INSERT INTO city
VALUES(
      10494,
      'Atascadero',
      234
);

INSERT INTO city
VALUES(
      10495,
      'Galt',
      234
);

INSERT INTO city
VALUES(
      10496,
      'Arroyo Grande',
      234
);

INSERT INTO city
VALUES(
      10497,
      'California City',
      234
);

INSERT INTO city
VALUES(
      10498,
      'Danville',
      234
);

INSERT INTO city
VALUES(
      10499,
      'Oroville',
      234
);

INSERT INTO city
VALUES(
      10500,
      'Huntington Beach',
      234
);

INSERT INTO city
VALUES(
      10501,
      'San Pablo',
      234
);

INSERT INTO city
VALUES(
      10502,
      'Seal Beach',
      234
);

INSERT INTO city
VALUES(
      10503,
      'Tulare',
      234
);

INSERT INTO city
VALUES(
      10504,
      'Rancho Mirage',
      234
);

INSERT INTO city
VALUES(
      10505,
      'McFarland',
      234
);

INSERT INTO city
VALUES(
      10506,
      'Lake Forest',
      234
);

INSERT INTO city
VALUES(
      10507,
      'Highland',
      234
);

INSERT INTO city
VALUES(
      10508,
      'Sonoma',
      234
);

INSERT INTO city
VALUES(
      10509,
      'Kingsburg',
      234
);

INSERT INTO city
VALUES(
      10510,
      'Avenal',
      234
);

INSERT INTO city
VALUES(
      10511,
      'Morro Bay',
      234
);

INSERT INTO city
VALUES(
      10512,
      'Hayward',
      234
);

INSERT INTO city
VALUES(
      10513,
      'Yuba City',
      234
);

INSERT INTO city
VALUES(
      10514,
      'Novato',
      234
);

INSERT INTO city
VALUES(
      10515,
      'La Mesa',
      234
);

INSERT INTO city
VALUES(
      10516,
      'Montebello',
      234
);

INSERT INTO city
VALUES(
      10517,
      'Fernley',
      234
);

INSERT INTO city
VALUES(
      10518,
      'West Wendover',
      234
);

INSERT INTO city
VALUES(
      10519,
      'Henderson',
      234
);

INSERT INTO city
VALUES(
      10520,
      'Mesquite',
      234
);

INSERT INTO city
VALUES(
      10521,
      'Winnemucca',
      234
);

INSERT INTO city
VALUES(
      10522,
      'Carson City',
      234
);

INSERT INTO city
VALUES(
      10523,
      'Fallon',
      234
);

INSERT INTO city
VALUES(
      10524,
      'Boulder City',
      234
);

INSERT INTO city
VALUES(
      10525,
      'Las Vegas',
      234
);

INSERT INTO city
VALUES(
      10526,
      'Sparks',
      234
);

INSERT INTO city
VALUES(
      10527,
      'North Las Vegas',
      234
);

INSERT INTO city
VALUES(
      10528,
      'Elko',
      234
);

INSERT INTO city
VALUES(
      10529,
      'Reno',
      234
);

INSERT INTO city
VALUES(
      10530,
      'Alamosa',
      234
);

INSERT INTO city
VALUES(
      10531,
      'Rifle',
      234
);

INSERT INTO city
VALUES(
      10532,
      'Castle Pines',
      234
);

INSERT INTO city
VALUES(
      10533,
      'Parker',
      234
);

INSERT INTO city
VALUES(
      10534,
      'Vail',
      234
);

INSERT INTO city
VALUES(
      10535,
      'Windsor',
      234
);

INSERT INTO city
VALUES(
      10536,
      'Denver',
      234
);

INSERT INTO city
VALUES(
      10537,
      'Lone Tree',
      234
);

INSERT INTO city
VALUES(
      10538,
      'Edgewater',
      234
);

INSERT INTO city
VALUES(
      10539,
      'Fort Morgan',
      234
);

INSERT INTO city
VALUES(
      10540,
      'Thornton',
      234
);

INSERT INTO city
VALUES(
      10541,
      'Louisville',
      234
);

INSERT INTO city
VALUES(
      10542,
      'Fountain',
      234
);

INSERT INTO city
VALUES(
      10543,
      'Loveland',
      234
);

INSERT INTO city
VALUES(
      10544,
      'Estes Park',
      234
);

INSERT INTO city
VALUES(
      10545,
      'Wellington',
      234
);

INSERT INTO city
VALUES(
      10546,
      'Eagle',
      234
);

INSERT INTO city
VALUES(
      10547,
      'Lakewood',
      234
);

INSERT INTO city
VALUES(
      10548,
      'Montrose',
      234
);

INSERT INTO city
VALUES(
      10549,
      'Lochbuie',
      234
);

INSERT INTO city
VALUES(
      10550,
      'Manitou Springs',
      234
);

INSERT INTO city
VALUES(
      10551,
      'Silverthorne',
      234
);

INSERT INTO city
VALUES(
      10552,
      'Avon',
      234
);

INSERT INTO city
VALUES(
      10553,
      'Superior',
      234
);

INSERT INTO city
VALUES(
      10554,
      'Aspen',
      234
);

INSERT INTO city
VALUES(
      10555,
      'Centennial',
      234
);

INSERT INTO city
VALUES(
      10556,
      'Evans',
      234
);

INSERT INTO city
VALUES(
      10557,
      'Erie',
      234
);

INSERT INTO city
VALUES(
      10558,
      'Firestone',
      234
);

INSERT INTO city
VALUES(
      10559,
      'Delta',
      234
);

INSERT INTO city
VALUES(
      10560,
      'Cortez',
      234
);

INSERT INTO city
VALUES(
      10561,
      'Wheat Ridge',
      234
);

INSERT INTO city
VALUES(
      10562,
      'Craig',
      234
);

INSERT INTO city
VALUES(
      10563,
      'Colorado Springs',
      234
);

INSERT INTO city
VALUES(
      10564,
      'Berthoud',
      234
);

INSERT INTO city
VALUES(
      10565,
      'Trinidad',
      234
);

INSERT INTO city
VALUES(
      10566,
      'Durango',
      234
);

INSERT INTO city
VALUES(
      10567,
      'Westminster',
      234
);

INSERT INTO city
VALUES(
      10568,
      'Grand Junction',
      234
);

INSERT INTO city
VALUES(
      10569,
      'La Junta',
      234
);

INSERT INTO city
VALUES(
      10570,
      'Frederick',
      234
);

INSERT INTO city
VALUES(
      10571,
      'Lafayette',
      234
);

INSERT INTO city
VALUES(
      10572,
      'Broomfield',
      234
);

INSERT INTO city
VALUES(
      10573,
      'Gunnison',
      234
);

INSERT INTO city
VALUES(
      10574,
      'Federal Heights',
      234
);

INSERT INTO city
VALUES(
      10575,
      'Greenwood Village',
      234
);

INSERT INTO city
VALUES(
      10576,
      'Eaton',
      234
);

INSERT INTO city
VALUES(
      10577,
      'Arvada',
      234
);

INSERT INTO city
VALUES(
      10578,
      'Aurora',
      234
);

INSERT INTO city
VALUES(
      10579,
      'Basalt',
      234
);

INSERT INTO city
VALUES(
      10580,
      'Woodland Park',
      234
);

INSERT INTO city
VALUES(
      10581,
      'Dacono',
      234
);

INSERT INTO city
VALUES(
      10582,
      'Brush',
      234
);

INSERT INTO city
VALUES(
      10583,
      'Lamar',
      234
);

INSERT INTO city
VALUES(
      10584,
      'Littleton',
      234
);

INSERT INTO city
VALUES(
      10585,
      'Sterling',
      234
);

INSERT INTO city
VALUES(
      10586,
      'Pagosa Springs',
      234
);

INSERT INTO city
VALUES(
      10587,
      'Gypsum',
      234
);

INSERT INTO city
VALUES(
      10588,
      'Glenwood Springs',
      234
);

INSERT INTO city
VALUES(
      10589,
      'Glendale',
      234
);

INSERT INTO city
VALUES(
      10590,
      'Steamboat Springs',
      234
);

INSERT INTO city
VALUES(
      10591,
      'Canon City',
      234
);

INSERT INTO city
VALUES(
      10592,
      'Castle Rock',
      234
);

INSERT INTO city
VALUES(
      10593,
      'Salida',
      234
);

INSERT INTO city
VALUES(
      10594,
      'Pueblo',
      234
);

INSERT INTO city
VALUES(
      10595,
      'Sheridan',
      234
);

INSERT INTO city
VALUES(
      10596,
      'Breckenridge',
      234
);

INSERT INTO city
VALUES(
      10597,
      'Fort Lupton',
      234
);

INSERT INTO city
VALUES(
      10598,
      'Fruita',
      234
);

INSERT INTO city
VALUES(
      10599,
      'Longmont',
      234
);

INSERT INTO city
VALUES(
      10600,
      'Fort Collins',
      234
);

INSERT INTO city
VALUES(
      10601,
      'Commerce City',
      234
);

INSERT INTO city
VALUES(
      10602,
      'Carbondale',
      234
);

INSERT INTO city
VALUES(
      10603,
      'Boulder',
      234
);

INSERT INTO city
VALUES(
      10604,
      'Englewood',
      234
);

INSERT INTO city
VALUES(
      10605,
      'Cherry Hills Village',
      234
);

INSERT INTO city
VALUES(
      10606,
      'Leadville',
      234
);

INSERT INTO city
VALUES(
      10607,
      'Milliken',
      234
);

INSERT INTO city
VALUES(
      10608,
      'Golden',
      234
);

INSERT INTO city
VALUES(
      10609,
      'Greeley',
      234
);

INSERT INTO city
VALUES(
      10610,
      'Brighton',
      234
);

INSERT INTO city
VALUES(
      10611,
      'Florence',
      234
);

INSERT INTO city
VALUES(
      10612,
      'Johnstown',
      234
);

INSERT INTO city
VALUES(
      10613,
      'Northglenn',
      234
);

INSERT INTO city
VALUES(
      10614,
      'Monument',
      234
);

INSERT INTO city
VALUES(
      10615,
      'New Castle',
      234
);

INSERT INTO city
VALUES(
      10616,
      'Kodiak',
      234
);

INSERT INTO city
VALUES(
      10617,
      'Anchorage',
      234
);

INSERT INTO city
VALUES(
      10618,
      'Wasilla',
      234
);

INSERT INTO city
VALUES(
      10619,
      'Palmer',
      234
);

INSERT INTO city
VALUES(
      10620,
      'Soldotna',
      234
);

INSERT INTO city
VALUES(
      10621,
      'Kenai',
      234
);

INSERT INTO city
VALUES(
      10622,
      'Homer',
      234
);

INSERT INTO city
VALUES(
      10623,
      'Fairbanks',
      234
);

INSERT INTO city
VALUES(
      10624,
      'Ketchikan',
      234
);

INSERT INTO city
VALUES(
      10625,
      'Juneau',
      234
);

INSERT INTO city
VALUES(
      10626,
      'Sitka',
      234
);

INSERT INTO city
VALUES(
      10627,
      'Pinson',
      234
);

INSERT INTO city
VALUES(
      10628,
      'Hoover',
      234
);

INSERT INTO city
VALUES(
      10629,
      'Trussville',
      234
);

INSERT INTO city
VALUES(
      10630,
      'Bessemer',
      234
);

INSERT INTO city
VALUES(
      10631,
      'Spanish Fort',
      234
);

INSERT INTO city
VALUES(
      10632,
      'Center Point',
      234
);

INSERT INTO city
VALUES(
      10633,
      'Lanett',
      234
);

INSERT INTO city
VALUES(
      10634,
      'Phenix City',
      234
);

INSERT INTO city
VALUES(
      10635,
      'Sheffield',
      234
);

INSERT INTO city
VALUES(
      10636,
      'Hamilton',
      234
);

INSERT INTO city
VALUES(
      10637,
      'Gadsden',
      234
);

INSERT INTO city
VALUES(
      10638,
      'Calera',
      234
);

INSERT INTO city
VALUES(
      10639,
      'Clay',
      234
);

INSERT INTO city
VALUES(
      10640,
      'Talladega',
      234
);

INSERT INTO city
VALUES(
      10641,
      'Scottsboro',
      234
);

INSERT INTO city
VALUES(
      10642,
      'Russellville',
      234
);

INSERT INTO city
VALUES(
      10643,
      'Alabaster',
      234
);

INSERT INTO city
VALUES(
      10644,
      'Glencoe',
      234
);

INSERT INTO city
VALUES(
      10645,
      'Opelika',
      234
);

INSERT INTO city
VALUES(
      10646,
      'Pike Road',
      234
);

INSERT INTO city
VALUES(
      10647,
      'Tuscaloosa',
      234
);

INSERT INTO city
VALUES(
      10648,
      'Sylacauga',
      234
);

INSERT INTO city
VALUES(
      10649,
      'Montgomery',
      234
);

INSERT INTO city
VALUES(
      10650,
      'Fairhope',
      234
);

INSERT INTO city
VALUES(
      10651,
      'Rainbow City',
      234
);

INSERT INTO city
VALUES(
      10652,
      'Hartselle',
      234
);

INSERT INTO city
VALUES(
      10653,
      'Alexander City',
      234
);

INSERT INTO city
VALUES(
      10654,
      'Wetumpka',
      234
);

INSERT INTO city
VALUES(
      10655,
      'Mobile',
      234
);

INSERT INTO city
VALUES(
      10656,
      'Clanton',
      234
);

INSERT INTO city
VALUES(
      10657,
      'Muscle Shoals',
      234
);

INSERT INTO city
VALUES(
      10658,
      'Oxford',
      234
);

INSERT INTO city
VALUES(
      10659,
      'Selma',
      234
);

INSERT INTO city
VALUES(
      10660,
      'Tuscumbia',
      234
);

INSERT INTO city
VALUES(
      10661,
      'Satsuma',
      234
);

INSERT INTO city
VALUES(
      10662,
      'Northport',
      234
);

INSERT INTO city
VALUES(
      10663,
      'Daleville',
      234
);

INSERT INTO city
VALUES(
      10664,
      'Pelham',
      234
);

INSERT INTO city
VALUES(
      10665,
      'Prattville',
      234
);

INSERT INTO city
VALUES(
      10666,
      'Homewood',
      234
);

INSERT INTO city
VALUES(
      10667,
      'Montevallo',
      234
);

INSERT INTO city
VALUES(
      10668,
      'Gulf Shores',
      234
);

INSERT INTO city
VALUES(
      10669,
      'Lincoln',
      234
);

INSERT INTO city
VALUES(
      10670,
      'Enterprise',
      234
);

INSERT INTO city
VALUES(
      10671,
      'Jacksonville',
      234
);

INSERT INTO city
VALUES(
      10672,
      'Robertsdale',
      234
);

INSERT INTO city
VALUES(
      10673,
      'Vestavia Hills',
      234
);

INSERT INTO city
VALUES(
      10674,
      'Valley',
      234
);

INSERT INTO city
VALUES(
      10675,
      'Arab',
      234
);

INSERT INTO city
VALUES(
      10676,
      'Dothan',
      234
);

INSERT INTO city
VALUES(
      10677,
      'Decatur',
      234
);

INSERT INTO city
VALUES(
      10678,
      'Pleasant Grove',
      234
);

INSERT INTO city
VALUES(
      10679,
      'Bay Minette',
      234
);

INSERT INTO city
VALUES(
      10680,
      'Saraland',
      234
);

INSERT INTO city
VALUES(
      10681,
      'Leeds',
      234
);

INSERT INTO city
VALUES(
      10682,
      'Chickasaw',
      234
);

INSERT INTO city
VALUES(
      10683,
      'Tarrant',
      234
);

INSERT INTO city
VALUES(
      10684,
      'Anniston',
      234
);

INSERT INTO city
VALUES(
      10685,
      'Brent',
      234
);

INSERT INTO city
VALUES(
      10686,
      'Cullman',
      234
);

INSERT INTO city
VALUES(
      10687,
      'Auburn',
      234
);

INSERT INTO city
VALUES(
      10688,
      'Birmingham',
      234
);

INSERT INTO city
VALUES(
      10689,
      'Millbrook',
      234
);

INSERT INTO city
VALUES(
      10690,
      'Helena',
      234
);

INSERT INTO city
VALUES(
      10691,
      'Pell City',
      234
);

INSERT INTO city
VALUES(
      10692,
      'Midfield',
      234
);

INSERT INTO city
VALUES(
      10693,
      'Tuskegee',
      234
);

INSERT INTO city
VALUES(
      10694,
      'Fort Payne',
      234
);

INSERT INTO city
VALUES(
      10695,
      'Oneonta',
      234
);

INSERT INTO city
VALUES(
      10696,
      'Demopolis',
      234
);

INSERT INTO city
VALUES(
      10697,
      'Atmore',
      234
);

INSERT INTO city
VALUES(
      10698,
      'Guntersville',
      234
);

INSERT INTO city
VALUES(
      10699,
      'Moody',
      234
);

INSERT INTO city
VALUES(
      10700,
      'Attalla',
      234
);

INSERT INTO city
VALUES(
      10701,
      'Orange Beach',
      234
);

INSERT INTO city
VALUES(
      10702,
      'Athens',
      234
);

INSERT INTO city
VALUES(
      10703,
      'Foley',
      234
);

INSERT INTO city
VALUES(
      10704,
      'Huntsville',
      234
);

INSERT INTO city
VALUES(
      10705,
      'Smiths Station',
      234
);

INSERT INTO city
VALUES(
      10706,
      'Brewton',
      234
);

INSERT INTO city
VALUES(
      10707,
      'Prichard',
      234
);

INSERT INTO city
VALUES(
      10708,
      'Andalusia',
      234
);

INSERT INTO city
VALUES(
      10709,
      'Mountain Brook',
      234
);

INSERT INTO city
VALUES(
      10710,
      'Daphne',
      234
);

INSERT INTO city
VALUES(
      10711,
      'Troy',
      234
);

INSERT INTO city
VALUES(
      10712,
      'Jasper',
      234
);

INSERT INTO city
VALUES(
      10713,
      'Eufaula',
      234
);

INSERT INTO city
VALUES(
      10714,
      'Gardendale',
      234
);

INSERT INTO city
VALUES(
      10715,
      'Albertville',
      234
);

INSERT INTO city
VALUES(
      10716,
      'Madison',
      234
);

INSERT INTO city
VALUES(
      10717,
      'Greenville',
      234
);

INSERT INTO city
VALUES(
      10718,
      'Fairfield',
      234
);

INSERT INTO city
VALUES(
      10719,
      'Ozark',
      234
);

INSERT INTO city
VALUES(
      10720,
      'Hueytown',
      234
);

INSERT INTO city
VALUES(
      10721,
      'Southside',
      234
);

INSERT INTO city
VALUES(
      10722,
      'Irondale',
      234
);

INSERT INTO city
VALUES(
      10723,
      'Chelsea',
      234
);

INSERT INTO city
VALUES(
      10724,
      'Boaz',
      234
);

INSERT INTO city
VALUES(
      10725,
      'Rainsville',
      234
);

INSERT INTO city
VALUES(
      10726,
      'Florence',
      234
);

INSERT INTO city
VALUES(
      10727,
      'Fultondale',
      234
);

INSERT INTO city
VALUES(
      10728,
      'Springdale',
      234
);

INSERT INTO city
VALUES(
      10729,
      'Batesville',
      234
);

INSERT INTO city
VALUES(
      10730,
      'Clarksville',
      234
);

INSERT INTO city
VALUES(
      10731,
      'Pea Ridge',
      234
);

INSERT INTO city
VALUES(
      10732,
      'Centerton',
      234
);

INSERT INTO city
VALUES(
      10733,
      'Stuttgart',
      234
);

INSERT INTO city
VALUES(
      10734,
      'West Memphis',
      234
);

INSERT INTO city
VALUES(
      10735,
      'Osceola',
      234
);

INSERT INTO city
VALUES(
      10736,
      'Beebe',
      234
);

INSERT INTO city
VALUES(
      10737,
      'Arkadelphia',
      234
);

INSERT INTO city
VALUES(
      10738,
      'Bella Vista',
      234
);

INSERT INTO city
VALUES(
      10739,
      'Van Buren',
      234
);

INSERT INTO city
VALUES(
      10740,
      'Monticello',
      234
);

INSERT INTO city
VALUES(
      10741,
      'Jonesboro',
      234
);

INSERT INTO city
VALUES(
      10742,
      'Rogers',
      234
);

INSERT INTO city
VALUES(
      10743,
      'Heber Springs',
      234
);

INSERT INTO city
VALUES(
      10744,
      'North Little Rock',
      234
);

INSERT INTO city
VALUES(
      10745,
      'Blytheville',
      234
);

INSERT INTO city
VALUES(
      10746,
      'Hot Springs',
      234
);

INSERT INTO city
VALUES(
      10747,
      'Camden',
      234
);

INSERT INTO city
VALUES(
      10748,
      'Ward',
      234
);

INSERT INTO city
VALUES(
      10749,
      'Siloam Springs',
      234
);

INSERT INTO city
VALUES(
      10750,
      'Maumelle',
      234
);

INSERT INTO city
VALUES(
      10751,
      'Helena-West Helena',
      234
);

INSERT INTO city
VALUES(
      10752,
      'Searcy',
      234
);

INSERT INTO city
VALUES(
      10753,
      'El Dorado',
      234
);

INSERT INTO city
VALUES(
      10754,
      'Little Rock',
      234
);

INSERT INTO city
VALUES(
      10755,
      'Benton',
      234
);

INSERT INTO city
VALUES(
      10756,
      'Crossett',
      234
);

INSERT INTO city
VALUES(
      10757,
      'Marion',
      234
);

INSERT INTO city
VALUES(
      10758,
      'Newport',
      234
);

INSERT INTO city
VALUES(
      10759,
      'Lowell',
      234
);

INSERT INTO city
VALUES(
      10760,
      'Wynne',
      234
);

INSERT INTO city
VALUES(
      10761,
      'Sherwood',
      234
);

INSERT INTO city
VALUES(
      10762,
      'Forrest City',
      234
);

INSERT INTO city
VALUES(
      10763,
      'Farmington',
      234
);

INSERT INTO city
VALUES(
      10764,
      'Fayetteville',
      234
);

INSERT INTO city
VALUES(
      10765,
      'Conway',
      234
);

INSERT INTO city
VALUES(
      10766,
      'Harrison',
      234
);

INSERT INTO city
VALUES(
      10767,
      'Mena',
      234
);

INSERT INTO city
VALUES(
      10768,
      'Hope',
      234
);

INSERT INTO city
VALUES(
      10769,
      'Pine Bluff',
      234
);

INSERT INTO city
VALUES(
      10770,
      'Alma',
      234
);

INSERT INTO city
VALUES(
      10771,
      'De Queen',
      234
);

INSERT INTO city
VALUES(
      10772,
      'Mountain Home',
      234
);

INSERT INTO city
VALUES(
      10773,
      'Magnolia',
      234
);

INSERT INTO city
VALUES(
      10774,
      'Greenwood',
      234
);

INSERT INTO city
VALUES(
      10775,
      'White Hall',
      234
);

INSERT INTO city
VALUES(
      10776,
      'Malvern',
      234
);

INSERT INTO city
VALUES(
      10777,
      'Warren',
      234
);

INSERT INTO city
VALUES(
      10778,
      'Morrilton',
      234
);

INSERT INTO city
VALUES(
      10779,
      'Pocahontas',
      234
);

INSERT INTO city
VALUES(
      10780,
      'Bryant',
      234
);

INSERT INTO city
VALUES(
      10781,
      'Walnut Ridge',
      234
);

INSERT INTO city
VALUES(
      10782,
      'Fort Smith',
      234
);

INSERT INTO city
VALUES(
      10783,
      'Russellville',
      234
);

INSERT INTO city
VALUES(
      10784,
      'Trumann',
      234
);

INSERT INTO city
VALUES(
      10785,
      'Bentonville',
      234
);

INSERT INTO city
VALUES(
      10786,
      'Cabot',
      234
);

INSERT INTO city
VALUES(
      10787,
      'Jacksonville',
      234
);

INSERT INTO city
VALUES(
      10788,
      'Paragould',
      234
);

INSERT INTO city
VALUES(
      10789,
      'Texarkana',
      234
);

INSERT INTO city
VALUES(
      10790,
      'Barre',
      234
);

INSERT INTO city
VALUES(
      10791,
      'Winooski',
      234
);

INSERT INTO city
VALUES(
      10792,
      'Montpelier',
      234
);

INSERT INTO city
VALUES(
      10793,
      'Burlington',
      234
);

INSERT INTO city
VALUES(
      10794,
      'Saint Albans',
      234
);

INSERT INTO city
VALUES(
      10795,
      'South Burlington',
      234
);

INSERT INTO city
VALUES(
      10796,
      'Essex Junction',
      234
);

INSERT INTO city
VALUES(
      10797,
      'Rutland',
      234
);

INSERT INTO city
VALUES(
      10798,
      'Bellows Falls',
      234
);

INSERT INTO city
VALUES(
      10799,
      'East Alton',
      234
);

INSERT INTO city
VALUES(
      10800,
      'Homer Glen',
      234
);

INSERT INTO city
VALUES(
      10801,
      'Waterloo',
      234
);

INSERT INTO city
VALUES(
      10802,
      'Chicago Ridge',
      234
);

INSERT INTO city
VALUES(
      10803,
      'Libertyville',
      234
);

INSERT INTO city
VALUES(
      10804,
      'Elburn',
      234
);

INSERT INTO city
VALUES(
      10805,
      'Willow Springs',
      234
);

INSERT INTO city
VALUES(
      10806,
      'New Lenox',
      234
);

INSERT INTO city
VALUES(
      10807,
      'Burbank',
      234
);

INSERT INTO city
VALUES(
      10808,
      'Algonquin',
      234
);

INSERT INTO city
VALUES(
      10809,
      'Hanover Park',
      234
);

INSERT INTO city
VALUES(
      10810,
      'Lockport',
      234
);

INSERT INTO city
VALUES(
      10811,
      'Quincy',
      234
);

INSERT INTO city
VALUES(
      10812,
      'Harvey',
      234
);

INSERT INTO city
VALUES(
      10813,
      'South Holland',
      234
);

INSERT INTO city
VALUES(
      10814,
      'Maywood',
      234
);

INSERT INTO city
VALUES(
      10815,
      'Mokena',
      234
);

INSERT INTO city
VALUES(
      10816,
      'Long Grove',
      234
);

INSERT INTO city
VALUES(
      10817,
      'Elk Grove Village',
      234
);

INSERT INTO city
VALUES(
      10818,
      'Countryside',
      234
);

INSERT INTO city
VALUES(
      10819,
      'Cicero',
      234
);

INSERT INTO city
VALUES(
      10820,
      'Peoria Heights',
      234
);

INSERT INTO city
VALUES(
      10821,
      'Montgomery',
      234
);

INSERT INTO city
VALUES(
      10822,
      'Addison',
      234
);

INSERT INTO city
VALUES(
      10823,
      'Harrisburg',
      234
);

INSERT INTO city
VALUES(
      10824,
      'Oak Brook',
      234
);

INSERT INTO city
VALUES(
      10825,
      'Vandalia',
      234
);

INSERT INTO city
VALUES(
      10826,
      'Dwight',
      234
);

INSERT INTO city
VALUES(
      10827,
      'River Forest',
      234
);

INSERT INTO city
VALUES(
      10828,
      'Milan',
      234
);

INSERT INTO city
VALUES(
      10829,
      'Frankfort',
      234
);

INSERT INTO city
VALUES(
      10830,
      'Evanston',
      234
);

INSERT INTO city
VALUES(
      10831,
      'Chatham',
      234
);

INSERT INTO city
VALUES(
      10832,
      'Godfrey',
      234
);

INSERT INTO city
VALUES(
      10833,
      'Freeport',
      234
);

INSERT INTO city
VALUES(
      10834,
      'Clinton',
      234
);

INSERT INTO city
VALUES(
      10835,
      'Arlington Heights',
      234
);

INSERT INTO city
VALUES(
      10836,
      'Deerfield',
      234
);

INSERT INTO city
VALUES(
      10837,
      'Markham',
      234
);

INSERT INTO city
VALUES(
      10838,
      'Charleston',
      234
);

INSERT INTO city
VALUES(
      10839,
      'Channahon',
      234
);

INSERT INTO city
VALUES(
      10840,
      'Hillside',
      234
);

INSERT INTO city
VALUES(
      10841,
      'Spring Valley',
      234
);

INSERT INTO city
VALUES(
      10842,
      'Chicago',
      234
);

INSERT INTO city
VALUES(
      10843,
      'DeKalb',
      234
);

INSERT INTO city
VALUES(
      10844,
      'Marengo',
      234
);

INSERT INTO city
VALUES(
      10845,
      'Lincolnshire',
      234
);

INSERT INTO city
VALUES(
      10846,
      'Posen',
      234
);

INSERT INTO city
VALUES(
      10847,
      'Benton',
      234
);

INSERT INTO city
VALUES(
      10848,
      'Wood River',
      234
);

INSERT INTO city
VALUES(
      10849,
      'Anna',
      234
);

INSERT INTO city
VALUES(
      10850,
      'West Frankfort',
      234
);

INSERT INTO city
VALUES(
      10851,
      'Carpentersville',
      234
);

INSERT INTO city
VALUES(
      10852,
      'Mattoon',
      234
);

INSERT INTO city
VALUES(
      10853,
      'Washington',
      234
);

INSERT INTO city
VALUES(
      10854,
      'Taylorville',
      234
);

INSERT INTO city
VALUES(
      10855,
      'Beach Park',
      234
);

INSERT INTO city
VALUES(
      10856,
      'Hickory Hills',
      234
);

INSERT INTO city
VALUES(
      10857,
      'Elgin',
      234
);

INSERT INTO city
VALUES(
      10858,
      'Lynwood',
      234
);

INSERT INTO city
VALUES(
      10859,
      'Berwyn',
      234
);

INSERT INTO city
VALUES(
      10860,
      'Mendota',
      234
);

INSERT INTO city
VALUES(
      10861,
      'Lemont',
      234
);

INSERT INTO city
VALUES(
      10862,
      'Morris',
      234
);

INSERT INTO city
VALUES(
      10863,
      'Oak Forest',
      234
);

INSERT INTO city
VALUES(
      10864,
      'Hazel Crest',
      234
);

INSERT INTO city
VALUES(
      10865,
      'Naperville',
      234
);

INSERT INTO city
VALUES(
      10866,
      'Granite City',
      234
);

INSERT INTO city
VALUES(
      10867,
      'Jerseyville',
      234
);

INSERT INTO city
VALUES(
      10868,
      'Peoria',
      234
);

INSERT INTO city
VALUES(
      10869,
      'Sycamore',
      234
);

INSERT INTO city
VALUES(
      10870,
      'Crystal Lake',
      234
);

INSERT INTO city
VALUES(
      10871,
      'Maryville',
      234
);

INSERT INTO city
VALUES(
      10872,
      'Pontoon Beach',
      234
);

INSERT INTO city
VALUES(
      10873,
      'Belleville',
      234
);

INSERT INTO city
VALUES(
      10874,
      'Du Quoin',
      234
);

INSERT INTO city
VALUES(
      10875,
      'Pinckneyville',
      234
);

INSERT INTO city
VALUES(
      10876,
      'Volo',
      234
);

INSERT INTO city
VALUES(
      10877,
      'Hillsboro',
      234
);

INSERT INTO city
VALUES(
      10878,
      'Bensenville',
      234
);

INSERT INTO city
VALUES(
      10879,
      'Mount Vernon',
      234
);

INSERT INTO city
VALUES(
      10880,
      'River Grove',
      234
);

INSERT INTO city
VALUES(
      10881,
      'Park Ridge',
      234
);

INSERT INTO city
VALUES(
      10882,
      'Metropolis',
      234
);

INSERT INTO city
VALUES(
      10883,
      'Columbia',
      234
);

INSERT INTO city
VALUES(
      10884,
      'Willowbrook',
      234
);

INSERT INTO city
VALUES(
      10885,
      'Calumet Park',
      234
);

INSERT INTO city
VALUES(
      10886,
      'Centralia',
      234
);

INSERT INTO city
VALUES(
      10887,
      'Galesburg',
      234
);

INSERT INTO city
VALUES(
      10888,
      'Sauk Village',
      234
);

INSERT INTO city
VALUES(
      10889,
      'Mundelein',
      234
);

INSERT INTO city
VALUES(
      10890,
      'Silvis',
      234
);

INSERT INTO city
VALUES(
      10891,
      'Midlothian',
      234
);

INSERT INTO city
VALUES(
      10892,
      'Coal City',
      234
);

INSERT INTO city
VALUES(
      10893,
      'Harwood Heights',
      234
);

INSERT INTO city
VALUES(
      10894,
      'Morton Grove',
      234
);

INSERT INTO city
VALUES(
      10895,
      'Breese',
      234
);

INSERT INTO city
VALUES(
      10896,
      'Justice',
      234
);

INSERT INTO city
VALUES(
      10897,
      'Lansing',
      234
);

INSERT INTO city
VALUES(
      10898,
      'Lisle',
      234
);

INSERT INTO city
VALUES(
      10899,
      'Centreville',
      234
);

INSERT INTO city
VALUES(
      10900,
      'Westmont',
      234
);

INSERT INTO city
VALUES(
      10901,
      'Melrose Park',
      234
);

INSERT INTO city
VALUES(
      10902,
      'Plainfield',
      234
);

INSERT INTO city
VALUES(
      10903,
      'Broadview',
      234
);

INSERT INTO city
VALUES(
      10904,
      'Joliet',
      234
);

INSERT INTO city
VALUES(
      10905,
      'Carterville',
      234
);

INSERT INTO city
VALUES(
      10906,
      'Prospect Heights',
      234
);

INSERT INTO city
VALUES(
      10907,
      'Morton',
      234
);

INSERT INTO city
VALUES(
      10908,
      'Brookfield',
      234
);

INSERT INTO city
VALUES(
      10909,
      'Lakemoor',
      234
);

INSERT INTO city
VALUES(
      10910,
      'Minooka',
      234
);

INSERT INTO city
VALUES(
      10911,
      'Lindenhurst',
      234
);

INSERT INTO city
VALUES(
      10912,
      'Edwardsville',
      234
);

INSERT INTO city
VALUES(
      10913,
      'Glenview',
      234
);

INSERT INTO city
VALUES(
      10914,
      'Clarendon Hills',
      234
);

INSERT INTO city
VALUES(
      10915,
      'Peru',
      234
);

INSERT INTO city
VALUES(
      10916,
      'Vernon Hills',
      234
);

INSERT INTO city
VALUES(
      10917,
      'Streator',
      234
);

INSERT INTO city
VALUES(
      10918,
      'Bloomingdale',
      234
);

INSERT INTO city
VALUES(
      10919,
      'Normal',
      234
);

INSERT INTO city
VALUES(
      10920,
      'Collinsville',
      234
);

INSERT INTO city
VALUES(
      10921,
      'Monee',
      234
);

INSERT INTO city
VALUES(
      10922,
      'Rolling Meadows',
      234
);

INSERT INTO city
VALUES(
      10923,
      'Litchfield',
      234
);

INSERT INTO city
VALUES(
      10924,
      'Stickney',
      234
);

INSERT INTO city
VALUES(
      10925,
      'Dolton',
      234
);

INSERT INTO city
VALUES(
      10926,
      'Wood Dale',
      234
);

INSERT INTO city
VALUES(
      10927,
      'Danville',
      234
);

INSERT INTO city
VALUES(
      10928,
      'Gurnee',
      234
);

INSERT INTO city
VALUES(
      10929,
      'Rockton',
      234
);

INSERT INTO city
VALUES(
      10930,
      'Antioch',
      234
);

INSERT INTO city
VALUES(
      10931,
      'Summit',
      234
);

INSERT INTO city
VALUES(
      10932,
      'Lake Zurich',
      234
);

INSERT INTO city
VALUES(
      10933,
      'Glenwood',
      234
);

INSERT INTO city
VALUES(
      10934,
      'La Salle',
      234
);

INSERT INTO city
VALUES(
      10935,
      'Mount Zion',
      234
);

INSERT INTO city
VALUES(
      10936,
      'Northfield',
      234
);

INSERT INTO city
VALUES(
      10937,
      'Orland Park',
      234
);

INSERT INTO city
VALUES(
      10938,
      'Lawrenceville',
      234
);

INSERT INTO city
VALUES(
      10939,
      'Bellwood',
      234
);

INSERT INTO city
VALUES(
      10940,
      'Elmhurst',
      234
);

INSERT INTO city
VALUES(
      10941,
      'Forest Park',
      234
);

INSERT INTO city
VALUES(
      10942,
      'Island Lake',
      234
);

INSERT INTO city
VALUES(
      10943,
      'Riverside',
      234
);

INSERT INTO city
VALUES(
      10944,
      'Bourbonnais',
      234
);

INSERT INTO city
VALUES(
      10945,
      'Saint Joseph',
      234
);

INSERT INTO city
VALUES(
      10946,
      'Round Lake',
      234
);

INSERT INTO city
VALUES(
      10947,
      'Flossmoor',
      234
);

INSERT INTO city
VALUES(
      10948,
      'Alsip',
      234
);

INSERT INTO city
VALUES(
      10949,
      'Streamwood',
      234
);

INSERT INTO city
VALUES(
      10950,
      'Warrenville',
      234
);

INSERT INTO city
VALUES(
      10951,
      'Plano',
      234
);

INSERT INTO city
VALUES(
      10952,
      'Yorkville',
      234
);

INSERT INTO city
VALUES(
      10953,
      'Sterling',
      234
);

INSERT INTO city
VALUES(
      10954,
      'Lombard',
      234
);

INSERT INTO city
VALUES(
      10955,
      'Sandwich',
      234
);

INSERT INTO city
VALUES(
      10956,
      'Troy',
      234
);

INSERT INTO city
VALUES(
      10957,
      'Savoy',
      234
);

INSERT INTO city
VALUES(
      10958,
      'Orland Hills',
      234
);

INSERT INTO city
VALUES(
      10959,
      'East Saint Louis',
      234
);

INSERT INTO city
VALUES(
      10960,
      'Swansea',
      234
);

INSERT INTO city
VALUES(
      10961,
      'Chillicothe',
      234
);

INSERT INTO city
VALUES(
      10962,
      'Bridgeview',
      234
);

INSERT INTO city
VALUES(
      10963,
      'Wilmington',
      234
);

INSERT INTO city
VALUES(
      10964,
      'Palos Hills',
      234
);

INSERT INTO city
VALUES(
      10965,
      'Geneseo',
      234
);

INSERT INTO city
VALUES(
      10966,
      'Moline',
      234
);

INSERT INTO city
VALUES(
      10967,
      'West Dundee',
      234
);

INSERT INTO city
VALUES(
      10968,
      'Carbondale',
      234
);

INSERT INTO city
VALUES(
      10969,
      'Bartlett',
      234
);

INSERT INTO city
VALUES(
      10970,
      'West Chicago',
      234
);

INSERT INTO city
VALUES(
      10971,
      'Rantoul',
      234
);

INSERT INTO city
VALUES(
      10972,
      'Springfield',
      234
);

INSERT INTO city
VALUES(
      10973,
      'Saint Charles',
      234
);

INSERT INTO city
VALUES(
      10974,
      'Roscoe',
      234
);

INSERT INTO city
VALUES(
      10975,
      'Pekin',
      234
);

INSERT INTO city
VALUES(
      10976,
      'Carol Stream',
      234
);

INSERT INTO city
VALUES(
      10977,
      'Westchester',
      234
);

INSERT INTO city
VALUES(
      10978,
      'Hawthorn Woods',
      234
);

INSERT INTO city
VALUES(
      10979,
      'Park City',
      234
);

INSERT INTO city
VALUES(
      10980,
      'Huntley',
      234
);

INSERT INTO city
VALUES(
      10981,
      'Hinsdale',
      234
);

INSERT INTO city
VALUES(
      10982,
      'Lyons',
      234
);

INSERT INTO city
VALUES(
      10983,
      'Skokie',
      234
);

INSERT INTO city
VALUES(
      10984,
      'Spring Grove',
      234
);

INSERT INTO city
VALUES(
      10985,
      'Northlake',
      234
);

INSERT INTO city
VALUES(
      10986,
      'Canton',
      234
);

INSERT INTO city
VALUES(
      10987,
      'Johnsburg',
      234
);

INSERT INTO city
VALUES(
      10988,
      'Niles',
      234
);

INSERT INTO city
VALUES(
      10989,
      'Braidwood',
      234
);

INSERT INTO city
VALUES(
      10990,
      'Byron',
      234
);

INSERT INTO city
VALUES(
      10991,
      'Cahokia',
      234
);

INSERT INTO city
VALUES(
      10992,
      'Oak Park',
      234
);

INSERT INTO city
VALUES(
      10993,
      'Dixon',
      234
);

INSERT INTO city
VALUES(
      10994,
      'East Moline',
      234
);

INSERT INTO city
VALUES(
      10995,
      'South Beloit',
      234
);

INSERT INTO city
VALUES(
      10996,
      'Monticello',
      234
);

INSERT INTO city
VALUES(
      10997,
      'Herrin',
      234
);

INSERT INTO city
VALUES(
      10998,
      'Carmi',
      234
);

INSERT INTO city
VALUES(
      10999,
      'Effingham',
      234
);

INSERT INTO city
VALUES(
      11000,
      'Richton Park',
      234
);

INSERT INTO city
VALUES(
      11001,
      'Machesney Park',
      234
);

INSERT INTO city
VALUES(
      11002,
      'Bolingbrook',
      234
);

INSERT INTO city
VALUES(
      11003,
      'Highland Park',
      234
);

INSERT INTO city
VALUES(
      11004,
      'Palos Heights',
      234
);

INSERT INTO city
VALUES(
      11005,
      'Batavia',
      234
);

INSERT INTO city
VALUES(
      11006,
      'Homewood',
      234
);

INSERT INTO city
VALUES(
      11007,
      'Ottawa',
      234
);

INSERT INTO city
VALUES(
      11008,
      'Tinley Park',
      234
);

INSERT INTO city
VALUES(
      11009,
      'Shiloh',
      234
);

INSERT INTO city
VALUES(
      11010,
      'Loves Park',
      234
);

INSERT INTO city
VALUES(
      11011,
      'Lake Bluff',
      234
);

INSERT INTO city
VALUES(
      11012,
      'Waukegan',
      234
);

INSERT INTO city
VALUES(
      11013,
      'Chicago Heights',
      234
);

INSERT INTO city
VALUES(
      11014,
      'South Elgin',
      234
);

INSERT INTO city
VALUES(
      11015,
      'Pana',
      234
);

INSERT INTO city
VALUES(
      11016,
      'Marion',
      234
);

INSERT INTO city
VALUES(
      11017,
      'Itasca',
      234
);

INSERT INTO city
VALUES(
      11018,
      'Rock Falls',
      234
);

INSERT INTO city
VALUES(
      11019,
      'Downers Grove',
      234
);

INSERT INTO city
VALUES(
      11020,
      'Pontiac',
      234
);

INSERT INTO city
VALUES(
      11021,
      'Rock Island',
      234
);

INSERT INTO city
VALUES(
      11022,
      'Park Forest',
      234
);

INSERT INTO city
VALUES(
      11023,
      'Mascoutah',
      234
);

INSERT INTO city
VALUES(
      11024,
      'Schiller Park',
      234
);

INSERT INTO city
VALUES(
      11025,
      'La Grange',
      234
);

INSERT INTO city
VALUES(
      11026,
      'Schaumburg',
      234
);

INSERT INTO city
VALUES(
      11027,
      'McHenry',
      234
);

INSERT INTO city
VALUES(
      11028,
      'Robbins',
      234
);

INSERT INTO city
VALUES(
      11029,
      'Princeton',
      234
);

INSERT INTO city
VALUES(
      11030,
      'Northbrook',
      234
);

INSERT INTO city
VALUES(
      11031,
      'Salem',
      234
);

INSERT INTO city
VALUES(
      11032,
      'Rochelle',
      234
);

INSERT INTO city
VALUES(
      11033,
      'Woodridge',
      234
);

INSERT INTO city
VALUES(
      11034,
      'Oak Lawn',
      234
);

INSERT INTO city
VALUES(
      11035,
      'Steger',
      234
);

INSERT INTO city
VALUES(
      11036,
      'Oswego',
      234
);

INSERT INTO city
VALUES(
      11037,
      'Wilmette',
      234
);

INSERT INTO city
VALUES(
      11038,
      'Champaign',
      234
);

INSERT INTO city
VALUES(
      11039,
      'Berkeley',
      234
);

INSERT INTO city
VALUES(
      11040,
      'University Park',
      234
);

INSERT INTO city
VALUES(
      11041,
      'Campton Hills',
      234
);

INSERT INTO city
VALUES(
      11042,
      'Bradley',
      234
);

INSERT INTO city
VALUES(
      11043,
      'Colona',
      234
);

INSERT INTO city
VALUES(
      11044,
      'Glen Ellyn',
      234
);

INSERT INTO city
VALUES(
      11045,
      'Winnetka',
      234
);

INSERT INTO city
VALUES(
      11046,
      'Gillespie',
      234
);

INSERT INTO city
VALUES(
      11047,
      'Murphysboro',
      234
);

INSERT INTO city
VALUES(
      11048,
      'Urbana',
      234
);

INSERT INTO city
VALUES(
      11049,
      'Elmwood Park',
      234
);

INSERT INTO city
VALUES(
      11050,
      'Lake Villa',
      234
);

INSERT INTO city
VALUES(
      11051,
      'Kankakee',
      234
);

INSERT INTO city
VALUES(
      11052,
      'Hampshire',
      234
);

INSERT INTO city
VALUES(
      11053,
      'Manhattan',
      234
);

INSERT INTO city
VALUES(
      11054,
      'Burr Ridge',
      234
);

INSERT INTO city
VALUES(
      11055,
      'Lincolnwood',
      234
);

INSERT INTO city
VALUES(
      11056,
      'Wauconda',
      234
);

INSERT INTO city
VALUES(
      11057,
      'Riverdale',
      234
);

INSERT INTO city
VALUES(
      11058,
      'Robinson',
      234
);

INSERT INTO city
VALUES(
      11059,
      'Crete',
      234
);

INSERT INTO city
VALUES(
      11060,
      'Crestwood',
      234
);

INSERT INTO city
VALUES(
      11061,
      'Genoa',
      234
);

INSERT INTO city
VALUES(
      11062,
      'Bartonville',
      234
);

INSERT INTO city
VALUES(
      11063,
      'Fairview Heights',
      234
);

INSERT INTO city
VALUES(
      11064,
      'Zion',
      234
);

INSERT INTO city
VALUES(
      11065,
      'Shorewood',
      234
);

INSERT INTO city
VALUES(
      11066,
      'Calumet City',
      234
);

INSERT INTO city
VALUES(
      11067,
      'Glencoe',
      234
);

INSERT INTO city
VALUES(
      11068,
      'Wheaton',
      234
);

INSERT INTO city
VALUES(
      11069,
      'Poplar Grove',
      234
);

INSERT INTO city
VALUES(
      11070,
      'Villa Park',
      234
);

INSERT INTO city
VALUES(
      11071,
      'Wheeling',
      234
);

INSERT INTO city
VALUES(
      11072,
      'Bethalto',
      234
);

INSERT INTO city
VALUES(
      11073,
      'North Riverside',
      234
);

INSERT INTO city
VALUES(
      11074,
      'Kewanee',
      234
);

INSERT INTO city
VALUES(
      11075,
      'Franklin Park',
      234
);

INSERT INTO city
VALUES(
      11076,
      'Highwood',
      234
);

INSERT INTO city
VALUES(
      11077,
      'East Peoria',
      234
);

INSERT INTO city
VALUES(
      11078,
      'Gilberts',
      234
);

INSERT INTO city
VALUES(
      11079,
      'Crest Hill',
      234
);

INSERT INTO city
VALUES(
      11080,
      'Winfield',
      234
);

INSERT INTO city
VALUES(
      11081,
      'Lincoln',
      234
);

INSERT INTO city
VALUES(
      11082,
      'Blue Island',
      234
);

INSERT INTO city
VALUES(
      11083,
      'Glendale Heights',
      234
);

INSERT INTO city
VALUES(
      11084,
      'Alton',
      234
);

INSERT INTO city
VALUES(
      11085,
      'La Grange Park',
      234
);

INSERT INTO city
VALUES(
      11086,
      'Decatur',
      234
);

INSERT INTO city
VALUES(
      11087,
      'Romeoville',
      234
);

INSERT INTO city
VALUES(
      11088,
      'Matteson',
      234
);

INSERT INTO city
VALUES(
      11089,
      'Paris',
      234
);

INSERT INTO city
VALUES(
      11090,
      'Evergreen Park',
      234
);

INSERT INTO city
VALUES(
      11091,
      'Worth',
      234
);

INSERT INTO city
VALUES(
      11092,
      'Norridge',
      234
);

INSERT INTO city
VALUES(
      11093,
      'Buffalo Grove',
      234
);

INSERT INTO city
VALUES(
      11094,
      'Creve Coeur',
      234
);

INSERT INTO city
VALUES(
      11095,
      'Manteno',
      234
);

INSERT INTO city
VALUES(
      11096,
      'North Aurora',
      234
);

INSERT INTO city
VALUES(
      11097,
      'Aurora',
      234
);

INSERT INTO city
VALUES(
      11098,
      'Macomb',
      234
);

INSERT INTO city
VALUES(
      11099,
      'Harvard',
      234
);

INSERT INTO city
VALUES(
      11100,
      'Hoffman Estates',
      234
);

INSERT INTO city
VALUES(
      11101,
      'Rockford',
      234
);

INSERT INTO city
VALUES(
      11102,
      'Carlinville',
      234
);

INSERT INTO city
VALUES(
      11103,
      'Sugar Grove',
      234
);

INSERT INTO city
VALUES(
      11104,
      'Round Lake Park',
      234
);

INSERT INTO city
VALUES(
      11105,
      'Mount Carmel',
      234
);

INSERT INTO city
VALUES(
      11106,
      'Glen Carbon',
      234
);

INSERT INTO city
VALUES(
      11107,
      'Monmouth',
      234
);

INSERT INTO city
VALUES(
      11108,
      'Inverness',
      234
);

INSERT INTO city
VALUES(
      11109,
      'Mount Prospect',
      234
);

INSERT INTO city
VALUES(
      11110,
      'Round Lake Beach',
      234
);

INSERT INTO city
VALUES(
      11111,
      'Staunton',
      234
);

INSERT INTO city
VALUES(
      11112,
      'Eureka',
      234
);

INSERT INTO city
VALUES(
      11113,
      'Bloomington',
      234
);

INSERT INTO city
VALUES(
      11114,
      'Lake in the Hills',
      234
);

INSERT INTO city
VALUES(
      11115,
      'Beardstown',
      234
);

INSERT INTO city
VALUES(
      11116,
      'Country Club Hills',
      234
);

INSERT INTO city
VALUES(
      11117,
      'Western Springs',
      234
);

INSERT INTO city
VALUES(
      11118,
      'Olney',
      234
);

INSERT INTO city
VALUES(
      11119,
      'Des Plaines',
      234
);

INSERT INTO city
VALUES(
      11120,
      'Palatine',
      234
);

INSERT INTO city
VALUES(
      11121,
      'Belvidere',
      234
);

INSERT INTO city
VALUES(
      11122,
      'Cary',
      234
);

INSERT INTO city
VALUES(
      11123,
      'Chester',
      234
);

INSERT INTO city
VALUES(
      11124,
      'Darien',
      234
);

INSERT INTO city
VALUES(
      11125,
      'Roselle',
      234
);

INSERT INTO city
VALUES(
      11126,
      'Greenville',
      234
);

INSERT INTO city
VALUES(
      11127,
      'Woodstock',
      234
);

INSERT INTO city
VALUES(
      11128,
      'Mahomet',
      234
);

INSERT INTO city
VALUES(
      11129,
      'Lake Forest',
      234
);

INSERT INTO city
VALUES(
      11130,
      'North Chicago',
      234
);

INSERT INTO city
VALUES(
      11131,
      'Highland',
      234
);

INSERT INTO city
VALUES(
      11132,
      'Pingree Grove',
      234
);

INSERT INTO city
VALUES(
      11133,
      'Grayslake',
      234
);

INSERT INTO city
VALUES(
      11134,
      'Geneva',
      234
);

INSERT INTO city
VALUES(
      11135,
      'Jacksonville',
      234
);

INSERT INTO city
VALUES(
      11136,
      'Barrington',
      234
);

INSERT INTO city
VALUES(
      11137,
      'Fox Lake',
      234
);

INSERT INTO city
VALUES(
      11138,
      'Winthrop Harbor',
      234
);

INSERT INTO city
VALUES(
      11139,
      'OaFallon',
      234
);

INSERT INTO city
VALUES(
      11140,
      'Fort Valley',
      234
);

INSERT INTO city
VALUES(
      11141,
      'Buford',
      234
);

INSERT INTO city
VALUES(
      11142,
      'Richmond Hill',
      234
);

INSERT INTO city
VALUES(
      11143,
      'Atlanta',
      234
);

INSERT INTO city
VALUES(
      11144,
      'Sugar Hill',
      234
);

INSERT INTO city
VALUES(
      11145,
      'Swainsboro',
      234
);

INSERT INTO city
VALUES(
      11146,
      'Toccoa',
      234
);

INSERT INTO city
VALUES(
      11147,
      'Sylvester',
      234
);

INSERT INTO city
VALUES(
      11148,
      'Cedartown',
      234
);

INSERT INTO city
VALUES(
      11149,
      'Wrightsville',
      234
);

INSERT INTO city
VALUES(
      11150,
      'Cochran',
      234
);

INSERT INTO city
VALUES(
      11151,
      'Moultrie',
      234
);

INSERT INTO city
VALUES(
      11152,
      'Milledgeville',
      234
);

INSERT INTO city
VALUES(
      11153,
      'Pooler',
      234
);

INSERT INTO city
VALUES(
      11154,
      'Canton',
      234
);

INSERT INTO city
VALUES(
      11155,
      'Vidalia',
      234
);

INSERT INTO city
VALUES(
      11156,
      'Acworth',
      234
);

INSERT INTO city
VALUES(
      11157,
      'Johns Creek',
      234
);

INSERT INTO city
VALUES(
      11158,
      'Valdosta',
      234
);

INSERT INTO city
VALUES(
      11159,
      'Norcross',
      234
);

INSERT INTO city
VALUES(
      11160,
      'Morrow',
      234
);

INSERT INTO city
VALUES(
      11161,
      'Byron',
      234
);

INSERT INTO city
VALUES(
      11162,
      'Statesboro',
      234
);

INSERT INTO city
VALUES(
      11163,
      'Tyrone',
      234
);

INSERT INTO city
VALUES(
      11164,
      'Dunwoody',
      234
);

INSERT INTO city
VALUES(
      11165,
      'Hartwell',
      234
);

INSERT INTO city
VALUES(
      11166,
      'Centerville',
      234
);

INSERT INTO city
VALUES(
      11167,
      'Peachtree City',
      234
);

INSERT INTO city
VALUES(
      11168,
      'Calhoun',
      234
);

INSERT INTO city
VALUES(
      11169,
      'Cornelia',
      234
);

INSERT INTO city
VALUES(
      11170,
      'Locust Grove',
      234
);

INSERT INTO city
VALUES(
      11171,
      'Carrollton',
      234
);

INSERT INTO city
VALUES(
      11172,
      'Summerville',
      234
);

INSERT INTO city
VALUES(
      11173,
      'Alpharetta',
      234
);

INSERT INTO city
VALUES(
      11174,
      'Snellville',
      234
);

INSERT INTO city
VALUES(
      11175,
      'Barnesville',
      234
);

INSERT INTO city
VALUES(
      11176,
      'Duluth',
      234
);

INSERT INTO city
VALUES(
      11177,
      'Braselton',
      234
);

INSERT INTO city
VALUES(
      11178,
      'Loganville',
      234
);

INSERT INTO city
VALUES(
      11179,
      'Covington',
      234
);

INSERT INTO city
VALUES(
      11180,
      'Marietta',
      234
);

INSERT INTO city
VALUES(
      11181,
      'Augusta',
      234
);

INSERT INTO city
VALUES(
      11182,
      'Rome',
      234
);

INSERT INTO city
VALUES(
      11183,
      'Woodstock',
      234
);

INSERT INTO city
VALUES(
      11184,
      'Brookhaven',
      234
);

INSERT INTO city
VALUES(
      11185,
      'Savannah',
      234
);

INSERT INTO city
VALUES(
      11186,
      'Rockmart',
      234
);

INSERT INTO city
VALUES(
      11187,
      'Jefferson',
      234
);

INSERT INTO city
VALUES(
      11188,
      'Stonecrest',
      234
);

INSERT INTO city
VALUES(
      11189,
      'Kennesaw',
      234
);

INSERT INTO city
VALUES(
      11190,
      'Commerce',
      234
);

INSERT INTO city
VALUES(
      11191,
      'Hinesville',
      234
);

INSERT INTO city
VALUES(
      11192,
      'Port Wentworth',
      234
);

INSERT INTO city
VALUES(
      11193,
      'Jesup',
      234
);

INSERT INTO city
VALUES(
      11194,
      'Fairburn',
      234
);

INSERT INTO city
VALUES(
      11195,
      'Folkston',
      234
);

INSERT INTO city
VALUES(
      11196,
      'Winder',
      234
);

INSERT INTO city
VALUES(
      11197,
      'Dacula',
      234
);

INSERT INTO city
VALUES(
      11198,
      'Stockbridge',
      234
);

INSERT INTO city
VALUES(
      11199,
      'Fort Oglethorpe',
      234
);

INSERT INTO city
VALUES(
      11200,
      'Waycross',
      234
);

INSERT INTO city
VALUES(
      11201,
      'Flowery Branch',
      234
);

INSERT INTO city
VALUES(
      11202,
      'Auburn',
      234
);

INSERT INTO city
VALUES(
      11203,
      'Douglasville',
      234
);

INSERT INTO city
VALUES(
      11204,
      'Americus',
      234
);

INSERT INTO city
VALUES(
      11205,
      'Chamblee',
      234
);

INSERT INTO city
VALUES(
      11206,
      'Decatur',
      234
);

INSERT INTO city
VALUES(
      11207,
      'Elberton',
      234
);

INSERT INTO city
VALUES(
      11208,
      'Union City',
      234
);

INSERT INTO city
VALUES(
      11209,
      'Grovetown',
      234
);

INSERT INTO city
VALUES(
      11210,
      'Monroe',
      234
);

INSERT INTO city
VALUES(
      11211,
      'Cordele',
      234
);

INSERT INTO city
VALUES(
      11212,
      'McDonough',
      234
);

INSERT INTO city
VALUES(
      11213,
      'Newnan',
      234
);

INSERT INTO city
VALUES(
      11214,
      'Tucker',
      234
);

INSERT INTO city
VALUES(
      11215,
      'Powder Springs',
      234
);

INSERT INTO city
VALUES(
      11216,
      'Fitzgerald',
      234
);

INSERT INTO city
VALUES(
      11217,
      'Dublin',
      234
);

INSERT INTO city
VALUES(
      11218,
      'Bremen',
      234
);

INSERT INTO city
VALUES(
      11219,
      'Warner Robins',
      234
);

INSERT INTO city
VALUES(
      11220,
      'Dalton',
      234
);

INSERT INTO city
VALUES(
      11221,
      'Sandy Springs',
      234
);

INSERT INTO city
VALUES(
      11222,
      'Jackson',
      234
);

INSERT INTO city
VALUES(
      11223,
      'Holly Springs',
      234
);

INSERT INTO city
VALUES(
      11224,
      'Villa Rica',
      234
);

INSERT INTO city
VALUES(
      11225,
      'Rincon',
      234
);

INSERT INTO city
VALUES(
      11226,
      'Suwanee',
      234
);

INSERT INTO city
VALUES(
      11227,
      'Thomson',
      234
);

INSERT INTO city
VALUES(
      11228,
      'La Grange',
      234
);

INSERT INTO city
VALUES(
      11229,
      'Forest Park',
      234
);

INSERT INTO city
VALUES(
      11230,
      'Austell',
      234
);

INSERT INTO city
VALUES(
      11231,
      'Dallas',
      234
);

INSERT INTO city
VALUES(
      11232,
      'Peachtree Corners',
      234
);

INSERT INTO city
VALUES(
      11233,
      'Baxley',
      234
);

INSERT INTO city
VALUES(
      11234,
      'Waynesboro',
      234
);

INSERT INTO city
VALUES(
      11235,
      'Montezuma',
      234
);

INSERT INTO city
VALUES(
      11236,
      'Kingsland',
      234
);

INSERT INTO city
VALUES(
      11237,
      'Douglas',
      234
);

INSERT INTO city
VALUES(
      11238,
      'Fayetteville',
      234
);

INSERT INTO city
VALUES(
      11239,
      'Cleveland',
      234
);

INSERT INTO city
VALUES(
      11240,
      'Doraville',
      234
);

INSERT INTO city
VALUES(
      11241,
      'Athens',
      234
);

INSERT INTO city
VALUES(
      11242,
      'Cumming',
      234
);

INSERT INTO city
VALUES(
      11243,
      'Lovejoy',
      234
);

INSERT INTO city
VALUES(
      11244,
      'LaFayette',
      234
);

INSERT INTO city
VALUES(
      11245,
      'Garden City',
      234
);

INSERT INTO city
VALUES(
      11246,
      'Hampton',
      234
);

INSERT INTO city
VALUES(
      11247,
      'Clarkston',
      234
);

INSERT INTO city
VALUES(
      11248,
      'Smyrna',
      234
);

INSERT INTO city
VALUES(
      11249,
      'Albany',
      234
);

INSERT INTO city
VALUES(
      11250,
      'Griffin',
      234
);

INSERT INTO city
VALUES(
      11251,
      'Conyers',
      234
);

INSERT INTO city
VALUES(
      11252,
      'Saint Marys',
      234
);

INSERT INTO city
VALUES(
      11253,
      'Stone Mountain',
      234
);

INSERT INTO city
VALUES(
      11254,
      'Lilburn',
      234
);

INSERT INTO city
VALUES(
      11255,
      'Cartersville',
      234
);

INSERT INTO city
VALUES(
      11256,
      'Dahlonega',
      234
);

INSERT INTO city
VALUES(
      11257,
      'Jasper',
      234
);

INSERT INTO city
VALUES(
      11258,
      'Cairo',
      234
);

INSERT INTO city
VALUES(
      11259,
      'Perry',
      234
);

INSERT INTO city
VALUES(
      11260,
      'Gainesville',
      234
);

INSERT INTO city
VALUES(
      11261,
      'East Point',
      234
);

INSERT INTO city
VALUES(
      11262,
      'College Park',
      234
);

INSERT INTO city
VALUES(
      11263,
      'Brunswick',
      234
);

INSERT INTO city
VALUES(
      11264,
      'Sandersville',
      234
);

INSERT INTO city
VALUES(
      11265,
      'Columbus',
      234
);

INSERT INTO city
VALUES(
      11266,
      'Forsyth',
      234
);

INSERT INTO city
VALUES(
      11267,
      'Cusseta',
      234
);

INSERT INTO city
VALUES(
      11268,
      'Thomasville',
      234
);

INSERT INTO city
VALUES(
      11269,
      'Tifton',
      234
);

INSERT INTO city
VALUES(
      11270,
      'Eastman',
      234
);

INSERT INTO city
VALUES(
      11271,
      'Lawrenceville',
      234
);

INSERT INTO city
VALUES(
      11272,
      'Bainbridge',
      234
);

INSERT INTO city
VALUES(
      11273,
      'Thomaston',
      234
);

INSERT INTO city
VALUES(
      11274,
      'Camilla',
      234
);

INSERT INTO city
VALUES(
      11275,
      'Springfield',
      234
);

INSERT INTO city
VALUES(
      11276,
      'Milton',
      234
);

INSERT INTO city
VALUES(
      11277,
      'Riverdale',
      234
);

INSERT INTO city
VALUES(
      11278,
      'Adel',
      234
);

INSERT INTO city
VALUES(
      11279,
      'Roswell',
      234
);

INSERT INTO city
VALUES(
      11280,
      'Hapeville',
      234
);

INSERT INTO city
VALUES(
      11281,
      'Brownsburg',
      234
);

INSERT INTO city
VALUES(
      11282,
      'Wabash',
      234
);

INSERT INTO city
VALUES(
      11283,
      'Charlestown',
      234
);

INSERT INTO city
VALUES(
      11284,
      'Whitestown',
      234
);

INSERT INTO city
VALUES(
      11285,
      'Batesville',
      234
);

INSERT INTO city
VALUES(
      11286,
      'Huntertown',
      234
);

INSERT INTO city
VALUES(
      11287,
      'McCordsville',
      234
);

INSERT INTO city
VALUES(
      11288,
      'Goshen',
      234
);

INSERT INTO city
VALUES(
      11289,
      'Griffith',
      234
);

INSERT INTO city
VALUES(
      11290,
      'Jeffersonville',
      234
);

INSERT INTO city
VALUES(
      11291,
      'Lebanon',
      234
);

INSERT INTO city
VALUES(
      11292,
      'Hammond',
      234
);

INSERT INTO city
VALUES(
      11293,
      'Terre Haute',
      234
);

INSERT INTO city
VALUES(
      11294,
      'Corydon',
      234
);

INSERT INTO city
VALUES(
      11295,
      'LaPorte',
      234
);

INSERT INTO city
VALUES(
      11296,
      'Scottsburg',
      234
);

INSERT INTO city
VALUES(
      11297,
      'Munster',
      234
);

INSERT INTO city
VALUES(
      11298,
      'Richmond',
      234
);

INSERT INTO city
VALUES(
      11299,
      'Gas City',
      234
);

INSERT INTO city
VALUES(
      11300,
      'Columbus',
      234
);

INSERT INTO city
VALUES(
      11301,
      'Seymour',
      234
);

INSERT INTO city
VALUES(
      11302,
      'South Bend',
      234
);

INSERT INTO city
VALUES(
      11303,
      'Attica',
      234
);

INSERT INTO city
VALUES(
      11304,
      'West Lafayette',
      234
);

INSERT INTO city
VALUES(
      11305,
      'Dyer',
      234
);

INSERT INTO city
VALUES(
      11306,
      'Clinton',
      234
);

INSERT INTO city
VALUES(
      11307,
      'Greenfield',
      234
);

INSERT INTO city
VALUES(
      11308,
      'Plainfield',
      234
);

INSERT INTO city
VALUES(
      11309,
      'Syracuse',
      234
);

INSERT INTO city
VALUES(
      11310,
      'Columbia City',
      234
);

INSERT INTO city
VALUES(
      11311,
      'Lowell',
      234
);

INSERT INTO city
VALUES(
      11312,
      'North Manchester',
      234
);

INSERT INTO city
VALUES(
      11313,
      'Bluffton',
      234
);

INSERT INTO city
VALUES(
      11314,
      'Monticello',
      234
);

INSERT INTO city
VALUES(
      11315,
      'Fort Wayne',
      234
);

INSERT INTO city
VALUES(
      11316,
      'Avon',
      234
);

INSERT INTO city
VALUES(
      11317,
      'Martinsville',
      234
);

INSERT INTO city
VALUES(
      11318,
      'Bargersville',
      234
);

INSERT INTO city
VALUES(
      11319,
      'Gary',
      234
);

INSERT INTO city
VALUES(
      11320,
      'Frankfort',
      234
);

INSERT INTO city
VALUES(
      11321,
      'Peru',
      234
);

INSERT INTO city
VALUES(
      11322,
      'Ellettsville',
      234
);

INSERT INTO city
VALUES(
      11323,
      'Marion',
      234
);

INSERT INTO city
VALUES(
      11324,
      'Chesterton',
      234
);

INSERT INTO city
VALUES(
      11325,
      'Westfield',
      234
);

INSERT INTO city
VALUES(
      11326,
      'Angola',
      234
);

INSERT INTO city
VALUES(
      11327,
      'Valparaiso',
      234
);

INSERT INTO city
VALUES(
      11328,
      'Huntington',
      234
);

INSERT INTO city
VALUES(
      11329,
      'Brazil',
      234
);

INSERT INTO city
VALUES(
      11330,
      'Winfield',
      234
);

INSERT INTO city
VALUES(
      11331,
      'Elkhart',
      234
);

INSERT INTO city
VALUES(
      11332,
      'Carmel',
      234
);

INSERT INTO city
VALUES(
      11333,
      'Huntingburg',
      234
);

INSERT INTO city
VALUES(
      11334,
      'Kokomo',
      234
);

INSERT INTO city
VALUES(
      11335,
      'Auburn',
      234
);

INSERT INTO city
VALUES(
      11336,
      'Crown Point',
      234
);

INSERT INTO city
VALUES(
      11337,
      'New Whiteland',
      234
);

INSERT INTO city
VALUES(
      11338,
      'Danville',
      234
);

INSERT INTO city
VALUES(
      11339,
      'Connersville',
      234
);

INSERT INTO city
VALUES(
      11340,
      'Decatur',
      234
);

INSERT INTO city
VALUES(
      11341,
      'Lafayette',
      234
);

INSERT INTO city
VALUES(
      11342,
      'Boonville',
      234
);

INSERT INTO city
VALUES(
      11343,
      'East Chicago',
      234
);

INSERT INTO city
VALUES(
      11344,
      'Clarksville',
      234
);

INSERT INTO city
VALUES(
      11345,
      'Tell City',
      234
);

INSERT INTO city
VALUES(
      11346,
      'Fishers',
      234
);

INSERT INTO city
VALUES(
      11347,
      'Bedford',
      234
);

INSERT INTO city
VALUES(
      11348,
      'Zionsville',
      234
);

INSERT INTO city
VALUES(
      11349,
      'Noblesville',
      234
);

INSERT INTO city
VALUES(
      11350,
      'New Albany',
      234
);

INSERT INTO city
VALUES(
      11351,
      'Shelbyville',
      234
);

INSERT INTO city
VALUES(
      11352,
      'Rochester',
      234
);

INSERT INTO city
VALUES(
      11353,
      'Yorktown',
      234
);

INSERT INTO city
VALUES(
      11354,
      'Crawfordsville',
      234
);

INSERT INTO city
VALUES(
      11355,
      'Anderson',
      234
);

INSERT INTO city
VALUES(
      11356,
      'Evansville',
      234
);

INSERT INTO city
VALUES(
      11357,
      'Saint John',
      234
);

INSERT INTO city
VALUES(
      11358,
      'Nappanee',
      234
);

INSERT INTO city
VALUES(
      11359,
      'Sellersburg',
      234
);

INSERT INTO city
VALUES(
      11360,
      'Speedway',
      234
);

INSERT INTO city
VALUES(
      11361,
      'Logansport',
      234
);

INSERT INTO city
VALUES(
      11362,
      'Princeton',
      234
);

INSERT INTO city
VALUES(
      11363,
      'Winona Lake',
      234
);

INSERT INTO city
VALUES(
      11364,
      'Portage',
      234
);

INSERT INTO city
VALUES(
      11365,
      'Westville',
      234
);

INSERT INTO city
VALUES(
      11366,
      'Salem',
      234
);

INSERT INTO city
VALUES(
      11367,
      'Cumberland',
      234
);

INSERT INTO city
VALUES(
      11368,
      'Hartford City',
      234
);

INSERT INTO city
VALUES(
      11369,
      'Mishawaka',
      234
);

INSERT INTO city
VALUES(
      11370,
      'Berne',
      234
);

INSERT INTO city
VALUES(
      11371,
      'Tipton',
      234
);

INSERT INTO city
VALUES(
      11372,
      'Portland',
      234
);

INSERT INTO city
VALUES(
      11373,
      'Vincennes',
      234
);

INSERT INTO city
VALUES(
      11374,
      'North Vernon',
      234
);

INSERT INTO city
VALUES(
      11375,
      'Bloomington',
      234
);

INSERT INTO city
VALUES(
      11376,
      'Greenwood',
      234
);

INSERT INTO city
VALUES(
      11377,
      'Alexandria',
      234
);

INSERT INTO city
VALUES(
      11378,
      'Lawrenceburg',
      234
);

INSERT INTO city
VALUES(
      11379,
      'Washington',
      234
);

INSERT INTO city
VALUES(
      11380,
      'Jasper',
      234
);

INSERT INTO city
VALUES(
      11381,
      'Garrett',
      234
);

INSERT INTO city
VALUES(
      11382,
      'Greensburg',
      234
);

INSERT INTO city
VALUES(
      11383,
      'Muncie',
      234
);

INSERT INTO city
VALUES(
      11384,
      'Merrillville',
      234
);

INSERT INTO city
VALUES(
      11385,
      'Beech Grove',
      234
);

INSERT INTO city
VALUES(
      11386,
      'Mooresville',
      234
);

INSERT INTO city
VALUES(
      11387,
      'Indianapolis',
      234
);

INSERT INTO city
VALUES(
      11388,
      'Michigan City',
      234
);

INSERT INTO city
VALUES(
      11389,
      'Madison',
      234
);

INSERT INTO city
VALUES(
      11390,
      'Rushville',
      234
);

INSERT INTO city
VALUES(
      11391,
      'Plymouth',
      234
);

INSERT INTO city
VALUES(
      11392,
      'Cedar Lake',
      234
);

INSERT INTO city
VALUES(
      11393,
      'Greencastle',
      234
);

INSERT INTO city
VALUES(
      11394,
      'Linton',
      234
);

INSERT INTO city
VALUES(
      11395,
      'Lake Station',
      234
);

INSERT INTO city
VALUES(
      11396,
      'Lawrence',
      234
);

INSERT INTO city
VALUES(
      11397,
      'Schererville',
      234
);

INSERT INTO city
VALUES(
      11398,
      'Kendallville',
      234
);

INSERT INTO city
VALUES(
      11399,
      'Hobart',
      234
);

INSERT INTO city
VALUES(
      11400,
      'Franklin',
      234
);

INSERT INTO city
VALUES(
      11401,
      'Highland',
      234
);

INSERT INTO city
VALUES(
      11402,
      'Union City',
      234
);

INSERT INTO city
VALUES(
      11403,
      'Mount Vernon',
      234
);

INSERT INTO city
VALUES(
      11404,
      'Rensselaer',
      234
);

INSERT INTO city
VALUES(
      11405,
      'New Castle',
      234
);

INSERT INTO city
VALUES(
      11406,
      'New Haven',
      234
);

INSERT INTO city
VALUES(
      11407,
      'Elwood',
      234
);

INSERT INTO city
VALUES(
      11408,
      'Warsaw',
      234
);

INSERT INTO city
VALUES(
      11409,
      'Le Mars',
      234
);

INSERT INTO city
VALUES(
      11410,
      'Pleasant Hill',
      234
);

INSERT INTO city
VALUES(
      11411,
      'Davenport',
      234
);

INSERT INTO city
VALUES(
      11412,
      'Winterset',
      234
);

INSERT INTO city
VALUES(
      11413,
      'Burlington',
      234
);

INSERT INTO city
VALUES(
      11414,
      'Sioux Center',
      234
);

INSERT INTO city
VALUES(
      11415,
      'Ankeny',
      234
);

INSERT INTO city
VALUES(
      11416,
      'Charles City',
      234
);

INSERT INTO city
VALUES(
      11417,
      'Mount Pleasant',
      234
);

INSERT INTO city
VALUES(
      11418,
      'Spirit Lake',
      234
);

INSERT INTO city
VALUES(
      11419,
      'Centerville',
      234
);

INSERT INTO city
VALUES(
      11420,
      'Nevada',
      234
);

INSERT INTO city
VALUES(
      11421,
      'Orange City',
      234
);

INSERT INTO city
VALUES(
      11422,
      'Waverly',
      234
);

INSERT INTO city
VALUES(
      11423,
      'Newton',
      234
);

INSERT INTO city
VALUES(
      11424,
      'Marshalltown',
      234
);

INSERT INTO city
VALUES(
      11425,
      'Washington',
      234
);

INSERT INTO city
VALUES(
      11426,
      'Grinnell',
      234
);

INSERT INTO city
VALUES(
      11427,
      'Dubuque',
      234
);

INSERT INTO city
VALUES(
      11428,
      'Marion',
      234
);

INSERT INTO city
VALUES(
      11429,
      'Creston',
      234
);

INSERT INTO city
VALUES(
      11430,
      'Iowa City',
      234
);

INSERT INTO city
VALUES(
      11431,
      'Clinton',
      234
);

INSERT INTO city
VALUES(
      11432,
      'Knoxville',
      234
);

INSERT INTO city
VALUES(
      11433,
      'Norwalk',
      234
);

INSERT INTO city
VALUES(
      11434,
      'Algona',
      234
);

INSERT INTO city
VALUES(
      11435,
      'Asbury',
      234
);

INSERT INTO city
VALUES(
      11436,
      'Clear Lake',
      234
);

INSERT INTO city
VALUES(
      11437,
      'Webster City',
      234
);

INSERT INTO city
VALUES(
      11438,
      'Boone',
      234
);

INSERT INTO city
VALUES(
      11439,
      'Ottumwa',
      234
);

INSERT INTO city
VALUES(
      11440,
      'Glenwood',
      234
);

INSERT INTO city
VALUES(
      11441,
      'Johnston',
      234
);

INSERT INTO city
VALUES(
      11442,
      'Denison',
      234
);

INSERT INTO city
VALUES(
      11443,
      'Independence',
      234
);

INSERT INTO city
VALUES(
      11444,
      'Humboldt',
      234
);

INSERT INTO city
VALUES(
      11445,
      'Indianola',
      234
);

INSERT INTO city
VALUES(
      11446,
      'Carroll',
      234
);

INSERT INTO city
VALUES(
      11447,
      'Keokuk',
      234
);

INSERT INTO city
VALUES(
      11448,
      'Waterloo',
      234
);

INSERT INTO city
VALUES(
      11449,
      'Estherville',
      234
);

INSERT INTO city
VALUES(
      11450,
      'Decorah',
      234
);

INSERT INTO city
VALUES(
      11451,
      'North Liberty',
      234
);

INSERT INTO city
VALUES(
      11452,
      'Spencer',
      234
);

INSERT INTO city
VALUES(
      11453,
      'Oelwein',
      234
);

INSERT INTO city
VALUES(
      11454,
      'Altoona',
      234
);

INSERT INTO city
VALUES(
      11455,
      'Bettendorf',
      234
);

INSERT INTO city
VALUES(
      11456,
      'Maquoketa',
      234
);

INSERT INTO city
VALUES(
      11457,
      'Clive',
      234
);

INSERT INTO city
VALUES(
      11458,
      'Grimes',
      234
);

INSERT INTO city
VALUES(
      11459,
      'Council Bluffs',
      234
);

INSERT INTO city
VALUES(
      11460,
      'Des Moines',
      234
);

INSERT INTO city
VALUES(
      11461,
      'Anamosa',
      234
);

INSERT INTO city
VALUES(
      11462,
      'Clarinda',
      234
);

INSERT INTO city
VALUES(
      11463,
      'Fort Madison',
      234
);

INSERT INTO city
VALUES(
      11464,
      'Cedar Rapids',
      234
);

INSERT INTO city
VALUES(
      11465,
      'Mount Vernon',
      234
);

INSERT INTO city
VALUES(
      11466,
      'Perry',
      234
);

INSERT INTO city
VALUES(
      11467,
      'Oskaloosa',
      234
);

INSERT INTO city
VALUES(
      11468,
      'Sioux City',
      234
);

INSERT INTO city
VALUES(
      11469,
      'Storm Lake',
      234
);

INSERT INTO city
VALUES(
      11470,
      'Cedar Falls',
      234
);

INSERT INTO city
VALUES(
      11471,
      'Waukee',
      234
);

INSERT INTO city
VALUES(
      11472,
      'Red Oak',
      234
);

INSERT INTO city
VALUES(
      11473,
      'Fort Dodge',
      234
);

INSERT INTO city
VALUES(
      11474,
      'Muscatine',
      234
);

INSERT INTO city
VALUES(
      11475,
      'Fairfield',
      234
);

INSERT INTO city
VALUES(
      11476,
      'Pella',
      234
);

INSERT INTO city
VALUES(
      11477,
      'Ames',
      234
);

INSERT INTO city
VALUES(
      11478,
      'Eldridge',
      234
);

INSERT INTO city
VALUES(
      11479,
      'Urbandale',
      234
);

INSERT INTO city
VALUES(
      11480,
      'Coralville',
      234
);

INSERT INTO city
VALUES(
      11481,
      'Mason City',
      234
);

INSERT INTO city
VALUES(
      11482,
      'West Des Moines',
      234
);

INSERT INTO city
VALUES(
      11483,
      'Atlantic',
      234
);

INSERT INTO city
VALUES(
      11484,
      'Bondurant',
      234
);

INSERT INTO city
VALUES(
      11485,
      'Hiawatha',
      234
);

INSERT INTO city
VALUES(
      11486,
      'McAlester',
      234
);

INSERT INTO city
VALUES(
      11487,
      'Shawnee',
      234
);

INSERT INTO city
VALUES(
      11488,
      'Skiatook',
      234
);

INSERT INTO city
VALUES(
      11489,
      'Wagoner',
      234
);

INSERT INTO city
VALUES(
      11490,
      'Broken Arrow',
      234
);

INSERT INTO city
VALUES(
      11491,
      'Durant',
      234
);

INSERT INTO city
VALUES(
      11492,
      'Midwest City',
      234
);

INSERT INTO city
VALUES(
      11493,
      'Stillwater',
      234
);

INSERT INTO city
VALUES(
      11494,
      'Mustang',
      234
);

INSERT INTO city
VALUES(
      11495,
      'Blanchard',
      234
);

INSERT INTO city
VALUES(
      11496,
      'Sand Springs',
      234
);

INSERT INTO city
VALUES(
      11497,
      'Sallisaw',
      234
);

INSERT INTO city
VALUES(
      11498,
      'Guthrie',
      234
);

INSERT INTO city
VALUES(
      11499,
      'Owasso',
      234
);

INSERT INTO city
VALUES(
      11500,
      'Tahlequah',
      234
);

INSERT INTO city
VALUES(
      11501,
      'Purcell',
      234
);

INSERT INTO city
VALUES(
      11502,
      'Blackwell',
      234
);

INSERT INTO city
VALUES(
      11503,
      'Edmond',
      234
);

INSERT INTO city
VALUES(
      11504,
      'Sapulpa',
      234
);

INSERT INTO city
VALUES(
      11505,
      'Warr Acres',
      234
);

INSERT INTO city
VALUES(
      11506,
      'Duncan',
      234
);

INSERT INTO city
VALUES(
      11507,
      'Idabel',
      234
);

INSERT INTO city
VALUES(
      11508,
      'Grove',
      234
);

INSERT INTO city
VALUES(
      11509,
      'Alva',
      234
);

INSERT INTO city
VALUES(
      11510,
      'Clinton',
      234
);

INSERT INTO city
VALUES(
      11511,
      'Collinsville',
      234
);

INSERT INTO city
VALUES(
      11512,
      'Poteau',
      234
);

INSERT INTO city
VALUES(
      11513,
      'Henryetta',
      234
);

INSERT INTO city
VALUES(
      11514,
      'Glenpool',
      234
);

INSERT INTO city
VALUES(
      11515,
      'Pauls Valley',
      234
);

INSERT INTO city
VALUES(
      11516,
      'Lawton',
      234
);

INSERT INTO city
VALUES(
      11517,
      'Oklahoma City',
      234
);

INSERT INTO city
VALUES(
      11518,
      'Ardmore',
      234
);

INSERT INTO city
VALUES(
      11519,
      'Claremore',
      234
);

INSERT INTO city
VALUES(
      11520,
      'Yukon',
      234
);

INSERT INTO city
VALUES(
      11521,
      'Bixby',
      234
);

INSERT INTO city
VALUES(
      11522,
      'Tulsa',
      234
);

INSERT INTO city
VALUES(
      11523,
      'Noble',
      234
);

INSERT INTO city
VALUES(
      11524,
      'Muskogee',
      234
);

INSERT INTO city
VALUES(
      11525,
      'Moore',
      234
);

INSERT INTO city
VALUES(
      11526,
      'Chickasha',
      234
);

INSERT INTO city
VALUES(
      11527,
      'Lone Grove',
      234
);

INSERT INTO city
VALUES(
      11528,
      'Seminole',
      234
);

INSERT INTO city
VALUES(
      11529,
      'Catoosa',
      234
);

INSERT INTO city
VALUES(
      11530,
      'Ponca City',
      234
);

INSERT INTO city
VALUES(
      11531,
      'Del City',
      234
);

INSERT INTO city
VALUES(
      11532,
      'Bethany',
      234
);

INSERT INTO city
VALUES(
      11533,
      'Choctaw',
      234
);

INSERT INTO city
VALUES(
      11534,
      'Elk City',
      234
);

INSERT INTO city
VALUES(
      11535,
      'Jenks',
      234
);

INSERT INTO city
VALUES(
      11536,
      'Miami',
      234
);

INSERT INTO city
VALUES(
      11537,
      'The Village',
      234
);

INSERT INTO city
VALUES(
      11538,
      'El Reno',
      234
);

INSERT INTO city
VALUES(
      11539,
      'Tecumseh',
      234
);

INSERT INTO city
VALUES(
      11540,
      'Muldrow',
      234
);

INSERT INTO city
VALUES(
      11541,
      'Newcastle',
      234
);

INSERT INTO city
VALUES(
      11542,
      'Coweta',
      234
);

INSERT INTO city
VALUES(
      11543,
      'Okmulgee',
      234
);

INSERT INTO city
VALUES(
      11544,
      'Enid',
      234
);

INSERT INTO city
VALUES(
      11545,
      'Guymon',
      234
);

INSERT INTO city
VALUES(
      11546,
      'Piedmont',
      234
);

INSERT INTO city
VALUES(
      11547,
      'Tuttle',
      234
);

INSERT INTO city
VALUES(
      11548,
      'Altus',
      234
);

INSERT INTO city
VALUES(
      11549,
      'Anadarko',
      234
);

INSERT INTO city
VALUES(
      11550,
      'Ada',
      234
);

INSERT INTO city
VALUES(
      11551,
      'Norman',
      234
);

INSERT INTO city
VALUES(
      11552,
      'Weatherford',
      234
);

INSERT INTO city
VALUES(
      11553,
      'Holdenville',
      234
);

INSERT INTO city
VALUES(
      11554,
      'Woodward',
      234
);

INSERT INTO city
VALUES(
      11555,
      'Cushing',
      234
);

INSERT INTO city
VALUES(
      11556,
      'Vinita',
      234
);

INSERT INTO city
VALUES(
      11557,
      'Bartlesville',
      234
);

INSERT INTO city
VALUES(
      11558,
      'Scottsdale',
      234
);

INSERT INTO city
VALUES(
      11559,
      'Flagstaff',
      234
);

INSERT INTO city
VALUES(
      11560,
      'Nogales',
      234
);

INSERT INTO city
VALUES(
      11561,
      'Tolleson',
      234
);

INSERT INTO city
VALUES(
      11562,
      'Oro Valley',
      234
);

INSERT INTO city
VALUES(
      11563,
      'El Mirage',
      234
);

INSERT INTO city
VALUES(
      11564,
      'Guadalupe',
      234
);

INSERT INTO city
VALUES(
      11565,
      'Queen Creek',
      234
);

INSERT INTO city
VALUES(
      11566,
      'Buckeye',
      234
);

INSERT INTO city
VALUES(
      11567,
      'Safford',
      234
);

INSERT INTO city
VALUES(
      11568,
      'Show Low',
      234
);

INSERT INTO city
VALUES(
      11569,
      'Coolidge',
      234
);

INSERT INTO city
VALUES(
      11570,
      'Eloy',
      234
);

INSERT INTO city
VALUES(
      11571,
      'Marana',
      234
);

INSERT INTO city
VALUES(
      11572,
      'Maricopa',
      234
);

INSERT INTO city
VALUES(
      11573,
      'Sedona',
      234
);

INSERT INTO city
VALUES(
      11574,
      'Avondale',
      234
);

INSERT INTO city
VALUES(
      11575,
      'Tucson',
      234
);

INSERT INTO city
VALUES(
      11576,
      'Gilbert',
      234
);

INSERT INTO city
VALUES(
      11577,
      'Prescott Valley',
      234
);

INSERT INTO city
VALUES(
      11578,
      'Mesa',
      234
);

INSERT INTO city
VALUES(
      11579,
      'Cave Creek',
      234
);

INSERT INTO city
VALUES(
      11580,
      'Douglas',
      234
);

INSERT INTO city
VALUES(
      11581,
      'Apache Junction',
      234
);

INSERT INTO city
VALUES(
      11582,
      'Prescott',
      234
);

INSERT INTO city
VALUES(
      11583,
      'Bisbee',
      234
);

INSERT INTO city
VALUES(
      11584,
      'Cottonwood',
      234
);

INSERT INTO city
VALUES(
      11585,
      'Sierra Vista',
      234
);

INSERT INTO city
VALUES(
      11586,
      'Bullhead City',
      234
);

INSERT INTO city
VALUES(
      11587,
      'Casa Grande',
      234
);

INSERT INTO city
VALUES(
      11588,
      'Winslow',
      234
);

INSERT INTO city
VALUES(
      11589,
      'Snowflake',
      234
);

INSERT INTO city
VALUES(
      11590,
      'Yuma',
      234
);

INSERT INTO city
VALUES(
      11591,
      'Sahuarita',
      234
);

INSERT INTO city
VALUES(
      11592,
      'Somerton',
      234
);

INSERT INTO city
VALUES(
      11593,
      'Chino Valley',
      234
);

INSERT INTO city
VALUES(
      11594,
      'Chandler',
      234
);

INSERT INTO city
VALUES(
      11595,
      'Youngtown',
      234
);

INSERT INTO city
VALUES(
      11596,
      'Fountain Hills',
      234
);

INSERT INTO city
VALUES(
      11597,
      'Glendale',
      234
);

INSERT INTO city
VALUES(
      11598,
      'Eagar',
      234
);

INSERT INTO city
VALUES(
      11599,
      'Surprise',
      234
);

INSERT INTO city
VALUES(
      11600,
      'South Tucson',
      234
);

INSERT INTO city
VALUES(
      11601,
      'Litchfield Park',
      234
);

INSERT INTO city
VALUES(
      11602,
      'Globe',
      234
);

INSERT INTO city
VALUES(
      11603,
      'Lake Havasu City',
      234
);

INSERT INTO city
VALUES(
      11604,
      'Colorado City',
      234
);

INSERT INTO city
VALUES(
      11605,
      'Goodyear',
      234
);

INSERT INTO city
VALUES(
      11606,
      'Peoria',
      234
);

INSERT INTO city
VALUES(
      11607,
      'Camp Verde',
      234
);

INSERT INTO city
VALUES(
      11608,
      'Kingman',
      234
);

INSERT INTO city
VALUES(
      11609,
      'Thatcher',
      234
);

INSERT INTO city
VALUES(
      11610,
      'Florence',
      234
);

INSERT INTO city
VALUES(
      11611,
      'Phoenix',
      234
);

INSERT INTO city
VALUES(
      11612,
      'San Luis',
      234
);

INSERT INTO city
VALUES(
      11613,
      'Tempe',
      234
);

INSERT INTO city
VALUES(
      11614,
      'Paradise Valley',
      234
);

INSERT INTO city
VALUES(
      11615,
      'Payson',
      234
);

INSERT INTO city
VALUES(
      11616,
      'Page',
      234
);

INSERT INTO city
VALUES(
      11617,
      'Clifton',
      234
);

INSERT INTO city
VALUES(
      11618,
      'Nampa',
      234
);

INSERT INTO city
VALUES(
      11619,
      'Pocatello',
      234
);

INSERT INTO city
VALUES(
      11620,
      'Post Falls',
      234
);

INSERT INTO city
VALUES(
      11621,
      'Hailey',
      234
);

INSERT INTO city
VALUES(
      11622,
      'Boise',
      234
);

INSERT INTO city
VALUES(
      11623,
      'Eagle',
      234
);

INSERT INTO city
VALUES(
      11624,
      'Rexburg',
      234
);

INSERT INTO city
VALUES(
      11625,
      'Rigby',
      234
);

INSERT INTO city
VALUES(
      11626,
      'Fruitland',
      234
);

INSERT INTO city
VALUES(
      11627,
      'Rathdrum',
      234
);

INSERT INTO city
VALUES(
      11628,
      'Ammon',
      234
);

INSERT INTO city
VALUES(
      11629,
      'Middleton',
      234
);

INSERT INTO city
VALUES(
      11630,
      'Payette',
      234
);

INSERT INTO city
VALUES(
      11631,
      'Rupert',
      234
);

INSERT INTO city
VALUES(
      11632,
      'Kuna',
      234
);

INSERT INTO city
VALUES(
      11633,
      'Jerome',
      234
);

INSERT INTO city
VALUES(
      11634,
      'Burley',
      234
);

INSERT INTO city
VALUES(
      11635,
      'Twin Falls',
      234
);

INSERT INTO city
VALUES(
      11636,
      'Garden City',
      234
);

INSERT INTO city
VALUES(
      11637,
      'Sandpoint',
      234
);

INSERT INTO city
VALUES(
      11638,
      'Mountain Home',
      234
);

INSERT INTO city
VALUES(
      11639,
      'Hayden',
      234
);

INSERT INTO city
VALUES(
      11640,
      'Caldwell',
      234
);

INSERT INTO city
VALUES(
      11641,
      'Blackfoot',
      234
);

INSERT INTO city
VALUES(
      11642,
      'Moscow',
      234
);

INSERT INTO city
VALUES(
      11643,
      'Star',
      234
);

INSERT INTO city
VALUES(
      11644,
      'Coeur daAlene',
      234
);

INSERT INTO city
VALUES(
      11645,
      'Weiser',
      234
);

INSERT INTO city
VALUES(
      11646,
      'Lewiston',
      234
);

INSERT INTO city
VALUES(
      11647,
      'Chubbuck',
      234
);

INSERT INTO city
VALUES(
      11648,
      'Idaho Falls',
      234
);

INSERT INTO city
VALUES(
      11649,
      'Meridian',
      234
);

INSERT INTO city
VALUES(
      11650,
      'Emmett',
      234
);

INSERT INTO city
VALUES(
      11651,
      'Torrington',
      234
);

INSERT INTO city
VALUES(
      11652,
      'New London',
      234
);

INSERT INTO city
VALUES(
      11653,
      'Waterbury',
      234
);

INSERT INTO city
VALUES(
      11654,
      'Shelton',
      234
);

INSERT INTO city
VALUES(
      11655,
      'New Britain',
      234
);

INSERT INTO city
VALUES(
      11656,
      'Groton',
      234
);

INSERT INTO city
VALUES(
      11657,
      'City of Milford (balance)',
      234
);

INSERT INTO city
VALUES(
      11658,
      'Naugatuck',
      234
);

INSERT INTO city
VALUES(
      11659,
      'Jewett City',
      234
);

INSERT INTO city
VALUES(
      11660,
      'Bridgeport',
      234
);

INSERT INTO city
VALUES(
      11661,
      'Norwalk',
      234
);

INSERT INTO city
VALUES(
      11662,
      'Middletown',
      234
);

INSERT INTO city
VALUES(
      11663,
      'Meriden',
      234
);

INSERT INTO city
VALUES(
      11664,
      'Danbury',
      234
);

INSERT INTO city
VALUES(
      11665,
      'Ansonia',
      234
);

INSERT INTO city
VALUES(
      11666,
      'West Haven',
      234
);

INSERT INTO city
VALUES(
      11667,
      'Hartford',
      234
);

INSERT INTO city
VALUES(
      11668,
      'Bristol',
      234
);

INSERT INTO city
VALUES(
      11669,
      'Derby',
      234
);

INSERT INTO city
VALUES(
      11670,
      'New Haven',
      234
);

INSERT INTO city
VALUES(
      11671,
      'Norwich',
      234
);

INSERT INTO city
VALUES(
      11672,
      'Stamford',
      234
);

INSERT INTO city
VALUES(
      11673,
      'Presque Isle',
      234
);

INSERT INTO city
VALUES(
      11674,
      'Biddeford',
      234
);

INSERT INTO city
VALUES(
      11675,
      'Saco',
      234
);

INSERT INTO city
VALUES(
      11676,
      'Old Town',
      234
);

INSERT INTO city
VALUES(
      11677,
      'Sanford',
      234
);

INSERT INTO city
VALUES(
      11678,
      'Auburn',
      234
);

INSERT INTO city
VALUES(
      11679,
      'South Portland',
      234
);

INSERT INTO city
VALUES(
      11680,
      'Waterville',
      234
);

INSERT INTO city
VALUES(
      11681,
      'Rockland',
      234
);

INSERT INTO city
VALUES(
      11682,
      'Caribou',
      234
);

INSERT INTO city
VALUES(
      11683,
      'Gardiner',
      234
);

INSERT INTO city
VALUES(
      11684,
      'Westbrook',
      234
);

INSERT INTO city
VALUES(
      11685,
      'Lewiston',
      234
);

INSERT INTO city
VALUES(
      11686,
      'Bath',
      234
);

INSERT INTO city
VALUES(
      11687,
      'Bangor',
      234
);

INSERT INTO city
VALUES(
      11688,
      'Augusta',
      234
);

INSERT INTO city
VALUES(
      11689,
      'Brewer',
      234
);

INSERT INTO city
VALUES(
      11690,
      'Portland',
      234
);

INSERT INTO city
VALUES(
      11691,
      'Ellsworth',
      234
);

INSERT INTO city
VALUES(
      11692,
      'Easton',
      234
);

INSERT INTO city
VALUES(
      11693,
      'Frostburg',
      234
);

INSERT INTO city
VALUES(
      11694,
      'Mount Rainier',
      234
);

INSERT INTO city
VALUES(
      11695,
      'Ocean City',
      234
);

INSERT INTO city
VALUES(
      11696,
      'Hyattsville',
      234
);

INSERT INTO city
VALUES(
      11697,
      'Thurmont',
      234
);

INSERT INTO city
VALUES(
      11698,
      'Cambridge',
      234
);

INSERT INTO city
VALUES(
      11699,
      'Annapolis',
      234
);

INSERT INTO city
VALUES(
      11700,
      'Salisbury',
      234
);

INSERT INTO city
VALUES(
      11701,
      'Hampstead',
      234
);

INSERT INTO city
VALUES(
      11702,
      'Brunswick',
      234
);

INSERT INTO city
VALUES(
      11703,
      'La Plata',
      234
);

INSERT INTO city
VALUES(
      11704,
      'Takoma Park',
      234
);

INSERT INTO city
VALUES(
      11705,
      'Walkersville',
      234
);

INSERT INTO city
VALUES(
      11706,
      'Fruitland',
      234
);

INSERT INTO city
VALUES(
      11707,
      'Elkton',
      234
);

INSERT INTO city
VALUES(
      11708,
      'Manchester',
      234
);

INSERT INTO city
VALUES(
      11709,
      'New Carrollton',
      234
);

INSERT INTO city
VALUES(
      11710,
      'Princess Anne',
      234
);

INSERT INTO city
VALUES(
      11711,
      'Rockville',
      234
);

INSERT INTO city
VALUES(
      11712,
      'Hagerstown',
      234
);

INSERT INTO city
VALUES(
      11713,
      'Westminster',
      234
);

INSERT INTO city
VALUES(
      11714,
      'Leonardtown',
      234
);

INSERT INTO city
VALUES(
      11715,
      'Frederick',
      234
);

INSERT INTO city
VALUES(
      11716,
      'Havre de Grace',
      234
);

INSERT INTO city
VALUES(
      11717,
      'Bowie',
      234
);

INSERT INTO city
VALUES(
      11718,
      'Chestertown',
      234
);

INSERT INTO city
VALUES(
      11719,
      'Cheverly',
      234
);

INSERT INTO city
VALUES(
      11720,
      'Mount Airy',
      234
);

INSERT INTO city
VALUES(
      11721,
      'Glenarden',
      234
);

INSERT INTO city
VALUES(
      11722,
      'Greenbelt',
      234
);

INSERT INTO city
VALUES(
      11723,
      'Aberdeen',
      234
);

INSERT INTO city
VALUES(
      11724,
      'Riverdale Park',
      234
);

INSERT INTO city
VALUES(
      11725,
      'District Heights',
      234
);

INSERT INTO city
VALUES(
      11726,
      'Bladensburg',
      234
);

INSERT INTO city
VALUES(
      11727,
      'Cumberland',
      234
);

INSERT INTO city
VALUES(
      11728,
      'Bel Air',
      234
);

INSERT INTO city
VALUES(
      11729,
      'Taneytown',
      234
);

INSERT INTO city
VALUES(
      11730,
      'College Park',
      234
);

INSERT INTO city
VALUES(
      11731,
      'Chesapeake Beach',
      234
);

INSERT INTO city
VALUES(
      11732,
      'Emmitsburg',
      234
);

INSERT INTO city
VALUES(
      11733,
      'Westernport',
      234
);

INSERT INTO city
VALUES(
      11734,
      'Gaithersburg',
      234
);

INSERT INTO city
VALUES(
      11735,
      'Laurel',
      234
);

INSERT INTO city
VALUES(
      11736,
      'Baltimore',
      234
);

INSERT INTO city
VALUES(
      11737,
      'Marlborough',
      234
);

INSERT INTO city
VALUES(
      11738,
      'Quincy',
      234
);

INSERT INTO city
VALUES(
      11739,
      'Chicopee',
      234
);

INSERT INTO city
VALUES(
      11740,
      'Waltham',
      234
);

INSERT INTO city
VALUES(
      11741,
      'Medford',
      234
);

INSERT INTO city
VALUES(
      11742,
      'Gloucester',
      234
);

INSERT INTO city
VALUES(
      11743,
      'Boston',
      234
);

INSERT INTO city
VALUES(
      11744,
      'Haverhill',
      234
);

INSERT INTO city
VALUES(
      11745,
      'Newton',
      234
);

INSERT INTO city
VALUES(
      11746,
      'Pittsfield',
      234
);

INSERT INTO city
VALUES(
      11747,
      'Everett',
      234
);

INSERT INTO city
VALUES(
      11748,
      'Salem',
      234
);

INSERT INTO city
VALUES(
      11749,
      'Brockton',
      234
);

INSERT INTO city
VALUES(
      11750,
      'North Adams',
      234
);

INSERT INTO city
VALUES(
      11751,
      'Watertown',
      234
);

INSERT INTO city
VALUES(
      11752,
      'Westfield',
      234
);

INSERT INTO city
VALUES(
      11753,
      'Cambridge',
      234
);

INSERT INTO city
VALUES(
      11754,
      'Somerville',
      234
);

INSERT INTO city
VALUES(
      11755,
      'Northampton',
      234
);

INSERT INTO city
VALUES(
      11756,
      'Methuen',
      234
);

INSERT INTO city
VALUES(
      11757,
      'Holyoke',
      234
);

INSERT INTO city
VALUES(
      11758,
      'Newburyport',
      234
);

INSERT INTO city
VALUES(
      11759,
      'Fitchburg',
      234
);

INSERT INTO city
VALUES(
      11760,
      'Lawrence',
      234
);

INSERT INTO city
VALUES(
      11761,
      'Revere',
      234
);

INSERT INTO city
VALUES(
      11762,
      'New Bedford',
      234
);

INSERT INTO city
VALUES(
      11763,
      'Beverly',
      234
);

INSERT INTO city
VALUES(
      11764,
      'Woburn',
      234
);

INSERT INTO city
VALUES(
      11765,
      'Chelsea',
      234
);

INSERT INTO city
VALUES(
      11766,
      'Worcester',
      234
);

INSERT INTO city
VALUES(
      11767,
      'Melrose',
      234
);

INSERT INTO city
VALUES(
      11768,
      'Peabody',
      234
);

INSERT INTO city
VALUES(
      11769,
      'Springfield',
      234
);

INSERT INTO city
VALUES(
      11770,
      'Lowell',
      234
);

INSERT INTO city
VALUES(
      11771,
      'Leominster',
      234
);

INSERT INTO city
VALUES(
      11772,
      'Gardner',
      234
);

INSERT INTO city
VALUES(
      11773,
      'Malden',
      234
);

INSERT INTO city
VALUES(
      11774,
      'Lynn',
      234
);

INSERT INTO city
VALUES(
      11775,
      'Attleboro',
      234
);

INSERT INTO city
VALUES(
      11776,
      'Fall River',
      234
);

INSERT INTO city
VALUES(
      11777,
      'Taunton',
      234
);

INSERT INTO city
VALUES(
      11778,
      'Toledo',
      234
);

INSERT INTO city
VALUES(
      11779,
      'University Heights',
      234
);

INSERT INTO city
VALUES(
      11780,
      'Sheffield Lake',
      234
);

INSERT INTO city
VALUES(
      11781,
      'Blue Ash',
      234
);

INSERT INTO city
VALUES(
      11782,
      'Trotwood',
      234
);

INSERT INTO city
VALUES(
      11783,
      'Hamilton',
      234
);

INSERT INTO city
VALUES(
      11784,
      'Grove City',
      234
);

INSERT INTO city
VALUES(
      11785,
      'Northwood',
      234
);

INSERT INTO city
VALUES(
      11786,
      'Akron',
      234
);

INSERT INTO city
VALUES(
      11787,
      'Centerville',
      234
);

INSERT INTO city
VALUES(
      11788,
      'Lakewood',
      234
);

INSERT INTO city
VALUES(
      11789,
      'Wickliffe',
      234
);

INSERT INTO city
VALUES(
      11790,
      'Monroe',
      234
);

INSERT INTO city
VALUES(
      11791,
      'Montgomery',
      234
);

INSERT INTO city
VALUES(
      11792,
      'Newark',
      234
);

INSERT INTO city
VALUES(
      11793,
      'Richmond Heights',
      234
);

INSERT INTO city
VALUES(
      11794,
      'Vandalia',
      234
);

INSERT INTO city
VALUES(
      11795,
      'Columbiana',
      234
);

INSERT INTO city
VALUES(
      11796,
      'Kirtland',
      234
);

INSERT INTO city
VALUES(
      11797,
      'Oberlin',
      234
);

INSERT INTO city
VALUES(
      11798,
      'North Canton',
      234
);

INSERT INTO city
VALUES(
      11799,
      'Napoleon',
      234
);

INSERT INTO city
VALUES(
      11800,
      'Bellefontaine',
      234
);

INSERT INTO city
VALUES(
      11801,
      'Cambridge',
      234
);

INSERT INTO city
VALUES(
      11802,
      'Medina',
      234
);

INSERT INTO city
VALUES(
      11803,
      'Shaker Heights',
      234
);

INSERT INTO city
VALUES(
      11804,
      'Galion',
      234
);

INSERT INTO city
VALUES(
      11805,
      'Brecksville',
      234
);

INSERT INTO city
VALUES(
      11806,
      'Trenton',
      234
);

INSERT INTO city
VALUES(
      11807,
      'Lisbon',
      234
);

INSERT INTO city
VALUES(
      11808,
      'Worthington',
      234
);

INSERT INTO city
VALUES(
      11809,
      'Union',
      234
);

INSERT INTO city
VALUES(
      11810,
      'Miamisburg',
      234
);

INSERT INTO city
VALUES(
      11811,
      'Steubenville',
      234
);

INSERT INTO city
VALUES(
      11812,
      'Eastlake',
      234
);

INSERT INTO city
VALUES(
      11813,
      'Powell',
      234
);

INSERT INTO city
VALUES(
      11814,
      'The Village of Indian Hill',
      234
);

INSERT INTO city
VALUES(
      11815,
      'New Albany',
      234
);

INSERT INTO city
VALUES(
      11816,
      'Bedford Heights',
      234
);

INSERT INTO city
VALUES(
      11817,
      'Russells Point',
      234
);

INSERT INTO city
VALUES(
      11818,
      'Ashville',
      234
);

INSERT INTO city
VALUES(
      11819,
      'Jackson',
      234
);

INSERT INTO city
VALUES(
      11820,
      'Strongsville',
      234
);

INSERT INTO city
VALUES(
      11821,
      'Harrison',
      234
);

INSERT INTO city
VALUES(
      11822,
      'Cleveland',
      234
);

INSERT INTO city
VALUES(
      11823,
      'Campbell',
      234
);

INSERT INTO city
VALUES(
      11824,
      'Athens',
      234
);

INSERT INTO city
VALUES(
      11825,
      'Stow',
      234
);

INSERT INTO city
VALUES(
      11826,
      'Lyndhurst',
      234
);

INSERT INTO city
VALUES(
      11827,
      'Ashland',
      234
);

INSERT INTO city
VALUES(
      11828,
      'Cleveland Heights',
      234
);

INSERT INTO city
VALUES(
      11829,
      'Parma',
      234
);

INSERT INTO city
VALUES(
      11830,
      'Warren',
      234
);

INSERT INTO city
VALUES(
      11831,
      'Caldwell',
      234
);

INSERT INTO city
VALUES(
      11832,
      'Norton',
      234
);

INSERT INTO city
VALUES(
      11833,
      'Delphos',
      234
);

INSERT INTO city
VALUES(
      11834,
      'Westerville',
      234
);

INSERT INTO city
VALUES(
      11835,
      'Seven Hills',
      234
);

INSERT INTO city
VALUES(
      11836,
      'Norwood',
      234
);

INSERT INTO city
VALUES(
      11837,
      'Fostoria',
      234
);

INSERT INTO city
VALUES(
      11838,
      'Oakwood',
      234
);

INSERT INTO city
VALUES(
      11839,
      'Hudson',
      234
);

INSERT INTO city
VALUES(
      11840,
      'Port Clinton',
      234
);

INSERT INTO city
VALUES(
      11841,
      'Hillsboro',
      234
);

INSERT INTO city
VALUES(
      11842,
      'Circleville',
      234
);

INSERT INTO city
VALUES(
      11843,
      'Middleburg Heights',
      234
);

INSERT INTO city
VALUES(
      11844,
      'Reynoldsburg',
      234
);

INSERT INTO city
VALUES(
      11845,
      'Mount Vernon',
      234
);

INSERT INTO city
VALUES(
      11846,
      'Gahanna',
      234
);

INSERT INTO city
VALUES(
      11847,
      'Wilmington',
      234
);

INSERT INTO city
VALUES(
      11848,
      'Madeira',
      234
);

INSERT INTO city
VALUES(
      11849,
      'Fairfield',
      234
);

INSERT INTO city
VALUES(
      11850,
      'Shelby',
      234
);

INSERT INTO city
VALUES(
      11851,
      'Cuyahoga Falls',
      234
);

INSERT INTO city
VALUES(
      11852,
      'Youngstown',
      234
);

INSERT INTO city
VALUES(
      11853,
      'Canal Winchester',
      234
);

INSERT INTO city
VALUES(
      11854,
      'Mayfield Heights',
      234
);

INSERT INTO city
VALUES(
      11855,
      'Twinsburg',
      234
);

INSERT INTO city
VALUES(
      11856,
      'Grandview Heights',
      234
);

INSERT INTO city
VALUES(
      11857,
      'Pickerington',
      234
);

INSERT INTO city
VALUES(
      11858,
      'Lebanon',
      234
);

INSERT INTO city
VALUES(
      11859,
      'Sandusky',
      234
);

INSERT INTO city
VALUES(
      11860,
      'South Euclid',
      234
);

INSERT INTO city
VALUES(
      11861,
      'Euclid',
      234
);

INSERT INTO city
VALUES(
      11862,
      'Wyoming',
      234
);

INSERT INTO city
VALUES(
      11863,
      'Zanesville',
      234
);

INSERT INTO city
VALUES(
      11864,
      'Defiance',
      234
);

INSERT INTO city
VALUES(
      11865,
      'Avon',
      234
);

INSERT INTO city
VALUES(
      11866,
      'Saint Clairsville',
      234
);

INSERT INTO city
VALUES(
      11867,
      'Alliance',
      234
);

INSERT INTO city
VALUES(
      11868,
      'Seville',
      234
);

INSERT INTO city
VALUES(
      11869,
      'Deer Park',
      234
);

INSERT INTO city
VALUES(
      11870,
      'Mount Healthy',
      234
);

INSERT INTO city
VALUES(
      11871,
      'Painesville',
      234
);

INSERT INTO city
VALUES(
      11872,
      'Wauseon',
      234
);

INSERT INTO city
VALUES(
      11873,
      'Fairlawn',
      234
);

INSERT INTO city
VALUES(
      11874,
      'Norwalk',
      234
);

INSERT INTO city
VALUES(
      11875,
      'Maple Heights',
      234
);

INSERT INTO city
VALUES(
      11876,
      'Ontario',
      234
);

INSERT INTO city
VALUES(
      11877,
      'Fairborn',
      234
);

INSERT INTO city
VALUES(
      11878,
      'Sharonville',
      234
);

INSERT INTO city
VALUES(
      11879,
      'Rittman',
      234
);

INSERT INTO city
VALUES(
      11880,
      'Orrville',
      234
);

INSERT INTO city
VALUES(
      11881,
      'Kent',
      234
);

INSERT INTO city
VALUES(
      11882,
      'Dover',
      234
);

INSERT INTO city
VALUES(
      11883,
      'Mentor',
      234
);

INSERT INTO city
VALUES(
      11884,
      'Conneaut',
      234
);

INSERT INTO city
VALUES(
      11885,
      'Rossford',
      234
);

INSERT INTO city
VALUES(
      11886,
      'Ashtabula',
      234
);

INSERT INTO city
VALUES(
      11887,
      'Garfield Heights',
      234
);

INSERT INTO city
VALUES(
      11888,
      'Canal Fulton',
      234
);

INSERT INTO city
VALUES(
      11889,
      'Moraine',
      234
);

INSERT INTO city
VALUES(
      11890,
      'Barberton',
      234
);

INSERT INTO city
VALUES(
      11891,
      'Forest Park',
      234
);

INSERT INTO city
VALUES(
      11892,
      'Delaware',
      234
);

INSERT INTO city
VALUES(
      11893,
      'Riverside',
      234
);

INSERT INTO city
VALUES(
      11894,
      'Massillon',
      234
);

INSERT INTO city
VALUES(
      11895,
      'East Liverpool',
      234
);

INSERT INTO city
VALUES(
      11896,
      'North Olmsted',
      234
);

INSERT INTO city
VALUES(
      11897,
      'Ironton',
      234
);

INSERT INTO city
VALUES(
      11898,
      'Olmsted Falls',
      234
);

INSERT INTO city
VALUES(
      11899,
      'Ravenna',
      234
);

INSERT INTO city
VALUES(
      11900,
      'Springboro',
      234
);

INSERT INTO city
VALUES(
      11901,
      'Struthers',
      234
);

INSERT INTO city
VALUES(
      11902,
      'Marysville',
      234
);

INSERT INTO city
VALUES(
      11903,
      'Streetsboro',
      234
);

INSERT INTO city
VALUES(
      11904,
      'Troy',
      234
);

INSERT INTO city
VALUES(
      11905,
      'London',
      234
);

INSERT INTO city
VALUES(
      11906,
      'Bay Village',
      234
);

INSERT INTO city
VALUES(
      11907,
      'Chillicothe',
      234
);

INSERT INTO city
VALUES(
      11908,
      'Kenton',
      234
);

INSERT INTO city
VALUES(
      11909,
      'Washington Court House',
      234
);

INSERT INTO city
VALUES(
      11910,
      'Bucyrus',
      234
);

INSERT INTO city
VALUES(
      11911,
      'Celina',
      234
);

INSERT INTO city
VALUES(
      11912,
      'Amherst',
      234
);

INSERT INTO city
VALUES(
      11913,
      'Wellston',
      234
);

INSERT INTO city
VALUES(
      11914,
      'Middletown',
      234
);

INSERT INTO city
VALUES(
      11915,
      'Ada',
      234
);

INSERT INTO city
VALUES(
      11916,
      'Brooklyn',
      234
);

INSERT INTO city
VALUES(
      11917,
      'Englewood',
      234
);

INSERT INTO city
VALUES(
      11918,
      'Willowick',
      234
);

INSERT INTO city
VALUES(
      11919,
      'Berea',
      234
);

INSERT INTO city
VALUES(
      11920,
      'Lancaster',
      234
);

INSERT INTO city
VALUES(
      11921,
      'Springfield',
      234
);

INSERT INTO city
VALUES(
      11922,
      'Pepper Pike',
      234
);

INSERT INTO city
VALUES(
      11923,
      'Macedonia',
      234
);

INSERT INTO city
VALUES(
      11924,
      'Carlisle',
      234
);

INSERT INTO city
VALUES(
      11925,
      'Tipp City',
      234
);

INSERT INTO city
VALUES(
      11926,
      'North Ridgeville',
      234
);

INSERT INTO city
VALUES(
      11927,
      'Fremont',
      234
);

INSERT INTO city
VALUES(
      11928,
      'Kettering',
      234
);

INSERT INTO city
VALUES(
      11929,
      'Beavercreek',
      234
);

INSERT INTO city
VALUES(
      11930,
      'Hilliard',
      234
);

INSERT INTO city
VALUES(
      11931,
      'Canton',
      234
);

INSERT INTO city
VALUES(
      11932,
      'Louisville',
      234
);

INSERT INTO city
VALUES(
      11933,
      'Willoughby',
      234
);

INSERT INTO city
VALUES(
      11934,
      'Columbus',
      234
);

INSERT INTO city
VALUES(
      11935,
      'Niles',
      234
);

INSERT INTO city
VALUES(
      11936,
      'Loveland',
      234
);

INSERT INTO city
VALUES(
      11937,
      'Greenfield',
      234
);

INSERT INTO city
VALUES(
      11938,
      'Bowling Green',
      234
);

INSERT INTO city
VALUES(
      11939,
      'Logan',
      234
);

INSERT INTO city
VALUES(
      11940,
      'Canfield',
      234
);

INSERT INTO city
VALUES(
      11941,
      'Brunswick',
      234
);

INSERT INTO city
VALUES(
      11942,
      'Marietta',
      234
);

INSERT INTO city
VALUES(
      11943,
      'Oxford',
      234
);

INSERT INTO city
VALUES(
      11944,
      'Wapakoneta',
      234
);

INSERT INTO city
VALUES(
      11945,
      'North College Hill',
      234
);

INSERT INTO city
VALUES(
      11946,
      'Granville',
      234
);

INSERT INTO city
VALUES(
      11947,
      'Reading',
      234
);

INSERT INTO city
VALUES(
      11948,
      'Sunbury',
      234
);

INSERT INTO city
VALUES(
      11949,
      'Brook Park',
      234
);

INSERT INTO city
VALUES(
      11950,
      'Middleport',
      234
);

INSERT INTO city
VALUES(
      11951,
      'Broadview Heights',
      234
);

INSERT INTO city
VALUES(
      11952,
      'Ottawa',
      234
);

INSERT INTO city
VALUES(
      11953,
      'New Bremen',
      234
);

INSERT INTO city
VALUES(
      11954,
      'Waterville',
      234
);

INSERT INTO city
VALUES(
      11955,
      'Grafton',
      234
);

INSERT INTO city
VALUES(
      11956,
      'Heath',
      234
);

INSERT INTO city
VALUES(
      11957,
      'Bedford',
      234
);

INSERT INTO city
VALUES(
      11958,
      'Upper Sandusky',
      234
);

INSERT INTO city
VALUES(
      11959,
      'Dublin',
      234
);

INSERT INTO city
VALUES(
      11960,
      'Eaton',
      234
);

INSERT INTO city
VALUES(
      11961,
      'Westlake',
      234
);

INSERT INTO city
VALUES(
      11962,
      'Marion',
      234
);

INSERT INTO city
VALUES(
      11963,
      'Huron',
      234
);

INSERT INTO city
VALUES(
      11964,
      'Upper Arlington',
      234
);

INSERT INTO city
VALUES(
      11965,
      'Oregon',
      234
);

INSERT INTO city
VALUES(
      11966,
      'Milford',
      234
);

INSERT INTO city
VALUES(
      11967,
      'Sidney',
      234
);

INSERT INTO city
VALUES(
      11968,
      'Clyde',
      234
);

INSERT INTO city
VALUES(
      11969,
      'New Carlisle',
      234
);

INSERT INTO city
VALUES(
      11970,
      'Salem',
      234
);

INSERT INTO city
VALUES(
      11971,
      'Uhrichsville',
      234
);

INSERT INTO city
VALUES(
      11972,
      'Cheviot',
      234
);

INSERT INTO city
VALUES(
      11973,
      'New Franklin',
      234
);

INSERT INTO city
VALUES(
      11974,
      'Piqua',
      234
);

INSERT INTO city
VALUES(
      11975,
      'Chardon',
      234
);

INSERT INTO city
VALUES(
      11976,
      'Cincinnati',
      234
);

INSERT INTO city
VALUES(
      11977,
      'Beachwood',
      234
);

INSERT INTO city
VALUES(
      11978,
      'Perrysburg',
      234
);

INSERT INTO city
VALUES(
      11979,
      'Sylvania',
      234
);

INSERT INTO city
VALUES(
      11980,
      'Urbana',
      234
);

INSERT INTO city
VALUES(
      11981,
      'Munroe Falls',
      234
);

INSERT INTO city
VALUES(
      11982,
      'Coshocton',
      234
);

INSERT INTO city
VALUES(
      11983,
      'Findlay',
      234
);

INSERT INTO city
VALUES(
      11984,
      'Bryan',
      234
);

INSERT INTO city
VALUES(
      11985,
      'Franklin',
      234
);

INSERT INTO city
VALUES(
      11986,
      'Hubbard',
      234
);

INSERT INTO city
VALUES(
      11987,
      'Garrettsville',
      234
);

INSERT INTO city
VALUES(
      11988,
      'Parma Heights',
      234
);

INSERT INTO city
VALUES(
      11989,
      'East Cleveland',
      234
);

INSERT INTO city
VALUES(
      11990,
      'Green',
      234
);

INSERT INTO city
VALUES(
      11991,
      'New Philadelphia',
      234
);

INSERT INTO city
VALUES(
      11992,
      'Clayton',
      234
);

INSERT INTO city
VALUES(
      11993,
      'Nelsonville',
      234
);

INSERT INTO city
VALUES(
      11994,
      'Pataskala',
      234
);

INSERT INTO city
VALUES(
      11995,
      'Bexley',
      234
);

INSERT INTO city
VALUES(
      11996,
      'Elyria',
      234
);

INSERT INTO city
VALUES(
      11997,
      'Warrensville Heights',
      234
);

INSERT INTO city
VALUES(
      11998,
      'Lorain',
      234
);

INSERT INTO city
VALUES(
      11999,
      'Martins Ferry',
      234
);

INSERT INTO city
VALUES(
      12000,
      'North Royalton',
      234
);

INSERT INTO city
VALUES(
      12001,
      'Willard',
      234
);

INSERT INTO city
VALUES(
      12002,
      'Tallmadge',
      234
);

INSERT INTO city
VALUES(
      12003,
      'Bellbrook',
      234
);

INSERT INTO city
VALUES(
      12004,
      'Wooster',
      234
);

INSERT INTO city
VALUES(
      12005,
      'Rocky River',
      234
);

INSERT INTO city
VALUES(
      12006,
      'Wadsworth',
      234
);

INSERT INTO city
VALUES(
      12007,
      'Highland Heights',
      234
);

INSERT INTO city
VALUES(
      12008,
      'Van Wert',
      234
);

INSERT INTO city
VALUES(
      12009,
      'Avon Lake',
      234
);

INSERT INTO city
VALUES(
      12010,
      'Xenia',
      234
);

INSERT INTO city
VALUES(
      12011,
      'Mentor-on-the-Lake',
      234
);

INSERT INTO city
VALUES(
      12012,
      'Lima',
      234
);

INSERT INTO city
VALUES(
      12013,
      'Groveport',
      234
);

INSERT INTO city
VALUES(
      12014,
      'Independence',
      234
);

INSERT INTO city
VALUES(
      12015,
      'Aurora',
      234
);

INSERT INTO city
VALUES(
      12016,
      'Portsmouth',
      234
);

INSERT INTO city
VALUES(
      12017,
      'Tiffin',
      234
);

INSERT INTO city
VALUES(
      12018,
      'Mansfield',
      234
);

INSERT INTO city
VALUES(
      12019,
      'Springdale',
      234
);

INSERT INTO city
VALUES(
      12020,
      'Germantown',
      234
);

INSERT INTO city
VALUES(
      12021,
      'Huber Heights',
      234
);

INSERT INTO city
VALUES(
      12022,
      'Saint Marys',
      234
);

INSERT INTO city
VALUES(
      12023,
      'Bellevue',
      234
);

INSERT INTO city
VALUES(
      12024,
      'Maumee',
      234
);

INSERT INTO city
VALUES(
      12025,
      'Mason',
      234
);

INSERT INTO city
VALUES(
      12026,
      'Solon',
      234
);

INSERT INTO city
VALUES(
      12027,
      'Belpre',
      234
);

INSERT INTO city
VALUES(
      12028,
      'Brookville',
      234
);

INSERT INTO city
VALUES(
      12029,
      'Greenville',
      234
);

INSERT INTO city
VALUES(
      12030,
      'Fairview Park',
      234
);

INSERT INTO city
VALUES(
      12031,
      'Dayton',
      234
);

INSERT INTO city
VALUES(
      12032,
      'Vermilion',
      234
);

INSERT INTO city
VALUES(
      12033,
      'Cortland',
      234
);

INSERT INTO city
VALUES(
      12034,
      'Geneva',
      234
);

INSERT INTO city
VALUES(
      12035,
      'Whitehall',
      234
);

INSERT INTO city
VALUES(
      12036,
      'Girard',
      234
);

INSERT INTO city
VALUES(
      12037,
      'Willoughby Hills',
      234
);

INSERT INTO city
VALUES(
      12038,
      'South Ogden',
      234
);

INSERT INTO city
VALUES(
      12039,
      'Harrisville',
      234
);

INSERT INTO city
VALUES(
      12040,
      'North Salt Lake',
      234
);

INSERT INTO city
VALUES(
      12041,
      'Spanish Fork',
      234
);

INSERT INTO city
VALUES(
      12042,
      'Orem',
      234
);

INSERT INTO city
VALUES(
      12043,
      'West Valley City',
      234
);

INSERT INTO city
VALUES(
      12044,
      'Enoch',
      234
);

INSERT INTO city
VALUES(
      12045,
      'Cedar Hills',
      234
);

INSERT INTO city
VALUES(
      12046,
      'Hooper',
      234
);

INSERT INTO city
VALUES(
      12047,
      'Bluffdale',
      234
);

INSERT INTO city
VALUES(
      12048,
      'Bountiful',
      234
);

INSERT INTO city
VALUES(
      12049,
      'Saratoga Springs',
      234
);

INSERT INTO city
VALUES(
      12050,
      'Providence',
      234
);

INSERT INTO city
VALUES(
      12051,
      'Hyrum',
      234
);

INSERT INTO city
VALUES(
      12052,
      'West Bountiful',
      234
);

INSERT INTO city
VALUES(
      12053,
      'Centerville',
      234
);

INSERT INTO city
VALUES(
      12054,
      'Hurricane',
      234
);

INSERT INTO city
VALUES(
      12055,
      'West Jordan',
      234
);

INSERT INTO city
VALUES(
      12056,
      'North Ogden',
      234
);

INSERT INTO city
VALUES(
      12057,
      'Ivins',
      234
);

INSERT INTO city
VALUES(
      12058,
      'Tooele',
      234
);

INSERT INTO city
VALUES(
      12059,
      'Holladay',
      234
);

INSERT INTO city
VALUES(
      12060,
      'Riverton',
      234
);

INSERT INTO city
VALUES(
      12061,
      'Vernal',
      234
);

INSERT INTO city
VALUES(
      12062,
      'Midvale',
      234
);

INSERT INTO city
VALUES(
      12063,
      'Smithfield',
      234
);

INSERT INTO city
VALUES(
      12064,
      'American Fork',
      234
);

INSERT INTO city
VALUES(
      12065,
      'Grantsville',
      234
);

INSERT INTO city
VALUES(
      12066,
      'Salt Lake City',
      234
);

INSERT INTO city
VALUES(
      12067,
      'Alpine',
      234
);

INSERT INTO city
VALUES(
      12068,
      'Clinton',
      234
);

INSERT INTO city
VALUES(
      12069,
      'Layton',
      234
);

INSERT INTO city
VALUES(
      12070,
      'Springville',
      234
);

INSERT INTO city
VALUES(
      12071,
      'Roosevelt',
      234
);

INSERT INTO city
VALUES(
      12072,
      'Sunset',
      234
);

INSERT INTO city
VALUES(
      12073,
      'West Haven',
      234
);

INSERT INTO city
VALUES(
      12074,
      'Farmington',
      234
);

INSERT INTO city
VALUES(
      12075,
      'Ephraim',
      234
);

INSERT INTO city
VALUES(
      12076,
      'Price',
      234
);

INSERT INTO city
VALUES(
      12077,
      'Ogden',
      234
);

INSERT INTO city
VALUES(
      12078,
      'Saint George',
      234
);

INSERT INTO city
VALUES(
      12079,
      'Clearfield',
      234
);

INSERT INTO city
VALUES(
      12080,
      'Millcreek',
      234
);

INSERT INTO city
VALUES(
      12081,
      'Highland',
      234
);

INSERT INTO city
VALUES(
      12082,
      'Washington Terrace',
      234
);

INSERT INTO city
VALUES(
      12083,
      'Kaysville',
      234
);

INSERT INTO city
VALUES(
      12084,
      'Midway',
      234
);

INSERT INTO city
VALUES(
      12085,
      'Eagle Mountain',
      234
);

INSERT INTO city
VALUES(
      12086,
      'Cottonwood Heights',
      234
);

INSERT INTO city
VALUES(
      12087,
      'Washington',
      234
);

INSERT INTO city
VALUES(
      12088,
      'Moab',
      234
);

INSERT INTO city
VALUES(
      12089,
      'Vineyard',
      234
);

INSERT INTO city
VALUES(
      12090,
      'Nibley',
      234
);

INSERT INTO city
VALUES(
      12091,
      'Taylorsville',
      234
);

INSERT INTO city
VALUES(
      12092,
      'Lehi',
      234
);

INSERT INTO city
VALUES(
      12093,
      'Cedar City',
      234
);

INSERT INTO city
VALUES(
      12094,
      'Brigham City',
      234
);

INSERT INTO city
VALUES(
      12095,
      'Pleasant View',
      234
);

INSERT INTO city
VALUES(
      12096,
      'Santa Clara',
      234
);

INSERT INTO city
VALUES(
      12097,
      'Salem',
      234
);

INSERT INTO city
VALUES(
      12098,
      'Park City',
      234
);

INSERT INTO city
VALUES(
      12099,
      'Mapleton',
      234
);

INSERT INTO city
VALUES(
      12100,
      'Logan',
      234
);

INSERT INTO city
VALUES(
      12101,
      'Provo',
      234
);

INSERT INTO city
VALUES(
      12102,
      'Nephi',
      234
);

INSERT INTO city
VALUES(
      12103,
      'North Logan',
      234
);

INSERT INTO city
VALUES(
      12104,
      'South Salt Lake',
      234
);

INSERT INTO city
VALUES(
      12105,
      'Plain City',
      234
);

INSERT INTO city
VALUES(
      12106,
      'Draper',
      234
);

INSERT INTO city
VALUES(
      12107,
      'Syracuse',
      234
);

INSERT INTO city
VALUES(
      12108,
      'Tremonton',
      234
);

INSERT INTO city
VALUES(
      12109,
      'West Point',
      234
);

INSERT INTO city
VALUES(
      12110,
      'Roy',
      234
);

INSERT INTO city
VALUES(
      12111,
      'Farr West',
      234
);

INSERT INTO city
VALUES(
      12112,
      'Fruit Heights',
      234
);

INSERT INTO city
VALUES(
      12113,
      'Richfield',
      234
);

INSERT INTO city
VALUES(
      12114,
      'Pleasant Grove',
      234
);

INSERT INTO city
VALUES(
      12115,
      'Woods Cross',
      234
);

INSERT INTO city
VALUES(
      12116,
      'Lindon',
      234
);

INSERT INTO city
VALUES(
      12117,
      'Herriman',
      234
);

INSERT INTO city
VALUES(
      12118,
      'Murray',
      234
);

INSERT INTO city
VALUES(
      12119,
      'South Jordan',
      234
);

INSERT INTO city
VALUES(
      12120,
      'Santaquin',
      234
);

INSERT INTO city
VALUES(
      12121,
      'Payson',
      234
);

INSERT INTO city
VALUES(
      12122,
      'Riverdale',
      234
);

INSERT INTO city
VALUES(
      12123,
      'South Weber',
      234
);

INSERT INTO city
VALUES(
      12124,
      'Bolivar',
      234
);

INSERT INTO city
VALUES(
      12125,
      'Pleasant Hill',
      234
);

INSERT INTO city
VALUES(
      12126,
      'Columbia',
      234
);

INSERT INTO city
VALUES(
      12127,
      'Parkville',
      234
);

INSERT INTO city
VALUES(
      12128,
      'Chesterfield',
      234
);

INSERT INTO city
VALUES(
      12129,
      'Hannibal',
      234
);

INSERT INTO city
VALUES(
      12130,
      'Republic',
      234
);

INSERT INTO city
VALUES(
      12131,
      'Branson',
      234
);

INSERT INTO city
VALUES(
      12132,
      'Lebanon',
      234
);

INSERT INTO city
VALUES(
      12133,
      'Forsyth',
      234
);

INSERT INTO city
VALUES(
      12134,
      'Wentzville',
      234
);

INSERT INTO city
VALUES(
      12135,
      'Ferguson',
      234
);

INSERT INTO city
VALUES(
      12136,
      'Town and Country',
      234
);

INSERT INTO city
VALUES(
      12137,
      'Grandview',
      234
);

INSERT INTO city
VALUES(
      12138,
      'Scott City',
      234
);

INSERT INTO city
VALUES(
      12139,
      'Dexter',
      234
);

INSERT INTO city
VALUES(
      12140,
      'Glendale',
      234
);

INSERT INTO city
VALUES(
      12141,
      'Jennings',
      234
);

INSERT INTO city
VALUES(
      12142,
      'Richmond',
      234
);

INSERT INTO city
VALUES(
      12143,
      'Saint Peters',
      234
);

INSERT INTO city
VALUES(
      12144,
      'Nixa',
      234
);

INSERT INTO city
VALUES(
      12145,
      'Union',
      234
);

INSERT INTO city
VALUES(
      12146,
      'Bowling Green',
      234
);

INSERT INTO city
VALUES(
      12147,
      'Pacific',
      234
);

INSERT INTO city
VALUES(
      12148,
      'Raymore',
      234
);

INSERT INTO city
VALUES(
      12149,
      'Nevada',
      234
);

INSERT INTO city
VALUES(
      12150,
      'Sunset Hills',
      234
);

INSERT INTO city
VALUES(
      12151,
      'Clayton',
      234
);

INSERT INTO city
VALUES(
      12152,
      'Eureka',
      234
);

INSERT INTO city
VALUES(
      12153,
      'Joplin',
      234
);

INSERT INTO city
VALUES(
      12154,
      'Saint Louis',
      234
);

INSERT INTO city
VALUES(
      12155,
      'Lake Saint Louis',
      234
);

INSERT INTO city
VALUES(
      12156,
      'Grain Valley',
      234
);

INSERT INTO city
VALUES(
      12157,
      'Manchester',
      234
);

INSERT INTO city
VALUES(
      12158,
      'Richmond Heights',
      234
);

INSERT INTO city
VALUES(
      12159,
      'Wildwood',
      234
);

INSERT INTO city
VALUES(
      12160,
      'Kearney',
      234
);

INSERT INTO city
VALUES(
      12161,
      'Valley Park',
      234
);

INSERT INTO city
VALUES(
      12162,
      'Savannah',
      234
);

INSERT INTO city
VALUES(
      12163,
      'Sikeston',
      234
);

INSERT INTO city
VALUES(
      12164,
      'Willard',
      234
);

INSERT INTO city
VALUES(
      12165,
      'Liberty',
      234
);

INSERT INTO city
VALUES(
      12166,
      'Monett',
      234
);

INSERT INTO city
VALUES(
      12167,
      'Ladue',
      234
);

INSERT INTO city
VALUES(
      12168,
      'Florissant',
      234
);

INSERT INTO city
VALUES(
      12169,
      'Clinton',
      234
);

INSERT INTO city
VALUES(
      12170,
      'Saint Robert',
      234
);

INSERT INTO city
VALUES(
      12171,
      'Bonne Terre',
      234
);

INSERT INTO city
VALUES(
      12172,
      'Bellefontaine Neighbors',
      234
);

INSERT INTO city
VALUES(
      12173,
      'De Soto',
      234
);

INSERT INTO city
VALUES(
      12174,
      'Charleston',
      234
);

INSERT INTO city
VALUES(
      12175,
      'Battlefield',
      234
);

INSERT INTO city
VALUES(
      12176,
      'Mexico',
      234
);

INSERT INTO city
VALUES(
      12177,
      'Excelsior Springs',
      234
);

INSERT INTO city
VALUES(
      12178,
      'Olivette',
      234
);

INSERT INTO city
VALUES(
      12179,
      'Odessa',
      234
);

INSERT INTO city
VALUES(
      12180,
      'Marshfield',
      234
);

INSERT INTO city
VALUES(
      12181,
      'Belton',
      234
);

INSERT INTO city
VALUES(
      12182,
      'Poplar Bluff',
      234
);

INSERT INTO city
VALUES(
      12183,
      'Cape Girardeau',
      234
);

INSERT INTO city
VALUES(
      12184,
      'Springfield',
      234
);

INSERT INTO city
VALUES(
      12185,
      'Boonville',
      234
);

INSERT INTO city
VALUES(
      12186,
      'Sedalia',
      234
);

INSERT INTO city
VALUES(
      12187,
      'Trenton',
      234
);

INSERT INTO city
VALUES(
      12188,
      'Jefferson City',
      234
);

INSERT INTO city
VALUES(
      12189,
      'Independence',
      234
);

INSERT INTO city
VALUES(
      12190,
      'Caruthersville',
      234
);

INSERT INTO city
VALUES(
      12191,
      'Creve Coeur',
      234
);

INSERT INTO city
VALUES(
      12192,
      'Warrensburg',
      234
);

INSERT INTO city
VALUES(
      12193,
      'Gladstone',
      234
);

INSERT INTO city
VALUES(
      12194,
      'Oak Grove',
      234
);

INSERT INTO city
VALUES(
      12195,
      'Farmington',
      234
);

INSERT INTO city
VALUES(
      12196,
      'Sullivan',
      234
);

INSERT INTO city
VALUES(
      12197,
      'Washington',
      234
);

INSERT INTO city
VALUES(
      12198,
      'Peculiar',
      234
);

INSERT INTO city
VALUES(
      12199,
      'Warrenton',
      234
);

INSERT INTO city
VALUES(
      12200,
      'Pevely',
      234
);

INSERT INTO city
VALUES(
      12201,
      'Jackson',
      234
);

INSERT INTO city
VALUES(
      12202,
      'Dardenne Prairie',
      234
);

INSERT INTO city
VALUES(
      12203,
      'Perryville',
      234
);

INSERT INTO city
VALUES(
      12204,
      'Saint Clair',
      234
);

INSERT INTO city
VALUES(
      12205,
      'Aurora',
      234
);

INSERT INTO city
VALUES(
      12206,
      'Des Peres',
      234
);

INSERT INTO city
VALUES(
      12207,
      'Rolla',
      234
);

INSERT INTO city
VALUES(
      12208,
      'Ellisville',
      234
);

INSERT INTO city
VALUES(
      12209,
      'Webster Groves',
      234
);

INSERT INTO city
VALUES(
      12210,
      'Weldon Spring',
      234
);

INSERT INTO city
VALUES(
      12211,
      'Festus',
      234
);

INSERT INTO city
VALUES(
      12212,
      'Fulton',
      234
);

INSERT INTO city
VALUES(
      12213,
      'Moberly',
      234
);

INSERT INTO city
VALUES(
      12214,
      'Harrisonville',
      234
);

INSERT INTO city
VALUES(
      12215,
      'Marshall',
      234
);

INSERT INTO city
VALUES(
      12216,
      'Saint Joseph',
      234
);

INSERT INTO city
VALUES(
      12217,
      'Maplewood',
      234
);

INSERT INTO city
VALUES(
      12218,
      'Hazelwood',
      234
);

INSERT INTO city
VALUES(
      12219,
      'Saint Ann',
      234
);

INSERT INTO city
VALUES(
      12220,
      'Kennett',
      234
);

INSERT INTO city
VALUES(
      12221,
      'Park Hills',
      234
);

INSERT INTO city
VALUES(
      12222,
      'Kansas City',
      234
);

INSERT INTO city
VALUES(
      12223,
      'Blue Springs',
      234
);

INSERT INTO city
VALUES(
      12224,
      'Webb City',
      234
);

INSERT INTO city
VALUES(
      12225,
      'Lees Summit',
      234
);

INSERT INTO city
VALUES(
      12226,
      'Ballwin',
      234
);

INSERT INTO city
VALUES(
      12227,
      'Kirkwood',
      234
);

INSERT INTO city
VALUES(
      12228,
      'Berkeley',
      234
);

INSERT INTO city
VALUES(
      12229,
      'Greenwood',
      234
);

INSERT INTO city
VALUES(
      12230,
      'Waynesville',
      234
);

INSERT INTO city
VALUES(
      12231,
      'Shrewsbury',
      234
);

INSERT INTO city
VALUES(
      12232,
      'Crestwood',
      234
);

INSERT INTO city
VALUES(
      12233,
      'Raytown',
      234
);

INSERT INTO city
VALUES(
      12234,
      'Bridgeton',
      234
);

INSERT INTO city
VALUES(
      12235,
      'Chillicothe',
      234
);

INSERT INTO city
VALUES(
      12236,
      'Brentwood',
      234
);

INSERT INTO city
VALUES(
      12237,
      'Carl Junction',
      234
);

INSERT INTO city
VALUES(
      12238,
      'Troy',
      234
);

INSERT INTO city
VALUES(
      12239,
      'Neosho',
      234
);

INSERT INTO city
VALUES(
      12240,
      'University City',
      234
);

INSERT INTO city
VALUES(
      12241,
      'Overland',
      234
);

INSERT INTO city
VALUES(
      12242,
      'Smithville',
      234
);

INSERT INTO city
VALUES(
      12243,
      'Black Jack',
      234
);

INSERT INTO city
VALUES(
      12244,
      'Carthage',
      234
);

INSERT INTO city
VALUES(
      12245,
      'Ozark',
      234
);

INSERT INTO city
VALUES(
      12246,
      'Maryville',
      234
);

INSERT INTO city
VALUES(
      12247,
      'Maryland Heights',
      234
);

INSERT INTO city
VALUES(
      12248,
      'Saint Charles',
      234
);

INSERT INTO city
VALUES(
      12249,
      'Platte City',
      234
);

INSERT INTO city
VALUES(
      12250,
      'Arnold',
      234
);

INSERT INTO city
VALUES(
      12251,
      'West Plains',
      234
);

INSERT INTO city
VALUES(
      12252,
      'Kirksville',
      234
);

INSERT INTO city
VALUES(
      12253,
      'Cameron',
      234
);

INSERT INTO city
VALUES(
      12254,
      'OaFallon',
      234
);

INSERT INTO city
VALUES(
      12255,
      'Cottleville',
      234
);

INSERT INTO city
VALUES(
      12256,
      'Savage',
      234
);

INSERT INTO city
VALUES(
      12257,
      'East Bethel',
      234
);

INSERT INTO city
VALUES(
      12258,
      'Maple Grove',
      234
);

INSERT INTO city
VALUES(
      12259,
      'Lake City',
      234
);

INSERT INTO city
VALUES(
      12260,
      'Minnetonka',
      234
);

INSERT INTO city
VALUES(
      12261,
      'International Falls',
      234
);

INSERT INTO city
VALUES(
      12262,
      'Brooklyn Center',
      234
);

INSERT INTO city
VALUES(
      12263,
      'Fridley',
      234
);

INSERT INTO city
VALUES(
      12264,
      'Hopkins',
      234
);

INSERT INTO city
VALUES(
      12265,
      'Red Wing',
      234
);

INSERT INTO city
VALUES(
      12266,
      'West Saint Paul',
      234
);

INSERT INTO city
VALUES(
      12267,
      'White Bear Lake',
      234
);

INSERT INTO city
VALUES(
      12268,
      'Hermantown',
      234
);

INSERT INTO city
VALUES(
      12269,
      'Little Canada',
      234
);

INSERT INTO city
VALUES(
      12270,
      'Shorewood',
      234
);

INSERT INTO city
VALUES(
      12271,
      'Buffalo',
      234
);

INSERT INTO city
VALUES(
      12272,
      'Glencoe',
      234
);

INSERT INTO city
VALUES(
      12273,
      'Mound',
      234
);

INSERT INTO city
VALUES(
      12274,
      'Prior Lake',
      234
);

INSERT INTO city
VALUES(
      12275,
      'Edina',
      234
);

INSERT INTO city
VALUES(
      12276,
      'Brainerd',
      234
);

INSERT INTO city
VALUES(
      12277,
      'Byron',
      234
);

INSERT INTO city
VALUES(
      12278,
      'Owatonna',
      234
);

INSERT INTO city
VALUES(
      12279,
      'Roseville',
      234
);

INSERT INTO city
VALUES(
      12280,
      'Mahtomedi',
      234
);

INSERT INTO city
VALUES(
      12281,
      'Saint Cloud',
      234
);

INSERT INTO city
VALUES(
      12282,
      'Jordan',
      234
);

INSERT INTO city
VALUES(
      12283,
      'Montevideo',
      234
);

INSERT INTO city
VALUES(
      12284,
      'Mounds View',
      234
);

INSERT INTO city
VALUES(
      12285,
      'Anoka',
      234
);

INSERT INTO city
VALUES(
      12286,
      'Crookston',
      234
);

INSERT INTO city
VALUES(
      12287,
      'Fairmont',
      234
);

INSERT INTO city
VALUES(
      12288,
      'Hibbing',
      234
);

INSERT INTO city
VALUES(
      12289,
      'Northfield',
      234
);

INSERT INTO city
VALUES(
      12290,
      'Wyoming',
      234
);

INSERT INTO city
VALUES(
      12291,
      'Chanhassen',
      234
);

INSERT INTO city
VALUES(
      12292,
      'Oak Grove',
      234
);

INSERT INTO city
VALUES(
      12293,
      'Monticello',
      234
);

INSERT INTO city
VALUES(
      12294,
      'North Oaks',
      234
);

INSERT INTO city
VALUES(
      12295,
      'Rogers',
      234
);

INSERT INTO city
VALUES(
      12296,
      'Belle Plaine',
      234
);

INSERT INTO city
VALUES(
      12297,
      'Waseca',
      234
);

INSERT INTO city
VALUES(
      12298,
      'Isanti',
      234
);

INSERT INTO city
VALUES(
      12299,
      'Forest Lake',
      234
);

INSERT INTO city
VALUES(
      12300,
      'Lake Elmo',
      234
);

INSERT INTO city
VALUES(
      12301,
      'New Ulm',
      234
);

INSERT INTO city
VALUES(
      12302,
      'Cambridge',
      234
);

INSERT INTO city
VALUES(
      12303,
      'Morris',
      234
);

INSERT INTO city
VALUES(
      12304,
      'Waite Park',
      234
);

INSERT INTO city
VALUES(
      12305,
      'Medina',
      234
);

INSERT INTO city
VALUES(
      12306,
      'Rochester',
      234
);

INSERT INTO city
VALUES(
      12307,
      'Elk River',
      234
);

INSERT INTO city
VALUES(
      12308,
      'Oakdale',
      234
);

INSERT INTO city
VALUES(
      12309,
      'Litchfield',
      234
);

INSERT INTO city
VALUES(
      12310,
      'Little Falls',
      234
);

INSERT INTO city
VALUES(
      12311,
      'Hastings',
      234
);

INSERT INTO city
VALUES(
      12312,
      'Detroit Lakes',
      234
);

INSERT INTO city
VALUES(
      12313,
      'Rosemount',
      234
);

INSERT INTO city
VALUES(
      12314,
      'Columbia Heights',
      234
);

INSERT INTO city
VALUES(
      12315,
      'Big Lake',
      234
);

INSERT INTO city
VALUES(
      12316,
      'Lino Lakes',
      234
);

INSERT INTO city
VALUES(
      12317,
      'Farmington',
      234
);

INSERT INTO city
VALUES(
      12318,
      'Winona',
      234
);

INSERT INTO city
VALUES(
      12319,
      'Albert Lea',
      234
);

INSERT INTO city
VALUES(
      12320,
      'Mankato',
      234
);

INSERT INTO city
VALUES(
      12321,
      'Virginia',
      234
);

INSERT INTO city
VALUES(
      12322,
      'Grand Rapids',
      234
);

INSERT INTO city
VALUES(
      12323,
      'Fergus Falls',
      234
);

INSERT INTO city
VALUES(
      12324,
      'Coon Rapids',
      234
);

INSERT INTO city
VALUES(
      12325,
      'Robbinsdale',
      234
);

INSERT INTO city
VALUES(
      12326,
      'Worthington',
      234
);

INSERT INTO city
VALUES(
      12327,
      'Burnsville',
      234
);

INSERT INTO city
VALUES(
      12328,
      'Arden Hills',
      234
);

INSERT INTO city
VALUES(
      12329,
      'Spring Lake Park',
      234
);

INSERT INTO city
VALUES(
      12330,
      'Vadnais Heights',
      234
);

INSERT INTO city
VALUES(
      12331,
      'Golden Valley',
      234
);

INSERT INTO city
VALUES(
      12332,
      'Shoreview',
      234
);

INSERT INTO city
VALUES(
      12333,
      'Crystal',
      234
);

INSERT INTO city
VALUES(
      12334,
      'New Prague',
      234
);

INSERT INTO city
VALUES(
      12335,
      'Apple Valley',
      234
);

INSERT INTO city
VALUES(
      12336,
      'Andover',
      234
);

INSERT INTO city
VALUES(
      12337,
      'Stillwater',
      234
);

INSERT INTO city
VALUES(
      12338,
      'Eagan',
      234
);

INSERT INTO city
VALUES(
      12339,
      'Thief River Falls',
      234
);

INSERT INTO city
VALUES(
      12340,
      'Willmar',
      234
);

INSERT INTO city
VALUES(
      12341,
      'North Mankato',
      234
);

INSERT INTO city
VALUES(
      12342,
      'Minneapolis',
      234
);

INSERT INTO city
VALUES(
      12343,
      'Cottage Grove',
      234
);

INSERT INTO city
VALUES(
      12344,
      'Maplewood',
      234
);

INSERT INTO city
VALUES(
      12345,
      'Eden Prairie',
      234
);

INSERT INTO city
VALUES(
      12346,
      'Saint Francis',
      234
);

INSERT INTO city
VALUES(
      12347,
      'Stewartville',
      234
);

INSERT INTO city
VALUES(
      12348,
      'Kasson',
      234
);

INSERT INTO city
VALUES(
      12349,
      'Inver Grove Heights',
      234
);

INSERT INTO city
VALUES(
      12350,
      'New Hope',
      234
);

INSERT INTO city
VALUES(
      12351,
      'Waconia',
      234
);

INSERT INTO city
VALUES(
      12352,
      'Marshall',
      234
);

INSERT INTO city
VALUES(
      12353,
      'Saint Peter',
      234
);

INSERT INTO city
VALUES(
      12354,
      'Delano',
      234
);

INSERT INTO city
VALUES(
      12355,
      'Saint Joseph',
      234
);

INSERT INTO city
VALUES(
      12356,
      'Saint Michael',
      234
);

INSERT INTO city
VALUES(
      12357,
      'North Branch',
      234
);

INSERT INTO city
VALUES(
      12358,
      'South Saint Paul',
      234
);

INSERT INTO city
VALUES(
      12359,
      'Zimmerman',
      234
);

INSERT INTO city
VALUES(
      12360,
      'Faribault',
      234
);

INSERT INTO city
VALUES(
      12361,
      'Saint Paul Park',
      234
);

INSERT INTO city
VALUES(
      12362,
      'Bloomington',
      234
);

INSERT INTO city
VALUES(
      12363,
      'Corcoran',
      234
);

INSERT INTO city
VALUES(
      12364,
      'Otsego',
      234
);

INSERT INTO city
VALUES(
      12365,
      'Shakopee',
      234
);

INSERT INTO city
VALUES(
      12366,
      'Victoria',
      234
);

INSERT INTO city
VALUES(
      12367,
      'Chaska',
      234
);

INSERT INTO city
VALUES(
      12368,
      'Alexandria',
      234
);

INSERT INTO city
VALUES(
      12369,
      'Orono',
      234
);

INSERT INTO city
VALUES(
      12370,
      'Mendota Heights',
      234
);

INSERT INTO city
VALUES(
      12371,
      'Saint Louis Park',
      234
);

INSERT INTO city
VALUES(
      12372,
      'Cloquet',
      234
);

INSERT INTO city
VALUES(
      12373,
      'Minnetrista',
      234
);

INSERT INTO city
VALUES(
      12374,
      'Albertville',
      234
);

INSERT INTO city
VALUES(
      12375,
      'Baxter',
      234
);

INSERT INTO city
VALUES(
      12376,
      'Lindstrom',
      234
);

INSERT INTO city
VALUES(
      12377,
      'Hugo',
      234
);

INSERT INTO city
VALUES(
      12378,
      'Plymouth',
      234
);

INSERT INTO city
VALUES(
      12379,
      'Blaine',
      234
);

INSERT INTO city
VALUES(
      12380,
      'Brooklyn Park',
      234
);

INSERT INTO city
VALUES(
      12381,
      'Richfield',
      234
);

INSERT INTO city
VALUES(
      12382,
      'Dayton',
      234
);

INSERT INTO city
VALUES(
      12383,
      'Ramsey',
      234
);

INSERT INTO city
VALUES(
      12384,
      'North Saint Paul',
      234
);

INSERT INTO city
VALUES(
      12385,
      'Hutchinson',
      234
);

INSERT INTO city
VALUES(
      12386,
      'La Crescent',
      234
);

INSERT INTO city
VALUES(
      12387,
      'Bemidji',
      234
);

INSERT INTO city
VALUES(
      12388,
      'Chisago City',
      234
);

INSERT INTO city
VALUES(
      12389,
      'Austin',
      234
);

INSERT INTO city
VALUES(
      12390,
      'Lakeville',
      234
);

INSERT INTO city
VALUES(
      12391,
      'Sauk Rapids',
      234
);

INSERT INTO city
VALUES(
      12392,
      'Falcon Heights',
      234
);

INSERT INTO city
VALUES(
      12393,
      'Champlin',
      234
);

INSERT INTO city
VALUES(
      12394,
      'Woodbury',
      234
);

INSERT INTO city
VALUES(
      12395,
      'Sartell',
      234
);

INSERT INTO city
VALUES(
      12396,
      'Duluth',
      234
);

INSERT INTO city
VALUES(
      12397,
      'Saint Paul',
      234
);

INSERT INTO city
VALUES(
      12398,
      'East Grand Forks',
      234
);

INSERT INTO city
VALUES(
      12399,
      'Saint Anthony',
      234
);

INSERT INTO city
VALUES(
      12400,
      'New Brighton',
      234
);

INSERT INTO city
VALUES(
      12401,
      'Moorhead',
      234
);

INSERT INTO city
VALUES(
      12402,
      'Ham Lake',
      234
);

INSERT INTO city
VALUES(
      12403,
      'Wayne',
      234
);

INSERT INTO city
VALUES(
      12404,
      'Grand Haven',
      234
);

INSERT INTO city
VALUES(
      12405,
      'Alpena',
      234
);

INSERT INTO city
VALUES(
      12406,
      'Lapeer',
      234
);

INSERT INTO city
VALUES(
      12407,
      'Williamston',
      234
);

INSERT INTO city
VALUES(
      12408,
      'Holland',
      234
);

INSERT INTO city
VALUES(
      12409,
      'Charlotte',
      234
);

INSERT INTO city
VALUES(
      12410,
      'Paw Paw',
      234
);

INSERT INTO city
VALUES(
      12411,
      'Hudsonville',
      234
);

INSERT INTO city
VALUES(
      12412,
      'Hazel Park',
      234
);

INSERT INTO city
VALUES(
      12413,
      'Frankenmuth',
      234
);

INSERT INTO city
VALUES(
      12414,
      'Novi',
      234
);

INSERT INTO city
VALUES(
      12415,
      'Ludington',
      234
);

INSERT INTO city
VALUES(
      12416,
      'South Haven',
      234
);

INSERT INTO city
VALUES(
      12417,
      'Houghton',
      234
);

INSERT INTO city
VALUES(
      12418,
      'Dowagiac',
      234
);

INSERT INTO city
VALUES(
      12419,
      'Clare',
      234
);

INSERT INTO city
VALUES(
      12420,
      'Marquette',
      234
);

INSERT INTO city
VALUES(
      12421,
      'Mount Pleasant',
      234
);

INSERT INTO city
VALUES(
      12422,
      'Northville',
      234
);

INSERT INTO city
VALUES(
      12423,
      'Clawson',
      234
);

INSERT INTO city
VALUES(
      12424,
      'Rochester',
      234
);

INSERT INTO city
VALUES(
      12425,
      'Cadillac',
      234
);

INSERT INTO city
VALUES(
      12426,
      'East Grand Rapids',
      234
);

INSERT INTO city
VALUES(
      12427,
      'South Lyon',
      234
);

INSERT INTO city
VALUES(
      12428,
      'Brighton',
      234
);

INSERT INTO city
VALUES(
      12429,
      'Big Rapids',
      234
);

INSERT INTO city
VALUES(
      12430,
      'Albion',
      234
);

INSERT INTO city
VALUES(
      12431,
      'Fraser',
      234
);

INSERT INTO city
VALUES(
      12432,
      'Roseville',
      234
);

INSERT INTO city
VALUES(
      12433,
      'Birmingham',
      234
);

INSERT INTO city
VALUES(
      12434,
      'Grosse Pointe',
      234
);

INSERT INTO city
VALUES(
      12435,
      'Huntington Woods',
      234
);

INSERT INTO city
VALUES(
      12436,
      'Bay City',
      234
);

INSERT INTO city
VALUES(
      12437,
      'Norton Shores',
      234
);

INSERT INTO city
VALUES(
      12438,
      'Kentwood',
      234
);

INSERT INTO city
VALUES(
      12439,
      'Three Rivers',
      234
);

INSERT INTO city
VALUES(
      12440,
      'Melvindale',
      234
);

INSERT INTO city
VALUES(
      12441,
      'Howell',
      234
);

INSERT INTO city
VALUES(
      12442,
      'New Baltimore',
      234
);

INSERT INTO city
VALUES(
      12443,
      'Oak Park',
      234
);

INSERT INTO city
VALUES(
      12444,
      'Swartz Creek',
      234
);

INSERT INTO city
VALUES(
      12445,
      'Monroe',
      234
);

INSERT INTO city
VALUES(
      12446,
      'Ishpeming',
      234
);

INSERT INTO city
VALUES(
      12447,
      'Wyoming',
      234
);

INSERT INTO city
VALUES(
      12448,
      'Allegan',
      234
);

INSERT INTO city
VALUES(
      12449,
      'Escanaba',
      234
);

INSERT INTO city
VALUES(
      12450,
      'Rochester Hills',
      234
);

INSERT INTO city
VALUES(
      12451,
      'Eastpointe',
      234
);

INSERT INTO city
VALUES(
      12452,
      'Muskegon',
      234
);

INSERT INTO city
VALUES(
      12453,
      'East Lansing',
      234
);

INSERT INTO city
VALUES(
      12454,
      'Westland',
      234
);

INSERT INTO city
VALUES(
      12455,
      'Highland Park',
      234
);

INSERT INTO city
VALUES(
      12456,
      'Fenton',
      234
);

INSERT INTO city
VALUES(
      12457,
      'Belding',
      234
);

INSERT INTO city
VALUES(
      12458,
      'Saint Clair Shores',
      234
);

INSERT INTO city
VALUES(
      12459,
      'Flushing',
      234
);

INSERT INTO city
VALUES(
      12460,
      'Jackson',
      234
);

INSERT INTO city
VALUES(
      12461,
      'Hamtramck',
      234
);

INSERT INTO city
VALUES(
      12462,
      'Walled Lake',
      234
);

INSERT INTO city
VALUES(
      12463,
      'River Rouge',
      234
);

INSERT INTO city
VALUES(
      12464,
      'Flat Rock',
      234
);

INSERT INTO city
VALUES(
      12465,
      'Owosso',
      234
);

INSERT INTO city
VALUES(
      12466,
      'Traverse City',
      234
);

INSERT INTO city
VALUES(
      12467,
      'Farmington',
      234
);

INSERT INTO city
VALUES(
      12468,
      'Muskegon Heights',
      234
);

INSERT INTO city
VALUES(
      12469,
      'Holly',
      234
);

INSERT INTO city
VALUES(
      12470,
      'Grand Ledge',
      234
);

INSERT INTO city
VALUES(
      12471,
      'Grand Rapids',
      234
);

INSERT INTO city
VALUES(
      12472,
      'Trenton',
      234
);

INSERT INTO city
VALUES(
      12473,
      'Beverly Hills',
      234
);

INSERT INTO city
VALUES(
      12474,
      'Romulus',
      234
);

INSERT INTO city
VALUES(
      12475,
      'Menominee',
      234
);

INSERT INTO city
VALUES(
      12476,
      'Ypsilanti',
      234
);

INSERT INTO city
VALUES(
      12477,
      'Madison Heights',
      234
);

INSERT INTO city
VALUES(
      12478,
      'Saint Joseph',
      234
);

INSERT INTO city
VALUES(
      12479,
      'Gaylord',
      234
);

INSERT INTO city
VALUES(
      12480,
      'Tecumseh',
      234
);

INSERT INTO city
VALUES(
      12481,
      'Ann Arbor',
      234
);

INSERT INTO city
VALUES(
      12482,
      'Hastings',
      234
);

INSERT INTO city
VALUES(
      12483,
      'Coldwater',
      234
);

INSERT INTO city
VALUES(
      12484,
      'Kalamazoo',
      234
);

INSERT INTO city
VALUES(
      12485,
      'Saginaw',
      234
);

INSERT INTO city
VALUES(
      12486,
      'Lincoln Park',
      234
);

INSERT INTO city
VALUES(
      12487,
      'Sault Sainte Marie',
      234
);

INSERT INTO city
VALUES(
      12488,
      'Livonia',
      234
);

INSERT INTO city
VALUES(
      12489,
      'Petoskey',
      234
);

INSERT INTO city
VALUES(
      12490,
      'Harper Woods',
      234
);

INSERT INTO city
VALUES(
      12491,
      'Saint Clair',
      234
);

INSERT INTO city
VALUES(
      12492,
      'Pontiac',
      234
);

INSERT INTO city
VALUES(
      12493,
      'Manistee',
      234
);

INSERT INTO city
VALUES(
      12494,
      'Eaton Rapids',
      234
);

INSERT INTO city
VALUES(
      12495,
      'Rockford',
      234
);

INSERT INTO city
VALUES(
      12496,
      'Ionia',
      234
);

INSERT INTO city
VALUES(
      12497,
      'Battle Creek',
      234
);

INSERT INTO city
VALUES(
      12498,
      'Grosse Pointe Woods',
      234
);

INSERT INTO city
VALUES(
      12499,
      'Lansing',
      234
);

INSERT INTO city
VALUES(
      12500,
      'Southgate',
      234
);

INSERT INTO city
VALUES(
      12501,
      'Berrien Springs',
      234
);

INSERT INTO city
VALUES(
      12502,
      'Niles',
      234
);

INSERT INTO city
VALUES(
      12503,
      'Saint Louis',
      234
);

INSERT INTO city
VALUES(
      12504,
      'Sterling Heights',
      234
);

INSERT INTO city
VALUES(
      12505,
      'Goodrich',
      234
);

INSERT INTO city
VALUES(
      12506,
      'Marshall',
      234
);

INSERT INTO city
VALUES(
      12507,
      'Grand Blanc',
      234
);

INSERT INTO city
VALUES(
      12508,
      'Whitehall',
      234
);

INSERT INTO city
VALUES(
      12509,
      'Auburn Hills',
      234
);

INSERT INTO city
VALUES(
      12510,
      'Lowell',
      234
);

INSERT INTO city
VALUES(
      12511,
      'Garden City',
      234
);

INSERT INTO city
VALUES(
      12512,
      'Grosse Pointe Park',
      234
);

INSERT INTO city
VALUES(
      12513,
      'Alma',
      234
);

INSERT INTO city
VALUES(
      12514,
      'Wyandotte',
      234
);

INSERT INTO city
VALUES(
      12515,
      'Wixom',
      234
);

INSERT INTO city
VALUES(
      12516,
      'Saint Johns',
      234
);

INSERT INTO city
VALUES(
      12517,
      'Port Huron',
      234
);

INSERT INTO city
VALUES(
      12518,
      'Allen Park',
      234
);

INSERT INTO city
VALUES(
      12519,
      'Portland',
      234
);

INSERT INTO city
VALUES(
      12520,
      'Milford',
      234
);

INSERT INTO city
VALUES(
      12521,
      'Otsego',
      234
);

INSERT INTO city
VALUES(
      12522,
      'Flint',
      234
);

INSERT INTO city
VALUES(
      12523,
      'Marysville',
      234
);

INSERT INTO city
VALUES(
      12524,
      'Dearborn',
      234
);

INSERT INTO city
VALUES(
      12525,
      'Sturgis',
      234
);

INSERT INTO city
VALUES(
      12526,
      'Grandville',
      234
);

INSERT INTO city
VALUES(
      12527,
      'Inkster',
      234
);

INSERT INTO city
VALUES(
      12528,
      'Richmond',
      234
);

INSERT INTO city
VALUES(
      12529,
      'Center Line',
      234
);

INSERT INTO city
VALUES(
      12530,
      'Troy',
      234
);

INSERT INTO city
VALUES(
      12531,
      'Warren',
      234
);

INSERT INTO city
VALUES(
      12532,
      'Mason',
      234
);

INSERT INTO city
VALUES(
      12533,
      'Riverview',
      234
);

INSERT INTO city
VALUES(
      12534,
      'Zeeland',
      234
);

INSERT INTO city
VALUES(
      12535,
      'Berkley',
      234
);

INSERT INTO city
VALUES(
      12536,
      'Taylor',
      234
);

INSERT INTO city
VALUES(
      12537,
      'Saline',
      234
);

INSERT INTO city
VALUES(
      12538,
      'Midland',
      234
);

INSERT INTO city
VALUES(
      12539,
      'Laurium',
      234
);

INSERT INTO city
VALUES(
      12540,
      'Greenville',
      234
);

INSERT INTO city
VALUES(
      12541,
      'Ecorse',
      234
);

INSERT INTO city
VALUES(
      12542,
      'Mount Clemens',
      234
);

INSERT INTO city
VALUES(
      12543,
      'Detroit',
      234
);

INSERT INTO city
VALUES(
      12544,
      'Adrian',
      234
);

INSERT INTO city
VALUES(
      12545,
      'Walker',
      234
);

INSERT INTO city
VALUES(
      12546,
      'Chelsea',
      234
);

INSERT INTO city
VALUES(
      12547,
      'Southfield',
      234
);

INSERT INTO city
VALUES(
      12548,
      'Burton',
      234
);

INSERT INTO city
VALUES(
      12549,
      'Ironwood',
      234
);

INSERT INTO city
VALUES(
      12550,
      'Benton Harbor',
      234
);

INSERT INTO city
VALUES(
      12551,
      'Milan',
      234
);

INSERT INTO city
VALUES(
      12552,
      'Grosse Pointe Farms',
      234
);

INSERT INTO city
VALUES(
      12553,
      'Portage',
      234
);

INSERT INTO city
VALUES(
      12554,
      'Dearborn Heights',
      234
);

INSERT INTO city
VALUES(
      12555,
      'Springfield',
      234
);

INSERT INTO city
VALUES(
      12556,
      'Farmington Hills',
      234
);

INSERT INTO city
VALUES(
      12557,
      'Iron Mountain',
      234
);

INSERT INTO city
VALUES(
      12558,
      'Ferndale',
      234
);

INSERT INTO city
VALUES(
      12559,
      'Hillsdale',
      234
);

INSERT INTO city
VALUES(
      12560,
      'Plymouth',
      234
);

INSERT INTO city
VALUES(
      12561,
      'Woodhaven',
      234
);

INSERT INTO city
VALUES(
      12562,
      'Royal Oak',
      234
);

INSERT INTO city
VALUES(
      12563,
      'Central Falls',
      234
);

INSERT INTO city
VALUES(
      12564,
      'Providence',
      234
);

INSERT INTO city
VALUES(
      12565,
      'Warwick',
      234
);

INSERT INTO city
VALUES(
      12566,
      'Cranston',
      234
);

INSERT INTO city
VALUES(
      12567,
      'East Providence',
      234
);

INSERT INTO city
VALUES(
      12568,
      'Newport',
      234
);

INSERT INTO city
VALUES(
      12569,
      'Woonsocket',
      234
);

INSERT INTO city
VALUES(
      12570,
      'Pawtucket',
      234
);

INSERT INTO city
VALUES(
      12571,
      'Park City',
      234
);

INSERT INTO city
VALUES(
      12572,
      'Arkansas City',
      234
);

INSERT INTO city
VALUES(
      12573,
      'Ottawa',
      234
);

INSERT INTO city
VALUES(
      12574,
      'El Dorado',
      234
);

INSERT INTO city
VALUES(
      12575,
      'Ulysses',
      234
);

INSERT INTO city
VALUES(
      12576,
      'Iola',
      234
);

INSERT INTO city
VALUES(
      12577,
      'Mulvane',
      234
);

INSERT INTO city
VALUES(
      12578,
      'Basehor',
      234
);

INSERT INTO city
VALUES(
      12579,
      'Valley Center',
      234
);

INSERT INTO city
VALUES(
      12580,
      'Overland Park',
      234
);

INSERT INTO city
VALUES(
      12581,
      'Leavenworth',
      234
);

INSERT INTO city
VALUES(
      12582,
      'Lansing',
      234
);

INSERT INTO city
VALUES(
      12583,
      'Junction City',
      234
);

INSERT INTO city
VALUES(
      12584,
      'Roeland Park',
      234
);

INSERT INTO city
VALUES(
      12585,
      'Gardner',
      234
);

INSERT INTO city
VALUES(
      12586,
      'Spring Hill',
      234
);

INSERT INTO city
VALUES(
      12587,
      'Prairie Village',
      234
);

INSERT INTO city
VALUES(
      12588,
      'Pratt',
      234
);

INSERT INTO city
VALUES(
      12589,
      'McPherson',
      234
);

INSERT INTO city
VALUES(
      12590,
      'Great Bend',
      234
);

INSERT INTO city
VALUES(
      12591,
      'Liberal',
      234
);

INSERT INTO city
VALUES(
      12592,
      'Pittsburg',
      234
);

INSERT INTO city
VALUES(
      12593,
      'Newton',
      234
);

INSERT INTO city
VALUES(
      12594,
      'Lenexa',
      234
);

INSERT INTO city
VALUES(
      12595,
      'Fort Scott',
      234
);

INSERT INTO city
VALUES(
      12596,
      'Parsons',
      234
);

INSERT INTO city
VALUES(
      12597,
      'Winfield',
      234
);

INSERT INTO city
VALUES(
      12598,
      'Emporia',
      234
);

INSERT INTO city
VALUES(
      12599,
      'De Soto',
      234
);

INSERT INTO city
VALUES(
      12600,
      'Paola',
      234
);

INSERT INTO city
VALUES(
      12601,
      'Concordia',
      234
);

INSERT INTO city
VALUES(
      12602,
      'Bonner Springs',
      234
);

INSERT INTO city
VALUES(
      12603,
      'Abilene',
      234
);

INSERT INTO city
VALUES(
      12604,
      'Topeka',
      234
);

INSERT INTO city
VALUES(
      12605,
      'Hutchinson',
      234
);

INSERT INTO city
VALUES(
      12606,
      'Shawnee',
      234
);

INSERT INTO city
VALUES(
      12607,
      'Independence',
      234
);

INSERT INTO city
VALUES(
      12608,
      'Chanute',
      234
);

INSERT INTO city
VALUES(
      12609,
      'Dodge City',
      234
);

INSERT INTO city
VALUES(
      12610,
      'Andover',
      234
);

INSERT INTO city
VALUES(
      12611,
      'Hays',
      234
);

INSERT INTO city
VALUES(
      12612,
      'Eudora',
      234
);

INSERT INTO city
VALUES(
      12613,
      'Wellington',
      234
);

INSERT INTO city
VALUES(
      12614,
      'Coffeyville',
      234
);

INSERT INTO city
VALUES(
      12615,
      'Garden City',
      234
);

INSERT INTO city
VALUES(
      12616,
      'Tonganoxie',
      234
);

INSERT INTO city
VALUES(
      12617,
      'Kansas City',
      234
);

INSERT INTO city
VALUES(
      12618,
      'Augusta',
      234
);

INSERT INTO city
VALUES(
      12619,
      'Leawood',
      234
);

INSERT INTO city
VALUES(
      12620,
      'Colby',
      234
);

INSERT INTO city
VALUES(
      12621,
      'Atchison',
      234
);

INSERT INTO city
VALUES(
      12622,
      'Haysville',
      234
);

INSERT INTO city
VALUES(
      12623,
      'Salina',
      234
);

INSERT INTO city
VALUES(
      12624,
      'Lawrence',
      234
);

INSERT INTO city
VALUES(
      12625,
      'Merriam',
      234
);

INSERT INTO city
VALUES(
      12626,
      'Olathe',
      234
);

INSERT INTO city
VALUES(
      12627,
      'Manhattan',
      234
);

INSERT INTO city
VALUES(
      12628,
      'Wichita',
      234
);

INSERT INTO city
VALUES(
      12629,
      'Derby',
      234
);

INSERT INTO city
VALUES(
      12630,
      'Mission',
      234
);

INSERT INTO city
VALUES(
      12631,
      'Hamilton',
      234
);

INSERT INTO city
VALUES(
      12632,
      'Butte',
      234
);

INSERT INTO city
VALUES(
      12633,
      'Belgrade',
      234
);

INSERT INTO city
VALUES(
      12634,
      'Kalispell',
      234
);

INSERT INTO city
VALUES(
      12635,
      'Great Falls',
      234
);

INSERT INTO city
VALUES(
      12636,
      'Billings',
      234
);

INSERT INTO city
VALUES(
      12637,
      'Glendive',
      234
);

INSERT INTO city
VALUES(
      12638,
      'Miles City',
      234
);

INSERT INTO city
VALUES(
      12639,
      'Lewistown',
      234
);

INSERT INTO city
VALUES(
      12640,
      'Havre',
      234
);

INSERT INTO city
VALUES(
      12641,
      'Helena',
      234
);

INSERT INTO city
VALUES(
      12642,
      'Missoula',
      234
);

INSERT INTO city
VALUES(
      12643,
      'Sidney',
      234
);

INSERT INTO city
VALUES(
      12644,
      'Whitefish',
      234
);

INSERT INTO city
VALUES(
      12645,
      'Bozeman',
      234
);

INSERT INTO city
VALUES(
      12646,
      'Laurel',
      234
);

INSERT INTO city
VALUES(
      12647,
      'Columbia Falls',
      234
);

INSERT INTO city
VALUES(
      12648,
      'Polson',
      234
);

INSERT INTO city
VALUES(
      12649,
      'Livingston',
      234
);

INSERT INTO city
VALUES(
      12650,
      'Columbia',
      234
);

INSERT INTO city
VALUES(
      12651,
      'Batesville',
      234
);

INSERT INTO city
VALUES(
      12652,
      'Flowood',
      234
);

INSERT INTO city
VALUES(
      12653,
      'Crystal Springs',
      234
);

INSERT INTO city
VALUES(
      12654,
      'Diamondhead',
      234
);

INSERT INTO city
VALUES(
      12655,
      'Hattiesburg',
      234
);

INSERT INTO city
VALUES(
      12656,
      'Clarksdale',
      234
);

INSERT INTO city
VALUES(
      12657,
      'Ocean Springs',
      234
);

INSERT INTO city
VALUES(
      12658,
      'Canton',
      234
);

INSERT INTO city
VALUES(
      12659,
      'West Point',
      234
);

INSERT INTO city
VALUES(
      12660,
      'Bay Saint Louis',
      234
);

INSERT INTO city
VALUES(
      12661,
      'Booneville',
      234
);

INSERT INTO city
VALUES(
      12662,
      'Oxford',
      234
);

INSERT INTO city
VALUES(
      12663,
      'Brookhaven',
      234
);

INSERT INTO city
VALUES(
      12664,
      'Yazoo City',
      234
);

INSERT INTO city
VALUES(
      12665,
      'Petal',
      234
);

INSERT INTO city
VALUES(
      12666,
      'Southaven',
      234
);

INSERT INTO city
VALUES(
      12667,
      'Holly Springs',
      234
);

INSERT INTO city
VALUES(
      12668,
      'Kosciusko',
      234
);

INSERT INTO city
VALUES(
      12669,
      'Clinton',
      234
);

INSERT INTO city
VALUES(
      12670,
      'Indianola',
      234
);

INSERT INTO city
VALUES(
      12671,
      'Philadelphia',
      234
);

INSERT INTO city
VALUES(
      12672,
      'Starkville',
      234
);

INSERT INTO city
VALUES(
      12673,
      'Amory',
      234
);

INSERT INTO city
VALUES(
      12674,
      'Natchez',
      234
);

INSERT INTO city
VALUES(
      12675,
      'Pontotoc',
      234
);

INSERT INTO city
VALUES(
      12676,
      'Biloxi',
      234
);

INSERT INTO city
VALUES(
      12677,
      'Pascagoula',
      234
);

INSERT INTO city
VALUES(
      12678,
      'New Albany',
      234
);

INSERT INTO city
VALUES(
      12679,
      'Gulfport',
      234
);

INSERT INTO city
VALUES(
      12680,
      'Jackson',
      234
);

INSERT INTO city
VALUES(
      12681,
      'Pearl',
      234
);

INSERT INTO city
VALUES(
      12682,
      'Vicksburg',
      234
);

INSERT INTO city
VALUES(
      12683,
      'Senatobia',
      234
);

INSERT INTO city
VALUES(
      12684,
      'Cleveland',
      234
);

INSERT INTO city
VALUES(
      12685,
      'Laurel',
      234
);

INSERT INTO city
VALUES(
      12686,
      'Waveland',
      234
);

INSERT INTO city
VALUES(
      12687,
      'Richland',
      234
);

INSERT INTO city
VALUES(
      12688,
      'Horn Lake',
      234
);

INSERT INTO city
VALUES(
      12689,
      'Greenwood',
      234
);

INSERT INTO city
VALUES(
      12690,
      'Ridgeland',
      234
);

INSERT INTO city
VALUES(
      12691,
      'McComb',
      234
);

INSERT INTO city
VALUES(
      12692,
      'Long Beach',
      234
);

INSERT INTO city
VALUES(
      12693,
      'Brandon',
      234
);

INSERT INTO city
VALUES(
      12694,
      'Meridian',
      234
);

INSERT INTO city
VALUES(
      12695,
      'Columbus',
      234
);

INSERT INTO city
VALUES(
      12696,
      'Madison',
      234
);

INSERT INTO city
VALUES(
      12697,
      'Greenville',
      234
);

INSERT INTO city
VALUES(
      12698,
      'Picayune',
      234
);

INSERT INTO city
VALUES(
      12699,
      'DaIberville',
      234
);

INSERT INTO city
VALUES(
      12700,
      'Gautier',
      234
);

INSERT INTO city
VALUES(
      12701,
      'Grenada',
      234
);

INSERT INTO city
VALUES(
      12702,
      'Pass Christian',
      234
);

INSERT INTO city
VALUES(
      12703,
      'Hernando',
      234
);

INSERT INTO city
VALUES(
      12704,
      'Moss Point',
      234
);

INSERT INTO city
VALUES(
      12705,
      'Byram',
      234
);

INSERT INTO city
VALUES(
      12706,
      'Corinth',
      234
);

INSERT INTO city
VALUES(
      12707,
      'Olive Branch',
      234
);

INSERT INTO city
VALUES(
      12708,
      'Tupelo',
      234
);

INSERT INTO city
VALUES(
      12709,
      'Clover',
      234
);

INSERT INTO city
VALUES(
      12710,
      'Columbia',
      234
);

INSERT INTO city
VALUES(
      12711,
      'Lake City',
      234
);

INSERT INTO city
VALUES(
      12712,
      'Hardeeville',
      234
);

INSERT INTO city
VALUES(
      12713,
      'Greer',
      234
);

INSERT INTO city
VALUES(
      12714,
      'Dillon',
      234
);

INSERT INTO city
VALUES(
      12715,
      'Mount Pleasant',
      234
);

INSERT INTO city
VALUES(
      12716,
      'Kingstree',
      234
);

INSERT INTO city
VALUES(
      12717,
      'Goose Creek',
      234
);

INSERT INTO city
VALUES(
      12718,
      'Summerville',
      234
);

INSERT INTO city
VALUES(
      12719,
      'Laurens',
      234
);

INSERT INTO city
VALUES(
      12720,
      'Lexington',
      234
);

INSERT INTO city
VALUES(
      12721,
      'Hartsville',
      234
);

INSERT INTO city
VALUES(
      12722,
      'Bluffton',
      234
);

INSERT INTO city
VALUES(
      12723,
      'Irmo',
      234
);

INSERT INTO city
VALUES(
      12724,
      'Mullins',
      234
);

INSERT INTO city
VALUES(
      12725,
      'Gaffney',
      234
);

INSERT INTO city
VALUES(
      12726,
      'Fort Mill',
      234
);

INSERT INTO city
VALUES(
      12727,
      'Hilton Head Island',
      234
);

INSERT INTO city
VALUES(
      12728,
      'Camden',
      234
);

INSERT INTO city
VALUES(
      12729,
      'Clinton',
      234
);

INSERT INTO city
VALUES(
      12730,
      'Batesburg-Leesville',
      234
);

INSERT INTO city
VALUES(
      12731,
      'Walterboro',
      234
);

INSERT INTO city
VALUES(
      12732,
      'Hollywood',
      234
);

INSERT INTO city
VALUES(
      12733,
      'Orangeburg',
      234
);

INSERT INTO city
VALUES(
      12734,
      'Charleston',
      234
);

INSERT INTO city
VALUES(
      12735,
      'Aiken',
      234
);

INSERT INTO city
VALUES(
      12736,
      'Sumter',
      234
);

INSERT INTO city
VALUES(
      12737,
      'Belton',
      234
);

INSERT INTO city
VALUES(
      12738,
      'Newberry',
      234
);

INSERT INTO city
VALUES(
      12739,
      'Myrtle Beach',
      234
);

INSERT INTO city
VALUES(
      12740,
      'Union',
      234
);

INSERT INTO city
VALUES(
      12741,
      'York',
      234
);

INSERT INTO city
VALUES(
      12742,
      'North Myrtle Beach',
      234
);

INSERT INTO city
VALUES(
      12743,
      'Cayce',
      234
);

INSERT INTO city
VALUES(
      12744,
      'Clemson',
      234
);

INSERT INTO city
VALUES(
      12745,
      'Moncks Corner',
      234
);

INSERT INTO city
VALUES(
      12746,
      'Marion',
      234
);

INSERT INTO city
VALUES(
      12747,
      'Darlington',
      234
);

INSERT INTO city
VALUES(
      12748,
      'Anderson',
      234
);

INSERT INTO city
VALUES(
      12749,
      'Central',
      234
);

INSERT INTO city
VALUES(
      12750,
      'West Columbia',
      234
);

INSERT INTO city
VALUES(
      12751,
      'Beaufort',
      234
);

INSERT INTO city
VALUES(
      12752,
      'North Charleston',
      234
);

INSERT INTO city
VALUES(
      12753,
      'Conway',
      234
);

INSERT INTO city
VALUES(
      12754,
      'Bennettsville',
      234
);

INSERT INTO city
VALUES(
      12755,
      'Simpsonville',
      234
);

INSERT INTO city
VALUES(
      12756,
      'Georgetown',
      234
);

INSERT INTO city
VALUES(
      12757,
      'Cheraw',
      234
);

INSERT INTO city
VALUES(
      12758,
      'Spartanburg',
      234
);

INSERT INTO city
VALUES(
      12759,
      'Greenwood',
      234
);

INSERT INTO city
VALUES(
      12760,
      'Ridgeland',
      234
);

INSERT INTO city
VALUES(
      12761,
      'Hanahan',
      234
);

INSERT INTO city
VALUES(
      12762,
      'Rock Hill',
      234
);

INSERT INTO city
VALUES(
      12763,
      'Chester',
      234
);

INSERT INTO city
VALUES(
      12764,
      'Seneca',
      234
);

INSERT INTO city
VALUES(
      12765,
      'Port Royal',
      234
);

INSERT INTO city
VALUES(
      12766,
      'Greenville',
      234
);

INSERT INTO city
VALUES(
      12767,
      'Fountain Inn',
      234
);

INSERT INTO city
VALUES(
      12768,
      'Forest Acres',
      234
);

INSERT INTO city
VALUES(
      12769,
      'Abbeville',
      234
);

INSERT INTO city
VALUES(
      12770,
      'North Augusta',
      234
);

INSERT INTO city
VALUES(
      12771,
      'Tega Cay',
      234
);

INSERT INTO city
VALUES(
      12772,
      'Florence',
      234
);

INSERT INTO city
VALUES(
      12773,
      'Lancaster',
      234
);

INSERT INTO city
VALUES(
      12774,
      'Mauldin',
      234
);

INSERT INTO city
VALUES(
      12775,
      'Travelers Rest',
      234
);

INSERT INTO city
VALUES(
      12776,
      'Easley',
      234
);

INSERT INTO city
VALUES(
      12777,
      'Corbin',
      234
);

INSERT INTO city
VALUES(
      12778,
      'Union',
      234
);

INSERT INTO city
VALUES(
      12779,
      'Jeffersontown',
      234
);

INSERT INTO city
VALUES(
      12780,
      'Taylor Mill',
      234
);

INSERT INTO city
VALUES(
      12781,
      'Radcliff',
      234
);

INSERT INTO city
VALUES(
      12782,
      'Winchester',
      234
);

INSERT INTO city
VALUES(
      12783,
      'Bowling Green',
      234
);

INSERT INTO city
VALUES(
      12784,
      'Somerset',
      234
);

INSERT INTO city
VALUES(
      12785,
      'Columbia',
      234
);

INSERT INTO city
VALUES(
      12786,
      'Beaver Dam',
      234
);

INSERT INTO city
VALUES(
      12787,
      'Fort Thomas',
      234
);

INSERT INTO city
VALUES(
      12788,
      'Grayson',
      234
);

INSERT INTO city
VALUES(
      12789,
      'Richmond',
      234
);

INSERT INTO city
VALUES(
      12790,
      'Louisville',
      234
);

INSERT INTO city
VALUES(
      12791,
      'Middletown',
      234
);

INSERT INTO city
VALUES(
      12792,
      'Hopkinsville',
      234
);

INSERT INTO city
VALUES(
      12793,
      'Wilmore',
      234
);

INSERT INTO city
VALUES(
      12794,
      'Lebanon',
      234
);

INSERT INTO city
VALUES(
      12795,
      'Glasgow',
      234
);

INSERT INTO city
VALUES(
      12796,
      'Fort Mitchell',
      234
);

INSERT INTO city
VALUES(
      12797,
      'Newport',
      234
);

INSERT INTO city
VALUES(
      12798,
      'Manchester',
      234
);

INSERT INTO city
VALUES(
      12799,
      'Barbourville',
      234
);

INSERT INTO city
VALUES(
      12800,
      'Covington',
      234
);

INSERT INTO city
VALUES(
      12801,
      'Monticello',
      234
);

INSERT INTO city
VALUES(
      12802,
      'Carrollton',
      234
);

INSERT INTO city
VALUES(
      12803,
      'Harrodsburg',
      234
);

INSERT INTO city
VALUES(
      12804,
      'Shepherdsville',
      234
);

INSERT INTO city
VALUES(
      12805,
      'Flatwoods',
      234
);

INSERT INTO city
VALUES(
      12806,
      'Frankfort',
      234
);

INSERT INTO city
VALUES(
      12807,
      'Owensboro',
      234
);

INSERT INTO city
VALUES(
      12808,
      'Campbellsville',
      234
);

INSERT INTO city
VALUES(
      12809,
      'Cold Spring',
      234
);

INSERT INTO city
VALUES(
      12810,
      'Highland Heights',
      234
);

INSERT INTO city
VALUES(
      12811,
      'Versailles',
      234
);

INSERT INTO city
VALUES(
      12812,
      'Vine Grove',
      234
);

INSERT INTO city
VALUES(
      12813,
      'Danville',
      234
);

INSERT INTO city
VALUES(
      12814,
      'Edgewood',
      234
);

INSERT INTO city
VALUES(
      12815,
      'Morehead',
      234
);

INSERT INTO city
VALUES(
      12816,
      'Erlanger',
      234
);

INSERT INTO city
VALUES(
      12817,
      'Paris',
      234
);

INSERT INTO city
VALUES(
      12818,
      'Paintsville',
      234
);

INSERT INTO city
VALUES(
      12819,
      'Henderson',
      234
);

INSERT INTO city
VALUES(
      12820,
      'Lyndon',
      234
);

INSERT INTO city
VALUES(
      12821,
      'Paducah',
      234
);

INSERT INTO city
VALUES(
      12822,
      'Lexington',
      234
);

INSERT INTO city
VALUES(
      12823,
      'Oak Grove',
      234
);

INSERT INTO city
VALUES(
      12824,
      'Shelbyville',
      234
);

INSERT INTO city
VALUES(
      12825,
      'Nicholasville',
      234
);

INSERT INTO city
VALUES(
      12826,
      'La Grange',
      234
);

INSERT INTO city
VALUES(
      12827,
      'Leitchfield',
      234
);

INSERT INTO city
VALUES(
      12828,
      'Princeton',
      234
);

INSERT INTO city
VALUES(
      12829,
      'Fort Wright',
      234
);

INSERT INTO city
VALUES(
      12830,
      'Mayfield',
      234
);

INSERT INTO city
VALUES(
      12831,
      'Elsmere',
      234
);

INSERT INTO city
VALUES(
      12832,
      'Georgetown',
      234
);

INSERT INTO city
VALUES(
      12833,
      'Ashland',
      234
);

INSERT INTO city
VALUES(
      12834,
      'Hillview',
      234
);

INSERT INTO city
VALUES(
      12835,
      'Madisonville',
      234
);

INSERT INTO city
VALUES(
      12836,
      'Mount Sterling',
      234
);

INSERT INTO city
VALUES(
      12837,
      'Williamsburg',
      234
);

INSERT INTO city
VALUES(
      12838,
      'Bellevue',
      234
);

INSERT INTO city
VALUES(
      12839,
      'Villa Hills',
      234
);

INSERT INTO city
VALUES(
      12840,
      'Alexandria',
      234
);

INSERT INTO city
VALUES(
      12841,
      'Lawrenceburg',
      234
);

INSERT INTO city
VALUES(
      12842,
      'London',
      234
);

INSERT INTO city
VALUES(
      12843,
      'Independence',
      234
);

INSERT INTO city
VALUES(
      12844,
      'Bardstown',
      234
);

INSERT INTO city
VALUES(
      12845,
      'Mount Washington',
      234
);

INSERT INTO city
VALUES(
      12846,
      'Pikeville',
      234
);

INSERT INTO city
VALUES(
      12847,
      'Elizabethtown',
      234
);

INSERT INTO city
VALUES(
      12848,
      'Hazard',
      234
);

INSERT INTO city
VALUES(
      12849,
      'Cynthiana',
      234
);

INSERT INTO city
VALUES(
      12850,
      'Shively',
      234
);

INSERT INTO city
VALUES(
      12851,
      'Dayton',
      234
);

INSERT INTO city
VALUES(
      12852,
      'Russellville',
      234
);

INSERT INTO city
VALUES(
      12853,
      'Harlan',
      234
);

INSERT INTO city
VALUES(
      12854,
      'Franklin',
      234
);

INSERT INTO city
VALUES(
      12855,
      'Murray',
      234
);

INSERT INTO city
VALUES(
      12856,
      'Berea',
      234
);

INSERT INTO city
VALUES(
      12857,
      'Florence',
      234
);

INSERT INTO city
VALUES(
      12858,
      'Saint Matthews',
      234
);

INSERT INTO city
VALUES(
      12859,
      'Central City',
      234
);

INSERT INTO city
VALUES(
      12860,
      'Prestonsburg',
      234
);

INSERT INTO city
VALUES(
      12861,
      'Douglass Hills',
      234
);

INSERT INTO city
VALUES(
      12862,
      'Maysville',
      234
);

INSERT INTO city
VALUES(
      12863,
      'Morganfield',
      234
);

INSERT INTO city
VALUES(
      12864,
      'Saint Helens',
      234
);

INSERT INTO city
VALUES(
      12865,
      'Madras',
      234
);

INSERT INTO city
VALUES(
      12866,
      'Coos Bay',
      234
);

INSERT INTO city
VALUES(
      12867,
      'North Bend',
      234
);

INSERT INTO city
VALUES(
      12868,
      'Happy Valley',
      234
);

INSERT INTO city
VALUES(
      12869,
      'Medford',
      234
);

INSERT INTO city
VALUES(
      12870,
      'Independence',
      234
);

INSERT INTO city
VALUES(
      12871,
      'Forest Grove',
      234
);

INSERT INTO city
VALUES(
      12872,
      'Sandy',
      234
);

INSERT INTO city
VALUES(
      12873,
      'Newberg',
      234
);

INSERT INTO city
VALUES(
      12874,
      'Klamath Falls',
      234
);

INSERT INTO city
VALUES(
      12875,
      'Umatilla',
      234
);

INSERT INTO city
VALUES(
      12876,
      'Pendleton',
      234
);

INSERT INTO city
VALUES(
      12877,
      'Molalla',
      234
);

INSERT INTO city
VALUES(
      12878,
      'Junction City',
      234
);

INSERT INTO city
VALUES(
      12879,
      'Sweet Home',
      234
);

INSERT INTO city
VALUES(
      12880,
      'Prineville',
      234
);

INSERT INTO city
VALUES(
      12881,
      'Lebanon',
      234
);

INSERT INTO city
VALUES(
      12882,
      'McMinnville',
      234
);

INSERT INTO city
VALUES(
      12883,
      'Tualatin',
      234
);

INSERT INTO city
VALUES(
      12884,
      'Silverton',
      234
);

INSERT INTO city
VALUES(
      12885,
      'Damascus',
      234
);

INSERT INTO city
VALUES(
      12886,
      'Sutherlin',
      234
);

INSERT INTO city
VALUES(
      12887,
      'Canby',
      234
);

INSERT INTO city
VALUES(
      12888,
      'Lake Oswego',
      234
);

INSERT INTO city
VALUES(
      12889,
      'Ontario',
      234
);

INSERT INTO city
VALUES(
      12890,
      'Sheridan',
      234
);

INSERT INTO city
VALUES(
      12891,
      'Central Point',
      234
);

INSERT INTO city
VALUES(
      12892,
      'Bend',
      234
);

INSERT INTO city
VALUES(
      12893,
      'Milton-Freewater',
      234
);

INSERT INTO city
VALUES(
      12894,
      'Baker City',
      234
);

INSERT INTO city
VALUES(
      12895,
      'Veneta',
      234
);

INSERT INTO city
VALUES(
      12896,
      'Creswell',
      234
);

INSERT INTO city
VALUES(
      12897,
      'Redmond',
      234
);

INSERT INTO city
VALUES(
      12898,
      'Seaside',
      234
);

INSERT INTO city
VALUES(
      12899,
      'Newport',
      234
);

INSERT INTO city
VALUES(
      12900,
      'Gladstone',
      234
);

INSERT INTO city
VALUES(
      12901,
      'La Grande',
      234
);

INSERT INTO city
VALUES(
      12902,
      'Warrenton',
      234
);

INSERT INTO city
VALUES(
      12903,
      'Grants Pass',
      234
);

INSERT INTO city
VALUES(
      12904,
      'Cottage Grove',
      234
);

INSERT INTO city
VALUES(
      12905,
      'Cornelius',
      234
);

INSERT INTO city
VALUES(
      12906,
      'Sherwood',
      234
);

INSERT INTO city
VALUES(
      12907,
      'Monmouth',
      234
);

INSERT INTO city
VALUES(
      12908,
      'Wilsonville',
      234
);

INSERT INTO city
VALUES(
      12909,
      'Winston',
      234
);

INSERT INTO city
VALUES(
      12910,
      'Salem',
      234
);

INSERT INTO city
VALUES(
      12911,
      'Oregon City',
      234
);

INSERT INTO city
VALUES(
      12912,
      'Tigard',
      234
);

INSERT INTO city
VALUES(
      12913,
      'Troutdale',
      234
);

INSERT INTO city
VALUES(
      12914,
      'Brookings',
      234
);

INSERT INTO city
VALUES(
      12915,
      'Fairview',
      234
);

INSERT INTO city
VALUES(
      12916,
      'Beaverton',
      234
);

INSERT INTO city
VALUES(
      12917,
      'Ashland',
      234
);

INSERT INTO city
VALUES(
      12918,
      'Gresham',
      234
);

INSERT INTO city
VALUES(
      12919,
      'Tillamook',
      234
);

INSERT INTO city
VALUES(
      12920,
      'Portland',
      234
);

INSERT INTO city
VALUES(
      12921,
      'Roseburg',
      234
);

INSERT INTO city
VALUES(
      12922,
      'Scappoose',
      234
);

INSERT INTO city
VALUES(
      12923,
      'Albany',
      234
);

INSERT INTO city
VALUES(
      12924,
      'The Dalles',
      234
);

INSERT INTO city
VALUES(
      12925,
      'Astoria',
      234
);

INSERT INTO city
VALUES(
      12926,
      'Hermiston',
      234
);

INSERT INTO city
VALUES(
      12927,
      'Eugene',
      234
);

INSERT INTO city
VALUES(
      12928,
      'Milwaukie',
      234
);

INSERT INTO city
VALUES(
      12929,
      'Keizer',
      234
);

INSERT INTO city
VALUES(
      12930,
      'West Linn',
      234
);

INSERT INTO city
VALUES(
      12931,
      'Dallas',
      234
);

INSERT INTO city
VALUES(
      12932,
      'Hood River',
      234
);

INSERT INTO city
VALUES(
      12933,
      'Corvallis',
      234
);

INSERT INTO city
VALUES(
      12934,
      'Talent',
      234
);

INSERT INTO city
VALUES(
      12935,
      'Stayton',
      234
);

INSERT INTO city
VALUES(
      12936,
      'Florence',
      234
);

INSERT INTO city
VALUES(
      12937,
      'Hillsboro',
      234
);

INSERT INTO city
VALUES(
      12938,
      'Springfield',
      234
);

INSERT INTO city
VALUES(
      12939,
      'Woodburn',
      234
);

INSERT INTO city
VALUES(
      12940,
      'Lincoln City',
      234
);

INSERT INTO city
VALUES(
      12941,
      'Eagle Point',
      234
);

INSERT INTO city
VALUES(
      12942,
      'Box Elder',
      234
);

INSERT INTO city
VALUES(
      12943,
      'Hartford',
      234
);

INSERT INTO city
VALUES(
      12944,
      'Sioux Falls',
      234
);

INSERT INTO city
VALUES(
      12945,
      'Watertown',
      234
);

INSERT INTO city
VALUES(
      12946,
      'Yankton',
      234
);

INSERT INTO city
VALUES(
      12947,
      'Vermillion',
      234
);

INSERT INTO city
VALUES(
      12948,
      'Huron',
      234
);

INSERT INTO city
VALUES(
      12949,
      'Rapid City',
      234
);

INSERT INTO city
VALUES(
      12950,
      'Spearfish',
      234
);

INSERT INTO city
VALUES(
      12951,
      'Aberdeen',
      234
);

INSERT INTO city
VALUES(
      12952,
      'Brookings',
      234
);

INSERT INTO city
VALUES(
      12953,
      'Mitchell',
      234
);

INSERT INTO city
VALUES(
      12954,
      'Pierre',
      234
);

INSERT INTO city
VALUES(
      12955,
      'Sturgis',
      234
);

INSERT INTO city
VALUES(
      12956,
      'Tea',
      234
);

INSERT INTO city
VALUES(
      12957,
      'Brandon',
      234
);

INSERT INTO city
VALUES(
      12958,
      'Madison',
      234
);

INSERT INTO country
VALUES(
      235,
      'United State'
);

INSERT INTO city
VALUES(
      12959,
      'Belle Fourche',
      235
);


DROP TABLE tracks_records;
DROP TABLE tracks;
DROP TABLE records;
DROP TABLE artists;
DROP TABLE genres;


CREATE TABLE genres
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  bpm INT2
);

CREATE TABLE artists
(
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE records
(
  id SERIAL8 primary key,
  title VARCHAR(255) not null,
  stock INT4,
  buy_price INT4,
  sell_price INT4,
  vinyl_wav BOOLEAN
);

CREATE TABLE tracks
(
  id SERIAL8 primary key,
  track_title VARCHAR(255) not null,
  artist_id INT8 references artists(id) ON DELETE SET NULL,
  genre_id INT8 references genres(id) ON DELETE SET NULL,
  label VARCHAR(255) not null,
  key VARCHAR(2) not null
);

CREATE TABLE tracks_records
(
  id SERIAL8 primary key,
  track_id INT8 references tracks(id) ON DELETE SET NULL,
  record_id INT8 references records(id) ON DELETE SET NULL,
  track_number INT2 not null
);

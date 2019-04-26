DROP TABLE records;
DROP TABLE artists;


CREATE TABLE artists
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
);

CREATE TABLE records
(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255) not null,
  stock INT4,
  artist_id INT8 REFERENCES artists(id)
);

DROP TABLE records;
DROP TABLE artists;


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
  artist_id INT8 references artists(id) ON DELETE CASCADE
);

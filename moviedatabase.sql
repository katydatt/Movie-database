CREATE DATABASE moviedatabase;

\c moviedatabase

CREATE TABLE movies (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(50),
  year VARCHAR(50),
  poster VARCHAR(300),
  actors VARCHAR(1000),
  rating INTEGER,
  plot VARCHAR(800) NOT NULL

);

SELECT * FROM movies;


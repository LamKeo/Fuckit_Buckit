CREATE DATABASE buckit;

\c buckit;

CREATE TABLE accounts (id SERIAL PRIMARY KEY, name VARCHAR(255), user_name VARCHAR(255), user_email VARCHAR(255), password_digest VARCHAR(255));

CREATE TABLE buckits (id SERIAL PRIMARY KEY, buck INTEGER, fk_user_name_id INTEGER REFERENCES accounts(id), fk_user_image_id INTEGER REFERENCES user_images (id));

CREATE TABLE user_images (id SERIAL PRIMARY KEY, fk_user_name_id INTEGER REFERENCES accounts(id), image_link TEXT);

ALTER TABLE accounts ADD COLUMN fk_user_images_id INTEGER REFERENCES user_images(id);
\dt;

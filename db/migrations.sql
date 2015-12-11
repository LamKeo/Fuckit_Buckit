CREATE DATABASE buckit;

\c buckit;

CREATE TABLE accounts (id SERIAL PRIMARY KEY, name VARCHAR(255), user_name VARCHAR(255), user_email VARCHAR(255), password_digest VARCHAR(255), fk_user_image_id INTEGER REFERENCES user_images(id));

CREATE TABLE buckits (id SERIAL PRIMARY KEY, buck INTEGER, fk_user_name_id INTEGER REFERENCES accounts(id), fk_user_image_id INTEGER REFERENCES user_images (id));

CREATE TABLE user_images (id SERIAL PRIMARY KEY, user_name_id INTEGER, image_base64 TEXT);

\dt;

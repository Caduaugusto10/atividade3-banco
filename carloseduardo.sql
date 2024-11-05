CREATE DATABASE hotel;

\c hotel;

CREATE TABLE hospedes (
    id_hospede SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL
);
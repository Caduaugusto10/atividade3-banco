CREATE DATABASE hotel;

\c hotel;

CREATE TABLE hospedes (
    id_hospede SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL
);

CREATE TABLE quartos (
    id_quarto SERIAL PRIMARY KEY,
    numero_quarto INT NOT NULL UNIQUE,
    valor DECIMAL(5,2) NOT NULL
);

CREATE TABLE reservas (
    id_reserva SERIAL PRIMARY KEY,
    data_check_in DATE NOT NULL,
    data_check_out DATE,
    id_hospede INT NOT NULL,
    id_quarto INT NOT NULL,
    CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES reservas(id_reserva),
    CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);

INSERT INTO hospedes (nome, email) VALUES
('Carlos Eduardo', 'carlos7@gmail.com'),
('Caio Gabriel', 'caiogl10@hotmail.com'),
('Luiz Gabriel', 'luiz.gabriel.v27@gmail.com');

SELECT * FROM hospedes;

INSERT INTO quartos (numero_quarto, valor) VALUES
(7, 459.99),
(5, 379.90),
(2, 259.90);

SELECT * FROM quartos;

INSERT INTO reservas (id_hospede, id_quarto, data_check_in, data_check_out) VALUES
(2, 1, '2024-06-30', ''),
(1, 3, '2024-05-12', ''),
(3, 2, '2024-02-17', '');



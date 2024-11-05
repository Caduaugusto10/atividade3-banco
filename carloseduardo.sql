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
    CONSTRAINT fk_hospede FOREIGN KEY (id_hospede) REFERENCES hospedes(id_hospede),
    CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);

INSERT INTO hospedes (nome, email) VALUES
('Carlos Eduardo', 'carlos7@gmail.com'),
('Caio Gabriel', 'caiogl10@hotmail.com'),
('Lucas Zani', 'zani.brawl9@hotmail.com'),
('Kevin Lima', 'kevin.nino7@gmail.com'),
('Luiz Gabriel', 'luiz.gabriel.v27@gmail.com');

SELECT * FROM hospedes;

INSERT INTO quartos (numero_quarto, valor) VALUES
(7, 459.99),
(5, 379.90),
(2, 259.90),
(10, 549.90),
(8, 399.90);

SELECT * FROM quartos;

INSERT INTO reservas (id_hospede, id_quarto, data_check_in, data_check_out) VALUES
(2, 1, '2024-06-30', '2024-07-04'),
(1, 3, '2024-05-12', '2024-05-17'),
(3, 2, '2024-02-17', '2024-02-25');

SELECT * FROM reservas;

SELECT
    r.id_reserva,
    h.nome,
    h.email,
    r.data_check_in,
    r.data_check_out,
    r.id_quarto,
    r.id_hospede,
    q.numero_quarto,
    q.valor AS valor_quarto
FROM
    reservas r 
JOIN
    hospedes h ON r.id_hospede = h.id_hospede
JOIN
    quartos q ON r.id_quarto = q.id_quarto;

SELECT
    r.id_reserva,
    h.nome,
    h.email,
    r.data_check_in,
    r.data_check_out,
    r.id_quarto,
    r.id_hospede,
    q.numero_quarto,
    q.valor AS valor_quarto
FROM
    reservas r 
RIGHT JOIN
    hospedes h ON r.id_hospede = h.id_hospede
LEFT JOIN
    quartos q ON r.id_quarto = q.id_quarto;
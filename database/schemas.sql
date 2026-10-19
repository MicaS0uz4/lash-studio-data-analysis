-- ============================================================================
-- PROJETO: Análise do estúdio de estética feminina
-- ARQUIVO: schema.sql (Estrutura do Banco e Carga Inicial de Dados)
-- ============================================================================

-- 1. Criação e seleção do banco de dados
CREATE DATABASE IF NOT EXISTS projeto_estudio_lash;
USE projeto_estudio_lash;

-- 2. Criação da tabela de clientes
CREATE TABLE IF NOT EXISTS clientes (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

-- 3. Criação da tabela de procedimentos
CREATE TABLE IF NOT EXISTS procedimentos (
    id INT NOT NULL AUTO_INCREMENT,
    nome_procedimento VARCHAR(150) NOT NULL,
    valor DECIMAL(7, 2),
    PRIMARY KEY(id)
);

-- 4. Criação da tabela de registro de atendimentos
CREATE TABLE IF NOT EXISTS registro_atendimento (
    id INT NOT NULL AUTO_INCREMENT,
    data DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_final TIME NOT NULL,
    idcliente INT NOT NULL,
    idprocedimento INT NOT NULL,
    valor_cobrado DECIMAL(7, 2) NOT NULL DEFAULT 0.00,
    desconto DECIMAL(7, 2) NOT NULL DEFAULT 0.00,
    valor_final DECIMAL(7, 2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY(id),
    FOREIGN KEY(idcliente) REFERENCES clientes(id),
    FOREIGN KEY(idprocedimento) REFERENCES procedimentos(id)
);

-- ============================================================================
-- CARGA INICIAL DE DADOS (INSERTS)
-- ============================================================================

-- Inserção dos clientes
INSERT INTO clientes (id, nome)
VALUES
(1, 'Cliente 1'),
(2, 'Cliente 2'),
(3, 'Cliente 3'),
(4, 'Cliente 4'),
(5, 'Cliente 5'),
(6, 'Cliente 6'),
(7, 'Cliente 7'),
(8, 'Cliente 8'),
(9, 'Cliente 9'),
(10, 'Cliente 10'),
(11, 'Cliente 11'),
(12, 'Cliente 12'),
(13, 'Cliente 13'),
(14, 'Cliente 14'),
(15, 'Cliente 15'),
(16, 'Cliente 16'),
(17, 'Cliente 17'),
(18, 'Cliente 18'),
(19, 'Cliente 19'),
(20, 'Cliente 20'),
(21, 'Cliente 21');

-- Inserção dos procedimentos
INSERT INTO procedimentos (id, nome_procedimento, valor)
VALUES
(1, 'Volume Brasileiro', 95.00),
(2, 'Volume Egípicio', 110.00),
(3, 'Volume Inglês', 115.00),
(4, 'Volume Fox', 135.00),
(5, 'Volume 6D', 135.00),
(6, 'Mega Brasileiro', 125.00),
(7, 'Mega Egípicio', 135.00),
(8, 'Mega Inglês', 150.00),
(9, 'Mega 6D', 160.00),
(10, 'Mega Fox', 160.00),
(11, 'Capping Durabilidade de Até 45 Dias', 180.00),
(12, 'Gypsy Braids', 280.00),
(13, 'French Curl', 300.00),
(14, 'Box Braids', 230.00),
(15, 'Boho French', 245.00),
(16, 'Twist Braids', 245.00),
(17, 'Twist Braids com Cachos', 275.00),
(18, 'Goldess Braids', 320.00),
(19, 'Entrelece', 290.00),
(20, 'Desing de Sobrancelha', 20.00),
(21, 'Desing de Sobrancelha c/ Henna', 30.00),
(22, 'Trança Nagô', 25.00),
(23, 'Limpeza Facial Profunda', 65.00),
(24, 'Spa dos Pés', 30.00),
(25, 'Plastica dos Pés', 45.00),
(26, 'Spa dos pés + Plastica dos Pés', 55.00),
(27, 'Remoção de Cílios', 20.00),
(28, 'Crochet Braids', 290.00),
(29, 'Outras Inspirações de Cabelo', NULL),
(30, 'Volume Mega Glow', 160.00);

-- Inserção dos registros de atendimento
INSERT INTO registro_atendimento (id, data, hora_inicio, hora_final, idcliente, idprocedimento, valor_cobrado, desconto, valor_final) VALUES
(1, '2026-08-19', '09:20:00', '11:30:00', 1, 23, 65.00, 0.00, 65.00),
(2, '2026-08-23', '13:30:00', '18:30:00', 2, 19, 290.00, 0.00, 290.00),
(3, '2026-08-25', '09:30:00', '11:00:00', 3, 29, 90.00, 0.00, 90.00),
(4, '2026-08-27', '17:30:00', '18:50:00', 4, 1, 95.00, 0.00, 95.00),
(5, '2026-08-27', '18:50:00', '19:30:00', 4, 21, 30.00, 0.00, 30.00),
(6, '2026-08-28', '17:30:00', '17:50:00', 5, 27, 20.00, 20.00, 0.00),
(7, '2026-08-28', '17:50:00', '19:30:00', 5, 7, 135.00, 0.00, 135.00),
(8, '2026-08-24', '09:30:00', '14:30:00', 6, 12, 280.00, 0.00, 280.00),
(9, '2026-09-04', '16:00:00', '17:00:00', 7, 21, 30.00, 0.00, 30.00),
(10, '2026-09-05', '16:00:00', '17:30:00', 8, 1, 95.00, 10.00, 85.00),
(11, '2026-09-11', '08:00:00', '10:00:00', 9, 7, 135.00, 0.00, 135.00),
(12, '2026-09-11', '10:30:00', '11:30:00', 9, 21, 30.00, 0.00, 30.00),
(13, '2026-09-12', '08:30:00', '11:00:00', 10, 22, 45.00, 0.00, 45.00),
(14, '2026-09-12', '11:00:00', '13:00:00', 10, 23, 65.00, 0.00, 65.00),
(15, '2026-09-13', '08:30:00', '18:00:00', 11, 14, 230.00, 0.00, 230.00),
(16, '2026-09-17', '08:30:00', '17:00:00', 12, 28, 290.00, 0.00, 290.00),
(17, '2026-09-17', '17:00:00', '19:00:00', 12, 1, 95.00, 0.00, 95.00),
(18, '2026-09-19', '08:30:00', '18:00:00', 8, 12, 280.00, 75.00, 185.00),
(19, '2026-09-19', '17:00:00', '19:00:00', 8, 1, 95.00, 20.00, 95.00),
(20, '2026-09-24', '16:30:00', '22:10:00', 13, 12, 290.00, 0.00, 290.00),
(21, '2026-09-07', '08:30:00', '10:00:00', 14, 4, 130.00, 0.00, 130.00),
(22, '2026-09-07', '10:30:00', '20:00:00', 14, 29, 290.00, 0.00, 290.00),
(23, '2026-09-18', '15:00:00', '17:00:00', 2, 30, 160.00, 0.00, 160.00),
(24, '2026-09-18', '17:30:00', '18:18:50', 15, 1, 95.00, 0.00, 160.00),
(25, '2026-09-22', '18:30:00', '20:25:00', 16, 22, 45.00, 0.00, 45.00),
(26, '2026-09-24', '09:30:00', '14:00:00', 17, 19, 280.00, 0.00, 280.00),
(27, '2026-09-25', '17:00:00', '17:50:00', 9, 7, 135.00, 30.00, 105.00),
(28, '2026-09-25', '18:00:00', '20:00:00', 18, 22, 45.00, 0.00, 45.00),
(29, '2026-09-26', '09:00:00', '14:30:00', 19, 19, 290.00, 0.00, 290.00),
(30, '2026-09-27', '09:00:00', '15:15:00', 20, 18, 320.00, 0.00, 320.00),
(31, '2026-09-28', '15:40:00', '17:35:00', 21, 8, 150.00, 0.00, 150.00);

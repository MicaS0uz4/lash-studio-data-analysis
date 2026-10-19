-- ============================================================================
-- PROJETO: Análise de Dados Estúdio de Estética e Feminina
-- ARQUIVO: queries.sql (Consultas Analíticas e Métricas de Negócio)
-- ============================================================================

USE projeto_estudio_lash;

-- ============================================================================
-- 1. CONSULTAS OPERACIONAIS E VISÃO GERAL DE ATENDIMENTOS
-- ============================================================================

-- 1.1. Detalhamento dos atendimentos (Data, Nome da Cliente e Procedimento)
SELECT 
    r.data AS data_atendimento, 
    c.nome AS nome_cliente, 
    p.nome_procedimento
FROM registro_atendimento AS r
INNER JOIN clientes AS c 
    ON r.idcliente = c.id
INNER JOIN procedimentos AS p 
    ON r.idprocedimento = p.id
ORDER BY r.data ASC;

-- 1.2. Detalhamento de horário e duração de cada atendimento (Filtro: Setembro/2026)
SELECT 
    id AS id_atendimento, 
    data, 
    hora_inicio, 
    hora_final, 
    TIMEDIFF(hora_final, hora_inicio) AS duracao_atendimento
FROM registro_atendimento
WHERE DATE_FORMAT(data, '%Y-%m') = '2026-09'
ORDER BY id ASC;


-- ============================================================================
-- 2. MÉTRICAS FINANCEIRAS E FATURAMENTO
-- ============================================================================

-- 2.1. Faturamento Total Comparativo (Agosto vs Setembro/2026)
SELECT
    SUM(CASE WHEN data BETWEEN '2026-08-01' AND '2026-08-31' THEN valor_final ELSE 0 END) AS total_faturamento_ago,
    SUM(CASE WHEN data BETWEEN '2026-09-01' AND '2026-09-30' THEN valor_final ELSE 0 END) AS total_faturamento_set
FROM registro_atendimento;


-- ============================================================================
-- 3. RANKING E POPULARIDADE DE SERVIÇOS
-- ============================================================================

-- 3.1. Top 3 procedimentos mais realizados no estúdio e total de atendimentos
SELECT 
    p.nome_procedimento AS procedimento, 
    COUNT(r.id) AS total_atendimentos
FROM registro_atendimento AS r
INNER JOIN procedimentos AS p 
    ON p.id = r.idprocedimento
GROUP BY p.id, p.nome_procedimento
ORDER BY total_atendimentos DESC
LIMIT 3;


-- ============================================================================
-- 4. MÉTRICAS DE TEMPO E VOLUME MENSAL
-- ============================================================================

-- 4.1. Total de registros/atendimentos realizados por mês
SELECT 
    DATE_FORMAT(data, '%Y-%m') AS ano_mes, 
    COUNT(*) AS total_atendimentos
FROM registro_atendimento
GROUP BY DATE_FORMAT(data, '%Y-%m')
ORDER BY ano_mes ASC;

-- 4.2. Total de horas trabalhadas especificamente no mês de Agosto/2026
SELECT 
    SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(hora_final, hora_inicio)))) AS total_horas_agosto
FROM registro_atendimento
WHERE data BETWEEN '2026-08-01' AND '2026-08-31';

-- 4.3. Total de horas trabalhadas acumuladas por mês
SELECT 
    DATE_FORMAT(data, '%Y-%m') AS ano_mes, 
    SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(hora_final, hora_inicio)))) AS total_horas_trabalhadas
FROM registro_atendimento
GROUP BY DATE_FORMAT(data, '%Y-%m')
ORDER BY ano_mes ASC;

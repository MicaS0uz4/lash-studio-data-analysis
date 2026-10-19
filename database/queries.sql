-- mostra a data do procedimento, quem foi a cliente e qual o nome do procedimento feito ordenado por data de atendimento
select r.data, c.nome, p.nome_procedimento
from registro_atendimento as r
inner join clientes as c
on r.idcliente = c.id
inner join procedimentos as p
on r.idprocedimento = p.id
order by r.data;

-- Soma o total de cada mês
select
	sum(case when data between '2026-08-01' and '2026-08-31' then valor_final else 0 end) as total_mes_ago,
    sum(case when data between '2026-09-01' and '2026-09-30' then valor_final else 0 end) as total_mes_set
from registro_atendimento;

-- Ranking dos 3 procedimentos mais realizados no estudio e quantos clientes fizeram o procedimento
SELECT p.nome_procedimento as procedimentos_realizados, count(p.nome_procedimento) as clientes
FROM registro_atendimento as r JOIN procedimentos as p
ON p.id = r.idprocedimento
GROUP BY r.idprocedimento
ORDER BY clientes DESC
limit 3;

-- Mostra o total de horas trabalhadas no mes de agosto
SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(hora_final, hora_inicio)))) as total_hrs_ago
FROM registro_atendimento
WHERE data between '2026-09-01' and '2026-09-30';

-- Mostra o total de registro em cada mês
SELECT DATE_FORMAT(data, '%Y-%m') AS ano_mes, COUNT(*) AS total
FROM registro_atendimento
GROUP BY DATE_FORMAT(data, '%Y-%m')
ORDER BY ano_mes ASC;

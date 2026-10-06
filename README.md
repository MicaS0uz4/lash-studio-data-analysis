# 💅 Análise Operacional e Financeira — Studio de Estética Feminina

## 📑 Sobre o Projeto
Este projeto consiste na modelagem de um banco de dados relacional e análise de dados operacionais para um estúdio de estética especializado em **alongamento de cílios, design de sobrancelhas (com e sem henna), tranças e mega hair (entrelace, gypsy braids, goddess braids e etc) e limpeza de pele**. 

O objetivo principal é transformar registros brutos de atendimentos em diagnósticos de gestão, mapeando faturamento, volume de atendimentos por categoria de serviço e carga horária real trabalhada.

> **Status do Projeto:** 🟡 *Em Desenvolvimento (Modelagem & Análise de Dados Contínua)*

---

## 🎯 Problemas de Negócio Mapeados
* **Gestão de Tempo & Carga Horária:** Mapeamento exato das horas trabalhadas por mês através da conversão de intervalos de atendimento (superando limitações de exibição de tempo acumulado).
* **Consistência Operacional:** Auditoria e sanitização de dados entre planilhas operacionais e registros relacionais no banco de dados.
* **Precificação, Descontos & Fidelidade:** Mapeamento de regras dinâmicas de manutenção (ex: janelas de 15 a 21 dias para cílios) e políticas de descontos concedidos.

---

## 🛠️ Tecnologias e Ferramentas
* **MySQL:** Modelagem relacional, funções de tempo (`TIMEDIFF`, `SEC_TO_TIME`, `TIME_TO_SEC`), formatação de datas (`DATE_FORMAT`), agregações (`GROUP BY`) e filtros.
* **Excel / Google Sheets:** Carga inicial de dados, auditoria de integridade e validação de formatação de horas (`[hh]:mm`).
* **Git / GitHub:** Controle de versão e documentação de progresso.

---

## 🗄 Estrutura do Banco de Dados
O banco de dados foi estruturado com base em tabelas relacionais para garantir a normalização e a integridade referencial:

* `registro_atendimento`: Armazena a data, horários de início/fim, cliente (anonimizada), procedimento realizado e descontos aplicados.
* `procedimentos`: Tabela dimensão contendo a lista completa de serviços (Cílios, Sobrancelhas, Tranças e Limpeza de Pele) e seus respectivos valores base.

*(Privacidade: Todos os dados sensíveis, como nomes de clientes e contatos, foram devidamente anonimizados para fins de conformidade e portfólio).*

---

## 🔍 Consultas SQL e Insights Desenvolvidos

### 1. Cálculo de Carga Horária Total por Mês
Para contornar limitações de cálculos de tempo em formatos estáticos, utilizei a conversão de intervalos para segundos com agregação dinâmica:

```sql
SELECT 
    DATE_FORMAT(data, '%Y-%m') AS ano_mes,
    COUNT(*) AS total_atendimentos,
    SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(hora_final, hora_inicio)))) AS total_horas_trabalhadas
FROM registro_atendimento
GROUP BY DATE_FORMAT(data, '%Y-%m')
ORDER BY ano_mes ASC;

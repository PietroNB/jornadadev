# Exercício 7 - Desafio Gatilho de CEP

### a) Qual a diferença entre campo, contra-domínio e regra num gatilho?
* **Campo:** É o campo de origem que dispara o gatilho quando seu valor é alterado/validado (ex: `A1_CEP`).
* **Contra-domínio:** É o campo de destino que receberá o valor retornado pela regra (ex: `A1_BAIRRO`).
* **Regra:** É a expressão em ADVPL/User Function executada para calcular/obter o valor retornado (ex: `U_STCEP(M->A1_CEP, "BAIRRO")`).

---

### b) Por que a regra usa M->A1_CEP e não SA1->A1_CEP?
* `M->A1_CEP` refere-se à variável de memória em tempo de edição (o valor recém-digitado no formulário, antes da gravação).
* `SA1->A1_CEP` referencia o campo físico já salvo no banco de dados. Usá-lo traria o valor antigo do registro (ou um valor vazio em inclusões).

---

### c) Os CEPs estão dentro do fonte. Cite dois problemas disso em produção e como você resolveria?
1. **Manutenção complexa e engessada:** Qualquer mudança, adição ou correção de CEP exige alterar o fonte e recompilar a RPO no ambiente.
2. **Incompletude / Falta de atualização:** Um vetor estático no código limita a busca a poucas faixas de CEP e não acompanha novos logradouros.
* **Solução:**
  * **Opção 1 (Interna):** Consultar os CEPs em uma tabela do dicionário (como a `CC2` / `SYA` ou uma tabela customizada `ZCEP`).
  * **Opção 2 (Externa/Recomendada):** Fazer a requisição a uma API externa de busca de CEP (ex: ViaCEP) utilizando a classe `FWRest` ou serviços em nuvem da TOTVS.

---

### d) Se pedissem para preencher também o código do município (A1_COD_MUN), o que você faria?
Criaria uma nova linha de gatilho no **SX7** para o campo `A1_CEP` com:
* **Sequência:** `004`
* **Contra-domínio:** `A1_COD_MUN`
* **Regra:** `U_STCEP(M->A1_CEP, "CODMUN")` (ajustando a função `U_STCEP` para tratar o parâmetro `"CODMUN"` e retornar o código IBGE).
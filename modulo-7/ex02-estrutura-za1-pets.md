# Exercício 2: A tabela ZA1 (Pets)

### a. Estrutura dos Campos da ZA1
A tabela `ZA1` foi definida com a seguinte estrutura de campos:

| Nome do Campo | Tipo | Tamanho | Descrição / Observação |
--------------------------
| `ZA1_FILIAL` | Caractere | 2 | Código da Filial (Obrigatório em todas as tabelas do Protheus) |
| `ZA1_NOME` | Caractere | 30 | Nome do Pet |
| `ZA1_RACA` | Caractere | 20 | Raça do Pet |
| `ZA1_NASC` | Data | 8 | Data de nascimento do Pet |

### b. Índice recomendado
* **Chave do Índice:** `ZA1_FILIAL + ZA1_NOME` (ou sequencial `ZA1_FILIAL + ZA1_COD` caso existisse um código único).
* **Justificativa:** Como a pesquisa rápida por nome dentro do mesmo contexto de filial é indispensável, o índice age como a ordem alfabética de uma lista telefônica. Ele previne que o banco faça uma busca sequencial completa por toda a tabela e evita duplicidade de dados quando definido como único.

### c. Por que o prefixo é "Z"?
O prefixo **`Z`** é a convenção padrão da TOTVS para diferenciar customizações criadas pelo cliente/desenvolvedor de tabelas nativas de fábrica do Protheus. As tabelas do padrão do ERP começam com outras letras (ex: `S` para `SA1`, `SB1`), enquanto prefixos iniciados em `Z` garantem que atualizações do sistema não sobrescreverão as tabelas criadas pelo usuário.

### d. Por que os campos começam com "ZA1_"?
Trata-se de uma convenção de nomenclatura do Protheus onde o nome de todo campo deve obrigatoriamente iniciar com o prefixo da sua respectiva tabela (`PREFIXO_` + `NOME`). Essa padronização evita ambiguidades de nomes de variáveis na memória em rotinas onde diversas tabelas estão abertas ao mesmo tempo.
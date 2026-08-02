# Exercício 2 - Dicionário da Tabela ZA1 (Pets)

## Configurações no SIGACFG

### 1. Tabela (SX2)
* **Tabela:** ZA1
* **Nome:** Pets
* **Modo:** Compartilhado (C)

---

### 2. Campos (SX3)
| Campo | Tipo | Tamanho | Decimal | Contexto | Propriedade / Relação (X3_RELACAO) |
| :--- | :---: | :---: | :---: | :---: | :--- |
| `ZA1_FILIAL` | C | 2 | 0 | Real | `xFilial("ZA1")` |
| `ZA1_COD` | C | 6 | 0 | Real | Código do Pet |
| `ZA1_CLIENT` | C | 6 | 0 | Real | Código do Cliente (Dono) |
| `ZA1_LOJA` | C | 2 | 0 | Real | Loja do Cliente |
| `ZA1_NOMCLI` | C | 40 | 0 | **Virtual** | `POSICIONE("SA1", 1, xFilial("SA1")+M->ZA1_CLIENT+M->ZA1_LOJA, "A1_NOME")` |
| `ZA1_NOME` | C | 30 | 0 | Real | Nome do Pet |
| `ZA1_RACA` | C | 20 | 0 | Real | Raça do Pet |
| `ZA1_DTNASC` | D | 8 | 0 | Real | Data de Nascimento |

---

### 3. Índices (SIX)
* **Ordem 1:** `ZA1_FILIAL + ZA1_COD`
* **Ordem 2:** `ZA1_FILIAL + ZA1_CLIENT + ZA1_LOJA`
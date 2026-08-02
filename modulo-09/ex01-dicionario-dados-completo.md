# Exercício 1 - Estrutura do Dicionário de Dados (SX2, SX3, SIX, SX5)

## 1. Tabelas (SX2)
- **SZ1**: Cadastro de Contatos (Modo: Compartilhado)
- **SZ2**: Histórico de Interações (Modo: Compartilhado)

## 2. Campos (SX3)

### Tabela SZ1 (Contatos)
- `Z1_FILIAL` (C, 2, Real)
- `Z1_CODIGO` (C, 6, Real) - Código do Contato (PK)
- `Z1_CLIENTE` (C, 6, Real) - Código do Cliente
- `Z1_LOJA` (C, 2, Real) - Loja do Cliente
- `Z1_ASSUNTO` (C, 40, Real) - Assunto Principal
- `Z1_DATA` (D, 8, Real) - Data da Criacao

### Tabela SZ2 (Interações)
- `Z2_FILIAL` (C, 2, Real)
- `Z2_CONTAT` (C, 6, Real) - FK ligando ao Z1_CODIGO
- `Z2_SEQUEN` (C, 3, Real) - Sequencial da Interação
- `Z2_TIPO` (C, 1, Real) - Tipo de contato (Dominio SX5: Z2)
- `Z2_DESCRI` (M, 80, Real) - Descricao da conversa
- `Z2_DATA` (D, 8, Real) - Data do lançamento
- `Z2_HORA` (C, 8, Real) - Hora do lançamento
- `Z2_USUAR` (C, 15, Real) - Usuário que fez a interação
- `Z2_ASSUNT` (C, 40, Virtual) - Relac: `POSICIONE("SZ1", 1, xFilial("SZ1") + M->Z2_CONTAT, "Z1_ASSUNTO")`

## 3. Índices (SIX)
- **SZ1**: Ordem 1 -> `Z1_FILIAL + Z1_CODIGO`
- **SZ2**: Ordem 1 -> `Z2_FILIAL + Z2_CONTAT + Z2_SEQUEN`

## 4. Tabela Genérica (SX5)
- **Tabela Z2**: Tipos de Interação
  - `E`: E-mail
  - `L`: Ligação Telefônica
  - `R`: Reunião Presencial
  - `V`: Videoconferência
  - `W`: WhatsApp
# Exercício 3 - Gatilhos, Campos Virtuais e Validações

## 1. Campos Virtuais na SZ2
- **Z2_ASSUNT**: Configurado no `X3_RELACAO` com a expressão:
  `POSICIONE("SZ1", 1, xFilial("SZ1") + M->Z2_CONTAT, "Z1_ASSUNTO")`

## 2. Gatilhos Automáticos na SZ2 (SX7)
- **Campo de Origem:** `Z2_CONTAT`
  - **Z2_DATA**: Preenche automaticamente com a expressão `dDataBase`
  - **Z2_HORA**: Preenche com `IF(INCLUI, Time(), SZ2->Z2_HORA)`
  - **Z2_USUAR**: Preenche com a variável global `cNomUsr`

## 3. Validação Cruzada (X3_VALID)
- **Campo:** `Z2_CONTAT`
- **Validação:** `ExistCpo("SZ1", xFilial("SZ1") + M->Z2_CONTAT, 1)`
- **Função:** Garante que o usuário não cadastre uma interação para um código de contato inexistente.
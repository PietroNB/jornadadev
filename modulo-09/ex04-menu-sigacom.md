# Exercício 4 - Menu no SIGACOM

Configuração realizada via **SIGACFG** > **Menu do Sistema** > Módulo Compras (`SIGACOM`):

- **Submenu:** Cadastros > Atendimento
  - **Item 1:** Contatos
    - **Função:** `U_STTIP003`
    - **Status:** Ativo
  - **Item 2:** Interações (Listagem Geral)
    - **Função:** `U_STTIP004B`
    - **Status:** Ativo

> **Nota:** A função `U_STTIP004B` é uma cópia da `STTIP004`, porém instanciada sem a variável `cFiltro`, permitindo visualizar a listagem completa de interações de todos os contatos.
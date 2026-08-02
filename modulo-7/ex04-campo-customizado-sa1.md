# Exercício 4: Campo Customizado na SA1

> *Nota: Descrição passo a passo da criação do campo customizado `A1_XAPELID` na SA1.*

### Passo a Passo de Execução:

1. **Acesso ao Dicionário:**
   * Acessar o módulo **SIGACFG** (Configurador).
   * Navegar até `Base de Dados` > `Dicionário` > `Bases de Dados` > `Tabelas do Cadastro`.
   * Pesquisar e selecionar a tabela `SA1` (Clientes).

2. **Criação do Campo Customizado (`A1_XAPELID`):**
   * Ir até a aba de Campos e clicar em **Incluir**.
   * **Nome do Campo:** `A1_XAPELID` (Utilizando o prefixo `A1_` da tabela mais o `X` de customização/apelido).
   * **Tipo:** Caractere
   * **Tamanho:** 20
   * **Título:** Apelido do Cliente
   * **Usado:** Sim / Exibido em tela.

3. **Aplicação na Tela:**
   * Atualizar a estrutura da tabela através do assistente do Configurador.
   * Salvar a alteração do dicionário.

4. **Validação no SmartClient:**
   * Abrir o SmartClient e acessar o módulo de **Faturamento (SIGAFAT)**.
   * Entrar na rotina de Cadastro de Clientes (`MATA030`).
   * Abrir a visualização/inclusão de um cliente e observar o campo **"Apelido do Cliente"** aparecendo dinamicamente na tela sem nenhuma linha de código ADVPL escrita.
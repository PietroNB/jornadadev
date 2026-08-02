# Exercício 1: Conceitos Fundamentais

### a. Qual é a função do AppServer?
O AppServer (Server) atua como o processador e servidor de aplicação do ecossistema Protheus. Ele é responsável por processar todas as regras de negócio, executar os códigos ADVPL e fazer a comunicação direta e gerenciada com o banco de dados.

### b. O que é o RPO?
O RPO (Repository of Objects) é o repositório onde todo o código compilado do sistema fica armazenado (programas padrão da TOTVS e customizações/User Functions). O AppServer lê este arquivo para executar as rotinas e telas do Protheus.

### c. Para que serve o Configurador (SIGACFG)?
O Configurador é o módulo administrativo do Protheus responsável por gerenciar regras do sistema sem necessidade de alterar código ADVPL. Através dele, é possível manipular o Dicionário de Dados (tabelas, campos, índices), criar permissões de usuários/grupos e ajustar parâmetros globais da aplicação.

### d. Qual a diferença entre campo Real e campo Virtual no SX3?
* **Campo Real:** Possui representação física na estrutura e no arquivo da tabela no banco de dados (guardando a informação diretamente no disco/DBF).
* **Campo Virtual:** Não existe fisicamente na tabela do banco de dados. Seu valor é calculado ou carregado em tempo de execução via código/fórmula apenas para exibição em tela ou cálculos em memória.
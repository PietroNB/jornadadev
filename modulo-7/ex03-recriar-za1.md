# Exercício 3: Recriando a ZA1 no Configurador

> *Nota: Descrição passo a passo detalhada da criação da tabela no ambiente.*

### Passo a Passo de Execução:

1. **Acesso ao Configurador:**
   * Abrir o SmartClient e acessar o módulo **SIGACFG** (Configurador).
   * Navegar em: `Base de Dados` > `Dicionário` > `Bases de Dados`.

2. **Cadastro no SX2 (Mapeamento de Tabelas):**
   * Incluir uma nova tabela com o código **ZA1**.
   * Definir o nome como "Cadastro de Pets".
   * Configurar o caminho do arquivo físico (seguindo a convenção de pastas/padrão da `SA1`).
   * Definir o compartilhamento (Exclusivo/Compartilhado).

3. **Cadastro no SX3 (Campos no Dicionário):**
   * Criar os campos com seus devidos atributos:
     * `ZA1_FILIAL` (Caractere, Tamanho 2, Obrigatoriedade: Sim)
     * `ZA1_NOME` (Caractere, Tamanho 30, Título "Nome do Pet", Título Browse formatado para respeitar o limite de caracteres)
     * `ZA1_RACA` (Caractere, Tamanho 20, Título "Raça")
     * `ZA1_NASC` (Data, Tamanho 8, Título "Data Nasc.")

4. **Inclusão do Índice:**
   * Na aba de Índices, incluir a chave `ZA1_FILIAL + ZA1_NOME` para garantir a busca performática.

5. **Atualização da Estrutura e Reconhecimento:**
   * Confirmar as alterações no Configurador para aplicar a atualização da estrutura física.
   * Executar a rotina de fórmulas/atualização para forçar o framework do Protheus a reconhecer o novo Dicionário e tabela.

6. **Validação no MPSDU:**
   * Abrir a ferramenta **MPSDU** em ambiente de desenvolvimento.
   * Localizar e abrir o arquivo da tabela `ZA1` para inspecionar e confirmar que os campos e índices foram gerados corretamente na estrutura do banco.
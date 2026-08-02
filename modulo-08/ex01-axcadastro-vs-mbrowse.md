# Exercício 1 - AxCadastro vs. mBrowse

### a) Quando usar AxCadastro e quando usar mBrowse? Dê um exemplo de cada.
* **AxCadastro:** Indicado para cadastros simples, protótipos rápidos ou telas de manutenção direta de uma tabela, onde não há necessidade de personalizações avançadas no browse.
  * *Exemplo:* Cadastro rápido de Tipos de Pets ou Tabela de Unidades de Medida.
* **mBrowse:** Indicado para telas de produção, sistemas legados com regras complexas, onde se exige customização visual e comportamental do browse.
  * *Exemplo:* Tela de Gestão/Cadastro de Pets com destaque visual por idade (legendas coloridas) e filtros avançados por cliente ou período.

---

### b) Cite três coisas que o mBrowse faz e o AxCadastro não faz.
1. Suporta **legendas coloridas** (`aColors`) para destacar linhas dinamicamente segundo regras condicionais.
2. Permite a aplicação de **filtros dinâmicos e pré-definidos** (`cFiltro`) nas consultas.
3. Permite maior customização do cabeçalho, colunas e inclusão de botões customizados (tipo 6 no `aRotina`).

---

### c) Na configuração de legendas (aColors), por que a regra ".T." deve ficar por último?
As condições no array `aColors` são avaliadas sequencialmente de cima para baixo. A expressão `".T."` é sempre verdadeira e serve como um "caso padrão" (*fallback*). Se ela for colocada no início ou no meio, interromperá a avaliação das demais regras abaixo dela, pintando todos os registros restantes com a sua cor associada.

---

### d) Qual a diferença entre um campo Virtual (X3_RELACAO) e um gatilho (SX7) para preencher o nome do cliente?
* **Campo Virtual (`X3_RELACAO`):** Não armazena valor no banco de dados. O valor é calculado dinamicamente via consulta (ex: `POSICIONE()`) toda vez que a tela/registro é carregado ou exibido.
* **Gatilho (`SX7`):** É disparado por um evento de alteração/saída de campo (ex: `Valid`). Ele calcula um valor e o atribui a um campo real no formulário em edição, gravando o dado fisicamente na tabela destino ao salvar o formulário.
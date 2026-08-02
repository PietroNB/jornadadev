# Exercício 5: A1_FILIAL e xFilial()

### a. Por que existe o campo A1_FILIAL e qual a sua importância em todas as tabelas?
O Protheus é um sistema nativamente multi-empresa e multi-filial. O campo de filial (`A1_FILIAL`, `ZA1_FILIAL`, etc.) existe em todas as tabelas para garantir a **segregação multi-empresa e o controle de acesso** aos dados por unidade de negócio. Ele define a qual filial pertence determinado registro, permitindo que o sistema filtre adequadamente os dados e impeça que uma filial acesse/altere os registros de outra.

### b. O que a função `xFilial()` faz e qual o risco de não usá-la?
A função `xFilial("NOME_DA_TABELA")` retorna o código correto da filial vigente para a tabela informada, considerando se essa tabela está configurada no Dicionário como **Exclusiva** (retorna o código da filial do usuário ativo) ou **Compartilhada** (retorna um valor em branco `""`).

**Risco de escrever a filial "na mão" (hardcoded):**
Se o desenvolvedor preencher a filial manualmente (ex: usando fixo `"01"` ou a variável global `cFilial`), o código quebrará a regra de compartilhamento definida no Dicionário. 
* Se a tabela for compartilhada e for gravada com a filial fixa `"01"`, outras filiais não conseguirão enxergar o registro.
* Pode gerar corrupção de integridade nos índices e falhas sérias em consultas e relatórios do ERP em ambientes multi-filiais.
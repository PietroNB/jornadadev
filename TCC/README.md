# TCC — Projeto Final da Jornada DEV START

Sistema de Controle de Não Conformidades de Fornecedores (ISO 9001) desenvolvido sobre a plataforma TOTVS Protheus.

---

## 👥 Integrantes
- **Pietro Novais** - Desenvolvedor

---

## 🚀 O que foi desenvolvido (Núcleo Mínimo)

1. **Estrutura de Banco de Dados (ZZ1):** Criação da tabela de Controle de Não Conformidades no dicionário de dados (campos e índices mapeados na pasta de dicionários).
2. **Interface e Manutenção (STTZZ1.PRW):** Tela de manutenção de registros desenvolvida em MVC utilizando a estrutura oficial `FWMBrowse` (mBrowse).
3. **Validações de Regra de Negócio:**
   - Amarração com o cadastro de fornecedores: valida se o fornecedor informado existe na tabela `SA2`.
   - Limite de Tolerância: restrição que impede valores menores que 0 ou maiores que 100.
4. **Segurança na Gravação:** Implementação de bloco de tratamento de exceções `BEGIN SEQUENCE` para proteção do banco de dados com retorno de mensagem amigável em caso de falha crítica.

---

## 📂 Organização do Repositório

- `/fontes`: Contém o código-fonte AdvPL da rotina principal (`STTZZ1.PRW`).
- `/Dados-e-Dicionario`: Arquivos CSV que representam os metadados e o dicionário de dados da tabela ZZ1.
- `/evidencias`: Capturas de tela comprovando a estrutura do projeto desenvolvida no VS Code.

---

## 🛠️ Como Executar a Rotina

1. Compile o arquivo `STTZZ1.PRW` localizado na pasta `/fontes` em seu ambiente Protheus.
2. Certifique-se de que a tabela customizada `ZZ1` esteja devidamente criada no seu dicionário.
3. No SmartClient, chame a rotina através da User Function:
   ```advpl
   U_STTZZ1()
#include "protheus.ch"

/*/{Protheus.doc} STTIP003SALVAR
Funcao de gravacao segura para o cadastro de Contatos (SZ1).
Realiza validacoes, transacao de banco de dados e tratamento de erros.
@type function
@version 1.0
/*/
USER FUNCTION STTIP003SALVAR()
    LOCAL lOk    := .T.
    LOCAL oErro  := NIL
    LOCAL lInclui := INCLUI // Variavel de contexto da memoria da tela

    // 1. Validacao previa dos campos obrigatorios
    IF Empty(M->Z1_CLIENTE) .OR. Empty(M->Z1_ASSUNTO)
        MsgAlert("Os campos Cliente e Assunto sao obrigatorios!", "Atencao")
        RETURN .F.
    ENDIF

    // 2. Inicio da Transacao de Banco de Dados (Tudo ou Nada)
    BeginTran()

    BEGIN SEQUENCE
        // 3. Bloqueio de registro (RecLock)
        IF RecLock("SZ1", lInclui)
            IF lInclui
                SZ1->Z1_FILIAL := xFilial("SZ1")
                SZ1->Z1_CODIGO := M->Z1_CODIGO
            ENDIF

            SZ1->Z1_CLIENTE := M->Z1_CLIENTE
            SZ1->Z1_LOJA    := M->Z1_LOJA
            SZ1->Z1_ASSUNTO := M->Z1_ASSUNTO
            SZ1->Z1_DATA    := dDataBase

            // Libera o registro apos gravacao
            MsUnLock()
        ELSE
            lOk := .F.
            Break() // Forca o salto para o bloco RECOVER
        ENDIF

    RECOVER WITH oErro
        lOk := .F.
        // Se houver erro inesperado ou quebra, desfaz todas as alteracoes no banco
        RollBackTran()

        IF oErro != NIL
            MsgStop("Ocorreu um erro ao salvar o registro:" + CRLF + ;
                    oErro:Description, "Erro de Gravação")
            
            // Grava o log detalhado no servidor
            U_GRAVARLOG("STTIP003SALVAR", oErro)
        ELSE
            MsgStop("Nao foi possivel travar o registro para gravacao.", "Erro de Lock")
        ENDIF

    END SEQUENCE

    // 4. Se correu tudo bem, confirma a transacao no banco de dados
    IF lOk
        CommitTran()
        MsgInfo("Contato salvo com sucesso!", "Sucesso")
    ENDIF

RETURN lOk


/*/{Protheus.doc} GRAVARLOG
Funcao utilitaria para gravacao de log em caso de excecoes (Colocar na STTIPLIB.prw)
@type function
/*/
USER FUNCTION GRAVARLOG(cFuncao, oErro)
    LOCAL cLogFile := "\logs_sistema\erros_mod09.log"
    LOCAL cConteudo := ""

    cConteudo += "[" + DToC(Date()) + " " + Time() + "] "
    cConteudo += "Funcao: " + cFuncao + " | "
    cConteudo += "Erro: " + oErro:Description + " | "
    cConteudo += "Operacao: " + oErro:Operation + " | "
    cConteudo += "Linha: " + cValToChar(oErro:ProcLine) + CRLF

    // Grava a mensagem no arquivo de log do Protheus
    MemoWrite(cLogFile, MemoRead(cLogFile) + cConteudo)

RETURN NIL
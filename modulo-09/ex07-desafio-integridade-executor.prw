#include "protheus.ch"

/*/{Protheus.doc} VALEXCSZ1
Desafio 7a: Impede a exclusao de um Contato se houver interacoes vinculadas.
Configurar no X3_VLDUSER ou na regra de exclusao da SZ1.
/*/
USER FUNCTION VALEXCSZ1()
    LOCAL lPodeExcluir := .T.
    LOCAL cCodigoContato := SZ1->Z1_CODIGO

    // Verifica se a chave existe na SZ2
    IF ExistCpo("SZ2", xFilial("SZ2") + cCodigoContato, 1)
        MsgAlert("Não é possível excluir! O contato " + AllTrim(cCodigoContato) + ;
                 " possui interações vinculadas.", "Integridade Referencial")
        lPodeExcluir := .F.
    ENDIF

RETURN lPodeExcluir


/*/{Protheus.doc} EXECUTARSEGURO
Desafio 7b: Executor seguro generico usando BEGIN SEQUENCE
@param bBloco, Block, Bloco de codigo a ser executado
@param cMsgErro, Character, Mensagem amigavel ao usuario
@type function
/*/
USER FUNCTION EXECUTARSEGURO(bBloco, cMsgErro)
    LOCAL lSucesso := .T.
    LOCAL oErro    := NIL

    IF ValType(bBloco) != "B"
        RETURN .F.
    ENDIF

    BEGIN SEQUENCE
        // Executa o bloco passado por parametro
        Eval(bBloco)

    RECOVER WITH oErro
        lSucesso := .F.
        
        // Exibe a mensagem personalizada
        MsgStop(cMsgErro + CRLF + "Detalhes: " + oErro:Description, "Falha na Operacao")
        
        // Loga o erro
        U_GRAVARLOG("EXECUTARSEGURO", oErro)
    END SEQUENCE

RETURN lSucesso
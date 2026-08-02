#include "protheus.ch"

/*/{Protheus.doc} STTIP001
    CRUD simples da tabela ZA1 (Pets) utilizando AxCadastro.
    @type  Function
    @author Dev
    @since 2026
/*/
USER FUNCTION STTIP001()
    PRIVATE cCadastro := "Pets"

    // Seleciona a área de trabalho da tabela ZA1 e define a ordem principal do índice
    dbSelectArea("ZA1")
    dbSetOrder(1)

    // Executa a função padrão de cadastro (CRUD rápido)
    AxCadastro("ZA1", cCadastro, "1", .T.,,,, .F.)

RETURN NIL
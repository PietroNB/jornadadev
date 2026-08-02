#include "protheus.ch"

/*/{Protheus.doc} STTIP004
Rotina de Interacoes (SZ2) filtrada pelo contato selecionado
/*/
USER FUNCTION STTIP004()
    LOCAL cCodigo := SZ1->Z1_CODIGO
    LOCAL cFiltro := ""
    PRIVATE aRotina := {}
    PRIVATE cCadastro := "Interações do Contato: " + AllTrim(cCodigo)

    aAdd(aRotina, {"Visualizar", "AxVisual", 0, 2})
    aAdd(aRotina, {"Incluir"   , "AxInclui", 0, 3})
    aAdd(aRotina, {"Alterar"   , "AxAltera", 0, 4})

    // Aplica o filtro do contato atual da SZ1
    cFiltro := "Z2_CONTAT == '" + cCodigo + "'"

    dbSelectArea("SZ2")
    dbSetOrder(1)
    dbSeek(xFilial("SZ2") + cCodigo)

    mBrowse(1, 1, 22, 75, "SZ2",,,,,,,,,, .F., cFiltro)

RETURN NIL
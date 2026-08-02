#include "protheus.ch"

/*/{Protheus.doc} STTIP003
Rotina de Contatos (SZ1) com mBrowse, legendas e botao Interacoes
/*/
USER FUNCTION STTIP003()
    LOCAL aColors := {}
    PRIVATE aRotina := {}
    PRIVATE cCadastro := "Cadastro de Contatos"

    // Opcoes do menu
    aAdd(aRotina, {"Pesquisar"  , "AxPesqui"   , 0, 1})
    aAdd(aRotina, {"Visualizar" , "AxVisual"   , 0, 2})
    aAdd(aRotina, {"Incluir"    , "AxInclui"   , 0, 3})
    aAdd(aRotina, {"Alterar"    , "AxAltera"   , 0, 4})
    aAdd(aRotina, {"Excluir"    , "AxDeleta"   , 0, 5})
    aAdd(aRotina, {"Interações" , "U_STTIP004" , 0, 6}) // Botao customizado para chamar SZ2

    // Regra de cores
    aColors := { ;
        {"SZ1->Z1_DATA >= dDataBase", "BR_GREEN"}, ;
        {".T."                     , "BR_RED"}    ;
    }

    dbSelectArea("SZ1")
    dbSetOrder(1)
    mBrowse(1, 1, 22, 75, "SZ1",,,,,, aColors)

RETURN NIL
#include "protheus.ch"

/*/{Protheus.doc} STTIP002
    CRUD da tabela ZA1 (Pets) utilizando mBrowse em vez de AxCadastro.
    @type  Function
    @author Dev
    @since 2026
/*/
USER FUNCTION STTIP002()
    LOCAL cFiltro   := ""
    PRIVATE cCadastro := "Pets"

    // Definição das opções do menu (aRotina)
    PRIVATE aRotina := { ;
        {"Pesquisar" , "AxPesqui" , 0, 1}, ;
        {"Visualizar", "AxVisual" , 0, 2}, ;
        {"Incluir"   , "AxInclui" , 0, 3}, ;
        {"Alterar"   , "AxAltera" , 0, 4}, ;
        {"Excluir"   , "AxDeleta" , 0, 5}  ;
    }

    // Seleção da área de trabalho e ordem de índice
    dbSelectArea("ZA1")
    dbSetOrder(1)

    // Chamada do mBrowse
    mBrowse(1, 1, 22, 75, "ZA1",,,,,,,,,,,,,,, cFiltro)

RETURN NIL
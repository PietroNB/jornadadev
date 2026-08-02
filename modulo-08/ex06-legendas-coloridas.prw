#include "protheus.ch"

/*/{Protheus.doc} STTIP002
    CRUD da tabela ZA1 utilizando mBrowse com legendas coloridas por regra (aColors).
    @type  Function
    @author Dev
    @since 2026
/*/
USER FUNCTION STTIP002()
    LOCAL cFiltro   := ""
    PRIVATE cCadastro := "Pets"

    // Array de legendas avaliadas de cima para baixo (regra ".T." sempre por último)
    LOCAL aColors   := { ;
        {"ZA1->ZA1_DTNASC < dDataBase - 3650", "BR_RED"}, ;    // Mais de 10 anos (idosos)
        {"ZA1->ZA1_DTNASC == dDataBase"     , "BR_YELLOW"}, ; // Cadastrados/Nascidos hoje
        {".T."                              , "BR_GREEN"}  ;  // Demais (padrão)
    }

    PRIVATE aRotina := { ;
        {"Pesquisar" , "AxPesqui" , 0, 1}, ;
        {"Visualizar", "AxVisual" , 0, 2}, ;
        {"Incluir"   , "AxInclui" , 0, 3}, ;
        {"Alterar"   , "AxAltera" , 0, 4}, ;
        {"Excluir"   , "AxDeleta" , 0, 5}  ;
    }

    dbSelectArea("ZA1")
    dbSetOrder(1)

    // Passagem do array aColors na 6ª posição do mBrowse
    mBrowse(1, 1, 22, 75, "ZA1", aColors,,,,,,,,,,,, cFiltro)

RETURN NIL
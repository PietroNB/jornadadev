#include "protheus.ch"

/*/{Protheus.doc} STTIP002
    mBrowse da tabela ZA1 com filtro inicial pelo mês atual e botões customizados na aRotina.
    @type  Function
    @author Dev
    @since 2026
/*/
USER FUNCTION STTIP002()
    // Filtra apenas registros cujo mês e ano da data de nascimento coincidem com a data atual
    LOCAL cFiltro   := "Month(ZA1->ZA1_DTNASC) == Month(dDataBase) .AND. Year(ZA1->ZA1_DTNASC) == Year(dDataBase)"
    PRIVATE cCadastro := "Pets"

    // Inclusão de botões customizados do tipo 6
    PRIVATE aRotina := { ;
        {"Pesquisar"    , "AxPesqui"   , 0, 1}, ;
        {"Visualizar"   , "AxVisual"   , 0, 2}, ;
        {"Incluir"      , "AxInclui"   , 0, 3}, ;
        {"Alterar"      , "AxAltera"   , 0, 4}, ;
        {"Excluir"      , "AxDeleta"   , 0, 5}, ;
        {"Remover Filtro", "U_STLIMPFIL", 0, 6}, ;
        {"Histórico"    , "U_STHISTPET", 0, 6}  ;
    }

    dbSelectArea("ZA1")
    dbSetOrder(1)

    mBrowse(1, 1, 22, 75, "ZA1",,,,,,,,,,,,,,, cFiltro)

RETURN NIL

/*/{Protheus.doc} STLIMPFIL
    Função customizada para reabrir o mBrowse sem aplicação de filtros.
/*/
USER FUNCTION STLIMPFIL()
    dbSelectArea("ZA1")
    dbSetOrder(1)
    mBrowse(1, 1, 22, 75, "ZA1",,,,,,,,,,,,,,, "")
RETURN NIL

/*/{Protheus.doc} STHISTPET
    Função customizada para exibir um resumo/histórico do pet posicionado na grid.
/*/
USER FUNCTION STHISTPET()
    LOCAL cMsg := "Código: " + ZA1->ZA1_COD + CRLF + ;
                  "Nome: "   + ZA1->ZA1_NOME + CRLF + ;
                  "Raça: "   + ZA1->ZA1_RACA

    MsgInfo(cMsg, "Histórico do Pet")
RETURN NIL
#include "protheus.ch"

/*/{Protheus.doc} NomeCliente
Retorna o nome do cliente buscando no cadastro SA1
/*/
USER FUNCTION NomeCliente(cCodigo, cLoja)
RETURN AllTrim(POSICIONE("SA1", 1, xFilial("SA1") + cCodigo + cLoja, "A1_NOME"))

/*/{Protheus.doc} ProxCodigoSZ1
Gera o proximo codigo da tabela SZ1
/*/
USER FUNCTION ProxCodigoSZ1()
RETURN GetSXENum("SZ1", "Z1_CODIGO")

/*/{Protheus.doc} ProxSequenSZ2
Gera o proximo sequencial da tabela SZ2 para o contato informado
/*/
USER FUNCTION ProxSequenSZ2(cContato)
    LOCAL cQuery := ""
    LOCAL cAlias := GetNextAlias()
    LOCAL cProx  := "001"

    cQuery := "SELECT MAX(Z2_SEQUEN) AS MAXSEQ FROM " + RetSqlName("SZ2") + " "
    cQuery += "WHERE Z2_FILIAL = '" + xFilial("SZ2") + "' AND Z2_CONTAT = '" + cContato + "' AND D_E_L_E_T_ = ' '"
    
    dbUseArea(.T., "TOPCONN", TcGenQry(,,cQuery), cAlias, .F., .T.)

    IF !(cAlias)->(Eof()) .AND. !Empty((cAlias)->MAXSEQ)
        cProx := Soma1((cAlias)->MAXSEQ)
    ENDIF
    (cAlias)->(dbCloseArea())

RETURN cProx

/*/{Protheus.doc} DescTipoInteracao
Retorna a descricao do tipo de interacao
/*/
USER FUNCTION DescTipoInteracao(cTipo)
    LOCAL cDesc := ""
    DO CASE
        CASE cTipo == "E"; cDesc := "E-mail"
        CASE cTipo == "L"; cDesc := "Ligação"
        CASE cTipo == "R"; cDesc := "Reunião"
        CASE cTipo == "V"; cDesc := "Vídeo"
        CASE cTipo == "W"; cDesc := "WhatsApp"
        OTHERWISE;        cDesc := "Outro"
    ENDCASE
RETURN cDesc
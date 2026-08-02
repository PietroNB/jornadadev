#include "protheus.ch"

/*/{Protheus.doc} VALCLI001
    Validação personalizada para verificar se o Cliente/Loja informados existem na SA1.
    Pode ser chamada diretamente no X3_VALID do campo ZA1_CLIENT no SX3.
    @type  Function
    @author Dev
    @since 2026
    @return Logical, .T. se o cliente existir, .F. se não existir
/*/
USER FUNCTION VALCLI001()
    // Valida se a combinação Filial + Cliente + Loja existe na tabela SA1 (Índice 1)
    IF !ExistCpo("SA1", xFilial("SA1") + M->ZA1_CLIENT + M->ZA1_LOJA, 1)
        MsgAlert("Cliente não cadastrado na SA1!", "Atenção")
        RETURN .F.
    ENDIF

RETURN .T.
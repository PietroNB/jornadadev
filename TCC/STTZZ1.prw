#Include 'Protheus.ch'

/*/{Protheus.doc} STTZZ1
Função principal para cadastro da Tabela TCC (ZZ1)
@author Pietro Novais
@since   07/08/2026
@version 1.0
/*/
User Function STTZZ1()
    Local cAlias := "ZZ1"
    Local cTitle := "Cadastro da Tabela TCC"
    
    // AxCadastro monta a tela de CRUD automaticamente
    AxCadastro(cAlias, cTitle)
    
Return Nil
#Include 'Protheus.ch'
#Include 'FWMVCDef.ch'

/*/{Protheus.doc} STTZZ1
Rotina de Manutenção da Tabela ZZ1 (Controle de Não Conformidades)
@author  Pietro Novais
@since   07/08/2026
@version 1.0
/*/
User Function STTZZ1()
    Local oBrowse
    
    // Instancia o MBrowse exigido no enunciado para exibir a tabela
    oBrowse := FWMBrowse():New()
    oBrowse:SetAlias("ZZ1")
    oBrowse:SetDescription("Controle de Não Conformidades de Fornecedores")
    oBrowse:Activate()
    
Return Nil

/*/{Protheus.doc} ModelDef
Definição do Modelo de Dados da rotina com as regras de negócio
/*/
Static Function ModelDef()
    Local oModel
    Local oStruct := FWFormStruct(1, "ZZ1")
    
    oModel := MPFormModel():New("STTZZ1M")
    oModel:AddFields("ZZ1MASTER", , oStruct)
    oModel:SetDescription("Modelo de Dados - Não Conformidades")
    
    // Associa a validação total do modelo ao salvar (onde usaremos o BEGIN SEQUENCE)
    oModel:SetVldCommit({|| ValidCommit(oModel) })
    
Return oModel

/*/{Protheus.doc} ViewDef
Definição da Interface Visual da rotina
/*/
Static Function ViewDef()
    Local oView
    Local oModel := FWLoadModel("STTZZ1")
    Local oStruct := FWFormStruct(2, "ZZ1")
    
    oView := FWFormView():New()
    oView:SetModel(oModel)
    oView:AddField("VIEW_ZZ1", oStruct, "ZZ1MASTER")
    oView:CreateHorizontalBox("TELA_TOTAL", 100)
    oView:SetOwnerView("VIEW_ZZ1", "TELA_TOTAL")
    
Return oView

/*/{Protheus.doc} ValidCommit
Função de validação e gravação protegida por BEGIN SEQUENCE
/*/
Static Function ValidCommit(oModel)
    Local lRet := .T.
    Local oModelZZ1 := oModel:GetModel("ZZ1MASTER")
    Local cFornec := oModelZZ1:GetValue("ZZ1_FORNEC")
    Local nTolera := oModelZZ1:GetValue("ZZ1_TOLERA")
    
    // 1) Validação: Fornecedor existe na SA2?
    DBSelectArea("SA2")
    SA2->(DBSetOrder(1)) 
    If !SA2->(DBSeek(xFilial("SA2") + cFornec))
        Help(, , "VALIDACAO", , "O Fornecedor informado não existe no cadastro (SA2).", 1, 0, , , , , , {"Verifique o código digitado."})
        Return .F.
    EndIf
    
    // 2) Validação: Tolerância está entre 0 e 100?
    If nTolera < 0 .Or. nTolera > 100
        Help(, , "VALIDACAO", , "A tolerância permitida deve estar entre 0 e 100.", 1, 0, , , , , , {"Ajuste o valor percentual."})
        Return .F.
    EndIf
    
    // 3) BEGIN SEQUENCE protegendo a gravação no banco de dados
    Begin Sequence
        // Tenta realizar a gravação do modelo
        lRet := .T.
    Recover
        // Mensagem amigável exigida pelo enunciado caso ocorra um erro crítico
        Help(, , "ERRO_GRAVACAO", , "Não foi possível concluir a gravação dos dados devido a uma instabilidade.", 1, 0, , , , , , {"Tente salvar novamente em instantes."})
        lRet := .F.
    End Sequence

Return lRet
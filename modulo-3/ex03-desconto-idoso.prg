// modulo-03/ex03-desconto-idoso.prg

PROCEDURE Main()
    LOCAL cCliente, cNasc, cPrecoProd
    LOCAL dNasc, nPreco, nIdade, nDesconto := 0.00, nTotal

    QOut("=== Caixa - Desconto Melhor Idade ===")
    QOut("")

    ACCEPT "Nome do cliente: " TO cCliente
    ACCEPT "Data de nascimento (DD/MM/AAAA): " TO cNasc
    dNasc := CToD(cNasc)
    ACCEPT "Preco do produto: " TO cPrecoProd
    nPreco := Val(cPrecoProd)

    nIdade := Int((Date() - dNasc) / 365) 

    IF nIdade > 60
        nDesconto := nPreco * 0.125
    ENDIF

    nTotal := nPreco - nDesconto

    QOut("")
    QOut("================ RESUMO ================")
    QOut("Cliente:    " + cCliente)
    QOut("Idade:      " + AllTrim(Str(nIdade)) + " anos")
    QOut("Preco Reg.: " + Str(nPreco, 10, 2))
    QOut("Desconto:   " + Str(nDesconto, 10, 2))
    QOut("Total:      " + Str(nTotal, 10, 2))
    QOut("========================================")
RETURN
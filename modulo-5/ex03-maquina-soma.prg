PROCEDURE Main()
    LOCAL cInput := ""
    LOCAL nValor := 0
    LOCAL nTotal := 0
    LOCAL nQtd := 0

    WHILE .T.
        ACCEPT "Digite um numero para somar (0 para encerrar): " TO cInput
        nValor := Val(cInput)

        IF nValor == 0
            EXIT
        ENDIF

        nTotal += nValor
        nQtd++
    ENDDO

    QOut("--- RESUMO ---")
    QOut("Soma total: " + AllTrim(Str(nTotal)))
    QOut("Quantidade de numeros digitados: " + AllTrim(Str(nQtd)))

    RETURN
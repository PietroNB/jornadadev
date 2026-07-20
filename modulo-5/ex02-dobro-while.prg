PROCEDURE Main()
    LOCAL cInput := ""
    LOCAL nValor := 0

    WHILE .T.
        ACCEPT "Digite um numero (0 ou negativo para sair): " TO cInput
        nValor := Val(cInput)

        IF nValor <= 0
            EXIT
        ENDIF

        QOut("O dobro de " + AllTrim(Str(nValor)) + " eh: " + AllTrim(Str(nValor * 2)))
    ENDDO

    QOut("Programa encerrado.")
    RETURN
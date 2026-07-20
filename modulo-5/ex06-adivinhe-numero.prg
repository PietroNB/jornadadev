PROCEDURE Main()
    LOCAL nSecreto := HB_RandomInt(1, 100)
    LOCAL nTentativas := 7
    LOCAL nI := 0
    LOCAL cInput := ""
    LOCAL nPalpite := 0
    LOCAL lAcertou := .F.

    QOut("=== JOGO ADIVINHE O NUMERO ===")
    QOut("Pensei em um numero de 1 a 100. Voce tem 7 tentativas!")

    FOR nI := 1 TO nTentativas
        QOut("")
        ACCEPT "Tentativa " + AllTrim(Str(nI)) + " de 7 - Digite seu palpite: " TO cInput
        nPalpite := Val(cInput)

        IF nPalpite == nSecreto
            lAcertou := .T.
            EXIT
        ELSEIF nPalpite < nSecreto
            QOut("Dica: O numero secreto eh MAIOR!")
        ELSE
            QOut("Dica: O numero secreto eh MENOR!")
        ENDIF
    NEXT

    QOut("--- RESULTADO ---")
    IF lAcertou
        QOut("Parabens! Voce acertou o numero " + AllTrim(Str(nSecreto)) + " em " + AllTrim(Str(nI)) + " tentativa(s)!")
    ELSE
        QOut("Que pena, suas tentativas acabaram. O numero secreto era " + AllTrim(Str(nSecreto)) + ".")
    ENDIF

    RETURN
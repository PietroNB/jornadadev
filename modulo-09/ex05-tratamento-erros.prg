FUNCTION Main()
    LOCAL nA     := 10
    LOCAL nB     := 0
    LOCAL nRes   := 0
    LOCAL oErro  := NIL

    BEGIN SEQUENCE
        // Provoca a divisão por zero de propósito
        nRes := nA / nB
        QOut("Resultado: " + Str(nRes))

    RECOVER USING oErro
        // Captura o erro interceptado pelo BEGIN SEQUENCE
        QOut("Erro capturado: " + oErro:Description)
    END SEQUENCE

    QOut("O programa continua de pe!")

RETURN NIL
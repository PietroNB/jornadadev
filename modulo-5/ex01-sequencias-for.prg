PROCEDURE Main()
    LOCAL nI := 0

    QOut("a) Numeros de 1 a 100:")
    FOR nI := 1 TO 100
        QOut(Str(nI))
    NEXT

    QOut("---")
    QOut("b) Numeros de -50 a 50:")
    FOR nI := -50 TO 50
        QOut(Str(nI))
    NEXT

    QOut("---")
    QOut("c) Numeros de 80 a 5 (decrescente):")
    FOR nI := 80 TO 5 STEP -1
        QOut(Str(nI))
    NEXT

    RETURN
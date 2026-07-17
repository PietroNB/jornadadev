PROCEDURE Main()
    LOCAL cNota1, cNota2, cNota3, cNota4
    LOCAL nNota1, nNota2, nNota3, nNota4, nMediaPond

    QOut("=== Calculo de Media Ponderada ===")
    QOut("")

    ACCEPT "Digite a nota do 1 Bimestre (Peso 1): " TO cNota1
    ACCEPT "Digite a nota do 2 Bimestre (Peso 2): " TO cNota2
    ACCEPT "Digite a nota do 3 Bimestre (Peso 3): " TO cNota3
    ACCEPT "Digite a nota do 4 Bimestre (Peso 4): " TO cNota4

    nNota1 := Val(cNota1)
    nNota2 := Val(cNota2)
    nNota3 := Val(cNota3)
    nNota4 := Val(cNota4)


    nMediaPond := ((nNota1 * 1) + (nNota2 * 2) + (nNota3 * 3) + (nNota4 * 4)) / 10

    QOut("")
    QOut("Media Final Ponderada: " + Str(nMediaPond, 10, 2)) 
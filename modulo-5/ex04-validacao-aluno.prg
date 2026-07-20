PROCEDURE Main()
    LOCAL cNome := ""
    LOCAL cDisc := ""
    LOCAL cInput := ""
    LOCAL nNota1 := 0, nNota2 := 0, nMedia := 0

    // Validação do Nome
    WHILE .T.
        ACCEPT "Digite o nome do aluno: " TO cNome
        IF Len(Trim(cNome)) > 0
            EXIT
        ENDIF
        QOut("Nome invalido! O nome nao pode ser vazio.")
    ENDDO

    // Validação da Disciplina
    WHILE .T.
        ACCEPT "Digite a disciplina (3 letras maiusculas, ex: MAT): " TO cDisc
        cDisc := Trim(cDisc)
        IF Len(cDisc) == 3 .AND. cDisc == Upper(cDisc)
            EXIT
        ENDIF
        QOut("Disciplina invalida! Deve conter exatamente 3 letras maiusculas.")
    ENDDO

    // Validação da Nota 1
    WHILE .T.
        ACCEPT "Digite a Nota 1 (0 a 10): " TO cInput
        nNota1 := Val(cInput)
        IF nNota1 >= 0 .AND. nNota1 <= 10
            EXIT
        ENDIF
        QOut("Nota invalida! Digite um valor entre 0 e 10.")
    ENDDO

    // Validação da Nota 2
    WHILE .T.
        ACCEPT "Digite a Nota 2 (0 a 10): " TO cInput
        nNota2 := Val(cInput)
        IF nNota2 >= 0 .AND. nNota2 <= 10
            EXIT
        ENDIF
        QOut("Nota invalida! Digite um valor entre 0 e 10.")
    ENDDO

    nMedia := (nNota1 + nNota2) / 2

    QOut("--- DADOS DO ALUNO ---")
    QOut("Aluno: " + cNome)
    QOut("Disciplina: " + cDisc)
    QOut("Nota 1: " + AllTrim(Str(nNota1)))
    QOut("Nota 2: " + AllTrim(Str(nNota2)))
    QOut("Media: " + AllTrim(Str(nMedia, 5, 2)))

    RETURN
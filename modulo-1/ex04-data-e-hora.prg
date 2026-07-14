FUNCTION Main()
    // Exerc°cio 3: Ficha de Apresentaá∆o

    hb_cdpSelect("PT850")
    
    QOut("================================")
    QOut("       FICHA DE APRESENTAÄAO    ")
    QOut("================================")
    QOut("Nome   : [Pietro Novais]")
    QOut("Cidade : [Mogi Guaáu]")
    QOut("Curso  : Harbour/ADVPL")
    QOut("================================")

    // Exerc°cio 4: Inclus∆o da Data e Hora
    QOut("Data   : " + DToC(Date()))
    
    QOut("Hora   : " + Time())
    QOut("================================")
RETURN NIL
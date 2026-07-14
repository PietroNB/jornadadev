Function Main()
    
    LOCAL cNome   := "Pietro Novais"
    LOCAL cCidade := "Mogi Gua‡u"
    LOCAL cCurso  := "Harbour/ADVPL"

    hb_cdpSelect("PT850") 

    ? "================================"
    ? "     FICHA DE APRESENTA€AO"
    ? "================================"
    ? "Nome   : " + cNome
    ? "Cidade : " + cCidade
    ? "Curso  : " + cCurso
    ? "================================"

Return Nil
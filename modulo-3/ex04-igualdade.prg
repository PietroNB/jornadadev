PROCEDURE Main()
    LOCAL cTextoLongo := "Harbour"
    LOCAL cTextoCurto := "Harb"

    QOut("=== Teste de Igualdade no Harbour ===")
    QOut("")

    QOut("Comparando 'Harbour' = 'Harb':")
    QOut(cTextoLongo = cTextoCurto)

    QOut("")

  
    QOut("Comparando 'Harbour' == 'Harb':")
    QOut(cTextoLongo == cTextoCurto)
RETURN
PROCEDURE Main()
   LOCAL nNum1 := 0
   LOCAL nNum2 := 0
   LOCAL cInput1 := ""
   LOCAL cInput2 := ""

   ACCEPT "Digite o primeiro número: " TO cInput1
   ACCEPT "Digite o segundo número: "  TO cInput2

   nNum1 := Val(cInput1)
   nNum2 := Val(cInput2)

   IF nNum1 == nNum2
      QOut("Os dois números são iguais: " + Str(nNum1))
   ELSE
      IF nNum1 > nNum2
         QOut("Maior: " + Str(nNum1))
         QOut("Menor: " + Str(nNum2))
      ELSE
         QOut("Maior: " + Str(nNum2))
         QOut("Menor: " + Str(nNum1))
      ENDIF
   ENDIF
RETURN
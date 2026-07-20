PROCEDURE Main()
   LOCAL cOp     := ""
   LOCAL nA      := 0
   LOCAL nB      := 0
   LOCAL cInputA := ""
   LOCAL cInputB := ""

   ACCEPT "Digite o primeiro número (ou base/radicando): " TO cInputA
   nA := Val(cInputA)

   ACCEPT "Opções: [ + | - | * | / | ^ (potência) | R (raiz quadrada) ]: " TO cOp
   cOp := Upper(AllTrim(cOp))

   DO CASE
      CASE cOp == "+"
         ACCEPT "Digite o segundo número: " TO cInputB
         nB := Val(cInputB)
         QOut("Resultado: " + Str(nA + nB, 10, 2))

      CASE cOp == "-"
         ACCEPT "Digite o segundo número: " TO cInputB
         nB := Val(cInputB)
         QOut("Resultado: " + Str(nA - nB, 10, 2))

      CASE cOp == "*"
         ACCEPT "Digite o segundo número: " TO cInputB
         nB := Val(cInputB)
         QOut("Resultado: " + Str(nA * nB, 10, 2))

      CASE cOp == "/"
         ACCEPT "Digite o segundo número: " TO cInputB
         nB := Val(cInputB)
         IF nB == 0
            QOut("Erro: Divisão por zero não é permitida!")
         ELSE
            QOut("Resultado: " + Str(nA / nB, 10, 2))
         ENDIF

      CASE cOp == "^"
         ACCEPT "Digite o expoente: " TO cInputB
         nB := Val(cInputB)
         QOut("Resultado: " + Str(nA ^ nB, 10, 2))

      CASE cOp == "R"
         IF nA < 0
            QOut("Erro: Não existe raiz quadrada real de número negativo!")
         ELSE
            QOut("Resultado: " + Str(Sqrt(nA), 10, 2))
         ENDIF

      OTHERWISE
         QOut("Erro: Opção/Operação inválida!")
   ENDCASE
RETURN
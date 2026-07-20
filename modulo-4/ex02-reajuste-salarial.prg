PROCEDURE Main()
   LOCAL nSalarioAtual := 0
   LOCAL nPercentual   := 0
   LOCAL nNovoSalario  := 0
   LOCAL cInput        := ""

   ACCEPT "Digite o salário atual: R$ " TO cInput
   nSalarioAtual := Val(cInput)

   IF nSalarioAtual < 1000
      nPercentual := 0.15 // 15%
   ELSEIF nSalarioAtual <= 2000
      nPercentual := 0.12 // 12%
   ELSEIF nSalarioAtual <= 4000
      nPercentual := 0.08 // 8%
   ELSE
      nPercentual := 0.05 // 5%
   ENDIF

   nNovoSalario := nSalarioAtual * (1 + nPercentual)

   QOut("----------------------------------------")
   QOut("Salário Atual: R$ " + Str(nSalarioAtual, 10, 2))
   QOut("Reajuste: " + Str(nPercentual * 100, 5, 0) + "%")
   QOut("Novo Salário:  R$ " + Str(nNovoSalario, 10, 2))
   QOut("----------------------------------------")
RETURN
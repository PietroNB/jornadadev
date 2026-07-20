PROCEDURE Main()
   LOCAL nIdade       := 0
   LOCAL nDependentes := 0
   LOCAL nValorBase   := 0
   LOCAL nValorTotal  := 0
   LOCAL cInputIdade  := ""
   LOCAL cInputDep    := ""

   ACCEPT "Digite a idade do titular: " TO cInputIdade
   ACCEPT "Digite a quantidade de dependentes: " TO cInputDep

   nIdade       := Val(cInputIdade)
   nDependentes := Val(cInputDep)

   IF nIdade <= 25
      nValorBase := 180
   ELSEIF nIdade <= 40
      nValorBase := 260
   ELSEIF nIdade <= 60
      nValorBase := 380
   ELSE
      nValorBase := 520
   ENDIF

   nValorTotal := nValorBase + (nDependentes * 90)

   QOut("----------------------------------------")
   QOut("Valor base faixa etária: R$ " + Str(nValorBase, 8, 2))
   QOut("Adicional dependentes:   R$ " + Str(nDependentes * 90, 8, 2))
   QOut("Valor Mensal Total:      R$ " + Str(nValorTotal, 8, 2))
   QOut("----------------------------------------")
RETURN
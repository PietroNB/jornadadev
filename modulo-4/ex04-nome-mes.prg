PROCEDURE Main()
   LOCAL nMes   := 0
   LOCAL cInput := ""

   ACCEPT "Digite o número do mês (1 a 12): " TO cInput
   nMes := Val(cInput)

   DO CASE
      CASE nMes == 1  ; QOut("Mês: Janeiro")
      CASE nMes == 2  ; QOut("Mês: Fevereiro")
      CASE nMes == 3  ; QOut("Mês: Março")
      CASE nMes == 4  ; QOut("Mês: Abril")
      CASE nMes == 5  ; QOut("Mês: Maio")
      CASE nMes == 6  ; QOut("Mês: Junho")
      CASE nMes == 7  ; QOut("Mês: Julho")
      CASE nMes == 8  ; QOut("Mês: Agosto")
      CASE nMes == 9  ; QOut("Mês: Setembro")
      CASE nMes == 10 ; QOut("Mês: Outubro")
      CASE nMes == 11 ; QOut("Mês: Novembro")
      CASE nMes == 12 ; QOut("Mês: Dezembro")
      OTHERWISE
         QOut("Mês inválido! Digite um número entre 1 e 12.")
   ENDCASE
RETURN
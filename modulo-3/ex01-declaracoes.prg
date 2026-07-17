PROCEDURE Main()
    LOCAL cNomeFunc     := "Carlos Alberto" 
    LOCAL nSalarioBruto := 4500.50         
    LOCAL lAtivo        := .T.              
    LOCAL dAdmissao     := CToD("15/07/2025") 
    LOCAL cDepto        := "TI01"         

    QOut("=== Dados do Funcionario ===")
    QOut("Nome: " + cNomeFunc)
    QOut("Salario Bruto: " + Str(nSalarioBruto, 10, 2))
    QOut("Ativo?: " + iif(lAtivo, "Sim", "Nao"))
    QOut("Admissao: " + DToC(dAdmissao))
    QOut("Depto: " + cDepto)
RETURN
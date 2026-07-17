#define PI 3.14159

PROCEDURE Main()
    LOCAL cRaio, cCatetoA, cCatetoB, cPeso, cAltura
    LOCAL nRaio, nArea, nCatetoA, nCatetoB, nHipotenusa, nPeso, nAltura, nIMC

    QOut("=== Calculadora de Formulas ===")
    QOut("")

    // a. Area do circulo
    ACCEPT "Digite o raio do circulo: " TO cRaio
    nRaio := Val(cRaio)
    nArea := PI * (nRaio ^ 2) 
    QOut("Area do Circulo: " + Str(nArea, 10, 2))
    QOut("----------------------------------")


    ACCEPT "Digite o cateto A: " TO cCatetoA
    ACCEPT "Digite o cateto B: " TO cCatetoB
    nCatetoA := Val(cCatetoA)
    nCatetoB := Val(cCatetoB)
    nHipotenusa := Sqrt((nCatetoA ^ 2) + (nCatetoB ^ 2)) 
    QOut("Hipotenusa: " + Str(nHipotenusa, 10, 2))
    QOut("----------------------------------")

    ACCEPT "Digite o seu peso (kg): " TO cPeso
    ACCEPT "Digite a sua altura (m): " TO cAltura
    nPeso := Val(cPeso)
    nAltura := Val(cAltura)
    nIMC := nPeso / (nAltura ^ 2) 
    QOut("IMC: " + Str(nIMC, 10, 2))
    QOut("----------------------------------")
RETURN
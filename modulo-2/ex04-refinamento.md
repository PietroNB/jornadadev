# Exercício 4 — Refinamento Sucessivo

---

## Nível 1 (Visão Geral)

1. Registrar itens e somar subtotal.
2. Aplicar desconto de fidelidade.
3. Exibir total a pagar.

---

## Nível 2 (Detalhamento)

### 1. Registrar itens e somar subtotal
* **1.1.** Iniciar `subtotal ← 0`.
* **1.2.** Repetir para cada item:
  * **1.2.1.** Ler `preco` e `qtd`.
  * **1.2.2.** `subtotal ← preco * qtd`

### 2. Aplicar desconto de fidelidade
* **2.1.** Ler resposta para "Tem cartão?"
* **2.2.** Se resposta for "Sim":
  * **2.2.1.** `Desconto ← subtotal * 5`
  * **2.2.2.** `Total ← subtotal - Desconto`
* **2.3.** Senão:
  * **2.3.1.** `Total ← subtotal`

### 3. Exibir total a pagar
* **3.1.** Mostrar `Total`.
# Exercício 3 — Meu Fluxograma

## Representação Visual (Diagrama)

```mermaid
graph TD
    A([Começo]) --> B[/Digitar o valor da compra/]
    B --> C{O valor é maior que 100?}
    
    C -- Sim --> D[Desconto ← Valor * 0.10]
    C -- Não --> E[Desconto ← 0]
    
    D --> F[Total ← Valor - Desconto]
    E --> F
    
    F --> G[/Mostrar o Total final a pagar/]
    G --> H([Fim])
# Exercício 3 — Meu Fluxograma

Abaixo está a representação visual exata do algoritmo de desconto da loja, utilizando o formato Mermaid para renderizar o diagrama.

```mermaid
graph TD
    A([Início]) --> B[/Leia o valor da compra/]
    B --> C{Valor da compra > R$ 100,00?}
    
    C -->|Não| D[Valor Final ← Valor]
    C -->|Sim| E[Desconto ← Valor * 10 / 100]
    
    E --> F[Valor Final ← Valor - Desconto]
    
    D --> G[/Mostre o Valor Final/]
    F --> G
    
    G --> H([Fim])
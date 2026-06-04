# BancoJulia

Sistema Bancário Simplificado - Arquitetura de Linguagens de Programação

Este projeto foi desenvolvido como parte da avaliação da disciplina Arquitetura de Linguagens de Programação (2026.1), ministrada pela professora Renatha Capua.

# Objetivo
O objetivo central deste código não é a construção de um software comercial robusto, mas sim a demonstração prática dos conceitos teóricos estudados em sala de aula. O projeto serve como um "mini-tutorial" para ilustrar o comportamento da linguagem Julia sob a ótica da arquitetura de linguagens de programação.

# Estrutura do Projeto
Para facilitar a explicação didática durante o seminário, o código foi modularizado em arquivos curtos, cada um focando em um conjunto específico de conceitos:

* src/Conta.jl: Demonstra a definição de Tipos de Dados Compostos (Produto Cartesiano com mutable struct) e o uso de Mapeamentos Finitos (vetores).

* src/Operacoes.jl: Foca no comportamento de Subprogramas (Funções), Passagem de Parâmetros, Escopo e o Tratamento de Exceções (throw, ArgumentError, ErrorException).

* Demonstracao.jl: O script principal (driver) utilizado no seminário. Ele executa um roteiro passo a passo que ilustra o fluxo de execução, efeitos colaterais e a captura de erros, servindo como a demonstração prática exigida.

# Por que esta arquitetura?
Optamos por uma estrutura simples e modular em vez de padrões complexos de engenharia de software pelos seguintes motivos:

* Foco Didático: A arquitetura privilegia a visibilidade dos conceitos (Amarrações, Tipos, Escopo).

* Clareza na Apresentação: Como a aplicação foi desenvolvida para um seminário, a ideia é que o código seja facilmente legível e didático.

* Alinhamento com o Edital: O projeto atende rigorosamente aos requisitos de demonstração de funcionamento e avaliação teórica da LP exigidos pela disciplina.

# Como Executar
Certifique-se de ter a linguagem Julia instalada. Com o terminal aberto na raiz do repositório (.../BancoJulia/), execute:

``` julia Demonstracao.jl```

Este script executará o roteiro completo de demonstração, exibindo no terminal as operações bancárias bem-sucedidas e o tratamento de exceções.

# [AMARRAÇÃO EM TEMPO DE LIGAÇÃO/COMPILAÇÃO]
# O comando 'include' disponibiliza os módulos externos. A associação dos identificadores 
# das funções (como 'criar_conta') aos seus respectivos blocos de código ocorre no Tempo de Ligação/Compilação.
include("src/Conta.jl")
include("src/Operacoes.jl")

# [AMARRAÇÃO EM TEMPO DE PROJETO DA LP]
# Identificadores nativos (como a função 'println') e operadores ('^', '*') recebem seu 
# significado léxico e semântico na criação da linguagem Julia.
println("="^50)
println("DEMONSTRAÇÃO DA IMPLEMENTAÇÃO PRÁTICA - SISTEMA BANCÁRIO SIMPLIFICADO")
println("="^50)

println("\n--- 1. CRIANDO CONTAS ---")

# [AMARRAÇÃO EM TEMPO DE EXECUÇÃO]
# Ao invocar a função, os valores são amarrados dinamicamente aos identificadores (parâmetros) e a um local de memória.
criar_conta(101, "Maria Silva", 1500.00)
criar_conta(102, "João Souza", 500.00)

println("\n--- 2. REALIZANDO DEPÓSITO E SAQUE ---")

# [AMARRAÇÃO EM TEMPO DE EXECUÇÃO]
# Ao invocar a função, os valores são amarrados dinamicamente aos identificadores (parâmetros) e a um local de memória.
depositar(101, 300.00)
sacar(102, 100.00)

println("\n--- 3. TRANSFERÊNCIA BANCÁRIA ---")

# [AMARRAÇÃO EM TEMPO DE EXECUÇÃO]
# Ao invocar a função, os valores são amarrados dinamicamente aos identificadores (parâmetros) e a um local de memória.
transferir(101, 102, 250.00)

println("\n--- 4. TESTANDO O TRATAMENTO DE EXCEÇÕES (ERROS) ---")

# [AMARRAÇÃO EM TEMPO DE PROJETO DA LP]
# As palavras reservadas 'try' e 'catch' têm sua sintaxe e semântica de controle de 
# fluxo amarradas durante o projeto da linguagem.
try
    println("\n-> Tentando sacar R\$ 1000.00 da conta do João (que só tem 650.00)...")
    sacar(102, 1000.00)

catch e
    # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO]
    # O identificador 'e' é amarrado dinamicamente ao objeto da exceção caso seja instanciado. 
    println("\nTratamento capturou o erro: ", e.msg)
end

try
    println("\n-> Tentando criar conta com saldo inicial negativo...")
    criar_conta(103, "Ana", -200.00)

catch e
    # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO]
    # O identificador 'e' é amarrado dinamicamente ao objeto da exceção caso seja instanciado. 
    println("\nTratamento capturou o erro: ", e.msg)
end

println("\n--- 5. SALDOS FINAIS ---")

consultar_saldo(101)
consultar_saldo(102)

println("\n", "="^50)
println("FIM DA DEMONSTRAÇÃO")
println("="^50)

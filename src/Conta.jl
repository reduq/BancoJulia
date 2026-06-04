# [AMARRAÇÃO EM TEMPO DE PROJETO DA LP]
# As palavras reservadas 'mutable', 'struct' e os tipos primitivos ('Int', 'String', 'Float64')
#receberam seu significado léxico e semântico durante o projeto da linguagem Julia.

# [AMARRAÇÃO EM TEMPO DE COMPILAÇÃO]
# O identificador 'Conta' é amarrado à estrutura deste novo tipo de dado composto 
# (que representa um Produto Cartesiano) no Tempo de Compilação.
mutable struct Conta
    numero::Int
    titular::String
    saldo::Float64
end

# [AMARRAÇÃO EM TEMPO DE CARGA]
# Por atuar no escopo global do módulo, o identificador 'contas_do_banco' recebe 
# a reserva do seu espaço físico na memória durante o Tempo de Carga do programa.

# [AMARRAÇÃO EM TEMPO DE EXECUÇÃO]
# A criação do vetor vazio do tipo Conta (representando um Mapeamento Finito) ocorre por alocação dinâmica
# no Monte (Heap), e seu valor correspondente é amarrado à constante durante o Tempo de Execução.
const contas_do_banco = Conta[]

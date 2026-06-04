function encontrar_conta(numero::Int)
    # [AMARRAÇÃO EM TEMPO DE COMPILAÇÃO] 
    # O identificador 'encontrar_conta' é amarrado à sua assinatura formal.
    # A restrição do parâmetro ao tipo 'Int' também é resolvida no Tempo de Compilação, 
    # permitindo que o compilador JIT do Julia gere código otimizado para inteiros.

    for conta in contas_do_banco
        # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO] 
        # A cada iteração, a variável local 'conta' é dinamicamente alocada em um 
        # local de memória e amarrada a um elemento do vetor global.
        if conta.numero == numero
            # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO]
            # A resolução para acessar o valor armazenado no campo '.numero' da instância
            # ocorre dinamicamente durante a execução.
            return conta
        end
    end
    throw(ErrorException("Conta numero $numero nao encontrada."))
end


function criar_conta(numero::Int, titular::String, saldo_inicial::Float64)
    # [AMARRAÇÃO EM TEMPO DE LIGAÇÃO/COMPILAÇÃO]
    # O identificador 'any' é associado ao bloco de código da função na biblioteca padrão da linguagem Julia Base.any.
    
    # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO]
    # A expressão 'c -> ...' instancia uma função anônima na memória. 
    # O parâmetro 'c' é amarrado temporariamente a cada objeto do vetor 
    # ('contas_do_banco') durante a iteração.
    if any(c -> c.numero == numero, contas_do_banco)
        throw(ArgumentError("Ja existe uma conta com o numero $numero."))
    end

    if saldo_inicial < 0
        throw(ArgumentError("O saldo inicial nao pode ser negativo."))
    end

    # [AMARRAÇÃO EM TEMPO DE COMPILAÇÃO]
    # O identificador 'Conta' é amarrado em tempo de compilação ao struct definido no módulo vizinho.
    
    # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO] 
    # A variável 'nova_conta' é associada à nova instância criada na memória dinâmica.
    nova_conta = Conta(numero, titular, saldo_inicial)
    
    # [AMARRAÇÃO EM TEMPO DE LIGAÇÃO/COMPILAÇÃO] 
    # 'push!' é associado à função nativa de manipulação de vetores mutáveis.
    push!(contas_do_banco, nova_conta) 

    println("Conta de $titular criada com sucesso: (Numero: $numero, Saldo inicial: R\$ $saldo_inicial)")
end


function consultar_saldo(numero::Int)
    # [AMARRAÇÃO EM TEMPO DE LIGAÇÃO/COMPILAÇÃO]
    # O identificador 'encontrar_conta' é amarrado ao bloco de código da função em tempo de compilação.
    
    # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO] 
    # A variável 'conta' recebe o retorno da função 'encontrar_conta' e é amarrada a esse valor.
    conta = encontrar_conta(numero) 

    println("Saldo atual da conta $numero $(conta.titular): R\$ $(conta.saldo)")
end


function depositar(numero::Int, valor::Float64)
    if valor <= 0
        throw(ArgumentError("O valor do deposito deve ser maior que zero."))
    end

    conta = encontrar_conta(numero)
  
    # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO] 
    # Amarrações de mutação de estado (Efeito Colateral) nos objetos passados por referência.
    # O novo valor é calculado e reamarrado ao campo '.saldo' da instância.
    conta.saldo += valor 

    println("Deposito de R\$ $valor na conta $numero. Novo saldo: R\$ $(conta.saldo)")
end


function sacar(numero::Int, valor::Float64)
    if valor <= 0
        throw(ArgumentError("O valor do saque deve ser maior que zero."))
    end

    conta = encontrar_conta(numero)
  
    if conta.saldo < valor
        throw(ErrorException("Saldo insuficiente. Saldo: R\$ $(conta.saldo)"))
    end

    # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO] 
    # Amarrações de mutação de estado (Efeito Colateral) nos objetos passados por referência.
    # O novo valor é calculado e reamarrado ao campo '.saldo' da instância.
    conta.saldo -= valor 

    println("Saque de R\$ $valor realizado com sucesso. Novo saldo: R\$ $(conta.saldo)")
end


function transferir(origem::Int, destino::Int, valor::Float64)
    if valor <= 0
        throw(ArgumentError("O valor da transferência deve ser maior que zero."))
    end

    # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO] 
    # Ambas as variáveis locais ('conta_orig' e 'conta_dest') são amarradas 
    # dinamicamente às instâncias retornadas na execução da função 'encontrar_conta'.
    conta_orig = encontrar_conta(origem)
    conta_dest = encontrar_conta(destino)

    if conta_orig.saldo < valor
        throw(ErrorException("A conta numero $(conta_orig.numero) possui saldo insuficiente para realizar essa transacao."))
    end

    # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO] 
    # Amarrações de mutação de estado (Efeito Colateral) nos objetos passados por referência.
    conta_orig.saldo -= valor
    conta_dest.saldo += valor 

    println("Transferencia de R\$ $valor enviada de $(conta_orig.titular) para $(conta_dest.titular).")
end

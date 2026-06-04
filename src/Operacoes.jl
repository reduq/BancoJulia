function encontrar_conta(numero::Int)
    # [AMARRAÇÃO DE TIPO] 'numero' é restrito ao tipo Int.
    # [AMARRAÇÃO DE NOME] 'encontrar_conta' é associado a esta função definida pelo programador.

    # Percorre o vetor global 'contas_do_banco' procurando a conta informada.
    for conta in contas_do_banco
        # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO] A cada iteração, 'conta' é associada a um elemento do vetor.

        if conta.numero == numero
            # [AMARRAÇÃO DE CAMPO] 'numero' é um campo definido na struct Conta.
            return conta
        end
    end
    throw(ErrorException("Conta numero $numero nao encontrada."))
end


function criar_conta(numero::Int, titular::String, saldo_inicial::Float64)
    # [AMARRAÇÃO DE TIPO] Os parâmetros são restritos aos tipos Int, String e Float64.

    # Verifica se já existe uma conta com o mesmo número.
    if any(c -> c.numero == numero, contas_do_banco)
        # [AMARRAÇÃO DE FUNÇÃO DA BASE] 'any' é associado à função Base.any de Julia.
        # Durante a execução, Julia escolhe o método adequado de 'any' de acordo com os tipos dos argumentos recebidos.
        # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO] 'c -> ...' associa 'c' a cada conta em 'contas_do_banco'.
        # A expressão 'c -> c.numero == numero' cria uma função anônima.
        # O parâmetro 'c' é amarrado temporariamente a cada elemento de 'contas_do_banco' enquanto a função 'any' percorre o vetor.

        throw(ArgumentError("Ja existe uma conta com o numero $numero."))
    end

    # Verifica se o saldo inicial é negativo.
    if saldo_inicial < 0
        throw(ArgumentError("O saldo inicial nao pode ser negativo."))
    end

    # Cria uma nova instância da struct Conta.
    nova_conta = Conta(numero, titular, saldo_inicial)
    # [AMARRAÇÃO DE IDENTIFICADOR] 'Conta' é associado à struct definida pelo programador.
    # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO] 'nova_conta' é associada à instância recém-criada.

    push!(contas_do_banco, nova_conta)
    # [AMARRAÇÃO DE FUNÇÃO DA BASE] 'push!' é associado à função da Base que adiciona um elemento ao vetor.

    println("Conta de $titular criada com sucesso: (Numero: $numero, Saldo inicial: R$ $saldo_inicial)")
end


function consultar_saldo(numero::Int)
    # [AMARRAÇÃO DE TIPO] 'numero' é restrito ao tipo Int.

    conta = encontrar_conta(numero)
    # [AMARRAÇÃO DE CHAMADA] 'encontrar_conta' é associado à função definida anteriormente.
    # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO] 'conta' recebe a conta retornada pela função.

    println("Saldo atual da conta $numero $(conta.titular): R$ $(conta.saldo)")
end


function depositar(numero::Int, valor::Float64)
    # [AMARRAÇÃO DE TIPO] 'numero' é Int e 'valor' é Float64.

    # Verifica se o valor do depósito é válido.
    if valor <= 0
        throw(ArgumentError("O valor do deposito deve ser maior que zero."))
    end

    conta = encontrar_conta(numero)
    # [AMARRAÇÃO DE CHAMADA] 'encontrar_conta' é associado à função definida anteriormente.
    # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO] 'conta' recebe a conta retornada pela função.
  
    conta.saldo += valor
    # [AMARRAÇÃO DE CAMPO] O campo 'saldo' da struct Conta é atualizado.
    # Para isso funcionar, Conta deve ser uma mutable struct.

    println("Deposito de R$ $valor na conta $numero. Novo saldo: R$ $(conta.saldo)")
end


function sacar(numero::Int, valor::Float64)
    # [AMARRAÇÃO DE TIPO] 'numero' é Int e 'valor' é Float64.

    # Verifica se o valor do saque é válido.
    if valor <= 0
        throw(ArgumentError("O valor do saque deve ser maior que zero."))
    end

    conta = encontrar_conta(numero)
    # [AMARRAÇÃO DE CHAMADA] 'encontrar_conta' é associado à função definida anteriormente.
    # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO] 'conta' recebe a conta retornada pela função.
  
    # Verifica se há saldo suficiente.
    if conta.saldo < valor
        throw(ErrorException("Saldo insuficiente. Saldo: R$ $(conta.saldo)"))
    end

    conta.saldo -= valor
    # [AMARRAÇÃO DE CAMPO] O campo 'saldo' da conta é atualizado.

    println("Saque de R$ $valor realizado com sucesso. Novo saldo: R$ $(conta.saldo)")
end


function transferir(origem::Int, destino::Int, valor::Float64)
    # [AMARRAÇÃO DE TIPO] 'origem' e 'destino' são Int; 'valor' é Float64.

    # Verifica se o valor da transferência é válido.
    if valor <= 0
        throw(ArgumentError("O valor da transferência deve ser maior que zero."))
    end

    conta_orig = encontrar_conta(origem)
    conta_dest = encontrar_conta(destino)
    # [AMARRAÇÃO DE CHAMADA] 'encontrar_conta' é associado à função definida anteriormente.
    # [AMARRAÇÃO EM TEMPO DE EXECUÇÃO] As variáveis recebem as contas de origem e destino.

    # Verifica se a conta de origem possui saldo suficiente.
    if conta_orig.saldo < valor
        throw(ErrorException("A conta numero $(conta_orig.numero) possui saldo insuficiente para realizar essa transacao."))
    end

    conta_orig.saldo -= valor
    conta_dest.saldo += valor
    # [AMARRAÇÃO DE CAMPO] Os campos 'saldo' das duas contas são atualizados.

    println("Transferencia de R$ $valor enviada de $(conta_orig.titular) para $(conta_dest.titular).")
end

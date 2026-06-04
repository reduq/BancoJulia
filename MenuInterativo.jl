include("src/Conta.jl")
include("src/Operacoes.jl")

function exibir_menu()
    println("\n" * "="^20)
    println(" SISTEMA BANCÁRIO SIMPLIFICADO - MENU INTERATIVO ")
    println("="^20)
    println("1 - Criar Conta")
    println("2 - Consultar Saldo")
    println("3 - Depositar")
    println("4 - Sacar")
    println("5 - Transferir")
    println("0 - Sair")
    print("Escolha uma opção: ")
end

while true
    exibir_menu()
    opcao = readline()

    try
        if opcao == "1"
            print("Número: "); num = parse(Int, readline())
            print("Titular: "); tit = readline()
            print("Saldo Inicial: "); sal = parse(Float64, readline())
            criar_conta(num, tit, sal)
            
        elseif opcao == "2"
            print("Número da conta: "); num = parse(Int, readline())
            consultar_saldo(num)

        elseif opcao == "3"
            print("Número da conta: "); num = parse(Int, readline())
            print("Valor: "); val = parse(Float64, readline())
            depositar(num, val)

        elseif opcao == "4"
            print("Número da conta: "); num = parse(Int, readline())
            print("Valor: "); val = parse(Float64, readline())
            sacar(num, val)

        elseif opcao == "5"
            print("Conta Origem: "); orig = parse(Int, readline())
            print("Conta Destino: "); dest = parse(Int, readline())
            print("Valor: "); val = parse(Float64, readline())
            transferir(orig, dest, val)

        elseif opcao == "0"
            println("Encerrando demonstração...")
            break
        else
            println("Opção inválida!")
        end
    catch e
        println("\nErro capturado na demonstração: ", e isa ErrorException ? e.msg : e)
    end
end
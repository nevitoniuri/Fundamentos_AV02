Algoritmo "AV2 v3.0"
// Disciplina: [Fudamentos de Programa��o]
// Professor: Bruno Correia da Silva
// Descri��o: Programa para gerenciamento de estoque de uma loja.
// Capaz de cadastrar produtos com o devido pre�o e quantidade,
// consultar o estoque, cadastrar vendas e consult�-las posteriormente,
// tamb�m como o valor obtido pelas vendas.
// Autor(a): Iuri N�viton e �caro N�dson

tipo  //declara��o de registros
    produtos = registro              //registro que sera utilizado para armazenar todos os produtos cadastrados pelo usu�rio.
    nome: caractere
    preco: real
    qntd: inteiro
    fimregistro
    
    lojainfo = registro         //registro para armazenar informa��es gerais da loja. Pronta para receber futuros "upgrades", por exemplo: funcion�rios.
    nomefantasia: caractere
    cnpj: inteiro
    fimregistro
    
Var     // VARI�VEIS GLOBAIS
opcaomenu, total_produtos, qntdVendas: inteiro
valorBruto: real
produto: vetor [1..10] de produtos
loja: vetor [1..2] de lojainfo

procedimento cadastrarProduto()       //FUN��O CADASTRAR PRODUTO
    var
    inicio
    limpatela
     se total_produtos <10 entao              //valor maximo de 10 estipulado arbitrariamente
        total_produtos <- total_produtos + 1
        escreval("")
        escreval("Sobre o produto a ser cadastrado: ")
        escreval("Digite o Nome: ")
        leia(produto[total_produtos].nome)
        escreval("Digite o Pre�o: ")
        leia(produto[total_produtos].preco)
        escreval("Digite a quantidade do estoque inicial: ")
        leia(produto[total_produtos].qntd)
        limpatela
        escreval("Produto cadastrado com sucesso!")
     senao
        escreval("Quantidade m�xima (10) de estoque atingida.")
     fimse
fimprocedimento            //FIM

procedimento listarProdutos()    //LISTAR PRODUTOS J� CADASTRADOS
    var
    i: inteiro
    
    inicio
    limpatela
    para i de 1 ate total_produtos faca
         escreval("")
         escreval("NOME: ", produto[i].nome)
         escreval("Pre�o: R$", produto[i].preco)
         escreval("Estoque: ", produto[i].qntd, " unidade(s)")
    fimpara
    escreval("")
    escreval("No momento, existe(m) ", total_produtos, " produto(s) cadastrado(s).")
fimprocedimento            //FIM


procedimento cadastrarVenda()     //ok
    var
    aux: caractere //variavel que armazena a quantidade de itens vendidos
    i, n: inteiro
    
    inicio
          escreval("")
          escreval("Digite o produto a ser vendido: ")    //identico ao que foi cadastrado
          leia(aux)
          escreval("Digite quantos itens ->",aux,"<- deseja vender: ")
          leia(n)
          para i de 1 ate total_produtos faca
          se aux = produto[i].nome entao
             se n <= produto[i].qntd entao
                produto[i].qntd <- produto[i].qntd - n
                qntdVendas <- QntdVendas + n
                valorBruto <- valorBruto + produto[i].preco*n
                escreval("Foi cadastrado:", n ," ", aux , "(s) vendidos.")
             senao
                escreval("N�o existe estoque suficiente do item: ", aux,".")
             fimse
          fimse
          fimpara

fimprocedimento


Inicio
  escreval("-------------------------------------")
  escreval("-SISTEMA DE GERENCIAMENTO DE ESTOQUE-")
  escreval("-------------------------------------")
  
  produto[1].nome <- "mouse"
  produto[1].preco <- 59.90     //INICIALMENTE TEMOS UM UNICO ITEM CADASTRADO.
  produto[1].qntd <- 25
  
  valorBruto <- 0
  QntdVendas <- 0
  
  total_produtos <- 1
  escreval("Digite o nome da loja: ")
  leia(loja.nomefantasia)                 //CADASTRAR INFORMA��ES DA LOJA
  escreval("Digite o CNPJ da loja: ")
  leia(loja.cnpj)
  limpatela
  
  repita

      escreval("")
      escreval("MENU")
      escreval("1 - CADASTRAR PRODUTO (max. 10)")
      escreval("2 - LISTAR PRODUTOS CADASTRADOS")
      escreval("3 - MOSTRAR INFORMA��ES DA LOJA")
      escreval("4 - CADASTRAR VENDA")
      escreval("5 - INFORMA��ES DAS VENDAS CADASTRADAS")
      escreval("0 - SAIR DO PROGRAMA")
      escreval("")
      escreval("Digite o n�mero da op��o desejada: ")
      leia(opcaomenu)
      

      se opcaomenu = 1 entao
         escreval("")
         escreval("A OP��O ESCOLHIDA FOI A 1.")
         cadastrarProduto()
      fimse
      
      se opcaomenu = 2 entao
         escreval("")
         escreval("A OP��O ESCOLHIDA FOI A 2.")
         listarProdutos()
      fimse
      
      se opcaomenu = 3 entao
         escreval("")
         escreval("Nome Fantasia: ",loja.nomefantasia)
         escreval("CNPJ: ",loja.cnpj)
         //escreval("Produtos cadastrados: ", total_produtos)
      fimse

      se opcaomenu = 4 entao
         escreval("")
         escreval("A OP��O ESCOLHIDA FOI A 4.")
         cadastrarVenda()
      fimse
      
      se opcaomenu = 5 entao
         escreval("")
         escreval("A OP��O ESCOLHIDA FOI A 5.")
         escreval("Foram feitas ", qntdVendas, " vendas at� o momento.")
         escreval("O valor bruto obtido das vendas foi de R$",valorBruto)
      fimse

  ate opcaomenu = 0
         escreva("Obrigado!")
         interrompa
fimalgoritmo
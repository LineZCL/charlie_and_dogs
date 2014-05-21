#Charlie & Dogs [http://charlie-and-dogs.herokuapp.com/]

##Descrição
O projeto é fruto de um teste para a [Ornitorrinko](http://ornitorrinko.com/)

A empresa Charlie & Dogs é um canil que deseja vender seus cachorros de raça online.

Para isso, essas são as funcionalidades:
* Implementar a busca por nome das raças;
* Listar os resultados da busca;
* Exibir os detalhes do animal;
* Adicionar o animal a um carrinho de compras sem necessidade de login;
* Criar uma tela de checkout solicitando identificação básica do comprador (Nome, CPF e e-mail) e um
endereço de entrega.


No checkout todos os dados da compra, raça, quantidade, valor, dados do comprador e endereço de entrega devem ser gravados no banco de dados.

Após o checkout o sistema deve retornar para a página inicial com o carrinho de compras "zerado".

##Suposição

As raças e cachorros já estarão cadastrados no banco de dados.

##Ambiente

**Linguagem:** Ruby

**Framework:** Ruby On Rails (v. 4.0.2)

**Banco de Dados:** Postgre

**Ferramentas de Testes:** rspec-rails

##Considerações Finais

A principio, existem duas melhorias a serem feitas:
* Mudar o layout de erro ao cadastrar o cliente no Checkout
* Deletar as vendas não finalizadas ao final do dia
*** Settings ***
Documentation     Suite de testes para cadastro de novo Dog walkog

Resource    ../resources/base.resource

Test Setup        Start Session
Test Teardown     Finish session

*** Test Cases ***
Cadastrando um novo Dog Walkes com sucesso
    [Tags]     smoke

    ${Dog_waker_var}    Create Dictionary
    ...    name=Toretto ferreira
    ...    email=ferreira@gmail.com
    ...    cpf=00000014141
    ...    cep=73357005
    ...    Street=Quadra 19 Conjunto A
    ...    District=Setor Residencial Leste (Planaltina)
    ...    CityUf=Brasília/DF
    ...    Number=1000
    ...    Details=apto 28
    ...    cnh=toretto.jpg
    
    Go to signup Page
    Fill signup form    ${Dog_waker_var}
    Submit sugnup Form
    popup should be     Recebemos o seu cadastro e em breve retornaremos o contato.
       
Não deve cadastrar com cpf inválido
    [Tags]        cpf_inv

    ${Dog_waker_var}    Create Dictionary
    ...    name=vanessa mendes
    ...    email=vanessa@gmail.com
    ...    cpf=000000141Ed
    ...    cep=73357005
    ...    Street=Quadra 19 Conjunto A
    ...    District=Setor Residencial Leste (Planaltina)
    ...    CityUf=Brasília/DF
    ...    Number=1000
    ...    Details=apto 28
    ...    cnh=toretto.jpg
    
    Go to signup Page
    Fill signup form    ${Dog_waker_var} 
    Submit sugnup Form
    Alert should be    CPF inválido    #Comando de validar texto de campo obrigatorio
         
Não deve cadastrar se campos obrigatórios não forem preenchidos
    [Tags]        required

    Go to signup Page
    Submit sugnup Form

    Alert should be    Informe o seu nome completo    
    Alert should be    Informe o seu melhor email    
    Alert should be    informe o seu CPF    
    Alert should be    Informe o seu CEP
    Alert should be    Informe um número maior que zero   
    Alert should be    Adcione um documento com foto (RG ou CHN)

Cadastrando novo dog walker que sabe cuidar de Pets
    [Tags]     aservice

    ${Dog_waker_var}    Create Dictionary
    ...    name=Henri Alves
    ...    email=Alves@gmail.com
    ...    cpf=00000014141
    ...    cep=73357005
    ...    Street=Quadra 19 Conjunto A
    ...    District=Setor Residencial Leste (Planaltina)
    ...    CityUf=Brasília/DF
    ...    Number=1000
    ...    Details=apto 28
    ...    cnh=toretto.jpg
    
    
    Go to signup Page
    Fill signup form    ${Dog_waker_var}
    Additional_service  Cuidar
    Submit sugnup Form
    popup should be     Recebemos o seu cadastro e em breve retornaremos o contato.

Cadastrando novo dog walker que sabe adestrar Pets
    [Tags]     aservice
   
    ${Dog_waker_var}    Create Dictionary
    ...    name=Alves Edu
    ...    email=Edu@gmail.com
    ...    cpf=00000014141
    ...    cep=73357005
    ...    Street=Quadra 19 Conjunto A
    ...    District=Setor Residencial Leste (Planaltina)
    ...    CityUf=Brasília/DF
    ...    Number=1000
    ...    Details=apto 28
    ...    cnh=toretto.jpg
    
    
    Go to signup Page
    Fill signup form    ${Dog_waker_var}
    Additional_service   Adestrar
    Submit sugnup Form
    popup should be     Recebemos o seu cadastro e em breve retornaremos o contato.
      


    
    



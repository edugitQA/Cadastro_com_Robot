*** Settings ***
Documentation    Ações, esteps e elementos da Funcionalidade de cadastro
Library    Browser

*** Keywords ***
Go to signup Page
    Click       css=a[href="/signup"]
    Wait For Elements State    form h1    visible    5
    Get Text       form h1    equal      Faça seu cadastro
Fill signup form
    [Arguments]    ${Dog_waker_var}
    Fill Text        css=input[name=name]                ${Dog_waker_var}[name]  
    Fill Text        css=input[name=email]               ${Dog_waker_var}[email]
    Fill Text        css=input[name=cpf]                 ${Dog_waker_var}[cpf]
    Fill Text        css=input[name=cep]                 ${Dog_waker_var}[cep]
    Click            css=input[type=button][value$=CEP] 
    
    Get Property     css=input[name=addressStreet]        value     equal        ${Dog_waker_var}[Street]
    Get Property     css=input[name=addressDistrict]      value     equal        ${Dog_waker_var}[District]
    Get Property     css=input[name=addressCityUf]        value     equal        ${Dog_waker_var}[CityUf]

    Fill Text        css=input[name=addressNumber]       ${Dog_waker_var}[Number]
    Fill Text        css=input[name=addressDetails]      ${Dog_waker_var}[Details]
    
    
    Upload File By Selector    css=input[type=file]    ${EXECDIR}/resources/fixtures/${Dog_waker_var}[cnh]

additional_service
    [Arguments]    ${Additional_service}

    Click    xpath=//span[text()="${Additional_service}"]/..
    

Submit sugnup Form
    Click            css=.button-register

popup should be 
    [Arguments]        ${expected_text}
    Wait For Elements State    css=.swal2-html-container    visible    5 
    Get Text                   css=.swal2-html-container    equal      ${expected_text}

Alert should be
    [Arguments]    ${expected_text}

        Wait For Elements State     css=.alert-error >> text=${expected_text}  
    ...        visible         5 
     
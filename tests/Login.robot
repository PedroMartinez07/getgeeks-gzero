*Settings*
Documentation        Autorização teste suíte
Resource             ${EXECDIR}/resources/Base.robot

Test Setup            Start Session
Test Teardown         Finish Session

*Test Case*
User Login
     ${user}                                 Factory User Login 
    Add User From DataBase                  ${user}

    Go To Login Page
    Fill Credentials           ${user}
    Submit Credentials
    User Should Be Logged In    ${user}

Incorrect Pass
     [Tags]        i_pass
    ${user}        Create Dictionary        email=papito@hotmail.com        password=pdw123
    
    Go To Login Page
    Fill Credentials               ${user}
    Submit Credentials
    Modal Containt Should Be        Usuário e/ou senha inválidos.

User Not Found
     [Tags]        user_404
    ${user}        Create Dictionary        email=papito@404.net        password=pdw123
    
    Go To Login Page
    Fill Credentials               ${user}
    Submit Credentials
    Modal Containt Should Be        Usuário e/ou senha inválidos.

Incorrect Email
     [Tags]        i_email
    ${user}        Create Dictionary        email=papito.com.br       password=pdw123
    
    Go To Login Page
    Fill Credentials               ${user}
    Submit Credentials 
    Should Be Type Email   

Required Email - Desafio 
   [Tags]        desafio_geeks
  ${user}        Create Dictionary        email=${EMPTY}       password=pdw123
    
    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    Alert Span Should Be            E-mail obrigatório

Required Password - Desafio 
   [Tags]        desafio_geeks
  ${user}        Create Dictionary        email=papito@hotmail.com     password=${EMPTY} 
    
    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    Alert Span Should Be            Senha obrigatória

Required Email and Password - Desafio 
   [Tags]        desafio_geeks
  ${user}        Create Dictionary        email=${EMPTY}       password=${EMPTY}
    
    Go To Login Page
    Fill Credentials                ${user}
    Submit Credentials
    Alert Span Should Be            E-mail obrigatório
    Alert Span Should Be            Senha obrigatória









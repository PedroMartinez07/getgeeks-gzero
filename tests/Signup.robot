*Settings*
Documentation        Signup testes suite.

Resource             ${EXECDIR}/resources/Base.robot
Test Setup           Start Session
Test Teardown        Finish Session

*Test Cases*
Register a new user
    
    ${user}                Factory user
    
    Go To Signup Form  
    Fill Signup form       ${user}
    Submit Signup Form
    User Should Be Registered


Duplicate User

    [Tags]         attempt_signup
    ${user}                                 Factory user
    Add User From DataBase                  ${user}

    Go To Signup Form  
    Fill Signup form               ${user}  
    Submit Signup Form     
    Modal Containt Should Be     Já temos um usuário com o e-mail informado.

Wrong email 

    [Tags]         attempt_signup
    ${user}        Factory Wrong Email

    Go To Signup Form  
    Fill Signup form               ${user}  
    Submit Signup Form
    Alert Span Should Be        O email está estranho

Required Fields
    [Tags]         attempt_signup        reqf

    @{expected_alerts}          Create List     
    ...                         Cadê o seu nome?
    ...                         E o sobrenome?
    ...                         O email é importante também!
    ...                         Agora só falta a senha!


    Go To Signup Form
    Submit Signup Form
    Alert Spans Should Be        ${expected_alerts} 

     

Short password
    [Tags]         attempt_signup        short_pass
    [Template]     Signup With Short Pass
    1
    2
    a1
    a23
    b23
    123ds
    23ds
    cxs1
    as234z   
    -1
   
    
*Keywords*
Signup With Short Pass
    [Arguments]            ${short_pass}

    ${user}        Create Dictionary
    ...            name= Pedro
    ...            lastname= Martinez
    ...            email=teste@123
    ...            password=${short_pass}

    Go To Signup Form  
    Fill Signup form               ${user}  
    Submit Signup Form
    Alert Span Should Be           Informe uma senha com pelo menos 6 caracteres 

Signup Submit Without Form
    [Arguments]        ${expect_alert}

    Go To Signup Form 
    Submit Signup Form
    Alert Span Should Be     ${expect_alert}

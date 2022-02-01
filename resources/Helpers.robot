*Settings*
Documentation        Text Helpers

*Keywords*

Add User From DataBase
    [Arguments]           ${user}     
    Connect To Postgres
    Insert User           ${user} 
    Disconnect From Database

    
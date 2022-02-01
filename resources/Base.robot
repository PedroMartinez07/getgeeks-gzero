*Settings*
Documentation        Base test

Library              Browser
Library              factories/Users.py
Library              Collections

Resource             actions/SignupActions.robot
Resource             actions/_sharedActions.robot
Resource             actions/AuthActions.robot
Resource             Helpers.robot
Resource             Database.robot



*Variables*
${BASE_URL}        https://getgeeks-pedro.herokuapp.com


*Keywords*

Start Session
    New Browser         chromium        headless=false        slowMo=00:00:00.5
    New Page            ${BASE_URL}   

Finish Session
    Take Screenshot
    
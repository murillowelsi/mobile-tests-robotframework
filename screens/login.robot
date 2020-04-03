*** Settings ***
Resource    ../resources/keywords.robot

*** Variables ***
${EMAIL}    murillo.welsi@gmail.com 
${TECHS}    ruby

*** Test cases ***
Book Reservation
    Application Login
    Select Spot
    Sleep                    1s
    Select Date              20/10/2020
    Check Success Message
    Click Element            xpath=//*[@text='Sair']

*** Keywords ***
Application Login
    Open Spotlab
    Login With                  ${EMAIL}    ${TECHS} 
    Should See Expect Title 

Select Spot
    Click Element    xpath=//*/android.view.ViewGroup[android.widget.TextView[@text='Acme X']]/android.view.ViewGroup/android.widget.TextView[@text='Solicitar reserva']

Select Date
    [Arguments]      ${DATA}
    Input Text       accessibility_id=dateInput              ${DATA}
    Click Element    xpath=//*[@text='Solicitar reserva']

Check Success Message
    Wait Until Element Is Visible    xpath=//*/android.widget.TextView[@text='Solicitação de reserva enviada.'] 
    Element Should Contain Text      xpath=//*/android.widget.TextView[@text='Solicitação de reserva enviada.']     Solicitação de reserva enviada.
    Click Element                    id=android:id/button1

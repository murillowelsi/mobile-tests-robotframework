*** Settings ***
Documentation    This script starts apps on two phones
Library          AppiumLibrary
Library          Collections
Resource         ./variables.robot


*** Keywords ***
Open Spotlab
    Open Application                 ${REMOTE_URL}                  platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    
    ...                              deviceName=${DEVICE_NAME}      app=${APP}                       automationName=appium
    Wait Until Element Is Visible    accessibility_id=emailInput    timeout=10

Login With
    [Arguments]      ${USER}                               ${TECHS}
    Input Text       accessibility_id=emailInput           ${USER}
    Input Text       accessibility_id=techsInput           ${TECHS}
    Click Element    xpath=//*[@text='Encontrar spots']

Should See Expect Title
    Wait Until Element Is Visible    xpath=//*[@text='Empresas que usam ${TECHS}']
    Element Should Contain Text      class=android.widget.TextView                    Empresas que usam ${TECHS}
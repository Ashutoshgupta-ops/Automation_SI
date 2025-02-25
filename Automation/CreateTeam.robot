*** Settings ***
Library     SeleniumLibrary


*** Variables ***
#${url}  https://gaming.uefa.com/en/uefachampionsleague
${browser}  chrome
${url} https://gaming-pre.uefa.com/en/uefachampionsleagu

*** Keywords ***
#Opensite Prod
      #Open Browser       ${url}     ${browser}
      #Maximize Browser Window
      #Sleep    2
      #Click Button    xpath://*[@id="onetrust-accept-btn-handler"]
      ##Close Browser
Opensite Pre
      Open Browser       ${url}     ${browser}
      Maximize Browser Window
      Sleep    2
      Click Button    xpath://*[@id="onetrust-accept-btn-handler"]
      ##Close Browser
*** Test Cases ***
Create Team Prod
        Opensite Prod
        Click Element    xpath://span[contains(text(),'Log in')]
        Input Text    id:gigya-loginID-75579930407612940     prod5@mailinator.com
        Sleep    2
        Input Text    ://input[@class="gigya-input-password gigya-empty gigya-error"]    Sportz@2022
        Sleep    2
        Click Button    xpath://*[@id="gigya-login-form"]/div[4]/div/input
Create Team Pre
       Open Browser       ${url1}     ${browser}
       Maximize Browser Window
       Sleep    2
       Title Should Be    UEFA Champions League - UEFA Gaming - UEFA.com
       Click Element    xpath:/html/body/div[2]/header/div[3]/div/div/pk-button//button

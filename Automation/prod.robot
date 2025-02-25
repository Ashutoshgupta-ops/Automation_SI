*** Settings ***
Library     SeleniumLibrary


*** Variables ***


*** Test Cases ***
Leagues
        Open Browser        https://gaming.uefa.com/en/uefachampionsleague      chrome
        Maximize Browser Window
        Sleep    3
        #Cookiee Accept
        Click Button    xpath://*[@id="onetrust-accept-btn-handler"]
        Sleep    3
        #Login
        Click Element    xpath:/html/body/div[2]/header/div[3]/div/div/pk-button/span
        Sleep    3
        Input Text    xpath://input[@id='gigya-loginID-75579930407612940']    prod35@mailinator.com
        Sleep    3
        Input Text    xpath://input[@id='gigya-password-32665041627364124']    Sportz@2022
        Sleep    3
        Click Button    xpath://input[@value='Submit']
        Sleep    8
        Execute Javascript  window.scrollTo(0,250)
        Sleep    3
        #Feature card
        Double Click Element    xpath://span[contains(text(),'View Team')]

        Sleep    5
        #cookiee Accept
        Click Button    xpath://*[@id="onetrust-accept-btn-handler"]
        Sleep    5
        #Leagues
        Click Element    xpath:(//a[normalize-space()='Leagues'])[1]
        Sleep    3
        #Public League - Join Club Card
        Select From List By Label    xpath://div[@class='si-dropdown__wrap si-dropdown--secondary si-up ']      Aston Villa
        Sleep    3
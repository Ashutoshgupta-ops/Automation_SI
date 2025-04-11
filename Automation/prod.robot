*** Settings ***
Library     SeleniumLibrary


*** Variables ***


*** Test Cases ***
Leagues
        Open Browser        https://gaming.uefa.com/en/uefachampionsleague      chrome
        Maximize Browser Window
        Set Selenium Implicit Wait    30s
        Set Selenium Timeout    30s

        #Cookiee Accept
        Click Button    xpath://*[@id="onetrust-accept-btn-handler"]
      
        #Login
        Click Element    xpath:/html/body/div[2]/header/div[3]/div/div/pk-button/span
        #Sleep    3
        Input Text    xpath://input[@id='gigya-loginID-75579930407612940']    prod35@mailinator.com
        #Sleep    3
        Input Text    xpath://input[@id='gigya-password-32665041627364124']    Sportz@2022
        #Sleep    3
        Click Button    xpath://input[@value='Submit']
       # Sleep    8
        Execute Javascript  window.scrollTo(0,250)
        #Sleep    3
        #Feature card
       # Double Click Element    xpath://span[contains(text(),'View Team')]
        #Click Element        xpath=//button[text()='View team']
        Click Element    xpath:
        #Sleep    5
        #cookiee Accept
        Click Button    xpath://*[@id="onetrust-accept-btn-handler"]
        Sleep    5
        #Leagues
        Click Element    xpath:(//a[normalize-space()='Leagues'])[1]
        Sleep    3
        #Public League - Join Club Card
        Select From List By Label    xpath://div[@class='si-dropdown__wrap si-dropdown--secondary si-up ']      Aston Villa
        Sleep    3


Overview Test
        Open Browser        https://gaming.uefa.com/en/uefachampionsleague      chrome
        Maximize Browser Window
        Set Selenium Implicit Wait    30s
        Set Selenium Timeout    30s

        #Cookiee Accept
        Click Button    xpath://*[@id="onetrust-accept-btn-handler"]
        #Login
        Click Element    xpath:/html/body/div[2]/header/div[3]/div/div/pk-button/span
        #Username
        Input Text    xpath://input[@id='gigya-loginID-75579930407612940']    prod35@mailinator.com
        #password
        Input Text    xpath://input[@id='gigya-password-32665041627364124']    Sportz@2022
        Click Button    xpath://input[@value='Submit']
        #scroll
        Execute Javascript  window.scrollTo(0,250)
        #Feature card
       # Double Click Element    xpath://span[contains(text(),'View Team')]
        Click Element        xpath=//button[text()='View team']
        #cookiee Accept
        Click Button    xpath://*[@id="onetrust-accept-btn-handler"]

        #Overview
        Click Element    xpath://a[normalize-space()='Overview']
        Execute Javascript  window.scrollTo(0,250)
        Execute Javascript  window.scrollTo(0,250)
        Execute Javascript  window.scrollTo(0,250)
        Execute Javascript  window.scrollTo(0,-250)
        #matchday card
        Click Element    xpath://div[@class='si-btn si-btn--outline']
        Execute Javascript  window.scrollTo(0,250)



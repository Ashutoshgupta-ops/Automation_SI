*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${url}      https://uefa:Games357@gaming-pre.uefa.com/en/uefachampionsleague
${browser}      chrome

*** Test Cases ***
Leagues
        Open Browser    ${url}  ${browser}
        Maximize Browser Window
        Set Selenium Implicit Wait    30s
        Set Selenium Timeout    30s
      #  Sleep    3
        #Cookiee Accept
        Click Button    xpath://*[@id="onetrust-accept-btn-handler"]
       # Sleep    3
        #Login
        Click Element    xpath:/html/body/div[2]/header/div[3]/div/div/pk-button/span
        #Sleep    10
        Wait Until Page Contains    xpath://h1[@id='idp-screens-wrapper-container_content_caption']
    #   Wait Until Page Contains Element    xpath://input[@id='gigya-loginID-75579930407612940']
        #Sleep    10
        Input Text    xpath://input[@id='gigya-loginID-75579930407612940']    pre103@mailinator.com
        #Sleep    3
        Input Text    xpath://input[@id='gigya-password-32665041627364124']    Sportz@2022
        #Sleep    3
        Click Button    xpath://input[@value='Submit']
        #Sleep    3
        #Fantasy Card
    #   Click Element    xpath://div[@aria-label='Open Fantasy Football game']
        Double Click Element    xpath://div[@aria-label='Open Fantasy Football game']
        #Sleep    5
        #cookiee Accept
        Click Button    xpath://*[@id="onetrust-accept-btn-handler"]
        #Sleep    5
        #Leagues
        Click Element    xpath=(//a[normalize-space()='Leagues'])[1]
        #Sleep    3
        #Public League - Join Club Card
     #  Selec  xpath://div[@class='si-dropdown__wrap si-dropdown--secondary si-up ']      Aston Villa
        Click Element    xpath=//div[text()='Select a club']
        
        Click Element    xpath=//a[text()='Arsenal']
        
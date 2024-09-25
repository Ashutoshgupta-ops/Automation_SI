*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${browser}  chrome
${url}  https://uefa:Games357@gaming-pre.uefa.com/en/uefachampionsleague

*** Keywords ***



*** Test Cases ***
Successfull Login Test
        Open Browser    ${url}  ${browser}
        Maximize Browser Window
        Set Selenium Speed    seconds

        #Cookiee Accept
        Click Button    xpath://*[@id="onetrust-accept-btn-handler"]                        #Cookie Accept
        Click Element    xpath:/html/body/div[2]/header/div[3]/div/div/pk-button/span       #Login
      #  Title Should Be    UEFA Champions League - UEFA Gaming - UEFA.com
       # ${input_text}   Set Variable    xpath://input[@id='gigya-loginID-75579930407612940']
        #Sleep    3
        #Element Should Be Enabled    xpath://input[@id='gigya-loginID-75579930407612940']
        #Sleep    3
       # Element Should Be Visible    xpath://input[@id='gigya-loginID-75579930407612940']
        Sleep    3
        Input Text    xpath://input[@id='gigya-loginID-75579930407612940']    pre103@mailinator.com
        Sleep    2
       # Clear Element Text    xpath://input[@id='gigya-loginID-75579930407612940']
       # Sleep    3
        Input Text    xpath://input[@id='gigya-password-32665041627364124']    Sportz@2022
        Click Button    xpath://input[@value='Submit']
        Sleep    3
        Double Click Element    xpath://div[@aria-label='Open Fantasy Football game']          #fantasy Card

TC1
        Open Browser    ${url}  ${browser}
        Maximize Browser Window
        #Set Selenium Speed    5seconds

        #Cookiee Accept
        Click Button    xpath://*[@id="onetrust-accept-btn-handler"]                        #Cookie Accept
        Click Element    xpath:/html/body/div[2]/header/div[3]/div/div/pk-button/span       #Login
      #  Title Should Be    UEFA Champions League - UEFA Gaming - UEFA.com
       # ${input_text}   Set Variable    xpath://input[@id='gigya-loginID-75579930407612940']
        #Sleep    3
        #Element Should Be Enabled    xpath://input[@id='gigya-loginID-75579930407612940']
        #Sleep    3
       # Element Should Be Visible    xpath://input[@id='gigya-loginID-75579930407612940']
        Sleep    3
        Input Text    xpath://input[@id='gigya-loginID-75579930407612940']    pre103@mailinator.com
        Sleep    2
       # Clear Element Text    xpath://input[@id='gigya-loginID-75579930407612940']
       # Sleep    3
        Input Text    xpath://input[@id='gigya-password-32665041627364124']    Sportz@2022
        Click Button    xpath://input[@value='Submit']
        Sleep    3
        Double Click Element    xpath://div[@aria-label='Open Fantasy Football game']          #fantasy Card
       #Click Button    xpath://span[contains(text(), 'Create team')]                   #Lateonbaord feature card
        Click Button    xpath://*[@id="onetrust-accept-btn-handler"]                    #Cookiee Accept
        Sleep    5
        Click Element    xpath://div[@class='si-btn si-btn--neutral'][normalize-space()='Auto-fill']      #Autofill
        Sleep    3
        Click Element    xpath://i[@class='euro-change-player']    #reset
        Sleep    2
        Click Button    xpath://div[contains(text(), 'Yes, reset')]         #reset Confirmation
        Sleep    2
        Click Element    xpath://div[@class='si-btn si-btn--neutral'][normalize-space()='Auto-fill']      #Autofill
        Sleep    2
        Double Click Element    xpath:
        

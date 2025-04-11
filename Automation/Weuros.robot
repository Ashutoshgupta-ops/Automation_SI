*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}  https://uefa:Games357@gaming-pre.uefa.com/en/womenseuro
${url_Create_Team}  https://uefa:Games357@gaming-pre.uefa.com/en/weurofantasy/create-team
${browser}  chrome
${Screenshot_path}  ./WeurosScreenshot

*** Keywords ***
Opensite Prod
      Open Browser       ${url}     ${browser}
      Maximize Browser Window
      Sleep    2
      Click Button    xpath://*[@id="onetrust-accept-btn-handler"]
      ##Close Browser


*** Test Cases ***
TC Create Team
        Open Browser        ${url_Create_Team}      ${browser}
        Maximize Browser Window
        Sleep    2
        Click Button    xpath://*[@id="onetrust-accept-btn-handler"]
        Sleep    10s
       # Click Element    xpath://div[@aria-label='Open Fantasy Football game']      #Quick play Fantasy card
        Wait Until Page Contains Element    xpath://div[@class='si-btn si-btn--primary'][normalize-space()='Auto-fill']     30s
        Click Element    xpath://div[@class='si-btn si-btn--primary'][normalize-space()='Auto-fill']    #autofill
        Click Element    xpath://div[@class='si-btn__wrap si-web-flex']//div[@class='si-btn si-btn--neutral si-btn--sm']    #reset_button
        Capture Page Screenshot
        Sleep    2s
        Click Element    xpath://div[normalize-space()='Yes, reset']        #Yes,reset
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://div[@class='si-btn si-btn--primary'][normalize-space()='Auto-fill']    #autofill
        Execute Javascript  window.scrollBy(0,250)
        Click Element    xpath://span[@class='si-web-flex']     #toogle filter - Opponent
        Capture Page Screenshot
        Sleep    2s
        Click Element    xpath://ul[@class='si-dd--menu']//span[contains(text(),'Date')]    #toogle filter - Date
        Capture Page Screenshot
        Sleep    2s
        Click Element    xpath://div[@class='si-btn si-btn--secondary si-web-flex']     #Continue_button
        Sleep    2s
        Capture Page Screenshot         #Pick youur Starting 11
        Execute Javascript  window.scrollBy(0,250)
        Sleep    2s
        Click Element    xpath://div[@class='si-btn si-btn--primary']       #Continue_button
        Sleep    2s
        Capture Page Screenshot   #Pick your Captain
        Click Element    xpath://body/div[@class='main-wrap thirdparty_page']/div[@class='body']/div[@class='content-wrap']/div[@class='content']/div[@class='main-wrap si-main-wrap']/div[@id='root-ucl-fantasy']/div/div[@id='MainPitchContainer']/div/div/div[@class='si-main-component si-bg--pitch si-bg--center si-captain-wrap']/div[@class='si-container']/div[@class='si-wrap si-sidebar--none']/div[@class='si-pitch__wrap']/div[@class='si-pitch__section']/div[@class='si-pitch']/div[@class='si-pitch--top']/div[1]/div[2]/div[1]/div[1]/div[1]


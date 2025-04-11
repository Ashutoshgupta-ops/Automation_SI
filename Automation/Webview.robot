*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${MOBILE_EMULATION}    deviceName=iPhone XR
${Url}      https://gaming.uefa.com/en/uefachampionsleague

*** Keywords ***
Open Mobile Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${mobile_emulation}=    Create Dictionary    deviceName=iPhone X
    Call Method    ${options}    add_experimental_option    mobileEmulation    ${mobile_emulation}
    Open Browser  ${URL}  ${BROWSER}  options=${options}
Opensite Prod
      Maximize Browser Window
      Sleep    2
      Click Button    xpath://*[@id="onetrust-accept-btn-handler"]

*** Test Cases ***
OPen Mobile view
    [Tags]  MobileView
    Open Mobile Browser
    Opensite Prod
    Sleep    2
    Click Element    xpath://span[contains(text(),'Log in')]
    Sleep    3
    #Execute Javascript  window.scrollBy(0,350)
    Scroll Element Into View    xpath://div[@class='pk-font-size--xs pk-mt--xs']
    Sleep    2
    Input Text    id:gigya-loginID-75579930407612940     prod169@mailinator.com     #ID
    Input Text    xpath://*[@id="gigya-password-32665041627364124"]    Sportz@2022  #pass
    Click Button    xpath://*[@id="gigya-login-form"]/div[4]/div/input      #submit
    Sleep    3
    Execute Javascript  window.scrollBy(0,700)
    Sleep    5
    Capture Page Screenshot
    Execute Javascript  document.querySelector('[api_name="uclfantasy"]').shadowRoot.querySelector("#si-gamercard > div > div > div > div > div.si-card-footer > div > span").click()
    Sleep    2
    Capture Page Screenshot
    Click Element    xpath://div[@class='si-btn si-btn--link']
    Sleep    3
    Capture Page Screenshot
    #Close Browser
TC Login
        Open Mobile Browser
        Opensite Prod
        Sleep    3
        Click Element    xpath://span[contains(text(),'Log in')]    #Right corner Login
        Sleep    2
        Input Text    id:gigya-loginID-75579930407612940     prod170@mailinator.com     #Email
        Sleep    2
        Input Text    xpath://*[@id="gigya-password-32665041627364124"]    Sportz@2022      #Password
        Click Button    xpath://*[@id="gigya-login-form"]/div[4]/div/input      #Submit Button
        Sleep    8
        Capture Page Screenshot
        Sleep    2

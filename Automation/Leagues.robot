*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}  https://gaming.uefa.com/en/uefachampionsleague
${browser}  chrome
${Screenshot_path}  ./Screenshot

*** Keywords ***
Opensite Prod
      Open Browser       ${url}     ${browser}
      Maximize Browser Window
      Sleep    2
      Click Button    xpath://*[@id="onetrust-accept-btn-handler"]
      ##Close Browser

*** Test Cases ***
TC Create Join Delete Leave League
        [Tags]      UCL
        Opensite Prod
        Sleep    3
#Right corner Login
        Click Element    xpath://span[contains(text(),'Log in')]
        Sleep    2
#Email
        Input Text    id:gigya-loginID-75579930407612940     prod211@mailinator.com
        Sleep    2
#Password
        Input Text    xpath://*[@id="gigya-password-32665041627364124"]    Sportz@2022
#Submit Button
        Click Button    xpath://*[@id="gigya-login-form"]/div[4]/div/input
        Sleep    7
        Execute Javascript  window.scrollBy(0,350)
        Sleep    2
        Capture Page Screenshot
        Sleep    2
#Feature card
        Execute Javascript  document.querySelector('[api_name="uclfantasy"]').shadowRoot.querySelector("#si-gamercard > div > div > div > div > div.si-card-footer > div > span").click()
        Sleep    10
        Capture Page Screenshot
        Sleep    2
#Leagues
        Click Element    xpath://a[normalize-space()='Leagues']
        Sleep    2
        Capture Page Screenshot
        Execute Javascript  window.scrollBy(0,200)
#Create League - New
        Click Element   xpath://span[normalize-space()='Create a league']
        Capture Page Screenshot
        Sleep    2
#Enter 24 character Name
        Input Text   xpath://input[@placeholder='Enter league name']    Create league Test Teams
        Capture Page Screenshot
        Sleep    2
#Create League Button
        Click Element    xpath://div[@class='si-btn si-btn--primary ']
        Sleep    2
        Execute Javascript  window.scrollBy(0,200)
        Sleep    5
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://div[@class='si-heading__section']//i[@class='euro-settings']
        Sleep    2
        Click Element    xpath://i[@class='euro-edit']
        Sleep    2
        Clear Element Text    xpath://input[@placeholder='Enter league name']
        Sleep    2
#Edit League Name
        Input Text    xpath://input[@placeholder='Enter league name']    Leagues Test Prod
        Sleep    2
#Done Button
        Click Element    xpath://div[@class='si-btn si-btn--secondary ']
        Capture Page Screenshot
        Sleep    5
        Execute Javascript  window.scrollBy(0,300)
        Sleep    3
        Execute Javascript  window.scrollBy(0,-350)
        Sleep    3
#Back of League Setting
        Click Element    xpath://i[@class='euro-arrow-2']
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,400)
        Sleep    2
#Copy code
        Click Element    xpath://div[@class='si-btn si-btn--copy si-mb-16']
        Capture Page Screenshot
        Sleep    3
#Copy Join Link
        Click Element    xpath://div[@class='si-btn si-btn--copy']
        Capture Page Screenshot
        Sleep    3
        Execute Javascript  window.scrollBy(0,-400)
#Settings icon
        Click Element    xpath://div[@class='si-heading__section']//i[@class='euro-settings']
        Sleep    2
#delete League
        Click Element    xpath://span[normalize-space()='Delete league']
        Capture Page Screenshot
        Sleep    2
#Cancel delete League
        Click Element    xpath://div[@class='si-btn si-btn--outline']
        Sleep    2
#Again Click Delete League
        Click Element    xpath://span[normalize-space()='Delete league']
        Sleep    2
        Capture Page Screenshot
#Yes, delete button
        Click Element    xpath://div[@class='si-btn si-btn--primary']
        Capture Page Screenshot
        Sleep    5
#Join league button
        Click Element    xpath://span[normalize-space()='Join a league']
        Sleep    2
        Input Text    xpath://input[@placeholder='Enter league code']    jgiDtD
        Sleep    2
        Click Element    xpath://div[@class='si-btn si-btn--primary ']
        Sleep    3
        Capture Page Screenshot
        Sleep    2
#Leagues
        Click Element    xpath://a[normalize-space()='Leagues']
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,350)
        Sleep    3
#Public league - world Leaderboard
        Click Element    xpath://h5[normalize-space()='World leaderboard']
        Sleep    3
        Execute Javascript  window.scrollBy(0,250)
        Sleep    3
        Execute Javascript  window.scrollBy(0,-250)
        Sleep    3
        Click Element    xpath://body/div[@class='main-wrap thirdparty_page']/div[@class='body']/div[@class='content-wrap']/div[@class='content']/div[@class='main-wrap si-main-wrap']/div[@id='root-ucl-fantasy']/div/div[@id='MainPitchContainer']/div/div/div[@class='si-main-component si-leagues']/div[@class='si-container']/div[@class='si-leagues__wrap']/div[@class='si-leagues__lb']/div[contains(@class,'si-leaderboard')]/div[@class='si-board-body si-body']/div[1]/div[1]/div[1]
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://a[normalize-space()='Leagues']
        Sleep    2
        Execute Javascript  window.scrollBy(0,500)
        Sleep    2
        Click Element    xpath://div[@class='si-close']
        Sleep    3
        Capture Page Screenshot
#Public leagues - Neutral
        Click Element    xpath://h5[normalize-space()='Neutral']
        Sleep    2
        Execute Javascript  window.scrollBy(0,250)
        Sleep    2
        Execute Javascript  window.scrollBy(0,-250)
        Sleep    3
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://a[normalize-space()='Leagues']
        Sleep    2
        Click Element    xpath://h5[normalize-space()='Apex Legends']
        Sleep    2
        Click Element    xpath://i[contains(@class,'euro-settings')]
        Sleep    3
        Execute Javascript  window.scrollBy(0,150)
        Sleep    2
#Leave League
        Click Element    xpath://span[normalize-space()='Leave league']
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://div[contains(@class,'si-btn si-btn--outline')]     #Leave League - Select NO Option
        Sleep    2
        Capture Page Screenshot
        Click Element    xpath://span[normalize-space()='Leave league']
        Sleep    2
        Click Element    xpath://div[@class='si-btn si-btn--primary']
        Sleep    1
        Capture Page Screenshot
        Sleep    5
      #  Click Element    xpath://span[contains(text(),'Log in')]
      #  Sleep    2
       # Execute Javascript  document.querySelector(".pk-font-size--s.pk-line-height--md.iBXRLAMrXrc98WEE").click()

TC Logout Successfull
        [Tags]      UCL
        Opensite Prod
        Sleep    3
#Right corner Login
        Click Element    xpath://span[contains(text(),'Log in')]
        Sleep    2
#Email
        Input Text    id:gigya-loginID-75579930407612940     prod170@mailinator.com
        Sleep    2
#Password
        Input Text    xpath://*[@id="gigya-password-32665041627364124"]    Sportz@2022
#Submit Button
        Click Button    xpath://*[@id="gigya-login-form"]/div[4]/div/input
        Sleep    7
        Execute Javascript  window.scrollBy(0,350)
        Sleep    2
        Capture Page Screenshot
        Sleep    2
#Feature card
        Execute Javascript  document.querySelector('[api_name="uclfantasy"]').shadowRoot.querySelector("#si-gamercard > div > div > div > div > div.si-card-footer > div > span").click()
        Sleep    3
        Capture Page Screenshot
        Sleep    3
        Execute Javascript  window.scrollBy(0,-100)
        Sleep    2
        Execute Javascript    return document.querySelector(".pk-font-size--s.pk-line-height--md.iBXRLAMrXrc98WEE").click()
        Sleep    2
        Execute Javascript  window.scrollBy(0,200)
        Sleep    2
        Click Element    xpath://body/div[@id='idp-modal-wrapper']/div[1]/div[1]/div[1]/div[1]/div[3]     #logout user
        Sleep    2
        Execute Javascript  window.scrollBy(0,-250)
        Sleep    2

TC Suspend & Unsuspend league
        [Tags]      UCL
        Opensite Prod
        Sleep    3
#Right corner Login
        Click Element    xpath://span[contains(text(),'Log in')]     #login button
        Sleep    2
#Email
        Input Text    id:gigya-loginID-75579930407612940     prod5@mailinator.com
        Sleep    2
#Password
        Input Text    xpath://*[@id="gigya-password-32665041627364124"]    Sportz@2022
#Submit Button
        Click Button    xpath://*[@id="gigya-login-form"]/div[4]/div/input
        Sleep    10
        Click Element    xpath://div[@class='si-btn si-btn--secondary']     #overview - View team
        Sleep    3
        Click Element    xpath://a[normalize-space()='Leagues']
        Sleep    2
        Execute Javascript     window.scrollBy(0,200)
        Sleep    2
        Click Element       xpath://h5[normalize-space()='Party Hawkss']
        Sleep    2
        Click Element    xpath://i[contains(@class,'euro-settings')]
        Sleep    2
        Execute Javascript  window.scrollBy(0,300)
        Sleep    2
        Click Element    xpath=//div[@class='si-suspend-txt' and text()='Suspend']
        Sleep    1
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://div[contains(@class,'si-btn si-btn--primary')]
        Sleep    1
        Capture Page Screenshot
        Sleep    10
        Click Element    xpath=//div[@class='si-suspend-txt' and text()='Unsuspend']
        Sleep    2
        Click Element    xpath://div[@class='si-btn si-btn--primary']
        Sleep    1
        Capture Page Screenshot
        Sleep    10
        Execute Javascript  window.scrollBy(0,-250)
        Sleep    2
        Click Element    xpath://a[normalize-space()='My team']
        Sleep    2





      


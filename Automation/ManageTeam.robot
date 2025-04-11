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
TC Overview
        Opensite Prod
        Sleep    3
        Click Element    xpath://span[contains(text(),'Log in')]        #Right corner Login
        Sleep    2
        Input Text    id:gigya-loginID-75579930407612940     prod170@mailinator.com     #id
        Sleep    2
        Input Text    xpath://*[@id="gigya-password-32665041627364124"]    Sportz@2022      #Password
        Click Button    xpath://*[@id="gigya-login-form"]/div[4]/div/input      #Submit Button
        Sleep    8
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,350)
        Sleep    2
        Capture Page Screenshot
        Sleep    2
#Feature card
        Execute Javascript  document.querySelector('[api_name="uclfantasy"]').shadowRoot.querySelector("#si-gamercard > div > div > div > div > div.si-card-footer > div > span").click()
        Sleep    5
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://a[normalize-space()='Overview']        #Overview
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        #Execute Javascript  window.scrollBy(0,250)
        Scroll Element Into View    xpath://div[@class='si-btn si-btn--secondary']      #View Team
        Sleep    2
        Click Element    xpath://div[@class='si-btn si-btn--secondary']     #View team button
        Sleep    2
        Click Element    xpath://a[normalize-space()='Overview']        #Overview
        Scroll Element Into View    xpath://div[@class='si-btn si-btn--transparent']        #View leagues button
        Capture Page Screenshot     #Leagues card
        Sleep    2
        Execute Javascript  window.scrollBy(0,250)
        Sleep    2
        Capture Page Screenshot     #Matchday card
        Sleep    2
        Execute Javascript  window.scrollBy(0,550)
        Sleep    2
        Capture Page Screenshot     #Stats card
        Sleep    2
        Execute Javascript  window.scrollBy(0,350)
        Sleep    2
        Capture Page Screenshot     #POTM card
        Sleep    2
        Execute Javascript  window.scrollBy(0,450)
        Sleep    2
        Capture Page Screenshot     #Editorial card - News & Tips card
        Sleep    2
        Execute Javascript  window.scrollBy(0,-2350)
        Sleep    2
        Click Element    xpath://div[@class='si-card si-prizes-card ']//div[@class='si-btn si-btn--link'][normalize-space()='View prizes']
        Sleep    3
        Capture Page Screenshot     #Prizes card
        Sleep    2
        Execute Javascript  window.scrollBy(0,2250)
        Sleep    2
        Execute Javascript  window.scrollBy(0,-2250)
        Sleep    2
        Click Element    xpath://a[normalize-space()='Overview']        #overview page
        Sleep    2
        Execute Javascript  window.scrollBy(0,1050)
        Sleep    2
        Click Element    xpath://div[@class='si-btn si-btn--transparent']       #Leagues card : View Leagues button
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,550)
        Sleep    2
        Execute Javascript  window.scrollBy(0,-550)
        Sleep    2
        Click Element    xpath://a[normalize-space()='Overview']
        Sleep    2
        #Execute Javascript  window.scrollBy(0,550)
        Scroll Element Into View    xpath://div[@class='si-btn si-btn--transparent']
        Sleep    3
#Leagues - Next arrow button
        Click Element    xpath://div[@class='si-card si-your-leagues-rank']//div[@aria-label='Next slide']
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://div[@class='si-card si-your-leagues-rank']//div[@aria-label='Next slide']
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://div[@class='swiper-button-prev']
        Sleep    2
        Click Element    xpath://div[@class='swiper-button-prev']
        Sleep    2
        Execute Javascript  window.scrollBy(0,300)
        Sleep    2
        Click Element    xpath://div[@class='si-btn si-btn--outline']       #Scorecard
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://a[normalize-space()='Overview']
        Sleep    2


TC Matches
        Opensite Prod
        Sleep    3
#Right corner Login
        Click Element    xpath://span[contains(text(),'Log in')]
        Sleep    2
#Email
        Input Text    id:gigya-loginID-75579930407612940     prod194@mailinator.com
        Sleep    2
#Password
        Input Text    xpath://*[@id="gigya-password-32665041627364124"]    Sportz@2022
#Submit Button
        Click Button    xpath://*[@id="gigya-login-form"]/div[4]/div/input
        Sleep    8
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,350)
        Sleep    2
        Capture Page Screenshot
        Sleep    2
#Feature card
        Execute Javascript  document.querySelector('[api_name="uclfantasy"]').shadowRoot.querySelector("#si-gamercard > div > div > div > div > div.si-card-footer > div > span").click()
        Sleep    5
        Capture Page Screenshot
        Sleep    2
#My team - Matches
        Execute Javascript  window.scrollBy(0,650)
        Sleep    2
       # Execute Javascript  window.scrollBy(0,250)
       # Sleep    2
        Execute Javascript  window.scrollBy(0,-650)
        Sleep    2
#Matches
        Click Element    xpath://a[@href='//gaming.uefa.com/en/uclfantasy/matches']
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://div[@class='swiper-slide si-tab2List si-active-current-matchDay si-active swiper-slide-active']
        Sleep    2
        Click Element    xpath://div[normalize-space()='Play-off - 1st leg']
        Sleep    2
        Click Element    xpath://div[normalize-space()='Matchday 7']
        Sleep    2
        Capture Page Screenshot
        Sleep    1
        Click Element    xpath://div[@class='swiper-slide si-tab2List swiper-slide-prev']
        Sleep    3
        Click Element    xpath://div[normalize-space()='Matchday 6']
        Sleep    3
        Click Element    xpath://div[normalize-space()='Matchday 4']
        Sleep    3
        Click Element    xpath://div[normalize-space()='Matchday 2']
        Sleep    3
        Click Element    xpath://div[normalize-space()='Matchday 1']
        Sleep    3
        Click Element    xpath://div[normalize-space()='Matchday 5']
        Sleep    3
        Click Element    xpath://div[normalize-space()='Matchday 7']
        Sleep    3
        Click Element    xpath://div[normalize-space()='Play-off - 1st leg']
        Sleep    3
        Click Element    xpath://div[normalize-space()='Round of 16 - 1st leg']
        Sleep    3
        Execute Javascript  window.scrollBy(0,850)
        Sleep    5
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://div[normalize-space()='Matchday 10']
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,150)
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://div[normalize-space()='Matchday 9']
        Sleep    2
        Capture Page Screenshot
        Sleep    2
      #  Execute Javascript  window.scrollBy(0,150)
       # Sleep    3
        Click Element    xpath://div[normalize-space()='Matchday 10']
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://div[normalize-space()='Matchday 11']
        Sleep    2
        Execute Javascript  window.scrollBy(0,-850)
        Sleep    3
        Click Element    xpath://div[normalize-space()='Play-off - 2nd leg']
        Sleep    3
        Click Element    xpath://div[@id='2044484']//span[contains(text(),'Show match details')]
        Sleep    2
        Execute Javascript  window.scrollBy(0,-450)
        Sleep    3
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://span[normalize-space()='Hide match details']
        Sleep    2
        Capture Page Screenshot
        Sleep    3
        Execute Javascript  window.scrollBy(0,850)
        Sleep    3
        Capture Page Screenshot
        Sleep    5
        Execute Javascript  window.scrollBy(0,-850)
        Sleep    2
        Capture Page Screenshot
        Sleep    2



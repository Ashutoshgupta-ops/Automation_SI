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
TC Login
        [Tags]      UCL
        Opensite Prod
        Sleep    3
        Click Element    xpath://span[contains(text(),'Log in')]    #Right corner Login
        Sleep    2
        Input Text    id:gigya-loginID-75579930407612940     prod211@mailinator.com     #Email
        Sleep    2
        Input Text    xpath://*[@id="gigya-password-32665041627364124"]    Sportz@2022      #Password
        Click Button    xpath://*[@id="gigya-login-form"]/div[4]/div/input      #Submit Button
        Sleep    8
        Capture Page Screenshot
        Sleep    2
TC New Login and Create team
        [Tags]      UCL
        Opensite Prod
        Set Selenium Implicit Wait    10s
#Right corner Login
        Click Element    xpath://span[contains(text(),'Log in')]
#Email
        Input Text    id:gigya-loginID-75579930407612940     prod211@mailinator.com
#Password
        Input Text    xpath://*[@id="gigya-password-32665041627364124"]    Sportz@2022
        Click Button    xpath://*[@id="gigya-login-form"]/div[4]/div/input
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,250)
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  document.querySelector('[api_name="uclfantasy"]').shadowRoot.querySelector("#si-gamercard > div > div > div > div > div.si-card-footer > div > span").click()
        Sleep    5
#Autofill button
        Click Element    xpath://div[contains(@class, 'si-btn') and contains(@class, 'si-btn--neutral') and text()='Auto-fill']
        Execute Javascript  window.scrollBy(0,300)
        Sleep    2
        Execute Javascript  window.scrollBy(0,-250)
        Sleep    2
        Capture Page Screenshot
        Sleep    2
#Pick your squad COntinue button
        Click Element    xpath://div[@class='si-btn si-btn--secondary si-web-flex' and text()='Continue']
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,300)
        Sleep    2
        Execute Javascript  window.scrollBy(0,-250)
        Sleep    2
#Pick your Starting 11 - Continue button
        Click Element    xpath://div[@class='si-btn si-btn--primary']
        Sleep    2
        Execute Javascript  window.scrollBy(0,300)
        Sleep    2
        Execute Javascript  window.scrollBy(0,-250)
        Sleep    2
        Capture Page Screenshot
        Sleep    2
#Check your Team - Save anyway button
      #  Click Element    xpath://div[@class='si-btn si-btn--primary']
       # Sleep    2
       # Capture Page Screenshot
       # Sleep    2
#Pick your Captain - Select Captain
        Click Element    xpath://div[@class='si-pitch--top']//div[1]//div[1]//div[1]//div[3]//div[1]
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,300)
        Sleep    2
        Execute Javascript  window.scrollBy(0,-250)
        Sleep    2
#Continue Button
        Click Element    xpath://div[@class='si-btn si-btn--primary']
        Sleep    2
        Capture Page Screenshot
        Sleep    2
#Name your Team
        Input Text    xpath://input[@placeholder='Enter team name']    Prod 210 team
        Sleep    2
        Capture Page Screenshot
        Sleep    2
#Continue Button
        Click Element    xpath://div[@class='si-btn si-btn--secondary']
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,300)
        Sleep    2
        Execute Javascript  window.scrollBy(0,-300)
        Sleep    2
#Save Your Team 
        Click Element    xpath://div[@class='si-btn si-btn--secondary']
        Sleep    3
      #  Execute Javascript  window.scrollBy(0,-300)
        Sleep    2
        Capture Page Screenshot
        Sleep    2
TC Create New Account
        Opensite Prod
        Sleep    3
        #Execute Javascript  window.scrollBy(0,750)
        #Capture Page Screenshot
        #Sleep    3
        Click Element    xpath://span[contains(text(),'Log in')]
        Sleep    2
        Execute Javascript  window.scrollBy(0,250)
        Sleep    2
        Click Element    xpath://a[normalize-space()='Create your UEFA account']
        Sleep    3
        #facebook
        #Click Element    xpath://div[contains(text(),'Sign in with Facebook')]
        #Google
        #Click Element    xpath://div[contains(text(),'Sign in with Google')]
        #Apple
        #Click Element    xpath://div[contains(text(),'Sign in with Apple')]
        #Sleep    2
        Input Text    xpath://*[@id="gigya-textbox-75074230944436030"]       prod203@mailinator.com
        Sleep    3
        Input Text    xpath://input[@id='gigya-password-59919533498235100']     Sportz@2022
        Sleep    3
        Input Text    xpath://input[@id='gigya-textbox-130722358975432270']    Prod203
        Sleep    3
        Input Text    xpath://input[@id='gigya-textbox-30497114450394400']    Ash
        Sleep    2
        #Execute Javascript  window.scrollBy(0,500)
        Scroll Element Into View    xpath://input[@value='Create account']
        #Scroll Element Into View    xpath://span[normalize-space()='Already have an account?']
        Sleep    2
        Input Text    xpath://input[@id='gigya-textbox-88315185881230510']    01
        Sleep    2
        Input Text    xpath://input[@id='gigya-textbox-105406014904922500']    01
        Sleep    2
        Input Text    xpath://input[@id='gigya-textbox-32538633360993784']    1991
        Sleep    2
        #Accept terms & condition
        Execute Javascript      document.querySelector("label[for='gigya-checkbox-terms']").click()
        Sleep    5
        #Receive emails & highlights
        #Wait Until Page Contains Element    path://span[@class="gigya-label-text gigya-checkbox-text"]      10s
        Click Element    xpath://label[@for='gigya-checkbox-75848120112080240']
        Sleep    2
        Click Button    xpath://input[@value='Create account']
        Sleep    50


TC Create Team without Login
        Opensite Prod
        Sleep    2
        Execute Javascript  window.scrollBy(0,800)
        Sleep    5
#Feature card
        Execute Javascript  document.querySelector('[api_name="uclfantasy"]').shadowRoot.querySelector("#si-gamercard > div > div > div > div > div.si-card-footer > div > span").click()
        Sleep    3
        Page Should Contain Element    xpath://h2[normalize-space()='Pick your squad']
        Log    Pick your squad      console=True
        Sleep    2
#Pick your Squad - autofill button
        Click Element    xpath://div[contains(@class, 'si-btn') and contains(@class, 'si-btn--neutral') and text()='Auto-fill']
        Execute Javascript  window.scrollBy(0,300)
        Sleep    5
        Execute Javascript  window.scrollBy(0,-300)
#reset
        Click Element    xpath://div[@class='si-btn__wrap si-web-flex']//i[@class='euro-change-player']
        Sleep    2
#confirm reset
        Click Element    xpath://div[normalize-space()='Yes, reset']
        Sleep    2
#autofill
        Click Element    xpath://div[contains(@class, 'si-btn') and contains(@class, 'si-btn--neutral') and text()='Auto-fill']
        Sleep    2
#News & tips
        Click Element    xpath://a[normalize-space()='News & tips']
        Sleep    2
#Rules page
        Click Element    xpath://a[normalize-space()='Rules']
        Sleep    2
        Click Element    xpath://div[contains(text(),'Read the rules')]
        Sleep    2
        Page Should Contain Element    xpath://h1[contains(text(),'UEFA Champions League Fantasy Football rules 2024/')]
        Log    UEFA Champions League Fantasy Football rules 2024/25     console=True
        Sleep    2
#Prizes page
        Click Element    xpath://a[normalize-space()='Prizes']
        Sleep    2
        Click Element    xpath://div[@class='si-btn si-btn--secondary']
       # Page Should Contain Element    xpath:(//h1[contains(text(),'Prizes for 2024/25 Champions League Fantasy Footba')])[1]
       # Log    Prizes for 2024/25 Champions League Fantasy Football     console=True
        Sleep    2
#Create team
        Click Element    xpath://a[normalize-space()='Create team']
        Sleep    3
#Scroll UP
        Execute Javascript  window.scrollBy(0,600)
        Sleep    3
#scroll down
        Execute Javascript  window.scrollBy(0,-600)
        Sleep    2
#reset button
        Click Element    xpath://div[@class='si-btn__wrap si-web-flex']//i[@class='euro-change-player']
        Sleep    2
#NO reset
        Click Element    xpath://div[@class='si-btn si-btn--outline']
        Sleep    2
#Scroll up
        Execute Javascript  window.scrollBy(0,600)
        Sleep    3
#Pick your squad COntinue button
        Click Element    xpath://div[@class='si-btn si-btn--secondary si-web-flex' and text()='Continue']
        Sleep    3
#scroll down
        Execute Javascript  window.scrollBy(0,-600)
        Sleep    3
#Back arrow
        Click Element    xpath://i[@class='euro-arrow-2']
        Sleep    2
        Execute Javascript  window.scrollBy(0,350)
        Sleep    2
#Toogle
        Wait Until Element Is Visible    xpath://span[@class='si-web-flex' and text()='Price']
        Click Element    xpath://span[@class='si-web-flex']
        Sleep    2
        Click Element    xpath://span[normalize-space()='Opponent']
        Sleep    2
        Click Element    xpath://span[@class='si-web-flex' ]
        Sleep    2
        Click Element    xpath://ul[@class='si-dd--menu']//span[contains(text(),'Date')]
        Sleep    2
        Click Element    xpath://span[@class='si-web-flex']
        Sleep    2
        Click Element    xpath://span[normalize-space()='Total points']
        Sleep    2
#Pick your squad - Continue button
        Click Element    xpath://div[@class='si-btn si-btn--secondary si-web-flex']
        Sleep    2
        Execute Javascript  window.scrollBy(0,350)
        Sleep    2
#Pick your Starting 11 - Continue button
        Click Element    xpath://div[@class='si-btn si-btn--primary']
        Sleep    2
#Check your Team - Save anyway button
        Click Element    xpath://div[@class='si-btn si-btn--primary']
        Sleep    2
#Pick your Captain - Select Captain
        Click Element    xpath://div[@class='si-pitch--top']//div[1]//div[1]//div[1]//div[3]//div[1]
        Sleep    2
#Continue Button
        Click Element    xpath://div[@class='si-btn si-btn--primary']
        Sleep    2
#Name your Team
        Input Text    xpath://input[@placeholder='Enter team name']    Prod test team
        Sleep    2
#Continue Button
        Click Element    xpath://div[@class='si-btn si-btn--secondary']
#Save Your Team - Already have an account
        Wait Until Element Is Visible    xpath=//div[@class='si-btn si-btn--outline' and text()='I already have an account']
        Click Element    xpath=//div[@class='si-btn si-btn--outline' and text()='I already have an account']
        #Click Element    xpath://div[@class='si-btn si-btn--outline']
        Sleep    3
#Email-ID
        Input Text    xpath://input[@id='gigya-loginID-75579930407612940']    prod155@mailinator.com
        Sleep    2
#password
        Input Text    xpath://input[@id='gigya-password-32665041627364124']    Sportz@2022
        Sleep    2
#Submit button
        Click Element    xpath://input[@value='Submit']
        Sleep    10

TC Leagues
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
        Sleep    10
        Execute Javascript  window.scrollBy(0,550)
        Sleep    2
        Capture Page Screenshot
        Sleep    2
#Feature card
        Execute Javascript  document.querySelector('[api_name="uclfantasy"]').shadowRoot.querySelector("#si-gamercard > div > div > div > div > div.si-card-footer > div > span").click()
        Sleep    10
        Capture Page Screenshot
        Sleep    5
#Leagues
        Click Element    xpath://a[normalize-space()='Leagues']
        Sleep    2
        Capture Page Screenshot
        Execute Javascript  window.scrollBy(0,300)
#Create League - New
        Click Element   xpath://div[@class='si-card']//div[2]//div[1]
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
        Input Text    xpath://input[@placeholder='Enter league name']    Leagues Create Test
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
        Capture Page Screenshot
#Yes, delete button
        Click Element    xpath://div[@class='si-btn si-btn--primary']
        Capture Page Screenshot
        Sleep    2
#Join league button
        Click Element    xpath://span[normalize-space()='Join']
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
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://a[normalize-space()='Leagues']
        Sleep    2
        Execute Javascript  window.scrollBy(0,500)
        Sleep    2
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
#Leave League - Select NO Option
        Click Element    xpath://div[contains(@class,'si-btn si-btn--outline')]
        Sleep    2
        Capture Page Screenshot
        Click Element    xpath://span[normalize-space()='Leave league']
        Sleep    2
        Click Element    xpath://div[@class='si-btn si-btn--primary']
        Sleep    2
        Capture Page Screenshot

TC Matches
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
        Sleep    8
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,550)
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
        Click Element    xpath://div[@class='swiper-slide si-tab2List si-live']
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
        Execute Javascript  window.scrollBy(0,750)
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
        Execute Javascript  window.scrollBy(0,-750)
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

TC Leagues navigation
        Opensite Prod
        Sleep    3
        Click Element    xpath://span[contains(text(),'Log in')]        #Right corner Login
        Sleep    2
        Input Text    id:gigya-loginID-75579930407612940     prod190@mailinator.com     #id
        Sleep    2
        Input Text    xpath://*[@id="gigya-password-32665041627364124"]    Sportz@2022      #Password
        Click Button    xpath://*[@id="gigya-login-form"]/div[4]/div/input      #Submit Button
        Sleep    8
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,550)
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  document.querySelector('[api_name="uclfantasy"]').shadowRoot.querySelector("#si-gamercard > div > div > div > div > div.si-card-footer > div > span").click()
        Sleep    5
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://a[normalize-space()='Overview']        #Overview
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        #Execute Javascript  window.scrollBy(0,250)
        Scroll Element Into View    xpath://div[@class='si-btn si-btn--transparent']
        Sleep    5
TC Stats
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
        Execute Javascript  window.scrollBy(0,550)
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  document.querySelector('[api_name="uclfantasy"]').shadowRoot.querySelector("#si-gamercard > div > div > div > div > div.si-card-footer > div > span").click()
        Sleep    5
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://a[normalize-space()='Overview']        #Overview
        Sleep    2
        Capture Page Screenshot
        Sleep    2
        #Execute Javascript  window.scrollBy(0,250)
        Scroll Element Into View    xpath://div[@class='swiper-slide swiper-slide-active']//a[contains(text(),'Show more')]
        Sleep    2
        Click Element    xpath://div[@class='swiper-slide swiper-slide-active']//a[contains(text(),'Show more')]
        Sleep    2
        Scroll Element Into View    xpath://div[@class='si-heading__title']
        Execute Javascript  window.scrollBy(0,250)
        Capture Page Screenshot
        Click Element    xpath://div[@class='swiper-slide si-tab2List swiper-slide-next']
        Sleep    2
        Click Element    xpath://div[normalize-space()='Total team points']
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,1050)
        Sleep    2
        Execute Javascript  window.scrollBy(0,-1050)
        Sleep    2
        Click Element    xpath://div[normalize-space()='Goals']
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,1050)
        Sleep    2
        Execute Javascript  window.scrollBy(0,-1050)
        Sleep    2
        Click Element    xpath://div[normalize-space()='Assists']
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,1050)
        Sleep    2
        Execute Javascript  window.scrollBy(0,-1050)
        Sleep    2
        Click Element    xpath://div[normalize-space()='Most points in a match']
        Capture Page Screenshot
        Sleep    2
        Execute Javascript  window.scrollBy(0,1050)
        Sleep    2
        Execute Javascript  window.scrollBy(0,-1050)
        Sleep    2
        Click Element    xpath://a[normalize-space()='Overview']
        Capture Page Screenshot
        Sleep    2


Test Overview editorial
        Click Element    xpath://div[@class='si-btn si-btn--link'][normalize-space()='View all news']
        Capture Page Screenshot
        Sleep    2
        Click Element    xpath://div[@class='si-editorial__col si-editorial--wide']//h3[@class='si-article-desc'][normalize-space()='Fantasy: Popular picks, differentials']
        Sleep    2
        Execute Javascript  window.scrollBy(0,1050)
        Sleep    2
        Scroll Element Into View    xpath://div[@class='article_footer_content']    #footer page
        Sleep    2
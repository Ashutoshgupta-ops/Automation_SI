*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${Browser}      chrome
${url}      https://gaming-pre.uefa.com/en/uclfantasy/create-team
${Login}     xpath://a[@class='ico-login']

*** Keywords ***


*** Test Cases ***
Create Team
    Open Browser        ${url}      ${Browser}
    Maximize Browser Window
    ##Run Keyword And Ignore Error    Click Element   //div[@contain='Accept all']
    Click Element    //div[@class="si-btn si-btn--neutral"]
    Click Element    //div[class="si-btn si-btn--neutral si-btn--sm"]        ##reset
    Click Element    //div[class="si-btn si-btn--primary"]                   ## Reset Option
    Click Element    //div[@class="si-btn si-btn--neutral"]                  ##Autofill
    Click Element    //div[@class="si-btn si-btn--primary"]                  ##Pick ur Squad - COntinue
    Click Element    //div[@class="si-btn si-btn--primary"]                  ##Pick Your 11
    Run Keyword And Ignore Error    Click Element    //div[@class="si-btn si-btn--primary"]

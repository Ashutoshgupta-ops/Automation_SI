*** Settings ***
Library     AppiumLibrary

Test Teardown       Close Application
*** Keywords ***
Wait And Click Element
    [Arguments]     ${locator}
    Wait Until Page Contains Element    ${locator}
    Click Element    ${locator}
Launch App
        Open Application    remote_url=http://localhost:4723     platformName=android
    ...     devicename=Oneplus      app=${EXECDIR}${/}app${/}uefa-gaming-10.3.0-127910174-pre.apk
    ...     automationName=UiAutomator2     udid=emulator-5554
    Set Appium Timeout    30s
Login
    Wait Until Page Contains Element    //android.widget.TextView[@text="Let's start"]
    Click Element    //android.widget.TextView[@text="Let's start"]

    Wait Until Page Contains Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_allow_all"]
    Click Element       //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_allow_all"]

    #Hamburger
    Wait And Click Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Sleep    2

    #Fantasy Football
    Wait And Click Element   //android.widget.TextView[@text="Fantasy Football"]
    Sleep    5

    #Log in to play
    Wait Until Page Contains Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_login_to_play"]
    Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_login_to_play"]
    Sleep    5

    Swipe By Percent    50    40    50    70

    Wait And Click Element    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]
    Input Text    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]    pre103@mailinator.com

    #pass
    Wait And Click Element    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]
    Input Text    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]    Sportz@2022

    Swipe By Percent    80    10    90    50

    #submit button
    Wait Until Page Contains Element    //android.widget.Button[@text="Submit"]
    Click Element    //android.widget.Button[@text="Submit"]

    Swipe By Percent    50    50    50    90
    Sleep    10s


Create Team Test
       Launch App
       Login
       Set Appium Timeout    20s
       #Autofill
       Wait Until Page Contains Element    xpath=//android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_auto_complete"]
       #continue
       Wait Until Page Contains Element    xpath=//android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_search_player"]
       #
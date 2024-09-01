*** Settings ***
Library     AppiumLibrary

Test Teardown       Close Application

*** Test Cases ***
TC1 Android Automation
  &{option}       Create Dictionary       projectName=FirstProject    buildName=Uefa_pre
   ...     sessionName=day2    userName=ashutoshgupta_JgWpdD    accessKey=YJx3huDhyGjr6XMqsuqb

   Open Application    remote_url=http://hub.browserstack.com/wd/hub
        ...     platformName=android    automationName=UiAutomator2    deviceName=OnePlus 9
        ...     platformVersion=11.0     bstack:options=&{option}
        ...     app=bs://1c642c0a0b037d2097fd25d2555efe852864e3c0
        ...     appiumVersion=2.11.3

    Set Appium Timeout    20s


    Wait Until Page Contains Element    //android.widget.TextView[@text="Let's start"]
    Click Element    //android.widget.TextView[@text="Let's start"]

    Wait Until Page Contains Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_allow_all"]
    Click Element       //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_allow_all"]

    Wait Until Page Contains Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Click Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[1]/android.widget.Button

    Wait Until Page Contains Element    //android.widget.TextView[@text="Fantasy Football"]
    Click Element    //android.widget.TextView[@text="Fantasy Football"]

#    Wait Until Page Contains Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_login_to_play"]
#    Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_login_to_play"]

    Wait Until Page Contains Element    //*[contains(@text,'Log in to')]
    Click Element    //*[contains(@text,'Log in to')]


    Wait Until Page Contains Element    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]
    Input Text    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]    pre103@mailinator.com

    Sleep    5s

    ${output}       Run Keyword And Ignore Error         Input Text    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]    Sportz@2022

    WHILE    '${output}[0]'=='FAIL'
         Swipe    915    2177    934    1298
         ${output}       Run Keyword And Ignore Error         Input Text    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]    Sportz@2022

    END

    Wait Until Page Contains Element    //android.widget.Button[@text="Submit"]
    Click Element    //android.widget.Button[@text="Submit"]

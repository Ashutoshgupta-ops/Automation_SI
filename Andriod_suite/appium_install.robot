*** Settings ***
Library     AppiumLibrary

Test Teardown       Close Application
*** Keywords ***
Wait And Click Element
    [Arguments]     ${locator}
    Wait Until Page Contains Element    ${locator}
    Click Element    ${locator}


*** Test Cases ***
TC1
    Log To Console    ${EXECDIR}
    Log To Console    ${CURDIR}
    Log To Console    ${OUTPUT_DIR}
    Log To Console    ${TEMPDIR}
    Log To Console    ${SUITE_NAME}
    Log To Console    ${TEST_NAME}

TC2
    Open Application    remote_url=http://localhost:4723     platformName=android
    ...     devicename=Pixel 8      app=${EXECDIR}${/}app${/}khan-academy-7-3-2.apk
    ...     automationName=UiAutomator2     udid=8d4cdc2f

    Log Source

    Set Appium Timeout    10s

       Wait Until Page Contains Element    //android.widget.TextView[@text="Dismiss"]
    Click Element    //android.widget.TextView[@text="Dismiss"]
    
    Wait Until Page Contains Element    //android.widget.TextView[@text="Sign in"]
    Click Element    //android.widget.TextView[@text="Sign in"]


    [Teardown]      Close Application

TC3
    Open Application    remote_url=http://localhost:4723     platformName=android
    ...     devicename=Oneplus      app=${EXECDIR}${/}app${/}uefa-gaming-10.1.0-125045098-pre.apk
    ...     automationName=UiAutomator2     udid=8d4cdc2f
    Set Appium Timeout    30s
#    Install App    app_path=${EXECDIR}${/}app${/}uefa-gaming-10.1.0-125045098-pre.apk        app_package=com.uefa.eurofantasy.adhoc

#    Activate Application    app_id=com.uefa.eurofantasy.adhoc

    Wait Until Page Contains Element    //android.widget.TextView[@text="Let's start"]
    Click Element    //android.widget.TextView[@text="Let's start"]

    Wait Until Page Contains Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_allow_all"]
    Click Element       //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_allow_all"]


    Wait Until Page Contains Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Click Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Sleep    5s
	Wait Until Page Contains Element    //android.widget.TextView[@text="Already have an account? Log in"]
#    Click Element       //android.widget.TextView[@text="Already have an account? Log in"]
    Tap    xpath=//android.widget.TextView[contains(@text,"Log in")]    count=4
 
    Wait Until Page Contains Element    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]
    Input Text    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]    pre103@mailinator.com

    Wait Until Page Contains Element    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]
    Input Text    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]   Sportz@2022

    Wait Until Page Contains Element    //android.widget.Button[@text="Submit"]
    Click Element    //android.widget.Button[@text="Submit"]

Login GH app
    Open Application    remote_url=http://localhost:4723     platformName=android
    ...     devicename=Oneplus      app=${EXECDIR}${/}app${/}uefa-gaming-10.1.0-125045098-pre.apk
    ...     automationName=UiAutomator2     udid=8d4cdc2f
        
    Set Appium Timeout    20s
    
#xpath=//*

    Wait Until Page Contains Element    //android.widget.TextView[@text="Let's start"]
    Click Element    //android.widget.TextView[@text="Let's start"]

    Wait Until Page Contains Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_allow_all"]
    Click Element       //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_allow_all"]

    Wait Until Page Contains Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Click Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[1]/android.widget.Button

#    Wait Until Page Contains Element    //android.widget.TextView[@text="Already have an account? Log in"]
#   Click Element    //android.widget.TextView[@text="Already have an account? Log in"]
    
    Wait Until Page Contains Element    //android.widget.TextView[@text="Fantasy Football"]
    Click Element    //android.widget.TextView[@text="Fantasy Football"]

    Wait Until Page Contains Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_login_to_play"]
    Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_login_to_play"]


    Wait Until Page Contains Element    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]
    Input Text    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]    pre103@mailinator.com

   # Run Keyword And Ignore Error    Wait Until Page Contains Element    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]
   # This is used to pass the popup which comes sometimes or not

    Sleep    5s

    ${output}       Run Keyword And Ignore Error         Input Text    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]    Sportz@2022

    WHILE    '${output}[0]'=='FAIL'
         Swipe    915    2177    934    1298
         ${output}       Run Keyword And Ignore Error         Input Text    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]    Sportz@2022

    END

    #Wait Until Page Contains Element    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]
    #Input Text    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]    Sportz@2022

    Wait Until Page Contains Element    //android.widget.Button[@text="Submit"]
    Click Element    //android.widget.Button[@text="Submit"]

    #Overview
    Wait Until Page Contains Element        //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_view_team"]
    Click Element       //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_view_team"]
    Sleep    5s
    @{firstFinger}	create list	${815}	${1517}


    Tap with Positions	${1000}	    ${firstFinger}

    #My Team
    Wait Until Page Contains Element    //android.view.ViewGroup[@resource-id="com.uefa.eurofantasy.adhoc:id/toolbar"]/android.widget.ImageButton
    Click Element    //android.view.ViewGroup[@resource-id="com.uefa.eurofantasy.adhoc:id/toolbar"]/android.widget.ImageButton


    #Home   
#    Wait Until Page Contains Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]
#    Click Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]
#    Wait And Click Element      //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]

    Wait And Click Element      //android.widget.TextView[@text="Home"]
    
    Sleep   5s

    ${output}       Run Keyword And Ignore Error    Click Element    //android.widget.TextView[@text="View team"]

    WHILE    '${output}[0]'== 'FAIL'
        Swipe    903    2204    897    1189
        ${output}       Run Keyword And Ignore Error    Click Element    //android.widget.TextView[@text="View team"]
    END

    
    Wait And Click Element    //android.widget.TextView[@text="View team"]

Subs
    Open Application    remote_url=http://localhost:4723     platformName=android
    ...     devicename=Oneplus      app=${EXECDIR}${/}app${/}uefa-gaming-10.1.0-125045098-pre.apk
    ...     automationName=UiAutomator2     udid=8d4cdc2f

    Set Appium Timeout    20s

#xpath=//*

    Wait Until Page Contains Element    //android.widget.TextView[@text="Let's start"]
    Click Element    //android.widget.TextView[@text="Let's start"]

    Wait Until Page Contains Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_allow_all"]
    Click Element       //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_allow_all"]

    Wait Until Page Contains Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Click Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[1]/android.widget.Button

#    Wait Until Page Contains Element    //android.widget.TextView[@text="Already have an account? Log in"]
#   Click Element    //android.widget.TextView[@text="Already have an account? Log in"]

    Wait Until Page Contains Element    //android.widget.TextView[@text="Fantasy Football"]
    Click Element    //android.widget.TextView[@text="Fantasy Football"]

    Wait Until Page Contains Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_login_to_play"]
    Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_login_to_play"]


    Wait Until Page Contains Element    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]
    Input Text    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]    pre103@mailinator.com

   # Run Keyword And Ignore Error    Wait Until Page Contains Element    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]
   # This is used to pass the popup which comes sometimes or not

    Sleep    5s

    ${output}       Run Keyword And Ignore Error         Input Text    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]    Sportz@2022

    WHILE    '${output}[0]'=='FAIL'
         Swipe    915    2177    934    1298
         ${output}       Run Keyword And Ignore Error         Input Text    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]    Sportz@2022

    END

    #Wait Until Page Contains Element    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]
    #Input Text    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]    Sportz@2022

    Wait Until Page Contains Element    //android.widget.Button[@text="Submit"]
    Click Element    //android.widget.Button[@text="Submit"]

    #Overview
    Wait Until Page Contains Element        //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_view_team"]
    Click Element       //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_view_team"]
    Sleep    5s
    @{firstFinger}	create list	${815}	${1517}


    Tap with Positions	${1000}	    ${firstFinger}

    #My Team
    Wait Until Page Contains Element    //android.view.ViewGroup[@resource-id="com.uefa.eurofantasy.adhoc:id/toolbar"]/android.widget.ImageButton
    Click Element    //android.view.ViewGroup[@resource-id="com.uefa.eurofantasy.adhoc:id/toolbar"]/android.widget.ImageButton


    #Home
#    Wait Until Page Contains Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]
#    Click Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]
#    Wait And Click Element      //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[2]/android.view.View[2]

    Wait And Click Element      //android.widget.TextView[@text="Home"]

    Sleep   5s

#    ${output}       Run Keyword And Ignore Error    Click Element    //android.widget.TextView[@text="View team"]
#
#    WHILE    '${output}[0]'== 'FAIL'
#        Swipe    903    2204    897    1189
#        ${output}       Run Keyword And Ignore Error    Click Element    //android.widget.TextView[@text="View team"]
#    END

#or use scroll to element

    &{scroll_arg}       Create Dictionary       strategy=-android uiautomator       selector=UiSelector().text("View team")
    Execute Script    mobile: scroll        &{scroll_arg}
    Click Element    //android.widget.TextView[@text="View team"]

   # Wait And Click Element    //android.widget.TextView[@text="View team"]

#Subs BUtton
    Wait And Click Element    xpath=//android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_subs"]
#On player
    Wait And Click Element      xpath=(//android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/iv_jersey"])[9]

#Subsout icon
    Sleep  5s
    Wait And Click Element    xpath=(//android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/iv_btn_icon"])[2]
#Bench Player
    Wait And Click Element    xpath=(//android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/iv_jersey"])[12]
#Sub in
    Wait And Click Element    xpath=//android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/iv_btn_icon"]
#Confirm Subs
    Wait And Click Element    xpath=//android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_next"]


Transfers
    Open Application    remote_url=http://localhost:4723     platformName=android
    ...     devicename=Pixel      app=${EXECDIR}${/}app${/}uefa-gaming-10.1.0-125045098-pre.apk
    ...     automationName=UiAutomator2     udid=emulator-5556



    Set Appium Timeout    20s

    Wait Until Page Contains Element    //android.widget.TextView[@text="Let's start"]
    Click Element    //android.widget.TextView[@text="Let's start"]

    Wait Until Page Contains Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_allow_all"]
    Click Element       //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_allow_all"]

    Wait Until Page Contains Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Click Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[1]/android.widget.Button


    Wait Until Page Contains Element    //android.widget.TextView[@text="Fantasy Football"]
    Click Element    //android.widget.TextView[@text="Fantasy Football"]

    Wait Until Page Contains Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_login_to_play"]
    Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_login_to_play"]


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

    #Overview
    Wait Until Page Contains Element        //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_view_team"]
    Click Element       //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_view_team"]
    Sleep    5s
    @{firstFinger}	create list	${815}	${1517}


    Tap with Positions	${1000}	    ${firstFinger}

    #My Team
    Wait Until Page Contains Element    //android.view.ViewGroup[@resource-id="com.uefa.eurofantasy.adhoc:id/toolbar"]/android.widget.ImageButton
    Click Element    //android.view.ViewGroup[@resource-id="com.uefa.eurofantasy.adhoc:id/toolbar"]/android.widget.ImageButton


    #Home

    Wait And Click Element      //android.widget.TextView[@text="Home"]

    Sleep   5s

    &{scroll_arg}       Create Dictionary       strategy=-android uiautomator       selector=UiSelector().text("View team")
    Execute Script    mobile: scroll        &{scroll_arg}
    Click Element    //android.widget.TextView[@text="View team"]

#transfer button
    Wait And Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_transfer"]
#on Player
    Wait And Click Element    xpath=(//android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/iv_remove"])[7]
#transfer out
    Wait And Click Element    //android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/iv_btn_icon"]
#another player
    Wait And Click Element    xpath=(//android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/iv_remove"])[10]
#transfer out
    Wait And Click Element    //androidx.recyclerview.widget.RecyclerView[@resource-id="com.uefa.eurofantasy.adhoc:id/rv_player_profile_btns"]/android.view.ViewGroup
#autofill
    Wait And Click Element    //android.widget.ImageButton[@resource-id="com.uefa.eurofantasy.adhoc:id/iBtn_auto_complete"]
#Next button
    Wait And Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_search_player"]
#confirm transfer button
    Wait And Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_confirm_transfer"]
#transfer BUtton
    Wait And Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_transfer"]
#on Player
    Wait And Click Element    xpath=(//android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/iv_remove"])[7]
#transfer out
    Wait And Click Element    //android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/iv_btn_icon"]
#another player
    Wait And Click Element    xpath=(//android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/iv_remove"])[10]
#transfer out
    Wait And Click Element    //androidx.recyclerview.widget.RecyclerView[@resource-id="com.uefa.eurofantasy.adhoc:id/rv_player_profile_btns"]/android.view.ViewGroup
#Back BUtton
    Wait And Click Element    //android.view.ViewGroup[@resource-id="com.uefa.eurofantasy.adhoc:id/toolbar"]/android.widget.ImageButton
#Reset Team
    Wait And Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_primary"]
    Sleep    5s



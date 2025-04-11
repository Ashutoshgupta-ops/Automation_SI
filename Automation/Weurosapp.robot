*** Settings ***
Library     AppiumLibrary
Library    Process

Suite Setup     Start Process       appium -a localhost -p 5252 --session-override
    ...     shell=True      alias=appiumserver
    ...     stdout=${CURDIR}/appium_stdout.txt  stderr=${CURDIR}/appium_stderr.txt

Suite Teardown   Terminate Process


Test Teardown       Close Application
*** Keywords ***
Wait And Click Element
    [Arguments]     ${locator}
    Wait Until Page Contains Element    ${locator}
    Click Element    ${locator}`


*** Test Cases ***
TC1 - Launch application
                Open Application    remote_url=http://localhost:5252     platformName=android
    ...     devicename=vivo 1723      app=${EXECDIR}${/}app${/}uefa-gaming-10.7.1-143163962-pre.apk
    ...     automationName=UiAutomator2     udid=af1f9b67

        Set Appium Timeout    20s

TC2 - Successfull login
        Open Application    remote_url=http://localhost:5252     platformName=android
    ...     devicename=vivo 1723      app=${EXECDIR}${/}app${/}uefa-gaming-10.7.1-143163962-pre.apk
    ...     automationName=UiAutomator2     udid=af1f9b67

        #Set Appium Timeout    20s

        Click Element    //android.widget.TextView[@text="Let's start"]
        Sleep    3
        #Save Setting
        Click Element    //android.widget.ImageView[@content-desc="Close"]
        Sleep    3
        #Hamburger
        Click Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.Button
        Sleep    5
        Click Element    //android.widget.ScrollView/android.widget.ImageView[5]
        Sleep    3
        Click Element    //android.widget.TextView[@text="Home"]
        Sleep    7
        #Feature card
        Click Element    //android.widget.TextView[@text="Create team"]
        Sleep    10
        Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_login_to_play"]
        Sleep    5
        ${output}       Run Keyword And Ignore Error         Input Text    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]    pre120@mailinator.com

         WHILE    '${output}[0]'=='FAIL'
                Swipe    536    1982    619    913
                ${output}       Run Keyword And Ignore Error         Input Text    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]    pre120@mailinator.com

         END
         Input Text    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]    Sportz@2022
         Sleep    2
         Click Element    //android.widget.Button[@text="Submit"]
         Sleep    10


TC - Different logins
        Click Element    //android.widget.Button[@text="Sign in with Facebook"]
        Sleep    2
        Click Element    //android.widget.ImageButton[@content-desc="Close tab"]
        Sleep    5
        Click Element    //android.widget.Button[@text="Sign in with Google"]
        Sleep    2
        Click Element    (//android.widget.ImageView[@resource-id="com.google.android.gms:id/og_apd_internal_image_view"])[1]       #click 1st email id
        Sleep    10
        Click Element    //android.widget.ImageButton[@content-desc="Navigate up"]      #back to previous page
        Sleep    3
        Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_login_to_play"]
        Sleep    5
        #Click Element    //android.widget.Button[@text="Sign in with Apple"]
        Sleep    3

TC3 - Logged out successfull

         Open Application    remote_url=http://localhost:5252     platformName=android
    ...     devicename=vivo 1723      app=${EXECDIR}${/}app${/}uefa-gaming-10.7.1-143163962-pre.apk
    ...     automationName=UiAutomator2     udid=af1f9b67

        #Set Appium Timeout    20s

        Click Element    //android.widget.TextView[@text="Let's start"]
        Sleep    3
        #Save Setting
        Click Element    //android.widget.ImageView[@content-desc="Close"]
        Sleep    3
        #Hamburger
        Click Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.Button
        Sleep    5
        Click Element    //android.widget.ScrollView/android.widget.ImageView[5]
        Sleep    3
        Click Element    //android.widget.TextView[@text="Home"]
        Sleep    7
        #Feature card
        Click Element    //android.widget.TextView[@text="Create team"]
        Sleep    10
        Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_login_to_play"]
        Sleep    5
        ${output}       Run Keyword And Ignore Error         Input Text    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]    pre103@mailinator.com

         WHILE    '${output}[0]'=='FAIL'
                Swipe    536    1982    619    913
                ${output}       Run Keyword And Ignore Error         Input Text    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]    pre103@mailinator.com

         END
         Input Text    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]    Sportz@2022
         Sleep    2
         Click Element    //android.widget.Button[@text="Submit"]
         Sleep    20
         Click Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.Button
         Sleep    3
         Click Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View
         Sleep    3
         Click Element    //android.widget.TextView[@text="Log out"]
         Sleep    5

TC4 - Create New Team with login
         Open Application    remote_url=http://localhost:5252     platformName=android
    ...     devicename=vivo 1723      app=${EXECDIR}${/}app${/}uefa-gaming-10.7.1-143163962-pre.apk
    ...     automationName=UiAutomator2     udid=af1f9b67

        #Set Appium Timeout    20s

        Click Element    //android.widget.TextView[@text="Let's start"]
        Sleep    3
        #Save Setting
        Click Element    //android.widget.ImageView[@content-desc="Close"]
        Sleep    3
        #Hamburger
        Click Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.Button
        Sleep    5
        Click Element    //android.widget.ScrollView/android.widget.ImageView[5]
        Sleep    3
        Click Element    //android.widget.TextView[@text="Home"]
        Sleep    7
        Click Element    //android.widget.TextView[@text="Create team"]      #Feature card
        Sleep    10
        Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_try_as_guest"]
        Sleep    2
        Wait And Click Element   (//android.view.ViewGroup[@resource-id="com.uefa.eurofantasy.adhoc:id/cl_root"])[3]
        Sleep    2
        Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_auto_complete"]        #autofill Button
        Sleep    3
        Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_search_player"]        #Conitnue - Pick ur Squad
        Sleep    2
        Click Element    (//android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/iv_jersey"])[12]       #Starting 11
        Sleep    3
        Click Element    //android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/iv_btn_icon"]       #Sub in
        Sleep    3
        Click Element    (//android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/iv_sub"])[6]       
        Sleep    3
        Click Element    (//android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/iv_btn_icon"])[2]      #Sub out
        Sleep    2
        Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_next"]     #Continue - Starting 11
        Sleep    3
        Click Element    (//android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/iv_jersey"])[10]        #Select Captain
        Sleep    2
        Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_next"]     #Continue - Captain
        Sleep    2
        Input Text    //android.widget.EditText[@resource-id="com.uefa.eurofantasy.adhoc:id/edt_team_name"]    Pre1 Team
        Sleep    3
        Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_next"]     #Save for now
        Sleep    2
        Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_already_have_acc"]
        Sleep    3
        ${output}       Run Keyword And Ignore Error         Input Text    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]    pre120@mailinator.com

         WHILE    '${output}[0]'=='FAIL'
                Swipe    536    1982    619    913
                ${output}       Run Keyword And Ignore Error         Input Text    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]    pre120@mailinator.com

         END
        Input Text    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]    Sportz@2022
        Sleep    2
        Click Element    //android.widget.Button[@text="Submit"]        #Submit
        Sleep    3
     
TC Create Rename & Join League
         Open Application    remote_url=http://localhost:5252     platformName=android
    ...     devicename=vivo 1723      app=${EXECDIR}${/}app${/}uefa-gaming-10.7.1-143163962-pre.apk
    ...     automationName=UiAutomator2     udid=af1f9b67

        #Set Appium Timeout    20s

        Click Element    //android.widget.TextView[@text="Let's start"]
        Sleep    3
        #Save Setting
        Click Element    //android.widget.ImageView[@content-desc="Close"]
        Sleep    3
        #Hamburger
        Click Element    //androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.widget.Button
        Sleep    5
        Click Element    //android.widget.ScrollView/android.widget.ImageView[5]
        Sleep    3
        Click Element    //android.widget.TextView[@text="Home"]
        Sleep    7
        Click Element    //android.widget.TextView[@text="Create team"]      #Feature card
        Sleep    10
        Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_login_to_play"]
        Sleep    5
        ${output}       Run Keyword And Ignore Error         Input Text    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]    pre120@mailinator.com

         WHILE    '${output}[0]'=='FAIL'
                Swipe    536    1982    619    913
                ${output}       Run Keyword And Ignore Error         Input Text    //android.widget.EditText[@resource-id="gigya-loginID-75579930407612940"]    pre120@mailinator.com

         END
         Input Text    //android.widget.EditText[@resource-id="gigya-password-32665041627364124"]    Sportz@2022
         Sleep    2
         Click Element    //android.widget.Button[@text="Submit"]
         Sleep    10
         Click Element      (//android.widget.ImageView[@resource-id="com.uefa.eurofantasy.adhoc:id/navigation_bar_item_icon_view"])[4]     #leagues
         Sleep    2
         Click Element    //android.widget.TextView[@text="Create"]         #Create 
         Sleep    2
         Input Text    //android.widget.EditText[@resource-id="com.uefa.eurofantasy.adhoc:id/edt_enter_name_or_code"]    Alpha Team
         Sleep    2
         Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn"]         #Create league button
         Sleep    3
         Click Element    //android.widget.FrameLayout[@resource-id="com.uefa.eurofantasy.adhoc:id/fl_fragment_container"]/android.widget.FrameLayout/androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[2]/android.widget.Button[1]
         Sleep    2
         #Click on league created
         Click Element    //android.widget.FrameLayout[@resource-id="com.uefa.eurofantasy.adhoc:id/nav_host_home"]/android.widget.FrameLayout/androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[1]/android.view.View[3]
         Sleep    3
         #Setting icon
         Click Element    //android.widget.FrameLayout[@resource-id="com.uefa.eurofantasy.adhoc:id/fl_fragment_container"]/android.widget.FrameLayout/androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[2]/android.widget.Button[2]
         Sleep    3
         Click Element    //android.widget.TextView[@resource-id="com.uefa.eurofantasy.adhoc:id/tv_delete_league"]      #delete league
         Sleep    2
         Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn_primary"]
         Sleep    3
         Click Element    //android.widget.TextView[@text="Join"]       #join
         Sleep    2
         Input Text    //android.widget.EditText[@resource-id="com.uefa.eurofantasy.adhoc:id/edt_enter_name_or_code"]    mi6wx9
         Sleep    2
         Click Element    //android.widget.Button[@resource-id="com.uefa.eurofantasy.adhoc:id/btn"]         #Join league button
         Sleep    5
         Click Element    //android.widget.FrameLayout[@resource-id="com.uefa.eurofantasy.adhoc:id/nav_host_home"]/android.widget.FrameLayout/androidx.compose.ui.platform.ComposeView/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]
         Sleep    3
         
TC - SUSPEND & UNSUSPENDED

         



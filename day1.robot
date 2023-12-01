# This sample code supports Appium Robot client >=2
# pip install robotframework-appiumlibrary
# Then you can paste this into a file and simply run with Robot
#
# Find keywords at: http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html
#
# If your tests fails saying 'did not match any elements' consider using 'wait activity' or
# 'wait until page contains element' before a click command

*** Settings ***
Library           AppiumLibrary
#Test Teardown     Close Application

*** Test Cases ***
Test Case Name
    Open Application    http://127.0.0.1:4723    appium:automationName=uiautomator2    platformName=android    appium:platformVersion=12    appium:deviceName=Pixel 5 - API 31    appium:appPackage=com.wdiodemoapp    appium:appActivity=.MainActivity    appium:app=/Users/11439973/Training/RobotFramework/day1.apk    appium:ensureWebviewsHavePages=${True}    appium:nativeWebScreenshot=${True}    appium:newCommandTimeout=${3600}    appium:connectHardwareKeyboard=${True}

    Wait Until Element Is Visible    android=UiSelector().text("Demo app for the appium-boilerplate")
    Capture Page Screenshot
    Click Element    accessibility_id=Webview
    Wait Until Element Is Visible    android=UiSelector().resourceId("__docusaurus_skipToContent_fallback")    timeout=10s
    Capture Page Screenshot
    ${status}    BuiltIn.Run Keyword And Return Status    Wait Until Element Is Visible    android=UiSelector().text("E2E and Unit / Component Testing in real Browser!")
    FOR    ${i}    IN RANGE    1   20
        IF    not ${status}
            Swipe    500    2000    500    1000
            ${status}    BuiltIn.Run Keyword And Return Status    Wait Until Element Is Visible    android=UiSelector().text("E2E and Unit / Component Testing in real Browser!")
        ELSE
            Exit For Loop
        END
    END
    Should be true      ${status}    msg="E2E and Unit / Component Testing in real Browser!"
    Capture Page Screenshot
    


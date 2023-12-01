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
Test Teardown     Close Application

*** Test Cases ***
Test Case Name
    Open Application    http://127.0.0.1:4723    appium:automationName=uiautomator2    platformName=android    appium:platformVersion=12    appium:deviceName=emulator-5554    appium:app=/Users/11439973/Training/cnx-mobile-automation-training/day2.apk    appium:ensureWebviewsHavePages=${True}    appium:nativeWebScreenshot=${True}    appium:newCommandTimeout=${3600}    appium:connectHardwareKeyboard=${True}
    Wait Until Element Is Visible    accessibility_id=open menu
    Click Element    accessibility_id=open menu
    Wait Until Element Is Visible    accessibility_id=container header
    Click Element    accessibility_id=container header
    Wait Until Element Is Visible    accessibility_id=URL input field
    Click Element    accessibility_id=URL input field
    Input Text    accessibility_id=URL input field    https://www.google.com
    Click Element    accessibility_id=Go To Site button
    Click Element    accessibility_id=Go To Site button
    Wait Until Element Is Visible    android=UiSelector().resourceId("XSqSsc")    timeout=20s
    Click Element    android=UiSelector().resourceId("XSqSsc")
    Input Text Into Current Element    krungsri nimble
    Press Keycode    66
    Wait Until Element Is Visible    android=UiSelector().text("Krungsri Nimble | Bangkok")    timeout=10s
    Swipe    500    2000    500    1000
    Wait Until Element Is Visible    android=UiSelector().text("Krungsri Nimble")    timeout=10s
    Capture Page Screenshot

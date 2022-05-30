*** Settings ***
Library     SeleniumLibrary
Library     String
Suite Setup     OnBrowser


*** Variables ***
${BROWSER}  chrome
#${URL}  file:///E:/Learning/python/robot%20framework/unmatch/survey%20covid%2019/page1.html#gf_36
${URL}  file:///E:/Learning/Python/udemy/robotframework/servey-covid/forms/survey covid 19/page1.html#gf_36
@{USER_NO}  00001   00002   00003   00004   00005

*** Keywords ***
OnBrowser
    Open Browser    ${URL}  ${BROWSER}
    Maximize Browser Window

Page3
    [Arguments]   ${ITEM}
     Run Keyword If  '${ITEM}' == '00001' or '${ITEM}' == '00002' or '${ITEM}' == '00003'     Click Element   //*[@id="choice_36_100_0s"]  #ข้อ1-1
        ...     ELSE    Click Element   //*[@id="choice_36_100_1"]  #ข้อ1-2
        sleep  2s
#        Click Element   //*[@id="choice_36_100_0"]  #ข้อ1-1
#        Click Element   //*[@id="choice_36_100_1"]  #ข้อ1-2
        Click Element   //*[@id="choice_36_101_1"]
        Click Element   //*[@id="choice_36_103_1"]
        Click Element   //*[@id="choice_36_105_1"]
        Click Element   //*[@id="choice_36_107_1"]	#ข้อ5
        Click Element   //*[@id="choice_36_110_1"]	#ข้อ6
        Input Text      //*[@id="input_36_106"]     0867023192     #เบอร์โทร
        Click Element   //*[@id="gform_next_button_36_108"]     #btn ถัดไป
        sleep  3s

PageALL
    [Arguments]   ${ITEM}
    #1.Page1
    Click Element   //*[@id="choice_36_84_0"]
    Click Element   //*[@id="choice_36_1_0"]
    Input Text   //*[@id="input_36_5"]   ${ITEM}
    Click Element   //*[@id="gform_next_button_36_52"]
    sleep  1s

    #2.Page2
    Click Element   //*[@id="input_36_96_1"]
    Click Element   //*[@id="gform_next_button_36_97"]
    sleep  1s

    #3.Page3
    Run Keyword If  '${ITEM}' == '00001'    Click Element   //*[@id="choice_36_100_0s"]  #ข้อ1-1
        ...     ELSE    Click Element   //*[@id="choice_36_100_1"]  #ข้อ1-2
#        Click Element   //*[@id="choice_36_100_0"]  #ข้อ1-1
#        Click Element   //*[@id="choice_36_100_1"]  #ข้อ1-2
    Click Element   //*[@id="choice_36_101_1"]
    Click Element   //*[@id="choice_36_103_1"]
    Click Element   //*[@id="choice_36_105_1"]
    Click Element   //*[@id="choice_36_107_1"]	#ข้อ5
    Click Element   //*[@id="choice_36_110_1"]	#ข้อ6
    Input Text      //*[@id="input_36_106"]     0867023192     #เบอร์โทร
    Click Element   //*[@id="gform_next_button_36_108"]     #btn ถัดไป
    sleep  1s

     #4.Page4
    Capture Page Screenshot     #page4
    Click Element   //*[@id="input_36_91_1"]    #chkbox
    Click Element   //*[@id="gform_submit_button_36"]   #btn ส่งข้อมูล

*** Test Cases ***
1.FOR Register

    FOR    ${ITEM}  IN  @{USER_NO}
#        Run Keyword And Continue On Failure     PageALL   ${ITEM}
        ${status}   Run Keyword And Ignore Error   PageALL   ${ITEM}
        log to console  this is : ${status}
        Run Keyword And Return If   '${status}' == 'PASS'   Log To Console  This Case is Pass   ELSE     Log To Console  This Case is False
        Go To   ${URL}
    END

#0.Register Survey
#    FOR    ${ITEM}  IN  @{USER_NO}
#        #1.Page1
#        Click Element   //*[@id="choice_36_84_0"]
#        Click Element   //*[@id="choice_36_1_0"]
#        Input Text   //*[@id="input_36_5"]   ${ITEM}
#        Click Element   //*[@id="gform_next_button_36_52"]
#        sleep  3s
#
#        #2.Page2
#        Click Element   //*[@id="input_36_96_1"]
#        Click Element   //*[@id="gform_next_button_36_97"]
#        sleep  3s
#
#        #3.Page3
#        Run Keyword And Continue On Failure     Page3   ${ITEM}
##        ${errorMessage}    Run Keyword And Ignore Error     Page3   ${ITEM}
##        log to console  Status is : ${errorMessage}[0]
##        log to console  Desp is : ${errorMessage}[1]
#
#        #4.Page4
#        Capture Page Screenshot     #page4
#        Click Element   //*[@id="input_36_91_1"]    #chkbox
#        Click Element   //*[@id="gform_submit_button_36"]   #btn ส่งข้อมูล
#
#    END

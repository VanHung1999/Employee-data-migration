*** Settings ***
Documentation   Migrated from a legacy thick client HR app as well as an 
...             internal HR onboarding API into Busy Bees Resource Management
Library         RPA.Browser.Selenium
Library         RPA.HTTP
Library         RPA.Archive
Library         OperatingSystem
Library         RPA.Desktop.Windows
Library         RPA.PDF
Library         RPA.Desktop
Library         MyLibrary
*** Keywords ***
Open automationanywhere browser
    Open Available Browser    https://developer.automationanywhere.com/challenges/automationanywherelabs-employeedatamigration.html
*** Keywords ***
Download and decompression
    ${linkraw}=    Run Keyword And Return Status    
    ...    Wait until page contains element    //a[normalize-space()='Download Legacy App']    timeout=10

    IF    ${linkraw} == True
        Click Element    //a[normalize-space()='Download Legacy App']
        Wait until download finish   
    END
    Extract Archive    EmployeeList.zip
*** Keywords ***
Wait until download finish
    Wait Until Keyword Succeeds    10s    1s    File should exist    EmployeeList.zip
*** Keywords ***
Open EmployeeList.exe
    Open Executable    EmployeeList.exe    Employee Database
    
*** Keywords ***
Fill in the blanks on the web
    Wait Until Page Contains Element    id:employeeID     
    ${id_employee}=    Get Value    id:employeeID
    Send Keys To Input    ${id_employee}    with_enter=False
    Mouse Click    Search
    ${firstname}=    RPA.Desktop.Windows.Get Element    id:txtFirstName      
    ${lastname}=    RPA.Desktop.Windows.Get Element    id:txtLastName
    ${email}=    RPA.Desktop.Windows.Get Element    id:txtEmailId
    ${city}=    RPA.Desktop.Windows.Get Element    id:txtCity
    ${zip}=    RPA.Desktop.Windows.Get Element    id:txtZip
    ${jobtitle}=    RPA.Desktop.Windows.Get Element    id:txtJobTitle
    ${department}=    RPA.Desktop.Windows.Get Element    id:txtDepartment
    ${manager}=    RPA.Desktop.Windows.Get Element    id:txtManager
    ${state}=    RPA.Desktop.Windows.Get Element    id:txtState
    Input Text    id:firstName    ${firstname}[legacy][Value]
    Input Text    id:lastName    ${lastname}[legacy][Value]
    Input Text    id:email    ${email}[legacy][Value]
    Input Text    id:city    ${city}[legacy][Value]
    Input Text    id:zip    ${zip}[legacy][Value]
    Input Text    id:title    ${jobtitle}[legacy][Value]
    Select From List By Value    id:department    ${department}[legacy][Value]
    Input Text    id:manager    ${manager}[legacy][Value]
    Select From List By Value    id:state    ${state}[legacy][Value]
    Execute Javascript    window.open()
    Switch Window    locator=NEW
    Go To    https://botgames-employee-data-migration-vwsrh7tyda-uc.a.run.app/employees?id=${id_employee}
    ${phoneandate}=    Get Element Attribute     
    ...    //body//pre    innerHTML
    ${phone}=    Cut String1    ${phoneandate}
    ${Date}=    Cut String2    ${phoneandate}
    Switch Window    locator=MAIN
    Input Text    id:phone    ${phone}
    Input Text    id:startDate    ${Date}
    Click Button    id:submitButton
    Mouse Click    Clear
*** Keywords ***
Fill in the blanks on the web for 10 people
    FOR    ${i}    IN RANGE    1    11    1
        Fill in the blanks on the web
    END
      
*** Tasks ***
Work
    Set Download Directory    ${CURDIR}
    Open automationanywhere browser    
    #Download and decompression
    Open EmployeeList.exe
    Fill in the blanks on the web for 10 people  







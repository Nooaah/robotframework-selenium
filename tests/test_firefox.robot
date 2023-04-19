*** Settings ***
Library    SeleniumLibrary

Suite Teardown    Close Browser

*** Variables ***

# URL
${BROWSER}           firefox
${REMOTE_URL}        http://172.22.0.2:4444
${BASE_URL}          https://www.github.com

# Cookie
${COOKIE_NAME}    user
${COOKIE_VALUE}   admin
${COOKIE_DOMAIN}  github.com

*** Test Cases ***

Navigate to Github
    Open Browser    about:blank    ${BROWSER}    remote_url=${REMOTE_URL}
    Maximize Browser Window
    Go to    ${BASE_URL}
    Title Should Be    GitHub: Let’s build from here · GitHub
    Add cookie    ${COOKIE_NAME}    ${COOKIE_VALUE}    domain=${COOKIE_DOMAIN}

Vérifie que le cookie est ajouté
    ${cookie}=    Get Cookie    user
    Should Be Equal    ${cookie.value}    admin

Prend une capture d'écran de la page
    Capture Page Screenshot    ./screens/screenshot.png
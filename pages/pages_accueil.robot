*** Settings ***
Library    SeleniumLibrary

Resource    tests/resources/test_properties.robot

*** Variables ***

${champ_connecter}      xpath://*[@id="bs-example-navbar-collapse-1"]/ul[2]/li[2]/a


*** Keywords ***

Cliquer sur se connecter
    Click Link          ${champ_connecter}
    Sleep    5s


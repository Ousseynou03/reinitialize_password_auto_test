*** Settings ***
Library    SeleniumLibrary


Resource    ../core/selenium_utils.robot

Resource   pages/pages_accueil.robot
Resource   pages/page_connexion.robot


Test Setup   Ouvrir le navigateur    ${url}   ${browser}
Test Teardown     Fermer le navigateur



*** Test Cases ***
Reinitialisation Mot de passe
    Cliquer sur se connecter
    Cliquer sur mot de passe oublié
    Vérification Email





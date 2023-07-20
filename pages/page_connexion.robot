*** Settings ***
Library    SeleniumLibrary

Library    ImapLibrary2
#Library    ImapLibrary

*** Variables ***
${champ_mdp_oublié}     xpath:/html/body/div/div[2]/div[1]/div/div[2]/p[1]/a

${champ_element_trouvé}     xpath:/html/body/div/div[2]/div[1]/div/div[1]/h1

${mdp_oublié}       Mot de pass oublier...

${champ_email}      xpath://*[@id="email"]

${email}    dioneousseynou03@gmail.com

${champ_msg_succes}     xpath:/html/body/div/div[1]/div[2]/div

${msg_succes}       Félicitation! Your password reset link has been sent with success, do not forget to check your SPAM folder !!

${champ_reinitialiser_mdp}  xpath:/html/body/div/div[2]/div[1]/div/div[2]/form/div[2]/div/input

*** Keywords ***
Cliquer sur mot de passe oublié
    Click Link    ${champ_mdp_oublié}
    Wait Until Element Contains    ${champ_element_trouvé}      ${mdp_oublié}
    Click Element    ${champ_email}
    Input Text    ${champ_email}    ${email}
    Click Element    ${champ_reinitialiser_mdp}
    Wait Until Element Contains    ${champ_msg_succes}      ${msg_succes}
    Sleep    3s
Vérification Email
#host=imap-mail.outlook.com #si on utilise outlook au lieu de gmail
#host=imap.gmail.com #si on utilise gmail
    Open Mailbox    host=imap.groupagrica.com    user=your_email@groupagrica.com    password=your_password
    ${LATEST} =    Wait For Email    sender=adresse_expéditeur   timeout=300  # attendre 5 min si l'email tarde à arriver
    ${HTML} =    Open Link From Email    ${LATEST}
    Should Contain    ${HTML}    You are receiving this email because we received a password reset request for your account.
    Close Mailbox


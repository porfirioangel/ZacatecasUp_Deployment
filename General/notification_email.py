# coding=utf-8

import smtplib
import datetime

username = "padsnotifications@gmail.com"

password = "$Pads.96$_notifications"

session = smtplib.SMTP('smtp.gmail.com', 587)

#Initiate connection to the server
session.ehlo()

#Start encrypting everything you're sending to the server
session.starttls()

#Log into the server by sending them our username and password
session.login(username, password)

#Define the recipient of the email
recipient = "porfirioads@gmail.com"

#Enter the headers of the email
headers = "\r\n".join(["from: " + username,
                       "subject: Hook Executed",
                       "to: " + recipient,
                       "mime-version: 1.0",
                       "content-type: text/html"])

#Enter the text of the body of the email
email_file = open('current_email.html', 'r')
body_of_email = email_file.read()
log_file = open('hook_log', 'r')
log = log_file.read()
body_of_email = body_of_email.replace('{{ hook_log }}', log)


#Tie the headers and body together into the email's content
content = headers + "\r\n\r\n" + body_of_email

#Send the email!
session.sendmail(username, recipient, content)

#Close the connection to the SMTP server 
session.quit()
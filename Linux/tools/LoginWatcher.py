import selenium
from selenium import webdriver
import time
import os
#import settings
#from settings import username as un, password as pw

un = input('username: ')
pw = input('password: ')
newpw = input('New password, if a user loggs in: ')

print('Please make sure that 2FA is off!')
driver = webdriver.Firefox()
driver.get("https://www.instagram.com/accounts/privacy_and_security/")
time.sleep(3)

os.system('clear')

print('Automatische Anmeldung läuft!')
driver.find_element_by_xpath("/html/body/div[1]/section/main/div/article/div/div[1]/div/form/div/div[1]/div/label/input").send_keys(un)
time.sleep(2)
driver.find_element_by_xpath("/html/body/div[1]/section/main/div/article/div/div[1]/div/form/div/div[2]/div/label/input").send_keys(pw)
#Zeit zum Warten, bevor des Klicks
time.sleep(2)
driver.find_element_by_xpath("/html/body/div[1]/section/main/div/article/div/div[1]/div/form/div/div[3]").click()
time.sleep(5)
print('Leite auf neue Seite weiter!')
driver.get("https://www.instagram.com/session/login_activity/")
time.sleep(3)
print('Suche nach angegebenen Inhalte!')
body = driver.find_element_by_xpath("/html/body/div[1]/section/main/div/article/div/div[2]")
print('Gefunden!')
time.sleep(1)
original = body.size
newer = original
# Check for changes
while original == newer:
    os.system('clear')
    print('Suche nach Neu-Anmeldungen!')
    time.sleep(2)
    #print(body.size)
    #driver.find_element_by_xpath("/html/body/div[1]/section/main/div/ul/li[8]/a").click()
    body = driver.find_element_by_xpath("/html/body/div[1]/section/main/div/article/div/div[2]")
    newer = body.size

    if original != newer:
        print('Change in progress!')
        #print(body.size)
        break

    print('Es hat sich nichts geändert!')

    print('Warte 10 Sekunden')
    time.sleep(10)

    print('Neuladen der Seite') 
    driver.get("https://www.instagram.com/session/login_activity/")

os.system('clear')
print('Seite hat sich geändert!')
print('Neuer Nutzer hat sich angemeldet!')
print('Leite zum Passwort-ändern!')
#Open Site for Password change!
driver.get("https://www.instagram.com/accounts/password/change/")
time.sleep(2)
driver.find_element_by_xpath('//*[@id="cppOldPassword"]').send_keys(pw)
driver.find_element_by_xpath('//*[@id="cppNewPassword"]').send_keys(newpw)
driver.find_element_by_xpath('//*[@id="cppConfirmPassword"]').send_keys(newpw)
driver.find_element_by_xpath('/html/body/div[1]/section/main/div/article/form/div[4]/div/div').click()

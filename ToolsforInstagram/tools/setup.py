import os
import io
import time

os.system('clear')

print('This file is now installing Pip3, Selenium, webdrivermanager with geckodrive to your system!')
time.sleep(5)
os.system('clear')
print('Installing pip. You must type your password to continue! Do not worry, we cannot save/use it anytime, anywhere else ;)')
os.system('sudo apt install python3-pip')
os.system('y')
print('Successfully installed pip!')
time.sleep(5)
os.system('clear')
print('Now installing Selenium')
os.system('pip3 install selenium')
print('Successfully installed Selenium!')
time.sleep(5)
os.system('clear')
print('Now installing webdrivermanager with geckodrive! Please do not type anything!')
os.system('pip3 install webdrivermanager')
os.system('webdrivermanager firefox --linkpath /usr/local/bin')

os.system('clear')
os.system('cp ~/FreaksInstaBot/settings ~/FreaksInstaBot/Side')
#Change test to this file!!!
os.system('rm test')

print('You now can run it!')
time.sleep(10)
os.system('exit')

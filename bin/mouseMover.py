# python3 -m venv ~/Documents/TerminalBin/MyShell/venv
# source ~/Documents/TerminalBin/MyShell/venv/bin/activate
# pip3 install pyautogui PyObjC
from pyautogui import moveTo
from time import sleep
from random import randint
import AppKit

def main():
    while True:
        x=randint(1,1000)
        y=randint(1,1000)
        moveTo(x,y)
        AppKit.NSBeep()
        sleep(60)

main()
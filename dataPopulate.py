from lxml import etree
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
import os

DATA_PATH = "./data/"
CLASS_FILE_NAME = "classList.xml"
SUBCLASS_FILE_NAME = "SubclassList.xml"

def addDNDClass(className: str, classDesc: str, classInternalName: str, subclassArr):

    
    root = etree.Element("classList")

    classHead = etree.Element("class", name=className)
    etree.SubElement(classHead, "classInternalName", name=classInternalName)
    etree.SubElement(classHead, "classDesc").text = classDesc

    subclassCount = int(len(subclassArr))
    subclassListHead = etree.SubElement(classHead, "subclassList", count=str(int(subclassCount/2)))

    for i in range(0, subclassCount, 2):
        etree.SubElement(subclassListHead, "subclass", 
                         name=subclassArr[i]).text = subclassArr[i+1]

    root.append(classHead)
    tree = etree.ElementTree(root)
    tree.write(DATA_PATH + CLASS_FILE_NAME, pretty_print=True)

"""
    Goes to relevant wikipage and fetches core details of the class
    Details:
        Hit Dice
        Hit Points -> direct consequence of hit dice

        Proficiencies
            Armor
            Weapon
            Tools
            STs
            Skills

        Is Caster <- flag to allow spell list lookup (overwritten by subclass)
            Spell Slots at each level
            Spells known at each level
        Feat Levels <- levels where characters will receive feats/ASI
        
        
"""
def generateDNDClass():
    root = etree.Element("class")

# do a lookup in classList.xml to find all subclasses for "classInternalName"<- internal name for href
"""
    Create a new folder for that class, this will also contain spell lists
"""
def generateDNDSubclass():
    root = etree.Element("subclassList")

    classTree = etree.parse(DATA_PATH + CLASS_FILE_NAME)


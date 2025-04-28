from lxml import etree
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
import os
import uuid

DATA_PATH = "./data/"
CLASS_FILE_NAME = "classList.xml"
SUBCLASS_FILE_NAME = "subclassList.xml"
ITEM_FILE_NAME = "commonItemList.xml"

parser = etree.XMLParser(remove_blank_text=True)

def addDNDClass(className: str, classDesc: str, classInternalName: str, subclassArr):
    # if exists
    if(os.path.isfile(DATA_PATH + CLASS_FILE_NAME)):
        root = etree.parse(DATA_PATH + CLASS_FILE_NAME, parser).getroot()
    
    else:
        root = etree.Element("classList")

    if(root.xpath("//class[@name=" + "'" + className + "']")):
        print(className + " already exists, skipping")
        return

    classHead = etree.Element("class", name=className, UUID = str(uuid.uuid4()))
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

def addWeapon(inName: str, inCost: str, inDamage: str, inWeight: str, inProperties: str, inSection: str):
    if(os.path.isfile(DATA_PATH + ITEM_FILE_NAME)):
        root = etree.parse(DATA_PATH + ITEM_FILE_NAME, parser).getroot()
    else:
        root = etree.Element("itemList")

    # check if already exists, if it does, then skip the item (I don't expect these to ever change, unlike the classes)
    # If anything, only new items will be added
    if(root.xpath("//item[@name=" + "'" + inName + "']")):
        print("Skipped " + inName + ", Reason: Already exists")
        return
    
    itemHead = etree.Element("item", name = inName, category = "weapon", UUID = str(uuid.uuid4()))
    damageHead = etree.SubElement(itemHead, "damageDies")
    damageList = inDamage.lower().split()
    if (len(damageList) > 1):
        etree.SubElement(damageHead, "damage", tag = "default", value = damageList[0], type = damageList[1])
    else:
        etree.SubElement(damageHead, "damage", tag = "default", value = "null", type = "null")
    propertiesHead = etree.SubElement(itemHead, "properties")

    # check properties for versatile damage
    prof = inSection.lower().split()
    proficiency = etree.SubElement(itemHead, "proficiency", mainType = prof[0], attType = prof[1], value = inName.lower())

    propertyList = inProperties.lower().split(', ')
    for property in propertyList:
        if("—" in property):
            # this means it was probably empty
            continue
        if("versatile" in property):
            temp = property.split()
            thisValue = temp[1].replace('(', '').replace(')', '')
            etree.SubElement(damageHead, "damage", tag = "versatile", value = thisValue, type = damageList[1])
            etree.SubElement(propertiesHead, "property", value = "versatile")
        else:
            etree.SubElement(propertiesHead, "property", value = property)
    if("—" in inWeight):
        weight =  etree.SubElement(itemHead, "weight", value = "null")
    else:
        weight = etree.SubElement(itemHead, "weight", value = inWeight)
    cost = etree.SubElement(itemHead, "cost", value = inCost)

    root.append(itemHead)
    tree = etree.ElementTree(root)
    tree.write(DATA_PATH + ITEM_FILE_NAME, pretty_print = True)

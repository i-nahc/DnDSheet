from selenium import webdriver
from dataPopulate import addDNDClass
from dataPopulate import addWeapon
import os
# file paths
DATA_PATH = "./data/"
CLASS_FILE_NAME = "classList.xml"
SUBCLASS_FILE_NAME = "subclassList.xml"
ITEM_FILE_NAME = "commonItemList.xml"

driverInst = webdriver.Firefox()

def scrapeClass(): 
    # Main URL of page
    print("Now scraping classes")
    webPageURL = "https://dnd5e.wikidot.com"
    driverInst.get(webPageURL)

    #//div[@class="row" and ./div[@class="col-md-7" and .//h1[.//a and .//em]]]

    # getting a list of all classes
    classList = driverInst.find_elements(by="xpath", value='//div[@class="row" and ./div[@class="col-md-7" and .//h1[.//a and .//em]]]')

    classInfo = []
    classOffset = 0

    """
    if(os.path.isfile(DATA_PATH + CLASS_FILE_NAME)):
        # delete file to start fresh
        os.remove(DATA_PATH + CLASS_FILE_NAME)
    """

    # getting info for all classes
    for dndClass in classList:

        dndClassName = dndClass.find_element(by="xpath", value='.//a').text

        # none of that homebrew stuff
        if "Homebrew" in dndClassName:
            continue

        dndClassInternalName = dndClass.find_element(by="xpath", value='.//a').get_attribute("href").split('/')[-1]
        dndClassDesc = dndClass.find_element(by="xpath", value='.//h6[.//em]').text

        # getting all subclasses of this class
        dndSubclassSection = dndClass.find_element(by="xpath", value='.//div[@class="col-sm-4" and contains(., "Published")]')
        subclassList = dndSubclassSection.find_elements(by="xpath", value='.//a')

        subclassArr = []
        index = 0
        for dndSubclass in subclassList:
            subclassArr.append(dndSubclass.get_attribute("href").split('/')[-1])
            subclassArr.append(dndSubclass.text)
        addDNDClass(dndClassName, dndClassDesc, dndClassInternalName, subclassArr)

def scrapeItems():
    """
    if(os.path.isfile(DATA_PATH + ITEM_FILE_NAME)):
        # delete file to start fresh
        os.remove(DATA_PATH + ITEM_FILE_NAME)
    """

    print("Now scraping items")

    # scraping weapons
    webPageURL = "https://dnd5e.wikidot.com/weapons"
    driverInst.get(webPageURL)

    tables = driverInst.find_elements(by="xpath", value='//table')

    sectionName = ""
    skipSection = False
    hasHeader = False
    isItem = False

    for table in tables: 
        print(table.get_attribute("class"))
        hasHeader = False
        isItem = False
        # for each element in table
        itemRow = table.find_elements(by="xpath", value='.//tr')
        for items in itemRow:
            # if the item has colspan attribute, it is a header
            properties = items.find_elements(by="xpath", value='.//th')
            itemProperties = items.find_elements(by="xpath", value='.//td')
            content = []

            # skipping column header titles
            if(skipSection):
                skipSection = False
                continue
            if(len(itemProperties) > 0):
                properties = itemProperties
            for property in properties:
                # if it has a property, it's the header for the section
                # also skip next item because it will just be column headers
                if(property.get_attribute("colspan")):
                    isItem = False
                    sectionName = property.text
                    skipSection = True
                    hasHeader = True
                    print(property.text)
                else:
                    if(not hasHeader):
                        break
                    isItem = True
                    content.append(property.text)
                    print(property.text)
            
            # append to list
            if(isItem):
                addWeapon(content[0], content[1], content[2], content[3], content[4], sectionName)

        if(not hasHeader):
            continue
                



def main():
    scrapeItems()
    scrapeClass()

if __name__ == "__main__":
    main()
    
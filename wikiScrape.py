from selenium import webdriver
from dataPopulate import addDNDClass
import os
# file paths
DATA_PATH = "./data/"
CLASS_FILE_NAME = "classList.xml"
SUBCLASS_FILE_NAME = "subclassList.xml"

# Main URL of page
webPageURL = "https://dnd5e.wikidot.com"
driverInst = webdriver.Firefox()

driverInst.get(webPageURL)

#//div[@class="row" and ./div[@class="col-md-7" and .//h1[.//a and .//em]]]

# getting a list of all classes
classList = driverInst.find_elements(by="xpath", value='//div[@class="row" and ./div[@class="col-md-7" and .//h1[.//a and .//em]]]')

classInfo = []
classOffset = 0

if(os.path.isfile(DATA_PATH + CLASS_FILE_NAME)):
    # delete file to start fresh
    os.remove(DATA_PATH + CLASS_FILE_NAME)

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

    # scraping weapons
    webPageURL = "https://dnd5e.wikidot.com/weapons"
    driverInst.get(webPageURL)

    tables = driverInst.find_elements(by="xpath", value='//table')

    for table in tables: 
        # for each element in table
        items = table.find_elements(by="xpath", value='.//tr')
        for item in items:
            # if the item has colspan attribute, it is a header
            if(item.get_attribute("colspan")):
                itemClass = item.text
                print(itemClass)

    
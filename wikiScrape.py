from selenium import webdriver
from dataPopulate import addDNDClass
from dataPopulate import addWeapon
from dataPopulate import addArmor
from dataPopulate import addSpell
import os
# file paths
DATA_PATH = "./data/"
CLASS_FILE_NAME = "classList.xml"
SUBCLASS_FILE_NAME = "subclassList.xml"
ITEM_FILE_NAME = "commonItemList.xml"


options = webdriver.FirefoxOptions()
options.add_argument("--headless")
options.page_load_strategy = 'normal'
driverInst = webdriver.Firefox(options = options)


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

def scrapeArmor():
    print("Now scraping armor")

    webPageURL = "https://dnd5e.wikidot.com/armor"
    driverInst.get(webPageURL)

    curSec = 0
    sections = driverInst.find_elements(by="xpath", value="//h2[@id]")
    tables = driverInst.find_elements(by="xpath", value="//table[@class]")
    for section in sections:
        sectionHeading = section.find_element(by="xpath", value=".//span").text
        print(sectionHeading)
        rows = tables[curSec].find_elements(by="xpath", value=".//tr")
        for row in rows:
            columns = row.find_elements(by="xpath", value=".//td")
            rowContents = []
            if(columns):
                for column in columns:
                    print(column.text)
                    rowContents.append(column.text)
                # insert to file
                addArmor(rowContents[0], rowContents[5], rowContents[1], rowContents[4], rowContents[3], rowContents[2], sectionHeading)
        curSec += 1

def scrapeSpell():
    print("Now scraping spells")

    webPageURL = "https://dnd5e.wikidot.com/spells"
    driverInst.get(webPageURL)
    driverInst2 = webdriver.Firefox(options = options)

    spellTables = driverInst.find_elements(by="xpath", value="//table[@class]")
    levelLinks = driverInst.find_elements(by="xpath", value="//ul[@class='yui-nav']//li//a")
    curLevel = 0 # 0 being cantrips, 10 being level 9
    for table in spellTables:
        # click on correct levelLink
        levelLinks[curLevel].click()
        rows = table.find_elements(by="xpath", value=".//tr")
        for row in rows:
            skip = False
            columns = row.find_elements(by="xpath", value=".//td")
            curColumn = 0
            appendHref = ""
            rowContents = []
            spellLists = []
            if(columns): # i.e. if not a table header
                # basics scrapes
                for column in columns:
                    if(curColumn == 0):
                        # set href link
                        elem = column.find_elements(by="xpath", value=".//a")[0]
                        appendHref = elem.get_attribute("href")

                        # new driver instance to access the individual page
                        driverInst2.get(appendHref)

                        if("UA" in elem.text or "HB" in elem.text):
                            skip = True
                            break

                        # Get Spell List
                        spellListSection = driverInst2.find_elements(by="xpath", value="//p[.//em and .//a and .//strong and .//strong[contains(.,'List')]]")
                        if(spellListSection):
                            spellListSection = spellListSection[0]
                            classes = spellListSection.find_elements(by="xpath", value=".//a")

                            for classItem in classes:
                                className = classItem.text
                                className = className.split()[0]
                                spellLists.append(className.lower())
                            
                            for item in spellLists:
                                print(item)
  

                    elif(curColumn == 1):
                        elem = column.find_elements(by="xpath", value=".//em")[0]

                    else:
                        elem = column
                        
                    rowContents.append(elem.text)
                    
                    curColumn += 1

            
                if(not skip):
                    # add spell
                    print("Don't skip")
                    for item in rowContents:
                        print(item)
                    addSpell(rowContents[0], rowContents[1], rowContents[2], "" , "", "", str(curLevel), spellLists=spellLists)


        curLevel += 1
    driverInst2.quit()

def scrapeSubclass():
    print("Now Scraping Subclasses")  

    # use our generated class lists


        


                



def main():
    #scrapeItems()
    #scrapeClass()
    #scrapeArmor()
    #scrapeSpell()

    driverInst.quit()

if __name__ == "__main__":
    main()
    
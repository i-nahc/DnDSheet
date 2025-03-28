from selenium import webdriver
from selenium.webdriver.chrome.service import Service

# Main URL of page
webPageURL = "https://dnd5e.wikidot.com"


browserOptions = webdriver.ChromeOptions()
driverService = Service()

driverInst = webdriver.Chrome(options = browserOptions, service=driverService)

driverInst.get(webPageURL)

#//div[@class="row" and ./div[@class="col-md-7" and .//h1[.//a and .//em]]]

# getting a list of all classes
classList = driverInst.find_elements(by="xpath", value='//div[@class="row" and ./div[@class="col-md-7" and .//h1[.//a and .//em]]]')

classInfo = []
classOffset = 0

# getting info for all classes
for dndClass in classList:
   
    dndClassName = dndClass.find_element(by="xpath", value='.//a').text

    # none of that homebrew stuff
    if "Homebrew" in dndClassName:
        continue

    dndClassInternalName = dndClass.find_element(by="xpath", value='.//a').get_attribute("href").split('/')[-1]
    dndClassDesc = dndClass.find_element(by="xpath", value='.//h6[.//em]').text

    print(dndClassName)
    print(dndClassInternalName)
    print(dndClassDesc)

    # getting all subclasses of this class
    dndSubclassSection = dndClass.find_element(by="xpath", value='.//div[@class="col-sm-4" and contains(., "Published")]')
    subclassList = dndSubclassSection.find_elements(by="xpath", value='.//a')

    for dndSubclass in subclassList:
        print(dndSubclass.get_attribute("href").split('/')[-1])
        print(dndSubclass.text)

    
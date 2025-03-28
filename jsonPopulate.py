import json

def createClassFile(className, classDesc, classInternalName, subclassList):

    classData = '''
        {
        }
    '''

    with open(classInternalName + ".json", "w") as f:
        json.dump(classData, f)
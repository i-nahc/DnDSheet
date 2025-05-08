#include "listhandler.h"
#include "../../includes/pugixml/src/pugixml.hpp"

ListHandler::ListHandler(QObject* parent) {
    mainItemList = new DNDItemList(this);
    proxyItemList = new ProxyItemList(this);
    proxyItemList->setSourceModel(mainItemList);

    curTypeFilter = "All";
    curCatFilter = "Any";
    curSearchQuery = "";

    m_TypeFilters = {"All", "Armor", "Weapons", "Martial Weps", "Simple Weps"};
    m_CategoryFilters << "Any";
    getWepFilters();
    getArmFilters();
}

ProxyItemList *ListHandler::getProxyItemList() const
{
    return proxyItemList;
}

QStringList ListHandler::fetchTypeFilters() const
{
    return m_TypeFilters;
}

QStringList ListHandler::fetchCatFilters() const
{
    return m_CategoryFilters;
}

void ListHandler::getWepFilters()
{
    pugi::xml_document doc;
    pugi::xml_parse_result result = doc.load_file("../../../data/commonItemList.xml");
    pugi::xml_node itemsList = doc.child("itemList");
    if(result)
    {
        qInfo() << "Successfully parsed document";
    }
    else
    {
        qInfo() << "Error reading document";
    }

    for(pugi::xml_node item = itemsList.first_child(); item; item = item.next_sibling())
    {
        QString insert = item.child("proficiency").attribute("value").value();
        if(!m_CategoryFilters.contains(insert, Qt::CaseInsensitive))
        {
            m_CategoryFilters << insert;
        }
    }
}

void ListHandler::getArmFilters()
{
    pugi::xml_document doc;
    pugi::xml_parse_result result = doc.load_file("../../../data/commonArmorList.xml");
    pugi::xml_node armorList = doc.child("armorList");
    if(result)
    {
        qInfo() << "Successfully parsed document";
    }
    else
    {
        qInfo() << "Error reading document";
    }
    for(pugi::xml_node item = armorList.first_child(); item; item = item.next_sibling())
    {
        QString insert = item.child("proficiency").attribute("value").value();
        if(insert != "shield")
        {
            insert.append(" armor");
        }
        if(!m_CategoryFilters.contains(insert, Qt::CaseInsensitive))
        {
            m_CategoryFilters << insert;
        }
    }
}

void ListHandler::editTypeFilter(QString newVal)
{
    proxyItemList->setTypeFilter(newVal);
}
void ListHandler::editCatFilter(QString newVal)
{
    proxyItemList->setCatFilter(newVal);
}
void ListHandler::editSearchQuery(QString newVal)
{
    proxyItemList->setSearchQuery(newVal);
}

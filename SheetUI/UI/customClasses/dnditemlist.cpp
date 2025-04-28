#include "dnditemlist.h"

#include "../../includes/pugixml/src/pugixml.hpp"

DNDItemList::DNDItemList(QObject *parent)
    : QAbstractListModel(parent)
{
    // populate from text file
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
        QString itemName = item.attribute("name").value();
        QString uuid = item.attribute("UUID").value();
        QString wepType = item.child("proficiency").attribute("value").value();
        QString cost = item.child("cost").attribute("value").value();
        QString weight = item.child("weight").attribute("value").value();
        qInfo() << itemName;

        m_items.append(new DNDItem(uuid, itemName, wepType, cost, "damageList", "propertyList", weight, "1", "1", this));
    }
}

int DNDItemList::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_items.count();
}


QVariant DNDItemList::data(const QModelIndex &index, int role) const
{
    if(index.row() < 0 || index.row() >= m_items.count())
    {
        return QVariant();
    }

    if(role == IDRole){
        return m_items[index.row()]->ID();
    }
    else if(role == NameRole)
    {
        return m_items[index.row()]->name();
    }
    else if(role == CategoryRole)
    {
        return m_items[index.row()]->category();
    }
    else if(role == CostRole)
    {
        return m_items[index.row()]->cost();
    }
    else if(role == StatsRole)
    {
        return m_items[index.row()]->stats();
    }
    else if(role == PropertiesRole)
    {
        return m_items[index.row()]->properties();
    }
    else if(role == WeightRole)
    {
        return m_items[index.row()]->weight();
    }
    else if(role == IconNameRole)
    {
        return m_items[index.row()]->iconName();
    }
    else if(role == StatIconNameRole)
    {
        return m_items[index.row()]->statIconName();
    }
    else
    {
        return QVariant();
    }
}

QHash<int, QByteArray> DNDItemList::roleNames() const{
    QHash<int, QByteArray> roles;

    roles[IDRole] = "ID";
    roles[NameRole] = "name";
    roles[CategoryRole] = "category";
    roles[CostRole] = "cost";
    roles[StatsRole] = "stats";
    roles[PropertiesRole] = "properties";
    roles[WeightRole] = "weight";
    roles[IconNameRole] = "iconName";
    roles[StatIconNameRole] = "statIconName";

    return roles;
}

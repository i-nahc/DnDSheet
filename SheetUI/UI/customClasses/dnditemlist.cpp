#include "dnditemlist.h"

#include "../../includes/pugixml/src/pugixml.hpp"
#include <filesystem>
#include <iostream>

DNDItemList::DNDItemList(QObject *parent)
    : QAbstractListModel(parent)
{
    // populate from text file
    pugi::xml_document doc;
    pugi::xml_parse_result result = doc.load_file("../../../data/commonItemList.xml");
    pugi::xml_node itemsList = doc.child("itemList");
    QString baseDir = "qrc:/UI/assets/weapon/";
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
        QString propertyString = "";
        QString damageString = "";
        std::string iconName = wepType.toStdString() + ".svg";
        QString iconPath = "";
        std::filesystem::path path = __FILE__;
        path = path.remove_filename();
        path = path.parent_path();
        path = path.parent_path();
        path = path / "assets" / "weapon" / iconName;
        //std::cout << path;
        if(std::filesystem::exists(path))
        {

            iconPath = baseDir + wepType + ".svg";
        }
        else
        {
            iconPath = "qrc:/UI/assets/entity/weapon.svg";
        }
        bool firstProp = true;
        QList <QString> damArr = {};

        pugi::xml_node damageList = item.child("damageDies");
        for(pugi::xml_node damage = damageList.first_child(); damage; damage = damage.next_sibling())
        {
            damArr.append(damage.attribute("tag").value());
            damArr.append(damage.attribute("value").value());
            damArr.append(damage.attribute("type").value());
        }

        for(int i{0}; i < damArr.size(); i += 3)
        {
            if(damArr[i] ==  "default")
            {
                if(damArr[i + 2] != "null")
                {
                    damageString = damArr[i + 1] + " " + damArr[i + 2];
                }
                else
                {
                    damageString = "N/A";
                }
            }
            else if(damArr[i] == "versatile")
            {
                if(damArr[i - 2] != "null")
                {
                    damageString = damArr[i - 2] + " (" + damArr[i + 1] + ") " + damArr[i + 2];
                }
                else
                {
                    damageString = "N/A";
                }

            }
        }

        pugi::xml_node propertyList = item.child("properties");
        for(pugi::xml_node property = propertyList.first_child(); property; property = property.next_sibling())
        {
            if(firstProp)
            {
                propertyString.append(property.attribute("value").value());
                firstProp = false;
            }
            else
            {
                propertyString.append(", ");
                propertyString.append(property.attribute("value").value());
            }
            //qInfo() << property.attribute("value").value();
        }

        //qInfo() << itemName;

        m_items.append(new DNDItem(uuid, itemName, wepType, cost, damageString, propertyString, weight, iconPath, "1", this));
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

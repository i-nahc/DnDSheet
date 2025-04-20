#include "dnditem.h"

DNDItem::DNDItem(int ID, const QString &name, const QString &category, const QString &proficiency, const QString &stats, const QList<QString> &properties, const int &weight, const QString &iconName, const QString &statIconName, QObject *parent)
:   QObject(parent),
    m_ID(ID),
    m_Name(name),
    m_Category(category),
    m_Proficiency(proficiency),
    m_Stats(stats),
    m_Properties(properties),
    m_Weight(weight),
    m_IconName(iconName),
    m_StatIconName(statIconName)
{

}

const int &DNDItem::ID() const
{
    return m_ID;
}

const QString &DNDItem::name() const
{
    return m_Name;
}

const QString &DNDItem::category() const
{
    return m_Category;
}

const QString &DNDItem::proficiency() const
{
    return m_Proficiency;
}

const QString &DNDItem::stats() const
{
    return m_Stats;
}

const QList<QString> &DNDItem::properties() const
{
    return m_Properties;
}

const int &DNDItem::weight() const
{
    return m_Weight;
}

const QString &DNDItem::iconName() const
{
    return m_IconName;
}

const QString &DNDItem::statIconName() const
{
    return m_StatIconName;
}


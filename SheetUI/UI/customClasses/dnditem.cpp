#include "dnditem.h"

DNDItem::DNDItem(QString ID, const QString &name, const QString &category, const QString &cost, const QString &stats, const QString &properties, const QString &weight, const QString &iconName, const QString &statIconName, QObject *parent)
:   QObject(parent),
    m_ID(ID),
    m_Name(name),
    m_Category(category),
    m_Cost(cost),
    m_Stats(stats),
    m_Properties(properties),
    m_Weight(weight),
    m_IconName(iconName),
    m_StatIconName(statIconName)
{

}

const QString &DNDItem::ID() const
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

const QString &DNDItem::cost() const
{
    return m_Cost;
}

const QString &DNDItem::stats() const
{
    return m_Stats;
}

const QString &DNDItem::properties() const
{
    return m_Properties;
}

const QString &DNDItem::weight() const
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


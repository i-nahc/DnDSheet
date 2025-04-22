#include "dnditemlist.h"

DNDItemList::DNDItemList(QObject *parent)
    : QAbstractListModel(parent)
{
    // populate from text file
    m_items.append(new DNDItem("111", "good ole testing", "Greatsword", 111, "3d6", {"a"}, 13, "1", "1", this));
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

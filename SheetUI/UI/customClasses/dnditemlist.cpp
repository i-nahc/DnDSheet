#include "dnditemlist.h"

DNDItemList::DNDItemList(QObject *parent)
    : QObject{parent}
{}

int DNDItemList::rowCount(const QModelIndex &parent) const
{

}

int DNDItemList::columnCount(const QModelIndex &parent) const
{

}

QVariant DNDItemList::data(const QModelIndex &index, int role) const
{

}

QVariant DNDItemList::headerData(int section, Qt::Orientation orientation, int role) const
{

}

QHash<int, QByteArray> DNDItemList::roleNames() const{
    QHash<int, QByteArray> roles;

    roles[IDRole] = "ID";
    roles[NameRole] = "name";
    roles[CategoryRole] = "category";
    roles[ProficiencyRole] = "proficiency";
    roles[StatsRole] = "stats";
    roles[PropertiesRole] = "properties";
    roles[WeightRole] = "weight";
    roles[IconNameRole] = "iconName";

    return roles;
}

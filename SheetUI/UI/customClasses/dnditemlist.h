#ifndef DNDITEMLIST_H
#define DNDITEMLIST_H

#include <QAbstractListModel>

#include "dnditem.h"

class DNDItemList : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit DNDItemList(QObject *parent = nullptr);
    enum ItemRoles{
        IDRole = Qt::UserRole + 1,      // name of item
        NameRole,
        CategoryRole,                   // weapon or armor
        ProficiencyRole,                // martial/simple or l/m/h/shield
        StatsRole,                      // xdy or # AC
        PropertiesRole,                 // heavy/reach/versatile/etc or stealth disadvantage, strength req.
        WeightRole,                     // #
        IconNameRole,                       // text pointing to icon to use
        StatIconNameRole
    };

signals:

    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

private:
    QList<DNDItem*> m_items;
};

#endif // DNDITEMLIST_H

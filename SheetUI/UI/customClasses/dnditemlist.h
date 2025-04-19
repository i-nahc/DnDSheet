#ifndef DNDITEMLIST_H
#define DNDITEMLIST_H

#include <QAbstractTableModel>

class DNDItemList : public QAbstractTableModel
{
    Q_OBJECT
public:
    explicit DNDItemList(QObject *parent = nullptr);
    enum ItemRoles{
        NameRole = Qt::UserRole + 1,    // name of item
        CategoryRole,                   // weapon or armor
        ProficiencyRole,                // martial/simple or l/m/h/shield
        ValueRole,                      // xdy or # AC
        PropertiesRole,                 // heavy/reach/versatile/etc or stealth disadvantage, strength req.
        WeightRole,                     // #
        IconRole,                       // text pointing to icon to use
    };

signals:

    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const;
    int columnCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QVariant headerData(int section, Qt::Orientation orientation, int role) const;
    QHash<int, QByteArray> roleNames() const;
};

#endif // DNDITEMLIST_H

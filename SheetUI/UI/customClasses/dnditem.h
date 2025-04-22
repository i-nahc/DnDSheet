#ifndef DNDITEM_H
#define DNDITEM_H

#include <QObject>

class DNDItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString ID READ ID CONSTANT)
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString category READ category CONSTANT)
    Q_PROPERTY(int cost READ cost CONSTANT)
    Q_PROPERTY(QString stats READ stats CONSTANT)
    Q_PROPERTY(QList<QString> properties READ properties CONSTANT)
    Q_PROPERTY(int weight READ weight CONSTANT)
    Q_PROPERTY(QString iconName READ iconName CONSTANT)
    Q_PROPERTY(QString statIconName READ statIconName CONSTANT)

    public:
        DNDItem(QString ID, const QString &name, const QString &category, const int &cost, const QString &stats, const QList<QString> &properties, const int &weight, const QString &iconName, const QString &statIconName, QObject *parent);

        const QString &ID() const;
        const QString &name() const;
        const QString &category() const;
        const int &cost() const;
        const QString &stats() const;
        const QList<QString> &properties() const;
        const int &weight() const;
        const QString &iconName() const;
        const QString &statIconName() const;

    private:
        QString m_ID;                       // GUID/UUID
        QString m_Name;                     // Name of item
        QString m_Category;                 // Subcategory of item (light, medium, etc/ greatsword, sword, etc)
        int m_Cost;                         // the cost of the item
        QString m_Stats;                    // the stats of the item (15 AC, 1d8 (1d10) + 1d4)
        QList<QString> m_Properties;        // list of properties of the item
        int m_Weight;                       // weight of the item
        QString m_IconName;                 // the icon that should be used for the item next to its name
        QString m_StatIconName;             // unused
};

#endif // DNDITEM_H

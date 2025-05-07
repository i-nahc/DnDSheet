#ifndef DNDITEM_H
#define DNDITEM_H

#include <QObject>

class DNDItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString ID READ ID CONSTANT)
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString category READ category CONSTANT)
    Q_PROPERTY(QString cost READ cost CONSTANT)
    Q_PROPERTY(QString stats READ stats CONSTANT)
    Q_PROPERTY(QString properties READ properties CONSTANT)
    Q_PROPERTY(QString weight READ weight CONSTANT)
    Q_PROPERTY(QString iconName READ iconName CONSTANT)
    Q_PROPERTY(QString statIconName READ statIconName CONSTANT)
    Q_PROPERTY(int proficiency READ proficiency CONSTANT)

    public:
        DNDItem(QString ID, const QString &name, const QString &category, const QString &cost, const QString &stats, const QString &properties, const QString &weight, const QString &iconName, const QString &statIconName, const int proficiency, QObject *parent);

        const QString &ID() const;
        const QString &name() const;
        const QString &category() const;
        const QString &cost() const;
        const QString &stats() const;
        const QString &properties() const;
        const QString &weight() const;
        const QString &iconName() const;
        const QString &statIconName() const;
        const int &proficiency() const;

    private:
        QString m_ID;                       // GUID/UUID
        QString m_Name;                     // Name of item
        QString m_Category;                 // Subcategory of item (light, medium, etc/ greatsword, sword, etc)
        QString m_Cost;                         // the cost of the item
        QString m_Stats;                    // the stats of the item (15 AC, 1d8 (1d10) + 1d4)
        QString m_Properties;        // list of properties of the item
        QString m_Weight;                       // weight of the item
        QString m_IconName;                 // the icon that should be used for the item next to its name
        QString m_StatIconName;             // unused
        int m_Proficiency;                  // 0 = Martial Wep, 1 = Simple
                                            // 2 = LA, 3 = MA, 4 = HA, 5 = Shield
};

#endif // DNDITEM_H

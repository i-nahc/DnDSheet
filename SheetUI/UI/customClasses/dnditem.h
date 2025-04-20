#ifndef DNDITEM_H
#define DNDITEM_H

#include <QObject>

class DNDItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int ID READ ID CONSTANT)
    Q_PROPERTY(QString name READ name CONSTANT)
    Q_PROPERTY(QString category READ category CONSTANT)
    Q_PROPERTY(QString proficiency READ proficiency CONSTANT)
    Q_PROPERTY(QString stats READ stats CONSTANT)
    Q_PROPERTY(QList<QString> properties READ properties CONSTANT)
    Q_PROPERTY(int weight READ weight CONSTANT)
    Q_PROPERTY(QString iconName READ iconName CONSTANT)
    Q_PROPERTY(QString statIconName READ statIconName CONSTANT)

    public:
        DNDItem(int ID, const QString &name, const QString &category, const QString &proficiency, const QString &stats, const QList<QString> &properties, const int &weight, const QString &iconName, const QString &statIconName, QObject *parent);

        const int &ID() const;
        const QString &name() const;
        const QString &category() const;
        const QString &proficiency() const;
        const QString &stats() const;
        const QList<QString> &properties() const;
        const int &weight() const;
        const QString &iconName() const;
        const QString &statIconName() const;

    private:
        int m_ID;
        QString m_Name;
        QString m_Category;
        QString m_Proficiency;
        QString m_Stats;
        QList<QString> m_Properties;
        int m_Weight;
        QString m_IconName;
        QString m_StatIconName;
};

#endif // DNDITEM_H

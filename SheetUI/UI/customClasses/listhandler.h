#ifndef LISTHANDLER_H
#define LISTHANDLER_H

#include "UI/customClasses/dnditemlist.h"
#include "UI/customClasses/proxyitemlist.h"

class ListHandler : public QObject
{
    Q_OBJECT

public:
    ListHandler(QObject* parent = Q_NULLPTR);

    ProxyItemList *getProxyItemList() const;
    QStringList fetchTypeFilters() const;
    QStringList fetchCatFilters() const;

private:
    QStringList m_TypeFilters;
    QStringList m_CategoryFilters;
    DNDItemList* mainItemList;
    ProxyItemList* proxyItemList;

    QString curTypeFilter;
    QString curCatFilter;
    QString curSearchQuery;

    void getWepFilters();
    void getArmFilters();

public slots:
    // run filter editors
    void editTypeFilter(QString newVal);
    void editCatFilter(QString newVal);
    void editSearchQuery(QString newVal);
};

#endif // LISTHANDLER_H

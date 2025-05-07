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

    void getWepFilters();
    void getArmFilters();
};

#endif // LISTHANDLER_H

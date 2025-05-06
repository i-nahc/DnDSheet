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

private:
    DNDItemList* mainItemList;
    ProxyItemList* proxyItemList;
};

#endif // LISTHANDLER_H

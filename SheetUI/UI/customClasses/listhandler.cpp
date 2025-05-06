#include "listhandler.h"

ListHandler::ListHandler(QObject* parent) {
    mainItemList = new DNDItemList(this);
    proxyItemList = new ProxyItemList(this);
    proxyItemList->setSourceModel(mainItemList);
}

ProxyItemList *ListHandler::getProxyItemList() const
{
    return proxyItemList;
}

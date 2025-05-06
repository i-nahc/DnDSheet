#include "proxyitemlist.h"


ProxyItemList::ProxyItemList(QObject* parent){
}


bool ProxyItemList::filterAcceptsRow(int source_row, const QModelIndex &source_parent) const
{
    return true;
}

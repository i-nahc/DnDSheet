#ifndef PROXYITEMLIST_H
#define PROXYITEMLIST_H

#include <QSortFilterProxyModel>

class ProxyItemList : public QSortFilterProxyModel
{
    Q_OBJECT
public:
    ProxyItemList(QObject *parent = nullptr);

    // QSortFilterProxyModel interface
protected:
    bool filterAcceptsRow(int source_row, const QModelIndex &source_parent) const;
};

#endif // PROXYITEMLIST_H

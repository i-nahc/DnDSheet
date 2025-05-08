#ifndef PROXYITEMLIST_H
#define PROXYITEMLIST_H

#include <QSortFilterProxyModel>

class ProxyItemList : public QSortFilterProxyModel
{
    Q_OBJECT
public:
    ProxyItemList(QObject *parent = nullptr);
    void setTypeFilter(const QString typeFilter);
    void setCatFilter(const QString catFilter);
    void setSearchQuery(const QString searchQuery);

private:
    QString typeFilter;
    QString catFilter;
    QString searchQuery;

    // QSortFilterProxyModel interface
protected:
    bool filterAcceptsRow(int source_row, const QModelIndex &source_parent) const;
};

#endif // PROXYITEMLIST_H

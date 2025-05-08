#include "proxyitemlist.h"
#include "dnditemlist.h"


ProxyItemList::ProxyItemList(QObject* parent){
    typeFilter = "All";
    catFilter = "Any";
    searchQuery = "";
}

void ProxyItemList::setTypeFilter(const QString typeFilter)
{
    this->typeFilter = typeFilter;
    invalidateFilter();
}

void ProxyItemList::setCatFilter(const QString catFilter)
{
    this->catFilter = catFilter;
    invalidateFilter();
}

void ProxyItemList::setSearchQuery(const QString searchQuery)
{
    this->searchQuery = searchQuery;
    invalidateFilter();
}


bool ProxyItemList::filterAcceptsRow(int source_row, const QModelIndex &source_parent) const
{
    QModelIndex index = sourceModel()->index(source_row, 0, source_parent);

    int itemType = (sourceModel()->data(index, DNDItemList::ItemRoles::ProficiencyRole)).toInt();
    QString itemCat = sourceModel()->data(index, DNDItemList::ItemRoles::CategoryRole).toString();
    QString itemName = sourceModel()->data(index, DNDItemList::ItemRoles::NameRole).toString();
    bool typePass = false;
    bool catPass = false;
    bool searchPass = false;

    // TYPE FILTERING
    // -1 for all
    // 0 for armor only
    // 1 for weap only
    // 2 for martial only
    // 3 for simple only
    if(typeFilter.contains("All"))
    {
        typePass = true;
    }
    else if(typeFilter.contains("Armor"))
    {
        typePass = (itemType != 0 && itemType != 1);
    }
    else if(typeFilter.contains("Weap"))
    {
        typePass = (itemType == 0 || itemType == 1);
    }
    else if(typeFilter.contains("Martial"))
    {
        typePass = (itemType == 0);
    }
    else
    {
        typePass = (itemType == 1);
    }

    // CATEGORY FILTERING
    if(catFilter == "Any")
    {
        catPass = true;
    }
    else
    {
        catPass = (itemCat == catFilter);
    }

    // SEARCHING
    if(searchQuery == "")
    {
        searchPass = true;
    }
    else
    {
        searchPass = itemName.toLower().contains(searchQuery.toLower());
    }

    return typePass && catPass && searchPass;
}

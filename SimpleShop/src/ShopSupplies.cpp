#include "ShopSupplies.hpp"

void ShopSupplies::addProduct(const QString& name, const int price, const double weight)
{
    _shopSupplyList.emplace_back(name, price, weight);
}

QString ShopSupplies::getProductName(const int index) const
{
    return _shopSupplyList.at(index).getProductName();
}

int ShopSupplies::getProductPrice(const int index) const
{
    return _shopSupplyList.at(index).getProductPrice();
}

double ShopSupplies::getProductWeight(const int index) const
{
    return _shopSupplyList.at(index).getProductWeight();
}

int ShopSupplies::getSupplyListSize() const
{
    return _shopSupplyList.size();
}

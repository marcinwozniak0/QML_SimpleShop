#include "ShopControler.hpp"

void ShopControler::addProduct(const QString& name, const int price, const double weight)
{
    _shopSupplyList.emplace_back(name, price, weight);
}

QString ShopControler::getProductName(const int index) const
{
    return _shopSupplyList.at(index)._name;
}

int ShopControler::getProductPrice(const int index) const
{
    return _shopSupplyList.at(index)._price;
}

double ShopControler::getProductWeight(const int index) const
{
    return _shopSupplyList.at(index)._weight;
}

int ShopControler::getSupplyListSize() const
{
    return _shopSupplyList.size();
}

#include "ShopControler.hpp"

void ShopControler::readInputData(const QString& name, const double price, const double weight)
{
    _shopSupplyList.emplace_back(name, price, weight);
    emit changeSupplyListSize();
    qDebug() << "rozmiar: " <<  _shopSupplyList.size();
}

QString ShopControler::getProductName(const int index) const
{
    return _shopSupplyList.at(index)._name;
}

double ShopControler::getProductPrice(const int index) const
{
    return _shopSupplyList.at(index)._price;
}

double ShopControler::getProductWeight(const int index) const
{
    return _shopSupplyList.at(index)._weight;
}

int ShopControler::getSupplyListSize() const
{
    qDebug() << "Pobrano rozmiar: " <<  _shopSupplyList.size();
    return _shopSupplyList.size();
}

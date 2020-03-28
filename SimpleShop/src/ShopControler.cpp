#include "ShopControler.hpp"

void ShopControler::readInputData(const QString& name, const double price, const double weight)
{
    _shopSupplyList.emplace_back(name, price, weight);
}

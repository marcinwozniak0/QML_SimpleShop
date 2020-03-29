#include "ShoppingCard.hpp"

#include <utility>
#include <iterator>

ShopingCard::ShopingCard(QObject *parent) :
    QObject(parent)
{}

void ShopingCard::addProduct(const QString& name, const int price)
{
    _shoppingCardList[ShoppingCardProduct{name, price}]++;
}

int ShopingCard::clearShoppingCard()
{
    _shoppingCardList.clear();
}

QString ShopingCard::getProductName(const int index) const
{
    auto iterator = _shoppingCardList.begin();
    std::advance(iterator, index);

    return iterator->first._name;
}

int ShopingCard::getShoppingCardSize() const
{
    return _shoppingCardList.size();
}

int ShopingCard::getProductPrice(const int index) const
{
    auto iterator = _shoppingCardList.begin();
    std::advance(iterator, index);

    return iterator->first._price;
}

int ShopingCard::getProductAmount(const int index) const
{
    auto iterator = _shoppingCardList.begin();
    std::advance(iterator, index);

    return iterator->second;
}

int ShopingCard::getTotalPrice() const
{
    auto totalPrize = 0u;
    for (const auto& [product, amount] : _shoppingCardList)
    {
        totalPrize += product._price * amount;
    }

    return totalPrize;
}

void ShopingCard::removeProduct(const int index)
{
    auto iterator = _shoppingCardList.begin();
    std::advance(iterator, index);

    --(iterator->second);

    constexpr auto empty = 0u;
    if(empty == iterator->second)
    {
        _shoppingCardList.erase(iterator);
    }
}

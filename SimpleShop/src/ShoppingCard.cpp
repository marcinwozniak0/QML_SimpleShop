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

void ShopingCard::clearShoppingCard()
{
    _shoppingCardList.clear();
}

int ShopingCard::getShoppingCardSize() const
{
    return _shoppingCardList.size();
}

namespace
{
auto getIteratorForSpecifiedMapIndex(const auto map, const auto index)
{
    auto iterator = map.begin();
    std::advance(iterator, index);

    return iterator;
}
}//namespace

QString ShopingCard::getProductName(const int index) const
{
    auto iterator = getIteratorForSpecifiedMapIndex(_shoppingCardList, index);

    return iterator->first.getProductName();
}

int ShopingCard::getProductPrice(const int index) const
{
    auto iterator = getIteratorForSpecifiedMapIndex(_shoppingCardList, index);

    return iterator->first.getProductPrice();
}

int ShopingCard::getProductAmount(const int index) const
{
    auto iterator = getIteratorForSpecifiedMapIndex(_shoppingCardList, index);

    return iterator->second;
}

void ShopingCard::removeProduct(const int index)
{
    auto iterator = _shoppingCardList.begin();
    std::advance(iterator, index);

    auto& [product, amount] = *iterator;

    --amount;

    constexpr auto empty = 0u;
    if(empty ==amount)
    {
        _shoppingCardList.erase(iterator);
    }
}

int ShopingCard::getTotalPrice() const
{
    auto totalPrize = 0u;
    for (const auto& [product, amount] : _shoppingCardList)
    {
        totalPrize += product.getProductPrice() * amount;
    }

    return totalPrize;
}

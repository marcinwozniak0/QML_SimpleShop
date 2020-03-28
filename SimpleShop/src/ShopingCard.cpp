#include "ShopingCard.hpp"

#include <QDebug>
#include <utility>

ShopingCard::ShopingCard(QObject *parent) :
    QObject(parent)
{}

void ShopingCard::addElement(const QString& name, const int price)
{
    _shoppingCardList[ShoppingCardProduct{name, price}]++;
    qDebug() << "Added alement to ShopingChart";
    qDebug() << "Rozmiar : " << _shoppingCardList.size();
}

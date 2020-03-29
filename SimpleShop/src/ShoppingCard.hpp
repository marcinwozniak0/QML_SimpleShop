#pragma once

#include <QObject>
#include <map>

#include "ShoppingCardProduct.hpp"

using ProductAmount = int;

class ShopingCard : public QObject
{
    Q_OBJECT

public:
    ShopingCard(QObject* parent = nullptr);

public slots:
    void addProduct(const QString& name, const int price);
    void clearShoppingCard();
    void removeProduct(const int index);

    int getShoppingCardSize() const;
    QString getProductName(const int index) const;
    int getProductPrice(const int index) const;
    int getProductAmount(const int index) const;
    int getTotalPrice() const;


private:
    std::map<ShoppingCardProduct, ProductAmount, ShoppingCardProductComparator>  _shoppingCardList;
};


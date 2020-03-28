#pragma once

#include <QObject>
#include <map>
#include <iterator>
#include <QDebug>

struct ShoppingCardProduct
{
    ShoppingCardProduct(const QString& name, const double price)
        : _name(name)
        , _price(price)
    {}

    QString _name;
    double _price;
};


namespace {
struct comp
{
    template<typename ShoppingCardProduct>
    bool operator()(const ShoppingCardProduct &lhs, const ShoppingCardProduct &rhs) const
    {
        return lhs._name > rhs._name;
    }
};
}

class ShopingCard : public QObject
{
    Q_OBJECT

public:
    ShopingCard(QObject* parent = nullptr);

public slots:
    void addElement(const QString& name, const int price);
    int getShoppingCardSize() {return _shoppingCardList.size();}

    QString getProductName(const int index) const
    {
        auto iterator = _shoppingCardList.begin();
        std::advance(iterator, index);

        return iterator->first._name;
    }

    double getProductPrice(const int index) const
    {
        auto iterator = _shoppingCardList.begin();
        std::advance(iterator, index);

        return iterator->first._price;
    }

    int getProductAmount(const int index) const
    {
        auto iterator = _shoppingCardList.begin();
        std::advance(iterator, index);

        return iterator->second;
    }

    int getTotalPrice() const
    {
        auto totalPrize = 0u;
        for (const auto& [product, amount] : _shoppingCardList)
        {
            totalPrize += product._price * amount;
        }

        return totalPrize;
    }

    int clearShoppingCard()
    {
        _shoppingCardList.clear();
    }

    void removeProduct(const int index)
    {
        auto iterator = _shoppingCardList.begin();
        std::advance(iterator, index);

        --(iterator->second);

        constexpr auto empty = 0u;
        if(empty == iterator->second)
        {
            qDebug() << "usuwainie : " << _shoppingCardList.size();
            _shoppingCardList.erase(iterator);
            qDebug() << "juz po :) : " << _shoppingCardList.size();
        }
    }


private:
    std::map<ShoppingCardProduct, int, comp>  _shoppingCardList;
};


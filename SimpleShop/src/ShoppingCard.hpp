#pragma once

#include <QObject>
#include <map>

struct ShoppingCardProduct
{
    ShoppingCardProduct(const QString& name, const double price)
        : _name(name)
        , _price(price)
    {}

    QString _name;
    int _price;
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
    void addProduct(const QString& name, const int price);
    int clearShoppingCard();
    void removeProduct(const int index);

    int getShoppingCardSize() const;
    QString getProductName(const int index) const;
    int getProductPrice(const int index) const;
    int getProductAmount(const int index) const;
    int getTotalPrice() const;


private:
    std::map<ShoppingCardProduct, int, comp>  _shoppingCardList;
};


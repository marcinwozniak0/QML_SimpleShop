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
    double _price;
};


namespace {
struct comp
{
    template<typename T>
    bool operator()(const T &lhs, const T &rhs) const
    {
        return true;
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

signals:
    void productsChanged();

private:
    std::map<ShoppingCardProduct, int, comp>  _shoppingCardList;
};


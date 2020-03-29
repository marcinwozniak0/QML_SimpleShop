#pragma once

class Product
{
public:
    Product(const QString& name, const int price, const double weight = 0)
        : _name(name)
        , _price(price)
        , _weight(weight)
    {}

    QString getProductName() const {return _name;}
    int getProductPrice() const {return _price;}
    double getProductWeight() const {return _weight;}

private:
    const QString _name;
    const int _price;
    const double _weight;
};


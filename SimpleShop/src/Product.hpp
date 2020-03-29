#pragma once

#include <QList>
#include <QPair>
#include <QDebug>

struct Product
{
    Product(const QString& name, const int price, const double weight)
        : _name(name)
        , _price(price)
        , _weight(weight)
    {}

    QString _name;
    int _price;
    double _weight;
};


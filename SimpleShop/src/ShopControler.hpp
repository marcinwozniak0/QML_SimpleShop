#pragma once

#include <QObject>
#include <QString>
#include <QDebug>

#include <vector>
#include <string>


struct Product
{
    Product(const QString& name, const double price, const double weight)
        : _name(name)
        , _price(price)
        , _weight(weight)
    {}

    QString _name;
    double _price;
    double _weight;
};

class ShopControler : public QObject
{
    Q_OBJECT
public:
    explicit ShopControler(QObject* parent = nullptr)
        : QObject(parent)
    {}

    Q_INVOKABLE void readInputData(const QString&, const double, const double);
    Q_INVOKABLE QString getProductName(const int index) const;
    Q_INVOKABLE double getProductPrice(const int index) const;
    Q_INVOKABLE double getProductWeight(const int index) const;
    Q_INVOKABLE int getSupplyListSize() const;

signals:
    void changeSupplyListSize();

private:
   std::vector<Product> _shopSupplyList;
};


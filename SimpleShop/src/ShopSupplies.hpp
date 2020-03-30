#pragma once

#include <QObject>
#include <vector>

#include "Product.hpp"

class ShopSupplies : public QObject
{
    Q_OBJECT
public:
    explicit ShopSupplies(QObject* parent = nullptr)
        : QObject(parent)
    {}

public slots:
     void addProduct(const QString&, const int, const double);
     void clearSupplyList();
     int getProductPrice(const int index) const;
     int getSupplyListSize() const;
     double getProductWeight(const int index) const;
     QString getProductName(const int index) const;

private:
   std::vector<Product> _shopSupplyList;
};

#pragma once

#include <QString>

#include "Product.hpp"

class ShoppingCardProduct : public Product
{
public:
    ShoppingCardProduct(const QString& name, const int price)
        : Product(name, price)
    {}

   double getProductWeight() const = delete;
};

struct ShoppingCardProductComparator
{
    bool operator()(const ShoppingCardProduct& lhs, const ShoppingCardProduct& rhs) const
    {
        return lhs.getProductName() > rhs.getProductName();
    }
};

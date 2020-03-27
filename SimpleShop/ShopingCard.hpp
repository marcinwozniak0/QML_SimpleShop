#pragma once

#include <QList>
#include <QPair>
#include <QDebug>

class ShopingCard : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<Product> _productsList READ getProductList WRITE setProductList)

    using Product = QPair<QString, int>;

public:
    ShopingCard(QObject *parent = nullptr);

    void setProductList(QList<Product>& productList) {_productsList = productList;}
    QList<Product> getProductList() {return _productsList;}

public slots:
    void addElement(const QString name, const int price)
    {
        _productsList.append(qMakePair(name, price));
        qDebug() << "Added alement";
    }

private:
    QList<QPair<QString, int>> _productsList;
};


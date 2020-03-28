//#pragma once

//#include <QVector>
//#include <QDebug>

//#include <memory>
//#include <functional>

//#include "Product.hpp"

//class ShopingCard : public QObject
//{
//    Q_OBJECT
////    Q_PROPERTY(QVector<Product*> productsList MEMBER _products NOTIFY productsChanged)

//public:
//    ShopingCard(QObject* parent = nullptr);

//public slots:
//    void addElement(const QString name, const int price)
//    {
//        auto product = new Product();
//        product->setName(name);
//        product->setPrice(price);
//        _products.push_back(std::move(product));
//        qDebug() << "Added alement";
//        qDebug() << getListSize();

//        emit productsChanged();
//    }

//    Product dupa()
//    {
//        return *_products.at(0);
//    }

//    int getListSize() {return _products.size();}

//signals:
//    void productsChanged();

//private:
//    QVector<Product*> _products;
//};


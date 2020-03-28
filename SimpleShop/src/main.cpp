#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

//#include "ShopingCard.hpp"
#include "ShopControler.hpp"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    auto shopControler =  new ShopControler();
    engine.rootContext()->setContextProperty("shopControler", shopControler);

    //qRegisterMetaType<QVector<Product*>>("ProductsVector");

    //qmlRegisterType<ShopingCard>("io.qt.examples.backend", 1, 0, "ShopingCardClass");
    // qmlRegisterType<Product>("io.qt.examples.backend", 1, 0, "Product");
    //qmlRegisterType<QVector<Product*>>("io.qt.examples.backend", 1, 0, "ProductsVector");

    const QUrl url(QStringLiteral("qrc:/resources/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "ShopingCard.hpp"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    auto shoppingCard = new ShopingCard();
    engine.rootContext()->setContextProperty("card", shoppingCard);

    const QUrl url(QStringLiteral("qrc:/resources/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

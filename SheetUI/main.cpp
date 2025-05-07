#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "backend.h"
#include "UI/customClasses/listhandler.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Backend qtBackend;
    ListHandler appLists;

    QQmlApplicationEngine engine;

    QQmlContext * rootContext = engine.rootContext();
    rootContext->setContextProperty("windowManager", &qtBackend);
    rootContext->setContextProperty("itemsManager", appLists.getProxyItemList());
    rootContext->setContextProperty("itemTypeFilters", appLists.fetchTypeFilters());
    rootContext->setContextProperty("itemCatFilters", appLists.fetchCatFilters());
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("SheetUI", "Main");

    return app.exec();
}

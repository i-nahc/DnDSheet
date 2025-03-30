#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "backend.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    Backend qtBackend;

    QQmlApplicationEngine engine;

    QQmlContext * rootContext = engine.rootContext();
    rootContext->setContextProperty("windowManager", &qtBackend);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("SheetUI", "Main");

    return app.exec();
}

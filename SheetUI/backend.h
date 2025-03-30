#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QtQml>

class Backend : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Backend(QObject *parent = nullptr);
    Q_INVOKABLE void exitApplication();
    Q_INVOKABLE void minimizeApplication();
    Q_INVOKABLE void maximizeApplication();
signals:
    void exitTriggered();
    void minimizeTriggered();
    void maximizeTriggered();

public slots:
    void triggerExit();
    void triggerMinimize();
    void triggerMaximize();
};

#endif // BACKEND_H

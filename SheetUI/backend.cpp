#include "backend.h"
#include "QDebug"
Backend::Backend(QObject *parent) : QObject{parent}
{

}

/*!
 * \brief Backend::exitApplication
 *          Exits application
 *
 * Simply exits the application. Implicitly, if this was called the application exited without error
 */
void Backend::exitApplication()
{
    QCoreApplication::quit();
}

void Backend::minimizeApplication()
{

}

void Backend::maximizeApplication()
{

}

void Backend::triggerExit()
{
    qDebug() << "Exiting...";
    exitApplication();
}

void Backend::triggerMinimize()
{
    emit minimizeTriggered();
}

void Backend::triggerMaximize()
{
    emit maximizeTriggered();
}

void Backend::triggerMenuItem(QString redirect)
{
    emit menuTriggered(redirect);
}

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSqlDatabase>
#include <QSqlQuery>

#include "satzmodel.h"
#include "kapitelmodel.h"

int main(int argc, char *argv[])
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("eckenspiel.db");
    if(!db.open())
    {
        qFatal("Cannot open/create database!");
        exit(1);
    }
    QSqlQuery query("CREATE TABLE IF NOT EXISTS Satz (kapitel TEXT NOT NULL, text TEXT NOT NULL)");
    if(!query.isActive())
    {
        qFatal("Cannot create table!");
        exit(1);
    }

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<SatzModel>("Satz", 1, 0, "SatzModel");
    qmlRegisterType<KapitelModel>("Satz", 1, 0, "KapitelModel");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

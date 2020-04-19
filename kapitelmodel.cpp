#include "kapitelmodel.h"

KapitelModel::KapitelModel(QObject *parent)
    : QSqlQueryModel(parent)
{
    mQuery.exec("SELECT DISTINCT kapitel FROM Satz ORDER BY kapitel ASC");
    setQuery(mQuery);
}

int KapitelModel::update(QString editText)
{
    // update model
    mQuery.exec();
    setQuery(mQuery);

    // search for the index of the editText
    QSqlQuery query;
    query.prepare("SELECT COUNT(DISTINCT kapitel) FROM Satz WHERE kapitel < ? ORDER BY kapitel");
    query.bindValue(0, editText);
    query.exec();
    query.first();
    return query.value(0).toInt();
}




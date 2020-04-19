#include "satzmodel.h"
#include <QSqlRecord>

SatzModel::SatzModel(QObject *parent)
    : QSqlQueryModel(parent)
{
    mQuery.exec("SELECT text, rowid FROM Satz WHERE kapitel = ?");
    setQuery(mQuery);
}

void SatzModel::selectKapitel(QString kapitel)
{
    mQuery.bindValue(0, kapitel);
    mQuery.exec();
    setQuery(mQuery);
}

QString SatzModel::addSatz(QString kapitel, QString text)
{
    QStringList textList = text.split(QRegExp("[\r\n]"),QString::SkipEmptyParts);
    if(textList.count() == 0)
    {
        return QString();
    }
    if(textList[0] == text)
    {
        return text;
    }

    QStringList kapitelList;
    for(int i = 0; i < textList.size(); ++i)
    {
        kapitelList.append(kapitel);
    }

    QSqlQuery("BEGIN");
    QSqlQuery query;
    query.prepare("INSERT INTO Satz (kapitel, text) VALUES (?, ?)");
    query.bindValue(0, kapitelList);
    query.bindValue(1, textList);
    query.execBatch();
    QSqlQuery("COMMIT");

    emit underlyingDataChanged();

    mQuery.exec();
    setQuery(mQuery);

    return QString();
}

void SatzModel::removeSatz(int row)
{
    QSqlQuery query;
    query.prepare("DELETE FROM Satz WHERE rowid = ?");
    query.bindValue(0, record(row).value(1));
    query.exec();

    emit underlyingDataChanged();

    mQuery.exec();
    setQuery(mQuery);
}

//QVariant SatzModel::data(const QModelIndex &index, int role) const
//{
//    if (!index.isValid())
//        return QVariant();

//    // FIXME: Implement me!
//    return QVariant();
//}

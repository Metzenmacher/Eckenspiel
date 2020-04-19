#ifndef KAPITELMODEL_H
#define KAPITELMODEL_H

#include <QSqlQueryModel>
#include <QSqlQuery>

class KapitelModel : public QSqlQueryModel
{
    Q_OBJECT

public:
    explicit KapitelModel(QObject *parent = nullptr);


public slots:
    int update(QString editText);

private:
    QSqlQuery mQuery;
};

#endif // KAPITELMODEL_H

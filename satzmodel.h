#ifndef SATZMODEL_H
#define SATZMODEL_H

#include <QSqlQueryModel>
#include <QSqlQuery>

class SatzModel : public QSqlQueryModel
{
    Q_OBJECT

public:
    explicit SatzModel(QObject *parent = nullptr);

//    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

signals:
    void underlyingDataChanged();

public slots:
    void selectKapitel(QString kapitel);
    QString addSatz(QString kapitel, QString text);
    void removeSatz(int row);

private:
    QSqlQuery mQuery;
};

#endif // SATZMODEL_H

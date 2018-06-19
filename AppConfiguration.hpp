#ifndef APPCONFIGURATION_HPP
#define APPCONFIGURATION_HPP

#include "core/Global.hpp"

#include <QObject>
#include <QSettings>
#include <QSize>
#include <QCamera>

class AppConfiguration : public QObject
{
  Q_OBJECT

  Q_PROPERTY(QString fotozorInstanceName READ fotozorInstanceName)
  Q_PROPERTY(QString introductionText READ introductionText)
  Q_PROPERTY(QString savingText READ savingText)
  Q_PROPERTY(QString savingTitle READ savingTitle)
  Q_PROPERTY(qreal zoom READ zoom WRITE setZoom NOTIFY zoomChanged)
  Q_PROPERTY(qreal colorTemp READ colorTemp WRITE setColorTemp NOTIFY colorTempChanged)
  Q_PROPERTY(QSize resolution READ resolution WRITE setResolution NOTIFY resolutionChanged)
  Q_PROPERTY(QCamera::Position cameraPosition READ cameraPosition WRITE setCameraPosition NOTIFY cameraPositionChanged)
  Q_PROPERTY(qreal bottomMarginRatio READ bottomMarginRatio WRITE setBottomMarginRatio NOTIFY bottomMarginRatioChanged)
  Q_PROPERTY(qreal scaleFactor READ scaleFactor WRITE setScaleFactor NOTIFY scaleFactorChanged)
  Q_PROPERTY(qreal rotationAngle READ rotationAngle WRITE setRotationAngle NOTIFY rotationAngleChanged)
  Q_PROPERTY(bool settingsFileExists READ settingsFileExists)

  public:
    explicit AppConfiguration(QObject* a_Parent = nullptr);

    bool logsEnabled() const;

    bool settingsFileExists() const;

    QString savingTitle() const;

    QString savingText() const;

    QString introductionText() const;

    QString fotozorInstanceName() const;

    qreal zoom() const;
    void setZoom(qreal a_Value);

    qreal colorTemp() const;
    void setColorTemp(qreal a_Value);

    QSize resolution() const;
    void setResolution(const QSize& a_Value);

    QCamera::Position cameraPosition() const;
    void setCameraPosition(const QCamera::Position& a_Value);

    qreal bottomMarginRatio() const;
    void setBottomMarginRatio(qreal a_Value);

    qreal scaleFactor() const;
    void setScaleFactor(qreal a_Value);

    qreal rotationAngle() const;
    void setRotationAngle(qreal a_Value);

  public slots:

  signals:
    void zoomChanged();
    void colorTempChanged();
    void resolutionChanged();
    void cameraPositionChanged();
    void bottomMarginRatioChanged();
    void scaleFactorChanged();
    void rotationAngleChanged();

  private:
    mutable QSettings m_Settings;
};

//==============================
// non-member methods
//==============================
void initLogs();

//==============================
// inline methods implementation
//==============================


#endif // APPCONFIGURATION_HPP

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

  Q_PROPERTY(qreal zoom READ zoom WRITE setZoom NOTIFY zoomChanged)
  Q_PROPERTY(qreal colorTemp READ colorTemp WRITE setColorTemp NOTIFY colorTempChanged)
  Q_PROPERTY(QSize resolution READ resolution WRITE setResolution NOTIFY resolutionChanged)
  Q_PROPERTY(QCamera::Position cameraPosition READ cameraPosition WRITE setCameraPosition NOTIFY cameraPositionChanged)

  public:
    explicit AppConfiguration(QObject* a_Parent = 0);

    qreal zoom() const;
    void setZoom(qreal a_Value);

    qreal colorTemp() const;
    void setColorTemp(qreal a_Value);

    QSize resolution() const;
    void setResolution(const QSize& a_Value);

    QCamera::Position cameraPosition() const;
    void setCameraPosition(const QCamera::Position& a_Value);

  public slots:

  private:

  signals:
    void zoomChanged();
    void colorTempChanged();
    void resolutionChanged();
    void cameraPositionChanged();

  private:
    mutable QSettings m_Settings;
};

//==============================
// non-member methods
//==============================
QString configFilename();

//==============================
// inline methods implementation
//==============================


#endif // APPCONFIGURATION_HPP

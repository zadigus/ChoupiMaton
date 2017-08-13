#include "AppConfiguration.hpp"

#include <QApplication>
#include <QSettings>
#include <QDir>
#include <QStandardPaths>

//----------------------------------------------------------------------------------------------
QString configFilename()
{
  return QDir(QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation)[0]).absoluteFilePath(QCoreApplication::applicationName().append(".conf"));
}

//----------------------------------------------------------------------------------------------
AppConfiguration::AppConfiguration(QObject* a_Parent)
  : QObject(a_Parent)
  , m_Settings(configFilename(), QSettings::IniFormat)
{ }

//----------------------------------------------------------------------------------------------
qreal AppConfiguration::zoom() const
{
  m_Settings.beginGroup("Camera");
  auto result(m_Settings.value("zoom", 1).toReal());
  m_Settings.endGroup();
  return result;
}

//----------------------------------------------------------------------------------------------
void AppConfiguration::setZoom(qreal a_Value)
{
  m_Settings.beginGroup("Camera");
  m_Settings.setValue("zoom", a_Value);
  m_Settings.endGroup();
  emit zoomChanged();
}

//----------------------------------------------------------------------------------------------
qreal AppConfiguration::colorTemp() const
{
  m_Settings.beginGroup("Camera");
  auto result(m_Settings.value("colorTemp", 7000).toReal());
  m_Settings.endGroup();
  return result;
}

//----------------------------------------------------------------------------------------------
void AppConfiguration::setColorTemp(qreal a_Value)
{
  m_Settings.beginGroup("Camera");
  m_Settings.setValue("colorTemp", a_Value);
  m_Settings.endGroup();
  emit colorTempChanged();
}

//----------------------------------------------------------------------------------------------
QSize AppConfiguration::resolution() const
{
  m_Settings.beginGroup("Camera");
  auto result(m_Settings.value("resolution", QSize(1920, 1080)).toSize());
  m_Settings.endGroup();
  return result;
}

//----------------------------------------------------------------------------------------------
void AppConfiguration::setResolution(const QSize& a_Value)
{
  m_Settings.beginGroup("Camera");
  m_Settings.setValue("resolution", a_Value);
  m_Settings.endGroup();
  emit resolutionChanged();
}

//----------------------------------------------------------------------------------------------
QCamera::Position AppConfiguration::cameraPosition() const
{
  m_Settings.beginGroup("Camera");
  auto result(m_Settings.value("position", static_cast<int>(QCamera::FrontFace)).toInt());
  m_Settings.endGroup();
  return QCamera::Position(result);
}

//----------------------------------------------------------------------------------------------
void AppConfiguration::setCameraPosition(const QCamera::Position& a_Value)
{
  m_Settings.beginGroup("Camera");
  m_Settings.setValue("position", static_cast<int>(a_Value));
  m_Settings.endGroup();
  emit cameraPositionChanged();
}

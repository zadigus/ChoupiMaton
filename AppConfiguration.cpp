#include "AppConfiguration.hpp"

#include "Logger/Logger.hpp"

#include "common/ConfigHelpers.hpp"

#include <QMessageBox>

//-----------------------------------------------------
void initLogs()
{
  N_Logger::resetLogFile();
  qInstallMessageHandler(N_Logger::message);
}

//----------------------------------------------------------------------------------------------
AppConfiguration::AppConfiguration(QObject* a_Parent)
  : QObject(a_Parent)
  , m_Settings(N_Common::configFilename(), QSettings::IniFormat)
{
  if(logsEnabled())
  {
    initLogs();
  }
}

//----------------------------------------------------------------------------------------------
bool AppConfiguration::settingsFileExists() const
{
  m_Settings.beginGroup("Logs");
  auto exists(m_Settings.contains("activated"));
  m_Settings.endGroup();
  return exists;
}

//----------------------------------------------------------------------------------------------
bool AppConfiguration::logsEnabled() const
{
  m_Settings.beginGroup("Logs");
  auto result(m_Settings.value("activated", true).toBool());
  m_Settings.endGroup();
  return result;
}

//----------------------------------------------------------------------------------------------
uint AppConfiguration::savingTime() const
{
  m_Settings.beginGroup("SavingProcess");
  auto result(m_Settings.value("savingDuration", 15000).toUInt());
  m_Settings.endGroup();
  return result;
}

//----------------------------------------------------------------------------------------------
QString AppConfiguration::fotozorInstanceName() const
{
  m_Settings.beginGroup("Text");
  auto result(m_Settings.value("instanceName", "Fotozor").toString());
  m_Settings.endGroup();
  return result;
}

//----------------------------------------------------------------------------------------------
QString AppConfiguration::introductionText() const
{
  m_Settings.beginGroup("Text");
  auto result(m_Settings.value("introductionText", "This is the introduction").toString());
  m_Settings.endGroup();
  return result;
}

//----------------------------------------------------------------------------------------------
QString AppConfiguration::savingText() const
{
  m_Settings.beginGroup("Text");
  auto result(m_Settings.value("savingText", "This is the text during saving").toString());
  m_Settings.endGroup();
  return result;
}

//----------------------------------------------------------------------------------------------
QString AppConfiguration::savingTitle() const
{
  m_Settings.beginGroup("Text");
  auto result(m_Settings.value("savingTitle", "We want to save...").toString());
  m_Settings.endGroup();
  return result;
}

//----------------------------------------------------------------------------------------------
QString AppConfiguration::printingText() const
{
  m_Settings.beginGroup("Text");
  auto result(m_Settings.value("printingText", "This is the text during printing").toString());
  m_Settings.endGroup();
  return result;
}

//----------------------------------------------------------------------------------------------
QString AppConfiguration::printingTitle() const
{
  m_Settings.beginGroup("Text");
  auto result(m_Settings.value("printingTitle", "We want to print...").toString());
  m_Settings.endGroup();
  return result;
}
	
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

//----------------------------------------------------------------------------------------------
qreal AppConfiguration::bottomMarginRatio() const
{
  m_Settings.beginGroup("PicLayout");
  auto result(m_Settings.value("bottomMarginRatio", 0.15).toReal());
  m_Settings.endGroup();
  return result;
}

//----------------------------------------------------------------------------------------------
void AppConfiguration::setBottomMarginRatio(qreal a_Value)
{
  m_Settings.beginGroup("PicLayout");
  m_Settings.setValue("bottomMarginRatio", a_Value);
  m_Settings.endGroup();
  emit bottomMarginRatioChanged();
}

//----------------------------------------------------------------------------------------------
qreal AppConfiguration::scaleFactor() const
{
  m_Settings.beginGroup("PicLayout");
  auto result(m_Settings.value("scaleFactor", 0.85).toReal());
  m_Settings.endGroup();
  return result;
}

//----------------------------------------------------------------------------------------------
void AppConfiguration::setScaleFactor(qreal a_Value)
{
  m_Settings.beginGroup("PicLayout");
  m_Settings.setValue("scaleFactor", a_Value);
  m_Settings.endGroup();
  emit scaleFactorChanged();
}

//----------------------------------------------------------------------------------------------
qreal AppConfiguration::rotationAngle() const
{
  m_Settings.beginGroup("PicLayout");
  auto result(m_Settings.value("rotationAngle", -90).toReal());
  m_Settings.endGroup();
  return result;
}

//----------------------------------------------------------------------------------------------
void AppConfiguration::setRotationAngle(qreal a_Value)
{
  m_Settings.beginGroup("PicLayout");
  m_Settings.setValue("rotationAngle", a_Value);
  m_Settings.endGroup();
  emit rotationAngleChanged();
}

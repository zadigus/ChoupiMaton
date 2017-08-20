#include "EngineConfigurator.hpp"

#include "AppConfiguration.hpp"

#include "PicturesProcessor/PicturesProcessor.hpp"

#include "PrinterManager/PrinterManager.hpp"

#include <QQmlApplicationEngine>
#include <QQmlContext>

//-----------------------------------------------------
EngineConfigurator::EngineConfigurator(QQmlApplicationEngine& a_Engine)
  : m_Engine(a_Engine)
  , m_AppConfig(new AppConfiguration)
  , m_PicsProc(new N_PicturesProcessor::PicturesProcessor)
  , m_PrinterMgr(new N_PrinterManager::PrinterManager)
{ }

//-----------------------------------------------------
EngineConfigurator::~EngineConfigurator()
{ }

//-----------------------------------------------------
void EngineConfigurator::loadQml(const QUrl& a_Path)
{
  m_Engine.load(a_Path);
}

//-----------------------------------------------------
void EngineConfigurator::setupContext()
{
  auto context(m_Engine.rootContext());

  context->setContextProperty("appConfig", m_AppConfig);

  context->setContextProperty("picsProcessor", m_PicsProc);
  QQmlEngine::setContextForObject(m_PicsProc, context);

  context->setContextProperty("printerMgr", m_PrinterMgr);

  setupConnections();
}

//-----------------------------------------------------
void EngineConfigurator::setupSettings()
{

}

//-----------------------------------------------------
void EngineConfigurator::setupConnections()
{

}

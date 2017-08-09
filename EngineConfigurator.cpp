#include "EngineConfigurator.hpp"

#include "PicturesProcessor/PicturesProcessor.hpp"

#include <QQmlApplicationEngine>
#include <QQmlContext>

//-----------------------------------------------------
EngineConfigurator::EngineConfigurator(QQmlApplicationEngine& a_Engine)
  : m_Engine(a_Engine)
  , m_PicsProc(new N_PicturesProcessor::PicturesProcessor)
{

}

//-----------------------------------------------------
void EngineConfigurator::loadQml(const QUrl& a_Path)
{
  m_Engine.load(a_Path);
}

//-----------------------------------------------------
void EngineConfigurator::setupContext()
{
  auto context(m_Engine.rootContext());
  context->setContextProperty("picsProcessor", m_PicsProc);
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

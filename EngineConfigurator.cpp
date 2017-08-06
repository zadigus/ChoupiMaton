#include "EngineConfigurator.hpp"

#include <QQmlApplicationEngine>

//-----------------------------------------------------
EngineConfigurator::EngineConfigurator(QQmlApplicationEngine& a_Engine)
  : m_Engine(a_Engine)
{

}

//-----------------------------------------------------
void EngineConfigurator::loadQml(const QUrl& a_Path)
{
  m_Engine.load(a_Path);
}

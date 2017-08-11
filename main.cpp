#include "EngineConfigurator.hpp"

#include "Logger/Logger.hpp"

#include <QApplication>
#include <QQmlApplicationEngine>

//-----------------------------------------------------
void registerMetaTypes()
{
//  qmlRegisterType<MyType>("MyUrl", 1, 0, "qmlName");
}

//-----------------------------------------------------
int main(int argc, char* argv[])
{
  QApplication app(argc,argv);

  QCoreApplication::setOrganizationName("Softosor");
  QCoreApplication::setOrganizationDomain("softosor.com");
  QCoreApplication::setApplicationName("Photosor");

  registerMetaTypes();

  QQmlApplicationEngine engine;
  EngineConfigurator ec(engine);

  N_Logger::resetLogFile();
  qInstallMessageHandler(N_Logger::message);

  ec.setupContext();
  ec.setupSettings();
  ec.loadQml(QUrl("qrc:/qml/main.qml"));
  return app.exec();
}


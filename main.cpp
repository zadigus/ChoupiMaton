#include "EngineConfigurator.hpp"

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
  ec.setupContext();
  ec.setupSettings();
  ec.loadQml(QUrl("qrc:/qml/main.qml"));
  return app.exec();
}


#include "EngineConfigurator.hpp"

#include "PrinterSetup/PrinterSetup.hpp"
#include "Data/PrinterData.hpp"

#include <QApplication>
#include <QQmlApplicationEngine>

//-----------------------------------------------------
void registerMetaTypes()
{
  qmlRegisterType<N_IosPrinterSetup::PrinterSetup>("IosPrinterSetup", 1, 0, "IosPrinterSetup");
  qRegisterMetaType<N_IosCommonData::PrinterData>();
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


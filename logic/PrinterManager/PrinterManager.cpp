#include "PrinterManager.hpp"
#include "PrinterManager/PrinterManagerImpl.hpp"

#include "ios/PrinterManager/PrinterManagerImpl.hpp"
#include "Data/PrinterData.hpp"

#include "common/ConfigHelpers.hpp"

namespace N_PrinterManager {

  //-----------------------------------------------------
  PrinterManager::PrinterManager(QObject* a_Parent)
    : QObject(a_Parent)
    , m_Settings(N_Common::configFilename(), QSettings::IniFormat)
#ifdef Q_OS_IOS
    , m_Impl(new N_IosPrinterManager::PrinterManagerImpl())
#endif
    , m_IsPrinterSet(false)
  { }

  //-----------------------------------------------------
  PrinterManager::~PrinterManager()
  { }

  //-----------------------------------------------------
  void PrinterManager::setPrinterData(const N_IosCommonData::PrinterData& a_Data)
  {
    m_Impl->setPrinterData(a_Data);
    auto isPrinter(a_Data.isPrinterSet());
    setPrinterSet(isPrinter);
  }

  //-----------------------------------------------------
  void PrinterManager::print(const QString& a_PathToImg)
  {
    if(!m_IsPrinterSet)
    {
      qWarning() << "No printer set --> we don't print anything.";
      return;
    }

    m_Impl->print(a_PathToImg);
  }

  //----------------------------------------------------------------------------------------------
  int PrinterManager::printDuration() const
  {
    m_Settings.beginGroup("Printer");
    auto result(m_Settings.value("printDuration", 80000).toInt());
    m_Settings.endGroup();
    return result;
  }

  //----------------------------------------------------------------------------------------------
  void PrinterManager::setPrintDuration(int a_Value)
  {
    m_Settings.beginGroup("Printer");
    m_Settings.setValue("printDuration", a_Value);
    m_Settings.endGroup();
    emit printDurationChanged();
  }

}

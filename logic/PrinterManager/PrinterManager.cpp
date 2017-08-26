#include "PrinterManager.hpp"
#include "PrinterManager/PrinterManagerImpl.hpp"

namespace N_PrinterManager {

#ifndef Q_OS_IOS
  //-----------------------------------------------------
  PrinterManager::PrinterManager(QObject* a_Parent)
    : QObject(a_Parent)
  { }
#endif

  //-----------------------------------------------------
  PrinterManager::~PrinterManager()
  { }

  //-----------------------------------------------------
  void PrinterManager::setPrinterData(const N_IosPrinterSetup::PrinterData& a_Data)
  {
    m_Impl->setPrinterData(a_Data);
  }

  //-----------------------------------------------------
  void PrinterManager::print(const QString& a_PathToImg) const
  {
    m_Impl->print(a_PathToImg);
  }

}

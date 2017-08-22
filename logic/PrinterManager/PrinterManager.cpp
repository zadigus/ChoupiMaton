#include "PrinterManager.hpp"
#include "PrinterManagerImpl.hpp"

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
  void PrinterManager::setupPrinter()
  {
    m_Impl->setupPrinter();
  }

  //-----------------------------------------------------
  void PrinterManager::print(const QString& a_PathToImg) const
  {
    m_Impl->print(a_PathToImg);
  }

}

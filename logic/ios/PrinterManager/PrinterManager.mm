#import "PrinterManager/PrinterManager.hpp"

#import "PrinterManagerImpl.hpp"

namespace N_PrinterManager {

  //-----------------------------------------------------
  PrinterManager::PrinterManager(QObject* a_Parent)
    : QObject(a_Parent)
    , m_Impl(new N_IosPrinterManager::PrinterManagerImpl())
    , m_IsPrinterSet(false)
  { }

}

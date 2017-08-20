#import "PrinterManager.hpp"

#import "IosPrinterManagerImpl.hpp"

namespace N_PrinterManager {

  //-----------------------------------------------------
  PrinterManager::PrinterManager(QObject* a_Parent)
    : QObject(a_Parent)
    , m_Impl(new IosPrinterManagerImpl())
  { }

}

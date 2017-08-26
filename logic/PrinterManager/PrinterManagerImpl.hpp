#ifndef PRINTERMANAGER_PRINTERMANAGERIMPL_HPP
#define PRINTERMANAGER_PRINTERMANAGERIMPL_HPP

#include "Global.hpp"

class QString;

namespace N_IosPrinterSetup {
  class PrinterData;
}

namespace N_PrinterManager {

  class PrinterManagerImpl
  {
    public:
      PrinterManagerImpl();
      virtual ~PrinterManagerImpl();

      virtual void setPrinterData(const N_IosPrinterSetup::PrinterData& a_Data) = 0;
      virtual void print(const QString& a_PathToImg) const = 0;

    private:
      Q_DISABLE_COPY(PrinterManagerImpl)
  };

  //==============================
  // inline methods implementation
  //==============================
  inline PrinterManagerImpl::PrinterManagerImpl()
  { }

  inline PrinterManagerImpl::~PrinterManagerImpl()
  { }

}

#endif

#ifndef PRINTERMANAGER_ABSTRACTPRINTERMANAGERIMPL_HPP
#define PRINTERMANAGER_ABSTRACTPRINTERMANAGERIMPL_HPP

#include "Global.hpp"

class QString;

namespace N_IosPrinterSetup {
  class PrinterData;
}

namespace N_PrinterManager {

  class AbstractPrinterManagerImpl
  {
    public:
      AbstractPrinterManagerImpl();
      virtual ~AbstractPrinterManagerImpl();

      virtual void setPrinterData(const N_IosPrinterSetup::PrinterData& a_Data) = 0;
      virtual void print(const QString& a_PathToImg) = 0;

    private:
      Q_DISABLE_COPY(AbstractPrinterManagerImpl);
  };

  //==============================
  // inline methods implementation
  //==============================
  inline AbstractPrinterManagerImpl::AbstractPrinterManagerImpl()
  { }

  inline AbstractPrinterManagerImpl::~AbstractPrinterManagerImpl()
  { }

}

#endif

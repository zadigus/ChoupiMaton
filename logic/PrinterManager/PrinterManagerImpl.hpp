#ifndef PRINTERMANAGER_PRINTERMANAGERIMPL_HPP
#define PRINTERMANAGER_PRINTERMANAGERIMPL_HPP

#include "Global.hpp"

namespace N_PrinterManager {

  class PrinterManagerImpl
  {
    public:
      PrinterManagerImpl();
      virtual ~PrinterManagerImpl();

      virtual void setupPrinter() = 0;

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

#ifndef IOSPRINTERSETUP_PRINTERSETUPIMPL_HPP
#define IOSPRINTERSETUP_PRINTERSETUPIMPL_HPP

#include "Global.hpp"

#include "IosPrinterData.hpp"

#include <QWidget>

namespace N_IosPrinterSetup {
  class PrinterSetup;
}

namespace N_IosPrinterSetup {

  class PrinterSetupImpl
  {
    public:
      PrinterSetupImpl(PrinterSetup* a_Parent);
      virtual ~PrinterSetupImpl();

      void onWindowChanged(WId a_Id, qreal a_X, qreal a_Y);

    private:
      PrinterSetup* m_Parent;
      PrinterData m_Data;
  };

}

#endif

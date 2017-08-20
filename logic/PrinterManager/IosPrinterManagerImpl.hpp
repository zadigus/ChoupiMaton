#import "PrinterManagerImpl.hpp"

#import <UIKit/UIPrinter.h>

namespace N_PrinterManager {
  class PrinterManager;
}

namespace N_PrinterManager {

  //-----------------------------------------------------
  class IosPrinterManagerImpl : public PrinterManagerImpl
  {
    public:
      IosPrinterManagerImpl();
      virtual ~IosPrinterManagerImpl();

      virtual void setupPrinter() override;

    private:
      UIPrinter* m_Printer;
  };

}

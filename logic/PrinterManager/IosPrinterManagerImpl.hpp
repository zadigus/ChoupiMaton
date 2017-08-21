#import "PrinterManagerImpl.hpp"

#import <UIKit/UIPrinter.h>

namespace N_PrinterManager {
  class PrinterManager;
}

class QWidget;

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
      QWidget* m_Dialog;
  };

}

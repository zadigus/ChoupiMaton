#import "PrinterManagerImpl.hpp"

#import <UIKit/UIPrinter.h>

class QWidget;

namespace N_PrinterManager {

  //-----------------------------------------------------
  class IosPrinterManagerImpl : public PrinterManagerImpl
  {
    public:
      IosPrinterManagerImpl();
      virtual ~IosPrinterManagerImpl();

      virtual void setupPrinter() override;
      virtual void print(const QString& a_PathToImg) const override;

    private:
      UIPrinter* m_Printer;
      QWidget* m_Dialog;
  };

}

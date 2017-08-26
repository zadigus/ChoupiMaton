#import "PrinterManagerImpl.hpp"

#import <UIKit/UIPrinter.h>

namespace N_PrinterManager {

  //-----------------------------------------------------
  class IosPrinterManagerImpl : public PrinterManagerImpl
  {
    public:
      IosPrinterManagerImpl();
      virtual ~IosPrinterManagerImpl();

      virtual void setPrinterData(const N_IosPrinterSetup::PrinterData& a_Data) override;
      virtual void print(const QString& a_PathToImg) const override;

    private:
      UIPrinter* m_Printer;
  };

}

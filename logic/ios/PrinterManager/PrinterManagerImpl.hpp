#ifndef IOS_PRINTERMANAGER_PRINTERMANAGERIMPL_HPP
#define IOS_PRINTERMANAGER_PRINTERMANAGERIMPL_HPP

#import "PrinterManager/PrinterManagerImpl.hpp"

#import <UIKit/UIPrinter.h>

namespace N_IosPrinterManager {

  //-----------------------------------------------------
  class PrinterManagerImpl : public N_PrinterManager::AbstractPrinterManagerImpl
  {
    public:
      PrinterManagerImpl();
      virtual ~PrinterManagerImpl();

      virtual void setPrinterData(const N_IosPrinterSetup::PrinterData& a_Data) override;
      virtual void print(const QString& a_PathToImg) const override;

    private:
      UIPrinter* m_Printer;
  };

}

#endif

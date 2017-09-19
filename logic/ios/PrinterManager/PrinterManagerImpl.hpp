#ifndef IOS_PRINTERMANAGER_PRINTERMANAGERIMPL_HPP
#define IOS_PRINTERMANAGER_PRINTERMANAGERIMPL_HPP

#include "PrinterManager/PrinterManagerImpl.hpp"

Q_FORWARD_DECLARE_OBJC_CLASS(UIPrinter);
Q_FORWARD_DECLARE_OBJC_CLASS(UIPrintInfo);
Q_FORWARD_DECLARE_OBJC_CLASS(PictureRenderer);

namespace N_IosPrinterManager {

  //-----------------------------------------------------
  class PrinterManagerImpl : public N_PrinterManager::AbstractPrinterManagerImpl
  {
    public:
      PrinterManagerImpl();
      virtual ~PrinterManagerImpl();

      virtual void setPrinterData(const N_IosPrinterSetup::PrinterData& a_Data) override;
      virtual void print(const QString& a_PathToImg) override;

    private:
      void setPrintInfo();

    private:
      UIPrinter* m_Printer;
      UIPrintInfo* m_PrintInfo;
      PictureRenderer* m_Renderer;
  };

}

#endif

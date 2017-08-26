#ifndef IOSPRINTERSETUP_PRINTERDATA_HPP
#define IOSPRINTERSETUP_PRINTERDATA_HPP

#include "Global.hpp"

#include <QMetaType>

Q_FORWARD_DECLARE_OBJC_CLASS(UIPrinter);

namespace N_IosPrinterSetup {

  class PrinterData
  {
    public:
      PrinterData();
      virtual ~PrinterData();
      PrinterData(const PrinterData& a_Other);

      void setPrinter(UIPrinter* a_Printer);
      UIPrinter* getPrinter() const;

    private:
      UIPrinter* m_Printer;
//      UIPrintInfo* m_PrintInfo;
  };

  //==============================
  // inline methods implementation
  //==============================

  inline UIPrinter* PrinterData::getPrinter() const
  {
      return m_Printer;
  }

}

Q_DECLARE_METATYPE(N_IosPrinterSetup::PrinterData)

#endif

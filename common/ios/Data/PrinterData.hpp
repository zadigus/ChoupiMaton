#ifndef IOS_COMMON_PRINTERDATA_HPP
#define IOS_COMMON_PRINTERDATA_HPP

#include "Global.hpp"

#include <QMetaType>

Q_FORWARD_DECLARE_OBJC_CLASS(UIPrinter);

namespace N_IosCommonData {

  class PrinterData
  {
    public:
      PrinterData();
      virtual ~PrinterData();
      PrinterData(const PrinterData& a_Other);

      void setPrinter(UIPrinter* a_Printer);
      UIPrinter* getPrinter() const;

      bool isPrinterSet() const;

    private:
      UIPrinter* m_Printer;
  };

  //==============================
  // inline methods implementation
  //==============================

  inline UIPrinter* PrinterData::getPrinter() const
  {
      return m_Printer;
  }

  inline bool PrinterData::isPrinterSet() const
  {
      return m_Printer != NULL;
  }

}

Q_DECLARE_METATYPE(N_IosCommonData::PrinterData)

#endif

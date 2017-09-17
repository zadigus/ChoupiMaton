#ifndef IOSPRINTERSETUP_PRINTERSETUPIMPL_HPP
#define IOSPRINTERSETUP_PRINTERSETUPIMPL_HPP

#include "Global.hpp"

#include "Data/PrinterData.hpp"

#include <QWidget> // this is for the definition of type WId

Q_FORWARD_DECLARE_OBJC_CLASS(UIPrinterPickerController);
Q_FORWARD_DECLARE_OBJC_CLASS(UIView);
Q_FORWARD_DECLARE_OBJC_CLASS(UIPrinter);

namespace N_IosPrinterSetup {
  class PrinterSetup;
}

namespace N_IosPrinterSetup {

  class PrinterSetupImpl
  {
    public:
      PrinterSetupImpl(PrinterSetup* a_Parent);
      virtual ~PrinterSetupImpl();

      void onWindowChanged(WId a_Id);
      void setX(qreal a_Value);
      void setY(qreal a_Value);

      void show(bool a_Show);

      QString getPrinterName() const;

      void resetPrinter();

    private:
      void showPicker();
      void hidePicker();

      void setPrinter(UIPrinter* a_Printer);

    private:
      PrinterSetup* m_Parent;
      UIPrinterPickerController* m_Picker;
      UIView* m_View;
      N_IosCommonData::PrinterData m_Data;

      qreal m_X;
      qreal m_Y;
  };

}

#endif

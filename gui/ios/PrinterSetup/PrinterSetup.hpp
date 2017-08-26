#ifndef IOSPRINTERSETUP_PRINTERSETUP_HPP
#define IOSPRINTERSETUP_PRINTERSETUP_HPP

#include "Global.hpp"

#include "PrinterSetup/PrinterData.hpp"

#include <QQuickItem>

namespace N_IosPrinterSetup {
  class PrinterSetupImpl;
}

namespace N_IosPrinterSetup {

  class PrinterSetup : public QQuickItem
  {
    Q_OBJECT

    Q_PROPERTY(N_IosPrinterSetup::PrinterData printerData READ printerData WRITE setPrinterData NOTIFY printerDataChanged)

    public:
      PrinterSetup(QQuickItem* a_Parent = Q_NULLPTR);
      virtual ~PrinterSetup();

      void setPrinterData(const PrinterData& a_Data);
      PrinterData printerData() const;

    private slots:
      void onWindowChanged(QQuickWindow* a_Window);

    signals:
      void printerDataChanged();

    private:
      std::unique_ptr<PrinterSetupImpl> m_Impl;
      PrinterData m_Data;
  };

  //==============================
  // inline methods implementation
  //==============================

  inline PrinterData PrinterSetup::printerData() const
  {
    return m_Data;
  }

}

#endif

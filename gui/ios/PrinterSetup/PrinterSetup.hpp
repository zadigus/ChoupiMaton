#ifndef IOSPRINTERSETUP_PRINTERSETUP_HPP
#define IOSPRINTERSETUP_PRINTERSETUP_HPP

#include "Global.hpp"

#include "Data/PrinterData.hpp"

#include <QQuickItem>

namespace N_IosPrinterSetup {
  class PrinterSetupImpl;
}

namespace N_IosPrinterSetup {

  class PrinterSetup : public QQuickItem
  {
    Q_OBJECT

    Q_PROPERTY(N_IosCommonData::PrinterData printerData READ printerData WRITE setPrinterData NOTIFY printerDataChanged)
    Q_PROPERTY(QString printerName READ printerName NOTIFY printerDataChanged)

    public:
      PrinterSetup(QQuickItem* a_Parent = Q_NULLPTR);
      virtual ~PrinterSetup();

      Q_INVOKABLE void resetPrinter();

      void setPrinterData(const N_IosCommonData::PrinterData& a_Data);
      N_IosCommonData::PrinterData printerData() const;

      QString printerName() const;

    private slots:
      void onWindowChanged(QQuickWindow* a_Window);

    signals:
      void printerDataChanged();

    private:
      std::unique_ptr<PrinterSetupImpl> m_Impl;
      N_IosCommonData::PrinterData m_Data;
  };

  //==============================
  // inline methods implementation
  //==============================

  inline N_IosCommonData::PrinterData PrinterSetup::printerData() const
  {
    return m_Data;
  }

}

#endif

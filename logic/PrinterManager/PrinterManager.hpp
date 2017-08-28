#ifndef PRINTERMANAGER_PRINTERMANAGER_HPP
#define PRINTERMANAGER_PRINTERMANAGER_HPP

#include "Global.hpp"

#include <QObject>

namespace N_PrinterManager {
  class AbstractPrinterManagerImpl;
}

namespace N_IosPrinterSetup {
  class PrinterData;
}

namespace N_PrinterManager {

  class PrinterManager : public QObject
  {
      Q_OBJECT

    public:
      PrinterManager(QObject* a_Parent = Q_NULLPTR);
      virtual ~PrinterManager();

      Q_INVOKABLE void print(const QString& a_PathToImg) const;
      Q_INVOKABLE void setPrinterData(const N_IosPrinterSetup::PrinterData& a_Data);
      Q_INVOKABLE bool isPrinterSet() const;

    private:
      Q_DISABLE_COPY(PrinterManager);

    private:
      std::unique_ptr<AbstractPrinterManagerImpl> m_Impl;
      bool m_IsPrinterSet;

  };

  //==============================
  // inline methods implementation
  //==============================
  inline bool PrinterManager::isPrinterSet() const
  {
    return m_IsPrinterSet;
  }

}

#endif

#ifndef PRINTERMANAGER_PRINTERMANAGER_HPP
#define PRINTERMANAGER_PRINTERMANAGER_HPP

#include "Global.hpp"

#include <QObject>

namespace N_PrinterManager {
  class PrinterManagerImpl;
}

namespace N_PrinterManager {

  class PrinterManager : public QObject
  {
      Q_OBJECT

    public:
      PrinterManager(QObject* a_Parent = Q_NULLPTR);
      virtual ~PrinterManager();

      Q_INVOKABLE void setupPrinter();

    private:
      Q_DISABLE_COPY(PrinterManager)

    private:
      std::unique_ptr<PrinterManagerImpl> m_Impl;

  };

}

#endif

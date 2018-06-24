#ifndef PRINTERMANAGER_ABSTRACTPRINTERMANAGERIMPL_HPP
#define PRINTERMANAGER_ABSTRACTPRINTERMANAGERIMPL_HPP

#include "Global.hpp"

#include <QObject>

class QString;

namespace N_IosCommonData {
  class PrinterData;
}

namespace N_PrinterManager {

  class AbstractPrinterManagerImpl : public QObject
  {
    Q_OBJECT

    public:
      AbstractPrinterManagerImpl(QObject* a_parent = nullptr);
      virtual ~AbstractPrinterManagerImpl();

      virtual void setPrinterData(const N_IosCommonData::PrinterData& a_Data) = 0;
      virtual void print(const QString& a_PathToImg) = 0;

    Q_SIGNAL void cancelled();

    private:
      Q_DISABLE_COPY(AbstractPrinterManagerImpl)
  };

  //==============================
  // inline methods implementation
  //==============================
  inline AbstractPrinterManagerImpl::AbstractPrinterManagerImpl(QObject* a_parent)
    : QObject(a_parent)
  { }

  inline AbstractPrinterManagerImpl::~AbstractPrinterManagerImpl()
  { }

}

#endif

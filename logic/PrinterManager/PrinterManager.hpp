#ifndef PRINTERMANAGER_PRINTERMANAGER_HPP
#define PRINTERMANAGER_PRINTERMANAGER_HPP

#include "Global.hpp"

#include <QObject>
#include <QSettings>

namespace N_PrinterManager {
  class AbstractPrinterManagerImpl;
}

namespace N_IosCommonData {
  class PrinterData;
}

namespace N_PrinterManager {

  class PrinterManager : public QObject
  {
      Q_OBJECT

      Q_PROPERTY(int printDuration READ printDuration WRITE setPrintDuration NOTIFY printDurationChanged)
      Q_PROPERTY(bool printerSet READ printerSet WRITE setPrinterSet NOTIFY printerSetChanged)

    public:
      PrinterManager(QObject* a_Parent = Q_NULLPTR);
      virtual ~PrinterManager();

      Q_INVOKABLE void print(const QString& a_PathToImg);
      Q_INVOKABLE void setPrinterData(const N_IosCommonData::PrinterData& a_Data);

      bool printerSet() const;
      void setPrinterSet(bool a_Value);

      int printDuration() const;
      void setPrintDuration(int a_Value);

    private:
      Q_DISABLE_COPY(PrinterManager)

      Q_SLOT void onPrintCancelled();

    signals:
      void printDurationChanged();
      void printerSetChanged();
      void printCancelled();

    private:
      mutable QSettings m_Settings;
      AbstractPrinterManagerImpl* m_Impl;
      bool m_IsPrinterSet;
  };

  //==============================
  // non-member methods
  //==============================

  //==============================
  // inline methods implementation
  //==============================

  //-----------------------------------------------------
  inline bool PrinterManager::printerSet() const
  {
    return m_IsPrinterSet;
  }

  //-----------------------------------------------------
  inline void PrinterManager::setPrinterSet(bool a_Value)
  {
    m_IsPrinterSet = a_Value;
    emit printerSetChanged();
  }

}

#endif

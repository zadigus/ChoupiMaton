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
      Q_PROPERTY(int paperFrequency READ paperFrequency WRITE setPaperFrequency NOTIFY paperFrequencyChanged)
      Q_PROPERTY(int inkFrequency READ inkFrequency WRITE setInkFrequency NOTIFY inkFrequencyChanged)
      Q_PROPERTY(bool needPaper READ needPaper WRITE setNeedPaper NOTIFY needPaperChanged)
      Q_PROPERTY(bool needInk READ needInk WRITE setNeedInk NOTIFY needInkChanged)
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

      int paperFrequency() const;
      void setPaperFrequency(int a_Value);

      int inkFrequency() const;
      void setInkFrequency(int a_Value);

      bool needPaper() const;
      void setNeedPaper(bool a_Value);

      bool needInk() const;
      void setNeedInk(bool a_Value);

    private:
      Q_DISABLE_COPY(PrinterManager);

    signals:
      void printDurationChanged();
      void paperFrequencyChanged();
      void inkFrequencyChanged();
      void printerSetChanged();
      void needPaperChanged();
      void needInkChanged();

    private:
      mutable QSettings m_Settings;
      std::unique_ptr<AbstractPrinterManagerImpl> m_Impl;
      bool m_IsPrinterSet;
      int m_NbPrints;
      bool m_NeedPaper;
      bool m_NeedInk;
  };

  //==============================
  // non-member methods
  //==============================
  QString configFilename();

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

  //-----------------------------------------------------
  inline bool PrinterManager::needPaper() const
  {
    return m_NeedPaper;
  }

  //-----------------------------------------------------
  inline void PrinterManager::setNeedPaper(bool a_Value)
  {
    m_NeedPaper = a_Value;
    emit needPaperChanged();
  }

  //-----------------------------------------------------
  inline bool PrinterManager::needInk() const
  {
    return m_NeedInk;
  }

  //-----------------------------------------------------
  inline void PrinterManager::setNeedInk(bool a_Value)
  {
    m_NeedInk = a_Value;
    emit needInkChanged();
  }

}

#endif

#include "PrinterManager.hpp"
#include "PrinterManager/PrinterManagerImpl.hpp"

#include "ios/PrinterManager/PrinterManagerImpl.hpp"

#include <QDir>
#include <QStandardPaths>

namespace N_PrinterManager {

  //----------------------------------------------------------------------------------------------
  QString configFilename()
  {
    return QDir(QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation)[0]).absoluteFilePath("Printer.conf");
  }

  //-----------------------------------------------------
  PrinterManager::PrinterManager(QObject* a_Parent)
    : QObject(a_Parent)
    , m_Settings(configFilename(), QSettings::IniFormat)
#ifdef Q_OS_IOS
    , m_Impl(new N_IosPrinterManager::PrinterManagerImpl())
#endif
    , m_IsPrinterSet(false)
    , m_NbPrints(0)
    , m_NeedPaper(false)
    , m_NeedInk(false)
  { }

  //-----------------------------------------------------
  PrinterManager::~PrinterManager()
  { }

  //-----------------------------------------------------
  void PrinterManager::setPrinterData(const N_IosPrinterSetup::PrinterData& a_Data)
  {
    m_Impl->setPrinterData(a_Data);
    setPrinterSet(true);
    setNeedInk(true);
    setNeedPaper(true);
  }

  //-----------------------------------------------------
  void PrinterManager::print(const QString& a_PathToImg)
  {
    m_Impl->print(a_PathToImg);
    ++m_NbPrints;
    if(m_NbPrints % paperFrequency() == 0)
    {
      qInfo() << "paper needed: nbPrints = " << m_NbPrints << ", paperFreq = " << paperFrequency();
      setNeedPaper(true);
    }
    if(m_NbPrints % inkFrequency() == 0)
    {
      qInfo() << "ink needed: nbPrints = " << m_NbPrints << ", inkFreq = " << inkFrequency();
      setNeedInk(true);
    }
  }

  //----------------------------------------------------------------------------------------------
  int PrinterManager::printDuration() const
  {
    m_Settings.beginGroup("Printer");
    auto result(m_Settings.value("printDuration", 80000).toInt());
    m_Settings.endGroup();
    return result;
  }

  //----------------------------------------------------------------------------------------------
  void PrinterManager::setPrintDuration(int a_Value)
  {
    m_Settings.beginGroup("Printer");
    m_Settings.setValue("printDuration", a_Value);
    m_Settings.endGroup();
    emit printDurationChanged();
  }

  //----------------------------------------------------------------------------------------------
  int PrinterManager::paperFrequency() const
  {
    m_Settings.beginGroup("Printer");
    auto result(m_Settings.value("paperFrequency", 18).toInt());
    m_Settings.endGroup();
    return result;
  }

  //----------------------------------------------------------------------------------------------
  void PrinterManager::setPaperFrequency(int a_Value)
  {
    m_Settings.beginGroup("Printer");
    m_Settings.setValue("paperFrequency", a_Value);
    m_Settings.endGroup();
    emit paperFrequencyChanged();
  }

  //----------------------------------------------------------------------------------------------
  int PrinterManager::inkFrequency() const
  {
    m_Settings.beginGroup("Printer");
    auto result(m_Settings.value("inkFrequency", 54).toInt());
    m_Settings.endGroup();
    return result;
  }

  //----------------------------------------------------------------------------------------------
  void PrinterManager::setInkFrequency(int a_Value)
  {
    m_Settings.beginGroup("Printer");
    m_Settings.setValue("inkFrequency", a_Value);
    m_Settings.endGroup();
    emit inkFrequencyChanged();
  }

}

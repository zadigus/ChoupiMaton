#include "PrinterSetup.hpp"

#include "PrinterSetupImpl.hpp"

#include <QQuickWindow>
#include <QUrl>

namespace N_IosPrinterSetup {

  //----------------------------------------------------------------------------------------------
  PrinterSetup::PrinterSetup(QQuickItem* a_Parent)
    : QQuickItem(a_Parent)
    , m_Impl(new PrinterSetupImpl(this))
  {
    connect(this, &PrinterSetup::windowChanged, this, &PrinterSetup::onWindowChanged);
  }

  //----------------------------------------------------------------------------------------------
  PrinterSetup::~PrinterSetup()
  { }

  //----------------------------------------------------------------------------------------------
  void PrinterSetup::onWindowChanged(QQuickWindow* a_Window)
  {
    if(a_Window != Q_NULLPTR)
    {
      m_Impl->onWindowChanged(a_Window->winId(), x(), y());
    }
  }

  //----------------------------------------------------------------------------------------------
  void PrinterSetup::setPrinterData(const PrinterData& a_Data)
  {
    m_Data = a_Data;
    emit printerDataChanged();
  }
}

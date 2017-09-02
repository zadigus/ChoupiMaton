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
    connect(this, &PrinterSetup::visibleChanged, this, [this]() { m_Impl->show(isVisible()); });
    connect(this, &PrinterSetup::xChanged, this, [this]() { m_Impl->setX(x()); });
    connect(this, &PrinterSetup::yChanged, this, [this]() { m_Impl->setY(y()); });
  }

  //----------------------------------------------------------------------------------------------
  PrinterSetup::~PrinterSetup()
  { }

  //----------------------------------------------------------------------------------------------
  void PrinterSetup::onWindowChanged(QQuickWindow* a_Window)
  {
    if(a_Window != Q_NULLPTR)
    {
      m_Impl->onWindowChanged(a_Window->winId());
    }
  }

  //----------------------------------------------------------------------------------------------
  void PrinterSetup::setPrinterData(const PrinterData& a_Data)
  {
    m_Data = a_Data;
    emit printerDataChanged();
  }

  //----------------------------------------------------------------------------------------------
  QString PrinterSetup::printerName() const
  {
    return m_Impl->getPrinterName();
  }
}

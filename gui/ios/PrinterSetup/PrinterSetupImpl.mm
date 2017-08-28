#import "PrinterSetupImpl.hpp"
#import "PrinterSetup.hpp"

#import <QQuickWindow>
#import <QUrl>

#import <UIKit/UIPrinterPickerController.h>
#import <UIKit/UIPrinter.h>

namespace N_IosPrinterSetup {

  //----------------------------------------------------------------------------------------------
  PrinterSetupImpl::PrinterSetupImpl(PrinterSetup* a_Parent)
    : m_Parent(a_Parent)
    , m_Picker([UIPrinterPickerController printerPickerControllerWithInitiallySelectedPrinter:0]) // TODO: get the initial printer from the appConfiguration
    , m_View(Q_NULLPTR)
    , m_X(0)
    , m_Y(0)
  { }

  //----------------------------------------------------------------------------------------------
  PrinterSetupImpl::~PrinterSetupImpl()
  { }

  //----------------------------------------------------------------------------------------------
  void PrinterSetupImpl::onWindowChanged(WId a_Id)
  {
    m_View = reinterpret_cast<UIView*>(a_Id);
  }

  //----------------------------------------------------------------------------------------------
  void PrinterSetupImpl::setX(qreal a_Value)
  {
    m_X = a_Value;
  }

  //----------------------------------------------------------------------------------------------
  void PrinterSetupImpl::setY(qreal a_Value)
  {
    m_Y = a_Value;
  }

  //----------------------------------------------------------------------------------------------
  void PrinterSetupImpl::showPicker()
  {
    if(m_View)
    {
      auto bounds(CGRectMake(m_X, m_Y, 0, 0));
      [m_Picker presentFromRect:bounds inView:m_View animated:YES
                              completionHandler:^(UIPrinterPickerController* controller, BOOL userDidSelect, NSError* /*err*/)
      {
        if(userDidSelect)
        {
          auto printer = controller.selectedPrinter;
          m_Data.setPrinter(printer);
          m_Parent->setPrinterData(m_Data);
        }
      }];
    }
  }

  //----------------------------------------------------------------------------------------------
  void PrinterSetupImpl::hidePicker()
  {
    if(m_View)
    {
      [m_Picker dismissAnimated:true];
    }
  }

  //----------------------------------------------------------------------------------------------
  void PrinterSetupImpl::show(bool a_Show)
  {
    a_Show ? showPicker() : hidePicker();
  }

  //----------------------------------------------------------------------------------------------
  QString PrinterSetupImpl::getPrinterName() const
  {
    auto printerName(QString::fromNSString([m_Data.getPrinter() displayName]));
    return printerName.isEmpty() ? QObject::tr("No printer") : printerName;
  }

}

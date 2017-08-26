#import "IosPrinterSetupImpl.hpp"
#import "IosPrinterSetup.hpp"

#import <QQuickWindow>
#import <QUrl>

#import <UIKit/UIPrinterPickerController.h>
#import <UIKit/UIPrinter.h>

namespace N_IosPrinterSetup {

  //----------------------------------------------------------------------------------------------
  PrinterSetupImpl::PrinterSetupImpl(PrinterSetup* a_Parent)
    : m_Parent(a_Parent)
  { }

  //----------------------------------------------------------------------------------------------
  PrinterSetupImpl::~PrinterSetupImpl()
  { }

  //----------------------------------------------------------------------------------------------
  void PrinterSetupImpl::onWindowChanged(WId a_Id, qreal a_X, qreal a_Y)
  {
    if(auto view = reinterpret_cast<UIView*>(a_Id))
    {
      auto picker = [UIPrinterPickerController printerPickerControllerWithInitiallySelectedPrinter:0]; // TODO: get the initial printer from the appConfiguration

      auto bounds(CGRectMake(a_X, a_Y, 0, 0));

      [picker presentFromRect:bounds inView:view animated:YES
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
}

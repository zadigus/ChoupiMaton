#import "PrinterSetup.hpp"

#import <QQuickWindow>
#import <QUrl>

#import <UIKit/UIPrinterPickerController.h>
#import <UIKit/UIPrintInfo.h>
#import <UIKit/UIPrinter.h>

namespace N_PrinterSetup {

  //----------------------------------------------------------------------------------------------
  PrinterSetup::PrinterSetup(QQuickItem* a_Parent)
    : QQuickItem(a_Parent)
  {
    connect(this, &PrinterSetup::windowChanged, this, &PrinterSetup::onWindowChanged);
  }

  //----------------------------------------------------------------------------------------------
  PrinterSetup::~PrinterSetup()
  {

  }

  //----------------------------------------------------------------------------------------------
  void PrinterSetup::onWindowChanged(QQuickWindow* a_Window)
  {

    if(a_Window != Q_NULLPTR)
    {
      if(auto view = reinterpret_cast<UIView*>(a_Window->winId()))
      {
        auto picker = [UIPrinterPickerController printerPickerControllerWithInitiallySelectedPrinter:0]; // TODO: get the initial printer from the appConfiguration

        auto bounds(CGRectMake(x(), y(), 0, 0));

        [picker presentFromRect:bounds inView:view animated:YES
                                completionHandler:^(UIPrinterPickerController* controller, BOOL userDidSelect, NSError* /*err*/)
        {
          if(userDidSelect)
          {
            auto printer = controller.selectedPrinter;

            qInfo() << "printer name     = " << QString::fromNSString([printer displayName]);
            qInfo() << "printer location = " << QString::fromNSString([printer displayLocation]);
            qInfo() << "printer url      = " << QUrl::fromNSURL([printer URL]);
          }
        }];
      }
    }
  }
}

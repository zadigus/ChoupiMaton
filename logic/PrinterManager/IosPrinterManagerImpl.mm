#import "IosPrinterManagerImpl.hpp"

#import <QApplication>
#import <QWidget>
#import <QWindow>
#import <QUrl>

#import <UIKit/UIPrinterPickerController.h>
#import <UIKit/UIPrintInteractionController.h>
#import <UIKit/UIPrintInfo.h>

namespace N_PrinterManager {

  //-----------------------------------------------------
  IosPrinterManagerImpl::IosPrinterManagerImpl()
    : PrinterManagerImpl()
    , m_Printer(Q_NULLPTR)
    , m_Dialog(new QWidget(QApplication::activeWindow()))
  {
    m_Dialog->setGeometry(0, 0, 100, 100);
  }

  //-----------------------------------------------------
  IosPrinterManagerImpl::~IosPrinterManagerImpl()
  { }

  //-----------------------------------------------------
  void IosPrinterManagerImpl::setupPrinter()
  {
    auto picker = [UIPrinterPickerController printerPickerControllerWithInitiallySelectedPrinter:m_Printer];

    if(auto view = reinterpret_cast<UIView*>(m_Dialog->window()->winId()))
    {
      [picker presentFromRect:view.bounds inView:view animated:YES
              completionHandler:^(UIPrinterPickerController* controller, BOOL userDidSelect, NSError* /*err*/)
              {
                if(userDidSelect)
                {
                  m_Printer = controller.selectedPrinter;

                  qInfo() << "printer name     = " << QString::fromNSString([m_Printer displayName]);
                  qInfo() << "printer location = " << QString::fromNSString([m_Printer displayLocation]);
                  qInfo() << "printer url      = " << QUrl::fromNSURL([m_Printer URL]);
                }

              }

      ];
    }
  }

  //-----------------------------------------------------
  void IosPrinterManagerImpl::print(const QString& a_PathToImg) const
  {
    auto printInfo([UIPrintInfo printInfo]);
    printInfo.jobName = @"Test";
    printInfo.outputType = UIPrintInfoOutputPhoto;

    auto imgUrl([NSURL fileURLWithPath:a_PathToImg.toNSString()]);
    auto canPrint([UIPrintInteractionController canPrintURL: imgUrl]);

    auto controller = [UIPrintInteractionController sharedPrintController];
    if(controller && canPrint)
    {
      controller.printInfo = printInfo;
      controller.printingItem = imgUrl;
      qInfo() << "Printing image located at <" << QUrl::fromNSURL(imgUrl) << ">";
      [controller printToPrinter: m_Printer
                  completionHandler: ^(UIPrintInteractionController* /*printCtrl*/, BOOL completed, NSError* err)
      {
        if(completed && !err)
        {
          qInfo() << "Print successful";
        }
      }];
    }
  }

}

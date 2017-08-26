#import "PrinterManagerImpl.hpp"

#import "PrinterSetup/PrinterData.hpp"

#import <QUrl>

#import <UIKit/UIPrintInteractionController.h>
#import <UIKit/UIPrintInfo.h>

namespace N_IosPrinterManager {

  //-----------------------------------------------------
  PrinterManagerImpl::PrinterManagerImpl()
    : N_PrinterManager::AbstractPrinterManagerImpl()
    , m_Printer(Q_NULLPTR)
  { }

  //-----------------------------------------------------
  PrinterManagerImpl::~PrinterManagerImpl()
  { }

  //-----------------------------------------------------
  void PrinterManagerImpl::setPrinterData(const N_IosPrinterSetup::PrinterData& a_Data)
  {
    m_Printer = a_Data.getPrinter();
    qInfo() << "PrinterManagerImpl:";
    qInfo() << "printer name     = " << QString::fromNSString([m_Printer displayName]);
    qInfo() << "printer location = " << QString::fromNSString([m_Printer displayLocation]);
    qInfo() << "printer url      = " << QUrl::fromNSURL([m_Printer URL]);
  }

  //-----------------------------------------------------
  void PrinterManagerImpl::print(const QString& a_PathToImg) const
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

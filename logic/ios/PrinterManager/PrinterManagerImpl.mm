#import "PrinterManagerImpl.hpp"

#import "PrinterSetup/PrinterData.hpp"
#import <PrinterManager/PictureRenderer.hpp>

#import <QUrl>

#import <UIKit/UIPrintInteractionController.h>
#import <UIKit/UIPrintInfo.h>
#import <UIKit/UIPrinter.h>

#import <UIKit/UIImage.h>

namespace N_IosPrinterManager {

  //-----------------------------------------------------
  PrinterManagerImpl::PrinterManagerImpl()
    : N_PrinterManager::AbstractPrinterManagerImpl()
    , m_Printer(Q_NULLPTR)
    , m_PrintInfo(Q_NULLPTR)
    , m_Renderer([[PictureRenderer alloc] init])
  { }

  //-----------------------------------------------------
  PrinterManagerImpl::~PrinterManagerImpl()
  { }

  //-----------------------------------------------------
  void PrinterManagerImpl::setPrinterData(const N_IosPrinterSetup::PrinterData& a_Data)
  {
    m_Printer = a_Data.getPrinter();
  }

  //-----------------------------------------------------
  void PrinterManagerImpl::setPrintInfo()
  {
    m_PrintInfo = [UIPrintInfo printInfo]; // if you don't do that here, the app will crash!
    m_PrintInfo.jobName = @"Test";
    m_PrintInfo.outputType = UIPrintInfoOutputPhoto;
//    m_PrintInfo.orientation = UIPrintInfoOrientationPortrait;
//    m_PrintInfo.duplex = UIPrintInfoDuplexNone;
  }

  //-----------------------------------------------------
  void PrinterManagerImpl::print(const QString& a_PathToImg)
  {
    setPrintInfo();

    auto imgUrl([NSURL fileURLWithPath:a_PathToImg.toNSString()]);
    auto canPrint([UIPrintInteractionController canPrintURL: imgUrl]);

    auto controller = [UIPrintInteractionController sharedPrintController];
    if(controller && canPrint)
    {
      controller.printInfo = m_PrintInfo;
      [m_Renderer setImgPath: a_PathToImg.toNSString()];
      controller.printPageRenderer = m_Renderer;

//      controller.printingItem = imgUrl; // TODO: this must come in the renderer!

      qInfo() << "Printing image located at <" << QUrl::fromNSURL(imgUrl) << ">";
      [controller printToPrinter: m_Printer
                  completionHandler: ^(UIPrintInteractionController* /*printCtrl*/, BOOL completed, NSError* err)
      {
        if(completed && !err)
        {
          qInfo() << "Print successful"; // TODO: is that printed when the printer has printed?
        }
      }];
    }
  }

}

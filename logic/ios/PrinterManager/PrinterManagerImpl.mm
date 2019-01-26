#import "PrinterManagerImpl.hpp"

#import "Data/PrinterData.hpp"
#import <PrinterManager/PictureRenderer.hpp>

#import <QUrl>

#import <UIKit/UIPrintInteractionController.h>
#import <UIKit/UIPrintInfo.h>
#import <UIKit/UIPrinter.h>

#import <UIKit/UIImage.h>

namespace N_IosPrinterManager {

  //-----------------------------------------------------
  PrinterManagerImpl::PrinterManagerImpl(QObject* a_parent)
    : N_PrinterManager::AbstractPrinterManagerImpl(a_parent)
    , m_Printer(Q_NULLPTR)
    , m_PrintInfo(Q_NULLPTR)
    , m_Renderer([[PictureRenderer alloc] init])
  { }

  //-----------------------------------------------------
  PrinterManagerImpl::~PrinterManagerImpl()
  { }

  //-----------------------------------------------------
  void PrinterManagerImpl::setPrinterData(const N_IosCommonData::PrinterData& a_Data)
  {
    m_Printer = a_Data.getPrinter();
  }

  //-----------------------------------------------------
  void PrinterManagerImpl::setPrintInfo()
  {
    m_PrintInfo = [UIPrintInfo printInfo]; // if you don't do that here, the app will crash!
    m_PrintInfo.jobName = @"Test";
    m_PrintInfo.outputType = UIPrintInfoOutputPhoto;
    // The following two lines let the application crash for some unknown reason
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

      qInfo() << "Printing image located at <" << QUrl::fromNSURL(imgUrl) << ">";
      [controller printToPrinter: m_Printer
                                  completionHandler: ^(UIPrintInteractionController* /*printCtrl*/, BOOL completed, NSError* err)
      {
        if(!completed && err != nullptr)
        {
          // the print was cancelled:
          auto error([err localizedDescription]);
          std::string errorStr([error UTF8String]);
          qWarning() << "Print did not complete: " << QString::fromStdString(errorStr);
          emit cancelled();
        }
        else
        {
          qInfo() << "Print successful";
        }
      }];
    }
  }

}

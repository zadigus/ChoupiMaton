#import "IosPrinterManagerImpl.hpp"

#import "PrinterManager.hpp"

#import <QApplication>
#import <QWidget>
#import <QDialog>
#import <QWindow>
#import <QQmlApplicationEngine>
#import <QQmlContext>

#import <UIKit/UIPrinterPickerController.h>

namespace N_PrinterManager {

  //-----------------------------------------------------
  IosPrinterManagerImpl::IosPrinterManagerImpl()
    : PrinterManagerImpl()
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
    UIPrinterPickerController* picker = [UIPrinterPickerController printerPickerControllerWithInitiallySelectedPrinter:m_Printer];

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

}

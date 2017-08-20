#import "IosPrinterManagerImpl.hpp"

#import "PrinterManager.hpp"

#import <QApplication>
#include <QWidget>
#import <QDialog>
#include <QWindow>
#import <qpa/qplatformnativeinterface.h>
#import <QQmlApplicationEngine>
#import <QQmlContext>

#import <UIKit/UIPrinterPickerController.h>

namespace N_PrinterManager {

  //-----------------------------------------------------
  IosPrinterManagerImpl::IosPrinterManagerImpl()
    : PrinterManagerImpl()
  { }

  //-----------------------------------------------------
  IosPrinterManagerImpl::~IosPrinterManagerImpl()
  { }

  //-----------------------------------------------------
  void IosPrinterManagerImpl::setupPrinter()
  {
    UIPrinterPickerController* picker = [UIPrinterPickerController printerPickerControllerWithInitiallySelectedPrinter:m_Printer];

    QDialog dlg(QApplication::activeWindow());

    if(auto view = reinterpret_cast<UIView*>(dlg.window()->winId()))
    {
      [picker presentFromRect:view.bounds inView:view animated:YES
              completionHandler:^(UIPrinterPickerController* controller, BOOL userDidSelect, NSError* err)
              {
                if(userDidSelect)
                {
                  m_Printer = controller.selectedPrinter;
                }

              }

      ];
    }

    dlg.exec();
  }

}

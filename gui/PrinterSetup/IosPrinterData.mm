#import "IosPrinterData.hpp"

#import <UIKit/UIPrintInfo.h>
#import <UIKit/UIPrinter.h>

namespace N_IosPrinterSetup {

  //----------------------------------------------------------------------------------------------
  PrinterData::PrinterData()
    : m_Printer(Q_NULLPTR)
  { }

  //----------------------------------------------------------------------------------------------
  PrinterData::~PrinterData()
  { }

  //----------------------------------------------------------------------------------------------
  PrinterData::PrinterData(const PrinterData& a_Other)
    : m_Printer(a_Other.m_Printer) // shallow copy should be enough?
  {
//    m_Printer = [[UIPrinter alloc] init];
//    m_Printer.obj = [obj copyWithZone: nil];
  }

  //----------------------------------------------------------------------------------------------
  void PrinterData::setPrinter(UIPrinter* a_Printer)
  {
    m_Printer = a_Printer;
  }

}

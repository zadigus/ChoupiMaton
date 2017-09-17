#import "PrinterData.hpp"

#import <UIKit/UIPrintInfo.h>
#import <UIKit/UIPrinter.h>

namespace N_IosCommonData {

  //----------------------------------------------------------------------------------------------
  PrinterData::PrinterData()
    : m_Printer(Q_NULLPTR)
  { }

  //----------------------------------------------------------------------------------------------
  PrinterData::~PrinterData()
  { }

  //----------------------------------------------------------------------------------------------
  PrinterData::PrinterData(const PrinterData& a_Other)
    : m_Printer(a_Other.m_Printer) // shallow copy should be enough
  { }

  //----------------------------------------------------------------------------------------------
  void PrinterData::setPrinter(UIPrinter* a_Printer)
  {
    m_Printer = a_Printer;
  }

}

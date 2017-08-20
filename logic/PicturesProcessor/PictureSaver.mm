#import "PictureSaver.hpp"

#import <UIKit/UIKit.h>
#import <UIKit/UIPrintInteractionController.h>

namespace N_PicturesProcessor {

  //-----------------------------------------------------
  void PictureSaver::print(const QString& a_ImgPath) const
  {
    qDebug() << "MacOS";

    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];

    bool available = [UIPrintInteractionController isPrintingAvailable];
    qDebug() << "isPrintingAvailable = " << available;
  }

}

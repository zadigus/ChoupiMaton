#import "PrinterManager/PictureRenderer.hpp"

#import <UIKit/UIImage.h>
#import <AVFoundation/AVUtilities.h>

  @implementation PictureRenderer

  //-----------------------------------------------------  
  - (id)init
  {
      if (self = [super init])
      {
        self.headerHeight = 28.35; // --> 1 cm if 72 ppi (which is the case on ipads)
        self.footerHeight = 0.0;  // default
      }

      return self;
  }

  //-----------------------------------------------------
  - (void)setImgPath: (NSString*) a_ImgPath
  {
    self.m_ImgPath = a_ImgPath;
  }

  //-----------------------------------------------------
  - (void)drawContentForPageAtIndex:(NSInteger) a_PageIndex
                           inRect:(CGRect) a_ContentRect
  {
    if (a_PageIndex == 0)
    {
      UIImage* img = [UIImage imageWithContentsOfFile: self.m_ImgPath];
      auto rect(AVMakeRectWithAspectRatioInsideRect(img.size, a_ContentRect));
      [img drawInRect: rect];
    }
  }


  @end

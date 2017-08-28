#import "PrinterManager/PictureRenderer.hpp"

#import <UIKit/UIImage.h>

  @implementation PictureRenderer

  //-----------------------------------------------------  
  - (id)init
  {
      if (self = [super init])
      {
        self.headerHeight = 28.35; // --> 1 cm?
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
      // only use rightmost two inches of contentRect
//      CGFloat imagesRectWidth = POINTS_PER_INCH * 2;
//      CGFloat imagesRectHeight = CGRectGetHeight(self.paperRect) - POINTS_PER_INCH - (CGRectGetMaxY(self.paperRect) - CGRectGetMaxY(contentRect));
//      CGRect imagesRect = CGRectMake(CGRectGetMaxX(self.paperRect) - imagesRectWidth - POINTS_PER_INCH, CGRectGetMinY(self.paperRect) + POINTS_PER_INCH, imagesRectWidth, imagesRectHeight);


      // draw the image
      UIImage* img = [UIImage imageWithContentsOfFile: self.m_ImgPath];
      [img drawInRect: a_ContentRect];
    }
  }


  @end

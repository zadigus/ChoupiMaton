#ifndef IOS_PRINTERMANAGER_PICTURERENDERER_HPP
#define IOS_PRINTERMANAGER_PICTURERENDERER_HPP

#import <UIKit/UIPrintPageRenderer.h>

@interface PictureRenderer : UIPrintPageRenderer
@property (nonatomic, strong) NSString* m_ImgPath;
-(id)init;
-(void)setImgPath:(NSString*) a_ImgPath;
-(void)drawContentForPageAtIndex:(NSInteger) a_PageIndex
                         inRect:(CGRect) a_ContentRect;
@end

#endif

//
//  SJImgaeLabel.h
//  zhitu
//
//  Created by 陈少杰 on 14-1-17.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    SJImageLabelImagePositionLeft,
    SJImageLabelImagePositionRight,
    SJImageLabelImagePositionTop,
    SJImageLabelImagePositionBottom
}SJImageLabelImagePosition;

@interface SJImageLabel : UIControl
@property(nonatomic)UILabel *textLabel;
@property(nonatomic)UIImageView *imageView;
@property(nonatomic)CGFloat padding;
@property(nonatomic)BOOL verticalCenter;
@property(nonatomic)SJImageLabelImagePosition imagePostion;
@property(nonatomic)BOOL isAutoImageSize;
-(void)quicklySetFontPoint:(CGFloat)fontPoint textColorHex:(NSString*)textColorHex textAlignment:(NSTextAlignment)textAlignment imageName:(NSString *)imageName imagePosition:(SJImageLabelImagePosition)imagePosition padding:(NSInteger)padding;
-(void)quicklySetFontPoint:(CGFloat)fontPoint textColorHex:(NSString*)textColorHex textAlignment:(NSTextAlignment)textAlignment imageURL:(NSString *)imageURL imageSize:(CGSize)imageSize imagePosition:(SJImageLabelImagePosition)imagePosition padding:(NSInteger)padding;
@end

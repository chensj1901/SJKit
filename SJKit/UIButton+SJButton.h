//
//  UIButton+SJButton.h
//  zhitu
//
//  Created by 陈少杰 on 14-1-14.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  NS_ENUM(NSInteger, SJButtonImagePositionType){
    SJButtonImagePositionTypeTop=0,
};

@interface UIButton (SJButton)
-(void)quicklySetNormalImageNamed:(NSString*)imageNamed highlightImageNamed:(NSString*)highlightImageNamed selectedImageNamed:(NSString*)selectedImageName;

-(void)quicklySetNormalBackgroundImageNamed:(NSString*)imageNamed highlightBackgroundImageNamed:(NSString*)highlightBackgroundImageNamed  selectedBackgroundImageNamed:(NSString*)selectedImageName;


-(void)quicklySetNormalTextColorHex:(NSString *)colorHex highlightedTextColorHex:(NSString*)highlightTextColorHex selectedTextColorHex:(NSString*)selectedTextColorHex;


-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment title:(NSString*)title;

-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment;

-(void)quicklySetBoldFontPoint:(CGFloat)point textAlignment:(NSTextAlignment)textAlignment title:(NSString*)title;


-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment title:(NSString*)title;

-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment;

-(void)quicklySetFontPoint:(CGFloat)point textAlignment:(NSTextAlignment)textAlignment title:(NSString*)title;


-(void)quicklyTopImageBottomTitleType:(SJButtonImagePositionType)buttonType padding:(NSInteger)padding topY:(CGFloat)topY;
@end

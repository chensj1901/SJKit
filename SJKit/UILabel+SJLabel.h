//
//  UILabel+SJLabel.h
//  zhitu
//
//  Created by 陈少杰 on 14-5-7.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SJLabel)
-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignmen;
-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment text:(NSString*)text;
-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode;

-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignmen;
-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment text:(NSString*)text;
-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode;
-(void)quicklyHighlightedTextWithRange:(NSRange)range;
-(id)copy;
@end

//
//  RTLabel+SJLabel.h
//  Yunpan
//
//  Created by 陈少杰 on 15/8/5.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "RTLabel.h"

@interface RTLabel (SJLabel)
-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment text:(NSString*)text;

-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment text:(NSString*)text;


-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment;
-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment;
@end

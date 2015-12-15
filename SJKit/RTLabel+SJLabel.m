//
//  RTLabel+SJLabel.m
//  Yunpan
//
//  Created by 陈少杰 on 15/8/5.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "RTLabel+SJLabel.h"

@implementation RTLabel (SJLabel)

-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment text:(NSString*)text{
    RTTextAlignment rtTextAlignment;
    switch (textAlignment) {
        case NSTextAlignmentLeft:
            rtTextAlignment=RTTextAlignmentLeft;
            break;
        case NSTextAlignmentCenter:
            rtTextAlignment=RTTextAlignmentCenter;
            break;
        case NSTextAlignmentRight:
            rtTextAlignment=RTTextAlignmentRight;
            break;
        default:
            rtTextAlignment=RTTextAlignmentJustify;
            break;
    }
    self.backgroundColor = [UIColor clearColor];
    self.font=[UIFont boldSystemFontOfSize:point];
    self.textColor = [UIColor colorWithHex:colorHex];
    self.textAlignment = rtTextAlignment;
    self.text = text;
}

-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment text:(NSString*)text{
    [self quicklySetBoldFontPoint:point textColorHex:colorHex textAlignment:textAlignment text:text];
    self.font=[UIFont systemFontOfSize:point];
}

-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment{
    RTTextAlignment rtTextAlignment;
    switch (textAlignment) {
        case NSTextAlignmentLeft:
            rtTextAlignment=RTTextAlignmentLeft;
            break;
        case NSTextAlignmentCenter:
            rtTextAlignment=RTTextAlignmentCenter;
            break;
        case NSTextAlignmentRight:
            rtTextAlignment=RTTextAlignmentRight;
            break;
        default:
            rtTextAlignment=RTTextAlignmentJustify;
            break;
    }
    self.backgroundColor = [UIColor clearColor];
    self.font=[UIFont systemFontOfSize:point];
    self.textColor = [UIColor colorWithHex:colorHex];
    self.textAlignment = rtTextAlignment;
}


-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment{
    RTTextAlignment rtTextAlignment;
    switch (textAlignment) {
        case NSTextAlignmentLeft:
            rtTextAlignment=RTTextAlignmentLeft;
            break;
        case NSTextAlignmentCenter:
            rtTextAlignment=RTTextAlignmentCenter;
            break;
        case NSTextAlignmentRight:
            rtTextAlignment=RTTextAlignmentRight;
            break;
        default:
            rtTextAlignment=RTTextAlignmentJustify;
            break;
    }
    self.backgroundColor = [UIColor clearColor];
    self.font=[UIFont boldSystemFontOfSize:point];
    self.textColor = [UIColor colorWithHex:colorHex];
    self.textAlignment = rtTextAlignment;
}

@end

//
//  UIColor+SJColor.m
//  Gobang
//
//  Created by 陈少杰 on 14-6-29.
//  Copyright (c) 2014年 陈少杰. All rights reserved.
//

#import "UIColor+SJColor.h"
#import <UIKit/UIKit.h>

@implementation UIColor (SJColor)
+(UIColor*)colorWithHex:(NSString*)hexColor{
    if (hexColor.length!=6) {
        @throw [NSException exceptionWithName:@"Error Color" reason:nil userInfo:nil];
    }
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}

-(NSString *)colorHex{
    const CGFloat *components=CGColorGetComponents(self.CGColor);
    NSString *colorHex=[NSString stringWithFormat:@"%02x%02x%02x",(int)(components[0]*0xff),(int)(components[1]*0xff),(int)(components[2]*0xff)];
    return colorHex;
}
@end

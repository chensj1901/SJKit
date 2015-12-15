//
//  UIColor+SJColor.h
//  Gobang
//
//  Created by 陈少杰 on 14-6-29.
//  Copyright (c) 2014年 陈少杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SJColor)
+(UIColor*)colorWithHex:(NSString*)hexColor;
-(NSString *)colorHex;
@end

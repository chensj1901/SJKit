//
//  UITextField+SJTextField.h
//  zhitu
//
//  Created by 陈少杰 on 14-5-7.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (SJTextField)
@property(nonatomic)NSRange selectedRange;

-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment;

-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment;
@end

//
//  UITextView+SJTextView.h
//  zhitu
//
//  Created by 陈少杰 on 13-8-22.
//  Copyright (c) 2013年 聆创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (SJTextView)
@property (readwrite) UIImageView *backgroundImageView;
-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment;
-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment;
-(void)highlightedTextWithRange:(NSRange)range;
@end

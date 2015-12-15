//
//  SJTextField.h
//  zhitu
//
//  Created by 陈少杰 on 14-1-16.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SJTextField : UITextField

/**
 *	@brief	左右内容边距
 */
@property(nonatomic)int horizontalPadding;
/**
 *	@brief	上下内容边距
 */
@property(nonatomic)int verticalPadding;

@property(nonatomic)UIControlContentVerticalAlignment textVerticalAlignment;
@property(nonatomic)UIFont *placeholderFont;
@property(nonatomic)UIColor *placeholderColor;
@property(nonatomic)NSTextAlignment placeholderAlignment;
@property(nonatomic)UIControlContentVerticalAlignment placeholderVerticalAlignment;
@property(nonatomic)NSString *lastPlaceholder;

-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex placeHolderColorHex:(NSString*)placeHolderColorHex placeHolder:(NSString*)placeHolder textAlignment:(NSTextAlignment)textAlignment;

-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex placeHolderColorHex:(NSString*)placeHolderColorHex placeHolder:(NSString*)placeHolder textAlignment:(NSTextAlignment)textAlignment;
@end
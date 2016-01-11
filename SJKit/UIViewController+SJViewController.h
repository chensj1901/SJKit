//
//  UIViewController+SJViewController.h
//  zhitu
//
//  Created by 陈少杰 on 14-5-26.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SJViewController)
-(void)animationWithAnimationType:(NSString*)animationType subAnimationType:(NSString*)subAnimationType duration:(CGFloat)duration;


-(UIButton *)quicklyCreateRightItemWithTitle:(NSString*)title titleColorHex:(NSString*)titleColorHex titleHighlightedColorHex:(NSString*)titleHighlightedColorHex selector:(SEL)selector;

-(UIButton *)quicklyCreateRightItemWithTitle:(NSString*)title titleColorHex:(NSString*)titleColorHex titleHighlightedColorHex:(NSString*)titleHighlightedColorHex selector:(SEL)selector                                      target:(id)target;


-(UIButton*)quicklyCreateRightButtonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName selector:(SEL)selector;

-(UIButton *)quicklyCreateLeftItemWithTitle:(NSString*)title titleColorHex:(NSString*)titleColorHex titleHighlightedColorHex:(NSString*)titleHighlightedColorHex selector:(SEL)selector;
@end

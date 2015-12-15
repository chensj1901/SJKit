//
//  UIViewController+SJViewController.m
//  zhitu
//
//  Created by 陈少杰 on 14-5-26.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import "UIViewController+SJViewController.h"
#import "UIColor+SJColor.h"
#import "config.h"

@implementation UIViewController (SJViewController)
-(void)animationWithAnimationType:(NSString*)animationType subAnimationType:(NSString*)subAnimationType duration:(CGFloat)duration{
        UIWindow *thisWindow=[[[UIApplication sharedApplication]windows]objectAtIndex:0];
        
        __block CALayer *layer = [CALayer layer];
        CGRect layerFrame = thisWindow.bounds;
        layer.frame = layerFrame;
        
//        UIGraphicsBeginImageContextWithOptions(layerFrame.size, YES, 0);
//        CGContextRef ctx = UIGraphicsGetCurrentContext();
//        [thisWindow.layer renderInContext:ctx];
//        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        layer.contents = (id)image.CGImage;
//        NSArray *widows=[[UIApplication sharedApplication]windows];
//        [thisWindow.layer addSublayer:layer];
    
        CGAffineTransform currentTransform = thisWindow.transform;
        
        [UIView animateWithDuration:duration animations:^{
            
            CATransition* animation = [[CATransition alloc]init];
            animation.duration =duration;
            animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
            animation.type = animationType;
            animation.subtype = subAnimationType;
            [thisWindow.layer addAnimation:animation forKey:@"animation"];
            
        } completion:^(BOOL finished) {
            thisWindow.transform = CGAffineTransformConcat(currentTransform, CGAffineTransformMakeTranslation(0.0f, 0.0f));
            [layer removeFromSuperlayer];
            
        }];
}

-(UIButton *)quicklyCreateRightItemWithTitle:(NSString *)title titleColorHex:(NSString *)titleColorHex titleHighlightedColorHex:(NSString *)titleHighlightedColorHex selector:(SEL)selector{
    return [self quicklyCreateRightItemWithTitle:title titleColorHex:titleColorHex titleHighlightedColorHex:titleHighlightedColorHex selector:selector target:self];
}

-(UIButton *)quicklyCreateRightItemWithTitle:(NSString*)title titleColorHex:(NSString*)titleColorHex titleHighlightedColorHex:(NSString*)titleHighlightedColorHex selector:(SEL)selector target:(id)target
{
    if ([self isKindOfClass:[UIViewController class]]) {
        UIButton *rightBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-64, 7, 48, 28);
        
        [rightBtn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
        [rightBtn setTitle:title forState:UIControlStateNormal];
        
        if (titleColorHex&&titleColorHex.length==6) {
            [rightBtn setTitleColor:[UIColor colorWithHex:titleColorHex] forState:UIControlStateNormal];
        }
        if (titleHighlightedColorHex&&titleHighlightedColorHex.length==6) {
            [rightBtn setTitleColor:[UIColor colorWithHex:titleHighlightedColorHex] forState:UIControlStateHighlighted];
            
        }
        [rightBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
        if (title) {
            CGRect frame = rightBtn.frame;
            frame.size.width = [title sizeWithFont:rightBtn.titleLabel.font].width;
            rightBtn.frame = frame;
            [rightBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, IS_IOS7()?-12:0)];
        }
        UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
        self.navigationItem.rightBarButtonItem = rightItem;
        return rightBtn;
    }
    return nil;
}


-(UIButton*)quicklyCreateRightButtonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName selector:(SEL)selector
{
    if ([self isKindOfClass:[UIViewController class]]) {
        
        UIImage *image=[UIImage imageNamed:imageName];
        UIButton *rightBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame=CGRectMake([UIScreen mainScreen].bounds.size.width-64, 7, 48, 28);
        
        [rightBtn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
        
        [rightBtn setImage:image forState:UIControlStateNormal];

        if (highlightedImageName&&highlightedImageName.length>0) {
            [rightBtn setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
        }
        
        [rightBtn setBackgroundImage:nil forState:UIControlStateNormal];
        [rightBtn setBackgroundImage:nil forState:UIControlStateHighlighted];
        
               [rightBtn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    
        CGRect frame = rightBtn.frame;
        frame.size.width = image.size.width;
        rightBtn.frame = frame;
        [rightBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, IS_IOS7()?-12:0)];
        
        UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:rightBtn];
        self.navigationItem.rightBarButtonItem = rightItem;
        return rightBtn;
    }
    return nil;
}
@end

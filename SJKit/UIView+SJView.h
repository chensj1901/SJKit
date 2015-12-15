//
//  UIView+SJView.h
//  zhitu
//
//  Created by 陈少杰 on 14-5-7.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SJView)
@property(nonatomic)NSString *backgroundColorHex;
-(void)addTapEventWithBlock:(void(^)(UIView*tapView))block;
-(void)quicklySetOriginX:(CGFloat)x sizeWidth:(CGFloat)width;
-(void)quicklySetOriginY:(CGFloat)y sizeHeight:(CGFloat)height;
-(void)quicklySetOriginY:(CGFloat)y;
-(void)quicklySetOriginX:(CGFloat)x;
-(void)quicklySetWidth:(CGFloat)width;
-(void)quicklySetHeight:(CGFloat)height;
-(UIImage*)screenShot;
- (void)playAnimatedWithTransition:(UIViewAnimationTransition)transition;
-(void)playAnimationWithAnimationType:(NSString*)animationType subAnimationType:(NSString*)subAnimationType duration:(CGFloat)duration;
@end

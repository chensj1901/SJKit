//
//  UIView+SJView.m
//  zhitu
//
//  Created by 陈少杰 on 14-5-7.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import "UIView+SJView.h"
#import "objc/runtime.h"
#import "UIColor+SJColor.h"

typedef void(^GESTURE_Tapped)(UIView *tapView);
static NSString *GESTURE_BLOCK = @"GESTURE_BLOCK";

@implementation UIView (SJView)
@dynamic backgroundColorHex;

-(void)setBackgroundColorHex:(NSString *)backgroundColorHex{
    self.backgroundColor=[UIColor colorWithHex:backgroundColorHex];
}

-(NSString *)backgroundColorHex{
    return @"";
}


-(void)addTapEventWithBlock:(void(^)(UIView*tapView))block
{
//    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    tap.numberOfTapsRequired=1;
    [self addGestureRecognizer:tap];
    
    objc_setAssociatedObject(self,&GESTURE_BLOCK,block, OBJC_ASSOCIATION_COPY);
}

-(void)tapped:(UIGestureRecognizer *)gesture
{
    if (gesture.state==UIGestureRecognizerStateEnded)
    {
        GESTURE_Tapped block = (GESTURE_Tapped)objc_getAssociatedObject(self, &GESTURE_BLOCK);
        
        if (block)
        {
            __weak UIView *__self=self;
            block(__self);
            block = nil;
        }
    }
}

-(id)copy{
    UIView *newView=[[[self class]alloc]init];
    newView.backgroundColor=self.backgroundColor;
    newView.frame=self.frame;
    newView.userInteractionEnabled=self.userInteractionEnabled;
    newView.contentMode=self.contentMode;
    newView.alpha=self.alpha;
    return newView;
}

-(void)quicklySetOriginX:(CGFloat)x sizeWidth:(CGFloat)width{
    CGRect selfRect=self.frame;
    selfRect.size.width=width;
    selfRect.origin.x=x;
    self.frame=selfRect;
}

-(void)quicklySetOriginY:(CGFloat)y sizeHeight:(CGFloat)height{
    CGRect selfRect=self.frame;
    selfRect.size.height=height;
    selfRect.origin.y=y;
    self.frame=selfRect;
}

-(void)quicklySetOriginX:(CGFloat)x{
    CGRect selfRect=self.frame;
    selfRect.origin.x=x;
    self.frame=selfRect;
}

-(void)quicklySetOriginY:(CGFloat)y{
    CGRect selfRect=self.frame;
    selfRect.origin.y=y;
    self.frame=selfRect;

}

-(void)quicklySetWidth:(CGFloat)width{
    CGRect selfRect=self.frame;
    selfRect.size.width=width;
    self.frame=selfRect;
}

-(void)quicklySetHeight:(CGFloat)height{
    CGRect selfRect=self.frame;
    selfRect.size.height=height;
    self.frame=selfRect;

}

-(UIImage *)screenShot{
    UIGraphicsBeginImageContext(self.bounds.size);     //currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];//renderInContext呈现接受者及其子范围到指定的上下文
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();//返回一个基于当前图形上下文的图片
    UIGraphicsEndImageContext();//移除栈顶的基于当前位图的图形上下文
    return viewImage;
}

- (void)playAnimatedWithTransition:(UIViewAnimationTransition)transition {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationTransition:transition forView:self cache:NO];
    [UIView commitAnimations];
}

-(void)playAnimationWithAnimationType:(NSString*)animationType subAnimationType:(NSString*)subAnimationType duration:(CGFloat)duration{
    UIView *thisWindow=self;
    
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

@end

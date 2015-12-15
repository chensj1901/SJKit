//
//  UIButton+SJButton.m
//  zhitu
//
//  Created by 陈少杰 on 14-1-14.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import "UIButton+SJButton.h"
#import "UIColor+SJColor.h"

@implementation UIButton (SJButton)
-(id)copy{
    UIButton *newButton=[[self class] buttonWithType:self.buttonType];
    UIControlState states[6]={UIControlStateNormal,UIControlStateHighlighted,UIControlStateApplication,UIControlStateDisabled,UIControlStateReserved,UIControlStateSelected};
    for (int i=0; i<6; i++) {
        NSString *normalTitle=[self titleForState:UIControlStateNormal];
        UIImage *normalImage=[self imageForState:UIControlStateNormal];
        UIImage *normalBackgroundImage=[self backgroundImageForState:UIControlStateNormal];
        UIColor *normalTitleColor=[self titleColorForState:UIControlStateNormal];
        UIColor *normalTitleShadowColor=[self titleShadowColorForState:UIControlStateNormal];
        
        [newButton setTitle:states[i]!=UIControlStateNormal&&normalTitle==[self titleForState:states[i]]?nil:[self titleForState:states[i]] forState:states[i]];
        [newButton setBackgroundImage:states[i]!=UIControlStateNormal&&normalBackgroundImage==[self backgroundImageForState:states[i]]?nil:[self backgroundImageForState:states[i]] forState:states[i]];
        [newButton setImage:states[i]!=UIControlStateNormal&&normalImage==[self imageForState:states[i]]?nil:[self imageForState:states[i]] forState:states[i]];
        [newButton setTitleColor:states[i]!=UIControlStateNormal&&normalTitleColor==[self titleColorForState:states[i]]?nil:[self titleColorForState:states[i]] forState:states[i]];
        [newButton setTitleShadowColor:states[i]!=UIControlStateNormal&&normalTitleShadowColor==[self titleShadowColorForState:states[i]]?nil:[self titleShadowColorForState:states[i]] forState:states[i]];
        [newButton setTitleEdgeInsets:[self titleEdgeInsets]];
        [newButton setImageEdgeInsets:[self imageEdgeInsets]];
    }
    newButton.enabled=self.enabled;
    newButton.titleLabel.font=self.titleLabel.font;
    [newButton setContentVerticalAlignment:self.contentVerticalAlignment];
    [newButton setContentHorizontalAlignment:self.contentHorizontalAlignment];
    newButton.frame=self.frame;
    newButton.hidden=self.hidden;
    return newButton;
}

-(void)quicklySetNormalBackgroundImageNamed:(NSString *)imageNamed highlightBackgroundImageNamed:(NSString *)highlightBackgroundImageNamed selectedBackgroundImageNamed:(NSString *)selectedImageName{
    @autoreleasepool {
        UIImage *normalImage=[UIImage imageNamed:imageNamed];
        UIImage *highlightImage=[UIImage imageNamed:highlightBackgroundImageNamed];
        UIImage *selectedImage=[UIImage imageNamed:selectedImageName];
        
        UIEdgeInsets normalEdgeInsets=UIEdgeInsetsMake(normalImage.size.height/2, normalImage.size.width/2, normalImage.size.height/2, normalImage.size.width/2);
        UIEdgeInsets highlightInsets=UIEdgeInsetsMake(highlightImage.size.height/2, highlightImage.size.width/2, highlightImage.size.height/2, highlightImage.size.width/2);
        UIEdgeInsets selectedEdgeInsets=UIEdgeInsetsMake(selectedImage.size.height/2, selectedImage.size.width/2, selectedImage.size.height/2, selectedImage.size.width/2);
        
        [self setBackgroundImage:[normalImage resizableImageWithCapInsets:normalEdgeInsets] forState:UIControlStateNormal];
        [self setBackgroundImage:[highlightImage resizableImageWithCapInsets:highlightInsets] forState:UIControlStateHighlighted];
        [self setBackgroundImage:[selectedImage resizableImageWithCapInsets:selectedEdgeInsets] forState:UIControlStateSelected];
    }
}

-(void)quicklySetNormalImageNamed:(NSString *)imageNamed highlightImageNamed:(NSString *)highlightImageNamed selectedImageNamed:(NSString *)selectedImageName{
    @autoreleasepool {
    [self setImage:[UIImage imageNamed:imageNamed] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:highlightImageNamed] forState:UIControlStateHighlighted];
    [self setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    }
}

-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment{
    @autoreleasepool {
        self.titleLabel.font=[UIFont boldSystemFontOfSize:point];
        
        if (colorHex&&colorHex.length==6) {
            [self setTitleColor:[UIColor colorWithHex:colorHex] forState:UIControlStateNormal];
        }
        
        switch (textAlignment) {
            case NSTextAlignmentCenter:
                self.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
                break;
            case NSTextAlignmentLeft:
                self.contentHorizontalAlignment=UIControlContentHorizontalAlignmentLeft;
                break;
            case NSTextAlignmentRight:
                self.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight;
                break;
            default:
                self.contentHorizontalAlignment=UIControlContentHorizontalAlignmentFill;
                break;
        }
        
    }
}

-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment title:(NSString *)title{
    [self quicklySetBoldFontPoint:point textColorHex:colorHex textAlignment:textAlignment];
    [self setTitle:title forState:UIControlStateNormal];
}

-(void)quicklySetBoldFontPoint:(CGFloat)point textAlignment:(NSTextAlignment)textAlignment title:(NSString *)title{
    [self quicklySetBoldFontPoint:point textColorHex:nil textAlignment:textAlignment title:title];
}


-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment{
    @autoreleasepool {
        [self quicklySetBoldFontPoint:point textColorHex:colorHex textAlignment:textAlignment];
        self.titleLabel.font=[UIFont systemFontOfSize:point];
    }
}

-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment title:(NSString *)title{
    [self quicklySetFontPoint:point textColorHex:colorHex textAlignment:textAlignment];
    [self setTitle:title forState:UIControlStateNormal];
}

-(void)quicklySetFontPoint:(CGFloat)point textAlignment:(NSTextAlignment)textAlignment title:(NSString *)title{
    [self quicklySetFontPoint:point textColorHex:nil textAlignment:textAlignment title:title];
}

-(void)quicklySetNormalTextColorHex:(NSString *)colorHex highlightedTextColorHex:(NSString *)highlightTextColorHex selectedTextColorHex:(NSString *)selectedTextColorHex{
    @autoreleasepool {
        if (colorHex&&colorHex.length==6) {
            [self setTitleColor:[UIColor colorWithHex:colorHex] forState:UIControlStateNormal];
        }
        
        if (highlightTextColorHex&&highlightTextColorHex.length==6) {
            [self setTitleColor:[UIColor colorWithHex:highlightTextColorHex] forState:UIControlStateHighlighted];
        }
        
        if (selectedTextColorHex&&selectedTextColorHex.length==6) {
            [self setTitleColor:[UIColor colorWithHex:selectedTextColorHex] forState:UIControlStateSelected];
        }
    }

}


-(void)quicklyTopImageBottomTitleType:(SJButtonImagePositionType)buttonType padding:(NSInteger)padding topY:(CGFloat)topY{
    //UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    CGFloat buttonHeight=self.bounds.size.height;
    
    NSString *title=[self titleForState:UIControlStateNormal];
    UIImage *image=[self imageForState:UIControlStateNormal];
    
    CGSize titleSize=[title sizeWithFont:self.titleLabel.font];
    
    CGFloat titleHeight=titleSize.height;
    CGFloat imageHeight=image.size.height;
    
    
    CGFloat imageEdgeY=(topY-(buttonHeight-imageHeight)/2)*2;
    CGFloat titleEdgeY=(topY+imageHeight+padding-(buttonHeight-titleHeight)/2)*2;
    
    
    [self setImageEdgeInsets:UIEdgeInsetsMake(imageEdgeY,
                                              0.0,
                                              0.0,
                                              -titleSize.width)];
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake(titleEdgeY,
                                              -image.size.width,
                                              0.0,
                                              0.0)];
}
@end

//
//  UITextView+SJTextView.m
//  zhitu
//
//  Created by 陈少杰 on 13-8-22.
//  Copyright (c) 2013年 聆创科技有限公司. All rights reserved.
//

#import "UITextView+SJTextView.h"
#import "UIColor+SJColor.h"

@implementation UITextView (SJTextView)
-(void)setBackgroundImageView:(UIImageView *)backgroundImageView{
    self.backgroundColor=[UIColor clearColor];
    UIEdgeInsets insets=UIEdgeInsetsMake(2, 0, 0, 0)
    ;
    backgroundImageView.frame=CGRectMake(0,-insets.top, self.bounds.size.width, self.bounds.size.height);
    backgroundImageView.tag=1888;
    [self addSubview:backgroundImageView];
    [self sendSubviewToBack:backgroundImageView];
    [self setContentInset:insets];
}

-(UIImageView *)backgroundImageView{
    return (UIImageView *)[self viewWithTag:1888];
}

-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment{
    @autoreleasepool {
        self.backgroundColor=[UIColor clearColor];
        self.font=[UIFont fontWithName:@"TimesNewRomanPSMT" size:point];
        self.textColor=[UIColor colorWithHex:colorHex];
        self.textAlignment=textAlignment;
    }
}

-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment{
    @autoreleasepool {
        self.backgroundColor=[UIColor clearColor];
        self.font=[UIFont fontWithName:@"TimesNewRomanPSMT" size:point];
        self.textColor=[UIColor colorWithHex:colorHex];
        self.textAlignment=textAlignment;
    }
}

-(void)highlightedTextWithRange:(NSRange)range{
    NSMutableAttributedString *t=[[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    
    if (NSEqualRanges(range, NSMakeRange(0, 0))) {
        [t removeAttribute:NSBackgroundColorAttributeName range:NSMakeRange(0, self.text.length)];
        [t removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, self.text.length)];
    }else{
        [t removeAttribute:NSBackgroundColorAttributeName range:NSMakeRange(0, self.text.length)];
        [t removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, self.text.length)];
        [t addAttribute:NSBackgroundColorAttributeName value:[UIColor blueColor] range:range];
        [t addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:range];
    }
    
//    [t addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, self.text.length)];
    
    self.attributedText=t;
}

-(id)copy{
    UITextView *newTextView=[[UITextView alloc]initWithFrame:self.bounds];
    newTextView.text=self.text;
    newTextView.attributedText=self.attributedText;
    newTextView.font=self.font;
    newTextView.textAlignment=self.textAlignment;
    newTextView.contentSize=self.contentSize;
    newTextView.editable=self.editable;
    return newTextView;
}
@end

//
//  UILabel+SJLabel.m
//  zhitu
//
//  Created by 陈少杰 on 14-5-7.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import "UILabel+SJLabel.h"
#import "UIColor+SJColor.h"

@implementation UILabel (SJLabel)
-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment{
    [self quicklySetBoldFontPoint:point textColorHex:colorHex textAlignment:textAlignment lineBreakMode:NSLineBreakByTruncatingTail];
}

-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment text:(NSString*)text{
    [self quicklySetBoldFontPoint:point textColorHex:colorHex textAlignment:textAlignment];
    self.text=text;
}

-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode{
    @autoreleasepool {
        self.backgroundColor=[UIColor clearColor];
        self.font=[UIFont boldSystemFontOfSize:point];
        self.textColor=[UIColor colorWithHex:colorHex];
        self.textAlignment=textAlignment;
        self.lineBreakMode=lineBreakMode;
    }
}

-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment{
    [self quicklySetFontPoint:point textColorHex:colorHex textAlignment:textAlignment lineBreakMode:NSLineBreakByTruncatingTail];
}

-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment text:(NSString*)text{
    [self quicklySetFontPoint:point textColorHex:colorHex textAlignment:textAlignment];
    self.text=text;
}

-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex textAlignment:(NSTextAlignment)textAlignment lineBreakMode:(NSLineBreakMode)lineBreakMode{
    @autoreleasepool {
        self.backgroundColor=[UIColor clearColor];
        self.font=[UIFont systemFontOfSize:point];
        self.textColor=[UIColor colorWithHex:colorHex];
        self.textAlignment=textAlignment;
        self.lineBreakMode=lineBreakMode;
        if (lineBreakMode==NSLineBreakByWordWrapping) {
            self.numberOfLines=0;
        }
    }
}


-(void)quicklyHighlightedTextWithRange:(NSRange)range{
    NSMutableAttributedString *t=[[NSMutableAttributedString alloc]initWithAttributedString:self.attributedText];
    
    if (range.length==0) {
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
    UILabel *newLabel=[[UILabel alloc]initWithFrame:self.frame];
    newLabel.text=self.text;
    newLabel.textColor=self.textColor;
    newLabel.backgroundColor=self.backgroundColor;
    newLabel.textAlignment=self.textAlignment;
    newLabel.font=self.font;
    return newLabel;
}

@end

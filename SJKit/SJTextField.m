//
//  SJTextField.m
//  zhitu
//
//  Created by 陈少杰 on 14-1-16.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import "SJTextField.h"

@implementation SJTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.placeholderColor=[UIColor colorWithHex:@"abc0c6"];
        self.placeholderFont=[UIFont boldSystemFontOfSize:12];
        self.placeholderVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        self.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


-(void)drawPlaceholderInRect:(CGRect)rect{
    [[self placeholderColor]setFill];
    CGSize size=[[self placeholder]sizeWithFont:self.placeholderFont];
    
    CGFloat x;
    CGFloat y;
    
    switch (self.placeholderAlignment) {
        case NSTextAlignmentLeft:
            x=0;
            break;
        case NSTextAlignmentCenter:
            x=(rect.size.width-size.width)/2;
            break;
        case NSTextAlignmentRight:
            x=rect.size.width-size.width;
            break;
        default:
            x=0;
            break;
    }
    
    switch (self.placeholderVerticalAlignment) {
        case UIControlContentVerticalAlignmentBottom:
            y=rect.size.height-size.height;
            break;
        case UIControlContentVerticalAlignmentTop:
            y=0;
            break;
        case UIControlContentVerticalAlignmentCenter:
            y=(rect.size.height-size.height)/2;
            break;
        default:
            y=rect.size.height-size.height;
            break;
    }
    
    [[self placeholder]drawInRect:CGRectMake(x,y , size.width, size.height) withFont:self.placeholderFont];
    
    CGSize lastSize;
    CGFloat lastX;
    if (_lastPlaceholder) {
        lastSize = [_lastPlaceholder sizeWithFont:self.placeholderFont];
        lastX = rect.size.width-lastSize.width;
        
        [_lastPlaceholder drawInRect:CGRectMake(lastX, y , lastSize.width, lastSize.height) withFont:self.placeholderFont];
    }
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + _horizontalPadding+self.leftView.bounds.size.width, bounds.origin.y + _verticalPadding, bounds.size.width - _horizontalPadding*2-self.leftView.bounds.size.width-self.rightView.bounds.size.width, bounds.size.height - _verticalPadding*2);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

-(void)quicklySetBoldFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex placeHolderColorHex:(NSString*)placeHolderColorHex placeHolder:(NSString*)placeHolder textAlignment:(NSTextAlignment)textAlignment{
    [self quicklySetBoldFontPoint:point textColorHex:colorHex textAlignment:textAlignment];
    self.placeholderAlignment=textAlignment;
    self.placeholderColor=[UIColor colorWithHex:placeHolderColorHex];
    self.placeholderFont=[UIFont boldSystemFontOfSize:point];
    self.placeholder=placeHolder;
}


-(void)quicklySetFontPoint:(CGFloat)point textColorHex:(NSString *)colorHex placeHolderColorHex:(NSString*)placeHolderColorHex placeHolder:(NSString*)placeHolder textAlignment:(NSTextAlignment)textAlignment{
    [self quicklySetFontPoint:point textColorHex:colorHex textAlignment:textAlignment];
    self.placeholderAlignment=textAlignment;
    self.placeholderColor=[UIColor colorWithHex:placeHolderColorHex];
    self.placeholderFont=[UIFont boldSystemFontOfSize:point];
    self.placeholder=placeHolder;
}


@end

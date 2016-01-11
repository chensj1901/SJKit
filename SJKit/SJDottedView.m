//
//  SJDottedView.m
//  zhitu
//
//  Created by 陈少杰 on 15/3/17.
//  Copyright (c) 2015年 聆创科技有限公司. All rights reserved.
//

#import "SJDottedView.h"

@implementation SJDottedView
//@synthesize dottedColor=_dottedColor;

-(id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}

-(void)awakeFromNib{
    self.backgroundColor=[UIColor clearColor];
}


-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
//    UIGraphicsBeginImageContext(rect.size);   //开始画线
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapButt);  //设置线条终点形状
    CGFloat lengths[] = {3,3};
    CGContextRef line = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(line, self.dottedColor?self.dottedColor.CGColor:[UIColor redColor].CGColor);
    
    
    
    if (CGRectGetHeight(self.bounds)&&CGRectGetWidth(self.bounds)>=2) {
        CGContextSetLineDash(line, 0, lengths, 2);  //画虚线
        CGContextMoveToPoint(line, 1, 1);    //开始画线
        CGContextAddLineToPoint(line, 1, rect.size.height);
        CGContextAddLineToPoint(line, rect.size.width-1, rect.size.height-1);
        CGContextAddLineToPoint(line, rect.size.width-1, 1);
        CGContextAddLineToPoint(line, 1, 1);
    }else{
        if (self.bounds.size.height>=2) {
            CGContextSetLineDash(line, 0, lengths, 2);  //画虚线
            CGContextMoveToPoint(line, 0, 0);
            CGContextAddLineToPoint(line, 0, rect.size.height);
        }else{
            CGContextSetLineDash(line, 0, lengths, 2);  //画虚线
            CGContextMoveToPoint(line, 0, 0);
            CGContextAddLineToPoint(line, rect.size.width, 0);
        }
    }
    CGContextStrokePath(line);
    
//    CGContextSetFillColor(UIGraphicsGetCurrentContext(),CGColorGetComponents( [UIColor clearColor].CGColor));
//    CGContextFillPath(line);
}


@end

//
//  UITableView+SJTableView.m
//  PokerScoring
//
//  Created by 陈少杰 on 15/4/8.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "UITableView+SJTableView.h"

@implementation UITableView (SJTableView)

-(NSIndexPath*)indexPathForCellElement:(UIView*)element{
    CGPoint point=[element convertRect:CGRectZero toView:self].origin;
    CGAffineTransform transform=CGAffineTransformIdentity;
    NSIndexPath *indexPath;
    
    if (CGAffineTransformEqualToTransform(transform, self.transform)) {
        indexPath=[self indexPathForRowAtPoint:CGPointMake(element.bounds.size.width/2+point.x, element.bounds.size.height/2+point.y)];
    }else{
        indexPath=[self indexPathForRowAtPoint:CGPointMake(point.x, point.y)];
    }
    return indexPath;
}
@end

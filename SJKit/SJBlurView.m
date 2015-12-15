//
//  SJBlurView.m
//  zhitu
//
//  Created by 陈少杰 on 15/10/28.
//  Copyright © 2015年 聆创科技有限公司. All rights reserved.
//

#import "SJBlurView.h"

@implementation SJBlurView
+(UIView*)createBlurView{
    UIView *resultView;
    if (IS_IOS8()) {
        UIVisualEffectView *backgroundView=[[UIVisualEffectView alloc]init];
        backgroundView.effect=[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        resultView=backgroundView;
    }else{
        resultView=[[UIView alloc]init];
        resultView.backgroundColor=[[UIColor whiteColor]colorWithAlphaComponent:0.8];
    }
    return resultView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

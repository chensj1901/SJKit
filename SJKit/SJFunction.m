//
//  SJFunction.m
//  tBook
//
//  Created by 陈少杰 on 14/11/24.
//  Copyright (c) 2014年 陈少杰. All rights reserved.
//

#import "SJFunction.h"
#import "SJKit.h"

@implementation SJFunction

+(NSString *)dateFormat:(NSTimeInterval)date{
    NSString *dateFormat;
    
    int secondPassed=[[NSDate date]timeIntervalSince1970]-date;
    if (secondPassed<0) {
        dateFormat=[NSString stringWithFormat:@"刚刚"];
    }
    else if (secondPassed<60) {
        dateFormat=[NSString stringWithFormat:@"刚刚"];
    }
    else if (secondPassed<3600) {
        dateFormat=[NSString stringWithFormat:@"%d分钟前",secondPassed/60];
    }
    else if(secondPassed<60*60*24){
        dateFormat=[NSString stringWithFormat:@"%d小时前",secondPassed/(60*60)];
    }
    else if(secondPassed<60*60*24*30){
        dateFormat=[NSString stringWithFormat:@"%d天前",secondPassed/(60*60*24)];
    }
    else{
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        
        NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:date]];
        dateFormat=currentDateStr;
    }
    
    return dateFormat;
}

void alertAtPoint(NSString *string,CGPoint point,UIImage *image){
    @autoreleasepool {
        CGFloat rightPading=image?image.size.width+6:16;
        UIView *view=((UIWindow*)[[[UIApplication sharedApplication]windows]objectAtIndex:0]);
        UIFont *font=[UIFont fontWithName:@"Helvetica" size:13];
        CGSize labelsize = [string sizeWithFont:font constrainedToSize:view.frame.size lineBreakMode:NSLineBreakByWordWrapping];
        CGRect frame;
        frame.size=CGSizeMake(MAX(labelsize.width+16+rightPading+image.size.width, 160), MAX(labelsize.height+15, 30));
        frame.origin=CGPointZero;
        
        UIView *bg = [[UIView alloc]initWithFrame:frame];
        bg.backgroundColor=[[UIColor colorWithHex:@"3a98d0"]colorWithAlphaComponent:0.9];
        bg.layer.borderColor=[[UIColor colorWithHex:@"2277a9"]CGColor];
        bg.layer.borderWidth=2;
        bg.layer.cornerRadius=CGRectGetHeight(frame)/2;
        bg.center=point;
        
        UILabel *alertLabel=[[UILabel alloc]initWithFrame:CGRectMake(16, 0, CGRectGetWidth(frame)-16-rightPading, CGRectGetHeight(frame))];
        alertLabel.text=string;
        alertLabel.font=font;
        alertLabel.numberOfLines=0;
        alertLabel.lineBreakMode=NSLineBreakByWordWrapping;
        alertLabel.textAlignment=image?NSTextAlignmentLeft:NSTextAlignmentCenter;
        alertLabel.backgroundColor = [UIColor clearColor];
        alertLabel.textColor=[UIColor whiteColor];
        [bg addSubview:alertLabel];
        
        if (image) {
            UIImageView *v=[[UIImageView alloc]initWithImage:image];
            v.frame=CGRectMake(CGRectGetWidth(frame)-27, (CGRectGetHeight(frame)-24)/2, 24, 24);
            [bg addSubview:v];
        }
        
        [view addSubview:bg];
        
        [UIView animateWithDuration:0.6 delay:1.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
            bg.alpha=0;
        } completion:^(BOOL finished) {
            [bg removeFromSuperview];
        }];
    }
}

void alert(NSString* string){
    alertAtPoint(string,CGPointMake(WIDTH/2, HEIGHT-120),nil);
}

void alerttop(NSString* string)
{
    alertAtPoint(string, CGPointMake(WIDTH/2, HEIGHT/2-40),nil);
}

@end

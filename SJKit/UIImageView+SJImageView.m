//
//  UIImageView+SJImageView.m
//  zhitu
//
//  Created by 陈少杰 on 14/7/16.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import "UIImageView+SJImageView.h"

@implementation UIImageView (SJImageView)
-(void)quicklySetBackgroundImageName:(NSString *)imageName{
    @autoreleasepool {
        UIImage *image=[UIImage imageNamed:imageName];
        self.image=[image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height/2, image.size.width/2, image.size.height/2, image.size.width/2)];
    }
}
-(UIImageView *)copy{
    UIImageView*newImageView=[[UIImageView alloc]initWithFrame:self.frame];
    newImageView.image=self.image;
    newImageView.contentMode=self.contentMode;
    newImageView.alpha=self.alpha;
    newImageView.backgroundColor=self.backgroundColor;
    newImageView.hidden=self.hidden;
    return newImageView;
}
@end

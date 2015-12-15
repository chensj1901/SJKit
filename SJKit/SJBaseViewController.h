//
//  SJBaseViewController.h
//  ClearIce
//
//  Created by 陈少杰 on 14/8/28.
//  Copyright (c) 2014年 陈少杰. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface SJBaseViewController : UIViewController
@property(nonatomic)UIView *mainView;
-(void)loadSetting;
-(void)loadTarget;
-(void)loadUI;
@end

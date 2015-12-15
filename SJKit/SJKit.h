//
//  SJFrame.h
//  Gobang
//
//  Created by 陈少杰 on 14-6-29.
//  Copyright (c) 2014年 陈少杰. All rights reserved.
//

#ifndef Gobang_SJFrame_h
#define Gobang_SJFrame_h

#import "UIColor+SJColor.h"
#import "UILabel+SJLabel.h"
#import "UIButton+SJButton.h"
#import "NSString+SJString.h"
#import "NSDictionary+SJDictionary.h"
#import "SJFunction.h"
#import "UITextView+SJTextView.h"
#import "NSFileManager+SJFileManager.h"
#import "NSDictionary+SJDictionary.h"
#import "NSArray+SJArray.h"
#import "UIView+SJView.h"
#import "UIViewController+SJViewController.h"
#import "UITextField+SJTextField.h"
#import "UITableView+SJTableView.h"
#import "UIImageView+SJImageView.h"
#import "UIImage+SJImage.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width

#define HEIGHT [UIScreen mainScreen].bounds.size.height

#define SELF_WIDTH self.bounds.size.width

#define SELF_HEIGHT self.bounds.size.height


#define IS_IOS7() (([[[UIDevice currentDevice]systemVersion]doubleValue])>=7.0)
#define IS_IOS8() (([[[UIDevice currentDevice]systemVersion]doubleValue])>=8.0)
#define IS_IOS9() (([[[UIDevice currentDevice]systemVersion]doubleValue])>=9.0)

#define IS_IPHONE4() (HEIGHT==480.)
#define IOS7_LAYOUT() if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {self.extendedLayoutIncludesOpaqueBars = NO;self.edgesForExtendedLayout=UIRectEdgeTop;self.modalPresentationCapturesStatusBarAppearance = NO;self.automaticallyAdjustsScrollViewInsets = YES;}

#define IOS7_NOEXTENDED_LAYOUT() \
if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) \
{self.edgesForExtendedLayout=0;}

#define MAINVIEW_HEIGHT_HASNAVBAR_NOTABBAR_RECT CGRectMake(0, 0, self.view.frame.size.width,(self.view.frame.size.height-(IS_IOS7()?0:44)))
#endif

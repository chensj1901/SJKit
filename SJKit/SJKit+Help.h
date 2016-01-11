//
//  SJKit+Help.h
//  Pods
//
//  Created by 陈少杰 on 16/1/12.
//
//

#ifndef SJKit_Help_h
#define SJKit_Help_h
#define SYSTEM_VERSION ([[[UIDevice currentDevice]systemVersion]doubleValue])

#define WEAK_SELF()  __weak __typeof(&*self) __self=self

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


#endif /* SJKit_Help_h */

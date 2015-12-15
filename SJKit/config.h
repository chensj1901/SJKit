//
//  config.h
//  Gobang
//
//  Created by 陈少杰 on 14/6/27.
//  Copyright (c) 2014年 陈少杰. All rights reserved.
//

#ifndef Gobang_config_h
#define Gobang_config_h

#define GAME_ICE_TYPE_COUNT 6
#define GAME_ROW_COUNT 9
#define GAME_COL_COUNT 9
#define GAME_BLOCK_WIDTH 35

#define ADS_MOGO_APPKEY @"a736890be8774f2ebf50d694c2f97959"
#define UMENG_APPKEY @"55c071aae0f55a5c05001ba0"

#define BlACK_COLOR @"000000"
#define WHITE_COLOR_HEX @"EFF1E0"
#define ADWO_APPKEY @""

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


struct SJCoordinate{
     int row;
     int col;
};
typedef struct SJCoordinate SJCoordinate;

#define SJCoordinateMake(row,col) (SJCoordinate){row,col}
#define SJCoordinateZero SJCoordinateMake(-1,-1)
#define SJCoordinateIsEquare(A,B) (A.row==B.row&&A.col==B.col)
#define SJCoordinateCanLink(A,B) ((ABS((int)A.row-(int)B.row)<=1)&&(ABS((int)A.col-(int)B.col)<=1))
#define SJCoordinateToPoint(coordinate) CGPointMake(coordinate.row,coordinate.col)
#define CGPointToCoordinate(point) SJCoordinateMake(point.x,point.y)
#define FOREACH_DATA(A) for (int row=0; row<GAME_ROW_COUNT; row++) {for (int col=0; col<GAME_COL_COUNT;col++) {A}};
#endif

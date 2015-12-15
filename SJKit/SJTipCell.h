//
//  SJTipCell.h
//  tBook
//
//  Created by 陈少杰 on 15/5/24.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "SJCell.h"

@interface SJTipCell : SJCell
@property(nonatomic,readonly)UILabel *tipLabel;
+(CGFloat)cellHeight;
-(void)loadTip:(NSString *)tip;
@end

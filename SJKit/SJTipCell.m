//
//  SJTipCell.m
//  tBook
//
//  Created by 陈少杰 on 15/5/24.
//  Copyright (c) 2015年 陈少杰. All rights reserved.
//

#import "SJTipCell.h"

@implementation SJTipCell
{
    CGRect _tipLabelRect;
}


@synthesize tipLabel=_tipLabel;


#pragma mark - 初始化

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSetting];
        [self loadUI];
    }
    return self;
}

-(void)loadSetting{
    _tipLabelRect= CGRectMake(0, 0, WIDTH, [SJTipCell cellHeight]);
}

-(void)loadUI{
    [self addSubview:self.tipLabel];
}

#pragma mark - 属性定义

-(UILabel *)tipLabel{
    if (!_tipLabel) {
        _tipLabel=[[UILabel alloc]initWithFrame:_tipLabelRect];
        [_tipLabel quicklySetFontPoint:14 textColorHex:@"627074" textAlignment:NSTextAlignmentCenter];
    }
    return _tipLabel;
}



#pragma mark - 其他方法
-(void)loadTip:(NSString *)tip{
    self.tipLabel.text=tip;
}


+(CGFloat)cellHeight{
    return 44;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

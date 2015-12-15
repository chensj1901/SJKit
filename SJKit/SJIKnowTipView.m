//
//  SJIKnowTipView.m
//  zhitu
//
//  Created by 陈少杰 on 15/7/6.
//  Copyright (c) 2015年 聆创科技有限公司. All rights reserved.
//

#import "SJIKnowTipView.h"
#import "SJFrame.h"

@implementation SJIKnowTipView
{
    CGRect _boxImageViewRect;
    CGRect _titleLabelRect;
    CGRect _iKnowBtnRect;
    CGRect _iKnowLabelRect;
    CGRect _okBtnRect;
    CGRect _cancelBtnRect;
}


@synthesize boxImageView=_boxImageView;
@synthesize titleLabel=_titleLabel;
@synthesize iKnowBtn=_iKnowBtn;
@synthesize iKnowLabel=_iKnowLabel;
@synthesize okBtn=_okBtn;
@synthesize cancelBtn=_cancelBtn;


#pragma mark - 初始化

-(id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self loadSetting];
        [self loadUI];
    }
    return self;
}

-(void)loadSetting{
    _boxImageViewRect= CGRectMake((WIDTH-200)/2, (WIDTH+88-109)/2, 200, 109);
    _titleLabelRect= CGRectMake(0, 21, CGRectGetWidth(_boxImageViewRect), 14);
    _iKnowBtnRect= CGRectMake(17, 39, 24, 24);
    _iKnowLabelRect= CGRectMake(41, 45, CGRectGetWidth(_boxImageViewRect)-41, 12);
    _okBtnRect= CGRectMake(23, 45+32, (CGRectGetWidth(_boxImageViewRect)-46)/2, 20);
    _cancelBtnRect= CGRectMake(CGRectGetWidth(_boxImageViewRect)-(CGRectGetWidth(_boxImageViewRect)-46)/2-23, 45+32, (CGRectGetWidth(_boxImageViewRect)-46)/2, 20);
}

-(void)loadUI{
    self.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.6];
    
    [self addSubview:self.boxImageView];
    [self.boxImageView addSubview:self.titleLabel];
    [self.boxImageView addSubview:self.iKnowBtn];
    [self.boxImageView addSubview:self.iKnowLabel];
    [self.boxImageView addSubview:self.okBtn];
    [self.boxImageView addSubview:self.cancelBtn];
}

#pragma mark - 属性定义

-(UIView *)boxImageView{
    if (!_boxImageView) {
        _boxImageView=[[UIView alloc]initWithFrame:_boxImageViewRect];
        _boxImageView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.6];
        _boxImageView.clipsToBounds=YES;
        _boxImageView.layer.cornerRadius=5;
        _boxImageView.userInteractionEnabled=YES;
    }
    return _boxImageView;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel=[[UILabel alloc]initWithFrame:_titleLabelRect];
        [_titleLabel quicklySetFontPoint:14 textColorHex:@"ffffff" textAlignment:NSTextAlignmentCenter];
    }
    return _titleLabel;
}

-(UIButton *)iKnowBtn{
    if (!_iKnowBtn) {
        _iKnowBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _iKnowBtn.frame=_iKnowBtnRect;
        [_iKnowBtn quicklySetNormalImageNamed:@"劳资兹盗啦_.png" highlightImageNamed:nil selectedImageNamed:@"劳资兹盗啦_s.png"];
    }
    return _iKnowBtn;
}

-(UILabel *)iKnowLabel{
    if (!_iKnowLabel) {
        _iKnowLabel=[[UILabel alloc]initWithFrame:_iKnowLabelRect];
        [_iKnowLabel quicklySetFontPoint:12 textColorHex:@"989898" textAlignment:NSTextAlignmentLeft];
    }
    return _iKnowLabel;
}

-(UIButton *)okBtn{
    if (!_okBtn) {
        _okBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _okBtn.frame=_okBtnRect;
        [_okBtn quicklySetFontPoint:14 textColorHex:@"ffffff" textAlignment:NSTextAlignmentLeft title:@"确认"];
    }
    return _okBtn;
}

-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame=_cancelBtnRect;
        [_cancelBtn quicklySetFontPoint:14 textColorHex:@"ffffff" textAlignment:NSTextAlignmentRight title:@"取消"];
    }
    return _cancelBtn;
}

-(void)ok{
    if (self.finishBlock) {
        self.finishBlock(self);
    }
    [self removeFromSuperview];
}

-(void)iKnow{
    self.iKnowBtn.selected=!self.iKnowBtn.selected;
}


-(void)cancel{
    [self removeFromSuperview];
}

#pragma mark - 其他方法
+(void)showInViewWithTitle:(NSString *)title iKnowDesc:(NSString *)iKnowDesc successBlock:(SJTipViewSuccessBlock_1)successBlock{
    SJIKnowTipView *tipView=[[SJIKnowTipView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    
    tipView.iKnowBtn.hidden=!iKnowDesc.length;
    tipView.iKnowLabel.hidden=!iKnowDesc.length;

    tipView.titleLabel.text=title;
    tipView.iKnowLabel.text=iKnowDesc;
    
    CGSize size = [title sizeWithFont:tipView.titleLabel.font];
    
    CGFloat offset = 23 * ((CGFloat)WIDTH/320);
    CGFloat width = size.width + offset * 2;
    if (width < 214) {
        width = 214;
    }
//    if (width > tipView.boxImageView.frame.size.width)
    {
        CGRect boxImageViewRrame = CGRectMake((WIDTH - width)/2, (WIDTH+88-109)/2, width, 125);
        tipView.boxImageView.frame = boxImageViewRrame;
        tipView.titleLabel.frame = CGRectMake((width - size.width)*0.5, 21, size.width, 14);
        tipView.iKnowBtn.frame = CGRectMake((width - size.width)*0.5 - 5, 41, 24, 24);
        tipView.iKnowLabel.frame = CGRectMake(CGRectGetMaxX(tipView.iKnowBtn.frame), 47, CGRectGetWidth(boxImageViewRrame)-41, 12);
        
        tipView.okBtn.frame = CGRectMake(offset, 50+30, (200-(offset*2))/2, 24);
        tipView.cancelBtn.frame = CGRectMake(CGRectGetWidth(boxImageViewRrame)-(200-(offset*2))/2-offset, 50+30, (200-(offset*2))/2, 24);
    }
    
    [tipView.okBtn addTarget:tipView action:@selector(ok) forControlEvents:UIControlEventTouchUpInside];
    
    [tipView.iKnowBtn addTarget:tipView action:@selector(iKnow) forControlEvents:UIControlEventTouchUpInside];
    
    [tipView.cancelBtn addTarget:tipView action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    
    tipView.finishBlock=successBlock;
    [[[[UIApplication sharedApplication]windows]objectAtIndex:0]addSubview:tipView];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

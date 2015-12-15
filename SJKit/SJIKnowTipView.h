//
//  SJIKnowTipView.h
//  zhitu
//
//  Created by 陈少杰 on 15/7/6.
//  Copyright (c) 2015年 聆创科技有限公司. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void (^SJTipViewSuccessBlock)(void);
typedef void (^SJTipViewSuccessBlock_1)(UIView *thisView);

@interface SJIKnowTipView : UIView
@property(nonatomic,readonly)UIView *boxImageView;
@property(nonatomic,readonly)UILabel *titleLabel;
@property(nonatomic,readonly)UIButton *iKnowBtn;
@property(nonatomic,readonly)UILabel *iKnowLabel;
@property(nonatomic,readonly)UIButton *okBtn;
@property(nonatomic,readonly)UIButton *cancelBtn;
@property(nonatomic,copy)SJTipViewSuccessBlock_1 finishBlock;

+(void)showInViewWithTitle:(NSString *)title iKnowDesc:(NSString *)iKnowDesc successBlock:(SJTipViewSuccessBlock_1)successBlock;
@end

//
//  SJSearchBar2.m
//  zhitu
//
//  Created by 陈少杰 on 14-3-13.
//  Copyright (c) 2014年 聆创科技有限公司. All rights reserved.
//

#import "SJSearchBar.h"

@implementation SJSearchBar
@synthesize searchIcon=_searchIcon;
@synthesize deleteIcon=_deleteIcon;

- (id)initWithFrame:(CGRect)frame
{//
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.background=[UIImage quicklyBackgroundImageWithImageName:@"账号输入框_.png"];
//        self.backgroundColor = [UIColor colorWithHex:@"EDF0F1"];
        self.textColor = [UIColor colorWithHex:@"62707d"];
        self.leftViewMode=UITextFieldViewModeAlways;
        self.leftView=self.searchIcon;
        self.rightView=self.deleteIcon;
        self.rightViewMode=UITextFieldViewModeWhileEditing;
//        self.layer.borderWidth=1;
//        self.layer.cornerRadius=2;
        self.placeholderFont=[UIFont boldSystemFontOfSize:14];
        self.font=[UIFont boldSystemFontOfSize:14];
        self.returnKeyType=UIReturnKeySearch;
//        self.layer.borderColor=[[UIColor colorWithHex:@"f0f0f0"]CGColor];
        self.placeholderColor=[UIColor colorWithHex:@"b6bec6"];
    }
    return self;
}

-(CGRect) leftViewRectForBounds:(CGRect)bounds {
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 5;
    return iconRect;
}

-(UIImageView *)searchIcon{
    if (!_searchIcon) {
        _searchIcon=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"放大镜_.png"]];
        _searchIcon.frame=CGRectMake(0, (CGRectGetHeight(self.bounds) - 30)*0.5, 30, 30);
        _searchIcon.contentMode=UIViewContentModeCenter;
    }
    return _searchIcon;
}

-(UIButton *)deleteIcon{
    if (!_deleteIcon) {
        _deleteIcon=[UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteIcon setImage:[UIImage imageNamed:@"搜索框内的叉号_.png"] forState:UIControlStateNormal];
//        [_deleteIcon setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        _deleteIcon.frame=CGRectMake(0, 0, 30, 30);
        [_deleteIcon addTarget:self action:@selector(clearText) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteIcon;
}

-(void)clearText{
    if([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]){
        if([self.delegate textField:self shouldChangeCharactersInRange:NSMakeRange(0, self.text.length) replacementString:@""]){
            self.text=@"";
            [[NSNotificationCenter defaultCenter]postNotificationName:UITextFieldTextDidChangeNotification object:self userInfo:nil];
        }
    }else{
        
        self.text=@"";
        [[NSNotificationCenter defaultCenter]postNotificationName:UITextFieldTextDidChangeNotification object:self userInfo:nil];
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

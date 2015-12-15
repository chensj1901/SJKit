//
//  SJBaseViewController.m
//  ClearIce
//
//  Created by 陈少杰 on 14/8/28.
//  Copyright (c) 2014年 陈少杰. All rights reserved.
//

#import "SJBaseViewController.h"

@interface SJBaseViewController ()

@end

@implementation SJBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        IOS7_LAYOUT();
        self.hidesBottomBarWhenPushed=YES;
        [self loadSetting];
    }
    return self;
}

-(void)loadSetting{

}

-(void)loadUI{


}

-(void)loadTarget{

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.view!=self.mainView) {
        [self.view addSubview:self.mainView];
    }
    [self loadUI];
    [self loadTarget];

}

-(UIView *)mainView{
    if (!_mainView) {
        NSString *selfVCStr=NSStringFromClass([self class]);
        NSString *selfViewStr=[selfVCStr stringByReplacingOccurrencesOfString:@"Controller" withString:@""];
        Class class=NSClassFromString(selfViewStr);
        _mainView=[[class alloc]initWithFrame:MAINVIEW_HEIGHT_HASNAVBAR_NOTABBAR_RECT];
        
    }
    return _mainView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSString *selfVCStr=NSStringFromClass([self class]);
    [MobClick beginLogPageView:selfVCStr];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    NSString *selfVCStr=NSStringFromClass([self class]);
    [MobClick endLogPageView:selfVCStr];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

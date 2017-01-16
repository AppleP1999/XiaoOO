//
//  DDMianViewController.m
//  xiaoO
//
//  Created by hf on 2017/1/3.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "DDMianViewController.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

#import "DDTabBarView.h"
@interface DDMianViewController ()
@property (nonatomic, weak) DDTabBarView * buttomView;
@end

@implementation DDMianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
   
    DDTabBarView * buttomView = [[DDTabBarView alloc] init];
    [self.view addSubview: buttomView];
    self.buttomView = buttomView;
    [self set_UIConstraints];
    
    
 
}
-(void)set_UIConstraints
{

    [_buttomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

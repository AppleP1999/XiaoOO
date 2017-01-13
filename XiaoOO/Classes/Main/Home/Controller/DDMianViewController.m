//
//  DDMianViewController.m
//  xiaoO
//
//  Created by hf on 2017/1/3.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "DDMianViewController.h"

#import <ReactiveCocoa/ReactiveCocoa.h>


@interface DDMianViewController ()

@end

@implementation DDMianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * v = [[UIButton alloc]init];
    v.backgroundColor = [UIColor redColor];
    [self.view addSubview:v];

    
    
    UITextField * textf = [[UITextField alloc]init];
    textf.backgroundColor = [UIColor redColor];
    
   [self.view addSubview:textf];
    [textf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(130);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(60);
    }];
    [DDLog sharedInstance];
    
    [[textf rac_textSignal] subscribeNext:^(id x) {
        NSLog(@"%@",x);

    }];
//    [v mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(130);
//        make.left.mas_equalTo(20);
//        make.width.mas_equalTo(60);
//        make.height.mas_equalTo(60);
//    }];
    
//    self.view.y = 100;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

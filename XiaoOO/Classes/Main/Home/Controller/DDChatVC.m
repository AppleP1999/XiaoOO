//
//  DDChatVC.m
//  XiaoOO
//
//  Created by hf on 2017/2/20.
//  Copyright © 2017年 cyw_dj. All rights reserved.
//

#import "DDChatVC.h"
#import "DDChatCell.h"
#import "DDChatModel.h"
@interface DDChatVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak) UITableView * tableView;
@property(nonatomic,strong)NSMutableArray  * array;
@end

@implementation DDChatVC
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.array = [NSMutableArray array];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];

    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setImgView_bg];
    [self initUI_tableView];
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 120, 80)];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        DDChatModel * m = [[DDChatModel alloc]init];

        m.textString = @"1234567890-1234567890-123456789-1234567890-1234567890-";
        m.messageType = VDChatMessage;
        
        [self.array addObject:m];
        [self.tableView reloadData];
    }];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
 
    
    for (int i= 0; i<3; i++) {
        DDChatModel * m = [[DDChatModel alloc]init];
        m.textString = @"1234567890-1234567890-123456789-1234567890-1234567890-";
        m.messageType = MyMessageType;
        [self.array addObject:m];
    }
}
-(void)initUI_tableView
{
    UITableView * tableView = [[UITableView alloc]init];
    tableView.delegate  = self;
    tableView.dataSource= self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.rowHeight = UITableViewAutomaticDimension;
    [tableView setBackgroundColor:[UIColor clearColor]];

    [self.view addSubview:tableView];
    self.tableView = tableView;
//    self.tableView.rowHeight =UITableViewAutomaticDimension;  // 行高
//    self.tableView.estimatedRowHeight = 100;  // 预估行高
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(0);
        
    }];
}
#pragma make - uitableview-delegate
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    DDWeakSelf(self);
//    __block  NSInteger i = 0;
//    
//     [[tableView visibleCells ] enumerateObjectsUsingBlock:^(__kindof DDChatCell * _Nonnull cell, NSUInteger idx, BOOL * _Nonnull stop) {
//         cell.black_celH = ^(CGFloat h){
//             [weakself.array addObject:@(h)];
//             weakself.array[idx] = @(h);
//             i++;
////             [weakself.tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0]];
//             if (i==weakself.array.count) {
//                 [weakself.tableView reloadData];
//             }
////             [weakself.tableView reloadSections:[NSIndexSet indexSetWithIndex:idx] withRowAnimation:UITableViewRowAnimationFade];
//         };
//     }];
//
//}
-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString * ID = @"chatCel";
    
    DDChatCell * cell  = [tableView dequeueReusableCellWithIdentifier:ID
    ];
    if (!cell) {
        cell = [[DDChatCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        DDChatModel * m =  self.array[indexPath.row];
        [cell refreshCell:m];

    }else{
    DDChatModel * m =  self.array[indexPath.row];
        [cell refreshCell:m];
    }
    //    m.textString = @"1234567890-1234567890-123456789-1234567890-1234567890-";
//    m.messageType = MyMessageType;
//    if (indexPath.row==1) {
//        m.messageType=VDChatMessage;
//    }

    //    self.tableView.estimatedRowHeight = cell.cellHeight;
    return  cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    DDChatModel * m = self.array[indexPath.row];
   
    
    return  m.model_h;
}
@end

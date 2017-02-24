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
#import "DDTabBarView.h"
@interface DDChatVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak) UITableView * tableView;
@property(nonatomic,strong)NSMutableArray  * array;
@property (nonatomic, weak) DDTabBarView * buttomView;

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
-(void) test
{
    UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 120, 80)];
    
    [btn block_TouchUpInside_Action:^(UIButton *button) {
        DDChatModel * m = [[DDChatModel alloc]init];
        
        m.textString = @"1234567890-1234567890-123456789-1234567890-1234567890-";
        m.messageType = VDChatMessage;
        
        [self.array addObject:m];
        [self.tableView reloadData];
    }];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *feedDicts = rootDict[@"feed"];
    [feedDicts enumerateObjectsUsingBlock:^(NSDictionary*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DDChatModel * m = [[DDChatModel alloc]init];
        m.messageType = idx%2==0 ? MyMessageType:VDChatMessage ;
        m.textString = obj[@"content"];
                [self.array addObject:m];


    }];
//    for (NSInteger i= 0; i<12; i++) {
//        DDChatModel * m = [[DDChatModel alloc]init];
//        m.textString = @"1234567890-1234567890-123456789-1234567890-1234567890-";
//       m.textString =  [NSString stringWithFormat:@"呵呵哒%ld\n%@" ,(i+1)*2000,m.textString];
//        
//        m.messageType = MyMessageType;
//        [self.array addObject:m];
//    }

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:YES];

    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setImgView_bg];
    [self initUI_tableView];
    [self initUI_buttomView];
    [self set_UIConstraints];
    [self test];
    [self.buttomView block_Click_btnL:^{
        NSLog(@"LLLL");
        [self.navigationController popViewControllerAnimated:YES];
    } btnR:^{
        NSLog(@"RRRR");
    }];
}
-(void)set_UIConstraints
{
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.bottom.equalTo(self.buttomView.mas_top);
        
    }];
    [self.buttomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
    
}
-(void)initUI_buttomView
{
    DDTabBarView * buttomView = [[DDTabBarView alloc] init];
    [self.view addSubview: buttomView];
    self.buttomView = buttomView;
}
-(void)initUI_tableView
{
    UITableView * tableView = [[UITableView alloc]init];
    tableView.delegate  = self;
    tableView.dataSource= self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.rowHeight = UITableViewAutomaticDimension;
    [tableView setBackgroundColor:[UIColor clearColor]];
    [tableView registerClass:[DDChatCell class] forCellReuseIdentifier:@"MyMessageType"];
    [tableView registerClass:[DDChatCell class] forCellReuseIdentifier:@"VDChatMessage"];


    [self.view addSubview:tableView];
    self.tableView = tableView;
 
    
}
#pragma make - uitableview-delegate
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//   
////    [self.tableView reloadData];
//
//}
-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID ;//= @"chatCel";
    
    DDChatModel * m =  self.array[indexPath.row];
    if (m.messageType == MyMessageType) {
    ID = @"MyMessageType";
    }else if (m.messageType == VDChatMessage){
        ID = @"VDChatMessage";
    }


    DDChatCell * cell  = [tableView dequeueReusableCellWithIdentifier:ID
    forIndexPath:indexPath];
//    if (cell==nil) {
//    DDChatCell *    cell = [[DDChatCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//    }
 

    [cell refreshCell:m];
 
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
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    DDChatModel * m =  self.array[indexPath.row];
 
    
    return  m.model_h;
}
@end

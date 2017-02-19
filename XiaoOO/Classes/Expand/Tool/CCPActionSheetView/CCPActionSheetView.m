//
//  CCPActionSheetView.m
//  CCPActionSheetDemo
//
//  Created by C CP on 16/7/20.
//  Copyright © 2016年 C CP. All rights reserved.
//

#import "CCPActionSheetView.h"
//#import "UIView+CCPExtension.h"
#import "CCPActionSheetCell.h"
#import "DDTextFieldButton.h"

 #define CCPWIDTH [UIScreen mainScreen].bounds.size.width
#define CCPHEIGHT [UIScreen mainScreen].bounds.size.height

@interface CCPActionSheetView ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>



@property (strong,nonatomic)UITableView *actionSheetTableView;

@property (nonatomic,assign) CGFloat recodeTableViewHeight;

@property (nonatomic,strong) UIView *alertView;

@property (nonatomic,copy) NSString *viewStyle;

@property (nonatomic,strong)UITapGestureRecognizer *sheetTap;

@property (nonatomic,strong)UITapGestureRecognizer *alertTap;

@property (nonatomic,assign)CGFloat alertViewW;
@property (nonatomic,assign)CGFloat alertViewH;
@property(nonatomic,strong)DDTextFieldButton * textFild_btn;
@property(nonatomic,weak)DDTextFieldButton * buttomView ;

@end
//settingDataArray_ip
@implementation CCPActionSheetView
-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
-(void) updateTableView
{
    [self.actionSheetTableView reloadData];
    
    

}
- (UITableView *)actionSheetTableView {
    
    if (!_actionSheetTableView) {
        
        _actionSheetTableView = [[UITableView alloc] init];
        
        NSAssert(self.dataArray.count > 0, @"self.dataArray.count = 0 or self.dataArray = nil");
        
        CGFloat showTableViewHeight = self.dataArray.count * 44 + 10;
        
        if (showTableViewHeight > CCPHEIGHT/3 * 2) {
            
            showTableViewHeight = CCPHEIGHT/3 * 2;
            
//            _actionSheetTableView.scrollEnabled = YES;
            
        } else {
            
//            _actionSheetTableView.scrollEnabled = NO;
            
        }
        
        self.recodeTableViewHeight = showTableViewHeight;
       __weak DDTextFieldButton * buttomView =[ DDTextFieldButton dropdown];
        buttomView.frame = CGRectMake(0, CCPHEIGHT, CCPWIDTH, 54);
        [buttomView addTarget:^{
            [self.dataArray addObject:buttomView.DDTextField.text];
            [self updateTableView];
        }];
        [self addSubview:buttomView];
        self.buttomView = buttomView;
//        [buttomView  mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.left.right.mas_equalTo(0);
////            make.bottom.equalTo(self.mas_bottom).offset(-44);
//            make.height.mas_equalTo(54);
//            make.top.equalTo(self.mas_bottom);
//            make.width.equalTo(self.mas_width);
//            
////            make.size.mas_equalTo(CGSizeMake(200, 50));
////            make.top.left.mas_equalTo(30);
//
////            make.
//        }];
        _actionSheetTableView.frame = CGRectMake(0, CCPHEIGHT+54, CCPWIDTH, showTableViewHeight);
        
        [self addSubview:_actionSheetTableView];
        
    }
    
    return _actionSheetTableView;
    
}


- (instancetype)initWithActionSheetArray:(NSArray *)indexTextArray {
    
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        
        self.viewStyle = @"actionSheetView";
        __weak typeof(self) weakSelf = self;
        [self.dataArray  setArray: indexTextArray];
        self.actionSheetTableView.dataSource = self;
        self.actionSheetTableView.delegate = self;
        
        [UIView animateWithDuration:0.25 animations:^{
            weakSelf.actionSheetTableView.frame = CGRectMake(0, CCPHEIGHT - weakSelf.recodeTableViewHeight-54, CCPWIDTH, weakSelf.recodeTableViewHeight);
                weakSelf.buttomView.frame = CGRectMake(0, CCPHEIGHT-54, CCPWIDTH, 54);
        }];
        
        UIWindow *currentWindows = [UIApplication sharedApplication].keyWindow;
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];
        [currentWindows addSubview:self];
        
        [self.actionSheetTableView registerNib:[UINib nibWithNibName:@"CCPActionSheetCell" bundle:nil] forCellReuseIdentifier:@"actionSheetCell"];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        self.sheetTap = tap;
        
        tap.delegate = self;
        
        [self addGestureRecognizer:tap];
        
    }
    
    return self;
    
}



- (instancetype) initWithAlertView:(UIView *)alertView {
    
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        
        self.viewStyle = @"alertView";
        self.alertView = alertView;
        
        self.alertViewH = alertView.height;
        
        self.alertViewW = alertView.width;
        
        self.viewAnimateStyle = ViewAnimateNone;//默认无动画
        
        UIWindow *currentWindows = [UIApplication sharedApplication].keyWindow;
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];
        [currentWindows addSubview:self];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        
        self.alertTap = tap;
        
        tap.delegate = self;
        
        [self addGestureRecognizer:tap];
        
    }
    
    return self;
}


- (void)setViewAnimateStyle:(viewAnimateStyle)viewAnimateStyle {
    
    _viewAnimateStyle = viewAnimateStyle;
    
    if (viewAnimateStyle == ViewAnimateFromLeft) {
        
        self.alertView.frame = CGRectMake(- self.alertViewW, self.centerY - self.alertViewH/2 , self.alertViewW, self.alertViewH);
        
    } else if (viewAnimateStyle == ViewAnimateFromRight) {
        
        self.alertView.frame = CGRectMake(CCPWIDTH, self.centerY - self.alertViewH/2 , self.alertViewW, self.alertViewH);
        
    } else if (viewAnimateStyle == ViewAnimateFromTop) {
        
        self.alertView.frame = CGRectMake((CCPWIDTH - self.alertViewW) / 2, - self.alertViewH , self.alertViewW, self.alertViewH);
        
    } else if (viewAnimateStyle == ViewAnimateFromBottom) {
        
        self.alertView.frame = CGRectMake((CCPWIDTH - self.alertViewW) / 2, CCPHEIGHT , self.alertViewW, self.alertViewH);
        
    } else if (viewAnimateStyle == ViewAnimateScale) {
        
        self.alertView.center = self.center;
        self.alertView.transform = CGAffineTransformMakeScale(0.0f, 0.0f);
        
    } else {
        
        self.alertView.center = self.center;
        
    }
    __weak typeof(self) weakSelf = self;

    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        
        if (weakSelf.viewAnimateStyle == ViewAnimateScale) {
            
            weakSelf.alertView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        }
        
        weakSelf.alertView.center = weakSelf.center;
        
    } completion:^(BOOL finished) {
        
    }];
    
    [self addSubview:self.alertView];
    
}


- (void)closeAlertView:(closeAlertviewBlock)closeAlertviewBlock {
    
    self.closeAlertviewBlock = closeAlertviewBlock;
    
    [self tap:nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CCPActionSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"actionSheetCell"];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:246.0/255.0 green:246.0/255.0  blue:246.0/255.0  alpha:1.0];
    
    cell.infoLabel.text = self.dataArray[indexPath.row];
    
    if (indexPath.row == self.dataArray.count - 1) {
        
        cell.topView.hidden = YES;
//        cell.infoLabel.hidden = YES;
    } else {
        cell.topView.hidden = YES;
        cell.toTopCconstraint.constant = -10;
        
    }
    if (indexPath.row == self.dataArray.count-1) {
//        DDTextFieldButton * textFieldID = [DDTextFieldButton dropdown];
//        [textFieldID returnTextfiled:^(NSString *str) {
//            NSLog(@"   str - %@" , str);
//        }];
//        
//        [cell.contentView addSubview:textFieldID];
//        [textFieldID mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//            make.top.mas_equalTo(10);
//            make.centerX.equalTo(cell.contentView);
//            make.width.mas_equalTo(cell.contentView).multipliedBy(1.0);// 高/宽 == 0.6
// 
//        }];
    }
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.cellDidSelectBlock) {
        
        self.cellDidSelectBlock(self.dataArray[indexPath.row],indexPath.row);
    }

    
    [self dissMissView];
}


- (void)cellDidSelectBlock:(cellDidSelectBlock)cellDidSelectBlock {
    
    self.cellDidSelectBlock = cellDidSelectBlock;
    
}


-(void)setIsBGClose:(BOOL)isBGClose {
    
    _isBGClose = isBGClose;
    
    if (isBGClose) {
    
        [self removeGestureRecognizer:self.alertTap];
        
    }
    
}

- (void)tap:(UITapGestureRecognizer *)tap {
    
    if (self.closeAlertviewBlock) {
        
        self.closeAlertviewBlock();
    }
    
    if ([self.viewStyle isEqualToString:@"alertView"]) {
        
        [self dissMissAlertView];
        
    } else {
        
        [self dissMissView];
        
    }
    
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    
    if (gestureRecognizer == self.sheetTap) {
        
        if ([touch.view isDescendantOfView:self.actionSheetTableView]|| [touch.view isDescendantOfView:self.buttomView]) {
            return NO;
        }
        
    } else {
        
        if ([touch.view isDescendantOfView:self.alertView] ) {
            return NO;
        }
        
    }
    
    return YES;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
//    if (indexPath.row == self.dataArray.count - 1) {
//        
//        return 54;
//        
//    } else {
    
        return 44;
//    }
    
}


- (void)dissMissView{
    
    GXHUserDef.Array_ips = self.dataArray;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:.3 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        weakSelf.actionSheetTableView.frame = CGRectMake(0, CCPHEIGHT, CCPWIDTH, weakSelf.recodeTableViewHeight);
        weakSelf.buttomView.frame = CGRectMake(0, CCPHEIGHT, CCPWIDTH, weakSelf.recodeTableViewHeight);
        
    } completion:^(BOOL finished) {
         
        weakSelf.actionSheetTableView = nil;
        
        [weakSelf removeFromSuperview];
    }];
    
    
    
}


- (void)dissMissAlertView {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        
        if (weakSelf.viewAnimateStyle == ViewAnimateFromLeft) {
            
            weakSelf.alertView.frame = CGRectMake(CCPWIDTH, weakSelf.centerY - weakSelf.alertViewH / 2, weakSelf.alertViewW, weakSelf.alertViewH);
            
        } else if (weakSelf.viewAnimateStyle == ViewAnimateFromRight) {
            
            weakSelf.alertView.frame = CGRectMake(- weakSelf.alertViewW, weakSelf.centerY - weakSelf.alertViewH/2 , weakSelf.alertViewW, weakSelf.alertViewH);
            
        } else if (weakSelf.viewAnimateStyle == ViewAnimateFromTop) {
            
            weakSelf.alertView.frame = CGRectMake((CCPWIDTH - weakSelf.alertViewW) / 2, CCPHEIGHT , weakSelf.alertViewW, weakSelf.alertViewH);
            
        } else if (weakSelf.viewAnimateStyle == ViewAnimateFromBottom) {
            
            weakSelf.alertView.frame = CGRectMake((CCPWIDTH - weakSelf.alertViewW) / 2, - weakSelf.alertViewH , weakSelf.alertViewW, weakSelf.alertViewH);
            
        } else if (self.viewAnimateStyle == ViewAnimateScale) {
            
            weakSelf.alertView.center = weakSelf.center;
            weakSelf.alertView.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
            
        }
        
    } completion:^(BOOL finished) {
        
        [weakSelf removeFromSuperview];
        
    }];
    
}

@end

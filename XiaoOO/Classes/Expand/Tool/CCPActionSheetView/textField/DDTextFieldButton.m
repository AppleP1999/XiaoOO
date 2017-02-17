//
//  DDTextFleldButton.m
//  CCPActionSheetDemo
//
//  Created by hf on 2017/1/3.
//  Copyright © 2017年 C CP. All rights reserved.
//

#import "DDTextFieldButton.h"

@interface DDTextFieldButton ()<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UIButton *affirmButton;

@end

@implementation DDTextFieldButton
- (IBAction)changed:(UITextField *)sender {
       self.TextStringBlock ? self.TextStringBlock(sender.text):NULL;
    
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.DDTextField.layer.borderWidth =2;
    self.DDTextField.layer.borderColor =  RGBA(234, 234, 234, 1.0).CGColor;
    //[UIColor grayColor].CGColor;
    
}
-(void)addTarget:(targetBlock)b
{
     
    self.targetBlock = b;
}
-(void)setTextSting:(NSString *)textSting
{
    self.DDTextField.text = textSting;
}
 

-(void )returnTextfiled:(targetTextStringBlock)b
{
       self.TextStringBlock  = b;
    
}
- (IBAction)affirmbtn:(id)sender {
    self.targetBlock ? self.targetBlock():NULL;
}
+(instancetype)dropdown
{
    return [[NSBundle mainBundle] loadNibNamed:@"DDTextFieldButton" owner:NULL options:NULL][0];
}


@end

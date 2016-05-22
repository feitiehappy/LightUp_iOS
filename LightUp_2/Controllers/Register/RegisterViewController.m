//
//  RegisterViewController.m
//  LightUp_2
//
//  Created by 十大大 on 16/5/22.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *Username;
@property (weak, nonatomic) IBOutlet UITextField *FirstImportPassword;
@property (weak, nonatomic) IBOutlet UITextField *SecondImportPassword;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _Username.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"请设置帐号" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}] ;
    
    _FirstImportPassword.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"请设置密码" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}] ;
    _SecondImportPassword.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"请再次输入密码" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}] ;
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

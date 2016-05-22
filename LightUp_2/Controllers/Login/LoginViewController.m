//
//  LoginViewController.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/15.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *clover;
@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UITextField *UserPassword;
- (IBAction)SkipToRegister;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
    _UserName.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"用户名" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}] ;
    
    _UserPassword.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"密码" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}] ;
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

- (IBAction)SkipToRegister {
    UIStoryboard *RegisterStoryBoard=[UIStoryboard storyboardWithName:@"Register" bundle:nil];
    UIViewController *RegisterViewControl=[RegisterStoryBoard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    [self presentViewController:RegisterViewControl animated:YES completion:nil];
}
@end

//
//  SideMenuViewController.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/12.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "SideMenuViewController.h"
#import "UIView+frameAdjust.h"
#import "UIView+Util.h"
#import "UIImageView+Util.h"
#import "Config.h"
#import "LUUser.h"
#import "Utils.h"
#import "LoginViewController.h"
#import "MyMessageViewController.h"
#import <RESideMenu/RESideMenu.h>
#import <Masonry/Masonry.h>

CGFloat const kHeaderViewHeigh = 260;
CGFloat const kAvatarHeight = 73;
CGFloat const kNameLabelWidth = 200;
CGFloat const kAvatarCornerRadius = 36;

CGFloat const kAvatarTopOffset = 108;
CGFloat const kAvatarLeftOffset = -25;
CGFloat const kNameLabelTopOffset = 9;

CGFloat const kCellTitleLeftOffset = -20;
CGFloat const kCellIconHeigh = 21;

@interface SideMenuViewController ()

@end

@implementation SideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.opaque = NO;
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left_slide_bg"]];
    
    // 禁止滑动
    self.tableView.scrollEnabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    LUUser *myProfile = [Config myProfile];
    
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor clearColor];
    
    UIImageView *avatar = [[UIImageView alloc] init];
    avatar.contentMode = UIViewContentModeScaleAspectFit;
    [avatar setCornerRadius:kAvatarCornerRadius];
    avatar.userInteractionEnabled = YES;
    [headerView addSubview:avatar];
    if (myProfile.userID) {
        [avatar loadAvatar:myProfile.avatarUrl];
    }else {
        avatar.image = [UIImage imageNamed:@"default-avatar"];
    }
    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = myProfile.username;
    nameLabel.font = [UIFont systemFontOfSize:14];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:nameLabel];
    
    
    [headerView setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kHeaderViewHeigh)];
    [avatar mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(headerView).offset(kAvatarLeftOffset);
        make.top.equalTo(headerView).offset(kAvatarTopOffset);
        make.width.mas_equalTo(kAvatarHeight);
        make.height.mas_equalTo(kAvatarHeight);
    }];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(avatar);
        make.top.equalTo(avatar.mas_bottom).offset(kNameLabelTopOffset);
        make.width.mas_equalTo(kNameLabelWidth);
        make.height.mas_equalTo(@18);
        
    }];
    
    [avatar addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushLoginPage)]];
    [nameLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushLoginPage)]];

    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kHeaderViewHeigh;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:53/255 green:127/255 blue:42/255 alpha:0.4];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [cell addSubview:titleLabel];
    titleLabel.font = [UIFont boldSystemFontOfSize:14];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @[@"主        页",
                            @"我的消息",
                            @"我的咨询",
                            @"我要咨询",
                            @"设        置"][indexPath.row];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cell.mas_centerX).offset(kCellTitleLeftOffset);
        make.top.equalTo(cell.mas_top);
        make.bottom.equalTo(cell.mas_bottom);
        make.width.mas_equalTo(kNameLabelWidth);
    }];
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    [cell addSubview:iconImageView];
    iconImageView.image = [UIImage imageNamed:@[@"icon_homepage",
                                                 @"icon_message",
                                                 @"icon_question",
                                                 @"icon_add_question",
                                                 @"icon_setting"][indexPath.row]];
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(titleLabel.mas_left).offset(-20);
        make.height.mas_equalTo(kCellIconHeigh);
        make.width.mas_equalTo(kCellIconHeigh+3);
        make.centerY.equalTo(titleLabel);
    }];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row==1) {
        UIStoryboard *MyMessage=[UIStoryboard storyboardWithName:@"MyMessage" bundle:nil];
        UINavigationController *nav = (UINavigationController *)((UITabBarController *)self.sideMenuViewController.contentViewController);
        UIViewController *MyMessageViewController=[MyMessage instantiateViewControllerWithIdentifier:@"MyMessage"];
        [nav pushViewController:MyMessageViewController animated:YES];
        
        
    }
    
    /*
//    if (indexPath.row==1) {
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MyMessage" bundle:nil];
//        LoginViewController *nav = [storyboard instantiateViewControllerWithIdentifier:@"MyMessage"];
//        //[self setContentViewController:loginVC];
//        [self presentViewController:nav animated:YES completion:nil];
//    } else {
//        return;
//    }
    
    
//    switch (indexPath.row) {
//        case 0: {
//            
//        }
//            break;
//            
//        default:
//            break;
//    }*/
    
    if (indexPath.row==2) {
        UIStoryboard *MyAdvice=[UIStoryboard storyboardWithName:@"MyAdvice" bundle:nil];
        UINavigationController *nav = (UINavigationController *)((UITabBarController *)self.sideMenuViewController.contentViewController);
        UIViewController *MyAdviceViewController=[MyAdvice instantiateViewControllerWithIdentifier:@"MyAdvice"];
        [nav pushViewController:MyAdviceViewController animated:YES];
    }
    
    if (indexPath.row==3) {
        UIStoryboard *AskAdvice=[UIStoryboard storyboardWithName:@"AskAdvice" bundle:nil];
        UINavigationController *nav = (UINavigationController *)((UITabBarController *)self.sideMenuViewController.contentViewController);
        UIViewController *AskAdviceViewController=[AskAdvice instantiateViewControllerWithIdentifier:@"AskAdvice"];
        [nav pushViewController:AskAdviceViewController animated:YES];
    }
    
    if (indexPath.row==4) {
        UIStoryboard *Setting=[UIStoryboard storyboardWithName:@"Setting" bundle:nil];
        UINavigationController *nav = (UINavigationController *)((UITabBarController *)self.sideMenuViewController.contentViewController);
        UIViewController *SettingViewController=[Setting instantiateViewControllerWithIdentifier:@"Setting"];
        [nav pushViewController:SettingViewController animated:YES];
    }
}


- (void)setContentViewController:(UIViewController *)viewController
{
    viewController.hidesBottomBarWhenPushed = YES;
    UINavigationController *nav = (UINavigationController *)((UITabBarController *)self.sideMenuViewController.contentViewController);
    [nav pushViewController:viewController animated:NO];
    
    [self.sideMenuViewController hideMenuViewController];
}

#pragma mark - 点击登录

- (void)pushLoginPage
{
    if ([Config getOwnID] == 0) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
        LoginViewController *loginVC = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        //[self setContentViewController:loginVC];
        [self presentViewController:loginVC animated:YES completion:nil];
    } else {
        return;
    }
}

@end

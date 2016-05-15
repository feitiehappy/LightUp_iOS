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

#import <RESideMenu/RESideMenu.h>
#import <Masonry/Masonry.h>

CGFloat const kHeaderViewHeigh = 270;
CGFloat const kAvatarHeight = 87;
CGFloat const kNameLabelWidth = 200;
CGFloat const kAvatarCornerRadius = 45;

CGFloat const kAvatarTopOffset = 108;
CGFloat const kAvatarLeftOffset = -25;
CGFloat const kNameLabelTopOffset = 9;

CGFloat const kCellTitleLeftOffset = -20;
CGFloat const kCellIconHeigh = 25;

@interface SideMenuViewController ()

@end

@implementation SideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView.opaque = NO;
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left_slide_bg"]];
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
    nameLabel.font = [UIFont systemFontOfSize:16.8];
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
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = RGB(233, 233, 233);
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [cell addSubview:titleLabel];
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = @[@"主      页",
                            @"我 的 消 息",
                            @"我的咨询",
                            @"我要咨询",
                            @"设    置"][indexPath.row];
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
        make.right.equalTo(titleLabel.mas_left).offset(-30);
        make.height.mas_equalTo(kCellIconHeigh);
        make.width.mas_equalTo(kCellIconHeigh);
        make.centerY.equalTo(titleLabel);
    }];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0: {
            
        }
            break;
            
        default:
            break;
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
        [self setContentViewController:loginVC];
    } else {
        return;
    }
}

@end

//
//  HomePageViewController.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/19.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageTableView.h"
#import "LUNetWork.h"
#import "HomePageDataSource.h"
#import "HPQuestionCell.h"
#import "HPTableViewCell.h"


#import <Masonry/Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import <Mantle/MTLJSONAdapter.h>

/**
 *  当前刷新页数
 */
int static page = 1;

/**
 *  当前选择分类
 */
int static questionCategory = 0;

NSString *HPTableViewCellIdentifier = @"HPTableViewCell";

@interface HomePageViewController ()

/**
 *  主页tableView 的datasource
 */
@property (strong, nonatomic) HomePageDataSource *homePageDataSource;
@property (strong, nonatomic) HomePageTableView *tableView;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"全部";
    
    // 设置tableview 的datasource
    self.homePageDataSource = [[HomePageDataSource alloc] initWithCellIdentifier:HPTableViewCellIdentifier configureCellBlock:^(HPTableViewCell *cell, HPQuestionCell *item) {
        
        cell.cellData = item;
    }];
    UINib *HPTableViewCellNib = [UINib nibWithNibName:@"HPTableViewCell" bundle:nil];
    [self.tableView registerNib:HPTableViewCellNib forCellReuseIdentifier:HPTableViewCellIdentifier];
    self.tableView.dataSource = self.homePageDataSource;
    self.tableView.delegate = self.homePageDataSource;
    
    
    // 设置下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSDictionary *params = @{
                                 @"do": @"bwzt",
                                 @"view": @"all",
                                 @"bwztclassid": [NSString stringWithFormat:@"%d", questionCategory],
                                 @"orderby": @"dateline"
                                 };
        [self refreshTableViewWithParams:params];
        page = 1;
        
    }];
    [self.tableView.mj_header beginRefreshing];
    
    // 上拉刷新
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        page+=1;
        NSDictionary *params = @{
                                 @"do": @"bwzt",
                                 @"view": @"all",
                                 @"bwztclassid": [NSString stringWithFormat:@"%d", questionCategory],
                                 @"orderby": @"dateline",
                                 @"page": [NSString stringWithFormat:@"%d", page]
                                 };
        [self refreshTableViewWithParams:params];
        
    }];
    
}


- (void)refreshTableViewWithParams:(NSDictionary *)params {
    [[LUNetWork sharedManager] requestWithMethod:GET WithPath:@"/capi/space.php" WithParams:params WithSuccessBlock:^(NSDictionary *dic) {
        if ([dic[@"code"] isEqualToNumber:@0]) {
            NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
            NSArray *rawArray = dic[@"data"][@"list"];
            for (NSDictionary *item in rawArray) {
                [mutableArray addObject:[MTLJSONAdapter modelOfClass:HPQuestionCell.class fromJSONDictionary:item error:nil]];
            }
            
            if (page == 1) {
                self.homePageDataSource.items = [NSArray arrayWithArray:mutableArray];
                [self.tableView.mj_header endRefreshing];
            }else {
                self.homePageDataSource.items = [self.homePageDataSource.items arrayByAddingObjectsFromArray:mutableArray];
                [self.tableView.mj_footer endRefreshing];
            }
            [self.tableView reloadData];
        }
        
    }WithFailureBlock:^(NSError *error) {
        NSLog(@"刷新错误: %@", error);
    }];
}

#pragma mark - 懒加载

- (HomePageTableView *)tableView {
    if (!_tableView) {
        _tableView = [[HomePageTableView alloc] init];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    return _tableView;
}

@end

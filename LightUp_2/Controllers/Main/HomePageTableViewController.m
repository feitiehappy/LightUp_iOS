//
//  HomePageTableViewController.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/16.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "HomePageTableViewController.h"
#import "HPCategoryCollectionCell.h"

@interface HomePageTableViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *categoryCollectionView;

@end

@implementation HomePageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.categoryCollectionView.dataSource = self;
    self.categoryCollectionView.delegate = self;
    
    NSBundle *bundle=[NSBundle mainBundle];
    UINib *categoryCollectionCellNib = [UINib nibWithNibName:@"HPCategoryCollectionCell" bundle:bundle];
    [self.categoryCollectionView registerNib:categoryCollectionCellNib forCellWithReuseIdentifier:@"HPCategoryCollectionCell"];
}

- (void)viewWillAppear:(BOOL)animated {
    self.title = @"全部";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.0f;
}


#pragma mark - colletction datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *icons = @[@"icon_type_00",
                       @"icon_type_01",
                       @"icon_type_02",
                       @"icon_type_03",
                       @"icon_type_04",
                       @"icon_type_05"];
    
    static NSString *ID = @"HPCategoryCollectionCell";
    HPCategoryCollectionCell *cell = [self.categoryCollectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    [cell.categoryIconButton setBackgroundImage:[UIImage imageNamed:icons[indexPath.row]] forState:UIControlStateNormal];
    
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    CGFloat width = 0;
    if ([UIScreen mainScreen].bounds.size.width > 320) {
        width = 13;
    }
    return UIEdgeInsetsMake(0, width, 0, 0);
}

@end

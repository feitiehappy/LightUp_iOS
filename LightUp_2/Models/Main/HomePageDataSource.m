//
//  HomePageDataSource.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/19.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "HomePageDataSource.h"
#import "HPTableViewCell.h"
#import "HPQuestionCell.h"
#import "HPTableCollectionViewCell.h"
#import "HPTableCollectionView.h"

#import "UITableView+FDTemplateLayoutCell.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface HomePageDataSource() 

@property (nonatomic, strong) NSString *indentifier;
@property (nonatomic, strong) ConfigureCell configureCellBlock;

@end

@implementation HomePageDataSource

- (instancetype)initWithCellIdentifier:(NSString *)identifier configureCellBlock:(ConfigureCell)configureCellBlock {
    if (self = [super init]) {
        _indentifier = identifier;
        _configureCellBlock = configureCellBlock;
        
    }
    return self;
}

#pragma mark - TableView datasource 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.indentifier forIndexPath:indexPath];
    
    self.configureCellBlock(cell, self.items[indexPath.row]);
    [cell.collectionView reloadData];
    return cell;
}


#pragma mark - TableView delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView fd_heightForCellWithIdentifier:@"HPTableViewCell" configuration:^(HPTableViewCell *cell) {
        HPQuestionCell *item = self.items[indexPath.row];
        if(item.pics.count == 0) {
            cell.contentLableToBottom.priority = 250;
        }else {
            cell.contentLableToBottom.priority = 999;
        }
        
    }];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(HPTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setCollectionViewDataSourceDelegate:self index:(NSInteger)indexPath.row];
}

#pragma mark - collectionView datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(HPTableCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    HPQuestionCell *item = self.items[collectionView.index];
    return item.pics.count;
}

- (UICollectionViewCell *)collectionView:(HPTableCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"HPTableCollectionViewCell";
    HPQuestionCell *item = self.items[collectionView.index];
    HPTableCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    [cell.imageView sd_setImageWithURL:item.pics[indexPath.row]];
    return cell;
}


@end

//
//  HomePageTableView.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/19.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "HomePageTableView.h"
#import "HPCategoryCollectionCell.h"

#import <Masonry/Masonry.h>

CGFloat const kSectionHeaderViewHeigh = 50;

@interface HomePageTableView() <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation HomePageTableView

- (instancetype)init {
    if (self = [super init]) {
        self.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

#pragma mark - collectionView DataSource

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
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

#pragma mark - collectionView DelegateFlowLayout

- (UICollectionViewFlowLayout *)createFlowLayout {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    // item的大小
    flowLayout.itemSize = CGSizeMake(45, 45);
    
    // 每一行之间的间距（最小值）
    flowLayout.minimumLineSpacing = 10;
    // item间距（最小值）
    flowLayout.minimumInteritemSpacing = 6;
    //头部的大小
    flowLayout.headerReferenceSize = CGSizeMake(0, 0);
    
    return flowLayout;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    CGFloat width = 0;
    // 为了解决大屏幕手机不能均匀分布分类按钮
    if ([UIScreen mainScreen].bounds.size.width > 320) {
        width = 13;
    }
    return UIEdgeInsetsMake(0, width, 0, 0);
}

#pragma mark - collectionView delegate

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma mark - 懒加载

- (UICollectionView *)categoryCollectionView {
    if (!_categoryCollectionView) {
        _categoryCollectionView = [[UICollectionView alloc] init];
        [_categoryCollectionView setFrame:CGRectMake(0, 0, self.bounds.size.width, kSectionHeaderViewHeigh)];
        
        NSBundle *bundle=[NSBundle mainBundle];
        UINib *categoryCollectionCellNib = [UINib nibWithNibName:@"HPCategoryCollectionCell" bundle:bundle];
        [_categoryCollectionView registerNib:categoryCollectionCellNib forCellWithReuseIdentifier:@"HPCategoryCollectionCell"];
        
        _categoryCollectionView.delegate = self;
        _categoryCollectionView.dataSource = self;
    }
    return _categoryCollectionView;
}

@end

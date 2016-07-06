//
//  HomePageDataSource.h
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/19.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HPQuestionCell;
@class HPTableViewCell;

/**
 *  设置cell的数据的block
 *
 *  @param cell tableviewCell
 *  @param item 数据模型
 */
typedef void (^ConfigureCell)(HPTableViewCell *cell, HPQuestionCell *item);

@interface HomePageDataSource : NSObject <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

/**
 *  数据模型数组
 */
@property (nonatomic, strong) NSArray *items;

/**
 *  初始化datasource
 *
 *  @param items              数据模型数组
 *  @param identifier         重用标志
 *  @param configureCellBlock 配置cell的block
 *
 *  @return self
 */
- (instancetype)initWithCellIdentifier:(NSString *)identifier configureCellBlock:(ConfigureCell)configureCellBlock;

@end

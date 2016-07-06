//
//  HPTableViewCell.h
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/17.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HPQuestionCell;
@class HPTableCollectionView;

@interface HPTableViewCell : UITableViewCell

@property (nonatomic, strong) HPQuestionCell *cellData;

/**
 *  图片的collectionView。需要在viewcontroller设置datasource和delegate
 */
@property (weak, nonatomic) IBOutlet HPTableCollectionView *collectionView;

/**
 *  正文label底部到集合视图的距离约束。当图片不存在的时候将其优先级Priority下降至250(LOW),动态约束
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentLableToBottom;

/**
 *  设置collection view的datasource和delegate。并且设置所属cell标记。
 *
 *  @param object datasource & delegate
 *  @param index  cell的标记
 */
- (void)setCollectionViewDataSourceDelegate:(id)object index:(NSInteger)index;

@end

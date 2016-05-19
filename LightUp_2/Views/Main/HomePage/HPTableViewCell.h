//
//  HPTableViewCell.h
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/17.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HPQuestionCell;

@interface HPTableViewCell : UITableViewCell

@property (nonatomic, strong) HPQuestionCell *cellData;

/**
 *  图片的collectionView。需要在viewcontroller设置datasource和delegate
 */
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

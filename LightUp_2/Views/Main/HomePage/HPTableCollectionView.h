//
//  HPTableCollectionView.h
//  LightUp_2
//
//  Created by 伍锦文 on 16/6/1.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPTableCollectionView : UICollectionView

/**
 *  记录collectionview属于哪个tableview cell
 */
@property (nonatomic) NSInteger index;

@end

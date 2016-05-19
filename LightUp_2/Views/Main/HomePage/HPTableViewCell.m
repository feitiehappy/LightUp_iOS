//
//  HPTableViewCell.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/17.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "HPTableViewCell.h"
#import "HPQuestionCell.h"

@interface HPTableViewCell()

/**
 *  正文label底部到集合视图的距离约束。当图片不存在的时候将其优先级Priority下降至250(LOW),动态约束
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentLableToCollectionView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *viewNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *questionStatusImageView;


@end

@implementation HPTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellData:(HPQuestionCell *)cellData {
    self.cellData = cellData;
    
}

@end

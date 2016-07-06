//
//  HPTableViewCell.m
//  LightUp_2
//
//  Created by 伍锦文 on 16/5/17.
//  Copyright © 2016年 伍锦文. All rights reserved.
//

#import "HPTableViewCell.h"
#import "HPQuestionCell.h"
#import "HPCategoryCollectionCell.h"
#import "HPTableCollectionView.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry/Masonry.h>

@interface HPTableViewCell()

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
    
    UINib *HPTableCollectionViewCellNib = [UINib nibWithNibName:@"HPTableCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:HPTableCollectionViewCellNib forCellWithReuseIdentifier:@"HPTableCollectionViewCell"];
}

#pragma mark - 懒加载

- (void)setCellData:(HPQuestionCell *)cellData {
    _cellData = cellData;
    
    [self.avatarImageView sd_setImageWithURL:self.cellData.avatarUrl placeholderImage:[UIImage imageNamed:@"default-avatar"]];
    self.titleLabel.text = self.cellData.title;
    self.contentLabel.text = self.cellData.contentText;
    self.viewNumLabel.text = self.cellData.viewNum;
    self.commentNumLabel.text = self.cellData.replyNum;
    self.timeLabel.text = [NSString stringWithFormat:@"%@", self.cellData.dateline];
    if ([self.cellData.questionStatus isEqualToString:@"1"]) {
        self.questionStatusImageView.hidden = YES;
    }

    
}

- (void)setCollectionViewDataSourceDelegate:(id)object index:(NSInteger)index {
    self.collectionView.dataSource = object;
    self.collectionView.delegate = object;
    self.collectionView.index = index;
}

@end

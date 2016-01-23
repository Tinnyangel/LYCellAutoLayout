//
//  Demo2Cell.h
//  LYCellAutoLayoutDemo-xib
//
//  Created by 李扬 on 16/1/23.
//  Copyright © 2016年 Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Demo2CellModel.h"

@interface Demo2Cell : UITableViewCell

// 数据模型
@property (nonatomic,strong) Demo2CellModel *cellModel;

// cell上的label
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
// cell上imageView的高度约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageViewHeight;
// cell上imageView的顶部与label的底部的距离
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageTopToLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end














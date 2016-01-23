//
//  Demo2Cell.m
//  LYCellAutoLayoutDemo-xib
//
//  Created by 李扬 on 16/1/23.
//  Copyright © 2016年 Gordon. All rights reserved.
//

#import "Demo2Cell.h"

@implementation Demo2Cell

//  类方法，返回cell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ReuseID = @"Demo2Cell";
    Demo2Cell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"Demo2Cell" owner:self options:nil] lastObject];
    }
    
    return cell;
}

// 通过重新setter方法，对cell中的内容赋值
- (void)setCellModel:(Demo2CellModel *)cellModel
{
    _cellModel = cellModel;
    self.cellLabel.text = cellModel.cellLabelText;
    self.imageViewHeight.constant = cellModel.imageViewHeight;
    self.imageTopToLabel.constant = cellModel.imageTopToLabel;
}

@end

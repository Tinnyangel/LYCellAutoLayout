//
//  Demo2CellModel.m
//  LYCellAutoLayoutDemo-xib
//
//  Created by 李扬 on 16/1/23.
//  Copyright © 2016年 Gordon. All rights reserved.
//

#import "Demo2CellModel.h"

@implementation Demo2CellModel

+ (NSArray *)modelWithData:(NSArray *)data
{
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i < data.count; i++) {
        // 创建模型
        Demo2CellModel *model = [[Demo2CellModel alloc] init];
        // 赋值
        model.cellLabelText = data[i][0];
        NSInteger includeImage = [data[i][1] integerValue];
        if (includeImage) {
            // 如果有图片，设置图片的高度,设置图片顶部与label的距离
            model.imageViewHeight = 100;
            model.imageTopToLabel = 10;
        } else {
            // 如果没有图片
            model.imageViewHeight = 0; // 图片不会显示
            model.imageTopToLabel = 0; // 调整label与cell底部的距离
        }
        [arrayM addObject:model];
    }
    return arrayM;
}

@end

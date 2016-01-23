//
//  Demo2CellModel.h
//  LYCellAutoLayoutDemo-xib
//
//  Created by 李扬 on 16/1/23.
//  Copyright © 2016年 Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Demo2CellModel : NSObject

// 行高缓存
@property (nonatomic,assign) CGFloat cellHeight;

// cell上的label内容
@property (nonatomic,copy) NSString *cellLabelText;
// cell上imageView的高度约束
@property (nonatomic,assign) CGFloat imageViewHeight;
// cell上imageView的顶部与label的底部的距离
@property (nonatomic,assign) CGFloat imageTopToLabel;

+ (NSArray *)modelWithData:(NSArray *)data;

@end

//
//  Demo1Cell.h
//  LYCellAutoLayoutDemo-xib
//
//  Created by 李扬 on 16/1/23.
//  Copyright © 2016年 Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Demo1Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellLabel;
// 创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

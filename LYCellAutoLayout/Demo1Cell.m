//
//  Demo1Cell.m
//  LYCellAutoLayoutDemo-xib
//
//  Created by 李扬 on 16/1/23.
//  Copyright © 2016年 Gordon. All rights reserved.
//

#import "Demo1Cell.h"

@interface Demo1Cell ()



@end

@implementation Demo1Cell

//  类方法，返回cell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ReuseID = @"Demo1Cell";
    Demo1Cell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"Demo1Cell" owner:self options:nil] lastObject];
    }
    
    return cell;
}


@end

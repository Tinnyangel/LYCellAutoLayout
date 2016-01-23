//
//  ViewController.m
//  LYCellAutoLayoutDemo-xib
//
//  Created by 李扬 on 16/1/23.
//  Copyright © 2016年 Gordon. All rights reserved.
//

#import "ViewController.h"
#import "Demo1TableViewController.h"
#import "Demo2TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LYCellDemo";
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

#pragma mark - UITableView dataSource and delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ReuseID = @"HomeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ReuseID];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Demo 1    UILable自动布局 行高自适应";
            break;
        case 1:
            cell.textLabel.text = @"Demo 2    评论页 UILabel and UIImage";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            Demo1TableViewController *demo1 = [[Demo1TableViewController alloc] init];
            demo1.title = @"Demo1";
            [self.navigationController pushViewController:demo1 animated:YES];
            break;
        }
        case 1:
        {
            Demo2TableViewController *demo2 = [[Demo2TableViewController alloc] init];
            demo2.title = @"Demo2";
            [self.navigationController pushViewController:demo2 animated:YES];
            break;
        }
        default:
            break;
    }
    

}

@end

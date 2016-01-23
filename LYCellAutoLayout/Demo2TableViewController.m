//
//  Demo2TableViewController.m
//  LYCellAutoLayoutDemo-xib
//
//  Created by 李扬 on 16/1/23.
//  Copyright © 2016年 Gordon. All rights reserved.
//

#import "Demo2TableViewController.h"
#import "Demo2CellModel.h"
#import "Demo2Cell.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width


@interface Demo2TableViewController ()

// 创建一个cell，用于计算行高时使用，节省内存
@property (nonatomic,strong) Demo2Cell *heightCell;

// cell数据
@property (nonatomic,strong) NSArray *cellData;
// cell的模型数据
@property (nonatomic,strong) NSArray *dataModel;

@end

@implementation Demo2TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableView dataSource and delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellData.count;
}
// 计算cell的高度  添加缓存到模型
// tips : 此次自动布局计算的行高，还有一部分内容在model的处理数据的方法中，
//        即通过处理数据对是否有图片的情况，更改相应的约束，具体见Demo2CellModel中
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
    
    Demo2CellModel *model = self.dataModel[indexPath.row];
    if (model.cellHeight != 0) {
        // 如果行高中有行高的缓存，直接返回缓存的行高。
        // 注意：当有reload** 等方法时，注意清除缓存的行高。
        height = model.cellHeight;
        return height;
    } else {
    
        // 1.给计算行高的cell赋值
        self.heightCell.cellModel = model;
        // 2.此属性写在懒加载中，放到此处为了便于说明,
        //   此属性很重要，具体说明见懒加载中。
        self.heightCell.cellLabel.preferredMaxLayoutWidth = SCREEN_W - 20;
        // 3.算法 "systemLayoutSizeFittingSize:" UIView的对象方法
        //   此方法将会自动布局，计算出一个合适的大小CGSize
        //   由于是cell的contentView，cell的高度需要加1
        height = [self.heightCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
        // 4.添加缓存到模型
        model.cellHeight = height;
        
        return height;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Demo2Cell *cell = [Demo2Cell cellWithTableView:tableView];
    // 给cell上的label赋值
    cell.cellModel = self.dataModel[indexPath.row];
    return cell;
}


#pragma mark - getters and setters
- (Demo2Cell *)heightCell
{
    if (_heightCell == nil) {
        _heightCell = [[[NSBundle mainBundle] loadNibNamed:@"Demo2Cell" owner:self options:nil] lastObject];
        /* 设置cell上label的preferredMaxLayoutWidth属性
         * 说明: 此属性告诉系统label的最大宽度是多少，当自动布局时，系统根据此属性来计
         算label的大小，我认为跟string的“boundingRectWithSize:CGSize”原
         理一样，需要自己指定最大的宽度。
         * 注意: 此属性必须设置，且必须设置正确！！！
         * 如何设置: 设置值如下，考虑到屏幕适配，需要用屏幕的宽度减去label距两边的长度
         如果指定了label的大小，直接设置其大小即可。
         */
        self.heightCell.cellLabel.preferredMaxLayoutWidth = SCREEN_W - 20;
    }
    return _heightCell;
}

- (NSArray *)dataModel
{
    if (_dataModel == nil) {
        _dataModel = [Demo2CellModel modelWithData:self.cellData];
    }
    return _dataModel;
}

- (NSArray *)cellData
{
    if (_cellData == nil) {
        _cellData = [NSArray arrayWithObjects:
                    @[@"最近，去年12月份做的终端用户满意度调研结果终于对外公布了",
                       @"1"],
                     @[@"终端用户NPS推荐意愿研究，则可以了解用户对终端产品愿意推荐关键因素及贬损者不推荐原因，对未来产品设计有极大的参考价值。在这里，并不想罗列报告的结论，而是想谈谈一些发现带来的感触。",
                       @"0"],
                     @[@"有人说用户难伺候，需求千奇百怪，最好是千元价格3000+的体验；有人说用户是傻瓜，哪懂什么是好的体验。",
                       @"1"],
                     @[@"调研发现，手机的外观设计、屏幕、操作便利性等指标满意度高居前，这个结果并不出意外:一来，现在手机的外观设计、屏幕大件从高到低趋同化，并且短期内难有质的差异化。当然我们期望有新的突破，那必将是革新式突破，目前看有赖于屏幕、电池新材料技术的商用",
                       @"0"],
                     @[@"最近，去年12月份做的终端用户满意度调研结果终于对外公布了",
                       @"1"],
                     @[@"终端用户NPS推荐意愿研究，则可以了解用户对终端产品愿意推荐关键因素及贬损者不推荐原因，对未来产品设计有极大的参考价值。在这里，并不想罗列报告的结论，而是想谈谈一些发现带来的感触。",
                       @"0"],
                     @[@"有人说用户难伺候，需求千奇百怪，最好是千元价格3000+的体验；有人说用户是傻瓜，哪懂什么是好的体验。",
                       @"1"],
                     @[@"调研发现，手机的外观设计、屏幕、操作便利性等指标满意度高居前，这个结果并不出意外:一来，现在手机的外观设计、屏幕大件从高到低趋同化，并且短期内难有质的差异化。当然我们期望有新的突破，那必将是革新式突破，目前看有赖于屏幕、电池新材料技术的商用",
                       @"0"],
                     nil];
    }
    return _cellData;
}

@end

//
//  Demo1.m
//  LYCellAutoLayoutDemo-xib
//
//  Created by 李扬 on 16/1/23.
//  Copyright © 2016年 Gordon. All rights reserved.
//

#import "Demo1TableViewController.h"
#import "Demo1Cell.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width

@interface Demo1TableViewController ()

// 创建一个cell，用于计算行高时使用，节省内存
@property (nonatomic,strong) Demo1Cell *heightCell;

// 用于显示的cell数据
@property (nonatomic,strong) NSArray *cellData;

@end

@implementation Demo1TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableView dataSource and delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellData.count;
}
// 计算cell的高度
// tips : 当要展示的cell较多时，最好添加缓存属性，建议添加到model中,由于Demo1内容较           少，暂不添加了，demo2中有用到。
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height;
    // 1.给计算行高的cell赋值
    self.heightCell.cellLabel.text = self.cellData[indexPath.row];
    
    // 2.此属性写在懒加载中，放到此处为了便于说明,
    //   此属性很重要，具体说明见懒加载中。
    self.heightCell.cellLabel.preferredMaxLayoutWidth = SCREEN_W - 20;
    
    // 3.算法 "systemLayoutSizeFittingSize:" UIView的对象方法
    //   此方法将会自动布局，计算出一个合适的大小CGSize
    //   由于是cell的contentView，cell的高度需要加1
    height = [self.heightCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
    
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Demo1Cell *cell = [Demo1Cell cellWithTableView:tableView];
    // 给cell上的label赋值
    cell.cellLabel.text = self.cellData[indexPath.row];
    return cell;
}


#pragma mark - getters and setters
- (Demo1Cell *)heightCell
{
    if (_heightCell == nil) {
        _heightCell = [[[NSBundle mainBundle] loadNibNamed:@"Demo1Cell" owner:self options:nil] lastObject];
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

- (NSArray *)cellData
{
    if (_cellData == nil) {
        _cellData = [NSArray arrayWithObjects:
             @"最近，去年12月份做的终端用户满意度调研结果终于对外公布了，结果自然是欢喜两三家，大多汗涔涔。从方法论与初衷而言，终端用户满意度研究，可获取用户对终端上市销售后的服务反馈",
             @"终端用户NPS推荐意愿研究，则可以了解用户对终端产品愿意推荐关键因素及贬损者不推荐原因，对未来产品设计有极大的参考价值。在这里，并不想罗列报告的结论，而是想谈谈一些发现带来的感触。",
             @"有人说用户难伺候，需求千奇百怪，最好是千元价格3000+的体验；有人说用户是傻瓜，哪懂什么是好的体验。确实，用户很难给出创新性需求，因为创新性需求往往是少数引领者先行进而教育更多消费者，但用户可以告诉你他们哪里用起来不爽，是哪些点让他们不愿意把所用的机器推荐给亲朋好友。如果说每一个厂商在用户心中都有一个信用账户，年底了做一下总结很有必要，一年之中推出的每一款产品是在增加粘性提高品牌力，还是在透支品牌力考验用户的忍耐度，直至被忍无可忍后抛弃。去挖掘那些抛弃自己更换品牌的用户的吐槽点才是厂家应该重点研究的目标，而不是听取锦上添花的赞歌。",
             @"调研发现，手机的外观设计、屏幕、操作便利性等指标满意度高居前，这个结果并不出意外:一来，现在手机的外观设计、屏幕大件从高到低趋同化，并且短期内难有质的差异化。当然我们期望有新的突破，那必将是革新式突破，目前看有赖于屏幕、电池新材料技术的商用；其二，安卓机型的ROM优化已进阶到一个平台期，不同厂家之间的UI操作便利性几乎没有“质”的差异（少数特别烂的除外，不要纠结于某些炫耀性的便利性设计，其实除了有些营销力外实际应用场景中实用性甚小），同时Android每升级一个版本将收割一批厂商的优化，从趋势上UI已经难成手机的核心差异点并产生溢价。从用户需求方看，对于互联网重度用户而言，手机自身UI重要性在下降，用户更加依赖于应用APP的UI。那，用户对手机最大的不满来有哪些呢？ 续航、运行速度、手机质量（硬件易损度和系统稳定性）几乎成为所有手机的通病，是用户不推荐自己所用手机原因中提及率最高的三项指标。如果说外观设计、屏幕乃至UI代表颜值的话，那么续航、运行速度与手机质量（硬件易损度与系统稳定性）就是手机的里子。对于消费电子品而言，颜值的重要性是勿容置疑的，但金玉其外败絮其中的做法，最终将会毁掉一个品牌。",
                     nil];
    }
    return _cellData;
}

@end

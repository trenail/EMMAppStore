//
//  EMMDetailTableViewController.m
//  EMMAppStore
//
//  Created by YanHui Lee on 2017/2/8.
//  Copyright © 2017年 GZYY. All rights reserved.
//

#import "EMMDetailTableViewController.h"
#import "EMMHistoryVersionTableViewController.h"

#define headerViewHeight 170

@interface EMMDetailTableViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end

@implementation EMMDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建UITableView
    [self setUpMyTableView];
}
#pragma mark - ********** 私有方法 **********
- (void)setUpMyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    // 设置偏移量
    [self.myTableView setContentInset:UIEdgeInsetsMake(headerViewHeight, 0, 0, 0)];
    // 头部的View
    [self setUpMyTableViewHeaderView];
    // 尾部的View
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 44)];
    UILabel *companyLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, ScreenW-60, 44)];
    companyLabel.text = @"腾讯科技有限公司";
    companyLabel.textColor = [UIColor grayColor];
    companyLabel.font = [UIFont systemFontOfSize:13];
    [footerView addSubview:companyLabel];
    self.myTableView.tableFooterView = footerView;
}

- (void)setUpMyTableViewHeaderView{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(8, 8, ScreenW, 300)];
    scrollView.pagingEnabled = YES;
    
    CGRect frame = CGRectMake(20, 0, 180, 280);
    CGFloat space = 15;
    for (int i = 0; i < 4; i++) {
        if (i != 0) {
            frame.origin.x = frame.origin.x + frame.size.width + space;
        }
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"img_yixin0%d", i+1]];
        [scrollView addSubview:imageView];
    }
    CGSize scrollViewFrame = CGSizeMake(frame.origin.x + frame.size.width, 280);
    scrollView.contentSize = scrollViewFrame;
    scrollView.showsHorizontalScrollIndicator = NO;
    
    self.myTableView.tableHeaderView = scrollView;
}

#pragma mark - ********** UITableView数据源和代理方法 **********
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"测试测试测试...";
    
    switch (indexPath.row) {
        case 3:
            cell.textLabel.text = @"版本记录";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
            
        case 4:
            cell.textLabel.text = @"开发人员其他App";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
//        default:
//            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 3:
            [self.navigationController pushViewController:[[EMMHistoryVersionTableViewController alloc] init] animated:YES];
            break;
            
        default:
            break;
    }
    
}

@end

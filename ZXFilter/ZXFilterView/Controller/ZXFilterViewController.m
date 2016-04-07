//
//  ZXFilterViewController.m
//  ZXFilter
//
//  Created by Xiang on 16/3/26.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "ZXFilterViewController.h"
#import "ZXFilterTag.h"
#import "ZXFilterTagCell.h"

static NSString *CELLFORTAGID = @"filterTagCellID";

@interface ZXFilterViewController ()<UITableViewDelegate, UITableViewDataSource, ZXCellButtonDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, strong) NSMutableArray *sectionString;
@end

@implementation ZXFilterViewController

- (NSMutableArray *)sectionString {
    if (!_sectionString) {
        _sectionString = [NSMutableArray arrayWithCapacity:_dataArr.count];
    }
    return _sectionString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.backgroundColor = [UIColor whiteColor];
    
    [self loadDataArr];
    
    _sectionString = [NSMutableArray arrayWithCapacity:_dataArr.count];
    for (int i = 0; i < _dataArr.count; i++) {
        NSString *tempStr = [[NSString alloc] init];
        tempStr = [NSString stringWithFormat:@""];
        [_sectionString addObject:tempStr];
    }
    
}

- (void)loadDataArr {
    if (_dataArr == nil) {
        // 解析本地JSON文件获取数据，生产环境中从网络获取JSON
        NSString *path = [[NSBundle mainBundle] pathForResource:@"buttons" ofType:@"json"];
        NSError *error = nil;
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data
                                                       options:NSJSONReadingAllowFragments
                                                         error:&error];

        _dataArr = arr;
        if (error) {
            NSLog(@"orders.json - fail: %@", error.description);
        }
    }
}

- (IBAction)resetButtonClicked {
    for (int i = 0; i < _dataArr.count; i++) {
        [_sectionString setObject:@"" atIndexedSubscript:i];
    }
    [_tableView reloadData];
}

- (IBAction)confirmButtonClicked {
    NSArray *array = [NSArray array];
    array = _sectionString;
    if (self.block) {
        self.block(array);
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        NSLog(@"未实现回调");
    }
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZXFilterTagCell * cell = [[ZXFilterTagCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELLFORTAGID];
    cell.delegate = self;
    cell.cellTitle = _sectionString[indexPath.section];
    cell.buttonArray = self.dataArr[indexPath.section][@"buttonArray"];
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - Table view delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *temArray = _dataArr[indexPath.section][@"buttonArray"];
    NSInteger total = temArray.count;
    NSInteger rows = (total / COLUMN) + ((total % COLUMN) > 0 ? 1 : 0);
    return  (float)ROWHEIHT * rows + ROWSPACE * (rows + 1);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 40)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, Screen_Width, 40)];
    [headerView addSubview:titleLabel];
    titleLabel.text = _dataArr[section][@"groupName"];
    titleLabel.font = [UIFont systemFontOfSize:18];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(20, 39, Screen_Width - 40, 1)];
    line.backgroundColor = [UIColor blackColor];
    line.alpha = 0.15;
    [headerView addSubview:line];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

#pragma mark - ZXFilterCellDelegate

- (void)didClickButtonInCell:(ZXFilterTagCell *)cell {
    // 获取cell的序号
    NSIndexPath *indexPath = [_tableView indexPathForCell:cell];
    // 更新_sectionString
    [_sectionString setObject:cell.cellTitle atIndexedSubscript:indexPath.section];
    
    [_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
}

@end

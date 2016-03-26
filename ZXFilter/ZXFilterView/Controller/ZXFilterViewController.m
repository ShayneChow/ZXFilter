//
//  ZXFilterViewController.m
//  ZXFilter
//
//  Created by Xiang on 16/3/26.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "ZXFilterViewController.h"

@interface ZXFilterViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ZXFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)resetButtonClicked {
    NSLog(@"重置");
}

- (IBAction)confirmButtonClicked {
    NSLog(@"确认");
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"other - %zd - %zd", indexPath.section, indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 先取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end

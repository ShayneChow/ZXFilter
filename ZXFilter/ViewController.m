//
//  ViewController.m
//  ZXFilter
//
//  Created by Xiang on 16/3/26.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "ViewController.h"
#import "ZXFilterViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showValueLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)filterButtonClicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ZXFilterViewController *filterVC = [storyboard instantiateViewControllerWithIdentifier:@"FilterViewController"];
    
    [self.navigationController pushViewController:filterVC animated:YES];
    
    filterVC.block = ^(NSArray *array){
        NSLog(@"%@",array);
        NSString *tempStr = [[NSString alloc] init];
        tempStr = @"";
        for (NSObject * object in array) {
            NSLog(@"数组对象:%@", object);
            tempStr = [NSString stringWithFormat:@"%@ %@",tempStr, object];
        }
        _showValueLabel.text = [NSString stringWithFormat:@"%@", tempStr];
    };
}

@end

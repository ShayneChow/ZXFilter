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
@property (copy, nonatomic) NSString *value;
@property (strong, nonatomic) NSMutableArray *valueArr;
@end

@implementation ViewController

- (NSMutableArray *)valueArr {
    if (!_valueArr) {
        _valueArr = [NSMutableArray arrayWithCapacity:4];
    }
    return _valueArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"valueArr : %@",_valueArr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)filterButtonClicked:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ZXFilterViewController *filterVC = [storyboard instantiateViewControllerWithIdentifier:@"FilterViewController"];
    if (_valueArr == nil) {
        filterVC.sectionString = [NSMutableArray arrayWithCapacity:4];
        for (int i = 0; i < 4; i++) {
            NSString *tempStr = [[NSString alloc] init];
            tempStr = [NSString stringWithFormat:@""];
            [filterVC.sectionString addObject:tempStr];
        }
    } else {
        filterVC.sectionString = _valueArr;
        NSLog(@"valueArr : %@",_valueArr);
    }
    
    [self.navigationController pushViewController:filterVC animated:YES];
    
    filterVC.block = ^(NSArray *array){
        //NSLog(@"%@",array);
        _valueArr = [NSMutableArray arrayWithArray:array];
        _value = [[NSString alloc] init];
        _value = @"";
        for (NSObject * object in array) {
            _value = [NSString stringWithFormat:@"%@ %@", _value, object];
        }
        _showValueLabel.text = [NSString stringWithFormat:@"%@", _value];
    };
}

@end

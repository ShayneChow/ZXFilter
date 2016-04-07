//
//  ZXFilterViewController.h
//  ZXFilter
//
//  Created by Xiang on 16/3/26.
//  Copyright © 2016年 周想. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^callBack)(NSArray *array);
@interface ZXFilterViewController : UIViewController
@property (nonatomic, copy) callBack block;
@end

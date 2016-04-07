//
//  ZXFilterTagCell.h
//  ZXFilter
//
//  Created by Xiang on 16/3/26.
//  Copyright © 2016年 周想. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIGestureRecognizer, ZXFilterTagCell;

@protocol ZXCellButtonDelegate <NSObject>

- (void)didClickButtonInCell:(ZXFilterTagCell *)cell;

@end

#define Screen_Width    ([UIScreen mainScreen].bounds.size.width)

#define Screen_Height   ([UIScreen mainScreen].bounds.size.height)

#define NAVIGATIONBARHEIGHT ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0 ? 44.0 : 64.0)

#define COLUMN 3

#define ROWHEIHT 30

#define ROWSPACE 20

#define ROWWIDTH  (Screen_Width - 4*ROWSPACE)/3

@interface ZXFilterTagCell : UITableViewCell

@property (copy, nonatomic) NSString *cellTitle;

@property (strong, nonatomic) NSArray *buttonArray;

@property (copy, nonatomic) NSString *buttonTitle;

@property (nonatomic, weak) id<ZXCellButtonDelegate> delegate;

@end

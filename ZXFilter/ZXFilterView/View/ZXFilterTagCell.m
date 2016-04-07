//
//  ZXFilterTagCell.m
//  ZXFilter
//
//  Created by Xiang on 16/3/26.
//  Copyright © 2016年 周想. All rights reserved.
//

#import "ZXFilterTagCell.h"

@implementation ZXFilterTagCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setButtonArray:(NSArray *)buttonArray {
    _buttonArray = buttonArray;
    NSInteger total = buttonArray.count;
    NSLog(@"%@", _cellTitle);
    for (int i = 0; i < total; i++) {
        int row = i / COLUMN;
        int column = i % COLUMN;
        UIButton *btn = [[UIButton alloc] init];
        
        btn.frame = CGRectMake(ROWSPACE + ROWWIDTH*column + ROWSPACE * column, ROWSPACE + (ROWHEIHT + ROWSPACE)*row, ROWWIDTH, ROWHEIHT);
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_normal_bg"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_selected_bg"] forState:UIControlStateSelected];
        [btn setTitle:buttonArray[i][@"title"] forState:UIControlStateNormal];
        [btn setTitle:buttonArray[i][@"title"] forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(subBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.cornerRadius = 5;
        btn.clipsToBounds = YES;
        
        if (btn.currentTitle == _cellTitle) {
            [btn setSelected:YES];
        } else {
            [btn setSelected:NO];
        }
        
        [self.contentView addSubview:btn];
    }
}

- (void)subBtnAction:(UIButton *)btn {
    
    _cellTitle = btn.currentTitle;
    [btn setSelected:YES];
    
    // 通知代理（调用代理的方法）
    // respondsToSelector:能判断某个对象是否实现了某个方法
    if ([self.delegate respondsToSelector:@selector(didClickButtonInCell:)]) {
        [self.delegate didClickButtonInCell:self];
    }
}

@end

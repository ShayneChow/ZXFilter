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
    for (int i = 0; i < total; i++) {
        int row = i / COLUMN;
        int column = i % COLUMN;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(ROWSPACE + ROWWIDTH*column + ROWSPACE * column, ROWSPACE + (ROWHEIHT + ROWSPACE)*row, ROWWIDTH, ROWHEIHT);
        btn.tag = i;
        btn.backgroundColor = [UIColor colorWithWhite:0.898 alpha:1.000];
        [btn setTitle:buttonArray[i][@"title"] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(subCateBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.cornerRadius = 5;
        btn.clipsToBounds = YES;
        [self.contentView addSubview:btn];
        
    }
}

-(void)subCateBtnAction:(UIButton *)btn {
    
    NSLog(@"点击 %@", btn);
}

@end

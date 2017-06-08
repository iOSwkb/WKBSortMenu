//
//  SelectedMenuButton.m
//  SelectedMenu
//
//  Created by 象萌cc002 on 2017/6/8.
//  Copyright © 2017年 象萌cc002. All rights reserved.
//

#import "SelectedMenuButton.h"

@implementation SelectedMenuButton

- (instancetype)initWithButtonType:(BOOL)isNormal
{
    if (self = [super init]) {
        if (isNormal == NO) {
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 20);
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 20, 0, -20);
        }
        self.titleLabel.font = [UIFont systemFontOfSize:10];
    }
    return self;
}
- (void)setStatus:(ButtonStatusType)status
{
    _status = status;
    switch (status) {
        case NotSelectedUp:
            [self setBackgroundColor:[UIColor whiteColor]];
            [self setTitleColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1] forState:UIControlStateNormal];
            [self setImage:[UIImage imageNamed:@"icon-up-unselect"] forState:UIControlStateNormal];
            break;
        case SelectedUp:
            [self setBackgroundColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self setImage:[UIImage imageNamed:@"icon-up-select"] forState:UIControlStateNormal];
            break;
        case NotSelectedDown:
            [self setBackgroundColor:[UIColor whiteColor]];
            [self setTitleColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1] forState:UIControlStateNormal];
            [self setImage:[UIImage imageNamed:@"icon-down-unselect"] forState:UIControlStateNormal];
            break;
        case SelectedDown:
            [self setBackgroundColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self setImage:[UIImage imageNamed:@"icon-down-select"] forState:UIControlStateNormal];
            break;
        case NotSelectedNormal:
            [self setBackgroundColor:[UIColor whiteColor]];
            [self setTitleColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1] forState:UIControlStateNormal];
            break;
        case SelectedNormal:
            [self setBackgroundColor:[UIColor colorWithRed:255/255.0 green:91/255.0 blue:91/255.0 alpha:1]];
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

@end

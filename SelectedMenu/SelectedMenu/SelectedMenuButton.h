//
//  SelectedMenuButton.h
//  SelectedMenu
//
//  Created by 象萌cc002 on 2017/6/8.
//  Copyright © 2017年 象萌cc002. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ButtonStatusType) {
    NotSelectedNormal = 0,
    SelectedNormal,
    NotSelectedDown,
    SelectedUp,
    SelectedDown,
    NotSelectedUp
};
@interface SelectedMenuButton : UIButton

@property (nonatomic, assign) ButtonStatusType status;
- (instancetype)initWithButtonType:(BOOL)isNormal;
@end
